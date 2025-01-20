@interface NSArray(PKArrayAdditions)
- (BOOL)pk_containsObjectPassingTest:()PKArrayAdditions;
- (id)pk_arrayByApplyingBlock:()PKArrayAdditions;
- (id)pk_arrayByRemovingObject:()PKArrayAdditions;
- (id)pk_arrayByRemovingObjectsInArray:()PKArrayAdditions;
- (id)pk_arrayBySafelyApplyingBlock:()PKArrayAdditions;
- (id)pk_createMutableOrderedSetByApplyingBlock:()PKArrayAdditions;
- (id)pk_createMutableSetByApplyingBlock:()PKArrayAdditions;
- (id)pk_createOrderedSetByApplyingBlock:()PKArrayAdditions;
- (id)pk_createSetByApplyingBlock:()PKArrayAdditions;
- (id)pk_firstObjectPassingTest:()PKArrayAdditions;
- (id)pk_groupDictionaryByApplyingBlock:()PKArrayAdditions;
- (id)pk_indexDictionaryByApplyingBlock:()PKArrayAdditions;
- (id)pk_intersectArray:()PKArrayAdditions;
- (id)pk_lastObjectPassingTest:()PKArrayAdditions;
- (id)pk_objectsPassingTest:()PKArrayAdditions;
- (id)pk_shuffledArray;
- (uint64_t)pk_countObjectsPassingTest:()PKArrayAdditions;
- (uint64_t)pk_createArrayByApplyingBlock:()PKArrayAdditions;
- (uint64_t)pk_createArrayByRemovingObjectsPassingTest:()PKArrayAdditions;
- (uint64_t)pk_createArrayBySafelyApplyingBlock:()PKArrayAdditions;
- (void)pk_createArrayByRemovingObjectAtIndex:()PKArrayAdditions;
@end

@implementation NSArray(PKArrayAdditions)

- (id)pk_firstObjectPassingTest:()PKArrayAdditions
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__NSArray_PKArrayAdditions__pk_firstObjectPassingTest___block_invoke;
    v9[3] = &unk_1E56DC6D0;
    id v10 = v4;
    uint64_t v6 = [a1 indexOfObjectPassingTest:v9];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
    }
    else
    {
      v7 = [a1 objectAtIndex:v6];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)pk_objectsPassingTest:()PKArrayAdditions
{
  v2 = objc_msgSend(a1, "indexesOfObjectsPassingTest:");
  v3 = [a1 objectsAtIndexes:v2];

  return v3;
}

- (id)pk_arrayByApplyingBlock:()PKArrayAdditions
{
  v1 = objc_msgSend(a1, "pk_createArrayByApplyingBlock:");
  return v1;
}

- (uint64_t)pk_createArrayByApplyingBlock:()PKArrayAdditions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = a1;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x192FDC630](v8);
          v14 = v4[2](v4, v12);
          objc_msgSend(v6, "addObject:", v14, (void)v17);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        uint64_t v9 = v8;
      }
      while (v8);
    }

    uint64_t v15 = [v6 copy];
  }
  else
  {
    uint64_t v15 = MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

- (id)pk_indexDictionaryByApplyingBlock:()PKArrayAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
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
        uint64_t v12 = v4[2](v4, v11);
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

- (id)pk_arrayByRemovingObject:()PKArrayAdditions
{
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF != %@", a3];
  id v5 = [a1 filteredArrayUsingPredicate:v4];

  return v5;
}

- (id)pk_arrayByRemovingObjectsInArray:()PKArrayAdditions
{
  if (a3)
  {
    id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT(SELF IN %@)", a3];
    id v5 = [a1 filteredArrayUsingPredicate:v4];
  }
  else
  {
    id v5 = a1;
  }
  return v5;
}

- (void)pk_createArrayByRemovingObjectAtIndex:()PKArrayAdditions
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    __break(1u);
  }
  else
  {
    id v4 = (void *)[result mutableCopy];
    [v4 removeObjectAtIndex:a3];
    uint64_t v5 = [v4 copy];

    return (void *)v5;
  }
  return result;
}

- (uint64_t)pk_createArrayByRemovingObjectsPassingTest:()PKArrayAdditions
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__NSArray_PKArrayAdditions__pk_createArrayByRemovingObjectsPassingTest___block_invoke;
  v10[3] = &unk_1E56DC6D0;
  id v11 = v4;
  id v5 = v4;
  id v6 = [a1 indexesOfObjectsPassingTest:v10];
  if ([v6 count])
  {
    uint64_t v7 = (void *)[a1 mutableCopy];
    [v7 removeObjectsAtIndexes:v6];
    uint64_t v8 = [v7 copy];
  }
  else
  {
    uint64_t v8 = [a1 copy];
  }

  return v8;
}

