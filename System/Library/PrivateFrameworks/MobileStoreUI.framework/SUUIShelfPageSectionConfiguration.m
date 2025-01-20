@interface SUUIShelfPageSectionConfiguration
- (BOOL)isTopSection;
- (BOOL)needsShelfCollectionViewLayout;
- (BOOL)needsShelfCollectionViewReload;
- (BOOL)prefetchResourcesForShelfItemViewElement:(id)a3 reason:(int64_t)a4;
- (BOOL)rendersWithParallax;
- (BOOL)rendersWithPerspective;
- (BOOL)supportsDuplicateShelfItems;
- (BOOL)wantsZoomingShelfLayout;
- (CGSize)cellSizeForShelfViewElement:(id)a3 indexPath:(id)a4 numberOfShelfItems:(int64_t)a5;
- (Class)_cellClassForEffectiveShelfItemViewElement:(id)a3;
- (Class)_lockupCellClassWithLockup:(id)a3;
- (IKViewElementStyle)shelfViewElementStyle;
- (SUUIShelfLayoutData)shelfLayoutData;
- (SUUIShelfPageSectionConfigurationDataSource)dataSource;
- (SUUIStorePageSectionContext)pageSectionContext;
- (SUUIViewElementLayoutContext)cellLayoutContext;
- (UICollectionView)existingShelfCollectionView;
- (UICollectionView)shelfCollectionView;
- (UICollectionViewDataSource)shelfCollectionViewDataSource;
- (UICollectionViewDelegate)shelfCollectionViewDelegate;
- (UIColor)shelfCollectionViewBackgroundColor;
- (UIEdgeInsets)sectionContentInsetAdjustedFromValue:(UIEdgeInsets)a3 forShelfViewElement:(id)a4 withSectionIndex:(int64_t)a5;
- (double)_columnSpacingForShelfItemViewElements:(id)a3;
- (double)_perspectiveHeightForContentSize:(double)a3;
- (double)zoomingShelfLayoutFocusedItemHorizontalCenterOffset;
- (double)zoomingShelfLayoutInterItemSpacing;
- (double)zoomingShelfLayoutItemWidth;
- (double)zoomingShelfLayoutScaledItemWidth;
- (id)_dequeueCellForLockup:(id)a3 collectionView:(id)a4 indexPath:(id)a5;
- (id)_reloadShelfLayoutDataWithNumberOfShelfItems:(int64_t)a3;
- (id)_shelfItemViewElementAtIndex:(int64_t)a3;
- (id)_styledShelfCollectionViewLayoutForExistingLayout:(id)a3;
- (id)actualIndexPathOfShelfItemClosestToVisibleBoundsForNormalizedIndexPath:(id)a3 numberOfShelfItems:(unint64_t)a4;
- (id)backgroundColorForShelfViewElement:(id)a3;
- (id)cellForShelfItemViewElement:(id)a3 indexPath:(id)a4;
- (id)cellForShelfViewElement:(id)a3 indexPath:(id)a4;
- (id)effectiveViewElementForShelfItemViewElement:(id)a3;
- (id)normalizedShelfItemIndexPathFromActualIndexPath:(id)a3 numberOfShelfItems:(unint64_t)a4;
- (int64_t)lockupTypeForLockup:(id)a3;
- (int64_t)numberOfSectionCells;
- (int64_t)sectionIndex;
- (unint64_t)numberOfCellsForNumberOfShelfItems:(unint64_t)a3;
- (unint64_t)numberOfIterations;
- (void)_updateShelfLayoutDataContentInset;
- (void)registerReusableClassesForCollectionView:(id)a3;
- (void)reloadLockupTypeForShelfViewElement:(id)a3;
- (void)reloadShelfLayoutDataForShelfViewElement:(id)a3 withShelfItemViewElements:(id)a4 requestCellLayouts:(BOOL)a5 numberOfShelfItems:(int64_t)a6;
- (void)requestCellLayoutForViewElement:(id)a3 withColumnWidth:(double)a4;
- (void)setCellLayoutContext:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setNeedsShelfCollectionViewLayout:(BOOL)a3;
- (void)setNeedsShelfCollectionViewReload:(BOOL)a3;
- (void)setPageSectionContext:(id)a3;
- (void)setRendersWithParallax:(BOOL)a3;
- (void)setRendersWithPerspective:(BOOL)a3;
- (void)setSectionIndex:(int64_t)a3;
- (void)setShelfCollectionViewBackgroundColor:(id)a3;
- (void)setShelfCollectionViewDataSource:(id)a3;
- (void)setShelfCollectionViewDelegate:(id)a3;
- (void)setShelfViewElementStyle:(id)a3;
- (void)setTopSection:(BOOL)a3;
- (void)shelfItemsCollectionView:(id)a3 willApplyLayoutAttributes:(id)a4 forViewElement:(id)a5 withItemIndex:(int64_t)a6;
@end

