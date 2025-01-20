@interface WFWorkflowController
- (BOOL)acquiresAssertionWhileRunning;
- (BOOL)action:(id)a3 canProvideInputForParameter:(id)a4;
- (BOOL)actionDidRunRemotely;
- (BOOL)canRun;
- (BOOL)donateInteraction;
- (BOOL)isAutomationSuggestion;
- (BOOL)isRunning;
- (BOOL)isStepping;
- (BOOL)isTesting;
- (BOOL)resumed;
- (BOOL)runningAsStepWiseExecutor;
- (BOOL)setContent:(id)a3 forVariableWithName:(id)a4;
- (BOOL)shouldDisablePrivacyPrompts;
- (FBSDisplayLayoutMonitor)displayLayoutMonitor;
- (NSDate)startDate;
- (NSDictionary)listenerEndpoints;
- (NSDictionary)pendingProcessedParameters;
- (NSMapTable)environmentValueTable;
- (NSMapTable)variableTable;
- (NSMutableDictionary)actionOutputsByWorkflowIndex;
- (NSProgress)currentActionProgress;
- (NSProgress)progress;
- (NSString)automationTrialID;
- (NSString)automationType;
- (NSString)runSource;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)executionQueue;
- (OS_voucher)executionVoucher;
- (RBSAssertion)workflowRunAssertion;
- (WFAction)currentAction;
- (WFAction)lastExecutedAction;
- (WFContentCollection)capturedFiles;
- (WFContentCollection)input;
- (WFContentCollection)output;
- (WFContentCollection)pendingActionInput;
- (WFContentItemCache)contentItemCache;
- (WFControlFlowAttributionTracker)flowTracker;
- (WFOutOfProcessWorkflowController)outOfProcessController;
- (WFSmartPromptsExfiltrationLogger)exfiltrationLogger;
- (WFWorkflow)workflow;
- (WFWorkflowController)init;
- (WFWorkflowControllerDelegate)delegate;
- (WFWorkflowControllerState)currentState;
- (WFWorkflowControllerState)pendingState;
- (WFWorkflowRunViewSource)runViewSource;
- (WFWorkflowRunningContext)runningContext;
- (id)actionOutputs;
- (id)actionReversalStateForAction:(id)a3;
- (id)contentForPrivateVariableKey:(id)a3;
- (id)contentForVariableWithName:(id)a3;
- (id)currentStateWithContext:(id)a3;
- (id)environmentValueForKey:(id)a3;
- (id)errorByAddingActionIndex:(int64_t)a3 toError:(id)a4;
- (id)parameterInputProviderForAction:(id)a3;
- (id)remoteDialogPresenterEndpointForRunWorkflowAction:(id)a3;
- (id)stateWithActionIndex:(unint64_t)a3 input:(id)a4 processedParameters:(id)a5;
- (id)userInterface;
- (id)workflowInput;
- (unint64_t)currentIndex;
- (unint64_t)outputBehavior;
- (void)_finishStepWithError:(id)a3;
- (void)_run;
- (void)_step;
- (void)acquireAssertionIfNeeded;
- (void)action:(id)a3 didDecideRunningProgressIsAllowed:(BOOL)a4;
- (void)action:(id)a3 didGenerateReversalState:(id)a4;
- (void)action:(id)a3 handleTestingEvent:(id)a4 completionHandler:(id)a5;
- (void)action:(id)a3 provideInputForParameters:(id)a4 withDefaultStates:(id)a5 prompts:(id)a6 completionHandler:(id)a7;
- (void)autoreleaseSelf;
- (void)captureFileRepresentation:(id)a3;
- (void)dealloc;
- (void)dialogTransformer:(id)a3 stopRunningWithError:(id)a4;
- (void)dialogTransformerDidDisplayDialog:(id)a3;
- (void)dialogTransformerWillDisplayDialog:(id)a3;
- (void)didFinishRunningWithError:(id)a3 cancelled:(BOOL)a4;
- (void)didRunAction:(id)a3 error:(id)a4 withCompletion:(id)a5;
- (void)handleControlFlowActionCompletion:(id)a3 actionGroupSkipped:(BOOL)a4;
- (void)handleError:(id)a3 fromAction:(id)a4 completionHandler:(id)a5;
- (void)invalidateAssertionIfNeeded;
- (void)logFinishActionEventWithAction:(id)a3 completed:(BOOL)a4 error:(id)a5;
- (void)logFinishRunEvent:(BOOL)a3;
- (void)logStartActionEventWithAction:(id)a3;
- (void)logStartEvent;
- (void)noInputBehavior:(id)a3 wantsToRunAction:(id)a4 completionHandler:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareToRunAction:(id)a3 withInput:(id)a4 completionHandler:(id)a5;
- (void)publishActionProgress;
- (void)publishRunningState:(int64_t)a3;
- (void)queue_reset;
- (void)queue_setWorkflow:(id)a3;
- (void)queue_stopWithError:(id)a3;
- (void)requestAccessToFileAtLocations:(id)a3 completionHandler:(id)a4;
- (void)requestAccessToFileAtURLs:(id)a3 completionHandler:(id)a4;
- (void)reset;
- (void)resetEvaluationCriteriaForControlFlowActions;
- (void)resolveWorkflowInputWithCompletion:(id)a3;
- (void)restorePendingStateIfNecessary;
- (void)retainSelf;
- (void)run;
- (void)runAction:(id)a3 withInput:(id)a4 completionHandler:(id)a5;
- (void)setAcquiresAssertionWhileRunning:(BOOL)a3;
- (void)setActionDidRunRemotely:(BOOL)a3;
- (void)setActionOutputsByWorkflowIndex:(id)a3;
- (void)setAutomationTrialID:(id)a3;
- (void)setAutomationType:(id)a3;
- (void)setCapturedFiles:(id)a3;
- (void)setContent:(id)a3 forPrivateVariableKey:(id)a4;
- (void)setContentItemCache:(id)a3;
- (void)setCurrentActionProgress:(id)a3;
- (void)setCurrentIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLayoutMonitor:(id)a3;
- (void)setDonateInteraction:(BOOL)a3;
- (void)setEnvironmentValue:(id)a3 forKey:(id)a4;
- (void)setEnvironmentValueTable:(id)a3;
- (void)setExecutionVoucher:(id)a3;
- (void)setExfiltrationLogger:(id)a3;
- (void)setFinishedRunningWithSuccess:(BOOL)a3;
- (void)setFlowTracker:(id)a3;
- (void)setInput:(id)a3;
- (void)setIsAutomationSuggestion:(BOOL)a3;
- (void)setLastExecutedAction:(id)a3;
- (void)setListenerEndpoints:(id)a3;
- (void)setOutOfProcessController:(id)a3;
- (void)setOutput:(id)a3;
- (void)setOutputBehavior:(unint64_t)a3;
- (void)setPendingActionInput:(id)a3;
- (void)setPendingProcessedParameters:(id)a3;
- (void)setPendingState:(id)a3;
- (void)setProgress:(id)a3;
- (void)setResumed:(BOOL)a3;
- (void)setRunSource:(id)a3;
- (void)setRunViewSource:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setRunningContext:(id)a3;
- (void)setShouldDisablePrivacyPrompts:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setStepping:(BOOL)a3;
- (void)setUpProgress;
- (void)setUpRunState;
- (void)setVariableTable:(id)a3;
- (void)setWorkflow:(id)a3;
- (void)setWorkflowRunAssertion:(id)a3;
- (void)step;
- (void)stop;
- (void)stopWithError:(id)a3;
- (void)trackRunActionEventWithKey:(id)a3 action:(id)a4 completed:(BOOL)a5 error:(id)a6;
- (void)trackRunShortcutEventWithKey:(id)a3 completed:(BOOL)a4;
- (void)workflowControllerWillRun:(id)a3;
@end

@implementation WFWorkflowController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
  objc_storeStrong((id *)&self->_exfiltrationLogger, 0);
  objc_storeStrong((id *)&self->_capturedFiles, 0);
  objc_storeStrong((id *)&self->_contentItemCache, 0);
  objc_storeStrong((id *)&self->_flowTracker, 0);
  objc_storeStrong((id *)&self->_outOfProcessController, 0);
  objc_storeStrong((id *)&self->_executionVoucher, 0);
  objc_storeStrong((id *)&self->_workflowRunAssertion, 0);
  objc_storeStrong((id *)&self->_pendingActionInput, 0);
  objc_storeStrong((id *)&self->_pendingProcessedParameters, 0);
  objc_storeStrong((id *)&self->_pendingState, 0);
  objc_storeStrong((id *)&self->_environmentValueTable, 0);
  objc_storeStrong((id *)&self->_variableTable, 0);
  objc_storeStrong((id *)&self->_actionOutputsByWorkflowIndex, 0);
  objc_storeStrong((id *)&self->_currentActionProgress, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_listenerEndpoints, 0);
  objc_storeStrong((id *)&self->_automationTrialID, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
  objc_storeStrong((id *)&self->_runSource, 0);
  objc_storeStrong((id *)&self->_runningContext, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastExecutedAction, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
}

- (void)setActionDidRunRemotely:(BOOL)a3
{
  self->_actionDidRunRemotely = a3;
}

- (BOOL)actionDidRunRemotely
{
  return self->_actionDidRunRemotely;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)setExfiltrationLogger:(id)a3
{
}

- (void)setCapturedFiles:(id)a3
{
}

- (void)setContentItemCache:(id)a3
{
}

- (void)setFlowTracker:(id)a3
{
}

- (void)setOutOfProcessController:(id)a3
{
}

- (WFOutOfProcessWorkflowController)outOfProcessController
{
  return self->_outOfProcessController;
}

- (void)setExecutionVoucher:(id)a3
{
}

- (OS_voucher)executionVoucher
{
  return self->_executionVoucher;
}

- (void)setWorkflowRunAssertion:(id)a3
{
}

- (RBSAssertion)workflowRunAssertion
{
  return self->_workflowRunAssertion;
}

- (void)setPendingActionInput:(id)a3
{
}

- (WFContentCollection)pendingActionInput
{
  return self->_pendingActionInput;
}

- (void)setPendingProcessedParameters:(id)a3
{
}

- (NSDictionary)pendingProcessedParameters
{
  return self->_pendingProcessedParameters;
}

- (void)setPendingState:(id)a3
{
}

- (WFWorkflowControllerState)pendingState
{
  return self->_pendingState;
}

- (void)setEnvironmentValueTable:(id)a3
{
}

- (void)setVariableTable:(id)a3
{
}

- (void)setActionOutputsByWorkflowIndex:(id)a3
{
}

- (NSMutableDictionary)actionOutputsByWorkflowIndex
{
  return self->_actionOutputsByWorkflowIndex;
}

- (NSProgress)currentActionProgress
{
  return self->_currentActionProgress;
}

- (void)setResumed:(BOOL)a3
{
  self->_resumed = a3;
}

- (BOOL)resumed
{
  return self->_resumed;
}

- (void)setStepping:(BOOL)a3
{
  self->_stepping = a3;
}

- (BOOL)isStepping
{
  return self->_stepping;
}

- (void)setCurrentIndex:(unint64_t)a3
{
  self->_currentIndex = a3;
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setAcquiresAssertionWhileRunning:(BOOL)a3
{
  self->_acquiresAssertionWhileRunning = a3;
}

- (BOOL)acquiresAssertionWhileRunning
{
  return self->_acquiresAssertionWhileRunning;
}

- (void)setOutputBehavior:(unint64_t)a3
{
  self->_outputBehavior = a3;
}

- (unint64_t)outputBehavior
{
  return self->_outputBehavior;
}

- (void)setListenerEndpoints:(id)a3
{
}

- (NSDictionary)listenerEndpoints
{
  return self->_listenerEndpoints;
}

- (void)setAutomationTrialID:(id)a3
{
}

- (NSString)automationTrialID
{
  return self->_automationTrialID;
}

- (void)setIsAutomationSuggestion:(BOOL)a3
{
  self->_isAutomationSuggestion = a3;
}

- (BOOL)isAutomationSuggestion
{
  return self->_isAutomationSuggestion;
}

- (void)setAutomationType:(id)a3
{
}

- (NSString)automationType
{
  return self->_automationType;
}

- (void)setShouldDisablePrivacyPrompts:(BOOL)a3
{
  self->_shouldDisablePrivacyPrompts = a3;
}

- (BOOL)shouldDisablePrivacyPrompts
{
  return self->_shouldDisablePrivacyPrompts;
}

- (void)setRunViewSource:(id)a3
{
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (void)setRunSource:(id)a3
{
}

- (NSString)runSource
{
  return self->_runSource;
}

- (void)setRunningContext:(id)a3
{
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void)setDelegate:(id)a3
{
}

- (WFWorkflowControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFWorkflowControllerDelegate *)WeakRetained;
}

- (void)setDonateInteraction:(BOOL)a3
{
  self->_donateInteraction = a3;
}

- (BOOL)donateInteraction
{
  return self->_donateInteraction;
}

- (void)setLastExecutedAction:(id)a3
{
}

- (WFAction)lastExecutedAction
{
  return self->_lastExecutedAction;
}

- (void)setOutput:(id)a3
{
}

- (WFContentCollection)output
{
  return self->_output;
}

- (void)setInput:(id)a3
{
}

- (WFContentCollection)input
{
  return self->_input;
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (void)dialogTransformerDidDisplayDialog:(id)a3
{
}

- (void)dialogTransformerWillDisplayDialog:(id)a3
{
}

- (void)dialogTransformer:(id)a3 stopRunningWithError:(id)a4
{
}

- (void)noInputBehavior:(id)a3 wantsToRunAction:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__WFWorkflowController_noInputBehavior_wantsToRunAction_completionHandler___block_invoke;
  v11[3] = &unk_1E6557D28;
  id v12 = v7;
  v13 = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  [(WFWorkflowController *)self prepareToRunAction:v10 withInput:0 completionHandler:v11];
}

void __75__WFWorkflowController_noInputBehavior_wantsToRunAction_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) userInterface];
  v3 = *(void **)(a1 + 40);
  v4 = [v3 executionQueue];
  [v2 runWithInput:0 userInterface:v5 runningDelegate:v3 variableSource:0 workQueue:v4 completionHandler:*(void *)(a1 + 48)];
}

