@interface WFDialogPresentationManager
- (BOOL)completePersistentModeAwaitingRemoteAlertReactivationSuccess;
- (BOOL)hasPersistentState;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)queue_hasMoreDialogsToPresent;
- (BOOL)shouldShowStatus;
- (NSMutableArray)attributionsAwaitingStatusPresentation;
- (NSMutableArray)contentDismissalCompletionHandlers;
- (NSMutableArray)contextsAwaitingStatusPresentation;
- (NSMutableArray)otherPresentationQueue;
- (NSMutableArray)persistentPresentationQueue;
- (NSMutableSet)connectedRunners;
- (NSString)dismissalReason;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (RBSAssertion)statusPresenterAssertion;
- (WFDialogAlertPresenter)remoteAlertPresenter;
- (WFDialogAlertPresenter)statusPresenter;
- (WFDialogAttribution)persistentRunningAttribution;
- (WFDialogNotificationManager)notificationManager;
- (WFDialogPresentationManager)initWithListener:(id)a3 notificationManager:(id)a4 dialogAlertPresenter:(id)a5 screenOnObserver:(id)a6;
- (WFDialogPresentationManager)initWithNotificationManager:(id)a3;
- (WFDialogPresentationManagerDelegate)delegate;
- (WFDialogXPCProtocol)connectedRemoteAlert;
- (WFPresentedDialog)presentedDialog;
- (WFScreenOnObserver)screenOnObserver;
- (WFWorkflowRunningContext)persistentRunningContext;
- (WFWorkflowStatusProtocol)connectedStatusPresenter;
- (id)completePersistentModeBlockAwaitingRemoteAlertReactivation;
- (void)acquireStatusPresenterAssertionIfNecessary;
- (void)activateRemoteAlert;
- (void)activateRemoteAlertTiedToBundleIdentifier:(id)a3;
- (void)activateStatusPresenter;
- (void)assertion:(id)a3 didInvalidateWithError:(id)a4;
- (void)beginConnection;
- (void)beginPersistentModeWithRunningContext:(id)a3 attribution:(id)a4 completionHandler:(id)a5;
- (void)cancelWorkflow;
- (void)completePersistentModeWithSuccess:(id)a3 runningContext:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)dialogAlertPresenter:(id)a3 didConnectToAlert:(id)a4;
- (void)dialogAlertPresenterDidDeactivateAlert:(id)a3;
- (void)dialogAlertPresenterDidDisconnectFromAlert:(id)a3;
- (void)dialogAlertPresenterDidInvalidateAlert:(id)a3;
- (void)dismissPersistentChromeInDialog:(id)a3 success:(BOOL)a4 customAttribution:(id)a5 completionHandler:(id)a6;
- (void)dismissPresentedContentForRunningContext:(id)a3 completionHandler:(id)a4;
- (void)handleRemovedIgnoredNotifications:(id)a3;
- (void)logFinishDialogPresentationWithPresentedDialog:(id)a3;
- (void)logFinishDialogPresentationWithRequest:(id)a3 presentationMode:(unint64_t)a4 automationType:(id)a5;
- (void)logStartDialogPresentationWithRequest:(id)a3 presentationMode:(unint64_t)a4;
- (void)postNotificationWithRequest:(id)a3 presentationMode:(unint64_t)a4 context:(id)a5;
- (void)queue_clearPersistentModeStateIfNecessary;
- (void)queue_connectedRemoteAlertDidDisconnect;
- (void)queue_deactivateRemoteAlertAndInvalidateConnection;
- (void)queue_presentNextDialog;
- (void)requestDismissalWithReason:(id)a3;
- (void)screenOnStateDidChange:(id)a3;
- (void)setCompletePersistentModeAwaitingRemoteAlertReactivationSuccess:(BOOL)a3;
- (void)setCompletePersistentModeBlockAwaitingRemoteAlertReactivation:(id)a3;
- (void)setConnectedRemoteAlert:(id)a3;
- (void)setConnectedStatusPresenter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissalReason:(id)a3;
- (void)setPersistentRunningAttribution:(id)a3;
- (void)setPersistentRunningContext:(id)a3;
- (void)setPresentedDialog:(id)a3;
- (void)setStatusPresenterAssertion:(id)a3;
- (void)showDialogRequest:(id)a3 runningContext:(id)a4 completionHandler:(id)a5;
- (void)statusPresenterDidConnectToService:(id)a3;
- (void)statusPresenterDidDisconnect;
- (void)trackDialogEventWithKey:(id)a3 request:(id)a4 presentationMode:(unint64_t)a5 automationType:(id)a6;
- (void)trackSuspendShortcutWithPresentedDialog:(id)a3;
- (void)workflowStatusHostBeginConnection;
@end

@implementation WFDialogPresentationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissalReason, 0);
  objc_storeStrong(&self->_completePersistentModeBlockAwaitingRemoteAlertReactivation, 0);
  objc_storeStrong((id *)&self->_screenOnObserver, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_otherPresentationQueue, 0);
  objc_storeStrong((id *)&self->_persistentPresentationQueue, 0);
  objc_storeStrong((id *)&self->_persistentRunningAttribution, 0);
  objc_storeStrong((id *)&self->_persistentRunningContext, 0);
  objc_storeStrong((id *)&self->_attributionsAwaitingStatusPresentation, 0);
  objc_storeStrong((id *)&self->_contextsAwaitingStatusPresentation, 0);
  objc_storeStrong((id *)&self->_contentDismissalCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_presentedDialog, 0);
  objc_storeStrong((id *)&self->_statusPresenterAssertion, 0);
  objc_storeStrong((id *)&self->_connectedStatusPresenter, 0);
  objc_storeStrong((id *)&self->_statusPresenter, 0);
  objc_storeStrong((id *)&self->_connectedRemoteAlert, 0);
  objc_storeStrong((id *)&self->_remoteAlertPresenter, 0);
  objc_storeStrong((id *)&self->_connectedRunners, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDismissalReason:(id)a3
{
}

- (NSString)dismissalReason
{
  return self->_dismissalReason;
}

- (void)setCompletePersistentModeBlockAwaitingRemoteAlertReactivation:(id)a3
{
}

- (id)completePersistentModeBlockAwaitingRemoteAlertReactivation
{
  return self->_completePersistentModeBlockAwaitingRemoteAlertReactivation;
}

- (void)setCompletePersistentModeAwaitingRemoteAlertReactivationSuccess:(BOOL)a3
{
  self->_completePersistentModeAwaitingRemoteAlertReactivationSuccess = a3;
}

- (BOOL)completePersistentModeAwaitingRemoteAlertReactivationSuccess
{
  return self->_completePersistentModeAwaitingRemoteAlertReactivationSuccess;
}

- (WFScreenOnObserver)screenOnObserver
{
  return self->_screenOnObserver;
}

- (WFDialogNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (NSMutableArray)otherPresentationQueue
{
  return self->_otherPresentationQueue;
}

- (NSMutableArray)persistentPresentationQueue
{
  return self->_persistentPresentationQueue;
}

- (void)setPersistentRunningAttribution:(id)a3
{
}

- (WFDialogAttribution)persistentRunningAttribution
{
  return self->_persistentRunningAttribution;
}

- (void)setPersistentRunningContext:(id)a3
{
}

- (WFWorkflowRunningContext)persistentRunningContext
{
  return self->_persistentRunningContext;
}

- (NSMutableArray)attributionsAwaitingStatusPresentation
{
  return self->_attributionsAwaitingStatusPresentation;
}

- (NSMutableArray)contextsAwaitingStatusPresentation
{
  return self->_contextsAwaitingStatusPresentation;
}

- (NSMutableArray)contentDismissalCompletionHandlers
{
  return self->_contentDismissalCompletionHandlers;
}

- (void)setPresentedDialog:(id)a3
{
}

- (WFPresentedDialog)presentedDialog
{
  return self->_presentedDialog;
}

- (void)setStatusPresenterAssertion:(id)a3
{
}

- (RBSAssertion)statusPresenterAssertion
{
  return self->_statusPresenterAssertion;
}

- (void)setConnectedStatusPresenter:(id)a3
{
}

- (WFWorkflowStatusProtocol)connectedStatusPresenter
{
  return self->_connectedStatusPresenter;
}

- (WFDialogAlertPresenter)statusPresenter
{
  return self->_statusPresenter;
}

- (void)setConnectedRemoteAlert:(id)a3
{
}

- (WFDialogXPCProtocol)connectedRemoteAlert
{
  return self->_connectedRemoteAlert;
}

- (WFDialogAlertPresenter)remoteAlertPresenter
{
  return self->_remoteAlertPresenter;
}

- (NSMutableSet)connectedRunners
{
  return self->_connectedRunners;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDelegate:(id)a3
{
}

- (WFDialogPresentationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFDialogPresentationManagerDelegate *)WeakRetained;
}

- (void)trackDialogEventWithKey:(id)a3 request:(id)a4 presentationMode:(unint64_t)a5 automationType:(id)a6
{
  v9 = (objc_class *)MEMORY[0x1E4FB7310];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v17 = objc_alloc_init(v9);
  [v17 setKey:v12];

  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  [v17 setDialogType:v14];

  v15 = WFStringForDialogPresentationMode();
  [v17 setPresentationStyle:v15];

  v16 = [(WFDialogPresentationManager *)self dismissalReason];
  [v17 setDismissalType:v16];

  [v17 setAutomationType:v10];
  [v17 track];
}

- (void)logFinishDialogPresentationWithRequest:(id)a3 presentationMode:(unint64_t)a4 automationType:(id)a5
{
}

- (void)logFinishDialogPresentationWithPresentedDialog:(id)a3
{
  id v4 = a3;
  id v8 = [v4 request];
  uint64_t v5 = [v4 presentationMode];
  v6 = [v4 context];

  v7 = [v6 automationType];
  [(WFDialogPresentationManager *)self trackDialogEventWithKey:@"ShowDialogFinish" request:v8 presentationMode:v5 automationType:v7];
}

- (void)logStartDialogPresentationWithRequest:(id)a3 presentationMode:(unint64_t)a4
{
}

- (void)trackSuspendShortcutWithPresentedDialog:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB7340];
  id v5 = a3;
  id v8 = objc_alloc_init(v4);
  [v8 setKey:@"SuspendShortcutEvent"];
  [v5 presentationMode];

  v6 = WFStringForDialogPresentationMode();
  [v8 setPresentationStyle:v6];

  v7 = [(WFDialogPresentationManager *)self dismissalReason];
  [v8 setDismissalType:v7];

  [v8 track];
}

