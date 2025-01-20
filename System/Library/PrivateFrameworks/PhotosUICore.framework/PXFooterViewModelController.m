@interface PXFooterViewModelController
+ (OS_dispatch_queue)updateQueue;
+ (id)_updateQueue_viewModelConfigurationWithStatus:(id)a3 counts:(id *)a4 photoLibrary:(id)a5;
+ (void)loadAsyncUpdatesImmediately;
- (BOOL)isActive;
- (PXEventCoalescer)updateCoalescer;
- (PXFooterViewModel)footerViewModel;
- (PXFooterViewModelController)init;
- (PXFooterViewModelController)initWithPhotoLibrary:(id)a3 provideLibraryCounts:(BOOL)a4 provideCloudQuotaOffers:(BOOL)a5;
- (PXFooterViewModelControllerDelegate)delegate;
- (PXUpdater)updater;
- (id)presentingViewControllerForCloudQuotaControllerHelper:(id)a3;
- (void)_invalidateFooterViewModel;
- (void)_mainQueue_finishUpdateWithCPLStatus:(id)a3 viewModelConfiguration:(id)a4;
- (void)_prepareCounts;
- (void)_setNeedsUpdate;
- (void)_updateFooterViewModel;
- (void)_updateIfNeeded;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDelegate:(id)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setUpdateCoalescer:(id)a3;
- (void)setUpdater:(id)a3;
@end

@implementation PXFooterViewModelController

- (PXFooterViewModel)footerViewModel
{
  return self->_footerViewModel;
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    [(PXFooterViewModelController *)self _updateIfNeeded];
  }
}

- (void)setDelegate:(id)a3
{
}

- (PXFooterViewModelController)initWithPhotoLibrary:(id)a3 provideLibraryCounts:(BOOL)a4 provideCloudQuotaOffers:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v10 = a3;
  if (!v10)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PXFooterViewModelController.m", 68, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v29.receiver = self;
  v29.super_class = (Class)PXFooterViewModelController;
  v11 = [(PXFooterViewModelController *)&v29 init];
  if (v11)
  {
    uint64_t v12 = [off_1E5DA62E0 delayedCoalescerWithDelay:1.0];
    updateCoalescer = v11->_updateCoalescer;
    v11->_updateCoalescer = (PXEventCoalescer *)v12;

    [(PXEventCoalescer *)v11->_updateCoalescer registerObserver:v11];
    uint64_t v14 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v11 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v11->_updater;
    v11->_updater = (PXUpdater *)v14;

    [(PXUpdater *)v11->_updater addUpdateSelector:sel__updateFooterViewModel];
    v16 = objc_alloc_init(PXFooterViewModel);
    footerViewModel = v11->_footerViewModel;
    v11->_footerViewModel = v16;

    objc_storeStrong((id *)&v11->_photoLibrary, a3);
    if (v6)
    {
      objc_initWeak(&location, v11);
      v18 = +[PXFooterViewModelController updateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __97__PXFooterViewModelController_initWithPhotoLibrary_provideLibraryCounts_provideCloudQuotaOffers___block_invoke;
      block[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v27, &location);
      dispatch_async(v18, block);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
    v19 = [[PXPhotoKitCPLActionManager alloc] initWithPhotoLibrary:v10];
    v20 = [[PXCPLUIStatusProvider alloc] initWithPhotoLibrary:v10 actionManager:v19];
    cplUIStatusProvider = v11->_cplUIStatusProvider;
    v11->_cplUIStatusProvider = v20;

    [(PXCPLUIStatusProvider *)v11->_cplUIStatusProvider registerChangeObserver:v11 context:PXCPLUIStatusProviderObservationContext];
    if (v5)
    {
      v22 = objc_alloc_init(PXCloudQuotaControllerHelper);
      cloudQuotaHelper = v11->_cloudQuotaHelper;
      v11->_cloudQuotaHelper = v22;

      [(PXCloudQuotaControllerHelper *)v11->_cloudQuotaHelper setDelegate:v11];
    }
  }
  return v11;
}

+ (OS_dispatch_queue)updateQueue
{
  if (updateQueue_onceToken != -1) {
    dispatch_once(&updateQueue_onceToken, &__block_literal_global_232_15050);
  }
  v2 = (void *)updateQueue_queue;
  return (OS_dispatch_queue *)v2;
}

- (void)_updateIfNeeded
{
  if ([(PXFooterViewModelController *)self isActive])
  {
    id v3 = [(PXFooterViewModelController *)self updater];
    [v3 updateIfNeeded];
  }
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (BOOL)isActive
{
  return self->_isActive;
}

void __42__PXFooterViewModelController_updateQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  attr = dispatch_queue_attr_make_initially_inactive(v1);

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.PXFooterViewModelController.Update", attr);
  id v3 = (void *)updateQueue_queue;
  updateQueue_queue = (uint64_t)v2;

  v4 = +[PXPreloadScheduler sharedScheduler];
  [v4 scheduleDeferredMainQueueTask:&__block_literal_global_236];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateCoalescer, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cloudQuotaHelper, 0);
  objc_storeStrong((id *)&self->_cplUIStatusProvider, 0);
  objc_storeStrong((id *)&self->_countsController, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_footerViewModel, 0);
}

