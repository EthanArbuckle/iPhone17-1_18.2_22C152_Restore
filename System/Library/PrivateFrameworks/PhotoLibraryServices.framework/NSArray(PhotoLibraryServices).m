@interface NSArray(PhotoLibraryServices)
- (id)_pl_filter:()PhotoLibraryServices;
- (id)_pl_firstObjectPassingTest:()PhotoLibraryServices;
- (id)_pl_flatMap:()PhotoLibraryServices;
- (id)_pl_groupBy:()PhotoLibraryServices;
- (id)_pl_indexBy:()PhotoLibraryServices;
- (id)_pl_map:()PhotoLibraryServices;
- (id)_pl_prettyDescriptionWithIndent:()PhotoLibraryServices;
- (id)_pl_safeObjectAtIndex:()PhotoLibraryServices;
- (uint64_t)_pl_any:()PhotoLibraryServices;
@end

@implementation NSArray(PhotoLibraryServices)

- (id)_pl_filter:()PhotoLibraryServices
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__NSArray_PhotoLibraryServices___pl_filter___block_invoke;
  v9[3] = &unk_1E586FBD8;
  id v10 = v4;
  id v5 = v4;
  v6 = [a1 indexesOfObjectsPassingTest:v9];
  v7 = [a1 objectsAtIndexes:v6];

  return v7;
}

- (id)_pl_firstObjectPassingTest:()PhotoLibraryServices
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
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
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
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

- (id)_pl_map:()PhotoLibraryServices
{
  id v4 = a3;
  if ((unint64_t)[a1 count] > 0x80)
  {
    id v6 = v4;
    uint64_t v7 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v8 = a1;
    v9 = objc_msgSend([v7 alloc], "initWithCapacity:", objc_msgSend(v8, "count"));
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __PLArrayMapSlowPath_block_invoke;
    v14[3] = &unk_1E586FC00;
    id v16 = v6;
    id v10 = v9;
    id v15 = v10;
    id v11 = v6;
    [v8 enumerateObjectsUsingBlock:v14];

    long long v12 = v15;
    id v5 = v10;
  }
  else
  {
    PLArrayMapFastPath(a1, v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_pl_prettyDescriptionWithIndent:()PhotoLibraryServices
{
  if ([a1 count]) {
    pl_result_with_autoreleasepool();
  }
  else {
  v1 = PLEmptyContainerDescription();
  }
  return v1;
}

- (id)_pl_safeObjectAtIndex:()PhotoLibraryServices
{
  if ([a1 count] <= a3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [a1 objectAtIndexedSubscript:a3];
  }
  return v5;
}

- (id)_pl_indexBy:()PhotoLibraryServices
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
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
        long long v12 = v4[2](v4, v11);
        if (v12) {
          objc_msgSend(v5, "setObject:forKey:", v11, v12, (void)v14);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_pl_groupBy:()PhotoLibraryServices
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v12 = v4[2](v4, v11);
        if (v12)
        {
          objc_msgSend(v5, "objectForKey:", v12, (void)v15);
          id v13 = (id)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v5 setObject:v13 forKey:v12];
          }
          [v13 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)_pl_any:()PhotoLibraryServices
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_pl_flatMap:()PhotoLibraryServices
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__NSArray_PhotoLibraryServices___pl_flatMap___block_invoke;
  v11[3] = &unk_1E586FC00;
  id v6 = v5;
  id v12 = v6;
  id v13 = v4;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

@end