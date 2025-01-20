@interface BCLibraryButton
- (UIColor)highlightBackgroundColor;
- (UIColor)normalBackgroundColor;
- (void)setHighlightBackgroundColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setNormalBackgroundColor:(id)a3;
@end

@implementation BCLibraryButton

- (void)setHighlighted:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BCLibraryButton;
  -[BCLibraryButton setHighlighted:](&v6, "setHighlighted:");
  if (a3) {
    [(BCLibraryButton *)self highlightBackgroundColor];
  }
  else {
  v5 = [(BCLibraryButton *)self normalBackgroundColor];
  }
  [(BCLibraryButton *)self setBackgroundColor:v5];
}

- (void)setNormalBackgroundColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_normalBackgroundColor != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_normalBackgroundColor, a3);
    if (([(BCLibraryButton *)self isHighlighted] & 1) == 0) {
      [(BCLibraryButton *)self setBackgroundColor:v6];
    }
  }

  _objc_release_x2();
}

- (void)setHighlightBackgroundColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_highlightBackgroundColor = &self->_highlightBackgroundColor;
  if (self->_highlightBackgroundColor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_highlightBackgroundColor, a3);
    p_highlightBackgroundColor = (UIColor **)[(BCLibraryButton *)self isHighlighted];
    v5 = v8;
    if (p_highlightBackgroundColor)
    {
      v7 = [(BCLibraryButton *)self highlightBackgroundColor];
      [(BCLibraryButton *)self setBackgroundColor:v7];

      v5 = v8;
    }
  }

  _objc_release_x1(p_highlightBackgroundColor, v5);
}

- (UIColor)normalBackgroundColor
{
  return self->_normalBackgroundColor;
}

- (UIColor)highlightBackgroundColor
{
  return self->_highlightBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightBackgroundColor, 0);

  objc_storeStrong((id *)&self->_normalBackgroundColor, 0);
}

@end