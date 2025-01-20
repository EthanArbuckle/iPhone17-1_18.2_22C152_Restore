@interface PKPaymentSetupTransferCardView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPaymentSetupTransferCardDelegate)delegate;
- (PKPaymentSetupTransferCardView)initWithFrame:(CGRect)a3;
- (UIButton)transferBalanceButton;
- (void)_createSubviews;
- (void)_transferBalanceButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setTransferBalanceButton:(id)a3;
@end

@implementation PKPaymentSetupTransferCardView

- (PKPaymentSetupTransferCardView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupTransferCardView;
  v5 = -[PKPaymentSetupTransferCardView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    v6 = PKProvisioningBackgroundColor();
    [(PKPaymentSetupTransferCardView *)v5 setBackgroundColor:v6];

    double v7 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    -[PKPaymentSetupTransferCardView sizeThatFits:](v5, "sizeThatFits:", width, height);
    -[PKPaymentSetupTransferCardView setFrame:](v5, "setFrame:", v7, v8, v9, v10);
    [(PKPaymentSetupTransferCardView *)v5 _createSubviews];
    [(PKPaymentSetupTransferCardView *)v5 setUserInteractionEnabled:1];
  }
  return v5;
}

- (void)_createSubviews
{
  v3 = (void *)MEMORY[0x1E4FB14D8];
  v4 = PKLocalizedPaymentString(&cfstr_SetupPurchaseT.isa);
  v5 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27D0]);
  v6 = objc_msgSend(v3, "pkui_plainConfigurationWithTitle:font:", v4, v5);

  objc_initWeak(&location, self);
  double v7 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __49__PKPaymentSetupTransferCardView__createSubviews__block_invoke;
  v14 = &unk_1E59CBEE0;
  objc_copyWeak(&v15, &location);
  double v8 = [v7 actionWithHandler:&v11];
  objc_msgSend(MEMORY[0x1E4FB14D0], "buttonWithConfiguration:primaryAction:", v6, v8, v11, v12, v13, v14);
  double v9 = (UIButton *)objc_claimAutoreleasedReturnValue();
  transferBalanceButton = self->_transferBalanceButton;
  self->_transferBalanceButton = v9;

  [(UIButton *)self->_transferBalanceButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_transferBalanceButton setConfigurationUpdateHandler:&__block_literal_global_137];
  [(PKPaymentSetupTransferCardView *)self addSubview:self->_transferBalanceButton];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __49__PKPaymentSetupTransferCardView__createSubviews__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [v3 sender];

  [WeakRetained _transferBalanceButtonTapped:v4];
}

void __49__PKPaymentSetupTransferCardView__createSubviews__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setExclusiveTouch:1];
  id v3 = [v2 titleLabel];
  [v3 setTextAlignment:1];

  id v4 = [v2 titleLabel];

  [v4 setNumberOfLines:1];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupTransferCardView;
  [(PKPaymentSetupTransferCardView *)&v8 layoutSubviews];
  [(PKPaymentSetupTransferCardView *)self bounds];
  double v4 = v3;
  -[UIButton sizeThatFits:](self->_transferBalanceButton, "sizeThatFits:", v3, v5);
  -[UIButton setFrame:](self->_transferBalanceButton, "setFrame:", v4 * 0.5 - v6 * 0.5, 20.0, v6, v7);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(PKPaymentSetupTransferCardView *)self bounds];
  -[UIButton sizeThatFits:](self->_transferBalanceButton, "sizeThatFits:", width, v5);
  double v7 = v6 + 20.0 + 70.0;
  double v8 = width;
  result.double height = v7;
  result.double width = v8;
  return result;
}

- (void)_transferBalanceButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didInitiateTransferExistingCard];
}

- (PKPaymentSetupTransferCardDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupTransferCardDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)transferBalanceButton
{
  return self->_transferBalanceButton;
}

- (void)setTransferBalanceButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferBalanceButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end