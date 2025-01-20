@interface PXPhotosLibraryFooterViewModel
- (PHPhotoLibrary)photoLibrary;
- (PXCPLUIStatusProvider)cplUIStatusProvider;
- (PXCloudQuotaControllerHelper)cloudQuotaHelper;
- (PXPhotoKitAssetsDataSourceManager)assetsDataSourceManager;
- (PXPhotosLibraryFooterViewModel)init;
- (PXPhotosLibraryFooterViewModel)initWithDataSource:(id)a3;
- (PXPhotosLibraryFooterViewModelPresentationDelegate)presentingDelegate;
- (id)presentingViewControllerForCloudQuotaControllerHelper:(id)a3;
- (void)_updateExposedProperties;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setCloudQuotaHelper:(id)a3;
- (void)setCplUIStatusProvider:(id)a3;
- (void)setPresentingDelegate:(id)a3;
@end

@implementation PXPhotosLibraryFooterViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudQuotaHelper, 0);
  objc_storeStrong((id *)&self->_cplUIStatusProvider, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
}

- (void)setCloudQuotaHelper:(id)a3
{
}

- (PXCloudQuotaControllerHelper)cloudQuotaHelper
{
  return self->_cloudQuotaHelper;
}

- (void)setCplUIStatusProvider:(id)a3
{
}

- (PXCPLUIStatusProvider)cplUIStatusProvider
{
  return self->_cplUIStatusProvider;
}

- (PXPhotoKitAssetsDataSourceManager)assetsDataSourceManager
{
  return self->_assetsDataSourceManager;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPresentingDelegate:(id)a3
{
}

- (PXPhotosLibraryFooterViewModelPresentationDelegate)presentingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingDelegate);
  return (PXPhotosLibraryFooterViewModelPresentationDelegate *)WeakRetained;
}

- (id)presentingViewControllerForCloudQuotaControllerHelper:(id)a3
{
  v4 = [(PXPhotosLibraryFooterViewModel *)self presentingDelegate];
  v5 = [v4 presentingViewControllerForViewModel:self];

  return v5;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXPhotosLibraryFooterViewModelObserverContext == a5)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_7;
    }
LABEL_6:
    [(PXPhotosLibraryFooterViewModel *)self _updateExposedProperties];
    goto LABEL_7;
  }
  if ((void *)PXCPLUIStatusProviderObservationContext_299061 != a5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXPhotosLibraryFooterViewModel.m" lineNumber:166 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 0x10) == 0) {
    goto LABEL_6;
  }
  v10 = [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider status];
  [v10 progress];
  int v12 = v11;

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__PXPhotosLibraryFooterViewModel_observable_didChange_context___block_invoke;
  v14[3] = &__block_descriptor_36_e36_v16__0___PXMutableFooterViewModel__8l;
  int v15 = v12;
  [(PXFooterViewModel *)self performChanges:v14];
LABEL_7:
}

uint64_t __63__PXPhotosLibraryFooterViewModel_observable_didChange_context___block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 32);
  return [a2 setProgress:a3];
}

- (void)_updateExposedProperties
{
  v3 = [(PXPhotosLibraryFooterViewModel *)self assetsDataSourceManager];
  v4 = [v3 dataSource];

  v5 = [v4 photosDataSource];
  [v5 estimatedPhotosCount];
  [v5 estimatedVideosCount];
  [v5 estimatedOtherCount];
  char v6 = PLLocalizedCountDescription();
  v7 = [(PXCPLUIStatusProvider *)self->_cplUIStatusProvider status];
  if (PXCloudQuotaCanShowInformationView(v7))
  {
    uint64_t v8 = [(PXCloudQuotaControllerHelper *)self->_cloudQuotaHelper informationView];
    id v9 = [(PXCloudQuotaControllerHelper *)self->_cloudQuotaHelper premiumInformationView];
  }
  else
  {
    uint64_t v8 = 0;
    id v9 = 0;
  }
  v61[0] = 0;
  v10 = [(PXPhotosLibraryFooterViewModel *)self photoLibrary];
  int v11 = [v10 hasSyncProgressReturningImportOperations:v61];

  v43 = v5;
  v44 = v4;
  v41 = v7;
  v42 = self;
  if (v11)
  {
    int v12 = (void *)v8;
    v13 = PLProgressDescription();
    char v14 = 0;
    int v15 = 0;
    v7 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
LABEL_10:
    double v25 = -1.0;
    v24 = "TTRWorkflowBuilder";
    goto LABEL_13;
  }
  if (!v7)
  {
    int v12 = (void *)v8;
    char v14 = 0;
    int v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v13 = 0;
    goto LABEL_10;
  }
  int v12 = (void *)v8;
  v39 = v6;
  v13 = [v7 stateDescription];
  v19 = [v7 failureDescription];
  uint64_t v37 = [v7 internalInformationMessage];
  char v33 = [v7 isPaused];
  [v7 progress];
  float v21 = v20;
  int v15 = [v7 actionTitle];
  uint64_t v35 = [v7 actionConfirmationAlertTitle];
  v16 = [v7 actionConfirmationAlertButtonTitle];
  v22 = [v7 action];
  v23 = v22;
  if (v22)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    v24 = "TTRWorkflowBuilder";
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PXPhotosLibraryFooterViewModel__updateExposedProperties__block_invoke;
    aBlock[3] = &unk_1E5DD3280;
    id v60 = v22;
    id v59 = v7;
    v17 = _Block_copy(aBlock);
  }
  else
  {
    v17 = 0;
    v24 = "TTRWorkflowBuilder";
  }

  double v25 = v21;
  v18 = (void *)v37;
  char v6 = v39;
  v7 = (void *)v35;
  char v14 = v33;
