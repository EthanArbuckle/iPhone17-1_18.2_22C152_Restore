@interface NSArray(ShareSheet)
- (id)sh_allClassNames;
@end

@implementation NSArray(ShareSheet)

- (id)sh_allClassNames
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v8);
        objc_msgSend(v2, "addObject:", v9, v12);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  v10 = (void *)[v2 copy];
  return v10;
}

@end