- (void)setUpdateCoalescer:(id)a3
{
}

- (PXEventCoalescer)updateCoalescer
{
  return self->_updateCoalescer;
}

- (void)setUpdater:(id)a3
{
}

- (PXFooterViewModelControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXFooterViewModelControllerDelegate *)WeakRetained;
}

- (id)presentingViewControllerForCloudQuotaControllerHelper:(id)a3
{
  v4 = [(PXFooterViewModelController *)self delegate];
  if (!v4) {
    PXAssertGetLog();
  }
  BOOL v5 = [v4 presentingViewControllerForFooterViewModelController:self];

  return v5;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v9 = a3;
  if ((void *)PXAssetsDataSourceCountsControllerObserverContext == a5)
  {
    if (v6)
    {
LABEL_4:
      id v11 = v9;
      [(PXFooterViewModelController *)self _invalidateFooterViewModel];
      id v9 = v11;
    }
  }
  else
  {
    if ((void *)PXCPLUIStatusProviderObservationContext != a5)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PXFooterViewModelController.m" lineNumber:363 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    if ((v6 & 0x3FF) != 0) {
      goto LABEL_4;
    }
  }
}

- (void)_mainQueue_finishUpdateWithCPLStatus:(id)a3 viewModelConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((PXCPLUIStatusHasImportantInformation(v6) & 1) != 0
    || [(PXCloudQuotaControllerHelper *)self->_cloudQuotaHelper hasAnyInformationViews])
  {
    char v8 = 1;
  }
  else
  {
    id v9 = +[PXFooterSettings sharedInstance];
    char v8 = [v9 simulateImportantInformation];
  }
  if (PXCloudQuotaCanShowInformationView(v6))
  {
    id v10 = [(PXCloudQuotaControllerHelper *)self->_cloudQuotaHelper informationView];
    id v11 = [(PXCloudQuotaControllerHelper *)self->_cloudQuotaHelper premiumInformationView];
    BOOL v13 = [v6 pauseReason] == 2 && v10 != 0;
  }
  else
  {
    id v10 = 0;
    id v11 = 0;
    BOOL v13 = 0;
  }
  uint64_t v14 = [(PXFooterViewModelController *)self footerViewModel];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__PXFooterViewModelController__mainQueue_finishUpdateWithCPLStatus_viewModelConfiguration___block_invoke;
  v18[3] = &unk_1E5DB0498;
  id v20 = v11;
  id v21 = v7;
  char v22 = v8;
  id v19 = v10;
  BOOL v23 = v13;
  id v15 = v11;
  id v16 = v10;
  id v17 = v7;
  [v14 performChanges:v18];
}

void __91__PXFooterViewModelController__mainQueue_finishUpdateWithCPLStatus_viewModelConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [v3 setHasImportantInformation:*(unsigned __int8 *)(a1 + 56)];
  [v3 setAccessoryView:*(void *)(a1 + 32)];
  [v3 setTopAccessoryView:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 57)) {
    [v3 setSubtitle1Style:1];
  }
}

