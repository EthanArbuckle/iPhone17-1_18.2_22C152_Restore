@interface PUWallpaperPosterShuffleGridViewController
- (BOOL)_canAddMorePhotos;
- (BOOL)allowsContextMenuInteractionForPhotosViewController:(id)a3;
- (BOOL)photosContentController:(id)a3 presentViewController:(id)a4;
- (BOOL)photosContentController:(id)a3 pushViewController:(id)a4;
- (BOOL)photosViewController:(id)a3 didPickAssetReference:(id)a4;
- (CGRect)preferredCropForAsset:(id)a3 withAspectRatio:(double)a4;
- (NSOrderedSet)initialPosterMedia;
- (NSOrderedSet)posterMedia;
- (NSURL)posterMediaDirectory;
- (PHPhotoLibrary)photoLibrary;
- (PUWallpaperPosterShuffleGridViewController)initWithCoder:(id)a3;
- (PUWallpaperPosterShuffleGridViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PUWallpaperPosterShuffleGridViewController)initWithResourceManager:(id)a3 posterMedia:(id)a4;
- (PUWallpaperPosterShuffleGridViewControllerDelegate)delegate;
- (PXGView)tungstenView;
- (PXMediaProvider)mediaProvider;
- (PXPhotosContentController)gridContentController;
- (PXPhotosViewModel)gridViewModel;
- (PXUpdater)updater;
- (UIBarButtonItem)addPhotosBarButtonItem;
- (UIBarButtonItem)deselectAllBarButtonItem;
- (UIBarButtonItem)doneBarButtonItem;
- (UIBarButtonItem)enterSelectModeBarButtonItem;
- (UIBarButtonItem)exitSelectModeBarButtonItem;
- (UIBarButtonItem)removePhotosBarButtonItem;
- (UIBarButtonItem)selectAllBarButtonItem;
- (UIEdgeInsets)maskPaddingForContentController:(id)a3;
- (id)_fetchResultWithAssetsFetchedFromPosterMedia:(id)a3;
- (void)_createBarButtonItemsIfNeeded;
- (void)_exitSelectMode;
- (void)_finishWithSelectedPosterMedia:(id)a3;
- (void)_handleAddPhotos:(id)a3;
- (void)_handleDeselectAll:(id)a3;
- (void)_handleDone:(id)a3;
- (void)_handleEnterSelectMode:(id)a3;
- (void)_handleRemovePhotos:(id)a3;
- (void)_handleSelectAll:(id)a3;
- (void)_invalidateBarItems;
- (void)_invalidateDataSource;
- (void)_setNeedsUpdate;
- (void)_updateBarItems;
- (void)_updateDataSource;
- (void)dismissPresentedViewControllerForContentController:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)setAddPhotosBarButtonItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeselectAllBarButtonItem:(id)a3;
- (void)setDoneBarButtonItem:(id)a3;
- (void)setEnterSelectModeBarButtonItem:(id)a3;
- (void)setExitSelectModeBarButtonItem:(id)a3;
- (void)setGridContentController:(id)a3;
- (void)setGridViewModel:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setPosterMedia:(id)a3;
- (void)setRemovePhotosBarButtonItem:(id)a3;
- (void)setSelectAllBarButtonItem:(id)a3;
- (void)setTungstenLayout:(id)a3;
- (void)setTungstenView:(id)a3;
- (void)setUpdater:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PUWallpaperPosterShuffleGridViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deselectAllBarButtonItem, 0);
  objc_storeStrong((id *)&self->_selectAllBarButtonItem, 0);
  objc_storeStrong((id *)&self->_exitSelectModeBarButtonItem, 0);
  objc_storeStrong((id *)&self->_enterSelectModeBarButtonItem, 0);
  objc_storeStrong((id *)&self->_removePhotosBarButtonItem, 0);
  objc_storeStrong((id *)&self->_addPhotosBarButtonItem, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_gridViewModel, 0);
  objc_storeStrong((id *)&self->_gridContentController, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_tungstenView, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_posterMedia, 0);
  objc_storeStrong((id *)&self->_initialPosterMedia, 0);
  objc_storeStrong((id *)&self->_posterMediaDirectory, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDeselectAllBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)deselectAllBarButtonItem
{
  return self->_deselectAllBarButtonItem;
}

- (void)setSelectAllBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)selectAllBarButtonItem
{
  return self->_selectAllBarButtonItem;
}

- (void)setExitSelectModeBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)exitSelectModeBarButtonItem
{
  return self->_exitSelectModeBarButtonItem;
}

- (void)setEnterSelectModeBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)enterSelectModeBarButtonItem
{
  return self->_enterSelectModeBarButtonItem;
}

