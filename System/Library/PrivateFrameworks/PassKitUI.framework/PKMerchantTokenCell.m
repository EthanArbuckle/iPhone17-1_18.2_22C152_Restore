@interface PKMerchantTokenCell
- (PKMerchantTokenCell)initWithFrame:(CGRect)a3;
- (void)_setUpConstraints;
- (void)_setUpIconView;
- (void)_setUpIconViewConstraints;
- (void)_setUpNameLabel;
- (void)_setUpSelf;
- (void)_setUpSeparatorConstraints;
- (void)_setUpStackView;
- (void)_setUpStackViewConstraints;
- (void)_setUpViews;
- (void)updateCellWithMerchantToken:(id)a3 showMerchantIcon:(BOOL)a4;
@end

@implementation PKMerchantTokenCell

- (PKMerchantTokenCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKMerchantTokenCell;
  v3 = -[PKMerchantTokenCell initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v4 = v3;
  if (v3)
  {
    [(PKMerchantTokenCell *)v3 _setUpViews];
    [(PKMerchantTokenCell *)v4 _setUpConstraints];
  }
  return v4;
}

- (void)updateCellWithMerchantToken:(id)a3 showMerchantIcon:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v19 = v6;
  if (!v4)
  {
    [(UIStackView *)self->_stackView removeFromSuperview];
    v11 = [(PKMerchantTokenCell *)self defaultContentConfiguration];
    v12 = [v19 merchantName];
    [v11 setText:v12];

    [(PKMerchantTokenCell *)self setContentConfiguration:v11];
    goto LABEL_10;
  }
  if ([v6 isAMPPaymentToken])
  {
    iconView = self->_iconView;
    v8 = PKUIImageNamed(@"MerchantTokenAppleMerchantIcon45");
    double v9 = 4.0;
    v10 = iconView;
  }
  else
  {
    if (![v19 isAppleCashPaymentToken])
    {
      v16 = self->_iconView;
      v8 = [v19 merchantIconURL];
      v17 = [v19 merchantName];
      [(PKMerchantTokenIconView *)v16 updateWithImageURL:v8 monogramText:v17 cornerRadius:4.0];

      goto LABEL_9;
    }
    v13 = PKPassKitUIBundle();
    v14 = [v13 URLForResource:@"AppleCashIcon" withExtension:@"pdf"];
    double v15 = PKUIScreenScale();
    v8 = PKUIImageFromPDF(v14, 45.0, 45.0, v15);

    v10 = self->_iconView;
    double v9 = 4.0;
  }
  [(PKMerchantTokenIconView *)v10 updateWithImage:v8 cornerRadius:v9];
LABEL_9:

  nameLabel = self->_nameLabel;
  v11 = [v19 merchantName];
  [(UILabel *)nameLabel setText:v11];
LABEL_10:
}

- (void)_setUpViews
{
  [(PKMerchantTokenCell *)self _setUpSelf];
  [(PKMerchantTokenCell *)self _setUpStackView];
  [(PKMerchantTokenCell *)self _setUpIconView];

  [(PKMerchantTokenCell *)self _setUpNameLabel];
}

- (void)_setUpSelf
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1518]);
  v5[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(PKMerchantTokenCell *)self setAccessories:v4];
}

- (void)_setUpStackView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1C60]);
  BOOL v4 = (UIStackView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  stackView = self->_stackView;
  self->_stackView = v4;

  [(UIStackView *)self->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView setAlignment:3];
  [(UIStackView *)self->_stackView setSpacing:12.0];
  id v6 = [(PKMerchantTokenCell *)self contentView];
  [v6 addSubview:self->_stackView];
}

- (void)_setUpIconView
{
  id v3 = [PKMerchantTokenIconView alloc];
  BOOL v4 = -[PKMerchantTokenIconView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  iconView = self->_iconView;
  self->_iconView = v4;

  stackView = self->_stackView;
  v7 = self->_iconView;

  [(UIStackView *)stackView addArrangedSubview:v7];
}

- (void)_setUpNameLabel
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  BOOL v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  nameLabel = self->_nameLabel;
  self->_nameLabel = v4;

  [(UILabel *)self->_nameLabel setNumberOfLines:2];
  id v6 = self->_nameLabel;
  v7 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB2788]);
  [(UILabel *)v6 setFont:v7];

  stackView = self->_stackView;
  double v9 = self->_nameLabel;

  [(UIStackView *)stackView addArrangedSubview:v9];
}

- (void)_setUpConstraints
{
  [(PKMerchantTokenCell *)self _setUpStackViewConstraints];
  [(PKMerchantTokenCell *)self _setUpIconViewConstraints];

  [(PKMerchantTokenCell *)self _setUpSeparatorConstraints];
}

- (void)_setUpStackViewConstraints
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(PKMerchantTokenCell *)self contentView];
  v13 = [v3 layoutMarginsGuide];
  v14 = (void *)MEMORY[0x1E4F28DC8];
  v18 = [(UIStackView *)self->_stackView topAnchor];
  v17 = [v3 topAnchor];
  v16 = [v18 constraintEqualToAnchor:v17 constant:15.0];
  v19[0] = v16;
  double v15 = [(UIStackView *)self->_stackView bottomAnchor];
  BOOL v4 = [v3 bottomAnchor];
  v5 = [v15 constraintEqualToAnchor:v4 constant:-16.0];
  v19[1] = v5;
  id v6 = [(UIStackView *)self->_stackView leadingAnchor];
  v7 = [v3 leadingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7 constant:13.0];
  v19[2] = v8;
  double v9 = [(UIStackView *)self->_stackView trailingAnchor];
  v10 = [v13 trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v19[3] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  [v14 activateConstraints:v12];
}

- (void)_setUpIconViewConstraints
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28DC8];
  BOOL v4 = [(PKMerchantTokenIconView *)self->_iconView widthAnchor];
  v5 = [v4 constraintEqualToConstant:45.0];
  v9[0] = v5;
  id v6 = [(PKMerchantTokenIconView *)self->_iconView heightAnchor];
  v7 = [v6 constraintEqualToConstant:45.0];
  v9[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  [v3 activateConstraints:v8];
}

- (void)_setUpSeparatorConstraints
{
  id v6 = [(PKMerchantTokenCell *)self separatorLayoutGuide];
  id v3 = [v6 leadingAnchor];
  BOOL v4 = [(UIStackView *)self->_stackView leadingAnchor];
  v5 = [v3 constraintEqualToAnchor:v4];
  [v5 setActive:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end