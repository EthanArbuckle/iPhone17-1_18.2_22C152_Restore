@interface PKPayLaterEnterAmountViewController
- (BOOL)_isCurrentAmountValid;
- (BOOL)_shouldShakeWithNewAmount:(id)a3;
- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5;
- (BOOL)shouldAllowDecimalInput;
- (NSDecimalNumber)maxAllowedAmount;
- (NSDecimalNumber)minAllowedAmount;
- (PKCurrencyAmount)currencyAmount;
- (PKPayLaterEnterAmountViewController)initWithPayLaterAccount:(id)a3;
- (id)headerSubtitle;
- (id)headerTitle;
- (id)keypadSuggestions;
- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4;
- (void)_calculateBlur;
- (void)_keyboardWillChange:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_setNavigationBarEnabled:(BOOL)a3;
- (void)_updateAmount:(id)a3;
- (void)_updateBarButtonEnabledState;
- (void)_updateLayoutForKeyboardAction:(id)a3;
- (void)dealloc;
- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3;
- (void)loadView;
- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)setAmountDetailsText:(id)a3;
- (void)setMaxAllowedAmount:(id)a3;
- (void)setMinAllowedAmount:(id)a3;
- (void)showNavigationBarSpinner:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPayLaterEnterAmountViewController

- (PKPayLaterEnterAmountViewController)initWithPayLaterAccount:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterEnterAmountViewController;
  v6 = [(PKPayLaterEnterAmountViewController *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_payLaterAccount, a3);
    uint64_t v8 = [MEMORY[0x1E4F28C28] zero];
    amount = v7->_amount;
    v7->_amount = (NSDecimalNumber *)v8;

    v10 = [v5 payLaterDetails];
    uint64_t v11 = [v10 currencyCode];
    currency = v7->_currency;
    v7->_currency = (NSString *)v11;

    CGPoint v13 = (CGPoint)*MEMORY[0x1E4F1DB20];
    CGSize v14 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v7->_lastKeyboardFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v7->_lastKeyboardFrame.size = v14;
    v7->_keyboardFrame.origin = v13;
    v7->_keyboardFrame.size = v14;
    id v15 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v16 = PKLocalizedPaymentString(&cfstr_Next.isa);
    v17 = (void *)[v15 initWithTitle:v16 style:0 target:v7 action:sel_nextButtonTapped];

    v18 = [(PKPayLaterEnterAmountViewController *)v7 navigationItem];
    [v18 setRightBarButtonItem:v17];

    [(PKPayLaterEnterAmountViewController *)v7 _updateBarButtonEnabledState];
  }

  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterEnterAmountViewController;
  [(PKPayLaterEnterAmountViewController *)&v4 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterEnterAmountViewController;
  [(PKPayLaterEnterAmountViewController *)&v6 viewWillAppear:a3];
  self->_visibility = 1;
  objc_super v4 = [(PKPayLaterEnterAmountViewController *)self currencyAmount];
  [(PKPayLaterEnterAmountViewController *)self currencyAmountUpdated:v4];

  id v5 = [(PKPayLaterEnterAmountViewController *)self view];
  [v5 setNeedsLayout];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterEnterAmountViewController;
  [(PKPayLaterEnterAmountViewController *)&v5 viewDidAppear:a3];
  self->_visibility = 2;
  objc_super v4 = [(PKPayLaterEnterAmountViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPayLaterEnterAmountViewController;
  [(PKPayLaterEnterAmountViewController *)&v5 viewWillDisappear:a3];
  self->_visibility = 3;
  objc_super v4 = [(PKPayLaterEnterAmountViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)loadView
{
  v43.receiver = self;
  v43.super_class = (Class)PKPayLaterEnterAmountViewController;
  [(PKPayLaterEnterAmountViewController *)&v43 loadView];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
  [v3 addObserver:self selector:sel__keyboardWillChange_ name:*MEMORY[0x1E4FB2C48] object:0];
  [v3 addObserver:self selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
  objc_super v4 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
  scrollView = self->_scrollView;
  self->_scrollView = v4;

  [(UIScrollView *)self->_scrollView setDelegate:self];
  objc_super v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v6;

  uint64_t v8 = self->_titleLabel;
  v9 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2980], (void *)*MEMORY[0x1E4FB2788], 2, 0);
  [(UILabel *)v8 setFont:v9];

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  [(UILabel *)self->_titleLabel setLineBreakMode:0];
  v10 = self->_titleLabel;
  uint64_t v11 = [(PKPayLaterEnterAmountViewController *)self headerTitle];
  [(UILabel *)v10 setText:v11];

  [(UILabel *)self->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v12;

  CGSize v14 = self->_subtitleLabel;
  id v15 = (NSString *)*MEMORY[0x1E4FB28C8];
  v16 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)v14 setFont:v16];

  [(UILabel *)self->_subtitleLabel setTextAlignment:1];
  [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
  [(UILabel *)self->_subtitleLabel setLineBreakMode:0];
  v17 = self->_subtitleLabel;
  v18 = [(PKPayLaterEnterAmountViewController *)self headerSubtitle];
  [(UILabel *)v17 setText:v18];

  [(UILabel *)self->_subtitleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
  v19 = [[PKEnterCurrencyAmountView alloc] initWithCurrency:self->_currency amount:self->_amount];
  enterAmountView = self->_enterAmountView;
  self->_enterAmountView = v19;

  if (PKUIGetMinScreenWidthType()) {
    double v21 = 57.0;
  }
  else {
    double v21 = 42.0;
  }
  double v22 = *MEMORY[0x1E4FB09D0];
  v23 = PKRoundedSystemFontOfSizeAndWeight(v21, *MEMORY[0x1E4FB09D0]);
  v24 = objc_msgSend(v23, "pk_fixedWidthFont");

  v25 = PKRoundedSystemFontOfSizeAndWeight(v21 * 0.5, v22);
  v26 = objc_msgSend(v25, "pk_fixedWidthFont");

  [(PKEnterCurrencyAmountView *)self->_enterAmountView setAmountFont:v24];
  [(PKEnterCurrencyAmountView *)self->_enterAmountView setCurrencySymbolFont:v26];
  [(PKEnterCurrencyAmountView *)self->_enterAmountView setCurrencySymbolFont:v26];
  [(PKEnterCurrencyAmountView *)self->_enterAmountView setKerning:&unk_1EF2B8890];
  [(PKEnterCurrencyAmountView *)self->_enterAmountView setIgnoreIntegralNumber:1];
  [(PKEnterCurrencyAmountView *)self->_enterAmountView setShowsDecimalPointButton:[(PKPayLaterEnterAmountViewController *)self shouldAllowDecimalInput]];
  [(PKEnterCurrencyAmountView *)self->_enterAmountView setDelegate:self];
  [(PKEnterCurrencyAmountView *)self->_enterAmountView showKeyboard];
  v27 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  amountDetailsLabel = self->_amountDetailsLabel;
  self->_amountDetailsLabel = v27;

  v29 = self->_amountDetailsLabel;
  v30 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)v29 setTextColor:v30];

  v31 = self->_amountDetailsLabel;
  v32 = PKFontForDefaultDesign(v15, (NSString *)*MEMORY[0x1E4FB2790]);
  [(UILabel *)v31 setFont:v32];

  [(UILabel *)self->_amountDetailsLabel setNumberOfLines:0];
  [(UILabel *)self->_amountDetailsLabel setTextAlignment:1];
  [(UILabel *)self->_amountDetailsLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];
  v33 = [(PKPayLaterEnterAmountViewController *)self keypadSuggestions];
  if ([v33 count])
  {
    v34 = [[PKNumberPadSuggestionsView alloc] initWithDefaultFrame];
    [(PKNumberPadSuggestionsView *)v34 setDelegate:self];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __47__PKPayLaterEnterAmountViewController_loadView__block_invoke;
    v41[3] = &unk_1E59CE078;
    id v42 = v33;
    [(PKNumberPadSuggestionsView *)v34 performBatchUpdates:v41];
    [(PKEnterCurrencyAmountView *)self->_enterAmountView setInputAccessoryView:v34];
  }
  v35 = [_PKVisibilityBackdropView alloc];
  v36 = -[_PKVisibilityBackdropView initWithFrame:privateStyle:](v35, "initWithFrame:privateStyle:", -2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  blurringView = self->_blurringView;
  self->_blurringView = v36;

  [(_PKVisibilityBackdropView *)self->_blurringView setDelegate:self];
  [(_PKVisibilityBackdropView *)self->_blurringView setUserInteractionEnabled:1];
  [(_PKVisibilityBackdropView *)self->_blurringView pkui_setVisibility:0 animated:0.0];
  v38 = [(PKPayLaterEnterAmountViewController *)self view];
  v39 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v38 setBackgroundColor:v39];

  [v38 addSubview:self->_scrollView];
  [v38 addSubview:self->_blurringView];
  [(UIScrollView *)self->_scrollView addSubview:self->_titleLabel];
  [(UIScrollView *)self->_scrollView addSubview:self->_subtitleLabel];
  [(UIScrollView *)self->_scrollView addSubview:self->_enterAmountView];
  [(UIScrollView *)self->_scrollView addSubview:self->_amountDetailsLabel];
  v40 = [(PKPayLaterEnterAmountViewController *)self view];
  [v40 setAccessibilityIdentifier:*MEMORY[0x1E4F854E8]];
}

void __47__PKPayLaterEnterAmountViewController_loadView__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a2;
  objc_super v4 = [v3 labelColor];
  [v6 setButtonTextColor:v4];

  objc_super v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v6 setButtonBackgroundColor:v5];

  [v6 setSuggestions:*(void *)(a1 + 32)];
}

