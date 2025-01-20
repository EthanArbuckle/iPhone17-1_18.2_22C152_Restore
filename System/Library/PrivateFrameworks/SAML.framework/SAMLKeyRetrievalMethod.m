@interface SAMLKeyRetrievalMethod
+ (id)createElement:(id *)a3;
- (NSArray)transforms;
- (NSString)type;
- (NSString)uri;
@end

@implementation SAMLKeyRetrievalMethod

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLKeyRetrievalMethod alloc] initWithTagName:@"RetrievalMethod" error:a3];
  return v3;
}

- (NSString)uri
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"URI"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)type
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"Type"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSArray)transforms
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(XMLWrapperElement *)self firstElementByTagName:@"Transforms"];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 getElementsByTagName:@"Transform"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) attributeWithName:@"Algorithm"];
          v12 = [v11 value];

          if (v12) {
            [v3 addObject:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  return (NSArray *)v3;
}

@end