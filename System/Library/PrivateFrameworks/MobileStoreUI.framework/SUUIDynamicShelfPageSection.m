@interface SUUIDynamicShelfPageSection
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SUUIDynamicShelfPageSection)initWithPageComponent:(id)a3;
- (SUUIDynamicShelfPageSection)initWithPageComponent:(id)a3 configuration:(id)a4;
- (SUUIScrollViewDelegateObserver)scrollViewDelegateObserver;
- (SUUIShelfPageSectionConfiguration)configuration;
- (UIEdgeInsets)sectionContentInset;
- (id)_normalizedShelfItemIndexPathFromActualIndexPath:(id)a3;
- (id)_viewElementForEntityAtGlobalIndex:(int64_t)a3;
- (id)backgroundColorForIndexPath:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)relevantEntityProviders;
- (id)shelfPageSectionConfiguration:(id)a3 viewElementAtIndex:(int64_t)a4;
- (int64_t)applyUpdateType:(int64_t)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfCells;
- (void)_reloadViewElementProperties;
- (void)_setContext:(id)a3;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)collectionView:(id)a3 didConfirmButtonElement:(id)a4 withClickInfo:(id)a5 forItemAtIndexPath:(id)a6;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 layout:(id)a4 willApplyLayoutAttributes:(id)a5;
- (void)collectionViewWillApplyLayoutAttributes:(id)a3;
- (void)dealloc;
- (void)deselectItemsAnimated:(BOOL)a3;
- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4;
- (void)invalidateCachedLayoutInformation;
- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setScrollViewDelegateObserver:(id)a3;
- (void)setSectionIndex:(int64_t)a3;
- (void)setTopSection:(BOOL)a3;
- (void)willAppearInContext:(id)a3;
- (void)willHideInContext:(id)a3;
@end

@implementation SUUIDynamicShelfPageSection

- (SUUIDynamicShelfPageSection)initWithPageComponent:(id)a3
{
  return [(SUUIDynamicShelfPageSection *)self initWithPageComponent:a3 configuration:0];
}

- (SUUIDynamicShelfPageSection)initWithPageComponent:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SUUIDynamicShelfPageSection;
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
    [(SUUIDynamicShelfPageSection *)v7 _reloadViewElementProperties];
  }

  return v7;
}

- (void)dealloc
{
  v3 = +[SUUIItemStateCenter defaultCenter];
  [v3 removeObserver:self];

  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setArtworkRequestDelegate:0];
  [(SUUIShelfPageSectionConfiguration *)self->_configuration setShelfCollectionViewDataSource:0];
  [(SUUIShelfPageSectionConfiguration *)self->_configuration setShelfCollectionViewDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)SUUIDynamicShelfPageSection;
  [(SUUIStorePageSection *)&v4 dealloc];
}

- (int64_t)applyUpdateType:(int64_t)a3
{
  [(SUUIDynamicShelfPageSection *)self _reloadViewElementProperties];
  if (![(SUUIShelfPageSectionConfiguration *)self->_configuration needsShelfCollectionViewReload])[(SUUIShelfPageSectionConfiguration *)self->_configuration setNeedsShelfCollectionViewReload:[(SUUIDynamicShelfViewElement *)self->_dynamicShelfViewElement updateType] != 0]; {
  v6.receiver = self;
  }
  v6.super_class = (Class)SUUIDynamicShelfPageSection;
  return [(SUUIStorePageSection *)&v6 applyUpdateType:a3];
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIShelfPageSectionConfiguration *)self->_configuration backgroundColorForShelfViewElement:self->_dynamicShelfViewElement];
  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUIDynamicShelfPageSection;
    v5 = [(SUUIStorePageSection *)&v7 backgroundColorForIndexPath:v4];
  }

  return v5;
}

- (id)cellForIndexPath:(id)a3
{
  return [(SUUIShelfPageSectionConfiguration *)self->_configuration cellForShelfViewElement:self->_dynamicShelfViewElement indexPath:a3];
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  configuration = self->_configuration;
  dynamicShelfViewElement = self->_dynamicShelfViewElement;
  dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
  id v6 = a3;
  [(SUUIShelfPageSectionConfiguration *)configuration cellSizeForShelfViewElement:dynamicShelfViewElement indexPath:v6 numberOfShelfItems:[(SUUIDynamicPageSectionIndexMapper *)dynamicPageSectionIndexMapper totalNumberOfEntities]];
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
  v5.super_class = (Class)SUUIDynamicShelfPageSection;
  id v4 = a3;
  [(SUUIStorePageSection *)&v5 collectionViewWillApplyLayoutAttributes:v4];
  -[SUUIShelfPageSectionConfiguration collectionViewWillApplyLayoutAttributes:](self->_configuration, "collectionViewWillApplyLayoutAttributes:", v4, v5.receiver, v5.super_class);
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
  v11.super_class = (Class)SUUIDynamicShelfPageSection;
  [(SUUIStorePageSection *)&v11 deselectItemsAnimated:v3];
}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  if (self->_entityProvider == a3)
  {
    [(SUUIDynamicPageSectionIndexMapper *)self->_dynamicPageSectionIndexMapper reloadData];
    id v5 = [(SUUIShelfPageSectionConfiguration *)self->_configuration existingShelfCollectionView];
    [v5 reloadData];
  }
}