- (void)viewWillLayoutSubviews
{
  v75.receiver = self;
  v75.super_class = (Class)PKPayLaterEnterAmountViewController;
  [(PKPayLaterEnterAmountViewController *)&v75 viewWillLayoutSubviews];
  v3 = [(PKPayLaterEnterAmountViewController *)self view];
  if ([(UIScrollView *)self->_scrollView isDragging])
  {
    if (CGRectIsNull(self->_lastSeenValidBounds))
    {
      [v3 bounds];
      double x = v4;
      double y = v6;
      double width = v8;
      double height = v10;
    }
    else
    {
      double x = self->_lastSeenValidBounds.origin.x;
      double y = self->_lastSeenValidBounds.origin.y;
      double width = self->_lastSeenValidBounds.size.width;
      double height = self->_lastSeenValidBounds.size.height;
    }
  }
  else
  {
    [v3 bounds];
    double x = v12;
    double y = v13;
    double width = v14;
    double height = v15;
    self->_lastSeenValidBounds.origin.double x = v12;
    self->_lastSeenValidBounds.origin.double y = v13;
    self->_lastSeenValidBounds.size.double width = v14;
    self->_lastSeenValidBounds.size.double height = v15;
  }
  [v3 safeAreaInsets];
  double v17 = v16;
  [(UIScrollView *)self->_scrollView frame];
  v78.origin.double x = v18;
  v78.origin.double y = v19;
  v78.size.double width = v20;
  v78.size.double height = v21;
  v76.origin.double x = x;
  v76.origin.double y = y;
  v76.size.double width = width;
  v76.size.double height = height;
  if (!CGRectEqualToRect(v76, v78)) {
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", x, y, width, height);
  }
  double v69 = v17;
  if (![(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])PKUIGetMinScreenWidthType(); {
  if (width >= 768.0)
  }
  {
    double v22 = [v3 readableContentGuide];
    [v22 layoutFrame];
  }
  PKSizeAlignedInRect();
  double v72 = y;
  *(double *)rect = x;
  double v71 = height;
  double v24 = v23;
  v25 = (double *)MEMORY[0x1E4F1DB28];
  double v26 = *MEMORY[0x1E4F1DB28];
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v23 + -11.0, 1.79769313e308);
  UIRectCenteredXInRect();
  double v70 = width;
  double v28 = v27;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  [(UILabel *)self->_subtitleLabel frame];
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v24, 1.79769313e308);
  double v29 = v26;
  UIRectCenteredXInRect();
  double v31 = v30;
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:");
  double v32 = v25[1];
  -[PKEnterCurrencyAmountView sizeThatFits:](self->_enterAmountView, "sizeThatFits:", v24, 1.79769313e308);
  UIRectCenteredXInRect();
  double v34 = v33;
  -[PKEnterCurrencyAmountView setFrame:](self->_enterAmountView, "setFrame:");
  double v35 = v28 + 0.0 + 15.0 + v31 + 35.0 + v34;
  -[UILabel sizeThatFits:](self->_amountDetailsLabel, "sizeThatFits:", v24, 1.79769313e308);
  if (v36 <= 0.0)
  {
    double v37 = v70;
    double v38 = v25[2];
    double v41 = v25[3];
  }
  else
  {
    double v35 = v35 + 10.0;
    double v37 = v70;
    UIRectCenteredXInRect();
    double v29 = v39;
    double v41 = v40;
    double v32 = v35;
  }
  -[UILabel setFrame:](self->_amountDetailsLabel, "setFrame:", v29, v32, v38, v41);
  if (PKUIGetMinScreenWidthType())
  {
    if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
    {
      double v42 = 19.0;
    }
    else
    {
      double v42 = 24.0;
    }
  }
  else
  {
    double v42 = 19.0;
  }
  double v43 = v37;
  double v68 = v35;
  if (PKViewVisibilityStateIsVisible())
  {
    CGFloat v44 = *MEMORY[0x1E4F1DB20];
    double v45 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v47 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v46 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    double v48 = v41;
    if (!CGRectIsNull(self->_keyboardFrame))
    {
      v49 = [v3 window];
      v50 = v49;
      if (v49)
      {
        objc_msgSend(v49, "convertRect:fromWindow:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
        objc_msgSend(v3, "convertRect:fromView:", 0);
        CGFloat v44 = v51;
        double v45 = v52;
        CGFloat v47 = v53;
        CGFloat v46 = v54;
      }
    }
  }
  else
  {
    double v48 = v41;
    CGFloat v44 = self->_lastKeyboardFrame.origin.x;
    double v45 = self->_lastKeyboardFrame.origin.y;
    CGFloat v47 = self->_lastKeyboardFrame.size.width;
    CGFloat v46 = self->_lastKeyboardFrame.size.height;
  }
  v77.origin.double x = v44;
  v77.origin.double y = v45;
  v77.size.double width = v47;
  v77.size.double height = v46;
  BOOL IsNull = CGRectIsNull(v77);
  double v57 = v71;
  double v56 = v72;
  double v58 = v42 + fmax(v71 + v72 - v45 - v69, 0.0);
  if (IsNull) {
    double v58 = v42;
  }
  self->_lastKeyboardFrame.origin.double x = v44;
  self->_lastKeyboardFrame.origin.double y = v45;
  self->_lastKeyboardFrame.size.double width = v47;
  self->_lastKeyboardFrame.size.double height = v46;
  CGFloat v59 = v69 + v58;
  uint64_t v60 = rect[0];
  *(void *)&remainder.origin.double x = rect[0];
  remainder.origin.double y = v72;
  remainder.size.double width = v43;
  remainder.size.double height = v71;
  memset(&rect[1], 0, 32);
  double v61 = v43;
  CGRectDivide(*(CGRect *)(&v56 - 1), (CGRect *)&rect[1], &remainder, v59, CGRectMaxYEdge);
  -[_PKVisibilityBackdropView setFrame:](self->_blurringView, "setFrame:", *(double *)&rect[1], *(double *)&rect[2], *(double *)&rect[3], *(double *)&rect[4]);
  [(_PKVisibilityBackdropView *)self->_blurringView layoutIfNeeded];
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v43, v48 + v68);
  [(UIScrollView *)self->_scrollView contentInset];
  double v63 = v62;
  double v65 = v64;
  double v67 = v66;
  -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:");
  -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:", v63, v65, v59 - v69, v67);
  [(PKPayLaterEnterAmountViewController *)self _calculateBlur];
}

