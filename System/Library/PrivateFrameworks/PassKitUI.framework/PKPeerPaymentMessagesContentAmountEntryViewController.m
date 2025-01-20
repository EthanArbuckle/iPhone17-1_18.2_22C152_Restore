@interface PKPeerPaymentMessagesContentAmountEntryViewController
- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor;
- (BOOL)pkui_navigationBarHidden;
- (BOOL)showSendAndRequest;
- (BOOL)showSetupRecurringSend;
- (NSString)memo;
- (PKCurrencyAmount)amount;
- (PKPeerPaymentMessagesContentAmountEntryView)mainView;
- (PKPeerPaymentMessagesContentAmountEntryViewController)init;
- (PKPeerPaymentMessagesContentAmountEntryViewController)initWithMessagesAppController:(id)a3;
- (PKPeerPaymentMessagesContentAmountEntryViewControllerDelegate)delegate;
- (id)_currentBalance;
- (id)_maximumTransferAmount;
- (id)_minimumTransferAmount;
- (unint64_t)context;
- (unint64_t)sourceType;
- (void)_noteAmountChanged;
- (void)_registerForPresentationSemanticContextChanges;
- (void)reloadContent;
- (void)sendAnalyticsForAction:(unint64_t)a3;
- (void)setAmount:(id)a3;
- (void)setContext:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setMemo:(id)a3;
- (void)setShowSendAndRequest:(BOOL)a3;
- (void)setShowSetupRecurringSend:(BOOL)a3;
- (void)setSourceType:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPeerPaymentMessagesContentAmountEntryViewController

- (PKPeerPaymentMessagesContentAmountEntryViewController)init
{
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  v2 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)&v11 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28C28] one];
    v4 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)v2 _currentBalance];
    uint64_t v5 = [v4 currency];
    v6 = (void *)v5;
    if (v5) {
      v7 = (__CFString *)v5;
    }
    else {
      v7 = @"USD";
    }
    uint64_t v8 = PKCurrencyAmountCreate(v3, &v7->isa);
    amount = v2->_amount;
    v2->_amount = (PKCurrencyAmount *)v8;
  }
  return v2;
}

- (PKPeerPaymentMessagesContentAmountEntryViewController)initWithMessagesAppController:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  v3 = [(PKPeerPaymentMessagesContentBaseViewController *)&v12 initWithMessagesAppController:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28C28] one];
    uint64_t v5 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)v3 _currentBalance];
    uint64_t v6 = [v5 currency];
    v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (__CFString *)v6;
    }
    else {
      uint64_t v8 = @"USD";
    }
    uint64_t v9 = PKCurrencyAmountCreate(v4, &v8->isa);
    amount = v3->_amount;
    v3->_amount = (PKCurrencyAmount *)v9;
  }
  return v3;
}

- (void)viewDidLoad
{
  v41.receiver = self;
  v41.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  [(PKPeerPaymentMessagesContentAmountEntryViewController *)&v41 viewDidLoad];
  objc_initWeak(&location, self);
  v3 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self traitCollection];
  v4 = [v3 preferredContentSizeCategory];
  self->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E4FB2790]) == NSOrderedDescending;

  uint64_t v5 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  uint64_t v6 = [v5 traitCollection];
  uint64_t v7 = [v6 _presentationSemanticContext];

  uint64_t v8 = [(PKPeerPaymentMessagesContentBaseViewController *)self contentView];
  [v8 setContentAlignment:PKContentAlignmentMake()];
  [v8 setVerticalPadding:0.0];
  objc_msgSend(v8, "setContentInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v8 setIgnoreTopSafeArea:v7 == 2];
  uint64_t v9 = [PKPeerPaymentMessagesContentAmountEntryView alloc];
  [v8 bounds];
  v10 = -[PKPeerPaymentMessagesContentAmountEntryView initWithFrame:](v9, "initWithFrame:");
  mainView = self->_mainView;
  self->_mainView = v10;

  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView setPresentationContext:v7];
  unint64_t context = self->_context;
  if (context)
  {
    if (context == 1)
    {
      [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView setSubtitleType:1];
      v13 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView memoField];
      [v13 setText:self->_memo];

      v14 = self->_mainView;
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke;
      v38[3] = &unk_1E59D7080;
      objc_copyWeak(&v39, &location);
      [(PKPeerPaymentMessagesContentAmountEntryView *)v14 setMemoChangedHandler:v38];
      objc_destroyWeak(&v39);
    }
  }
  else
  {
    [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView setSubtitleType:0];
  }
  v15 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];

  if (v15)
  {
    v16 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
    [v16 _percentExpanded];
LABEL_7:
    double v18 = v17;

    goto LABEL_8;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v18 = 1.0;
  if (WeakRetained)
  {
    v24 = WeakRetained;
    id v25 = objc_loadWeakRetained((id *)&self->_delegate);
    char v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 percentExpanded];
      goto LABEL_7;
    }
  }
