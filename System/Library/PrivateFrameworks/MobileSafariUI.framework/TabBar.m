@interface TabBar
+ (double)defaultHeight;
- (BOOL)_isScrollable;
- (BOOL)_itemAtIndexIsPinned:(unint64_t)a3;
- (BOOL)allowsScrollingPinnedItems;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hidesTitles;
- (BOOL)isDraggingItem;
- (BOOL)shouldPinItemsDroppedAtPoint:(CGPoint)a3;
- (BOOL)supportsDropTransitionToItemView;
- (CGRect)_frameForItemAtIndex:(unint64_t)a3;
- (CGRect)_initialFrameForItemAtIndex:(unint64_t)a3;
- (CGRect)_scrollableItemArea;
- (CGRect)frameForItem:(id)a3;
- (NSArray)items;
- (SFTabHoverPreviewController)tabHoverPreviewController;
- (TabBar)initWithFrame:(CGRect)a3;
- (TabBarDelegate)delegate;
- (UIEdgeInsets)_pinnedItemInsets;
- (double)_horizontalPositionForItemAtIndex:(unint64_t)a3;
- (double)_horizontalPositionForItemAtIndex:(unint64_t)a3 withSlowingFactor:(double)a4;
- (double)_horizontalPositionForItemAtIndex:(unint64_t)a3 withSlowingFactor:(double)a4 pinned:(BOOL)a5;
- (double)_itemWidth;
- (double)_pinnedItemsWidth;
- (double)_scrollableWidth;
- (double)minimumTabWidth;
- (id)_firstVisibleItemAfterIndex:(unint64_t)a3;
- (id)_itemAtLocation:(CGPoint)a3;
- (id)_itemForTouch:(id)a3;
- (id)_overflowPinnedItemsMenuElements;
- (id)_requestReusableTabBarItemView;
- (id)dragPreviewForItem:(id)a3 pinned:(BOOL)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)targetItemForDropAtPoint:(CGPoint)a3;
- (id)targetedDragPreviewForLiftingItem:(id)a3;
- (id)viewForItem:(id)a3;
- (int64_t)itemDragContentType;
- (int64_t)tintStyle;
- (unint64_t)_effectiveIndexForIndex:(unint64_t)a3 ofItems:(id)a4 currentItems:(id)a5;
- (unint64_t)_lastVisiblePinnedItemIndex;
- (unint64_t)_scrollableItemCount;
- (unint64_t)_totalPinnedItemCount;
- (unint64_t)contextMenuOptionsForItem:(id)a3;
- (unint64_t)indexOfCenterItem;
- (unint64_t)maxNumberOfVisibleTabs;
- (unsigned)_edgeToAlignWithPreviewForItem:(id)a3;
- (void)_activateItemIfNeeded:(id)a3;
- (void)_didCompleteScrolling;
- (void)_didReceiveMemoryWarning:(id)a3;
- (void)_hover:(id)a3;
- (void)_itemDidPressCloseButton:(id)a3;
- (void)_layOutPinnedOverflowButton;
- (void)_layoutContainers;
- (void)_layoutIndexes:(id)a3 ofItems:(id)a4 currentItems:(id)a5;
- (void)_layoutItem:(id)a3 atIndex:(unint64_t)a4 inRect:(CGRect)a5 itemCount:(unint64_t)a6 beforeActiveItem:(BOOL)a7;
- (void)_relinquishReusableTabBarItemView:(id)a3;
- (void)_reorder:(id)a3;
- (void)_scrollToItemIfNeeded:(id)a3;
- (void)_scrollTowardItem:(id)a3 byAmount:(double)a4;
- (void)_tap:(id)a3;
- (void)_toggleMediaStateMutedForItem:(id)a3;
- (void)_updateBackground;
- (void)_updatePinnedItemCount;
- (void)_updateReorderRecognizer;
- (void)addInteraction:(id)a3;
- (void)cleanUpDragPreviewForItem:(id)a3;
- (void)dealloc;
- (void)indexOfCenterItem;
- (void)layoutSubviews;
- (void)scrollToItem:(id)a3 animated:(BOOL)a4;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setAllowsScrollingPinnedItems:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDraggingItem:(BOOL)a3;
- (void)setHidesTitles:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setItems:(id)a3 animated:(BOOL)a4;
- (void)setTintStyle:(int64_t)a3;
- (void)updatePinnedItems;
@end

@implementation TabBar

uint64_t __32__TabBar__updatePinnedItemCount__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPlaceholder];
}

- (CGRect)_frameForItemAtIndex:(unint64_t)a3
{
  BOOL v5 = -[TabBar _itemAtIndexIsPinned:](self, "_itemAtIndexIsPinned:");
  if ([(NSIndexSet *)self->_overflowPinnedItemIndexes containsIndex:a3]) {
    a3 = [(TabBar *)self _lastVisiblePinnedItemIndex];
  }
  [(TabBar *)self _horizontalPositionForItemAtIndex:a3 withSlowingFactor:v5 pinned:64.0];
  double v7 = v6;
  [(TabBar *)self _horizontalPositionForItemAtIndex:a3 + 1 withSlowingFactor:v5 pinned:64.0];
  double v9 = v8;
  [(TabBar *)self _sf_usesLeftToRightLayout];
  [(TabBar *)self bounds];
  _SFRoundRectToPixels();
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (double)_horizontalPositionForItemAtIndex:(unint64_t)a3 withSlowingFactor:(double)a4 pinned:(BOOL)a5
{
  int64_t v5 = a3;
  if (a5)
  {
    double v7 = (double)(a3
                - -[NSIndexSet countOfIndexesInRange:](self->_overflowPinnedItemIndexes, "countOfIndexesInRange:", 0, a3, a4))* 36.0;
    [(TabBar *)self _sf_safeAreaBounds];
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    int v16 = [(TabBar *)self _sf_usesLeftToRightLayout];
    uint64_t v17 = v9;
    uint64_t v18 = v11;
    uint64_t v19 = v13;
    uint64_t v20 = v15;
    if (v16) {
      return v7 + CGRectGetMinX(*(CGRect *)&v17);
    }
    else {
      return CGRectGetMaxX(*(CGRect *)&v17) - v7;
    }
  }
  else
  {
    [(TabBar *)self bounds];
    double v24 = v23;
    NSUInteger v25 = [(NSArray *)self->_items count];
    [(TabBar *)self _itemWidth];
    double v27 = v26;
    if (![(TabBar *)self _sf_usesLeftToRightLayout]) {
      int64_t v5 = v25 - v5;
    }
    if ([(TabBar *)self _sf_usesLeftToRightLayout]) {
      v5 -= [(TabBar *)self _totalPinnedItemCount];
    }
    [(TabBar *)self _pinnedItemInsets];
    double v29 = v28;
    [(TabBar *)self _sf_safeAreaBounds];
    double v30 = v29 + CGRectGetMinX(v36);
    if ([(TabBar *)self _isScrollable])
    {
      [(UIScrollView *)self->_scrollView contentOffset];
      double v32 = v31;
      double v33 = v29 + v27 * (double)[(TabBar *)self _scrollableItemCount];
      double v34 = v30 + (double)v5 * v27;
      itemOffsetForSlowingOffset(v33 - v34, v33 - v24 - v32, a4);
      itemOffsetForSlowingOffset(v34 - v29, v32, a4);
    }
    _SFRoundFloatToPixels();
  }
  return result;
}

- (double)_scrollableWidth
{
  [(TabBar *)self _itemWidth];
  double v4 = v3;
  double v5 = (double)[(TabBar *)self _scrollableItemCount];
  [(TabBar *)self _pinnedItemsWidth];
  return v6 + v4 * v5;
}

- (double)_itemWidth
{
  [(TabBar *)self _sf_safeAreaBounds];
  double Width = CGRectGetWidth(v10);
  [(TabBar *)self _pinnedItemsWidth];
  double v5 = v4;
  minimumTabdouble Width = self->_minimumTabWidth;
  unint64_t v7 = [(TabBar *)self _scrollableItemCount];
  double v8 = 1.0;
  if (v7 >= 2) {
    double v8 = (double)[(TabBar *)self _scrollableItemCount];
  }
  return fmax(minimumTabWidth, (Width - v5) / v8);
}

- (double)_pinnedItemsWidth
{
  unint64_t visiblePinnedItemCount = self->_visiblePinnedItemCount;
  if ([(NSIndexSet *)self->_overflowPinnedItemIndexes count]) {
    unint64_t v3 = visiblePinnedItemCount + 1;
  }
  else {
    unint64_t v3 = visiblePinnedItemCount;
  }
  return (double)v3 * 36.0;
}

- (unint64_t)_scrollableItemCount
{
  NSUInteger v3 = [(NSArray *)self->_items count];
  return v3 - [(TabBar *)self _totalPinnedItemCount];
}

- (unint64_t)_totalPinnedItemCount
{
  unint64_t visiblePinnedItemCount = self->_visiblePinnedItemCount;
  return [(NSIndexSet *)self->_overflowPinnedItemIndexes count] + visiblePinnedItemCount;
}

- (BOOL)_isScrollable
{
  [(TabBar *)self _scrollableWidth];
  double v4 = v3;
  [(TabBar *)self _sf_safeAreaBounds];
  return v4 > CGRectGetWidth(v6);
}

- (UIEdgeInsets)_pinnedItemInsets
{
  [(TabBar *)self _sf_usesLeftToRightLayout];
  [(TabBar *)self _pinnedItemsWidth];
  UIEdgeInsetsMakeWithEdges();
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (NSArray)items
{
  return self->_items;
}

- (double)minimumTabWidth
{
  return self->_minimumTabWidth;
}

- (void)scrollToItem:(id)a3 animated:(BOOL)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(TabBar *)self _scrollToItemIfNeeded:a3];
  if (a4)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    unint64_t v7 = self->_items;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v27 + 1) + 8 * i) layoutInfo];
          if ([v12 isVisibleInTabBar]) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "setActiveAnimationCount:", objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "activeAnimationCount") + 1);
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v15);
    }

    uint64_t v18 = (void *)MEMORY[0x1E4FB1EB0];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __32__TabBar_scrollToItem_animated___block_invoke;
    v22[3] = &unk_1E6D77E20;
    v22[4] = self;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __32__TabBar_scrollToItem_animated___block_invoke_2;
    v20[3] = &unk_1E6D77C20;
    id v21 = v13;
    id v19 = v13;
    [v18 _animateUsingDefaultTimingWithOptions:2 animations:v22 completion:v20];
  }
  else
  {
    [(TabBar *)self layoutBelowIfNeeded];
  }
}

