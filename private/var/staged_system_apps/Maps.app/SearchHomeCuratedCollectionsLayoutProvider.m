@interface SearchHomeCuratedCollectionsLayoutProvider
- (SearchHomeCuratedCollectionsLayoutProvider)initWithTraitEnvironment:(id)a3;
- (UITraitEnvironment)traitEnvironment;
- (id)cellClasses;
- (id)cellForRowAtIndexPath:(id)a3 collectionView:(id)a4 item:(id)a5;
- (id)cellReuseIdentifier;
- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8;
- (int64_t)type;
- (void)setTraitEnvironment:(id)a3;
@end

@implementation SearchHomeCuratedCollectionsLayoutProvider

- (SearchHomeCuratedCollectionsLayoutProvider)initWithTraitEnvironment:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchHomeCuratedCollectionsLayoutProvider;
  v5 = [(SearchHomeCuratedCollectionsLayoutProvider *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SearchHomeCuratedCollectionsLayoutProvider *)v5 setTraitEnvironment:v4];
  }

  return v6;
}

- (id)cellClasses
{
  uint64_t v4 = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (id)cellReuseIdentifier
{
  return +[MKPlaceCollectionCell reuseIdentifier];
}

- (int64_t)type
{
  return 3;
}

- (id)cellForRowAtIndexPath:(id)a3 collectionView:(id)a4 item:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(SearchHomeCuratedCollectionsLayoutProvider *)self cellReuseIdentifier];
  v12 = [v9 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v10];

  v13 = +[MKPlaceCollectionCell reuseIdentifier];
  [v12 setAccessibilityIdentifier:v13];

  [v12 configureWithModel:v8];

  return v12;
}

- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8
{
  id v12 = a3;
  v75 = v12;
  v73 = self;
  if (MapsFeature_IsEnabled_Maps269()
    && ([(SearchHomeCuratedCollectionsLayoutProvider *)self traitEnvironment],
        v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = sub_1000BBB44(v13),
        v13,
        v14 != 5))
  {
    id v35 = objc_alloc((Class)MKPlaceCollectionsSizeController);
    v36 = [(SearchHomeCuratedCollectionsLayoutProvider *)self traitEnvironment];
    id v37 = [v35 initWithCollectionsConfiguration:0 isSingleCollection:1 usingTraitCollections:a7 == 1 inContext:v36];

    v38 = [v12 container];
    [v38 contentSize];
    [v37 sizeForCollectionWithMaxCollectionsWidth:];
    double v40 = v39;
    double v42 = v41;

    [v37 sectionInsets];
    double v72 = v43;
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    [v37 minimumInterItemSpacing];
    double v51 = v50 * (double)(a7 - 1) + v40 * (double)a7;
    v52 = +[NSCollectionLayoutDimension absoluteDimension:v40];
    v53 = +[NSCollectionLayoutDimension absoluteDimension:v42];
    v54 = +[NSCollectionLayoutSize sizeWithWidthDimension:v52 heightDimension:v53];

    v55 = +[NSCollectionLayoutItem itemWithLayoutSize:v54];
    v56 = +[NSCollectionLayoutDimension estimatedDimension:v42];
    v57 = +[NSCollectionLayoutDimension absoluteDimension:v51];
    v58 = +[NSCollectionLayoutSize sizeWithWidthDimension:v57 heightDimension:v56];

    v59 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v58 subitem:v55 count:a7];
    v74 = v37;
    [v37 minimumInterItemSpacing];
    v60 = +[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:");
    [v59 setInterItemSpacing:v60];

    v32 = +[NSCollectionLayoutSection sectionWithGroup:v59];
    [v32 setOrthogonalScrollingBehavior:1];
    [v32 setContentInsets:v72, v45, v47, v49];

    v34 = GEOResultRefinementSort_ptr;
  }
  else
  {
    id v15 = objc_alloc((Class)MKPlaceCollectionsSizeController);
    v16 = [(SearchHomeCuratedCollectionsLayoutProvider *)self traitEnvironment];
    id v17 = [v15 initWithDefaultCollectionsConfigurationUsingTraitCollections:v16 inContext:3];

    v18 = [v12 container];
    [v18 contentSize];
    [v17 sizeForCollectionWithMaxCollectionsWidth:];
    double v20 = v19;
    double v22 = v21;

    v23 = +[NSCollectionLayoutDimension absoluteDimension:v20];
    v24 = +[NSCollectionLayoutDimension absoluteDimension:v22];
    v25 = +[NSCollectionLayoutSize sizeWithWidthDimension:v23 heightDimension:v24];

    v26 = +[NSCollectionLayoutItem itemWithLayoutSize:v25];
    v27 = +[NSCollectionLayoutDimension estimatedDimension:260.0];
    v28 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
    v29 = +[NSCollectionLayoutSize sizeWithWidthDimension:v28 heightDimension:v27];

    v79 = v26;
    v30 = +[NSArray arrayWithObjects:&v79 count:1];
    v31 = +[NSCollectionLayoutGroup verticalGroupWithLayoutSize:v29 subitems:v30];

    v32 = +[NSCollectionLayoutSection sectionWithGroup:v31];
    [v32 setContentInsets:0.0, 16.0, 0.0, 16.0];
    v74 = v17;
    v33 = v17;
    v34 = GEOResultRefinementSort_ptr;
    [v33 minimumInterItemSpacing];
    [v32 setInterGroupSpacing:];
  }
  v61 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  v62 = +[NSCollectionLayoutDimension estimatedDimension:a4];
  v63 = +[NSCollectionLayoutSize sizeWithWidthDimension:v61 heightDimension:v62];

  v64 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v63 elementKind:UICollectionElementKindSectionHeader alignment:1];
  v65 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  v66 = +[NSCollectionLayoutDimension estimatedDimension:a5];
  v67 = +[NSCollectionLayoutSize sizeWithWidthDimension:v65 heightDimension:v66];

  v68 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v67 elementKind:UICollectionElementKindSectionFooter alignment:5];
  v78[0] = v64;
  v78[1] = v68;
  v69 = [v34[501] arrayWithObjects:v78 count:2];
  [v32 setBoundarySupplementaryItems:v69];

  [v32 setSupplementariesFollowContentInsets:0];
  if (!v32)
  {
    v70 = sub_100576A04();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v77 = v73;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "The Section is nil in this class - %@.", buf, 0xCu);
    }
  }

  return v32;
}

- (UITraitEnvironment)traitEnvironment
{
  return self->_traitEnvironment;
}

- (void)setTraitEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
}

@end