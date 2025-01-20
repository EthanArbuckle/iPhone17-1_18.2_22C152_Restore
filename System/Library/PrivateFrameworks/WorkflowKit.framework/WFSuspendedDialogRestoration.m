@interface WFSuspendedDialogRestoration
- (BOOL)presenterShouldShowRequest:(id)a3 runningContext:(id)a4 withCompletionHandler:(id)a5;
- (BOOL)screenDidTurnOffDuringActiveRequest;
- (BOOL)shortcutsAppDidBackgroundDuringActiveRequest;
- (BOOL)shortcutsAppIsForegroundInLayout:(id)a3;
- (FBSDisplayLayoutMonitor)layoutMonitor;
- (WFDialogRequest)suspendedRequest;
- (WFScreenOnObserver)screenOnObserver;
- (WFSuspendedDialogRestoration)initWithUserInterfacePresenter:(id)a3;
- (WFUIPresenter)presenter;
- (WFWorkflowRunningContext)suspendedRunningContext;
- (id)suspendedRequestCompletion;
- (void)beginObservingApplicationState;
- (void)presenterDidReceiveSuspendedResponseForRequest:(id)a3 runningContext:(id)a4 withCompletionHandler:(id)a5;
- (void)reset;
- (void)setLayoutMonitor:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setScreenDidTurnOffDuringActiveRequest:(BOOL)a3;
- (void)setScreenOnObserver:(id)a3;
- (void)setShortcutsAppDidBackgroundDuringActiveRequest:(BOOL)a3;
- (void)setSuspendedRequest:(id)a3;
- (void)setSuspendedRequestCompletion:(id)a3;
- (void)setSuspendedRunningContext:(id)a3;
- (void)stopObservingApplicationState;
@end

@implementation WFSuspendedDialogRestoration

- (void).cxx_destruct
{
  objc_storeStrong(&self->_suspendedRequestCompletion, 0);
  objc_storeStrong((id *)&self->_suspendedRunningContext, 0);
  objc_storeStrong((id *)&self->_suspendedRequest, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_screenOnObserver, 0);
}

- (void)setShortcutsAppDidBackgroundDuringActiveRequest:(BOOL)a3
{
  self->_shortcutsAppDidBackgroundDuringActiveRequest = a3;
}

- (BOOL)shortcutsAppDidBackgroundDuringActiveRequest
{
  return self->_shortcutsAppDidBackgroundDuringActiveRequest;
}

- (void)setScreenDidTurnOffDuringActiveRequest:(BOOL)a3
{
  self->_screenDidTurnOffDuringActiveRequest = a3;
}

- (BOOL)screenDidTurnOffDuringActiveRequest
{
  return self->_screenDidTurnOffDuringActiveRequest;
}

- (void)setSuspendedRequestCompletion:(id)a3
{
}

- (id)suspendedRequestCompletion
{
  return self->_suspendedRequestCompletion;
}

- (void)setSuspendedRunningContext:(id)a3
{
}

- (WFWorkflowRunningContext)suspendedRunningContext
{
  return self->_suspendedRunningContext;
}

- (void)setSuspendedRequest:(id)a3
{
}

- (WFDialogRequest)suspendedRequest
{
  return self->_suspendedRequest;
}

