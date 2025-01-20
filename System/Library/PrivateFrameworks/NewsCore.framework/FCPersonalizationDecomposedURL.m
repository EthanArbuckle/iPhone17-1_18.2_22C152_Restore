@interface FCPersonalizationDecomposedURL
- (FCPersonalizationDecomposedURL)initWithURL:(id)a3;
- (FCPersonalizationDecomposedURL)initWithURLString:(id)a3;
- (NSArray)paths;
- (NSString)domain;
- (void)setDomain:(id)a3;
- (void)setPaths:(id)a3;
@end

@implementation FCPersonalizationDecomposedURL

- (FCPersonalizationDecomposedURL)initWithURL:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)FCPersonalizationDecomposedURL;
  v5 = [(FCPersonalizationDecomposedURL *)&v39 init];
  if (v5)
  {
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    char v38 = 0;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke;
    v34[3] = &unk_1E5B568F0;
    id v35 = v4;
    v36 = v37;
    v6 = __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke((uint64_t)v34);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke_2;
    v32[3] = &unk_1E5B4C2A0;
    id v7 = v6;
    id v33 = v7;
    v8 = __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke_2((uint64_t)v32);
    v9 = [v8 componentsSeparatedByString:@"."];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke_3;
    v30 = &unk_1E5B56918;
    id v10 = v8;
    id v31 = v10;
    if ([v10 hasSuffix:@".uk"])
    {
      uint64_t v11 = 3;
    }
    else if ([v31 hasSuffix:@".au"])
    {
      uint64_t v11 = 3;
    }
    else
    {
      uint64_t v11 = 2;
    }
    uint64_t v12 = [v9 count];
    v13 = objc_msgSend(v9, "fc_safeSubarrayWithCountFromFront:", (v12 & ~(v12 >> 63)) - v11);
    v14 = objc_msgSend(v9, "fc_safeSubarrayWithCountFromBack:", v11);
    uint64_t v15 = [v14 componentsJoinedByString:@"."];
    domain = v5->_domain;
    v5->_domain = (NSString *)v15;

    v17 = (void *)MEMORY[0x1E4F1C978];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke_4;
    v23[3] = &unk_1E5B56940;
    id v18 = v7;
    id v24 = v18;
    v26 = v37;
    id v19 = v13;
    id v25 = v19;
    uint64_t v20 = objc_msgSend(v17, "fc_array:", v23);
    paths = v5->_paths;
    v5->_paths = (NSArray *)v20;

    _Block_object_dispose(v37, 8);
  }

  return v5;
}

id __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) absoluteString];
  v3 = (void *)[v2 mutableCopy];

  if ([v3 hasSuffix:@"/"])
  {
    do
      objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 1, 1);
    while (([v3 hasSuffix:@"/"] & 1) != 0);
  }
  uint64_t v4 = [v3 rangeOfString:@"www.google.com/amp/s/"];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(v3, "deleteCharactersInRange:", v4, v5);
  }
  v6 = [MEMORY[0x1E4F1CB10] URLWithString:v3];

  return v6;
}

id __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) host];
  if (![v1 rangeOfString:@"www."])
  {
    uint64_t v3 = [v1 substringFromIndex:v2];

    v1 = (void *)v3;
  }
  return v1;
}

uint64_t __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasSuffix:@".uk"]) {
    return 3;
  }
  if ([*(id *)(a1 + 32) hasSuffix:@".au"]) {
    return 3;
  }
  return 2;
}

void __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke_4(uint64_t a1, void *a2)
{
  id v13 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) path];
  uint64_t v4 = [v3 componentsSeparatedByString:@"/"];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) && [v4 count])
  {
    uint64_t v5 = objc_msgSend(v4, "fc_subarrayFromIndex:inclusive:", 1, 1);

    uint64_t v4 = (void *)v5;
  }
  if ((unint64_t)[v4 count] >= 2)
  {
    v6 = objc_msgSend(v4, "fc_subarrayFromIndex:inclusive:", 0, 0);

    if ([v6 count] && objc_msgSend(v6, "count"))
    {
      uint64_t v7 = 0;
      unint64_t v8 = 0;
      do
      {
        v9 = objc_msgSend(v6, "fc_subarrayUpToIndex:inclusive:", objc_msgSend(v6, "count") + v7, 0);
        id v10 = [v9 componentsJoinedByString:@"/"];
        uint64_t v11 = [@"/" stringByAppendingString:v10];
        [v13 addObject:v11];

        ++v8;
        --v7;
      }
      while ([v6 count] > v8);
    }
    uint64_t v4 = v6;
  }
  uint64_t v12 = objc_msgSend(*(id *)(a1 + 40), "fc_arrayByTransformingWithBlock:", &__block_literal_global_100);
  [v13 addObjectsFromArray:v12];

  [v13 addObject:@"/"];
}

uint64_t __46__FCPersonalizationDecomposedURL_initWithURL___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [@"/" stringByAppendingString:a2];
}

- (FCPersonalizationDecomposedURL)initWithURLString:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1CB10] URLWithString:a3];
  uint64_t v5 = [(FCPersonalizationDecomposedURL *)self initWithURL:v4];

  return v5;
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSArray)paths
{
  return self->_paths;
}

- (void)setPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end