@interface PKPeerPaymentActionTransferToBankAmountPickerViewController
- (BOOL)_isCurrentAmountValid;
- (BOOL)_shouldShakeWithNewAmount:(id)a3;
- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5;
- (PKPeerPaymentActionTransferToBankAmountPickerViewController)initWithPaymentPass:(id)a3 webService:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6;
- (id)_nextBarButton;
- (void)_currentAmountDidChangeTo:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4;
- (void)_nextBarButtonPressed:(id)a3;
- (void)_updateBarButtonEnabledState;
- (void)_updateCurrentAmount:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4;
- (void)_updateLayoutForKeyboardAction:(id)a3;
- (void)dealloc;
- (void)enterCurrencyAmountPassViewDidLoadPassSnapshot:(id)a3;
- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3;
- (void)keyboardWillChange:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)loadView;
- (void)setCardBalance:(id)a3;
- (void)setMaxBalance:(id)a3;
- (void)setMaxLoadAmount:(id)a3;
- (void)setMinBalance:(id)a3;
- (void)setMinLoadAmount:(id)a3;
- (void)updateAccountValues;
- (void)updateFirstResponder;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willDismissViewController;
@end

@implementation PKPeerPaymentActionTransferToBankAmountPickerViewController

- (PKPeerPaymentActionTransferToBankAmountPickerViewController)initWithPaymentPass:(id)a3 webService:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v35.receiver = self;
  v35.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  v13 = [(PKPeerPaymentActionViewController *)&v35 initWithPaymentPass:v10 webService:v11 passLibraryDataProvider:v12 context:a6];
  v14 = (PKPeerPaymentActionTransferToBankAmountPickerViewController *)v13;
  if (v13)
  {
    long long v15 = *MEMORY[0x1E4F1DB20];
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(v13 + 1144) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v13 + 1160) = v16;
    *(_OWORD *)(v13 + 1112) = v15;
    *(_OWORD *)(v13 + 1128) = v16;
    v17 = [v13 account];
    v18 = [v17 currentBalance];
    v19 = [v18 amount];
    [(PKPeerPaymentActionViewController *)v14 setCurrentAmount:v19];

    v20 = [(PKPeerPaymentActionViewController *)v14 currentAmount];
    [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)v14 _updateCurrentAmount:v20 shouldGenerateNewSuggestions:1];

    v21 = [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)v14 navigationItem];
    v22 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPer_5.isa);
    [v21 setTitle:v22];

    [v21 setBackButtonDisplayMode:2];
    id v23 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
    [v23 configureWithTransparentBackground];
    v24 = +[PKPeerPaymentActionViewController navigationBarBackgroundColor];
    [v23 setBackgroundColor:v24];

    [v21 setStandardAppearance:v23];
    v25 = [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)v14 _nextBarButton];
    [v21 setRightBarButtonItem:v25];

    [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)v14 _updateBarButtonEnabledState];
    objc_initWeak(&location, v14);
    v26 = [v11 peerPaymentService];
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __126__PKPeerPaymentActionTransferToBankAmountPickerViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke;
    v32 = &unk_1E59CB088;
    objc_copyWeak(&v33, &location);
    [v26 recurringPaymentsWithCompletion:&v29];

    uint64_t v27 = *MEMORY[0x1E4F87C68];
    objc_msgSend(v11, "prewarmDeviceScoreForEndpoint:recipientAddress:quoteDestinationType:", *MEMORY[0x1E4F87C68], 0, 2, v29, v30, v31, v32);
    [v11 prewarmDeviceScoreForEndpoint:v27 recipientAddress:0 quoteDestinationType:4];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  return v14;
}

void __126__PKPeerPaymentActionTransferToBankAmountPickerViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * v7) type] == 3)
        {

          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __126__PKPeerPaymentActionTransferToBankAmountPickerViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke_2;
          block[3] = &unk_1E59CA7F8;
          objc_copyWeak(&v9, (id *)(a1 + 32));
          dispatch_async(MEMORY[0x1E4F14428], block);
          objc_destroyWeak(&v9);
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

void __126__PKPeerPaymentActionTransferToBankAmountPickerViewController_initWithPaymentPass_webService_passLibraryDataProvider_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [MEMORY[0x1E4F28C28] zero];
    [WeakRetained setCurrentAmount:v1];

    v2 = [WeakRetained currentAmount];
    [WeakRetained _updateCurrentAmount:v2 shouldGenerateNewSuggestions:1];
  }
}

