@interface NSOrderedSet(PKSetAdditions)
- (id)pk_anyObjectPassingTest:()PKSetAdditions;
- (uint64_t)pk_hasObjectPassingTest:()PKSetAdditions;
@end

@implementation NSOrderedSet(PKSetAdditions)

- (uint64_t)pk_hasObjectPassingTest:()PKSetAdditions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = a1;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          if (v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * i)))
          {
            uint64_t v6 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)pk_anyObjectPassingTest:()PKSetAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = a1;
    id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (v4[2](v4, v9))
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end