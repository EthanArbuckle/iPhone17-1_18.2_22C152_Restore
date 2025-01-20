@interface SAMLConditions
+ (id)createElement:(id *)a3;
- (BOOL)assertionMeetsConditions:(id *)a3;
- (BOOL)oneTimeUse;
- (NSArray)audienceRestrictions;
- (NSArray)conditions;
- (NSArray)proxyRestrictions;
- (NSDate)notBefore;
- (NSDate)notOnOrAfter;
- (NSNumber)proxyRestrictionAudienceCount;
@end

@implementation SAMLConditions

+ (id)createElement:(id *)a3
{
  v7[3] = *MEMORY[0x263EF8340];
  v3 = [(XMLWrapperElement *)[SAMLConditions alloc] initWithTagName:@"Conditions" error:a3];
  if (v3)
  {
    v7[0] = @"Condition";
    v7[1] = @"AudienceRestriction";
    v7[2] = @"OneTimeUse";
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];
    [(XMLWrapperElement *)v3 setChildElementSequence:v4];

    v5 = SAMLAssertionNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v5];
  }
  return v3;
}

- (NSDate)notBefore
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"NotBefore"];
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

- (NSDate)notOnOrAfter
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"NotOnOrAfter"];
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

- (NSArray)audienceRestrictions
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(XMLWrapperElement *)self firstElementByTagName:@"AudienceRestriction"];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 getElementsByTagName:@"Audience"];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) textContent];
          if (v11) {
            [v3 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  return (NSArray *)v3;
}

- (BOOL)oneTimeUse
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"OneTimeUse"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSArray)proxyRestrictions
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"saml:ProxyRestriction"];
  BOOL v3 = v2;
  if (v2)
  {
    v4 = [v2 getElementsByTagName:@"Audience"];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) textContent];
          if (v9) {
            [0 addObject:v9];
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  return 0;
}

- (NSNumber)proxyRestrictionAudienceCount
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"saml:ProxyRestriction"];
  BOOL v3 = v2;
  if (v2)
  {
    v4 = [v2 attributeWithName:@"Count"];
    uint64_t v5 = [v4 value];

    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263F08A30]);
      [v6 setNumberStyle:1];
      uint64_t v7 = [v6 numberFromString:v5];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (NSNumber *)v7;
}

- (BOOL)assertionMeetsConditions:(id *)a3
{
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  id v6 = [(SAMLConditions *)self notBefore];
  uint64_t v7 = [(SAMLConditions *)self notOnOrAfter];
  if (v6 && (objc_msgSend(v5, "vs_isBefore:", v6) & 1) != 0 || v7 && (objc_msgSend(v5, "vs_isBefore:", v7) & 1) == 0)
  {
    if (a3)
    {
      SAMLParserErrorForErrorCode(401);
      BOOL v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (NSArray)conditions
{
  return self->_conditions;
}

- (void).cxx_destruct
{
}

@end