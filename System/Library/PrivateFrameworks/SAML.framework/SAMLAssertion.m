@interface SAMLAssertion
+ (id)createElement:(id *)a3;
- (BOOL)isValid:(id *)a3;
- (BOOL)isValidForRequestor:(id)a3;
- (BOOL)meetsConditions:(id *)a3;
- (NSArray)authorizations;
- (NSArray)samlAttributes;
- (NSDate)issueInstant;
- (NSString)identifier;
- (NSString)issuer;
- (SAMLAdvice)advice;
- (SAMLAuthNStatement)authentication;
- (SAMLConditions)conditions;
- (SAMLSignature)signature;
- (SAMLSubject)subject;
- (id)authorizationForResource:(id)a3;
@end

@implementation SAMLAssertion

+ (id)createElement:(id *)a3
{
  v7[8] = *MEMORY[0x263EF8340];
  v3 = [(XMLWrapperElement *)[SAMLAssertion alloc] initWithTagName:@"Assertion" error:a3];
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

- (NSString)issuer
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

- (SAMLSignature)signature
{
  return (SAMLSignature *)[(XMLWrapperElement *)self firstElementByTagName:@"Signature"];
}

- (SAMLSubject)subject
{
  return (SAMLSubject *)[(XMLWrapperElement *)self firstElementByTagName:@"Subject"];
}

- (SAMLConditions)conditions
{
  return (SAMLConditions *)[(XMLWrapperElement *)self firstElementByTagName:@"Conditions"];
}

- (SAMLAdvice)advice
{
  return (SAMLAdvice *)[(XMLWrapperElement *)self firstElementByTagName:@"Advice"];
}

- (NSArray)samlAttributes
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(XMLWrapperElement *)self firstElementByTagName:@"AttributeStatement"];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 getElementsByTagName:@"Attribute"];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [v3 addObject:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  return (NSArray *)v3;
}

- (SAMLAuthNStatement)authentication
{
  return (SAMLAuthNStatement *)[(XMLWrapperElement *)self firstElementByTagName:@"AuthnStatement"];
}

- (NSArray)authorizations
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(XMLWrapperElement *)self getElementsByTagName:@"AuthzDecisiontStatement"];
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

- (BOOL)isValid:(id *)a3
{
  uint64_t v5 = [(SAMLAssertion *)self signature];
  if (v5
    && (uint64_t v6 = (void *)v5,
        [(SAMLAssertion *)self signature],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isValid],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    if (a3)
    {
      SAMLParserErrorForErrorCode(500);
      BOOL v11 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v9 = [(SAMLAssertion *)self authentication];
    long long v10 = v9;
    if (v9 && ([v9 isValid] & 1) == 0)
    {
      if (a3)
      {
        SAMLParserErrorForErrorCode(401);
        BOOL v11 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  return v11;
}

- (BOOL)meetsConditions:(id *)a3
{
  v4 = [(SAMLAssertion *)self conditions];
  LOBYTE(a3) = [v4 assertionMeetsConditions:a3];

  return (char)a3;
}

- (BOOL)isValidForRequestor:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(SAMLAssertion *)self conditions];
  uint64_t v6 = [v5 audienceRestrictions];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        v9 |= [*(id *)(*((void *)&v13 + 1) + 8 * i) isEqualToString:v4];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9 & 1;
}

- (id)authorizationForResource:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(SAMLAssertion *)self authorizations];
  uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 resource];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          uint64_t v6 = [v9 decision];
          goto LABEL_11;
        }
      }
      uint64_t v6 = (void *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

@end