- (void)_scrollToItemIfNeeded:(id)a3
{
  id v23 = a3;
  BOOL v4 = [(TabBar *)self _isScrollable];
  if (v23)
  {
    if (v4 && ([v23 isPinned] & 1) == 0)
    {
      [(TabBar *)self _sf_safeAreaBounds];
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      double v10 = v9;
      CGFloat v12 = v11;
      [(TabBar *)self _itemWidth];
      double v14 = v13;
      unint64_t v15 = [(NSArray *)self->_items indexOfObject:v23];
      if (v15 < [(NSArray *)self->_items count])
      {
        if ([(TabBar *)self _sf_usesLeftToRightLayout]) {
          [(TabBar *)self _totalPinnedItemCount];
        }
        [(TabBar *)self _pinnedItemInsets];
        v25.origin.x = v6;
        v25.origin.y = v8;
        v25.size.width = v10;
        v25.size.height = v12;
        CGRectGetMinX(v25);
        _SFRoundFloatToPixels();
        double v17 = v16;
        [(UIScrollView *)self->_scrollView contentOffset];
        double v19 = v18;
        double v21 = fmax(fmin(v20, v17 + -128.0), v14 + v17 - v10 + 128.0);
        [(TabBar *)self _scrollableWidth];
        -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", fmax(fmin(v21, v22 - v10), 0.0), v19);
      }
    }
  }
}

- (void)setDraggingItem:(BOOL)a3
{
  self->_draggingItem = a3;
}

- (void)setAllowsScrollingPinnedItems:(BOOL)a3
{
  self->_allowsScrollingPinnedItems = a3;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)TabBar;
  [(TabBar *)&v18 layoutSubviews];
  [(TabBar *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIScrollView *)self->_scrollView frame];
  v20.origin.x = v11;
  v20.origin.y = v12;
  v20.size.width = v13;
  v20.size.height = v14;
  v19.origin.x = v4;
  v19.origin.y = v6;
  v19.size.width = v8;
  v19.size.height = v10;
  if (!CGRectEqualToRect(v19, v20))
  {
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v4, v6, v8, v10);
    [(TabBar *)self _updatePinnedItemCount];
  }
  unint64_t v15 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, -[NSArray count](self->_items, "count"));
  [(TabBar *)self _layoutIndexes:v15 ofItems:self->_items currentItems:0];

  if (![(UIScrollView *)self->_scrollView isDragging]
    && ![(UIScrollView *)self->_scrollView isDecelerating]
    && self->_newTabVisibleInTabBar)
  {
    [(SFTabHoverPreviewController *)self->_tabHoverPreviewController setNeedsSnapshotUpdate];
    self->_newTabVisibleInTabBar = 0;
  }
  [(TabBar *)self _pinnedItemInsets];
  -[UIScrollView _setAutoScrollTouchInsets:](self->_scrollView, "_setAutoScrollTouchInsets:", 0.0, -128.0 - v16, 0.0, -128.0 - v17);
  [(TabBar *)self _layOutPinnedOverflowButton];
}

- (void)updatePinnedItems
{
  unint64_t visiblePinnedItemCount = self->_visiblePinnedItemCount;
  NSUInteger v4 = [(NSIndexSet *)self->_overflowPinnedItemIndexes count];
  [(TabBar *)self _updatePinnedItemCount];
  NSUInteger v5 = [(NSIndexSet *)self->_overflowPinnedItemIndexes count];
  if (v4 != v5 || visiblePinnedItemCount != self->_visiblePinnedItemCount)
  {
    [(TabBar *)self setNeedsLayout];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __27__TabBar_updatePinnedItems__block_invoke;
    v6[3] = &unk_1E6D77E20;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E4FB1EB0], "sf_animate:usingDefaultMotionWithOptions:animations:completion:", (v5 | v4) == 0, 2, v6, 0);
  }
}

- (void)_updatePinnedItemCount
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  self->_unint64_t visiblePinnedItemCount = 0;
  double v3 = [MEMORY[0x1E4F28D60] indexSet];
  overflowPinnedItemIndexes = self->_overflowPinnedItemIndexes;
  self->_overflowPinnedItemIndexes = v3;

  if (!self->_allowsScrollingPinnedItems)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    NSUInteger v5 = self->_items;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      unint64_t v8 = 0;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v5);
          }
          v8 += objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "isPinned", (void)v24);
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v7);
    }
    else
    {
      unint64_t v8 = 0;
    }

    self->_unint64_t visiblePinnedItemCount = v8;
    NSUInteger v11 = [(NSArray *)self->_items indexOfObjectPassingTest:&__block_literal_global_45];
    NSUInteger v12 = v11;
    BOOL v14 = v11 != 0x7FFFFFFFFFFFFFFFLL && v11 < v8;
    double v15 = 3.5;
    if ([(NSArray *)self->_items count] - v8 <= 3) {
      double v15 = (double)([(NSArray *)self->_items count] - v8);
    }
    [(TabBar *)self _sf_safeAreaBounds];
    double Width = CGRectGetWidth(v30);
    [(TabBar *)self _itemWidth];
    double v18 = fmax((Width - v17 * v15) / 36.0 + -1.0, 1.0) + (double)v14;
    if (v8 > (unint64_t)v18 + 1)
    {
      if (v8 >= (unint64_t)v18) {
        unint64_t v19 = (unint64_t)v18;
      }
      else {
        unint64_t v19 = v8;
      }
      self->_unint64_t visiblePinnedItemCount = v19;
      CGRect v20 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", v19, v8 - v19);
      NSUInteger v21 = [(NSArray *)self->_items indexOfObjectPassingTest:&__block_literal_global_46];
      if ([v20 containsIndex:v21])
      {
        objc_msgSend(v20, "addIndex:", objc_msgSend(v20, "firstIndex") - 1);
        [v20 removeIndex:v21];
      }
      if ([v20 containsIndex:v12])
      {
        objc_msgSend(v20, "addIndex:", objc_msgSend(v20, "firstIndex") - 1);
        [v20 removeIndex:v12];
      }
      double v22 = (NSIndexSet *)[v20 copy];
      id v23 = self->_overflowPinnedItemIndexes;
      self->_overflowPinnedItemIndexes = v22;
    }
  }
}

- (void)setTintStyle:(int64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_tintStyle != a3
    || ([(UIVisualEffectView *)self->_leadingVibrancyEffectView effect],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0)
    || (uint64_t v6 = (void *)v5,
        [(UIVisualEffectView *)self->_trailingVibrancyEffectView effect],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    self->_tintStyle = a3;
    [(TabBar *)self _setOverrideUserInterfaceStyle:2 * (a3 == 4)];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    unint64_t v8 = self->_items;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          CGFloat v13 = [*(id *)(*((void *)&v23 + 1) + 8 * v12) layoutInfo];
          [v13 updateTabBarStyle];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v10);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    BOOL v14 = self->_tabBarItemViewReuseStack;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "updateTabBarStyle", (void)v19);
        }
        while (v16 != v18);
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v16);
    }

    [(PinnedTabsOverflowButton *)self->_pinnedOverflowButton setTintStyle:a3];
    [(TabBar *)self _updateBackground];
    [(TabBar *)self setNeedsLayout];
  }
}

+ (double)defaultHeight
{
  _SFRoundFloatToPixels();
  return result;
}

