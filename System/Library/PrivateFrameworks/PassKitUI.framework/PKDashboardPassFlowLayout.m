@interface PKDashboardPassFlowLayout
+ (double)topMarginInFirstSection;
- (BOOL)_indexPathIsPassGroupIndexPath:(id)a3;
- (BOOL)fade;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (PKDashboardPassFlowLayout)init;
- (id)_indexPathForPassGroup;
- (id)_modifiedLayoutAttributes:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutSectionAtIndex:(int64_t)a3 layoutEnvironment:(id)a4;
- (void)_adjustItems:(id)a3 withLateralMove:(double)a4;
- (void)hideContent;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)passPanDidBegin;
- (void)passPanDidEnd;
- (void)prepareLayout;
- (void)revealContentAnimated:(BOOL)a3;
- (void)setFade:(BOOL)a3;
@end

@implementation PKDashboardPassFlowLayout

+ (double)topMarginInFirstSection
{
  uint64_t v2 = PKUIGetMinScreenWidthType();
  double result = 16.0;
  if (!v2) {
    return 8.0;
  }
  return result;
}

- (PKDashboardPassFlowLayout)init
{
  uint64_t v8 = 0;
  v9 = (id *)&v8;
  uint64_t v10 = 0x3042000000;
  v11 = __Block_byref_object_copy__37;
  v12 = __Block_byref_object_dispose__37;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__PKDashboardPassFlowLayout_init__block_invoke;
  v7[3] = &unk_1E59D8A70;
  v7[4] = &v8;
  v6.receiver = self;
  v6.super_class = (Class)PKDashboardPassFlowLayout;
  uint64_t v2 = [(PKDashboardPassFlowLayout *)&v6 initWithSectionProvider:v7];
  if (v2)
  {
    objc_storeWeak(v9 + 5, v2);
    +[PKDashboardCollectionViewCell defaultHorizontalInset];
    v2->_horizontalInset = v3;
    [(id)objc_opt_class() topMarginInFirstSection];
    v2->_topMarginInFirstSection = v4;
  }
  _Block_object_dispose(&v8, 8);
  objc_destroyWeak(&v13);
  return v2;
}

id __33__PKDashboardPassFlowLayout_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v4 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  v7 = [WeakRetained layoutSectionAtIndex:a2 layoutEnvironment:v5];

  return v7;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKDashboardPassFlowLayout;
  id v4 = a3;
  [(PKDashboardPassFlowLayout *)&v9 invalidateLayoutWithContext:v4];
  id v5 = objc_msgSend(v4, "invalidatedItemIndexPaths", v9.receiver, v9.super_class);

  if ([v5 count] == 1)
  {
    objc_super v6 = [v5 firstObject];
    v7 = [(PKDashboardPassFlowLayout *)self _indexPathForPassGroup];
    int v8 = PKEqualObjects();

    if (v8) {
      self->_preventLayoutComputation = 1;
    }
  }
}

- (void)prepareLayout
{
  if (self->_preventLayoutComputation)
  {
    self->_preventLayoutComputation = 0;
  }
  else
  {
    double v3 = [(PKDashboardPassFlowLayout *)self collectionView];
    uint64_t v4 = [v3 delegate];
    id v5 = (void *)v4;
    if (v3)
    {
      if (v4)
      {
        objc_super v6 = [(PKDashboardPassFlowLayout *)self _indexPathForPassGroup];
        [v5 collectionView:v3 layout:self sizeForItemAtIndexPath:v6];
        self->_passCellSize.width = v7;
        self->_passCellSize.height = v8;

        v9.receiver = self;
        v9.super_class = (Class)PKDashboardPassFlowLayout;
        [(PKDashboardPassFlowLayout *)&v9 prepareLayout];
      }
    }
  }
}

