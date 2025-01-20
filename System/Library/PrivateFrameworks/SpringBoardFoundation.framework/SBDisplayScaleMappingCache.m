@interface SBDisplayScaleMappingCache
@end

@implementation SBDisplayScaleMappingCache

uint64_t __45___SBDisplayScaleMappingCache_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance___result;
  sharedInstance___result = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

@end