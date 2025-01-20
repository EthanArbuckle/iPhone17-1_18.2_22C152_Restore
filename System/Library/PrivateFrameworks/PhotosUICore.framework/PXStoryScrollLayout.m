@interface PXStoryScrollLayout
- (BOOL)scrollBeganAtTimelineEnd;
- (PXStoryModel)model;
- (PXStoryPagedScrollContentLayout)pagedScrollContentLayout;
- (PXStoryScrollLayout)init;
- (PXStoryScrollLayout)initWithModel:(id)a3;
- (PXStoryScrollLayoutTargetContentOffsetAdjuster)targetContentOffsetAdjuster;
- (PXStoryStyleScrollContentLayout)styleScrollContentLayout;
- (id)modelChangeOrigin;
- (int64_t)scrollPositionComparedToEnd;
- (void)_invalidateContentScrollPositionWithReason:(unint64_t)a3;
- (void)_invalidateContentView;
- (void)_invalidateModelIsScrolling;
- (void)_invalidateModelScrollPosition;
- (void)_invalidatePostUpdateEntities:(unint64_t)a3;
- (void)_invalidateScrollDecelerationRate;
- (void)_invalidateScrollViewZPosition;
- (void)_invalidateWantsScrollView;
- (void)_updateContentScrollPosition;
- (void)_updateContentView;
- (void)_updateModelIsScrolling;
- (void)_updateModelScrollPosition;
- (void)_updateScrollDecelerationRate;
- (void)_updateScrollViewZPosition;
- (void)_updateWantsScrollView;
- (void)contentLayoutDidChange;
- (void)didUpdate;
- (void)isScrollingDidChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceSizeDidChange;
- (void)scrollLayoutDidScroll:(id)a3;
- (void)scrollLayoutWillBeginScrolling:(id)a3;
- (void)scrollLayoutWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6;
- (void)setScrollBeganAtTimelineEnd:(BOOL)a3;
- (void)setTargetContentOffsetAdjuster:(id)a3;
- (void)update;
- (void)willUpdate;
@end

@implementation PXStoryScrollLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContentOffsetAdjuster, 0);
  objc_storeStrong(&self->_modelChangeOrigin, 0);
  objc_storeStrong((id *)&self->_styleScrollContentLayout, 0);
  objc_storeStrong((id *)&self->_pagedScrollContentLayout, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (void)setScrollBeganAtTimelineEnd:(BOOL)a3
{
  self->_scrollBeganAtTimelineEnd = a3;
}

- (BOOL)scrollBeganAtTimelineEnd
{
  return self->_scrollBeganAtTimelineEnd;
}

- (void)setTargetContentOffsetAdjuster:(id)a3
{
}

- (PXStoryScrollLayoutTargetContentOffsetAdjuster)targetContentOffsetAdjuster
{
  return self->_targetContentOffsetAdjuster;
}

- (id)modelChangeOrigin
{
  return self->_modelChangeOrigin;
}

- (PXStoryStyleScrollContentLayout)styleScrollContentLayout
{
  return self->_styleScrollContentLayout;
}

- (PXStoryPagedScrollContentLayout)pagedScrollContentLayout
{
  return self->_pagedScrollContentLayout;
}

- (PXStoryModel)model
{
  return self->_model;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)ModelObservationContext_189974 == a5)
  {
    if ((a4 & 0x10000) != 0) {
      [(PXStoryScrollLayout *)self _invalidateContentView];
    }
    if ((a4 & 0x10004) != 0)
    {
      v9 = [(PXStoryScrollLayout *)self model];
      v10 = [v9 changesOrigins];
      v11 = [(PXStoryScrollLayout *)self modelChangeOrigin];
      char v12 = [v10 containsObject:v11];

      if ((v12 & 1) == 0) {
        [(PXStoryScrollLayout *)self _invalidateContentScrollPositionWithReason:0];
      }
    }
    if ((a4 & 0x2000) != 0) {
      [(PXStoryScrollLayout *)self _invalidateScrollDecelerationRate];
    }
    if ((a4 & 0x8000000) != 0) {
      [(PXStoryScrollLayout *)self _invalidateWantsScrollView];
    }
  }
  else if ((void *)StyleManagerObservationContext_189975 == a5)
  {
    if ((a4 & 0x100) != 0)
    {
      v13 = [(PXStoryScrollLayout *)self model];
      v14 = [v13 styleManager];
      char v15 = [v14 changesOrigin];

      if ((v15 & 4) != 0) {
        [(PXStoryScrollLayout *)self _invalidateContentScrollPositionWithReason:0];
      }
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)PXStoryScrollLayout;
    [(PXGScrollLayout *)&v16 observable:v8 didChange:a4 context:a5];
  }
}

