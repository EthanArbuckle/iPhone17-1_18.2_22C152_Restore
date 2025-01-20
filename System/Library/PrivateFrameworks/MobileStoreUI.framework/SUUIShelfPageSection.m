@interface SUUIShelfPageSection
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5;
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SUUIScrollViewDelegateObserver)scrollViewDelegateObserver;
- (SUUIShelfPageSection)initWithPageComponent:(id)a3;
- (SUUIShelfPageSection)initWithPageComponent:(id)a3 configuration:(id)a4;
- (SUUIShelfPageSectionConfiguration)configuration;
- (UIEdgeInsets)sectionContentInset;
- (id)_normalizedShelfItemIndexPathFromActualIndexPath:(id)a3;
- (id)backgroundColorForIndexPath:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4;
- (id)shelfPageSectionConfiguration:(id)a3 viewElementAtIndex:(int64_t)a4;
- (int64_t)applyUpdateType:(int64_t)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfCells;
- (void)_performDefaultSelectActionForEffectiveViewElement:(id)a3;
- (void)_reloadViewElementProperties;
- (void)_setContext:(id)a3;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)collectionView:(id)a3 didConfirmButtonElement:(id)a4 withClickInfo:(id)a5 forItemAtIndexPath:(id)a6;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 layout:(id)a4 willApplyLayoutAttributes:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewWillApplyLayoutAttributes:(id)a3;
- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3;
- (void)dealloc;
- (void)deselectItemsAnimated:(BOOL)a3;
- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4;
- (void)getModalSourceViewForViewElement:(id)a3 completionBlock:(id)a4;
- (void)invalidateCachedLayoutInformation;
- (void)prefetchResourcesWithReason:(int64_t)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setScrollViewDelegateObserver:(id)a3;
- (void)setTopSection:(BOOL)a3;
- (void)viewElementSlideshowWillDismiss:(id)a3;
- (void)willAppearInContext:(id)a3;
- (void)willPresentPreviewViewController:(id)a3 forLocation:(CGPoint)a4 inSourceView:(id)a5;
@end

@implementation SUUIShelfPageSection

- (SUUIShelfPageSection)initWithPageComponent:(id)a3
{
  return [(SUUIShelfPageSection *)self initWithPageComponent:a3 configuration:0];
}

- (SUUIShelfPageSection)initWithPageComponent:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SUUIShelfPageSection;
  v7 = [(SUUIStorePageSection *)&v11 initWithPageComponent:a3];
  if (v7)
  {
    if (v6) {
      v8 = (SUUIShelfPageSectionConfiguration *)v6;
    }
    else {
      v8 = objc_alloc_init(SUUIShelfPageSectionConfiguration);
    }
    configuration = v7->_configuration;
    v7->_configuration = v8;

    [(SUUIShelfPageSectionConfiguration *)v7->_configuration setDataSource:v7];
    [(SUUIShelfPageSectionConfiguration *)v7->_configuration setShelfCollectionViewDataSource:v7];
    [(SUUIShelfPageSectionConfiguration *)v7->_configuration setShelfCollectionViewDelegate:v7];
    [(SUUIShelfPageSection *)v7 _reloadViewElementProperties];
  }

  return v7;
}

