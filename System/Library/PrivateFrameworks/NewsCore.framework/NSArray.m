@interface NSArray
@end

@implementation NSArray

uint64_t __65__NSArray_FCAdditions__fc_arrayByTransformingWithBlockWithIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }
  return MEMORY[0x1F41817F8]();
}

uint64_t __56__NSArray_FCAdditions__fc_arrayByTransformingWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __53__NSArray_FCAdditions__fc_arrayOfObjectsPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__NSArray_FCAdditions__fc_setByTransformingWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v5 = v2;
    uint64_t v2 = [*(id *)(a1 + 32) addObject:v2];
    uint64_t v3 = v5;
  }
  return MEMORY[0x1F41817F8](v2, v3);
}

void __53__NSArray_FCAdditions__fc_splitArrayWithTest_result___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a1 + 48);
  v8 = *(uint64_t (**)(uint64_t, id, uint64_t, uint64_t))(v7 + 16);
  id v11 = a2;
  int v9 = v8(v7, v11, a3, a4);
  uint64_t v10 = 40;
  if (v9) {
    uint64_t v10 = 32;
  }
  [*(id *)(a1 + v10) addObject:v11];
}

id __65__NSArray_FCAdditions__fc_dictionaryOfSortedObjectsWithKeyBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

void __50__NSArray_FCAdditions__fc_randomlyMergeWithArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = v3;
    if ([*(id *)(a1 + 32) count]) {
      uint64_t v4 = arc4random_uniform([*(id *)(a1 + 32) count]);
    }
    else {
      uint64_t v4 = 0;
    }
    [*(id *)(a1 + 32) insertObject:v5 atIndex:v4];
    id v3 = v5;
  }
}

void __50__NSArray_FCAdditions__fc_randomlyMergeWithArray___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a3;
  v6(v5, a2);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__NSArray_FCAdditions__fc_firstObjectFromIndex_passingTest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __55__NSArray_FCAdditions__fc_firstObjectWithValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 valueForKey:*(void *)(a1 + 32)];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 40)];

  return v4;
}

uint64_t __46__NSArray_FCAdditions__fc_firstObjectOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __46__NSArray_FCAdditions__fc_allObjectsPassTest___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

void __70__NSArray_FCAdditions__fc_objectsOfMaxValueWithValueBlock_comparator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        if (v11)
        {
          if (v7)
          {
            uint64_t v12 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
            if (v12 == 1)
            {
              [v3 removeAllObjects];
              [v3 addObject:v10];
              id v13 = v11;

              id v7 = v13;
            }
            else if (!v12)
            {
              [v3 addObject:v10];
            }
          }
          else
          {
            objc_msgSend(v3, "addObject:", v10, (void)v14);
            id v7 = v11;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }
}

void __70__NSArray_FCAdditions__fc_objectsOfMinValueWithValueBlock_comparator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        if (v11)
        {
          if (v7)
          {
            uint64_t v12 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
            if (v12)
            {
              if (v12 == -1)
              {
                [v3 removeAllObjects];
                [v3 addObject:v10];
                id v13 = v11;

                id v7 = v13;
              }
            }
            else
            {
              [v3 addObject:v10];
            }
          }
          else
          {
            objc_msgSend(v3, "addObject:", v10, (void)v14);
            id v7 = v11;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
  }
}

void __51__NSArray_FCAdditions__fc_setOfObjectsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

uint64_t __61__NSArray_FCAdditions__fc_orderedSetByTransformingWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v5 = v2;
    uint64_t v2 = [*(id *)(a1 + 32) addObject:v2];
    uint64_t v3 = v5;
  }
  return MEMORY[0x1F41817F8](v2, v3);
}

uint64_t __53__NSArray_FCAdditions__fc_arrayOfObjectsFailingTest___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

BOOL __59__NSArray_FCAdditions__fc_arrayByRemovingKeysInDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKey:a2];
  BOOL v3 = v2 == 0;

  return v3;
}

uint64_t __61__NSArray_FCAdditions__fc_arrayByRemovingObjectsPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __61__NSArray_FCAdditions__fc_arrayByRemovingObjectsPassingTest___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

BOOL __118__NSArray_FCAdditions__fc_arraysByPartitioningWithBudget_indicesOfOverBudgetObjects_appraiser_accumulator_comparator___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2) == -1;
}

