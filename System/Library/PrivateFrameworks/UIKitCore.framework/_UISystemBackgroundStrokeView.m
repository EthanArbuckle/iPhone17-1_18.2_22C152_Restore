@interface _UISystemBackgroundStrokeView
- (BOOL)useContinuousCurve;
- (UIColor)strokeColor;
- (double)strokeCornerRadius;
- (double)strokeWidth;
- (unint64_t)maskedCorners;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)drawRect:(CGRect)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeCornerRadius:(double)a3;
- (void)setStrokeWidth:(double)a3;
- (void)setUseContinuousCurve:(BOOL)a3;
- (void)updateLayerOrRedraw;
@end

@implementation _UISystemBackgroundStrokeView

- (void)setStrokeWidth:(double)a3
{
  if (self->_strokeWidth != a3)
  {
    self->_strokeWidth = a3;
    -[_UISystemBackgroundStrokeView updateLayerOrRedraw]((uint64_t)self);
  }
}

- (void)updateLayerOrRedraw
{
  if (a1)
  {
    [(id)a1 setOpaque:0];
    v2 = [(id)a1 layer];
    id v7 = v2;
    if (*(void *)(a1 + 440) == 15)
    {
      [v2 setMasksToBounds:1];
      [v7 setBorderWidth:*(double *)(a1 + 416)];
      [v7 setMaskedCorners:*(void *)(a1 + 440)];
      if (*(unsigned char *)(a1 + 408)) {
        v3 = (void *)MEMORY[0x1E4F39EA8];
      }
      else {
        v3 = (void *)MEMORY[0x1E4F39EA0];
      }
      [v7 setCornerCurve:*v3];
      [v7 setCornerRadius:*(double *)(a1 + 424)];
      v4 = *(void **)(a1 + 432);
      v5 = [(id)a1 traitCollection];
      id v6 = [v4 resolvedColorWithTraitCollection:v5];
      objc_msgSend(v7, "setBorderColor:", objc_msgSend(v6, "CGColor"));
    }
    else
    {
      [v2 setMasksToBounds:0];
      [v7 setBorderWidth:0.0];
      [v7 setMaskedCorners:0];
      [v7 setCornerRadius:0.0];
      [(id)a1 setNeedsDisplay];
    }
  }
}

- (void)setStrokeCornerRadius:(double)a3
{
  if (self->_strokeCornerRadius != a3)
  {
    self->_strokeCornerRadius = a3;
    -[_UISystemBackgroundStrokeView updateLayerOrRedraw]((uint64_t)self);
  }
}

- (void)setStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_strokeColor, a3);
  -[_UISystemBackgroundStrokeView updateLayerOrRedraw]((uint64_t)self);
}

- (void)setMaskedCorners:(unint64_t)a3
{
  if (self->_maskedCorners != a3)
  {
    self->_maskedCorners = a3;
    -[_UISystemBackgroundStrokeView updateLayerOrRedraw]((uint64_t)self);
  }
}

- (void)setUseContinuousCurve:(BOOL)a3
{
  if (self->_useContinuousCurve != a3)
  {
    self->_useContinuousCurve = a3;
    -[_UISystemBackgroundStrokeView updateLayerOrRedraw]((uint64_t)self);
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UISystemBackgroundStrokeView;
  [(UIView *)&v3 _dynamicUserInterfaceTraitDidChange];
  if (!self || self->_maskedCorners == 15) {
    -[_UISystemBackgroundStrokeView updateLayerOrRedraw]((uint64_t)self);
  }
}

- (void)drawRect:(CGRect)a3
{
  if (self && self->_maskedCorners != 15)
  {
    [(UIView *)self bounds];
    double v8 = self->_strokeWidth * 0.5;
    unint64_t maskedCorners = self->_maskedCorners;
    double v10 = 0.0;
    if (maskedCorners == 3) {
      double v11 = 0.0;
    }
    else {
      double v11 = self->_strokeWidth * 0.5;
    }
    if (maskedCorners == 12) {
      double v12 = 0.0;
    }
    else {
      double v12 = self->_strokeWidth * 0.5;
    }
    if (maskedCorners == 12) {
      double v11 = self->_strokeWidth * 0.5;
    }
    if (maskedCorners) {
      double v10 = v11;
    }
    else {
      double v12 = 0.0;
    }
    double v13 = v4 + v8;
    double v14 = v5 + v12;
    double v15 = v6 - (v8 + v8);
    double v16 = v7 - (v12 + v10);
    double v17 = self->_strokeCornerRadius - v8;
    BOOL v18 = !self->_useContinuousCurve;
    if (maskedCorners)
    {
      v19 = +[UIBezierPath _roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:](UIBezierPath, "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", 3, 13, v18, v13, v5 + v12, v15, v7 - (v12 + v10), v17);
      if (self->_maskedCorners == 12)
      {
        v27.origin.x = v13;
        v27.origin.y = v14;
        v27.size.width = v15;
        v27.size.height = v16;
        CGFloat v20 = -CGRectGetMidX(v27);
        v28.origin.x = v13;
        v28.origin.y = v14;
        v28.size.width = v15;
        v28.size.height = v16;
        CGFloat MidY = CGRectGetMidY(v28);
        CGAffineTransformMakeTranslation(&v26, v20, -MidY);
        [v19 applyTransform:&v26];
        CGAffineTransformMakeScale(&v25, 1.0, -1.0);
        [v19 applyTransform:&v25];
        v29.origin.x = v13;
        v29.origin.y = v14;
        v29.size.width = v15;
        v29.size.height = v16;
        CGFloat MidX = CGRectGetMidX(v29);
        v30.origin.x = v13;
        v30.origin.y = v14;
        v30.size.width = v15;
        v30.size.height = v16;
        CGFloat v23 = CGRectGetMidY(v30);
        CGAffineTransformMakeTranslation(&v24, MidX, v23);
        [v19 applyTransform:&v24];
      }
    }
    else
    {
      v19 = +[UIBezierPath _roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:](UIBezierPath, "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", 0, 12, v18, v13, v5 + v12, v15, v7 - (v12 + v10), v17);
    }
    [v19 setLineWidth:self->_strokeWidth];
    [(UIColor *)self->_strokeColor set];
    [v19 stroke];
  }
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (double)strokeCornerRadius
{
  return self->_strokeCornerRadius;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (BOOL)useContinuousCurve
{
  return self->_useContinuousCurve;
}

- (void).cxx_destruct
{
}

@end