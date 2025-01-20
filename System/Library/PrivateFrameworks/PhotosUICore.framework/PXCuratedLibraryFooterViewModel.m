@interface PXCuratedLibraryFooterViewModel
+ (BOOL)hasAnalysisProgressForMode:(int64_t)a3 analysisStatus:(id)a4 cplUIStatus:(id)a5 userDefaults:(id)a6 outAnimatedIconMode:(int64_t *)a7 outProgress:(float *)a8 outTitle:(id *)a9 outDescription:(id *)a10;
+ (id)_titleWithOptionalDescription:(id *)a3 progress:(float *)a4 forMode:(int64_t)a5 itemCountsController:(id)a6 analysisStatus:(id)a7 cplUIStatus:(id)a8 inRebuild:(BOOL)a9 reason:(id)a10;
- (BOOL)isFooterShown;
- (BOOL)shouldAlternateTitleWithAnimatedGridCycle;
- (PHPhotoLibrary)photoLibrary;
- (PXAssetsDataSourceCountsController)itemCountsController;
- (PXCuratedLibraryAnalysisStatus)analysisStatus;
- (PXCuratedLibraryFooterViewModel)init;
- (PXCuratedLibraryFooterViewModel)initWithItemCountsController:(id)a3 cplUIStatusProvider:(id)a4 analysisStatus:(id)a5 mode:(int64_t)a6 viewModel:(id)a7;
- (PXCuratedLibraryFooterViewModelPresentationDelegate)presentingDelegate;
- (PXFooterSettings)settings;
- (PXLemonadeFeatureAvailabilityMonitor)featureAvailabilityMonitor;
- (PXLibraryFilterState)libraryFilterState;
- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider;
- (id)presentingViewControllerForCloudQuotaControllerHelper:(id)a3;
- (int64_t)mode;
- (void)_updateExposedPropertiesForReason:(id)a3;
- (void)_updateHasImportantInformation;
- (void)cloudQuotaControllerHelper:(id)a3 informationViewDidChange:(id)a4;
- (void)didHideFooter;
- (void)didShowFooter;
- (void)footerAnimationCrossedGridCycleBoundary;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setIsFooterShown:(BOOL)a3;
- (void)setMode:(int64_t)a3;
- (void)setPresentingDelegate:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
@end

@implementation PXCuratedLibraryFooterViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureAvailabilityMonitor, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_itemCountsController, 0);
  objc_storeStrong((id *)&self->_analysisStatus, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_storeStrong((id *)&self->_filterFooterController, 0);
  objc_storeStrong((id *)&self->_curatedLibraryViewModel, 0);
  objc_storeStrong((id *)&self->_cloudQuotaHelper, 0);
  objc_storeStrong((id *)&self->_cplUIStatusProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrarySource, 0);
}

- (PXLemonadeFeatureAvailabilityMonitor)featureAvailabilityMonitor
{
  return self->_featureAvailabilityMonitor;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (BOOL)isFooterShown
{
  return self->_isFooterShown;
}

- (PXFooterSettings)settings
{
  return self->_settings;
}

- (PXAssetsDataSourceCountsController)itemCountsController
{
  return self->_itemCountsController;
}

- (PXCuratedLibraryAnalysisStatus)analysisStatus
{
  return self->_analysisStatus;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setPresentingDelegate:(id)a3
{
}

- (PXCuratedLibraryFooterViewModelPresentationDelegate)presentingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingDelegate);
  return (PXCuratedLibraryFooterViewModelPresentationDelegate *)WeakRetained;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5 = a4;
  if (([v5 isEqualToString:@"simulateAnimatedIconMode"] & 1) != 0
    || [v5 isEqualToString:@"simulatedAnimatedIconMode"])
  {
    [(PXCuratedLibraryFooterViewModel *)self _updateExposedPropertiesForReason:@"SimulateAnimatedIconMode"];
  }
  if ([v5 isEqualToString:@"simulateImportantInformation"]) {
    [(PXCuratedLibraryFooterViewModel *)self _updateHasImportantInformation];
  }
}

- (id)presentingViewControllerForCloudQuotaControllerHelper:(id)a3
{
  v4 = [(PXCuratedLibraryFooterViewModel *)self presentingDelegate];
  id v5 = [v4 presentingViewControllerForFooterViewModel:self];

  return v5;
}

- (void)cloudQuotaControllerHelper:(id)a3 informationViewDidChange:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __87__PXCuratedLibraryFooterViewModel_cloudQuotaControllerHelper_informationViewDidChange___block_invoke;
  v4[3] = &unk_1E5DB8CD8;
  v4[4] = self;
  -[PXFooterViewModel performChanges:](self, "performChanges:", v4, a4);
}