- (void)resolveWorkflowInputWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFWorkflowController.m", 1382, @"Invalid parameter not satisfying: %@", @"completionBlock" object file lineNumber description];
  }
  v6 = [(WFWorkflowController *)self executionQueue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(WFWorkflowController *)self input];
  uint64_t v8 = [v7 numberOfItems];

  if (v8 < 1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke;
    aBlock[3] = &unk_1E65572A0;
    aBlock[4] = self;
    id v10 = v5;
    id v26 = v10;
    v11 = (void (**)(void))_Block_copy(aBlock);
    id v12 = [(WFWorkflowController *)self workflow];
    v13 = [v12 workflowTypes];
    int v14 = [v13 containsObject:*MEMORY[0x1E4FB4FB0]];

    if (v14)
    {
      v15 = [(WFWorkflowController *)self workflow];
      v16 = [v15 inputClasses];

      id v17 = objc_alloc_init(MEMORY[0x1E4FB4808]);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_4;
      v20[3] = &unk_1E65511A8;
      id v21 = v16;
      v22 = self;
      id v23 = v10;
      v24 = v11;
      id v18 = v16;
      [v17 getOnScreenContentForInputContentClasses:v18 completionHandler:v20];
    }
    else
    {
      v11[2](v11);
    }
  }
  else
  {
    id v9 = [(WFWorkflowController *)self input];
    (*((void (**)(id, void *, void))v5 + 2))(v5, v9, 0);
  }
}

void __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) workflow];
  v3 = [v2 noInputBehavior];

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) workflow];
    id v5 = [v4 noInputBehavior];
    v6 = [*(id *)(a1 + 32) userInterface];
    uint64_t v7 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_2;
    v9[3] = &unk_1E6556C08;
    v9[4] = v7;
    id v10 = *(id *)(a1 + 40);
    [v5 resolveWithUserInterface:v6 runningDelegate:v7 completionHandler:v9];
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v8();
  }
}

void __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 numberOfItems])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_5;
    v10[3] = &unk_1E6551180;
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(a1 + 48);
    v10[4] = *(void *)(a1 + 40);
    id v11 = v5;
    id v12 = *(id *)(a1 + 56);
    [v3 generateCollectionByCoercingToItemClasses:v4 completionHandler:v10];

    v6 = v11;
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 40) executionQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_7;
    v8[3] = &unk_1E6558678;
    id v9 = *(id *)(a1 + 56);
    dispatch_async(v7, v8);

    v6 = v9;
  }
}

void __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_5(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1[4] executionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_6;
  block[3] = &unk_1E6551158;
  id v7 = v3;
  id v8 = a1[5];
  id v9 = a1[6];
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_6(uint64_t a1)
{
  if ([*(id *)(a1 + 32) numberOfItems])
  {
    v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v2();
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v4();
  }
}

void __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) executionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_3;
  block[3] = &unk_1E6557D28;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __59__WFWorkflowController_resolveWorkflowInputWithCompletion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)errorByAddingActionIndex:(int64_t)a3 toError:(id)a4
{
  id v5 = a4;
  id v6 = [v5 userInfo];
  id v7 = (void *)[v6 mutableCopy];

  id v8 = [NSNumber numberWithInteger:a3];
  [v7 setObject:v8 forKeyedSubscript:@"WFActionIndex"];

  id v9 = (void *)MEMORY[0x1E4F28C58];
  id v10 = [v5 domain];
  uint64_t v11 = [v5 code];

  id v12 = [v9 errorWithDomain:v10 code:v11 userInfo:v7];

  return v12;
}

- (void)resetEvaluationCriteriaForControlFlowActions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(WFWorkflowController *)self workflow];
  uint64_t v4 = [v3 actions];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v9 resetEvaluationCriteriaWithVariableSource:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setUpProgress
{
  objc_initWeak(&location, self);
  id v3 = [(WFWorkflowController *)self runningContext];
  uint64_t v4 = [(WFWorkflowController *)self workflow];
  uint64_t v5 = [v4 actions];
  uint64_t v6 = WFProgressUnitsBetweenActions(v5, 0, 0);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  long long v10 = __37__WFWorkflowController_setUpProgress__block_invoke;
  long long v11 = &unk_1E6555640;
  objc_copyWeak(&v12, &location);
  uint64_t v7 = [v3 progressForPublishingWithTotalUnitCount:v6 cancellationHandler:&v8];
  -[WFWorkflowController setProgress:](self, "setProgress:", v7, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __37__WFWorkflowController_setUpProgress__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    uint64_t v4 = "-[WFWorkflowController setUpProgress]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_DEFAULT, "%s Stopping from progress cancellation", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained stop];
}

- (void)setUpRunState
{
  int v3 = [(WFWorkflowController *)self executionQueue];
  dispatch_assert_queue_V2(v3);

  [(WFWorkflowController *)self logStartEvent];
  [(WFWorkflowController *)self setUpProgress];
  int64_t v4 = [(WFWorkflowController *)self currentIndex] - 1;
  if (v4 >= 0)
  {
    uint64_t v5 = [(WFWorkflowController *)self workflow];
    uint64_t v6 = [v5 actions];
    unint64_t v7 = [v6 count];

    if (v4 < v7)
    {
      uint64_t v8 = [(WFWorkflowController *)self workflow];
      uint64_t v9 = [v8 actions];
      long long v10 = [v9 objectAtIndexedSubscript:v4];

      long long v11 = [(WFWorkflowController *)self workflow];
      id v12 = [v11 actions];
      uint64_t v13 = WFProgressUnitsBetweenActions(v12, 0, v10);
      id v14 = [(WFWorkflowController *)self progress];
      [v14 setCompletedUnitCount:v13];
    }
  }
  [(WFWorkflowController *)self setRunning:1];
  [(WFWorkflowController *)self publishRunningState:1];
  uint64_t v15 = [(WFWorkflowController *)self startDate];

  if (!v15)
  {
    id v16 = [MEMORY[0x1E4F1C9C8] date];
    [(WFWorkflowController *)self setStartDate:v16];
  }
}

- (void)restorePendingStateIfNecessary
{
  int v3 = [(WFWorkflowController *)self executionQueue];
  dispatch_assert_queue_V2(v3);

  int64_t v4 = [(WFWorkflowController *)self pendingState];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 variables];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __54__WFWorkflowController_restorePendingStateIfNecessary__block_invoke;
    v30[3] = &unk_1E6551130;
    v30[4] = self;
    [v6 enumerateKeysAndObjectsUsingBlock:v30];

    unint64_t v7 = [v5 currentInput];
    [(WFWorkflowController *)self setPendingActionInput:v7];

    -[WFWorkflowController setCurrentIndex:](self, "setCurrentIndex:", [v5 currentActionIndex]);
    uint64_t v8 = [v5 currentProcessedParameters];
    [(WFWorkflowController *)self setPendingProcessedParameters:v8];

    -[WFWorkflowController setOutputBehavior:](self, "setOutputBehavior:", [v5 outputBehavior]);
    uint64_t v9 = [v5 runningContext];

    if (v9)
    {
      long long v10 = [(WFWorkflowController *)self runningContext];
      long long v11 = [v10 originatingBundleIdentifier];

      id v12 = [v5 runningContext];
      [v12 setOriginatingBundleIdentifier:v11];

      uint64_t v13 = [v5 runningContext];
      [(WFWorkflowController *)self setRunningContext:v13];
    }
    id v14 = [v5 contentItemCache];
    [(WFWorkflowController *)self setContentItemCache:v14];

    uint64_t v15 = [v5 flowTracker];
    [(WFWorkflowController *)self setFlowTracker:v15];

    unint64_t v16 = [v5 currentActionIndex];
    id v17 = [(WFWorkflowController *)self workflow];
    id v18 = [v17 actions];
    unint64_t v19 = [v18 count];

    if (v16 < v19)
    {
      v20 = [(WFWorkflowController *)self workflow];
      id v21 = [v20 actions];
      v22 = objc_msgSend(v21, "objectAtIndex:", objc_msgSend(v5, "currentActionIndex"));

      id v23 = [v5 currentActionContentAttributionTracker];
      [v22 setContentAttributionTracker:v23];

      v24 = [v5 allowedOnceSmartPromptStates];
      [v22 setAllowedOnceSmartPromptStates:v24];
    }
    v25 = [v5 startDate];
    [(WFWorkflowController *)self setStartDate:v25];

    [(WFWorkflowController *)self setResumed:1];
    [(WFWorkflowController *)self setPendingState:0];
    id v26 = [(WFWorkflowController *)self userInterface];
    char v27 = objc_opt_respondsToSelector();

    if (v27)
    {
      v28 = [(WFWorkflowController *)self userInterface];
      v29 = [v28 dialogTransformer];

      if (v29)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v29, "setNumberOfDialogsPresented:", objc_msgSend(v5, "numberOfDialogsPresented"));
        }
      }
    }
  }
}

void __54__WFWorkflowController_restorePendingStateIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v7 = [v4 variableTable];
  [v7 setObject:v5 forKey:v6];
}

- (BOOL)canRun
{
  return ![(WFWorkflowController *)self isRunning];
}

