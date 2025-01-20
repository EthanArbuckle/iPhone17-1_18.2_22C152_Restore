@interface PKPaymentSetupHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (PKPaymentSetupHeaderView)initWithFrame:(CGRect)a3;
- (double)_leadingPadding;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setTitle:(id)a3;
@end

@implementation PKPaymentSetupHeaderView

- (PKPaymentSetupHeaderView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentSetupHeaderView;
  v3 = -[PKPaymentSetupHeaderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v3->_label;
    v3->_label = v4;

    v6 = v3->_label;
    v7 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:25.0];
    [(UILabel *)v6 setFont:v7];

    [(PKPaymentSetupHeaderView *)v3 addSubview:v3->_label];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PKPaymentSetupHeaderView *)self _leadingPadding];
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", width + v6 * -2.0, height);
  double v8 = v7 + 10.0;
  double v9 = width;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupHeaderView;
  [(PKPaymentSetupHeaderView *)&v11 layoutSubviews];
  [(PKPaymentSetupHeaderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(PKPaymentSetupHeaderView *)self _leadingPadding];
  double v8 = v7;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v4 + v7 * -2.0, v6);
  -[UILabel setFrame:](self->_label, "setFrame:", v8, 5.0, v9, v10);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupHeaderView;
  [(PKPaymentSetupHeaderView *)&v3 prepareForReuse];
  [(UILabel *)self->_label setText:0];
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  [(UILabel *)self->_label setText:v5];

  [(PKPaymentSetupHeaderView *)self setNeedsLayout];
}

- (double)_leadingPadding
{
  v2 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  [v2 directionalLayoutMargins];
  double v4 = v3;

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end