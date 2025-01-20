@interface SFUnifiedTabBarLayout
+ (unint64_t)pinnedItemLimitForItemArrangement:(id)a3 tabBarWidth:(double)a4 barMetrics:(id)a5 standalone:(BOOL)a6;
- ($174D3796E742295BF8F26947D44880BB)_scrollSlowingLayoutInfoForItemAtIndex:(SEL)a3 withLayoutInfo:(unint64_t)a4 activeItemFrame:(id *)a5;
- (BOOL)_activeItemIsPinned;
- (BOOL)_itemAtIndexIsPinned:(unint64_t)a3;
- (BOOL)activeItemIsSquished;
- (BOOL)centersActiveItemWhenExpanded;
- (BOOL)contentIsCentered;
- (BOOL)horizontalSpaceIsExtremelyConstrained;
- (BOOL)isCurrentlyScrollable;
- (CGPoint)_contentOffsetForScrollingToRegionWithMinX:(double)a3 maxX:(double)a4 insets:(UIEdgeInsets)a5;
- (CGPoint)_midpointForCenteredContentInScrollView;
- (CGPoint)contentOffsetForScrollingToDroppingItems;
- (CGPoint)contentOffsetForScrollingToItemAtIndex:(unint64_t)a3;
- (CGPoint)midpointForCenteredContent;
- (CGRect)_activeItemPinnableArea;
- (CGRect)_adjustedActiveItemFrame:(CGRect)a3 pinActiveItem:(BOOL)a4 squishActiveItem:(BOOL)a5 centerExpandedItem:(BOOL)a6;
- (CGRect)_contentArea;
- (CGRect)_frameForItem:(id)a3 withOffset:(double)a4 pinActiveItem:(BOOL)a5 squishActiveItem:(BOOL)a6 centerExpandedItem:(BOOL)a7;
- (CGRect)_safeArea;
- (CGRect)_slideFrame:(CGRect)a3 forItemAtIndex:(unint64_t)a4 pinnedActiveItemOffset:(double)a5;
- (CGRect)_unpinnedFrameForItemAtIndex:(unint64_t)a3;
- (CGRect)_unpinnedItemSafeArea;
- (CGRect)frameForItem:(id)a3;
- (CGRect)frameForPreviewingItem:(id)a3 pinned:(BOOL)a4;
- (CGRect)pinnedItemDropArea;
- (CGRect)pinnedItemsSeparatorFrame;
- (CGSize)contentSize;
- (NSArray)visibleItems;
- (NSIndexSet)visibleItemIndexes;
- (SFUnifiedBarItem)hoveringItem;
- (SFUnifiedTabBarItemArrangement)itemArrangement;
- (SFUnifiedTabBarLayout)initWithItemArrangement:(id)a3 configuration:(id)a4;
- (SFUnifiedTabBarMetrics)barMetrics;
- (UIEdgeInsets)_insetsForActiveItemPinnableArea;
- (UIEdgeInsets)_insetsForScrollingToItemAtIndex:(unint64_t)a3;
- (UIEdgeInsets)autoScrollTouchInsets;
- (double)_distanceToEdgeForItemAtIndex:(unint64_t)a3 withFrame:(CGRect)a4 activeItemFrame:(CGRect)a5 occludedEdge:(unint64_t *)a6;
- (double)_effectiveMinimumActiveItemWidth;
- (double)_insetToRevealNextItem;
- (double)_maximumActiveItemWidthForCenteringExpandedItem;
- (double)_maximumItemSpacing;
- (double)_minimumHorizontalOffsetForOccludedItems;
- (double)_minimumItemSpacing;
- (double)_offsetForItemAtIndex:(unint64_t)a3;
- (double)_offsetForItemAtIndex:(unint64_t)a3 inItems:(id)a4;
- (double)_offsetForPinnedItemAtIndex:(unint64_t)a3;
- (double)_pinnedActiveItemOffsetSquishingActiveItem:(BOOL)a3 activeItemFrame:(CGRect *)a4;
- (double)_spacingAfterItem:(id)a3;
- (double)_spacingBeforeItem:(id)a3;
- (double)_widthForItem:(id)a3;
- (double)_zPositionForItem:(id)a3;
- (double)pinnedItemsSeparatorOpacity;
- (id)indexesOfItemsVisibleInRect:(CGRect)a3;
- (id)itemAtPoint:(CGPoint)a3;
- (id)itemClosestToPoint:(CGPoint)a3 passingTest:(id)a4;
- (id)itemsVisibleInRect:(CGRect)a3;
- (unint64_t)_indexOfItemClosestToPoint:(CGPoint)a3 passingTest:(id)a4;
- (unint64_t)indexOfCenterItem;
- (unint64_t)maximumNumberOfVisibleItems;
- (void)_determineOffsetForCenteringExpandedItem;
- (void)_enumerateFramesForItemsAtIndexes:(id)a3 pinActiveItem:(BOOL)a4 usingBlock:(id)a5;
- (void)_updateContentSize;
- (void)_updateItemWidths;
- (void)_updateSquishedActiveItemWidth;
- (void)enumerateFinalLayoutForDisappearingItemsAtIndexes:(id)a3 withDistanceScrolled:(double)a4 usingBlock:(id)a5;
- (void)enumerateInitialLayoutForAppearingItemsAtIndexes:(id)a3 withDistanceToScroll:(double)a4 usingBlock:(id)a5;
- (void)enumerateLayoutForItemsAtIndexes:(id)a3 usingBlock:(id)a4;
- (void)setBarMetrics:(id)a3;
- (void)setHoveringItem:(id)a3;
- (void)setItemAtIndex:(unint64_t)a3 isOccluded:(BOOL)a4;
- (void)setItemAtIndex:(unint64_t)a3 isVisible:(BOOL)a4;
- (void)setMidpointForCenteredContent:(CGPoint)a3;
- (void)updateItemSizes;
- (void)updateItemSizesIfNeeded;
@end

@implementation SFUnifiedTabBarLayout

- (SFUnifiedTabBarLayout)initWithItemArrangement:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)SFUnifiedTabBarLayout;
  v9 = [(SFUnifiedTabBarLayout *)&v28 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemArrangement, a3);
    uint64_t v11 = [v8 scrollView];
    scrollView = v10->_scrollView;
    v10->_scrollView = (UIScrollView *)v11;

    uint64_t v13 = [v8 barMetrics];
    barMetrics = v10->_barMetrics;
    v10->_barMetrics = (SFUnifiedTabBarMetrics *)v13;

    [v8 midpointForCenteredContent];
    v10->_midpointForCenteredContent.x = v15;
    v10->_midpointForCenteredContent.y = v16;
    v10->_standalone = [v8 isStandalone];
    v10->_flipped = [v8 flipped];
    v10->_shouldSlideInNewTrailingTab = [v8 shouldSlideInNewTrailingTab];
    [v8 visibleRectOverride];
    v10->_visibleRectOverride.origin.x = v17;
    v10->_visibleRectOverride.origin.y = v18;
    v10->_visibleRectOverride.size.width = v19;
    v10->_visibleRectOverride.size.height = v20;
    +[SFUnifiedBarMetrics transitioningItemScale];
    v10->_transitioningItemScale = v21;
    uint64_t v22 = [MEMORY[0x1E4F28E60] indexSet];
    visibleItemIndexes = v10->_visibleItemIndexes;
    v10->_visibleItemIndexes = (NSMutableIndexSet *)v22;

    uint64_t v24 = [MEMORY[0x1E4F28E60] indexSet];
    occludedItemIndexes = v10->_occludedItemIndexes;
    v10->_occludedItemIndexes = (NSMutableIndexSet *)v24;

    [(SFUnifiedTabBarLayout *)v10 updateItemSizesIfNeeded];
    [(SFUnifiedTabBarLayout *)v10 _determineOffsetForCenteringExpandedItem];
    v26 = v10;
  }

  return v10;
}

- (void)setBarMetrics:(id)a3
{
  v5 = (SFUnifiedTabBarMetrics *)a3;
  if (self->_barMetrics != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_barMetrics, a3);
    [(SFUnifiedTabBarLayout *)self updateItemSizes];
    v5 = v6;
  }
}

- (BOOL)activeItemIsSquished
{
  return self->_squishedActiveItemWidth < self->_activeItemWidth;
}

- (void)updateItemSizesIfNeeded
{
  [(UIScrollView *)self->_scrollView frame];
  double v4 = v3;
  double v6 = v5;
  [(UIScrollView *)self->_scrollView contentOffset];
  if (self->_lastLayoutSize.width == v4 && self->_lastLayoutSize.height == v6)
  {
    double x = self->_lastLayoutMidpoint.x;
    double y = self->_lastLayoutMidpoint.y;
    double v12 = self->_midpointForCenteredContent.x;
    double v13 = self->_midpointForCenteredContent.y;
    BOOL v14 = self->_lastLayoutContentOffset.y != v8 || self->_lastLayoutContentOffset.x != v7;
    self->_lastLayoutSize.width = v4;
    self->_lastLayoutSize.height = v6;
    self->_lastLayoutMidpoint = self->_midpointForCenteredContent;
    self->_lastLayoutContentOffset.double x = v7;
    self->_lastLayoutContentOffset.double y = v8;
    if (x == v12 && y == v13)
    {
      if (!v14) {
        return;
      }
    }
    else
    {
      [(SFUnifiedTabBarLayout *)self _updateContentSize];
      if (!v14) {
        return;
      }
    }
  }
  else
  {
    self->_lastLayoutSize.width = v4;
    self->_lastLayoutSize.height = v6;
    self->_lastLayoutMidpoint = self->_midpointForCenteredContent;
    self->_lastLayoutContentOffset.double x = v7;
    self->_lastLayoutContentOffset.double y = v8;
    [(SFUnifiedTabBarLayout *)self _updateItemWidths];
    [(SFUnifiedTabBarLayout *)self _updateContentSize];
  }

  [(SFUnifiedTabBarLayout *)self _updateSquishedActiveItemWidth];
}

- (void)updateItemSizes
{
  [(SFUnifiedTabBarLayout *)self _updateItemWidths];
  [(SFUnifiedTabBarLayout *)self _updateContentSize];

  [(SFUnifiedTabBarLayout *)self _updateSquishedActiveItemWidth];
}

