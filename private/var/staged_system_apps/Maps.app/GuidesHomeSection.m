@interface GuidesHomeSection
+ (double)loadingSectionHeight;
- ($F604286BD1E4CBBF10F21E9B2637A591)configuration;
- (CollectionsFilterSizeController)filtersSizeController;
- (GuidesHomeSection)initWithSectionKind:(int64_t)a3 usingMaxWidth:(double)a4 usingTraitEnvironment:(id)a5 count:(unint64_t)a6;
- (MKPlaceCollectionsSizeController)collectionsSizeController;
- (MKPlaceCompactCollectionSizeController)compactCollectionsSizeController;
- (NSString)actionButtonTitle;
- (NSString)sectionTitle;
- (NSUUID)sectionIdentifier;
- (double)maxWidth;
- (id)actionHandler;
- (id)description;
- (id)headerItem;
- (id)layoutForCollectionsListSectionUsingLayoutEnvironment:(id)a3 shouldAddSupplementaryHeaderView:(BOOL)a4 objectsCount:(unint64_t)a5;
- (id)layoutForFilterSectionUsingViewModels:(id)a3 traitsEnvironment:(id)a4 width:(double)a5 shouldAddSupplementaryHeaderView:(BOOL)a6;
- (id)layoutForPublishersListSectionUsingLayoutEnvironment:(id)a3 shouldAddSupplementaryHeaderView:(BOOL)a4 objectsCount:(unint64_t)a5;
- (id)layoutForSectionUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4 shouldAddSupplementaryHeaderView:(BOOL)a5;
- (id)layoutSectionForCompactCollectionsUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4 shouldAddSupplementaryHeaderView:(BOOL)a5;
- (id)layoutSectionForCuratedCollectionsListUsingLayoutEnvironment:(id)a3 shouldAddSupplementaryHeaderView:(BOOL)a4 objectsCount:(unint64_t)a5;
- (id)layoutSectionForCuratedCollectionsUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4 shouldAddSupplementaryHeaderView:(BOOL)a5;
- (id)layoutSectionForFeaturedGuideUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4 featuredGuideTitle:(id)a5;
- (id)layoutSectionForFiltersUsingFilters:(id)a3 traitsEnvironment:(id)a4 width:(double)a5 shouldAddSupplementaryHeaderView:(BOOL)a6;
- (id)layoutSectionForLoadingUsingTraitEnvironment:(id)a3;
- (int64_t)contentType;
- (int64_t)kind;
- (unint64_t)count;
- (void)setActionButtonTitle:(id)a3;
- (void)setActionHandler:(id)a3;
- (void)setCollectionsSizeController:(id)a3;
- (void)setCompactCollectionsSizeController:(id)a3;
- (void)setConfiguration:(id *)a3;
- (void)setContentType:(int64_t)a3;
- (void)setCount:(unint64_t)a3;
- (void)setFiltersSizeController:(id)a3;
- (void)setMaxWidth:(double)a3;
- (void)setSectionTitle:(id)a3;
- (void)setupConfiguration;
@end

@implementation GuidesHomeSection

