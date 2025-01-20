@interface PXPhotosMapBodyLayoutProvider
- (BOOL)shouldPreventFaultOutOfBodyLayout:(id)a3 inAssetSectionLayout:(id)a4;
- (PXExtendedTraitCollection)traitCollection;
- (PXPhotosMapBodyLayoutProvider)init;
- (PXPhotosMapBodyLayoutProvider)initWithViewModel:(id)a3 traitCollection:(id)a4 presentingViewController:(id)a5;
- (PXPhotosMapSelectionHandler)selectionHandler;
- (PXPhotosSectionBodyLayoutProviderInvalidationDelegate)invalidationDelegate;
- (PXPhotosViewModel)viewModel;
- (UIViewController)presentingViewController;
- (id)_locationFromVisibleAnchorsInSectionedLayout:(id)a3;
- (id)createSectionBodyLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outWantsDecoration:(BOOL *)a7;
- (void)setInvalidationDelegate:(id)a3;
@end

@implementation PXPhotosMapBodyLayoutProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_selectionHandler, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->invalidationDelegate);
}

- (PXExtendedTraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (PXPhotosMapSelectionHandler)selectionHandler
{
  return self->_selectionHandler;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setInvalidationDelegate:(id)a3
{
}

- (PXPhotosSectionBodyLayoutProviderInvalidationDelegate)invalidationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->invalidationDelegate);
  return (PXPhotosSectionBodyLayoutProviderInvalidationDelegate *)WeakRetained;
}

- (id)_locationFromVisibleAnchorsInSectionedLayout:(id)a3
{
  id v3 = a3;
  if (!v3) {
    PXAssertGetLog();
  }
  v4 = +[PXLemonadeSettings sharedInstance];
  int v5 = [v4 enableFocusMapLensOnAnchors];

  if (v5)
  {
    *(void *)buf = 0;
    v12 = buf;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__11398;
    v15 = __Block_byref_object_dispose__11399;
    id v16 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__PXPhotosMapBodyLayoutProvider__locationFromVisibleAnchorsInSectionedLayout___block_invoke;
    v8[3] = &unk_1E5DBBE68;
    id v9 = v3;
    v10 = buf;
    [v9 enumerateVisibleAnchoringSpriteIndexesUsingBlock:v8];
    id v6 = *((id *)v12 + 5);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __78__PXPhotosMapBodyLayoutProvider__locationFromVisibleAnchorsInSectionedLayout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  v14 = [*(id *)(a1 + 32) objectReferenceForSpriteIndex:a2];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = v14;
  if (isKindOfClass)
  {
    id v8 = v14;
    id v9 = [v8 asset];

    if (v9)
    {
      v10 = [v8 asset];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v11 = [v10 performSelector:sel_location];
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    *a4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
    v7 = v14;
  }
}

- (BOOL)shouldPreventFaultOutOfBodyLayout:(id)a3 inAssetSectionLayout:(id)a4
{
  return 0;
}

- (id)createSectionBodyLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outWantsDecoration:(BOOL *)a7
{
  id v9 = -[PXPhotosMapBodyLayoutProvider _locationFromVisibleAnchorsInSectionedLayout:](self, "_locationFromVisibleAnchorsInSectionedLayout:", a3, a4, a5, a6, a7);
  v10 = [PXPhotosMapLayout alloc];
  uint64_t v11 = [(PXPhotosMapBodyLayoutProvider *)self viewModel];
  uint64_t v12 = [(PXPhotosMapBodyLayoutProvider *)self traitCollection];
  uint64_t v13 = [(PXPhotosMapBodyLayoutProvider *)self presentingViewController];
  long long v14 = *(_OWORD *)&a5->item;
  v18[0] = *(_OWORD *)&a5->dataSourceIdentifier;
  v18[1] = v14;
  v15 = [(PXPhotosMapLayout *)v10 initWithViewModel:v11 sectionIndexPath:v18 traitCollection:v12 presentingViewController:v13 initialLocation:v9];

  id v16 = [(PXPhotosMapBodyLayoutProvider *)self selectionHandler];
  [(PXPhotosMapLayout *)v15 setSelectionDelegate:v16];

  return v15;
}

- (PXPhotosMapBodyLayoutProvider)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosMapBodyLayoutProvider.m", 64, @"%s is not available as initializer", "-[PXPhotosMapBodyLayoutProvider init]");

  abort();
}

- (PXPhotosMapBodyLayoutProvider)initWithViewModel:(id)a3 traitCollection:(id)a4 presentingViewController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXPhotosMapBodyLayoutProvider;
  uint64_t v12 = [(PXPhotosMapBodyLayoutProvider *)&v17 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_viewModel, a3);
    objc_storeWeak((id *)&v13->_presentingViewController, v11);
    long long v14 = [[PXPhotosMapSelectionHandler alloc] initWithViewModel:v9 presentingViewController:v11];
    selectionHandler = v13->_selectionHandler;
    v13->_selectionHandler = v14;

    objc_storeStrong((id *)&v13->_traitCollection, a4);
  }

  return v13;
}

@end