- (id)headerTitle
{
  return 0;
}

- (id)headerSubtitle
{
  return 0;
}

- (id)keypadSuggestions
{
  return 0;
}

- (PKCurrencyAmount)currencyAmount
{
  return (PKCurrencyAmount *)PKCurrencyAmountMake();
}

- (void)setAmountDetailsText:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UILabel *)self->_amountDetailsLabel text];
  id v10 = v4;
  id v6 = v5;
  if (v6 == v10)
  {

    v9 = v10;
LABEL_9:

    double v8 = v10;
    goto LABEL_10;
  }
  if (!v10 || !v6)
  {

    double v8 = v10;
    goto LABEL_8;
  }
  char v7 = [v10 isEqualToString:v6];

  double v8 = v10;
  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(UILabel *)self->_amountDetailsLabel setText:v8];
    v9 = [(PKPayLaterEnterAmountViewController *)self view];
    [v9 setNeedsLayout];
    goto LABEL_9;
  }
LABEL_10:
}

- (BOOL)shouldAllowDecimalInput
{
  return 1;
}

- (void)showNavigationBarSpinner:(BOOL)a3
{
  if (self->_showingSpinner != a3)
  {
    self->_showingSpinner = a3;
    BOOL v4 = !a3;
    objc_super v5 = [(PKPayLaterEnterAmountViewController *)self navigationController];
    id v6 = [v5 view];
    char v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(PKPayLaterEnterAmountViewController *)self view];
    }
    id v18 = v8;

    [v18 setUserInteractionEnabled:v4];
    v9 = [(PKPayLaterEnterAmountViewController *)self navigationItem];
    id v10 = v9;
    if (self->_showingSpinner)
    {
      self->_BOOL wasBackHidden = [v9 hidesBackButton];
      uint64_t v11 = [v10 rightBarButtonItem];
      hiddenRightBarButtonItem = self->_hiddenRightBarButtonItem;
      self->_hiddenRightBarButtonItem = v11;

      if (!self->_spinningItem)
      {
        CGFloat v14 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
        activityIndicatorView = self->_activityIndicatorView;
        self->_activityIndicatorView = v14;

        double v16 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:self->_activityIndicatorView];
        spinningItem = self->_spinningItem;
        self->_spinningItem = v16;
      }
      [(UIActivityIndicatorView *)self->_activityIndicatorView startAnimating];
      [v10 setRightBarButtonItem:self->_spinningItem];
      BOOL wasBackHidden = 1;
    }
    else
    {
      [(UIActivityIndicatorView *)self->_activityIndicatorView stopAnimating];
      [v10 setRightBarButtonItem:self->_hiddenRightBarButtonItem];
      BOOL wasBackHidden = self->_wasBackHidden;
    }
    [v10 setHidesBackButton:wasBackHidden];
    [(PKPayLaterEnterAmountViewController *)self _setNavigationBarEnabled:v4];
    [v18 setNeedsLayout];
  }
}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(PKPayLaterEnterAmountViewController *)self navigationController];
  objc_super v5 = [v10 navigationBar];
  [v5 setUserInteractionEnabled:v3];

  id v6 = [v10 interactivePopGestureRecognizer];
  [v6 setEnabled:v3];

  char v7 = [(PKPayLaterEnterAmountViewController *)self navigationItem];
  id v8 = [v7 leftBarButtonItem];
  [v8 setEnabled:v3];

  v9 = [v7 rightBarButtonItem];
  [v9 setEnabled:v3];
}

