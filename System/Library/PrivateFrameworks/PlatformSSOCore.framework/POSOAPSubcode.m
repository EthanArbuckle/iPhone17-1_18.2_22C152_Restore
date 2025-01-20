@interface POSOAPSubcode
+ (id)definition;
- (NSString)Value;
- (NSString)description;
- (void)setValue:(id)a3;
@end

@implementation POSOAPSubcode

+ (id)definition
{
  v2 = objc_opt_new();
  [v2 addNamespaceWithURI:@"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"];
  [v2 addElementWithName:@"Value" namespaceURI:@"http://www.w3.org/2003/05/soap-envelope" type:objc_opt_class()];
  return v2;
}

- (NSString)description
{
  return (NSString *)+[POXSComplexTypeDefinition descriptionForValue:self];
}

- (NSString)Value
{
  return self->_Value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end