@interface WFOutOfProcessWorkflowController
- (BOOL)isAutomation;
- (BOOL)isRunning;
- (BOOL)resumeRunningWithRequest:(id)a3 error:(id *)a4;
- (BOOL)runActionWithRunRequestData:(id)a3 error:(id *)a4;
- (BOOL)runWorkflowWithDescriptor:(id)a3 request:(id)a4 error:(id *)a5;
- (WFDialogAttribution)currentDialogAttribution;
- (WFOutOfProcessWorkflowController)initWithEnvironment:(int64_t)a3 runningContext:(id)a4 presentationMode:(int64_t)a5;
- (WFOutOfProcessWorkflowController)initWithEnvironment:(int64_t)a3 runningContext:(id)a4 presentationMode:(int64_t)a5 existingConnection:(id)a6;
- (WFOutOfProcessWorkflowControllerDelegate)delegate;
- (WFOutOfProcessWorkflowControllerStateMachine)stateMachine;
- (WFOutOfProcessWorkflowControllerVendor)runner;
- (WFRunnerConnection)serviceConnection;
- (WFSandboxExtensionManager)sandboxExtensionManager;
- (WFWorkflowDescriptor)currentWorkflow;
- (WFWorkflowRunDescriptor)runDescriptor;
- (WFWorkflowRunRequest)runRequest;
- (WFWorkflowRunningContext)runningContext;
- (id)asynchronousRunnerWithError:(id *)a3 reason:(id)a4;
- (id)localizedTimeoutErrorDescription;
- (id)localizedXPCInterruptionErrorDescription;
- (id)runnerWithError:(id *)a3 synchronous:(BOOL)a4 reason:(id)a5;
- (id)synchronousRunnerWithError:(id *)a3 reason:(id)a4;
- (int64_t)environment;
- (int64_t)presentationMode;
- (os_unfair_lock_s)serviceConnectionLock;
- (void)actionWithUUID:(id)a3 didFinishRunningWithError:(id)a4 serializedVariable:(id)a5 executionResultMetadata:(id)a6;
- (void)controllerStateMachine:(id)a3 didFinishRunningShortcutWithResult:(id)a4;
- (void)controllerStateMachine:(id)a3 didRequestStoppingShortcutWithError:(id)a4;
- (void)controllerStateMachine:(id)a3 shouldNotifyDelegateWithResult:(id)a4 currentDialogAttribution:(id)a5;
- (void)controllerStateMachineDidRequestRunnerTearDown:(id)a3;
- (void)extractVariableContentFromEncodedReference:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5;
- (void)fetchDisplayValueForRequest:(id)a3 completionHandler:(id)a4;
- (void)fetchToolInvocationSummaryForInvocation:(id)a3 completionHandler:(id)a4;
- (void)forTestingOnly_simulateXPCInterruption;
- (void)getCurrentProgressCompletedWithCompletionHandler:(id)a3;
- (void)handleIncomingFileForRemoteExecutionWithURL:(id)a3 withIdentifier:(id)a4;
- (void)injectContentAsVariable:(id)a3 completionHandler:(id)a4;
- (void)pauseWorkflowAndWriteStateToDisk;
- (void)performQuery:(id)a3 inValueSet:(id)a4 toolInvocation:(id)a5 completionHandler:(id)a6;
- (void)presenterRequestedUpdatedRunViewSource:(id)a3 completionHandler:(id)a4;
- (void)reindexToolKitDatabaseWithRequest:(id)a3 completionHandler:(id)a4;
- (void)reset;
- (void)resolveDeferredValueFromEncodedStorage:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5;
- (void)runToolWithInvocation:(id)a3;
- (void)runnerDidPunchToShortcutsJr;
- (void)runnerWillExit;
- (void)setCurrentDialogAttribution:(id)a3;
- (void)setCurrentWorkflow:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsAutomation:(BOOL)a3;
- (void)setPresentationMode:(int64_t)a3;
- (void)setRunDescriptor:(id)a3;
- (void)setRunRequest:(id)a3;
- (void)setRunner:(id)a3;
- (void)setServiceConnection:(id)a3;
- (void)stop;
- (void)updateRunViewSource:(id)a3;
- (void)workflowDidPause;
- (void)workflowDidStartRunning:(id)a3 isAutomation:(id)a4 dialogAttribution:(id)a5;
@end

