@interface PUPhotoPickerRemoteViewController
+ (BOOL)_preventsAppearanceProxyCustomization;
+ (void)initialize;
- (BOOL)allowsMultipleSelection;
- (BOOL)convertAutoloopsToGIF;
- (BOOL)onboardingHeaderDismissedBefore;
- (BOOL)requiresPickingConfirmation;
- (BOOL)showsFileSizePicker;
- (BOOL)showsPrompt;
- (NSArray)mediaTypes;
- (NSDictionary)properties;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)leadingSafeAreaConstraint;
- (NSLayoutConstraint)topConstraint;
- (NSLayoutConstraint)trailingConstraint;
- (NSLayoutConstraint)trailingSafeAreaConstraint;
- (PUPhotoPickerExtensionContext)extensionContext;
- (PUPhotoPickerRemoteViewControllerRequestOptions)options;
- (PUPickerCoordinator)assetPickerCoordinator;
- (unint64_t)multipleSelectionLimit;
- (unint64_t)savingOptions;
- (void)_allowSharingSelectionOfInfoDictionaries:(id)a3 completion:(id)a4;
- (void)_confirmConfidentialWarning:(id)a3 showConfidentialityAlert:(BOOL)a4 completionHandler:(id)a5;
- (void)_confirmUserSafetyIntervention:(id)a3 completionHandler:(id)a4;
- (void)_handlePerformTraitCollectionUpdateUsingData:(id)a3 completion:(id)a4;
- (void)_handleViewControllerRequestWithOptions:(id)a3 error:(id)a4;
- (void)_loadContentViewIfNeeded;
- (void)_logAssetSelectionIfNeeded:(id)a3;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)cancelPhotoPicker;
- (void)didDisplayPhotoPickerPreview;
- (void)didDisplayPhotoPickerSourceType:(int64_t)a3;
- (void)didSelectMediaWithInfoDictionary:(id)a3 allowedHandler:(id)a4;
- (void)didSelectMultipleMediaItemsWithInfoDictionaries:(id)a3;
- (void)loadView;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performPhotoPickerPreviewOfFirstAsset;
- (void)performPhotosSelection;
- (void)performTraitCollectionUpdateUsingData:(id)a3 completion:(id)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentViewController:(id)a3;
- (void)setAssetPickerCoordinator:(id)a3;
- (void)setBottomConstraint:(id)a3;
- (void)setExtensionContext:(id)a3;
- (void)setLeadingConstraint:(id)a3;
- (void)setLeadingSafeAreaConstraint:(id)a3;
- (void)setOptions:(id)a3;
- (void)setTopConstraint:(id)a3;
- (void)setTrailingConstraint:(id)a3;
- (void)setTrailingSafeAreaConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateViewConstraints;
- (void)viewWillLayoutSubviews;
@end

@implementation PUPhotoPickerRemoteViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_leadingSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_assetPickerCoordinator, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_extensionContext);
}

- (void)setTrailingSafeAreaConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingSafeAreaConstraint
{
  return self->_trailingSafeAreaConstraint;
}

- (void)setLeadingSafeAreaConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingSafeAreaConstraint
{
  return self->_leadingSafeAreaConstraint;
}

- (void)setTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)trailingConstraint
{
  return self->_trailingConstraint;
}

- (void)setLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)leadingConstraint
{
  return self->_leadingConstraint;
}

- (void)setBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setAssetPickerCoordinator:(id)a3
{
}

- (PUPickerCoordinator)assetPickerCoordinator
{
  return self->_assetPickerCoordinator;
}

- (void)setOptions:(id)a3
{
}

- (PUPhotoPickerRemoteViewControllerRequestOptions)options
{
  return self->_options;
}

- (void)setExtensionContext:(id)a3
{
}

- (PUPhotoPickerExtensionContext)extensionContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionContext);
  return (PUPhotoPickerExtensionContext *)WeakRetained;
}

- (void)_confirmUserSafetyIntervention:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_9:
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUPhotoPickerRemoteViewController.m", 437, @"Invalid parameter not satisfying: %@", @"fetchResult != nil" object file lineNumber description];

    if (v8) {
      goto LABEL_4;
    }
    goto LABEL_10;
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPhotoPickerRemoteViewController.m", 436, @"%s must be called on the main thread", "-[PUPhotoPickerRemoteViewController _confirmUserSafetyIntervention:completionHandler:]");

  if (!v7) {
    goto LABEL_9;
  }
