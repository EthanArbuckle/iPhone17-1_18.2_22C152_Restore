@interface PUImportActionCoordinator
+ (float)lowBatteryLevelThresholdForDevice;
+ (id)deleteAllConfirmationMessageForItems:(id)a3 importSource:(id)a4;
+ (int64_t)importBehaviorForBatteryState:(int64_t)a3 batteryLevel:(float)a4;
+ (void)retrieveBatteryState:(int64_t *)a3 batteryLevel:(float *)a4;
- (BOOL)ppt_alwaysImportDuplicatesNoPrompt;
- (BOOL)presentsAdditionalDeleteAllConfirmation;
- (BOOL)someItemsButNotAllAreSelected;
- (NSByteCountFormatter)byteCountFormatter;
- (NSNumberFormatter)percentageNumberFormatter;
- (NSString)loggingPrefix;
- (PLCacheDeleteClient)cacheDeleteClient;
- (PUImportActionCoordinator)initWithViewController:(id)a3 importController:(id)a4 loggingSource:(int64_t)a5;
- (PUImportActionCoordinatorDelegate)delegate;
- (PXImportController)importController;
- (UIAction)importAllAction;
- (UIMenu)importActionsMenu;
- (UIViewController)viewController;
- (id)actionMenuForImportButton;
- (int64_t)loggingSource;
- (void)_commitImportingItems:(id)a3;
- (void)_deleteItems:(id)a3;
- (void)_handleDiskAvailabilityRequestForItems:(id)a3 withSuccess:(BOOL)a4 numBytesPurged:(int64_t)a5 additionalBytesRequired:(int64_t)a6 error:(id)a7;
- (void)_importItems:(id)a3 allowDuplicates:(BOOL)a4;
- (void)_presentInsufficientDiskSpaceAlertForItems:(id)a3;
- (void)checkBatteryLevelWithCompletion:(id)a3;
- (void)configureImportActionsForBarButtonItem:(id)a3;
- (void)deleteItemsFromBarButtonItem:(id)a3;
- (void)deleteItemsFromBarButtonItem:(id)a3 withOneUpHintItems:(id)a4;
- (void)importAllFromBarButtonItem;
- (void)notifyDelegateOfImportCancellation;
- (void)ppt_beginImportFromBarButtonItem;
- (void)setByteCountFormatter:(id)a3;
- (void)setCacheDeleteClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImportActionsMenu:(id)a3;
- (void)setImportAllAction:(id)a3;
- (void)setImportController:(id)a3;
- (void)setLoggingPrefix:(id)a3;
- (void)setPercentageNumberFormatter:(id)a3;
- (void)setPpt_alwaysImportDuplicatesNoPrompt:(BOOL)a3;
- (void)setPresentsAdditionalDeleteAllConfirmation:(BOOL)a3;
- (void)setViewController:(id)a3;
- (void)stopImport;
@end

@implementation PUImportActionCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDeleteClient, 0);
  objc_storeStrong((id *)&self->_byteCountFormatter, 0);
  objc_storeStrong((id *)&self->_percentageNumberFormatter, 0);
  objc_storeStrong((id *)&self->_importActionsMenu, 0);
  objc_storeStrong((id *)&self->_importAllAction, 0);
  objc_storeStrong((id *)&self->_loggingPrefix, 0);
  objc_storeStrong((id *)&self->_importController, 0);
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setCacheDeleteClient:(id)a3
{
}

- (PLCacheDeleteClient)cacheDeleteClient
{
  return self->_cacheDeleteClient;
}

- (void)setByteCountFormatter:(id)a3
{
}

- (NSByteCountFormatter)byteCountFormatter
{
  return self->_byteCountFormatter;
}

- (void)setPpt_alwaysImportDuplicatesNoPrompt:(BOOL)a3
{
  self->_ppt_alwaysImportDuplicatesNoPrompt = a3;
}

- (BOOL)ppt_alwaysImportDuplicatesNoPrompt
{
  return self->_ppt_alwaysImportDuplicatesNoPrompt;
}

- (void)setPercentageNumberFormatter:(id)a3
{
}

- (NSNumberFormatter)percentageNumberFormatter
{
  return self->_percentageNumberFormatter;
}

- (void)setImportActionsMenu:(id)a3
{
}

- (UIMenu)importActionsMenu
{
  return self->_importActionsMenu;
}

- (void)setImportAllAction:(id)a3
{
}

- (UIAction)importAllAction
{
  return self->_importAllAction;
}

- (void)setLoggingPrefix:(id)a3
{
}

- (NSString)loggingPrefix
{
  return self->_loggingPrefix;
}

- (void)setImportController:(id)a3
{
}

- (PXImportController)importController
{
  return self->_importController;
}

- (void)setViewController:(id)a3
{
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentsAdditionalDeleteAllConfirmation:(BOOL)a3
{
  self->_presentsAdditionalDeleteAllConfirmation = a3;
}

- (BOOL)presentsAdditionalDeleteAllConfirmation
{
  return self->_presentsAdditionalDeleteAllConfirmation;
}

- (int64_t)loggingSource
{
  return self->_loggingSource;
}

- (void)setDelegate:(id)a3
{
}

- (PUImportActionCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUImportActionCoordinatorDelegate *)WeakRetained;
}

- (void)_deleteItems:(id)a3
{
  id v4 = a3;
  if (![v4 count]) {
    _PFAssertContinueHandler();
  }
  v5 = [(PUImportActionCoordinator *)self delegate];
  [v5 actionCoordinatorWillBeginDelete:self];

  objc_initWeak(&location, self);
  v6 = [(PUImportActionCoordinator *)self importController];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __42__PUImportActionCoordinator__deleteItems___block_invoke;
  v11 = &unk_1E5F2D940;
  objc_copyWeak(&v12, &location);
  [v6 deleteItems:v4 withCompletionHandler:&v8];

  v7 = [(PUImportActionCoordinator *)self delegate];
  [v7 actionCoordinatorDidBeginDelete:self];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __42__PUImportActionCoordinator__deleteItems___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 actionCoordinatorDidEndDelete:v3];
}