- (void)numberPadSuggestionsView:(id)a3 didSelectSuggestion:(id)a4
{
  objc_msgSend(a4, "value", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(PKEnterCurrencyAmountView *)self->_enterAmountView setCurrentAmount:v5];
  [(PKPayLaterEnterAmountViewController *)self _updateAmount:v5];
}

- (void)_updateAmount:(id)a3
{
  objc_storeStrong((id *)&self->_amount, a3);
  BOOL v4 = [(PKPayLaterEnterAmountViewController *)self currencyAmount];
  [(PKPayLaterEnterAmountViewController *)self currencyAmountUpdated:v4];

  [(PKPayLaterEnterAmountViewController *)self _updateBarButtonEnabledState];
}

- (void)_updateBarButtonEnabledState
{
  BOOL v3 = [(PKPayLaterEnterAmountViewController *)self navigationItem];
  id v4 = [v3 rightBarButtonItem];

  objc_msgSend(v4, "setEnabled:", -[PKPayLaterEnterAmountViewController _isCurrentAmountValid](self, "_isCurrentAmountValid"));
}

- (BOOL)_isCurrentAmountValid
{
  amount = self->_amount;
  if (!amount
    || ([(NSDecimalNumber *)amount pk_isNotANumber] & 1) != 0
    || ([(NSDecimalNumber *)self->_amount pk_isZeroNumber] & 1) != 0)
  {
    return 0;
  }
  id v6 = [(PKPayLaterEnterAmountViewController *)self minAllowedAmount];
  char v7 = [(PKPayLaterEnterAmountViewController *)self maxAllowedAmount];
  BOOL v4 = (!v6 || [(NSDecimalNumber *)self->_amount compare:v6] != NSOrderedAscending)
    && (!v7 || [(NSDecimalNumber *)self->_amount compare:v7] != NSOrderedDescending);

  return v4;
}

