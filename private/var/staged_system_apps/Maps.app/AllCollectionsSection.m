@interface AllCollectionsSection
- ($F604286BD1E4CBBF10F21E9B2637A591)configuration;
- (AllCollectionsSection)initWithSectionIndex:(int64_t)a3 usingMaxWidth:(double)a4 usingTraitEnvironment:(id)a5;
- (CollectionsFilterSizeController)filtersSizeController;
- (MKPlaceCollectionsSizeController)collectionsSizeController;
- (id)layoutForSectionUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4;
- (id)layoutSectionForCollectionsUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4;
- (id)layoutSectionForLoadingUsingTraitEnvironment:(id)a3;
- (int64_t)kind;
- (void)setCollectionsSizeController:(id)a3;
- (void)setConfiguration:(id *)a3;
- (void)setFiltersSizeController:(id)a3;
- (void)setKind:(int64_t)a3;
- (void)setupConfiguration;
@end

@implementation AllCollectionsSection

- (AllCollectionsSection)initWithSectionIndex:(int64_t)a3 usingMaxWidth:(double)a4 usingTraitEnvironment:(id)a5
{
  id v7 = a5;
  v16.receiver = self;
  v16.super_class = (Class)AllCollectionsSection;
  v8 = [(AllCollectionsSection *)&v16 init];
  v9 = v8;
  if (v8)
  {
    if ((unint64_t)a3 > 1)
    {
      v14 = 0;
      goto LABEL_6;
    }
    v8->_kind = a3;
    [(AllCollectionsSection *)v8 setupConfiguration];
    v10 = (MKPlaceCollectionsSizeController *)[objc_alloc((Class)MKPlaceCollectionsSizeController) initWithDefaultCollectionsConfigurationUsingTraitCollections:v7 inContext:5];
    collectionsSizeController = v9->_collectionsSizeController;
    v9->_collectionsSizeController = v10;

    v12 = [[CollectionsFilterSizeController alloc] initWithCollectionsFilterDisplayStyle:0 inContext:1];
    filtersSizeController = v9->_filtersSizeController;
    v9->_filtersSizeController = v12;
  }
  v14 = v9;
LABEL_6:

  return v14;
}

- (void)setupConfiguration
{
  int64_t kind = self->_kind;
  if (kind == 1)
  {
    int64x2_t v2 = (int64x2_t)1uLL;
    CFStringRef v4 = @"LoadingSection";
  }
  else if (kind)
  {
    CFStringRef v4 = 0;
  }
  else
  {
    int64x2_t v2 = vdupq_n_s64(1uLL);
    v2.i64[0] = 0;
    CFStringRef v4 = @"CollectionsSection";
  }
  v5[0] = 1;
  v5[1] = v4;
  int64x2_t v6 = v2;
  [(AllCollectionsSection *)self setConfiguration:v5];
}

- (id)layoutForSectionUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4
{
  id v7 = a3;
  int64_t v8 = [(AllCollectionsSection *)self kind];
  if (v8 == 1)
  {
    uint64_t v9 = [(AllCollectionsSection *)self layoutSectionForLoadingUsingTraitEnvironment:v7];
  }
  else
  {
    if (v8) {
      goto LABEL_6;
    }
    uint64_t v9 = [(AllCollectionsSection *)self layoutSectionForCollectionsUsingTraitsEnvironment:v7 usingWidth:a4];
  }
  CFStringRef v4 = (void *)v9;
LABEL_6:

  return v4;
}

- (id)layoutSectionForCollectionsUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4
{
  id v6 = a3;
  id v7 = [(AllCollectionsSection *)self collectionsSizeController];
  [v7 sizeForCollectionWithMaxCollectionsWidth:a4];
  double v9 = v8;
  double v11 = v10;

  v12 = [(AllCollectionsSection *)self collectionsSizeController];
  [v12 sectionInsets];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  v21 = +[NSCollectionLayoutDimension absoluteDimension:v9];
  v22 = +[NSCollectionLayoutDimension absoluteDimension:v11];
  uint64_t v23 = +[NSCollectionLayoutSize sizeWithWidthDimension:v21 heightDimension:v22];

  v45 = (void *)v23;
  uint64_t v24 = +[NSCollectionLayoutItem itemWithLayoutSize:v23];
  v25 = +[NSCollectionLayoutDimension estimatedDimension:260.0];
  v26 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  v27 = +[NSCollectionLayoutSize sizeWithWidthDimension:v26 heightDimension:v25];

  v44 = (void *)v24;
  uint64_t v48 = v24;
  v28 = +[NSArray arrayWithObjects:&v48 count:1];
  v29 = +[NSCollectionLayoutGroup verticalGroupWithLayoutSize:v27 subitems:v28];

  v30 = +[NSCollectionLayoutSection sectionWithGroup:v29];
  v31 = [(AllCollectionsSection *)self collectionsSizeController];
  [v31 minimumInterItemSpacing];
  [v30 setInterGroupSpacing:];

  [v30 setContentInsets:v14, v16, v18, v20];
  uint64_t v32 = sub_1000BBB44(v6);

  v33 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  if (v32 == 5)
  {
    +[CollectionsFilterMenu defaultHeightForDisplayStyle:1 inContext:1];
    v34 = +[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:");
    v35 = +[NSCollectionLayoutSize sizeWithWidthDimension:v33 heightDimension:v34];

    v36 = +[CollectionsFilterMenu reuseIdentifier];
    v37 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v35 elementKind:v36 alignment:1];

    v47 = v37;
    v38 = +[NSArray arrayWithObjects:&v47 count:1];
    [v30 setBoundarySupplementaryItems:v38];
  }
  else
  {
    v39 = [(AllCollectionsSection *)self filtersSizeController];
    [v39 defaultHeight];
    v40 = +[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:");
    v35 = +[NSCollectionLayoutSize sizeWithWidthDimension:v33 heightDimension:v40];

    v41 = +[CollectionsFilterCarouselView reuseIdentifier];
    v37 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v35 elementKind:v41 alignment:1];

    v46 = v37;
    v42 = +[NSArray arrayWithObjects:&v46 count:1];
    [v30 setBoundarySupplementaryItems:v42];

    [v30 setSupplementariesFollowContentInsets:0];
  }

  return v30;
}

- (id)layoutSectionForLoadingUsingTraitEnvironment:(id)a3
{
  v3 = +[NSCollectionLayoutSize layoutSizeWithFractionalWidth:fractionalHeight:](NSCollectionLayoutSize, "layoutSizeWithFractionalWidth:fractionalHeight:", a3, 1.0, 1.0);
  CFStringRef v4 = +[NSCollectionLayoutItem itemWithLayoutSize:v3];
  [v4 setContentInsets:NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing];
  v5 = +[NSCollectionLayoutDimension estimatedDimension:100.0];
  id v6 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  id v7 = +[NSCollectionLayoutSize sizeWithWidthDimension:v6 heightDimension:v5];

  v12 = v4;
  double v8 = +[NSArray arrayWithObjects:&v12 count:1];
  double v9 = +[NSCollectionLayoutGroup verticalGroupWithLayoutSize:v7 subitems:v8];

  double v10 = +[NSCollectionLayoutSection sectionWithGroup:v9];

  return v10;
}

- ($F604286BD1E4CBBF10F21E9B2637A591)configuration
{
  sectionIdentifier = self->_configuration.sectionIdentifier;
  retstr->var0 = self->_configuration.columnCount;
  result = sectionIdentifier;
  retstr->var1 = result;
  *(_OWORD *)&retstr->var2 = *(_OWORD *)&self->_configuration.cellKind;
  return result;
}

- (void)setConfiguration:(id *)a3
{
  self->_configuration.columnCount = a3->var0;
  var1 = (NSString *)a3->var1;
  a3->var1 = 0;
  sectionIdentifier = self->_configuration.sectionIdentifier;
  self->_configuration.sectionIdentifier = var1;

  *(_OWORD *)&self->_configuration.cellKind = *(_OWORD *)&a3->var2;
}

- (MKPlaceCollectionsSizeController)collectionsSizeController
{
  return self->_collectionsSizeController;
}

- (void)setCollectionsSizeController:(id)a3
{
}

- (CollectionsFilterSizeController)filtersSizeController
{
  return self->_filtersSizeController;
}

- (void)setFiltersSizeController:(id)a3
{
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_int64_t kind = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filtersSizeController, 0);

  objc_storeStrong((id *)&self->_collectionsSizeController, 0);
}

@end