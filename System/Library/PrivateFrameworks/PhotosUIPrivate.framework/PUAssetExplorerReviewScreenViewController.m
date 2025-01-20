@interface PUAssetExplorerReviewScreenViewController
- (BOOL)_lowMemoryMode;
- (BOOL)assetExplorerReviewScreenActionManager:(id)a3 canPerformActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6;
- (BOOL)assetExplorerReviewScreenActionManager:(id)a3 shouldEnableActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6;
- (BOOL)useSystemBackgroundColorBar;
- (NSIndexPath)initialIndexPath;
- (NSMutableDictionary)_reviewAssetRequestsByUUID;
- (NSMutableDictionary)_substituteAssetsByUUID;
- (NSNumber)selectionCountLimit;
- (NSSet)initialDisabledLivePhotoAssetUUIDs;
- (NSSet)initialSelectedAssetUUIDs;
- (PUAssetExplorerAnalytics)assetExplorerAnalytics;
- (PUAssetExplorerReviewScreenActionManager)_actionManager;
- (PUAssetExplorerReviewScreenAssetsDataSourceManager)_reviewDataSourceManager;
- (PUAssetExplorerReviewScreenViewController)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4 reviewAssetProvider:(id)a5 initialIndexPath:(id)a6 initialSelectedAssetUUIDs:(id)a7 initialDisabledLivePhotoAssetUUIDs:(id)a8 selectionCountLimit:(id)a9 sourceType:(unint64_t)a10 lowMemoryMode:(BOOL)a11 options:(unint64_t)a12;
- (PUAssetExplorerReviewScreenViewController)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4 reviewAssetProvider:(id)a5 initialIndexPath:(id)a6 initialSelectedAssetUUIDs:(id)a7 initialDisabledLivePhotoAssetUUIDs:(id)a8 selectionCountLimit:(id)a9 sourceType:(unint64_t)a10 lowMemoryMode:(BOOL)a11 reviewBarsModel:(id)a12 resizeTaskDescriptorViewModel:(id)a13 options:(unint64_t)a14;
- (PUAssetExplorerReviewScreenViewController)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4 reviewAssetProvider:(id)a5 initialIndexPath:(id)a6 initialSelectedAssetUUIDs:(id)a7 initialDisabledLivePhotoAssetUUIDs:(id)a8 sourceType:(unint64_t)a9;
- (PUAssetExplorerReviewScreenViewController)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4 reviewAssetProvider:(id)a5 initialIndexPath:(id)a6 initialSelectedAssetUUIDs:(id)a7 initialDisabledLivePhotoAssetUUIDs:(id)a8 sourceType:(unint64_t)a9 reviewBarsModel:(id)a10 options:(unint64_t)a11;
- (PUAssetExplorerReviewScreenViewControllerDelegate)delegate;
- (PUAssetsDataSourceManager)_clientDataSourceManager;
- (PUBrowsingSession)_browsingSession;
- (PUJoiningMediaProvider)_reviewMediaProvider;
- (PUMediaProvider)_clientMediaProvider;
- (PUNavigationController)_navigationController;
- (PUPhotoPickerResizeTaskDescriptorViewModel)resizeTaskDescriptorViewModel;
- (PUReviewAssetProvider)_reviewAssetProvider;
- (PUReviewScreenBarsModel)reviewBarsModel;
- (PUReviewScreenSpec)_spec;
- (PXActivityProgressController)_requestProgressController;
- (UIAlertController)_failedReviewAssetRequestAlertController;
- (id)_createBrowsingSessionIfNecessary;
- (id)_createProgressControllerForRemainingRequests:(id)a3;
- (id)_createReviewAssetRequestForAsset:(id)a3;
- (id)_fileSizeMenuForSelectedUUIDs:(id)a3;
- (id)_getSelectedSubstituteAssetsAndRemoveFilesForUnneededAssets;
- (id)_remainingReviewAssetRequests;
- (id)_reviewAssetRequestForAssetUUID:(id)a3;
- (id)_substituteAssetForUUID:(id)a3;
- (id)_titleForSelectedAssetUUIDs:(id)a3;
- (id)childViewControllerForStatusBarHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)reviewAssetProviderRequestForDisplayAsset:(id)a3;
- (unint64_t)_options;
- (unint64_t)sourceType;
- (void)_cancelReviewAssetRequestForAssetUUID:(id)a3;
- (void)_cancelReviewAssetRequests;
- (void)_deleteAllLinkedFiles;
- (void)_handleCompletionAction:(unint64_t)a3;
- (void)_handleFailedReviewAssetRequestAlertControllerDismissal;
- (void)_handleProgressControllerCanceled:(id)a3;
- (void)_handleReviewAssetRequest:(id)a3 completedWithSuccess:(BOOL)a4 canceled:(BOOL)a5 error:(id)a6 reviewAsset:(id)a7;
- (void)_handleSelectionChanged;
- (void)_performCancelAction;
- (void)_performCompletionAction:(unint64_t)a3;
- (void)_performCompletionActionSteps:(unint64_t)a3;
- (void)_performRetakeAction;
- (void)_presentConfidentialityAlertWithConfirmAction:(id)a3 abortAction:(id)a4;
- (void)_requestReviewAssetForAsset:(id)a3;
- (void)_setFailedReviewAssetRequestAlertController:(id)a3;
- (void)_setRequestProgressController:(id)a3;
- (void)_setSubstituteAsset:(id)a3;
- (void)_showFailedReviewAssetRequestAlert;
- (void)_tearDownProgressController;
- (void)_updateForCompletedReviewAssetRequest:(id)a3;
- (void)_updateWithSubstituteAsset:(id)a3 shouldSelect:(BOOL)a4;
- (void)assetExplorerReviewScreenActionManager:(id)a3 didPressSelectForAsset:(id)a4;
- (void)assetExplorerReviewScreenActionManager:(id)a3 didToggleLivePhoto:(id)a4;
- (void)assetExplorerReviewScreenActionManagerDidPressDeselectAll:(id)a3;
- (void)assetExplorerReviewScreenActionManagerDidPressDone:(id)a3;
- (void)assetExplorerReviewScreenActionManagerDidPressSelectAll:(id)a3;
- (void)assetExplorerReviewScreenActionManagerDidPressSend:(id)a3;
- (void)funEffectsViewController:(id)a3 didSaveAsset:(id)a4 withCompletion:(unint64_t)a5;
- (void)loadView;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photoEditController:(id)a3 didFinishEditingSessionForAsset:(id)a4 completed:(BOOL)a5;
- (void)photoMarkupController:(id)a3 didFinishWithSavedAsset:(id)a4;
- (void)setAssetExplorerAnalytics:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUseSystemBackgroundColorBar:(BOOL)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUAssetExplorerReviewScreenViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetExplorerAnalytics, 0);
  objc_storeStrong((id *)&self->__spec, 0);
  objc_storeStrong((id *)&self->__failedReviewAssetRequestAlertController, 0);
  objc_storeStrong((id *)&self->__requestProgressController, 0);
  objc_storeStrong((id *)&self->__substituteAssetsByUUID, 0);
  objc_storeStrong((id *)&self->__reviewAssetRequestsByUUID, 0);
  objc_storeStrong((id *)&self->__browsingSession, 0);
  objc_storeStrong((id *)&self->__actionManager, 0);
  objc_storeStrong((id *)&self->__reviewAssetProvider, 0);
  objc_storeStrong((id *)&self->__reviewMediaProvider, 0);
  objc_storeStrong((id *)&self->__clientMediaProvider, 0);
  objc_storeStrong((id *)&self->__reviewDataSourceManager, 0);
  objc_storeStrong((id *)&self->__clientDataSourceManager, 0);
  objc_storeStrong((id *)&self->__navigationController, 0);
  objc_storeStrong((id *)&self->_resizeTaskDescriptorViewModel, 0);
  objc_storeStrong((id *)&self->_reviewBarsModel, 0);
  objc_storeStrong((id *)&self->_selectionCountLimit, 0);
  objc_storeStrong((id *)&self->_initialDisabledLivePhotoAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_initialSelectedAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_initialIndexPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setAssetExplorerAnalytics:(id)a3
{
}

- (BOOL)_lowMemoryMode
{
  return self->__lowMemoryMode;
}

- (PUReviewScreenSpec)_spec
{
  return self->__spec;
}

- (unint64_t)_options
{
  return self->__options;
}

- (void)_setFailedReviewAssetRequestAlertController:(id)a3
{
}

- (UIAlertController)_failedReviewAssetRequestAlertController
{
  return self->__failedReviewAssetRequestAlertController;
}

- (void)_setRequestProgressController:(id)a3
{
}

- (PXActivityProgressController)_requestProgressController
{
  return self->__requestProgressController;
}

- (NSMutableDictionary)_substituteAssetsByUUID
{
  return self->__substituteAssetsByUUID;
}

- (NSMutableDictionary)_reviewAssetRequestsByUUID
{
  return self->__reviewAssetRequestsByUUID;
}

- (PUBrowsingSession)_browsingSession
{
  return self->__browsingSession;
}

- (PUAssetExplorerReviewScreenActionManager)_actionManager
{
  return self->__actionManager;
}

- (PUReviewAssetProvider)_reviewAssetProvider
{
  return self->__reviewAssetProvider;
}

- (PUJoiningMediaProvider)_reviewMediaProvider
{
  return self->__reviewMediaProvider;
}

- (PUMediaProvider)_clientMediaProvider
{
  return self->__clientMediaProvider;
}

- (PUAssetExplorerReviewScreenAssetsDataSourceManager)_reviewDataSourceManager
{
  return self->__reviewDataSourceManager;
}

- (PUAssetsDataSourceManager)_clientDataSourceManager
{
  return self->__clientDataSourceManager;
}

- (PUNavigationController)_navigationController
{
  return self->__navigationController;
}

- (void)setUseSystemBackgroundColorBar:(BOOL)a3
{
  self->_useSystemBackgroundColorBar = a3;
}

- (BOOL)useSystemBackgroundColorBar
{
  return self->_useSystemBackgroundColorBar;
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (PUPhotoPickerResizeTaskDescriptorViewModel)resizeTaskDescriptorViewModel
{
  return self->_resizeTaskDescriptorViewModel;
}

- (PUReviewScreenBarsModel)reviewBarsModel
{
  return self->_reviewBarsModel;
}

- (NSNumber)selectionCountLimit
{
  return self->_selectionCountLimit;
}

- (NSSet)initialDisabledLivePhotoAssetUUIDs
{
  return self->_initialDisabledLivePhotoAssetUUIDs;
}

- (NSSet)initialSelectedAssetUUIDs
{
  return self->_initialSelectedAssetUUIDs;
}

- (NSIndexPath)initialIndexPath
{
  return self->_initialIndexPath;
}

- (PUAssetExplorerReviewScreenViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUAssetExplorerReviewScreenViewControllerDelegate *)WeakRetained;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "currentAssetDidChange", a3))
  {
    id v9 = [(PUAssetExplorerReviewScreenViewController *)self assetExplorerAnalytics];
    unint64_t v5 = [(PUAssetExplorerReviewScreenViewController *)self sourceType];
    v6 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
    v7 = [v6 selectionManager];
    v8 = [v7 selectedUUIDs];
    objc_msgSend(v9, "sendEvent:view:source:currentAssetCount:", @"PUAssetExplorerAnalyticsEventScroll", 2, v5, objc_msgSend(v8, "count"));
  }
}