- (void)handleControlFlowActionCompletion:(id)a3 actionGroupSkipped:(BOOL)a4
{
  BOOL v4 = a4;
  v85[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(WFWorkflowController *)self executionQueue];
  dispatch_assert_queue_V2(v7);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    uint64_t v9 = [v8 groupedOpenAction];
    long long v10 = [v8 groupedCloseAction];
    long long v11 = [(WFWorkflowController *)self workflow];
    id v12 = [v11 actions];
    uint64_t v13 = WFProgressUnitsBetweenActions(v12, v9, v10);
    uint64_t v14 = [v9 numberOfLoops] * v13;
    uint64_t v15 = [v9 progress];
    [v15 setTotalUnitCount:v14];

    if ([v8 mode] != 2 && !v4) {
      goto LABEL_40;
    }
    if (v4)
    {
      unint64_t v16 = objc_opt_new();
      [v10 setOutput:v16 onVariableSource:self];
    }
    if (![v9 shouldRepeatWithVariableSource:self])
    {
      [v9 resetEvaluationCriteriaWithVariableSource:self];
      [v9 setProgress:0];
LABEL_40:

LABEL_41:
LABEL_50:

      goto LABEL_51;
    }
    uint64_t v81 = [v9 progress];
    id v17 = [(WFWorkflowController *)self workflow];
    id v18 = [v17 actions];
    unint64_t v19 = [v18 indexOfObject:v9];

    if (v19 < [(WFWorkflowController *)self currentIndex] - 1)
    {
      unint64_t v20 = v19;
      do
      {
        id v21 = [(WFWorkflowController *)self workflow];
        v22 = [v21 actions];
        id v23 = [v22 objectAtIndexedSubscript:v20];
        [v23 resetOutput];

        ++v20;
      }
      while (v20 < [(WFWorkflowController *)self currentIndex] - 1);
    }
    v24 = (void *)v81;
    [v9 setProgress:v81];
    [(WFWorkflowController *)self setCurrentIndex:v19];
LABEL_39:

    goto LABEL_40;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    v25 = [v8 groupedOpenAction];
    id v26 = [v8 groupedIntermediaryActions];
    char v27 = [v26 firstObject];

    v28 = [v8 groupedCloseAction];
    if ([v8 mode] && objc_msgSend(v8, "mode") != 1)
    {
      if ([v8 mode] == 2 || v4)
      {
        [v25 resetEvaluationCriteriaWithVariableSource:self];
        [v25 setProgress:0];
      }
      goto LABEL_49;
    }
    v29 = (void *)[v25 truthWithVariableSource:self];
    if (_os_feature_enabled_impl())
    {
      v30 = (void *)MEMORY[0x1E4F5A830];
      v80 = v27;
      v31 = (void *)MEMORY[0x1E4F5A7B0];
      v76 = [NSNumber numberWithBool:v29];
      v32 = [v31 itemWithObject:v76];
      v85[0] = v32;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:1];
      v33 = v79 = v28;
      v34 = [v30 collectionWithItems:v33];
      [(WFWorkflowController *)self actionOutputsByWorkflowIndex];
      v29 = int v78 = (int)v29;
      v82 = v25;
      v35 = NSNumber;
      v36 = [(WFWorkflowController *)self workflow];
      v37 = [v36 actions];
      v38 = objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v37, "indexOfObject:", v82));
      [v29 setObject:v34 forKeyedSubscript:v38];

      v25 = v82;
      LODWORD(v29) = v78;

      v28 = v79;
      char v27 = v80;

      if (v80)
      {
        v39 = (void *)MEMORY[0x1E4F5A830];
        v40 = (void *)MEMORY[0x1E4F5A7B0];
        v77 = [NSNumber numberWithBool:v78 ^ 1u];
        v41 = [v40 itemWithObject:v77];
        v84 = v41;
        v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
        v43 = [v39 collectionWithItems:v42];
        v44 = [(WFWorkflowController *)self actionOutputsByWorkflowIndex];
        v45 = NSNumber;
        v29 = [(WFWorkflowController *)self workflow];
        v46 = [v29 actions];
        v47 = objc_msgSend(v45, "numberWithUnsignedInteger:", objc_msgSend(v46, "indexOfObject:", v80));
        [v44 setObject:v43 forKeyedSubscript:v47];

        v25 = v82;
        LODWORD(v29) = v78;

        v28 = v79;
        char v27 = v80;
      }
    }
    if ([v8 mode]) {
      char v48 = 1;
    }
    else {
      char v48 = (char)v29;
    }
    if (v48)
    {
      if ([v8 mode] == 1) {
        int v49 = (int)v29;
      }
      else {
        int v49 = 0;
      }
      if (v49 != 1) {
        goto LABEL_45;
      }
      v50 = [v8 output];
      [v28 setOutput:v50];
    }
    else
    {
      v61 = [v8 output];
      if (v27)
      {
        [v27 setOutput:v61];

        v62 = [(WFWorkflowController *)self workflow];
        v63 = [v62 actions];
        uint64_t v64 = [v63 indexOfObject:v27] + 1;
LABEL_44:
        [(WFWorkflowController *)self setCurrentIndex:v64];

LABEL_45:
        v69 = [(WFWorkflowController *)self workflow];
        v70 = [v69 actions];
        v71 = v70;
        if (v29)
        {
          v72 = v25;
          v73 = v27;
        }
        else
        {
          v72 = v27;
          v73 = v28;
        }
        uint64_t v74 = WFProgressUnitsBetweenActions(v70, v72, v73);
        v75 = [v25 progress];
        [v75 setTotalUnitCount:v74];

LABEL_49:
        goto LABEL_50;
      }
      [v28 setOutput:v61];
    }
    v62 = [(WFWorkflowController *)self workflow];
    v63 = [v62 actions];
    uint64_t v64 = [v63 indexOfObject:v28];
    goto LABEL_44;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    uint64_t v9 = [v8 groupedOpenAction];
    if ([v8 mode] && objc_msgSend(v8, "mode") != 1) {
      goto LABEL_41;
    }
    if ([v8 latestMenuChoice] == -1)
    {
      long long v10 = [v8 groupedCloseAction];
      v65 = [v8 output];
      [v10 setOutput:v65];

      v66 = [v9 progress];
      uint64_t v67 = [v66 totalUnitCount];
      v68 = [v9 progress];
      [v68 setCompletedUnitCount:v67];

      v24 = [(WFWorkflowController *)self workflow];
      v53 = [v24 actions];
      -[WFWorkflowController setCurrentIndex:](self, "setCurrentIndex:", [v53 indexOfObject:v10]);
    }
    else
    {
      v51 = [(WFWorkflowController *)self workflow];
      long long v10 = [v51 actionsGroupedWithAction:v8];

      v52 = [v8 groupedIntermediaryActions];
      v24 = objc_msgSend(v52, "objectAtIndex:", objc_msgSend(v8, "latestMenuChoice"));

      v53 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v10, "indexOfObject:", v24) + 1);
      v54 = [(WFWorkflowController *)self workflow];
      v55 = [v54 actions];
      uint64_t v56 = WFProgressUnitsBetweenActions(v55, v24, v53);
      [v9 progress];
      v57 = v83 = v9;
      [v57 setTotalUnitCount:v56];

      v58 = [v8 output];
      [v24 setOutput:v58];

      v59 = [(WFWorkflowController *)self workflow];
      v60 = [v59 actions];
      -[WFWorkflowController setCurrentIndex:](self, "setCurrentIndex:", [v60 indexOfObject:v24] + 1);

      uint64_t v9 = v83;
    }

    goto LABEL_39;
  }
LABEL_51:
}

- (void)handleError:(id)a3 fromAction:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  long long v11 = (void (**)(id, uint64_t))a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"WFWorkflowController.m", 1124, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v44 = [MEMORY[0x1E4F28B00] currentHandler];
  [v44 handleFailureInMethod:a2, self, @"WFWorkflowController.m", 1125, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

LABEL_3:
  id v12 = [v9 domain];
  uint64_t v13 = [v9 code];
  int v14 = [v12 isEqualToString:@"WFActionErrorDomain"];
  int v15 = [v12 isEqualToString:*MEMORY[0x1E4F5ABE8]];
  if (v13 == 2) {
    int v16 = v14;
  }
  else {
    int v16 = 0;
  }
  if (v14 && v13 == 4)
  {
    id v17 = [(WFWorkflowController *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke;
    block[3] = &unk_1E6558938;
    void block[4] = self;
    id v18 = v10;
    id v56 = v18;
    dispatch_async(v17, block);

    unint64_t v19 = [(WFWorkflowController *)self outputBehavior];
    if (v19 <= 3 && v19 != 1)
    {
      unint64_t v20 = [v18 output];
      [(WFWorkflowController *)self setOutput:v20];
    }
    uint64_t v21 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:7 userInfo:0];

    v11[2](v11, v21);
    id v9 = (id)v21;
  }
  else
  {
    if (v13) {
      int v22 = 0;
    }
    else {
      int v22 = v15;
    }
    if (v22 == 1
      && ([(WFWorkflowController *)self delegate],
          id v23 = objc_claimAutoreleasedReturnValue(),
          char v24 = objc_opt_respondsToSelector(),
          v23,
          (v24 & 1) != 0))
    {
      v25 = [v9 userInfo];
      id v26 = [v25 objectForKey:@"ActionInput"];

      char v27 = [v9 userInfo];
      v28 = [v27 objectForKey:@"ActionProcessedParameters"];

      v29 = [(WFWorkflowController *)self workflow];
      v30 = [v29 actions];
      v31 = -[WFWorkflowController stateWithActionIndex:input:processedParameters:](self, "stateWithActionIndex:input:processedParameters:", [v30 indexOfObject:v10], v26, v28);

      v32 = [(WFWorkflowController *)self delegateQueue];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_2;
      v50[3] = &unk_1E6555DC8;
      v50[4] = self;
      id v51 = v10;
      id v52 = v31;
      v54 = v11;
      id v9 = v9;
      id v53 = v9;
      id v33 = v31;
      dispatch_async(v32, v50);

      v34 = v51;
    }
    else
    {
      if (!v16
        || ([(WFWorkflowController *)self delegate],
            v35 = objc_claimAutoreleasedReturnValue(),
            char v36 = objc_opt_respondsToSelector(),
            v35,
            (v36 & 1) == 0))
      {
        v11[2](v11, (uint64_t)v9);
        goto LABEL_23;
      }
      v37 = [v9 userInfo];
      id v26 = [v37 objectForKey:@"ActionInput"];

      v38 = [v9 userInfo];
      v28 = [v38 objectForKey:@"ActionProcessedParameters"];

      v39 = [(WFWorkflowController *)self workflow];
      v40 = [v39 actions];
      v41 = -[WFWorkflowController stateWithActionIndex:input:processedParameters:](self, "stateWithActionIndex:input:processedParameters:", [v40 indexOfObject:v10], v26, v28);

      v42 = [(WFWorkflowController *)self delegateQueue];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_6;
      v45[3] = &unk_1E6555DC8;
      v45[4] = self;
      id v46 = v10;
      id v47 = v41;
      int v49 = v11;
      id v9 = v9;
      id v48 = v9;
      id v33 = v41;
      dispatch_async(v42, v45);

      v34 = v46;
    }
  }
LABEL_23:
}

void __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 workflowController:*(void *)(a1 + 32) actionDidRequestWorkflowExit:*(void *)(a1 + 40)];
  }
}

void __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_3;
  v10[3] = &unk_1E6558AC8;
  v10[4] = v3;
  id v11 = *(id *)(a1 + 64);
  LOBYTE(v3) = [v2 workflowController:v3 handleUnsupportedUserInterfaceForAction:v4 currentState:v5 completionHandler:v10];

  if ((v3 & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 32) executionQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_5;
    v7[3] = &unk_1E65572A0;
    id v9 = *(id *)(a1 + 64);
    id v8 = *(id *)(a1 + 56);
    dispatch_async(v6, v7);
  }
}

void __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_6(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_7;
  v10[3] = &unk_1E6558FD0;
  v10[4] = v4;
  id v11 = v3;
  id v12 = *(id *)(a1 + 64);
  LOBYTE(v4) = [v2 workflowController:v4 handleUnsupportedEnvironmentForAction:v11 currentState:v5 completionHandler:v10];

  if ((v4 & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 32) executionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_9;
    block[3] = &unk_1E65572A0;
    id v9 = *(id *)(a1 + 64);
    id v8 = *(id *)(a1 + 56);
    dispatch_async(v6, block);
  }
}

void __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_7(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[4] executionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_8;
  block[3] = &unk_1E6555DC8;
  id v12 = a1[5];
  id v13 = v5;
  id v14 = a1[4];
  id v8 = a1[6];
  id v15 = v6;
  id v16 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) setOutput:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setOutput:*(void *)(a1 + 40) onVariableSource:*(void *)(a1 + 48)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v2();
}

void __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) executionQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_4;
  v7[3] = &unk_1E65572A0;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __65__WFWorkflowController_handleError_fromAction_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)userInterface
{
  id v3 = [(WFWorkflowController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(WFWorkflowController *)self delegate];
    id v6 = [v5 userInterfaceForWorkflowController:self];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)parameterInputProviderForAction:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWorkflowController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WFWorkflowController *)self delegate];
    id v8 = [v7 workflowController:self parameterInputProviderForAction:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)didRunAction:(id)a3 error:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WFWorkflowController *)self executionQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(WFWorkflowController *)self userInterface];
  id v13 = v12;
  if (v12 && [v12 isRunningWithSiriUI])
  {
    id v14 = [v8 identifier];
    [v13 didFinishActionWithIdentifier:v14];
  }
  id v15 = [(WFWorkflowController *)self delegateQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __58__WFWorkflowController_didRunAction_error_withCompletion___block_invoke;
  v19[3] = &unk_1E65586A0;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  dispatch_async(v15, v19);
}

void __58__WFWorkflowController_didRunAction_error_withCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  id v4 = [*(id *)(a1 + 32) delegate];
  if (v3)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__WFWorkflowController_didRunAction_error_withCompletion___block_invoke_2;
    v14[3] = &unk_1E65572A0;
    v14[4] = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    id v15 = *(id *)(a1 + 56);
    [v4 workflowController:v5 didRunAction:v6 error:v7 completionHandler:v14];

    id v8 = v15;
  }
  else
  {
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0) {
      return;
    }
    id v10 = [*(id *)(a1 + 32) delegate];
    [v10 workflowController:*(void *)(a1 + 32) didRunAction:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];

    id v11 = [*(id *)(a1 + 32) executionQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__WFWorkflowController_didRunAction_error_withCompletion___block_invoke_4;
    block[3] = &unk_1E6558678;
    id v13 = *(id *)(a1 + 56);
    dispatch_async(v11, block);

    id v8 = v13;
  }
}

void __58__WFWorkflowController_didRunAction_error_withCompletion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) executionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__WFWorkflowController_didRunAction_error_withCompletion___block_invoke_3;
  block[3] = &unk_1E6558678;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

