@interface PXGTransitioningLayout
- (BOOL)disableDebugAssertionForAnchorUpdatesWithZeroContentSize;
- (CGRect)contentFrameOverride;
- (PXGLayout)contentLayout;
- (PXGTransitioningLayout)init;
- (PXGTransitioningLayout)initWithContentLayout:(id)a3;
- (UIEdgeInsets)safeAreaInsets;
- (id)createAnchorForVisibleAreaIgnoringEdges:(unint64_t)a3;
- (int64_t)scrollableAxis;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (void)_invalidateSublayoutPositions;
- (void)_updateSublayoutPositions;
- (void)referenceSizeDidChange;
- (void)setContentFrameOverride:(CGRect)a3;
- (void)update;
@end

@implementation PXGTransitioningLayout

- (void).cxx_destruct
{
}

- (CGRect)contentFrameOverride
{
  double x = self->_contentFrameOverride.origin.x;
  double y = self->_contentFrameOverride.origin.y;
  double width = self->_contentFrameOverride.size.width;
  double height = self->_contentFrameOverride.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PXGLayout)contentLayout
{
  return self->_contentLayout;
}

- (void)_updateSublayoutPositions
{
  [(PXGTransitioningLayout *)self contentFrameOverride];
  double x = v8.origin.x;
  double y = v8.origin.y;
  double width = v8.size.width;
  double height = v8.size.height;
  if (CGRectIsNull(v8))
  {
    [(PXGLayout *)self referenceSize];
    PXRectWithOriginAndSize();
  }
  -[PXGAbsoluteCompositeLayout setFrame:forSublayoutAtIndex:](self, "setFrame:forSublayoutAtIndex:", 0, x, y, width, height);
}

- (void)_invalidateSublayoutPositions
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = [NSString stringWithUTF8String:"-[PXGTransitioningLayout _invalidateSublayoutPositions]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXGTransitioningLayout.m", 98, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = [NSString stringWithUTF8String:"-[PXGTransitioningLayout update]"];
      [v5 handleFailureInFunction:v6, @"PXGTransitioningLayout.m", 89, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXGTransitioningLayout *)self _updateSublayoutPositions];
      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      CGRect v8 = [NSString stringWithUTF8String:"-[PXGTransitioningLayout update]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXGTransitioningLayout.m", 93, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXGTransitioningLayout;
  [(PXGCompositeLayout *)&v9 update];
}

- (BOOL)disableDebugAssertionForAnchorUpdatesWithZeroContentSize
{
  return 1;
}

- (id)createAnchorForVisibleAreaIgnoringEdges:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXGTransitioningLayout;
  v4 = [(PXGLayout *)&v7 createAnchorForVisibleAreaIgnoringEdges:a3];
  v5 = [(PXGTransitioningLayout *)self contentLayout];
  if ([v5 conformsToProtocol:&unk_1F03083F0]) {
    [v4 setDelegate:v5];
  }

  return v4;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v7 = a3;
  CGRect v8 = [(PXGTransitioningLayout *)self contentLayout];
  int64_t v9 = [(PXGLayout *)self indexOfSublayout:v8];

  id v10 = v7;
  *a5 = v10;
  return v9;
}

- (int64_t)scrollableAxis
{
  return 0;
}

- (UIEdgeInsets)safeAreaInsets
{
  v3 = [(PXGTransitioningLayout *)self contentLayout];
  uint64_t v4 = [v3 scrollableAxis];

  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)PXGTransitioningLayout;
    [(PXGLayout *)&v9 safeAreaInsets];
  }
  else
  {
    double v5 = *(double *)off_1E5DAAF10;
    double v6 = *((double *)off_1E5DAAF10 + 1);
    double v7 = *((double *)off_1E5DAAF10 + 2);
    double v8 = *((double *)off_1E5DAAF10 + 3);
  }
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXGTransitioningLayout;
  [(PXGCompositeLayout *)&v3 referenceSizeDidChange];
  [(PXGTransitioningLayout *)self _invalidateSublayoutPositions];
}

- (void)setContentFrameOverride:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_contentFrameOverride = &self->_contentFrameOverride;
  if (!CGRectEqualToRect(a3, self->_contentFrameOverride))
  {
    p_contentFrameOverride->origin.CGFloat x = x;
    p_contentFrameOverride->origin.CGFloat y = y;
    p_contentFrameOverride->size.CGFloat width = width;
    p_contentFrameOverride->size.CGFloat height = height;
    [(PXGTransitioningLayout *)self _invalidateSublayoutPositions];
  }
}

- (PXGTransitioningLayout)initWithContentLayout:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXGTransitioningLayout.m", 28, @"Invalid parameter not satisfying: %@", @"contentLayout != nil" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)PXGTransitioningLayout;
  double v7 = [(PXGAbsoluteCompositeLayout *)&v12 init];
  double v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_contentLayout, a3);
    CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v8->_contentFrameOverride.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v8->_contentFrameOverride.size = v9;
    [(PXGLayout *)v8 addSublayout:v6];
    [(PXGTransitioningLayout *)v8 _invalidateSublayoutPositions];
  }

  return v8;
}

- (PXGTransitioningLayout)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGTransitioningLayout.m", 24, @"%s is not available as initializer", "-[PXGTransitioningLayout init]");

  abort();
}

@end