@interface NSSet(SafariCoreExtras)
- (BOOL)safari_containsObjectPassingTest:()SafariCoreExtras;
- (id)safari_anyObjectPassingTest:()SafariCoreExtras;
- (id)safari_arrayByMappingObjectsUsingBlock:()SafariCoreExtras;
- (id)safari_dictionaryByMappingObjectsToValuesUsingBlock:()SafariCoreExtras;
- (id)safari_mapAndFilterObjectsUsingBlock:()SafariCoreExtras;
- (id)safari_setByRemovingObject:()SafariCoreExtras;
- (id)safari_smallestObject:()SafariCoreExtras;
- (id)safari_sortedArrayUsingFinderLikeSorting;
- (uint64_t)safari_allObjectsPassTest:()SafariCoreExtras;
- (uint64_t)safari_shortestURL;
@end

@implementation NSSet(SafariCoreExtras)

- (id)safari_mapAndFilterObjectsUsingBlock:()SafariCoreExtras
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if ([a1 count])
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(a1, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = a1;
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
          v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
          if (v11) {
            objc_msgSend(v5, "addObject:", v11, (void)v13);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v5;
}

- (id)safari_arrayByMappingObjectsUsingBlock:()SafariCoreExtras
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if ([a1 count])
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = a1;
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
          v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
          if (v11) {
            objc_msgSend(v5, "addObject:", v11, (void)v13);
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)safari_dictionaryByMappingObjectsToValuesUsingBlock:()SafariCoreExtras
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if ([a1 count])
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = a1;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v12 = v4[2](v4, v11);
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11, (void)v14);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v5;
}

- (id)safari_smallestObject:()SafariCoreExtras
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if ((unint64_t)[a1 count] > 1)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = a1;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v5 = 0;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (v5)
          {
            if (v4[2](v4, v5, *(void *)(*((void *)&v14 + 1) + 8 * i)) >= 1)
            {
              id v12 = v11;

              id v5 = v12;
            }
          }
          else
          {
            id v5 = v11;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = [a1 anyObject];
  }

  return v5;
}

- (id)safari_anyObjectPassingTest:()SafariCoreExtras
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
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
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v9))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)safari_containsObjectPassingTest:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "safari_anyObjectPassingTest:");
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)safari_allObjectsPassTest:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = [a1 allObjects];
  uint64_t v6 = objc_msgSend(v5, "safari_allObjectsPassTest:", v4);

  return v6;
}

- (uint64_t)safari_shortestURL
{
  return objc_msgSend(a1, "safari_smallestObject:", &__block_literal_global_28);
}

- (id)safari_setByRemovingObject:()SafariCoreExtras
{
  id v4 = a3;
  if ([a1 containsObject:v4])
  {
    id v5 = (void *)[a1 mutableCopy];
    [v5 removeObject:v4];
    id v6 = (id)[v5 copy];
  }
  else
  {
    id v6 = a1;
  }

  return v6;
}

- (id)safari_sortedArrayUsingFinderLikeSorting
{
  v6[1] = *MEMORY[0x1E4F143B8];
  BOOL v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1 selector:sel_localizedStandardCompare_];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  id v4 = [a1 sortedArrayUsingDescriptors:v3];

  return v4;
}

@end