- (void)dealloc
{
  id v3 = [(PKPeerPaymentActionViewController *)self webService];
  uint64_t v4 = *MEMORY[0x1E4F87C68];
  [v3 unloadDeviceScoreForEndpoint:*MEMORY[0x1E4F87C68] recipientAddress:0 quoteDestinationType:2];
  [v3 unloadDeviceScoreForEndpoint:v4 recipientAddress:0 quoteDestinationType:4];

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  [(PKPeerPaymentActionViewController *)&v5 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)&v5 viewWillAppear:a3];
  self->_visibility = 1;
  uint64_t v4 = [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self view];
  [v4 setNeedsLayout];
  [v4 layoutIfNeeded];
  [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self updateFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  [(PKPeerPaymentActionViewController *)&v5 viewWillDisappear:a3];
  self->_visibility = 3;
  if (self->_keyboardVisible)
  {
    uint64_t v4 = [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self view];
    [v4 setNeedsLayout];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  [(PKPeerPaymentActionViewController *)&v5 viewDidAppear:a3];
  self->_visibility = 2;
  if (self->_keyboardVisible)
  {
    uint64_t v4 = [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self view];
    [v4 setNeedsLayout];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)&v5 viewDidDisappear:a3];
  self->_visibility = 0;
  if (self->_keyboardVisible)
  {
    uint64_t v4 = [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self view];
    [v4 setNeedsLayout];
  }
}

- (void)loadView
{
  v19.receiver = self;
  v19.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  [(PKPeerPaymentActionViewController *)&v19 loadView];
  id v3 = [(PKPeerPaymentActionViewController *)self account];
  uint64_t v4 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
  scrollView = self->_scrollView;
  self->_scrollView = v4;

  uint64_t v6 = [(PKPeerPaymentActionViewController *)self currentAmount];
  uint64_t v7 = [v3 currentBalance];
  v8 = [v7 currency];
  id v9 = PKCurrencyAmountCreate(v6, v8);

  long long v10 = [PKEnterCurrencyAmountPassView alloc];
  long long v11 = [(PKPeerPaymentActionViewController *)self pass];
  long long v12 = [(PKEnterCurrencyAmountPassView *)v10 initWithCurrenyAmount:v9 pass:v11 withdrawal:1];
  amountPassView = self->_amountPassView;
  self->_amountPassView = v12;

  v14 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView enterCurrencyAmountView];
  [v14 setDelegate:self];
  [v14 setClearAmountOnFirstKeyboardInput:1];
  if ([MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode])
  {
    uint64_t v15 = [v14 amountTextField];
    [v15 setDisablePrediction:1];
  }
  [(PKEnterCurrencyAmountPassView *)self->_amountPassView setDelegate:self];
  long long v16 = [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self view];
  [v16 addSubview:self->_scrollView];
  [(UIScrollView *)self->_scrollView addSubview:self->_amountPassView];
  v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v17 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
  [v17 addObserver:self selector:sel_keyboardWillChange_ name:*MEMORY[0x1E4FB2C48] object:0];
  [v17 addObserver:self selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
  v18 = [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self view];
  [v18 setAccessibilityIdentifier:*MEMORY[0x1E4F85B00]];
}

