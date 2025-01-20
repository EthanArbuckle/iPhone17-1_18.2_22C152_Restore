@interface PUScrubberTilingLayout
- (BOOL)_shouldShowTimeIndicatorForExpandedItemAtIndexPath:(id)a3;
- (BOOL)onlyShowExpandedItem;
- (BOOL)shouldHighlightSelectedItems;
- (BOOL)showPlayheadForExpandedItem;
- (BOOL)snapToExpandedItem;
- (BOOL)useEmbeddedVideoScrubber;
- (CGPoint)focusPoint;
- (CGRect)_rectForItemAtIndexPath:(id)a3 withLoupeTransform:(BOOL)a4 withExpanded:(BOOL)a5;
- (CGRect)contentBounds;
- (CGRect)visibleRectForScrollingToItemAtIndexPath:(id)a3 scrollPosition:(int64_t)a4;
- (CGRect)visibleRectForScrollingToItemAtIndexPath:(id)a3 transitionProgress:(double)a4;
- (CGSize)_slitSize;
- (CGSize)_transformedSizeForIndexPath:(id)a3;
- (CGSize)estimatedSectionSize;
- (CGSize)interItemSpacing;
- (CGSize)sizeForSection:(int64_t)a3 numberOfItems:(int64_t)a4;
- (NSIndexPath)currentItemIndexPath;
- (NSIndexPath)expandedItemIndexPath;
- (NSIndexPath)loupeIndexPath;
- (NSIndexPath)overrideLoupeIndexPath;
- (PUScrubberTilingLayout)init;
- (PUScrubberTilingLayoutDelegate)delegate;
- (UIEdgeInsets)contentPadding;
- (double)_focusAbscissa;
- (double)_loupeAmountFor:(id)a3;
- (double)_normalizedTransitionProgressFrom:(id)a3 withAbscissa:(double)a4 outNeighborIndexPath:(id *)a5;
- (double)_transformedHorizontalOffsetForIndexPath:(id)a3;
- (double)currentItemFocusProgress;
- (double)currentItemTransitionProgress;
- (double)expandedItemPadding;
- (double)expandedItemPlayheadProgress;
- (double)expandedItemWidth;
- (double)itemCornerRadius;
- (double)loupeAmount;
- (double)loupeTransitionProgress;
- (double)maxAspectRatio;
- (double)playheadVerticalOverhang;
- (double)slitAspectRatio;
- (double)timeIndicatorVerticalOffset;
- (float)_aspectRatioForIndexPath:(id)a3;
- (id)_createLayoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4;
- (id)_indexPathOfItemClosestToAbscissa:(double)a3;
- (id)indexPathOfItemClosestToPoint:(CGPoint)a3;
- (id)layoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4;
- (id)preferredScrollInfo;
- (int64_t)_indexOfItemClosestToAbscissa:(double)a3 inSection:(int64_t)a4;
- (void)addLayoutInfosForTilesInRect:(CGRect)a3 section:(int64_t)a4 toSet:(id)a5;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)invalidateSelectedItems;
- (void)prepareLayout;
- (void)setContentPadding:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setExpandedItemIndexPath:(id)a3;
- (void)setExpandedItemPadding:(double)a3;
- (void)setExpandedItemPlayheadProgress:(double)a3;
- (void)setExpandedItemWidth:(double)a3;
- (void)setInterItemSpacing:(CGSize)a3;
- (void)setItemCornerRadius:(double)a3;
- (void)setLoupeAmount:(double)a3;
- (void)setMaxAspectRatio:(double)a3;
- (void)setOnlyShowExpandedItem:(BOOL)a3;
- (void)setOverrideLoupeIndexPath:(id)a3;
- (void)setPlayheadVerticalOverhang:(double)a3;
- (void)setShouldHighlightSelectedItems:(BOOL)a3;
- (void)setShowPlayheadForExpandedItem:(BOOL)a3;
- (void)setSlitAspectRatio:(double)a3;
- (void)setSnapToExpandedItem:(BOOL)a3;
- (void)setTimeIndicatorVerticalOffset:(double)a3;
- (void)setUseEmbeddedVideoScrubber:(BOOL)a3;
- (void)setVisibleRect:(CGRect)a3;
@end

@implementation PUScrubberTilingLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedItemIndexPath, 0);
  objc_storeStrong((id *)&self->_overrideLoupeIndexPath, 0);
  objc_storeStrong((id *)&self->_loupeIndexPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutInfosByIndexPathByTileKind, 0);
  objc_storeStrong((id *)&self->_loupeNeighborIndexPath, 0);
  objc_storeStrong((id *)&self->_currentItemIndexPath, 0);
}

- (double)timeIndicatorVerticalOffset
{
  return self->_timeIndicatorVerticalOffset;
}

- (BOOL)shouldHighlightSelectedItems
{
  return self->_shouldHighlightSelectedItems;
}

- (BOOL)snapToExpandedItem
{
  return self->_snapToExpandedItem;
}

- (double)expandedItemPlayheadProgress
{
  return self->_expandedItemPlayheadProgress;
}

- (double)expandedItemWidth
{
  return self->_expandedItemWidth;
}

- (BOOL)showPlayheadForExpandedItem
{
  return self->_showPlayheadForExpandedItem;
}

- (BOOL)onlyShowExpandedItem
{
  return self->_onlyShowExpandedItem;
}

- (NSIndexPath)expandedItemIndexPath
{
  return self->_expandedItemIndexPath;
}

- (double)loupeAmount
{
  return self->_loupeAmount;
}

- (NSIndexPath)overrideLoupeIndexPath
{
  return self->_overrideLoupeIndexPath;
}

- (double)loupeTransitionProgress
{
  return self->_loupeTransitionProgress;
}

- (NSIndexPath)loupeIndexPath
{
  return self->_loupeIndexPath;
}

- (double)currentItemFocusProgress
{
  return self->_currentItemFocusProgress;
}

- (double)currentItemTransitionProgress
{
  return self->_currentItemTransitionProgress;
}

- (void)setExpandedItemPadding:(double)a3
{
  self->_expandedItemPadding = a3;
}

- (double)expandedItemPadding
{
  return self->_expandedItemPadding;
}

- (void)setUseEmbeddedVideoScrubber:(BOOL)a3
{
  self->_useEmbeddedVideoScrubber = a3;
}

- (BOOL)useEmbeddedVideoScrubber
{
  return self->_useEmbeddedVideoScrubber;
}

- (void)setMaxAspectRatio:(double)a3
{
  self->_maxAspectRatio = a3;
}

- (double)maxAspectRatio
{
  return self->_maxAspectRatio;
}

- (void)setSlitAspectRatio:(double)a3
{
  self->_slitAspectRatio = a3;
}

- (double)slitAspectRatio
{
  return self->_slitAspectRatio;
}

- (void)setContentPadding:(UIEdgeInsets)a3
{
  self->_contentPadding = a3;
}