- (GuidesHomeSection)initWithSectionKind:(int64_t)a3 usingMaxWidth:(double)a4 usingTraitEnvironment:(id)a5 count:(unint64_t)a6
{
  v14.receiver = self;
  v14.super_class = (Class)GuidesHomeSection;
  v9 = [(GuidesHomeSection *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_kind = a3;
    v9->_maxWidth = a4;
    uint64_t v11 = +[NSUUID UUID];
    sectionIdentifier = v10->_sectionIdentifier;
    v10->_sectionIdentifier = (NSUUID *)v11;

    v10->_count = a6;
    v10->_contentType = 0;
    [(GuidesHomeSection *)v10 setupConfiguration];
  }
  return v10;
}

- (id)layoutSectionForFeaturedGuideUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4 featuredGuideTitle:(id)a5
{
  +[GuideHomeHeaderView maximumRequiredHeightWithFeaturedGuideTitle:maxWidth:](GuideHomeHeaderView, "maximumRequiredHeightWithFeaturedGuideTitle:maxWidth:", a5);
  double v7 = v6;
  v8 = +[NSCollectionLayoutDimension absoluteDimension:a4];
  v9 = +[NSCollectionLayoutDimension absoluteDimension:v7];
  v10 = +[NSCollectionLayoutSize sizeWithWidthDimension:v8 heightDimension:v9];

  uint64_t v11 = +[NSCollectionLayoutItem itemWithLayoutSize:v10];
  v12 = +[NSCollectionLayoutDimension estimatedDimension:v7];
  v13 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  objc_super v14 = +[NSCollectionLayoutSize sizeWithWidthDimension:v13 heightDimension:v12];

  v15 = +[NSCollectionLayoutGroup verticalGroupWithLayoutSize:v14 subitem:v11 count:1];
  v16 = +[NSCollectionLayoutSection sectionWithGroup:v15];
  [v16 setContentInsets:NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing];

  return v16;
}

- (id)layoutSectionForFiltersUsingFilters:(id)a3 traitsEnvironment:(id)a4 width:(double)a5 shouldAddSupplementaryHeaderView:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [[CollectionsFilterSizeController alloc] initWithCollectionsFilterDisplayStyle:0 inContext:2];
  filtersSizeController = self->_filtersSizeController;
  self->_filtersSizeController = v11;

  v13 = [(GuidesHomeSection *)self filtersSizeController];
  [v13 insetForFilterAtIndex:0];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  uint64_t v44 = 0;
  v45 = (double *)&v44;
  uint64_t v46 = 0x2020000000;
  uint64_t v47 = 0;
  v37 = _NSConcreteStackBlock;
  uint64_t v38 = 3221225472;
  v39 = sub_100C0497C;
  v40 = &unk_10131B588;
  v41 = self;
  v43 = &v44;
  id v22 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v9, "count"));
  id v42 = v22;
  [v9 enumerateObjectsUsingBlock:&v37];
  id v23 = [v22 count:v37, v38, v39, v40, v41];
  [(CollectionsFilterSizeController *)self->_filtersSizeController minimumLineSpacingForSectionAtIndex:0];
  v45[3] = v45[3] + (double)((unint64_t)v23 - 1) * v24;
  v25 = +[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:");
  [(CollectionsFilterSizeController *)self->_filtersSizeController defaultHeight];
  v26 = +[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:");
  v27 = +[NSCollectionLayoutSize sizeWithWidthDimension:v25 heightDimension:v26];

  v28 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v27 subitems:v22];
  [(CollectionsFilterSizeController *)self->_filtersSizeController minimumInterItemSpacingForSectionAtIndex:0];
  v29 = +[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:");
  [v28 setInterItemSpacing:v29];

  v30 = +[NSCollectionLayoutSection sectionWithGroup:v28];
  [v30 setContentInsets:v15, v17, v19, v21];
  [v30 setOrthogonalScrollingBehavior:1];
  if (v6)
  {
    v31 = [(GuidesHomeSection *)self headerItem];
    [v31 setContentInsets:-8.0, 16.0, -8.0, 16.0];
    [v30 setSupplementariesFollowContentInsets:0];
    v49 = v31;
    v32 = +[NSArray arrayWithObjects:&v49 count:1];
    [v30 setBoundarySupplementaryItems:v32];
  }
  v33 = +[GuidesSectionBackground decorationViewKind];
  v34 = +[NSCollectionLayoutDecorationItem backgroundDecorationItemWithElementKind:v33];

  v48 = v34;
  v35 = +[NSArray arrayWithObjects:&v48 count:1];
  [v30 setDecorationItems:v35];

  _Block_object_dispose(&v44, 8);

  return v30;
}

- (id)layoutSectionForCompactCollectionsUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4 shouldAddSupplementaryHeaderView:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [objc_alloc((Class)MKPlaceCompactCollectionSizeController) initWithCollectionsConfiguration:1 usingTraitCollections:1 inContext:v8];

  compactCollectionsSizeController = self->_compactCollectionsSizeController;
  self->_compactCollectionsSizeController = v9;

  uint64_t v11 = [(GuidesHomeSection *)self compactCollectionsSizeController];
  [v11 sizeForCollectionWithMaxCollectionsWidth:a4];
  double v13 = v12;
  double v15 = v14;

  double v16 = [(GuidesHomeSection *)self compactCollectionsSizeController];
  [v16 sectionInsets];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = (double)[(GuidesHomeSection *)self count];
  v26 = [(GuidesHomeSection *)self compactCollectionsSizeController];
  [v26 minimumInterItemSpacing];
  double v28 = v27 * (double)([(GuidesHomeSection *)self count] - 1) + v13 * v25;

  v29 = +[NSCollectionLayoutDimension absoluteDimension:v13];
  v30 = +[NSCollectionLayoutDimension absoluteDimension:v15];
  v31 = +[NSCollectionLayoutSize sizeWithWidthDimension:v29 heightDimension:v30];

  v32 = +[NSCollectionLayoutItem itemWithLayoutSize:v31];
  v33 = +[NSCollectionLayoutDimension estimatedDimension:200.0];
  v34 = +[NSCollectionLayoutDimension absoluteDimension:v28];
  v35 = +[NSCollectionLayoutSize sizeWithWidthDimension:v34 heightDimension:v33];

  v36 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v35 subitem:v32 count:[(GuidesHomeSection *)self count]];
  v37 = [(GuidesHomeSection *)self compactCollectionsSizeController];
  [v37 minimumInterItemSpacing];
  uint64_t v38 = +[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:");
  [v36 setInterItemSpacing:v38];

  v39 = +[NSCollectionLayoutSection sectionWithGroup:v36];
  [v39 setOrthogonalScrollingBehavior:1];
  v40 = [(GuidesHomeSection *)self compactCollectionsSizeController];
  [v40 minimumInterItemSpacing];
  [v39 setInterGroupSpacing:];

  [v39 setContentInsets:v18, v20, v22, v24];
  if (v5)
  {
    v41 = [(GuidesHomeSection *)self headerItem];
    [v41 setContentInsets:0.0, 16.0, 0.0, 16.0];
    [v39 setSupplementariesFollowContentInsets:0];
    v48 = v41;
    id v42 = +[NSArray arrayWithObjects:&v48 count:1];
    [v39 setBoundarySupplementaryItems:v42];
  }
  v43 = +[CompactGuidesSectionBackground decorationViewKind];
  uint64_t v44 = +[NSCollectionLayoutDecorationItem backgroundDecorationItemWithElementKind:v43];

  uint64_t v47 = v44;
  v45 = +[NSArray arrayWithObjects:&v47 count:1];
  [v39 setDecorationItems:v45];

  return v39;
}

- (id)layoutSectionForCuratedCollectionsUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4 shouldAddSupplementaryHeaderView:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [objc_alloc((Class)MKPlaceCollectionsSizeController) initWithCollectionsConfiguration:0 isSingleCollection:1 usingTraitCollections:[GuidesHomeSection count](self, "count") == 1 inContext:v8];

  [(GuidesHomeSection *)self setCollectionsSizeController:v9];
  id v10 = [(GuidesHomeSection *)self collectionsSizeController];
  [v10 sizeForCollectionWithMaxCollectionsWidth:a4];
  double v12 = v11;
  double v14 = v13;

  double v15 = [(GuidesHomeSection *)self collectionsSizeController];
  [v15 sectionInsets];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = (double)[(GuidesHomeSection *)self count];
  double v25 = [(GuidesHomeSection *)self collectionsSizeController];
  [v25 minimumInterItemSpacing];
  double v27 = v26 * (double)([(GuidesHomeSection *)self count] - 1) + v12 * v24;

  double v28 = +[NSCollectionLayoutDimension absoluteDimension:v12];
  v29 = +[NSCollectionLayoutDimension absoluteDimension:v14];
  v30 = +[NSCollectionLayoutSize sizeWithWidthDimension:v28 heightDimension:v29];

  v31 = +[NSCollectionLayoutItem itemWithLayoutSize:v30];
  v32 = +[NSCollectionLayoutDimension estimatedDimension:v14];
  v33 = +[NSCollectionLayoutDimension absoluteDimension:v27];
  v34 = +[NSCollectionLayoutSize sizeWithWidthDimension:v33 heightDimension:v32];

  v45 = v31;
  v35 = +[NSArray arrayWithObjects:&v45 count:1];
  v36 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v34 subitems:v35];

  v37 = [(GuidesHomeSection *)self collectionsSizeController];
  [v37 minimumInterItemSpacing];
  uint64_t v38 = +[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:");
  [v36 setInterItemSpacing:v38];

  v39 = +[NSCollectionLayoutSection sectionWithGroup:v36];
  [v39 setOrthogonalScrollingBehavior:1];
  v40 = [(GuidesHomeSection *)self collectionsSizeController];
  [v40 minimumInterItemSpacing];
  [v39 setInterGroupSpacing:];

  [v39 setContentInsets:v17, v19, v21, v23];
  if (v5)
  {
    v41 = [(GuidesHomeSection *)self headerItem];
    [v41 setContentInsets:-8.0, 16.0, -8.0, 16.0];
    [v39 setSupplementariesFollowContentInsets:0];
    uint64_t v44 = v41;
    id v42 = +[NSArray arrayWithObjects:&v44 count:1];
    [v39 setBoundarySupplementaryItems:v42];
  }

  return v39;
}

