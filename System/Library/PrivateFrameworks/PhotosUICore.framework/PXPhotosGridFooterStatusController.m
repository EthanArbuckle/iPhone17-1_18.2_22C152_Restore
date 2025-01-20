@interface PXPhotosGridFooterStatusController
- (BOOL)assetsSharingHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)assetsSharingHelper:(id)a3 presentViewController:(id)a4;
- (PXPhotosGridFooterStatusController)init;
- (PXPhotosGridFooterStatusController)initWithViewModel:(id)a3 itemsCountsController:(id)a4;
- (PXPhotosGridFooterStatusControllerDelegate)delegate;
- (id)presentingViewControllerForCloudQuotaControllerHelper:(id)a3;
- (void)_updateFooterIfNeededWithReason:(id)a3;
- (void)_updateFooterViewModelWithReason:(id)a3;
- (void)_updateHasImportantInformation;
- (void)cloudQuotaControllerHelper:(id)a3 informationViewDidChange:(id)a4;
- (void)fetchResultCountObserver:(id)a3 didChangeFetchResultCount:(int64_t)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear;
- (void)viewWillAppear;
@end

@implementation PXPhotosGridFooterStatusController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_renderingCountObserver, 0);
  objc_storeStrong((id *)&self->_filterFooterController, 0);
  objc_storeStrong((id *)&self->_cloudQuotaHelper, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityMonitor, 0);
  objc_storeStrong((id *)&self->_cplUIStatusProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrarySource, 0);
  objc_storeStrong((id *)&self->_countsController, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (void)setDelegate:(id)a3
{
}

- (PXPhotosGridFooterStatusControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotosGridFooterStatusControllerDelegate *)WeakRetained;
}

- (BOOL)assetsSharingHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(PXPhotosGridFooterStatusController *)self delegate];
  v10 = [v9 presentingViewControllerForFooterStatusController:self];

  id v11 = [v10 presentedViewController];

  if (v11 == v8) {
    [v10 dismissViewControllerAnimated:1 completion:v7];
  }

  return v11 == v8;
}

- (BOOL)assetsSharingHelper:(id)a3 presentViewController:(id)a4
{
  id v5 = a4;
  v6 = [(PXPhotosGridFooterStatusController *)self delegate];
  id v7 = [v6 presentingViewControllerForFooterStatusController:self];

  [v7 presentViewController:v5 animated:1 completion:0];
  return v5 != 0;
}

- (void)fetchResultCountObserver:(id)a3 didChangeFetchResultCount:(int64_t)a4
{
  [(PXPhotosGridFooterStatusController *)self _updateHasImportantInformation];
  [(PXPhotosGridFooterStatusController *)self _updateFooterViewModelWithReason:@"PXFetchResultCountObserver"];
}

- (id)presentingViewControllerForCloudQuotaControllerHelper:(id)a3
{
  v4 = [(PXPhotosGridFooterStatusController *)self delegate];
  id v5 = [v4 presentingViewControllerForFooterStatusController:self];

  return v5;
}

