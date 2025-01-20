@interface NSDictionary(VK)
- (id)vk_dictionaryByAddingEntriesFromNonNilDictionary:()VK;
- (id)vk_md5;
- (id)vk_objectForNonNilKey:()VK;
- (id)vk_prettyDescriptionWithTabLevel:()VK;
@end

@implementation NSDictionary(VK)

- (id)vk_dictionaryByAddingEntriesFromNonNilDictionary:()VK
{
  id v4 = a1;
  if (a3)
  {
    id v5 = a3;
    v6 = (void *)[v4 mutableCopy];
    [v6 addEntriesFromDictionary:v5];
    uint64_t v7 = [v5 copy];

    id v4 = (id)v7;
  }
  return v4;
}

- (id)vk_prettyDescriptionWithTabLevel:()VK
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v5 appendString:@"{\n"];
  if (a3)
  {
    v6 = &stru_1F35566F8;
    uint64_t v7 = a3;
    do
    {
      v8 = [(__CFString *)v6 stringByAppendingString:@"\t"];

      v6 = v8;
      --v7;
    }
    while (v7);
  }
  else
  {
    v8 = &stru_1F35566F8;
  }
  v9 = [(__CFString *)v8 stringByAppendingString:@"\t"];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __53__NSDictionary_VK__vk_prettyDescriptionWithTabLevel___block_invoke;
  v18 = &unk_1E6BF3F90;
  id v10 = v5;
  id v19 = v10;
  v20 = v9;
  uint64_t v21 = a3;
  id v11 = v9;
  [a1 enumerateKeysAndObjectsUsingBlock:&v15];
  [v10 appendFormat:@"%@}", v8, v15, v16, v17, v18];
  v12 = v20;
  id v13 = v10;

  return v13;
}

- (id)vk_objectForNonNilKey:()VK
{
  if (a3)
  {
    id v4 = objc_msgSend(a1, "objectForKeyedSubscript:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)vk_md5
{
  v1 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1 requiringSecureCoding:0 error:0];
  v2 = objc_msgSend(v1, "vk_md5");

  return v2;
}

@end