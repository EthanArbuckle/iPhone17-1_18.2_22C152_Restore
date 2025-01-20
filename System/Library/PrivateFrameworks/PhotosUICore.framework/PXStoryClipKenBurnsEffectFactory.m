@interface PXStoryClipKenBurnsEffectFactory
+ (id)reusableInstances;
+ (void)factoryForSpec:(id)a3 clipComposition:(id)a4 displayAssets:(id)a5 croppingContext:(id)a6 croppingOptions:(unint64_t)a7 assetContentInfos:(id *)a8 playbackStyles:(const int64_t *)a9 separatorEffectParameters:(id *)a10 handler:(id)a11;
+ (void)genericFactoryForSpec:(id)a3 assetContentSize:(CGSize)a4 handler:(id)a5;
+ (void)releaseCachedResources;
- (CGRect)assetRectForClipIndex:(int64_t)a3;
- (CGRect)clipFrameForClipIndex:(int64_t)a3;
- (PXDisplayAssetFetchResult)displayAssets;
- (PXStoryClipComposition)clipComposition;
- (PXStoryClipKenBurnsEffectFactory)init;
- (PXStoryDisplayAssetCroppingContext)croppingContext;
- (PXStoryTimelineSpec)spec;
- (id)_init;
- (int64_t)numberOfParameters;
- (unint64_t)croppingOptions;
- (void)_configureClipAtIndex:(int64_t)a3 forPanWithCameraMovingTowardsEdge:(unsigned int)a4 distance:(double)a5;
- (void)_configureWithSpec:(id)a3 clipComposition:(id)a4 displayAssets:(id)a5 croppingContext:(id)a6 croppingOptions:(unint64_t)a7 assetContentInfos:(id *)a8 playbackStyles:(const int64_t *)a9 separatorEffectParameters:(id *)a10;
- (void)_getParameters:(id *)a3 forConfiguration:(id)a4;
- (void)dealloc;
- (void)getParameters:(id *)a3 forOppositePansWithDistance:(double)a4;
- (void)getParameters:(id *)a3 forPanWithCameraMovingTowardsEdge:(unsigned int)a4 distance:(double)a5;
- (void)getParameters:(id *)a3 forParallelPansWithDistance:(double)a4;
- (void)getParameters:(id *)a3 forRotationWithAngle:(double)a4 scale:(double)a5;
- (void)getParameters:(id *)a3 forRotationWithAngle:(double)a4 scale:(double)a5 relativeTransformOrigin:(CGPoint)a6;
- (void)getParameters:(id *)a3 forSplitAssetOppositePansWithDistance:(double)a4;
- (void)getParameters:(id *)a3 forVerticallyPanningPreferredRectMovingTowardsVerticalEdge:(unsigned int)a4;
- (void)getParameters:(id *)a3 forZoomWithScale:(double)a4;
- (void)getParameters:(id *)a3 forZoomWithScale:(double)a4 relativeTransformOrigin:(CGPoint)a5;
- (void)getParametersForNoEffect:(id *)a3;
@end

@implementation PXStoryClipKenBurnsEffectFactory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayAssets, 0);
  objc_storeStrong((id *)&self->_croppingContext, 0);
  objc_storeStrong((id *)&self->_clipComposition, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (int64_t)numberOfParameters
{
  return self->_numberOfParameters;
}

- (PXDisplayAssetFetchResult)displayAssets
{
  return self->_displayAssets;
}

- (unint64_t)croppingOptions
{
  return self->_croppingOptions;
}

- (PXStoryDisplayAssetCroppingContext)croppingContext
{
  return self->_croppingContext;
}

- (PXStoryClipComposition)clipComposition
{
  return self->_clipComposition;
}

- (PXStoryTimelineSpec)spec
{
  return self->_spec;
}

- (void)getParameters:(id *)a3 forRotationWithAngle:(double)a4 scale:(double)a5 relativeTransformOrigin:(CGPoint)a6
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __101__PXStoryClipKenBurnsEffectFactory_getParameters_forRotationWithAngle_scale_relativeTransformOrigin___block_invoke;
  v6[3] = &unk_1E5DD3630;
  CGPoint v7 = a6;
  v6[4] = self;
  double v8 = a5;
  double v9 = a4;
  [(PXStoryClipKenBurnsEffectFactory *)self _getParameters:a3 forConfiguration:v6];
}

