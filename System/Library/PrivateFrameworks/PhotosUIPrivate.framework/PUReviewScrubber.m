@interface PUReviewScrubber
- (BOOL)_ignoreScrollViewDidScrollUpdate;
- (BOOL)_performingInteractiveUpdate;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isMinibar;
- (CGPoint)contentOffsetForIndexPath:(id)a3 inCollectionView:(id)a4;
- (CGPoint)contentOffsetForItemAtIndex:(int64_t)a3 ofScrollView:(id)a4;
- (CGSize)itemSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (Class)scrubberCellClass;
- (NSIndexPath)_indexPathForPreviousFeedbackQuery;
- (NSIndexPath)selectedIndexPath;
- (NSNumber)cellAspectRatio;
- (NSString)cellReuseIdentifier;
- (PUHorizontalCollectionViewLayout)_collectionViewLayout;
- (PUReviewScrubber)initWithCoder:(id)a3;
- (PUReviewScrubber)initWithFrame:(CGRect)a3;
- (PUReviewScrubberDataSource)dataSource;
- (PUReviewScrubberDelegate)scrubberDelegate;
- (UICollectionView)_collectionView;
- (UIImageView)_arrowImageView;
- (UIImageView)_shadowView;
- (UIImpactFeedbackGenerator)_impactFeedbackBehavior;
- (UITapGestureRecognizer)_tapGestureRecognizer;
- (_UIBackdropView)_backdropView;
- (id)_indexPathInCollectionView:(id)a3 closestToPoint:(CGPoint)a4 excludingIndexPath:(id)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)indexPathUnderTickMarkInCollectionView:(id)a3 atContentOffset:(CGPoint)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_beginFeedbackInteraction;
- (void)_commonPUReviewScrubberInitialization;
- (void)_endFeedbackInteraction;
- (void)_handleTapAtIndexPath:(id)a3;
- (void)_handleTapOnReviewScrubber:(id)a3;
- (void)_notifyDelegateOfScrub;
- (void)_notifyDelegateOfSelection;
- (void)_playFeedbackIfNeeded;
- (void)_setIndexPathForPreviousFeedbackQuery:(id)a3;
- (void)_updateContentOffsetForSelectedIndexPathAnimated:(BOOL)a3;
- (void)_updateToSelectedIndexPath:(id)a3;
- (void)beginInteractiveUpdate;
- (void)dealloc;
- (void)finishInteractiveUpdate;
- (void)layoutSubviews;
- (void)reloadData;
- (void)reloadIndexPath:(id)a3 animated:(BOOL)a4;
- (void)reloadSelectedIndexPathAnimated:(BOOL)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setCellAspectRatio:(id)a3;
- (void)setCellReuseIdentifier:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setScrubberCellClass:(Class)a3;
- (void)setScrubberDelegate:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setSelectedIndexPath:(id)a3 animated:(BOOL)a4;
- (void)toggleIndexPath:(id)a3 animated:(BOOL)a4;
- (void)toggleSelectedIndexPathAnimated:(BOOL)a3;
- (void)updateWithAbsoluteProgress:(double)a3;
@end

@implementation PUReviewScrubber

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__indexPathForPreviousFeedbackQuery, 0);
  objc_storeStrong((id *)&self->__impactFeedbackBehavior, 0);
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_cellReuseIdentifier, 0);
  objc_storeStrong((id *)&self->__collectionView, 0);
  objc_storeStrong((id *)&self->__collectionViewLayout, 0);
  objc_storeStrong((id *)&self->__arrowImageView, 0);
  objc_storeStrong((id *)&self->__shadowView, 0);
  objc_storeStrong((id *)&self->__backdropView, 0);
  objc_storeStrong((id *)&self->_scrubberCellClass, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_destroyWeak((id *)&self->_scrubberDelegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_cellAspectRatio, 0);
}

- (void)_setIndexPathForPreviousFeedbackQuery:(id)a3
{
}

- (NSIndexPath)_indexPathForPreviousFeedbackQuery
{
  return self->__indexPathForPreviousFeedbackQuery;
}

