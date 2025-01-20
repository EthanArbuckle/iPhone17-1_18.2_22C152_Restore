@interface WFLWorkflowController
- (BOOL)action:(id)a3 canProvideInputForParameter:(id)a4;
- (BOOL)executeIntent:(id)a3 completionHandler:(id)a4;
- (BOOL)isRunning;
- (BOOL)isRunningWithExternalUI;
- (BOOL)isRunningWithSiriUI;
- (BOOL)isRunningWithToolKitClient;
- (BOOL)openInteractionInApp:(id)a3 completionHandler:(id)a4;
- (BOOL)openUserActivity:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5;
- (BOOL)speakText:(id)a3 completionHandler:(id)a4;
- (BOOL)workflowController:(id)a3 handleUnsupportedEnvironmentForAction:(id)a4 currentState:(id)a5 completionHandler:(id)a6;
- (INInteraction)lastInteraction;
- (NSArray)airPlayRouteIDs;
- (NSProgress)progress;
- (NSString)userInterfaceType;
- (WFLWorkflowController)initWithWorkflow:(id)a3;
- (WFLWorkflowControllerDelegate)delegate;
- (WFWorkflow)workflow;
- (WFWorkflowController)controller;
- (WFWorkflowRunEvent)runEvent;
- (id)runSource;
- (int64_t)executionContext;
- (void)action:(id)a3 provideInputForParameters:(id)a4 withDefaultStates:(id)a5 prompts:(id)a6 completionHandler:(id)a7;
- (void)configureIntent:(id)a3;
- (void)launchAppWithCompletionHandler:(id)a3;
- (void)openURL:(id)a3 completionHandler:(id)a4;
- (void)runWithInput:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExecutionContext:(int64_t)a3;
- (void)setLastInteraction:(id)a3;
- (void)setRunEvent:(id)a3;
- (void)showConfirmInteraction:(id)a3 prompt:(id)a4 requireAuthentication:(BOOL)a5 completionHandler:(id)a6;
- (void)showConfirmInteraction:(id)a3 requireAuthentication:(BOOL)a4 requireConfirmation:(BOOL)a5 completionHandler:(id)a6;
- (void)showHandleInteraction:(id)a3 prompt:(id)a4 completionHandler:(id)a5;
- (void)stop;
- (void)workflowController:(id)a3 didFinishRunningWithError:(id)a4 cancelled:(BOOL)a5;
- (void)workflowController:(id)a3 didRunAction:(id)a4 error:(id)a5;
- (void)workflowController:(id)a3 prepareToRunAction:(id)a4 withInput:(id)a5 completionHandler:(id)a6;
- (void)workflowControllerWillRun:(id)a3;
@end

@implementation WFLWorkflowController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runEvent, 0);
  objc_storeStrong((id *)&self->_lastInteraction, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_airPlayRouteIDs, 0);
}

- (void)setRunEvent:(id)a3
{
}

- (WFWorkflowRunEvent)runEvent
{
  return self->_runEvent;
}

- (void)setLastInteraction:(id)a3
{
}

- (INInteraction)lastInteraction
{
  return self->_lastInteraction;
}

- (WFWorkflowController)controller
{
  return self->_controller;
}

- (void)setExecutionContext:(int64_t)a3
{
  self->_executionContext = a3;
}

- (int64_t)executionContext
{
  return self->_executionContext;
}

- (void)setDelegate:(id)a3
{
}

- (WFLWorkflowControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFLWorkflowControllerDelegate *)WeakRetained;
}

- (NSArray)airPlayRouteIDs
{
  return self->_airPlayRouteIDs;
}

- (BOOL)action:(id)a3 canProvideInputForParameter:(id)a4
{
  return 0;
}

- (void)action:(id)a3 provideInputForParameters:(id)a4 withDefaultStates:(id)a5 prompts:(id)a6 completionHandler:(id)a7
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v7 = a7;
  v8 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    int v9 = 136315138;
    v10 = "-[WFLWorkflowController action:provideInputForParameters:withDefaultStates:prompts:completionHandler:]";
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s provideInputForParameters should not be called", (uint8_t *)&v9, 0xCu);
  }

  (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
}

- (void)configureIntent:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_setExecutionContext:", -[WFLWorkflowController executionContext](self, "executionContext"));
}

- (BOOL)executeIntent:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (BOOL)openUserActivity:(id)a3 bundleIdentifier:(id)a4 completionHandler:(id)a5
{
  if (a5)
  {
    v6 = (void *)MEMORY[0x1E4F28C58];
    id v7 = a5;
    v8 = [v6 userCancelledError];
    (*((void (**)(id, void, void *))a5 + 2))(v7, 0, v8);
  }
  return 1;
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (BOOL)speakText:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (BOOL)openInteractionInApp:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = [(WFLWorkflowController *)self delegate];
  id v7 = [(WFLWorkflowController *)self controller];
  v8 = [v7 currentAction];

  if (objc_opt_respondsToSelector())
  {
    int v9 = [v6 workflowController:self userInterfaceForRunningAction:v8];
  }
  else
  {
    int v9 = 0;
  }
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __64__WFLWorkflowController_openInteractionInApp_completionHandler___block_invoke;
  v17 = &unk_1E65568C8;
  id v10 = v5;
  id v19 = v10;
  id v11 = v8;
  id v18 = v11;
  v12 = (void (**)(void *, uint64_t))_Block_copy(&v14);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v9, "action:requiresContinuingInAppWithProceedHandler:", v11, v12, v14, v15, v16, v17);
  }
  else {
    v12[2](v12, 1);
  }

  return 1;
}