- (void)cloudQuotaControllerHelper:(id)a3 informationViewDidChange:(id)a4
{
  [(PXPhotosGridFooterStatusController *)self _updateHasImportantInformation];
  [(PXPhotosGridFooterStatusController *)self _updateFooterViewModelWithReason:@"PXCloudQuotaControllerHelper"];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)PXAssetsDataSourceCountsControllerObserverContext_183369 == a5)
  {
    if ((a4 & 1) == 0) {
      goto LABEL_20;
    }
    id v14 = v9;
    v10 = @"PXAssetsDataSourceCountsController";
    goto LABEL_19;
  }
  if ((void *)PXCPLUIStatusProviderObservationContext_183370 == a5)
  {
    if ((a4 & 0x3FF) == 0) {
      goto LABEL_20;
    }
    id v14 = v9;
    v10 = @"PXCPLUIStatusProvider";
    goto LABEL_19;
  }
  if ((void *)PXLemonadeFeatureAvailabilityMonitorObservationContext_183371 == a5)
  {
    id v14 = v9;
    BOOL v11 = (+[PXLemonadeFeatureAvailabilityMonitor stateChangedChangeDescriptor] & a4) == 0;
    id v9 = v14;
    if (v11) {
      goto LABEL_20;
    }
    v10 = @"PXLemonadeFeatureAvailabilityMonitor";
    goto LABEL_19;
  }
  if ((void *)PXPhotosViewModelObserverContext_183373 == a5)
  {
    if ((a4 & 0x2000000) == 0) {
      goto LABEL_20;
    }
    id v14 = v9;
    v12 = [(PXPhotosViewModel *)self->_viewModel contentFilterState];
    [(PXFilterFooterController *)self->_filterFooterController setContentFilterState:v12];

    v10 = @"PXPhotosViewModel";
    goto LABEL_19;
  }
  if ((void *)PXLibraryFilterStateObservationContext_183374 == a5)
  {
    if ((a4 & 1) == 0) {
      goto LABEL_20;
    }
    id v14 = v9;
    v10 = @"PXLibraryFilterState";
    goto LABEL_19;
  }
  if ((void *)PXCPLPhotoLibrarySourceObservationContext_183375 != a5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXPhotosGridFooterStatusController.m" lineNumber:425 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((a4 & 8) != 0)
  {
    id v14 = v9;
    v10 = @"PXCPLPhotoLibrarySource";
LABEL_19:
    [(PXPhotosGridFooterStatusController *)self _updateFooterViewModelWithReason:v10];
    id v9 = v14;
  }
LABEL_20:
}