- (BOOL)enterCurrencyAmountView:(id)a3 shouldChangeAmountFrom:(id)a4 to:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([(PKPayLaterEnterAmountViewController *)self _shouldShakeWithNewAmount:v8]) {
    objc_msgSend(v7, "pkui_smallShakeWithCompletion:", 0);
  }
  v9 = self->_amount;
  id v10 = [(PKPayLaterEnterAmountViewController *)self minAllowedAmount];
  uint64_t v11 = [(PKPayLaterEnterAmountViewController *)self maxAllowedAmount];
  BOOL v12 = (!v10
      || [v8 compare:v10] != -1
      || [(NSDecimalNumber *)v9 compare:v10] == NSOrderedAscending
      || [(NSDecimalNumber *)v9 compare:v8] != NSOrderedAscending)
     && (!v11
      || [v8 compare:v11] != 1
      || [(NSDecimalNumber *)v9 compare:v11] != NSOrderedDescending);

  return v12;
}

- (BOOL)_shouldShakeWithNewAmount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_amount)
  {
    if (v4 && (objc_msgSend(v4, "pk_isNotANumber") & 1) == 0)
    {
      id v7 = self->_amount;
      id v8 = [(PKPayLaterEnterAmountViewController *)self minAllowedAmount];
      v9 = [(PKPayLaterEnterAmountViewController *)self maxAllowedAmount];
      BOOL v6 = v8
        && [v5 compare:v8] == -1
        && [(NSDecimalNumber *)v7 compare:v8] != NSOrderedAscending
        || v9 && [v5 compare:v9] == 1;
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)enterCurrencyAmountViewDidChangeAmount:(id)a3
{
  id v4 = [a3 currentAmount];
  [(PKPayLaterEnterAmountViewController *)self _updateAmount:v4];
}

- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4
{
  if (objc_msgSend(a4, "userInterfaceStyle", a3) == 2) {
    return 2030;
  }
  else {
    return 2010;
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(PKPayLaterEnterAmountViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)_keyboardWillShow:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PKPayLaterEnterAmountViewController__keyboardWillShow___block_invoke;
  v7[3] = &unk_1E59CADB8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PKPayLaterEnterAmountViewController *)self _updateLayoutForKeyboardAction:v7];
}