- (void)invalidateCachedLayoutInformation
{
  [(SUUIShelfPageSectionConfiguration *)self->_configuration setNeedsShelfCollectionViewLayout:1];
  BOOL v3 = [(SUUIShelfPageSectionConfiguration *)self->_configuration existingShelfCollectionView];
  [v3 reloadData];

  v4.receiver = self;
  v4.super_class = (Class)SUUIDynamicShelfPageSection;
  [(SUUIStorePageSection *)&v4 invalidateCachedLayoutInformation];
}

- (int64_t)numberOfCells
{
  return [(SUUIShelfPageSectionConfiguration *)self->_configuration numberOfSectionCells];
}

- (id)relevantEntityProviders
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIDynamicShelfPageSection;
  BOOL v3 = [(SUUIStorePageSection *)&v7 relevantEntityProviders];
  objc_super v4 = v3;
  if (self->_entityProvider)
  {
    if (v3)
    {
      uint64_t v5 = objc_msgSend(v3, "setByAddingObject:");

      objc_super v4 = (void *)v5;
    }
    else
    {
      objc_super v4 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:");
    }
  }
  return v4;
}

- (UIEdgeInsets)sectionContentInset
{
  configuration = self->_configuration;
  v12.receiver = self;
  v12.super_class = (Class)SUUIDynamicShelfPageSection;
  [(SUUIStorePageSection *)&v12 sectionContentInset];
  -[SUUIShelfPageSectionConfiguration sectionContentInsetAdjustedFromValue:forShelfViewElement:withSectionIndex:](configuration, "sectionContentInsetAdjustedFromValue:forShelfViewElement:withSectionIndex:", self->_dynamicShelfViewElement, [(SUUIStorePageSection *)self sectionIndex], v4, v5, v6, v7);
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
  v5.super_class = (Class)SUUIDynamicShelfPageSection;
  -[SUUIStorePageSection setTopSection:](&v5, sel_setTopSection_);
  [(SUUIShelfPageSectionConfiguration *)self->_configuration setTopSection:v3];
}

- (void)willAppearInContext:(id)a3
{
  v27[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = [v4 collectionView];
  [(SUUIShelfPageSectionConfiguration *)self->_configuration registerReusableClassesForCollectionView:v5];
  double v6 = +[SUUIItemStateCenter defaultCenter];
  [v6 addObserver:self];

  double v7 = [SUUIViewElementTextLayoutCache alloc];
  double v8 = [v4 textLayoutCache];
  double v9 = [(SUUIViewElementTextLayoutCache *)v7 initWithLayoutCache:v8];
  labelLayoutCache = self->_labelLayoutCache;
  self->_labelLayoutCache = v9;

  cellLayoutContext = self->_cellLayoutContext;
  if (!cellLayoutContext)
  {
    objc_super v12 = objc_alloc_init(SUUIViewElementLayoutContext);
    long long v13 = self->_cellLayoutContext;
    self->_cellLayoutContext = v12;

    [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setAggregateValue:MEMORY[0x263EFFA88] forKey:0x270507D30];
    [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setArtworkRequestDelegate:self];
    cellLayoutContext = self->_cellLayoutContext;
  }
  long long v14 = [v4 clientContext];
  [(SUUIViewElementLayoutContext *)cellLayoutContext setClientContext:v14];

  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setContainerViewElementType:[(SUUIDynamicShelfViewElement *)self->_dynamicShelfViewElement elementType]];
  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setLabelLayoutCache:self->_labelLayoutCache];
  long long v15 = self->_cellLayoutContext;
  v16 = [v4 parentViewController];
  [(SUUIViewElementLayoutContext *)v15 setParentViewController:v16];

  uint64_t v17 = self->_cellLayoutContext;
  v18 = [v4 placeholderColor];
  [(SUUIViewElementLayoutContext *)v17 setPlaceholderColor:v18];

  v19 = self->_cellLayoutContext;
  v20 = [v4 resourceLoader];
  [(SUUIViewElementLayoutContext *)v19 setResourceLoader:v20];

  v21 = self->_cellLayoutContext;
  v22 = [v5 tintColor];
  [(SUUIViewElementLayoutContext *)v21 setTintColor:v22];

  [(SUUIShelfPageSectionConfiguration *)self->_configuration setCellLayoutContext:self->_cellLayoutContext];
  uint64_t v23 = [(SUUIDynamicShelfViewElement *)self->_dynamicShelfViewElement cellTemplateViewElement];
  v24 = (void *)v23;
  if (v23)
  {
    v27[0] = v23;
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  }
  else
  {
    v25 = 0;
  }
  [(SUUIShelfPageSectionConfiguration *)self->_configuration reloadShelfLayoutDataForShelfViewElement:self->_dynamicShelfViewElement withShelfItemViewElements:v25 requestCellLayouts:1 numberOfShelfItems:[(SUUIDynamicPageSectionIndexMapper *)self->_dynamicPageSectionIndexMapper totalNumberOfEntities]];
  [(SUUIShelfPageSectionConfiguration *)self->_configuration setNeedsShelfCollectionViewLayout:1];
  v26.receiver = self;
  v26.super_class = (Class)SUUIDynamicShelfPageSection;
  [(SUUIStorePageSection *)&v26 willAppearInContext:v4];
}

