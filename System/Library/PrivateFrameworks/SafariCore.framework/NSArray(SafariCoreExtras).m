@interface NSArray(SafariCoreExtras)
+ (id)safari_arrayFromDictionaryOfObjectsByIndex:()SafariCoreExtras;
+ (id)safari_arrayWithArray:()SafariCoreExtras copyAction:;
+ (id)safari_arrayWithObjectsUnlessNil:()SafariCoreExtras;
+ (id)safari_arrayWithPropertyListData:()SafariCoreExtras options:;
- (WBSPair)safari_splitArrayUsingCondition:()SafariCoreExtras;
- (__CFString)_safari_generateDiffWithLongestCommonSubsequenceLengths:()SafariCoreExtras array:indexIntoSelf:indexIntoArray:;
- (id)_safari_computeLengthsOfLongestSubsequencesCommonWithArray:()SafariCoreExtras;
- (id)_safari_generatePermutations:()SafariCoreExtras withPosition:permutationsArray:;
- (id)safari_URLAtIndex:()SafariCoreExtras;
- (id)safari_allPermutations;
- (id)safari_arrayAtIndex:()SafariCoreExtras;
- (id)safari_arrayByAddingObjectsFromArrayIfNotDuplicates:()SafariCoreExtras;
- (id)safari_arrayByRemovingObject:()SafariCoreExtras;
- (id)safari_dictionaryAtIndex:()SafariCoreExtras;
- (id)safari_dictionaryByMappingObjectsAsKeysToObjectsUsingBlock:()SafariCoreExtras;
- (id)safari_dictionaryByMappingObjectsToKeysUsingBlock:()SafariCoreExtras;
- (id)safari_dictionaryOfArraysByMappingObjectsToKeysUsingBlock:()SafariCoreExtras;
- (id)safari_diffWithArray:()SafariCoreExtras;
- (id)safari_filterObjectsUsingBlock:()SafariCoreExtras;
- (id)safari_firstObjectPassingTest:()SafariCoreExtras;
- (id)safari_flattenedArray;
- (id)safari_lastObjectPassingTest:()SafariCoreExtras;
- (id)safari_longestIncreasingSubsequenceUsingValues:()SafariCoreExtras;
- (id)safari_mapAndFilterObjectsUsingBlock:()SafariCoreExtras;
- (id)safari_mapAndFilterObjectsWithOptions:()SafariCoreExtras usingBlock:;
- (id)safari_maximumUsingComparator:()SafariCoreExtras;
- (id)safari_minimumUsingComparator:()SafariCoreExtras;
- (id)safari_numberAtIndex:()SafariCoreExtras;
- (id)safari_objectAfter:()SafariCoreExtras;
- (id)safari_objectBefore:()SafariCoreExtras;
- (id)safari_objectsOfClass:()SafariCoreExtras;
- (id)safari_orderedSetByApplyingBlock:()SafariCoreExtras;
- (id)safari_partionedArrayUsingCondition:()SafariCoreExtras;
- (id)safari_reduceObjectsWithInitialValue:()SafariCoreExtras usingBlock:;
- (id)safari_setByApplyingBlock:()SafariCoreExtras;
- (id)safari_stringAtIndex:()SafariCoreExtras;
- (uint64_t)safari_allObjectsPassTest:()SafariCoreExtras;
- (uint64_t)safari_containsObjectPassingTest:()SafariCoreExtras;
- (uint64_t)safari_enumerateZippedValuesWithArray:()SafariCoreExtras withBlock:;
- (uint64_t)safari_noObjectsPassTest:()SafariCoreExtras;
- (uint64_t)safari_prefixWithMaxLength:()SafariCoreExtras;
- (uint64_t)safari_reduceObjectsUsingBlock:()SafariCoreExtras;
- (void)safari_enumerateAsynchronouslyOnQueue:()SafariCoreExtras enumerationBlock:completionBlock:;
- (void)safari_enumerateOutwardFromIndex:()SafariCoreExtras otherIndex:usingBlock:;
- (void)safari_enumerateOutwardFromIndex:()SafariCoreExtras usingBlock:;
- (void)safari_enumerateZippedValuesWithArray:()SafariCoreExtras options:withBlock:;
@end

@implementation NSArray(SafariCoreExtras)

