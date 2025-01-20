@interface SearchHomePublishersLayoutProvider
- (id)cellClasses;
- (id)cellForRowAtIndexPath:(id)a3 collectionView:(id)a4 item:(id)a5;
- (id)cellReuseIdentifier;
- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8;
- (int64_t)type;
@end

@implementation SearchHomePublishersLayoutProvider

- (id)cellClasses
{
  uint64_t v4 = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (int64_t)type
{
  return 4;
}

- (id)cellForRowAtIndexPath:(id)a3 collectionView:(id)a4 item:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(SearchHomePublishersLayoutProvider *)self cellReuseIdentifier];
  v12 = [v9 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v10];

  v13 = [(SearchHomePublishersLayoutProvider *)self cellReuseIdentifier];
  [v12 setAccessibilityIdentifier:v13];

  [v12 setViewModel:v8];

  return v12;
}

- (id)cellReuseIdentifier
{
  return +[TwoLineCollectionViewListCell identifier];
}

- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8
{
  id v12 = a3;
  id v13 = a8;
  id v14 = [objc_alloc((Class)_UICollectionViewListLayoutSectionConfiguration) initWithAppearanceStyle:0 layoutEnvironment:v12];
  v15 = [v12 traitCollection];
  BOOL v16 = [v15 userInterfaceIdiom] != (id)5;

  [v14 setSeparatorStyle:v16];
  +[TwoLineCollectionViewListCell estimatedCellHeight];
  [v14 setEstimatedRowHeight:];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1003A1AC0;
  v28[3] = &unk_1012E7240;
  v28[4] = a7;
  [v14 setSeparatorInsetProvider:v28];
  [v14 setHeaderTopPadding:0.0];
  v17 = [v14 _separatorConfiguration];
  id v18 = [v17 copy];

  v19 = [v13 dynamicHairlineColor];

  [v18 _setColor:v19];
  [v14 _setSeparatorConfiguration:v18];
  id v20 = [objc_alloc((Class)_UICollectionViewListLayoutSection) initWithConfiguration:v14 layoutEnvironment:v12];
  v21 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  v22 = +[NSCollectionLayoutDimension estimatedDimension:a4];
  v23 = +[NSCollectionLayoutSize sizeWithWidthDimension:v21 heightDimension:v22];

  v24 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v23 elementKind:UICollectionElementKindSectionHeader alignment:1];
  v31 = v24;
  v25 = +[NSArray arrayWithObjects:&v31 count:1];
  [v20 setBoundarySupplementaryItems:v25];

  if (!v20)
  {
    v26 = sub_100576A04();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = self;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "The LayoutSection is nil for some reason in class - %@.", buf, 0xCu);
    }
  }

  return v20;
}

@end