- (void)_updateFooterViewModelWithReason:(id)a3
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = +[PXLemonadeSettings sharedInstance];
  char v7 = [v6 forceShowProcessingUI];

  uint64_t v137 = 0;
  uint64_t v138 = 0;
  uint64_t v139 = 0;
  countsController = self->_countsController;
  SEL v94 = a2;
  if (countsController)
  {
    [(PXAssetsDataSourceCountsController *)countsController counts];
    uint64_t v9 = v137;
    uint64_t v10 = v138;
    uint64_t v11 = v139;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  unint64_t v12 = v10 + v11 + v9;
  p_viewModel = &self->_viewModel;
  if ([(PXPhotosViewModel *)self->_viewModel hidesAssetCountInFooter])
  {
    v110 = 0;
  }
  else
  {
    v110 = PLLocalizedCountDescription();
    id v14 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_opt_class();
      v16 = self->_countsController;
      *(_DWORD *)buf = 138544898;
      v141 = self;
      __int16 v142 = 2114;
      uint64_t v143 = v15;
      __int16 v144 = 2048;
      double v145 = *(double *)&v16;
      __int16 v146 = 2048;
      uint64_t v147 = v137;
      __int16 v148 = 2048;
      uint64_t v149 = v138;
      __int16 v150 = 2048;
      uint64_t v151 = v139;
      __int16 v152 = 2114;
      id v153 = v5;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Local counts for <%{public}@:%p>: photos:%lu, videos:%lu, others:%lu [Reason: %{public}@]", buf, 0x48u);
    }
  }
  v17 = +[PXFooterSettings sharedInstance];
  int v18 = [v17 showFilterView];

  if (v18
    && ([(PXFilterFooterController *)self->_filterFooterController view],
        (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v106 = (void *)v19;
    v20 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [(PXFilterFooterController *)self->_filterFooterController contentFilterState];
      *(_DWORD *)buf = 138543618;
      v141 = self;
      __int16 v142 = 2114;
      uint64_t v143 = (uint64_t)v21;
      _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Show filter view in footer: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v106 = 0;
  }
  v22 = +[PXLemonadeSettings sharedInstance];
  int v23 = [v22 forceRenderingStatus];

  v108 = v5;
  if ([(PXPhotosViewModel *)*p_viewModel wantsRenderingStatus] || v23)
  {
    uint64_t v24 = [(PXFetchResultCountObserver *)self->_renderingCountObserver fetchResultCount];
    int v25 = v24 > 0 ? 1 : v23;
    if (v25 == 1)
    {
      PXLocalizedAssetCountForUsage(v24, 2, 0, 10);
      double v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v27 = PXLocalizedStringFromTable(@"PXRenderStatus_Render_Now", @"PhotosUICore");
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __71__PXPhotosGridFooterStatusController__updateFooterViewModelWithReason___block_invoke;
      aBlock[3] = &unk_1E5DD36F8;
      aBlock[4] = self;
      v102 = _Block_copy(aBlock);
      v28 = PLUserStatusUIGetLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v141 = self;
        __int16 v142 = 2114;
        uint64_t v143 = *(void *)&v26;
        _os_log_impl(&dword_1A9AE7000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ Providing rendering status: \"%{public}@\"", buf, 0x16u);
      }

      v86 = 0;
      v87 = 0;
      v109 = 0;
      v89 = 0;
      v90 = 0;
      char v29 = 0;
      v88 = 0;
      v96 = 0;
      v98 = 0;
      BOOL v100 = 0;
      float v30 = -1.0;
      goto LABEL_71;
    }
  }
  if ([(PXPhotosViewModel *)*p_viewModel wantsCPLStatus])
  {
    int v135 = 0;
    int v31 = [(PHPhotoLibrary *)self->_photoLibrary hasSyncProgressReturningImportOperations:&v135];
    char v32 = v31;
    char v92 = v7;
    if (v31)
    {
      PLProgressDescription();
      double v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      PLAlbumImportOperationDebugDescription();
      double v33 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v34 = PLUserStatusUIGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v141 = self;
        __int16 v142 = 2114;
        uint64_t v143 = *(void *)&v26;
        __int16 v144 = 2114;
        double v145 = v33;
        _os_log_impl(&dword_1A9AE7000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ Providing status for import operation: \"%{public}@\" (%{public}@)", buf, 0x20u);
      }
    }
    else
    {
      double v26 = 0.0;
    }
    v37 = [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider status];
    if (v37)
    {
      v38 = v37;
      if (v110)
      {
        v86 = [v37 referencedItemsDescription];
      }
      else
      {
        v86 = 0;
      }
      *(double *)&uint64_t v39 = [v38 stateDescription];

      v109 = [v38 failureDescription];
      v90 = [v38 internalInformationMessage];
      char v29 = [v38 isPaused];
      [v38 progress];
      float v30 = v40;
      v27 = [v38 actionTitle];
      v89 = [v38 actionConfirmationAlertTitle];
      v88 = [v38 actionConfirmationAlertSubtitle];
      v87 = [v38 actionConfirmationAlertButtonTitle];
      v41 = [v38 action];
      v42 = v41;
      if (v41)
      {
        v132[0] = MEMORY[0x1E4F143A8];
        v132[1] = 3221225472;
        v132[2] = __71__PXPhotosGridFooterStatusController__updateFooterViewModelWithReason___block_invoke_262;
        v132[3] = &unk_1E5DD3280;
        id v134 = v41;
        id v133 = v38;
        v43 = _Block_copy(v132);
      }
      else
      {
        v43 = 0;
      }
      if (PXCloudQuotaCanShowInformationView(v38))
      {
        uint64_t v44 = [(PXCloudQuotaControllerHelper *)self->_cloudQuotaHelper informationView];
        v98 = [(PXCloudQuotaControllerHelper *)self->_cloudQuotaHelper premiumInformationView];
        v96 = (void *)v44;
        BOOL v46 = [v38 pauseReason] == 2 && v44 != 0;
        BOOL v100 = v46;
      }
      else
      {
        v98 = 0;
        BOOL v100 = 0;
        v96 = 0;
      }
      char v47 = v135;
      int v48 = [v38 inResetSync];
      v102 = v43;
      if ((v47 & 0x10) == 0 && !v48) {
        goto LABEL_66;
      }
      v91 = v42;
      v104 = (void *)v39;
      uint64_t v49 = [v38 numberOfPhotoAssets];
      uint64_t v50 = [v38 numberOfVideoAssets];
      uint64_t v51 = [v38 numberOfOtherAssets];
      uint64_t v52 = v49;
      uint64_t v85 = v50;
      unint64_t v53 = v50 + v49 + v51;
      if (v53 > v12)
      {
        uint64_t v54 = v51;
        uint64_t v84 = PLLocalizedCountDescription();

        float v30 = (float)v12 / (float)v53;
        v55 = PLUserStatusUIGetLog();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v56 = @"reset";
          *(_DWORD *)buf = 138544898;
          v141 = self;
          if ((v47 & 0x10) != 0) {
            v56 = @"rebuild";
          }
          __int16 v142 = 2114;
          uint64_t v143 = (uint64_t)v56;
          __int16 v144 = 2048;
          double v145 = v30;
          __int16 v146 = 2048;
          uint64_t v147 = v52;
          __int16 v148 = 2048;
          uint64_t v149 = v85;
          __int16 v150 = 2048;
          uint64_t v151 = v54;
          __int16 v152 = 2114;
          id v153 = v108;
          _os_log_impl(&dword_1A9AE7000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@ Cloud counts for <%{public}@, progress:%f>: photos:%lu, videos:%lu, others:%lu [Reason: %{public}@]", buf, 0x48u);
        }

        v110 = (void *)v84;
      }
      uint64_t v39 = (uint64_t)v104;
      v42 = v91;
      if ((v47 & 0x10) != 0)
      {
        PXLocalizedStringFromTable(@"PXCPLStatus_Rebuild", @"PhotosUICore");
        double v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

        v57 = PLUserStatusUIGetLog();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v141 = self;
          _os_log_impl(&dword_1A9AE7000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@ Providing rebuild placeholder status title", buf, 0xCu);
        }
      }
      else
      {
LABEL_66:
        double v26 = *(double *)&v39;
      }
      v58 = PLUserStatusUIGetLog();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        v141 = self;
        __int16 v142 = 2114;
        uint64_t v143 = (uint64_t)v110;
        __int16 v144 = 2114;
        double v145 = v26;
        __int16 v146 = 2114;
        uint64_t v147 = (uint64_t)v109;
        _os_log_impl(&dword_1A9AE7000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ Did provide CPL status: \"%{public}@\", \"%{public}@\", \"%{public}@\"", buf, 0x2Au);
      }

      goto LABEL_70;
    }
    if (v32)
    {
      v86 = 0;
      v87 = 0;
      v109 = 0;
      v89 = 0;
      v90 = 0;
      char v29 = 0;
      v27 = 0;
      v88 = 0;
      BOOL v100 = 0;
      v102 = 0;
      v96 = 0;
      v98 = 0;
      float v30 = -1.0;
LABEL_70:
      char v7 = v92;
      goto LABEL_71;
    }
    double v35 = v26;
  }
  else
  {
    double v35 = 0.0;
  }
  float v30 = -1.0;
  if ([(PXCPLPhotoLibrarySource *)self->_photoLibrarySource isRebuildingThumbnails])
  {
    PXLocalizedStringFromTable(@"PXCPLStatusRebuildingThumbnails", @"PhotosUICore");
    double v26 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

    v36 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v141 = self;
      __int16 v142 = 2114;
      uint64_t v143 = (uint64_t)v110;
      __int16 v144 = 2114;
      double v145 = v26;
      __int16 v146 = 2114;
      uint64_t v147 = 0;
      _os_log_impl(&dword_1A9AE7000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ Did provide thumbnail rebuild status: \"%{public}@\", \"%{public}@\", \"%{public}@\"", buf, 0x2Au);
    }

    v86 = 0;
    v87 = 0;
    v109 = 0;
    v89 = 0;
    v90 = 0;
    char v29 = 0;
    v27 = 0;
    v88 = 0;
    BOOL v100 = 0;
    v102 = 0;
    v96 = 0;
    v98 = 0;
  }
  else
  {
    v86 = 0;
    v87 = 0;
    v109 = 0;
    v89 = 0;
    v90 = 0;
    char v29 = 0;
    v27 = 0;
    v88 = 0;
    BOOL v100 = 0;
    v102 = 0;
    v96 = 0;
    v98 = 0;
    double v26 = v35;
  }
