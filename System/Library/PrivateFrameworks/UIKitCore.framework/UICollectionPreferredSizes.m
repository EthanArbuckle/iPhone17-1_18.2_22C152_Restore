@interface UICollectionPreferredSizes
@end

@implementation UICollectionPreferredSizes

void __90___UICollectionPreferredSizes_preferredSizesApplyingFrameOffset_supplementaryBaseOffsets___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) rangeForElementKind:a2];
  if (v7) {
    uint64_t v8 = v6 + v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = -[_UICollectionPreferredSizes initWithSizes:indexes:supplementarySizesDict:frameOffset:supplementaryBaseOffsets:]([_UICollectionPreferredSizes alloc], *(void **)(a3 + 8), *(void **)(a3 + 16), 0, v8, 0);
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:a2];
}

void __59___UICollectionPreferredSizes_copyByDirtyingPreferredSizes__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v5 = -[_UICollectionPreferredSize initWithOriginalSize:fittingSize:layoutSize:additionalData:]([_UICollectionPreferredSize alloc], *(void **)(a3 + 40), *(void **)(a3 + 56), *(double *)(a3 + 8), *(double *)(a3 + 16), *(double *)(a3 + 24), *(double *)(a3 + 32));
    *((unsigned char *)v5 + 48) = 1;
  }
  else
  {
    v5 = 0;
  }
  uint64_t v6 = v5;
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:a2];
}

void __59___UICollectionPreferredSizes_copyByDirtyingPreferredSizes__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = (id)-[_UICollectionPreferredSizes copyByDirtyingPreferredSizes](a3);
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:a2];
}

void __46___UICollectionPreferredSizes_largestItemSize__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -[_UICollectionPreferredSizes objectAtIndexedSubscript:](*(void *)(a1 + 32), a2);
  if (v3) {
    float64x2_t v4 = *(float64x2_t *)(v3 + 24);
  }
  else {
    float64x2_t v4 = 0uLL;
  }
  *(float64x2_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = vmaxnmq_f64(v4, *(float64x2_t *)(*(void *)(*(void *)(a1 + 40)+ 8)+ 32));
}

@end