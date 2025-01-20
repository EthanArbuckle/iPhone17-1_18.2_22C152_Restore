@interface PXZoomablePhotosAlphaAnimator
- (BOOL)isAnimating;
- (BOOL)isBeingMutated;
- (NSArray)allowedColumns;
- (PXAlphaTransitionInfo)_transitionInfoForValue:(double)a3;
- (PXZoomablePhotosAlphaAnimator)init;
- (double)_targetColumnIndex;
- (double)autoFadeAmount;
- (double)autoFadeColumnIndex;
- (double)columnIndex;
- (double)presentationAutoFadeAmount;
- (double)presentationColumnIndex;
- (double)targetColumnIndex;
- (id)description;
- (int64_t)maxColumnsForAspectFit;
- (void)_invalidatePresentationValue;
- (void)_resetAnimatedValues;
- (void)_tick:(id)a3;
- (void)_updatePresentationValue;
- (void)_updateTransitionInfo;
- (void)dealloc;
- (void)didPerformChanges;
- (void)performChanges:(id)a3;
- (void)performChangesWithAnimation:(BOOL)a3 changeBlock:(id)a4;
- (void)setAllowedColumns:(id)a3;
- (void)setAutoFadeAmount:(double)a3;
- (void)setAutoFadeColumnIndex:(double)a3;
- (void)setColumnIndex:(double)a3;
- (void)setIsAnimating:(BOOL)a3;
- (void)setMaxColumnsForAspectFit:(int64_t)a3;
- (void)setPresentationAutoFadeAmount:(double)a3;
- (void)setPresentationColumnIndex:(double)a3;
- (void)setTargetColumnIndex:(double)a3;
@end

@implementation PXZoomablePhotosAlphaAnimator

uint64_t __73__PXZoomablePhotosAlphaAnimator_performChangesWithAnimation_changeBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(v2 + 1008);
  *(unsigned char *)(v2 + 1008) = *(unsigned char *)(a1 + 48) ^ 1;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (!*(unsigned char *)(a1 + 48)) {
    uint64_t result = [*(id *)(a1 + 32) _resetAnimatedValues];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1008) = v3;
  return result;
}

- (void)setPresentationAutoFadeAmount:(double)a3
{
  if (self->_presentationAutoFadeAmount != a3)
  {
    self->_presentationAutoFadeAmount = a3;
    [(PXZoomablePhotosAlphaAnimator *)self _invalidatePresentationValue];
  }
}

- (void)setAutoFadeAmount:(double)a3
{
}

- (void)setTargetColumnIndex:(double)a3
{
  if (self->_targetColumnIndex != a3)
  {
    self->_targetColumnIndex = a3;
    [(PXZoomablePhotosAlphaAnimator *)self _invalidatePresentationValue];
  }
}

- (void)setColumnIndex:(double)a3
{
  if (self->_columnIndex != a3) {
    PXFloatSign();
  }
}

- (void)_invalidatePresentationValue
{
  [(PXZoomablePhotosAlphaAnimator *)self signalChange:0];
  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 2) != 0)
  {
    char v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v4 = [NSString stringWithUTF8String:"-[PXZoomablePhotosAlphaAnimator _invalidatePresentationValue]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PXZoomablePhotosAlphaAnimator.m", 448, @"invalidating %lu after it already has been updated", 2);

    abort();
  }
  self->_updateFlags.needsUpdate |= 2uLL;
}

- (void)didPerformChanges
{
  v12.receiver = self;
  v12.super_class = (Class)PXZoomablePhotosAlphaAnimator;
  [(PXZoomablePhotosAlphaAnimator *)&v12 didPerformChanges];
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = [NSString stringWithUTF8String:"-[PXZoomablePhotosAlphaAnimator didPerformChanges]"];
      [v6 handleFailureInFunction:v7, @"PXZoomablePhotosAlphaAnimator.m", 367, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXZoomablePhotosAlphaAnimator *)self _updateTransitionInfo];
      if (!self->_updateFlags.isPerformingUpdate)
      {
        v10 = [MEMORY[0x1E4F28B00] currentHandler];
        v11 = [NSString stringWithUTF8String:"-[PXZoomablePhotosAlphaAnimator didPerformChanges]"];
        [v10 handleFailureInFunction:v11, @"PXZoomablePhotosAlphaAnimator.m", 371, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXZoomablePhotosAlphaAnimator *)self _updatePresentationValue];
      unint64_t v5 = p_updateFlags->needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 0;
    if (v5)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      v9 = [NSString stringWithUTF8String:"-[PXZoomablePhotosAlphaAnimator didPerformChanges]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXZoomablePhotosAlphaAnimator.m", 374, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
}

