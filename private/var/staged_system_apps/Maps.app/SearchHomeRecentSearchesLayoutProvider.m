@interface SearchHomeRecentSearchesLayoutProvider
- (id)cellClasses;
- (id)cellForRowAtIndexPath:(id)a3 collectionView:(id)a4 item:(id)a5;
- (id)cellReuseIdentifier;
- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8;
- (int64_t)type;
@end

@implementation SearchHomeRecentSearchesLayoutProvider

- (id)cellClasses
{
  uint64_t v4 = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (id)cellReuseIdentifier
{
  return +[QuerySuggestionCollectionViewCell identifier];
}

- (int64_t)type
{
  return 1;
}

- (id)cellForRowAtIndexPath:(id)a3 collectionView:(id)a4 item:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SearchHomeRecentSearchesLayoutProvider *)self cellReuseIdentifier];
  v12 = [v9 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v8];

  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_1001045B0;
  v28 = sub_100104B48;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_1001045B0;
  v22 = sub_100104B48;
  id v23 = 0;
  v13 = [v10 historyEntry];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100D681D8;
  v17[3] = &unk_101323070;
  v17[4] = &v24;
  v17[5] = &v18;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100D68258;
  v16[3] = &unk_101323098;
  v16[4] = &v24;
  v16[5] = &v18;
  [v13 ifSearch:v17 ifRoute:0 ifPlaceDisplay:v16 ifTransitLineItem:0];

  v14 = [(SearchHomeRecentSearchesLayoutProvider *)self cellReuseIdentifier];
  [v12 setAccessibilityIdentifier:v14];

  [v12 setTitle:v25[5] highlightTitleRanges:0 detailText:v19[5] style:1];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);

  return v12;
}

- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a8;
  id v16 = [objc_alloc((Class)_UICollectionViewListLayoutSectionConfiguration) initWithAppearanceStyle:0 layoutEnvironment:v13];
  [v16 setSeparatorStyle:1];
  +[QuerySuggestionCollectionViewCell estimatedCellHeight];
  [v16 setEstimatedRowHeight];
  if (v14)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100D686D4;
    v29[3] = &unk_1013230E8;
    id v30 = v14;
    [v16 setTrailingSwipeActionsConfigurationProvider:v29];
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100D68880;
  v28[3] = &unk_1012E7240;
  v28[4] = a7;
  [v16 setSeparatorInsetProvider:v28];
  [v16 setHeaderTopPadding:0.0];
  v17 = [v16 _separatorConfiguration];
  id v18 = [v17 copy];

  v19 = [v15 dynamicHairlineColor];

  [v18 _setColor:v19];
  [v16 _setSeparatorConfiguration:v18];
  id v20 = [objc_alloc((Class)_UICollectionViewListLayoutSection) initWithConfiguration:v16 layoutEnvironment:v13];
  v21 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  v22 = +[NSCollectionLayoutDimension estimatedDimension:a4];
  id v23 = +[NSCollectionLayoutSize sizeWithWidthDimension:v21 heightDimension:v22];

  uint64_t v24 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v23 elementKind:UICollectionElementKindSectionHeader alignment:1];
  v33 = v24;
  v25 = +[NSArray arrayWithObjects:&v33 count:1];
  [v20 setBoundarySupplementaryItems:v25];

  if (!v20)
  {
    uint64_t v26 = sub_100576A04();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v32 = self;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "The LayoutSection is nil for some reason in class - %@.", buf, 0xCu);
    }
  }

  return v20;
}

@end