- (void)setRemovePhotosBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)removePhotosBarButtonItem
{
  return self->_removePhotosBarButtonItem;
}

- (void)setAddPhotosBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)addPhotosBarButtonItem
{
  return self->_addPhotosBarButtonItem;
}

- (void)setDoneBarButtonItem:(id)a3
{
}

- (UIBarButtonItem)doneBarButtonItem
{
  return self->_doneBarButtonItem;
}

- (PXPhotosViewModel)gridViewModel
{
  return self->_gridViewModel;
}

- (PXPhotosContentController)gridContentController
{
  return self->_gridContentController;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setTungstenView:(id)a3
{
}

- (PXGView)tungstenView
{
  return self->_tungstenView;
}

- (void)setUpdater:(id)a3
{
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSOrderedSet)posterMedia
{
  return self->_posterMedia;
}

- (NSOrderedSet)initialPosterMedia
{
  return self->_initialPosterMedia;
}

- (NSURL)posterMediaDirectory
{
  return self->_posterMediaDirectory;
}

- (void)setDelegate:(id)a3
{
}

- (PUWallpaperPosterShuffleGridViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUWallpaperPosterShuffleGridViewControllerDelegate *)WeakRetained;
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v5 = a4;
  [(PUWallpaperPosterShuffleGridViewController *)self dismissViewControllerAnimated:1 completion:0];
  if ([v5 count])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAA0]);
    v7 = PXMap();
    v8 = (void *)[v6 initWithArray:v7];

    id v9 = objc_alloc(MEMORY[0x1E4F1CAA0]);
    v10 = [(PUWallpaperPosterShuffleGridViewController *)self posterMedia];
    v11 = PXMap();
    v12 = (void *)[v9 initWithArray:v11];

    v13 = (void *)[v12 mutableCopy];
    [v13 minusOrderedSet:v8];
    if ([v13 count])
    {
      v14 = [(PUWallpaperPosterShuffleGridViewController *)self photoLibrary];
      v15 = [v14 librarySpecificFetchOptions];

      v16 = (void *)MEMORY[0x1E4F38EB8];
      v17 = [v13 array];
      v18 = [v16 fetchAssetsWithLocalIdentifiers:v17 options:v15];
      v19 = PXMap();

      v20 = (void *)[v8 mutableCopy];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __70__PUWallpaperPosterShuffleGridViewController_picker_didFinishPicking___block_invoke_4;
      v27[3] = &unk_1E5F23C50;
      id v28 = v19;
      id v21 = v20;
      id v29 = v21;
      id v22 = v19;
      [v13 enumerateObjectsUsingBlock:v27];
      id v23 = v21;

      v8 = v23;
    }
    id v24 = objc_alloc(MEMORY[0x1E4F1CAA0]);
    v25 = PXMap();
    v26 = (void *)[v24 initWithArray:v25];
    [(PUWallpaperPosterShuffleGridViewController *)self setPosterMedia:v26];
  }
}

void __70__PUWallpaperPosterShuffleGridViewController_picker_didFinishPicking___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

id __70__PUWallpaperPosterShuffleGridViewController_picker_didFinishPicking___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F8CD18];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [MEMORY[0x1E4F38EB8] uuidFromLocalIdentifier:v3];

  id v6 = (void *)[v4 initWithAssetUUID:v5];
  return v6;
}

uint64_t __70__PUWallpaperPosterShuffleGridViewController_picker_didFinishPicking___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

id __70__PUWallpaperPosterShuffleGridViewController_picker_didFinishPicking___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F38EB8];
  id v3 = [a2 assetUUID];
  id v4 = [v2 localIdentifierWithUUID:v3];

  return v4;
}

uint64_t __70__PUWallpaperPosterShuffleGridViewController_picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assetIdentifier];
}

- (CGRect)preferredCropForAsset:(id)a3 withAspectRatio:(double)a4
{
  id v4 = a3;
  double v5 = *MEMORY[0x1E4F91340];
  double v6 = *(double *)(MEMORY[0x1E4F91340] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F91340] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F91340] + 24);
  id v9 = v4;
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = 0;
    v17 = v9;
LABEL_9:

    goto LABEL_10;
  }
  id v10 = v9;

  if (v10)
  {
    v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v11 bounds];
    double v13 = v12;
    double v15 = v14;

    if (v13 <= v15) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = 2;
    }
    v17 = [MEMORY[0x1E4F8CCB0] deviceConfigurationForOrientation:v16];
    [MEMORY[0x1E4F8E858] bestWallpaperCropForAsset:v10 classification:0 outputCropScore:0 outputLayoutAcceptable:0 layoutConfiguration:v17];
    double v5 = v18;
    double v6 = v19;
    double v7 = v20;
    double v8 = v21;
    goto LABEL_9;
  }