- (void)_updateItemWidths
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  double v3 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement items];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return;
  }
  double v5 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
  uint64_t v6 = [v5 count];

  if ([(SFUnifiedTabBarItemArrangement *)self->_itemArrangement allowsScrollingPinnedItems])
  {
    uint64_t v7 = 0;
    if (v6) {
      goto LABEL_4;
    }
LABEL_7:
    double v9 = 0.0;
    if (!v7) {
      goto LABEL_19;
    }
LABEL_8:
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v11 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v42 != v14) {
            objc_enumerationMutation(v11);
          }
          CGFloat v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          if (!self->_standalone)
          {
            CGFloat v17 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];

            if (v16 == v17) {
              continue;
            }
          }
          [(SFUnifiedTabBarLayout *)self _widthForItem:v16];
          double v9 = v9 + v18;
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v13);
    }

    goto LABEL_19;
  }
  v10 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
  uint64_t v7 = [v10 count];

  if (!v6) {
    goto LABEL_7;
  }
LABEL_4:
  +[SFUnifiedBarMetrics separatorWidth];
  double v9 = v8;
  if (v7) {
    goto LABEL_8;
  }
LABEL_19:
  CGFloat v19 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];
  if (v19 && !self->_standalone)
  {
    uint64_t v21 = v4 - ([(SFUnifiedTabBarLayout *)self _activeItemIsPinned] ^ 1);
    int v20 = 1;
  }
  else
  {
    int v20 = 0;
    uint64_t v21 = v4;
  }
  uint64_t v22 = v21 - v7;
  [(SFUnifiedTabBarLayout *)self _safeArea];
  double v23 = CGRectGetWidth(v47) - v9;
  [(SFUnifiedTabBarLayout *)self _maximumItemSpacing];
  double v25 = v24;
  if (self->_standalone) {
    double v26 = v23;
  }
  else {
    double v26 = 149.0;
  }
  [(SFUnifiedTabBarLayout *)self _minimumItemSpacing];
  double v40 = v27;
  [(SFUnifiedTabBarMetrics *)self->_barMetrics minimumInactiveItemWidth];
  double v29 = v28;
  if ([(SFUnifiedTabBarLayout *)self horizontalSpaceIsExtremelyConstrained])
  {
    if (shouldSquishActiveItem_onceToken != -1) {
      dispatch_once(&shouldSquishActiveItem_onceToken, &__block_literal_global_20);
    }
    if (!shouldSquishActiveItem_shouldSquishActiveItem) {
      double v29 = 36.0;
    }
  }
  double v30 = (double)(uint64_t)((__PAIR128__(v4, v6) - 1) >> 64);
  self->_activeItemWidth = v23 - (double)v22 * v26 - v30 * v25;
  [(SFUnifiedTabBarLayout *)self _effectiveMinimumActiveItemWidth];
  double v32 = v31;
  [(SFUnifiedTabBarMetrics *)self->_barMetrics maximumActiveItemWidth];
  double v38 = v33;
  double v34 = fmax(v32, fmin(v33, self->_activeItemWidth));
  self->_activeItemWidth = v34;
  self->_activeItemWidthWhenNotExpanded = v34;
  if (!v20) {
    double v34 = 0.0;
  }
  double v35 = v23 - v34;
  double v36 = fmax(fmin(_SFUninterpolate(v23 - v34, v40 * v30 + (double)v22 * v29, v25 * v30 + (double)v22 * v26), 1.0), 0.0);
  self->_itemSpacing = _SFInterpolate(v40, v25, v36);
  double v37 = _SFInterpolate(v29, v26, v36);
  self->_itemWidth = v37;
  if (self->_standalone)
  {
    self->_activeItemWidth = v37;
    self->_activeItemWidthWhenNotExpanded = v37;
  }
  self->_scrollSlowingInset = fmin(v37 + self->_itemSpacing, v35 * 0.33);
  if ([(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIsExpanded])
  {
    if ([(SFUnifiedTabBarLayout *)self centersActiveItemWhenExpanded]) {
      self->_activeItemWidth = v39;
    }
  }
}

- (void)_updateContentSize
{
  double v3 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement items];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    self->_leadingItemOffset = 0.0;
    double v5 = 0.0;
    if (![(SFUnifiedTabBarItemArrangement *)self->_itemArrangement allowsScrollingPinnedItems])
    {
      uint64_t v6 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
      uint64_t v7 = [v6 count];

      if (v7)
      {
        [(SFUnifiedTabBarLayout *)self _offsetForPinnedItemAtIndex:v7];
        double v5 = v8;
      }
    }
    self->_pinnedItemsdouble Width = v5;
    [(SFUnifiedTabBarLayout *)self _offsetForItemAtIndex:v4];
    double v10 = v9;
    double v11 = v9 + self->_pinnedItemsWidth;
    [(SFUnifiedTabBarLayout *)self _safeArea];
    double Width = CGRectGetWidth(v19);
    self->_contentSize.width = fmax(v11, Width);
    self->_contentSize.height = 0.0;
    pinnedItemsdouble Width = self->_pinnedItemsWidth;
    double v14 = fmax(self->_midpointForCenteredContent.x + v10 * -0.5, pinnedItemsWidth);
    [(UIScrollView *)self->_scrollView adjustedContentInset];
    double v16 = v14 - v15;
    double v17 = Width - v11 - (v14 - v15);
    if (self->_flipped) {
      double v16 = v17;
    }
    self->_leadingItemOffset = fmax(pinnedItemsWidth, fmin(Width + pinnedItemsWidth - v11, v16));
    self->_contentIsCentered = v11 < Width;
    if (v11 < Width)
    {
      LOBYTE(v18) = 0;
    }
    else
    {
      BOOL v18 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIsExpanded];
      if (v18) {
        LOBYTE(v18) = [(SFUnifiedTabBarLayout *)self centersActiveItemWhenExpanded];
      }
    }
    self->_expandedItemIsCentered = v18;
  }
}

- (void)_updateSquishedActiveItemWidth
{
  if ([(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIsExpanded]) {
    goto LABEL_6;
  }
  if (shouldSquishActiveItem_onceToken != -1) {
    dispatch_once(&shouldSquishActiveItem_onceToken, &__block_literal_global_20);
  }
  if (!shouldSquishActiveItem_shouldSquishActiveItem)
  {
LABEL_6:
    activeItemdouble Width = self->_activeItemWidth;
  }
  else
  {
    [(SFUnifiedTabBarLayout *)self _pinnedActiveItemOffsetSquishingActiveItem:0 activeItemFrame:0];
    activeItemdouble Width = fmax(self->_itemWidth, fmin(self->_activeItemWidth, self->_activeItemWidth - fabs(v3)));
  }
  self->_squishedActiveItemdouble Width = activeItemWidth;
}

- (void)_determineOffsetForCenteringExpandedItem
{
  if (self->_expandedItemIsCentered)
  {
    [(SFUnifiedTabBarLayout *)self _unpinnedFrameForItemAtIndex:[(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIndex]];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    -[SFUnifiedTabBarLayout _adjustedActiveItemFrame:pinActiveItem:squishActiveItem:centerExpandedItem:](self, "_adjustedActiveItemFrame:pinActiveItem:squishActiveItem:centerExpandedItem:", 1, 0, 0);
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    -[SFUnifiedTabBarLayout _adjustedActiveItemFrame:pinActiveItem:squishActiveItem:centerExpandedItem:](self, "_adjustedActiveItemFrame:pinActiveItem:squishActiveItem:centerExpandedItem:", 0, 0, 1, v4, v6, v8, v10);
    double MinX = CGRectGetMinX(v20);
    v21.origin.double x = v12;
    v21.origin.double y = v14;
    v21.size.width = v16;
    v21.size.height = v18;
    self->_offsetForCenteringExpandedItem = MinX - CGRectGetMinX(v21);
  }
}

- (void)enumerateLayoutForItemsAtIndexes:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v24 = *MEMORY[0x1E4F1DB20];
    long long v25 = v8;
    [(SFUnifiedTabBarLayout *)self _pinnedActiveItemOffsetSquishingActiveItem:1 activeItemFrame:&v24];
    uint64_t v10 = v9;
    [(SFUnifiedTabBarLayout *)self _contentArea];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__SFUnifiedTabBarLayout_enumerateLayoutForItemsAtIndexes_usingBlock___block_invoke;
    v15[3] = &unk_1E54EAF68;
    uint64_t v17 = v11;
    uint64_t v18 = v12;
    uint64_t v19 = v13;
    uint64_t v20 = v14;
    v15[4] = self;
    uint64_t v21 = v10;
    long long v22 = v24;
    long long v23 = v25;
    id v16 = v7;
    [(SFUnifiedTabBarLayout *)self _enumerateFramesForItemsAtIndexes:v6 pinActiveItem:1 usingBlock:v15];
  }
}

