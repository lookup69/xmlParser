# * 
# ****************************************************************************
# * <P> XML.c - implementation file for basic XML parser written in ANSI C++ 
# * for portability.
# * It works by using recursion and a node tree for breaking down the elements
# * of an XML document.  </P>
# *
# * @version     V2.44
# *
# * @author      Frank Vanden Berghen
# *
# * Copyright (c) 2002, Frank Vanden Berghen - All rights reserved.
# * Commercialized by <a href="http://www.Business-Insight.com">Business-Insight</a>
# * See the file "AFPL-license.txt about the licensing terms
# * 
# ****************************************************************************
#
#makefile for the xmlParser library
#
all : xmlEasyTest xmlTest xmlTestUnicode

#GPP=/opt/intel/cc/9.1.039/bin/icpc
GPP=g++

xmlEasyTest : xmlParser.cpp xmlParser.h xmlTest.cpp
	$(GPP) -std=c++11 -g -Wall -DXML_NO_WIDE_CHAR -o xmlEasyTest \
                 xmlParser.cpp xmlTest.cpp
xmlTest : xmlParser.cpp xmlParser.h xmlTest.cpp
	$(GPP) -std=c++11 -g -Wall -o xmlTest \
                 xmlParser.cpp xmlTest.cpp
xmlTestUnicode : xmlParser.cpp xmlParser.h xmlTestUnicode.cpp
	$(GPP) -std=c++11 -g -Wall -D_UNICODE -DUNICODE -o xmlTestUnicode \
                 xmlParser.cpp xmlTestUnicode.cpp

clean:
	-@rm xmlEasyTest          >/dev/null 2>/dev/null
	-@rm xmlTest              >/dev/null 2>/dev/null
	-@rm xmlTestUnicode       >/dev/null 2>/dev/null
	-@rm test.xml             >/dev/null 2>/dev/null
	-@rm testUnicode.xml      >/dev/null 2>/dev/null
	-@rm outputTestUTF8.xml   >/dev/null 2>/dev/null
	-@rm *~                   >/dev/null 2>/dev/null
	@echo "Clean OK."