LABEL_10:

  double v22 = v5;
  double v23 = v6;
  double v24 = v7;
  double v25 = v8;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)allowsContextMenuInteractionForPhotosViewController:(id)a3
{
  return 0;
}

- (BOOL)photosViewController:(id)a3 didPickAssetReference:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 asset];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [(PUWallpaperPosterShuffleGridViewController *)self posterMedia];
    id v14 = v9;
    v11 = PXFind();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"PUWallpaperPosterShuffleGridViewController.m" lineNumber:478 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    v11 = [v9 posterMedia];
  }
  [(PUWallpaperPosterShuffleGridViewController *)self _finishWithSelectedPosterMedia:v11];

  return 1;
}

uint64_t __89__PUWallpaperPosterShuffleGridViewController_photosViewController_didPickAssetReference___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 assetUUID];
  id v4 = [*(id *)(a1 + 32) uuid];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (UIEdgeInsets)maskPaddingForContentController:(id)a3
{
  double v3 = *MEMORY[0x1E4F91320];
  double v4 = *(double *)(MEMORY[0x1E4F91320] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F91320] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F91320] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (BOOL)photosContentController:(id)a3 pushViewController:(id)a4
{
  id v5 = a4;
  double v6 = [(PUWallpaperPosterShuffleGridViewController *)self navigationController];

  if (v6)
  {
    id v7 = [(PUWallpaperPosterShuffleGridViewController *)self navigationController];
    [v7 pushViewController:v5 animated:1];
  }
  return v6 != 0;
}

- (void)dismissPresentedViewControllerForContentController:(id)a3
{
}

- (BOOL)photosContentController:(id)a3 presentViewController:(id)a4
{
  return 1;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)GridViewModelObservationContext != a5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PUWallpaperPosterShuffleGridViewController.m" lineNumber:430 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 6) != 0)
  {
    id v11 = v9;
    [(PUWallpaperPosterShuffleGridViewController *)self _invalidateBarItems];
    id v9 = v11;
  }
}

- (id)_fetchResultWithAssetsFetchedFromPosterMedia:(id)a3
{
  id v4 = a3;
  id v5 = PXMap();
  char v6 = [(PUWallpaperPosterShuffleGridViewController *)self photoLibrary];
  id v7 = [v6 librarySpecificFetchOptions];

  id v8 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v5 options:v7];
  id v9 = [v8 fetchedObjects];

  id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v11 = PXMap();
  double v12 = (void *)[v10 initWithObjects:v9 forKeys:v11];

  v17 = v12;
  id v13 = v12;
  id v14 = PXMap();

  double v15 = PXDisplayAssetFetchResultFromArray();

  return v15;
}

PUPosterMediaDisplayAsset *__91__PUWallpaperPosterShuffleGridViewController__fetchResultWithAssetsFetchedFromPosterMedia___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 assetUUID];
  char v6 = [v4 objectForKeyedSubscript:v5];
  id v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = [[PUPosterMediaDisplayAsset alloc] initWithPosterMedia:v3];
  }
  id v9 = v8;

  return v9;
}

uint64_t __91__PUWallpaperPosterShuffleGridViewController__fetchResultWithAssetsFetchedFromPosterMedia___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

id __91__PUWallpaperPosterShuffleGridViewController__fetchResultWithAssetsFetchedFromPosterMedia___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F38EB8];
  id v3 = [a2 assetUUID];
  id v4 = [v2 localIdentifierWithUUID:v3];

  return v4;
}

