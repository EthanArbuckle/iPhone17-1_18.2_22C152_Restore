@interface NUVideoProperties
@end

@implementation NUVideoProperties

uint64_t __41___NUVideoProperties_metadataItemForKey___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 key];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

@end