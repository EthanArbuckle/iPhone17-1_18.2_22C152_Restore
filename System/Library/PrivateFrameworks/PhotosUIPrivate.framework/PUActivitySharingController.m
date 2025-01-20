@interface PUActivitySharingController
- (BOOL)_shouldIncrementShareCountForActivityType:(id)a3;
- (BOOL)activityViewControllerShouldCancelAfterPreparationCanceled:(id)a3;
- (BOOL)allowsAirPlayActivity;
- (BOOL)allowsSuggestLessPersonActivity;
- (BOOL)excludeShareActivity;
- (NSArray)activities;
- (NSArray)excludedActivityTypes;
- (NSArray)selectedAssets;
- (NSDictionary)assetsFetchResultsByAssetCollection;
- (NSDictionary)selectedAssetsByAssetCollection;
- (PHAsset)currentAsset;
- (PHPerson)person;
- (PHResourceLocalAvailabilityRequest)resourcesPreheatRequest;
- (PUActivitySharingController)init;
- (PUActivitySharingController)initWithActivitySharingConfiguration:(id)a3;
- (PUActivitySharingController)new;
- (PUActivitySharingViewModel)viewModel;
- (PUActivityViewController)internalActivityViewController;
- (PUCarouselSharingViewController)carouselViewController;
- (PXActivitySharingControllerDelegate)delegate;
- (PXActivityViewController)activityViewController;
- (PXSelectionSnapshot)selectionSnapshot;
- (id)_assetItemsForAssetsFetchResult:(id)a3;
- (id)_createActivityViewControllerWithActivities:(id)a3;
- (id)activityViewControllerIfAvailable;
- (id)photosDataSource;
- (void)_activitySharingControllerWillDismissActivityViewController;
- (void)_activityViewControllerDidCompleteWithActivityType:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_cancel;
- (void)_cancelPreheatResourcesRequest;
- (void)_createPhotosViewControllerIfNeeded;
- (void)_handlePreheatRequestCompletionWithSuccess:(BOOL)a3 cancelled:(BOOL)a4 error:(id)a5;
- (void)_incrementShareCountForSelectedAssets;
- (void)_preheatResources;
- (void)_updateActionSheetPresentationStyleIfNeeded;
- (void)_updateExcludedActivityTypes;
- (void)_updatePreheatResourcesRequest;
- (void)_updateSelectedAssetIdentifiers;
- (void)carouselSharingViewController:(id)a3 addAssetItem:(id)a4;
- (void)carouselSharingViewController:(id)a3 removeAssetItem:(id)a4;
- (void)carouselSharingViewController:(id)a3 replaceAssetItem:(id)a4 withAssetItem:(id)a5;
- (void)carouselSharingViewController:(id)a3 setAssetItems:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)selectInitialAssets;
- (void)setActivities:(id)a3;
- (void)setAllowsAirPlayActivity:(BOOL)a3;
- (void)setAllowsSuggestLessPersonActivity:(BOOL)a3;
- (void)setAssetsFetchResultsByAssetCollection:(id)a3;
- (void)setCarouselViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExcludedActivityTypes:(id)a3;
- (void)setInternalActivityViewController:(id)a3;
- (void)setPerson:(id)a3;
- (void)setResourcesPreheatRequest:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation PUActivitySharingController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_internalActivityViewController);
  objc_storeStrong((id *)&self->_resourcesPreheatRequest, 0);
  objc_storeStrong((id *)&self->_carouselViewController, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_assetsFetchResultsByAssetCollection, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_initialAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_stackViewController, 0);
}

- (void)setInternalActivityViewController:(id)a3
{
}

- (PUActivityViewController)internalActivityViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalActivityViewController);
  return (PUActivityViewController *)WeakRetained;
}

- (void)setResourcesPreheatRequest:(id)a3
{
}

- (PHResourceLocalAvailabilityRequest)resourcesPreheatRequest
{
  return self->_resourcesPreheatRequest;
}

- (BOOL)excludeShareActivity
{
  return self->_excludeShareActivity;
}

- (void)setCarouselViewController:(id)a3
{
}

- (void)setActivities:(id)a3
{
}

- (NSArray)activities
{
  return self->_activities;
}

- (void)setExcludedActivityTypes:(id)a3
{
}

- (NSArray)excludedActivityTypes
{
  return self->_excludedActivityTypes;
}

- (void)setPerson:(id)a3
{
}

- (PHPerson)person
{
  return self->_person;
}