@implementation WFOutOfProcessWorkflowController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionManager, 0);
  objc_storeStrong((id *)&self->_currentDialogAttribution, 0);
  objc_storeStrong((id *)&self->_currentWorkflow, 0);
  objc_storeStrong((id *)&self->_runRequest, 0);
  objc_storeStrong((id *)&self->_runDescriptor, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_runner, 0);
  objc_storeStrong((id *)&self->_runningContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (WFOutOfProcessWorkflowControllerStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (WFSandboxExtensionManager)sandboxExtensionManager
{
  return self->_sandboxExtensionManager;
}

- (void)setCurrentDialogAttribution:(id)a3
{
}

- (WFDialogAttribution)currentDialogAttribution
{
  return self->_currentDialogAttribution;
}

- (void)setIsAutomation:(BOOL)a3
{
  self->_isAutomation = a3;
}

- (BOOL)isAutomation
{
  return self->_isAutomation;
}

- (void)setCurrentWorkflow:(id)a3
{
}

- (WFWorkflowDescriptor)currentWorkflow
{
  return self->_currentWorkflow;
}

- (void)setRunRequest:(id)a3
{
}

- (WFWorkflowRunRequest)runRequest
{
  return self->_runRequest;
}

- (void)setRunDescriptor:(id)a3
{
}

- (WFWorkflowRunDescriptor)runDescriptor
{
  return self->_runDescriptor;
}

- (os_unfair_lock_s)serviceConnectionLock
{
  return self->_serviceConnectionLock;
}

- (void)setServiceConnection:(id)a3
{
}

- (WFRunnerConnection)serviceConnection
{
  return self->_serviceConnection;
}

- (int64_t)environment
{
  return self->_environment;
}

- (void)setRunner:(id)a3
{
}

- (WFOutOfProcessWorkflowControllerVendor)runner
{
  return self->_runner;
}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (void)setPresentationMode:(int64_t)a3
{
  self->_presentationMode = a3;
}

- (int64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setDelegate:(id)a3
{
}

- (WFOutOfProcessWorkflowControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFOutOfProcessWorkflowControllerDelegate *)WeakRetained;
}

- (id)localizedTimeoutErrorDescription
{
  if ([(WFOutOfProcessWorkflowController *)self isAutomation])
  {
    v3 = @"the automation took too long to run.";
  }
  else
  {
    v4 = [(WFOutOfProcessWorkflowController *)self currentWorkflow];
    v5 = [v4 name];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      v7 = NSString;
      v8 = WFLocalizedString(@"The shortcut “%@” took too long to run.");
      v9 = [(WFOutOfProcessWorkflowController *)self currentWorkflow];
      v10 = [v9 name];
      v11 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v10);

      goto LABEL_8;
    }
    v12 = [(WFOutOfProcessWorkflowController *)self currentWorkflow];

    if (v12) {
      goto LABEL_6;
    }
    v14 = [(WFOutOfProcessWorkflowController *)self runRequest];
    if (v14)
    {
      objc_opt_class();
      char v15 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      char v15 = 1;
    }

    v16 = [(WFOutOfProcessWorkflowController *)self runRequest];
    v17 = [v16 runSource];
    int IsSuggestion = WFRunSourceIsSuggestion(v17);

    if ((v15 & 1) == 0)
    {
      v3 = @"The action took too long to run.";
      goto LABEL_7;
    }
    if (!IsSuggestion) {
LABEL_6:
    }
      v3 = @"The shortcut took too long to run.";
    else {
      v3 = @"The suggestion took too long to run.";
    }
  }
LABEL_7:
  v11 = WFLocalizedString(v3);
LABEL_8:
  return v11;
}

- (id)localizedXPCInterruptionErrorDescription
{
  if ([(WFOutOfProcessWorkflowController *)self isAutomation])
  {
    v3 = @"There was a problem running the automation.";
  }
  else
  {
    v4 = [(WFOutOfProcessWorkflowController *)self currentWorkflow];
    v5 = [v4 name];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      v7 = NSString;
      v8 = WFLocalizedString(@"There was a problem running the shortcut “%@”.");
      v9 = [(WFOutOfProcessWorkflowController *)self currentWorkflow];
      v10 = [v9 name];
      v11 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v10);

      goto LABEL_8;
    }
    v12 = [(WFOutOfProcessWorkflowController *)self currentWorkflow];

    if (v12) {
      goto LABEL_6;
    }
    v14 = [(WFOutOfProcessWorkflowController *)self runRequest];
    if (v14)
    {
      objc_opt_class();
      char v15 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      char v15 = 1;
    }

    v16 = [(WFOutOfProcessWorkflowController *)self runRequest];
    v17 = [v16 runSource];
    int IsSuggestion = WFRunSourceIsSuggestion(v17);

    if ((v15 & 1) == 0)
    {
      v3 = @"There was a problem running the action.";
      goto LABEL_7;
    }
    if (!IsSuggestion) {
LABEL_6:
    }
      v3 = @"There was a problem running the shortcut.";
    else {
      v3 = @"There was a problem running the suggestion.";
    }
  }
LABEL_7:
  v11 = WFLocalizedString(v3);
LABEL_8:
  return v11;
}

- (void)runnerDidPunchToShortcutsJr
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = [(WFOutOfProcessWorkflowController *)self runRequest];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = [(WFOutOfProcessWorkflowController *)self runningContext];
    [v4 setAllowsDialogNotifications:1];

    [(WFOutOfProcessWorkflowController *)self setPresentationMode:3];
  }
  else
  {

    v3 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[WFOutOfProcessWorkflowController runnerDidPunchToShortcutsJr]";
      _os_log_impl(&dword_1B3C5C000, v3, OS_LOG_TYPE_FAULT, "%s Attempted to perform punch out for non-Siri request", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)workflowDidPause
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[WFOutOfProcessWorkflowController workflowDidPause]";
    _os_log_impl(&dword_1B3C5C000, v3, OS_LOG_TYPE_DEFAULT, "%s Workflow paused", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(WFOutOfProcessWorkflowController *)self stateMachine];
  [v4 pauseAndWriteShortcutToDiskState];
}

