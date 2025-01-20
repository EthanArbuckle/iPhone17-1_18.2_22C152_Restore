@interface PXStoryScrubberScrollLayout
- ($7DA682ECC7253F641496E0B6E9C98204)presentedScrubberPosition;
- (CGPoint)_offsetFromFirstPageForScrollingToPosition:(id *)a3 visibleRect:(CGRect)a4;
- (PXStoryModel)model;
- (PXStoryScrubberScrollLayout)init;
- (PXStoryScrubberScrollLayout)initWithViewModel:(id)a3 model:(id)a4;
- (PXStoryTimeline)displayedTimeline;
- (PXStoryViewModel)viewModel;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)createAnchorForScrollingToPosition:(id *)a3;
- (id)modelChangeOrigin;
- (int64_t)numberOfPages;
- (void)_invalidateContent;
- (void)_invalidateCurrentScrollPosition;
- (void)_invalidateDisplayedTimeline;
- (void)_invalidateModelScrubberPosition;
- (void)_invalidatePages;
- (void)_invalidatePresentedScrubberPosition;
- (void)_updateContent;
- (void)_updateCurrentScrollPosition;
- (void)_updateDisplayedTimeline;
- (void)_updateModelScrubberPosition;
- (void)_updatePages;
- (void)_updatePresentedScrubberPosition;
- (void)adjustScrollTargetContentOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4;
- (void)didUpdate;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceSizeDidChange;
- (void)scrollLayoutDidEndScrolling:(id)a3;
- (void)scrollLayoutWillBeginScrolling:(id)a3;
- (void)scrollLayoutWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6;
- (void)setDisplayedTimeline:(id)a3;
- (void)setNumberOfPages:(int64_t)a3;
- (void)setPresentedScrubberPosition:(id *)a3;
- (void)update;
- (void)visibleRectDidChange;
- (void)willUpdate;
@end

@implementation PXStoryScrubberScrollLayout

- (void).cxx_destruct
{
  objc_storeStrong(&self->_modelChangeOrigin, 0);
  objc_storeStrong((id *)&self->_displayedTimeline, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (id)modelChangeOrigin
{
  return self->_modelChangeOrigin;
}

- ($7DA682ECC7253F641496E0B6E9C98204)presentedScrubberPosition
{
  *($BC569A352189BBB700BC3B7A67A9BAFC *)retstr = *($BC569A352189BBB700BC3B7A67A9BAFC *)((char *)self + 928);
  return self;
}

- (int64_t)numberOfPages
{
  return self->_numberOfPages;
}

- (PXStoryTimeline)displayedTimeline
{
  return self->_displayedTimeline;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v14 = a3;
  if ((void *)ModelObservationContext_160102 != a5)
  {
    if ((void *)ViewModelObservationContext_160103 != a5)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"PXStoryScrubberScrollLayout.m" lineNumber:329 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((v6 & 0x20) != 0)
    {
      [(PXStoryScrubberScrollLayout *)self _invalidateContent];
      [(PXStoryScrubberScrollLayout *)self _invalidateCurrentScrollPosition];
    }
    if ((v6 & 0x40) != 0) {
      goto LABEL_6;
    }
    goto LABEL_7;
  }
  if ((v6 & 0x10) != 0)
  {
    [(PXStoryScrubberScrollLayout *)self _invalidateDisplayedTimeline];
    if ((v6 & 0x2000) == 0)
    {
LABEL_12:
      if ((v6 & 4) == 0) {
        goto LABEL_18;
      }
      goto LABEL_16;
    }
  }
  else if ((v6 & 0x2000) == 0)
  {
    goto LABEL_12;
  }
  [(PXStoryScrubberScrollLayout *)self _invalidatePages];
  if ((v6 & 4) == 0) {
    goto LABEL_18;
  }
LABEL_16:
  v9 = [(PXStoryScrubberScrollLayout *)self model];
  v10 = [v9 changesOrigins];
  v11 = [(PXStoryScrubberScrollLayout *)self modelChangeOrigin];
  char v12 = [v10 containsObject:v11];

  if ((v12 & 1) == 0) {
    [(PXStoryScrubberScrollLayout *)self _invalidateCurrentScrollPosition];
  }
LABEL_18:
  if ((v6 & 0x2000) != 0) {
LABEL_6:
  }
    [(PXStoryScrubberScrollLayout *)self _invalidateContent];
LABEL_7:
}

- (void)scrollLayoutDidEndScrolling:(id)a3
{
  id v3 = [(PXStoryScrubberScrollLayout *)self viewModel];
  [v3 performChanges:&__block_literal_global_42];
}

uint64_t __59__PXStoryScrubberScrollLayout_scrollLayoutDidEndScrolling___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsScrubbing:0];
}

