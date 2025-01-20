@interface SKUIShelfPageSectionConfiguration
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
- (SKUIShelfLayoutData)shelfLayoutData;
- (SKUIShelfPageSectionConfigurationDataSource)dataSource;
- (SKUIStorePageSectionContext)pageSectionContext;
- (SKUIViewElementLayoutContext)cellLayoutContext;
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
- (void)existingShelfCollectionView;
- (void)numberOfIterations;
- (void)numberOfSectionCells;
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
- (void)shelfCollectionView;
- (void)shelfItemsCollectionView:(id)a3 willApplyLayoutAttributes:(id)a4 forViewElement:(id)a5 withItemIndex:(int64_t)a6;
- (void)supportsDuplicateShelfItems;
@end

@implementation SKUIShelfPageSectionConfiguration

- (UICollectionView)existingShelfCollectionView
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIShelfPageSectionConfiguration *)v3 existingShelfCollectionView];
      }
    }
  }
  shelfCollectionView = self->_shelfCollectionView;

  return shelfCollectionView;
}

- (unint64_t)numberOfIterations
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        [(SKUIShelfPageSectionConfiguration *)v2 numberOfIterations];
      }
    }
  }
  return 1;
}

- (UICollectionView)shelfCollectionView
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIShelfPageSectionConfiguration *)v3 shelfCollectionView];
      }
    }
  }
  shelfCollectionView = self->_shelfCollectionView;
  if (!shelfCollectionView)
  {
    v12 = [(SKUIShelfPageSectionConfiguration *)self _styledShelfCollectionViewLayoutForExistingLayout:0];
    id v13 = objc_alloc(MEMORY[0x1E4FB1568]);
    v14 = (UICollectionView *)objc_msgSend(v13, "initWithFrame:collectionViewLayout:", v12, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v15 = self->_shelfCollectionView;
    self->_shelfCollectionView = v14;

    [(UICollectionView *)self->_shelfCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C91108];
    [(UICollectionView *)self->_shelfCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C9B328];
    [(UICollectionView *)self->_shelfCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C94528];
    [(UICollectionView *)self->_shelfCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C954C8];
    [(UICollectionView *)self->_shelfCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C87EE8];
    [(UICollectionView *)self->_shelfCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C90268];
    [(UICollectionView *)self->_shelfCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C8BFC8];
    [(UICollectionView *)self->_shelfCollectionView setAlwaysBounceHorizontal:1];
    [(UICollectionView *)self->_shelfCollectionView setBackgroundColor:self->_shelfCollectionViewBackgroundColor];
    -[UICollectionView setClipsToBounds:](self->_shelfCollectionView, "setClipsToBounds:", [(id)objc_opt_class() collectionViewCanClipToBounds]);
    [(UICollectionView *)self->_shelfCollectionView setDataSource:self->_shelfCollectionViewDataSource];
    v16 = self->_shelfCollectionView;
    [(id)objc_opt_class() snapToBoundariesDecelerationRate];
    -[UICollectionView setDecelerationRate:](v16, "setDecelerationRate:");
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
  uint64_t v5 = (UIColor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v6) {
        -[SKUIShelfPageSectionConfiguration setShelfCollectionViewBackgroundColor:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_shelfCollectionViewBackgroundColor != v5)
  {
    objc_storeStrong((id *)&self->_shelfCollectionViewBackgroundColor, a3);
    [(UICollectionView *)self->_shelfCollectionView setBackgroundColor:v5];
  }
}

- (void)setShelfCollectionViewDataSource:(id)a3
{
  uint64_t v4 = (UICollectionViewDataSource *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIShelfPageSectionConfiguration setShelfCollectionViewDataSource:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_shelfCollectionViewDataSource != v4)
  {
    self->_shelfCollectionViewDataSource = v4;
    [(UICollectionView *)self->_shelfCollectionView setDataSource:v4];
  }
}

- (void)setShelfCollectionViewDelegate:(id)a3
{
  uint64_t v4 = (UICollectionViewDelegate *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIShelfPageSectionConfiguration setShelfCollectionViewDelegate:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_shelfCollectionViewDelegate != v4)
  {
    self->_shelfCollectionViewDelegate = v4;
    [(UICollectionView *)self->_shelfCollectionView setDelegate:v4];
  }
}

- (void)setShelfViewElementStyle:(id)a3
{
  BOOL v5 = (IKViewElementStyle *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v6) {
        -[SKUIShelfPageSectionConfiguration setShelfViewElementStyle:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_shelfViewElementStyle != v5)
  {
    objc_storeStrong((id *)&self->_shelfViewElementStyle, a3);
    v14 = [(IKViewElementStyle *)self->_shelfViewElementStyle valueForStyle:@"itml-shelf-zooming-layout-peeking-item-width"];
    [v14 floatValue];
    double v16 = v15;

    v17 = [(IKViewElementStyle *)self->_shelfViewElementStyle valueForStyle:@"itml-shelf-zooming-layout-inter-item-spacing"];
    [v17 floatValue];
    self->_zoomingShelfLayoutInterItemSpacing = v18;

    v19 = [(IKViewElementStyle *)self->_shelfViewElementStyle valueForStyle:@"itml-shelf-zooming-layout-item-width"];
    [v19 floatValue];
    self->_zoomingShelfLayoutItemWidth = v20;

    v21 = [(IKViewElementStyle *)self->_shelfViewElementStyle valueForStyle:@"itml-shelf-zooming-layout-zoomed-item-width"];
    [v21 floatValue];
    self->_zoomingShelfLayoutScaledItemWidth = v22;

    self->_zoomingShelfLayoutFocusedItemHorizontalCenterOffset = self->_zoomingShelfLayoutInterItemSpacing
                                                               + v16
                                                               + self->_zoomingShelfLayoutScaledItemWidth * 0.5;
    v23 = [(IKViewElementStyle *)self->_shelfViewElementStyle valueForStyle:@"itml-shelf-layout"];
    self->_wantsZoomingShelfLayout = [v23 isEqualToString:@"zooming"];

    [(SKUIShelfPageSectionConfiguration *)self _updateShelfLayoutDataContentInset];
    shelfCollectionView = self->_shelfCollectionView;
    if (shelfCollectionView)
    {
      v25 = [(UICollectionView *)shelfCollectionView collectionViewLayout];
      v26 = [(SKUIShelfPageSectionConfiguration *)self _styledShelfCollectionViewLayoutForExistingLayout:v25];
      if (v25 != v26)
      {
        [(UICollectionView *)self->_shelfCollectionView setCollectionViewLayout:v26];
        v27 = self->_shelfCollectionView;
        [(id)objc_opt_class() snapToBoundariesDecelerationRate];
        -[UICollectionView setDecelerationRate:](v27, "setDecelerationRate:");
        -[UICollectionView setClipsToBounds:](self->_shelfCollectionView, "setClipsToBounds:", [(id)objc_opt_class() collectionViewCanClipToBounds]);
      }
    }
  }
}

- (id)actualIndexPathOfShelfItemClosestToVisibleBoundsForNormalizedIndexPath:(id)a3 numberOfShelfItems:(unint64_t)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIShelfPageSectionConfiguration actualIndexPathOfShelfItemClosestToVisibleBoundsForNormalizedIndexPath:numberOfShelfItems:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  if ([(SKUIShelfPageSectionConfiguration *)self numberOfIterations] == 1)
  {
    id v15 = v6;
  }
  else
  {
    uint64_t v16 = [v6 item];
    v17 = [(SKUIShelfPageSectionConfiguration *)self shelfCollectionView];
    [v17 indexPathsForVisibleItems];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v36;
LABEL_9:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v35 + 1) + 8 * v22);
        if (objc_msgSend(v23, "item", (void)v35) % a4 == v16) {
          break;
        }
        if (v20 == ++v22)
        {
          uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
          if (v20) {
            goto LABEL_9;
          }
          goto LABEL_15;
        }
      }
      id v15 = v23;

      if (v15) {
        goto LABEL_28;
      }
    }
    else
    {
LABEL_15:
    }
    if (objc_msgSend(v18, "count", (void)v35))
    {
      v24 = [v18 sortedArrayUsingComparator:&__block_literal_global_65];

      v25 = [v24 firstObject];
      v26 = [v24 lastObject];
      v27 = v25;
      if (v25 != v26)
      {
        unint64_t v28 = [v25 item] % a4;
        unint64_t v29 = [v26 item] % a4;
        unint64_t v30 = v28 - v16;
        if ((uint64_t)(v28 - v16) < 0) {
          unint64_t v30 = v16 - v28;
        }
        uint64_t v31 = v29 - v16;
        if (v31 < 0) {
          uint64_t v31 = -v31;
        }
        if (v30 >= v31) {
          v27 = v26;
        }
        else {
          v27 = v25;
        }
      }
      id v32 = v27;
      unint64_t v33 = [v32 item];
      objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v16 + v33 / a4 * a4, objc_msgSend(v6, "section"));
      id v15 = (id)objc_claimAutoreleasedReturnValue();

      id v18 = v24;
    }
    else
    {
      id v15 = v6;
    }
