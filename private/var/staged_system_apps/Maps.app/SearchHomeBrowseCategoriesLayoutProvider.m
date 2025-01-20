@interface SearchHomeBrowseCategoriesLayoutProvider
- (BOOL)searchAlongRoute;
- (BOOL)supportsFullTextSearch;
- (SearchHomeBrowseCategoriesLayoutProvider)initWithSearchAlongRoute:(BOOL)a3 supportsFullTextSearch:(BOOL)a4;
- (SearchHomeBrowseCategoryCellSizeController)sizeController;
- (id)cellClasses;
- (id)cellForRowAtIndexPath:(id)a3 collectionView:(id)a4 item:(id)a5;
- (id)cellForRowAtIndexPath:(id)a3 tableview:(id)a4 item:(id)a5;
- (id)cellReuseIdentifier;
- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 collectionViewWidth:(double)a7 wantsOneColumnLayout:(BOOL)a8 browseCategoriesTitles:(id)a9 objectsCount:(unint64_t)a10 mapsTheme:(id)a11;
- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8;
- (int64_t)type;
- (void)setSearchAlongRoute:(BOOL)a3;
- (void)setSizeController:(id)a3;
- (void)setSupportsFullTextSearch:(BOOL)a3;
@end

@implementation SearchHomeBrowseCategoriesLayoutProvider

- (SearchHomeBrowseCategoriesLayoutProvider)initWithSearchAlongRoute:(BOOL)a3 supportsFullTextSearch:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchHomeBrowseCategoriesLayoutProvider;
  v6 = [(SearchHomeBrowseCategoriesLayoutProvider *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(SearchHomeBrowseCategoriesLayoutProvider *)v6 setSearchAlongRoute:v5];
    [(SearchHomeBrowseCategoriesLayoutProvider *)v7 setSupportsFullTextSearch:v4];
  }
  return v7;
}

- (id)cellClasses
{
  uint64_t v4 = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (id)cellReuseIdentifier
{
  return +[SearchHomeBrowseCategoryCollectionViewCell identifier];
}

- (int64_t)type
{
  return 2;
}

- (id)cellForRowAtIndexPath:(id)a3 collectionView:(id)a4 item:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(SearchHomeBrowseCategoriesLayoutProvider *)self cellReuseIdentifier];
  v12 = [v9 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v10];

  v13 = [(SearchHomeBrowseCategoriesLayoutProvider *)self cellReuseIdentifier];
  [v12 setAccessibilityIdentifier:v13];

  v14 = [(SearchHomeBrowseCategoriesLayoutProvider *)self sizeController];
  [v12 setSizeController:v14];

  v15 = [v8 name];
  [v12 setTitle:v15];

  v16 = +[NSUUID UUID];
  [v12 setUpdateIdentifier:v16];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10080B0A8;
  v25[3] = &unk_1012F4C10;
  id v26 = v16;
  id v17 = v12;
  id v27 = v17;
  id v18 = v16;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10080B134;
  v23[3] = &unk_1012E60A0;
  v24 = objc_retainBlock(v25);
  v19 = v24;
  [v8 imageWithResultHandler:v23];

  id v20 = v24;
  id v21 = v17;

  return v21;
}

- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8
{
  return [(SearchHomeBrowseCategoriesLayoutProvider *)self layoutSectionWithLayoutEnvironment:a3 estimatedHeaderHeight:a6 estimatedFooterHeight:0 deletionBlock:&__NSArray0__struct collectionViewWidth:0 wantsOneColumnLayout:a8 browseCategoriesTitles:a4 objectsCount:a5 mapsTheme:0.0];
}

- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 collectionViewWidth:(double)a7 wantsOneColumnLayout:(BOOL)a8 browseCategoriesTitles:(id)a9 objectsCount:(unint64_t)a10 mapsTheme:(id)a11
{
  BOOL v14 = a8;
  id v18 = a3;
  id v19 = a9;
  id v20 = a11;
  id v21 = [SearchHomeBrowseCategoryCellSizeController alloc];
  v22 = [v18 traitCollection];
  v23 = [(SearchHomeBrowseCategoryCellSizeController *)v21 initWithStrings:v19 traitCollection:v22 availableWidth:v14 wantsOneColumnLayout:[(SearchHomeBrowseCategoriesLayoutProvider *)self searchAlongRoute] isSearchAlongRoute:self->_supportsFullTextSearch supportsFullTextSearch:a7];
  [(SearchHomeBrowseCategoriesLayoutProvider *)self setSizeController:v23];

  v24 = +[UIDevice currentDevice];
  id v25 = [v24 userInterfaceIdiom];

  if (v25 == (id)5)
  {
    id v117 = v19;
    id v26 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
    id v27 = +[NSCollectionLayoutDimension fractionalHeightDimension:1.0];
    uint64_t v28 = +[NSCollectionLayoutSize sizeWithWidthDimension:v26 heightDimension:v27];

    id v118 = (id)v28;
    id v29 = +[NSCollectionLayoutItem itemWithLayoutSize:v28];
    v30 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
    v31 = +[NSCollectionLayoutDimension estimatedDimension:36.0];
    v32 = +[NSCollectionLayoutSize sizeWithWidthDimension:v30 heightDimension:v31];

    id v125 = v29;
    v33 = +[NSArray arrayWithObjects:&v125 count:1];
    uint64_t v34 = +[NSCollectionLayoutGroup verticalGroupWithLayoutSize:v32 subitems:v33];

    v113 = (void *)v34;
    id v35 = +[NSCollectionLayoutSection sectionWithGroup:v34];
    [v35 setInterGroupSpacing:3.0];
    v36 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
    v37 = +[NSCollectionLayoutDimension estimatedDimension:a4];
    v38 = +[NSCollectionLayoutSize sizeWithWidthDimension:v36 heightDimension:v37];

    v39 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v38 elementKind:UICollectionElementKindSectionHeader alignment:1];
    v124 = v39;
    v40 = +[NSArray arrayWithObjects:&v124 count:1];
    [v35 setBoundarySupplementaryItems:v40];

    [v35 setSupplementariesFollowContentInsets:0];
    if (!v35)
    {
      v41 = sub_100576A04();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v123 = self;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "The Section is nil in this class - %@ in Catalyst App", buf, 0xCu);
      }
    }