uint64_t __32__TabBar_scrollToItem_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutBelowIfNeeded];
}

- (void)_layoutItem:(id)a3 atIndex:(unint64_t)a4 inRect:(CGRect)a5 itemCount:(unint64_t)a6 beforeActiveItem:(BOOL)a7
{
  BOOL v7 = a7;
  double rect_16 = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id rect_24 = a3;
  int v13 = [rect_24 isActive];
  char v73 = [rect_24 isPlaceholder];
  BOOL v14 = [(TabBar *)self _itemAtIndexIsPinned:a4];
  [(TabBar *)self _scrollableItemArea];
  CGFloat v19 = v15;
  CGFloat v20 = v16;
  CGFloat v21 = v17;
  CGFloat v22 = v18;
  if (v13)
  {
    int v23 = 1;
  }
  else
  {
    v94.origin.CGFloat x = x;
    v94.origin.double y = y;
    v94.size.double width = width;
    v94.size.height = rect_16;
    int v23 = (CGRectIntersectsRect(*(CGRect *)&v15, v94) || v14) && v7;
  }
  v81.origin.CGFloat x = v19;
  v81.origin.double y = v20;
  v81.size.double width = v21;
  v81.size.height = v22;
  v95.origin.CGFloat x = x;
  v95.origin.double y = y;
  v95.size.double width = width;
  v95.size.height = rect_16;
  BOOL rect = v14;
  int v24 = CGRectIntersectsRect(v81, v95) || v14;
  unint64_t rect_8 = a4;
  int v25 = ![(NSIndexSet *)self->_overflowPinnedItemIndexes containsIndex:a4];
  int v26 = v25 & v24;
  uint64_t v27 = v25 & v24 & (v23 ^ 1u);
  int v28 = v23 & v25;
  uint64_t v29 = [rect_24 layoutInfo];
  CGRect v30 = v29;
  LOBYTE(v31) = self->_newTabVisibleInTabBar;
  if (!self->_newTabVisibleInTabBar && (v23 & v25 | v27) != 0) {
    int v31 = [v29 isVisibleInTabBar] ^ 1;
  }
  self->_newTabVisibleInTabBar = v31;
  [v30 setVisibleInTabBar:v28 | v27];
  [v30 setTrailingActiveItem:v27];
  uint64_t v33 = [v30 tabBarItemView];
  uint64_t v34 = [rect_24 dragState];
  double v35 = 1.0;
  if (v34 == 1) {
    double v35 = 0.5;
  }
  [v33 setAlpha:v35];
  if (v13)
  {
    [(TabBar *)self addSubview:v33];
    int v36 = 0;
    BOOL v37 = 0;
    unint64_t v38 = rect_8;
  }
  else
  {
    if (v23) {
      int v39 = v25;
    }
    else {
      int v39 = v26;
    }
    unint64_t v38 = rect_8;
    if (v39 == 1)
    {
      v40 = &OBJC_IVAR___TabBar__trailingContainer;
      if (v28) {
        v40 = &OBJC_IVAR___TabBar__leadingContainer;
      }
      [*(id *)((char *)&self->super.super.super.isa + *v40) addSubview:v33];
    }
    if (v73)
    {
      int v36 = 0;
    }
    else
    {
      if (rect_8) {
        int v36 = v13 ^ 1;
      }
      else {
        int v36 = 0;
      }
      if ((v13 & 1) == 0)
      {
        BOOL v37 = a6 - 1 != rect_8;
        goto LABEL_28;
      }
    }
    BOOL v37 = 0;
  }
LABEL_28:
  v41 = [(TabBar *)self _firstVisibleItemAfterIndex:v38];
  v42 = v41;
  BOOL v43 = rect
     && ([v41 isPinned] & 1) == 0
     && [(NSIndexSet *)self->_overflowPinnedItemIndexes count] != 0;
  if (v36)
  {
    uint64_t v44 = self->_visiblePinnedItemCount < v38;
    if (!v37) {
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v44 = 0;
    if (!v37)
    {
LABEL_38:
      uint64_t v45 = 0;
      goto LABEL_39;
    }
  }
  if ([(NSArray *)self->_items count] - 1 <= v38) {
    goto LABEL_38;
  }
  uint64_t v45 = [v42 isActive] ^ 1 | v43;
LABEL_39:
  double v46 = 0.0;
  if (self->_visiblePinnedItemCount && !rect)
  {
    [(TabBar *)self _scrollableItemArea];
    CGFloat v50 = v49;
    CGFloat v52 = v51;
    CGFloat recta = x;
    CGFloat v54 = v53;
    CGFloat v56 = v55;
    v82.origin.CGFloat x = recta;
    CGFloat v57 = y;
    v82.origin.double y = y;
    v82.size.double width = width;
    v82.size.height = rect_16;
    double MinX = CGRectGetMinX(v82);
    v83.origin.CGFloat x = v50;
    v83.origin.double y = v52;
    v83.size.double width = v54;
    v83.size.height = v56;
    BOOL v59 = MinX > CGRectGetMinX(v83);
    v84.origin.CGFloat x = recta;
    v84.origin.double y = y;
    v84.size.double width = width;
    v84.size.height = rect_16;
    double MaxX = CGRectGetMaxX(v84);
    v85.origin.CGFloat x = v50;
    v85.origin.double y = v52;
    v85.size.double width = v54;
    v85.size.height = v56;
    BOOL v61 = MaxX < CGRectGetMaxX(v85);
    int v62 = [(TabBar *)self _sf_usesLeftToRightLayout];
    if (v62) {
      BOOL v63 = v59;
    }
    else {
      BOOL v63 = v61;
    }
    uint64_t v44 = v44 & v63;
    if (v62) {
      BOOL v64 = v61;
    }
    else {
      BOOL v64 = v59;
    }
    uint64_t v45 = v45 & v64;
    v86.origin.CGFloat x = recta;
    v86.origin.double y = y;
    v86.size.double width = width;
    v86.size.height = rect_16;
    double v65 = CGRectGetMinX(v86);
    v87.origin.CGFloat x = v50;
    v87.origin.double y = v52;
    v87.size.double width = v54;
    v87.size.height = v56;
    CGFloat v74 = width;
    double v66 = CGRectGetMinX(v87);
    v88.origin.CGFloat x = v50;
    v88.origin.double y = v52;
    v88.size.double width = v54;
    v88.size.height = v56;
    double v47 = fmax(v66, fmin(CGRectGetMaxX(v88), v65));
    v89.size.double width = v74;
    v89.origin.CGFloat x = recta;
    v89.origin.double y = y;
    v89.size.height = rect_16;
    double v72 = CGRectGetMaxX(v89);
    v90.origin.CGFloat x = v50;
    v90.origin.double y = v52;
    v90.size.double width = v54;
    v90.size.height = v56;
    double v67 = CGRectGetMinX(v90);
    v91.origin.CGFloat x = v50;
    v91.origin.double y = v52;
    v91.size.double width = v54;
    v91.size.height = v56;
    double v68 = fmax(v67, fmin(CGRectGetMaxX(v91), v72));
    v92.origin.double y = v57;
    double width = v74;
    v92.origin.CGFloat x = recta;
    double y = v57;
    v92.size.double width = v74;
    v92.size.height = rect_16;
    double v46 = 0.0;
    if (v47 > CGRectGetMinX(v92))
    {
      v93.origin.CGFloat x = recta;
      v93.origin.double y = v57;
      v93.size.double width = v74;
      v93.size.height = rect_16;
      double v46 = CGRectGetMinX(v93) - v47;
    }
    double v48 = v68 - v47;
  }
  else
  {
    double v47 = x;
    double v48 = width;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v30, "setCanClose:", objc_msgSend(WeakRetained, "tabCollectionView:canCloseItem:", self, rect_24));

  [v30 setLeadingEdgeVisible:v44];
  [v30 setTrailingEdgeVisible:v45];
  if ([(TabBar *)self _itemAtIndexIsPinned:rect_8]) {
    double v70 = 36.0;
  }
  else {
    double v70 = fmax(width, self->_minimumTabWidth);
  }
  [v30 setTitleLayoutWidth:v70];
  [v30 setContentOffset:v46];
  objc_msgSend(v30, "setFrame:", v47, y, v48, rect_16);
}

- (BOOL)_itemAtIndexIsPinned:(unint64_t)a3
{
  return [(TabBar *)self _totalPinnedItemCount] > a3;
}

- (void)_layoutIndexes:(id)a3 ofItems:(id)a4 currentItems:(id)a5
{
  id rect2_8 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 count];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat rect2 = *MEMORY[0x1E4F1DB28];
    CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    int v16 = 1;
    do
    {
      double v17 = objc_msgSend(v8, "objectAtIndexedSubscript:", v12, *(void *)&rect2);
      [v17 setTabBar:self];
      double v18 = [v17 layoutInfo];
      if (self->_hidesTitles) {
        uint64_t v19 = 1;
      }
      else {
        uint64_t v19 = [v17 isPlaceholder];
      }
      [v18 setHidesTitleText:v19];
      if ([rect2_8 containsIndex:v12])
      {
        unint64_t v20 = [(TabBar *)self _effectiveIndexForIndex:v12 ofItems:v8 currentItems:v9];
        if (!v9
          || ([v18 frame],
              v46.origin.CGFloat x = rect2,
              v46.origin.double y = v13,
              v46.size.double width = v14,
              v46.size.height = v15,
              !CGRectEqualToRect(v44, v46))
          || ([v17 isActive] & 1) != 0
          || ([v17 isPlaceholder] & 1) != 0
          || v20 >= [(NSArray *)self->_items count])
        {
          [(TabBar *)self _frameForItemAtIndex:v20];
        }
        else
        {
          [(TabBar *)self _initialFrameForItemAtIndex:v20];
        }
        double v25 = v21;
        double v26 = v22;
        double v27 = v23;
        double v28 = v24;
        BOOL v29 = [(TabBar *)self _isScrollable];
        double v30 = 0.0;
        if (v29)
        {
          [(TabBar *)self _horizontalPositionForItemAtIndex:v20 withSlowingFactor:52.0];
          double v32 = v31;
          [(TabBar *)self _horizontalPositionForItemAtIndex:v20];
          double v30 = vabdd_f64(v32, v33);
        }
        [v18 setTitleAnchorAdditionalOffset:v30];
        -[TabBar _layoutItem:atIndex:inRect:itemCount:beforeActiveItem:](self, "_layoutItem:atIndex:inRect:itemCount:beforeActiveItem:", v17, v12, v11, v16 & 1, v25, v26, v27, v28);
      }
      v16 &= [v17 isActive] ^ 1;

      ++v12;
    }
    while (v11 != v12);
  }
  [(TabBar *)self _layoutContainers];
  [(TabBar *)self safeAreaInsets];
  double v35 = v34;
  double v37 = v36;
  scrollView = self->_scrollView;
  [(TabBar *)self _scrollableWidth];
  double v40 = v37 + v35 + v39;
  [(TabBar *)self bounds];
  -[UIScrollView setContentSize:](scrollView, "setContentSize:", v40, CGRectGetHeight(v45));
  [(TabBar *)self _updateReorderRecognizer];
}

