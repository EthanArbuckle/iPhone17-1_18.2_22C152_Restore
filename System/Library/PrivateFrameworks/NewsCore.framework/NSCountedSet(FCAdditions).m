@interface NSCountedSet(FCAdditions)
- (id)fc_description;
@end

@implementation NSCountedSet(FCAdditions)

- (id)fc_description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [a1 allObjects];
  uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v8 = NSString;
        v9 = [v7 description];
        v10 = [v8 stringWithFormat:@"%@ (%lu) \n", v9, objc_msgSend(a1, "countForObject:", v7)];
        [v2 appendString:v10];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  return v2;
}

@end