@interface WFSageWorkflowRunnerClient
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)siriSessionID;
- (NSXPCListener)dialogRequestListener;
- (WFSageWorkflowRunnerClient)initWithClientIdentifier:(id)a3 siriSessionID:(id)a4;
- (id)createRunningContextFromRequestIfNecessary:(id)a3 descriptor:(id)a4;
- (id)startCompletionBlock;
- (id)stepCompletionBlock;
- (void)completeStepExecutionForActionIdentifier:(id)a3 serializedVariable:(id)a4 executionResultMetadata:(id)a5 error:(id)a6;
- (void)extractVariableContentFromEncodedReference:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5;
- (void)fetchDisplayValueForRequest:(id)a3 completionHandler:(id)a4;
- (void)fetchToolInvocationSummaryForInvocation:(id)a3 completionHandler:(id)a4;
- (void)forTestingOnly_simulateXPCInterruption;
- (void)injectContentAsVariable:(id)a3 completionHandler:(id)a4;
- (void)outOfProcessWorkflowController:(id)a3 actionWithUUID:(id)a4 didFinishRunningWithError:(id)a5 serializedVariable:(id)a6 executionResultMetadata:(id)a7;
- (void)outOfProcessWorkflowController:(id)a3 didFinishWithResult:(id)a4 dialogAttribution:(id)a5 runResidency:(unint64_t)a6;
- (void)outOfProcessWorkflowController:(id)a3 didStartFromWorkflowReference:(id)a4 dialogAttribution:(id)a5;
- (void)performDialogRequest:(id)a3 completionHandler:(id)a4;
- (void)performQuery:(id)a3 inValueSet:(id)a4 toolInvocation:(id)a5 completionHandler:(id)a6;
- (void)performSiriRequest:(id)a3 completionHandler:(id)a4;
- (void)resolveDeferredValueFromEncodedStorage:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5;
- (void)setSiriSessionID:(id)a3;
- (void)setStartCompletionBlock:(id)a3;
- (void)setStepCompletionBlock:(id)a3;
- (void)start;
- (void)startWithCompletionHandler:(id)a3;
- (void)stepWithEncodedToolInvocation:(id)a3 completionHandler:(id)a4;
- (void)stop;
@end

@implementation WFSageWorkflowRunnerClient

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stepCompletionBlock, 0);
  objc_storeStrong(&self->_startCompletionBlock, 0);
  objc_storeStrong((id *)&self->_dialogRequestListener, 0);
  objc_storeStrong((id *)&self->_siriSessionID, 0);
}

- (void)setStepCompletionBlock:(id)a3
{
}

- (id)stepCompletionBlock
{
  return self->_stepCompletionBlock;
}

- (void)setStartCompletionBlock:(id)a3
{
}

- (id)startCompletionBlock
{
  return self->_startCompletionBlock;
}

- (NSXPCListener)dialogRequestListener
{
  return self->_dialogRequestListener;
}

- (void)setSiriSessionID:(id)a3
{
}

- (NSString)siriSessionID
{
  return self->_siriSessionID;
}

- (void)performDialogRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [[WFDialogResponse alloc] initWithResponseCode:4];
  v9 = [(WFWorkflowRunnerClient *)self delegate];

  if (v9
    && ([(WFWorkflowRunnerClient *)self delegate],
        v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        (v11 & 1) != 0))
  {
    v12 = [(WFWorkflowRunnerClient *)self delegateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__WFSageWorkflowRunnerClient_performDialogRequest_completionHandler___block_invoke;
    block[3] = &unk_1E6078FB0;
    block[4] = self;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(v12, block);
  }
  else
  {
    (*((void (**)(id, WFDialogResponse *))v7 + 2))(v7, v8);
  }
}

