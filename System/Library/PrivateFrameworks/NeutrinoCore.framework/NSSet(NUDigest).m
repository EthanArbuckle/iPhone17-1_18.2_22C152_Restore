@interface NSSet(NUDigest)
- (void)nu_updateDigest:()NUDigest;
@end

@implementation NSSet(NUDigest)

- (void)nu_updateDigest:()NUDigest
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(v4, "addCString:", "NSSet(");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = objc_msgSend(a1, "allObjects", 0);
  v6 = [v5 sortedArrayUsingSelector:sel_compare_];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10), "nu_updateDigest:", v4);
        [v4 addCString:","];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [v4 addCString:"]");
}

@end