@implementation SUUIShelfPageSectionConfiguration

- (UICollectionView)existingShelfCollectionView
{
  return self->_shelfCollectionView;
}

- (unint64_t)numberOfIterations
{
  return 1;
}

- (UICollectionView)shelfCollectionView
{
  shelfCollectionView = self->_shelfCollectionView;
  if (!shelfCollectionView)
  {
    v4 = [(SUUIShelfPageSectionConfiguration *)self _styledShelfCollectionViewLayoutForExistingLayout:0];
    id v5 = objc_alloc(MEMORY[0x263F82528]);
    v6 = (UICollectionView *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    v7 = self->_shelfCollectionView;
    self->_shelfCollectionView = v6;

    [(UICollectionView *)self->_shelfCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x27050B090];
    [(UICollectionView *)self->_shelfCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270502AB0];
    [(UICollectionView *)self->_shelfCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270508F30];
    [(UICollectionView *)self->_shelfCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x2705094D0];
    [(UICollectionView *)self->_shelfCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x2704FE9D0];
    [(UICollectionView *)self->_shelfCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x27050B010];
    [(UICollectionView *)self->_shelfCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270503310];
    [(UICollectionView *)self->_shelfCollectionView setAlwaysBounceHorizontal:1];
    [(UICollectionView *)self->_shelfCollectionView setBackgroundColor:self->_shelfCollectionViewBackgroundColor];
    -[UICollectionView setClipsToBounds:](self->_shelfCollectionView, "setClipsToBounds:", [(id)objc_opt_class() collectionViewCanClipToBounds]);
    [(UICollectionView *)self->_shelfCollectionView setDataSource:self->_shelfCollectionViewDataSource];
    v8 = self->_shelfCollectionView;
    [(id)objc_opt_class() snapToBoundariesDecelerationRate];
    -[UICollectionView setDecelerationRate:](v8, "setDecelerationRate:");
    [(UICollectionView *)self->_shelfCollectionView setDelegate:self->_shelfCollectionViewDelegate];
    [(UICollectionView *)self->_shelfCollectionView setScrollsToTop:0];
    [(UICollectionView *)self->_shelfCollectionView setShowsHorizontalScrollIndicator:0];
    [(UICollectionView *)self->_shelfCollectionView setShowsVerticalScrollIndicator:0];
    [(UICollectionView *)self->_shelfCollectionView setPrefetchingEnabled:0];
    if (self->_rendersWithPerspective) {
      [(UICollectionView *)self->_shelfCollectionView setClipsToBounds:0];
    }

    shelfCollectionView = self->_shelfCollectionView;
  }
  return shelfCollectionView;
}

- (void)setShelfCollectionViewBackgroundColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_shelfCollectionViewBackgroundColor != v5)
  {
    objc_storeStrong((id *)&self->_shelfCollectionViewBackgroundColor, a3);
    [(UICollectionView *)self->_shelfCollectionView setBackgroundColor:v5];
  }
}

- (void)setShelfCollectionViewDataSource:(id)a3
{
  if (self->_shelfCollectionViewDataSource != a3)
  {
    self->_shelfCollectionViewDataSource = (UICollectionViewDataSource *)a3;
    -[UICollectionView setDataSource:](self->_shelfCollectionView, "setDataSource:");
  }
}

- (void)setShelfCollectionViewDelegate:(id)a3
{
  if (self->_shelfCollectionViewDelegate != a3)
  {
    self->_shelfCollectionViewDelegate = (UICollectionViewDelegate *)a3;
    -[UICollectionView setDelegate:](self->_shelfCollectionView, "setDelegate:");
  }
}