LABEL_28:
  }

  return v15;
}

uint64_t __127__SKUIShelfPageSectionConfiguration_actualIndexPathOfShelfItemClosestToVisibleBoundsForNormalizedIndexPath_numberOfShelfItems___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v4) {
        -[SKUIShelfPageSectionConfiguration backgroundColorForShelfViewElement:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  uint64_t v12 = [v3 style];
  uint64_t v13 = [v12 ikBackgroundColor];
  uint64_t v14 = [v13 color];

  return v14;
}

- (id)cellForShelfViewElement:(id)a3 indexPath:(id)a4
{
  id v5 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIShelfPageSectionConfiguration cellForShelfViewElement:indexPath:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  uint64_t v14 = [(SKUIStorePageSectionContext *)self->_pageSectionContext collectionView];
  id v15 = [v14 dequeueReusableCellWithReuseIdentifier:0x1F1C95748 forIndexPath:v5];

  uint64_t v16 = [(SKUIShelfPageSectionConfiguration *)self shelfCollectionView];
  [v15 setCollectionView:v16];
  if (self->_needsShelfCollectionViewReload)
  {
    [v16 reloadData];
    self->_needsShelfCollectionViewReload = 0;
  }
  if (self->_rendersWithPerspective)
  {
    [(SKUIShelfLayoutData *)self->_shelfLayoutData totalContentSize];
    [(SKUIShelfPageSectionConfiguration *)self _perspectiveHeightForContentSize:v17];
    objc_msgSend(v15, "setContentInset:");
    [v15 setRendersWithPerspective:1];
  }
  else
  {
    objc_msgSend(v15, "setContentInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [v15 setRendersWithPerspective:0];
    [v15 setRendersWithParallax:0];
  }

  return v15;
}

- (CGSize)cellSizeForShelfViewElement:(id)a3 indexPath:(id)a4 numberOfShelfItems:(int64_t)a5
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v7) {
        -[SKUIShelfPageSectionConfiguration cellSizeForShelfViewElement:indexPath:numberOfShelfItems:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  [(SKUIStorePageSectionContext *)self->_pageSectionContext activePageWidth];
  double v16 = v15;
  if (self->_needsShelfCollectionViewLayout)
  {
    id v17 = [(SKUIShelfPageSectionConfiguration *)self _reloadShelfLayoutDataWithNumberOfShelfItems:a5];
    self->_needsShelfCollectionViewLayout = 0;
  }
  [(SKUIShelfLayoutData *)self->_shelfLayoutData totalContentSize];
  double v19 = v18;
  if (self->_rendersWithPerspective)
  {
    [(SKUIShelfPageSectionConfiguration *)self _perspectiveHeightForContentSize:v18];
    double v19 = v19 + v20;
  }
  if (self->_wantsZoomingShelfLayout) {
    double v19 = v19 + self->_zoomingShelfLayoutScaledItemWidth - self->_zoomingShelfLayoutItemWidth;
  }
  double v21 = v16;
  double v22 = v19;
  result.height = v22;
  result.width = v21;
  return result;
}

- (id)cellForShelfItemViewElement:(id)a3 indexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIShelfPageSectionConfiguration cellForShelfItemViewElement:indexPath:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  double v16 = [(SKUIShelfPageSectionConfiguration *)self shelfCollectionView];
  id v17 = [(SKUIShelfPageSectionConfiguration *)self effectiveViewElementForShelfItemViewElement:v6];
  uint64_t v18 = [v17 elementType];
  double v19 = 0;
  if (v18 <= 48)
  {
    if (v18 == 14)
    {
      if ([v6 cardType] != 3)
      {
        double v19 = [v16 dequeueReusableCellWithReuseIdentifier:0x1F1C91108 forIndexPath:v7];
        [v19 setArtworkBoundingSize:0];
        goto LABEL_18;
      }
      uint64_t v20 = 0x1F1C94528;
    }
    else
    {
      if (v18 != 28) {
        goto LABEL_18;
      }
      uint64_t v20 = 0x1F1C9B328;
    }
    double v19 = [v16 dequeueReusableCellWithReuseIdentifier:v20 forIndexPath:v7];
    goto LABEL_18;
  }
  if (v18 == 49)
  {
LABEL_9:
    double v19 = [v16 dequeueReusableCellWithReuseIdentifier:0x1F1C87EE8 forIndexPath:v7];
    [v19 setShowsReflectionImage:0];
    goto LABEL_18;
  }
  if (v18 != 66)
  {
    if (v18 != 152) {
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  double v21 = [(SKUIShelfPageSectionConfiguration *)self shelfCollectionView];
  double v19 = [(SKUIShelfPageSectionConfiguration *)self _dequeueCellForLockup:v17 collectionView:v21 indexPath:v7];

LABEL_18:
  -[SKUIShelfLayoutData sizeForItemAtIndex:](self->_shelfLayoutData, "sizeForItemAtIndex:", [v7 item]);
  double v23 = v22;
  v24 = [v17 style];
  v25 = [v24 visibility];
  int v26 = [v25 isEqualToString:@"hidden"];

  if (v26) {
    v27 = 0;
  }
  else {
    v27 = v17;
  }
  [v19 reloadWithViewElement:v27 width:self->_cellLayoutContext context:v23];
  if (self->_rendersWithPerspective && [v19 conformsToProtocol:&unk_1F1DA49A8])
  {
    pageSectionContext = self->_pageSectionContext;
    id v29 = v19;
    unint64_t v30 = [(SKUIStorePageSectionContext *)pageSectionContext parentViewController];
    uint64_t v31 = [v30 view];

    [v29 setPerspectiveTargetView:v31];
    [v31 bounds];
    objc_msgSend(v29, "setVanishingPoint:", CGRectGetMidX(v34), -800.0);
  }

  return v19;
}

- (id)effectiveViewElementForShelfItemViewElement:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v4) {
        -[SKUIShelfPageSectionConfiguration effectiveViewElementForShelfItemViewElement:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }

  return v3;
}

- (int64_t)lockupTypeForLockup:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v5) {
        -[SKUIShelfPageSectionConfiguration lockupTypeForLockup:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  uint64_t lockupType = self->_lockupType;
  if (lockupType == -1) {
    uint64_t lockupType = [v4 lockupViewType];
  }

  return lockupType;
}

- (id)normalizedShelfItemIndexPathFromActualIndexPath:(id)a3 numberOfShelfItems:(unint64_t)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIShelfPageSectionConfiguration normalizedShelfItemIndexPathFromActualIndexPath:numberOfShelfItems:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  if ([(SKUIShelfPageSectionConfiguration *)self numberOfIterations] == 1)
  {
    id v15 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v6, "item") % a4, objc_msgSend(v6, "section"));
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v16 = v15;

  return v16;
}