- (void)scrollLayoutWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  double y = a4.y;
  double x = a4.x;
  v10 = [(PXStoryScrollLayout *)self targetContentOffsetAdjuster];
  objc_msgSend(v10, "adjustScrollTargetContentOffset:withVelocity:", a5, x, y);

  if ([(PXStoryScrollLayout *)self scrollBeganAtTimelineEnd]
    && x > 0.0
    && [(PXStoryScrollLayout *)self scrollPositionComparedToEnd] != -1)
  {
    id v11 = [(PXStoryScrollLayout *)self model];
    [v11 performChanges:&__block_literal_global_189978];
  }
}

uint64_t __106__PXStoryScrollLayout_scrollLayoutWillEndScrolling_withVelocity_targetContentOffset_currentContentOffset___block_invoke(uint64_t a1, void *a2)
{
  return [a2 flickedPastEnd];
}

- (void)scrollLayoutDidScroll:(id)a3
{
  if ([(PXGScrollLayout *)self isScrolling])
  {
    [(PXStoryScrollLayout *)self _invalidateModelScrollPosition];
  }
}

- (void)scrollLayoutWillBeginScrolling:(id)a3
{
  BOOL v4 = [(PXStoryScrollLayout *)self scrollPositionComparedToEnd] == 0;
  [(PXStoryScrollLayout *)self setScrollBeganAtTimelineEnd:v4];
}

- (void)_updateModelScrollPosition
{
  v3 = [(PXGScrollLayout *)self contentLayout];
  BOOL v4 = [(PXStoryScrollLayout *)self model];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  id v8 = v3;
  v9 = self;
  id v5 = v3;
  v6 = [(PXStoryScrollLayout *)self modelChangeOrigin];
  [v4 performChanges:&v7 origin:v6];
}

void __49__PXStoryScrollLayout__updateModelScrollPosition__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) pagedScrollContentLayout];

  v6 = *(void **)(a1 + 40);
  if (v4 == v5)
  {
    v13 = [v6 pagedScrollContentLayout];
    id v12 = v13;
    if (v13) {
      [v13 presentedScrollPosition];
    }
    else {
      memset(v16, 0, sizeof(v16));
    }
    [v3 scrollToPosition:v16];
    goto LABEL_8;
  }
  uint64_t v7 = [v6 contentLayout];
  id v8 = [*(id *)(a1 + 40) styleScrollContentLayout];

  if (v7 == v8)
  {
    v9 = [*(id *)(a1 + 40) styleScrollContentLayout];
    v10 = [*(id *)(a1 + 40) model];
    id v11 = [v10 styleManager];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49__PXStoryScrollLayout__updateModelScrollPosition__block_invoke_2;
    v14[3] = &unk_1E5DC3518;
    id v15 = v9;
    id v12 = v9;
    [v11 performChanges:v14 origin:1];

LABEL_8:
  }
}

void __49__PXStoryScrollLayout__updateModelScrollPosition__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  double v4 = (double)[v3 focusedStyleIndex];
  [*(id *)(a1 + 32) focusOffset];
  [v6 setSelectionFocus:v5 + v4];
}

- (void)_invalidateModelScrollPosition
{
}

- (void)_updateModelIsScrolling
{
  id v3 = [(PXStoryScrollLayout *)self model];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PXStoryScrollLayout__updateModelIsScrolling__block_invoke;
  v5[3] = &unk_1E5DCEE38;
  v5[4] = self;
  double v4 = [(PXStoryScrollLayout *)self modelChangeOrigin];
  [v3 performChanges:v5 origin:v4];
}

void __46__PXStoryScrollLayout__updateModelIsScrolling__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setIsScrolling:", objc_msgSend(v2, "isScrolling"));
}

- (void)_invalidateModelIsScrolling
{
}