void __69__WFSageWorkflowRunnerClient_performDialogRequest_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 workflowRunnerClient:*(void *)(a1 + 32) postedDialogRequest:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)performSiriRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *))a4;
  v5 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    int v9 = 136315138;
    v10 = "-[WFSageWorkflowRunnerClient performSiriRequest:completionHandler:]";
    _os_log_impl(&dword_1B3C5C000, v5, OS_LOG_TYPE_FAULT, "%s Sage workflow runner client should not receive siri action requests, ignoring.", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [WFSiriActionResponse alloc];
  id v7 = [MEMORY[0x1E4F28C58] wfSiriExecutionRequiresShortcutsJrError];
  v8 = [(WFSiriActionResponse *)v6 initWithError:v7];

  v4[2](v4, v8);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = WFExternalUIPresenterXPCInterface();
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)completeStepExecutionForActionIdentifier:(id)a3 serializedVariable:(id)a4 executionResultMetadata:(id)a5 error:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(WFSageWorkflowRunnerClient *)self stepCompletionBlock];

  if (v13)
  {
    if (objc_msgSend(v12, "wf_isCancelledStepError"))
    {

      id v11 = 0;
      id v10 = 0;
    }
    id v14 = [(WFSageWorkflowRunnerClient *)self stepCompletionBlock];
    ((void (**)(void, id, id, id, id))v14)[2](v14, v15, v10, v11, v12);

    [(WFSageWorkflowRunnerClient *)self setStepCompletionBlock:0];
  }
}

- (void)outOfProcessWorkflowController:(id)a3 didFinishWithResult:(id)a4 dialogAttribution:(id)a5 runResidency:(unint64_t)a6
{
  id v16 = a4;
  id v7 = [v16 error];

  v8 = v16;
  if (v7)
  {
    int v9 = [v16 error];
    [(WFSageWorkflowRunnerClient *)self completeStepExecutionForActionIdentifier:0 serializedVariable:0 executionResultMetadata:0 error:v9];
    id v10 = [v9 domain];
    if ([v10 isEqualToString:WFOutOfProcessWorkflowControllerErrorDomain])
    {
      uint64_t v11 = [v9 code];

      if (v11 != 4) {
        goto LABEL_8;
      }
      uint64_t v12 = [(WFWorkflowRunnerClient *)self delegate];
      if (!v12) {
        goto LABEL_8;
      }
      v13 = (void *)v12;
      id v14 = [(WFWorkflowRunnerClient *)self delegate];
      char v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) == 0) {
        goto LABEL_8;
      }
      id v10 = [(WFWorkflowRunnerClient *)self delegate];
      [v10 workflowRunnerClient:self postedEvent:1];
    }

LABEL_8:
    v8 = v16;
  }
}

- (void)outOfProcessWorkflowController:(id)a3 actionWithUUID:(id)a4 didFinishRunningWithError:(id)a5 serializedVariable:(id)a6 executionResultMetadata:(id)a7
{
}

- (void)outOfProcessWorkflowController:(id)a3 didStartFromWorkflowReference:(id)a4 dialogAttribution:(id)a5
{
  id v7 = [(WFSageWorkflowRunnerClient *)self startCompletionBlock];

  if (!v7)
  {
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WFSageWorkflowRunnerClient.m", 130, @"Unexpected callback, did you call -startWithCompletionHandler?" object file lineNumber description];
  }
  v8 = [(WFSageWorkflowRunnerClient *)self startCompletionBlock];
  v8[2]();

  [(WFSageWorkflowRunnerClient *)self setStartCompletionBlock:0];
}

- (id)createRunningContextFromRequestIfNecessary:(id)a3 descriptor:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)WFSageWorkflowRunnerClient;
  id v5 = [(WFWorkflowRunnerClient *)&v11 createRunningContextFromRequestIfNecessary:a3 descriptor:a4];
  id v6 = [(WFSageWorkflowRunnerClient *)self siriSessionID];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    v8 = [(WFSageWorkflowRunnerClient *)self siriSessionID];
    id v9 = (id)[v5 copyWithCustomIdentity:v8];
  }
  else
  {
    id v9 = v5;
  }

  return v9;
}

- (void)forTestingOnly_simulateXPCInterruption
{
  id v2 = [(WFWorkflowRunnerClient *)self workflowController];
  objc_msgSend(v2, "forTestingOnly_simulateXPCInterruption");
}

- (void)fetchDisplayValueForRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFWorkflowRunnerClient *)self workflowController];
  [v8 fetchDisplayValueForRequest:v7 completionHandler:v6];
}

- (void)performQuery:(id)a3 inValueSet:(id)a4 toolInvocation:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(WFWorkflowRunnerClient *)self workflowController];
  [v14 performQuery:v13 inValueSet:v12 toolInvocation:v11 completionHandler:v10];
}

