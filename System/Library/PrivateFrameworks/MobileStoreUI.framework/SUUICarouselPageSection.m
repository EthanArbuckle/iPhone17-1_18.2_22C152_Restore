@interface SUUICarouselPageSection
- (BOOL)_indexPathIsProgressIndicator:(id)a3;
- (BOOL)_isItemEnabledAtIndexPath:(id)a3;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (CGSize)_legacyItemSize;
- (CGSize)cellSizeForIndexPath:(id)a3;
- (Class)_cellClassForLockup:(id)a3;
- (Class)_cellClassForViewElement:(id)a3;
- (SUUICarouselPageSection)initWithPageComponent:(id)a3;
- (UIEdgeInsets)sectionContentInset;
- (double)_actualContentWidth;
- (double)_legacyItemSpacing;
- (id)_carouselCollectionView;
- (id)_dequeueCellForLockup:(id)a3 collectionView:(id)a4 indexPath:(id)a5;
- (id)_dequeueCellForViewElement:(id)a3 collectionView:(id)a4 indexPath:(id)a5;
- (id)_missingItemLoader;
- (id)backgroundColorForIndexPath:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)_currentPageIndex;
- (int64_t)applyUpdateType:(int64_t)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)defaultItemPinningStyle;
- (int64_t)numberOfCells;
- (void)_addImpressionForIndex:(int64_t)a3 toSession:(id)a4;
- (void)_cancelCycleTimer;
- (void)_fireCycleTimer;
- (void)_loadMissingItemsFromIndex:(int64_t)a3 withReason:(int64_t)a4;
- (void)_reloadLegacySizing;
- (void)_reloadViewElementProperties;
- (void)_scrollToItemAtIndexPath:(id)a3 animated:(BOOL)a4;
- (void)_startCycleTimerIfNecessary;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)collectionView:(id)a3 carouselLayout:(id)a4 willApplyLayoutAttributes:(id)a5;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3;
- (void)dealloc;
- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4;
- (void)invalidateCachedLayoutInformation;
- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5;
- (void)prefetchResourcesWithReason:(int64_t)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)willAppearInContext:(id)a3;
- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SUUICarouselPageSection

- (SUUICarouselPageSection)initWithPageComponent:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUICarouselPageSection;
  v3 = [(SUUIStorePageSection *)&v6 initWithPageComponent:a3];
  v4 = v3;
  if (v3) {
    [(SUUICarouselPageSection *)v3 _reloadViewElementProperties];
  }
  return v4;
}

