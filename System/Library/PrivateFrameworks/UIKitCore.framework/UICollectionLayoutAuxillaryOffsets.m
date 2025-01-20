@interface UICollectionLayoutAuxillaryOffsets
@end

@implementation UICollectionLayoutAuxillaryOffsets

void __55___UICollectionLayoutAuxillaryOffsets_initWithOffsets___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (id)[a3 mutableCopy];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v5 forKeyedSubscript:a2];
}

void __50___UICollectionLayoutAuxillaryOffsets_description__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(a1 + 32) appendString:@", "];
  }
  [*(id *)(a1 + 32) appendFormat:@"%@:", a2];
  v6.location = [*(id *)(a1 + 40) rangeForElementKind:a2];
  v4 = *(void **)(a1 + 32);
  id v5 = NSStringFromRange(v6);
  [v4 appendFormat:@"%@"], v5);

  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

@end