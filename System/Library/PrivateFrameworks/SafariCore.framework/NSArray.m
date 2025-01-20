@interface NSArray
@end

@implementation NSArray

void __78__NSArray_SafariCoreExtras__safari_mapAndFilterObjectsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2)
  {
    v3 = v2;
    [*(id *)(a1 + 32) addObject:v2];
    v2 = v3;
  }
}

uint64_t __66__NSArray_SafariCoreExtras__safari_mapAndFilterObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__NSArray_SafariCoreExtras__safari_filterObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__NSArray_SafariCoreExtras__safari_firstObjectPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__NSArray_SafariCoreExtras__safari_arrayFromDictionaryOfObjectsByIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

void __85__NSArray_SafariCoreExtras__safari_enumerateZippedValuesWithArray_options_withBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v7 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = a2;
  id v9 = [v7 objectAtIndexedSubscript:a3];
  (*(void (**)(uint64_t, id, id, uint64_t, uint64_t))(v6 + 16))(v6, v8, v9, a3, a4);
}

void __62__NSArray_SafariCoreExtras__safari_orderedSetByApplyingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  id v9 = a2;
  (*(void (**)(uint64_t, id, uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, v9, a3, [v8 count], a4);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  if (v11)
  {
    [*(id *)(a1 + 32) addObject:v11];
    v10 = v11;
  }
}

void *__59__NSArray_SafariCoreExtras__safari_maximumUsingComparator___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v5;
  if (v6)
  {
    uint64_t v8 = (*(uint64_t (**)(void))(a1[4] + 16))();
    uint64_t v7 = v6;
    if ((unint64_t)(v8 + 1) >= 2)
    {
      if (v8 != 1) {
        goto LABEL_6;
      }
      uint64_t v7 = v5;
    }
  }
  a1 = v7;
LABEL_6:

  return a1;
}

uint64_t __59__NSArray_SafariCoreExtras__safari_minimumUsingComparator___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__NSArray_SafariCoreExtras__safari_lastObjectPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__NSArray_SafariCoreExtras__safari_containsObjectPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__NSArray_SafariCoreExtras__safari_flattenedArray__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  if (isKindOfClass)
  {
    if (!v7)
    {
      uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 0, a3);
      uint64_t v9 = [v8 mutableCopy];
      uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    v12 = objc_msgSend(v13, "safari_flattenedArray");
    [v7 addObjectsFromArray:v12];
  }
  else
  {
    [*(id *)(v6 + 40) addObject:v13];
  }
}

void __61__NSArray_SafariCoreExtras__safari_splitArrayUsingCondition___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  v4 = *(uint64_t (**)(uint64_t, id))(v3 + 16);
  id v7 = a2;
  int v5 = v4(v3, v7);
  uint64_t v6 = 40;
  if (v5) {
    uint64_t v6 = 32;
  }
  [*(id *)(a1 + v6) addObject:v7];
}

uint64_t __76__NSArray_SafariCoreExtras__safari_longestIncreasingSubsequenceUsingValues___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = [v1 containsObject:v2];

  return v3;
}

void __79__NSArray_SafariCoreExtras__safari_dictionaryByMappingObjectsToKeysUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3) {
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  }
}

void __88__NSArray_SafariCoreExtras__safari_dictionaryByMappingObjectsAsKeysToObjectsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3) {
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
  }
}

void __87__NSArray_SafariCoreExtras__safari_dictionaryOfArraysByMappingObjectsToKeysUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    if (!v4)
    {
      id v4 = [MEMORY[0x1E4F1CA48] array];
      [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
    }
    [v4 addObject:v5];
  }
}

uint64_t __51__NSArray_SafariCoreExtras__safari_objectsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end