- (id)layoutSectionForCuratedCollectionsListUsingLayoutEnvironment:(id)a3 shouldAddSupplementaryHeaderView:(BOOL)a4 objectsCount:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)_UICollectionViewListLayoutSectionConfiguration) initWithAppearanceStyle:v6 layoutEnvironment:v8];
  id v10 = [v8 traitCollection];
  BOOL v11 = [v10 userInterfaceIdiom] != (id)5;

  [v9 setSeparatorStyle:v11];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100C05464;
  v18[3] = &unk_1012E7240;
  v18[4] = a5;
  [v9 setSeparatorInsetProvider:v18];
  [v9 setHeaderTopPadding:0.0];
  double v12 = [v9 _separatorConfiguration];
  id v13 = [v12 copy];

  [v9 _setSeparatorConfiguration:v13];
  id v14 = [objc_alloc((Class)_UICollectionViewListLayoutSection) initWithConfiguration:v9 layoutEnvironment:v8];
  [v14 setContentInsets:0.0, 16.0, 0.0, 0.0];
  if ((id)[(GuidesHomeSection *)self kind] == (id)4 && v6)
  {
    double v15 = [(GuidesHomeSection *)self headerItem];
    double v19 = v15;
    double v16 = +[NSArray arrayWithObjects:&v19 count:1];
    [v14 setBoundarySupplementaryItems:v16];
  }

  return v14;
}

+ (double)loadingSectionHeight
{
  return 100.0;
}

- (id)layoutSectionForLoadingUsingTraitEnvironment:(id)a3
{
  v3 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeight:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeight:", a3, 1.0, 1.0);
  v4 = +[NSCollectionLayoutItem itemWithLayoutSize:v3];
  [v4 setContentInsets:NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing];
  [(id)objc_opt_class() loadingSectionHeight];
  BOOL v5 = +[NSCollectionLayoutDimension estimatedDimension:](NSCollectionLayoutDimension, "estimatedDimension:");
  BOOL v6 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  double v7 = +[NSCollectionLayoutSize sizeWithWidthDimension:v6 heightDimension:v5];

  double v12 = v4;
  id v8 = +[NSArray arrayWithObjects:&v12 count:1];
  id v9 = +[NSCollectionLayoutGroup verticalGroupWithLayoutSize:v7 subitems:v8];

  id v10 = +[NSCollectionLayoutSection sectionWithGroup:v9];

  return v10;
}

