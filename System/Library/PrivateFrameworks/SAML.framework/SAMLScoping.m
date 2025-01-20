@interface SAMLScoping
+ (id)createElement:(id *)a3;
- (NSArray)idpList;
- (NSArray)requesterIds;
- (NSNumber)proxyCount;
- (NSString)getComplete;
- (void)addRequesterId:(id)a3;
@end

@implementation SAMLScoping

+ (id)createElement:(id *)a3
{
  v7[2] = *MEMORY[0x263EF8340];
  v3 = [(XMLWrapperElement *)[SAMLScoping alloc] initWithTagName:@"Scoping" error:a3];
  if (v3)
  {
    v7[0] = @"IDPList";
    v7[1] = @"RequesterID";
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
    [(XMLWrapperElement *)v3 setChildElementSequence:v4];

    v5 = SAMLProtocolNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v5];
  }
  return v3;
}

- (void)addRequesterId:(id)a3
{
  id v6 = a3;
  v4 = [[XMLWrapperElement alloc] initWithTagName:@"RequesterID" error:0];
  v5 = v4;
  if (v4)
  {
    [(XMLWrapperElement *)v4 setTextContent:v6];
    [(XMLWrapperElement *)self addChildElement:v5];
  }
}

- (NSNumber)proxyCount
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"ProxyCount"];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F08A30]);
    [v3 setNumberStyle:1];
    v4 = [v2 value];
    v5 = [v3 numberFromString:v4];
  }
  else
  {
    v5 = 0;
  }

  return (NSNumber *)v5;
}

- (NSArray)requesterIds
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(XMLWrapperElement *)self getElementsByTagName:@"RequesterID"];
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
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) textContent];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSString)getComplete
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"IDPList"];
  id v3 = v2;
  if (v2)
  {
    v4 = [v2 firstElementByTagName:@"GetComplete"];
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = [v4 textContent];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (NSString *)v6;
}

- (NSArray)idpList
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(XMLWrapperElement *)self firstElementByTagName:@"IDPList"];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 getElementsByTagName:@"IDPEntry"];
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

@end