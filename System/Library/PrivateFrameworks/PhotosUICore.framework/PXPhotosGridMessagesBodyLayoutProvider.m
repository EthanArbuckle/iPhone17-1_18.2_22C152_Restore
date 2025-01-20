@interface PXPhotosGridMessagesBodyLayoutProvider
- (BOOL)shouldPreventFaultOutOfBodyLayout:(id)a3 inAssetSectionLayout:(id)a4;
- (CGSize)itemsLayout:(id)a3 marginForItem:(int64_t)a4;
- (PXAssetImportStatusManager)assetImportStatusManager;
- (PXPhotosGridMessagesBodyLayoutProvider)initWithViewModel:(id)a3;
- (PXPhotosGridMessagesLayoutSpecManager)specManager;
- (PXPhotosSectionBodyLayoutProviderInvalidationDelegate)invalidationDelegate;
- (PXTapbackStatusManager)tapbackStatusManager;
- (double)itemsLayout:(id)a3 aspectRatioForItem:(int64_t)a4;
- (id)createSectionBodyLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outWantsDecoration:(BOOL *)a7;
- (id)itemsLayout:(id)a3 objectReferenceForItem:(int64_t)a4;
- (int64_t)itemsLayout:(id)a3 itemForObjectReference:(id)a4 options:(unint64_t)a5;
- (void)configureSectionBodyLayout:(id)a3 inAssetSectionLayout:(id)a4 forSectionedLayout:(id)a5;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)sectionedLayout:(id)a3 bodyLayout:(id)a4 didChangeDataSource:(id)a5 sectionIndexPath:(PXSimpleIndexPath *)a6 hasSectionChanges:(BOOL)a7;
- (void)setInvalidationDelegate:(id)a3;
@end

@implementation PXPhotosGridMessagesBodyLayoutProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetImportStatusManager, 0);
  objc_storeStrong((id *)&self->_tapbackStatusManager, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_destroyWeak((id *)&self->invalidationDelegate);
}

- (PXAssetImportStatusManager)assetImportStatusManager
{
  return self->_assetImportStatusManager;
}

- (PXTapbackStatusManager)tapbackStatusManager
{
  return self->_tapbackStatusManager;
}

- (PXPhotosGridMessagesLayoutSpecManager)specManager
{
  return self->_specManager;
}

- (void)setInvalidationDelegate:(id)a3
{
}

- (PXPhotosSectionBodyLayoutProviderInvalidationDelegate)invalidationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->invalidationDelegate);
  return (PXPhotosSectionBodyLayoutProviderInvalidationDelegate *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)SpecManagerObservationContext_88226 != a5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXPhotosGridMessagesBodyLayoutProvider.m" lineNumber:152 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v12 = v9;
    v10 = [(PXPhotosGridMessagesBodyLayoutProvider *)self invalidationDelegate];
    [v10 photosSectionBodyLayoutInvalidateConfiguredLayouts:self];

    id v9 = v12;
  }
}

- (id)itemsLayout:(id)a3 objectReferenceForItem:(int64_t)a4
{
  return (id)[a3 assetReferenceForItemIndex:a4];
}

- (int64_t)itemsLayout:(id)a3 itemForObjectReference:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  id v9 = v8;
  if (!v9) {
    goto LABEL_6;
  }
  v10 = v9;
  if ((v5 & 1) == 0) {
    goto LABEL_8;
  }
  v11 = [v7 dataSource];
  id v12 = objc_msgSend(v11, "objectReferenceNearestToObjectReference:inSection:", v10, objc_msgSend(v7, "section"));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_8:
    id v12 = v10;
    goto LABEL_9;
  }

  if (!v12)
  {
LABEL_6:
    int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_19;
  }