- (UIImpactFeedbackGenerator)_impactFeedbackBehavior
{
  return self->__impactFeedbackBehavior;
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (BOOL)_performingInteractiveUpdate
{
  return self->__performingInteractiveUpdate;
}

- (BOOL)_ignoreScrollViewDidScrollUpdate
{
  return self->__ignoreScrollViewDidScrollUpdate;
}

- (void)setCellReuseIdentifier:(id)a3
{
}

- (NSString)cellReuseIdentifier
{
  return self->_cellReuseIdentifier;
}

- (UICollectionView)_collectionView
{
  return self->__collectionView;
}

- (PUHorizontalCollectionViewLayout)_collectionViewLayout
{
  return self->__collectionViewLayout;
}

- (UIImageView)_arrowImageView
{
  return self->__arrowImageView;
}

- (UIImageView)_shadowView
{
  return self->__shadowView;
}

- (_UIBackdropView)_backdropView
{
  return self->__backdropView;
}

- (Class)scrubberCellClass
{
  return self->_scrubberCellClass;
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setScrubberDelegate:(id)a3
{
}

- (PUReviewScrubberDelegate)scrubberDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubberDelegate);
  return (PUReviewScrubberDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (PUReviewScrubberDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PUReviewScrubberDataSource *)WeakRetained;
}

- (NSNumber)cellAspectRatio
{
  return self->_cellAspectRatio;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  v7 = (UITapGestureRecognizer *)a3;
  v8 = [(PUReviewScrubber *)self _collectionView];
  tapGestureRecognizer = self->__tapGestureRecognizer;

  if (tapGestureRecognizer == v7)
  {
    id v11 = [v8 panGestureRecognizer];
    if (v11 == v6) {
      char v10 = [v8 isDecelerating];
    }
    else {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PUReviewScrubber *)self cellReuseIdentifier];
  v9 = [v7 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v6];

  char v10 = [(PUReviewScrubber *)self scrubberDelegate];
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v10 reviewScrubber:self willDisplayCell:v9 atIndexPath:v6];
  }

  return v9;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (!WeakRetained) {
    return 0;
  }
  v8 = WeakRetained;
  id v9 = objc_loadWeakRetained((id *)p_dataSource);
  char v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) == 0) {
    return 0;
  }
  id v11 = objc_loadWeakRetained((id *)p_dataSource);
  int64_t v12 = [v11 reviewScrubber:self numberOfItemsInSection:a4];

  return v12;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (!WeakRetained) {
    return 1;
  }
  id v6 = WeakRetained;
  id v7 = objc_loadWeakRetained((id *)p_dataSource);
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0) {
    return 1;
  }
  id v9 = objc_loadWeakRetained((id *)p_dataSource);
  int64_t v10 = [v9 numberOfSectionsInReviewScrubber:self];

  return v10;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = a3;
  id v16 = [v7 collectionViewLayout];
  char v8 = -[PUReviewScrubber indexPathUnderTickMarkInCollectionView:atContentOffset:](self, "indexPathUnderTickMarkInCollectionView:atContentOffset:", v7, a5->x, a5->y);
  id v9 = [v16 layoutAttributesForItemAtIndexPath:v8];
  [v9 frame];
  double v11 = v10;
  CGFloat v13 = v12;
  [v7 contentInset];
  double v15 = v14;

  a5->x = v11 - v15;
  a5->y = v13;
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(PUReviewScrubber *)self _endFeedbackInteraction];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!self->__ignoreScrollViewDidScrollUpdate)
  {
    id v9 = v4;
    char v6 = [v4 _isAnimatingScroll];
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      id v7 = v9;
      [v7 contentOffset];
      char v8 = -[PUReviewScrubber indexPathUnderTickMarkInCollectionView:atContentOffset:](self, "indexPathUnderTickMarkInCollectionView:atContentOffset:", v7);

      [(PUReviewScrubber *)self _updateToSelectedIndexPath:v8];
      [(PUReviewScrubber *)self _notifyDelegateOfScrub];
      [(PUReviewScrubber *)self _playFeedbackIfNeeded];

      v5 = v9;
    }
  }
}

- (CGSize)itemSize
{
  v2 = [(PUReviewScrubber *)self cellAspectRatio];
  [v2 doubleValue];

  JUMPOUT(0x1B3E7B920);
}