uint64_t __87__PXCuratedLibraryFooterViewModel_cloudQuotaControllerHelper_informationViewDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateExposedPropertiesForReason:@"PXCloudQuotaControllerHelper"];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateHasImportantInformation];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v9 = a3;
  if ((void *)CuratedLibraryItemCountsControllerObserverContext == a5)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_17;
    }
    v10 = @"PXAssetsDataSourceCountsController";
    goto LABEL_13;
  }
  if ((void *)CuratedLibraryAnalysisStatusObserverContext == a5)
  {
    v10 = @"PXCuratedLibraryAnalysisStatus";
    goto LABEL_13;
  }
  if ((void *)PXCPLUIStatusProviderObserverContext == a5)
  {
    id v15 = v9;
    [(PXCuratedLibraryFooterViewModel *)self _updateExposedPropertiesForReason:@"PXCPLUIStatusProvider"];
    [(PXCuratedLibraryFooterViewModel *)self _updateHasImportantInformation];
    goto LABEL_16;
  }
  if ((void *)PXCuratedLibraryViewModelObserverContext_93452 == a5)
  {
    if ((v6 & 0x2000000) != 0)
    {
      id v15 = v9;
      v11 = [(PXCuratedLibraryViewModel *)self->_curatedLibraryViewModel currentContentFilterState];
      [(PXFilterFooterController *)self->_filterFooterController setContentFilterState:v11];

      v10 = @"PXCuratedLibraryViewModel";
      goto LABEL_14;
    }
  }
  else if ((void *)PXSharedLibraryStatusProviderObservationContext_93454 == a5)
  {
    if ((v6 & 3) != 0)
    {
      id v15 = v9;
      v12 = [(PXCuratedLibraryFooterViewModel *)self sharedLibraryStatusProvider];
      [(PXFilterFooterController *)self->_filterFooterController setSharedLibraryStatusProvider:v12];

      v10 = @"PXSharedLibraryStatusProvider";
      goto LABEL_14;
    }
  }
  else if ((void *)PXLibraryFilterStateObservationContext_93456 == a5)
  {
    if (v6)
    {
      id v15 = v9;
      v13 = [(PXCuratedLibraryFooterViewModel *)self libraryFilterState];
      [(PXFilterFooterController *)self->_filterFooterController setLibraryFilterState:v13];

      v10 = @"PXLibraryFilterState";
      goto LABEL_14;
    }
  }
  else
  {
    if ((void *)PXCPLPhotoLibrarySourceObservationContext_93458 != a5)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"PXCuratedLibraryFooterViewModel.m" lineNumber:611 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((v6 & 8) != 0)
    {
      v10 = @"PXCPLPhotoLibrarySource";
LABEL_13:
      id v15 = v9;
LABEL_14:
      [(PXCuratedLibraryFooterViewModel *)self _updateExposedPropertiesForReason:v10];
LABEL_16:
      id v9 = v15;
    }
  }
LABEL_17:
}

