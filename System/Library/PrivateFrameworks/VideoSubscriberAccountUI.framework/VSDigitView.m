@interface VSDigitView
- (CGSize)intrinsicContentSize;
- (UILabel)label;
- (VSDigitView)initWithFrame:(CGRect)a3;
- (void)setLabel:(id)a3;
@end

@implementation VSDigitView

- (VSDigitView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)VSDigitView;
  v3 = -[VSDigitView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] whiteColor];
    [(VSDigitView *)v3 setBackgroundColor:v4];

    v5 = [(VSDigitView *)v3 layer];
    id v6 = [MEMORY[0x263F1C550] systemGrayColor];
    objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

    v7 = [(VSDigitView *)v3 layer];
    [v7 setCornerRadius:5.0];

    id v8 = objc_alloc_init(MEMORY[0x263F1C768]);
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [MEMORY[0x263F1C550] blackColor];
    [v8 setTextColor:v9];

    v10 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2F8]];
    [v8 setFont:v10];

    [v8 setTextAlignment:1];
    [(VSDigitView *)v3 setLabel:v8];
    [(VSDigitView *)v3 addSubview:v8];
    [(VSDigitView *)v3 setUserInteractionEnabled:0];
    v11 = [v8 topAnchor];
    v12 = [(VSDigitView *)v3 topAnchor];
    v13 = [v11 constraintEqualToAnchor:v12 constant:0.0];
    [v13 setActive:1];

    v14 = [v8 bottomAnchor];
    v15 = [(VSDigitView *)v3 bottomAnchor];
    v16 = [v14 constraintEqualToAnchor:v15 constant:0.0];
    [v16 setActive:1];

    v17 = [v8 leftAnchor];
    v18 = [(VSDigitView *)v3 leftAnchor];
    v19 = [v17 constraintEqualToAnchor:v18 constant:0.0];
    [v19 setActive:1];

    v20 = [v8 rightAnchor];
    v21 = [(VSDigitView *)v3 rightAnchor];
    v22 = [v20 constraintEqualToAnchor:v21 constant:0.0];
    [v22 setActive:1];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 40.0;
  double v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end