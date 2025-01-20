@interface PUCMMActivityItemSource
- (NSArray)individuallyPreparedItems;
- (NSError)preparationError;
- (NSString)activityType;
- (NSURL)momentShareLink;
- (OS_dispatch_queue)externalIsolationQueue;
- (PUActivityItemSourceController)itemSourceController;
- (PUActivityItemSourceOperation)preparationOperation;
- (PUCMMActivityItemSource)initWithActivityItemSourceController:(id)a3;
- (PUCMMActivityItemSourceDelegate)delegate;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerOperation:(id)a3;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (id)placeholderItemsForActivityViewController:(id)a3;
- (id)preparedItems;
- (unint64_t)state;
- (void)activityItemSourceOperation:(id)a3 prepareItemForActivityType:(id)a4;
- (void)cancel;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setActivityType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExternalIsolationQueue:(id)a3;
- (void)setIndividuallyPreparedItems:(id)a3;
- (void)setMomentShareLink:(id)a3;
- (void)setPreparationError:(id)a3;
- (void)setPreparationOperation:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation PUCMMActivityItemSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIsolationQueue, 0);
  objc_storeStrong((id *)&self->_preparationError, 0);
  objc_storeStrong((id *)&self->_individuallyPreparedItems, 0);
  objc_storeStrong((id *)&self->_momentShareLink, 0);
  objc_storeStrong((id *)&self->_preparationOperation, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_itemSourceController);
}

- (void)setExternalIsolationQueue:(id)a3
{
}

- (OS_dispatch_queue)externalIsolationQueue
{
  return self->_externalIsolationQueue;
}

- (void)setPreparationError:(id)a3
{
}

- (NSError)preparationError
{
  return self->_preparationError;
}

- (void)setIndividuallyPreparedItems:(id)a3
{
}

- (NSArray)individuallyPreparedItems
{
  return self->_individuallyPreparedItems;
}

- (void)setMomentShareLink:(id)a3
{
}

- (NSURL)momentShareLink
{
  return self->_momentShareLink;
}

- (void)setPreparationOperation:(id)a3
{
}

- (PUActivityItemSourceOperation)preparationOperation
{
  return self->_preparationOperation;
}

- (void)setActivityType:(id)a3
{
}

- (NSString)activityType
{
  return self->_activityType;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setDelegate:(id)a3
{
}

- (PUCMMActivityItemSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUCMMActivityItemSourceDelegate *)WeakRetained;
}

- (PUActivityItemSourceController)itemSourceController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemSourceController);
  return (PUActivityItemSourceController *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PUCMMActivityItemSourceSourceControllerObserverContext == a5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_itemSourceController);
    uint64_t v7 = [WeakRetained state];

    uint64_t v8 = 2 * (v7 == 2);
    if (v7 == 1) {
      uint64_t v8 = 1;
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__PUCMMActivityItemSource_observable_didChange_context___block_invoke;
    v9[3] = &__block_descriptor_40_e42_v16__0___PUMutableCMMActivityItemSource__8l;
    v9[4] = v8;
    [(PUCMMActivityItemSource *)self performChanges:v9];
  }
}

uint64_t __56__PUCMMActivityItemSource_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setState:*(void *)(a1 + 32)];
}

- (void)setState:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    v5 = PLShareSheetGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_opt_class();
      unint64_t state = self->_state;
      if (state > 2) {
        uint64_t v8 = @"unknown";
      }
      else {
        uint64_t v8 = off_1E5F27098[state];
      }
      if (a3 > 2) {
        v9 = @"unknown";
      }
      else {
        v9 = off_1E5F27098[a3];
      }
      int v11 = 138413058;
      v12 = v6;
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2114;
      v16 = v8;
      __int16 v17 = 2114;
      v18 = v9;
      id v10 = v6;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "<%@:%p>: PUCMMActivityItemSource changing state from %{public}@ to %{public}@", (uint8_t *)&v11, 0x2Au);
    }
    self->_unint64_t state = a3;
    [(PUCMMActivityItemSource *)self signalChange:1];
  }
}

- (void)cancel
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PUCMMActivityItemSource.m" lineNumber:231 description:@"expect main thread"];
  }
  v4 = [(PUCMMActivityItemSource *)self itemSourceController];

  if (v4)
  {
    v5 = [(PUCMMActivityItemSource *)self itemSourceController];
    [v5 cancel];
  }
  v6 = [(PUCMMActivityItemSource *)self preparationOperation];

  if (v6)
  {
    uint64_t v7 = [(PUCMMActivityItemSource *)self preparationOperation];
    objc_msgSend(v7, "pu_cancel");

    id v10 = [(PUCMMActivityItemSource *)self preparationOperation];
    uint64_t v8 = [v10 semaphore];
    dispatch_semaphore_signal(v8);
  }
}