- (void)setShelfViewElementStyle:(id)a3
{
  v19 = (IKViewElementStyle *)a3;
  if (self->_shelfViewElementStyle != v19)
  {
    objc_storeStrong((id *)&self->_shelfViewElementStyle, a3);
    id v5 = [(IKViewElementStyle *)self->_shelfViewElementStyle valueForStyle:@"itml-shelf-zooming-layout-peeking-item-width"];
    [v5 floatValue];
    double v7 = v6;

    v8 = [(IKViewElementStyle *)self->_shelfViewElementStyle valueForStyle:@"itml-shelf-zooming-layout-inter-item-spacing"];
    [v8 floatValue];
    self->_zoomingShelfLayoutInterItemSpacing = v9;

    v10 = [(IKViewElementStyle *)self->_shelfViewElementStyle valueForStyle:@"itml-shelf-zooming-layout-item-width"];
    [v10 floatValue];
    self->_zoomingShelfLayoutItemWidth = v11;

    v12 = [(IKViewElementStyle *)self->_shelfViewElementStyle valueForStyle:@"itml-shelf-zooming-layout-zoomed-item-width"];
    [v12 floatValue];
    self->_zoomingShelfLayoutScaledItemWidth = v13;

    self->_zoomingShelfLayoutFocusedItemHorizontalCenterOffset = self->_zoomingShelfLayoutInterItemSpacing
                                                               + v7
                                                               + self->_zoomingShelfLayoutScaledItemWidth * 0.5;
    v14 = [(IKViewElementStyle *)self->_shelfViewElementStyle valueForStyle:@"itml-shelf-layout"];
    self->_wantsZoomingShelfLayout = [v14 isEqualToString:@"zooming"];

    [(SUUIShelfPageSectionConfiguration *)self _updateShelfLayoutDataContentInset];
    shelfCollectionView = self->_shelfCollectionView;
    if (shelfCollectionView)
    {
      v16 = [(UICollectionView *)shelfCollectionView collectionViewLayout];
      v17 = [(SUUIShelfPageSectionConfiguration *)self _styledShelfCollectionViewLayoutForExistingLayout:v16];
      if (v16 != v17)
      {
        [(UICollectionView *)self->_shelfCollectionView setCollectionViewLayout:v17];
        v18 = self->_shelfCollectionView;
        [(id)objc_opt_class() snapToBoundariesDecelerationRate];
        -[UICollectionView setDecelerationRate:](v18, "setDecelerationRate:");
        -[UICollectionView setClipsToBounds:](self->_shelfCollectionView, "setClipsToBounds:", [(id)objc_opt_class() collectionViewCanClipToBounds]);
      }
    }
  }
}

- (id)actualIndexPathOfShelfItemClosestToVisibleBoundsForNormalizedIndexPath:(id)a3 numberOfShelfItems:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(SUUIShelfPageSectionConfiguration *)self numberOfIterations] == 1)
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = [v6 item];
    float v9 = [(SUUIShelfPageSectionConfiguration *)self shelfCollectionView];
    [v9 indexPathsForVisibleItems];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
LABEL_5:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v27 + 1) + 8 * v14);
        if (objc_msgSend(v15, "item", (void)v27) % a4 == v8) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v12) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      id v7 = v15;

      if (v7) {
        goto LABEL_24;
      }
    }
    else
    {
LABEL_11:
    }
    if (objc_msgSend(v10, "count", (void)v27))
    {
      v16 = [v10 sortedArrayUsingComparator:&__block_literal_global_23];

      v17 = [v16 firstObject];
      v18 = [v16 lastObject];
      v19 = v17;
      if (v17 != v18)
      {
        unint64_t v20 = [v17 item] % a4;
        unint64_t v21 = [v18 item] % a4;
        unint64_t v22 = v20 - v8;
        if ((uint64_t)(v20 - v8) < 0) {
          unint64_t v22 = v8 - v20;
        }
        uint64_t v23 = v21 - v8;
        if (v23 < 0) {
          uint64_t v23 = -v23;
        }
        if (v22 >= v23) {
          v19 = v18;
        }
        else {
          v19 = v17;
        }
      }
      id v24 = v19;
      unint64_t v25 = [v24 item];
      objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", v8 + v25 / a4 * a4, objc_msgSend(v6, "section"));
      id v7 = (id)objc_claimAutoreleasedReturnValue();

      id v10 = v16;
    }
    else
    {
      id v7 = v6;
    }
LABEL_24:
  }
  return v7;
}

uint64_t __127__SUUIShelfPageSectionConfiguration_actualIndexPathOfShelfItemClosestToVisibleBoundsForNormalizedIndexPath_numberOfShelfItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 item];
  uint64_t v6 = [v4 item];

  uint64_t v7 = -1;
  if (v5 >= v6) {
    uint64_t v7 = 1;
  }
  if (v5 == v6) {
    return 0;
  }
  else {
    return v7;
  }
}

- (id)backgroundColorForShelfViewElement:(id)a3
{
  v3 = [a3 style];
  id v4 = [v3 ikBackgroundColor];
  uint64_t v5 = [v4 color];

  return v5;
}

