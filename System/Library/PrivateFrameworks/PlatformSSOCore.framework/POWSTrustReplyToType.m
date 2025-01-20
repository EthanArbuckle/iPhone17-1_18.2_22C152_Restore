@interface POWSTrustReplyToType
+ (id)definition;
- (NSString)Address;
- (id)description;
- (void)setAddress:(id)a3;
@end

@implementation POWSTrustReplyToType

+ (id)definition
{
  v2 = objc_opt_new();
  [v2 addElementWithName:@"Address" namespaceURI:@"http://www.w3.org/2005/08/addressing" type:objc_opt_class()];
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:self];
}

- (NSString)Address
{
  return self->_Address;
}

- (void)setAddress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end