- (unint64_t)numberOfCellsForNumberOfShelfItems:(unint64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIShelfPageSectionConfiguration numberOfCellsForNumberOfShelfItems:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  return [(SKUIShelfPageSectionConfiguration *)self numberOfIterations] * a3;
}

- (int64_t)numberOfSectionCells
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        [(SKUIShelfPageSectionConfiguration *)v2 numberOfSectionCells];
      }
    }
  }
  return 1;
}

- (BOOL)prefetchResourcesForShelfItemViewElement:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v7) {
        -[SKUIShelfPageSectionConfiguration prefetchResourcesForShelfItemViewElement:reason:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  id v15 = [(SKUIShelfPageSectionConfiguration *)self effectiveViewElementForShelfItemViewElement:v6];
  char v16 = [(objc_class *)[(SKUIShelfPageSectionConfiguration *)self _cellClassForEffectiveShelfItemViewElement:v15] prefetchResourcesForViewElement:v15 reason:a4 context:self->_cellLayoutContext];

  return v16;
}

- (void)registerReusableClassesForCollectionView:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v4) {
        -[SKUIShelfPageSectionConfiguration registerReusableClassesForCollectionView:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C95748];
}

- (void)reloadLockupTypeForShelfViewElement:(id)a3
{
  BOOL v4 = [a3 style];
  uint64_t v7 = [v4 lockupType];

  uint64_t v5 = v7;
  if (v7)
  {
    int64_t v6 = SKUILockupViewTypeForString(v7);
    uint64_t v5 = v7;
  }
  else
  {
    int64_t v6 = -1;
  }
  self->_uint64_t lockupType = v6;

  MEMORY[0x1F41817F8](v6, v5);
}

