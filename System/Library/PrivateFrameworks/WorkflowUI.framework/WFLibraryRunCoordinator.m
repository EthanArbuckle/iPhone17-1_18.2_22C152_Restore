@interface WFLibraryRunCoordinator
- (BOOL)waiting;
- (NSHashTable)observers;
- (NSProgress)runningWorkflowProgress;
- (NSString)source;
- (WFAction)currentlyRunningAction;
- (WFDatabase)database;
- (WFDialogTransformer)dialogTransformer;
- (WFExecutableAppShortcut)runningAppShortcut;
- (WFLibraryRunCoordinator)initWithSource:(id)a3 database:(id)a4;
- (WFLibraryRunCoordinatorDelegate)delegate;
- (WFShortcutsAppRunnerClient)workflowRunnerClient;
- (WFWorkflowReference)runningWorkflow;
- (WFWorkflowRunEvent)runEvent;
- (WFWorkflowRunViewSource)runViewSource;
- (float)progress;
- (id)completionHandler;
- (id)view;
- (void)accessibilityAnnounce:(id)a3;
- (void)dealloc;
- (void)didFinishRunningWorkflow:(id)a3 withError:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openWorkflowReferenceAndRun:(id)a3 fromSource:(id)a4 withInput:(id)a5 state:(id)a6 requestOutput:(BOOL)a7 runViewSource:(id)a8 completionHandler:(id)a9;
- (void)registerObserver:(id)a3;
- (void)resumeWorkflowReference:(id)a3 fromSource:(id)a4 withState:(id)a5;
- (void)runAppShortcut:(id)a3 withLNAction:(id)a4 andMetadata:(id)a5;
- (void)runContextualAction:(id)a3;
- (void)runWorkflowReference:(id)a3 fromSource:(id)a4 withInput:(id)a5 requestOutput:(BOOL)a6 runViewSource:(id)a7 completionHandler:(id)a8;
- (void)setCompletionHandler:(id)a3;
- (void)setCurrentlyRunningAction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDialogTransformer:(id)a3;
- (void)setProgress:(float)a3;
- (void)setRunEvent:(id)a3;
- (void)setRunViewSource:(id)a3;
- (void)setRunningAppShortcut:(id)a3;
- (void)setRunningWorkflow:(id)a3;
- (void)setRunningWorkflowProgress:(id)a3;
- (void)setWaiting:(BOOL)a3;
- (void)setWorkflowRunnerClient:(id)a3;
- (void)stop;
- (void)unregisterObserver:(id)a3;
- (void)updateProgress:(double)a3 waiting:(BOOL)a4 cancelled:(BOOL)a5 forWorkflow:(id)a6;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4;
@end

@implementation WFLibraryRunCoordinator

- (WFWorkflowReference)runningWorkflow
{
  return self->_runningWorkflow;
}

- (void)setDelegate:(id)a3
{
}