LABEL_3:
  if (v8) {
    goto LABEL_4;
  }
LABEL_10:
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PUPhotoPickerRemoteViewController.m", 438, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];

LABEL_4:
  v9 = [(PUPhotoPickerRemoteViewController *)self assetPickerCoordinator];
  v10 = [v9 configuration];
  int v11 = [v10 shouldShowCommunicationSafetyIntervention];

  if (v11)
  {
    v12 = [(PUPhotoPickerRemoteViewController *)self assetPickerCoordinator];
    [v12 startActivityIndicatorsForAssetsWithFetchResult:v7];

    v13 = (void *)MEMORY[0x1E4F906A8];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __86__PUPhotoPickerRemoteViewController__confirmUserSafetyIntervention_completionHandler___block_invoke;
    v17[3] = &unk_1E5F2AFC8;
    v17[4] = self;
    id v18 = v7;
    id v19 = v8;
    [v13 userSafetyInterventionCheckRequiredBeforeSharingAssets:v18 completion:v17];
  }
  else
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
}

void __86__PUPhotoPickerRemoteViewController__confirmUserSafetyIntervention_completionHandler___block_invoke(id *a1, int a2)
{
  v4 = [a1[4] assetPickerCoordinator];
  v5 = [a1[5] fetchedObjects];
  v6 = PXMap();
  [v4 stopActivityIndicatorsForAssetsWithIdentifiers:v6];

  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __86__PUPhotoPickerRemoteViewController__confirmUserSafetyIntervention_completionHandler___block_invoke_3;
    v8[3] = &unk_1E5F2D990;
    id v9 = a1[6];
    +[PUPickerUtilities presentUserSafetyViewControllerWithCompletionHandler:v8];
  }
  else
  {
    id v7 = (void (*)(void))*((void *)a1[6] + 2);
    v7();
  }
}

uint64_t __86__PUPhotoPickerRemoteViewController__confirmUserSafetyIntervention_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __86__PUPhotoPickerRemoteViewController__confirmUserSafetyIntervention_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

- (void)_confirmConfidentialWarning:(id)a3 showConfidentialityAlert:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = v7;
  if (v5)
  {
    id v9 = (void *)MEMORY[0x1E4F90698];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __108__PUPhotoPickerRemoteViewController__confirmConfidentialWarning_showConfidentialityAlert_completionHandler___block_invoke;
    v16[3] = &unk_1E5F2E898;
    id v17 = v7;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __108__PUPhotoPickerRemoteViewController__confirmConfidentialWarning_showConfidentialityAlert_completionHandler___block_invoke_2;
    v14 = &unk_1E5F2E898;
    id v15 = v17;
    v10 = [v9 confidentialityAlertWithConfirmAction:v16 abortAction:&v11];
    -[PUPhotoPickerRemoteViewController px_presentOverTopmostPresentedViewController:animated:completion:](self, "px_presentOverTopmostPresentedViewController:animated:completion:", v10, 1, 0, v11, v12, v13, v14);
  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
}

uint64_t __108__PUPhotoPickerRemoteViewController__confirmConfidentialWarning_showConfidentialityAlert_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __108__PUPhotoPickerRemoteViewController__confirmConfidentialWarning_showConfidentialityAlert_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_allowSharingSelectionOfInfoDictionaries:(id)a3 completion:(id)a4
{
  val = self;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  if (([MEMORY[0x1E4F90698] confidentialityCheckRequired] & 1) == 0)
  {
    id v7 = [(PUPhotoPickerRemoteViewController *)val assetPickerCoordinator];
    id v8 = [v7 configuration];
    int v9 = [v8 shouldShowCommunicationSafetyIntervention];

    if (!v9) {
      goto LABEL_26;
    }
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v38;
    uint64_t v14 = *MEMORY[0x1E4FB3238];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "objectForKeyedSubscript:", v14, val);
        if (v16) {
          [v10 addObject:v16];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v12);
  }

  if (![v10 count])
  {

LABEL_26:
    v6[2](v6, 1);
    goto LABEL_27;
  }
  id v17 = (void *)MEMORY[0x1E4F38EB8];
  id v18 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v19 = [v18 librarySpecificFetchOptions];
  v20 = [v17 fetchAssetsWithLocalIdentifiers:v10 options:v19];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v21 = v20;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v34;
    while (2)
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v21);
        }
        if (objc_msgSend(MEMORY[0x1E4F90698], "confidentialWarningRequiredForAsset:", *(void *)(*((void *)&v33 + 1) + 8 * j), val))
        {
          LOBYTE(v22) = 1;
          goto LABEL_23;
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }
LABEL_23:

  if (!v21) {
    goto LABEL_26;
  }
  objc_initWeak(&location, val);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __89__PUPhotoPickerRemoteViewController__allowSharingSelectionOfInfoDictionaries_completion___block_invoke;
  v27[3] = &unk_1E5F29EC8;
  objc_copyWeak(&v30, &location);
  id v25 = v21;
  id v28 = v25;
  char v31 = v22;
  v29 = v6;
  [(PUPhotoPickerRemoteViewController *)val _confirmUserSafetyIntervention:v25 completionHandler:v27];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

