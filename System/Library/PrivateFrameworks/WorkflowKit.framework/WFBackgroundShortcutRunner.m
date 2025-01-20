@interface WFBackgroundShortcutRunner
- (BOOL)action:(id)a3 canProvideInputForParameter:(id)a4;
- (BOOL)allowIncomingRunRequest:(id)a3 withDescriptor:(id)a4 accessSpecifier:(id)a5 record:(id)a6;
- (BOOL)initializeSharedTemporaryDirectoryLock;
- (BOOL)isInRemoteExecutionEnvironment;
- (BOOL)isPersonalAutomation;
- (BOOL)isRunningWithExternalUI;
- (BOOL)isRunningWithSiriUI;
- (BOOL)isRunningWithToolKitClient;
- (BOOL)isStepwiseExecution;
- (BOOL)isTesting;
- (BOOL)launchAppToContinueFromState:(id)a3 runSource:(id)a4 withCompletion:(id)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)performSiriRequest:(id)a3 completionHandler:(id)a4;
- (BOOL)progressIsPersistentInSystemAperture;
- (BOOL)promoteSharedTemporaryDirectoryLock;
- (BOOL)requestedFromAnotherDevice;
- (BOOL)requestedInHomeResident;
- (BOOL)runRequestIsContextualAction;
- (BOOL)runRequestOriginatedFromLocalSiri;
- (BOOL)runningProgressSuppressionMachineResolvedAndDeniedProgress;
- (BOOL)shortcutShouldShowRunningProgress;
- (BOOL)shouldNotHandoff;
- (BOOL)workflowController:(id)a3 handleUnsupportedEnvironmentForAction:(id)a4 currentState:(id)a5 completionHandler:(id)a6;
- (BOOL)workflowController:(id)a3 handleUnsupportedUserInterfaceForAction:(id)a4 currentState:(id)a5 completionHandler:(id)a6;
- (NSArray)airPlayRouteIDs;
- (NSMutableDictionary)actionReversalStates;
- (NSSet)dataVaultFileURLs;
- (NSString)userInterfaceType;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_group)exitTaskGroup;
- (OS_dispatch_queue)queue;
- (OS_os_transaction)transaction;
- (VCAccessSpecifier)accessSpecifier;
- (WFAssessmentModeManager)assessmentModeManager;
- (WFBackgroundShortcutRunner)initWithProcessPolicy:(unint64_t)a3;
- (WFBackgroundShortcutRunnerStateMachine)stateMachine;
- (WFDialogTransformer)dialogTransformer;
- (WFHarnessTestCase)currentTestCase;
- (WFRemoteExecutionCoordinator)remoteExecutionCoordinator;
- (WFRemoteExecutionFileCoordinator)fileCoordinator;
- (WFRemoteExecutionRunRequest)currentRemoteExecutionRunRequest;
- (WFWorkflowController)workflowController;
- (WFWorkflowReference)currentRunningWorkflowReference;
- (WFWorkflowRunEvent)runEvent;
- (WFWorkflowRunRequest)currentRunRequest;
- (WFWorkflowRunningContext)currentRunningContext;
- (id)assessmentModeActiveError;
- (id)completionBlock;
- (id)contextForAction:(id)a3;
- (id)createTestSiriUIPresenterInterfaceForTestCase:(id)a3;
- (id)createTestUIPresenterInterfaceForTestCase:(id)a3;
- (id)metricsRunSourceFromEnvironment:(int64_t)a3 runSource:(id)a4;
- (id)queue_runningProgressSuppressionStateMachine;
- (id)remoteDialogPresenterEndpointForController:(id)a3;
- (id)siriOptions;
- (id)testingHarnessErrorForWorkflowFinishedError:(id)a3;
- (id)workflowController:(id)a3 actionReversalStateForAction:(id)a4;
- (id)workflowForTesting;
- (int)lockFileFD;
- (int64_t)environment;
- (int64_t)executionContext;
- (void)action:(id)a3 provideInputForParameters:(id)a4 withDefaultStates:(id)a5 prompts:(id)a6 completionHandler:(id)a7;
- (void)applicationWillLaunchInForeground;
- (void)assessmentModeManagerDidBecomeActive:(id)a3;
- (void)callWorkflowRunningCompletionBlockWithResult:(id)a3;
- (void)computeFinderResizedSizesForImages:(id)a3 inSizes:(id)a4 completion:(id)a5;
- (void)configureIntent:(id)a3;
- (void)demoteSharedTemporaryDirectoryLock;
- (void)didFinishActionWithIdentifier:(id)a3;
- (void)didStartActionWithIdentifier:(id)a3;
- (void)dismissPresentedContentWithCompletionHandler:(id)a3;
- (void)evaluateRemoteQuarantinePolicyForWorkflow:(id)a3 workflowReference:(id)a4 withCompletionHandler:(id)a5;
- (void)extractVariableContentFromEncodedReference:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5;
- (void)fetchAvailableParameterStatesForEncodedValueSetDefinition:(id)a3 searchTerm:(id)a4 forEncodedToolInvocation:(id)a5 completionHandler:(id)a6;
- (void)fetchDisplayValueForRequest:(id)a3 completionHandler:(id)a4;
- (void)fetchToolInvocationSummaryForInvocation:(id)a3 completionHandler:(id)a4;
- (void)filterContextualActions:(id)a3 forContext:(id)a4 completion:(id)a5;
- (void)finishRunningWithResult:(id)a3;
- (void)getContextualActionsForContext:(id)a3 completion:(id)a4;
- (void)getCurrentProgressCompletedWithCompletionHandler:(id)a3;
- (void)getEnvironmentForLinkViewSnippetWithCompletion:(id)a3;
- (void)getPreferredSizeForLinkViewSnippetWithCompletion:(id)a3;
- (void)handleAppProtectionRequestWithBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)handleIncomingFileForRemoteExecutionWithURL:(id)a3 withIdentifier:(id)a4;
- (void)handleTestingEventIfTesting:(id)a3 completionHandler:(id)a4;
- (void)injectContentAsVariable:(id)a3 completionHandler:(id)a4;
- (void)openURL:(id)a3 withBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)pauseWorkflowAndWriteStateToDisk:(id)a3;
- (void)performQuery:(id)a3 inValueSet:(id)a4 toolInvocation:(id)a5 completionHandler:(id)a6;
- (void)performWithHost:(id)a3;
- (void)performWithRunningProgressSuppressionStateMachine:(id)a3;
- (void)presentAlert:(id)a3;
- (void)presentAlertWithSmartPromptConfiguration:(id)a3 completionHandler:(id)a4;
- (void)presenterRequestedUpdatedRunViewSource:(id)a3 completionHandler:(id)a4;
- (void)presenterRequestedWorkflowPauseForContext:(id)a3 dialogRequest:(id)a4;
- (void)presenterRequestedWorkflowStopForContext:(id)a3;
- (void)presenterWillShowRequest:(id)a3 runningContext:(id)a4;
- (void)prewarmRunnerWithCompletion:(id)a3;
- (void)reindexToolKitDatabaseWithRequest:(id)a3 completionHandler:(id)a4;
- (void)requestActionInterfacePresentationForActionClassName:(id)a3 classNamesByType:(id)a4 completionHandler:(id)a5;
- (void)requestAuthorizationWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)requestFileAccessForURLs:(id)a3 workflowName:(id)a4 workflowID:(id)a5 completionHandler:(id)a6;
- (void)resolveDeferredValueFromEncodedStorage:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5;
- (void)resolveDescriptor:(id)a3 completionHandler:(id)a4;
- (void)resumeRunningFromContext:(id)a3 withRequest:(id)a4 completion:(id)a5;
- (void)runActionFromRunRequestData:(id)a3 runningContext:(id)a4 completion:(id)a5;
- (void)runToolWithInvocation:(id)a3;
- (void)runWorkflowWithDescriptor:(id)a3 request:(id)a4 inEnvironment:(id)a5 runningContext:(id)a6 completion:(id)a7;
- (void)runnerStateMachine:(id)a3 didFinishRunningShortcutWithResult:(id)a4;
- (void)runnerStateMachine:(id)a3 didRequestStoppingShortcutWithError:(id)a4;
- (void)runnerStateMachineDidRequestProcessExit:(id)a3;
- (void)runningProgressSuppressionStateMachine:(id)a3 didDecideRunningProgressIsAllowed:(BOOL)a4 dialogAttribution:(id)a5;
- (void)sendDialogRequestForParameter:(id)a3 action:(id)a4 dialogRequest:(id)a5 completion:(id)a6;
- (void)sendRemoteAskWhenRunRequestWithParameters:(id)a3 action:(id)a4 completion:(id)a5;
- (void)sendResponseForRunRequest:(id)a3 controller:(id)a4 error:(id)a5 completion:(id)a6;
- (void)setAccessSpecifier:(id)a3;
- (void)setActionReversalStates:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCurrentRemoteExecutionRunRequest:(id)a3;
- (void)setCurrentRunRequest:(id)a3;
- (void)setCurrentRunningContext:(id)a3;
- (void)setCurrentRunningWorkflowReference:(id)a3;
- (void)setDataVaultFileURLs:(id)a3;
- (void)setDialogTransformer:(id)a3;
- (void)setFileCoordinator:(id)a3;
- (void)setIsPersonalAutomation:(BOOL)a3;
- (void)setLockFileFD:(int)a3;
- (void)setRemoteExecutionCoordinator:(id)a3;
- (void)setRunEvent:(id)a3;
- (void)setRunningProgressSuppressionMachineResolvedAndDeniedProgress:(BOOL)a3;
- (void)setTransaction:(id)a3;
- (void)setWorkflowController:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)shouldRunFollowUpActionWithBundleIdentifier:(id)a3 actionIdentifier:(id)a4 parameterValues:(id)a5 encodedToolInvocation:(id)a6 showOutputActionOptions:(unint64_t)a7 completionHandler:(id)a8;
- (void)showChronoControlOfType:(unint64_t)a3 identity:(id)a4 completionHandler:(id)a5;
- (void)showConfirmInteraction:(id)a3 prompt:(id)a4 requireAuthentication:(BOOL)a5 completionHandler:(id)a6;
- (void)showHandleInteraction:(id)a3 prompt:(id)a4 completionHandler:(id)a5;
- (void)showLinkActionConfirmationWithActionMetadata:(id)a3 showPrompt:(BOOL)a4 dialog:(id)a5 dialogString:(id)a6 viewSnippet:(id)a7 confirmationActionName:(id)a8 isContinueInAppRequest:(BOOL)a9 systemStyle:(id)a10 completionHandler:(id)a11;
- (void)showLinkParameterConfirmationWithActionMetadata:(id)a3 dialog:(id)a4 dialogString:(id)a5 viewSnippet:(id)a6 parameterValue:(id)a7 completionHandler:(id)a8;
- (void)showLinkResult:(id)a3 dialog:(id)a4 completionHandler:(id)a5;
- (void)showPreviewForContentCollection:(id)a3 completionHandler:(id)a4;
- (void)stepWithAction:(id)a3;
- (void)stopWithError:(id)a3;
- (void)synchronouslyPerformWithHost:(id)a3;
- (void)synchronouslyPerformWithRunningProgressSuppressionStateMachine:(id)a3;
- (void)unaliveProcess;
- (void)updateRunViewSource:(id)a3;
- (void)workflowController:(id)a3 actionDidRequestWorkflowExit:(id)a4;
- (void)workflowController:(id)a3 didDecideRunningProgressIsAllowed:(BOOL)a4 forAction:(id)a5;
- (void)workflowController:(id)a3 didFinishRunningWithError:(id)a4 cancelled:(BOOL)a5;
- (void)workflowController:(id)a3 didGenerateReversalState:(id)a4 forAction:(id)a5;
- (void)workflowController:(id)a3 didRunAction:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)workflowController:(id)a3 handleTestingEvent:(id)a4 completionHandler:(id)a5;
- (void)workflowController:(id)a3 prepareToRunAction:(id)a4 withInput:(id)a5 completionHandler:(id)a6;
- (void)workflowController:(id)a3 requestToQuarantineWorkflow:(id)a4;
- (void)workflowControllerWillRun:(id)a3;
@end

@implementation WFBackgroundShortcutRunner

- (id)testingHarnessErrorForWorkflowFinishedError:(id)a3
{
  id v4 = a3;
  v5 = [(WFBackgroundShortcutRunner *)self currentTestCase];
  v6 = v5;
  if (!v4 && v5)
  {
    v7 = [v5 interactions];
    v8 = (void *)[v7 mutableCopy];

    v9 = [v6 handledInteractions];
    [v8 minusSet:v9];

    v10 = [v6 siriInteractions];
    v11 = (void *)[v10 mutableCopy];

    v12 = [v6 handledSiriInteractions];
    [v11 minusSet:v12];

    v13 = [v6 conditions];
    v14 = (void *)[v13 mutableCopy];

    v15 = [v6 handledConditions];
    [v14 minusSet:v15];

    if ([v8 count] || objc_msgSend(v11, "count") || objc_msgSend(v14, "count"))
    {
      v16 = +[WFHarnessTestResult failureWithReason:@"Expected interaction or condition not handled."];
      id v17 = [v16 errorRepresentation];

      goto LABEL_9;
    }
  }
  id v17 = v4;
LABEL_9:

  return v17;
}

- (void)handleTestingEventIfTesting:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WFBackgroundShortcutRunner *)self isTesting])
  {
    v8 = [v6 action];
    v9 = [(WFBackgroundShortcutRunner *)self contextForAction:v8];

    v10 = [(WFBackgroundShortcutRunner *)self currentTestCase];
    v11 = [v10 conditions];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __89__WFBackgroundShortcutRunner_TestHarness__handleTestingEventIfTesting_completionHandler___block_invoke;
    v28[3] = &unk_1E654CFB8;
    id v12 = v6;
    id v29 = v12;
    id v30 = v9;
    id v13 = v9;
    v14 = objc_msgSend(v11, "if_compactMap:", v28);

    v15 = [(WFBackgroundShortcutRunner *)self currentTestCase];
    v16 = [v15 handledConditions];
    [v16 unionSet:v14];

    id v17 = [WFHarnessActionConditionContext alloc];
    v18 = [(WFBackgroundShortcutRunner *)self workflowController];
    v19 = [(WFHarnessActionConditionContext *)v17 initWithVariableDataSource:v18];

    v20 = [v14 allObjects];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __89__WFBackgroundShortcutRunner_TestHarness__handleTestingEventIfTesting_completionHandler___block_invoke_2;
    v25[3] = &unk_1E654D008;
    id v26 = v12;
    v27 = v19;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __89__WFBackgroundShortcutRunner_TestHarness__handleTestingEventIfTesting_completionHandler___block_invoke_4;
    v22[3] = &unk_1E6557EA8;
    id v24 = v7;
    id v23 = v26;
    v21 = v19;
    objc_msgSend(v20, "if_enumerateAsynchronously:completionHandler:", v25, v22);
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
  }
}

id __89__WFBackgroundShortcutRunner_TestHarness__handleTestingEventIfTesting_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 eventClass];
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 selector],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 matchesContext:*(void *)(a1 + 40)],
        v4,
        v5))
  {
    id v6 = v3;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __89__WFBackgroundShortcutRunner_TestHarness__handleTestingEventIfTesting_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__WFBackgroundShortcutRunner_TestHarness__handleTestingEventIfTesting_completionHandler___block_invoke_3;
  v10[3] = &unk_1E654CFE0;
  id v11 = v6;
  id v9 = v6;
  [a2 evaluateWithEvent:v8 context:v7 withResponse:v10];
}

void __89__WFBackgroundShortcutRunner_TestHarness__handleTestingEventIfTesting_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    id v6 = [v4 userInfo];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"WFHarnessTestErrorResult"];

    if (!v7)
    {
      uint64_t v8 = getWFTestHarnessLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        int v10 = 136315138;
        id v11 = "-[WFBackgroundShortcutRunner(TestHarness) handleTestingEventIfTesting:completionHandler:]_block_invoke_4";
        _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s Condition failed, but failure does not contain a test result", (uint8_t *)&v10, 0xCu);
      }

      id v9 = [v5 localizedDescription];
      uint64_t v7 = +[WFHarnessTestResult failureWithReason:v9];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __89__WFBackgroundShortcutRunner_TestHarness__handleTestingEventIfTesting_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 errorRepresentation];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (BOOL)isTesting
{
  uint64_t v2 = [(WFBackgroundShortcutRunner *)self currentTestCase];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)contextForAction:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFBackgroundShortcutRunner+TestHarness.m", 56, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];
  }
  id v6 = [(WFBackgroundShortcutRunner *)self workflowForTesting];
  uint64_t v7 = [v6 actions];
  uint64_t v8 = [v7 indexOfObject:v5];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = getWFTestHarnessLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v10 = [(WFBackgroundShortcutRunner *)self workflowForTesting];
      *(_DWORD *)buf = 136315650;
      id v17 = "-[WFBackgroundShortcutRunner(TestHarness) contextForAction:]";
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_FAULT, "%s Can't find executing action %@ in executing workflow %@", buf, 0x20u);
    }
    id v11 = 0;
  }
  else
  {
    uint64_t v12 = [WFHarnessActionContext alloc];
    id v13 = [v5 identifier];
    id v11 = [(WFHarnessActionContext *)v12 initWithIdentifier:v13 indexInWorkflow:v8];
  }
  return v11;
}

- (id)workflowForTesting
{
  uint64_t v2 = [(WFBackgroundShortcutRunner *)self workflowController];
  BOOL v3 = [v2 workflow];

  return v3;
}

- (id)createTestSiriUIPresenterInterfaceForTestCase:(id)a3
{
  id v4 = a3;
  id v5 = [[WFTestUIPresenterInterface alloc] initWithTestCase:v4 backgroundRunner:self];

  return v5;
}

- (id)createTestUIPresenterInterfaceForTestCase:(id)a3
{
  id v4 = a3;
  id v5 = [[WFTestUIPresenterInterface alloc] initWithTestCase:v4 backgroundRunner:self];

  return v5;
}

- (WFHarnessTestCase)currentTestCase
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(WFBackgroundShortcutRunner *)self currentRunRequest];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v3 = [v2 testRunDescriptor];
    id v8 = 0;
    id v4 = [v3 loadTestCaseWithError:&v8];
    id v5 = v8;

    if (!v4)
    {
      id v6 = getWFTestHarnessLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v10 = "-[WFBackgroundShortcutRunner(TestHarness) currentTestCase]";
        __int16 v11 = 2112;
        id v12 = v5;
        _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s Running in test harness, but can't load test case: %@", buf, 0x16u);
      }
    }
  }
  else
  {

    id v4 = 0;
  }
  return (WFHarnessTestCase *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessSpecifier, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_workflowController, 0);
  objc_storeStrong((id *)&self->_currentRunRequest, 0);
  objc_storeStrong((id *)&self->_exitTaskGroup, 0);
  objc_storeStrong((id *)&self->_actionReversalStates, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_dataVaultFileURLs, 0);
  objc_storeStrong((id *)&self->_runEvent, 0);
  objc_storeStrong((id *)&self->_currentRunningWorkflowReference, 0);
  objc_storeStrong((id *)&self->_currentRunningContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_dialogTransformer, 0);
  objc_storeStrong((id *)&self->_currentRemoteExecutionRunRequest, 0);
  objc_storeStrong((id *)&self->_fileCoordinator, 0);
  objc_storeStrong((id *)&self->_remoteExecutionCoordinator, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_assessmentModeManager, 0);
  objc_storeStrong((id *)&self->_runningProgressSuppressionStateMachine, 0);
}

- (void)setAccessSpecifier:(id)a3
{
}

- (VCAccessSpecifier)accessSpecifier
{
  return self->_accessSpecifier;
}

- (WFBackgroundShortcutRunnerStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setWorkflowController:(id)a3
{
}

- (WFWorkflowController)workflowController
{
  return self->_workflowController;
}

- (void)setCurrentRunRequest:(id)a3
{
}

- (WFWorkflowRunRequest)currentRunRequest
{
  return self->_currentRunRequest;
}

- (void)setRunningProgressSuppressionMachineResolvedAndDeniedProgress:(BOOL)a3
{
  self->_runningProgressSuppressionMachineResolvedAndDeniedProgress = a3;
}

- (BOOL)runningProgressSuppressionMachineResolvedAndDeniedProgress
{
  return self->_runningProgressSuppressionMachineResolvedAndDeniedProgress;
}

- (OS_dispatch_group)exitTaskGroup
{
  return self->_exitTaskGroup;
}

- (void)setActionReversalStates:(id)a3
{
}

- (NSMutableDictionary)actionReversalStates
{
  return self->_actionReversalStates;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setLockFileFD:(int)a3
{
  self->_lockFileFD = a3;
}

- (int)lockFileFD
{
  return self->_lockFileFD;
}

- (void)setDataVaultFileURLs:(id)a3
{
}

- (NSSet)dataVaultFileURLs
{
  return self->_dataVaultFileURLs;
}

- (void)setRunEvent:(id)a3
{
}

- (WFWorkflowRunEvent)runEvent
{
  return self->_runEvent;
}

- (void)setCurrentRunningWorkflowReference:(id)a3
{
}

- (WFWorkflowReference)currentRunningWorkflowReference
{
  return self->_currentRunningWorkflowReference;
}

- (void)setCurrentRunningContext:(id)a3
{
}

- (WFWorkflowRunningContext)currentRunningContext
{
  return self->_currentRunningContext;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setTransaction:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setIsPersonalAutomation:(BOOL)a3
{
  self->_isPersonalAutomation = a3;
}

- (BOOL)isPersonalAutomation
{
  return self->_isPersonalAutomation;
}

- (void)setDialogTransformer:(id)a3
{
}

- (void)setCurrentRemoteExecutionRunRequest:(id)a3
{
}

- (WFRemoteExecutionRunRequest)currentRemoteExecutionRunRequest
{
  return self->_currentRemoteExecutionRunRequest;
}

- (void)setFileCoordinator:(id)a3
{
}

- (void)setRemoteExecutionCoordinator:(id)a3
{
}

- (int64_t)environment
{
  return self->_environment;
}

- (void)setXpcConnection:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)reindexToolKitDatabaseWithRequest:(id)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28798];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = @"Unsupported runner type";
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a4;
  id v9 = [v7 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  int v10 = [v5 errorWithDomain:v6 code:94 userInfo:v9];
  (*((void (**)(id, void *))a4 + 2))(v8, v10);
}

- (void)runToolWithInvocation:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"WFBackgroundShortcutRunner.m" lineNumber:2085 description:@"-[WFBackgroundShortcutRunner runToolWithInvocation:] should be overridden by subclass"];
}

