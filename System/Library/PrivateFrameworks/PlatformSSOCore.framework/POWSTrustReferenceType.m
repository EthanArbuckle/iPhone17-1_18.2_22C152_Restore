@interface POWSTrustReferenceType
+ (id)definition;
- (POWSTrustSecurityTokenReferenceType)SecurityTokenReference;
- (id)description;
- (void)setSecurityTokenReference:(id)a3;
@end

@implementation POWSTrustReferenceType

+ (id)definition
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___POWSTrustReferenceType;
  v2 = objc_msgSendSuper2(&v4, sel_definition);
  [v2 addElementWithName:@"SecurityTokenReference" namespaceURI:@"http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" type:objc_opt_class()];
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:self];
}

- (POWSTrustSecurityTokenReferenceType)SecurityTokenReference
{
  return self->_SecurityTokenReference;
}

- (void)setSecurityTokenReference:(id)a3
{
}

- (void).cxx_destruct
{
}

@end