- (void)_updateBarItems
{
  v23[3] = *MEMORY[0x1E4F143B8];
  [(PUWallpaperPosterShuffleGridViewController *)self _createBarButtonItemsIfNeeded];
  id v3 = [(PUWallpaperPosterShuffleGridViewController *)self gridViewModel];
  id v4 = [v3 selectionSnapshot];
  int v5 = [v3 isInSelectMode];
  int v6 = [v4 isAnyItemSelected];
  int v7 = [v4 areAllItemsSelected];
  id v8 = [v4 selectedIndexPaths];
  uint64_t v9 = [v8 count];

  id v10 = [v3 dataSourceManager];
  id v11 = [v10 dataSource];
  uint64_t v12 = [v11 totalNumberOfItems];

  if (v5)
  {
    if (v6)
    {
      id v13 = PULocalizedString(@"REVIEW_COUNT_SELECTED_TITLE_TEXT");
      uint64_t v21 = v9;
      id v14 = PULocalizedStringWithValidatedFormat(v13, @"%lu");

      double v15 = &OBJC_IVAR___PUWallpaperPosterShuffleGridViewController__removePhotosBarButtonItem;
    }
    else
    {
      id v14 = PXLocalizedString();
      double v15 = &OBJC_IVAR___PUWallpaperPosterShuffleGridViewController__exitSelectModeBarButtonItem;
    }
    p_selectAllBarButtonItem = &self->_selectAllBarButtonItem;
    -[UIBarButtonItem setEnabled:](self->_selectAllBarButtonItem, "setEnabled:", v12 > 0, v21);
    v23[0] = *(Class *)((char *)&self->super.super.super.isa + *v15);
    v17 = [MEMORY[0x1E4FB14A8] flexibleSpaceItem];
    v23[1] = v17;
    if (v7) {
      p_selectAllBarButtonItem = &self->_deselectAllBarButtonItem;
    }
    double v18 = v23;
  }
  else
  {
    id v14 = PLLocalizedCountDescription();
    [(UIBarButtonItem *)self->_addPhotosBarButtonItem setEnabled:[(PUWallpaperPosterShuffleGridViewController *)self _canAddMorePhotos]];
    p_selectAllBarButtonItem = &self->_enterSelectModeBarButtonItem;
    [(UIBarButtonItem *)self->_enterSelectModeBarButtonItem setEnabled:v12 > 0];
    [(UIBarButtonItem *)self->_doneBarButtonItem setEnabled:v12 > 0];
    v22[0] = self->_addPhotosBarButtonItem;
    v17 = [MEMORY[0x1E4FB14A8] flexibleSpaceItem];
    v22[1] = v17;
    double v18 = v22;
  }
  v18[2] = *p_selectAllBarButtonItem;
  double v19 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");

  double v20 = [(PUWallpaperPosterShuffleGridViewController *)self navigationItem];
  [v20 setRightBarButtonItem:self->_doneBarButtonItem];

  [(PUWallpaperPosterShuffleGridViewController *)self setToolbarItems:v19 animated:1];
  [(PUWallpaperPosterShuffleGridViewController *)self setTitle:v14];
}

- (void)_invalidateBarItems
{
}

- (void)_updateDataSource
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(PUWallpaperPosterShuffleGridViewController *)self posterMedia];
  int v5 = (void *)MEMORY[0x1E4F38EE8];
  int v6 = [(PUWallpaperPosterShuffleGridViewController *)self photoLibrary];
  int v7 = [v5 transientAssetCollectionWithAssets:MEMORY[0x1E4F1CBF0] title:0 identifier:0 photoLibrary:v6];

  id v8 = [(PUWallpaperPosterShuffleGridViewController *)self _fetchResultWithAssetsFetchedFromPosterMedia:v4];
  id v9 = objc_alloc(MEMORY[0x1E4F906E8]);
  v29[0] = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  id v28 = v8;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  uint64_t v12 = (void *)[v9 initWithAssetCollectionBySection:v10 assetsBySection:v11 curatedAssetsBySection:0 keyAssetsBySection:0 sectionContent:0];

  id v13 = [(PUWallpaperPosterShuffleGridViewController *)self gridContentController];
  if (!v13)
  {
    double v15 = (void *)[objc_alloc(MEMORY[0x1E4F903E8]) initWithDataSource:v12];
    id v16 = objc_alloc(MEMORY[0x1E4F90598]);
    v17 = [(PUWallpaperPosterShuffleGridViewController *)self mediaProvider];
    double v18 = (void *)[v16 initWithDataSourceManager:v15 mediaProvider:v17 selectionManager:0 assetActionManager:0 assetCollectionActionManager:0];

    [v18 setDelegate:self];
    [v18 setIsEmbedded:1];
    [v18 setIgnoreContentFilterStateWhenNotFiltering:1];
    [v18 setSectionBodyStyle:1];
    [v18 setGridStyle:0];
    [v18 setNavBarStyle:5];
    [v18 setAllowsUserDefaults:0];
    [v18 setAllowsDragOut:0];
    [v18 setAllowsDragIn:0];
    [v18 setForbiddenBadges:0];
    [v18 setItemAspectRatio:*MEMORY[0x1E4F90FF8]];
    [v18 setPreferredAssetCropDelegate:self];
    [v18 setAllowedActions:*MEMORY[0x1E4F90FF0] & 0xFFFFFFFFFFFFFFFELL ^ 0x81];
    [v18 setAllowedBehaviors:0];
    id v19 = objc_alloc(MEMORY[0x1E4F904F8]);
    double v20 = [(PUWallpaperPosterShuffleGridViewController *)self px_extendedTraitCollection];
    uint64_t v21 = (void *)[v19 initWithConfiguration:v18 traitCollection:v20];
    [(PUWallpaperPosterShuffleGridViewController *)self setGridContentController:v21];

    goto LABEL_6;
  }
  id v14 = [(PUWallpaperPosterShuffleGridViewController *)self gridViewModel];
  double v15 = [v14 dataSourceManager];

  if (!v15)
  {
    double v22 = [MEMORY[0x1E4F28B00] currentHandler];
    double v23 = (objc_class *)objc_opt_class();
    double v24 = NSStringFromClass(v23);
    [v22 handleFailureInMethod:a2, self, @"PUWallpaperPosterShuffleGridViewController.m", 349, @"%@ should be an instance inheriting from %@, but it is nil", @"self.gridViewModel.dataSourceManager", v24 object file lineNumber description];
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    double v25 = (objc_class *)objc_opt_class();
    double v24 = NSStringFromClass(v25);
    v26 = objc_msgSend(v15, "px_descriptionForAssertionMessage");
    double v22 = v27;
    [v27 handleFailureInMethod:a2, self, @"PUWallpaperPosterShuffleGridViewController.m", 349, @"%@ should be an instance inheriting from %@, but it is %@", @"self.gridViewModel.dataSourceManager", v24, v26 object file lineNumber description];

    goto LABEL_9;
  }
