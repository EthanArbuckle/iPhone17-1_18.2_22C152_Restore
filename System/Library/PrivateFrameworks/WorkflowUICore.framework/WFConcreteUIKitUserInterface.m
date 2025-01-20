@interface WFConcreteUIKitUserInterface
- (BOOL)isRunningWithExternalUI;
- (BOOL)isRunningWithSiriUI;
- (BOOL)isRunningWithToolKitClient;
- (NSString)userInterfaceType;
- (UIView)view;
- (UIViewController)presentedViewController;
- (UIViewController)viewController;
- (WFActionUserInterfaceListener)actionUserInterfaceListener;
- (WFAlert)presentedAlert;
- (WFConcreteUIKitUserInterface)initWithView:(id)a3 viewController:(id)a4;
- (id)presentationAnchorForActionUserInterface:(id)a3;
- (void)actionUserInterface:(id)a3 showViewControllerInPlatter:(id)a4;
- (void)dismissPlatterForActionUserInterface:(id)a3 completionHandler:(id)a4;
- (void)dismissPresentedContentWithCompletionHandler:(id)a3;
- (void)presentAlert:(id)a3;
- (void)requestActionInterfacePresentationForActionClassName:(id)a3 classNamesByType:(id)a4 completionHandler:(id)a5;
- (void)requestAuthorizationWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)setActionUserInterfaceListener:(id)a3;
- (void)setPresentedAlert:(id)a3;
- (void)setPresentedViewController:(id)a3;
@end

@implementation WFConcreteUIKitUserInterface

- (WFConcreteUIKitUserInterface)initWithView:(id)a3 viewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFConcreteUIKitUserInterface;
  v8 = [(WFConcreteUIKitUserInterface *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_view, v6);
    objc_storeWeak((id *)&v9->_viewController, v7);
    v10 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_storeStrong((id *)&self->_actionUserInterfaceListener, 0);
  objc_destroyWeak((id *)&self->_presentedAlert);
  objc_destroyWeak((id *)&self->_viewController);
  objc_destroyWeak((id *)&self->_view);
}

- (void)setPresentedViewController:(id)a3
{
}

- (UIViewController)presentedViewController
{
  return self->_presentedViewController;
}

- (void)setActionUserInterfaceListener:(id)a3
{
}

- (WFActionUserInterfaceListener)actionUserInterfaceListener
{
  return self->_actionUserInterfaceListener;
}

- (void)setPresentedAlert:(id)a3
{
}

- (WFAlert)presentedAlert
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedAlert);
  return (WFAlert *)WeakRetained;
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  return (UIViewController *)WeakRetained;
}

- (void)dismissPlatterForActionUserInterface:(id)a3 completionHandler:(id)a4
{
  v5 = (void (**)(void))a4;
  id v6 = [(WFConcreteUIKitUserInterface *)self presentedViewController];

  if (v6)
  {
    id v7 = [(WFConcreteUIKitUserInterface *)self presentedViewController];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __87__WFConcreteUIKitUserInterface_dismissPlatterForActionUserInterface_completionHandler___block_invoke;
    v8[3] = &unk_264C50E38;
    v8[4] = self;
    v9 = v5;
    [v7 dismissViewControllerAnimated:1 completion:v8];
  }
  else
  {
    v5[2](v5);
  }
}

uint64_t __87__WFConcreteUIKitUserInterface_dismissPlatterForActionUserInterface_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPresentedViewController:0];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)actionUserInterface:(id)a3 showViewControllerInPlatter:(id)a4
{
  id v6 = a4;
  v5 = [(WFConcreteUIKitUserInterface *)self viewController];
  [v5 presentViewController:v6 animated:1 completion:0];

  [(WFConcreteUIKitUserInterface *)self setPresentedViewController:v6];
}

- (id)presentationAnchorForActionUserInterface:(id)a3
{
  v3 = [(WFConcreteUIKitUserInterface *)self view];
  v4 = [v3 window];

  return v4;
}

