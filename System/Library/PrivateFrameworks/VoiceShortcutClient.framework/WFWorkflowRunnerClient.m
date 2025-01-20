@interface WFWorkflowRunnerClient
+ (id)underlyingErrorIfRunnerError:(id)a3;
- (BOOL)isRunning;
- (OS_dispatch_queue)delegateQueue;
- (WFOutOfProcessWorkflowController)workflowController;
- (WFRunnerPrewarmManager)prewarmManager;
- (WFWorkflowRunDescriptor)descriptor;
- (WFWorkflowRunRequest)runRequest;
- (WFWorkflowRunViewSource)runViewSource;
- (WFWorkflowRunnerClient)initWithDescriptor:(id)a3 runRequest:(id)a4;
- (WFWorkflowRunnerClient)initWithDescriptor:(id)a3 runRequest:(id)a4 delegateQueue:(id)a5;
- (WFWorkflowRunnerClientDelegate)delegate;
- (WFWorkflowRunningContext)context;
- (id)createRunningContextFromRequestIfNecessary:(id)a3 descriptor:(id)a4;
- (id)createWorkflowControllerWithContext:(id)a3;
- (id)progressSubscriber;
- (id)runWorkflowWithRequest:(id)a3 descriptor:(id)a4 completion:(id)a5;
- (void)autoreleaseSelf;
- (void)beginObservingProgressForWorkflowWithRunningContext:(id)a3;
- (void)dispatchWorkflowResultHandlingWithResult:(id)a3;
- (void)handleWorkflowDidStart:(id)a3;
- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4;
- (void)outOfProcessWorkflowController:(id)a3 didFinishWithResult:(id)a4 dialogAttribution:(id)a5 runResidency:(unint64_t)a6;
- (void)outOfProcessWorkflowController:(id)a3 didRequestUpdatedRunViewSource:(id)a4 completionHandler:(id)a5;
- (void)pause;
- (void)prewarmRunner;
- (void)resume;
- (void)retainSelf;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setProgressSubscriber:(id)a3;
- (void)setRunRequest:(id)a3;
- (void)setRunViewSource:(id)a3;
- (void)setWorkflowController:(id)a3;
- (void)start;
- (void)stop;
- (void)stopObservingRunProgress;
- (void)updateRunViewSource:(id)a3;
@end

@implementation WFWorkflowRunnerClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowController, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_runRequest, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong(&self->_progressSubscriber, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_prewarmManager, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
}

- (void)setWorkflowController:(id)a3
{
}

- (WFOutOfProcessWorkflowController)workflowController
{
  return self->_workflowController;
}

- (void)setContext:(id)a3
{
}

- (WFWorkflowRunningContext)context
{
  return self->_context;
}

- (void)setRunRequest:(id)a3
{
}

- (WFWorkflowRunRequest)runRequest
{
  return self->_runRequest;
}

- (void)setDescriptor:(id)a3
{
}

