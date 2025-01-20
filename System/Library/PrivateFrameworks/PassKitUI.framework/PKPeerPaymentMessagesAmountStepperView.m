@interface PKPeerPaymentMessagesAmountStepperView
+ (CGSize)referenceSizeForSizeCategory:(unint64_t)a3;
+ (CGSize)sizeThatFits:(CGSize)a3 forSizeCategory:(unint64_t)a4;
+ (double)_amountLabelFontSizeForSizeCategory:(unint64_t)a3;
+ (id)_amountLabelFontForSizeCategory:(unint64_t)a3;
- (BOOL)canBecomeFirstResponder;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)usedKeypad;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDecimalNumber)maxAmount;
- (NSDecimalNumber)minAmount;
- (PKCurrencyAmount)amount;
- (PKPeerPaymentMessagesAmountStepperView)initWithSizeCategory:(unint64_t)a3;
- (id)_amountLabelFont;
- (id)_decimalNumberFromPosixString:(id)a3;
- (id)_posixFormatter;
- (id)_posixLocale;
- (id)_posixStringFromDecimalNumber:(id)a3;
- (id)_stringForAction:(unint64_t)a3;
- (id)_updatePosixString:(id)a3 withAction:(unint64_t)a4 maxDigits:(unint64_t)a5 maxDecimalPlaces:(unint64_t)a6;
- (id)amountChangedHandler;
- (id)amountTappedHandler;
- (unint64_t)style;
- (void)_cleanupPosixString;
- (void)_decrementAmount;
- (void)_handleLongPress:(id)a3;
- (void)_handleTap:(id)a3;
- (void)_incrementAmount;
- (void)_shakeAmountLabel;
- (void)_updateContent;
- (void)dealloc;
- (void)handleNumberPadAction:(unint64_t)a3;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setAmount:(id)a3;
- (void)setAmountChangedHandler:(id)a3;
- (void)setAmountTappedHandler:(id)a3;
- (void)setMaxAmount:(id)a3;
- (void)setMinAmount:(id)a3;
- (void)setPlusMinusVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setSizeCategory:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setUsedKeypad:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)validateNumberPadInput;
@end

@implementation PKPeerPaymentMessagesAmountStepperView

