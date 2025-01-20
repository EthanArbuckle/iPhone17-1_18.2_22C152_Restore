@interface SUUISpacePageSection
- (CGSize)cellSizeForIndexPath:(id)a3;
- (SUUISpacePageSection)initWithPageComponent:(id)a3;
- (id)cellForIndexPath:(id)a3;
- (int64_t)numberOfCells;
- (void)willAppearInContext:(id)a3;
@end

@implementation SUUISpacePageSection

- (SUUISpacePageSection)initWithPageComponent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUISpacePageSection;
  return [(SUUIStorePageSection *)&v4 initWithPageComponent:a3];
}

- (void)willAppearInContext:(id)a3
{
  id v3 = [a3 collectionView];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"SUUISpacePageSectionReuseIdentifier"];
}

- (id)cellForIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(SUUIStorePageSection *)self context];
  v6 = [v5 collectionView];
  v7 = [v6 dequeueReusableCellWithReuseIdentifier:@"SUUISpacePageSectionReuseIdentifier" forIndexPath:v4];

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  id v4 = [(SUUIStorePageSection *)self context];
  v5 = [v4 collectionView];
  [v5 bounds];
  double v7 = v6;

  v8 = [(SUUIStorePageSection *)self pageComponent];
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

@end