@interface SHSheetActivityPerformer
- (BOOL)_enqueueBackgroundOperationsIfNeeded;
- (BOOL)_presentPopoverContentViewController;
- (BOOL)_shouldExecuteItemOperation:(id)a3;
- (BOOL)isRunning;
- (NSArray)activityItemProviderOperations;
- (NSOperationQueue)activityItemProviderOperationQueue;
- (SHSheetActivityPerformer)initWithActivity:(id)a3 session:(id)a4;
- (SHSheetActivityPerformerDelegate)delegate;
- (SHSheetActivityPerformerPresentationInterface)presentationController;
- (SHSheetActivityPerformerResult)result;
- (SHSheetSession)session;
- (UIActivity)activity;
- (UIActivityViewController)activityViewController;
- (UIActivityViewController)retainedActivityViewController;
- (id)_resolvedActivityItems;
- (id)completionHandler;
- (int64_t)state;
- (unint64_t)backgroundTaskIdentifier;
- (unint64_t)beginPerformingActivityTimestamp;
- (void)_completePerformingActivityWithState:(int64_t)a3 returnedItems:(id)a4 error:(id)a5;
- (void)_configureActivityAfterPreparation;
- (void)_configureActivityBeforePreparation;
- (void)_didFinishAllBackgroundOperations;
- (void)_executeActivity;
- (void)_finishWithState:(int64_t)a3;
- (void)_handlePresentationCompletion;
- (void)_performPresentationWithViewController:(id)a3;
- (void)_prepareActivityPresentation;
- (void)_prepareActivityWithCompletion:(id)a3;
- (void)_start;
- (void)cancel;
- (void)dealloc;
- (void)finishWithSuccess:(BOOL)a3;
- (void)performWithCompletionHandler:(id)a3;
- (void)setActivityItemProviderOperationQueue:(id)a3;
- (void)setActivityItemProviderOperations:(id)a3;
- (void)setActivityViewController:(id)a3;
- (void)setBackgroundTaskIdentifier:(unint64_t)a3;
- (void)setBeginPerformingActivityTimestamp:(unint64_t)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentationController:(id)a3;
- (void)setResult:(id)a3;
- (void)setRetainedActivityViewController:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation SHSheetActivityPerformer

- (SHSheetActivityPerformer)initWithActivity:(id)a3 session:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SHSheetActivityPerformer;
  v9 = [(SHSheetActivityPerformer *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activity, a3);
    objc_storeWeak((id *)&v10->_session, v8);
    v11 = [v8 activityViewController];
    objc_storeWeak((id *)&v10->_activityViewController, v11);

    v10->_backgroundTaskIdentifier = *MEMORY[0x1E4FB2748];
  }

  return v10;
}

- (void)dealloc
{
  v3 = [(SHSheetActivityPerformer *)self activity];
  [v3 _cleanup];

  v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v4 endBackgroundTask:self->_backgroundTaskIdentifier];

  v5 = [(SHSheetActivityPerformer *)self presentationController];
  [v5 activityPerformCleanUpPresentation:self];

  v6.receiver = self;
  v6.super_class = (Class)SHSheetActivityPerformer;
  [(SHSheetActivityPerformer *)&v6 dealloc];
}

- (void)setActivityItemProviderOperationQueue:(id)a3
{
  v5 = (NSOperationQueue *)a3;
  activityItemProviderOperationQueue = self->_activityItemProviderOperationQueue;
  p_activityItemProviderOperationQueue = &self->_activityItemProviderOperationQueue;
  objc_super v6 = activityItemProviderOperationQueue;
  if (activityItemProviderOperationQueue != v5)
  {
    v9 = v5;
    [(NSOperationQueue *)v6 cancelAllOperations];
    objc_storeStrong((id *)p_activityItemProviderOperationQueue, a3);
    v5 = v9;
  }
  MEMORY[0x1F41817F8](v6, v5);
}

- (BOOL)isRunning
{
  int64_t v3 = [(SHSheetActivityPerformer *)self state];
  if (v3 != 1) {
    LOBYTE(v3) = [(SHSheetActivityPerformer *)self state] == 2;
  }
  return v3;
}

- (void)performWithCompletionHandler:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SHSheetActivityPerformer *)self setState:1];
  v5 = [(SHSheetActivityPerformer *)self activity];
  [(SHSheetActivityPerformer *)self setBeginPerformingActivityTimestamp:mach_continuous_time()];
  objc_super v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 activityType];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v5;
    __int16 v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "Performing activity %{public}@ (%{public}@)", buf, 0x16u);
  }
  [(SHSheetActivityPerformer *)self setCompletionHandler:v4];
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__SHSheetActivityPerformer_performWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E5A23098;
  objc_copyWeak(&v13, (id *)buf);
  [v5 setDidFinishPerformingActivityHandler:v12];
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v9 = [(SHSheetActivityPerformer *)self activityViewController];
  [v8 addObserver:self selector:sel__start name:@"_UIActivityViewControllerExecuteActivityNotification" object:v9];

  if (![v5 _needsResolvedActivityItems]) {
    goto LABEL_7;
  }
  v10 = [v5 activityType];
  if ([v10 isEqualToString:@"com.apple.DocumentManagerUICore.AddTagsActionExtension"])
  {

LABEL_7:
    [(SHSheetActivityPerformer *)self _executeActivity];
    goto LABEL_8;
  }
  BOOL v11 = [(SHSheetActivityPerformer *)self _enqueueBackgroundOperationsIfNeeded];

  if (!v11) {
    goto LABEL_7;
  }
