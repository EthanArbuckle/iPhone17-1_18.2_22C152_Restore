@interface TFFeedbackSession
- (ASDBetaAppLaunchInfo)launchInfo;
- (BOOL)didSnapshot;
- (BOOL)forcePrefilledEmailViewVariant;
- (BOOL)isWaitingOnAggregatorForSubmission;
- (NSString)bundleIdentifier;
- (NSString)logKey;
- (NSURL)bundleURL;
- (TFDataAggregator)aggregator;
- (TFFeedbackDataContainer)dataContainer;
- (TFFeedbackFormViewController)activeFormViewController;
- (TFFeedbackSession)initWithBetaApplicationIdentifier:(id)a3;
- (TFFeedbackSessionDelegate)delegate;
- (TFFeedbackSubmissionService)submissionService;
- (id)_associatePrefilledEmailIfNeeded;
- (id)_currentContextStringDescription;
- (id)_developerName;
- (id)_displayableErrorMessageFromService:(id)a3 submissionError:(id)a4;
- (id)_generateFormForCurrentState;
- (id)createFeedbackViewControllerForCurrentState;
- (id)initForContext:(unint64_t)a3 betaApplicationBundleURL:(id)a4;
- (id)initForContext:(unint64_t)a3 betaApplicationIdentifier:(id)a4;
- (id)initForContext:(unint64_t)a3 betaApplicationLoadableBundleURL:(id)a4;
- (id)initForContext:(unint64_t)a3 withTestingWithLaunchInfo:(id)a4;
- (unint64_t)context;
- (unint64_t)currentPhase;
- (void)_abortFeedbackSubmissionForViewController:(id)a3 withError:(id)a4;
- (void)_beginFeedbackSubmisionForViewController:(id)a3;
- (void)_finishFeedbackSubmissionForViewController:(id)a3;
- (void)associateComments:(id)a3;
- (void)associateEmail:(id)a3;
- (void)associateIncidentId:(id)a3;
- (void)associateScreenshotImages:(id)a3;
- (void)cancelFeedbackForActiveFormViewController;
- (void)commonInitWithContext:(unint64_t)a3;
- (void)dataAggregator:(id)a3 didCompleteTasks:(id)a4;
- (void)initiateFeedbackSnapshot;
- (void)setActiveFormViewController:(id)a3;
- (void)setCurrentPhase:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDidSnapshot:(BOOL)a3;
- (void)setForcePrefilledEmailViewVariant:(BOOL)a3;
- (void)setWaitingOnAggregatorForSubmission:(BOOL)a3;
- (void)submitCrashFeedback;
- (void)submitFeedbackForActiveFormViewController;
@end

@implementation TFFeedbackSession

- (id)initForContext:(unint64_t)a3 betaApplicationIdentifier:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TFFeedbackSession;
  v7 = [(TFFeedbackSession *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;

    [(TFFeedbackSession *)v7 commonInitWithContext:a3];
  }

  return v7;
}

- (id)initForContext:(unint64_t)a3 betaApplicationLoadableBundleURL:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TFFeedbackSession;
  v7 = [(TFFeedbackSession *)&v15 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    bundleURL = v7->_bundleURL;
    v7->_bundleURL = (NSURL *)v8;

    v10 = +[TFBundle bundleIdentifierForBundleURL:v6];
    uint64_t v11 = [v10 copy];
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v11;

    if (!v7->_bundleIdentifier)
    {
      v13 = 0;
      goto LABEL_6;
    }
    [(TFFeedbackSession *)v7 commonInitWithContext:a3];
  }
  v13 = v7;
LABEL_6:

  return v13;
}

- (id)initForContext:(unint64_t)a3 withTestingWithLaunchInfo:(id)a4
{
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TFFeedbackSession;
  uint64_t v8 = [(TFFeedbackSession *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_launchInfo, a4);
    v10 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v11 = [v10 bundleURL];
    bundleURL = v9->_bundleURL;
    v9->_bundleURL = (NSURL *)v11;

    v13 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v14 = [v13 bundleIdentifier];
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v14;

    [(TFFeedbackSession *)v9 commonInitWithContext:a3];
  }

  return v9;
}