- (unint64_t)_effectiveIndexForIndex:(unint64_t)a3 ofItems:(id)a4 currentItems:(id)a5
{
  id v8 = a4;
  id v9 = (NSArray *)a5;
  unint64_t v10 = 0;
  unint64_t v11 = a3;
  while (1)
  {
    if (v11 < [v8 count])
    {
      uint64_t v12 = [v8 objectAtIndex:v11];
      CGFloat v13 = v9 ? v9 : self->_items;
      uint64_t v14 = [(NSArray *)v13 indexOfObject:v12];

      if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
    }
    ++v10;
    --v11;
    if (v10 > a3) {
      goto LABEL_10;
    }
  }
  a3 = v14 + v10;
LABEL_10:

  return a3;
}

- (void)_updateReorderRecognizer
{
  uint64_t v3 = [(TabBar *)self _isScrollable] ^ 1;
  reorderRecognizer = self->_reorderRecognizer;
  [(UIPanGestureRecognizer *)reorderRecognizer _setCanPanHorizontally:v3];
}

- (void)_layoutContainers
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  int v3 = [(TabBar *)self _sf_usesLeftToRightLayout];
  CGFloat v61 = 0.0;
  CGFloat MaxX = 0.0;
  if (v3)
  {
    [(TabBar *)self bounds];
    CGFloat MaxX = CGRectGetMaxX(v71);
  }
  [(TabBar *)self bounds];
  CGFloat Height = CGRectGetHeight(v72);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v6 = self->_items;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v66;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v66 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        if ([v11 isActive])
        {
          uint64_t v12 = [v11 layoutInfo];
          CGFloat v13 = [v12 tabBarItemView];
          [v13 frame];
          CGFloat MaxX = v14;
          CGFloat v59 = v16;
          CGFloat v61 = v15;
          CGFloat v51 = v17;

          goto LABEL_13;
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v65 objects:v69 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  CGFloat v51 = 0.0;
  CGFloat v59 = Height;
LABEL_13:
  CGFloat rect = MaxX;

  if (v3) {
    double v18 = &OBJC_IVAR___TabBar__leadingContainer;
  }
  else {
    double v18 = &OBJC_IVAR___TabBar__trailingContainer;
  }
  uint64_t v19 = *(Class *)((char *)&self->super.super.super.isa + *v18);
  if (v3) {
    unint64_t v20 = &OBJC_IVAR___TabBar__trailingContainer;
  }
  else {
    unint64_t v20 = &OBJC_IVAR___TabBar__leadingContainer;
  }
  id v21 = v19;
  id v22 = *(id *)((char *)&self->super.super.super.isa + *v20);
  [(TabBar *)self bounds];
  double v24 = v23;
  double v26 = v25;
  CGFloat v28 = v27;
  double v30 = v29;
  [(TabBar *)self bounds];
  double rect_8 = v34;
  double rect_16 = v33;
  CGFloat v35 = v31;
  double v36 = v32;
  if (v3) {
    double v37 = v30;
  }
  else {
    double v37 = v32;
  }
  if (v3) {
    double v38 = v26;
  }
  else {
    double v38 = v31;
  }
  double v52 = v31;
  double rect_24 = v38;
  double v58 = v37;
  v73.origin.CGFloat x = MaxX;
  v73.size.height = v59;
  v73.origin.double y = v61;
  v73.size.double width = v51;
  double v39 = CGRectGetMinX(v73) - v24;
  v74.origin.CGFloat x = v24;
  v74.origin.double y = v26;
  v74.size.double width = v28;
  v74.size.height = v30;
  double v40 = fmax(fmin(CGRectGetWidth(v74), v39), 0.0);
  objc_msgSend(v21, "setBounds:", v24, v26, v40, v30);
  v75.origin.CGFloat x = v24;
  v75.origin.double y = v26;
  v75.size.double width = v40;
  v75.size.height = v30;
  double v41 = CGRectGetMaxX(v75);
  v76.origin.CGFloat x = v24;
  v76.origin.double y = v26;
  v76.size.double width = v40;
  v76.size.height = v30;
  objc_msgSend(v21, "setCenter:", v41, CGRectGetMidY(v76));
  v77.origin.CGFloat x = rect;
  v77.size.height = v59;
  v77.origin.double y = v61;
  v77.size.double width = v51;
  double v42 = CGRectGetMaxX(v77);
  v78.origin.CGFloat x = rect_16;
  v78.origin.double y = v35;
  v78.size.double width = rect_8;
  v78.size.height = v36;
  double v43 = fmax(fmin(CGRectGetWidth(v78), v42 - rect_16), 0.0);
  double v44 = rect_16 + v43;
  double v45 = rect_8 - v43;
  if (v3) {
    double v46 = rect_8 - v43;
  }
  else {
    double v46 = v40;
  }
  if (v3) {
    double v47 = rect_16 + v43;
  }
  else {
    double v47 = v24;
  }
  double rect_16a = v47;
  if (v3) {
    double v48 = v36;
  }
  else {
    double v48 = v30;
  }
  double v60 = v48;
  double v62 = v46;
  if (v3) {
    double v26 = v52;
  }
  else {
    double v40 = v45;
  }
  if (!v3) {
    double v24 = v44;
  }
  objc_msgSend(v22, "setBounds:", v44, v52, v45, v36);
  v79.origin.CGFloat x = v44;
  v79.origin.double y = v52;
  v79.size.double width = v45;
  v79.size.height = v36;
  CGFloat MinX = CGRectGetMinX(v79);
  v80.origin.CGFloat x = v44;
  v80.origin.double y = v52;
  v80.size.double width = v45;
  v80.size.height = v36;
  CGFloat MidY = CGRectGetMidY(v80);
  CGAffineTransformMakeTranslation(&v64, MinX, MidY);
  CGAffineTransform v63 = v64;
  [v22 setTransform:&v63];
  -[UIVisualEffectView setFrame:](self->_leadingVibrancyEffectView, "setFrame:", v24, rect_24, v40, v58);
  -[UIVisualEffectView setFrame:](self->_trailingVibrancyEffectView, "setFrame:", rect_16a, v26, v62, v60);
}

