@interface GQHStreamedXML
- (GQHStreamedXML)initWithHead;
- (__CFData)createHtml;
- (__CFData)createHtmlWithCss:(__CFString *)a3;
- (__CFData)createProgressiveHtml;
- (char)popElementName;
- (const)peekElementName;
- (id)initEmpty;
- (void)addCharRef:(const char *)a3;
- (void)addXmlCharContent:(const char *)a3;
- (void)dealloc;
- (void)endElement;
- (void)pushElementName:(const char *)a3;
- (void)setAttribute:(const char *)a3 value:(const char *)a4;
- (void)startElement:(const char *)a3;
@end

@implementation GQHStreamedXML

- (id)initEmpty
{
  v6.receiver = self;
  v6.super_class = (Class)GQHStreamedXML;
  v2 = [(GQHStreamedXML *)&v6 init];
  if (v2)
  {
    v2->mXMLDoc = htmlNewDoc(0, 0);
    v2->mElementNameStack = CFArrayCreateMutable(0, 0, 0);
    CFMutableDataRef Mutable = CFDataCreateMutable(0, 0);
    v2->mData = Mutable;
    IO = xmlOutputBufferCreateIO((xmlOutputWriteCallback)sub_4CF98, 0, Mutable, 0);
    v2->mOutputBuffer = IO;
    xmlOutputBufferWriteString(IO, "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">");
    v2->mLastOp = 2;
    [(GQHStreamedXML *)v2 startElement:"html"];
    [(GQHStreamedXML *)v2 setAttribute:"xmlns" value:"http://www.w3.org/1999/xhtml"];
  }
  return v2;
}

- (GQHStreamedXML)initWithHead
{
  v2 = [(GQHStreamedXML *)self initEmpty];
  v3 = v2;
  if (v2)
  {
    [(GQHStreamedXML *)v2 startElement:"head"];
    [(GQHStreamedXML *)v3 startElement:"meta"];
    [(GQHStreamedXML *)v3 setAttribute:"http-equiv" value:"Content-type"];
    [(GQHStreamedXML *)v3 setAttribute:"content" value:"text/html; charset=UTF-8"];
    [(GQHStreamedXML *)v3 endElementWithExpectedName:"meta"];
  }
  return v3;
}

- (void)dealloc
{
  mElementNameStack = self->mElementNameStack;
  if (mElementNameStack)
  {
    CFIndex Count = CFArrayGetCount(mElementNameStack);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      for (CFIndex i = 0; i != v5; ++i)
      {
        xmlFreeFunc v7 = xmlFree;
        ValueAtIndex = CFArrayGetValueAtIndex(self->mElementNameStack, i);
        ((void (*)(const void *))v7)(ValueAtIndex);
      }
    }
    CFRelease(self->mElementNameStack);
    self->mElementNameStack = 0;
  }
  mOutputBuffer = self->mOutputBuffer;
  if (mOutputBuffer)
  {
    xmlOutputBufferClose(mOutputBuffer);
    self->mOutputBuffer = 0;
  }
  mData = self->mData;
  if (mData)
  {
    CFRelease(mData);
    self->mData = 0;
  }
  mXMLDoc = self->mXMLDoc;
  if (mXMLDoc)
  {
    xmlFreeDoc(mXMLDoc);
    self->mXMLDoc = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)GQHStreamedXML;
  [(GQHStreamedXML *)&v12 dealloc];
}

- (void)startElement:(const char *)a3
{
  if (!self->mLastOp) {
    xmlOutputBufferWriteString(self->mOutputBuffer, ">");
  }
  if (self->mNeedNewlineBeforeNextElement)
  {
    xmlOutputBufferWriteString(self->mOutputBuffer, "\n");
    self->mNeedNewlineBeforeNextElement = 0;
  }
  xmlOutputBufferWriteString(self->mOutputBuffer, "<");
  xmlOutputBufferWriteString(self->mOutputBuffer, a3);
  self->mLastOp = 0;
  [(GQHStreamedXML *)self pushElementName:a3];
}

- (void)endElement
{
  if (CFArrayGetCount(self->mElementNameStack))
  {
    v3 = [(GQHStreamedXML *)self popElementName];
    v4 = htmlTagLookup((const xmlChar *)v3);
    CFIndex v5 = v4;
    if (self->mLastOp)
    {
      objc_super v6 = "</";
    }
    else
    {
      if (v4
        && (v4->saveEndTag
         && xmlStrcmp((const xmlChar *)v4->name, (const xmlChar *)"html")
         && xmlStrcmp((const xmlChar *)v5->name, (const xmlChar *)"body")
         || v5->empty))
      {
        xmlOutputBufferWriteString(self->mOutputBuffer, ">");
        goto LABEL_12;
      }
      objc_super v6 = "></";
    }
    xmlOutputBufferWriteString(self->mOutputBuffer, v6);
    xmlOutputBufferWriteString(self->mOutputBuffer, v3);
    xmlOutputBufferWriteString(self->mOutputBuffer, ">");
    if (!v5)
    {
LABEL_13:
      xmlFree(v3);
      self->mLastOp = 2;
      return;
    }
LABEL_12:
    if (!v5->isinline)
    {
      xmlFreeFunc v7 = [(GQHStreamedXML *)self peekElementName];
      if (v7)
      {
        if (*v7 != 112) {
          self->mNeedNewlineBeforeNextElement = 1;
        }
      }
    }
    goto LABEL_13;
  }
}

