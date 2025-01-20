@interface PUPickerPrincipalUIViewController
+ (BOOL)_preventsAppearanceProxyCustomization;
+ (BOOL)shouldDebounceDidFinishPicking:(id)a3 previousSelectedObjectIDs:(id)a4 previousSelectionDate:(id)a5;
+ (void)initialize;
- (BOOL)canBecomeFirstResponder;
- (BOOL)updatePicker;
- (NSDate)selectionDate;
- (NSError)configurationError;
- (NSError)domainError;
- (NSFileProviderDomain)domain;
- (NSFileProviderManager)manager;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)leadingConstraint;
- (NSLayoutConstraint)leadingSafeAreaConstraint;
- (NSLayoutConstraint)topConstraint;
- (NSLayoutConstraint)trailingConstraint;
- (NSLayoutConstraint)trailingSafeAreaConstraint;
- (NSMutableDictionary)progressSubscribers;
- (NSMutableSet)programmaticallySelectedItemIdentifiers;
- (NSOrderedSet)selectedObjectIDs;
- (PUPickerConfiguration)configuration;
- (PUPickerCoordinator)coordinator;
- (PXLoadingStatusManager)loadingStatusManager;
- (id)showProgress:(id)a3 forAsset:(id)a4 progressURL:(id)a5;
- (void)_deselectAssetsWithIdentifiers:(id)a3;
- (void)_hostModalInPresentationDidChange:(BOOL)a3;
- (void)_moveAssetWithIdentifier:(id)a3 afterIdentifier:(id)a4;
- (void)_pickerDidPerformCancelAction:(id)a3;
- (void)_pickerDidPerformConfirmationAction:(id)a3;
- (void)_pickerUnavailableViewControllerCancelButtonTapped:(id)a3;
- (void)_popViewControllerWithReply:(id)a3;
- (void)_scrollContentToInitialPosition;
- (void)_searchWithString:(id)a3;
- (void)_startActivityIndicatorsForAssetsWithIdentifiers:(id)a3;
- (void)_stopActivityIndicatorsForAssetsWithIdentifiers:(id)a3;
- (void)_updateConfiguration:(id)a3 completionHandler:(id)a4;
- (void)_updatePickerUsingUpdateConfiguration:(id)a3;
- (void)_updateSelectedAssetsWithIdentifiers:(id)a3;
- (void)_zoomInContent;
- (void)_zoomOutContent;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)confirmConfidentialWarning:(id)a3 completionHandler:(id)a4;
- (void)confirmUserSafetyIntervention:(id)a3 completionHandler:(id)a4;
- (void)coordinator:(id)a3 didFinishPicking:(id)a4 additionalSelectionState:(id)a5;
- (void)find:(id)a3;
- (void)finishPicking:(id)a3 additionalSelectionState:(id)a4;
- (void)finishProgress:(id)a3 progressURL:(id)a4 trackingID:(id)a5 observation:(id)a6;
- (void)logExitIfNeeded:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setBottomConstraint:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConfigurationError:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setDomain:(id)a3;
- (void)setDomainError:(id)a3;
- (void)setLeadingConstraint:(id)a3;
- (void)setLeadingSafeAreaConstraint:(id)a3;
- (void)setLoadingStatusManager:(id)a3;
- (void)setManager:(id)a3;
- (void)setProgrammaticallySelectedItemIdentifiers:(id)a3;
- (void)setProgressSubscribers:(id)a3;
- (void)setSelectedObjectIDs:(id)a3;
- (void)setSelectionDate:(id)a3;
- (void)setTopConstraint:(id)a3;
- (void)setTrailingConstraint:(id)a3;
- (void)setTrailingSafeAreaConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateModalInPresentation;
- (void)updateViewConstraints;
@end

@implementation PUPickerPrincipalUIViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressSubscribers, 0);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_selectionDate, 0);
  objc_storeStrong((id *)&self->_selectedObjectIDs, 0);
  objc_storeStrong((id *)&self->_programmaticallySelectedItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_trailingSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_leadingSafeAreaConstraint, 0);
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_domainError, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_configurationError, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)setProgressSubscribers:(id)a3
{
}

- (NSMutableDictionary)progressSubscribers
{
  return self->_progressSubscribers;
}