- (void)_presentConfidentialityAlertWithConfirmAction:(id)a3 abortAction:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1E4FB1410];
  id v7 = a4;
  id v8 = a3;
  id v9 = PULocalizedString(@"OK");
  v10 = [v6 actionWithTitle:v9 style:0 handler:v8];

  v11 = (void *)MEMORY[0x1E4FB1410];
  v12 = PULocalizedString(@"CANCEL");
  v13 = [v11 actionWithTitle:v12 style:0 handler:v7];

  v14 = (void *)MEMORY[0x1E4F90698];
  v17[0] = v10;
  v17[1] = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  v16 = [v14 confidentialityAlertWithActions:v15];

  [(PUAssetExplorerReviewScreenViewController *)self presentViewController:v16 animated:1 completion:0];
}

- (void)_performCompletionActionSteps:(unint64_t)a3
{
  id v19 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
  v18 = [v19 selectionManager];
  unint64_t v5 = [v18 selectedUUIDs];
  v6 = [v19 disableLivePhotosSelectionManager];
  id v7 = [v6 selectedUUIDs];
  id v8 = [(PUAssetExplorerReviewScreenViewController *)self _getSelectedSubstituteAssetsAndRemoveFilesForUnneededAssets];
  id v9 = [(PUAssetExplorerReviewScreenViewController *)self _reviewDataSourceManager];
  [v9 detachFromOriginalDataSourceManager];

  if (self->_delegateFlags.respondsToDidPerformCompletionAction)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained assetExplorerReviewScreenViewController:self didPerformCompletionAction:a3 withSelectedAssetUUIDs:v5 livePhotoDisabledAssetUUIDs:v7 substituteAssetsByUUID:v8];
  }
  if (!a3)
  {
    v11 = PUAssetExplorerAnalyticsEventCompleteReviewDone;
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    v11 = PUAssetExplorerAnalyticsEventCompleteReviewSend;
LABEL_7:
    v12 = *v11;
    goto LABEL_9;
  }
  v12 = 0;
LABEL_9:
  v13 = [(PUAssetExplorerReviewScreenViewController *)self assetExplorerAnalytics];
  unint64_t v14 = [(PUAssetExplorerReviewScreenViewController *)self sourceType];
  v15 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
  v16 = [v15 selectionManager];
  v17 = [v16 selectedUUIDs];
  objc_msgSend(v13, "sendEvent:view:source:currentAssetCount:", v12, 2, v14, objc_msgSend(v17, "count"));

  kdebug_trace();
}

- (void)_performCompletionAction:(unint64_t)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (![MEMORY[0x1E4F90698] confidentialityCheckRequired]) {
    goto LABEL_23;
  }
  unint64_t v5 = [(PUAssetExplorerReviewScreenViewController *)self sourceType];
  int v6 = 0;
  if (v5 <= 3 && v5 != 2)
  {
    id v7 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
    id v8 = [v7 selectionManager];
    id v9 = [v8 selectedUUIDs];
    v10 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v11 = [v10 librarySpecificFetchOptions];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v28 = v8;
      v29 = v7;
      unint64_t v30 = a3;
      v31 = self;
      uint64_t v15 = *(void *)v34;
LABEL_6:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (void *)MEMORY[0x1E4F38EB8];
        uint64_t v37 = *(void *)(*((void *)&v33 + 1) + 8 * v16);
        int v6 = 1;
        v18 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v37, 1, v28, v29, v30, v31);
        uint64_t v19 = [v17 fetchAssetsWithLocalIdentifiers:v18 options:v11];
        v20 = [(id)v19 lastObject];

        LOBYTE(v19) = [MEMORY[0x1E4F90698] confidentialWarningRequiredForAsset:v20];
        if (v19) {
          break;
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
          if (v14) {
            goto LABEL_6;
          }
          int v6 = 0;
          break;
        }
      }
      a3 = v30;
      self = v31;
      id v8 = v28;
      id v7 = v29;
    }
    else
    {
      int v6 = 0;
    }
  }
  v21 = [(PUAssetExplorerReviewScreenViewController *)self _browsingSession];
  v22 = [v21 viewModel];
  v23 = [v22 currentAssetReference];
  v24 = [v23 asset];
  int v25 = [v24 conformsToProtocol:&unk_1F07FCE90];

  if (v25)
  {
    uint64_t v26 = [v23 asset];
    v27 = (void *)v26;
    if (!v6)
    {
      if (v26) {
        int v6 = [MEMORY[0x1E4F90698] confidentialWarningRequiredForAsset:v26];
      }
    }
  }
  if (v6)
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __70__PUAssetExplorerReviewScreenViewController__performCompletionAction___block_invoke;
    v32[3] = &unk_1E5F2BA48;
    v32[4] = self;
    v32[5] = a3;
    [(PUAssetExplorerReviewScreenViewController *)self _presentConfidentialityAlertWithConfirmAction:v32 abortAction:0];
  }
  else
  {
LABEL_23:
    [(PUAssetExplorerReviewScreenViewController *)self _performCompletionActionSteps:a3];
  }
}