LABEL_8:
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __57__SHSheetActivityPerformer_performWithCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  if (a2) {
    uint64_t v5 = 5;
  }
  else {
    uint64_t v5 = 4;
  }
  objc_super v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _completePerformingActivityWithState:v5 returnedItems:v8 error:v7];
}

- (void)cancel
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int64_t v3 = share_sheet_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SHSheetActivityPerformer *)self activity];
    uint64_t v5 = [(SHSheetActivityPerformer *)self activity];
    objc_super v6 = [v5 activityType];
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1A0AD8000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling activity %{public}@ (%{public}@)", (uint8_t *)&v7, 0x16u);
  }
  [(SHSheetActivityPerformer *)self _finishWithState:3];
}

- (void)finishWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = share_sheet_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = [(SHSheetActivityPerformer *)self activity];
    int v7 = [(SHSheetActivityPerformer *)self activity];
    id v8 = [v7 activityType];
    __int16 v9 = NSStringFromBOOL();
    int v11 = 138543874;
    v12 = v6;
    __int16 v13 = 2114;
    v14 = v8;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Finishing activity %{public}@ (%{public}@) with success:%@", (uint8_t *)&v11, 0x20u);
  }
  if (v3) {
    uint64_t v10 = 5;
  }
  else {
    uint64_t v10 = 4;
  }
  [(SHSheetActivityPerformer *)self _finishWithState:v10];
}

- (void)_finishWithState:(int64_t)a3
{
  uint64_t v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  objc_msgSend(v5, "endBackgroundTask:", -[SHSheetActivityPerformer backgroundTaskIdentifier](self, "backgroundTaskIdentifier"));

  [(SHSheetActivityPerformer *)self setBackgroundTaskIdentifier:*MEMORY[0x1E4FB2748]];
  objc_super v6 = (void *)MEMORY[0x1E4FBA8A8];
  int v7 = [(SHSheetActivityPerformer *)self activityViewController];
  [v6 cancelPreviousPerformRequestsWithTarget:v7];

  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self name:@"_UIActivityViewControllerExecuteActivityNotification" object:0];

  [(SHSheetActivityPerformer *)self setActivityItemProviderOperationQueue:0];
  [(SHSheetActivityPerformer *)self _completePerformingActivityWithState:a3 returnedItems:0 error:0];
}

- (void)_completePerformingActivityWithState:(int64_t)a3 returnedItems:(id)a4 error:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = share_sheet_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 5) {
      int v11 = 0;
    }
    else {
      int v11 = off_1E5A23108[a3];
    }
    v12 = [(SHSheetActivityPerformer *)self activity];
    __int16 v13 = [(SHSheetActivityPerformer *)self activity];
    v14 = [v13 activityType];
    int v21 = 138412802;
    v22 = (SHSheetActivityPerformer *)v11;
    __int16 v23 = 2114;
    int64_t v24 = (int64_t)v12;
    __int16 v25 = 2114;
    v26 = v14;
    _os_log_impl(&dword_1A0AD8000, v10, OS_LOG_TYPE_DEFAULT, "Completing with state:%@ %{public}@ (%{public}@)", (uint8_t *)&v21, 0x20u);
  }
  if ([(SHSheetActivityPerformer *)self state] < 3)
  {
    [(SHSheetActivityPerformer *)self setState:a3];
    v16 = [(SHSheetActivityPerformer *)self activity];
    [v16 setDidFinishPerformingActivityHandler:0];

    uint64_t v17 = [(SHSheetActivityPerformer *)self presentationController];
    [v17 activityPerformerStopListeningForDismissalTransition:self];

    v18 = [SHSheetActivityPerformerResult alloc];
    v19 = [(SHSheetActivityPerformer *)self activity];
    __int16 v15 = [(SHSheetActivityPerformerResult *)v18 initWithActivity:v19 completedState:a3 returnedItems:v8 error:v9];

    [(SHSheetActivityPerformer *)self setResult:v15];
    v20 = [(SHSheetActivityPerformer *)self completionHandler];
    ((void (**)(void, NSObject *))v20)[2](v20, v15);
    [(SHSheetActivityPerformer *)self setCompletionHandler:0];
    [(SHSheetActivityPerformer *)self setRetainedActivityViewController:0];
  }
  else
  {
    __int16 v15 = share_sheet_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412546;
      v22 = self;
      __int16 v23 = 2048;
      int64_t v24 = a3;
      _os_log_impl(&dword_1A0AD8000, v15, OS_LOG_TYPE_DEFAULT, "Activity Performer:%@ is already completed with state:%ld", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (id)_resolvedActivityItems
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SHSheetActivityPerformer *)self activity];
  id v4 = share_sheet_log();
  uint64_t v5 = share_sheet_log();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, v3);

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ResolveActivityItemValues", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
  }

  int v7 = share_sheet_log();
  id v8 = share_sheet_log();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, v3);

  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = [v3 activityType];
    int v21 = 138543362;
    v22 = v10;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ResolveActivityItemValuesWithType", "activityType=%{public, signpost.telemetry:string1}@", (uint8_t *)&v21, 0xCu);
  }
  int v11 = [(SHSheetActivityPerformer *)self session];
  v12 = [v11 activityItemsManager];
  __int16 v13 = [v12 activityItemValuesForActivity:v3];

  v14 = share_sheet_log();
  __int16 v15 = share_sheet_log();
  os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, v3);

  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v14, OS_SIGNPOST_INTERVAL_END, v16, "ResolveActivityItemValues", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
  }

  uint64_t v17 = share_sheet_log();
  v18 = share_sheet_log();
  os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v18, v3);

  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v17, OS_SIGNPOST_INTERVAL_END, v19, "ResolveActivityItemValuesWithType", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
  }

  return v13;
}