- (void)dealloc
{
  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setArtworkRequestDelegate:0];
  [(SUUIShelfPageSectionConfiguration *)self->_configuration setShelfCollectionViewDataSource:0];
  [(SUUIShelfPageSectionConfiguration *)self->_configuration setShelfCollectionViewDelegate:0];
  [(SUUIViewElementSlideshowController *)self->_slideshowController setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIShelfPageSection;
  [(SUUIStorePageSection *)&v3 dealloc];
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(SUUIStorePageSection *)self pageComponent];
  v7 = [v6 viewElement];
  [v5 addItemViewElement:v7];

  v8 = [(SUUIShelfPageSectionConfiguration *)self->_configuration existingShelfCollectionView];
  v9 = [v8 indexPathsForVisibleItems];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14), "item", (void)v16));
        [v5 addItemViewElement:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (int64_t)applyUpdateType:(int64_t)a3
{
  [(SUUIShelfPageSection *)self _reloadViewElementProperties];
  if (![(SUUIShelfPageSectionConfiguration *)self->_configuration needsShelfCollectionViewReload])[(SUUIShelfPageSectionConfiguration *)self->_configuration setNeedsShelfCollectionViewReload:[(SUUIShelfViewElement *)self->_shelfViewElement updateType] != 0]; {
  v6.receiver = self;
  }
  v6.super_class = (Class)SUUIShelfPageSection;
  return [(SUUIStorePageSection *)&v6 applyUpdateType:a3];
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIShelfPageSectionConfiguration *)self->_configuration backgroundColorForShelfViewElement:self->_shelfViewElement];
  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUIShelfPageSection;
    id v5 = [(SUUIStorePageSection *)&v7 backgroundColorForIndexPath:v4];
  }

  return v5;
}

- (id)cellForIndexPath:(id)a3
{
  return [(SUUIShelfPageSectionConfiguration *)self->_configuration cellForShelfViewElement:self->_shelfViewElement indexPath:a3];
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  configuration = self->_configuration;
  shelfViewElement = self->_shelfViewElement;
  viewElements = self->_viewElements;
  id v6 = a3;
  [(SUUIShelfPageSectionConfiguration *)configuration cellSizeForShelfViewElement:shelfViewElement indexPath:v6 numberOfShelfItems:[(NSArray *)viewElements count]];
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)collectionViewWillApplyLayoutAttributes:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIShelfPageSection;
  id v4 = a3;
  [(SUUIStorePageSection *)&v5 collectionViewWillApplyLayoutAttributes:v4];
  -[SUUIShelfPageSectionConfiguration collectionViewWillApplyLayoutAttributes:](self->_configuration, "collectionViewWillApplyLayoutAttributes:", v4, v5.receiver, v5.super_class);
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SUUIStorePageSection *)self pageComponent];
  id v6 = [v5 viewElement];

  double v7 = [(SUUIStorePageSection *)self context];
  double v8 = [v7 activeMetricsImpressionSession];
  [v8 beginActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SUUIShelfPageSection;
  [(SUUIStorePageSection *)&v9 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SUUIStorePageSection *)self pageComponent];
  id v6 = [v5 viewElement];

  double v7 = [(SUUIStorePageSection *)self context];
  double v8 = [v7 activeMetricsImpressionSession];
  [v8 endActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SUUIShelfPageSection;
  [(SUUIStorePageSection *)&v9 collectionViewDidEndDisplayingCellForItemAtIndexPath:v4];
}

- (void)deselectItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v5 = [(SUUIShelfPageSectionConfiguration *)self->_configuration existingShelfCollectionView];
  id v6 = [v5 indexPathsForSelectedItems];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 deselectItemAtIndexPath:*(void *)(*((void *)&v12 + 1) + 8 * v10++) animated:v3];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  v11.receiver = self;
  v11.super_class = (Class)SUUIShelfPageSection;
  [(SUUIStorePageSection *)&v11 deselectItemsAnimated:v3];
}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  configuration = self->_configuration;
  shelfViewElement = self->_shelfViewElement;
  viewElements = self->_viewElements;
  id v9 = a4;
  id v10 = a3;
  [(SUUIShelfPageSectionConfiguration *)configuration reloadShelfLayoutDataForShelfViewElement:shelfViewElement withShelfItemViewElements:viewElements requestCellLayouts:1 numberOfShelfItems:[(NSArray *)viewElements count]];
  v11.receiver = self;
  v11.super_class = (Class)SUUIShelfPageSection;
  [(SUUIStorePageSection *)&v11 entityProvider:v10 didInvalidateWithContext:v9];
}