void __64__WFLWorkflowController_openInteractionInApp_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = objc_opt_class();
    WFEnforceClass(v3, v4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [v8 connection];
    v6 = [v5 appProxy];
    [v6 launchAppInBackground:0 completionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v7();
  }
}

- (void)showHandleInteraction:(id)a3 prompt:(id)a4 completionHandler:(id)a5
{
  id v7 = (void (**)(id, void))a5;
  [(WFLWorkflowController *)self setLastInteraction:a3];
  v7[2](v7, 0);
}

- (void)showConfirmInteraction:(id)a3 prompt:(id)a4 requireAuthentication:(BOOL)a5 completionHandler:(id)a6
{
}

- (BOOL)isRunningWithToolKitClient
{
  return 0;
}

- (BOOL)isRunningWithExternalUI
{
  return 0;
}

- (BOOL)isRunningWithSiriUI
{
  return 0;
}

- (BOOL)workflowController:(id)a3 handleUnsupportedEnvironmentForAction:(id)a4 currentState:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = [a3 runSource];
  LOBYTE(self) = WFRemoteExecuteActionIfApplicable(v12, v11, self, self, v13, v10);

  return (char)self;
}

- (void)showConfirmInteraction:(id)a3 requireAuthentication:(BOOL)a4 requireConfirmation:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  [(WFLWorkflowController *)self setLastInteraction:v10];
  id v12 = [(WFLWorkflowController *)self delegate];
  v13 = [(WFLWorkflowController *)self controller];
  uint64_t v14 = [v13 currentAction];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v15 = [v12 workflowController:self userInterfaceForRunningAction:v14];
  }
  else
  {
    uint64_t v15 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v16 = objc_opt_class();
    v17 = WFEnforceClass(v14, v16);
    if (v17)
    {
      id v18 = [v10 intentResponse];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __108__WFLWorkflowController_showConfirmInteraction_requireAuthentication_requireConfirmation_completionHandler___block_invoke;
      v19[3] = &unk_1E6558678;
      id v20 = v11;
      [v15 handleIntentAction:v17 requiresUserConfirmation:v7 requiresUserAuthentication:v8 withIntentResponse:v18 proceedHandler:v19];
    }
    else
    {
      (*((void (**)(id, void))v11 + 2))(v11, 0);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);
  }
}

uint64_t __108__WFLWorkflowController_showConfirmInteraction_requireAuthentication_requireConfirmation_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)userInterfaceType
{
  return (NSString *)(id)*MEMORY[0x1E4F5ABF8];
}

- (void)workflowController:(id)a3 didRunAction:(id)a4 error:(id)a5
{
  id v7 = a4;
  v6 = [(WFLWorkflowController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 workflowController:self didRunAction:v7];
  }
}

- (void)workflowController:(id)a3 prepareToRunAction:(id)a4 withInput:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  BOOL v8 = (void (**)(void))a6;
  int v9 = [(WFLWorkflowController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 workflowController:self willRunAction:v10 withInput:0 proceedHandler:v8];
  }
  else {
    v8[2](v8);
  }
}

- (void)workflowController:(id)a3 didFinishRunningWithError:(id)a4 cancelled:(BOOL)a5
{
  BOOL v5 = a5;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  BOOL v8 = [(WFLWorkflowController *)self delegate];
  if (v7) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  id v10 = [(WFLWorkflowController *)self workflow];
  id v11 = [v10 database];
  id v12 = [(WFLWorkflowController *)self runEvent];
  [v11 setOutcome:v9 forRunEvent:v12];

  [(WFLWorkflowController *)self setRunEvent:0];
  if (v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] userCancelledError];

    id v7 = (id)v13;
  }
  if (v7)
  {
    uint64_t v14 = [v7 userInfo];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"WFIntentExecutorIntentResponseErrorKey"];

    if (v15)
    {
      uint64_t v16 = [v7 userInfo];
      v17 = (void *)[v16 mutableCopy];

      [v17 setObject:v15 forKey:@"WFLUnderlyingIntentResponse"];
      [v17 removeObjectForKey:@"WFIntentExecutorIntentResponseErrorKey"];
      id v18 = (void *)MEMORY[0x1E4F28C58];
      id v19 = [v7 domain];
      uint64_t v20 = objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, objc_msgSend(v7, "code"), v17);

      id v7 = (id)v20;
    }
    if (objc_opt_respondsToSelector()) {
      [v8 workflowControllerDidStop:self withError:v7];
    }
  }
  else
  {
    v21 = [(WFLWorkflowController *)self lastInteraction];
    v22 = [v21 intentResponse];
    if (v22)
    {
      v23 = [(WFLWorkflowController *)self lastInteraction];
      v24 = [v23 intentResponse];
      v25[0] = v24;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    }
    else
    {
      id v7 = 0;
    }

    if (objc_opt_respondsToSelector()) {
      [v8 workflowControllerDidFinishRunning:self withOutput:v7];
    }
  }
}