- (void)fetchToolInvocationSummaryForInvocation:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(WFWorkflowRunnerClient *)self workflowController];

  if (!v9)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"WFSageWorkflowRunnerClient.m" lineNumber:99 description:@"Please call -start before calling this method"];
  }
  id v11 = [(WFWorkflowRunnerClient *)self workflowController];
  [v11 fetchToolInvocationSummaryForInvocation:v8 completionHandler:v7];
}

- (void)resolveDeferredValueFromEncodedStorage:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(WFWorkflowRunnerClient *)self workflowController];

  if (!v12)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"WFSageWorkflowRunnerClient.m" lineNumber:94 description:@"Please call -start before calling this method"];
  }
  id v14 = [(WFWorkflowRunnerClient *)self workflowController];
  [v14 resolveDeferredValueFromEncodedStorage:v11 forEncodedExpectedType:v10 completionHandler:v9];
}

- (void)extractVariableContentFromEncodedReference:(id)a3 forEncodedExpectedType:(id)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(WFWorkflowRunnerClient *)self workflowController];

  if (!v12)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"WFSageWorkflowRunnerClient.m" lineNumber:89 description:@"Please call -start before calling this method"];
  }
  id v14 = [(WFWorkflowRunnerClient *)self workflowController];
  [v14 extractVariableContentFromEncodedReference:v11 forEncodedExpectedType:v10 completionHandler:v9];
}

- (void)injectContentAsVariable:(id)a3 completionHandler:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(WFWorkflowRunnerClient *)self workflowController];

  if (!v9)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"WFSageWorkflowRunnerClient.m" lineNumber:84 description:@"Please call -start before calling this method"];
  }
  id v11 = [(WFWorkflowRunnerClient *)self workflowController];
  [v11 injectContentAsVariable:v8 completionHandler:v7];
}

- (void)stop
{
  v4.receiver = self;
  v4.super_class = (Class)WFSageWorkflowRunnerClient;
  [(WFWorkflowRunnerClient *)&v4 stop];
  v3 = [(WFSageWorkflowRunnerClient *)self dialogRequestListener];
  [v3 invalidate];
}

- (void)start
{
  v3 = [(WFSageWorkflowRunnerClient *)self dialogRequestListener];
  [v3 resume];

  v4.receiver = self;
  v4.super_class = (Class)WFSageWorkflowRunnerClient;
  [(WFWorkflowRunnerClient *)&v4 start];
}

- (void)stepWithEncodedToolInvocation:(id)a3 completionHandler:(id)a4
{
  id v12 = a4;
  id v7 = a3;
  id v8 = [(WFWorkflowRunnerClient *)self workflowController];

  if (!v8)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"WFSageWorkflowRunnerClient.m" lineNumber:66 description:@"Please call -start before calling this method"];
  }
  id v9 = (void *)[v12 copy];
  [(WFSageWorkflowRunnerClient *)self setStepCompletionBlock:v9];

  id v10 = [(WFWorkflowRunnerClient *)self workflowController];
  [v10 runToolWithInvocation:v7];
}

- (void)startWithCompletionHandler:(id)a3
{
  [(WFSageWorkflowRunnerClient *)self setStartCompletionBlock:a3];
  [(WFSageWorkflowRunnerClient *)self start];
}

- (WFSageWorkflowRunnerClient)initWithClientIdentifier:(id)a3 siriSessionID:(id)a4
{
  id v5 = a4;
  id v6 = objc_opt_new();
  id v7 = [MEMORY[0x1E4F29290] anonymousListener];
  [(NSXPCListener *)v7 setDelegate:self];
  dialogRequestListener = self->_dialogRequestListener;
  self->_dialogRequestListener = v7;
  id v9 = v7;

  id v10 = [(WFWorkflowRunRequest *)[WFSageWorkflowRunRequest alloc] initWithInput:0 presentationMode:0];
  [(WFWorkflowRunRequest *)v10 setRunSource:@"siri-planner"];
  id v11 = [(NSXPCListener *)v9 endpoint];
  [(WFWorkflowRunRequest *)v10 setRemoteDialogPresenterEndpoint:v11];

  v16.receiver = self;
  v16.super_class = (Class)WFSageWorkflowRunnerClient;
  id v12 = [(WFWorkflowRunnerClient *)&v16 initWithDescriptor:v6 runRequest:v10];

  id v13 = v12;
  id v14 = (void *)[v5 copy];

  [(WFSageWorkflowRunnerClient *)v13 setSiriSessionID:v14];
  return v13;
}

@end