- (id)layoutForPublishersListSectionUsingLayoutEnvironment:(id)a3 shouldAddSupplementaryHeaderView:(BOOL)a4 objectsCount:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)_UICollectionViewListLayoutSectionConfiguration) initWithAppearanceStyle:v6 layoutEnvironment:v8];
  id v10 = [v8 traitCollection];
  BOOL v11 = [v10 userInterfaceIdiom] != (id)5;

  [v9 setSeparatorStyle:v11];
  +[TwoLineCollectionViewListCell estimatedCellHeight];
  [v9 setEstimatedRowHeight:];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100C05874;
  v18[3] = &unk_1012E7240;
  v18[4] = a5;
  [v9 setSeparatorInsetProvider:v18];
  [v9 setHeaderTopPadding:16.0];
  [v9 setSectionHeaderHeight:_UICollectionViewListLayoutSectionAutomaticDimension];
  double v12 = [v9 _separatorConfiguration];
  id v13 = [v12 copy];

  [v9 _setSeparatorConfiguration:v13];
  id v14 = [objc_alloc((Class)_UICollectionViewListLayoutSection) initWithConfiguration:v9 layoutEnvironment:v8];
  [v14 setContentInsets:0.0, 16.0, 0.0, 0.0];
  if (v6)
  {
    double v15 = [(GuidesHomeSection *)self headerItem];
    double v19 = v15;
    double v16 = +[NSArray arrayWithObjects:&v19 count:1];
    [v14 setBoundarySupplementaryItems:v16];
  }

  return v14;
}

- (id)headerItem
{
  uint64_t v3 = [(GuidesHomeSection *)self sectionTitle];
  if (v3 && (v4 = (void *)v3, [(GuidesHomeSection *)self maxWidth], double v6 = v5, v4, v6 > 0.0))
  {
    double v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle3];
    id v8 = [v7 _mapkit_fontWithWeight:UIFontWeightSemibold];

    NSAttributedStringKey v21 = NSFontAttributeName;
    double v22 = v8;
    id v9 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v10 = objc_alloc((Class)NSAttributedString);
    BOOL v11 = [(GuidesHomeSection *)self sectionTitle];
    id v12 = [v10 initWithString:v11 attributes:v9];

    [(GuidesHomeSection *)self maxWidth];
    [v12 boundingRectWithSize:1 options:0];
    if (v13 >= 40.0) {
      double v14 = v13;
    }
    else {
      double v14 = 40.0;
    }
  }
  else
  {
    double v14 = 40.0;
  }
  double v15 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  double v16 = +[NSCollectionLayoutDimension absoluteDimension:v14];
  double v17 = +[NSCollectionLayoutSize sizeWithWidthDimension:v15 heightDimension:v16];

  double v18 = +[GuidesGenericSectionHeader reuseIdentifier];
  double v19 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v17 elementKind:v18 alignment:1];

  return v19;
}

- (void)setupConfiguration
{
  unint64_t v3 = [(GuidesHomeSection *)self kind];
  if (v3 > 7)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = (uint64_t)*(&off_10131B5A8 + v3);
    uint64_t v4 = qword_100F73910[v3];
    uint64_t v5 = qword_100F73950[v3];
  }
  v7[0] = 1;
  v7[1] = v6;
  v7[2] = v4;
  v7[3] = v5;
  if (self) {
    [(GuidesHomeSection *)self setConfiguration:v7];
  }
}

