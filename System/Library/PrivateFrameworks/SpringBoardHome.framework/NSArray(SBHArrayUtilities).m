@interface NSArray(SBHArrayUtilities)
- (BOOL)sbh_containsObjectInArray:()SBHArrayUtilities;
- (id)sbh_arrayByRemovingObjectsFromArray:()SBHArrayUtilities;
- (uint64_t)sbh_containsAllObjectsInArray:()SBHArrayUtilities;
@end

@implementation NSArray(SBHArrayUtilities)

- (BOOL)sbh_containsObjectInArray:()SBHArrayUtilities
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__NSArray_SBHArrayUtilities__sbh_containsObjectInArray___block_invoke;
  v4[3] = &unk_1E6AAE670;
  v4[4] = a1;
  return [a3 indexOfObjectPassingTest:v4] != 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)sbh_containsAllObjectsInArray:()SBHArrayUtilities
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [a1 count];
  if (v5 >= [v4 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          if (!objc_msgSend(a1, "containsObject:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13))
          {
            uint64_t v6 = 0;
            goto LABEL_13;
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    uint64_t v6 = 1;
LABEL_13:
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)sbh_arrayByRemovingObjectsFromArray:()SBHArrayUtilities
{
  id v4 = a3;
  unint64_t v5 = (void *)[a1 mutableCopy];
  [v5 removeObjectsInArray:v4];

  return v5;
}

@end