LABEL_27:
    v93 = v113;
LABEL_28:

    id v19 = v117;
    goto LABEL_29;
  }
  v42 = [(SearchHomeBrowseCategoriesLayoutProvider *)self sizeController];
  id v43 = [v42 numberOfColumns];

  if (v43 != (id)1)
  {
    id v114 = v20;
    id v115 = v18;
    v53 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
    v54 = +[NSCollectionLayoutDimension fractionalWidthDimension:0.5];
    uint64_t v55 = +[NSCollectionLayoutSize sizeWithWidthDimension:v53 heightDimension:v54];

    id v118 = (id)v55;
    id v29 = +[NSCollectionLayoutItem itemWithLayoutSize:v55];
    v56 = [(SearchHomeBrowseCategoriesLayoutProvider *)self sizeController];
    v57 = [v56 titleLabelFont];
    [v57 lineHeight];
    double v59 = v58;
    v60 = [(SearchHomeBrowseCategoriesLayoutProvider *)self sizeController];
    [v60 labelTopAndBottomPadding];
    double v62 = v59 + v61 * 2.0;

    v63 = [(SearchHomeBrowseCategoriesLayoutProvider *)self sizeController];
    double v64 = v62 * (double)(unint64_t)[v63 numberOfRows] + 4.0;

    v32 = +[NSMutableArray array];
    v65 = [(SearchHomeBrowseCategoriesLayoutProvider *)self sizeController];
    id v66 = [v65 numberOfColumns];

    id v117 = v19;
    if (v66)
    {
      unint64_t v67 = 0;
      double v68 = 0.0;
      do
      {
        v69 = [(SearchHomeBrowseCategoriesLayoutProvider *)self sizeController];
        v70 = [v69 columnWidths];
        v71 = [v70 objectAtIndexedSubscript:v67];
        [v71 floatValue];
        double v73 = v72;

        v74 = +[NSCollectionLayoutDimension estimatedDimension:v73];
        v75 = +[NSCollectionLayoutDimension estimatedDimension:v64];
        v76 = +[NSCollectionLayoutSize sizeWithWidthDimension:v74 heightDimension:v75];

        v77 = [(SearchHomeBrowseCategoriesLayoutProvider *)self sizeController];
        v78 = +[NSCollectionLayoutGroup verticalGroupWithLayoutSize:subitem:count:](NSCollectionLayoutGroup, "verticalGroupWithLayoutSize:subitem:count:", v76, v29, [v77 numberOfRows]);

        [v32 addObject:v78];
        double v68 = v68 + v73;

        ++v67;
        v79 = [(SearchHomeBrowseCategoriesLayoutProvider *)self sizeController];
        id v80 = [v79 numberOfColumns];
      }
      while (v67 < (unint64_t)v80);
    }
    else
    {
      double v68 = 0.0;
    }
    v95 = [(SearchHomeBrowseCategoriesLayoutProvider *)self sizeController];
    [v95 paddingBetweenCells];
    double v97 = v96;
    v98 = [(SearchHomeBrowseCategoriesLayoutProvider *)self sizeController];
    double v99 = v68 + v97 * (double)((unint64_t)[v98 numberOfColumns] - 1);

    v100 = +[NSCollectionLayoutDimension estimatedDimension:v99];
    v101 = +[NSCollectionLayoutDimension estimatedDimension:v64];
    uint64_t v102 = +[NSCollectionLayoutSize sizeWithWidthDimension:v100 heightDimension:v101];

    id v103 = [v32 copy];
    v113 = (void *)v102;
    v38 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v102 subitems:v103];

    v104 = [(SearchHomeBrowseCategoriesLayoutProvider *)self sizeController];
    [v104 paddingBetweenCells];
    v105 = +[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:");
    [v38 setInterItemSpacing:v105];

    id v35 = +[NSCollectionLayoutSection sectionWithGroup:v38];
    [v35 setContentInsets:4.0, 16.0, 0.0, 16.0];
    [v35 setOrthogonalScrollingBehavior:1];
    v106 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
    v107 = +[NSCollectionLayoutDimension estimatedDimension:a4];
    v108 = +[NSCollectionLayoutSize sizeWithWidthDimension:v106 heightDimension:v107];

    v109 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v108 elementKind:UICollectionElementKindSectionHeader alignment:1];
    v120 = v109;
    v110 = +[NSArray arrayWithObjects:&v120 count:1];
    [v35 setBoundarySupplementaryItems:v110];

    [v35 setSupplementariesFollowContentInsets:0];
    id v20 = v114;
    id v18 = v115;
    if (!v35)
    {
      v111 = sub_100576A04();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v123 = self;
        _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_INFO, "The Section is nil in this class - %@ for multiple columns", buf, 0xCu);
      }
    }
    goto LABEL_27;
  }
  id v118 = [objc_alloc((Class)_UICollectionViewListLayoutSectionConfiguration) initWithAppearanceStyle:0 layoutEnvironment:v18];
  [v118 setSeparatorStyle:1];
  unsigned int v44 = [(SearchHomeBrowseCategoriesLayoutProvider *)self searchAlongRoute];
  v45 = [(SearchHomeBrowseCategoriesLayoutProvider *)self sizeController];
  v46 = [v45 titleLabelFont];
  [v46 lineHeight];
  double v48 = v47;
  v49 = [(SearchHomeBrowseCategoriesLayoutProvider *)self sizeController];
  [v49 labelTopAndBottomPadding];
  double v51 = v48 + v50 * 2.0;
  if (v44) {
    double v52 = 68.0;
  }
  else {
    double v52 = 58.0;
  }
  double v81 = v52;
  if (v51 >= v52)
  {
    v82 = [(SearchHomeBrowseCategoriesLayoutProvider *)self sizeController];
    [v82 titleLabelFont];
    unint64_t v116 = a10;
    v84 = id v83 = v20;
    [v84 lineHeight];
    double v86 = v85;
    v87 = [(SearchHomeBrowseCategoriesLayoutProvider *)self sizeController];
    [v87 labelTopAndBottomPadding];
    double v81 = v86 + v88 * 2.0;

    id v20 = v83;
    a10 = v116;
  }
  [v118 setRowHeight:v81];
  v119[0] = _NSConcreteStackBlock;
  v119[1] = 3221225472;
  v119[2] = sub_10080BD68;
  v119[3] = &unk_1012E7240;
  v119[4] = a10;
  [v118 setSeparatorInsetProvider:v119];
  [v118 setHeaderTopPadding:0.0];
  v89 = [v118 _separatorConfiguration];
  id v29 = [v89 copy];

  v90 = [v20 dynamicHairlineColor];
  [v29 _setColor:v90];

  [v118 _setSeparatorConfiguration:v29];
  id v35 = [objc_alloc((Class)_UICollectionViewListLayoutSection) initWithConfiguration:v118 layoutEnvironment:v18];
  v91 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  v92 = +[NSCollectionLayoutDimension estimatedDimension:a4];
  v32 = +[NSCollectionLayoutSize sizeWithWidthDimension:v91 heightDimension:v92];

  v93 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v32 elementKind:UICollectionElementKindSectionHeader alignment:1];
  v121 = v93;
  v94 = +[NSArray arrayWithObjects:&v121 count:1];
  [v35 setBoundarySupplementaryItems:v94];

  if (!v35)
  {
    id v117 = v19;
    v38 = sub_100576A04();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v123 = self;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "The Section is nil in this class - %@ single column.", buf, 0xCu);
    }
    id v35 = 0;
    goto LABEL_28;
  }