- (void)requestActionInterfacePresentationForActionClassName:(id)a3 classNamesByType:(id)a4 completionHandler:(id)a5
{
  v8 = (void (**)(id, void *, void))a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [WFActionUserInterfaceListener alloc];
  v14 = [(WFActionUserInterfaceListener *)v11 initWithUserInterfaceType:*MEMORY[0x263F33B40] actionClassName:v10 classNamesByType:v9];

  if (v14)
  {
    objc_super v12 = [(WFActionUserInterfaceListener *)v14 actionInterface];
    [v12 setDelegate:self];

    [(WFConcreteUIKitUserInterface *)self setActionUserInterfaceListener:v14];
    v13 = [(WFActionUserInterfaceListener *)v14 actionInterface];
    v8[2](v8, v13, 0);
  }
  else
  {
    v13 = [MEMORY[0x263F087E8] wfUnsupportedUserInterfaceError];
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v13);
  }
}

- (void)requestAuthorizationWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5 = [a3 siriDialogAlertWithCompletionHandler:a4];
  [(WFConcreteUIKitUserInterface *)self presentAlert:v5];
}

- (void)presentAlert:(id)a3
{
  id v4 = a3;
  +[WFUIKitAlertPresenter presentAlert:v4 withUserInterface:self];
  [(WFConcreteUIKitUserInterface *)self setPresentedAlert:v4];
}

- (void)dismissPresentedContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __77__WFConcreteUIKitUserInterface_dismissPresentedContentWithCompletionHandler___block_invoke;
  v6[3] = &unk_264C50E38;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __77__WFConcreteUIKitUserInterface_dismissPresentedContentWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = dispatch_group_create();
  v3 = [*(id *)(a1 + 32) actionUserInterfaceListener];

  if (v3)
  {
    dispatch_group_enter(v2);
    id v4 = [*(id *)(a1 + 32) actionUserInterfaceListener];
    id v5 = [v4 actionInterface];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __77__WFConcreteUIKitUserInterface_dismissPresentedContentWithCompletionHandler___block_invoke_2;
    v14[3] = &unk_264C50DE8;
    v14[4] = *(void *)(a1 + 32);
    v15 = v2;
    [v5 cancelPresentationWithCompletionHandler:v14];
  }
  id v6 = [*(id *)(a1 + 32) presentedAlert];

  if (v6)
  {
    dispatch_group_enter(v2);
    id v7 = [*(id *)(a1 + 32) presentedAlert];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __77__WFConcreteUIKitUserInterface_dismissPresentedContentWithCompletionHandler___block_invoke_3;
    v12[3] = &unk_264C50DE8;
    v12[4] = *(void *)(a1 + 32);
    v13 = v2;
    [v7 dismissWithCompletionHandler:v12];
    v8 = v13;
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) presentedViewController];

    if (!v9)
    {
      dispatch_group_notify(v2, MEMORY[0x263EF83A0], *(dispatch_block_t *)(a1 + 40));
      goto LABEL_8;
    }
    dispatch_group_enter(v2);
    id v7 = [*(id *)(a1 + 32) presentedViewController];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __77__WFConcreteUIKitUserInterface_dismissPresentedContentWithCompletionHandler___block_invoke_4;
    v10[3] = &unk_264C50DE8;
    v10[4] = *(void *)(a1 + 32);
    v11 = v2;
    [v7 dismissViewControllerAnimated:1 completion:v10];
    v8 = v11;
  }

LABEL_8:
}

void __77__WFConcreteUIKitUserInterface_dismissPresentedContentWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setActionUserInterfaceListener:0];
  v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

void __77__WFConcreteUIKitUserInterface_dismissPresentedContentWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setPresentedAlert:0];
  v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

void __77__WFConcreteUIKitUserInterface_dismissPresentedContentWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setPresentedViewController:0];
  v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
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

- (NSString)userInterfaceType
{
  return (NSString *)(id)*MEMORY[0x263F33B40];
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)&self->_viewController);
    id v5 = [v6 view];
  }
  return (UIView *)v5;
}

@end