void __101__PXStoryClipKenBurnsEffectFactory_getParameters_forRotationWithAngle_scale_relativeTransformOrigin___block_invoke()
{
}

- (void)getParameters:(id *)a3 forRotationWithAngle:(double)a4 scale:(double)a5
{
}

- (void)getParameters:(id *)a3 forSplitAssetOppositePansWithDistance:(double)a4
{
  if (self->_clipCount != 2)
  {
    double v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    [v8 handleFailureInMethod:a2, self, @"PXStoryClipKenBurnsEffect.m", 438, @"Invalid parameter not satisfying: %@", @"_clipCount == 2" object file lineNumber description];
  }
  v5 = [(PXStoryClipKenBurnsEffectFactory *)self displayAssets];
  [v5 objectAtIndexedSubscript:0];
  objc_claimAutoreleasedReturnValue();

  v6 = [(PXStoryClipKenBurnsEffectFactory *)self clipComposition];
  [v6 mainDividerAxis];

  PXRectWithOriginAndSize();
}

- (void)_configureClipAtIndex:(int64_t)a3 forPanWithCameraMovingTowardsEdge:(unsigned int)a4 distance:(double)a5
{
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  switch(a4)
  {
    case 0u:
      double v8 = 0.5;
      goto LABEL_5;
    case 1u:
      double v9 = 0.5;
      goto LABEL_7;
    case 2u:
      double v8 = -0.5;
LABEL_5:
      double v6 = a5 * v8;
      break;
    case 3u:
      double v9 = -0.5;
LABEL_7:
      double v7 = a5 * v9;
      break;
    default:
      break;
  }
  int64_t v10 = a3;
  v11 = &self->_clipSourceTransforms[a3];
  CGAffineTransformMakeTranslation(&v17, -v6, -v7);
  long long v12 = *(_OWORD *)&v17.a;
  long long v13 = *(_OWORD *)&v17.tx;
  *(_OWORD *)&v11->c = *(_OWORD *)&v17.c;
  *(_OWORD *)&v11->tx = v13;
  *(_OWORD *)&v11->a = v12;
  v14 = &self->_clipTargetTransforms[v10];
  CGAffineTransformMakeTranslation(&v17, v6, v7);
  long long v15 = *(_OWORD *)&v17.a;
  long long v16 = *(_OWORD *)&v17.tx;
  *(_OWORD *)&v14->c = *(_OWORD *)&v17.c;
  *(_OWORD *)&v14->tx = v16;
  *(_OWORD *)&v14->a = v15;
}

- (void)getParameters:(id *)a3 forParallelPansWithDistance:(double)a4
{
  if (self->_clipCount <= 1)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXStoryClipKenBurnsEffect.m", 397, @"Invalid parameter not satisfying: %@", @"_clipCount >= 2" object file lineNumber description];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__PXStoryClipKenBurnsEffectFactory_getParameters_forParallelPansWithDistance___block_invoke;
  v9[3] = &unk_1E5DD08D8;
  v9[4] = self;
  *(double *)&v9[5] = a4;
  [(PXStoryClipKenBurnsEffectFactory *)self _getParameters:a3 forConfiguration:v9];
}