- (void)setLoadingStatusManager:(id)a3
{
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (void)setSelectionDate:(id)a3
{
}

- (NSDate)selectionDate
{
  return self->_selectionDate;
}

- (void)setSelectedObjectIDs:(id)a3
{
}

- (NSOrderedSet)selectedObjectIDs
{
  return self->_selectedObjectIDs;
}

- (void)setProgrammaticallySelectedItemIdentifiers:(id)a3
{
}

- (NSMutableSet)programmaticallySelectedItemIdentifiers
{
  return self->_programmaticallySelectedItemIdentifiers;
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

- (void)setCoordinator:(id)a3
{
}

- (PUPickerCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setDomainError:(id)a3
{
}

- (NSError)domainError
{
  return self->_domainError;
}

- (void)setDomain:(id)a3
{
}

- (NSFileProviderDomain)domain
{
  return self->_domain;
}

- (void)setManager:(id)a3
{
}

- (NSFileProviderManager)manager
{
  return self->_manager;
}

- (void)setConfigurationError:(id)a3
{
}

- (NSError)configurationError
{
  return self->_configurationError;
}

- (void)setConfiguration:(id)a3
{
}

- (PUPickerConfiguration)configuration
{
  return self->_configuration;
}

- (void)find:(id)a3
{
  id v3 = [(PUPickerPrincipalUIViewController *)self coordinator];
  [v3 makeSearchBarAsFirstResponder];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PUPickerConfigurationObservationContext != a5)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"PUPickerPrincipalUIViewController.m" lineNumber:776 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  id v19 = v9;
  if ((v6 & 4) != 0)
  {
    v10 = [(PUPickerPrincipalUIViewController *)self extensionContext];
    v11 = [v10 _auxiliaryConnection];
    v12 = [v11 remoteObjectProxy];

    v13 = [(PUPickerPrincipalUIViewController *)self configuration];
    objc_msgSend(v12, "_pickerDidSetOnboardingOverlayDismissed:", objc_msgSend(v13, "didDismissOnboardingOverlayView"));

    id v9 = v19;
  }
  if ((v6 & 8) != 0)
  {
    v14 = [(PUPickerPrincipalUIViewController *)self extensionContext];
    v15 = [v14 _auxiliaryConnection];
    v16 = [v15 remoteObjectProxy];

    v17 = [(PUPickerPrincipalUIViewController *)self configuration];
    objc_msgSend(v16, "_pickerDidSetOnboardingHeaderDismissed:", objc_msgSend(v17, "didDismissOnboardingHeaderView"));

    id v9 = v19;
  }
}

- (void)_pickerDidPerformConfirmationAction:(id)a3
{
  id v3 = [(PUPickerPrincipalUIViewController *)self extensionContext];
  v4 = [v3 _auxiliaryConnection];
  id v5 = [v4 remoteObjectProxy];

  [v5 _pickerDidPerformConfirmationAction];
}

- (void)_pickerDidPerformCancelAction:(id)a3
{
  id v3 = [(PUPickerPrincipalUIViewController *)self extensionContext];
  v4 = [v3 _auxiliaryConnection];
  id v5 = [v4 remoteObjectProxy];

  [v5 _pickerDidPerformCancelAction];
}

- (void)coordinator:(id)a3 didFinishPicking:(id)a4 additionalSelectionState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_14:
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"PUPickerPrincipalUIViewController.m", 706, @"Invalid parameter not satisfying: %@", @"coordinator != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  v39 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerPrincipalUIViewController.m", 705, @"%s must be called on the main thread", "-[PUPickerPrincipalUIViewController coordinator:didFinishPicking:additionalSelectionState:]");

  if (!v9) {
    goto LABEL_14;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_15:
  v41 = [MEMORY[0x1E4F28B00] currentHandler];
  [v41 handleFailureInMethod:a2, self, @"PUPickerPrincipalUIViewController.m", 707, @"Invalid parameter not satisfying: %@", @"additionalSelectionState != nil" object file lineNumber description];

LABEL_4:
  v12 = [(PUPickerPrincipalUIViewController *)self selectionDate];
  v13 = [MEMORY[0x1E4F1C9C8] date];
  [(PUPickerPrincipalUIViewController *)self setSelectionDate:v13];

  v14 = [(PUPickerPrincipalUIViewController *)self selectedObjectIDs];
  if (!+[PUPickerPrincipalUIViewController shouldDebounceDidFinishPicking:v10 previousSelectedObjectIDs:v14 previousSelectionDate:v12])
  {
    v44 = v12;
    id v45 = v9;
    id v15 = objc_alloc(MEMORY[0x1E4F39150]);
    uint64_t v16 = [v10 array];
    v17 = (void *)v16;
    if (v16) {
      uint64_t v18 = v16;
    }
    else {
      uint64_t v18 = MEMORY[0x1E4F1CBF0];
    }
    id v19 = [(PUPickerPrincipalUIViewController *)self coordinator];
    v20 = [v19 configuration];
    [v20 photoLibrary];
    v21 = v46 = v11;
    v22 = [(PUPickerPrincipalUIViewController *)self configuration];
    [v22 fetchType];
    v23 = v47 = v10;
    uint64_t v24 = [v15 initWithOids:v18 photoLibrary:v21 fetchType:v23 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

    v25 = (void *)[v47 mutableCopy];
    v43 = v14;
    [v25 minusOrderedSet:v14];
    id v26 = objc_alloc(MEMORY[0x1E4F39150]);
    v42 = v25;
    uint64_t v27 = [v25 array];
    v28 = (void *)v27;
    if (v27) {
      uint64_t v29 = v27;
    }
    else {
      uint64_t v29 = MEMORY[0x1E4F1CBF0];
    }
    v30 = [(PUPickerPrincipalUIViewController *)self coordinator];
    v31 = [v30 configuration];
    v32 = [v31 photoLibrary];
    v33 = [(PUPickerPrincipalUIViewController *)self configuration];
    v34 = [v33 fetchType];
    v35 = v26;
    v36 = (void *)v24;
    uint64_t v37 = v29;
    id v10 = v47;
    v38 = (void *)[v35 initWithOids:v37 photoLibrary:v32 fetchType:v34 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

    id v11 = v46;
    objc_initWeak(&location, self);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __91__PUPickerPrincipalUIViewController_coordinator_didFinishPicking_additionalSelectionState___block_invoke;
    v48[3] = &unk_1E5F223D8;
    objc_copyWeak(&v52, &location);
    v48[4] = v38;
    id v49 = v47;
    v50 = v36;
    id v51 = v46;
    [(PUPickerPrincipalUIViewController *)self confirmUserSafetyIntervention:v38 completionHandler:v48];

    objc_destroyWeak(&v52);
    objc_destroyWeak(&location);

    v12 = v44;
    id v9 = v45;
    v14 = v43;
  }
}

void __91__PUPickerPrincipalUIViewController_coordinator_didFinishPicking_additionalSelectionState___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = (id *)(a1 + 64);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v5 = *(void *)(a1 + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __91__PUPickerPrincipalUIViewController_coordinator_didFinishPicking_additionalSelectionState___block_invoke_2;
    v11[3] = &unk_1E5F29290;
    objc_copyWeak(&v15, v3);
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v8 = *(void **)(a1 + 56);
    id v12 = v6;
    uint64_t v13 = v7;
    id v14 = v8;
    [WeakRetained confirmConfidentialWarning:v5 completionHandler:v11];

    objc_destroyWeak(&v15);
  }
  else
  {
    id v9 = PLPickerGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "Aborted picking after confidential warning.", v10, 2u);
    }
  }
}

void __91__PUPickerPrincipalUIViewController_coordinator_didFinishPicking_additionalSelectionState___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = (id *)(a1 + 56);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained setSelectedObjectIDs:v3];

    id v7 = objc_loadWeakRetained(v4);
    [v7 finishPicking:*(void *)(a1 + 40) additionalSelectionState:*(void *)(a1 + 48)];
  }
  else
  {
    id v6 = PLPickerGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Aborted picking after user safety intervention.", buf, 2u);
    }
  }
}

- (void)_zoomOutContent
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerPrincipalUIViewController.m", 697, @"%s must be called on the main thread", "-[PUPickerPrincipalUIViewController _zoomOutContent]");
  }
  id v5 = [(PUPickerPrincipalUIViewController *)self coordinator];
  [v5 zoomOutContent];
}

- (void)_zoomInContent
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerPrincipalUIViewController.m", 691, @"%s must be called on the main thread", "-[PUPickerPrincipalUIViewController _zoomInContent]");
  }
  id v5 = [(PUPickerPrincipalUIViewController *)self coordinator];
  [v5 zoomInContent];
}

- (void)_scrollContentToInitialPosition
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerPrincipalUIViewController.m", 685, @"%s must be called on the main thread", "-[PUPickerPrincipalUIViewController _scrollContentToInitialPosition]");
  }
  id v5 = [(PUPickerPrincipalUIViewController *)self coordinator];
  [v5 scrollContentToInitialPosition];
}

- (void)_popViewControllerWithReply:(id)a3
{
  id v9 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerPrincipalUIViewController.m", 676, @"%s must be called on the main thread", "-[PUPickerPrincipalUIViewController _popViewControllerWithReply:]");
  }
  id v5 = [(PUPickerPrincipalUIViewController *)self coordinator];
  uint64_t v6 = [v5 popViewController];

  id v7 = v9;
  if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, v6);
    id v7 = v9;
  }
}

- (void)_searchWithString:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (v5)
    {
LABEL_3:
      uint64_t v6 = [(PUPickerPrincipalUIViewController *)self coordinator];
      [v6 searchWithString:v5];
      goto LABEL_7;
    }
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerPrincipalUIViewController.m", 666, @"%s must be called on the main thread", "-[PUPickerPrincipalUIViewController _searchWithString:]");

    if (v5) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = PLPickerGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v9 = 0;
    __int16 v10 = 2080;
    id v11 = "-[PUPickerPrincipalUIViewController _searchWithString:]";
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Invalid inputs (%@) received: %s", buf, 0x16u);
  }
LABEL_7:
}