- (void)_executeActivity
{
  id v3 = [(SHSheetActivityPerformer *)self session];
  v2 = [v3 activityViewController];
  [v2 _executeActivity];
}

- (void)_start
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  [(SHSheetActivityPerformer *)self setState:2];
  id v3 = [(SHSheetActivityPerformer *)self activity];
  id v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 activityType];
    *(_DWORD *)buf = 138543618;
    __int16 v25 = v3;
    __int16 v26 = 2114;
    uint64_t v27 = v5;
    _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "Executing activity %{public}@ (%{public}@)", buf, 0x16u);
  }
  os_signpost_id_t v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v6 endBackgroundTask:self->_backgroundTaskIdentifier];

  self->_backgroundTaskIdentifier = *MEMORY[0x1E4FB2748];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v7 = [(SHSheetActivityPerformer *)self activityItemProviderOperations];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v20 + 1) + 8 * i) isCancelled])
        {
          LOBYTE(v8) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v32 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  [(SHSheetActivityPerformer *)self setActivityItemProviderOperations:0];
  int v11 = [(SHSheetActivityPerformer *)self presentationController];
  int v12 = [v11 activityPerformerCanPresent:self];

  if ((v8 & 1) != 0 || !v12)
  {
    __int16 v13 = share_sheet_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v3 activityType];
      __int16 v15 = NSStringFromBOOL();
      os_signpost_id_t v16 = NSStringFromBOOL();
      *(_DWORD *)buf = 138544130;
      __int16 v25 = v3;
      __int16 v26 = 2114;
      uint64_t v27 = v14;
      __int16 v28 = 2112;
      v29 = v15;
      __int16 v30 = 2112;
      v31 = v16;
      _os_log_impl(&dword_1A0AD8000, v13, OS_LOG_TYPE_DEFAULT, "Cancel activity %{public}@ (%{public}@) anyOperationWasCanceled:%@ canPresent:%@", buf, 0x2Au);
    }
    [(SHSheetActivityPerformer *)self cancel];
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __34__SHSheetActivityPerformer__start__block_invoke;
    v17[3] = &unk_1E5A215A0;
    id v18 = v3;
    os_signpost_id_t v19 = self;
    [(SHSheetActivityPerformer *)self _prepareActivityWithCompletion:v17];
  }
}

uint64_t __34__SHSheetActivityPerformer__start__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = share_sheet_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 activityType];
    int v6 = 138543618;
    int v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1A0AD8000, v2, OS_LOG_TYPE_DEFAULT, "Did prepare activity %{public}@ (%{public}@)", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1 + 40) _prepareActivityPresentation];
}

- (void)_prepareActivityWithCompletion:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SHSheetActivityPerformer *)self _resolvedActivityItems];
  int v6 = [(SHSheetActivityPerformer *)self activity];
  int v7 = [(SHSheetActivityPerformer *)self activityViewController];
  __int16 v8 = share_sheet_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v6 activityType];
    uint64_t v10 = SFGenerateTypeList();
    *(_DWORD *)buf = 138544131;
    *(void *)&uint8_t buf[4] = v6;
    __int16 v27 = 2114;
    __int16 v28 = v9;
    __int16 v29 = 2117;
    __int16 v30 = v5;
    __int16 v31 = 2114;
    v32 = v10;
    _os_log_impl(&dword_1A0AD8000, v8, OS_LOG_TYPE_DEFAULT, "Preparing activity %{public}@ (%{public}@) with activity items:%{sensitive}@ of types:%{public}@", buf, 0x2Au);
  }
  [(SHSheetActivityPerformer *)self _configureActivityBeforePreparation];
  int v11 = share_sheet_log();
  int v12 = share_sheet_log();
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, v6);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PrepareActivity", " enableTelemetry=YES ", buf, 2u);
  }

  v14 = share_sheet_log();
  __int16 v15 = share_sheet_log();
  os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, v6);

  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    uint64_t v17 = [v6 activityType];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v17;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PrepareActivityWithType", "activityType=%{public, signpost.telemetry:string1}@", buf, 0xCu);
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__SHSheetActivityPerformer__prepareActivityWithCompletion___block_invoke;
  v21[3] = &unk_1E5A22B38;
  objc_copyWeak(&v25, (id *)buf);
  id v18 = v6;
  id v22 = v18;
  id v19 = v7;
  id v23 = v19;
  id v20 = v4;
  id v24 = v20;
  [v18 _prepareWithActivityItems:v5 completion:v21];

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

