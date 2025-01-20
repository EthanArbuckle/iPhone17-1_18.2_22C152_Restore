@interface NUVisionInstanceSegmentationResult
@end

@implementation NUVisionInstanceSegmentationResult

void __62___NUVisionInstanceSegmentationResult_fullExtentForInstances___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) perInstanceProperties];
  v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v14 = [v4 objectForKeyedSubscript:v5];

  uint64_t v6 = [v14 size];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)&long long v8 = v6;
  *((void *)&v8 + 1) = v9;
  long long v10 = *(_OWORD *)(v7 + 32);
  long long v11 = *(_OWORD *)(v7 + 48);
  v17[0] = 0;
  v17[1] = 0;
  long long v18 = v8;
  long long v15 = v10;
  long long v16 = v11;
  NU::RectT<long>::add((uint64_t *)&v15, v17);
  long long v12 = v16;
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  *(_OWORD *)(v13 + 32) = v15;
  *(_OWORD *)(v13 + 48) = v12;
}

void __63___NUVisionInstanceSegmentationResult_tightBoundsForInstances___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = [*(id *)(a1 + 32) perInstanceProperties];
  v5 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  long long v7 = 0uLL;
  long long v8 = 0uLL;
  if (v6)
  {
    [v6 bounds];
    long long v8 = 0u;
    long long v7 = 0u;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v10 = *(_OWORD *)(v9 + 32);
  long long v11 = *(_OWORD *)(v9 + 48);
  v16[0] = v8;
  v16[1] = v7;
  long long v14 = v10;
  long long v15 = v11;
  NU::RectT<long>::add((uint64_t *)&v14, (uint64_t *)v16);
  long long v12 = v15;
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  *(_OWORD *)(v13 + 32) = v14;
  *(_OWORD *)(v13 + 48) = v12;
}

BOOL __139___NUVisionInstanceSegmentationResult_initWithObservation_usingTargetPoints_observationOrientation_observationScale_perInstanceProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  v4 = [NSNumber numberWithUnsignedInteger:a2];
  v5 = [v3 objectForKeyedSubscript:v4];

  [v5 density];
  BOOL v7 = v6 < *(double *)(a1 + 40) || *(double *)(a1 + 48) < v6;

  return v7;
}

@end