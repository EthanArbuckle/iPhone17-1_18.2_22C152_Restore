@interface PUPickerCoordinator
+ (BOOL)_assetCanPlay:(id)a3;
+ (BOOL)_editingEnabled:(id)a3;
+ (BOOL)_shouldTreatAssetAsLivePhoto:(id)a3 photoPicker:(id)a4 configuration:(id)a5;
+ (BOOL)_skipSelectionConfirmation:(id)a3;
+ (BOOL)_viewImageBeforeSelectingEnabled:(id)a3;
+ (BOOL)pu_legacy_shouldDownloadVideoComplement:(id)a3 configuration:(id)a4;
+ (id)_extraArgumentsForResizeTaskDescriptor:(id)a3;
+ (void)_logPhotosPickerPresentedForClientWithConfiguration:(id)a3 usingOptions:(int64_t)a4;
+ (void)_updateSelectionCoordinatorLimit:(id)a3 configuration:(id)a4;
- (BOOL)assetExplorerReviewScreenViewController:(id)a3 canPerformActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6;
- (BOOL)isShowingLiveWallpaperSuggestions;
- (BOOL)popViewController;
- (BOOL)selectionDidChange;
- (NSMutableDictionary)activityIndicatorTrackingIDs;
- (NSMutableDictionary)downloadProgresses;
- (PUPhotoPicker)photoPicker;
- (PUPhotoPickerResizeTaskDescriptorViewModel)resizeTaskDescriptorViewModel;
- (PUPhotosGridDownloadHelper)downloadHelper;
- (PUPickerActivityProgressController)progressController;
- (PUPickerAdditionalSelectionState)additionalSelectionState;
- (PUPickerConfiguration)configuration;
- (PUPickerCoordinator)init;
- (PUPickerCoordinator)initWithConfiguration:(id)a3 coordinatorActionHandler:(id)a4 loadingStatusManager:(id)a5;
- (PUPickerCoordinator)initWithPHConfiguration:(id)a3 coordinatorActionHandler:(id)a4 loadingStatusManager:(id)a5;
- (PUPickerCoordinator)initWithPUConfiguration:(id)a3 coordinatorActionHandler:(id)a4 loadingStatusManager:(id)a5;
- (PUPickerCoordinator)initWithPhotoPicker:(id)a3 mediaTypes:(id)a4 connection:(id)a5;
- (PUPickerCoordinatorActionHandler)coordinatorActionHandler;
- (PUPickerManagedViewController)managedViewController;
- (PXLoadingStatusManager)loadingStatusManager;
- (PXSelectionCoordinator)selectionCoordinator;
- (id)_createFetchResultUsingSelectedObjectIDs;
- (id)_fileSizeActionsForAssets:(id)a3;
- (id)assetExplorerReviewScreenViewController:(id)a3 fileSizeMenuForSelectedUUIDs:(id)a4;
- (id)assetsForResizing;
- (id)beginShowingProgressForAsset:(id)a3 inCollection:(id)a4;
- (id)imageViewControllerFileSizeMenuActions:(id)a3;
- (id)ppt_scrollTestViewController;
- (id)selectionDidChangeObserver;
- (void)_completeMultipleSelection:(id)a3;
- (void)_completeSingleSelection:(id)a3 showConfirmation:(BOOL)a4;
- (void)_logPhotosAccessWithNonEmptyUserSelection;
- (void)_presentAssetExplorer;
- (void)_presentViewControllerDismissingPresentedViewControllerIfNeeded:(id)a3;
- (void)_serviceContextDidBecomeInsecure;
- (void)assetExplorerReviewScreenViewController:(id)a3 didPerformCompletionAction:(unint64_t)a4 withSelectedAssetUUIDs:(id)a5 livePhotoDisabledAssetUUIDs:(id)a6 substituteAssetsByUUID:(id)a7;
- (void)assetExplorerReviewScreenViewControllerDidPressCancel:(id)a3;
- (void)cancelProgressController;
- (void)containerController:(id)a3 didTapAddButton:(id)a4;
- (void)containerController:(id)a3 didTapBatchedItems:(id)a4;
- (void)containerController:(id)a3 didTapCancelButton:(id)a4;
- (void)containerController:(id)a3 didTapClearButton:(id)a4;
- (void)containerController:(id)a3 didTapShowSelectedButton:(id)a4;
- (void)containerControllerDidAppear:(id)a3;
- (void)containerControllerWantsToLearnMoreAboutDataAccess:(id)a3;
- (void)deselectAssetsWithIdentifiers:(id)a3;
- (void)emitDidFinishPickingAnalytics;
- (void)endShowingProgressWithIdentifier:(id)a3 succeeded:(BOOL)a4 canceled:(BOOL)a5 error:(id)a6;
- (void)imageViewControllerDidCancel:(id)a3;
- (void)imageViewControllerDidConfirmSelection:(id)a3;
- (void)makeSearchBarAsFirstResponder;
- (void)moveAssetWithIdentifier:(id)a3 afterIdentifier:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)presentAlertController:(id)a3;
- (void)presentProgressControllerFromViewController:(id)a3 progress:(id)a4;
- (void)pu_legacy_cancelPicker;
- (void)pu_legacy_didDisplayPicker;
- (void)pu_legacy_selectMultipleAssets:(id)a3;
- (void)pu_legacy_selectSingleAsset;
- (void)pu_legacy_selectSingleAssetWithFileResizing;
- (void)resignSearchBarAsFirstResponder_110426547;
- (void)scrollContentToInitialPosition;
- (void)searchWithString:(id)a3;
- (void)selectionCoordinator:(id)a3 didUpdateSelectedObjectsWithRemovedOIDs:(id)a4 insertedOIDs:(id)a5;
- (void)selectionCoordinator:(id)a3 willUpdateSelectedObjectsForSnapshot:(id)a4 withRemovedIndexes:(id)a5 insertedIndexes:(id)a6;
- (void)setSelectionDidChange:(BOOL)a3;
- (void)setSelectionDidChangeObserver:(id)a3;
- (void)startActivityIndicatorsForAssetsWithFetchResult:(id)a3;
- (void)stopActivityIndicatorsForAssetsWithIdentifiers:(id)a3;
- (void)updateProgressControllerMessage;
- (void)updateProgressWithIdentifier:(id)a3 withValue:(double)a4;
- (void)updateSelectedAssetsWithIdentifiers:(id)a3;
- (void)zoomInContent;
- (void)zoomOutContent;
@end

@implementation PUPickerCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resizeTaskDescriptorViewModel, 0);
  objc_storeStrong((id *)&self->_progressController, 0);
  objc_storeStrong((id *)&self->_downloadProgresses, 0);
  objc_storeStrong((id *)&self->_downloadHelper, 0);
  objc_storeStrong((id *)&self->_activityIndicatorTrackingIDs, 0);
  objc_storeStrong((id *)&self->_additionalSelectionState, 0);
  objc_storeStrong((id *)&self->_selectionCoordinator, 0);
  objc_destroyWeak((id *)&self->_coordinatorActionHandler);
  objc_storeStrong((id *)&self->_managedViewController, 0);
  objc_storeStrong(&self->_selectionDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_photoPicker);
}

- (PUPhotoPickerResizeTaskDescriptorViewModel)resizeTaskDescriptorViewModel
{
  return self->_resizeTaskDescriptorViewModel;
}

- (PUPickerActivityProgressController)progressController
{
  return self->_progressController;
}

- (NSMutableDictionary)downloadProgresses
{
  return self->_downloadProgresses;
}

- (PUPhotosGridDownloadHelper)downloadHelper
{
  return self->_downloadHelper;
}

- (NSMutableDictionary)activityIndicatorTrackingIDs
{
  return self->_activityIndicatorTrackingIDs;
}

- (PUPickerAdditionalSelectionState)additionalSelectionState
{
  return self->_additionalSelectionState;
}

- (PXSelectionCoordinator)selectionCoordinator
{
  return self->_selectionCoordinator;
}

- (PUPickerCoordinatorActionHandler)coordinatorActionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinatorActionHandler);
  return (PUPickerCoordinatorActionHandler *)WeakRetained;
}

- (PUPickerManagedViewController)managedViewController
{
  return self->_managedViewController;
}

- (void)setSelectionDidChange:(BOOL)a3
{
  self->_selectionDidChange = a3;
}

- (BOOL)selectionDidChange
{
  return self->_selectionDidChange;
}

- (void)setSelectionDidChangeObserver:(id)a3
{
}

- (id)selectionDidChangeObserver
{
  return self->_selectionDidChangeObserver;
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (PUPickerConfiguration)configuration
{
  return self->_configuration;
}

- (PUPhotoPicker)photoPicker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoPicker);
  return (PUPhotoPicker *)WeakRetained;
}

- (id)assetsForResizing
{
  v4 = [(PUPickerCoordinator *)self configuration];
  char v5 = [v4 allowsDownload];

  if ((v5 & 1) == 0)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 922, @"Invalid parameter not satisfying: %@", @"self.configuration.allowsDownload" object file lineNumber description];
  }
  v6 = [(PUPickerCoordinator *)self downloadHelper];

  if (!v6)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 923, @"Invalid parameter not satisfying: %@", @"self.downloadHelper" object file lineNumber description];
  }
  v7 = [(PUPickerCoordinator *)self downloadProgresses];

  if (!v7)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 924, @"Invalid parameter not satisfying: %@", @"self.downloadProgresses" object file lineNumber description];
  }
  v8 = [(PUPickerCoordinator *)self progressController];

  if (!v8)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 925, @"Invalid parameter not satisfying: %@", @"self.progressController" object file lineNumber description];
  }
  v9 = [(PUPickerCoordinator *)self _createFetchResultUsingSelectedObjectIDs];
  v10 = [v9 fetchedObjects];

  if ([v10 count])
  {
    v11 = [(PUPickerCoordinator *)self downloadHelper];
    if ([v11 isAnyPickerAssetDownloading:v10]) {
      v12 = 0;
    }
    else {
      v12 = v10;
    }
    id v13 = v12;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)updateProgressControllerMessage
{
  v4 = [(PUPickerCoordinator *)self configuration];
  char v5 = [v4 allowsDownload];

  if ((v5 & 1) == 0)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 888, @"Invalid parameter not satisfying: %@", @"self.configuration.allowsDownload" object file lineNumber description];
  }
  v6 = [(PUPickerCoordinator *)self downloadHelper];

  if (!v6)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 889, @"Invalid parameter not satisfying: %@", @"self.downloadHelper" object file lineNumber description];
  }
  v7 = [(PUPickerCoordinator *)self downloadProgresses];

  if (!v7)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 890, @"Invalid parameter not satisfying: %@", @"self.downloadProgresses" object file lineNumber description];
  }
  v8 = [(PUPickerCoordinator *)self progressController];

  if (!v8)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 891, @"Invalid parameter not satisfying: %@", @"self.progressController" object file lineNumber description];
  }
  v9 = [(PUPickerCoordinator *)self progressController];
  v10 = [v9 progress];

  if (!v10)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 892, @"Invalid parameter not satisfying: %@", @"self.progressController.progress" object file lineNumber description];
  }
  id v36 = [(PUPickerCoordinator *)self progressController];
  v11 = [v36 progress];
  uint64_t v12 = [v11 totalUnitCount];
  if (v12 < 2)
  {
    v18 = [(PUPickerCoordinator *)self progressController];
    v27 = [(PUPickerCoordinator *)self progressController];
    v28 = [v27 progress];
    v29 = [v28 localizedDescription];
    [v18 setMessage:v29];
  }
  else
  {
    uint64_t v13 = v12;
    uint64_t v14 = [v11 completedUnitCount];
    if (v14 < v13) {
      uint64_t v15 = v14 + 1;
    }
    else {
      uint64_t v15 = v13;
    }
    v16 = [(PUPickerCoordinator *)self selectionCoordinator];
    v17 = [v16 selectedObjectIDs];
    v18 = [v17 array];

    v19 = [(PUPickerCoordinator *)self configuration];
    v20 = [v19 generatedFilter];
    v21 = [(PUPickerCoordinator *)self configuration];
    v22 = [v21 photoLibrary];
    uint64_t v23 = [v20 displayAssetMediaTypeConsideringAssetObjectIDs:v18 photoLibrary:v22];

    v24 = @"PICKER_VIEW_DOWNLOADING_ITEMS_ALERT_BODY";
    if (v23 == 2) {
      v24 = @"PICKER_VIEW_DOWNLOADING_VIDEOS_ALERT_BODY";
    }
    if (v23 == 1) {
      v25 = @"PICKER_VIEW_DOWNLOADING_PHOTOS_ALERT_BODY";
    }
    else {
      v25 = v24;
    }
    v26 = PULocalizedString(v25);
    uint64_t v35 = v13;
    v27 = PUStringWithValidatedFormat();

    v28 = [(PUPickerCoordinator *)self progressController];
    [v28 setMessage:v27];
  }
}

