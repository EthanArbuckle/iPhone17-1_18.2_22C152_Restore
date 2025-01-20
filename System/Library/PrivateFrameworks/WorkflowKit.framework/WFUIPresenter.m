@interface WFUIPresenter
+ (WFUIPresenter)defaultPresenter;
- (BOOL)showWebPage:(id)a3 completionHandler:(id)a4;
- (NSXPCListenerEndpoint)endpoint;
- (WFUIPresenter)initWithConnection:(id)a3;
- (WFUIPresenterConnection)connection;
- (WFUIPresenterDelegate)delegate;
- (void)applicationWillLaunchInForegroundForRunningContext:(id)a3 isLastAction:(id)a4;
- (void)beginPersistentModeWithRunningContext:(id)a3 attribution:(id)a4 completionHandler:(id)a5;
- (void)completePersistentModeWithSuccess:(id)a3 runningContext:(id)a4 completionHandler:(id)a5;
- (void)dismissPresentedContentForRunningContext:(id)a3 completionHandler:(id)a4;
- (void)pauseDialogPresentationForDuration:(id)a3 withCompletionHandler:(id)a4;
- (void)presenterRequestedUpdatedRunViewSource:(id)a3 completionHandler:(id)a4;
- (void)presenterRequestedWorkflowPauseForContext:(id)a3 dialogRequest:(id)a4 completionHandler:(id)a5;
- (void)presenterRequestedWorkflowStopForContext:(id)a3;
- (void)resumeDialogPresentationWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)showDialogRequest:(id)a3 runningContext:(id)a4 completionHandler:(id)a5;
- (void)updateAttribution:(id)a3 runningContext:(id)a4;
- (void)updateRunViewSource:(id)a3;
@end

@implementation WFUIPresenter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (WFUIPresenterConnection)connection
{
  return self->_connection;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setDelegate:(id)a3
{
}

- (WFUIPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFUIPresenterDelegate *)WeakRetained;
}

- (void)presenterRequestedUpdatedRunViewSource:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(WFUIPresenter *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [(WFUIPresenter *)self delegate];
    [v9 presenterRequestedUpdatedRunViewSource:v10 completionHandler:v6];
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)presenterRequestedWorkflowPauseForContext:(id)a3 dialogRequest:(id)a4 completionHandler:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  v9 = (void (**)(id, void))a5;
  id v10 = [(WFUIPresenter *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    v12 = [(WFUIPresenter *)self delegate];
    [v12 presenterRequestedWorkflowPauseForContext:v13 dialogRequest:v8];
  }
  v9[2](v9, 0);
}

- (void)presenterRequestedWorkflowStopForContext:(id)a3
{
  id v7 = a3;
  v4 = [(WFUIPresenter *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WFUIPresenter *)self delegate];
    [v6 presenterRequestedWorkflowStopForContext:v7];
  }
}

- (BOOL)showWebPage:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFUIPresenter *)self connection];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(WFUIPresenter *)self connection];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __47__WFUIPresenter_showWebPage_completionHandler___block_invoke;
    v18[3] = &unk_1E6555300;
    char v11 = v7;
    v19 = v11;
    v12 = [v10 synchronousPresenterWithErrorHandler:v18];

    BOOL v13 = v12 != 0;
    if (v12)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __47__WFUIPresenter_showWebPage_completionHandler___block_invoke_2;
      v16[3] = &unk_1E654EE98;
      v17 = v11;
      [v12 openURL:v6 completionHandler:v16];
    }
    v14 = v19;
  }
  else
  {
    v14 = getWFDialogLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[WFUIPresenter showWebPage:completionHandler:]";
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_ERROR, "%s Unable to show web page, because the presenter does not offer a synchronous presenter", buf, 0xCu);
    }
    BOOL v13 = 0;
  }

  return v13;
}

uint64_t __47__WFUIPresenter_showWebPage_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__WFUIPresenter_showWebPage_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 BOOLValue], v5);
}

- (void)dismissPresentedContentForRunningContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(WFUIPresenter *)self connection];
  char v9 = [v8 isConnected];

  if (v9)
  {
    id v10 = [(WFUIPresenter *)self connection];
    char v11 = [v10 presenterWithErrorHandler:&__block_literal_global_207];

    if (v11)
    {
      uint64_t v12 = [(WFUIPresenter *)self delegate];
      if (v12)
      {
        BOOL v13 = (void *)v12;
        v14 = [(WFUIPresenter *)self delegate];
        char v15 = objc_opt_respondsToSelector();

        if (v15)
        {
          v16 = [(WFUIPresenter *)self delegate];
          [v16 presenterWillDismissPresentedContent];
        }
      }
      [v11 dismissPresentedContentForRunningContext:v6 completionHandler:v7];
    }
    else
    {
      v18 = WFRunnerFailureErrorMessage(0);
      v7[2](v7, v18);
    }
  }
  else
  {
    v17 = getWFDialogLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      v20 = "-[WFUIPresenter dismissPresentedContentForRunningContext:completionHandler:]";
      _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_DEFAULT, "%s Not reaching out to UI for dismissal, this shortcut hasn't presented any UI", (uint8_t *)&v19, 0xCu);
    }

    v7[2](v7, 0);
  }
}

void __76__WFUIPresenter_dismissPresentedContentForRunningContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    v3 = getWFDialogLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[WFUIPresenter dismissPresentedContentForRunningContext:completionHandler:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_ERROR, "%s Failed to dismiss presented content: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)applicationWillLaunchInForegroundForRunningContext:(id)a3 isLastAction:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WFUIPresenter *)self connection];
  char v9 = [v8 presenterWithErrorHandler:&__block_literal_global_205];

  if (v9)
  {
    [v9 applicationWillLaunchInForegroundForRunningContext:v6 isLastAction:v7];
  }
  else
  {
    id v10 = getWFDialogLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[WFUIPresenter applicationWillLaunchInForegroundForRunningContext:isLastAction:]";
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Did not get a UI presenter to update the run view source.", (uint8_t *)&v11, 0xCu);
    }
  }
}

void __81__WFUIPresenter_applicationWillLaunchInForegroundForRunningContext_isLastAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    v3 = getWFDialogLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[WFUIPresenter applicationWillLaunchInForegroundForRunningContext:isLastAction:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_ERROR, "%s Presenter connection failed with error (beginPersistentModeWithRunningContext): %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)updateAttribution:(id)a3 runningContext:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WFUIPresenter *)self connection];
  char v9 = [v8 presenterWithErrorHandler:&__block_literal_global_203];

  if (v9)
  {
    [v9 updateAttribution:v6 runningContext:v7];
  }
  else
  {
    id v10 = getWFDialogLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      uint64_t v12 = "-[WFUIPresenter updateAttribution:runningContext:]";
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Did not get a UI presenter to update the run view source.", (uint8_t *)&v11, 0xCu);
    }
  }
}

