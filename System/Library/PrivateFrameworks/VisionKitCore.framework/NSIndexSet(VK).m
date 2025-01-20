@interface NSIndexSet(VK)
+ (id)vk_indexSetWithNSNumberIndex:()VK;
- (__CFString)vk_indexString;
- (id)vk_rangeArray;
@end

@implementation NSIndexSet(VK)

+ (id)vk_indexSetWithNSNumberIndex:()VK
{
  id v3 = a3;
  if (v3) {
    id v4 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIndex:", objc_msgSend(v3, "unsignedIntValue"));
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  }
  v5 = v4;

  return v5;
}

- (id)vk_rangeArray
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__NSIndexSet_VK__vk_rangeArray__block_invoke;
  v6[3] = &unk_1E6BF3CC8;
  id v7 = v2;
  id v3 = v2;
  [a1 enumerateRangesUsingBlock:v6];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (__CFString)vk_indexString
{
  uint64_t v2 = [a1 count];
  if (v2)
  {
    if (v2 == 1)
    {
      uint64_t v3 = [a1 firstIndex];
      objc_msgSend(NSString, "stringWithFormat:", @"[%ld]", v3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      [v5 appendString:@"["];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __32__NSIndexSet_VK__vk_indexString__block_invoke;
      v9[3] = &unk_1E6BF17B8;
      id v10 = v5;
      id v6 = v5;
      [a1 enumerateIndexesUsingBlock:v9];
      id v7 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@","];
      id v4 = [v6 stringByTrimmingCharactersInSet:v7];
    }
  }
  else
  {
    id v4 = @"[]";
  }
  return v4;
}

@end