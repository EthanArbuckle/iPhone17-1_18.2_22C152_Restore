@interface SKUIStackViewItemView
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

@implementation SKUIStackViewItemView

- (void)setBorderColor:(id)a3
{
  v4 = (UIColor *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIStackViewItemView setBorderColor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_borderColor != v4)
  {
    v13 = (UIColor *)[(UIColor *)v4 copy];
    borderColor = self->_borderColor;
    self->_borderColor = v13;

    [(SKUIStackViewItemView *)self setNeedsDisplay];
  }
}

- (void)setImage:(id)a3
{
  BOOL v5 = (UIImage *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUIStackViewItemView setImage:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  if (self->_image != v5)
  {
    objc_storeStrong((id *)&self->_image, a3);
    [(SKUIStackViewItemView *)self setNeedsDisplay];
  }
}

- (void)setShouldFlipImageHorizontal:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIStackViewItemView setShouldFlipImageHorizontal:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_shouldFlipImageHorizontal != v3)
  {
    self->_shouldFlipImageHorizontal = v3;
    [(SKUIStackViewItemView *)self setNeedsDisplay];
  }
}

- (void)setShouldFlipImageVertical:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIStackViewItemView setShouldFlipImageVertical:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_shouldFlipImageVertical != v3)
  {
    self->_shouldFlipImageVertical = v3;
    [(SKUIStackViewItemView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        -[SKUIStackViewItemView drawRect:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  [(SKUIStackViewItemView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  BOOL shouldFlipImageVertical = self->_shouldFlipImageVertical;
  double v22 = -1.0;
  if (self->_shouldFlipImageHorizontal)
  {
    CGFloat v23 = -1.0;
  }
  else
  {
    if (!self->_shouldFlipImageVertical) {
      goto LABEL_16;
    }
    CGFloat v23 = 1.0;
    BOOL shouldFlipImageVertical = 1;
  }
  if (!shouldFlipImageVertical) {
    double v22 = 1.0;
  }
  CGContextScaleCTM(CurrentContext, v23, v22);
  double v24 = -v17;
  double v25 = 0.0;
  if (!self->_shouldFlipImageHorizontal) {
    double v24 = 0.0;
  }
  if (self->_shouldFlipImageVertical) {
    double v25 = -v19;
  }
  CGContextTranslateCTM(CurrentContext, v24, v25);
LABEL_16:
  -[UIImage drawInRect:](self->_image, "drawInRect:", v13, v15, v17, v19);
  CGContextRestoreGState(CurrentContext);
  borderColor = self->_borderColor;
  if (borderColor)
  {
    double v27 = *(double *)&drawRect__borderWidth;
    if (*(double *)&drawRect__borderWidth == 0.0)
    {
      v28 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", *(double *)&drawRect__borderWidth);
      [v28 scale];
      *(double *)&drawRect__borderWidth = 1.0 / v29;

      borderColor = self->_borderColor;
    }
    [(UIColor *)borderColor set];
    *(void *)&v30.size.height = drawRect__borderWidth;
    v30.origin.x = 0.0;
    v30.origin.y = 0.0;
    v30.size.width = v17;
    UIRectFillUsingBlendMode(v30, kCGBlendModeNormal);
    *(void *)&v31.origin.y = drawRect__borderWidth;
    v31.origin.x = v17 - *(double *)&drawRect__borderWidth;
    v31.size.height = v19 - *(double *)&drawRect__borderWidth * 2.0;
    *(void *)&v31.size.width = drawRect__borderWidth;
    UIRectFillUsingBlendMode(v31, kCGBlendModeNormal);
    *(void *)&v32.size.height = drawRect__borderWidth;
    v32.origin.y = v19 - *(double *)&drawRect__borderWidth;
    v32.origin.x = 0.0;
    v32.size.width = v17;
    UIRectFillUsingBlendMode(v32, kCGBlendModeNormal);
    *(void *)&v33.origin.y = drawRect__borderWidth;
    v33.size.height = v19 - *(double *)&drawRect__borderWidth * 2.0;
    v33.origin.x = 0.0;
    *(void *)&v33.size.width = drawRect__borderWidth;
    UIRectFillUsingBlendMode(v33, kCGBlendModeNormal);
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

- (void)setBorderColor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setShouldFlipImageHorizontal:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setShouldFlipImageVertical:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)drawRect:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end