- (void)fetchToolInvocationSummaryForInvocation:(id)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28798];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = @"Unsupported runner type";
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a4;
  id v9 = [v7 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  int v10 = [v5 errorWithDomain:v6 code:94 userInfo:v9];
  (*((void (**)(id, void, void *))a4 + 2))(v8, 0, v10);
}

- (void)resolveDeferredValueFromEncodedStorage:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28798];
  uint64_t v12 = *MEMORY[0x1E4F28568];
  v13[0] = @"Unsupported runner type";
  id v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a5;
  int v10 = [v8 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v11 = [v6 errorWithDomain:v7 code:94 userInfo:v10];
  (*((void (**)(id, void, void *))a5 + 2))(v9, 0, v11);
}

- (void)fetchDisplayValueForRequest:(id)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28798];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = @"Unsupported runner type";
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a4;
  id v9 = [v7 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  int v10 = [v5 errorWithDomain:v6 code:94 userInfo:v9];
  (*((void (**)(id, void, void *))a4 + 2))(v8, 0, v10);
}

- (void)performQuery:(id)a3 inValueSet:(id)a4 toolInvocation:(id)a5 completionHandler:(id)a6
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28798];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  v14[0] = @"Unsupported runner type";
  id v9 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = a6;
  uint64_t v11 = [v9 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v12 = [v7 errorWithDomain:v8 code:94 userInfo:v11];
  (*((void (**)(id, void, void *))a6 + 2))(v10, 0, v12);
}

- (void)injectContentAsVariable:(id)a3 completionHandler:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28798];
  uint64_t v11 = *MEMORY[0x1E4F28568];
  v12[0] = @"Unsupported runner type";
  uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a4;
  id v9 = [v7 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  id v10 = [v5 errorWithDomain:v6 code:94 userInfo:v9];
  (*((void (**)(id, void, void *))a4 + 2))(v8, 0, v10);
}

- (void)fetchAvailableParameterStatesForEncodedValueSetDefinition:(id)a3 searchTerm:(id)a4 forEncodedToolInvocation:(id)a5 completionHandler:(id)a6
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28798];
  uint64_t v13 = *MEMORY[0x1E4F28568];
  v14[0] = @"Unsupported runner type";
  id v9 = (void *)MEMORY[0x1E4F1C9E8];
  id v10 = a6;
  uint64_t v11 = [v9 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v12 = [v7 errorWithDomain:v8 code:94 userInfo:v11];
  (*((void (**)(id, void, void *))a6 + 2))(v10, 0, v12);
}

- (void)extractVariableContentFromEncodedReference:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28798];
  uint64_t v12 = *MEMORY[0x1E4F28568];
  v13[0] = @"Unsupported runner type";
  uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
  id v9 = a5;
  id v10 = [v8 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v11 = [v6 errorWithDomain:v7 code:94 userInfo:v10];
  (*((void (**)(id, void, void *))a5 + 2))(v9, 0, v11);
}

- (id)assessmentModeActiveError
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F28798];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  id v4 = WFLocalizedString(@"A shortcut cannot be run while in Assessment Mode.");
  v9[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v6 = [v2 errorWithDomain:v3 code:1 userInfo:v5];

  return v6;
}

- (void)assessmentModeManagerDidBecomeActive:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[WFBackgroundShortcutRunner assessmentModeManagerDidBecomeActive:]";
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEFAULT, "%s Assessment Mode became active stopping workflow execution.", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [(WFBackgroundShortcutRunner *)self assessmentModeActiveError];
  [(WFBackgroundShortcutRunner *)self stopWithError:v5];
}

- (WFAssessmentModeManager)assessmentModeManager
{
  assessmentModeManager = self->_assessmentModeManager;
  if (!assessmentModeManager)
  {
    id v4 = [WFAssessmentModeManager alloc];
    id v5 = [(WFBackgroundShortcutRunner *)self queue];
    int v6 = [(WFAssessmentModeManager *)v4 initWithQueue:v5 delegate:self];
    uint64_t v7 = self->_assessmentModeManager;
    self->_assessmentModeManager = v6;

    assessmentModeManager = self->_assessmentModeManager;
  }
  return assessmentModeManager;
}

- (void)evaluateRemoteQuarantinePolicyForWorkflow:(id)a3 workflowReference:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = getWFWorkflowExecutionLogObject();
  uint64_t v12 = v11;
  if (v9)
  {
    os_signpost_id_t v13 = os_signpost_id_generate(v11);

    v14 = getWFWorkflowExecutionLogObject();
    v15 = v14;
    unint64_t v16 = v13 - 1;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RemoteQuarantineEvaluation", "", buf, 2u);
    }

    id v17 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = [v9 identifier];
      *(_DWORD *)buf = 136315394;
      v44 = "-[WFBackgroundShortcutRunner evaluateRemoteQuarantinePolicyForWorkflow:workflowReference:withCompletionHandler:]";
      __int16 v45 = 2112;
      v46 = v18;
      _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_INFO, "%s Evaluating remote quarantine policy for workflow %@", buf, 0x16u);
    }
    id v19 = +[WFRemoteQuarantinePolicyEvaluator sharedEvaluator];
    __int16 v20 = [v19 remoteQuarantineHashForWorkflowReference:v9];
    if ([v9 remoteQuarantineStatus] == 2)
    {
      v21 = getWFWorkflowExecutionLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = [v9 identifier];
        *(_DWORD *)buf = 136315394;
        v44 = "-[WFBackgroundShortcutRunner evaluateRemoteQuarantinePolicyForWorkflow:workflowReference:withCompletionHandler:]";
        __int16 v45 = 2112;
        v46 = v22;
        _os_log_impl(&dword_1C7F0A000, v21, OS_LOG_TYPE_INFO, "%s Skipping remote quarantine policy evaluation for workflow %@, since it has been explicitly allowed by the user.", buf, 0x16u);
      }
      id v23 = getWFWorkflowExecutionLogObject();
      id v24 = v23;
      if (v16 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v23)) {
        goto LABEL_23;
      }
      *(_WORD *)buf = 0;
    }
    else
    {
      v25 = [v9 remoteQuarantineHash];
      int v26 = [v25 isEqualToData:v20];

      v27 = getWFWorkflowExecutionLogObject();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
      if (!v26)
      {
        if (v28)
        {
          [v9 identifier];
          v31 = id v38 = v8;
          v37 = [v9 remoteQuarantineHash];
          v32 = [v37 debugDescription];
          v33 = [v20 debugDescription];
          *(_DWORD *)buf = 136315906;
          v44 = "-[WFBackgroundShortcutRunner evaluateRemoteQuarantinePolicyForWorkflow:workflowReference:withCompletionHandler:]";
          __int16 v45 = 2112;
          v46 = v31;
          __int16 v47 = 2112;
          v48 = v32;
          __int16 v49 = 2112;
          v50 = v33;
          _os_log_impl(&dword_1C7F0A000, v27, OS_LOG_TYPE_INFO, "%s Remote quarantine policy evaluation required for workflow %@: %@ != %@", buf, 0x2Au);

          id v8 = v38;
        }

        v34 = [WFWorkflowRemoteQuarantineRequest alloc];
        v35 = [v8 record];
        v36 = [(WFWorkflowRemoteQuarantineRequest *)v34 initWithWorkflowRecord:v35];

        [v19 setDelegate:self];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __112__WFBackgroundShortcutRunner_evaluateRemoteQuarantinePolicyForWorkflow_workflowReference_withCompletionHandler___block_invoke;
        v39[3] = &unk_1E654E328;
        os_signpost_id_t v42 = v13;
        id v41 = v10;
        id v40 = v20;
        [v19 evaluatePolicyForRequest:v36 completion:v39];

        goto LABEL_27;
      }
      if (v28)
      {
        id v29 = [v9 identifier];
        *(_DWORD *)buf = 136315394;
        v44 = "-[WFBackgroundShortcutRunner evaluateRemoteQuarantinePolicyForWorkflow:workflowReference:withCompletionHandler:]";
        __int16 v45 = 2112;
        v46 = v29;
        _os_log_impl(&dword_1C7F0A000, v27, OS_LOG_TYPE_INFO, "%s Skipping remote quarantine policy evaluation for workflow %@, since it has already been checked.", buf, 0x16u);
      }
      id v30 = getWFWorkflowExecutionLogObject();
      id v24 = v30;
      if (v16 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v30))
      {
LABEL_23:

        (*((void (**)(id, uint64_t, void *, void))v10 + 2))(v10, 1, v20, 0);
LABEL_27:

        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
    }
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v24, OS_SIGNPOST_INTERVAL_END, v13, "RemoteQuarantineEvaluation", "", buf, 2u);
    goto LABEL_23;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v44 = "-[WFBackgroundShortcutRunner evaluateRemoteQuarantinePolicyForWorkflow:workflowReference:withCompletionHandler:]";
    _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_INFO, "%s Skipping remote quarantine policy evaluation for workflow, since it has no database reference.", buf, 0xCu);
  }

  (*((void (**)(id, uint64_t, void, void))v10 + 2))(v10, 1, 0, 0);
LABEL_28:
}

void __112__WFBackgroundShortcutRunner_evaluateRemoteQuarantinePolicyForWorkflow_workflowReference_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = getWFWorkflowExecutionLogObject();
  int v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v6, OS_SIGNPOST_INTERVAL_END, v7, "RemoteQuarantineEvaluation", "", v8, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)isStepwiseExecution
{
  uint64_t v2 = [(WFBackgroundShortcutRunner *)self currentRunRequest];
  char v3 = [v2 isStepwise];

  return v3;
}

- (id)metricsRunSourceFromEnvironment:(int64_t)a3 runSource:(id)a4
{
  id v5 = a4;
  int v6 = v5;
  uint64_t v7 = *MEMORY[0x1E4FB4F90];
  if (v5) {
    id v8 = v5;
  }
  else {
    id v8 = (void *)*MEMORY[0x1E4FB4F90];
  }
  id v9 = v8;
  int v10 = [v9 isEqualToString:v7];
  if ((unint64_t)(a3 - 1) <= 3 && v10)
  {
    id v11 = **((id **)&unk_1E654E348 + a3 - 1);

    id v9 = v11;
  }

  return v9;
}

- (BOOL)launchAppToContinueFromState:(id)a3 runSource:(id)a4 withCompletion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"WFBackgroundShortcutRunner.m", 1932, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  uint64_t v12 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v24 = "-[WFBackgroundShortcutRunner launchAppToContinueFromState:runSource:withCompletion:]";
    _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_DEFAULT, "%s Launching Shortcuts app to continue running", buf, 0xCu);
  }

  if ([(WFBackgroundShortcutRunner *)self environment] == 1)
  {
    os_signpost_id_t v13 = getWFXPCRunnerLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v24 = "-[WFBackgroundShortcutRunner launchAppToContinueFromState:runSource:withCompletion:]";
      _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Can't open app from resident device", buf, 0xCu);
    }
LABEL_15:
    BOOL v17 = 0;
    goto LABEL_16;
  }
  if (!v9)
  {
    os_signpost_id_t v13 = getWFXPCRunnerLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = [(WFBackgroundShortcutRunner *)self workflowController];
      *(_DWORD *)buf = 136315394;
      id v24 = "-[WFBackgroundShortcutRunner launchAppToContinueFromState:runSource:withCompletion:]";
      __int16 v25 = 2112;
      int v26 = v18;
      _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s failed to get state from controller (%@)", buf, 0x16u);
    }
    goto LABEL_15;
  }
  if (v10) {
    id v14 = v10;
  }
  else {
    id v14 = (id)*MEMORY[0x1E4FB4F10];
  }
  os_signpost_id_t v13 = +[WFHandoffSimulator userActivityForContinuingWorkflowWithState:v9 fromSource:v14];
  id v15 = objc_alloc(MEMORY[0x1E4F5A798]);
  unint64_t v16 = (void *)[v15 initWithBundleIdentifier:*MEMORY[0x1E4FB4BE8] options:0 URL:0 userActivity:v13];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__WFBackgroundShortcutRunner_launchAppToContinueFromState_runSource_withCompletion___block_invoke;
  v21[3] = &unk_1E6558110;
  id v22 = v11;
  [v16 performWithCompletionHandler:v21];

  BOOL v17 = 1;
LABEL_16:

  return v17;
}

uint64_t __84__WFBackgroundShortcutRunner_launchAppToContinueFromState_runSource_withCompletion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = getWFXPCRunnerLogObject();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[WFBackgroundShortcutRunner launchAppToContinueFromState:runSource:withCompletion:]_block_invoke";
      int v6 = "%s Succeeded launching Shortcuts app";
      uint64_t v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
LABEL_6:
      _os_log_impl(&dword_1C7F0A000, v7, v8, v6, (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[WFBackgroundShortcutRunner launchAppToContinueFromState:runSource:withCompletion:]_block_invoke";
    int v6 = "%s Failed to open Shortcuts app to continue";
    uint64_t v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v9);
}

- (void)getCurrentProgressCompletedWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  id v5 = [(WFBackgroundShortcutRunner *)self workflowController];
  id v8 = [v5 progress];

  int v6 = NSNumber;
  [v8 fractionCompleted];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  v4[2](v4, v7, 0);
}

- (void)sendDialogRequestForParameter:(id)a3 action:(id)a4 dialogRequest:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  uint64_t v13 = +[WFRemoteExecutionCoordinator sharedCoordinator];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__WFBackgroundShortcutRunner_sendDialogRequestForParameter_action_dialogRequest_completion___block_invoke;
  v17[3] = &unk_1E654E300;
  id v19 = v10;
  id v20 = v11;
  id v18 = v9;
  id v14 = v10;
  id v15 = v11;
  id v16 = v9;
  [v13 sendDialogRequest:v12 completion:v17];
}

void __92__WFBackgroundShortcutRunner_sendDialogRequestForParameter_action_dialogRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = [a2 dialogResponse];
    if ([v6 isCancelled])
    {
      uint64_t v7 = *(void *)(a1 + 48);
      id v8 = [MEMORY[0x1E4F28C58] userCancelledError];
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
    }
    else
    {
      id v6 = v6;
      if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        id v11 = *(void **)(a1 + 40);
        uint64_t v13 = [v6 serializedParameterState];
        id v14 = [v11 createStateForParameter:v12 fromSerializedRepresentation:v13];
      }
      else
      {

        id v14 = [*(id *)(a1 + 32) parameterStateFromDialogResponse:v6];
      }
      uint64_t v15 = [*(id *)(a1 + 32) stateClass];
      if (v15 == objc_opt_class())
      {
        v33 = [WFInputtedState alloc];
        v34 = [*(id *)(a1 + 32) key];
        v35 = [(WFInputtedState *)v33 initWithParameterKey:v34 parameterState:v14];

        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
      else
      {
        id v36 = v5;
        id v16 = getWFRemoteExecutionLogObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          BOOL v17 = objc_opt_class();
          id v18 = *(void **)(a1 + 32);
          id v19 = v17;
          id v20 = (void *)[v18 stateClass];
          id v21 = v20;
          *(_DWORD *)buf = 136315906;
          id v40 = "-[WFBackgroundShortcutRunner sendDialogRequestForParameter:action:dialogRequest:completion:]_block_invoke";
          __int16 v41 = 2112;
          os_signpost_id_t v42 = v17;
          __int16 v43 = 2112;
          v44 = v20;
          __int16 v45 = 2112;
          id v46 = (id)objc_opt_class();
          id v22 = v46;
          _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_FAULT, "%s %@ expected a parameter state of class: %@, but received a different parameter state class: %@", buf, 0x2Au);
        }
        id v23 = (void *)MEMORY[0x1E4F28C58];
        v37[0] = *MEMORY[0x1E4F28568];
        id v24 = WFLocalizedString(@"Invalid parameter state");
        v38[0] = v24;
        v37[1] = *MEMORY[0x1E4F28588];
        __int16 v25 = NSString;
        int v26 = WFLocalizedString(@"Received invalid parameter state for action %@ and parameter %@");
        uint64_t v27 = [*(id *)(a1 + 40) localizedName];
        [*(id *)(a1 + 32) localizedLabel];
        id v29 = v28 = v14;
        id v30 = objc_msgSend(v25, "localizedStringWithFormat:", v26, v27, v29);
        v38[1] = v30;
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
        v32 = [v23 errorWithDomain:@"WFBackgroundShortcutRunnerErrorDomain" code:14 userInfo:v31];

        id v14 = v28;
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

        id v5 = v36;
      }
    }
  }
  else
  {
    id v9 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      id v10 = [*(id *)(a1 + 32) localizedLabel];
      *(_DWORD *)buf = 136315394;
      id v40 = "-[WFBackgroundShortcutRunner sendDialogRequestForParameter:action:dialogRequest:completion:]_block_invoke";
      __int16 v41 = 2112;
      os_signpost_id_t v42 = v10;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_FAULT, "%s Received an invalid dialog request for parameter: %@", buf, 0x16u);
    }
    WFBackgroundShortcutRunnerError(12, v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)sendRemoteAskWhenRunRequestWithParameters:(id)a3 action:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__7335;
  v20[4] = __Block_byref_object_dispose__7336;
  id v21 = (id)objc_opt_new();
  id v11 = [v8 array];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke;
  v17[3] = &unk_1E654E2D8;
  void v17[4] = self;
  id v12 = v9;
  id v18 = v12;
  id v19 = v20;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke_3;
  v14[3] = &unk_1E6552368;
  id v16 = v20;
  id v13 = v10;
  id v15 = v13;
  objc_msgSend(v11, "if_enumerateAsynchronouslyInSequence:completionHandler:", v17, v14);

  _Block_object_dispose(v20, 8);
}

void __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  if ([v6 conformsToProtocol:&unk_1F231A338])
  {
    id v8 = (WFRemoteExecutionDialogRequest *)v6;
    id v9 = [*(id *)(a1 + 32) dialogTransformer];
    id v10 = [v9 attribution];

    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke_2;
    v58[3] = &unk_1E654E2B0;
    id v62 = v7;
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(void **)(a1 + 40);
    v59 = v8;
    uint64_t v60 = v11;
    id v13 = v12;
    uint64_t v14 = *(void *)(a1 + 48);
    id v61 = v13;
    uint64_t v63 = v14;
    id v15 = v7;
    id v16 = v8;
    [(WFRemoteExecutionDialogRequest *)v16 createDialogRequestWithAttribution:v10 defaultState:0 prompt:0 completionHandler:v58];

    BOOL v17 = v59;
  }
  else
  {
    __int16 v49 = v7;
    v50 = objc_opt_new();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v18 = a1;
    id v19 = [*(id *)(a1 + 40) parameters];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v64 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v55 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          __int16 v25 = [v24 key];
          int v26 = [v6 key];
          char v27 = [v25 isEqualToString:v26];

          if ((v27 & 1) == 0)
          {
            BOOL v28 = *(void **)(v18 + 40);
            id v29 = [v24 key];
            id v30 = [v28 parameterStateForKey:v29 fallingBackToDefaultValue:0];

            v31 = [v30 serializedRepresentation];
            v32 = [v24 key];
            objc_msgSend(v50, "if_setObjectIfNonNil:forKey:", v31, v32);
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v54 objects:v64 count:16];
      }
      while (v21);
    }

    uint64_t v33 = [MEMORY[0x1E4FB4598] dialogComponentStyleForParameter:v6];
    id v16 = [MEMORY[0x1E4FB46C8] doneButton];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v34 = v6;
      if ([v34 isTimePickerParameter])
      {
        uint64_t v35 = [MEMORY[0x1E4FB46C8] startButton];

        id v16 = (WFRemoteExecutionDialogRequest *)v35;
      }
    }
    id v36 = objc_alloc(MEMORY[0x1E4FB4598]);
    v37 = [*(id *)(v18 + 40) identifier];
    id v38 = [v6 key];
    v39 = (void *)[objc_alloc(MEMORY[0x1E4FB46C0]) initWithTitle:0 icon:0];
    id v40 = [v6 localizedPrompt];
    LOBYTE(v48) = 1;
    id v10 = v50;
    id v15 = (id)[v36 initWithActionIdentifier:v37 parameterKey:v38 serializedParameterStates:v50 style:v33 attribution:v39 prompt:v40 doneButton:v16 focusImmediatelyWhenPresented:v48];

    __int16 v41 = [WFRemoteExecutionDialogRequest alloc];
    os_signpost_id_t v42 = [*(id *)(v18 + 32) currentRemoteExecutionRunRequest];
    __int16 v43 = [v42 identifier];
    BOOL v17 = [(WFRemoteExecutionDialogRequest *)v41 initWithDialogRequest:v15 runRequestIdentifier:v43];

    v44 = *(void **)(v18 + 32);
    uint64_t v45 = *(void *)(v18 + 40);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke_2_532;
    v51[3] = &unk_1E654E288;
    uint64_t v46 = *(void *)(v18 + 48);
    id v52 = v49;
    uint64_t v53 = v46;
    id v47 = v49;
    [v44 sendDialogRequestForParameter:v6 action:v45 dialogRequest:v17 completion:v51];
  }
}