- (UIEdgeInsets)contentPadding
{
  double top = self->_contentPadding.top;
  double left = self->_contentPadding.left;
  double bottom = self->_contentPadding.bottom;
  double right = self->_contentPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPlayheadVerticalOverhang:(double)a3
{
  self->_playheadVerticalOverhang = a3;
}

- (double)playheadVerticalOverhang
{
  return self->_playheadVerticalOverhang;
}

- (void)setInterItemSpacing:(CGSize)a3
{
  self->_interItemSpacing = a3;
}

- (CGSize)interItemSpacing
{
  double width = self->_interItemSpacing.width;
  double height = self->_interItemSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setItemCornerRadius:(double)a3
{
  self->_itemCornerRadius = a3;
}

- (double)itemCornerRadius
{
  return self->_itemCornerRadius;
}

- (PUScrubberTilingLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUScrubberTilingLayoutDelegate *)WeakRetained;
}

- (double)_normalizedTransitionProgressFrom:(id)a3 withAbscissa:(double)a4 outNeighborIndexPath:(id *)a5
{
  id v9 = a3;
  if (!v9)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"PUScrubberTilingLayout.m", 790, @"Invalid parameter not satisfying: %@", @"indexPath != nil" object file lineNumber description];
  }
  [(PUScrubberTilingLayout *)self _rectForItemAtIndexPath:v9 withLoupeTransform:0 withExpanded:1];
  double MidX = CGRectGetMidX(v48);
  BOOL v11 = [(PUSectionedTilingLayout *)self leftToRight];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__82141;
  v46 = __Block_byref_object_dispose__82142;
  id v47 = 0;
  v12 = [(PUTilingLayout *)self dataSource];
  if (v11) {
    BOOL v13 = MidX > a4;
  }
  else {
    BOOL v13 = MidX < a4;
  }
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __94__PUScrubberTilingLayout__normalizedTransitionProgressFrom_withAbscissa_outNeighborIndexPath___block_invoke;
  v39[3] = &unk_1E5F2BB28;
  id v14 = v9;
  id v40 = v14;
  v41 = &v42;
  [v12 enumerateIndexPathsStartingAtIndexPath:v14 reverseDirection:v13 usingBlock:v39];

  if (!v43[5])
  {
    double v19 = 0.0;
    if (!a5) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  v15 = [(PUScrubberTilingLayout *)self expandedItemIndexPath];
  int v16 = [v14 isEqual:v15];

  if (v16)
  {
    id v17 = (id)v43[5];
    v18 = v14;
  }
  else
  {
    id v17 = v14;
    v18 = (void *)v43[5];
  }
  id v20 = v18;
  [(PUScrubberTilingLayout *)self _rectForItemAtIndexPath:v17 withLoupeTransform:0 withExpanded:1];
  CGFloat x = v49.origin.x;
  CGFloat y = v49.origin.y;
  CGFloat width = v49.size.width;
  CGFloat height = v49.size.height;
  double v25 = CGRectGetMidX(v49);
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = width;
  v50.size.CGFloat height = height;
  -[PUScrubberTilingLayout _rectForItemAtIndexPath:withLoupeTransform:withExpanded:](self, "_rectForItemAtIndexPath:withLoupeTransform:withExpanded:", v17, 0, 0, CGRectGetMidY(v50));
  CGFloat v26 = v51.origin.x;
  CGFloat v27 = v51.origin.y;
  CGFloat v28 = v51.size.width;
  CGFloat v29 = v51.size.height;
  double v30 = CGRectGetMidX(v51);
  v52.origin.CGFloat x = v26;
  v52.origin.CGFloat y = v27;
  v52.size.CGFloat width = v28;
  v52.size.CGFloat height = v29;
  -[PUScrubberTilingLayout _rectForItemAtIndexPath:withLoupeTransform:withExpanded:](self, "_rectForItemAtIndexPath:withLoupeTransform:withExpanded:", v20, 0, 0, CGRectGetMidY(v52));
  CGFloat v31 = v53.origin.x;
  CGFloat v32 = v53.origin.y;
  CGFloat v33 = v53.size.width;
  CGFloat v34 = v53.size.height;
  double v35 = CGRectGetMidX(v53);
  v54.origin.CGFloat x = v31;
  v54.origin.CGFloat y = v32;
  v54.size.CGFloat width = v33;
  v54.size.CGFloat height = v34;
  CGRectGetMidY(v54);
  double v36 = vabdd_f64(v30, v35);
  if (v16) {
    double v19 = -((v30 - (v25 - a4) - v30) / v36);
  }
  else {
    double v19 = (v30 - (v25 - a4) - v30) / v36;
  }

  if (a5) {
LABEL_16:
  }
    *a5 = (id) v43[5];
LABEL_17:

  _Block_object_dispose(&v42, 8);
  return v19;
}

void __94__PUScrubberTilingLayout__normalizedTransitionProgressFrom_withAbscissa_outNeighborIndexPath___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)_indexPathOfItemClosestToAbscissa:(double)a3
{
  BOOL v6 = [(PUSectionedTilingLayout *)self leftToRight];
  unint64_t v7 = [(PUSectionedTilingLayout *)self computedSections];
  uint64_t v9 = v7 + v8;
  if (v7 >= v7 + v8)
  {
LABEL_40:
    double v36 = 0;
    goto LABEL_41;
  }
  uint64_t v10 = v7;
  uint64_t v11 = v9 - 1;
  while (1)
  {
    if (![(PUSectionedTilingLayout *)self numberOfItemsInSection:v10]) {
      goto LABEL_36;
    }
    [(PUSectionedTilingLayout *)self boundsForSection:v10];
    CGFloat v16 = v12;
    CGFloat v17 = v13;
    CGFloat v18 = v14;
    CGFloat v19 = v15;
    if (v6) {
      BOOL v20 = CGRectGetMinX(*(CGRect *)&v12) > a3;
    }
    else {
      BOOL v20 = CGRectGetMaxX(*(CGRect *)&v12) < a3;
    }
    v45.origin.CGFloat x = v16;
    v45.origin.CGFloat y = v17;
    v45.size.CGFloat width = v18;
    v45.size.CGFloat height = v19;
    if (CGRectGetMinX(v45) <= a3)
    {
      v46.origin.CGFloat x = v16;
      v46.origin.CGFloat y = v17;
      v46.size.CGFloat width = v18;
      v46.size.CGFloat height = v19;
      if (CGRectGetMaxX(v46) > a3)
      {
        int64_t v21 = [(PUScrubberTilingLayout *)self _indexOfItemClosestToAbscissa:v10 inSection:a3];
        if (v21 != 0x7FFFFFFFFFFFFFFFLL)
        {
          int64_t v22 = v21;
          v23 = (void *)MEMORY[0x1E4F28D58];
LABEL_29:
          uint64_t v24 = v10;
          goto LABEL_35;
        }
        goto LABEL_36;
      }
    }
    if (!v20)
    {
      if (v10 != v11 || v10 < 0) {
        goto LABEL_36;
      }
      uint64_t v25 = v9;
      while ([(PUSectionedTilingLayout *)self numberOfItemsInSection:--v25] < 1)
      {
        if (v25 <= 0) {
          goto LABEL_36;
        }
      }
      goto LABEL_34;
    }
    if (!v10)
    {
      v23 = (void *)MEMORY[0x1E4F28D58];
      int64_t v22 = 0;
      uint64_t v24 = 0;
      goto LABEL_35;
    }
    if (v10 == v11)
    {
      v23 = (void *)MEMORY[0x1E4F28D58];
      int64_t v22 = 0;
      uint64_t v24 = v9 - 1;
      goto LABEL_35;
    }
    [(PUSectionedTilingLayout *)self boundsForSection:v10 - 1];
    CGFloat v30 = v27;
    CGFloat v31 = v28;
    CGFloat v32 = v29;
    CGFloat rect = v26;
    if (v6)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v26);
      v47.origin.CGFloat x = v16;
      v47.origin.CGFloat y = v17;
      v47.size.CGFloat width = v18;
      v47.size.CGFloat height = v19;
      if (MaxX <= CGRectGetMinX(v47)) {
        goto LABEL_24;
      }
    }
    else
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v26);
      v50.origin.CGFloat x = v16;
      v50.origin.CGFloat y = v17;
      v50.size.CGFloat width = v18;
      v50.size.CGFloat height = v19;
      if (MinX >= CGRectGetMaxX(v50)) {
        goto LABEL_26;
      }
    }
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"PUScrubberTilingLayout.m", 751, @"Invalid parameter not satisfying: %@", @"leftToRight ? CGRectGetMaxX(previousSectionBounds) <= CGRectGetMinX(sectionBounds) : CGRectGetMinX(previousSectionBounds) >= CGRectGetMaxX(sectionBounds)" object file lineNumber description];

    if (v6)
    {
LABEL_24:
      v48.origin.CGFloat x = rect;
      v48.origin.CGFloat y = v30;
      v48.size.CGFloat width = v31;
      v48.size.CGFloat height = v32;
      double v33 = a3 - CGRectGetMaxX(v48);
      v49.origin.CGFloat x = v16;
      v49.origin.CGFloat y = v17;
      v49.size.CGFloat width = v18;
      v49.size.CGFloat height = v19;
      double v34 = CGRectGetMinX(v49) - a3;
      goto LABEL_27;
    }
