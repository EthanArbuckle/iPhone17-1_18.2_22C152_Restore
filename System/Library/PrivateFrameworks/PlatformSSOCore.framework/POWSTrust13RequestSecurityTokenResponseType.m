@interface POWSTrust13RequestSecurityTokenResponseType
+ (id)definition;
- (NSString)KeyType;
- (NSString)RequestType;
- (NSString)TokenType;
- (POWSTrustAppliesToType)AppliesTo;
- (POWSTrustReferenceType)RequestedAttachedReference;
- (POWSTrustReferenceType)RequestedUnattachedReference;
- (POWSTrustRequestedSecurityTokenType)RequestedSecurityToken;
- (POWSTrustTimestampType)Lifetime;
- (id)description;
- (void)setAppliesTo:(id)a3;
- (void)setKeyType:(id)a3;
- (void)setLifetime:(id)a3;
- (void)setRequestType:(id)a3;
- (void)setRequestedAttachedReference:(id)a3;
- (void)setRequestedSecurityToken:(id)a3;
- (void)setRequestedUnattachedReference:(id)a3;
- (void)setTokenType:(id)a3;
@end

@implementation POWSTrust13RequestSecurityTokenResponseType

+ (id)definition
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___POWSTrust13RequestSecurityTokenResponseType;
  v2 = objc_msgSendSuper2(&v4, sel_definition);
  [v2 addNamespaceWithURI:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512"];
  [v2 addElementWithName:@"Lifetime" namespaceURI:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512" type:objc_opt_class()];
  [v2 addElementWithName:@"AppliesTo" namespaceURI:@"http://schemas.xmlsoap.org/ws/2004/09/policy" type:objc_opt_class()];
  [v2 addElementWithName:@"RequestedSecurityToken" namespaceURI:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512" type:objc_opt_class() maxOccurs:1 minOccurs:1];
  [v2 addElementWithName:@"RequestedAttachedReference" namespaceURI:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512" type:objc_opt_class()];
  [v2 addElementWithName:@"RequestedUnattachedReference" namespaceURI:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512" type:objc_opt_class()];
  [v2 addElementWithName:@"TokenType" namespaceURI:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512" type:objc_opt_class()];
  [v2 addElementWithName:@"RequestType" namespaceURI:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512" type:objc_opt_class()];
  [v2 addElementWithName:@"KeyType" namespaceURI:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512" type:objc_opt_class()];
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:self];
}

- (POWSTrustRequestedSecurityTokenType)RequestedSecurityToken
{
  return self->_RequestedSecurityToken;
}

- (void)setRequestedSecurityToken:(id)a3
{
}

- (POWSTrustTimestampType)Lifetime
{
  return self->_Lifetime;
}

- (void)setLifetime:(id)a3
{
}

- (POWSTrustAppliesToType)AppliesTo
{
  return self->_AppliesTo;
}

- (void)setAppliesTo:(id)a3
{
}

- (POWSTrustReferenceType)RequestedAttachedReference
{
  return self->_RequestedAttachedReference;
}

- (void)setRequestedAttachedReference:(id)a3
{
}

- (POWSTrustReferenceType)RequestedUnattachedReference
{
  return self->_RequestedUnattachedReference;
}

- (void)setRequestedUnattachedReference:(id)a3
{
}

- (NSString)TokenType
{
  return self->_TokenType;
}

- (void)setTokenType:(id)a3
{
}

- (NSString)RequestType
{
  return self->_RequestType;
}

- (void)setRequestType:(id)a3
{
}

- (NSString)KeyType
{
  return self->_KeyType;
}

- (void)setKeyType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_KeyType, 0);
  objc_storeStrong((id *)&self->_RequestType, 0);
  objc_storeStrong((id *)&self->_TokenType, 0);
  objc_storeStrong((id *)&self->_RequestedUnattachedReference, 0);
  objc_storeStrong((id *)&self->_RequestedAttachedReference, 0);
  objc_storeStrong((id *)&self->_AppliesTo, 0);
  objc_storeStrong((id *)&self->_Lifetime, 0);
  objc_storeStrong((id *)&self->_RequestedSecurityToken, 0);
}

@end