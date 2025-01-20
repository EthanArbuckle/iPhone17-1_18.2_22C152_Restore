@interface NSDictionary
@end

@implementation NSDictionary

void __78__NSDictionary_SafariCoreExtras__safari_mapAndFilterKeysAndObjectsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3) {
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
  }
}

uint64_t __78__NSDictionary_SafariCoreExtras__safari_arrayContainingObjectsOfClass_forKey___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __68__NSDictionary_SafariCoreExtras__safari_mapAndFilterKeysUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v4) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
  }
}

void __72__NSDictionary_SafariCoreExtras__safari_dictionaryByRemovingNullObjects__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ((id)*MEMORY[0x1E4F1D260] == v5)
  {
    v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      uint64_t v7 = [*(id *)(a1 + 32) mutableCopy];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v6 removeObjectForKey:v10];
  }
}

uint64_t __56__NSDictionary_SafariCoreExtras__safari_containsObject___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 isEqual:*(void *)(a1 + 32)];
  if (result) {
    *a4 = 1;
  }
  return result;
}

uint64_t __66__NSDictionary_SafariCoreExtras__safari_containsEntryPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result) {
    *a4 = 1;
  }
  return result;
}

id __56__NSDictionary_SafariCoreExtras__safari_mutableDeepCopy__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (void *)[a3 copy];
  return v3;
}

uint64_t __65__NSDictionary_SafariCoreExtras__safari_valueOfEntryPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result) {
    *a4 = 1;
  }
  return result;
}

void __68__NSDictionary_SafariCoreExtras__safari_valuesOfEntriesPassingTest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

@end