LABEL_26:
    v51.origin.CGFloat x = rect;
    v51.origin.CGFloat y = v30;
    v51.size.CGFloat width = v31;
    v51.size.CGFloat height = v32;
    double v33 = CGRectGetMinX(v51) - a3;
    v52.origin.CGFloat x = v16;
    v52.origin.CGFloat y = v17;
    v52.size.CGFloat width = v18;
    v52.size.CGFloat height = v19;
    double v34 = a3 - CGRectGetMaxX(v52);
LABEL_27:
    if (v33 > v34)
    {
      v23 = (void *)MEMORY[0x1E4F28D58];
      int64_t v22 = 0;
      goto LABEL_29;
    }
    uint64_t v25 = v10;
    if (v10 >= 1) {
      break;
    }
LABEL_36:
    if (++v10 == v9) {
      goto LABEL_40;
    }
  }
  while ([(PUSectionedTilingLayout *)self numberOfItemsInSection:--v25] < 1)
  {
    if (v25 <= 0) {
      goto LABEL_36;
    }
  }
LABEL_34:
  int64_t v22 = [(PUSectionedTilingLayout *)self numberOfItemsInSection:v25] - 1;
  v23 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v24 = v25;
LABEL_35:
  double v35 = [v23 indexPathForItem:v22 inSection:v24];
  double v36 = v35;
  if (!v35) {
    goto LABEL_36;
  }
  if ([v35 item] < 0
    || (uint64_t v39 = [v36 item],
        v39 >= -[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", [v36 section])))
  {
    id v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"PUScrubberTilingLayout.m", 780, @"Computed invalid indexPath:%@", v36 object file lineNumber description];
  }
LABEL_41:
  return v36;
}

- (int64_t)_indexOfItemClosestToAbscissa:(double)a3 inSection:(int64_t)a4
{
  int64_t v7 = -[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:");
  if (!v7) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int64_t v8 = v7;
  BOOL v9 = [(PUSectionedTilingLayout *)self leftToRight];
  [(PUSectionedTilingLayout *)self boundsForSection:a4];
  if (v9) {
    double v14 = a3 - CGRectGetMinX(*(CGRect *)&v10);
  }
  else {
    double v14 = CGRectGetMaxX(*(CGRect *)&v10) - a3;
  }
  [(PUScrubberTilingLayout *)self _slitSize];
  double v17 = v16;
  CGFloat v18 = [(PUScrubberTilingLayout *)self expandedItemIndexPath];
  CGFloat v19 = v18;
  if (!v18) {
    goto LABEL_9;
  }
  if ([v18 section] != a4) {
    goto LABEL_9;
  }
  [(PUScrubberTilingLayout *)self _rectForItemAtIndexPath:v19 withLoupeTransform:0 withExpanded:1];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  CGFloat v27 = v26;
  [(PUScrubberTilingLayout *)self expandedItemPadding];
  double v29 = v28;
  [(PUScrubberTilingLayout *)self expandedItemPadding];
  double v31 = -v30;
  v40.origin.CGFloat x = v21 - v29;
  v40.origin.CGFloat y = v23 + 0.0;
  v40.size.double width = v25 - (v31 - v29);
  double width = v40.size.width;
  v40.size.CGFloat height = v27;
  double v33 = (a3 - CGRectGetMinX(v40)) / v40.size.width;
  if (v33 >= 0.0)
  {
    if (v33 <= 1.0)
    {
      uint64_t v36 = [v19 item];
      goto LABEL_11;
    }
    [(PUScrubberTilingLayout *)self interItemSpacing];
    double v35 = (v17 + v14 - width) / (v17 + v39);
  }
  else
  {
LABEL_9:
    [(PUScrubberTilingLayout *)self interItemSpacing];
    double v35 = v14 / (v17 + v34);
  }
  uint64_t v36 = (uint64_t)v35;
LABEL_11:
  int64_t v37 = v8 - 1;
  if (v36 < v8) {
    int64_t v37 = v36;
  }
  if (v36 >= 0) {
    int64_t v15 = v37;
  }
  else {
    int64_t v15 = 0;
  }

  return v15;
}

- (CGSize)_transformedSizeForIndexPath:(id)a3
{
  id v4 = a3;
  [(PUScrubberTilingLayout *)self _loupeAmountFor:v4];
  double v6 = v5;
  [(PUScrubberTilingLayout *)self loupeAmount];
  double v8 = v6 * v7;
  double width = self->_slitSize.width;
  double height = self->_slitSize.height;
  if (v8 != 0.0)
  {
    [(PUScrubberTilingLayout *)self _aspectRatioForIndexPath:v4];
    double v12 = v11;
    [(PUScrubberTilingLayout *)self maxAspectRatio];
    if (slitAspectRatio > v12) {
      double slitAspectRatio = v12;
    }
    if (slitAspectRatio < self->_slitAspectRatio) {
      double slitAspectRatio = self->_slitAspectRatio;
    }
    double width = height * slitAspectRatio * v8 + (1.0 - v8) * width;
    double height = height * v8 + (1.0 - v8) * height;
  }

  double v14 = width;
  double v15 = height;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (double)_transformedHorizontalOffsetForIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(PUScrubberTilingLayout *)self loupeIndexPath];
  double v6 = 0.0;
  if (v5)
  {
    [(PUScrubberTilingLayout *)self loupeAmount];
    if (v7 > 0.0)
    {
      double v8 = [(PUScrubberTilingLayout *)self overrideLoupeIndexPath];

      if (v8)
      {
        BOOL v9 = [(PUScrubberTilingLayout *)self overrideLoupeIndexPath];
        [(PUScrubberTilingLayout *)self _rectForItemAtIndexPath:v9 withLoupeTransform:0 withExpanded:1];
        CGFloat v11 = v10;
        CGFloat v13 = v12;
        CGFloat v15 = v14;
        CGFloat v17 = v16;

        v27.origin.CGFloat x = v11;
        v27.origin.CGFloat y = v13;
        v27.size.double width = v15;
        v27.size.double height = v17;
        double MidX = CGRectGetMidX(v27);
      }
      else
      {
        [(PUScrubberTilingLayout *)self _focusAbscissa];
      }
      double v19 = MidX;
      [(PUScrubberTilingLayout *)self _rectForItemAtIndexPath:v4 withLoupeTransform:0 withExpanded:1];
      double v20 = CGRectGetMidX(v28);
      [(PUScrubberTilingLayout *)self _loupeAmountFor:v4];
      double v22 = v21;
      [(PUScrubberTilingLayout *)self loupeAmount];
      double v24 = (1.0 - v22) * v23;
      double loupeWidth = self->_loupeWidth;
      if (v20 <= v19) {
        double loupeWidth = -loupeWidth;
      }
      double v6 = loupeWidth * 0.5 * v24 + (1.0 - v24) * 0.0;
    }
  }

  return v6;
}

- (double)_loupeAmountFor:(id)a3
{
  id v4 = a3;
  double v5 = [(PUScrubberTilingLayout *)self loupeIndexPath];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    [(PUScrubberTilingLayout *)self loupeTransitionProgress];
    double v8 = 1.0 - fabs(v7);
  }
  else
  {
    double v8 = 0.0;
    if ([v4 isEqual:self->_loupeNeighborIndexPath]) {
      double v8 = fabs(self->_loupeTransitionProgress);
    }
  }

  return v8;
}

