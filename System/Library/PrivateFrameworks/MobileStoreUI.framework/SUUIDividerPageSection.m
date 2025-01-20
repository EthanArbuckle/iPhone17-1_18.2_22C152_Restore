@interface SUUIDividerPageSection
- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5;
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SUUIDividerPageSection)initWithPageComponent:(id)a3;
- (UIEdgeInsets)sectionContentInset;
- (id)backgroundColorForIndexPath:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (int64_t)numberOfCells;
- (void)_enumerateVisibleCellsUsingBlock:(id)a3;
- (void)_requestCellLayout;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3;
- (void)dealloc;
- (void)willAppearInContext:(id)a3;
- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SUUIDividerPageSection

- (SUUIDividerPageSection)initWithPageComponent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIDividerPageSection;
  return [(SUUIStorePageSection *)&v4 initWithPageComponent:a3];
}

- (void)dealloc
{
  [(SUUIViewElementLayoutContext *)self->_layoutContext setArtworkRequestDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUIDividerPageSection;
  [(SUUIStorePageSection *)&v3 dealloc];
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5 = a4;
  id v7 = [(SUUIStorePageSection *)self pageComponent];
  v6 = [v7 viewElement];
  [v5 addItemViewElement:v6];
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIStorePageSection *)self pageComponent];
  v6 = [v5 viewElement];
  id v7 = [v6 style];

  v8 = [v7 ikBackgroundColor];
  v9 = [v8 color];

  if (v9)
  {
    id v10 = v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SUUIDividerPageSection;
    id v10 = [(SUUIStorePageSection *)&v13 backgroundColorForIndexPath:v4];
  }
  v11 = v10;

  return v11;
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIStorePageSection *)self context];
  v6 = [(SUUIStorePageSection *)self pageComponent];
  id v7 = [v6 dividerTitle];
  v8 = [v6 viewElement];
  [v5 activePageWidth];
  double v10 = v9;
  v11 = [v8 text];

  if (v11)
  {
    v12 = [v5 collectionView];
    objc_super v13 = [v12 dequeueReusableCellWithReuseIdentifier:0x270502270 forIndexPath:v4];

    [v13 reloadWithViewElement:v8 width:self->_layoutContext context:v10];
    double v14 = 0.0;
LABEL_5:
    [v13 setTopEdgeInset:v14];
    goto LABEL_6;
  }
  v15 = [v5 collectionView];
  v16 = v15;
  if (v7)
  {
    objc_super v13 = [v15 dequeueReusableCellWithReuseIdentifier:0x270502270 forIndexPath:v4];

    [v13 reloadWithViewElement:0 width:self->_layoutContext context:v10];
    [v13 setDividerTitle:v7];
    v17 = [v5 colorScheme];
    [v13 setColoringWithColorScheme:v17];

    double v14 = 15.0;
    goto LABEL_5;
  }
  objc_super v13 = [v15 dequeueReusableCellWithReuseIdentifier:0x2704FBEF0 forIndexPath:v4];

  [v13 reloadWithViewElement:v8 width:self->_layoutContext context:v10];
  if (v8)
  {
    if ([v8 dividerType] == 2)
    {
      [v13 setDividerType:2];
      +[SUUIPageTitledDividerCollectionViewCell viewElementInsetDividerHeight:v8];
      objc_msgSend(v13, "setDividerHeight:");
      v19 = [v8 style];
      v20 = [v19 ikColor];

      v21 = [v20 color];
      [v13 setInsetColor:v21];
    }
    else
    {
      if ([v8 dividerType] != 1)
      {
        [v13 setDividerType:0];
        double v23 = 15.0;
        goto LABEL_17;
      }
      [v13 setDividerType:1];
    }
    double v23 = 0.0;
LABEL_17:
    v22 = [v8 style];
    [v13 setColoringWithStyle:v22];
    goto LABEL_18;
  }
  v22 = [v5 colorScheme];
  [v13 setColoringWithColorScheme:v22];
  double v23 = 15.0;
LABEL_18:

  [v13 setLeftEdgeInset:v23];
  [v13 setRightEdgeInset:0.0];
  [v13 setVerticalAlignment:0];