- (void)_invalidatePostUpdateEntities:(unint64_t)a3
{
  p_postUpdateFlags = &self->_postUpdateFlags;
  unint64_t needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (!a3 || needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_11:
      p_postUpdateFlags->unint64_t needsUpdate = needsUpdate | a3;
      return;
    }
LABEL_10:
    if ((self->_postUpdateFlags.updated & a3) != 0)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      id v8 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout _invalidatePostUpdateEntities:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXStoryScrollLayout.m", 254, @"invalidating %lu after it already has been updated", a3);

      abort();
    }
    goto LABEL_11;
  }
  if (self->_postUpdateFlags.isPerformingUpdate) {
    goto LABEL_10;
  }
  BOOL willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->unint64_t needsUpdate = a3;
  if (!willPerformUpdate && !self->_isUpdating)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateWantsScrollView
{
  id v3 = [(PXStoryScrollLayout *)self model];
  -[PXGScrollLayout setWantsScrollView:](self, "setWantsScrollView:", [v3 allowsScrolling]);
}

- (void)_invalidateWantsScrollView
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
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout _invalidateWantsScrollView]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrollLayout.m", 246, @"invalidating %lu after it already has been updated", 16);

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

- (void)_updateScrollViewZPosition
{
  [(PXGLayout *)self referenceDepth];
  *(float *)&double v3 = v3;
  *(float *)&double v3 = -*(float *)&v3;
  [(PXGScrollLayout *)self setScrollViewSpriteZPosition:v3];
}

- (void)_invalidateScrollViewZPosition
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
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout _invalidateScrollViewZPosition]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrollLayout.m", 238, @"invalidating %lu after it already has been updated", 8);

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

- (void)_updateScrollDecelerationRate
{
  id v4 = [(PXStoryScrollLayout *)self model];
  double v3 = [v4 layoutSpec];
  -[PXGScrollLayout setScrollDecelerationRate:](self, "setScrollDecelerationRate:", [v3 scrollDecelerationRate]);
}

- (void)_invalidateScrollDecelerationRate
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
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout _invalidateScrollDecelerationRate]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrollLayout.m", 230, @"invalidating %lu after it already has been updated", 2);

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

- (void)_updateContentScrollPosition
{
  double v3 = [(PXStoryScrollLayout *)self model];
  uint64_t v4 = [v3 viewMode];

  if (v4 != 3)
  {
    double v5 = [(PXGScrollLayout *)self contentLayout];
    id v6 = [(PXStoryScrollLayout *)self pagedScrollContentLayout];

    if (v5 == v6)
    {
      if (!self->_scrollPositionUpdateReason)
      {
        id v8 = [(PXStoryScrollLayout *)self pagedScrollContentLayout];
        v13 = [(PXStoryScrollLayout *)self model];
        v9 = v13;
        if (v13) {
          [v13 currentScrollPosition];
        }
        else {
          memset(v15, 0, sizeof(v15));
        }
        v10 = [v8 createAnchorForScrollingToPosition:v15];
        id v14 = (id)[v10 autoInvalidate];
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v7 = [(PXStoryScrollLayout *)self styleScrollContentLayout];

      if (v5 == v7)
      {
        id v8 = [(PXStoryScrollLayout *)self styleScrollContentLayout];
        v9 = [(PXStoryScrollLayout *)self model];
        v10 = [v9 styleManager];
        [v10 selectionFocus];
        id v11 = objc_msgSend(v8, "createAnchorForScrollingToStyleFocus:");
        id v12 = (id)[v11 autoInvalidate];

LABEL_10:
      }
    }
  }
}

- (void)_invalidateContentScrollPositionWithReason:(unint64_t)a3
{
  [(PXGScrollLayout *)self stopScrolling];
  self->_scrollPositionUpdateReason = a3;
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
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      v9 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout _invalidateContentScrollPositionWithReason:]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PXStoryScrollLayout.m", 211, @"invalidating %lu after it already has been updated", 1);

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

- (void)_updateContentView
{
  uint64_t v4 = [(PXStoryScrollLayout *)self model];
  uint64_t v5 = [v4 viewMode];

  uint64_t v6 = 0;
  switch(v5)
  {
    case 0:
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"PXStoryScrollLayout.m" lineNumber:185 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
    case 3:
    case 5:
      uint64_t v6 = [(PXStoryScrollLayout *)self pagedScrollContentLayout];
      break;
    case 4:
      uint64_t v6 = [(PXStoryScrollLayout *)self styleScrollContentLayout];
      break;
    default:
      break;
  }
  id v8 = (id)v6;
  [(PXGScrollLayout *)self setShowsVerticalScrollIndicator:0];
  [(PXGScrollLayout *)self setContentLayout:v8];
}

- (void)_invalidateContentView
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
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout _invalidateContentView]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryScrollLayout.m", 177, @"invalidating %lu after it already has been updated", 4);

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