- (void)_layOutPinnedOverflowButton
{
  NSUInteger v3 = [(NSIndexSet *)self->_overflowPinnedItemIndexes count];
  [(PinnedTabsOverflowButton *)self->_pinnedOverflowButton setHidden:v3 == 0];
  int v4 = [(TabBar *)self _sf_usesLeftToRightLayout];
  [(TabBar *)self _sf_safeAreaBounds];
  if (v4)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v5);
    double visiblePinnedItemCount = (double)self->_visiblePinnedItemCount;
    double v11 = 36.0;
  }
  else
  {
    double MinX = CGRectGetMaxX(*(CGRect *)&v5);
    double visiblePinnedItemCount = (double)(self->_visiblePinnedItemCount + 1);
    double v11 = -36.0;
  }
  double v12 = MinX + visiblePinnedItemCount * v11;
  [(TabBar *)self bounds];
  -[PinnedTabsOverflowButton setFrame:](self->_pinnedOverflowButton, "setFrame:", v12, 0.0, 36.0, CGRectGetHeight(v19));
  unint64_t v13 = [(TabBar *)self _totalPinnedItemCount];
  if (v13 >= [(NSArray *)self->_items count])
  {
    unsigned int v15 = 1;
  }
  else
  {
    double v14 = [(NSArray *)self->_items objectAtIndexedSubscript:v13];
    unsigned int v15 = [v14 isActive] ^ 1;
  }
  if (v3) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 0;
  }
  pinnedOverflowButton = self->_pinnedOverflowButton;
  [(PinnedTabsOverflowButton *)pinnedOverflowButton setShowsTrailingSeparator:v16];
}

- (CGRect)_scrollableItemArea
{
  if (self->_visiblePinnedItemCount)
  {
    double v3 = *MEMORY[0x1E4FB2848];
    double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    int v7 = [(TabBar *)self _sf_usesLeftToRightLayout];
    [(TabBar *)self safeAreaInsets];
    double v9 = v8;
    double v11 = v10;
    [(TabBar *)self _pinnedItemsWidth];
    double v13 = v9 + v12;
    double v14 = v11 + v12;
    if (v7) {
      double v15 = v6;
    }
    else {
      double v15 = v14;
    }
    if (v7) {
      double v16 = v13;
    }
    else {
      double v16 = v4;
    }
    [(TabBar *)self bounds];
    double v18 = v16 + v17;
    double v20 = v3 + v19;
    double v22 = v21 - (v15 + v16);
    double v24 = v23 - (v3 + v5);
  }
  else
  {
    [(TabBar *)self bounds];
  }
  result.size.height = v24;
  result.size.double width = v22;
  result.origin.double y = v20;
  result.origin.CGFloat x = v18;
  return result;
}

- (id)_firstVisibleItemAfterIndex:(unint64_t)a3
{
  while (++a3 < [(NSArray *)self->_items count])
  {
    if (![(NSIndexSet *)self->_overflowPinnedItemIndexes containsIndex:a3])
    {
      double v5 = [(NSArray *)self->_items objectAtIndexedSubscript:a3];
      goto LABEL_5;
    }
  }
  double v5 = 0;
LABEL_5:
  return v5;
}

- (double)_horizontalPositionForItemAtIndex:(unint64_t)a3 withSlowingFactor:(double)a4
{
  [(TabBar *)self _horizontalPositionForItemAtIndex:a3 withSlowingFactor:self->_visiblePinnedItemCount > a3 pinned:a4];
  return result;
}

- (id)_requestReusableTabBarItemView
{
  double v3 = [(NSMutableArray *)self->_tabBarItemViewReuseStack lastObject];
  if (v3)
  {
    [(NSMutableArray *)self->_tabBarItemViewReuseStack removeLastObject];
    [v3 setHidden:0];
    double v4 = v3;
  }
  else
  {
    double v4 = [[TabBarItemView alloc] initWithTabBar:self];
  }
  double v5 = v4;

  return v5;
}

- (double)_horizontalPositionForItemAtIndex:(unint64_t)a3
{
  [(TabBar *)self _horizontalPositionForItemAtIndex:a3 withSlowingFactor:64.0];
  return result;
}

void __32__TabBar_scrollToItem_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5), "setActiveAnimationCount:", objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5), "activeAnimationCount", (void)v6) - 1);
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

uint64_t __28__TabBar_setItems_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (TabBar)initWithFrame:(CGRect)a3
{
  v51.receiver = self;
  v51.super_class = (Class)TabBar;
  uint64_t v3 = -[TabBar initWithFrame:](&v51, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    tabBarItemViewReuseStack = v3->_tabBarItemViewReuseStack;
    v3->_tabBarItemViewReuseStack = v4;

    long long v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel__didReceiveMemoryWarning_ name:*MEMORY[0x1E4FB2650] object:0];

    [(TabBar *)v3 setMultipleTouchEnabled:0];
    [(TabBar *)v3 setExclusiveTouch:1];
    long long v7 = [(TabBar *)v3 layer];
    objc_msgSend(v7, "setAnchorPoint:", 0.5, 0.0);

    long long v8 = [(TabBar *)v3 layer];
    [v8 setAllowsGroupOpacity:0];

    long long v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    leadingContainer = v3->_leadingContainer;
    v3->_leadingContainer = v9;

    uint64_t v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    trailingContainer = v3->_trailingContainer;
    v3->_trailingContainer = v11;

    [(UIView *)v3->_leadingContainer setClipsToBounds:1];
    [(UIView *)v3->_trailingContainer setClipsToBounds:1];
    [(TabBar *)v3 addSubview:v3->_leadingContainer];
    [(TabBar *)v3 addSubview:v3->_trailingContainer];
    double v13 = [(UIView *)v3->_leadingContainer layer];
    double v14 = [(UIView *)v3->_trailingContainer layer];
    [v13 setAllowsGroupOpacity:0];
    [v14 setAllowsGroupOpacity:0];
    [v13 setAllowsGroupBlending:0];
    [v14 setAllowsGroupBlending:0];
    [v13 setAllowsEdgeAntialiasing:0];
    [v14 setAllowsEdgeAntialiasing:0];
    unsigned int v15 = [(TabBar *)v3 _sf_usesLeftToRightLayout];
    objc_msgSend(v13, "setAnchorPoint:", (double)v15, 0.5);
    objc_msgSend(v14, "setAnchorPoint:", (double)(v15 ^ 1), 0.5);
    v3->_tintStyle = 1;
    double v16 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
    leadingVibrancyEffectView = v3->_leadingVibrancyEffectView;
    v3->_leadingVibrancyEffectView = v16;

    double v18 = [MEMORY[0x1E4FB1618] whiteColor];
    double v19 = [(UIVisualEffectView *)v3->_leadingVibrancyEffectView contentView];
    [v19 setBackgroundColor:v18];

    [(UIVisualEffectView *)v3->_leadingVibrancyEffectView _setOverrideUserInterfaceStyle:1];
    double v20 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
    trailingVibrancyEffectView = v3->_trailingVibrancyEffectView;
    v3->_trailingVibrancyEffectView = v20;

    double v22 = [MEMORY[0x1E4FB1618] whiteColor];
    double v23 = [(UIVisualEffectView *)v3->_trailingVibrancyEffectView contentView];
    [v23 setBackgroundColor:v22];

    [(UIVisualEffectView *)v3->_trailingVibrancyEffectView _setOverrideUserInterfaceStyle:1];
    [(UIView *)v3->_leadingContainer addSubview:v3->_leadingVibrancyEffectView];
    [(UIView *)v3->_trailingContainer addSubview:v3->_trailingVibrancyEffectView];
    [(TabBar *)v3 _updateBackground];
    double v24 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
    scrollView = v3->_scrollView;
    v3->_scrollView = v24;

    [(UIScrollView *)v3->_scrollView setDelegate:v3];
    [(UIScrollView *)v3->_scrollView setUserInteractionEnabled:0];
    [(UIScrollView *)v3->_scrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v3->_scrollView setContentInsetAdjustmentBehavior:2];
    [(UIScrollView *)v3->_scrollView setTracksImmediatelyWhileDecelerating:0];
    [(TabBar *)v3 addSubview:v3->_scrollView];
    double v26 = [(UIScrollView *)v3->_scrollView panGestureRecognizer];
    [v26 _setCanPanVertically:0];
    [(TabBar *)v3 addGestureRecognizer:v26];
    -[UIScrollView _setAutoScrollTouchInsets:](v3->_scrollView, "_setAutoScrollTouchInsets:", 0.0, -128.0, 0.0, -128.0);
    double v27 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    dragPreviewContainer = v3->_dragPreviewContainer;
    v3->_dragPreviewContainer = v27;

    [(UIView *)v3->_dragPreviewContainer setHidden:1];
    [(TabBar *)v3 addSubview:v3->_dragPreviewContainer];
    uint64_t v29 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v3 action:sel__tap_];
    tapRecognizer = v3->_tapRecognizer;
    v3->_tapRecognizer = (UITapGestureRecognizer *)v29;

    [(UITapGestureRecognizer *)v3->_tapRecognizer setEnabled:1];
    [(TabBar *)v3 addGestureRecognizer:v3->_tapRecognizer];
    +[TabCollectionViewSpringLoadingBehavior addSpringLoadedInteractionToTabView:v3];
    double v31 = [MEMORY[0x1E4F1C978] array];
    [(TabBar *)v3 setItems:v31];

    [(TabBar *)v3 setAccessibilityIdentifier:@"tabBar"];
    int IsPad = _SFDeviceIsPad();
    double v33 = 119.0;
    if (IsPad) {
      double v33 = 132.0;
    }
    v3->_minimumTabdouble Width = v33;
    uint64_t v34 = [objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v3 action:sel__reorder_];
    reorderRecognizer = v3->_reorderRecognizer;
    v3->_reorderRecognizer = (UIPanGestureRecognizer *)v34;

    [(UIPanGestureRecognizer *)v3->_reorderRecognizer setDelegate:v3];
    [(TabBar *)v3 addGestureRecognizer:v3->_reorderRecognizer];
    uint64_t v36 = [objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:v3 action:sel__hover_];
    hoverRecognizer = v3->_hoverRecognizer;
    v3->_hoverRecognizer = (UIHoverGestureRecognizer *)v36;

    [(TabBar *)v3 addGestureRecognizer:v3->_hoverRecognizer];
    double v38 = (SFTabHoverPreviewController *)objc_alloc_init(MEMORY[0x1E4F783C0]);
    tabHoverPreviewController = v3->_tabHoverPreviewController;
    v3->_tabHoverPreviewController = v38;

    [(SFTabHoverPreviewController *)v3->_tabHoverPreviewController setHoverRecognizer:v3->_hoverRecognizer];
    uint64_t v40 = [MEMORY[0x1E4F28D60] indexSet];
    overflowPinnedItemIndexes = v3->_overflowPinnedItemIndexes;
    v3->_overflowPinnedItemIndexes = (NSIndexSet *)v40;

    double v42 = objc_alloc_init(PinnedTabsOverflowButton);
    pinnedOverflowButton = v3->_pinnedOverflowButton;
    v3->_pinnedOverflowButton = v42;

    [(PinnedTabsOverflowButton *)v3->_pinnedOverflowButton setTintStyle:v3->_tintStyle];
    objc_initWeak(&location, v3);
    double v44 = (void *)MEMORY[0x1E4FB1970];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __24__TabBar_initWithFrame___block_invoke;
    v48[3] = &unk_1E6D7C060;
    objc_copyWeak(&v49, &location);
    double v45 = objc_msgSend(v44, "safari_menuWithUncachedChildrenProvider:", v48);
    [(PinnedTabsOverflowButton *)v3->_pinnedOverflowButton setMenu:v45];

    [(TabBar *)v3 addSubview:v3->_pinnedOverflowButton];
    double v46 = v3;
    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)setItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  long long v6 = (NSArray *)a3;
  long long v7 = v6;
  if (self->_items != v6 && !-[NSArray isEqualToArray:](v6, "isEqualToArray:"))
  {
    BOOL v35 = v4;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v36 = v7;
    long long v8 = v7;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v53 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = [*(id *)(*((void *)&v52 + 1) + 8 * i) layoutInfo];
          [v13 setRemovedFromTabBar:0];
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v10);
    }

    double v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    unsigned int v15 = self->_items;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v49 != v18) {
            objc_enumerationMutation(v15);
          }
          double v20 = *(void **)(*((void *)&v48 + 1) + 8 * j);
          if (([v14 containsObject:v20] & 1) == 0)
          {
            double v21 = [v20 layoutInfo];
            [v21 setRemovedFromTabBar:1];

            [v20 setTabBar:0];
          }
        }
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v17);
    }

    double v22 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:self->_items];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __28__TabBar_setItems_animated___block_invoke;
    v46[3] = &unk_1E6D7C088;
    id v23 = v22;
    id v47 = v23;
    uint64_t v24 = [(NSArray *)v8 indexOfObjectWithOptions:2 passingTest:v46];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __28__TabBar_setItems_animated___block_invoke_2;
    v42[3] = &unk_1E6D7C0B0;
    v42[4] = self;
    double v25 = v8;
    double v43 = v25;
    id v26 = v23;
    id v44 = v26;
    uint64_t v45 = v24;
    double v27 = [(NSArray *)v25 indexesOfObjectsPassingTest:v42];
    if (v35) {
      [(TabBar *)self _layoutIndexes:v27 ofItems:v25 currentItems:v26];
    }
    CGFloat v28 = (NSArray *)[(NSArray *)v25 copy];
    items = self->_items;
    self->_items = v28;

    [(TabBar *)self _updatePinnedItemCount];
    double v30 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:self->_items];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __28__TabBar_setItems_animated___block_invoke_3;
    v37[3] = &unk_1E6D7C0D8;
    v37[4] = self;
    double v31 = v25;
    double v38 = v31;
    id v32 = v30;
    id v40 = v26;
    uint64_t v41 = v24;
    id v39 = v32;
    id v33 = v26;
    uint64_t v34 = [(NSArray *)v31 indexesOfObjectsPassingTest:v37];
    long long v7 = v36;
    if (v35) {
      [(TabBar *)self _layoutIndexes:v34 ofItems:v31 currentItems:v32];
    }
    [(TabBar *)self setNeedsLayout];
  }
}