- (uint64_t)safari_allObjectsPassTest:()SafariCoreExtras
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v9)))
        {
          uint64_t v10 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 1;
LABEL_11:

  return v10;
}

- (id)safari_partionedArrayUsingCondition:()SafariCoreExtras
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
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
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (v4[2](v4, v12)) {
          long long v13 = v6;
        }
        else {
          long long v13 = v5;
        }
        objc_msgSend(v13, "addObject:", v12, (void)v16);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  [v5 addObjectsFromArray:v6];
  long long v14 = (void *)[v5 copy];

  return v14;
}

+ (id)safari_arrayWithObjectsUnlessNil:()SafariCoreExtras
{
  id v9 = a3;
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = (id *)&a9;
  id v11 = v9;
  id v12 = [MEMORY[0x1E4F1CA98] null];

  id v13 = v11;
  if (v12 != v11)
  {
    long long v14 = v11;
    do
    {
      objc_msgSend(v10, "safari_addObjectUnlessNil:", v14);
      long long v15 = v18++;
      id v13 = *v15;

      id v16 = [MEMORY[0x1E4F1CA98] null];

      long long v14 = v13;
    }
    while (v13 != v16);
  }

  return v10;
}

- (uint64_t)safari_prefixWithMaxLength:()SafariCoreExtras
{
  unint64_t v5 = [a1 count];
  if (v5 >= a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = v5;
  }
  return objc_msgSend(a1, "subarrayWithRange:", 0, v6);
}