- (WFExecutableAppShortcut)runningAppShortcut
{
  return self->_runningAppShortcut;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(WFLibraryRunCoordinator *)self observers];
  [v5 addObject:v4];
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (WFLibraryRunCoordinator)initWithSource:(id)a3 database:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFLibraryRunCoordinator.m", 64, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)WFLibraryRunCoordinator;
  v9 = [(WFLibraryRunCoordinator *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    source = v9->_source;
    v9->_source = (NSString *)v10;

    uint64_t v12 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v12;

    objc_storeStrong((id *)&v9->_database, a4);
    v14 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningWorkflowProgress, 0);
  objc_storeStrong((id *)&self->_dialogTransformer, 0);
  objc_storeStrong((id *)&self->_runEvent, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_currentlyRunningAction, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_workflowRunnerClient, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_runningAppShortcut, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
  objc_storeStrong((id *)&self->_runningWorkflow, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (NSProgress)runningWorkflowProgress
{
  return self->_runningWorkflowProgress;
}

- (void)setDialogTransformer:(id)a3
{
}

- (WFDialogTransformer)dialogTransformer
{
  return self->_dialogTransformer;
}

- (void)setRunEvent:(id)a3
{
}

- (WFWorkflowRunEvent)runEvent
{
  return self->_runEvent;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCurrentlyRunningAction:(id)a3
{
}

- (WFAction)currentlyRunningAction
{
  return self->_currentlyRunningAction;
}

- (WFDatabase)database
{
  return self->_database;
}

- (void)setWorkflowRunnerClient:(id)a3
{
}

- (WFShortcutsAppRunnerClient)workflowRunnerClient
{
  return self->_workflowRunnerClient;
}

- (NSString)source
{
  return self->_source;
}

- (void)setRunningAppShortcut:(id)a3
{
}

- (void)setRunViewSource:(id)a3
{
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (void)setRunningWorkflow:(id)a3
{
}

- (void)setWaiting:(BOOL)a3
{
  self->_waiting = a3;
}

- (BOOL)waiting
{
  return self->_waiting;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (float)progress
{
  return self->_progress;
}

- (WFLibraryRunCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFLibraryRunCoordinatorDelegate *)WeakRetained;
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  BOOL v6 = a6;
  v58[1] = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v11 = [(WFLibraryRunCoordinator *)self runningWorkflow];
  if (v10) {
    int v12 = 1;
  }
  else {
    int v12 = v6;
  }
  if (v12) {
    double v13 = -1.0;
  }
  else {
    double v13 = 1.0;
  }
  v14 = [(WFLibraryRunCoordinator *)self runningWorkflow];
  [(WFLibraryRunCoordinator *)self updateProgress:0 waiting:v6 cancelled:v14 forWorkflow:v13];

  [(WFLibraryRunCoordinator *)self progress];
  if (v15 != -1.0)
  {
    v16 = [(WFLibraryRunCoordinator *)self runningWorkflow];
    [(WFLibraryRunCoordinator *)self updateProgress:0 waiting:0 cancelled:v16 forWorkflow:-1.0];
  }
  [(WFLibraryRunCoordinator *)self setRunningWorkflow:0];
  [(WFLibraryRunCoordinator *)self setRunViewSource:0];
  objc_super v17 = [(WFLibraryRunCoordinator *)self runningAppShortcut];
  [(WFLibraryRunCoordinator *)self setRunningAppShortcut:0];
  v18 = [v10 userInfo];
  v19 = [v18 objectForKeyedSubscript:*MEMORY[0x263F87538]];

  if (v19)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }
  id v21 = v20;

  if (v10)
  {
    if (WFErrorIsRemoteQuarantineDenialError())
    {
      uint64_t v51 = MEMORY[0x263EF8330];
      uint64_t v52 = 3221225472;
      v53 = __99__WFLibraryRunCoordinator_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke;
      v54 = &unk_2649CC018;
      v55 = self;
      id v56 = v11;
      uint64_t v22 = WFAddRecoveryOptionsToRemoteQuarantineDenialError();

      id v10 = (id)v22;
    }
    else if (v21)
    {
      v23 = [(WFLibraryRunCoordinator *)self delegate];
      char v24 = objc_opt_respondsToSelector();

      if (v24)
      {
        v25 = [v10 userInfo];
        v26 = (void *)[v25 mutableCopy];

        uint64_t v27 = WFLocalizedString(@"Show");
        uint64_t v28 = WFLocalizedString(@"OK");
        v45 = (void *)v28;
        v46 = v17;
        v44 = (void *)v27;
        if (v17)
        {
          v58[0] = v28;
          v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:1];
          v30 = &unk_26E1CA4B0;
        }
        else
        {
          v57[0] = v27;
          v57[1] = v28;
          v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:2];
          v30 = &unk_26E1CA4C8;
        }
        [v26 setObject:v29 forKeyedSubscript:*MEMORY[0x263F08340]];

        [v26 setObject:v30 forKeyedSubscript:*MEMORY[0x263F33B08]];
        id v31 = objc_alloc(MEMORY[0x263F33738]);
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __99__WFLibraryRunCoordinator_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke_217;
        v47[3] = &unk_2649CB340;
        id v48 = v11;
        v49 = self;
        id v50 = v21;
        v32 = (void *)[v31 initWithHandlerBlock:v47];
        [v26 setObject:v32 forKeyedSubscript:*MEMORY[0x263F084A8]];
        v33 = (void *)MEMORY[0x263F087E8];
        [v10 domain];
        v35 = v34 = v26;
        uint64_t v36 = objc_msgSend(v33, "errorWithDomain:code:userInfo:", v35, objc_msgSend(v10, "code"), v34);

        id v10 = (id)v36;
        objc_super v17 = v46;
      }
    }
  }
  v37 = [(WFLibraryRunCoordinator *)self completionHandler];

  if (v37)
  {
    v38 = [(WFLibraryRunCoordinator *)self completionHandler];
    ((void (**)(void, id, BOOL, id))v38)[2](v38, v9, v6, v10);

    [(WFLibraryRunCoordinator *)self setCompletionHandler:0];
  }
  if (v6)
  {
    v39 = [MEMORY[0x263F087E8] userCancelledError];
    [(WFLibraryRunCoordinator *)self didFinishRunningWorkflow:v11 withError:v39];

    if (v10)
    {
      v40 = @"Shortcut stopped";
LABEL_32:
      v42 = WFLocalizedString(v40);
      [(WFLibraryRunCoordinator *)self accessibilityAnnounce:v42];
      goto LABEL_33;
    }
LABEL_31:
    v40 = @"Shortcut finished";
    goto LABEL_32;
  }
  [(WFLibraryRunCoordinator *)self didFinishRunningWorkflow:v11 withError:v10];
  if (!v10) {
    goto LABEL_31;
  }
  if (!v37)
  {
    v41 = [(WFLibraryRunCoordinator *)self delegate];
    v42 = [v41 runCoordinator:self userInterfaceForWorkflow:v11];

    v43 = [MEMORY[0x263F336E8] alertWithError:v10];
    [v42 presentAlert:v43];

LABEL_33:
  }
}

void __99__WFLibraryRunCoordinator_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) database];
  [v2 deleteReference:*(void *)(a1 + 40) error:0];
}