- (id)layoutSectionAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v73 = a4;
  id v5 = [(PKDashboardPassFlowLayout *)self collectionView];
  objc_super v6 = [v5 delegate];
  [v5 frame];
  double v8 = v7;
  char v74 = objc_opt_respondsToSelector();
  char v9 = objc_opt_respondsToSelector();
  char v10 = objc_opt_respondsToSelector();
  char v11 = objc_opt_respondsToSelector();
  char v12 = objc_opt_respondsToSelector();
  id v77 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v75 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = [v5 dataSource];
  uint64_t v14 = [v13 collectionView:v5 numberOfItemsInSection:a3];

  if (v14 < 1)
  {
    v70 = 0;
    goto LABEL_66;
  }
  v15 = [(PKDashboardPassFlowLayout *)self _indexPathForPassGroup];
  uint64_t v16 = [v15 section];
  double topMarginInFirstSection = 0.0;
  if (v16 == a3) {
    double topMarginInFirstSection = self->_topMarginInFirstSection;
  }
  double v72 = topMarginInFirstSection;

  if ((v9 & 1) != 0 && [v6 collectionView:v5 layout:self isListSectionAtIndex:a3])
  {
    char v18 = v11;
    v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
    if (v10)
    {
      int v20 = [v6 collectionView:v5 layout:self hasHeaderForSectionAtIndex:a3];
      if ((v18 & 1) == 0) {
        goto LABEL_8;
      }
    }
    else
    {
      int v20 = 0;
      if ((v18 & 1) == 0)
      {
LABEL_8:
        int v21 = 0;
        if (!v20)
        {
LABEL_59:
          if (v21)
          {
            [v19 setFooterMode:1];
            if ((v12 & 1) == 0)
            {
LABEL_64:
              v65 = (void *)[objc_alloc(MEMORY[0x1E4FB1958]) initWithListAppearance:2];
              objc_msgSend(v65, "setTopSeparatorInsets:", 0.0, 14.0, 0.0, 0.0);
              objc_msgSend(v65, "setBottomSeparatorInsets:", 0.0, 14.0, 0.0, 0.0);
              [v19 setSeparatorConfiguration:v65];
              v70 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v19 layoutEnvironment:v73];
              objc_msgSend(v70, "setContentInsets:", v72, self->_horizontalInset, 16.0, self->_horizontalInset);
              goto LABEL_65;
            }
          }
          else if ((v12 & 1) == 0)
          {
            goto LABEL_64;
          }
          objc_initWeak(&location, self);
          v84[0] = MEMORY[0x1E4F143A8];
          v84[1] = 3221225472;
          v84[2] = __68__PKDashboardPassFlowLayout_layoutSectionAtIndex_layoutEnvironment___block_invoke;
          v84[3] = &unk_1E59CDCD0;
          objc_copyWeak(&v85, &location);
          [v19 setTrailingSwipeActionsConfigurationProvider:v84];
          objc_destroyWeak(&v85);
          objc_destroyWeak(&location);
          goto LABEL_64;
        }
LABEL_58:
        [v19 setHeaderMode:1];
        goto LABEL_59;
      }
    }
    int v21 = [v6 collectionView:v5 layout:self hasFooterForSectionAtIndex:a3];
    if (!v20) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
  [v5 safeAreaInsets];
  char v22 = 0;
  uint64_t v23 = 0;
  double v26 = v8 - v24 - v25;
  double v27 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v28 = 0.0;
  double v29 = 0.0;
  double v30 = 0.0;
  double v31 = 0.0;
  do
  {
    v32 = [MEMORY[0x1E4F28D58] indexPathForRow:v23 inSection:a3];
    [v6 collectionView:v5 layout:self sizeForItemAtIndexPath:v32];
    double v34 = v33;
    double v36 = v35;
    if (v74)
    {
      char v37 = [v6 itemIsStackableInCollectionView:v5 atIndexPath:v32];
      int v38 = [v6 itemIsIndependentInCollectionView:v5 atIndexPath:v32];
      if (v37)
      {
        int v39 = 0;
        if (v22) {
          double v30 = v30 + 8.0;
        }
        else {
          double v30 = 0.0;
        }
        char v22 = 1;
        goto LABEL_34;
      }
    }
    else
    {
      int v38 = [v6 itemIsIndependentInCollectionView:v5 atIndexPath:v32];
    }
    if (v22) {
      double v30 = 0.0;
    }
    double v40 = -0.0;
    if (v22) {
      double v40 = v31;
    }
    if (v26 - v29 >= v34)
    {
      double v43 = v29 + v40;
      BOOL v44 = v29 + v40 == 0.0;
      double v45 = v29 + v40 + 8.0;
      if (v44) {
        double v29 = v43;
      }
      else {
        double v29 = v45;
      }
      int v39 = 1;
      char v22 = 0;
    }
    else
    {
      if (v30 <= 0.0) {
        double v41 = v27;
      }
      else {
        double v41 = v30;
      }
      double v29 = 0.0;
      double v42 = v28 + v41 + 0.0;
      if (v38) {
        double v28 = v42 + 8.0;
      }
      else {
        double v28 = v42;
      }
      PKFloatRoundToPixel();
      -[PKDashboardPassFlowLayout _adjustItems:withLateralMove:](self, "_adjustItems:withLateralMove:", v77);
      [v77 removeAllObjects];
      char v22 = 0;
      int v39 = 1;
    }
LABEL_34:
    v46 = [MEMORY[0x1E4FB15E0] layoutAttributesForCellWithIndexPath:v32];
    objc_msgSend(v46, "setSize:", v34, v36);
    objc_msgSend(v46, "setFrame:", v29, v28 + v30, v34, v36);
    objc_msgSend(v46, "setZIndex:", -[PKDashboardPassFlowLayout _indexPathIsPassGroupIndexPath:](self, "_indexPathIsPassGroupIndexPath:", v32));
    [v75 addObject:v46];
    [v77 addObject:v46];
    if (!v39) {
      double v31 = v34;
    }
    double v47 = -0.0;
    if (v39) {
      double v48 = -0.0;
    }
    else {
      double v48 = v36;
    }
    double v30 = v48 + v30;
    if (v39) {
      double v47 = v34;
    }
    double v29 = v29 + v47;

    ++v23;
    double v27 = v36;
  }
  while (v14 != v23);
  if ([v77 count])
  {
    PKFloatRoundToPixel();
    double v50 = v49;
    v51 = (void *)[v77 copy];
    [(PKDashboardPassFlowLayout *)self _adjustItems:v51 withLateralMove:v50];

    [v77 removeAllObjects];
  }
  if (v30 <= 0.0) {
    double v52 = v36;
  }
  else {
    double v52 = v30;
  }
  v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v75, "count"));
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v54 = v75;
  uint64_t v55 = [v54 countByEnumeratingWithState:&v80 objects:v87 count:16];
  if (v55)
  {
    uint64_t v56 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v81 != v56) {
          objc_enumerationMutation(v54);
        }
        v58 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        v59 = (void *)MEMORY[0x1E4FB1320];
        [v58 frame];
        v64 = objc_msgSend(v59, "customItemWithFrame:zIndex:", objc_msgSend(v58, "zIndex"), v60, v61, v62, v63);
        [v53 addObject:v64];
      }
      uint64_t v55 = [v54 countByEnumeratingWithState:&v80 objects:v87 count:16];
    }
    while (v55);
  }

  v19 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  v65 = [MEMORY[0x1E4FB1308] absoluteDimension:v28 + v52];
  v66 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v19 heightDimension:v65];
  v67 = (void *)MEMORY[0x1E4FB1318];
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __68__PKDashboardPassFlowLayout_layoutSectionAtIndex_layoutEnvironment___block_invoke_2;
  v78[3] = &unk_1E59D8A98;
  id v79 = v53;
  id v68 = v53;
  v69 = [v67 customGroupWithLayoutSize:v66 itemProvider:v78];
  v70 = [MEMORY[0x1E4FB1330] sectionWithGroup:v69];
  objc_msgSend(v70, "setContentInsets:", v72, 0.0, 16.0, 0.0);

