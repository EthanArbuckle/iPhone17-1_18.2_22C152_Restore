@interface SKUIModernChartHeaderView
- (SKUIModernChartHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTitle:(id)a3;
@end

@implementation SKUIModernChartHeaderView

- (SKUIModernChartHeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIModernChartHeaderView initWithFrame:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIModernChartHeaderView;
  v8 = -[SKUIModernChartHeaderView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    contentView = v8->_contentView;
    v8->_contentView = v9;

    [(SKUIModernChartHeaderView *)v8 addSubview:v8->_contentView];
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v8->_label;
    v8->_label = v11;

    [(UIView *)v8->_contentView addSubview:v8->_label];
  }
  return v8;
}

- (void)setTitle:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB08E8];
  uint64_t v5 = *MEMORY[0x1E4FB28E0];
  id v6 = a3;
  id v21 = [v4 preferredFontDescriptorWithTextStyle:v5 addingSymbolicTraits:2 options:2];
  v7 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v21 size:0.0];
  v8 = (void *)[objc_alloc(NSNumber) initWithDouble:1.3];
  id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v10 = objc_msgSend(v9, "initWithObjectsAndKeys:", v7, *MEMORY[0x1E4FB06F8], v8, *MEMORY[0x1E4FB0710], 0);
  v11 = [v6 uppercaseString];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v11 attributes:v10];
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
  [(SKUIModernChartHeaderView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)SKUIModernChartHeaderView;
  [(SKUIModernChartHeaderView *)&v10 layoutSubviews];
  [(SKUIModernChartHeaderView *)self bounds];
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

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIModernChartHeaderView initWithFrame:]";
}

@end