void __50__WFUIPresenter_updateAttribution_runningContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    v3 = getWFDialogLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[WFUIPresenter updateAttribution:runningContext:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_ERROR, "%s Presenter connection failed with error (beginPersistentModeWithRunningContext): %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)showDialogRequest:(id)a3 runningContext:(id)a4 completionHandler:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(WFUIPresenter *)self connection];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __68__WFUIPresenter_showDialogRequest_runningContext_completionHandler___block_invoke;
  v35[3] = &unk_1E6555300;
  id v12 = v10;
  id v36 = v12;
  uint64_t v13 = [v11 presenterWithErrorHandler:v35];

  if (!v13)
  {
    v25 = (void *)[objc_alloc(MEMORY[0x1E4FB46E0]) initWithResponseCode:1];
    (*((void (**)(id, void *, void))v12 + 2))(v12, v25, 0);
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v14 = [(WFUIPresenter *)self delegate];
  if (v14)
  {
    char v15 = (void *)v14;
    v16 = [(WFUIPresenter *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      v18 = [(WFUIPresenter *)self delegate];
      char v19 = [v18 presenterShouldShowRequest:v8 runningContext:v9 withCompletionHandler:v12];

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = [(WFUIPresenter *)self delegate];
        if (v20)
        {
          uint64_t v21 = (void *)v20;
          uint64_t v22 = [(WFUIPresenter *)self delegate];
          char v23 = objc_opt_respondsToSelector();

          if (v23)
          {
            v24 = getWFDialogLogObject();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v38 = "-[WFUIPresenter showDialogRequest:runningContext:completionHandler:]";
              __int16 v39 = 2112;
              id v40 = v9;
              _os_log_impl(&dword_1C7F0A000, v24, OS_LOG_TYPE_DEFAULT, "%s Workflow (%@) is running from the app and the display is off, we need to suspend the request before we pass it to the presenter", buf, 0x16u);
            }

            v25 = [(WFUIPresenter *)self delegate];
            [v25 presenterDidReceiveSuspendedResponseForRequest:v8 runningContext:v9 withCompletionHandler:v12];
            goto LABEL_15;
          }
        }
      }
    }
  }
  uint64_t v26 = [(WFUIPresenter *)self delegate];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = [(WFUIPresenter *)self delegate];
    char v29 = objc_opt_respondsToSelector();

    if (v29)
    {
      v30 = [(WFUIPresenter *)self delegate];
      [v30 presenterWillShowRequest:v8 runningContext:v9];
    }
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __68__WFUIPresenter_showDialogRequest_runningContext_completionHandler___block_invoke_200;
  v31[3] = &unk_1E654C9A0;
  v31[4] = self;
  id v32 = v8;
  id v33 = v9;
  id v34 = v12;
  [v13 showDialogRequest:v32 runningContext:v33 completionHandler:v31];

LABEL_16:
}

void __68__WFUIPresenter_showDialogRequest_runningContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = getWFDialogLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      id v8 = "-[WFUIPresenter showDialogRequest:runningContext:completionHandler:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_ERROR, "%s Presenter connection failed with error (showDialogRequest): %@", (uint8_t *)&v7, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  __int16 v6 = (void *)[objc_alloc(MEMORY[0x1E4FB46E0]) initWithResponseCode:1];
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v6, v3);
}

void __68__WFUIPresenter_showDialogRequest_runningContext_completionHandler___block_invoke_200(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 responseCode] == 3)
  {
    uint64_t v7 = [*(id *)(a1 + 32) delegate];
    if (v7)
    {
      id v8 = (void *)v7;
      __int16 v9 = [*(id *)(a1 + 32) delegate];
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        uint64_t v11 = [*(id *)(a1 + 32) delegate];
        [v11 presenterDidReceiveSuspendedResponseForRequest:*(void *)(a1 + 40) runningContext:*(void *)(a1 + 48) withCompletionHandler:*(void *)(a1 + 56)];
LABEL_12:
      }
    }
  }
  else
  {
    if (!v5)
    {
      uint64_t v13 = getWFWorkflowExecutionLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v15 = 136315394;
        v16 = "-[WFUIPresenter showDialogRequest:runningContext:completionHandler:]_block_invoke";
        __int16 v17 = 2112;
        id v18 = v6;
        _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Show dialog request failed with error: %@", (uint8_t *)&v15, 0x16u);
      }

      uint64_t v14 = *(void *)(a1 + 56);
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB46E0]) initWithResponseCode:1];
      (*(void (**)(uint64_t, void *, id))(v14 + 16))(v14, v11, v6);
      goto LABEL_12;
    }
    id v12 = getWFDialogLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      v16 = "-[WFUIPresenter showDialogRequest:runningContext:completionHandler:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_DEFAULT, "%s Received dialog response: %@", (uint8_t *)&v15, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)updateRunViewSource:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WFUIPresenter *)self connection];
  id v6 = [v5 presenterWithErrorHandler:&__block_literal_global_192];

  if (v6)
  {
    [v6 updateRunViewSource:v4];
  }
  else
  {
    uint64_t v7 = getWFDialogLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      __int16 v9 = "-[WFUIPresenter updateRunViewSource:]";
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Did not get a UI presenter to update the run view source.", (uint8_t *)&v8, 0xCu);
    }
  }
}

