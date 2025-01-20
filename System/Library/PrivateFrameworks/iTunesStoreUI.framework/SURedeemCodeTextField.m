@interface SURedeemCodeTextField
- (NSString)placeholder;
- (NSString)text;
- (SURedeemCodeTextField)initWithHeight:(double)a3;
- (UITextField)textField;
- (UITextFieldDelegate)delegate;
- (UIVisualEffectView)visualEffectView;
- (double)height;
- (void)_setupSubviews;
- (void)_setupTextField;
- (void)_setupVisualEffectView;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setText:(id)a3;
- (void)setTextField:(id)a3;
- (void)setVisualEffectView:(id)a3;
@end

@implementation SURedeemCodeTextField

- (SURedeemCodeTextField)initWithHeight:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SURedeemCodeTextField;
  v4 = [(SURedeemCodeTextField *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_height = a3;
    v6 = [MEMORY[0x263F1C550] clearColor];
    [(SURedeemCodeTextField *)v5 setBackgroundColor:v6];

    [(SURedeemCodeTextField *)v5 _setupSubviews];
  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(SURedeemCodeTextField *)self textField];
  [v5 setDelegate:v4];
}

- (void)setPlaceholder:(id)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F1C658];
  id v5 = a3;
  v6 = [v4 systemFontOfSize:16.0];
  uint64_t v7 = *MEMORY[0x263F1C238];
  v15[0] = v6;
  uint64_t v8 = *MEMORY[0x263F1C240];
  v14[0] = v7;
  v14[1] = v8;
  v9 = [(SURedeemCodeTextField *)self tintColor];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x263F1C550] colorWithWhite:0.7 alpha:1.0];
  }
  v15[1] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  if (!v9) {

  }
  v12 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5 attributes:v11];
  v13 = [(SURedeemCodeTextField *)self textField];
  [v13 setAttributedPlaceholder:v12];
}

- (void)setText:(id)a3
{
  id v4 = a3;
  id v5 = [(SURedeemCodeTextField *)self textField];
  [v5 setText:v4];
}

- (UITextFieldDelegate)delegate
{
  v2 = [(SURedeemCodeTextField *)self textField];
  v3 = [v2 delegate];

  return (UITextFieldDelegate *)v3;
}

- (NSString)placeholder
{
  v2 = [(SURedeemCodeTextField *)self textField];
  v3 = [v2 placeholder];

  return (NSString *)v3;
}

- (NSString)text
{
  v2 = [(SURedeemCodeTextField *)self textField];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)_setupSubviews
{
  [(SURedeemCodeTextField *)self _setupVisualEffectView];

  [(SURedeemCodeTextField *)self _setupTextField];
}

- (void)_setupVisualEffectView
{
  id v5 = [MEMORY[0x263F1C480] effectWithStyle:10];
  v3 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v5];
  [(SURedeemCodeTextField *)self addSubview:v3];
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v3;
}

- (void)_setupTextField
{
  v3 = (UITextField *)objc_alloc_init(MEMORY[0x263F1CA98]);
  id v4 = [MEMORY[0x263F1C550] clearColor];
  [(UITextField *)v3 setBackgroundColor:v4];

  [(UITextField *)v3 setAutocorrectionType:1];
  [(UITextField *)v3 setAutocapitalizationType:3];
  id v6 = [MEMORY[0x263F1C658] systemFontOfSize:16.0];
  [(UITextField *)v3 setFont:v6];
  [(SURedeemCodeTextField *)self addSubview:v3];
  textField = self->_textField;
  self->_textField = v3;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)SURedeemCodeTextField;
  [(SURedeemCodeTextField *)&v18 layoutSubviews];
  [(SURedeemCodeTextField *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SURedeemCodeTextField *)self safeAreaInsets];
  double v12 = v11;
  [(SURedeemCodeTextField *)self safeAreaInsets];
  double v14 = v13;
  v15 = [(SURedeemCodeTextField *)self visualEffectView];
  objc_msgSend(v15, "setFrame:", v4, v6, v8, v10);

  v16 = [(SURedeemCodeTextField *)self textField];
  [(SURedeemCodeTextField *)self height];
  objc_msgSend(v16, "setFrame:", v12 + 16.0, v6, v8 - (v12 + 32.0 + v14), v17);
}

- (double)height
{
  return self->_height;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);

  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end