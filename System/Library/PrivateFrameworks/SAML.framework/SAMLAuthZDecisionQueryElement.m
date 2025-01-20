@interface SAMLAuthZDecisionQueryElement
+ (id)createElement:(id *)a3;
- (NSArray)actions;
- (NSDate)issueInstant;
- (NSString)channelId;
- (NSString)consent;
- (NSString)destination;
- (NSString)identifier;
- (NSString)resource;
- (SAMLEvidence)evidence;
- (SAMLSignature)signature;
- (SAMLSubject)subject;
- (void)addAction:(id)a3;
- (void)setChannelId:(id)a3;
- (void)setDestination:(id)a3;
- (void)setEvidence:(id)a3;
- (void)setResource:(id)a3;
@end

@implementation SAMLAuthZDecisionQueryElement

+ (id)createElement:(id *)a3
{
  v12[5] = *MEMORY[0x263EF8340];
  v3 = [(XMLWrapperElement *)[SAMLAuthZDecisionQueryElement alloc] initWithTagName:@"AuthzDecisionQuery" error:a3];
  if (v3)
  {
    v12[0] = @"Issuer";
    v12[1] = @"Signature";
    v12[2] = @"Subject";
    v12[3] = @"Action";
    v12[4] = @"Element";
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:5];
    [(XMLWrapperElement *)v3 setChildElementSequence:v4];

    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    v7 = [@"_" stringByAppendingString:v6];

    [(XMLWrapperElement *)v3 setAttributeWithName:@"ID" value:v7];
    [(XMLWrapperElement *)v3 setAttributeWithName:@"Version" value:@"2.0"];
    v8 = [MEMORY[0x263EFF910] date];
    v9 = SAMLStringFromDate(v8);
    [(XMLWrapperElement *)v3 setAttributeWithName:@"IssueInstant" value:v9];
    v10 = SAMLProtocolNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v10];
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

- (NSString)consent
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Consent"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)resource
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Resource"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (void)setResource:(id)a3
{
}

- (NSString)channelId
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"Issuer"];
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

- (void)setChannelId:(id)a3
{
  id v10 = a3;
  v4 = [[XMLWrapperElement alloc] initWithTagName:@"Issuer" error:0];
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

- (NSArray)actions
{
  return (NSArray *)[(XMLWrapperElement *)self getElementsByTagName:@"Action"];
}

- (void)addAction:(id)a3
{
  id v7 = a3;
  v4 = [[XMLWrapperElement alloc] initWithTagName:@"Action" error:0];
  v5 = v4;
  if (v4)
  {
    [(XMLWrapperElement *)v4 setTextContent:v7];
    v6 = [(XMLWrapperElement *)self firstElementByTagName:@"Element"];
    if (v6) {
      [(XMLWrapperElement *)self addChildElement:v5 before:v6];
    }
    else {
      [(XMLWrapperElement *)self addChildElement:v5];
    }
  }
}

- (SAMLEvidence)evidence
{
  return (SAMLEvidence *)[(XMLWrapperElement *)self firstElementByTagName:@"Element"];
}

- (void)setEvidence:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(XMLWrapperElement *)self firstElementByTagName:@"Element"];
  id v6 = (id)v5;
  if (v5) {
    [(XMLWrapperElement *)self replaceChildElement:v5 newElement:v4];
  }
  else {
    [(XMLWrapperElement *)self addChildElement:v4];
  }
}

@end