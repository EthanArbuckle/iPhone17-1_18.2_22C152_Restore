@interface SAMLAuthNRequestElement
+ (id)createElement:(id *)a3;
- (BOOL)forceAuthN;
- (BOOL)isPassive;
- (NSDate)issueInstant;
- (NSString)consent;
- (NSString)destination;
- (NSString)identifier;
- (NSString)issuer;
- (NSString)providerName;
- (SAMLConditions)conditions;
- (SAMLNameIdPolicy)nameIdPolicy;
- (SAMLRequestedAuthNContext)context;
- (SAMLScoping)scoping;
- (SAMLSignature)signature;
- (SAMLSubject)subject;
- (void)setDestination:(id)a3;
- (void)setForceAuthN:(BOOL)a3;
- (void)setIsPassive:(BOOL)a3;
- (void)setIssuer:(id)a3;
- (void)setProviderName:(id)a3;
@end

@implementation SAMLAuthNRequestElement

+ (id)createElement:(id *)a3
{
  v14[7] = *MEMORY[0x263EF8340];
  v4 = [(XMLWrapperElement *)[SAMLAuthNRequestElement alloc] initWithTagName:@"AuthnRequest" error:a3];
  if (v4)
  {
    v14[0] = @"Issuer";
    v14[1] = @"Signature";
    v14[2] = @"Subject";
    v14[3] = @"NameIdPolicy";
    v14[4] = @"Conditions";
    v14[5] = @"RequestedAuthnContext";
    v14[6] = @"Scoping";
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:7];
    [(XMLWrapperElement *)v4 setChildElementSequence:v5];

    v6 = [MEMORY[0x263F08C38] UUID];
    v7 = [v6 UUIDString];
    v8 = [@"_" stringByAppendingString:v7];

    [(XMLWrapperElement *)v4 setAttributeWithName:@"ID" value:v8];
    [(XMLWrapperElement *)v4 setAttributeWithName:@"Version" value:@"2.0"];
    v9 = [MEMORY[0x263EFF910] date];
    v10 = SAMLStringFromDate(v9);
    [(XMLWrapperElement *)v4 setAttributeWithName:@"IssueInstant" value:v10];
    v11 = +[SAMLNameIdPolicy createElement:a3];
    [(XMLWrapperElement *)v4 addChildElement:v11];
    v12 = objc_alloc_init(XMLWrapperNamespace);
    [(XMLWrapperNamespace *)v12 setPrefix:@"samlp"];
    [(XMLWrapperNamespace *)v12 setHref:@"urn:oasis:names:tc:SAML:2.0:protocol"];
    [(XMLWrapperElement *)v4 setNamespace:v12];
  }
  return v4;
}

- (NSString)identifier
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"ID"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSDate)issueInstant
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"IssueInstant"];
  v3 = [v2 value];
  v4 = SAMLDateFromString(v3);

  return (NSDate *)v4;
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

- (NSString)consent
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Consent"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (BOOL)forceAuthN
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"ForceAuthn"];
  v3 = [v2 value];

  if (v3) {
    char v4 = [v3 isEqualToString:@"true"];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setForceAuthN:(BOOL)a3
{
  objc_msgSend(NSString, "vs_trueFalseStringValueFromBool:", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(XMLWrapperElement *)self setAttributeWithName:@"ForceAuthn" value:v4];
}

- (BOOL)isPassive
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"IsPassive"];
  v3 = [v2 value];

  if (v3) {
    char v4 = [v3 isEqualToString:@"true"];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setIsPassive:(BOOL)a3
{
  objc_msgSend(NSString, "vs_trueFalseStringValueFromBool:", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(XMLWrapperElement *)self setAttributeWithName:@"IsPassive" value:v4];
}

- (NSString)providerName
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"ProviderName"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (void)setProviderName:(id)a3
{
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

- (SAMLSubject)subject
{
  return (SAMLSubject *)[(XMLWrapperElement *)self firstElementByTagName:@"Subject"];
}

- (SAMLNameIdPolicy)nameIdPolicy
{
  return (SAMLNameIdPolicy *)[(XMLWrapperElement *)self firstElementByTagName:@"NameIdPolicy"];
}

- (SAMLConditions)conditions
{
  return (SAMLConditions *)[(XMLWrapperElement *)self firstElementByTagName:@"Conditions"];
}

- (SAMLRequestedAuthNContext)context
{
  return (SAMLRequestedAuthNContext *)[(XMLWrapperElement *)self firstElementByTagName:@"RequestedAuthnContext"];
}

- (SAMLScoping)scoping
{
  return (SAMLScoping *)[(XMLWrapperElement *)self firstElementByTagName:@"Scoping"];
}

@end