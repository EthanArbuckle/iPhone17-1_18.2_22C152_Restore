@interface PXMonthChapterSectionConfigurator
- (PXCuratedLibraryChapterHeaderLayoutSpec)chapterHeaderSpec;
- (PXMonthCardSectionBodyLayoutSpec)cardBodySpec;
- (PXMonthChapterSectionConfigurator)initWithExtendedTraitCollection:(id)a3 assetsSectionLayoutSpec:(id)a4;
- (id)headerSpecForHeaderStyle:(int64_t)a3 assetSectionLayout:(id)a4;
- (id)updatedHeaderLayout:(id)a3 withHeaderStyle:(int64_t)a4 forAssetSectionLayout:(id)a5;
- (void)configureAssetSectionLayout:(id)a3;
@end

@implementation PXMonthChapterSectionConfigurator

- (PXMonthChapterSectionConfigurator)initWithExtendedTraitCollection:(id)a3 assetsSectionLayoutSpec:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXMonthChapterSectionConfigurator;
  v7 = [(PXAssetsSectionConfigurator *)&v13 initWithExtendedTraitCollection:v6 assetsSectionLayoutSpec:a4];
  if (v7)
  {
    v8 = [(PXFeatureSpec *)[PXCuratedLibraryChapterHeaderLayoutSpec alloc] initWithExtendedTraitCollection:v6];
    chapterHeaderSpec = v7->_chapterHeaderSpec;
    v7->_chapterHeaderSpec = v8;

    v10 = [(PXFeatureSpec *)[PXMonthCardSectionBodyLayoutSpec alloc] initWithExtendedTraitCollection:v6];
    cardBodySpec = v7->_cardBodySpec;
    v7->_cardBodySpec = v10;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardBodySpec, 0);
  objc_storeStrong((id *)&self->_chapterHeaderSpec, 0);
}

- (PXMonthCardSectionBodyLayoutSpec)cardBodySpec
{
  return self->_cardBodySpec;
}

- (PXCuratedLibraryChapterHeaderLayoutSpec)chapterHeaderSpec
{
  return self->_chapterHeaderSpec;
}

- (id)updatedHeaderLayout:(id)a3 withHeaderStyle:(int64_t)a4 forAssetSectionLayout:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = (PXCuratedLibraryChapterHeaderLayout *)v7;
  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = objc_alloc_init(PXCuratedLibraryChapterHeaderLayout);
  }
  v11 = [v8 assetCollectionReference];
  [(PXCuratedLibraryChapterHeaderLayout *)v10 setAssetCollectionReference:v11];

  if (v8)
  {
    [v8 sectionIndexPath];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }
  v15[0] = v16;
  v15[1] = v17;
  [(PXCuratedLibraryChapterHeaderLayout *)v10 setSectionIndexPath:v15];
  v12 = [(PXMonthChapterSectionConfigurator *)self cardBodySpec];
  [v12 padding];
  -[PXCuratedLibraryChapterHeaderLayout setPadding:](v10, "setPadding:");

  objc_super v13 = [(PXMonthChapterSectionConfigurator *)self chapterHeaderSpec];
  [(PXCuratedLibraryChapterHeaderLayout *)v10 setSpec:v13];

  return v10;
}

- (void)configureAssetSectionLayout:(id)a3
{
  id v4 = a3;
  v5 = [v4 headerLayout];
  id v7 = [(PXMonthChapterSectionConfigurator *)self updatedHeaderLayout:v5 withHeaderStyle:2 forAssetSectionLayout:v4];

  objc_msgSend(v4, "setPadding:", *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
  [v4 setMode:0];
  [v4 setWantsShadow:0];
  [v4 setShowAllActionPerformer:0];
  [v4 setHeaderLayoutGuide:0];
  id v6 = [(PXAssetsSectionConfigurator *)self assetsSectionLayoutSpec];
  [v4 setSpec:v6];

  [v4 setHeaderLayout:v7];
  [v4 setBodyContentLayout:0 wantsDecoration:0];
}

- (id)headerSpecForHeaderStyle:(int64_t)a3 assetSectionLayout:(id)a4
{
  return 0;
}

@end