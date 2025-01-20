@interface SAMLSubject
+ (id)createElement:(id *)a3;
- (NSArray)subjectConfirmations;
- (SAMLNameId)nameId;
@end

@implementation SAMLSubject

+ (id)createElement:(id *)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  v3 = [(XMLWrapperElement *)[SAMLSubject alloc] initWithTagName:@"Subject" error:a3];
  if (v3)
  {
    v7[0] = @"NameId";
    v7[1] = @"SubjectConfirmation";
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
    [(XMLWrapperElement *)v3 setChildElementSequence:v4];

    v5 = SAMLAssertionNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v5];
  }
  return v3;
}

- (SAMLNameId)nameId
{
  return (SAMLNameId *)[(XMLWrapperElement *)self firstElementByTagName:@"NameId"];
}

- (NSArray)subjectConfirmations
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(XMLWrapperElement *)self getElementsByTagName:@"SubjectConfirmation"];
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