LABEL_4:
  [v15 setDataSource:v12 changeDetails:0];
LABEL_6:
}

- (void)_invalidateDataSource
{
}

- (void)_setNeedsUpdate
{
  id v2 = [(PUWallpaperPosterShuffleGridViewController *)self view];
  [v2 setNeedsLayout];
}

- (void)_handleDeselectAll:(id)a3
{
  id v3 = [(PUWallpaperPosterShuffleGridViewController *)self gridViewModel];
  [v3 performChanges:&__block_literal_global_304];
}

uint64_t __65__PUWallpaperPosterShuffleGridViewController__handleDeselectAll___block_invoke(uint64_t a1, void *a2)
{
  return [a2 deselectAll];
}

- (void)_handleSelectAll:(id)a3
{
  id v3 = [(PUWallpaperPosterShuffleGridViewController *)self gridViewModel];
  [v3 performChanges:&__block_literal_global_302];
}

uint64_t __63__PUWallpaperPosterShuffleGridViewController__handleSelectAll___block_invoke(uint64_t a1, void *a2)
{
  return [a2 selectAll];
}

- (void)_handleEnterSelectMode:(id)a3
{
  id v3 = [(PUWallpaperPosterShuffleGridViewController *)self gridViewModel];
  [v3 performChanges:&__block_literal_global_300];
}

uint64_t __69__PUWallpaperPosterShuffleGridViewController__handleEnterSelectMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsInSelectMode:1];
}

- (void)_handleRemovePhotos:(id)a3
{
  int v5 = [(PUWallpaperPosterShuffleGridViewController *)self posterMedia];
  int v6 = (void *)[v5 mutableCopy];

  int v7 = [(PUWallpaperPosterShuffleGridViewController *)self gridViewModel];
  id v8 = [v7 selectionSnapshot];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__PUWallpaperPosterShuffleGridViewController__handleRemovePhotos___block_invoke;
  v11[3] = &unk_1E5F23BB8;
  id v12 = v6;
  SEL v13 = a2;
  v11[4] = self;
  id v9 = v6;
  [v8 enumerateSelectedObjectsUsingBlock:v11];
  id v10 = (void *)[v9 copy];
  [(PUWallpaperPosterShuffleGridViewController *)self setPosterMedia:v10];

  [(PUWallpaperPosterShuffleGridViewController *)self _exitSelectMode];
}

void __66__PUWallpaperPosterShuffleGridViewController__handleRemovePhotos___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_4:
        int v5 = [v4 posterMedia];
        int v6 = [v5 assetUUID];

        goto LABEL_9;
      }
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v17 = *(void *)(a1 + 32);
      double v18 = (objc_class *)objc_opt_class();
      double v15 = NSStringFromClass(v18);
      id v19 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
      [v11 handleFailureInMethod:v16, v17, @"PUWallpaperPosterShuffleGridViewController.m", 259, @"%@ should be an instance inheriting from %@, but it is %@", @"object", v15, v19 object file lineNumber description];
    }
    else
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = *(void *)(a1 + 48);
      uint64_t v13 = *(void *)(a1 + 32);
      id v14 = (objc_class *)objc_opt_class();
      double v15 = NSStringFromClass(v14);
      [v11 handleFailureInMethod:v12, v13, @"PUWallpaperPosterShuffleGridViewController.m", 259, @"%@ should be an instance inheriting from %@, but it is nil", @"object", v15 object file lineNumber description];
    }

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  id v7 = v3;
  if (!v7)
  {
    double v20 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v21 = *(void *)(a1 + 48);
    uint64_t v22 = *(void *)(a1 + 32);
    double v23 = (objc_class *)objc_opt_class();
    double v24 = NSStringFromClass(v23);
    [v20 handleFailureInMethod:v21, v22, @"PUWallpaperPosterShuffleGridViewController.m", 261, @"%@ should be an instance inheriting from %@, but it is nil", @"object", v24 object file lineNumber description];
LABEL_17:

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v20 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v25 = *(void *)(a1 + 48);
    uint64_t v26 = *(void *)(a1 + 32);
    v27 = (objc_class *)objc_opt_class();
    double v24 = NSStringFromClass(v27);
    id v28 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v20 handleFailureInMethod:v25, v26, @"PUWallpaperPosterShuffleGridViewController.m", 261, @"%@ should be an instance inheriting from %@, but it is %@", @"object", v24, v28 object file lineNumber description];

    goto LABEL_17;
  }