- (void)setAttribute:(const char *)a3 value:(const char *)a4
{
  xmlOutputBufferWriteString(self->mOutputBuffer, " ");
  xmlOutputBufferWriteString(self->mOutputBuffer, a3);
  if (a4 && *a4)
  {
    xmlOutputBufferWriteString(self->mOutputBuffer, "=");
    if (xmlStrcasecmp((const xmlChar *)a3, (const xmlChar *)"href")
      && xmlStrcasecmp((const xmlChar *)a3, (const xmlChar *)"action")
      && xmlStrcasecmp((const xmlChar *)a3, (const xmlChar *)"src"))
    {
      buffer = (xmlBuffer *)self->mOutputBuffer->buffer;
LABEL_20:
      xmlBufferWriteQuotedString(buffer, (const xmlChar *)a4);
      return;
    }
    for (CFIndex i = a4; ; ++i)
    {
      unsigned int v10 = *(unsigned __int8 *)i;
      BOOL v11 = v10 > 0x20;
      uint64_t v12 = (1 << v10) & 0x100002600;
      if (v11 || v12 == 0) {
        break;
      }
    }
    v14 = xmlURIEscapeStr((const xmlChar *)i, (const xmlChar *)"@/:=?;#%&,+");
    buffer = (xmlBuffer *)self->mOutputBuffer->buffer;
    if (!v14) {
      goto LABEL_20;
    }
    xmlBufferWriteQuotedString(buffer, v14);
    xmlFreeFunc v15 = xmlFree;
    ((void (*)(xmlChar *))v15)(v14);
  }
  else
  {
    mOutputBuffer = self->mOutputBuffer;
    xmlOutputBufferWriteString(mOutputBuffer, "=\"\"");
  }
}

- (void)addXmlCharContent:(const char *)a3
{
  if (a3 && *a3)
  {
    if (self->mNeedNewlineBeforeNextElement) {
      self->mNeedNewlineBeforeNextElement = 0;
    }
    if (!self->mLastOp) {
      xmlOutputBufferWriteString(self->mOutputBuffer, ">");
    }
    CFIndex v5 = [(GQHStreamedXML *)self peekElementName];
    if (!v5
      || (objc_super v6 = (const xmlChar *)v5, xmlStrcasecmp((const xmlChar *)v5, (const xmlChar *)"script"))
      && xmlStrcasecmp(v6, (const xmlChar *)"style"))
    {
      xmlFreeFunc v7 = xmlEncodeEntitiesReentrant(self->mXMLDoc, (const xmlChar *)a3);
      if (v7)
      {
        v8 = v7;
        xmlOutputBufferWriteString(self->mOutputBuffer, (const char *)v7);
        xmlFree(v8);
      }
    }
    else
    {
      xmlOutputBufferWriteString(self->mOutputBuffer, a3);
    }
    self->mLastOp = 1;
  }
}

- (void)addCharRef:(const char *)a3
{
  if (a3 && *a3)
  {
    if (self->mNeedNewlineBeforeNextElement) {
      self->mNeedNewlineBeforeNextElement = 0;
    }
    if (!self->mLastOp) {
      xmlOutputBufferWriteString(self->mOutputBuffer, ">");
    }
    if (*a3 != 38) {
      xmlOutputBufferWriteString(self->mOutputBuffer, "&");
    }
    xmlOutputBufferWriteString(self->mOutputBuffer, a3);
    if (a3[xmlStrlen((const xmlChar *)a3) - 1] != 59) {
      xmlOutputBufferWriteString(self->mOutputBuffer, ";");
    }
    self->mLastOp = 1;
  }
}

- (__CFData)createHtmlWithCss:(__CFString *)a3
{
  return 0;
}

- (__CFData)createHtml
{
  v2 = self;
  while ([(GQHStreamedXML *)self peekElementName])
  {
    [(GQHStreamedXML *)v2 endElement];
    self = v2;
  }
  int v3 = xmlOutputBufferClose(v2->mOutputBuffer);
  v2->mOutputBuffer = 0;
  mData = v2->mData;
  if (v3 < 0)
  {
    CFRelease(mData);
    result = 0;
    v2->mData = 0;
  }
  else
  {
    CFRetain(mData);
    return v2->mData;
  }
  return result;
}

- (__CFData)createProgressiveHtml
{
  mData = self->mData;
  int v4 = xmlOutputBufferClose(self->mOutputBuffer);
  self->mOutputBuffer = 0;
  if (v4 < 0)
  {
    CFRelease(self->mData);
    self->mData = 0;
  }
  CFMutableDataRef Mutable = CFDataCreateMutable(0, 0);
  self->mData = Mutable;
  self->mOutputBuffer = xmlOutputBufferCreateIO((xmlOutputWriteCallback)sub_4CF98, 0, Mutable, 0);
  return mData;
}

- (void)pushElementName:(const char *)a3
{
  mElementNameStack = self->mElementNameStack;
  int v4 = xmlStrdup((const xmlChar *)a3);
  CFArrayAppendValue(mElementNameStack, v4);
}

- (char)popElementName
{
  CFIndex Count = CFArrayGetCount(self->mElementNameStack);
  CFIndex v4 = Count - 1;
  if (Count < 1) {
    return 0;
  }
  ValueAtIndex = (char *)CFArrayGetValueAtIndex(self->mElementNameStack, v4);
  CFArrayRemoveValueAtIndex(self->mElementNameStack, v4);
  return ValueAtIndex;
}

- (const)peekElementName
{
  CFIndex Count = CFArrayGetCount(self->mElementNameStack);
  CFIndex v4 = Count - 1;
  if (Count < 1) {
    return 0;
  }
  mElementNameStack = self->mElementNameStack;
  return (const char *)CFArrayGetValueAtIndex(mElementNameStack, v4);
}

@end