LABEL_27:
}

void __89__PUPhotoPickerRemoteViewController__allowSharingSelectionOfInfoDictionaries_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __89__PUPhotoPickerRemoteViewController__allowSharingSelectionOfInfoDictionaries_completion___block_invoke_2;
    v7[3] = &unk_1E5F2D990;
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [WeakRetained _confirmConfidentialWarning:v5 showConfidentialityAlert:v4 completionHandler:v7];
  }
  else
  {
    v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

uint64_t __89__PUPhotoPickerRemoteViewController__allowSharingSelectionOfInfoDictionaries_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_logAssetSelectionIfNeeded:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    uint64_t v10 = *MEMORY[0x1E4FB3238];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = [*(id *)(*((void *)&v20 + 1) + 8 * i) objectForKeyedSubscript:v10];
        if (v12)
        {
          uint64_t v13 = [MEMORY[0x1E4F391D0] uuidFromLocalIdentifier:v12];
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  if (MEMORY[0x1B3E7C970]())
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F38EB8];
    id v15 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    uint64_t v16 = [v14 countOfAssetsWithLocationFromUUIDs:v5 photoLibrary:v15];

    if (v16)
    {
      id v17 = [(PUPhotoPickerRemoteViewController *)self extensionContext];
      id v18 = [v17 _auxiliaryConnection];
      id v19 = PLClientApplicationIdentifierFromXPCConnection();

      plslogGreenTea();
    }
  }
}

- (void)performPhotoPickerPreviewOfFirstAsset
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PUPhotoPickerRemoteViewController.m" lineNumber:353 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PUPickerConfigurationObservationContext_64260 != a5)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PUPhotoPickerRemoteViewController.m" lineNumber:345 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 8) != 0)
  {
    id v14 = v9;
    uint64_t v10 = [(PUPhotoPickerRemoteViewController *)self extensionContext];
    id v11 = [(PUPhotoPickerRemoteViewController *)self assetPickerCoordinator];
    uint64_t v12 = [v11 configuration];
    objc_msgSend(v10, "didSetOnboardingHeaderDismissed:", objc_msgSend(v12, "didDismissOnboardingHeaderView"));

    id v9 = v14;
  }
}

- (void)_handlePerformTraitCollectionUpdateUsingData:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void (**)(id, void *))a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F29060];
  id v9 = a3;
  if (([v8 isMainThread] & 1) == 0)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PUPhotoPickerRemoteViewController.m" lineNumber:319 description:@"[PUPhotoPickerRemoteViewController _handlePerformTraitCollectionUpdateUsingData] must be called on the main thread."];
  }
  id v16 = 0;
  uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:&v16];

  id v11 = v16;
  if (v11)
  {
    uint64_t v12 = PLUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[PUPhotoPickerRemoteViewController _handlePerformTraitCollectionUpdateUsingData:completion:]";
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "%s Unable to create trait collection %@", buf, 0x16u);
    }
  }
  uint64_t v13 = [(PUPhotoPickerRemoteViewController *)self parentViewController];
  [v13 setOverrideTraitCollection:v10 forChildViewController:self];

  [(PUPhotoPickerRemoteViewController *)self _loadContentViewIfNeeded];
  if (v7)
  {
    id v14 = [NSNumber numberWithInt:v10 != 0];
    v7[2](v7, v14);
  }
}

- (void)performTraitCollectionUpdateUsingData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(PUPhotoPickerRemoteViewController *)self _handlePerformTraitCollectionUpdateUsingData:v6 completion:v7];
  }
  else
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __86__PUPhotoPickerRemoteViewController_performTraitCollectionUpdateUsingData_completion___block_invoke;
    v8[3] = &unk_1E5F29EA0;
    objc_copyWeak(&v11, &location);
    id v9 = v6;
    id v10 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __86__PUPhotoPickerRemoteViewController_performTraitCollectionUpdateUsingData_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handlePerformTraitCollectionUpdateUsingData:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)performPhotosSelection
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PUPhotoPickerRemoteViewController.m" lineNumber:304 description:@"Code which should be unreachable has been reached"];

  abort();
}