- (id)safari_firstObjectPassingTest:()SafariCoreExtras
{
  v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5)
  {
    if (v5 == 1)
    {
      unint64_t v6 = [a1 objectAtIndexedSubscript:0];
      if (v4[2](v4, v6)) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
      id v8 = v7;
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __59__NSArray_SafariCoreExtras__safari_firstObjectPassingTest___block_invoke;
      v11[3] = &unk_1E615B370;
      id v12 = v4;
      uint64_t v9 = [a1 indexOfObjectPassingTest:v11];
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v8 = 0;
      }
      else
      {
        id v8 = [a1 objectAtIndexedSubscript:v9];
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)safari_filterObjectsUsingBlock:()SafariCoreExtras
{
  v4 = a3;
  uint64_t v5 = [a1 count];
  if (!v5)
  {
LABEL_5:
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_7;
  }
  if (v5 == 1)
  {
    unint64_t v6 = [a1 objectAtIndexedSubscript:0];
    int v7 = v4[2](v4, v6);

    if (v7)
    {
      id v8 = (void *)[a1 copy];
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__NSArray_SafariCoreExtras__safari_filterObjectsUsingBlock___block_invoke;
  v11[3] = &unk_1E615B370;
  id v12 = v4;
  uint64_t v9 = [a1 indexesOfObjectsPassingTest:v11];
  id v8 = [a1 objectsAtIndexes:v9];

LABEL_7:
  return v8;
}

- (id)safari_mapAndFilterObjectsUsingBlock:()SafariCoreExtras
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__NSArray_SafariCoreExtras__safari_mapAndFilterObjectsUsingBlock___block_invoke;
  v8[3] = &unk_1E615B320;
  id v9 = v4;
  id v5 = v4;
  unint64_t v6 = objc_msgSend(a1, "safari_mapAndFilterObjectsWithOptions:usingBlock:", 0, v8);

  return v6;
}

- (id)safari_mapAndFilterObjectsWithOptions:()SafariCoreExtras usingBlock:
{
  v19[1] = *MEMORY[0x1E4F143B8];
  unint64_t v6 = a4;
  uint64_t v7 = [a1 count];
  if (v7)
  {
    if (v7 == 1)
    {
      id v8 = [a1 objectAtIndexedSubscript:0];
      char v18 = 0;
      v6[2](v6, v8, 0, &v18);
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v19[0] = v9;
        uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      }
      else
      {
        uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      id v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __78__NSArray_SafariCoreExtras__safari_mapAndFilterObjectsWithOptions_usingBlock___block_invoke;
      v15[3] = &unk_1E615B348;
      long long v17 = v6;
      id v12 = v11;
      id v16 = v12;
      [a1 enumerateObjectsWithOptions:a3 usingBlock:v15];
      id v13 = v16;
      id v9 = v12;

      uint64_t v10 = v9;
    }
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (id)safari_arrayByAddingObjectsFromArrayIfNotDuplicates:()SafariCoreExtras
{
  id v4 = (void *)MEMORY[0x1E4F1CA70];
  id v5 = a3;
  unint64_t v6 = [v4 orderedSetWithArray:a1];
  [v6 addObjectsFromArray:v5];

  uint64_t v7 = [v6 array];

  return v7;
}

- (id)safari_setByApplyingBlock:()SafariCoreExtras
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5 == 1)
  {
    uint64_t v7 = [a1 objectAtIndexedSubscript:0];
    v4[2](v4, v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8) {
      [MEMORY[0x1E4F1CAD0] setWithObject:v8];
    }
    else {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
    }
  }
  else
  {
    if (!v5)
    {
      id v6 = [MEMORY[0x1E4F1CAD0] set];
      goto LABEL_19;
    }
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = a1;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = v4[2](v4, *(void **)(*((void *)&v15 + 1) + 8 * i));
          if (v13) {
            objc_msgSend(v6, "addObject:", v13, (void)v15);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }

LABEL_19:
  return v6;
}

- (uint64_t)safari_containsObjectPassingTest:()SafariCoreExtras
{
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5)
  {
    if (v5 == 1)
    {
      id v6 = [a1 objectAtIndexedSubscript:0];
      uint64_t v7 = v4[2](v4, v6);
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __62__NSArray_SafariCoreExtras__safari_containsObjectPassingTest___block_invoke;
      v9[3] = &unk_1E615B370;
      uint64_t v10 = v4;
      uint64_t v7 = [a1 indexOfObjectPassingTest:v9] != 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)safari_enumerateOutwardFromIndex:()SafariCoreExtras usingBlock:
{
  id v6 = a4;
  uint64_t v7 = [a1 count];
  if (v7)
  {
    unint64_t v8 = v7;
    char v13 = 0;
    uint64_t v9 = [a1 objectAtIndexedSubscript:a3];
    v6[2](v6, v9, a3, &v13);

    if (!v13 && v8 != 1)
    {
      for (unint64_t i = 1; i < v8; ++i)
      {
        if (a3 >= i)
        {
          uint64_t v11 = [a1 objectAtIndexedSubscript:a3 - i];
          v6[2](v6, v11, a3 - i, &v13);

          if (v13) {
            break;
          }
        }
        if (i + a3 < v8)
        {
          id v12 = [a1 objectAtIndexedSubscript:i + a3];
          v6[2](v6, v12, i + a3, &v13);

          if (v13) {
            break;
          }
        }
      }
    }
  }
}

- (id)safari_reduceObjectsWithInitialValue:()SafariCoreExtras usingBlock:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = a4;
  uint64_t v8 = [a1 count];
  id v9 = v6;
  uint64_t v10 = v9;
  if (v8)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = a1;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    uint64_t v10 = v9;
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      uint64_t v10 = v9;
      do
      {
        uint64_t v15 = 0;
        long long v16 = v10;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v10 = v7[2](v7, *(void *)(*((void *)&v18 + 1) + 8 * v15), v16);

          ++v15;
          long long v16 = v10;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }
  }
  return v10;
}

+ (id)safari_arrayWithArray:()SafariCoreExtras copyAction:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = v7;
  if (!a4)
  {
    uint64_t v9 = [a1 arrayWithArray:v7];
LABEL_6:
    id v4 = (void *)v9;
    goto LABEL_15;
  }
  if (a4 != 2)
  {
    if (a4 != 1) {
      goto LABEL_15;
    }
    uint64_t v9 = [objc_alloc((Class)a1) initWithArray:v7 copyItems:1];
    goto LABEL_6;
  }
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "mutableCopyWithZone:", 0, (void)v18);
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  id v4 = [a1 arrayWithArray:v10];

LABEL_15:
  return v4;
}

+ (id)safari_arrayFromDictionaryOfObjectsByIndex:()SafariCoreExtras
{
  id v3 = a3;
  id v4 = [v3 allKeys];
  uint64_t v5 = [v4 sortedArrayUsingSelector:sel_compare_];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__NSArray_SafariCoreExtras__safari_arrayFromDictionaryOfObjectsByIndex___block_invoke;
  v9[3] = &unk_1E615B2F8;
  id v10 = v3;
  id v6 = v3;
  id v7 = objc_msgSend(v5, "safari_mapObjectsUsingBlock:", v9);

  return v7;
}