void __118__NSArray_FCAdditions__fc_arraysByPartitioningWithBudget_indicesOfOverBudgetObjects_appraiser_accumulator_comparator___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
  {
    [*(id *)(a1 + 32) addIndex:a3];
  }
  else
  {
    uint64_t v30 = 0;
    v31 = (id *)&v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__55;
    v34 = __Block_byref_object_dispose__55;
    id v35 = 0;
    uint64_t v24 = 0;
    v25 = (id *)&v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__55;
    v28 = __Block_byref_object_dispose__55;
    id v29 = 0;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __118__NSArray_FCAdditions__fc_arraysByPartitioningWithBudget_indicesOfOverBudgetObjects_appraiser_accumulator_comparator___block_invoke_3;
    uint64_t v19 = &unk_1E5B58658;
    id v20 = *(id *)(a1 + 40);
    v22 = &v30;
    v23 = &v24;
    id v7 = v6;
    id v21 = v7;
    uint64_t v8 = (void (**)(void))_Block_copy(&v16);
    id v11 = v8;
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
    {
      uint64_t v12 = (*(void (**)(void, void, id, uint64_t, uint64_t))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v7, v9, v10);
      if ((*(unsigned int (**)(void, void *, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v12, v13, v14, v15))
      {
        v11[2](v11);
      }
      else
      {
        objc_storeStrong(v31 + 5, *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
        objc_storeStrong(v25 + 5, v12);
      }
    }
    else
    {
      v8[2](v8);
    }
    objc_msgSend(v31[5], "addObject:", v5, v16, v17, v18, v19);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v31[5]);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v25[5]);

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }
}

void __118__NSArray_FCAdditions__fc_arraysByPartitioningWithBudget_indicesOfOverBudgetObjects_appraiser_accumulator_comparator___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  [*(id *)(a1 + 32) addObject:v2];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  id v5 = v2;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 40));
}

uint64_t __62__NSArray_FCAdditions__fc_indexOfFirstObjectWithValue_forKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v6 = [a2 valueForKey:*(void *)(a1 + 32)];
  *a4 = [v6 isEqual:*(void *)(a1 + 40)];

  return *a4;
}

uint64_t __55__NSArray_FCAdditions__fc_indexesOfObjectsIdenticalTo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

uint64_t __55__NSArray_FCAdditions__fc_indexesOfObjectsPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__NSArray_FCAdditions__fc_arrayByMergingAdjacentObjectsWithMergePolicy_mergeBlock___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    [*(id *)(a1 + 32) addObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = v8;
    id v5 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }
}

uint64_t __45__NSArray_FCAdditions__fc_distanceFromArray___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __45__NSArray_FCAdditions__fc_distanceFromArray___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t __46__NSArray_FCAdditions__fc_uniqueByValueBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2 && ([*(id *)(a1 + 32) containsObject:v2] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v2];
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __79__NSArray_FCAdditions__fc_enumerateIslandsOfCommonValuesForKeyBlock_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FBA8A8];
  uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v4 = objc_msgSend(v2, "nf_object:isEqualToObject:", v3, *(void *)(a1 + 32)) ^ 1;

  return v4;
}

uint64_t __78__NSArray_FCAdditions__fc_sortedArrayStartingWithElementsSatisfying_sortedBy___block_invoke()
{
  return 0;
}

uint64_t __78__NSArray_FCAdditions__fc_sortedArrayStartingWithElementsSatisfying_sortedBy___block_invoke_2()
{
  return 0;
}

void __78__NSArray_FCAdditions__fc_sortedArrayStartingWithElementsSatisfying_sortedBy___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  id v5 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__NSArray_FCAdditions__fc_sortedArrayStartingWithElementsSatisfying_sortedBy___block_invoke_4;
  v12[3] = &unk_1E5B58748;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v14 = v5;
  id v15 = v7;
  id v13 = v4;
  id v8 = v5;
  id v9 = v4;
  [v6 enumerateObjectsUsingBlock:v12];
  uint64_t v10 = [v9 sortedArrayUsingComparator:*(void *)(a1 + 48)];
  [v3 addObjectsFromArray:v10];

  id v11 = [v8 sortedArrayUsingComparator:*(void *)(a1 + 48)];
  [v3 addObjectsFromArray:v11];
}

void __78__NSArray_FCAdditions__fc_sortedArrayStartingWithElementsSatisfying_sortedBy___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(uint64_t (**)(uint64_t, id))(v3 + 16);
  id v7 = a2;
  int v5 = v4(v3, v7);
  uint64_t v6 = 40;
  if (v5) {
    uint64_t v6 = 32;
  }
  [*(id *)(a1 + v6) addObject:v7];
}

id __39__NSArray_FCArchivable__contentArchive__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    if ([a2 conformsToProtocol:&unk_1EF8E9808]) {
      uint64_t v3 = a2;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  int v5 = [v4 contentArchive];

  return v5;
}

id __40__NSArray_FCArchivable__contentManifest__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    if ([a2 conformsToProtocol:&unk_1EF8E9808]) {
      uint64_t v3 = a2;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  int v5 = [v4 contentManifest];

  return v5;
}

@end