- (void)actionWithUUID:(id)a3 didFinishRunningWithError:(id)a4 serializedVariable:(id)a5 executionResultMetadata:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    char v15 = [(WFOutOfProcessWorkflowController *)self delegate];
    int v20 = 136315906;
    v21 = "-[WFOutOfProcessWorkflowController actionWithUUID:didFinishRunningWithError:serializedVariable:executionResultMetadata:]";
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    v25 = v15;
    __int16 v26 = 2112;
    id v27 = v11;
    _os_log_impl(&dword_1B3C5C000, v14, OS_LOG_TYPE_DEFAULT, "%s Host received finish for action (%@), delegate: %@, error: %@", (uint8_t *)&v20, 0x2Au);
  }
  v16 = [(WFOutOfProcessWorkflowController *)self delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    v18 = [(WFOutOfProcessWorkflowController *)self delegate];
    v19 = [v12 propertyListObject];
    [v18 outOfProcessWorkflowController:self actionWithUUID:v10 didFinishRunningWithError:v11 serializedVariable:v19 executionResultMetadata:v13];
  }
}

- (void)workflowDidStartRunning:(id)a3 isAutomation:(id)a4 dialogAttribution:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  [(WFOutOfProcessWorkflowController *)self setCurrentWorkflow:v8];
  uint64_t v11 = [v10 BOOLValue];

  [(WFOutOfProcessWorkflowController *)self setIsAutomation:v11];
  [(WFOutOfProcessWorkflowController *)self setCurrentDialogAttribution:v9];
  id v12 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 136315138;
    char v17 = "-[WFOutOfProcessWorkflowController workflowDidStartRunning:isAutomation:dialogAttribution:]";
    _os_log_impl(&dword_1B3C5C000, v12, OS_LOG_TYPE_DEBUG, "%s Background runner started running workflow", (uint8_t *)&v16, 0xCu);
  }

  id v13 = [(WFOutOfProcessWorkflowController *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    char v15 = [(WFOutOfProcessWorkflowController *)self delegate];
    [v15 outOfProcessWorkflowController:self didStartFromWorkflowReference:v8 dialogAttribution:v9];
  }
}

- (void)runnerWillExit
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[WFOutOfProcessWorkflowController runnerWillExit]";
    _os_log_impl(&dword_1B3C5C000, v3, OS_LOG_TYPE_DEFAULT, "%s Runner is about to tear down", (uint8_t *)&v7, 0xCu);
  }

  [(WFOutOfProcessWorkflowController *)self setRunner:0];
  os_unfair_lock_lock(&self->_serviceConnectionLock);
  v4 = [(WFOutOfProcessWorkflowController *)self serviceConnection];
  [v4 setOnInterruption:0];

  int v5 = [(WFOutOfProcessWorkflowController *)self serviceConnection];
  [v5 setOnInvalidation:0];

  os_unfair_lock_unlock(&self->_serviceConnectionLock);
  uint64_t v6 = [(WFOutOfProcessWorkflowController *)self stateMachine];
  [v6 handleRunnerWillExit];
}

- (void)presenterRequestedUpdatedRunViewSource:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  int v7 = [(WFOutOfProcessWorkflowController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(WFOutOfProcessWorkflowController *)self delegate];
    [v9 outOfProcessWorkflowController:self didRequestUpdatedRunViewSource:v10 completionHandler:v6];
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)controllerStateMachineDidRequestRunnerTearDown:(id)a3
{
  p_serviceConnectionLock = &self->_serviceConnectionLock;
  os_unfair_lock_lock(&self->_serviceConnectionLock);
  int v5 = [(WFOutOfProcessWorkflowController *)self serviceConnection];
  [v5 invalidate];

  [(WFOutOfProcessWorkflowController *)self setServiceConnection:0];
  os_unfair_lock_unlock(p_serviceConnectionLock);
  id v6 = [(WFOutOfProcessWorkflowController *)self stateMachine];
  [v6 exitWithReason:@"runner is torn down"];
}

- (void)controllerStateMachine:(id)a3 shouldNotifyDelegateWithResult:(id)a4 currentDialogAttribution:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(WFOutOfProcessWorkflowController *)self runRequest];
  if ([v9 isStepwise])
  {
    id v10 = [v7 error];

    if (!v10)
    {
      uint64_t v11 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [(WFOutOfProcessWorkflowController *)self delegate];
        int v19 = 136315650;
        int v20 = "-[WFOutOfProcessWorkflowController controllerStateMachine:shouldNotifyDelegateWithResult:currentDialogAttribution:]";
        __int16 v21 = 2112;
        id v22 = v7;
        __int16 v23 = 2112;
        __int16 v24 = v12;
        _os_log_impl(&dword_1B3C5C000, v11, OS_LOG_TYPE_DEFAULT, "%s Workflow stepped successfully (%@) but the run request is stepwise, not notifying the delegate %@", (uint8_t *)&v19, 0x20u);
      }
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v13 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    char v14 = [(WFOutOfProcessWorkflowController *)self delegate];
    int v19 = 136315650;
    int v20 = "-[WFOutOfProcessWorkflowController controllerStateMachine:shouldNotifyDelegateWithResult:currentDialogAttribution:]";
    __int16 v21 = 2112;
    id v22 = v7;
    __int16 v23 = 2112;
    __int16 v24 = v14;
    _os_log_impl(&dword_1B3C5C000, v13, OS_LOG_TYPE_DEFAULT, "%s Reporting finish with result (%@) to the delegate (%@)", (uint8_t *)&v19, 0x20u);
  }
  char v15 = [(WFOutOfProcessWorkflowController *)self serviceConnection];
  uint64_t v16 = [v15 targetType];

  if (v16) {
    uint64_t v17 = 2 * (v16 == 1);
  }
  else {
    uint64_t v17 = 1;
  }
  uint64_t v11 = [(WFOutOfProcessWorkflowController *)self delegate];
  [v11 outOfProcessWorkflowController:self didFinishWithResult:v7 dialogAttribution:v8 runResidency:v17];