uint64_t __58__WFWorkflowController_didRunAction_error_withCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__WFWorkflowController_didRunAction_error_withCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runAction:(id)a3 withInput:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(WFWorkflowController *)self executionQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(WFWorkflowController *)self userInterface];
  id v13 = v12;
  if (v12 && [v12 isRunningWithSiriUI])
  {
    id v14 = [v8 identifier];
    [v13 didStartActionWithIdentifier:v14];
  }
  id v15 = [(WFWorkflowController *)self userInterface];
  id v16 = [(WFWorkflowController *)self executionQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__WFWorkflowController_runAction_withInput_completionHandler___block_invoke;
  v18[3] = &unk_1E6556C08;
  v18[4] = self;
  id v19 = v9;
  id v17 = v9;
  [v8 runWithInput:v10 userInterface:v15 runningDelegate:self variableSource:self workQueue:v16 completionHandler:v18];
}

void __62__WFWorkflowController_runAction_withInput_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) executionQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__WFWorkflowController_runAction_withInput_completionHandler___block_invoke_2;
  v11[3] = &unk_1E65586A0;
  id v8 = *(void **)(a1 + 40);
  void v11[4] = *(void *)(a1 + 32);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

uint64_t __62__WFWorkflowController_runAction_withInput_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) executionVoucher];
  objc_claimAutoreleasedReturnValue();

  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v2();
}

- (void)prepareToRunAction:(id)a3 withInput:(id)a4 completionHandler:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  id v11 = [(WFWorkflowController *)self executionQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v21 = "-[WFWorkflowController prepareToRunAction:withInput:completionHandler:]";
    __int16 v22 = 2114;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_INFO, "%s Preparing to run action: %{public}@, with input: %@", buf, 0x20u);
  }

  id v13 = [(WFWorkflowController *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = [(WFWorkflowController *)self delegateQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__WFWorkflowController_prepareToRunAction_withInput_completionHandler___block_invoke;
    v16[3] = &unk_1E65586A0;
    v16[4] = self;
    id v17 = v8;
    id v18 = v9;
    id v19 = v10;
    dispatch_async(v15, v16);
  }
  else
  {
    v10[2](v10);
  }
}

void __71__WFWorkflowController_prepareToRunAction_withInput_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__WFWorkflowController_prepareToRunAction_withInput_completionHandler___block_invoke_2;
  v6[3] = &unk_1E65572A0;
  v6[4] = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v2 workflowController:v3 prepareToRunAction:v4 withInput:v5 completionHandler:v6];
}

void __71__WFWorkflowController_prepareToRunAction_withInput_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) executionQueue];
  dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));
}

- (void)didFinishRunningWithError:(id)a3 cancelled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [(WFWorkflowController *)self executionQueue];
  dispatch_assert_queue_V2(v8);

  if (v7 && v4)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"WFWorkflowController.m" lineNumber:1028 description:@"Clients of WFWorkflowController should never receive both cancelled = YES and an error; they are mutually exclusive"];
  }
  id v9 = [(WFWorkflowController *)self displayLayoutMonitor];
  [v9 invalidate];

  [(WFWorkflowController *)self setDisplayLayoutMonitor:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v10 = [(WFWorkflowController *)self workflow];
  id v11 = [v10 actions];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v17 = [v16 extendedOperation];

        if (v17)
        {
          id v18 = [v16 extendedOperation];
          [v18 cancel];

          [v16 setExtendedOperation:0];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  [(WFWorkflowController *)self setResumed:0];
  [(WFWorkflowController *)self autoreleaseSelf];
  id v19 = [(WFWorkflowController *)self delegateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__WFWorkflowController_didFinishRunningWithError_cancelled___block_invoke;
  block[3] = &unk_1E6552EF0;
  void block[4] = self;
  id v23 = v7;
  BOOL v24 = v4;
  id v20 = v7;
  dispatch_async(v19, block);

  [(WFWorkflowController *)self invalidateAssertionIfNeeded];
}

void __60__WFWorkflowController_didFinishRunningWithError_cancelled___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 workflowController:*(void *)(a1 + 32) didFinishRunningWithError:*(void *)(a1 + 40) cancelled:*(unsigned __int8 *)(a1 + 48)];
  }
}

- (void)workflowControllerWillRun:(id)a3
{
  id v4 = [(WFWorkflowController *)self executionQueue];
  dispatch_assert_queue_V2(v4);

  [(WFWorkflowController *)self retainSelf];
  [(WFWorkflowController *)self acquireAssertionIfNeeded];
  uint64_t v5 = [(WFWorkflowController *)self delegateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WFWorkflowController_workflowControllerWillRun___block_invoke;
  block[3] = &unk_1E6558B28;
  void block[4] = self;
  dispatch_sync(v5, block);
}

void __50__WFWorkflowController_workflowControllerWillRun___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 workflowControllerWillRun:*(void *)(a1 + 32)];
  }
}

- (void)trackRunActionEventWithKey:(id)a3 action:(id)a4 completed:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  uint64_t v13 = objc_alloc_init(WFRunActionEvent);
  [(WFRunActionEvent *)v13 setKey:v12];

  uint64_t v14 = [v10 metricsIdentifier];
  [(WFRunActionEvent *)v13 setActionIdentifier:v14];

  id v15 = [v10 externalMetricsBundleIdentifier];
  [(WFRunActionEvent *)v13 setExternalBundleIdentifier:v15];

  id v16 = [v10 externalMetricsActionIdentifier];
  [(WFRunActionEvent *)v13 setExternalActionIdentifier:v16];

  id v17 = [(WFRunActionEvent *)v13 actionIdentifier];
  LODWORD(v12) = objc_msgSend(v17, "wf_isEmpty");

  if (v12)
  {
    id v18 = getWFEventTrackerLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      id v19 = [(WFWorkflowController *)self workflow];
      id v20 = [v19 source];
      int v30 = 136315394;
      v31 = "-[WFWorkflowController trackRunActionEventWithKey:action:completed:error:]";
      __int16 v32 = 2114;
      id v33 = v20;
      _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_FAULT, "%s Unexpected empty actionIdentifier. Run source: %{public}@", (uint8_t *)&v30, 0x16u);
    }
  }
  id v21 = [(WFWorkflowController *)self runSource];
  [(WFRunActionEvent *)v13 setRunSource:v21];

  __int16 v22 = [(WFWorkflowController *)self workflow];
  id v23 = [v22 source];
  [(WFRunActionEvent *)v13 setShortcutSource:v23];

  BOOL v24 = [(WFWorkflowController *)self automationType];
  [(WFRunActionEvent *)v13 setAutomationType:v24];

  -[WFRunActionEvent setDidRunRemotely:](v13, "setDidRunRemotely:", [v10 didRunRemotely]);
  [(WFRunActionEvent *)v13 setCompleted:v7];
  long long v25 = [(WFWorkflowController *)self runSource];
  if ([v25 isEqualToString:*MEMORY[0x1E4FB4F00]]) {
    uint64_t v26 = objc_msgSend(v11, "wf_isUserCancelledError");
  }
  else {
    uint64_t v26 = 0;
  }
  [(WFRunActionEvent *)v13 setIsInvalidatedSystemAction:v26];

  long long v27 = [(WFWorkflowController *)self workflow];
  long long v28 = [v27 record];
  v29 = [v28 galleryIdentifier];
  [(WFRunActionEvent *)v13 setGalleryIdentifier:v29];

  if ([v10 didRunRemotely]) {
    [(WFWorkflowController *)self setActionDidRunRemotely:1];
  }
  [(WFEvent *)v13 track];
}

- (void)logFinishActionEventWithAction:(id)a3 completed:(BOOL)a4 error:(id)a5
{
}

- (void)logStartActionEventWithAction:(id)a3
{
}

- (void)trackRunShortcutEventWithKey:(id)a3 completed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(WFWorkflowController *)self runSource];

  if (!v7)
  {
    id v8 = getWFEventTrackerLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v27 = 136315138;
      long long v28 = "-[WFWorkflowController trackRunShortcutEventWithKey:completed:]";
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s Missing run source when tracking WFRunShortcutEvent", (uint8_t *)&v27, 0xCu);
    }
  }
  if (![v6 isEqualToString:@"RunShortcutStart"]
    || ![(WFWorkflowController *)self resumed])
  {
    id v9 = objc_alloc_init(WFRunShortcutEvent);
    [(WFRunShortcutEvent *)v9 setKey:v6];
    id v10 = [(WFWorkflowController *)self workflow];
    id v11 = [v10 actions];
    -[WFRunShortcutEvent setActionCount:](v9, "setActionCount:", [v11 count]);

    id v12 = [(WFWorkflowController *)self workflow];
    uint64_t v13 = [v12 source];
    [(WFRunShortcutEvent *)v9 setShortcutSource:v13];

    uint64_t v14 = [(WFRunShortcutEvent *)v9 shortcutSource];

    if (!v14)
    {
      id v15 = getWFEventTrackerLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v27 = 136315138;
        long long v28 = "-[WFWorkflowController trackRunShortcutEventWithKey:completed:]";
        _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_ERROR, "%s RunEvent source was unexpectedly nil", (uint8_t *)&v27, 0xCu);
      }

      [(WFRunShortcutEvent *)v9 setShortcutSource:@"ShortcutSourceUnknown"];
    }
    id v16 = [(WFWorkflowController *)self runSource];
    [(WFRunShortcutEvent *)v9 setRunSource:v16];

    id v17 = [(WFWorkflowController *)self automationType];
    [(WFRunShortcutEvent *)v9 setAutomationType:v17];

    id v18 = [(WFWorkflowController *)self workflow];
    id v19 = [v18 record];
    id v20 = [v19 galleryIdentifier];
    [(WFRunShortcutEvent *)v9 setGalleryIdentifier:v20];

    [(WFRunShortcutEvent *)v9 setCompleted:v4];
    [(WFRunShortcutEvent *)v9 setDidRunRemotely:[(WFWorkflowController *)self actionDidRunRemotely]];
    [(WFRunShortcutEvent *)v9 setIsFromAutomationSuggestion:[(WFWorkflowController *)self isAutomationSuggestion]];
    id v21 = [(WFWorkflowController *)self automationTrialID];
    [(WFRunShortcutEvent *)v9 setAutomationSuggestionsTrialIdentifier:v21];

    __int16 v22 = [(WFWorkflowController *)self runningContext];
    uint64_t v23 = [v22 originatingBundleIdentifier];
    [(WFRunShortcutEvent *)v9 setScriptingRunBundleIdentifier:v23];

    BOOL v24 = [(WFWorkflowController *)self userInterface];
    LOBYTE(v23) = objc_opt_respondsToSelector();

    if (v23)
    {
      long long v25 = [(WFWorkflowController *)self userInterface];
      uint64_t v26 = [v25 dialogTransformer];
      -[WFRunShortcutEvent setNumberOfDialogsPresented:](v9, "setNumberOfDialogsPresented:", [v26 numberOfDialogsPresented]);
    }
    [(WFEvent *)v9 track];
  }
}

- (void)logFinishRunEvent:(BOOL)a3
{
}

- (void)logStartEvent
{
}

- (BOOL)action:(id)a3 canProvideInputForParameter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFWorkflowController *)self parameterInputProviderForAction:v7];
  char v9 = [v8 action:v7 canProvideInputForParameter:v6];

  return v9;
}

- (void)action:(id)a3 provideInputForParameters:(id)a4 withDefaultStates:(id)a5 prompts:(id)a6 completionHandler:(id)a7
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(WFWorkflowController *)self parameterInputProviderForAction:v12];
  if (v17)
  {
    id v18 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315394;
      id v20 = "-[WFWorkflowController action:provideInputForParameters:withDefaultStates:prompts:completionHandler:]";
      __int16 v21 = 2114;
      id v22 = v13;
      _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_INFO, "%s Asking input provider to provide input for parameters: %{public}@", (uint8_t *)&v19, 0x16u);
    }

    [v17 action:v12 provideInputForParameters:v13 withDefaultStates:v14 prompts:v15 completionHandler:v16];
  }
  else
  {
    (*((void (**)(id, void, void))v16 + 2))(v16, 0, 0);
  }
}

- (void)invalidateAssertionIfNeeded
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v3 = [(WFWorkflowController *)self workflowRunAssertion];

  if (v3)
  {
    BOOL v4 = [(WFWorkflowController *)self workflowRunAssertion];
    id v8 = 0;
    char v5 = [v4 invalidateWithError:&v8];
    id v6 = v8;

    if ((v5 & 1) == 0)
    {
      id v7 = getWFWorkflowExecutionLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v10 = "-[WFWorkflowController invalidateAssertionIfNeeded]";
        __int16 v11 = 2114;
        id v12 = v6;
        _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Failed to invalidate existing workflow run assertion: %{public}@", buf, 0x16u);
      }
    }
    [(WFWorkflowController *)self setWorkflowRunAssertion:0];
  }
}