- (void)_updateExposedPropertiesForReason:(id)a3
{
  v3 = self;
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  float v102 = -1.0;
  cplUIStatusProvider = self->_cplUIStatusProvider;
  id v5 = a3;
  int v6 = [(PXCPLUIStatusProvider *)cplUIStatusProvider status];
  if (PXCloudQuotaCanShowInformationView(v6))
  {
    v75 = [(PXCloudQuotaControllerHelper *)v3->_cloudQuotaHelper informationView];
    v72 = [(PXCloudQuotaControllerHelper *)v3->_cloudQuotaHelper premiumInformationView];
  }
  else
  {
    v72 = 0;
    v75 = 0;
  }
  uint64_t v7 = [(PXCuratedLibraryFooterViewModel *)v3 mode];
  uint64_t v8 = [(PXCuratedLibraryFooterViewModel *)v3 itemCountsController];
  id v9 = [(PXCuratedLibraryFooterViewModel *)v3 analysisStatus];
  int v101 = 0;
  v10 = [(PXCuratedLibraryFooterViewModel *)v3 photoLibrary];
  int v11 = [v10 hasSyncProgressReturningImportOperations:&v101];

  p_isa = (id *)&v3->super.super.super.isa;
  if (v11)
  {
    v12 = PLProgressDescription();
    v13 = PLAlbumImportOperationDebugDescription();
    v14 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v104 = (PXCuratedLibraryFooterViewModel *)p_isa;
      __int16 v105 = 2114;
      v106 = v12;
      __int16 v107 = 2114;
      v108 = v13;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Providing status for import operation: \"%{public}@\" (%{public}@)", buf, 0x20u);
    }

    v3 = (PXCuratedLibraryFooterViewModel *)p_isa;
  }
  else
  {
    v12 = 0;
  }
  id v100 = 0;
  LOBYTE(v57) = (v101 & 0x10) != 0;
  uint64_t v15 = [(id)objc_opt_class() _titleWithOptionalDescription:&v100 progress:&v102 forMode:v7 itemCountsController:v8 analysisStatus:v9 cplUIStatus:v6 inRebuild:v57 reason:v5];

  id v16 = v100;
  v69 = v16;
  if (v16)
  {
    id v17 = v16;

    v12 = v17;
  }
  v18 = +[PXFooterSettings sharedInstance];
  int v19 = [v18 showFilterView];

  if (v19)
  {
    uint64_t v20 = [(PXFilterFooterController *)v3->_filterFooterController view];
    v21 = [(PXFilterFooterController *)v3->_filterFooterController contentFilterState];
    v68 = (void *)v20;
    if (v20)
    {
      v22 = PLUserStatusUIGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v104 = v3;
        __int16 v105 = 2114;
        v106 = v21;
        _os_log_impl(&dword_1A9AE7000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Show filter view in footer: %{public}@", buf, 0x16u);
      }
    }
    if (v11) {
      LOBYTE(v11) = 1;
    }
    else {
      LOBYTE(v11) = [v21 isFiltering];
    }
    v23 = (void *)v15;
  }
  else
  {
    v68 = 0;
    v23 = (void *)v15;
  }
  v74 = v6;
  v70 = v9;
  v71 = (void *)v8;
  if (v6 && (v11 & 1) == 0)
  {
    v24 = [v9 localizedTitle];
    int v25 = [v23 isEqualToString:v24];

    if (v25)
    {

      v23 = 0;
    }
    if (v7)
    {
      v26 = 0;
    }
    else
    {
      v26 = [v6 referencedItemsDescription];
    }
    v31 = [v6 stateDescription];

    v30 = [v6 failureDescription];
    uint64_t v34 = [v6 internalInformationMessage];
    char v28 = [v6 isPaused];
    *(float *)&double v35 = v102;
    if (v102 == -1.0)
    {
      objc_msgSend(v6, "progress", v35);
      float v102 = v36;
    }
    v64 = [v6 actionTitle];
    v66 = [v6 actionConfirmationAlertTitle];
    v60 = [v6 actionConfirmationAlertSubtitle];
    v59 = [v6 actionConfirmationAlertButtonTitle];
    v37 = [v6 action];
    v33 = v37;
    if (v37)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__PXCuratedLibraryFooterViewModel__updateExposedPropertiesForReason___block_invoke;
      aBlock[3] = &unk_1E5DD3280;
      v99 = v37;
      id v98 = v6;
      v58 = _Block_copy(aBlock);
    }
    else
    {
      v58 = 0;
    }
    BOOL v39 = [v6 pauseReason] == 2 && v75 != 0;
    BOOL v62 = v39;
    if (v7 != 2 || v23 || v26)
    {
      v29 = (void *)v34;
    }
    else
    {
      v29 = (void *)v34;
      if ((PXCPLUIStatusHasImportantInformation(v74) & 1) == 0)
      {
        v40 = [v74 actionTitle];

        if (!v40)
        {

          v30 = 0;
          v31 = 0;
          float v102 = -1.0;
        }
      }
    }
    v41 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v104 = (PXCuratedLibraryFooterViewModel *)p_isa;
      __int16 v105 = 2114;
      v106 = v23;
      __int16 v107 = 2114;
      v108 = v31;
      __int16 v109 = 2114;
      v110 = v30;
      _os_log_impl(&dword_1A9AE7000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ Did provide CPL status: \"%{public}@\", \"%{public}@\", \"%{public}@\"", buf, 0x2Au);
    }

    char v32 = 0;
    goto LABEL_54;
  }
  if ((v11 & 1) == 0)
  {
    v27 = +[PXLemonadeSettings sharedInstance];
    if (([v27 forceShowProcessingUI] & 1) != 0 || objc_msgSend(p_isa[46], "state") == 1)
    {

      if (v7)
      {

        float v102 = -1.0;
        v23 = 0;
        v75 = 0;
        BOOL v62 = 0;
        v64 = 0;
        v58 = 0;
        v59 = 0;
        v60 = 0;
        v66 = 0;
        char v28 = 0;
        v29 = 0;
        v30 = 0;
        v26 = 0;
        v31 = 0;
        char v32 = 1;
        v33 = v72;
        v72 = 0;
LABEL_54:

        v12 = v31;
        goto LABEL_61;
      }
    }
    else
    {
    }
    if ([p_isa[31] isRebuildingThumbnails])
    {
      v31 = PXLocalizedStringFromTable(@"PXCPLStatusRebuildingThumbnails", @"PhotosUICore");

      v33 = PLUserStatusUIGetLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v104 = (PXCuratedLibraryFooterViewModel *)p_isa;
        __int16 v105 = 2114;
        v106 = v23;
        __int16 v107 = 2114;
        v108 = v31;
        __int16 v109 = 2114;
        v110 = 0;
        _os_log_impl(&dword_1A9AE7000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ Did provide thumbnail rebuild status: \"%{public}@\", \"%{public}@\", \"%{public}@\"", buf, 0x2Au);
      }
      char v32 = 0;
      BOOL v62 = 0;
      v64 = 0;
      v58 = 0;
      v59 = 0;
      v60 = 0;
      v66 = 0;
      char v28 = 0;
      v29 = 0;
      v30 = 0;
      v26 = 0;
      goto LABEL_54;
    }
  }
  char v32 = 0;
  BOOL v62 = 0;
  v64 = 0;
  v58 = 0;
  v59 = 0;
  v60 = 0;
  v66 = 0;
  char v28 = 0;
  v29 = 0;
  v30 = 0;
  v26 = 0;
