@interface SUUIKeyValueInfoListPageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SUUIKeyValueInfoListPageSection)initWithPageComponent:(id)a3;
- (UIEdgeInsets)sectionContentInset;
- (id)backgroundColorForIndexPath:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (int64_t)applyUpdateType:(int64_t)a3;
- (int64_t)numberOfCells;
- (void)_enumerateVisibleViewElementsUsingBlock:(id)a3;
- (void)_reloadViewElementProperties;
- (void)_requestCellLayout;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3;
- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4;
- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4;
- (void)willAppearInContext:(id)a3;
- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SUUIKeyValueInfoListPageSection

- (SUUIKeyValueInfoListPageSection)initWithPageComponent:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIKeyValueInfoListPageSection;
  v3 = [(SUUIStorePageSection *)&v6 initWithPageComponent:a3];
  v4 = v3;
  if (v3) {
    [(SUUIKeyValueInfoListPageSection *)v3 _reloadViewElementProperties];
  }
  return v4;
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(SUUIStorePageSection *)self pageComponent];
  v9 = [v8 viewElement];
  [v6 addItemViewElement:v9];

  viewElements = self->_viewElements;
  uint64_t v11 = [v7 item];

  id v12 = [(NSArray *)viewElements objectAtIndex:v11];
  [v6 addItemViewElement:v12];
}

- (int64_t)applyUpdateType:(int64_t)a3
{
  [(SUUIKeyValueInfoListPageSection *)self _reloadViewElementProperties];
  v6.receiver = self;
  v6.super_class = (Class)SUUIKeyValueInfoListPageSection;
  return [(SUUIStorePageSection *)&v6 applyUpdateType:a3];
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", [v4 item]);
  objc_super v6 = [v5 style];
  id v7 = [v6 ikBackgroundColor];
  v8 = [v7 color];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SUUIKeyValueInfoListPageSection;
    id v9 = [(SUUIStorePageSection *)&v12 backgroundColorForIndexPath:v4];
  }
  v10 = v9;

  return v10;
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIStorePageSection *)self context];
  objc_super v6 = [v5 collectionView];
  id v7 = [v6 dequeueReusableCellWithReuseIdentifier:0x2704FE750 forIndexPath:v4];
  v8 = [(SUUIStorePageSection *)self context];
  [v8 horizontalPadding];
  double v10 = v9;
  uint64_t v11 = [(SUUIStorePageSection *)self context];
  [v11 horizontalPadding];
  objc_msgSend(v7, "setContentInset:", 0.0, v10, 3.0, v12);

  [v5 activePageWidth];
  double v14 = v13;
  v15 = [(SUUIStorePageSection *)self context];
  [v15 horizontalPadding];
  double v17 = v14 + v16 * -2.0;

  viewElements = self->_viewElements;
  uint64_t v19 = [v4 item];

  v20 = [(NSArray *)viewElements objectAtIndex:v19];
  [v7 reloadWithViewElement:v20 width:self->_cellLayoutContext context:v17];

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIStorePageSection *)self context];
  [v5 activePageWidth];
  double v7 = v6;

  viewElements = self->_viewElements;
  uint64_t v9 = [v4 item];

  double v10 = [(NSArray *)viewElements objectAtIndex:v9];
  uint64_t v11 = [(SUUIStorePageSection *)self context];
  [v11 horizontalPadding];
  +[SUUIKeyValueInfoListCollectionViewCell sizeThatFitsWidth:v10 viewElement:self->_cellLayoutContext context:v7 + v12 * -2.0];
  double v14 = v13;

  double v15 = v7;
  double v16 = v14 + 3.0;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIStorePageSection *)self context];
  double v6 = [v5 activeMetricsImpressionSession];

  double v7 = [(SUUIStorePageSection *)self pageComponent];
  v8 = [v7 viewElement];

  [v6 beginActiveImpressionForViewElement:v8];
  uint64_t v9 = -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", [v4 item]);

  [v6 beginActiveImpressionForViewElement:v9];
  v10.receiver = self;
  v10.super_class = (Class)SUUIKeyValueInfoListPageSection;
  [(SUUIStorePageSection *)&v10 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIStorePageSection *)self context];
  double v6 = [v5 activeMetricsImpressionSession];

  double v7 = [(SUUIStorePageSection *)self pageComponent];
  v8 = [v7 viewElement];

  [v6 endActiveImpressionForViewElement:v8];
  unint64_t v9 = [v4 item];
  if (v9 < [(NSArray *)self->_viewElements count])
  {
    uint64_t v10 = [(NSArray *)self->_viewElements objectAtIndex:v9];

    [v6 endActiveImpressionForViewElement:v10];
    v8 = (void *)v10;
  }
  v11.receiver = self;
  v11.super_class = (Class)SUUIKeyValueInfoListPageSection;
  [(SUUIStorePageSection *)&v11 collectionViewDidEndDisplayingCellForItemAtIndexPath:v4];
}

