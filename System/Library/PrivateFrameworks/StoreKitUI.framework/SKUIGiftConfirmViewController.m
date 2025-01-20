@interface SKUIGiftConfirmViewController
- (SKUIGiftConfirmViewController)initWithGift:(id)a3 configuration:(id)a4;
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

@implementation SKUIGiftConfirmViewController

- (SKUIGiftConfirmViewController)initWithGift:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftConfirmViewController initWithGift:configuration:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIGiftConfirmViewController;
  v8 = [(SKUIGiftStepViewController *)&v13 initWithGift:v6 configuration:v7];
  if (v8)
  {
    v9 = [v7 clientContext];
    v10 = v9;
    if (v9) {
      [v9 localizedStringForKey:@"GIFTING_REVIEW_TITLE" inTable:@"Gifting"];
    }
    else {
    v11 = +[SKUIClientContext localizedStringForKey:@"GIFTING_REVIEW_TITLE" inBundles:0 inTable:@"Gifting"];
    }
    [(SKUIGiftConfirmViewController *)v8 setTitle:v11];

    [(SKUIGiftConfirmViewController *)v8 setEdgesForExtendedLayout:0];
  }

  return v8;
}

- (void)dealloc
{
  v3 = [(SKUIGiftConfirmView *)self->_confirmView termsButton];
  [v3 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  [(SKUIFocusedTouchGestureRecognizer *)self->_touchRecognizer removeTarget:self action:0];
  v4.receiver = self;
  v4.super_class = (Class)SKUIGiftConfirmViewController;
  [(SKUIGiftConfirmViewController *)&v4 dealloc];
}

- (void)loadView
{
  confirmView = self->_confirmView;
  if (!confirmView)
  {
    objc_super v4 = [SKUIGiftConfirmView alloc];
    v5 = [(SKUIGiftStepViewController *)self gift];
    id v6 = [(SKUIGiftStepViewController *)self giftConfiguration];
    id v7 = [(SKUIGiftConfirmView *)v4 initWithGift:v5 configuration:v6];
    v8 = self->_confirmView;
    self->_confirmView = v7;

    v9 = self->_confirmView;
    v10 = [MEMORY[0x1E4FB1618] _systemBackgroundColor];
    [(SKUIGiftConfirmView *)v9 setBackgroundColor:v10];

    v11 = [(SKUIGiftConfirmView *)self->_confirmView termsButton];
    [v11 addTarget:self action:sel__termsButtonAction_ forControlEvents:64];

    confirmView = self->_confirmView;
  }
  [(SKUIGiftConfirmViewController *)self setView:confirmView];
  v12 = [(SKUIGiftStepViewController *)self giftConfiguration];
  id v16 = [v12 clientContext];

  objc_super v13 = [(SKUIGiftConfirmViewController *)self _buyButtonTitle];
  id v14 = [(SKUIGiftConfirmViewController *)self _newBuyBarButtonItemWithTitle:v13];
  v15 = [(SKUIGiftConfirmViewController *)self navigationItem];
  [v15 setRightBarButtonItem:v14];
}

- (void)_buyButtonAction:(id)a3
{
  if (self->_isShowingConfirmation)
  {
    [(SKUIGiftConfirmViewController *)self _purchaseGift];
    [(SKUIGiftConfirmViewController *)self _setShowingConfirmation:0 animated:1];
    [(SKUIGiftConfirmViewController *)self _removeCancelGestureRecognizer];
    id v11 = [(SKUIGiftConfirmViewController *)self navigationItem];
    objc_super v4 = [v11 rightBarButtonItem];
    [v4 setEnabled:0];
  }
  else
  {
    [(SKUIGiftConfirmViewController *)self _setShowingConfirmation:1 animated:1];
    if (self->_touchRecognizer) {
      return;
    }
    v5 = [(SKUIGiftConfirmViewController *)self navigationItem];
    id v6 = [v5 rightBarButtonItem];
    id v11 = [v6 customView];

    id v7 = [SKUIFocusedTouchGestureRecognizer alloc];
    v8 = -[SKUIFocusedTouchGestureRecognizer initWithFocusedView:touchAllowance:](v7, "initWithFocusedView:touchAllowance:", v11, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    touchRecognizer = self->_touchRecognizer;
    self->_touchRecognizer = v8;

    [(SKUIFocusedTouchGestureRecognizer *)self->_touchRecognizer addTarget:self action:sel__cancelBuyConfirmation_];
    objc_super v4 = [(SKUIGiftConfirmViewController *)self navigationController];
    v10 = [v4 view];
    [v10 addGestureRecognizer:self->_touchRecognizer];
  }
}

- (void)_cancelBuyConfirmation:(id)a3
{
  [(SKUIGiftConfirmViewController *)self _setShowingConfirmation:0 animated:1];

  [(SKUIGiftConfirmViewController *)self _removeCancelGestureRecognizer];
}

- (void)_termsButtonAction:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1CB10], "termsAndConditionsURL", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  SKUIMetricsOpenURL(v3);
}