- (void)commonInitWithContext:(unint64_t)a3
{
  self->_context = a3;
  AMSGenerateLogCorrelationKey();
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  logKey = self->_logKey;
  self->_logKey = v4;

  *(_WORD *)&self->_didSnapshot = 0;
  self->_currentPhase = 0;
  id v6 = [[TFFeedbackDataContainer alloc] initWithName:@"main"];
  dataContainer = self->_dataContainer;
  self->_dataContainer = v6;

  uint64_t v8 = [[TFDataAggregator alloc] initWithSessionDataContainer:self->_dataContainer];
  aggregator = self->_aggregator;
  self->_aggregator = v8;

  [(TFDataAggregator *)self->_aggregator setDelegate:self];
  v10 = objc_alloc_init(ASDTFFeedbackSubmissionService);
  submissionService = self->_submissionService;
  self->_submissionService = (TFFeedbackSubmissionService *)v10;

  objc_storeWeak((id *)&self->_activeFormViewController, 0);
}

- (void)initiateFeedbackSnapshot
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = +[TFLogConfiguration defaultConfiguration];
  v4 = [v3 generatedLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    id v7 = [(TFFeedbackSession *)self bundleIdentifier];
    uint64_t v8 = [(TFFeedbackSession *)self logKey];
    int v11 = 138543874;
    v12 = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_223064000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] initiateFeedbackSnapshot", (uint8_t *)&v11, 0x20u);
  }
  [(TFFeedbackSession *)self setDidSnapshot:1];
  v9 = +[TFDataAggregationTask snapshotTasksForSession:self];
  v10 = [(TFFeedbackSession *)self aggregator];
  [v10 runTasks:v9];
}

- (void)associateIncidentId:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[TFLogConfiguration defaultConfiguration];
  id v6 = [v5 generatedLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    v9 = [(TFFeedbackSession *)self bundleIdentifier];
    v10 = [(TFFeedbackSession *)self logKey];
    *(_DWORD *)buf = 138544130;
    v16 = v7;
    __int16 v17 = 2114;
    v18 = v9;
    __int16 v19 = 2112;
    v20 = v10;
    __int16 v21 = 2114;
    id v22 = v4;
    _os_log_impl(&dword_223064000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] associateIncidentId incidentId=%{public}@", buf, 0x2Au);
  }
  int v11 = [(TFFeedbackSession *)self dataContainer];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __41__TFFeedbackSession_associateIncidentId___block_invoke;
  v13[3] = &unk_26468E7D8;
  id v14 = v4;
  id v12 = v4;
  [v11 performBatchUpdates:v13];
}

uint64_t __41__TFFeedbackSession_associateIncidentId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStringForIdentifier:@"d" toValue:*(void *)(a1 + 32)];
}

- (void)associateScreenshotImages:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[TFLogConfiguration defaultConfiguration];
  id v6 = [v5 generatedLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    v9 = [(TFFeedbackSession *)self bundleIdentifier];
    v10 = [(TFFeedbackSession *)self logKey];
    *(_DWORD *)buf = 138543874;
    v16 = v7;
    __int16 v17 = 2114;
    v18 = v9;
    __int16 v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_223064000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] associateScreenshotImages", buf, 0x20u);
  }
  int v11 = [(TFFeedbackSession *)self dataContainer];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__TFFeedbackSession_associateScreenshotImages___block_invoke;
  v13[3] = &unk_26468E7D8;
  id v14 = v4;
  id v12 = v4;
  [v11 performBatchUpdates:v13];
}

uint64_t __47__TFFeedbackSession_associateScreenshotImages___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setImageCollectionForIdentifier:@"c" toValue:*(void *)(a1 + 32)];
}

