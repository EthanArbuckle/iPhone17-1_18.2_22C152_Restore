@interface XMLWrapperAttribute
- (BOOL)xmlAttrNodeForNode:(_xmlNode *)a3 error:(id *)a4;
- (NSString)name;
- (NSString)value;
- (XMLWrapperAttribute)initWithNode:(_xmlAttr *)a3 error:(id *)a4;
- (XMLWrapperNamespace)ns;
- (int)type;
- (void)setName:(id)a3;
- (void)setNs:(id)a3;
- (void)setType:(int)a3;
- (void)setValue:(id)a3;
@end

@implementation XMLWrapperAttribute

- (XMLWrapperAttribute)initWithNode:(_xmlAttr *)a3 error:(id *)a4
{
  v16.receiver = self;
  v16.super_class = (Class)XMLWrapperAttribute;
  v6 = [(XMLWrapperAttribute *)&v16 init];
  v7 = v6;
  if (v6)
  {
    v6->_attributeNode = a3;
    uint64_t v8 = [NSString stringWithUTF8String:a3->name];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_type = a3->atype;
    ns = a3->ns;
    if (ns)
    {
      v11 = [[XMLWrapperNamespace alloc] initWithNsNode:ns error:a4];
      if (v11) {
        [(XMLWrapperAttribute *)v7 setNs:v11];
      }
    }
    children = a3->children;
    if (children && children->type == XML_TEXT_NODE && children->content)
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithUTF8String:");
      value = v7->_value;
      v7->_value = (NSString *)v13;
    }
  }
  return v7;
}

- (BOOL)xmlAttrNodeForNode:(_xmlNode *)a3 error:(id *)a4
{
  v7 = [(XMLWrapperAttribute *)self value];

  if (v7)
  {
    id v8 = [(XMLWrapperAttribute *)self value];
    v7 = xmlCharStrdup((const char *)[v8 UTF8String]);
  }
  id v9 = [(XMLWrapperAttribute *)self name];
  v10 = xmlCharStrdup((const char *)[v9 UTF8String]);

  v11 = [(XMLWrapperAttribute *)self ns];

  if (v11)
  {
    v12 = [(XMLWrapperAttribute *)self ns];
    uint64_t v13 = (xmlNs *)[v12 xmlNsForNode:0 error:a4];

    xmlAttrPtr v14 = xmlNewNsProp(a3, v13, v10, (const xmlChar *)v7);
  }
  else
  {
    xmlAttrPtr v14 = xmlNewProp(a3, v10, (const xmlChar *)v7);
  }
  xmlAttrPtr v15 = v14;
  if (a4 && !v14)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"XMLWrapperErrorDomain" code:204 userInfo:0];
  }
  return v15 != 0;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (XMLWrapperNamespace)ns
{
  return self->_ns;
}

- (void)setNs:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ns, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end