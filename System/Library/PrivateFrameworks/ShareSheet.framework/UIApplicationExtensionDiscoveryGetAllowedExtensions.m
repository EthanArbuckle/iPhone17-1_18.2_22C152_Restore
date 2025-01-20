@interface UIApplicationExtensionDiscoveryGetAllowedExtensions
@end

@implementation UIApplicationExtensionDiscoveryGetAllowedExtensions

uint64_t ___UIApplicationExtensionDiscoveryGetAllowedExtensions_block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

@end