- (void)viewWillLayoutSubviews
{
  v45.receiver = self;
  v45.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)&v45 viewWillLayoutSubviews];
  id v3 = [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 bounds];
  double v13 = v7 + v12;
  double v15 = v5 + v14;
  double v17 = v16 - (v7 + v11);
  double v19 = v18 - (v5 + v9);
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v13, v15, v17, v19);
  if (PKViewVisibilityStateIsVisible())
  {
    CGFloat x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    if (!CGRectIsNull(self->_keyboardFrame))
    {
      v24 = [v3 window];
      v25 = v24;
      if (v24)
      {
        objc_msgSend(v24, "convertRect:fromWindow:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
        objc_msgSend(v3, "convertRect:fromView:", 0);
        CGFloat x = v26;
        double y = v27;
        CGFloat width = v28;
        CGFloat height = v29;
      }
    }
  }
  else
  {
    CGFloat x = self->_lastKeyboardFrame.origin.x;
    double y = self->_lastKeyboardFrame.origin.y;
    CGFloat width = self->_lastKeyboardFrame.size.width;
    CGFloat height = self->_lastKeyboardFrame.size.height;
  }
  v46.origin.CGFloat x = x;
  v46.origin.double y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  double v30 = 0.0;
  if (!CGRectIsNull(v46))
  {
    [v3 bounds];
    double v30 = fmax(v31 + v32 - y, 0.0);
  }
  [(PKEnterCurrencyAmountPassView *)self->_amountPassView frame];
  CGFloat v33 = y;
  double v35 = v34;
  double v37 = v36;
  -[PKEnterCurrencyAmountPassView sizeThatFits:](self->_amountPassView, "sizeThatFits:", v17, v19 - v30 + -15.0);
  CGFloat v39 = v38;
  double v40 = v17;
  CGFloat v42 = v41;
  -[PKEnterCurrencyAmountPassView setFrame:](self->_amountPassView, "setFrame:", v35, v37, v38, v41);
  v47.origin.CGFloat x = v35;
  v47.origin.double y = v37;
  v47.size.CGFloat width = v39;
  v47.size.CGFloat height = v42;
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v40, v30 + CGRectGetMaxY(v47) + 15.0);
  self->_lastKeyboardFrame.origin.CGFloat x = x;
  self->_lastKeyboardFrame.origin.double y = v33;
  self->_lastKeyboardFrame.size.CGFloat width = v43;
  self->_lastKeyboardFrame.size.CGFloat height = v44;
}

- (void)willDismissViewController
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  [(PKPeerPaymentActionViewController *)&v4 willDismissViewController];
  id v3 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView enterCurrencyAmountView];
  [v3 dismissKeyboard];
}

- (void)updateFirstResponder
{
  id v3 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView enterCurrencyAmountView];
  v2 = [v3 amountTextField];
  [v2 becomeFirstResponder];
}

- (void)updateAccountValues
{
  v16.receiver = self;
  v16.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  [(PKPeerPaymentActionViewController *)&v16 updateAccountValues];
  id v3 = [(PKPeerPaymentActionViewController *)self account];
  [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self _updateBarButtonEnabledState];
  if (v3)
  {
    objc_super v4 = [v3 currentBalance];
    double v5 = [v4 amount];
    double v6 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView enterCurrencyAmountView];
    double v7 = [v4 currency];
    [v6 setCurrency:v7];

    [v6 sizeToFit];
    double v8 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView balanceView];
    double v9 = [v4 currency];
    [v8 setCurrencyCode:v9];

    double v10 = [(PKPeerPaymentActionViewController *)self maxLoadAmount];
    [v8 setMaxLoadAmount:v10];

    double v11 = [(PKPeerPaymentActionViewController *)self minLoadAmount];
    [v8 setMinLoadAmount:v11];

    [v8 setMaxBalance:v5];
    double v12 = [(PKPeerPaymentActionViewController *)self minBalance];
    [v8 setMinBalance:v12];

    double v13 = [v4 amount];
    [v8 setCardBalance:v13];

    [v8 sizeToFit];
    [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self setMaxBalance:v5];
    double v14 = [(PKPeerPaymentActionViewController *)self currentAmount];
    [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self _updateCurrentAmount:v14 shouldGenerateNewSuggestions:1];

    double v15 = [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self view];
    [v15 setNeedsLayout];
  }
}

- (void)keyboardWillShow:(id)a3
{
  objc_super v4 = [a3 userInfo];
  double v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__PKPeerPaymentActionTransferToBankAmountPickerViewController_keyboardWillShow___block_invoke;
  v7[3] = &unk_1E59CADB8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self _updateLayoutForKeyboardAction:v7];
}

BOOL __80__PKPeerPaymentActionTransferToBankAmountPickerViewController_keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  CGFloat v3 = *(double *)(v2 + 1112);
  CGFloat v4 = *(double *)(v2 + 1120);
  CGFloat v5 = *(double *)(v2 + 1128);
  CGFloat v6 = *(double *)(v2 + 1136);
  *(unsigned char *)(v2 + 1105) = 1;
  uint64_t v8 = *(void *)(a1 + 32);
  double v7 = *(void **)(a1 + 40);
  double v9 = (void *)(v8 + 1112);
  if (v7)
  {
    [v7 CGRectValue];
    *double v9 = v10;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v13;
  }
  else
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)double v9 = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v8 + 1128) = v14;
  }
  v16.origin.CGFloat x = v3;
  v16.origin.double y = v4;
  v16.size.CGFloat width = v5;
  v16.size.CGFloat height = v6;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1112), v16);
}

