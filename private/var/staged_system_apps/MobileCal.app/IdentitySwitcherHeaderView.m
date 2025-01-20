@interface IdentitySwitcherHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (IdentitySwitcherHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation IdentitySwitcherHeaderView

- (IdentitySwitcherHeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)IdentitySwitcherHeaderView;
  v7 = -[IdentitySwitcherHeaderView initWithFrame:](&v19, "initWithFrame:");
  if (v7)
  {
    v8 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle2 addingSymbolicTraits:32770 options:0];
    uint64_t v9 = +[UIFont fontWithDescriptor:v8 size:0.0];
    font = v7->_font;
    v7->_font = (UIFont *)v9;

    v11 = (UILabel *)objc_alloc_init((Class)UILabel);
    label = v7->_label;
    v7->_label = v11;

    [(UILabel *)v7->_label setFont:v7->_font];
    v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"Calendars" value:&stru_1001D6918 table:0];
    [(UILabel *)v7->_label setText:v14];

    [(UILabel *)v7->_label sizeToFit];
    [(IdentitySwitcherHeaderView *)v7 addSubview:v7->_label];
    v15 = [objc_alloc((Class)UIView) initWithFrame:CGRectMake(x, y, width, height)];
    separator = v7->_separator;
    v7->_separator = v15;

    v17 = +[UIColor separatorColor];
    [(UIView *)v7->_separator setBackgroundColor:v17];

    [(IdentitySwitcherHeaderView *)v7 addSubview:v7->_separator];
  }
  return v7;
}

- (void)layoutSubviews
{
  [(IdentitySwitcherHeaderView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UILabel *)self->_label frame];
  double v12 = v11;
  double v14 = v13;
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  [(IdentitySwitcherHeaderView *)self layoutMargins];
  double v18 = v8 - v17 - v12;
  if (IsLeftToRight) {
    double v18 = v16;
  }
  -[UILabel setFrame:](self->_label, "setFrame:", v18, v10 * 0.5 - v14 * 0.5, v12, v14);
  v25.origin.double x = v4;
  v25.origin.double y = v6;
  v25.size.double width = v8;
  v25.size.double height = v10;
  double MaxY = CGRectGetMaxY(v25);
  CalOnePixelInPoints();
  double v21 = MaxY - v20;
  CalOnePixelInPoints();
  separator = self->_separator;

  -[UIView setFrame:](separator, "setFrame:", 0.0, v21, v8, v22);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[UIFont _scaledValueForValue:](self->_font, "_scaledValueForValue:", 52.0, a3.height);
  double v5 = v4;
  double v6 = width;
  result.double height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_separator, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end