LABEL_12:

  uint64_t v18 = [(WFOutOfProcessWorkflowController *)self stateMachine];
  [v18 tearDownRunnerWithReason:@"finished processing result, and notifying the delegate if applicable, done"];
}

- (void)controllerStateMachine:(id)a3 didFinishRunningShortcutWithResult:(id)a4
{
  id v5 = a4;
  id v6 = [(WFOutOfProcessWorkflowController *)self stateMachine];
  id v7 = [(WFOutOfProcessWorkflowController *)self currentDialogAttribution];
  [v6 notifyDelegateWithReason:@"workflow did finish running" result:v5 currentDialogAttribution:v7];

  [(WFOutOfProcessWorkflowController *)self reset];
}

- (void)controllerStateMachine:(id)a3 didRequestStoppingShortcutWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(WFOutOfProcessWorkflowController *)self runner];
  [v6 stopWithError:v5];
}

- (id)runnerWithError:(id *)a3 synchronous:(BOOL)a4 reason:(id)a5
{
  BOOL v5 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = [(WFOutOfProcessWorkflowController *)self stateMachine];
  [v8 acquiringRunnerWithReason:v7];

  uint64_t v9 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v38 = "-[WFOutOfProcessWorkflowController runnerWithError:synchronous:reason:]";
    _os_log_impl(&dword_1B3C5C000, v9, OS_LOG_TYPE_DEFAULT, "%s Creating new connection", buf, 0xCu);
  }

  p_serviceConnectionLock = &self->_serviceConnectionLock;
  os_unfair_lock_lock(&self->_serviceConnectionLock);
  uint64_t v11 = [(WFOutOfProcessWorkflowController *)self serviceConnection];
  os_unfair_lock_unlock(&self->_serviceConnectionLock);
  objc_initWeak((id *)buf, v11);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__WFOutOfProcessWorkflowController_runnerWithError_synchronous_reason___block_invoke;
  aBlock[3] = &unk_1E6076BD8;
  objc_copyWeak(&v34, (id *)buf);
  objc_copyWeak(&v35, &location);
  id v12 = _Block_copy(aBlock);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __71__WFOutOfProcessWorkflowController_runnerWithError_synchronous_reason___block_invoke_151;
  v30[3] = &unk_1E6076BD8;
  objc_copyWeak(&v31, (id *)buf);
  objc_copyWeak(&v32, &location);
  id v13 = _Block_copy(v30);
  os_unfair_lock_lock(&self->_serviceConnectionLock);
  if (v11)
  {
    -[WFRunnerConnection setOnInterruption:](v11, "setOnInterruption:", v12, &v34, &v35);
    [(WFRunnerConnection *)v11 setOnInvalidation:v13];
  }
  else
  {
    char v14 = [WFRunnerConnection alloc];
    char v15 = [(WFOutOfProcessWorkflowController *)self runDescriptor];
    uint64_t v11 = [(WFRunnerConnection *)v14 initWithRunDescriptor:v15 host:self onInterruption:v12 onInvalidation:v13];

    [(WFOutOfProcessWorkflowController *)self setServiceConnection:v11];
  }
  [(WFOutOfProcessWorkflowController *)self serviceConnection];
  if (v5) {
    uint64_t v16 = {;
  }
    uint64_t v29 = 0;
    uint64_t v17 = (id *)&v29;
    uint64_t v18 = [v16 syncRunnerWithReason:v7 error:&v29];
  }
  else {
    uint64_t v16 = {;
  }
    uint64_t v28 = 0;
    uint64_t v17 = (id *)&v28;
    uint64_t v18 = [v16 asyncRunnerWithReason:v7 error:&v28];
  }
  int v19 = (void *)v18;
  id v20 = *v17;

  os_unfair_lock_unlock(p_serviceConnectionLock);
  if (a3 && v20)
  {
    id v21 = v20;
    id v22 = objc_opt_new();
    [v22 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F28A50]];

    [v22 setObject:@"connection bringup failed" forKeyedSubscript:*MEMORY[0x1E4F28568]];
    __int16 v23 = [MEMORY[0x1E4F28C58] errorWithDomain:WFOutOfProcessWorkflowControllerErrorDomain code:2 userInfo:v22];

    *a3 = v23;
  }

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v31);

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return v19;
}

