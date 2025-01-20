@interface PXPhotosSearchBodyLayoutProvider
- (BOOL)shouldPreventFaultOutOfBodyLayout:(id)a3 inAssetSectionLayout:(id)a4;
- (PXPhotosSearchBodyLayoutProvider)initWithCollectionSectionProvider:(id)a3;
- (PXPhotosSearchBodyLayoutProvider)initWithPhotoLibrary:(id)a3;
- (PXPhotosSectionBodyLayoutProviderInvalidationDelegate)invalidationDelegate;
- (PXPhotosSelectionContainer)collectionsSelection;
- (PXPhotosViewModel)viewModel;
- (UIViewController)hostViewController;
- (id)collectionSectionProvider;
- (id)createSectionBodyLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outWantsDecoration:(BOOL *)a7;
- (void)clearAssetSelections;
- (void)configureSectionBodyLayout:(id)a3 inAssetSectionLayout:(id)a4 forSectionedLayout:(id)a5;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setCollectionsSelection:(id)a3;
- (void)setHostViewController:(id)a3;
- (void)setInvalidationDelegate:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation PXPhotosSearchBodyLayoutProvider

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collectionsSelection);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong(&self->_collectionSectionProvider, 0);
  objc_destroyWeak((id *)&self->invalidationDelegate);
}

- (void)setCollectionsSelection:(id)a3
{
}

- (PXPhotosSelectionContainer)collectionsSelection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionsSelection);
  return (PXPhotosSelectionContainer *)WeakRetained;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setHostViewController:(id)a3
{
}

- (UIViewController)hostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  return (UIViewController *)WeakRetained;
}

- (id)collectionSectionProvider
{
  return self->_collectionSectionProvider;
}

- (void)setInvalidationDelegate:(id)a3
{
}

- (PXPhotosSectionBodyLayoutProviderInvalidationDelegate)invalidationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->invalidationDelegate);
  return (PXPhotosSectionBodyLayoutProviderInvalidationDelegate *)WeakRetained;
}

- (void)clearAssetSelections
{
  id v3 = [(PXPhotosSearchBodyLayoutProvider *)self viewModel];
  v2 = [v3 selectionManager];
  [v2 performChanges:&__block_literal_global_84178];
}

uint64_t __56__PXPhotosSearchBodyLayoutProvider_clearAssetSelections__block_invoke(uint64_t a1, void *a2)
{
  return [a2 deselectAll];
}

- (BOOL)shouldPreventFaultOutOfBodyLayout:(id)a3 inAssetSectionLayout:(id)a4
{
  return 0;
}

- (void)configureSectionBodyLayout:(id)a3 inAssetSectionLayout:(id)a4 forSectionedLayout:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v10 dataSource];
  if (v10) {
    [v10 sectionIndexPath];
  }
  else {
    memset(v50, 0, sizeof(v50));
  }
  v13 = [v12 assetCollectionAtSectionIndexPath:v50];

  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    v48 = (objc_class *)objc_opt_class();
    v47 = NSStringFromClass(v48);
    v49 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
    [v45 handleFailureInMethod:a2, self, @"PXPhotosSearchBodyLayoutProvider.m", 154, @"%@ should be an instance inheriting from %@, but it is %@", @"[assetsSectionLayout.dataSource assetCollectionAtSectionIndexPath:assetsSectionLayout.sectionIndexPath]", v47, v49 object file lineNumber description];
  }
  else
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    v46 = (objc_class *)objc_opt_class();
    v47 = NSStringFromClass(v46);
    [v45 handleFailureInMethod:a2, self, @"PXPhotosSearchBodyLayoutProvider.m", 154, @"%@ should be an instance inheriting from %@, but it is nil", @"[assetsSectionLayout.dataSource assetCollectionAtSectionIndexPath:assetsSectionLayout.sectionIndexPath]", v47 object file lineNumber description];
  }

LABEL_6:
  [v10 setRemovesContentLayoutWhenEmpty:1];
  [v10 setRemovesHeaderLayoutWhenEmpty:1];
  v14 = [v13 transientIdentifier];
  char v15 = [v14 isEqualToString:@"SearchCollectionsSection"];

  if ((v15 & 1) == 0)
  {
    [v9 setContentSource:v10];
    v16 = [v11 viewModel];
    unsigned int v17 = [v16 aspectFitContent];

    id v18 = v9;
    v19 = +[PXLemonadeSettings sharedInstance];
    int v20 = [v19 showSearchDebugBadges];

    if (v20)
    {
      v21 = [v18 decoratingLayout];
      [v21 addActiveDecorations:&unk_1F02D40A8];
    }
    [v18 setDelegate:v10];
    v22 = [v10 spec];
    uint64_t v23 = [v22 sizeClass];

    v24 = [v10 spec];
    uint64_t v25 = [v24 layoutOrientation];

    uint64_t v26 = 9;
    uint64_t v27 = 13;
    if (v25 != 2)
    {
      uint64_t v27 = 9;
      uint64_t v26 = 5;
    }
    if (v23 == 2) {
      uint64_t v28 = v27;
    }
    else {
      uint64_t v28 = v26;
    }
    [v18 setNumberOfColumns:v28];
    v29 = [v10 spec];
    v30 = [v29 extendedTraitCollection];
    uint64_t v31 = [v30 userInterfaceStyle];

    v32 = +[PXZoomablePhotosSettings sharedInstance];
    v33 = v32;
    if (v31 == 2)
    {
      [v32 darkModeInteritemSpacing];
      double v35 = v34;

      v36 = +[PXZoomablePhotosSettings sharedInstance];
      [v36 darkModeCornerRadius];
    }
    else
    {
      [v32 interitemSpacing];
      double v35 = v38;

      v36 = +[PXZoomablePhotosSettings sharedInstance];
      [v36 cornerRadius];
    }
    double v39 = v37;

    objc_msgSend(v18, "setInterItemSpacing:", v35, v35);
    *(float *)&double v40 = v39;
    LODWORD(v41) = LODWORD(v40);
    LODWORD(v42) = LODWORD(v40);
    LODWORD(v43) = LODWORD(v40);
    objc_msgSend(v18, "setItemCornerRadius:", v40, v41, v42, v43);
    [v18 setContentMode:v17];
    v44 = [v18 axGroup];
    [v44 setAxIdentifier:@"search_section"];
  }
}

