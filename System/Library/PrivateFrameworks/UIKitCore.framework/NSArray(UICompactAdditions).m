@interface NSArray(UICompactAdditions)
+ (void)ui_arrayByCompactingArray:()UICompactAdditions;
@end

@implementation NSArray(UICompactAdditions)

+ (void)ui_arrayByCompactingArray:()UICompactAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        if (v9 != [MEMORY[0x1E4F1CA98] null]) {
          [v4 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v4;
}

@end