LABEL_8:
  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView setPercentExpanded:v18];
  [v8 addSubview:self->_mainView];
  v19 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView amountStepperView];
  [v19 setAmount:self->_amount];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_2;
  v36[3] = &unk_1E59D70A8;
  objc_copyWeak(&v37, &location);
  v36[4] = self;
  [v19 setAmountChangedHandler:v36];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_3;
  v34[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v35, &location);
  [v19 setAmountTappedHandler:v34];
  v20 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView actionView];
  v21 = v20;
  if (self->_showSendAndRequest)
  {
    [v20 setLeadingAction:2];
    [v21 setTrailingAction:1];
  }
  if (self->_showSetupRecurringSend) {
    [v21 setCenterAction:7];
  }
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  v29 = __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_4;
  v30 = &unk_1E59D70F8;
  objc_copyWeak(&v33, &location);
  v31 = self;
  id v22 = v19;
  id v32 = v22;
  [v21 setActionHandler:&v27];
  [(PKPeerPaymentMessagesContentAmountEntryViewController *)self _registerForPresentationSemanticContextChanges];

  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);

  objc_destroyWeak(&location);
}

void __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke(id *a1, void *a2)
{
  id v6 = a2;
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained setMemo:v6];

  id v4 = objc_loadWeakRetained(a1);
  uint64_t v5 = [v4 delegate];

  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 memoDidChangeTo:v6];
  }
}

void __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAmount:v9];

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1040));
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1040));
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1040));
      [v8 amountDidChangeTo:v9];
    }
  }
}

void __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained appController];
  uint64_t v4 = [v3 presentationStyle];

  id v12 = objc_loadWeakRetained(v1);
  uint64_t v5 = [v12 appController];
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = [v5 presentationStyle];

    if (v7 != 1) {
      return;
    }
    id v8 = objc_loadWeakRetained(v1);
    id v9 = [v8 mainView];
    v10 = [v9 amountStepperView];
    [v10 validateNumberPadInput];

    id v12 = objc_loadWeakRetained(v1);
    uint64_t v5 = [v12 appController];
    id v6 = v5;
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 1;
  }
  [v5 requestPresentationStyle:v11];
}

void __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_4(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [v5 setActivityIndicatorVisible:1 forAction:a3];
  [v5 setEnabled:0];
  id v6 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v8 = [WeakRetained mainView];
  id v9 = [v8 amountStepperView];
  [v9 validateNumberPadInput];

  [a1[4] sendAnalyticsForAction:a3];
  [a1[5] setUsedKeypad:0];
  id v10 = objc_loadWeakRetained((id *)a1[4] + 130);
  if (v10
    && (uint64_t v11 = v10,
        id v12 = objc_loadWeakRetained((id *)a1[4] + 130),
        char v13 = objc_opt_respondsToSelector(),
        v12,
        v11,
        (v13 & 1) != 0))
  {
    id v14 = objc_loadWeakRetained((id *)a1[4] + 130);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_5;
    v22[3] = &unk_1E59D70D0;
    v15 = (id *)v23;
    v23[0] = v5;
    v23[1] = a3;
    id v16 = v5;
    [v14 handleAction:a3 completion:v22];
  }
  else
  {
    id v14 = objc_loadWeakRetained(a1 + 6);
    double v17 = [v14 appController];
    id v18 = objc_loadWeakRetained(v6);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_7;
    v20[3] = &unk_1E59D70D0;
    v15 = (id *)v21;
    v21[0] = v5;
    v21[1] = a3;
    id v19 = v5;
    [v17 handleAction:a3 sender:v18 completion:v20];
  }
}

