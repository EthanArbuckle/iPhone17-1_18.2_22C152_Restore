@interface NSString(WLKAdditions)
- (id)wlk_stringByAppendingPathComponents:()WLKAdditions;
- (unint64_t)wlk_unsignedLongLongValue;
@end

@implementation NSString(WLKAdditions)

- (id)wlk_stringByAppendingPathComponents:()WLKAdditions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (wlk_stringByAppendingPathComponents__onceToken != -1) {
    dispatch_once(&wlk_stringByAppendingPathComponents__onceToken, &__block_literal_global_20);
  }
  id v5 = objc_alloc(MEMORY[0x1E4F28E78]);
  v6 = [a1 stringByTrimmingCharactersInSet:wlk_stringByAppendingPathComponents___slash];
  v7 = (void *)[v5 initWithString:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) stringByTrimmingCharactersInSet:wlk_stringByAppendingPathComponents___slash];
        [v7 appendFormat:@"/%@", v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  v14 = (void *)[v7 copy];

  return v14;
}

- (unint64_t)wlk_unsignedLongLongValue
{
  v1 = (const char *)[a1 UTF8String];

  return strtoull(v1, 0, 0);
}

@end