- (void)acquireAssertionIfNeeded
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([(WFWorkflowController *)self acquiresAssertionWhileRunning])
  {
    char v3 = [(WFWorkflowController *)self workflowRunAssertion];

    if (!v3)
    {
      uint64_t v20 = 0;
      __int16 v21 = &v20;
      uint64_t v22 = 0x2050000000;
      BOOL v4 = (void *)getRBSAssertionClass_softClass;
      uint64_t v23 = getRBSAssertionClass_softClass;
      if (!getRBSAssertionClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getRBSAssertionClass_block_invoke;
        uint64_t v26 = &unk_1E6558B78;
        int v27 = &v20;
        __getRBSAssertionClass_block_invoke((uint64_t)buf);
        BOOL v4 = (void *)v21[3];
      }
      char v5 = v4;
      _Block_object_dispose(&v20, 8);
      id v6 = [v5 alloc];
      uint64_t v20 = 0;
      __int16 v21 = &v20;
      uint64_t v22 = 0x2050000000;
      id v7 = (void *)getRBSTargetClass_softClass;
      uint64_t v23 = getRBSTargetClass_softClass;
      if (!getRBSTargetClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getRBSTargetClass_block_invoke;
        uint64_t v26 = &unk_1E6558B78;
        int v27 = &v20;
        __getRBSTargetClass_block_invoke((uint64_t)buf);
        id v7 = (void *)v21[3];
      }
      id v8 = v7;
      _Block_object_dispose(&v20, 8);
      char v9 = [v8 currentProcess];
      uint64_t v20 = 0;
      __int16 v21 = &v20;
      uint64_t v22 = 0x2050000000;
      id v10 = (void *)getRBSDomainAttributeClass_softClass;
      uint64_t v23 = getRBSDomainAttributeClass_softClass;
      if (!getRBSDomainAttributeClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getRBSDomainAttributeClass_block_invoke;
        uint64_t v26 = &unk_1E6558B78;
        int v27 = &v20;
        __getRBSDomainAttributeClass_block_invoke((uint64_t)buf);
        id v10 = (void *)v21[3];
      }
      id v11 = v10;
      _Block_object_dispose(&v20, 8);
      id v12 = [v11 attributeWithDomain:@"com.apple.shortcuts" name:@"RunningBackground"];
      BOOL v24 = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      id v14 = (void *)[v6 initWithExplanation:@"Running shortcuts in background" target:v9 attributes:v13];
      [(WFWorkflowController *)self setWorkflowRunAssertion:v14];

      id v15 = [(WFWorkflowController *)self workflowRunAssertion];
      id v19 = 0;
      char v16 = [v15 acquireWithError:&v19];
      id v17 = v19;

      if ((v16 & 1) == 0)
      {
        id v18 = getWFWorkflowExecutionLogObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[WFWorkflowController acquireAssertionIfNeeded]";
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v17;
          _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_ERROR, "%s Unable to acquire workflow run assertion: %{public}@", buf, 0x16u);
        }
      }
    }
  }
}

- (void)autoreleaseSelf
{
  p_strongSelf = &self->_strongSelf;
  objc_storeStrong((id *)&self->_strongSelf, self->_strongSelf);
  char v3 = *p_strongSelf;
  *p_strongSelf = 0;
}

- (void)retainSelf
{
}

- (void)action:(id)a3 handleTestingEvent:(id)a4 completionHandler:(id)a5
{
  id v11 = a4;
  id v7 = (void (**)(id, uint64_t, void))a5;
  id v8 = [(WFWorkflowController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(WFWorkflowController *)self delegate];
    [v10 workflowController:self handleTestingEvent:v11 completionHandler:v7];
  }
  else
  {
    v7[2](v7, 1, 0);
  }
}

- (BOOL)isTesting
{
  char v3 = [(WFWorkflowController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  char v5 = [(WFWorkflowController *)self delegate];
  char v6 = [v5 workflowControllerIsTesting:self];

  return v6;
}

- (void)action:(id)a3 didGenerateReversalState:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(WFWorkflowController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(WFWorkflowController *)self delegate];
    [v9 workflowController:self didGenerateReversalState:v6 forAction:v10];
  }
}

- (id)actionReversalStateForAction:(id)a3
{
  id v4 = a3;
  char v5 = [(WFWorkflowController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WFWorkflowController *)self delegate];
    char v8 = [v7 workflowController:self actionReversalStateForAction:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)action:(id)a3 didDecideRunningProgressIsAllowed:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  char v6 = [(WFWorkflowController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [(WFWorkflowController *)self delegate];
    [v8 workflowController:self didDecideRunningProgressIsAllowed:v4 forAction:v9];
  }
}

- (id)remoteDialogPresenterEndpointForRunWorkflowAction:(id)a3
{
  BOOL v4 = [(WFWorkflowController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(WFWorkflowController *)self delegate];
    char v7 = [v6 remoteDialogPresenterEndpointForController:self];
  }
  else
  {
    char v7 = 0;
  }
  return v7;
}

- (void)setEnvironmentValue:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  char v7 = [(WFWorkflowController *)self environmentValueTable];
  char v8 = v7;
  if (v9) {
    [v7 setObject:v9 forKey:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
}

- (id)environmentValueForKey:(id)a3
{
  id v4 = a3;
  char v5 = [(WFWorkflowController *)self environmentValueTable];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)requestAccessToFileAtURLs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v14 = [(WFWorkflowController *)self userInterface];
  char v8 = [(WFWorkflowController *)self workflow];
  uint64_t v9 = [v8 name];
  id v10 = (void *)v9;
  if (v9) {
    id v11 = (__CFString *)v9;
  }
  else {
    id v11 = &stru_1F229A4D8;
  }
  id v12 = [(WFWorkflowController *)self workflow];
  uint64_t v13 = [v12 workflowID];
  [v14 requestFileAccessForURLs:v7 workflowName:v11 workflowID:v13 completionHandler:v6];
}

- (void)requestAccessToFileAtLocations:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = getWFFilesLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[WFWorkflowController requestAccessToFileAtLocations:completionHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_INFO, "%s Requesting file access to %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v18 = __Block_byref_object_copy__26801;
  id v19 = __Block_byref_object_dispose__26802;
  id v20 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__WFWorkflowController_requestAccessToFileAtLocations_completionHandler___block_invoke;
  v12[3] = &unk_1E65510F8;
  v12[4] = buf;
  uint64_t v9 = objc_msgSend(v6, "if_compactMap:", v12);
  if ([v9 count])
  {
    [(WFWorkflowController *)self requestAccessToFileAtURLs:v9 completionHandler:v7];
  }
  else
  {
    id v10 = getWFFilesLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)uint64_t v13 = 136315394;
      id v14 = "-[WFWorkflowController requestAccessToFileAtLocations:completionHandler:]";
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%s Could not resolve location with error: %@", v13, 0x16u);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }

  _Block_object_dispose(buf, 8);
}

id __73__WFWorkflowController_requestAccessToFileAtLocations_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v2 + 40);
  char v3 = [a2 resolveLocationWithError:&obj];
  objc_storeStrong((id *)(v2 + 40), obj);
  return v3;
}

- (void)captureFileRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWorkflowController *)self capturedFiles];
  [v5 addFile:v4];
}

- (id)contentForPrivateVariableKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWorkflowController *)self variableTable];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setContent:(id)a3 forPrivateVariableKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(WFWorkflowController *)self variableTable];
  char v8 = v7;
  if (v9) {
    [v7 setObject:v9 forKey:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
}

- (id)workflowInput
{
  return [(WFWorkflowController *)self contentForVariableWithName:@"FB539828-643B-41E5-BA20-9C1717057230-workflowinput"];
}

- (id)contentForVariableWithName:(id)a3
{
  id v4 = [NSString stringWithFormat:@"user-%@", a3];
  id v5 = [(WFWorkflowController *)self variableTable];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (BOOL)setContent:(id)a3 forVariableWithName:(id)a4
{
  id v6 = a3;
  id v7 = [NSString stringWithFormat:@"user-%@", a4];
  if (v6)
  {
    char v8 = [(WFWorkflowController *)self flowTracker];
    uint64_t v9 = [v8 contentCollectionByTaintingContentCollection:v6];
    id v10 = (void *)v9;
    if (v9) {
      uint64_t v11 = (void *)v9;
    }
    else {
      uint64_t v11 = v6;
    }
    id v12 = v11;

    uint64_t v13 = [(WFWorkflowController *)self variableTable];
    [v13 setObject:v12 forKey:v7];

    id v14 = [(WFWorkflowController *)self contentItemCache];
    [v14 addContentCollection:v12];
  }
  else
  {
    __int16 v15 = [(WFWorkflowController *)self contentItemCache];
    uint64_t v16 = [(WFWorkflowController *)self variableTable];
    id v17 = [v16 objectForKey:v7];
    [v15 deleteContentCollection:v17];

    id v12 = [(WFWorkflowController *)self variableTable];
    [v12 removeObjectForKey:v7];
  }

  return 1;
}

- (NSMapTable)environmentValueTable
{
  environmentValueTable = self->_environmentValueTable;
  if (!environmentValueTable)
  {
    id v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    id v5 = self->_environmentValueTable;
    self->_environmentValueTable = v4;

    environmentValueTable = self->_environmentValueTable;
  }
  return environmentValueTable;
}

- (NSMapTable)variableTable
{
  variableTable = self->_variableTable;
  if (!variableTable)
  {
    id v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    id v5 = self->_variableTable;
    self->_variableTable = v4;

    variableTable = self->_variableTable;
  }
  return variableTable;
}

- (void)queue_reset
{
  char v3 = [(WFWorkflowController *)self executionQueue];
  dispatch_assert_queue_V2(v3);

  [(WFWorkflowController *)self queue_stopWithError:0];
  id v4 = [(WFWorkflowController *)self workflow];
  id v5 = [v4 actions];
  [v5 makeObjectsPerformSelector:sel_resetOutput];

  [(WFWorkflowController *)self setOutput:0];
  [(WFWorkflowController *)self setLastExecutedAction:0];
  id v6 = [(WFWorkflowController *)self variableTable];
  [v6 removeAllObjects];

  id v7 = [(WFWorkflowController *)self actionOutputsByWorkflowIndex];
  [v7 removeAllObjects];

  char v8 = [(WFWorkflowController *)self environmentValueTable];
  [v8 removeAllObjects];

  id v9 = [(WFWorkflowController *)self contentItemCache];
  [v9 clear];
}

- (void)reset
{
  char v3 = [(WFWorkflowController *)self executionQueue];
  dispatch_assert_queue_not_V2(v3);

  id v4 = [(WFWorkflowController *)self executionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__WFWorkflowController_reset__block_invoke;
  block[3] = &unk_1E6558B28;
  void block[4] = self;
  dispatch_sync(v4, block);
}

uint64_t __29__WFWorkflowController_reset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_reset");
}

- (void)setFinishedRunningWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = [(WFWorkflowController *)self executionQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_running)
  {
    id v6 = [(WFWorkflowController *)self progress];
    [v6 setUserInfoObject:0 forKey:*MEMORY[0x1E4FB4EC8]];

    [(WFWorkflowController *)self logFinishRunEvent:v3];
    self->_running = 0;
    id v7 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      char v8 = [(WFWorkflowController *)self workflow];
      id v9 = @"no";
      uint64_t v11 = "-[WFWorkflowController setFinishedRunningWithSuccess:]";
      int v10 = 136315650;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      if (v3) {
        id v9 = @"yes";
      }
      __int16 v14 = 2112;
      __int16 v15 = v9;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Stopping workflow execution: %@. success: %@", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (void)step
{
  BOOL v3 = [(WFWorkflowController *)self executionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__WFWorkflowController_step__block_invoke;
  block[3] = &unk_1E6558B28;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __28__WFWorkflowController_step__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _step];
}

- (void)queue_stopWithError:(id)a3
{
  id v6 = a3;
  id v4 = [(WFWorkflowController *)self executionQueue];
  dispatch_assert_queue_V2(v4);

  LODWORD(v4) = self->_running;
  [(WFWorkflowController *)self setFinishedRunningWithSuccess:0];
  if (v4)
  {
    id v5 = [(WFWorkflowController *)self currentAction];
    if ([v5 isRunning])
    {
      if (v6) {
        objc_msgSend(v5, "finishRunningWithError:");
      }
      else {
        [v5 cancel];
      }
    }
    else
    {
      -[WFWorkflowController didFinishRunningWithError:cancelled:](self, "didFinishRunningWithError:cancelled:");
    }
  }
}

- (void)stopWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWorkflowController *)self executionQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__WFWorkflowController_stopWithError___block_invoke;
  v7[3] = &unk_1E6558938;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __38__WFWorkflowController_stopWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_stopWithError:", *(void *)(a1 + 40));
}

- (void)stop
{
  BOOL v3 = [(WFWorkflowController *)self executionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__WFWorkflowController_stop__block_invoke;
  block[3] = &unk_1E6558B28;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __28__WFWorkflowController_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_stopWithError:", 0);
}

- (void)_run
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(WFWorkflowController *)self executionQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(WFWorkflowController *)self workflow];
    *(_DWORD *)buf = 136315394;
    uint64_t v21 = "-[WFWorkflowController _run]";
    __int16 v22 = 2112;
    uint64_t v23 = v5;
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEFAULT, "%s Starting workflow execution: %@", buf, 0x16u);
  }
  id v6 = [(WFWorkflowController *)self workflow];
  if ([v6 disabledOnLockScreen])
  {
    BOOL v7 = +[WFCompactUnlockService isDeviceLocked];

    if (v7)
    {
      id v8 = getWFWorkflowExecutionLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(WFWorkflowController *)self workflow];
        *(_DWORD *)buf = 136315394;
        uint64_t v21 = "-[WFWorkflowController _run]";
        __int16 v22 = 2112;
        uint64_t v23 = v9;
        _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s Cancelling workflow execution because the device is locked and this workflow is disabled on the lock screen: %@", buf, 0x16u);
      }
      int v10 = +[WFSmartPromptState localizedUnlockedDeviceRequiredError];
      uint64_t v11 = self;
      __int16 v12 = v10;
      goto LABEL_18;
    }
  }
  else
  {
  }
  int v10 = [MEMORY[0x1E4F62958] configurationForContinuityDisplay];
  [v10 setNeedsUserInteractivePriority:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __28__WFWorkflowController__run__block_invoke;
  v19[3] = &unk_1E6558988;
  v19[4] = self;
  [v10 setTransitionHandler:v19];
  uint64_t v13 = [MEMORY[0x1E4F62940] monitorWithConfiguration:v10];
  [(WFWorkflowController *)self setDisplayLayoutMonitor:v13];

  [(WFWorkflowController *)self restorePendingStateIfNecessary];
  __int16 v14 = [(WFWorkflowController *)self workflow];
  if ([v14 hasActions])
  {
  }
  else
  {
    BOOL v15 = [(WFWorkflowController *)self runningAsStepWiseExecutor];

    if (!v15)
    {
      uint64_t v11 = self;
      __int16 v12 = 0;
LABEL_18:
      [(WFWorkflowController *)v11 didFinishRunningWithError:v12 cancelled:0];
      goto LABEL_19;
    }
  }
  if ([(WFWorkflowController *)self canRun])
  {
    [(WFWorkflowController *)self setActionDidRunRemotely:0];
    [(WFWorkflowController *)self setUpRunState];
    [(WFWorkflowController *)self workflowControllerWillRun:self];
    [(WFWorkflowController *)self resetEvaluationCriteriaForControlFlowActions];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __28__WFWorkflowController__run__block_invoke_228;
    v18[3] = &unk_1E65577A0;
    v18[4] = self;
    [(WFWorkflowController *)self resolveWorkflowInputWithCompletion:v18];
  }
  else
  {
    uint64_t v16 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = [(WFWorkflowController *)self workflow];
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "-[WFWorkflowController _run]";
      __int16 v22 = 2112;
      uint64_t v23 = v17;
      _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_INFO, "%s Workflow is already running, returning early: %@", buf, 0x16u);
    }
  }
