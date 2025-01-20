@interface UIActivityMatchingContext
@end

@implementation UIActivityMatchingContext

uint64_t __70___UIActivityMatchingContext_activitiesByFilteringExcludedActivities___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldExcludeActivity:a2] ^ 1;
}

@end