- (void)setAllowsSuggestLessPersonActivity:(BOOL)a3
{
  self->_allowsSuggestLessPersonActivity = a3;
}

- (BOOL)allowsSuggestLessPersonActivity
{
  return self->_allowsSuggestLessPersonActivity;
}

- (void)setAllowsAirPlayActivity:(BOOL)a3
{
  self->_allowsAirPlayActivity = a3;
}

- (BOOL)allowsAirPlayActivity
{
  return self->_allowsAirPlayActivity;
}

- (void)setAssetsFetchResultsByAssetCollection:(id)a3
{
}

- (NSDictionary)assetsFetchResultsByAssetCollection
{
  return self->_assetsFetchResultsByAssetCollection;
}

- (void)setViewModel:(id)a3
{
}

- (PUActivitySharingViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setDelegate:(id)a3
{
}

- (PXActivitySharingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXActivitySharingControllerDelegate *)WeakRetained;
}

- (void)_updatePreheatResourcesRequest
{
  v3 = [(PUActivitySharingController *)self resourcesPreheatRequest];

  if (v3)
  {
    id v7 = [(PUActivitySharingController *)self resourcesPreheatRequest];
    v4 = [(PUActivitySharingController *)self selectedAssets];
    v5 = [v7 asset];
    char v6 = [v4 containsObject:v5];

    if ((v6 & 1) == 0) {
      [(PUActivitySharingController *)self _cancelPreheatResourcesRequest];
    }
  }
}

- (void)_cancelPreheatResourcesRequest
{
  v3 = [(PUActivitySharingController *)self resourcesPreheatRequest];
  [v3 cancelRetrievalRequest];

  [(PUActivitySharingController *)self setResourcesPreheatRequest:0];
}

- (void)_handlePreheatRequestCompletionWithSuccess:(BOOL)a3 cancelled:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v9 = PLShareSheetGetLog();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(PUActivitySharingController *)self resourcesPreheatRequest];
      v12 = [v11 asset];
      v13 = [v12 uuid];
      int v18 = 134218242;
      v19 = self;
      __int16 v20 = 2114;
      v21 = v13;
      v14 = "<PUActivitySharingController:%p> Share Sheet Preheat Resources Request finished with success for asset uuid %{public}@";
LABEL_7:
      v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      uint32_t v17 = 22;
LABEL_10:
      _os_log_impl(&dword_1AE9F8000, v15, v16, v14, (uint8_t *)&v18, v17);
    }
  }
  else if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(PUActivitySharingController *)self resourcesPreheatRequest];
      v12 = [v11 asset];
      v13 = [v12 uuid];
      int v18 = 134218242;
      v19 = self;
      __int16 v20 = 2114;
      v21 = v13;
      v14 = "<PUActivitySharingController:%p> Share Sheet Preheat Resources Request cancelled for asset uuid %{public}@";
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11 = [(PUActivitySharingController *)self resourcesPreheatRequest];
    v12 = [v11 asset];
    v13 = [v12 uuid];
    int v18 = 134218498;
    v19 = self;
    __int16 v20 = 2114;
    v21 = v13;
    __int16 v22 = 2114;
    id v23 = v8;
    v14 = "<PUActivitySharingController:%p> Share Sheet Preheat Resources Request failed for asset uuid %{public}@ with e"
          "rror: %{public}@";
    v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    uint32_t v17 = 32;
    goto LABEL_10;
  }

  [(PUActivitySharingController *)self setResourcesPreheatRequest:0];
}

- (void)_preheatResources
{
  v3 = [(PUActivitySharingController *)self selectedAssets];
  if ([v3 count] == 1)
  {
    v4 = [v3 firstObject];
    BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F39270]) initWithAsset:v4 requestType:1];
    [(PUActivitySharingController *)self setResourcesPreheatRequest:v5];
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__PUActivitySharingController__preheatResources__block_invoke;
    v6[3] = &unk_1E5F22B48;
    objc_copyWeak(&v7, &location);
    [v5 retrieveRequiredResourcesWithOptions:0 completionHandler:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __48__PUActivitySharingController__preheatResources__block_invoke(uint64_t a1, char a2, char a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  char v13 = a2;
  char v14 = a3;
  id v11 = v10;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v12);
}