- (id)safari_numberAtIndex:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectAtIndex:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_stringAtIndex:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectAtIndex:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_URLAtIndex:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectAtIndex:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_dictionaryAtIndex:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectAtIndex:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)safari_arrayAtIndex:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectAtIndex:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v2 = v1;
  }
  else {
    v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (uint64_t)safari_enumerateZippedValuesWithArray:()SafariCoreExtras withBlock:
{
  return objc_msgSend(a1, "safari_enumerateZippedValuesWithArray:options:withBlock:", a3, 0, a4);
}

- (void)safari_enumerateZippedValuesWithArray:()SafariCoreExtras options:withBlock:
{
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = [a1 count];
  unint64_t v11 = [v8 count];
  if (v10 >= v11) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__NSArray_SafariCoreExtras__safari_enumerateZippedValuesWithArray_options_withBlock___block_invoke;
  v16[3] = &unk_1E615B348;
  id v17 = v8;
  id v18 = v9;
  id v14 = v8;
  id v15 = v9;
  [a1 enumerateObjectsAtIndexes:v13 options:a4 usingBlock:v16];
}

- (void)safari_enumerateOutwardFromIndex:()SafariCoreExtras otherIndex:usingBlock:
{
  id v8 = a5;
  if (a3 == a4)
  {
    objc_msgSend(a1, "safari_enumerateOutwardFromIndex:usingBlock:", a3, v8);
    goto LABEL_5;
  }
  uint64_t v9 = [a1 count];
  if (v9)
  {
    int64_t v10 = v9;
    unsigned __int8 v29 = 0;
    unint64_t v11 = [a1 objectAtIndexedSubscript:a3];
    v8[2](v8, v11, a3, &v29);

    if (!v29)
    {
      unint64_t v12 = [a1 objectAtIndexedSubscript:a4];
      v8[2](v8, v12, a4, &v29);

      if (!v29 && (unint64_t)v10 >= 2)
      {
        uint64_t v13 = -1;
        uint64_t v14 = 1;
        int64_t v28 = v10;
        do
        {
          int64_t v15 = a3 + v13;
          int64_t v16 = a3 + v14;
          int64_t v17 = a4 + v13;
          int64_t v18 = a4 + v14;
          if (a3 >= a4)
          {
            if (v15 >= v18)
            {
              long long v21 = [a1 objectAtIndexedSubscript:a3 + v13];
              v8[2](v8, v21, a3 + v13, &v29);

              int64_t v10 = v28;
              int64_t v18 = a4 + v14;
              if (v29) {
                break;
              }
            }
            if ((v17 & 0x8000000000000000) == 0)
            {
              v22 = [a1 objectAtIndexedSubscript:a4 + v13];
              v8[2](v8, v22, a4 + v13, &v29);

              int64_t v10 = v28;
              int64_t v18 = a4 + v14;
              if (v29) {
                break;
              }
            }
            if (v16 < v10)
            {
              uint64_t v23 = [a1 objectAtIndexedSubscript:a3 + v14];
              v8[2](v8, v23, a3 + v14, &v29);

              int64_t v18 = a4 + v14;
              if (v29) {
                break;
              }
            }
            if (v18 < v15) {
              goto LABEL_28;
            }
          }
          else
          {
            if (v15 < 0)
            {
              int v20 = 0;
            }
            else
            {
              long long v19 = [a1 objectAtIndexedSubscript:a3 + v13];
              v8[2](v8, v19, a3 + v13, &v29);

              int64_t v10 = v28;
              int64_t v18 = a4 + v14;
              int v20 = v29;
              if (v29) {
                break;
              }
            }
            if (v17 > v16)
            {
              v24 = [a1 objectAtIndexedSubscript:a4 + v13];
              v8[2](v8, v24, a4 + v13, &v29);

              int64_t v18 = a4 + v14;
              int v20 = v29;
              if (v29) {
                break;
              }
            }
            if (v16 <= v17)
            {
              v25 = [a1 objectAtIndexedSubscript:a3 + v14];
              v8[2](v8, v25, a3 + v14, &v29);

              int64_t v18 = a4 + v14;
              int v20 = v29;
            }
            if (v20) {
              break;
            }
            if (v18 < v10)
            {
LABEL_28:
              int64_t v26 = v18;
              v27 = objc_msgSend(a1, "objectAtIndexedSubscript:", v18, v28);
              v8[2](v8, v27, v26, &v29);

              if (v29) {
                break;
              }
            }
          }
          ++v14;
          --v13;
        }
        while (v10 != v14);
      }
    }
  }
LABEL_5:
}

- (void)safari_enumerateAsynchronouslyOnQueue:()SafariCoreExtras enumerationBlock:completionBlock:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)[a1 copy];
  enumerateAsynchronously(v10, v11, 0, v9, v8);
}

