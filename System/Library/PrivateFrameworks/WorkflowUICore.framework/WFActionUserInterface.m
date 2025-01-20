@interface WFActionUserInterface
- (NSString)userInterfaceType;
- (UIViewController)viewControllerForPresenting;
- (UIWindow)presentationAnchor;
- (WFActionUserInterface)initWithUserInterfaceType:(id)a3 attribution:(id)a4;
- (WFActionUserInterfaceDelegate)delegate;
- (WFDialogAttribution)attribution;
- (WFWorkflowRunningContext)runningContext;
- (void)cancelPresentationWithCompletionHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRunningContext:(id)a3;
- (void)setViewControllerForPresenting:(id)a3;
@end

@implementation WFActionUserInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningContext, 0);
  objc_storeStrong((id *)&self->_viewControllerForPresenting, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_userInterfaceType, 0);
}

- (void)setRunningContext:(id)a3
{
}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (void)setViewControllerForPresenting:(id)a3
{
}

- (WFDialogAttribution)attribution
{
  return self->_attribution;
}

- (void)setDelegate:(id)a3
{
}

- (WFActionUserInterfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFActionUserInterfaceDelegate *)WeakRetained;
}

- (NSString)userInterfaceType
{
  return self->_userInterfaceType;
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  v5 = (void (**)(void))a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v4 = [(UIViewController *)self->_viewControllerForPresenting presentedViewController];

  if (v4) {
    [(UIViewController *)self->_viewControllerForPresenting dismissViewControllerAnimated:1 completion:v5];
  }
  else {
    v5[2]();
  }
}

- (UIWindow)presentationAnchor
{
  viewControllerForPresenting = self->_viewControllerForPresenting;
  if (viewControllerForPresenting)
  {
    v4 = [(UIViewController *)viewControllerForPresenting view];
    [v4 window];
  }
  else
  {
    v4 = [(WFActionUserInterface *)self delegate];
    [v4 presentationAnchorForActionUserInterface:self];
  v5 = };

  return (UIWindow *)v5;
}

- (UIViewController)viewControllerForPresenting
{
  viewControllerForPresenting = self->_viewControllerForPresenting;
  if (!viewControllerForPresenting)
  {
    v4 = [(WFActionUserInterface *)self delegate];
    v5 = [v4 viewControllerForPresentingActionUserInterface:self];
    v6 = self->_viewControllerForPresenting;
    self->_viewControllerForPresenting = v5;

    viewControllerForPresenting = self->_viewControllerForPresenting;
  }
  return viewControllerForPresenting;
}

- (WFActionUserInterface)initWithUserInterfaceType:(id)a3 attribution:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFActionUserInterface;
  v9 = [(WFActionUserInterface *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userInterfaceType, a3);
    objc_storeStrong((id *)&v10->_attribution, a4);
    v11 = v10;
  }

  return v10;
}

@end