@interface PXFeedViewScrollLayout
- (PXFeedContentLayout)feedContentLayout;
- (PXFeedViewModel)viewModel;
- (PXFeedViewScrollLayout)init;
- (PXFeedViewScrollLayout)initWithViewModel:(id)a3 displayingFeedContentLayout:(id)a4;
- (UIEdgeInsets)safeAreaInsets;
- (id)itemPlacementControllerForItemReference:(id)a3;
- (int64_t)scrollableAxis;
- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (unint64_t)contentChangeTrend;
- (void)_invalidateAnchorForVisibleArea;
- (void)_invalidateContentSize;
- (void)_invalidateScrollParameters;
- (void)_updateAnchorForVisibleArea;
- (void)_updateContentSize;
- (void)_updateScrollParameters;
- (void)clearLastVisibleAreaAnchoringInformation;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceSizeDidChange;
- (void)scrollLayoutWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6;
- (void)update;
@end

@implementation PXFeedViewScrollLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedContentLayout, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (PXFeedContentLayout)feedContentLayout
{
  return self->_feedContentLayout;
}

- (PXFeedViewModel)viewModel
{
  return self->_viewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8 = a3;
  if ((void *)ViewModelObservationContext_182313 == a5)
  {
    if ((a4 & 8) != 0)
    {
      [(PXFeedViewScrollLayout *)self _invalidateContentSize];
      [(PXFeedViewScrollLayout *)self _invalidateScrollParameters];
    }
    if ((a4 & 0xA) != 0) {
      [(PXFeedViewScrollLayout *)self _invalidateAnchorForVisibleArea];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PXFeedViewScrollLayout;
    [(PXGScrollLayout *)&v9 observable:v8 didChange:a4 context:a5];
  }
}

- (void)scrollLayoutWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  v7 = [(PXFeedViewScrollLayout *)self viewModel];
  id v10 = [v7 spec];

  id v8 = [v10 scrollBehavior];
  objc_super v9 = [(PXGScrollLayout *)self contentLayout];
  [v9 visibleRect];

  [v8 axis];
  PXPointValueForAxis();
}

- (void)clearLastVisibleAreaAnchoringInformation
{
  if (self->_isClearingLastVisibleAreaAnchoringInformation)
  {
    v4.receiver = self;
    v4.super_class = (Class)PXFeedViewScrollLayout;
    [(PXGLayout *)&v4 clearLastVisibleAreaAnchoringInformation];
  }
  else
  {
    self->_isClearingLastVisibleAreaAnchoringInformation = 1;
    v3 = [(PXGLayout *)self rootLayout];
    [v3 clearLastVisibleAreaAnchoringInformation];

    self->_isClearingLastVisibleAreaAnchoringInformation = 0;
  }
}

- (void)_updateScrollParameters
{
  v3 = [(PXFeedViewScrollLayout *)self viewModel];
  id v6 = [v3 spec];

  objc_super v4 = [v6 scrollBehavior];
  unint64_t v5 = [v4 decelerationRate];

  if (v5 <= 1) {
    [(PXGScrollLayout *)self setScrollDecelerationRate:v5];
  }
  -[PXGScrollLayout setShowsVerticalScrollIndicator:](self, "setShowsVerticalScrollIndicator:", [v6 wantsScrollIndicators]);
  -[PXGScrollLayout setShowsHorizontalScrollIndicator:](self, "setShowsHorizontalScrollIndicator:", [v6 wantsScrollIndicators]);
  [v6 verticalScrollIndicatorInsets];
  -[PXGScrollLayout setVerticalScrollIndicatorInsets:](self, "setVerticalScrollIndicatorInsets:");
  [v6 horizontalScrollIndicatorInsets];
  -[PXGScrollLayout setHorizontalScrollIndicatorInsets:](self, "setHorizontalScrollIndicatorInsets:");
}

- (void)_invalidateScrollParameters
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
      unint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXFeedViewScrollLayout _invalidateScrollParameters]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXFeedViewScrollLayout.m", 125, @"invalidating %lu after it already has been updated", 2);

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

- (void)_updateContentSize
{
  [(PXGLayout *)self referenceSize];
  double v4 = v3;
  double v6 = v5;
  v7 = [(PXFeedViewScrollLayout *)self viewModel];
  id v12 = [v7 spec];

  if (v12)
  {
    objc_msgSend(v12, "sizeThatFits:", v4, v6);
    double v4 = v8;
    double v6 = v9;
  }
  id v10 = [NSNumber numberWithDouble:v4];
  [(PXGScrollLayout *)self setFixedWidth:v10];

  v11 = [NSNumber numberWithDouble:v6];
  [(PXGScrollLayout *)self setFixedHeight:v11];
}