void __48__PUActivitySharingController__preheatResources__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handlePreheatRequestCompletionWithSuccess:*(unsigned __int8 *)(a1 + 48) cancelled:*(unsigned __int8 *)(a1 + 49) error:*(void *)(a1 + 32)];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v10 = a3;
  if ((v6 & 1) == 0 || (void *)PUActivitySharingControllerViewModelObserverContext != a5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PUActivitySharingController.m" lineNumber:481 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  [(PUActivitySharingController *)self _updateActionSheetPresentationStyleIfNeeded];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = [(PUActivitySharingController *)self delegate];
  [v4 activitySharingControllerDidCancel:self];
}

- (void)carouselSharingViewController:(id)a3 replaceAssetItem:(id)a4 withAssetItem:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(PUActivitySharingController *)self internalActivityViewController];
  [v9 replaceAssetItem:v8 withAssetItem:v7];

  [(PUActivitySharingController *)self _updatePreheatResourcesRequest];
}

- (void)carouselSharingViewController:(id)a3 setAssetItems:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v6 = [(PUActivitySharingController *)self internalActivityViewController];
  int v7 = [v6 isUsingCustomItems];

  if (v7)
  {
    id v8 = PLShareSheetGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = [(PUActivitySharingController *)self internalActivityViewController];
      int v12 = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      v15 = v10;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "<%@:%p>: Ignoring carousel changes. Using custom items", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    id v11 = [(PUActivitySharingController *)self internalActivityViewController];
    [v11 setAssetItems:v5];

    [(PUActivitySharingController *)self _updateSelectedAssetIdentifiers];
    [(PUActivitySharingController *)self _updatePreheatResourcesRequest];
  }
}

- (void)carouselSharingViewController:(id)a3 removeAssetItem:(id)a4
{
  id v5 = a4;
  char v6 = [(PUActivitySharingController *)self internalActivityViewController];
  [v6 removeAssetItem:v5];

  int v7 = [v5 asset];

  id v12 = [v7 localIdentifier];

  id v8 = [(PUActivitySharingController *)self internalActivityViewController];
  uint64_t v9 = [v8 _selectedAssetIdentifiers];
  id v10 = (void *)[v9 mutableCopy];

  [v10 removeObject:v12];
  id v11 = [(PUActivitySharingController *)self internalActivityViewController];
  [v11 _setSelectedAssetIdentifiers:v10];

  [(PUActivitySharingController *)self _updatePreheatResourcesRequest];
}

- (void)carouselSharingViewController:(id)a3 addAssetItem:(id)a4
{
  id v5 = a4;
  char v6 = [(PUActivitySharingController *)self internalActivityViewController];
  [v6 addAssetItem:v5];

  int v7 = [v5 asset];

  id v13 = [v7 localIdentifier];

  id v8 = [(PUActivitySharingController *)self internalActivityViewController];
  uint64_t v9 = [v8 _selectedAssetIdentifiers];

  if (([v9 containsObject:v13] & 1) == 0)
  {
    if (v9)
    {
      id v10 = (void *)[v9 mutableCopy];
    }
    else
    {
      id v10 = [MEMORY[0x1E4F1CA48] array];
    }
    id v11 = v10;
    [v10 addObject:v13];
    id v12 = [(PUActivitySharingController *)self internalActivityViewController];
    [v12 _setSelectedAssetIdentifiers:v11];
  }
  [(PUActivitySharingController *)self _updatePreheatResourcesRequest];
}

- (void)_updateSelectedAssetIdentifiers
{
  v3 = (void *)MEMORY[0x1E4F1CAA0];
  id v4 = [(PUActivitySharingController *)self selectedAssets];
  id v8 = [v3 orderedSetWithArray:v4];

  id v5 = [v8 valueForKey:@"localIdentifier"];
  char v6 = [v5 array];

  int v7 = [(PUActivitySharingController *)self internalActivityViewController];
  [v7 _setSelectedAssetIdentifiers:v6];
}

- (void)_updateActionSheetPresentationStyleIfNeeded
{
  v3 = [(PUActivitySharingController *)self viewModel];
  char v4 = [v3 isActionSheet];

  if ((v4 & 1) == 0)
  {
    [(PUActivitySharingController *)self _createPhotosViewControllerIfNeeded];
    id v5 = [(PUActivitySharingController *)self viewModel];
    char v6 = [v5 selectionManager];
    int v7 = [(PUActivitySharingController *)self viewModel];
    id v8 = [v7 collectionListFetchResult];
    [v6 selectAllAssetsInAssetCollections:v8];

    uint64_t v9 = 16;
    if (!self->_usePhotosStack) {
      uint64_t v9 = 88;
    }
    uint64_t v10 = *(uint64_t *)((char *)&self->super.isa + v9);
    id v11 = [(PUActivitySharingController *)self internalActivityViewController];
    [v11 setPhotosCarouselViewController:v10];

    id v12 = [(PUActivitySharingController *)self carouselViewController];
    id v14 = [v12 currentActivityAssetItems];

    id v13 = [(PUActivitySharingController *)self internalActivityViewController];
    [v13 setAssetItems:v14];

    [(PUActivitySharingController *)self _updateSelectedAssetIdentifiers];
  }
}