- (void)cancelProgressController
{
  v3 = [(PUPickerCoordinator *)self downloadHelper];
  [v3 cancelAllDownloads];

  id v4 = [(PUPickerCoordinator *)self progressController];
  [v4 hideWithCompletion:0];
}

- (void)presentProgressControllerFromViewController:(id)a3 progress:(id)a4
{
  id v12 = a3;
  id v7 = a4;
  if (v12)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 874, @"Invalid parameter not satisfying: %@", @"sourceViewController" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 875, @"Invalid parameter not satisfying: %@", @"progress" object file lineNumber description];

LABEL_3:
  v8 = [(PUPickerCoordinator *)self progressController];
  [v8 setProgress:v7];

  [(PUPickerCoordinator *)self updateProgressControllerMessage];
  v9 = [(PUPickerCoordinator *)self progressController];
  [v9 showFromSourceViewController:v12 completion:0];
}

- (void)_logPhotosAccessWithNonEmptyUserSelection
{
  v2 = [(PUPickerCoordinator *)self configuration];
  id v4 = [v2 pickerClientIdentification];

  if (PLPlatformPhotosAccessLoggingSupported() && v4)
  {
    v3 = [MEMORY[0x1E4F8B998] sharedInstance];
    [v3 logPhotosAccessWithPhotoPickerClientIdentification:v4];
  }
}

- (void)_serviceContextDidBecomeInsecure
{
}

- (id)_createFetchResultUsingSelectedObjectIDs
{
  id v3 = objc_alloc(MEMORY[0x1E4F39150]);
  id v4 = [(PUPickerCoordinator *)self selectionCoordinator];
  char v5 = [v4 selectedObjectIDs];
  uint64_t v6 = [v5 array];
  id v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F1CBF0];
  }
  v9 = [(PUPickerCoordinator *)self configuration];
  v10 = [v9 photoLibrary];
  v11 = (void *)[v3 initWithOids:v8 photoLibrary:v10 fetchType:*MEMORY[0x1E4F39648] fetchPropertySets:0 identifier:0 registerIfNeeded:1];

  return v11;
}

- (id)_fileSizeActionsForAssets:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v14 = (id)objc_opt_new();
  objc_initWeak(&location, self);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  char v5 = +[PUPhotoPickerResizeTaskDescriptor orderedDefaultDescriptors];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v10 = [v9 localizedDescriptionForAssets:v4];
        v11 = (void *)MEMORY[0x1E4FB13F0];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __49__PUPickerCoordinator__fileSizeActionsForAssets___block_invoke;
        v15[3] = &unk_1E5F2D440;
        objc_copyWeak(&v16, &location);
        v15[4] = v9;
        id v12 = [v11 actionWithTitle:v10 image:0 identifier:0 handler:v15];
        [v14 addObject:v12];

        objc_destroyWeak(&v16);
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v6);
  }

  objc_destroyWeak(&location);
  return v14;
}

void __49__PUPickerCoordinator__fileSizeActionsForAssets___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained resizeTaskDescriptorViewModel];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__PUPickerCoordinator__fileSizeActionsForAssets___block_invoke_2;
  v4[3] = &unk_1E5F26008;
  v4[4] = *(void *)(a1 + 32);
  [v3 performChanges:v4];
}

uint64_t __49__PUPickerCoordinator__fileSizeActionsForAssets___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setResizeTaskDescriptor:*(void *)(a1 + 32)];
}

- (void)_presentAssetExplorer
{
  id v23 = [(PUPickerCoordinator *)self _createFetchResultUsingSelectedObjectIDs];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = PXMap();
  char v5 = [v3 setWithArray:v4];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F90508]) initWithAssetFetchResult:v23 options:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F90500]) initWithPhotosDataSourceConfiguration:v6];
  uint64_t v8 = [[PUPhotoKitDataSourceManager alloc] initWithPhotosDataSource:v7];
  v9 = objc_alloc_init(PUPhotoKitMediaProvider);
  v10 = [(PUPickerCoordinator *)self configuration];
  uint64_t v11 = [v10 useSystemBackgroundColorBar];

  id v12 = [(PUPickerCoordinator *)self configuration];
  uint64_t v13 = [v12 generatedFilter];
  uint64_t v14 = [v13 displayAssetMediaType];

  if (v14 == 1)
  {
    uint64_t v15 = 14;
  }
  else
  {
    id v16 = [(PUPickerCoordinator *)self configuration];
    long long v17 = [v16 generatedFilter];
    uint64_t v18 = [v17 displayAssetMediaType];

    if (v18 == 2) {
      uint64_t v15 = 22;
    }
    else {
      uint64_t v15 = 6;
    }
  }
  long long v19 = [PUAssetExplorerReviewScreenViewController alloc];
  long long v20 = [(PUPickerCoordinator *)self resizeTaskDescriptorViewModel];
  LOBYTE(v22) = 1;
  v21 = [(PUAssetExplorerReviewScreenViewController *)v19 initWithDataSourceManager:v8 mediaProvider:v9 reviewAssetProvider:0 initialIndexPath:0 initialSelectedAssetUUIDs:v5 initialDisabledLivePhotoAssetUUIDs:0 selectionCountLimit:0 sourceType:0 lowMemoryMode:v22 reviewBarsModel:0 resizeTaskDescriptorViewModel:v20 options:v15];

  [(PUAssetExplorerReviewScreenViewController *)v21 setDelegate:self];
  [(PUAssetExplorerReviewScreenViewController *)v21 setModalInPresentation:1];
  [(PUAssetExplorerReviewScreenViewController *)v21 setUseSystemBackgroundColorBar:v11];
  [(PUPickerCoordinator *)self _presentViewControllerDismissingPresentedViewControllerIfNeeded:v21];
}

uint64_t __44__PUPickerCoordinator__presentAssetExplorer__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (void)_presentViewControllerDismissingPresentedViewControllerIfNeeded:(id)a3
{
  id v4 = a3;
  char v5 = [(PUPickerCoordinator *)self managedViewController];
  uint64_t v6 = [v5 contentViewController];
  uint64_t v7 = [v6 navigationController];
  uint64_t v8 = [v7 topViewController];

  v9 = [v8 presentedViewController];

  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __87__PUPickerCoordinator__presentViewControllerDismissingPresentedViewControllerIfNeeded___block_invoke;
    v10[3] = &unk_1E5F2ECC8;
    id v11 = v8;
    id v12 = v4;
    [v11 dismissViewControllerAnimated:1 completion:v10];
  }
  else
  {
    [v8 presentViewController:v4 animated:1 completion:0];
  }
}

uint64_t __87__PUPickerCoordinator__presentViewControllerDismissingPresentedViewControllerIfNeeded___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)presentAlertController:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PUPickerCoordinator *)self configuration];
  char v7 = [v6 allowsDownload];

  if ((v7 & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 754, @"Invalid parameter not satisfying: %@", @"self.configuration.allowsDownload" object file lineNumber description];
  }
  uint64_t v8 = [(PUPickerCoordinator *)self downloadHelper];

  if (!v8)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 755, @"Invalid parameter not satisfying: %@", @"self.downloadHelper" object file lineNumber description];
  }
  v9 = [(PUPickerCoordinator *)self managedViewController];
  v10 = [v9 contentViewController];
  id v11 = [v10 navigationController];
  id v12 = [v11 topViewController];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __46__PUPickerCoordinator_presentAlertController___block_invoke;
  v17[3] = &unk_1E5F2ECC8;
  id v18 = v12;
  id v19 = v5;
  id v13 = v5;
  id v14 = v12;
  [v14 dismissViewControllerAnimated:1 completion:v17];
}

uint64_t __46__PUPickerCoordinator_presentAlertController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)endShowingProgressWithIdentifier:(id)a3 succeeded:(BOOL)a4 canceled:(BOOL)a5 error:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = [(PUPickerCoordinator *)self configuration];
  char v12 = [v11 allowsDownload];

  if ((v12 & 1) == 0)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 723, @"Invalid parameter not satisfying: %@", @"self.configuration.allowsDownload" object file lineNumber description];
  }
  id v13 = [(PUPickerCoordinator *)self downloadHelper];

  if (!v13)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 724, @"Invalid parameter not satisfying: %@", @"self.downloadHelper" object file lineNumber description];
  }
  id v14 = [(PUPickerCoordinator *)self downloadProgresses];

  if (!v14)
  {
    long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 725, @"Invalid parameter not satisfying: %@", @"self.downloadProgresses" object file lineNumber description];
  }
  uint64_t v15 = [(PUPickerCoordinator *)self progressController];

  if (!v15)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 726, @"Invalid parameter not satisfying: %@", @"self.progressController" object file lineNumber description];
  }
  uint64_t v22 = v9;
  id v16 = v10;
  id v17 = v9;
  px_dispatch_on_main_queue();
}

void __81__PUPickerCoordinator_endShowingProgressWithIdentifier_succeeded_canceled_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) progressController];
  id v12 = [v2 progress];

  id v3 = [*(id *)(a1 + 32) downloadProgresses];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v12) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      objc_msgSend(v4, "setCompletedUnitCount:", objc_msgSend(v4, "totalUnitCount"));
      [*(id *)(a1 + 32) updateProgressControllerMessage];
    }
    uint64_t v6 = [*(id *)(a1 + 32) downloadProgresses];
    [v6 removeObjectForKey:*(void *)(a1 + 40)];
  }
  int v7 = *(unsigned __int8 *)(a1 + 57);
  uint64_t v8 = [*(id *)(a1 + 32) loadingStatusManager];
  id v9 = v8;
  uint64_t v10 = *(void *)(a1 + 40);
  if (v7) {
    [v8 didCancelLoadOperationWithTrackingID:v10];
  }
  else {
    [v8 didCompleteLoadOperationWithTrackingID:v10 withSuccess:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
  }

  id v11 = [*(id *)(a1 + 32) resizeTaskDescriptorViewModel];
  [v11 performChanges:&__block_literal_global_355];
}

uint64_t __81__PUPickerCoordinator_endShowingProgressWithIdentifier_succeeded_canceled_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 invalidateAssetsForResizing];
}

- (void)updateProgressWithIdentifier:(id)a3 withValue:(double)a4
{
  id v6 = a3;
  int v7 = [(PUPickerCoordinator *)self configuration];
  char v8 = [v7 allowsDownload];

  if ((v8 & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 703, @"Invalid parameter not satisfying: %@", @"self.configuration.allowsDownload" object file lineNumber description];
  }
  id v9 = [(PUPickerCoordinator *)self downloadHelper];

  if (!v9)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 704, @"Invalid parameter not satisfying: %@", @"self.downloadHelper" object file lineNumber description];
  }
  uint64_t v10 = [(PUPickerCoordinator *)self downloadProgresses];

  if (!v10)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 705, @"Invalid parameter not satisfying: %@", @"self.downloadProgresses" object file lineNumber description];
  }
  id v11 = [(PUPickerCoordinator *)self progressController];

  if (!v11)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 706, @"Invalid parameter not satisfying: %@", @"self.progressController" object file lineNumber description];
  }
  id v12 = v6;
  px_dispatch_on_main_queue();
}

void __62__PUPickerCoordinator_updateProgressWithIdentifier_withValue___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) progressController];
  id v7 = [v2 progress];

  id v3 = [*(id *)(a1 + 32) downloadProgresses];
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v7) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    objc_msgSend(v4, "setCompletedUnitCount:", (uint64_t)(*(double *)(a1 + 48) * (double)objc_msgSend(v4, "totalUnitCount")));
    [*(id *)(a1 + 32) updateProgressControllerMessage];
  }
  id v6 = [*(id *)(a1 + 32) loadingStatusManager];
  [v6 didUpdateLoadOperationWithTrackingID:*(void *)(a1 + 40) withProgress:*(double *)(a1 + 48)];
}