- (void)activityItemSourceOperation:(id)a3 prepareItemForActivityType:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PUCMMActivityItemSource *)self setActivityType:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemSourceController);
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  id v10 = [(PUCMMActivityItemSource *)self externalIsolationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_sync(v10, block);

  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__41210;
  v65 = __Block_byref_object_dispose__41211;
  id v66 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__41210;
  v59 = __Block_byref_object_dispose__41211;
  id v60 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__41210;
  v53 = __Block_byref_object_dispose__41211;
  id v54 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x2020000000;
  char v48 = 0;
  LODWORD(v10) = +[PUActivityItemSourceConfiguration isMomentShareLinkSupportedByActivityType:v7];
  [(PUCMMActivityItemSource *)self performChanges:&__block_literal_global_41213];
  [WeakRetained registerChangeObserver:self context:&PUCMMActivityItemSourceSourceControllerObserverContext];
  uint64_t v40 = MEMORY[0x1E4F143A8];
  uint64_t v41 = 3221225472;
  v42 = __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_2;
  v43 = &unk_1E5F2D2C8;
  v44 = self;
  id v11 = v7;
  id v45 = v11;
  uint64_t v46 = v10;
  px_dispatch_on_main_queue();
  if (v10)
  {
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_3;
    v32 = &unk_1E5F26FE0;
    v33 = self;
    id v34 = WeakRetained;
    id v35 = v11;
    v37 = &v61;
    v38 = v47;
    v39 = &v49;
    v36 = v9;
    px_dispatch_on_main_queue();

    dispatch_group_wait(v36, 0xFFFFFFFFFFFFFFFFLL);
    if (!v62[5])
    {
      v12 = PLShareSheetGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = objc_opt_class();
        uint64_t v14 = v50[5];
        *(_DWORD *)buf = 138412802;
        v69 = v13;
        __int16 v70 = 2048;
        v71 = self;
        __int16 v72 = 2114;
        uint64_t v73 = v14;
        id v15 = v13;
        _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "<%@:%p>: Error in creating moment share link: %{public}@", buf, 0x20u);
      }
LABEL_8:
    }
  }
  else
  {
    v22[9] = MEMORY[0x1E4F143A8];
    v22[10] = 3221225472;
    v22[11] = __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_25;
    v22[12] = &unk_1E5F26FE0;
    v22[13] = self;
    id v23 = v11;
    id v24 = WeakRetained;
    v26 = v47;
    v27 = &v49;
    v28 = &v55;
    v25 = v9;
    px_dispatch_on_main_queue();

    dispatch_group_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
    if (![(id)v56[5] count])
    {
      v12 = PLShareSheetGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = objc_opt_class();
        uint64_t v17 = v50[5];
        *(_DWORD *)buf = 138412802;
        v69 = v16;
        __int16 v70 = 2048;
        v71 = self;
        __int16 v72 = 2114;
        uint64_t v73 = v17;
        id v18 = v16;
        _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "<%@:%p>: Error in preparing individual items: %{public}@", buf, 0x20u);
      }
      goto LABEL_8;
    }
  }
  uint64_t v19 = [(PUCMMActivityItemSource *)self externalIsolationQueue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_28;
  v22[3] = &unk_1E5F27030;
  v22[4] = self;
  v22[5] = &v61;
  v22[6] = &v55;
  v22[7] = v47;
  v22[8] = &v49;
  dispatch_sync(v19, v22);

  [(PUCMMActivityItemSource *)self performChanges:&__block_literal_global_31];
  dispatch_group_enter(v9);
  id v20 = v11;
  v21 = v9;
  px_dispatch_on_main_queue();
  dispatch_group_wait(v21, 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(v47, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);
}

uint64_t __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setMomentShareLink:0];
  [*(id *)(a1 + 32) setIndividuallyPreparedItems:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setPreparationError:0];
}

void __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 cmmActivityItemSource:*(void *)(a1 + 32) willBeginPreparationWithActivityType:*(void *)(a1 + 40) preparationType:*(void *)(a1 + 48)];
}

void __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_3(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = PLShareSheetGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    id v15 = v3;
    __int16 v16 = 2048;
    uint64_t v17 = v4;
    id v5 = v3;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "<%@:%p>: Preparing moment-sharing link", buf, 0x16u);
  }
  id v7 = *(void **)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_23;
  v8[3] = &unk_1E5F26FB8;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  long long v12 = *(_OWORD *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 80);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 56);
  [v7 publishLinkForActivityType:v9 completionHandler:v8];
}