- (void)reloadShelfLayoutDataForShelfViewElement:(id)a3 withShelfItemViewElements:(id)a4 requestCellLayouts:(BOOL)a5 numberOfShelfItems:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v12 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v12) {
        -[SKUIShelfPageSectionConfiguration reloadShelfLayoutDataForShelfViewElement:withShelfItemViewElements:requestCellLayouts:numberOfShelfItems:](v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
  }
  uint64_t v20 = [SKUIShelfLayoutData alloc];
  uint64_t v21 = [v11 numberOfRows];

  [(SKUIShelfPageSectionConfiguration *)self _columnSpacingForShelfItemViewElements:v10];
  double v23 = v22;

  v24 = [(SKUIShelfLayoutData *)v20 initWithNumberOfRows:v21 columnSpacing:v23];
  shelfLayoutData = self->_shelfLayoutData;
  self->_shelfLayoutData = v24;

  [(SKUIShelfPageSectionConfiguration *)self _updateShelfLayoutDataContentInset];
  int v26 = [(SKUIShelfPageSectionConfiguration *)self _reloadShelfLayoutDataWithNumberOfShelfItems:a6];
  if (v7)
  {
    unint64_t v27 = [(SKUIShelfPageSectionConfiguration *)self numberOfIterations];
    int64_t v28 = [(SKUIShelfLayoutData *)self->_shelfLayoutData numberOfRows];
    id v29 = self->_shelfLayoutData;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __142__SKUIShelfPageSectionConfiguration_reloadShelfLayoutDataForShelfViewElement_withShelfItemViewElements_requestCellLayouts_numberOfShelfItems___block_invoke;
    v31[3] = &unk_1E642ACF8;
    int64_t v34 = v28;
    int64_t v35 = a6;
    unint64_t v36 = v27;
    id v32 = v26;
    unint64_t v33 = self;
    [(SKUIShelfLayoutData *)v29 enumerateColumnsUsingBlock:v31];
  }
  unint64_t v30 = [(UICollectionView *)self->_shelfCollectionView collectionViewLayout];
  [v30 setLayoutData:self->_shelfLayoutData];
}