LABEL_19:
}

void __28__WFWorkflowController__run__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3 && a4)
  {
    id v5 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) workflow];
      *(_DWORD *)buf = 136315394;
      __int16 v14 = "-[WFWorkflowController _run]_block_invoke";
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Cancelling workflow execution because iPhone Mirroring session was stopped: %@", buf, 0x16u);
    }
    BOOL v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    id v8 = WFLocalizedString(@"Shortcuts was interrupted.");
    __int16 v12 = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    int v10 = objc_msgSend(v7, "errorWithDomain:code:userInfo:", @"WFWorkflowControllerErrorDomain", 0, v9, v11);

    [*(id *)(a1 + 32) stopWithError:v10];
  }
}

void __28__WFWorkflowController__run__block_invoke_228(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) executionQueue];
  dispatch_assert_queue_V2(v6);

  if (v5)
  {
    if (objc_msgSend(v5, "wf_isUserCancelledError")) {
      id v7 = 0;
    }
    else {
      id v7 = v5;
    }
    objc_msgSend(*(id *)(a1 + 32), "didFinishRunningWithError:cancelled:", v7);
  }
  else
  {
    [*(id *)(a1 + 32) setInput:v8];
    [*(id *)(a1 + 32) _step];
  }
}

- (void)run
{
  BOOL v3 = (void *)voucher_copy();
  [(WFWorkflowController *)self setExecutionVoucher:v3];

  id v4 = [(WFWorkflowController *)self executionQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__WFWorkflowController_run__block_invoke;
  block[3] = &unk_1E6558B28;
  void block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __27__WFWorkflowController_run__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _run];
}

- (void)_finishStepWithError:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  BOOL v3 = [(WFWorkflowController *)self executionQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(WFWorkflowController *)self currentAction];
  [(WFWorkflowController *)self setLastExecutedAction:v4];

  id v5 = [v24 domain];
  uint64_t v6 = *MEMORY[0x1E4F28798];
  if ([v5 isEqualToString:*MEMORY[0x1E4F28798]])
  {
    id v7 = v24;
    uint64_t v8 = [v24 code];

    if (v8 == 37) {
      goto LABEL_31;
    }
  }
  else
  {

    id v7 = v24;
  }
  id v9 = [v7 domain];
  if ([v9 isEqualToString:v6])
  {
    uint64_t v10 = [v24 code];

    if (v10 == 7)
    {
      [(WFWorkflowController *)self setCurrentIndex:0];
      uint64_t v11 = dispatch_group_create();
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      __int16 v12 = [(WFWorkflowController *)self workflow];
      uint64_t v13 = [v12 actions];

      uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v31 != v15) {
              objc_enumerationMutation(v13);
            }
            uint64_t v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            id v18 = [v17 extendedOperation];

            if (v18)
            {
              dispatch_group_enter(v11);
              objc_initWeak(&location, v17);
              id v19 = [v17 extendedOperation];
              v26[0] = MEMORY[0x1E4F143A8];
              v26[1] = 3221225472;
              v26[2] = __45__WFWorkflowController__finishStepWithError___block_invoke;
              v26[3] = &unk_1E65510D0;
              objc_copyWeak(&v28, &location);
              int v27 = v11;
              [v19 addCompletionHandlerIfRunning:v26];

              objc_destroyWeak(&v28);
              objc_destroyWeak(&location);
            }
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v14);
      }

      id v20 = [(WFWorkflowController *)self executionQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__WFWorkflowController__finishStepWithError___block_invoke_2;
      block[3] = &unk_1E6558B28;
      void block[4] = self;
      dispatch_group_notify(v11, v20, block);

      goto LABEL_30;
    }
  }
  else
  {
  }
  id v7 = v24;
  if (objc_msgSend(v24, "wf_isUserCancelledError"))
  {
    [(WFWorkflowController *)self didFinishRunningWithError:0 cancelled:1];
    [(WFWorkflowController *)self setCurrentIndex:0];
    uint64_t v21 = [(WFWorkflowController *)self progress];
LABEL_29:
    __int16 v22 = v21;
    [v21 unpublish];

    [(WFWorkflowController *)self setProgress:0];
LABEL_30:
    id v7 = v24;
    goto LABEL_31;
  }
  if (v24)
  {
    if (objc_msgSend(v24, "wf_isUnsupportedUserInterfaceError"))
    {
      [(WFWorkflowController *)self setFinishedRunningWithSuccess:0];
      [(WFWorkflowController *)self didFinishRunningWithError:v24 cancelled:0];
      uint64_t v21 = [(WFWorkflowController *)self progress];
      goto LABEL_29;
    }
    if (![(WFWorkflowController *)self runningAsStepWiseExecutor])
    {
      [(WFWorkflowController *)self setFinishedRunningWithSuccess:0];
      [(WFWorkflowController *)self didFinishRunningWithError:v24 cancelled:0];
      [(WFWorkflowController *)self setCurrentIndex:0];
      uint64_t v21 = [(WFWorkflowController *)self progress];
      goto LABEL_29;
    }
  }
  if (![(WFWorkflowController *)self runningAsStepWiseExecutor])
  {
    if (!self->_running)
    {
      [(WFWorkflowController *)self didFinishRunningWithError:0 cancelled:1];
      [(WFWorkflowController *)self setCurrentIndex:0];
      goto LABEL_31;
    }
    [(WFWorkflowController *)self setResumed:0];
  }
  [(WFWorkflowController *)self _step];
LABEL_31:
}

void __45__WFWorkflowController__finishStepWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setExtendedOperation:0];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __45__WFWorkflowController__finishStepWithError___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setFinishedRunningWithSuccess:1];
  [*(id *)(a1 + 32) didFinishRunningWithError:0 cancelled:0];
  uint64_t v2 = [*(id *)(a1 + 32) progress];
  [v2 unpublish];

  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setProgress:0];
}

- (void)_step
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(WFWorkflowController *)self executionQueue];
  dispatch_assert_queue_V2(v3);

  if (![(WFWorkflowController *)self isStepping])
  {
    id v5 = [(WFWorkflowController *)self workflow];
    uint64_t v6 = [v5 actions];
    if (![v6 count]
      && [(WFWorkflowController *)self runningAsStepWiseExecutor])
    {
      id v7 = getWFWorkflowExecutionLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        char v36 = "-[WFWorkflowController _step]";
        __int16 v37 = 2048;
        unint64_t v38 = [(WFWorkflowController *)self currentIndex];
        __int16 v39 = 2048;
        uint64_t v40 = [v6 count];
        uint64_t v8 = "%s Step-wise executor: no actions yet (ci: %lu, actions count: %lu), ending step";
LABEL_17:
        _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0x20u);
        goto LABEL_36;
      }
      goto LABEL_36;
    }
    id v9 = [(WFWorkflowController *)self currentIndex];
    unint64_t v10 = [(WFWorkflowController *)self currentIndex];
    if (!v9)
    {
      uint64_t v11 = [v6 objectAtIndex:v10];
LABEL_25:
      uint64_t v17 = [(WFWorkflowController *)self input];

      if (v17)
      {
        id v18 = [(WFWorkflowController *)self workflow];
        id v19 = [v18 variableAvailability];
        int v20 = [v19 isShortcutInputVariableUsed];

        if (v20)
        {
          uint64_t v21 = [(WFWorkflowController *)self input];
          [(WFWorkflowController *)self setContent:v21 forVariableWithName:@"FB539828-643B-41E5-BA20-9C1717057230-workflowinput"];
        }
        if ([v11 usesLegacyInputBehavior])
        {
          uint64_t v22 = [(WFWorkflowController *)self input];

          id v9 = (void *)v22;
        }
        [(WFWorkflowController *)self setInput:0];
      }
      uint64_t v23 = [(WFWorkflowController *)self pendingActionInput];

      if (v23)
      {
        uint64_t v24 = [(WFWorkflowController *)self pendingActionInput];

        [(WFWorkflowController *)self setPendingActionInput:0];
        id v9 = (void *)v24;
      }
      long long v25 = [(WFWorkflowController *)self pendingProcessedParameters];

      if (v25)
      {
        uint64_t v26 = [(WFWorkflowController *)self pendingProcessedParameters];
        [v11 setProcessedParameters:v26];

        [(WFWorkflowController *)self setPendingProcessedParameters:0];
      }
      [(WFWorkflowController *)self setStepping:1];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __29__WFWorkflowController__step__block_invoke;
      v32[3] = &unk_1E65556E0;
      v32[4] = self;
      id v33 = v11;
      id v34 = v9;
      id v27 = v9;
      id v7 = v11;
      [(WFWorkflowController *)self prepareToRunAction:v7 withInput:v27 completionHandler:v32];

      goto LABEL_36;
    }
    if (v10 >= [v6 count])
    {
      if (![(WFWorkflowController *)self runningAsStepWiseExecutor])
      {
        if (([(WFWorkflowController *)self outputBehavior] & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          id v28 = [v6 lastObject];
          uint64_t v29 = [v28 output];
          [(WFWorkflowController *)self setOutput:v29];

          long long v30 = [(WFWorkflowController *)self contentItemCache];
          long long v31 = [(WFWorkflowController *)self output];
          [v30 addContentCollection:v31];
        }
        id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:7 userInfo:0];
        [(WFWorkflowController *)self _finishStepWithError:v7];
        goto LABEL_36;
      }
      id v7 = getWFWorkflowExecutionLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        char v36 = "-[WFWorkflowController _step]";
        __int16 v37 = 2048;
        unint64_t v38 = [(WFWorkflowController *)self currentIndex];
        __int16 v39 = 2048;
        uint64_t v40 = [v6 count];
        uint64_t v8 = "%s Step-wise executor: nowhere to step, holding (ci: %lu, actions count: %lu)";
        goto LABEL_17;
      }