- (void)deleteItemsFromBarButtonItem:(id)a3 withOneUpHintItems:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _importActionCoordinatorLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(PUImportActionCoordinator *)self loggingPrefix];
    *(_DWORD *)buf = 138543618;
    v47 = v9;
    __int16 v48 = 2048;
    uint64_t v49 = [v7 count];
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Delete bar button tapped. Hint items: %lu", buf, 0x16u);
  }
  uint64_t v10 = [v7 count];
  v11 = [(PUImportActionCoordinator *)self importController];
  id v12 = [v11 selectedItems];

  v13 = (void *)[v12 count];
  if (!v7)
  {
    v21 = _importActionCoordinatorLog();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (!v13)
    {
      if (v22)
      {
        v38 = [(PUImportActionCoordinator *)self loggingPrefix];
        *(_DWORD *)buf = 138543362;
        v47 = v38;
        _os_log_impl(&dword_1AE9F8000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Showing 'Delete All' confirmation", buf, 0xCu);
      }
      v13 = PLLocalizedFrameworkString();
      v39 = [(PUImportActionCoordinator *)self importController];
      v40 = [v39 dataSourceManager];
      v17 = [v40 unfilteredDataSource];

      id v16 = [v17 allItems];
      char v26 = 1;
      goto LABEL_18;
    }
    if (v22)
    {
      v23 = [(PUImportActionCoordinator *)self loggingPrefix];
      *(_DWORD *)buf = 138543618;
      v47 = v23;
      __int16 v48 = 2048;
      uint64_t v49 = (uint64_t)v13;
      _os_log_impl(&dword_1AE9F8000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Showing delete confirmation action sheet for %lu items", buf, 0x16u);
    }
    id v16 = v12;
    v17 = [MEMORY[0x1E4F902C0] importAssetsFromModels:v16];
    v18 = PXImportSuffixForItems();
    v24 = @"S";
    if (v13 == (void *)1) {
      v24 = &stru_1F06BE7B8;
    }
    v25 = [NSString stringWithFormat:@"DELETE_BUTTON_TITLE_%@%@", v18, v24];
    v19 = PLServicesLocalizedFrameworkString();

    v41 = v13;
    uint64_t v20 = PFLocalizedStringWithValidatedFormat();
    goto LABEL_14;
  }
  v14 = _importActionCoordinatorLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [(PUImportActionCoordinator *)self loggingPrefix];
    *(_DWORD *)buf = 138543618;
    v47 = v15;
    __int16 v48 = 2048;
    uint64_t v49 = (uint64_t)v13;
    _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Showing delete confirmation action sheet for %lu hint items", buf, 0x16u);
  }
  if (v10 == 1)
  {
    id v16 = v7;
    v17 = [MEMORY[0x1E4F902C0] importAssetsFromModels:v16];
    v18 = PXImportSuffixForItems();
    v19 = [NSString stringWithFormat:@"DELETE_BUTTON_TITLE_THIS_%@", v18];
    uint64_t v20 = PLServicesLocalizedFrameworkString();
LABEL_14:
    v13 = (void *)v20;

LABEL_17:
    char v26 = 0;
LABEL_18:

    goto LABEL_19;
  }
  if (v13)
  {
    id v16 = v12;
    v17 = PULocalizedString(@"DELETE_BUTTON_TITLE_SELECTED_ITEM");
    v41 = v13;
    v13 = PUStringWithValidatedFormat();
    goto LABEL_17;
  }
  char v26 = 0;
  id v16 = 0;
LABEL_19:
  v27 = objc_msgSend(MEMORY[0x1E4FB1418], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0, v41);
  v28 = (void *)MEMORY[0x1E4FB1410];
  v29 = PLLocalizedFrameworkString();
  v30 = [v28 actionWithTitle:v29 style:1 handler:0];
  [v27 addAction:v30];

  v31 = (void *)MEMORY[0x1E4FB1410];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __77__PUImportActionCoordinator_deleteItemsFromBarButtonItem_withOneUpHintItems___block_invoke;
  v42[3] = &unk_1E5F25C70;
  char v45 = v26;
  v42[4] = self;
  id v43 = v13;
  id v44 = v16;
  id v32 = v16;
  id v33 = v13;
  v34 = [v31 actionWithTitle:v33 style:2 handler:v42];
  [v27 addAction:v34];

  v35 = [v27 popoverPresentationController];
  v36 = v35;
  if (v35) {
    [v35 setBarButtonItem:v6];
  }
  v37 = [(PUImportActionCoordinator *)self viewController];
  [v37 presentViewController:v27 animated:1 completion:0];
}

void __77__PUImportActionCoordinator_deleteItemsFromBarButtonItem_withOneUpHintItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56) && [*(id *)(a1 + 32) presentsAdditionalDeleteAllConfirmation])
  {
    uint64_t v4 = *(void *)(a1 + 48);
    v5 = *(void **)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    id v7 = [v5 importController];
    uint64_t v8 = [v7 importSource];
    uint64_t v9 = +[PUImportActionCoordinator deleteAllConfirmationMessageForItems:v4 importSource:v8];

    uint64_t v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v6 message:v9 preferredStyle:1];
    v11 = (void *)MEMORY[0x1E4FB1410];
    id v12 = PLLocalizedFrameworkString();
    v13 = [v11 actionWithTitle:v12 style:1 handler:0];
    [v10 addAction:v13];

    v14 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __77__PUImportActionCoordinator_deleteItemsFromBarButtonItem_withOneUpHintItems___block_invoke_2;
    v21 = &unk_1E5F2BF70;
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v22 = *(void *)(a1 + 32);
    id v23 = *(id *)(a1 + 48);
    id v16 = [v14 actionWithTitle:v15 style:2 handler:&v18];
    objc_msgSend(v10, "addAction:", v16, v18, v19, v20, v21, v22);

    v17 = [*(id *)(a1 + 32) viewController];
    [v17 presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    [*(id *)(a1 + 32) _deleteItems:*(void *)(a1 + 48)];
  }
}