void __59__SHSheetActivityPerformer__prepareActivityWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
    id v3 = share_sheet_log();
    id v4 = share_sheet_log();
    os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, *(const void **)(a1 + 32));

    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      LOWORD(v13) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v3, OS_SIGNPOST_INTERVAL_END, v5, "PrepareActivity", " enableTelemetry=YES ", (uint8_t *)&v13, 2u);
    }

    int v6 = share_sheet_log();
    int v7 = share_sheet_log();
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, *(const void **)(a1 + 32));

    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      LOWORD(v13) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v6, OS_SIGNPOST_INTERVAL_END, v8, "PrepareActivityWithType", " enableTelemetry=YES ", (uint8_t *)&v13, 2u);
    }

    [WeakRetained _configureActivityAfterPreparation];
    uint64_t v9 = share_sheet_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      int v12 = [v10 activityType];
      int v13 = 138412802;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      os_signpost_id_t v16 = v10;
      __int16 v17 = 2114;
      id v18 = v12;
      _os_log_impl(&dword_1A0AD8000, v9, OS_LOG_TYPE_DEFAULT, "Preparing activity view controller:%@ %{public}@ (%{public}@)", (uint8_t *)&v13, 0x20u);
    }
    [*(id *)(a1 + 40) _prepareActivity:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
  }
}

- (BOOL)_presentPopoverContentViewController
{
  id v3 = [(SHSheetActivityPerformer *)self activityViewController];
  id v4 = [v3 traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 6) {
    return 0;
  }
  if (!_ShareSheetPlatformPrefersPopover()) {
    return 0;
  }
  int v6 = [(SHSheetActivityPerformer *)self activity];
  int v7 = [v6 _embeddedActivityViewController];

  if (!v7) {
    return 0;
  }
  os_signpost_id_t v8 = [(SHSheetActivityPerformer *)self presentationController];
  char v9 = [v8 activityPerformer:self presentPopoverContentViewController:v7];

  return v9;
}

- (void)_prepareActivityPresentation
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = [(SHSheetActivityPerformer *)self activity];
  if ([(SHSheetActivityPerformer *)self _presentPopoverContentViewController])
  {
    id v4 = share_sheet_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [v3 activityType];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v3;
      __int16 v33 = 2114;
      v34 = v5;
      _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "Did present popover content for activity %{public}@ (%{public}@)", buf, 0x16u);
    }
  }
  else
  {
    int v6 = [(SHSheetActivityPerformer *)self activityViewController];
    int v7 = [v6 traitCollection];
    BOOL v8 = [v7 userInterfaceIdiom] == 6;

    char v9 = [v3 activityViewController];
    id v4 = v9;
    if (v8)
    {
      if (v9)
      {
        uint64_t v10 = v9;
      }
      else
      {
        uint64_t v10 = [v3 _embeddedActivityViewController];
      }
      uint64_t v11 = v10;

      id v4 = v11;
    }
    int v12 = [(SHSheetActivityPerformer *)self activityViewController];
    int v13 = [v3 activityType];
    int v14 = [v13 isEqualToString:@"com.apple.UIKit.activity.AirDrop"];

    __int16 v15 = share_sheet_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_id_t v16 = [v3 activityType];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v4;
      __int16 v33 = 2114;
      v34 = v3;
      __int16 v35 = 2114;
      v36 = v16;
      _os_log_impl(&dword_1A0AD8000, v15, OS_LOG_TYPE_DEFAULT, "Prepare activity presentation for view controller:%@ %{public}@ (%{public}@)", buf, 0x20u);
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    __int16 v17 = [(SHSheetActivityPerformer *)self presentationController];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __56__SHSheetActivityPerformer__prepareActivityPresentation__block_invoke;
    v29[3] = &unk_1E5A21AB8;
    id v18 = v3;
    id v30 = v18;
    objc_copyWeak(&v31, (id *)buf);
    [v17 activityPerformer:self startListeningForDismissalTransitionWithCompletion:v29];

    if (_ShareSheetIsSupportedPrintActivity(v18))
    {
      uint64_t v19 = [v12 _window];
      [v18 setWindowHoldingActivityViewController:v19];
    }
    id v20 = [(SHSheetActivityPerformer *)self session];
    char v21 = [v20 allowsEmbedding];
    if (v4) {
      char v22 = 1;
    }
    else {
      char v22 = v21;
    }
    if (v22) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = [v18 _managesOwnPresentation];
    }

    [v18 _willBePerformedOrPresented];
    id v24 = objc_alloc_init(SHSheetActivityPresentationContext);
    [(SHSheetActivityPresentationContext *)v24 setShouldDismissBeforePresentation:v14 ^ 1u];
    [(SHSheetActivityPresentationContext *)v24 setShouldPresentOverCurrentContext:v23];
    id v25 = [(SHSheetActivityPerformer *)self session];
    -[SHSheetActivityPresentationContext setIsCloudSharing:](v24, "setIsCloudSharing:", [v25 configureForCloudSharing]);

    if ([(SHSheetActivityPresentationContext *)v24 shouldDismissBeforePresentation]
      && ![(SHSheetActivityPresentationContext *)v24 shouldPresentOverCurrentContext])
    {
      __int16 v26 = [(SHSheetActivityPerformer *)self activityViewController];
      [(SHSheetActivityPerformer *)self setRetainedActivityViewController:v26];
    }
    __int16 v27 = [(SHSheetActivityPerformer *)self presentationController];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __56__SHSheetActivityPerformer__prepareActivityPresentation__block_invoke_2;
    v28[3] = &unk_1E5A230C0;
    v28[4] = self;
    [v27 activityPerformer:self preparePresentationWithContext:v24 completion:v28];

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);
  }
}

