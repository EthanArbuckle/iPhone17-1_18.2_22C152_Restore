@interface WFCompactHostingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)handlingRequest;
- (BOOL)hasViewAppeared;
- (BOOL)preparingToPresentDialog;
- (BOOL)screenIsLocked;
- (MTMaterialView)materialView;
- (NSProgress)progress;
- (NSTimer)statusViewTimer;
- (UIView)dimmingView;
- (WFActionUserInterfaceListener)actionInterfaceListener;
- (WFCompactHostingViewController)initWithScreenLocked:(BOOL)a3 delegate:(id)a4;
- (WFCompactHostingViewControllerDelegate)delegate;
- (WFCompactStatusViewController)statusViewController;
- (WFCompactUnlockService)unlockService;
- (WFDebouncer)singleStepShortcutCompletionDialogDebouncer;
- (WFDialogAttribution)runningAttribution;
- (WFDialogRequest)pendingRequest;
- (WFWorkflowRunningContext)runningContext;
- (id)presentationAnchorForActionUserInterface:(id)a3;
- (id)progressSubscriber;
- (id)requestCompletionHandler;
- (unint64_t)allowedInterfaceOrientations;
- (void)actionUserInterface:(id)a3 setSupportedInterfaceOrientations:(unint64_t)a4;
- (void)actionUserInterface:(id)a3 showViewControllerInPlatter:(id)a4;
- (void)cancelAndDismiss;
- (void)clearStatusViewTimer;
- (void)dealloc;
- (void)dialogViewController:(id)a3 didFinishWithResponse:(id)a4 waitForFollowUpRequest:(BOOL)a5;
- (void)dismissPersistentChromeWithSuccess:(BOOL)a3 customAttribution:(id)a4 completionHandler:(id)a5;
- (void)dismissPlatterForActionUserInterface:(id)a3 completionHandler:(id)a4;
- (void)dismissPlatterViewControllerAndUpdateChromeAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)dismissPlatterViewControllerIfNecessaryAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)dismissPresentedContentWithCompletionHandler:(id)a3;
- (void)handlePendingRequest;
- (void)handleRequest:(id)a3 completionHandler:(id)a4;
- (void)handleTapGesture:(id)a3;
- (void)keyboardWillChange;
- (void)loadView;
- (void)preparePersistentChromeWithContext:(id)a3 attribution:(id)a4;
- (void)presentChromeIfPossible;
- (void)presentStatusViewController;
- (void)scheduleStatusViewToAppear;
- (void)setActionInterfaceListener:(id)a3;
- (void)setAllowedInterfaceOrientations:(unint64_t)a3;
- (void)setDimmingView:(id)a3;
- (void)setHandlingRequest:(BOOL)a3;
- (void)setHasViewAppeared:(BOOL)a3;
- (void)setMaterialView:(id)a3;
- (void)setPendingRequest:(id)a3;
- (void)setPreparingToPresentDialog:(BOOL)a3;
- (void)setProgress:(id)a3;
- (void)setProgressSubscriber:(id)a3;
- (void)setRequestCompletionHandler:(id)a3;
- (void)setRunningAttribution:(id)a3;
- (void)setRunningContext:(id)a3;
- (void)setSingleStepShortcutCompletionDialogDebouncer:(id)a3;
- (void)setStatusViewController:(id)a3;
- (void)setStatusViewTimer:(id)a3;
- (void)setTouchPassthrough:(BOOL)a3;
- (void)updateChromeVisibilityWithCompletionHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation WFCompactHostingViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleStepShortcutCompletionDialogDebouncer, 0);
  objc_storeStrong((id *)&self->_unlockService, 0);
  objc_storeStrong(&self->_requestCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
  objc_storeStrong((id *)&self->_statusViewTimer, 0);
  objc_storeStrong((id *)&self->_statusViewController, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong(&self->_progressSubscriber, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_runningAttribution, 0);
  objc_storeStrong((id *)&self->_runningContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionInterfaceListener, 0);
}

- (void)setSingleStepShortcutCompletionDialogDebouncer:(id)a3
{
}

- (WFDebouncer)singleStepShortcutCompletionDialogDebouncer
{
  return self->_singleStepShortcutCompletionDialogDebouncer;
}

- (WFCompactUnlockService)unlockService
{
  return self->_unlockService;
}

- (void)setRequestCompletionHandler:(id)a3
{
}

- (id)requestCompletionHandler
{
  return self->_requestCompletionHandler;
}

- (void)setPreparingToPresentDialog:(BOOL)a3
{
  self->_preparingToPresentDialog = a3;
}

- (BOOL)preparingToPresentDialog
{
  return self->_preparingToPresentDialog;
}

- (void)setHandlingRequest:(BOOL)a3
{
  self->_handlingRequest = a3;
}

- (BOOL)handlingRequest
{
  return self->_handlingRequest;
}

- (void)setPendingRequest:(id)a3
{
}

- (WFDialogRequest)pendingRequest
{
  return self->_pendingRequest;
}

- (void)setAllowedInterfaceOrientations:(unint64_t)a3
{
  self->_allowedInterfaceOrientations = a3;
}

- (unint64_t)allowedInterfaceOrientations
{
  return self->_allowedInterfaceOrientations;
}

- (void)setStatusViewTimer:(id)a3
{
}

- (NSTimer)statusViewTimer
{
  return self->_statusViewTimer;
}

- (void)setStatusViewController:(id)a3
{
}

- (WFCompactStatusViewController)statusViewController
{
  return self->_statusViewController;
}

- (void)setMaterialView:(id)a3
{
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (void)setDimmingView:(id)a3
{
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setHasViewAppeared:(BOOL)a3
{
  self->_hasViewAppeared = a3;
}

- (BOOL)hasViewAppeared
{
  return self->_hasViewAppeared;
}

- (void)setProgressSubscriber:(id)a3
{
}

- (id)progressSubscriber
{
  return self->_progressSubscriber;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setRunningAttribution:(id)a3
{
}

- (WFDialogAttribution)runningAttribution
{
  return self->_runningAttribution;
}

- (void)setRunningContext:(id)a3
{
}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (BOOL)screenIsLocked
{
  return self->_screenIsLocked;
}

- (WFCompactHostingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFCompactHostingViewControllerDelegate *)WeakRetained;
}

- (void)setActionInterfaceListener:(id)a3
{
}

- (WFActionUserInterfaceListener)actionInterfaceListener
{
  return self->_actionInterfaceListener;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dismissPlatterForActionUserInterface:(id)a3 completionHandler:(id)a4
{
}

- (void)actionUserInterface:(id)a3 setSupportedInterfaceOrientations:(unint64_t)a4
{
}

- (void)actionUserInterface:(id)a3 showViewControllerInPlatter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v11 = objc_alloc_init(WFCompactPlatterViewController);
  v8 = [(WFCompactPlatterViewController *)v11 platterView];
  v9 = [v7 attribution];

  [v8 setAttribution:v9];
  v10 = [(WFCompactPlatterViewController *)v11 platterView];
  [v10 applyMaterialViewStyling];

  [(WFCompactPlatterViewController *)v11 setContentViewController:v6];
  [(WFCompactHostingViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (id)presentationAnchorForActionUserInterface:(id)a3
{
  v3 = [(WFCompactHostingViewController *)self view];
  v4 = [v3 window];

  return v4;
}

- (void)dismissPersistentChromeWithSuccess:(BOOL)a3 customAttribution:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  [(WFCompactHostingViewController *)self clearStatusViewTimer];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__WFCompactHostingViewController_dismissPersistentChromeWithSuccess_customAttribution_completionHandler___block_invoke;
  aBlock[3] = &unk_2649CBBA0;
  aBlock[4] = self;
  id v10 = v9;
  id v25 = v10;
  v11 = _Block_copy(aBlock);
  v12 = v11;
  if (v6)
  {
    uint64_t v13 = [(WFCompactHostingViewController *)self presentedViewController];
    if (!v13) {
      goto LABEL_4;
    }
    v14 = (void *)v13;
    v15 = [(WFCompactHostingViewController *)self presentedViewController];
    v16 = [(WFCompactHostingViewController *)self statusViewController];

    if (v15 == v16)
    {
      v20 = [(WFCompactHostingViewController *)self statusViewController];
      [v20 transitionToCompleted:1 animated:1];

      dispatch_time_t v21 = dispatch_time(0, 750000000);
      dispatch_after(v21, MEMORY[0x263EF83A0], v12);
    }
    else
    {
LABEL_4:
      v17 = objc_alloc_init(WFCompactStatusViewController);
      v18 = v17;
      if (v8)
      {
        [(WFCompactStatusViewController *)v17 setAttribution:v8];
      }
      else
      {
        v19 = [(WFCompactHostingViewController *)self runningAttribution];
        [(WFCompactStatusViewController *)v18 setAttribution:v19];
      }
      [(WFCompactStatusViewController *)v18 transitionToCompleted:1 animated:1];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __105__WFCompactHostingViewController_dismissPersistentChromeWithSuccess_customAttribution_completionHandler___block_invoke_2;
      v22[3] = &unk_2649CBAD8;
      id v23 = v12;
      [(WFCompactHostingViewController *)self presentViewController:v18 animated:1 completion:v22];
    }
  }
  else
  {
    (*((void (**)(void *))v11 + 2))(v11);
  }
}

uint64_t __105__WFCompactHostingViewController_dismissPersistentChromeWithSuccess_customAttribution_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setRunningContext:0];
  [*(id *)(a1 + 32) setRunningAttribution:0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 dismissPlatterViewControllerAndUpdateChromeAnimated:1 completionHandler:v3];
}

void __105__WFCompactHostingViewController_dismissPersistentChromeWithSuccess_customAttribution_completionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  uint64_t v3 = *(void **)(a1 + 32);
  v4 = MEMORY[0x263EF83A0];
  dispatch_after(v2, v4, v3);
}

- (void)dismissPlatterViewControllerAndUpdateChromeAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __104__WFCompactHostingViewController_dismissPlatterViewControllerAndUpdateChromeAnimated_completionHandler___block_invoke;
  v15[3] = &unk_2649CBF20;
  id v8 = v7;
  v16 = v8;
  [(WFCompactHostingViewController *)self dismissPlatterViewControllerIfNecessaryAnimated:v4 completionHandler:v15];
  dispatch_group_enter(v8);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __104__WFCompactHostingViewController_dismissPlatterViewControllerAndUpdateChromeAnimated_completionHandler___block_invoke_2;
  v13[3] = &unk_2649CBF20;
  v14 = v8;
  id v9 = v8;
  [(WFCompactHostingViewController *)self updateChromeVisibilityWithCompletionHandler:v13];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __104__WFCompactHostingViewController_dismissPlatterViewControllerAndUpdateChromeAnimated_completionHandler___block_invoke_3;
  block[3] = &unk_2649CBAD8;
  id v12 = v6;
  id v10 = v6;
  dispatch_group_notify(v9, MEMORY[0x263EF83A0], block);
}

void __104__WFCompactHostingViewController_dismissPlatterViewControllerAndUpdateChromeAnimated_completionHandler___block_invoke(uint64_t a1)
{
}

void __104__WFCompactHostingViewController_dismissPlatterViewControllerAndUpdateChromeAnimated_completionHandler___block_invoke_2(uint64_t a1)
{
}

uint64_t __104__WFCompactHostingViewController_dismissPlatterViewControllerAndUpdateChromeAnimated_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)dismissPlatterViewControllerIfNecessaryAnimated:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = [(WFCompactHostingViewController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __100__WFCompactHostingViewController_dismissPlatterViewControllerIfNecessaryAnimated_completionHandler___block_invoke;
    block[3] = &unk_2649CBBC8;
    void block[4] = self;
    BOOL v11 = a3;
    id v10 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

uint64_t __100__WFCompactHostingViewController_dismissPlatterViewControllerIfNecessaryAnimated_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)dismissPresentedContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__WFCompactHostingViewController_dismissPresentedContentWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_2649CBBA0;
  aBlock[4] = self;
  id v5 = v4;
  id v12 = v5;
  id v6 = (void (**)(void))_Block_copy(aBlock);
  [(WFCompactHostingViewController *)self setHandlingRequest:0];
  [(WFCompactHostingViewController *)self setPreparingToPresentDialog:0];
  [(WFCompactHostingViewController *)self setAllowedInterfaceOrientations:30];
  id v7 = [(WFCompactHostingViewController *)self presentedViewController];
  if (!v7
    || ([(WFCompactHostingViewController *)self statusViewController],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7 == v8))
  {
    v6[2](v6);
  }
  else
  {
    [(WFCompactHostingViewController *)self clearStatusViewTimer];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __79__WFCompactHostingViewController_dismissPresentedContentWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_2649CBBA0;
    v9[4] = self;
    id v10 = v6;
    [(WFCompactHostingViewController *)self dismissPlatterViewControllerAndUpdateChromeAnimated:1 completionHandler:v9];
  }
}