- (void)_updateSelectedAssetsWithIdentifiers:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerPrincipalUIViewController.m", 649, @"%s must be called on the main thread", "-[PUPickerPrincipalUIViewController _updateSelectedAssetsWithIdentifiers:]");
  }
  uint64_t v6 = [(PUPickerPrincipalUIViewController *)self coordinator];
  id v7 = [v6 configuration];
  uint64_t v8 = [v7 sourceType];

  if (v8)
  {
    uint64_t v9 = PLPickerGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      __int16 v10 = [(PUPickerPrincipalUIViewController *)self coordinator];
      id v11 = [v10 configuration];
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = [v11 sourceType];
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEBUG, "Skipping _updateSelectedAssetsWithIdentifiers for %ld picker", buf, 0xCu);
    }
  }
  else
  {
    if (v5
      && ([(PUPickerPrincipalUIViewController *)self coordinator],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          [v12 configuration],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v13 receivedPhotoLibrary],
          v13,
          v12,
          v14))
    {
      id v15 = [(PUPickerPrincipalUIViewController *)self programmaticallySelectedItemIdentifiers];
      [v15 addObjectsFromArray:v5];

      uint64_t v16 = [(PUPickerPrincipalUIViewController *)self coordinator];
      [v16 updateSelectedAssetsWithIdentifiers:v5];
    }
    else
    {
      uint64_t v16 = PLPickerGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v19 = (uint64_t)v5;
        __int16 v20 = 2080;
        v21 = "-[PUPickerPrincipalUIViewController _updateSelectedAssetsWithIdentifiers:]";
        _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_ERROR, "Invalid inputs (%@) received: %s", buf, 0x16u);
      }
    }
  }
}

- (void)_moveAssetWithIdentifier:(id)a3 afterIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (!v7) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerPrincipalUIViewController.m", 639, @"%s must be called on the main thread", "-[PUPickerPrincipalUIViewController _moveAssetWithIdentifier:afterIdentifier:]");

    if (!v7) {
      goto LABEL_6;
    }
  }
  uint64_t v9 = [(PUPickerPrincipalUIViewController *)self coordinator];
  __int16 v10 = [v9 configuration];
  int v11 = [v10 receivedPhotoLibrary];

  if (v11)
  {
    uint64_t v12 = [(PUPickerPrincipalUIViewController *)self coordinator];
    [v12 moveAssetWithIdentifier:v7 afterIdentifier:v8];
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v12 = PLPickerGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2080;
    uint64_t v19 = "-[PUPickerPrincipalUIViewController _moveAssetWithIdentifier:afterIdentifier:]";
    _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "Invalid inputs (%@, %@) received: %s", buf, 0x20u);
  }
LABEL_8:
}

- (void)_deselectAssetsWithIdentifiers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    __int16 v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerPrincipalUIViewController.m", 629, @"%s must be called on the main thread", "-[PUPickerPrincipalUIViewController _deselectAssetsWithIdentifiers:]");
  }
  if ([v5 count]
    && ([(PUPickerPrincipalUIViewController *)self coordinator],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v6 configuration],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 receivedPhotoLibrary],
        v7,
        v6,
        v8))
  {
    uint64_t v9 = [(PUPickerPrincipalUIViewController *)self coordinator];
    [v9 deselectAssetsWithIdentifiers:v5];
  }
  else
  {
    uint64_t v9 = PLPickerGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v5;
      __int16 v13 = 2080;
      int v14 = "-[PUPickerPrincipalUIViewController _deselectAssetsWithIdentifiers:]";
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "Invalid inputs (%@) received: %s", buf, 0x16u);
    }
  }
}

- (void)_stopActivityIndicatorsForAssetsWithIdentifiers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (!v5) {
      goto LABEL_6;
    }
  }
  else
  {
    __int16 v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerPrincipalUIViewController.m", 619, @"%s must be called on the main thread", "-[PUPickerPrincipalUIViewController _stopActivityIndicatorsForAssetsWithIdentifiers:]");

    if (!v5) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = [(PUPickerPrincipalUIViewController *)self coordinator];
  id v7 = [v6 configuration];
  int v8 = [v7 receivedPhotoLibrary];

  if (v8)
  {
    uint64_t v9 = [(PUPickerPrincipalUIViewController *)self coordinator];
    [v9 stopActivityIndicatorsForAssetsWithIdentifiers:v5];
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v9 = PLPickerGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v5;
    __int16 v13 = 2080;
    int v14 = "-[PUPickerPrincipalUIViewController _stopActivityIndicatorsForAssetsWithIdentifiers:]";
    _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "Invalid inputs (%@) received: %s", buf, 0x16u);
  }
LABEL_8:
}

- (void)_startActivityIndicatorsForAssetsWithIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (!v5) {
      goto LABEL_6;
    }
  }
  else
  {
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerPrincipalUIViewController.m", 607, @"%s must be called on the main thread", "-[PUPickerPrincipalUIViewController _startActivityIndicatorsForAssetsWithIdentifiers:]");

    if (!v5) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = [(PUPickerPrincipalUIViewController *)self coordinator];
  id v7 = [v6 configuration];
  int v8 = [v7 receivedPhotoLibrary];

  if (v8)
  {
    uint64_t v9 = [(PUPickerPrincipalUIViewController *)self configuration];
    __int16 v10 = [v9 photoLibrary];
    int v11 = [v10 librarySpecificFetchOptions];

    id v12 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v5 options:v11];
    __int16 v13 = [(PUPickerPrincipalUIViewController *)self coordinator];
    [v13 startActivityIndicatorsForAssetsWithFetchResult:v12];

    goto LABEL_9;
  }
LABEL_6:
  uint64_t v15 = PLPickerGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v5;
    __int16 v18 = 2080;
    uint64_t v19 = "-[PUPickerPrincipalUIViewController _startActivityIndicatorsForAssetsWithIdentifiers:]";
    _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "Invalid inputs (%@) received: %s", buf, 0x16u);
  }

LABEL_9:
}

- (void)_hostModalInPresentationDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerPrincipalUIViewController.m", 588, @"%s must be called on the main thread", "-[PUPickerPrincipalUIViewController _hostModalInPresentationDidChange:]");
  }
  if ([(PUPickerPrincipalUIViewController *)self isModalInPresentation] != v3)
  {
    [(PUPickerPrincipalUIViewController *)self setModalInPresentation:v3];
  }
}

- (void)_updatePickerUsingUpdateConfiguration:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (!v5) {
      goto LABEL_6;
    }
  }
  else
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerPrincipalUIViewController.m", 571, @"%s must be called on the main thread", "-[PUPickerPrincipalUIViewController _updatePickerUsingUpdateConfiguration:]");

    if (!v5) {
      goto LABEL_6;
    }
  }
  if ([v5 _isValidConfiguration])
  {
    uint64_t v6 = [(PUPickerPrincipalUIViewController *)self configuration];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__PUPickerPrincipalUIViewController__updatePickerUsingUpdateConfiguration___block_invoke;
    v9[3] = &unk_1E5F223B0;
    __int16 v10 = v5;
    [v6 performChanges:v9];

    id v7 = v10;
    goto LABEL_8;
  }
LABEL_6:
  id v7 = PLPickerGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v5;
    __int16 v13 = 2080;
    int v14 = "-[PUPickerPrincipalUIViewController _updatePickerUsingUpdateConfiguration:]";
    _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Invalid inputs (%@) received: %s", buf, 0x16u);
  }
LABEL_8:
}

