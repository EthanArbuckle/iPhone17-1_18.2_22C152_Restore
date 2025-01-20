@interface NSDictionary
@end

@implementation NSDictionary

void __61__NSDictionary_WLKAdditions__wlk_caseInsensitiveValueForKey___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![*(id *)(a1 + 32) caseInsensitiveCompare:v8])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

void __55__NSDictionary_WLKAdditions__wlk_dictionaryDifference___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  if (([v5 isEqual:v6] & 1) == 0) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v7];
  }
}

void __55__NSDictionary_WLKAdditions__wlk_dictionaryDifference___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  if (!v6) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v7];
  }
}

@end