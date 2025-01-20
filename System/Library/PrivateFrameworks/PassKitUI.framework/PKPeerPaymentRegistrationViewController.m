@interface PKPeerPaymentRegistrationViewController
- (PKPeerPaymentRegistrationViewController)initWithUserInfo:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismiss;
- (void)setDismissHandler:(id)a3;
- (void)startRegistrationFlowWithCompletion:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PKPeerPaymentRegistrationViewController

- (PKPeerPaymentRegistrationViewController)initWithUserInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentRegistrationViewController;
  v6 = [(PKPeerPaymentRegistrationViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userInfo, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)PKPeerPaymentRegistrationViewController;
  [(PKPeerPaymentRegistrationViewController *)&v2 viewDidLoad];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentRegistrationViewController;
  [(PKPeerPaymentRegistrationViewController *)&v4 viewWillDisappear:a3];
  [(PKPeerPaymentRegistrationViewController *)self _dismiss];
}

- (unint64_t)supportedInterfaceOrientations
{
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    return 30;
  }
  else
  {
    return 2;
  }
}

- (void)startRegistrationFlowWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[PKPeerPaymentRegistrationFlowController alloc] initWithUserInfo:self->_userInfo setupDelegate:self];
  flowController = self->_flowController;
  self->_flowController = v5;

  objc_initWeak(&location, self);
  v7 = self->_flowController;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__PKPeerPaymentRegistrationViewController_startRegistrationFlowWithCompletion___block_invoke;
  v9[3] = &unk_1E59D2FA0;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  [(PKPeerPaymentRegistrationFlowController *)v7 preflightWithCompletion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __79__PKPeerPaymentRegistrationViewController_startRegistrationFlowWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKPeerPaymentRegistrationViewController_startRegistrationFlowWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CB038;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __79__PKPeerPaymentRegistrationViewController_startRegistrationFlowWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && (uint64_t v3 = *(void *)(a1 + 32)) != 0)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __79__PKPeerPaymentRegistrationViewController_startRegistrationFlowWithCompletion___block_invoke_3;
    v5[3] = &unk_1E59CAA98;
    id v6 = *(id *)(a1 + 40);
    [WeakRetained presentViewController:v3 animated:1 completion:v5];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
    }
  }
}

uint64_t __79__PKPeerPaymentRegistrationViewController_startRegistrationFlowWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)setDismissHandler:(id)a3
{
  if (!self->_dismissed)
  {
    uint64_t v4 = _Block_copy(a3);
    id dismissHandler = self->_dismissHandler;
    self->_id dismissHandler = v4;
  }
}

- (void)_dismiss
{
  if (!self->_dismissed)
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __51__PKPeerPaymentRegistrationViewController__dismiss__block_invoke;
    v3[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v4, &location);
    [(PKPeerPaymentRegistrationViewController *)self dismissViewControllerAnimated:1 completion:v3];
    self->_dismissed = 1;
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __51__PKPeerPaymentRegistrationViewController__dismiss__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[124];
    if (v3)
    {
      id v5 = v2;
      (*(void (**)(void))(v3 + 16))();
      id v4 = (void *)v5[124];
      v5[124] = 0;

      objc_super v2 = v5;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_flowController, 0);
}

@end