LABEL_29:

  return v35;
}

- (id)cellForRowAtIndexPath:(id)a3 tableview:(id)a4 item:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v8 = +[BrowseCategoryTableViewCell identifier];
  id v9 = [v7 dequeueReusableCellWithIdentifier:v8];

  id v10 = v6;
  v11 = +[NSUUID UUID];
  v12 = [v11 UUIDString];

  v13 = [v10 name];
  [v9 updateContents:v13 uniqueID:v12];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10080BF34;
  v19[3] = &unk_1012F4C10;
  id v14 = v9;
  id v20 = v14;
  id v21 = v12;
  id v15 = v12;
  [v10 imageWithResultHandler:v19];

  v16 = v21;
  id v17 = v14;

  return v17;
}

- (SearchHomeBrowseCategoryCellSizeController)sizeController
{
  return self->_sizeController;
}

- (void)setSizeController:(id)a3
{
}

- (BOOL)searchAlongRoute
{
  return self->_searchAlongRoute;
}

- (void)setSearchAlongRoute:(BOOL)a3
{
  self->_searchAlongRoute = a3;
}

- (BOOL)supportsFullTextSearch
{
  return self->_supportsFullTextSearch;
}

- (void)setSupportsFullTextSearch:(BOOL)a3
{
  self->_supportsFullTextSearch = a3;
}

- (void).cxx_destruct
{
}

@end