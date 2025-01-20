@interface COSMigrationChoiceFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (COSMigrationChoiceFooterDelegate)delegate;
- (COSMigrationChoiceFooterView)initWithFrame:(CGRect)a3;
- (UIButton)continueButton;
- (UILabel)descriptionLabel;
- (void)layoutSubviews;
- (void)setContinueButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)tappedContinue:(id)a3;
@end

@implementation COSMigrationChoiceFooterView

- (COSMigrationChoiceFooterView)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)COSMigrationChoiceFooterView;
  v3 = -[COSMigrationChoiceFooterView initWithFrame:](&v21, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = BPSSetupBackgroundColor();
    [(COSMigrationChoiceFooterView *)v3 setBackgroundColor:v4];

    v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = v5;

    v7 = v3->_descriptionLabel;
    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"BIXBY_FOOTER_DESCRIPTION" value:&stru_100249230 table:@"Localizable"];
    [(UILabel *)v7 setText:v9];

    [(UILabel *)v3->_descriptionLabel setNumberOfLines:0];
    v10 = v3->_descriptionLabel;
    v11 = BPSTextColor();
    [(UILabel *)v10 setTextColor:v11];

    [(UILabel *)v3->_descriptionLabel setTextAlignment:1];
    [(COSMigrationChoiceFooterView *)v3 addSubview:v3->_descriptionLabel];
    uint64_t v12 = +[UIButton buttonWithType:0];
    continueButton = v3->_continueButton;
    v3->_continueButton = (UIButton *)v12;

    BPSScreenValueGetRelevantValue();
    v14 = v3->_continueButton;
    v15 = +[NSBundle mainBundle];
    v16 = [v15 localizedStringForKey:@"BIXBY_CONTINUE_BUTTON" value:&stru_100249230 table:@"Localizable"];
    v17 = BPSPillButtonImage();
    [(UIButton *)v14 setImage:v17 forState:0];

    v18 = v3->_continueButton;
    v19 = BPSTextColor();
    [(UIButton *)v18 setTintColor:v19];

    [(UIButton *)v3->_continueButton addTarget:v3 action:"tappedContinue:" forControlEvents:64];
    [(COSMigrationChoiceFooterView *)v3 addSubview:v3->_continueButton];
  }
  return v3;
}

- (void)layoutSubviews
{
  [(COSMigrationChoiceFooterView *)self bounds];
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  CGFloat v7 = CGRectGetWidth(v19) + -28.0;
  -[UILabel sizeThatFits:](self->_descriptionLabel, "sizeThatFits:", v7, 0.0);
  CGFloat v9 = v8;
  -[UILabel setFrame:](self->_descriptionLabel, "setFrame:", 14.0, 14.0, v7, v8);
  -[UIButton sizeThatFits:](self->_continueButton, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v11 = v10;
  double v13 = v12;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  float v14 = (CGRectGetWidth(v20) - v11) * 0.5;
  double v15 = floorf(v14);
  v21.origin.CGFloat x = 14.0;
  v21.origin.CGFloat y = 14.0;
  v21.size.CGFloat width = v7;
  v21.size.CGFloat height = v9;
  double MaxY = CGRectGetMaxY(v21);
  continueButton = self->_continueButton;

  -[UIButton setFrame:](continueButton, "setFrame:", v15, MaxY + 14.0, v11, v13);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(COSMigrationChoiceFooterView *)self layoutIfNeeded];
  [(COSMigrationChoiceFooterView *)self bounds];
  CGFloat Width = CGRectGetWidth(v8);
  [(UIButton *)self->_continueButton frame];
  double MaxY = CGRectGetMaxY(v9);
  double v6 = Width;
  result.CGFloat height = MaxY;
  result.CGFloat width = v6;
  return result;
}

- (void)tappedContinue:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained userTappedContinue:self];
}

- (COSMigrationChoiceFooterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSMigrationChoiceFooterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end