- (CGRect)visibleRectForScrollingToItemAtIndexPath:(id)a3 scrollPosition:(int64_t)a4
{
  -[PUScrubberTilingLayout visibleRectForScrollingToItemAtIndexPath:transitionProgress:](self, "visibleRectForScrollingToItemAtIndexPath:transitionProgress:", a3, a4, 0.0);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)visibleRectForScrollingToItemAtIndexPath:(id)a3 transitionProgress:(double)a4
{
  id v6 = a3;
  [(PUScrubberTilingLayout *)self _rectForItemAtIndexPath:v6 withLoupeTransform:0 withExpanded:1];
  CGFloat x = v30.origin.x;
  CGFloat y = v30.origin.y;
  CGFloat width = v30.size.width;
  CGFloat height = v30.size.height;
  double MidX = CGRectGetMidX(v30);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double v12 = [(PUScrubberTilingLayout *)self expandedItemIndexPath];
  int v13 = [v6 isEqual:v12];

  if (v13)
  {
    [(PUScrubberTilingLayout *)self expandedItemPlayheadProgress];
    double v15 = v14;
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v32);
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    double v17 = CGRectGetMaxX(v33) * v15 + (1.0 - v15) * MinX;
  }
  else
  {
    [(PUScrubberTilingLayout *)self _slitSize];
    double v19 = v18;
    [(PUScrubberTilingLayout *)self interItemSpacing];
    double v21 = (v19 + v20) * a4;
    BOOL v22 = [(PUSectionedTilingLayout *)self leftToRight];
    double v23 = -1.0;
    if (v22) {
      double v23 = 1.0;
    }
    double v17 = MidX + v21 * v23;
  }
  [(PUTilingLayout *)self visibleRect];
  double v24 = v34.size.width;
  CGFloat v25 = v34.size.height;
  double v26 = CGRectGetMidY(v34) - v34.size.height * 0.5;
  double v27 = v17 - v24 * 0.5;
  double v28 = v24;
  double v29 = v25;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v27;
  return result;
}

- (float)_aspectRatioForIndexPath:(id)a3
{
  if (!self->_delegateFlags.respondsToAspectRatioForItemAtIndexPath) {
    return 1.0;
  }
  id v4 = a3;
  double v5 = [(PUScrubberTilingLayout *)self delegate];
  [v5 layout:self aspectRatioForItemAtIndexPath:v4];
  float v7 = v6;

  return v7;
}

- (BOOL)_shouldShowTimeIndicatorForExpandedItemAtIndexPath:(id)a3
{
  if (!self->_delegateFlags.respondsToShouldShowTimeIndicatorForExpandedItemAtIndexPath) {
    return 1;
  }
  v3 = self;
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(v3) = [WeakRetained layout:v3 shouldShowTimeIndicatorForExpandedItemAtIndexPath:v5];

  return (char)v3;
}

- (CGRect)_rectForItemAtIndexPath:(id)a3 withLoupeTransform:(BOOL)a4 withExpanded:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  -[PUSectionedTilingLayout boundsForSection:](self, "boundsForSection:", [v8 section]);
  double v10 = v9;
  double v12 = v11;
  [(PUScrubberTilingLayout *)self _slitSize];
  double v14 = v13;
  CGFloat v16 = v15;
  [(PUScrubberTilingLayout *)self interItemSpacing];
  double v18 = v17;
  int64_t v19 = -[PUSectionedTilingLayout numberOfItemsInSection:](self, "numberOfItemsInSection:", [v8 section]);
  BOOL v20 = [(PUSectionedTilingLayout *)self leftToRight];
  [(PUScrubberTilingLayout *)self contentPadding];
  double v22 = v12 + v21;
  uint64_t v23 = [v8 item];
  uint64_t v24 = v19 + ~v23;
  if (v20) {
    uint64_t v24 = v23;
  }
  double v25 = v10 + (double)v24 * (v14 + v18);
  if (v5
    && ([(PUScrubberTilingLayout *)self expandedItemIndexPath],
        (uint64_t v26 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v27 = (void *)v26;
    uint64_t v28 = [v8 section];
    if (v28 == [v27 section])
    {
      uint64_t v29 = [v27 compare:v8];
      if (v29)
      {
        uint64_t v30 = -1;
        if (!v20) {
          uint64_t v30 = 1;
        }
        if (v29 == v30)
        {
          double v31 = 0.0;
          if (v20) {
            double v31 = v14;
          }
          double v32 = v25 - v31;
          [(PUScrubberTilingLayout *)self expandedItemWidth];
          double v34 = v33;
          [(PUScrubberTilingLayout *)self expandedItemPadding];
          double v25 = v32 + v34 + v35 * 2.0;
        }
      }
      else
      {
        [(PUScrubberTilingLayout *)self expandedItemPadding];
        double v25 = v25 + v47;
        [(PUScrubberTilingLayout *)self expandedItemWidth];
        double v14 = v48;
      }
    }
  }
  else if (v6)
  {
    [(PUScrubberTilingLayout *)self _transformedSizeForIndexPath:v8];
    double v37 = v36;
    double v39 = v38;
    [(PUScrubberTilingLayout *)self _transformedHorizontalOffsetForIndexPath:v8];
    double v41 = v40;
    v49.origin.CGFloat x = v25;
    v49.origin.CGFloat y = v22;
    v49.size.CGFloat width = v14;
    v49.size.CGFloat height = v16;
    double MidX = CGRectGetMidX(v49);
    v50.origin.CGFloat x = v25;
    v50.origin.CGFloat y = v22;
    v50.size.CGFloat width = v14;
    v50.size.CGFloat height = v16;
    double v27 = 0;
    double v25 = v41 + MidX - v37 * 0.5;
    double v22 = CGRectGetMidY(v50) - v39 * 0.5;
    CGFloat v16 = v39;
    double v14 = v37;
  }
  else
  {
    double v27 = 0;
  }

  double v43 = v25;
  double v44 = v22;
  double v45 = v14;
  double v46 = v16;
  result.size.CGFloat height = v46;
  result.size.CGFloat width = v45;
  result.origin.CGFloat y = v44;
  result.origin.CGFloat x = v43;
  return result;
}

- (CGSize)_slitSize
{
  p_slitSize = &self->_slitSize;
  double width = self->_slitSize.width;
  if (width < 0.0)
  {
    float v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUScrubberTilingLayout.m", 525, @"Invalid parameter not satisfying: %@", @"_slitSize.width >= 0.0f" object file lineNumber description];

    double width = p_slitSize->width;
  }
  double height = p_slitSize->height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)_focusAbscissa
{
  [(PUTilingLayout *)self visibleRect];
  return CGRectGetMidX(*(CGRect *)&v2);
}

- (CGPoint)focusPoint
{
  [(PUScrubberTilingLayout *)self _focusAbscissa];
  double v3 = 0.0;
  result.CGFloat y = v3;
  result.CGFloat x = v2;
  return result;
}

- (id)indexPathOfItemClosestToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PUTilingLayout *)self visibleRect];
  -[PUSectionedTilingLayout computeSectionsInRect:](self, "computeSectionsInRect:", x - v6 * 0.5, y - v7 * 0.5);
  return [(PUScrubberTilingLayout *)self _indexPathOfItemClosestToAbscissa:x];
}