void __69__SFUnifiedTabBarLayout_enumerateLayoutForItemsAtIndexes_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13 = a2;
  *(_DWORD *)((char *)v77 + 3) = 0;
  v77[0] = 0;
  double v14 = _SFFlipRectInCoordinateSpace(*(unsigned char *)(*(void *)(a1 + 32) + 16), a4, a5, a6, a7, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [*(id *)(a1 + 32) _zPositionForItem:v13];
  uint64_t v22 = v21;
  long long v23 = *(unsigned char **)(a1 + 32);
  if (v23[192])
  {
    objc_msgSend(v23, "_slideFrame:forItemAtIndex:pinnedActiveItemOffset:", a3, v14, v16, v18, v20, *(double *)(a1 + 80));
    double v14 = v24;
    double v16 = v25;
    double v18 = v26;
    double v20 = v27;
    long long v23 = *(unsigned char **)(a1 + 32);
  }
  *(double *)v62 = v14;
  *(double *)&v62[1] = v16;
  *(double *)&v62[2] = v18;
  *(double *)&v62[3] = v20;
  __asm { FMOV            V0.2D, #1.0 }
  long long v63 = _Q0;
  uint64_t v64 = v22;
  char v65 = 1;
  memset(v66, 0, sizeof(v66));
  objc_msgSend(v23, "_scrollSlowingLayoutInfoForItemAtIndex:withLayoutInfo:activeItemFrame:", a3, v62, *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  CGFloat v33 = v67;
  CGFloat v34 = v68;
  CGFloat v35 = v69;
  CGFloat v36 = v70;
  double v38 = v71;
  double v37 = v72;
  uint64_t v39 = v73;
  char v40 = v74;
  double v41 = v76;
  uint64_t v42 = *(void *)(a1 + 32);
  v77[0] = *(_DWORD *)v75;
  *(_DWORD *)((char *)v77 + 3) = *(_DWORD *)&v75[3];
  id v43 = [*(id *)(v42 + 224) activeItem];
  if (v43 == v13)
  {
    char v45 = [*(id *)(*(void *)(a1 + 32) + 224) revealsSquishedActiveItem];

    uint64_t v44 = *(void *)(a1 + 32);
    if ((v45 & 1) == 0) {
      double v41 = *(double *)(v44 + 104) - *(double *)(v44 + 120);
    }
  }
  else
  {

    uint64_t v44 = *(void *)(a1 + 32);
  }
  int v46 = [*(id *)(v44 + 224) activeItemIsExpanded];
  uint64_t v47 = *(void *)(a1 + 32);
  if (v46 && !*(unsigned char *)(v47 + 216) && !*(unsigned char *)(v47 + 192))
  {
    id v48 = [*(id *)(v47 + 224) activeItem];

    uint64_t v47 = *(void *)(a1 + 32);
    if (v48 == v13)
    {
      [(id)v47 _safeArea];
      CGFloat v33 = v49;
      CGFloat v34 = v50;
      CGFloat v35 = v51;
      CGFloat v36 = v52;
      uint64_t v47 = *(void *)(a1 + 32);
    }
    else
    {
      double v37 = v37 * *(double *)(v47 + 160);
      double v38 = 0.0;
    }
  }
  CGFloat v53 = _SFFlipRectInCoordinateSpace(*(unsigned char *)(v47 + 16), v33, v34, v35, v36, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  _ZF = [v13 isDragging] == 0;
  v60 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  double v61 = v38 * 0.5;
  if (_ZF) {
    double v61 = v38;
  }
  double v67 = v53;
  double v68 = v55;
  double v69 = v57;
  double v70 = v59;
  double v71 = v61;
  double v72 = v37;
  uint64_t v73 = v39;
  char v74 = v40;
  *(_DWORD *)v75 = v77[0];
  *(_DWORD *)&v75[3] = *(_DWORD *)((char *)v77 + 3);
  double v76 = v41;
  v60();
}

- (void)enumerateInitialLayoutForAppearingItemsAtIndexes:(id)a3 withDistanceToScroll:(double)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(SFUnifiedTabBarLayout *)self _activeItemPinnableArea];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __106__SFUnifiedTabBarLayout_enumerateInitialLayoutForAppearingItemsAtIndexes_withDistanceToScroll_usingBlock___block_invoke;
  v16[3] = &unk_1E54EAF90;
  double v19 = a4;
  double v20 = v10;
  uint64_t v21 = v11;
  uint64_t v22 = v12;
  uint64_t v23 = v13;
  double v24 = v10 + a4;
  uint64_t v25 = v11;
  uint64_t v26 = v12;
  uint64_t v27 = v13;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  [(SFUnifiedTabBarLayout *)self _enumerateFramesForItemsAtIndexes:v15 pinActiveItem:0 usingBlock:v16];
}

void __106__SFUnifiedTabBarLayout_enumerateInitialLayoutForAppearingItemsAtIndexes_withDistanceToScroll_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13 = a2;
  double v14 = a4 - *(double *)(a1 + 56);
  int v15 = [*(id *)(a1 + 32) _itemAtIndexIsPinned:a3];
  id v16 = [*(id *)(*(void *)(a1 + 32) + 224) activeItem];

  if (v16 != v13 || (v15 & 1) != 0)
  {
    CGFloat v22 = a7;
    CGFloat v20 = a6;
    CGFloat v18 = a5;
    if (v15) {
      goto LABEL_16;
    }
  }
  else
  {
    double v14 = pinFrame(v14, a5, a6, a7, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88));
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    a4 = pinFrame(a4, a5, a6, a7, *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 104), *(CGFloat *)(a1 + 112), *(CGFloat *)(a1 + 120));
    a5 = v23;
    a6 = v24;
    a7 = v25;
    if (v15) {
      goto LABEL_16;
    }
  }
  char v26 = [v13 isDragging];
  uint64_t v27 = *(void *)(a1 + 32);
  if ((v26 & 1) == 0)
  {
    if (*(unsigned char *)(v27 + 17))
    {
      char v28 = [(id)v27 isCurrentlyScrollable];
      uint64_t v27 = *(void *)(a1 + 32);
      if ((v28 & 1) == 0)
      {
        double v29 = [*(id *)(v27 + 224) items];
        if ([v29 count] - 1 == a3)
        {
          uint64_t v30 = [*(id *)(a1 + 40) count];

          uint64_t v27 = *(void *)(a1 + 32);
          if (v30 == 1)
          {
            int v31 = *(unsigned __int8 *)(v27 + 16);
            [(id)v27 _safeArea];
            if (v31) {
              CGRectGetMinX(*(CGRect *)&v32);
            }
            else {
              CGRectGetMaxX(*(CGRect *)&v32);
            }
            goto LABEL_16;
          }
        }
        else
        {

          uint64_t v27 = *(void *)(a1 + 32);
        }
      }
    }
    if (!*(unsigned char *)(v27 + 16))
    {
      v36.origin.double x = v14;
      v36.origin.double y = v18;
      v36.size.width = v20;
      v36.size.height = v22;
      CGRectGetWidth(v36);
    }
  }
LABEL_16:
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 48) + 16))(a4, a5, a6, a7);
}

- (void)enumerateFinalLayoutForDisappearingItemsAtIndexes:(id)a3 withDistanceScrolled:(double)a4 usingBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(SFUnifiedTabBarLayout *)self _activeItemPinnableArea];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __107__SFUnifiedTabBarLayout_enumerateFinalLayoutForDisappearingItemsAtIndexes_withDistanceScrolled_usingBlock___block_invoke;
  v15[3] = &unk_1E54EAFB8;
  double v17 = v10 - a4;
  uint64_t v18 = v11;
  uint64_t v19 = v12;
  uint64_t v20 = v13;
  double v21 = a4;
  v15[4] = self;
  id v16 = v8;
  id v14 = v8;
  [(SFUnifiedTabBarLayout *)self _enumerateFramesForItemsAtIndexes:v9 pinActiveItem:0 usingBlock:v15];
}

void __107__SFUnifiedTabBarLayout_enumerateFinalLayoutForDisappearingItemsAtIndexes_withDistanceScrolled_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13 = a2;
  char v14 = [*(id *)(a1 + 32) _itemAtIndexIsPinned:a3];
  id v15 = [*(id *)(*(void *)(a1 + 32) + 224) activeItem];

  if (v15 == v13 && (v14 & 1) == 0) {
    pinFrame(a4, a5, a6, a7, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72));
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_enumerateFramesForItemsAtIndexes:(id)a3 pinActiveItem:(BOOL)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 count])
  {
    double v10 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "lastIndex") + 1);
    [(SFUnifiedTabBarLayout *)self _contentArea];
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    v33[0] = 0;
    v33[1] = v33;
    double v19 = self->_leadingItemOffset + self->_offsetForCenteringExpandedItem;
    v33[2] = 0x2020000000;
    *(double *)&v33[3] = v19;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    CGFloat MinX = 0.0;
    [(SFUnifiedTabBarLayout *)self _safeArea];
    CGFloat MinX = CGRectGetMinX(v34);
    uint64_t v20 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement items];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __84__SFUnifiedTabBarLayout__enumerateFramesForItemsAtIndexes_pinActiveItem_usingBlock___block_invoke;
    v21[3] = &unk_1E54EAFE0;
    v21[4] = self;
    double v24 = v31;
    double v25 = v33;
    BOOL v30 = a4;
    uint64_t v26 = v12;
    uint64_t v27 = v14;
    uint64_t v28 = v16;
    uint64_t v29 = v18;
    id v22 = v8;
    id v23 = v9;
    [v20 enumerateObjectsAtIndexes:v10 options:0 usingBlock:v21];

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v33, 8);
  }
}

void __84__SFUnifiedTabBarLayout__enumerateFramesForItemsAtIndexes_pinActiveItem_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v31 = a2;
  int v5 = [*(id *)(a1 + 32) _itemAtIndexIsPinned:a3];
  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    double v7 = *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    [v6 _widthForItem:v31];
    double v9 = v8;
    [*(id *)(a1 + 32) _spacingAfterItem:v31];
    double v11 = v9 + v10;
    uint64_t v12 = *(void *)(a1 + 56);
  }
  else
  {
    double v7 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    [v6 _widthForItem:v31];
    double v14 = v13;
    [*(id *)(a1 + 32) _spacingAfterItem:v31];
    double v11 = v14 + v15;
    uint64_t v12 = *(void *)(a1 + 64);
  }
  *(double *)(*(void *)(v12 + 8) + 24) = v11 + *(double *)(*(void *)(v12 + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "_frameForItem:withOffset:pinActiveItem:squishActiveItem:centerExpandedItem:", v31, *(unsigned __int8 *)(a1 + 104), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 224), "revealsSquishedActiveItem") ^ 1, 1, v7);
  CGFloat v20 = _SFFlipRectInCoordinateSpace(*(unsigned char *)(*(void *)(a1 + 32) + 16), v16, v17, v18, v19, *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96));
  double v24 = SFFloorRectToPixels(v20, v21, v22, v23);
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  if ([*(id *)(a1 + 40) containsIndex:a3]) {
    (*(void (**)(double, double, double, double))(*(void *)(a1 + 48) + 16))(v24, v26, v28, v30);
  }
}