- (void)_updateFooterViewModel
{
  id v3 = [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider status];
  v4 = (void *)[v3 copy];

  long long v17 = 0uLL;
  uint64_t v18 = 0;
  countsController = self->_countsController;
  if (countsController) {
    [(PXAssetsDataSourceCountsController *)countsController counts];
  }
  id v6 = self->_photoLibrary;
  objc_initWeak(&location, self);
  id v7 = +[PXFooterViewModelController updateQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__PXFooterViewModelController__updateFooterViewModel__block_invoke;
  v10[3] = &unk_1E5DB0470;
  long long v14 = v17;
  uint64_t v15 = v18;
  id v11 = v4;
  uint64_t v12 = v6;
  char v8 = v6;
  id v9 = v4;
  objc_copyWeak(&v13, &location);
  dispatch_async(v7, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __53__PXFooterViewModelController__updateFooterViewModel__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  long long v10 = *(_OWORD *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 72);
  v4 = +[PXFooterViewModelController _updateQueue_viewModelConfigurationWithStatus:v2 counts:&v10 photoLibrary:v3];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PXFooterViewModelController__updateFooterViewModel__block_invoke_2;
  block[3] = &unk_1E5DCE4D0;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 32);
  id v8 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __53__PXFooterViewModelController__updateFooterViewModel__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_mainQueue_finishUpdateWithCPLStatus:viewModelConfiguration:", *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)_invalidateFooterViewModel
{
  id v2 = [(PXFooterViewModelController *)self updater];
  [v2 setNeedsUpdateOf:sel__updateFooterViewModel];
}

- (void)_prepareCounts
{
  id v9 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  [v9 setIncludeAllPhotosSmartAlbum:1];
  uint64_t v3 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:1000000205 options:v9];
  v4 = [[PXPhotosDataSourceConfiguration alloc] initWithCollectionListFetchResult:v3 options:3];
  id v5 = [[PXPhotosDataSource alloc] initWithPhotosDataSourceConfiguration:v4];
  id v6 = [[PXPhotoKitAssetsDataSourceManager alloc] initWithPhotosDataSource:v5];
  id v7 = (PXAssetsDataSourceCountsController *)[objc_alloc((Class)off_1E5DA5640) initWithAssetsDataSourceManager:v6];
  countsController = self->_countsController;
  self->_countsController = v7;

  [(PXAssetsDataSourceCountsController *)self->_countsController registerChangeObserver:self context:PXAssetsDataSourceCountsControllerObserverContext];
  [(PXPhotoKitAssetsDataSourceManager *)v6 performChanges:&__block_literal_global_221];
  [(PXAssetsDataSourceCountsController *)self->_countsController prepareCountsIfNeeded];
}

uint64_t __45__PXFooterViewModelController__prepareCounts__block_invoke(uint64_t a1, void *a2)
{
  return [a2 startBackgroundFetchIfNeeded];
}

- (void)_setNeedsUpdate
{
  id v2 = [(PXFooterViewModelController *)self updateCoalescer];
  [v2 inputEvent];
}

void __97__PXFooterViewModelController_initWithPhotoLibrary_provideLibraryCounts_provideCloudQuotaOffers___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__PXFooterViewModelController_initWithPhotoLibrary_provideLibraryCounts_provideCloudQuotaOffers___block_invoke_2;
  block[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v2);
}

void __97__PXFooterViewModelController_initWithPhotoLibrary_provideLibraryCounts_provideCloudQuotaOffers___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _prepareCounts];
}

- (PXFooterViewModelController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFooterViewModelController.m", 64, @"%s is not available as initializer", "-[PXFooterViewModelController init]");

  abort();
}

void __42__PXFooterViewModelController_updateQueue__block_invoke_2()
{
}