- (void)didUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)PXStoryScrollLayout;
  [(PXGScrollLayout *)&v7 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    double v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryScrollLayout.m", 172, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
  if (self->_postUpdateFlags.willPerformUpdate)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout didUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXStoryScrollLayout.m", 173, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (void)update
{
  BOOL isUpdating = self->_isUpdating;
  self->_BOOL isUpdating = 1;
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      id v14 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout update]"];
      [v13 handleFailureInFunction:v14, @"PXStoryScrollLayout.m", 138, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 4;
    if ((needsUpdate & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFBLL;
      [(PXStoryScrollLayout *)self _updateContentView];
      if (!p_updateFlags->isPerformingUpdate)
      {
        v27 = [MEMORY[0x1E4F28B00] currentHandler];
        v28 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout update]"];
        [v27 handleFailureInFunction:v28, @"PXStoryScrollLayout.m", 142, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 1uLL;
    if (v6)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryScrollLayout *)self _updateContentScrollPosition];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_super v16 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout update]"];
      [v15 handleFailureInFunction:v16, @"PXStoryScrollLayout.m", 145, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v7 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXStoryScrollLayout *)self _updateScrollDecelerationRate];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      v18 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout update]"];
      [v17 handleFailureInFunction:v18, @"PXStoryScrollLayout.m", 148, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v8 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v8 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v8 & 0xFFFFFFFFFFFFFFF7;
      [(PXStoryScrollLayout *)self _updateScrollViewZPosition];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      v20 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout update]"];
      [v19 handleFailureInFunction:v20, @"PXStoryScrollLayout.m", 151, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v9 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v9 & 0x10) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v9 & 0xFFFFFFFFFFFFFFEFLL;
      [(PXStoryScrollLayout *)self _updateWantsScrollView];
      unint64_t v9 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v9)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      v22 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout update]"];
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"PXStoryScrollLayout.m", 154, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)PXStoryScrollLayout;
  [(PXGScrollLayout *)&v31 update];
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.BOOL willPerformUpdate = 0;
  unint64_t v11 = self->_postUpdateFlags.needsUpdate;
  if (v11)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      v24 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout update]"];
      [v23 handleFailureInFunction:v24, @"PXStoryScrollLayout.m", 158, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t v11 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 1024;
    if ((v11 & 0x400) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v11 & 0xFFFFFFFFFFFFFBFFLL;
      [(PXStoryScrollLayout *)self _updateModelIsScrolling];
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
        v29 = [MEMORY[0x1E4F28B00] currentHandler];
        v30 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout update]"];
        [v29 handleFailureInFunction:v30, @"PXStoryScrollLayout.m", 162, @"Invalid parameter not satisfying: %@", @"_postUpdateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v12 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x800uLL;
    if ((v12 & 0x800) != 0)
    {
      p_postUpdateFlags->unint64_t needsUpdate = v12 & 0xFFFFFFFFFFFFF7FFLL;
      [(PXStoryScrollLayout *)self _updateModelScrollPosition];
      unint64_t v12 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v12)
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      v26 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout update]"];
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"PXStoryScrollLayout.m", 165, @"still needing to update %lu after update pass", p_postUpdateFlags->needsUpdate);
    }
  }
  self->_BOOL isUpdating = isUpdating;
}