- (void)setLayoutMonitor:(id)a3
{
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (void)setPresenter:(id)a3
{
}

- (WFUIPresenter)presenter
{
  return self->_presenter;
}

- (void)setScreenOnObserver:(id)a3
{
}

- (WFScreenOnObserver)screenOnObserver
{
  return self->_screenOnObserver;
}

- (void)presenterDidReceiveSuspendedResponseForRequest:(id)a3 runningContext:(id)a4 withCompletionHandler:(id)a5
{
  id v9 = a5;
  id v8 = a4;
  [(WFSuspendedDialogRestoration *)self setSuspendedRequest:a3];
  [(WFSuspendedDialogRestoration *)self setSuspendedRunningContext:v8];

  [(WFSuspendedDialogRestoration *)self setSuspendedRequestCompletion:v9];
}

- (BOOL)presenterShouldShowRequest:(id)a3 runningContext:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(WFSuspendedDialogRestoration *)self reset];
  if (![v9 isShortcutsApp]) {
    goto LABEL_7;
  }
  v11 = [(WFSuspendedDialogRestoration *)self layoutMonitor];

  if (v11) {
    [(WFSuspendedDialogRestoration *)self stopObservingApplicationState];
  }
  [(WFSuspendedDialogRestoration *)self beginObservingApplicationState];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(WFSuspendedDialogRestoration *)self setSuspendedRequest:v8];
    [(WFSuspendedDialogRestoration *)self setSuspendedRunningContext:v9];
    [(WFSuspendedDialogRestoration *)self setSuspendedRequestCompletion:v10];
  }
  v12 = [(WFSuspendedDialogRestoration *)self screenOnObserver];
  char v13 = [v12 screenOn];

  if ((v13 & 1) == 0)
  {
    [(WFSuspendedDialogRestoration *)self setScreenDidTurnOffDuringActiveRequest:1];
    BOOL v14 = 0;
  }
  else
  {
LABEL_7:
    BOOL v14 = 1;
  }

  return v14;
}

- (BOOL)shortcutsAppIsForegroundInLayout:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = objc_msgSend(a3, "elements", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = *MEMORY[0x1E4F625B0];
    uint64_t v9 = *MEMORY[0x1E4FB4BE8];
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v3);
      }
      v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
      v12 = [v11 identifier];
      char v13 = [v12 isEqualToString:v8];

      if (v13) {
        break;
      }
      if ([v11 isUIApplicationElement])
      {
        BOOL v14 = [v11 bundleIdentifier];
        char v15 = [v14 isEqualToString:v9];
      }
      else
      {
        char v15 = 0;
      }
      v6 |= v15;
      if (v5 == ++v10)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
  }
  char v6 = 0;
LABEL_14:

  return v6 & 1;
}

- (void)reset
{
  [(WFSuspendedDialogRestoration *)self setScreenDidTurnOffDuringActiveRequest:0];
  [(WFSuspendedDialogRestoration *)self setShortcutsAppDidBackgroundDuringActiveRequest:0];
  [(WFSuspendedDialogRestoration *)self setSuspendedRequest:0];
  [(WFSuspendedDialogRestoration *)self setSuspendedRunningContext:0];
  [(WFSuspendedDialogRestoration *)self setSuspendedRequestCompletion:0];
}

- (void)stopObservingApplicationState
{
  v3 = [(WFSuspendedDialogRestoration *)self layoutMonitor];
  [v3 invalidate];

  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = 0;
}