- (id)beginShowingProgressForAsset:(id)a3 inCollection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(PUPickerCoordinator *)self configuration];
  char v10 = [v9 allowsDownload];

  if ((v10 & 1) == 0)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 674, @"Invalid parameter not satisfying: %@", @"self.configuration.allowsDownload" object file lineNumber description];
  }
  id v11 = [(PUPickerCoordinator *)self downloadHelper];

  if (!v11)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 675, @"Invalid parameter not satisfying: %@", @"self.downloadHelper" object file lineNumber description];
  }
  id v12 = [(PUPickerCoordinator *)self downloadProgresses];

  if (!v12)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 676, @"Invalid parameter not satisfying: %@", @"self.downloadProgresses" object file lineNumber description];
  }
  id v13 = [(PUPickerCoordinator *)self progressController];

  if (!v13)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 677, @"Invalid parameter not satisfying: %@", @"self.progressController" object file lineNumber description];
  }
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__35474;
  v25 = __Block_byref_object_dispose__35475;
  id v26 = 0;
  id v20 = v7;
  px_dispatch_on_main_queue_sync();
  id v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __65__PUPickerCoordinator_beginShowingProgressForAsset_inCollection___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) loadingStatusManager];
  id v3 = [*(id *)(a1 + 40) uuid];
  uint64_t v4 = [v2 willBeginLoadOperationWithItemIdentifier:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  id v7 = [*(id *)(a1 + 32) progressController];
  id v11 = [v7 progress];

  if (v11)
  {
    id v8 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1000];
    id v9 = [*(id *)(a1 + 32) downloadProgresses];
    [v9 setObject:v8 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

    [v11 addChild:v8 withPendingUnitCount:1];
    [*(id *)(a1 + 32) updateProgressControllerMessage];
  }
  char v10 = [*(id *)(a1 + 32) resizeTaskDescriptorViewModel];
  [v10 performChanges:&__block_literal_global_353];
}

uint64_t __65__PUPickerCoordinator_beginShowingProgressForAsset_inCollection___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 invalidateAssetsForResizing];
}

- (id)assetExplorerReviewScreenViewController:(id)a3 fileSizeMenuForSelectedUUIDs:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = (void *)MEMORY[0x1E4FB16B8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__PUPickerCoordinator_assetExplorerReviewScreenViewController_fileSizeMenuForSelectedUUIDs___block_invoke;
  v15[3] = &unk_1E5F25FC0;
  objc_copyWeak(&v17, &location);
  id v9 = v7;
  id v16 = v9;
  char v10 = [v8 elementWithProvider:v15];
  id v11 = (void *)MEMORY[0x1E4FB1970];
  v19[0] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  id v13 = [v11 menuWithChildren:v12];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v13;
}

void __92__PUPickerCoordinator_assetExplorerReviewScreenViewController_fileSizeMenuForSelectedUUIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  uint64_t v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained configuration];
  id v7 = [v6 photoLibrary];
  id v14 = [v7 librarySpecificFetchOptions];

  id v8 = (void *)MEMORY[0x1E4F38EB8];
  id v9 = [*(id *)(a1 + 32) allObjects];
  char v10 = [v8 fetchAssetsWithUUIDs:v9 options:v14];

  id v11 = objc_loadWeakRetained(v3);
  id v12 = [v10 fetchedObjects];
  id v13 = [v11 _fileSizeActionsForAssets:v12];

  v4[2](v4, v13);
}

- (void)assetExplorerReviewScreenViewController:(id)a3 didPerformCompletionAction:(unint64_t)a4 withSelectedAssetUUIDs:(id)a5 livePhotoDisabledAssetUUIDs:(id)a6 substituteAssetsByUUID:(id)a7
{
  id v33 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (a4)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 637, @"Invalid parameter not satisfying: %@", @"completionAction == PUReviewCompletionActionDone" object file lineNumber description];
  }
  id v16 = [(PUPickerCoordinator *)self configuration];
  int v17 = [v16 isSingleSelection];

  if (v17)
  {
    [(PUPickerCoordinator *)self _logPhotosAccessWithNonEmptyUserSelection];
    id v18 = [(PUPickerCoordinator *)self selectionCoordinator];
    id v19 = [v18 selectedObjectIDs];

    id v20 = [(PUPickerCoordinator *)self coordinatorActionHandler];
    uint64_t v21 = [(PUPickerCoordinator *)self additionalSelectionState];
    [v20 coordinator:self didFinishPicking:v19 additionalSelectionState:v21];
  }
  else
  {
    uint64_t v22 = [v33 initialSelectedAssetUUIDs];
    id v19 = (void *)[v22 mutableCopy];

    [v19 minusSet:v13];
    uint64_t v23 = [(PUPickerCoordinator *)self configuration];
    v24 = [v23 photoLibrary];
    id v20 = [v24 librarySpecificFetchOptions];

    v25 = (void *)MEMORY[0x1E4F38EB8];
    id v26 = [v19 allObjects];
    uint64_t v21 = [v25 fetchAssetsWithUUIDs:v26 options:v20];

    v27 = [(PUPickerCoordinator *)self selectionCoordinator];
    v28 = (void *)MEMORY[0x1E4F1CAA0];
    v29 = [v21 fetchedObjectIDs];
    v30 = [v28 orderedSetWithArray:v29];
    v31 = [MEMORY[0x1E4F1CAA0] orderedSet];
    [v27 modifySelectionWithRemovedOIDs:v30 insertedOIDs:v31];
  }
  [v33 dismissViewControllerAnimated:1 completion:0];
}

- (void)assetExplorerReviewScreenViewControllerDidPressCancel:(id)a3
{
}

- (BOOL)assetExplorerReviewScreenViewController:(id)a3 canPerformActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  LOBYTE(v13) = 1;
  switch(a4)
  {
    case 0uLL:
      id v14 = [(PUPickerCoordinator *)self configuration];
      char v15 = [v14 isSingleSelection];
      goto LABEL_6;
    case 2uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
      LOBYTE(v13) = 0;
      break;
    case 3uLL:
    case 9uLL:
    case 0xAuLL:
      id v14 = [(PUPickerCoordinator *)self configuration];
      int v13 = [v14 isSingleSelection] ^ 1;
      goto LABEL_7;
    case 0xBuLL:
      id v14 = [(PUPickerCoordinator *)self configuration];
      char v15 = [v14 allowsDownscaling];
LABEL_6:
      LOBYTE(v13) = v15;
LABEL_7:

      break;
    default:
      break;
  }

  return v13;
}

- (void)selectionCoordinator:(id)a3 didUpdateSelectedObjectsWithRemovedOIDs:(id)a4 insertedOIDs:(id)a5
{
  id v6 = a3;
  id v7 = [v6 selectedObjectIDs];
  id v8 = [(PUPickerCoordinator *)self configuration];
  if ([v8 isSingleSelection])
  {
    unint64_t v9 = [v7 count];

    if (v9 >= 2)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __97__PUPickerCoordinator_selectionCoordinator_didUpdateSelectedObjectsWithRemovedOIDs_insertedOIDs___block_invoke;
      block[3] = &unk_1E5F2ECC8;
      id v27 = v6;
      id v28 = v7;
      dispatch_async(MEMORY[0x1E4F14428], block);

      goto LABEL_21;
    }
  }
  else
  {
  }
  [(PUPickerCoordinator *)self setSelectionDidChange:1];
  id v10 = [(PUPickerCoordinator *)self selectionDidChangeObserver];

  if (v10)
  {
    id v11 = [(PUPickerCoordinator *)self selectionDidChangeObserver];
    v11[2]();
  }
  id v12 = [(PUPickerCoordinator *)self managedViewController];
  int v13 = [v12 contentViewController];
  [v13 updateBars];

  id v14 = [(PUPickerCoordinator *)self resizeTaskDescriptorViewModel];
  [v14 performChanges:&__block_literal_global_35485];

  char v15 = [(PUPickerCoordinator *)self configuration];
  if (([v15 shouldPassthroughSelection] & 1) == 0)
  {
LABEL_20:

    goto LABEL_21;
  }
  id v16 = [(PUPickerCoordinator *)self configuration];
  if ([v16 isSingleSelection])
  {
    uint64_t v17 = [v7 count];

    if (!v17) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  [(PUPickerCoordinator *)self _logPhotosAccessWithNonEmptyUserSelection];
  id v18 = [(PUPickerCoordinator *)self coordinatorActionHandler];

  if (v18)
  {
    id v19 = [(PUPickerCoordinator *)self configuration];
    if ([v19 allowsDownscaling])
    {
      id v20 = [(PUPickerCoordinator *)self configuration];
      int v21 = [v20 isSingleSelection];

      if (v21)
      {
        [(PUPickerCoordinator *)self _presentAssetExplorer];
        goto LABEL_21;
      }
    }
    else
    {
    }
    char v15 = [(PUPickerCoordinator *)self coordinatorActionHandler];
    uint64_t v23 = [(PUPickerCoordinator *)self additionalSelectionState];
    [v15 coordinator:self didFinishPicking:v7 additionalSelectionState:v23];

    goto LABEL_20;
  }
  uint64_t v22 = [(PUPickerCoordinator *)self photoPicker];

  if (v22)
  {
    [(PUPickerCoordinator *)self pu_legacy_selectSingleAsset];
  }
  else
  {
    v24 = PLPickerGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1AE9F8000, v24, OS_LOG_TYPE_ERROR, "coordinatorActionHandler delegate is not available. Should not reach here unless it's a test code.", v25, 2u);
    }
  }
LABEL_21:
}

void __97__PUPickerCoordinator_selectionCoordinator_didUpdateSelectedObjectsWithRemovedOIDs_insertedOIDs___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  id v3 = (void *)MEMORY[0x1E4F1CAA0];
  id v5 = [v2 lastObject];
  uint64_t v4 = [v3 orderedSetWithObject:v5];
  [v1 modifySelectionWithRemovedOIDs:v2 insertedOIDs:v4];
}

uint64_t __97__PUPickerCoordinator_selectionCoordinator_didUpdateSelectedObjectsWithRemovedOIDs_insertedOIDs___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 invalidateAssetsForResizing];
}

- (void)selectionCoordinator:(id)a3 willUpdateSelectedObjectsForSnapshot:(id)a4 withRemovedIndexes:(id)a5 insertedIndexes:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int v13 = [(PUPickerCoordinator *)self configuration];
  if ([v13 allowsDownload])
  {
    id v14 = [(PUPickerCoordinator *)self configuration];
    char v15 = [v14 isSingleSelection];

    if ((v15 & 1) == 0)
    {
      id v16 = [(PUPickerCoordinator *)self downloadHelper];
      if (!v16)
      {
        id v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 545, @"Invalid parameter not satisfying: %@", @"downloadHelper" object file lineNumber description];
      }
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __116__PUPickerCoordinator_selectionCoordinator_willUpdateSelectedObjectsForSnapshot_withRemovedIndexes_insertedIndexes___block_invoke;
      v26[3] = &unk_1E5F25F98;
      id v17 = v10;
      SEL v30 = a2;
      id v27 = v17;
      id v28 = self;
      id v18 = v16;
      id v29 = v18;
      [v11 enumerateItemIndexPathsUsingBlock:v26];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __116__PUPickerCoordinator_selectionCoordinator_willUpdateSelectedObjectsForSnapshot_withRemovedIndexes_insertedIndexes___block_invoke_2;
      v21[3] = &unk_1E5F25F98;
      id v22 = v17;
      uint64_t v23 = self;
      id v24 = v18;
      SEL v25 = a2;
      id v19 = v18;
      [v12 enumerateItemIndexPathsUsingBlock:v21];
    }
  }
  else
  {
  }
}