- (void)associateComments:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[TFLogConfiguration defaultConfiguration];
  id v6 = [v5 generatedLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    v9 = [(TFFeedbackSession *)self bundleIdentifier];
    v10 = [(TFFeedbackSession *)self logKey];
    *(_DWORD *)buf = 138544130;
    v16 = v7;
    __int16 v17 = 2114;
    v18 = v9;
    __int16 v19 = 2112;
    v20 = v10;
    __int16 v21 = 2114;
    id v22 = v4;
    _os_log_impl(&dword_223064000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] associateComments comments=%{public}@", buf, 0x2Au);
  }
  int v11 = [(TFFeedbackSession *)self dataContainer];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __39__TFFeedbackSession_associateComments___block_invoke;
  v13[3] = &unk_26468E7D8;
  id v14 = v4;
  id v12 = v4;
  [v11 performBatchUpdates:v13];
}

uint64_t __39__TFFeedbackSession_associateComments___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStringForIdentifier:@"b" toValue:*(void *)(a1 + 32)];
}

- (void)associateEmail:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[TFLogConfiguration defaultConfiguration];
  id v6 = [v5 generatedLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    v9 = [(TFFeedbackSession *)self bundleIdentifier];
    v10 = [(TFFeedbackSession *)self logKey];
    *(_DWORD *)buf = 138543874;
    v16 = v7;
    __int16 v17 = 2114;
    v18 = v9;
    __int16 v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_223064000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] associateEmail", buf, 0x20u);
  }
  int v11 = [(TFFeedbackSession *)self dataContainer];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __36__TFFeedbackSession_associateEmail___block_invoke;
  v13[3] = &unk_26468E7D8;
  id v14 = v4;
  id v12 = v4;
  [v11 performBatchUpdates:v13];
}

uint64_t __36__TFFeedbackSession_associateEmail___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStringForIdentifier:@"a" toValue:*(void *)(a1 + 32)];
}

- (id)createFeedbackViewControllerForCurrentState
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v3 = +[TFLogConfiguration defaultConfiguration];
  id v4 = [v3 generatedLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    id v7 = [(TFFeedbackSession *)self bundleIdentifier];
    id v8 = [(TFFeedbackSession *)self logKey];
    int v25 = 138543874;
    v26 = v5;
    __int16 v27 = 2114;
    v28 = v7;
    __int16 v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_223064000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] createFeedbackViewControllerForCurrentState", (uint8_t *)&v25, 0x20u);
  }
  if (![(TFFeedbackSession *)self didSnapshot]) {
    [(TFFeedbackSession *)self initiateFeedbackSnapshot];
  }
  v9 = +[TFDataAggregationTask anytimeTasksForSession:self];
  v10 = [(TFFeedbackSession *)self aggregator];
  [v10 runTasks:v9];

  int v11 = [(TFFeedbackSession *)self _generateFormForCurrentState];
  id v12 = [(TFFeedbackSession *)self dataContainer];
  [v12 prepareInitialValuesForForm:v11];

  __int16 v13 = [(TFFeedbackSession *)self activeFormViewController];

  if (v13)
  {
    id v14 = +[TFLogConfiguration defaultConfiguration];
    __int16 v15 = [v14 generatedLogger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_opt_class();
      id v17 = v16;
      v18 = [(TFFeedbackSession *)self bundleIdentifier];
      __int16 v19 = [(TFFeedbackSession *)self logKey];
      int v25 = 138543874;
      v26 = v16;
      __int16 v27 = 2114;
      v28 = v18;
      __int16 v29 = 2112;
      v30 = v19;
      _os_log_impl(&dword_223064000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@:%@] Error - createFeedbackViewControllerForCurrentState is called when earlier view controller is still in alive. Deallocate earlier view controller.", (uint8_t *)&v25, 0x20u);
    }
  }
  [(TFFeedbackSession *)self setCurrentPhase:0];
  v20 = [TFFeedbackFormPresenter alloc];
  uint64_t v21 = [(TFFeedbackSession *)self dataContainer];
  id v22 = [(TFFeedbackFormPresenter *)v20 initWithForm:v11 dataContainer:v21 session:self];

  uint64_t v23 = [[TFFeedbackFormViewController alloc] initWithPresenter:v22];
  [(TFFeedbackFormPresenter *)v22 setPresenterView:v23];
  [(TFFeedbackSession *)self setActiveFormViewController:v23];

  return v23;
}

