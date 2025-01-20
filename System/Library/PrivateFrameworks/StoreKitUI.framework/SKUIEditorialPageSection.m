@interface SKUIEditorialPageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SKUIEditorialPageSection)initWithPageComponent:(id)a3;
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

@implementation SKUIEditorialPageSection

- (SKUIEditorialPageSection)initWithPageComponent:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIEditorialPageSection initWithPageComponent:]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIEditorialPageSection;
  v5 = [(SKUIStorePageSection *)&v7 initWithPageComponent:v4];

  return v5;
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5 = a4;
  id v7 = [(SKUIStorePageSection *)self pageComponent];
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
  v8.super_class = (Class)SKUIEditorialPageSection;
  return [(SKUIStorePageSection *)&v8 applyUpdateType:a3];
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIStorePageSection *)self context];
  v6 = [v5 collectionView];
  id v7 = [v6 dequeueReusableCellWithReuseIdentifier:0x1F1C90D28 forIndexPath:v4];

  objc_super v8 = [v7 layout];
  v9 = [(SKUIEditorialPageSection *)self _colorScheme];
  [v8 setColoringWithColorScheme:v9];

  [v8 resetContentInset];
  if (![(SKUIStorePageSection *)self isTopSection])
  {
    [v8 contentInset];
    v10 = [(SKUIStorePageSection *)self context];
    [v10 horizontalPadding];
    double v12 = v11;

    v13 = [(SKUIStorePageSection *)self context];
    [v13 horizontalPadding];
    double v15 = v14;

    objc_msgSend(v8, "setContentInset:", 0.0, v15, 0.0, v12);
  }
  v16 = [(SKUIEditorialPageSection *)self _editorialLayout];
  [v8 applyEditorialLayout:v16 withOrientation:0 expanded:self->_isExpanded];

  v17 = [v8 textBoxView];
  v18 = [v5 parentViewController];
  v19 = [v18 clientContext];
  v20 = v19;
  if (v19) {
    [v19 localizedStringForKey:@"MORE_BUTTON"];
  }
  else {
  v21 = +[SKUIClientContext localizedStringForKey:@"MORE_BUTTON" inBundles:0];
  }
  [v17 setMoreButtonTitle:v21];

  if (self->_isExpanded)
  {
    uint64_t v22 = 0;
  }
  else
  {
    v23 = [(SKUIStorePageSection *)self pageComponent];
    uint64_t v22 = [v23 maximumBodyLines];
  }
  [v17 setNumberOfVisibleLines:v22];

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = [(SKUIStorePageSection *)self context];
  [v4 activePageWidth];
  double v6 = v5;

  id v7 = [(SKUIEditorialPageSection *)self _editorialLayout];
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
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(SKUIStorePageSection *)self context];
  double v5 = [v4 collectionView];

  double v6 = [(SKUIEditorialPageSection *)self _editorialLayout];
  id v7 = [v6 bodyTextLayoutForOrientation:0];

  if (!self->_isExpanded && [v7 requiresTruncation])
  {
    self->_isExpanded = 1;
    double v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", 0, -[SKUIStorePageSection sectionIndex](self, "sectionIndex"));
    v10[0] = v8;
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v5 reloadItemsAtIndexPaths:v9];
  }
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SKUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  id v7 = [(SKUIStorePageSection *)self context];
  double v8 = [v7 activeMetricsImpressionSession];
  [v8 beginActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SKUIEditorialPageSection;
  [(SKUIStorePageSection *)&v9 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SKUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  id v7 = [(SKUIStorePageSection *)self context];
  double v8 = [v7 activeMetricsImpressionSession];
  [v8 endActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SKUIEditorialPageSection;
  [(SKUIStorePageSection *)&v9 collectionViewDidEndDisplayingCellForItemAtIndexPath:v4];
}

- (int64_t)numberOfCells
{
  return 1;
}

- (void)reloadCellWithIndexPath:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  double v6 = [(SKUIStorePageSection *)self context];
  id v7 = [v6 collectionView];
  id v11 = [v7 cellForItemAtIndexPath:v5];

  double v8 = v11;
  if (v11)
  {
    objc_super v9 = [v11 layout];
    v10 = [(SKUIEditorialPageSection *)self _editorialLayout];
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
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:0x1F1C90D28];

  id v7 = [v4 textLayoutCache];
  double v8 = [(SKUIEditorialLayout *)self->_editorialLayout layoutCache];

  if (v8 != v7)
  {
    editorialLayout = self->_editorialLayout;
    self->_editorialLayout = 0;
  }
  v10 = [(SKUIEditorialPageSection *)self _editorialLayout];
  [v10 enqueueLayoutRequests];

  id v11 = self->_layoutContext;
  BOOL v12 = [[SKUIViewElementLayoutContext alloc] initWithStorePageSectionContext:v4 previousLayoutContext:v11];
  layoutContext = self->_layoutContext;
  self->_layoutContext = v12;

  v14.receiver = self;
  v14.super_class = (Class)SKUIEditorialPageSection;
  [(SKUIStorePageSection *)&v14 willAppearInContext:v4];
}

- (void)willTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  editorialLayout = self->_editorialLayout;
  self->_editorialLayout = 0;
  id v8 = a4;

  objc_super v9 = [(SKUIEditorialPageSection *)self _editorialLayout];
  [v9 enqueueLayoutRequests];

  v10.receiver = self;
  v10.super_class = (Class)SKUIEditorialPageSection;
  -[SKUIStorePageSection willTransitionToSize:withTransitionCoordinator:](&v10, sel_willTransitionToSize_withTransitionCoordinator_, v8, width, height);
}

- (id)_colorScheme
{
  if (!self->_hasValidColorScheme)
  {
    self->_hasValidColorScheme = 1;
    v3 = [(SKUIStorePageSection *)self pageComponent];
    id v4 = [v3 viewElement];
    id v5 = [v4 style];

    double v6 = [(SKUIViewElementLayoutContext *)self->_layoutContext tintColor];
    id v7 = SKUIViewElementPlainColorWithStyle(v5, v6);

    if (v7)
    {
      id v8 = objc_alloc_init(SKUIColorScheme);
      colorScheme = self->_colorScheme;
      self->_colorScheme = v8;

      [(SKUIColorScheme *)self->_colorScheme setPrimaryTextColor:v7];
    }
    else
    {
      objc_super v10 = [(SKUIStorePageSection *)self context];
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
    id v4 = [(SKUIStorePageSection *)self context];
    id v5 = [SKUIEditorialLayout alloc];
    double v6 = [(SKUIStorePageSection *)self pageComponent];
    id v7 = [(SKUIStorePageSection *)self context];
    id v8 = [v7 textLayoutCache];
    objc_super v9 = [(SKUIEditorialLayout *)v5 initWithEditorial:v6 layoutCache:v8];
    objc_super v10 = self->_editorialLayout;
    self->_editorialLayout = v9;

    id v11 = self->_editorialLayout;
    [v4 activePageWidth];
    double v13 = v12;
    objc_super v14 = [(SKUIStorePageSection *)self context];
    [v14 horizontalPadding];
    [(SKUIEditorialLayout *)v11 setLayoutWidth:0 forOrientation:v13 + v15 * -2.0];

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

- (void)initWithPageComponent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIEditorialPageSection initWithPageComponent:]";
}

@end