- (void)scrollLayoutWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
}

- (void)scrollLayoutWillBeginScrolling:(id)a3
{
  id v3 = [(PXStoryScrubberScrollLayout *)self viewModel];
  [v3 performChanges:&__block_literal_global_160111];
}

uint64_t __62__PXStoryScrubberScrollLayout_scrollLayoutWillBeginScrolling___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsScrubbing:1];
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  double v4 = modf((double)a3 / 10.0, &__y);
  v5 = (void *)MEMORY[0x1E4FB1618];
  return (id)[v5 colorWithHue:v4 saturation:1.0 brightness:1.0 alpha:0.3];
}

- (void)adjustScrollTargetContentOffset:(CGPoint *)a3 withVelocity:(CGPoint)a4
{
  v5 = [(PXStoryScrubberScrollLayout *)self viewModel];
  id v9 = [v5 viewLayoutSpec];

  [v9 scrubberRegularAssetSize];
  double v7 = v6;
  [v9 scrubberRegularAssetPadding];
  a3->x = (v7 + v8) * round(a3->x / (v7 + v8));
}

- (void)_updateModelScrubberPosition
{
  long long v10 = 0uLL;
  uint64_t v11 = 0;
  [(PXStoryScrubberScrollLayout *)self presentedScrubberPosition];
  id v3 = [(PXStoryScrubberScrollLayout *)self viewModel];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__PXStoryScrubberScrollLayout__updateModelScrubberPosition__block_invoke;
  v7[3] = &__block_descriptor_56_e35_v16__0___PXStoryMutableViewModel__8l;
  long long v8 = v10;
  uint64_t v9 = v11;
  [v3 performChanges:v7];

  double v4 = [(PXStoryScrubberScrollLayout *)self model];
  v5 = [(PXStoryScrubberScrollLayout *)self modelChangeOrigin];
  [v4 performChanges:&v6 origin:v5];
}

uint64_t __59__PXStoryScrubberScrollLayout__updateModelScrubberPosition__block_invoke(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  return [a2 setScrubberPosition:&v3];
}

void __59__PXStoryScrubberScrollLayout__updateModelScrubberPosition__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  long long v3 = [*(id *)(a1 + 32) viewModel];
  int v4 = [v3 isScrubbing];

  if (v4)
  {
    v5 = (void *)(a1 + 40);
    if (*(double *)(a1 + 48) > 0.5) {
      v5 = (void *)(a1 + 56);
    }
    [v6 skipToBeginningOfSegmentWithIdentifier:*v5];
  }
}

- (void)_invalidateModelScrubberPosition
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberScrollLayout _invalidateModelScrubberPosition]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberScrollLayout.m", 240, @"invalidating %lu after it already has been updated", 32);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 32;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updatePresentedScrubberPosition
{
  long long v3 = [(PXStoryScrubberScrollLayout *)self viewModel];
  int v4 = [v3 viewLayoutSpec];

  [v4 scrubberRegularAssetSize];
  [v4 scrubberRegularAssetPadding];
  [(PXGLayout *)self visibleRect];
  CGRectGetMinX(v7);
  v5 = [(PXStoryScrubberScrollLayout *)self displayedTimeline];
  if ([v5 numberOfSegments] > 1) {
    PXClamp();
  }
  v6[0] = [v5 firstSegmentIdentifier];
  v6[1] = 0;
  v6[2] = 0;
  [(PXStoryScrubberScrollLayout *)self setPresentedScrubberPosition:v6];
}