void __37__WFUIPresenter_updateRunViewSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = getWFDialogLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[WFUIPresenter updateRunViewSource:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_ERROR, "%s Presenter connection failed with error (beginPersistentModeWithRunningContext): %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)completePersistentModeWithSuccess:(id)a3 runningContext:(id)a4 completionHandler:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  __int16 v9 = (void (**)(id, void *))a5;
  uint64_t v10 = [(WFUIPresenter *)self connection];
  uint64_t v11 = [v10 presenterWithErrorHandler:&__block_literal_global_190];

  if (v11)
  {
    [v11 completePersistentModeWithSuccess:v13 runningContext:v8 completionHandler:v9];
  }
  else
  {
    id v12 = WFRunnerFailureErrorMessage(0);
    v9[2](v9, v12);
  }
}

void __84__WFUIPresenter_completePersistentModeWithSuccess_runningContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = getWFDialogLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[WFUIPresenter completePersistentModeWithSuccess:runningContext:completionHandler:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_ERROR, "%s Presenter connection failed with error (completePersistentModeWithSuccess): %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)beginPersistentModeWithRunningContext:(id)a3 attribution:(id)a4 completionHandler:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  __int16 v9 = (void (**)(id, void *))a5;
  uint64_t v10 = [(WFUIPresenter *)self connection];
  uint64_t v11 = [v10 presenterWithErrorHandler:&__block_literal_global_188];

  if (v11)
  {
    [v11 beginPersistentModeWithRunningContext:v13 attribution:v8 completionHandler:v9];
  }
  else
  {
    id v12 = WFRunnerFailureErrorMessage(0);
    v9[2](v9, v12);
  }
}

void __85__WFUIPresenter_beginPersistentModeWithRunningContext_attribution_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = getWFDialogLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[WFUIPresenter beginPersistentModeWithRunningContext:attribution:completionHandler:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_ERROR, "%s Presenter connection failed with error (beginPersistentModeWithRunningContext): %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)resumeDialogPresentationWithCompletionHandler:(id)a3
{
  id v7 = (void (**)(id, void *))a3;
  int v4 = [(WFUIPresenter *)self connection];
  id v5 = [v4 presenterWithErrorHandler:&__block_literal_global_186];

  if (v5)
  {
    [v5 resumeDialogPresentationWithCompletionHandler:v7];
  }
  else
  {
    __int16 v6 = WFRunnerFailureErrorMessage(0);
    v7[2](v7, v6);
  }
}

void __63__WFUIPresenter_resumeDialogPresentationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = getWFDialogLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[WFUIPresenter resumeDialogPresentationWithCompletionHandler:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_ERROR, "%s Presenter connection failed with error (resumeDialogPresentation): %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)pauseDialogPresentationForDuration:(id)a3 withCompletionHandler:(id)a4
{
  id v10 = a3;
  __int16 v6 = (void (**)(id, void *))a4;
  id v7 = [(WFUIPresenter *)self connection];
  uint64_t v8 = [v7 presenterWithErrorHandler:&__block_literal_global_625];

  if (v8)
  {
    [v8 pauseDialogPresentationForDuration:v10 withCompletionHandler:v6];
  }
  else
  {
    __int16 v9 = WFRunnerFailureErrorMessage(0);
    v6[2](v6, v9);
  }
}

void __74__WFUIPresenter_pauseDialogPresentationForDuration_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = getWFDialogLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[WFUIPresenter pauseDialogPresentationForDuration:withCompletionHandler:]_block_invoke";
      __int16 v6 = 2112;
      id v7 = v2;
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_ERROR, "%s Presenter connection failed with error (pauseDialogPresentation): %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (WFUIPresenter)initWithConnection:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"WFUIPresenter.m", 45, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)WFUIPresenter;
  id v7 = [(WFUIPresenter *)&v11 init];
  if (v7)
  {
    if (objc_opt_respondsToSelector()) {
      [v6 setHost:v7];
    }
    objc_storeStrong((id *)&v7->_connection, a3);
    uint64_t v8 = v7;
  }

  return v7;
}

+ (WFUIPresenter)defaultPresenter
{
  id v2 = objc_alloc((Class)a1);
  id v3 = objc_opt_new();
  int v4 = (void *)[v2 initWithConnection:v3];

  return (WFUIPresenter *)v4;
}

@end