@interface SKUIComposeTextField
+ (id)labelColorForStyle:(int64_t)a3;
+ (id)labelFontForStyle:(int64_t)a3;
- (BOOL)isValid;
- (BOOL)textField:(id)a3 shouldInsertText:(id)a4 replacingRange:(_NSRange)a5;
- (NSString)text;
- (SKUIComposeTextField)initWithConfiguration:(id)a3 style:(int64_t)a4;
- (SKUIComposeTextFieldConfiguration)configuration;
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

@implementation SKUIComposeTextField

- (SKUIComposeTextField)initWithConfiguration:(id)a3 style:(int64_t)a4
{
  id v7 = a3;
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:44.0];
  v27.receiver = self;
  v27.super_class = (Class)SKUIComposeTextField;
  v9 = -[SKUIComposeTextField initWithFrame:](&v27, sel_initWithFrame_, 0.0, 0.0, 0.0, v8);
  v10 = v9;
  if (v9)
  {
    p_configuration = (id *)&v9->_configuration;
    objc_storeStrong((id *)&v9->_configuration, a3);
    v10->_style = a4;
    v12 = [(id)objc_opt_class() labelFontForStyle:a4];
    v13 = [*p_configuration label];
    if (v13)
    {
      v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      label = v10->_label;
      v10->_label = v14;

      [(UILabel *)v10->_label setFont:v12];
      [(UILabel *)v10->_label setText:v13];
      v16 = v10->_label;
      v17 = [(id)objc_opt_class() labelColorForStyle:a4];
      [(UILabel *)v16 setTextColor:v17];

      [(UILabel *)v10->_label sizeToFit];
      [(UILabel *)v10->_label setHoverStyle:0];
      [(SKUIComposeTextField *)v10 addSubview:v10->_label];
    }
    v18 = (UITextField *)objc_alloc_init(MEMORY[0x1E4FB1D70]);
    textField = v10->_textField;
    v10->_textField = v18;

    [(UITextField *)v10->_textField addTarget:v10 action:sel__textChanged_ forControlEvents:0x20000];
    [(UITextField *)v10->_textField setAutocapitalizationType:2];
    [(UITextField *)v10->_textField setAutocorrectionType:0];
    [(UITextField *)v10->_textField setDelegate:v10];
    v20 = v10->_textField;
    v21 = [(id)objc_opt_class() labelFontForStyle:v10->_style];
    [(UITextField *)v20 setFont:v21];

    [(UITextField *)v10->_textField setKeyboardType:0];
    v22 = v10->_textField;
    v23 = [v7 placeholder];
    [(UITextField *)v22 setPlaceholder:v23];

    [(UITextField *)v10->_textField setClipsToBounds:0];
    v24 = [*p_configuration value];
    [(SKUIComposeTextField *)v10 setText:v24];

    [(SKUIComposeTextField *)v10 addSubview:v10->_textField];
    [(UITextField *)v10->_textField sizeToFit];
    [(UITextField *)v10->_textField setHoverStyle:0];
    v25 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(SKUIComposeTextField *)v10 setBackgroundColor:v25];
  }
  return v10;
}

- (void)dealloc
{
  [(UITextField *)self->_textField removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)SKUIComposeTextField;
  [(SKUIComposeTextField *)&v3 dealloc];
}

+ (id)labelFontForStyle:(int64_t)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4FB08E0];
  objc_msgSend(MEMORY[0x1E4F3C2C8], "PPMScaledValueUsingValue:", a3, 17.0);

  return (id)objc_msgSend(v3, "systemFontOfSize:");
}

+ (id)labelColorForStyle:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "secondaryLabelColor", a3);
}

- (SKUIComposeTextFieldConfiguration)configuration
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
  if (v4 <= [(SKUIComposeTextFieldConfiguration *)self->_configuration maxLength])
  {
    id v6 = v7;
  }
  else
  {
    uint64_t v5 = objc_msgSend(v7, "substringToIndex:", -[SKUIComposeTextFieldConfiguration maxLength](self->_configuration, "maxLength"));

    id v6 = (id)v5;
  }
  id v8 = v6;
  [(UITextField *)self->_textField setText:v6];
  self->_currentTextLength = [v8 length];
}