uint64_t __70__PUAssetExplorerReviewScreenViewController__performCompletionAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performCompletionActionSteps:*(void *)(a1 + 40)];
}

- (void)_performRetakeAction
{
  [(PUAssetExplorerReviewScreenViewController *)self _cancelReviewAssetRequests];
  [(PUAssetExplorerReviewScreenViewController *)self _deleteAllLinkedFiles];
  if (self->_delegateFlags.respondsToDidPressRetake)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained assetExplorerReviewScreenViewControllerDidPressRetake:self];
  }
}

- (void)_performCancelAction
{
  [(PUAssetExplorerReviewScreenViewController *)self _cancelReviewAssetRequests];
  [(PUAssetExplorerReviewScreenViewController *)self _deleteAllLinkedFiles];
  v3 = [(PUAssetExplorerReviewScreenViewController *)self _reviewDataSourceManager];
  [v3 detachFromOriginalDataSourceManager];

  if (self->_delegateFlags.respondsToDidPressCancel)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained assetExplorerReviewScreenViewControllerDidPressCancel:self];
  }
}

- (id)reviewAssetProviderRequestForDisplayAsset:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  unint64_t v5 = [(PUAssetExplorerReviewScreenViewController *)self _reviewAssetProvider];
  int v6 = [v5 reviewAssetProviderRequestForDisplayAsset:v4];

  return v6;
}

- (void)funEffectsViewController:(id)a3 didSaveAsset:(id)a4 withCompletion:(unint64_t)a5
{
  id v18 = a3;
  id v8 = a4;
  if (v8)
  {
    [(PUAssetExplorerReviewScreenViewController *)self _updateWithSubstituteAsset:v8 shouldSelect:1];
    id v9 = PUAssetExplorerAnalyticsEventFunEffectsSave;
  }
  else
  {
    id v9 = PUAssetExplorerAnalyticsEventFunEffectsCancel;
  }
  v10 = *v9;
  v11 = [(PUAssetExplorerReviewScreenViewController *)self assetExplorerAnalytics];
  unint64_t v12 = [(PUAssetExplorerReviewScreenViewController *)self sourceType];
  uint64_t v13 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
  uint64_t v14 = [v13 selectionManager];
  uint64_t v15 = [v14 selectedUUIDs];
  objc_msgSend(v11, "sendEvent:view:source:currentAssetCount:", v10, 2, v12, objc_msgSend(v15, "count"));

  if (a5)
  {
    if (a5 == 1)
    {
      uint64_t v16 = self;
      uint64_t v17 = 0;
    }
    else
    {
      if (a5 != 2) {
        goto LABEL_11;
      }
      uint64_t v16 = self;
      uint64_t v17 = 1;
    }
    [(PUAssetExplorerReviewScreenViewController *)v16 _handleCompletionAction:v17];
  }
  else
  {
    [(PUAssetExplorerReviewScreenViewController *)self _performRetakeAction];
  }
LABEL_11:
}

- (void)photoMarkupController:(id)a3 didFinishWithSavedAsset:(id)a4
{
  id v13 = a3;
  if (a4)
  {
    [(PUAssetExplorerReviewScreenViewController *)self _updateWithSubstituteAsset:a4 shouldSelect:1];
    int v6 = PUAssetExplorerAnalyticsEventMarkupSave;
  }
  else
  {
    int v6 = PUAssetExplorerAnalyticsEventMarkupCancel;
  }
  id v7 = *v6;
  id v8 = [(PUAssetExplorerReviewScreenViewController *)self assetExplorerAnalytics];
  unint64_t v9 = [(PUAssetExplorerReviewScreenViewController *)self sourceType];
  v10 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
  v11 = [v10 selectionManager];
  unint64_t v12 = [v11 selectedUUIDs];
  objc_msgSend(v8, "sendEvent:view:source:currentAssetCount:", v7, 2, v9, objc_msgSend(v12, "count"));

  [v13 unregisterObserver:self];
}

- (void)photoEditController:(id)a3 didFinishEditingSessionForAsset:(id)a4 completed:(BOOL)a5
{
  BOOL v5 = a5;
  id v16 = a4;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"PUAssetExplorerReviewScreenViewController.m" lineNumber:979 description:@"Editing a photo must output a PUReviewAsset!"];
    }
    [(PUAssetExplorerReviewScreenViewController *)self _updateWithSubstituteAsset:v16 shouldSelect:1];
    id v8 = PUAssetExplorerAnalyticsEventEditSave;
  }
  else
  {
    id v8 = PUAssetExplorerAnalyticsEventEditCancel;
  }
  unint64_t v9 = *v8;
  v10 = [(PUAssetExplorerReviewScreenViewController *)self assetExplorerAnalytics];
  unint64_t v11 = [(PUAssetExplorerReviewScreenViewController *)self sourceType];
  unint64_t v12 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
  id v13 = [v12 selectionManager];
  uint64_t v14 = [v13 selectedUUIDs];
  objc_msgSend(v10, "sendEvent:view:source:currentAssetCount:", v9, 2, v11, objc_msgSend(v14, "count"));
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PUReviewScreenSelectionManagerObservationContext == a5) {
    [(PUAssetExplorerReviewScreenViewController *)self _handleSelectionChanged];
  }
}

- (void)assetExplorerReviewScreenActionManagerDidPressSend:(id)a3
{
}

- (void)assetExplorerReviewScreenActionManager:(id)a3 didToggleLivePhoto:(id)a4
{
  id v19 = a4;
  if ([v19 conformsToProtocol:&unk_1F07FCDA8])
  {
    id v5 = v19;
    int v6 = [v5 uuid];
    id v7 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
    id v8 = [v7 disableLivePhotosSelectionManager];
    uint64_t v9 = [v8 isSelectedUUID:v6] ^ 1;

    v10 = +[PUReviewAsset createUniqueMediaDirectoryForAssetWithIdentifier:v6];
    unint64_t v11 = [PUReviewAsset alloc];
    unint64_t v12 = [v10 path];
    id v13 = [(PUReviewAsset *)v11 initWithReviewAsset:v5 linkFileURLsToUniquePathsInDirectory:v12 canPlayPhotoIris:v9];

    [(PUAssetExplorerReviewScreenViewController *)self _updateWithSubstituteAsset:v13 shouldSelect:0];
    uint64_t v14 = [(PUAssetExplorerReviewScreenViewController *)self assetExplorerAnalytics];
    unint64_t v15 = [(PUAssetExplorerReviewScreenViewController *)self sourceType];
    id v16 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
    uint64_t v17 = [v16 selectionManager];
    id v18 = [v17 selectedUUIDs];
    objc_msgSend(v14, "sendEvent:view:source:currentAssetCount:", @"PUAssetExplorerAnalyticsEventToggleLivePhoto", 2, v15, objc_msgSend(v18, "count"));
  }
}