- (void)getModalSourceViewForViewElement:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, SUUIModalSourceViewProvider *))a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__64;
  v24 = __Block_byref_object_dispose__64;
  id v25 = 0;
  viewElements = self->_viewElements;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __73__SUUIShelfPageSection_getModalSourceViewForViewElement_completionBlock___block_invoke;
  v17[3] = &unk_265401BB8;
  v17[4] = self;
  id v9 = v6;
  id v18 = v9;
  long long v19 = &v20;
  [(NSArray *)viewElements enumerateObjectsUsingBlock:v17];
  id v10 = (SUUIModalSourceViewProvider *)v21[5];
  if (v10)
  {
    uint64_t v11 = [(SUUIShelfPageSectionConfiguration *)self->_configuration actualIndexPathOfShelfItemClosestToVisibleBoundsForNormalizedIndexPath:v10 numberOfShelfItems:[(NSArray *)self->_viewElements count]];
    long long v12 = (void *)v21[5];
    v21[5] = v11;

    id v10 = objc_alloc_init(SUUIModalSourceViewProvider);
    [(SUUIModalSourceViewProvider *)v10 setUserInfo:v9];
    long long v13 = [(SUUIShelfPageSectionConfiguration *)self->_configuration existingShelfCollectionView];
    long long v14 = [v13 cellForItemAtIndexPath:v21[5]];

    long long v15 = [v9 itmlID];
    long long v16 = [v14 viewForElementIdentifier:v15];

    if (v16) {
      [(SUUIModalSourceViewProvider *)v10 setOriginalSourceView:v16];
    }
    else {
      [(SUUIModalSourceViewProvider *)v10 setOriginalSourceView:v14];
    }
  }
  v7[2](v7, v10);

  _Block_object_dispose(&v20, 8);
}

void __73__SUUIShelfPageSection_getModalSourceViewForViewElement_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v10 = [*(id *)(*(void *)(a1 + 32) + 96) effectiveViewElementForShelfItemViewElement:a2];
  if (objc_msgSend(*(id *)(a1 + 40), "isDescendentFromViewElement:"))
  {
    uint64_t v7 = [MEMORY[0x263F088C8] indexPathForItem:a3 inSection:0];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
  }
}

- (void)invalidateCachedLayoutInformation
{
  [(SUUIShelfPageSectionConfiguration *)self->_configuration setNeedsShelfCollectionViewLayout:1];
  BOOL v3 = [(SUUIShelfPageSectionConfiguration *)self->_configuration existingShelfCollectionView];
  [v3 reloadData];

  v4.receiver = self;
  v4.super_class = (Class)SUUIShelfPageSection;
  [(SUUIStorePageSection *)&v4 invalidateCachedLayoutInformation];
}

- (int64_t)numberOfCells
{
  return [(SUUIShelfPageSectionConfiguration *)self->_configuration numberOfSectionCells];
}

- (void)prefetchResourcesWithReason:(int64_t)a3
{
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  viewElements = self->_viewElements;
  v8[3] = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__SUUIShelfPageSection_prefetchResourcesWithReason___block_invoke;
  v7[3] = &unk_265402500;
  v7[5] = v8;
  v7[6] = a3;
  v7[4] = self;
  [(NSArray *)viewElements enumerateObjectsUsingBlock:v7];
  v6.receiver = self;
  v6.super_class = (Class)SUUIShelfPageSection;
  [(SUUIStorePageSection *)&v6 prefetchResourcesWithReason:a3];
  _Block_object_dispose(v8, 8);
}

uint64_t __52__SUUIShelfPageSection_prefetchResourcesWithReason___block_invoke(void *a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t result = [*(id *)(a1[4] + 96) prefetchResourcesForShelfItemViewElement:a2 reason:a1[6]];
  if (result) {
    *a4 = ++*(void *)(*(void *)(a1[5] + 8) + 24) > 9;
  }
  return result;
}