- (void)_invalidatePresentedScrubberPosition
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberScrollLayout _invalidatePresentedScrubberPosition]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberScrollLayout.m", 216, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 8;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (CGPoint)_offsetFromFirstPageForScrollingToPosition:(id *)a3 visibleRect:(CGRect)a4
{
  id v6 = [(PXStoryScrubberScrollLayout *)self displayedTimeline];
  CGRect v7 = (double *)MEMORY[0x1E4F1DAD8];
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  uint64_t v9 = [v6 indexOfSegmentWithIdentifier:a3->var0];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v10 = *v7;
  }
  else
  {
    uint64_t v11 = v9;
    char v12 = [(PXStoryScrubberScrollLayout *)self viewModel];
    v13 = [v12 viewLayoutSpec];

    [v13 scrubberRegularAssetSize];
    double v15 = v14;
    [v13 scrubberRegularAssetPadding];
    double v16 = a3->var1 + (double)v11;
    double v18 = v15 + v17;
    [(PXGLayout *)self safeAreaInsets];
    double v10 = v19 + v16 * v18;
  }
  double v20 = v10;
  double v21 = v8;
  result.y = v21;
  result.x = v20;
  return result;
}

- (id)createAnchorForScrollingToPosition:(id *)a3
{
  objc_initWeak(&location, self);
  v5 = [(PXGLayout *)self spriteReferenceForSpriteIndex:self->_firstPageSpriteIndex];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__PXStoryScrubberScrollLayout_createAnchorForScrollingToPosition___block_invoke;
  v8[3] = &unk_1E5DC74B0;
  objc_copyWeak(&v9, &location);
  $7DA682ECC7253F641496E0B6E9C98204 v10 = *a3;
  id v6 = -[PXGLayout createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:](self, "createAnchorForScrollingSpriteForSpriteReference:toScrollPosition:padding:customOffset:", v5, 9, v8, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

double __66__PXStoryScrubberScrollLayout_createAnchorForScrollingToPosition___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v14 = *(_OWORD *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 56);
  objc_msgSend(WeakRetained, "_offsetFromFirstPageForScrollingToPosition:visibleRect:", &v14, a2, a3, a4, a5);
  double v12 = v11;

  return v12;
}

- (void)_updateCurrentScrollPosition
{
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  long long v3 = [(PXStoryScrubberScrollLayout *)self model];
  int v4 = v3;
  if (v3)
  {
    [v3 currentScrollPosition];
  }
  else
  {
    long long v12 = 0uLL;
    uint64_t v13 = 0;
  }

  v5 = [(PXStoryScrubberScrollLayout *)self viewModel];
  if ([v5 isScrubbing]) {
    goto LABEL_11;
  }
  [(PXStoryScrubberScrollLayout *)self presentedScrubberPosition];
  if ((void)v12 != v9 || *((double *)&v12 + 1) != v10)
  {

    goto LABEL_10;
  }

  if (v13 != v11)
  {
LABEL_10:
    long long v7 = v12;
    uint64_t v8 = v13;
    v5 = [(PXStoryScrubberScrollLayout *)self createAnchorForScrollingToPosition:&v7];
    id v6 = (id)[v5 autoInvalidate];
LABEL_11:
  }
}

- (void)_invalidateCurrentScrollPosition
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 0x10;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberScrollLayout _invalidateCurrentScrollPosition]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberScrollLayout.m", 183, @"invalidating %lu after it already has been updated", 16);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 16;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateContent
{
  long long v3 = [(PXStoryScrubberScrollLayout *)self viewModel];
  int v4 = [v3 viewLayoutSpec];

  v5 = [(PXStoryScrubberScrollLayout *)self viewModel];
  id v6 = [v5 mainModel];
  long long v7 = [v6 layoutSpec];

  [v4 scrubberRegularAssetSize];
  double v9 = v8;
  uint64_t v11 = v10;
  [v7 scrubberCurrentAssetSize];
  double v13 = v12;
  [v4 scrubberRegularAssetPadding];
  double v15 = v14;
  [v4 scrubberCurrentAssetPadding];
  double v17 = v16;
  uint64_t v18 = [(PXGLayout *)self localNumberOfSprites];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __45__PXStoryScrubberScrollLayout__updateContent__block_invoke;
  v20[3] = &unk_1E5DD20F0;
  *(double *)&v20[5] = v9;
  v20[6] = v11;
  v20[4] = self;
  [(PXGLayout *)self modifySpritesInRange:v18 << 32 state:v20];
  double v19 = v17
      + v15 * -2.0
      + (double)([(PXStoryScrubberScrollLayout *)self numberOfPages] - 1) * (v9 + v15);
  [(PXGLayout *)self visibleRect];
  -[PXGLayout setContentSize:](self, "setContentSize:", CGRectGetWidth(v21) + v19, v13);
}