void __75__PUPickerPrincipalUIViewController__updatePickerUsingUpdateConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _didSetEdgesWithoutContentMargins]) {
    objc_msgSend(v3, "setEdgesWithoutContentMargins:", objc_msgSend(*(id *)(a1 + 32), "edgesWithoutContentMargins"));
  }
  if ([*(id *)(a1 + 32) _didSetSelectionLimit]) {
    objc_msgSend(v3, "setSelectionLimit:", objc_msgSend(*(id *)(a1 + 32), "selectionLimit"));
  }
}

- (void)_updateConfiguration:(id)a3 completionHandler:(id)a4
{
  id v19 = a3;
  id v7 = (void (**)(id, void))a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    __int16 v18 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerPrincipalUIViewController.m", 555, @"%s must be called on the main thread", "-[PUPickerPrincipalUIViewController _updateConfiguration:completionHandler:]");
  }
  if (v19)
  {
    int v8 = [(PUPickerPrincipalUIViewController *)self configuration];
    [v8 unregisterChangeObserver:self context:PUPickerConfigurationObservationContext];

    uint64_t v9 = [PUPickerConfiguration alloc];
    __int16 v10 = [(PUPickerPrincipalUIViewController *)self extensionContext];
    int v11 = [v10 _auxiliaryConnection];
    id v12 = [(PUPickerConfiguration *)v9 initWithPHPickerConfiguration:v19 connection:v11];
    [(PUPickerPrincipalUIViewController *)self setConfiguration:v12];

    __int16 v13 = [(PUPickerPrincipalUIViewController *)self configuration];
    [v13 registerChangeObserver:self context:PUPickerConfigurationObservationContext];
  }
  BOOL v14 = [(PUPickerPrincipalUIViewController *)self updatePicker];
  if (v7)
  {
    BOOL v15 = v14;
    __int16 v16 = [(PUPickerPrincipalUIViewController *)self configuration];
    if (v16) {
      BOOL v17 = v15;
    }
    else {
      BOOL v17 = 0;
    }
    v7[2](v7, v17);
  }
}

- (void)_pickerUnavailableViewControllerCancelButtonTapped:(id)a3
{
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerPrincipalUIViewController.m", 546, @"%s must be called on the main thread", "-[PUPickerPrincipalUIViewController _pickerUnavailableViewControllerCancelButtonTapped:]");
  }
  id v5 = [(PUPickerPrincipalUIViewController *)self extensionContext];
  uint64_t v6 = [v5 _auxiliaryConnection];
  id v8 = [v6 remoteObjectProxy];

  [v8 _pickerDidFinishPicking:0];
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    __int16 v18 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerPrincipalUIViewController.m", 503, @"%s must be called on the main thread", "-[PUPickerPrincipalUIViewController beginRequestWithExtensionContext:]");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PUPickerPrincipalUIViewController.m", 504, @"Invalid parameter not satisfying: %@", @"[context isKindOfClass:PUPickerExtensionVendorContext.class]" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)PUPickerPrincipalUIViewController;
  id v6 = [(PUPickerPrincipalUIViewController *)&v20 beginRequestWithExtensionContext:v5];
  if (MEMORY[0x1B3E7C970](v6))
  {
    id v7 = [(PUPickerPrincipalUIViewController *)self extensionContext];
    id v8 = [v7 _auxiliaryConnection];
    uint64_t v9 = PLClientApplicationIdentifierFromXPCConnection();

    MEMORY[0x1B3E7C980](v9);
  }
  __int16 v10 = PXSynchronousAddPickerFileProviderDomain();
  id v11 = 0;
  [(PUPickerPrincipalUIViewController *)self setDomain:v10];

  [(PUPickerPrincipalUIViewController *)self setDomainError:v11];
  id v12 = PXPhotosFileProviderManager();
  [(PUPickerPrincipalUIViewController *)self setManager:v12];

  id v13 = objc_alloc_init(MEMORY[0x1E4F91280]);
  [(PUPickerPrincipalUIViewController *)self setLoadingStatusManager:v13];

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(PUPickerPrincipalUIViewController *)self setProgressSubscribers:v14];

  PXAsynchronousAddDragAndDropFileProviderDomain();
  [v5 setDelegate:self];

  BOOL v15 = (void *)MEMORY[0x1E4F39998];
  __int16 v16 = [v5 _auxiliaryConnection];
  BOOL v17 = [v16 remoteObjectInterface];
  [v15 setAllowedClassesForExtensionAuxiliaryHostInterface:v17];
}

