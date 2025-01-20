@interface PXStoryStyleScrollContentLayout
- (PXStoryModel)model;
- (PXStoryStyleScrollContentLayout)init;
- (PXStoryStyleScrollContentLayout)initWithModel:(id)a3;
- (double)focusOffset;
- (id)createAnchorForScrollingToStyleFocus:(double)a3;
- (int64_t)focusedStyleIndex;
- (void)_invalidateContent;
- (void)_invalidateFocusedStyle;
- (void)_updateContent;
- (void)_updateFocusedStyle;
- (void)adjustScrollTargetContentOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceSizeDidChange;
- (void)update;
- (void)visibleRectDidChange;
@end

@implementation PXStoryStyleScrollContentLayout

- (void).cxx_destruct
{
}

- (double)focusOffset
{
  return self->_focusOffset;
}

- (int64_t)focusedStyleIndex
{
  return self->_focusedStyleIndex;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)StyleManagerObservationContext_261558 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXStoryStyleScrollContentLayout.m" lineNumber:146 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 0x20) != 0)
  {
    id v11 = v9;
    [(PXStoryStyleScrollContentLayout *)self _invalidateContent];
    id v9 = v11;
  }
}

- (void)adjustScrollTargetContentOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4
{
}

- (void)_updateFocusedStyle
{
  [(PXGLayout *)self visibleRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(PXGLayout *)self referenceSize];
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  CGRectGetMidX(v14);
  id v11 = [(PXStoryStyleScrollContentLayout *)self model];
  v12 = [v11 styleManager];
  v13 = [v12 selectionDataSource];
  [v13 numberOfStyles];

  PXClamp();
}

- (void)_invalidateFocusedStyle
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_postUpdateFlags.updated)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v6 = [NSString stringWithUTF8String:"-[PXStoryStyleScrollContentLayout _invalidateFocusedStyle]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryStyleScrollContentLayout.m", 104, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateContent
{
  [(PXGLayout *)self referenceSize];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [(PXGLayout *)self localNumberOfSprites];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__PXStoryStyleScrollContentLayout__updateContent__block_invoke;
  v11[3] = &unk_1E5DD20F0;
  *(double *)&v11[5] = v4;
  *(double *)&v11[6] = v6;
  v11[4] = self;
  [(PXGLayout *)self modifySpritesInRange:v7 << 32 state:v11];
  CGFloat v8 = [(PXStoryStyleScrollContentLayout *)self model];
  double v9 = [v8 styleManager];
  CGFloat v10 = [v9 selectionDataSource];
  -[PXGLayout setContentSize:](self, "setContentSize:", v4 * (double)[v10 numberOfStyles], v6);
}

void __49__PXStoryStyleScrollContentLayout__updateContent__block_invoke()
{
}

- (void)_invalidateContent
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
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryStyleScrollContentLayout _invalidateContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryStyleScrollContentLayout.m", 88, @"invalidating %lu after it already has been updated", 1);

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
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v8 = [NSString stringWithUTF8String:"-[PXStoryStyleScrollContentLayout update]"];
      [v7 handleFailureInFunction:v8, @"PXStoryStyleScrollContentLayout.m", 74, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryStyleScrollContentLayout *)self _updateContent];
      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v10 = [NSString stringWithUTF8String:"-[PXStoryStyleScrollContentLayout update]"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"PXStoryStyleScrollContentLayout.m", 78, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)PXStoryStyleScrollContentLayout;
  [(PXGLayout *)&v15 update];
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.BOOL willPerformUpdate = 0;
  unint64_t v6 = self->_postUpdateFlags.needsUpdate;
  if (v6)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = [NSString stringWithUTF8String:"-[PXStoryStyleScrollContentLayout update]"];
      [v11 handleFailureInFunction:v12, @"PXStoryStyleScrollContentLayout.m", 80, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t v6 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 1;
    if (v6)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryStyleScrollContentLayout *)self _updateFocusedStyle];
      unint64_t v6 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v6)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      CGRect v14 = [NSString stringWithUTF8String:"-[PXStoryStyleScrollContentLayout update]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXStoryStyleScrollContentLayout.m", 84, @"still needing to update %lu after update pass", p_postUpdateFlags->needsUpdate);
    }
  }
}

- (void)visibleRectDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleScrollContentLayout;
  [(PXGLayout *)&v3 visibleRectDidChange];
  [(PXStoryStyleScrollContentLayout *)self _invalidateFocusedStyle];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleScrollContentLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXStoryStyleScrollContentLayout *)self _invalidateContent];
}

- (id)createAnchorForScrollingToStyleFocus:(double)a3
{
  double v5 = [(PXGLayout *)self spriteReferenceForSpriteIndex:self->_firstPageSpriteIndex];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__PXStoryStyleScrollContentLayout_createAnchorForScrollingToStyleFocus___block_invoke;
  v8[3] = &__block_descriptor_40_e64__CGPoint_dd_48__0_CGRect__CGPoint_dd__CGSize_dd__8__PXGLayout_40l;
  *(double *)&v8[4] = a3;
  unint64_t v6 = -[PXGLayout createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:](self, "createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:", v5, 9, v8, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));

  return v6;
}

double __72__PXStoryStyleScrollContentLayout_createAnchorForScrollingToStyleFocus___block_invoke(uint64_t a1, void *a2)
{
  [a2 referenceSize];
  return v3 * *(double *)(a1 + 32);
}

- (PXStoryStyleScrollContentLayout)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryStyleScrollContentLayout.m", 50, @"%s is not available as initializer", "-[PXStoryStyleScrollContentLayout init]");

  abort();
}

- (PXStoryStyleScrollContentLayout)initWithModel:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXStoryStyleScrollContentLayout;
  unint64_t v6 = [(PXGLayout *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    CGFloat v8 = [(PXStoryModel *)v7->_model styleManager];
    [v8 registerChangeObserver:v7 context:StyleManagerObservationContext_261558];

    v7->_firstPageSpriteIndex = 0;
    [(PXGLayout *)v7 addSpriteCount:1 withInitialState:0];
  }

  return v7;
}

@end