- (void)setIsAnimating:(BOOL)a3
{
  if (self->_isAnimating != a3)
  {
    self->_isAnimating = a3;
    [(PXDisplayLink *)self->_displayLink setPaused:!a3];
    if (!a3) {
      self->_lastTickTime = 0.0;
    }
    [(PXZoomablePhotosAlphaAnimator *)self signalChange:4];
  }
}

- (void)_updatePresentationValue
{
  [(PXZoomablePhotosAlphaAnimator *)self columnIndex];
  [(PXZoomablePhotosAlphaAnimator *)self autoFadeColumnIndex];
  double v4 = v3;
  [(PXZoomablePhotosAlphaAnimator *)self presentationAutoFadeAmount];
  [(PXZoomablePhotosAlphaAnimator *)self _targetColumnIndex];
  if (v4 == v5) {
    [(PXZoomablePhotosAlphaAnimator *)self autoFadeAmount];
  }
  if ([(PXZoomablePhotosAlphaAnimator *)self _transitionInfoForValue:v4]) {
    PXFloatProgressBetween();
  }
  PXFloatByLinearlyInterpolatingFloats();
}

- (void)setPresentationColumnIndex:(double)a3
{
  if (self->_presentationColumnIndex != a3)
  {
    self->_presentationColumnIndex = a3;
    [(PXZoomablePhotosAlphaAnimator *)self signalChange:2];
  }
}

- (double)presentationAutoFadeAmount
{
  return self->_presentationAutoFadeAmount;
}

- (double)autoFadeColumnIndex
{
  return self->_autoFadeColumnIndex;
}

- (double)_targetColumnIndex
{
  [(PXZoomablePhotosAlphaAnimator *)self columnIndex];
  double v4 = v3;
  [(PXZoomablePhotosAlphaAnimator *)self columnIndex];
  double v5 = -[PXZoomablePhotosAlphaAnimator _transitionInfoForValue:](self, "_transitionInfoForValue:");
  if (v5)
  {
    if (self->_currentDirection <= 0.0)
    {
      if (v4 < v5->autoFadeLeftValue && v5->fadeRangeMin < v4) {
        return v5->fadeRangeMin;
      }
    }
    else if (v4 > v5->autoFadeRightValue && v5->fadeRangeMax >= v4)
    {
      return v5->fadeRangeMax;
    }
  }
  return v4;
}

- (void)_resetAnimatedValues
{
  [(PXZoomablePhotosAlphaAnimator *)self columnIndex];
  -[PXZoomablePhotosAlphaAnimator setAutoFadeColumnIndex:](self, "setAutoFadeColumnIndex:");
  [(PXZoomablePhotosAlphaAnimator *)self autoFadeAmount];
  -[PXZoomablePhotosAlphaAnimator setPresentationAutoFadeAmount:](self, "setPresentationAutoFadeAmount:");
}

- (double)columnIndex
{
  return self->_columnIndex;
}

- (double)autoFadeAmount
{
  return self->_autoFadeAmount;
}

- (void)setAutoFadeColumnIndex:(double)a3
{
  if (self->_autoFadeColumnIndex != a3)
  {
    self->_autoFadeColumnIndex = a3;
    [(PXZoomablePhotosAlphaAnimator *)self _invalidatePresentationValue];
  }
}

- (PXAlphaTransitionInfo)_transitionInfoForValue:(double)a3
{
  int64_t layerCount = self->_layerCount;
  BOOL v4 = layerCount < 2;
  uint64_t v5 = layerCount - 2;
  if (v4) {
    return 0;
  }
  int64_t v7 = vcvtmd_s64_f64(a3);
  if (v5 >= v7) {
    uint64_t v5 = v7;
  }
  return &self->_transitionInfos[v5 & ~(v5 >> 63)];
}

