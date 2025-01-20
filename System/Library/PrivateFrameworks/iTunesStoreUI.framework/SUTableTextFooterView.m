@interface SUTableTextFooterView
- (NSArray)textLines;
- (UIColor)shadowColor;
- (UIColor)textColor;
- (UIFont)font;
- (int64_t)textAlignment;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setFont:(id)a3;
- (void)setShadowColor:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTextLines:(id)a3;
- (void)sizeToFit;
@end

@implementation SUTableTextFooterView

- (void)dealloc
{
  self->_font = 0;
  self->_shadowColor = 0;

  self->_textColor = 0;
  self->_textLines = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUTableTextFooterView;
  [(SUTableTextFooterView *)&v3 dealloc];
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  [(SUTableTextFooterView *)self bounds];
  CGRect v26 = CGRectInset(v25, 10.0, 0.0);
  double x = v26.origin.x;
  double y = v26.origin.y;
  double width = v26.size.width;
  double height = v26.size.height;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  textLines = self->_textLines;
  uint64_t v9 = [(NSArray *)textLines countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    double v11 = height + -26.0;
    double v12 = y + 6.0;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(textLines);
        }
        v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        shadowColor = self->_shadowColor;
        if (shadowColor)
        {
          [(UIColor *)shadowColor set];
          double v17 = v12 + 1.0;
          objc_msgSend(v15, "_legacy_drawInRect:withFont:lineBreakMode:alignment:", self->_font, 4, self->_textAlignment, x, v17, width, v11);
          double v12 = v17 + -1.0;
        }
        [(UIColor *)self->_textColor set];
        objc_msgSend(v15, "_legacy_drawInRect:withFont:lineBreakMode:alignment:", self->_font, 4, self->_textAlignment, x, v12, width, v11);
        double v12 = v12 + v18 + 0.0;
        double v11 = v11 - (v18 + 0.0);
      }
      uint64_t v10 = [(NSArray *)textLines countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
}

- (void)sizeToFit
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  [(SUTableTextFooterView *)self frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v9 = 26.0;
  if ([(NSArray *)self->_textLines count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    textLines = self->_textLines;
    uint64_t v11 = [(NSArray *)textLines countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(textLines);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", self->_font, 4, v8 + -20.0, 1.79769313e308);
          double v9 = v9 + v15;
        }
        uint64_t v12 = [(NSArray *)textLines countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
  -[SUTableTextFooterView setFrame:](self, "setFrame:", v4, v6, v8, v9);
}

- (void)setFont:(id)a3
{
  font = self->_font;
  if (font != a3)
  {

    self->_font = (UIFont *)a3;
    [(SUTableTextFooterView *)self setNeedsDisplay];
  }
}

- (void)setShadowColor:(id)a3
{
  shadowColor = self->_shadowColor;
  if (shadowColor != a3)
  {

    self->_shadowColor = (UIColor *)a3;
    [(SUTableTextFooterView *)self setNeedsDisplay];
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    [(SUTableTextFooterView *)self setNeedsDisplay];
  }
}

- (void)setTextColor:(id)a3
{
  textColor = self->_textColor;
  if (textColor != a3)
  {

    self->_textColor = (UIColor *)a3;
    [(SUTableTextFooterView *)self setNeedsDisplay];
  }
}

- (void)setTextLines:(id)a3
{
  textLines = self->_textLines;
  if (textLines != a3)
  {

    self->_textLines = (NSArray *)a3;
    [(SUTableTextFooterView *)self setNeedsDisplay];
  }
}

- (UIFont)font
{
  return self->_font;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (NSArray)textLines
{
  return self->_textLines;
}

@end