- (void)keyboardWillChange:(id)a3
{
  if (self->_keyboardVisible)
  {
    CGFloat v4 = [a3 userInfo];
    CGFloat v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __82__PKPeerPaymentActionTransferToBankAmountPickerViewController_keyboardWillChange___block_invoke;
      v6[3] = &unk_1E59CADB8;
      v6[4] = self;
      id v7 = v5;
      [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self _updateLayoutForKeyboardAction:v6];
    }
  }
}

BOOL __82__PKPeerPaymentActionTransferToBankAmountPickerViewController_keyboardWillChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  CGFloat v3 = v2 + 139;
  CGFloat v4 = *((double *)v2 + 139);
  CGFloat v5 = *((double *)v2 + 140);
  CGFloat v6 = *((double *)v2 + 141);
  CGFloat v7 = *((double *)v2 + 142);
  [*(id *)(a1 + 40) CGRectValue];
  *CGFloat v3 = v8;
  v3[1] = v9;
  v3[2] = v10;
  v3[3] = v11;
  v13.origin.CGFloat x = v4;
  v13.origin.double y = v5;
  v13.size.CGFloat width = v6;
  v13.size.CGFloat height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1112), v13);
}

- (void)keyboardWillHide:(id)a3
{
  if (self->_keyboardVisible)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __80__PKPeerPaymentActionTransferToBankAmountPickerViewController_keyboardWillHide___block_invoke;
    v3[3] = &unk_1E59CADE0;
    v3[4] = self;
    [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self _updateLayoutForKeyboardAction:v3];
  }
}

BOOL __80__PKPeerPaymentActionTransferToBankAmountPickerViewController_keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CGRect v8 = *(CGRect *)(v1 + 1112);
  *(unsigned char *)(v1 + 1105) = 0;
  uint64_t v2 = (_OWORD *)(*(void *)(a1 + 32) + 1112);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  _OWORD *v2 = *MEMORY[0x1E4F1DB20];
  v2[1] = v3;
  *(void *)&long long v3 = *(void *)(*(void *)(a1 + 32) + 1112);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 1120);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 1128);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 1136);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  uint64_t v4 = (unsigned int (**)(void))a3;
  if (v4)
  {
    uint64_t v5 = [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self viewIfLoaded];
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 layoutIfNeeded];
      if (v4[2](v4))
      {
        [v6 setNeedsLayout];
        CGFloat v7 = (void *)MEMORY[0x1E4FB1EB0];
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __94__PKPeerPaymentActionTransferToBankAmountPickerViewController__updateLayoutForKeyboardAction___block_invoke;
        v8[3] = &unk_1E59CA7D0;
        id v9 = v6;
        [v7 _animateUsingDefaultTimingWithOptions:134 animations:v8 completion:0];
      }
    }
    else
    {
      v4[2](v4);
    }
  }
}

uint64_t __94__PKPeerPaymentActionTransferToBankAmountPickerViewController__updateLayoutForKeyboardAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)enterCurrencyAmountPassViewDidLoadPassSnapshot:(id)a3
{
  id v3 = [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self viewIfLoaded];
  [v3 setNeedsLayout];
}

- (void)setMaxBalance:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentActionViewController *)self maxBalance];
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  [(PKPeerPaymentActionViewController *)&v8 setMaxBalance:v4];
  if (v5 != v4 && ([v4 isEqualToNumber:v5] & 1) == 0)
  {
    uint64_t v6 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView balanceView];
    [v6 setMaxBalance:v4];

    CGFloat v7 = [(PKPeerPaymentActionViewController *)self currentAmount];
    [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self _updateCurrentAmount:v7 shouldGenerateNewSuggestions:1];
  }
}

- (void)setMinBalance:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentActionViewController *)self minBalance];
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  [(PKPeerPaymentActionViewController *)&v8 setMinBalance:v4];
  if (v5 != v4 && ([v4 isEqualToNumber:v5] & 1) == 0)
  {
    uint64_t v6 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView balanceView];
    [v6 setMinBalance:v4];

    CGFloat v7 = [(PKPeerPaymentActionViewController *)self currentAmount];
    [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self _updateCurrentAmount:v7 shouldGenerateNewSuggestions:1];
  }
}