+ (CGSize)referenceSizeForSizeCategory:(unint64_t)a3
{
  objc_msgSend(a1, "sizeThatFits:forSizeCategory:", a3, 300.0, 0.0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (PKPeerPaymentMessagesAmountStepperView)initWithSizeCategory:(unint64_t)a3
{
  v72[1] = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() referenceSizeForSizeCategory:a3];
  double v5 = v4;
  double v7 = v6;
  double v8 = *MEMORY[0x1E4F1DAD8];
  double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v68.receiver = self;
  v68.super_class = (Class)PKPeerPaymentMessagesAmountStepperView;
  v10 = -[PKPeerPaymentMessagesAmountStepperView initWithFrame:](&v68, sel_initWithFrame_, v8, v9, v5, v7);
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x1E4F28C28] zero];
    minAmount = v10->_minAmount;
    v10->_minAmount = (NSDecimalNumber *)v11;

    amountCurrency = v10->_amountCurrency;
    v10->_amountCurrency = (NSString *)@"USD";

    v14 = [(PKPeerPaymentMessagesAmountStepperView *)v10 traitCollection];
    v15 = [v14 preferredContentSizeCategory];
    v10->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v15, (UIContentSizeCategory)*MEMORY[0x1E4FB2790]) == NSOrderedDescending;

    v16 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKPeerPaymentMessagesAmountStepperView *)v10 setBackgroundColor:v16];

    id v17 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(PKPeerPaymentMessagesAmountStepperView *)v10 bounds];
    uint64_t v18 = objc_msgSend(v17, "initWithFrame:");
    centerView = v10->_centerView;
    v10->_centerView = (UIView *)v18;

    v20 = v10->_centerView;
    v21 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v20 setBackgroundColor:v21];

    [(PKPeerPaymentMessagesAmountStepperView *)v10 addSubview:v10->_centerView];
    id v22 = objc_alloc(MEMORY[0x1E4F39BC0]);
    v23 = (void *)[v22 initWithType:*MEMORY[0x1E4F3A0D0]];
    [v23 setName:@"gaussianBlur"];
    id v24 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PKPeerPaymentMessagesAmountStepperView *)v10 bounds];
    uint64_t v25 = objc_msgSend(v24, "initWithFrame:");
    compactAmountLabel = v10->_compactAmountLabel;
    v10->_compactAmountLabel = (UILabel *)v25;

    v27 = v10->_compactAmountLabel;
    v28 = [(PKPeerPaymentMessagesAmountStepperView *)v10 _amountLabelFont];
    [(UILabel *)v27 setFont:v28];

    v29 = v10->_compactAmountLabel;
    v30 = +[PKPeerPaymentTheme primaryTextColor];
    [(UILabel *)v29 setTextColor:v30];

    [(UILabel *)v10->_compactAmountLabel setTextAlignment:1];
    [(UILabel *)v10->_compactAmountLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v10->_compactAmountLabel setAccessibilityIdentifier:@"AppleCash.Amount.Label"];
    v31 = [(UILabel *)v10->_compactAmountLabel layer];
    v72[0] = v23;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];
    [v31 setFilters:v32];

    [(UIView *)v10->_centerView addSubview:v10->_compactAmountLabel];
    id v33 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PKPeerPaymentMessagesAmountStepperView *)v10 bounds];
    uint64_t v34 = objc_msgSend(v33, "initWithFrame:");
    amountLabel = v10->_amountLabel;
    v10->_amountLabel = (UILabel *)v34;

    v36 = v10->_amountLabel;
    v37 = [(PKPeerPaymentMessagesAmountStepperView *)v10 _amountLabelFont];
    [(UILabel *)v36 setFont:v37];

    v38 = v10->_amountLabel;
    v39 = +[PKPeerPaymentTheme primaryTextColor];
    [(UILabel *)v38 setTextColor:v39];

    [(UILabel *)v10->_amountLabel setTextAlignment:1];
    [(UILabel *)v10->_amountLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v10->_amountLabel setAccessibilityIdentifier:@"AppleCash.Amount.Label"];
    v40 = [(UILabel *)v10->_amountLabel layer];
    v71 = v23;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
    [v40 setFilters:v41];

    [(PKPeerPaymentMessagesAmountStepperView *)v10 addSubview:v10->_amountLabel];
    v42 = [PKPeerPaymentMessagesRoundedButton alloc];
    [(PKPeerPaymentMessagesAmountStepperView *)v10 bounds];
    uint64_t v43 = -[PKPeerPaymentMessagesRoundedButton initWithFrame:](v42, "initWithFrame:");
    plusButton = v10->_plusButton;
    v10->_plusButton = (PKPeerPaymentMessagesRoundedButton *)v43;

    [(PKPeerPaymentMessagesRoundedButton *)v10->_plusButton addTarget:v10 action:sel__incrementAmount forControlEvents:64];
    v45 = v10->_plusButton;
    v46 = (void *)MEMORY[0x1E4FB1818];
    v47 = [MEMORY[0x1E4FB1830] configurationWithPointSize:26.0];
    v48 = [v46 systemImageNamed:@"plus" withConfiguration:v47];
    [(PKPeerPaymentMessagesRoundedButton *)v45 setImage:v48 forState:0];

    v49 = v10->_plusButton;
    v50 = +[PKPeerPaymentTheme primaryTextColor];
    [(PKPeerPaymentMessagesRoundedButton *)v49 setTintColor:v50];

    [(PKPeerPaymentMessagesRoundedButton *)v10->_plusButton setAccessibilityIdentifier:*MEMORY[0x1E4F851C8]];
    [(PKPeerPaymentMessagesAmountStepperView *)v10 addSubview:v10->_plusButton];
    v51 = [PKPeerPaymentMessagesRoundedButton alloc];
    [(PKPeerPaymentMessagesAmountStepperView *)v10 bounds];
    uint64_t v52 = -[PKPeerPaymentMessagesRoundedButton initWithFrame:](v51, "initWithFrame:");
    minusButton = v10->_minusButton;
    v10->_minusButton = (PKPeerPaymentMessagesRoundedButton *)v52;

    [(PKPeerPaymentMessagesRoundedButton *)v10->_minusButton addTarget:v10 action:sel__decrementAmount forControlEvents:64];
    v54 = v10->_minusButton;
    v55 = (void *)MEMORY[0x1E4FB1818];
    v56 = [MEMORY[0x1E4FB1830] configurationWithPointSize:26.0];
    v57 = [v55 systemImageNamed:@"minus" withConfiguration:v56];
    [(PKPeerPaymentMessagesRoundedButton *)v54 setImage:v57 forState:0];

    v58 = v10->_minusButton;
    v59 = +[PKPeerPaymentTheme primaryTextColor];
    [(PKPeerPaymentMessagesRoundedButton *)v58 setTintColor:v59];

    [(PKPeerPaymentMessagesRoundedButton *)v10->_minusButton setAccessibilityIdentifier:*MEMORY[0x1E4F858F0]];
    [(PKPeerPaymentMessagesAmountStepperView *)v10 addSubview:v10->_minusButton];
    v60 = [(PKPeerPaymentMessagesRoundedButton *)v10->_plusButton layer];
    v70 = v23;
    v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
    [v60 setFilters:v61];

    v62 = [(PKPeerPaymentMessagesRoundedButton *)v10->_minusButton layer];
    v69 = v23;
    v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
    [v62 setFilters:v63];

    [(PKPeerPaymentMessagesAmountStepperView *)v10 setPlusMinusVisible:1 animated:0];
    uint64_t v64 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v10 action:sel__handleTap_];
    tapGestureRecognizer = v10->_tapGestureRecognizer;
    v10->_tapGestureRecognizer = (UITapGestureRecognizer *)v64;

    [(UITapGestureRecognizer *)v10->_tapGestureRecognizer setDelegate:v10];
    [(PKPeerPaymentMessagesAmountStepperView *)v10 addGestureRecognizer:v10->_tapGestureRecognizer];
    v66 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v10 action:sel__handleLongPress_];
    [v66 setMinimumPressDuration:0.2];
    [(PKPeerPaymentMessagesAmountStepperView *)v10 addGestureRecognizer:v66];
  }
  return v10;
}

