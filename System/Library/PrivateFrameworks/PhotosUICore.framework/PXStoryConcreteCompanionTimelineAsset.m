@interface PXStoryConcreteCompanionTimelineAsset
@end

@implementation PXStoryConcreteCompanionTimelineAsset

void __66___PXStoryConcreteCompanionTimelineAsset_colorNormalizationEffect__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if ((unint64_t)(a3 - 1) <= 1)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    id v6 = v7;
  }
}

@end