void __142__SKUIShelfPageSectionConfiguration_reloadShelfLayoutDataForShelfViewElement_withShelfItemViewElements_requestCellLayouts_numberOfShelfItems___block_invoke(uint64_t a1, uint64_t a2, double a3)
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
        BOOL v12 = [NSNumber numberWithInteger:v8 % v9];
        uint64_t v13 = [v11 objectForKey:v12];

        if (!v13) {
          continue;
        }
      }
      uint64_t v14 = [*(id *)(a1 + 40) _shelfItemViewElementAtIndex:v10];
      [*(id *)(a1 + 40) requestCellLayoutForViewElement:v14 withColumnWidth:a3];
      uint64_t v15 = *(void **)(a1 + 32);
      if (v15)
      {
        uint64_t v16 = [NSNumber numberWithInteger:v10];
        [v15 removeObjectForKey:v16];
      }
      ++v6;
    }
    while (v6 < *(void *)(a1 + 48));
  }
}

- (void)requestCellLayoutForViewElement:(id)a3 withColumnWidth:(double)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v7) {
        -[SKUIShelfPageSectionConfiguration requestCellLayoutForViewElement:withColumnWidth:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  uint64_t v15 = [(SKUIShelfPageSectionConfiguration *)self effectiveViewElementForShelfItemViewElement:v6];
  [(objc_class *)[(SKUIShelfPageSectionConfiguration *)self _cellClassForEffectiveShelfItemViewElement:v15] requestLayoutForViewElement:v15 width:self->_cellLayoutContext context:a4];
}

- (UIEdgeInsets)sectionContentInsetAdjustedFromValue:(UIEdgeInsets)a3 forShelfViewElement:(id)a4 withSectionIndex:(int64_t)a5
{
  CGFloat right = a3.right;
  double bottom = a3.bottom;
  CGFloat left = a3.left;
  double top = a3.top;
  id v10 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v11) {
        -[SKUIShelfPageSectionConfiguration sectionContentInsetAdjustedFromValue:forShelfViewElement:withSectionIndex:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  char v29 = 0;
  uint64_t v19 = [v10 style];
  double v20 = SKUIViewElementPaddingForStyle(v19, &v29);
  double v22 = v21;

  if (a5) {
    double v23 = top;
  }
  else {
    double v23 = bottom;
  }
  if (v29)
  {
    double bottom = v22;
    double v24 = v20;
  }
  else
  {
    double v24 = v23;
  }

  double v25 = v24;
  double v26 = left;
  double v27 = bottom;
  double v28 = right;
  result.CGFloat right = v28;
  result.double bottom = v27;
  result.CGFloat left = v26;
  result.double top = v25;
  return result;
}

- (void)shelfItemsCollectionView:(id)a3 willApplyLayoutAttributes:(id)a4 forViewElement:(id)a5 withItemIndex:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v13 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v13) {
        -[SKUIShelfPageSectionConfiguration shelfItemsCollectionView:willApplyLayoutAttributes:forViewElement:withItemIndex:](v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
  }
  double v21 = [(SKUIShelfPageSectionConfiguration *)self effectiveViewElementForShelfItemViewElement:v12];
  double v22 = [v21 style];
  double v23 = [v22 ikBackgroundColor];
  double v24 = [v23 color];

  if (v24)
  {
    [v11 setBackgroundColor:v24];
  }
  else
  {
    double v25 = [v10 backgroundColor];
    [v11 setBackgroundColor:v25];
  }
  int64_t v26 = [(SKUIShelfLayoutData *)self->_shelfLayoutData numberOfRows];
  if (v26 == 1)
  {
    uint64_t v27 = 40;
  }
  else if (a6 % v26)
  {
    if (a6 % v26 == v26 - 1) {
      uint64_t v27 = 32;
    }
    else {
      uint64_t v27 = 16;
    }
  }
  else
  {
    uint64_t v27 = 8;
  }
  [v11 setPosition:v27];
}

- (BOOL)supportsDuplicateShelfItems
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIShelfPageSectionConfiguration *)v3 supportsDuplicateShelfItems];
      }
    }
  }
  return [(SKUIShelfPageSectionConfiguration *)self numberOfIterations] > 1;
}