- (WFWorkflowRunDescriptor)descriptor
{
  return self->_descriptor;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setProgressSubscriber:(id)a3
{
}

- (id)progressSubscriber
{
  return self->_progressSubscriber;
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (void)setDelegate:(id)a3
{
}

- (WFWorkflowRunnerClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFWorkflowRunnerClientDelegate *)WeakRetained;
}

- (void)autoreleaseSelf
{
  p_strongSelf = &self->_strongSelf;
  objc_storeStrong((id *)&self->_strongSelf, self->_strongSelf);
  v3 = *p_strongSelf;
  *p_strongSelf = 0;
}

- (void)retainSelf
{
}

- (void)outOfProcessWorkflowController:(id)a3 didRequestUpdatedRunViewSource:(id)a4 completionHandler:(id)a5
{
  v12 = (void (**)(id, void *, void))a5;
  id v7 = a4;
  v8 = [(WFWorkflowRunnerClient *)self runViewSource];
  int v9 = [v8 isEqual:v7];

  if (v9)
  {
    v10 = [(WFWorkflowRunnerClient *)self runViewSource];
    [v10 refresh];

    v11 = [(WFWorkflowRunnerClient *)self runViewSource];
    v12[2](v12, v11, 0);
  }
  else
  {
    v12[2](v12, 0, 0);
  }
}

- (void)outOfProcessWorkflowController:(id)a3 didFinishWithResult:(id)a4 dialogAttribution:(id)a5 runResidency:(unint64_t)a6
{
  [(WFWorkflowRunnerClient *)self dispatchWorkflowResultHandlingWithResult:a4];
  [(WFWorkflowRunnerClient *)self autoreleaseSelf];
}

- (void)stopObservingRunProgress
{
  v3 = [(WFWorkflowRunnerClient *)self context];
  v4 = [(WFWorkflowRunnerClient *)self progressSubscriber];
  [v3 removeProgressSubscriber:v4];

  [(WFWorkflowRunnerClient *)self setProgressSubscriber:0];
}

- (void)beginObservingProgressForWorkflowWithRunningContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"WFWorkflowRunnerClient.m", 303, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__WFWorkflowRunnerClient_beginObservingProgressForWorkflowWithRunningContext___block_invoke;
  aBlock[3] = &unk_1E6076DC8;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  id v7 = [v5 addProgressSubscriberUsingPublishingHandler:v6];
  [(WFWorkflowRunnerClient *)self setProgressSubscriber:v7];
}

void *__78__WFWorkflowRunnerClient_beginObservingProgressForWorkflowWithRunningContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) delegateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__WFWorkflowRunnerClient_beginObservingProgressForWorkflowWithRunningContext___block_invoke_2;
  v7[3] = &unk_1E6079130;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v7);

  return &__block_literal_global_593;
}

uint64_t __78__WFWorkflowRunnerClient_beginObservingProgressForWorkflowWithRunningContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleWorkflowDidStart:*(void *)(a1 + 40)];
}

- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = objc_opt_class();
  int v9 = [v6 error];
  v10 = [v8 underlyingErrorIfRunnerError:v9];

  if (_os_feature_enabled_impl())
  {
    v11 = [(WFWorkflowRunnerClient *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = v6;
      if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if ([v13 hasOutputs])
        {
          v14 = getWFVoiceShortcutClientLogObject();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            v15 = [(WFWorkflowRunnerClient *)self delegate];
            *(_DWORD *)buf = 136315394;
            v47 = "-[WFWorkflowRunnerClient handleWorkflowRunResult:completion:]";
            __int16 v48 = 2112;
            v49 = v15;
            _os_log_impl(&dword_1B3C5C000, v14, OS_LOG_TYPE_DEBUG, "%s Preparing result with outputs for client (%@)", buf, 0x16u);
          }
          v16 = dispatch_get_global_queue(25, 0);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke;
          block[3] = &unk_1E6076D50;
          id v13 = v13;
          id v42 = v13;
          v43 = self;
          id v44 = v10;
          v45 = v7;
          dispatch_async(v16, block);

          v17 = v42;
LABEL_30:

          goto LABEL_31;
        }
      }
      else
      {

        id v13 = 0;
      }
      v34 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        v35 = [(WFWorkflowRunnerClient *)self delegate];
        *(_DWORD *)buf = 136315394;
        v47 = "-[WFWorkflowRunnerClient handleWorkflowRunResult:completion:]";
        __int16 v48 = 2112;
        v49 = v35;
        _os_log_impl(&dword_1B3C5C000, v34, OS_LOG_TYPE_DEBUG, "%s Preparing result without output for client (%@)", buf, 0x16u);
      }
      v17 = [(WFWorkflowRunnerClient *)self delegate];
      objc_msgSend(v17, "workflowRunnerClient:didFinishRunningWorkflowWithAllResults:error:cancelled:", self, 0, v10, objc_msgSend(v13, "isCancelled"));
      goto LABEL_30;
    }
  }
  v18 = [(WFWorkflowRunnerClient *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) == 0)
  {
    v25 = [(WFWorkflowRunnerClient *)self delegate];
    char v26 = objc_opt_respondsToSelector();

    v27 = getWFVoiceShortcutClientLogObject();
    v28 = v27;
    if (v26)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v29 = [(WFWorkflowRunnerClient *)self delegate];
        *(_DWORD *)buf = 136315394;
        v47 = "-[WFWorkflowRunnerClient handleWorkflowRunResult:completion:]";
        __int16 v48 = 2112;
        v49 = v29;
      }
      v28 = [(WFWorkflowRunnerClient *)self delegate];
      -[NSObject workflowRunnerClient:didFinishRunningWorkflowWithError:cancelled:](v28, "workflowRunnerClient:didFinishRunningWorkflowWithError:cancelled:", self, v10, [v6 isCancelled]);
    }
    else if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v33 = [(WFWorkflowRunnerClient *)self delegate];
      *(_DWORD *)buf = 136315394;
      v47 = "-[WFWorkflowRunnerClient handleWorkflowRunResult:completion:]";
      __int16 v48 = 2112;
      v49 = v33;
      _os_log_impl(&dword_1B3C5C000, v28, OS_LOG_TYPE_ERROR, "%s Workflow finished running, but client (%@) does not respond to -workflowRunnerClient:didFinishRunningWorkflowWithError:cancelled: or workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:", buf, 0x16u);
    }
    goto LABEL_25;
  }
  id v20 = v6;
  if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v30 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v31 = [(WFWorkflowRunnerClient *)self delegate];
      *(_DWORD *)buf = 136315394;
      v47 = "-[WFWorkflowRunnerClient handleWorkflowRunResult:completion:]";
      __int16 v48 = 2112;
      v49 = v31;
      _os_log_impl(&dword_1B3C5C000, v30, OS_LOG_TYPE_DEBUG, "%s Delivering workflow run result to client: %@", buf, 0x16u);
    }
    v32 = [(WFWorkflowRunnerClient *)self delegate];
    objc_msgSend(v32, "workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:", self, 0, v10, objc_msgSend(v20, "isCancelled"));

LABEL_25:
    v7[2](v7);
    goto LABEL_31;
  }
  v21 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v22 = [(WFWorkflowRunnerClient *)self delegate];
    *(_DWORD *)buf = 136315394;
    v47 = "-[WFWorkflowRunnerClient handleWorkflowRunResult:completion:]";
    __int16 v48 = 2112;
    v49 = v22;
    _os_log_impl(&dword_1B3C5C000, v21, OS_LOG_TYPE_DEBUG, "%s Preparing output for client (%@)", buf, 0x16u);
  }
  v23 = dispatch_get_global_queue(25, 0);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_94;
  v36[3] = &unk_1E6076D50;
  id v37 = v20;
  v38 = self;
  id v39 = v10;
  v40 = v7;
  id v24 = v20;
  dispatch_async(v23, v36);

LABEL_31:
}

void __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_2;
  v4[3] = &unk_1E6076D28;
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 56);
  [v2 getActionOutputsWithCompletionHandler:v4];
}

void __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_94(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_2_95;
  v4[3] = &unk_1E6076DA0;
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 56);
  [v2 getOutputWithCompletionHandler:v4];
}

void __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_2_95(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) delegateQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_3_96;
  v11[3] = &unk_1E6076D78;
  id v8 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v8;
  id v14 = v6;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