- (void)didSelectMultipleMediaItemsWithInfoDictionaries:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__PUPhotoPickerRemoteViewController_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke;
  v6[3] = &unk_1E5F2E1C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PUPhotoPickerRemoteViewController *)self _allowSharingSelectionOfInfoDictionaries:v5 completion:v6];
}

void __85__PUPhotoPickerRemoteViewController_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _logAssetSelectionIfNeeded:*(void *)(a1 + 40)];
    v3 = [*(id *)(a1 + 32) extensionContext];
    [v3 didSelectMultipleMediaItemsWithInfoDictionaries:*(void *)(a1 + 40)];

    id v4 = [*(id *)(a1 + 32) assetPickerCoordinator];
    [v4 emitDidFinishPickingAnalytics];
  }
}

- (void)didSelectMediaWithInfoDictionary:(id)a3 allowedHandler:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v14[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __85__PUPhotoPickerRemoteViewController_didSelectMediaWithInfoDictionary_allowedHandler___block_invoke;
  v11[3] = &unk_1E5F2AFC8;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(PUPhotoPickerRemoteViewController *)self _allowSharingSelectionOfInfoDictionaries:v8 completion:v11];
}

void __85__PUPhotoPickerRemoteViewController_didSelectMediaWithInfoDictionary_allowedHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }
  if (v2)
  {
    id v5 = *(void **)(a1 + 32);
    v9[0] = *(void *)(a1 + 40);
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v5 _logAssetSelectionIfNeeded:v6];

    id v7 = [*(id *)(a1 + 32) extensionContext];
    [v7 didSelectMediaWithInfoDictionary:*(void *)(a1 + 40)];

    uint64_t v8 = [*(id *)(a1 + 32) assetPickerCoordinator];
    [v8 emitDidFinishPickingAnalytics];
  }
}

- (void)didDisplayPhotoPickerPreview
{
  id v2 = [(PUPhotoPickerRemoteViewController *)self extensionContext];
  [v2 didDisplayPhotoPickerPreview];
}

- (void)didDisplayPhotoPickerSourceType:(int64_t)a3
{
  id v5 = [NSNumber numberWithInteger:a3];
  uint64_t v4 = [(PUPhotoPickerRemoteViewController *)self extensionContext];
  [v4 didDisplayPhotoPickerSourceType:v5];
}

- (void)cancelPhotoPicker
{
  v3 = [(PUPhotoPickerRemoteViewController *)self extensionContext];
  [v3 cancelPhotoPicker];

  id v4 = [(PUPhotoPickerRemoteViewController *)self assetPickerCoordinator];
  [v4 emitDidFinishPickingAnalytics];
}

- (void)presentViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPhotoPickerRemoteViewController *)self px_topmostPresentedViewController];
  [v5 presentViewController:v4 animated:1 completion:0];
}

- (NSDictionary)properties
{
  id v2 = [(PUPhotoPickerRemoteViewController *)self options];
  v3 = [v2 photoPickerProperties];

  return (NSDictionary *)v3;
}

- (BOOL)convertAutoloopsToGIF
{
  id v2 = [(PUPhotoPickerRemoteViewController *)self options];
  char v3 = [v2 convertAutoloopsToGIF];

  return v3;
}

- (BOOL)showsPrompt
{
  id v2 = [(PUPhotoPickerRemoteViewController *)self options];
  char v3 = [v2 showsPrompt];

  return v3;
}

- (BOOL)showsFileSizePicker
{
  id v2 = [(PUPhotoPickerRemoteViewController *)self options];
  char v3 = [v2 showsFileSizePicker];

  return v3;
}

- (BOOL)requiresPickingConfirmation
{
  id v2 = [(PUPhotoPickerRemoteViewController *)self options];
  char v3 = [v2 requiresPickingConfirmation];

  return v3;
}

- (unint64_t)multipleSelectionLimit
{
  id v2 = [(PUPhotoPickerRemoteViewController *)self options];
  unint64_t v3 = [v2 multipleSelectionLimit];

  return v3;
}

- (BOOL)allowsMultipleSelection
{
  id v2 = [(PUPhotoPickerRemoteViewController *)self options];
  char v3 = [v2 allowsMultipleSelection];

  return v3;
}