- (void)drawRect:(CGRect)a3
{
  double v4 = 0.0;
  if (![(SKUIComposeTextFieldConfiguration *)self->_configuration columnIndex])
  {
    [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:15.0];
    double v4 = v5;
  }
  [(SKUIComposeTextFieldConfiguration *)self->_configuration borderInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(SKUIComposeTextField *)self bounds];
  CGFloat v46 = v14;
  CGFloat v16 = v15;
  double v18 = v17;
  CGFloat v20 = v19;
  v21 = [MEMORY[0x1E4FB1618] labelColor];
  v22 = [v21 colorWithAlphaComponent:0.2];
  [v22 set];

  uint64_t v23 = [(SKUIComposeTextField *)self effectiveUserInterfaceLayoutDirection];
  uint64_t v24 = v23;
  if (v7 > 0.0)
  {
    double v25 = v18 - v4;
    uint64_t v26 = 0;
    CGFloat v27 = v4;
    if (v23 == 1)
    {
      CGFloat v27 = CGRectWithFlippedOriginRelativeToBoundingRect(v4, 0.0, v25, v7, v46, v16, v18, v20);
      double v7 = v28;
    }
    double v29 = v7;
    UIRectFillUsingBlendMode(*(CGRect *)&v27, kCGBlendModeNormal);
  }
  if (v11 > 0.0)
  {
    double v30 = v18 - v4;
    double v31 = v20 - v11;
    if (v24 == 1)
    {
      double v4 = CGRectWithFlippedOriginRelativeToBoundingRect(v4, v31, v30, v11, v46, v16, v18, v20);
      double v11 = v32;
    }
    double v33 = v4;
    double v34 = v11;
    UIRectFillUsingBlendMode(*(CGRect *)(&v31 - 1), kCGBlendModeNormal);
  }
  if (v9 > 0.0)
  {
    uint64_t v35 = 0;
    if (v24 == 1)
    {
      double v36 = CGRectWithFlippedOriginRelativeToBoundingRect(0.0, 0.0, v9, v20, v46, v16, v18, v20);
      double v9 = v38;
    }
    else
    {
      CGFloat v37 = v20;
      double v36 = 0.0;
    }
    double v39 = v9;
    UIRectFillUsingBlendMode(*(CGRect *)(&v35 - 1), kCGBlendModeNormal);
  }
  if (v13 > 0.0)
  {
    CGFloat v40 = v18 - v13;
    uint64_t v41 = 0;
    if (v24 == 1)
    {
      CGFloat v40 = CGRectWithFlippedOriginRelativeToBoundingRect(v40, 0.0, v13, v20, v46, v16, v18, v20);
      double v13 = v42;
      CGFloat v20 = v43;
    }
    double v44 = v13;
    CGFloat v45 = v20;
    UIRectFillUsingBlendMode(*(CGRect *)&v40, kCGBlendModeNormal);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SKUIComposeTextField;
  -[SKUIComposeTextField hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (UITextField *)objc_claimAutoreleasedReturnValue();
  if (v5 == (UITextField *)self)
  {
    double v5 = self->_textField;
  }

  return v5;
}

- (void)layoutSubviews
{
  [(SKUIComposeTextField *)self bounds];
  CGFloat v35 = v4;
  CGFloat v36 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  uint64_t v9 = [(SKUIComposeTextField *)self effectiveUserInterfaceLayoutDirection];
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:15.0];
  label = self->_label;
  if (label)
  {
    [(UILabel *)label frame];
    double v13 = v12;
    double v15 = v14;
    [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:15.0];
    double v17 = v16;
    *(float *)&double v16 = (v8 - v15) * 0.5;
    double v18 = floorf(*(float *)&v16);
    v38.origin.x = v17;
    v38.origin.y = v18;
    v38.size.width = v13;
    v38.size.height = v15;
    double MaxX = CGRectGetMaxX(v38);
    [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:4.0];
    double v21 = v20;
    if (v9 == 1)
    {
      double v17 = CGRectWithFlippedOriginRelativeToBoundingRect(v17, v18, v13, v15, v36, v35, v6, v8);
      double v18 = v22;
      double v13 = v23;
      double v15 = v24;
    }
    double v25 = MaxX + v21;
    -[UILabel setFrame:](self->_label, "setFrame:", v17, v18, v13, v15);
  }
  else
  {
    double v25 = v10;
  }
  [(UITextField *)self->_textField frame];
  double v27 = v26;
  float v28 = (v8 - v26) * 0.5;
  double v29 = floorf(v28);
  [MEMORY[0x1E4F3C2C8] PPMScaledValueUsingValue:15.0];
  double v31 = v6 - v30 - v25;
  if (v9 == 1)
  {
    double v25 = CGRectWithFlippedOriginRelativeToBoundingRect(v25, v29, v31, v27, v36, v35, v6, v8);
    double v29 = v32;
    double v27 = v33;
  }
  textField = self->_textField;

  -[UITextField setFrame:](textField, "setFrame:", v25, v29, v31, v27);
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
  if ([(SKUIComposeTextFieldConfiguration *)self->_configuration maxLength]) {
    int64_t v10 = [(SKUIComposeTextFieldConfiguration *)self->_configuration maxLength];
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