- (id)previewingContext:(id)a3 viewControllerForLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  configuration = self->_configuration;
  id v8 = a3;
  id v9 = [(SUUIShelfPageSectionConfiguration *)configuration existingShelfCollectionView];
  id v10 = [v8 sourceView];

  objc_msgSend(v9, "convertPoint:fromView:", v10, x, y);
  uint64_t v11 = objc_msgSend(v9, "indexPathForItemAtPoint:");
  long long v12 = -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", [v11 item]);
  long long v13 = [(SUUIStorePageSection *)self context];
  long long v14 = [v13 clientContext];
  long long v15 = [v14 previewViewControllerForViewElement:v12];

  return v15;
}

- (void)willPresentPreviewViewController:(id)a3 forLocation:(CGPoint)a4 inSourceView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  configuration = self->_configuration;
  id v9 = a5;
  id v10 = a3;
  id v18 = [(SUUIShelfPageSectionConfiguration *)configuration existingShelfCollectionView];
  objc_msgSend(v18, "convertPoint:fromView:", v9, x, y);
  double v12 = v11;
  double v14 = v13;

  long long v15 = objc_msgSend(v18, "indexPathForItemAtPoint:", v12, v14);
  long long v16 = [v18 cellForItemAtIndexPath:v15];
  uint64_t v17 = [v10 presentationController];

  [v17 setSourceView:v16];
  [v16 bounds];
  objc_msgSend(v17, "setSourceRect:");
}

- (UIEdgeInsets)sectionContentInset
{
  configuration = self->_configuration;
  v12.receiver = self;
  v12.super_class = (Class)SUUIShelfPageSection;
  [(SUUIStorePageSection *)&v12 sectionContentInset];
  -[SUUIShelfPageSectionConfiguration sectionContentInsetAdjustedFromValue:forShelfViewElement:withSectionIndex:](configuration, "sectionContentInsetAdjustedFromValue:forShelfViewElement:withSectionIndex:", self->_shelfViewElement, [(SUUIStorePageSection *)self sectionIndex], v4, v5, v6, v7);
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (void)setTopSection:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUUIShelfPageSection;
  -[SUUIStorePageSection setTopSection:](&v5, sel_setTopSection_);
  [(SUUIShelfPageSectionConfiguration *)self->_configuration setTopSection:v3];
}

- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v22 = a4;
  double v7 = [(SUUIShelfPageSectionConfiguration *)self->_configuration existingShelfCollectionView];
  [v7 indexPathsForVisibleItems];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        objc_super v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        double v13 = [v7 cellForItemAtIndexPath:v12];
        if ([v13 updateWithItemState:v22 context:self->_cellLayoutContext animated:v5])
        {
          uint64_t v15 = [v12 item];
          long long v16 = [(NSArray *)self->_viewElements objectAtIndex:v15];
          uint64_t v17 = [(SUUIShelfPageSectionConfiguration *)self->_configuration shelfLayoutData];
          [v17 sizeForItemAtIndex:v15];
          double v19 = v18;

          [(id)objc_opt_class() requestLayoutForViewElement:v16 width:self->_cellLayoutContext context:v19];
          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 collectionView];
  [(SUUIShelfPageSectionConfiguration *)self->_configuration registerReusableClassesForCollectionView:v5];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270504F70];
  double v6 = self->_cellLayoutContext;
  double v7 = [[SUUIViewElementLayoutContext alloc] initWithStorePageSectionContext:v4 previousLayoutContext:v6];
  cellLayoutContext = self->_cellLayoutContext;
  self->_cellLayoutContext = v7;

  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setAggregateValue:MEMORY[0x263EFFA88] forKey:0x270507D30];
  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setArtworkRequestDelegate:self];
  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setContainerViewElementType:[(SUUIShelfViewElement *)self->_shelfViewElement elementType]];
  [(SUUIShelfPageSectionConfiguration *)self->_configuration setCellLayoutContext:self->_cellLayoutContext];
  [(SUUIShelfPageSectionConfiguration *)self->_configuration reloadShelfLayoutDataForShelfViewElement:self->_shelfViewElement withShelfItemViewElements:self->_viewElements requestCellLayouts:1 numberOfShelfItems:[(NSArray *)self->_viewElements count]];
  [(SUUIShelfPageSectionConfiguration *)self->_configuration setNeedsShelfCollectionViewLayout:1];
  if (![(NSArray *)self->_viewElements count]) {
    [(SUUIShelfViewElement *)self->_shelfViewElement dispatchEventOfType:16 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }
  v9.receiver = self;
  v9.super_class = (Class)SUUIShelfPageSection;
  [(SUUIStorePageSection *)&v9 willAppearInContext:v4];
}