- (id)cellForShelfViewElement:(id)a3 indexPath:(id)a4
{
  pageSectionContext = self->_pageSectionContext;
  id v6 = a4;
  uint64_t v7 = [(SUUIStorePageSectionContext *)pageSectionContext collectionView];
  uint64_t v8 = [v7 dequeueReusableCellWithReuseIdentifier:0x270504F70 forIndexPath:v6];

  float v9 = [(SUUIShelfPageSectionConfiguration *)self shelfCollectionView];
  [v8 setCollectionView:v9];
  if (self->_needsShelfCollectionViewReload)
  {
    [v9 reloadData];
    self->_needsShelfCollectionViewReload = 0;
  }
  if (self->_rendersWithPerspective)
  {
    [(SUUIShelfLayoutData *)self->_shelfLayoutData totalContentSize];
    [(SUUIShelfPageSectionConfiguration *)self _perspectiveHeightForContentSize:v10];
    objc_msgSend(v8, "setContentInset:");
    [v8 setRendersWithPerspective:1];
  }
  else
  {
    objc_msgSend(v8, "setContentInset:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
    [v8 setRendersWithPerspective:0];
    [v8 setRendersWithParallax:0];
  }

  return v8;
}

- (CGSize)cellSizeForShelfViewElement:(id)a3 indexPath:(id)a4 numberOfShelfItems:(int64_t)a5
{
  [(SUUIStorePageSectionContext *)self->_pageSectionContext activePageWidth];
  double v8 = v7;
  if (self->_needsShelfCollectionViewLayout)
  {
    id v9 = [(SUUIShelfPageSectionConfiguration *)self _reloadShelfLayoutDataWithNumberOfShelfItems:a5];
    self->_needsShelfCollectionViewLayout = 0;
  }
  [(SUUIShelfLayoutData *)self->_shelfLayoutData totalContentSize];
  double v11 = v10;
  if (self->_rendersWithPerspective)
  {
    [(SUUIShelfPageSectionConfiguration *)self _perspectiveHeightForContentSize:v10];
    double v11 = v11 + v12;
  }
  if (self->_wantsZoomingShelfLayout) {
    double v11 = v11 + self->_zoomingShelfLayoutScaledItemWidth - self->_zoomingShelfLayoutItemWidth;
  }
  double v13 = v8;
  double v14 = v11;
  result.height = v14;
  result.width = v13;
  return result;
}

- (id)cellForShelfItemViewElement:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(SUUIShelfPageSectionConfiguration *)self shelfCollectionView];
  id v9 = [(SUUIShelfPageSectionConfiguration *)self effectiveViewElementForShelfItemViewElement:v6];
  uint64_t v10 = [v9 elementType];
  double v11 = 0;
  if (v10 <= 48)
  {
    if (v10 == 14)
    {
      if ([v6 cardType] != 3)
      {
        double v11 = [v8 dequeueReusableCellWithReuseIdentifier:0x27050B090 forIndexPath:v7];
        [v11 setArtworkBoundingSize:0];
        goto LABEL_14;
      }
      uint64_t v12 = 0x270508F30;
    }
    else
    {
      if (v10 != 28) {
        goto LABEL_14;
      }
      uint64_t v12 = 0x270502AB0;
    }
    double v11 = [v8 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:v7];
    goto LABEL_14;
  }
  if (v10 == 49)
  {
LABEL_5:
    double v11 = [v8 dequeueReusableCellWithReuseIdentifier:0x2704FE9D0 forIndexPath:v7];
    [v11 setShowsReflectionImage:0];
    goto LABEL_14;
  }
  if (v10 != 66)
  {
    if (v10 != 152) {
      goto LABEL_14;
    }
    goto LABEL_5;
  }
  double v13 = [(SUUIShelfPageSectionConfiguration *)self shelfCollectionView];
  double v11 = [(SUUIShelfPageSectionConfiguration *)self _dequeueCellForLockup:v9 collectionView:v13 indexPath:v7];

LABEL_14:
  -[SUUIShelfLayoutData sizeForItemAtIndex:](self->_shelfLayoutData, "sizeForItemAtIndex:", [v7 item]);
  double v15 = v14;
  v16 = [v9 style];
  v17 = [v16 visibility];
  int v18 = [v17 isEqualToString:@"hidden"];

  if (v18) {
    v19 = 0;
  }
  else {
    v19 = v9;
  }
  [v11 reloadWithViewElement:v19 width:self->_cellLayoutContext context:v15];
  if (self->_rendersWithPerspective && [v11 conformsToProtocol:&unk_270640F38])
  {
    pageSectionContext = self->_pageSectionContext;
    id v21 = v11;
    unint64_t v22 = [(SUUIStorePageSectionContext *)pageSectionContext parentViewController];
    uint64_t v23 = [v22 view];

    [v21 setPerspectiveTargetView:v23];
    [v23 bounds];
    objc_msgSend(v21, "setVanishingPoint:", CGRectGetMidX(v26), -800.0);
  }
  return v11;
}

