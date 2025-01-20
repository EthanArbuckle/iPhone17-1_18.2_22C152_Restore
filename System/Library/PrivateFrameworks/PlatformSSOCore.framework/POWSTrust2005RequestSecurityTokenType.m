@interface POWSTrust2005RequestSecurityTokenType
+ (id)definition;
- (NSString)KeyType;
- (NSString)RequestType;
- (POWSTrustAppliesToType)AppliesTo;
- (id)description;
- (void)setAppliesTo:(id)a3;
- (void)setKeyType:(id)a3;
- (void)setRequestType:(id)a3;
@end

@implementation POWSTrust2005RequestSecurityTokenType

+ (id)definition
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___POWSTrust2005RequestSecurityTokenType;
  v2 = objc_msgSendSuper2(&v4, sel_definition);
  [v2 addNamespaceWithURI:@"http://schemas.xmlsoap.org/ws/2005/02/trust"];
  [v2 addElementWithName:@"AppliesTo" namespaceURI:@"http://schemas.xmlsoap.org/ws/2004/09/policy" type:objc_opt_class()];
  [v2 addElementWithName:@"KeyType" namespaceURI:@"http://schemas.xmlsoap.org/ws/2005/02/trust" type:objc_opt_class()];
  [v2 addElementWithName:@"RequestType" namespaceURI:@"http://schemas.xmlsoap.org/ws/2005/02/trust" type:objc_opt_class()];
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:self];
}

- (NSString)KeyType
{
  return self->_KeyType;
}

- (void)setKeyType:(id)a3
{
}

- (NSString)RequestType
{
  return self->_RequestType;
}

- (void)setRequestType:(id)a3
{
}

- (POWSTrustAppliesToType)AppliesTo
{
  return self->_AppliesTo;
}

- (void)setAppliesTo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AppliesTo, 0);
  objc_storeStrong((id *)&self->_RequestType, 0);
  objc_storeStrong((id *)&self->_KeyType, 0);
}

@end