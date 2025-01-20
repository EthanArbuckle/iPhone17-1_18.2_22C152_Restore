@interface SAMLAuthNStatement
+ (id)createElement:(id *)a3;
- (BOOL)isValid;
- (NSDate)authnInstant;
- (NSDate)sessionNotOnOrAfter;
- (NSString)authenticatingAuthority;
- (NSString)authnContextClassRef;
- (NSString)authnContextDecl;
- (NSString)authnContextDeclRef;
- (NSString)sessionIndex;
- (NSString)subjectAddress;
- (NSString)subjectDNSName;
@end

@implementation SAMLAuthNStatement

+ (id)createElement:(id *)a3
{
  v7[8] = *MEMORY[0x263EF8340];
  v3 = [(XMLWrapperElement *)[SAMLAuthNStatement alloc] initWithTagName:@"AuthnStatement" error:a3];
  if (v3)
  {
    v7[0] = @"Issuer";
    v7[1] = @"Signature";
    v7[2] = @"Subject";
    v7[3] = @"Conditions";
    v7[4] = @"Advice";
    v7[5] = @"AuthnStatement";
    v7[6] = @"AuthzDecisiontStatement";
    v7[7] = @"AttributeStatement";
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:8];
    [(XMLWrapperElement *)v3 setChildElementSequence:v4];

    v5 = SAMLAssertionNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v5];
  }
  return v3;
}

- (NSDate)authnInstant
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"AuthnInstant"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 value];
    v5 = SAMLDateFromString(v4);
  }
  else
  {
    v5 = 0;
  }

  return (NSDate *)v5;
}

- (NSString)sessionIndex
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"SessionIndex"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSDate)sessionNotOnOrAfter
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"SessionNotOnOrAfter"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 value];
    v5 = SAMLDateFromString(v4);
  }
  else
  {
    v5 = 0;
  }

  return (NSDate *)v5;
}

- (NSString)subjectAddress
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"SubjectLocality"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 attributeWithName:@"Address"];
    v5 = [v4 value];
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)subjectDNSName
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"SubjectLocality"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 attributeWithName:@"DNSName"];
    v5 = [v4 value];
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)authnContextDecl
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"AuthnContext"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 attributeWithName:@"AuthnContextDecl"];
    v5 = [v4 value];
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)authnContextDeclRef
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"AuthnContext"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 attributeWithName:@"AuthnContextDeclRef"];
    v5 = [v4 value];
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)authnContextClassRef
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"AuthnContext"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 attributeWithName:@"AuthnContextClassRef"];
    v5 = [v4 value];
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)authenticatingAuthority
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"AuthnContext"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 attributeWithName:@"AuthenticatingAuthority"];
    v5 = [v4 value];
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)isValid
{
  v3 = [MEMORY[0x263EFF910] date];
  v4 = [(SAMLAuthNStatement *)self sessionNotOnOrAfter];
  char v5 = objc_msgSend(v4, "vs_isAfter:", v3);

  return v5;
}

@end