uint64_t __77__PUImportActionCoordinator_deleteItemsFromBarButtonItem_withOneUpHintItems___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteItems:*(void *)(a1 + 40)];
}

- (void)deleteItemsFromBarButtonItem:(id)a3
{
}

- (void)notifyDelegateOfImportCancellation
{
  id v3 = [(PUImportActionCoordinator *)self delegate];
  [v3 actionCoordinatorDidCancelImport:self];
}

- (void)_commitImportingItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _importActionCoordinatorLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(PUImportActionCoordinator *)self loggingPrefix];
    *(_DWORD *)buf = 138543618;
    id v16 = v6;
    __int16 v17 = 2048;
    uint64_t v18 = [v4 count];
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Importing %tu items", buf, 0x16u);
  }
  id v7 = [(PUImportActionCoordinator *)self delegate];
  [v7 actionCoordinatorWillBeginImport:self];

  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PUImportActionCoordinator__commitImportingItems___block_invoke;
  aBlock[3] = &unk_1E5F2D758;
  objc_copyWeak(&v14, (id *)buf);
  id v8 = v4;
  id v12 = v8;
  v13 = self;
  uint64_t v9 = _Block_copy(aBlock);
  uint64_t v10 = v9;
  if (v9) {
    (*((void (**)(void *))v9 + 2))(v9);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __51__PUImportActionCoordinator__commitImportingItems___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained importController];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__PUImportActionCoordinator__commitImportingItems___block_invoke_2;
  v9[3] = &unk_1E5F25C20;
  uint64_t v5 = *(void *)(a1 + 32);
  v9[4] = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__PUImportActionCoordinator__commitImportingItems___block_invoke_3;
  v7[3] = &unk_1E5F25C48;
  objc_copyWeak(&v8, v2);
  v7[4] = *(void *)(a1 + 40);
  [v4 importItems:v5 configuration:v9 completion:v7];

  id v6 = [*(id *)(a1 + 40) delegate];
  [v6 actionCoordinatorDidBeginImport:*(void *)(a1 + 40)];

  objc_destroyWeak(&v8);
}

void __51__PUImportActionCoordinator__commitImportingItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 delegate];
  id v6 = [v5 importDestinationForActionCoordinator:*(void *)(a1 + 32)];
  [v4 setDestinationAlbum:v6];

  [v4 setSkipDiskSpaceCheck:1];
  id v9 = [*(id *)(a1 + 32) importController];
  id v7 = [v9 photoLibrary];
  id v8 = PXTargetLibraryFetchLibraryScopeOrNil();
  [v4 setLibraryScope:v8];
}

void __51__PUImportActionCoordinator__commitImportingItems___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [WeakRetained delegate];
  [v8 actionCoordinator:*(void *)(a1 + 32) didCompleteWithImportSession:v7 results:v6];
}

- (void)_presentInsufficientDiskSpaceAlertForItems:(id)a3
{
  id v4 = a3;
  uint64_t v31 = 0;
  uint64_t v5 = [MEMORY[0x1E4F902B8] itemsConstrainedByAvailableDiskSpaceFromItems:v4 additionalBytesRequired:&v31];
  id v6 = [MEMORY[0x1E4F902D0] sharedInstance];
  uint64_t v7 = [v6 simulatedDiskSpace];

  if (v7 != 3)
  {
    if (![v5 count]) {
      goto LABEL_10;
    }
    goto LABEL_5;
  }
  uint64_t v31 = 0x100000;
  if ([v5 count])
  {
LABEL_5:
    unint64_t v8 = [v5 count];
    unint64_t v9 = [v4 count];
    if (v7 == 3 || v8 < v9) {
      goto LABEL_9;
    }
LABEL_10:
    uint64_t v20 = NSString;
    v21 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v22 = [v21 model];
    v11 = [v20 stringWithFormat:@"NO_SPACE_MESSAGE_%@", v22];

    id v12 = PLLocalizedFrameworkString();
    id v23 = [MEMORY[0x1E4FB16C8] currentDevice];
    v28 = [v23 localizedModel];
    v13 = PUStringWithValidatedFormat();

    v24 = (void *)MEMORY[0x1E4FB1418];
    v25 = PLLocalizedFrameworkString();
    id v16 = objc_msgSend(v24, "alertControllerWithTitle:message:preferredStyle:", v25, v13, 1, v28);

    __int16 v17 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v18 = PLLocalizedFrameworkString();
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __72__PUImportActionCoordinator__presentInsufficientDiskSpaceAlertForItems___block_invoke_2;
    v29[3] = &unk_1E5F2BF98;
    v29[4] = self;
    uint64_t v19 = v29;
    goto LABEL_11;
  }
LABEL_9:
  v11 = [MEMORY[0x1E4F28B68] stringFromByteCount:v31 countStyle:0];
  id v12 = PLLocalizedFrameworkString();
  v13 = PUStringWithValidatedFormat();
  id v14 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v15 = PLLocalizedFrameworkString();
  id v16 = objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v15, v13, 1, v11);

  __int16 v17 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v18 = PLLocalizedFrameworkString();
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __72__PUImportActionCoordinator__presentInsufficientDiskSpaceAlertForItems___block_invoke;
  v30[3] = &unk_1E5F2BF98;
  v30[4] = self;
  uint64_t v19 = v30;
LABEL_11:
  char v26 = [v17 actionWithTitle:v18 style:1 handler:v19];
  [v16 addAction:v26];

  v27 = [(PUImportActionCoordinator *)self viewController];
  [v27 presentViewController:v16 animated:1 completion:0];
}

uint64_t __72__PUImportActionCoordinator__presentInsufficientDiskSpaceAlertForItems___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateOfImportCancellation];
}

uint64_t __72__PUImportActionCoordinator__presentInsufficientDiskSpaceAlertForItems___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDelegateOfImportCancellation];
}