LABEL_36:

      goto LABEL_37;
    }
    uint64_t v11 = objc_msgSend(v6, "objectAtIndex:", -[WFWorkflowController currentIndex](self, "currentIndex"));
    __int16 v12 = objc_msgSend(v6, "objectAtIndex:", -[WFWorkflowController currentIndex](self, "currentIndex") - 1);
    uint64_t v13 = [(WFWorkflowController *)self workflow];
    if ([v11 ignoresOutputFromAction:v12 inWorkflow:v13])
    {
    }
    else
    {
      int v14 = [v11 usesLegacyInputBehavior];

      if (v14)
      {
        id v9 = [v12 output];
        goto LABEL_21;
      }
    }
    id v9 = 0;
LABEL_21:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v12 mode]) {
      [v12 resetOutput];
    }
    uint64_t v15 = [(WFWorkflowController *)self contentItemCache];
    uint64_t v16 = [v12 output];
    [v15 addContentCollection:v16];

    goto LABEL_25;
  }
  id v4 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    char v36 = "-[WFWorkflowController _step]";
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_ERROR, "%s Step called while already stepping.", buf, 0xCu);
  }

  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:37 userInfo:0];
  [(WFWorkflowController *)self _finishStepWithError:v5];
LABEL_37:
}

void __29__WFWorkflowController__step__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = [*(id *)(a1 + 32) executionQueue];
  dispatch_assert_queue_V2(v2);

  BOOL v3 = [*(id *)(v1 + 32) progress];
  id v4 = &off_1E6549000;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([*(id *)(v1 + 40) mode]
     || ([*(id *)(v1 + 40) progress],
         id v5 = objc_claimAutoreleasedReturnValue(),
         v5,
         v5)))
  {
    uint64_t v6 = 0;
LABEL_5:

    BOOL v3 = (void *)v6;
  }
  else
  {
    uint64_t v7 = [*(id *)(v1 + 32) currentIndex];
    if (v7 - 1 >= 0)
    {
      uint64_t v8 = v7;
      char v36 = v3;
      do
      {
        --v8;
        id v9 = [*(id *)(v1 + 32) workflow];
        unint64_t v10 = [v9 actions];
        uint64_t v11 = [v10 objectAtIndex:v8];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __int16 v12 = [v11 groupedOpenAction];
          uint64_t v13 = [v11 groupedCloseAction];
          int v14 = [*(id *)(v1 + 32) workflow];
          uint64_t v15 = [v14 actions];
          unint64_t v16 = [v15 indexOfObject:v12];
          if (v16 >= [*(id *)(v1 + 32) currentIndex])
          {
          }
          else
          {
            uint64_t v17 = [*(id *)(v1 + 32) workflow];
            [v17 actions];
            v19 = id v18 = v4;
            unint64_t v37 = [v19 indexOfObject:v13];
            unint64_t v38 = v13;
            uint64_t v20 = v1;
            unint64_t v21 = [*(id *)(v1 + 32) currentIndex];

            id v4 = v18;
            BOOL v22 = v37 > v21;
            uint64_t v1 = v20;
            uint64_t v13 = v38;
            if (v22)
            {
              uint64_t v6 = [v12 progress];

              BOOL v3 = v11;
              goto LABEL_5;
            }
          }
        }
      }
      while (v8 > 0);
      BOOL v3 = v36;
    }
  }
  if (![*(id *)(v1 + 40) hasChildren]
    || ([*(id *)(v1 + 40) progress],
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        v23,
        !v23))
  {
    uint64_t v24 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
    [*(id *)(v1 + 40) setProgress:v24];
  }
  long long v25 = [*(id *)(v1 + 40) progress];

  if (v25)
  {
    uint64_t v26 = [*(id *)(v1 + 40) progress];
    [v3 addChild:v26 withPendingUnitCount:1];

    id v27 = [*(id *)(v1 + 40) progress];
    [*(id *)(v1 + 32) setCurrentActionProgress:v27];
  }
  if ([*(id *)(v1 + 32) resumed])
  {
    id v28 = [*(id *)(v1 + 40) progress];
    [v28 setUserInfoObject:MEMORY[0x1E4F1CC38] forKey:@"WFActionDidResume"];
  }
  [*(id *)(v1 + 40) setDidRunRemotely:0];
  [*(id *)(v1 + 32) logStartActionEventWithAction:*(void *)(v1 + 40)];
  id v29 = *(id *)(v1 + 40);
  if (v29)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v30 = v29;
    }
    else {
      long long v30 = 0;
    }
  }
  else
  {
    long long v30 = 0;
  }
  id v31 = v30;

  long long v32 = [*(id *)(v1 + 32) flowTracker];
  [v31 setControlFlowTracker:v32];

  id v34 = *(void **)(v1 + 32);
  id v33 = *(void **)(v1 + 40);
  uint64_t v35 = *(void *)(v1 + 48);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __29__WFWorkflowController__step__block_invoke_2;
  v39[3] = &unk_1E65510A8;
  v39[4] = v34;
  id v40 = v33;
  [v34 runAction:v40 withInput:v35 completionHandler:v39];
}

void __29__WFWorkflowController__step__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [*(id *)(a1 + 32) executionQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "errorByAddingActionIndex:toError:", objc_msgSend(*(id *)(a1 + 32), "currentIndex"), v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      uint64_t v7 = [v6 domain];
      if ([v7 isEqualToString:@"WFActionErrorDomain"])
      {
        uint64_t v8 = [v6 code];

        if (!v8)
        {
          char v9 = 1;
          goto LABEL_8;
        }
      }
      else
      {
      }
      id v19 = *(void **)(a1 + 32);
      id v18 = *(void **)(a1 + 40);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __29__WFWorkflowController__step__block_invoke_3;
      v26[3] = &unk_1E6551058;
      id v20 = v18;
      uint64_t v21 = *(void *)(a1 + 32);
      id v27 = v20;
      uint64_t v28 = v21;
      [v19 handleError:v6 fromAction:v20 completionHandler:v26];
      uint64_t v17 = v27;
      goto LABEL_16;
    }
    char v9 = 0;
  }
  else
  {
    char v9 = 0;
    id v6 = 0;
  }
LABEL_8:
  [*(id *)(a1 + 32) setStepping:0];
  if (_os_feature_enabled_impl() && [*(id *)(a1 + 32) outputBehavior] == 3)
  {
    unint64_t v10 = [*(id *)(a1 + 32) actionOutputsByWorkflowIndex];

    if (!v10)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [*(id *)(a1 + 32) setActionOutputsByWorkflowIndex:v11];
    }
    __int16 v12 = [*(id *)(a1 + 40) output];
    uint64_t v13 = [*(id *)(a1 + 32) actionOutputsByWorkflowIndex];
    int v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "currentIndex"));
    [v13 setObject:v12 forKeyedSubscript:v14];
  }
  objc_msgSend(*(id *)(a1 + 32), "setCurrentIndex:", objc_msgSend(*(id *)(a1 + 32), "currentIndex") + 1);
  unint64_t v16 = *(void **)(a1 + 32);
  uint64_t v15 = *(void **)(a1 + 40);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __29__WFWorkflowController__step__block_invoke_5;
  v22[3] = &unk_1E6551080;
  char v25 = v9;
  v22[4] = v16;
  id v23 = v15;
  id v6 = v6;
  id v24 = v6;
  [v16 didRunAction:v23 error:0 withCompletion:v22];

  uint64_t v17 = v23;
LABEL_16:
}

void __29__WFWorkflowController__step__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    char v9 = (id *)(a1 + 40);
    [*(id *)(a1 + 40) setStepping:0];
    goto LABEL_5;
  }
  id v4 = objc_alloc_init(WFRunShortcutErrorEvent);
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "code"));
  id v6 = [v5 stringValue];
  [(WFRunShortcutErrorEvent *)v4 setErrorCode:v6];

  uint64_t v7 = [v3 domain];
  [(WFRunShortcutErrorEvent *)v4 setErrorDomain:v7];

  uint64_t v8 = [*(id *)(a1 + 32) identifier];
  [(WFRunShortcutErrorEvent *)v4 setActionIdentifier:v8];

  -[WFRunShortcutErrorEvent setDidRunRemotely:](v4, "setDidRunRemotely:", [*(id *)(a1 + 32) didRunRemotely]);
  char v9 = (id *)(a1 + 40);
  unint64_t v10 = [*(id *)(a1 + 40) runSource];
  [(WFRunShortcutErrorEvent *)v4 setRunSource:v10];

  id v11 = [*(id *)(a1 + 40) automationType];
  [(WFRunShortcutErrorEvent *)v4 setAutomationType:v11];

  [(WFEvent *)v4 track];
  [*(id *)(a1 + 40) setStepping:0];
  if ([*(id *)(a1 + 40) runningAsStepWiseExecutor]) {
LABEL_5:
  }
    objc_msgSend(*v9, "setCurrentIndex:", objc_msgSend(*v9, "currentIndex") + 1);
  int v12 = objc_msgSend(v3, "wf_isSiriPunchOutError");
  id v13 = *v9;
  if (v12)
  {
    [*v9 _step];
  }
  else
  {
    int v14 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __29__WFWorkflowController__step__block_invoke_4;
    v17[3] = &unk_1E65556E0;
    id v18 = v14;
    id v15 = v3;
    uint64_t v16 = *(void *)(a1 + 40);
    id v19 = v15;
    uint64_t v20 = v16;
    [v13 didRunAction:v18 error:v15 withCompletion:v17];
  }
}

uint64_t __29__WFWorkflowController__step__block_invoke_5(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = [*(id *)(a1 + 32) workflow];
    id v3 = [v2 actionsGroupedWithAction:*(void *)(a1 + 40)];
    id v4 = [v3 lastObject];

    id v5 = [*(id *)(a1 + 32) workflow];
    id v6 = [v5 actions];
    objc_msgSend(*(id *)(a1 + 32), "setCurrentIndex:", objc_msgSend(v6, "indexOfObject:", v4) + 1);
  }
  if (([*(id *)(a1 + 40) hasChildren] & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 48), "wf_isUserCancelledError") & 1) == 0)
  {
    uint64_t v7 = [*(id *)(a1 + 40) progress];
    uint64_t v8 = [v7 totalUnitCount];
    char v9 = [*(id *)(a1 + 40) progress];
    [v9 setCompletedUnitCount:v8];
  }
  objc_msgSend(*(id *)(a1 + 32), "logFinishActionEventWithAction:completed:error:", *(void *)(a1 + 40), *(void *)(a1 + 48) == 0);
  [*(id *)(a1 + 32) handleControlFlowActionCompletion:*(void *)(a1 + 40) actionGroupSkipped:*(unsigned __int8 *)(a1 + 56)];
  unint64_t v10 = *(void **)(a1 + 32);
  return [v10 _finishStepWithError:0];
}

uint64_t __29__WFWorkflowController__step__block_invoke_4(id *a1)
{
  if (([a1[4] hasChildren] & 1) == 0 && (objc_msgSend(a1[5], "wf_isUserCancelledError") & 1) == 0)
  {
    uint64_t v2 = [a1[4] progress];
    uint64_t v3 = [v2 totalUnitCount];
    id v4 = [a1[4] progress];
    [v4 setCompletedUnitCount:v3];
  }
  objc_msgSend(a1[6], "logFinishActionEventWithAction:completed:error:", a1[4], a1[5] == 0);
  id v6 = a1[5];
  id v5 = a1[6];
  return [v5 _finishStepWithError:v6];
}

- (WFSmartPromptsExfiltrationLogger)exfiltrationLogger
{
  exfiltrationLogger = self->_exfiltrationLogger;
  if (!exfiltrationLogger)
  {
    id v4 = objc_alloc_init(WFSmartPromptsExfiltrationLogger);
    id v5 = self->_exfiltrationLogger;
    self->_exfiltrationLogger = v4;

    exfiltrationLogger = self->_exfiltrationLogger;
  }
  return exfiltrationLogger;
}

- (id)actionOutputs
{
  return self->_actionOutputsByWorkflowIndex;
}

- (WFContentCollection)capturedFiles
{
  capturedFiles = self->_capturedFiles;
  if (!capturedFiles)
  {
    id v4 = (WFContentCollection *)objc_alloc_init(MEMORY[0x1E4F5A830]);
    id v5 = self->_capturedFiles;
    self->_capturedFiles = v4;

    capturedFiles = self->_capturedFiles;
  }
  return capturedFiles;
}