- (id)effectiveViewElementForShelfItemViewElement:(id)a3
{
  id v3 = a3;
  return v3;
}

- (int64_t)lockupTypeForLockup:(id)a3
{
  int64_t result = self->_lockupType;
  if (result == -1) {
    return [a3 lockupViewType];
  }
  return result;
}

- (id)normalizedShelfItemIndexPathFromActualIndexPath:(id)a3 numberOfShelfItems:(unint64_t)a4
{
  id v6 = a3;
  if ([(SUUIShelfPageSectionConfiguration *)self numberOfIterations] == 1)
  {
    id v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", objc_msgSend(v6, "item") % a4, objc_msgSend(v6, "section"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v8 = v7;

  return v8;
}

- (unint64_t)numberOfCellsForNumberOfShelfItems:(unint64_t)a3
{
  return [(SUUIShelfPageSectionConfiguration *)self numberOfIterations] * a3;
}

- (int64_t)numberOfSectionCells
{
  return 1;
}

- (BOOL)prefetchResourcesForShelfItemViewElement:(id)a3 reason:(int64_t)a4
{
  id v6 = [(SUUIShelfPageSectionConfiguration *)self effectiveViewElementForShelfItemViewElement:a3];
  LOBYTE(a4) = [(objc_class *)[(SUUIShelfPageSectionConfiguration *)self _cellClassForEffectiveShelfItemViewElement:v6] prefetchResourcesForViewElement:v6 reason:a4 context:self->_cellLayoutContext];

  return a4;
}

- (void)registerReusableClassesForCollectionView:(id)a3
{
  id v3 = a3;
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270504F70];
}

- (void)reloadLockupTypeForShelfViewElement:(id)a3
{
  id v4 = [a3 style];
  id v7 = [v4 lockupType];

  uint64_t v5 = v7;
  if (v7)
  {
    int64_t v6 = SUUILockupViewTypeForString(v7);
    uint64_t v5 = v7;
  }
  else
  {
    int64_t v6 = -1;
  }
  self->_lockupType = v6;
  MEMORY[0x270F9A758](v6, v5);
}

- (void)reloadShelfLayoutDataForShelfViewElement:(id)a3 withShelfItemViewElements:(id)a4 requestCellLayouts:(BOOL)a5 numberOfShelfItems:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [SUUIShelfLayoutData alloc];
  uint64_t v13 = [v11 numberOfRows];

  [(SUUIShelfPageSectionConfiguration *)self _columnSpacingForShelfItemViewElements:v10];
  double v15 = v14;

  v16 = [(SUUIShelfLayoutData *)v12 initWithNumberOfRows:v13 columnSpacing:v15];
  shelfLayoutData = self->_shelfLayoutData;
  self->_shelfLayoutData = v16;

  [(SUUIShelfPageSectionConfiguration *)self _updateShelfLayoutDataContentInset];
  int v18 = [(SUUIShelfPageSectionConfiguration *)self _reloadShelfLayoutDataWithNumberOfShelfItems:a6];
  if (v7)
  {
    unint64_t v19 = [(SUUIShelfPageSectionConfiguration *)self numberOfIterations];
    int64_t v20 = [(SUUIShelfLayoutData *)self->_shelfLayoutData numberOfRows];
    id v21 = self->_shelfLayoutData;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __142__SUUIShelfPageSectionConfiguration_reloadShelfLayoutDataForShelfViewElement_withShelfItemViewElements_requestCellLayouts_numberOfShelfItems___block_invoke;
    v23[3] = &unk_2654055F0;
    int64_t v26 = v20;
    int64_t v27 = a6;
    unint64_t v28 = v19;
    id v24 = v18;
    unint64_t v25 = self;
    [(SUUIShelfLayoutData *)v21 enumerateColumnsUsingBlock:v23];
  }
  unint64_t v22 = [(UICollectionView *)self->_shelfCollectionView collectionViewLayout];
  [v22 setLayoutData:self->_shelfLayoutData];
}