- (void)beginObservingApplicationState
{
  v3 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
  [v3 setNeedsUserInteractivePriority:1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__WFSuspendedDialogRestoration_beginObservingApplicationState__block_invoke;
  v6[3] = &unk_1E6558988;
  v6[4] = self;
  [v3 setTransitionHandler:v6];
  uint64_t v4 = [MEMORY[0x1E4F62940] monitorWithConfiguration:v3];
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = v4;
}

void __62__WFSuspendedDialogRestoration_beginObservingApplicationState__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = getWFDialogLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[WFSuspendedDialogRestoration beginObservingApplicationState]_block_invoke";
      __int16 v36 = 2112;
      *(void *)v37 = v8;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_INFO, "%s Transitioned to layout: %@", buf, 0x16u);
    }

    v11 = [*(id *)(a1 + 32) screenOnObserver];
    int v12 = [v11 screenOn];

    if (([*(id *)(a1 + 32) screenDidTurnOffDuringActiveRequest] & 1) == 0 && (v12 & 1) == 0)
    {
      char v13 = getWFDialogLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[WFSuspendedDialogRestoration beginObservingApplicationState]_block_invoke";
        _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_DEFAULT, "%s Screen did turn off during active request", buf, 0xCu);
      }

      [*(id *)(a1 + 32) setScreenDidTurnOffDuringActiveRequest:1];
    }
    int v14 = [*(id *)(a1 + 32) shortcutsAppIsForegroundInLayout:v8];
    if (([*(id *)(a1 + 32) shortcutsAppDidBackgroundDuringActiveRequest] & 1) == 0 && (v14 & 1) == 0)
    {
      char v15 = getWFDialogLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[WFSuspendedDialogRestoration beginObservingApplicationState]_block_invoke";
        _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_DEFAULT, "%s Shortcuts app did background during active request", buf, 0xCu);
      }

      [*(id *)(a1 + 32) setShortcutsAppDidBackgroundDuringActiveRequest:1];
    }
    if ([*(id *)(a1 + 32) screenDidTurnOffDuringActiveRequest]) {
      int v16 = 0;
    }
    else {
      int v16 = [*(id *)(a1 + 32) shortcutsAppDidBackgroundDuringActiveRequest] ^ 1;
    }
    long long v17 = getWFDialogLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = v16;
      int v18 = v14;
      id v19 = v8;
      int v20 = v12;
      id v21 = v9;
      id v22 = v7;
      int v23 = [*(id *)(a1 + 32) screenDidTurnOffDuringActiveRequest];
      int v24 = [*(id *)(a1 + 32) shortcutsAppDidBackgroundDuringActiveRequest];
      v25 = [*(id *)(a1 + 32) suspendedRequest];
      *(_DWORD *)buf = 136316418;
      v35 = "-[WFSuspendedDialogRestoration beginObservingApplicationState]_block_invoke";
      __int16 v36 = 1024;
      *(_DWORD *)v37 = v23;
      id v7 = v22;
      id v9 = v21;
      int v12 = v20;
      id v8 = v19;
      int v14 = v18;
      int v16 = v33;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v24;
      __int16 v38 = 1024;
      int v39 = v12;
      __int16 v40 = 1024;
      int v41 = v14;
      __int16 v42 = 2112;
      v43 = v25;
      _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_DEFAULT, "%s Deciding if we should bring back the dialog: screenDidTurnOff: %i, appDidBackground: %i, displayIsOn: %i, shortcutsAppIsVisible: %i, suspended request: %@", buf, 0x2Eu);
    }
    if (((v12 & v14 ^ 1 | v16) & 1) == 0)
    {
      v26 = [*(id *)(a1 + 32) suspendedRequest];

      if (v26)
      {
        v27 = getWFDialogLogObject();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = [*(id *)(a1 + 32) suspendedRequest];
          *(_DWORD *)buf = 136315394;
          v35 = "-[WFSuspendedDialogRestoration beginObservingApplicationState]_block_invoke";
          __int16 v36 = 2112;
          *(void *)v37 = v28;
          _os_log_impl(&dword_1C7F0A000, v27, OS_LOG_TYPE_DEFAULT, "%s Bringing back suspended dialog: %@", buf, 0x16u);
        }
        v29 = [*(id *)(a1 + 32) presenter];
        v30 = [*(id *)(a1 + 32) suspendedRequest];
        v31 = [*(id *)(a1 + 32) suspendedRunningContext];
        v32 = [*(id *)(a1 + 32) suspendedRequestCompletion];
        [v29 showDialogRequest:v30 runningContext:v31 completionHandler:v32];
      }
    }
  }
}

- (WFSuspendedDialogRestoration)initWithUserInterfacePresenter:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFSuspendedDialogRestoration;
  char v6 = [(WFSuspendedDialogRestoration *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_presenter, a3);
    id v8 = objc_alloc_init(WFScreenOnObserver);
    screenOnObserver = v7->_screenOnObserver;
    v7->_screenOnObserver = v8;

    [(WFScreenOnObserver *)v7->_screenOnObserver start];
    *(_WORD *)&v7->_screenDidTurnOffDuringActiveRequest = 0;
    uint64_t v10 = v7;
  }

  return v7;
}

@end