__n128 __78__PXStoryClipKenBurnsEffectFactory_getParameters_forParallelPansWithDistance___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) clipComposition];
  uint64_t v3 = [v2 mainDividerAxis];

  switch(v3)
  {
    case 1:
      uint64_t v7 = 2;
LABEL_7:
      [*(id *)(a1 + 32) _configureClipAtIndex:0 forPanWithCameraMovingTowardsEdge:v7 distance:*(double *)(a1 + 40)];
      break;
    case 2:
      uint64_t v7 = 3;
      goto LABEL_7;
    case 0:
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryClipKenBurnsEffectFactory getParameters:forParallelPansWithDistance:]_block_invoke"];
      [v5 handleFailureInFunction:v6 file:@"PXStoryClipKenBurnsEffect.m" lineNumber:401 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(uint64_t *)(v8 + 40) >= 2)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 1;
    do
    {
      v11 = (_OWORD *)(*(void *)(v8 + 96) + v9);
      long long v12 = v11[1];
      v11[3] = *v11;
      v11[4] = v12;
      v11[5] = v11[2];
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 104) + v9;
      long long v14 = *(_OWORD *)(v13 + 16);
      *(_OWORD *)(v13 + 48) = *(_OWORD *)v13;
      *(_OWORD *)(v13 + 64) = v14;
      __n128 result = *(__n128 *)(v13 + 32);
      *(__n128 *)(v13 + 80) = result;
      ++v10;
      uint64_t v8 = *(void *)(a1 + 32);
      v9 += 48;
    }
    while (v10 < *(void *)(v8 + 40));
  }
  return result;
}

- (void)getParameters:(id *)a3 forOppositePansWithDistance:(double)a4
{
  if (self->_clipCount <= 1)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXStoryClipKenBurnsEffect.m", 374, @"Invalid parameter not satisfying: %@", @"_clipCount >= 2" object file lineNumber description];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__PXStoryClipKenBurnsEffectFactory_getParameters_forOppositePansWithDistance___block_invoke;
  v9[3] = &unk_1E5DD08D8;
  v9[4] = self;
  *(double *)&v9[5] = a4;
  [(PXStoryClipKenBurnsEffectFactory *)self _getParameters:a3 forConfiguration:v9];
}

__n128 __78__PXStoryClipKenBurnsEffectFactory_getParameters_forOppositePansWithDistance___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) clipComposition];
  uint64_t v3 = [v2 mainDividerAxis];

  switch(v3)
  {
    case 1:
      [*(id *)(a1 + 32) _configureClipAtIndex:0 forPanWithCameraMovingTowardsEdge:1 distance:*(double *)(a1 + 40)];
      uint64_t v7 = 3;
LABEL_7:
      [*(id *)(a1 + 32) _configureClipAtIndex:1 forPanWithCameraMovingTowardsEdge:v7 distance:*(double *)(a1 + 40)];
      break;
    case 2:
      [*(id *)(a1 + 32) _configureClipAtIndex:0 forPanWithCameraMovingTowardsEdge:2 distance:*(double *)(a1 + 40)];
      uint64_t v7 = 0;
      goto LABEL_7;
    case 0:
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryClipKenBurnsEffectFactory getParameters:forOppositePansWithDistance:]_block_invoke"];
      [v5 handleFailureInFunction:v6 file:@"PXStoryClipKenBurnsEffect.m" lineNumber:378 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(uint64_t *)(v8 + 40) >= 3)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 2;
    do
    {
      v11 = (_OWORD *)(*(void *)(v8 + 96) + v9);
      long long v12 = v11[1];
      v11[6] = *v11;
      v11[7] = v12;
      v11[8] = v11[2];
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 104) + v9;
      long long v14 = *(_OWORD *)(v13 + 16);
      *(_OWORD *)(v13 + 96) = *(_OWORD *)v13;
      *(_OWORD *)(v13 + 112) = v14;
      __n128 result = *(__n128 *)(v13 + 32);
      *(__n128 *)(v13 + 128) = result;
      ++v10;
      uint64_t v8 = *(void *)(a1 + 32);
      v9 += 48;
    }
    while (v10 < *(void *)(v8 + 40));
  }
  return result;
}