- (void)screenOnStateDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(WFDialogPresentationManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__WFDialogPresentationManager_screenOnStateDidChange___block_invoke;
  v7[3] = &unk_1E6541F68;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __54__WFDialogPresentationManager_screenOnStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) screenOn] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 40) persistentRunningContext];

    if (v2) {
      objc_msgSend(*(id *)(a1 + 40), "queue_clearPersistentModeStateIfNecessary");
    }
  }
  id v27 = [*(id *)(a1 + 40) remoteAlertPresenter];
  if (([v27 alertIsActive] & 1) != 0
    && ([*(id *)(a1 + 40) presentedDialog], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = (void *)v3;
    char v5 = [*(id *)(a1 + 32) screenOn];

    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "queue_clearPersistentModeStateIfNecessary");
      id v6 = [*(id *)(a1 + 40) presentedDialog];
      v7 = [*(id *)(a1 + 40) presentedDialog];
      id v8 = [v7 context];
      char v9 = [v8 allowsDialogNotifications];

      if (v9)
      {
        id v10 = getWFDialogLogObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[WFDialogPresentationManager screenOnStateDidChange:]_block_invoke";
          _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEFAULT, "%s Converting presented dialog into a notification, since the screen locked.", buf, 0xCu);
        }

        id v11 = *(void **)(a1 + 40);
        id v12 = [v6 request];
        uint64_t v13 = [v6 presentationMode];
        v14 = [v6 context];
        [v11 postNotificationWithRequest:v12 presentationMode:v13 context:v14];

        objc_msgSend(*(id *)(a1 + 40), "queue_deactivateRemoteAlertAndInvalidateConnection");
        v15 = *(void **)(a1 + 40);
        v16 = [v15 presentedDialog];
        [v15 trackSuspendShortcutWithPresentedDialog:v16];
      }
      else
      {
        id v17 = [v6 context];
        char v18 = [v17 isShortcutsApp];

        if (v18)
        {
          uint64_t v19 = 3;
        }
        else
        {
          v20 = [v6 context];
          int v21 = [v20 allowsDialogNotifications];

          if (v21) {
            uint64_t v19 = 0;
          }
          else {
            uint64_t v19 = 2;
          }
        }
        v22 = [*(id *)(a1 + 40) presentedDialog];
        v23 = [v22 completionHandler];

        if (v23)
        {
          v24 = [*(id *)(a1 + 40) presentedDialog];
          v25 = [v24 completionHandler];
          v26 = (void *)[objc_alloc(MEMORY[0x1E4FB46E0]) initWithResponseCode:v19];
          ((void (**)(void, void *))v25)[2](v25, v26);
        }
        [*(id *)(a1 + 40) setPresentedDialog:0];
        objc_msgSend(*(id *)(a1 + 40), "queue_deactivateRemoteAlertAndInvalidateConnection");
      }
    }
  }
  else
  {
  }
}

- (void)dismissPersistentChromeInDialog:(id)a3 success:(BOOL)a4 customAttribution:(id)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__WFDialogPresentationManager_dismissPersistentChromeInDialog_success_customAttribution_completionHandler___block_invoke;
  v12[3] = &unk_1E6541728;
  v12[4] = self;
  id v13 = v10;
  id v11 = v10;
  [a3 dismissPersistentChromeWithSuccess:v7 customAttribution:a5 completionHandler:v12];
}

void __107__WFDialogPresentationManager_dismissPersistentChromeInDialog_success_customAttribution_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __107__WFDialogPresentationManager_dismissPersistentChromeInDialog_success_customAttribution_completionHandler___block_invoke_2;
  v4[3] = &unk_1E6541728;
  uint64_t v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

uint64_t __107__WFDialogPresentationManager_dismissPersistentChromeInDialog_success_customAttribution_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = getWFDialogLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[WFDialogPresentationManager dismissPersistentChromeInDialog:success:customAttribution:completionHandler:]_block_invoke_2";
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_DEFAULT, "%s Finished dismissing chrome after persistent mode completed", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v3 = [*(id *)(a1 + 32) persistentPresentationQueue];
  [v3 removeAllObjects];

  int v4 = objc_msgSend(*(id *)(a1 + 32), "queue_hasMoreDialogsToPresent");
  id v5 = *(void **)(a1 + 32);
  if (v4) {
    objc_msgSend(v5, "queue_presentNextDialog");
  }
  else {
    objc_msgSend(v5, "queue_deactivateRemoteAlertAndInvalidateConnection");
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)completePersistentModeWithSuccess:(id)a3 runningContext:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [(WFDialogPresentationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__WFDialogPresentationManager_completePersistentModeWithSuccess_runningContext_completion___block_invoke;
  block[3] = &unk_1E6541F40;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __91__WFDialogPresentationManager_completePersistentModeWithSuccess_runningContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = getWFDialogLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[WFDialogPresentationManager completePersistentModeWithSuccess:runningContext:completion:]_block_invoke";
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_DEFAULT, "%s Completing persistent mode", (uint8_t *)&v11, 0xCu);
  }

  int v3 = [*(id *)(a1 + 32) shouldShowStatus];
  int v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [v4 connectedStatusPresenter];

    if (v5)
    {
      [*(id *)(a1 + 32) acquireStatusPresenterAssertionIfNecessary];
      id v6 = [*(id *)(a1 + 32) connectedStatusPresenter];
      objc_msgSend(v6, "workflowStatusWorkflowDidFinishWithSuccess:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
    }
    objc_msgSend(*(id *)(a1 + 32), "queue_clearPersistentModeStateIfNecessary");
  }
  else
  {
    id v7 = [v4 persistentRunningAttribution];
    objc_msgSend(*(id *)(a1 + 32), "queue_clearPersistentModeStateIfNecessary");
    id v8 = [*(id *)(a1 + 32) connectedRemoteAlert];

    uint64_t v9 = *(void **)(a1 + 32);
    if (v8)
    {
      id v10 = [*(id *)(a1 + 32) connectedRemoteAlert];
      objc_msgSend(v9, "dismissPersistentChromeInDialog:success:customAttribution:completionHandler:", v10, objc_msgSend(*(id *)(a1 + 40), "BOOLValue"), v7, *(void *)(a1 + 48));
    }
    else
    {
      [*(id *)(a1 + 32) setPersistentRunningAttribution:v7];
      [*(id *)(a1 + 32) setCompletePersistentModeBlockAwaitingRemoteAlertReactivation:*(void *)(a1 + 48)];
      objc_msgSend(*(id *)(a1 + 32), "setCompletePersistentModeAwaitingRemoteAlertReactivationSuccess:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
      [*(id *)(a1 + 32) activateRemoteAlert];
    }
  }
}