LABEL_65:
LABEL_66:

  return v70;
}

id __68__PKDashboardPassFlowLayout_layoutSectionAtIndex_layoutEnvironment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained collectionView];
  objc_super v6 = [v5 delegate];

  double v7 = [WeakRetained collectionView];
  double v8 = [v6 collectionView:v7 layout:WeakRetained trailingSwipeActionsConfigurationForItemAtIndexPath:v3];

  return v8;
}

id __68__PKDashboardPassFlowLayout_layoutSectionAtIndex_layoutEnvironment___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)_adjustItems:(id)a3 withLateralMove:(double)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v10 frame];
        [v10 setFrame:v11 + a4];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double y = a3.origin.y;
  id v5 = [(PKDashboardPassFlowLayout *)self collectionView];
  uint64_t v6 = v5;
  p_userIsHoldingCardInCurrentDrag = &self->_userIsHoldingCardInCurrentDrag;
  if (self->_userIsHoldingCardInCurrentDrag)
  {
    int v8 = 1;
  }
  else
  {
    if (([v5 isDragging] & 1) == 0)
    {
      LOBYTE(v8) = 0;
      p_userIsActivelyDragging = &self->_userIsActivelyDragging;
      goto LABEL_11;
    }
    int v8 = [v6 isDecelerating] ^ 1;
  }
  p_userIsActivelyDragging = &self->_userIsActivelyDragging;
  if (!self->_userIsActivelyDragging && v8 != 0)
  {
    self->_BOOL currentDraggingWentBelowThreshold = 0;
    self->_userWasHoldingCard = *p_userIsHoldingCardInCurrentDrag;
    LOBYTE(v8) = 1;
  }