- (void)setMaxLoadAmount:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentActionViewController *)self maxLoadAmount];
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  [(PKPeerPaymentActionViewController *)&v8 setMaxLoadAmount:v4];
  if (v5 != v4 && ([v4 isEqualToNumber:v5] & 1) == 0)
  {
    uint64_t v6 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView balanceView];
    [v6 setMaxLoadAmount:v4];

    CGFloat v7 = [(PKPeerPaymentActionViewController *)self currentAmount];
    [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self _updateCurrentAmount:v7 shouldGenerateNewSuggestions:1];
  }
}

- (void)setMinLoadAmount:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentActionViewController *)self minLoadAmount];
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  [(PKPeerPaymentActionViewController *)&v8 setMinLoadAmount:v4];
  if (v5 != v4 && ([v4 isEqualToNumber:v5] & 1) == 0)
  {
    uint64_t v6 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView balanceView];
    [v6 setMinLoadAmount:v4];

    CGFloat v7 = [(PKPeerPaymentActionViewController *)self currentAmount];
    [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self _updateCurrentAmount:v7 shouldGenerateNewSuggestions:1];
  }
}

- (void)setCardBalance:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentActionViewController *)self cardBalance];
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentActionTransferToBankAmountPickerViewController;
  [(PKPeerPaymentActionViewController *)&v8 setCardBalance:v4];
  if (v5 != v4 && ([v4 isEqualToNumber:v5] & 1) == 0)
  {
    uint64_t v6 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView balanceView];
    [v6 setCardBalance:v4];

    CGFloat v7 = [(PKPeerPaymentActionViewController *)self currentAmount];
    [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self _updateCurrentAmount:v7 shouldGenerateNewSuggestions:1];
  }
}

- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self _shouldShakeWithNewAmount:v8])
  {
    [(PKEnterCurrencyAmountPassView *)self->_amountPassView shakePassView];
  }
  id v9 = [(PKPeerPaymentActionViewController *)self cardBalance];
  uint64_t v10 = [(PKPeerPaymentActionViewController *)self minBalance];
  uint64_t v11 = [(PKPeerPaymentActionViewController *)self maxBalance];
  uint64_t v12 = [(PKPeerPaymentActionViewController *)self maxLoadAmount];
  CGRect v13 = [v9 decimalNumberBySubtracting:v7];
  long long v14 = [v9 decimalNumberBySubtracting:v8];
  double v15 = [MEMORY[0x1E4F28C28] zero];
  if ([v14 compare:v15] == -1)
  {
    [MEMORY[0x1E4F28C28] zero];
    v25 = v12;
    CGRect v16 = v9;
    double v17 = v11;
    id v18 = v8;
    double v19 = v10;
    v21 = id v20 = v7;
    uint64_t v22 = [v13 compare:v21];

    id v7 = v20;
    uint64_t v10 = v19;
    id v8 = v18;
    uint64_t v11 = v17;
    id v9 = v16;
    uint64_t v12 = v25;

    if (v22 == -1)
    {
LABEL_16:
      BOOL v23 = 0;
      goto LABEL_17;
    }
  }
  else
  {
  }
  if (v12 && [v12 compare:v7] == -1 && objc_msgSend(v12, "compare:", v8) == -1
    || v11 && [v11 compare:v14] == -1 && objc_msgSend(v11, "compare:", v13) == -1)
  {
    goto LABEL_16;
  }
  BOOL v23 = !v10 || [v10 compare:v14] != 1 || objc_msgSend(v10, "compare:", v13) != 1;
LABEL_17:

  return v23;
}

- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3
{
  id v5 = [a3 currentAmount];
  [(PKPeerPaymentActionViewController *)self setCurrentAmount:v5];
  id v4 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView balanceView];
  [v4 subtractAmountFromBalance:v5];

  [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self _currentAmountDidChangeTo:v5 shouldGenerateNewSuggestions:1];
}

- (id)_nextBarButton
{
  id v3 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPer_6.isa);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v3 style:2 target:self action:sel__nextBarButtonPressed_];
  [v4 setAccessibilityIdentifier:*MEMORY[0x1E4F85720]];

  return v4;
}