LABEL_71:
  uint64_t v59 = [(PXPhotosViewModel *)*p_viewModel footerSubtitle];
  v105 = (void *)v59;
  if (v110)
  {
    v60 = (void *)v59;
    if (v59)
    {
      v61 = [(PXPhotosViewModel *)*p_viewModel dataSourceManager];
      v62 = [v61 dataSource];
      v63 = [v62 containerCollection];

      if (objc_msgSend(v63, "px_isSharedAlbum"))
      {
        if (v26 == 0.0)
        {
          double v64 = 0.0;
        }
        else
        {
          v83 = [MEMORY[0x1E4F28B00] currentHandler];
          [v83 handleFailureInMethod:v94 object:self file:@"PXPhotosGridFooterStatusController.m" lineNumber:335 description:@"Shared album subitle1 is not nil!"];

          double v64 = v26;
        }
        double v26 = *(double *)&v60;
      }
      else
      {
        double v64 = *(double *)&v109;
        v109 = v60;
      }
      id v65 = v60;

      v66 = PLUserStatusUIGetLog();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v141 = self;
        __int16 v142 = 2114;
        uint64_t v143 = (uint64_t)v65;
        _os_log_impl(&dword_1A9AE7000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@ Using subtitle from footer view model: \"%{public}@\"", buf, 0x16u);
      }
    }
  }
  featureAvailabilityMonitor = self->_featureAvailabilityMonitor;
  if (featureAvailabilityMonitor)
  {
    if ([(PXLemonadeFeatureAvailabilityMonitor *)featureAvailabilityMonitor state] == 1)
    {
      char v7 = 1;
    }
    else
    {
      v68 = +[PXLemonadeSettings sharedInstance];
      char v7 = [v68 forceShowProcessingUI];
    }
  }
  v69 = +[PXLemonadeSettings sharedInstance];
  char v70 = [v69 forceHideProcessingUI];

  v71 = [(PXPhotosViewModel *)*p_viewModel footerLearnMoreURL];
  if (v71)
  {
    uint64_t v72 = PXLocalizedStringFromTable(@"PXStatusLearnMoreActionTitle", @"PhotosUICore");

    v130[0] = MEMORY[0x1E4F143A8];
    v130[1] = 3221225472;
    v130[2] = __71__PXPhotosGridFooterStatusController__updateFooterViewModelWithReason___block_invoke_281;
    v130[3] = &unk_1E5DD36F8;
    id v131 = v71;
    v73 = _Block_copy(v130);

    v27 = (void *)v72;
  }
  else
  {
    v73 = v102;
  }
  v95 = [(PXPhotosViewModel *)*p_viewModel footerViewModel];
  v111[0] = MEMORY[0x1E4F143A8];
  v111[1] = 3221225472;
  v111[2] = __71__PXPhotosGridFooterStatusController__updateFooterViewModelWithReason___block_invoke_2_282;
  v111[3] = &unk_1E5DC2990;
  id v112 = v110;
  id v113 = v86;
  double v114 = v26;
  id v115 = v109;
  char v127 = v29;
  float v126 = v30;
  id v116 = v90;
  id v117 = v27;
  BOOL v128 = v71 != 0;
  double v93 = v26;
  v103 = v71;
  id v118 = v89;
  id v119 = v88;
  id v120 = v87;
  id v121 = v96;
  id v124 = v73;
  BOOL v125 = v100;
  id v122 = v98;
  id v123 = v106;
  char v129 = v7 & ~v70;
  id v101 = v106;
  id v99 = v98;
  id v97 = v96;
  id v74 = v73;
  id v75 = v87;
  id v76 = v88;
  id v107 = v89;
  id v77 = v27;
  id v78 = v90;
  id v79 = v109;
  id v80 = *(id *)&v93;
  id v81 = v86;
  id v82 = v110;
  [v95 performChanges:v111];
}