- (void)_updateTransitionInfo
{
  id v14 = [(PXZoomablePhotosAlphaAnimator *)self allowedColumns];
  int64_t v3 = [v14 count];
  self->_int64_t layerCount = v3;
  if (v3 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 176;
    uint64_t v6 = 576;
    do
    {
      int64_t v7 = [v14 objectAtIndexedSubscript:v4];
      uint64_t v8 = [v7 integerValue];

      v9 = (char *)self + v5;
      v10 = (char *)self + v6;
      v11 = (char *)self + v6 - 48;
      if (!v4) {
        v11 = 0;
      }
      if (v3 - 1 == v4) {
        v10 = 0;
      }
      *(void *)v9 = v4;
      *((void *)v9 + 1) = v8;
      *((double *)v9 + 2) = 1.0 / (double)v8;
      *((void *)v9 + 3) = v11;
      *((void *)v9 + 4) = v10;
      ++v4;
      v6 += 48;
      v5 += 40;
    }
    while (v3 != v4);
  }
  objc_super v12 = +[PXZoomablePhotosSettings sharedInstance];
  [v12 minAcceptableCoverage];
  int64_t v13 = [(PXZoomablePhotosAlphaAnimator *)self maxColumnsForAspectFit];
  if (v3 >= 2)
  {
    if (self->_layers[0].columns <= v13 != self->_layers[1].columns > v13)
    {
      [v12 alphaMaxAcceptableScale];
      [v12 alphaMinAcceptableCoverage];
    }
    PXFloatSaturate();
  }
  [(PXZoomablePhotosAlphaAnimator *)self columnIndex];
  -[PXZoomablePhotosAlphaAnimator setAutoFadeColumnIndex:](self, "setAutoFadeColumnIndex:");
  [(PXZoomablePhotosAlphaAnimator *)self _invalidatePresentationValue];
}

- (int64_t)maxColumnsForAspectFit
{
  return self->_maxColumnsForAspectFit;
}

- (void)performChangesWithAnimation:(BOOL)a3 changeBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__PXZoomablePhotosAlphaAnimator_performChangesWithAnimation_changeBlock___block_invoke;
  v8[3] = &unk_1E5DCBCE0;
  BOOL v10 = a3;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(PXZoomablePhotosAlphaAnimator *)self performChanges:v8];
}

- (void)performChanges:(id)a3
{
  BOOL isBeingMutated = self->_isBeingMutated;
  self->_BOOL isBeingMutated = 1;
  v5.receiver = self;
  v5.super_class = (Class)PXZoomablePhotosAlphaAnimator;
  [(PXZoomablePhotosAlphaAnimator *)&v5 performChanges:a3];
  self->_BOOL isBeingMutated = isBeingMutated;
}

- (NSArray)allowedColumns
{
  return self->_allowedColumns;
}

- (double)presentationColumnIndex
{
  return self->_presentationColumnIndex;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setAllowedColumns:(id)a3
{
  id v14 = (NSArray *)a3;
  objc_super v5 = self->_allowedColumns;
  if (v5 == v14)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(NSArray *)v5 isEqual:v14];

    uint64_t v8 = v14;
    if (v7) {
      goto LABEL_10;
    }
    if ([(NSArray *)v14 count] >= 0xB)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"PXZoomablePhotosAlphaAnimator.m", 152, @"Invalid parameter not satisfying: %@", @"allowedColumns.count <= PXZoomablePhotosMaxLayers" object file lineNumber description];
    }
    id v9 = (NSArray *)[(NSArray *)v14 copy];
    allowedColumns = self->_allowedColumns;
    self->_allowedColumns = v9;

    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
    {
      objc_super v12 = [MEMORY[0x1E4F28B00] currentHandler];
      int64_t v13 = [NSString stringWithUTF8String:"-[PXZoomablePhotosAlphaAnimator setAllowedColumns:]"];
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"PXZoomablePhotosAlphaAnimator.m", 154, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    self->_updateFlags.needsUpdate |= 1uLL;
  }
  uint64_t v8 = v14;
LABEL_10:
}

- (PXZoomablePhotosAlphaAnimator)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXZoomablePhotosAlphaAnimator;
  uint64_t v2 = [(PXZoomablePhotosAlphaAnimator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc((Class)off_1E5DA6208) initWithWeakTarget:v2 selector:sel__tick_ deferredStart:1];
    displayLink = v2->_displayLink;
    v2->_displayLink = (PXDisplayLink *)v3;

    [(PXDisplayLink *)v2->_displayLink setFrameRateRangeType:2];
    [(PXDisplayLink *)v2->_displayLink setHighFrameRateReason:2228226];
    [(PXDisplayLink *)v2->_displayLink setPaused:1];
  }
  return v2;
}