- (void)_updateBarButtonEnabledState
{
  id v3 = [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self navigationItem];
  id v6 = [v3 rightBarButtonItem];

  id v4 = [(PKPeerPaymentActionViewController *)self account];

  if (v4) {
    BOOL v5 = [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self _isCurrentAmountValid];
  }
  else {
    BOOL v5 = 0;
  }
  [v6 setEnabled:v5];
}

- (void)_nextBarButtonPressed:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PKPeerPaymentActionTransferToBankAmountPickerViewController__nextBarButtonPressed___block_invoke;
  aBlock[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v13, &location);
  BOOL v5 = _Block_copy(aBlock);
  id v6 = [(PKPeerPaymentActionViewController *)self webService];
  id v7 = [v6 peerPaymentService];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__PKPeerPaymentActionTransferToBankAmountPickerViewController__nextBarButtonPressed___block_invoke_2;
  v9[3] = &unk_1E59D6F48;
  v9[4] = self;
  objc_copyWeak(&v11, &location);
  id v8 = v5;
  id v10 = v8;
  [v7 recurringPaymentsWithCompletion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __85__PKPeerPaymentActionTransferToBankAmountPickerViewController__nextBarButtonPressed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = [PKPeerPaymentActionTransferToBankViewController alloc];
    uint64_t v2 = [WeakRetained pass];
    id v3 = [WeakRetained webService];
    id v4 = [WeakRetained passLibraryDataProvider];
    BOOL v5 = -[PKPeerPaymentActionTransferToBankViewController initWithPaymentPass:webService:passLibraryDataProvider:context:](v1, "initWithPaymentPass:webService:passLibraryDataProvider:context:", v2, v3, v4, [WeakRetained context]);

    uint64_t v6 = [WeakRetained controllerAction];
    id v7 = [WeakRetained currentAmount];
    [(PKPeerPaymentActionViewController *)v5 setCurrentAmount:v7];

    id v8 = [WeakRetained delegate];
    [(PKPeerPaymentActionViewController *)v5 setDelegate:v8];

    [(PKPeerPaymentActionViewController *)v5 setControllerAction:v6];
    id v9 = [WeakRetained navigationController];
    [v9 pushViewController:v5 animated:1];
  }
}

void __85__PKPeerPaymentActionTransferToBankAmountPickerViewController__nextBarButtonPressed___block_invoke_2(id *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = a2;
  id v4 = (id)[v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v7 type] == 3)
        {
          id v4 = v7;
          id v9 = [a1[4] account];
          id v10 = [v9 currentBalance];
          id v11 = [v10 amount];

          uint64_t v12 = [a1[4] currentAmount];
          if (objc_msgSend(v11, "pk_isNotANumber") & 1) != 0 || (objc_msgSend(v12, "pk_isNotANumber"))
          {
            BOOL v8 = 0;
          }
          else
          {
            id v13 = [v11 decimalNumberBySubtracting:v12];
            long long v14 = [v4 threshold];
            BOOL v8 = [v14 compare:v13] == 1;
          }
          goto LABEL_15;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_15:

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__PKPeerPaymentActionTransferToBankAmountPickerViewController__nextBarButtonPressed___block_invoke_3;
  v16[3] = &unk_1E59D0FE0;
  objc_copyWeak(&v19, a1 + 6);
  BOOL v20 = v8;
  id v17 = v4;
  id v18 = a1[5];
  id v15 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v16);

  objc_destroyWeak(&v19);
}