void __99__WFLibraryRunCoordinator_workflowRunnerClient_didFinishRunningWorkflowWithOutput_error_cancelled___block_invoke_217(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v16 = a2;
  id v9 = a4;
  id v10 = a5;
  if (!a3 && *(void *)(a1 + 32))
  {
    v11 = [*(id *)(a1 + 40) delegate];
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v14 = [*(id *)(a1 + 48) integerValue];
    float v15 = [v16 localizedDescription];
    [v11 runCoordinator:v12 openWorkflow:v13 scrolledToActionIndex:v14 message:v15];
  }
  if (v10) {
    v10[2](v10, 1, 0);
  }
}

- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4
{
  [(WFLibraryRunCoordinator *)self setRunningWorkflowProgress:a4];
  id v5 = [(WFLibraryRunCoordinator *)self runningWorkflow];
  [(WFLibraryRunCoordinator *)self updateProgress:0 waiting:0 cancelled:v5 forWorkflow:0.0];

  WFLocalizedString(@"Running shortcut");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(WFLibraryRunCoordinator *)self accessibilityAnnounce:v6];
}

- (void)accessibilityAnnounce:(id)a3
{
  id v7 = a3;
  id v4 = [(WFLibraryRunCoordinator *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WFLibraryRunCoordinator *)self delegate];
    [v6 runCoordinator:self accessibilityAnnounce:v7];
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(WFLibraryRunCoordinator *)self observers];
  [v5 removeObject:v4];
}