BOOL __57__PKPayLaterEnterAmountViewController__keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  CGFloat v3 = *(double *)(v2 + 1080);
  CGFloat v4 = *(double *)(v2 + 1088);
  CGFloat v5 = *(double *)(v2 + 1096);
  CGFloat v6 = *(double *)(v2 + 1104);
  *(unsigned char *)(v2 + 1074) = 1;
  uint64_t v8 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  v9 = (void *)(v8 + 1080);
  if (v7)
  {
    [v7 CGRectValue];
    void *v9 = v10;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v13;
  }
  else
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)v9 = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v8 + 1096) = v14;
  }
  v16.origin.double x = v3;
  v16.origin.double y = v4;
  v16.size.double width = v5;
  v16.size.double height = v6;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1080), v16);
}

- (void)_keyboardWillChange:(id)a3
{
  if (self->_keyboardVisible)
  {
    CGFloat v4 = [a3 userInfo];
    CGFloat v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __59__PKPayLaterEnterAmountViewController__keyboardWillChange___block_invoke;
      v6[3] = &unk_1E59CADB8;
      v6[4] = self;
      id v7 = v5;
      [(PKPayLaterEnterAmountViewController *)self _updateLayoutForKeyboardAction:v6];
    }
  }
}

BOOL __59__PKPayLaterEnterAmountViewController__keyboardWillChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  CGFloat v3 = v2 + 135;
  CGFloat v4 = *((double *)v2 + 135);
  CGFloat v5 = *((double *)v2 + 136);
  CGFloat v6 = *((double *)v2 + 137);
  CGFloat v7 = *((double *)v2 + 138);
  [*(id *)(a1 + 40) CGRectValue];
  void *v3 = v8;
  v3[1] = v9;
  v3[2] = v10;
  v3[3] = v11;
  v13.origin.double x = v4;
  v13.origin.double y = v5;
  v13.size.double width = v6;
  v13.size.double height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1080), v13);
}