- (void)_invalidateContentSize
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
      double v6 = [NSString stringWithUTF8String:"-[PXFeedViewScrollLayout _invalidateContentSize]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXFeedViewScrollLayout.m", 113, @"invalidating %lu after it already has been updated", 1);

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

- (void)_updateAnchorForVisibleArea
{
  id v4 = [(PXGLayout *)self rootLayout];
  v2 = [v4 createAnchorForVisibleArea];
  id v3 = (id)[v2 autoInvalidate];
}

- (void)_invalidateAnchorForVisibleArea
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
      double v6 = [NSString stringWithUTF8String:"-[PXFeedViewScrollLayout _invalidateAnchorForVisibleArea]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXFeedViewScrollLayout.m", 104, @"invalidating %lu after it already has been updated", 4);

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

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      double v8 = [NSString stringWithUTF8String:"-[PXFeedViewScrollLayout update]"];
      [v7 handleFailureInFunction:v8, @"PXFeedViewScrollLayout.m", 89, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 4;
    if ((needsUpdate & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFBLL;
      [(PXFeedViewScrollLayout *)self _updateAnchorForVisibleArea];
      if (!p_updateFlags->isPerformingUpdate)
      {
        v13 = [MEMORY[0x1E4F28B00] currentHandler];
        v14 = [NSString stringWithUTF8String:"-[PXFeedViewScrollLayout update]"];
        [v13 handleFailureInFunction:v14, @"PXFeedViewScrollLayout.m", 93, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 1uLL;
    if (v5)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFELL;
      [(PXFeedViewScrollLayout *)self _updateContentSize];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      id v10 = [NSString stringWithUTF8String:"-[PXFeedViewScrollLayout update]"];
      [v9 handleFailureInFunction:v10, @"PXFeedViewScrollLayout.m", 96, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v6 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXFeedViewScrollLayout *)self _updateScrollParameters];
      unint64_t v6 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v6)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      id v12 = [NSString stringWithUTF8String:"-[PXFeedViewScrollLayout update]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, @"PXFeedViewScrollLayout.m", 99, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)PXFeedViewScrollLayout;
  [(PXGScrollLayout *)&v15 update];
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PXFeedViewScrollLayout *)self feedContentLayout];
  unint64_t v6 = [v5 itemPlacementControllerForItemReference:v4];

  return v6;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v7 = a3;
  double v8 = [(PXGScrollLayout *)self contentLayout];
  if (v8) {
    int64_t v9 = [(PXGLayout *)self indexOfSublayout:v8];
  }
  else {
    int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v10 = v7;
  *a5 = v10;

  return v9;
}

- (UIEdgeInsets)safeAreaInsets
{
  id v3 = [(PXFeedViewScrollLayout *)self viewModel];
  id v4 = [v3 spec];
  if ([v4 wantsSafeAreaInsets])
  {
    v17.receiver = self;
    v17.super_class = (Class)PXFeedViewScrollLayout;
    [(PXGLayout *)&v17 safeAreaInsets];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *(double *)off_1E5DAAF10;
    double v8 = *((double *)off_1E5DAAF10 + 1);
    double v10 = *((double *)off_1E5DAAF10 + 2);
    double v12 = *((double *)off_1E5DAAF10 + 3);
  }

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (int64_t)scrollableAxis
{
  return 0;
}

- (unint64_t)contentChangeTrend
{
  return 4;
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXFeedViewScrollLayout;
  [(PXGScrollLayout *)&v3 referenceSizeDidChange];
  [(PXFeedViewScrollLayout *)self _invalidateContentSize];
}

- (PXFeedViewScrollLayout)initWithViewModel:(id)a3 displayingFeedContentLayout:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXFeedViewScrollLayout;
  double v9 = [(PXGScrollLayout *)&v12 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    [(PXFeedViewModel *)v10->_viewModel registerChangeObserver:v10 context:ViewModelObservationContext_182313];
    objc_storeStrong((id *)&v10->_feedContentLayout, a4);
    [(PXGScrollLayout *)v10 setContentLayout:v8];
    [(PXGScrollLayout *)v10 setDelegate:v10];
    [(PXFeedViewScrollLayout *)v10 _invalidateScrollParameters];
  }

  return v10;
}

- (PXFeedViewScrollLayout)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFeedViewScrollLayout.m", 38, @"%s is not available as initializer", "-[PXFeedViewScrollLayout init]");

  abort();
}

@end