- (void)getParameters:(id *)a3 forVerticallyPanningPreferredRectMovingTowardsVerticalEdge:(unsigned int)a4
{
  if (self->_clipCount != 1)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXStoryClipKenBurnsEffect.m", 331, @"Invalid parameter not satisfying: %@", @"_clipCount == 1" object file lineNumber description];
  }
  if ((a4 & 0xFFFFFFFD) != 1)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXStoryClipKenBurnsEffect.m", 332, @"Invalid parameter not satisfying: %@", @"edge == CGRectMinYEdge || edge == CGRectMaxYEdge" object file lineNumber description];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __109__PXStoryClipKenBurnsEffectFactory_getParameters_forVerticallyPanningPreferredRectMovingTowardsVerticalEdge___block_invoke;
  v10[3] = &unk_1E5DC4D00;
  v10[4] = self;
  v10[5] = a2;
  unsigned int v11 = a4;
  [(PXStoryClipKenBurnsEffectFactory *)self _getParameters:a3 forConfiguration:v10];
}

void __109__PXStoryClipKenBurnsEffectFactory_getParameters_forVerticallyPanningPreferredRectMovingTowardsVerticalEdge___block_invoke()
{
}

- (void)getParameters:(id *)a3 forPanWithCameraMovingTowardsEdge:(unsigned int)a4 distance:(double)a5
{
  if (self->_clipCount != 1)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXStoryClipKenBurnsEffect.m", 320, @"Invalid parameter not satisfying: %@", @"_clipCount == 1" object file lineNumber description];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__PXStoryClipKenBurnsEffectFactory_getParameters_forPanWithCameraMovingTowardsEdge_distance___block_invoke;
  v11[3] = &unk_1E5DC4D00;
  v11[4] = self;
  unsigned int v12 = a4;
  *(double *)&v11[5] = a5;
  [(PXStoryClipKenBurnsEffectFactory *)self _getParameters:a3 forConfiguration:v11];
}

__n128 __93__PXStoryClipKenBurnsEffectFactory_getParameters_forPanWithCameraMovingTowardsEdge_distance___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureClipAtIndex:0 forPanWithCameraMovingTowardsEdge:*(unsigned int *)(a1 + 48) distance:*(double *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(uint64_t *)(v3 + 40) >= 2)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 1;
    do
    {
      double v6 = (_OWORD *)(*(void *)(v3 + 96) + v4);
      long long v7 = v6[1];
      v6[3] = *v6;
      v6[4] = v7;
      void v6[5] = v6[2];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 104) + v4;
      long long v9 = *(_OWORD *)(v8 + 16);
      *(_OWORD *)(v8 + 48) = *(_OWORD *)v8;
      *(_OWORD *)(v8 + 64) = v9;
      __n128 result = *(__n128 *)(v8 + 32);
      *(__n128 *)(v8 + 80) = result;
      ++v5;
      uint64_t v3 = *(void *)(a1 + 32);
      v4 += 48;
    }
    while (v5 < *(void *)(v3 + 40));
  }
  return result;
}

- (void)getParameters:(id *)a3 forZoomWithScale:(double)a4 relativeTransformOrigin:(CGPoint)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91__PXStoryClipKenBurnsEffectFactory_getParameters_forZoomWithScale_relativeTransformOrigin___block_invoke;
  v5[3] = &unk_1E5DD01C8;
  CGPoint v6 = a5;
  v5[4] = self;
  double v7 = a4;
  [(PXStoryClipKenBurnsEffectFactory *)self _getParameters:a3 forConfiguration:v5];
}

void __91__PXStoryClipKenBurnsEffectFactory_getParameters_forZoomWithScale_relativeTransformOrigin___block_invoke()
{
}

- (void)getParameters:(id *)a3 forZoomWithScale:(double)a4
{
}

- (void)getParametersForNoEffect:(id *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__PXStoryClipKenBurnsEffectFactory_getParametersForNoEffect___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXStoryClipKenBurnsEffectFactory *)self _getParameters:a3 forConfiguration:v3];
}