- (void)_handleDiskAvailabilityRequestForItems:(id)a3 withSuccess:(BOOL)a4 numBytesPurged:(int64_t)a5 additionalBytesRequired:(int64_t)a6 error:(id)a7
{
  BOOL v10 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  id v14 = _importActionCoordinatorLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    [(PUImportActionCoordinator *)self loggingPrefix];
    uint64_t v15 = v41 = v12;
    id v16 = @"NO";
    if (v10) {
      id v16 = @"YES";
    }
    __int16 v17 = v16;
    uint64_t v18 = [(PUImportActionCoordinator *)self byteCountFormatter];
    uint64_t v19 = [v18 stringFromByteCount:a5];
    uint64_t v20 = [(PUImportActionCoordinator *)self byteCountFormatter];
    v21 = [v20 stringFromByteCount:a6];
    *(_DWORD *)buf = 138544386;
    v47 = v15;
    __int16 v48 = 2114;
    uint64_t v49 = v17;
    __int16 v50 = 2114;
    v51 = v19;
    __int16 v52 = 2114;
    v53 = v21;
    __int16 v54 = 2112;
    id v55 = v13;
    _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting disk space succeeded: %{public}@. Bytes purged: %{public}@, Additional bytes required: %{public}@, Error: %@", buf, 0x34u);

    id v12 = v41;
  }

  if (v13) {
    BOOL v22 = [v13 code] != 1;
  }
  else {
    BOOL v22 = 1;
  }
  id v23 = [MEMORY[0x1E4F902D0] sharedInstance];
  uint64_t v24 = [v23 simulatedDiskSpace];

  if (v22 && v24)
  {
    if (v24 == 4)
    {
      v27 = _importActionCoordinatorLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = [(PUImportActionCoordinator *)self loggingPrefix];
        *(_DWORD *)buf = 138543362;
        v47 = v28;
        _os_log_impl(&dword_1AE9F8000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: Simulating failure in Cache Delete", buf, 0xCu);
      }
      v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F8AD08];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      char v45 = @"This is a simulated Cache Delete failure.";
      uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      id v32 = v29;
      uint64_t v33 = v30;
      uint64_t v34 = 4;
    }
    else
    {
      if (v24 == 1)
      {
        v25 = _importActionCoordinatorLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          char v26 = [(PUImportActionCoordinator *)self loggingPrefix];
          *(_DWORD *)buf = 138543362;
          v47 = v26;
          _os_log_impl(&dword_1AE9F8000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Simulating disk space ALWAYS available", buf, 0xCu);
        }
        id v13 = 0;
        goto LABEL_16;
      }
      v35 = _importActionCoordinatorLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = [(PUImportActionCoordinator *)self loggingPrefix];
        *(_DWORD *)buf = 138543362;
        v47 = v36;
        _os_log_impl(&dword_1AE9F8000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: Simulating insufficient disk space", buf, 0xCu);
      }
      v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v38 = *MEMORY[0x1E4F8AD08];
      uint64_t v42 = *MEMORY[0x1E4F28568];
      id v43 = @"This is a simulated disk space error.";
      uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      id v32 = v37;
      uint64_t v33 = v38;
      uint64_t v34 = 0;
    }
    uint64_t v39 = [v32 errorWithDomain:v33 code:v34 userInfo:v31];

    id v13 = (id)v39;
  }
  else if (v10)
  {
LABEL_16:
    [(PUImportActionCoordinator *)self _commitImportingItems:v12];
    goto LABEL_29;
  }
  if (v13) {
    BOOL v40 = v22;
  }
  else {
    BOOL v40 = 0;
  }
  if (v40) {
    [(PUImportActionCoordinator *)self _presentInsufficientDiskSpaceAlertForItems:v12];
  }
LABEL_29:
}

- (void)_importItems:(id)a3 allowDuplicates:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke;
  v8[3] = &unk_1E5F2BD70;
  v8[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  [(PUImportActionCoordinator *)self checkBatteryLevelWithCompletion:v8];
}

void __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke(uint64_t a1, char a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = *(void **)(a1 + 40);
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_2;
    v46[3] = &__block_descriptor_33_e48_B24__0__PXImportItemViewModel_8__NSDictionary_16l;
    char v47 = *(unsigned char *)(a1 + 48);
    id v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:v46];
    uint64_t v5 = [v3 filteredArrayUsingPredicate:v4];

    unint64_t v6 = [v5 count];
    if (v6 < [*(id *)(a1 + 40) count])
    {
      id v7 = _importActionCoordinatorLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v8 = [*(id *)(a1 + 32) loggingPrefix];
        uint64_t v9 = [v5 count];
        uint64_t v10 = [*(id *)(a1 + 40) count];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v9;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v49 = (uint64_t (*)(uint64_t, uint64_t))v10;
        _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Importing %tu items instead of the %tu selected, as the others are already imported or invalid", buf, 0x20u);
      }
    }
    uint64_t v11 = [MEMORY[0x1E4F902B8] diskSpaceRequiredToImportItems:v5];
    id v12 = _importActionCoordinatorLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [*(id *)(a1 + 32) loggingPrefix];
      uint64_t v14 = [v5 count];
      uint64_t v15 = [*(id *)(a1 + 32) byteCountFormatter];
      id v16 = [v15 stringFromByteCount:v11];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2114;
      uint64_t v49 = v16;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Disk space required to import %tu items: %{public}@", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v49 = __Block_byref_object_copy__31630;
    __int16 v50 = __Block_byref_object_dispose__31631;
    id v51 = 0;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    char v45 = 0;
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x2020000000;
    char v43 = 0;
    __int16 v17 = [*(id *)(a1 + 32) importController];
    uint64_t v18 = [v17 photoLibrary];
    uint64_t v19 = [v18 photoLibraryURL];
    uint64_t v20 = [v19 path];

    objc_initWeak(&location, *(id *)(a1 + 32));
    id v21 = objc_alloc(MEMORY[0x1E4F8A6D0]);
    uint64_t v22 = MEMORY[0x1E4F14428];
    id v23 = MEMORY[0x1E4F14428];
    uint64_t v24 = (void *)[v21 initWithQoSClass:25 pathForVolume:v20 callbackQueue:v22];
    [*(id *)(a1 + 32) setCacheDeleteClient:v24];

    v25 = [*(id *)(a1 + 32) cacheDeleteClient];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_288;
    v35[3] = &unk_1E5F25BA8;
    uint64_t v26 = *(void *)(a1 + 32);
    v37 = v42;
    uint64_t v38 = v44;
    v35[4] = v26;
    uint64_t v39 = buf;
    objc_copyWeak(&v40, &location);
    id v27 = v5;
    id v36 = v27;
    [v25 requestDiskSpaceAvailabilityOfSize:v11 completion:v35];

    v28 = [MEMORY[0x1E4F902D0] sharedInstance];
    [v28 delayBeforeShowingPreparationAlert];
    double v30 = v29;

    dispatch_time_t v31 = dispatch_time(0, (uint64_t)(v30 * 1000000000.0));
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_298;
    v34[3] = &unk_1E5F25BF8;
    v34[4] = *(void *)(a1 + 32);
    v34[5] = v42;
    v34[6] = buf;
    v34[7] = v44;
    id v32 = (void *)MEMORY[0x1E4F14428];
    dispatch_after(v31, MEMORY[0x1E4F14428], v34);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);

    _Block_object_dispose(v42, 8);
    _Block_object_dispose(v44, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v33 = *(void **)(a1 + 32);
    [v33 notifyDelegateOfImportCancellation];
  }
}