void __116__PUPickerCoordinator_selectionCoordinator_willUpdateSelectedObjectsForSnapshot_withRemovedIndexes_insertedIndexes___block_invoke(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) dataSource];
  long long v5 = a2[1];
  v18[0] = *a2;
  v18[1] = v5;
  id v6 = [v4 objectAtIndexPath:v18];

  if (!v6)
  {
    unint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = (objc_class *)objc_opt_class();
    int v13 = NSStringFromClass(v12);
    [v9 handleFailureInMethod:v10, v11, @"PUPickerCoordinator.m", 548, @"%@ should be an instance inheriting from %@, but it is nil", @"[snapshot.dataSource objectAtIndexPath:indexPath]", v13 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    unint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = (objc_class *)objc_opt_class();
    int v13 = NSStringFromClass(v16);
    id v17 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:v14, v15, @"PUPickerCoordinator.m", 548, @"%@ should be an instance inheriting from %@, but it is %@", @"[snapshot.dataSource objectAtIndexPath:indexPath]", v13, v17 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  id v7 = *(void **)(a1 + 48);
  id v8 = [v6 localIdentifier];
  [v7 cancelDownloadForIdentifier:v8];
}

void __116__PUPickerCoordinator_selectionCoordinator_willUpdateSelectedObjectsForSnapshot_withRemovedIndexes_insertedIndexes___block_invoke_2(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) dataSource];
  long long v5 = a2[1];
  v16[0] = *a2;
  v16[1] = v5;
  id v6 = [v4 objectAtIndexPath:v16];

  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    [v7 handleFailureInMethod:v8, v9, @"PUPickerCoordinator.m", 552, @"%@ should be an instance inheriting from %@, but it is nil", @"[snapshot.dataSource objectAtIndexPath:indexPath]", v11 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v14);
    uint64_t v15 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v7 handleFailureInMethod:v12, v13, @"PUPickerCoordinator.m", 552, @"%@ should be an instance inheriting from %@, but it is %@", @"[snapshot.dataSource objectAtIndexPath:indexPath]", v11, v15 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  [*(id *)(a1 + 48) handleDownloadOfAssetIfNeeded:v6 inCollection:0 withSuccessHandler:0];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PUPickerResizeTaskDescriptorViewModelObservationContext == a5)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_22;
    }
    id v21 = v9;
    uint64_t v12 = [(PUPickerCoordinator *)self configuration];
    int v13 = [v12 allowsDownscaling];

    if (v13)
    {
      uint64_t v14 = [(PUPickerCoordinator *)self resizeTaskDescriptorViewModel];
      uint64_t v15 = [v14 resizeTaskDescriptor];

      if (!v15
        || (([v15 targetSize], v16 == *MEMORY[0x1E4F396D8])
          ? (BOOL v18 = v17 == *(double *)(MEMORY[0x1E4F396D8] + 8))
          : (BOOL v18 = 0),
            v18
         || (v16 == *MEMORY[0x1E4F1DB30] ? (BOOL v19 = v17 == *(double *)(MEMORY[0x1E4F1DB30] + 8)) : (BOOL v19 = 0), v19)))
      {
        uint64_t v10 = 0;
      }
      else
      {
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithDouble:", fmax(v16, v17));
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v11 = [(PUPickerCoordinator *)self additionalSelectionState];
    [v11 setDownscalingTargetDimension:v10];
    goto LABEL_21;
  }
  if ((void *)PUPickerConfigurationObservationContext_35502 != a5)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"PUPickerCoordinator.m" lineNumber:534 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 2) != 0)
  {
    id v21 = v9;
    uint64_t v10 = [(PUPickerCoordinator *)self selectionCoordinator];
    uint64_t v11 = [(PUPickerCoordinator *)self configuration];
    +[PUPickerCoordinator _updateSelectionCoordinatorLimit:v10 configuration:v11];
LABEL_21:

    id v9 = v21;
  }
LABEL_22:
}

- (void)containerController:(id)a3 didTapShowSelectedButton:(id)a4
{
  char v6 = [(PUPickerCoordinator *)self selectionCoordinator];
  id v7 = [v6 selectedObjectIDs];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 506, @"Invalid parameter not satisfying: %@", @"self.selectionCoordinator.selectedObjectIDs.count > 0" object file lineNumber description];
  }
  [(PUPickerCoordinator *)self _presentAssetExplorer];
}

- (void)containerController:(id)a3 didTapAddButton:(id)a4
{
  id v5 = a4;
  [(PUPickerCoordinator *)self _logPhotosAccessWithNonEmptyUserSelection];
  char v6 = [(PUPickerCoordinator *)self coordinatorActionHandler];

  if (v6)
  {
    id v7 = [(PUPickerCoordinator *)self managedViewController];
    uint64_t v8 = [v7 contentViewController];
    id v9 = [v8 navigationItem];
    uint64_t v10 = [v9 searchController];
    uint64_t v11 = [v10 searchBar];

    if ([v11 canResignFirstResponder]) {
      [v11 resignFirstResponder];
    }
    uint64_t v12 = [(PUPickerCoordinator *)self selectionCoordinator];
    int v13 = [v12 selectedObjectIDs];

    uint64_t v14 = [(PUPickerCoordinator *)self coordinatorActionHandler];
    uint64_t v15 = [(PUPickerCoordinator *)self additionalSelectionState];
    [v14 coordinator:self didFinishPicking:v13 additionalSelectionState:v15];

    double v16 = [(PUPickerCoordinator *)self coordinatorActionHandler];
    [v16 _pickerDidPerformConfirmationAction:self];
  }
  else
  {
    double v17 = [(PUPickerCoordinator *)self photoPicker];

    if (v17)
    {
      id v18 = v5;
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
        id v19 = v18;
      }
      else {
        id v19 = 0;
      }

      [v19 setEnabled:0];
      id v20 = v18;
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
        id v21 = v20;
      }
      else {
        id v21 = 0;
      }

      [v21 setEnabled:0];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __59__PUPickerCoordinator_containerController_didTapAddButton___block_invoke;
      v24[3] = &unk_1E5F2ED10;
      id v25 = v20;
      [(PUPickerCoordinator *)self pu_legacy_selectMultipleAssets:v24];
    }
    else
    {
      id v22 = PLPickerGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_ERROR, "Both coordinatorActionHandler and photoPicker delegates are not available. Should not reach here unless it's a test code.", v23, 2u);
      }
    }
  }
}

void __59__PUPickerCoordinator_containerController_didTapAddButton___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  [v3 setEnabled:1];
  id v4 = *(id *)(a1 + 32);
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  [v5 setEnabled:1];
}

- (void)containerController:(id)a3 didTapClearButton:(id)a4
{
  id v8 = [(PUPickerCoordinator *)self selectionCoordinator];
  id v5 = [(PUPickerCoordinator *)self selectionCoordinator];
  char v6 = [v5 selectedObjectIDs];
  id v7 = [MEMORY[0x1E4F1CAA0] orderedSet];
  [v8 modifySelectionWithRemovedOIDs:v6 insertedOIDs:v7];
}

- (void)containerController:(id)a3 didTapCancelButton:(id)a4
{
  id v5 = [(PUPickerCoordinator *)self coordinatorActionHandler];

  if (v5)
  {
    char v6 = [(PUPickerCoordinator *)self coordinatorActionHandler];
    id v7 = [(PUPickerCoordinator *)self configuration];
    id v8 = [v7 preselectedItemObjectIDs];
    id v9 = [(PUPickerCoordinator *)self additionalSelectionState];
    [v6 coordinator:self didFinishPicking:v8 additionalSelectionState:v9];

    id v12 = [(PUPickerCoordinator *)self coordinatorActionHandler];
    [v12 _pickerDidPerformCancelAction:self];
  }
  else
  {
    uint64_t v10 = [(PUPickerCoordinator *)self photoPicker];

    if (v10)
    {
      [(PUPickerCoordinator *)self pu_legacy_cancelPicker];
    }
    else
    {
      uint64_t v11 = PLPickerGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "Both coordinatorActionHandler and photoPicker delegates are not available. Should not reach here unless it's a test code.", buf, 2u);
      }
    }
  }
}

- (void)containerController:(id)a3 didTapBatchedItems:(id)a4
{
  id v5 = a4;
  id v7 = [(PUPickerCoordinator *)self coordinatorActionHandler];
  char v6 = [(PUPickerCoordinator *)self additionalSelectionState];
  [v7 coordinator:self didFinishPicking:v5 additionalSelectionState:v6];
}

- (void)containerControllerWantsToLearnMoreAboutDataAccess:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPickerCoordinator *)self managedViewController];
  [v5 presentDataAccessEducationViewController:v4];
}

- (void)containerControllerDidAppear:(id)a3
{
  id v4 = [(PUPickerCoordinator *)self coordinatorActionHandler];

  if (!v4)
  {
    id v5 = [(PUPickerCoordinator *)self photoPicker];

    if (v5)
    {
      [(PUPickerCoordinator *)self pu_legacy_didDisplayPicker];
    }
    else
    {
      char v6 = PLPickerGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Both coordinatorActionHandler and photoPicker delegates are not available. Should not reach here unless it's a test code.", v7, 2u);
      }
    }
  }
}

- (void)resignSearchBarAsFirstResponder_110426547
{
  id v3 = [(PUPickerCoordinator *)self managedViewController];
  id v2 = [v3 contentViewController];
  [v2 resignSearchBarAsFirstResponder];
}

- (void)makeSearchBarAsFirstResponder
{
  id v3 = [(PUPickerCoordinator *)self managedViewController];
  id v2 = [v3 contentViewController];
  [v2 makeSearchBarAsFirstResponder];
}

- (void)emitDidFinishPickingAnalytics
{
  id v4 = [(PUPickerCoordinator *)self configuration];

  if (!v4)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 402, @"Invalid parameter not satisfying: %@", @"self.configuration" object file lineNumber description];
  }
  id v5 = [(PUPickerCoordinator *)self configuration];
  uint64_t v6 = [v5 pickerClientBundleIdentifier];
  id v7 = (void *)v6;
  id v8 = @"Unknown";
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  v58 = v8;

  id v9 = NSNumber;
  uint64_t v10 = [(PUPickerCoordinator *)self selectionCoordinator];
  uint64_t v11 = [v10 selectedObjectIDs];
  v59 = objc_msgSend(v9, "numberWithInt:", objc_msgSend(v11, "count") != 0);

  id v12 = NSNumber;
  int v13 = [(PUPickerCoordinator *)self configuration];
  uint64_t v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "edgesWithoutContentMargins"));

  uint64_t v15 = NSNumber;
  double v16 = [(PUPickerCoordinator *)self configuration];
  v57 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "preferredAssetRepresentationMode"));

  double v17 = NSNumber;
  id v18 = [(PUPickerCoordinator *)self configuration];
  id v19 = objc_msgSend(v17, "numberWithBool:", objc_msgSend(v18, "pickerClientHasLibraryAccess"));

  id v20 = NSNumber;
  id v21 = [(PUPickerCoordinator *)self configuration];
  id v22 = objc_msgSend(v20, "numberWithBool:", objc_msgSend(v21, "isLimitedLibraryPicker"));

  uint64_t v23 = NSNumber;
  id v24 = [(PUPickerCoordinator *)self configuration];
  v55 = objc_msgSend(v23, "numberWithBool:", objc_msgSend(v24, "isPeoplePicker"));

  id v25 = NSNumber;
  id v26 = [(PUPickerCoordinator *)self configuration];
  v50 = objc_msgSend(v25, "numberWithBool:", objc_msgSend(v26, "isSingleSelection"));

  id v27 = NSNumber;
  id v28 = [(PUPickerCoordinator *)self configuration];
  v48 = objc_msgSend(v27, "numberWithInteger:", objc_msgSend(v28, "mode"));

  id v29 = [(PUPickerCoordinator *)self managedViewController];
  SEL v30 = [v29 contentViewController];
  uint64_t v31 = [v30 selectedSuggestionAnalyticsName];
  v32 = (void *)v31;
  id v33 = @"Unknown";
  if (v31) {
    id v33 = (__CFString *)v31;
  }
  v34 = v33;

  uint64_t v35 = NSNumber;
  id v36 = [(PUPickerCoordinator *)self configuration];
  v37 = objc_msgSend(v35, "numberWithInteger:", objc_msgSend(v36, "selection"));

  v38 = NSNumber;
  v39 = [(PUPickerCoordinator *)self configuration];
  v40 = objc_msgSend(v38, "numberWithUnsignedInteger:", objc_msgSend(v39, "disabledCapabilities"));

  v60 = v22;
  v61 = v55;
  v62 = v50;
  v63 = v48;
  v64 = v37;
  v65 = v40;
  id v54 = v40;
  id v53 = v37;
  v52 = v34;
  id v49 = v48;
  id v51 = v50;
  id v56 = v55;
  id v41 = v22;
  id v42 = v19;
  id v43 = v57;
  id v44 = v14;
  id v45 = v59;
  v46 = v58;
  AnalyticsSendEventLazy();
}