- (void)dealloc
{
  cycleTimer = self->_cycleTimer;
  if (cycleTimer) {
    dispatch_source_cancel(cycleTimer);
  }
  [(UICollectionView *)self->_carouselCollectionView setDataSource:0];
  [(UICollectionView *)self->_carouselCollectionView setDelegate:0];
  [(SUUIMissingItemLoader *)self->_missingItemLoader setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)SUUICarouselPageSection;
  [(SUUIStorePageSection *)&v4 dealloc];
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (![(SUUICarouselPageSection *)self _indexPathIsProgressIndicator:a3])
  {
    v7 = [(SUUIStorePageSection *)self pageComponent];
    v8 = [v7 viewElement];
    [v6 addItemViewElement:v8];

    v9 = [(UICollectionView *)self->_carouselCollectionView indexPathsForVisibleItems];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = -[NSArray objectAtIndex:](self->_modelObjects, "objectAtIndex:", [*(id *)(*((void *)&v15 + 1) + 8 * v13) item]% -[NSArray count](self->_modelObjects, "count"));
          [v6 addItemViewElement:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (int64_t)applyUpdateType:(int64_t)a3
{
  [(SUUICarouselPageSection *)self _reloadViewElementProperties];
  BOOL v5 = a3 == 2 && !self->_needsReload;
  BOOL v6 = !v5;
  self->_needsReload = v6;
  if (!v5)
  {
    v7 = [(SUUIStorePageSection *)self pageComponent];
    v8 = [v7 viewElement];
    uint64_t v9 = [v8 updateType];

    if ((unint64_t)(v9 - 3) <= 1)
    {
      reloadIndexPath = self->_reloadIndexPath;
      self->_reloadIndexPath = 0;
LABEL_12:

      goto LABEL_13;
    }
    carouselCollectionView = self->_carouselCollectionView;
    if (carouselCollectionView)
    {
      [(UICollectionView *)carouselCollectionView bounds];
      CGFloat x = v20.origin.x;
      CGFloat y = v20.origin.y;
      CGFloat width = v20.size.width;
      CGFloat height = v20.size.height;
      double MidX = CGRectGetMidX(v20);
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      -[UICollectionView indexPathForItemAtPoint:](self->_carouselCollectionView, "indexPathForItemAtPoint:", MidX, CGRectGetMidY(v21));
      long long v17 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
      reloadIndexPath = self->_reloadIndexPath;
      self->_reloadIndexPath = v17;
      goto LABEL_12;
    }
  }
LABEL_13:
  v19.receiver = self;
  v19.super_class = (Class)SUUICarouselPageSection;
  return [(SUUIStorePageSection *)&v19 applyUpdateType:a3];
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SUUIStorePageSection *)self pageComponent];
  BOOL v6 = [v5 viewElement];
  v7 = [v6 style];

  v8 = [v7 ikBackgroundColor];
  uint64_t v9 = [v8 color];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SUUICarouselPageSection;
    id v10 = [(SUUIStorePageSection *)&v13 backgroundColorForIndexPath:v4];
  }
  uint64_t v11 = v10;

  return v11;
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SUUIStorePageSection *)self context];
  BOOL v6 = [(SUUICarouselPageSection *)self _indexPathIsProgressIndicator:v4];
  v7 = [v5 collectionView];
  v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v7 dequeueReusableCellWithReuseIdentifier:0x27050A390 forIndexPath:v4];

    progressIndicatorElement = self->_progressIndicatorElement;
    [v5 activePageWidth];
    objc_msgSend(v9, "reloadWithViewElement:width:context:", progressIndicatorElement, self->_cellLayoutContext);
    objc_msgSend(v9, "setContentInset:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
    objc_msgSend(v9, "setCurrentPage:", -[SUUICarouselPageSection _currentPageIndex](self, "_currentPageIndex"));
    objc_msgSend(v9, "setNumberOfPages:", -[NSArray count](self->_modelObjects, "count"));
  }
  else
  {
    uint64_t v9 = [v7 dequeueReusableCellWithReuseIdentifier:0x270504F70 forIndexPath:v4];

    uint64_t v11 = [(SUUICarouselPageSection *)self _carouselCollectionView];
    uint64_t v12 = v11;
    if (self->_needsReload)
    {
      [v11 reloadData];
      self->_needsReload = 0;
      reloadIndexPath = self->_reloadIndexPath;
      if (reloadIndexPath)
      {
        [(SUUICarouselPageSection *)self _scrollToItemAtIndexPath:reloadIndexPath animated:0];
        v14 = self->_reloadIndexPath;
        self->_reloadIndexPath = 0;
      }
    }
    [v9 setCollectionView:v12];
    objc_msgSend(v9, "setContentInset:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
    [v9 setRendersWithPerspective:0];
    [v9 setRendersWithParallax:0];
    long long v15 = [(SUUIStorePageSection *)self context];
    [v15 activePageWidth];
    double v17 = v16;

    [(SUUICarouselPageSection *)self _actualContentWidth];
    double v19 = v18;
    CGRect v20 = [(SUUIStorePageSection *)self context];
    [v20 activePageWidth];
    double v22 = v21 + v21;

    if (v19 <= v22)
    {
      [v12 contentInset];
      double v24 = v23;
      double v26 = v25;
      int64_t v27 = [(NSArray *)self->_modelObjects count];
      float v28 = (v17 - v19) * 0.5;
      double v29 = fmaxf(floorf(v28), 0.0);
      [v12 setAlwaysBounceHorizontal:v27 > 1];
      objc_msgSend(v12, "setContentInset:", v24, v29, v26, v29);
    }
    [(SUUICarouselPageSection *)self _startCycleTimerIfNecessary];
  }
  return v9;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(SUUIStorePageSection *)self context];
  [v5 activePageWidth];
  double v7 = v6;

  if ([(SUUICarouselPageSection *)self _indexPathIsProgressIndicator:v4])
  {
    +[SUUIPageControlCollectionViewCell sizeThatFitsWidth:self->_progressIndicatorElement viewElement:self->_cellLayoutContext context:v7];
    CGFloat height = v8;
  }
  else
  {
    if (self->_needsHeightCalculation)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v10 = self->_modelObjects;
      uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v22;
        double v14 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            -[objc_class sizeThatFitsWidth:viewElement:context:](-[SUUICarouselPageSection _cellClassForViewElement:](self, "_cellClassForViewElement:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21), "sizeThatFitsWidth:viewElement:context:", *(void *)(*((void *)&v21 + 1) + 8 * i), self->_cellLayoutContext, self->_itemSize.width);
            if (v14 < v16) {
              double v14 = v16;
            }
          }
          uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v12);
      }
      else
      {
        double v14 = 0.0;
      }

      self->_itemSize.CGFloat height = v14;
      self->_needsHeightCalculation = 0;
      double v17 = [(SUUICarouselPageSection *)self _carouselCollectionView];
      double v18 = [v17 collectionViewLayout];

      objc_msgSend(v18, "setItemSize:", self->_itemSize.width, self->_itemSize.height);
    }
    CGFloat height = self->_itemSize.height;
  }

  double v19 = v7;
  double v20 = height;
  result.CGFloat height = v20;
  result.CGFloat width = v19;
  return result;
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (![(SUUICarouselPageSection *)self _indexPathIsProgressIndicator:v4])
  {
    BOOL v5 = [(SUUIStorePageSection *)self pageComponent];
    double v6 = [v5 viewElement];

    double v7 = [(SUUIStorePageSection *)self context];
    double v8 = [v7 activeMetricsImpressionSession];
    [v8 beginActiveImpressionForViewElement:v6];
  }
  v9.receiver = self;
  v9.super_class = (Class)SUUICarouselPageSection;
  [(SUUIStorePageSection *)&v9 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (![(SUUICarouselPageSection *)self _indexPathIsProgressIndicator:v4])
  {
    [(SUUICarouselPageSection *)self _cancelCycleTimer];
    BOOL v5 = [(SUUIStorePageSection *)self pageComponent];
    double v6 = [v5 viewElement];

    double v7 = [(SUUIStorePageSection *)self context];
    double v8 = [v7 activeMetricsImpressionSession];
    [v8 endActiveImpressionForViewElement:v6];
  }
  v9.receiver = self;
  v9.super_class = (Class)SUUICarouselPageSection;
  [(SUUIStorePageSection *)&v9 collectionViewDidEndDisplayingCellForItemAtIndexPath:v4];
}