- (void)_notifyDelegateOfSelection
{
  uint64_t v3 = [(PUReviewScrubber *)self scrubberDelegate];
  if (v3)
  {
    v5 = (void *)v3;
    uint64_t v3 = objc_opt_respondsToSelector();
    if (v3)
    {
      id v4 = [(PUReviewScrubber *)self selectedIndexPath];
      [v5 reviewScrubberDidSelectItemAtIndexPath:v4];
    }
  }
  MEMORY[0x1F4181820](v3);
}

- (void)_notifyDelegateOfScrub
{
  uint64_t v3 = [(PUReviewScrubber *)self scrubberDelegate];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v3 = objc_opt_respondsToSelector();
    if (v3) {
      uint64_t v3 = [v4 reviewScrubberDidScrub:self];
    }
  }
  MEMORY[0x1F4181820](v3);
}

- (void)_updateToSelectedIndexPath:(id)a3
{
  id v5 = a3;
  p_selectedIndexPath = &self->_selectedIndexPath;
  id v9 = v5;
  if (!*p_selectedIndexPath || (uint64_t v7 = objc_msgSend(v5, "compare:"), v8 = v9, v7))
  {
    objc_storeStrong((id *)p_selectedIndexPath, a3);
    char v8 = v9;
  }
}

- (CGPoint)contentOffsetForItemAtIndex:(int64_t)a3 ofScrollView:(id)a4
{
  id v6 = a4;
  [v6 contentInset];
  double v8 = v7;
  double v10 = v9;
  [v6 contentOffset];
  double v12 = v11;

  [(PUReviewScrubber *)self itemSize];
  double v14 = (v13 + 3.0) * (double)a3 - v10;
  double v15 = v12 - v8;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGPoint)contentOffsetForIndexPath:(id)a3 inCollectionView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 contentInset];
  double v9 = v8;
  double v11 = v10;
  [v7 contentOffset];
  double v13 = v12;
  double v14 = [v7 collectionViewLayout];
  double v15 = [v14 layoutAttributesForItemAtIndexPath:v6];
  id v16 = v15;
  if (v15)
  {
    [v15 frame];
    double v18 = v17 - v11;
    double v19 = v13 - v9;
  }
  else
  {
    uint64_t v20 = [v6 item];
    if ([v6 section] >= 1)
    {
      uint64_t v21 = 0;
      do
        v20 += [(PUReviewScrubber *)self collectionView:v7 numberOfItemsInSection:v21++];
      while (v21 < [v6 section]);
    }
    [(PUReviewScrubber *)self contentOffsetForItemAtIndex:v20 ofScrollView:v7];
    double v18 = v22;
    double v19 = v23;
  }

  double v24 = v18;
  double v25 = v19;
  result.y = v25;
  result.x = v24;
  return result;
}

- (id)indexPathUnderTickMarkInCollectionView:(id)a3 atContentOffset:(CGPoint)a4
{
  double x = a4.x;
  id v6 = a3;
  [v6 contentInset];
  double v8 = v7;
  double v10 = v9;
  double v12 = x + v11;
  [v6 bounds];
  double v14 = (v13 - (v8 + v10)) * 0.5;
  [(PUReviewScrubber *)self itemSize];
  double v16 = v12 + v15 * 0.5;
  [v6 contentSize];
  double v18 = v17;
  double v19 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v19 scale];
  double v21 = -1.0 / v20;

  double v22 = v18 + v21;
  if (v18 + v21 >= v16) {
    double v22 = v16;
  }
  double v23 = fmax(v22, 0.0);
  double v24 = objc_msgSend(v6, "indexPathForItemAtPoint:", v23, v14);
  if (!v24)
  {
    double v24 = objc_msgSend(v6, "indexPathForItemAtPoint:", v23 + 1.5, v14);
    if (!v24)
    {
      double v24 = objc_msgSend(v6, "indexPathForItemAtPoint:", v23 + -1.5, v14);
      if (!v24)
      {
        double v24 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
      }
    }
  }

  return v24;
}

