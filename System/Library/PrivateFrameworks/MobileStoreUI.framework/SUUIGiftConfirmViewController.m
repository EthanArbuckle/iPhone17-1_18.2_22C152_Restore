@interface SUUIGiftConfirmViewController
- (SUUIGiftConfirmViewController)initWithGift:(id)a3 configuration:(id)a4;
- (id)_buyButtonTitle;
- (id)_confirmButtonTitle;
- (id)_newBuyBarButtonItemWithTitle:(id)a3;
- (void)_buyButtonAction:(id)a3;
- (void)_cancelBuyConfirmation:(id)a3;
- (void)_finishPurchaseWithResult:(BOOL)a3 errorMessage:(id)a4;
- (void)_purchaseGift;
- (void)_removeCancelGestureRecognizer;
- (void)_setShowingConfirmation:(BOOL)a3 animated:(BOOL)a4;
- (void)_showSuccessPage;
- (void)_termsButtonAction:(id)a3;
- (void)dealloc;
- (void)loadView;
@end

@implementation SUUIGiftConfirmViewController

- (SUUIGiftConfirmViewController)initWithGift:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIGiftConfirmViewController;
  v7 = [(SUUIGiftStepViewController *)&v12 initWithGift:a3 configuration:v6];
  if (v7)
  {
    v8 = [v6 clientContext];
    v9 = v8;
    if (v8) {
      [v8 localizedStringForKey:@"GIFTING_REVIEW_TITLE" inTable:@"Gifting"];
    }
    else {
    v10 = +[SUUIClientContext localizedStringForKey:@"GIFTING_REVIEW_TITLE" inBundles:0 inTable:@"Gifting"];
    }
    [(SUUIGiftConfirmViewController *)v7 setTitle:v10];

    [(SUUIGiftConfirmViewController *)v7 setEdgesForExtendedLayout:0];
  }

  return v7;
}

- (void)dealloc
{
  v3 = [(SUUIGiftConfirmView *)self->_confirmView termsButton];
  [v3 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  [(SUUIFocusedTouchGestureRecognizer *)self->_touchRecognizer removeTarget:self action:0];
  v4.receiver = self;
  v4.super_class = (Class)SUUIGiftConfirmViewController;
  [(SUUIGiftConfirmViewController *)&v4 dealloc];
}

- (void)loadView
{
  confirmView = self->_confirmView;
  if (!confirmView)
  {
    objc_super v4 = [SUUIGiftConfirmView alloc];
    v5 = [(SUUIGiftStepViewController *)self gift];
    id v6 = [(SUUIGiftStepViewController *)self giftConfiguration];
    v7 = [(SUUIGiftConfirmView *)v4 initWithGift:v5 configuration:v6];
    v8 = self->_confirmView;
    self->_confirmView = v7;

    v9 = self->_confirmView;
    v10 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(SUUIGiftConfirmView *)v9 setBackgroundColor:v10];

    v11 = [(SUUIGiftConfirmView *)self->_confirmView termsButton];
    [v11 addTarget:self action:sel__termsButtonAction_ forControlEvents:64];

    confirmView = self->_confirmView;
  }
  [(SUUIGiftConfirmViewController *)self setView:confirmView];
  objc_super v12 = [(SUUIGiftStepViewController *)self giftConfiguration];
  id v16 = [v12 clientContext];

  v13 = [(SUUIGiftConfirmViewController *)self _buyButtonTitle];
  id v14 = [(SUUIGiftConfirmViewController *)self _newBuyBarButtonItemWithTitle:v13];
  v15 = [(SUUIGiftConfirmViewController *)self navigationItem];
  [v15 setRightBarButtonItem:v14];
}