- (void)willHideInContext:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[SUUIItemStateCenter defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)SUUIDynamicShelfPageSection;
  [(SUUIStorePageSection *)&v6 willHideInContext:v4];
}

- (void)setSectionIndex:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIDynamicShelfPageSection;
  -[SUUIStorePageSection setSectionIndex:](&v5, sel_setSectionIndex_);
  [(SUUIShelfPageSectionConfiguration *)self->_configuration setSectionIndex:a3];
}

- (void)_setContext:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIDynamicShelfPageSection;
  id v4 = a3;
  [(SUUIStorePageSection *)&v5 _setContext:v4];
  -[SUUIShelfPageSectionConfiguration setPageSectionContext:](self->_configuration, "setPageSectionContext:", v4, v5.receiver, v5.super_class);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(SUUIShelfPageSectionConfiguration *)self->_configuration existingShelfCollectionView];
  double v9 = [v8 indexPathsForVisibleItems];

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
        long long v15 = [(SUUIShelfPageSectionConfiguration *)self->_configuration existingShelfCollectionView];
        v16 = [v15 cellForItemAtIndexPath:v14];

        [v16 setImage:v7 forArtworkRequest:v6 context:self->_cellLayoutContext];
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)itemStateCenter:(id)a3 itemStatesChanged:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__SUUIDynamicShelfPageSection_itemStateCenter_itemStatesChanged___block_invoke;
  v7[3] = &unk_265400890;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __65__SUUIDynamicShelfPageSection_itemStateCenter_itemStatesChanged___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(*(void *)(a1 + 32) + 96) existingShelfCollectionView];
  long long v15 = [v2 indexPathsForVisibleItems];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = *(id *)(a1 + 40);
  uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v16)
  {
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = v3;
        uint64_t v4 = *(void *)(*((void *)&v22 + 1) + 8 * v3);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v5 = v15;
        uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v19;
          while (2)
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v19 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
              uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 96) existingShelfCollectionView];
              uint64_t v12 = [v11 cellForItemAtIndexPath:v10];

              if ([v12 updateWithItemState:v4 context:*(void *)(*(void *)(a1 + 32) + 88) animated:1]&& (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "supportsDuplicateShelfItems") & 1) == 0)
              {

                goto LABEL_17;
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
LABEL_17:

        uint64_t v3 = v17 + 1;
      }
      while (v17 + 1 != v16);
      uint64_t v16 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v16);
  }
}

- (id)shelfPageSectionConfiguration:(id)a3 viewElementAtIndex:(int64_t)a4
{
  return [(SUUIDynamicShelfPageSection *)self _viewElementForEntityAtGlobalIndex:a4];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SUUIDynamicShelfPageSection *)self _normalizedShelfItemIndexPathFromActualIndexPath:v5];
  uint64_t v7 = -[SUUIDynamicShelfPageSection _viewElementForEntityAtGlobalIndex:](self, "_viewElementForEntityAtGlobalIndex:", [v6 item]);
  uint64_t v8 = [(SUUIShelfPageSectionConfiguration *)self->_configuration cellForShelfItemViewElement:v7 indexPath:v5];

  return v8;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  configuration = self->_configuration;
  int64_t v5 = [(SUUIDynamicPageSectionIndexMapper *)self->_dynamicPageSectionIndexMapper totalNumberOfEntities];
  return [(SUUIShelfPageSectionConfiguration *)configuration numberOfCellsForNumberOfShelfItems:v5];
}

