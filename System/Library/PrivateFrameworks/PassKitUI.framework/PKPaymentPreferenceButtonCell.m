@interface PKPaymentPreferenceButtonCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)buttonTitle;
- (PKPaymentPreferenceButtonCell)initWithReuseIdentifier:(id)a3;
- (id)handler;
- (id)pk_childrenForAppearance;
- (void)buttonTapped:(id)a3;
- (void)layoutSubviews;
- (void)setButtonTitle:(id)a3;
- (void)setHandler:(id)a3;
@end

@implementation PKPaymentPreferenceButtonCell

- (PKPaymentPreferenceButtonCell)initWithReuseIdentifier:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentPreferenceButtonCell;
  v5 = [(PKPaymentPreferenceCell *)&v25 initWithReuseIdentifier:v4];
  if (v5)
  {
    v6 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v7 = [v6 userInterfaceLayoutDirection];

    v8 = (void *)MEMORY[0x1E4FB14D8];
    v9 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], 0);
    v10 = objc_msgSend(v8, "pkui_plainConfigurationWithTitle:font:", 0, v9);

    v11 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v10 setBaseForegroundColor:v11];

    if (v7 == 1) {
      double v12 = 0.0;
    }
    else {
      double v12 = 16.0;
    }
    objc_msgSend(v10, "setContentInsets:", 0.0, v12);
    objc_initWeak(&location, v5);
    v13 = (void *)MEMORY[0x1E4FB13F0];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __57__PKPaymentPreferenceButtonCell_initWithReuseIdentifier___block_invoke;
    v22[3] = &unk_1E59CBEE0;
    objc_copyWeak(&v23, &location);
    v14 = [v13 actionWithHandler:v22];
    uint64_t v15 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v10 primaryAction:v14];
    button = v5->_button;
    v5->_button = (UIButton *)v15;

    v17 = v5->_button;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __57__PKPaymentPreferenceButtonCell_initWithReuseIdentifier___block_invoke_2;
    v20[3] = &__block_descriptor_33_e18_v16__0__UIButton_8l;
    BOOL v21 = v7 == 1;
    [(UIButton *)v17 setConfigurationUpdateHandler:v20];
    v18 = [(PKPaymentPreferenceButtonCell *)v5 contentView];
    [v18 addSubview:v5->_button];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __57__PKPaymentPreferenceButtonCell_initWithReuseIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 sender];

  [WeakRetained buttonTapped:v4];
}

void __57__PKPaymentPreferenceButtonCell_initWithReuseIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 titleLabel];
  [v3 setTextAlignment:2 * *(unsigned __int8 *)(a1 + 32)];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentPreferenceButtonCell;
  [(PKPaymentPreferenceButtonCell *)&v12 layoutSubviews];
  id v3 = [(PKPaymentPreferenceButtonCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIButton setFrame:](self->_button, "setFrame:", v5, v7, v9, v11);
}

- (void)setButtonTitle:(id)a3
{
  button = self->_button;
  id v5 = a3;
  [(UIButton *)button pkui_updateConfigurationWithTitle:v5];
  double v6 = (NSString *)[v5 copy];

  buttonTitle = self->_buttonTitle;
  self->_buttonTitle = v6;
}

- (void)buttonTapped:(id)a3
{
  handler = (void (**)(void))self->_handler;
  if (handler) {
    handler[2]();
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  double v5 = 0.0;
  if ([(PKPaymentPreferenceButtonCell *)self isEditing])
  {
    [(PKPaymentPreferenceButtonCell *)self bounds];
    double v6 = CGRectGetWidth(v16);
    double v7 = [(PKPaymentPreferenceButtonCell *)self contentView];
    [v7 bounds];
    double v5 = v6 - CGRectGetWidth(v17);
  }
  double v8 = [(UIButton *)self->_button titleLabel];
  objc_msgSend(v8, "sizeThatFits:", width - v5 + -16.0, 1.79769313e308);
  double v10 = v9;
  double v12 = v11;

  double v13 = v12 + 10.0;
  double v14 = v10;
  result.height = v13;
  result.double width = v14;
  return result;
}

- (id)pk_childrenForAppearance
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_button;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end