- (BOOL)activityViewControllerShouldCancelAfterPreparationCanceled:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLShareSheetGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412802;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2048;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    id v6 = v9;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "<%@:%p>: preparation was cancelled for activityViewController:%@", (uint8_t *)&v8, 0x20u);
  }
  [(PUActivitySharingController *)self _cancel];

  return 0;
}

- (void)_activitySharingControllerWillDismissActivityViewController
{
  v3 = [(PUActivitySharingController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PUActivitySharingController *)self delegate];
    [v5 activitySharingControllerWillDismissActivityViewController:self];
  }
  [(PUActivitySharingController *)self _cancelPreheatResourcesRequest];
}

- (void)_cancel
{
  v3 = [(PUActivitySharingController *)self delegate];
  objc_initWeak(&location, self);
  char v4 = [(PUActivitySharingController *)self internalActivityViewController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__PUActivitySharingController__cancel__block_invoke;
  v7[3] = &unk_1E5F22AF8;
  id v5 = v3;
  id v8 = v5;
  objc_copyWeak(&v9, &location);
  [v4 setCompletionWithItemsHandler:v7];

  id v6 = [(PUActivitySharingController *)self internalActivityViewController];
  [v6 _cancel];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __38__PUActivitySharingController__cancel__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 activitySharingControllerDidCancel:WeakRetained];
}

- (void)_incrementShareCountForSelectedAssets
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [(PUActivitySharingController *)self internalActivityViewController];
  v3 = [v2 assets];

  PXIncrementShareCountForAssets();
  char v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    uint64_t v10 = *MEMORY[0x1E4F56560];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "px_currentVariationType", (void)v14))
        {
          __int16 v12 = (void *)MEMORY[0x1E4F56658];
          uint64_t v18 = v10;
          v19 = v5;
          id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
          [v12 sendEvent:@"com.apple.photos.CPAnalytics.sharing.livePhotoShared" withPayload:v13];
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v8);
  }
}

- (BOOL)_shouldIncrementShareCountForActivityType:(id)a3
{
  id v3 = a3;
  if (+[PUActivityViewController isShareActivity:v3]) {
    int v4 = [v3 isEqualToString:*MEMORY[0x1E4F9F348]] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (PHAsset)currentAsset
{
  if (self->_usePhotosStack)
  {
    v2 = [(PUPhotosSharingStackViewController *)self->_stackViewController currentAsset];
  }
  else
  {
    id v3 = [(PUActivitySharingController *)self carouselViewController];
    v2 = [v3 currentAsset];
  }
  return (PHAsset *)v2;
}

- (void)_activityViewControllerDidCompleteWithActivityType:(id)a3 success:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = PLShareSheetGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    id v12 = v11;
    id v13 = [(PUActivitySharingController *)self internalActivityViewController];
    long long v14 = @"NO";
    if (v6) {
      long long v14 = @"YES";
    }
    long long v15 = v14;
    int v19 = 138413570;
    __int16 v20 = v11;
    __int16 v21 = 2048;
    __int16 v22 = self;
    __int16 v23 = 2112;
    uint64_t v24 = v13;
    __int16 v25 = 2112;
    id v26 = v8;
    __int16 v27 = 2112;
    v28 = v15;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEFAULT, "<%@:%p>: activityViewController %@ did complete with activity type:%@ didComplete:%@ error:%@", (uint8_t *)&v19, 0x3Eu);
  }
  if (v6
    && [(PUActivitySharingController *)self _shouldIncrementShareCountForActivityType:v8])
  {
    [(PUActivitySharingController *)self _incrementShareCountForSelectedAssets];
  }
  if (v8
    && (([(PUActivitySharingController *)self internalActivityViewController],
         long long v16 = objc_claimAutoreleasedReturnValue(),
         [v16 presentingViewController],
         long long v17 = objc_claimAutoreleasedReturnValue(),
         v17,
         v16,
         v17)
     || v6))
  {
    uint64_t v18 = [(PUActivitySharingController *)self delegate];
    [v18 activitySharingController:self didCompleteWithActivityType:v8 success:v6];
  }
  else
  {
    uint64_t v18 = [(PUActivitySharingController *)self delegate];
    [v18 activitySharingControllerDidCancel:self];
  }
}