- (CGRect)_unpinnedFrameForItemAtIndex:(unint64_t)a3
{
  int v5 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement items];
  id v6 = [v5 objectAtIndexedSubscript:a3];

  [(SFUnifiedTabBarLayout *)self _offsetForItemAtIndex:a3];
  -[SFUnifiedTabBarLayout _frameForItem:withOffset:pinActiveItem:squishActiveItem:centerExpandedItem:](self, "_frameForItem:withOffset:pinActiveItem:squishActiveItem:centerExpandedItem:", v6, 0, 0, 0);
  double v11 = SFFloorRectToPixels(v7, v8, v9, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGRect)_frameForItem:(id)a3 withOffset:(double)a4 pinActiveItem:(BOOL)a5 squishActiveItem:(BOOL)a6 centerExpandedItem:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  [(SFUnifiedTabBarLayout *)self _widthForItem:v12];
  double v14 = v13;
  [(SFUnifiedBarMetrics *)self->_barMetrics itemHeight];
  double v16 = v15;
  id v17 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];

  double v18 = 0.0;
  if (v17 == v12)
  {
    -[SFUnifiedTabBarLayout _adjustedActiveItemFrame:pinActiveItem:squishActiveItem:centerExpandedItem:](self, "_adjustedActiveItemFrame:pinActiveItem:squishActiveItem:centerExpandedItem:", v9, v8, v7, a4, 0.0, v14, v16);
    a4 = v19;
    double v14 = v20;
    double v16 = v21;
  }
  double v22 = a4;
  double v23 = v14;
  double v24 = v16;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.double y = v18;
  result.origin.double x = v22;
  return result;
}

- (double)_pinnedActiveItemOffsetSquishingActiveItem:(BOOL)a3 activeItemFrame:(CGRect *)a4
{
  BOOL v5 = a3;
  uint64_t v7 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];
  double v8 = 0.0;
  if (v7)
  {
    BOOL v9 = (void *)v7;
    BOOL v10 = [(SFUnifiedTabBarLayout *)self _activeItemIsPinned];

    if (!v10)
    {
      [(SFUnifiedTabBarLayout *)self _unpinnedFrameForItemAtIndex:[(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIndex]];
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      -[SFUnifiedTabBarLayout _adjustedActiveItemFrame:pinActiveItem:squishActiveItem:centerExpandedItem:](self, "_adjustedActiveItemFrame:pinActiveItem:squishActiveItem:centerExpandedItem:", 1, v5, 1);
      if (a4)
      {
        a4->origin.double x = v19;
        a4->origin.double y = v20;
        a4->size.width = v21;
        a4->size.height = v22;
      }
      double MinX = CGRectGetMinX(*(CGRect *)&v19);
      v25.origin.double x = v12;
      v25.origin.double y = v14;
      v25.size.width = v16;
      v25.size.height = v18;
      return MinX - CGRectGetMinX(v25);
    }
  }
  return v8;
}

- (CGRect)_adjustedActiveItemFrame:(CGRect)a3 pinActiveItem:(BOOL)a4 squishActiveItem:(BOOL)a5 centerExpandedItem:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  if (![(SFUnifiedTabBarLayout *)self _activeItemIsPinned])
  {
    if (v6 && self->_expandedItemIsCentered)
    {
      [(SFUnifiedTabBarLayout *)self _midpointForCenteredContentInScrollView];
      double v15 = v14;
      v27.origin.double x = x;
      v27.origin.CGFloat y = y;
      v27.size.CGFloat width = width;
      v27.size.CGFloat height = height;
      double x = x + v15 - CGRectGetMidX(v27);
    }
    else if (v8)
    {
      if (v7) {
        CGFloat width = self->_squishedActiveItemWidth;
      }
      [(SFUnifiedTabBarLayout *)self _activeItemPinnableArea];
      double x = pinFrame(x, y, width, height, v16, v17, v18, v19);
      CGFloat y = v20;
      CGFloat width = v21;
      CGFloat height = v22;
    }
  }
  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.double x = v23;
  return result;
}

- (double)_distanceToEdgeForItemAtIndex:(unint64_t)a3 withFrame:(CGRect)a4 activeItemFrame:(CGRect)a5 occludedEdge:(unint64_t *)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v53 = a4.size.width;
  CGFloat v54 = a4.size.height;
  CGFloat v11 = a4.origin.y;
  CGFloat v12 = a4.origin.x;
  if ([(SFUnifiedTabBarLayout *)self _activeItemIsPinned])
  {
    double v15 = 0;
  }
  else
  {
    double v15 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];
  }
  unint64_t v16 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIndex];
  double v17 = 0.0;
  if (v16 != a3)
  {
    unint64_t v18 = v16;
    uint64_t v60 = 0;
    double v61 = (double *)&v60;
    double scrollSlowingInset = self->_scrollSlowingInset;
    uint64_t v62 = 0x2020000000;
    double v63 = scrollSlowingInset;
    uint64_t v56 = 0;
    double v57 = &v56;
    uint64_t v58 = 0x2020000000;
    uint64_t v59 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __94__SFUnifiedTabBarLayout__distanceToEdgeForItemAtIndex_withFrame_activeItemFrame_occludedEdge___block_invoke;
    aBlock[3] = &unk_1E54EB008;
    aBlock[4] = self;
    aBlock[5] = &v60;
    aBlock[6] = &v56;
    double v20 = (uint64_t (**)(void *, uint64_t, BOOL, __n128))_Block_copy(aBlock);
    if (v15 && v18 > a3)
    {
      v64.origin.CGFloat x = x;
      v64.origin.CGFloat y = y;
      v64.size.CGFloat width = width;
      v64.size.CGFloat height = height;
      double MinX = CGRectGetMinX(v64);
      v65.origin.CGFloat x = v12;
      v65.origin.CGFloat y = v11;
      v65.size.CGFloat width = v53;
      v65.size.CGFloat height = v54;
      double MaxX = CGRectGetMaxX(v65);
      [(SFUnifiedTabBarLayout *)self _spacingBeforeItem:v15];
      v24.n128_f64[0] = MinX - MaxX - v23;
      char v25 = v20[2](v20, 1, v18 - 1 == a3, v24);
      char v26 = 0;
    }
    else
    {
      char v25 = 0;
      char v26 = 0;
      if (v15 && v18 < a3)
      {
        v66.origin.CGFloat x = v12;
        v66.origin.CGFloat y = v11;
        v66.size.CGFloat width = v53;
        v66.size.CGFloat height = v54;
        double v27 = CGRectGetMinX(v66);
        v67.origin.CGFloat x = x;
        v67.origin.CGFloat y = y;
        v67.size.CGFloat width = width;
        v67.size.CGFloat height = height;
        double v28 = CGRectGetMaxX(v67);
        [(SFUnifiedTabBarLayout *)self _spacingAfterItem:v15];
        v30.n128_f64[0] = v27 - v28 - v29;
        char v26 = v20[2](v20, 0, v18 + 1 == a3, v30);
        char v25 = 0;
      }
    }
    id v31 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement items];
    uint64_t v32 = [v31 objectAtIndexedSubscript:a3];

    [(SFUnifiedTabBarLayout *)self _unpinnedItemSafeArea];
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    BOOL v41 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement allowsScrollingPinnedItems];
    itemArrangement = self->_itemArrangement;
    if (v41) {
      [(SFUnifiedTabBarItemArrangement *)itemArrangement items];
    }
    else {
    id v43 = [(SFUnifiedTabBarItemArrangement *)itemArrangement unpinnedItems];
    }
    if ((v26 & 1) == 0)
    {
      v68.origin.CGFloat x = v12;
      v68.origin.CGFloat y = v11;
      v68.size.CGFloat width = v53;
      v68.size.CGFloat height = v54;
      double v44 = CGRectGetMinX(v68);
      v69.origin.CGFloat x = v34;
      v69.origin.CGFloat y = v36;
      v69.size.CGFloat width = v38;
      v69.size.CGFloat height = v40;
      double v45 = CGRectGetMinX(v69);
      int v46 = [v43 firstObject];
      BOOL v47 = v32 == v46;

      ((void (*)(uint64_t (**)(void *, uint64_t, BOOL, __n128), void, BOOL, double))v20[2])(v20, 0, v47, v44 - v45);
    }
    if ((v25 & 1) == 0)
    {
      v70.origin.CGFloat x = v34;
      v70.origin.CGFloat y = v36;
      v70.size.CGFloat width = v38;
      v70.size.CGFloat height = v40;
      double v48 = CGRectGetMaxX(v70);
      v71.origin.CGFloat x = v12;
      v71.origin.CGFloat y = v11;
      v71.size.CGFloat width = v53;
      v71.size.CGFloat height = v54;
      double v49 = CGRectGetMaxX(v71);
      double v50 = [v43 lastObject];
      BOOL v51 = v32 == v50;

      ((void (*)(uint64_t (**)(void *, uint64_t, BOOL, __n128), uint64_t, BOOL, double))v20[2])(v20, 1, v51, v48 - v49);
    }
    if (a6) {
      *a6 = v57[3];
    }
    double v17 = v61[3];

    _Block_object_dispose(&v56, 8);
    _Block_object_dispose(&v60, 8);
  }

  return v17;
}

BOOL __94__SFUnifiedTabBarLayout__distanceToEdgeForItemAtIndex_withFrame_activeItemFrame_occludedEdge___block_invoke(void *a1, uint64_t a2, char a3, double a4)
{
  double v4 = 0.0;
  if ((a3 & 1) == 0) {
    double v4 = *(double *)(a1[4] + 168);
  }
  if (v4 > a4)
  {
    *(double *)(*(void *)(a1[5] + 8) + 24) = a4;
    *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
  }
  return v4 > a4;
}