- (void)beginPersistentModeWithRunningContext:(id)a3 attribution:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(WFDialogPresentationManager *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __99__WFDialogPresentationManager_beginPersistentModeWithRunningContext_attribution_completionHandler___block_invoke;
  v15[3] = &unk_1E6541538;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __99__WFDialogPresentationManager_beginPersistentModeWithRunningContext_attribution_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) shouldShowStatus];
  int v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [v3 statusPresenter];
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = [*(id *)(a1 + 32) statusPresenter];
      if ([v6 alertIsActive])
      {
      }
      else
      {
        id v14 = [*(id *)(a1 + 32) statusPresenter];
        char v15 = [v14 alertIsLaunching];

        if ((v15 & 1) == 0)
        {
          v24 = [*(id *)(a1 + 32) contextsAwaitingStatusPresentation];
          [v24 addObject:*(void *)(a1 + 40)];

          v25 = [*(id *)(a1 + 32) attributionsAwaitingStatusPresentation];
          [v25 addObject:*(void *)(a1 + 48)];

          [*(id *)(a1 + 32) activateStatusPresenter];
          goto LABEL_24;
        }
      }
    }
    uint64_t v16 = [*(id *)(a1 + 32) statusPresenter];
    if (v16)
    {
      id v17 = (void *)v16;
      id v18 = [*(id *)(a1 + 32) statusPresenter];
      if ([v18 alertIsActive])
      {
      }
      else
      {
        uint64_t v19 = [*(id *)(a1 + 32) statusPresenter];
        int v20 = [v19 alertIsLaunching];

        if (v20)
        {
          int v21 = [*(id *)(a1 + 32) contextsAwaitingStatusPresentation];
          [v21 addObject:*(void *)(a1 + 40)];

          v22 = [*(id *)(a1 + 32) attributionsAwaitingStatusPresentation];
          [v22 addObject:*(void *)(a1 + 48)];
          goto LABEL_22;
        }
      }
    }
    v23 = [*(id *)(a1 + 32) connectedStatusPresenter];

    if (!v23)
    {
LABEL_24:
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      return;
    }
    [*(id *)(a1 + 32) acquireStatusPresenterAssertionIfNecessary];
    v22 = [*(id *)(a1 + 32) connectedStatusPresenter];
    [v22 workflowStatusWorkflowWillBeginRunningWithAttribution:*(void *)(a1 + 48) context:*(void *)(a1 + 40)];
LABEL_22:

    goto LABEL_24;
  }
  id v7 = [v3 persistentRunningContext];

  if (!v7)
  {
    [*(id *)(a1 + 32) setPersistentRunningContext:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setPersistentRunningAttribution:*(void *)(a1 + 48)];
    uint64_t v9 = [*(id *)(a1 + 32) remoteAlertPresenter];
    if (v9)
    {
      id v10 = (void *)v9;
      int v11 = [*(id *)(a1 + 32) remoteAlertPresenter];
      char v12 = [v11 alertIsActive];

      if ((v12 & 1) == 0)
      {
        id v13 = getWFDialogLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 136315138;
          id v27 = "-[WFDialogPresentationManager beginPersistentModeWithRunningContext:attribution:completionHandler:]_block_invoke";
          _os_log_impl(&dword_1C7D7E000, v13, OS_LOG_TYPE_DEFAULT, "%s Activating remote alert in persistent mode, because workflow started running", (uint8_t *)&v26, 0xCu);
        }

        [*(id *)(a1 + 32) activateRemoteAlert];
      }
    }
    goto LABEL_24;
  }
  id v8 = getWFXPCRunnerLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    int v26 = 136315138;
    id v27 = "-[WFDialogPresentationManager beginPersistentModeWithRunningContext:attribution:completionHandler:]_block_invoke";
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_FAULT, "%s Already showing persistent UI. Running multiple shortcuts in persistent mode, concurrently, is not supported. This should've been caught in the run coordinator before starting the shortcut run, this shortcut won't run properly.", (uint8_t *)&v26, 0xCu);
  }
}

- (BOOL)shouldShowStatus
{
  int v2 = [MEMORY[0x1E4FB46B8] currentDevice];
  char v3 = [v2 hasSystemAperture];

  return v3;
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v5 = a3;
  id v6 = [(WFDialogPresentationManager *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__WFDialogPresentationManager_assertion_didInvalidateWithError___block_invoke;
  v8[3] = &unk_1E6541F68;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __64__WFDialogPresentationManager_assertion_didInvalidateWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40)];
  int v2 = *(void **)(a1 + 40);
  return [v2 setStatusPresenterAssertion:0];
}

- (void)acquireStatusPresenterAssertionIfNecessary
{
  char v3 = [(WFDialogPresentationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__WFDialogPresentationManager_acquireStatusPresenterAssertionIfNecessary__block_invoke;
  block[3] = &unk_1E65420F0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __73__WFDialogPresentationManager_acquireStatusPresenterAssertionIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) statusPresenterAssertion];
  char v3 = [v2 isValid];

  if ((v3 & 1) == 0)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F223B0]);
    uint64_t v5 = *MEMORY[0x1E4FB4B98];
    id v17 = 0;
    id v6 = (void *)[v4 initWithBundleIdentifier:v5 allowPlaceholder:0 personaUniqueString:&stru_1F225E938 error:&v17];
    id v7 = v17;
    if (v6)
    {
      id v8 = [MEMORY[0x1E4F96408] identityForLSApplicationIdentity:v6];
      id v9 = [MEMORY[0x1E4F96478] targetWithProcessIdentity:v8];
      id v10 = objc_alloc(MEMORY[0x1E4F96318]);
      int v11 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.shortcuts" name:@"RunningBackground"];
      id v18 = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
      id v13 = (void *)[v10 initWithExplanation:@"Shortcuts Status" target:v9 attributes:v12];

      [v13 addObserver:*(void *)(a1 + 32)];
      id v16 = 0;
      LOBYTE(v12) = [v13 acquireWithError:&v16];
      id v14 = v16;

      if ((v12 & 1) == 0)
      {
        char v15 = getWFDialogLogObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          int v20 = "-[WFDialogPresentationManager acquireStatusPresenterAssertionIfNecessary]_block_invoke";
          __int16 v21 = 2112;
          id v22 = v14;
          _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_ERROR, "%s Failed to acquire assertion for view service to present status: error: %@", buf, 0x16u);
        }
      }
      [*(id *)(a1 + 32) setStatusPresenterAssertion:v13];
    }
    else
    {
      id v8 = getWFDialogLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v20 = "-[WFDialogPresentationManager acquireStatusPresenterAssertionIfNecessary]_block_invoke";
        __int16 v21 = 2112;
        id v22 = v7;
        _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_ERROR, "%s Unable to find identity for view service, bailing assertion acquiring: %@", buf, 0x16u);
      }
      id v14 = v7;
    }
  }
}

- (void)statusPresenterDidDisconnect
{
  char v3 = [(WFDialogPresentationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__WFDialogPresentationManager_statusPresenterDidDisconnect__block_invoke;
  block[3] = &unk_1E65420F0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __59__WFDialogPresentationManager_statusPresenterDidDisconnect__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) statusPresenterAssertion];
  [v1 invalidate];
}

- (void)statusPresenterDidConnectToService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFDialogPresentationManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__WFDialogPresentationManager_statusPresenterDidConnectToService___block_invoke;
  v7[3] = &unk_1E6541F68;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __66__WFDialogPresentationManager_statusPresenterDidConnectToService___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) acquireStatusPresenterAssertionIfNecessary];
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 setConnectedStatusPresenter:v3];
}