- (void)_buyButtonAction:(id)a3
{
  if (self->_isShowingConfirmation)
  {
    [(SUUIGiftConfirmViewController *)self _purchaseGift];
    [(SUUIGiftConfirmViewController *)self _setShowingConfirmation:0 animated:1];
    [(SUUIGiftConfirmViewController *)self _removeCancelGestureRecognizer];
    id v11 = [(SUUIGiftConfirmViewController *)self navigationItem];
    objc_super v4 = [v11 rightBarButtonItem];
    [v4 setEnabled:0];
  }
  else
  {
    [(SUUIGiftConfirmViewController *)self _setShowingConfirmation:1 animated:1];
    if (self->_touchRecognizer) {
      return;
    }
    v5 = [(SUUIGiftConfirmViewController *)self navigationItem];
    id v6 = [v5 rightBarButtonItem];
    id v11 = [v6 customView];

    v7 = [SUUIFocusedTouchGestureRecognizer alloc];
    v8 = -[SUUIFocusedTouchGestureRecognizer initWithFocusedView:touchAllowance:](v7, "initWithFocusedView:touchAllowance:", v11, *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
    touchRecognizer = self->_touchRecognizer;
    self->_touchRecognizer = v8;

    [(SUUIFocusedTouchGestureRecognizer *)self->_touchRecognizer addTarget:self action:sel__cancelBuyConfirmation_];
    objc_super v4 = [(SUUIGiftConfirmViewController *)self navigationController];
    v10 = [v4 view];
    [v10 addGestureRecognizer:self->_touchRecognizer];
  }
}

- (void)_cancelBuyConfirmation:(id)a3
{
  [(SUUIGiftConfirmViewController *)self _setShowingConfirmation:0 animated:1];
  [(SUUIGiftConfirmViewController *)self _removeCancelGestureRecognizer];
}

- (void)_termsButtonAction:(id)a3
{
  objc_msgSend(NSURL, "termsAndConditionsURL", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  SUUIMetricsOpenURL(v3);
}

- (void)_finishPurchaseWithResult:(BOOL)a3 errorMessage:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v18 = v6;
  if (v4)
  {
    [(SUUIGiftConfirmViewController *)self _showSuccessPage];
  }
  else if (v6)
  {
    v7 = [(SUUIGiftStepViewController *)self giftConfiguration];
    v8 = [v7 clientContext];

    v9 = (void *)MEMORY[0x263F82418];
    if (v8) {
      [v8 localizedStringForKey:@"GIFTING_UNABLE_TO_GIFT" inTable:@"Gifting"];
    }
    else {
    v10 = +[SUUIClientContext localizedStringForKey:@"GIFTING_UNABLE_TO_GIFT" inBundles:0 inTable:@"Gifting"];
    }
    id v11 = [v9 alertControllerWithTitle:v10 message:v18 preferredStyle:1];

    objc_super v12 = (void *)MEMORY[0x263F82400];
    if (v8) {
      [v8 localizedStringForKey:@"GIFTING_OK_BUTTON" inTable:@"Gifting"];
    }
    else {
    v13 = +[SUUIClientContext localizedStringForKey:@"GIFTING_OK_BUTTON" inBundles:0 inTable:@"Gifting"];
    }
    id v14 = [v12 actionWithTitle:v13 style:0 handler:0];
    [v11 addAction:v14];

    [(SUUIGiftConfirmViewController *)self presentViewController:v11 animated:1 completion:0];
  }
  purchaseRequest = self->_purchaseRequest;
  self->_purchaseRequest = 0;

  id v16 = [(SUUIGiftConfirmViewController *)self navigationItem];
  v17 = [v16 rightBarButtonItem];
  [v17 setEnabled:1];
}

- (void)_purchaseGift
{
  if (!self->_purchaseRequest)
  {
    objc_initWeak(&location, self);
    id v3 = [SUUIGiftPurchaseRequest alloc];
    BOOL v4 = [(SUUIGiftStepViewController *)self gift];
    v5 = [(SUUIGiftStepViewController *)self giftConfiguration];
    id v6 = [(SUUIGiftPurchaseRequest *)v3 initWithGift:v4 configuration:v5];
    purchaseRequest = self->_purchaseRequest;
    self->_purchaseRequest = v6;

    v8 = self->_purchaseRequest;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __46__SUUIGiftConfirmViewController__purchaseGift__block_invoke;
    v9[3] = &unk_265403A40;
    objc_copyWeak(&v10, &location);
    [(SUUIGiftPurchaseRequest *)v8 purchaseWithCompletionBlock:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __46__SUUIGiftConfirmViewController__purchaseGift__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SUUIGiftConfirmViewController__purchaseGift__block_invoke_2;
  block[3] = &unk_265403A18;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v10 = a2;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

void __46__SUUIGiftConfirmViewController__purchaseGift__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _finishPurchaseWithResult:*(unsigned __int8 *)(a1 + 48) errorMessage:*(void *)(a1 + 32)];
}

- (void)_removeCancelGestureRecognizer
{
  [(SUUIFocusedTouchGestureRecognizer *)self->_touchRecognizer removeTarget:self action:0];
  id v3 = [(SUUIFocusedTouchGestureRecognizer *)self->_touchRecognizer view];
  [v3 removeGestureRecognizer:self->_touchRecognizer];

  touchRecognizer = self->_touchRecognizer;
  self->_touchRecognizer = 0;
}

- (void)_setShowingConfirmation:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_isShowingConfirmation != a3)
  {
    BOOL v4 = a4;
    if (a3) {
      [(SUUIGiftConfirmViewController *)self _confirmButtonTitle];
    }
    else {
    id v9 = [(SUUIGiftConfirmViewController *)self _buyButtonTitle];
    }
    id v7 = [(SUUIGiftConfirmViewController *)self _newBuyBarButtonItemWithTitle:v9];
    id v8 = [(SUUIGiftConfirmViewController *)self navigationItem];
    [v8 setRightBarButtonItem:v7 animated:v4];

    self->_isShowingConfirmation = a3;
  }
}