- (void)submitCrashFeedback
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = +[TFLogConfiguration defaultConfiguration];
  id v4 = [v3 generatedLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    id v7 = [(TFFeedbackSession *)self bundleIdentifier];
    id v8 = [(TFFeedbackSession *)self logKey];
    int v12 = 138543874;
    __int16 v13 = v5;
    __int16 v14 = 2114;
    __int16 v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_223064000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] submitCrashFeedback", (uint8_t *)&v12, 0x20u);
  }
  id v9 = [(TFFeedbackSession *)self _associatePrefilledEmailIfNeeded];
  if (![(TFFeedbackSession *)self didSnapshot]) {
    [(TFFeedbackSession *)self initiateFeedbackSnapshot];
  }
  v10 = +[TFDataAggregationTask anytimeTasksForSession:self];
  int v11 = [(TFFeedbackSession *)self aggregator];
  [v11 runTasks:v10];

  [(TFFeedbackSession *)self setCurrentPhase:0];
  [(TFFeedbackSession *)self _beginFeedbackSubmisionForViewController:0];
}

- (void)submitFeedbackForActiveFormViewController
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = +[TFLogConfiguration defaultConfiguration];
  id v4 = [v3 generatedLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    id v7 = [(TFFeedbackSession *)self bundleIdentifier];
    id v8 = [(TFFeedbackSession *)self logKey];
    int v16 = 138543874;
    id v17 = v5;
    __int16 v18 = 2114;
    __int16 v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    _os_log_impl(&dword_223064000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] submitFeedbackForActiveFormViewController", (uint8_t *)&v16, 0x20u);
  }
  id v9 = [(TFFeedbackSession *)self activeFormViewController];

  if (v9)
  {
    v10 = [(TFFeedbackSession *)self activeFormViewController];
    [(TFFeedbackSession *)self _beginFeedbackSubmisionForViewController:v10];
  }
  else
  {
    v10 = +[TFLogConfiguration defaultConfiguration];
    int v11 = [v10 generatedLogger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = objc_opt_class();
      id v13 = v12;
      __int16 v14 = [(TFFeedbackSession *)self bundleIdentifier];
      __int16 v15 = [(TFFeedbackSession *)self logKey];
      int v16 = 138543874;
      id v17 = v12;
      __int16 v18 = 2114;
      __int16 v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      _os_log_impl(&dword_223064000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@:%@] submitFeedbackForActiveFormViewController called when there was no active UI.", (uint8_t *)&v16, 0x20u);
    }
  }
}

- (void)cancelFeedbackForActiveFormViewController
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = +[TFLogConfiguration defaultConfiguration];
  id v4 = [v3 generatedLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    id v7 = [(TFFeedbackSession *)self bundleIdentifier];
    id v8 = [(TFFeedbackSession *)self logKey];
    int v16 = 138543874;
    id v17 = v5;
    __int16 v18 = 2114;
    __int16 v19 = v7;
    __int16 v20 = 2112;
    uint64_t v21 = v8;
    _os_log_impl(&dword_223064000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] cancelFeedbackForActiveFormViewController", (uint8_t *)&v16, 0x20u);
  }
  [(TFFeedbackSession *)self setCurrentPhase:0];
  id v9 = [(TFFeedbackSession *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  int v11 = [(TFFeedbackSession *)self delegate];
  int v12 = v11;
  if (v10)
  {
    [v11 sessionDidCancelFeedback:self];
  }
  else
  {
    char v13 = objc_opt_respondsToSelector();

    int v12 = [(TFFeedbackSession *)self delegate];
    if (v13)
    {
      __int16 v14 = [(TFFeedbackSession *)self activeFormViewController];
      [v12 session:self didCancelFeedbackFromViewController:v14];
    }
    else
    {
      char v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) == 0) {
        return;
      }
      int v12 = [(TFFeedbackSession *)self delegate];
      __int16 v14 = [(TFFeedbackSession *)self activeFormViewController];
      [v12 session:self didSubmitFeedbackFromViewController:v14];
    }
  }
}