- (NSIndexPath)currentItemIndexPath
{
  return self->_currentItemIndexPath;
}

- (CGRect)contentBounds
{
  v37.receiver = self;
  v37.super_class = (Class)PUScrubberTilingLayout;
  [(PUSectionedTilingLayout *)&v37 contentBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(PUScrubberTilingLayout *)self expandedItemIndexPath];
  if (v11 && [(PUScrubberTilingLayout *)self snapToExpandedItem])
  {
    [(PUScrubberTilingLayout *)self _rectForItemAtIndexPath:v11 withLoupeTransform:0 withExpanded:1];
    CGFloat x = v38.origin.x;
    CGFloat y = v38.origin.y;
    CGFloat width = v38.size.width;
    CGFloat height = v38.size.height;
    double MinX = CGRectGetMinX(v38);
    v39.origin.CGFloat x = v4;
    v39.origin.CGFloat y = v6;
    v39.size.CGFloat width = v8;
    v39.size.CGFloat height = v10;
    double MinY = CGRectGetMinY(v39);
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    double v16 = CGRectGetWidth(v40);
    v41.origin.CGFloat x = v4;
    v41.origin.CGFloat y = v6;
    v41.size.CGFloat width = v8;
    v41.size.CGFloat height = v10;
    CGFloat v10 = CGRectGetHeight(v41);
    [(PUTilingLayout *)self visibleRect];
    double v18 = v17;
    double v20 = v19;
    [(PUScrubberTilingLayout *)self _focusAbscissa];
    double v22 = v21 - v18;
    double v23 = -(v20 - v22);
    double v4 = MinX - v22;
    double v6 = MinY + 0.0;
    double v8 = v16 - (v23 - v22);
  }
  else
  {
    [(PUTilingLayout *)self visibleRect];
    CGFloat v24 = *MEMORY[0x1E4F1DB28];
    CGFloat v25 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v26 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v27 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v48.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DB28];
    v48.origin.CGFloat y = v25;
    v48.size.CGFloat width = v26;
    v48.size.CGFloat height = v27;
    if (!CGRectEqualToRect(v42, v48))
    {
      v43.origin.CGFloat x = v4;
      v43.origin.CGFloat y = v6;
      v43.size.CGFloat width = v8;
      v43.size.CGFloat height = v10;
      v49.origin.CGFloat x = v24;
      v49.origin.CGFloat y = v25;
      v49.size.CGFloat width = v26;
      v49.size.CGFloat height = v27;
      if (!CGRectEqualToRect(v43, v49))
      {
        [(PUTilingLayout *)self visibleRect];
        double v28 = CGRectGetWidth(v44);
        [(PUScrubberTilingLayout *)self _slitSize];
        CGFloat v30 = (v28 - v29) * -0.5;
        v45.origin.CGFloat x = v4;
        v45.origin.CGFloat y = v6;
        v45.size.CGFloat width = v8;
        v45.size.CGFloat height = v10;
        CGRect v46 = CGRectInset(v45, v30, 0.0);
        double v4 = v46.origin.x;
        double v6 = v46.origin.y;
        double v8 = v46.size.width;
        CGFloat v10 = v46.size.height;
      }
    }
  }

  double v31 = v4;
  double v32 = v6;
  double v33 = v8;
  double v34 = v10;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (void)setTimeIndicatorVerticalOffset:(double)a3
{
  if (self->_timeIndicatorVerticalOffset != a3)
  {
    self->_timeIndicatorVerticalOffset = a3;
    double v4 = objc_alloc_init(PUScrubberTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v4 invalidateAllTilesWithKind:@"PUTileKindPlaybackTimeIndicator"];
    [(PUScrubberTilingLayout *)self invalidateLayoutWithContext:v4];
  }
}

- (id)_createLayoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(PUScrubberTilingLayout *)self expandedItemIndexPath];
  uint64_t v9 = [v6 isEqual:v8];

  [(PUScrubberTilingLayout *)self _rectForItemAtIndexPath:v6 withLoupeTransform:1 withExpanded:1];
  double v11 = v10;
  CGFloat v13 = v12;
  double v15 = v14;
  double v17 = v16;
  if ([v7 isEqualToString:@"PUTileKindItemContent"])
  {
    if (v9)
    {
      [(PUScrubberTilingLayout *)self expandedItemWidth];
      uint64_t v19 = v18;
      p_CGFloat height = &self->_slitSize.height;
    }
    else
    {
      p_CGFloat height = (CGFloat *)(MEMORY[0x1E4F1DB30] + 8);
      uint64_t v19 = *MEMORY[0x1E4F1DB30];
    }
    uint64_t v35 = *(void *)p_height;
    double v36 = 1.0;
    if ([(PUScrubberTilingLayout *)self shouldHighlightSelectedItems]
      && self->_delegateFlags.respondsToIsItemAtAtIndexPathSelected)
    {
      objc_super v37 = [(PUScrubberTilingLayout *)self delegate];
      int v38 = [v37 layout:self isItemAtAtIndexPathSelected:v6];

      if (v38) {
        double v36 = 0.5;
      }
      else {
        double v36 = 1.0;
      }
    }
    if ([(PUScrubberTilingLayout *)self useEmbeddedVideoScrubber] && v9)
    {
      PXRectGetCenter();
      [(PUScrubberTilingLayout *)self _slitSize];
      PXRectWithCenterAndSize();
      double v15 = v39;
      double v17 = v40;
      double v36 = 0.0;
    }
    [(PUScrubberTilingLayout *)self itemCornerRadius];
    double v42 = v41;
    CGFloat v30 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v6 kind:v7];
    CGRect v43 = [PUExpandableTileLayoutInfo alloc];
    UIRectGetCenter();
    double v45 = v44;
    double v47 = v46;
    double v32 = [(PUTilingLayout *)self coordinateSystem];
    [(PUScrubberTilingLayout *)self _slitSize];
    long long v48 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v76 = *MEMORY[0x1E4F1DAB8];
    long long v77 = v48;
    long long v78 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    uint64_t v51 = -[PUExpandableTileLayoutInfo initWithTileIdentifier:center:size:cornerRadius:alpha:transform:zPosition:coordinateSystem:isExpanded:expandedSize:unexpandedSize:](v43, "initWithTileIdentifier:center:size:cornerRadius:alpha:transform:zPosition:coordinateSystem:isExpanded:expandedSize:unexpandedSize:", v30, &v76, v32, v9, v45, v47, v15, v17, v42, v36, 50.0, v19, v35, v49, v50);
    goto LABEL_25;
  }
  if ([v7 isEqualToString:@"PUTileKindPlayhead"])
  {
    if (v9 && [(PUScrubberTilingLayout *)self showPlayheadForExpandedItem])
    {
      [(PUScrubberTilingLayout *)self _slitSize];
      double v22 = v21;
      double v24 = v23;
      [(PUScrubberTilingLayout *)self playheadVerticalOverhang];
      double v26 = v24 + v25 * 2.0;
      [(PUScrubberTilingLayout *)self currentItemFocusProgress];
      double v28 = v11 + v15 * v27;
      v80.origin.CGFloat x = v11;
      v80.origin.CGFloat y = v13;
      v80.size.CGFloat width = v15;
      v80.size.CGFloat height = v17;
      double MidY = CGRectGetMidY(v80);
      CGFloat v30 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v6 kind:v7];
      double v31 = [PUTileLayoutInfo alloc];
      double v32 = [(PUTilingLayout *)self coordinateSystem];
      long long v33 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v76 = *MEMORY[0x1E4F1DAB8];
      long long v77 = v33;
      long long v78 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      *(double *)&uint64_t v34 = 120.0;
LABEL_21:
      double v58 = *(double *)&v34;
      double v59 = 1.0;
      v60 = v31;
      v61 = v30;
      double v62 = v28;
      double v63 = MidY;
      double v64 = v22;
      double v65 = v26;
LABEL_24:
      uint64_t v51 = -[PUTileLayoutInfo initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:](v60, "initWithTileIdentifier:center:size:alpha:transform:zPosition:coordinateSystem:", v61, &v76, v32, v62, v63, v64, v65, v59, v58);
LABEL_25:
      v74 = (void *)v51;

      goto LABEL_27;
    }
  }
  else if ([v7 isEqualToString:@"PUTileKindPlaybackTimeIndicator"])
  {
    if (v9)
    {
      +[PUPlaybackTimeIndicatorTileViewController playbackTimeIndicatorTileSize];
      double v22 = v52;
      double v26 = v53;
      [(PUScrubberTilingLayout *)self currentItemFocusProgress];
      double v28 = v11 + v15 * v54;
      v81.origin.CGFloat x = v11;
      v81.origin.CGFloat y = v13;
      v81.size.CGFloat width = v15;
      v81.size.CGFloat height = v17;
      CGFloat v55 = CGRectGetMinY(v81) + -8.0 + v26 * -0.5;
      [(PUScrubberTilingLayout *)self timeIndicatorVerticalOffset];
      double MidY = v56 + v55;
      CGFloat v30 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v6 kind:v7];
      double v31 = [PUTileLayoutInfo alloc];
      double v32 = [(PUTilingLayout *)self coordinateSystem];
      long long v57 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v76 = *MEMORY[0x1E4F1DAB8];
      long long v77 = v57;
      long long v78 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      *(double *)&uint64_t v34 = 100.0;
      goto LABEL_21;
    }
  }
  else if (([v7 isEqualToString:@"PUTileKindVideoHighlightStrip"] & v9) == 1)
  {
    +[PUVideoHighlightStripTileViewController preferredTileHeight];
    double v67 = v66;
    v82.origin.CGFloat x = v11;
    v82.origin.CGFloat y = v13;
    v82.size.CGFloat width = v15;
    v82.size.CGFloat height = v17;
    CGRectGetMinY(v82);
    CGFloat v30 = [(PUTilingLayout *)self tileIdentifierForTileWithIndexPath:v6 kind:v7];
    v68 = [PUTileLayoutInfo alloc];
    UIRectGetCenter();
    double v70 = v69;
    double v72 = v71;
    double v32 = [(PUTilingLayout *)self coordinateSystem];
    long long v73 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v76 = *MEMORY[0x1E4F1DAB8];
    long long v77 = v73;
    long long v78 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v58 = 75.0;
    double v59 = 1.0;
    v60 = v68;
    v61 = v30;
    double v62 = v70;
    double v63 = v72;
    double v64 = v15;
    double v65 = v67;
    goto LABEL_24;
  }
  v74 = 0;