- (void)workflowStatusHostBeginConnection
{
  uint64_t v3 = [(WFDialogPresentationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__WFDialogPresentationManager_workflowStatusHostBeginConnection__block_invoke;
  block[3] = &unk_1E65420F0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __64__WFDialogPresentationManager_workflowStatusHostBeginConnection__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) contextsAwaitingStatusPresentation];
  if ([v2 count])
  {
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) attributionsAwaitingStatusPresentation];
    uint64_t v4 = [v3 count];

    if (!v4) {
      return;
    }
  }
  uint64_t v5 = [*(id *)(a1 + 32) contextsAwaitingStatusPresentation];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [*(id *)(a1 + 32) contextsAwaitingStatusPresentation];
      id v9 = [v8 objectAtIndex:v7];

      id v10 = [*(id *)(a1 + 32) attributionsAwaitingStatusPresentation];
      int v11 = [v10 objectAtIndex:v7];

      uint64_t v12 = [*(id *)(a1 + 32) connectedStatusPresenter];
      [v12 workflowStatusWorkflowWillBeginRunningWithAttribution:v11 context:v9];

      ++v7;
      id v13 = [*(id *)(a1 + 32) contextsAwaitingStatusPresentation];
      unint64_t v14 = [v13 count];
    }
    while (v7 < v14);
  }
  char v15 = [*(id *)(a1 + 32) contextsAwaitingStatusPresentation];
  [v15 removeAllObjects];

  id v16 = [*(id *)(a1 + 32) attributionsAwaitingStatusPresentation];
  [v16 removeAllObjects];
}

- (void)dialogAlertPresenterDidInvalidateAlert:(id)a3
{
  uint64_t v4 = [(WFDialogPresentationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__WFDialogPresentationManager_dialogAlertPresenterDidInvalidateAlert___block_invoke;
  block[3] = &unk_1E65420F0;
  block[4] = self;
  dispatch_async(v4, block);
}

void __70__WFDialogPresentationManager_dialogAlertPresenterDidInvalidateAlert___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) dismissalReason];

  if (!v2) {
    [*(id *)(a1 + 32) setDismissalReason:*MEMORY[0x1E4FB4E98]];
  }
  uint64_t v3 = [*(id *)(a1 + 32) presentedDialog];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) screenOnObserver];
    int v5 = [v4 screenOn];

    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 32) presentedDialog];
      unint64_t v7 = [v6 response];

      id v8 = getWFDialogLogObject();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v9)
        {
          int v16 = 136315138;
          id v17 = "-[WFDialogPresentationManager dialogAlertPresenterDidInvalidateAlert:]_block_invoke";
          _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_DEFAULT, "%s Cancelling workflow execution, since the remote alert was invalidated and the screen is still on", (uint8_t *)&v16, 0xCu);
        }

        [*(id *)(a1 + 32) cancelWorkflow];
      }
      else
      {
        if (v9)
        {
          int v16 = 136315138;
          id v17 = "-[WFDialogPresentationManager dialogAlertPresenterDidInvalidateAlert:]_block_invoke";
          _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_DEFAULT, "%s Sending cancelled dialog response, since the remote alert was invalidated and the screen is still on", (uint8_t *)&v16, 0xCu);
        }

        id v10 = [*(id *)(a1 + 32) presentedDialog];
        int v11 = [v10 completionHandler];
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4FB46E0]) initWithCancelled:1];
        ((void (**)(void, void *))v11)[2](v11, v12);
      }
    }
    [*(id *)(a1 + 32) setPresentedDialog:0];
  }
  id v13 = [*(id *)(a1 + 32) remoteAlertPresenter];
  [v13 deactivateAlert];

  objc_msgSend(*(id *)(a1 + 32), "queue_connectedRemoteAlertDidDisconnect");
  if (objc_msgSend(*(id *)(a1 + 32), "queue_hasMoreDialogsToPresent"))
  {
    unint64_t v14 = [*(id *)(a1 + 32) screenOnObserver];
    int v15 = [v14 screenOn];

    if (v15) {
      [*(id *)(a1 + 32) activateRemoteAlert];
    }
  }
}

- (void)dialogAlertPresenterDidDeactivateAlert:(id)a3
{
  uint64_t v4 = [(WFDialogPresentationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__WFDialogPresentationManager_dialogAlertPresenterDidDeactivateAlert___block_invoke;
  block[3] = &unk_1E65420F0;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __70__WFDialogPresentationManager_dialogAlertPresenterDidDeactivateAlert___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) presentedDialog];
  uint64_t v3 = [v2 context];
  char v4 = [v3 allowsDialogNotifications];

  int v5 = [*(id *)(a1 + 32) presentedDialog];
  uint64_t v6 = v5;
  if (v4)
  {

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "queue_clearPersistentModeStateIfNecessary");
      unint64_t v7 = *(void **)(a1 + 32);
      id v8 = [v7 presentedDialog];
      BOOL v9 = [v8 request];
      id v10 = [*(id *)(a1 + 32) presentedDialog];
      uint64_t v11 = [v10 presentationMode];
      uint64_t v12 = [*(id *)(a1 + 32) presentedDialog];
      id v13 = [v12 context];
      [v7 postNotificationWithRequest:v9 presentationMode:v11 context:v13];

      unint64_t v14 = *(void **)(a1 + 32);
      int v15 = [v14 presentedDialog];
      [v14 trackSuspendShortcutWithPresentedDialog:v15];
    }
    int v16 = getWFDialogLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 136315138;
      int v26 = "-[WFDialogPresentationManager dialogAlertPresenterDidDeactivateAlert:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v16, OS_LOG_TYPE_DEFAULT, "%s dialogAlertPresenterDidDeactivateAlert", (uint8_t *)&v25, 0xCu);
    }
  }
  else
  {
    id v17 = [v5 response];

    if (v17)
    {
      uint64_t v18 = getWFDialogLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 136315138;
        int v26 = "-[WFDialogPresentationManager dialogAlertPresenterDidDeactivateAlert:]_block_invoke";
        _os_log_impl(&dword_1C7D7E000, v18, OS_LOG_TYPE_DEFAULT, "%s Cancelling workflow execution, since the remote alert was deactivated and we already sent a response", (uint8_t *)&v25, 0xCu);
      }

      [*(id *)(a1 + 32) cancelWorkflow];
    }
    else
    {
      uint64_t v19 = [*(id *)(a1 + 32) presentedDialog];
      int v20 = [v19 completionHandler];

      if (v20)
      {
        __int16 v21 = [*(id *)(a1 + 32) presentedDialog];
        id v22 = [v21 completionHandler];
        uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4FB46E0]) initWithResponseCode:3];
        ((void (**)(void, void *))v22)[2](v22, v23);
      }
    }
    [*(id *)(a1 + 32) setPresentedDialog:0];
  }
  return objc_msgSend(*(id *)(a1 + 32), "queue_deactivateRemoteAlertAndInvalidateConnection");
}

- (void)dialogAlertPresenterDidDisconnectFromAlert:(id)a3
{
  char v4 = [(WFDialogPresentationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__WFDialogPresentationManager_dialogAlertPresenterDidDisconnectFromAlert___block_invoke;
  block[3] = &unk_1E65420F0;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __74__WFDialogPresentationManager_dialogAlertPresenterDidDisconnectFromAlert___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) presentedDialog];

  if (v2)
  {
    uint64_t v3 = getWFDialogLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      BOOL v9 = "-[WFDialogPresentationManager dialogAlertPresenterDidDisconnectFromAlert:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_ERROR, "%s Connection unexpectedly invalidated while a dialog was presented. Sending a cancelled response.", (uint8_t *)&v8, 0xCu);
    }

    char v4 = [*(id *)(a1 + 32) presentedDialog];
    int v5 = [v4 completionHandler];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB46E0]) initWithResponseCode:1];
    ((void (**)(void, void *))v5)[2](v5, v6);

    [*(id *)(a1 + 32) setPresentedDialog:0];
  }
  return objc_msgSend(*(id *)(a1 + 32), "queue_connectedRemoteAlertDidDisconnect");
}

- (void)dialogAlertPresenter:(id)a3 didConnectToAlert:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(WFDialogPresentationManager *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__WFDialogPresentationManager_dialogAlertPresenter_didConnectToAlert___block_invoke;
  v8[3] = &unk_1E6541F68;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

uint64_t __70__WFDialogPresentationManager_dialogAlertPresenter_didConnectToAlert___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConnectedRemoteAlert:*(void *)(a1 + 40)];
}