- (void)_showSuccessPage
{
  id v3 = [SUUIGiftResultViewController alloc];
  BOOL v4 = [(SUUIGiftStepViewController *)self gift];
  id v5 = [(SUUIGiftStepViewController *)self giftConfiguration];
  id v8 = [(SUUIGiftResultViewController *)v3 initWithGift:v4 configuration:v5];

  id v6 = [(SUUIGiftStepViewController *)self operationQueue];
  [(SUUIGiftStepViewController *)v8 setOperationQueue:v6];

  id v7 = [(SUUIGiftConfirmViewController *)self navigationController];
  [v7 pushViewController:v8 animated:1];

  [(SUUIGiftConfirmViewController *)self _removeCancelGestureRecognizer];
}

- (id)_newBuyBarButtonItemWithTitle:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x263F824E8];
  id v5 = a3;
  id v6 = [v4 buttonWithType:1];
  id v7 = [MEMORY[0x263F81708] boldSystemFontOfSize:17.0];
  id v8 = [v6 titleLabel];
  [v8 setFont:v7];

  [v6 addTarget:self action:sel__buyButtonAction_ forEvents:64];
  [v6 setTitle:v5 forState:0];

  [v6 sizeToFit];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v6];

  return v9;
}

- (id)_buyButtonTitle
{
  v2 = [(SUUIGiftStepViewController *)self giftConfiguration];
  id v3 = [v2 clientContext];
  BOOL v4 = v3;
  if (v3) {
    [v3 localizedStringForKey:@"GIFTING_BUY_GIFT_BUTTON" inTable:@"Gifting"];
  }
  else {
  id v5 = +[SUUIClientContext localizedStringForKey:@"GIFTING_BUY_GIFT_BUTTON" inBundles:0 inTable:@"Gifting"];
  }

  return v5;
}

- (id)_confirmButtonTitle
{
  v2 = [(SUUIGiftStepViewController *)self giftConfiguration];
  id v3 = [v2 clientContext];
  BOOL v4 = v3;
  if (v3) {
    [v3 localizedStringForKey:@"GIFTING_BUY_CONFIRM_BUTTON" inTable:@"Gifting"];
  }
  else {
  id v5 = +[SUUIClientContext localizedStringForKey:@"GIFTING_BUY_CONFIRM_BUTTON" inBundles:0 inTable:@"Gifting"];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchRecognizer, 0);
  objc_storeStrong((id *)&self->_purchaseRequest, 0);
  objc_storeStrong((id *)&self->_confirmView, 0);
}

@end