- (CGRect)_slideFrame:(CGRect)a3 forItemAtIndex:(unint64_t)a4 pinnedActiveItemOffset:(double)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  if ([(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIndex] > a4)
  {
    double v12 = fmax(a5, 0.0);
LABEL_5:
    double x = x + v12;
    goto LABEL_6;
  }
  if ([(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIndex] < a4)
  {
    double v12 = fmin(a5, 0.0);
    goto LABEL_5;
  }
LABEL_6:
  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.double x = v13;
  return result;
}

- ($174D3796E742295BF8F26947D44880BB)_scrollSlowingLayoutInfoForItemAtIndex:(SEL)a3 withLayoutInfo:(unint64_t)a4 activeItemFrame:(id *)a5
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  CGRect result = ($174D3796E742295BF8F26947D44880BB *)-[SFUnifiedTabBarLayout _itemAtIndexIsPinned:](self, "_itemAtIndexIsPinned:");
  if (result)
  {
    long long v15 = *(_OWORD *)&a5->var3;
    *(_OWORD *)&retstr->var1 = *(_OWORD *)&a5->var1;
    *(_OWORD *)&retstr->var3 = v15;
    retstr->var6 = a5->var6;
    CGSize size = a5->var0.size;
    retstr->var0.origin = a5->var0.origin;
    retstr->var0.CGSize size = size;
    return result;
  }
  if ([(SFUnifiedTabBarLayout *)self _activeItemIsPinned])
  {
    double v17 = 0;
  }
  else
  {
    double v17 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];
  }
  unint64_t v18 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIndex];
  if (v18 != a4)
  {
    double v19 = a5->var0.origin.x;
    double rect = a5->var0.origin.y;
    double v20 = a5->var0.size.width;
    double v21 = a5->var0.size.height;
    if (v17 && v18 + 1 == a4)
    {
      v53.origin.double x = x;
      v53.origin.double y = y;
      v53.size.double width = width;
      v53.size.double height = height;
      double MaxX = CGRectGetMaxX(v53);
      [(SFUnifiedTabBarLayout *)self _spacingAfterItem:v17];
      double v19 = fmin(v19, MaxX + v23);
    }
    else if (v17 && v18 - 1 == a4)
    {
      v54.origin.double x = x;
      v54.origin.double y = y;
      v54.size.double width = width;
      v54.size.double height = height;
      double MinX = CGRectGetMinX(v54);
      v55.origin.double x = v19;
      v55.origin.double y = rect;
      v55.size.double width = v20;
      v55.size.double height = v21;
      double v25 = MinX - CGRectGetWidth(v55);
      [(SFUnifiedTabBarLayout *)self _spacingBeforeItem:v17];
      double v19 = fmax(v19, v25 - v26);
    }
    uint64_t v52 = 0;
    -[SFUnifiedTabBarLayout _distanceToEdgeForItemAtIndex:withFrame:activeItemFrame:occludedEdge:](self, "_distanceToEdgeForItemAtIndex:withFrame:activeItemFrame:occludedEdge:", a4, &v52, v19, rect, v20, v21, x, y, width, height, *(void *)&rect);
    double scrollSlowingInset = self->_scrollSlowingInset;
    if (v27 < scrollSlowingInset)
    {
      double v29 = v27;
      double v30 = _SFUninterpolate(v27, scrollSlowingInset, scrollSlowingInset * -0.570796327);
      double v31 = _SFUninterpolate(v30, 1.0, 1.57079633);
      double v32 = _SFInterpolate(1.0, 0.3, fmax(fmin(v31, 1.0), 0.0));
      if ([(SFUnifiedTabBarItemArrangement *)self->_itemArrangement allowsScrollingPinnedItems])
      {
        uint64_t v33 = 0;
      }
      else
      {
        CGFloat v36 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
        uint64_t v33 = [v36 count];
      }
      if (v33 != a4)
      {
        double v37 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement items];
        if ([v37 count] - 1 == a4
          || [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIndex] - 1 == a4
          && v52 == 1)
        {
        }
        else
        {
          BOOL v48 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIndex] + 1 == a4
             && v52 == 0;

          if (v30 < 1.0 && !v48)
          {
            double v49 = self->_scrollSlowingInset;
            double v38 = v49 - v29 + sin(v30 * -1.57079633) * v49;
            goto LABEL_26;
          }
        }
      }
      if (v29 < 0.0) {
        double v38 = -v29;
      }
      else {
        double v38 = 0.0;
      }
LABEL_26:
      if (v52 == 1)
      {
        double v19 = v19 - v38;
        double v39 = -1.0 - (double)a4;
      }
      else
      {
        double v39 = 0.0;
        if (!v52)
        {
          double v19 = v19 + v38;
          CGFloat v40 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement items];
          double v39 = -(double)([v40 count] - a4);
        }
      }
      long long v41 = *(_OWORD *)&a5->var3;
      *(_OWORD *)&retstr->var1 = *(_OWORD *)&a5->var1;
      *(_OWORD *)&retstr->var3 = v41;
      retstr->var6 = a5->var6;
      CGSize v42 = a5->var0.size;
      retstr->var0.origin = a5->var0.origin;
      retstr->var0.CGSize size = v42;
      retstr->var0.origin.double x = SFFloorRectToPixels(v19, recta, v20, v21);
      retstr->var0.origin.double y = v43;
      retstr->var0.size.double width = v44;
      retstr->var0.size.double height = v45;
      retstr->var1 = v32 * retstr->var1;
      retstr->var3 = v39;
      retstr->var4 = v30 < 1.57079633;
      [(SFUnifiedTabBarLayout *)self _minimumHorizontalOffsetForOccludedItems];
      retstr->var5 = v38 >= v46;
      goto LABEL_31;
    }
  }
  long long v34 = *(_OWORD *)&a5->var3;
  *(_OWORD *)&retstr->var1 = *(_OWORD *)&a5->var1;
  *(_OWORD *)&retstr->var3 = v34;
  retstr->var6 = a5->var6;
  CGSize v35 = a5->var0.size;
  retstr->var0.origin = a5->var0.origin;
  retstr->var0.CGSize size = v35;
LABEL_31:

  return result;
}

- (double)_offsetForItemAtIndex:(unint64_t)a3
{
  BOOL v5 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement allowsScrollingPinnedItems];
  double leadingItemOffset = self->_leadingItemOffset;
  double offsetForCenteringExpandedItem = self->_offsetForCenteringExpandedItem;
  itemArrangement = self->_itemArrangement;
  if (v5)
  {
    BOOL v9 = [(SFUnifiedTabBarItemArrangement *)itemArrangement items];
    [(SFUnifiedTabBarLayout *)self _offsetForItemAtIndex:a3 inItems:v9];
    double v11 = v10;
  }
  else
  {
    BOOL v9 = [(SFUnifiedTabBarItemArrangement *)itemArrangement pinnedItems];
    unint64_t v12 = a3 - [v9 count];
    double v13 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement unpinnedItems];
    [(SFUnifiedTabBarLayout *)self _offsetForItemAtIndex:v12 inItems:v13];
    double v11 = v14;
  }
  return leadingItemOffset + offsetForCenteringExpandedItem + v11;
}

- (double)_offsetForPinnedItemAtIndex:(unint64_t)a3
{
  BOOL v5 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
  [(SFUnifiedTabBarLayout *)self _offsetForItemAtIndex:a3 inItems:v5];
  double v7 = v6;

  return v7;
}

- (double)_offsetForItemAtIndex:(unint64_t)a3 inItems:(id)a4
{
  id v6 = a4;
  uint64_t v10 = 0;
  double v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__SFUnifiedTabBarLayout__offsetForItemAtIndex_inItems___block_invoke;
  v9[3] = &unk_1E54EB030;
  v9[5] = &v10;
  v9[6] = a3;
  v9[4] = self;
  [v6 enumerateObjectsUsingBlock:v9];
  double v7 = v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __55__SFUnifiedTabBarLayout__offsetForItemAtIndex_inItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (*(void *)(a1 + 48) == a3)
  {
    *a4 = 1;
  }
  else
  {
    BOOL v5 = *(void **)(a1 + 32);
    id v6 = a2;
    [v5 _widthForItem:v6];
    double v8 = v7;
    [*(id *)(a1 + 32) _spacingAfterItem:v6];
    double v10 = v9;

    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8
                                                                + v10
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
  }
}

- (double)_widthForItem:(id)a3
{
  id v4 = a3;
  if (!self->_standalone)
  {
    id v5 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];

    if (v5 == v4)
    {
      uint64_t v9 = 104;
      goto LABEL_7;
    }
  }
  if (-[SFUnifiedTabBarItemArrangement allowsScrollingPinnedItems](self->_itemArrangement, "allowsScrollingPinnedItems")|| (-[SFUnifiedTabBarItemArrangement pinnedItems](self->_itemArrangement, "pinnedItems"), v6 = objc_claimAutoreleasedReturnValue(), char v7 = [v6 containsObject:v4], v6, (v7 & 1) == 0))
  {
    uint64_t v9 = 112;
LABEL_7:
    double v8 = *(double *)((char *)&self->super.isa + v9);
    goto LABEL_8;
  }
  double v8 = 36.0;
LABEL_8:

  return v8;
}

- (double)_spacingAfterItem:(id)a3
{
  id v4 = a3;
  id v5 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
  id v6 = [v5 lastObject];

  if (v6 == v4)
  {
    double itemSpacing = self->_itemSpacing;
    +[SFUnifiedBarMetrics separatorWidth];
    double v9 = v11 + itemSpacing * 2.0;
  }
  else
  {
    char v7 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement items];
    id v8 = [v7 lastObject];

    if (v8 == v4) {
      double v9 = 0.0;
    }
    else {
      double v9 = self->_itemSpacing;
    }
  }

  return v9;
}

- (double)_spacingBeforeItem:(id)a3
{
  id v4 = a3;
  id v5 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
  if ([v5 count])
  {
    id v6 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement unpinnedItems];
    id v7 = [v6 firstObject];

    if (v7 == v4)
    {
      double itemSpacing = self->_itemSpacing;
      +[SFUnifiedBarMetrics separatorWidth];
      double v10 = v9 + itemSpacing * 2.0;
      goto LABEL_8;
    }
  }
  else
  {
  }
  double v11 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement items];
  id v12 = [v11 firstObject];

  if (v12 == v4) {
    double v10 = 0.0;
  }
  else {
    double v10 = self->_itemSpacing;
  }
LABEL_8:

  return v10;
}

- (double)_zPositionForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];

  if (v5 == v4)
  {
    double v6 = 2.0;
  }
  else
  {
    double v6 = 0.0;
    if (![(SFUnifiedTabBarItemArrangement *)self->_itemArrangement allowsScrollingPinnedItems])
    {
      id v7 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
      int v8 = [v7 containsObject:v4];

      if (v8) {
        double v6 = 1.0;
      }
      else {
        double v6 = 0.0;
      }
    }
  }

  return v6;
}