- (void)_setContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIShelfPageSection;
  id v4 = a3;
  [(SUUIStorePageSection *)&v5 _setContext:v4];
  -[SUUIShelfPageSectionConfiguration setPageSectionContext:](self->_configuration, "setPageSectionContext:", v4, v5.receiver, v5.super_class);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SUUIShelfPageSectionConfiguration *)self->_configuration existingShelfCollectionView];
  objc_super v9 = [v8 indexPathsForVisibleItems];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v9;
  uint64_t v10 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
        uint64_t v15 = [(SUUIShelfPageSectionConfiguration *)self->_configuration existingShelfCollectionView];
        long long v16 = [v15 cellForItemAtIndexPath:v14];

        [v16 setImage:v7 forArtworkRequest:v6 context:self->_cellLayoutContext];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (id)shelfPageSectionConfiguration:(id)a3 viewElementAtIndex:(int64_t)a4
{
  return [(NSArray *)self->_viewElements objectAtIndex:a4];
}

- (void)viewElementSlideshowWillDismiss:(id)a3
{
  if (self->_slideshowController == a3)
  {
    [a3 setDelegate:0];
    [(SUUIViewElementSlideshowController *)self->_slideshowController setLayoutContext:0];
    slideshowController = self->_slideshowController;
    self->_slideshowController = 0;
  }
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(SUUIShelfPageSection *)self _normalizedShelfItemIndexPathFromActualIndexPath:v5];
  uint64_t v7 = [v6 item];
  uint64_t v8 = [(NSArray *)self->_viewElements objectAtIndex:v7];
  objc_super v9 = [(SUUIShelfPageSectionConfiguration *)self->_configuration cellForShelfItemViewElement:v8 indexPath:v5];

  int64_t v10 = [(NSArray *)self->_viewElements count];
  if (self->_lastNeedsMoreCount < v10 && v7 + 10 > v10)
  {
    self->_lastNeedsMoreCount = v10;
    [(SUUIShelfViewElement *)self->_shelfViewElement dispatchEventOfType:16 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:0];
  }

  return v9;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  configuration = self->_configuration;
  NSUInteger v5 = [(NSArray *)self->_viewElements count];

  return [(SUUIShelfPageSectionConfiguration *)configuration numberOfCellsForNumberOfShelfItems:v5];
}

