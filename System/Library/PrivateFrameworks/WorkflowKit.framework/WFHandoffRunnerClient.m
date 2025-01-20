@interface WFHandoffRunnerClient
- (WFHandoffRunnerClient)initWithRunningContext:(id)a3 runRequest:(id)a4;
- (WFHandoffRunnerClient)initWithWorkflowControllerState:(id)a3 runSource:(id)a4 remoteDialogPresenterEndpoint:(id)a5 error:(id *)a6;
- (WFWorkflowRunningContext)runningContext;
- (id)runWorkflowWithRequest:(id)a3 descriptor:(id)a4 completion:(id)a5;
- (id)runningDidStartHandler;
- (void)handleWorkflowDidStart:(id)a3;
- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4;
- (void)notifyStartHandlerWithProgress:(id)a3;
- (void)setRunningDidStartHandler:(id)a3;
- (void)startWithHandler:(id)a3;
@end

@implementation WFHandoffRunnerClient

- (void).cxx_destruct
{
  objc_storeStrong(&self->_runningDidStartHandler, 0);
  objc_storeStrong((id *)&self->_runningContext, 0);
}

- (void)setRunningDidStartHandler:(id)a3
{
}

- (id)runningDidStartHandler
{
  return self->_runningDidStartHandler;
}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (void)notifyStartHandlerWithProgress:(id)a3
{
  id v6 = a3;
  v4 = [(WFHandoffRunnerClient *)self runningDidStartHandler];

  if (v4)
  {
    v5 = [(WFHandoffRunnerClient *)self runningDidStartHandler];
    ((void (**)(void, id))v5)[2](v5, v6);

    [(WFHandoffRunnerClient *)self setRunningDidStartHandler:0];
  }
}

- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28F90];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 progressWithTotalUnitCount:1];
  [v9 setCompletedUnitCount:1];
  [(WFHandoffRunnerClient *)self notifyStartHandlerWithProgress:v9];
  v10.receiver = self;
  v10.super_class = (Class)WFHandoffRunnerClient;
  [(WFWorkflowRunnerClient *)&v10 handleWorkflowRunResult:v8 completion:v7];
}

- (void)handleWorkflowDidStart:(id)a3
{
  id v4 = a3;
  [(WFHandoffRunnerClient *)self notifyStartHandlerWithProgress:v4];
  v5.receiver = self;
  v5.super_class = (Class)WFHandoffRunnerClient;
  [(WFWorkflowRunnerClient *)&v5 handleWorkflowDidStart:v4];
}

- (void)startWithHandler:(id)a3
{
  [(WFHandoffRunnerClient *)self setRunningDidStartHandler:a3];
  [(WFWorkflowRunnerClient *)self start];
}

- (id)runWorkflowWithRequest:(id)a3 descriptor:(id)a4 completion:(id)a5
{
  id v6 = [(WFHandoffRunnerClient *)self runningContext];
  id v7 = [(WFWorkflowRunnerClient *)self createWorkflowControllerWithContext:v6];

  id v8 = [(WFWorkflowRunnerClient *)self runRequest];
  [v7 resumeRunningWithRequest:v8 error:0];

  v9 = [(WFHandoffRunnerClient *)self runningContext];

  return v9;
}

