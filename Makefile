# For Makefiles, lines preceded with # are comment lines
# Remember, Makefiles are your friends. You do not want to be compiling
# files individually.
#
# Makefile for myInttion project
#
# Author: Arie
# Jan. 6, 2017
#

# some settings...
# use the gnu C++11 compiler
CCC=g++11
# list all warnings
CCFLAGS = -Wall -g -std=c++11 -lX11

# all is called a target, after the colon you have dependencies
# ie. "the target all is dependent on the executables
all : dieTest

# the target <excecutable1> is dependent on the list of dependencies
# the line following  is the required executable (don't need to adjust it)
# Note: executable lines, ie. $(CCC) ..., always begin with a tab.
# $^ = this target
# $@ = this/these dependencies
dieTest : die.o dieTest.o
	$(CCC) $(CCFLAGS) $^ -o $@

# if 2 or more problems in assignment, you can compile them all with extra 
# executable targets and dependencies.

# default rule compiling .cc to .o
# all .o file targets are dependent on the corresponding .cc files
# $< = the corresponding .cc file
%.o : %.cc
	$(CCC) -c $(CCFLAGS) $<

# Don't need next lines b/c of the above default rule but no harm including them
# In the following lines, make knows that the .cc file is required in the
# current dependency so you can leave it out.  You can also leave out the
# corresponding executable line
die.o : die.h
dieTest.o : die.h
clean:
	rm -f *.o *~ *% *# .#*

clean-all: clean
	rm -f dieTest