- (Class)_cellClassForEffectiveShelfItemViewElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 elementType];
  uint64_t v6 = 0;
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
    uint64_t v6 = (objc_class *)objc_opt_class();
    goto LABEL_12;
  }
  switch(v5)
  {
    case 49:
      goto LABEL_11;
    case 66:
      uint64_t v6 = [(SKUIShelfPageSectionConfiguration *)self _lockupCellClassWithLockup:v4];
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
  id v4 = [(SKUIStorePageSectionContext *)self->_pageSectionContext clientContext];
  uint64_t v5 = SKUIUserInterfaceIdiom(v4);

  double result = 15.0;
  if (v5 == 1)
  {
    [(SKUIStorePageSectionContext *)self->_pageSectionContext activePageWidth];
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
  unint64_t v10 = [(SKUIShelfPageSectionConfiguration *)self lockupTypeForLockup:a3];
  if (v10 > 8)
  {
    id v11 = 0;
  }
  else if (((1 << v10) & 0x1E6) != 0)
  {
    id v11 = [v8 dequeueReusableCellWithReuseIdentifier:0x1F1C954C8 forIndexPath:v9];
    [v11 setSeparatorStyle:5];
  }
  else
  {
    if (((1 << v10) & 0x11) != 0) {
      uint64_t v12 = 0x1F1C8BFC8;
    }
    else {
      uint64_t v12 = 0x1F1C90268;
    }
    id v11 = [v8 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:v9];
  }

  return v11;
}

- (Class)_lockupCellClassWithLockup:(id)a3
{
  if ((unint64_t)[(SKUIShelfPageSectionConfiguration *)self lockupTypeForLockup:a3] <= 8)
  {
    BOOL v3 = objc_opt_class();
  }

  return (Class)v3;
}

- (double)_perspectiveHeightForContentSize:(double)a3
{
  +[SKUIStackedImageView maximumPerspectiveHeightForSize:](SKUIStackedImageView, "maximumPerspectiveHeightForSize:", a3, a3);
  double v5 = v4;
  BOOL v6 = [(SKUIShelfPageSectionConfiguration *)self isTopSection];
  double result = v5 + -15.0;
  if (v6) {
    return v5;
  }
  return result;
}

- (id)_reloadShelfLayoutDataWithNumberOfShelfItems:(int64_t)a3
{
  unint64_t v5 = [(SKUIShelfPageSectionConfiguration *)self numberOfIterations];
  if (v5 < 2) {
    id v6 = 0;
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  shelfLayoutData = self->_shelfLayoutData;
  int64_t v8 = v5 * a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__SKUIShelfPageSectionConfiguration__reloadShelfLayoutDataWithNumberOfShelfItems___block_invoke;
  v12[3] = &unk_1E642AD20;
  int64_t v15 = a3;
  id v9 = v6;
  id v13 = v9;
  uint64_t v14 = self;
  [(SKUIShelfLayoutData *)shelfLayoutData reloadWithItemCount:v8 sizeBlock:v12];
  id v10 = v9;

  return v10;
}

double __82__SKUIShelfPageSectionConfiguration__reloadShelfLayoutDataWithNumberOfShelfItems___block_invoke(uint64_t a1, uint64_t a2)
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
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v11, v12);
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
      unint64_t v5 = (SKUIZoomingShelfCollectionViewLayout *)v4;
    }
    else
    {
      unint64_t v5 = objc_alloc_init(SKUIZoomingShelfCollectionViewLayout);
      [(SKUIZoomingShelfCollectionViewLayout *)v5 setLayoutData:self->_shelfLayoutData];
    }
    [(SKUIZoomingShelfCollectionViewLayout *)v5 setFocusedItemHorizontalCenterOffset:self->_zoomingShelfLayoutFocusedItemHorizontalCenterOffset];
    [(SKUIZoomingShelfCollectionViewLayout *)v5 setInterItemSpacing:self->_zoomingShelfLayoutInterItemSpacing];
    [(SKUIZoomingShelfCollectionViewLayout *)v5 setItemWidth:self->_zoomingShelfLayoutItemWidth];
    [(SKUIZoomingShelfCollectionViewLayout *)v5 setScaledItemWidth:self->_zoomingShelfLayoutScaledItemWidth];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = (SKUIZoomingShelfCollectionViewLayout *)v4;
    }
    else
    {
      unint64_t v5 = objc_alloc_init(SKUIShelfCollectionViewLayout);
      [(SKUIZoomingShelfCollectionViewLayout *)v5 setLayoutData:self->_shelfLayoutData];
    }
  }

  return v5;
}

