@interface SKUISpacePageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SKUISpacePageSection)initWithPageComponent:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (int64_t)numberOfCells;
- (void)willAppearInContext:(id)a3;
@end

@implementation SKUISpacePageSection

- (SKUISpacePageSection)initWithPageComponent:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISpacePageSection initWithPageComponent:]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUISpacePageSection;
  v5 = [(SKUIStorePageSection *)&v7 initWithPageComponent:v4];

  return v5;
}

- (void)willAppearInContext:(id)a3
{
  id v3 = [a3 collectionView];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SKUISpacePageSectionReuseIdentifier"];
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIStorePageSection *)self context];
  v6 = [v5 collectionView];
  objc_super v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"SKUISpacePageSectionReuseIdentifier" forIndexPath:v4];

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = [(SKUIStorePageSection *)self context];
  v5 = [v4 collectionView];
  [v5 bounds];
  double v7 = v6;

  v8 = [(SKUIStorePageSection *)self pageComponent];
  [v8 height];
  double v10 = v9;

  double v11 = v7;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (int64_t)numberOfCells
{
  return 1;
}

- (void)initWithPageComponent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISpacePageSection initWithPageComponent:]";
}

@end