uint64_t __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_3_96(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    int v7 = 136315394;
    id v8 = "-[WFWorkflowRunnerClient handleWorkflowRunResult:completion:]_block_invoke_3";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1B3C5C000, v2, OS_LOG_TYPE_DEFAULT, "%s Delivering workflow run result to client: %@", (uint8_t *)&v7, 0x16u);
  }
  v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v5 = *(void *)(a1 + 48);
  if (!v5) {
    uint64_t v5 = *(void *)(a1 + 56);
  }
  objc_msgSend(v4, "workflowRunnerClient:didFinishRunningWorkflowWithOutput:error:cancelled:", *(void *)(a1 + 32), *(void *)(a1 + 40), v5, objc_msgSend(*(id *)(a1 + 64), "isCancelled"));

  return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) delegateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_3;
  block[3] = &unk_1E6076D00;
  uint64_t v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t __61__WFWorkflowRunnerClient_handleWorkflowRunResult_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    int v6 = 136315394;
    int v7 = "-[WFWorkflowRunnerClient handleWorkflowRunResult:completion:]_block_invoke_3";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B3C5C000, v2, OS_LOG_TYPE_DEFAULT, "%s Delivering workflow run result to client: %@", (uint8_t *)&v6, 0x16u);
  }
  v4 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v4, "workflowRunnerClient:didFinishRunningWorkflowWithAllResults:error:cancelled:", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "isCancelled"));

  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)handleWorkflowDidStart:(id)a3
{
  id v7 = a3;
  v4 = [(WFWorkflowRunnerClient *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    int v6 = [(WFWorkflowRunnerClient *)self delegate];
    [v6 workflowRunnerClient:self didStartRunningWorkflowWithProgress:v7];
  }
}

- (void)dispatchWorkflowResultHandlingWithResult:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = [(WFWorkflowRunnerClient *)self delegate];
    *(_DWORD *)buf = 136315394;
    id v16 = "-[WFWorkflowRunnerClient dispatchWorkflowResultHandlingWithResult:]";
    __int16 v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1B3C5C000, v5, OS_LOG_TYPE_DEBUG, "%s Workflow finished running, preparing to deliver result to client: %@", buf, 0x16u);
  }
  id v7 = getWFVoiceShortcutClientLogObject();
  __int16 v8 = [(WFWorkflowRunnerClient *)self context];
  id v9 = [v8 identifier];
  os_signpost_id_t v10 = [v9 hash];

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B3C5C000, v7, OS_SIGNPOST_INTERVAL_END, v10, "RunWorkflow", "", buf, 2u);
  }

  id v11 = [(WFWorkflowRunnerClient *)self delegateQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__WFWorkflowRunnerClient_dispatchWorkflowResultHandlingWithResult___block_invoke;
  v13[3] = &unk_1E6079130;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  dispatch_async(v11, v13);
}

uint64_t __67__WFWorkflowRunnerClient_dispatchWorkflowResultHandlingWithResult___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__WFWorkflowRunnerClient_dispatchWorkflowResultHandlingWithResult___block_invoke_2;
  v4[3] = &unk_1E6078C68;
  v4[4] = v2;
  return [v2 handleWorkflowRunResult:v1 completion:v4];
}

uint64_t __67__WFWorkflowRunnerClient_dispatchWorkflowResultHandlingWithResult___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopObservingRunProgress];
}

- (id)runWorkflowWithRequest:(id)a3 descriptor:(id)a4 completion:(id)a5
{
  int v6 = -[WFWorkflowRunnerClient createRunningContextFromRequestIfNecessary:descriptor:](self, "createRunningContextFromRequestIfNecessary:descriptor:", a3, a4, a5);
  id v7 = [(WFWorkflowRunnerClient *)self createWorkflowControllerWithContext:v6];
  __int16 v8 = [(WFWorkflowRunnerClient *)self prewarmManager];

  if (v8)
  {
    id v9 = [(WFWorkflowRunnerClient *)self prewarmManager];
    [v9 reset];
  }
  os_signpost_id_t v10 = [(WFWorkflowRunnerClient *)self descriptor];
  id v11 = [(WFWorkflowRunnerClient *)self runRequest];
  id v17 = 0;
  char v12 = [v7 runWorkflowWithDescriptor:v10 request:v11 error:&v17];
  id v13 = v17;

  if (v12)
  {
    id v14 = v6;
  }
  else
  {
    id v15 = [[WFWorkflowRunResult alloc] initWithError:v13];
    [(WFWorkflowRunnerClient *)self dispatchWorkflowResultHandlingWithResult:v15];

    id v14 = 0;
  }

  return v14;
}