void __71__WFOutOfProcessWorkflowController_runnerWithError_synchronous_reason___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[WFOutOfProcessWorkflowController runnerWithError:synchronous:reason:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = WeakRetained;
    _os_log_impl(&dword_1B3C5C000, v4, OS_LOG_TYPE_INFO, "%s connection was interrupted: %@", (uint8_t *)&v8, 0x16u);
  }

  BOOL v5 = [v3 stateMachine];
  id v6 = [v3 localizedXPCInterruptionErrorDescription];
  id v7 = [v3 currentDialogAttribution];
  [v5 handleXPCErrorWithDescription:v6 reason:@"XPC connection interrupted" currentDialogAttribution:v7];
}

void __71__WFOutOfProcessWorkflowController_runnerWithError_synchronous_reason___block_invoke_151(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[WFOutOfProcessWorkflowController runnerWithError:synchronous:reason:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = WeakRetained;
    _os_log_impl(&dword_1B3C5C000, v4, OS_LOG_TYPE_INFO, "%s connection was invalidated: %@", (uint8_t *)&v8, 0x16u);
  }

  BOOL v5 = [v3 stateMachine];
  id v6 = [v3 localizedXPCInterruptionErrorDescription];
  id v7 = [v3 currentDialogAttribution];
  [v5 handleXPCErrorWithDescription:v6 reason:@"XPC connection invalidated" currentDialogAttribution:v7];
}

- (id)synchronousRunnerWithError:(id *)a3 reason:(id)a4
{
  return [(WFOutOfProcessWorkflowController *)self runnerWithError:a3 synchronous:1 reason:a4];
}

- (id)asynchronousRunnerWithError:(id *)a3 reason:(id)a4
{
  return [(WFOutOfProcessWorkflowController *)self runnerWithError:a3 synchronous:0 reason:a4];
}

- (void)reindexToolKitDatabaseWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F963E8] currentProcess];
  uint64_t v9 = [v8 daemonJobLabel];
  char v10 = [v9 isEqualToString:@"com.apple.siriactionsd"];

  if (v10)
  {
    id v11 = [(WFOutOfProcessWorkflowController *)self stateMachine];
    [v11 handlingRequestWithReason:@"new incoming ToolKit indexing request"];

    id v20 = 0;
    uint64_t v12 = [(WFOutOfProcessWorkflowController *)self asynchronousRunnerWithError:&v20 reason:@"incoming ToolKit indexing request"];
    id v13 = v20;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __88__WFOutOfProcessWorkflowController_reindexToolKitDatabaseWithRequest_completionHandler___block_invoke;
    v18[3] = &unk_1E6079AC8;
    v18[4] = self;
    id v19 = v7;
    id v14 = v13;
    [v12 reindexToolKitDatabaseWithRequest:v6 completionHandler:v18];
    runner = self->_runner;
    self->_runner = (WFOutOfProcessWorkflowControllerVendor *)v12;
    id v16 = v12;
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:WFOutOfProcessWorkflowControllerErrorDomain code:5 userInfo:MEMORY[0x1E4F1CC08]];
    (*((void (**)(id, void *))v7 + 2))(v7, v17);
  }
}

void __88__WFOutOfProcessWorkflowController_reindexToolKitDatabaseWithRequest_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 tearDownRunnerWithReason:@"indexing complete"];
}

- (void)forTestingOnly_simulateXPCInterruption
{
  id v4 = [(WFOutOfProcessWorkflowController *)self stateMachine];
  id v3 = [(WFOutOfProcessWorkflowController *)self currentDialogAttribution];
  [v4 handleXPCErrorWithDescription:@"simulated XPC interruption" reason:@"simulating XPC interruption for testing" currentDialogAttribution:v3];
}

- (void)fetchDisplayValueForRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFOutOfProcessWorkflowController *)self runner];
  [v8 fetchDisplayValueForRequest:v7 completionHandler:v6];
}

- (void)performQuery:(id)a3 inValueSet:(id)a4 toolInvocation:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(WFOutOfProcessWorkflowController *)self runner];
  [v14 performQuery:v13 inValueSet:v12 toolInvocation:v11 completionHandler:v10];
}

- (void)runToolWithInvocation:(id)a3
{
  id v4 = a3;
  id v5 = [(WFOutOfProcessWorkflowController *)self runner];
  [v5 runToolWithInvocation:v4];
}

- (void)fetchToolInvocationSummaryForInvocation:(id)a3 completionHandler:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFOutOfProcessWorkflowController *)self runner];

  if (v8)
  {
    uint64_t v9 = [(WFOutOfProcessWorkflowController *)self runner];
    [v9 fetchToolInvocationSummaryForInvocation:v6 completionHandler:v7];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28798];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    v15[0] = @"You must be running before pulling content from a runtime";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    id v13 = [v10 errorWithDomain:v11 code:94 userInfo:v12];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
  }
}

- (void)resolveDeferredValueFromEncodedStorage:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(WFOutOfProcessWorkflowController *)self runner];

  if (v11)
  {
    id v12 = [(WFOutOfProcessWorkflowController *)self runner];
    [v12 resolveDeferredValueFromEncodedStorage:v8 forEncodedExpectedType:v9 completionHandler:v10];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28798];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"You must be running before pulling content from a runtime";
    char v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v16 = [v13 errorWithDomain:v14 code:94 userInfo:v15];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v16);
  }
}

