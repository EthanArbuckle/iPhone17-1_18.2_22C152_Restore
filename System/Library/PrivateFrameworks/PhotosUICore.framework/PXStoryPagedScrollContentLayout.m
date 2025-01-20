@interface PXStoryPagedScrollContentLayout
- ($7DA682ECC7253F641496E0B6E9C98204)presentedScrollPosition;
- (CGPoint)_offsetFromFirstPageForScrollingToPosition:(id *)a3 visibleRect:(CGRect)a4;
- (PXStoryModel)model;
- (PXStoryPagedScrollContentLayout)init;
- (PXStoryPagedScrollContentLayout)initWithModel:(id)a3;
- (PXStoryTimeline)displayedTimeline;
- (double)interpageSpacing;
- (double)presentedPageWidth;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)createAnchorForScrollingToPosition:(id *)a3;
- (int64_t)numberOfPages;
- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (void)_invalidateContent;
- (void)_invalidateDisplayedTimeline;
- (void)_invalidatePages;
- (void)_invalidatePresentedScrollPosition;
- (void)_updateContent;
- (void)_updateDisplayedTimeline;
- (void)_updatePages;
- (void)_updatePresentedScrollPosition;
- (void)adjustScrollTargetContentOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceSizeDidChange;
- (void)setDisplayedTimeline:(id)a3;
- (void)setInterpageSpacing:(double)a3;
- (void)setNumberOfPages:(int64_t)a3;
- (void)setPresentedPageWidth:(double)a3;
- (void)setPresentedScrollPosition:(id *)a3;
- (void)update;
- (void)visibleRectDidChange;
@end

@implementation PXStoryPagedScrollContentLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedTimeline, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (void)setPresentedPageWidth:(double)a3
{
  self->_presentedPageWidth = a3;
}

- (double)presentedPageWidth
{
  return self->_presentedPageWidth;
}

- (double)interpageSpacing
{
  return self->_interpageSpacing;
}

- (int64_t)numberOfPages
{
  return self->_numberOfPages;
}

- (PXStoryTimeline)displayedTimeline
{
  return self->_displayedTimeline;
}

- (void)setPresentedScrollPosition:(id *)a3
{
  int64_t var2 = a3->var2;
  *(_OWORD *)&self->_presentedScrollPosition.firstSegmentIdentifier = *(_OWORD *)&a3->var0;
  self->_presentedScrollPosition.secondSegmentIdentifier = var2;
}

- ($7DA682ECC7253F641496E0B6E9C98204)presentedScrollPosition
{
  *($BC569A352189BBB700BC3B7A67A9BAFC *)retstr = *($BC569A352189BBB700BC3B7A67A9BAFC *)((char *)self + 944);
  return self;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v9 = a3;
  if ((void *)ModelObservationContext_228377 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXStoryPagedScrollContentLayout.m" lineNumber:256 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  id v11 = v9;
  if ((v6 & 0x10) != 0)
  {
    [(PXStoryPagedScrollContentLayout *)self _invalidateDisplayedTimeline];
    id v9 = v11;
  }
  if ((v6 & 0x2000) != 0)
  {
    [(PXStoryPagedScrollContentLayout *)self _invalidatePages];
    id v9 = v11;
  }
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  double v4 = modf((double)a3 / 10.0, &__y);
  v5 = (void *)MEMORY[0x1E4FB1618];
  return (id)[v5 colorWithHue:v4 saturation:1.0 brightness:1.0 alpha:0.3];
}

- (void)_updatePresentedScrollPosition
{
  [(PXGLayout *)self visibleRect];
  CGRectGetMinX(v5);
  [(PXStoryPagedScrollContentLayout *)self presentedPageWidth];
  [(PXStoryPagedScrollContentLayout *)self interpageSpacing];
  v3 = [(PXStoryPagedScrollContentLayout *)self displayedTimeline];
  if ([v3 numberOfSegments] > 1) {
    PXClamp();
  }
  v4[0] = [v3 firstSegmentIdentifier];
  v4[1] = 0;
  v4[2] = 0;
  [(PXStoryPagedScrollContentLayout *)self setPresentedScrollPosition:v4];
}

- (void)_invalidatePresentedScrollPosition
{
  if (self->_postUpdateFlags.isPerformingUpdate && (self->_postUpdateFlags.updated & 0x400) != 0)
  {
    v2 = [MEMORY[0x1E4F28B00] currentHandler];
    v3 = [NSString stringWithUTF8String:"-[PXStoryPagedScrollContentLayout _invalidatePresentedScrollPosition]"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"PXStoryPagedScrollContentLayout.m", 216, @"invalidating %lu after it already has been updated", 1024);

    abort();
  }
  self->_postUpdateFlags.needsUpdate |= 0x400uLL;
}

- (void)_updateContent
{
  [(PXGLayout *)self referenceSize];
  double v4 = v3;
  double v6 = v5;
  [(PXStoryPagedScrollContentLayout *)self interpageSpacing];
  double v8 = v7;
  uint64_t v9 = [(PXGLayout *)self localNumberOfSprites];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__PXStoryPagedScrollContentLayout__updateContent__block_invoke;
  v10[3] = &unk_1E5DD20F0;
  *(double *)&v10[5] = v4;
  *(double *)&v10[6] = v6;
  v10[4] = self;
  [(PXGLayout *)self modifySpritesInRange:v9 << 32 state:v10];
  [(PXStoryPagedScrollContentLayout *)self setPresentedPageWidth:v4];
  -[PXGLayout setContentSize:](self, "setContentSize:", -(v8 - (double)[(PXStoryPagedScrollContentLayout *)self numberOfPages] * (v4 + v8)), v6);
}

void __49__PXStoryPagedScrollContentLayout__updateContent__block_invoke()
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
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryPagedScrollContentLayout _invalidateContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryPagedScrollContentLayout.m", 198, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updatePages
{
  double v3 = [(PXStoryPagedScrollContentLayout *)self displayedTimeline];
  -[PXStoryPagedScrollContentLayout setNumberOfPages:](self, "setNumberOfPages:", [v3 numberOfSegments]);

  id v5 = [(PXStoryPagedScrollContentLayout *)self model];
  double v4 = [v5 layoutSpec];
  [v4 interpageSpacing];
  -[PXStoryPagedScrollContentLayout setInterpageSpacing:](self, "setInterpageSpacing:");
}

- (void)_invalidatePages
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryPagedScrollContentLayout _invalidatePages]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryPagedScrollContentLayout.m", 189, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateDisplayedTimeline
{
  id v4 = [(PXStoryPagedScrollContentLayout *)self model];
  double v3 = [v4 timeline];
  [(PXStoryPagedScrollContentLayout *)self setDisplayedTimeline:v3];
}