uint64_t __61__PXStoryClipKenBurnsEffectFactory_getParametersForNoEffect___block_invoke(uint64_t result)
{
  v1 = *(void **)(result + 32);
  if ((uint64_t)v1[5] >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    long long v4 = *MEMORY[0x1E4F1DAB8];
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    do
    {
      double v7 = (_OWORD *)(v1[12] + v2);
      uint64_t v8 = (_OWORD *)(v1[13] + v2);
      *uint64_t v8 = v4;
      v8[1] = v5;
      v8[2] = v6;
      *double v7 = v4;
      v7[1] = v5;
      v7[2] = v6;
      ++v3;
      v1 = *(void **)(result + 32);
      v2 += 48;
    }
    while (v3 < v1[5]);
  }
  return result;
}

- (void)_getParameters:(id *)a3 forConfiguration:(id)a4
{
  long long v6 = (void (**)(void))a4;
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, 0.0, 0.0);
  long long v5 = (void *)[(PXStoryClipComposition *)self->_clipComposition clipAssetIndexes];
  if (self->_clipCount >= 1)
  {
    [(PXDisplayAssetFetchResult *)self->_displayAssets objectAtIndexedSubscript:*v5];
    objc_claimAutoreleasedReturnValue();
    PXRectWithOriginAndSize();
  }
  v6[2]();
  if (self->_clipCount >= 1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__PXStoryClipKenBurnsEffectFactory__getParameters_forConfiguration___block_invoke;
    aBlock[3] = &unk_1E5DBCDC0;
    CGAffineTransform v9 = v11;
    SEL v10 = a2;
    aBlock[4] = self;
    _Block_copy(aBlock);
    PXRectWithOriginAndSize();
  }
}

__n128 __68__PXStoryClipKenBurnsEffectFactory__getParameters_forConfiguration___block_invoke@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X1>, __n128 *a3@<X8>)
{
  __n128 v5 = a2[1];
  *(__n128 *)&t1.a = *a2;
  *(__n128 *)&t1.c = v5;
  *(__n128 *)&t1.tx = a2[2];
  long long v6 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v9.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&v9.c = v6;
  *(_OWORD *)&v9.tx = *(_OWORD *)(a1 + 72);
  if (CGAffineTransformEqualToTransform(&t1, &v9)) {
    PXAssertGetLog();
  }
  __n128 v7 = a2[1];
  *a3 = *a2;
  a3[1] = v7;
  __n128 result = a2[2];
  a3[2] = result;
  return result;
}

BOOL __68__PXStoryClipKenBurnsEffectFactory__getParameters_forConfiguration___block_invoke_22(double a1, double a2, double a3, double a4)
{
  BOOL result = CGRectIsEmpty(*(CGRect *)&a1);
  if (!result) {
    PXRectFlippedVertically();
  }
  return result;
}

- (CGRect)clipFrameForClipIndex:(int64_t)a3
{
  if (self->_clipCount <= a3) {
    uint64_t v3 = (CGRect *)MEMORY[0x1E4F1DB20];
  }
  else {
    uint64_t v3 = &self->_clipFrames[a3];
  }
  double width = v3->size.width;
  double height = v3->size.height;
  double x = v3->origin.x;
  double y = v3->origin.y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)assetRectForClipIndex:(int64_t)a3
{
  if (self->_clipCount > a3) {
    PXRectWithOriginAndSize();
  }
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)_configureWithSpec:(id)a3 clipComposition:(id)a4 displayAssets:(id)a5 croppingContext:(id)a6 croppingOptions:(unint64_t)a7 assetContentInfos:(id *)a8 playbackStyles:(const int64_t *)a9 separatorEffectParameters:(id *)a10
{
  id v22 = a3;
  id v21 = a4;
  id v17 = a5;
  id v18 = a6;
  objc_storeStrong((id *)&self->_spec, a3);
  objc_storeStrong((id *)&self->_clipComposition, a4);
  objc_storeStrong((id *)&self->_displayAssets, a5);
  objc_storeStrong((id *)&self->_croppingContext, a6);
  self->_croppingOptions = a7;
  int64_t v19 = [(PXStoryClipComposition *)self->_clipComposition numberOfClips];
  self->_clipCount = v19;
  if (v19 <= 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXStoryClipKenBurnsEffect.m", 149, @"Invalid parameter not satisfying: %@", @"_clipCount >= 1", v21, v22 object file lineNumber description];
  }
  _PXGArrayCapacityResizeToCount();
}

