@interface PKFindBankAccountInformationFooterView
- (CGSize)_sizeForButton:(id)a3 constrainedToSize:(CGSize)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKFindBankAccountInformationFooterView)initWithFrame:(CGRect)a3 action:(id)a4;
- (void)layoutSubviews;
- (void)setButtonsEnabled:(BOOL)a3;
- (void)setupAccountInformationButtonWithAction:(id)a3;
@end

@implementation PKFindBankAccountInformationFooterView

- (PKFindBankAccountInformationFooterView)initWithFrame:(CGRect)a3 action:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKFindBankAccountInformationFooterView;
  v10 = -[PKFindBankAccountInformationFooterView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10) {
    [(PKFindBankAccountInformationFooterView *)v10 setupAccountInformationButtonWithAction:v9];
  }

  return v11;
}

- (void)setupAccountInformationButtonWithAction:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB14D8];
  id v5 = a3;
  v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBan_1.isa);
  v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  objc_msgSend(v4, "pkui_plainConfigurationWithTitle:font:", v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v10 primaryAction:v5];

  accountInformationButton = self->_accountInformationButton;
  self->_accountInformationButton = v8;

  [(UIButton *)self->_accountInformationButton setConfigurationUpdateHandler:&__block_literal_global_146];
  [(UIButton *)self->_accountInformationButton setAccessibilityIdentifier:*MEMORY[0x1E4F851A8]];
  [(PKFindBankAccountInformationFooterView *)self addSubview:self->_accountInformationButton];
}

void __82__PKFindBankAccountInformationFooterView_setupAccountInformationButtonWithAction___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setExclusiveTouch:1];
  objc_msgSend(v2, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  v3 = [v2 titleLabel];
  [v3 setTextAlignment:1];

  id v4 = [v2 titleLabel];

  [v4 setNumberOfLines:0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[PKFindBankAccountInformationFooterView _sizeForButton:constrainedToSize:](self, "_sizeForButton:constrainedToSize:", self->_accountInformationButton, a3.width, 1.79769313e308);
  double v5 = v4 + 18.0;
  double v6 = width;
  result.double height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKFindBankAccountInformationFooterView;
  [(PKFindBankAccountInformationFooterView *)&v5 layoutSubviews];
  [(PKFindBankAccountInformationFooterView *)self bounds];
  -[PKFindBankAccountInformationFooterView _sizeForButton:constrainedToSize:](self, "_sizeForButton:constrainedToSize:", self->_accountInformationButton, v3, v4);
  PKRectCenteredIntegralRect();
  -[UIButton setFrame:](self->_accountInformationButton, "setFrame:");
}

- (void)setButtonsEnabled:(BOOL)a3
{
}

- (CGSize)_sizeForButton:(id)a3 constrainedToSize:(CGSize)a4
{
  if (a3)
  {
    objc_msgSend(a3, "sizeThatFits:", a4.width, a4.height);
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.double height = v5;
  result.CGFloat width = v4;
  return result;
}

- (void).cxx_destruct
{
}

@end