LABEL_27:

  return v74;
}

- (id)layoutInfoForTileWithIndexPath:(id)a3 kind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(NSMutableDictionary *)self->_layoutInfosByIndexPathByTileKind objectForKeyedSubscript:v7];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  if (!v9)
  {
    uint64_t v9 = [(PUScrubberTilingLayout *)self _createLayoutInfoForTileWithIndexPath:v6 kind:v7];
    id v10 = [(NSMutableDictionary *)self->_layoutInfosByIndexPathByTileKind objectForKeyedSubscript:v7];
    if (v10)
    {
      if (v9)
      {
LABEL_4:
        id v11 = v9;
LABEL_7:
        double v12 = v11;
        [v10 setObject:v11 forKeyedSubscript:v6];

        goto LABEL_8;
      }
    }
    else
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSMutableDictionary *)self->_layoutInfosByIndexPathByTileKind setObject:v10 forKeyedSubscript:v7];
      if (v9) {
        goto LABEL_4;
      }
    }
    id v11 = [MEMORY[0x1E4F1CA98] null];
    goto LABEL_7;
  }
LABEL_8:
  CGFloat v13 = [MEMORY[0x1E4F1CA98] null];
  int v14 = [v13 isEqual:v9];

  if (v14)
  {

    uint64_t v9 = 0;
  }

  return v9;
}

- (CGSize)sizeForSection:(int64_t)a3 numberOfItems:(int64_t)a4
{
  [(PUScrubberTilingLayout *)self _slitSize];
  double v8 = v7;
  if (a4 < 1)
  {
    double v10 = *MEMORY[0x1E4F1DB30];
  }
  else
  {
    [(PUScrubberTilingLayout *)self interItemSpacing];
    double v10 = -(v9 - (double)a4 * (v8 + v9));
  }
  [(PUTilingLayout *)self visibleRect];
  CGFloat Height = CGRectGetHeight(v21);
  double v12 = [(PUScrubberTilingLayout *)self expandedItemIndexPath];
  CGFloat v13 = v12;
  if (v12 && [v12 section] == a3)
  {
    double v14 = v10 - v8;
    [(PUScrubberTilingLayout *)self expandedItemWidth];
    double v16 = v15;
    [(PUScrubberTilingLayout *)self expandedItemPadding];
    double v10 = v14 + v16 + v17 * 2.0;
  }

  double v18 = v10;
  double v19 = Height;
  result.CGFloat height = v19;
  result.CGFloat width = v18;
  return result;
}

- (void)addLayoutInfosForTilesInRect:(CGRect)a3 section:(int64_t)a4 toSet:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v34 = a5;
  int64_t v11 = [(PUSectionedTilingLayout *)self numberOfItemsInSection:a4];
  BOOL v12 = [(PUSectionedTilingLayout *)self leftToRight];
  CGFloat v13 = x;
  CGFloat v14 = y;
  CGFloat v15 = width;
  CGFloat v16 = height;
  if (v12)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v13);
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v36);
  }
  else
  {
    double MinX = CGRectGetMaxX(*(CGRect *)&v13);
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    double MaxX = CGRectGetMinX(v37);
  }
  double v19 = MaxX;
  uint64_t v20 = [(PUScrubberTilingLayout *)self _indexOfItemClosestToAbscissa:a4 inSection:MinX];
  uint64_t v21 = v20 & ~(v20 >> 63);
  int64_t v22 = [(PUScrubberTilingLayout *)self _indexOfItemClosestToAbscissa:a4 inSection:v19];
  int64_t v23 = v11 - 1;
  if (v22 < v11 - 1) {
    int64_t v23 = v22;
  }
  if (v21 <= v23)
  {
    int64_t v24 = v23 + 1;
    do
    {
      double v25 = [MEMORY[0x1E4F28D58] indexPathForItem:v21 inSection:a4];
      if (![(PUScrubberTilingLayout *)self onlyShowExpandedItem]
        || ([(PUScrubberTilingLayout *)self expandedItemIndexPath],
            double v26 = objc_claimAutoreleasedReturnValue(),
            int v27 = [v25 isEqual:v26],
            v26,
            v27))
      {
        double v28 = [(PUScrubberTilingLayout *)self layoutInfoForTileWithIndexPath:v25 kind:@"PUTileKindItemContent"];
        [v28 frame];
        v40.origin.CGFloat x = x;
        v40.origin.CGFloat y = y;
        v40.size.CGFloat width = width;
        v40.size.CGFloat height = height;
        if (CGRectIntersectsRect(v38, v40)) {
          [v34 addObject:v28];
        }
      }
      ++v21;
    }
    while (v24 != v21);
  }
  double v29 = [(PUScrubberTilingLayout *)self expandedItemIndexPath];
  if (v29)
  {
    [(PUScrubberTilingLayout *)self _rectForItemAtIndexPath:v29 withLoupeTransform:0 withExpanded:1];
    v41.origin.CGFloat x = x;
    v41.origin.CGFloat y = y;
    v41.size.CGFloat width = width;
    v41.size.CGFloat height = height;
    if (CGRectIntersectsRect(v39, v41))
    {
      if ([(PUScrubberTilingLayout *)self showPlayheadForExpandedItem])
      {
        CGFloat v30 = [(PUScrubberTilingLayout *)self layoutInfoForTileWithIndexPath:v29 kind:@"PUTileKindPlayhead"];
        [v34 addObject:v30];
      }
      if ([(PUScrubberTilingLayout *)self _shouldShowTimeIndicatorForExpandedItemAtIndexPath:v29])
      {
        double v31 = [(PUScrubberTilingLayout *)self layoutInfoForTileWithIndexPath:v29 kind:@"PUTileKindPlaybackTimeIndicator"];
        [v34 addObject:v31];
      }
      double v32 = [(PUScrubberTilingLayout *)self layoutInfoForTileWithIndexPath:v29 kind:@"PUTileKindVideoHighlightStrip"];
      if (v32) {
        [v34 addObject:v32];
      }
      long long v33 = [(PUScrubberTilingLayout *)self layoutInfoForTileWithIndexPath:v29 kind:@"PUTileKindEmbeddedVideoScrubber"];
      if (v33) {
        [v34 addObject:v33];
      }
    }
  }
}