- (WFHandoffRunnerClient)initWithWorkflowControllerState:(id)a3 runSource:(id)a4 remoteDialogPresenterEndpoint:(id)a5 error:(id *)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v41 = a5;
  id v40 = a4;
  id v8 = a3;
  v9 = [v8 runningContext];
  v44 = (void *)[v9 copyWithNewIdentity];

  v34 = [WFWorkflowControllerState alloc];
  v39 = [v8 workflow];
  v38 = [v8 variables];
  uint64_t v37 = [v8 currentActionIndex];
  v36 = [v8 currentInput];
  v35 = [v8 currentProcessedParameters];
  v33 = [v8 startDate];
  v32 = [v8 currentRunSource];
  uint64_t v10 = [v8 numberOfDialogsPresented];
  uint64_t v11 = [v8 outputBehavior];
  v31 = [v8 currentActionContentAttributionTracker];
  v12 = [v8 contentItemCache];
  v13 = [v8 flowTracker];
  v14 = [v8 allowedOnceSmartPromptStates];
  v15 = [v8 extensionResourceClasses];
  LOBYTE(v30) = [v8 shouldDisablePrivacyPrompts];
  uint64_t v16 = -[WFWorkflowControllerState initWithWorkflow:variables:currentActionIndex:runningContext:currentInput:currentProcessedParameters:startDate:currentRunSource:numberOfDialogsPresented:outputBehavior:contentAttributionTracker:contentItemCache:flowTracker:allowedOnceSmartPromptStates:extensionResourceClasses:shouldDisablePrivacyPrompts:](v34, "initWithWorkflow:variables:currentActionIndex:runningContext:currentInput:currentProcessedParameters:startDate:currentRunSource:numberOfDialogsPresented:outputBehavior:contentAttributionTracker:contentItemCache:flowTracker:allowedOnceSmartPromptStates:extensionResourceClasses:shouldDisablePrivacyPrompts:", v39, v38, v37, v44, v36, v35, v33, v32, v10, v11, v31, v12, v13, v14, v15,
          v30);

  v17 = (void *)v16;
  v18 = (void *)[objc_alloc(MEMORY[0x1E4FB4A78]) initWithInput:0 presentationMode:1];
  [v18 setRunSource:v40];

  [v18 setOutputBehavior:0];
  [v18 setRemoteDialogPresenterEndpoint:v41];

  v19 = [v8 extensionResourceClasses];

  [v18 setExtensionResourceClasses:v19];
  v20 = [v17 runningContext];
  v21 = v20;
  if (v20)
  {
    v22 = WFWFWorkflowControllerStateDefaultSerializedURLFromContext(v20);
    if (v22)
    {
      id v45 = 0;
      char v23 = [v17 writeToURL:v22 error:&v45];
      id v24 = v45;
      v25 = self;
      if (v23)
      {
        v25 = [(WFHandoffRunnerClient *)self initWithRunningContext:v21 runRequest:v18];
        v26 = v25;
      }
      else
      {
        v28 = getWFXPCRunnerLogObject();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315650;
          v47 = "-[WFHandoffRunnerClient initWithWorkflowControllerState:runSource:remoteDialogPresenterEndpoint:error:]";
          __int16 v48 = 2112;
          v49 = v22;
          __int16 v50 = 2112;
          id v51 = v24;
          _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_FAULT, "%s Unable to save state to (%@): %@", buf, 0x20u);
        }

        v26 = 0;
        if (a6) {
          *a6 = v24;
        }
      }
    }
    else
    {
      v25 = self;
      if (a6)
      {
        [MEMORY[0x1E4F28C58] userCancelledError];
        v26 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = 0;
      }
    }
  }
  else
  {
    v27 = getWFXPCRunnerLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[WFHandoffRunnerClient initWithWorkflowControllerState:runSource:remoteDialogPresenterEndpoint:error:]";
      _os_log_impl(&dword_1C7F0A000, v27, OS_LOG_TYPE_FAULT, "%s Unable to resume workflow execution when contextToResume is nil.", buf, 0xCu);
    }

    v25 = self;
    if (a6)
    {
      [MEMORY[0x1E4F28C58] userCancelledError];
      v26 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
  }

  return v26;
}

- (WFHandoffRunnerClient)initWithRunningContext:(id)a3 runRequest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [[WFHandoffRunDescriptor alloc] initWithContext:v7];
  v13.receiver = self;
  v13.super_class = (Class)WFHandoffRunnerClient;
  uint64_t v10 = [(WFWorkflowRunnerClient *)&v13 initWithDescriptor:v9 runRequest:v8];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_runningContext, a3);
    uint64_t v11 = v10;
  }

  return v10;
}

@end