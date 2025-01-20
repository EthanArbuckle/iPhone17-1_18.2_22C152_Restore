@interface SAMLSubjectConfirmation
+ (id)createElement:(id *)a3;
- (NSDate)notBefore;
- (NSDate)notOnOrAfter;
- (NSString)address;
- (NSString)inResponseTo;
- (NSString)method;
- (NSString)recipient;
- (SAMLNameId)nameId;
- (_xmlNode)xmlNode:(id *)a3;
@end

@implementation SAMLSubjectConfirmation

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLSubjectConfirmation alloc] initWithTagName:@"SubjectConfirmation" error:a3];
  if (v3)
  {
    v4 = SAMLAssertionNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v4];
  }
  return v3;
}

- (_xmlNode)xmlNode:(id *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263EFF980] array];
  v6 = [(XMLWrapperElement *)self firstElementByTagName:@"NameId"];
  if (v6) {
    [v5 addObject:v6];
  }
  v7 = [(XMLWrapperElement *)self firstElementByTagName:@"SubjectConfirmationData"];
  [v5 addObject:v7];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v8 = [(XMLWrapperElement *)self elements];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        [(XMLWrapperElement *)self removeChildElement:*(void *)(*((void *)&v25 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v13 = v5;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        [(XMLWrapperElement *)self addChildElement:*(void *)(*((void *)&v21 + 1) + 8 * v17++)];
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  v20.receiver = self;
  v20.super_class = (Class)SAMLSubjectConfirmation;
  v18 = [(XMLWrapperElement *)&v20 xmlNode:a3];

  return v18;
}

- (NSString)method
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Method"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (SAMLNameId)nameId
{
  return (SAMLNameId *)[(XMLWrapperElement *)self firstElementByTagName:@"NameId"];
}

- (NSDate)notBefore
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"SubjectConfirmationData"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 attributeWithName:@"NotBefore"];
    v5 = v4;
    if (v4)
    {
      v6 = [v4 value];
      v7 = SAMLDateFromString(v6);
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return (NSDate *)v7;
}

- (NSDate)notOnOrAfter
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"SubjectConfirmationData"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 attributeWithName:@"NotOnOrAfter"];
    v5 = v4;
    if (v4)
    {
      v6 = [v4 value];
      v7 = SAMLDateFromString(v6);
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return (NSDate *)v7;
}

- (NSString)recipient
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"SubjectConfirmationData"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 attributeWithName:@"Recipient"];
    v5 = [v4 value];
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)inResponseTo
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"SubjectConfirmationData"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 attributeWithName:@"InResponseTo"];
    v5 = [v4 value];
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSString)address
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"SubjectConfirmationData"];
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

@end