id __52__PUPickerCoordinator_emitDidFinishPickingAnalytics__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v6 = *(_OWORD *)(a1 + 32);
  v5[0] = @"callerBundleID";
  v5[1] = @"didSelectItems";
  uint64_t v7 = *(void *)(a1 + 48);
  v5[2] = @"edgesWithoutContentMargins";
  v5[3] = @"encodingPolicy";
  long long v8 = *(_OWORD *)(a1 + 56);
  v5[4] = @"hasPhotoLibraryAccess";
  v5[5] = @"isLimitedLibraryPicker";
  uint64_t v1 = *(void *)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v10 = v1;
  v5[6] = @"isPeoplePicker";
  v5[7] = @"isSingleSelection";
  uint64_t v2 = *(void *)(a1 + 96);
  uint64_t v11 = *(void *)(a1 + 88);
  uint64_t v12 = v2;
  v5[8] = @"mode";
  v5[9] = @"selectedSuggestionName";
  long long v13 = *(_OWORD *)(a1 + 104);
  v5[10] = @"selectionBehavior";
  v5[11] = @"disabledCapabilities";
  uint64_t v14 = *(void *)(a1 + 120);
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v6 forKeys:v5 count:12];
  return v3;
}

- (BOOL)isShowingLiveWallpaperSuggestions
{
  uint64_t v2 = [(PUPickerCoordinator *)self managedViewController];
  id v3 = [v2 contentViewController];
  char v4 = [v3 isShowingLiveWallpaperSuggestions];

  return v4;
}

- (void)zoomOutContent
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerCoordinator.m", 388, @"%s must be called on the main thread", "-[PUPickerCoordinator zoomOutContent]");
  }
  id v6 = [(PUPickerCoordinator *)self managedViewController];
  char v4 = [v6 contentViewController];
  [v4 zoomOutContent];
}

- (void)zoomInContent
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerCoordinator.m", 382, @"%s must be called on the main thread", "-[PUPickerCoordinator zoomInContent]");
  }
  id v6 = [(PUPickerCoordinator *)self managedViewController];
  char v4 = [v6 contentViewController];
  [v4 zoomInContent];
}

- (void)scrollContentToInitialPosition
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerCoordinator.m", 376, @"%s must be called on the main thread", "-[PUPickerCoordinator scrollContentToInitialPosition]");
  }
  id v6 = [(PUPickerCoordinator *)self managedViewController];
  char v4 = [v6 contentViewController];
  [v4 scrollContentToInitialPosition];
}

- (BOOL)popViewController
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerCoordinator.m", 361, @"%s must be called on the main thread", "-[PUPickerCoordinator popViewController]");
  }
  char v4 = [(PUPickerCoordinator *)self managedViewController];
  id v5 = [v4 contentViewController];
  id v6 = [v5 navigationController];

  uint64_t v7 = [v6 viewControllers];
  unint64_t v8 = [v7 count];

  if (v8 >= 2)
  {
    uint64_t v9 = [(PUPickerCoordinator *)self configuration];
    char v10 = [v9 allowsSelectionStaging];

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = [(PUPickerCoordinator *)self selectionCoordinator];
      uint64_t v12 = [(PUPickerCoordinator *)self selectionCoordinator];
      long long v13 = [v12 selectedObjectIDs];
      uint64_t v14 = [MEMORY[0x1E4F1CAA0] orderedSet];
      [v11 modifySelectionWithRemovedOIDs:v13 insertedOIDs:v14];
    }
    uint64_t v15 = [(PUPickerCoordinator *)self managedViewController];
    double v16 = [v15 contentViewController];
    double v17 = [v16 navigationController];
    id v18 = (id)[v17 popViewControllerAnimated:1];
  }
  return v8 > 1;
}

- (void)searchWithString:(id)a3
{
  id v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = a3;
  if ([v5 isMainThread])
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerCoordinator.m", 350, @"%s must be called on the main thread", "-[PUPickerCoordinator searchWithString:]");

    if (v6) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 351, @"Invalid parameter not satisfying: %@", @"string" object file lineNumber description];

LABEL_3:
  uint64_t v7 = [(PUPickerCoordinator *)self configuration];
  char v8 = [v7 allowsSelectionStaging];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [(PUPickerCoordinator *)self selectionCoordinator];
    char v10 = [(PUPickerCoordinator *)self selectionCoordinator];
    uint64_t v11 = [v10 selectedObjectIDs];
    uint64_t v12 = [MEMORY[0x1E4F1CAA0] orderedSet];
    [v9 modifySelectionWithRemovedOIDs:v11 insertedOIDs:v12];
  }
  id v16 = [(PUPickerCoordinator *)self managedViewController];
  long long v13 = [v16 contentViewController];
  [v13 searchWithString:v6];
}

- (void)moveAssetWithIdentifier:(id)a3 afterIdentifier:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerCoordinator.m", 321, @"%s must be called on the main thread", "-[PUPickerCoordinator moveAssetWithIdentifier:afterIdentifier:]");

    if (v7) {
      goto LABEL_3;
    }
LABEL_17:
    id v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 322, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_17;
  }
LABEL_3:
  if (([v7 isEqualToString:v8] & 1) == 0)
  {
    uint64_t v9 = [(PUPickerCoordinator *)self selectionCoordinator];
    char v10 = [v9 selectedObjectIDs];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      uint64_t v12 = [(PUPickerCoordinator *)self configuration];
      long long v13 = [v12 photoLibrary];
      uint64_t v14 = [v13 librarySpecificFetchOptions];

      uint64_t v15 = (void *)MEMORY[0x1E4F38EB8];
      v36[0] = v7;
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
      double v17 = [v15 fetchAssetsWithLocalIdentifiers:v16 options:v14];
      id v18 = [v17 firstObject];
      id v19 = [v18 objectID];

      if (!v19)
      {
LABEL_14:

        goto LABEL_15;
      }
      id v20 = [(PUPickerCoordinator *)self selectionCoordinator];
      id v21 = [v20 selectedObjectIDs];
      id v22 = (void *)[v21 mutableCopy];

      uint64_t v23 = [v22 indexOfObject:v19];
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v24 = v23;
        if (v8)
        {
          id v25 = (void *)MEMORY[0x1E4F38EB8];
          id v35 = v8;
          v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
          id v26 = [v25 fetchAssetsWithLocalIdentifiers:v34 options:v14];
          id v27 = [v26 firstObject];
          id v28 = [v27 objectID];

          if (!v28) {
            goto LABEL_13;
          }
          uint64_t v29 = [v22 indexOfObject:v28];

          if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_13;
          }
        }
        else
        {
          uint64_t v29 = 0;
        }
        SEL v30 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v24];
        [v22 moveObjectsAtIndexes:v30 toIndex:v29];

        uint64_t v31 = [(PUPickerCoordinator *)self selectionCoordinator];
        [v31 modifySelectionWithOrder:v22];
      }
LABEL_13:

      goto LABEL_14;
    }
  }
LABEL_15:
}

- (void)deselectAssetsWithIdentifiers:(id)a3
{
  id v20 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerCoordinator.m", 307, @"%s must be called on the main thread", "-[PUPickerCoordinator deselectAssetsWithIdentifiers:]");
  }
  id v5 = v20;
  if (!v20)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 308, @"Invalid parameter not satisfying: %@", @"identifiers" object file lineNumber description];

    id v5 = 0;
  }
  if ([v5 count])
  {
    id v6 = [(PUPickerCoordinator *)self selectionCoordinator];
    id v7 = [v6 selectedObjectIDs];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      uint64_t v9 = [(PUPickerCoordinator *)self configuration];
      char v10 = [v9 photoLibrary];
      uint64_t v11 = [v10 librarySpecificFetchOptions];

      uint64_t v12 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v20 options:v11];
      long long v13 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v20];
      uint64_t v14 = objc_msgSend(v12, "px_fetchedObjectIDsSortedByLocalIdentifiers:", v13);

      if ([v14 count])
      {
        uint64_t v15 = [(PUPickerCoordinator *)self selectionCoordinator];
        id v16 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v14];
        double v17 = [MEMORY[0x1E4F1CAA0] orderedSet];
        [v15 modifySelectionWithRemovedOIDs:v16 insertedOIDs:v17];
      }
    }
  }
}

- (void)updateSelectedAssetsWithIdentifiers:(id)a3
{
  id v5 = (void *)MEMORY[0x1E4F29060];
  id v6 = a3;
  if ([v5 isMainThread])
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerCoordinator.m", 293, @"%s must be called on the main thread", "-[PUPickerCoordinator updateSelectedAssetsWithIdentifiers:]");

    if (v6) {
      goto LABEL_3;
    }
  }
  id v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 294, @"Invalid parameter not satisfying: %@", @"identifiers" object file lineNumber description];

LABEL_3:
  id v7 = [(PUPickerCoordinator *)self selectionCoordinator];
  id v23 = [v7 selectedObjectIDs];

  uint64_t v8 = [(PUPickerCoordinator *)self configuration];
  uint64_t v9 = [v8 photoLibrary];
  char v10 = [v9 librarySpecificFetchOptions];

  uint64_t v11 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v6 options:v10];
  uint64_t v12 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v6];

  uint64_t v13 = objc_msgSend(v11, "px_fetchedObjectIDsSortedByLocalIdentifiers:", v12);
  uint64_t v14 = (void *)v13;
  uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
  if (v13) {
    uint64_t v15 = (void *)v13;
  }
  id v16 = v15;

  double v17 = [v23 array];
  char v18 = [v16 isEqualToArray:v17];

  if ((v18 & 1) == 0)
  {
    id v19 = [(PUPickerCoordinator *)self selectionCoordinator];
    id v20 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v16];
    [v19 modifySelectionWithRemovedOIDs:v23 insertedOIDs:v20];
  }
}

- (void)stopActivityIndicatorsForAssetsWithIdentifiers:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerCoordinator.m", 276, @"%s must be called on the main thread", "-[PUPickerCoordinator stopActivityIndicatorsForAssetsWithIdentifiers:]");

    if (v5) {
      goto LABEL_3;
    }
  }
  id v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 277, @"Invalid parameter not satisfying: %@", @"identifiers" object file lineNumber description];

LABEL_3:
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * v10);
        uint64_t v12 = [(PUPickerCoordinator *)self activityIndicatorTrackingIDs];
        uint64_t v13 = [v12 objectForKeyedSubscript:v11];

        if (v13)
        {
          uint64_t v14 = [(PUPickerCoordinator *)self loadingStatusManager];
          [v14 didCompleteLoadOperationWithTrackingID:v13 withSuccess:1 error:0];
        }
        uint64_t v15 = [(PUPickerCoordinator *)self activityIndicatorTrackingIDs];
        [v15 setObject:0 forKeyedSubscript:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  id v16 = [(PUPickerCoordinator *)self activityIndicatorTrackingIDs];
  uint64_t v17 = [v16 count];

  if (!v17)
  {
    char v18 = [(PUPickerCoordinator *)self managedViewController];
    id v19 = [v18 contentViewController];
    [v19 setReplacesConfirmationButtonWithActivityIndicator:0];
  }
}