void __56__SHSheetActivityPerformer__prepareActivityPresentation__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _allowsAutoCancelOnDismiss])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained cancel];
  }
}

uint64_t __56__SHSheetActivityPerformer__prepareActivityPresentation__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _performPresentationWithViewController:a2];
}

- (void)_performPresentationWithViewController:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SHSheetActivityPerformer *)self activity];
  int v6 = share_sheet_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 activityType];
    *(_DWORD *)buf = 138412802;
    unint64_t v39 = (unint64_t)v4;
    __int16 v40 = 2114;
    v41 = v5;
    __int16 v42 = 2114;
    v43 = v7;
    _os_log_impl(&dword_1A0AD8000, v6, OS_LOG_TYPE_DEFAULT, "Perform presentation with view controller:%@ %{public}@ (%{public}@)", buf, 0x20u);
  }
  id location = 0;
  objc_initWeak(&location, self);
  BOOL v8 = [(SHSheetActivityPerformer *)self activity];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __67__SHSheetActivityPerformer__performPresentationWithViewController___block_invoke;
  v35[3] = &unk_1E5A21998;
  objc_copyWeak(&v36, &location);
  char v9 = [v8 _presentActivityOnViewController:v4 animated:1 completion:v35];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = [v5 activityViewController];
    int IsSupportedPrintActivity = _ShareSheetIsSupportedPrintActivity(v5);
    int v12 = [v5 activityType];
    int v13 = [v12 isEqualToString:@"com.apple.UIKit.activity.AirDrop"];

    if (v10) {
      int v14 = IsSupportedPrintActivity;
    }
    else {
      int v14 = 1;
    }
    if ((v14 | v13) == 1)
    {
      [v5 performActivity];
      __int16 v15 = share_sheet_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        os_signpost_id_t v16 = [v5 activityType];
        *(_DWORD *)buf = 138543618;
        unint64_t v39 = (unint64_t)v5;
        __int16 v40 = 2114;
        v41 = v16;
        _os_log_impl(&dword_1A0AD8000, v15, OS_LOG_TYPE_DEFAULT, "Performed non-UI activity %{public}@ (%{public}@)", buf, 0x16u);
      }
      __int16 v17 = share_sheet_log();
      id v18 = share_sheet_log();
      os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v18, v5);

      if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        unint64_t v20 = [(SHSheetActivityPerformer *)self beginPerformingActivityTimestamp];
        *(_DWORD *)buf = 134349056;
        unint64_t v39 = v20;
        _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v19, "PerformNonUIActivity", "%{public, signpost.description:begin_time}llu", buf, 0xCu);
      }

      char v21 = share_sheet_log();
      char v22 = share_sheet_log();
      os_signpost_id_t v23 = os_signpost_id_make_with_pointer(v22, v5);

      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v21, OS_SIGNPOST_INTERVAL_END, v23, "PerformNonUIActivity", " enableTelemetry=YES ", buf, 2u);
      }

      id v24 = share_sheet_log();
      id v25 = share_sheet_log();
      os_signpost_id_t v26 = os_signpost_id_make_with_pointer(v25, v5);

      if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        unint64_t v27 = [(SHSheetActivityPerformer *)self beginPerformingActivityTimestamp];
        __int16 v28 = [v5 activityType];
        *(_DWORD *)buf = 134349314;
        unint64_t v39 = v27;
        __int16 v40 = 2114;
        v41 = v28;
        _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v26, "PerformNonUIActivityWithType", "%{public, signpost.description:begin_time}llu activityType=%{public, signpost.telemetry:string1}@", buf, 0x16u);
      }
      __int16 v29 = share_sheet_log();
      id v30 = share_sheet_log();
      os_signpost_id_t v31 = os_signpost_id_make_with_pointer(v30, v5);

      if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v29, OS_SIGNPOST_INTERVAL_END, v31, "PerformNonUIActivityWithType", " enableTelemetry=YES ", buf, 2u);
      }
    }
    else
    {
      v32 = [(SHSheetActivityPerformer *)self presentationController];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __67__SHSheetActivityPerformer__performPresentationWithViewController___block_invoke_75;
      v33[3] = &unk_1E5A21998;
      objc_copyWeak(&v34, &location);
      [v32 activityPerformer:self presentViewController:v10 completion:v33];

      objc_destroyWeak(&v34);
    }
  }
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

