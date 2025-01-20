@interface SUUIEditorialPageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SUUIEditorialPageSection)initWithPageComponent:(id)a3;
- (id)_colorScheme;
- (id)_editorialLayout;
- (id)cellForIndexPath:(id)a3;
- (int64_t)applyUpdateType:(int64_t)a3;
- (int64_t)numberOfCells;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewDidSelectItemAtIndexPath:(id)a3;
- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3;
- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4;
- (void)willAppearInContext:(id)a3;
- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SUUIEditorialPageSection

- (SUUIEditorialPageSection)initWithPageComponent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIEditorialPageSection;
  return [(SUUIStorePageSection *)&v4 initWithPageComponent:a3];
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5 = a4;
  id v7 = [(SUUIStorePageSection *)self pageComponent];
  v6 = [v7 viewElement];
  [v5 addItemViewElement:v6];
}

- (int64_t)applyUpdateType:(int64_t)a3
{
  editorialLayout = self->_editorialLayout;
  self->_editorialLayout = 0;

  colorScheme = self->_colorScheme;
  self->_colorScheme = 0;

  self->_hasValidColorScheme = 0;
  v8.receiver = self;
  v8.super_class = (Class)SUUIEditorialPageSection;
  return [(SUUIStorePageSection *)&v8 applyUpdateType:a3];
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIStorePageSection *)self context];
  v6 = [v5 collectionView];
  id v7 = [v6 dequeueReusableCellWithReuseIdentifier:0x27050B070 forIndexPath:v4];

  objc_super v8 = [v7 layout];
  v9 = [(SUUIEditorialPageSection *)self _colorScheme];
  [v8 setColoringWithColorScheme:v9];

  [v8 resetContentInset];
  if (![(SUUIStorePageSection *)self isTopSection])
  {
    [v8 contentInset];
    v10 = [(SUUIStorePageSection *)self context];
    [v10 horizontalPadding];
    double v12 = v11;

    v13 = [(SUUIStorePageSection *)self context];
    [v13 horizontalPadding];
    double v15 = v14;

    objc_msgSend(v8, "setContentInset:", 0.0, v15, 0.0, v12);
  }
  v16 = [(SUUIEditorialPageSection *)self _editorialLayout];
  [v8 applyEditorialLayout:v16 withOrientation:0 expanded:self->_isExpanded];

  v17 = [v8 textBoxView];
  v18 = [v5 parentViewController];
  v19 = [v18 clientContext];
  v20 = v19;
  if (v19) {
    [v19 localizedStringForKey:@"MORE_BUTTON"];
  }
  else {
  v21 = +[SUUIClientContext localizedStringForKey:@"MORE_BUTTON" inBundles:0];
  }
  [v17 setMoreButtonTitle:v21];

  if (self->_isExpanded)
  {
    uint64_t v22 = 0;
  }
  else
  {
    v23 = [(SUUIStorePageSection *)self pageComponent];
    uint64_t v22 = [v23 maximumBodyLines];
  }
  [v17 setNumberOfVisibleLines:v22];

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = [(SUUIStorePageSection *)self context];
  [v4 activePageWidth];
  double v6 = v5;

  id v7 = [(SUUIEditorialPageSection *)self _editorialLayout];
  [v7 layoutHeightForOrientation:0 expanded:self->_isExpanded];
  double v9 = v8;
  v10 = [v7 bodyTextLayoutForOrientation:0];
  double v11 = [v7 titleTextLayoutForOrientation:0];
  if (v11) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12) {
    double v9 = v9 + 17.0;
  }

  double v13 = v6;
  double v14 = v9;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)collectionViewDidSelectItemAtIndexPath:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = [(SUUIStorePageSection *)self context];
  double v5 = [v4 collectionView];

  double v6 = [(SUUIEditorialPageSection *)self _editorialLayout];
  id v7 = [v6 bodyTextLayoutForOrientation:0];

  if (!self->_isExpanded && [v7 requiresTruncation])
  {
    self->_isExpanded = 1;
    double v8 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForItem:inSection:", 0, -[SUUIStorePageSection sectionIndex](self, "sectionIndex"));
    v10[0] = v8;
    double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    [v5 reloadItemsAtIndexPaths:v9];
  }
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SUUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  id v7 = [(SUUIStorePageSection *)self context];
  double v8 = [v7 activeMetricsImpressionSession];
  [v8 beginActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SUUIEditorialPageSection;
  [(SUUIStorePageSection *)&v9 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SUUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  id v7 = [(SUUIStorePageSection *)self context];
  double v8 = [v7 activeMetricsImpressionSession];
  [v8 endActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SUUIEditorialPageSection;
  [(SUUIStorePageSection *)&v9 collectionViewDidEndDisplayingCellForItemAtIndexPath:v4];
}

- (int64_t)numberOfCells
{
  return 1;
}

- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  double v6 = [(SUUIStorePageSection *)self context];
  id v7 = [v6 collectionView];
  id v11 = [v7 cellForItemAtIndexPath:v5];

  double v8 = v11;
  if (v11)
  {
    objc_super v9 = [v11 layout];
    v10 = [(SUUIEditorialPageSection *)self _editorialLayout];
    [v9 applyEditorialLayout:v10 withOrientation:0 expanded:self->_isExpanded];

    double v8 = v11;
  }
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  colorScheme = self->_colorScheme;
  self->_colorScheme = 0;

  self->_hasValidColorScheme = 0;
  double v6 = [v4 collectionView];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x27050B070];

  id v7 = [v4 textLayoutCache];
  double v8 = [(SUUIEditorialLayout *)self->_editorialLayout layoutCache];

  if (v8 != v7)
  {
    editorialLayout = self->_editorialLayout;
    self->_editorialLayout = 0;
  }
  v10 = [(SUUIEditorialPageSection *)self _editorialLayout];
  [v10 enqueueLayoutRequests];

  id v11 = self->_layoutContext;
  BOOL v12 = [[SUUIViewElementLayoutContext alloc] initWithStorePageSectionContext:v4 previousLayoutContext:v11];
  layoutContext = self->_layoutContext;
  self->_layoutContext = v12;

  v14.receiver = self;
  v14.super_class = (Class)SUUIEditorialPageSection;
  [(SUUIStorePageSection *)&v14 willAppearInContext:v4];
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  editorialLayout = self->_editorialLayout;
  self->_editorialLayout = 0;
  id v8 = a4;

  objc_super v9 = [(SUUIEditorialPageSection *)self _editorialLayout];
  [v9 enqueueLayoutRequests];

  v10.receiver = self;
  v10.super_class = (Class)SUUIEditorialPageSection;
  -[SUUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v10, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

- (id)_colorScheme
{
  if (!self->_hasValidColorScheme)
  {
    self->_hasValidColorScheme = 1;
    v3 = [(SUUIStorePageSection *)self pageComponent];
    id v4 = [v3 viewElement];
    id v5 = [v4 style];

    double v6 = [(SUUIViewElementLayoutContext *)self->_layoutContext tintColor];
    id v7 = SUUIViewElementPlainColorWithStyle(v5, v6);

    if (v7)
    {
      id v8 = objc_alloc_init(SUUIColorScheme);
      colorScheme = self->_colorScheme;
      self->_colorScheme = v8;

      [(SUUIColorScheme *)self->_colorScheme setPrimaryTextColor:v7];
    }
    else
    {
      objc_super v10 = [(SUUIStorePageSection *)self context];
      id v11 = [v10 colorScheme];
      BOOL v12 = self->_colorScheme;
      self->_colorScheme = v11;
    }
  }
  double v13 = self->_colorScheme;
  return v13;
}

- (id)_editorialLayout
{
  editorialLayout = self->_editorialLayout;
  if (!editorialLayout)
  {
    id v4 = [(SUUIStorePageSection *)self context];
    id v5 = [SUUIEditorialLayout alloc];
    double v6 = [(SUUIStorePageSection *)self pageComponent];
    id v7 = [(SUUIStorePageSection *)self context];
    id v8 = [v7 textLayoutCache];
    objc_super v9 = [(SUUIEditorialLayout *)v5 initWithEditorial:v6 layoutCache:v8];
    objc_super v10 = self->_editorialLayout;
    self->_editorialLayout = v9;

    id v11 = self->_editorialLayout;
    [v4 activePageWidth];
    double v13 = v12;
    objc_super v14 = [(SUUIStorePageSection *)self context];
    [v14 horizontalPadding];
    [(SUUIEditorialLayout *)v11 setLayoutWidth:0 forOrientation:v13 + v15 * -2.0];

    editorialLayout = self->_editorialLayout;
  }
  return editorialLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutContext, 0);
  objc_storeStrong((id *)&self->_editorialLayout, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
}

@end