- (BOOL)onboardingHeaderDismissedBefore
{
  id v2 = [(PUPhotoPickerRemoteViewController *)self options];
  char v3 = [v2 onboardingHeaderDismissedBefore];

  return v3;
}

- (NSArray)mediaTypes
{
  id v2 = [(PUPhotoPickerRemoteViewController *)self options];
  char v3 = [v2 mediaTypes];

  return (NSArray *)v3;
}

- (unint64_t)savingOptions
{
  id v2 = [(PUPhotoPickerRemoteViewController *)self options];
  unint64_t v3 = [v2 savingOptions];

  return v3;
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  [(PUPhotoPickerRemoteViewController *)self setExtensionContext:v4];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__PUPhotoPickerRemoteViewController_beginRequestWithExtensionContext___block_invoke;
  v5[3] = &unk_1E5F29E78;
  objc_copyWeak(&v6, &location);
  [v4 requestedViewControllerOptionsWithCompletionHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __70__PUPhotoPickerRemoteViewController_beginRequestWithExtensionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleViewControllerRequestWithOptions:v6 error:v5];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUPhotoPickerRemoteViewController;
  id v4 = a3;
  [(PUPhotoPickerRemoteViewController *)&v9 preferredContentSizeDidChangeForChildContentContainer:v4];
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  double v6 = v5;
  double v8 = v7;

  -[PUPhotoPickerRemoteViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUPhotoPickerRemoteViewController;
  id v4 = a3;
  [(PUPhotoPickerRemoteViewController *)&v9 traitCollectionDidChange:v4];
  double v5 = [(PUPhotoPickerRemoteViewController *)self traitCollection];
  uint64_t v6 = [v5 _presentationSemanticContext];
  uint64_t v7 = [v4 _presentationSemanticContext];

  if (v6 != v7)
  {
    double v8 = [(PUPhotoPickerRemoteViewController *)self view];
    [v8 setNeedsUpdateConstraints];
  }
}

- (void)updateViewConstraints
{
  unint64_t v3 = [(PUPhotoPickerRemoteViewController *)self traitCollection];
  uint64_t v4 = [v3 _presentationSemanticContext];
  BOOL v5 = v4 == 3;
  BOOL v6 = v4 != 3;

  uint64_t v7 = [(PUPhotoPickerRemoteViewController *)self topConstraint];
  [v7 setActive:1];

  double v8 = [(PUPhotoPickerRemoteViewController *)self bottomConstraint];
  [v8 setActive:1];

  objc_super v9 = [(PUPhotoPickerRemoteViewController *)self leadingConstraint];
  [v9 setActive:v6];

  id v10 = [(PUPhotoPickerRemoteViewController *)self trailingConstraint];
  [v10 setActive:v6];

  id v11 = [(PUPhotoPickerRemoteViewController *)self leadingSafeAreaConstraint];
  [v11 setActive:v5];

  id v12 = [(PUPhotoPickerRemoteViewController *)self trailingSafeAreaConstraint];
  [v12 setActive:v5];

  v13.receiver = self;
  v13.super_class = (Class)PUPhotoPickerRemoteViewController;
  [(PUPhotoPickerRemoteViewController *)&v13 updateViewConstraints];
}

- (void)_loadContentViewIfNeeded
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    long long v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2 object:self file:@"PUPhotoPickerRemoteViewController.m" lineNumber:138 description:@"[PUPhotoPickerRemoteViewController _loadContentViewIfNeeded] must be called on the main thread."];
  }
  obuint64_t j = self;
  objc_sync_enter(obj);
  uint64_t v4 = [(PUPhotoPickerRemoteViewController *)obj options];
  if (v4)
  {
    BOOL v5 = [(PUPhotoPickerRemoteViewController *)obj assetPickerCoordinator];
    if (!v5)
    {
      if (![(PUPhotoPickerRemoteViewController *)obj isViewLoaded]) {
        goto LABEL_10;
      }
      BOOL v6 = [(PUPhotoPickerRemoteViewController *)obj assetPickerCoordinator];

      if (!v6)
      {
        uint64_t v7 = [PUPickerCoordinator alloc];
        double v8 = [(PUPhotoPickerRemoteViewController *)obj mediaTypes];
        objc_super v9 = [(PUPhotoPickerRemoteViewController *)obj extensionContext];
        id v10 = [v9 _auxiliaryConnection];
        id v11 = [(PUPickerCoordinator *)v7 initWithPhotoPicker:obj mediaTypes:v8 connection:v10];

        id v12 = [(PUPickerCoordinator *)v11 configuration];
        [v12 registerChangeObserver:obj context:PUPickerConfigurationObservationContext_64260];

        [(PUPhotoPickerRemoteViewController *)obj setAssetPickerCoordinator:v11];
      }
      objc_super v13 = [(PUPhotoPickerRemoteViewController *)obj assetPickerCoordinator];
      BOOL v5 = [v13 viewController];

      [v5 preferredContentSize];
      -[PUPhotoPickerRemoteViewController setPreferredContentSize:](obj, "setPreferredContentSize:");
      [(PUPhotoPickerRemoteViewController *)obj addChildViewController:v5];
      id v14 = [(PUPhotoPickerRemoteViewController *)obj view];
      id v15 = [v5 view];
      [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v14 addSubview:v15];
      id v16 = [v14 topAnchor];
      id v17 = [v15 topAnchor];
      id v18 = [v16 constraintEqualToAnchor:v17];
      [(PUPhotoPickerRemoteViewController *)obj setTopConstraint:v18];

      __int16 v19 = [v14 bottomAnchor];
      id v20 = [v15 bottomAnchor];
      uint64_t v21 = [v19 constraintEqualToAnchor:v20];
      [(PUPhotoPickerRemoteViewController *)obj setBottomConstraint:v21];

      long long v22 = [v14 leadingAnchor];
      long long v23 = [v15 leadingAnchor];
      v24 = [v22 constraintEqualToAnchor:v23];
      [(PUPhotoPickerRemoteViewController *)obj setLeadingConstraint:v24];

      uint64_t v25 = [v14 trailingAnchor];
      v26 = [v15 trailingAnchor];
      v27 = [v25 constraintEqualToAnchor:v26];
      [(PUPhotoPickerRemoteViewController *)obj setTrailingConstraint:v27];

      id v28 = [v14 safeAreaLayoutGuide];
      v29 = [v28 leadingAnchor];
      id v30 = [v15 leadingAnchor];
      char v31 = [v29 constraintEqualToAnchor:v30];
      [(PUPhotoPickerRemoteViewController *)obj setLeadingSafeAreaConstraint:v31];

      v32 = [v14 safeAreaLayoutGuide];
      long long v33 = [v32 trailingAnchor];
      long long v34 = [v15 trailingAnchor];
      long long v35 = [v33 constraintEqualToAnchor:v34];
      [(PUPhotoPickerRemoteViewController *)obj setTrailingSafeAreaConstraint:v35];

      [v14 setNeedsUpdateConstraints];
      [v5 didMoveToParentViewController:obj];
      long long v36 = [v14 window];
      [v36 setCanResizeToFitContent:1];

      [v14 layoutIfNeeded];
    }
  }
