@interface POWSTrustUsernameTokenType
+ (id)definition;
- (NSString)Id;
- (NSString)Password;
- (NSString)Username;
- (id)description;
- (void)setId:(id)a3;
- (void)setPassword:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation POWSTrustUsernameTokenType

+ (id)definition
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___POWSTrustUsernameTokenType;
  v2 = objc_msgSendSuper2(&v4, sel_definition);
  [v2 addAttributeWithName:@"Id" type:objc_opt_class() namespaceURI:@"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"];
  [v2 addElementWithName:@"Username" namespaceURI:@"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" type:objc_opt_class()];
  [v2 addElementWithName:@"Password" namespaceURI:@"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" type:objc_opt_class()];
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:self];
}

- (NSString)Id
{
  return self->_Id;
}

- (void)setId:(id)a3
{
}

- (NSString)Username
{
  return self->_Username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)Password
{
  return self->_Password;
}

- (void)setPassword:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Password, 0);
  objc_storeStrong((id *)&self->_Username, 0);
  objc_storeStrong((id *)&self->_Id, 0);
}

@end