void __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "parameterState", (void)v14);
        id v13 = [v11 parameterKey];
        [v5 setObject:v12 forKeyedSubscript:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = [WFRemoteExecutionDialogRequest alloc];
    id v5 = [*(id *)(a1 + 40) currentRemoteExecutionRunRequest];
    id v6 = [v5 identifier];
    uint64_t v7 = [(WFRemoteExecutionDialogRequest *)v4 initWithDialogRequest:v3 runRequestIdentifier:v6];

    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke_526;
    v19[3] = &unk_1E654E288;
    long long v18 = *(_OWORD *)(a1 + 56);
    id v11 = (id)v18;
    long long v20 = v18;
    [v8 sendDialogRequestForParameter:v9 action:v10 dialogRequest:v7 completion:v19];
  }
  else
  {
    id v12 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      id v13 = [*(id *)(a1 + 32) localizedLabel];
      *(_DWORD *)buf = 136315394;
      id v24 = "-[WFBackgroundShortcutRunner sendRemoteAskWhenRunRequestWithParameters:action:completion:]_block_invoke_2";
      __int16 v25 = 2112;
      int v26 = v13;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_FAULT, "%s Unable to create valid dialog request for parameter: %@", buf, 0x16u);
    }
    long long v14 = (void *)MEMORY[0x1E4F28C58];
    v21[0] = *MEMORY[0x1E4F28568];
    long long v15 = WFLocalizedString(@"Unable to Run");
    v22[0] = v15;
    v21[1] = *MEMORY[0x1E4F28588];
    long long v16 = WFLocalizedString(@"Unable to finish running action due to missing values.");
    v22[1] = v16;
    long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    uint64_t v7 = [v14 errorWithDomain:@"WFBackgroundShortcutRunnerErrorDomain" code:5 userInfo:v17];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke_2_532(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:a2];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90__WFBackgroundShortcutRunner_sendRemoteAskWhenRunRequestWithParameters_action_completion___block_invoke_526(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:a2];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didFinishActionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  [v5 didFinishActionWithIdentifier:v4];
}

- (void)didStartActionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  [v5 didStartActionWithIdentifier:v4];
}

- (void)openURL:(id)a3 withBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  id v12 = [v11 currentAction];

  if (v12)
  {
    id v13 = [[WFActionWillOpenURLTestingEvent alloc] initWithAction:v12 URL:v8 bundleIdentifier:v9];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__WFBackgroundShortcutRunner_openURL_withBundleIdentifier_completionHandler___block_invoke;
    v15[3] = &unk_1E654E260;
    id v18 = v10;
    v15[4] = self;
    id v16 = v8;
    id v17 = v9;
    [(WFBackgroundShortcutRunner *)self handleTestingEventIfTesting:v13 completionHandler:v15];
  }
  else
  {
    long long v14 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
    [v14 openURL:v8 withBundleIdentifier:v9 completionHandler:v10];
  }
}

void __77__WFBackgroundShortcutRunner_openURL_withBundleIdentifier_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) dialogTransformer];
    [v5 openURL:*(void *)(a1 + 40) withBundleIdentifier:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 56);
    id v5 = [a3 errorRepresentation];
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
  }
}

- (BOOL)performSiriRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  char v9 = [v8 performSiriRequest:v7 completionHandler:v6];

  return v9;
}

- (void)configureIntent:(id)a3
{
  id v5 = a3;
  if ([(WFBackgroundShortcutRunner *)self isRunningWithSiriUI])
  {
    uint64_t v4 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
    [v4 configureIntent:v5];
  }
}

- (NSArray)airPlayRouteIDs
{
  uint64_t v2 = [(WFBackgroundShortcutRunner *)self siriOptions];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 airPlayRouteIDs];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSArray *)v4;
}

- (int64_t)executionContext
{
  uint64_t v2 = [(WFBackgroundShortcutRunner *)self siriOptions];
  id v3 = v2;
  if (v2) {
    int64_t v4 = [v2 executionContext];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)siriOptions
{
  uint64_t v2 = [(WFBackgroundShortcutRunner *)self currentRunRequest];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v3 = [v2 options];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)isRunningWithToolKitClient
{
  uint64_t v2 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  char v3 = [v2 isRunningWithToolKitClient];

  return v3;
}

- (BOOL)isRunningWithExternalUI
{
  uint64_t v2 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  char v3 = [v2 isRunningWithExternalUI];

  return v3;
}

- (BOOL)isRunningWithSiriUI
{
  uint64_t v2 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  char v3 = [v2 isRunningWithSiriUI];

  return v3;
}

- (void)requestFileAccessForURLs:(id)a3 workflowName:(id)a4 workflowID:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  [v14 requestFileAccessForURLs:v13 workflowName:v12 workflowID:v11 completionHandler:v10];
}

- (void)requestAuthorizationWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  [v8 requestAuthorizationWithConfiguration:v7 completionHandler:v6];
}

- (BOOL)shouldNotHandoff
{
  char v3 = [(WFBackgroundShortcutRunner *)self currentRunRequest];

  if (v3)
  {
    int64_t v4 = [(WFBackgroundShortcutRunner *)self currentRunRequest];
    int v5 = [v4 allowsHandoff] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)pauseWorkflowAndWriteStateToDisk:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int64_t v4 = a3;
  [(WFBackgroundShortcutRunner *)self synchronouslyPerformWithHost:&__block_literal_global_455];
  int v5 = [(WFBackgroundShortcutRunner *)self workflowController];
  [v5 publishRunningState:3];

  id v6 = WFWFWorkflowControllerStateDefaultSerializedURLFromContext(v4);
  if (v6)
  {
    id v7 = [(WFBackgroundShortcutRunner *)self workflowController];
    id v8 = [v7 currentState];
    id v14 = 0;
    char v9 = [v8 writeToURL:v6 error:&v14];
    id v10 = v14;

    if ((v9 & 1) == 0)
    {
      id v11 = getWFXPCRunnerLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v16 = "-[WFBackgroundShortcutRunner pauseWorkflowAndWriteStateToDisk:]";
        __int16 v17 = 2112;
        id v18 = v10;
        _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_FAULT, "%s Failed to write current workflow controller state to disk because of %@", buf, 0x16u);
      }
    }
    dispatch_time_t v12 = dispatch_time(0, 500000000);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __63__WFBackgroundShortcutRunner_pauseWorkflowAndWriteStateToDisk___block_invoke_456;
    v13[3] = &unk_1E6558B28;
    v13[4] = self;
    dispatch_after(v12, MEMORY[0x1E4F14428], v13);
  }
  else
  {
    id v10 = getWFXPCRunnerLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[WFBackgroundShortcutRunner pauseWorkflowAndWriteStateToDisk:]";
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Unable to get destination URL from context: %@", buf, 0x16u);
    }
  }
}

void __63__WFBackgroundShortcutRunner_pauseWorkflowAndWriteStateToDisk___block_invoke_456(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stateMachine];
  [v1 stopShortcutWithError:0 reason:@"paused workflow"];
}

uint64_t __63__WFBackgroundShortcutRunner_pauseWorkflowAndWriteStateToDisk___block_invoke(uint64_t a1, void *a2)
{
  return [a2 workflowDidPause];
}

- (BOOL)isInRemoteExecutionEnvironment
{
  return [(WFBackgroundShortcutRunner *)self environment] == 4;
}

- (void)handleAppProtectionRequestWithBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  [v8 handleAppProtectionRequestWithBundleIdentifier:v7 completionHandler:v6];
}

- (void)resolveDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  [v8 resolveDescriptor:v7 completionHandler:v6];
}

- (void)dismissPresentedContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  [v5 dismissPresentedContentWithCompletionHandler:v4];
}

- (void)presentAlertWithSmartPromptConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(WFBackgroundShortcutRunner *)self requestedFromAnotherDevice])
  {
    id v8 = [WFSmartPromptDialogRequest alloc];
    char v9 = [MEMORY[0x1E4FB46C0] attributionWithAppBundleIdentifier:*MEMORY[0x1E4FB4BE8]];
    id v10 = [(WFSmartPromptDialogRequest *)v8 initWithConfiguration:v7 attribution:v9];

    id v11 = [MEMORY[0x1E4F5A768] alertWithPreferredStyle:0];
    dispatch_time_t v12 = NSString;
    id v13 = [(WFDialogRequest *)v10 promptForDisplay];
    id v14 = [v7 workflowName];

    long long v15 = objc_msgSend(v12, "stringWithFormat:", v13, v14);
    [v11 setMessage:v15];

    id v16 = [(WFSmartPromptDialogRequest *)v10 allowOnceButton];

    if (v16)
    {
      __int16 v17 = (void *)MEMORY[0x1E4F5A770];
      id v18 = [(WFSmartPromptDialogRequest *)v10 allowOnceButton];
      uint64_t v19 = [v18 title];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __89__WFBackgroundShortcutRunner_presentAlertWithSmartPromptConfiguration_completionHandler___block_invoke;
      v36[3] = &unk_1E6558678;
      id v37 = v6;
      long long v20 = [v17 buttonWithTitle:v19 style:0 handler:v36];

      [v11 addButton:v20];
    }
    uint64_t v21 = [(WFSmartPromptDialogRequest *)v10 allowAlwaysButton];

    if (v21)
    {
      uint64_t v22 = (void *)MEMORY[0x1E4F5A770];
      id v23 = [(WFSmartPromptDialogRequest *)v10 allowAlwaysButton];
      id v24 = [v23 title];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __89__WFBackgroundShortcutRunner_presentAlertWithSmartPromptConfiguration_completionHandler___block_invoke_2;
      v34[3] = &unk_1E6558678;
      id v35 = v6;
      __int16 v25 = [v22 buttonWithTitle:v24 style:0 handler:v34];

      [v11 addButton:v25];
    }
    int v26 = [(WFSmartPromptDialogRequest *)v10 denyButton];

    if (v26)
    {
      uint64_t v27 = (void *)MEMORY[0x1E4F5A770];
      BOOL v28 = [(WFSmartPromptDialogRequest *)v10 denyButton];
      id v29 = [v28 title];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __89__WFBackgroundShortcutRunner_presentAlertWithSmartPromptConfiguration_completionHandler___block_invoke_3;
      v32[3] = &unk_1E6558678;
      id v33 = v6;
      id v30 = [v27 buttonWithTitle:v29 style:1 handler:v32];

      [v11 addButton:v30];
    }
    [(WFBackgroundShortcutRunner *)self presentAlert:v11];
  }
  else
  {
    v31 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
    [v31 presentAlertWithSmartPromptConfiguration:v7 completionHandler:v6];
  }
}

uint64_t __89__WFBackgroundShortcutRunner_presentAlertWithSmartPromptConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__WFBackgroundShortcutRunner_presentAlertWithSmartPromptConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__WFBackgroundShortcutRunner_presentAlertWithSmartPromptConfiguration_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPreferredSizeForLinkViewSnippetWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  [v5 getPreferredSizeForLinkViewSnippetWithCompletion:v4];
}

- (void)getEnvironmentForLinkViewSnippetWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  [v5 getEnvironmentForLinkViewSnippetWithCompletion:v4];
}

- (void)showChronoControlOfType:(unint64_t)a3 identity:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  [v10 showChronoControlOfType:a3 identity:v9 completionHandler:v8];
}

- (void)shouldRunFollowUpActionWithBundleIdentifier:(id)a3 actionIdentifier:(id)a4 parameterValues:(id)a5 encodedToolInvocation:(id)a6 showOutputActionOptions:(unint64_t)a7 completionHandler:(id)a8
{
  id v19 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  __int16 v17 = (void (**)(id, void))a8;
  if ([(WFBackgroundShortcutRunner *)self runRequestOriginatedFromLocalSiri])
  {
    v17[2](v17, 0);
  }
  else
  {
    id v18 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
    [v18 shouldRunFollowUpActionWithBundleIdentifier:v19 actionIdentifier:v14 parameterValues:v15 encodedToolInvocation:v16 showOutputActionOptions:a7 completionHandler:v17];
  }
}

- (void)showLinkResult:(id)a3 dialog:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  [v11 showLinkResult:v10 dialog:v9 completionHandler:v8];
}

- (void)showLinkParameterConfirmationWithActionMetadata:(id)a3 dialog:(id)a4 dialogString:(id)a5 viewSnippet:(id)a6 parameterValue:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  [v20 showLinkParameterConfirmationWithActionMetadata:v19 dialog:v18 dialogString:v17 viewSnippet:v16 parameterValue:v15 completionHandler:v14];
}

- (void)showLinkActionConfirmationWithActionMetadata:(id)a3 showPrompt:(BOOL)a4 dialog:(id)a5 dialogString:(id)a6 viewSnippet:(id)a7 confirmationActionName:(id)a8 isContinueInAppRequest:(BOOL)a9 systemStyle:(id)a10 completionHandler:(id)a11
{
  BOOL v15 = a4;
  id v18 = a11;
  id v19 = a10;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a3;
  id v26 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  LOBYTE(v25) = a9;
  [v26 showLinkActionConfirmationWithActionMetadata:v24 showPrompt:v15 dialog:v23 dialogString:v22 viewSnippet:v21 confirmationActionName:v20 isContinueInAppRequest:v25 systemStyle:v19 completionHandler:v18];
}

- (void)showPreviewForContentCollection:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  [v8 showPreviewForContentCollection:v7 completionHandler:v6];
}

- (void)showHandleInteraction:(id)a3 prompt:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  [v11 showHandleInteraction:v10 prompt:v9 completionHandler:v8];
}

- (void)showConfirmInteraction:(id)a3 prompt:(id)a4 requireAuthentication:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  [v13 showConfirmInteraction:v12 prompt:v11 requireAuthentication:v6 completionHandler:v10];
}

- (void)requestActionInterfacePresentationForActionClassName:(id)a3 classNamesByType:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  [v11 requestActionInterfacePresentationForActionClassName:v10 classNamesByType:v9 completionHandler:v8];
}

- (void)presentAlert:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(WFBackgroundShortcutRunner *)self environment] == 4)
  {
    id v5 = getWFXPCRunnerLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v15 = "-[WFBackgroundShortcutRunner presentAlert:]";
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_INFO, "%s Trying to present an alert in a remote execution environment, going to send to originating device", buf, 0xCu);
    }

    BOOL v6 = [WFRemoteExecutionAlertRequest alloc];
    id v7 = [(WFBackgroundShortcutRunner *)self currentRemoteExecutionRunRequest];
    id v8 = [v7 identifier];
    id v9 = [(WFRemoteExecutionAlertRequest *)v6 initWithAlert:v4 associatedRunRequestIdentifier:v8];

    id v10 = [(WFBackgroundShortcutRunner *)self remoteExecutionCoordinator];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __43__WFBackgroundShortcutRunner_presentAlert___block_invoke;
    v12[3] = &unk_1E654E238;
    v12[4] = self;
    id v13 = v4;
    [v10 sendAlertRequest:v9 completion:v12];
  }
  else
  {
    id v11 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
    [v11 presentAlert:v4];
  }
}

void __43__WFBackgroundShortcutRunner_presentAlert___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = objc_msgSend(*(id *)(a1 + 40), "buttons", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v13 = [v12 title];
          int v14 = [v13 isEqualToString:v5];

          if (v14)
          {
            BOOL v15 = [v12 handler];
            v15[2]();
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }
  }
  else
  {
    uint64_t v16 = [*(id *)(a1 + 32) workflowController];
    id v17 = [v16 workflow];
    id v18 = [v17 actions];
    id v19 = [*(id *)(a1 + 32) workflowController];
    id v20 = [v19 currentState];
    id v21 = objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v20, "currentActionIndex"));

    [v21 finishRunningWithError:v6];
  }
}

- (BOOL)requestedInHomeResident
{
  return [(WFBackgroundShortcutRunner *)self environment] == 1;
}

- (BOOL)requestedFromAnotherDevice
{
  return [(WFBackgroundShortcutRunner *)self environment] == 4;
}

- (NSString)userInterfaceType
{
  return (NSString *)(id)*MEMORY[0x1E4F5ABF0];
}

- (void)workflowController:(id)a3 handleTestingEvent:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __86__WFBackgroundShortcutRunner_workflowController_handleTestingEvent_completionHandler___block_invoke;
  v9[3] = &unk_1E654E210;
  id v10 = v7;
  id v8 = v7;
  [(WFBackgroundShortcutRunner *)self handleTestingEventIfTesting:a4 completionHandler:v9];
}

void __86__WFBackgroundShortcutRunner_workflowController_handleTestingEvent_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = [a3 errorRepresentation];
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

- (void)workflowController:(id)a3 didGenerateReversalState:(id)a4 forAction:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(WFBackgroundShortcutRunner *)self actionReversalStates];
  [v9 setObject:v8 forKeyedSubscript:v7];
}

- (id)workflowController:(id)a3 actionReversalStateForAction:(id)a4
{
  id v5 = [(WFBackgroundShortcutRunner *)self workflowController];
  id v6 = [v5 workflow];
  id v7 = [v6 actions];
  unint64_t v8 = [v7 count];

  if (v8 <= 1)
  {
    id v10 = [(WFBackgroundShortcutRunner *)self currentRunRequest];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v11 = [v10 action];
      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v12 = v11;
        }
        else {
          id v12 = 0;
        }
      }
      else
      {
        id v12 = 0;
      }
      id v13 = v12;

      id v9 = [v13 reversalState];
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (void)action:(id)a3 provideInputForParameters:(id)a4 withDefaultStates:(id)a5 prompts:(id)a6 completionHandler:(id)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([(WFBackgroundShortcutRunner *)self isInRemoteExecutionEnvironment])
  {
    [(WFBackgroundShortcutRunner *)self sendRemoteAskWhenRunRequestWithParameters:v12 action:v17 completion:v15];
  }
  else
  {
    uint64_t v16 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
    [v16 action:v17 provideInputForParameters:v12 withDefaultStates:v13 prompts:v14 completionHandler:v15];
  }
}

- (BOOL)action:(id)a3 canProvideInputForParameter:(id)a4
{
  return 1;
}

- (id)remoteDialogPresenterEndpointForController:(id)a3
{
  char v3 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  uint64_t v4 = [v3 userInterfacePresenter];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [v6 endpoint];

  return v7;
}

- (void)workflowController:(id)a3 requestToQuarantineWorkflow:(id)a4
{
  id v4 = a4;
  id v6 = +[WFDatabaseProxy defaultDatabase];
  id v5 = [v4 reference];

  [v6 quarantineWorkflowWithReference:v5];
}

- (BOOL)workflowController:(id)a3 handleUnsupportedEnvironmentForAction:(id)a4 currentState:(id)a5 completionHandler:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = getWFRunningLifecycleLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v11 description];
    int v19 = 138543362;
    id v20 = v15;
    _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ is not supported in the current environment.", (uint8_t *)&v19, 0xCu);
  }
  if ([(WFBackgroundShortcutRunner *)self environment] == 4)
  {
    char v16 = 0;
  }
  else
  {
    id v17 = [v10 runSource];
    char v16 = WFRemoteExecuteActionIfApplicable(v11, v12, self, self, v17, v13);
  }
  return v16;
}

- (BOOL)workflowController:(id)a3 handleUnsupportedUserInterfaceForAction:(id)a4 currentState:(id)a5 completionHandler:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a6;
  BOOL v10 = [(WFBackgroundShortcutRunner *)self isRunningWithSiriUI];
  id v11 = getWFRunningLifecycleLogObject();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 136315138;
      int v19 = "-[WFBackgroundShortcutRunner workflowController:handleUnsupportedUserInterfaceForAction:currentState:completionHandler:]";
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_DEFAULT, "%s Using new punch out logic", buf, 0xCu);
    }

    id v11 = objc_alloc_init(MEMORY[0x1E4FB4928]);
    id v13 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __120__WFBackgroundShortcutRunner_workflowController_handleUnsupportedUserInterfaceForAction_currentState_completionHandler___block_invoke;
    v16[3] = &unk_1E654E1E8;
    v16[4] = self;
    id v17 = v9;
    [v13 performSiriRequest:v11 completionHandler:v16];
  }
  else if (v12)
  {
    id v14 = [v8 description];
    *(_DWORD *)buf = 138543362;
    int v19 = v14;
    _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ is not supported in the current user interface.", buf, 0xCu);
  }
  return v10;
}

