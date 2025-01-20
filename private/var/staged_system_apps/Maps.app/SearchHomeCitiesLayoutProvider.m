@interface SearchHomeCitiesLayoutProvider
- (MKPlaceCompactCollectionSizeController)sizeController;
- (SearchHomeCitiesLayoutProvider)initWithTraitEnvironment:(id)a3;
- (id)cellClasses;
- (id)cellForRowAtIndexPath:(id)a3 collectionView:(id)a4 item:(id)a5;
- (id)cellReuseIdentifier;
- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8;
- (int64_t)type;
- (void)setSizeController:(id)a3;
@end

@implementation SearchHomeCitiesLayoutProvider

- (SearchHomeCitiesLayoutProvider)initWithTraitEnvironment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchHomeCitiesLayoutProvider;
  v5 = [(SearchHomeCitiesLayoutProvider *)&v9 init];
  if (v5)
  {
    v6 = (MKPlaceCompactCollectionSizeController *)[objc_alloc((Class)MKPlaceCompactCollectionSizeController) initWithDefaultCollectionsConfigurationUsingTraitCollections:v4 inContext:1];
    sizeController = v5->_sizeController;
    v5->_sizeController = v6;
  }
  return v5;
}

- (id)cellClasses
{
  uint64_t v4 = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (id)cellReuseIdentifier
{
  return +[MKPlaceCompactCollectionCell reuseIdentifier];
}

- (int64_t)type
{
  return 5;
}

- (id)cellForRowAtIndexPath:(id)a3 collectionView:(id)a4 item:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(SearchHomeCitiesLayoutProvider *)self cellReuseIdentifier];
  v12 = [v9 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v10];

  [v12 configureWithModel:v8];

  return v12;
}

- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8
{
  id v11 = a3;
  v12 = [(SearchHomeCitiesLayoutProvider *)self sizeController];
  v13 = [v11 container];

  [v13 contentSize];
  [v12 sizeForCollectionWithMaxCollectionsWidth:];
  double v15 = v14;
  double v17 = v16;

  v18 = [(SearchHomeCitiesLayoutProvider *)self sizeController];
  [v18 sectionInsets];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  v27 = [(SearchHomeCitiesLayoutProvider *)self sizeController];
  [v27 minimumInterItemSpacing];
  double v29 = v28 * (double)(a7 - 1) + v15 * (double)a7;

  v30 = +[NSCollectionLayoutDimension absoluteDimension:v15];
  v31 = +[NSCollectionLayoutDimension absoluteDimension:v17];
  v32 = +[NSCollectionLayoutSize sizeWithWidthDimension:v30 heightDimension:v31];

  v33 = +[NSCollectionLayoutItem itemWithLayoutSize:v32];
  v34 = +[NSCollectionLayoutDimension estimatedDimension:v17];
  v35 = +[NSCollectionLayoutDimension absoluteDimension:v29];
  v36 = +[NSCollectionLayoutSize sizeWithWidthDimension:v35 heightDimension:v34];

  v37 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v36 subitem:v33 count:a7];
  v38 = [(SearchHomeCitiesLayoutProvider *)self sizeController];
  [v38 minimumInterItemSpacing];
  v39 = +[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:");
  [v37 setInterItemSpacing:v39];

  v40 = +[NSCollectionLayoutSection sectionWithGroup:v37];
  [v40 setOrthogonalScrollingBehavior:1];
  [v40 setContentInsets:v20, v22, v24, v26];
  v41 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  v42 = +[NSCollectionLayoutDimension estimatedDimension:a4];
  v43 = +[NSCollectionLayoutSize sizeWithWidthDimension:v41 heightDimension:v42];

  v44 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v43 elementKind:UICollectionElementKindSectionHeader alignment:1];
  v50 = v44;
  v45 = +[NSArray arrayWithObjects:&v50 count:1];
  [v40 setBoundarySupplementaryItems:v45];

  [v40 setSupplementariesFollowContentInsets:0];
  if (!v40)
  {
    v46 = sub_100576A04();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      int v48 = 138412290;
      v49 = self;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "The LayoutSection is nil for some reason in class - %@.", (uint8_t *)&v48, 0xCu);
    }
  }

  return v40;
}

- (MKPlaceCompactCollectionSizeController)sizeController
{
  return self->_sizeController;
}

- (void)setSizeController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end