- (void)dealloc
{
  free(self->_clipFrames);
  free(self->_clipSafeAreaInsets);
  free(self->_clipAssetIndexes);
  free(self->_clipAssetSizes);
  free(self->_clipSuggestedCrops);
  free(self->_clipSourceTransforms);
  free(self->_clipTargetTransforms);
  free(self->_assetContentInfos);
  free(self->_assetPlaybackStyles);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryClipKenBurnsEffectFactory;
  [(PXStoryClipKenBurnsEffectFactory *)&v3 dealloc];
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryClipKenBurnsEffectFactory;
  return [(PXStoryClipKenBurnsEffectFactory *)&v3 init];
}

- (PXStoryClipKenBurnsEffectFactory)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryClipKenBurnsEffect.m", 121, @"%s is not available as initializer", "-[PXStoryClipKenBurnsEffectFactory init]");

  abort();
}

+ (void)genericFactoryForSpec:(id)a3 assetContentSize:(CGSize)a4 handler:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  +[PXStoryClipCompositionFactory oneUpComposition];
  objc_claimAutoreleasedReturnValue();
  id v10 = objc_alloc((Class)off_1E5DA94B0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__PXStoryClipKenBurnsEffectFactory_genericFactoryForSpec_assetContentSize_handler___block_invoke;
  v11[3] = &__block_descriptor_48_e35_v16__0___PXMutableSyntheticAsset__8l;
  *(CGFloat *)&v11[4] = width;
  *(CGFloat *)&v11[5] = height;
  v12[0] = [v10 initWithConfiguration:v11];
  [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  objc_claimAutoreleasedReturnValue();
  PXDisplayAssetFetchResultFromArray();
}

uint64_t __83__PXStoryClipKenBurnsEffectFactory_genericFactoryForSpec_assetContentSize_handler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

+ (void)factoryForSpec:(id)a3 clipComposition:(id)a4 displayAssets:(id)a5 croppingContext:(id)a6 croppingOptions:(unint64_t)a7 assetContentInfos:(id *)a8 playbackStyles:(const int64_t *)a9 separatorEffectParameters:(id *)a10 handler:(id)a11
{
  id v27 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  int64_t v19 = (void (**)(id, void *))a11;
  id v20 = [a1 reusableInstances];
  objc_sync_enter(v20);
  id v21 = objc_msgSend(v20, "px_popLast");
  id v22 = v21;
  if (v21) {
    id v23 = v21;
  }
  else {
    id v23 = [[PXStoryClipKenBurnsEffectFactory alloc] _init];
  }
  v24 = v23;

  objc_sync_exit(v20);
  [v24 _configureWithSpec:v27 clipComposition:v16 displayAssets:v17 croppingContext:v18 croppingOptions:a7 assetContentInfos:a8 playbackStyles:a9 separatorEffectParameters:a10];
  v19[2](v19, v24);
  id v25 = v20;
  objc_sync_enter(v25);
  [v25 addObject:v24];
  objc_sync_exit(v25);
}

+ (void)releaseCachedResources
{
  id obj = [a1 reusableInstances];
  objc_sync_enter(obj);
  [obj removeAllObjects];
  objc_sync_exit(obj);
}

+ (id)reusableInstances
{
  if (reusableInstances_onceToken != -1) {
    dispatch_once(&reusableInstances_onceToken, &__block_literal_global_127940);
  }
  uint64_t v2 = (void *)reusableInstances_reusableInstances;
  return v2;
}

void __53__PXStoryClipKenBurnsEffectFactory_reusableInstances__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v1 = (void *)reusableInstances_reusableInstances;
  reusableInstances_reusableInstances = (uint64_t)v0;
}

@end