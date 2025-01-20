@interface TopHitCompletionView
- (UIColor)highlightColor;
- (void)drawRect:(CGRect)a3;
- (void)setAttributedText:(id)a3 highlightStartIndex:(unint64_t)a4;
- (void)setHighlightColor:(id)a3;
@end

@implementation TopHitCompletionView

- (void)setAttributedText:(id)a3 highlightStartIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = (NSAttributedString *)v6;
  if (self->_highlightStartIndex != a4
    || (unint64_t)v6 | (unint64_t)self->_attributedText
    && (v11 = (NSAttributedString *)v6, char v8 = objc_msgSend(v6, "isEqualToAttributedString:"), v7 = v11, (v8 & 1) == 0))
  {
    v12 = v7;
    self->_highlightStartIndex = a4;
    if (self->_attributedText != v7)
    {
      v9 = (NSAttributedString *)[(NSAttributedString *)v7 copy];
      attributedText = self->_attributedText;
      self->_attributedText = v9;
    }
    [(TopHitCompletionView *)self setNeedsDisplay];
    v7 = v12;
  }
}

- (void)drawRect:(CGRect)a3
{
  if ([(NSAttributedString *)self->_attributedText length])
  {
    id v12 = [(NSAttributedString *)self->_attributedText attribute:*MEMORY[0x1E4FB06F8] atIndex:0 effectiveRange:0];
    [v12 lineHeight];
    [v12 descender];
    [(TopHitCompletionView *)self bounds];
    double v5 = v4;
    UIRoundToViewScale();
    double v7 = v6 + v5;
    char v8 = CTLineCreateWithAttributedString((CFAttributedStringRef)self->_attributedText);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    CGContextTranslateCTM(CurrentContext, 0.0, -v7);
    [(NSAttributedString *)self->_attributedText length];
    v10 = (const CGPath *)CTLineCopyHighlightPathForStringRange();
    CGContextAddPath(CurrentContext, v10);
    CGContextSetFillColorWithColor(CurrentContext, [(UIColor *)self->_highlightColor CGColor]);
    CGContextFillPath(CurrentContext);
    CGPathRelease(v10);
    v11 = UIGraphicsGetCurrentContext();
    CTLineDraw(v8, v11);
    CFRelease(v8);
  }
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
}

@end