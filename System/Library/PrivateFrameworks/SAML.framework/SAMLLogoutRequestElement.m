@interface SAMLLogoutRequestElement
+ (id)createElement:(id *)a3;
- (NSDate)issueInstant;
- (NSDate)notOnOrAfter;
- (NSString)consent;
- (NSString)destination;
- (NSString)identifier;
- (NSString)issuer;
- (NSString)reason;
- (NSString)sessionIndex;
- (SAMLNameId)nameId;
- (SAMLSignature)signature;
- (void)setDestination:(id)a3;
- (void)setIssuer:(id)a3;
- (void)setNotOnOrAfter:(id)a3;
- (void)setReason:(id)a3;
- (void)setSessionIndex:(id)a3;
@end

@implementation SAMLLogoutRequestElement

+ (id)createElement:(id *)a3
{
  v11[4] = *MEMORY[0x263EF8340];
  v3 = [(XMLWrapperElement *)[SAMLLogoutRequestElement alloc] initWithTagName:@"LogoutRequest" error:a3];
  if (v3)
  {
    v11[0] = @"Issuer";
    v11[1] = @"Signature";
    v11[2] = @"NameId";
    v11[3] = @"SessionIndex";
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];
    [(XMLWrapperElement *)v3 setChildElementSequence:v4];

    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];

    [(XMLWrapperElement *)v3 setAttributeWithName:@"ID" value:v6];
    [(XMLWrapperElement *)v3 setAttributeWithName:@"Version" value:@"2.0"];
    v7 = [MEMORY[0x263EFF910] date];
    v8 = SAMLStringFromDate(v7);
    [(XMLWrapperElement *)v3 setAttributeWithName:@"IssueInstant" value:v8];
    v9 = SAMLProtocolNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v9];
  }
  return v3;
}

- (NSString)identifier
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"ID"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 value];
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)destination
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Destination"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (void)setDestination:(id)a3
{
}

- (NSDate)issueInstant
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"IssueInstant"];
  v3 = [v2 value];
  v4 = SAMLDateFromString(v3);

  return (NSDate *)v4;
}

- (NSString)consent
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Consent"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)reason
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Reason"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (void)setReason:(id)a3
{
}

- (NSDate)notOnOrAfter
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"NotOnOrAfter"];
  v3 = [v2 value];
  v4 = SAMLDateFromString(v3);

  return (NSDate *)v4;
}

- (void)setNotOnOrAfter:(id)a3
{
  SAMLStringFromDate(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(XMLWrapperElement *)self setAttributeWithName:@"NotOnOrAfter" value:v4];
}

- (NSString)issuer
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"Issuer"];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 textContent];
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (void)setIssuer:(id)a3
{
  id v10 = a3;
  id v4 = [[XMLWrapperElement alloc] initWithTagName:@"Issuer" error:0];
  v5 = v4;
  if (v4)
  {
    [(XMLWrapperElement *)v4 setTextContent:v10];
    v6 = objc_alloc_init(XMLWrapperNamespace);
    [(XMLWrapperNamespace *)v6 setPrefix:@"saml"];
    [(XMLWrapperNamespace *)v6 setHref:@"urn:oasis:names:tc:SAML:2.0:assertion"];
    [(XMLWrapperElement *)v5 setNamespace:v6];
    v7 = [(XMLWrapperElement *)self firstElementByTagName:@"Issuer"];
    if (v7)
    {
      [(XMLWrapperElement *)self replaceChildElement:v7 newElement:v5];
    }
    else
    {
      v8 = [(XMLWrapperElement *)self elements];
      v9 = [v8 firstObject];
      [(XMLWrapperElement *)self addChildElement:v5 before:v9];
    }
  }
}

- (SAMLSignature)signature
{
  return (SAMLSignature *)[(XMLWrapperElement *)self firstElementByTagName:@"Signature"];
}

- (SAMLNameId)nameId
{
  return (SAMLNameId *)[(XMLWrapperElement *)self firstElementByTagName:@"NameId"];
}

- (NSString)sessionIndex
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"SessionIndex"];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 textContent];
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (void)setSessionIndex:(id)a3
{
  id v4 = a3;
  v6 = [[XMLWrapperElement alloc] initWithTagName:@"SessionIndex" error:0];
  [(XMLWrapperElement *)v6 setTextContent:v4];

  v5 = [(XMLWrapperElement *)self firstElementByTagName:@"SessionIndex"];
  if (v5) {
    [(XMLWrapperElement *)self replaceChildElement:v5 newElement:v6];
  }
  else {
    [(XMLWrapperElement *)self addChildElement:v6];
  }
}

@end