- (void)_updateContentOffsetForSelectedIndexPathAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PUReviewScrubber *)self _collectionView];
  [(PUReviewScrubber *)self contentOffsetForIndexPath:self->_selectedIndexPath inCollectionView:v5];
  objc_msgSend(v5, "setContentOffset:animated:", v3);
}

- (void)_handleTapOnReviewScrubber:(id)a3
{
  id v4 = a3;
  id v17 = [(PUReviewScrubber *)self _collectionView];
  [v4 locationInView:v17];
  double v6 = v5;
  double v8 = v7;

  double v9 = [(PUReviewScrubber *)self _collectionViewLayout];
  [v17 contentSize];
  double v11 = v10;
  [v9 itemsContentInset];
  double v14 = v11 - fabs(v13);
  BOOL v15 = v6 > fabs(v12) && v6 < v14;
  if (v15 && ([v17 isDecelerating] & 1) == 0)
  {
    double v16 = -[PUReviewScrubber _indexPathInCollectionView:closestToPoint:excludingIndexPath:](self, "_indexPathInCollectionView:closestToPoint:excludingIndexPath:", v17, 0, v6, v8);
    [(PUReviewScrubber *)self _handleTapAtIndexPath:v16];
  }
}

- (void)_handleTapAtIndexPath:(id)a3
{
  [(PUReviewScrubber *)self _updateToSelectedIndexPath:a3];
  [(PUReviewScrubber *)self _updateContentOffsetForSelectedIndexPathAnimated:1];
  [(PUReviewScrubber *)self _notifyDelegateOfSelection];
}

- (id)_indexPathInCollectionView:(id)a3 closestToPoint:(CGPoint)a4 excludingIndexPath:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  double v10 = objc_msgSend(v8, "indexPathForItemAtPoint:", x, y);
  if (!v10)
  {
    double v11 = [v8 visibleCells];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      double v10 = 0;
      uint64_t v14 = *(void *)v25;
      double v15 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          double v18 = [v8 indexPathForCell:v17];
          if (([v9 isEqual:v18] & 1) == 0)
          {
            [v17 center];
            double v21 = (v20 - y) * (v20 - y) + (v19 - x) * (v19 - x);
            if (v21 < v15)
            {
              id v22 = v18;

              double v15 = v21;
              double v10 = v22;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }
    else
    {
      double v10 = 0;
    }
  }
  return v10;
}

- (void)_endFeedbackInteraction
{
  BOOL v3 = [(PUReviewScrubber *)self _impactFeedbackBehavior];
  int v4 = [v3 isActive];

  if (v4)
  {
    id v5 = [(PUReviewScrubber *)self _impactFeedbackBehavior];
    [v5 deactivate];
  }
}

- (void)_playFeedbackIfNeeded
{
  BOOL v3 = [(PUReviewScrubber *)self _impactFeedbackBehavior];
  if (v3)
  {
    id v9 = v3;
    int v4 = [(PUReviewScrubber *)self _collectionView];
    [v4 contentOffset];
    id v5 = -[PUReviewScrubber indexPathUnderTickMarkInCollectionView:atContentOffset:](self, "indexPathUnderTickMarkInCollectionView:atContentOffset:", v4);
    double v6 = [(PUReviewScrubber *)self _indexPathForPreviousFeedbackQuery];
    if (!v6 || [v5 compare:v6])
    {
      double v7 = [(PUReviewScrubber *)self dataSource];
      int v8 = [v7 reviewScrubber:self shouldProvideFeedbackForCellAtIndexPath:v5];

      if (v8) {
        [v9 impactOccurred];
      }
      [(PUReviewScrubber *)self _setIndexPathForPreviousFeedbackQuery:v5];
    }

    BOOL v3 = v9;
  }
}

- (void)_beginFeedbackInteraction
{
  BOOL v3 = [(PUReviewScrubber *)self _impactFeedbackBehavior];
  int v4 = [v3 isActive];

  if (v4) {
    [(PUReviewScrubber *)self _endFeedbackInteraction];
  }
  id v5 = [(PUReviewScrubber *)self _impactFeedbackBehavior];
  [v5 activateWithCompletionBlock:0];
}