- (id)layoutForSectionUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4 shouldAddSupplementaryHeaderView:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  int64_t v9 = [(GuidesHomeSection *)self kind];
  switch(v9)
  {
    case 7:
      uint64_t v10 = [(GuidesHomeSection *)self layoutSectionForLoadingUsingTraitEnvironment:v8];
      goto LABEL_7;
    case 3:
      uint64_t v10 = [(GuidesHomeSection *)self layoutSectionForCuratedCollectionsUsingTraitsEnvironment:v8 usingWidth:v5 shouldAddSupplementaryHeaderView:a4];
      goto LABEL_7;
    case 2:
      uint64_t v10 = [(GuidesHomeSection *)self layoutSectionForCompactCollectionsUsingTraitsEnvironment:v8 usingWidth:v5 shouldAddSupplementaryHeaderView:a4];
LABEL_7:
      BOOL v11 = (void *)v10;
      goto LABEL_9;
  }
  BOOL v11 = 0;
LABEL_9:

  return v11;
}

- (id)layoutForFilterSectionUsingViewModels:(id)a3 traitsEnvironment:(id)a4 width:(double)a5 shouldAddSupplementaryHeaderView:(BOOL)a6
{
  return [(GuidesHomeSection *)self layoutSectionForFiltersUsingFilters:a3 traitsEnvironment:a4 width:a6 shouldAddSupplementaryHeaderView:a5];
}

- (id)layoutForCollectionsListSectionUsingLayoutEnvironment:(id)a3 shouldAddSupplementaryHeaderView:(BOOL)a4 objectsCount:(unint64_t)a5
{
  return [(GuidesHomeSection *)self layoutSectionForCuratedCollectionsListUsingLayoutEnvironment:a3 shouldAddSupplementaryHeaderView:a4 objectsCount:a5];
}

- (id)description
{
  [(GuidesHomeSection *)self configuration];
  unint64_t v3 = [(GuidesHomeSection *)self count];
  uint64_t v4 = [(GuidesHomeSection *)self sectionTitle];
  BOOL v5 = +[NSString stringWithFormat:@"Section: (%@). Items: (%lu). Title: (%@)", v7, v3, v4];

  return v5;
}

- (int64_t)kind
{
  return self->_kind;
}

- ($F604286BD1E4CBBF10F21E9B2637A591)configuration
{
  sectionIdentifier = self->_configuration.sectionIdentifier;
  retstr->var0 = self->_configuration.rowCount;
  result = sectionIdentifier;
  retstr->var1 = result;
  *(_OWORD *)&retstr->var2 = *(_OWORD *)&self->_configuration.cellKind;
  return result;
}

- (void)setConfiguration:(id *)a3
{
  self->_configuration.rowCount = a3->var0;
  var1 = (NSString *)a3->var1;
  a3->var1 = 0;
  sectionIdentifier = self->_configuration.sectionIdentifier;
  self->_configuration.sectionIdentifier = var1;

  *(_OWORD *)&self->_configuration.cellKind = *(_OWORD *)&a3->var2;
}

- (NSUUID)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
}

- (NSString)actionButtonTitle
{
  return self->_actionButtonTitle;
}

- (void)setActionButtonTitle:(id)a3
{
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(int64_t)a3
{
  self->_contentType = a3;
}

- (MKPlaceCollectionsSizeController)collectionsSizeController
{
  return self->_collectionsSizeController;
}

- (void)setCollectionsSizeController:(id)a3
{
}

- (MKPlaceCompactCollectionSizeController)compactCollectionsSizeController
{
  return self->_compactCollectionsSizeController;
}

- (void)setCompactCollectionsSizeController:(id)a3
{
}

- (CollectionsFilterSizeController)filtersSizeController
{
  return self->_filtersSizeController;
}

- (void)setFiltersSizeController:(id)a3
{
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filtersSizeController, 0);
  objc_storeStrong((id *)&self->_compactCollectionsSizeController, 0);
  objc_storeStrong((id *)&self->_collectionsSizeController, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_actionButtonTitle, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);

  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
}

@end