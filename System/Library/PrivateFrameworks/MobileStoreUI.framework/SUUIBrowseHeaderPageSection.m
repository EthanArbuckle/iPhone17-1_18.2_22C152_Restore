@interface SUUIBrowseHeaderPageSection
- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3;
- (BOOL)collectionViewShouldSelectItemAtIndexPath:(id)a3;
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SUUIBrowseHeaderPageSection)initWithPageComponent:(id)a3;
- (UIEdgeInsets)sectionContentInset;
- (id)cellForIndexPath:(id)a3;
- (int64_t)numberOfCells;
- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4;
- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3;
- (void)collectionViewWillDisplayCellForItemAtIndexPath:(id)a3;
- (void)willAppearInContext:(id)a3;
@end

@implementation SUUIBrowseHeaderPageSection

- (SUUIBrowseHeaderPageSection)initWithPageComponent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIBrowseHeaderPageSection;
  return [(SUUIStorePageSection *)&v4 initWithPageComponent:a3];
}

- (void)addImpressionsForIndexPath:(id)a3 toSession:(id)a4
{
  id v5 = a4;
  id v7 = [(SUUIStorePageSection *)self pageComponent];
  v6 = [v7 viewElement];
  [v5 addItemViewElement:v6];
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SUUIStorePageSection *)self pageComponent];
  v6 = [v5 viewElement];

  id v7 = [(SUUIStorePageSection *)self context];
  v8 = [v7 collectionView];
  v9 = [v8 dequeueReusableCellWithReuseIdentifier:@"SUUIBrowseHeaderPageSectionReuseIdentifier" forIndexPath:v4];

  v10 = [v6 titleLabels];
  v11 = [v10 firstObject];
  v12 = [v11 text];
  v13 = [v12 string];
  [v9 setTitle:v13];

  return v9;
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
  double v5 = [(SUUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  double v7 = [(SUUIStorePageSection *)self context];
  double v8 = [v7 activeMetricsImpressionSession];
  [v8 beginActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SUUIBrowseHeaderPageSection;
  [(SUUIStorePageSection *)&v9 collectionViewWillDisplayCellForItemAtIndexPath:v4];
}

- (void)collectionViewDidEndDisplayingCellForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(SUUIStorePageSection *)self pageComponent];
  double v6 = [v5 viewElement];

  double v7 = [(SUUIStorePageSection *)self context];
  double v8 = [v7 activeMetricsImpressionSession];
  [v8 endActiveImpressionForViewElement:v6];

  v9.receiver = self;
  v9.super_class = (Class)SUUIBrowseHeaderPageSection;
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

- (void)willAppearInContext:(id)a3
{
  id v4 = a3;
  double v5 = [v4 collectionView];
  [v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SUUIBrowseHeaderPageSectionReuseIdentifier"];

  v6.receiver = self;
  v6.super_class = (Class)SUUIBrowseHeaderPageSection;
  [(SUUIStorePageSection *)&v6 willAppearInContext:v4];
}

- (BOOL)collectionViewShouldHighlightItemAtIndexPath:(id)a3
{
  return 0;
}

- (BOOL)collectionViewShouldSelectItemAtIndexPath:(id)a3
{
  return 0;
}

@end