LABEL_8:
  int v6 = [v7 uuid];
LABEL_9:

  if (v6)
  {
    id v8 = *(void **)(a1 + 40);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    void v29[2] = __66__PUWallpaperPosterShuffleGridViewController__handleRemovePhotos___block_invoke_2;
    v29[3] = &unk_1E5F26918;
    id v30 = v6;
    id v9 = v6;
    id v10 = [v8 indexesOfObjectsPassingTest:v29];
    [*(id *)(a1 + 40) removeObjectsAtIndexes:v10];
  }
LABEL_11:
}

uint64_t __66__PUWallpaperPosterShuffleGridViewController__handleRemovePhotos___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 assetUUID];
  id v4 = v3;
  if (v3 == *(void **)(a1 + 32)) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = objc_msgSend(v3, "isEqualToString:");
  }

  return v5;
}

- (void)_handleAddPhotos:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F39930]);
  uint64_t v5 = [(PUWallpaperPosterShuffleGridViewController *)self photoLibrary];
  id v11 = (id)[v4 initWithPhotoLibraryAndOnlyReturnsIdentifiers:v5];

  int v6 = [(PUWallpaperPosterShuffleGridViewController *)self posterMedia];
  id v7 = PXMap();
  [v11 setPreselectedAssetIdentifiers:v7];

  [v11 setSelectionLimit:50];
  id v8 = [MEMORY[0x1E4F39938] imagesFilter];
  [v11 setFilter:v8];

  [v11 setDisabledCapabilities:18];
  [v11 _setDisabledPrivateCapabilities:268];
  id v9 = [MEMORY[0x1E4F399C0] shuffleWallpaperSuggestionGroup];
  objc_msgSend(v11, "set_suggestionGroup:", v9);

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F39948]) initWithConfiguration:v11];
  [v10 setDelegate:self];
  [(PUWallpaperPosterShuffleGridViewController *)self presentViewController:v10 animated:1 completion:0];
}

id __63__PUWallpaperPosterShuffleGridViewController__handleAddPhotos___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F38EB8];
  id v3 = [a2 assetUUID];
  id v4 = [v2 localIdentifierWithUUID:v3];

  return v4;
}

- (void)_handleDone:(id)a3
{
}

- (void)_finishWithSelectedPosterMedia:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUWallpaperPosterShuffleGridViewController *)self posterMedia];
  int v6 = [(PUWallpaperPosterShuffleGridViewController *)self initialPosterMedia];
  id v8 = [v5 differenceFromOrderedSet:v6];

  id v7 = [(PUWallpaperPosterShuffleGridViewController *)self delegate];
  [v7 wallpaperPosterShuffleGridViewController:self didFinishWithChange:v8 selectedPosterMedia:v4];
}

- (void)_exitSelectMode
{
  id v2 = [(PUWallpaperPosterShuffleGridViewController *)self gridViewModel];
  [v2 performChanges:&__block_literal_global_13750];
}

uint64_t __61__PUWallpaperPosterShuffleGridViewController__exitSelectMode__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsInSelectMode:0];
}

- (BOOL)_canAddMorePhotos
{
  id v2 = [(PUWallpaperPosterShuffleGridViewController *)self posterMedia];
  BOOL v3 = (unint64_t)[v2 count] < 0x32;

  return v3;
}