LABEL_11:
  BOOL *p_userIsActivelyDragging = v8;
  [v6 adjustedContentInset];
  double v12 = -v11;
  BOOL v13 = !*p_userIsActivelyDragging && y < v12;
  if (v13 && !self->_currentDraggingWentBelowThreshold) {
    self->_bouncing = 1;
  }
  if (y >= v12)
  {
    BOOL currentDraggingWentBelowThreshold = 0;
    self->_bouncing = 0;
    goto LABEL_26;
  }
  if (self->_bouncing)
  {
    BOOL currentDraggingWentBelowThreshold = 0;
    goto LABEL_26;
  }
  if (!*p_userIsActivelyDragging)
  {
    BOOL currentDraggingWentBelowThreshold = self->_currentDraggingWentBelowThreshold;
    if (!currentDraggingWentBelowThreshold) {
      goto LABEL_26;
    }
    p_userIsHoldingCardInCurrentDrag = &self->_userWasHoldingCard;
  }
  BOOL currentDraggingWentBelowThreshold = !*p_userIsHoldingCardInCurrentDrag;
  self->_BOOL currentDraggingWentBelowThreshold = 1;
LABEL_26:
  BOOL needsCustomLocation = self->_needsCustomLocation;
  self->_BOOL needsCustomLocation = currentDraggingWentBelowThreshold;
  BOOL v16 = needsCustomLocation || currentDraggingWentBelowThreshold;

  return v16;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PKDashboardPassFlowLayout;
  uint64_t v4 = -[PKDashboardPassFlowLayout invalidationContextForBoundsChange:](&v8, sel_invalidationContextForBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_needsCustomLocation)
  {
    id v5 = [(PKDashboardPassFlowLayout *)self _indexPathForPassGroup];
    v9[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v4 invalidateItemsAtIndexPaths:v6];
  }

  return v4;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKDashboardPassFlowLayout;
  uint64_t v4 = [(PKDashboardPassFlowLayout *)&v7 layoutAttributesForItemAtIndexPath:a3];
  id v5 = [(PKDashboardPassFlowLayout *)self _modifiedLayoutAttributes:v4];

  return v5;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKDashboardPassFlowLayout;
  uint64_t v4 = -[PKDashboardPassFlowLayout layoutAttributesForElementsInRect:](&v10, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v5 = (void *)[v4 mutableCopy];

  if ([v5 count])
  {
    unint64_t v6 = 0;
    do
    {
      objc_super v7 = [v5 objectAtIndexedSubscript:v6];
      objc_super v8 = [(PKDashboardPassFlowLayout *)self _modifiedLayoutAttributes:v7];

      [v5 setObject:v8 atIndexedSubscript:v6];
      ++v6;
    }
    while (v6 < [v5 count]);
  }

  return v5;
}