void __71__PXPhotosGridFooterStatusController__updateFooterViewModelWithReason___block_invoke(uint64_t a1)
{
  PXCreateDefaultAssetSharingHelper(*(void **)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [*(id *)(*(void *)(a1 + 32) + 80) fetchResult];
  v3 = [v2 fetchedObjects];
  [v4 ensureLocalAssetsForRendering:v3 completion:&__block_literal_global_183433];
}

uint64_t __71__PXPhotosGridFooterStatusController__updateFooterViewModelWithReason___block_invoke_262(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __71__PXPhotosGridFooterStatusController__updateFooterViewModelWithReason___block_invoke_281(uint64_t a1)
{
}

void __71__PXPhotosGridFooterStatusController__updateFooterViewModelWithReason___block_invoke_2_282(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 setTitle:v3];
  [v5 setExtendedTitle:*(void *)(a1 + 40)];
  [v5 setSubtitle1:*(void *)(a1 + 48)];
  [v5 setSubtitle2:*(void *)(a1 + 56)];
  [v5 setInternalMessageSubtitle:*(void *)(a1 + 64)];
  [v5 setIsPaused:*(unsigned __int8 *)(a1 + 148)];
  LODWORD(v4) = *(_DWORD *)(a1 + 144);
  [v5 setProgress:v4];
  [v5 setActionTitle:*(void *)(a1 + 72)];
  [v5 setUseBlankActionSeparator:*(unsigned __int8 *)(a1 + 149)];
  [v5 setActionConfirmationAlertTitle:*(void *)(a1 + 80)];
  [v5 setActionConfirmationAlertSubtitle:*(void *)(a1 + 88)];
  [v5 setActionConfirmationAlertButtonTitle:*(void *)(a1 + 96)];
  [v5 setAction:*(void *)(a1 + 128)];
  [v5 setAccessoryView:*(void *)(a1 + 104)];
  [v5 setTopAccessoryView:*(void *)(a1 + 112)];
  [v5 setSubtitle1Style:*(void *)(a1 + 136)];
  [v5 setFilterView:*(void *)(a1 + 120)];
  [v5 setIsProcessing:*(unsigned __int8 *)(a1 + 150)];
}

- (void)_updateHasImportantInformation
{
  if ([(PXPhotosViewModel *)self->_viewModel wantsCPLStatus])
  {
    uint64_t v3 = [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider status];
    char HasImportantInformation = PXCPLUIStatusHasImportantInformation(v3);

    if ((HasImportantInformation & 1) != 0
      || [(PXCloudQuotaControllerHelper *)self->_cloudQuotaHelper hasAnyInformationViews]
      || [(PXFetchResultCountObserver *)self->_renderingCountObserver fetchResultCount] > 0)
    {
      char v5 = 1;
    }
    else
    {
      char v7 = +[PXFooterSettings sharedInstance];
      char v5 = [v7 simulateImportantInformation];
    }
    viewModel = self->_viewModel;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__PXPhotosGridFooterStatusController__updateHasImportantInformation__block_invoke;
    v8[3] = &__block_descriptor_33_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
    char v9 = v5;
    [(PXPhotosViewModel *)viewModel performChanges:v8];
  }
}

uint64_t __68__PXPhotosGridFooterStatusController__updateHasImportantInformation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFooterHasImportantInformation:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_updateFooterIfNeededWithReason:(id)a3
{
  countsController = self->_countsController;
  id v5 = a3;
  [(PXAssetsDataSourceCountsController *)countsController prepareCountsIfNeeded];
  [(PXPhotosGridFooterStatusController *)self _updateHasImportantInformation];
  [(PXPhotosGridFooterStatusController *)self _updateFooterViewModelWithReason:v5];
}

- (void)viewDidAppear
{
}

- (void)viewWillAppear
{
}

- (PXPhotosGridFooterStatusController)initWithViewModel:(id)a3 itemsCountsController:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v56 = [MEMORY[0x1E4F28B00] currentHandler];
    [v56 handleFailureInMethod:a2, self, @"PXPhotosGridFooterStatusController.m", 76, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v57 = [MEMORY[0x1E4F28B00] currentHandler];
  [v57 handleFailureInMethod:a2, self, @"PXPhotosGridFooterStatusController.m", 77, @"Invalid parameter not satisfying: %@", @"itemsCountsController" object file lineNumber description];

LABEL_3:
  v62.receiver = self;
  v62.super_class = (Class)PXPhotosGridFooterStatusController;
  uint64_t v11 = [(PXPhotosGridFooterStatusController *)&v62 init];
  unint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_viewModel, a3);
    v13 = [v8 footerViewModel];
    uint64_t v14 = [v13 featureAvailabilityMonitor];
    featureAvailabilityMonitor = v12->_featureAvailabilityMonitor;
    v12->_featureAvailabilityMonitor = (PXLemonadeFeatureAvailabilityMonitor *)v14;

    v16 = [(PXLemonadeFeatureAvailabilityMonitor *)v12->_featureAvailabilityMonitor observable];
    [v16 registerChangeObserver:v12 context:PXLemonadeFeatureAvailabilityMonitorObservationContext_183371];

    v17 = [v8 dataSourceManager];
    int v18 = [v17 dataSource];
    uint64_t v19 = [v18 containerCollection];

    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }

    uint64_t v21 = [v20 photoLibrary];
    photoLibrary = v12->_photoLibrary;
    v12->_photoLibrary = (PHPhotoLibrary *)v21;

    if (!v12->_photoLibrary)
    {
      int v23 = PLUIGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = [v8 dataSourceManager];
        int v25 = [v8 dataSourceManager];
        double v26 = [v25 dataSource];
        *(_DWORD *)buf = 138413058;
        id v64 = v8;
        __int16 v65 = 2112;
        v66 = v24;
        __int16 v67 = 2112;
        v68 = v26;
        __int16 v69 = 2112;
        id v70 = v20;
        _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_ERROR, "Failed to acquire photo library from vm:%@, dsm:%@, ds:%@, collection:%@", buf, 0x2Au);
      }
      uint64_t v27 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
      v28 = v12->_photoLibrary;
      v12->_photoLibrary = (PHPhotoLibrary *)v27;
    }
    objc_storeStrong((id *)&v12->_countsController, a4);
    [(PXAssetsDataSourceCountsController *)v12->_countsController registerChangeObserver:v12 context:PXAssetsDataSourceCountsControllerObserverContext_183369];
    if ([v8 wantsCPLStatus])
    {
      cplActionManagerClass = (objc_class *)[v8 cplActionManagerClass];
      v12->_cplActionManagerClass = cplActionManagerClass;
      if (!cplActionManagerClass)
      {
        v58 = [MEMORY[0x1E4F28B00] currentHandler];
        [v58 handleFailureInMethod:a2 object:v12 file:@"PXPhotosGridFooterStatusController.m" lineNumber:100 description:@"a class is needed for CPL status"];

        cplActionManagerClass = v12->_cplActionManagerClass;
      }
      float v30 = (void *)[[cplActionManagerClass alloc] initWithPhotoLibrary:v12->_photoLibrary];
      int v31 = [[PXCPLUIStatusProvider alloc] initWithPhotoLibrary:v12->_photoLibrary actionManager:v30];
      cplUIStatusProvider = v12->_cplUIStatusProvider;
      v12->_cplUIStatusProvider = v31;

      [(PXCPLUIStatusProvider *)v12->_cplUIStatusProvider registerChangeObserver:v12 context:PXCPLUIStatusProviderObservationContext_183370];
      double v33 = [[PXCPLPhotoLibrarySource alloc] initWithPhotoLibrary:v12->_photoLibrary];
      photoLibrarySource = v12->_photoLibrarySource;
      v12->_photoLibrarySource = v33;

      [(PXCPLPhotoLibrarySource *)v12->_photoLibrarySource registerChangeObserver:v12 context:PXCPLPhotoLibrarySourceObservationContext_183375];
      double v35 = objc_alloc_init(PXCloudQuotaControllerHelper);
      cloudQuotaHelper = v12->_cloudQuotaHelper;
      v12->_cloudQuotaHelper = v35;

      [(PXCloudQuotaControllerHelper *)v12->_cloudQuotaHelper setDelegate:v12];
    }
    if ([v8 wantsRenderingStatus])
    {
      if (v20)
      {
        v37 = [PXFetchResultCountObserver alloc];
        v38 = v12->_photoLibrary;
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __78__PXPhotosGridFooterStatusController_initWithViewModel_itemsCountsController___block_invoke;
        v59[3] = &unk_1E5DC2968;
        uint64_t v39 = v12;
        p_super = &v39->super;
        id v61 = v20;
        uint64_t v40 = [(PXFetchResultCountObserver *)v37 initWithQOSClass:17 photoLibrary:v38 fetchResultBlock:v59];
        renderingCountObserver = v39->_renderingCountObserver;
        v39->_renderingCountObserver = (PXFetchResultCountObserver *)v40;

        [(PXFetchResultCountObserver *)v39->_renderingCountObserver setDelegate:v39];
        v42 = p_super;
      }
      else
      {
        v42 = PLUIGetLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = [v8 dataSourceManager];
          uint64_t v44 = [v8 dataSourceManager];
          v45 = [v44 dataSource];
          *(_DWORD *)buf = 138412802;
          id v64 = v8;
          __int16 v65 = 2112;
          v66 = v43;
          __int16 v67 = 2112;
          v68 = v45;
          _os_log_impl(&dword_1A9AE7000, v42, OS_LOG_TYPE_ERROR, "Failed to acquire asset collection from vm:%@, dsm:%@, ds:%@", buf, 0x20u);
        }
      }
    }
    uint64_t v46 = [v8 libraryFilterState];
    libraryFilterState = v12->_libraryFilterState;
    v12->_libraryFilterState = (PXLibraryFilterState *)v46;

    [(PXLibraryFilterState *)v12->_libraryFilterState registerChangeObserver:v12 context:PXLibraryFilterStateObservationContext_183374];
    int v48 = +[PXFooterSettings sharedInstance];
    int v49 = [v48 showFilterView];

    if (v49)
    {
      uint64_t v50 = [PXFilterFooterController alloc];
      uint64_t v51 = [v8 gridActionManager];
      uint64_t v52 = [(PXFilterFooterController *)v50 initWithActionManager:v51 photoLibrary:v12->_photoLibrary];
      filterFooterController = v12->_filterFooterController;
      v12->_filterFooterController = (PXFilterFooterController *)v52;

      [(PXFilterFooterController *)v12->_filterFooterController setLibraryFilterState:v12->_libraryFilterState];
      uint64_t v54 = [v8 contentFilterState];
      [(PXFilterFooterController *)v12->_filterFooterController setContentFilterState:v54];

      [v8 registerChangeObserver:v12 context:PXPhotosViewModelObserverContext_183373];
    }
  }
  return v12;
}

id __78__PXPhotosGridFooterStatusController_initWithViewModel_itemsCountsController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) librarySpecificFetchOptions];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != 0", @"deferredProcessingNeeded");
  [v2 setInternalPredicate:v3];

  double v4 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:*(void *)(a1 + 40) options:v2];

  return v4;
}

- (PXPhotosGridFooterStatusController)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosGridFooterStatusController.m", 72, @"%s is not available as initializer", "-[PXPhotosGridFooterStatusController init]");

  abort();
}

@end