LABEL_6:

  return v13;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = [(SUUIStorePageSection *)self context];
  [v4 activePageWidth];
  double v6 = v5;

  id v7 = [(SUUIStorePageSection *)self pageComponent];
  v8 = [v7 viewElement];
  if (v8)
  {
    +[SUUIPageTitledDividerCollectionViewCell sizeThatFitsWidth:v8 viewElement:self->_layoutContext context:v6];
    double v10 = v9;
  }
  else
  {
    v11 = [v7 dividerTitle];
    layoutContext = self->_layoutContext;
    if (v11)
    {
      +[SUUIPageTitledDividerCollectionViewCell sizeThatFitsWidth:v11 dividerTitle:layoutContext context:v6];
      if (v13 >= 47.0) {
        double v10 = v13;
      }
      else {
        double v10 = 47.0;
      }
    }
    else
    {
      +[SUUIPageDividerCollectionViewCell sizeThatFitsWidth:0 viewElement:layoutContext context:v6];
      double v10 = v14;
    }
  }
  double v15 = v6;
  double v16 = ceil(v10);
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SUUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  id v7 = [(SUUIStorePageSection *)self context];
  v8 = [v7 activeMetricsImpressionSession];
  [v8 beginActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SUUIDividerPageSection;
  [(SUUIStorePageSection *)&v9 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SUUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  id v7 = [(SUUIStorePageSection *)self context];
  v8 = [v7 activeMetricsImpressionSession];
  [v8 endActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SUUIDividerPageSection;
  [(SUUIStorePageSection *)&v9 collectionViewDidEndDisplayingCellForItemAtIndexPath:v4];
}

- (int64_t)numberOfCells
{
  return 1;
}

- (UIEdgeInsets)sectionContentInset
{
  double v2 = *MEMORY[0x263F834E8];
  double v3 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v4 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v5 = *(double *)(MEMORY[0x263F834E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)updateCellWithIndexPath:(id)a3 itemState:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  double v15 = __69__SUUIDividerPageSection_updateCellWithIndexPath_itemState_animated___block_invoke;
  double v16 = &unk_265403898;
  id v10 = v9;
  id v17 = v10;
  v18 = self;
  BOOL v20 = a5;
  v19 = &v21;
  [(SUUIDividerPageSection *)self _enumerateVisibleCellsUsingBlock:&v13];
  if (*((unsigned char *)v22 + 24))
  {
    [(SUUIDividerPageSection *)self _requestCellLayout];
    BOOL v11 = *((unsigned char *)v22 + 24) != 0;
  }
  else
  {
    BOOL v11 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __69__SUUIDividerPageSection_updateCellWithIndexPath_itemState_animated___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 conformsToProtocol:&unk_2705ED578])
  {
    char v3 = [v6 updateWithItemState:*(void *)(a1 + 32) context:*(void *)(*(void *)(a1 + 40) + 88) animated:*(unsigned __int8 *)(a1 + 56)];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(unsigned char *)(v4 + 24)) {
      char v5 = 1;
    }
    else {
      char v5 = v3;
    }
    *(unsigned char *)(v4 + 24) = v5;
  }
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  char v5 = [v4 collectionView];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x2704FBEF0];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x270502270];
  id v6 = self->_layoutContext;
  [(SUUIViewElementLayoutContext *)v6 setArtworkRequestDelegate:0];
  id v7 = [[SUUIViewElementLayoutContext alloc] initWithStorePageSectionContext:v4 previousLayoutContext:v6];
  layoutContext = self->_layoutContext;
  self->_layoutContext = v7;

  [(SUUIViewElementLayoutContext *)self->_layoutContext setArtworkRequestDelegate:self];
  [(SUUIDividerPageSection *)self _requestCellLayout];
  v9.receiver = self;
  v9.super_class = (Class)SUUIDividerPageSection;
  [(SUUIStorePageSection *)&v9 willAppearInContext:v4];
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  layoutContext = self->_layoutContext;
  id v8 = a4;
  [(SUUIViewElementLayoutContext *)layoutContext invalidateAllEditorialLayouts];
  [(SUUIViewElementLayoutContext *)self->_layoutContext setActivePageWidth:width];
  [(SUUIDividerPageSection *)self _requestCellLayout];
  v9.receiver = self;
  v9.super_class = (Class)SUUIDividerPageSection;
  -[SUUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v9, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__SUUIDividerPageSection_artworkRequest_didLoadImage___block_invoke;
  v10[3] = &unk_2654038C0;
  id v11 = v7;
  id v12 = v6;
  uint64_t v13 = self;
  id v8 = v6;
  id v9 = v7;
  [(SUUIDividerPageSection *)self _enumerateVisibleCellsUsingBlock:v10];
}

void __54__SUUIDividerPageSection_artworkRequest_didLoadImage___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_2705ED578]) {
    [v3 setImage:a1[4] forArtworkRequest:a1[5] context:*(void *)(a1[6] + 88)];
  }
}

- (void)_enumerateVisibleCellsUsingBlock:(id)a3
{
  id v4 = a3;
  char v5 = [(SUUIStorePageSection *)self context];
  id v6 = [v5 collectionView];

  id v7 = [v6 visibleCells];
  int64_t v8 = [(SUUIStorePageSection *)self sectionIndex];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__SUUIDividerPageSection__enumerateVisibleCellsUsingBlock___block_invoke;
  v11[3] = &unk_2654038E8;
  id v13 = v4;
  int64_t v14 = v8;
  id v12 = v6;
  id v9 = v4;
  id v10 = v6;
  [v7 enumerateObjectsUsingBlock:v11];
}

void __59__SUUIDividerPageSection__enumerateVisibleCellsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "indexPathForCell:");
  id v4 = v3;
  if (v3 && [v3 section] == *(void *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_requestCellLayout
{
  id v3 = [(SUUIStorePageSection *)self pageComponent];
  id v8 = [v3 viewElement];

  id v4 = [(SUUIStorePageSection *)self context];
  [v4 activePageWidth];
  double v6 = v5;

  id v7 = v8;
  if (v8)
  {
    +[SUUIPageTitledDividerCollectionViewCell requestLayoutForViewElement:v8 width:self->_layoutContext context:v6];
    id v7 = v8;
  }
}

- (void).cxx_destruct
{
}

@end