uint64_t __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isMediaAsset])
  {
    if (*(unsigned char *)(a1 + 32)) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = [v3 isNotYetImported];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_288(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F902D0] sharedInstance];
  int v11 = [v10 simulateLongDiskSpacePreparation];

  if (v11) {
    int64_t v12 = 5000000000;
  }
  else {
    int64_t v12 = 0;
  }
  dispatch_time_t v13 = dispatch_time(0, v12);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_2_290;
  v16[3] = &unk_1E5F25B80;
  char v23 = a2;
  long long v20 = *(_OWORD *)(a1 + 48);
  uint64_t v14 = *(void *)(a1 + 32);
  id v17 = v9;
  uint64_t v18 = v14;
  uint64_t v21 = *(void *)(a1 + 64);
  id v15 = v9;
  objc_copyWeak(v22, (id *)(a1 + 72));
  id v19 = *(id *)(a1 + 40);
  v22[1] = a3;
  v22[2] = a4;
  dispatch_after(v13, MEMORY[0x1E4F14428], v16);

  objc_destroyWeak(v22);
}

void __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_298(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v2 = (void *)MEMORY[0x1E4FB1418];
    id v3 = PLLocalizedFrameworkString();
    uint64_t v4 = [v2 alertControllerWithTitle:v3 message:0 preferredStyle:1];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    unint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v7 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
    unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
    [v8 setAutoresizingMask:18];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    id v17 = [v7 view];
    objc_msgSend(v17, "setBounds:", v10, v12, v14, v16);

    uint64_t v18 = [v7 view];
    [v18 addSubview:v8];

    [v8 startAnimating];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setContentViewController:v7];
    id v19 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    long long v20 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v21 = PLLocalizedFrameworkString();
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_2_304;
    v25[3] = &unk_1E5F25BD0;
    uint64_t v22 = *(void *)(a1 + 56);
    v25[4] = *(void *)(a1 + 32);
    v25[5] = v22;
    char v23 = [v20 actionWithTitle:v21 style:1 handler:v25];
    [v19 addAction:v23];

    uint64_t v24 = [*(id *)(a1 + 32) viewController];
    [v24 presentViewController:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) animated:1 completion:0];
  }
}

void __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_2_304(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = _importActionCoordinatorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) loggingPrefix];
    int v5 = 138543362;
    unint64_t v6 = v3;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Cancel button pressed on the preparation alert.", (uint8_t *)&v5, 0xCu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v4 = [*(id *)(a1 + 32) cacheDeleteClient];
  [v4 cancelDiskSpaceAvailabilityRequest];
}

void __58__PUImportActionCoordinator__importItems_allowDuplicates___block_invoke_2_290(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  int v2 = *(unsigned __int8 *)(a1 + 104);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = v3;
  if (v3)
  {
    BOOL v5 = v2 != 0;
    if ([v3 code] == 1) {
      goto LABEL_10;
    }
  }
  else
  {
    BOOL v5 = v2 != 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    unint64_t v6 = _importActionCoordinatorLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [*(id *)(a1 + 40) loggingPrefix];
      *(_DWORD *)buf = 138543362;
      id v19 = v7;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Cache delete client did not receive cancellation in time, but treating as a cancel anyway.", buf, 0xCu);
    }
    unint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F8AD08];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    id v17 = @"User cancelled the purge request, though the cache delete client finished.";
    double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v11 = [v8 errorWithDomain:v9 code:1 userInfo:v10];

    BOOL v5 = 0;
    uint64_t v4 = (void *)v11;
  }
  if (!v4)
  {
    BOOL v12 = 0;
    goto LABEL_12;
  }
LABEL_10:
  BOOL v12 = [v4 code] == 1;
LABEL_12:
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) && !v12)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    double v14 = [WeakRetained viewController];
    [v14 dismissViewControllerAnimated:1 completion:0];
  }
  id v15 = objc_loadWeakRetained((id *)(a1 + 80));
  [v15 _handleDiskAvailabilityRequestForItems:*(void *)(a1 + 48) withSuccess:v5 numBytesPurged:*(void *)(a1 + 88) additionalBytesRequired:*(void *)(a1 + 96) error:v4];
}

- (void)stopImport
{
  id v2 = [(PUImportActionCoordinator *)self importController];
  [v2 stopImport];
}

