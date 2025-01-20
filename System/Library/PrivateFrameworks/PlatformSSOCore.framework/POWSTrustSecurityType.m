@interface POWSTrustSecurityType
+ (id)definition;
- (NSString)mustUnderstand;
- (POWSTrustTimestampType)Timestamp;
- (POWSTrustUsernameTokenType)UsernameToken;
- (id)description;
- (void)setMustUnderstand:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setUsernameToken:(id)a3;
@end

@implementation POWSTrustSecurityType

+ (id)definition
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___POWSTrustSecurityType;
  v2 = objc_msgSendSuper2(&v4, sel_definition);
  [v2 addNamespaceWithURI:@"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"];
  [v2 addElementWithName:@"UsernameToken" namespaceURI:@"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" type:objc_opt_class()];
  [v2 addElementWithName:@"Timestamp" namespaceURI:@"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd" type:objc_opt_class()];
  [v2 addAttributeWithName:@"mustUnderstand" type:objc_opt_class() namespaceURI:@"http://www.w3.org/2003/05/soap-envelope"];
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:self];
}

- (NSString)mustUnderstand
{
  return self->_mustUnderstand;
}

- (void)setMustUnderstand:(id)a3
{
}

- (POWSTrustUsernameTokenType)UsernameToken
{
  return self->_UsernameToken;
}

- (void)setUsernameToken:(id)a3
{
}

- (POWSTrustTimestampType)Timestamp
{
  return self->_Timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Timestamp, 0);
  objc_storeStrong((id *)&self->_UsernameToken, 0);
  objc_storeStrong((id *)&self->_mustUnderstand, 0);
}

@end