- (void)finishPicking:(id)a3 additionalSelectionState:(id)a4
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v90 = a3;
  id v88 = a4;
  val = self;
  id v6 = [(PUPickerPrincipalUIViewController *)self extensionContext];
  id v7 = [v6 _auxiliaryConnection];
  uint64_t v85 = [v7 remoteObjectProxy];

  id v8 = [(PUPickerPrincipalUIViewController *)val coordinator];
  v94 = [v8 configuration];

  v89 = [v88 registerConfiguration];
  uint64_t v9 = [(PUPickerPrincipalUIViewController *)val coordinator];
  [v9 isShowingLiveWallpaperSuggestions];
  PXPickerFileProviderRegisterConfigurationSetIsLiveWallpaperSuggestion();

  id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v11 = PXMap();
  id v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = MEMORY[0x1E4F1CBF0];
  }
  v87 = objc_msgSend(v10, "initWithArray:", v13, v85);

  id v14 = [(PUPickerPrincipalUIViewController *)val programmaticallySelectedItemIdentifiers];
  [v14 intersectSet:v87];

  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  BOOL v15 = [(PUPickerPrincipalUIViewController *)val progressSubscribers];
  __int16 v16 = [v15 allValues];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v126 objects:v133 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v127;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v127 != v18) {
          objc_enumerationMutation(v16);
        }
        [MEMORY[0x1E4F28F90] removeSubscriber:*(void *)(*((void *)&v126 + 1) + 8 * i)];
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v126 objects:v133 count:16];
    }
    while (v17);
  }

  objc_super v20 = [(PUPickerPrincipalUIViewController *)val progressSubscribers];
  [v20 removeAllObjects];

  v21 = [(PUPickerPrincipalUIViewController *)val coordinator];
  [v21 emitDidFinishPickingAnalytics];

  if ([v94 isLimitedLibraryPicker])
  {
    uint64_t v22 = PXMap();
    v23 = [v94 limitedLibraryClientIdentifier];
    long long v124 = 0u;
    long long v125 = 0u;
    uint64_t v24 = [v94 pickerClientIdentification];
    v25 = v24;
    if (v24)
    {
      [v24 clientAuditToken];
    }
    else
    {
      long long v124 = 0u;
      long long v125 = 0u;
    }

    id v26 = PLPickerGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v23;
      _os_log_impl(&dword_1AE9F8000, v26, OS_LOG_TYPE_DEFAULT, "Sending updated limited library for application %@", buf, 0xCu);
    }

    uint64_t v27 = [v94 photoLibrary];
    v28 = [v27 assetsdClient];
    uint64_t v29 = [v28 libraryInternalClient];
    v123[0] = MEMORY[0x1E4F143A8];
    v123[1] = 3221225472;
    v123[2] = __76__PUPickerPrincipalUIViewController_finishPicking_additionalSelectionState___block_invoke_269;
    v123[3] = &unk_1E5F2E3B8;
    v123[4] = v23;
    *(_OWORD *)buf = v124;
    *(_OWORD *)&uint8_t buf[16] = v125;
    [v29 setFetchFilterWithAssets:v22 forApplication:v23 withAuditToken:buf completionHandler:v123];

    v30 = [v90 fetchedObjectIDsSet];
    v31 = (void *)[v30 mutableCopy];

    v32 = [v94 preselectedItemObjectIDs];
    v33 = [v32 set];
    [v31 minusSet:v33];

    id v34 = objc_alloc(MEMORY[0x1E4F39150]);
    v35 = [v31 allObjects];
    uint64_t v36 = [v34 initWithExistingFetchResult:v90 filteredObjectIDs:v35];

    id v90 = (id)v36;
  }
  unint64_t v37 = [v94 confirmationBehavior];
  if (v37 <= 4 && ((1 << v37) & 0x13) != 0)
  {
    v38 = [(PUPickerPrincipalUIViewController *)val coordinator];
    [v38 resignSearchBarAsFirstResponder];
  }
  if ([v90 count])
  {
    int v97 = [v94 allowsAssetData];
    char v95 = [v94 allowsIdentifiers];
    v92 = [(PUPickerPrincipalUIViewController *)val programmaticallySelectedItemIdentifiers];
    v39 = [(PUPickerPrincipalUIViewController *)val manager];
    v40 = [(PUPickerPrincipalUIViewController *)val domain];
    v91 = PXPickerFileProviderRegister();

    id v98 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    obuint64_t j = v90;
    uint64_t v99 = [obj countByEnumeratingWithState:&v119 objects:v131 count:16];
    if (v99)
    {
      uint64_t v96 = *(void *)v120;
      do
      {
        uint64_t v41 = 0;
        do
        {
          if (*(void *)v120 != v96)
          {
            uint64_t v42 = v41;
            objc_enumerationMutation(obj);
            uint64_t v41 = v42;
          }
          uint64_t v101 = v41;
          id v43 = *(id *)(*((void *)&v119 + 1) + 8 * v41);
          context = (void *)MEMORY[0x1B3E7C430]();
          id v102 = v43;
          if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
            id v104 = v102;
          }
          else {
            id v104 = 0;
          }

          id v103 = objc_alloc_init(MEMORY[0x1E4F399B8]);
          if (v104) {
            int v44 = v97;
          }
          else {
            int v44 = 0;
          }
          if (v44 == 1)
          {
            id v45 = [v104 localIdentifier];
            char v46 = [v92 containsObject:v45];

            if ((v46 & 1) == 0)
            {
              long long v124 = 0u;
              long long v125 = 0u;
              v47 = [v94 pickerClientIdentification];
              v48 = v47;
              if (v47)
              {
                [v47 clientAuditToken];
              }
              else
              {
                long long v124 = 0u;
                long long v125 = 0u;
              }

              id v49 = [v104 originalFilename];
              v50 = [v49 stringByDeletingPathExtension];
              [v103 setSuggestedName:v50];

              id v51 = [v94 phPickerConfiguration];
              objc_msgSend(v103, "setAllowsItemProviderOpenInPlace:", objc_msgSend(v51, "_usesOpenPanelLayout"));

              objc_msgSend(v103, "setPixelWidth:", objc_msgSend(v104, "pixelWidth"));
              objc_msgSend(v103, "setPixelHeight:", objc_msgSend(v104, "pixelHeight"));
              [v104 preferredCropRect];
              objc_msgSend(v103, "setPreferredCropRect:");
              [v104 acceptableCropRect];
              objc_msgSend(v103, "setAcceptableCropRect:");
              [v104 faceAreaRect];
              objc_msgSend(v103, "setNormalizedFaceAreaRect:");
              objc_initWeak(&location, val);
              id v52 = PXPhotosFileProviderRegisteredFileRepresentations();
              v110 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v52, "count"));
              v105 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v52, "count"));
              v106 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v52, "count"));
              long long v116 = 0u;
              long long v117 = 0u;
              long long v114 = 0u;
              long long v115 = 0u;
              id v107 = v52;
              uint64_t v53 = [v107 countByEnumeratingWithState:&v114 objects:v130 count:16];
              if (v53)
              {
                uint64_t v109 = *(void *)v115;
                do
                {
                  for (uint64_t j = 0; j != v53; ++j)
                  {
                    if (*(void *)v115 != v109) {
                      objc_enumerationMutation(v107);
                    }
                    uint64_t v55 = *(void *)(*((void *)&v114 + 1) + 8 * j);
                    v56 = PXPhotosFileProviderRegisterFileRepresentationTypeIdentifier();
                    if (([v110 containsObject:v56] & 1) == 0)
                    {
                      v57 = MEMORY[0x1B3E7B360](v55);
                      uint64_t v58 = [v57 path];
                      *(_OWORD *)buf = v124;
                      *(_OWORD *)&uint8_t buf[16] = v125;
                      v59 = PLGetSandboxExtensionTokenForProcess();

                      v60 = [MEMORY[0x1E4F28CB8] defaultManager];
                      v61 = [v57 path];
                      LOBYTE(v58) = [v60 fileExistsAtPath:v61];

                      if ((v58 & 1) == 0)
                      {
                        v62 = [MEMORY[0x1E4F28CB8] defaultManager];
                        v63 = [v57 URLByDeletingLastPathComponent];
                        id v113 = 0;
                        char v64 = [v62 createDirectoryAtURL:v63 withIntermediateDirectories:1 attributes:0 error:&v113];
                        id v65 = v113;

                        if ((v64 & 1) == 0)
                        {
                          v66 = PLPickerGetLog();
                          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                          {
                            v67 = [v57 description];
                            v68 = [v65 localizedDescription];
                            *(_DWORD *)buf = 138412546;
                            *(void *)&uint8_t buf[4] = v67;
                            *(_WORD *)&buf[12] = 2112;
                            *(void *)&buf[14] = v68;
                            _os_log_impl(&dword_1AE9F8000, v66, OS_LOG_TYPE_ERROR, "Failed to create directory at path:%@ Error:%@", buf, 0x16u);
                          }
                        }
                        v69 = [MEMORY[0x1E4F28CB8] defaultManager];
                        v70 = [v57 path];
                        [v69 createFileAtPath:v70 contents:0 attributes:0];
                      }
                      v71 = [(PUPickerPrincipalUIViewController *)val progressSubscribers];
                      v72 = [v71 objectForKeyedSubscript:v57];
                      if (v72)
                      {
                      }
                      else
                      {
                        char v73 = MEMORY[0x1B3E7B370](v55);

                        if ((v73 & 1) == 0)
                        {
                          v74 = (void *)MEMORY[0x1E4F28F90];
                          v111[0] = MEMORY[0x1E4F143A8];
                          v111[1] = 3221225472;
                          v111[2] = __76__PUPickerPrincipalUIViewController_finishPicking_additionalSelectionState___block_invoke_277;
                          v111[3] = &unk_1E5F22388;
                          objc_copyWeak(&v112, &location);
                          v111[4] = v104;
                          v111[5] = v57;
                          v75 = [v74 addSubscriberForFileURL:v57 withPublishingHandler:v111];
                          v76 = [(PUPickerPrincipalUIViewController *)val progressSubscribers];
                          [v76 setObject:v75 forKeyedSubscript:v57];

                          objc_destroyWeak(&v112);
                        }
                      }
                      [v110 addObject:v56];
                      [v106 setObject:v59 forKeyedSubscript:v56];
                      [v105 setObject:v57 forKeyedSubscript:v56];
                    }
                  }
                  uint64_t v53 = [v107 countByEnumeratingWithState:&v114 objects:v130 count:16];
                }
                while (v53);
              }

              v77 = (void *)[v110 copy];
              [v103 setTypeIdentifiers:v77];

              v78 = (void *)[v105 copy];
              [v103 setFilePromiseURLs:v78];

              v79 = (void *)[v106 copy];
              [v103 setSandboxExtensionTokens:v79];

              objc_destroyWeak(&location);
            }
          }
          id v80 = objc_alloc(MEMORY[0x1E4F39940]);
          id v81 = objc_alloc_init(MEMORY[0x1E4F28D78]);
          if (v95)
          {
            v82 = [v102 localIdentifier];
            v83 = (void *)[v80 _initWithItemProvider:v81 itemIdentifier:v82 isAssetResult:v104 != 0 metadata:v103];
          }
          else
          {
            v83 = (void *)[v80 _initWithItemProvider:v81 itemIdentifier:0 isAssetResult:v104 != 0 metadata:v103];
          }

          [v98 addObject:v83];
          uint64_t v41 = v101 + 1;
        }
        while (v101 + 1 != v99);
        uint64_t v99 = [obj countByEnumeratingWithState:&v119 objects:v131 count:16];
      }
      while (v99);
    }

    [(PUPickerPrincipalUIViewController *)val logExitIfNeeded:obj];
    v84 = (void *)[v98 copy];
    [v86 _pickerDidFinishPicking:v84];
  }
  else
  {
    [v86 _pickerDidFinishPicking:0];
  }
}

