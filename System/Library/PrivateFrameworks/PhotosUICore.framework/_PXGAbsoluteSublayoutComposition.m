@interface _PXGAbsoluteSublayoutComposition
- (BOOL)shouldUpdateSublayoutsInStrictOrder;
- (CGRect)contentBounds;
- (CGSize)contentSize;
- (void)dealloc;
- (void)insertRange:(_NSRange)a3;
- (void)removeRange:(_NSRange)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setFrames:(const CGRect *)a3 forSublayoutsInRange:(_NSRange)a4;
- (void)setOrigins:(const CGPoint *)a3 forSublayoutsInRange:(_NSRange)a4;
- (void)setReferenceDepths:(const double *)a3 forSublayoutsInRange:(_NSRange)a4;
- (void)setShouldUpdateSublayoutsInStrictOrder:(BOOL)a3;
- (void)setSpriteTransforms:(id *)a3 forSublayoutsInRange:(_NSRange)a4;
- (void)setZPositions:(const double *)a3 forSublayoutsInRange:(_NSRange)a4;
- (void)updateEstimatedSublayoutGeometries;
- (void)updateSublayoutGeometriesFromAnchorSublayoutIndex:(int64_t)a3 usingSublayoutUpdateBlock:(id)a4;
@end

@implementation _PXGAbsoluteSublayoutComposition

- (void)setShouldUpdateSublayoutsInStrictOrder:(BOOL)a3
{
  self->_shouldUpdateSublayoutsInStrictOrder = a3;
}

- (BOOL)shouldUpdateSublayoutsInStrictOrder
{
  return self->_shouldUpdateSublayoutsInStrictOrder;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)contentBounds
{
  [(_PXGAbsoluteSublayoutComposition *)self contentSize];
  PXRectWithOriginAndSize();
}

- (void)updateSublayoutGeometriesFromAnchorSublayoutIndex:(int64_t)a3 usingSublayoutUpdateBlock:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __112___PXGAbsoluteSublayoutComposition_updateSublayoutGeometriesFromAnchorSublayoutIndex_usingSublayoutUpdateBlock___block_invoke;
  aBlock[3] = &unk_1E5DD36A0;
  id v7 = v6;
  id v14 = v7;
  v8 = (void (**)(void *, void))_Block_copy(aBlock);
  uint64_t v9 = [(PXGSublayoutComposition *)self numberOfSublayouts];
  if ([(_PXGAbsoluteSublayoutComposition *)self shouldUpdateSublayoutsInStrictOrder])
  {
    if (v9 >= 1)
    {
      for (uint64_t i = 0; i != v9; ++i)
        v8[2](v8, i);
    }
  }
  else
  {
    v8[2](v8, a3);
    if (a3 >= 1)
    {
      uint64_t v11 = 0;
      do
        v8[2](v8, v11++);
      while (a3 != v11);
    }
    int64_t v12 = a3 + 1;
    if (v12 < v9)
    {
      do
        v8[2](v8, v12++);
      while (v9 != v12);
    }
  }
}

- (void)updateEstimatedSublayoutGeometries
{
  v3 = self;
  uint64_t v4 = [(PXGSublayoutComposition *)v3 sublayoutGeometries];
  uint64_t v5 = [(PXGSublayoutComposition *)v3 numberOfSublayouts];
  if (v5 != v3->_sublayoutCount)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, @"PXGAbsoluteCompositeLayout.m", 198, @"number of sublayouts (%li) doesn't match the number of sublayout frames (%li)", v5, v3->_sublayoutCount);
  }
  if (v5 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = v4 + 48;
    do
    {
      v10 = (long long *)&v3->_sublayoutFrames[v6];
      double v11 = v3->_sublayoutZPositions[v8];
      long long v13 = *v10;
      long long v12 = v10[1];
      *(_OWORD *)(v9 - 16) = v12;
      *(_OWORD *)uint64_t v9 = v13;
      *(double *)(v9 + 16) = v11;
      *(_OWORD *)(v9 - 48) = v12;
      *(double *)(v9 - 32) = v3->_sublayoutReferenceDepths[v8];
      id v14 = &v3->_sublayoutSpriteTransforms[v7];
      double var1 = v14->var1;
      long long v17 = *(_OWORD *)&v14->var0.c;
      long long v16 = *(_OWORD *)&v14->var0.tx;
      *(_OWORD *)(v9 + 24) = *(_OWORD *)&v14->var0.a;
      *(_OWORD *)(v9 + 40) = v17;
      ++v8;
      *(_OWORD *)(v9 + 56) = v16;
      *(double *)(v9 + 72) = var1;
      ++v7;
      ++v6;
      v9 += 136;
    }
    while (v5 != v8);
  }
}