+ (id)_updateQueue_viewModelConfigurationWithStatus:(id)a3 counts:(id *)a4 photoLibrary:(id)a5
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v10 = [a1 updateQueue];
  dispatch_assert_queue_V2(v10);

  unint64_t var1 = a4->var1;
  unint64_t var2 = a4->var2;
  if (a4->var0 == 0x7FFFFFFFFFFFFFFFLL || var1 == 0x7FFFFFFFFFFFFFFFLL || var2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v16 = PXLocalizedStringFromTable(@"PXCuratedLibraryLoadingCountsDescription", @"PhotosUICore");
    unint64_t v15 = 0;
  }
  else
  {
    unint64_t v15 = var1 + a4->var0 + var2;
    id v16 = PLLocalizedCountDescription();
  }
  int v101 = 0;
  int v17 = [v9 hasSyncProgressReturningImportOperations:&v101];

  if (v17)
  {
    uint64_t v18 = PLProgressDescription();
    id v19 = PLAlbumImportOperationDebugDescription();
    id v20 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v103 = a1;
      __int16 v104 = 2114;
      *(void *)v105 = v18;
      *(_WORD *)&v105[8] = 2114;
      *(void *)v106 = v19;
      _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Providing status for import operation: \"%{public}@\" (%{public}@)", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  v82 = v8;
  if (v8)
  {
    if (v16)
    {
      uint64_t v21 = [v8 referencedItemsDescription];
    }
    else
    {
      uint64_t v21 = 0;
    }
    v80 = (void *)v21;
    v70 = objc_msgSend(v8, "stateDescription", v15);

    uint64_t v35 = [v8 failureDescription];
    uint64_t v36 = [v8 internalInformationMessage];
    int v37 = [v8 isPaused];
    [v8 progress];
    float v34 = v38;
    uint64_t v39 = [v8 actionTitle];
    uint64_t v75 = [v8 actionConfirmationAlertTitle];
    uint64_t v40 = [v8 actionConfirmationAlertSubtitle];
    uint64_t v69 = [v8 actionConfirmationAlertButtonTitle];
    v41 = [v8 action];
    v73 = v41;
    if (v41)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __97__PXFooterViewModelController__updateQueue_viewModelConfigurationWithStatus_counts_photoLibrary___block_invoke;
      aBlock[3] = &unk_1E5DD3280;
      id v100 = v41;
      id v99 = v8;
      v42 = _Block_copy(aBlock);
    }
    else
    {
      v42 = 0;
    }
    v76 = (void *)v39;
    v78 = (void *)v36;
    if (!v37
      || [v8 pauseReason] == 2
      || [v8 pauseReason] == 1
      || ![v8 pauseReason])
    {
      char v72 = 0;
    }
    else
    {
      unint64_t v43 = [v8 pauseReason];
      if (v43 > 0x12) {
        v44 = 0;
      }
      else {
        v44 = off_1E5DCF288[v43];
      }
      v66 = v44;
      v67 = PLUserStatusUIGetLog();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v103 = a1;
        __int16 v104 = 2114;
        *(void *)v105 = v66;
        _os_log_impl(&dword_1A9AE7000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@ Providing badge to status – reason: (%{public}@)", buf, 0x16u);
      }

      char v72 = 1;
    }
    v74 = (void *)v40;
    char v45 = v101;
    int v46 = [v8 inResetSync];
    int v47 = v46;
    v71 = v42;
    if ((v45 & 0x10) != 0 || v46)
    {
      unsigned int v49 = v45 & 0x10;
      uint64_t v50 = [v8 numberOfPhotoAssets];
      uint64_t v51 = [v8 numberOfVideoAssets];
      unint64_t v52 = v51 + v50 + [v8 numberOfOtherAssets];
      if (v52 > v68)
      {
        uint64_t v53 = PLLocalizedCountDescription();

        float v34 = (float)v68 / (float)v52;
        v54 = PLUserStatusUIGetLog();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138544130;
          id v103 = a1;
          __int16 v104 = 1024;
          *(_DWORD *)v105 = v49 >> 4;
          *(_WORD *)&v105[4] = 1024;
          *(_DWORD *)&v105[6] = v47;
          *(_WORD *)v106 = 2048;
          *(double *)&v106[2] = v34;
          _os_log_impl(&dword_1A9AE7000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@ Providing status for rebuild: %d, reset: %d, progress: %f", buf, 0x22u);
        }

        id v16 = (void *)v53;
      }
      v48 = (void *)v35;
      if (v49)
      {
        char v22 = PXLocalizedStringFromTable(@"PXCPLStatus_Rebuild", @"PhotosUICore");

        v55 = PLUserStatusUIGetLog();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v103 = a1;
          _os_log_impl(&dword_1A9AE7000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@ Providing rebuild placeholder status title", buf, 0xCu);
        }
        v26 = (void *)v69;
      }
      else
      {
        v26 = (void *)v69;
        char v22 = v70;
      }
    }
    else
    {
      v26 = (void *)v69;
      char v22 = v70;
      v48 = (void *)v35;
    }
    char v30 = v37;
    v56 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v103 = a1;
      __int16 v104 = 2114;
      *(void *)v105 = v16;
      *(_WORD *)&v105[8] = 2114;
      *(void *)v106 = v22;
      *(_WORD *)&v106[8] = 2114;
      v107 = v48;
      _os_log_impl(&dword_1A9AE7000, v56, OS_LOG_TYPE_DEFAULT, "%{public}@ Did provide CPL status: \"%{public}@\", \"%{public}@\", \"%{public}@\"", buf, 0x2Au);
    }
    BOOL v23 = v16;

    v31 = v78;
    v33 = v80;
    v24 = (void *)v75;
    objc_super v29 = v76;
    v32 = v48;
    v25 = v74;
    char v28 = v72;
    id v27 = v71;
  }
  else
  {
    char v22 = v18;
    BOOL v23 = v16;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    id v27 = 0;
    char v28 = 0;
    objc_super v29 = 0;
    char v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    float v34 = -1.0;
  }
  v83[0] = MEMORY[0x1E4F143A8];
  v83[1] = 3221225472;
  v83[2] = __97__PXFooterViewModelController__updateQueue_viewModelConfigurationWithStatus_counts_photoLibrary___block_invoke_230;
  v83[3] = &unk_1E5DB04C0;
  id v84 = v23;
  id v85 = v33;
  id v86 = v22;
  id v87 = v32;
  char v96 = v30;
  float v95 = v34;
  id v88 = v31;
  id v89 = v29;
  id v90 = v24;
  id v91 = v25;
  id v92 = v26;
  id v93 = v27;
  uint64_t v94 = 0;
  char v97 = v28;
  id v57 = v27;
  id v81 = v26;
  id v79 = v25;
  id v77 = v24;
  id v58 = v29;
  id v59 = v31;
  id v60 = v32;
  id v61 = v22;
  id v62 = v33;
  id v63 = v23;
  v64 = _Block_copy(v83);

  return v64;
}