void __76__PUPickerPrincipalUIViewController_finishPicking_additionalSelectionState___block_invoke_269(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = PLPickerGetLog();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v14 = 138412290;
      uint64_t v15 = v8;
      uint64_t v9 = "Finished updating limited library for application %@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1AE9F8000, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138412546;
    uint64_t v15 = v13;
    __int16 v16 = 2112;
    id v17 = v5;
    uint64_t v9 = "Failed to update limited library for application %@ with error %@";
    id v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_6;
  }
}

id __76__PUPickerPrincipalUIViewController_finishPicking_additionalSelectionState___block_invoke_277(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = [WeakRetained showProgress:v4 forAsset:*(void *)(a1 + 32) progressURL:*(void *)(a1 + 40)];

  return v6;
}

uint64_t __76__PUPickerPrincipalUIViewController_finishPicking_additionalSelectionState___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

uint64_t __76__PUPickerPrincipalUIViewController_finishPicking_additionalSelectionState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

- (void)finishProgress:(id)a3 progressURL:(id)a4 trackingID:(id)a5 observation:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  int v14 = [v13 isCancelled];
  uint64_t v15 = [(PUPickerPrincipalUIViewController *)self loadingStatusManager];
  __int16 v16 = v15;
  if (v14) {
    [v15 didCancelLoadOperationWithTrackingID:v11];
  }
  else {
    [v15 didCompleteLoadOperationWithTrackingID:v11 withSuccess:1 error:0];
  }

  [v13 removeObservation:v10];
  id v17 = (void *)MEMORY[0x1E4F28F90];
  uint64_t v18 = [(PUPickerPrincipalUIViewController *)self progressSubscribers];
  id v19 = [v18 objectForKeyedSubscript:v12];
  [v17 removeSubscriber:v19];

  id v20 = [(PUPickerPrincipalUIViewController *)self progressSubscribers];
  [v20 setObject:0 forKeyedSubscript:v12];
}

- (id)showProgress:(id)a3 forAsset:(id)a4 progressURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PUPickerPrincipalUIViewController *)self loadingStatusManager];
  id v12 = [v9 uuid];
  id v13 = [v11 willBeginLoadOperationWithItemIdentifier:v12];

  objc_initWeak(&location, self);
  int v14 = [MEMORY[0x1E4F28EE8] keyPathWithRootObject:v8 path:"fractionCompleted"];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __71__PUPickerPrincipalUIViewController_showProgress_forAsset_progressURL___block_invoke;
  v30[3] = &unk_1E5F22338;
  objc_copyWeak(&v32, &location);
  id v15 = v13;
  id v31 = v15;
  __int16 v16 = [v14 addObserverBlock:v30];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __71__PUPickerPrincipalUIViewController_showProgress_forAsset_progressURL___block_invoke_3;
  v24[3] = &unk_1E5F22360;
  objc_copyWeak(&v29, &location);
  id v25 = v8;
  id v26 = v10;
  id v27 = v15;
  id v28 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v10;
  id v20 = v8;
  v21 = _Block_copy(v24);
  uint64_t v22 = _Block_copy(v21);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v22;
}

void __71__PUPickerPrincipalUIViewController_showProgress_forAsset_progressURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  id v5 = v3;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v6);
}

void __71__PUPickerPrincipalUIViewController_showProgress_forAsset_progressURL___block_invoke_3(id *a1)
{
  objc_copyWeak(&v6, a1 + 8);
  id v2 = a1[4];
  id v3 = a1[5];
  id v4 = a1[6];
  id v5 = a1[7];
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v6);
}

void __71__PUPickerPrincipalUIViewController_showProgress_forAsset_progressURL___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  [WeakRetained finishProgress:*(void *)(a1 + 32) progressURL:*(void *)(a1 + 40) trackingID:*(void *)(a1 + 48) observation:*(void *)(a1 + 56)];
}

void __71__PUPickerPrincipalUIViewController_showProgress_forAsset_progressURL___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained loadingStatusManager];
  uint64_t v3 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) doubleValue];
  objc_msgSend(v2, "didUpdateLoadOperationWithTrackingID:withProgress:", v3);
}

- (void)confirmUserSafetyIntervention:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t))a4;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_20:
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PUPickerPrincipalUIViewController.m", 297, @"Invalid parameter not satisfying: %@", @"fetchResult != nil" object file lineNumber description];

    if (v8) {
      goto LABEL_4;
    }
    goto LABEL_21;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerPrincipalUIViewController.m", 296, @"%s must be called on the main thread", "-[PUPickerPrincipalUIViewController confirmUserSafetyIntervention:completionHandler:]");

  if (!v7) {
    goto LABEL_20;
  }
LABEL_3:
  if (v8) {
    goto LABEL_4;
  }
LABEL_21:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"PUPickerPrincipalUIViewController.m", 298, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];

LABEL_4:
  id v9 = [(PUPickerPrincipalUIViewController *)self configuration];
  uint64_t v10 = [v9 confirmationBehavior];

  BOOL v12 = v10 == 2 || v10 == 4;
  id v13 = [v7 fetchType];
  int v14 = v13;
  if (v13 != (void *)*MEMORY[0x1E4F39648])
  {

LABEL_17:
    v8[2](v8, 1);
    goto LABEL_18;
  }
  id v15 = [(PUPickerPrincipalUIViewController *)self configuration];
  int v16 = [v15 shouldShowCommunicationSafetyIntervention];

  if (!v16) {
    goto LABEL_17;
  }
  id v17 = [(PUPickerPrincipalUIViewController *)self coordinator];
  id v18 = v17;
  if (v12) {
    id v19 = v7;
  }
  else {
    id v19 = 0;
  }
  [v17 startActivityIndicatorsForAssetsWithFetchResult:v19];

  id v20 = (void *)MEMORY[0x1E4F906A8];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __85__PUPickerPrincipalUIViewController_confirmUserSafetyIntervention_completionHandler___block_invoke;
  v24[3] = &unk_1E5F2AFC8;
  void v24[4] = self;
  id v25 = v7;
  id v26 = v8;
  [v20 userSafetyInterventionCheckRequiredBeforeSharingAssets:v25 completion:v24];