- (id)createRunningContextFromRequestIfNecessary:(id)a3 descriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [(WFWorkflowRunnerClient *)self context];

  if (v8)
  {
    id v9 = [(WFWorkflowRunnerClient *)self context];
  }
  else
  {
    os_signpost_id_t v10 = [WFWorkflowRunningContext alloc];
    id v11 = [(WFWorkflowRunnerClient *)self descriptor];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v12 = v11;
      }
      else {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
    id v13 = v12;

    id v14 = [v13 identifier];

    id v9 = [(WFWorkflowRunningContext *)v10 initWithWorkflowIdentifier:v14];
    -[WFWorkflowRunningContext setAllowsDialogNotifications:](v9, "setAllowsDialogNotifications:", [v6 allowsDialogNotifications]);
    id v15 = [v6 runSource];
    [(WFWorkflowRunningContext *)v9 setRunSource:v15];

    id v16 = [v7 kind];
    [(WFWorkflowRunningContext *)v9 setRunKind:v16];

    -[WFWorkflowRunningContext setOutputBehavior:](v9, "setOutputBehavior:", [v6 outputBehavior]);
    id v17 = [v6 runViewSource];
    [(WFWorkflowRunningContext *)v9 setRunViewSource:v17];

    -[WFWorkflowRunningContext setStepwise:](v9, "setStepwise:", [v6 isStepwise]);
    -[WFWorkflowRunningContext setShouldForwardDialogRequests:](v9, "setShouldForwardDialogRequests:", [v6 handlesDialogRequests]);
    -[WFWorkflowRunningContext setShouldForwardSiriActionRequests:](v9, "setShouldForwardSiriActionRequests:", [v6 handlesSiriActionRequests]);
    v18 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v19 = [v18 bundleIdentifier];
    [(WFWorkflowRunningContext *)v9 setOriginatingBundleIdentifier:v19];

    [(WFWorkflowRunnerClient *)self setContext:v9];
  }

  return v9;
}

- (id)createWorkflowControllerWithContext:(id)a3
{
  id v4 = a3;
  char v5 = [(WFWorkflowRunnerClient *)self runRequest];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = [v5 presentationMode];
  if (v7 > 2) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = qword_1B3D88A88[v7];
  }
  if (isKindOfClass) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 0;
  }
  os_signpost_id_t v10 = [WFOutOfProcessWorkflowController alloc];
  id v11 = [(WFWorkflowRunnerClient *)self prewarmManager];
  char v12 = [v11 connection];
  id v13 = [(WFOutOfProcessWorkflowController *)v10 initWithEnvironment:v9 runningContext:v4 presentationMode:v8 existingConnection:v12];

  [(WFOutOfProcessWorkflowController *)v13 setDelegate:self];
  [(WFWorkflowRunnerClient *)self setWorkflowController:v13];

  return v13;
}

- (void)setRunViewSource:(id)a3
{
  id v4 = (WFWorkflowRunViewSource *)a3;
  char v5 = [(WFWorkflowRunnerClient *)self runRequest];
  [v5 setRunViewSource:v4];

  runViewSource = self->_runViewSource;
  self->_runViewSource = v4;
}

- (void)updateRunViewSource:(id)a3
{
  id v4 = a3;
  char v5 = [(WFWorkflowRunnerClient *)self workflowController];
  id v6 = [v4 object];
  [v5 updateRunViewSource:v6];

  id v7 = [v4 object];

  [(WFWorkflowRunnerClient *)self setRunViewSource:v7];
}