- (void)setSpriteTransforms:(id *)a3 forSublayoutsInRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.location + a4.length > self->_sublayoutCount)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v12.NSUInteger location = location;
    v12.NSUInteger length = length;
    v10 = NSStringFromRange(v12);
    [v9 handleFailureInMethod:a2, self, @"PXGAbsoluteCompositeLayout.m", 190, @"range (%@) not within 0 ..< %li", v10, self->_sublayoutCount object file lineNumber description];
  }
  memcpy(&self->_sublayoutSpriteTransforms[location], a3, 56 * length);
  [(PXGSublayoutComposition *)self invalidateEstimatedSublayoutGeometries];
}

- (void)setReferenceDepths:(const double *)a3 forSublayoutsInRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.location + a4.length > self->_sublayoutCount)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v12.NSUInteger location = location;
    v12.NSUInteger length = length;
    v10 = NSStringFromRange(v12);
    [v9 handleFailureInMethod:a2, self, @"PXGAbsoluteCompositeLayout.m", 184, @"range (%@) not within 0 ..< %li", v10, self->_sublayoutCount object file lineNumber description];
  }
  memcpy(&self->_sublayoutReferenceDepths[location], a3, 8 * length);
  [(PXGSublayoutComposition *)self invalidateEstimatedSublayoutGeometries];
}

- (void)setZPositions:(const double *)a3 forSublayoutsInRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.location + a4.length > self->_sublayoutCount)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v12.NSUInteger location = location;
    v12.NSUInteger length = length;
    v10 = NSStringFromRange(v12);
    [v9 handleFailureInMethod:a2, self, @"PXGAbsoluteCompositeLayout.m", 178, @"range (%@) not within 0 ..< %li", v10, self->_sublayoutCount object file lineNumber description];
  }
  memcpy(&self->_sublayoutZPositions[location], a3, 8 * length);
  [(PXGSublayoutComposition *)self invalidateEstimatedSublayoutGeometries];
}

- (void)setFrames:(const CGRect *)a3 forSublayoutsInRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.location + a4.length > self->_sublayoutCount)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v12.NSUInteger location = location;
    v12.NSUInteger length = length;
    v10 = NSStringFromRange(v12);
    [v9 handleFailureInMethod:a2, self, @"PXGAbsoluteCompositeLayout.m", 172, @"range (%@) not within 0 ..< %li", v10, self->_sublayoutCount object file lineNumber description];
  }
  memcpy(&self->_sublayoutFrames[location], a3, 32 * length);
  [(PXGSublayoutComposition *)self invalidateEstimatedSublayoutGeometries];
}

- (void)setOrigins:(const CGPoint *)a3 forSublayoutsInRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.location + a4.length > self->_sublayoutCount)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v14.NSUInteger location = location;
    v14.NSUInteger length = length;
    NSRange v12 = NSStringFromRange(v14);
    [v11 handleFailureInMethod:a2, self, @"PXGAbsoluteCompositeLayout.m", 164, @"range (%@) not within 0 ..< %li", v12, self->_sublayoutCount object file lineNumber description];

    if (!length) {
      goto LABEL_5;
    }
  }
  else if (!a4.length)
  {
    goto LABEL_5;
  }
  NSUInteger v8 = location;
  do
  {
    CGPoint v9 = *a3++;
    self->_sublayoutFrames[v8++].origin = v9;
    --length;
  }
  while (length);
LABEL_5:
  [(_PXGAbsoluteSublayoutComposition *)self updateEstimatedSublayoutGeometries];
}

- (void)removeRange:(_NSRange)a3
{
}

- (void)insertRange:(_NSRange)a3
{
  if (a3.length)
  {
    self->_sublayoutCount += a3.length;
    _PXGArrayResize();
  }
}

- (void)dealloc
{
  free(self->_sublayoutFrames);
  free(self->_sublayoutZPositions);
  free(self->_sublayoutReferenceDepths);
  free(self->_sublayoutSpriteTransforms);
  v3.receiver = self;
  v3.super_class = (Class)_PXGAbsoluteSublayoutComposition;
  [(_PXGAbsoluteSublayoutComposition *)&v3 dealloc];
}

@end