- (void)dealloc
{
  longPressTimer = self->_longPressTimer;
  if (longPressTimer)
  {
    if (self->_longPressTimerSuspended)
    {
      dispatch_resume(longPressTimer);
      longPressTimer = self->_longPressTimer;
    }
    dispatch_source_cancel(longPressTimer);
    double v4 = self->_longPressTimer;
    self->_longPressTimer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentMessagesAmountStepperView;
  [(PKPeerPaymentMessagesAmountStepperView *)&v5 dealloc];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  +[PKPeerPaymentMessagesAmountStepperView sizeThatFits:forSizeCategory:](PKPeerPaymentMessagesAmountStepperView, "sizeThatFits:forSizeCategory:", self->_sizeCategory, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)sizeThatFits:(CGSize)a3 forSizeCategory:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [a1 _amountLabelFontForSizeCategory:a4];
  double v7 = objc_msgSend(MEMORY[0x1E4F28B18], "pkui_attriutedStringWithString:font:paragraphStyle:", @"$", v6, 0);
  objc_msgSend(v7, "pkui_sizeThatFits:", width, height);
  *(double *)&uint64_t v8 = 50.0;
  if (v9 > 50.0)
  {
    objc_msgSend(v7, "pkui_sizeThatFits:", width, height);
    uint64_t v8 = v10;
  }

  double v11 = width;
  double v12 = *(double *)&v8;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)PKPeerPaymentMessagesAmountStepperView;
  [(PKPeerPaymentMessagesAmountStepperView *)&v24 layoutSubviews];
  [(PKPeerPaymentMessagesAmountStepperView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UILabel setFrame:](self->_amountLabel, "setFrame:");
  int v11 = PKIsPad();
  v25.origin.CGFloat x = v4;
  v25.origin.CGFloat y = v6;
  v25.size.CGFloat width = v8;
  v25.size.double height = v10;
  double Height = CGRectGetHeight(v25);
  if (Height >= 50.0) {
    double v13 = 50.0;
  }
  else {
    double v13 = Height;
  }
  if (v11) {
    double v14 = 0.0;
  }
  else {
    double v14 = 44.0;
  }
  v26.origin.CGFloat x = v4;
  v26.origin.CGFloat y = v6;
  v26.size.CGFloat width = v8;
  v26.size.double height = v10;
  CGRect remainder = CGRectInset(v26, v14, 0.0);
  memset(&slice, 0, sizeof(slice));
  memset(&v21, 0, sizeof(v21));
  CGRectDivide(remainder, &slice, &remainder, v13, CGRectMinXEdge);
  CGRectDivide(remainder, &v21, &remainder, v13, CGRectMaxXEdge);
  -[UIView setFrame:](self->_centerView, "setFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
  [(UIView *)self->_centerView bounds];
  CGRect v28 = CGRectInset(v27, 6.0, 0.0);
  CGFloat x = v28.origin.x;
  CGFloat y = v28.origin.y;
  CGFloat width = v28.size.width;
  CGFloat v18 = v28.size.height;
  -[UILabel setFrame:](self->_compactAmountLabel, "setFrame:");
  double MinX = CGRectGetMinX(slice);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.double height = v18;
  -[PKPeerPaymentMessagesRoundedButton setFrame:](self->_minusButton, "setFrame:", MinX, CGRectGetMidY(v29) - v13 * 0.5, v13, v13);
  double v20 = CGRectGetMinX(v21);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.double height = v18;
  -[PKPeerPaymentMessagesRoundedButton setFrame:](self->_plusButton, "setFrame:", v20, CGRectGetMidY(v30) - v13 * 0.5, v13, v13);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentMessagesAmountStepperView;
  id v4 = a3;
  [(PKPeerPaymentMessagesAmountStepperView *)&v8 traitCollectionDidChange:v4];
  double v5 = [(PKPeerPaymentMessagesAmountStepperView *)self traitCollection];
  CGFloat v6 = [v5 preferredContentSizeCategory];

  double v7 = [v4 preferredContentSizeCategory];

  LOBYTE(v4) = [v7 isEqualToString:v6];
  if ((v4 & 1) == 0)
  {
    self->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v6, (UIContentSizeCategory)*MEMORY[0x1E4FB2790]) == NSOrderedDescending;
    [(PKPeerPaymentMessagesAmountStepperView *)self setNeedsLayout];
  }
}

- (void)handleNumberPadAction:(unint64_t)a3
{
  self->_usedKeypad = 1;
  if (self->_nextNumberPadActionCausesReset)
  {
    self->_nextNumberPadActionCausesReset = 0;
    char v5 = [(NSString *)self->_amountString pk_posixStringHasPeriod];
    if (a3 - 10 >= 3 && (v5 & 1) == 0)
    {
      amountString = self->_amountString;
      self->_amountString = (NSString *)&stru_1EF1B5B50;
    }
  }
  if (self->_maxAmount)
  {
    double v7 = -[PKPeerPaymentMessagesAmountStepperView _posixStringFromDecimalNumber:](self, "_posixStringFromDecimalNumber:");
    uint64_t v8 = [v7 length];
  }
  else
  {
    uint64_t v8 = 5;
  }
  id v16 = [(PKPeerPaymentMessagesAmountStepperView *)self _updatePosixString:self->_amountString withAction:a3 maxDigits:v8 maxDecimalPlaces:[(NSNumberFormatter *)self->_currencyFormatter maximumFractionDigits]];
  objc_storeStrong((id *)&self->_amountString, v16);
  [(PKPeerPaymentMessagesAmountStepperView *)self _updateContent];
  double v9 = [(PKPeerPaymentMessagesAmountStepperView *)self amount];
  amountChangedHandler = (void (**)(id, void *))self->_amountChangedHandler;
  if (amountChangedHandler) {
    amountChangedHandler[2](amountChangedHandler, v9);
  }
  int v11 = [v9 amount];
  if (v11)
  {
    minAmount = self->_minAmount;
    if (minAmount)
    {
      uint64_t v13 = [(NSDecimalNumber *)minAmount compare:v11];
      if (!self->_maxAmount || v13 == 1)
      {
LABEL_17:
        if (v13 == 1)
        {
          double v14 = [MEMORY[0x1E4F28C28] zero];
          char v15 = [v11 isEqualToNumber:v14];

          if ((v15 & 1) == 0) {
            [(PKPeerPaymentMessagesAmountStepperView *)self _shakeAmountLabel];
          }
        }
        goto LABEL_20;
      }
    }
    else if (!self->_maxAmount)
    {
      goto LABEL_20;
    }
    uint64_t v13 = objc_msgSend(v11, "compare:");
    goto LABEL_17;
  }
LABEL_20:
}

- (void)validateNumberPadInput
{
  [(PKPeerPaymentMessagesAmountStepperView *)self _cleanupPosixString];

  [(PKPeerPaymentMessagesAmountStepperView *)self _updateContent];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentMessagesAmountStepperView;
  [(PKPeerPaymentMessagesAmountStepperView *)&v4 pressesBegan:a3 withEvent:a4];
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentMessagesAmountStepperView;
  [(PKPeerPaymentMessagesAmountStepperView *)&v4 pressesChanged:a3 withEvent:a4];
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PKPeerPaymentMessagesAmountStepperView;
  [(PKPeerPaymentMessagesAmountStepperView *)&v4 pressesCancelled:a3 withEvent:a4];
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v8)
  {
LABEL_41:
    v19.receiver = self;
    v19.super_class = (Class)PKPeerPaymentMessagesAmountStepperView;
    [(PKPeerPaymentMessagesAmountStepperView *)&v19 pressesEnded:v6 withEvent:v7];
    goto LABEL_42;
  }
  uint64_t v9 = v8;
  id v18 = v7;
  char v10 = 0;
  uint64_t v11 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v6);
      }
      uint64_t v13 = [*(id *)(*((void *)&v20 + 1) + 8 * i) key];
      double v14 = v13;
      if (v13)
      {
        char v15 = [v13 characters];
        if ([v15 isEqualToString:@"1"])
        {
          uint64_t v16 = 1;
          goto LABEL_31;
        }
        if ([v15 isEqualToString:@"2"])
        {
          uint64_t v16 = 2;
          goto LABEL_31;
        }
        if ([v15 isEqualToString:@"3"])
        {
          uint64_t v16 = 3;
          goto LABEL_31;
        }
        if ([v15 isEqualToString:@"4"])
        {
          uint64_t v16 = 4;
          goto LABEL_31;
        }
        if ([v15 isEqualToString:@"5"])
        {
          uint64_t v16 = 5;
          goto LABEL_31;
        }
        if ([v15 isEqualToString:@"6"])
        {
          uint64_t v16 = 6;
          goto LABEL_31;
        }
        if ([v15 isEqualToString:@"7"])
        {
          uint64_t v16 = 7;
          goto LABEL_31;
        }
        if ([v15 isEqualToString:@"8"])
        {
          uint64_t v16 = 8;
          goto LABEL_31;
        }
        if ([v15 isEqualToString:@"9"])
        {
          uint64_t v16 = 9;
          goto LABEL_31;
        }
        if ([v15 isEqualToString:@"."])
        {
          uint64_t v16 = 10;
          goto LABEL_31;
        }
        if ([v15 isEqualToString:@"0"])
        {
          uint64_t v16 = 11;
          goto LABEL_31;
        }
        if ([v14 keyCode] == 42)
        {
          uint64_t v16 = 12;
LABEL_31:
          if (self->_nextNumberPadActionCausesReset) {
            BOOL v17 = 1;
          }
          else {
            BOOL v17 = !self->_usedKeypad && !self->_usedStepper;
          }
          self->_nextNumberPadActionCausesReset = v17;
          [(PKPeerPaymentMessagesAmountStepperView *)self handleNumberPadAction:v16];
          char v10 = 1;
        }
      }
    }
    uint64_t v9 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v9);
  id v7 = v18;
  if ((v10 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_42:
}

- (id)_stringForAction:(unint64_t)a3
{
  if (a3 - 10 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%i", a3);
    double v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v3 = off_1E59D3C80[a3 - 10];
  }

  return v3;
}

- (id)_posixLocale
{
  v2 = [(PKPeerPaymentMessagesAmountStepperView *)self _posixFormatter];
  double v3 = [v2 locale];

  return v3;
}

- (id)_posixFormatter
{
  if (qword_1E94F57B8 != -1) {
    dispatch_once(&qword_1E94F57B8, &__block_literal_global_96);
  }
  v2 = (void *)_MergedGlobals_6;

  return v2;
}

uint64_t __57__PKPeerPaymentMessagesAmountStepperView__posixFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)_MergedGlobals_6;
  _MergedGlobals_6 = (uint64_t)v0;

  [(id)_MergedGlobals_6 setNumberStyle:1];
  v2 = (void *)_MergedGlobals_6;
  double v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [(id)_MergedGlobals_6 setAllowsFloats:1];
  [(id)_MergedGlobals_6 setGroupingSeparator:&stru_1EF1B5B50];
  objc_super v4 = (void *)_MergedGlobals_6;

  return [v4 setDecimalSeparator:@"."];
}