- (void)entityProvider:(id)a3 didInvalidateWithContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SUUIKeyValueInfoListPageSection *)self _requestCellLayout];
  v8.receiver = self;
  v8.super_class = (Class)SUUIKeyValueInfoListPageSection;
  [(SUUIStorePageSection *)&v8 entityProvider:v7 didInvalidateWithContext:v6];
}

- (int64_t)numberOfCells
{
  return [(NSArray *)self->_viewElements count];
}

- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4
{
  id v14 = a3;
  v5 = [(SUUIStorePageSection *)self context];
  id v6 = [v5 collectionView];
  id v7 = [v6 cellForItemAtIndexPath:v14];

  if (v7)
  {
    [v5 activePageWidth];
    double v9 = v8;
    uint64_t v10 = [(SUUIStorePageSection *)self context];
    [v10 horizontalPadding];
    double v12 = v9 + v11 * -2.0;

    double v13 = -[NSArray objectAtIndex:](self->_viewElements, "objectAtIndex:", [v14 item]);
    [v7 reloadWithViewElement:v13 width:self->_cellLayoutContext context:v12];
  }
}

- (UIEdgeInsets)sectionContentInset
{
  v16.receiver = self;
  v16.super_class = (Class)SUUIKeyValueInfoListPageSection;
  [(SUUIStorePageSection *)&v16 sectionContentInset];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = [(SUUIStorePageSection *)self isTopSection];
  double v12 = 12.0;
  if (!v11) {
    double v12 = v4;
  }
  double v13 = fmax(v8 + -3.0, 0.0);
  double v14 = v6;
  double v15 = v10;
  result.right = v15;
  result.bottom = v13;
  result.left = v14;
  result.top = v12;
  return result;
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  double v5 = [v4 collectionView];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x2704FE750];
  double v6 = self->_cellLayoutContext;
  double v7 = [[SUUIViewElementLayoutContext alloc] initWithStorePageSectionContext:v4 previousLayoutContext:v6];
  cellLayoutContext = self->_cellLayoutContext;
  self->_cellLayoutContext = v7;

  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setArtworkRequestDelegate:self];
  [(SUUIViewElementLayoutContext *)self->_cellLayoutContext setContainerViewElementType:[(SUUIInfoListViewElement *)self->_infoList elementType]];
  [(SUUIKeyValueInfoListPageSection *)self _requestCellLayout];
  v9.receiver = self;
  v9.super_class = (Class)SUUIKeyValueInfoListPageSection;
  [(SUUIStorePageSection *)&v9 willAppearInContext:v4];
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  cellLayoutContext = self->_cellLayoutContext;
  id v8 = a4;
  [(SUUIViewElementLayoutContext *)cellLayoutContext setActivePageWidth:width];
  [(SUUIKeyValueInfoListPageSection *)self _requestCellLayout];
  v9.receiver = self;
  v9.super_class = (Class)SUUIKeyValueInfoListPageSection;
  -[SUUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v9, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUUIStorePageSection *)self context];
  objc_super v9 = [v8 collectionView];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__SUUIKeyValueInfoListPageSection_artworkRequest_didLoadImage___block_invoke;
  v13[3] = &unk_265408B90;
  id v14 = v9;
  id v15 = v7;
  id v16 = v6;
  double v17 = self;
  id v10 = v6;
  id v11 = v7;
  id v12 = v9;
  [(SUUIKeyValueInfoListPageSection *)self _enumerateVisibleViewElementsUsingBlock:v13];
}