- (void)willUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)PXStoryScrollLayout;
  [(PXGScrollLayout *)&v7 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    double v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryScrollLayout.m", 130, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
  self->_postUpdateFlags.BOOL willPerformUpdate = 1;
  if (self->_postUpdateFlags.isPerformingUpdate)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v6 = [NSString stringWithUTF8String:"-[PXStoryScrollLayout willUpdate]"];
    [v5 handleFailureInFunction:v6, @"PXStoryScrollLayout.m", 131, @"Invalid parameter not satisfying: %@", @"!_postUpdateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (int64_t)scrollPositionComparedToEnd
{
  double v3 = [(PXStoryScrollLayout *)self model];
  if ([v3 viewMode] != 1)
  {
    int64_t v9 = -1;
    goto LABEL_18;
  }
  uint64_t v4 = [(PXStoryScrollLayout *)self pagedScrollContentLayout];
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v16 = 0;
    double v6 = 0.0;
    uint64_t v18 = 0;
    goto LABEL_7;
  }
  [v4 presentedScrollPosition];
  double v6 = v17;
  if (v17 <= 0.5)
  {
LABEL_7:
    uint64_t v7 = v16;
    uint64_t v8 = v18;
    goto LABEL_8;
  }
  double v6 = 1.0 - v17;
  uint64_t v7 = v18;
  uint64_t v8 = v16;
LABEL_8:

  v10 = [v3 timeline];
  unint64_t v11 = v10;
  if (v6 > 0.5) {
    uint64_t v7 = v8;
  }
  if (v7 == [v10 lastSegmentIdentifier])
  {
    double v12 = 1.0 - v6;
    if (v6 <= 0.5) {
      double v12 = v6;
    }
    if (v12 == 0.0 || [v11 numberOfSegments] < 2)
    {
      int64_t v9 = 0;
    }
    else
    {
      uint64_t v14 = objc_msgSend(v11, "identifierForSegmentAtIndex:", objc_msgSend(v11, "numberOfSegments") - 2);
      if (v6 < 0.0 && v8 == v14) {
        int64_t v9 = 1;
      }
      else {
        int64_t v9 = -1;
      }
    }
  }
  else
  {
    int64_t v9 = -1;
  }

LABEL_18:
  return v9;
}

- (void)contentLayoutDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)PXStoryScrollLayout;
  [(PXGScrollLayout *)&v6 contentLayoutDidChange];
  [(PXStoryScrollLayout *)self _invalidateScrollDecelerationRate];
  double v3 = [(PXGScrollLayout *)self contentLayout];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(PXGScrollLayout *)self contentLayout];
    [(PXStoryScrollLayout *)self setTargetContentOffsetAdjuster:v5];
  }
  else
  {
    [(PXStoryScrollLayout *)self setTargetContentOffsetAdjuster:0];
  }
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrollLayout;
  [(PXGScrollLayout *)&v3 referenceSizeDidChange];
  [(PXStoryScrollLayout *)self _invalidateScrollViewZPosition];
}

- (void)isScrollingDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryScrollLayout;
  [(PXGScrollLayout *)&v3 isScrollingDidChange];
  [(PXStoryScrollLayout *)self _invalidateModelIsScrolling];
}

- (PXStoryScrollLayout)initWithModel:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PXStoryScrollLayout;
  objc_super v6 = [(PXGScrollLayout *)&v20 init];
  uint64_t v7 = v6;
  if (v6)
  {
    p_model = (id *)&v6->_model;
    objc_storeStrong((id *)&v6->_model, a3);
    [*p_model registerChangeObserver:v7 context:ModelObservationContext_189974];
    int64_t v9 = [*p_model styleManager];
    [v9 registerChangeObserver:v7 context:StyleManagerObservationContext_189975];

    v10 = [[PXStoryPagedScrollContentLayout alloc] initWithModel:*p_model];
    pagedScrollContentLayout = v7->_pagedScrollContentLayout;
    v7->_pagedScrollContentLayout = v10;

    double v12 = [[PXStoryStyleScrollContentLayout alloc] initWithModel:*p_model];
    styleScrollContentLayout = v7->_styleScrollContentLayout;
    v7->_styleScrollContentLayout = v12;

    id v14 = [NSString alloc];
    id v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    uint64_t v17 = [v14 initWithFormat:@"changeOrigin-%@-%p", v16, v7];
    id modelChangeOrigin = v7->_modelChangeOrigin;
    v7->_id modelChangeOrigin = (id)v17;

    [(PXGScrollLayout *)v7 setShowsHorizontalScrollIndicator:0];
    [(PXGScrollLayout *)v7 setShowsVerticalScrollIndicator:0];
    [(PXGScrollLayout *)v7 setContentLayout:v7->_pagedScrollContentLayout];
    [(PXGScrollLayout *)v7 setDelegate:v7];
    [(PXStoryScrollLayout *)v7 _invalidateContentView];
    [(PXStoryScrollLayout *)v7 _invalidateScrollDecelerationRate];
    [(PXStoryScrollLayout *)v7 _invalidateWantsScrollView];
  }

  return v7;
}

- (PXStoryScrollLayout)init
{
  char v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryScrollLayout.m", 61, @"%s is not available as initializer", "-[PXStoryScrollLayout init]");

  abort();
}

@end