- (void)finishInteractiveUpdate
{
  collectionView = self->__collectionView;
  [(UICollectionView *)collectionView contentOffset];
  -[PUReviewScrubber indexPathUnderTickMarkInCollectionView:atContentOffset:](self, "indexPathUnderTickMarkInCollectionView:atContentOffset:", collectionView);
  int v4 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = v4;

  [(PUReviewScrubber *)self _updateContentOffsetForSelectedIndexPathAnimated:0];
  [(PUReviewScrubber *)self _endFeedbackInteraction];
  self->__performingInteractiveUpdate = 0;
}

- (void)updateWithAbsoluteProgress:(double)a3
{
  if (self->__performingInteractiveUpdate)
  {
    self->__ignoreScrollViewDidScrollUpdate = 1;
    [(PUReviewScrubber *)self itemSize];
    double v6 = v5 + 3.0;
    [(UICollectionView *)self->__collectionView contentOffset];
    double v8 = v7;
    [(UICollectionView *)self->__collectionView contentInset];
    double v10 = v6 * a3 - v9;
    double v12 = v8 - v11;
    uint64_t v13 = [(PUReviewScrubber *)self _collectionView];
    objc_msgSend(v13, "setContentOffset:", v10, v12);

    [(PUReviewScrubber *)self _playFeedbackIfNeeded];
    self->__ignoreScrollViewDidScrollUpdate = 0;
  }
}

- (void)beginInteractiveUpdate
{
  if (self->__performingInteractiveUpdate) {
    [(PUReviewScrubber *)self finishInteractiveUpdate];
  }
  self->__performingInteractiveUpdate = 1;
  [(UICollectionView *)self->__collectionView _stopScrollingAndZoomingAnimations];
  [(PUReviewScrubber *)self _beginFeedbackInteraction];
}

- (void)setCellAspectRatio:(id)a3
{
  double v12 = (NSNumber *)a3;
  double v5 = self->_cellAspectRatio;
  double v6 = v12;
  if (v5 != v12)
  {
    char v7 = [(NSNumber *)v12 isEqual:v5];

    if (v7) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_cellAspectRatio, a3);
    [(PUReviewScrubber *)self itemSize];
    double v9 = v8;
    double v11 = v10;
    double v6 = [(PUReviewScrubber *)self _collectionViewLayout];
    objc_msgSend(v6, "setItemSize:", v9, v11);
  }

LABEL_5:
}

- (void)reloadSelectedIndexPathAnimated:(BOOL)a3
{
}

- (void)reloadIndexPath:(id)a3 animated:(BOOL)a4
{
  id v8 = a3;
  double v5 = [(PUReviewScrubber *)self _collectionView];
  double v6 = [v5 cellForItemAtIndexPath:v8];

  if (v6)
  {
    char v7 = [(PUReviewScrubber *)self scrubberDelegate];
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v7 reviewScrubber:self willDisplayCell:v6 atIndexPath:v8];
    }
  }
}

- (void)toggleSelectedIndexPathAnimated:(BOOL)a3
{
}

- (void)toggleIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = [(PUReviewScrubber *)self _collectionView];
  id v8 = [v7 cellForItemAtIndexPath:v6];

  if (v8) {
    objc_msgSend(v8, "setFavorite:animated:", objc_msgSend(v8, "isFavorite") ^ 1, v4);
  }
}

- (void)reloadData
{
  id v2 = [(PUReviewScrubber *)self _collectionView];
  [v2 reloadData];
}

- (void)setSelectedIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  char v7 = (NSIndexPath *)a3;
  if (self->_selectedIndexPath != v7)
  {
    objc_storeStrong((id *)&self->_selectedIndexPath, a3);
    [(PUReviewScrubber *)self _updateContentOffsetForSelectedIndexPathAnimated:v4];
    [(PUReviewScrubber *)self _setIndexPathForPreviousFeedbackQuery:v7];
  }
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (void)setScrubberCellClass:(Class)a3
{
  p_scrubberCellClass = &self->_scrubberCellClass;
  if (self->_scrubberCellClass != a3)
  {
    objc_storeStrong((id *)&self->_scrubberCellClass, a3);
    NSStringFromClass(*p_scrubberCellClass);
    double v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    cellReuseIdentifier = self->_cellReuseIdentifier;
    self->_cellReuseIdentifier = v5;

    collectionView = self->__collectionView;
    Class v8 = *p_scrubberCellClass;
    double v9 = self->_cellReuseIdentifier;
    [(UICollectionView *)collectionView registerClass:v8 forCellWithReuseIdentifier:v9];
  }
}