uint64_t __79__WFCompactHostingViewController_dismissPresentedContentWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setActionInterfaceListener:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __79__WFCompactHostingViewController_dismissPresentedContentWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) scheduleStatusViewToAppear];
  dispatch_time_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)dialogViewController:(id)a3 didFinishWithResponse:(id)a4 waitForFollowUpRequest:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__WFCompactHostingViewController_dialogViewController_didFinishWithResponse_waitForFollowUpRequest___block_invoke;
  aBlock[3] = &unk_2649CC068;
  id v10 = v8;
  id v17 = v10;
  v18 = self;
  id v11 = v9;
  id v19 = v11;
  id v12 = _Block_copy(aBlock);
  uint64_t v13 = v12;
  if (v5)
  {
    (*((void (**)(void *))v12 + 2))(v12);
  }
  else
  {
    [(WFCompactHostingViewController *)self setHandlingRequest:0];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __100__WFCompactHostingViewController_dialogViewController_didFinishWithResponse_waitForFollowUpRequest___block_invoke_2;
    v14[3] = &unk_2649CBBA0;
    v14[4] = self;
    id v15 = v13;
    [(WFCompactHostingViewController *)self dismissPlatterViewControllerAndUpdateChromeAnimated:1 completionHandler:v14];
  }
}