- (void)cancelWorkflow
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(WFDialogPresentationManager *)self presentedDialog];
  char v4 = [v3 context];

  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [(WFDialogPresentationManager *)self connectedRunners];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) remoteObjectProxy];
          [v10 presenterRequestedWorkflowStopForContext:v4];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (void)requestDismissalWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(WFDialogPresentationManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__WFDialogPresentationManager_requestDismissalWithReason___block_invoke;
  v7[3] = &unk_1E6541F68;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __58__WFDialogPresentationManager_requestDismissalWithReason___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1 + 32;
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(v4 + 8);
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = *MEMORY[0x1E4FB4EA0];
  }
  [v2 setDismissalReason:v5];
  id v6 = [*(id *)(a1 + 32) presentedDialog];

  if (v6)
  {
    uint64_t v7 = getWFDialogLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      uint64_t v19 = "-[WFDialogPresentationManager requestDismissalWithReason:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEFAULT, "%s Sending cancelled dialog response, since user cancelled the dialog", (uint8_t *)&v18, 0xCu);
    }

    id v8 = [*(id *)(a1 + 32) presentedDialog];
    uint64_t v9 = [v8 response];

    uint64_t v10 = *(void **)(a1 + 32);
    if (v9)
    {
      [v10 cancelWorkflow];
    }
    else
    {
      long long v11 = [v10 presentedDialog];
      long long v12 = [v11 completionHandler];
      long long v13 = (void *)[objc_alloc(MEMORY[0x1E4FB46E0]) initWithCancelled:1];
      ((void (**)(void, void *))v12)[2](v12, v13);

      [*(id *)(a1 + 32) setPresentedDialog:0];
    }
  }
  int v14 = objc_msgSend(*(id *)(a1 + 32), "queue_hasMoreDialogsToPresent");
  int v15 = getWFDialogLogObject();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      int v18 = 136315138;
      uint64_t v19 = "-[WFDialogPresentationManager requestDismissalWithReason:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_DEFAULT, "%s Presenting another dialog, even though the user cancelled the current one, since it's likely from another shortcut.", (uint8_t *)&v18, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 32), "queue_presentNextDialog");
  }
  else
  {
    if (v16)
    {
      int v18 = 136315138;
      uint64_t v19 = "-[WFDialogPresentationManager requestDismissalWithReason:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_DEFAULT, "%s Dismissing the dialog, since the user cancelled.", (uint8_t *)&v18, 0xCu);
    }

    return objc_msgSend(*(id *)(a1 + 32), "queue_deactivateRemoteAlertAndInvalidateConnection");
  }
}

- (void)beginConnection
{
  uint64_t v3 = [(WFDialogPresentationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__WFDialogPresentationManager_beginConnection__block_invoke;
  block[3] = &unk_1E65420F0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __46__WFDialogPresentationManager_beginConnection__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) completePersistentModeBlockAwaitingRemoteAlertReactivation];

  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [v3 completePersistentModeAwaitingRemoteAlertReactivationSuccess];
    id v13 = [*(id *)(a1 + 32) completePersistentModeBlockAwaitingRemoteAlertReactivation];
    [*(id *)(a1 + 32) setCompletePersistentModeBlockAwaitingRemoteAlertReactivation:0];
    [*(id *)(a1 + 32) setCompletePersistentModeAwaitingRemoteAlertReactivationSuccess:0];
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [NSNumber numberWithBool:v4];
    uint64_t v7 = [*(id *)(a1 + 32) persistentRunningContext];
    [v5 completePersistentModeWithSuccess:v6 runningContext:v7 completion:v13];
  }
  else
  {
    id v8 = [v3 persistentRunningContext];

    if (v8)
    {
      uint64_t v9 = [*(id *)(a1 + 32) connectedRemoteAlert];
      uint64_t v10 = [*(id *)(a1 + 32) persistentRunningContext];
      long long v11 = [*(id *)(a1 + 32) persistentRunningAttribution];
      [v9 preparePersistentChromeWithContext:v10 attribution:v11];
    }
    if (objc_msgSend(*(id *)(a1 + 32), "queue_hasMoreDialogsToPresent"))
    {
      long long v12 = *(void **)(a1 + 32);
      objc_msgSend(v12, "queue_presentNextDialog");
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFDialogPresentationManager *)self queue];
  dispatch_assert_queue_not_V2(v8);

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v9 = [(WFDialogPresentationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_1E6542140;
  int v14 = self;
  int v15 = &v16;
  id v13 = v7;
  id v10 = v7;
  dispatch_sync(v9, block);

  LOBYTE(v7) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return (char)v7;
}

void __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) valueForEntitlement:@"com.apple.shortcuts.dialogpresentation"];
  char v3 = [v2 BOOLValue];

  uint64_t v4 = getWFDialogLogObject();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v22 = "-[WFDialogPresentationManager listener:shouldAcceptNewConnection:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Received incoming XPC connection", buf, 0xCu);
    }

    id v6 = WFUIPresenterXPCInterface();
    [*(id *)(a1 + 32) setExportedInterface:v6];

    [*(id *)(a1 + 32) setExportedObject:*(void *)(a1 + 40)];
    id v7 = WFUIPresenterHostXPCInterface();
    [*(id *)(a1 + 32) setRemoteObjectInterface:v7];

    id v8 = *(id *)(a1 + 32);
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke_204;
    v18[3] = &unk_1E65408B8;
    objc_copyWeak(&v20, (id *)buf);
    id v9 = v8;
    id v19 = v9;
    [*(id *)(a1 + 32) setInterruptionHandler:v18];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    int v14 = __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke_2;
    int v15 = &unk_1E65408B8;
    objc_copyWeak(&v17, (id *)buf);
    id v10 = v9;
    id v16 = v10;
    [*(id *)(a1 + 32) setInvalidationHandler:&v12];
    objc_msgSend(*(id *)(a1 + 32), "resume", v12, v13, v14, v15);
    long long v11 = [*(id *)(a1 + 40) connectedRunners];
    [v11 addObject:*(void *)(a1 + 32)];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    objc_destroyWeak(&v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v22 = "-[WFDialogPresentationManager listener:shouldAcceptNewConnection:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_ERROR, "%s Rejecting incoming connection, since it is missing the com.apple.shortcuts.dialogpresentation entitlement", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke_204(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v3 = getWFDialogLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[WFDialogPresentationManager listener:shouldAcceptNewConnection:]_block_invoke";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_ERROR, "%s XPC connection interrupted", buf, 0xCu);
  }

  uint64_t v4 = [WeakRetained queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke_205;
  v5[3] = &unk_1E6541F68;
  v5[4] = WeakRetained;
  id v6 = *(id *)(a1 + 32);
  dispatch_sync(v4, v5);
}

void __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v3 = getWFDialogLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[WFDialogPresentationManager listener:shouldAcceptNewConnection:]_block_invoke_2";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_ERROR, "%s XPC connection invalidated", buf, 0xCu);
  }

  uint64_t v4 = [WeakRetained queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke_206;
  v5[3] = &unk_1E6541F68;
  v5[4] = WeakRetained;
  id v6 = *(id *)(a1 + 32);
  dispatch_sync(v4, v5);
}

void __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke_206(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connectedRunners];
  [v2 removeObject:*(void *)(a1 + 40)];
}