void __63__SUUIKeyValueInfoListPageSection_artworkRequest_didLoadImage___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) cellForItemAtIndexPath:a2];
  [v3 setImage:*(void *)(a1 + 40) forArtworkRequest:*(void *)(a1 + 48) context:*(void *)(*(void *)(a1 + 56) + 88)];
}

- (void)_enumerateVisibleViewElementsUsingBlock:(id)a3
{
  id v4 = a3;
  double v5 = [(SUUIStorePageSection *)self context];
  id v6 = [v5 collectionView];

  id v7 = [v6 indexPathsForVisibleItems];
  int64_t v8 = [(SUUIStorePageSection *)self sectionIndex];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__SUUIKeyValueInfoListPageSection__enumerateVisibleViewElementsUsingBlock___block_invoke;
  v10[3] = &unk_2654080A0;
  id v11 = v4;
  int64_t v12 = v8;
  v10[4] = self;
  id v9 = v4;
  [v7 enumerateObjectsUsingBlock:v10];
}

void __75__SUUIKeyValueInfoListPageSection__enumerateVisibleViewElementsUsingBlock___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8 = a2;
  if ([v8 section] == a1[6])
  {
    uint64_t v6 = a1[5];
    id v7 = objc_msgSend(*(id *)(a1[4] + 112), "objectAtIndex:", objc_msgSend(v8, "item"));
    (*(void (**)(uint64_t, id, void *, uint64_t))(v6 + 16))(v6, v8, v7, a4);
  }
}

- (void)_reloadViewElementProperties
{
  id v3 = [(SUUIStorePageSection *)self pageComponent];
  id v4 = [v3 viewElement];
  infoList = self->_infoList;
  self->_infoList = v4;

  uint64_t v6 = [(SUUIViewElement *)self->_infoList flattenedChildren];
  viewElements = self->_viewElements;
  self->_viewElements = v6;
  MEMORY[0x270F9A758](v6, viewElements);
}

- (void)_requestCellLayout
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = [(SUUIStorePageSection *)self context];
  [v3 activePageWidth];
  double v5 = v4;
  uint64_t v6 = [(SUUIStorePageSection *)self context];
  [v6 horizontalPadding];
  double v8 = v5 + v7 * -2.0;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = self->_viewElements;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v28;
    double v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(v9);
        }
        +[SUUIKeyValueInfoListCollectionViewCell titleColumnWidthWithViewElement:*(void *)(*((void *)&v27 + 1) + 8 * i) width:self->_cellLayoutContext context:v8];
        if (v13 < v15) {
          double v13 = v15;
        }
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }
  else
  {
    double v13 = 0.0;
  }

  cellLayoutContext = self->_cellLayoutContext;
  double v17 = [NSNumber numberWithDouble:v13];
  [(SUUIViewElementLayoutContext *)cellLayoutContext setAggregateValue:v17 forKey:0x2704FE770];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v18 = self->_viewElements;
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        +[SUUIKeyValueInfoListCollectionViewCell requestLayoutForViewElement:width:context:](SUUIKeyValueInfoListCollectionViewCell, "requestLayoutForViewElement:width:context:", *(void *)(*((void *)&v23 + 1) + 8 * j), self->_cellLayoutContext, v8, (void)v23);
      }
      uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v20);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElements, 0);
  objc_storeStrong((id *)&self->_titleColumnWidth, 0);
  objc_storeStrong((id *)&self->_infoList, 0);
  objc_storeStrong((id *)&self->_cellLayoutContext, 0);
}

@end