void __100__WFCompactHostingViewController_dialogViewController_didFinishWithResponse_waitForFollowUpRequest___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 40) setTouchPassthrough:0];
  }
  dispatch_time_t v2 = [*(id *)(a1 + 40) requestCompletionHandler];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) requestCompletionHandler];
    v3[2](v3, *(void *)(a1 + 48));

    id v4 = *(void **)(a1 + 40);
    [v4 setRequestCompletionHandler:0];
  }
}

uint64_t __100__WFCompactHostingViewController_dialogViewController_didFinishWithResponse_waitForFollowUpRequest___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) scheduleStatusViewToAppear];
  dispatch_time_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)handlePendingRequest
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(WFCompactHostingViewController *)self clearStatusViewTimer];
  uint64_t v3 = [(WFCompactHostingViewController *)self pendingRequest];
  [(WFCompactHostingViewController *)self setHandlingRequest:1];
  [(WFCompactHostingViewController *)self setPendingRequest:0];
  id v4 = [(WFCompactHostingViewController *)self presentedViewController];
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v4 = 0;
LABEL_8:
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    id v12 = __54__WFCompactHostingViewController_handlePendingRequest__block_invoke;
    uint64_t v13 = &unk_2649CC018;
    id v14 = v3;
    id v15 = self;
    id v8 = (void (**)(void))_Block_copy(&v10);
    id v9 = [(WFCompactHostingViewController *)self presentedViewController];

    if (v9)
    {
      [(WFCompactHostingViewController *)self dismissPlatterViewControllerAndUpdateChromeAnimated:1 completionHandler:v8];
    }
    else
    {
      [(WFCompactHostingViewController *)self updateChromeVisibilityWithCompletionHandler:0];
      v8[2](v8);
    }

    goto LABEL_12;
  }
  int v5 = [v4 canHandleFollowUpRequest:v3];
  id v6 = getWFDialogLogObject();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315394;
      id v17 = "-[WFCompactHostingViewController handlePendingRequest]";
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_22D994000, v6, OS_LOG_TYPE_DEFAULT, "%s Currently presented platter could not handle the follow up, dismissing: %@", buf, 0x16u);
    }

    goto LABEL_8;
  }
  if (v7)
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[WFCompactHostingViewController handlePendingRequest]";
    _os_log_impl(&dword_22D994000, v6, OS_LOG_TYPE_DEFAULT, "%s Currently presented platter can handle follow up request", buf, 0xCu);
  }

  [v4 handleFollowUpRequest:v3];