void __67__SHSheetActivityPerformer__performPresentationWithViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePresentationCompletion];
}

void __67__SHSheetActivityPerformer__performPresentationWithViewController___block_invoke_75(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePresentationCompletion];
}

- (void)_handlePresentationCompletion
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(SHSheetActivityPerformer *)self activity];
  id v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 activityViewController];
    int v6 = [v3 activityType];
    int v24 = 138412802;
    unint64_t v25 = (unint64_t)v5;
    __int16 v26 = 2114;
    unint64_t v27 = v3;
    __int16 v28 = 2114;
    __int16 v29 = v6;
    _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "Presented view controller:%@ for UI activity %{public}@ (%{public}@)", (uint8_t *)&v24, 0x20u);
  }
  int v7 = share_sheet_log();
  BOOL v8 = share_sheet_log();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, v3);

  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    unint64_t v10 = [(SHSheetActivityPerformer *)self beginPerformingActivityTimestamp];
    int v24 = 134349056;
    unint64_t v25 = v10;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PerformUIActivity", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v24, 0xCu);
  }

  uint64_t v11 = share_sheet_log();
  int v12 = share_sheet_log();
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, v3);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v11, OS_SIGNPOST_INTERVAL_END, v13, "PerformUIActivity", " enableTelemetry=YES ", (uint8_t *)&v24, 2u);
  }

  int v14 = share_sheet_log();
  __int16 v15 = share_sheet_log();
  os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, v3);

  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    unint64_t v17 = [(SHSheetActivityPerformer *)self beginPerformingActivityTimestamp];
    id v18 = [v3 activityType];
    int v24 = 134349314;
    unint64_t v25 = v17;
    __int16 v26 = 2114;
    unint64_t v27 = v18;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PerformUIActivityWithType", "%{public, signpost.description:begin_time}llu activityType=%{public, signpost.telemetry:string1}@", (uint8_t *)&v24, 0x16u);
  }
  os_signpost_id_t v19 = share_sheet_log();
  unint64_t v20 = share_sheet_log();
  os_signpost_id_t v21 = os_signpost_id_make_with_pointer(v20, v3);

  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(v24) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v19, OS_SIGNPOST_INTERVAL_END, v21, "PerformUIActivityWithType", " enableTelemetry=YES ", (uint8_t *)&v24, 2u);
  }

  char v22 = [(SHSheetActivityPerformer *)self activityViewController];
  os_signpost_id_t v23 = [v22 _activityPresentationCompletionHandler];
  if (v23)
  {
    [v22 _setActivityPresentationCompletionHandler:0];
    v23[2](v23);
  }
}

- (void)_configureActivityBeforePreparation
{
  id v25 = [(SHSheetActivityPerformer *)self activity];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v25;
    id v4 = [(SHSheetActivityPerformer *)self session];
    objc_msgSend(v3, "setKeyboardVisible:", objc_msgSend(v4, "showKeyboardAutomatically"));
  }
  uint64_t v5 = [v25 activityType];
  int v6 = [v5 isEqualToString:@"com.apple.UIKit.activity.Message"];

  if (v6)
  {
    id v7 = v25;
    BOOL v8 = [(SHSheetActivityPerformer *)self delegate];
    os_signpost_id_t v9 = [v8 linkMetadataForActivityPerformer:self];
    [v7 setLinkMetadata:v9];

    unint64_t v10 = [(SHSheetActivityPerformer *)self session];
    uint64_t v11 = [v10 currentPeopleSuggestion];
    [v7 setPeopleSuggestion:v11];
  }
  int v12 = [(SHSheetActivityPerformer *)self session];
  int v13 = [v12 supportsCollaboration];

  if (v13)
  {
    int v14 = [(SHSheetActivityPerformer *)self session];
    __int16 v15 = [v14 collaborationItem];

    if (objc_opt_respondsToSelector()) {
      [v25 setCollaborationItem:v15];
    }
    if (objc_opt_respondsToSelector())
    {
      id v16 = v25;
      unint64_t v17 = [(SHSheetActivityPerformer *)self session];
      objc_msgSend(v16, "setIsCollaborative:", objc_msgSend(v17, "isCollaborative"));
    }
    if (objc_opt_respondsToSelector())
    {
      id v18 = v25;
      os_signpost_id_t v19 = [(SHSheetActivityPerformer *)self delegate];
      unint64_t v20 = [v19 collaborationServiceForActivityPerformer:self];

      [v18 setCollaborationService:v20];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      os_signpost_id_t v21 = [v25 activityType];
      int v22 = [v21 isEqualToString:*MEMORY[0x1E4F9F730]];

      if (v22)
      {
        if (![v15 type])
        {
          id v23 = v25;
          int v24 = [v15 fileURL];
          [v23 setOriginalFileURL:v24];
        }
      }
    }
  }
}