- (CGSize)collectionViewContentSize
{
  v13.receiver = self;
  v13.super_class = (Class)PKDashboardPassFlowLayout;
  [(PKDashboardPassFlowLayout *)&v13 collectionViewContentSize];
  double v4 = v3;
  double v6 = v5;
  if (!self->_cellsPresented)
  {
    objc_super v7 = [(PKDashboardPassFlowLayout *)self collectionView];
    [v7 bounds];
    double v9 = v8 - self->_passCellSize.height;
    [v7 safeAreaInsets];
    double v6 = v6 - (v9 - v10 + -16.0);
  }
  double v11 = v4;
  double v12 = v6;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)revealContentAnimated:(BOOL)a3
{
  if (!self->_cellsPresented)
  {
    self->_hideCellsDuringDismissal = 0;
    self->_cellsPresented = 1;
  }
}

- (void)hideContent
{
  if (!self->_hideCellsDuringDismissal)
  {
    self->_cellsPresented = 0;
    self->_hideCellsDuringDismissal = 1;
  }
}

- (BOOL)_indexPathIsPassGroupIndexPath:(id)a3
{
  id v3 = a3;
  if ([v3 section]) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [v3 row] == 0;
  }

  return v4;
}

- (id)_indexPathForPassGroup
{
  return (id)[MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
}

- (id)_modifiedLayoutAttributes:(id)a3
{
  id v4 = a3;
  double v5 = [(PKDashboardPassFlowLayout *)self collectionView];
  double v6 = (void *)[v4 copy];

  [v6 frame];
  double v8 = v7;
  double topMarginInFirstSection = v9;
  double v12 = v11;
  double v14 = v13;
  [v6 alpha];
  double v16 = v15;
  uint64_t v17 = [v6 indexPath];
  if ([(PKDashboardPassFlowLayout *)self _indexPathIsPassGroupIndexPath:v17])
  {
    uint64_t v18 = [v6 representedElementCategory];

    if (!v18)
    {
      double topMarginInFirstSection = self->_topMarginInFirstSection;
      if (!self->_needsCustomLocation) {
        goto LABEL_13;
      }
      [v5 contentOffset];
      double v20 = v19;
      [v5 adjustedContentInset];
      double v22 = v20 + v21;
      goto LABEL_12;
    }
  }
  else
  {
  }
  if (self->_hideCellsDuringDismissal && !self->_fade)
  {
    [v5 bounds];
    double v24 = v23;
    [v5 safeAreaInsets];
    double v22 = v24 - v25 - self->_topMarginInFirstSection - self->_passCellSize.height;
LABEL_12:
    double topMarginInFirstSection = topMarginInFirstSection + v22;
    goto LABEL_13;
  }
  if (!self->_cellsPresented) {
    double v16 = 0.0;
  }
LABEL_13:
  objc_msgSend(v6, "setFrame:", v8, topMarginInFirstSection, v12, v14);
  [v6 setAlpha:v16];

  return v6;
}

- (void)passPanDidBegin
{
  self->_userIsHoldingCardInCurrentDrag = 1;
}

- (void)passPanDidEnd
{
  self->_userIsHoldingCardInCurrentDrag = 0;
}

- (BOOL)fade
{
  return self->_fade;
}

- (void)setFade:(BOOL)a3
{
  self->_fade = a3;
}

@end