- (int64_t)defaultItemPinningStyle
{
  if ([(SUUIStorePageSection *)self isTopSection]) {
    return 3;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUUICarouselPageSection;
  return [(SUUIStorePageSection *)&v4 defaultItemPinningStyle];
}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v8 = self->_modelObjects;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [(objc_class *)[(SUUICarouselPageSection *)self _cellClassForViewElement:*(void *)(*((void *)&v14 + 1) + 8 * v12)] requestLayoutForViewElement:*(void *)(*((void *)&v14 + 1) + 8 * v12) width:self->_cellLayoutContext context:self->_itemSize.width];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  v13.receiver = self;
  v13.super_class = (Class)SUUICarouselPageSection;
  [(SUUIStorePageSection *)&v13 entityProvider:v6 didInvalidateWithContext:v7];
}

- (void)invalidateCachedLayoutInformation
{
  v3 = [(SUUIStorePageSection *)self pageComponent];
  objc_super v4 = [v3 viewElement];

  if (v4) {
    self->_needsHeightCalculation = 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)SUUICarouselPageSection;
  [(SUUIStorePageSection *)&v5 invalidateCachedLayoutInformation];
}

- (int64_t)numberOfCells
{
  NSUInteger v3 = [(NSArray *)self->_modelObjects count];
  if (self->_progressIndicatorElement) {
    return 2;
  }
  else {
    return v3 != 0;
  }
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_super v5 = [(SUUIStorePageSection *)self pageComponent];
  id v6 = [v5 viewElement];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = self->_modelObjects;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (v6)
        {
          [(objc_class *)[(SUUICarouselPageSection *)self _cellClassForViewElement:*(void *)(*((void *)&v14 + 1) + 8 * i)] prefetchResourcesForViewElement:*(void *)(*((void *)&v14 + 1) + 8 * i) reason:a3 context:self->_cellLayoutContext];
        }
        else
        {
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "artworkForSize:", self->_itemSize.width, self->_itemSize.height);
          [(SUUIViewElementLayoutContext *)self->_cellLayoutContext loadImageForArtwork:v12 reason:a3];
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if (!v6) {
    [(SUUICarouselPageSection *)self _loadMissingItemsFromIndex:0 withReason:a3];
  }
  v13.receiver = self;
  v13.super_class = (Class)SUUICarouselPageSection;
  [(SUUIStorePageSection *)&v13 prefetchResourcesWithReason:a3];
}