uint64_t __97__PXFooterViewModelController__updateQueue_viewModelConfigurationWithStatus_counts_photoLibrary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __97__PXFooterViewModelController__updateQueue_viewModelConfigurationWithStatus_counts_photoLibrary___block_invoke_230(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 setTitle:v3];
  [v5 setExtendedTitle:*(void *)(a1 + 40)];
  [v5 setSubtitle1:*(void *)(a1 + 48)];
  [v5 setSubtitle2:*(void *)(a1 + 56)];
  [v5 setInternalMessageSubtitle:*(void *)(a1 + 64)];
  [v5 setIsPaused:*(unsigned __int8 *)(a1 + 124)];
  LODWORD(v4) = *(_DWORD *)(a1 + 120);
  [v5 setProgress:v4];
  [v5 setActionTitle:*(void *)(a1 + 72)];
  [v5 setActionConfirmationAlertTitle:*(void *)(a1 + 80)];
  [v5 setActionConfirmationAlertSubtitle:*(void *)(a1 + 88)];
  [v5 setActionConfirmationAlertButtonTitle:*(void *)(a1 + 96)];
  [v5 setAction:*(void *)(a1 + 104)];
  [v5 setSubtitle1Style:*(void *)(a1 + 112)];
  [v5 setShowBadge:*(unsigned __int8 *)(a1 + 125)];
}

+ (void)loadAsyncUpdatesImmediately
{
  id v2 = +[PXFooterViewModelController updateQueue];
  dispatch_activate(v2);

  queue = +[PXFooterViewModelController updateQueue];
  dispatch_block_t v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, &__block_literal_global_15065);
  dispatch_async(queue, v3);
}

@end