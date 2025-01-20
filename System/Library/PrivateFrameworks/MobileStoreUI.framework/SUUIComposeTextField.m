@interface SUUIComposeTextField
+ (id)labelColorForStyle:(int64_t)a3;
+ (id)labelFontForStyle:(int64_t)a3;
- (BOOL)isValid;
- (BOOL)textField:(id)a3 shouldInsertText:(id)a4 replacingRange:(_NSRange)a5;
- (NSString)text;
- (SUUIComposeTextField)initWithConfiguration:(id)a3 style:(int64_t)a4;
- (SUUIComposeTextFieldConfiguration)configuration;
- (UITextField)textField;
- (id)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)composeReviewStyle;
- (void)_textChanged:(id)a3;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SUUIComposeTextField

- (SUUIComposeTextField)initWithConfiguration:(id)a3 style:(int64_t)a4
{
  id v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SUUIComposeTextField;
  v8 = -[SUUIComposeTextField initWithFrame:](&v26, sel_initWithFrame_, 0.0, 0.0, 0.0, 44.0);
  v9 = v8;
  if (v8)
  {
    p_configuration = (id *)&v8->_configuration;
    objc_storeStrong((id *)&v8->_configuration, a3);
    v9->_style = a4;
    v11 = [(id)objc_opt_class() labelFontForStyle:a4];
    v12 = [*p_configuration label];
    if (v12)
    {
      v13 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
      label = v9->_label;
      v9->_label = v13;

      [(UILabel *)v9->_label setFont:v11];
      [(UILabel *)v9->_label setText:v12];
      v15 = v9->_label;
      v16 = [(id)objc_opt_class() labelColorForStyle:a4];
      [(UILabel *)v15 setTextColor:v16];

      [(UILabel *)v9->_label sizeToFit];
      [(SUUIComposeTextField *)v9 addSubview:v9->_label];
    }
    v17 = (UITextField *)objc_alloc_init(MEMORY[0x263F82CF0]);
    textField = v9->_textField;
    v9->_textField = v17;

    [(UITextField *)v9->_textField addTarget:v9 action:sel__textChanged_ forControlEvents:0x20000];
    [(UITextField *)v9->_textField setAutocapitalizationType:2];
    [(UITextField *)v9->_textField setAutocorrectionType:0];
    [(UITextField *)v9->_textField setDelegate:v9];
    v19 = v9->_textField;
    v20 = [(id)objc_opt_class() labelFontForStyle:v9->_style];
    [(UITextField *)v19 setFont:v20];

    [(UITextField *)v9->_textField setKeyboardType:0];
    v21 = v9->_textField;
    v22 = [v7 placeholder];
    [(UITextField *)v21 setPlaceholder:v22];

    [(UITextField *)v9->_textField setClipsToBounds:0];
    v23 = [*p_configuration value];
    [(SUUIComposeTextField *)v9 setText:v23];

    [(SUUIComposeTextField *)v9 addSubview:v9->_textField];
    [(UITextField *)v9->_textField sizeToFit];
    v24 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(SUUIComposeTextField *)v9 setBackgroundColor:v24];
  }
  return v9;
}

- (void)dealloc
{
  [(UITextField *)self->_textField removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)SUUIComposeTextField;
  [(SUUIComposeTextField *)&v3 dealloc];
}

+ (id)labelFontForStyle:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x263F81708], "systemFontOfSize:", a3, 17.0);
}

+ (id)labelColorForStyle:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x263F825C8], "secondaryLabelColor", a3);
}

- (SUUIComposeTextFieldConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)isValid
{
  return self->_currentTextLength > 0;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)text
{
  return [(UITextField *)self->_textField text];
}