- (void)_keyboardWillHide:(id)a3
{
  if (self->_keyboardVisible)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __57__PKPayLaterEnterAmountViewController__keyboardWillHide___block_invoke;
    v3[3] = &unk_1E59CADE0;
    v3[4] = self;
    [(PKPayLaterEnterAmountViewController *)self _updateLayoutForKeyboardAction:v3];
  }
}

BOOL __57__PKPayLaterEnterAmountViewController__keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CGRect v8 = *(CGRect *)(v1 + 1080);
  *(unsigned char *)(v1 + 1074) = 0;
  uint64_t v2 = (_OWORD *)(*(void *)(a1 + 32) + 1080);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *uint64_t v2 = *MEMORY[0x1E4F1DB20];
  v2[1] = v3;
  *(void *)&long long v3 = *(void *)(*(void *)(a1 + 32) + 1080);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 1088);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 1096);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 1104);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  if (a3)
  {
    uint64_t v4 = (uint64_t (**)(void))a3;
    id v7 = [(PKPayLaterEnterAmountViewController *)self viewIfLoaded];
    int v5 = v4[2](v4);

    uint64_t v6 = v7;
    if (v7 && v5)
    {
      [v7 setNeedsLayout];
      uint64_t v6 = v7;
    }
  }
}

- (void)_calculateBlur
{
  scrollView = self->_scrollView;
  [(_PKVisibilityBackdropView *)self->_blurringView bounds];
  -[UIScrollView convertRect:fromView:](scrollView, "convertRect:fromView:", self->_blurringView);
  double v5 = v4;
  [(UIScrollView *)self->_scrollView bounds];
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  [(UIScrollView *)self->_scrollView contentSize];
  v18.size.double height = fmin(v13, v14 - v9);
  v18.origin.double x = v7;
  v18.origin.double y = v9;
  v18.size.double width = v11;
  double v15 = fmin(fmax(CGRectGetMaxY(v18) - v5, 0.0), 30.0) / 30.0;
  blurringView = self->_blurringView;

  [(_PKVisibilityBackdropView *)blurringView pkui_setVisibility:0 animated:v15];
}

- (NSDecimalNumber)minAllowedAmount
{
  return self->_minAllowedAmount;
}

- (void)setMinAllowedAmount:(id)a3
{
}

- (NSDecimalNumber)maxAllowedAmount
{
  return self->_maxAllowedAmount;
}

- (void)setMaxAllowedAmount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxAllowedAmount, 0);
  objc_storeStrong((id *)&self->_minAllowedAmount, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_hiddenRightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_spinningItem, 0);
  objc_storeStrong((id *)&self->_blurringView, 0);
  objc_storeStrong((id *)&self->_amountDetailsLabel, 0);
  objc_storeStrong((id *)&self->_enterAmountView, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_payLaterAccount, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end