- (void)_updateExcludedActivityTypes
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  if (![(PUActivitySharingController *)self allowsAirPlayActivity]) {
    [v3 addObject:*MEMORY[0x1E4F90948]];
  }
  if (![(PUActivitySharingController *)self allowsSuggestLessPersonActivity]) {
    [v3 addObject:*MEMORY[0x1E4F90B10]];
  }
  int v4 = [(PUActivitySharingController *)self person];
  uint64_t v5 = [v4 faceCount];

  if (v5 <= 1)
  {
    uint64_t v6 = *MEMORY[0x1E4F90A78];
    v21[0] = *MEMORY[0x1E4F90AB8];
    v21[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    [v3 addObjectsFromArray:v7];
  }
  id v8 = [(PUActivitySharingController *)self excludedActivityTypes];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = [(PUActivitySharingController *)self excludedActivityTypes];
    [v3 addObjectsFromArray:v10];
  }
  uint64_t v11 = PLShareSheetGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412802;
    id v16 = (id)objc_opt_class();
    __int16 v17 = 2048;
    uint64_t v18 = self;
    __int16 v19 = 2112;
    __int16 v20 = v3;
    id v12 = v16;
    _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEFAULT, "<%@:%p>: set ExcludedActivityTypes: %@", (uint8_t *)&v15, 0x20u);
  }
  id v13 = [v3 allObjects];
  long long v14 = [(PUActivitySharingController *)self internalActivityViewController];
  [v14 setExcludedActivityTypes:v13];
}

