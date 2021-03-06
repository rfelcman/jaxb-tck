/*
 * Copyright (c) 2002, 2018 Oracle and/or its affiliates. All rights reserved.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Eclipse Public License v. 2.0, which is available at
 * http://www.eclipse.org/legal/epl-2.0.
 *
 * This Source Code may also be made available under the following Secondary
 * Licenses when the conditions for such availability set forth in the
 * Eclipse Public License v. 2.0 are satisfied: GNU General Public License,
 * version 2 with the GNU Classpath Exception, which is available at
 * https://www.gnu.org/software/classpath/license.html.
 *
 * SPDX-License-Identifier: EPL-2.0 OR GPL-2.0 WITH Classpath-exception-2.0
 */

package com.sun.tgxml.tjtf.processors.taghandlers.impl;
import java.io.IOException;
import org.xml.sax.*;
import org.xml.sax.helpers.*;

import com.sun.tgxml.tjtf.resources.LibResHandler;
import com.sun.tgxml.tjtf.impl.TagsImpl;
import com.sun.tgxml.tjtf.processors.taghandlers.*;
import com.sun.tgxml.tjtf.api.exceptions.TestFileException;


 
/** 
 * SingletonTagHandler - The tag-handler abstraction. 
 * 
 * 
 * @version 	1.0, 10/02/00 
 * @author Kevin T. Looney 
 */ 
 
 
/* 
 * ============================================================================================ 
 *    AttrElem_TH 
 * ============================================================================================ 
 */ 
public class SingletonTagHandler extends TagHandlerImpl  {


   /* 
    * ============================================================================================ 
    *    Fields 
    * ============================================================================================ 
    */ 




   /* 
    * ============================================================================================ 
    *    Methods 
    * ============================================================================================ 
    */ 
 

    //------------------------------------------------------------------------------
    //  Constructors
    //------------------------------------------------------------------------------

   /** 
    *   SingletonTagHandler constructor - 
    *       Initialize our internal fields. 
    */ 
    public SingletonTagHandler() {
	super();
    }

 
    //------------------------------------------------------------------------------
    //  ParserHandlers
    //------------------------------------------------------------------------------



  /**
    *   In a singleton, there is no end tag.  So this implementation is final.
    *  <p>
    * @see #endTag
    */
    public final void endTag() throws SAXException {
    }
 
    //------------------------------------------------------------------------------
    //  EmitterHandlers
    //------------------------------------------------------------------------------
                   

  /**
    *   emit a tag (general function).
    *  <p>
    * @see #endTag
    */
    public void emit(Object tdObject) throws TestFileException, IOException {
	m_EmitterHandler.indent();
	emitStartTag(tdObject);
	m_EmitterHandler.newline();
    }

          

  /**
    *   emit a start tag (general function).
    *  <p>
    * @see #endTag
    */
    public void emitStartTag(Object tdObject) throws TestFileException, IOException {
	m_EmitterHandler.emitSingletonBeginTag(getTagName());
	emitAttributes(tdObject);
	m_EmitterHandler.emitSingletonEndTag();
    }
          

}