- (void)extractVariableContentFromEncodedReference:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(WFOutOfProcessWorkflowController *)self runner];

  if (v11)
  {
    id v12 = [(WFOutOfProcessWorkflowController *)self runner];
    [v12 extractVariableContentFromEncodedReference:v8 forEncodedExpectedType:v9 completionHandler:v10];
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28798];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"You must be running before pulling content from a runtime";
    char v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v16 = [v13 errorWithDomain:v14 code:94 userInfo:v15];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v16);
  }
}

- (void)injectContentAsVariable:(id)a3 completionHandler:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFOutOfProcessWorkflowController *)self runner];

  if (v8)
  {
    id v9 = [(WFOutOfProcessWorkflowController *)self runner];
    id v10 = +[WFAnyToolKitVariableContent objectWithVariableContent:v6];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __78__WFOutOfProcessWorkflowController_injectContentAsVariable_completionHandler___block_invoke;
    v15[3] = &unk_1E6077008;
    id v16 = v7;
    [v9 injectContentAsVariable:v10 completionHandler:v15];

    uint64_t v11 = v16;
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F28798];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    v18[0] = @"You must be running before pushing content into a runtime";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v14 = [v12 errorWithDomain:v13 code:94 userInfo:v11];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v14);
  }
}

void __78__WFOutOfProcessWorkflowController_injectContentAsVariable_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 propertyListObject];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)getCurrentProgressCompletedWithCompletionHandler:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(WFOutOfProcessWorkflowController *)self runner];

  if (v4)
  {
    id v5 = [(WFOutOfProcessWorkflowController *)self runner];
    [v5 getCurrentProgressCompletedWithCompletionHandler:v6];
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)handleIncomingFileForRemoteExecutionWithURL:(id)a3 withIdentifier:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v19 = "-[WFOutOfProcessWorkflowController handleIncomingFileForRemoteExecutionWithURL:withIdentifier:]";
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl(&dword_1B3C5C000, v9, OS_LOG_TYPE_DEFAULT, "%s Handling incoming file for remote execution with URL: %@, identifier: %{public}@", buf, 0x20u);
  }

  if (v7)
  {
    if (v8) {
      goto LABEL_5;
    }
  }
  else
  {
    char v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFOutOfProcessWorkflowController.m", 197, @"Invalid parameter not satisfying: %@", @"fileURL" object file lineNumber description];

    if (v8) {
      goto LABEL_5;
    }
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFOutOfProcessWorkflowController.m", 198, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

LABEL_5:
  id v10 = [(WFOutOfProcessWorkflowController *)self runner];

  if (v10)
  {
    id v11 = [(WFOutOfProcessWorkflowController *)self runner];
    [v11 handleIncomingFileForRemoteExecutionWithURL:v7 withIdentifier:v8];
  }
  else
  {
    id v17 = 0;
    id v12 = [(WFOutOfProcessWorkflowController *)self asynchronousRunnerWithError:&v17 reason:@"handling incoming remote execution file"];
    id v11 = v17;
    if (v12)
    {
      [v12 handleIncomingFileForRemoteExecutionWithURL:v7 withIdentifier:v8];
      uint64_t v13 = v12;
      runner = self->_runner;
      self->_runner = v13;
    }
    else
    {
      runner = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(runner, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v19 = "-[WFOutOfProcessWorkflowController handleIncomingFileForRemoteExecutionWithURL:withIdentifier:]";
        __int16 v20 = 2112;
        id v21 = v11;
        _os_log_impl(&dword_1B3C5C000, runner, OS_LOG_TYPE_ERROR, "%s Unable to connect to BackgroundShortcutRunner: %@", buf, 0x16u);
      }
    }
  }
}

- (void)pauseWorkflowAndWriteStateToDisk
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[WFOutOfProcessWorkflowController pauseWorkflowAndWriteStateToDisk]";
    _os_log_impl(&dword_1B3C5C000, v3, OS_LOG_TYPE_DEFAULT, "%s Requested pausing run & writing state to disk", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v4 = [(WFOutOfProcessWorkflowController *)self stateMachine];
  [v4 pauseAndWriteShortcutToDiskState];

  id v5 = [(WFOutOfProcessWorkflowController *)self runner];
  id v6 = [(WFOutOfProcessWorkflowController *)self runningContext];
  [v5 pauseWorkflowAndWriteStateToDisk:v6];
}

- (BOOL)isRunning
{
  id v2 = [(WFOutOfProcessWorkflowController *)self stateMachine];
  char v3 = [v2 isRunningShortcut];

  return v3;
}

- (void)updateRunViewSource:(id)a3
{
  id v4 = a3;
  id v5 = [(WFOutOfProcessWorkflowController *)self runner];
  [v5 updateRunViewSource:v4];
}

- (void)stop
{
  id v2 = [(WFOutOfProcessWorkflowController *)self stateMachine];
  [v2 stopShortcutWithError:0 reason:@"-stop was called"];
}

