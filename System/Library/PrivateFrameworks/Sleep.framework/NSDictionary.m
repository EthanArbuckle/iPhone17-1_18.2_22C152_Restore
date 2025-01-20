@interface NSDictionary
@end

@implementation NSDictionary

uint64_t __58__NSDictionary_HKSPSleep__hksp_dictionaryByFilteringKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

void __36__NSDictionary_HKSPSleep__hksp_hash__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([v8 conformsToProtocol:&unk_1EFE665C8])
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v8 hash] ^ v6;
  }
  if ([v5 conformsToProtocol:&unk_1EFE665C8])
  {
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v5 hash] ^ v7;
  }
}

@end