- (id)safari_orderedSetByApplyingBlock:()SafariCoreExtras
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__NSArray_SafariCoreExtras__safari_orderedSetByApplyingBlock___block_invoke;
  v11[3] = &unk_1E615B348;
  id v13 = v4;
  id v6 = v5;
  id v12 = v6;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:v11];
  id v8 = v12;
  id v9 = v6;

  return v9;
}

- (uint64_t)safari_reduceObjectsUsingBlock:()SafariCoreExtras
{
  return objc_msgSend(a1, "safari_reduceObjectsWithInitialValue:usingBlock:", 0, a3);
}

- (id)safari_maximumUsingComparator:()SafariCoreExtras
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__NSArray_SafariCoreExtras__safari_maximumUsingComparator___block_invoke;
  v8[3] = &unk_1E615B398;
  id v9 = v4;
  id v5 = v4;
  id v6 = objc_msgSend(a1, "safari_reduceObjectsUsingBlock:", v8);

  return v6;
}

- (id)safari_minimumUsingComparator:()SafariCoreExtras
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__NSArray_SafariCoreExtras__safari_minimumUsingComparator___block_invoke;
  v8[3] = &unk_1E615B3C0;
  id v9 = v4;
  id v5 = v4;
  id v6 = objc_msgSend(a1, "safari_maximumUsingComparator:", v8);

  return v6;
}

- (id)safari_diffWithArray:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "_safari_computeLengthsOfLongestSubsequencesCommonWithArray:", v4);
  id v6 = objc_msgSend(a1, "_safari_generateDiffWithLongestCommonSubsequenceLengths:array:indexIntoSelf:indexIntoArray:", v5, v4, objc_msgSend(a1, "count"), objc_msgSend(v4, "count"));

  id v7 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  id v8 = [v6 stringByTrimmingCharactersInSet:v7];

  return v8;
}

- (id)_safari_computeLengthsOfLongestSubsequencesCommonWithArray:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  [a1 count];
  unint64_t v6 = 0;
  do
  {
    id v7 = [MEMORY[0x1E4F1CA48] arrayWithObject:&unk_1F1086230];
    [v5 setObject:v7 atIndexedSubscript:v6];

    ++v6;
  }
  while (v6 <= [a1 count]);
  unsigned __int8 v29 = a1;
  [v4 count];
  unint64_t v8 = 0;
  do
  {
    id v9 = [v5 objectAtIndexedSubscript:0];
    [v9 setObject:&unk_1F1086230 atIndexedSubscript:v8];

    ++v8;
  }
  while (v8 <= [v4 count]);
  id v10 = a1;
  if ([a1 count])
  {
    unint64_t v11 = 1;
    do
    {
      if ([v4 count])
      {
        unint64_t v12 = 1;
        do
        {
          id v13 = [v10 objectAtIndexedSubscript:v11 - 1];
          uint64_t v14 = [v4 objectAtIndexedSubscript:v12 - 1];
          int v15 = [v13 isEqual:v14];

          int64_t v16 = NSNumber;
          if (v15)
          {
            int64_t v17 = [v5 objectAtIndexedSubscript:v11 - 1];
            int64_t v18 = [v17 objectAtIndexedSubscript:v12 - 1];
            long long v19 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v18, "unsignedIntegerValue") + 1);
            int v20 = [v5 objectAtIndexedSubscript:v11];
            [v20 setObject:v19 atIndexedSubscript:v12];
          }
          else
          {
            long long v21 = [v5 objectAtIndexedSubscript:v11];
            v22 = [v21 objectAtIndexedSubscript:v12 - 1];
            unint64_t v23 = [v22 unsignedIntegerValue];

            v24 = [v5 objectAtIndexedSubscript:v11 - 1];
            v25 = [v24 objectAtIndexedSubscript:v12];
            unint64_t v26 = [v25 unsignedIntegerValue];

            if (v23 <= v26) {
              unint64_t v27 = v26;
            }
            else {
              unint64_t v27 = v23;
            }
            id v10 = v29;
            int64_t v17 = [v16 numberWithUnsignedInteger:v27];
            int64_t v18 = [v5 objectAtIndexedSubscript:v11];
            [v18 setObject:v17 atIndexedSubscript:v12];
          }

          ++v12;
        }
        while (v12 <= [v4 count]);
      }
      ++v11;
    }
    while (v11 <= [v10 count]);
  }

  return v5;
}

