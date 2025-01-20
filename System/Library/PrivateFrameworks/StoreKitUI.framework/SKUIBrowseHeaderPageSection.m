@interface SKUIBrowseHeaderPageSection
- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3;
- (BOOL)collectionViewShouldSelectItemAtIndexPath:(id)a3;
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SKUIBrowseHeaderPageSection)initWithPageComponent:(id)a3;
- (UIEdgeInsets)sectionContentInset;
- (id)cellForIndexPath:(id)a3;
- (int64_t)numberOfCells;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3;
- (void)willAppearInContext:(id)a3;
@end

@implementation SKUIBrowseHeaderPageSection

- (SKUIBrowseHeaderPageSection)initWithPageComponent:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBrowseHeaderPageSection initWithPageComponent:]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIBrowseHeaderPageSection;
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

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIStorePageSection *)self pageComponent];
  v6 = [v5 viewElement];

  id v7 = [(SKUIStorePageSection *)self context];
  v8 = [v7 collectionView];
  v9 = [v8 dequeueReusableCellWithReuseIdentifier:@"SKUIBrowseHeaderPageSectionReuseIdentifier" forIndexPath:v4];

  v10 = [v6 titleLabels];
  v11 = [v10 firstObject];
  v12 = [v11 text];
  v13 = [v12 string];
  [v9 setTitle:v13];

  return v9;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  v3 = [(SKUIStorePageSection *)self context];
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
  double v5 = [(SKUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  double v7 = [(SKUIStorePageSection *)self context];
  double v8 = [v7 activeMetricsImpressionSession];
  [v8 beginActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SKUIBrowseHeaderPageSection;
  [(SKUIStorePageSection *)&v9 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SKUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  double v7 = [(SKUIStorePageSection *)self context];
  double v8 = [v7 activeMetricsImpressionSession];
  [v8 endActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SKUIBrowseHeaderPageSection;
  [(SKUIStorePageSection *)&v9 collectionViewDidEndDisplayingCellForItemAtIndexPath:v4];
}

- (int64_t)numberOfCells
{
  return 1;
}

- (UIEdgeInsets)sectionContentInset
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
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
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SKUIBrowseHeaderPageSectionReuseIdentifier"];

  v6.receiver = self;
  v6.super_class = (Class)SKUIBrowseHeaderPageSection;
  [(SKUIStorePageSection *)&v6 willAppearInContext:v4];
}

- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3
{
  return 0;
}

- (BOOL)collectionViewShouldSelectItemAtIndexPath:(id)a3
{
  return 0;
}

- (void)initWithPageComponent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIBrowseHeaderPageSection initWithPageComponent:]";
}

@end