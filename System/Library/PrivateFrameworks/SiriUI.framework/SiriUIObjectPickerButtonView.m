@interface SiriUIObjectPickerButtonView
+ (double)defaultHeight;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SiriUIObjectPickerButtonView)initWithFrame:(CGRect)a3;
- (UIButton)button;
- (void)layoutSubviews;
@end

@implementation SiriUIObjectPickerButtonView

- (SiriUIObjectPickerButtonView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SiriUIObjectPickerButtonView;
  v3 = -[SiriUIObjectPickerButtonView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F1C488] buttonWithType:1];
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    v6 = v3->_button;
    [(SiriUIObjectPickerButtonView *)v3 bounds];
    -[UIButton setFrame:](v6, "setFrame:");
    v7 = [(UIButton *)v3->_button titleLabel];
    v8 = objc_msgSend(MEMORY[0x263F1C658], "siriui_mediumWeightBodySizeFont");
    [v7 setFont:v8];

    v9 = v3->_button;
    v10 = objc_msgSend(MEMORY[0x263F1C550], "siriui_textColor");
    [(UIButton *)v9 setTintColor:v10];

    v11 = v3->_button;
    v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
    v13 = [v12 siriUILocalizedStringForKey:@"CHOOSE_CONTACT_BUTTON_TITLE"];
    [(UIButton *)v11 setTitle:v13 forState:0];

    [(SiriUIObjectPickerButtonView *)v3 addSubview:v3->_button];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SiriUIObjectPickerButtonView;
  [(SiriUIObjectPickerButtonView *)&v3 layoutSubviews];
  [(SiriUIObjectPickerButtonView *)self bounds];
  -[UIButton setFrame:](self->_button, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(id)objc_opt_class() defaultHeight];
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

+ (double)defaultHeight
{
  BOOL v2 = SiriUIIsCompactWidth();
  objc_super v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 scale];

  double result = 50.0;
  if (v2) {
    return 44.0;
  }
  return result;
}

- (UIButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
}

@end