- (__CFString)_safari_generateDiffWithLongestCommonSubsequenceLengths:()SafariCoreExtras array:indexIntoSelf:indexIntoArray:
{
  id v10 = a3;
  id v11 = a4;
  unint64_t v12 = v11;
  if (a5 && a6)
  {
    uint64_t v13 = a5 - 1;
    uint64_t v14 = [a1 objectAtIndexedSubscript:a5 - 1];
    uint64_t v15 = a6 - 1;
    int64_t v16 = [v12 objectAtIndexedSubscript:a6 - 1];
    int v17 = [v14 isEqual:v16];

    if (v17)
    {
      int64_t v18 = objc_msgSend(a1, "_safari_generateDiffWithLongestCommonSubsequenceLengths:array:indexIntoSelf:indexIntoArray:", v10, v12, a5 - 1, a6 - 1);
      long long v19 = [a1 objectAtIndexedSubscript:a5 - 1];
      [v18 stringByAppendingFormat:@"  %@\n", v19];
LABEL_18:
      v35 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
    v38 = a1;
    id v39 = v12;
    goto LABEL_9;
  }
  if (a6)
  {
    uint64_t v15 = a6 - 1;
    if (!a5) {
      goto LABEL_14;
    }
    v38 = a1;
    id v39 = v11;
    uint64_t v13 = a5 - 1;
LABEL_9:
    uint64_t v37 = v13;
    int v20 = [v10 objectAtIndexedSubscript:a5];
    long long v21 = [v20 objectAtIndexedSubscript:v15];
    unint64_t v22 = [v21 unsignedIntegerValue];
    unint64_t v23 = [v10 objectAtIndexedSubscript:v13];
    v24 = [v23 objectAtIndexedSubscript:a6];
    v25 = v10;
    unint64_t v26 = [v24 unsignedIntegerValue];

    if (v22 < v26)
    {
      unint64_t v27 = [v25 objectAtIndexedSubscript:a5];
      int64_t v28 = [v27 objectAtIndexedSubscript:v15];
      unint64_t v29 = [v28 unsignedIntegerValue];
      uint64_t v30 = v37;
      v31 = [v25 objectAtIndexedSubscript:v37];
      v32 = [v31 objectAtIndexedSubscript:a6];
      unint64_t v33 = [v32 unsignedIntegerValue];

      BOOL v34 = v29 >= v33;
      id v10 = v25;
      a1 = v38;
      unint64_t v12 = v39;
      if (!v34) {
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    id v10 = v25;
    a1 = v38;
    unint64_t v12 = v39;
LABEL_14:
    int64_t v18 = objc_msgSend(a1, "_safari_generateDiffWithLongestCommonSubsequenceLengths:array:indexIntoSelf:indexIntoArray:", v10, v12, a5, v15);
    long long v19 = [v12 objectAtIndexedSubscript:v15];
    [v18 stringByAppendingFormat:@"+ %@\n", v19];
    goto LABEL_18;
  }
  if (a5)
  {
    uint64_t v30 = a5 - 1;
LABEL_17:
    int64_t v18 = objc_msgSend(a1, "_safari_generateDiffWithLongestCommonSubsequenceLengths:array:indexIntoSelf:indexIntoArray:", v10, v12, v30, a6);
    long long v19 = [a1 objectAtIndexedSubscript:v30];
    [v18 stringByAppendingFormat:@"- %@\n", v19];
    goto LABEL_18;
  }
LABEL_22:
  v35 = &stru_1F105D3F0;
LABEL_19:

  return v35;
}

- (id)safari_lastObjectPassingTest:()SafariCoreExtras
{
  id v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5)
  {
    if (v5 == 1)
    {
      unint64_t v6 = [a1 objectAtIndexedSubscript:0];
      if (v4[2](v4, v6)) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
      id v8 = v7;
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __58__NSArray_SafariCoreExtras__safari_lastObjectPassingTest___block_invoke;
      v11[3] = &unk_1E615B370;
      unint64_t v12 = v4;
      uint64_t v9 = [a1 indexOfObjectWithOptions:2 passingTest:v11];
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v8 = 0;
      }
      else
      {
        id v8 = [a1 objectAtIndexedSubscript:v9];
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (uint64_t)safari_noObjectsPassTest:()SafariCoreExtras
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v9)))
        {
          uint64_t v10 = 0;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 1;
LABEL_11:

  return v10;
}

- (id)safari_arrayByRemovingObject:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = (void *)[a1 mutableCopy];
  [v5 removeObject:v4];

  uint64_t v6 = (void *)[v5 copy];
  return v6;
}

+ (id)safari_arrayWithPropertyListData:()SafariCoreExtras options:
{
  if (a3)
  {
    id v4 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:a4 format:0 error:0];
    objc_opt_class();
    id v5 = 0;
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)safari_flattenedArray
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__6;
  long long v12 = __Block_byref_object_dispose__6;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__NSArray_SafariCoreExtras__safari_flattenedArray__block_invoke;
  v7[3] = &unk_1E615B3E8;
  v7[4] = a1;
  v7[5] = &v8;
  [a1 enumerateObjectsUsingBlock:v7];
  uint64_t v2 = [(id)v9[5] copy];
  id v3 = (void *)v2;
  if (v2) {
    id v4 = (void *)v2;
  }
  else {
    id v4 = a1;
  }
  id v5 = v4;

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)safari_objectBefore:()SafariCoreExtras
{
  uint64_t v2 = objc_msgSend(a1, "indexOfObject:");
  uint64_t v3 = v2;
  id v4 = 0;
  if (v2 && v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = [a1 objectAtIndexedSubscript:v2 - 1];
  }
  id v5 = v4;
  if (v3 && v3 != 0x7FFFFFFFFFFFFFFFLL) {

  }
  return v5;
}