void __45__PXStoryScrubberScrollLayout__updateContent__block_invoke()
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
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberScrollLayout _invalidateContent]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberScrollLayout.m", 156, @"invalidating %lu after it already has been updated", 4);

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
  id v3 = [(PXStoryScrubberScrollLayout *)self displayedTimeline];
  -[PXStoryScrubberScrollLayout setNumberOfPages:](self, "setNumberOfPages:", [v3 numberOfSegments]);
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
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberScrollLayout _invalidatePages]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberScrollLayout.m", 148, @"invalidating %lu after it already has been updated", 2);

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
  id v4 = [(PXStoryScrubberScrollLayout *)self model];
  id v3 = [v4 timeline];
  [(PXStoryScrubberScrollLayout *)self setDisplayedTimeline:v3];
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
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryScrubberScrollLayout _invalidateDisplayedTimeline]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrubberScrollLayout.m", 140, @"invalidating %lu after it already has been updated", 1);

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

- (void)didUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryScrubberScrollLayout;
  [(PXGLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXStoryScrubberScrollLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryScrubberScrollLayout.m", 136, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
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
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[PXStoryScrubberScrollLayout update]"];
      [v10 handleFailureInFunction:v11, @"PXStoryScrubberScrollLayout.m", 111, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryScrubberScrollLayout *)self _updateDisplayedTimeline];
      if (!p_updateFlags->isPerformingUpdate)
      {
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        v23 = [NSString stringWithUTF8String:"-[PXStoryScrubberScrollLayout update]"];
        [v22 handleFailureInFunction:v23, @"PXStoryScrubberScrollLayout.m", 115, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXStoryScrubberScrollLayout *)self _updatePages];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      double v12 = [MEMORY[0x1E4F28B00] currentHandler];
      double v13 = [NSString stringWithUTF8String:"-[PXStoryScrubberScrollLayout update]"];
      [v12 handleFailureInFunction:v13, @"PXStoryScrubberScrollLayout.m", 118, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      [(PXStoryScrubberScrollLayout *)self _updateContent];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      double v14 = [MEMORY[0x1E4F28B00] currentHandler];
      double v15 = [NSString stringWithUTF8String:"-[PXStoryScrubberScrollLayout update]"];
      [v14 handleFailureInFunction:v15, @"PXStoryScrubberScrollLayout.m", 121, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      [(PXStoryScrubberScrollLayout *)self _updatePresentedScrubberPosition];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      double v16 = [MEMORY[0x1E4F28B00] currentHandler];
      double v17 = [NSString stringWithUTF8String:"-[PXStoryScrubberScrollLayout update]"];
      [v16 handleFailureInFunction:v17, @"PXStoryScrubberScrollLayout.m", 124, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v8 & 0x10) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFEFLL;
      [(PXStoryScrubberScrollLayout *)self _updateCurrentScrollPosition];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
      double v19 = [NSString stringWithUTF8String:"-[PXStoryScrubberScrollLayout update]"];
      [v18 handleFailureInFunction:v19, @"PXStoryScrubberScrollLayout.m", 127, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v9 & 0x20) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v9 & 0xFFFFFFFFFFFFFFDFLL;
      [(PXStoryScrubberScrollLayout *)self _updateModelScrubberPosition];
      unint64_t v9 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v9)
    {
      double v20 = [MEMORY[0x1E4F28B00] currentHandler];
      CGRect v21 = [NSString stringWithUTF8String:"-[PXStoryScrubberScrollLayout update]"];
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"PXStoryScrubberScrollLayout.m", 130, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)PXStoryScrubberScrollLayout;
  [(PXGLayout *)&v24 update];
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryScrubberScrollLayout;
  [(PXGLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXStoryScrubberScrollLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryScrubberScrollLayout.m", 107, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (void)setPresentedScrubberPosition:(id *)a3
{
  if (self->_presentedScrubberPosition.firstSegmentIdentifier != a3->var0
    || (self->_presentedScrubberPosition.secondSegmentMixFactor == a3->var1
      ? (BOOL v3 = self->_presentedScrubberPosition.secondSegmentIdentifier == a3->var2)
      : (BOOL v3 = 0),
        !v3))
  {
    long long v4 = *(_OWORD *)&a3->var0;
    self->_presentedScrubberPosition.secondSegmentIdentifier = a3->var2;
    *(_OWORD *)&self->_presentedScrubberPosition.firstSegmentIdentifier = v4;
    [(PXStoryScrubberScrollLayout *)self _invalidateModelScrubberPosition];
  }
}

- (void)visibleRectDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberScrollLayout;
  [(PXGLayout *)&v3 visibleRectDidChange];
  [(PXStoryScrubberScrollLayout *)self _invalidatePresentedScrubberPosition];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrubberScrollLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXStoryScrubberScrollLayout *)self _invalidateContent];
}

- (void)setNumberOfPages:(int64_t)a3
{
  if (self->_numberOfPages != a3)
  {
    self->_numberOfPages = a3;
    [(PXStoryScrubberScrollLayout *)self _invalidateContent];
  }
}

- (void)setDisplayedTimeline:(id)a3
{
  unint64_t v7 = (PXStoryTimeline *)a3;
  objc_super v5 = self->_displayedTimeline;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryTimeline *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_displayedTimeline, a3);
      [(PXStoryScrubberScrollLayout *)self _invalidatePages];
      [(PXStoryScrubberScrollLayout *)self _invalidateCurrentScrollPosition];
    }
  }
}

- (PXStoryScrubberScrollLayout)initWithViewModel:(id)a3 model:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXStoryScrubberScrollLayout;
  unint64_t v9 = [(PXGLayout *)&v17 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_model, a4);
    objc_storeStrong((id *)&v10->_viewModel, a3);
    [v7 registerChangeObserver:v10 context:ViewModelObservationContext_160103];
    [v8 registerChangeObserver:v10 context:ModelObservationContext_160102];
    id v11 = [NSString alloc];
    double v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    uint64_t v14 = [v11 initWithFormat:@"changeOrigin-%@-%p", v13, v10];
    id modelChangeOrigin = v10->_modelChangeOrigin;
    v10->_id modelChangeOrigin = (id)v14;

    [(PXGLayout *)v10 setContentSource:v10];
    v10->_firstPageSpriteIndex = 0;
    [(PXGLayout *)v10 addSpriteCount:1 withInitialState:0];
    [(PXStoryScrubberScrollLayout *)v10 _invalidateDisplayedTimeline];
  }

  return v10;
}

- (PXStoryScrubberScrollLayout)init
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryScrubberScrollLayout.m", 45, @"%s is not available as initializer", "-[PXStoryScrubberScrollLayout init]");

  abort();
}

@end