- (void)setText:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [v7 length];
  if (v4 <= [(SUUIComposeTextFieldConfiguration *)self->_configuration maxLength])
  {
    id v6 = v7;
  }
  else
  {
    uint64_t v5 = objc_msgSend(v7, "substringToIndex:", -[SUUIComposeTextFieldConfiguration maxLength](self->_configuration, "maxLength"));

    id v6 = (id)v5;
  }
  id v8 = v6;
  [(UITextField *)self->_textField setText:v6];
  self->_currentTextLength = [v8 length];
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v4 = 0;
  if ([(SUUIComposeTextFieldConfiguration *)self->_configuration columnIndex])
  {
    double v5 = 0.0;
  }
  else
  {
    double v5 = 15.0;
  }
  [(SUUIComposeTextFieldConfiguration *)self->_configuration borderInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(SUUIComposeTextField *)self bounds];
  CGFloat v46 = v15;
  CGFloat v47 = v14;
  double v17 = v16;
  CGFloat v19 = v18;
  v20 = [MEMORY[0x263F825C8] labelColor];
  v21 = [v20 colorWithAlphaComponent:0.2];
  [v21 set];

  uint64_t v22 = [(SUUIComposeTextField *)self effectiveUserInterfaceLayoutDirection];
  uint64_t v23 = v22;
  if (v7 > 0.0)
  {
    double v24 = v17 - v5;
    if (v22 == 1)
    {
      double v25 = CGRectWithFlippedOriginRelativeToBoundingRect(v5, 0.0, v24, v7, v47, v46, v17, v19);
      uint64_t v4 = v26;
      double v7 = v27;
    }
    else
    {
      double v25 = v5;
    }
    uint64_t v28 = v4;
    double v29 = v7;
    UIRectFillUsingBlendMode(*(CGRect *)(&v24 - 2), kCGBlendModeNormal);
  }
  if (v11 > 0.0)
  {
    double v30 = v17 - v5;
    double v31 = v19 - v11;
    if (v23 == 1)
    {
      double v5 = CGRectWithFlippedOriginRelativeToBoundingRect(v5, v31, v30, v11, v47, v46, v17, v19);
      double v11 = v32;
    }
    double v33 = v5;
    double v34 = v11;
    UIRectFillUsingBlendMode(*(CGRect *)(&v31 - 1), kCGBlendModeNormal);
  }
  if (v9 > 0.0)
  {
    uint64_t v35 = 0;
    if (v23 == 1)
    {
      double v36 = CGRectWithFlippedOriginRelativeToBoundingRect(0.0, 0.0, v9, v19, v47, v46, v17, v19);
      double v9 = v38;
    }
    else
    {
      CGFloat v37 = v19;
      double v36 = 0.0;
    }
    double v39 = v9;
    UIRectFillUsingBlendMode(*(CGRect *)(&v35 - 1), kCGBlendModeNormal);
  }
  if (v13 > 0.0)
  {
    CGFloat v40 = v17 - v13;
    uint64_t v41 = 0;
    if (v23 == 1)
    {
      CGFloat v40 = CGRectWithFlippedOriginRelativeToBoundingRect(v40, 0.0, v13, v19, v47, v46, v17, v19);
      double v13 = v42;
      CGFloat v19 = v43;
    }
    double v44 = v13;
    CGFloat v45 = v19;
    UIRectFillUsingBlendMode(*(CGRect *)&v40, kCGBlendModeNormal);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIComposeTextField;
  -[SUUIComposeTextField hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (UITextField *)objc_claimAutoreleasedReturnValue();
  if (v5 == (UITextField *)self)
  {
    double v5 = self->_textField;
  }
  return v5;
}

- (void)layoutSubviews
{
  [(SUUIComposeTextField *)self bounds];
  CGFloat v28 = v3;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  uint64_t v10 = [(SUUIComposeTextField *)self effectiveUserInterfaceLayoutDirection];
  label = self->_label;
  if (label)
  {
    [(UILabel *)label frame];
    double width = v30.size.width;
    double height = v30.size.height;
    float v14 = (v9 - v30.size.height) * 0.5;
    double v15 = floorf(v14);
    double v16 = 15.0;
    v30.origin.x = 15.0;
    v30.origin.y = v15;
    double MaxX = CGRectGetMaxX(v30);
    double v18 = 4.0;
    if (v10 == 1)
    {
      double v16 = CGRectWithFlippedOriginRelativeToBoundingRect(15.0, v15, width, height, v28, v5, v7, v9);
      double v18 = 4.0;
      double v15 = v19;
      double width = v20;
      double height = v21;
    }
    double v22 = MaxX + v18;
    -[UILabel setFrame:](self->_label, "setFrame:", v16, v15, width, height);
  }
  else
  {
    double v22 = 15.0;
  }
  [(UITextField *)self->_textField frame];
  float v24 = (v9 - v23) * 0.5;
  double v25 = floorf(v24);
  double v26 = v7 + -15.0 - v22;
  if (v10 == 1) {
    double v22 = CGRectWithFlippedOriginRelativeToBoundingRect(v22, v25, v26, v23, v28, v5, v7, v9);
  }
  textField = self->_textField;
  -[UITextField setFrame:](textField, "setFrame:", v22, v25, v26);
}

- (BOOL)textField:(id)a3 shouldInsertText:(id)a4 replacingRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v8 = a4;
  if (self->_currentTextLength <= location + length) {
    int64_t currentTextLength = location + length;
  }
  else {
    int64_t currentTextLength = self->_currentTextLength;
  }
  if ([(SUUIComposeTextFieldConfiguration *)self->_configuration maxLength]) {
    int64_t v10 = [(SUUIComposeTextFieldConfiguration *)self->_configuration maxLength];
  }
  else {
    int64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v11 = [v8 length] - length + currentTextLength;
  if (v11 <= v10) {
    self->_int64_t currentTextLength = v11 & ~(v11 >> 63);
  }
  BOOL v12 = v11 <= v10;

  return v12;
}

- (void)_textChanged:(id)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  [WeakRetained composeTextFieldValidityChanged:self];
}

- (int64_t)composeReviewStyle
{
  return self->_style;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (UITextField)textField
{
  return self->_textField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end