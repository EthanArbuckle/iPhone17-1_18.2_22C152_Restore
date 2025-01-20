@interface UISelectorDictionary
@end

@implementation UISelectorDictionary

uint64_t __37___UISelectorDictionary_allSelectors__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addSelector:a2];
}

uint64_t __50___UISelectorDictionary_addEntriesFromDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forSelector:a2];
}

uint64_t __51___UISelectorDictionary_removeObjectsForSelectors___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObjectForSelector:a2];
}

@end