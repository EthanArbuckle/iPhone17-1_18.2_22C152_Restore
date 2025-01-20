@interface UIPhysicalButtonSuccinctConfigurationsDescriptionForSet
@end

@implementation UIPhysicalButtonSuccinctConfigurationsDescriptionForSet

void ___UIPhysicalButtonSuccinctConfigurationsDescriptionForSet_block_invoke(uint64_t a1, void *a2)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = 48;
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    uint64_t v5 = 40;
  }
  uint64_t v6 = *(void *)(a1 + v5);
  v7 = _NSStringFromUIPhysicalButton([a2 _button]);
  [v4 appendFormat:@"%@%@ (%llu)", v6, v7, objc_msgSend(a2, "_generation")];

  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

@end