LABEL_61:
  v42 = PXLocalizedStringFromTable(@"PXCuratedLibraryFooterCuratedLibraryCurationCompleteTitle", @"PhotosUICore");
  if (![v23 isEqualToString:v42]) {
    goto LABEL_68;
  }
  v43 = v23;
  uint64_t v44 = [v12 length];

  if (!v44)
  {
    v45 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v104 = (PXCuratedLibraryFooterViewModel *)p_isa;
      _os_log_impl(&dword_1A9AE7000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ Special case: Erasing curation specific title", buf, 0xCu);
    }

    v42 = v43;
    v23 = 0;
LABEL_68:

    if (!v26) {
      goto LABEL_71;
    }
    goto LABEL_69;
  }
  v23 = v43;
  if (!v26) {
    goto LABEL_71;
  }
LABEL_69:
  if (!v23) {
    PXAssertGetLog();
  }
LABEL_71:
  v46 = v23;
  v61 = v26;
  v47 = +[PXLemonadeSettings sharedInstance];
  char v48 = [v47 forceHideProcessingUI];

  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __69__PXCuratedLibraryFooterViewModel__updateExposedPropertiesForReason___block_invoke_243;
  v78[3] = &unk_1E5DB8CB0;
  id v79 = v46;
  id v80 = v26;
  id v81 = v68;
  id v82 = v12;
  id v83 = v30;
  id v84 = v29;
  char v95 = v28;
  float v94 = v102;
  id v85 = v64;
  id v86 = v66;
  id v87 = v60;
  id v88 = v59;
  id v91 = v58;
  uint64_t v92 = 0;
  id v89 = v75;
  v90 = v72;
  BOOL v93 = v62;
  char v96 = v32 & (v48 ^ 1);
  v63 = v72;
  id v76 = v75;
  id v49 = v58;
  id v50 = v59;
  id v73 = v60;
  id v67 = v66;
  id v65 = v64;
  id v51 = v29;
  id v52 = v30;
  id v53 = v12;
  id v54 = v68;
  id v55 = v61;
  id v56 = v46;
  [p_isa performChanges:v78];
}