void __120__WFBackgroundShortcutRunner_workflowController_handleUnsupportedUserInterfaceForAction_currentState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int v4 = [v3 shouldPunchOut];
    id v5 = getWFRunningLifecycleLogObject();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Received punch out success from Siri, performing unlock if needed", buf, 2u);
      }

      id v7 = objc_alloc_init(WFCompactUnlockService);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __120__WFBackgroundShortcutRunner_workflowController_handleUnsupportedUserInterfaceForAction_currentState_completionHandler___block_invoke_438;
      v16[3] = &unk_1E654E1C0;
      id v8 = *(void **)(a1 + 40);
      v16[4] = *(void *)(a1 + 32);
      id v17 = v7;
      id v18 = v8;
      id v9 = v7;
      [(WFCompactUnlockService *)v9 requestUnlockIfNeeded:v16];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "Received punch out failure from Siri, terminating without handoff", buf, 2u);
      }

      uint64_t v14 = *(void *)(a1 + 40);
      id v15 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
    }
    id v13 = v3;
  }
  else
  {

    BOOL v10 = getWFRunningLifecycleLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v20 = "-[WFBackgroundShortcutRunner workflowController:handleUnsupportedUserInterfaceForAction:currentState:complet"
            "ionHandler:]_block_invoke";
      __int16 v21 = 2112;
      id v22 = (id)objc_opt_class();
      id v11 = v22;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_FAULT, "%s Received unexpected interaction response of type %@", buf, 0x16u);
    }
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
  }
}

void __120__WFBackgroundShortcutRunner_workflowController_handleUnsupportedUserInterfaceForAction_currentState_completionHandler___block_invoke_438(uint64_t a1, int a2)
{
  int v4 = getWFRunningLifecycleLogObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEFAULT, "Received unlock success, performing handoff", buf, 2u);
    }

    BOOL v6 = +[WFUIPresenter defaultPresenter];
    [v6 setDelegate:*(void *)(a1 + 32)];
    id v7 = [*(id *)(a1 + 32) dialogTransformer];
    [v7 swapExternalUIPresenterWithPresenter:v6];

    id v8 = [*(id *)(a1 + 32) currentRunRequest];
    [v8 setPresentationMode:1];

    id v9 = [*(id *)(a1 + 32) dialogTransformer];
    BOOL v10 = [v9 attributionAllowingAction:0];

    id v11 = [*(id *)(a1 + 32) dialogTransformer];
    uint64_t v12 = [v11 userInterfacePresenter];
    id v13 = [*(id *)(a1 + 32) currentRunningContext];
    [v12 beginPersistentModeWithRunningContext:v13 attribution:v10 completionHandler:&__block_literal_global_441];

    [*(id *)(a1 + 32) synchronouslyPerformWithHost:&__block_literal_global_444];
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = [MEMORY[0x1E4F28C58] wfSiriPunchOutError];
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEFAULT, "Received unlock failure, terminating without handoff", v17, 2u);
    }

    uint64_t v16 = *(void *)(a1 + 48);
    BOOL v6 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v6);
  }
}

uint64_t __120__WFBackgroundShortcutRunner_workflowController_handleUnsupportedUserInterfaceForAction_currentState_completionHandler___block_invoke_442(uint64_t a1, void *a2)
{
  return [a2 runnerDidPunchToShortcutsJr];
}

void __120__WFBackgroundShortcutRunner_workflowController_handleUnsupportedUserInterfaceForAction_currentState_completionHandler___block_invoke_439(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = getWFGeneralLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      BOOL v5 = "-[WFBackgroundShortcutRunner workflowController:handleUnsupportedUserInterfaceForAction:currentState:completi"
           "onHandler:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_ERROR, "%s Failed to begin persistent mode: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)workflowController:(id)a3 actionDidRequestWorkflowExit:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  BOOL v5 = getWFRunningLifecycleLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v6 = [v4 description];
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ requested shortcut exit.", (uint8_t *)&v7, 0xCu);
  }
}

- (void)workflowController:(id)a3 didRunAction:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  uint64_t v14 = getWFRunningLifecycleLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v11 description];
    uint64_t v16 = [v11 output];
    *(_DWORD *)buf = 138543874;
    __int16 v41 = v15;
    __int16 v42 = 1026;
    *(_DWORD *)__int16 v43 = v12 != 0;
    *(_WORD *)&v43[4] = 2112;
    *(void *)&v43[6] = v16;
    _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_DEFAULT, "Action finished running %{public}@, error: %{BOOL,public}d, output: %@.", buf, 0x1Cu);
  }
  if ([(WFBackgroundShortcutRunner *)self isStepwiseExecution])
  {
    id v17 = getWFRunningLifecycleLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v41 = "-[WFBackgroundShortcutRunner workflowController:didRunAction:error:completionHandler:]";
      __int16 v42 = 2112;
      *(void *)__int16 v43 = v12;
      _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_DEFAULT, "%s [Step-wise] Sending action result (error: %@) out", buf, 0x16u);
    }

    id v18 = [v11 outputVariableWithVariableProvider:v11 UUIDProvider:0];
    id v19 = v11;
    if (v19)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = objc_alloc(MEMORY[0x1E4FB49B0]);
        __int16 v21 = [v19 undoContext];
        uint64_t v22 = [v19 didRunOpensIntent];
        uint64_t v23 = [v19 attribution];
        long long v24 = (void *)[v20 initWithUndoContext:v21 didRunOpensIntent:v22 attribution:v23];

        id v25 = v19;
      }
      else
      {
        id v25 = 0;
        long long v24 = 0;
        __int16 v21 = v19;
      }
    }
    else
    {
      __int16 v21 = 0;
      id v25 = 0;
      long long v24 = 0;
    }

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __86__WFBackgroundShortcutRunner_workflowController_didRunAction_error_completionHandler___block_invoke;
    v35[3] = &unk_1E654E198;
    id v36 = v19;
    id v37 = v12;
    id v38 = v18;
    id v39 = v24;
    BOOL v28 = (WFActionDidRunTestingEvent *)v19;
    id v29 = v24;
    id v30 = v18;
    [(WFBackgroundShortcutRunner *)self performWithHost:v35];
    v13[2](v13);
  }
  else
  {
    id v26 = [WFActionDidRunTestingEvent alloc];
    uint64_t v27 = [v11 output];
    BOOL v28 = [(WFActionDidRunTestingEvent *)v26 initWithAction:v11 output:v27 error:v12];

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __86__WFBackgroundShortcutRunner_workflowController_didRunAction_error_completionHandler___block_invoke_2;
    v31[3] = &unk_1E654E260;
    v31[4] = self;
    id v34 = v13;
    id v32 = v11;
    id v33 = v10;
    id v25 = v11;
    [(WFBackgroundShortcutRunner *)self handleTestingEventIfTesting:v28 completionHandler:v31];
  }
}

void __86__WFBackgroundShortcutRunner_workflowController_didRunAction_error_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v9 = [v3 UUID];
  BOOL v5 = (void *)MEMORY[0x1E4FB4558];
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = [*(id *)(a1 + 48) serializedRepresentation];
  uint64_t v8 = [v5 objectWithPropertyListObject:v7];
  [v4 actionWithUUID:v9 didFinishRunningWithError:v6 serializedVariable:v8 executionResultMetadata:*(void *)(a1 + 56)];
}

void __86__WFBackgroundShortcutRunner_workflowController_didRunAction_error_completionHandler___block_invoke_2(id *a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__WFBackgroundShortcutRunner_workflowController_didRunAction_error_completionHandler___block_invoke_3;
    aBlock[3] = &unk_1E6558678;
    id v15 = a1[7];
    uint64_t v6 = (void (**)(void))_Block_copy(aBlock);
    int v7 = [a1[4] dialogTransformer];
    [v7 setCurrentAction:0];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [MEMORY[0x1E4FB4890] sharedManager];
      id v13 = 0;
      char v9 = [v8 retakeResignedExtensionsWithReason:@"Runner finished Run Workflow" error:&v13];
      id v10 = v13;

      if ((v9 & 1) == 0) {
        [a1[6] stopWithError:v10];
      }
    }
    v6[2](v6);
  }
  else
  {
    id v11 = [a1[4] stateMachine];
    id v12 = [v5 errorRepresentation];
    [v11 stopShortcutWithError:v12 reason:@"harness test failed"];
  }
}

uint64_t __86__WFBackgroundShortcutRunner_workflowController_didRunAction_error_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)workflowController:(id)a3 prepareToRunAction:(id)a4 withInput:(id)a5 completionHandler:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = getWFRunningLifecycleLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v10 description];
    *(_DWORD *)buf = 138543362;
    __int16 v43 = v13;
    _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_DEFAULT, "Running action %{public}@", buf, 0xCu);
  }
  uint64_t v14 = getWFRunningLifecycleLogObject();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v14, OS_SIGNPOST_INTERVAL_END, 0xFFFFFFFFuLL, "UntilFirstAction", " enableTelemetry=YES ", buf, 2u);
  }

  id v15 = [v9 workflow];
  uint64_t v16 = [v15 actions];
  uint64_t v17 = [v16 indexOfObject:v10];

  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    dialogTransformer = self->_dialogTransformer;
    id v19 = [NSNumber numberWithUnsignedInteger:v17 + 1];
    [(WFDialogTransformer *)dialogTransformer willBeginExecutingShortcutStep:v19];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__WFBackgroundShortcutRunner_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6557D28;
  id v20 = v10;
  id v39 = v20;
  id v40 = self;
  id v21 = v11;
  id v41 = v21;
  uint64_t v22 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v23 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  [v23 setCurrentAction:v20];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __96__WFBackgroundShortcutRunner_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke_3;
  v35[3] = &unk_1E654E170;
  id v24 = v20;
  id v36 = v24;
  id v25 = v9;
  id v37 = v25;
  [(WFBackgroundShortcutRunner *)self performWithRunningProgressSuppressionStateMachine:v35];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = [MEMORY[0x1E4FB4890] sharedManager];
    [v26 resignIssuedExtensionsWithReason:@"Runner running Run Workflow"];

    v22[2](v22);
  }
  else
  {
    Class v27 = NSClassFromString(&cfstr_Wfhealthkitres.isa);
    if (!v27
      || (objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), v27, 0),
          (BOOL v28 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      BOOL v28 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    }
    id v29 = [v24 resourceManager];
    id v30 = [v29 resourceObjectsOfClasses:v28];
    v31 = objc_msgSend(v30, "if_compactMap:", &__block_literal_global_423);

    id v32 = [MEMORY[0x1E4FB4890] sharedManager];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __96__WFBackgroundShortcutRunner_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke_5;
    v33[3] = &unk_1E6556318;
    id v34 = v22;
    [v32 requestSandboxExtensionForRunningActionWithAccessResources:v31 completion:v33];
  }
}

void __96__WFBackgroundShortcutRunner_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [(WFActionTestingEvent *)[WFActionWillRunTestingEvent alloc] initWithAction:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __96__WFBackgroundShortcutRunner_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke_2;
  v4[3] = &unk_1E654E148;
  v4[4] = v3;
  id v5 = *(id *)(a1 + 48);
  [v3 handleTestingEventIfTesting:v2 completionHandler:v4];
}

void __96__WFBackgroundShortcutRunner_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 workflow];
  [v4 startedRunningAction:v2 inShortcut:v5];
}

uint64_t __96__WFBackgroundShortcutRunner_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  if ([a2 containsObject:@"WFCalendarAccessResource"]) {
    WFClearWorkflowEventStore();
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

id __96__WFBackgroundShortcutRunner_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke_4()
{
  v0 = (objc_class *)objc_opt_class();
  id v1 = NSStringFromClass(v0);
  if ([MEMORY[0x1E4FB4870] hasExtensionForResourceClassName:v1]) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

void __96__WFBackgroundShortcutRunner_workflowController_prepareToRunAction_withInput_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) stateMachine];
    uint64_t v6 = [v7 errorRepresentation];
    [v5 stopShortcutWithError:v6 reason:@"harness test failed"];
  }
}

- (void)workflowController:(id)a3 didFinishRunningWithError:(id)a4 cancelled:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    id v10 = getWFRunningLifecycleLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v8 workflow];
      *(_DWORD *)buf = 138412290;
      uint64_t v44 = v11;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "Shortcut %@ was cancelled.", buf, 0xCu);
    }
    [MEMORY[0x1E4F28C58] userCancelledError];
    v9 = id v12 = v9;
  }
  else
  {
    id v12 = getWFRunningLifecycleLogObject();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v13)
      {
        uint64_t v14 = [v8 workflow];
        *(_DWORD *)buf = 138412547;
        uint64_t v44 = v14;
        __int16 v45 = 2113;
        uint64_t v46 = v9;
        _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_DEFAULT, "Shortcut %@ failed with error %{private}@.", buf, 0x16u);
      }
    }
    else
    {
      if (v13)
      {
        id v15 = [v8 workflow];
        uint64_t v16 = [v8 output];
        *(_DWORD *)buf = 138412547;
        uint64_t v44 = v15;
        __int16 v45 = 2113;
        uint64_t v46 = v16;
        _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_DEFAULT, "Shortcut %@ has finished running with output: %{private}@.", buf, 0x16u);
      }
      id v9 = 0;
    }
  }

  uint64_t v17 = [(WFBackgroundShortcutRunner *)self testingHarnessErrorForWorkflowFinishedError:v9];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke;
  aBlock[3] = &unk_1E654E0D0;
  id v18 = v8;
  id v41 = v18;
  __int16 v42 = self;
  id v19 = _Block_copy(aBlock);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  void v37[2] = __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_399;
  v37[3] = &unk_1E65561A8;
  id v20 = v19;
  id v39 = v20;
  v37[4] = self;
  id v21 = v18;
  id v38 = v21;
  uint64_t v22 = _Block_copy(v37);
  if ([(WFBackgroundShortcutRunner *)self environment] == 4)
  {
    uint64_t v23 = [(WFBackgroundShortcutRunner *)self currentRemoteExecutionRunRequest];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_5;
    v34[3] = &unk_1E65572A0;
    id v36 = v22;
    id v35 = v17;
    [(WFBackgroundShortcutRunner *)self sendResponseForRunRequest:v23 controller:v21 error:v35 completion:v34];
  }
  else if (((objc_msgSend(v17, "wf_isUnsupportedUserInterfaceError") & 1) != 0 {
          || objc_msgSend(v17, "wf_isUnsupportedEnvironmentError"))
  }
         && ([v21 runningContext],
             id v24 = objc_claimAutoreleasedReturnValue(),
             char v25 = [v24 isShortcutsApp],
             v24,
             (v25 & 1) == 0))
  {
    id v26 = [v21 runningContext];
    Class v27 = (void *)[v26 copyWithNewIdentity];

    BOOL v28 = [v21 currentStateWithContext:v27];
    id v29 = [v21 runSource];
    if (v28)
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_6;
      v31[3] = &unk_1E65572A0;
      id v32 = 0;
      id v33 = v22;
      [(WFBackgroundShortcutRunner *)self launchAppToContinueFromState:v28 runSource:v29 withCompletion:v31];

      id v30 = v33;
    }
    else
    {
      id v30 = getWFXPCRunnerLogObject();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v44 = "-[WFBackgroundShortcutRunner workflowController:didFinishRunningWithError:cancelled:]";
        _os_log_impl(&dword_1C7F0A000, v30, OS_LOG_TYPE_FAULT, "%s Need to handoff, but workflow controller state is nil", buf, 0xCu);
      }
    }
  }
  else
  {
    (*((void (**)(void *, void *))v22 + 2))(v22, v17);
  }
}

void __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) output];
  if ([v4 numberOfItems] < 1
    || [*(id *)(a1 + 32) outputBehavior] != 2
    || ([*(id *)(a1 + 32) shouldDisablePrivacyPrompts] & 1) != 0)
  {
    goto LABEL_6;
  }
  BOOL v5 = [*(id *)(a1 + 32) lastExecutedAction];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

LABEL_6:
    goto LABEL_7;
  }
  id v7 = [*(id *)(a1 + 32) runSource];
  char IsExemptFromOutputApproval = WFRunSourceIsExemptFromOutputApproval();

  if ((IsExemptFromOutputApproval & 1) == 0)
  {
    id v9 = [WFSmartPromptConfiguration alloc];
    id v10 = [*(id *)(a1 + 32) output];
    id v11 = [*(id *)(a1 + 32) workflow];
    id v12 = [v11 reference];
    BOOL v13 = [*(id *)(a1 + 32) runSource];
    uint64_t v14 = [(WFSmartPromptConfiguration *)v9 initWithOutputContentCollection:v10 reference:v12 source:v13];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_2;
    v16[3] = &unk_1E654E910;
    id v15 = *(void **)(a1 + 40);
    id v17 = *(id *)(a1 + 32);
    id v18 = v3;
    [v15 presentAlertWithSmartPromptConfiguration:v14 completionHandler:v16];

    goto LABEL_8;
  }
LABEL_7:
  uint64_t v6 = [*(id *)(a1 + 32) output];
  (*((void (**)(id, void *))v3 + 2))(v3, v6);

LABEL_8:
}

void __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_399(void *a1, void *a2)
{
  id v3 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_2_400;
  v8[3] = &unk_1E654E120;
  id v4 = (void *)a1[5];
  uint64_t v5 = a1[6];
  v8[4] = a1[4];
  id v9 = v4;
  id v10 = v3;
  uint64_t v6 = *(void (**)(uint64_t, void *))(v5 + 16);
  id v7 = v3;
  v6(v5, v8);
}

uint64_t __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_2_400(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (_os_feature_enabled_impl()
    && ([*(id *)(a1 + 32) workflowController],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 outputBehavior],
        v4,
        v5 == 3))
  {
    uint64_t v6 = [*(id *)(a1 + 40) actionOutputs];
    id v7 = *(void **)(a1 + 48);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_3;
    v13[3] = &unk_1E654E0F8;
    v13[4] = *(void *)(a1 + 32);
    WFBackgroundShortcutRunnerMakeAllActionsResult(v6, v8, v7, v13);
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) currentRunRequest];
    id v9 = [*(id *)(a1 + 32) actionReversalStates];
    id v10 = (void *)[v9 copy];
    id v11 = *(void **)(a1 + 48);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_4;
    v12[3] = &unk_1E654E0F8;
    v12[4] = *(void *)(a1 + 32);
    WFBackgroundShortcutRunnerMakeResult(v6, v3, v10, v11, v12);
  }
}

void __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 stateMachine];
  [v4 finishRunningWithReason:@"workflow controller did finish" result:v3];
}

void __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 stateMachine];
  [v4 finishRunningWithReason:@"workflow controller did finish" result:v3];
}

void __85__WFBackgroundShortcutRunner_workflowController_didFinishRunningWithError_cancelled___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a2 == 2)
  {
    uint64_t v5 = getWFSecurityLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[WFBackgroundShortcutRunner workflowController:didFinishRunningWithError:cancelled:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s User selected Allow Once at output smart prompt", (uint8_t *)&v10, 0xCu);
    }

    id v4 = [*(id *)(a1 + 32) output];
  }
  else if (a2 == 1)
  {
    uint64_t v6 = getWFSecurityLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[WFBackgroundShortcutRunner workflowController:didFinishRunningWithError:cancelled:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_DEFAULT, "%s User selected Allow Always at output smart prompt", (uint8_t *)&v10, 0xCu);
    }

    id v4 = [*(id *)(a1 + 32) output];
    id v7 = +[WFDatabaseProxy defaultDatabase];
    uint64_t v8 = [*(id *)(a1 + 32) workflow];
    id v9 = [v8 reference];
    [v7 saveOutputActionSmartPromtDataForWorkflowReference:v9 error:0];
  }
  else
  {
    if (!a2)
    {
      id v3 = getWFSecurityLogObject();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        id v11 = "-[WFBackgroundShortcutRunner workflowController:didFinishRunningWithError:cancelled:]_block_invoke_2";
        _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEFAULT, "%s User selected Deny at output smart prompt", (uint8_t *)&v10, 0xCu);
      }
    }
    id v4 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)workflowController:(id)a3 didDecideRunningProgressIsAllowed:(BOOL)a4 forAction:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __93__WFBackgroundShortcutRunner_workflowController_didDecideRunningProgressIsAllowed_forAction___block_invoke;
  v5[3] = &__block_descriptor_33_e50_v16__0__WFRunningProgressSuppressionStateMachine_8l;
  BOOL v6 = a4;
  -[WFBackgroundShortcutRunner performWithRunningProgressSuppressionStateMachine:](self, "performWithRunningProgressSuppressionStateMachine:", v5, a4, a5);
}

uint64_t __93__WFBackgroundShortcutRunner_workflowController_didDecideRunningProgressIsAllowed_forAction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 decideRunningProgressIsAllowed:*(unsigned __int8 *)(a1 + 32) withReason:@"action said so"];
}