LABEL_9:
  long long v17 = 0u;
  long long v18 = 0u;
  v14 = objc_msgSend(v7, "dataSource", 0);
  v15 = v14;
  if (v14)
  {
    [v14 indexPathForAssetReference:v12];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
  }

  int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  if ((void)v17 != *(void *)off_1E5DAAED8
    && (void)v18 != 0x7FFFFFFFFFFFFFFFLL
    && *((void *)&v18 + 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (*((void *)&v17 + 1) == [v7 section]) {
      int64_t v13 = v18;
    }
    else {
      int64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

LABEL_19:
  return v13;
}

- (CGSize)itemsLayout:(id)a3 marginForItem:(int64_t)a4
{
  id v5 = a3;
  char v6 = [v5 assetForItemIndex:a4];
  [v6 aspectRatio];
  double v8 = v7;
  id v9 = [v5 spec];

  if (v8 > 1.01 || v8 < 0.99) {
    [v9 itemInternalMargin];
  }
  else {
    [v9 itemInternalSquareMargin];
  }
  double v12 = v10;
  double v13 = v11;

  double v14 = v12;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (double)itemsLayout:(id)a3 aspectRatioForItem:(int64_t)a4
{
  v4 = [a3 assetForItemIndex:a4];
  [v4 aspectRatio];
  double v6 = 1.0;
  if (v5 < 0.99) {
    double v6 = 0.75;
  }
  if (v5 <= 1.01) {
    double v7 = v6;
  }
  else {
    double v7 = 1.33333333;
  }

  return v7;
}

- (BOOL)shouldPreventFaultOutOfBodyLayout:(id)a3 inAssetSectionLayout:(id)a4
{
  return 0;
}

- (id)createSectionBodyLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outWantsDecoration:(BOOL *)a7
{
  id v10 = a4;
  double v11 = objc_alloc_init(PXPhotosGridMessagesBodyLayout);
  -[PXGItemsLayout setNumberOfItems:](v11, "setNumberOfItems:", [v10 numberOfItemsInSection:a5->section]);
  [(PXPhotosGridMessagesBodyLayout *)v11 setDataSource:v10 section:a5->section];

  [(PXGItemsLayout *)v11 setDelegate:self];
  *a7 = 0;
  double v12 = [(PXPhotosGridMessagesBodyLayout *)v11 assetDecorationSource];
  double v13 = [(PXPhotosGridMessagesBodyLayoutProvider *)self tapbackStatusManager];
  [v12 setTapbackStatusManager:v13];

  double v14 = [(PXPhotosGridMessagesBodyLayoutProvider *)self assetImportStatusManager];
  [v12 setAssetImportStatusManager:v14];

  [v12 setInterItemSpacingThresholdForExteriorFocusRingSelection:0];
  double v15 = [(PXGDecoratingLayout *)[_PXMessagesGridDecoratingLayout alloc] initWithDecoratedLayout:v11];
  [(PXGDecoratingLayout *)v15 setActiveDecorations:&unk_1F02D40F0];
  [(PXGDecoratingLayout *)v15 setDecorationSource:v12];
  [(PXGDecoratingLayout *)v15 setContentSource:v11];

  return v15;
}

- (void)configureSectionBodyLayout:(id)a3 inAssetSectionLayout:(id)a4 forSectionedLayout:(id)a5
{
  id v7 = a4;
  id v16 = [a3 decoratedLayout];
  double v8 = [v7 selectionSnapshot];
  id v9 = [v16 assetDecorationSource];
  [v9 setSelectionSnapshot:v8];

  uint64_t v10 = [v7 isSelecting];
  double v11 = [v16 assetDecorationSource];
  [v11 setIsInSelectMode:v10];

  double v12 = [v7 tapbackStatusManager];

  double v13 = [v16 assetDecorationSource];
  [v13 setTapbackStatusManager:v12];

  double v14 = [(PXPhotosGridMessagesBodyLayoutProvider *)self specManager];
  double v15 = [v14 spec];
  [v16 setSpec:v15];
}

- (void)sectionedLayout:(id)a3 bodyLayout:(id)a4 didChangeDataSource:(id)a5 sectionIndexPath:(PXSimpleIndexPath *)a6 hasSectionChanges:(BOOL)a7
{
  id v9 = a5;
  id v10 = [a4 decoratedLayout];
  [v10 setDataSource:v9 section:a6->section];
}

- (PXPhotosGridMessagesBodyLayoutProvider)initWithViewModel:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXPhotosGridMessagesBodyLayoutProvider;
  double v5 = [(PXPhotosGridMessagesBodyLayoutProvider *)&v17 init];
  if (v5)
  {
    double v6 = [PXPhotosGridMessagesLayoutSpecManager alloc];
    id v7 = [v4 specManager];
    double v8 = [v7 extendedTraitCollection];
    id v9 = [(PXFeatureSpecManager *)v6 initWithExtendedTraitCollection:v8];

    specManager = v5->_specManager;
    v5->_specManager = v9;
    double v11 = v9;

    [(PXPhotosGridMessagesLayoutSpecManager *)v5->_specManager registerChangeObserver:v5 context:SpecManagerObservationContext_88226];
    uint64_t v12 = [v4 tapbackStatusManager];
    tapbackStatusManager = v5->_tapbackStatusManager;
    v5->_tapbackStatusManager = (PXTapbackStatusManager *)v12;

    uint64_t v14 = [v4 assetImportStatusManager];
    assetImportStatusManager = v5->_assetImportStatusManager;
    v5->_assetImportStatusManager = (PXAssetImportStatusManager *)v14;
  }
  return v5;
}

@end