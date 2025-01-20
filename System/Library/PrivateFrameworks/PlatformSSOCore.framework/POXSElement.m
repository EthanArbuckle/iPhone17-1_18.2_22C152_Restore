@interface POXSElement
- (Class)type;
- (NSString)elementName;
- (NSString)namespaceURI;
- (POXSElement)init;
- (POXSElement)initWithElementName:(id)a3 namespaceURI:(id)a4 type:(Class)a5;
@end

@implementation POXSElement

- (POXSElement)initWithElementName:(id)a3 namespaceURI:(id)a4 type:(Class)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)POXSElement;
  v11 = [(POXSElement *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_elementName, a3);
    objc_storeStrong((id *)&v12->_namespaceURI, a4);
    objc_storeStrong((id *)&v12->_type, a5);
  }

  return v12;
}

- (POXSElement)init
{
  return 0;
}

- (NSString)elementName
{
  return self->_elementName;
}

- (NSString)namespaceURI
{
  return self->_namespaceURI;
}

- (Class)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_namespaceURI, 0);
  objc_storeStrong((id *)&self->_elementName, 0);
}

@end