- (void)collectionView:(id)a3 didConfirmButtonElement:(id)a4 withClickInfo:(id)a5 forItemAtIndexPath:(id)a6
{
  id v9 = a5;
  id v10 = a4;
  id v12 = [(SUUIShelfPageSection *)self _normalizedShelfItemIndexPathFromActualIndexPath:a6];
  uint64_t v11 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", objc_msgSend(v12, "item"), -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
  [(SUUIStorePageSection *)self collectionViewDidConfirmButtonElement:v10 withClickInfo:v9 forItemAtIndexPath:v11];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SUUIShelfPageSection *)self _normalizedShelfItemIndexPathFromActualIndexPath:v7];
  id v9 = -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", [v8 item]);
  id v10 = [(SUUIShelfPageSectionConfiguration *)self->_configuration effectiveViewElementForShelfItemViewElement:v9];
  uint64_t v11 = v10;
  if (v10)
  {
    if ([v10 isEnabled])
    {
      objc_initWeak(&location, self);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __64__SUUIShelfPageSection_collectionView_didSelectItemAtIndexPath___block_invoke;
      v14[3] = &unk_265403110;
      objc_copyWeak(&v16, &location);
      id v12 = v11;
      id v15 = v12;
      [v12 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:v14];
      if ([v12 elementType] == 66)
      {
        unint64_t v13 = [(SUUIShelfPageSectionConfiguration *)self->_configuration lockupTypeForLockup:v12]- 3;

        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
        if (v13 >= 0xFFFFFFFFFFFFFFFELL) {
          goto LABEL_9;
        }
      }
      else
      {

        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      [v11 dispatchEvent:0x270509DB0 eventAttribute:0x270509DD0 canBubble:1 isCancelable:0 extraInfo:0 completionBlock:0];
    }
  }
  [v6 deselectItemAtIndexPath:v7 animated:1];
LABEL_9:
}

void __64__SUUIShelfPageSection_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, int a2, char a3)
{
  if (!a2 || (a3 & 1) == 0)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __64__SUUIShelfPageSection_collectionView_didSelectItemAtIndexPath___block_invoke_2;
    v4[3] = &unk_2654022F8;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    id v5 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v4);

    objc_destroyWeak(&v6);
  }
}

void __64__SUUIShelfPageSection_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performDefaultSelectActionForEffectiveViewElement:*(void *)(a1 + 32)];
}

- (void)collectionView:(id)a3 layout:(id)a4 willApplyLayoutAttributes:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [v7 indexPath];
  id v12 = [(SUUIShelfPageSection *)self _normalizedShelfItemIndexPathFromActualIndexPath:v9];

  uint64_t v10 = [v12 item];
  uint64_t v11 = [(NSArray *)self->_viewElements objectAtIndex:v10];
  [(SUUIShelfPageSectionConfiguration *)self->_configuration shelfItemsCollectionView:v8 willApplyLayoutAttributes:v7 forViewElement:v11 withItemIndex:v10];
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5 = [(SUUIShelfPageSection *)self _normalizedShelfItemIndexPathFromActualIndexPath:a4];
  id v6 = -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", [v5 item]);
  id v7 = [(SUUIShelfPageSectionConfiguration *)self->_configuration effectiveViewElementForShelfItemViewElement:v6];
  char v8 = [v7 isEnabled];

  return v8;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", objc_msgSend(a5, "item", a3, a4));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [(SUUIStorePageSection *)self context];
  id v7 = [v6 activeMetricsImpressionSession];
  [v7 beginActiveImpressionForViewElement:v8];
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  unint64_t v6 = objc_msgSend(a5, "item", a3, a4);
  if (v6 < [(NSArray *)self->_viewElements count])
  {
    id v9 = [(NSArray *)self->_viewElements objectAtIndex:v6];
    id v7 = [(SUUIStorePageSection *)self context];
    id v8 = [v7 activeMetricsImpressionSession];
    [v8 endActiveImpressionForViewElement:v9];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegateObserver);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained observedScrollViewDidEndDecelerating:v5];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v6 = a3;
  if ([(SUUIShelfPageSectionConfiguration *)self->_configuration rendersWithParallax])
  {
    id v4 = [(SUUIShelfPageSectionConfiguration *)self->_configuration existingShelfCollectionView];
    SUUICollectionViewUpdatePerspectiveCells(v4, 0);
  }
  [(SUUIShelfPageSectionConfiguration *)self->_configuration scrollViewDidScroll:v6];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegateObserver);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained observedScrollViewDidScroll:v6];
  }
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegateObserver);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained observedScrollViewWillBeginDecelerating:v5];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegateObserver);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained observedScrollViewWillBeginDragging:v5];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegateObserver);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "observedScrollViewWillEndDragging:withVelocity:targetContentOffset:", v10, x, y, a5->x, a5->y);
  }
}