- (void)workflowControllerWillRun:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    BOOL v6 = [v4 workflow];
    *(_DWORD *)buf = 136315394;
    id v29 = "-[WFBackgroundShortcutRunner workflowControllerWillRun:]";
    __int16 v30 = 2112;
    v31 = v6;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEBUG, "%s Workflow controller starting for workflow: %@", buf, 0x16u);
  }
  id v7 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  uint64_t v8 = [v7 attribution];

  id v9 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  int v10 = [v9 currentAction];

  if (!v10)
  {
    id v11 = [v4 workflow];
    uint64_t v12 = [v11 actions];
    BOOL v13 = [v12 firstObject];
    uint64_t v14 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
    [v14 setCurrentAction:v13];
  }
  id v15 = [v4 input];
  uint64_t v16 = [v15 requiredResourcesForContent];

  if (v16)
  {
    id v17 = [MEMORY[0x1E4FB4890] sharedManager];
    id v27 = 0;
    char v18 = [v17 requestSandboxExtensionForRunningActionWithAccessResources:v16 error:&v27];
    id v19 = v27;

    if ((v18 & 1) == 0)
    {
      id v20 = getWFSecurityLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v29 = "-[WFBackgroundShortcutRunner workflowControllerWillRun:]";
        __int16 v30 = 2112;
        v31 = v16;
        _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_ERROR, "%s Error consuming sandbox resources %@ required to access shortcut input. The shortcut might have trouble accessing its input.", buf, 0x16u);
      }
    }
  }
  id v21 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  [v21 workflowWillBegin];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __56__WFBackgroundShortcutRunner_workflowControllerWillRun___block_invoke;
  v24[3] = &unk_1E654E088;
  v24[4] = self;
  id v25 = v8;
  id v26 = v4;
  id v22 = v4;
  id v23 = v8;
  [(WFBackgroundShortcutRunner *)self performWithHost:v24];
}

void __56__WFBackgroundShortcutRunner_workflowControllerWillRun___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 workflowController];
  BOOL v6 = [v5 workflow];
  id v7 = [v6 reference];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isPersonalAutomation"));
  [v4 workflowDidStartRunning:v7 isAutomation:v8 dialogAttribution:*(void *)(a1 + 40)];

  objc_msgSend(*(id *)(a1 + 32), "queue_runningProgressSuppressionStateMachine");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [*(id *)(a1 + 48) workflow];
  [v10 startedRunningShortcut:v9 withDialogAttribution:*(void *)(a1 + 40)];
}

- (id)queue_runningProgressSuppressionStateMachine
{
  id v3 = [(WFBackgroundShortcutRunner *)self queue];
  dispatch_assert_queue_V2(v3);

  runningProgressSuppressionStateMachine = self->_runningProgressSuppressionStateMachine;
  return runningProgressSuppressionStateMachine;
}

- (void)synchronouslyPerformWithRunningProgressSuppressionStateMachine:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFBackgroundShortcutRunner *)self queue];
  dispatch_assert_queue_not_V2(v5);

  BOOL v6 = [(WFBackgroundShortcutRunner *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__WFBackgroundShortcutRunner_synchronouslyPerformWithRunningProgressSuppressionStateMachine___block_invoke;
  v8[3] = &unk_1E65572A0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

uint64_t __93__WFBackgroundShortcutRunner_synchronouslyPerformWithRunningProgressSuppressionStateMachine___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 8));
}

- (void)performWithRunningProgressSuppressionStateMachine:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFBackgroundShortcutRunner *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__WFBackgroundShortcutRunner_performWithRunningProgressSuppressionStateMachine___block_invoke;
  v7[3] = &unk_1E65572A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __80__WFBackgroundShortcutRunner_performWithRunningProgressSuppressionStateMachine___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 8));
}

- (void)synchronouslyPerformWithHost:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFBackgroundShortcutRunner *)self queue];
  dispatch_assert_queue_not_V2(v5);

  id v6 = [(WFBackgroundShortcutRunner *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__WFBackgroundShortcutRunner_synchronouslyPerformWithHost___block_invoke;
  v8[3] = &unk_1E65572A0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

void __59__WFBackgroundShortcutRunner_synchronouslyPerformWithHost___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_389];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __59__WFBackgroundShortcutRunner_synchronouslyPerformWithHost___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[WFBackgroundShortcutRunner synchronouslyPerformWithHost:]_block_invoke_2";
    __int16 v6 = 2114;
    id v7 = v2;
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_ERROR, "%s failed to get remote object proxy to host: %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)performWithHost:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFBackgroundShortcutRunner *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__WFBackgroundShortcutRunner_performWithHost___block_invoke;
  v7[3] = &unk_1E65572A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__WFBackgroundShortcutRunner_performWithHost___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  id v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_387];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __46__WFBackgroundShortcutRunner_performWithHost___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[WFBackgroundShortcutRunner performWithHost:]_block_invoke_2";
    __int16 v6 = 2114;
    id v7 = v2;
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_ERROR, "%s failed to get remote object proxy to host: %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)allowIncomingRunRequest:(id)a3 withDescriptor:(id)a4 accessSpecifier:(id)a5 record:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 allowFullRuntimeAccess])
  {
    LOBYTE(v11) = 1;
    goto LABEL_43;
  }
  id v12 = v8;
  id v13 = v9;
  id v14 = v12;
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {

LABEL_8:
      LOBYTE(v11) = [v10 allowRunningTestHarnessTests];
      goto LABEL_43;
    }
  }

  id v15 = v13;
  if (v15)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_8;
    }
    id v18 = v15;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v18;
    }
    else {
      id v17 = 0;
    }
  }
  else
  {

    id v17 = 0;
  }
  id v19 = [v17 action];
  if (v19)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }
  }
  else
  {
    id v20 = 0;
  }
  id v21 = v20;

  id v22 = [v21 associatedAppBundleIdentifier];

  if (v22
    && (objc_msgSend(v22, "wf_isEmpty") & 1) == 0
    && ([v10 allowLinkContextualActionRunningForBundleIdentifier:v22] & 1) != 0)
  {
    goto LABEL_26;
  }
  if ([v10 allowCustomShortcutRunning])
  {
    id v23 = v15;
    objc_opt_class();
    char v24 = objc_opt_isKindOfClass();

    if (v24) {
      goto LABEL_26;
    }
  }
  if ([v10 allowStepwiseExecution]
    && (v25 = v15, objc_opt_class(), char v26 = objc_opt_isKindOfClass(), v25, (v26 & 1) != 0)
    || ([v10 allowHomeResidentShortcutRunning] & 1) != 0)
  {
LABEL_26:
    LOBYTE(v11) = 1;
  }
  else
  {
    id v27 = v15;
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      BOOL v28 = [v27 action];
      WFStaticContextualActionDefinitionsForSurface();
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v29 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v29 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v11)
      {
        uint64_t v30 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v34 != v30) {
              objc_enumerationMutation(v29);
            }
            if (objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "isEqual:", v28, (void)v33))
            {
              LOBYTE(v11) = 1;
              goto LABEL_40;
            }
          }
          uint64_t v11 = [v29 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_40:
    }
    else
    {

      LOBYTE(v11) = 0;
    }
  }
LABEL_43:

  return v11;
}

- (void)computeFinderResizedSizesForImages:(id)a3 inSizes:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v19 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(WFFinderImageResizer);
  id v10 = objc_alloc_init(MEMORY[0x1E4F5A830]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = (void *)MEMORY[0x1E4F5A900];
        id v17 = [*(id *)(*((void *)&v20 + 1) + 8 * v15) fileURL];
        id v18 = [v16 fileWithURL:v17 options:29];

        [v10 addFile:v18];
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  [(WFFinderImageResizer *)v9 computeResizedSizesForImages:v10 inSizes:v19 completion:v8];
}

- (void)filterContextualActions:(id)a3 forContext:(id)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v7 = a4;
  id v27 = a5;
  id v8 = objc_alloc_init(MEMORY[0x1E4F5A830]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  BOOL v28 = v7;
  id obj = [v7 files];
  uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v14 = (void *)MEMORY[0x1E4F5A900];
        uint64_t v15 = objc_msgSend(v13, "fileURL", v26);
        uint64_t v16 = (void *)MEMORY[0x1E4FB4718];
        id v17 = [v13 type];
        id v18 = [v17 identifier];
        id v19 = [v16 typeWithString:v18];
        long long v20 = [v14 fileWithURL:v15 options:8 ofType:v19];

        [v8 addFile:v20];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v10);
  }

  long long v21 = objc_msgSend(v26, "if_map:", &__block_literal_global_382);
  long long v22 = +[WFActionRegistry sharedRegistry];
  long long v23 = [v22 createActionsWithIdentifiers:v21 serializedParameterArray:0];

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __76__WFBackgroundShortcutRunner_filterContextualActions_forContext_completion___block_invoke_2;
  v30[3] = &unk_1E654E060;
  id v31 = v26;
  id v32 = v8;
  id v24 = v8;
  id v25 = v26;
  objc_msgSend(v23, "if_mapAsynchronously:completionHandler:", v30, v27);
}

void __76__WFBackgroundShortcutRunner_filterContextualActions_forContext_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = *(void **)(a1 + 32);
  id v9 = a2;
  uint64_t v10 = [v8 objectAtIndexedSubscript:a3];
  uint64_t v11 = *(void *)(a1 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __76__WFBackgroundShortcutRunner_filterContextualActions_forContext_completion___block_invoke_3;
  v14[3] = &unk_1E6557E58;
  id v15 = v10;
  id v16 = v7;
  id v12 = v10;
  id v13 = v7;
  [v9 matchContextualAction:v12 toContentCollection:v11 completionHandler:v14];
}

uint64_t __76__WFBackgroundShortcutRunner_filterContextualActions_forContext_completion___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

uint64_t __76__WFBackgroundShortcutRunner_filterContextualActions_forContext_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)getContextualActionsForContext:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  __int16 v6 = (void (**)(id, id, void))a4;
  id v7 = +[WFActionRegistry sharedRegistry];
  id v8 = [v7 createActionsWithIdentifiers:MEMORY[0x1E4F1CBF0] serializedParameterArray:0];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14), "contextualActionsForSurface:", objc_msgSend(v5, "surface", (void)v16));
        [v9 addObjectsFromArray:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  v6[2](v6, v9, 0);
}

- (void)sendResponseForRunRequest:(id)a3 controller:(id)a4 error:(id)a5 completion:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = [v10 identifier];
    *(_DWORD *)buf = 136315650;
    id v29 = "-[WFBackgroundShortcutRunner sendResponseForRunRequest:controller:error:completion:]";
    __int16 v30 = 2114;
    id v31 = v15;
    __int16 v32 = 2114;
    id v33 = v12;
    _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_INFO, "%s <%{public}@> preparing to send response, error: %{public}@", buf, 0x20u);
  }
  long long v16 = [v10 identifier];

  if (v16)
  {
    long long v17 = [WFRemoteExecutionRunRequestResponse alloc];
    long long v18 = [v10 identifier];
    long long v19 = [v11 output];
    long long v20 = [(WFRemoteExecutionRunRequestResponse *)v17 initWithRunRequestIdentifier:v18 variables:0 output:v19 error:v12];

    uint64_t v21 = [(WFBackgroundShortcutRunner *)self remoteExecutionCoordinator];
    [v20 setCoordinator:v21];

    id v22 = objc_alloc_init(MEMORY[0x1E4F94098]);
    id v27 = 0;
    [v20 writeTo:v22 error:&v27];
    id v23 = v27;
    id v24 = [v22 immutableData];

    if (v24)
    {
      id v25 = [(WFBackgroundShortcutRunner *)self remoteExecutionCoordinator];
      id v26 = [v22 immutableData];
      [v25 sendRunRequestResponse:v26 completion:v13];
    }
    else
    {
      id v25 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v29 = "-[WFBackgroundShortcutRunner sendResponseForRunRequest:controller:error:completion:]";
        __int16 v30 = 2114;
        id v31 = v23;
        _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_FAULT, "%s An error occurred while writing the run request data %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    long long v20 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v29 = "-[WFBackgroundShortcutRunner sendResponseForRunRequest:controller:error:completion:]";
      _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_FAULT, "%s Unable to send response for run request because the run request did not have an identifier", buf, 0xCu);
    }
  }
}

- (void)handleIncomingFileForRemoteExecutionWithURL:(id)a3 withIdentifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    id v11 = "-[WFBackgroundShortcutRunner handleIncomingFileForRemoteExecutionWithURL:withIdentifier:]";
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_INFO, "%s Incoming file with id: %@, at fileURL: %@", (uint8_t *)&v10, 0x20u);
  }

  id v9 = [(WFBackgroundShortcutRunner *)self fileCoordinator];
  [v9 handleFile:v6 withIdentifier:v7];
}

- (WFRemoteExecutionCoordinator)remoteExecutionCoordinator
{
  remoteExecutionCoordinator = self->_remoteExecutionCoordinator;
  if (!remoteExecutionCoordinator)
  {
    uint64_t v4 = +[WFRemoteExecutionCoordinator sharedCoordinator];
    id v5 = self->_remoteExecutionCoordinator;
    self->_remoteExecutionCoordinator = v4;

    remoteExecutionCoordinator = self->_remoteExecutionCoordinator;
  }
  return remoteExecutionCoordinator;
}

- (WFRemoteExecutionFileCoordinator)fileCoordinator
{
  fileCoordinator = self->_fileCoordinator;
  if (!fileCoordinator)
  {
    uint64_t v4 = (WFRemoteExecutionFileCoordinator *)objc_opt_new();
    id v5 = self->_fileCoordinator;
    self->_fileCoordinator = v4;

    fileCoordinator = self->_fileCoordinator;
  }
  return fileCoordinator;
}

- (void)presenterRequestedUpdatedRunViewSource:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__WFBackgroundShortcutRunner_presenterRequestedUpdatedRunViewSource_completionHandler___block_invoke;
  v10[3] = &unk_1E654E018;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(WFBackgroundShortcutRunner *)self performWithHost:v10];
}

void __87__WFBackgroundShortcutRunner_presenterRequestedUpdatedRunViewSource_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __87__WFBackgroundShortcutRunner_presenterRequestedUpdatedRunViewSource_completionHandler___block_invoke_2;
    v5[3] = &unk_1E654DFF0;
    uint64_t v3 = *(void *)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    [a2 presenterRequestedUpdatedRunViewSource:v3 completionHandler:v5];
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

uint64_t __87__WFBackgroundShortcutRunner_presenterRequestedUpdatedRunViewSource_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presenterRequestedWorkflowPauseForContext:(id)a3 dialogRequest:(id)a4
{
  id v5 = a3;
  id v6 = [(WFBackgroundShortcutRunner *)self workflowController];
  id v7 = [v6 runningContext];
  id v10 = v5;
  id v8 = v7;
  if (v8 == v10)
  {

    goto LABEL_7;
  }
  if (!v10 || !v8)
  {

    goto LABEL_9;
  }
  char v9 = [v10 isEqual:v8];

  if (v9) {
LABEL_7:
  }
    [(WFBackgroundShortcutRunner *)self pauseWorkflowAndWriteStateToDisk:v10];
LABEL_9:
}

- (void)presenterRequestedWorkflowStopForContext:(id)a3
{
}

- (void)presenterWillShowRequest:(id)a3 runningContext:(id)a4
{
}

uint64_t __70__WFBackgroundShortcutRunner_presenterWillShowRequest_runningContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 decideRunningProgressIsAllowed:1, @"dialog request came in, stop suppressing persistent mode" withReason];
}

- (WFDialogTransformer)dialogTransformer
{
  dialogTransformer = self->_dialogTransformer;
  if (dialogTransformer) {
    goto LABEL_29;
  }
  uint64_t v4 = [(WFBackgroundShortcutRunner *)self currentTestCase];

  if (!v4)
  {
    uint64_t v16 = [(WFBackgroundShortcutRunner *)self currentRunRequest];
    long long v17 = [v16 remoteDialogPresenterEndpoint];

    if (!v17)
    {
      id v25 = [(WFBackgroundShortcutRunner *)self currentRunRequest];
      uint64_t v26 = [v25 presentationMode];

      if (v26 == 3)
      {
        id v12 = 0;
        goto LABEL_5;
      }
      id v15 = +[WFUIPresenter defaultPresenter];
      [(WFUIPresenter *)v15 setDelegate:self];
LABEL_20:
      id v12 = 0;
      goto LABEL_26;
    }
    long long v18 = [(WFBackgroundShortcutRunner *)self siriOptions];
    if ([v18 disableSiriBehavior])
    {
      LOBYTE(v19) = 1;
      LOBYTE(v20) = 1;
      if (v18) {
        goto LABEL_17;
      }
    }
    else
    {
      id v27 = [(WFBackgroundShortcutRunner *)self currentRunRequest];
      int v19 = [v27 handlesDialogRequests];

      if (v18)
      {
        if (v19)
        {
          LOBYTE(v20) = 1;
          goto LABEL_17;
        }
LABEL_22:
        id v15 = 0;
LABEL_23:
        id v29 = objc_alloc(MEMORY[0x1E4FB4710]);
        __int16 v30 = [(WFBackgroundShortcutRunner *)self currentRunRequest];
        id v31 = [v30 remoteDialogPresenterEndpoint];
        __int16 v32 = (WFUIPresenterXPCConnection *)[v29 initWithEndpoint:v31];

        id v12 = (void *)[objc_alloc(MEMORY[0x1E4FB4708]) initWithConnection:v32];
LABEL_24:

        goto LABEL_25;
      }
    }
    BOOL v28 = [(WFBackgroundShortcutRunner *)self currentRunRequest];
    int v20 = [v28 handlesDialogRequests];

    if (v19)
    {
LABEL_17:
      id v15 = +[WFUIPresenter defaultPresenter];
      [(WFUIPresenter *)v15 setDelegate:self];
      if ((v20 & 1) == 0)
      {
        id v12 = 0;
LABEL_25:

        goto LABEL_26;
      }
      goto LABEL_23;
    }
    if (!v20)
    {
      __int16 v49 = [WFUIPresenterXPCConnection alloc];
      v50 = [(WFBackgroundShortcutRunner *)self currentRunRequest];
      uint64_t v51 = [v50 remoteDialogPresenterEndpoint];
      __int16 v32 = [(WFUIPresenterXPCConnection *)v49 initWithEndpoint:v51];

      id v15 = [[WFUIPresenter alloc] initWithConnection:v32];
      id v12 = 0;
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  id v5 = [(WFBackgroundShortcutRunner *)self currentTestCase];
  id v6 = [v5 siriInteractions];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    uint64_t v21 = [WFUIPresenterLocalConnection alloc];
    id v22 = [(WFBackgroundShortcutRunner *)self currentTestCase];
    id v23 = [(WFBackgroundShortcutRunner *)self createTestUIPresenterInterfaceForTestCase:v22];
    id v24 = [(WFUIPresenterLocalConnection *)v21 initWithPresenter:v23];

    id v15 = [[WFUIPresenter alloc] initWithConnection:v24];
    goto LABEL_20;
  }
  id v8 = objc_alloc(MEMORY[0x1E4FB4940]);
  char v9 = [(WFBackgroundShortcutRunner *)self currentTestCase];
  id v10 = [(WFBackgroundShortcutRunner *)self createTestSiriUIPresenterInterfaceForTestCase:v9];
  id v11 = (void *)[v8 initWithPresenter:v10];

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4FB4708]) initWithConnection:v11];
  id v13 = [(WFBackgroundShortcutRunner *)self workflowController];
  __int16 v14 = [v13 runningContext];
  [v14 setShouldForwardSiriActionRequests:1];

LABEL_5:
  id v15 = 0;
LABEL_26:
  id v33 = [WFDialogTransformer alloc];
  uint64_t v34 = [(WFBackgroundShortcutRunner *)self workflowController];
  long long v35 = [v34 workflow];
  long long v36 = [(WFBackgroundShortcutRunner *)self workflowController];
  id v37 = [v36 runSource];
  uint64_t v38 = [(WFBackgroundShortcutRunner *)self workflowController];
  id v39 = [v38 runningContext];
  id v40 = [(WFDialogTransformer *)v33 initWithWorkflow:v35 userInterfacePresenter:v15 runSource:v37 runningContext:v39];
  id v41 = self->_dialogTransformer;
  self->_dialogTransformer = v40;

  __int16 v42 = [(WFBackgroundShortcutRunner *)self workflowController];
  [(WFDialogTransformer *)self->_dialogTransformer setDelegate:v42];

  [(WFDialogTransformer *)self->_dialogTransformer setExternalUIPresenter:v12];
  __int16 v43 = [(WFBackgroundShortcutRunner *)self workflowController];
  uint64_t v44 = [v43 runViewSource];
  [(WFDialogTransformer *)self->_dialogTransformer setRunViewSource:v44];

  __int16 v45 = [(WFBackgroundShortcutRunner *)self currentRunRequest];
  -[WFDialogTransformer setAllowsHandoff:](self->_dialogTransformer, "setAllowsHandoff:", [v45 allowsHandoff]);

  uint64_t v46 = [(WFBackgroundShortcutRunner *)self currentRunRequest];
  -[WFDialogTransformer setPresentationMode:](self->_dialogTransformer, "setPresentationMode:", [v46 presentationMode]);

  uint64_t v47 = [(WFBackgroundShortcutRunner *)self siriOptions];
  if (v47) {
    [(WFDialogTransformer *)self->_dialogTransformer setSiriOptions:v47];
  }

  dialogTransformer = self->_dialogTransformer;
LABEL_29:
  return dialogTransformer;
}

