@interface PKHeaderVerticalScrollingLayout
- (BOOL)_indexPathIsHeaderIndexPath:(id)a3;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (BOOL)useStickyHeader;
- (PKHeaderVerticalScrollingLayout)init;
- (id)_customAttributesForStickyHeader:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutSectionAtIndex:(int64_t)a3 layoutEnvironment:(id)a4;
- (unint64_t)titleInset;
- (void)prepareLayout;
- (void)setTitleInset:(unint64_t)a3;
- (void)setUseStickyHeader:(BOOL)a3;
@end

@implementation PKHeaderVerticalScrollingLayout

- (PKHeaderVerticalScrollingLayout)init
{
  uint64_t v9 = 0;
  v10 = (id *)&v9;
  uint64_t v11 = 0x3042000000;
  v12 = __Block_byref_object_copy__48;
  v13 = __Block_byref_object_dispose__48;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__PKHeaderVerticalScrollingLayout_init__block_invoke;
  v8[3] = &unk_1E59D8A70;
  v8[4] = &v9;
  v7.receiver = self;
  v7.super_class = (Class)PKHeaderVerticalScrollingLayout;
  v2 = [(PKHeaderVerticalScrollingLayout *)&v7 initWithSectionProvider:v8];
  if (v2)
  {
    +[PKDashboardCollectionViewCell defaultHorizontalInset];
    v2->_horizontalInset = v3;
    uint64_t v4 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    headerIndexPath = v2->_headerIndexPath;
    v2->_headerIndexPath = (NSIndexPath *)v4;

    objc_storeWeak(v10 + 5, v2);
  }
  _Block_object_dispose(&v9, 8);
  objc_destroyWeak(&v14);
  return v2;
}

id __39__PKHeaderVerticalScrollingLayout_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  objc_super v7 = [WeakRetained layoutSectionAtIndex:a2 layoutEnvironment:v5];

  return v7;
}

- (void)prepareLayout
{
  double v3 = [(PKHeaderVerticalScrollingLayout *)self collectionView];
  uint64_t v4 = [v3 delegate];
  [v4 collectionView:v3 layout:self sizeForItemAtIndexPath:self->_headerIndexPath];
  self->_headerHeight = v5;
  v6.receiver = self;
  v6.super_class = (Class)PKHeaderVerticalScrollingLayout;
  [(PKHeaderVerticalScrollingLayout *)&v6 prepareLayout];
}

- (id)layoutSectionAtIndex:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6 = a4;
  objc_super v7 = [(PKHeaderVerticalScrollingLayout *)self collectionView];
  v8 = [v7 delegate];
  uint64_t v9 = [v7 dataSource];
  uint64_t v10 = [v9 collectionView:v7 numberOfItemsInSection:a3];

  char v11 = objc_opt_respondsToSelector();
  char v12 = objc_opt_respondsToSelector();
  char v13 = objc_opt_respondsToSelector();
  char v14 = objc_opt_respondsToSelector();
  if (v10 < 1)
  {
    v34 = 0;
    goto LABEL_28;
  }
  char v15 = v14;
  double v17 = 16.0;
  if ([(NSIndexPath *)self->_headerIndexPath section] == a3)
  {
    unint64_t titleInset = self->_titleInset;
    double v16 = 16.0;
    if (titleInset == 1) {
      double v16 = 7.0;
    }
    if (titleInset == 2) {
      double v17 = 29.0;
    }
    else {
      double v17 = v16;
    }
  }
  if ((v11 & 1) == 0
    || !objc_msgSend(v8, "collectionView:layout:isListSectionAtIndex:", v7, self, a3, v16))
  {
    objc_msgSend(v7, "frame", v16);
    [v7 safeAreaInsets];
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v23 = 0;
    double v24 = 0.0;
    do
    {
      v25 = [MEMORY[0x1E4F28D58] indexPathForRow:v23 inSection:a3];
      [v8 collectionView:v7 layout:self sizeForItemAtIndexPath:v25];
      double v27 = v26;
      PKFloatRoundToPixel();
      v28 = objc_msgSend(MEMORY[0x1E4FB1320], "customItemWithFrame:");
      [v22 addObject:v28];

      double v24 = v24 + v27;
      ++v23;
    }
    while (v10 != v23);
    v19 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    v29 = [MEMORY[0x1E4FB1308] absoluteDimension:v24];
    v30 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v19 heightDimension:v29];
    v31 = (void *)MEMORY[0x1E4FB1318];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __74__PKHeaderVerticalScrollingLayout_layoutSectionAtIndex_layoutEnvironment___block_invoke_2;
    v36[3] = &unk_1E59DB9D8;
    id v37 = v22;
    id v32 = v22;
    v33 = [v31 customGroupWithLayoutSize:v30 itemProvider:v36];
    v34 = [MEMORY[0x1E4FB1330] sectionWithGroup:v33];
    objc_msgSend(v34, "setContentInsets:", 0.0, 0.0, v17, 0.0);

    goto LABEL_27;
  }
  v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  if (v12)
  {
    int v20 = [v8 collectionView:v7 layout:self hasHeaderForSectionAtIndex:a3];
    if ((v13 & 1) == 0) {
      goto LABEL_12;
    }
LABEL_19:
    int v21 = [v8 collectionView:v7 layout:self hasFooterForSectionAtIndex:a3];
    if (!v20) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  int v20 = 0;
  if (v13) {
    goto LABEL_19;
  }
LABEL_12:
  int v21 = 0;
  if (v20) {
LABEL_20:
  }
    [v19 setHeaderMode:1];
LABEL_21:
  if (!v21)
  {
    if ((v15 & 1) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  [v19 setFooterMode:1];
  if (v15)
  {
LABEL_25:
    objc_initWeak(location, self);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __74__PKHeaderVerticalScrollingLayout_layoutSectionAtIndex_layoutEnvironment___block_invoke;
    v38[3] = &unk_1E59CDCD0;
    objc_copyWeak(&v39, location);
    [v19 setTrailingSwipeActionsConfigurationProvider:v38];
    objc_destroyWeak(&v39);
    objc_destroyWeak(location);
  }
LABEL_26:
  v29 = (void *)[objc_alloc(MEMORY[0x1E4FB1958]) initWithListAppearance:2];
  objc_msgSend(v29, "setTopSeparatorInsets:", 0.0, 14.0, 0.0, 0.0);
  objc_msgSend(v29, "setBottomSeparatorInsets:", 0.0, 14.0, 0.0, 0.0);
  [v19 setSeparatorConfiguration:v29];
  v34 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v19 layoutEnvironment:v6];
  objc_msgSend(v34, "setContentInsets:", 0.0, self->_horizontalInset, v17, self->_horizontalInset);
LABEL_27:

LABEL_28:

  return v34;
}

id __74__PKHeaderVerticalScrollingLayout_layoutSectionAtIndex_layoutEnvironment___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v5 = [WeakRetained collectionView];
  id v6 = [v5 delegate];

  objc_super v7 = [WeakRetained collectionView];
  v8 = [v6 collectionView:v7 layout:WeakRetained trailingSwipeActionsConfigurationForItemAtIndexPath:v3];

  return v8;
}