- (void)startActivityIndicatorsForAssetsWithFetchResult:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerCoordinator.m", 264, @"%s must be called on the main thread", "-[PUPickerCoordinator startActivityIndicatorsForAssetsWithFetchResult:]");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
        uint64_t v12 = [(PUPickerCoordinator *)self loadingStatusManager];
        uint64_t v13 = [v11 uuid];
        uint64_t v14 = [v12 willBeginLoadOperationWithItemIdentifier:v13];

        uint64_t v15 = [(PUPickerCoordinator *)self loadingStatusManager];
        [v15 didUpdateLoadOperationWithIndeterminateProgressWithTrackingID:v14];

        id v16 = [(PUPickerCoordinator *)self activityIndicatorTrackingIDs];
        uint64_t v17 = [v11 localIdentifier];
        [v16 setObject:v14 forKeyedSubscript:v17];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  char v18 = [(PUPickerCoordinator *)self managedViewController];
  id v19 = [v18 contentViewController];
  [v19 setReplacesConfirmationButtonWithActivityIndicator:1];
}

- (PUPickerCoordinator)init
{
  char v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerCoordinator.m", 258, @"%s is not available as initializer", "-[PUPickerCoordinator init]");

  abort();
}

- (PUPickerCoordinator)initWithConfiguration:(id)a3 coordinatorActionHandler:(id)a4 loadingStatusManager:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id obj = a4;
  id v11 = a5;
  if (!v10)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 183, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  v46.receiver = self;
  v46.super_class = (Class)PUPickerCoordinator;
  uint64_t v12 = [(PUPickerCoordinator *)&v46 init];
  if (v12)
  {
    if (!v11) {
      id v11 = objc_alloc_init(MEMORY[0x1E4F91280]);
    }
    uint64_t v13 = [v10 suggestedItemObjectIDs];
    if ([v13 count])
    {
      uint64_t v14 = [v10 preselectedItemObjectIDs];
      BOOL v15 = [v14 count] == 0;

      if (v15)
      {
        id v43 = [v10 suggestedItemObjectIDs];
        goto LABEL_11;
      }
    }
    else
    {
    }
    id v43 = [v10 preselectedItemObjectIDs];
LABEL_11:
    if ([v10 isSingleSelection] && (unint64_t)objc_msgSend(v43, "count") >= 2)
    {
      id v16 = (void *)MEMORY[0x1E4F1CAA0];
      uint64_t v17 = [v43 firstObject];
      uint64_t v18 = [v16 orderedSetWithObject:v17];

      id v43 = (void *)v18;
    }
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4F912D8]) initWithSelectedOIDs:v43];
    +[PUPickerCoordinator _updateSelectionCoordinatorLimit:v19 configuration:v10];
    id v41 = [[PUPickerAdditionalSelectionState alloc] initWithConfiguration:v10];
    if ([v10 allowsDownload])
    {
      v40 = [[PUPhotosGridDownloadHelper alloc] initWithUpdateHandler:v12];
      -[PUPhotosGridDownloadHelper setMode:](v40, "setMode:", [v10 isSingleSelection] ^ 1);
      id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v20 = objc_alloc_init(PUPickerActivityProgressController);
      long long v21 = PULocalizedString(@"PHOTO_PICKER_DOWNLOAD_PROGRESS_ALERT_TITLE");
      [(PUPickerActivityProgressController *)v20 setTitle:v21];
    }
    else
    {
      id v39 = 0;
      v40 = 0;
      id v20 = 0;
    }
    if ([v10 allowsDownscaling]
      && ([(PUPickerCoordinator *)v12 configuration],
          long long v22 = objc_claimAutoreleasedReturnValue(),
          int v23 = [v22 excludesOptionsMenu],
          v22,
          v23))
    {
      long long v24 = objc_alloc_init(PUPhotoPickerResizeTaskDescriptorViewModel);
    }
    else
    {
      long long v24 = 0;
    }
    long long v25 = PLPickerGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = [v10 preselectedItemObjectIDs];
      uint64_t v27 = [v26 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v48 = v27;
      _os_log_impl(&dword_1AE9F8000, v25, OS_LOG_TYPE_DEFAULT, "Initializing root picker view with starting selection of size %ld", buf, 0xCu);
    }
    id v28 = [[PUPickerContainerController alloc] initWithConfiguration:v10 loadingStatusManager:v11 selectionCoordinator:v19 additionalSelectionState:v41 resizeTaskDescriptorViewModel:v24 actionHandler:v12];
    uint64_t v29 = [[PUPickerManagedViewController alloc] initWithConfiguration:v10 contentViewController:v28];
    objc_storeStrong((id *)&v12->_resizeTaskDescriptorViewModel, v24);
    objc_storeStrong((id *)&v12->_managedViewController, v29);
    objc_storeStrong((id *)&v12->_configuration, a3);
    objc_storeWeak((id *)&v12->_coordinatorActionHandler, obj);
    objc_storeStrong((id *)&v12->_selectionCoordinator, v19);
    objc_storeStrong((id *)&v12->_additionalSelectionState, v41);
    objc_storeStrong((id *)&v12->_downloadHelper, v40);
    objc_storeStrong((id *)&v12->_downloadProgresses, v39);
    objc_storeStrong((id *)&v12->_progressController, v20);
    objc_storeStrong((id *)&v12->_loadingStatusManager, v11);
    SEL v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activityIndicatorTrackingIDs = v12->_activityIndicatorTrackingIDs;
    v12->_activityIndicatorTrackingIDs = v30;

    v32 = [(PUPickerCoordinator *)v12 selectionCoordinator];
    [v32 setDelegate:v12];

    id v33 = [(PUPickerCoordinator *)v12 resizeTaskDescriptorViewModel];
    [v33 setDelegate:v12];

    v34 = [(PUPickerCoordinator *)v12 resizeTaskDescriptorViewModel];
    [v34 registerChangeObserver:v12 context:PUPickerResizeTaskDescriptorViewModelObservationContext];

    id v35 = [(PUPickerCoordinator *)v12 configuration];
    [v35 registerChangeObserver:v12 context:PUPickerConfigurationObservationContext_35502];

    objc_initWeak((id *)buf, v12);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __91__PUPickerCoordinator_initWithConfiguration_coordinatorActionHandler_loadingStatusManager___block_invoke;
    v44[3] = &unk_1E5F2E530;
    objc_copyWeak(&v45, (id *)buf);
    [(PUPickerActivityProgressController *)v20 setCancellationHandler:v44];
    id v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v36 addObserver:v12 selector:sel__serviceContextDidBecomeInsecure name:*MEMORY[0x1E4FB3518] object:0];

    objc_destroyWeak(&v45);
    objc_destroyWeak((id *)buf);
  }
  return v12;
}

void __91__PUPickerCoordinator_initWithConfiguration_coordinatorActionHandler_loadingStatusManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancelProgressController];
}

- (PUPickerCoordinator)initWithPUConfiguration:(id)a3 coordinatorActionHandler:(id)a4 loadingStatusManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 169, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  uint64_t v12 = [(PUPickerCoordinator *)self initWithConfiguration:v9 coordinatorActionHandler:v10 loadingStatusManager:v11];
  +[PUPickerCoordinator _logPhotosPickerPresentedForClientWithConfiguration:v9 usingOptions:1];

  return v12;
}

- (PUPickerCoordinator)initWithPHConfiguration:(id)a3 coordinatorActionHandler:(id)a4 loadingStatusManager:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 154, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  uint64_t v12 = [[PUPickerConfiguration alloc] initWithPHPickerConfiguration:v9 connection:0];
  if (v12)
  {
    uint64_t v13 = [(PUPickerCoordinator *)self initWithPUConfiguration:v12 coordinatorActionHandler:v10 loadingStatusManager:v11];
  }
  else
  {
    uint64_t v14 = PLPickerGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v9;
      _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_ERROR, "Failed to create picker with configuration: %@", buf, 0xCu);
    }

    uint64_t v13 = 0;
  }

  return v13;
}

- (PUPickerCoordinator)initWithPhotoPicker:(id)a3 mediaTypes:(id)a4 connection:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 properties];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"_UIImagePickerControllerMessagesLayout"];
  int v13 = [v12 BOOLValue];

  id v14 = objc_alloc_init(MEMORY[0x1E4F39930]);
  objc_msgSend(v14, "set_onboardingHeaderDismissedBefore:", objc_msgSend(v8, "onboardingHeaderDismissedBefore"));
  objc_msgSend(v14, "set_onboardingOverlayDismissedBefore:", 0);
  objc_msgSend(v14, "set_limitedLibraryHeaderDismissedBefore:", 0);
  if (v13) {
    [v14 setDisabledCapabilities:30];
  }
  [v14 _setDisabledPrivateCapabilities:4];
  if ([v8 allowsMultipleSelection]) {
    uint64_t v15 = [v8 multipleSelectionLimit];
  }
  else {
    uint64_t v15 = 1;
  }
  [v14 setSelectionLimit:v15];
  objc_msgSend(v14, "_setAllowsDownscaling:", objc_msgSend(v8, "showsFileSizePicker"));
  id v16 = [[PUPickerGeneratedFilter alloc] initWithUIImagePickerControllerMediaTypes:v10];

  id v17 = [[PUPickerConfiguration alloc] initForUIImagePickerControllerWithPHPickerConfiguration:v14 connection:v9 overriddenGeneratedFilter:v16];
  if (v17)
  {
    id v18 = [(PUPickerCoordinator *)self initWithConfiguration:v17 coordinatorActionHandler:0 loadingStatusManager:0];
    +[PUPickerCoordinator _logPhotosPickerPresentedForClientWithConfiguration:v17 usingOptions:0];
    objc_storeWeak((id *)&v18->_photoPicker, v8);
    if (v18->_downloadHelper) {
      [(PUPhotosGridDownloadHelper *)v18->_downloadHelper setShouldTreatLivePhotosAsStills:+[PUPickerCoordinator pu_legacy_shouldDownloadVideoComplement:v8 configuration:v17]];
    }
  }
  else
  {
    uint64_t v19 = PLPickerGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = [v8 properties];
      int v22 = 138412290;
      int v23 = v20;
      _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "Failed to create picker with options: %@", (uint8_t *)&v22, 0xCu);
    }
    [v8 cancelPhotoPicker];
    id v18 = 0;
  }

  return v18;
}

+ (void)_logPhotosPickerPresentedForClientWithConfiguration:(id)a3 usingOptions:(int64_t)a4
{
  id v9 = a3;
  id v5 = [v9 pickerClientIdentification];
  if ([v9 pickerClientIsEntitledForOrHasPrivateLibraryAccess]) {
    char v6 = 1;
  }
  else {
    char v6 = [v9 isLimitedLibraryPicker];
  }
  if (PLPlatformPhotosAccessLoggingSupported() && v5 && (v6 & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F8B998] sharedInstance];
    id v8 = [v5 trustedCallerBundleID];
    [v7 logPhotosPickerPresentedLibraryForClient:v8 usingOptions:a4];
  }
}

+ (void)_updateSelectionCoordinatorLimit:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (([v5 allowsUnlimitedMultipleSelection] & 1) != 0
    || [v5 isSingleSelection])
  {
    [v7 setSelectionCountLimit:0];
  }
  else
  {
    char v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "selectionLimit"));
    [v7 setSelectionCountLimit:v6];
  }
}

- (id)ppt_scrollTestViewController
{
  uint64_t v2 = [(PUPickerCoordinator *)self managedViewController];
  id v3 = [v2 contentViewController];

  return v3;
}

- (void)imageViewControllerDidConfirmSelection:(id)a3
{
  char v4 = PLPickerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "Confirming UIImagePickerController review UI.", v5, 2u);
  }

  [(PUPickerCoordinator *)self pu_legacy_selectSingleAssetWithFileResizing];
}

- (id)imageViewControllerFileSizeMenuActions:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v4 = [(PUPickerCoordinator *)self _createFetchResultUsingSelectedObjectIDs];
  id v5 = [v4 fetchedObjects];

  char v6 = PLPickerGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Providing UIImagePickerController review UI file resizing actions with assets: %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [(PUPickerCoordinator *)self _fileSizeActionsForAssets:v5];

  return v7;
}

