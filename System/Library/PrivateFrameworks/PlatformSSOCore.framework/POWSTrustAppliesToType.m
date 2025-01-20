@interface POWSTrustAppliesToType
+ (id)definition;
- (POWSTrustEndpointReferenceType)EndpointReference;
- (id)description;
- (void)setEndpointReference:(id)a3;
@end

@implementation POWSTrustAppliesToType

+ (id)definition
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___POWSTrustAppliesToType;
  v2 = objc_msgSendSuper2(&v4, sel_definition);
  [v2 addNamespaceWithURI:@"http://schemas.xmlsoap.org/ws/2004/09/policy"];
  [v2 addElementWithName:@"EndpointReference" namespaceURI:@"http://www.w3.org/2005/08/addressing" type:objc_opt_class()];
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:self];
}

- (POWSTrustEndpointReferenceType)EndpointReference
{
  return self->_EndpointReference;
}

- (void)setEndpointReference:(id)a3
{
}

- (void).cxx_destruct
{
}

@end