- (void)_finishPurchaseWithResult:(BOOL)a3 errorMessage:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v18 = v6;
  if (v4)
  {
    [(SKUIGiftConfirmViewController *)self _showSuccessPage];
  }
  else if (v6)
  {
    id v7 = [(SKUIGiftStepViewController *)self giftConfiguration];
    v8 = [v7 clientContext];

    v9 = (void *)MEMORY[0x1E4FB1418];
    if (v8) {
      [v8 localizedStringForKey:@"GIFTING_UNABLE_TO_GIFT" inTable:@"Gifting"];
    }
    else {
    v10 = +[SKUIClientContext localizedStringForKey:@"GIFTING_UNABLE_TO_GIFT" inBundles:0 inTable:@"Gifting"];
    }
    id v11 = [v9 alertControllerWithTitle:v10 message:v18 preferredStyle:1];

    v12 = (void *)MEMORY[0x1E4FB1410];
    if (v8) {
      [v8 localizedStringForKey:@"GIFTING_OK_BUTTON" inTable:@"Gifting"];
    }
    else {
    objc_super v13 = +[SKUIClientContext localizedStringForKey:@"GIFTING_OK_BUTTON" inBundles:0 inTable:@"Gifting"];
    }
    id v14 = [v12 actionWithTitle:v13 style:0 handler:0];
    [v11 addAction:v14];

    [(SKUIGiftConfirmViewController *)self presentViewController:v11 animated:1 completion:0];
  }
  purchaseRequest = self->_purchaseRequest;
  self->_purchaseRequest = 0;

  id v16 = [(SKUIGiftConfirmViewController *)self navigationItem];
  v17 = [v16 rightBarButtonItem];
  [v17 setEnabled:1];
}

- (void)_purchaseGift
{
  if (!self->_purchaseRequest)
  {
    objc_initWeak(&location, self);
    id v3 = [SKUIGiftPurchaseRequest alloc];
    BOOL v4 = [(SKUIGiftStepViewController *)self gift];
    v5 = [(SKUIGiftStepViewController *)self giftConfiguration];
    id v6 = [(SKUIGiftPurchaseRequest *)v3 initWithGift:v4 configuration:v5];
    purchaseRequest = self->_purchaseRequest;
    self->_purchaseRequest = v6;

    v8 = self->_purchaseRequest;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__SKUIGiftConfirmViewController__purchaseGift__block_invoke;
    v9[3] = &unk_1E6425088;
    objc_copyWeak(&v10, &location);
    [(SKUIGiftPurchaseRequest *)v8 purchaseWithCompletionBlock:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __46__SKUIGiftConfirmViewController__purchaseGift__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SKUIGiftConfirmViewController__purchaseGift__block_invoke_2;
  block[3] = &unk_1E6424248;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v10 = a2;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __46__SKUIGiftConfirmViewController__purchaseGift__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _finishPurchaseWithResult:*(unsigned __int8 *)(a1 + 48) errorMessage:*(void *)(a1 + 32)];
}

- (void)_removeCancelGestureRecognizer
{
  [(SKUIFocusedTouchGestureRecognizer *)self->_touchRecognizer removeTarget:self action:0];
  id v3 = [(SKUIFocusedTouchGestureRecognizer *)self->_touchRecognizer view];
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
      [(SKUIGiftConfirmViewController *)self _confirmButtonTitle];
    }
    else {
    id v9 = [(SKUIGiftConfirmViewController *)self _buyButtonTitle];
    }
    id v7 = [(SKUIGiftConfirmViewController *)self _newBuyBarButtonItemWithTitle:v9];
    id v8 = [(SKUIGiftConfirmViewController *)self navigationItem];
    [v8 setRightBarButtonItem:v7 animated:v4];

    self->_isShowingConfirmation = a3;
  }
}

- (void)_showSuccessPage
{
  id v3 = [SKUIGiftResultViewController alloc];
  BOOL v4 = [(SKUIGiftStepViewController *)self gift];
  id v5 = [(SKUIGiftStepViewController *)self giftConfiguration];
  id v8 = [(SKUIGiftResultViewController *)v3 initWithGift:v4 configuration:v5];

  id v6 = [(SKUIGiftStepViewController *)self operationQueue];
  [(SKUIGiftStepViewController *)v8 setOperationQueue:v6];

  id v7 = [(SKUIGiftConfirmViewController *)self navigationController];
  [v7 pushViewController:v8 animated:1];

  [(SKUIGiftConfirmViewController *)self _removeCancelGestureRecognizer];
}

- (id)_newBuyBarButtonItemWithTitle:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4FB14D0];
  id v5 = a3;
  id v6 = [v4 buttonWithType:1];
  id v7 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:17.0];
  id v8 = [v6 titleLabel];
  [v8 setFont:v7];

  [v6 addTarget:self action:sel__buyButtonAction_ forEvents:64];
  [v6 setTitle:v5 forState:0];

  [v6 sizeToFit];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v6];

  return v9;
}

- (id)_buyButtonTitle
{
  v2 = [(SKUIGiftStepViewController *)self giftConfiguration];
  id v3 = [v2 clientContext];
  BOOL v4 = v3;
  if (v3) {
    [v3 localizedStringForKey:@"GIFTING_BUY_GIFT_BUTTON" inTable:@"Gifting"];
  }
  else {
  id v5 = +[SKUIClientContext localizedStringForKey:@"GIFTING_BUY_GIFT_BUTTON" inBundles:0 inTable:@"Gifting"];
  }

  return v5;
}

- (id)_confirmButtonTitle
{
  v2 = [(SKUIGiftStepViewController *)self giftConfiguration];
  id v3 = [v2 clientContext];
  BOOL v4 = v3;
  if (v3) {
    [v3 localizedStringForKey:@"GIFTING_BUY_CONFIRM_BUTTON" inTable:@"Gifting"];
  }
  else {
  id v5 = +[SKUIClientContext localizedStringForKey:@"GIFTING_BUY_CONFIRM_BUTTON" inBundles:0 inTable:@"Gifting"];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchRecognizer, 0);
  objc_storeStrong((id *)&self->_purchaseRequest, 0);

  objc_storeStrong((id *)&self->_confirmView, 0);
}

- (void)initWithGift:configuration:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGiftConfirmViewController initWithGift:configuration:]";
}

@end