@interface POWSTrust13RequestSecurityTokenResponseCollectionType
+ (id)definition;
- (NSArray)RequestSecurityTokenResponse;
- (id)description;
- (void)setRequestSecurityTokenResponse:(id)a3;
@end

@implementation POWSTrust13RequestSecurityTokenResponseCollectionType

+ (id)definition
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___POWSTrust13RequestSecurityTokenResponseCollectionType;
  v2 = objc_msgSendSuper2(&v4, sel_definition);
  [v2 addNamespaceWithURI:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512"];
  [v2 addUnboundedElementWithName:@"RequestSecurityTokenResponse" namespaceURI:@"http://docs.oasis-open.org/ws-sx/ws-trust/200512" type:objc_opt_class()];
  return v2;
}

- (id)description
{
  return +[POXSComplexTypeDefinition descriptionForValue:self];
}

- (NSArray)RequestSecurityTokenResponse
{
  return self->_RequestSecurityTokenResponse;
}

- (void)setRequestSecurityTokenResponse:(id)a3
{
}

- (void).cxx_destruct
{
}

@end