- (id)_createActivityViewControllerWithActivities:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(PUActivitySharingController *)self viewModel];
  int v7 = [v6 isActionSheet];

  if (v7)
  {
    id v8 = +[PUActivityViewController actionSheetPhotosApplicationActivities];
    uint64_t v9 = [v5 arrayByAddingObjectsFromArray:v8];

    uint64_t v10 = 0;
    uint64_t v11 = 0;
    v36 = 0;
    id v5 = (id)v9;
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F1CAA0];
    id v13 = [(PUActivitySharingController *)self selectedAssets];
    v36 = [v12 orderedSetWithArray:v13];

    long long v14 = [v36 valueForKey:@"localIdentifier"];
    uint64_t v11 = [v14 array];

    if (self->_usePhotosStack)
    {
      stackViewController = self->_stackViewController;
      if (!stackViewController)
      {
        v34 = [MEMORY[0x1E4F28B00] currentHandler];
        [v34 handleFailureInMethod:a2, self, @"PUActivitySharingController.m", 222, @"Invalid parameter not satisfying: %@", @"_stackViewController" object file lineNumber description];

        stackViewController = self->_stackViewController;
      }
      id v16 = [(PUPhotosSharingStackViewController *)stackViewController assetFetchResult];
      uint64_t v10 = [(PUActivitySharingController *)self _assetItemsForAssetsFetchResult:v16];
    }
    else
    {
      carouselViewController = self->_carouselViewController;
      if (!carouselViewController)
      {
        v35 = [MEMORY[0x1E4F28B00] currentHandler];
        [v35 handleFailureInMethod:a2, self, @"PUActivitySharingController.m", 225, @"Invalid parameter not satisfying: %@", @"_carouselViewController" object file lineNumber description];

        carouselViewController = self->_carouselViewController;
      }
      uint64_t v10 = [(PUCarouselSharingViewController *)carouselViewController currentActivityAssetItems];
    }
    uint64_t v18 = [v36 firstObject];
    __int16 v19 = [v18 photoLibrary];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__PUActivitySharingController__createActivityViewControllerWithActivities___block_invoke;
    block[3] = &unk_1E5F2ED10;
    id v46 = v19;
    id v20 = v19;
    dispatch_block_t v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
    __int16 v22 = dispatch_get_global_queue(21, 0);
    dispatch_async(v22, v21);
  }
  __int16 v23 = [[PUActivityViewController alloc] initWithAssetItems:v10 photosApplicationActivities:v5 linkPresentation:0 assetIdentifiers:v11 sharingViewModel:self->_viewModel];
  [(PUActivityViewController *)v23 setDelegate:self];
  [(PUActivityViewController *)v23 setAirDropDelegate:self];
  [(PUActivityViewController *)v23 setActivitySharingController:self];
  [(PUActivityViewController *)v23 setEnableNewDesignInPhotos:1];
  [(PUActivityViewController *)v23 setAllowsCustomPresentationStyle:1];
  [(PUActivityViewController *)v23 setModalPresentationStyle:2];
  uint64_t v24 = [(PUActivityViewController *)v23 presentationController];
  [v24 setDelegate:self];

  if (v7)
  {
    if ([(PUActivitySharingController *)self excludeShareActivity]) {
      uint64_t v25 = 2;
    }
    else {
      uint64_t v25 = 1;
    }
    [(PUActivityViewController *)v23 setSharingStyle:v25];
    id v26 = [v5 valueForKey:@"activityType"];
    [(PUActivityViewController *)v23 setIncludedActivityTypes:v26];
    [(PUActivityViewController *)v23 setWhitelistActionActivitiesOnly:1];
  }
  else
  {
    [(PUActivityViewController *)v23 setSharingStyle:0];
    uint64_t v27 = 16;
    if (!self->_usePhotosStack) {
      uint64_t v27 = 88;
    }
    [(PUActivityViewController *)v23 setPhotosCarouselViewController:*(Class *)((char *)&self->super.isa + v27)];
  }
  v28 = PLShareSheetGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v29 = objc_opt_class();
    *(_DWORD *)buf = 138412802;
    v48 = v29;
    __int16 v49 = 2048;
    v50 = self;
    __int16 v51 = 2112;
    v52 = v23;
    id v30 = v29;
    _os_log_impl(&dword_1AE9F8000, v28, OS_LOG_TYPE_DEFAULT, "<%@:%p>: creating PUActivityViewController:%@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v23);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PUActivitySharingController__createActivityViewControllerWithActivities___block_invoke_234;
  aBlock[3] = &unk_1E5F22AA8;
  objc_copyWeak(&v42, &location);
  objc_copyWeak(&v43, (id *)buf);
  uint64_t v31 = _Block_copy(aBlock);
  [(PUActivityViewController *)v23 setCompletionWithItemsHandler:v31];
  [(PUActivityViewController *)v23 setReadyForInteraction:0];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __75__PUActivitySharingController__createActivityViewControllerWithActivities___block_invoke_2_236;
  v37[3] = &unk_1E5F22AD0;
  objc_copyWeak(&v38, &location);
  char v40 = v7;
  objc_copyWeak(&v39, (id *)buf);
  v32 = _Block_copy(v37);
  [(PUActivityViewController *)v23 _setShareSheetReadyToInteractHandler:v32];

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v38);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return v23;
}

uint64_t __75__PUActivitySharingController__createActivityViewControllerWithActivities___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestGraphReadyNotificationWithCoalescingIdentifier:0 completion:&__block_literal_global_3916];
}

void __75__PUActivitySharingController__createActivityViewControllerWithActivities___block_invoke_234(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = (id *)(a1 + 32);
  id v9 = a5;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  char v12 = [WeakRetained allowsEmbedding];

  if ((v12 & 1) == 0)
  {
    id v13 = objc_loadWeakRetained(v8);
    [v13 setAirDropDelegate:0];
  }
  id v14 = objc_loadWeakRetained((id *)(a1 + 40));
  [v14 _activityViewControllerDidCompleteWithActivityType:v10 success:a3 error:v9];
}

void __75__PUActivitySharingController__createActivityViewControllerWithActivities___block_invoke_2_236(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setReadyForInteraction:1];

  if (!*(unsigned char *)(a1 + 48))
  {
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    [v3 _preheatResources];
  }
}