- (void)_invalidateDisplayedTimeline
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
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryPagedScrollContentLayout _invalidateDisplayedTimeline]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryPagedScrollContentLayout.m", 181, @"invalidating %lu after it already has been updated", 1);

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
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      v10 = [NSString stringWithUTF8String:"-[PXStoryPagedScrollContentLayout update]"];
      [v9 handleFailureInFunction:v10, @"PXStoryPagedScrollContentLayout.m", 161, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryPagedScrollContentLayout *)self _updateDisplayedTimeline];
      if (!p_updateFlags->isPerformingUpdate)
      {
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        v20 = [NSString stringWithUTF8String:"-[PXStoryPagedScrollContentLayout update]"];
        [v19 handleFailureInFunction:v20, @"PXStoryPagedScrollContentLayout.m", 165, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXStoryPagedScrollContentLayout *)self _updatePages];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      v12 = [NSString stringWithUTF8String:"-[PXStoryPagedScrollContentLayout update]"];
      [v11 handleFailureInFunction:v12, @"PXStoryPagedScrollContentLayout.m", 168, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXStoryPagedScrollContentLayout *)self _updateContent];
      unint64_t v6 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v6)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = [NSString stringWithUTF8String:"-[PXStoryPagedScrollContentLayout update]"];
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"PXStoryPagedScrollContentLayout.m", 171, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)PXStoryPagedScrollContentLayout;
  [(PXGLayout *)&v21 update];
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.BOOL willPerformUpdate = 0;
  unint64_t v8 = self->_postUpdateFlags.needsUpdate;
  if (v8)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      v16 = [NSString stringWithUTF8String:"-[PXStoryPagedScrollContentLayout update]"];
      [v15 handleFailureInFunction:v16, @"PXStoryPagedScrollContentLayout.m", 173, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t v8 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 1024;
    if ((v8 & 0x400) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFBFFLL;
      [(PXStoryPagedScrollContentLayout *)self _updatePresentedScrollPosition];
      unint64_t v8 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v8)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      v18 = [NSString stringWithUTF8String:"-[PXStoryPagedScrollContentLayout update]"];
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"PXStoryPagedScrollContentLayout.m", 177, @"still needing to update %lu after update pass", p_postUpdateFlags->needsUpdate);
    }
  }
}

- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v7 = a3;
  unint64_t v8 = [(PXStoryPagedScrollContentLayout *)self displayedTimeline];
  objc_opt_class();
  unsigned int v9 = -1;
  if ((objc_opt_isKindOfClass() & 1) != 0 && v8)
  {
    uint64_t v15 = 0;
    double v16 = 0.0;
    uint64_t v17 = 0;
    if (v7)
    {
      [v7 scrollPosition];
      double v10 = v16;
    }
    else
    {
      double v10 = 0.0;
    }
    double v11 = 1.0 - v10;
    if (v10 <= 0.5) {
      double v11 = v10;
    }
    if (v11 != 0.0) {
      PXAssertGetLog();
    }
    v12 = &v15;
    if (v10 > 0.5) {
      v12 = &v17;
    }
    unsigned int v9 = [v8 indexOfSegmentWithIdentifier:*v12];
  }
  id v13 = v7;
  *a5 = v13;

  return v9;
}

- (void)adjustScrollTargetContentOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4
{
}

- (CGPoint)_offsetFromFirstPageForScrollingToPosition:(id *)a3 visibleRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v10 = (double *)MEMORY[0x1E4F1DAD8];
  double v11 = [(PXStoryPagedScrollContentLayout *)self displayedTimeline];
  double var1 = a3->var1;
  double v13 = 1.0 - var1;
  if (var1 <= 0.5) {
    double v13 = a3->var1;
  }
  if (v13 != 0.0) {
    PXAssertGetLog();
  }
  double v14 = v10[1];
  p_int64_t var2 = ($7DA682ECC7253F641496E0B6E9C98204 *)&a3->var2;
  if (var1 <= 0.5) {
    p_int64_t var2 = a3;
  }
  uint64_t v16 = [v11 indexOfSegmentWithIdentifier:p_var2->var0];
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v17 = *v10;
  }
  else
  {
    double v18 = (double)v16;
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    double v19 = CGRectGetWidth(v26);
    [(PXStoryPagedScrollContentLayout *)self interpageSpacing];
    double v21 = v19 + v20;
    [(PXGLayout *)self safeAreaInsets];
    double v17 = v22 + v18 * v21;
  }

  double v23 = v17;
  double v24 = v14;
  result.CGFloat y = v24;
  result.CGFloat x = v23;
  return result;
}

- (id)createAnchorForScrollingToPosition:(id *)a3
{
  objc_initWeak(&location, self);
  unint64_t v5 = [(PXGLayout *)self spriteReferenceForSpriteIndex:self->_firstPageSpriteIndex];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__PXStoryPagedScrollContentLayout_createAnchorForScrollingToPosition___block_invoke;
  v8[3] = &unk_1E5DC74B0;
  objc_copyWeak(&v9, &location);
  $7DA682ECC7253F641496E0B6E9C98204 v10 = *a3;
  unint64_t v6 = -[PXGLayout createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:](self, "createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:", v5, 8, v8, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

double __70__PXStoryPagedScrollContentLayout_createAnchorForScrollingToPosition___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v14 = *(_OWORD *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 56);
  objc_msgSend(WeakRetained, "_offsetFromFirstPageForScrollingToPosition:visibleRect:", &v14, a2, a3, a4, a5);
  double v12 = v11;

  return v12;
}

- (void)visibleRectDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryPagedScrollContentLayout;
  [(PXGLayout *)&v3 visibleRectDidChange];
  [(PXStoryPagedScrollContentLayout *)self _invalidatePresentedScrollPosition];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryPagedScrollContentLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXStoryPagedScrollContentLayout *)self _invalidateContent];
}

- (void)setInterpageSpacing:(double)a3
{
  if (self->_interpageSpacing != a3)
  {
    self->_interpageSpacing = a3;
    [(PXStoryPagedScrollContentLayout *)self _invalidateContent];
  }
}

- (void)setNumberOfPages:(int64_t)a3
{
  if (self->_numberOfPages != a3)
  {
    self->_numberOfPages = a3;
    [(PXStoryPagedScrollContentLayout *)self _invalidateContent];
  }
}

- (void)setDisplayedTimeline:(id)a3
{
  id v7 = (PXStoryTimeline *)a3;
  unint64_t v5 = self->_displayedTimeline;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryTimeline *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_displayedTimeline, a3);
      [(PXStoryPagedScrollContentLayout *)self _invalidatePages];
    }
  }
}

- (PXStoryPagedScrollContentLayout)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPagedScrollContentLayout;
  char v6 = [(PXGLayout *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_model, a3);
    [(PXStoryModel *)v7->_model registerChangeObserver:v7 context:ModelObservationContext_228377];
    [(PXGLayout *)v7 setContentSource:v7];
    v7->_firstPageSpriteIndeCGFloat x = 0;
    [(PXGLayout *)v7 addSpriteCount:1 withInitialState:0];
    [(PXStoryPagedScrollContentLayout *)v7 _invalidateDisplayedTimeline];
  }

  return v7;
}

- (PXStoryPagedScrollContentLayout)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryPagedScrollContentLayout.m", 53, @"%s is not available as initializer", "-[PXStoryPagedScrollContentLayout init]");

  abort();
}

@end