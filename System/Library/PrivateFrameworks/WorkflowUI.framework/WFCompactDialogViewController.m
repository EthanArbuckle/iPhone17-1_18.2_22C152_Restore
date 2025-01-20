@interface WFCompactDialogViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)canHandleFollowUpRequest:(id)a3;
- (NSArray)actions;
- (WFCompactDialogAction)cancelAction;
- (WFCompactDialogAction)preferredAction;
- (WFCompactDialogViewController)initWithRequest:(id)a3;
- (WFCompactDialogViewControllerDelegate)delegate;
- (WFDialogRequest)request;
- (id)keyCommands;
- (void)cancelKeyPressed;
- (void)configureActionGroupWithActions:(id)a3;
- (void)doneKeyPressed;
- (void)finishWithResponse:(id)a3;
- (void)finishWithResponse:(id)a3 waitForFollowUpRequest:(BOOL)a4;
- (void)handleFollowUpRequest:(id)a3;
- (void)loadView;
- (void)prepareForPresentationWithCompletionHandler:(id)a3;
- (void)setActions:(id)a3;
- (void)setCancelAction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreferredAction:(id)a3;
- (void)systemDismissedBanner;
@end

@implementation WFCompactDialogViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelAction, 0);
  objc_storeStrong((id *)&self->_preferredAction, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setCancelAction:(id)a3
{
}

- (WFCompactDialogAction)cancelAction
{
  return self->_cancelAction;
}

- (void)setPreferredAction:(id)a3
{
}

- (WFCompactDialogAction)preferredAction
{
  return self->_preferredAction;
}

- (void)setActions:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (WFDialogRequest)request
{
  return self->_request;
}

- (void)setDelegate:(id)a3
{
}

- (WFCompactDialogViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFCompactDialogViewControllerDelegate *)WeakRetained;
}

- (void)systemDismissedBanner
{
  id v3 = (id)[objc_alloc(MEMORY[0x263F85280]) initWithCancelled:1];
  [(WFCompactDialogViewController *)self finishWithResponse:v3];
}

- (void)doneKeyPressed
{
  id v3 = [(WFCompactDialogViewController *)self view];
  [v3 endEditing:1];

  v4 = [(WFCompactDialogViewController *)self preferredAction];

  if (v4)
  {
    id v5 = [(WFCompactDialogViewController *)self preferredAction];
    [v5 invokeHandler];
  }
}

- (void)cancelKeyPressed
{
  id v3 = [(WFCompactDialogViewController *)self view];
  [v3 endEditing:1];

  v4 = [(WFCompactDialogViewController *)self cancelAction];

  if (v4)
  {
    id v5 = [(WFCompactDialogViewController *)self cancelAction];
    [v5 invokeHandler];
  }
}

- (id)keyCommands
{
  id v3 = objc_opt_new();
  v4 = [(WFCompactDialogViewController *)self cancelAction];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x263F82890];
    v6 = WFLocalizedString(@"Cancel");
    v7 = [v5 commandWithTitle:v6 image:0 action:sel_cancelKeyPressed input:*MEMORY[0x263F83758] modifierFlags:0 propertyList:0];

    [v3 addObject:v7];
  }
  v8 = [(WFCompactDialogViewController *)self preferredAction];

  if (v8)
  {
    v9 = [(WFCompactDialogViewController *)self request];
    if ([v9 hasMultilineTextEntry]) {
      uint64_t v10 = 0x100000;
    }
    else {
      uint64_t v10 = 0;
    }

    v11 = (void *)MEMORY[0x263F82890];
    v12 = WFLocalizedString(@"Done");
    v13 = [v11 commandWithTitle:v12 image:0 action:sel_doneKeyPressed input:@"\r" modifierFlags:v10 propertyList:0];

    [v3 addObject:v13];
  }
  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)finishWithResponse:(id)a3 waitForFollowUpRequest:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(WFCompactDialogViewController *)self delegate];
  [v7 dialogViewController:self didFinishWithResponse:v6 waitForFollowUpRequest:v4];
}

- (void)finishWithResponse:(id)a3
{
}

- (void)handleFollowUpRequest:(id)a3
{
}

- (BOOL)canHandleFollowUpRequest:(id)a3
{
  return 0;
}

- (void)configureActionGroupWithActions:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    if ((unint64_t)[v7 count] > 2)
    {
      BOOL v4 = 0;
    }
    else
    {
      BOOL v4 = objc_msgSend(v7, "if_firstObjectPassingTest:", &__block_literal_global_11316);
    }
    id v5 = objc_msgSend(v7, "if_firstObjectPassingTest:", &__block_literal_global_170);
    [(WFCompactDialogViewController *)self setCancelAction:v5];

    [(WFCompactDialogViewController *)self setActions:v7];
    id v6 = [(WFCompactPlatterViewController *)self platterView];
    [v6 setActions:v7];

    [(WFCompactDialogViewController *)self setPreferredAction:v4];
  }
  else
  {
    [(WFCompactDialogViewController *)self setActions:0];
    [(WFCompactDialogViewController *)self setPreferredAction:0];
    [(WFCompactDialogViewController *)self setCancelAction:0];
    BOOL v4 = [(WFCompactPlatterViewController *)self platterView];
    [v4 setActions:0];
  }
}

BOOL __65__WFCompactDialogViewController_configureActionGroupWithActions___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 dialogButton];
  BOOL v3 = [v2 style] == 1;

  return v3;
}

BOOL __65__WFCompactDialogViewController_configureActionGroupWithActions___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 dialogButton];
  BOOL v3 = [v2 style] == 0;

  return v3;
}

- (void)prepareForPresentationWithCompletionHandler:(id)a3
{
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)WFCompactDialogViewController;
  [(WFCompactPlatterViewController *)&v8 loadView];
  BOOL v3 = [(WFCompactDialogViewController *)self request];
  BOOL v4 = [(WFCompactPlatterViewController *)self platterView];
  id v5 = [v3 attribution];
  [v4 setAttribution:v5];

  id v6 = [v3 promptForDisplay];
  [v4 setPrimaryText:v6];

  if ([v3 shouldCenterPrompt]) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 4;
  }
  [v4 setPrimaryTextAlignment:v7];
}

- (WFCompactDialogViewController)initWithRequest:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFCompactDialogViewController;
  id v6 = [(WFCompactPlatterViewController *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    objc_super v8 = v7;
  }

  return v7;
}

@end