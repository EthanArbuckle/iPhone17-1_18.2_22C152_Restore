@interface SAMLAttributeQueryElement
+ (id)createElement:(id *)a3;
- (NSArray)samlAttributes;
- (NSDate)issueInstant;
- (NSString)channelId;
- (NSString)consent;
- (NSString)destination;
- (NSString)identifier;
- (SAMLSignature)signature;
- (SAMLSubject)subject;
- (void)setChannelId:(id)a3;
- (void)setSubject:(id)a3;
@end

@implementation SAMLAttributeQueryElement

+ (id)createElement:(id *)a3
{
  v13[4] = *MEMORY[0x263EF8340];
  v3 = [(XMLWrapperElement *)[SAMLAttributeQueryElement alloc] initWithTagName:@"AttributeQuery" error:a3];
  if (v3)
  {
    v13[0] = @"Issuer";
    v13[1] = @"Signature";
    v13[2] = @"Subject";
    v13[3] = @"Attribute";
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:4];
    [(XMLWrapperElement *)v3 setChildElementSequence:v4];

    v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    v7 = [@"_" stringByAppendingString:v6];

    [(XMLWrapperElement *)v3 setAttributeWithName:@"ID" value:v7];
    [(XMLWrapperElement *)v3 setAttributeWithName:@"Version" value:@"2.0"];
    v8 = [MEMORY[0x263EFF910] date];
    v9 = SAMLStringFromDate(v8);
    [(XMLWrapperElement *)v3 setAttributeWithName:@"IssueInstant" value:v9];
    v10 = objc_alloc_init(XMLWrapperNamespace);
    [(XMLWrapperNamespace *)v10 setPrefix:@"samlp"];
    [(XMLWrapperNamespace *)v10 setHref:@"urn:oasis:names:tc:SAML:2.0:protocol"];
    [(XMLWrapperElement *)v3 setNamespace:v10];
    v11 = objc_alloc_init(XMLWrapperNamespace);
    [(XMLWrapperNamespace *)v11 setPrefix:@"saml"];
    [(XMLWrapperNamespace *)v11 setHref:@"urn:oasis:names:tc:SAML:2.0:assertion"];
    [(XMLWrapperElement *)v3 setNamespace:v11];
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

- (NSString)destination
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Decision"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)consent
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Consent"];
  v3 = [v2 value];

  return (NSString *)v3;
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

- (void)setSubject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(XMLWrapperElement *)self firstElementByTagName:@"Subject"];
  id v6 = (id)v5;
  if (v5) {
    [(XMLWrapperElement *)self replaceChildElement:v5 newElement:v4];
  }
  else {
    [(XMLWrapperElement *)self addChildElement:v4];
  }
}

- (NSArray)samlAttributes
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(XMLWrapperElement *)self getElementsByTagName:@"Attribute"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

@end