- (id)_decimalNumberFromPosixString:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v7 = 0;
LABEL_6:
    char v10 = [MEMORY[0x1E4F28C28] zero];

    goto LABEL_7;
  }
  char v5 = (void *)MEMORY[0x1E4F28C28];
  id v6 = [(PKPeerPaymentMessagesAmountStepperView *)self _posixLocale];
  id v7 = [v5 decimalNumberWithString:v4 locale:v6];

  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v8 = [MEMORY[0x1E4F28C28] notANumber];
  int v9 = [v7 isEqualToNumber:v8];

  char v10 = v7;
  if (v9) {
    goto LABEL_6;
  }
LABEL_7:

  return v10;
}

- (id)_posixStringFromDecimalNumber:(id)a3
{
  id v4 = a3;
  char v5 = [(PKPeerPaymentMessagesAmountStepperView *)self _posixFormatter];
  id v6 = [v5 stringFromNumber:v4];

  return v6;
}

- (id)_updatePosixString:(id)a3 withAction:(unint64_t)a4 maxDigits:(unint64_t)a5 maxDecimalPlaces:(unint64_t)a6
{
  char v10 = (__CFString *)a3;
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = &stru_1EF1B5B50;
  }
  unint64_t v12 = [(__CFString *)v11 length];
  int v13 = [(__CFString *)v11 pk_posixStringHasPeriod];
  unint64_t v14 = [(__CFString *)v11 pk_posixStringDecimalPlaces];
  char v15 = v11;
  uint64_t v16 = v15;
  if (a4 == 10)
  {
    if (a6) {
      char v19 = v13;
    }
    else {
      char v19 = 1;
    }
    BOOL v17 = v15;
    if (v19) {
      goto LABEL_18;
    }
    long long v20 = self;
    unint64_t v21 = 10;
    goto LABEL_16;
  }
  if (a4 == 12)
  {
    BOOL v17 = v15;
    if (![(__CFString *)v15 length]) {
      goto LABEL_18;
    }
    BOOL v17 = -[__CFString substringWithRange:](v16, "substringWithRange:", 0, v12 - 1);
    id v18 = v16;
    goto LABEL_17;
  }
  if (v13)
  {
    BOOL v17 = v15;
    if (v14 >= a6) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  BOOL v17 = v15;
  if (v12 < a5)
  {
    if (a4 != 11 || (BOOL v17 = v15, v12))
    {
LABEL_15:
      long long v20 = self;
      unint64_t v21 = a4;
LABEL_16:
      id v18 = [(PKPeerPaymentMessagesAmountStepperView *)v20 _stringForAction:v21];
      BOOL v17 = [(__CFString *)v16 stringByAppendingString:v18];

LABEL_17:
    }
  }
LABEL_18:

  return v17;
}