LABEL_12:
}

void __54__WFCompactHostingViewController_handlePendingRequest__block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 40) setTouchPassthrough:1];
    dispatch_time_t v2 = objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(a1 + 32), "wf_dialogViewControllerClass")), "initWithRequest:", *(void *)(a1 + 32));
    [v2 setDelegate:*(void *)(a1 + 40)];
    if (WFIsRunningOniPad())
    {
      dispatch_time_t v3 = dispatch_time(0, 600000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __54__WFCompactHostingViewController_handlePendingRequest__block_invoke_2;
      block[3] = &unk_2649CC018;
      void block[4] = *(void *)(a1 + 40);
      id v31 = v2;
      dispatch_after(v3, MEMORY[0x263EF83A0], block);
    }
    else
    {
      [*(id *)(a1 + 40) presentViewController:v2 animated:1 completion:0];
    }
  }
  else if ([(id)objc_opt_class() conformsToProtocol:&unk_26E23D8B0])
  {
    id v4 = objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(a1 + 32), "wf_dialogViewControllerClass")), "initWithRequest:", *(void *)(a1 + 32));
    [v4 setDelegate:*(void *)(a1 + 40)];
    [*(id *)(a1 + 40) setPreparingToPresentDialog:1];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __54__WFCompactHostingViewController_handlePendingRequest__block_invoke_3;
    v28[3] = &unk_2649CC018;
    v28[4] = *(void *)(a1 + 40);
    id v29 = v4;
    id v5 = v4;
    [v5 prepareForPresentationWithCompletionHandler:v28];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [*(id *)(a1 + 40) unlockService];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __54__WFCompactHostingViewController_handlePendingRequest__block_invoke_4;
      v26[3] = &unk_2649CBB78;
      int8x16_t v24 = *(int8x16_t *)(a1 + 32);
      id v7 = (id)v24.i64[0];
      int8x16_t v27 = vextq_s8(v24, v24, 8uLL);
      [v6 requestUnlockIfNeeded:v26];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [*(id *)(a1 + 40) setTouchPassthrough:1];
        id v8 = [*(id *)(a1 + 40) requestCompletionHandler];

        if (v8)
        {
          id v9 = [*(id *)(a1 + 40) view];
          [v9 bounds];
          +[WFCompactPlatterPresentationController preferredSizeForPresentingInContainerViewOfSize:](WFCompactPlatterPresentationController, "preferredSizeForPresentingInContainerViewOfSize:", v10, v11);
          double v13 = v12;

          id v14 = [MEMORY[0x263EFF960] currentLocale];
          id v15 = objc_alloc(MEMORY[0x263F52148]);
          v16 = [*(id *)(a1 + 40) traitCollection];
          id v17 = objc_msgSend(v15, "initWithSize:locale:traitCollection:", v14, v16, v13, 1.79769313e308);

          __int16 v18 = [*(id *)(a1 + 40) requestCompletionHandler];
          id v19 = (void *)[objc_alloc(MEMORY[0x263F86CA0]) initWithEnvironment:v17];
          ((void (**)(void, void *))v18)[2](v18, v19);

          [*(id *)(a1 + 40) setRequestCompletionHandler:0];
        }
        [*(id *)(a1 + 40) setTouchPassthrough:0];
        uint64_t v20 = *(void **)(a1 + 40);
        [v20 setHandlingRequest:0];
      }
      else
      {
        dispatch_time_t v21 = getWFDialogLogObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v22 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136315394;
          v33 = "-[WFCompactHostingViewController handlePendingRequest]_block_invoke";
          __int16 v34 = 2114;
          uint64_t v35 = v22;
          _os_log_impl(&dword_22D994000, v21, OS_LOG_TYPE_ERROR, "%s Could not find a view class to handle the dialog request: %{public}@", buf, 0x16u);
        }

        [*(id *)(a1 + 40) setHandlingRequest:0];
        id v23 = *(void **)(a1 + 40);
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __54__WFCompactHostingViewController_handlePendingRequest__block_invoke_267;
        v25[3] = &unk_2649CBF20;
        v25[4] = v23;
        [v23 updateChromeVisibilityWithCompletionHandler:v25];
      }
    }
  }
}