LABEL_18:
}

void __85__PUPickerPrincipalUIViewController_confirmUserSafetyIntervention_completionHandler___block_invoke(id *a1, int a2)
{
  id v4 = [a1[4] coordinator];
  id v5 = [a1[5] fetchedObjects];
  id v6 = PXMap();
  [v4 stopActivityIndicatorsForAssetsWithIdentifiers:v6];

  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __85__PUPickerPrincipalUIViewController_confirmUserSafetyIntervention_completionHandler___block_invoke_3;
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

uint64_t __85__PUPickerPrincipalUIViewController_confirmUserSafetyIntervention_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__PUPickerPrincipalUIViewController_confirmUserSafetyIntervention_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

- (void)confirmConfidentialWarning:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, uint64_t))a4;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (v7) {
      goto LABEL_3;
    }
LABEL_14:
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUPickerPrincipalUIViewController.m", 277, @"Invalid parameter not satisfying: %@", @"fetchResult != nil" object file lineNumber description];

    if (v8) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUPickerPrincipalUIViewController.m", 276, @"%s must be called on the main thread", "-[PUPickerPrincipalUIViewController confirmConfidentialWarning:completionHandler:]");

  if (!v7) {
    goto LABEL_14;
  }
LABEL_3:
  if (v8) {
    goto LABEL_4;
  }
LABEL_15:
  id v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PUPickerPrincipalUIViewController.m", 278, @"Invalid parameter not satisfying: %@", @"completionHandler != nil" object file lineNumber description];

LABEL_4:
  id v9 = [v7 fetchType];
  if (v9 != (void *)*MEMORY[0x1E4F39648])
  {
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v10 = [(PUPickerPrincipalUIViewController *)self configuration];
  if (![v10 allowsConfidentialWarning]
    || ([MEMORY[0x1E4F90698] confidentialityCheckRequired] & 1) == 0)
  {

    goto LABEL_10;
  }
  id v11 = (void *)MEMORY[0x1E4F90698];
  BOOL v12 = [v7 fetchedObjects];
  LODWORD(v11) = [v11 confidentialWarningRequiredForAssets:v12];

  if (!v11)
  {
LABEL_11:
    v8[2](v8, 1);
    goto LABEL_12;
  }
  id v13 = (void *)MEMORY[0x1E4F90698];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __82__PUPickerPrincipalUIViewController_confirmConfidentialWarning_completionHandler___block_invoke;
  v20[3] = &unk_1E5F2E898;
  v21 = v8;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__PUPickerPrincipalUIViewController_confirmConfidentialWarning_completionHandler___block_invoke_2;
  v18[3] = &unk_1E5F2E898;
  id v19 = v21;
  int v14 = [v13 confidentialityAlertWithConfirmAction:v20 abortAction:v18];
  [(PUPickerPrincipalUIViewController *)self px_presentOverTopmostPresentedViewController:v14 animated:1 completion:0];

LABEL_12:
}

uint64_t __82__PUPickerPrincipalUIViewController_confirmConfidentialWarning_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__PUPickerPrincipalUIViewController_confirmConfidentialWarning_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)logExitIfNeeded:(id)a3
{
  id v16 = a3;
  if (!v16)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUPickerPrincipalUIViewController.m", 249, @"Invalid parameter not satisfying: %@", @"fetchResult != nil" object file lineNumber description];
  }
  if (MEMORY[0x1B3E7C970]() && [v16 count])
  {
    id v5 = [v16 fetchedObjects];
    id v6 = PXMap();

    id v7 = (void *)MEMORY[0x1E4F38EB8];
    id v8 = [(PUPickerPrincipalUIViewController *)self coordinator];
    id v9 = [v8 configuration];
    uint64_t v10 = [v9 photoLibrary];
    uint64_t v11 = [v7 countOfAssetsWithLocationFromUUIDs:v6 photoLibrary:v10];

    if (v11 >= 1)
    {
      BOOL v12 = [(PUPickerPrincipalUIViewController *)self extensionContext];
      id v13 = [v12 _auxiliaryConnection];
      int v14 = PLClientApplicationIdentifierFromXPCConnection();

      plslogGreenTea();
    }
  }
}

id __53__PUPickerPrincipalUIViewController_logExitIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F391D0];
  uint64_t v3 = [a2 localIdentifier];
  id v4 = [v2 uuidFromLocalIdentifier:v3];

  return v4;
}

- (void)updateModalInPresentation
{
  uint64_t v3 = [(PUPickerPrincipalUIViewController *)self configuration];
  id v4 = [v3 phPickerConfiguration];
  char v5 = [v4 _disabledPrivateCapabilities];

  if ((v5 & 0x40) == 0)
  {
    id v6 = [(PUPickerPrincipalUIViewController *)self traitCollection];
    uint64_t v7 = [v6 _presentationSemanticContext];

    int v8 = [(PUPickerPrincipalUIViewController *)self isModalInPresentation];
    if (v7 == 3)
    {
      if ((v8 & 1) == 0) {
        return;
      }
      uint64_t v9 = 0;
    }
    else if (v8)
    {
      if ([(PUPickerPrincipalUIViewController *)self isModalInPresentation]) {
        return;
      }
      uint64_t v9 = 1;
    }
    else
    {
      uint64_t v10 = [(PUPickerPrincipalUIViewController *)self coordinator];
      uint64_t v9 = [v10 selectionDidChange];

      if (v9 == [(PUPickerPrincipalUIViewController *)self isModalInPresentation])return; {
    }
      }
    [(PUPickerPrincipalUIViewController *)self setModalInPresentation:v9];
    uint64_t v11 = [(PUPickerPrincipalUIViewController *)self extensionContext];
    BOOL v12 = [v11 _auxiliaryConnection];
    id v13 = [v12 remoteObjectProxy];

    [v13 _pickerDidSetModalInPresentation:v9];
  }
}