- (void)_handleTap:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 state];
  char v5 = v11;
  if (v4 == 3)
  {
    [v11 locationInView:self];
    double v7 = v6;
    [(PKPeerPaymentMessagesAmountStepperView *)self bounds];
    v9.n128_f64[0] = v8 / 3.0;
    if (self->_plusMinusVisible && v7 < v9.n128_f64[0])
    {
      [(PKPeerPaymentMessagesAmountStepperView *)self _decrementAmount];
    }
    else if (self->_plusMinusVisible && (v9.n128_f64[0] = v9.n128_f64[0] + v9.n128_f64[0], v7 > v9.n128_f64[0]))
    {
      [(PKPeerPaymentMessagesAmountStepperView *)self _incrementAmount];
    }
    else
    {
      amountTappedHandler = (void (**)(id, id, __n128))self->_amountTappedHandler;
      char v5 = v11;
      if (!amountTappedHandler) {
        goto LABEL_11;
      }
      amountTappedHandler[2](amountTappedHandler, v11, v9);
    }
    char v5 = v11;
  }
LABEL_11:
}

- (void)_handleLongPress:(id)a3
{
  id v4 = a3;
  if (self->_plusMinusVisible)
  {
    if (!self->_longPressTimer)
    {
      char v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      longPressTimer = self->_longPressTimer;
      self->_longPressTimer = v5;

      dispatch_source_set_timer((dispatch_source_t)self->_longPressTimer, 0, 0x2FAF080uLL, 0x2FAF080uLL);
      objc_initWeak(&location, self);
      double v7 = self->_longPressTimer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __59__PKPeerPaymentMessagesAmountStepperView__handleLongPress___block_invoke;
      handler[3] = &unk_1E59CB010;
      objc_copyWeak(&v10, &location);
      id v9 = v4;
      dispatch_source_set_event_handler(v7, handler);
      self->_longPressTimerSuspended = 1;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    if ([v4 state] == 1)
    {
      if (self->_longPressTimerSuspended)
      {
        dispatch_resume((dispatch_object_t)self->_longPressTimer);
        self->_longPressTimerSuspended = 0;
      }
    }
    else if ([v4 state] != 2 && !self->_longPressTimerSuspended)
    {
      dispatch_suspend((dispatch_object_t)self->_longPressTimer);
      self->_longPressTimerSuspended = 1;
    }
  }
}

void __59__PKPeerPaymentMessagesAmountStepperView__handleLongPress___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v6 = WeakRetained;
    [*(id *)(a1 + 32) locationInView:WeakRetained];
    double v4 = v3;
    [v6 bounds];
    if (v4 >= v5 / 3.0)
    {
      id WeakRetained = v6;
      if (v4 <= v5 / 3.0 + v5 / 3.0) {
        goto LABEL_7;
      }
      [v6 _incrementAmount];
    }
    else
    {
      [v6 _decrementAmount];
    }
    id WeakRetained = v6;
  }