uint64_t __54__WFCompactHostingViewController_handlePendingRequest__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

uint64_t __54__WFCompactHostingViewController_handlePendingRequest__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setPreparingToPresentDialog:0];
  dispatch_time_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 presentViewController:v3 animated:1 completion:0];
}

void __54__WFCompactHostingViewController_handlePendingRequest__block_invoke_4(uint64_t a1, char a2)
{
  if (a2)
  {
    id v22 = *(id *)(a1 + 40);
    uint64_t v3 = WFUserInterfaceFromViewController();
    id v4 = objc_alloc(MEMORY[0x263F87980]);
    uint64_t v5 = *MEMORY[0x263F33B40];
    id v6 = [v22 actionClassName];
    id v7 = [v22 classNamesByType];
    id v8 = [*(id *)(a1 + 40) attribution];
    id v9 = (void *)[v4 initWithUserInterfaceType:v5 actionClassName:v6 classNamesByType:v7 attribution:v8];

    uint64_t v10 = *(void *)(a1 + 32);
    double v11 = [v9 actionInterface];
    [v11 setDelegate:v10];

    [*(id *)(a1 + 32) setActionInterfaceListener:v9];
    double v12 = [*(id *)(a1 + 32) requestCompletionHandler];

    if (v12)
    {
      double v13 = [*(id *)(a1 + 32) requestCompletionHandler];
      id v14 = objc_alloc(MEMORY[0x263F86EA8]);
      id v15 = [v9 endpoint];
      v16 = [v3 userInterfaceType];
      id v17 = (void *)[v14 initWithListenerEndpoint:v15 userInterfaceType:v16];
      ((void (**)(void, void *))v13)[2](v13, v17);

      [*(id *)(a1 + 32) setRequestCompletionHandler:0];
    }
  }
  else
  {
    __int16 v18 = [*(id *)(a1 + 32) requestCompletionHandler];

    if (v18)
    {
      id v19 = [*(id *)(a1 + 32) requestCompletionHandler];
      uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263F85280]) initWithCancelled:1];
      ((void (**)(void, void *))v19)[2](v19, v20);

      dispatch_time_t v21 = *(void **)(a1 + 32);
      [v21 setRequestCompletionHandler:0];
    }
  }
}

uint64_t __54__WFCompactHostingViewController_handlePendingRequest__block_invoke_267(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) requestCompletionHandler];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) requestCompletionHandler];
    id v4 = (void *)[objc_alloc(MEMORY[0x263F85280]) initWithCancelled:1];
    ((void (**)(void, void *))v3)[2](v3, v4);

    [*(id *)(a1 + 32) setRequestCompletionHandler:0];
  }
  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 scheduleStatusViewToAppear];
}

- (void)handleRequest:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    double v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFCompactHostingViewController.m", 321, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  double v13 = [MEMORY[0x263F08690] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"WFCompactHostingViewController.m", 322, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  uint64_t v10 = getWFDialogLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[WFCompactHostingViewController handleRequest:completionHandler:]";
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl(&dword_22D994000, v10, OS_LOG_TYPE_DEFAULT, "%s Received request: %{public}@", buf, 0x16u);
  }

  [(WFCompactHostingViewController *)self setPendingRequest:v7];
  double v11 = (void *)[v9 copy];
  [(WFCompactHostingViewController *)self setRequestCompletionHandler:v11];

  [(WFCompactHostingViewController *)self presentChromeIfPossible];
}