uint64_t __69__PXCuratedLibraryFooterViewModel__updateExposedPropertiesForReason___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __69__PXCuratedLibraryFooterViewModel__updateExposedPropertiesForReason___block_invoke_243(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 136);
  id v5 = a2;
  [v5 setAnimatedIconMode:v3];
  [v5 setTitle:*(void *)(a1 + 32)];
  [v5 setExtendedTitle:*(void *)(a1 + 40)];
  [v5 setFilterView:*(void *)(a1 + 48)];
  [v5 setSubtitle1:*(void *)(a1 + 56)];
  [v5 setSubtitle2:*(void *)(a1 + 64)];
  [v5 setInternalMessageSubtitle:*(void *)(a1 + 72)];
  [v5 setIsPaused:*(unsigned __int8 *)(a1 + 156)];
  LODWORD(v4) = *(_DWORD *)(a1 + 152);
  [v5 setProgress:v4];
  [v5 setActionTitle:*(void *)(a1 + 80)];
  [v5 setActionConfirmationAlertTitle:*(void *)(a1 + 88)];
  [v5 setActionConfirmationAlertSubtitle:*(void *)(a1 + 96)];
  [v5 setActionConfirmationAlertButtonTitle:*(void *)(a1 + 104)];
  [v5 setAction:*(void *)(a1 + 128)];
  [v5 setAccessoryView:*(void *)(a1 + 112)];
  [v5 setTopAccessoryView:*(void *)(a1 + 120)];
  [v5 setSubtitle1Style:*(void *)(a1 + 144)];
  [v5 setIsProcessing:*(unsigned __int8 *)(a1 + 157)];
}

- (void)_updateHasImportantInformation
{
  uint64_t v3 = [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider status];
  if (PXCPLUIStatusHasImportantInformation(v3))
  {
    [(PXCuratedLibraryFooterViewModel *)self mode];
LABEL_4:
    char v6 = 1;
    goto LABEL_5;
  }
  BOOL v4 = [(PXCloudQuotaControllerHelper *)self->_cloudQuotaHelper hasAnyInformationViews];
  int64_t v5 = [(PXCuratedLibraryFooterViewModel *)self mode];
  if (v4) {
    goto LABEL_4;
  }
  int64_t v9 = v5;
  if ((unint64_t)(v5 - 1) > 1)
  {
    char v6 = 0;
  }
  else
  {
    v10 = +[PXUserDefaults standardUserDefaults];
    int v11 = [v10 didShowCurationFooter];
    if ([v11 BOOLValue])
    {
      char v6 = 0;
    }
    else
    {
      v12 = objc_opt_class();
      v13 = [(PXCuratedLibraryFooterViewModel *)self analysisStatus];
      v14 = +[PXUserDefaults standardUserDefaults];
      char v6 = [v12 hasAnalysisProgressForMode:v9 analysisStatus:v13 cplUIStatus:v3 userDefaults:v14 outAnimatedIconMode:0 outProgress:0 outTitle:0 outDescription:0];
    }
    uint64_t v15 = [v10 didShowCompletedCurationFooterAnimation];
    if (([v15 BOOLValue] & 1) == 0)
    {
      id v16 = [(PXCuratedLibraryFooterViewModel *)self analysisStatus];
      uint64_t v17 = [v16 state];

      if (v17 == 1) {
        char v6 = 1;
      }
    }
  }
LABEL_5:
  uint64_t v7 = +[PXFooterSettings sharedInstance];
  char v8 = [v7 simulateImportantInformation];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__PXCuratedLibraryFooterViewModel__updateHasImportantInformation__block_invoke;
  v18[3] = &__block_descriptor_33_e36_v16__0___PXMutableFooterViewModel__8l;
  char v19 = v8 | v6;
  [(PXFooterViewModel *)self performChanges:v18];
}

uint64_t __65__PXCuratedLibraryFooterViewModel__updateHasImportantInformation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHasImportantInformation:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)shouldAlternateTitleWithAnimatedGridCycle
{
  uint64_t v3 = +[PXUserDefaults standardUserDefaults];
  BOOL v4 = [v3 didShowCompletedCurationFooterAnimation];
  char v5 = [v4 BOOLValue];

  if (v5) {
    return 0;
  }
  uint64_t v7 = [(PXCuratedLibraryFooterViewModel *)self settings];
  char v8 = [v7 shouldAlternateTitleWithGridCycle];

  return v8;
}

- (void)footerAnimationCrossedGridCycleBoundary
{
  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryFooterViewModel;
  [(PXFooterViewModel *)&v8 footerAnimationCrossedGridCycleBoundary];
  uint64_t v3 = [(PXCuratedLibraryFooterViewModel *)self settings];
  if ([(PXCuratedLibraryFooterViewModel *)self shouldAlternateTitleWithAnimatedGridCycle])
  {
    int64_t v4 = self->_animatedGridCycleIndex + 1;
    self->_animatedGridCycleIndex = v4;
    if (!(v4 % [v3 alternateTitleGridCycleCount]))
    {
      [v3 alternateTitleGridCycleDelay];
      dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__PXCuratedLibraryFooterViewModel_footerAnimationCrossedGridCycleBoundary__block_invoke;
      block[3] = &unk_1E5DD36F8;
      block[4] = self;
      dispatch_after(v6, MEMORY[0x1E4F14428], block);
    }
  }
}