- (void)_configureActivityAfterPreparation
{
  id v17 = [(SHSheetActivityPerformer *)self activity];
  if (objc_opt_respondsToSelector())
  {
    id v3 = v17;
    id v4 = [(SHSheetActivityPerformer *)self session];
    uint64_t v5 = [v4 identifier];
    [v3 setSessionID:v5];
  }
  if (objc_opt_respondsToSelector())
  {
    id v6 = v17;
    id v7 = [(SHSheetActivityPerformer *)self session];
    BOOL v8 = [v7 activityItemsManager];
    os_signpost_id_t v9 = [v8 recipientsHandlesForActivity:v6];
    [v6 setRecipients:v9];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v10 = [(SHSheetActivityPerformer *)self session];
    uint64_t v11 = [v10 activityItemsManager];
    int v12 = [v11 subjectForActivity:v17];

    if (v12
      || ([(SHSheetActivityPerformer *)self activityViewController],
          int v13 = objc_claimAutoreleasedReturnValue(),
          [v13 subject],
          int v12 = objc_claimAutoreleasedReturnValue(),
          v13,
          v12))
    {
      [v17 _setMailSubject:v12];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v14 = [(SHSheetActivityPerformer *)self session];
    __int16 v15 = [v14 activityItemsManager];
    id v16 = [v15 initialSocialTextForActivity:v17];

    [v17 setInitialText:v16];
  }
}

- (BOOL)_enqueueBackgroundOperationsIfNeeded
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(SHSheetActivityPerformer *)self activity];
  uint64_t v5 = [(SHSheetActivityPerformer *)self session];
  id v6 = [v5 activityItemsManager];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __64__SHSheetActivityPerformer__enqueueBackgroundOperationsIfNeeded__block_invoke;
  v29[3] = &unk_1E5A230E8;
  id v7 = v4;
  id v30 = v7;
  os_signpost_id_t v31 = self;
  id v8 = v3;
  id v32 = v8;
  [v6 enumerateBackgroundOperationsForActivity:v7 enumerator:v29];

  os_signpost_id_t v9 = [(SHSheetActivityPerformer *)self activityItemProviderOperationQueue];

  if (v9)
  {
    unint64_t v10 = (void *)[v8 copy];
    [(SHSheetActivityPerformer *)self setActivityItemProviderOperations:v10];

    uint64_t v11 = [MEMORY[0x1E4FB1438] sharedApplication];
    -[SHSheetActivityPerformer setBackgroundTaskIdentifier:](self, "setBackgroundTaskIdentifier:", [v11 beginBackgroundTaskWithExpirationHandler:&__block_literal_global_32]);

    int v12 = share_sheet_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v13 = [(NSOperationQueue *)self->_activityItemProviderOperationQueue operationCount];
      *(_DWORD *)buf = 134349056;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl(&dword_1A0AD8000, v12, OS_LOG_TYPE_DEFAULT, "Starting load of %{public}ld activity item providers", buf, 0xCu);
    }

    int v14 = share_sheet_log();
    __int16 v15 = share_sheet_log();
    os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, self->_activityItemProviderOperationQueue);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "LoadActivityItemProviders", " enableTelemetry=YES ", buf, 2u);
    }

    id v17 = share_sheet_log();
    id v18 = share_sheet_log();
    os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v18, self->_activityItemProviderOperationQueue);

    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      unint64_t v20 = [v7 activityType];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v20;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v19, "LoadActivityItemProvidersWithType", "activityType=%{public, signpost.telemetry:string1}@", buf, 0xCu);
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    os_signpost_id_t v21 = [(SHSheetActivityPerformer *)self activityItemProviderOperationQueue];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    __int16 v26 = __64__SHSheetActivityPerformer__enqueueBackgroundOperationsIfNeeded__block_invoke_97;
    unint64_t v27 = &unk_1E5A21998;
    objc_copyWeak(&v28, (id *)buf);
    [v21 addOperationWithBlock:&v24];

    int v22 = [(SHSheetActivityPerformer *)self activityItemProviderOperationQueue];
    [v22 setSuspended:0];

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }

  return v9 != 0;
}