- (void)imageViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = PLPickerGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "Dismissing UIImagePickerController review UI.", v10, 2u);
  }

  char v6 = [(PUPickerCoordinator *)self selectionCoordinator];
  id v7 = [v6 selectedObjectIDs];

  id v8 = [(PUPickerCoordinator *)self selectionCoordinator];
  int v9 = [MEMORY[0x1E4F1CAA0] orderedSet];
  [v8 modifySelectionWithRemovedOIDs:v7 insertedOIDs:v9];

  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)_completeMultipleSelection:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1166, @"Invalid parameter not satisfying: %@", @"selectedAssets" object file lineNumber description];
  }
  char v6 = [(PUPickerCoordinator *)self photoPicker];

  if (!v6)
  {
    long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1167, @"Invalid parameter not satisfying: %@", @"self.photoPicker" object file lineNumber description];
  }
  id v7 = [(PUPickerCoordinator *)self configuration];
  char v8 = [v7 allowsDownload];

  if ((v8 & 1) == 0)
  {
    int v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1168, @"Invalid parameter not satisfying: %@", @"self.configuration.allowsDownload" object file lineNumber description];
  }
  int v9 = [(PUPickerCoordinator *)self downloadHelper];

  if (!v9)
  {
    int v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1169, @"Invalid parameter not satisfying: %@", @"self.downloadHelper" object file lineNumber description];
  }
  id v10 = [(PUPickerCoordinator *)self downloadProgresses];

  if (!v10)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1170, @"Invalid parameter not satisfying: %@", @"self.downloadProgresses" object file lineNumber description];
  }
  uint64_t v11 = [(PUPickerCoordinator *)self progressController];

  if (!v11)
  {
    long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1171, @"Invalid parameter not satisfying: %@", @"self.progressController" object file lineNumber description];
  }
  uint64_t v12 = PLPickerGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v27 = [v5 count];
    _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEFAULT, "Calling back with full dictionary for %lu assets.", buf, 0xCu);
  }

  int v13 = [(PUPickerCoordinator *)self resizeTaskDescriptorViewModel];
  id v14 = [v13 resizeTaskDescriptor];

  uint64_t v15 = +[PUPickerCoordinator _extraArgumentsForResizeTaskDescriptor:v14];
  id v16 = [(PUPickerCoordinator *)self photoPicker];
  id v17 = [v16 properties];
  id v18 = PLPhotoPickerDictionariesFromMultipleMediaItems();

  uint64_t v19 = [(PUPickerCoordinator *)self photoPicker];
  [v19 didSelectMultipleMediaItemsWithInfoDictionaries:v18];
}

- (void)_completeSingleSelection:(id)a3 showConfirmation:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    id v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1114, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  char v8 = [(PUPickerCoordinator *)self photoPicker];

  if (!v8)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1115, @"Invalid parameter not satisfying: %@", @"self.photoPicker" object file lineNumber description];
  }
  int v9 = [(PUPickerCoordinator *)self configuration];
  char v10 = [v9 allowsDownload];

  if ((v10 & 1) == 0)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1116, @"Invalid parameter not satisfying: %@", @"self.configuration.allowsDownload" object file lineNumber description];
  }
  uint64_t v11 = [(PUPickerCoordinator *)self downloadHelper];

  if (!v11)
  {
    id v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1117, @"Invalid parameter not satisfying: %@", @"self.downloadHelper" object file lineNumber description];
  }
  uint64_t v12 = [(PUPickerCoordinator *)self downloadProgresses];

  if (!v12)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1118, @"Invalid parameter not satisfying: %@", @"self.downloadProgresses" object file lineNumber description];
  }
  int v13 = [(PUPickerCoordinator *)self progressController];

  if (!v13)
  {
    id v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1119, @"Invalid parameter not satisfying: %@", @"self.progressController" object file lineNumber description];
  }
  id v14 = [(PUPickerCoordinator *)self photoPicker];
  uint64_t v15 = objc_msgSend(v7, "pl_managedAsset");
  id v16 = PLPickerGetLog();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v7;
      _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEFAULT, "Moving to confirmation screen for asset %@.", buf, 0xCu);
    }

    id v18 = [(PUPickerCoordinator *)self configuration];
    BOOL v19 = +[PUPickerCoordinator _shouldTreatAssetAsLivePhoto:v7 photoPicker:v14 configuration:v18];

    id v20 = [PUUIImageViewController alloc];
    long long v21 = objc_msgSend(v7, "pl_managedAsset");
    int v22 = [v14 properties];
    int v23 = [(PUUIImageViewController *)v20 initWithPhoto:v21 imagePickerProperties:v22 expectsLivePhoto:v19];

    [(PUUIImageViewController *)v23 setPhotoPicker:v14];
    [(PUUIImageViewController *)v23 setCancellationDelegate:self];
    [(PLUIImageViewController *)v23 setAllowsEditing:+[PUPickerCoordinator _editingEnabled:v14]];
    uint64_t v24 = [(PUPickerCoordinator *)self configuration];
    if ([v24 allowsDownscaling])
    {
      uint64_t v25 = [v7 mediaType];

      if (v25 == 1)
      {
        uint64_t v26 = [(PUPickerCoordinator *)self resizeTaskDescriptorViewModel];
        [(PUUIImageViewController *)v23 setResizeTaskDescriptorViewModel:v26];

        [(PUUIImageViewController *)v23 setFileResizingDelegate:self];
      }
    }
    else
    {
    }
    v32 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v23];
    id v33 = [v32 navigationBar];
    v34 = [v33 standardAppearance];
    id v35 = [v32 navigationBar];
    [v35 setScrollEdgeAppearance:v34];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__PUPickerCoordinator_LegacyAPISupport___completeSingleSelection_showConfirmation___block_invoke;
    block[3] = &unk_1E5F2ECC8;
    void block[4] = self;
    id v43 = v32;
    id v28 = v32;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v7;
      _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEFAULT, "Calling back with full dictionary for asset %@.", buf, 0xCu);
    }

    uint64_t v27 = [(PUPickerCoordinator *)self resizeTaskDescriptorViewModel];
    int v23 = [v27 resizeTaskDescriptor];

    id v28 = +[PUPickerCoordinator _extraArgumentsForResizeTaskDescriptor:v23];
    uint64_t v29 = [v14 properties];
    SEL v30 = PLPhotoPickerDictionaryFromMedia();

    uint64_t v31 = [(PUPickerCoordinator *)self photoPicker];
    [v31 didSelectMediaWithInfoDictionary:v30 allowedHandler:0];
  }
}

uint64_t __83__PUPickerCoordinator_LegacyAPISupport___completeSingleSelection_showConfirmation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentViewControllerDismissingPresentedViewControllerIfNeeded:*(void *)(a1 + 40)];
}

- (void)pu_legacy_selectMultipleAssets:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v49 = (void (**)(void))a3;
  if (!v49)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1037, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  val = self;
  id v5 = [(PUPickerCoordinator *)self photoPicker];

  if (!v5)
  {
    id v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1038, @"Invalid parameter not satisfying: %@", @"self.photoPicker" object file lineNumber description];
  }
  char v6 = [(PUPickerCoordinator *)self photoPicker];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1039, @"Invalid parameter not satisfying: %@", @"[self.photoPicker isKindOfClass:[UIViewController class]]" object file lineNumber description];
  }
  char v8 = [(PUPickerCoordinator *)self selectionCoordinator];
  int v9 = [v8 selectedObjectIDs];

  if (!v9)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1040, @"Invalid parameter not satisfying: %@", @"self.selectionCoordinator.selectedObjectIDs > 0" object file lineNumber description];
  }
  char v10 = [(PUPickerCoordinator *)self _createFetchResultUsingSelectedObjectIDs];
  v50 = [v10 fetchedObjects];

  uint64_t v11 = PLPickerGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v50 count];
    _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEFAULT, "Starting legacy multiple selection for %lu assets", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v48 = [(PUPickerCoordinator *)self photoPicker];
  uint64_t v12 = [(PUPickerCoordinator *)self configuration];
  int v13 = [v12 onlyReturnsIdentifiers];

  if (v13)
  {
    id v14 = PXMap();
    uint64_t v15 = PLPickerGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v14 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_DEFAULT, "Calling back with asset identifiers only for %lu assets", (uint8_t *)&buf, 0xCu);
    }

    [v48 didSelectMultipleMediaItemsWithInfoDictionaries:v14];
    v49[2]();

    goto LABEL_35;
  }
  BOOL v17 = [(PUPickerCoordinator *)self configuration];
  int v18 = [v17 allowsDownload];

  if ((v18 & 1) == 0)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1057, @"Invalid parameter not satisfying: %@", @"self.configuration.allowsDownload" object file lineNumber description];
  }
  BOOL v19 = [(PUPickerCoordinator *)self downloadHelper];
  BOOL v20 = v19 == 0;

  if (v20)
  {
    id v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, val, @"PUPickerCoordinator.m", 1058, @"Invalid parameter not satisfying: %@", @"self.downloadHelper" object file lineNumber description];
  }
  long long v21 = [(PUPickerCoordinator *)val downloadProgresses];
  BOOL v22 = v21 == 0;

  if (v22)
  {
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, val, @"PUPickerCoordinator.m", 1059, @"Invalid parameter not satisfying: %@", @"self.downloadProgresses" object file lineNumber description];
  }
  int v23 = [(PUPickerCoordinator *)val progressController];
  BOOL v24 = v23 == 0;

  if (v24)
  {
    id v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, val, @"PUPickerCoordinator.m", 1060, @"Invalid parameter not satisfying: %@", @"self.progressController" object file lineNumber description];
  }
  uint64_t v25 = [(PUPickerCoordinator *)val downloadHelper];
  int v26 = [v25 isAnyPickerAssetDownloading:v50];

  if (!v26)
  {
    [(PUPickerCoordinator *)val _completeMultipleSelection:v50];
    v49[2]();
    goto LABEL_35;
  }
  v47 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", objc_msgSend(v50, "count"));
  uint64_t v27 = [(PUPickerCoordinator *)val photoPicker];
  if (!v27)
  {
    id v42 = [MEMORY[0x1E4F28B00] currentHandler];
    id v43 = (objc_class *)objc_opt_class();
    id v44 = NSStringFromClass(v43);
    [v42 handleFailureInMethod:a2, val, @"PUPickerCoordinator.m", 1065, @"%@ should be an instance inheriting from %@, but it is nil", @"self.photoPicker", v44 object file lineNumber description];
LABEL_38:

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v42 = [MEMORY[0x1E4F28B00] currentHandler];
    id v45 = (objc_class *)objc_opt_class();
    id v44 = NSStringFromClass(v45);
    uint64_t v46 = objc_msgSend(v27, "px_descriptionForAssertionMessage");
    [v42 handleFailureInMethod:a2, val, @"PUPickerCoordinator.m", 1065, @"%@ should be an instance inheriting from %@, but it is %@", @"self.photoPicker", v44, v46 object file lineNumber description];

    goto LABEL_38;
  }
LABEL_26:
  [(PUPickerCoordinator *)val presentProgressControllerFromViewController:v27 progress:v47];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v68 = 0x2020000000;
  char v69 = 1;
  id v28 = dispatch_group_create();
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v50;
  uint64_t v29 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v63 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        dispatch_group_enter(v28);
        id v33 = [(PUPickerCoordinator *)val downloadHelper];
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __72__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectMultipleAssets___block_invoke_620;
        v59[3] = &unk_1E5F26078;
        p_long long buf = &buf;
        v60 = v28;
        [v33 handleDownloadOfAssetIfNeeded:v32 inCollection:0 withSuccessHandler:v59];
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
    }
    while (v29);
  }

  objc_initWeak(&location, val);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectMultipleAssets___block_invoke_2;
  block[3] = &unk_1E5F260A0;
  id v56 = &buf;
  objc_copyWeak(&v57, &location);
  id v54 = obj;
  v55 = v49;
  dispatch_group_notify(v28, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v57);
  objc_destroyWeak(&location);

  _Block_object_dispose(&buf, 8);
LABEL_35:
}

void __72__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectMultipleAssets___block_invoke_620(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    char v3 = a2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)(v2 + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __72__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectMultipleAssets___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    char v6 = [WeakRetained progressController];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectMultipleAssets___block_invoke_3;
    v8[3] = &unk_1E5F2E4E8;
    objc_copyWeak(&v10, (id *)(a1 + 56));
    id v9 = *(id *)(a1 + 32);
    [v6 hideWithCompletion:v8];

    objc_destroyWeak(&v10);
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, a3, a4);
}