void __66__WFDialogPresentationManager_listener_shouldAcceptNewConnection___block_invoke_205(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connectedRunners];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)postNotificationWithRequest:(id)a3 presentationMode:(unint64_t)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(WFDialogPresentationManager *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__WFDialogPresentationManager_postNotificationWithRequest_presentationMode_context___block_invoke;
  v13[3] = &unk_1E6540890;
  id v14 = v8;
  id v15 = v9;
  id v16 = self;
  unint64_t v17 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

void __84__WFDialogPresentationManager_postNotificationWithRequest_presentationMode_context___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = getWFDialogLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v19 = "-[WFDialogPresentationManager postNotificationWithRequest:presentationMode:context:]_block_invoke";
    __int16 v20 = 2112;
    uint64_t v21 = v3;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_DEFAULT, "%s Posting notification for dialog request: %@", buf, 0x16u);
  }

  if (*(void *)(a1 + 40))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 48), "connectedRunners", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) remoteObjectProxy];
          [v9 presenterRequestedWorkflowPauseForContext:*(void *)(a1 + 40) dialogRequest:*(void *)(a1 + 32) completionHandler:&__block_literal_global_1763];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }

    if (*(void *)(a1 + 56) >= 3uLL) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = *(void *)(a1 + 56);
    }
    id v11 = [*(id *)(a1 + 48) notificationManager];
    [v11 postNotificationWithRequest:*(void *)(a1 + 32) presentationMode:v10 runningContext:*(void *)(a1 + 40)];
  }
  else
  {
    id v11 = getWFDialogLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      id v19 = "-[WFDialogPresentationManager postNotificationWithRequest:presentationMode:context:]_block_invoke";
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_FAULT, "%s Attempting to post notification for request: %@ with no running context", buf, 0x16u);
    }
  }
}

- (void)activateStatusPresenter
{
  uint64_t v3 = [(WFDialogPresentationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__WFDialogPresentationManager_activateStatusPresenter__block_invoke;
  block[3] = &unk_1E65420F0;
  void block[4] = self;
  dispatch_async(v3, block);
}

void __54__WFDialogPresentationManager_activateStatusPresenter__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) statusPresenter];
  [v1 activateAlertInMainSceneOfApplicationWithBundleIdentifier:0];
}

- (void)activateRemoteAlertTiedToBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFDialogPresentationManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__WFDialogPresentationManager_activateRemoteAlertTiedToBundleIdentifier___block_invoke;
  v7[3] = &unk_1E6541F68;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __73__WFDialogPresentationManager_activateRemoteAlertTiedToBundleIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) screenOnObserver];
  char v3 = [v2 screenOn];

  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) remoteAlertPresenter];
    [v5 activateAlertInMainSceneOfApplicationWithBundleIdentifier:*(void *)(a1 + 40)];
  }
  else
  {
    id v4 = getWFDialogLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v7 = "-[WFDialogPresentationManager activateRemoteAlertTiedToBundleIdentifier:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEFAULT, "%s Attempting to activate remote alert while the display is off, ignoring request", buf, 0xCu);
    }
  }
}

- (void)activateRemoteAlert
{
}

- (void)queue_clearPersistentModeStateIfNecessary
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v3 = [(WFDialogPresentationManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(WFDialogPresentationManager *)self persistentRunningContext];
  if (v4)
  {
  }
  else
  {
    id v5 = [(WFDialogPresentationManager *)self persistentRunningAttribution];

    if (!v5) {
      return;
    }
  }
  id v6 = getWFDialogLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(WFDialogPresentationManager *)self persistentRunningContext];
    int v9 = 136315394;
    uint64_t v10 = "-[WFDialogPresentationManager queue_clearPersistentModeStateIfNecessary]";
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_DEFAULT, "%s Clearing persistent state (%@)", (uint8_t *)&v9, 0x16u);
  }
  [(WFDialogPresentationManager *)self setPersistentRunningContext:0];
  [(WFDialogPresentationManager *)self setPersistentRunningAttribution:0];
  uint64_t v8 = [(WFDialogPresentationManager *)self persistentPresentationQueue];
  [v8 removeAllObjects];
}

- (void)queue_deactivateRemoteAlertAndInvalidateConnection
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = [(WFDialogPresentationManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = getWFDialogLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[WFDialogPresentationManager queue_deactivateRemoteAlertAndInvalidateConnection]";
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_INFO, "%s Deactivating remote alert, and invalidating the XPC connection.", (uint8_t *)&v6, 0xCu);
  }

  [(WFDialogPresentationManager *)self queue_connectedRemoteAlertDidDisconnect];
  id v5 = [(WFDialogPresentationManager *)self remoteAlertPresenter];
  [v5 deactivateAlert];
}

- (void)queue_presentNextDialog
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v3 = [(WFDialogPresentationManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(WFDialogPresentationManager *)self persistentRunningContext];
  BOOL v5 = v4 == 0;

  int v6 = getWFDialogLogObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[WFDialogPresentationManager queue_presentNextDialog]";
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_INFO, "%s Dequeueing dialog from transient queue.", buf, 0xCu);
    }

    uint64_t v8 = [(WFDialogPresentationManager *)self otherPresentationQueue];
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[WFDialogPresentationManager queue_presentNextDialog]";
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_INFO, "%s Dequeueing dialog from persistent queue.", buf, 0xCu);
    }

    uint64_t v8 = [(WFDialogPresentationManager *)self persistentPresentationQueue];
  }
  int v9 = v8;
  if ([v8 count])
  {
    uint64_t v10 = [(WFDialogPresentationManager *)self connectedRemoteAlert];
    if (v10)
    {
      __int16 v11 = [(WFDialogPresentationManager *)self presentedDialog];

      if (!v11)
      {
        long long v16 = [v9 firstObject];
        [v9 removeObjectAtIndex:0];
        unint64_t v17 = getWFDialogLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = [v16 request];
          *(_DWORD *)buf = 136315394;
          v24 = "-[WFDialogPresentationManager queue_presentNextDialog]";
          __int16 v25 = 2112;
          int v26 = v18;
          _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_DEFAULT, "%s Asking connected dialog to show request: %@", buf, 0x16u);
        }
        [(WFDialogPresentationManager *)self setPresentedDialog:v16];
        objc_initWeak((id *)buf, self);
        id v19 = [v16 request];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __54__WFDialogPresentationManager_queue_presentNextDialog__block_invoke;
        v20[3] = &unk_1E6540868;
        objc_copyWeak(&v22, (id *)buf);
        uint64_t v12 = v16;
        uint64_t v21 = v12;
        [v10 showDialogRequest:v19 completionHandler:v20];

        objc_destroyWeak(&v22);
        objc_destroyWeak((id *)buf);
        goto LABEL_21;
      }
      uint64_t v12 = getWFDialogLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[WFDialogPresentationManager queue_presentNextDialog]";
        uint64_t v13 = "%s Attempted to present a dialog while another dialog is still visible. Ignoring.";
        long long v14 = v12;
        os_log_type_t v15 = OS_LOG_TYPE_ERROR;
LABEL_17:
        _os_log_impl(&dword_1C7D7E000, v14, v15, v13, buf, 0xCu);
      }
    }
    else
    {
      uint64_t v12 = getWFDialogLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v24 = "-[WFDialogPresentationManager queue_presentNextDialog]";
        uint64_t v13 = "%s Unable to present any dialogs, since the UI process is not connected";
        long long v14 = v12;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_17;
      }
    }
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v10 = getWFDialogLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[WFDialogPresentationManager queue_presentNextDialog]";
    _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEFAULT, "%s Presentation queue is empty, so not presenting any dialogs.", buf, 0xCu);
  }
LABEL_22:
}

void __54__WFDialogPresentationManager_queue_presentNextDialog__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v5 = [WeakRetained queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__WFDialogPresentationManager_queue_presentNextDialog__block_invoke_2;
  block[3] = &unk_1E65420A0;
  id v8 = v3;
  id v9 = WeakRetained;
  id v10 = *(id *)(a1 + 32);
  id v6 = v3;
  dispatch_async(v5, block);
}

void __54__WFDialogPresentationManager_queue_presentNextDialog__block_invoke_2(id *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = getWFDialogLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    int v12 = 136315394;
    uint64_t v13 = "-[WFDialogPresentationManager queue_presentNextDialog]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_DEFAULT, "%s Received response from presented dialog: %@", (uint8_t *)&v12, 0x16u);
  }

  if ([a1[4] shouldDismissDialogInTransientMode])
  {
    [a1[5] setPresentedDialog:0];
  }
  else
  {
    id v4 = a1[4];
    BOOL v5 = [a1[5] presentedDialog];
    [v5 setResponse:v4];
  }
  id v6 = [a1[6] completionHandler];
  ((void (**)(void, id))v6)[2](v6, a1[4]);

  BOOL v7 = [a1[5] persistentPresentationQueue];
  if ([v7 count])
  {

LABEL_9:
    id v10 = getWFDialogLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      uint64_t v13 = "-[WFDialogPresentationManager queue_presentNextDialog]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEFAULT, "%s There are more dialogs to present, so presenting the next one.", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(a1[5], "queue_presentNextDialog");
    return;
  }
  id v8 = [a1[5] otherPresentationQueue];
  uint64_t v9 = [v8 count];

  if (v9) {
    goto LABEL_9;
  }
  if ([a1[4] isCancelled]) {
    goto LABEL_14;
  }
  __int16 v11 = [a1[5] persistentRunningContext];
  if (v11)
  {

    return;
  }
  if ([a1[4] shouldDismissDialogInTransientMode]) {
LABEL_14:
  }
    objc_msgSend(a1[5], "queue_deactivateRemoteAlertAndInvalidateConnection");
}