LABEL_13:
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = *((void *)v24 + 415);
  v45[2] = __58__PXPhotosLibraryFooterViewModel__updateExposedProperties__block_invoke_2;
  v45[3] = &unk_1E5DD29B0;
  id v46 = v6;
  id v47 = v13;
  id v48 = v19;
  id v49 = v18;
  char v57 = v14;
  double v56 = v25;
  id v50 = v15;
  id v51 = v7;
  id v52 = v16;
  id v53 = v12;
  id v54 = v9;
  id v55 = v17;
  v26 = v18;
  id v34 = v9;
  id v40 = v12;
  id v27 = v17;
  id v38 = v16;
  id v28 = v7;
  id v36 = v15;
  id v29 = v26;
  id v30 = v19;
  id v31 = v13;
  id v32 = v6;
  [(PXFooterViewModel *)v42 performChanges:v45];
}

uint64_t __58__PXPhotosLibraryFooterViewModel__updateExposedProperties__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __58__PXPhotosLibraryFooterViewModel__updateExposedProperties__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 setTitle:v3];
  [v5 setSubtitle1:*(void *)(a1 + 40)];
  [v5 setSubtitle2:*(void *)(a1 + 48)];
  [v5 setInternalMessageSubtitle:*(void *)(a1 + 56)];
  [v5 setIsPaused:*(unsigned __int8 *)(a1 + 120)];
  double v4 = *(double *)(a1 + 112);
  *(float *)&double v4 = v4;
  [v5 setProgress:v4];
  [v5 setActionTitle:*(void *)(a1 + 64)];
  [v5 setActionConfirmationAlertTitle:*(void *)(a1 + 72)];
  [v5 setActionConfirmationAlertButtonTitle:*(void *)(a1 + 80)];
  [v5 setAction:*(void *)(a1 + 104)];
  [v5 setAccessoryView:*(void *)(a1 + 88)];
  [v5 setTopAccessoryView:*(void *)(a1 + 96)];
}

- (PXPhotosLibraryFooterViewModel)initWithDataSource:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXPhotosLibraryFooterViewModel;
  id v5 = [(PXFooterViewModel *)&v16 init];
  if (v5)
  {
    char v6 = [[PXPhotoKitAssetsDataSourceManager alloc] initWithPhotosDataSource:v4];
    assetsDataSourceManager = v5->_assetsDataSourceManager;
    v5->_assetsDataSourceManager = v6;

    [(PXSectionedDataSourceManager *)v5->_assetsDataSourceManager registerChangeObserver:v5 context:PXPhotosLibraryFooterViewModelObserverContext];
    uint64_t v8 = [v4 photoLibrary];
    photoLibrary = v5->_photoLibrary;
    v5->_photoLibrary = (PHPhotoLibrary *)v8;

    v10 = [[PXPhotoKitCPLActionManager alloc] initWithPhotoLibrary:v5->_photoLibrary];
    int v11 = [[PXCPLUIStatusProvider alloc] initWithPhotoLibrary:v5->_photoLibrary actionManager:v10];
    cplUIStatusProvider = v5->_cplUIStatusProvider;
    v5->_cplUIStatusProvider = v11;

    [(PXCPLUIStatusProvider *)v5->_cplUIStatusProvider registerChangeObserver:v5 context:PXCPLUIStatusProviderObservationContext_299061];
    v13 = objc_alloc_init(PXCloudQuotaControllerHelper);
    cloudQuotaHelper = v5->_cloudQuotaHelper;
    v5->_cloudQuotaHelper = v13;

    [(PXCloudQuotaControllerHelper *)v5->_cloudQuotaHelper setDelegate:v5];
    [(PXPhotosLibraryFooterViewModel *)v5 _updateExposedProperties];
  }
  return v5;
}

- (PXPhotosLibraryFooterViewModel)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosLibraryFooterViewModel.m", 52, @"%s is not available as initializer", "-[PXPhotosLibraryFooterViewModel init]");

  abort();
}

@end