- (UIEdgeInsets)sectionContentInset
{
  if (!self->_progressIndicatorElement || self->_progressIndicatorCellIndex != 1)
  {
    id v7 = [(SUUIStorePageSection *)self pageComponent];
    uint64_t v8 = [v7 viewElement];
    uint64_t v9 = [v8 style];

    uint64_t v10 = [v9 valueForStyle:*MEMORY[0x263F4B390]];
    if (v10)
    {
    }
    else
    {
      uint64_t v11 = [v9 valueForStyle:@"itml-padding"];

      if (!v11)
      {
        v20.receiver = self;
        v20.super_class = (Class)SUUICarouselPageSection;
        [(SUUIStorePageSection *)&v20 sectionContentInset];
        goto LABEL_8;
      }
    }
    [v9 elementPadding];
LABEL_8:
    double v3 = v12;
    double v4 = v13;
    double v5 = v14;
    double v6 = v15;

    goto LABEL_9;
  }
  double v3 = *MEMORY[0x263F834E8];
  double v4 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v5 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v6 = *(double *)(MEMORY[0x263F834E8] + 24);
LABEL_9:
  double v16 = v3;
  double v17 = v4;
  double v18 = v5;
  double v19 = v6;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)willAppearInContext:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [v4 collectionView];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x27050A390];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270504F70];
  v53 = self->_cellLayoutContext;
  double v6 = [[SUUIViewElementLayoutContext alloc] initWithStorePageSectionContext:v4 previousLayoutContext:v53];
  cellLayoutContext = self->_cellLayoutContext;
  self->_cellLayoutContext = v6;

  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setArtworkRequestDelegate:self];
  uint64_t v8 = [(SUUIStorePageSection *)self pageComponent];
  uint64_t v9 = [v8 viewElement];

  -[SUUIViewElementLayoutContext setContainerViewElementType:](self->_cellLayoutContext, "setContainerViewElementType:", [v9 elementType]);
  uint64_t v10 = &OBJC_IVAR___SUProductPageViewController__preview;
  uint64_t v11 = &OBJC_IVAR___SUProductPageViewController__preview;
  v52 = v9;
  if (v9)
  {
    v51 = v5;
    p_itemSize = (float64x2_t *)&self->_itemSize;
    self->_itemSize = (CGSize)*MEMORY[0x263F001B0];
    double itemWidth = self->_itemWidth;
    if (itemWidth > 0.0) {
      p_itemSize->f64[0] = itemWidth;
    }
    self->_needsHeightCalculation = 1;
    double v14 = [v9 style];
    [v14 elementPadding];
    double v16 = v15;
    double v18 = v17;

    if (v16 >= v18) {
      double v19 = v16;
    }
    else {
      double v19 = v18;
    }
    self->_itemSpacing = v19;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    objc_super v20 = self->_modelObjects;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v60 != v23) {
            objc_enumerationMutation(v20);
          }
          [(objc_class *)[(SUUICarouselPageSection *)self _cellClassForViewElement:*(void *)(*((void *)&v59 + 1) + 8 * i)] preferredSizeForViewElement:*(void *)(*((void *)&v59 + 1) + 8 * i) context:self->_cellLayoutContext];
          v26.f64[1] = v25;
          *(int8x16_t *)p_itemSize = vbslq_s8((int8x16_t)vcgtq_f64(v26, *p_itemSize), (int8x16_t)v26, *(int8x16_t *)p_itemSize);
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v22);
    }

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    int64_t v27 = self->_modelObjects;
    uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v55 objects:v63 count:16];
    double v5 = v51;
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v29; ++j)
        {
          if (*(void *)v56 != v30) {
            objc_enumerationMutation(v27);
          }
          [(objc_class *)[(SUUICarouselPageSection *)self _cellClassForViewElement:*(void *)(*((void *)&v55 + 1) + 8 * j)] requestLayoutForViewElement:*(void *)(*((void *)&v55 + 1) + 8 * j) width:self->_cellLayoutContext context:p_itemSize->f64[0]];
        }
        uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v55 objects:v63 count:16];
      }
      while (v29);
    }

    uint64_t v11 = &OBJC_IVAR___SUProductPageViewController__preview;
    uint64_t v10 = &OBJC_IVAR___SUProductPageViewController__preview;
  }
  else
  {
    [(SUUICarouselPageSection *)self _reloadLegacySizing];
  }
  [v4 activePageWidth];
  double v33 = v32;
  v34 = [(SUUICarouselPageSection *)self _carouselCollectionView];
  [v34 setSemanticContentAttribute:storeSemanticContentAttribute()];
  v35 = (double *)((char *)self + v10[882]);
  objc_msgSend(v34, "setFrame:", 0.0, 0.0, v33, v35[1]);
  v36 = [v34 collectionViewLayout];
  objc_msgSend(v36, "setItemSize:", *v35, v35[1]);
  uint64_t v37 = v11[876];
  uint64_t v38 = [*(id *)((char *)&self->super.super.isa + v37) count];
  if (v38)
  {
    uint64_t v39 = v38;
    [v34 contentInset];
    double v41 = v40;
    double v43 = v42;
    [(SUUICarouselPageSection *)self _actualContentWidth];
    double v45 = v44;
    if (v44 <= v33 + v33)
    {
      v46 = 0;
      self->_cellCount = [*(id *)((char *)&self->super.super.isa + v37) count];
      float v50 = (v33 - v45) * 0.5;
      double v47 = fmaxf(floorf(v50), 15.0);
      BOOL v48 = v39 > 1;
    }
    else
    {
      self->_cellCount = 100000;
      v46 = [MEMORY[0x263F088C8] indexPathForItem:20000 / v39 * v39 inSection:0];
      double v47 = 0.0;
      BOOL v48 = 1;
    }
    v49 = v52;
    [v34 setAlwaysBounceHorizontal:v48];
    objc_msgSend(v34, "setContentInset:", v41, v47, v43, v47);
    if (v46)
    {
      if (self->_needsReload)
      {
        if (!self->_reloadIndexPath) {
          objc_storeStrong((id *)&self->_reloadIndexPath, v46);
        }
      }
      else
      {
        [(SUUICarouselPageSection *)self _scrollToItemAtIndexPath:v46 animated:0];
      }
    }
  }
  else
  {
    self->_cellCount = 0;
    double *v35 = v33;
    v35[1] = 20.0;
    v49 = v52;
  }
  v54.receiver = self;
  v54.super_class = (Class)SUUICarouselPageSection;
  [(SUUIStorePageSection *)&v54 willAppearInContext:v4];
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  uint64_t v8 = [(NSArray *)self->_modelObjects count];
  if (v8 >= 1)
  {
    unint64_t v9 = v8;
    double v35 = height;
    uint64_t v10 = [(SUUICarouselPageSection *)self _carouselCollectionView];
    [v10 contentInset];
    double v12 = v11;
    double v14 = v13;
    [v10 bounds];
    CGFloat x = v43.origin.x;
    CGFloat y = v43.origin.y;
    CGFloat v17 = v43.size.width;
    CGFloat v18 = v43.size.height;
    double MidX = CGRectGetMidX(v43);
    v44.origin.CGFloat x = x;
    v44.origin.CGFloat y = y;
    v44.size.double width = v17;
    v44.size.double height = v18;
    objc_super v20 = objc_msgSend(v10, "indexPathForItemAtPoint:", MidX, CGRectGetMidY(v44));
    uint64_t v21 = [v20 item];

    uint64_t v22 = [(SUUIStorePageSection *)self pageComponent];
    uint64_t v23 = [v22 viewElement];

    if (!v23)
    {
      [(SUUICarouselPageSection *)self _reloadLegacySizing];
      [(SUUICarouselPageSection *)self prefetchResourcesWithReason:0];
    }
    uint64_t v24 = v21 % (uint64_t)v9;
    float64_t v25 = [(SUUIStorePageSection *)self context];
    [v25 activePageWidth];
    double v27 = v26;

    [(SUUICarouselPageSection *)self _actualContentWidth];
    double v29 = v28;
    if (v28 <= v27 + v27)
    {
      self->_cellCount = [(NSArray *)self->_modelObjects count];
      float v32 = (v27 - v29) * 0.5;
      double v30 = fmaxf(floorf(v32), 0.0);
      BOOL v31 = v9 > 1;
    }
    else
    {
      self->_cellCount = 100000;
      v24 += 0x4E20 / v9 * v9;
      double v30 = 0.0;
      BOOL v31 = 1;
    }
    double height = v35;
    [v10 setAlwaysBounceHorizontal:v31];
    objc_msgSend(v10, "setContentInset:", v12, v30, v14, v30);
    double v33 = (void *)MEMORY[0x263F82E00];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __74__SUUICarouselPageSection_willTransitionToSize_withTransitionCoordinator___block_invoke;
    v38[3] = &unk_265402F60;
    double v41 = v27;
    id v39 = v10;
    double v40 = self;
    uint64_t v42 = v24;
    id v34 = v10;
    [v33 performWithoutAnimation:v38];
    [(SUUICarouselPageSection *)self _cancelCycleTimer];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __74__SUUICarouselPageSection_willTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v37[3] = &unk_265400820;
    v37[4] = self;
    [v7 animateAlongsideTransition:0 completion:v37];
  }
  v36.receiver = self;
  v36.super_class = (Class)SUUICarouselPageSection;
  -[SUUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v36, sel_willTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

void __74__SUUICarouselPageSection_willTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) frame];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  v2 = [*(id *)(a1 + 32) collectionViewLayout];
  objc_msgSend(v2, "setItemSize:", *(double *)(*(void *)(a1 + 40) + 120), *(double *)(*(void *)(a1 + 40) + 128));
  [v2 setMinimumInteritemSpacing:*(double *)(*(void *)(a1 + 40) + 136)];
  [v2 setMinimumLineSpacing:*(double *)(*(void *)(a1 + 40) + 136)];
  [v2 invalidateLayout];
  [*(id *)(a1 + 32) reloadData];
  [*(id *)(a1 + 32) layoutIfNeeded];
  double v3 = [MEMORY[0x263F088C8] indexPathForItem:*(void *)(a1 + 56) inSection:0];
  [*(id *)(a1 + 40) _scrollToItemAtIndexPath:v3 animated:0];
  id v4 = *(void **)(a1 + 32);
  v6[0] = v3;
  double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  [v4 reloadItemsAtIndexPaths:v5];
}