void __74__PXCuratedLibraryFooterViewModel_footerAnimationCrossedGridCycleBoundary__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isFooterShown])
  {
    id v2 = [*(id *)(a1 + 32) analysisStatus];
    [v2 cycleToNextAlternateTitle];
  }
}

- (void)setIsFooterShown:(BOOL)a3
{
  if (self->_isFooterShown != a3)
  {
    BOOL v3 = a3;
    self->_isFooterShown = a3;
    if (![(PXCuratedLibraryFooterViewModel *)self shouldAlternateTitleWithAnimatedGridCycle])
    {
      double v5 = [(PXCuratedLibraryFooterViewModel *)self analysisStatus];
      id v6 = v5;
      if (v3) {
        [v5 startCyclingThroughAlternateTitles];
      }
      else {
        [v5 stopCyclingThroughAlternateTitles];
      }
    }
  }
}

- (void)didHideFooter
{
  [(PXCuratedLibraryFooterViewModel *)self setIsFooterShown:0];
  id v5 = +[PXUserDefaults standardUserDefaults];
  int64_t v3 = [(PXFooterViewModel *)self animatedIconMode];
  if (v3)
  {
    int64_t v4 = v3;
    [v5 setDidShowCurationFooter:MEMORY[0x1E4F1CC38]];
    if (v4 == 3)
    {
      [v5 setDidShowCompletedCurationFooterAnimation:MEMORY[0x1E4F1CC38]];
      [(PXCuratedLibraryFooterViewModel *)self _updateExposedPropertiesForReason:@"DidShowCompletedCurationFooterAnimation"];
    }
  }
}

- (void)didShowFooter
{
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    [(PXCuratedLibraryFooterViewModel *)self _updateExposedPropertiesForReason:@"PXCuratedLibraryFooterViewModelMode"];
    [(PXCuratedLibraryFooterViewModel *)self _updateHasImportantInformation];
  }
}

- (PXCuratedLibraryFooterViewModel)initWithItemCountsController:(id)a3 cplUIStatusProvider:(id)a4 analysisStatus:(id)a5 mode:(int64_t)a6 viewModel:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v43.receiver = self;
  v43.super_class = (Class)PXCuratedLibraryFooterViewModel;
  uint64_t v17 = [(PXFooterViewModel *)&v43 init];
  if (v17)
  {
    int64_t v42 = a6;
    uint64_t v18 = [v16 photoLibrary];
    photoLibrary = v17->_photoLibrary;
    v17->_photoLibrary = (PHPhotoLibrary *)v18;

    uint64_t v20 = [v16 configuration];
    uint64_t v21 = [v20 featureAvailabilityMonitor];
    featureAvailabilityMonitor = v17->_featureAvailabilityMonitor;
    v17->_featureAvailabilityMonitor = (PXLemonadeFeatureAvailabilityMonitor *)v21;

    v23 = [(PXLemonadeFeatureAvailabilityMonitor *)v17->_featureAvailabilityMonitor observable];
    [v23 registerChangeObserver:v17 context:PXLemonadeFeatureAvailabilityMonitorObservationContext];

    uint64_t v24 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v17->_photoLibrary];
    sharedLibraryStatusProvider = v17->_sharedLibraryStatusProvider;
    v17->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v24;

    [(PXSharedLibraryStatusProvider *)v17->_sharedLibraryStatusProvider registerChangeObserver:v17 context:PXSharedLibraryStatusProviderObservationContext_93454];
    uint64_t v26 = [v16 libraryFilterState];
    libraryFilterState = v17->_libraryFilterState;
    v17->_libraryFilterState = (PXLibraryFilterState *)v26;

    [(PXLibraryFilterState *)v17->_libraryFilterState registerChangeObserver:v17 context:PXLibraryFilterStateObservationContext_93456];
    objc_storeStrong((id *)&v17->_itemCountsController, a3);
    [(PXAssetsDataSourceCountsController *)v17->_itemCountsController prepareCountsIfNeeded];
    [(PXAssetsDataSourceCountsController *)v17->_itemCountsController registerChangeObserver:v17 context:CuratedLibraryItemCountsControllerObserverContext];
    objc_storeStrong((id *)&v17->_cplUIStatusProvider, a4);
    [(PXCPLUIStatusProvider *)v17->_cplUIStatusProvider registerChangeObserver:v17 context:PXCPLUIStatusProviderObserverContext];
    char v28 = [[PXCPLPhotoLibrarySource alloc] initWithPhotoLibrary:v17->_photoLibrary];
    photoLibrarySource = v17->_photoLibrarySource;
    v17->_photoLibrarySource = v28;

    [(PXCPLPhotoLibrarySource *)v17->_photoLibrarySource registerChangeObserver:v17 context:PXCPLPhotoLibrarySourceObservationContext_93458];
    v30 = objc_alloc_init(PXCloudQuotaControllerHelper);
    cloudQuotaHelper = v17->_cloudQuotaHelper;
    v17->_cloudQuotaHelper = v30;

    [(PXCloudQuotaControllerHelper *)v17->_cloudQuotaHelper setDelegate:v17];
    char v32 = +[PXFooterSettings sharedInstance];
    int v33 = [v32 showFilterView];

    if (v33)
    {
      objc_storeStrong((id *)&v17->_curatedLibraryViewModel, a7);
      uint64_t v34 = [PXFilterFooterController alloc];
      double v35 = [v16 actionManager];
      uint64_t v36 = [(PXFilterFooterController *)v34 initWithActionManager:v35 photoLibrary:v17->_photoLibrary];
      filterFooterController = v17->_filterFooterController;
      v17->_filterFooterController = (PXFilterFooterController *)v36;

      [(PXFilterFooterController *)v17->_filterFooterController setSharedLibraryStatusProvider:v17->_sharedLibraryStatusProvider];
      [(PXFilterFooterController *)v17->_filterFooterController setLibraryFilterState:v17->_libraryFilterState];
      v38 = [(PXCuratedLibraryViewModel *)v17->_curatedLibraryViewModel currentContentFilterState];
      [(PXFilterFooterController *)v17->_filterFooterController setContentFilterState:v38];

      [v16 registerChangeObserver:v17 context:PXCuratedLibraryViewModelObserverContext_93452];
    }
    objc_storeStrong((id *)&v17->_analysisStatus, a5);
    [(PXCuratedLibraryAnalysisStatus *)v17->_analysisStatus registerChangeObserver:v17 context:CuratedLibraryAnalysisStatusObserverContext];
    v17->_mode = v42;
    uint64_t v39 = +[PXFooterSettings sharedInstance];
    settings = v17->_settings;
    v17->_settings = (PXFooterSettings *)v39;

    [(PXSettings *)v17->_settings addDeferredKeyObserver:v17];
    [(PXCuratedLibraryFooterViewModel *)v17 _updateExposedPropertiesForReason:@"<initial>"];
    [(PXCuratedLibraryFooterViewModel *)v17 _updateHasImportantInformation];
  }

  return v17;
}