- (BOOL)resumeRunningWithRequest:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(WFOutOfProcessWorkflowController *)self stateMachine];
  id v8 = NSString;
  uint64_t v9 = [(WFOutOfProcessWorkflowController *)self runningContext];
  id v10 = [v8 stringWithFormat:@"resuming run with request: %@, context: %@", v6, v9];
  [v7 handlingRequestWithReason:v10];

  id v23 = 0;
  id v11 = [(WFOutOfProcessWorkflowController *)self asynchronousRunnerWithError:&v23 reason:@"incoming resume request"];
  id v12 = v23;
  if (v11)
  {
    uint64_t v13 = [v6 presentationMode];
    uint64_t v14 = [(WFOutOfProcessWorkflowController *)self runningContext];
    [v14 setPresentationMode:v13];

    char v15 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(WFOutOfProcessWorkflowController *)self runningContext];
      *(_DWORD *)buf = 136315394;
      uint64_t v25 = "-[WFOutOfProcessWorkflowController resumeRunningWithRequest:error:]";
      __int16 v26 = 2112;
      id v27 = v16;
      _os_log_impl(&dword_1B3C5C000, v15, OS_LOG_TYPE_DEFAULT, "%s Resuming a run for context: %@", buf, 0x16u);
    }
    id v17 = [(WFOutOfProcessWorkflowController *)self stateMachine];
    [v17 startRunningShortcutWithReason:@"resume shortcut request"];

    uint64_t v18 = [(WFOutOfProcessWorkflowController *)self runningContext];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __67__WFOutOfProcessWorkflowController_resumeRunningWithRequest_error___block_invoke;
    v22[3] = &unk_1E6076BB0;
    v22[4] = self;
    [v11 resumeRunningFromContext:v18 withRequest:v6 completion:v22];

    objc_storeStrong((id *)&self->_runner, v11);
  }
  else
  {
    id v19 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v25 = "-[WFOutOfProcessWorkflowController resumeRunningWithRequest:error:]";
      __int16 v26 = 2112;
      id v27 = v12;
      _os_log_impl(&dword_1B3C5C000, v19, OS_LOG_TYPE_ERROR, "%s Unable to connect to BackgroundShortcutRunner: %@", buf, 0x16u);
    }

    if (a4) {
      *a4 = v12;
    }
    __int16 v20 = [(WFOutOfProcessWorkflowController *)self stateMachine];
    [v20 exitWithReason:@"unable to get runner to resume running"];
  }
  return v11 != 0;
}

void __67__WFOutOfProcessWorkflowController_resumeRunningWithRequest_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 stateMachine];
  [v4 finishRunningWithReason:@"resumed run finished" result:v3];
}

- (BOOL)runActionWithRunRequestData:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(WFOutOfProcessWorkflowController *)self stateMachine];
  [v7 handlingRequestWithReason:@"incoming remote execution request"];

  id v17 = 0;
  id v8 = [(WFOutOfProcessWorkflowController *)self asynchronousRunnerWithError:&v17 reason:@"incoming remote execution request"];
  id v9 = v17;
  id v10 = getWFVoiceShortcutClientLogObject();
  id v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[WFOutOfProcessWorkflowController runActionWithRunRequestData:error:]";
      _os_log_impl(&dword_1B3C5C000, v11, OS_LOG_TYPE_DEFAULT, "%s Starting run for remote execution request", buf, 0xCu);
    }

    id v12 = [(WFOutOfProcessWorkflowController *)self stateMachine];
    [v12 startRunningShortcutWithReason:@"incoming remote execution request"];

    uint64_t v13 = [(WFOutOfProcessWorkflowController *)self runningContext];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__WFOutOfProcessWorkflowController_runActionWithRunRequestData_error___block_invoke;
    v16[3] = &unk_1E6076BB0;
    v16[4] = self;
    [v8 runActionFromRunRequestData:v6 runningContext:v13 completion:v16];

    objc_storeStrong((id *)&self->_runner, v8);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v19 = "-[WFOutOfProcessWorkflowController runActionWithRunRequestData:error:]";
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl(&dword_1B3C5C000, v11, OS_LOG_TYPE_ERROR, "%s Unable to connect to BackgroundShortcutRunner: %@", buf, 0x16u);
    }

    if (a4) {
      *a4 = v9;
    }
    uint64_t v14 = [(WFOutOfProcessWorkflowController *)self stateMachine];
    [v14 exitWithReason:@"unable to get runner to run remote execution request"];
  }
  return v8 != 0;
}

void __70__WFOutOfProcessWorkflowController_runActionWithRunRequestData_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 stateMachine];
  [v4 finishRunningWithReason:@"remote execution finished" result:v3];
}