- (void)setItems:(id)a3
{
}

- (void)_updateBackground
{
  objc_msgSend(MEMORY[0x1E4FB1EA0], "_sf_effectWithStyle:forBarTintStyle:", 2, self->_tintStyle);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UIVisualEffectView *)self->_leadingVibrancyEffectView setEffect:v3];
  [(UIVisualEffectView *)self->_trailingVibrancyEffectView setEffect:v3];
}

- (int64_t)tintStyle
{
  return self->_tintStyle;
}

- (void)addInteraction:(id)a3
{
  id v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TabBar;
  [(TabBar *)&v6 addInteraction:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_dragInteraction, a3);
  }
}

- (SFTabHoverPreviewController)tabHoverPreviewController
{
  return self->_tabHoverPreviewController;
}

- (void)setDelegate:(id)a3
{
}

uint64_t __28__TabBar_setItems_animated___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ((unint64_t)[*(id *)(a1 + 32) _effectiveIndexForIndex:a3 ofItems:*(void *)(a1 + 40) currentItems:*(void *)(a1 + 48)] <= *(void *)(a1 + 64))uint64_t v6 = objc_msgSend(*(id *)(a1 + 56), "containsObject:", v5) ^ 1; {
  else
  }
    uint64_t v6 = 0;

  return v6;
}

uint64_t __28__TabBar_setItems_animated___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ((unint64_t)[*(id *)(a1 + 32) _effectiveIndexForIndex:a3 ofItems:*(void *)(a1 + 40) currentItems:*(void *)(a1 + 48)] <= *(void *)(a1 + 56))uint64_t v6 = 0; {
  else
  }
    uint64_t v6 = [*(id *)(a1 + 48) containsObject:v5] ^ 1;

  return v6;
}

id __24__TabBar_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _overflowPinnedItemsMenuElements];
  id v3 = v2;
  if (!v2) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([v7 type] == 9
    && ([(TabBar *)self bounds], v14.size.height = 70.0, v13.x = x, v13.double y = y, CGRectContainsPoint(v14, v13)))
  {
    long long v8 = self->_scrollView;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TabBar;
    -[TabBar hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
    long long v8 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = v8;

  return v9;
}

- (void)_itemDidPressCloseButton:(id)a3
{
  tabHoverPreviewController = self->_tabHoverPreviewController;
  id v5 = a3;
  [(SFTabHoverPreviewController *)tabHoverPreviewController dismiss];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabCollectionView:self closeItem:v5];

  id v7 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v7 didCloseTabWithTrigger:0 tabCollectionViewType:1];
}

- (void)_toggleMediaStateMutedForItem:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained tabBar:self toggleMediaStateMutedForItem:v5];
}

- (CGRect)frameForItem:(id)a3
{
  id v3 = [a3 layoutInfo];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (id)viewForItem:(id)a3
{
  id v3 = [a3 layoutInfo];
  double v4 = [v3 tabBarItemView];

  return v4;
}

- (id)targetItemForDropAtPoint:(CGPoint)a3
{
  double x = a3.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  double v5 = self->_items;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    double v8 = 0;
    uint64_t v9 = *(void *)v27;
    double v10 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v5);
        }
        double v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        double v13 = objc_msgSend(v12, "layoutInfo", (void)v26);
        if ([v13 hasViews])
        {
          [v13 frame];
          CGFloat v14 = v33.origin.x;
          CGFloat y = v33.origin.y;
          CGFloat width = v33.size.width;
          CGFloat height = v33.size.height;
          double v18 = CGRectGetWidth(v33);
          [(TabBar *)self _itemWidth];
          _SFRoundFloatToPixels();
          double v20 = v19;
          _SFOnePixel();
          if (v18 >= v20 - v21 || [v12 isPinned])
          {
            v34.origin.double x = v14;
            v34.origin.CGFloat y = y;
            v34.size.CGFloat width = width;
            v34.size.CGFloat height = height;
            double v22 = x - CGRectGetMidX(v34);
            double v23 = v22 >= 0.0 ? v22 : -v22;
            if (v23 < v10)
            {
              id v24 = v12;

              double v8 = v24;
              double v10 = v23;
            }
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (int64_t)itemDragContentType
{
  return 3;
}

- (unsigned)_edgeToAlignWithPreviewForItem:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int64_t v4 = [(NSArray *)self->_items indexOfObjectIdenticalTo:a3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v5 = self->_items;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = -1;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v9 + v7;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v10), "isActive", (void)v16))
        {
          uint64_t v11 = v9 + v10 + 1;
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v9 = v11;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v11 = -1;
  }