- (void)checkBatteryLevelWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v45 = 0;
  int v44 = 0;
  [(id)objc_opt_class() retrieveBatteryState:&v45 batteryLevel:&v44];
  BOOL v5 = objc_opt_class();
  LODWORD(v6) = v44;
  uint64_t v7 = [v5 importBehaviorForBatteryState:v45 batteryLevel:v6];
  unint64_t v8 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v9 = [v8 model];

  if ([(__CFString *)v9 hasPrefix:@"iPod"])
  {

    uint64_t v9 = @"iPod";
  }
  double v10 = [(PUImportActionCoordinator *)self percentageNumberFormatter];
  LODWORD(v11) = v44;
  BOOL v12 = [NSNumber numberWithFloat:v11];
  double v13 = [v10 stringFromNumber:v12];

  if (v7 == 1)
  {
    v37 = [MEMORY[0x1E4F28E78] stringWithString:@"IMPORT_BATTERY_LOW_MESSAGE_"];
    [v37 appendString:v9];
    uint64_t v24 = PLLocalizedFrameworkString();
    id v36 = PUStringWithValidatedFormat();

    v25 = (void *)MEMORY[0x1E4FB1418];
    uint64_t v26 = PLLocalizedFrameworkString();
    id v27 = objc_msgSend(v25, "alertControllerWithTitle:message:preferredStyle:", v26, v36, 1, v13);

    v28 = (void *)MEMORY[0x1E4FB1410];
    double v29 = PLLocalizedFrameworkString();
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __61__PUImportActionCoordinator_checkBatteryLevelWithCompletion___block_invoke_2;
    v40[3] = &unk_1E5F2E898;
    id v30 = v4;
    id v41 = v30;
    dispatch_time_t v31 = [v28 actionWithTitle:v29 style:1 handler:v40];
    [v27 addAction:v31];

    id v32 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v33 = PLLocalizedFrameworkString();
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __61__PUImportActionCoordinator_checkBatteryLevelWithCompletion___block_invoke_3;
    v38[3] = &unk_1E5F2E898;
    id v39 = v30;
    uint64_t v34 = [v32 actionWithTitle:v33 style:0 handler:v38];
    [v27 addAction:v34];

    v35 = [(PUImportActionCoordinator *)self viewController];
    [v35 presentViewController:v27 animated:1 completion:0];
  }
  else if (v7 == 2)
  {
    double v14 = [MEMORY[0x1E4F28E78] stringWithString:@"IMPORT_BATTERY_CRITICAL_MESSAGE_"];
    [v14 appendString:v9];
    id v15 = PLLocalizedFrameworkString();
    uint64_t v16 = PUStringWithValidatedFormat();

    id v17 = (void *)MEMORY[0x1E4FB1418];
    uint64_t v18 = PLLocalizedFrameworkString();
    id v19 = objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", v18, v16, 1, v13);

    uint64_t v20 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v21 = PLLocalizedFrameworkString();
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __61__PUImportActionCoordinator_checkBatteryLevelWithCompletion___block_invoke;
    void v42[3] = &unk_1E5F2E898;
    id v43 = v4;
    uint64_t v22 = [v20 actionWithTitle:v21 style:1 handler:v42];
    [v19 addAction:v22];

    char v23 = [(PUImportActionCoordinator *)self viewController];
    [v23 presentViewController:v19 animated:1 completion:0];
  }
  else if (v4 && !v7)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

uint64_t __61__PUImportActionCoordinator_checkBatteryLevelWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __61__PUImportActionCoordinator_checkBatteryLevelWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __61__PUImportActionCoordinator_checkBatteryLevelWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)importAllFromBarButtonItem
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUImportActionCoordinator *)self importController];
  id v4 = [v3 dataSourceManager];
  BOOL v5 = [v4 unfilteredDataSource];

  uint64_t v6 = [v5 numberOfAlreadyImportedItems];
  objc_initWeak(&location, self);
  if (v6 < 1)
  {
    uint64_t v16 = _importActionCoordinatorLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [(PUImportActionCoordinator *)self loggingPrefix];
      *(_DWORD *)buf = 138543362;
      int v44 = v17;
      _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: No duplicates found, performing Import All...", buf, 0xCu);
    }
    BOOL v12 = [v5 allItems];
    [(PUImportActionCoordinator *)self _importItems:v12 allowDuplicates:0];
  }
  else
  {
    if ([v5 numberOfNotYetImportedItems])
    {
      uint64_t v7 = _importActionCoordinatorLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v8 = [(PUImportActionCoordinator *)self loggingPrefix];
        *(_DWORD *)buf = 138543362;
        int v44 = v8;
        _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Duplicates found. Presenting alert.", buf, 0xCu);
      }
      uint64_t v9 = (void *)MEMORY[0x1E4FB1418];
      double v10 = PLLocalizedFrameworkString();
      double v11 = PLLocalizedFrameworkString();
      BOOL v12 = [v9 alertControllerWithTitle:v10 message:v11 preferredStyle:1];

      double v13 = (void *)MEMORY[0x1E4FB1410];
      double v14 = PLLocalizedFrameworkString();
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __55__PUImportActionCoordinator_importAllFromBarButtonItem__block_invoke;
      v39[3] = &unk_1E5F25B38;
      objc_copyWeak(&v41, &location);
      id v40 = v5;
      id v15 = [v13 actionWithTitle:v14 style:0 handler:v39];
      [v12 addAction:v15];

      objc_destroyWeak(&v41);
    }
    else
    {
      uint64_t v18 = _importActionCoordinatorLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = [(PUImportActionCoordinator *)self loggingPrefix];
        *(_DWORD *)buf = 138543362;
        int v44 = v19;
        _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: All items to import are dupes. Presenting alert.", buf, 0xCu);
      }
      uint64_t v20 = (void *)MEMORY[0x1E4FB1418];
      uint64_t v21 = PLLocalizedFrameworkString();
      uint64_t v22 = PLLocalizedFrameworkString();
      BOOL v12 = [v20 alertControllerWithTitle:v21 message:v22 preferredStyle:1];
    }
    char v23 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v24 = PLLocalizedFrameworkString();
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __55__PUImportActionCoordinator_importAllFromBarButtonItem__block_invoke_240;
    v36[3] = &unk_1E5F25B38;
    objc_copyWeak(&v38, &location);
    id v25 = v5;
    id v37 = v25;
    uint64_t v26 = [v23 actionWithTitle:v24 style:0 handler:v36];
    [v12 addAction:v26];

    id v27 = (void *)MEMORY[0x1E4FB1410];
    v28 = PLLocalizedFrameworkString();
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    uint64_t v33 = __55__PUImportActionCoordinator_importAllFromBarButtonItem__block_invoke_244;
    uint64_t v34 = &unk_1E5F2DCA8;
    objc_copyWeak(&v35, &location);
    double v29 = [v27 actionWithTitle:v28 style:1 handler:&v31];
    objc_msgSend(v12, "addAction:", v29, v31, v32, v33, v34);

    if ([(PUImportActionCoordinator *)self ppt_alwaysImportDuplicatesNoPrompt])
    {
      id v30 = [v25 allItems];
      [(PUImportActionCoordinator *)self _importItems:v30 allowDuplicates:1];
    }
    else
    {
      id v30 = [(PUImportActionCoordinator *)self viewController];
      [v30 presentViewController:v12 animated:1 completion:0];
    }

    objc_destroyWeak(&v35);
    objc_destroyWeak(&v38);
  }

  objc_destroyWeak(&location);
}