LABEL_7:
}

- (void)_decrementAmount
{
  double v3 = [(PKPeerPaymentMessagesAmountStepperView *)self _decimalNumberFromPosixString:self->_amountString];
  if (v3)
  {
    id v21 = v3;
    double v4 = [MEMORY[0x1E4F28C28] one];
    double v5 = [v21 decimalNumberBySubtracting:v4];

    if (self->_minAmount)
    {
      uint64_t v6 = -[NSDecimalNumber compare:](v5, "compare:");
      minAmount = v5;
      if (v6 != 1) {
        minAmount = self->_minAmount;
      }
      double v8 = minAmount;

      double v5 = v8;
    }
    if (!self->_style)
    {
      id v9 = [MEMORY[0x1E4F28C28] one];
      uint64_t v10 = [(NSDecimalNumber *)v5 compare:v9];

      if (v10 == -1)
      {
        id v11 = [MEMORY[0x1E4F28C28] one];
        if ([v21 compare:v11] == 1)
        {
          unint64_t v12 = [MEMORY[0x1E4F28C28] one];
        }
        else
        {
          unint64_t v12 = (NSDecimalNumber *)v21;
        }
        int v13 = v12;

        double v5 = v13;
      }
    }
    uint64_t v14 = [(NSString *)self->_amountString pk_posixStringDecimalPlaces];
    char v15 = [(PKPeerPaymentMessagesAmountStepperView *)self _posixStringFromDecimalNumber:v5];
    amountString = self->_amountString;
    self->_amountString = v15;

    BOOL v17 = [(NSString *)self->_amountString pk_posixStringWithMinimumDecimalPlaces:v14];
    id v18 = self->_amountString;
    self->_amountString = v17;

    [(PKPeerPaymentMessagesAmountStepperView *)self _updateContent];
    amountChangedHandler = (void (**)(id, void *))self->_amountChangedHandler;
    if (amountChangedHandler)
    {
      long long v20 = [(PKPeerPaymentMessagesAmountStepperView *)self amount];
      amountChangedHandler[2](amountChangedHandler, v20);
    }
    self->_nextNumberPadActionCausesReset = 0;
    self->_usedStepper = 1;

    double v3 = v21;
  }
}

- (void)_incrementAmount
{
  double v3 = [(PKPeerPaymentMessagesAmountStepperView *)self _decimalNumberFromPosixString:self->_amountString];
  if (v3)
  {
    id v16 = v3;
    double v4 = [MEMORY[0x1E4F28C28] one];
    double v5 = [v16 decimalNumberByAdding:v4];

    if (self->_maxAmount)
    {
      uint64_t v6 = -[NSDecimalNumber compare:](v5, "compare:");
      maxAmount = v5;
      if (v6 != -1) {
        maxAmount = self->_maxAmount;
      }
      double v8 = maxAmount;

      double v5 = v8;
    }
    uint64_t v9 = [(NSString *)self->_amountString pk_posixStringDecimalPlaces];
    uint64_t v10 = [(PKPeerPaymentMessagesAmountStepperView *)self _posixStringFromDecimalNumber:v5];
    amountString = self->_amountString;
    self->_amountString = v10;

    unint64_t v12 = [(NSString *)self->_amountString pk_posixStringWithMinimumDecimalPlaces:v9];
    int v13 = self->_amountString;
    self->_amountString = v12;

    [(PKPeerPaymentMessagesAmountStepperView *)self _updateContent];
    amountChangedHandler = (void (**)(id, void *))self->_amountChangedHandler;
    if (amountChangedHandler)
    {
      char v15 = [(PKPeerPaymentMessagesAmountStepperView *)self amount];
      amountChangedHandler[2](amountChangedHandler, v15);
    }
    self->_nextNumberPadActionCausesReset = 0;
    self->_usedStepper = 1;

    double v3 = v16;
  }
}

- (PKCurrencyAmount)amount
{
  double v3 = [(PKPeerPaymentMessagesAmountStepperView *)self _decimalNumberFromPosixString:self->_amountString];
  double v4 = PKCurrencyAmountCreate(v3, self->_amountCurrency);

  return (PKCurrencyAmount *)v4;
}