- (void)prewarmRunner
{
  id v3 = [(WFWorkflowRunnerClient *)self context];

  if (!v3)
  {
    id v4 = [(WFWorkflowRunnerClient *)self runRequest];
    char v5 = [(WFWorkflowRunnerClient *)self descriptor];
    id v6 = [(WFWorkflowRunnerClient *)self createRunningContextFromRequestIfNecessary:v4 descriptor:v5];
  }
  id v7 = [(WFWorkflowRunnerClient *)self workflowController];

  if (!v7)
  {
    uint64_t v8 = [(WFWorkflowRunnerClient *)self context];
    id v9 = [(WFWorkflowRunnerClient *)self createWorkflowControllerWithContext:v8];
  }
  id v11 = [(WFWorkflowRunnerClient *)self prewarmManager];
  os_signpost_id_t v10 = [(WFWorkflowRunnerClient *)self workflowController];
  [v11 prewarmRunnerWithHostIfNecessary:v10];
}

- (WFRunnerPrewarmManager)prewarmManager
{
  prewarmManager = self->_prewarmManager;
  if (!prewarmManager)
  {
    id v4 = +[WFRunnerPrewarmManager sharedManager];
    char v5 = self->_prewarmManager;
    self->_prewarmManager = v4;

    prewarmManager = self->_prewarmManager;
  }
  return prewarmManager;
}

- (void)pause
{
  id v3 = [(WFWorkflowRunnerClient *)self workflowController];

  if (v3)
  {
    id v4 = [(WFWorkflowRunnerClient *)self workflowController];
    [v4 pauseWorkflowAndWriteStateToDisk];
  }
}

- (void)resume
{
  id v3 = [(WFWorkflowRunnerClient *)self context];

  if (v3)
  {
    id v4 = [(WFWorkflowRunnerClient *)self workflowController];

    if (!v4)
    {
      char v5 = [(WFWorkflowRunnerClient *)self context];
      id v6 = [(WFWorkflowRunnerClient *)self createWorkflowControllerWithContext:v5];
      [(WFWorkflowRunnerClient *)self setWorkflowController:v6];
    }
    id v7 = [(WFWorkflowRunnerClient *)self workflowController];
    uint64_t v8 = [(WFWorkflowRunnerClient *)self runRequest];
    [v7 resumeRunningWithRequest:v8 error:0];

    [(WFWorkflowRunnerClient *)self retainSelf];
  }
}

- (void)stop
{
  id v3 = [(WFWorkflowRunnerClient *)self workflowController];

  if (v3)
  {
    id v4 = [(WFWorkflowRunnerClient *)self workflowController];
    [v4 stop];

    [(WFWorkflowRunnerClient *)self autoreleaseSelf];
  }
}

- (void)start
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = getWFVoiceShortcutClientLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(WFWorkflowRunnerClient *)self descriptor];
    char v5 = [(WFWorkflowRunnerClient *)self runRequest];
    *(_DWORD *)buf = 136315906;
    v29 = "-[WFWorkflowRunnerClient start]";
    __int16 v30 = 2112;
    v31 = self;
    __int16 v32 = 2112;
    v33 = v4;
    __int16 v34 = 2112;
    v35 = v5;
    _os_log_impl(&dword_1B3C5C000, v3, OS_LOG_TYPE_DEFAULT, "%s Starting shortcut run from client: %@, descriptor: %@, request: %@", buf, 0x2Au);
  }
  if ([(WFWorkflowRunnerClient *)self isRunning]) {
    [(WFWorkflowRunnerClient *)self stop];
  }
  id v6 = [(WFWorkflowRunnerClient *)self runRequest];
  id v7 = [(WFWorkflowRunnerClient *)self descriptor];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __31__WFWorkflowRunnerClient_start__block_invoke;
  v27[3] = &unk_1E6076CD8;
  v27[4] = self;
  uint64_t v8 = [(WFWorkflowRunnerClient *)self runWorkflowWithRequest:v6 descriptor:v7 completion:v27];
  [(WFWorkflowRunnerClient *)self setContext:v8];

  id v9 = [(WFWorkflowRunnerClient *)self descriptor];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      os_signpost_id_t v10 = v9;
    }
    else {
      os_signpost_id_t v10 = 0;
    }
  }
  else
  {
    os_signpost_id_t v10 = 0;
  }
  id v11 = v10;

  char v12 = getWFVoiceShortcutClientLogObject();
  id v13 = [(WFWorkflowRunnerClient *)self context];
  id v14 = [v13 identifier];
  os_signpost_id_t v15 = [v14 hash];

  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    uint64_t v16 = [v11 identifier];
    id v17 = (void *)v16;
    if (v16) {
      v18 = (__CFString *)v16;
    }
    else {
      v18 = @"none";
    }
    uint64_t v19 = [v11 name];
    id v20 = (void *)v19;
    if (v19) {
      v21 = (__CFString *)v19;
    }
    else {
      v21 = &stru_1F0C7EBE0;
    }
    v22 = [(WFWorkflowRunnerClient *)self runRequest];
    uint64_t v23 = [v22 runSource];
    id v24 = (void *)v23;
    v25 = @"unknown";
    *(_DWORD *)buf = 138412802;
    v29 = (const char *)v18;
    if (v23) {
      v25 = (__CFString *)v23;
    }
    __int16 v30 = 2112;
    v31 = (WFWorkflowRunnerClient *)v21;
    __int16 v32 = 2112;
    v33 = v25;
    _os_signpost_emit_with_name_impl(&dword_1B3C5C000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RunWorkflow", "WorkflowID=%{signpost.description:attribute}@,WorkflowName=%{signpost.description:attribute}@,RunSource=%{signpost.description:attribute}@", buf, 0x20u);
  }
  char v26 = [(WFWorkflowRunnerClient *)self context];
  [(WFWorkflowRunnerClient *)self beginObservingProgressForWorkflowWithRunningContext:v26];

  [(WFWorkflowRunnerClient *)self retainSelf];
}