void __142__SUUIShelfPageSectionConfiguration_reloadShelfLayoutDataForShelfViewElement_withShelfItemViewElements_requestCellLayouts_numberOfShelfItems___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v3 * a2;
    do
    {
      uint64_t v8 = v7 + v6;
      uint64_t v9 = *(void *)(a1 + 56);
      if (v7 + v6 >= (unint64_t)(*(void *)(a1 + 64) * v9)) {
        break;
      }
      uint64_t v10 = v8 % v9;
      id v11 = *(void **)(a1 + 32);
      if (v11)
      {
        uint64_t v12 = [NSNumber numberWithInteger:v8 % v9];
        uint64_t v13 = [v11 objectForKey:v12];

        if (!v13) {
          continue;
        }
      }
      double v14 = [*(id *)(a1 + 40) _shelfItemViewElementAtIndex:v10];
      [*(id *)(a1 + 40) requestCellLayoutForViewElement:v14 withColumnWidth:a3];
      double v15 = *(void **)(a1 + 32);
      if (v15)
      {
        v16 = [NSNumber numberWithInteger:v10];
        [v15 removeObjectForKey:v16];
      }
      ++v6;
    }
    while (v6 < *(void *)(a1 + 48));
  }
}

- (void)requestCellLayoutForViewElement:(id)a3 withColumnWidth:(double)a4
{
  id v6 = [(SUUIShelfPageSectionConfiguration *)self effectiveViewElementForShelfItemViewElement:a3];
  [(objc_class *)[(SUUIShelfPageSectionConfiguration *)self _cellClassForEffectiveShelfItemViewElement:v6] requestLayoutForViewElement:v6 width:self->_cellLayoutContext context:a4];
}

- (UIEdgeInsets)sectionContentInsetAdjustedFromValue:(UIEdgeInsets)a3 forShelfViewElement:(id)a4 withSectionIndex:(int64_t)a5
{
  CGFloat right = a3.right;
  double bottom = a3.bottom;
  CGFloat left = a3.left;
  double top = a3.top;
  char v18 = 0;
  uint64_t v10 = [a4 style];
  double v11 = SUUIViewElementPaddingForStyle(v10, &v18);
  double v13 = v12;

  if (a5) {
    double v14 = top;
  }
  else {
    double v14 = bottom;
  }
  if (v18) {
    double v15 = v13;
  }
  else {
    double v15 = bottom;
  }
  if (v18) {
    double v14 = v11;
  }
  double v16 = left;
  double v17 = right;
  result.CGFloat right = v17;
  result.double bottom = v15;
  result.CGFloat left = v16;
  result.double top = v14;
  return result;
}

- (void)shelfItemsCollectionView:(id)a3 willApplyLayoutAttributes:(id)a4 forViewElement:(id)a5 withItemIndex:(int64_t)a6
{
  id v18 = a3;
  id v10 = a4;
  double v11 = [(SUUIShelfPageSectionConfiguration *)self effectiveViewElementForShelfItemViewElement:a5];
  double v12 = [v11 style];
  double v13 = [v12 ikBackgroundColor];
  double v14 = [v13 color];

  if (v14)
  {
    [v10 setBackgroundColor:v14];
  }
  else
  {
    double v15 = [v18 backgroundColor];
    [v10 setBackgroundColor:v15];
  }
  int64_t v16 = [(SUUIShelfLayoutData *)self->_shelfLayoutData numberOfRows];
  if (v16 == 1)
  {
    uint64_t v17 = 40;
  }
  else if (a6 % v16)
  {
    if (a6 % v16 == v16 - 1) {
      uint64_t v17 = 32;
    }
    else {
      uint64_t v17 = 16;
    }
  }
  else
  {
    uint64_t v17 = 8;
  }
  [v10 setPosition:v17];
}

- (BOOL)supportsDuplicateShelfItems
{
  return [(SUUIShelfPageSectionConfiguration *)self numberOfIterations] > 1;
}

- (Class)_cellClassForEffectiveShelfItemViewElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 elementType];
  id v6 = 0;
  if (v5 <= 48)
  {
    if (v5 != 14)
    {
      if (v5 == 28) {
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    [v4 cardType];
LABEL_11:
    id v6 = (objc_class *)objc_opt_class();
    goto LABEL_12;
  }
  switch(v5)
  {
    case 49:
      goto LABEL_11;
    case 66:
      id v6 = [(SUUIShelfPageSectionConfiguration *)self _lockupCellClassWithLockup:v4];
      break;
    case 152:
      goto LABEL_11;
  }
LABEL_12:
  uint64_t v7 = v6;

  return v7;
}

- (double)_columnSpacingForShelfItemViewElements:(id)a3
{
  id v4 = [(SUUIStorePageSectionContext *)self->_pageSectionContext clientContext];
  uint64_t v5 = SUUIUserInterfaceIdiom(v4);

  double result = 15.0;
  if (v5 == 1)
  {
    [(SUUIStorePageSectionContext *)self->_pageSectionContext activePageWidth];
    BOOL v8 = v7 < 768.0;
    double result = 30.0;
    if (v8) {
      return 20.0;
    }
  }
  return result;
}

- (id)_dequeueCellForLockup:(id)a3 collectionView:(id)a4 indexPath:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = [(SUUIShelfPageSectionConfiguration *)self lockupTypeForLockup:a3];
  if (v10 > 8)
  {
    double v11 = 0;
  }
  else if (((1 << v10) & 0x1E6) != 0)
  {
    double v11 = [v8 dequeueReusableCellWithReuseIdentifier:0x2705094D0 forIndexPath:v9];
    [v11 setSeparatorStyle:5];
  }
  else
  {
    if (((1 << v10) & 0x11) != 0) {
      uint64_t v12 = 0x270503310;
    }
    else {
      uint64_t v12 = 0x27050B010;
    }
    double v11 = [v8 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:v9];
  }

  return v11;
}

