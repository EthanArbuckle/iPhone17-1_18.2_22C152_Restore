@interface _UIRoundedRectShadowView
+ (BOOL)_shouldCutoutShadow;
+ (UIEdgeInsets)_expansionInsetForShadowImage;
- (CGRect)frameWithContentWithFrame:(CGRect)a3;
- (_UIRoundedRectShadowView)initWithCornerRadius:(double)a3;
- (double)maskCornerRadius;
- (void)_loadImageIfNecessary;
- (void)_updateShadowOutsetsIfNecessary;
- (void)layoutSubviews;
@end

@implementation _UIRoundedRectShadowView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIRoundedRectShadowView;
  [(UIImageView *)&v3 layoutSubviews];
  [(_UIRoundedRectShadowView *)self _loadImageIfNecessary];
}

- (void)_loadImageIfNecessary
{
  objc_super v3 = [(UIImageView *)self image];

  if (!v3)
  {
    double maskCornerRadius = self->_maskCornerRadius;
    v5 = [(UIView *)self _screen];
    [v5 scale];
    double v7 = v6;
    unsigned int v8 = [(id)objc_opt_class() _shouldCutoutShadow];
    if (qword_1EB25D358 != -1) {
      dispatch_once(&qword_1EB25D358, &__block_literal_global_80);
    }
    v9 = [[_UIShadowViewImageCacheKey alloc] initWithSize:v8 scale:maskCornerRadius options:v7];
    v10 = [(id)qword_1EB25D350 objectForKey:v9];
    if (!v10)
    {
      v11 = +[UIImage kitImageNamed:@"_UIPopoverShadow"];
      _UIGraphicsBeginImageContextWithOptions(0, 1, 400.0, 400.0, v7);
      ContextStack = GetContextStack(0);
      double v33 = maskCornerRadius;
      if (*(int *)ContextStack < 1) {
        v13 = 0;
      }
      else {
        v13 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      }
      uint64_t v14 = 0;
      double v15 = *MEMORY[0x1E4F1DB30];
      double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v17 = *MEMORY[0x1E4F1DAD8];
      double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      do
      {
        CGContextSaveGState(v13);
        if (v14 == 3)
        {
          CGFloat v21 = 0.0;
          double v20 = 400.0;
          CGFloat v19 = 4.71238898;
        }
        else if (v14 == 2)
        {
          [v11 size];
          double v20 = v22 + v22;
          CGFloat v21 = 400.0;
          CGFloat v19 = 3.14159265;
        }
        else
        {
          CGFloat v19 = 0.0;
          double v20 = v16;
          CGFloat v21 = v15;
          if (v14 == 1)
          {
            double v20 = 0.0;
            CGFloat v21 = 400.0;
            CGFloat v19 = 1.57079633;
          }
        }
        CGContextTranslateCTM(v13, v21, v20);
        CGContextRotateCTM(v13, v19);
        objc_msgSend(v11, "drawAtPoint:", v17, v18);
        CGContextRestoreGState(v13);
        ++v14;
      }
      while (v14 != 4);
      if (v8)
      {
        id v23 = +[UIColor blackColor];
        CGContextSetFillColorWithColor(v13, (CGColorRef)[v23 CGColor]);

        CGContextSetBlendMode(v13, kCGBlendModeClear);
        v36.size.width = 400.0;
        v36.origin.x = 0.0;
        v36.origin.y = 0.0;
        v36.size.height = 400.0;
        CGRect v37 = CGRectInset(v36, 150.0, 150.0);
        v24 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height, maskCornerRadius);
        [v24 fill];
      }
      v25 = _UIGraphicsGetImageFromCurrentImageContext(0);
      v10 = objc_msgSend(v25, "resizableImageWithCapInsets:", -1.0 / v7 + 200.0, -1.0 / v7 + 200.0, -1.0 / v7 + 200.0, -1.0 / v7 + 200.0);

      UIGraphicsEndImageContext();
      if (v10) {
        [(id)qword_1EB25D350 setObject:v10 forKey:v9];
      }
    }
    [(UIImageView *)self setImage:v10];
  }
  [(UIView *)self frame];
  if (v26 < 400.0 || ([(UIView *)self frame], v27 < 400.0))
  {
    double v28 = fmax(self->_maskCornerRadius + 150.0, 170.0);
    v29 = [(UIView *)self _screen];
    [v29 scale];
    double v31 = -1.0 / v30 + 200.0;

    if (v28 >= v31) {
      double v28 = v31;
    }
    v32 = [(UIImageView *)self image];
    objc_msgSend(v32, "resizableImageWithCapInsets:", v28, v28, v28, v28);
    id v34 = (id)objc_claimAutoreleasedReturnValue();

    [(UIImageView *)self setImage:v34];
  }
}

+ (BOOL)_shouldCutoutShadow
{
  return 0;
}

- (CGRect)frameWithContentWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_UIRoundedRectShadowView *)self _updateShadowOutsetsIfNecessary];
  double top = self->_shadowOutsets.top;
  double left = self->_shadowOutsets.left;
  double v10 = x + left;
  double v11 = y + top;
  double v12 = width - (left + self->_shadowOutsets.right);
  double v13 = height - (top + self->_shadowOutsets.bottom);
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (void)_updateShadowOutsetsIfNecessary
{
  p_shadowOutsets = &self->_shadowOutsets;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_shadowOutsets.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_shadowOutsets.bottom))))) & 1) == 0)
  {
    +[_UIRoundedRectShadowView _expansionInsetForShadowImage];
    p_shadowOutsets->double top = v3;
    p_shadowOutsets->double left = v4;
    p_shadowOutsets->bottom = v5;
    p_shadowOutsets->right = v6;
  }
}

+ (UIEdgeInsets)_expansionInsetForShadowImage
{
  double v2 = -150.0;
  double v3 = -150.0;
  double v4 = -150.0;
  double v5 = -150.0;
  result.right = v5;
  result.bottom = v4;
  result.double left = v3;
  result.double top = v2;
  return result;
}

- (_UIRoundedRectShadowView)initWithCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIRoundedRectShadowView;
  UIEdgeInsets result = [(UIView *)&v5 init];
  if (result) {
    result->_double maskCornerRadius = a3;
  }
  return result;
}

- (double)maskCornerRadius
{
  return self->_maskCornerRadius;
}

@end