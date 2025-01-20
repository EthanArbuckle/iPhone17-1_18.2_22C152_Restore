@interface SUUIGiftAmountButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIGiftAmountButton)initWithFrame:(CGRect)a3;
- (void)_reloadBorderView;
- (void)drawRect:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation SUUIGiftAmountButton

- (SUUIGiftAmountButton)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)SUUIGiftAmountButton;
  v3 = -[SUUIGiftAmountButton initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    borderView = v3->_borderView;
    v3->_borderView = v4;

    [(UIView *)v3->_borderView setAutoresizingMask:18];
    v6 = v3->_borderView;
    v7 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(UIView *)v6 setBackgroundColor:v7];

    v8 = v3->_borderView;
    [(SUUIGiftAmountButton *)v3 bounds];
    -[UIView setFrame:](v8, "setFrame:");
    [(UIView *)v3->_borderView setUserInteractionEnabled:0];
    [(SUUIGiftAmountButton *)v3 addSubview:v3->_borderView];
    v9 = [(UIView *)v3->_borderView layer];
    id v10 = [MEMORY[0x263F825C8] labelColor];
    objc_msgSend(v9, "setBorderColor:", objc_msgSend(v10, "CGColor"));

    v11 = [MEMORY[0x263F82B60] mainScreen];
    [v11 scale];
    [v9 setBorderWidth:1.0 / v12];

    [v9 setCornerRadius:7.0];
    v13 = [MEMORY[0x263F825C8] labelColor];
    [(SUUIGiftAmountButton *)v3 setTitleColor:v13 forState:0];

    v14 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(SUUIGiftAmountButton *)v3 setTitleColor:v14 forState:1];

    v15 = [MEMORY[0x263F825C8] systemWhiteColor];
    [(SUUIGiftAmountButton *)v3 setTitleColor:v15 forState:4];

    v16 = [(SUUIGiftAmountButton *)v3 titleLabel];
    v17 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
    [v16 setFont:v17];

    v18 = [(SUUIGiftAmountButton *)v3 titleLabel];
    [v18 setMinimumScaleFactor:0.5];

    v19 = [(SUUIGiftAmountButton *)v3 titleLabel];
    [v19 setAdjustsFontSizeToFitWidth:1];

    v20 = [(SUUIGiftAmountButton *)v3 titleLabel];
    [v20 setNumberOfLines:1];

    v21 = [(SUUIGiftAmountButton *)v3 titleLabel];
    [v21 setLineBreakMode:2];

    -[SUUIGiftAmountButton setTitleEdgeInsets:](v3, "setTitleEdgeInsets:", 0.0, 5.0, 0.0, 5.0);
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIGiftAmountButton;
  -[SUUIGiftAmountButton drawRect:](&v4, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SUUIGiftAmountButton *)self _reloadBorderView];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIGiftAmountButton;
  [(SUUIGiftAmountButton *)&v4 setHighlighted:a3];
  [(SUUIGiftAmountButton *)self _reloadBorderView];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIGiftAmountButton;
  [(SUUIGiftAmountButton *)&v4 setSelected:a3];
  [(SUUIGiftAmountButton *)self _reloadBorderView];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIGiftAmountButton;
  -[SUUIGiftAmountButton sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  double v4 = 44.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_reloadBorderView
{
  if (([(SUUIGiftAmountButton *)self isHighlighted] & 1) != 0
    || [(SUUIGiftAmountButton *)self isSelected])
  {
    double v3 = [(SUUIGiftAmountButton *)self tintColor];
    [(UIView *)self->_borderView setBackgroundColor:v3];
    double v4 = [(UIView *)self->_borderView layer];
    objc_super v5 = v4;
    id v8 = v3;
  }
  else
  {
    borderView = self->_borderView;
    v7 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(UIView *)borderView setBackgroundColor:v7];

    objc_super v5 = [(UIView *)self->_borderView layer];
    double v4 = [MEMORY[0x263F825C8] labelColor];
    double v3 = v4;
    id v8 = v5;
  }
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(v3, "CGColor"));
}

- (void).cxx_destruct
{
}

@end