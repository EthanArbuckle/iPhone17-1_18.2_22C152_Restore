@interface POWSTrustTimestampType
+ (id)definition;
- (NSDate)Created;
- (NSDate)Expires;
- (NSString)Id;
- (id)description;
- (void)setCreated:(id)a3;
- (void)setExpires:(id)a3;
- (void)setId:(id)a3;
@end

@implementation POWSTrustTimestampType

+ (id)definition
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___POWSTrustTimestampType;
  v2 = objc_msgSendSuper2(&v4, sel_definition);
  [v2 addAttributeWithName:@"Id" type:objc_opt_class() namespaceURI:@"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"];
  [v2 addElementWithName:@"Created" namespaceURI:@"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd" type:objc_opt_class()];
  [v2 addElementWithName:@"Expires" namespaceURI:@"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd" type:objc_opt_class()];
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

- (NSDate)Created
{
  return self->_Created;
}

- (void)setCreated:(id)a3
{
}

- (NSDate)Expires
{
  return self->_Expires;
}

- (void)setExpires:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_Expires, 0);
  objc_storeStrong((id *)&self->_Created, 0);
  objc_storeStrong((id *)&self->_Id, 0);
}

@end