@interface SUUIModernChartHeaderView
- (SUUIModernChartHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTitle:(id)a3;
@end

@implementation SUUIModernChartHeaderView

- (SUUIModernChartHeaderView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIModernChartHeaderView;
  v3 = -[SUUIModernChartHeaderView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    contentView = v3->_contentView;
    v3->_contentView = v4;

    [(SUUIModernChartHeaderView *)v3 addSubview:v3->_contentView];
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    label = v3->_label;
    v3->_label = v6;

    [(UIView *)v3->_contentView addSubview:v3->_label];
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  v4 = (void *)MEMORY[0x263F81720];
  uint64_t v5 = *MEMORY[0x263F83590];
  id v6 = a3;
  id v21 = [v4 preferredFontDescriptorWithTextStyle:v5 addingSymbolicTraits:2 options:2];
  v7 = [MEMORY[0x263F81708] fontWithDescriptor:v21 size:0.0];
  v8 = (void *)[objc_alloc(NSNumber) initWithDouble:1.3];
  id v9 = objc_alloc(NSDictionary);
  v10 = objc_msgSend(v9, "initWithObjectsAndKeys:", v7, *MEMORY[0x263F814F0], v8, *MEMORY[0x263F81510], 0);
  v11 = [v6 uppercaseString];

  v12 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v11 attributes:v10];
  [(UILabel *)self->_label setAttributedText:v12];
  [v7 _scaledValueForValue:16.0];
  double v14 = v13;
  [(UILabel *)self->_label _firstBaselineOffsetFromTop];
  double v16 = v14 - v15;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v18 = v17;
  -[UILabel setFrame:](self->_label, "setFrame:", 0.0, v16, v17, v19);
  [v7 _scaledValueForValue:24.0];
  -[UIView setFrame:](self->_contentView, "setFrame:", 0.0, 0.0, v18, v20);
  [(SUUIModernChartHeaderView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIModernChartHeaderView;
  [(SUUIModernChartHeaderView *)&v10 layoutSubviews];
  [(SUUIModernChartHeaderView *)self bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  double v7 = CGRectGetWidth(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v12);
  [(UIView *)self->_contentView frame];
  CGFloat v9 = CGRectGetHeight(v13);
  -[UIView setFrame:](self->_contentView, "setFrame:", 0.0, floor((v8 - v9) * 0.5), v7, v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end