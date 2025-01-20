@interface WFRelevanceEngineRunnerClient
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (INIntent)intent;
- (NSXPCListener)dialogRequestListener;
- (WFRelevanceEngineRunnerClient)initWithIntent:(id)a3 delegateQueue:(id)a4;
- (id)intentExecutorIntentResponseFromError:(id)a3;
- (void)dismissPresentedContentForRunningContext:(id)a3 completionHandler:(id)a4;
- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4;
- (void)openURL:(id)a3 completionHandler:(id)a4;
- (void)showDialogRequest:(id)a3 runningContext:(id)a4 completionHandler:(id)a5;
- (void)start;
- (void)stop;
@end

@implementation WFRelevanceEngineRunnerClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogRequestListener, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

- (NSXPCListener)dialogRequestListener
{
  return self->_dialogRequestListener;
}

- (INIntent)intent
{
  return self->_intent;
}

- (id)intentExecutorIntentResponseFromError:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 domain];
    int v7 = [v6 isEqualToString:@"WFIntentExecutorErrorDomain"];

    v8 = [v5 userInfo];
    v9 = v8;
    if (v7)
    {
      id v10 = [v8 objectForKeyedSubscript:@"WFIntentExecutorIntentResponseErrorKey"];

      if (v10)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v11 = v10;
        }
        else {
          v11 = 0;
        }
      }
      else
      {
        v11 = 0;
      }
      id v15 = v11;
    }
    else
    {
      v13 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      if (v13)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v14 = v13;
        }
        else {
          v14 = 0;
        }
      }
      else
      {
        v14 = 0;
      }
      id v10 = v14;

      id v15 = [(WFRelevanceEngineRunnerClient *)self intentExecutorIntentResponseFromError:v10];
    }
    v12 = v15;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28C58];
  id v6 = a4;
  id v7 = [v5 wfUnsupportedUserInterfaceError];
  (*((void (**)(id, void, id))a4 + 2))(v6, MEMORY[0x1E4F1CC38], v7);
}

- (void)showDialogRequest:(id)a3 runningContext:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  if (!v11) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [v11 interaction];
    v13 = [v12 intentResponse];

    v14 = [v11 promptForDisplay];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __84__WFRelevanceEngineRunnerClient_showDialogRequest_runningContext_completionHandler___block_invoke;
    aBlock[3] = &unk_1E6558678;
    id v37 = v10;
    id v15 = (void (**)(void))_Block_copy(aBlock);
    v16 = [(WFWorkflowRunnerClient *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      v18 = [(WFWorkflowRunnerClient *)self delegateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __84__WFRelevanceEngineRunnerClient_showDialogRequest_runningContext_completionHandler___block_invoke_2;
      block[3] = &unk_1E65586A0;
      block[4] = self;
      id v33 = v13;
      id v34 = v14;
      v35 = v15;
      dispatch_async(v18, block);
    }
    else
    {
      v15[2](v15);
    }

    goto LABEL_13;
  }

  id v19 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_8:

    v26 = (void *)[objc_alloc(MEMORY[0x1E4FB46E0]) initWithResponseCode:4];
    (*((void (**)(id, void *, void))v10 + 2))(v10, v26, 0);

    goto LABEL_13;
  }
  v20 = [v19 interaction];
  v21 = [v20 intentResponse];

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __84__WFRelevanceEngineRunnerClient_showDialogRequest_runningContext_completionHandler___block_invoke_3;
  v30[3] = &unk_1E6558678;
  id v31 = v10;
  v22 = (void (**)(void))_Block_copy(v30);
  v23 = [(WFWorkflowRunnerClient *)self delegate];
  char v24 = objc_opt_respondsToSelector();

  if (v24)
  {
    v25 = [(WFWorkflowRunnerClient *)self delegateQueue];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __84__WFRelevanceEngineRunnerClient_showDialogRequest_runningContext_completionHandler___block_invoke_4;
    v27[3] = &unk_1E6557D28;
    v27[4] = self;
    id v28 = v21;
    v29 = v22;
    dispatch_async(v25, v27);
  }
  else
  {
    v22[2](v22);
  }

LABEL_13:
}

void __84__WFRelevanceEngineRunnerClient_showDialogRequest_runningContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)[objc_alloc(MEMORY[0x1E4FB4630]) initWithInteractionResponseCode:1];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void __84__WFRelevanceEngineRunnerClient_showDialogRequest_runningContext_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 relevanceEngineRunnerClient:*(void *)(a1 + 32) didReceiveConfirmResponse:*(void *)(a1 + 40) prompt:*(void *)(a1 + 48) proceedHandler:*(void *)(a1 + 56)];
}

