@interface SUUIStackViewItemView
- (BOOL)shouldFlipImageHorizontal;
- (BOOL)shouldFlipImageVertical;
- (UIColor)borderColor;
- (UIImage)image;
- (void)drawRect:(CGRect)a3;
- (void)setBorderColor:(id)a3;
- (void)setImage:(id)a3;
- (void)setShouldFlipImageHorizontal:(BOOL)a3;
- (void)setShouldFlipImageVertical:(BOOL)a3;
@end

@implementation SUUIStackViewItemView

- (void)setBorderColor:(id)a3
{
  if (self->_borderColor != a3)
  {
    v4 = (UIColor *)[a3 copy];
    borderColor = self->_borderColor;
    self->_borderColor = v4;

    [(SUUIStackViewItemView *)self setNeedsDisplay];
  }
}

- (void)setImage:(id)a3
{
  v5 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_image, a3);
    p_image = (UIImage **)[(SUUIStackViewItemView *)self setNeedsDisplay];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_image, v5);
}

- (void)setShouldFlipImageHorizontal:(BOOL)a3
{
  if (self->_shouldFlipImageHorizontal != a3)
  {
    self->_shouldFlipImageHorizontal = a3;
    [(SUUIStackViewItemView *)self setNeedsDisplay];
  }
}

- (void)setShouldFlipImageVertical:(BOOL)a3
{
  if (self->_shouldFlipImageVertical != a3)
  {
    self->_shouldFlipImageVertical = a3;
    [(SUUIStackViewItemView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  [(SUUIStackViewItemView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  BOOL shouldFlipImageVertical = self->_shouldFlipImageVertical;
  double v14 = -1.0;
  if (self->_shouldFlipImageHorizontal)
  {
    CGFloat v15 = -1.0;
  }
  else
  {
    if (!self->_shouldFlipImageVertical) {
      goto LABEL_12;
    }
    CGFloat v15 = 1.0;
    BOOL shouldFlipImageVertical = 1;
  }
  if (!shouldFlipImageVertical) {
    double v14 = 1.0;
  }
  CGContextScaleCTM(CurrentContext, v15, v14);
  double v16 = -v9;
  double v17 = 0.0;
  if (!self->_shouldFlipImageHorizontal) {
    double v16 = 0.0;
  }
  if (self->_shouldFlipImageVertical) {
    double v17 = -v11;
  }
  CGContextTranslateCTM(CurrentContext, v16, v17);
LABEL_12:
  -[UIImage drawInRect:](self->_image, "drawInRect:", v5, v7, v9, v11);
  CGContextRestoreGState(CurrentContext);
  borderColor = self->_borderColor;
  if (borderColor)
  {
    double v19 = *(double *)&drawRect__borderWidth;
    if (*(double *)&drawRect__borderWidth == 0.0)
    {
      v20 = objc_msgSend(MEMORY[0x263F82B60], "mainScreen", *(double *)&drawRect__borderWidth);
      [v20 scale];
      *(double *)&drawRect__borderWidth = 1.0 / v21;

      borderColor = self->_borderColor;
    }
    [(UIColor *)borderColor set];
    *(void *)&v27.size.height = drawRect__borderWidth;
    v27.origin.x = 0.0;
    v27.origin.y = 0.0;
    v27.size.width = v9;
    UIRectFillUsingBlendMode(v27, kCGBlendModeNormal);
    *(void *)&v28.origin.y = drawRect__borderWidth;
    v28.origin.x = v9 - *(double *)&drawRect__borderWidth;
    v28.size.height = v11 - *(double *)&drawRect__borderWidth * 2.0;
    *(void *)&v28.size.width = drawRect__borderWidth;
    UIRectFillUsingBlendMode(v28, kCGBlendModeNormal);
    *(void *)&v29.size.height = drawRect__borderWidth;
    v29.origin.y = v11 - *(double *)&drawRect__borderWidth;
    v29.origin.x = 0.0;
    v29.size.width = v9;
    UIRectFillUsingBlendMode(v29, kCGBlendModeNormal);
    uint64_t v22 = drawRect__borderWidth;
    double v23 = v11 - *(double *)&drawRect__borderWidth * 2.0;
    uint64_t v24 = 0;
    uint64_t v25 = drawRect__borderWidth;
    UIRectFillUsingBlendMode(*(CGRect *)&v24, kCGBlendModeNormal);
  }
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)shouldFlipImageHorizontal
{
  return self->_shouldFlipImageHorizontal;
}

- (BOOL)shouldFlipImageVertical
{
  return self->_shouldFlipImageVertical;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end