- (CGSize)estimatedSectionSize
{
  [(PUScrubberTilingLayout *)self sizeForSection:0x7FFFFFFFFFFFFFFFLL numberOfItems:20];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (id)preferredScrollInfo
{
  return +[PUTilingScrollInfo scrollInfoWithScrollDirections:2];
}

- (void)invalidateLayoutWithContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 invalidatedAllTiles])
  {
    [(NSMutableDictionary *)self->_layoutInfosByIndexPathByTileKind removeAllObjects];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    double v5 = [v4 invalidatedTileKinds];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = [(NSMutableDictionary *)self->_layoutInfosByIndexPathByTileKind objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * v9)];
          [v10 removeAllObjects];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __54__PUScrubberTilingLayout_invalidateLayoutWithContext___block_invoke;
    v12[3] = &unk_1E5F2BB00;
    v12[4] = self;
    [v4 enumerateInvalidatedTilesUsingBlock:v12];
  }
  v11.receiver = self;
  v11.super_class = (Class)PUScrubberTilingLayout;
  [(PUTilingLayout *)&v11 invalidateLayoutWithContext:v4];
}

void __54__PUScrubberTilingLayout_invalidateLayoutWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 232);
  id v5 = a2;
  id v6 = [v4 objectForKeyedSubscript:a3];
  [v6 removeObjectForKey:v5];
}

- (void)prepareLayout
{
  v41.receiver = self;
  v41.super_class = (Class)PUScrubberTilingLayout;
  [(PUSectionedTilingLayout *)&v41 prepareLayout];
  [(PUTilingLayout *)self visibleRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PUScrubberTilingLayout *)self contentPadding];
  CGFloat v12 = v6 + v11;
  CGFloat v15 = v8 - (v13 + v14);
  v42.size.CGFloat height = v10 - (v11 + v16);
  v42.origin.CGFloat x = v4 + v13;
  v42.origin.CGFloat y = v12;
  v42.size.CGFloat width = v15;
  CGFloat Height = CGRectGetHeight(v42);
  self->_slitSize.CGFloat height = Height;
  self->_slitSize.CGFloat width = Height * self->_slitAspectRatio;
  [(PUScrubberTilingLayout *)self _focusAbscissa];
  double v19 = v18;
  uint64_t v20 = [(PUScrubberTilingLayout *)self expandedItemIndexPath];
  if (v20 && [(PUScrubberTilingLayout *)self snapToExpandedItem])
  {
    uint64_t v21 = v20;
  }
  else
  {
    uint64_t v21 = [(PUScrubberTilingLayout *)self _indexPathOfItemClosestToAbscissa:v19];
  }
  currentItemIndexPath = self->_currentItemIndexPath;
  self->_currentItemIndexPath = v21;

  int64_t v23 = self->_currentItemIndexPath;
  if (v23)
  {
    id v40 = 0;
    [(PUScrubberTilingLayout *)self _normalizedTransitionProgressFrom:v23 withAbscissa:&v40 outNeighborIndexPath:v19];
    double v25 = v24;
    id v26 = v40;
  }
  else
  {
    id v26 = 0;
    double v25 = 0.0;
  }
  self->_double currentItemTransitionProgress = v25;
  double v27 = 0.5;
  if (v20)
  {
    [(PUScrubberTilingLayout *)self _rectForItemAtIndexPath:v20 withLoupeTransform:0 withExpanded:1];
    if (v29 > 0.0)
    {
      double v30 = (v19 - v28) / v29;
      if (v30 > 1.0) {
        double v30 = 1.0;
      }
      double v27 = fmax(v30, 0.0);
    }
  }
  self->_currentItemFocusProgress = v27;
  double v31 = [(PUScrubberTilingLayout *)self overrideLoupeIndexPath];

  if (v31)
  {
    double v32 = [(PUScrubberTilingLayout *)self overrideLoupeIndexPath];
    id v33 = 0;
    double currentItemTransitionProgress = 0.0;
  }
  else
  {
    double v32 = self->_currentItemIndexPath;
    id v33 = v26;
    double currentItemTransitionProgress = self->_currentItemTransitionProgress;
  }
  objc_storeStrong((id *)&self->_loupeIndexPath, v32);
  objc_storeStrong((id *)&self->_loupeNeighborIndexPath, v33);
  self->_loupeTransitionProgress = currentItemTransitionProgress;
  if (v32)
  {
    [(PUScrubberTilingLayout *)self _transformedSizeForIndexPath:v32];
    double v36 = v35;
    if (self->_loupeNeighborIndexPath)
    {
      -[PUScrubberTilingLayout _transformedSizeForIndexPath:](self, "_transformedSizeForIndexPath:");
      double v38 = v36 + v37;
      [(PUScrubberTilingLayout *)self _slitSize];
      double v36 = v38 - v39;
    }
  }
  else
  {
    double v36 = 0.0;
  }
  self->_double loupeWidth = v36;
}

- (void)invalidateSelectedItems
{
  double v3 = objc_alloc_init(PUScrubberTilingLayoutInvalidationContext);
  [(PUTilingLayoutInvalidationContext *)v3 invalidateAllTilesWithKind:@"PUTileKindItemContent"];
  [(PUScrubberTilingLayout *)self invalidateLayoutWithContext:v3];
}

- (void)setShouldHighlightSelectedItems:(BOOL)a3
{
  if (self->_shouldHighlightSelectedItems != a3)
  {
    self->_shouldHighlightSelectedItems = a3;
    [(PUScrubberTilingLayout *)self invalidateSelectedItems];
  }
}

- (void)setShowPlayheadForExpandedItem:(BOOL)a3
{
  self->_showPlayheadForExpandedItem = a3;
  double v4 = objc_alloc_init(PUTilingLayoutInvalidationContext);
  [(PUTilingLayoutInvalidationContext *)v4 invalidateAllTilesWithKind:@"PUTileKindPlayhead"];
  [(PUScrubberTilingLayout *)self invalidateLayoutWithContext:v4];
}

