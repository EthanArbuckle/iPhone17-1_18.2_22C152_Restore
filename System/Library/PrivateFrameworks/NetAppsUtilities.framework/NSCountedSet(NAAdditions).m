@interface NSCountedSet(NAAdditions)
- (id)na_mostCommonObject;
@end

@implementation NSCountedSet(NAAdditions)

- (id)na_mostCommonObject
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    v4 = 0;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v1);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unint64_t v9 = objc_msgSend(v1, "countForObject:", v8, (void)v13);
        if (v9 > v5)
        {
          unint64_t v10 = v9;
          id v11 = v8;

          v4 = v11;
          unint64_t v5 = v10;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end