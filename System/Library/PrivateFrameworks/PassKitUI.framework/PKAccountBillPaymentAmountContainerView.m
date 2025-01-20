@interface PKAccountBillPaymentAmountContainerView
- (BOOL)showAmount;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKAccountBillPaymentAmountContainerView)initWithCurrencyCode:(id)a3 minimumAmount:(id)a4;
- (PKEnterCurrencyAmountView)enterCurrencyAmountView;
- (double)_amountLabelFontSize;
- (void)layoutSubviews;
- (void)setEnterCurrencyAmountView:(id)a3;
- (void)setShowAmount:(BOOL)a3;
@end

@implementation PKAccountBillPaymentAmountContainerView

- (PKAccountBillPaymentAmountContainerView)initWithCurrencyCode:(id)a3 minimumAmount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PKAccountBillPaymentAmountContainerView;
  v8 = [(PKAccountBillPaymentAmountContainerView *)&v22 init];
  v9 = v8;
  if (v8)
  {
    [(PKAccountBillPaymentAmountContainerView *)v8 _amountLabelFontSize];
    double v11 = v10;
    double v12 = *MEMORY[0x1E4FB09D0];
    v13 = PKRoundedSystemFontOfSizeAndWeight(v10, *MEMORY[0x1E4FB09D0]);
    v14 = objc_msgSend(v13, "pk_fixedWidthFont");

    v15 = PKRoundedSystemFontOfSizeAndWeight(v11 * 0.5, v12);
    v16 = objc_msgSend(v15, "pk_fixedWidthFont");

    v17 = [[PKEnterCurrencyAmountView alloc] initWithCurrency:v6 amount:v7];
    enterCurrencyAmountView = v9->_enterCurrencyAmountView;
    v9->_enterCurrencyAmountView = v17;

    v19 = v9->_enterCurrencyAmountView;
    v20 = +[PKAccountBillPaymentViewController backgroundColor];
    [(PKEnterCurrencyAmountView *)v19 setKeyboardColor:v20];

    [(PKEnterCurrencyAmountView *)v9->_enterCurrencyAmountView setShowsDecimalPointButton:1];
    [(PKEnterCurrencyAmountView *)v9->_enterCurrencyAmountView setAmountFont:v14];
    [(PKEnterCurrencyAmountView *)v9->_enterCurrencyAmountView setCurrencySymbolFont:v16];
    [(PKEnterCurrencyAmountView *)v9->_enterCurrencyAmountView setKerning:&unk_1EF2B8870];
    [(PKEnterCurrencyAmountView *)v9->_enterCurrencyAmountView setIgnoreIntegralNumber:1];
    [(PKEnterCurrencyAmountView *)v9->_enterCurrencyAmountView sizeToFit];
    [(PKEnterCurrencyAmountView *)v9->_enterCurrencyAmountView setShowsDecimalPointButton:1];
    [(PKEnterCurrencyAmountView *)v9->_enterCurrencyAmountView setClearAmountOnFirstKeyboardInput:1];
    [(PKAccountBillPaymentAmountContainerView *)v9 addSubview:v9->_enterCurrencyAmountView];
    [(PKAccountBillPaymentAmountContainerView *)v9 setHidden:!v9->_showAmount];
  }
  return v9;
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)PKAccountBillPaymentAmountContainerView;
  [(PKAccountBillPaymentAmountContainerView *)&v29 layoutSubviews];
  [(PKAccountBillPaymentAmountContainerView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[PKEnterCurrencyAmountView sizeThatFits:](self->_enterCurrencyAmountView, "sizeThatFits:", v7, 1.79769313e308);
  PKRectCenteredXInRect();
  CGFloat v12 = v11;
  double v14 = v13;
  double v16 = v15;
  if (self->_showAmount)
  {
    PKRectCenteredYInRect();
    CGFloat v12 = v17;
    double v19 = v18;
    double v14 = v20;
    double v16 = v21;
    enterCurrencyAmountView = self->_enterCurrencyAmountView;
    CGAffineTransformMakeScale(&v28, 1.0, 1.0);
    v23 = &v28;
  }
  else
  {
    v30.origin.x = v4;
    v30.origin.y = v6;
    v30.size.width = v8;
    v30.size.height = v10;
    double v19 = v16 + CGRectGetMaxY(v30);
    enterCurrencyAmountView = self->_enterCurrencyAmountView;
    CGAffineTransformMakeScale(&v27, 0.05, 0.05);
    v23 = &v27;
  }
  [(PKEnterCurrencyAmountView *)enterCurrencyAmountView setTransform:v23];
  -[PKEnterCurrencyAmountView setBounds:](self->_enterCurrencyAmountView, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v14, v16);
  v24 = self->_enterCurrencyAmountView;
  v31.origin.x = v12;
  v31.origin.y = v19;
  v31.size.width = v14;
  v31.size.height = v16;
  double MidX = CGRectGetMidX(v31);
  v32.origin.x = v12;
  v32.origin.y = v19;
  v32.size.width = v14;
  v32.size.height = v16;
  -[PKEnterCurrencyAmountView setCenter:](v24, "setCenter:", MidX, CGRectGetMidY(v32));
  double v26 = 1.0;
  if (!self->_showAmount) {
    double v26 = 0.0;
  }
  [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setAlpha:v26];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKEnterCurrencyAmountView sizeThatFits:](self->_enterCurrencyAmountView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setShowAmount:(BOOL)a3
{
  if (((!self->_showAmount ^ a3) & 1) == 0)
  {
    [(PKAccountBillPaymentAmountContainerView *)self layoutIfNeeded];
    self->_showAmount = a3;
    [(PKAccountBillPaymentAmountContainerView *)self setNeedsLayout];
    [(PKAccountBillPaymentAmountContainerView *)self setHidden:0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__PKAccountBillPaymentAmountContainerView_setShowAmount___block_invoke;
    v7[3] = &unk_1E59CA7D0;
    v7[4] = self;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __57__PKAccountBillPaymentAmountContainerView_setShowAmount___block_invoke_2;
    v5[3] = &unk_1E59CE050;
    v5[4] = self;
    BOOL v6 = a3;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v7 completion:v5];
  }
}

uint64_t __57__PKAccountBillPaymentAmountContainerView_setShowAmount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __57__PKAccountBillPaymentAmountContainerView_setShowAmount___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:*(unsigned char *)(a1 + 40) == 0];
}

- (double)_amountLabelFontSize
{
  uint64_t v2 = PKUIGetMinScreenWidthType();
  double result = 57.0;
  if (!v2) {
    return 42.0;
  }
  return result;
}

- (PKEnterCurrencyAmountView)enterCurrencyAmountView
{
  return self->_enterCurrencyAmountView;
}

- (void)setEnterCurrencyAmountView:(id)a3
{
}

- (BOOL)showAmount
{
  return self->_showAmount;
}

- (void).cxx_destruct
{
}

@end