- (unint64_t)indexOfCenterItem
{
  [(SFUnifiedTabBarLayout *)self _unpinnedItemSafeArea];
  UIRectGetCenter();

  return -[SFUnifiedTabBarLayout _indexOfItemClosestToPoint:passingTest:](self, "_indexOfItemClosestToPoint:passingTest:", 0);
}

- (unint64_t)maximumNumberOfVisibleItems
{
  [(SFUnifiedTabBarLayout *)self _safeArea];
  return vcvtpd_u64_f64(CGRectGetWidth(v4) / (self->_itemWidth + self->_itemSpacing));
}

- (CGRect)frameForItem:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  double v19 = (double *)&v18;
  uint64_t v20 = 0x4010000000;
  double v21 = &unk_18C77CCCE;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement allItemIndexes];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __38__SFUnifiedTabBarLayout_frameForItem___block_invoke;
  v15[3] = &unk_1E54EB058;
  id v6 = v4;
  id v16 = v6;
  double v17 = &v18;
  [(SFUnifiedTabBarLayout *)self _enumerateFramesForItemsAtIndexes:v5 pinActiveItem:1 usingBlock:v15];

  double v7 = v19[4];
  double v8 = v19[5];
  double v9 = v19[6];
  double v10 = v19[7];

  _Block_object_dispose(&v18, 8);
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

uint64_t __38__SFUnifiedTabBarLayout_frameForItem___block_invoke(uint64_t result, uint64_t a2, double a3, double a4, double a5, double a6, uint64_t a7, unsigned char *a8)
{
  if (*(void *)(result + 32) == a2)
  {
    double v8 = *(double **)(*(void *)(result + 40) + 8);
    v8[4] = a3;
    v8[5] = a4;
    v8[6] = a5;
    v8[7] = a6;
    *a8 = 1;
  }
  return result;
}

- (CGRect)frameForPreviewingItem:(id)a3 pinned:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement items];
  int v8 = [v7 containsObject:v6];

  if (v8)
  {
    [(SFUnifiedTabBarLayout *)self frameForItem:v6];
  }
  else
  {
    if (v4) {
      [(SFUnifiedTabBarLayout *)self _safeArea];
    }
    else {
      [(SFUnifiedTabBarLayout *)self _unpinnedItemSafeArea];
    }
    [(SFUnifiedTabBarLayout *)self _frameForItem:v6 withOffset:0 pinActiveItem:0 squishActiveItem:0 centerExpandedItem:CGRectGetMinX(*(CGRect *)&v13)];
  }
  double v17 = v9;
  double v18 = v10;
  itemdouble Width = v11;
  double v20 = v12;
  id v21 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];

  if (v21 != v6)
  {
    if (v4) {
      itemdouble Width = 36.0;
    }
    else {
      itemdouble Width = self->_itemWidth;
    }
  }

  double v22 = v17;
  double v23 = v18;
  double v24 = itemWidth;
  double v25 = v20;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (id)itemClosestToPoint:(CGPoint)a3 passingTest:(id)a4
{
  unint64_t v5 = -[SFUnifiedTabBarLayout _indexOfItemClosestToPoint:passingTest:](self, "_indexOfItemClosestToPoint:passingTest:", a4, a3.x, a3.y);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = 0;
  }
  else
  {
    unint64_t v7 = v5;
    int v8 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement items];
    id v6 = [v8 objectAtIndexedSubscript:v7];
  }

  return v6;
}

- (unint64_t)_indexOfItemClosestToPoint:(CGPoint)a3 passingTest:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  uint64_t v19 = 0;
  double v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0x7FEFFFFFFFFFFFFFLL;
  visibleItemIndexes = self->_visibleItemIndexes;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__SFUnifiedTabBarLayout__indexOfItemClosestToPoint_passingTest___block_invoke;
  v12[3] = &unk_1E54EB080;
  id v9 = v7;
  CGFloat v16 = x;
  CGFloat v17 = y;
  id v13 = v9;
  double v14 = &v19;
  long long v15 = v18;
  [(SFUnifiedTabBarLayout *)self _enumerateFramesForItemsAtIndexes:visibleItemIndexes pinActiveItem:0 usingBlock:v12];
  unint64_t v10 = v20[3];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);

  return v10;
}

void __64__SFUnifiedTabBarLayout__indexOfItemClosestToPoint_passingTest___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  id v15 = a2;
  uint64_t v16 = *(void *)(a1 + 32);
  id v21 = v15;
  if (!v16 || (int v17 = (*(uint64_t (**)(uint64_t, id))(v16 + 16))(v16, v15), v18 = v21, v17))
  {
    v23.origin.CGFloat x = a5;
    v23.origin.CGFloat y = a6;
    v23.size.double width = a7;
    v23.size.double height = a8;
    if (CGRectContainsPoint(v23, *(CGPoint *)(a1 + 56)))
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }
    v24.origin.CGFloat x = a5;
    v24.origin.CGFloat y = a6;
    v24.size.double width = a7;
    v24.size.double height = a8;
    double v19 = vabdd_f64(*(double *)(a1 + 56), CGRectGetMinX(v24));
    v25.origin.CGFloat x = a5;
    v25.origin.CGFloat y = a6;
    v25.size.double width = a7;
    v25.size.double height = a8;
    double v20 = fmin(v19, vabdd_f64(*(double *)(a1 + 56), CGRectGetMaxX(v25)));
    if (v20 >= *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      *a4 = 1;
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v20;
    }
    double v18 = v21;
  }
}

- (id)itemAtPoint:(CGPoint)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  double v11 = __Block_byref_object_copy__2;
  double v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  visibleItemIndexes = self->_visibleItemIndexes;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__SFUnifiedTabBarLayout_itemAtPoint___block_invoke;
  v6[3] = &unk_1E54EB0A8;
  CGPoint v7 = a3;
  v6[4] = self;
  v6[5] = &v8;
  [(SFUnifiedTabBarLayout *)self _enumerateFramesForItemsAtIndexes:visibleItemIndexes pinActiveItem:1 usingBlock:v6];
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __37__SFUnifiedTabBarLayout_itemAtPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v16 = a2;
  v18.origin.CGFloat x = a4;
  v18.origin.CGFloat y = a5;
  v18.size.double width = a6;
  v18.size.double height = a7;
  if (CGRectContainsPoint(v18, *(CGPoint *)(a1 + 48))
    && ([*(id *)(*(void *)(a1 + 32) + 184) containsIndex:a3] & 1) == 0)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(void *)(v14 + 40))
    {
      id v15 = [*(id *)(*(void *)(a1 + 32) + 224) activeItem];

      if (v15 != v16) {
        goto LABEL_7;
      }
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    }
    objc_storeStrong((id *)(v14 + 40), a2);
  }
LABEL_7:
}

- (CGPoint)contentOffsetForScrollingToItemAtIndex:(unint64_t)a3
{
  if (-[SFUnifiedTabBarLayout _itemAtIndexIsPinned:](self, "_itemAtIndexIsPinned:"))
  {
    scrollView = self->_scrollView;
    [(UIScrollView *)scrollView contentOffset];
  }
  else
  {
    [(SFUnifiedTabBarLayout *)self _offsetForItemAtIndex:a3];
    double v9 = v8;
    uint64_t v10 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement items];
    double v11 = [v10 objectAtIndexedSubscript:a3];
    [(SFUnifiedTabBarLayout *)self _widthForItem:v11];
    double v13 = v12;

    if (self->_flipped) {
      double v9 = self->_contentSize.width - v9 - v13;
    }
    [(SFUnifiedTabBarLayout *)self _insetsForScrollingToItemAtIndex:a3];
    -[SFUnifiedTabBarLayout _contentOffsetForScrollingToRegionWithMinX:maxX:insets:](self, "_contentOffsetForScrollingToRegionWithMinX:maxX:insets:", v9, v13 + v9, v14, v15, v16, v17);
  }
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (CGPoint)contentOffsetForScrollingToDroppingItems
{
  uint64_t v13 = 0;
  double v14 = (CGRect *)&v13;
  double v16 = &unk_18C77CCCE;
  uint64_t v15 = 0x4010000000;
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v17 = *MEMORY[0x1E4F1DB20];
  long long v18 = v3;
  id v4 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement allItemIndexes];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__SFUnifiedTabBarLayout_contentOffsetForScrollingToDroppingItems__block_invoke;
  v12[3] = &unk_1E54EB0D0;
  void v12[4] = &v13;
  [(SFUnifiedTabBarLayout *)self _enumerateFramesForItemsAtIndexes:v4 pinActiveItem:0 usingBlock:v12];

  double MinX = CGRectGetMinX(v14[1]);
  -[SFUnifiedTabBarLayout _contentOffsetForScrollingToRegionWithMinX:maxX:insets:](self, "_contentOffsetForScrollingToRegionWithMinX:maxX:insets:", MinX, CGRectGetMaxX(v14[1]), *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  double v7 = v6;
  double v9 = v8;
  _Block_object_dispose(&v13, 8);
  double v10 = v7;
  double v11 = v9;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

void __65__SFUnifiedTabBarLayout_contentOffsetForScrollingToDroppingItems__block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat y, CGFloat width, CGFloat height)
{
  if ([a2 isDropping])
  {
    BOOL IsNull = CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
    double v12 = *(CGRect **)(*(void *)(a1 + 32) + 8);
    if (IsNull)
    {
      v12[1].origin.CGFloat x = a3;
    }
    else
    {
      v14.origin.CGFloat x = a3;
      v14.origin.CGFloat y = y;
      v14.size.double width = width;
      v14.size.double height = height;
      CGRect v13 = CGRectUnion(v12[1], v14);
      CGFloat y = v13.origin.y;
      double width = v13.size.width;
      double height = v13.size.height;
      double v12 = *(CGRect **)(*(void *)(a1 + 32) + 8);
      v12[1].origin.CGFloat x = v13.origin.x;
    }
    v12[1].origin.CGFloat y = y;
    v12[1].size.double width = width;
    v12[1].size.double height = height;
  }
}