- (BOOL)runWorkflowWithDescriptor:(id)a3 request:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(WFOutOfProcessWorkflowController *)self stateMachine];
  id v11 = [NSString stringWithFormat:@"incoming run request: %@", v9];
  [v10 handlingRequestWithReason:v11];

  id v12 = [v9 automationType];
  uint64_t v13 = [(WFOutOfProcessWorkflowController *)self runningContext];
  [v13 setAutomationType:v12];

  [(WFOutOfProcessWorkflowController *)self setRunRequest:v9];
  [(WFOutOfProcessWorkflowController *)self setRunDescriptor:v8];
  uint64_t v14 = [v9 presentationMode];
  char v15 = [(WFOutOfProcessWorkflowController *)self runningContext];
  [v15 setPresentationMode:v14];

  id v16 = os_log_create("com.apple.shortcuts", "SystemSignpostIntervals");
  id v17 = [(WFOutOfProcessWorkflowController *)self runningContext];
  uint64_t v18 = [v17 identifier];
  os_signpost_id_t v19 = [v18 hash];

  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3C5C000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v19, "RunnerRunRequest", "", buf, 2u);
  }

  __int16 v20 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v21 = [(WFOutOfProcessWorkflowController *)self environment];
    *(_DWORD *)buf = 136315650;
    v33 = "-[WFOutOfProcessWorkflowController runWorkflowWithDescriptor:request:error:]";
    __int16 v34 = 2114;
    id v35 = v9;
    __int16 v36 = 2048;
    int64_t v37 = v21;
    _os_log_impl(&dword_1B3C5C000, v20, OS_LOG_TYPE_DEFAULT, "%s Getting runner to run workflow with request: (%{public}@), environment (%ld)", buf, 0x20u);
  }

  id v31 = 0;
  uint64_t v22 = [(WFOutOfProcessWorkflowController *)self asynchronousRunnerWithError:&v31 reason:@"incoming run request"];
  id v23 = v31;
  if (v22)
  {
    uint64_t v24 = [(WFOutOfProcessWorkflowController *)self stateMachine];
    [v24 startRunningShortcutWithReason:@"run workflow"];

    uint64_t v25 = objc_msgSend(NSNumber, "numberWithInteger:", -[WFOutOfProcessWorkflowController environment](self, "environment"));
    __int16 v26 = [(WFOutOfProcessWorkflowController *)self runningContext];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __76__WFOutOfProcessWorkflowController_runWorkflowWithDescriptor_request_error___block_invoke;
    v30[3] = &unk_1E6076BB0;
    void v30[4] = self;
    [v22 runWorkflowWithDescriptor:v8 request:v9 inEnvironment:v25 runningContext:v26 completion:v30];

    objc_storeStrong((id *)&self->_runner, v22);
  }
  else
  {
    id v27 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[WFOutOfProcessWorkflowController runWorkflowWithDescriptor:request:error:]";
      __int16 v34 = 2112;
      id v35 = v23;
      _os_log_impl(&dword_1B3C5C000, v27, OS_LOG_TYPE_ERROR, "%s Unable to connect to BackgroundShortcutRunner: %@", buf, 0x16u);
    }

    if (a5) {
      *a5 = v23;
    }
    uint64_t v28 = [(WFOutOfProcessWorkflowController *)self stateMachine];
    [v28 exitWithReason:@"unable to get runner to run workflow"];
  }
  return v22 != 0;
}

void __76__WFOutOfProcessWorkflowController_runWorkflowWithDescriptor_request_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 stateMachine];
  [v4 finishRunningWithReason:@"runner callback" result:v3];
}

- (void)reset
{
  [(WFOutOfProcessWorkflowController *)self setCurrentWorkflow:0];
  [(WFOutOfProcessWorkflowController *)self setCurrentDialogAttribution:0];
}

- (WFOutOfProcessWorkflowController)initWithEnvironment:(int64_t)a3 runningContext:(id)a4 presentationMode:(int64_t)a5 existingConnection:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v23.receiver = self;
  v23.super_class = (Class)WFOutOfProcessWorkflowController;
  id v12 = [(WFOutOfProcessWorkflowController *)&v23 init];
  uint64_t v13 = v12;
  if (v12)
  {
    v12->_environment = a3;
    if (v10) {
      uint64_t v14 = (WFWorkflowRunningContext *)v10;
    }
    else {
      uint64_t v14 = [[WFWorkflowRunningContext alloc] initWithWorkflowIdentifier:0];
    }
    runningContext = v13->_runningContext;
    v13->_runningContext = v14;

    v13->_presentationMode = a5;
    id v16 = objc_alloc_init(WFSandboxExtensionManager);
    sandboxExtensionManager = v13->_sandboxExtensionManager;
    v13->_sandboxExtensionManager = v16;

    objc_storeStrong((id *)&v13->_serviceConnection, a6);
    v13->_serviceConnectionLock._os_unfair_lock_opaque = 0;
    uint64_t v18 = objc_alloc_init(WFOutOfProcessWorkflowControllerStateMachine);
    [(WFOutOfProcessWorkflowControllerStateMachine *)v18 setDelegate:v13];
    stateMachine = v13->_stateMachine;
    v13->_stateMachine = v18;
    __int16 v20 = v18;

    [(WFOutOfProcessWorkflowControllerStateMachine *)v20 idleStateWithReason:@"initialized"];
    int64_t v21 = v13;
  }

  return v13;
}

- (WFOutOfProcessWorkflowController)initWithEnvironment:(int64_t)a3 runningContext:(id)a4 presentationMode:(int64_t)a5
{
  return [(WFOutOfProcessWorkflowController *)self initWithEnvironment:a3 runningContext:a4 presentationMode:a5 existingConnection:0];
}

@end