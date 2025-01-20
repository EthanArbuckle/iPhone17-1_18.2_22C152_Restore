@interface PKPaymentPassDetailActivationFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPaymentPassDetailActivationFooterView)initWithFrame:(CGRect)a3 activationAction:(id)a4;
- (void)layoutSubviews;
- (void)setActivationButtonText:(id)a3;
- (void)setFooterText:(id)a3;
- (void)setupActivationButtonWithAction:(id)a3;
- (void)setupFooter;
@end

@implementation PKPaymentPassDetailActivationFooterView

- (PKPaymentPassDetailActivationFooterView)initWithFrame:(CGRect)a3 activationAction:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentPassDetailActivationFooterView;
  v10 = -[PKPaymentPassDetailActivationFooterView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(PKPaymentPassDetailActivationFooterView *)v10 setupActivationButtonWithAction:v9];
    [(PKPaymentPassDetailActivationFooterView *)v11 setupFooter];
  }

  return v11;
}

- (void)setupActivationButtonWithAction:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB14D8];
  v5 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v6 = *MEMORY[0x1E4FB28D8];
  id v7 = a3;
  v8 = [v5 preferredFontForTextStyle:v6];
  objc_msgSend(v4, "pkui_plainConfigurationWithTitle:font:", 0, v8);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  [v12 setButtonSize:2];
  objc_msgSend(v12, "setContentInsets:", 5.0, 0.0, 0.0, 0.0);
  id v9 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v12 primaryAction:v7];

  activationButton = self->_activationButton;
  self->_activationButton = v9;

  v11 = [(PKPaymentPassDetailActivationFooterView *)self contentView];
  [v11 addSubview:self->_activationButton];
}

- (void)setupFooter
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  footerTextLabel = self->_footerTextLabel;
  self->_footerTextLabel = v4;

  [(UILabel *)self->_footerTextLabel setLineBreakMode:0];
  [(UILabel *)self->_footerTextLabel setTextAlignment:4];
  [(UILabel *)self->_footerTextLabel setNumberOfLines:0];
  uint64_t v6 = self->_footerTextLabel;
  id v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F8]];
  [(UILabel *)v6 setFont:v7];

  v8 = self->_footerTextLabel;
  id v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)v8 setTextColor:v9];

  id v10 = [(PKPaymentPassDetailActivationFooterView *)self contentView];
  [v10 addSubview:self->_footerTextLabel];
}

- (void)setFooterText:(id)a3
{
  [(UILabel *)self->_footerTextLabel setText:a3];

  [(PKPaymentPassDetailActivationFooterView *)self setNeedsLayout];
}

- (void)setActivationButtonText:(id)a3
{
  -[UIButton pkui_updateConfigurationWithTitle:](self->_activationButton, "pkui_updateConfigurationWithTitle:");
  if (a3)
  {
    v5 = [(PKPaymentPassDetailActivationFooterView *)self contentView];
    [v5 addSubview:self->_activationButton];
  }
  else
  {
    [(UIButton *)self->_activationButton removeFromSuperview];
  }

  [(PKPaymentPassDetailActivationFooterView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v43.receiver = self;
  v43.super_class = (Class)PKPaymentPassDetailActivationFooterView;
  [(PKPaymentPassDetailActivationFooterView *)&v43 layoutSubviews];
  int v3 = [(PKPaymentPassDetailActivationFooterView *)self _shouldReverseLayoutDirection];
  v4 = [(PKPaymentPassDetailActivationFooterView *)self contentView];
  [v4 bounds];
  [v4 directionalLayoutMargins];
  UIRectInset();
  uint64_t v6 = v5;
  unint64_t v8 = v7;
  double v10 = v9;
  double v12 = v11;
  -[UILabel sizeThatFits:](self->_footerTextLabel, "sizeThatFits:", v9, v11);
  double v14 = v13;
  unint64_t v16 = v15;
  uint64_t v17 = v6;
  unint64_t v18 = v8;
  double v19 = v10;
  double v20 = v12;
  if (v3) {
    v21.n128_f64[0] = CGRectGetMaxX(*(CGRect *)&v17) - v14;
  }
  else {
    v21.n128_f64[0] = CGRectGetMinX(*(CGRect *)&v17);
  }
  footerTextLabel = self->_footerTextLabel;
  v22.n128_u64[0] = v8;
  v23.n128_f64[0] = v14;
  v24.n128_u64[0] = v16;
  PKRectRoundToPixel(v21, v22, v23, v24, v25);
  -[UILabel setFrame:](footerTextLabel, "setFrame:");
  activationButton = self->_activationButton;
  if (activationButton)
  {
    -[UIButton sizeThatFits:](activationButton, "sizeThatFits:", v10, v12);
    double v29 = v28;
    unint64_t v31 = v30;
    uint64_t v32 = v6;
    unint64_t v33 = v8;
    double v34 = v10;
    double v35 = v12;
    if (v3) {
      double MinX = CGRectGetMaxX(*(CGRect *)&v32) - v29;
    }
    else {
      double MinX = CGRectGetMinX(*(CGRect *)&v32);
    }
    [(UILabel *)self->_footerTextLabel frame];
    v37.n128_u64[0] = CGRectGetMaxY(v44);
    v38.n128_f64[0] = fmin(v29, v10);
    v39 = self->_activationButton;
    v40.n128_f64[0] = MinX;
    v41.n128_u64[0] = v31;
    PKRectRoundToPixel(v40, v37, v38, v41, v42);
    -[UIButton setFrame:](v39, "setFrame:");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(PKPaymentPassDetailActivationFooterView *)self contentView];
  [v6 directionalLayoutMargins];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  [(PKPaymentPassDetailActivationFooterView *)self directionalLayoutMargins];
  double v17 = fmax(width - v10 - v14 - v15 - v16, 0.0);
  -[UILabel sizeThatFits:](self->_footerTextLabel, "sizeThatFits:", v17, height);
  double v19 = v18;
  double v20 = [(UIButton *)self->_activationButton superview];
  if (v20)
  {
    -[UIButton sizeThatFits:](self->_activationButton, "sizeThatFits:", v17, height);
    double v22 = v21;
  }
  else
  {
    double v22 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v23 = v8 + v12 + v22;
  __n128 v24 = [(UILabel *)self->_footerTextLabel text];
  uint64_t v25 = [v24 length];

  double v26 = -0.0;
  if (v25) {
    double v26 = v19;
  }
  double v27 = v23 + v26;
  double v28 = width;
  result.double height = v27;
  result.double width = v28;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationButton, 0);

  objc_storeStrong((id *)&self->_footerTextLabel, 0);
}

@end