- (id)_developerName
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F01878]);
  id v4 = [(TFFeedbackSession *)self bundleIdentifier];
  id v13 = 0;
  v5 = (void *)[v3 initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v13];
  id v6 = v13;

  if (!v5)
  {
    id v7 = +[TFLogConfiguration defaultConfiguration];
    id v8 = [v7 generatedLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [(TFFeedbackSession *)self bundleIdentifier];
      *(_DWORD *)buf = 138412546;
      char v15 = v9;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_223064000, v8, OS_LOG_TYPE_ERROR, "Failed to load application record for %@: %@", buf, 0x16u);
    }
  }
  char v10 = [v5 iTunesMetadata];
  int v11 = [v10 artistName];

  return v11;
}

- (id)_associatePrefilledEmailIfNeeded
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(TFFeedbackSession *)self launchInfo];
  uint64_t v4 = [v3 testerEmail];
  v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = &stru_26D6133F8;
  }
  id v7 = v6;

  id v8 = [MEMORY[0x263F25528] sharedInstance];
  id v9 = [(TFFeedbackSession *)self bundleIdentifier];
  uint64_t v10 = [v8 getEmailAddressForBundleID:v9];
  int v11 = (void *)v10;
  if (v10) {
    int v12 = (__CFString *)v10;
  }
  else {
    int v12 = &stru_26D6133F8;
  }
  id v13 = v12;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v26[0] = v7;
  v26[1] = v13;
  __int16 v14 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v26, 2, 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        __int16 v19 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (v19 && [*(id *)(*((void *)&v22 + 1) + 8 * i) length])
        {
          [(TFFeedbackSession *)self associateEmail:v19];
          id v20 = v19;
          goto LABEL_18;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  id v20 = 0;
LABEL_18:

  return v20;
}