void __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_5(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_6;
  v4[3] = &unk_1E59CB460;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) setActivityIndicatorVisible:0 forAction:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 setEnabled:1];
}

void __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_7(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_8;
  v4[3] = &unk_1E59CB460;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __68__PKPeerPaymentMessagesContentAmountEntryViewController_viewDidLoad__block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) setActivityIndicatorVisible:0 forAction:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 setEnabled:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  [(PKPeerPaymentMessagesContentBaseViewController *)&v5 viewWillAppear:a3];
  uint64_t v4 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self navigationItem];
  [v4 setBackButtonDisplayMode:2];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  [(PKPeerPaymentMessagesContentAmountEntryViewController *)&v4 viewDidAppear:a3];
  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView updateIsExpansionSupported];
  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView updateIsKeypadSupported];
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  [(PKPeerPaymentMessagesContentAmountEntryViewController *)&v6 viewWillLayoutSubviews];
  uint64_t v3 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self navigationController];
  objc_super v4 = [v3 navigationBar];
  [v4 frame];
  double Height = CGRectGetHeight(v7);

  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView setNavigationBarHeight:Height];
  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView updateIsExpansionSupported];
  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView updateIsKeypadSupported];
}

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentMessagesContentAmountEntryViewController;
  [(PKPeerPaymentMessagesContentAmountEntryViewController *)&v11 viewDidLayoutSubviews];
  uint64_t v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];

  if (v3)
  {
    objc_super v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
    [v4 _percentExpanded];
LABEL_3:
    double v6 = v5;

    goto LABEL_4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  double v6 = 1.0;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      objc_super v4 = objc_loadWeakRetained((id *)&self->_delegate);
      [v4 percentExpanded];
      goto LABEL_3;
    }
  }
LABEL_4:
  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView setPercentExpanded:v6];
}

- (void)reloadContent
{
  id v13 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self _currentBalance];
  uint64_t v3 = [v13 amount];
  objc_super v4 = [v13 currency];
  double v5 = PKFormattedCurrencyStringFromNumber();

  double v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentMes_34.isa, &stru_1EF1B4C70.isa, v5);
  CGRect v7 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView balanceLabel];
  [v7 setText:v6];

  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView updateIsExpansionSupported];
  [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView updateIsKeypadSupported];
  id v8 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView amountStepperView];
  id v9 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self _minimumTransferAmount];
  [v8 setMinAmount:v9];

  char v10 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView amountStepperView];
  objc_super v11 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self _maximumTransferAmount];
  [v10 setMaxAmount:v11];

  if ([MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode])
  {
    id v12 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView amountStepperView];
    [v12 becomeFirstResponder];
  }
}

- (void)_noteAmountChanged
{
  uint64_t v3 = [(PKCurrencyAmount *)self->_amount amount];
  objc_super v4 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self _minimumTransferAmount];
  if ([v3 compare:v4] == -1)
  {
    uint64_t v7 = 0;
  }
  else
  {
    double v5 = [(PKCurrencyAmount *)self->_amount amount];
    double v6 = [(PKPeerPaymentMessagesContentAmountEntryViewController *)self _maximumTransferAmount];
    if ([v5 compare:v6] == 1)
    {
      uint64_t v7 = 0;
    }
    else
    {
      id v8 = [(PKCurrencyAmount *)self->_amount amount];
      id v9 = [MEMORY[0x1E4F28C28] zero];
      uint64_t v7 = [v8 isEqualToNumber:v9] ^ 1;
    }
  }

  id v10 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView actionView];
  [v10 setEnabled:v7];
}