- (void)setTouchPassthrough:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(WFCompactHostingViewController *)self dimmingView];
  id v6 = v5;
  if (v3)
  {
    [v5 setHidden:1];

    id v7 = [(WFCompactHostingViewController *)self materialView];
    id v9 = v7;
    uint64_t v8 = 1;
  }
  else
  {
    [v5 setHidden:0];

    id v7 = [(WFCompactHostingViewController *)self materialView];
    id v9 = v7;
    uint64_t v8 = 0;
  }
  [v7 setHidden:v8];
}

- (void)clearStatusViewTimer
{
  BOOL v3 = [(WFCompactHostingViewController *)self statusViewTimer];
  [v3 invalidate];

  [(WFCompactHostingViewController *)self setStatusViewTimer:0];
}

- (void)scheduleStatusViewToAppear
{
  BOOL v3 = [(WFCompactHostingViewController *)self runningContext];

  if (v3)
  {
    id v4 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_presentStatusViewController selector:0 userInfo:0 repeats:0.5];
    [(WFCompactHostingViewController *)self setStatusViewTimer:v4];
  }
}

- (void)presentStatusViewController
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v3 = [(WFCompactHostingViewController *)self runningContext];

  if (v3)
  {
    [(WFCompactHostingViewController *)self clearStatusViewTimer];
    id v4 = getWFDialogLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      id v9 = "-[WFCompactHostingViewController presentStatusViewController]";
      _os_log_impl(&dword_22D994000, v4, OS_LOG_TYPE_DEFAULT, "%s Presenting status view", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v5 = [(WFCompactHostingViewController *)self statusViewController];
    if (!v5)
    {
      uint64_t v5 = objc_alloc_init(WFCompactStatusViewController);
      id v6 = [(WFCompactHostingViewController *)self progress];
      [(WFCompactStatusViewController *)v5 setProgress:v6];

      id v7 = [(WFCompactHostingViewController *)self runningAttribution];
      [(WFCompactStatusViewController *)v5 setAttribution:v7];

      [(WFCompactHostingViewController *)self setStatusViewController:v5];
    }
    [(WFCompactHostingViewController *)self presentViewController:v5 animated:1 completion:0];
  }
}

- (void)updateChromeVisibilityWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(WFCompactHostingViewController *)self handlingRequest])
  {
    int v5 = 1;
  }
  else
  {
    id v6 = [(WFCompactHostingViewController *)self runningContext];
    int v5 = v6 != 0;
  }
  if ([(WFCompactHostingViewController *)self screenIsLocked])
  {
    int v7 = 0;
  }
  else
  {
    int v8 = [(WFCompactHostingViewController *)self presentedViewController];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
    id v10 = v9;

    double v11 = [v10 viewIfLoaded];

    LODWORD(v10) = objc_msgSend(v11, "wf_containsFirstResponder");
    double v12 = [MEMORY[0x263F865C0] sharedKeyboard];
    int v13 = [v12 isVisible] & v10;

    int v7 = v5 & (v13 ^ 1);
    int v5 = v13;
  }
  id v14 = [(WFCompactHostingViewController *)self materialView];
  [v14 weighting];
  int v16 = v15 <= 0.0;

  id v17 = [(WFCompactHostingViewController *)self dimmingView];
  [v17 alpha];
  double v19 = v18;

  if (v5 == v16 || ((v7 ^ (v19 <= 0.0)) & 1) == 0)
  {
    uint64_t v20 = (void *)MEMORY[0x263F82E00];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __78__WFCompactHostingViewController_updateChromeVisibilityWithCompletionHandler___block_invoke;
    v23[3] = &unk_2649CBB28;
    v23[4] = self;
    char v24 = v7;
    char v25 = v5;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __78__WFCompactHostingViewController_updateChromeVisibilityWithCompletionHandler___block_invoke_2;
    v21[3] = &unk_2649CBB50;
    id v22 = v4;
    [v20 animateWithDuration:4 delay:v23 options:v21 animations:0.300000012 completion:0.100000001];
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

void __78__WFCompactHostingViewController_updateChromeVisibilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  BOOL v3 = [*(id *)(a1 + 32) dimmingView];
  [v3 setAlpha:v2];

  if (*(unsigned char *)(a1 + 41)) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  id v5 = [*(id *)(a1 + 32) materialView];
  [v5 setWeighting:v4];
}

uint64_t __78__WFCompactHostingViewController_updateChromeVisibilityWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
  id v5 = a3;
  id v6 = [(WFCompactHostingViewController *)self statusViewController];
  [v6 setProgress:v5];
}

- (void)presentChromeIfPossible
{
  if ([(WFCompactHostingViewController *)self hasViewAppeared])
  {
    BOOL v3 = [(WFCompactHostingViewController *)self pendingRequest];

    if (v3)
    {
      double v4 = [(WFCompactHostingViewController *)self pendingRequest];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v7 = [(WFCompactHostingViewController *)self singleStepShortcutCompletionDialogDebouncer];
        [v7 poke];
      }
      else
      {
        [(WFCompactHostingViewController *)self handlePendingRequest];
      }
    }
    else
    {
      id v6 = [(WFCompactHostingViewController *)self runningContext];

      if (v6)
      {
        [(WFCompactHostingViewController *)self updateChromeVisibilityWithCompletionHandler:0];
        [(WFCompactHostingViewController *)self scheduleStatusViewToAppear];
      }
    }
  }
}

