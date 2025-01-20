@interface CitySelectorSection
- ($F604286BD1E4CBBF10F21E9B2637A591)configuration;
- (CitySelectorSection)initWithSectionKind:(int64_t)a3 usingMaxWidth:(double)a4 usingTraitEnvironment:(id)a5;
- (MKPlaceCompactCollectionSizeController)sizeController;
- (NSString)sectionTitle;
- (id)layoutForSectionUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4;
- (id)layoutSectionForCompactCollectionsUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4;
- (id)layoutSectionForWorldwideUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4;
- (int64_t)kind;
- (void)initializeSizeControllerUsingTraitEnvironment:(id)a3;
- (void)setConfiguration:(id *)a3;
- (void)setKind:(int64_t)a3;
- (void)setSectionTitle:(id)a3;
- (void)setSizeController:(id)a3;
- (void)setupConfiguration;
@end

@implementation CitySelectorSection

- (CitySelectorSection)initWithSectionKind:(int64_t)a3 usingMaxWidth:(double)a4 usingTraitEnvironment:(id)a5
{
  id v7 = a5;
  v11.receiver = self;
  v11.super_class = (Class)CitySelectorSection;
  v8 = [(CitySelectorSection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_kind = a3;
    [(CitySelectorSection *)v8 setupConfiguration];
    [(CitySelectorSection *)v9 initializeSizeControllerUsingTraitEnvironment:v7];
  }

  return v9;
}

- (id)layoutForSectionUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4
{
  id v7 = a3;
  int64_t v8 = [(CitySelectorSection *)self kind];
  if (v8 == 1)
  {
    uint64_t v9 = [(CitySelectorSection *)self layoutSectionForWorldwideUsingTraitsEnvironment:v7 usingWidth:a4];
  }
  else
  {
    if (v8) {
      goto LABEL_6;
    }
    uint64_t v9 = [(CitySelectorSection *)self layoutSectionForCompactCollectionsUsingTraitsEnvironment:v7 usingWidth:a4];
  }
  v4 = (void *)v9;
LABEL_6:

  return v4;
}

- (void)setupConfiguration
{
  int64_t v3 = [(CitySelectorSection *)self kind];
  CFStringRef v4 = @"Worldwide";
  CFStringRef v5 = @"CompactCollection";
  uint64_t v6 = 2;
  if (v3)
  {
    CFStringRef v5 = 0;
    uint64_t v6 = @"Worldwide";
    CFStringRef v7 = @"Worldwide";
  }
  else
  {
    CFStringRef v7 = 0;
  }
  if (v3 == 1)
  {
    uint64_t v8 = 1;
  }
  else
  {
    CFStringRef v4 = v5;
    uint64_t v8 = v6;
  }
  v10[0] = v8;
  v10[1] = v4;
  if (v3 == 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = (uint64_t)v7;
  }
  v10[2] = 0;
  v10[3] = v9;
  if (self) {
    [(CitySelectorSection *)self setConfiguration:v10];
  }
}

- (void)initializeSizeControllerUsingTraitEnvironment:(id)a3
{
  BOOL v4 = self->_kind == 1;
  if (self->_kind == 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  id v6 = a3;
  CFStringRef v7 = [objc_alloc((Class)MKPlaceCompactCollectionSizeController) initWithCollectionsConfiguration:v4 usingTraitCollections:v5 inContext:0];

  sizeController = self->_sizeController;
  self->_sizeController = v7;
}

- (id)layoutSectionForCompactCollectionsUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4
{
  id v39 = a3;
  id v6 = [(CitySelectorSection *)self sizeController];
  [v6 sizeForCollectionWithMaxCollectionsWidth:a4];
  double v8 = v7;
  double v10 = v9;

  objc_super v11 = [(CitySelectorSection *)self sizeController];
  [v11 sectionInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  v20 = +[NSCollectionLayoutDimension absoluteDimension:v8];
  v21 = +[NSCollectionLayoutDimension absoluteDimension:v10];
  v22 = +[NSCollectionLayoutSize sizeWithWidthDimension:v20 heightDimension:v21];

  v23 = +[NSCollectionLayoutItem itemWithLayoutSize:v22];
  v24 = +[NSCollectionLayoutDimension estimatedDimension:260.0];
  v25 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  v26 = +[NSCollectionLayoutSize sizeWithWidthDimension:v25 heightDimension:v24];

  [(CitySelectorSection *)self configuration];
  v27 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v26 subitem:v23 count:v40];

  v28 = [(CitySelectorSection *)self sizeController];
  [v28 minimumInterItemSpacing];
  v29 = +[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:");
  [v27 setInterItemSpacing:v29];

  v30 = +[NSCollectionLayoutSection sectionWithGroup:v27];
  v31 = [(CitySelectorSection *)self sizeController];
  [v31 minimumInterItemSpacing];
  [v30 setInterGroupSpacing:];

  [v30 setContentInsets:v13, v15, v17, v19];
  v32 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  v33 = +[NSCollectionLayoutDimension absoluteDimension:40.0];
  v34 = +[NSCollectionLayoutSize sizeWithWidthDimension:v32 heightDimension:v33];

  v35 = +[GuidesGenericSectionHeader reuseIdentifier];
  v36 = +[NSCollectionLayoutBoundarySupplementaryItem boundarySupplementaryItemWithLayoutSize:v34 elementKind:v35 alignment:1];

  v42 = v36;
  v37 = +[NSArray arrayWithObjects:&v42 count:1];
  [v30 setBoundarySupplementaryItems:v37];

  return v30;
}

- (id)layoutSectionForWorldwideUsingTraitsEnvironment:(id)a3 usingWidth:(double)a4
{
  id v6 = a3;
  double v7 = [(CitySelectorSection *)self sizeController];
  [v7 sectionInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = ceil((a4 - (v11 + v15)) * 0.437317784);
  double v17 = +[NSCollectionLayoutDimension absoluteDimension:](NSCollectionLayoutDimension, "absoluteDimension:");
  double v18 = +[NSCollectionLayoutDimension absoluteDimension:v16];
  double v19 = +[NSCollectionLayoutSize sizeWithWidthDimension:v17 heightDimension:v18];

  v20 = +[NSCollectionLayoutItem itemWithLayoutSize:v19];
  v21 = +[NSCollectionLayoutDimension absoluteDimension:v16];
  v22 = +[NSCollectionLayoutDimension fractionalWidthDimension:1.0];
  v23 = +[NSCollectionLayoutSize sizeWithWidthDimension:v22 heightDimension:v21];

  [(CitySelectorSection *)self configuration];
  v24 = +[NSCollectionLayoutGroup horizontalGroupWithLayoutSize:v23 subitem:v20 count:v30];

  v25 = [(CitySelectorSection *)self sizeController];
  [v25 minimumInterItemSpacing];
  v26 = +[NSCollectionLayoutSpacing fixedSpacing:](NSCollectionLayoutSpacing, "fixedSpacing:");
  [v24 setInterItemSpacing:v26];

  v27 = +[NSCollectionLayoutSection sectionWithGroup:v24];
  v28 = [(CitySelectorSection *)self sizeController];
  [v28 minimumInterItemSpacing];
  [v27 setInterGroupSpacing:];

  [v27 setContentInsets:v9, v11, v13, v15];

  return v27;
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

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
}

- (MKPlaceCompactCollectionSizeController)sizeController
{
  return self->_sizeController;
}

- (void)setSizeController:(id)a3
{
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeController, 0);

  objc_storeStrong((id *)&self->_sectionTitle, 0);
}

@end