- (id)_normalizedShelfItemIndexPathFromActualIndexPath:(id)a3
{
  configuration = self->_configuration;
  viewElements = self->_viewElements;
  id v5 = a3;
  id v6 = [(SUUIShelfPageSectionConfiguration *)configuration normalizedShelfItemIndexPathFromActualIndexPath:v5 numberOfShelfItems:[(NSArray *)viewElements count]];

  return v6;
}

- (void)_performDefaultSelectActionForEffectiveViewElement:(id)a3
{
  id v11 = a3;
  if (!-[SUUIStorePageSection performDefaultActionForViewElement:](self, "performDefaultActionForViewElement:")
    && [v11 elementType] == 66)
  {
    id v4 = [SUUIViewElementSlideshowController alloc];
    id v5 = [(SUUIStorePageSection *)self pageComponent];
    id v6 = [v5 viewElement];
    id v7 = [(SUUIViewElementSlideshowController *)v4 initWithShelf:v6 selectedLockup:v11];

    if ([(SUUIViewElementSlideshowController *)v7 numberOfSlideshowItems] >= 1)
    {
      objc_storeStrong((id *)&self->_slideshowController, v7);
      [(SUUIViewElementSlideshowController *)self->_slideshowController setDelegate:self];
      [(SUUIViewElementSlideshowController *)self->_slideshowController setLayoutContext:self->_cellLayoutContext];
      slideshowController = self->_slideshowController;
      id v9 = [(SUUIStorePageSection *)self context];
      id v10 = [v9 parentViewController];
      [(SUUIViewElementSlideshowController *)slideshowController presentFromParentViewController:v10];
    }
  }
}

- (void)_reloadViewElementProperties
{
  BOOL v3 = [(SUUIStorePageSection *)self pageComponent];
  id v4 = [v3 viewElement];
  shelfViewElement = self->_shelfViewElement;
  self->_shelfViewElement = v4;

  id v6 = [(SUUIViewElement *)self->_shelfViewElement flattenedChildren];
  viewElements = self->_viewElements;
  self->_viewElements = v6;

  [(SUUIShelfPageSectionConfiguration *)self->_configuration setRendersWithPerspective:[(SUUIViewElement *)self->_shelfViewElement rendersWithPerspective]];
  [(SUUIShelfPageSectionConfiguration *)self->_configuration setRendersWithParallax:[(SUUIViewElement *)self->_shelfViewElement rendersWithParallax]];
  configuration = self->_configuration;
  id v9 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", 0, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
  id v10 = [(SUUIShelfPageSection *)self backgroundColorForIndexPath:v9];
  [(SUUIShelfPageSectionConfiguration *)configuration setShelfCollectionViewBackgroundColor:v10];

  id v11 = self->_configuration;
  id v12 = [(SUUIShelfViewElement *)self->_shelfViewElement style];
  [(SUUIShelfPageSectionConfiguration *)v11 setShelfViewElementStyle:v12];

  unint64_t v13 = self->_configuration;
  uint64_t v14 = self->_shelfViewElement;

  [(SUUIShelfPageSectionConfiguration *)v13 reloadLockupTypeForShelfViewElement:v14];
}

- (SUUIShelfPageSectionConfiguration)configuration
{
  return self->_configuration;
}

- (SUUIScrollViewDelegateObserver)scrollViewDelegateObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegateObserver);

  return (SUUIScrollViewDelegateObserver *)WeakRetained;
}

- (void)setScrollViewDelegateObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollViewDelegateObserver);
  objc_storeStrong((id *)&self->_viewElements, 0);
  objc_storeStrong((id *)&self->_slideshowController, 0);
  objc_storeStrong((id *)&self->_shelfViewElement, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
}

@end