- (void)preparePersistentChromeWithContext:(id)a3 attribution:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    int v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"WFCompactHostingViewController.m", 193, @"Invalid parameter not satisfying: %@", @"runningContext" object file lineNumber description];
  }
  runningContext = self->_runningContext;
  if (runningContext && self->_progressSubscriber) {
    -[WFWorkflowRunningContext removeProgressSubscriber:](runningContext, "removeProgressSubscriber:");
  }
  objc_storeStrong((id *)&self->_runningContext, a3);
  objc_storeStrong((id *)&self->_runningAttribution, a4);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__WFCompactHostingViewController_preparePersistentChromeWithContext_attribution___block_invoke;
  aBlock[3] = &unk_2649CBB00;
  objc_copyWeak(&v15, &location);
  double v11 = _Block_copy(aBlock);
  double v12 = [v8 addProgressSubscriberUsingPublishingHandler:v11];
  [(WFCompactHostingViewController *)self setProgressSubscriber:v12];

  [(WFCompactHostingViewController *)self presentChromeIfPossible];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

id __81__WFCompactHostingViewController_preparePersistentChromeWithContext_attribution___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__WFCompactHostingViewController_preparePersistentChromeWithContext_attribution___block_invoke_2;
  aBlock[3] = &unk_2649CBEF8;
  double v4 = (id *)(a1 + 32);
  objc_copyWeak(&v10, (id *)(a1 + 32));
  id v5 = _Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained setProgress:v3];
  id v7 = _Block_copy(v5);

  objc_destroyWeak(&v10);
  return v7;
}

void __81__WFCompactHostingViewController_preparePersistentChromeWithContext_attribution___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setProgress:0];
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)WFCompactHostingViewController;
  [(WFCompactHostingViewController *)&v6 viewWillLayoutSubviews];
  id v3 = [(WFCompactHostingViewController *)self pendingRequest];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(WFCompactHostingViewController *)self singleStepShortcutCompletionDialogDebouncer];
    [v5 poke];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFCompactHostingViewController;
  [(WFCompactHostingViewController *)&v7 viewDidAppear:a3];
  if (![(WFCompactHostingViewController *)self hasViewAppeared])
  {
    [(WFCompactHostingViewController *)self setHasViewAppeared:1];
    double v4 = [(WFCompactHostingViewController *)self view];
    id v5 = [v4 window];
    objc_super v6 = [v5 _rootSheetPresentationController];
    [v6 _setShouldScaleDownBehindDescendantSheets:0];

    [(WFCompactHostingViewController *)self presentChromeIfPossible];
  }
}

- (void)keyboardWillChange
{
}

- (void)cancelAndDismiss
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (![(WFCompactHostingViewController *)self preparingToPresentDialog])
  {
    id v3 = [(WFCompactHostingViewController *)self progress];

    if (v3)
    {
      double v4 = getWFDialogLogObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v15 = "-[WFCompactHostingViewController cancelAndDismiss]";
        _os_log_impl(&dword_22D994000, v4, OS_LOG_TYPE_DEFAULT, "%s Cancelling NSProgress", buf, 0xCu);
      }

      id v5 = [(WFCompactHostingViewController *)self progress];
      [v5 cancel];
    }
    else
    {
      objc_super v6 = [(WFCompactHostingViewController *)self requestCompletionHandler];

      objc_super v7 = getWFDialogLogObject();
      id v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          id v15 = "-[WFCompactHostingViewController cancelAndDismiss]";
          _os_log_impl(&dword_22D994000, v8, OS_LOG_TYPE_DEFAULT, "%s Cancelling request", buf, 0xCu);
        }

        id v9 = [(WFCompactHostingViewController *)self requestCompletionHandler];
        [(WFCompactHostingViewController *)self setRequestCompletionHandler:0];
        [(WFCompactHostingViewController *)self setHandlingRequest:0];
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __50__WFCompactHostingViewController_cancelAndDismiss__block_invoke;
        v12[3] = &unk_2649CBAD8;
        id v13 = v9;
        id v10 = v9;
        [(WFCompactHostingViewController *)self dismissPlatterViewControllerAndUpdateChromeAnimated:1 completionHandler:v12];
      }
      else
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          id v15 = "-[WFCompactHostingViewController cancelAndDismiss]";
          _os_log_impl(&dword_22D994000, v8, OS_LOG_TYPE_ERROR, "%s Failed to cancel; no NSProgress or request to cancel",
            buf,
            0xCu);
        }

        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __50__WFCompactHostingViewController_cancelAndDismiss__block_invoke_185;
        v11[3] = &unk_2649CBF20;
        v11[4] = self;
        [(WFCompactHostingViewController *)self dismissPlatterViewControllerAndUpdateChromeAnimated:1 completionHandler:v11];
      }
    }
  }
}