- (id)_assetItemsForAssetsFetchResult:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [PUActivityAssetItem alloc];
        char v12 = -[PUActivityAssetItem initWithAsset:](v11, "initWithAsset:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)selectInitialAssets
{
  id v3 = [(PUActivitySharingController *)self viewModel];
  int v4 = [v3 selectionManager];
  id v5 = [(PUActivitySharingController *)self viewModel];
  uint64_t v6 = [v5 collectionListFetchResult];
  [v4 selectInitialAssetsInAssetCollections:v6];

  [(PUActivitySharingController *)self _updateSelectedAssetIdentifiers];
}

- (NSArray)selectedAssets
{
  id v3 = [(PUActivitySharingController *)self viewModel];
  int v4 = [v3 selectionManager];
  id v5 = [(PUActivitySharingController *)self viewModel];
  uint64_t v6 = [v5 collectionListFetchResult];
  uint64_t v7 = [v4 selectedAssetsWithAssetCollectionOrdering:v6];

  return (NSArray *)v7;
}

- (NSDictionary)selectedAssetsByAssetCollection
{
  v2 = [(PUActivitySharingController *)self viewModel];
  id v3 = [v2 selectionManager];
  int v4 = [v3 selectedAssetsByAssetCollection];

  return (NSDictionary *)v4;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  v2 = [(PUActivitySharingController *)self viewModel];
  id v3 = [v2 selectionManager];
  int v4 = [v3 selectionSnapshot];

  return (PXSelectionSnapshot *)v4;
}

- (id)photosDataSource
{
  v2 = [(PUActivitySharingController *)self viewModel];
  id v3 = [v2 photosDataSource];

  return v3;
}

- (PXActivityViewController)activityViewController
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_internalActivityViewController = &self->_internalActivityViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalActivityViewController);

  if (!WeakRetained)
  {
    if (self->_activityViewControllerWasCreated)
    {
      uint64_t v6 = PLShareSheetGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v18 = (id)objc_opt_class();
        __int16 v19 = 2048;
        id v20 = self;
        id v7 = v18;
        _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "<%@:%p>: Accessing lazy activityViewController getter when it has been dealloced already.", buf, 0x16u);
      }
    }
    self->_activityViewControllerWasCreated = 1;
    uint64_t v8 = [(PUActivitySharingController *)self viewModel];
    char v9 = [v8 isActionSheet];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [(PUActivitySharingController *)self viewModel];
      uint64_t v11 = [v10 selectionManager];
      char v12 = [v11 isAnyAssetSelected];

      if ((v12 & 1) == 0)
      {
        long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
        [v16 handleFailureInMethod:a2, self, @"PUActivitySharingController.m", 170, @"Invalid parameter not satisfying: %@", @"self.viewModel.selectionManager.isAnyAssetSelected" object file lineNumber description];
      }
    }
    id v13 = [(PUActivitySharingController *)self _createActivityViewControllerWithActivities:self->_activities];
    objc_storeWeak((id *)p_internalActivityViewController, v13);

    [(PUActivitySharingController *)self _updateExcludedActivityTypes];
  }
  id v14 = objc_loadWeakRetained((id *)p_internalActivityViewController);
  return (PXActivityViewController *)v14;
}

- (id)activityViewControllerIfAvailable
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUActivitySharingController *)self internalActivityViewController];
  if (!v3)
  {
    BOOL activityViewControllerWasCreated = self->_activityViewControllerWasCreated;
    id v5 = PLShareSheetGetLog();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (activityViewControllerWasCreated)
    {
      if (v6)
      {
        int v10 = 138412546;
        id v11 = (id)objc_opt_class();
        __int16 v12 = 2048;
        id v13 = self;
        id v7 = v11;
        uint64_t v8 = "<%@:%p>:  Accessing activityViewControllerIfAvailable when it has been dealloced already.";
LABEL_7:
        _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v10, 0x16u);
      }
    }
    else if (v6)
    {
      int v10 = 138412546;
      id v11 = (id)objc_opt_class();
      __int16 v12 = 2048;
      id v13 = self;
      id v7 = v11;
      uint64_t v8 = "<%@:%p>:  Accessing activityViewControllerIfAvailable before it has been created.";
      goto LABEL_7;
    }
  }
  return v3;
}

- (PUCarouselSharingViewController)carouselViewController
{
  if (self->_usePhotosStack)
  {
    BOOL v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUActivitySharingController.m" lineNumber:143 description:@"Attempting to obtain carousel when using photos stack view"];
  }
  carouselViewController = self->_carouselViewController;
  return carouselViewController;
}