- (Class)_lockupCellClassWithLockup:(id)a3
{
  if ((unint64_t)[(SUUIShelfPageSectionConfiguration *)self lockupTypeForLockup:a3] <= 8)
  {
    uint64_t v3 = objc_opt_class();
  }
  return (Class)v3;
}

- (double)_perspectiveHeightForContentSize:(double)a3
{
  +[SUUIStackedImageView maximumPerspectiveHeightForSize:](SUUIStackedImageView, "maximumPerspectiveHeightForSize:", a3, a3);
  double v5 = v4;
  BOOL v6 = [(SUUIShelfPageSectionConfiguration *)self isTopSection];
  double result = v5 + -15.0;
  if (v6) {
    return v5;
  }
  return result;
}

- (id)_reloadShelfLayoutDataWithNumberOfShelfItems:(int64_t)a3
{
  unint64_t v5 = [(SUUIShelfPageSectionConfiguration *)self numberOfIterations];
  if (v5 < 2) {
    id v6 = 0;
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  shelfLayoutData = self->_shelfLayoutData;
  int64_t v8 = v5 * a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__SUUIShelfPageSectionConfiguration__reloadShelfLayoutDataWithNumberOfShelfItems___block_invoke;
  v12[3] = &unk_265405618;
  int64_t v15 = a3;
  id v9 = v6;
  id v13 = v9;
  double v14 = self;
  [(SUUIShelfLayoutData *)shelfLayoutData reloadWithItemCount:v8 sizeBlock:v12];
  id v10 = v9;

  return v10;
}

double __82__SUUIShelfPageSectionConfiguration__reloadShelfLayoutDataWithNumberOfShelfItems___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = a2 % v3;
  unint64_t v5 = *(void **)(a1 + 32);
  if (v5
    && ([NSNumber numberWithInteger:a2 % v3],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKey:v6],
        double v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    [v7 CGSizeValue];
    double v9 = v8;
  }
  else
  {
    double v7 = [*(id *)(a1 + 40) _shelfItemViewElementAtIndex:v4];
    id v10 = [*(id *)(a1 + 40) effectiveViewElementForShelfItemViewElement:v7];
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "_cellClassForEffectiveShelfItemViewElement:", v10), "preferredSizeForViewElement:context:", v10, *(void *)(*(void *)(a1 + 40) + 32));
    double v9 = v11;
    id v13 = *(void **)(a1 + 32);
    if (v13)
    {
      double v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v11, v12);
      int64_t v15 = [NSNumber numberWithInteger:v4];
      [v13 setObject:v14 forKey:v15];
    }
  }

  return v9;
}

- (id)_shelfItemViewElementAtIndex:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v6 = [WeakRetained shelfPageSectionConfiguration:self viewElementAtIndex:a3];

  return v6;
}

- (id)_styledShelfCollectionViewLayoutForExistingLayout:(id)a3
{
  id v4 = a3;
  if (self->_wantsZoomingShelfLayout)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = (SUUIZoomingShelfCollectionViewLayout *)v4;
    }
    else
    {
      unint64_t v5 = objc_alloc_init(SUUIZoomingShelfCollectionViewLayout);
      [(SUUIZoomingShelfCollectionViewLayout *)v5 setLayoutData:self->_shelfLayoutData];
    }
    [(SUUIZoomingShelfCollectionViewLayout *)v5 setFocusedItemHorizontalCenterOffset:self->_zoomingShelfLayoutFocusedItemHorizontalCenterOffset];
    [(SUUIZoomingShelfCollectionViewLayout *)v5 setInterItemSpacing:self->_zoomingShelfLayoutInterItemSpacing];
    [(SUUIZoomingShelfCollectionViewLayout *)v5 setItemWidth:self->_zoomingShelfLayoutItemWidth];
    [(SUUIZoomingShelfCollectionViewLayout *)v5 setScaledItemWidth:self->_zoomingShelfLayoutScaledItemWidth];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = (SUUIZoomingShelfCollectionViewLayout *)v4;
    }
    else
    {
      unint64_t v5 = objc_alloc_init(SUUIShelfCollectionViewLayout);
      [(SUUIZoomingShelfCollectionViewLayout *)v5 setLayoutData:self->_shelfLayoutData];
    }
  }

  return v5;
}

