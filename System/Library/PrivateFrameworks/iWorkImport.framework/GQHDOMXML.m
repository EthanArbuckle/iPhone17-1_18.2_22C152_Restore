@interface GQHDOMXML
- (GQHDOMXML)initWithHead;
- (__CFData)createHtml;
- (__CFData)createHtmlWithCss:(__CFString *)a3;
- (__CFData)createProgressiveHtml;
- (id)initEmpty;
- (void)addCharRef:(const char *)a3;
- (void)addXmlCharContent:(const char *)a3;
- (void)dealloc;
- (void)endElement;
- (void)removeStyleSheetLinkNodeAndAddStyle:(__CFString *)a3;
- (void)setAttribute:(const char *)a3 value:(const char *)a4;
- (void)startElement:(const char *)a3;
@end

@implementation GQHDOMXML

- (id)initEmpty
{
  v7.receiver = self;
  v7.super_class = (Class)GQHDOMXML;
  id v2 = [(GQHDOMXML *)&v7 init];
  if (v2)
  {
    v3 = htmlNewDoc(0, 0);
    *((void *)v2 + 1) = v3;
    v4 = (xmlNode *)xmlNewDtd(v3, (const xmlChar *)"html", (const xmlChar *)"-//W3C//DTD XHTML 1.0 Transitional//EN", (const xmlChar *)"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd");
    xmlAddChild(*((xmlNodePtr *)v2 + 1), v4);
    v5 = xmlNewNode(0, (const xmlChar *)"html");
    xmlDocSetRootElement(*((xmlDocPtr *)v2 + 1), v5);
    xmlNewNs(v5, (const xmlChar *)"http://www.w3.org/1999/xhtml", 0);
    *((void *)v2 + 2) = v5;
  }
  return v2;
}

- (GQHDOMXML)initWithHead
{
  id v2 = [(GQHDOMXML *)self initEmpty];
  if (v2)
  {
    v3 = xmlNewNode(0, (const xmlChar *)"head");
    v4 = xmlNewNode(0, (const xmlChar *)"meta");
    xmlSetProp(v4, (const xmlChar *)"http-equiv", (const xmlChar *)"Content-type");
    xmlSetProp(v4, (const xmlChar *)"content", (const xmlChar *)"text/html; charset=UTF-8");
    xmlAddChild(v3, v4);
    xmlAddChild(v2->mCurrentNode, v3);
    v2->mCurrentNode = v3;
  }
  return v2;
}

- (void)dealloc
{
  mXMLDoc = self->mXMLDoc;
  if (mXMLDoc)
  {
    xmlFreeDoc(mXMLDoc);
    self->mXMLDoc = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)GQHDOMXML;
  [(GQHDOMXML *)&v4 dealloc];
}

- (void)startElement:(const char *)a3
{
  objc_super v4 = xmlNewNode(0, (const xmlChar *)a3);
  self->mCurrentNode = xmlAddChild(self->mCurrentNode, v4);
}

- (void)endElement
{
  self->mCurrentNode = self->mCurrentNode->parent;
}

- (void)setAttribute:(const char *)a3 value:(const char *)a4
{
}

- (void)addXmlCharContent:(const char *)a3
{
  v5 = xmlNewText(0);
  v6 = xmlAddChild(self->mCurrentNode, v5);
  xmlNodeAddContent(v6, (const xmlChar *)a3);
}

- (void)addCharRef:(const char *)a3
{
  objc_super v4 = xmlNewCharRef(self->mXMLDoc, (const xmlChar *)a3);
  mCurrentNode = self->mCurrentNode;
  xmlAddChild(mCurrentNode, v4);
}

- (__CFData)createHtml
{
  return [(GQHDOMXML *)self createHtmlWithCss:0];
}

- (__CFData)createHtmlWithCss:(__CFString *)a3
{
  if (a3) {
    -[GQHDOMXML removeStyleSheetLinkNodeAndAddStyle:](self, "removeStyleSheetLinkNodeAndAddStyle:");
  }
  mem = 0;
  int size = 0;
  htmlDocDumpMemory(self->mXMLDoc, &mem, &size);
  if (size >= 1) {
    return CFDataCreateWithBytesNoCopy(0, mem, size, kCFAllocatorMalloc);
  }
  if (mem) {
    free(mem);
  }
  return 0;
}

- (__CFData)createProgressiveHtml
{
  return 0;
}

- (void)removeStyleSheetLinkNodeAndAddStyle:(__CFString *)a3
{
  if (a3)
  {
    if (CFStringGetLength(a3))
    {
      last = self->mXMLDoc->last;
      if (last)
      {
        do
        {
          if (xmlStrcmp(last->name, (const xmlChar *)"html")) {
            v6 = 0;
          }
          else {
            v6 = last;
          }
          last = last->prev;
          if (v6) {
            BOOL v7 = 1;
          }
          else {
            BOOL v7 = last == 0;
          }
        }
        while (!v7);
        if (v6)
        {
          v8 = v6->last;
          if (v8)
          {
            do
            {
              if (xmlStrcmp(v8->name, (const xmlChar *)"head")) {
                v9 = 0;
              }
              else {
                v9 = v8;
              }
              v8 = v8->prev;
              if (v9) {
                BOOL v10 = 1;
              }
              else {
                BOOL v10 = v8 == 0;
              }
            }
            while (!v10);
            if (v9)
            {
              v11 = v9->last;
              if (v11)
              {
                do
                {
                  if (xmlStrcmp(v11->name, (const xmlChar *)"link")) {
                    v12 = 0;
                  }
                  else {
                    v12 = v11;
                  }
                  v11 = v11->prev;
                  if (v12) {
                    BOOL v13 = 1;
                  }
                  else {
                    BOOL v13 = v11 == 0;
                  }
                }
                while (!v13);
                if (v12)
                {
                  xmlUnlinkNode(v12);
                  xmlFreeNode(v12);
                }
              }
              xmlNodePtr v14 = xmlNewNode(0, (const xmlChar *)"style");
              xmlSetProp(v14, (const xmlChar *)"type", (const xmlChar *)"text/css");
              mCurrentNode = self->mCurrentNode;
              self->mCurrentNode = v14;
              CFIndex Length = CFStringGetLength(a3);
              CFIndex v17 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
              v18 = (char *)malloc_type_malloc(v17, 0x100004077774924uLL);
              CFStringGetCString(a3, v18, v17, 0x8000100u);
              [(GQHDOMXML *)self addXmlCharContent:v18];
              free(v18);
              self->mCurrentNode = mCurrentNode;
              xmlAddChild(v9, v14);
            }
          }
        }
      }
    }
  }
}

@end