- (void)dismissPresentedContentForRunningContext:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = [(WFDialogPresentationManager *)self queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__WFDialogPresentationManager_dismissPresentedContentForRunningContext_completionHandler___block_invoke;
  v8[3] = &unk_1E6541728;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __90__WFDialogPresentationManager_dismissPresentedContentForRunningContext_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 presentedDialog];
  [v2 logFinishDialogPresentationWithPresentedDialog:v3];

  [*(id *)(a1 + 32) setPresentedDialog:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__WFDialogPresentationManager_dismissPresentedContentForRunningContext_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E6541728;
  id v4 = *(void **)(a1 + 40);
  aBlock[4] = *(void *)(a1 + 32);
  id v13 = v4;
  id v5 = (void (**)(void))_Block_copy(aBlock);
  id v6 = [*(id *)(a1 + 32) connectedRemoteAlert];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) connectedRemoteAlert];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __90__WFDialogPresentationManager_dismissPresentedContentForRunningContext_completionHandler___block_invoke_3;
    v11[3] = &unk_1E65420F0;
    v11[4] = *(void *)(a1 + 32);
    [v7 dismissPresentedContentWithCompletionHandler:v11];

    id v8 = [*(id *)(a1 + 32) contentDismissalCompletionHandlers];
    id v9 = (void *)[v5 copy];
    id v10 = _Block_copy(v9);
    [v8 addObject:v10];
  }
  else
  {
    v5[2](v5);
  }
}

void __90__WFDialogPresentationManager_dismissPresentedContentForRunningContext_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 presentationManager:*(void *)(a1 + 32) dismissPresentedContentWithCompletionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

void __90__WFDialogPresentationManager_dismissPresentedContentForRunningContext_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__WFDialogPresentationManager_dismissPresentedContentForRunningContext_completionHandler___block_invoke_4;
  block[3] = &unk_1E65420F0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void __90__WFDialogPresentationManager_dismissPresentedContentForRunningContext_completionHandler___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) persistentRunningContext];

  if (!v2) {
    objc_msgSend(*(id *)(a1 + 32), "queue_deactivateRemoteAlertAndInvalidateConnection");
  }
  char v3 = [*(id *)(a1 + 32) contentDismissalCompletionHandlers];
  uint64_t v6 = [v3 firstObject];

  id v4 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
    id v5 = [*(id *)(a1 + 32) contentDismissalCompletionHandlers];
    [v5 removeObjectAtIndex:0];

    id v4 = (void *)v6;
  }
}

- (void)showDialogRequest:(id)a3 runningContext:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = [(WFDialogPresentationManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__WFDialogPresentationManager_showDialogRequest_runningContext_completionHandler___block_invoke;
  block[3] = &unk_1E65415F0;
  id v20 = v11;
  SEL v21 = a2;
  id v17 = v10;
  uint64_t v18 = self;
  id v19 = v9;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  dispatch_async(v12, block);
}

void __82__WFDialogPresentationManager_showDialogRequest_runningContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 40), @"WFDialogPresentationManager.m", 171, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  id v2 = [*(id *)(a1 + 40) persistentRunningContext];
  unsigned int v3 = [v2 isEqual:*(void *)(a1 + 32)];

  uint64_t v4 = v3;
  [*(id *)(a1 + 40) setDismissalReason:0];
  [*(id *)(a1 + 40) logStartDialogPresentationWithRequest:*(void *)(a1 + 48) presentationMode:v3];
  if ([*(id *)(a1 + 32) allowsDialogNotifications]
    && ([*(id *)(a1 + 40) screenOnObserver],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 screenOn],
        v5,
        (v6 & 1) == 0))
  {
    id v17 = getWFDialogLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v57 = "-[WFDialogPresentationManager showDialogRequest:runningContext:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_DEFAULT, "%s Screen is off, so posting dialog request as a notification.", buf, 0xCu);
    }

    [*(id *)(a1 + 40) setDismissalReason:*MEMORY[0x1E4FB4E90]];
    [*(id *)(a1 + 40) logFinishDialogPresentationWithRequest:*(void *)(a1 + 48) presentationMode:v4 automationType:0];
    [*(id *)(a1 + 40) postNotificationWithRequest:*(void *)(a1 + 48) presentationMode:v4 context:*(void *)(a1 + 32)];
  }
  else
  {
    id v7 = *(id *)(a1 + 48);
    if (v4)
    {
      id v8 = *(id *)(a1 + 48);
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = [v8 textFieldConfiguration];
          id v10 = (void *)[v9 copy];

          [v10 setFocusImmediatelyWhenPresented:1];
          id v11 = objc_alloc(MEMORY[0x1E4FB4798]);
          int v12 = [v8 message];
          id v13 = [v8 attribution];
          id v14 = [v8 prompt];
          id v15 = [v8 parameterKey];
          uint64_t v16 = [v11 initWithTextFieldConfiguration:v10 message:v12 attribution:v13 prompt:v14 parameterKey:v15];

          id v7 = (id)v16;
        }
        else
        {
          id v10 = v8;
          id v8 = 0;
        }
      }
      else
      {
        id v10 = 0;
      }

      id v18 = *(id *)(a1 + 48);
      if (v18)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v19 = [v18 requestBySettingFocusImmediatelyWhenPresented:1];

          id v7 = (id)v19;
        }
      }
    }
    id v20 = [WFPresentedDialog alloc];
    uint64_t v21 = *(void *)(a1 + 32);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __82__WFDialogPresentationManager_showDialogRequest_runningContext_completionHandler___block_invoke_191;
    v52[3] = &unk_1E6540840;
    id v53 = *(id *)(a1 + 48);
    int8x16_t v51 = *(int8x16_t *)(a1 + 32);
    id v22 = (id)v51.i64[0];
    int8x16_t v54 = vextq_s8(v51, v51, 8uLL);
    id v55 = *(id *)(a1 + 56);
    uint64_t v23 = [(WFPresentedDialog *)v20 initWithRequest:v7 presentationMode:v4 runningContext:v21 completionHandler:v52];
    v24 = getWFDialogLogObject();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v25)
      {
        uint64_t v26 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 136315394;
        v57 = "-[WFDialogPresentationManager showDialogRequest:runningContext:completionHandler:]_block_invoke_2";
        __int16 v58 = 2112;
        uint64_t v59 = v26;
        _os_log_impl(&dword_1C7D7E000, v24, OS_LOG_TYPE_DEFAULT, "%s Adding %@ to persistent presentation queue.", buf, 0x16u);
      }

      uint64_t v27 = [*(id *)(a1 + 40) persistentPresentationQueue];
    }
    else
    {
      if (v25)
      {
        uint64_t v28 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 136315394;
        v57 = "-[WFDialogPresentationManager showDialogRequest:runningContext:completionHandler:]_block_invoke";
        __int16 v58 = 2112;
        uint64_t v59 = v28;
        _os_log_impl(&dword_1C7D7E000, v24, OS_LOG_TYPE_DEFAULT, "%s Adding %@ to transient presentation queue.", buf, 0x16u);
      }

      uint64_t v27 = [*(id *)(a1 + 40) otherPresentationQueue];
    }
    v29 = v27;
    [v27 addObject:v23];

    uint64_t v30 = [*(id *)(a1 + 40) remoteAlertPresenter];

    if (v30)
    {
      uint64_t v31 = [*(id *)(a1 + 40) presentedDialog];
      if (v31)
      {
        v32 = (void *)v31;
        v33 = [*(id *)(a1 + 40) presentedDialog];
        v34 = [v33 response];
        char v35 = [v34 shouldDismissDialogInTransientMode];

        if ((v35 & 1) == 0)
        {
          v36 = getWFDialogLogObject();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v57 = "-[WFDialogPresentationManager showDialogRequest:runningContext:completionHandler:]_block_invoke";
            _os_log_impl(&dword_1C7D7E000, v36, OS_LOG_TYPE_DEFAULT, "%s There's a presented dialog. We are ignoring it and moving on because the presented dialog already has a response and shouldDismissDialogInTransientMode was NO, which means it was likely just waiting for a followup.", buf, 0xCu);
          }

          [*(id *)(a1 + 40) setPresentedDialog:0];
        }
      }
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v38 = [*(id *)(a1 + 40) remoteAlertPresenter];
      char v39 = [v38 alertIsActive];

      if ((v39 & 1) == 0)
      {
        v40 = getWFDialogLogObject();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v57 = "-[WFDialogPresentationManager showDialogRequest:runningContext:completionHandler:]_block_invoke";
          _os_log_impl(&dword_1C7D7E000, v40, OS_LOG_TYPE_INFO, "%s No remote alert is active, so activating one.", buf, 0xCu);
        }

        if (isKindOfClass)
        {
          id v41 = *(id *)(a1 + 48);
          if (v41)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v42 = v41;
            }
            else {
              v42 = 0;
            }
          }
          else
          {
            v42 = 0;
          }
          id v43 = v42;

          v44 = [v43 applicationBundleIdentifier];
          [*(id *)(a1 + 40) activateRemoteAlertTiedToBundleIdentifier:v44];
        }
        else
        {
          [*(id *)(a1 + 40) activateRemoteAlert];
        }
      }
      uint64_t v45 = [*(id *)(a1 + 40) connectedRemoteAlert];
      if (v45)
      {
        v46 = (void *)v45;
        v47 = [*(id *)(a1 + 40) presentedDialog];
        if (v47)
        {
        }
        else
        {
          int v48 = objc_msgSend(*(id *)(a1 + 40), "queue_hasMoreDialogsToPresent");

          if (v48)
          {
            v49 = getWFDialogLogObject();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v57 = "-[WFDialogPresentationManager showDialogRequest:runningContext:completionHandler:]_block_invoke";
              _os_log_impl(&dword_1C7D7E000, v49, OS_LOG_TYPE_INFO, "%s There is a connected remote alert, so asking it to present a dialog.", buf, 0xCu);
            }

            objc_msgSend(*(id *)(a1 + 40), "queue_presentNextDialog");
          }
        }
      }
    }
  }
}