- (void)_updateShelfLayoutDataContentInset
{
  if (self->_wantsZoomingShelfLayout)
  {
    shelfLayoutData = self->_shelfLayoutData;
    double v4 = *MEMORY[0x263F834E8];
    double v5 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v6 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v7 = *(double *)(MEMORY[0x263F834E8] + 24);
  }
  else
  {
    double v8 = [(SUUIShelfPageSectionConfiguration *)self pageSectionContext];
    [v8 horizontalPadding];
    double v10 = v9;
    double v11 = [(SUUIShelfPageSectionConfiguration *)self pageSectionContext];
    [v11 horizontalPadding];
    double v13 = v12;

    double v5 = v10 + 100.0;
    if (self->_rendersWithPerspective)
    {
      double v7 = v13 + 100.0;
    }
    else
    {
      double v5 = v10;
      double v7 = v13;
    }
    shelfLayoutData = self->_shelfLayoutData;
    double v4 = 0.0;
    double v6 = 0.0;
  }
  -[SUUIShelfLayoutData setContentInset:](shelfLayoutData, "setContentInset:", v4, v5, v6, v7);
}

- (SUUIViewElementLayoutContext)cellLayoutContext
{
  return self->_cellLayoutContext;
}

- (void)setCellLayoutContext:(id)a3
{
}

- (SUUIShelfPageSectionConfigurationDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SUUIShelfPageSectionConfigurationDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)needsShelfCollectionViewReload
{
  return self->_needsShelfCollectionViewReload;
}

- (void)setNeedsShelfCollectionViewReload:(BOOL)a3
{
  self->_needsShelfCollectionViewReload = a3;
}

- (BOOL)needsShelfCollectionViewLayout
{
  return self->_needsShelfCollectionViewLayout;
}

- (void)setNeedsShelfCollectionViewLayout:(BOOL)a3
{
  self->_needsShelfCollectionViewLayout = a3;
}

- (SUUIStorePageSectionContext)pageSectionContext
{
  return self->_pageSectionContext;
}

- (void)setPageSectionContext:(id)a3
{
}

- (BOOL)rendersWithParallax
{
  return self->_rendersWithParallax;
}

- (void)setRendersWithParallax:(BOOL)a3
{
  self->_rendersWithParallax = a3;
}

- (BOOL)rendersWithPerspective
{
  return self->_rendersWithPerspective;
}

- (void)setRendersWithPerspective:(BOOL)a3
{
  self->_rendersWithPerspective = a3;
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (UIColor)shelfCollectionViewBackgroundColor
{
  return self->_shelfCollectionViewBackgroundColor;
}

- (UICollectionViewDataSource)shelfCollectionViewDataSource
{
  return self->_shelfCollectionViewDataSource;
}

- (UICollectionViewDelegate)shelfCollectionViewDelegate
{
  return self->_shelfCollectionViewDelegate;
}

- (SUUIShelfLayoutData)shelfLayoutData
{
  return self->_shelfLayoutData;
}

- (IKViewElementStyle)shelfViewElementStyle
{
  return self->_shelfViewElementStyle;
}

- (BOOL)isTopSection
{
  return self->_topSection;
}

- (void)setTopSection:(BOOL)a3
{
  self->_topSection = a3;
}

- (BOOL)wantsZoomingShelfLayout
{
  return self->_wantsZoomingShelfLayout;
}

- (double)zoomingShelfLayoutFocusedItemHorizontalCenterOffset
{
  return self->_zoomingShelfLayoutFocusedItemHorizontalCenterOffset;
}

- (double)zoomingShelfLayoutInterItemSpacing
{
  return self->_zoomingShelfLayoutInterItemSpacing;
}

- (double)zoomingShelfLayoutItemWidth
{
  return self->_zoomingShelfLayoutItemWidth;
}

- (double)zoomingShelfLayoutScaledItemWidth
{
  return self->_zoomingShelfLayoutScaledItemWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shelfViewElementStyle, 0);
  objc_storeStrong((id *)&self->_shelfLayoutData, 0);
  objc_storeStrong((id *)&self->_shelfCollectionViewBackgroundColor, 0);
  objc_storeStrong((id *)&self->_pageSectionContext, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
  objc_storeStrong((id *)&self->_shelfCollectionView, 0);
}

@end