- (void)setExpandedItemPlayheadProgress:(double)a3
{
  if (self->_expandedItemPlayheadProgress != a3) {
    self->_expandedItemPlayheadProgress = a3;
  }
}

- (void)setExpandedItemWidth:(double)a3
{
  if (self->_expandedItemWidth != a3)
  {
    self->_expandedItemWidth = a3;
    double v4 = [(PUScrubberTilingLayout *)self expandedItemIndexPath];

    if (v4)
    {
      [(PUSectionedTilingLayout *)self invalidateSectionInfos];
      double v5 = objc_alloc_init(PUScrubberTilingLayoutInvalidationContext);
      [(PUScrubberTilingLayoutInvalidationContext *)v5 invalidateExpandedItem];
      [(PUScrubberTilingLayout *)self invalidateLayoutWithContext:v5];
    }
  }
}

- (void)setSnapToExpandedItem:(BOOL)a3
{
  if (self->_snapToExpandedItem != a3)
  {
    self->_snapToExpandedItem = a3;
    double v4 = [(PUScrubberTilingLayout *)self expandedItemIndexPath];

    if (v4)
    {
      double v5 = objc_alloc_init(PUTilingLayoutInvalidationContext);
      [(PUTilingLayoutInvalidationContext *)v5 invalidateContentBounds];
      [(PUScrubberTilingLayout *)self invalidateLayoutWithContext:v5];
    }
  }
}

- (void)setOnlyShowExpandedItem:(BOOL)a3
{
  if (self->_onlyShowExpandedItem != a3)
  {
    self->_onlyShowExpandedItem = a3;
    double v4 = objc_alloc_init(PUScrubberTilingLayoutInvalidationContext);
    [(PUTilingLayoutInvalidationContext *)v4 invalidateAllTiles];
    [(PUScrubberTilingLayout *)self invalidateLayoutWithContext:v4];
  }
}

- (void)setExpandedItemIndexPath:(id)a3
{
  double v5 = (NSIndexPath *)a3;
  expandedItemIndexPath = self->_expandedItemIndexPath;
  if (expandedItemIndexPath != v5)
  {
    double v9 = v5;
    char v7 = [(NSIndexPath *)expandedItemIndexPath isEqual:v5];
    double v5 = v9;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_expandedItemIndexPath, a3);
      [(PUSectionedTilingLayout *)self invalidateSectionInfos];
      double v8 = objc_alloc_init(PUScrubberTilingLayoutInvalidationContext);
      [(PUScrubberTilingLayoutInvalidationContext *)v8 invalidateExpandedItem];
      [(PUScrubberTilingLayout *)self invalidateLayoutWithContext:v8];

      double v5 = v9;
    }
  }
}

- (void)setLoupeAmount:(double)a3
{
  if (self->_loupeAmount != a3)
  {
    self->_loupeAmount = a3;
    double v4 = [(PUScrubberTilingLayout *)self expandedItemIndexPath];

    if (!v4)
    {
      double v5 = objc_alloc_init(PUScrubberTilingLayoutInvalidationContext);
      [(PUTilingLayoutInvalidationContext *)v5 invalidateAllTilesWithKind:@"PUTileKindItemContent"];
      [(PUScrubberTilingLayout *)self invalidateLayoutWithContext:v5];
    }
  }
}

- (void)setOverrideLoupeIndexPath:(id)a3
{
  double v5 = (NSIndexPath *)a3;
  overrideLoupeIndexPath = self->_overrideLoupeIndexPath;
  if (overrideLoupeIndexPath != v5)
  {
    double v10 = v5;
    char v7 = [(NSIndexPath *)overrideLoupeIndexPath isEqual:v5];
    double v5 = v10;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_overrideLoupeIndexPath, a3);
      [(PUScrubberTilingLayout *)self loupeAmount];
      double v5 = v10;
      if (v8 > 0.0)
      {
        double v9 = objc_alloc_init(PUScrubberTilingLayoutInvalidationContext);
        [(PUTilingLayoutInvalidationContext *)v9 invalidateAllTilesWithKind:@"PUTileKindItemContent"];
        [(PUScrubberTilingLayout *)self invalidateLayoutWithContext:v9];

        double v5 = v10;
      }
    }
  }
}

- (void)setVisibleRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PUTilingLayout *)self visibleRect];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v26.receiver = self;
  v26.super_class = (Class)PUScrubberTilingLayout;
  -[PUSectionedTilingLayout setVisibleRect:](&v26, sel_setVisibleRect_, x, y, width, height);
  v27.origin.double x = v9;
  v27.origin.double y = v11;
  v27.size.double width = v13;
  v27.size.double height = v15;
  v30.origin.double x = x;
  v30.origin.double y = y;
  v30.size.double width = width;
  v30.size.double height = height;
  if (!CGRectEqualToRect(v27, v30))
  {
    double v16 = objc_alloc_init(PUTilingLayoutInvalidationContext);
    v28.origin.double x = x;
    v28.origin.double y = y;
    v28.size.double width = width;
    v28.size.double height = height;
    double v17 = CGRectGetHeight(v28);
    v29.origin.double x = v9;
    v29.origin.double y = v11;
    v29.size.double width = v13;
    v29.size.double height = v15;
    if (v17 != CGRectGetHeight(v29))
    {
      __asm { FMOV            V0.2D, #-1.0 }
      self->_slitSize = _Q0;
      [(PUTilingLayoutInvalidationContext *)v16 invalidateContentBounds];
      [(PUTilingLayoutInvalidationContext *)v16 invalidateAllTiles];
LABEL_9:
      [(PUScrubberTilingLayout *)self invalidateLayoutWithContext:v16];

      return;
    }
    int64_t v23 = [(PUScrubberTilingLayout *)self expandedItemIndexPath];

    if (v23)
    {
      [(PUTilingLayoutInvalidationContext *)v16 invalidateAllTilesWithKind:@"PUTileKindPlayhead"];
      [(PUTilingLayoutInvalidationContext *)v16 invalidateAllTilesWithKind:@"PUTileKindPlaybackTimeIndicator"];
      double v24 = @"PUTileKindVideoHighlightStrip";
    }
    else
    {
      [(PUScrubberTilingLayout *)self loupeAmount];
      if (v25 <= 0.0) {
        goto LABEL_9;
      }
      double v24 = @"PUTileKindItemContent";
    }
    [(PUTilingLayoutInvalidationContext *)v16 invalidateAllTilesWithKind:v24];
    goto LABEL_9;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToAspectRatioForItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldShowTimeIndicatorForExpandedItemAtIndexPath = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToIsItemAtAtIndexPathSelected = objc_opt_respondsToSelector() & 1;
  }
}

- (PUScrubberTilingLayout)init
{
  v14.receiver = self;
  v14.super_class = (Class)PUScrubberTilingLayout;
  double v2 = [(PUTilingLayout *)&v14 init];
  double v3 = v2;
  if (v2)
  {
    v2->_expandedItemPadding = 20.0;
    __asm { FMOV            V0.2D, #2.0 }
    v2->_interItemSpacing = _Q0;
    v2->_double slitAspectRatio = 0.5;
    __asm { FMOV            V0.2D, #-1.0 }
    v2->_slitSize = _Q0;
    v2->_maxAspectRatio = 2.0;
    long long v10 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)&v2->_contentPadding.double top = *MEMORY[0x1E4FB2848];
    *(_OWORD *)&v2->_contentPadding.double bottom = v10;
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    layoutInfosByIndexPathByTileKind = v3->_layoutInfosByIndexPathByTileKind;
    v3->_layoutInfosByIndexPathByTileKind = (NSMutableDictionary *)v11;

    v3->_showPlayheadForExpandedItem = 1;
  }
  return v3;
}

@end