- (id)_generateFormForCurrentState
{
  id v3 = objc_alloc_init(TFFeedbackFormBuilder);
  uint64_t v4 = [(TFFeedbackSession *)self _developerName];
  v5 = [(TFFeedbackSession *)self _associatePrefilledEmailIfNeeded];
  id v6 = [(TFFeedbackSession *)self dataContainer];
  id v7 = [v6 imageCollectionForIdentifer:@"c"];

  id v8 = (void *)MEMORY[0x263EFFA68];
  if (v7)
  {
    uint64_t v9 = [v7 count];
    BOOL v10 = v9 != 0;
    if (v9) {
      id v8 = v7;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
  [(TFFeedbackSession *)self associateScreenshotImages:v8];
  int v11 = [(TFFeedbackFormBuilder *)v3 buildFormForContext:[(TFFeedbackSession *)self context] withDeveloperName:v4 prefilledEmail:v5 hasScreenshots:v10];

  return v11;
}

- (void)_beginFeedbackSubmisionForViewController:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = +[TFLogConfiguration defaultConfiguration];
  id v6 = [v5 generatedLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    uint64_t v9 = [(TFFeedbackSession *)self bundleIdentifier];
    BOOL v10 = [(TFFeedbackSession *)self logKey];
    int v11 = [(TFFeedbackSession *)self _currentContextStringDescription];
    *(_DWORD *)buf = 138544386;
    __int16 v27 = v7;
    __int16 v28 = 2114;
    __int16 v29 = v9;
    __int16 v30 = 2112;
    uint64_t v31 = v10;
    __int16 v32 = 2112;
    id v33 = v4;
    __int16 v34 = 2112;
    v35 = v11;
    _os_log_impl(&dword_223064000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] _beginFeedbackSubmisionForViewController: formViewController=%@ context=%@", buf, 0x34u);
  }
  [(TFFeedbackSession *)self setCurrentPhase:1];
  int v12 = [(TFFeedbackSession *)self dataContainer];
  int v13 = [v12 isLoading];

  if (v13)
  {
    __int16 v14 = +[TFLogConfiguration defaultConfiguration];
    uint64_t v15 = [v14 generatedLogger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = objc_opt_class();
      id v17 = v16;
      uint64_t v18 = [(TFFeedbackSession *)self bundleIdentifier];
      __int16 v19 = [(TFFeedbackSession *)self logKey];
      *(_DWORD *)buf = 138543874;
      __int16 v27 = v16;
      __int16 v28 = 2114;
      __int16 v29 = v18;
      __int16 v30 = 2112;
      uint64_t v31 = v19;
      _os_log_impl(&dword_223064000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] Waiting for aggregator to complete", buf, 0x20u);
    }
    [(TFFeedbackSession *)self setWaitingOnAggregatorForSubmission:1];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    id v20 = [(TFFeedbackSession *)self submissionService];
    uint64_t v21 = [(TFFeedbackSession *)self bundleIdentifier];
    long long v22 = [(TFFeedbackSession *)self dataContainer];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __62__TFFeedbackSession__beginFeedbackSubmisionForViewController___block_invoke;
    v23[3] = &unk_26468ED38;
    objc_copyWeak(&v25, (id *)buf);
    id v24 = v4;
    [v20 submitFeedbackForBundleId:v21 withContentsOfDataSource:v22 completionHandler:v23];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
}

void __62__TFFeedbackSession__beginFeedbackSubmisionForViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__TFFeedbackSession__beginFeedbackSubmisionForViewController___block_invoke_2;
  block[3] = &unk_26468ED10;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

void __62__TFFeedbackSession__beginFeedbackSubmisionForViewController___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = WeakRetained;
  if (v2) {
    [WeakRetained _abortFeedbackSubmissionForViewController:v4 withError:*(void *)(a1 + 32)];
  }
  else {
    [WeakRetained _finishFeedbackSubmissionForViewController:v4];
  }
}

- (void)_abortFeedbackSubmissionForViewController:(id)a3 withError:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[TFLogConfiguration defaultConfiguration];
  uint64_t v9 = [v8 generatedLogger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v10 = objc_opt_class();
    id v25 = v10;
    int v11 = [(TFFeedbackSession *)self bundleIdentifier];
    int v12 = [(TFFeedbackSession *)self logKey];
    int v13 = [(TFFeedbackSession *)self _currentContextStringDescription];
    __int16 v14 = [v7 localizedDescription];
    *(_DWORD *)buf = 138544642;
    __int16 v27 = v10;
    __int16 v28 = 2114;
    __int16 v29 = v11;
    __int16 v30 = 2112;
    uint64_t v31 = v12;
    __int16 v32 = 2112;
    id v33 = v6;
    __int16 v34 = 2112;
    v35 = v13;
    __int16 v36 = 2112;
    v37 = v14;
    _os_log_impl(&dword_223064000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] _abortFeedbackSubmissionForViewController:withError: formViewController=%@ context=%@ | error=%@", buf, 0x3Eu);
  }
  [(TFFeedbackSession *)self setCurrentPhase:0];
  uint64_t v15 = [(TFFeedbackSession *)self activeFormViewController];

  if (v15)
  {
    uint64_t v16 = [(TFFeedbackSession *)self submissionService];
    id v17 = [(TFFeedbackSession *)self _displayableErrorMessageFromService:v16 submissionError:v7];

    uint64_t v18 = [(TFFeedbackSession *)self activeFormViewController];
    __int16 v19 = [v18 presenter];
    [v19 showSubmissionFailureWithMessage:v17];
  }
  id v20 = [(TFFeedbackSession *)self delegate];
  char v21 = objc_opt_respondsToSelector();

  long long v22 = [(TFFeedbackSession *)self delegate];
  long long v23 = v22;
  if (v21)
  {
    [v22 sessionDidFailToSubmit:self withError:v7];
LABEL_9:

    goto LABEL_10;
  }
  char v24 = objc_opt_respondsToSelector();

  if (v24)
  {
    long long v23 = [(TFFeedbackSession *)self delegate];
    [v23 session:self failedToSubmitFeedbackFromViewController:v6 withError:v7];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)_finishFeedbackSubmissionForViewController:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[TFLogConfiguration defaultConfiguration];
  id v6 = [v5 generatedLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    uint64_t v9 = [(TFFeedbackSession *)self bundleIdentifier];
    BOOL v10 = [(TFFeedbackSession *)self logKey];
    int v11 = [(TFFeedbackSession *)self _currentContextStringDescription];
    int v17 = 138544386;
    uint64_t v18 = v7;
    __int16 v19 = 2114;
    id v20 = v9;
    __int16 v21 = 2112;
    long long v22 = v10;
    __int16 v23 = 2112;
    id v24 = v4;
    __int16 v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_223064000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@:%@] _finishFeedbackSubmissionForViewController: formViewController=%@ context=%@", (uint8_t *)&v17, 0x34u);
  }
  [(TFFeedbackSession *)self setCurrentPhase:2];
  int v12 = [(TFFeedbackSession *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  __int16 v14 = [(TFFeedbackSession *)self delegate];
  uint64_t v15 = v14;
  if (v13)
  {
    [v14 sessionDidSubmitFeedback:self];
LABEL_7:

    goto LABEL_8;
  }
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    uint64_t v15 = [(TFFeedbackSession *)self delegate];
    [v15 session:self didSubmitFeedbackFromViewController:v4];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)dataAggregator:(id)a3 didCompleteTasks:(id)a4
{
  if ([(TFFeedbackSession *)self currentPhase] == 1) {
    char v5 = ![(TFFeedbackSession *)self isWaitingOnAggregatorForSubmission];
  }
  else {
    char v5 = 1;
  }
  id v6 = [(TFFeedbackSession *)self dataContainer];
  char v7 = [v6 isLoading];

  if ((v5 & 1) == 0 && (v7 & 1) == 0)
  {
    [(TFFeedbackSession *)self submitFeedbackForActiveFormViewController];
    [(TFFeedbackSession *)self setWaitingOnAggregatorForSubmission:0];
  }
}

- (id)_displayableErrorMessageFromService:(id)a3 submissionError:(id)a4
{
  id v5 = a4;
  id v6 = NSString;
  id v7 = a3;
  id v8 = TFLocalizedString(@"NUMBER_OF_CHARACTERS");
  uint64_t v9 = objc_msgSend(v6, "stringWithFormat:", v8, objc_msgSend(v7, "maxNumberOfCommentSymbolsAllowed"));

  BOOL v10 = NSString;
  int v11 = TFLocalizedString(@"NUMBER_OF_IMAGES");
  uint64_t v12 = [v7 maxNumberOfScreenshotsAllowed];

  char v13 = objc_msgSend(v10, "stringWithFormat:", v11, v12);

  uint64_t v14 = [v5 code];
  if (v14 > 400)
  {
    switch(v14)
    {
      case 401:
        __int16 v21 = NSString;
        char v16 = TFLocalizedString(@"ALERT_SUBMIT_FAILURE_TOO_MANY_IMAGES_MESSAGE_TEMPLATE");
        objc_msgSend(v21, "stringWithFormat:", v16, v13);
        break;
      case 402:
        long long v22 = NSString;
        char v16 = TFLocalizedString(@"ALERT_SUBMIT_FAILURE_TOO_MANY_CHARACTERS_MESSAGE_TEMPLATE");
        objc_msgSend(v22, "stringWithFormat:", v16, v9);
        break;
      case 404:
        uint64_t v15 = [v5 userInfo];
        char v16 = [v15 objectForKeyedSubscript:@"TFErrorImageName"];

        if (v16)
        {
          int v17 = NSString;
          uint64_t v18 = TFLocalizedString(@"ALERT_SUBMIT_FAILURE_TOO_LARGE_NAMED_IMAGE_MESSAGE_TEMPLATE");
          __int16 v19 = objc_msgSend(v17, "stringWithFormat:", v18, v16);

LABEL_14:
          goto LABEL_18;
        }
        uint64_t v23 = TFLocalizedString(@"ALERT_SUBMIT_FAILURE_TOO_LARGE_UNNAMED_IMAGE_MESSAGE_TEMPLATE");
LABEL_13:
        __int16 v19 = (void *)v23;
        goto LABEL_14;
      default:
        goto LABEL_16;
    uint64_t v23 = };
    goto LABEL_13;
  }
  if (v14 == 302)
  {
    id v20 = @"ALERT_SUBMIT_FAILURE_MALFORMED_EMAIL";
  }
  else
  {
    if (v14 != 303)
    {
LABEL_16:
      id v20 = @"ALERT_SUBMIT_FAILURE_GENERIC_MESSAGE";
      goto LABEL_17;
    }
    id v20 = @"ALERT_SUBMIT_FAILURE_MISSING_USER_DATA_MESSAGE";
  }
LABEL_17:
  __int16 v19 = TFLocalizedString(v20);
LABEL_18:

  return v19;
}

- (id)_currentContextStringDescription
{
  if (_currentContextStringDescription_onceToken != -1) {
    dispatch_once(&_currentContextStringDescription_onceToken, &__block_literal_global_9);
  }
  id v3 = (void *)_currentContextStringDescription_contextDescriptors;
  unint64_t v4 = [(TFFeedbackSession *)self context];

  return (id)[v3 objectAtIndexedSubscript:v4];
}

void __53__TFFeedbackSession__currentContextStringDescription__block_invoke()
{
  v0 = (void *)_currentContextStringDescription_contextDescriptors;
  _currentContextStringDescription_contextDescriptors = (uint64_t)&unk_26D61BBC8;
}

- (TFFeedbackSession)initWithBetaApplicationIdentifier:(id)a3
{
  unint64_t v4 = (void *)MEMORY[0x263F27E08];
  id v5 = a3;
  id v6 = [v4 currentProcess];
  id v7 = [v6 bundleIdentifier];
  id v8 = -[TFFeedbackSession initForContext:betaApplicationIdentifier:](self, "initForContext:betaApplicationIdentifier:", [v7 containsString:@"Screenshot"], v5);

  return v8;
}

- (id)initForContext:(unint64_t)a3 betaApplicationBundleURL:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TFFeedbackSession;
  id v7 = [(TFFeedbackSession *)&v14 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    bundleURL = v7->_bundleURL;
    v7->_bundleURL = (NSURL *)v8;

    BOOL v10 = +[TFBundle bundleIdentifierForBundleURL:v6];
    uint64_t v11 = [v10 copy];
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v11;

    [(TFFeedbackSession *)v7 commonInitWithContext:a3];
  }

  return v7;
}