- (void)_createPhotosViewControllerIfNeeded
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_usePhotosStack)
  {
    if (self->_stackViewController)
    {
      id v3 = PLShareSheetGetLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412546;
        id v17 = (id)objc_opt_class();
        __int16 v18 = 2048;
        __int16 v19 = self;
        id v4 = v17;
        id v5 = "<%@:%p>: _createPhotosViewControllerIfNeeded called for a non-nil _stackViewController...";
LABEL_8:
        _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v16, 0x16u);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
    BOOL v6 = [[PUPhotosSharingStackViewController alloc] initWithAssetFetchResult:self->_initialAssetsFetchResult];
    stackViewController = self->_stackViewController;
    self->_stackViewController = v6;
  }
  else
  {
    if (self->_carouselViewController)
    {
      id v3 = PLShareSheetGetLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412546;
        id v17 = (id)objc_opt_class();
        __int16 v18 = 2048;
        __int16 v19 = self;
        id v4 = v17;
        id v5 = "<%@:%p>: _createPhotosViewControllerIfNeeded called for a non-nil _carouselViewController...";
        goto LABEL_8;
      }
LABEL_9:

      return;
    }
    uint64_t v8 = [PUCarouselSharingViewController alloc];
    char v9 = [(PUActivitySharingViewModel *)self->_viewModel collectionListFetchResult];
    assetsFetchResultsByAssetCollection = self->_assetsFetchResultsByAssetCollection;
    id v11 = [(PUActivitySharingViewModel *)self->_viewModel selectionManager];
    __int16 v12 = [(PUCarouselSharingViewController *)v8 initWithPhotoCollectionsFetchResult:v9 assetsFetchResultsByAssetCollection:assetsFetchResultsByAssetCollection selection:v11];

    [(PUCarouselSharingViewController *)v12 setDelegate:self];
    id v13 = [(PUActivitySharingViewModel *)self->_viewModel photosDataSource];
    [(PUCarouselSharingViewController *)v12 setPhotosDataSource:v13];

    uint64_t v14 = [(PUActivitySharingViewModel *)self->_viewModel selectionManager];
    [v14 setDataSource:v12];

    carouselViewController = self->_carouselViewController;
    self->_carouselViewController = v12;
  }
}

- (PUActivitySharingController)initWithActivitySharingConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PUActivitySharingController.m", 91, @"Invalid parameter not satisfying: %@", @"activitySharingConfiguration" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)PUActivitySharingController;
  BOOL v6 = [(PUActivitySharingController *)&v23 init];
  if (v6)
  {
    id v7 = [[PUActivitySharingViewModel alloc] initWithActivitySharingConfiguration:v5];
    viewModel = v6->_viewModel;
    v6->_viewModel = v7;

    [(PUActivitySharingViewModel *)v6->_viewModel registerChangeObserver:v6 context:PUActivitySharingControllerViewModelObserverContext];
    uint64_t v9 = [v5 assetsFetchResultsByAssetCollection];
    assetsFetchResultsByAssetCollection = v6->_assetsFetchResultsByAssetCollection;
    v6->_assetsFetchResultsByAssetCollection = (NSDictionary *)v9;

    v6->_allowsAirPlayActivity = [v5 allowsAirPlayActivity];
    v6->_allowsSuggestLessPersonActivity = [v5 allowsSuggestLessPersonActivity];
    uint64_t v11 = [v5 person];
    person = v6->_person;
    v6->_person = (PHPerson *)v11;

    uint64_t v13 = [v5 excludedActivityTypes];
    excludedActivityTypes = v6->_excludedActivityTypes;
    v6->_excludedActivityTypes = (NSArray *)v13;

    uint64_t v15 = [v5 activities];
    activities = v6->_activities;
    v6->_activities = (NSArray *)v15;

    v6->_excludeShareActivity = [v5 excludeShareActivity];
    uint64_t v17 = [v5 initialAssetsFetchResult];
    initialAssetsFetchResult = v6->_initialAssetsFetchResult;
    v6->_initialAssetsFetchResult = (PHFetchResult *)v17;

    int v19 = _os_feature_enabled_impl();
    v6->_usePhotosStack = v19;
    if (v19 && !v6->_initialAssetsFetchResult)
    {
      __int16 v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, v6, @"PUActivitySharingController.m", 109, @"Invalid parameter not satisfying: %@", @"_initialAssetsFetchResult" object file lineNumber description];
    }
    if (![(PUActivitySharingViewModel *)v6->_viewModel isActionSheet]) {
      [(PUActivitySharingController *)v6 _createPhotosViewControllerIfNeeded];
    }
  }

  return v6;
}

- (PUActivitySharingController)new
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUActivitySharingController.m", 87, @"%s is not available as initializer", "-[PUActivitySharingController new]");

  abort();
}

- (PUActivitySharingController)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUActivitySharingController.m", 83, @"%s is not available as initializer", "-[PUActivitySharingController init]");

  abort();
}

@end