- (void)applicationWillLaunchInForeground
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  id v5 = [v4 currentAction];
  id v6 = [(WFBackgroundShortcutRunner *)self workflowController];
  uint64_t v7 = [v6 workflow];
  id v8 = [v7 actions];
  char v9 = [v8 lastObject];
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "isEqual:", v9));
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  id v10 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  id v11 = [v10 userInterfacePresenter];
  id v12 = [(WFBackgroundShortcutRunner *)self currentRunningContext];
  [v11 applicationWillLaunchInForegroundForRunningContext:v12 isLastAction:v13];
}

- (BOOL)progressIsPersistentInSystemAperture
{
  uint64_t v3 = [MEMORY[0x1E4FB46B8] currentDevice];
  int v4 = [v3 hasSystemAperture];

  if (!v4
    || self->_runningProgressSuppressionStateMachine
    && [(WFBackgroundShortcutRunner *)self runningProgressSuppressionMachineResolvedAndDeniedProgress]|| ![(WFBackgroundShortcutRunner *)self shortcutShouldShowRunningProgress])
  {
    return 0;
  }
  id v5 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  id v6 = [v5 userInterfacePresenter];
  BOOL v7 = v6 != 0;

  return v7;
}

- (BOOL)shortcutShouldShowRunningProgress
{
  if ([(WFBackgroundShortcutRunner *)self environment] == 4) {
    return 0;
  }
  uint64_t v3 = [(WFBackgroundShortcutRunner *)self currentRunRequest];

  if (!v3) {
    return 0;
  }
  int v4 = [(WFBackgroundShortcutRunner *)self currentRunRequest];
  uint64_t v5 = [v4 presentationMode];

  id v6 = [MEMORY[0x1E4FB46B8] currentDevice];
  int v7 = [v6 hasSystemAperture];

  if (v7)
  {
    id v8 = [(WFBackgroundShortcutRunner *)self currentRunningContext];
    if ([(WFBackgroundShortcutRunner *)self runRequestOriginatedFromLocalSiri])
    {
      BOOL v9 = 1;
LABEL_22:

      return v9;
    }
    id v11 = [v8 automationType];

    if (v11)
    {
      BOOL v9 = 0;
      goto LABEL_22;
    }
    id v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FB4F28], *MEMORY[0x1E4FB4F88], *MEMORY[0x1E4FB4F80], 0);
    id v13 = [v8 runSource];
    if ([v13 length])
    {
      __int16 v14 = [v8 runSource];
      int v15 = [v12 containsObject:v14];

      if (v15)
      {
        BOOL v9 = v5 == 1;
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
    }
    BOOL v9 = v5 != 3 && v5 != 0;
    goto LABEL_21;
  }
  return v5 == 1;
}

- (BOOL)runRequestOriginatedFromLocalSiri
{
  id v2 = [(WFBackgroundShortcutRunner *)self currentRunRequest];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v3 = [v2 runSource];
    char v4 = [v3 isEqualToString:*MEMORY[0x1E4FB4F68]];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)runRequestIsContextualAction
{
  id v2 = [(WFBackgroundShortcutRunner *)self currentRunRequest];
  if (v2)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)runningProgressSuppressionStateMachine:(id)a3 didDecideRunningProgressIsAllowed:(BOOL)a4 dialogAttribution:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = [(WFBackgroundShortcutRunner *)self queue];
  dispatch_assert_queue_V2(v8);

  runningProgressSuppressionStateMachine = self->_runningProgressSuppressionStateMachine;
  self->_runningProgressSuppressionStateMachine = 0;

  self->_runningProgressSuppressionMachineResolvedAndDeniedProgress = !a4;
  if ([(WFBackgroundShortcutRunner *)self shortcutShouldShowRunningProgress])
  {
    id v10 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
    id v11 = [v10 userInterfacePresenter];

    if (v11)
    {
      id v12 = getWFGeneralLogObject();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (a4)
      {
        if (v13)
        {
          *(_DWORD *)buf = 136315138;
          int v19 = "-[WFBackgroundShortcutRunner runningProgressSuppressionStateMachine:didDecideRunningProgressIsAllowed:di"
                "alogAttribution:]";
          _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_DEFAULT, "%s Beginning persistent mode", buf, 0xCu);
        }

        dispatch_group_enter((dispatch_group_t)self->_exitTaskGroup);
        __int16 v14 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
        int v15 = [v14 userInterfacePresenter];
        uint64_t v16 = [(WFBackgroundShortcutRunner *)self currentRunningContext];
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __121__WFBackgroundShortcutRunner_runningProgressSuppressionStateMachine_didDecideRunningProgressIsAllowed_dialogAttribution___block_invoke;
        v17[3] = &unk_1E6557668;
        void v17[4] = self;
        [v15 beginPersistentModeWithRunningContext:v16 attribution:v7 completionHandler:v17];
      }
      else
      {
        if (v13)
        {
          *(_DWORD *)buf = 136315138;
          int v19 = "-[WFBackgroundShortcutRunner runningProgressSuppressionStateMachine:didDecideRunningProgressIsAllowed:di"
                "alogAttribution:]";
          _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_DEFAULT, "%s Would have started persistent mode, but we are asked to suppress running progress dialogs", buf, 0xCu);
        }
      }
    }
  }
}

void __121__WFBackgroundShortcutRunner_runningProgressSuppressionStateMachine_didDecideRunningProgressIsAllowed_dialogAttribution___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    char v4 = getWFGeneralLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      id v6 = "-[WFBackgroundShortcutRunner runningProgressSuppressionStateMachine:didDecideRunningProgressIsAllowed:dialogA"
           "ttribution:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_ERROR, "%s Failed to begin persistent mode: %@", (uint8_t *)&v5, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 144));
}

- (void)runnerStateMachineDidRequestProcessExit:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char v4 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[WFBackgroundShortcutRunner runnerStateMachineDidRequestProcessExit:]";
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEBUG, "%s Notify the host that runner will exit", (uint8_t *)&v5, 0xCu);
  }

  [(WFBackgroundShortcutRunner *)self synchronouslyPerformWithHost:&__block_literal_global_355];
  [(WFBackgroundShortcutRunner *)self unaliveProcess];
}

uint64_t __70__WFBackgroundShortcutRunner_runnerStateMachineDidRequestProcessExit___block_invoke(uint64_t a1, void *a2)
{
  return [a2 runnerWillExit];
}

- (void)runnerStateMachine:(id)a3 didFinishRunningShortcutWithResult:(id)a4
{
  id v5 = a4;
  id v6 = [(WFBackgroundShortcutRunner *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __84__WFBackgroundShortcutRunner_runnerStateMachine_didFinishRunningShortcutWithResult___block_invoke;
  v8[3] = &unk_1E6558938;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __84__WFBackgroundShortcutRunner_runnerStateMachine_didFinishRunningShortcutWithResult___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) finishRunningWithResult:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 exitWithReason:@"shortcut finished running"];
}

- (void)runnerStateMachine:(id)a3 didRequestStoppingShortcutWithError:(id)a4
{
  id v12 = a4;
  uint64_t v5 = [(WFBackgroundShortcutRunner *)self workflowController];
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = (void *)v5;
  id v7 = [(WFBackgroundShortcutRunner *)self workflowController];
  id v8 = [v7 workflow];

  if (v8)
  {
    id v9 = [(WFBackgroundShortcutRunner *)self workflowController];
    [v9 stopWithError:v12];
  }
  else
  {
LABEL_4:
    id v10 = [(WFBackgroundShortcutRunner *)self completionBlock];

    if (v10)
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB4A80]) initWithError:v12];
      id v11 = [(WFBackgroundShortcutRunner *)self stateMachine];
      [v11 finishRunningWithReason:@"runner was asked to stop but there's a completion handler and NO workflow" result:v9];
    }
    else
    {
      id v9 = [(WFBackgroundShortcutRunner *)self stateMachine];
      [v9 exitWithReason:@"-stop was called and there is no running shortcut, proceeding directly to stop"];
    }
  }
}

- (void)finishRunningWithResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFBackgroundShortcutRunner *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(WFBackgroundShortcutRunner *)self runEvent];

  if (v6)
  {
    id v7 = [v4 error];
    if (v7) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }

    id v9 = +[WFDatabaseProxy defaultDatabase];
    id v10 = [(WFBackgroundShortcutRunner *)self runEvent];
    [v9 setOutcome:v8 forRunEvent:v10];

    [(WFBackgroundShortcutRunner *)self setRunEvent:0];
  }
  id v11 = [(WFBackgroundShortcutRunner *)self currentRunningContext];
  if (([v4 isCancelled] & 1) == 0)
  {
    id v12 = [v4 error];
    if (v12 && [v11 allowsDialogNotifications])
    {
      BOOL v13 = [v4 error];
      char v14 = objc_msgSend(v13, "wf_isRequiresShortcutsJrError");

      if (v14) {
        goto LABEL_12;
      }
      id v12 = [(WFBackgroundShortcutRunner *)self currentRunningWorkflowReference];
      int v15 = [MEMORY[0x1E4FB4540] standardClient];
      uint64_t v16 = [v4 error];
      long long v17 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
      long long v18 = [v17 attribution];
      [v15 postNotificationAboutFailure:v16 inWorkflow:v12 dialogAttribution:v18 runningContext:v11];
    }
  }
LABEL_12:
  int v19 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  uint64_t v20 = [v19 userInterfacePresenter];

  if (v20)
  {
    if ([(WFBackgroundShortcutRunner *)self shortcutShouldShowRunningProgress]
      && ![(WFBackgroundShortcutRunner *)self runningProgressSuppressionMachineResolvedAndDeniedProgress])
    {
      dispatch_group_enter((dispatch_group_t)self->_exitTaskGroup);
      uint64_t v21 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
      id v22 = [v21 userInterfacePresenter];
      id v23 = NSNumber;
      id v24 = [v4 error];
      if (v24) {
        uint64_t v25 = 0;
      }
      else {
        uint64_t v25 = [v4 isCancelled] ^ 1;
      }
      uint64_t v26 = [v23 numberWithInt:v25];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __54__WFBackgroundShortcutRunner_finishRunningWithResult___block_invoke;
      v29[3] = &unk_1E6557668;
      v29[4] = self;
      [v22 completePersistentModeWithSuccess:v26 runningContext:v11 completionHandler:v29];
    }
    else
    {
      dispatch_group_enter((dispatch_group_t)self->_exitTaskGroup);
      uint64_t v21 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
      id v22 = [v21 userInterfacePresenter];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __54__WFBackgroundShortcutRunner_finishRunningWithResult___block_invoke_2;
      v28[3] = &unk_1E6557668;
      void v28[4] = self;
      [v22 dismissPresentedContentForRunningContext:v11 completionHandler:v28];
    }
  }
  [(WFBackgroundShortcutRunner *)self callWorkflowRunningCompletionBlockWithResult:v4];
  id v27 = [(WFBackgroundShortcutRunner *)self workflowController];
  [v27 reset];

  [(WFBackgroundShortcutRunner *)self setTransaction:0];
  [(WFBackgroundShortcutRunner *)self setCurrentRunRequest:0];
  [(WFBackgroundShortcutRunner *)self setCurrentRunningWorkflowReference:0];
  [(WFBackgroundShortcutRunner *)self setCurrentRunningContext:0];
}

void __54__WFBackgroundShortcutRunner_finishRunningWithResult___block_invoke(uint64_t a1)
{
}

void __54__WFBackgroundShortcutRunner_finishRunningWithResult___block_invoke_2(uint64_t a1)
{
}

- (void)callWorkflowRunningCompletionBlockWithResult:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(WFBackgroundShortcutRunner *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(WFBackgroundShortcutRunner *)self completionBlock];

  id v7 = getWFXPCRunnerLogObject();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v11 = 136315138;
      id v12 = "-[WFBackgroundShortcutRunner callWorkflowRunningCompletionBlockWithResult:]";
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Workflow Did Finish: Calling Completion Block", (uint8_t *)&v11, 0xCu);
    }

    id v9 = [(WFBackgroundShortcutRunner *)self completionBlock];
    ((void (**)(void, id, void))v9)[2](v9, v4, 0);

    id completionBlock = self->_completionBlock;
    self->_id completionBlock = 0;

    id v7 = getWFGeneralLogObject();
    if (os_signpost_enabled(v7))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v7, OS_SIGNPOST_INTERVAL_END, 0xFFFFFFFEuLL, "BackgroundRunnerExecute", "", (uint8_t *)&v11, 2u);
    }
  }
  else if (v8)
  {
    int v11 = 136315138;
    id v12 = "-[WFBackgroundShortcutRunner callWorkflowRunningCompletionBlockWithResult:]";
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Workflow Did Finish: No Completion Block", (uint8_t *)&v11, 0xCu);
  }
}

- (void)unaliveProcess
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = "-[WFBackgroundShortcutRunner unaliveProcess]";
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEBUG, "%s Waiting for exit tasks before exiting.", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__WFBackgroundShortcutRunner_unaliveProcess__block_invoke;
  aBlock[3] = &unk_1E6558B28;
  void aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  exitTaskGroup = self->_exitTaskGroup;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__WFBackgroundShortcutRunner_unaliveProcess__block_invoke_340;
  block[3] = &unk_1E6558678;
  id v6 = v4;
  id v13 = v6;
  id v7 = MEMORY[0x1E4F14428];
  dispatch_group_notify(exitTaskGroup, MEMORY[0x1E4F14428], block);
  dispatch_time_t v8 = dispatch_time(0, 20000000000);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__WFBackgroundShortcutRunner_unaliveProcess__block_invoke_341;
  v10[3] = &unk_1E6558678;
  id v11 = v6;
  id v9 = v6;
  dispatch_after(v8, v7, v10);
}

void __44__WFBackgroundShortcutRunner_unaliveProcess__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) promoteSharedTemporaryDirectoryLock])
  {
    id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v3 = WFBackgroundShortcutRunnerLockFileURL();
    id v11 = 0;
    char v4 = [v2 removeItemAtURL:v3 error:&v11];
    id v5 = v11;

    if ((v4 & 1) == 0)
    {
      id v6 = getWFXPCRunnerLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v13 = "-[WFBackgroundShortcutRunner unaliveProcess]_block_invoke";
        __int16 v14 = 2112;
        id v15 = v5;
        _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s Failed to delete the BackgroundShortcutRunner lock file: %@", buf, 0x16u);
      }
    }
  }
  [MEMORY[0x1E4F72BB0] invalidateAllConnections];
  close([*(id *)(a1 + 32) lockFileFD]);
  id v7 = [*(id *)(a1 + 32) xpcConnection];
  [v7 invalidate];

  dispatch_time_t v8 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v13 = "-[WFBackgroundShortcutRunner unaliveProcess]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_INFO, "%s Dropping sandbox extensions to the data vault", buf, 0xCu);
  }

  id v9 = [*(id *)(a1 + 32) dataVaultFileURLs];
  [v9 enumerateObjectsUsingBlock:&__block_literal_global_338];

  id v10 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v13 = "-[WFBackgroundShortcutRunner unaliveProcess]_block_invoke_2";
    _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%s Exiting process", buf, 0xCu);
  }

  exit(0);
}

uint64_t __44__WFBackgroundShortcutRunner_unaliveProcess__block_invoke_340(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    id v5 = "-[WFBackgroundShortcutRunner unaliveProcess]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_DEBUG, "%s Finished exit tasks. Preparing to exit.", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __44__WFBackgroundShortcutRunner_unaliveProcess__block_invoke_341(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315138;
    id v5 = "-[WFBackgroundShortcutRunner unaliveProcess]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_FAULT, "%s Forcing BGSR exit with dirty tasks. This is a programmer error. Exiting anyways.", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __44__WFBackgroundShortcutRunner_unaliveProcess__block_invoke_336(uint64_t a1, void *a2)
{
  id v2 = [a2 url];
  [v2 stopAccessingSecurityScopedResource];
}

- (void)stopWithError:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(WFBackgroundShortcutRunner *)self workflowController];
    id v7 = [v6 workflow];
    int v9 = 136315394;
    id v10 = "-[WFBackgroundShortcutRunner stopWithError:]";
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Requested stopping workflow run: %@", (uint8_t *)&v9, 0x16u);
  }
  dispatch_time_t v8 = [(WFBackgroundShortcutRunner *)self stateMachine];
  [v8 stopShortcutWithError:v4 reason:@"-stop was called"];
}

- (void)resumeRunningFromContext:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v11;

  self->_environment = 0;
  objc_storeStrong((id *)&self->_currentRunRequest, a4);
  uint64_t v13 = _Block_copy(v10);

  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v13;

  id v15 = [(WFBackgroundShortcutRunner *)self stateMachine];
  uint64_t v16 = [NSString stringWithFormat:@"incoming resume request (%@) with context: %@", v9, v8];
  [v15 handlingRequestStateWithReason:v16];

  uint64_t v17 = WFWFWorkflowControllerStateDefaultSerializedURLFromContext(v8);
  if (v17)
  {
    long long v18 = [v9 runSource];
    int v19 = [v18 isEqualToString:*MEMORY[0x1E4FB4F38]];

    if (v19) {
      [(WFBackgroundShortcutRunner *)self setIsPersonalAutomation:1];
    }
    uint64_t v20 = [v9 extensionResourceClasses];
    uint64_t v21 = v20;
    if (v20)
    {
      id v22 = v20;
    }
    else
    {
      id v22 = [MEMORY[0x1E4F1CAD0] set];
    }
    BOOL v28 = v22;

    id v29 = (void *)[objc_alloc(MEMORY[0x1E4FB4898]) initWithAccessResourceClassNames:v28];
    __int16 v32 = [MEMORY[0x1E4FB4890] sharedManager];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __78__WFBackgroundShortcutRunner_resumeRunningFromContext_withRequest_completion___block_invoke;
    v33[3] = &unk_1E654DF88;
    id v34 = v17;
    long long v35 = self;
    id v36 = v8;
    id v37 = v9;
    [v32 performWithSandboxExtensions:v29 asynchronousBlock:v33];

    __int16 v30 = v34;
  }
  else
  {
    id v23 = getWFXPCRunnerLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v41 = "-[WFBackgroundShortcutRunner resumeRunningFromContext:withRequest:completion:]";
      __int16 v42 = 2112;
      id v43 = v8;
      _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_FAULT, "%s Unable to get state URL from context: %@", buf, 0x16u);
    }

    id v24 = (void *)MEMORY[0x1E4F28C58];
    v38[0] = *MEMORY[0x1E4F28568];
    uint64_t v25 = WFLocalizedString(@"Unable to run");
    v39[0] = v25;
    v38[1] = *MEMORY[0x1E4F28588];
    uint64_t v26 = WFLocalizedString(@"An error occurred while resuming your shortcut.");
    v39[1] = v26;
    id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
    BOOL v28 = [v24 errorWithDomain:@"WFBackgroundShortcutRunnerErrorDomain" code:11 userInfo:v27];

    id v29 = (void *)[objc_alloc(MEMORY[0x1E4FB4A80]) initWithError:v28];
    __int16 v30 = [(WFBackgroundShortcutRunner *)self stateMachine];
    id v31 = [NSString stringWithFormat:@"unable to get state URL from context: %@", v8];
    [v30 finishRunningWithReason:v31 result:v29];
  }
}

void __78__WFBackgroundShortcutRunner_resumeRunningFromContext_withRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = getWFSecurityLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      long long v18 = "-[WFBackgroundShortcutRunner resumeRunningFromContext:withRequest:completion:]_block_invoke";
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Error temporarily taking all sandbox extensions at workflow run resume: %@", buf, 0x16u);
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __78__WFBackgroundShortcutRunner_resumeRunningFromContext_withRequest_completion___block_invoke_322;
  v12[3] = &unk_1E654DF60;
  int8x16_t v11 = *(int8x16_t *)(a1 + 32);
  id v9 = (id)v11.i64[0];
  int8x16_t v13 = vextq_s8(v11, v11, 8uLL);
  id v16 = v7;
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  id v10 = v7;
  +[WFWorkflowControllerState getStateFromURL:v9 completionHandler:v12];
}

void __78__WFBackgroundShortcutRunner_resumeRunningFromContext_withRequest_completion___block_invoke_322(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 workflow];
  if (!v7)
  {
    id v9 = 0;
    goto LABEL_11;
  }
  id v8 = +[WFDatabaseProxy defaultDatabase];
  id v9 = [v8 workflowRecordForDescriptor:v7 error:0];

  if (!v9)
  {
LABEL_11:
    int8x16_t v11 = 0;
    goto LABEL_12;
  }
  id v10 = -[WFWorkflow initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:]([WFWorkflow alloc], "initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:", v9, v7, 0, 1, [*(id *)(a1 + 32) environment], 0);
  int8x16_t v11 = v10;
  if (v5 && v10)
  {
    id v12 = objc_alloc_init(WFWorkflowController);
    [(WFWorkflowController *)v12 setWorkflow:v11];
    [(WFWorkflowController *)v12 setCurrentState:v5];
    [(WFWorkflowController *)v12 setDelegate:*(void *)(a1 + 32)];
    int8x16_t v13 = [v5 currentRunSource];
    [(WFWorkflowController *)v12 setRunSource:v13];

    -[WFWorkflowController setShouldDisablePrivacyPrompts:](v12, "setShouldDisablePrivacyPrompts:", [v5 shouldDisablePrivacyPrompts]);
    [(WFWorkflowController *)v12 setRunningContext:*(void *)(a1 + 48)];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), *(id *)(a1 + 48));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 160), v12);
    id v14 = [*(id *)(a1 + 32) stateMachine];
    uint64_t v15 = [*(id *)(a1 + 32) environment];
    uint64_t v16 = [NSString stringWithFormat:@"resuming shortcut run for context: %@, request: %@", *(void *)(a1 + 48), *(void *)(a1 + 56)];
    [v14 startRunningShortcutWithEnvironment:v15 reference:v7 isPersonalAutomation:0 reason:v16];

    [(WFWorkflowController *)v12 run];
    uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v18 = *(void *)(a1 + 40);
    id v31 = v6;
    LOBYTE(v16) = [v17 removeItemAtURL:v18 error:&v31];
    id v19 = v31;

    if ((v16 & 1) == 0)
    {
      id v20 = getWFXPCRunnerLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        long long v35 = "-[WFBackgroundShortcutRunner resumeRunningFromContext:withRequest:completion:]_block_invoke";
        __int16 v36 = 2112;
        uint64_t v37 = v21;
        __int16 v38 = 2112;
        id v39 = v19;
        _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_ERROR, "%s Unable to remove serialized state file at URL (%@): %@", buf, 0x20u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v6 = v19;
    goto LABEL_15;
  }