void __64__SHSheetActivityPerformer__enqueueBackgroundOperationsIfNeeded__block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = share_sheet_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    __int16 v15 = [a1[4] activityType];
    int v16 = 138412803;
    id v17 = v6;
    __int16 v18 = 2113;
    id v19 = v5;
    __int16 v20 = 2112;
    os_signpost_id_t v21 = v15;
    _os_log_debug_impl(&dword_1A0AD8000, v7, OS_LOG_TYPE_DEBUG, "enumerate background operation:%@ for activityItem:%{private}@ activityType:%@", (uint8_t *)&v16, 0x20u);
  }
  if ([a1[5] _shouldExecuteItemOperation:v6])
  {
    if (([v6 isFinished] & 1) != 0
      || ([v6 isExecuting] & 1) != 0
      || ([*((id *)a1[5] + 10) operations],
          id v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [v8 containsObject:v6],
          v8,
          (v9 & 1) != 0))
    {
      unint64_t v10 = share_sheet_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138477827;
        id v17 = v5;
        _os_log_impl(&dword_1A0AD8000, v10, OS_LOG_TYPE_DEFAULT, "Warning - UIActivityItemProvider %{private}@ ignored (duplicate, executing or finished)", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      if (!*((void *)a1[5] + 10))
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4F28F08]);
        int v12 = a1[5];
        NSUInteger v13 = (void *)v12[10];
        v12[10] = v11;

        [*((id *)a1[5] + 10) setName:@"com.apple.UIActivityOperationQueue"];
        [*((id *)a1[5] + 10) setMaxConcurrentOperationCount:1];
        [*((id *)a1[5] + 10) setSuspended:1];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v14 = [a1[4] activityType];
        [v6 _setActivityType:v14];
      }
      [a1[6] addObject:v6];
      [*((id *)a1[5] + 10) addOperation:v6];
    }
  }
}

void __64__SHSheetActivityPerformer__enqueueBackgroundOperationsIfNeeded__block_invoke_97(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didFinishAllBackgroundOperations];
}

- (BOOL)_shouldExecuteItemOperation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(SHSheetActivityPerformer *)self activity];
    char v7 = [v5 _shouldExecuteItemOperationForActivity:v6];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)_didFinishAllBackgroundOperations
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__SHSheetActivityPerformer__didFinishAllBackgroundOperations__block_invoke;
  block[3] = &unk_1E5A21900;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __61__SHSheetActivityPerformer__didFinishAllBackgroundOperations__block_invoke(uint64_t a1)
{
  v2 = share_sheet_log();
  id v3 = share_sheet_log();
  id v4 = [*(id *)(a1 + 32) activityItemProviderOperationQueue];
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v3, v4);

  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v2, OS_SIGNPOST_INTERVAL_END, v5, "LoadActivityItemProviders", " enableTelemetry=YES ", buf, 2u);
  }

  id v6 = share_sheet_log();
  char v7 = share_sheet_log();
  id v8 = [*(id *)(a1 + 32) activityItemProviderOperationQueue];
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v7, v8);

  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)NSUInteger v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v6, OS_SIGNPOST_INTERVAL_END, v9, "LoadActivityItemProvidersWithType", " enableTelemetry=YES ", v13, 2u);
  }

  unint64_t v10 = share_sheet_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v12 = 0;
    _os_log_impl(&dword_1A0AD8000, v10, OS_LOG_TYPE_DEFAULT, "Finished load of activity item providers", v12, 2u);
  }

  [*(id *)(a1 + 32) setActivityItemProviderOperationQueue:0];
  return [*(id *)(a1 + 32) _executeActivity];
}

- (UIActivity)activity
{
  return self->_activity;
}

- (SHSheetSession)session
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_session);
  return (SHSheetSession *)WeakRetained;
}

- (SHSheetActivityPerformerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SHSheetActivityPerformerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SHSheetActivityPerformerPresentationInterface)presentationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationController);
  return (SHSheetActivityPerformerPresentationInterface *)WeakRetained;
}

- (void)setPresentationController:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (SHSheetActivityPerformerResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (UIActivityViewController)activityViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityViewController);
  return (UIActivityViewController *)WeakRetained;
}

- (void)setActivityViewController:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSArray)activityItemProviderOperations
{
  return self->_activityItemProviderOperations;
}

- (void)setActivityItemProviderOperations:(id)a3
{
}

- (NSOperationQueue)activityItemProviderOperationQueue
{
  return self->_activityItemProviderOperationQueue;
}

- (unint64_t)backgroundTaskIdentifier
{
  return self->_backgroundTaskIdentifier;
}

- (void)setBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_backgroundTaskIdentifier = a3;
}

- (unint64_t)beginPerformingActivityTimestamp
{
  return self->_beginPerformingActivityTimestamp;
}

- (void)setBeginPerformingActivityTimestamp:(unint64_t)a3
{
  self->_beginPerformingActivityTimestamp = a3;
}

- (UIActivityViewController)retainedActivityViewController
{
  return self->_retainedActivityViewController;
}

- (void)setRetainedActivityViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedActivityViewController, 0);
  objc_storeStrong((id *)&self->_activityItemProviderOperationQueue, 0);
  objc_storeStrong((id *)&self->_activityItemProviderOperations, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_activityViewController);
  objc_storeStrong((id *)&self->_result, 0);
  objc_destroyWeak((id *)&self->_presentationController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end