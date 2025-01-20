@interface NSRegularExpression(VK)
+ (id)vk_regexForSearchStrings:()VK;
- (id)vk_rangesForMatchesInString:()VK;
@end

@implementation NSRegularExpression(VK)

+ (id)vk_regexForSearchStrings:()VK
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    objc_msgSend(v4, "appendString:", @"(");
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [MEMORY[0x1E4F28FD8] escapedPatternForString:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          [v4 appendString:v10];

          [v4 appendString:@"|"];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    if ([v4 length]) {
      objc_msgSend(v4, "replaceCharactersInRange:withString:", objc_msgSend(v4, "length") - 1, 1, &stru_1F35566F8);
    }
    [v4 appendString:@""]);
    uint64_t v13 = 0;
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v4 options:1 error:&v13];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)vk_rangesForMatchesInString:()VK
{
  id v4 = a3;
  uint64_t v13 = 0;
  long long v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__25;
  long long v17 = __Block_byref_object_dispose__25;
  id v18 = 0;
  if ([v4 length])
  {
    uint64_t v5 = objc_msgSend(v4, "vk_range");
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__NSRegularExpression_VK__vk_rangesForMatchesInString___block_invoke;
    v12[3] = &unk_1E6BF3570;
    v12[4] = &v13;
    objc_msgSend(a1, "enumerateMatchesInString:options:range:usingBlock:", v4, 0, v5, v6, v12);
  }
  uint64_t v7 = [(id)v14[5] copy];
  uint64_t v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v7) {
    v9 = (void *)v7;
  }
  id v10 = v9;

  _Block_object_dispose(&v13, 8);
  return v10;
}

@end