- (id)_minimumTransferAmount
{
  uint64_t v3 = [MEMORY[0x1E4F28C28] zero];
  objc_super v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];

  if (v4)
  {
    double v5 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  }
  else
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

    if (!WeakRetained) {
      goto LABEL_6;
    }
    double v5 = objc_loadWeakRetained((id *)p_delegate);
  }
  id v8 = v5;
  uint64_t v9 = [v5 minimumTransferAmount];

  uint64_t v3 = (void *)v9;
LABEL_6:

  return v3;
}

- (id)_maximumTransferAmount
{
  uint64_t v3 = [MEMORY[0x1E4F28C28] zero];
  objc_super v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];

  if (v4)
  {
    double v5 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  }
  else
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

    if (!WeakRetained) {
      goto LABEL_6;
    }
    double v5 = objc_loadWeakRetained((id *)p_delegate);
  }
  id v8 = v5;
  uint64_t v9 = [v5 maximumTransferAmount];

  uint64_t v3 = (void *)v9;
LABEL_6:

  return v3;
}

- (id)_currentBalance
{
  uint64_t v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];

  if (v3)
  {
    objc_super v4 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  }
  else
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

    if (!WeakRetained) {
      goto LABEL_6;
    }
    objc_super v4 = objc_loadWeakRetained((id *)p_delegate);
  }
  uint64_t v7 = v4;
  id WeakRetained = [v4 currentBalance];

LABEL_6:

  return WeakRetained;
}

- (void)sendAnalyticsForAction:(unint64_t)a3
{
  v34[6] = *MEMORY[0x1E4F143B8];
  double v5 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView amountStepperView];
  int v6 = [v5 usedKeypad];
  uint64_t v7 = (void *)MEMORY[0x1E4F85F08];
  if (!v6) {
    uint64_t v7 = (void *)MEMORY[0x1E4F85F10];
  }
  MEMORY[0x1A6220EC0](*v7, 0);
  if (a3 == 7)
  {
    uint64_t v9 = (id *)MEMORY[0x1E4F86A98];
LABEL_8:
    id v8 = *v9;
    goto LABEL_18;
  }
  if (a3 != 2)
  {
    id v8 = 0;
    if (a3 != 1) {
      goto LABEL_18;
    }
    uint64_t v9 = (id *)MEMORY[0x1E4F86A88];
    goto LABEL_8;
  }
  id v10 = [v5 amount];
  objc_super v11 = [v10 amount];

  id v12 = [v5 amount];
  id v13 = [v12 currency];

  if (v11) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v16 = PKAnalyticsAmountCategoryForAmount();
    [v15 setObject:v16 forKey:*MEMORY[0x1E4F86000]];

    [v15 setObject:v13 forKey:*MEMORY[0x1E4F86008]];
    unint64_t v17 = self->_sourceType - 1;
    if (v17 > 2) {
      id v18 = @"unknown";
    }
    else {
      id v18 = off_1E59D7370[v17];
    }
    [v15 setObject:v18 forKey:*MEMORY[0x1E4F86010]];
    PKAnalyticsSendEventWithDailyLimit();
  }
  id v8 = (id)*MEMORY[0x1E4F86A80];