id __74__PKHeaderVerticalScrollingLayout_layoutSectionAtIndex_layoutEnvironment___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double y = a3.origin.y;
  double v5 = [(PKHeaderVerticalScrollingLayout *)self collectionView];
  id v6 = v5;
  if (self->_useStickyHeader)
  {
    [v5 adjustedContentInset];
    BOOL v8 = y < -v7;
  }
  else
  {
    BOOL v8 = 0;
  }
  self->_needsCustomLocation = v8;

  return v8;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)PKHeaderVerticalScrollingLayout;
  uint64_t v4 = -[PKHeaderVerticalScrollingLayout invalidationContextForBoundsChange:](&v7, sel_invalidationContextForBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (self->_needsCustomLocation)
  {
    v8[0] = self->_headerIndexPath;
    double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v4 invalidateItemsAtIndexPaths:v5];
  }

  return v4;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKHeaderVerticalScrollingLayout;
  uint64_t v4 = [(PKHeaderVerticalScrollingLayout *)&v10 layoutAttributesForItemAtIndexPath:a3];
  double v5 = [v4 indexPath];
  if (![(PKHeaderVerticalScrollingLayout *)self _indexPathIsHeaderIndexPath:v5]
    || [v4 representedElementCategory])
  {

LABEL_4:
    id v6 = v4;
    goto LABEL_5;
  }
  BOOL needsCustomLocation = self->_needsCustomLocation;

  if (!needsCustomLocation) {
    goto LABEL_4;
  }
  id v6 = [(PKHeaderVerticalScrollingLayout *)self _customAttributesForStickyHeader:v4];
LABEL_5:
  objc_super v7 = v6;

  return v7;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)PKHeaderVerticalScrollingLayout;
  uint64_t v4 = -[PKHeaderVerticalScrollingLayout layoutAttributesForElementsInRect:](&v20, sel_layoutAttributesForElementsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = (void *)[v4 mutableCopy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v12 = objc_msgSend(v11, "indexPath", (void)v16);
        if ([(PKHeaderVerticalScrollingLayout *)self _indexPathIsHeaderIndexPath:v12]
          && ![v11 representedElementCategory])
        {
          BOOL needsCustomLocation = self->_needsCustomLocation;

          if (!needsCustomLocation) {
            continue;
          }
          uint64_t v14 = [v5 indexOfObject:v11];
          char v12 = [(PKHeaderVerticalScrollingLayout *)self _customAttributesForStickyHeader:v11];
          [v5 replaceObjectAtIndex:v14 withObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)setUseStickyHeader:(BOOL)a3
{
  if (((!self->_useStickyHeader ^ a3) & 1) == 0)
  {
    self->_useStickyHeader = a3;
    [(PKHeaderVerticalScrollingLayout *)self invalidateLayout];
  }
}

- (id)_customAttributesForStickyHeader:(id)a3
{
  id v4 = a3;
  double v5 = [(PKHeaderVerticalScrollingLayout *)self collectionView];
  [v5 contentOffset];
  double v7 = v6;

  [v4 frame];
  objc_msgSend(v4, "setFrame:", 0.0, v7);

  return v4;
}

- (BOOL)_indexPathIsHeaderIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  if (v5 == [(NSIndexPath *)self->_headerIndexPath section])
  {
    uint64_t v6 = [v4 item];
    BOOL v7 = v6 == [(NSIndexPath *)self->_headerIndexPath item];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)useStickyHeader
{
  return self->_useStickyHeader;
}

- (unint64_t)titleInset
{
  return self->_titleInset;
}

- (void)setTitleInset:(unint64_t)a3
{
  self->_unint64_t titleInset = a3;
}

- (void).cxx_destruct
{
}

@end