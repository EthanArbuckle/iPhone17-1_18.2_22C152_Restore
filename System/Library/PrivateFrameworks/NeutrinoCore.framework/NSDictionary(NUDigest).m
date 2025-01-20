@interface NSDictionary(NUDigest)
- (void)nu_updateDigest:()NUDigest;
@end

@implementation NSDictionary(NUDigest)

- (void)nu_updateDigest:()NUDigest
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 addString:@"NSDictionary{"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = objc_msgSend(a1, "allKeys", 0);
  v6 = [v5 sortedArrayUsingSelector:sel_compare_];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "nu_updateDigest:", v4);
        [v4 addCString:":"];
        v12 = [a1 objectForKeyedSubscript:v11];
        objc_msgSend(v12, "nu_updateDigest:", v4);

        [v4 addCString:","];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [v4 addString:@"}"];
}

@end