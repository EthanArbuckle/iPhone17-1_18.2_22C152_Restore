@interface SearchHomeTipLayoutProvider
- (id)cellClasses;
- (id)cellForRowAtIndexPath:(id)a3 collectionView:(id)a4 item:(id)a5;
- (id)cellReuseIdentifier;
- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8;
- (int64_t)type;
@end

@implementation SearchHomeTipLayoutProvider

- (id)cellClasses
{
  uint64_t v4 = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (id)cellForRowAtIndexPath:(id)a3 collectionView:(id)a4 item:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [(SearchHomeTipLayoutProvider *)self cellReuseIdentifier];
  v10 = [v7 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v8];

  return v10;
}

- (id)cellReuseIdentifier
{
  return +[SearchHomeTipCollectionViewCell identifier];
}

- (int64_t)type
{
  return 6;
}

- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8
{
  v9 = +[NSCollectionLayoutDimension fractionalWidthDimension:](NSCollectionLayoutDimension, "fractionalWidthDimension:", a3, a6, a7, a8, 1.0, a5);
  v10 = +[NSCollectionLayoutDimension estimatedDimension:100.0];
  v11 = +[NSCollectionLayoutSize sizeWithWidthDimension:v9 heightDimension:v10];

  v12 = +[NSCollectionLayoutItem itemWithLayoutSize:v11];
  v13 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  v14 = +[NSCollectionLayoutDimension estimatedDimension:100.0];
  v15 = +[NSCollectionLayoutSize sizeWithWidthDimension:v13 heightDimension:v14];

  v23 = v12;
  v16 = +[NSArray arrayWithObjects:&v23 count:1];
  v17 = +[NSCollectionLayoutGroup verticalGroupWithLayoutSize:v15 subitems:v16];

  v18 = +[NSCollectionLayoutSection sectionWithGroup:v17];
  if (!v18)
  {
    v19 = sub_100576A04();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "The LayoutSection is nil for some reason in class - %@.", (uint8_t *)&v21, 0xCu);
    }
  }

  return v18;
}

@end