- (void)workflowControllerWillRun:(id)a3
{
  id v4 = [(WFLWorkflowController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 workflowControllerWillRun:self];
  }
}

- (void)launchAppWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFLWorkflowController *)self controller];
  int v6 = [v5 isRunning];

  if (v6)
  {
    id v7 = [(WFLWorkflowController *)self controller];
    BOOL v8 = [v7 currentAction];
  }
  else
  {
    id v7 = [(WFLWorkflowController *)self workflow];
    uint64_t v9 = [v7 actions];
    BOOL v8 = [v9 lastObject];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v6)
    {
      id v10 = [v8 connection];
      id v11 = [v10 appProxy];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __56__WFLWorkflowController_launchAppWithCompletionHandler___block_invoke;
      v24[3] = &unk_1E6557E58;
      v24[4] = self;
      id v25 = v4;
      [v11 launchAppInBackground:0 completionHandler:v24];

      id v12 = v25;
    }
    else
    {
      uint64_t v13 = [(WFLWorkflowController *)self lastInteraction];
      uint64_t v14 = [v13 intentResponse];
      uint64_t v15 = [v14 userActivity];
      uint64_t v16 = INUserActivitySerializeToData();
      v17 = INUserActivityDeserializeFromData();

      id v18 = objc_alloc(MEMORY[0x1E4F5A798]);
      id v19 = [(WFLWorkflowController *)self lastInteraction];
      id v23 = 0;
      uint64_t v20 = (void *)[v18 initWithInteraction:v19 userActivity:v17 inBackground:0 error:&v23];
      id v12 = v23;

      if (v12)
      {
        if (v4) {
          (*((void (**)(id, void, id))v4 + 2))(v4, 0, v12);
        }
      }
      else
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __56__WFLWorkflowController_launchAppWithCompletionHandler___block_invoke_2;
        v21[3] = &unk_1E6558110;
        id v22 = v4;
        [v20 performWithCompletionHandler:v21];
      }
    }
  }
  else if (v4)
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

uint64_t __56__WFLWorkflowController_launchAppWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);
  return [v3 stop];
}

uint64_t __56__WFLWorkflowController_launchAppWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)stop
{
  id v2 = [(WFLWorkflowController *)self controller];
  [v2 stop];
}

- (id)runSource
{
  int64_t v2 = [(WFLWorkflowController *)self executionContext];
  if ((unint64_t)(v2 - 1) > 9) {
    v3 = (void **)MEMORY[0x1E4FB4F90];
  }
  else {
    v3 = (void **)qword_1E654DCE8[v2 - 1];
  }
  id v4 = *v3;
  return v4;
}

- (void)runWithInput:(id)a3
{
  id v4 = [MEMORY[0x1E4F5A830] collectionWithItems:a3];
  BOOL v5 = [(WFLWorkflowController *)self controller];
  [v5 setInput:v4];

  id v13 = [(WFLWorkflowController *)self runSource];
  int v6 = [(WFLWorkflowController *)self controller];
  [v6 setRunSource:v13];

  id v7 = [(WFLWorkflowController *)self workflow];
  BOOL v8 = [v7 database];
  uint64_t v9 = [(WFLWorkflowController *)self workflow];
  id v10 = [v9 reference];
  id v11 = [v8 logRunOfWorkflow:v10 withSource:v13 triggerID:0];
  [(WFLWorkflowController *)self setRunEvent:v11];

  id v12 = [(WFLWorkflowController *)self controller];
  [v12 run];
}

- (WFWorkflow)workflow
{
  int64_t v2 = [(WFLWorkflowController *)self controller];
  v3 = [v2 workflow];

  return (WFWorkflow *)v3;
}

- (NSProgress)progress
{
  int64_t v2 = [(WFLWorkflowController *)self controller];
  v3 = [v2 progress];

  return (NSProgress *)v3;
}

- (BOOL)isRunning
{
  int64_t v2 = [(WFLWorkflowController *)self controller];
  char v3 = [v2 isRunning];

  return v3;
}

- (WFLWorkflowController)initWithWorkflow:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLWorkflowController;
  BOOL v5 = [(WFLWorkflowController *)&v10 init];
  if (v5)
  {
    int v6 = objc_alloc_init(WFWorkflowController);
    controller = v5->_controller;
    v5->_controller = v6;

    [(WFWorkflowController *)v5->_controller setWorkflow:v4];
    [(WFWorkflowController *)v5->_controller setDelegate:v5];
    BOOL v8 = v5;
  }

  return v5;
}

@end