void __85__PKPeerPaymentActionTransferToBankAmountPickerViewController__nextBarButtonPressed___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      id v3 = [*(id *)(a1 + 32) currencyThreshold];
      id v4 = [v3 minimalFormattedStringValue];
      uint64_t v5 = [*(id *)(a1 + 32) currencyAmount];
      uint64_t v6 = [v5 minimalFormattedStringValue];
      id v7 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadTran.isa, &stru_1EF1B5770.isa, v4, v6);

      BOOL v8 = (void *)MEMORY[0x1E4FB1418];
      id v9 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadTran_0.isa);
      id v10 = [v8 alertControllerWithTitle:v9 message:v7 preferredStyle:1];

      id v11 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v12 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadTran_1.isa);
      id v13 = [v11 actionWithTitle:v12 style:0 handler:&__block_literal_global_151];

      [v10 addAction:v13];
      long long v14 = (void *)MEMORY[0x1E4FB1410];
      id v15 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadTran_2.isa);
      CGRect v16 = [v14 actionWithTitle:v15 style:0 handler:&__block_literal_global_83];
      [v10 addAction:v16];

      id v17 = (void *)MEMORY[0x1E4FB1410];
      id v18 = PKLocalizedPeerPaymentRecurringString(&cfstr_AutoReloadTran_3.isa);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __85__PKPeerPaymentActionTransferToBankAmountPickerViewController__nextBarButtonPressed___block_invoke_6;
      v21[3] = &unk_1E59CB150;
      id v22 = *(id *)(a1 + 40);
      id v19 = [v17 actionWithTitle:v18 style:0 handler:v21];
      [v10 addAction:v19];

      [v10 setPreferredAction:v13];
      BOOL v20 = [WeakRetained navigationController];
      [v20 presentViewController:v10 animated:1 completion:0];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __85__PKPeerPaymentActionTransferToBankAmountPickerViewController__nextBarButtonPressed___block_invoke_5()
{
  id v5 = [NSString stringWithFormat:@"%@/%@", *MEMORY[0x1E4F87F88], *MEMORY[0x1E4F87F70]];
  if (PKRunningInPassbook())
  {
    v0 = @"wallet://";
  }
  else
  {
    v0 = [NSString stringWithFormat:@"https://%@/", *MEMORY[0x1E4F88090]];
  }
  uint64_t v1 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v2 = [(__CFString *)v0 stringByAppendingString:v5];
  id v3 = [v1 URLWithString:v2];

  id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v4 openSensitiveURL:v3 withOptions:0];
}

uint64_t __85__PKPeerPaymentActionTransferToBankAmountPickerViewController__nextBarButtonPressed___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateCurrentAmount:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  [(PKPeerPaymentActionViewController *)self setCurrentAmount:v8];
  uint64_t v6 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView balanceView];
  [v6 subtractAmountFromBalance:v8];

  id v7 = [(PKEnterCurrencyAmountPassView *)self->_amountPassView enterCurrencyAmountView];
  [v7 setCurrentAmount:v8];

  [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self _currentAmountDidChangeTo:v8 shouldGenerateNewSuggestions:v4];
}

- (void)_currentAmountDidChangeTo:(id)a3 shouldGenerateNewSuggestions:(BOOL)a4
{
  [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self _updateBarButtonEnabledState];
  id v5 = [(PKPeerPaymentActionTransferToBankAmountPickerViewController *)self view];
  [v5 setNeedsLayout];
}

- (BOOL)_shouldShakeWithNewAmount:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPeerPaymentActionViewController *)self cardBalance];
  uint64_t v6 = [(PKPeerPaymentActionViewController *)self minBalance];
  id v7 = [(PKPeerPaymentActionViewController *)self maxLoadAmount];
  if (v4)
  {
    id v8 = [MEMORY[0x1E4F28C28] notANumber];
    uint64_t v9 = [v4 compare:v8];

    if (v9)
    {
      id v10 = [v5 decimalNumberBySubtracting:v4];
      LOBYTE(v9) = v7 && [v7 compare:v4] == -1 || v6 && objc_msgSend(v6, "compare:", v10) == 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)_isCurrentAmountValid
{
  id v3 = [(PKPeerPaymentActionViewController *)self cardBalance];
  id v4 = [(PKPeerPaymentActionViewController *)self minBalance];
  id v5 = [(PKPeerPaymentActionViewController *)self maxBalance];
  uint64_t v6 = [(PKPeerPaymentActionViewController *)self maxLoadAmount];
  id v7 = [(PKPeerPaymentActionViewController *)self minLoadAmount];
  id v8 = [(PKPeerPaymentActionViewController *)self currentAmount];
  uint64_t v9 = [v3 decimalNumberBySubtracting:v8];
  id v10 = [MEMORY[0x1E4F28C28] notANumber];
  char v11 = [v8 isEqualToNumber:v10];

  uint64_t v12 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v13 = [v8 compare:v12];

  if (!v13
    || v6 && [v6 compare:v8] == -1
    || v7 && [v7 compare:v8] == 1
    || v4 && [v4 compare:v9] == 1)
  {
    char v14 = 0;
  }
  else
  {
    char v14 = v11 ^ 1;
    if (v5 && [v5 compare:v9] == -1) {
      char v14 = 0;
    }
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_amountPassView, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end