- (BOOL)isMinibar
{
  [(PUReviewScrubber *)self bounds];
  return v2 < 64.0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[PUReviewScrubber convertPoint:toView:](self, "convertPoint:toView:", self->__collectionView, x, y);
  Class v8 = -[UICollectionView hitTest:withEvent:](self->__collectionView, "hitTest:withEvent:", v7);
  if (!v8)
  {
    v10.receiver = self;
    v10.super_class = (Class)PUReviewScrubber;
    Class v8 = -[PUReviewScrubber hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  }

  return v8;
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)PUReviewScrubber;
  [(PUReviewScrubber *)&v36 layoutSubviews];
  [(PUReviewScrubber *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  arrowImageView = self->__arrowImageView;
  double v12 = [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v13 = [v12 colorWithAlphaComponent:0.25];
  [(UIImageView *)arrowImageView setTintColor:v13];

  [(UIImageView *)self->__arrowImageView sizeToFit];
  [(UIImageView *)self->__arrowImageView bounds];
  UIRectCenteredIntegralRectScale();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if ([(PUReviewScrubber *)self isMinibar]) {
    double v20 = 3.0;
  }
  else {
    double v20 = 6.0;
  }
  v37.origin.double x = v4;
  v37.origin.double y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  CGFloat v21 = CGRectGetMinY(v37) + v20;
  -[UIImageView setFrame:](self->__arrowImageView, "setFrame:", v15, v21, v17, v19);
  v38.origin.double x = v15;
  v38.origin.double y = v21;
  v38.size.width = v17;
  v38.size.height = v19;
  CGRectGetMaxY(v38);
  PXEdgeInsetsWithValueForEdges();
  PXEdgeInsetsInsetRect();
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  self->__ignoreScrollViewDidScrollUpdate = 1;
  [(UICollectionView *)self->__collectionView setClipsToBounds:0];
  -[UICollectionView setFrame:](self->__collectionView, "setFrame:", v23, v25, v27, v29);
  collectionView = self->__collectionView;
  v39.origin.double x = v4;
  v39.origin.double y = v6;
  v39.size.width = v8;
  v39.size.height = v10;
  double Width = CGRectGetWidth(v39);
  [(PUReviewScrubber *)self itemSize];
  double v33 = floor((Width - v32) * 0.5);
  v40.origin.double x = v4;
  v40.origin.double y = v6;
  v40.size.width = v8;
  v40.size.height = v10;
  double v34 = CGRectGetWidth(v40);
  [(PUReviewScrubber *)self itemSize];
  -[UICollectionView setContentInset:](collectionView, "setContentInset:", 0.0, v33, 0.0, floor((v34 - v35) * 0.5));
  if (![(PUReviewScrubber *)self _performingInteractiveUpdate]
    && ([(UICollectionView *)self->__collectionView isTracking] & 1) == 0
    && ([(UICollectionView *)self->__collectionView isDecelerating] & 1) == 0)
  {
    [(PUReviewScrubber *)self contentOffsetForIndexPath:self->_selectedIndexPath inCollectionView:self->__collectionView];
    -[UICollectionView setContentOffset:](self->__collectionView, "setContentOffset:");
  }
  self->__ignoreScrollViewDidScrollUpdate = 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = [(PUReviewScrubber *)self window];
  CGFloat v4 = [v3 windowScene];
  uint64_t v5 = [v4 interfaceOrientation];

  CGFloat v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v6 bounds];
  double v8 = v7;

  double v9 = 52.0;
  if ((unint64_t)(v5 - 3) >= 2) {
    double v9 = 64.0;
  }
  double v10 = v8;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_scrubberDelegate, 0);
  objc_storeWeak((id *)&self->_dataSource, 0);
  [(UITapGestureRecognizer *)self->__tapGestureRecognizer setDelegate:0];
  [(PUReviewScrubber *)self _endFeedbackInteraction];
  v3.receiver = self;
  v3.super_class = (Class)PUReviewScrubber;
  [(PUReviewScrubber *)&v3 dealloc];
}

- (PUReviewScrubber)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUReviewScrubber;
  objc_super v3 = [(PUReviewScrubber *)&v7 initWithCoder:a3];
  CGFloat v4 = v3;
  if (v3)
  {
    [(PUReviewScrubber *)v3 _commonPUReviewScrubberInitialization];
    uint64_t v5 = v4;
  }

  return v4;
}

