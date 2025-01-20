@interface PKEnterCurrencyAmountPassView
- ($39E3A1BE27F4D54DDE9E95526D5A3B5F)_amountPassViewSizeInfoForSize:(SEL)a3;
- (CGSize)_passViewSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKEnterCurrencyAmountPassView)initWithCurrenyAmount:(id)a3 pass:(id)a4 withdrawal:(BOOL)a5;
- (PKEnterCurrencyAmountPassView)initWithCurrenyAmount:(id)a3 pass:(id)a4 withdrawal:(BOOL)a5 keypadBottomView:(id)a6;
- (PKEnterCurrencyAmountPassViewDelegate)delegate;
- (PKEnterCurrencyAmountView)enterCurrencyAmountView;
- (PKEnterValueNewBalanceView)balanceView;
- (PKPass)pass;
- (double)_newBalanceHorizontalPadding;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setPass:(id)a3;
- (void)shakePassView;
@end

@implementation PKEnterCurrencyAmountPassView

- (PKEnterCurrencyAmountPassView)initWithCurrenyAmount:(id)a3 pass:(id)a4 withdrawal:(BOOL)a5
{
  return [(PKEnterCurrencyAmountPassView *)self initWithCurrenyAmount:a3 pass:a4 withdrawal:a5 keypadBottomView:0];
}

- (PKEnterCurrencyAmountPassView)initWithCurrenyAmount:(id)a3 pass:(id)a4 withdrawal:(BOOL)a5 keypadBottomView:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v46.receiver = self;
  v46.super_class = (Class)PKEnterCurrencyAmountPassView;
  v13 = -[PKEnterCurrencyAmountPassView initWithFrame:](&v46, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_pass, a4);
    double v15 = *MEMORY[0x1E4FB09E0];
    PKRoundedSystemFontOfSizeAndWeight(60.0, *MEMORY[0x1E4FB09E0]);
    v17 = id v16 = v11;
    v18 = PKRoundedSystemFontOfSizeAndWeight(36.0, v15);
    v19 = [PKEnterCurrencyAmountView alloc];
    v20 = [v10 currency];
    v21 = [v10 amount];
    uint64_t v22 = [(PKEnterCurrencyAmountView *)v19 initWithCurrency:v20 amount:v21 bottomView:v12];
    enterCurrencyAmountView = v14->_enterCurrencyAmountView;
    v14->_enterCurrencyAmountView = (PKEnterCurrencyAmountView *)v22;

    [(PKEnterCurrencyAmountView *)v14->_enterCurrencyAmountView setShowsDecimalPointButton:1];
    v43 = (void *)v17;
    uint64_t v24 = v17;
    id v11 = v16;
    [(PKEnterCurrencyAmountView *)v14->_enterCurrencyAmountView setAmountFont:v24];
    [(PKEnterCurrencyAmountView *)v14->_enterCurrencyAmountView setCurrencySymbolFont:v18];
    [(PKEnterCurrencyAmountView *)v14->_enterCurrencyAmountView setKerning:&unk_1EF2B8810];
    [(PKEnterCurrencyAmountView *)v14->_enterCurrencyAmountView sizeToFit];
    v25 = [PKEnterValueNewBalanceView alloc];
    v26 = [v10 currency];
    uint64_t v27 = [(PKEnterValueNewBalanceView *)v25 initWithCurrencyCode:v26];
    balanceView = v14->_balanceView;
    v14->_balanceView = (PKEnterValueNewBalanceView *)v27;

    v29 = v14->_balanceView;
    v30 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBan.isa);
    [(PKEnterValueNewBalanceView *)v29 setPromptText:v30];

    v31 = v14->_balanceView;
    v32 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBan_0.isa);
    [(PKEnterValueNewBalanceView *)v31 setUpdatedBalancePromptText:v32];

    v33 = v14->_balanceView;
    v34 = PKLocalizedPaymentString(&cfstr_PerformActionE.isa);
    [(PKEnterValueNewBalanceView *)v33 setMaxLoadAmountText:v34];

    [(PKEnterValueNewBalanceView *)v14->_balanceView sizeToFit];
    [(PKEnterValueNewBalanceView *)v14->_balanceView setAmountIsWithdrawal:v7];
    v35 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    passView = v14->_passView;
    v14->_passView = v35;

    [(UIImageView *)v14->_passView setContentMode:1];
    [(UIImageView *)v14->_passView setAccessibilityIgnoresInvertColors:1];
    [(PKEnterCurrencyAmountPassView *)v14 addSubview:v14->_enterCurrencyAmountView];
    [(PKEnterCurrencyAmountPassView *)v14 addSubview:v14->_balanceView];
    [(PKEnterCurrencyAmountPassView *)v14 addSubview:v14->_passView];
    if (v14->_pass)
    {
      v14->_loadingSnapshot = 1;
      v37 = +[PKPassSnapshotter sharedInstance];
      [(PKEnterCurrencyAmountPassView *)v14 _passViewSize];
      double v39 = v38;
      double v41 = v40;
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __88__PKEnterCurrencyAmountPassView_initWithCurrenyAmount_pass_withdrawal_keypadBottomView___block_invoke;
      v44[3] = &unk_1E59CA898;
      v45 = v14;
      objc_msgSend(v37, "snapshotWithPass:size:completion:", v16, v44, v39, v41);
    }
  }

  return v14;
}