- (void)setMaxColumnsForAspectFit:(int64_t)a3
{
  if (self->_maxColumnsForAspectFit != a3)
  {
    self->_maxColumnsForAspectFit = a3;
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
    {
      uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"-[PXZoomablePhotosAlphaAnimator setMaxColumnsForAspectFit:]"];
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PXZoomablePhotosAlphaAnimator.m", 162, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    self->_updateFlags.needsUpdate |= 1uLL;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedColumns, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (BOOL)isBeingMutated
{
  return self->_isBeingMutated;
}

- (double)targetColumnIndex
{
  return self->_targetColumnIndex;
}

- (void)_tick:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__PXZoomablePhotosAlphaAnimator__tick___block_invoke;
  v7[3] = &unk_1E5DCBD08;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)PXZoomablePhotosAlphaAnimator;
  id v5 = v4;
  [(PXZoomablePhotosAlphaAnimator *)&v6 performChanges:v7];
}

void __39__PXZoomablePhotosAlphaAnimator__tick___block_invoke(uint64_t a1)
{
  id v8 = +[PXZoomablePhotosSettings sharedInstance];
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(double *)(*(void *)(a1 + 32) + 128) == 0.0)
  {
    [v2 duration];
    double v5 = v6;
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else
  {
    [v2 currentMediaTime];
    uint64_t v3 = *(void *)(a1 + 32);
    double v5 = v4 - *(double *)(v3 + 128);
  }
  double v7 = *(double *)(v3 + 152);
  *(void *)(v3 + 152) = 0;
  *(double *)(*(void *)(a1 + 32) + 160) = *(double *)(*(void *)(a1 + 32) + 160) * 0.8 + v7 / v5 * 0.2;
  [*(id *)(a1 + 32) _targetColumnIndex];
  [v8 alphaCrossfadeMaxDuration];
  [v8 alphaCrossfadeMinDuration];
  [*(id *)(a1 + 32) autoFadeColumnIndex];
  PXFloatSign();
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  [(PXZoomablePhotosAlphaAnimator *)self columnIndex];
  uint64_t v7 = v6;
  [(PXZoomablePhotosAlphaAnimator *)self presentationColumnIndex];
  uint64_t v9 = v8;
  int64_t layerCount = self->_layerCount;
  BOOL v11 = [(PXZoomablePhotosAlphaAnimator *)self isAnimating];
  objc_super v12 = @"NO";
  if (v11) {
    objc_super v12 = @"YES";
  }
  int64_t v13 = v12;
  objc_msgSend(v3, "appendFormat:", @"<%@:%p; columnIndex:%.2f presentationColumnIndex:%.2f layers:%ld isAnimating:%@\n",
    v5,
    self,
    v7,
    v9,
    layerCount,
    v13);

  if (self->_layerCount >= 1)
  {
    [v3 appendFormat:@"\nlayers:\n"];
    if (self->_layerCount >= 1)
    {
      int64_t v14 = 0;
      layers = self->_layers;
      do
      {
        v16 = [NSString stringWithFormat:@"{%p: columnIndex:%ld, columns:%ld, itemWidth:%.3f, leftTransition:%p, rightTransition:%p}", layers, layers->columnIndex, layers->columns, *(void *)&layers->itemWidth, layers->leftTransition, layers->rightTransition];
        [v3 appendFormat:@" %ld: %@\n", v14, v16];

        ++v14;
        ++layers;
      }
      while (v14 < self->_layerCount);
    }
    [v3 appendFormat:@"transitionInfos:\n"];
    if (self->_layerCount > 1)
    {
      int64_t v17 = 0;
      transitionInfos = self->_transitionInfos;
      do
      {
        v19 = [NSString stringWithFormat:@"{%p: fadeRange:[%.2f, %.2f] autoFadeLeft:%.2f autoFadeRight:%.2f leftLayer:%p rightLayer:%p}", transitionInfos, *(void *)&transitionInfos->fadeRangeMin, *(void *)&transitionInfos->fadeRangeMax, *(void *)&transitionInfos->autoFadeLeftValue, *(void *)&transitionInfos->autoFadeRightValue, transitionInfos->leftLayer, transitionInfos->rightLayer];
        [v3 appendFormat:@" %ld: %@\n", v17, v19];

        ++v17;
        ++transitionInfos;
      }
      while (v17 < self->_layerCount - 1);
    }
  }
  [v3 appendFormat:@">"];
  return v3;
}

- (void)dealloc
{
  [(PXDisplayLink *)self->_displayLink invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PXZoomablePhotosAlphaAnimator;
  [(PXZoomablePhotosAlphaAnimator *)&v3 dealloc];
}

@end