- (id)safari_objectAfter:()SafariCoreExtras
{
  unint64_t v2 = objc_msgSend(a1, "indexOfObject:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v3 = v2, v2 >= [a1 count] - 1))
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [a1 objectAtIndexedSubscript:v3 + 1];
  }
  return v4;
}

- (WBSPair)safari_splitArrayUsingCondition:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__NSArray_SafariCoreExtras__safari_splitArrayUsingCondition___block_invoke;
  v12[3] = &unk_1E615B410;
  id v14 = v6;
  id v15 = v4;
  id v13 = v5;
  id v7 = v6;
  id v8 = v5;
  id v9 = v4;
  [a1 enumerateObjectsUsingBlock:v12];
  uint64_t v10 = [[WBSPair alloc] initWithFirst:v8 second:v7];

  return v10;
}

- (id)safari_longestIncreasingSubsequenceUsingValues:()SafariCoreExtras
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(a1, "safari_mapAndFilterObjectsUsingBlock:", v4);
  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = v6;
    v38 = a1;
    id v39 = v4;
    id v8 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
    do
    {
      [v8 addObject:v9];
      --v7;
    }
    while (v7);
    uint64_t v10 = (void *)MEMORY[0x1E4F1C978];
    id v11 = [v5 objectAtIndexedSubscript:0];
    long long v12 = [v10 arrayWithObject:v11];
    [v8 setObject:v12 atIndexedSubscript:0];

    if ((unint64_t)[v5 count] >= 2)
    {
      for (unint64_t i = 1; i < [v5 count]; ++i)
      {
        uint64_t v14 = 0;
        do
        {
          id v15 = [v5 objectAtIndexedSubscript:v14];
          uint64_t v16 = [v15 integerValue];
          uint64_t v17 = [v5 objectAtIndexedSubscript:i];
          if (v16 >= [v17 integerValue])
          {
          }
          else
          {
            int64_t v18 = [v8 objectAtIndexedSubscript:v14];
            unint64_t v19 = [v18 count] + 1;
            int v20 = [v8 objectAtIndexedSubscript:i];
            unint64_t v21 = [v20 count];

            if (v19 <= v21) {
              goto LABEL_12;
            }
            id v15 = [v8 objectAtIndexedSubscript:v14];
            [v8 setObject:v15 atIndexedSubscript:i];
          }

LABEL_12:
          ++v14;
        }
        while (i != v14);
        unint64_t v22 = [v8 objectAtIndexedSubscript:i];
        unint64_t v23 = [v5 objectAtIndexedSubscript:i];
        v24 = [v22 arrayByAddingObject:v23];
        [v8 setObject:v24 atIndexedSubscript:i];
      }
    }
    v25 = [v8 objectAtIndexedSubscript:0];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v26 = v8;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v44 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = *(void **)(*((void *)&v43 + 1) + 8 * j);
          unint64_t v32 = [v31 count];
          if (v32 > [v25 count])
          {
            id v33 = v31;

            v25 = v33;
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v28);
    }

    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __76__NSArray_SafariCoreExtras__safari_longestIncreasingSubsequenceUsingValues___block_invoke;
    v40[3] = &unk_1E615B438;
    id v41 = v25;
    id v4 = v39;
    id v42 = v39;
    id v34 = v25;
    v35 = [v38 indexesOfObjectsPassingTest:v40];
    v36 = [v38 objectsAtIndexes:v35];
  }
  else
  {
    v36 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v36;
}