LABEL_12:
  id v22 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    uint64_t v23 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    long long v35 = "-[WFBackgroundShortcutRunner resumeRunningFromContext:withRequest:completion:]_block_invoke";
    __int16 v36 = 2112;
    uint64_t v37 = v23;
    __int16 v38 = 2112;
    id v39 = v6;
    _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_FAULT, "%s Unable to get deserialized state from (%@): %@", buf, 0x20u);
  }

  id v24 = (void *)MEMORY[0x1E4F28C58];
  v32[0] = *MEMORY[0x1E4F28568];
  uint64_t v25 = WFLocalizedString(@"Unable to run");
  v33[0] = v25;
  v32[1] = *MEMORY[0x1E4F28588];
  uint64_t v26 = WFLocalizedString(@"An error occurred while resuming your shortcut.");
  v33[1] = v26;
  id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
  id v12 = [v24 errorWithDomain:@"WFBackgroundShortcutRunnerErrorDomain" code:11 userInfo:v27];

  BOOL v28 = (void *)[objc_alloc(MEMORY[0x1E4FB4A80]) initWithError:v12];
  id v29 = [*(id *)(a1 + 32) stateMachine];
  __int16 v30 = [NSString stringWithFormat:@"unable to deserialize workflow controller state: URL: %@, error: %@", *(void *)(a1 + 40), v12];
  [v29 finishRunningWithReason:v30 result:v28];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_15:
}

- (void)runActionFromRunRequestData:(id)a3 runningContext:(id)a4 completion:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  int8x16_t v11 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v11;

  self->_environment = 4;
  int8x16_t v13 = _Block_copy(v9);

  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v13;

  uint64_t v15 = [(WFBackgroundShortcutRunner *)self stateMachine];
  [v15 handlingRequestStateWithReason:@"incoming remote execution request"];

  id v38 = 0;
  uint64_t v16 = [[WFRemoteExecutionRunRequest alloc] initWithData:v10 error:&v38];

  id v17 = v38;
  if (v16)
  {
    [(WFBackgroundShortcutRunner *)self setCurrentRemoteExecutionRunRequest:v16];
    uint64_t v18 = [(WFBackgroundShortcutRunner *)self stateMachine];
    int v19 = [v18 isRunningShortcut];

    if (v19)
    {
      id v20 = getWFXPCRunnerLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v40 = "-[WFBackgroundShortcutRunner runActionFromRunRequestData:runningContext:completion:]";
        _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_ERROR, "%s BackgroundShortcutRunner asked to run two workflows in parallel which is not supported.", buf, 0xCu);
      }

      uint64_t v21 = WFBackgroundShortcutRunnerError(3, 0);
      id v22 = [(WFBackgroundShortcutRunner *)self currentRemoteExecutionRunRequest];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke;
      v35[3] = &unk_1E6558938;
      id v36 = v21;
      uint64_t v37 = self;
      uint64_t v23 = v21;
      [(WFBackgroundShortcutRunner *)self sendResponseForRunRequest:v22 controller:0 error:v23 completion:v35];
    }
    else
    {
      id v29 = [MEMORY[0x1E4FB4890] sharedManager];
      __int16 v30 = [MEMORY[0x1E4FB4898] all];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_2;
      v31[3] = &unk_1E654DF38;
      __int16 v32 = v16;
      id v33 = self;
      id v34 = v8;
      [v29 performWithSandboxExtensions:v30 asynchronousBlock:v31];

      uint64_t v23 = v32;
    }
  }
  else
  {
    id v24 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v40 = "-[WFBackgroundShortcutRunner runActionFromRunRequestData:runningContext:completion:]";
      __int16 v41 = 2114;
      id v42 = v17;
      _os_log_impl(&dword_1C7F0A000, v24, OS_LOG_TYPE_FAULT, "%s failed to read run request from data, error: %{public}@", buf, 0x16u);
    }

    id v25 = objc_alloc(MEMORY[0x1E4FB4A80]);
    uint64_t v26 = WFBackgroundShortcutRunnerError(1, v17);
    uint64_t v23 = (WFRemoteExecutionRunRequest *)[v25 initWithError:v26];

    id v27 = [(WFBackgroundShortcutRunner *)self stateMachine];
    BOOL v28 = [NSString stringWithFormat:@"failed to parse remote execution run request from data, error: %@", v17];
    [v27 finishRunningWithReason:v28 result:v23];
  }
}

void __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke(uint64_t a1)
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4FB4A80]) initWithError:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) stateMachine];
  [v2 finishRunningWithReason:@"incoming remote execution request landed in existing runner, which is not supported", v3 result];
}

void __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = getWFSecurityLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "-[WFBackgroundShortcutRunner runActionFromRunRequestData:runningContext:completion:]_block_invoke_2";
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Error temporarily taking all sandbox extensions at workflow run start: %@", buf, 0x16u);
    }
  }
  id v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) fileCoordinator];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_284;
  v14[3] = &unk_1E654DF10;
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = *(void **)(a1 + 48);
  id v16 = v7;
  void v14[4] = v11;
  id v15 = v12;
  id v13 = v7;
  [v9 inflateWithFileCoordinator:v10 completion:v14];
}

void __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_284(id *a1, void *a2, void *a3)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_2_285;
  aBlock[3] = &unk_1E6558678;
  id v60 = a1[6];
  id v7 = (void (**)(void))_Block_copy(aBlock);
  if (v6)
  {
    id v8 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      id v9 = [v5 identifier];
      *(_DWORD *)buf = 136315650;
      id v62 = "-[WFBackgroundShortcutRunner runActionFromRunRequestData:runningContext:completion:]_block_invoke";
      __int16 v63 = 2114;
      v64 = v9;
      __int16 v65 = 2114;
      id v66 = v6;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s <%{public}@> an error occurred while inflating request: %{public}@", buf, 0x20u);
    }
    id v10 = WFBackgroundShortcutRunnerError(5, v6);
    id v11 = a1[4];
    id v12 = [v11 currentRemoteExecutionRunRequest];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_286;
    v55[3] = &unk_1E65556E0;
    id v13 = v10;
    id v14 = a1[4];
    id v56 = v13;
    id v57 = v14;
    id v58 = v6;
    [v11 sendResponseForRunRequest:v12 controller:0 error:v13 completion:v55];

    id v15 = v56;
  }
  else
  {
    id v16 = +[WFActionRegistry sharedRegistry];
    id v17 = [v5 actionIdentifier];
    uint64_t v18 = [v5 serializedParameters];
    id v13 = [v16 createActionWithIdentifier:v17 serializedParameters:v18];

    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v15 = [v5 workflowID];
      id v42 = +[WFDatabaseProxy defaultDatabase];
      v50 = [v42 referenceForWorkflowID:v15];
      __int16 v49 = objc_alloc_init(WFWorkflowRecord);
      uint64_t v26 = [v50 name];
      [(WFWorkflowRecord *)v49 setName:v26];

      uint64_t v51 = [(WFWorkflow *)[WFRemoteExecutionRunRequestWorkflow alloc] initWithRecord:v49 reference:v50 storageProvider:0 error:0];
      id v27 = [v5 workflowID];
      [(WFRemoteExecutionRunRequestWorkflow *)v51 setWorkflowID:v27];

      [(WFWorkflow *)v51 addAction:v13];
      [v13 willBeAddedToWorkflow:v51];
      [v13 wasAddedToWorkflow:v51];
      id v28 = objc_alloc(MEMORY[0x1E4FB4A98]);
      id v29 = [(WFRemoteExecutionRunRequestWorkflow *)v51 workflowID];
      uint64_t v48 = (void *)[v28 initWithWorkflowIdentifier:v29];

      [v48 setRunKind:*MEMORY[0x1E4FB4EE0]];
      uint64_t v43 = [WFWorkflowControllerState alloc];
      uint64_t v47 = [v5 variables];
      uint64_t v46 = [v5 input];
      __int16 v45 = [v5 processedParameters];
      __int16 v30 = [MEMORY[0x1E4F1C9C8] date];
      id v31 = [v13 contentAttributionTracker];
      id v32 = v13;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v33 = v32;
      }
      else {
        id v33 = 0;
      }
      id v34 = v33;

      long long v35 = [v34 controlFlowTracker];
      LOBYTE(v41) = 0;
      uint64_t v44 = -[WFWorkflowControllerState initWithWorkflow:variables:currentActionIndex:runningContext:currentInput:currentProcessedParameters:startDate:currentRunSource:numberOfDialogsPresented:outputBehavior:contentAttributionTracker:contentItemCache:flowTracker:allowedOnceSmartPromptStates:extensionResourceClasses:shouldDisablePrivacyPrompts:](v43, "initWithWorkflow:variables:currentActionIndex:runningContext:currentInput:currentProcessedParameters:startDate:currentRunSource:numberOfDialogsPresented:outputBehavior:contentAttributionTracker:contentItemCache:flowTracker:allowedOnceSmartPromptStates:extensionResourceClasses:shouldDisablePrivacyPrompts:", 0, v47, 0, v48, v46, v45, v30, 0, 0, 2, v31, 0, v35, 0, 0,
              v41);

      id v36 = objc_alloc_init(WFWorkflowController);
      [(WFWorkflowController *)v36 setWorkflow:v51];
      [(WFWorkflowController *)v36 setCurrentState:v44];
      [(WFWorkflowController *)v36 setDelegate:a1[4]];
      id v37 = a1[4];
      uint64_t v38 = [v37 environment];
      id v39 = [v37 metricsRunSourceFromEnvironment:v38 runSource:*MEMORY[0x1E4FB4F40]];
      [(WFWorkflowController *)v36 setRunSource:v39];

      [(WFWorkflowController *)v36 setRunningContext:a1[5]];
      objc_storeStrong((id *)a1[4] + 12, a1[5]);
      objc_storeStrong((id *)a1[4] + 20, v36);
      uint64_t v40 = [a1[4] stateMachine];
      objc_msgSend(v40, "startRunningShortcutWithEnvironment:reference:isPersonalAutomation:reason:", objc_msgSend(a1[4], "environment"), 0, 0, @"running remote execution request");

      [(WFWorkflowController *)v36 run];
      id v25 = v42;
    }
    else
    {
      __int16 v19 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        id v20 = [v5 identifier];
        *(_DWORD *)buf = 136315650;
        id v62 = "-[WFBackgroundShortcutRunner runActionFromRunRequestData:runningContext:completion:]_block_invoke_2";
        __int16 v63 = 2114;
        v64 = v20;
        __int16 v65 = 2114;
        id v66 = v13;
        _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_FAULT, "%s <%{public}@> stopping execution because of invalid action: %{public}@", buf, 0x20u);
      }
      uint64_t v21 = WFBackgroundShortcutRunnerError(4, 0);
      id v22 = a1[4];
      uint64_t v23 = [v22 currentRemoteExecutionRunRequest];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_292;
      v52[3] = &unk_1E6558938;
      id v15 = v21;
      id v24 = a1[4];
      id v53 = v15;
      id v54 = v24;
      [v22 sendResponseForRunRequest:v23 controller:0 error:v15 completion:v52];

      id v25 = v53;
    }
  }
  v7[2](v7);
}

uint64_t __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_2_285(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_286(uint64_t a1)
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4FB4A80]) initWithError:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) stateMachine];
  id v3 = [NSString stringWithFormat:@"an error occurred while inflating request: %@", *(void *)(a1 + 48)];
  [v2 finishRunningWithReason:v3 result:v4];
}

void __84__WFBackgroundShortcutRunner_runActionFromRunRequestData_runningContext_completion___block_invoke_292(uint64_t a1)
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4FB4A80]) initWithError:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) stateMachine];
  [v2 finishRunningWithReason:@"couldn't make the action in the remote execution request" result:v3];
}

- (void)stepWithAction:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 isMissing])
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"WFBackgroundShortcutRunner.m" lineNumber:457 description:@"Tried to step with an invalid action"];
  }
  id v6 = [(WFBackgroundShortcutRunner *)self workflowController];
  id v7 = [v6 workflow];

  id v8 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    id v12 = "-[WFBackgroundShortcutRunner stepWithAction:]";
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s Adding action: %@ to workflow: %@", (uint8_t *)&v11, 0x20u);
  }

  [v7 addAction:v5];
  id v9 = [(WFBackgroundShortcutRunner *)self workflowController];
  [v9 step];
}

- (void)runWorkflowWithDescriptor:(id)a3 request:(id)a4 inEnvironment:(id)a5 runningContext:(id)a6 completion:(id)a7
{
  v88[1] = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if ([v12 isStepwise])
  {
    id v16 = [(WFBackgroundShortcutRunner *)self accessSpecifier];
    char v17 = [v16 allowStepwiseExecution];

    if ((v17 & 1) == 0)
    {
      id v36 = objc_alloc(MEMORY[0x1E4FB4A80]);
      id v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v87 = *MEMORY[0x1E4F28568];
      v88[0] = @"You're trying to run a shortcut stepwise, but you don't have the entitlement for it.";
      uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:&v87 count:1];
      id v39 = [v37 errorWithDomain:*MEMORY[0x1E4F28798] code:1 userInfo:v38];
      uint64_t v40 = WFBackgroundShortcutRunnerError(0, v39);
      id v27 = (void *)[v36 initWithError:v40];

      id v28 = getWFGeneralLogObject();
      if (os_signpost_enabled(v28))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v28, OS_SIGNPOST_INTERVAL_END, 0xFFFFFFFEuLL, "BackgroundRunnerExecute", "", (uint8_t *)&buf, 2u);
      }
      goto LABEL_23;
    }
  }
  uint64_t v18 = os_log_create("com.apple.shortcuts", "SystemSignpostIntervals");
  __int16 v19 = [v14 identifier];
  os_signpost_id_t v20 = [v19 hash];

  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v18, OS_SIGNPOST_INTERVAL_END, v20, "RunnerRunRequest", "", (uint8_t *)&buf, 2u);
  }

  uint64_t v21 = getWFGeneralLogObject();
  if (os_signpost_enabled(v21))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xFFFFFFFEuLL, "BackgroundRunnerExecute", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  id v22 = [(WFBackgroundShortcutRunner *)self stateMachine];
  int v23 = [v22 isRunningShortcut];

  if (!v23)
  {
    if (+[WFAssessmentModeManager isAssessmentModeSupportedOnCurrentDevice])
    {
      id v29 = [(WFBackgroundShortcutRunner *)self assessmentModeManager];
      int v30 = [v29 isInAssessmentMode];

      id v31 = getWFXPCRunnerLogObject();
      BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
      if (v30)
      {
        if (v32)
        {
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:r"
                                          "unningContext:completion:]";
          _os_log_impl(&dword_1C7F0A000, v31, OS_LOG_TYPE_DEFAULT, "%s Device is in assessmentMode cancelling shortcut execution.", (uint8_t *)&buf, 0xCu);
        }

        id v33 = objc_alloc(MEMORY[0x1E4FB4A80]);
        id v34 = [(WFBackgroundShortcutRunner *)self assessmentModeActiveError];
        long long v35 = WFBackgroundShortcutRunnerError(16, v34);
        id v27 = (void *)[v33 initWithError:v35];

        id v28 = getWFGeneralLogObject();
        if (os_signpost_enabled(v28))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v28, OS_SIGNPOST_INTERVAL_END, 0xFFFFFFFEuLL, "BackgroundRunnerExecute", "", (uint8_t *)&buf, 2u);
        }
        goto LABEL_23;
      }
      if (v32)
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:run"
                                        "ningContext:completion:]";
        _os_log_impl(&dword_1C7F0A000, v31, OS_LOG_TYPE_DEFAULT, "%s Device is NOT in assessmentMode observing for changes.", (uint8_t *)&buf, 0xCu);
      }

      id v42 = [(WFBackgroundShortcutRunner *)self assessmentModeManager];
      [v42 startObservingForAssesmentModeChangesIfNeeded];
    }
    uint64_t v43 = [(WFBackgroundShortcutRunner *)self stateMachine];
    uint64_t v44 = [NSString stringWithFormat:@"new run request: %@", v12];
    [v43 handlingRequestStateWithReason:v44];

    __int16 v45 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v45;

    self->_environment = [v13 integerValue];
    objc_storeStrong((id *)&self->_currentRunRequest, a4);
    uint64_t v47 = _Block_copy(v15);
    id completionBlock = self->_completionBlock;
    self->_id completionBlock = v47;

    id v27 = +[WFDatabaseProxy defaultDatabase];
    id v79 = 0;
    __int16 v49 = [v68 workflowReferenceWithDatabase:v27 error:&v79];
    id v50 = v79;
    uint64_t v41 = v50;
    if (!v49 && v50)
    {
      id v51 = objc_alloc(MEMORY[0x1E4FB4A80]);
      id v52 = WFBackgroundShortcutRunnerError(1, 0);
      id v53 = (void *)[v51 initWithError:v52];

      id v54 = [v53 error];
      (*((void (**)(id, void *, void *))v15 + 2))(v15, v53, v54);

LABEL_45:
      goto LABEL_46;
    }
    if ([v49 disabledOnLockScreen]
      && +[WFCompactUnlockService isDeviceLocked])
    {
      long long v55 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v85 = *MEMORY[0x1E4F28568];
      id v56 = WFLocalizedString(@"This shortcut cannot run when the device is locked. You can change this in the Privacy tab of the shortcut settings.");
      v86 = v56;
      id v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
      id v58 = [v55 errorWithDomain:@"WFWorkflowErrorDomain" code:7 userInfo:v57];

      id v59 = objc_alloc(MEMORY[0x1E4FB4A80]);
      id v60 = WFBackgroundShortcutRunnerError(15, v58);
      id v61 = (void *)[v59 initWithError:v60];

      id v62 = [v61 error];
      (*((void (**)(id, void *, void *))v15 + 2))(v15, v61, v62);

      goto LABEL_45;
    }
    objc_storeStrong((id *)&self->_currentRunningWorkflowReference, v49);
    objc_storeStrong((id *)&self->_currentRunningContext, a6);
    self->_isPersonalAutomation = [v49 hiddenFromLibraryAndSync];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v83 = 0x2020000000;
    char v84 = 0;
    if (v49)
    {
      if ([(WFBackgroundShortcutRunner *)self isPersonalAutomation])
      {
        __int16 v63 = getWFSecurityLogObject();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v80 = 136315138;
          v81 = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:]";
          v64 = "%s Disabling privacy prompts because this is a personal automation.";
LABEL_42:
          _os_log_impl(&dword_1C7F0A000, v63, OS_LOG_TYPE_DEFAULT, v64, v80, 0xCu);
        }
      }
      else
      {
        if (self->_environment != 1)
        {
LABEL_44:
          __int16 v65 = [MEMORY[0x1E4FB4890] sharedManager];
          id v66 = [MEMORY[0x1E4FB4898] all];
          v69[0] = MEMORY[0x1E4F143A8];
          v69[1] = 3221225472;
          v69[2] = __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke;
          v69[3] = &unk_1E654DEE8;
          id v70 = v68;
          id v71 = v13;
          id v72 = v27;
          v73 = self;
          SEL v78 = a2;
          id v74 = v12;
          id v75 = v14;
          id v76 = v49;
          p_long long buf = &buf;
          [v65 performWithSandboxExtensions:v66 asynchronousBlock:v69];

          _Block_object_dispose(&buf, 8);
          goto LABEL_45;
        }
        __int16 v63 = getWFSecurityLogObject();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v80 = 136315138;
          v81 = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:]";
          v64 = "%s Disabling privacy prompts because this is a home automation.";
          goto LABEL_42;
        }
      }
    }
    else
    {
      __int16 v63 = getWFSecurityLogObject();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v80 = 136315138;
        v81 = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:]";
        v64 = "%s Disabling privacy prompts because this is an on-the-fly shortcut.";
        goto LABEL_42;
      }
    }

    *(unsigned char *)(*((void *)&buf + 1) + 24) = 1;
    goto LABEL_44;
  }
  id v24 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:running"
                                    "Context:completion:]";
    _os_log_impl(&dword_1C7F0A000, v24, OS_LOG_TYPE_ERROR, "%s BackgroundShortcutRunner asked to run two workflows in parallel which is not supported.", (uint8_t *)&buf, 0xCu);
  }

  id v25 = objc_alloc(MEMORY[0x1E4FB4A80]);
  uint64_t v26 = WFBackgroundShortcutRunnerError(3, 0);
  id v27 = (void *)[v25 initWithError:v26];

  id v28 = getWFGeneralLogObject();
  if (os_signpost_enabled(v28))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v28, OS_SIGNPOST_INTERVAL_END, 0xFFFFFFFEuLL, "BackgroundRunnerExecute", "", (uint8_t *)&buf, 2u);
  }
