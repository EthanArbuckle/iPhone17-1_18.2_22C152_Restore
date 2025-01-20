@interface SKUIGiftAmountButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUIGiftAmountButton)initWithFrame:(CGRect)a3;
- (void)_reloadBorderView;
- (void)drawRect:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation SKUIGiftAmountButton

- (SKUIGiftAmountButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftAmountButton initWithFrame:]();
  }
  v28.receiver = self;
  v28.super_class = (Class)SKUIGiftAmountButton;
  v8 = -[SKUIGiftAmountButton initWithFrame:](&v28, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    borderView = v8->_borderView;
    v8->_borderView = v9;

    [(UIView *)v8->_borderView setAutoresizingMask:18];
    v11 = v8->_borderView;
    v12 = [MEMORY[0x1E4FB1618] _systemBackgroundColor];
    [(UIView *)v11 setBackgroundColor:v12];

    v13 = v8->_borderView;
    [(SKUIGiftAmountButton *)v8 bounds];
    -[UIView setFrame:](v13, "setFrame:");
    [(UIView *)v8->_borderView setUserInteractionEnabled:0];
    [(SKUIGiftAmountButton *)v8 addSubview:v8->_borderView];
    v14 = [(UIView *)v8->_borderView layer];
    id v15 = [MEMORY[0x1E4FB1618] _labelColor];
    objc_msgSend(v14, "setBorderColor:", objc_msgSend(v15, "CGColor"));

    v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v16 scale];
    [v14 setBorderWidth:1.0 / v17];

    [v14 setCornerRadius:7.0];
    v18 = [MEMORY[0x1E4FB1618] _labelColor];
    [(SKUIGiftAmountButton *)v8 setTitleColor:v18 forState:0];

    v19 = [MEMORY[0x1E4FB1618] _secondaryLabelColor];
    [(SKUIGiftAmountButton *)v8 setTitleColor:v19 forState:1];

    v20 = [MEMORY[0x1E4FB1618] systemWhiteColor];
    [(SKUIGiftAmountButton *)v8 setTitleColor:v20 forState:4];

    v21 = [(SKUIGiftAmountButton *)v8 titleLabel];
    v22 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
    [v21 setFont:v22];

    v23 = [(SKUIGiftAmountButton *)v8 titleLabel];
    [v23 setMinimumScaleFactor:0.5];

    v24 = [(SKUIGiftAmountButton *)v8 titleLabel];
    [v24 setAdjustsFontSizeToFitWidth:1];

    v25 = [(SKUIGiftAmountButton *)v8 titleLabel];
    [v25 setNumberOfLines:1];

    v26 = [(SKUIGiftAmountButton *)v8 titleLabel];
    [v26 setLineBreakMode:2];

    -[SKUIGiftAmountButton setTitleEdgeInsets:](v8, "setTitleEdgeInsets:", 0.0, 5.0, 0.0, 5.0);
  }
  return v8;
}

- (void)drawRect:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIGiftAmountButton;
  -[SKUIGiftAmountButton drawRect:](&v4, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SKUIGiftAmountButton *)self _reloadBorderView];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIGiftAmountButton;
  [(SKUIGiftAmountButton *)&v4 setHighlighted:a3];
  [(SKUIGiftAmountButton *)self _reloadBorderView];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIGiftAmountButton;
  [(SKUIGiftAmountButton *)&v4 setSelected:a3];
  [(SKUIGiftAmountButton *)self _reloadBorderView];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIGiftAmountButton;
  -[SKUIGiftAmountButton sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  double v4 = 44.0;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)_reloadBorderView
{
  if (([(SKUIGiftAmountButton *)self isHighlighted] & 1) != 0
    || [(SKUIGiftAmountButton *)self isSelected])
  {
    double v3 = [(SKUIGiftAmountButton *)self tintColor];
    [(UIView *)self->_borderView setBackgroundColor:v3];
    double v4 = [(UIView *)self->_borderView layer];
    objc_super v5 = v4;
    id v8 = v3;
  }
  else
  {
    borderView = self->_borderView;
    v7 = [MEMORY[0x1E4FB1618] _systemBackgroundColor];
    [(UIView *)borderView setBackgroundColor:v7];

    objc_super v5 = [(UIView *)self->_borderView layer];
    double v4 = [MEMORY[0x1E4FB1618] _labelColor];
    double v3 = v4;
    id v8 = v5;
  }
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(v3, "CGColor"));
}

- (void).cxx_destruct
{
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGiftAmountButton initWithFrame:]";
}

@end