- (void)_handleProgressControllerCanceled:(id)a3
{
  id v8 = a3;
  id v5 = [(PUAssetExplorerReviewScreenViewController *)self _requestProgressController];

  int v6 = v8;
  if (v5 != v8)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PUAssetExplorerReviewScreenViewController.m" lineNumber:918 description:@"Not expecting multiple progress controllers"];

    int v6 = v8;
  }
  [v6 hideAnimated:1 allowDelay:0];
  [(PUAssetExplorerReviewScreenViewController *)self _tearDownProgressController];
  [(PUAssetExplorerReviewScreenViewController *)self _performCancelAction];
}

- (void)_handleCompletionAction:(unint64_t)a3
{
  kdebug_trace();
  id v5 = [(PUAssetExplorerReviewScreenViewController *)self _remainingReviewAssetRequests];
  if ([v5 count])
  {
    int v6 = [(PUAssetExplorerReviewScreenViewController *)self _createProgressControllerForRemainingRequests:v5];
    id v7 = PULocalizedString(@"REVIEW_DOWNLOADING_ASSETS_TITLE");
    [v6 setTitle:v7];
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __69__PUAssetExplorerReviewScreenViewController__handleCompletionAction___block_invoke;
    unint64_t v11 = &unk_1E5F252D8;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v13, &from);
    [v6 setCancellationHandler:&v8];
    objc_msgSend(v6, "showAnimated:allowDelay:", 1, objc_msgSend(v5, "count", v8, v9, v10, v11) == 1);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PUAssetExplorerReviewScreenViewController *)self _performCompletionAction:a3];
  }
}

void __69__PUAssetExplorerReviewScreenViewController__handleCompletionAction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleProgressControllerCanceled:v2];
}

- (id)_fileSizeMenuForSelectedUUIDs:(id)a3
{
  if (self->_delegateFlags.respondsToFileSizeMenu)
  {
    id v4 = a3;
    id v5 = [(PUAssetExplorerReviewScreenViewController *)self delegate];
    int v6 = [v5 assetExplorerReviewScreenViewController:self fileSizeMenuForSelectedUUIDs:v4];
  }
  else
  {
    int v6 = 0;
  }
  return v6;
}

- (id)_titleForSelectedAssetUUIDs:(id)a3
{
  id v4 = a3;
  if (([(PUAssetExplorerReviewScreenViewController *)self _options] & 8) == 0) {
    [(PUAssetExplorerReviewScreenViewController *)self _options];
  }
  id v5 = [(PUAssetExplorerReviewScreenViewController *)self _reviewDataSourceManager];
  int v6 = [v5 assetsDataSource];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v8 = [(PUAssetExplorerReviewScreenViewController *)self _reviewDataSourceManager];
    uint64_t v9 = [v8 assetsDataSource];

    v10 = [v9 photosDataSource];
    unint64_t v11 = [v10 photoLibrary];
    id v12 = [v11 librarySpecificFetchOptions];

    id v13 = (void *)MEMORY[0x1E4F38EB8];
    uint64_t v14 = [v4 allObjects];
    unint64_t v15 = [v13 fetchAssetsWithUUIDs:v14 options:v12];

    [v15 countOfAssetsWithMediaType:1];
    [v15 countOfAssetsWithMediaType:2];
  }
  [v4 count];
  id v16 = PXLocalizedSelectionMessageForAssetsCount();

  return v16;
}

- (void)_handleSelectionChanged
{
  if (([(PUAssetExplorerReviewScreenViewController *)self _options] & 4) != 0)
  {
    v3 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
    id v4 = [v3 selectionManager];

    id v5 = [v4 selectedUUIDs];
    int v6 = [(PUAssetExplorerReviewScreenViewController *)self _titleForSelectedAssetUUIDs:v5];

    id v7 = [v4 selectedUUIDs];
    uint64_t v8 = [(PUAssetExplorerReviewScreenViewController *)self _fileSizeMenuForSelectedUUIDs:v7];

    uint64_t v9 = [(PUAssetExplorerReviewScreenViewController *)self _browsingSession];
    v10 = [v9 viewModel];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__PUAssetExplorerReviewScreenViewController__handleSelectionChanged__block_invoke;
    void v17[3] = &unk_1E5F2ECC8;
    id v18 = v10;
    id v19 = v6;
    id v11 = v6;
    id v12 = v10;
    [v12 performChanges:v17];
    id v13 = [v12 resizeTaskDescriptorViewModel];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__PUAssetExplorerReviewScreenViewController__handleSelectionChanged__block_invoke_2;
    v15[3] = &unk_1E5F26008;
    id v16 = v8;
    id v14 = v8;
    [v13 performChanges:v15];
  }
}

uint64_t __68__PUAssetExplorerReviewScreenViewController__handleSelectionChanged__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNavigationBarTitle:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  return [v2 signalReviewScreenSelectionChanged];
}

uint64_t __68__PUAssetExplorerReviewScreenViewController__handleSelectionChanged__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setFileSizeMenu:*(void *)(a1 + 32)];
}

- (void)assetExplorerReviewScreenActionManagerDidPressDeselectAll:(id)a3
{
  v3 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
  id v4 = [v3 selectionManager];

  [v4 performChanges:&__block_literal_global_278];
}

void __103__PUAssetExplorerReviewScreenViewController_assetExplorerReviewScreenActionManagerDidPressDeselectAll___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = a2;
  id v4 = [v2 set];
  [v3 setSelectedUUIDs:v4];
}

- (void)assetExplorerReviewScreenActionManagerDidPressSelectAll:(id)a3
{
  id v4 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
  id v5 = [v4 selectionManager];

  int v6 = [(PUAssetExplorerReviewScreenViewController *)self initialSelectedAssetUUIDs];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __101__PUAssetExplorerReviewScreenViewController_assetExplorerReviewScreenActionManagerDidPressSelectAll___block_invoke;
  v8[3] = &unk_1E5F238F8;
  id v9 = v6;
  id v7 = v6;
  [v5 performChanges:v8];
}

uint64_t __101__PUAssetExplorerReviewScreenViewController_assetExplorerReviewScreenActionManagerDidPressSelectAll___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelectedUUIDs:*(void *)(a1 + 32)];
}

- (void)assetExplorerReviewScreenActionManagerDidPressDone:(id)a3
{
}