- (void)collectionView:(id)a3 didConfirmButtonElement:(id)a4 withClickInfo:(id)a5 forItemAtIndexPath:(id)a6
{
  id v9 = a5;
  id v10 = a4;
  id v12 = [(SUUIDynamicShelfPageSection *)self _normalizedShelfItemIndexPathFromActualIndexPath:a6];
  uint64_t v11 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", objc_msgSend(v12, "item"), -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
  [(SUUIStorePageSection *)self collectionViewDidConfirmButtonElement:v10 withClickInfo:v9 forItemAtIndexPath:v11];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 layout:(id)a4 willApplyLayoutAttributes:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [v7 indexPath];
  id v12 = [(SUUIDynamicShelfPageSection *)self _normalizedShelfItemIndexPathFromActualIndexPath:v9];

  uint64_t v10 = [v12 item];
  uint64_t v11 = [(SUUIDynamicShelfPageSection *)self _viewElementForEntityAtGlobalIndex:v10];
  [(SUUIShelfPageSectionConfiguration *)self->_configuration shelfItemsCollectionView:v8 willApplyLayoutAttributes:v7 forViewElement:v11 withItemIndex:v10];
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
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
    uint64_t v4 = [(SUUIShelfPageSectionConfiguration *)self->_configuration existingShelfCollectionView];
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
  dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
  id v5 = a3;
  id v6 = [(SUUIShelfPageSectionConfiguration *)configuration normalizedShelfItemIndexPathFromActualIndexPath:v5 numberOfShelfItems:[(SUUIDynamicPageSectionIndexMapper *)dynamicPageSectionIndexMapper totalNumberOfEntities]];

  return v6;
}

- (void)_reloadViewElementProperties
{
  uint64_t v3 = [(SUUIStorePageSection *)self pageComponent];
  uint64_t v4 = [v3 viewElement];
  dynamicShelfViewElement = self->_dynamicShelfViewElement;
  self->_dynamicShelfViewElement = v4;

  [(SUUIShelfPageSectionConfiguration *)self->_configuration setRendersWithPerspective:[(SUUIViewElement *)self->_dynamicShelfViewElement rendersWithPerspective]];
  [(SUUIShelfPageSectionConfiguration *)self->_configuration setRendersWithParallax:[(SUUIViewElement *)self->_dynamicShelfViewElement rendersWithParallax]];
  configuration = self->_configuration;
  id v7 = [(SUUIDynamicShelfViewElement *)self->_dynamicShelfViewElement style];
  [(SUUIShelfPageSectionConfiguration *)configuration setShelfViewElementStyle:v7];

  id v8 = self->_configuration;
  id v9 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", 0, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
  id v10 = [(SUUIDynamicShelfPageSection *)self backgroundColorForIndexPath:v9];
  [(SUUIShelfPageSectionConfiguration *)v8 setShelfCollectionViewBackgroundColor:v10];

  uint64_t v11 = [(SUUIViewElement *)self->_dynamicShelfViewElement entityProvider];
  entityProvider = self->_entityProvider;
  id obj = (id)v11;
  if (entityProvider != (SUUIEntityProviding *)v11
    && ([(SUUIEntityProviding *)entityProvider isEqual:v11] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_entityProvider, obj);
    dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
    if (!dynamicPageSectionIndexMapper)
    {
      uint64_t v14 = objc_alloc_init(SUUIDynamicPageSectionIndexMapper);
      long long v15 = self->_dynamicPageSectionIndexMapper;
      self->_dynamicPageSectionIndexMapper = v14;

      dynamicPageSectionIndexMapper = self->_dynamicPageSectionIndexMapper;
    }
    [(SUUIDynamicPageSectionIndexMapper *)dynamicPageSectionIndexMapper setEntityProvider:self->_entityProvider];
  }
  [(SUUIShelfPageSectionConfiguration *)self->_configuration reloadLockupTypeForShelfViewElement:self->_dynamicShelfViewElement];
}

- (id)_viewElementForEntityAtGlobalIndex:(int64_t)a3
{
  uint64_t v4 = [(SUUIDynamicPageSectionIndexMapper *)self->_dynamicPageSectionIndexMapper entityIndexPathForGlobalIndex:a3];
  id v5 = [(SUUIEntityProviding *)self->_entityProvider entityValueProviderAtIndexPath:v4];
  id v6 = [(SUUIDynamicShelfViewElement *)self->_dynamicShelfViewElement cellTemplateViewElement];
  [v6 setEntityValueProvider:v5];

  return v6;
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
  objc_storeStrong((id *)&self->_labelLayoutCache, 0);
  objc_storeStrong((id *)&self->_entityProvider, 0);
  objc_storeStrong((id *)&self->_dynamicShelfViewElement, 0);
  objc_storeStrong((id *)&self->_dynamicPageSectionIndexMapper, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
}

@end