- (CGPoint)_contentOffsetForScrollingToRegionWithMinX:(double)a3 maxX:(double)a4 insets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double left = a5.left;
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  double v11 = v10;
  [(SFUnifiedTabBarLayout *)self _safeArea];
  double Width = CGRectGetWidth(v17);
  [(UIScrollView *)self->_scrollView contentOffset];
  double v15 = fmin(fmax(fmax(fmin(v11 + v14, a3 - left), right + a4 - Width), 0.0), self->_contentSize.width - Width) - v11;
  result.CGFloat y = v13;
  result.CGFloat x = v15;
  return result;
}

- (UIEdgeInsets)_insetsForScrollingToItemAtIndex:(unint64_t)a3
{
  unint64_t v5 = (double *)MEMORY[0x1E4FB2848];
  if (a3) {
    double v6 = self->_itemWidth + self->_itemSpacing;
  }
  else {
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  }
  double v7 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement items];
  unint64_t v8 = [v7 count] - 1;

  if (v8 <= a3) {
    double v9 = v5[3];
  }
  else {
    double v9 = self->_itemWidth + self->_itemSpacing;
  }
  double v10 = *v5;
  double v11 = v5[2];
  unint64_t v12 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIndex];
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v13 = v12;
    if (v12 <= a3)
    {
      if (v12 < a3)
      {
        [(SFUnifiedTabBarLayout *)self _insetsForActiveItemPinnableArea];
        double v19 = v18 + self->_squishedActiveItemWidth;
        double v20 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];
        [(SFUnifiedTabBarLayout *)self _spacingAfterItem:v20];
        double v6 = v19 + v21;

        if (v13 + 1 < a3) {
          double v6 = v6 + self->_itemWidth + self->_itemSpacing;
        }
      }
    }
    else
    {
      double v14 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];
      [(SFUnifiedTabBarLayout *)self _spacingBeforeItem:v14];
      double v16 = v15 + self->_squishedActiveItemWidth;
      [(SFUnifiedTabBarLayout *)self _insetsForActiveItemPinnableArea];
      double v9 = v16 + v17;

      if (v13 - 1 > a3) {
        double v9 = v9 + self->_itemWidth + self->_itemSpacing;
      }
    }
  }
  double v22 = v10;
  double v23 = v6;
  double v24 = v11;
  double v25 = v9;
  result.double right = v25;
  result.bottom = v24;
  result.double left = v23;
  result.top = v22;
  return result;
}

- (BOOL)isCurrentlyScrollable
{
  [(SFUnifiedTabBarLayout *)self _unpinnedItemSafeArea];
  double Width = CGRectGetWidth(v5);
  return Width < _SFRoundFloatToPixels(self->_contentSize.width - (self->_activeItemWidth
                                                                 - self->_activeItemWidthWhenNotExpanded));
}

- (CGRect)pinnedItemsSeparatorFrame
{
  +[SFUnifiedBarMetrics separatorWidth];
  double v4 = v3;
  if ([(SFUnifiedTabBarItemArrangement *)self->_itemArrangement allowsScrollingPinnedItems])
  {
    CGRect v5 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
    -[SFUnifiedTabBarLayout _offsetForItemAtIndex:](self, "_offsetForItemAtIndex:", [v5 count]);
    double v7 = v6 - self->_itemSpacing - v4;

    unint64_t v8 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIndex];
    double v9 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
    uint64_t v10 = [v9 count] - 1;

    if (v8 == v10)
    {
      [(SFUnifiedTabBarLayout *)self _activeItemPinnableArea];
      double v7 = fmax(v7, CGRectGetMinX(v29) + self->_itemWidth + self->_itemSpacing);
    }
    unint64_t v11 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIndex];
    unint64_t v12 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
    uint64_t v13 = [v12 count];

    if (v11 == v13)
    {
      [(SFUnifiedTabBarLayout *)self _activeItemPinnableArea];
      double v7 = fmin(v7, CGRectGetMaxX(v30) - self->_itemWidth - self->_itemSpacing - v4);
    }
  }
  else
  {
    [(SFUnifiedTabBarLayout *)self _safeArea];
    double v7 = CGRectGetMinX(v31) + self->_pinnedItemsWidth - self->_itemSpacing - v4;
  }
  [(SFUnifiedBarMetrics *)self->_barMetrics itemHeight];
  v32.size.CGFloat height = v14;
  v32.origin.CGFloat y = 0.0;
  v32.origin.CGFloat x = v7;
  v32.size.CGFloat width = v4;
  CGRect v33 = CGRectInset(v32, 0.0, 4.0);
  CGFloat x = v33.origin.x;
  CGFloat y = v33.origin.y;
  CGFloat width = v33.size.width;
  CGFloat height = v33.size.height;
  [(SFUnifiedTabBarLayout *)self _contentArea];
  char flipped = self->_flipped;

  double v24 = _SFFlipRectInCoordinateSpace(flipped, x, y, width, height, v19, v20, v21, v22);
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (double)pinnedItemsSeparatorOpacity
{
  if ([(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIsExpanded]
    && !self->_contentIsCentered)
  {
    return 0.0;
  }
  BOOL v3 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement allowsScrollingPinnedItems];
  double result = 1.0;
  if (v3)
  {
    int64_t v5 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIndex];
    double v6 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
    uint64_t v7 = [v6 count];

    itemdouble Width = self->_itemWidth;
    [(SFUnifiedBarMetrics *)self->_barMetrics itemCornerRadius];
    double v10 = itemWidth - v9;
    double v11 = 0.0;
    if (v5 != v7 && v5 != v7 - 1) {
      double v11 = self->_itemWidth + self->_itemSpacing;
    }
    double v12 = v10 + v11;
    uint64_t v13 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement unpinnedItems];
    if (![v13 count]) {
      double v10 = 0.0;
    }

    if (v5 >= v7) {
      double v14 = v10;
    }
    else {
      double v14 = v12;
    }
    if (v5 >= v7) {
      double v15 = v12;
    }
    else {
      double v15 = v10;
    }
    [(SFUnifiedTabBarLayout *)self _safeArea];
    CGFloat v17 = v16;
    CGFloat v19 = v14 + v18;
    CGFloat v21 = v20 + 0.0;
    CGFloat v23 = v22 - (v14 + v15);
    [(SFUnifiedTabBarLayout *)self pinnedItemsSeparatorFrame];
    v25.origin.CGFloat x = v19;
    v25.origin.CGFloat y = v21;
    v25.size.CGFloat width = v23;
    v25.size.CGFloat height = v17;
    return (double)CGRectIntersectsRect(v24, v25);
  }
  return result;
}

- (CGRect)pinnedItemDropArea
{
  [(UIScrollView *)self->_scrollView bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  double v10 = v9 + self->_pinnedItemsWidth + self->_itemWidth * 0.33;
  [(SFUnifiedTabBarLayout *)self _contentArea];
  char flipped = self->_flipped;

  double v16 = _SFFlipRectInCoordinateSpace(flipped, v4, v6, v10, v8, v11, v12, v13, v14);
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (UIEdgeInsets)autoScrollTouchInsets
{
  double v2 = -self->_scrollSlowingInset;
  pinnedItemsdouble Width = self->_pinnedItemsWidth;
  double v4 = v2 - pinnedItemsWidth;
  if (self->_flipped) {
    double v5 = -self->_scrollSlowingInset;
  }
  else {
    double v5 = v2 - pinnedItemsWidth;
  }
  if (self->_flipped) {
    double v6 = v4;
  }
  else {
    double v6 = -self->_scrollSlowingInset;
  }
  double v7 = 0.0;
  double v8 = 0.0;
  result.double right = v6;
  result.bottom = v8;
  result.double left = v5;
  result.top = v7;
  return result;
}

+ (unint64_t)pinnedItemLimitForItemArrangement:(id)a3 tabBarWidth:(double)a4 barMetrics:(id)a5 standalone:(BOOL)a6
{
  BOOL v7 = a6;
  id v10 = a3;
  id v11 = a5;
  CGFloat v12 = [v10 unpinnedItems];
  unint64_t v13 = [v12 count];
  if (v13 >= 2)
  {
    double v6 = [v10 unpinnedItems];
    double v14 = 3.5;
    if ((unint64_t)[v6 count] > 3) {
      goto LABEL_6;
    }
  }
  double v15 = [v10 unpinnedItems];
  double v14 = 1.0;
  if ((unint64_t)[v15 count] >= 2)
  {
    double v16 = [v10 unpinnedItems];
    double v14 = (double)(unint64_t)[v16 count];
  }
  if (v13 >= 2) {
LABEL_6:
  }

  if (v7) {
    [v11 minimumInactiveItemWidth];
  }
  else {
    [v11 minimumActiveItemWidth];
  }
  double v18 = v17;
  [v11 minimumInactiveItemWidth];
  double v20 = v19;
  [v11 minimumItemSpacing];
  double v22 = v21;
  double v23 = v18 + v20 * v14 + v21 * (v14 + 1.0);
  +[SFUnifiedBarMetrics separatorWidth];
  unint64_t v25 = (unint64_t)fmax((a4 - (v23 + v24)) / (v22 + 36.0) + -2.0, 1.0);

  return v25;
}

- (BOOL)_activeItemIsPinned
{
  double v3 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItem];
  if (v3) {
    BOOL v4 = [(SFUnifiedTabBarLayout *)self _itemAtIndexIsPinned:[(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIndex]];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_itemAtIndexIsPinned:(unint64_t)a3
{
  if ([(SFUnifiedTabBarItemArrangement *)self->_itemArrangement allowsScrollingPinnedItems])
  {
    return 0;
  }
  double v6 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
  BOOL v5 = [v6 count] > a3;

  return v5;
}

- (NSIndexSet)visibleItemIndexes
{
  double v2 = (void *)[(NSMutableIndexSet *)self->_visibleItemIndexes copy];

  return (NSIndexSet *)v2;
}

- (NSArray)visibleItems
{
  double v3 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement items];
  BOOL v4 = [v3 objectsAtIndexes:self->_visibleItemIndexes];

  return (NSArray *)v4;
}

- (void)setItemAtIndex:(unint64_t)a3 isVisible:(BOOL)a4
{
  visibleItemIndexes = self->_visibleItemIndexes;
  if (a4) {
    [(NSMutableIndexSet *)visibleItemIndexes addIndex:a3];
  }
  else {
    [(NSMutableIndexSet *)visibleItemIndexes removeIndex:a3];
  }
}

- (void)setItemAtIndex:(unint64_t)a3 isOccluded:(BOOL)a4
{
  occludedItemIndexes = self->_occludedItemIndexes;
  if (a4) {
    [(NSMutableIndexSet *)occludedItemIndexes addIndex:a3];
  }
  else {
    [(NSMutableIndexSet *)occludedItemIndexes removeIndex:a3];
  }
}

- (id)indexesOfItemsVisibleInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement items];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    if (self->_expandedItemIsCentered)
    {
      [(SFUnifiedTabBarLayout *)self _pinnedActiveItemOffsetSquishingActiveItem:0 activeItemFrame:0];
      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v11 = 0;
    }
    unint64_t v13 = [MEMORY[0x1E4F28E60] indexSet];
    unint64_t v14 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIndex];
    if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
      [v13 addIndex:v14];
    }
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    CGRect v31 = CGRectInset(v30, self->_scrollSlowingInset * -1.57079633, 0.0);
    CGFloat v15 = v31.origin.x;
    CGFloat v16 = v31.origin.y;
    CGFloat v17 = v31.size.width;
    CGFloat v18 = v31.size.height;
    double v19 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement allItemIndexes];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __53__SFUnifiedTabBarLayout_indexesOfItemsVisibleInRect___block_invoke;
    v22[3] = &unk_1E54EB0F8;
    uint64_t v24 = v11;
    CGFloat v25 = v15;
    CGFloat v26 = v16;
    CGFloat v27 = v17;
    CGFloat v28 = v18;
    v22[4] = self;
    id v23 = v13;
    id v20 = v13;
    [(SFUnifiedTabBarLayout *)self _enumerateFramesForItemsAtIndexes:v19 pinActiveItem:0 usingBlock:v22];

    CGFloat v12 = (void *)[v20 copy];
  }
  else
  {
    CGFloat v12 = [MEMORY[0x1E4F28D60] indexSet];
  }

  return v12;
}

