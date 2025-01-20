@interface SAMLResponseElement
+ (id)createElement:(id *)a3;
- (BOOL)assertionMeetsConditions:(id *)a3;
- (NSArray)assertions;
- (NSDate)issueInstant;
- (NSString)consent;
- (NSString)destination;
- (NSString)identifier;
- (NSString)issuer;
- (NSString)relatedRequest;
- (SAMLSignature)signature;
- (SAMLStatus)status;
- (id)authnStatement;
@end

@implementation SAMLResponseElement

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLResponseElement alloc] initWithTagName:@"Response" error:a3];
  if (v3)
  {
    v4 = SAMLProtocolNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v4];
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

- (NSString)relatedRequest
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"InResponseTo"];
  v3 = [v2 value];

  return (NSString *)v3;
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

- (SAMLStatus)status
{
  return (SAMLStatus *)[(XMLWrapperElement *)self firstElementByTagName:@"Status"];
}

- (NSArray)assertions
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(XMLWrapperElement *)self getElementsByTagName:@"Assertion"];
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

- (BOOL)assertionMeetsConditions:(id *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(SAMLResponseElement *)self assertions];
  if ([v5 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [(SAMLResponseElement *)self assertions];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    id v8 = 0;
    if (v7)
    {
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        uint64_t v10 = 0;
        long long v11 = v8;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
          id v15 = v11;
          char v13 = [v12 meetsConditions:&v15];
          id v8 = v15;

          if (v13)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
          ++v10;
          long long v11 = v8;
        }
        while (v7 != v10);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    if (a3)
    {
      id v8 = v8;
      *a3 = v8;
    }
  }
  else
  {
    id v8 = 0;
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (id)authnStatement
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(SAMLResponseElement *)self assertions];
  v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        uint64_t v7 = [v6 authentication];

        if (v7)
        {
          v3 = [v6 authentication];
          goto LABEL_11;
        }
      }
      v3 = (void *)[v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

@end