- (uint64_t)pk_createArrayBySafelyApplyingBlock:()PKArrayAdditions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = a1;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x192FDC630](v8);
          long long v14 = v4[2](v4, v12);
          if (v14) {
            objc_msgSend(v6, "addObject:", v14, (void)v17);
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        uint64_t v9 = v8;
      }
      while (v8);
    }

    uint64_t v15 = [v6 copy];
  }
  else
  {
    uint64_t v15 = MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

- (id)pk_arrayBySafelyApplyingBlock:()PKArrayAdditions
{
  v1 = objc_msgSend(a1, "pk_createArrayBySafelyApplyingBlock:");
  return v1;
}

- (id)pk_createSetByApplyingBlock:()PKArrayAdditions
{
  id v4 = a3;
  if ([a1 count])
  {
    uint64_t v5 = objc_msgSend(a1, "pk_createMutableSetByApplyingBlock:", v4);
    id v6 = (id)[v5 copy];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }

  return v6;
}

- (id)pk_createMutableSetByApplyingBlock:()PKArrayAdditions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v5];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = a1;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x192FDC630](v8);
          long long v14 = v4[2](v4, v12);
          objc_msgSend(v6, "addObject:", v14, (void)v16);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        uint64_t v9 = v8;
      }
      while (v8);
    }
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  }

  return v6;
}

- (id)pk_createOrderedSetByApplyingBlock:()PKArrayAdditions
{
  id v4 = a3;
  if ([a1 count])
  {
    uint64_t v5 = objc_msgSend(a1, "pk_createMutableOrderedSetByApplyingBlock:", v4);
    id v6 = (id)[v5 copy];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CAA0]);
  }

  return v6;
}

- (id)pk_createMutableOrderedSetByApplyingBlock:()PKArrayAdditions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:v5];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = a1;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x192FDC630](v8);
          long long v14 = v4[2](v4, v12);
          objc_msgSend(v6, "addObject:", v14, (void)v16);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        uint64_t v9 = v8;
      }
      while (v8);
    }
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  }

  return v6;
}

- (id)pk_shuffledArray
{
  unint64_t v2 = [a1 count];
  if (v2 < 2)
  {
    uint64_t v8 = (void *)[a1 copy];
  }
  else
  {
    unint64_t v3 = v2;
    id v4 = (void *)[a1 mutableCopy];
    uint64_t v5 = 0;
    do
    {
      if (v3 >= 0xFFFFFFFF) {
        uint32_t v6 = -1;
      }
      else {
        uint32_t v6 = v3;
      }
      uint32_t v7 = arc4random_uniform(v6);
      if (v7) {
        [v4 exchangeObjectAtIndex:v5 withObjectAtIndex:v5 + v7];
      }
      ++v5;
      --v3;
    }
    while (v3);
    uint64_t v8 = (void *)[v4 copy];
  }
  return v8;
}

- (uint64_t)pk_countObjectsPassingTest:()PKArrayAdditions
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__NSArray_PKArrayAdditions__pk_countObjectsPassingTest___block_invoke;
  v8[3] = &unk_1E56DC6F8;
  uint64_t v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [a1 enumerateObjectsUsingBlock:v8];
  uint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)pk_groupDictionaryByApplyingBlock:()PKArrayAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
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
        uint64_t v12 = v4[2](v4, v11);
        objc_msgSend(v5, "objectForKey:", v12, (void)v15);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v5 setObject:v13 forKey:v12];
        }
        [v13 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)pk_intersectArray:()PKArrayAdditions
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA70];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithArray:a1];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v5];

  [v6 intersectOrderedSet:v7];
  uint64_t v8 = [v6 array];

  return v8;
}

- (BOOL)pk_containsObjectPassingTest:()PKArrayAdditions
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__NSArray_PKArrayAdditions__pk_containsObjectPassingTest___block_invoke;
    v8[3] = &unk_1E56DC6D0;
    id v9 = v4;
    BOOL v6 = [a1 indexOfObjectPassingTest:v8] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)pk_lastObjectPassingTest:()PKArrayAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = objc_msgSend(a1, "reverseObjectEnumerator", 0);
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
          id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
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