LABEL_18:
  if ([v8 length])
  {
    id v19 = (id)*MEMORY[0x1E4F86A28];
    if (self->_sourceType == 2)
    {
      v20 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
      uint64_t v21 = [v20 presentationStyle];

      id v22 = (id *)MEMORY[0x1E4F86A18];
      if (v21 != 1) {
        id v22 = (id *)MEMORY[0x1E4F86A20];
      }
      id v23 = *v22;

      id v19 = v23;
    }
    v24 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v25 = *MEMORY[0x1E4F87000];
    uint64_t v26 = *MEMORY[0x1E4F869F0];
    uint64_t v27 = *MEMORY[0x1E4F86730];
    v33[0] = *MEMORY[0x1E4F864C8];
    v33[1] = v27;
    uint64_t v28 = *MEMORY[0x1E4F86990];
    v34[0] = v26;
    v34[1] = v28;
    uint64_t v29 = *MEMORY[0x1E4F86380];
    uint64_t v30 = *MEMORY[0x1E4F86120];
    v33[2] = *MEMORY[0x1E4F86308];
    v33[3] = v30;
    uint64_t v31 = *MEMORY[0x1E4F86A10];
    v33[4] = *MEMORY[0x1E4F86A60];
    v33[5] = v31;
    v34[2] = v29;
    v34[3] = v8;
    void v34[4] = *MEMORY[0x1E4F86A70];
    v34[5] = v19;
    id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:6];
    [v24 subject:v25 sendEvent:v32];
  }
}

- (void)_registerForPresentationSemanticContextChanges
{
  v9[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  uint64_t v3 = [(PKPeerPaymentMessagesContentBaseViewController *)self appController];
  v9[0] = objc_opt_class();
  objc_super v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __103__PKPeerPaymentMessagesContentAmountEntryViewController__registerForPresentationSemanticContextChanges__block_invoke;
  v6[3] = &unk_1E59D7120;
  objc_copyWeak(&v7, &location);
  id v5 = (id)[v3 registerForTraitChanges:v4 withHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __103__PKPeerPaymentMessagesContentAmountEntryViewController__registerForPresentationSemanticContextChanges__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)*((void *)WeakRetained + 129);
    int v6 = [v7 traitCollection];
    objc_msgSend(v5, "setPresentationContext:", objc_msgSend(v6, "_presentationSemanticContext"));
  }
}

- (void)setAmount:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_amount] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_amount, a3);
    id v5 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView amountStepperView];
    [v5 setAmount:v6];

    [(PKPeerPaymentMessagesContentAmountEntryViewController *)self _noteAmountChanged];
  }
}

- (void)setShowSendAndRequest:(BOOL)a3
{
  if (self->_showSendAndRequest != a3)
  {
    BOOL v3 = a3;
    self->_showSendAndRequest = a3;
    objc_super v4 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView actionView];
    id v6 = v4;
    if (v3) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 0;
    }
    [v4 setLeadingAction:v5];
    [v6 setTrailingAction:v3];
  }
}

- (void)setShowSetupRecurringSend:(BOOL)a3
{
  if (self->_showSetupRecurringSend != a3)
  {
    BOOL v3 = a3;
    self->_showSetupRecurringSend = a3;
    objc_super v4 = [(PKPeerPaymentMessagesContentAmountEntryView *)self->_mainView actionView];
    id v6 = v4;
    if (v3) {
      uint64_t v5 = 7;
    }
    else {
      uint64_t v5 = 0;
    }
    [v4 setCenterAction:v5];
  }
}

- ($85E40A55691FE2F31975A98F57E3065D)pkui_navigationStatusBarStyleDescriptor
{
  BOOL v2 = 1;
  int64_t v3 = 1;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (BOOL)pkui_navigationBarHidden
{
  return 1;
}

- (PKCurrencyAmount)amount
{
  return self->_amount;
}

- (NSString)memo
{
  return self->_memo;
}

- (void)setMemo:(id)a3
{
}

- (unint64_t)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(unint64_t)a3
{
  self->_sourceType = a3;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_unint64_t context = a3;
}

- (BOOL)showSendAndRequest
{
  return self->_showSendAndRequest;
}

- (BOOL)showSetupRecurringSend
{
  return self->_showSetupRecurringSend;
}

- (PKPeerPaymentMessagesContentAmountEntryView)mainView
{
  return self->_mainView;
}

- (PKPeerPaymentMessagesContentAmountEntryViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPeerPaymentMessagesContentAmountEntryViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mainView, 0);
  objc_storeStrong((id *)&self->_memo, 0);

  objc_storeStrong((id *)&self->_amount, 0);
}

@end