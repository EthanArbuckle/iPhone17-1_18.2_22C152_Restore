@interface NSMutableDictionary
@end

@implementation NSMutableDictionary

void __77__NSMutableDictionary_FCAdditions__fc_mergeWithDictionary_withValueCombiner___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];

  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
    v9 = (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v5);
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v10];
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v10];
  }
}

@end