- (void)setAmount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v19 = v4;
    if (!self->_currencyFormatter
      || (amountCurrencCGFloat y = self->_amountCurrency,
          [v4 currency],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(amountCurrency) = [(NSString *)amountCurrency isEqualToString:v6],
          v6,
          (amountCurrency & 1) == 0))
    {
      double v7 = [v19 currency];
      PKMutableNumberFormatterForCurrencyCode();
      double v8 = (NSNumberFormatter *)objc_claimAutoreleasedReturnValue();
      currencyFormatter = self->_currencyFormatter;
      self->_currencyFormatter = v8;
    }
    uint64_t v10 = [(PKPeerPaymentMessagesAmountStepperView *)self _decimalNumberFromPosixString:self->_amountString];
    id v11 = [v19 amount];
    if ([v10 isEqualToNumber:v11])
    {
      unint64_t v12 = self->_amountCurrency;
      int v13 = [v19 currency];
      LOBYTE(v12) = [(NSString *)v12 isEqualToString:v13];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    uint64_t v14 = [v19 amount];
    char v15 = [(PKPeerPaymentMessagesAmountStepperView *)self _posixStringFromDecimalNumber:v14];
    amountString = self->_amountString;
    self->_amountString = v15;

    BOOL v17 = [v19 currency];
    id v18 = self->_amountCurrency;
    self->_amountCurrencCGFloat y = v17;

    [(PKPeerPaymentMessagesAmountStepperView *)self _cleanupPosixString];
    [(PKPeerPaymentMessagesAmountStepperView *)self _updateContent];
LABEL_10:

    id v4 = v19;
  }
}

- (void)_updateContent
{
  double v3 = [(PKPeerPaymentMessagesAmountStepperView *)self _decimalNumberFromPosixString:self->_amountString];
  id v6 = v3;
  if (self->_style)
  {
    [(NSNumberFormatter *)self->_currencyFormatter setAlwaysShowsDecimalSeparator:[(NSString *)self->_amountString pk_posixStringHasPeriod]];
    [(NSNumberFormatter *)self->_currencyFormatter setMinimumFractionDigits:[(NSString *)self->_amountString pk_posixStringDecimalPlaces]];
  }
  else
  {
    if (objc_msgSend(v3, "pk_isIntegralNumber")) {
      NSUInteger v4 = 0;
    }
    else {
      NSUInteger v4 = [(NSNumberFormatter *)self->_currencyFormatter maximumFractionDigits];
    }
    [(NSNumberFormatter *)self->_currencyFormatter setMinimumFractionDigits:v4];
    [(NSNumberFormatter *)self->_currencyFormatter setAlwaysShowsDecimalSeparator:0];
  }
  double v5 = [(NSNumberFormatter *)self->_currencyFormatter stringFromNumber:v6];
  [(UILabel *)self->_compactAmountLabel setText:v5];
  [(UILabel *)self->_amountLabel setText:v5];
  [(PKPeerPaymentMessagesAmountStepperView *)self setNeedsLayout];
}

- (void)_cleanupPosixString
{
  id v8 = [(PKPeerPaymentMessagesAmountStepperView *)self _decimalNumberFromPosixString:self->_amountString];
  uint64_t v3 = [(NSString *)self->_amountString rangeOfString:@"." options:4];
  uint64_t v5 = v4;
  if (objc_msgSend(v8, "pk_isIntegralNumber"))
  {
    if (!v5) {
      goto LABEL_7;
    }
    id v6 = [(NSString *)self->_amountString substringToIndex:v3];
  }
  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    id v6 = [(NSString *)self->_amountString pk_posixStringWithMinimumDecimalPlaces:[(NSNumberFormatter *)self->_currencyFormatter maximumFractionDigits]];
  }
  amountString = self->_amountString;
  self->_amountString = v6;

LABEL_7:
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    self->_nextNumberPadActionCausesReset |= a3 != 0;
    if (!self->_style) {
      [(PKPeerPaymentMessagesAmountStepperView *)self _cleanupPosixString];
    }
    [(PKPeerPaymentMessagesAmountStepperView *)self _updateContent];
  }
}

- (void)setSizeCategory:(unint64_t)a3
{
  if (self->_sizeCategory != a3)
  {
    self->_sizeCategorCGFloat y = a3;
    id v4 = [(PKPeerPaymentMessagesAmountStepperView *)self _amountLabelFont];
    [(UILabel *)self->_compactAmountLabel setFont:v4];
    [(UILabel *)self->_amountLabel setFont:v4];
  }
}

- (void)_shakeAmountLabel
{
  uint64_t v2 = 9;
  if (!self->_plusMinusVisible) {
    uint64_t v2 = 10;
  }
  id v5 = [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR___PKPeerPaymentMessagesButton__highlightedBackgroundColor[v2]) layer];
  [v5 removeAllAnimations];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F39B30], "pkui_smallShakeAnimation");
  id v4 = (id)objc_msgSend(v5, "pkui_addAdditiveAnimation:", v3);
}

+ (double)_amountLabelFontSizeForSizeCategory:(unint64_t)a3
{
  if (PKIsVision())
  {
    double result = 52.0;
    if (a3 - 1 < 3) {
      return 100.0;
    }
  }
  else if (PKIsPad())
  {
    if (a3 - 1 >= 3) {
      return 70.0;
    }
    else {
      return dbl_1A0444188[a3 - 1];
    }
  }
  else if (a3 >= 4)
  {
    return 100.0;
  }
  else
  {
    return dbl_1A04441A0[a3];
  }
  return result;
}