- (PUReviewScrubber)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUReviewScrubber;
  objc_super v3 = -[PUReviewScrubber initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGFloat v4 = v3;
  if (v3)
  {
    [(PUReviewScrubber *)v3 _commonPUReviewScrubberInitialization];
    uint64_t v5 = v4;
  }

  return v4;
}

- (void)_commonPUReviewScrubberInitialization
{
  objc_super v3 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", @"AvalancheReviewModeArrow.png");
  id v20 = [v3 imageWithRenderingMode:2];

  CGFloat v4 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v20];
  arrowImageView = self->__arrowImageView;
  self->__arrowImageView = v4;

  [(PUReviewScrubber *)self addSubview:self->__arrowImageView];
  CGFloat v6 = objc_alloc_init(PUHorizontalCollectionViewLayout);
  collectionViewLayout = self->__collectionViewLayout;
  self->__collectionViewLayout = v6;

  double v8 = self->__collectionViewLayout;
  [(PUReviewScrubber *)self itemSize];
  -[PUHorizontalCollectionViewLayout setItemSize:](v8, "setItemSize:");
  [(PUHorizontalCollectionViewLayout *)self->__collectionViewLayout setInteritemSpacing:3.0];
  [(PUHorizontalCollectionViewLayout *)self->__collectionViewLayout _setWantsRightToLeftHorizontalMirroringIfNeeded:1];
  id v9 = objc_alloc(MEMORY[0x1E4FB1568]);
  double v10 = (UICollectionView *)objc_msgSend(v9, "initWithFrame:collectionViewLayout:", self->__collectionViewLayout, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  collectionView = self->__collectionView;
  self->__collectionView = v10;

  double v12 = self->__collectionView;
  uint64_t v13 = [MEMORY[0x1E4FB1618] clearColor];
  [(UICollectionView *)v12 setBackgroundColor:v13];

  [(UICollectionView *)self->__collectionView setShowsVerticalScrollIndicator:0];
  [(UICollectionView *)self->__collectionView setShowsHorizontalScrollIndicator:0];
  [(UICollectionView *)self->__collectionView setDelegate:self];
  [(UICollectionView *)self->__collectionView setDataSource:self];
  [(UICollectionView *)self->__collectionView _setSupportsPointerDragScrolling:1];
  [(PUReviewScrubber *)self setScrubberCellClass:objc_opt_class()];
  [(PUReviewScrubber *)self addSubview:self->__collectionView];
  double v14 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTapOnReviewScrubber_];
  tapGestureRecognizer = self->__tapGestureRecognizer;
  self->__tapGestureRecognizer = v14;

  [(UITapGestureRecognizer *)self->__tapGestureRecognizer setNumberOfTapsRequired:1];
  [(UITapGestureRecognizer *)self->__tapGestureRecognizer setNumberOfTouchesRequired:1];
  [(UITapGestureRecognizer *)self->__tapGestureRecognizer setDelegate:self];
  [(UICollectionView *)self->__collectionView addGestureRecognizer:self->__tapGestureRecognizer];
  double v16 = (UIImpactFeedbackGenerator *)objc_alloc_init(MEMORY[0x1E4FB1840]);
  impactFeedbackBehavior = self->__impactFeedbackBehavior;
  self->__impactFeedbackBehavior = v16;

  double v18 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  indexPathForPreviousFeedbackQuerdouble y = self->__indexPathForPreviousFeedbackQuery;
  self->__indexPathForPreviousFeedbackQuerdouble y = v18;

  *(_WORD *)&self->__ignoreScrollViewDidScrollUpdate = 1;
  [(PUReviewScrubber *)self sendSubviewToBack:self->__backdropView];
}

@end