- (id)createSectionBodyLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outWantsDecoration:(BOOL *)a7
{
  id v10 = a4;
  long long v11 = *(_OWORD *)&a5->item;
  v26[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v26[1] = v11;
  v12 = [v10 assetCollectionAtSectionIndexPath:v26];
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = (objc_class *)objc_opt_class();
    uint64_t v23 = NSStringFromClass(v24);
    uint64_t v25 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
    [v21 handleFailureInMethod:a2, self, @"PXPhotosSearchBodyLayoutProvider.m", 135, @"%@ should be an instance inheriting from %@, but it is %@", @"[dataSource assetCollectionAtSectionIndexPath:sectionIndexPath]", v23, v25 object file lineNumber description];
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = (objc_class *)objc_opt_class();
    uint64_t v23 = NSStringFromClass(v22);
    [v21 handleFailureInMethod:a2, self, @"PXPhotosSearchBodyLayoutProvider.m", 135, @"%@ should be an instance inheriting from %@, but it is nil", @"[dataSource assetCollectionAtSectionIndexPath:sectionIndexPath]", v23 object file lineNumber description];
  }

LABEL_3:
  v13 = [v12 transientIdentifier];
  int v14 = [v13 isEqualToString:@"SearchCollectionsSection"];

  if (v14)
  {
    char v15 = objc_alloc_init(_PXPhotosSearchBodyCollectionSectionLayout);
    v16 = [(PXPhotosSearchBodyLayoutProvider *)self collectionSectionProvider];
    unsigned int v17 = [(PXPhotosSearchBodyLayoutProvider *)self hostViewController];
    id v18 = [(_PXPhotosSearchBodyCollectionSectionLayout *)v15 containerInfo];
    v19 = +[PXPhotosSearchResultsCollectionsViewFactory createViewWithCollectionSectionProvider:v16 hostViewController:v17 containerInfo:v18 viewDelegate:v15 selectionDelegate:self];

    [(PXGSingleViewLayout *)v15 setContentView:v19];
    [(PXPhotosSearchBodyLayoutProvider *)self setCollectionsSelection:v19];
  }
  else
  {
    char v15 = objc_alloc_init(PXGGridLayout);
    [(_PXPhotosSearchBodyCollectionSectionLayout *)v15 setMediaKind:2];
    [(_PXPhotosSearchBodyCollectionSectionLayout *)v15 setPresentationType:0];
    [(_PXPhotosSearchBodyCollectionSectionLayout *)v15 setLazy:1];
    -[_PXPhotosSearchBodyCollectionSectionLayout setNumberOfItems:](v15, "setNumberOfItems:", [v10 numberOfItemsInSection:a5->section]);
  }

  return v15;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((v6 & 2) != 0 && (void *)PXSelectionManagerObservationContext_84214 == a5)
  {
    id v13 = v8;
    id v9 = [(PXPhotosSearchBodyLayoutProvider *)self viewModel];
    id v10 = [v9 selectionSnapshot];
    int v11 = [v10 isAnyItemSelected];

    id v8 = v13;
    if (v11)
    {
      v12 = [(PXPhotosSearchBodyLayoutProvider *)self collectionsSelection];
      [v12 clearPhotosSelection];

      id v8 = v13;
    }
  }
}

- (void)setViewModel:(id)a3
{
  v5 = (PXPhotosViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    v7 = v5;
    [(PXPhotosViewModel *)viewModel unregisterChangeObserver:self context:PXSelectionManagerObservationContext_84214];
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(PXPhotosViewModel *)self->_viewModel registerChangeObserver:self context:PXSelectionManagerObservationContext_84214];
    v5 = v7;
  }
}

- (PXPhotosSearchBodyLayoutProvider)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosSearchBodyLayoutProvider;
  v5 = [(PXPhotosSearchBodyLayoutProvider *)&v9 init];
  if (v5)
  {
    char v6 = [[PXPhotosSearchCollectionSectionProvider alloc] initWithPhotoLibrary:v4];
    id collectionSectionProvider = v5->_collectionSectionProvider;
    v5->_id collectionSectionProvider = v6;
  }
  return v5;
}

- (PXPhotosSearchBodyLayoutProvider)initWithCollectionSectionProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosSearchBodyLayoutProvider;
  char v6 = [(PXPhotosSearchBodyLayoutProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_collectionSectionProvider, a3);
  }

  return v7;
}

@end