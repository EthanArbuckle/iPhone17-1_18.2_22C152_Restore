@interface RBSXPCEncodeObjectForKey
@end

@implementation RBSXPCEncodeObjectForKey

void ___RBSXPCEncodeObjectForKey_block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 encodeWithRBSXPCCoder:v4];
  NSStringFromClass((Class)[*(id *)(a1 + 32) classForCoder]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  RBSSerializeStringToXPCDictionaryWithKey(v6, v5, "bsx_class");
}

void ___RBSXPCEncodeObjectForKey_block_invoke_3(uint64_t a1, void *a2)
{
  v3 = NSString;
  uint64_t v4 = ++_RBSXPCEncodeObjectForKey___counter;
  id v5 = a2;
  objc_msgSend(v3, "stringWithFormat:", @"%u", v4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  RBSSerializeStringToXPCDictionaryWithKey(v6, v5, "bsx_index");

  [*(id *)(*(void *)(a1 + 32) + 32) encodeObject:*(void *)(a1 + 40) forKey:v6];
}

void ___RBSXPCEncodeObjectForKey_block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    uint64_t v6 = *MEMORY[0x1E4F1C3C8];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = [*(id *)(a1 + 32) objectForKey:v8];
          _RBSXPCEncodeObjectForKey(*(void *)(a1 + 40), v9, v8);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", v6, @"Dictionary keys must be of type NSString", (void)v10);
        }
        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

@end