- (unint64_t)context
{
  return self->_context;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (ASDBetaAppLaunchInfo)launchInfo
{
  return self->_launchInfo;
}

- (TFFeedbackSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TFFeedbackSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)forcePrefilledEmailViewVariant
{
  return self->_forcePrefilledEmailViewVariant;
}

- (void)setForcePrefilledEmailViewVariant:(BOOL)a3
{
  self->_forcePrefilledEmailViewVariant = a3;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (BOOL)didSnapshot
{
  return self->_didSnapshot;
}

- (void)setDidSnapshot:(BOOL)a3
{
  self->_didSnapshot = a3;
}

- (BOOL)isWaitingOnAggregatorForSubmission
{
  return self->_waitingOnAggregatorForSubmission;
}

- (void)setWaitingOnAggregatorForSubmission:(BOOL)a3
{
  self->_waitingOnAggregatorForSubmission = a3;
}

- (unint64_t)currentPhase
{
  return self->_currentPhase;
}

- (void)setCurrentPhase:(unint64_t)a3
{
  self->_currentPhase = a3;
}

- (TFFeedbackDataContainer)dataContainer
{
  return self->_dataContainer;
}

- (TFDataAggregator)aggregator
{
  return self->_aggregator;
}

- (TFFeedbackSubmissionService)submissionService
{
  return self->_submissionService;
}

- (TFFeedbackFormViewController)activeFormViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeFormViewController);

  return (TFFeedbackFormViewController *)WeakRetained;
}

- (void)setActiveFormViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeFormViewController);
  objc_storeStrong((id *)&self->_submissionService, 0);
  objc_storeStrong((id *)&self->_aggregator, 0);
  objc_storeStrong((id *)&self->_dataContainer, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_launchInfo, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end