void __55__PUImportActionCoordinator_importAllFromBarButtonItem__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = _importActionCoordinatorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = [WeakRetained loggingPrefix];
    int v7 = 138543362;
    unint64_t v8 = v4;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping duplicates.", (uint8_t *)&v7, 0xCu);
  }
  BOOL v5 = [*(id *)(a1 + 32) notYetImportedItems];
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  [v6 _importItems:v5 allowDuplicates:0];
}

void __55__PUImportActionCoordinator_importAllFromBarButtonItem__block_invoke_240(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = _importActionCoordinatorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = [WeakRetained loggingPrefix];
    int v7 = 138543362;
    unint64_t v8 = v4;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Import all, including dupes", (uint8_t *)&v7, 0xCu);
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = [*(id *)(a1 + 32) allItems];
  [v5 _importItems:v6 allowDuplicates:1];
}

void __55__PUImportActionCoordinator_importAllFromBarButtonItem__block_invoke_244(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyDelegateOfImportCancellation];
}

- (void)ppt_beginImportFromBarButtonItem
{
  if ([(PUImportActionCoordinator *)self someItemsButNotAllAreSelected])
  {
    id v3 = [(PUImportActionCoordinator *)self importController];
    id v4 = [v3 selectedItems];

    [(PUImportActionCoordinator *)self _importItems:v4 allowDuplicates:1];
  }
  else
  {
    [(PUImportActionCoordinator *)self importAllFromBarButtonItem];
  }
}

- (BOOL)someItemsButNotAllAreSelected
{
  id v3 = [(PUImportActionCoordinator *)self importController];
  id v4 = [v3 selectedItems];

  id v5 = [(PUImportActionCoordinator *)self importController];
  id v6 = [v5 dataSourceManager];
  int v7 = [v6 unfilteredDataSource];

  if ([v4 count])
  {
    uint64_t v8 = [v7 numberOfItems];
    BOOL v9 = v8 != [v4 count];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)actionMenuForImportButton
{
  v24[2] = *MEMORY[0x1E4F143B8];
  if ([(PUImportActionCoordinator *)self someItemsButNotAllAreSelected])
  {
    id v3 = [(PUImportActionCoordinator *)self importActionsMenu];

    if (!v3)
    {
      objc_initWeak(&location, self);
      id v4 = (void *)MEMORY[0x1E4FB13F0];
      id v5 = PLLocalizedFrameworkString();
      id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.down.on.square"];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __54__PUImportActionCoordinator_actionMenuForImportButton__block_invoke;
      v21[3] = &unk_1E5F2E7A8;
      objc_copyWeak(&v22, &location);
      int v7 = [v4 actionWithTitle:v5 image:v6 identifier:0 handler:v21];
      v24[0] = v7;
      uint64_t v8 = (void *)MEMORY[0x1E4FB13F0];
      BOOL v9 = PLLocalizedFrameworkString();
      double v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.and.arrow.down"];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      uint64_t v18 = __54__PUImportActionCoordinator_actionMenuForImportButton__block_invoke_219;
      id v19 = &unk_1E5F2E7A8;
      objc_copyWeak(&v20, &location);
      double v11 = [v8 actionWithTitle:v9 image:v10 identifier:0 handler:&v16];
      v24[1] = v11;
      BOOL v12 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v24, 2, v16, v17, v18, v19);

      double v13 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F06BE7B8 children:v12];
      [(PUImportActionCoordinator *)self setImportActionsMenu:v13];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
    double v14 = [(PUImportActionCoordinator *)self importActionsMenu];
  }
  else
  {
    double v14 = 0;
  }
  return v14;
}

void __54__PUImportActionCoordinator_actionMenuForImportButton__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = _importActionCoordinatorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = [WeakRetained loggingPrefix];
    int v6 = 138543362;
    int v7 = v4;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Import All menu action triggered. Beginning an import-all session", (uint8_t *)&v6, 0xCu);
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  [v5 importAllFromBarButtonItem];
}

void __54__PUImportActionCoordinator_actionMenuForImportButton__block_invoke_219(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained importController];
  id v4 = [v3 selectedItems];

  id v5 = _importActionCoordinatorLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_loadWeakRetained(v1);
    int v7 = [v6 loggingPrefix];
    int v9 = 138543618;
    double v10 = v7;
    __int16 v11 = 2048;
    uint64_t v12 = [v4 count];
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Import Selected menu button triggered. Beginning an import-selected session with %lu selected items.", (uint8_t *)&v9, 0x16u);
  }
  id v8 = objc_loadWeakRetained(v1);
  [v8 _importItems:v4 allowDuplicates:1];
}

- (void)configureImportActionsForBarButtonItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PUImportActionCoordinator *)self actionMenuForImportButton];
  if (v5)
  {
    [v4 setMenu:v5];
    [v4 setPrimaryAction:0];
    id v6 = PLLocalizedFrameworkString();
    [v4 setTitle:v6];
  }
  else
  {
    [v4 setMenu:0];
    int v7 = [(PUImportActionCoordinator *)self importAllAction];

    if (!v7)
    {
      objc_initWeak(&location, self);
      id v8 = (void *)MEMORY[0x1E4FB13F0];
      int v9 = PLLocalizedFrameworkString();
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      id v19 = __68__PUImportActionCoordinator_configureImportActionsForBarButtonItem___block_invoke;
      id v20 = &unk_1E5F2E7A8;
      objc_copyWeak(&v21, &location);
      double v10 = [v8 actionWithTitle:v9 image:0 identifier:0 handler:&v17];
      -[PUImportActionCoordinator setImportAllAction:](self, "setImportAllAction:", v10, v17, v18, v19, v20);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    __int16 v11 = [(PUImportActionCoordinator *)self importController];
    uint64_t v12 = [v11 selectionManager];
    uint64_t v13 = [v12 selectionSnapshot];
    [v13 isAnyItemSelected];

    double v14 = PLLocalizedFrameworkString();
    id v15 = [(PUImportActionCoordinator *)self importAllAction];
    [v15 setTitle:v14];

    uint64_t v16 = [(PUImportActionCoordinator *)self importAllAction];
    [v4 setPrimaryAction:v16];
  }
}

void __68__PUImportActionCoordinator_configureImportActionsForBarButtonItem___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = _importActionCoordinatorLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v4 = [WeakRetained loggingPrefix];
    int v6 = 138543362;
    int v7 = v4;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Import All bar button tapped. Beginning an import-all session", (uint8_t *)&v6, 0xCu);
  }
  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  [v5 importAllFromBarButtonItem];
}

- (PUImportActionCoordinator)initWithViewController:(id)a3 importController:(id)a4 loggingSource:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PUImportActionCoordinator;
  double v10 = [(PUImportActionCoordinator *)&v18 init];
  __int16 v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_viewController, v8);
    objc_storeStrong((id *)&v11->_importController, a4);
    v11->_loggingSource = a5;
    if (a5) {
      uint64_t v12 = @"OneUp";
    }
    else {
      uint64_t v12 = @"Grid";
    }
    objc_storeStrong((id *)&v11->_loggingPrefix, v12);
    uint64_t v13 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    percentageNumberFormatter = v11->_percentageNumberFormatter;
    v11->_percentageNumberFormatter = v13;

    [(NSNumberFormatter *)v11->_percentageNumberFormatter setNumberStyle:3];
    [(NSNumberFormatter *)v11->_percentageNumberFormatter setMaximumFractionDigits:0];
    [(NSNumberFormatter *)v11->_percentageNumberFormatter setMultiplier:&unk_1F078BD80];
    id v15 = (NSByteCountFormatter *)objc_alloc_init(MEMORY[0x1E4F28B68]);
    byteCountFormatter = v11->_byteCountFormatter;
    v11->_byteCountFormatter = v15;
  }
  return v11;
}

+ (id)deleteAllConfirmationMessageForItems:(id)a3 importSource:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"IMPORT_CONFIRM_DELETE_ALL_"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  double v10 = @"PHOTOS_";
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v24;
    int v13 = 1;
    char v14 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = [*(id *)(*((void *)&v23 + 1) + 8 * i) importAsset];
        if ([v16 isImage])
        {
          int v13 = 0;
        }
        else
        {
          char v14 = 0;
          v13 &= [v16 isMovie];
        }

        if ((v14 & 1) == 0 && !v13)
        {
          double v10 = @"MEDIA_";
          goto LABEL_19;
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11) {
        continue;
      }
      break;
    }

    uint64_t v17 = @"VIDEOS_";
    if (!v13) {
      uint64_t v17 = @"MEDIA_";
    }
    if ((v14 & 1) == 0) {
      double v10 = v17;
    }
  }
  else
  {
LABEL_19:
  }
  [v7 appendString:v10];
  objc_super v18 = [v6 productKind];
  id v19 = [v6 name];
  if (([v18 isEqualToString:@"Camera"] & 1) != 0 || !objc_msgSend(v19, "length"))
  {
    [v7 appendString:v18];
    id v21 = PLLocalizedFrameworkString();
  }
  else
  {
    [v7 appendString:@"FORMAT"];
    id v20 = PLLocalizedFrameworkString();
    id v21 = PUStringWithValidatedFormat();
  }
  return v21;
}

+ (int64_t)importBehaviorForBatteryState:(int64_t)a3 batteryLevel:(float)a4
{
  BOOL v5 = (a3 & 0xFFFFFFFFFFFFFFFELL) != 2;
  [(id)objc_opt_class() lowBatteryLevelThresholdForDevice];
  int64_t v7 = v6 >= a4 && v5;
  if (v5 && a4 <= 0.05) {
    return 2;
  }
  else {
    return v7;
  }
}

+ (void)retrieveBatteryState:(int64_t *)a3 batteryLevel:(float *)a4
{
  id v13 = [MEMORY[0x1E4FB16C8] currentDevice];
  int64_t v6 = 1;
  [v13 setBatteryMonitoringEnabled:1];
  uint64_t v7 = [v13 batteryState];
  [v13 batteryLevel];
  int v9 = v8;
  [v13 setBatteryMonitoringEnabled:0];
  double v10 = [MEMORY[0x1E4F902D0] sharedInstance];
  uint64_t v11 = [v10 simulatedBatteryLevel];

  if (v11 == 2)
  {
    int v9 = 1028443341;
  }
  else if (v11 == 1)
  {
    [(id)objc_opt_class() lowBatteryLevelThresholdForDevice];
    int v9 = v12;
    int64_t v6 = 1;
  }
  else
  {
    int64_t v6 = v7;
  }
  *a3 = v6;
  *(_DWORD *)a4 = v9;
}

+ (float)lowBatteryLevelThresholdForDevice
{
  if (lowBatteryLevelThresholdForDevice_onceToken != -1) {
    dispatch_once(&lowBatteryLevelThresholdForDevice_onceToken, &__block_literal_global_31761);
  }
  return *(float *)&lowBatteryLevelThresholdForDevice_lowThreshold;
}

float __62__PUImportActionCoordinator_lowBatteryLevelThresholdForDevice__block_invoke()
{
  v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  float result = flt_1AEFF7548[(v1 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  lowBatteryLevelThresholdForDevice_lowThreshold = LODWORD(result);
  return result;
}

@end