void __50__WFCompactHostingViewController_cancelAndDismiss__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (id)[objc_alloc(MEMORY[0x263F85280]) initWithCancelled:1];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __50__WFCompactHostingViewController_cancelAndDismiss__block_invoke_185(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    id v3 = (void *)v2;
    double v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      objc_super v6 = getWFDialogLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        id v9 = "-[WFCompactHostingViewController cancelAndDismiss]_block_invoke";
        _os_log_impl(&dword_22D994000, v6, OS_LOG_TYPE_DEFAULT, "%s Requesting daemon to cleanup the view service", (uint8_t *)&v8, 0xCu);
      }

      objc_super v7 = [*(id *)(a1 + 32) delegate];
      [v7 hostingViewControllerDidRequestExit:*(void *)(a1 + 32)];
    }
  }
}

- (void)handleTapGesture:(id)a3
{
  if ([a3 state] == 3)
  {
    double v4 = [(WFCompactHostingViewController *)self materialView];
    [v4 weighting];
    double v6 = v5;

    if (v6 < 1.0
      || [(WFCompactHostingViewController *)self screenIsLocked]
      && ([MEMORY[0x263F865C0] sharedKeyboard],
          objc_super v7 = objc_claimAutoreleasedReturnValue(),
          char v8 = [v7 isVisible],
          v7,
          (v8 & 1) == 0))
    {
      [(WFCompactHostingViewController *)self cancelAndDismiss];
    }
    else
    {
      id v10 = [(WFCompactHostingViewController *)self view];
      id v9 = [v10 window];
      [v9 endEditing:1];
    }
  }
}

- (void)loadView
{
  v11.receiver = self;
  v11.super_class = (Class)WFCompactHostingViewController;
  [(WFCompactHostingViewController *)&v11 loadView];
  id v3 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v3 setAlpha:0.0];
  double v4 = [(WFCompactHostingViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");

  double v5 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.200000003];
  [v3 setBackgroundColor:v5];

  [v3 setAutoresizingMask:18];
  double v6 = [(WFCompactHostingViewController *)self view];
  [v6 addSubview:v3];

  [(WFCompactHostingViewController *)self setDimmingView:v3];
  objc_super v7 = [MEMORY[0x263F53FE8] materialViewWithRecipe:6 options:0 initialWeighting:0.0];
  [v7 setUserInteractionEnabled:1];
  char v8 = [(WFCompactHostingViewController *)self view];
  [v8 bounds];
  objc_msgSend(v7, "setFrame:");

  [v7 setAutoresizingMask:18];
  id v9 = [(WFCompactHostingViewController *)self view];
  [v9 addSubview:v7];

  [(WFCompactHostingViewController *)self setMaterialView:v7];
  id v10 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_handleTapGesture_];
  [v7 addGestureRecognizer:v10];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F86618] object:0];

  v4.receiver = self;
  v4.super_class = (Class)WFCompactHostingViewController;
  [(WFCompactHostingViewController *)&v4 dealloc];
}

- (WFCompactHostingViewController)initWithScreenLocked:(BOOL)a3 delegate:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)WFCompactHostingViewController;
  objc_super v7 = [(WFCompactHostingViewController *)&v20 init];
  char v8 = v7;
  if (v7)
  {
    v7->_screenIsLocked = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    uint64_t v9 = objc_opt_new();
    unlockService = v8->_unlockService;
    v8->_unlockService = (WFCompactUnlockService *)v9;

    v8->_allowedInterfaceOrientations = 30;
    id v11 = objc_alloc(MEMORY[0x263F86A88]);
    BOOL v12 = WFIsRunningOniPad();
    double v13 = 0.1;
    if (v12) {
      double v13 = 0.2;
    }
    uint64_t v14 = [v11 initWithDelay:MEMORY[0x263EF83A0] maximumDelay:v13 queue:0.8];
    singleStepShortcutCompletionDialogDebouncer = v8->_singleStepShortcutCompletionDialogDebouncer;
    v8->_singleStepShortcutCompletionDialogDebouncer = (WFDebouncer *)v14;

    uint64_t v16 = [(WFCompactHostingViewController *)v8 singleStepShortcutCompletionDialogDebouncer];
    [v16 addTarget:v8 action:sel_handlePendingRequest];

    [(WFCompactHostingViewController *)v8 setModalPresentationStyle:6];
    [(WFCompactHostingViewController *)v8 setModalTransitionStyle:2];
    [MEMORY[0x263F865C0] beginObservingKeyboardNotifications];
    id v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v8 selector:sel_keyboardWillChange name:*MEMORY[0x263F86618] object:0];

    double v18 = v8;
  }

  return v8;
}

@end