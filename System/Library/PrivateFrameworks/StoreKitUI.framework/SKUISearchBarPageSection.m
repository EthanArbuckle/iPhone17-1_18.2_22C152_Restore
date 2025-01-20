@interface SKUISearchBarPageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (UIEdgeInsets)sectionContentInset;
- (id)_searchBarController;
- (id)backgroundColorForIndexPath:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (int64_t)numberOfCells;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3;
- (void)numberOfCells;
- (void)willAppearInContext:(id)a3;
@end

@implementation SKUISearchBarPageSection

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5 = a4;
  id v7 = [(SKUIStorePageSection *)self pageComponent];
  v6 = [v7 viewElement];
  [v5 addItemViewElement:v6];
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIStorePageSection *)self pageComponent];
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
    v13.super_class = (Class)SKUISearchBarPageSection;
    id v10 = [(SKUIStorePageSection *)&v13 backgroundColorForIndexPath:v4];
  }
  v11 = v10;

  return v11;
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISearchBarPageSection cellForIndexPath:]();
  }
  id v5 = [(SKUIStorePageSection *)self context];
  v6 = [v5 collectionView];
  id v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"SKUISearchBarReuseIdentifier" forIndexPath:v4];

  v8 = [(SKUISearchBarPageSection *)self _searchBarController];
  v9 = [v8 searchBar];

  objc_msgSend(v9, "setContentInset:", 0.0, 15.0, 0.0, 15.0);
  [v7 setContentChildView:v9];
  objc_msgSend(v7, "setContentInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = [(SKUIStorePageSection *)self context];
  [v4 activePageWidth];
  double v6 = v5;

  id v7 = [(SKUISearchBarPageSection *)self _searchBarController];
  v8 = [v7 searchBar];

  objc_msgSend(v8, "sizeThatFits:", v6, 1.79769313e308);
  double v10 = v9;

  double v11 = v6;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SKUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  id v7 = [(SKUIStorePageSection *)self context];
  v8 = [v7 activeMetricsImpressionSession];
  [v8 beginActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SKUISearchBarPageSection;
  [(SKUIStorePageSection *)&v9 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SKUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  id v7 = [(SKUIStorePageSection *)self context];
  v8 = [v7 activeMetricsImpressionSession];
  [v8 endActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SKUISearchBarPageSection;
  [(SKUIStorePageSection *)&v9 collectionViewDidEndDisplayingCellForItemAtIndexPath:v4];
}

- (int64_t)numberOfCells
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISearchBarPageSection numberOfCells]();
  }
  return 1;
}

- (UIEdgeInsets)sectionContentInset
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 6.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  double v5 = [v4 collectionView];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SKUISearchBarReuseIdentifier"];
  v6.receiver = self;
  v6.super_class = (Class)SKUISearchBarPageSection;
  [(SKUIStorePageSection *)&v6 willAppearInContext:v4];
}

- (id)_searchBarController
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  searchBarController = self->_searchBarController;
  if (!searchBarController)
  {
    id v4 = [(SKUIStorePageSection *)self pageComponent];
    double v5 = [v4 viewElement];

    objc_super v6 = [[SKUISearchBarController alloc] initWithSearchBarViewElement:v5];
    id v7 = self->_searchBarController;
    self->_searchBarController = v6;

    v8 = [(SKUIStorePageSection *)self context];
    objc_super v9 = [v8 parentViewController];

    double v10 = self->_searchBarController;
    double v11 = [v9 clientContext];
    [(SKUISearchBarController *)v10 setClientContext:v11];

    id v12 = v9;
    objc_super v13 = [v12 navigationController];
    v14 = [v13 viewControllers];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    id v17 = v12;
    if (v16)
    {
      uint64_t v18 = v16;
      uint64_t v19 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v15);
          }
          v21 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (SKUIViewControllerIsDescendent(v12, v21))
          {
            id v17 = v21;

            goto LABEL_12;
          }
        }
        uint64_t v18 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v18) {
          continue;
        }
        break;
      }
      id v17 = v12;
    }
LABEL_12:

    -[SKUISearchBarController setParentViewController:](self->_searchBarController, "setParentViewController:", v17, (void)v23);
    searchBarController = self->_searchBarController;
  }

  return searchBarController;
}

- (void).cxx_destruct
{
}

- (void)cellForIndexPath:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISearchBarPageSection cellForIndexPath:]";
}

- (void)numberOfCells
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISearchBarPageSection numberOfCells]";
}

@end