@interface PKPaymentButton
+ (Class)layerClass;
+ (PKPaymentButton)buttonWithType:(PKPaymentButtonType)buttonType style:(PKPaymentButtonStyle)buttonStyle;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)clipsToBounds;
- (CGFloat)cornerRadius;
- (CGSize)intrinsicContentSize;
- (PKPaymentButton)initWithCoder:(id)a3;
- (PKPaymentButton)initWithFrame:(CGRect)a3;
- (PKPaymentButton)initWithPaymentButtonType:(PKPaymentButtonType)type paymentButtonStyle:(PKPaymentButtonStyle)style;
- (int64_t)_effectiveButtonStyle;
- (int64_t)style;
- (int64_t)type;
- (void)_createHighlightFilterIfNecessary;
- (void)applyAccessibilityValues;
- (void)drawRect:(CGRect)a3;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setCornerRadius:(CGFloat)cornerRadius;
- (void)setHighlighted:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKPaymentButton

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (PKPaymentButton)buttonWithType:(PKPaymentButtonType)buttonType style:(PKPaymentButtonStyle)buttonStyle
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPaymentButtonType:buttonType paymentButtonStyle:buttonStyle];

  return (PKPaymentButton *)v4;
}

- (PKPaymentButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentButton;
  v5 = [(PKPaymentButton *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_style = [v4 decodeIntegerForKey:@"PKPaymentButtonStyle"];
    v5->_type = [v4 decodeIntegerForKey:@"PKPaymentButtonType"];
    [(PKPaymentButton *)v5 applyAccessibilityValues];
  }

  return v5;
}

- (PKPaymentButton)initWithFrame:(CGRect)a3
{
  return -[PKPaymentButton initWithPaymentButtonType:paymentButtonStyle:](self, "initWithPaymentButtonType:paymentButtonStyle:", 0, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKPaymentButton)initWithPaymentButtonType:(PKPaymentButtonType)type paymentButtonStyle:(PKPaymentButtonStyle)style
{
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentButton;
  v8 = -[PKPaymentButton initWithFrame:](&v11, sel_initWithFrame_, v6, v7, 140.0, 30.0);
  v9 = v8;
  if (v8)
  {
    v8->_style = style;
    v8->_type = type;
    v8->_cornerRadius = *(double *)MEMORY[0x1E4F87080];
    [(PKPaymentButton *)v8 applyAccessibilityValues];
  }
  return v9;
}

- (BOOL)clipsToBounds
{
  return 1;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  if (self->_cornerRadius != cornerRadius)
  {
    self->_cornerRadius = cornerRadius;
    [(PKPaymentButton *)self setNeedsDisplay];
  }
}

- (void)setType:(int64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    [(PKPaymentButton *)self setNeedsDisplay];
    [(PKPaymentButton *)self applyAccessibilityValues];
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(PKPaymentButton *)self setNeedsDisplay];
  }
}

- (void)applyAccessibilityValues
{
  v3 = PKApplePayButtonAccessibilityTitleForType();
  [(PKPaymentButton *)self setAccessibilityLabel:v3];

  uint64_t v4 = *MEMORY[0x1E4FB2540];

  [(PKPaymentButton *)self setAccessibilityTraits:v4];
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v9 scale];

  [(PKPaymentButton *)self _effectiveButtonStyle];
  v10 = (CGImage *)PKCreateApplePayButtonImageWithCornerRadius();
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGContextDrawImage(CurrentContext, v12, v10);

  CGImageRelease(v10);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentButton;
  [(PKPaymentButton *)&v3 layoutSubviews];
  [(PKPaymentButton *)self setNeedsDisplay];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 140.0;
  if (!self->_type) {
    double v2 = 100.0;
  }
  double v3 = 30.0;
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentButton;
  id v4 = a3;
  [(PKPaymentButton *)&v8 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  double v6 = [(PKPaymentButton *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    [(PKPaymentButton *)self setNeedsDisplay];
  }
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentButton;
  id v4 = a3;
  [(PKPaymentButton *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_style, @"PKPaymentButtonStyle", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_type forKey:@"PKPaymentButtonType"];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"path"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKPaymentButton;
    BOOL v5 = [(PKPaymentButton *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)_createHighlightFilterIfNecessary
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (!self->_highlightFilter)
  {
    double v3 = [(PKPaymentButton *)self layer];
    id v4 = objc_alloc(MEMORY[0x1E4F39BC0]);
    BOOL v5 = (CAFilter *)[v4 initWithType:*MEMORY[0x1E4F3A2A8]];
    highlightFilter = self->_highlightFilter;
    self->_highlightFilter = v5;

    [(CAFilter *)self->_highlightFilter setName:@"highlightFilter"];
    [(CAFilter *)self->_highlightFilter setName:@"highlightFilter"];
    objc_super v7 = self->_highlightFilter;
    id v8 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
    -[CAFilter setValue:forKey:](v7, "setValue:forKey:", [v8 CGColor], @"inputColor");

    v10[0] = self->_highlightFilter;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [v3 setFilters:v9];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentButton;
  -[PKPaymentButton setHighlighted:](&v16, sel_setHighlighted_);
  if (((!self->_highlighted ^ v3) & 1) == 0)
  {
    self->_highlighted = v3;
    [(PKPaymentButton *)self _createHighlightFilterIfNecessary];
    BOOL v5 = [(PKPaymentButton *)self layer];
    double v6 = 0.6;
    if (!v3) {
      double v6 = 1.0;
    }
    objc_super v7 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", v6);
    id v8 = (void *)MEMORY[0x1E4FB1618];
    v9 = [v5 valueForKeyPath:@"filters.highlightFilter.inputColor"];
    v10 = [v8 colorWithCGColor:v9];

    id v11 = v7;
    objc_msgSend(v5, "setValue:forKeyPath:", objc_msgSend(v11, "CGColor"), @"filters.highlightFilter.inputColor");
    CGRect v12 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"filters.highlightFilter.inputColor"];
    [v12 setDuration:0.15];
    [v12 setFillMode:*MEMORY[0x1E4F39FA8]];
    id v13 = v10;
    objc_msgSend(v12, "setFromValue:", objc_msgSend(v13, "CGColor"));
    id v14 = v11;
    objc_msgSend(v12, "setToValue:", objc_msgSend(v14, "CGColor"));
    id v15 = (id)objc_msgSend(v5, "pkui_addAdditiveAnimation:", v12);
  }
}

- (int64_t)_effectiveButtonStyle
{
  uint64_t style = self->_style;
  if (style == 3)
  {
    BOOL v3 = [(PKPaymentButton *)self traitCollection];
    if ([v3 userInterfaceIdiom] == 6) {
      uint64_t style = 2;
    }
    else {
      uint64_t style = 2 * ([v3 userInterfaceStyle] == 1);
    }
  }
  return style;
}

- (CGFloat)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightFilter, 0);

  objc_storeStrong((id *)&self->_layer, 0);
}

@end