- (PXCuratedLibraryFooterViewModel)init
{
  int64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCuratedLibraryFooterViewModel.m", 126, @"%s is not available as initializer", "-[PXCuratedLibraryFooterViewModel init]");

  abort();
}

+ (BOOL)hasAnalysisProgressForMode:(int64_t)a3 analysisStatus:(id)a4 cplUIStatus:(id)a5 userDefaults:(id)a6 outAnimatedIconMode:(int64_t *)a7 outProgress:(float *)a8 outTitle:(id *)a9 outDescription:(id *)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if ((unint64_t)(a3 - 1) > 1) {
    goto LABEL_5;
  }
  uint64_t v18 = +[PXCuratedLibrarySettings sharedInstance];
  char v19 = [v18 hideAnalyzingStatus];

  if (v19) {
    goto LABEL_5;
  }
  if (PXCPLUIStatusHasImportantInformation(v16)) {
    goto LABEL_5;
  }
  uint64_t v20 = [v16 actionTitle];

  if (v20) {
    goto LABEL_5;
  }
  id v23 = v15;
  id v24 = v17;
  int v25 = +[PXFooterSettings sharedInstance];
  char v26 = [v25 simulateAnimatedIconMode];

  if (v26)
  {
    uint64_t v36 = +[PXFooterSettings sharedInstance];
    int64_t v30 = [v36 simulatedAnimatedIconMode];

    if (v30) {
      goto LABEL_19;
    }
  }
  else
  {
    v27 = [v24 didShowCompletedCurationFooterAnimation];
    char v28 = [v27 BOOLValue];

    if ((v28 & 1) == 0)
    {
      uint64_t v29 = [v23 state];
      if (v29 == 1)
      {
        int64_t v30 = 3;
LABEL_18:

        goto LABEL_19;
      }
      if (v29 == 2)
      {
        if ([v23 isDevicePlugged]) {
          int64_t v30 = 2;
        }
        else {
          int64_t v30 = 1;
        }
        goto LABEL_18;
      }
    }
  }
  if ([v23 state] != 2)
  {
LABEL_5:
    BOOL v21 = 0;
    goto LABEL_6;
  }
  int64_t v30 = 0;
