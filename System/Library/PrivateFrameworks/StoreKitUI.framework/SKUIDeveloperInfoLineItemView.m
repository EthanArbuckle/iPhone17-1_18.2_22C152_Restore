@interface SKUIDeveloperInfoLineItemView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUIDeveloperInfoLineItemView)initWithLabel:(id)a3 value:(id)a4;
- (UIEdgeInsets)contentInset;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SKUIDeveloperInfoLineItemView

- (SKUIDeveloperInfoLineItemView)initWithLabel:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDeveloperInfoLineItemView initWithLabel:value:]();
  }
  v26.receiver = self;
  v26.super_class = (Class)SKUIDeveloperInfoLineItemView;
  v8 = [(SKUIDeveloperInfoLineItemView *)&v26 init];
  if (v8)
  {
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    labelLabel = v8->_labelLabel;
    v8->_labelLabel = v9;

    v11 = v8->_labelLabel;
    v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
    [(UILabel *)v11 setFont:v12];

    [(UILabel *)v8->_labelLabel setNumberOfLines:2];
    [(UILabel *)v8->_labelLabel setTextAlignment:1];
    v13 = v8->_labelLabel;
    v14 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.4];
    [(UILabel *)v13 setTextColor:v14];

    [(UILabel *)v8->_labelLabel setText:v6];
    [(SKUIDeveloperInfoLineItemView *)v8 addSubview:v8->_labelLabel];
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    valueLabel = v8->_valueLabel;
    v8->_valueLabel = v15;

    v17 = v8->_valueLabel;
    v18 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
    [(UILabel *)v17 setFont:v18];

    [(UILabel *)v8->_valueLabel setNumberOfLines:0];
    [(UILabel *)v8->_valueLabel setTextAlignment:1];
    v19 = v8->_valueLabel;
    v20 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.8];
    [(UILabel *)v19 setTextColor:v20];

    [(UILabel *)v8->_valueLabel setText:v7];
    [(SKUIDeveloperInfoLineItemView *)v8 addSubview:v8->_valueLabel];
    v21 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separatorView = v8->_separatorView;
    v8->_separatorView = v21;

    v23 = v8->_separatorView;
    v24 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(UIView *)v23 setBackgroundColor:v24];

    [(SKUIDeveloperInfoLineItemView *)v8 addSubview:v8->_separatorView];
  }

  return v8;
}

- (void)layoutSubviews
{
  [(SKUIDeveloperInfoLineItemView *)self bounds];
  double top = self->_contentInset.top;
  double v5 = v4 - self->_contentInset.left - self->_contentInset.right;
  labelLabel = self->_labelLabel;
  if (labelLabel)
  {
    [(UILabel *)labelLabel frame];
    double left = self->_contentInset.left;
    -[UILabel sizeThatFits:](self->_labelLabel, "sizeThatFits:", v5, 1.79769313e308);
    CGFloat v9 = v8;
    -[UILabel setFrame:](self->_labelLabel, "setFrame:", left, top, v5, v8);
    v17.origin.x = left;
    v17.origin.y = top;
    v17.size.width = v5;
    v17.size.height = v9;
    double top = CGRectGetMaxY(v17);
  }
  valueLabel = self->_valueLabel;
  if (valueLabel)
  {
    [(UILabel *)valueLabel frame];
    double v11 = self->_contentInset.left;
    if (self->_labelLabel) {
      double top = top + 3.0;
    }
    -[UILabel sizeThatFits:](self->_valueLabel, "sizeThatFits:", v5, 1.79769313e308);
    CGFloat v13 = v12;
    -[UILabel setFrame:](self->_valueLabel, "setFrame:", v11, top, v5, v12);
    v18.origin.x = v11;
    v18.origin.y = top;
    v18.size.width = v5;
    v18.size.height = v13;
    CGRectGetMaxY(v18);
  }
  v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v14 scale];

  separatorView = self->_separatorView;

  -[UIView setFrame:](separatorView, "setFrame:");
}

- (void)setBackgroundColor:(id)a3
{
  labelLabel = self->_labelLabel;
  id v5 = a3;
  [(UILabel *)labelLabel setBackgroundColor:v5];
  [(UILabel *)self->_valueLabel setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SKUIDeveloperInfoLineItemView;
  [(SKUIDeveloperInfoLineItemView *)&v6 setBackgroundColor:v5];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v5 = self->_contentInset.top + self->_contentInset.bottom;
  double v6 = a3.width - self->_contentInset.left - self->_contentInset.right;
  labelLabel = self->_labelLabel;
  if (labelLabel)
  {
    -[UILabel sizeThatFits:](labelLabel, "sizeThatFits:", v6, 1.79769313e308);
    double v5 = v5 + v8;
  }
  valueLabel = self->_valueLabel;
  if (valueLabel)
  {
    -[UILabel sizeThatFits:](valueLabel, "sizeThatFits:", v6, 1.79769313e308);
    double v5 = v5 + v10;
  }
  if (self->_labelLabel && self->_valueLabel) {
    double v5 = v5 + 3.0;
  }
  double v11 = width;
  double v12 = v5;
  result.height = v12;
  result.CGFloat width = v11;
  return result;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);

  objc_storeStrong((id *)&self->_labelLabel, 0);
}

- (void)initWithLabel:value:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDeveloperInfoLineItemView initWithLabel:value:]";
}

@end