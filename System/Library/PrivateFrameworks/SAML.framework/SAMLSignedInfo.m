@interface SAMLSignedInfo
+ (id)createElement:(id *)a3;
- (NSArray)references;
- (NSNumber)signatureMethodLength;
- (NSString)canonicalizationMethod;
- (NSString)identifier;
- (NSString)signatureMethod;
- (_xmlNode)xmlNode:(id *)a3;
@end

@implementation SAMLSignedInfo

+ (id)createElement:(id *)a3
{
  v3 = [(XMLWrapperElement *)[SAMLSignedInfo alloc] initWithTagName:@"SignedInfo" error:a3];
  if (v3)
  {
    v4 = SAMLSignatureNamespace();
    [(XMLWrapperElement *)v3 setNamespace:v4];
  }
  return v3;
}

- (_xmlNode)xmlNode:(id *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263EFF980] array];
  v6 = [(XMLWrapperElement *)self firstElementByTagName:@"CanonicalizationMethod"];
  [v5 addObject:v6];
  v7 = [(XMLWrapperElement *)self firstElementByTagName:@"SignatureMethod"];
  [v5 addObject:v7];
  v8 = [(XMLWrapperElement *)self getElementsByTagName:@"Reference"];
  [v5 addObjectsFromArray:v8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v9 = [(XMLWrapperElement *)self elements];
  v10 = (void *)[v9 copy];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        [(XMLWrapperElement *)self removeChildElement:*(void *)(*((void *)&v27 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v12);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v5;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        [(XMLWrapperElement *)self addChildElement:*(void *)(*((void *)&v23 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  v22.receiver = self;
  v22.super_class = (Class)SAMLSignedInfo;
  v20 = [(XMLWrapperElement *)&v22 xmlNode:a3];

  return v20;
}

- (NSString)identifier
{
  v2 = [(XMLWrapperElement *)self attributeWithName:@"ID"];
  v3 = [v2 value];

  return (NSString *)v3;
}

- (NSString)canonicalizationMethod
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"CanonicalizationMethod"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 attributeWithName:@"Algorithm"];
    v5 = [v4 value];
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSNumber)signatureMethodLength
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"SignatureMethod"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 firstElementByTagName:@"HMACOutputLength"];
    v5 = [v4 textContent];

    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263F08A30]);
      [v6 setNumberStyle:1];
      v7 = [v6 numberFromString:v5];
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

  return (NSNumber *)v7;
}

- (NSString)signatureMethod
{
  v2 = [(XMLWrapperElement *)self firstElementByTagName:@"SignatureMethod"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 attributeWithName:@"Algorithm"];
    v5 = [v4 value];
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSArray)references
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(XMLWrapperElement *)self getElementsByTagName:@"Reference"];
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