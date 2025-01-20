@interface NSDictionary
@end

@implementation NSDictionary

void __70__NSDictionary_FCAdditions__fc_dictionaryByTransformingKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v4) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
  }
}

void __81__NSDictionary_FCAdditions__fc_dictionaryByTransformingKeysWithKeyAndValueBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v4) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
  }
}

void __58__NSDictionary_FCAdditions__fc_sortedEntriesWithKeyBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  v6 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v6)
  {
    v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
    if (!v7)
    {
      v7 = objc_opt_new();
      [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
    }
    [v7 setObject:v5 forKeyedSubscript:v8];
  }
}

void __83__NSDictionary_FCAdditions__fc_dictionaryByTransformingValuesWithKeyAndValueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3) {
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
  }
}

void __72__NSDictionary_FCAdditions__fc_dictionaryByTransformingValuesWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v3) {
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:v4];
  }
}

void __71__NSDictionary_FCAdditions__fc_dictionaryWithKeys_valueWithIndexBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v4)
  {
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "value");
    *(_DWORD *)buf = 136315906;
    v7 = "+[NSDictionary(FCAdditions) fc_dictionaryWithKeys:valueWithIndexBlock:]_block_invoke";
    __int16 v8 = 2080;
    v9 = "NSDictionary+FCAdditions.m";
    __int16 v10 = 1024;
    int v11 = 195;
    __int16 v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

void __61__NSDictionary_FCAdditions__fr_descriptionWithKeyComparator___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  [v2 appendFormat:@"\t%@ = %@;\n", v4, v5];
}

void __80__NSDictionary_FCAdditions__fc_dictionaryByMergingDictionary_withValueCombiner___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 addEntriesFromDictionary:*(void *)(a1 + 32)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__NSDictionary_FCAdditions__fc_dictionaryByMergingDictionary_withValueCombiner___block_invoke_2;
  v6[3] = &unk_1E5B59128;
  id v7 = v3;
  id v4 = *(void **)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

void __80__NSDictionary_FCAdditions__fc_dictionaryByMergingDictionary_withValueCombiner___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];

  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
    v9 = (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v5);
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v10];
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v10];
  }
}

uint64_t __72__NSDictionary_FCAdditions__fc_arrayByTransformingWithKeyAndValueBlock___block_invoke(uint64_t a1)
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

@end