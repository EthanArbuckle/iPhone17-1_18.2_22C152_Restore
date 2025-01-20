@interface SUPaymentSetupViewController
- (PKPaymentSetupRequest)paymentSetupRequest;
- (PKPaymentSetupViewController)childViewController;
- (SUPaymentSetupViewController)initWithPaymentSetupRequest:(id)a3;
- (SUPaymentSetupViewControllerDelegate)delegate;
- (void)_setup;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)loadView;
- (void)setChildViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SUPaymentSetupViewController

- (SUPaymentSetupViewController)initWithPaymentSetupRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUPaymentSetupViewController;
  v6 = [(SUPaymentSetupViewController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_paymentSetupRequest, a3);
    [(SUPaymentSetupViewController *)v7 _setup];
  }

  return v7;
}

- (void)_setup
{
  [(SUPaymentSetupViewController *)self setModalPresentationStyle:5];
  id v3 = objc_alloc((Class)ISWeakLinkedClassForString());
  id v6 = [(SUPaymentSetupViewController *)self paymentSetupRequest];
  v4 = (PKPaymentSetupViewController *)[v3 initWithPaymentSetupRequest:v6];
  childViewController = self->_childViewController;
  self->_childViewController = v4;
}

- (void)loadView
{
  id v4 = objc_alloc_init(MEMORY[0x263F1CB60]);
  id v3 = [MEMORY[0x263F1C550] clearColor];
  [v4 setBackgroundColor:v3];

  [v4 setUserInteractionEnabled:0];
  [(SUPaymentSetupViewController *)self setView:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUPaymentSetupViewController;
  [(SUPaymentSetupViewController *)&v6 viewDidAppear:a3];
  id v4 = [(SUPaymentSetupViewController *)self childViewController];

  if (v4)
  {
    id v5 = [(SUPaymentSetupViewController *)self childViewController];
    [(SUPaymentSetupViewController *)self presentViewController:v5 animated:1 completion:0];
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(SUPaymentSetupViewController *)self setChildViewController:0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__SUPaymentSetupViewController_dismissViewControllerAnimated_completion___block_invoke;
  v9[3] = &unk_264812420;
  v9[4] = self;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)SUPaymentSetupViewController;
  id v7 = v6;
  [(SUPaymentSetupViewController *)&v8 dismissViewControllerAnimated:v4 completion:v9];
}

uint64_t __73__SUPaymentSetupViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentingViewController];
  [v2 dismissViewControllerAnimated:0 completion:0];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 paymentSetupViewControllerDidDismiss];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (SUPaymentSetupViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SUPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKPaymentSetupRequest)paymentSetupRequest
{
  return self->_paymentSetupRequest;
}

- (PKPaymentSetupViewController)childViewController
{
  return self->_childViewController;
}

- (void)setChildViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewController, 0);
  objc_storeStrong((id *)&self->_paymentSetupRequest, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end