- (BOOL)updatePicker
{
  uint64_t v3 = [(PUPickerPrincipalUIViewController *)self manager];
  uint64_t v4 = [(PUPickerPrincipalUIViewController *)self domain];
  char v5 = [(PUPickerPrincipalUIViewController *)self configuration];
  id v6 = v5;
  v56 = (void *)v4;
  v57 = (void *)v3;
  uint64_t v55 = v5;
  if (v3 && v4 && v5)
  {
    uint64_t v7 = [v5 photoLibrary];
    id v61 = 0;
    int v8 = [v7 openAndWaitWithUpgrade:0 error:&v61];
    id v9 = v61;

    if (v8)
    {
      uint64_t v10 = [PUPickerCoordinator alloc];
      uint64_t v11 = [(PUPickerPrincipalUIViewController *)self loadingStatusManager];
      BOOL v12 = [(PUPickerCoordinator *)v10 initWithPUConfiguration:v6 coordinatorActionHandler:self loadingStatusManager:v11];

      id v13 = [(PUPickerCoordinator *)v12 viewController];
    }
    else
    {
      if ([v9 code] == 3108 || objc_msgSend(v9, "code") == 5403) {
        uint64_t v17 = 3;
      }
      else {
        uint64_t v17 = 4;
      }
      v23 = [v6 phPickerConfiguration];
      id v13 = [MEMORY[0x1E4F399A8] unavailableViewController:v17 configuration:v23 error:v9 delegate:self];

      BOOL v12 = 0;
    }
  }
  else
  {
    int v14 = [v5 phPickerConfiguration];
    id v15 = v14;
    if (v14) {
      id v16 = v14;
    }
    else {
      id v16 = objc_alloc_init(MEMORY[0x1E4F39930]);
    }
    id v18 = v16;

    id v19 = [(PUPickerPrincipalUIViewController *)self domainError];
    id v20 = v19;
    if (v19)
    {
      id v21 = v19;
    }
    else
    {
      id v21 = [(PUPickerPrincipalUIViewController *)self configurationError];
    }
    uint64_t v22 = v21;

    id v13 = [MEMORY[0x1E4F399A8] unavailableViewController:0 configuration:v18 error:v22 delegate:self];

    BOOL v12 = 0;
  }
  [(PUPickerPrincipalUIViewController *)self setCoordinator:v12];
  [v13 preferredContentSize];
  -[PUPickerPrincipalUIViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  [(PUPickerPrincipalUIViewController *)self px_addOrReplaceChildViewController:v13 activateConstraints:0];
  uint64_t v24 = [(PUPickerPrincipalUIViewController *)self view];
  v54 = v13;
  id v25 = [v13 view];
  id v26 = [v24 topAnchor];
  id v27 = [v25 topAnchor];
  id v28 = [v26 constraintEqualToAnchor:v27];
  [(PUPickerPrincipalUIViewController *)self setTopConstraint:v28];

  id v29 = [v24 bottomAnchor];
  v30 = [v25 bottomAnchor];
  id v31 = [v29 constraintEqualToAnchor:v30];
  [(PUPickerPrincipalUIViewController *)self setBottomConstraint:v31];

  id v32 = [v24 leadingAnchor];
  v33 = [v25 leadingAnchor];
  id v34 = [v32 constraintEqualToAnchor:v33];
  [(PUPickerPrincipalUIViewController *)self setLeadingConstraint:v34];

  v35 = [v24 trailingAnchor];
  uint64_t v36 = [v25 trailingAnchor];
  unint64_t v37 = [v35 constraintEqualToAnchor:v36];
  [(PUPickerPrincipalUIViewController *)self setTrailingConstraint:v37];

  v38 = [v24 safeAreaLayoutGuide];
  v39 = [v38 leadingAnchor];
  v40 = [v25 leadingAnchor];
  uint64_t v41 = [v39 constraintEqualToAnchor:v40];
  [(PUPickerPrincipalUIViewController *)self setLeadingSafeAreaConstraint:v41];

  uint64_t v42 = [v24 safeAreaLayoutGuide];
  id v43 = [v42 trailingAnchor];
  int v44 = [v25 trailingAnchor];
  id v45 = [v43 constraintEqualToAnchor:v44];
  [(PUPickerPrincipalUIViewController *)self setTrailingSafeAreaConstraint:v45];

  [v24 setNeedsUpdateConstraints];
  char v46 = [v24 window];
  [v46 setCanResizeToFitContent:1];

  [v24 layoutIfNeeded];
  [(PUPickerPrincipalUIViewController *)self updateModalInPresentation];
  objc_initWeak(&location, self);
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __49__PUPickerPrincipalUIViewController_updatePicker__block_invoke;
  v58[3] = &unk_1E5F2E530;
  objc_copyWeak(&v59, &location);
  [(PUPickerCoordinator *)v12 setSelectionDidChangeObserver:v58];
  id v47 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v48 = [(PUPickerPrincipalUIViewController *)self configuration];
  id v49 = [v48 preselectedItemIdentifiers];
  v50 = [v49 set];
  id v51 = v50;
  if (!v50)
  {
    id v51 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v52 = (void *)[v47 initWithSet:v51];
  [(PUPickerPrincipalUIViewController *)self setProgrammaticallySelectedItemIdentifiers:v52];

  if (!v50) {
  objc_destroyWeak(&v59);
  }
  objc_destroyWeak(&location);

  return v12 != 0;
}

void __49__PUPickerPrincipalUIViewController_updatePicker__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateModalInPresentation];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUPickerPrincipalUIViewController;
  id v4 = a3;
  [(PUPickerPrincipalUIViewController *)&v9 preferredContentSizeDidChangeForChildContentContainer:v4];
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  double v6 = v5;
  double v8 = v7;

  -[PUPickerPrincipalUIViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUPickerPrincipalUIViewController;
  id v4 = a3;
  [(PUPickerPrincipalUIViewController *)&v9 traitCollectionDidChange:v4];
  double v5 = [(PUPickerPrincipalUIViewController *)self traitCollection];
  uint64_t v6 = [v5 _presentationSemanticContext];
  uint64_t v7 = [v4 _presentationSemanticContext];

  if (v6 != v7)
  {
    double v8 = [(PUPickerPrincipalUIViewController *)self view];
    [v8 setNeedsUpdateConstraints];

    [(PUPickerPrincipalUIViewController *)self updateModalInPresentation];
  }
}

- (void)updateViewConstraints
{
  uint64_t v3 = [(PUPickerPrincipalUIViewController *)self traitCollection];
  uint64_t v4 = [v3 _presentationSemanticContext];
  BOOL v5 = v4 == 3;
  BOOL v6 = v4 != 3;

  uint64_t v7 = [(PUPickerPrincipalUIViewController *)self topConstraint];
  [v7 setActive:1];

  double v8 = [(PUPickerPrincipalUIViewController *)self bottomConstraint];
  [v8 setActive:1];

  objc_super v9 = [(PUPickerPrincipalUIViewController *)self leadingConstraint];
  [v9 setActive:v6];

  uint64_t v10 = [(PUPickerPrincipalUIViewController *)self trailingConstraint];
  [v10 setActive:v6];

  uint64_t v11 = [(PUPickerPrincipalUIViewController *)self leadingSafeAreaConstraint];
  [v11 setActive:v5];

  BOOL v12 = [(PUPickerPrincipalUIViewController *)self trailingSafeAreaConstraint];
  [v12 setActive:v5];

  v13.receiver = self;
  v13.super_class = (Class)PUPickerPrincipalUIViewController;
  [(PUPickerPrincipalUIViewController *)&v13 updateViewConstraints];
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

+ (BOOL)shouldDebounceDidFinishPicking:(id)a3 previousSelectedObjectIDs:(id)a4 previousSelectionDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7 == v8) {
    int v10 = 1;
  }
  else {
    int v10 = [v7 isEqual:v8];
  }
  BOOL v11 = 0;
  if (v9 && v10)
  {
    [v9 timeIntervalSinceNow];
    BOOL v11 = fabs(v12) < 0.3;
  }

  return v11;
}

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_1398);
  }
}

void __47__PUPickerPrincipalUIViewController_initialize__block_invoke()
{
  [MEMORY[0x1E4F90668] setSuiteName:@"com.apple.mobileslideshow"];
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 removeObjectForKey:@"UIBarsApplyChromelessEverywhere"];
}

@end