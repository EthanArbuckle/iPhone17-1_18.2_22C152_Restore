@interface PKSelectActionViewController
- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground;
- (PKSelectActionViewController)initWithPass:(id)a3 actions:(id)a4 actionType:(unint64_t)a5 paymentDataProvider:(id)a6 webService:(id)a7 balanceDictionary:(id)a8;
- (PKSelectActionViewControllerDelegate)delegate;
- (void)_cancelButtonPressed:(id)a3;
- (void)_reloadActionView;
- (void)_rightBarButtonPressed:(id)a3;
- (void)performActionViewControllerDidCancel:(id)a3;
- (void)performActionViewControllerDidPerformAction:(id)a3;
- (void)selectActionViewDidSelectAction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRightBarButtonEnabled:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKSelectActionViewController

- (PKSelectActionViewController)initWithPass:(id)a3 actions:(id)a4 actionType:(unint64_t)a5 paymentDataProvider:(id)a6 webService:(id)a7 balanceDictionary:(id)a8
{
  id v15 = a3;
  id v28 = a4;
  id v16 = a6;
  id v27 = a7;
  id v17 = a8;
  if (a5)
  {
    v29.receiver = self;
    v29.super_class = (Class)PKSelectActionViewController;
    v18 = [(PKSelectActionViewController *)&v29 init];
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_pass, a3);
      objc_storeStrong((id *)&v19->_actions, a4);
      v19->_actionType = a5;
      objc_storeStrong((id *)&v19->_paymentDataProvider, a6);
      objc_storeStrong((id *)&v19->_webService, a7);
      objc_storeStrong((id *)&v19->_balances, a8);
      v20 = [(PKSelectActionViewController *)v19 navigationItem];
      id v21 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
      [v21 configureWithTransparentBackground];
      v22 = PKProvisioningSecondaryBackgroundColor();
      [v21 setBackgroundColor:v22];

      [v20 setStandardAppearance:v21];
      v23 = PKLocalizedPaymentString(&cfstr_Next.isa);
      v24 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v23 style:2 target:v19 action:sel__rightBarButtonPressed_];
      [v20 setRightBarButtonItem:v24];
      v25 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v19 action:sel__cancelButtonPressed_];
      [v20 setLeftBarButtonItem:v25];
    }
  }
  else
  {

    v19 = 0;
  }

  return v19;
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)PKSelectActionViewController;
  [(PKSelectActionViewController *)&v9 viewDidLoad];
  v3 = [(PKSelectActionViewController *)self view];
  v4 = PKProvisioningBackgroundColor();
  [v3 setBackgroundColor:v4];

  v5 = [PKPerformActionPassView alloc];
  pass = self->_pass;
  [v3 bounds];
  v7 = -[PKPerformActionPassView initWithPass:frame:](v5, "initWithPass:frame:", pass);
  passView = self->_passView;
  self->_passView = v7;

  [v3 addSubview:self->_passView];
  [(PKSelectActionViewController *)self _reloadActionView];
}

- (void)_reloadActionView
{
  [(PKSelectActionView *)self->_actionView setDelegate:0];
  [(PKSelectActionView *)self->_actionView removeFromSuperview];
  v3 = [[PKSelectActionView alloc] initWithPass:self->_pass actions:self->_actions actionType:self->_actionType balanceDictionary:self->_balances];
  actionView = self->_actionView;
  self->_actionView = v3;

  [(PKSelectActionView *)self->_actionView setDelegate:self];
  id v5 = [(PKSelectActionViewController *)self view];
  [v5 insertSubview:self->_actionView belowSubview:self->_passView];
}

- (void)viewWillLayoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)PKSelectActionViewController;
  [(PKSelectActionViewController *)&v23 viewWillLayoutSubviews];
  v3 = [(PKSelectActionViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  CGFloat v13 = v5 + v12;
  CGFloat v15 = v7 + v14;
  CGFloat v17 = v9 - (v12 + v16);
  CGFloat v19 = v11 - (v14 + v18);
  -[PKPerformActionPassView sizeThatFits:](self->_passView, "sizeThatFits:", v17, v19);
  -[PKPerformActionPassView setFrame:](self->_passView, "setFrame:", 0.0, v15, v20, v21);
  [(PKPerformActionPassView *)self->_passView frame];
  double MaxY = CGRectGetMaxY(v24);
  v25.origin.x = v13;
  v25.origin.y = v15;
  v25.size.width = v17;
  v25.size.height = v19;
  -[PKSelectActionView setFrame:](self->_actionView, "setFrame:", 0.0, MaxY, v17, CGRectGetMaxY(v25) - MaxY);
}

- (BOOL)pkui_disablesAutomaticDismissalUponEnteringBackground
{
  return 1;
}

- (void)_rightBarButtonPressed:(id)a3
{
  id v8 = 0;
  uint64_t v9 = 0;
  char v4 = [(PKPaymentPass *)self->_pass canPerformAction:self->_selectedAction unableReason:&v9 displayableError:&v8];
  id v5 = v8;
  if ((v4 & 1) != 0 || v9 == 2)
  {
    double v6 = [[PKPerformActionViewController alloc] initWithPass:self->_pass action:self->_selectedAction paymentDataProvider:self->_paymentDataProvider];
    [(PKPerformActionViewController *)v6 setDelegate:self];
    [(PKPerformActionViewController *)v6 setWebService:self->_webService];
    double v7 = [[PKNavigationController alloc] initWithRootViewController:v6];
    [(PKNavigationController *)v7 setSupportedInterfaceOrientations:2];
    [(PKSelectActionViewController *)self presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    double v6 = +[PKPerformActionViewController alertControllerForUnableReason:v9 action:self->_selectedAction displayableError:v5 addCardActionHandler:0];
    [(PKSelectActionViewController *)self presentViewController:v6 animated:1 completion:0];
  }
}

- (void)_cancelButtonPressed:(id)a3
{
  id v4 = [(PKSelectActionViewController *)self delegate];
  [v4 selectActionViewControllerDidCancel:self];
}

- (void)setRightBarButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKSelectActionViewController *)self navigationItem];
  id v4 = [v5 rightBarButtonItem];
  [v4 setEnabled:v3];
}

- (void)selectActionViewDidSelectAction:(id)a3
{
  p_selectedAction = &self->_selectedAction;
  objc_storeStrong((id *)&self->_selectedAction, a3);
  id v6 = a3;
  id v8 = [(PKSelectActionViewController *)self navigationItem];
  double v7 = [(PKPaymentPassAction *)*p_selectedAction title];

  [v8 setTitle:v7];
}

- (void)performActionViewControllerDidCancel:(id)a3
{
  id v3 = a3;
  [v3 setDelegate:0];
  id v4 = [v3 presentingViewController];

  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)performActionViewControllerDidPerformAction:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:0];
  id v5 = [(PKSelectActionViewController *)self delegate];
  [v5 selectActionViewControllerDidPerformAction:self];

  id v6 = [v4 presentingViewController];

  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (PKSelectActionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKSelectActionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_storeStrong((id *)&self->_actionView, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_passView, 0);
}

@end