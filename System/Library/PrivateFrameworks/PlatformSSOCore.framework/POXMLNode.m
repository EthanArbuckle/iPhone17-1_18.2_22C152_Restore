@interface POXMLNode
- (POXMLNode)init;
- (POXMLXPathResult)xpathResultSet;
- (_xmlNode)node;
- (id)content;
- (id)evaluateXPath:(id)a3;
- (id)parent;
- (id)rawXMLString;
- (id)valueForProperty:(id)a3;
- (void)setNode:(_xmlNode *)a3;
- (void)setXpathResultSet:(id)a3;
@end

@implementation POXMLNode

- (POXMLNode)init
{
  v3.receiver = self;
  v3.super_class = (Class)POXMLNode;
  result = [(POXMLNode *)&v3 init];
  if (result) {
    result->_node = 0;
  }
  return result;
}

- (id)evaluateXPath:(id)a3
{
  id v4 = a3;
  if ([(POXMLNode *)self node][8] != 1) {
    goto LABEL_7;
  }
  v5 = [(POXMLNode *)self node];
  v6 = (const xmlChar *)[v4 UTF8String];
  v7 = [(POXMLNode *)self xpathResultSet];
  v8 = [v7 xpathContext];
  xmlXPathObjectPtr v9 = xmlXPathNodeEval(v5, v6, (xmlXPathContextPtr)[v8 xpathCtx]);

  if (!v9) {
    goto LABEL_7;
  }
  xmlNodeSetPtr nodesetval = v9->nodesetval;
  if (nodesetval && nodesetval->nodeNr && nodesetval->nodeTab)
  {
    v11 = objc_alloc_init(POXMLXPathResult);
    [(POXMLXPathResult *)v11 setXpathObj:v9];
  }
  else
  {
LABEL_7:
    v11 = 0;
  }

  return v11;
}

- (id)parent
{
  if ((void)[(POXMLNode *)self node][40])
  {
    objc_super v3 = objc_alloc_init(POXMLNode);
    [(POXMLNode *)v3 setNode:(void)[(POXMLNode *)self node][40]];
    id v4 = [(POXMLNode *)self xpathResultSet];
    [(POXMLNode *)v3 setXpathResultSet:v4];
  }
  else
  {
    objc_super v3 = 0;
  }
  return v3;
}

- (id)valueForProperty:(id)a3
{
  id v4 = a3;
  v5 = [(POXMLNode *)self node];
  id v6 = v4;
  v7 = (const xmlChar *)[v6 UTF8String];

  Prop = xmlGetProp(v5, v7);
  if (Prop)
  {
    xmlXPathObjectPtr v9 = Prop;
    v10 = [NSString stringWithUTF8String:Prop];
    free(v9);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)content
{
  Content = xmlNodeGetContent([(POXMLNode *)self node]);
  objc_super v3 = [NSString stringWithUTF8String:Content];
  free(Content);
  return v3;
}

- (id)rawXMLString
{
  objc_super v3 = [(POXMLNode *)self xpathResultSet];
  id v4 = [v3 xpathContext];
  v5 = [v4 xmldocContext];

  id v6 = xmlBufferCreate();
  v7 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", v6->content, xmlNodeDump(v6, (xmlDocPtr)objc_msgSend(v5, "xmldoc"), -[POXMLNode node](self, "node"), 0, 0), 4);
  xmlBufferFree(v6);

  return v7;
}

- (_xmlNode)node
{
  return self->_node;
}

- (void)setNode:(_xmlNode *)a3
{
  self->_node = a3;
}

- (POXMLXPathResult)xpathResultSet
{
  return self->_xpathResultSet;
}

- (void)setXpathResultSet:(id)a3
{
}

- (void).cxx_destruct
{
}

@end