uint64_t __74__SUUICarouselPageSection_willTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startCycleTimerIfNecessary];
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [(UICollectionView *)self->_carouselCollectionView indexPathsForVisibleItems];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v8);
      }
      double v13 = -[UICollectionView cellForItemAtIndexPath:](self->_carouselCollectionView, "cellForItemAtIndexPath:", *(void *)(*((void *)&v15 + 1) + 8 * v12), (void)v15);
      char v14 = [v13 setImage:v7 forArtworkRequest:v6 context:self->_cellLayoutContext];

      if (v14) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)missingItemLoader:(id)a3 didLoadItems:(id)a4 invalidItemIdentifiers:(id)a5
{
  id v7 = a4;
  if ([v7 count])
  {
    id v6 = [(SUUIStorePageSection *)self pageComponent];
    [v6 updateWithMissingItems:v7];
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [v6 item];
  unint64_t v9 = v8 % [(NSArray *)self->_modelObjects count];
  uint64_t v10 = [(NSArray *)self->_modelObjects objectAtIndex:v9];
  uint64_t v11 = [(SUUIStorePageSection *)self pageComponent];
  uint64_t v12 = [v11 viewElement];

  if (v12)
  {
    double v13 = [(SUUICarouselPageSection *)self _dequeueCellForViewElement:v10 collectionView:v7 indexPath:v6];

    [v13 reloadWithViewElement:v10 width:self->_cellLayoutContext context:self->_itemSize.width];
  }
  else
  {
    double v13 = [v7 dequeueReusableCellWithReuseIdentifier:0x2704FE9D0 forIndexPath:v6];

    objc_msgSend(v13, "reloadWithCarouselItem:size:context:", v10, self->_cellLayoutContext, self->_itemSize.width, self->_itemSize.height);
    char v14 = [(SUUIStorePageSection *)self context];
    long long v15 = [v14 metricsController];
    long long v16 = [v15 activeImpressionsSession];

    if (v16) {
      [(SUUICarouselPageSection *)self _addImpressionForIndex:v9 toSession:v16];
    }
    [(SUUICarouselPageSection *)self _loadMissingItemsFromIndex:v9 withReason:1];
  }
  return v13;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return self->_cellCount;
}

- (void)collectionView:(id)a3 carouselLayout:(id)a4 willApplyLayoutAttributes:(id)a5
{
  id v16 = a3;
  id v7 = a5;
  unint64_t v8 = [(SUUIStorePageSection *)self pageComponent];
  unint64_t v9 = [v8 viewElement];

  if (!v9) {
    goto LABEL_3;
  }
  modelObjects = self->_modelObjects;
  uint64_t v11 = [v7 indexPath];
  uint64_t v12 = -[NSArray objectAtIndex:](modelObjects, "objectAtIndex:", [v11 item] % -[NSArray count](self->_modelObjects, "count"));

  double v13 = [v12 style];
  char v14 = [v13 ikBackgroundColor];
  long long v15 = [v14 color];

  if (!v15)
  {
LABEL_3:
    long long v15 = [v16 backgroundColor];
  }
  [v7 setBackgroundColor:v15];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [v6 item];
  unint64_t v9 = v8 % [(NSArray *)self->_modelObjects count];
  uint64_t v10 = [(SUUIStorePageSection *)self pageComponent];
  id v16 = [v10 viewElement];

  uint64_t v11 = [(NSArray *)self->_modelObjects objectAtIndex:v9];
  if (v16)
  {
    [v11 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
  else
  {
    uint64_t v12 = [v11 link];
    double v13 = [(SUUIStorePageSection *)self clickEventWithLink:v12 elementName:*MEMORY[0x263F7BBB0] index:v9];
    if (v13)
    {
      char v14 = [(SUUIStorePageSection *)self context];
      long long v15 = [v14 metricsController];
      [v15 recordEvent:v13];
    }
    [(SUUIStorePageSection *)self showPageWithLink:v12];
  }
  [v7 deselectItemAtIndexPath:v6 animated:1];
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return [(SUUICarouselPageSection *)self _isItemEnabledAtIndexPath:a4];
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return [(SUUICarouselPageSection *)self _isItemEnabledAtIndexPath:a4];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  -[NSArray objectAtIndex:](self->_modelObjects, "objectAtIndex:", objc_msgSend(a5, "item", a3, a4) % -[NSArray count](self->_modelObjects, "count"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(SUUIStorePageSection *)self context];
  id v7 = [v6 activeMetricsImpressionSession];
  [v7 beginActiveImpressionForViewElement:v8];

  [v8 dispatchEventOfType:9 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v9 = a5;
  if ([(NSArray *)self->_modelObjects count])
  {
    id v6 = -[NSArray objectAtIndex:](self->_modelObjects, "objectAtIndex:", [v9 item] % -[NSArray count](self->_modelObjects, "count"));
    id v7 = [(SUUIStorePageSection *)self context];
    id v8 = [v7 activeMetricsImpressionSession];
    [v8 endActiveImpressionForViewElement:v6];

    [v6 dispatchEventOfType:10 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (self->_progressIndicatorElement)
  {
    id v4 = [(SUUIStorePageSection *)self context];
    double v5 = [v4 collectionView];
    id v6 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", self->_progressIndicatorCellIndex, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
    id v7 = [v5 cellForItemAtIndexPath:v6];

    objc_msgSend(v7, "setCurrentPage:", -[SUUICarouselPageSection _currentPageIndex](self, "_currentPageIndex"));
  }
  [(SUUICarouselPageSection *)self _startCycleTimerIfNecessary];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  if (self->_progressIndicatorElement)
  {
    id v4 = [(SUUIStorePageSection *)self context];
    double v5 = [v4 collectionView];
    id v6 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", self->_progressIndicatorCellIndex, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
    id v7 = [v5 cellForItemAtIndexPath:v6];

    objc_msgSend(v7, "setCurrentPage:", -[SUUICarouselPageSection _currentPageIndex](self, "_currentPageIndex"));
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  cycleTimer = self->_cycleTimer;
  if (cycleTimer)
  {
    dispatch_source_cancel(cycleTimer);
    double v5 = self->_cycleTimer;
    self->_cycleTimer = 0;
  }
}

- (double)_actualContentWidth
{
  uint64_t v3 = [(NSArray *)self->_modelObjects count];
  double result = self->_itemSize.width * (double)v3;
  if (v3 >= 2) {
    return result + (double)(v3 - 1) * self->_itemSpacing;
  }
  return result;
}

- (void)_addImpressionForIndex:(int64_t)a3 toSession:(id)a4
{
  modelObjects = self->_modelObjects;
  id v6 = a4;
  id v7 = [(NSArray *)modelObjects objectAtIndex:a3];
  objc_msgSend(v6, "addItemIdentifier:", objc_msgSend(v7, "carouselItemIdentifier"));
}

- (void)_cancelCycleTimer
{
  cycleTimer = self->_cycleTimer;
  if (cycleTimer)
  {
    dispatch_source_cancel(cycleTimer);
    id v4 = self->_cycleTimer;
    self->_cycleTimer = 0;
  }
}

- (id)_carouselCollectionView
{
  carouselCollectionView = self->_carouselCollectionView;
  if (!carouselCollectionView)
  {
    id v4 = objc_alloc_init(SUUICarouselCollectionViewLayout);
    [(UICollectionViewFlowLayout *)v4 setMinimumInteritemSpacing:self->_itemSpacing];
    [(UICollectionViewFlowLayout *)v4 setMinimumLineSpacing:self->_itemSpacing];
    [(UICollectionViewFlowLayout *)v4 setScrollDirection:1];
    id v5 = objc_alloc(MEMORY[0x263F82528]);
    id v6 = (UICollectionView *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v7 = self->_carouselCollectionView;
    self->_carouselCollectionView = v6;

    [(UICollectionView *)self->_carouselCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x27050B090];
    [(UICollectionView *)self->_carouselCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270502AB0];
    [(UICollectionView *)self->_carouselCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x2705094D0];
    [(UICollectionView *)self->_carouselCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x2704FE9D0];
    [(UICollectionView *)self->_carouselCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x27050B010];
    [(UICollectionView *)self->_carouselCollectionView registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270503310];
    [(UICollectionView *)self->_carouselCollectionView setDataSource:self];
    [(UICollectionView *)self->_carouselCollectionView setDecelerationRate:0.7];
    [(UICollectionView *)self->_carouselCollectionView setDelegate:self];
    [(UICollectionView *)self->_carouselCollectionView setScrollsToTop:0];
    [(UICollectionView *)self->_carouselCollectionView setShowsHorizontalScrollIndicator:0];
    [(UICollectionView *)self->_carouselCollectionView setShowsVerticalScrollIndicator:0];
    [(UICollectionView *)self->_carouselCollectionView setSemanticContentAttribute:storeSemanticContentAttribute()];
    [(UICollectionView *)self->_carouselCollectionView setPrefetchingEnabled:0];
    id v8 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", 0, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
    id v9 = self->_carouselCollectionView;
    uint64_t v10 = [(SUUICarouselPageSection *)self backgroundColorForIndexPath:v8];
    [(UICollectionView *)v9 setBackgroundColor:v10];

    carouselCollectionView = self->_carouselCollectionView;
  }
  return carouselCollectionView;
}

- (Class)_cellClassForLockup:(id)a3
{
  if ((unint64_t)[a3 lockupViewType] <= 8)
  {
    uint64_t v3 = objc_opt_class();
  }
  return (Class)v3;
}

- (Class)_cellClassForViewElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 elementType];
  id v6 = 0;
  if (v5 > 65)
  {
    if (v5 == 66)
    {
      uint64_t v7 = [(SUUICarouselPageSection *)self _cellClassForLockup:v4];
      goto LABEL_9;
    }
    if (v5 != 152) {
      goto LABEL_10;
    }
LABEL_7:
    uint64_t v7 = objc_opt_class();
LABEL_9:
    id v6 = (void *)v7;
    goto LABEL_10;
  }
  if (v5 == 14 || v5 == 49) {
    goto LABEL_7;
  }
LABEL_10:

  return (Class)v6;
}

- (int64_t)_currentPageIndex
{
  uint64_t v3 = [(SUUICarouselPageSection *)self _carouselCollectionView];
  [v3 bounds];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  double MidX = CGRectGetMidX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  id v9 = objc_msgSend(v3, "indexPathForItemAtPoint:", MidX, CGRectGetMidY(v14));
  unint64_t v10 = [v9 item];
  unint64_t v11 = v10 % [(NSArray *)self->_modelObjects count];

  return v11;
}

- (id)_dequeueCellForLockup:(id)a3 collectionView:(id)a4 indexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  unint64_t v9 = [a3 lockupViewType];
  if (v9 > 8)
  {
    unint64_t v10 = 0;
  }
  else
  {
    unint64_t v10 = [v7 dequeueReusableCellWithReuseIdentifier:*off_265404448[v9] forIndexPath:v8];
  }

  return v10;
}

- (id)_dequeueCellForViewElement:(id)a3 collectionView:(id)a4 indexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 elementType];
  uint64_t v12 = 0;
  if (v11 > 48)
  {
    if (v11 != 49)
    {
      if (v11 == 66)
      {
        uint64_t v14 = [(SUUICarouselPageSection *)self _dequeueCellForLockup:v8 collectionView:v9 indexPath:v10];
        goto LABEL_11;
      }
      if (v11 != 152) {
        goto LABEL_13;
      }
    }
    uint64_t v13 = 0x2704FE9D0;
LABEL_9:
    uint64_t v14 = [v9 dequeueReusableCellWithReuseIdentifier:v13 forIndexPath:v10];
LABEL_11:
    uint64_t v12 = (void *)v14;
    goto LABEL_13;
  }
  if (v11 != 14)
  {
    if (v11 != 28) {
      goto LABEL_13;
    }
    uint64_t v13 = 0x270502AB0;
    goto LABEL_9;
  }
  uint64_t v12 = [v9 dequeueReusableCellWithReuseIdentifier:0x27050B090 forIndexPath:v10];
  [v12 setArtworkBoundingSize:0];
  objc_msgSend(v12, "setContentInset:", 0.0, 15.0, 0.0, 15.0);
LABEL_13:

  return v12;
}

- (void)_fireCycleTimer
{
  id v11 = [(SUUICarouselPageSection *)self _carouselCollectionView];
  [v11 bounds];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  double MidX = CGRectGetMidX(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  id v8 = objc_msgSend(v11, "indexPathForItemAtPoint:", MidX, CGRectGetMidY(v14));
  uint64_t v9 = [v8 item];

  id v10 = [MEMORY[0x263F088C8] indexPathForItem:v9 + 1 inSection:0];
  [(SUUICarouselPageSection *)self _scrollToItemAtIndexPath:v10 animated:1];
}

- (BOOL)_indexPathIsProgressIndicator:(id)a3
{
  return self->_progressIndicatorElement && [a3 item] == self->_progressIndicatorCellIndex;
}

- (BOOL)_isItemEnabledAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SUUIStorePageSection *)self pageComponent];
  id v6 = [v5 viewElement];

  if (v6)
  {
    id v7 = -[NSArray objectAtIndex:](self->_modelObjects, "objectAtIndex:", [v4 item] % -[NSArray count](self->_modelObjects, "count"));
    char v8 = [v7 isEnabled];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (CGSize)_legacyItemSize
{
  v2 = [(SUUIStorePageSection *)self context];
  [v2 activePageWidth];
  double v4 = v3;
  uint64_t v5 = [v2 clientContext];
  uint64_t v6 = SUUIUserInterfaceIdiom(v5);

  if (v6 == 1)
  {
    id v7 = [MEMORY[0x263F82B60] mainScreen];
    [v7 bounds];
    double v9 = v8;

    if (v4 >= v9)
    {
      *(double *)&uint64_t v10 = 260.0;
      *(double *)&uint64_t v11 = 530.0;
      goto LABEL_12;
    }
    if (v4 >= v9 * 0.666666687)
    {
      *(double *)&uint64_t v10 = 195.0;
      *(double *)&uint64_t v11 = 398.0;
      goto LABEL_12;
    }
    *(double *)&uint64_t v10 = 130.0;
  }
  else
  {
    *(double *)&uint64_t v10 = 130.0;
    if (v4 >= 736.0)
    {
      *(double *)&uint64_t v11 = 265.0;
      goto LABEL_12;
    }
    *(double *)&uint64_t v11 = 375.0;
    if (v4 >= 375.0)
    {
      *(double *)&uint64_t v10 = 152.0;
      goto LABEL_12;
    }
  }
  *(double *)&uint64_t v11 = 320.0;
LABEL_12:

  double v12 = *(double *)&v11;
  double v13 = *(double *)&v10;
  result.CGFloat height = v13;
  result.CGFloat width = v12;
  return result;
}

- (double)_legacyItemSpacing
{
  v2 = [(SUUIStorePageSection *)self context];
  [v2 activePageWidth];
  double v4 = v3;
  uint64_t v5 = [v2 clientContext];
  uint64_t v6 = SUUIUserInterfaceIdiom(v5);

  if (v6 == 1)
  {
    id v7 = [MEMORY[0x263F82B60] mainScreen];
    [v7 bounds];
    double v9 = v8;

    double v10 = v9 * 0.5;
    double v11 = 5.0;
  }
  else
  {
    double v11 = 3.0;
    double v10 = 736.0;
  }
  if (v4 >= v10) {
    double v12 = v11;
  }
  else {
    double v12 = 0.0;
  }

  return v12;
}

- (void)_loadMissingItemsFromIndex:(int64_t)a3 withReason:(int64_t)a4
{
  id v8 = [(SUUIStorePageSection *)self pageComponent];
  if ([v8 isMissingItemData])
  {
    id v7 = [(SUUICarouselPageSection *)self _missingItemLoader];
    [v7 loadItemsForPageComponent:v8 startIndex:a3 reason:a4];
  }
}

- (id)_missingItemLoader
{
  missingItemLoader = self->_missingItemLoader;
  if (!missingItemLoader)
  {
    double v4 = [SUUIMissingItemLoader alloc];
    uint64_t v5 = [(SUUIStorePageSection *)self context];
    uint64_t v6 = [v5 resourceLoader];
    id v7 = [(SUUIMissingItemLoader *)v4 initWithResourceLoader:v6];
    id v8 = self->_missingItemLoader;
    self->_missingItemLoader = v7;

    [(SUUIMissingItemLoader *)self->_missingItemLoader setDelegate:self];
    missingItemLoader = self->_missingItemLoader;
  }
  return missingItemLoader;
}

- (void)_reloadLegacySizing
{
  p_itemSize = &self->_itemSize;
  [(SUUICarouselPageSection *)self _legacyItemSize];
  p_itemSize->CGFloat width = v4;
  p_itemSize->CGFloat height = v5;
  [(SUUICarouselPageSection *)self _legacyItemSpacing];
  self->_itemSpacing = v6;
  double v7 = 1.0;
  if (v6 <= 0.00000011920929) {
    double v7 = 0.0;
  }
  cellLayoutContext = self->_cellLayoutContext;
  objc_msgSend(MEMORY[0x263F08D40], "valueWithUIEdgeInsets:", 0.0, v7, 1.0, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(SUUIViewElementLayoutContext *)cellLayoutContext setAggregateValue:v9 forKey:0x2704FE9B0];
}

- (void)_reloadViewElementProperties
{
  id v16 = [(SUUIStorePageSection *)self pageComponent];
  double v3 = [v16 viewElement];
  CGFloat v4 = [v3 style];
  CGFloat v5 = [v4 itemWidth];

  if (v5)
  {
    [v5 floatValue];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }
  self->_double itemWidth = v7;
  if (v3)
  {
    id v8 = [v3 flattenedChildren];
    modelObjects = self->_modelObjects;
    self->_modelObjects = v8;

    double v10 = [v3 progressIndicatorElement];
    progressIndicatorElement = self->_progressIndicatorElement;
    self->_progressIndicatorElement = v10;
  }
  else
  {
    double v12 = [v16 carouselItems];
    double v13 = self->_modelObjects;
    self->_modelObjects = v12;

    progressIndicatorElement = self->_progressIndicatorElement;
    self->_progressIndicatorElement = 0;
  }

  CGRect v14 = [(SUUIProgressIndicatorViewElement *)self->_progressIndicatorElement style];
  int64_t v15 = [v14 elementPosition] != 2;

  self->_progressIndicatorCellIndeCGFloat x = v15;
}

- (void)_startCycleTimerIfNecessary
{
  if (!self->_cycleTimer)
  {
    double v3 = [(SUUIStorePageSection *)self pageComponent];
    [v3 cycleInterval];
    double v5 = v4;

    if (v5 > 2.22044605e-16)
    {
      [(SUUICarouselPageSection *)self _actualContentWidth];
      double v7 = v6;
      id v8 = [(SUUIStorePageSection *)self context];
      [v8 activePageWidth];
      double v10 = v9 + v9;

      if (v7 > v10)
      {
        double v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
        cycleTimer = self->_cycleTimer;
        self->_cycleTimer = v11;

        double v13 = v5 * 1000000000.0;
        CGRect v14 = self->_cycleTimer;
        dispatch_time_t v15 = dispatch_time(0, (uint64_t)v13);
        dispatch_source_set_timer(v14, v15, (unint64_t)v13, 0);
        objc_initWeak(&location, self);
        id v16 = self->_cycleTimer;
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __54__SUUICarouselPageSection__startCycleTimerIfNecessary__block_invoke;
        v17[3] = &unk_265401538;
        objc_copyWeak(&v18, &location);
        dispatch_source_set_event_handler(v16, v17);
        dispatch_resume((dispatch_object_t)self->_cycleTimer);
        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __54__SUUICarouselPageSection__startCycleTimerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fireCycleTimer];
}

- (void)_scrollToItemAtIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  double v6 = [(SUUICarouselPageSection *)self _carouselCollectionView];
  uint64_t v7 = [v6 numberOfItemsInSection:0];

  if ([v9 row] < v7)
  {
    id v8 = [(SUUICarouselPageSection *)self _carouselCollectionView];
    [v8 scrollToItemAtIndexPath:v9 atScrollPosition:16 animated:v4];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadIndexPath, 0);
  objc_storeStrong((id *)&self->_progressIndicatorElement, 0);
  objc_storeStrong((id *)&self->_modelObjects, 0);
  objc_storeStrong((id *)&self->_missingItemLoader, 0);
  objc_storeStrong((id *)&self->_cycleTimer, 0);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
  objc_storeStrong((id *)&self->_carouselCollectionView, 0);
}

@end