- (void)updateProgress:(double)a3 waiting:(BOOL)a4 cancelled:(BOOL)a5 forWorkflow:(id)a6
{
  BOOL v17 = a5;
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a6;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  *(float *)&double v10 = a3;
  [(WFLibraryRunCoordinator *)self setProgress:v10];
  [(WFLibraryRunCoordinator *)self setWaiting:v6];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = [(WFLibraryRunCoordinator *)self observers];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v18 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          [v16 runCoordinator:self didChangeRunningStateWithProgress:v6 waiting:v9 forWorkflow:a3];
        }
        if (objc_opt_respondsToSelector()) {
          [v16 runCoordinator:self didChangeRunningStateWithProgress:v6 waiting:v17 cancelled:v9 forWorkflow:a3];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (void)didFinishRunningWorkflow:(id)a3 withError:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [(WFLibraryRunCoordinator *)self observers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          [v13 runCoordinator:self didFinishRunningWorkflow:v6 withError:v7];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  workflowRunnerClient = self->_workflowRunnerClient;
  self->_workflowRunnerClient = 0;

  [(WFLibraryRunCoordinator *)self setRunningWorkflowProgress:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)WFWorkflowControllerProgressContext == a6 || WFWorkflowControllerRunningStateContext == (void)a6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__WFLibraryRunCoordinator_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_2649CBF20;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFLibraryRunCoordinator;
    -[WFLibraryRunCoordinator observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

void __74__WFLibraryRunCoordinator_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v11 = [*(id *)(a1 + 32) workflowRunnerClient];
  if ([v11 isRunning])
  {
    id v2 = [*(id *)(a1 + 32) runningWorkflowProgress];

    if (!v2) {
      return;
    }
    v3 = [*(id *)(a1 + 32) runningWorkflowProgress];
    id v4 = [v3 userInfo];
    id v5 = [v4 objectForKey:*MEMORY[0x263F85A68]];
    uint64_t v6 = [v5 integerValue];

    id v7 = *(void **)(a1 + 32);
    id v11 = [v7 runningWorkflowProgress];
    [v11 fractionCompleted];
    double v9 = v8;
    uint64_t v10 = [*(id *)(a1 + 32) runningWorkflow];
    [v7 updateProgress:v6 == 2 waiting:0 cancelled:v10 forWorkflow:v9];
  }
}

- (id)view
{
  v3 = [(WFLibraryRunCoordinator *)self delegate];
  id v4 = [(WFLibraryRunCoordinator *)self runningWorkflow];
  id v5 = [v3 runCoordinator:self userInterfaceForWorkflow:v4];

  uint64_t v6 = [v5 userInterfaceType];
  LODWORD(v4) = [v6 isEqualToString:*MEMORY[0x263F33B40]];

  if (v4)
  {
    id v7 = WFViewControllerFromUserInterface();
    double v8 = [v7 view];
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (void)stop
{
  id v2 = [(WFLibraryRunCoordinator *)self workflowRunnerClient];
  [v2 stop];
}

- (void)openWorkflowReferenceAndRun:(id)a3 fromSource:(id)a4 withInput:(id)a5 state:(id)a6 requestOutput:(BOOL)a7 runViewSource:(id)a8 completionHandler:(id)a9
{
  BOOL v10 = a7;
  id v26 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  if (!v15)
  {
    id v15 = [(WFLibraryRunCoordinator *)self source];
  }
  [(WFLibraryRunCoordinator *)self setCompletionHandler:v19];
  uint64_t v20 = [(WFLibraryRunCoordinator *)self workflowRunnerClient];
  [v20 stop];

  [(WFLibraryRunCoordinator *)self setRunningWorkflow:v26];
  [(WFLibraryRunCoordinator *)self setRunViewSource:v18];
  long long v21 = (void *)[objc_alloc(MEMORY[0x263F86E90]) initWithWorkflow:v26 state:v17 runSource:v15 input:v16 remoteDialogPresenterEndpoint:0 requestOutput:v10];
  [(WFLibraryRunCoordinator *)self setWorkflowRunnerClient:v21];

  uint64_t v22 = [(WFLibraryRunCoordinator *)self workflowRunnerClient];
  [v22 setDelegate:self];

  uint64_t v23 = [(WFLibraryRunCoordinator *)self workflowRunnerClient];
  char v24 = [v23 runRequest];
  [v24 setRunViewSource:v18];

  v25 = [(WFLibraryRunCoordinator *)self workflowRunnerClient];
  [v25 start];
}

- (void)runContextualAction:(id)a3
{
  id v4 = a3;
  id v5 = [(WFLibraryRunCoordinator *)self workflowRunnerClient];
  [v5 stop];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F86E90]) initWithContextualAction:v4];
  [(WFLibraryRunCoordinator *)self setWorkflowRunnerClient:v6];

  id v7 = [(WFLibraryRunCoordinator *)self workflowRunnerClient];
  [v7 setDelegate:self];

  id v8 = [(WFLibraryRunCoordinator *)self workflowRunnerClient];
  [v8 start];
}

- (void)runAppShortcut:(id)a3 withLNAction:(id)a4 andMetadata:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(WFLibraryRunCoordinator *)self workflowRunnerClient];
  [v11 stop];

  id v12 = objc_alloc(MEMORY[0x263F51C00]);
  uint64_t v13 = [v10 underlyingAutoShortcut];
  uint64_t v14 = [v13 actionIdentifier];
  id v15 = [v10 underlyingAutoShortcut];
  id v16 = [v15 bundleIdentifier];
  id v22 = (id)[v12 initWithActionIdentifier:v14 bundleIdentifier:v16];

  [(WFLibraryRunCoordinator *)self setRunningAppShortcut:v10];
  id v17 = objc_alloc(MEMORY[0x263F86E90]);
  id v18 = [v10 triggerPhrase];

  id v19 = (void *)[v17 initWithIdentifier:v22 name:v18 action:v9 metadata:v8 runSource:*MEMORY[0x263F85A80] remoteDialogPresenterEndpoint:0];
  [(WFLibraryRunCoordinator *)self setWorkflowRunnerClient:v19];

  uint64_t v20 = [(WFLibraryRunCoordinator *)self workflowRunnerClient];
  [v20 setDelegate:self];

  long long v21 = [(WFLibraryRunCoordinator *)self workflowRunnerClient];
  [v21 start];
}