LABEL_12:

  int v12 = [(TabBar *)self _sf_usesLeftToRightLayout];
  if (v12) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 2;
  }
  if (v12) {
    unsigned int v14 = 2;
  }
  else {
    unsigned int v14 = 0;
  }
  if (v4 <= v11) {
    return v13;
  }
  else {
    return v14;
  }
}

- (id)targetedDragPreviewForLiftingItem:(id)a3
{
  id v4 = a3;
  double v5 = [(TabBar *)self viewForItem:v4];
  if (v5)
  {
    id v6 = v4;
    uint64_t v7 = [v6 layoutInfo];
    uint64_t v8 = [v7 viewForDragPreview];

    [v8 frame];
    double x = v41.origin.x;
    double y = v41.origin.y;
    double height = v41.size.height;
    double Width = CGRectGetWidth(v41);
    if ([v6 isPinned]) {
      double v13 = 36.0;
    }
    else {
      [(TabBar *)self itemWidth];
    }
    objc_msgSend(v8, "setFrame:", x, y, fmax(Width, v13), height);
    [v5 center];
    double v16 = v15;
    [v5 frame];
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    [v8 frame];
    double v25 = CGRectGetWidth(v42);
    unsigned int v26 = [(TabBar *)self _edgeToAlignWithPreviewForItem:v6];
    double v27 = v25 * 0.5;
    uint64_t v28 = v18;
    uint64_t v29 = v20;
    uint64_t v30 = v22;
    uint64_t v31 = v24;
    if (v26) {
      double v32 = CGRectGetMaxX(*(CGRect *)&v28) - v27;
    }
    else {
      double v32 = v27 + CGRectGetMinX(*(CGRect *)&v28);
    }
    id v33 = objc_alloc_init(MEMORY[0x1E4FB1720]);
    if (_SFIsDarkTintStyle())
    {
      CGRect v34 = [MEMORY[0x1E4FB1618] darkGrayColor];
      [v33 setBackgroundColor:v34];
    }
    id v35 = objc_alloc(MEMORY[0x1E4FB1D40]);
    id v36 = objc_alloc(MEMORY[0x1E4FB1728]);
    double v37 = [v5 superview];
    double v38 = objc_msgSend(v36, "initWithContainer:center:", v37, v32, v16);
    unsigned int v14 = (void *)[v35 initWithView:v8 parameters:v33 target:v38];
  }
  else
  {
    unsigned int v14 = 0;
  }

  return v14;
}

- (BOOL)supportsDropTransitionToItemView
{
  return 1;
}

- (unint64_t)contextMenuOptionsForItem:(id)a3
{
  return 4146;
}

- (BOOL)shouldPinItemsDroppedAtPoint:(CGPoint)a3
{
  double x = a3.x;
  [(TabBar *)self _pinnedItemsWidth];
  double v6 = v5 + self->_minimumTabWidth * 0.33;
  int v7 = [(TabBar *)self _sf_usesLeftToRightLayout];
  [(TabBar *)self _sf_safeAreaBounds];
  if (v7) {
    return x < v6 + CGRectGetMinX(*(CGRect *)&v8);
  }
  else {
    return x > CGRectGetMaxX(*(CGRect *)&v8) - v6;
  }
}

- (id)dragPreviewForItem:(id)a3 pinned:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 setTabBar:self];
  int v7 = [v6 layoutInfo];

  uint64_t v8 = [v7 tabBarItemPreviewView];

  [v8 setPinned:v4];
  if (v4 && !self->_allowsScrollingPinnedItems)
  {
    double v10 = 36.0;
  }
  else
  {
    [(TabBar *)self itemWidth];
    double v10 = v9;
  }
  [(TabBar *)self bounds];
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v10, CGRectGetHeight(v21));
  [v8 setTitleLayoutWidth:v10];
  if (v4)
  {
    uint64_t v11 = [v8 closeButton];
    [v11 setHidden:0];
  }
  int v12 = (void *)MEMORY[0x1E4FB1EB0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __36__TabBar_dragPreviewForItem_pinned___block_invoke;
  v18[3] = &unk_1E6D77E20;
  id v13 = v8;
  id v19 = v13;
  [v12 performWithoutAnimation:v18];
  [(UIView *)self->_dragPreviewContainer addSubview:v13];
  id v14 = objc_alloc_init(MEMORY[0x1E4FB1720]);
  if (_SFIsDarkTintStyle())
  {
    double v15 = [MEMORY[0x1E4FB1618] darkGrayColor];
    [v14 setBackgroundColor:v15];
  }
  double v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1718]) initWithView:v13 parameters:v14];

  return v16;
}

uint64_t __36__TabBar_dragPreviewForItem_pinned___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) configureForDragPreview];
}

- (void)cleanUpDragPreviewForItem:(id)a3
{
  id v6 = a3;
  BOOL v4 = [v6 layoutInfo];
  [v4 clearPreviewView];

  if (![(NSArray *)self->_items containsObject:v6])
  {
    double v5 = [v6 tabBar];

    if (v5 == self) {
      [v6 setTabBar:0];
    }
  }
}

- (void)_scrollTowardItem:(id)a3 byAmount:(double)a4
{
  unint64_t v6 = [(NSArray *)self->_items indexOfObject:a3];
  if (v6 < [(NSArray *)self->_items count])
  {
    int v7 = [(TabBar *)self _sf_usesLeftToRightLayout];
    if (v7) {
      [(TabBar *)self _totalPinnedItemCount];
    }
    [(TabBar *)self _sf_safeAreaBounds];
    double v9 = v8;
    [(TabBar *)self _itemWidth];
    _SFRoundFloatToPixels();
    double v11 = v10;
    if (v7)
    {
      [(TabBar *)self _pinnedItemsWidth];
      double v11 = v11 + v12;
    }
    [(UIScrollView *)self->_scrollView contentOffset];
    double v14 = v13 + v9 * 0.5;
    [(UIScrollView *)self->_scrollView contentOffset];
    double v16 = v15;
    double v18 = v17 + v9 * a4;
    double v19 = v17 - v9 * a4;
    if (v11 <= v14) {
      double v20 = v19;
    }
    else {
      double v20 = v18;
    }
    [(TabBar *)self _scrollableWidth];
    double v22 = fmax(fmin(v20, v21 - v9), 0.0);
    [(TabBar *)self layoutBelowIfNeeded];
    -[UIScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v22, v16);
    [(UIHoverGestureRecognizer *)self->_hoverRecognizer setEnabled:0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __37__TabBar__scrollTowardItem_byAmount___block_invoke;
    v24[3] = &unk_1E6D77E20;
    v24[4] = self;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __37__TabBar__scrollTowardItem_byAmount___block_invoke_2;
    v23[3] = &unk_1E6D77C20;
    v23[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:2 animations:v24 completion:v23];
  }
}

uint64_t __37__TabBar__scrollTowardItem_byAmount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutBelowIfNeeded];
}

uint64_t __37__TabBar__scrollTowardItem_byAmount___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didCompleteScrolling];
}

- (CGRect)_initialFrameForItemAtIndex:(unint64_t)a3
{
  NSUInteger v5 = [(NSArray *)self->_items count] - 1;
  [(TabBar *)self _sf_safeAreaBounds];
  double Width = CGRectGetWidth(v15);
  if (v5 <= 1) {
    unint64_t v7 = 1;
  }
  else {
    unint64_t v7 = v5;
  }
  double v8 = fmax(self->_minimumTabWidth, Width / (double)v7);
  int v9 = [(TabBar *)self _sf_usesLeftToRightLayout];
  if (v8 * (double)v5 <= Width)
  {
    [(TabBar *)self _sf_safeAreaBounds];
    CGRectGetMinX(v16);
  }
  else
  {
    [(TabBar *)self _horizontalPositionForItemAtIndex:(v9 ^ 1u) + a3];
  }
  [(TabBar *)self bounds];
  _SFRoundRectToPixels();
  result.size.double height = v13;
  result.size.CGFloat width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (void)setHidesTitles:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_hidesTitles != a3)
  {
    BOOL v3 = a3;
    self->_hidesTitles = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v4 = self->_items;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          int v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8), "layoutInfo", (void)v10);
          [v9 setHidesTitleText:v3];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (id)_itemAtLocation:(CGPoint)a3
{
  double x = a3.x;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v4 = self->_items;
  id v5 = (id)[(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v9 = objc_msgSend(v8, "layoutInfo", (void)v15);
        if ([v9 hasViews])
        {
          [v9 frame];
          CGFloat v10 = v22.origin.x;
          CGFloat y = v22.origin.y;
          CGFloat width = v22.size.width;
          CGFloat height = v22.size.height;
          if (CGRectGetMinX(v22) <= x)
          {
            v23.origin.double x = v10;
            v23.origin.CGFloat y = y;
            v23.size.CGFloat width = width;
            v23.size.CGFloat height = height;
            if (x < CGRectGetMaxX(v23))
            {
              id v5 = v8;

              goto LABEL_13;
            }
          }
        }
      }
      id v5 = (id)[(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v5;
}

- (void)_activateItemIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    int v9 = v4;
    char v6 = [v4 isActive];
    id v5 = v9;
    if ((v6 & 1) == 0)
    {
      char v7 = [v9 isPlaceholder];
      id v5 = v9;
      if ((v7 & 1) == 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained tabCollectionView:self didSelectItem:v9];

        id v5 = v9;
      }
    }
  }
}

