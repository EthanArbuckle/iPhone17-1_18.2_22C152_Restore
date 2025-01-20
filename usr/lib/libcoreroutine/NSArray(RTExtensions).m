@interface NSArray(RTExtensions)
- (id)flatten;
- (id)shuffle;
@end

@implementation NSArray(RTExtensions)

- (id)flatten
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = (id)[a1 copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        v9 = objc_opt_class();
        if (objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class(), (void)v15))
        {
          v10 = [v8 flatten];
          [v2 addObjectsFromArray:v10];
LABEL_13:

          goto LABEL_14;
        }
        if (objc_opt_respondsToSelector())
        {
          v11 = [v8 allObjects];
LABEL_12:
          v10 = v11;
          v12 = [v11 flatten];
          [v2 addObjectsFromArray:v12];

          goto LABEL_13;
        }
        if (objc_opt_respondsToSelector())
        {
          v11 = [v8 allValues];
          goto LABEL_12;
        }
        [v2 addObject:v8];
LABEL_14:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v13 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v5 = v13;
    }
    while (v13);
  }

  return v2;
}

- (id)shuffle
{
  v1 = [MEMORY[0x1E4F1CA48] arrayWithArray:a1];
  unint64_t v2 = [v1 count];
  if (v2 >= 2)
  {
    do
    {
      unint64_t v3 = v2 - 1;
      [v1 exchangeObjectAtIndex:v2 - 1 withObjectAtIndex:arc4random_uniform(v2)];
      unint64_t v2 = v3;
    }
    while (v3 > 1);
  }

  return v1;
}

@end