- (void)runWorkflowReference:(id)a3 fromSource:(id)a4 withInput:(id)a5 requestOutput:(BOOL)a6 runViewSource:(id)a7 completionHandler:(id)a8
{
}

- (void)resumeWorkflowReference:(id)a3 fromSource:(id)a4 withState:(id)a5
{
}

- (void)dealloc
{
  [(WFShortcutsAppRunnerClient *)self->_workflowRunnerClient removeObserver:self forKeyPath:@"fractionCompleted" context:WFWorkflowControllerProgressContext];
  workflowRunnerClient = self->_workflowRunnerClient;
  id v4 = WFNSProgressCreateUserInfoKeyPathForKey();
  [(WFShortcutsAppRunnerClient *)workflowRunnerClient removeObserver:self forKeyPath:v4 context:WFWorkflowControllerRunningStateContext];

  v5.receiver = self;
  v5.super_class = (Class)WFLibraryRunCoordinator;
  [(WFLibraryRunCoordinator *)&v5 dealloc];
}

- (void)setRunningWorkflowProgress:(id)a3
{
  id v4 = (NSProgress *)a3;
  [(NSProgress *)self->_runningWorkflowProgress removeObserver:self forKeyPath:@"fractionCompleted" context:WFWorkflowControllerProgressContext];
  runningWorkflowProgress = self->_runningWorkflowProgress;
  uint64_t v6 = WFNSProgressCreateUserInfoKeyPathForKey();
  [(NSProgress *)runningWorkflowProgress removeObserver:self forKeyPath:v6 context:WFWorkflowControllerRunningStateContext];

  id v7 = self->_runningWorkflowProgress;
  self->_runningWorkflowProgress = v4;
  id v8 = v4;

  [(NSProgress *)self->_runningWorkflowProgress addObserver:self forKeyPath:@"fractionCompleted" options:4 context:WFWorkflowControllerProgressContext];
  id v9 = self->_runningWorkflowProgress;
  WFNSProgressCreateUserInfoKeyPathForKey();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(NSProgress *)v9 addObserver:self forKeyPath:v10 options:4 context:WFWorkflowControllerRunningStateContext];
}

@end