- (void)assetExplorerReviewScreenActionManager:(id)a3 didPressSelectForAsset:(id)a4
{
  id v5 = a4;
  int v6 = [v5 uuid];
  id v7 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
  uint64_t v8 = [v7 selectionManager];
  id v9 = [(PUAssetExplorerReviewScreenViewController *)self selectionCountLimit];
  int v10 = [v8 isSelectedUUID:v6];
  uint64_t v39 = v9;
  if ((v10 & 1) == 0
    && v9
    && ([v8 selectedUUIDs],
        id v11 = objc_claimAutoreleasedReturnValue(),
        unint64_t v12 = [v11 count],
        unsigned int v13 = [v9 unsignedIntValue],
        v11,
        v12 >= v13))
  {
    uint64_t v26 = PXLocalizedString();
    v27 = PXLocalizedString();
    uint64_t v35 = [v9 unsignedIntValue];
    v28 = PULocalizedStringWithValidatedFormat(v27, @"%lu");

    v29 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", v26, v28, 1, v35);
    unint64_t v30 = (void *)MEMORY[0x1E4FB1410];
    v31 = PXLocalizedString();
    v32 = [v30 actionWithTitle:v31 style:1 handler:0];
    [v29 addAction:v32];

    [(PUAssetExplorerReviewScreenViewController *)self presentViewController:v29 animated:1 completion:0];
  }
  else
  {
    uint64_t v37 = v7;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __107__PUAssetExplorerReviewScreenViewController_assetExplorerReviewScreenActionManager_didPressSelectForAsset___block_invoke;
    v40[3] = &unk_1E5F23A00;
    char v42 = v10 ^ 1;
    v38 = v6;
    id v14 = v6;
    id v41 = v14;
    long long v36 = v8;
    [v8 performChanges:v40];
    unint64_t v15 = @"PUAssetExplorerAnalyticsEventReselectPhoto";
    if (v10) {
      unint64_t v15 = @"PUAssetExplorerAnalyticsEventRemovePhoto";
    }
    id v16 = v15;
    uint64_t v17 = [(PUAssetExplorerReviewScreenViewController *)self assetExplorerAnalytics];
    unint64_t v18 = [(PUAssetExplorerReviewScreenViewController *)self sourceType];
    id v19 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
    [v19 selectionManager];
    v21 = id v20 = v5;
    v22 = [v21 selectedUUIDs];
    objc_msgSend(v17, "sendEvent:view:source:currentAssetCount:", v16, 2, v18, objc_msgSend(v22, "count"));

    id v5 = v20;
    v23 = [(PUAssetExplorerReviewScreenViewController *)self _reviewAssetProvider];
    if (v23)
    {
      v24 = [(PUAssetExplorerReviewScreenViewController *)self initialSelectedAssetUUIDs];
      int v25 = v24;
      if (v10)
      {
        [(PUAssetExplorerReviewScreenViewController *)self _cancelReviewAssetRequestForAssetUUID:v14];
      }
      else if (([v24 containsObject:v14] & 1) == 0)
      {
        uint64_t v33 = [(PUAssetExplorerReviewScreenViewController *)self _substituteAssetForUUID:v14];
        uint64_t v34 = [(PUAssetExplorerReviewScreenViewController *)self _reviewAssetRequestForAssetUUID:v14];
        if (!(v33 | v34)) {
          [(PUAssetExplorerReviewScreenViewController *)self _requestReviewAssetForAsset:v20];
        }
      }
    }

    id v7 = v37;
    int v6 = v38;
    uint64_t v8 = v36;
  }
}

uint64_t __107__PUAssetExplorerReviewScreenViewController_assetExplorerReviewScreenActionManager_didPressSelectForAsset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    return [a2 addSelectedUUID:v2];
  }
  else {
    return [a2 removeSelectedUUID:v2];
  }
}

- (BOOL)assetExplorerReviewScreenActionManager:(id)a3 shouldEnableActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6
{
  if (!self->_delegateFlags.respondsToShouldEnableActionType) {
    return 1;
  }
  p_delegate = &self->_delegate;
  id v10 = a6;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a4) = [WeakRetained assetExplorerReviewScreenViewController:self shouldEnableActionType:a4 onAsset:v11 inAssetCollection:v10];

  return a4;
}

- (BOOL)assetExplorerReviewScreenActionManager:(id)a3 canPerformActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (self->_delegateFlags.respondsToCanPerformActionType
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        int v14 = [WeakRetained assetExplorerReviewScreenViewController:self canPerformActionType:a4 onAsset:v11 inAssetCollection:v12], WeakRetained, !v14))
  {
    BOOL v22 = 0;
  }
  else if (a4 - 9 > 1)
  {
    BOOL v22 = 1;
  }
  else
  {
    unint64_t v15 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
    id v16 = [v15 selectionManager];
    uint64_t v17 = [v16 selectedUUIDs];
    uint64_t v18 = [v17 count];

    id v19 = [(PUAssetExplorerReviewScreenViewController *)self initialSelectedAssetUUIDs];
    uint64_t v20 = [v19 count];

    uint64_t v21 = 9;
    if (v18 != v20) {
      uint64_t v21 = 10;
    }
    BOOL v22 = v21 != a4;
  }

  return v22;
}

- (id)_getSelectedSubstituteAssetsAndRemoveFilesForUnneededAssets
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v3 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
  id v4 = [v3 selectionManager];
  id v5 = [(PUAssetExplorerReviewScreenViewController *)self _substituteAssetsByUUID];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  unsigned int v13 = __104__PUAssetExplorerReviewScreenViewController__getSelectedSubstituteAssetsAndRemoveFilesForUnneededAssets__block_invoke;
  int v14 = &unk_1E5F239D8;
  id v15 = v4;
  id v16 = v6;
  id v7 = v6;
  id v8 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:&v11];
  objc_msgSend(v5, "removeAllObjects", v11, v12, v13, v14);
  id v9 = (void *)[v7 copy];

  return v9;
}

void __104__PUAssetExplorerReviewScreenViewController__getSelectedSubstituteAssetsAndRemoveFilesForUnneededAssets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  if ([v5 isSelectedUUID:v7]) {
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v7];
  }
  else {
    [v6 removeAllFilesAtReferencedURLs];
  }
}

- (void)_deleteAllLinkedFiles
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v3 = [(PUAssetExplorerReviewScreenViewController *)self _substituteAssetsByUUID];
  [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_264];
  [v3 removeAllObjects];
}

uint64_t __66__PUAssetExplorerReviewScreenViewController__deleteAllLinkedFiles__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeAllFilesAtReferencedURLs];
}

- (void)_updateWithSubstituteAsset:(id)a3 shouldSelect:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    [(PUAssetExplorerReviewScreenViewController *)self _setSubstituteAsset:v6];
    id v7 = [(PUAssetExplorerReviewScreenViewController *)self _reviewDataSourceManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __85__PUAssetExplorerReviewScreenViewController__updateWithSubstituteAsset_shouldSelect___block_invoke;
    v13[3] = &unk_1E5F23990;
    id v8 = v6;
    id v14 = v8;
    [v7 performChanges:v13];
    if (v4)
    {
      id v9 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
      id v10 = [v9 selectionManager];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __85__PUAssetExplorerReviewScreenViewController__updateWithSubstituteAsset_shouldSelect___block_invoke_2;
      v11[3] = &unk_1E5F238F8;
      id v12 = v8;
      [v10 performChanges:v11];
    }
  }
}

uint64_t __85__PUAssetExplorerReviewScreenViewController__updateWithSubstituteAsset_shouldSelect___block_invoke(uint64_t a1, void *a2)
{
  return [a2 replaceAssetInDataSourceWithAsset:*(void *)(a1 + 32)];
}

void __85__PUAssetExplorerReviewScreenViewController__updateWithSubstituteAsset_shouldSelect___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 uuid];
  [v3 addSelectedUUID:v4];
}

- (void)_setSubstituteAsset:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v4 = [v7 uuid];
  if (v4)
  {
    id v5 = [(PUAssetExplorerReviewScreenViewController *)self _substituteAssetsByUUID];
    id v6 = [v5 objectForKeyedSubscript:v4];
    [v6 removeAllFilesAtReferencedURLs];
    [v5 setObject:v7 forKeyedSubscript:v4];
  }
}

- (id)_substituteAssetForUUID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [(PUAssetExplorerReviewScreenViewController *)self _substituteAssetsByUUID];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)_tearDownProgressController
{
}

- (id)_createProgressControllerForRemainingRequests:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(PUAssetExplorerReviewScreenViewController *)self _requestProgressController];

  if (v6)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"PUAssetExplorerReviewScreenViewController.m" lineNumber:572 description:@"Not expecting existing progress controller"];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v7);
        }
        unsigned int v13 = [*(id *)(*((void *)&v29 + 1) + 8 * i) progress];
        v10 += [v13 totalUnitCount];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  id v14 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:v10];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "progress", (void)v25);
        uint64_t v21 = v20;
        if (v20) {
          objc_msgSend(v14, "addChild:withPendingUnitCount:", v20, objc_msgSend(v20, "totalUnitCount"));
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v17);
  }

  id v22 = objc_alloc_init(MEMORY[0x1E4F8FF50]);
  [v22 setProgress:v14];
  [(PUAssetExplorerReviewScreenViewController *)self _setRequestProgressController:v22];

  return v22;
}

- (void)_handleFailedReviewAssetRequestAlertControllerDismissal
{
}