- (WFContentItemCache)contentItemCache
{
  contentItemCache = self->_contentItemCache;
  if (!contentItemCache)
  {
    id v4 = objc_alloc_init(WFContentItemCache);
    id v5 = self->_contentItemCache;
    self->_contentItemCache = v4;

    contentItemCache = self->_contentItemCache;
  }
  return contentItemCache;
}

- (WFControlFlowAttributionTracker)flowTracker
{
  flowTracker = self->_flowTracker;
  if (!flowTracker)
  {
    id v4 = objc_alloc_init(WFControlFlowAttributionTracker);
    id v5 = self->_flowTracker;
    self->_flowTracker = v4;

    flowTracker = self->_flowTracker;
  }
  return flowTracker;
}

- (void)setCurrentActionProgress:(id)a3
{
  id v4 = (NSProgress *)a3;
  [(NSProgress *)self->_currentActionProgress removeObserver:self forKeyPath:@"fractionCompleted" context:WFCurrentActionFractionCompletedContext];
  currentActionProgress = self->_currentActionProgress;
  self->_currentActionProgress = v4;
  id v6 = v4;

  [(NSProgress *)self->_currentActionProgress addObserver:self forKeyPath:@"fractionCompleted" options:4 context:WFCurrentActionFractionCompletedContext];
}

- (void)publishActionProgress
{
  id v14 = (id)objc_opt_new();
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFWorkflowController currentIndex](self, "currentIndex"));
  [v14 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4FB4EB0]];

  id v4 = [(WFWorkflowController *)self currentAction];
  char v5 = [v4 isProgressIndeterminate];

  if ((v5 & 1) == 0)
  {
    id v6 = NSNumber;
    uint64_t v7 = [(WFWorkflowController *)self currentActionProgress];
    [v7 fractionCompleted];
    uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
    [v14 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4FB4EA8]];

    char v9 = [(WFWorkflowController *)self currentActionProgress];
    unint64_t v10 = [v9 localizedDescription];
    [v14 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4FB4EC0]];

    id v11 = [(WFWorkflowController *)self currentActionProgress];
    int v12 = [v11 localizedAdditionalDescription];
    [v14 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4FB4EB8]];
  }
  id v13 = [(WFWorkflowController *)self progress];
  [v13 setUserInfoObject:v14 forKey:*MEMORY[0x1E4FB4EC8]];
}

- (void)publishRunningState:(int64_t)a3
{
  id v5 = [(WFWorkflowController *)self progress];
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setUserInfoObject:v4 forKey:*MEMORY[0x1E4FB4ED0]];
}

- (BOOL)runningAsStepWiseExecutor
{
  uint64_t v2 = [(WFWorkflowController *)self runningContext];
  char v3 = [v2 isStepwise];

  return v3;
}

- (WFWorkflowRunningContext)runningContext
{
  runningContext = self->_runningContext;
  if (!runningContext)
  {
    if (self->_workflow)
    {
      id v4 = objc_alloc(MEMORY[0x1E4FB4A98]);
      id v5 = [(WFWorkflowController *)self workflow];
      id v6 = [v5 workflowID];
      uint64_t v7 = (void *)[v4 initWithWorkflowIdentifier:v6];

      uint64_t v8 = [(WFWorkflowController *)self runSource];
      [v7 setRunSource:v8];

      objc_msgSend(v7, "setOutputBehavior:", -[WFWorkflowController outputBehavior](self, "outputBehavior"));
      char v9 = self->_runningContext;
      self->_runningContext = (WFWorkflowRunningContext *)v7;

      runningContext = self->_runningContext;
    }
    else
    {
      runningContext = 0;
    }
  }
  return runningContext;
}

- (id)currentStateWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWorkflowController *)self currentState];
  id v6 = v5;
  if (v5)
  {
    id v27 = v4;
    if (v4)
    {
      id v7 = v4;
    }
    else
    {
      id v7 = [v5 runningContext];
    }
    uint64_t v26 = v7;
    uint64_t v21 = [WFWorkflowControllerState alloc];
    uint64_t v20 = [v6 workflow];
    char v25 = [v6 variables];
    uint64_t v24 = [v6 currentActionIndex];
    id v23 = [v6 currentInput];
    BOOL v22 = [v6 currentProcessedParameters];
    id v19 = [v6 startDate];
    id v18 = [v6 currentRunSource];
    uint64_t v9 = [v6 numberOfDialogsPresented];
    uint64_t v10 = [v6 outputBehavior];
    uint64_t v17 = [v6 currentActionContentAttributionTracker];
    uint64_t v16 = [v6 contentItemCache];
    id v11 = [v6 flowTracker];
    int v12 = [v6 allowedOnceSmartPromptStates];
    id v13 = [v6 extensionResourceClasses];
    LOBYTE(v15) = [v6 shouldDisablePrivacyPrompts];
    uint64_t v8 = -[WFWorkflowControllerState initWithWorkflow:variables:currentActionIndex:runningContext:currentInput:currentProcessedParameters:startDate:currentRunSource:numberOfDialogsPresented:outputBehavior:contentAttributionTracker:contentItemCache:flowTracker:allowedOnceSmartPromptStates:extensionResourceClasses:shouldDisablePrivacyPrompts:](v21, "initWithWorkflow:variables:currentActionIndex:runningContext:currentInput:currentProcessedParameters:startDate:currentRunSource:numberOfDialogsPresented:outputBehavior:contentAttributionTracker:contentItemCache:flowTracker:allowedOnceSmartPromptStates:extensionResourceClasses:shouldDisablePrivacyPrompts:", v20, v25, v24, v26, v23, v22, v19, v18, v9, v10, v17, v16, v11, v12, v13,
           v15);

    id v4 = v27;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)stateWithActionIndex:(unint64_t)a3 input:(id)a4 processedParameters:(id)a5
{
  id v37 = a5;
  id v36 = a4;
  uint64_t v8 = [(WFWorkflowController *)self variableTable];
  unint64_t v38 = [v8 dictionaryRepresentation];

  uint64_t v9 = [(WFWorkflowController *)self userInterface];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(WFWorkflowController *)self userInterface];
    int v12 = [v11 dialogTransformer];
    id v33 = (id)[v12 numberOfDialogsPresented];
  }
  else
  {
    id v33 = 0;
  }
  id v13 = (void *)MEMORY[0x1E4F1CAD0];
  id v14 = [(WFWorkflowController *)self workflow];
  uint64_t v15 = [v14 actions];
  uint64_t v16 = objc_msgSend(v15, "if_flatMap:", &__block_literal_global_26855);
  uint64_t v41 = [v13 setWithArray:v16];

  long long v30 = [WFWorkflowControllerState alloc];
  uint64_t v35 = [(WFWorkflowController *)self workflow];
  id v40 = [v35 reference];
  uint64_t v28 = [(WFWorkflowController *)self runningContext];
  __int16 v39 = [(WFWorkflowController *)self startDate];
  uint64_t v26 = [(WFWorkflowController *)self runSource];
  unint64_t v27 = [(WFWorkflowController *)self outputBehavior];
  long long v32 = [(WFWorkflowController *)self workflow];
  id v31 = [v32 actions];
  id v29 = [v31 objectAtIndexedSubscript:a3];
  uint64_t v17 = [v29 contentAttributionTracker];
  char v25 = [(WFWorkflowController *)self contentItemCache];
  id v18 = [(WFWorkflowController *)self flowTracker];
  id v19 = [(WFWorkflowController *)self workflow];
  uint64_t v20 = [v19 actions];
  uint64_t v21 = [v20 objectAtIndexedSubscript:a3];
  BOOL v22 = [v21 allowedOnceSmartPromptStates];
  LOBYTE(v24) = [(WFWorkflowController *)self shouldDisablePrivacyPrompts];
  id v34 = -[WFWorkflowControllerState initWithWorkflow:variables:currentActionIndex:runningContext:currentInput:currentProcessedParameters:startDate:currentRunSource:numberOfDialogsPresented:outputBehavior:contentAttributionTracker:contentItemCache:flowTracker:allowedOnceSmartPromptStates:extensionResourceClasses:shouldDisablePrivacyPrompts:](v30, "initWithWorkflow:variables:currentActionIndex:runningContext:currentInput:currentProcessedParameters:startDate:currentRunSource:numberOfDialogsPresented:outputBehavior:contentAttributionTracker:contentItemCache:flowTracker:allowedOnceSmartPromptStates:extensionResourceClasses:shouldDisablePrivacyPrompts:", v40, v38, a3, v28, v36, v37, v39, v26, v33, v27, v17, v25, v18, v22, v41,
          v24);

  return v34;
}

id __71__WFWorkflowController_stateWithActionIndex_input_processedParameters___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 resourceManager];
  char v3 = [v2 accessResources];
  id v4 = objc_msgSend(v3, "if_compactMap:", &__block_literal_global_195_26858);
  id v5 = [v4 allObjects];

  return v5;
}

id __71__WFWorkflowController_stateWithActionIndex_input_processedParameters___block_invoke_2()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  if ([MEMORY[0x1E4FB4870] hasExtensionForResourceClassName:v1]) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (WFWorkflowControllerState)currentState
{
  char v3 = [(WFWorkflowController *)self pendingState];

  if (v3)
  {
    id v4 = [(WFWorkflowController *)self pendingState];
  }
  else
  {
    id v5 = [(WFWorkflowController *)self workflow];
    id v6 = [v5 actions];

    if ([v6 count])
    {
      unint64_t v7 = [(WFWorkflowController *)self currentIndex];
      if (v7 >= [v6 count]) {
        unint64_t v7 = 0;
      }
      uint64_t v8 = [v6 objectAtIndex:v7];
      uint64_t v9 = [v8 input];
      char v10 = [v8 processedParameters];
      id v4 = [(WFWorkflowController *)self stateWithActionIndex:v7 input:v9 processedParameters:v10];
    }
    else
    {
      id v4 = 0;
    }
  }
  return (WFWorkflowControllerState *)v4;
}

- (WFAction)currentAction
{
  unint64_t v3 = [(WFWorkflowController *)self currentIndex];
  id v4 = [(WFWorkflowController *)self workflow];
  id v5 = [v4 actions];

  if (-[WFWorkflowController isRunning](self, "isRunning") && v3 < [v5 count])
  {
    id v6 = [v5 objectAtIndex:v3];
  }
  else
  {
    id v6 = 0;
  }

  return (WFAction *)v6;
}

- (BOOL)isRunning
{
  return self->_running || self->_stepping;
}

- (void)queue_setWorkflow:(id)a3
{
  id v4 = (WFWorkflow *)a3;
  uint64_t v5 = [(WFWorkflowController *)self executionQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v5);

  LOBYTE(v5) = [(WFWorkflow *)self->_workflow isEqual:v4];
  workflow = self->_workflow;
  self->_workflow = v4;

  if ((v5 & 1) == 0)
  {
    [(WFWorkflowController *)self queue_reset];
  }
}

- (void)setWorkflow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFWorkflowController *)self executionQueue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [(WFWorkflowController *)self executionQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__WFWorkflowController_setWorkflow___block_invoke;
  v8[3] = &unk_1E6558938;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

uint64_t __36__WFWorkflowController_setWorkflow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_setWorkflow:", *(void *)(a1 + 40));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)WFCurrentActionFractionCompletedContext == a6)
  {
    [(WFWorkflowController *)self publishActionProgress];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFWorkflowController;
    -[WFWorkflowController observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)dealloc
{
  unint64_t v3 = [(WFWorkflowController *)self workflowRunAssertion];
  [v3 invalidateWithError:0];

  id v4 = [(WFWorkflowController *)self currentActionProgress];
  [v4 removeObserver:self forKeyPath:@"fractionCompleted" context:WFCurrentActionFractionCompletedContext];

  v5.receiver = self;
  v5.super_class = (Class)WFWorkflowController;
  [(WFWorkflowController *)&v5 dealloc];
}

- (WFWorkflowController)init
{
  v10.receiver = self;
  v10.super_class = (Class)WFWorkflowController;
  id v2 = [(WFWorkflowController *)&v10 init];
  unint64_t v3 = v2;
  if (v2)
  {
    v2->_donateInteraction = 1;
    v2->_acquiresAssertionWhileRunning = 1;
    v2->_resumed = 0;
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_super v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.shortcuts.workflow-execution", v5);
    executionQueue = v3->_executionQueue;
    v3->_executionQueue = (OS_dispatch_queue *)v6;

    objc_storeStrong((id *)&v3->_delegateQueue, MEMORY[0x1E4F14428]);
    uint64_t v8 = v3;
  }

  return v3;
}

@end