void __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_25(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = PLShareSheetGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    uint64_t v18 = v3;
    __int16 v19 = 2048;
    uint64_t v20 = v4;
    __int16 v21 = 2112;
    uint64_t v22 = v5;
    id v6 = v3;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "<%@:%p>: Preparing individual items (even though a CMM is the preferred output type), for activity: %@", buf, 0x20u);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_26;
  v11[3] = &unk_1E5F27008;
  long long v15 = *(_OWORD *)(a1 + 64);
  uint64_t v16 = *(void *)(a1 + 80);
  id v9 = v7;
  uint64_t v10 = *(void *)(a1 + 32);
  id v12 = v9;
  uint64_t v13 = v10;
  id v14 = *(id *)(a1 + 56);
  [v9 runExplicitly:1 withActivityType:v8 completionHandler:v11];
}

uint64_t __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_28(uint64_t a1)
{
  [*(id *)(a1 + 32) setMomentShareLink:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [*(id *)(a1 + 32) setIndividuallyPreparedItems:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  }
  v3 = *(void **)(a1 + 32);
  return [v3 setPreparationError:v2];
}

void __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_3_32(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) preparedItems];
  v3 = [*(id *)(a1 + 32) delegate];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  uint64_t v8 = [v4 preparationError];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_4;
  v9[3] = &unk_1E5F2ED10;
  id v10 = *(id *)(a1 + 48);
  [v3 cmmActivityItemSource:v4 didFinishPreparationForActivityType:v5 preparationType:v6 withItems:v2 didCancel:v7 error:v8 completion:v9];
}

void __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_4(uint64_t a1)
{
}

uint64_t __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_2_29(uint64_t a1, void *a2)
{
  return [a2 setState:0];
}

void __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_26(uint64_t a1, void *a2, char a3, void *a4)
{
  id v15 = a2;
  id v7 = a4;
  uint64_t v8 = [v7 count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
  uint64_t v9 = [v7 firstObject];

  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  if (!v8 && (a3 & 1) == 0)
  {
    uint64_t v12 = [v15 copy];
    uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  [*(id *)(a1 + 32) unregisterChangeObserver:*(void *)(a1 + 40) context:&PUCMMActivityItemSourceSourceControllerObserverContext];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_23(uint64_t a1, void *a2, char a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = PLShareSheetGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    int v20 = 138412802;
    __int16 v21 = v10;
    __int16 v22 = 2048;
    uint64_t v23 = v11;
    __int16 v24 = 2114;
    uint64_t v25 = v12;
    id v13 = v10;
    _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "<%@:%p>: Finished preparing assets for activity: %{public}@", (uint8_t *)&v20, 0x20u);
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v7;
  id v16 = v7;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = a3;
  uint64_t v17 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v8;
  id v19 = v8;

  [*(id *)(a1 + 48) unregisterChangeObserver:*(void *)(a1 + 32) context:&PUCMMActivityItemSourceSourceControllerObserverContext];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __82__PUCMMActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_21(uint64_t a1, void *a2)
{
  return [a2 setState:2];
}

- (id)activityViewControllerOperation:(id)a3
{
  uint64_t v4 = [a3 activity];
  uint64_t v5 = [v4 activityType];
  uint64_t v6 = [[PUActivityItemSourceOperation alloc] initWithDelegate:self activityType:v5];
  [(PUCMMActivityItemSource *)self setPreparationOperation:v6];

  return v6;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  uint64_t v4 = [(PUCMMActivityItemSource *)self preparedItems];
  uint64_t v5 = [v4 firstObject];

  return v5;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  v3 = [(PUCMMActivityItemSource *)self placeholderItemsForActivityViewController:a3];
  uint64_t v4 = [v3 firstObject];

  return v4;
}

- (id)preparedItems
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PUCMMActivityItemSource *)self individuallyPreparedItems];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(PUCMMActivityItemSource *)self individuallyPreparedItems];
  }
  else
  {
    uint64_t v6 = [(PUCMMActivityItemSource *)self momentShareLink];

    if (v6)
    {
      id v7 = [(PUCMMActivityItemSource *)self momentShareLink];
      v9[0] = v7;
      uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    }
    else
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v5;
}

- (id)placeholderItemsForActivityViewController:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://share.icloud.com/photos/"];
  v6[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (PUCMMActivityItemSource)initWithActivityItemSourceController:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUCMMActivityItemSource;
  uint64_t v5 = [(PUCMMActivityItemSource *)&v11 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_itemSourceController, v4);
    id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.PUCMMActivityItemSource.isolationQueue", v7);
    externalIsolationQueue = v6->_externalIsolationQueue;
    v6->_externalIsolationQueue = (OS_dispatch_queue *)v8;
  }
  return v6;
}

@end