- (void)_showFailedReviewAssetRequestAlert
{
  id v3 = [(PUAssetExplorerReviewScreenViewController *)self _failedReviewAssetRequestAlertController];
  if (!v3)
  {
    id v4 = PULocalizedString(@"OK");
    id v5 = PULocalizedString(@"REVIEW_DOWNLOADING_ASSETS_ERROR_TITLE");
    id v6 = PULocalizedString(@"REVIEW_DOWNLOADING_ASSETS_ERROR_MESSAGE");
    id v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v5 message:v6 preferredStyle:1];
    [(PUAssetExplorerReviewScreenViewController *)self _setFailedReviewAssetRequestAlertController:v7];
    objc_initWeak(&location, self);
    uint64_t v8 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __79__PUAssetExplorerReviewScreenViewController__showFailedReviewAssetRequestAlert__block_invoke;
    unsigned int v13 = &unk_1E5F2DCA8;
    objc_copyWeak(&v14, &location);
    uint64_t v9 = [v8 actionWithTitle:v4 style:0 handler:&v10];
    objc_msgSend(v7, "addAction:", v9, v10, v11, v12, v13);

    [(PUAssetExplorerReviewScreenViewController *)self presentViewController:v7 animated:1 completion:0];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __79__PUAssetExplorerReviewScreenViewController__showFailedReviewAssetRequestAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleFailedReviewAssetRequestAlertControllerDismissal];
}

- (void)_handleReviewAssetRequest:(id)a3 completedWithSuccess:(BOOL)a4 canceled:(BOOL)a5 error:(id)a6 reviewAsset:(id)a7
{
  BOOL v9 = a4;
  id v12 = a3;
  id v13 = a7;
  if (v12)
  {
    id v14 = [v12 sourceAsset];
    id v15 = [v14 uuid];
    id v16 = [(PUAssetExplorerReviewScreenViewController *)self _reviewAssetRequestForAssetUUID:v15];
    if (v16 != v12)
    {
LABEL_15:

      goto LABEL_16;
    }
    if (v13 && v9)
    {
      uint64_t v17 = [v13 identifier];
      char v18 = [v17 isEqualToString:v15];

      if ((v18 & 1) == 0)
      {
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:a2 object:self file:@"PUAssetExplorerReviewScreenViewController.m" lineNumber:514 description:@"Expected asset identifiers to match"];
      }
      id v19 = NSTemporaryDirectory();
      if ([v13 canPlayPhotoIris])
      {
        uint64_t v20 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
        uint64_t v21 = [v20 disableLivePhotosSelectionManager];
        uint64_t v22 = [v21 isSelectedUUID:v15] ^ 1;
      }
      else
      {
        uint64_t v22 = 0;
      }
      v23 = [[PUReviewAsset alloc] initWithReviewAsset:v13 linkFileURLsToUniquePathsInDirectory:v19 canPlayPhotoIris:v22];
      [(PUAssetExplorerReviewScreenViewController *)self _updateWithSubstituteAsset:v23 shouldSelect:0];
    }
    else
    {
      if (a5)
      {
LABEL_14:
        [(PUAssetExplorerReviewScreenViewController *)self _updateForCompletedReviewAssetRequest:v12];
        goto LABEL_15;
      }
      id v19 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
      v23 = [v19 selectionManager];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __119__PUAssetExplorerReviewScreenViewController__handleReviewAssetRequest_completedWithSuccess_canceled_error_reviewAsset___block_invoke;
      v25[3] = &unk_1E5F238F8;
      id v26 = v15;
      [(PUReviewAsset *)v23 performChanges:v25];
      [(PUAssetExplorerReviewScreenViewController *)self _showFailedReviewAssetRequestAlert];
    }
    goto LABEL_14;
  }
LABEL_16:
}

uint64_t __119__PUAssetExplorerReviewScreenViewController__handleReviewAssetRequest_completedWithSuccess_canceled_error_reviewAsset___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeSelectedUUID:*(void *)(a1 + 32)];
}

- (void)_requestReviewAssetForAsset:(id)a3
{
  id v5 = a3;
  id v6 = [v5 uuid];
  uint64_t v7 = [(PUAssetExplorerReviewScreenViewController *)self _substituteAssetForUUID:v6];
  uint64_t v8 = [(PUAssetExplorerReviewScreenViewController *)self _reviewAssetRequestForAssetUUID:v6];
  if (v7 | v8)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PUAssetExplorerReviewScreenViewController.m" lineNumber:483 description:@"We should not be trying to request an asset that we already have a file-backed asset for or for which we have a reviewAssetRequest in progress"];
  }
  BOOL v9 = [(PUAssetExplorerReviewScreenViewController *)self _createReviewAssetRequestForAsset:v5];
  if (v9)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v9);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__PUAssetExplorerReviewScreenViewController__requestReviewAssetForAsset___block_invoke;
    v11[3] = &unk_1E5F23968;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v13, &from);
    [v9 requestReviewAssetWithCompletionHandler:v11];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __73__PUAssetExplorerReviewScreenViewController__requestReviewAssetForAsset___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  BOOL v9 = (id *)(a1 + 32);
  id v10 = a5;
  id v11 = a4;
  id WeakRetained = objc_loadWeakRetained(v9);
  id v12 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleReviewAssetRequest:v12 completedWithSuccess:a2 canceled:a3 error:v11 reviewAsset:v10];
}

- (void)_cancelReviewAssetRequests
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v3 = [(PUAssetExplorerReviewScreenViewController *)self _reviewAssetRequestsByUUID];
  [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_232];
  [v3 removeAllObjects];
}

uint64_t __71__PUAssetExplorerReviewScreenViewController__cancelReviewAssetRequests__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cancelReviewAssetRequest];
}

- (void)_cancelReviewAssetRequestForAssetUUID:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v4 = [(PUAssetExplorerReviewScreenViewController *)self _reviewAssetRequestsByUUID];
  id v5 = [v4 objectForKeyedSubscript:v7];
  id v6 = v5;
  if (v5)
  {
    [v5 cancelReviewAssetRequest];
    [v4 removeObjectForKey:v7];
  }
}

- (void)_updateForCompletedReviewAssetRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v11 = [v4 sourceAsset];

  id v5 = [v11 uuid];
  if (v5)
  {
    id v6 = [(PUAssetExplorerReviewScreenViewController *)self _reviewAssetRequestsByUUID];
    [v6 removeObjectForKey:v5];
    uint64_t v7 = [v6 count];
    uint64_t v8 = [(PUAssetExplorerReviewScreenViewController *)self _requestProgressController];
    BOOL v9 = (void *)v8;
    if (!v7 && v8)
    {
      id v10 = [(PUAssetExplorerReviewScreenViewController *)self _failedReviewAssetRequestAlertController];
      [v9 hideAnimated:1 allowDelay:0];
      [(PUAssetExplorerReviewScreenViewController *)self _tearDownProgressController];
      if (!v10) {
        [(PUAssetExplorerReviewScreenViewController *)self _performCompletionAction:0];
      }
    }
  }
}

- (id)_createReviewAssetRequestForAsset:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = [(PUAssetExplorerReviewScreenViewController *)self _reviewAssetProvider];
  id v6 = [v5 reviewAssetProviderRequestForDisplayAsset:v4];
  if (v6)
  {
    uint64_t v7 = [v4 uuid];
    uint64_t v8 = [(PUAssetExplorerReviewScreenViewController *)self _reviewAssetRequestsByUUID];
    [v8 setObject:v6 forKeyedSubscript:v7];
  }
  return v6;
}

- (id)_reviewAssetRequestForAssetUUID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v4)
  {
    id v5 = [(PUAssetExplorerReviewScreenViewController *)self _reviewAssetRequestsByUUID];
    id v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_remainingReviewAssetRequests
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v3 = [(PUAssetExplorerReviewScreenViewController *)self _reviewAssetRequestsByUUID];
  id v4 = [v3 allValues];

  return v4;
}

