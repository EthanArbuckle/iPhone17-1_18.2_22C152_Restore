@interface UIFocusCollectionViewSectionContainerGuideRegion
@end

@implementation UIFocusCollectionViewSectionContainerGuideRegion

void __114___UIFocusCollectionViewSectionContainerGuideRegion__fallbackFocusItemForMovementRequest_inFocusMap_withSnapshot___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v8.receiver = *(id *)(a1 + 56);
  v8.super_class = (Class)_UIFocusCollectionViewSectionContainerGuideRegion;
  uint64_t v5 = objc_msgSendSuper2(&v8, sel__fallbackFocusItemForMovementRequest_inFocusMap_withSnapshot_, v2, v3, v4);
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

@end