- (id)safari_dictionaryByMappingObjectsToKeysUsingBlock:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __79__NSArray_SafariCoreExtras__safari_dictionaryByMappingObjectsToKeysUsingBlock___block_invoke;
  id v13 = &unk_1E615B348;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  id v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)safari_dictionaryByMappingObjectsAsKeysToObjectsUsingBlock:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __88__NSArray_SafariCoreExtras__safari_dictionaryByMappingObjectsAsKeysToObjectsUsingBlock___block_invoke;
  id v13 = &unk_1E615B348;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  id v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)safari_dictionaryOfArraysByMappingObjectsToKeysUsingBlock:()SafariCoreExtras
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __87__NSArray_SafariCoreExtras__safari_dictionaryOfArraysByMappingObjectsToKeysUsingBlock___block_invoke;
  id v14 = &unk_1E615B348;
  id v15 = v5;
  id v16 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v11];
  id v8 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v9 = objc_msgSend(v8, "initWithDictionary:copyItems:", v6, 1, v11, v12, v13, v14);

  return v9;
}

- (id)safari_allPermutations
{
  unint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:a1];
  uint64_t v3 = [a1 count];
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = objc_msgSend(a1, "_safari_generatePermutations:withPosition:permutationsArray:", v2, v3, v4);

  return v5;
}

- (id)_safari_generatePermutations:()SafariCoreExtras withPosition:permutationsArray:
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 1)
  {
    uint64_t v10 = (void *)[v8 copy];
    [v9 addObject:v10];
  }
  else
  {
    id v11 = (id)objc_msgSend(a1, "_safari_generatePermutations:withPosition:permutationsArray:", v8, a4 - 1, v9);
    uint64_t v12 = 0;
    do
    {
      if (a4) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = v12;
      }
      [v8 exchangeObjectAtIndex:v13 withObjectAtIndex:a4 - 1];
      id v14 = (id)objc_msgSend(a1, "_safari_generatePermutations:withPosition:permutationsArray:", v8, a4 - 1, v9);
      ++v12;
    }
    while (a4 - 1 != v12);
  }

  return v9;
}

- (id)safari_objectsOfClass:()SafariCoreExtras
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__NSArray_SafariCoreExtras__safari_objectsOfClass___block_invoke;
  v5[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v5[4] = a3;
  uint64_t v3 = objc_msgSend(a1, "safari_filterObjectsUsingBlock:", v5);
  return v3;
}

@end