- (id)childViewControllerForStatusBarHidden
{
  id v3 = [(PUAssetExplorerReviewScreenViewController *)self _navigationController];

  if (v3)
  {
    id v4 = [(PUAssetExplorerReviewScreenViewController *)self _navigationController];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PUAssetExplorerReviewScreenViewController;
    id v4 = [(PUAssetExplorerReviewScreenViewController *)&v6 childViewControllerForStatusBarHidden];
  }
  return v4;
}

- (id)childViewControllerForStatusBarStyle
{
  id v3 = [(PUAssetExplorerReviewScreenViewController *)self _navigationController];

  if (v3)
  {
    id v4 = [(PUAssetExplorerReviewScreenViewController *)self _navigationController];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PUAssetExplorerReviewScreenViewController;
    id v4 = [(PUAssetExplorerReviewScreenViewController *)&v6 childViewControllerForStatusBarStyle];
  }
  return v4;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)PUAssetExplorerReviewScreenViewController;
  -[PUAssetExplorerReviewScreenViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (self->_delegateFlags.respondsToWillTransitionToSize)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "assetExplorerReviewScreenViewController:willTransitionToSize:withTransitionCoordinator:", self, v7, width, height);
  }
}

- (id)_createBrowsingSessionIfNecessary
{
  browsingSession = self->__browsingSession;
  if (!browsingSession)
  {
    id v4 = [(PUAssetExplorerReviewScreenViewController *)self _reviewDataSourceManager];
    uint64_t v5 = [(PUAssetExplorerReviewScreenViewController *)self _reviewMediaProvider];
    objc_super v6 = [(PUAssetExplorerReviewScreenViewController *)self initialSelectedAssetUUIDs];
    id v7 = [(PUAssetExplorerReviewScreenViewController *)self initialDisabledLivePhotoAssetUUIDs];
    uint64_t v8 = [[PUAssetExplorerReviewScreenActionManager alloc] initWithSourceType:[(PUAssetExplorerReviewScreenViewController *)self sourceType]];
    [(PUAssetExplorerReviewScreenActionManager *)v8 setReviewScreenActionManagerDelegate:self];
    [(PUAssetExplorerReviewScreenActionManager *)v8 setReviewAssetProvider:self];
    objc_super v9 = [(PUAssetExplorerReviewScreenActionManager *)v8 selectionManager];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __78__PUAssetExplorerReviewScreenViewController__createBrowsingSessionIfNecessary__block_invoke;
    v42[3] = &unk_1E5F238F8;
    id v10 = v6;
    id v43 = v10;
    [v9 performChanges:v42];
    long long v30 = v9;
    [v9 registerChangeObserver:self context:PUReviewScreenSelectionManagerObservationContext];
    id v11 = [(PUAssetExplorerReviewScreenActionManager *)v8 disableLivePhotosSelectionManager];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __78__PUAssetExplorerReviewScreenViewController__createBrowsingSessionIfNecessary__block_invoke_2;
    v40[3] = &unk_1E5F238F8;
    long long v28 = v11;
    id v29 = v7;
    id v41 = v29;
    [v11 performChanges:v40];
    long long v31 = (void *)v5;
    id v12 = [[PUBrowsingSession alloc] initWithDataSourceManager:v4 actionManager:v8 mediaProvider:v5 photosDetailsContext:0 lowMemoryMode:[(PUAssetExplorerReviewScreenViewController *)self _lowMemoryMode]];
    id v13 = [(PUAssetExplorerReviewScreenViewController *)self initialIndexPath];
    long long v32 = v4;
    id v14 = [v4 assetsDataSource];
    id v15 = v14;
    if (v13) {
      [v14 assetReferenceAtIndexPath:v13];
    }
    else {
    id v16 = [v14 startingAssetReference];
    }

    uint64_t v17 = [(PUBrowsingSession *)v12 viewModel];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __78__PUAssetExplorerReviewScreenViewController__createBrowsingSessionIfNecessary__block_invoke_3;
    v35[3] = &unk_1E5F2D098;
    id v36 = v16;
    id v37 = v17;
    v38 = self;
    id v18 = v10;
    id v39 = v18;
    id v19 = v17;
    id v20 = v16;
    [v19 performChanges:v35];
    [v19 registerChangeObserver:self];
    uint64_t v21 = [(PUAssetExplorerReviewScreenViewController *)self resizeTaskDescriptorViewModel];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __78__PUAssetExplorerReviewScreenViewController__createBrowsingSessionIfNecessary__block_invoke_4;
    v33[3] = &unk_1E5F23920;
    v33[4] = self;
    id v34 = v18;
    id v22 = v18;
    [v21 performChanges:v33];

    actionManager = self->__actionManager;
    self->__actionManager = v8;
    v24 = v8;

    long long v25 = self->__browsingSession;
    self->__browsingSession = v12;
    id v26 = v12;

    browsingSession = self->__browsingSession;
  }
  return browsingSession;
}

uint64_t __78__PUAssetExplorerReviewScreenViewController__createBrowsingSessionIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelectedUUIDs:*(void *)(a1 + 32)];
}

uint64_t __78__PUAssetExplorerReviewScreenViewController__createBrowsingSessionIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSelectedUUIDs:*(void *)(a1 + 32)];
}

void __78__PUAssetExplorerReviewScreenViewController__createBrowsingSessionIfNecessary__block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "setCurrentAssetReference:");
  }
  uint64_t v2 = [*(id *)(a1 + 48) reviewBarsModel];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 48) reviewBarsModel];
    [*(id *)(a1 + 40) setReviewScreenBarsModel:v3];
  }
  [*(id *)(a1 + 40) setVideoContentAllowed:1 forReason:@"AssetExplorer"];
  id v4 = [*(id *)(a1 + 48) resizeTaskDescriptorViewModel];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 48) resizeTaskDescriptorViewModel];
    [*(id *)(a1 + 40) setResizeTaskDescriptorViewModel:v5];
  }
  if (([*(id *)(a1 + 48) _options] & 4) != 0)
  {
    objc_super v6 = *(void **)(a1 + 40);
    id v7 = [*(id *)(a1 + 48) _titleForSelectedAssetUUIDs:*(void *)(a1 + 56)];
    [v6 setNavigationBarTitle:v7];
  }
}

void __78__PUAssetExplorerReviewScreenViewController__createBrowsingSessionIfNecessary__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = [v2 _fileSizeMenuForSelectedUUIDs:v3];
  [v4 setFileSizeMenu:v5];
}

- (void)loadView
{
  v24.receiver = self;
  v24.super_class = (Class)PUAssetExplorerReviewScreenViewController;
  [(PUAssetExplorerReviewScreenViewController *)&v24 loadView];
  uint64_t v3 = [(PUAssetExplorerReviewScreenViewController *)self _spec];
  id v4 = [(PUAssetExplorerReviewScreenViewController *)self _createBrowsingSessionIfNecessary];
  unint64_t v5 = [(PUAssetExplorerReviewScreenViewController *)self sourceType];
  uint64_t v6 = [v3 oneUpOptions];
  if ([(PUAssetExplorerReviewScreenViewController *)self useSystemBackgroundColorBar]) {
    v6 |= 0x100000uLL;
  }
  id v7 = [[PUOneUpViewController alloc] initWithBrowsingSession:v4 options:v6 initialActivity:2 * (v5 == 4)];
  uint64_t v8 = [[PUNavigationController alloc] initWithRootViewController:v7];
  [(PUAssetExplorerReviewScreenViewController *)self addChildViewController:v8];
  objc_super v9 = [(PUAssetExplorerReviewScreenViewController *)self view];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  id v18 = [(PUNavigationController *)v8 view];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);
  [v18 setAutoresizingMask:18];
  [v9 addSubview:v18];
  [(PUNavigationController *)v8 didMoveToParentViewController:self];
  navigationController = self->__navigationController;
  self->__navigationController = v8;

  id v20 = [(PUAssetExplorerReviewScreenViewController *)self assetExplorerAnalytics];
  uint64_t v21 = [(PUAssetExplorerReviewScreenViewController *)self _actionManager];
  id v22 = [v21 selectionManager];
  v23 = [v22 selectedUUIDs];
  objc_msgSend(v20, "sendEvent:view:source:currentAssetCount:", @"PUAssetExplorerAnalyticsEventOpen1Up", 1, v5, objc_msgSend(v23, "count"));
}