- (id)_itemForTouch:(id)a3
{
  [a3 locationInView:self];
  return -[TabBar _itemAtLocation:](self, "_itemAtLocation:");
}

- (void)_tap:(id)a3
{
  [a3 locationInView:self];
  uint64_t v4 = -[TabBar _itemAtLocation:](self, "_itemAtLocation:");
  id v11 = (id)v4;
  if (v4)
  {
    BOOL v5 = [(TabBar *)self _isScrollable];
    uint64_t v4 = (uint64_t)v11;
    if (v5)
    {
      char v6 = [v11 layoutInfo];
      [v6 frame];
      double v8 = v7;
      [(TabBar *)self _itemWidth];
      if (v8 >= v9 * 0.8)
      {

        uint64_t v4 = (uint64_t)v11;
      }
      else
      {
        char v10 = [v11 isPinned];

        uint64_t v4 = (uint64_t)v11;
        if ((v10 & 1) == 0)
        {
          [(TabBar *)self _scrollTowardItem:v11 byAmount:0.25];
          goto LABEL_8;
        }
      }
    }
  }
  [(TabBar *)self _activateItemIfNeeded:v4];
LABEL_8:
}

- (void)_reorder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)([v4 state] - 3) >= 0xFFFFFFFFFFFFFFFELL)
  {
    [(UIPanGestureRecognizer *)self->_reorderRecognizer translationInView:self];
    if (v6 != *MEMORY[0x1E4F1DAD8] || v5 != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      double v8 = objc_msgSend(v4, "_activeEvents", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (![v13 type])
            {
              double v14 = [v4 _activeTouchesForEvent:v13];
              uint64_t v15 = [v14 anyObject];

              if (v15)
              {

                [(UIDragInteraction *)self->_dragInteraction _immediatelyBeginDragWithTouch:v15 completion:0];
                double v8 = (void *)v15;
                goto LABEL_17;
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_17:

      [v4 setEnabled:0];
      [v4 setEnabled:1];
    }
  }
}

- (void)_hover:(id)a3
{
  id v4 = a3;
  [v4 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [v4 state];

  if ((unint64_t)(v9 - 1) > 1)
  {
    tabHoverPreviewController = self->_tabHoverPreviewController;
    -[SFTabHoverPreviewController updateWithItem:atLocation:](tabHoverPreviewController, "updateWithItem:atLocation:", 0, v6, v8);
  }
  else
  {
    -[TabBar _itemAtLocation:](self, "_itemAtLocation:", v6, v8);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    -[SFTabHoverPreviewController updateWithItem:atLocation:](self->_tabHoverPreviewController, "updateWithItem:atLocation:", v11, v6, v8);
  }
}

- (unint64_t)indexOfCenterItem
{
  [(TabBar *)self bounds];
  double MidX = CGRectGetMidX(v21);
  if (MidX == 0.0)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[TabBar indexOfCenterItem](v4);
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  double v6 = MidX;
  if (![(NSArray *)self->_items count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v7 = 0;
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    double v8 = [(NSArray *)self->_items objectAtIndexedSubscript:v7];
    uint64_t v9 = [v8 layoutInfo];
    [v9 frame];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    v22.origin.double x = v11;
    v22.origin.CGFloat y = v13;
    v22.size.CGFloat width = v15;
    v22.size.CGFloat height = v17;
    double MinX = CGRectGetMinX(v22);
    v23.origin.double x = v11;
    v23.origin.CGFloat y = v13;
    v23.size.CGFloat width = v15;
    v23.size.CGFloat height = v17;
    if (v6 <= CGRectGetMaxX(v23) && MinX < v6) {
      unint64_t v5 = v7;
    }

    ++v7;
  }
  while (v7 < [(NSArray *)self->_items count]);
  return v5;
}

- (unint64_t)maxNumberOfVisibleTabs
{
  [(TabBar *)self bounds];
  return (unint64_t)(ceil(CGRectGetWidth(v4) / self->_minimumTabWidth) + 6.0);
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TabBar;
  [(TabBar *)&v4 dealloc];
}

- (void)_didReceiveMemoryWarning:(id)a3
{
}

uint64_t __27__TabBar_updatePinnedItems__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __32__TabBar__updatePinnedItemCount__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isActive];
}

- (unint64_t)_lastVisiblePinnedItemIndex
{
  if (![(TabBar *)self _totalPinnedItemCount]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v3 = 0;
  unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (![(NSIndexSet *)self->_overflowPinnedItemIndexes containsIndex:v3]) {
      unint64_t v4 = v3;
    }
    ++v3;
  }
  while (v3 < [(TabBar *)self _totalPinnedItemCount]);
  return v4;
}

- (id)_overflowPinnedItemsMenuElements
{
  objc_initWeak(&location, self);
  unint64_t v3 = [(NSArray *)self->_items objectsAtIndexes:self->_overflowPinnedItemIndexes];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__TabBar__overflowPinnedItemsMenuElements__block_invoke;
  v6[3] = &unk_1E6D7C148;
  objc_copyWeak(&v7, &location);
  unint64_t v4 = objc_msgSend(v3, "safari_mapObjectsUsingBlock:", v6);
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

id __42__TabBar__overflowPinnedItemsMenuElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__TabBar__overflowPinnedItemsMenuElements__block_invoke_2;
  v6[3] = &unk_1E6D7C120;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  unint64_t v4 = [v3 menuElementRepresentationWithSelectionHandler:v6];
  objc_destroyWeak(&v7);

  return v4;
}

void __42__TabBar__overflowPinnedItemsMenuElements__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _activateItemIfNeeded:v3];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  unint64_t v4 = [(TabBar *)self _itemForTouch:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  unint64_t v4 = (UIPanGestureRecognizer *)a3;
  BOOL v5 = v4;
  if (self->_reorderRecognizer == v4
    && ([(UIPanGestureRecognizer *)v4 translationInView:self], v6 < 0.0))
  {
    char v7 = 0;
  }
  else
  {
    [(UIPanGestureRecognizer *)v5 locationInView:self];
    double v8 = -[TabBar _itemAtLocation:](self, "_itemAtLocation:");
    if (v8)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v7 = [WeakRetained tabBar:self canMoveItem:v8];
    }
    else
    {
      char v7 = 0;
    }
  }
  return v7;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  [(UIHoverGestureRecognizer *)self->_hoverRecognizer setEnabled:0];
  tabHoverPreviewController = self->_tabHoverPreviewController;
  [(SFTabHoverPreviewController *)tabHoverPreviewController cancel];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(TabBar *)self _didCompleteScrolling];
  }
}

- (void)_didCompleteScrolling
{
  if (self->_newTabVisibleInTabBar)
  {
    [(SFTabHoverPreviewController *)self->_tabHoverPreviewController setNeedsSnapshotUpdate];
    self->_newTabVisibleInTabBar = 0;
  }
}

- (void)_relinquishReusableTabBarItemView:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 setHidden:1];
    [(NSMutableArray *)self->_tabBarItemViewReuseStack addObject:v4];
  }
}

- (TabBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TabBarDelegate *)WeakRetained;
}

- (BOOL)hidesTitles
{
  return self->_hidesTitles;
}

- (BOOL)isDraggingItem
{
  return self->_draggingItem;
}

- (BOOL)allowsScrollingPinnedItems
{
  return self->_allowsScrollingPinnedItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabHoverPreviewController, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hoverRecognizer, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_storeStrong((id *)&self->_reorderRecognizer, 0);
  objc_storeStrong((id *)&self->_trailingVibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_leadingVibrancyEffectView, 0);
  objc_storeStrong((id *)&self->_dragPreviewContainer, 0);
  objc_storeStrong((id *)&self->_trailingContainer, 0);
  objc_storeStrong((id *)&self->_leadingContainer, 0);
  objc_storeStrong((id *)&self->_overflowPinnedItemIndexes, 0);
  objc_storeStrong((id *)&self->_pinnedOverflowButton, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_tabBarItemViewReuseStack, 0);
}

- (void)indexOfCenterItem
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Attempted to get index of center tab bar item when tab bar's bounds is not set.", v1, 2u);
}

@end