- (void)_updateShelfLayoutDataContentInset
{
  if (self->_wantsZoomingShelfLayout)
  {
    shelfLayoutData = self->_shelfLayoutData;
    double v4 = *MEMORY[0x1E4FB2848];
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    double v8 = [(SKUIShelfPageSectionConfiguration *)self pageSectionContext];
    [v8 horizontalPadding];
    double v10 = v9;
    double v11 = [(SKUIShelfPageSectionConfiguration *)self pageSectionContext];
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

  -[SKUIShelfLayoutData setContentInset:](shelfLayoutData, "setContentInset:", v4, v5, v6, v7);
}

- (SKUIViewElementLayoutContext)cellLayoutContext
{
  return self->_cellLayoutContext;
}

- (void)setCellLayoutContext:(id)a3
{
}

- (SKUIShelfPageSectionConfigurationDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (SKUIShelfPageSectionConfigurationDataSource *)WeakRetained;
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

- (SKUIStorePageSectionContext)pageSectionContext
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

- (SKUIShelfLayoutData)shelfLayoutData
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

- (void)existingShelfCollectionView
{
}

- (void)numberOfIterations
{
}

- (void)shelfCollectionView
{
}

- (void)setShelfCollectionViewBackgroundColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setShelfCollectionViewDataSource:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setShelfCollectionViewDelegate:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setShelfViewElementStyle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)actualIndexPathOfShelfItemClosestToVisibleBoundsForNormalizedIndexPath:(uint64_t)a3 numberOfShelfItems:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)backgroundColorForShelfViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cellForShelfViewElement:(uint64_t)a3 indexPath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cellSizeForShelfViewElement:(uint64_t)a3 indexPath:(uint64_t)a4 numberOfShelfItems:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)cellForShelfItemViewElement:(uint64_t)a3 indexPath:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)effectiveViewElementForShelfItemViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)lockupTypeForLockup:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)normalizedShelfItemIndexPathFromActualIndexPath:(uint64_t)a3 numberOfShelfItems:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)numberOfCellsForNumberOfShelfItems:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)numberOfSectionCells
{
}

- (void)prefetchResourcesForShelfItemViewElement:(uint64_t)a3 reason:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)registerReusableClassesForCollectionView:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)reloadShelfLayoutDataForShelfViewElement:(uint64_t)a3 withShelfItemViewElements:(uint64_t)a4 requestCellLayouts:(uint64_t)a5 numberOfShelfItems:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)requestCellLayoutForViewElement:(uint64_t)a3 withColumnWidth:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sectionContentInsetAdjustedFromValue:(uint64_t)a3 forShelfViewElement:(uint64_t)a4 withSectionIndex:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)shelfItemsCollectionView:(uint64_t)a3 willApplyLayoutAttributes:(uint64_t)a4 forViewElement:(uint64_t)a5 withItemIndex:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)supportsDuplicateShelfItems
{
}

@end