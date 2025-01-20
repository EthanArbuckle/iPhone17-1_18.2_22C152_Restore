@interface SAMLRequestedAuthNContext
+ (id)createElement:(id *)a3;
- (NSString)classRef;
- (NSString)comparison;
- (NSString)declRef;
@end

@implementation SAMLRequestedAuthNContext

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLRequestedAuthNContext alloc] initWithTagName:@"RequestedAuthnContext" error:a3];
  if (v3)
  {
    v4 = SAMLProtocolNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v4];
  }
  return v3;
}

- (NSString)comparison
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Comparison"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)classRef
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"saml:AuthnContextClassRef"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 textContent];
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)declRef
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"saml:AuthnContextDeclRef"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 textContent];
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

@end