- (void)setDelegate:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToDidPerformCompletionAction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidPressCancel = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToDidPressRetake = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToCanPerformActionType = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldEnableActionType = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillTransitionToSize = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToFileSizeMenu = objc_opt_respondsToSelector() & 1;
  }
}

- (PUAssetExplorerAnalytics)assetExplorerAnalytics
{
  assetExplorerAnalytics = self->_assetExplorerAnalytics;
  if (!assetExplorerAnalytics)
  {
    id v4 = objc_alloc_init(PUAssetExplorerAnalytics);
    unint64_t v5 = self->_assetExplorerAnalytics;
    self->_assetExplorerAnalytics = v4;

    assetExplorerAnalytics = self->_assetExplorerAnalytics;
  }
  return assetExplorerAnalytics;
}

- (PUAssetExplorerReviewScreenViewController)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4 reviewAssetProvider:(id)a5 initialIndexPath:(id)a6 initialSelectedAssetUUIDs:(id)a7 initialDisabledLivePhotoAssetUUIDs:(id)a8 selectionCountLimit:(id)a9 sourceType:(unint64_t)a10 lowMemoryMode:(BOOL)a11 reviewBarsModel:(id)a12 resizeTaskDescriptorViewModel:(id)a13 options:(unint64_t)a14
{
  id v50 = a3;
  id v48 = a4;
  id v47 = a5;
  id v46 = a6;
  id v49 = a7;
  id v21 = a8;
  id v45 = a9;
  id v44 = a12;
  id v43 = a13;
  v51.receiver = self;
  v51.super_class = (Class)PUAssetExplorerReviewScreenViewController;
  id v22 = [(PUAssetExplorerReviewScreenViewController *)&v51 initWithNibName:0 bundle:0];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->__clientDataSourceManager, a3);
    objc_storeStrong((id *)&v23->__clientMediaProvider, a4);
    objc_storeStrong((id *)&v23->__reviewAssetProvider, a5);
    objc_super v24 = [[PUAssetExplorerReviewScreenAssetsDataSourceManager alloc] initWithOriginalDataSourceManager:v50];
    reviewDataSourceManager = v23->__reviewDataSourceManager;
    v23->__reviewDataSourceManager = v24;

    id v26 = objc_alloc_init(PUJoiningMediaProvider);
    reviewMediaProvider = v23->__reviewMediaProvider;
    v23->__reviewMediaProvider = v26;

    long long v28 = objc_alloc_init(PUReviewAssetsMediaProvider);
    [(PUJoiningMediaProvider *)v23->__reviewMediaProvider registerMediaProvider:v28 forAssetPassingTest:&__block_literal_global_11468];
    id v29 = v23->__reviewMediaProvider;
    long long v30 = [(PUAssetExplorerReviewScreenViewController *)v23 _clientMediaProvider];
    [(PUJoiningMediaProvider *)v29 registerMediaProvider:v30 forAssetClass:objc_opt_class()];

    objc_storeStrong((id *)&v23->_initialIndexPath, a6);
    uint64_t v31 = [v49 copy];
    initialSelectedAssetUUIDs = v23->_initialSelectedAssetUUIDs;
    v23->_initialSelectedAssetUUIDs = (NSSet *)v31;

    uint64_t v33 = [v21 copy];
    initialDisabledLivePhotoAssetUUIDs = v23->_initialDisabledLivePhotoAssetUUIDs;
    v23->_initialDisabledLivePhotoAssetUUIDs = (NSSet *)v33;

    objc_storeStrong((id *)&v23->_selectionCountLimit, a9);
    objc_storeStrong((id *)&v23->_reviewBarsModel, a12);
    objc_storeStrong((id *)&v23->_resizeTaskDescriptorViewModel, a13);
    uint64_t v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    reviewAssetRequestsByUUID = v23->__reviewAssetRequestsByUUID;
    v23->__reviewAssetRequestsByUUID = v35;

    id v37 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    substituteAssetsByUUID = v23->__substituteAssetsByUUID;
    v23->__substituteAssetsByUUID = v37;

    v23->_sourceType = a10;
    v23->__lowMemoryMode = a11;
    v23->__options = a14;
    id v39 = [[PUReviewScreenSpec alloc] initWithOptions:a14];
    spec = v23->__spec;
    v23->__spec = v39;

    id v41 = v23;
  }

  return v23;
}

uint64_t __282__PUAssetExplorerReviewScreenViewController_initWithDataSourceManager_mediaProvider_reviewAssetProvider_initialIndexPath_initialSelectedAssetUUIDs_initialDisabledLivePhotoAssetUUIDs_selectionCountLimit_sourceType_lowMemoryMode_reviewBarsModel_resizeTaskDescriptorViewModel_options___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (PUAssetExplorerReviewScreenViewController)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4 reviewAssetProvider:(id)a5 initialIndexPath:(id)a6 initialSelectedAssetUUIDs:(id)a7 initialDisabledLivePhotoAssetUUIDs:(id)a8 selectionCountLimit:(id)a9 sourceType:(unint64_t)a10 lowMemoryMode:(BOOL)a11 options:(unint64_t)a12
{
  LOBYTE(v13) = a11;
  return [(PUAssetExplorerReviewScreenViewController *)self initWithDataSourceManager:a3 mediaProvider:a4 reviewAssetProvider:a5 initialIndexPath:a6 initialSelectedAssetUUIDs:a7 initialDisabledLivePhotoAssetUUIDs:a8 selectionCountLimit:a9 sourceType:a10 lowMemoryMode:v13 reviewBarsModel:0 resizeTaskDescriptorViewModel:0 options:a12];
}

- (PUAssetExplorerReviewScreenViewController)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4 reviewAssetProvider:(id)a5 initialIndexPath:(id)a6 initialSelectedAssetUUIDs:(id)a7 initialDisabledLivePhotoAssetUUIDs:(id)a8 sourceType:(unint64_t)a9
{
  LOBYTE(v10) = 0;
  return [(PUAssetExplorerReviewScreenViewController *)self initWithDataSourceManager:a3 mediaProvider:a4 reviewAssetProvider:a5 initialIndexPath:a6 initialSelectedAssetUUIDs:a7 initialDisabledLivePhotoAssetUUIDs:a8 selectionCountLimit:0 sourceType:a9 lowMemoryMode:v10 options:0];
}

- (PUAssetExplorerReviewScreenViewController)initWithDataSourceManager:(id)a3 mediaProvider:(id)a4 reviewAssetProvider:(id)a5 initialIndexPath:(id)a6 initialSelectedAssetUUIDs:(id)a7 initialDisabledLivePhotoAssetUUIDs:(id)a8 sourceType:(unint64_t)a9 reviewBarsModel:(id)a10 options:(unint64_t)a11
{
  LOBYTE(v12) = 0;
  return [(PUAssetExplorerReviewScreenViewController *)self initWithDataSourceManager:a3 mediaProvider:a4 reviewAssetProvider:a5 initialIndexPath:a6 initialSelectedAssetUUIDs:a7 initialDisabledLivePhotoAssetUUIDs:a8 selectionCountLimit:0 sourceType:a9 lowMemoryMode:v12 reviewBarsModel:a10 resizeTaskDescriptorViewModel:0 options:a11];
}

@end