LABEL_23:

  uint64_t v41 = [v27 error];
  (*((void (**)(id, void *, void *))v15 + 2))(v15, v27, v41);
LABEL_46:
}

void __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = getWFSecurityLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v34 = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:]_block_invoke";
      __int16 v35 = 2112;
      id v36 = v8;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Error temporarily taking all sandbox extensions at workflow run start: %@", buf, 0x16u);
    }
  }
  int v11 = getWFXPCRunnerLogObject();
  os_signpost_id_t v12 = os_signpost_id_generate(v11);

  id v13 = getWFXPCRunnerLogObject();
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "LoadWorkflow", "", buf, 2u);
  }

  id v15 = *(void **)(a1 + 32);
  uint64_t v16 = [*(id *)(a1 + 40) integerValue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_220;
  v23[3] = &unk_1E654DEC0;
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v18 = *(void **)(a1 + 64);
  v23[4] = *(void *)(a1 + 56);
  id v29 = v9;
  uint64_t v19 = *(void *)(a1 + 96);
  os_signpost_id_t v31 = v12;
  uint64_t v32 = v19;
  id v24 = v18;
  id v25 = *(id *)(a1 + 32);
  id v26 = *(id *)(a1 + 72);
  id v20 = *(id *)(a1 + 80);
  uint64_t v21 = *(void *)(a1 + 88);
  id v27 = v20;
  uint64_t v30 = v21;
  id v28 = *(id *)(a1 + 48);
  id v22 = v9;
  [v15 createWorkflowWithEnvironment:v16 database:v17 completionHandler:v23];
}

void __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_220(uint64_t a1, void *a2, void *a3)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = getWFXPCRunnerLogObject();
  id v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 96);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v8, OS_SIGNPOST_INTERVAL_END, v9, "LoadWorkflow", "", buf, 2u);
  }

  if (!v5)
  {
    os_signpost_id_t v12 = getWFXPCRunnerLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v70 = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:]_block_invoke";
      __int16 v71 = 2112;
      id v72 = v6;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_ERROR, "%s Unable to get workflow from descriptor. %@", buf, 0x16u);
    }

    id v13 = objc_alloc(MEMORY[0x1E4FB4A80]);
    id v14 = WFBackgroundShortcutRunnerError(1, v6);
    id v15 = (id)[v13 initWithError:v14];

    uint64_t v16 = [*(id *)(a1 + 32) stateMachine];
    uint64_t v17 = v16;
    uint64_t v18 = @"unable to find requested workflow to run";
    goto LABEL_23;
  }
  uint64_t v10 = [v5 environment];
  if (v10 != [*(id *)(a1 + 32) environment])
  {
    id v57 = [MEMORY[0x1E4F28B00] currentHandler];
    [v57 handleFailureInMethod:*(void *)(a1 + 104) object:*(void *)(a1 + 32) file:@"WFBackgroundShortcutRunner.m" lineNumber:343 description:@"Environment on workflow should be the same as environment of BGSR"];
  }
  int v11 = [v5 actions];
  if ([v11 count])
  {

    goto LABEL_13;
  }
  char v19 = [*(id *)(a1 + 32) isStepwiseExecution];

  if (v19)
  {
LABEL_13:
    id v20 = *(void **)(a1 + 32);
    uint64_t v21 = *(void *)(a1 + 40);
    uint64_t v22 = *(void *)(a1 + 48);
    int v23 = [v20 accessSpecifier];
    id v24 = [v5 record];
    LOBYTE(v20) = [v20 allowIncomingRunRequest:v21 withDescriptor:v22 accessSpecifier:v23 record:v24];

    if (v20)
    {
      [v5 setIgnoreModifications:1];
      id v25 = getWFRunningLifecycleLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = *(void **)(a1 + 40);
        *(_DWORD *)long long buf = 138543618;
        id v70 = (const char *)v5;
        __int16 v71 = 2114;
        id v72 = v26;
        _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_DEFAULT, "Starting shortcut run: %{public}@, request: %{public}@", buf, 0x16u);
      }

      id v27 = [*(id *)(a1 + 32) stateMachine];
      uint64_t v28 = [*(id *)(a1 + 32) environment];
      id v29 = [v5 reference];
      uint64_t v30 = [*(id *)(a1 + 32) isPersonalAutomation];
      os_signpost_id_t v31 = [NSString stringWithFormat:@"running run request: %@", *(void *)(a1 + 40)];
      [v27 startRunningShortcutWithEnvironment:v28 reference:v29 isPersonalAutomation:v30 reason:v31];

      if ([*(id *)(a1 + 32) environment] != 1 || (objc_msgSend(v5, "isResidentCompatible") & 1) != 0)
      {
        id v32 = *(id *)(a1 + 40);
        if (v32)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v33 = v32;
          }
          else {
            id v33 = 0;
          }
        }
        else
        {
          id v33 = 0;
        }
        id v15 = v33;

        uint64_t v47 = [v15 action];
        [*(id *)(a1 + 56) setContextualAction:v47];

        uint64_t v48 = [v15 actionContext];
        [*(id *)(a1 + 56) setContextualActionContext:v48];

        __int16 v49 = *(void **)(a1 + 40);
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_256;
        v58[3] = &unk_1E654DE98;
        id v50 = *(id *)(a1 + 80);
        uint64_t v51 = *(void *)(a1 + 32);
        id v65 = v50;
        void v58[4] = v51;
        id v59 = v5;
        id v60 = *(id *)(a1 + 64);
        id v61 = *(id *)(a1 + 40);
        id v62 = *(id *)(a1 + 56);
        id v52 = *(id *)(a1 + 48);
        uint64_t v53 = *(void *)(a1 + 88);
        id v63 = v52;
        uint64_t v66 = v53;
        id v64 = *(id *)(a1 + 72);
        [v49 getInputWithCompletionHandler:v58];

        goto LABEL_29;
      }
      id v54 = getWFXPCRunnerLogObject();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        id v70 = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:]_block_invoke";
        _os_log_impl(&dword_1C7F0A000, v54, OS_LOG_TYPE_ERROR, "%s workflow is not home resident-compatible, but run from home-resident environment", buf, 0xCu);
      }

      id v55 = objc_alloc(MEMORY[0x1E4FB4A80]);
      id v56 = WFBackgroundShortcutRunnerError(2, 0);
      id v15 = (id)[v55 initWithError:v56];

      uint64_t v16 = [*(id *)(a1 + 32) stateMachine];
      uint64_t v17 = v16;
      uint64_t v18 = @"workflow is not home resident-compatible, but run from home-resident environment";
    }
    else
    {
      id v34 = objc_alloc(MEMORY[0x1E4FB4A80]);
      __int16 v35 = WFBackgroundShortcutRunnerError(0, v6);
      id v15 = (id)[v34 initWithError:v35];

      uint64_t v16 = [*(id *)(a1 + 32) stateMachine];
      uint64_t v17 = v16;
      uint64_t v18 = @"missing required entitlement";
    }
LABEL_23:
    [v16 finishRunningWithReason:v18 result:v15];

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    goto LABEL_29;
  }
  id v36 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    uint64_t v37 = [v5 name];
    *(_DWORD *)long long buf = 136315394;
    id v70 = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:]_block_invoke";
    __int16 v71 = 2112;
    id v72 = v37;
    _os_log_impl(&dword_1C7F0A000, v36, OS_LOG_TYPE_ERROR, "%s “%@” contains no actions.", buf, 0x16u);
  }
  uint64_t v38 = (void *)MEMORY[0x1E4F28C58];
  v67[0] = *MEMORY[0x1E4F28568];
  id v39 = WFLocalizedString(@"Empty Shortcut");
  v68[0] = v39;
  v67[1] = *MEMORY[0x1E4F28588];
  uint64_t v40 = NSString;
  uint64_t v41 = WFLocalizedString(@"“%@” contains no actions.");
  id v42 = [v5 name];
  uint64_t v43 = objc_msgSend(v40, "localizedStringWithFormat:", v41, v42);
  v68[1] = v43;
  uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:2];
  id v15 = [v38 errorWithDomain:@"WFBackgroundShortcutRunnerErrorDomain" code:10 userInfo:v44];

  __int16 v45 = (void *)[objc_alloc(MEMORY[0x1E4FB4A80]) initWithError:v15];
  uint64_t v46 = [*(id *)(a1 + 32) stateMachine];
  [v46 finishRunningWithReason:@"no actions in workflow" result:v45];

  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
LABEL_29:
}

void __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_256(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  if (v5 || !v6)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    os_signpost_id_t v12 = *(void **)(a1 + 48);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_260;
    v18[3] = &unk_1E654DE70;
    id v13 = v12;
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(void **)(a1 + 40);
    id v19 = v13;
    uint64_t v20 = v14;
    id v21 = v15;
    id v22 = v5;
    id v23 = *(id *)(a1 + 56);
    id v24 = *(id *)(a1 + 64);
    id v16 = *(id *)(a1 + 72);
    uint64_t v17 = *(void *)(a1 + 96);
    id v25 = v16;
    uint64_t v27 = v17;
    id v26 = *(id *)(a1 + 80);
    [v10 evaluateRemoteQuarantinePolicyForWorkflow:v11 workflowReference:v13 withCompletionHandler:v18];

    id v7 = v19;
  }
  else
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB4A80]) initWithError:v6];
    id v8 = getWFXPCRunnerLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v29 = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:]_block_invoke";
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Could not get input with error: %@", buf, 0x16u);
    }

    os_signpost_id_t v9 = [*(id *)(a1 + 32) stateMachine];
    [v9 finishRunningWithReason:@"no input and input error" result:v7];
  }
}

void __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_260(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    if (v7)
    {
      os_signpost_id_t v9 = [*(id *)(a1 + 48) remoteQuarantineHash];
      char v10 = [v9 isEqualToData:v7];

      if ((v10 & 1) == 0)
      {
        uint64_t v11 = +[WFDatabaseProxy defaultDatabase];
        [v11 storeQuarantineHashForWorkflowWithReference:*(void *)(a1 + 32) quarantineHash:v7];
      }
    }
    os_signpost_id_t v12 = objc_alloc_init(WFWorkflowController);
    [*(id *)(a1 + 40) setWorkflowController:v12];
    [(WFWorkflowController *)v12 setWorkflow:*(void *)(a1 + 48)];
    [(WFWorkflowController *)v12 setInput:*(void *)(a1 + 56)];
    [(WFWorkflowController *)v12 setDelegate:*(void *)(a1 + 40)];
    id v13 = [*(id *)(a1 + 64) automationType];
    [(WFWorkflowController *)v12 setAutomationType:v13];

    uint64_t v14 = [*(id *)(a1 + 64) runViewSource];
    [(WFWorkflowController *)v12 setRunViewSource:v14];

    [(WFWorkflowController *)v12 setRunningContext:*(void *)(a1 + 72)];
    [(WFWorkflowController *)v12 setDonateInteraction:0];
    id v15 = [*(id *)(a1 + 64) listenerEndpoints];
    [(WFWorkflowController *)v12 setListenerEndpoints:v15];

    -[WFWorkflowController setIsAutomationSuggestion:](v12, "setIsAutomationSuggestion:", [*(id *)(a1 + 64) isAutomationSuggestion]);
    id v16 = [*(id *)(a1 + 64) trialID];
    [(WFWorkflowController *)v12 setAutomationTrialID:v16];

    uint64_t v17 = *(void **)(a1 + 40);
    uint64_t v18 = [v17 environment];
    id v19 = [*(id *)(a1 + 64) runSource];
    uint64_t v20 = [v17 metricsRunSourceFromEnvironment:v18 runSource:v19];
    [(WFWorkflowController *)v12 setRunSource:v20];

    -[WFWorkflowController setOutputBehavior:](v12, "setOutputBehavior:", [*(id *)(a1 + 64) outputBehavior]);
    id v21 = *(id *)(a1 + 80);
    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = [v21 shouldDisablePrivacyPrompts];
    }
    else
    {

      id v21 = 0;
    }
    [(WFWorkflowController *)v12 setShouldDisablePrivacyPrompts:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)];
    id v24 = getWFXPCRunnerLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v35 = "-[WFBackgroundShortcutRunner runWorkflowWithDescriptor:request:inEnvironment:runningContext:completion:]_block_invoke";
      __int16 v36 = 2048;
      CFTimeInterval v37 = CACurrentMediaTime();
      _os_log_impl(&dword_1C7F0A000, v24, OS_LOG_TYPE_DEBUG, "%s [Performance] Starting workflow run, %f", buf, 0x16u);
    }

    [(WFWorkflowController *)v12 run];
    if ([*(id *)(a1 + 64) logRunEvent])
    {
      uint64_t v25 = *(void *)(a1 + 32);
      if (v25)
      {
        id v26 = *(void **)(a1 + 88);
        uint64_t v27 = [*(id *)(a1 + 64) runSource];
        uint64_t v28 = [v26 logRunOfWorkflow:v25 withSource:v27 triggerID:0];
        [*(id *)(a1 + 40) setRunEvent:v28];
      }
    }
    if ([*(id *)(a1 + 64) donateInteraction])
    {
      id v29 = dispatch_get_global_queue(0, 0);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_266;
      v30[3] = &unk_1E6558910;
      void v30[4] = *(void *)(a1 + 40);
      id v31 = *(id *)(a1 + 80);
      id v32 = *(id *)(a1 + 88);
      id v33 = *(id *)(a1 + 32);
      dispatch_async(v29, v30);
    }
  }
  else
  {
    if (*(void *)(a1 + 32))
    {
      id v22 = +[WFDatabaseProxy defaultDatabase];
      [v22 quarantineWorkflowWithReference:*(void *)(a1 + 32)];
    }
    os_signpost_id_t v12 = (WFWorkflowController *)[objc_alloc(MEMORY[0x1E4FB4A80]) initWithError:v8];
    id v23 = [*(id *)(a1 + 40) stateMachine];
    [v23 finishRunningWithReason:@"remote quarantine error" result:v12];
  }
}

uint64_t __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_266(void *a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1[4] + 144));
  id v2 = (void *)a1[5];
  uint64_t v3 = a1[6];
  uint64_t v4 = a1[7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_2;
  v6[3] = &unk_1E6558B28;
  v6[4] = a1[4];
  return [v2 donateRunInteractionWithDatabase:v3 workflowReference:v4 completionHandler:v6];
}

void __104__WFBackgroundShortcutRunner_runWorkflowWithDescriptor_request_inEnvironment_runningContext_completion___block_invoke_2(uint64_t a1)
{
}

- (void)prewarmRunnerWithCompletion:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void (**)(id, void))a3;
  uint64_t v4 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[WFBackgroundShortcutRunner prewarmRunnerWithCompletion:]";
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEFAULT, "%s Runner prewarm complete", (uint8_t *)&v5, 0xCu);
  }

  v3[2](v3, 0);
}

- (void)updateRunViewSource:(id)a3
{
  id v4 = a3;
  id v6 = [(WFBackgroundShortcutRunner *)self dialogTransformer];
  int v5 = [v6 userInterfacePresenter];
  [v5 updateRunViewSource:v4];
}

- (void)demoteSharedTemporaryDirectoryLock
{
  int v2 = [(WFBackgroundShortcutRunner *)self lockFileFD];
  flock(v2, 5);
}

- (BOOL)promoteSharedTemporaryDirectoryLock
{
  return flock([(WFBackgroundShortcutRunner *)self lockFileFD], 6) == 0;
}

- (BOOL)initializeSharedTemporaryDirectoryLock
{
  WFBackgroundShortcutRunnerLockFileURL();
  id v3 = objc_claimAutoreleasedReturnValue();
  self->_lockFileFD = open((const char *)[v3 fileSystemRepresentation], 532, 438);

  return flock([(WFBackgroundShortcutRunner *)self lockFileFD], 6) == 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    id v15 = "-[WFBackgroundShortcutRunner listener:shouldAcceptNewConnection:]";
    _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_DEBUG, "%s Received new connection", buf, 0xCu);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __65__WFBackgroundShortcutRunner_listener_shouldAcceptNewConnection___block_invoke;
  v13[3] = &unk_1E6558B28;
  v13[4] = self;
  [v5 setInterruptionHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __65__WFBackgroundShortcutRunner_listener_shouldAcceptNewConnection___block_invoke_193;
  v12[3] = &unk_1E6558B28;
  void v12[4] = self;
  [v5 setInvalidationHandler:v12];
  uint64_t v7 = WFOutOfProcessWorkflowControllerHostXPCInterface();
  [v5 setRemoteObjectInterface:v7];

  id v8 = WFOutOfProcessWorkflowControllerVendorXPCInterface();
  [v5 setExportedInterface:v8];

  [v5 setExportedObject:self];
  [v5 resume];
  [(WFBackgroundShortcutRunner *)self setXpcConnection:v5];
  os_signpost_id_t v9 = [MEMORY[0x1E4FB4510] accessSpecifierForXPCConnection:v5];

  [(WFBackgroundShortcutRunner *)self setAccessSpecifier:v9];
  char v10 = [(WFBackgroundShortcutRunner *)self stateMachine];
  [v10 idleStateWithReason:@"incoming connection to runner"];

  return 1;
}

void __65__WFBackgroundShortcutRunner_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    id v5 = "-[WFBackgroundShortcutRunner listener:shouldAcceptNewConnection:]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_ERROR, "%s XPC connection interrupted", (uint8_t *)&v4, 0xCu);
  }

  id v3 = [*(id *)(a1 + 32) stateMachine];
  [v3 connectionInvalidatedOrInterrupted];
}

void __65__WFBackgroundShortcutRunner_listener_shouldAcceptNewConnection___block_invoke_193(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    id v5 = "-[WFBackgroundShortcutRunner listener:shouldAcceptNewConnection:]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_ERROR, "%s XPC connection invalidated", (uint8_t *)&v4, 0xCu);
  }

  id v3 = [*(id *)(a1 + 32) stateMachine];
  [v3 connectionInvalidatedOrInterrupted];
}

- (WFBackgroundShortcutRunner)initWithProcessPolicy:(unint64_t)a3
{
  v25.receiver = self;
  v25.super_class = (Class)WFBackgroundShortcutRunner;
  int v4 = [(WFBackgroundShortcutRunner *)&v25 init];
  id v5 = v4;
  if (v4)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        uint64_t v6 = [MEMORY[0x1E4FB4510] accessSpecifierUnrestricted];
        [(WFBackgroundShortcutRunner *)v5 setAccessSpecifier:v6];

        +[WFInitialization initializeProcessWithDatabase:0 skipDeletingTemporaryFiles:1];
      }
    }
    else
    {
      uint64_t v7 = [(WFBackgroundShortcutRunner *)v4 initializeSharedTemporaryDirectoryLock] ^ 1;
      +[WFInitialization initializeProcessWithDatabase:0 skipDeletingTemporaryFiles:v7];
      if ((v7 & 1) == 0) {
        [(WFBackgroundShortcutRunner *)v5 demoteSharedTemporaryDirectoryLock];
      }
      id v8 = [MEMORY[0x1E4FB4540] standardClient];
      os_signpost_id_t v9 = [v8 getVaultItemsAccessForBackgroundRunner];

      [v9 enumerateObjectsUsingBlock:&__block_literal_global_7513];
      [(WFBackgroundShortcutRunner *)v5 setDataVaultFileURLs:v9];
    }
    char v10 = [[WFBackgroundShortcutRunnerStateMachine alloc] initWithProcessPolicy:a3];
    [(WFBackgroundShortcutRunnerStateMachine *)v10 setDelegate:v5];
    stateMachine = v5->_stateMachine;
    v5->_stateMachine = v10;
    os_signpost_id_t v12 = v10;

    id v13 = (WFRunningProgressSuppressionStateMachine *)objc_opt_new();
    [(WFRunningProgressSuppressionStateMachine *)v13 setDelegate:v5];
    runningProgressSuppressionStateMachine = v5->_runningProgressSuppressionStateMachine;
    v5->_runningProgressSuppressionStateMachine = v13;
    id v15 = v13;

    v5->_runningProgressSuppressionMachineResolvedAndDeniedProgress = 0;
    uint64_t v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.WorkflowKit.BackgroundShortcutRunner.queue", v16);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v17;

    uint64_t v19 = objc_opt_new();
    actionReversalStates = v5->_actionReversalStates;
    v5->_actionReversalStates = (NSMutableDictionary *)v19;

    dispatch_group_t v21 = dispatch_group_create();
    exitTaskGroup = v5->_exitTaskGroup;
    v5->_exitTaskGroup = (OS_dispatch_group *)v21;

    id v23 = v5;
  }

  return v5;
}

void __52__WFBackgroundShortcutRunner_initWithProcessPolicy___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 url];
  [v2 startAccessingSecurityScopedResource];
}

@end