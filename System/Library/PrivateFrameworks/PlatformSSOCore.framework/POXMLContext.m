@interface POXMLContext
- (POXMLContext)init;
- (_xmlDoc)xmldoc;
- (id)nameSpacePrefixForHref:(id)a3;
- (void)dealloc;
- (void)setXmldoc:(_xmlDoc *)a3;
@end

@implementation POXMLContext

- (POXMLContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)POXMLContext;
  result = [(POXMLContext *)&v3 init];
  if (result) {
    result->_xmldoc = 0;
  }
  return result;
}

- (void)dealloc
{
  if ([(POXMLContext *)self xmldoc]) {
    xmlFreeDoc([(POXMLContext *)self xmldoc]);
  }
  [(POXMLContext *)self setXmldoc:0];
  v3.receiver = self;
  v3.super_class = (Class)POXMLContext;
  [(POXMLContext *)&v3 dealloc];
}

- (id)nameSpacePrefixForHref:(id)a3
{
  id v4 = a3;
  RootElement = xmlDocGetRootElement([(POXMLContext *)self xmldoc]);
  if (RootElement)
  {
    xmlNsPtr v6 = xmlSearchNsByHref(-[POXMLContext xmldoc](self, "xmldoc"), RootElement, (const xmlChar *)[v4 UTF8String]);
    if (v6)
    {
      if (v6->prefix)
      {
        v7 = objc_msgSend(NSString, "stringWithUTF8String:");
        goto LABEL_7;
      }
      xmlFreeNs(v6);
    }
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (_xmlDoc)xmldoc
{
  return self->_xmldoc;
}

- (void)setXmldoc:(_xmlDoc *)a3
{
  self->_xmldoc = a3;
}

@end