- (id)_amountLabelFont
{
  return +[PKPeerPaymentMessagesAmountStepperView _amountLabelFontForSizeCategory:self->_sizeCategory];
}

+ (id)_amountLabelFontForSizeCategory:(unint64_t)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4FB08E0];
  [a1 _amountLabelFontSizeForSizeCategory:a3];
  id v4 = objc_msgSend(v3, "pk_peerPaymentChiseledCashFontOfSize:");
  id v5 = objc_msgSend(v4, "pk_fixedWidthFont");

  return v5;
}

- (void)setPlusMinusVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (self->_plusMinusVisible != a3 || !a4)
  {
    self->_plusMinusVisible = a3;
    double v7 = [(PKPeerPaymentMessagesRoundedButton *)self->_plusButton layer];
    id v8 = [(PKPeerPaymentMessagesRoundedButton *)self->_minusButton layer];
    uint64_t v9 = [(UILabel *)self->_compactAmountLabel layer];
    uint64_t v10 = [(UILabel *)self->_amountLabel layer];
    if (v4)
    {
      id v38 = 0;
      id v39 = 0;
      id v36 = 0;
      id v37 = 0;
      ContentViewVisibilityAnimations(&v39, &v38, &v37, &v36);
      id v12 = v39;
      int v13 = v8;
      uint64_t v14 = v7;
      id v15 = v38;
      id v16 = v37;
      id v17 = v36;
      id v18 = v17;
      if (v5) {
        id v19 = v15;
      }
      else {
        id v19 = v17;
      }
      id v20 = v12;
      v35 = v12;
      if (v5)
      {
        id v12 = v16;
        id v21 = v17;
      }
      else
      {
        id v21 = v15;
      }
      if (!v5) {
        id v20 = v16;
      }
      id v33 = v21;
      id v34 = v20;
      id v22 = (id)objc_msgSend(v14, "pkui_addAdditiveAnimation:", v19);
      id v23 = (id)objc_msgSend(v14, "pkui_addAdditiveAnimation:", v12);
      id v24 = (id)objc_msgSend(v13, "pkui_addAdditiveAnimation:", v19);
      id v25 = (id)objc_msgSend(v13, "pkui_addAdditiveAnimation:", v12);
      id v26 = (id)objc_msgSend(v9, "pkui_addAdditiveAnimation:", v19);
      id v27 = (id)objc_msgSend(v9, "pkui_addAdditiveAnimation:", v12);
      id v28 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v33);
      id v29 = (id)objc_msgSend(v10, "pkui_addAdditiveAnimation:", v34);

      double v7 = v14;
      id v8 = v13;
    }
    if (v5)
    {
      LODWORD(v11) = 1.0;
      [v7 setOpacity:v11];
      [v7 setValue:&unk_1EF2B88D0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
      LODWORD(v30) = 1.0;
      [v8 setOpacity:v30];
      [v8 setValue:&unk_1EF2B88D0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
      LODWORD(v31) = 1.0;
      [v9 setOpacity:v31];
      [v9 setValue:&unk_1EF2B88D0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
      [v10 setValue:&unk_1EF2B88E0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
      [v10 setOpacity:0.0];
    }
    else
    {
      [v7 setValue:&unk_1EF2B88E0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
      [v7 setOpacity:0.0];
      [v8 setValue:&unk_1EF2B88E0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
      [v8 setOpacity:0.0];
      [v9 setValue:&unk_1EF2B88E0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
      [v9 setOpacity:0.0];
      LODWORD(v32) = 1.0;
      [v10 setOpacity:v32];
      [v10 setValue:&unk_1EF2B88D0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_tapGestureRecognizer == a3)
  {
    [a4 locationInView:self->_centerView];
    [(UIView *)self->_centerView bounds];
  }
  return 1;
}

- (NSDecimalNumber)minAmount
{
  return self->_minAmount;
}

- (void)setMinAmount:(id)a3
{
}

- (NSDecimalNumber)maxAmount
{
  return self->_maxAmount;
}

- (void)setMaxAmount:(id)a3
{
}

- (id)amountChangedHandler
{
  return self->_amountChangedHandler;
}

- (void)setAmountChangedHandler:(id)a3
{
}

- (id)amountTappedHandler
{
  return self->_amountTappedHandler;
}

- (void)setAmountTappedHandler:(id)a3
{
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)usedKeypad
{
  return self->_usedKeypad;
}

- (void)setUsedKeypad:(BOOL)a3
{
  self->_usedKeypad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_amountTappedHandler, 0);
  objc_storeStrong(&self->_amountChangedHandler, 0);
  objc_storeStrong((id *)&self->_maxAmount, 0);
  objc_storeStrong((id *)&self->_minAmount, 0);
  objc_storeStrong((id *)&self->_longPressTimer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_currencyFormatter, 0);
  objc_storeStrong((id *)&self->_amountCurrency, 0);
  objc_storeStrong((id *)&self->_amountString, 0);
  objc_storeStrong((id *)&self->_amountLabel, 0);
  objc_storeStrong((id *)&self->_compactAmountLabel, 0);
  objc_storeStrong((id *)&self->_centerView, 0);
  objc_storeStrong((id *)&self->_minusButton, 0);

  objc_storeStrong((id *)&self->_plusButton, 0);
}

@end