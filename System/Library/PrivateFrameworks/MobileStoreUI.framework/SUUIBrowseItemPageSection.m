@interface SUUIBrowseItemPageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SUUIBrowseItemComponent)pageComponent;
- (SUUIBrowseItemPageSection)initWithPageComponent:(id)a3;
- (UIEdgeInsets)sectionContentInset;
- (id)_imageForImageViewElement:(id)a3 styleColor:(id)a4;
- (id)cellForIndexPath:(id)a3;
- (int64_t)numberOfCells;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewDidSelectItemAtIndexPath:(id)a3;
- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3;
- (void)willAppearInContext:(id)a3;
@end

@implementation SUUIBrowseItemPageSection

- (SUUIBrowseItemPageSection)initWithPageComponent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIBrowseItemPageSection;
  v6 = [(SUUIStorePageSection *)&v9 initWithPageComponent:v5];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_component, a3);
  }

  return v7;
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5 = a4;
  id v7 = [(SUUIBrowseItemPageSection *)self pageComponent];
  v6 = [v7 viewElement];
  [v5 addItemViewElement:v6];
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  id v8 = [v4 collectionView];
  [v8 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SUUIBrowseItemPageSectionReuseIdentifier"];
  id v5 = self->_layoutContext;
  v6 = [[SUUIViewElementLayoutContext alloc] initWithStorePageSectionContext:v4 previousLayoutContext:v5];

  layoutContext = self->_layoutContext;
  self->_layoutContext = v6;
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIBrowseItemPageSection *)self pageComponent];
  v6 = [(SUUIStorePageSection *)self context];
  id v7 = [v6 collectionView];
  id v8 = [v7 dequeueReusableCellWithReuseIdentifier:@"SUUIBrowseItemPageSectionReuseIdentifier" forIndexPath:v4];

  objc_super v9 = [v5 title];
  [v8 setTitle:v9];

  v10 = [v5 subtitle];
  [v8 setSubtitle:v10];

  v11 = [v5 decorationImage];
  v12 = [v11 style];
  v13 = [(SUUIViewElementLayoutContext *)self->_layoutContext tintColor];
  v14 = SUUIViewElementPlainColorWithStyle(v12, v13);

  v15 = [(SUUIBrowseItemPageSection *)self _imageForImageViewElement:v11 styleColor:v14];
  [v8 setDecorationImage:v15];
  objc_msgSend(v8, "setShowTopBorder:", objc_msgSend(v5, "showTopBorder"));
  v16 = [(SUUIStorePageSection *)self context];
  uint64_t v17 = [v16 layoutStyle];

  [v8 setHasBlueBackgroundWhenSelected:v17 == 2];
  return v8;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  v3 = [(SUUIStorePageSection *)self context];
  id v4 = [v3 collectionView];
  [v4 bounds];
  double v6 = v5;

  double v7 = 44.0;
  double v8 = v6;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SUUIBrowseItemPageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  double v7 = [(SUUIStorePageSection *)self context];
  double v8 = [v7 activeMetricsImpressionSession];
  [v8 beginActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SUUIBrowseItemPageSection;
  [(SUUIStorePageSection *)&v9 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SUUIBrowseItemPageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  double v7 = [(SUUIStorePageSection *)self context];
  double v8 = [v7 activeMetricsImpressionSession];
  [v8 endActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SUUIBrowseItemPageSection;
  [(SUUIStorePageSection *)&v9 collectionViewDidEndDisplayingCellForItemAtIndexPath:v4];
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

- (int64_t)numberOfCells
{
  return 1;
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  id v23 = a3;
  double v4 = [(SUUIStorePageSection *)self context];
  double v5 = [v4 parentViewController];

  id v6 = v5;
  double v7 = v6;
  if (v6)
  {
    double v8 = v6;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v9 = [v8 parentViewController];

      double v8 = (void *)v9;
      if (!v9) {
        goto LABEL_7;
      }
    }
    v10 = [(SUUIStorePageSection *)self context];
    v11 = [v10 collectionView];
    v12 = [v11 cellForItemAtIndexPath:v23];

    v13 = [v8 view];
    [v12 bounds];
    objc_msgSend(v13, "convertRect:fromView:", v12);
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v25.origin.x = v15;
    v25.origin.y = v17;
    v25.size.width = v19;
    v25.size.height = v21;
    [v7 setSUUIStackedBarSplit:CGRectGetMaxY(v25)];
    v22 = [(SUUIBrowseItemPageSection *)self pageComponent];
    [v8 selectGenreListComponent:v22];
  }
LABEL_7:
}

- (id)_imageForImageViewElement:(id)a3 styleColor:(id)a4
{
  id v5 = a4;
  id v6 = [a3 resourceName];
  double v7 = v6;
  if (v6)
  {
    double v8 = SUUIImageWithResourceName(v6);
    uint64_t v9 = v8;
    if (v5)
    {
      uint64_t v10 = [v8 _flatImageWithColor:v5];

      uint64_t v9 = (void *)v10;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (SUUIBrowseItemComponent)pageComponent
{
  return self->_component;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_layoutContext, 0);
}

@end