LABEL_10:

  objc_sync_exit(obj);
}

- (void)_handleViewControllerRequestWithOptions:(id)a3 error:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "PhotoPicker error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    [(PUPhotoPickerRemoteViewController *)self setOptions:a3];
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoPickerRemoteViewController;
  [(PUPhotoPickerRemoteViewController *)&v3 viewWillLayoutSubviews];
  [(PUPhotoPickerRemoteViewController *)self _loadContentViewIfNeeded];
}

- (void)loadView
{
  if (MEMORY[0x1B3E7C970](self, a2))
  {
    objc_super v3 = [(PUPhotoPickerRemoteViewController *)self extensionContext];
    uint64_t v4 = [v3 _auxiliaryConnection];
    BOOL v5 = PLClientApplicationIdentifierFromXPCConnection();

    MEMORY[0x1B3E7C980](v5);
  }
  id v6 = [PUPhotoPickerRemoteContainerView alloc];
  uint64_t v7 = -[PUPhotoPickerRemoteContainerView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PUPhotoPickerRemoteContainerView *)v7 setAutoresizingMask:18];
  [(PUPhotoPickerRemoteViewController *)self setView:v7];
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

+ (void)initialize
{
  if (PLIsPhotoPicker() && initialize_onceToken_64285 != -1)
  {
    dispatch_once(&initialize_onceToken_64285, &__block_literal_global_64286);
  }
}

uint64_t __47__PUPhotoPickerRemoteViewController_initialize__block_invoke()
{
  [MEMORY[0x1E4F90668] setSuiteName:@"com.apple.mobileslideshow"];
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 removeObjectForKey:@"UIBarsApplyChromelessEverywhere"];

  return PXAsynchronousAddDragAndDropFileProviderDomain();
}

@end