uint64_t __31__WFWorkflowRunnerClient_start__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) dispatchWorkflowResultHandlingWithResult:a2];
}

- (BOOL)isRunning
{
  v2 = [(WFWorkflowRunnerClient *)self progressSubscriber];
  BOOL v3 = v2 != 0;

  return v3;
}

- (WFWorkflowRunnerClient)initWithDescriptor:(id)a3 runRequest:(id)a4 delegateQueue:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WFWorkflowRunnerClient.m", 41, @"Invalid parameter not satisfying: %@", @"descriptor" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"WFWorkflowRunnerClient.m", 42, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

LABEL_3:
  v24.receiver = self;
  v24.super_class = (Class)WFWorkflowRunnerClient;
  id v13 = [(WFWorkflowRunnerClient *)&v24 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_descriptor, a3);
    objc_storeStrong((id *)&v14->_runRequest, a4);
    if (v12)
    {
      os_signpost_id_t v15 = (OS_dispatch_queue *)v12;
      delegateQueue = v14->_delegateQueue;
      v14->_delegateQueue = v15;
    }
    else
    {
      delegateQueue = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      dispatch_queue_t v17 = dispatch_queue_create("com.apple.shortcuts.WFWorkflowRunnerClient", delegateQueue);
      v18 = v14->_delegateQueue;
      v14->_delegateQueue = (OS_dispatch_queue *)v17;
    }
    uint64_t v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v14 selector:sel_updateRunViewSource_ name:@"WFWorkflowRunViewSourceUpdatedNotification" object:0];

    id v20 = v14;
  }

  return v14;
}

- (WFWorkflowRunnerClient)initWithDescriptor:(id)a3 runRequest:(id)a4
{
  return [(WFWorkflowRunnerClient *)self initWithDescriptor:a3 runRequest:a4 delegateQueue:0];
}

+ (id)underlyingErrorIfRunnerError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:@"WFBackgroundShortcutRunnerErrorDomain"])
  {
    char v5 = [v3 userInfo];
    uint64_t v6 = *MEMORY[0x1E4F28A50];
    id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    if (v7)
    {
      uint64_t v8 = [v3 userInfo];
      id v9 = [v8 objectForKeyedSubscript:v6];

      goto LABEL_6;
    }
  }
  else
  {
  }
  id v9 = v3;
LABEL_6:

  return v9;
}

@end