LABEL_19:
  if (a8)
  {
    [v23 displayProgress];
    float v32 = v31;
    uint64_t v33 = [v23 state];
    float v34 = -1.0;
    if (v32 != -1.0 && v33 != 1) {
      float v34 = v32;
    }
    *a8 = v34;
  }
  if (a10)
  {
    *a10 = [v23 localizedDescription];
  }
  if (a9)
  {
    *a9 = [v23 localizedTitle];
  }
  if (a7) {
    *a7 = v30;
  }
  BOOL v21 = 1;
LABEL_6:

  return v21;
}

+ (id)_titleWithOptionalDescription:(id *)a3 progress:(float *)a4 forMode:(int64_t)a5 itemCountsController:(id)a6 analysisStatus:(id)a7 cplUIStatus:(id)a8 inRebuild:(BOOL)a9 reason:(id)a10
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a10;
  float v20 = -1.0;
  if ((unint64_t)(a5 - 1) < 2)
  {
    BOOL v21 = [v17 localizedTitle];
    v22 = [v17 localizedDescription];
    if (!a3) {
      goto LABEL_16;
    }
LABEL_15:
    *a3 = v22;
    goto LABEL_16;
  }
  if (!a5)
  {
    if (v16) {
      [v16 counts];
    }
    int v23 = [v18 inResetSync];
    v22 = 0;
    if (v18 && a9 | v23)
    {
      uint64_t v24 = objc_msgSend(v18, "numberOfPhotoAssets", 0);
      uint64_t v25 = [v18 numberOfVideoAssets];
      uint64_t v26 = [v18 numberOfOtherAssets];
      unint64_t v27 = v25 + v24 + v26;
      if (v27 && v27 > v33)
      {
        uint64_t v34 = v24;
        uint64_t v35 = v25;
        uint64_t v36 = v26;
        float v28 = (float)v27;
        if (a9)
        {
          v22 = PXLocalizedStringFromTable(@"PXCPLStatus_Rebuild", @"PhotosUICore");
        }
        else
        {
          v22 = 0;
        }
        float v20 = (float)v33 / v28;
        int64_t v30 = PLUserStatusUIGetLog();
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
LABEL_32:

          BOOL v21 = PLLocalizedCountDescription();
          if (a3) {
            goto LABEL_15;
          }
          goto LABEL_16;
        }
        float v31 = @"reset";
        if (a9) {
          float v31 = @"rebuild";
        }
        *(_DWORD *)buf = 138544898;
        id v38 = a1;
        __int16 v39 = 2114;
        uint64_t v40 = (uint64_t)v31;
        __int16 v41 = 2048;
        double v42 = v20;
        __int16 v43 = 2048;
        uint64_t v44 = v34;
        __int16 v45 = 2048;
        uint64_t v46 = v35;
        __int16 v47 = 2048;
        uint64_t v48 = v36;
        __int16 v49 = 2114;
        id v50 = v19;
        float v32 = "%{public}@ Cloud counts for <%{public}@, progress:%f>: photos:%lu, videos:%lu, others:%lu [Reason: %{public}@]";
LABEL_31:
        _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_DEFAULT, v32, buf, 0x48u);
        goto LABEL_32;
      }
      if (a9)
      {
        v22 = PXLocalizedStringFromTable(@"PXCPLStatus_Rebuild", @"PhotosUICore");
      }
      else
      {
        v22 = 0;
      }
    }
    int64_t v30 = PLUserStatusUIGetLog();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    *(_DWORD *)buf = 138544898;
    id v38 = a1;
    __int16 v39 = 2114;
    uint64_t v40 = objc_opt_class();
    __int16 v41 = 2048;
    double v42 = *(double *)&v16;
    __int16 v43 = 2048;
    uint64_t v44 = 0;
    __int16 v45 = 2048;
    uint64_t v46 = 0;
    __int16 v47 = 2048;
    uint64_t v48 = 0;
    __int16 v49 = 2114;
    id v50 = v19;
    float v32 = "%{public}@ Local counts for <%{public}@:%p>: photos:%lu, videos:%lu, others:%lu [Reason: %{public}@]";
    goto LABEL_31;
  }
  v22 = 0;
  BOOL v21 = 0;
  if (a3) {
    goto LABEL_15;
  }
LABEL_16:
  if (a4) {
    *a4 = v20;
  }

  return v21;
}

@end