void __84__WFRelevanceEngineRunnerClient_showDialogRequest_runningContext_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)[objc_alloc(MEMORY[0x1E4FB4748]) initWithInteractionResponseCode:0];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

void __84__WFRelevanceEngineRunnerClient_showDialogRequest_runningContext_completionHandler___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 relevanceEngineRunnerClient:*(void *)(a1 + 32) didReceiveHandleResponse:*(void *)(a1 + 40) proceedHandler:*(void *)(a1 + 48)];
}

- (void)dismissPresentedContentForRunningContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a4;
  v5 = getWFRelevanceEngineLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[WFRelevanceEngineRunnerClient dismissPresentedContentForRunningContext:completionHandler:]";
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_INFO, "%s dismissPresentedContentForRunningContext:completionHandler called", (uint8_t *)&v6, 0xCu);
  }

  v4[2](v4, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = WFUIPresenterXPCInterface();
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  [v5 resume];
  id v7 = getWFRelevanceEngineLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[WFRelevanceEngineRunnerClient listener:shouldAcceptNewConnection:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_INFO, "%s Accepted connection from BackgroundShortcutRunner, connection = %@", (uint8_t *)&v9, 0x16u);
  }

  return 1;
}

- (void)handleWorkflowRunResult:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 error];
  int v9 = [(WFRelevanceEngineRunnerClient *)self intentExecutorIntentResponseFromError:v8];
  if (v9)
  {
    id v10 = [v8 userInfo];
    __int16 v11 = (void *)[v10 mutableCopy];

    [v11 setObject:v9 forKeyedSubscript:@"WFRelevanceEngineRunnerClientIntentResponseErrorKey"];
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = [v8 domain];
    uint64_t v14 = objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, objc_msgSend(v8, "code"), v11);

    uint64_t v8 = (void *)v14;
  }
  id v15 = [v6 resultBySettingError:v8];
  v16.receiver = self;
  v16.super_class = (Class)WFRelevanceEngineRunnerClient;
  [(WFWorkflowRunnerClient *)&v16 handleWorkflowRunResult:v15 completion:v7];
}

- (void)stop
{
  v4.receiver = self;
  v4.super_class = (Class)WFRelevanceEngineRunnerClient;
  [(WFWorkflowRunnerClient *)&v4 stop];
  v3 = [(WFRelevanceEngineRunnerClient *)self dialogRequestListener];
  [v3 invalidate];
}

- (void)start
{
  v3 = [(WFRelevanceEngineRunnerClient *)self dialogRequestListener];
  [v3 resume];

  v4.receiver = self;
  v4.super_class = (Class)WFRelevanceEngineRunnerClient;
  [(WFWorkflowRunnerClient *)&v4 start];
}

- (WFRelevanceEngineRunnerClient)initWithIntent:(id)a3 delegateQueue:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = objc_alloc(MEMORY[0x1E4FB4A40]);
      id v12 = [v10 workflow];
      uint64_t v13 = [v12 vocabularyIdentifier];
      uint64_t v14 = [v10 workflow];
      id v15 = [v14 spokenPhrase];
      objc_super v16 = (void *)[v11 initWithIdentifier:v13 name:v15];

      goto LABEL_6;
    }
  }
  else
  {
    char v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFRelevanceEngineRunnerClient.m", 41, @"Invalid parameter not satisfying: %@", @"intent" object file lineNumber description];
  }
  id v18 = objc_alloc(MEMORY[0x1E4FB4750]);
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F30738]) initWithIntent:v8];
  objc_super v16 = (void *)[v18 initWithShortcut:v12];
  id v10 = 0;
LABEL_6:

  id v19 = [MEMORY[0x1E4F29290] anonymousListener];
  [v19 setDelegate:self];
  v20 = (void *)[objc_alloc(MEMORY[0x1E4FB4A78]) initWithInput:0 presentationMode:3];
  [v20 setRunSource:*MEMORY[0x1E4FB4F98]];
  v21 = [v19 endpoint];
  [v20 setRemoteDialogPresenterEndpoint:v21];

  [v20 setAllowsDialogNotifications:0];
  v26.receiver = self;
  v26.super_class = (Class)WFRelevanceEngineRunnerClient;
  v22 = [(WFWorkflowRunnerClient *)&v26 initWithDescriptor:v16 runRequest:v20 delegateQueue:v9];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_intent, a3);
    objc_storeStrong((id *)&v23->_dialogRequestListener, v19);
    char v24 = v23;
  }

  return v23;
}

@end