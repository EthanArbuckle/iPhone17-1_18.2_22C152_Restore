@interface POSOAPEnvelope
+ (id)definition;
- (NSArray)Body;
- (NSArray)Header;
- (NSString)description;
- (void)setBody:(id)a3;
- (void)setHeader:(id)a3;
@end

@implementation POSOAPEnvelope

+ (id)definition
{
  v2 = objc_opt_new();
  [v2 addNamespaceWithURI:@"http://www.w3.org/2003/05/soap-envelope"];
  [v2 addUnboundedElementWithName:@"Header" namespaceURI:@"http://www.w3.org/2003/05/soap-envelope" type:objc_opt_class()];
  [v2 addUnboundedElementWithName:@"Body" namespaceURI:@"http://www.w3.org/2003/05/soap-envelope" type:objc_opt_class()];
  [v2 addNamespaceWithURI:@"http://www.w3.org/2005/08/addressing"];
  [v2 addNamespaceWithURI:@"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"];
  return v2;
}

- (NSString)description
{
  return (NSString *)+[POXSComplexTypeDefinition descriptionForValue:self];
}

- (NSArray)Header
{
  return self->_Header;
}

- (void)setHeader:(id)a3
{
}

- (NSArray)Body
{
  return self->_Body;
}

- (void)setBody:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Body, 0);
  objc_storeStrong((id *)&self->_Header, 0);
}

@end