@interface PKFilteredDictionary
@end

@implementation PKFilteredDictionary

void ___PKFilteredDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v6]) {
    [*(id *)(a1 + 40) setObject:v5 forKey:v6];
  }
}

@end