void __88__PKEnterCurrencyAmountPassView_initWithCurrenyAmount_pass_withdrawal_keypadBottomView___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__PKEnterCurrencyAmountPassView_initWithCurrenyAmount_pass_withdrawal_keypadBottomView___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __88__PKEnterCurrencyAmountPassView_initWithCurrenyAmount_pass_withdrawal_keypadBottomView___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 416) = 0;
  [*(id *)(*(void *)(a1 + 32) + 408) setImage:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 424));
  [WeakRetained enterCurrencyAmountPassViewDidLoadPassSnapshot:*(void *)(a1 + 32)];

  id v3 = *(void **)(a1 + 32);

  return [v3 setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PKEnterCurrencyAmountPassView *)self _newBalanceHorizontalPadding];
  -[PKEnterValueNewBalanceView sizeThatFits:](self->_balanceView, "sizeThatFits:", width + v6 * -2.0, 1.79769313e308);
  double v8 = v7 + 0.0;
  -[PKEnterCurrencyAmountView sizeThatFits:](self->_enterCurrencyAmountView, "sizeThatFits:", width, 1.79769313e308);
  double v10 = v8 + v9;
  -[PKEnterCurrencyAmountPassView _amountPassViewSizeInfoForSize:](self, "_amountPassViewSizeInfoForSize:", width, height - (v8 + v9));
  double v11 = 0.0;
  if (*(double *)(MEMORY[0x1E4F1DB30] + 8) == 0.0 && *MEMORY[0x1E4F1DB30] == 0.0) {
    double v11 = -0.0;
  }
  double v13 = v10 + v11 + 0.0 + 0.0 + 0.0;
  double v14 = width;
  result.double height = v13;
  result.double width = v14;
  return result;
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)PKEnterCurrencyAmountPassView;
  [(PKEnterCurrencyAmountPassView *)&v32 layoutSubviews];
  [(PKEnterCurrencyAmountPassView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[PKEnterCurrencyAmountView sizeThatFits:](self->_enterCurrencyAmountView, "sizeThatFits:", v7, 1.79769313e308);
  double v12 = v11;
  [(PKEnterCurrencyAmountPassView *)self _newBalanceHorizontalPadding];
  -[PKEnterValueNewBalanceView sizeThatFits:](self->_balanceView, "sizeThatFits:", v8 + v13 * -2.0, 1.79769313e308);
  -[PKEnterCurrencyAmountPassView _amountPassViewSizeInfoForSize:](self, "_amountPassViewSizeInfoForSize:", v8, v10 - v12 - v14);
  if (*MEMORY[0x1E4F1DB30] == 0.0 && *(double *)(MEMORY[0x1E4F1DB30] + 8) == 0.0)
  {
    CGFloat v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    CGFloat v17 = *MEMORY[0x1E4F1DB28];
    CGFloat v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    -[UIImageView setAlpha:](self->_passView, "setAlpha:", 0.0, 0.0);
  }
  else
  {
    -[UIImageView setAlpha:](self->_passView, "setAlpha:", 1.0, 0.0);
    PKSizeAlignedInRect();
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    -[UIImageView setFrame:](self->_passView, "setFrame:");
  }
  v33.origin.x = v17;
  v33.origin.y = v19;
  v33.size.double width = v21;
  v33.size.double height = v23;
  CGRectGetMaxY(v33);
  v34.origin.x = v4;
  v34.origin.y = v6;
  v34.size.double width = v8;
  v34.size.double height = v10;
  CGRectGetMinX(v34);
  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.double width = v8;
  v35.size.double height = v10;
  CGRectGetWidth(v35);
  PKRectCenteredXInRect();
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  -[PKEnterCurrencyAmountView setFrame:](self->_enterCurrencyAmountView, "setFrame:");
  v36.origin.x = v25;
  v36.origin.y = v27;
  v36.size.double width = v29;
  v36.size.double height = v31;
  CGRectGetMaxY(v36);
  PKRectCenteredXInRect();
  -[PKEnterValueNewBalanceView setFrame:](self->_balanceView, "setFrame:");
}

- (void)shakePassView
{
}

- (CGSize)_passViewSize
{
  double v2 = 156.0;
  double v3 = 100.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (double)_newBalanceHorizontalPadding
{
  uint64_t v2 = PKUIGetMinScreenWidthType();
  double result = 20.0;
  if (!v2) {
    return 10.0;
  }
  return result;
}

- ($39E3A1BE27F4D54DDE9E95526D5A3B5F)_amountPassViewSizeInfoForSize:(SEL)a3
{
  retstr->var3.CGFloat height = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  retstr->var1 = 8.0;
  if (a4.height <= 8.0)
  {
    if (a4.height > 0.0)
    {
      retstr->var0 = a4.height;
      a4.CGFloat height = 0.0;
    }
  }
  else
  {
    retstr->var0 = 8.0;
    a4.CGFloat height = a4.height + -8.0;
  }
  if (*(void *)&self[11].var1)
  {
    double v5 = a4.height + -8.0;
    self = ($39E3A1BE27F4D54DDE9E95526D5A3B5F *)[($39E3A1BE27F4D54DDE9E95526D5A3B5F *)self _passViewSize];
    if (v7 <= v5)
    {
      retstr->var3.double width = v6;
      retstr->var3.CGFloat height = v7;
      double v10 = v5 - v7;
      if (v5 - v7 >= 24.0)
      {
        retstr->var1 = 32.0;
        double v11 = v10 + -24.0;
        if (v11 >= 32.0) {
          retstr->var2 = 32.0;
        }
        else {
          retstr->var2 = v11;
        }
      }
      else
      {
        retstr->var1 = v10 + 8.0;
      }
    }
    else
    {
      double v8 = v5 / v7;
      if (v8 >= 0.8)
      {
        retstr->var3.double width = v6 * v8;
        retstr->var3.CGFloat height = v5;
      }
      else
      {
        retstr->var3 = (CGSize)*MEMORY[0x1E4F1DB30];
      }
    }
  }
  else
  {
    CGFloat height = 32.0;
    if (a4.height <= 32.0) {
      CGFloat height = a4.height;
    }
    retstr->var1 = height;
    retstr->var2 = 0.0;
    retstr->var3 = (CGSize)*MEMORY[0x1E4F1DB30];
  }
  return self;
}

- (PKEnterCurrencyAmountPassViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKEnterCurrencyAmountPassViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKEnterCurrencyAmountView)enterCurrencyAmountView
{
  return self->_enterCurrencyAmountView;
}

- (PKEnterValueNewBalanceView)balanceView
{
  return self->_balanceView;
}

- (PKPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_balanceView, 0);
  objc_storeStrong((id *)&self->_enterCurrencyAmountView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_passView, 0);
}

@end