- (void)_createBarButtonItemsIfNeeded
{
  if (!self->_doneBarButtonItem)
  {
    BOOL v3 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__handleDone_];
    doneBarButtonItem = self->_doneBarButtonItem;
    self->_doneBarButtonItem = v3;

    id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
    int v6 = PULocalizedString(@"PHOTOS_WALLPAPER_PICKER_ADD_PHOTOS_BUTTON_TITLE");
    id v7 = (UIBarButtonItem *)[v5 initWithTitle:v6 style:0 target:self action:sel__handleAddPhotos_];
    addPhotosBarButtonItem = self->_addPhotosBarButtonItem;
    self->_addPhotosBarButtonItem = v7;

    id v9 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
    id v11 = (UIBarButtonItem *)[v9 initWithImage:v10 style:0 target:self action:sel__handleRemovePhotos_];
    removePhotosBarButtonItem = self->_removePhotosBarButtonItem;
    self->_removePhotosBarButtonItem = v11;

    objc_msgSend(MEMORY[0x1E4FB14A8], "px_localizedSelectBarButtonItem");
    uint64_t v13 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    enterSelectModeBarButtonItem = self->_enterSelectModeBarButtonItem;
    self->_enterSelectModeBarButtonItem = v13;

    [(UIBarButtonItem *)self->_enterSelectModeBarButtonItem setTarget:self];
    [(UIBarButtonItem *)self->_enterSelectModeBarButtonItem setAction:sel__handleEnterSelectMode_];
    double v15 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__handleExitSelectMode_];
    exitSelectModeBarButtonItem = self->_exitSelectModeBarButtonItem;
    self->_exitSelectModeBarButtonItem = v15;

    objc_msgSend(MEMORY[0x1E4FB14A8], "px_localizedSelectAllBarButtonItem");
    uint64_t v17 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    selectAllBarButtonItem = self->_selectAllBarButtonItem;
    self->_selectAllBarButtonItem = v17;

    [(UIBarButtonItem *)self->_selectAllBarButtonItem setTarget:self];
    [(UIBarButtonItem *)self->_selectAllBarButtonItem setAction:sel__handleSelectAll_];
    objc_msgSend(MEMORY[0x1E4FB14A8], "px_localizedDeselectAllBarButtonItem");
    id v19 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
    deselectAllBarButtonItem = self->_deselectAllBarButtonItem;
    self->_deselectAllBarButtonItem = v19;

    [(UIBarButtonItem *)self->_deselectAllBarButtonItem setTarget:self];
    uint64_t v21 = self->_deselectAllBarButtonItem;
    [(UIBarButtonItem *)v21 setAction:sel__handleDeselectAll_];
  }
}

- (void)setGridViewModel:(id)a3
{
  id v8 = (PXPhotosViewModel *)a3;
  p_gridViewModel = &self->_gridViewModel;
  int v6 = self->_gridViewModel;
  if (v6 == v8)
  {
  }
  else
  {
    char v7 = [(PXPhotosViewModel *)v8 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      [(PXPhotosViewModel *)*p_gridViewModel unregisterChangeObserver:self context:GridViewModelObservationContext];
      objc_storeStrong((id *)&self->_gridViewModel, a3);
      [(PXPhotosViewModel *)*p_gridViewModel registerChangeObserver:self context:GridViewModelObservationContext];
      [(PUWallpaperPosterShuffleGridViewController *)self _invalidateBarItems];
    }
  }
}

- (void)setTungstenLayout:(id)a3
{
  id v4 = a3;
  tungstenView = self->_tungstenView;
  id v16 = v4;
  if (!tungstenView)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F90240]);
    char v7 = [(PUWallpaperPosterShuffleGridViewController *)self view];
    [v7 bounds];
    id v8 = (PXGView *)objc_msgSend(v6, "initWithFrame:");
    id v9 = self->_tungstenView;
    self->_tungstenView = v8;

    [(PXGView *)self->_tungstenView setAutoresizingMask:18];
    id v10 = self->_tungstenView;
    id v11 = [(PUWallpaperPosterShuffleGridViewController *)self mediaProvider];
    [(PXGView *)v10 registerAllTextureProvidersWithMediaProvider:v11];

    uint64_t v12 = [(PXGView *)self->_tungstenView scrollViewController];
    uint64_t v13 = [v12 scrollView];

    [(PUWallpaperPosterShuffleGridViewController *)self setContentScrollView:v13 forEdge:5];
    id v4 = v16;
    tungstenView = self->_tungstenView;
  }
  [(PXGView *)tungstenView setRootLayout:v4];
  id v14 = [(PXGView *)self->_tungstenView superview];

  if (!v14)
  {
    double v15 = [(PUWallpaperPosterShuffleGridViewController *)self view];
    [v15 addSubview:self->_tungstenView];
  }
}

- (void)setGridContentController:(id)a3
{
  id v10 = (PXPhotosContentController *)a3;
  p_gridContentController = &self->_gridContentController;
  id v6 = self->_gridContentController;
  char v7 = v10;
  if (v6 != v10)
  {
    char v8 = [(PXPhotosContentController *)v10 isEqual:v6];

    if (v8) {
      goto LABEL_5;
    }
    [(PXPhotosContentController *)*p_gridContentController setDelegate:0];
    objc_storeStrong((id *)&self->_gridContentController, a3);
    [(PXPhotosContentController *)*p_gridContentController setDelegate:self];
    id v9 = [(PXPhotosContentController *)*p_gridContentController layout];
    [(PUWallpaperPosterShuffleGridViewController *)self setTungstenLayout:v9];

    char v7 = [(PXPhotosContentController *)*p_gridContentController viewModel];
    [(PUWallpaperPosterShuffleGridViewController *)self setGridViewModel:v7];
  }

LABEL_5:
}