void __53__SFUnifiedTabBarLayout_indexesOfItemsVisibleInRect___block_invoke(uint64_t a1, void *a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v18 = a2;
  unint64_t v13 = *(unsigned char **)(a1 + 32);
  if (v13[192])
  {
    objc_msgSend(v13, "_slideFrame:forItemAtIndex:pinnedActiveItemOffset:", a3, a4, a5, a6, a7, *(double *)(a1 + 48));
    a4 = v14;
    a5 = v15;
    a6 = v16;
    a7 = v17;
  }
  v20.origin.CGFloat x = a4;
  v20.origin.CGFloat y = a5;
  v20.size.CGFloat width = a6;
  v20.size.CGFloat height = a7;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 56), v20)) {
    [*(id *)(a1 + 40) addIndex:a3];
  }
}

- (id)itemsVisibleInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement items];
  uint64_t v10 = -[SFUnifiedTabBarLayout indexesOfItemsVisibleInRect:](self, "indexesOfItemsVisibleInRect:", x, y, width, height);
  uint64_t v11 = [v9 objectsAtIndexes:v10];
  CGFloat v12 = [v8 setWithArray:v11];

  return v12;
}

- (CGRect)_safeArea
{
  if (CGRectIsNull(self->_visibleRectOverride))
  {
    [(UIScrollView *)self->_scrollView bounds];
    double x = v3;
    double y = v5;
    double width = v7;
    double height = v9;
  }
  else
  {
    double x = self->_visibleRectOverride.origin.x;
    double y = self->_visibleRectOverride.origin.y;
    double width = self->_visibleRectOverride.size.width;
    double height = self->_visibleRectOverride.size.height;
  }
  [(UIScrollView *)self->_scrollView adjustedContentInset];
  double v12 = x + v11;
  double v14 = y + v13;
  double v16 = width - (v11 + v15);
  double v18 = height - (v13 + v17);
  [(SFUnifiedTabBarLayout *)self _contentArea];
  char flipped = self->_flipped;

  double v24 = _SFFlipRectInCoordinateSpace(flipped, v12, v14, v16, v18, v19, v20, v21, v22);
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (CGRect)_unpinnedItemSafeArea
{
  [(SFUnifiedTabBarLayout *)self _safeArea];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  UIEdgeInsetsMakeWithEdges();
  double v11 = v5 + v10;
  double v14 = v7 - (v12 + v13);
  double v16 = v9 - (v10 + v15);
  double v17 = v3 + v12;
  double v18 = v11;
  double v19 = v14;
  result.size.double height = v16;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGRect)_activeItemPinnableArea
{
  [(SFUnifiedTabBarLayout *)self _unpinnedItemSafeArea];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SFUnifiedTabBarLayout *)self _insetsForActiveItemPinnableArea];
  double v12 = v6 + v11;
  double v15 = v8 - (v13 + v14);
  double v17 = v10 - (v11 + v16);
  double v18 = v4 + v13;
  double v19 = v12;
  double v20 = v15;
  result.size.double height = v17;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGRect)_contentArea
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (UIEdgeInsets)_insetsForActiveItemPinnableArea
{
  if ([(SFUnifiedTabBarLayout *)self _activeItemIsPinned]
    || (unint64_t v3 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement activeItemIndex],
        v3 == 0x7FFFFFFFFFFFFFFFLL))
  {
    double v4 = *MEMORY[0x1E4FB2848];
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    unint64_t v8 = v3;
    [(SFUnifiedTabBarLayout *)self _insetToRevealNextItem];
    double v10 = v9;
    double v11 = (double *)MEMORY[0x1E4FB2848];
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    if ([(SFUnifiedTabBarItemArrangement *)self->_itemArrangement allowsScrollingPinnedItems])
    {
      unint64_t v13 = 0;
    }
    else
    {
      double v14 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
      unint64_t v13 = [v14 count];
    }
    double v4 = *v11;
    double v7 = v11[2];
    if (v8 > v13) {
      double v5 = v10;
    }
    double v15 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement items];
    unint64_t v16 = [v15 count] - 1;

    if (v8 >= v16) {
      double v6 = v12;
    }
    else {
      double v6 = v10;
    }
  }
  double v17 = v4;
  double v18 = v5;
  double v19 = v7;
  result.double right = v6;
  result.bottom = v19;
  result.double left = v18;
  result.top = v17;
  return result;
}

- (double)_effectiveMinimumActiveItemWidth
{
  [(SFUnifiedTabBarMetrics *)self->_barMetrics minimumActiveItemWidth];
  double v4 = v3;
  [(SFUnifiedTabBarLayout *)self _safeArea];
  double Width = CGRectGetWidth(v8);
  [(SFUnifiedTabBarMetrics *)self->_barMetrics minimumActiveItemWidthRatio];
  return fmin(v4, Width * v6);
}

- (double)_minimumItemSpacing
{
  [(SFUnifiedTabBarMetrics *)self->_barMetrics minimumItemSpacing];
  return result;
}

- (double)_maximumItemSpacing
{
  [(SFUnifiedTabBarMetrics *)self->_barMetrics maximumItemSpacing];
  return result;
}

- (double)_minimumHorizontalOffsetForOccludedItems
{
  double itemSpacing = self->_itemSpacing;
  [(SFUnifiedBarMetrics *)self->_barMetrics cutoutBorderWidth];
  return itemSpacing - v3 + 1.0;
}

- (double)_insetToRevealNextItem
{
  [(SFUnifiedTabBarMetrics *)self->_barMetrics insetToRevealNextItem];
  return result;
}

- (BOOL)centersActiveItemWhenExpanded
{
  double v3 = [(SFUnifiedTabBarItemArrangement *)self->_itemArrangement pinnedItems];
  uint64_t v4 = [v3 count];

  if (v4) {
    return 0;
  }
  [(SFUnifiedTabBarMetrics *)self->_barMetrics maximumActiveItemWidth];
  double v7 = v6;
  [(SFUnifiedTabBarLayout *)self _maximumActiveItemWidthForCenteringExpandedItem];
  return v7 <= v8;
}

- (BOOL)horizontalSpaceIsExtremelyConstrained
{
  [(SFUnifiedTabBarLayout *)self _activeItemPinnableArea];
  double Width = CGRectGetWidth(v10);
  [(SFUnifiedTabBarLayout *)self _effectiveMinimumActiveItemWidth];
  double v5 = Width - v4;
  [(SFUnifiedTabBarMetrics *)self->_barMetrics minimumInactiveItemWidth];
  double v7 = v6;
  [(SFUnifiedTabBarMetrics *)self->_barMetrics minimumItemSpacing];
  return v5 < v8 + v7 * 2.0;
}

- (double)_maximumActiveItemWidthForCenteringExpandedItem
{
  [(SFUnifiedTabBarLayout *)self _safeArea];
  return CGRectGetWidth(v3) + -302.0;
}

- (CGPoint)_midpointForCenteredContentInScrollView
{
  scrollView = self->_scrollView;
  double v4 = [(UIScrollView *)scrollView superview];
  -[UIScrollView convertPoint:fromView:](scrollView, "convertPoint:fromView:", v4, self->_midpointForCenteredContent.x, self->_midpointForCenteredContent.y);
  double v6 = v5;
  double v8 = v7;

  if (self->_flipped) {
    double v6 = self->_contentSize.width - v6;
  }
  double v9 = v6;
  double v10 = v8;
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (SFUnifiedTabBarItemArrangement)itemArrangement
{
  return self->_itemArrangement;
}

- (SFUnifiedTabBarMetrics)barMetrics
{
  return self->_barMetrics;
}

- (CGPoint)midpointForCenteredContent
{
  double x = self->_midpointForCenteredContent.x;
  double y = self->_midpointForCenteredContent.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setMidpointForCenteredContent:(CGPoint)a3
{
  self->_midpointForCenteredContent = a3;
}

- (BOOL)contentIsCentered
{
  return self->_contentIsCentered;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (SFUnifiedBarItem)hoveringItem
{
  return self->_hoveringItem;
}

- (void)setHoveringItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoveringItem, 0);
  objc_storeStrong((id *)&self->_barMetrics, 0);
  objc_storeStrong((id *)&self->_itemArrangement, 0);
  objc_storeStrong((id *)&self->_occludedItemIndexes, 0);
  objc_storeStrong((id *)&self->_visibleItemIndexes, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end