void __72__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectMultipleAssets___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _completeMultipleSelection:*(void *)(a1 + 32)];
}

id __72__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectMultipleAssets___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4FB3238];
  uint64_t v2 = [a2 localIdentifier];
  v6[0] = v2;
  char v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (void)pu_legacy_selectSingleAssetWithFileResizing
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(PUPickerCoordinator *)self photoPicker];

  if (!v4)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1021, @"Invalid parameter not satisfying: %@", @"self.photoPicker" object file lineNumber description];
  }
  uint64_t v5 = [(PUPickerCoordinator *)self configuration];
  char v6 = [v5 allowsDownload];

  if ((v6 & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1022, @"Invalid parameter not satisfying: %@", @"self.configuration.allowsDownload" object file lineNumber description];
  }
  id v7 = [(PUPickerCoordinator *)self downloadHelper];

  if (!v7)
  {
    BOOL v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1023, @"Invalid parameter not satisfying: %@", @"self.downloadHelper" object file lineNumber description];
  }
  char v8 = [(PUPickerCoordinator *)self downloadProgresses];

  if (!v8)
  {
    int v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1024, @"Invalid parameter not satisfying: %@", @"self.downloadProgresses" object file lineNumber description];
  }
  id v9 = [(PUPickerCoordinator *)self progressController];

  if (!v9)
  {
    BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1025, @"Invalid parameter not satisfying: %@", @"self.progressController" object file lineNumber description];
  }
  id v10 = [(PUPickerCoordinator *)self selectionCoordinator];
  uint64_t v11 = [v10 selectedObjectIDs];

  if (!v11)
  {
    BOOL v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1026, @"Invalid parameter not satisfying: %@", @"self.selectionCoordinator.selectedObjectIDs > 0" object file lineNumber description];
  }
  uint64_t v12 = [(PUPickerCoordinator *)self _createFetchResultUsingSelectedObjectIDs];
  int v13 = [v12 firstObject];

  id v14 = PLPickerGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    BOOL v22 = v13;
    _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_DEFAULT, "Starting legacy single selection with file resizing for asset %@", buf, 0xCu);
  }

  [(PUPickerCoordinator *)self _completeSingleSelection:v13 showConfirmation:0];
}

- (void)pu_legacy_selectSingleAsset
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  char v3 = [(PUPickerCoordinator *)self photoPicker];

  if (!v3)
  {
    uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 970, @"Invalid parameter not satisfying: %@", @"self.photoPicker" object file lineNumber description];
  }
  BOOL v4 = [(PUPickerCoordinator *)self photoPicker];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 971, @"Invalid parameter not satisfying: %@", @"[self.photoPicker isKindOfClass:[UIViewController class]]" object file lineNumber description];
  }
  char v6 = [(PUPickerCoordinator *)self configuration];
  char v7 = [v6 allowsDownload];

  if ((v7 & 1) == 0)
  {
    uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 972, @"Invalid parameter not satisfying: %@", @"self.configuration.allowsDownload" object file lineNumber description];
  }
  char v8 = [(PUPickerCoordinator *)self downloadHelper];

  if (!v8)
  {
    id v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 973, @"Invalid parameter not satisfying: %@", @"self.downloadHelper" object file lineNumber description];
  }
  id v9 = [(PUPickerCoordinator *)self downloadProgresses];

  if (!v9)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 974, @"Invalid parameter not satisfying: %@", @"self.downloadProgresses" object file lineNumber description];
  }
  id v10 = [(PUPickerCoordinator *)self progressController];

  if (!v10)
  {
    id v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 975, @"Invalid parameter not satisfying: %@", @"self.progressController" object file lineNumber description];
  }
  uint64_t v11 = [(PUPickerCoordinator *)self selectionCoordinator];
  uint64_t v12 = [v11 selectedObjectIDs];

  if (!v12)
  {
    id v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 976, @"Invalid parameter not satisfying: %@", @"self.selectionCoordinator.selectedObjectIDs > 0" object file lineNumber description];
  }
  int v13 = [(PUPickerCoordinator *)self _createFetchResultUsingSelectedObjectIDs];
  id v14 = [v13 firstObject];

  uint64_t v15 = PLPickerGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    v50 = v14;
    _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_DEFAULT, "Starting legacy single selection for asset %@", buf, 0xCu);
  }

  uint64_t v16 = [(PUPickerCoordinator *)self photoPicker];
  id v43 = [(PUPickerCoordinator *)self configuration];
  BOOL v17 = [(PUPickerCoordinator *)self downloadHelper];
  BOOL v18 = +[PUPickerCoordinator _editingEnabled:v16];
  BOOL v19 = +[PUPickerCoordinator _viewImageBeforeSelectingEnabled:v16];
  BOOL v20 = +[PUPickerCoordinator _skipSelectionConfirmation:v16];
  long long v21 = [(PUPickerCoordinator *)self configuration];
  int v22 = [v21 allowsDownscaling];

  BOOL v23 = +[PUPickerCoordinator _assetCanPlay:v14];
  BOOL v24 = +[PUPickerCoordinator _shouldTreatAssetAsLivePhoto:v14 photoPicker:v16 configuration:v43];
  if (v22 | v20 | v18) {
    uint64_t v25 = v22 | (v22 | v20) ^ 1u;
  }
  else {
    uint64_t v25 = (v19 || v23) | v24;
  }
  [v17 cancelAllDownloads];
  uint64_t v48 = v14;
  int v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  int v27 = [v17 isAnyPickerAssetDownloading:v26];

  if (!v27)
  {
    [(PUPickerCoordinator *)self _completeSingleSelection:v14 showConfirmation:v25];
    goto LABEL_25;
  }
  id v28 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  uint64_t v29 = [(PUPickerCoordinator *)self photoPicker];
  if (!v29)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    v38 = (objc_class *)objc_opt_class();
    id v39 = NSStringFromClass(v38);
    [v37 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1005, @"%@ should be an instance inheriting from %@, but it is nil", @"self.photoPicker", v39 object file lineNumber description];
LABEL_28:

    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    v40 = (objc_class *)objc_opt_class();
    id v39 = NSStringFromClass(v40);
    id v41 = objc_msgSend(v29, "px_descriptionForAssertionMessage");
    [v37 handleFailureInMethod:a2, self, @"PUPickerCoordinator.m", 1005, @"%@ should be an instance inheriting from %@, but it is %@", @"self.photoPicker", v39, v41 object file lineNumber description];

    goto LABEL_28;
  }
LABEL_23:
  [(PUPickerCoordinator *)self presentProgressControllerFromViewController:v29 progress:v28];

  objc_initWeak((id *)buf, self);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __68__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectSingleAsset__block_invoke;
  v44[3] = &unk_1E5F26030;
  objc_copyWeak(&v46, (id *)buf);
  id v45 = v14;
  char v47 = v25;
  [v17 handleDownloadOfAssetIfNeeded:v45 inCollection:0 withSuccessHandler:v44];

  objc_destroyWeak(&v46);
  objc_destroyWeak((id *)buf);

LABEL_25:
}

void __68__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectSingleAsset__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    char v7 = [WeakRetained progressController];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectSingleAsset__block_invoke_2;
    v8[3] = &unk_1E5F2A840;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    id v9 = *(id *)(a1 + 32);
    char v11 = *(unsigned char *)(a1 + 48);
    [v7 hideWithCompletion:v8];

    objc_destroyWeak(&v10);
  }
}

void __68__PUPickerCoordinator_LegacyAPISupport__pu_legacy_selectSingleAsset__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _completeSingleSelection:*(void *)(a1 + 32) showConfirmation:*(unsigned __int8 *)(a1 + 48)];
}

- (void)pu_legacy_cancelPicker
{
  BOOL v4 = [(PUPickerCoordinator *)self photoPicker];

  if (!v4)
  {
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PUPickerCoordinator.m" lineNumber:960 description:@"PUPhotoPicker must not be nil."];
  }
  id v5 = PLPickerGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "Starting legacy picker cancel", v9, 2u);
  }

  char v6 = [(PUPickerCoordinator *)self downloadHelper];
  [v6 cancelAllDownloads];

  char v7 = [(PUPickerCoordinator *)self photoPicker];
  [v7 cancelPhotoPicker];
}

- (void)pu_legacy_didDisplayPicker
{
  BOOL v4 = [(PUPickerCoordinator *)self photoPicker];

  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PUPickerCoordinator.m" lineNumber:954 description:@"PUPhotoPicker must not be nil."];
  }
  id v6 = [(PUPickerCoordinator *)self photoPicker];
  [v6 didDisplayPhotoPickerSourceType:0];
}

+ (id)_extraArgumentsForResizeTaskDescriptor:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = v3;
  if (!v3
    || (([v3 targetSize], v5 == *MEMORY[0x1E4F396D8])
      ? (BOOL v7 = v6 == *(double *)(MEMORY[0x1E4F396D8] + 8))
      : (BOOL v7 = 0),
        v7))
  {
    id v9 = 0;
  }
  else
  {
    uint64_t v11 = *MEMORY[0x1E4F39A88];
    char v8 = objc_msgSend(NSNumber, "numberWithDouble:", fmax(v5, v6));
    v12[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }
  return v9;
}

+ (BOOL)_shouldTreatAssetAsLivePhoto:(id)a3 photoPicker:(id)a4 configuration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_11:
    BOOL v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"PUPickerCoordinator.m", 1225, @"Invalid parameter not satisfying: %@", @"photoPicker" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_12;
  }
  uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, a1, @"PUPickerCoordinator.m", 1224, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

  if (!v10) {
    goto LABEL_11;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_12:
  BOOL v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, a1, @"PUPickerCoordinator.m", 1226, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];

LABEL_4:
  uint64_t v12 = [v11 generatedFilter];
  if (!objc_msgSend(v12, "pu_legacy_mediaTypesIncludesLivePhoto"))
  {

    goto LABEL_8;
  }
  uint64_t v13 = [v9 playbackStyle];

  if (v13 != 3)
  {
LABEL_8:
    LOBYTE(v14) = 0;
    goto LABEL_9;
  }
  int v14 = [a1 _editingEnabled:v10] ^ 1;
LABEL_9:

  return v14;
}

+ (BOOL)_assetCanPlay:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"PUPickerCoordinator.m", 1206, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  unint64_t v6 = [v5 playbackStyle];
  unsigned int v7 = (v6 < 6) & (0x34u >> v6);

  return v7;
}

+ (BOOL)_editingEnabled:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PUPickerCoordinator.m", 1198, @"Invalid parameter not satisfying: %@", @"photoPicker" object file lineNumber description];
  }
  unint64_t v6 = [v5 properties];
  unsigned int v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FB29F0]];
  char v8 = [v7 BOOLValue];

  return v8;
}

+ (BOOL)_viewImageBeforeSelectingEnabled:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PUPickerCoordinator.m", 1190, @"Invalid parameter not satisfying: %@", @"photoPicker" object file lineNumber description];
  }
  unint64_t v6 = [v5 properties];
  unsigned int v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FB3278]];
  char v8 = [v7 BOOLValue];

  return v8;
}

+ (BOOL)_skipSelectionConfirmation:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"PUPickerCoordinator.m", 1182, @"Invalid parameter not satisfying: %@", @"photoPicker" object file lineNumber description];
  }
  unint64_t v6 = [v5 properties];
  unsigned int v7 = [v6 objectForKeyedSubscript:@"_UIImagePickerControllerSkipConfirmation"];
  char v8 = [v7 BOOLValue];

  return v8;
}

+ (BOOL)pu_legacy_shouldDownloadVideoComplement:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PUPickerCoordinator.m", 1098, @"Invalid parameter not satisfying: %@", @"photoPicker" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  BOOL v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, a1, @"PUPickerCoordinator.m", 1099, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];

LABEL_3:
  id v10 = [v9 generatedFilter];
  if (objc_msgSend(v10, "pu_legacy_mediaTypesIncludesLivePhoto")) {
    int v11 = [a1 _editingEnabled:v7] ^ 1;
  }
  else {
    LOBYTE(v11) = 0;
  }

  uint64_t v12 = [v7 properties];
  uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4FB31E0]];
  char v14 = [v13 BOOLValue];

  return v11 | v14;
}

@end