- (void)setPosterMedia:(id)a3
{
  char v8 = (NSOrderedSet *)a3;
  id v4 = self->_posterMedia;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSOrderedSet *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSOrderedSet *)[(NSOrderedSet *)v8 copy];
      posterMedia = self->_posterMedia;
      self->_posterMedia = v6;

      [(PUWallpaperPosterShuffleGridViewController *)self _invalidateDataSource];
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUWallpaperPosterShuffleGridViewController;
  -[PUWallpaperPosterShuffleGridViewController viewDidDisappear:](&v6, sel_viewDidDisappear_);
  char v5 = [(PUWallpaperPosterShuffleGridViewController *)self gridContentController];
  [v5 contentViewDidDisappear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUWallpaperPosterShuffleGridViewController;
  -[PUWallpaperPosterShuffleGridViewController viewDidAppear:](&v6, sel_viewDidAppear_);
  char v5 = [(PUWallpaperPosterShuffleGridViewController *)self gridContentController];
  [v5 contentViewDidAppear:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUWallpaperPosterShuffleGridViewController;
  -[PUWallpaperPosterShuffleGridViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  char v5 = [(PUWallpaperPosterShuffleGridViewController *)self gridContentController];
  [v5 contentViewWillAppear:v3];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUWallpaperPosterShuffleGridViewController;
  [(PUWallpaperPosterShuffleGridViewController *)&v3 viewWillLayoutSubviews];
  [(PXUpdater *)self->_updater updateIfNeeded];
}

- (PUWallpaperPosterShuffleGridViewController)initWithResourceManager:(id)a3 posterMedia:(id)a4
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PUWallpaperPosterShuffleGridViewController;
  char v8 = [(PUWallpaperPosterShuffleGridViewController *)&v31 initWithNibName:0 bundle:0];
  id v9 = v8;
  if (v8)
  {
    [(PUWallpaperPosterShuffleGridViewController *)v8 setModalInPresentation:1];
    uint64_t v10 = [v6 assetDirectory];
    posterMediaDirectory = v9->_posterMediaDirectory;
    v9->_posterMediaDirectory = (NSURL *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v7];
    initialPosterMedia = v9->_initialPosterMedia;
    v9->_initialPosterMedia = (NSOrderedSet *)v12;

    objc_storeStrong((id *)&v9->_posterMedia, v9->_initialPosterMedia);
    uint64_t v14 = [v6 photoLibrary];
    photoLibrary = v9->_photoLibrary;
    v9->_photoLibrary = (PHPhotoLibrary *)v14;

    id v16 = [[PUWallpaperShuffleMediaProvider alloc] initWithResourceManager:v6];
    id v17 = objc_alloc(MEMORY[0x1E4F902F0]);
    double v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    v32[0] = v19;
    v33[0] = v16;
    double v20 = (objc_class *)objc_opt_class();
    uint64_t v21 = NSStringFromClass(v20);
    v32[1] = v21;
    uint64_t v22 = (void *)MEMORY[0x1E4F904E0];
    double v23 = [(PUWallpaperPosterShuffleGridViewController *)v9 photoLibrary];
    double v24 = [v22 mediaProviderWithLibrary:v23];
    v33[1] = v24;
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    uint64_t v26 = [v17 initWithMediaProvidersByAssetClassName:v25];
    mediaProvider = v9->_mediaProvider;
    v9->_mediaProvider = (PXMediaProvider *)v26;

    uint64_t v28 = [objc_alloc(MEMORY[0x1E4F912F8]) initWithTarget:v9 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v9->_updater;
    v9->_updater = (PXUpdater *)v28;

    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updateDataSource needsUpdate:1];
    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updateBarItems needsUpdate:1];
    [(PUWallpaperPosterShuffleGridViewController *)v9 px_enableExtendedTraitCollection];
  }
  return v9;
}

- (PUWallpaperPosterShuffleGridViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUWallpaperPosterShuffleGridViewController.m", 90, @"%s is not available as initializer", "-[PUWallpaperPosterShuffleGridViewController initWithCoder:]");

  abort();
}

- (PUWallpaperPosterShuffleGridViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUWallpaperPosterShuffleGridViewController.m", 86, @"%s is not available as initializer", "-[PUWallpaperPosterShuffleGridViewController initWithNibName:bundle:]");

  abort();
}

@end