@interface COSMigrationChoiceHeaderView
- (CGRect)_computedFrameForTextLabel;
- (CGSize)sizeThatFits:(CGSize)a3;
- (COSMigrationChoiceHeaderView)initWithFrame:(CGRect)a3;
- (UILabel)titleLabel;
- (void)layoutSubviews;
- (void)setTitleLabel:(id)a3;
@end

@implementation COSMigrationChoiceHeaderView

- (COSMigrationChoiceHeaderView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)COSMigrationChoiceHeaderView;
  v3 = -[COSMigrationChoiceHeaderView initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = BPSSetupBackgroundColor();
    [(COSMigrationChoiceHeaderView *)v3 setBackgroundColor:v4];

    v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v5;

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    v7 = v3->_titleLabel;
    v8 = +[UIFont systemFontOfSize:24.0 weight:UIFontWeightMedium];
    [(UILabel *)v7 setFont:v8];

    v9 = v3->_titleLabel;
    v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"BIXBY_HEADER_TITLE" value:&stru_100249230 table:@"Localizable"];
    [(UILabel *)v9 setText:v11];

    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    v12 = v3->_titleLabel;
    v13 = BPSTextColor();
    [(UILabel *)v12 setTextColor:v13];

    [(COSMigrationChoiceHeaderView *)v3 addSubview:v3->_titleLabel];
  }
  return v3;
}

- (CGRect)_computedFrameForTextLabel
{
  [(COSMigrationChoiceHeaderView *)self bounds];
  CGFloat v3 = CGRectGetWidth(v9) + -28.0;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v3, 0.0);
  double v5 = v4;
  double v6 = 14.0;
  double v7 = 14.0;
  double v8 = v3;
  result.size.height = v5;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)layoutSubviews
{
  titleLabel = self->_titleLabel;
  [(COSMigrationChoiceHeaderView *)self _computedFrameForTextLabel];

  -[UILabel setFrame:](titleLabel, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(COSMigrationChoiceHeaderView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(COSMigrationChoiceHeaderView *)self _computedFrameForTextLabel];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  CGFloat Width = CGRectGetWidth(v24);
  v25.origin.x = v13;
  v25.origin.y = v15;
  v25.size.width = v17;
  v25.size.height = v19;
  double v21 = CGRectGetMaxY(v25) + 25.0;
  double v22 = Width;
  result.height = v21;
  result.width = v22;
  return result;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end