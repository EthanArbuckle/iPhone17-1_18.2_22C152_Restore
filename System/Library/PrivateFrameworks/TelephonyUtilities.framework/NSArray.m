@interface NSArray
@end

@implementation NSArray

uint64_t __73__NSArray_TelephonyUtilitiesAdditions__tu_mapAndFilterObjectsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }

  return MEMORY[0x1F41817F8]();
}

uint64_t __69__NSArray_TelephonyUtilitiesAdditions__tu_containsObjectPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__NSArray_TelephonyUtilitiesAdditions__tu_firstObjectPassingTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end