void __82__WFDialogPresentationManager_showDialogRequest_runningContext_completionHandler___block_invoke_191(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
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

  id v17 = v3;
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v17;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  if (v6 && v8)
  {
    id v9 = [v6 configuration];
    id v10 = [v9 workflowReference];
    if (v10)
    {
      id v11 = [*(id *)(a1 + 40) delegate];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        id v13 = [*(id *)(a1 + 40) delegate];
        uint64_t v14 = *(void *)(a1 + 40);
        id v15 = [v8 promptedStatesData];
        uint64_t v16 = [v9 actionUUID];
        [v13 presentationManager:v14 updateSmartPromptStateData:v15 actionUUID:v16 context:*(void *)(a1 + 48) reference:v10];
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (BOOL)hasPersistentState
{
  id v2 = self;
  id v3 = [(WFDialogPresentationManager *)self queue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [(WFDialogPresentationManager *)v2 queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__WFDialogPresentationManager_hasPersistentState__block_invoke;
  v6[3] = &unk_1E6542078;
  v6[4] = v2;
  v6[5] = &v7;
  dispatch_sync(v4, v6);

  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

void __49__WFDialogPresentationManager_hasPersistentState__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) persistentRunningContext];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 != 0;
}

- (BOOL)queue_hasMoreDialogsToPresent
{
  id v3 = [(WFDialogPresentationManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(WFDialogPresentationManager *)self persistentRunningContext];
  if (v4) {
    [(WFDialogPresentationManager *)self persistentPresentationQueue];
  }
  else {
  id v5 = [(WFDialogPresentationManager *)self otherPresentationQueue];
  }
  uint64_t v6 = [v5 count];

  return v6 != 0;
}

- (void)queue_connectedRemoteAlertDidDisconnect
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFDialogPresentationManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = getWFDialogLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[WFDialogPresentationManager queue_connectedRemoteAlertDidDisconnect]";
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEFAULT, "%s Connected remote alert did disconnect", buf, 0xCu);
  }

  [(WFDialogPresentationManager *)self setConnectedRemoteAlert:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(WFDialogPresentationManager *)self contentDismissalCompletionHandlers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * v9);
        if (v10) {
          (*(void (**)(void))(v10 + 16))();
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)handleRemovedIgnoredNotifications:(id)a3
{
  id v4 = a3;
  id v5 = [(WFDialogPresentationManager *)self notificationManager];
  [v5 handleRemovedIgnoredNotifications:v4];
}

- (void)dealloc
{
  [(WFScreenOnObserver *)self->_screenOnObserver stop];
  v3.receiver = self;
  v3.super_class = (Class)WFDialogPresentationManager;
  [(WFDialogPresentationManager *)&v3 dealloc];
}

- (WFDialogPresentationManager)initWithListener:(id)a3 notificationManager:(id)a4 dialogAlertPresenter:(id)a5 screenOnObserver:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v37.receiver = self;
  v37.super_class = (Class)WFDialogPresentationManager;
  id v15 = [(WFDialogPresentationManager *)&v37 init];
  if (v15)
  {
    [v13 setDelegate:v15];
    objc_storeStrong((id *)&v15->_remoteAlertPresenter, a5);
    uint64_t v16 = objc_opt_new();
    [v16 setStatusPresenterDelegate:v15];
    statusPresenter = v15->_statusPresenter;
    v15->_statusPresenter = (WFDialogAlertPresenter *)v16;
    id v36 = v16;

    uint64_t v18 = objc_opt_new();
    contextsAwaitingStatusPresentation = v15->_contextsAwaitingStatusPresentation;
    v15->_contextsAwaitingStatusPresentation = (NSMutableArray *)v18;

    uint64_t v20 = objc_opt_new();
    attributionsAwaitingStatusPresentation = v15->_attributionsAwaitingStatusPresentation;
    v15->_attributionsAwaitingStatusPresentation = (NSMutableArray *)v20;

    objc_storeStrong((id *)&v15->_listener, a3);
    [(NSXPCListener *)v15->_listener setDelegate:v15];
    uint64_t v22 = objc_opt_new();
    connectedRunners = v15->_connectedRunners;
    v15->_connectedRunners = (NSMutableSet *)v22;

    v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    BOOL v25 = dispatch_queue_attr_make_with_qos_class(v24, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v26 = dispatch_queue_create("com.apple.shortcuts.WFDialogPresentationManager", v25);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v26;

    uint64_t v28 = objc_opt_new();
    persistentPresentationQueue = v15->_persistentPresentationQueue;
    v15->_persistentPresentationQueue = (NSMutableArray *)v28;

    uint64_t v30 = objc_opt_new();
    otherPresentationQueue = v15->_otherPresentationQueue;
    v15->_otherPresentationQueue = (NSMutableArray *)v30;

    uint64_t v32 = objc_opt_new();
    contentDismissalCompletionHandlers = v15->_contentDismissalCompletionHandlers;
    v15->_contentDismissalCompletionHandlers = (NSMutableArray *)v32;

    objc_storeStrong((id *)&v15->_notificationManager, a4);
    objc_storeStrong((id *)&v15->_screenOnObserver, a6);
    [(WFScreenOnObserver *)v15->_screenOnObserver setDelegate:v15];
    [(WFScreenOnObserver *)v15->_screenOnObserver start];

    v34 = v15;
  }

  return v15;
}

- (WFDialogPresentationManager)initWithNotificationManager:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F29290];
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithMachServiceName:@"com.apple.shortcuts.dialogpresentation"];
  uint64_t v7 = objc_alloc_init(WFSpringBoardRemoteAlertPresenter);
  id v8 = objc_alloc_init(MEMORY[0x1E4FB72E8]);
  uint64_t v9 = [(WFDialogPresentationManager *)self initWithListener:v6 notificationManager:v5 dialogAlertPresenter:v7 screenOnObserver:v8];

  uint64_t v10 = v9;
  [v6 resume];

  return v10;
}

@end