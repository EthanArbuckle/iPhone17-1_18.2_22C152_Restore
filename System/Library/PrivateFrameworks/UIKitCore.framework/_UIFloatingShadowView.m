@interface _UIFloatingShadowView
+ (Class)layerClass;
- (BOOL)_disableOutsetShadowPath;
- (BOOL)isShadowEnabled;
- (CGPath)_shadowPathForSize:(CGSize)a3 radius:(double)a4;
- (CGRect)shadowContentsCenter;
- (CGSize)shadowSize;
- (UIImage)shadowImage;
- (_UIFloatingShadowView)initWithFrame:(CGRect)a3;
- (double)cornerRadius;
- (double)shadowExpansion;
- (double)shadowOpacity;
- (double)shadowRadius;
- (double)shadowVerticalOffset;
- (void)_layoutShadow;
- (void)_setShadowImageIfNeeded;
- (void)_updateShadowLayer;
- (void)layoutSubviews;
- (void)setCornerRadius:(double)a3;
- (void)setShadowContentsCenter:(CGRect)a3;
- (void)setShadowEnabled:(BOOL)a3;
- (void)setShadowExpansion:(double)a3;
- (void)setShadowImage:(id)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setShadowRadius:(double)a3;
- (void)setShadowSize:(CGSize)a3;
- (void)setShadowVerticalOffset:(double)a3;
- (void)set_disableOutsetShadowPath:(BOOL)a3;
@end

@implementation _UIFloatingShadowView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_UIFloatingShadowView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIFloatingShadowView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39___UIFloatingShadowView_initWithFrame___block_invoke;
    v6[3] = &unk_1E52D9F70;
    v7 = v3;
    +[UIView _performSystemAppearanceModifications:v6];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFloatingShadowView;
  [(UIView *)&v3 layoutSubviews];
  [(_UIFloatingShadowView *)self _setShadowImageIfNeeded];
  [(_UIFloatingShadowView *)self _layoutShadow];
}

- (void)setShadowOpacity:(double)a3
{
  self->_double shadowOpacity = a3;
  id v5 = [(UIView *)self->_shadowView layer];
  double shadowOpacity = self->_shadowOpacity;
  *(float *)&double shadowOpacity = shadowOpacity;
  [v5 setOpacity:shadowOpacity];
}

- (void)setShadowEnabled:(BOOL)a3
{
  if (self->_shadowEnabled != a3)
  {
    self->_shadowEnabled = a3;
    [(_UIFloatingShadowView *)self _updateShadowLayer];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setShadowImage:(id)a3
{
  objc_storeStrong((id *)&self->_shadowImage, a3);
  id v5 = a3;
  id v8 = [(UIView *)self->_shadowView layer];
  id v6 = v5;
  uint64_t v7 = [v6 CGImage];

  [v8 setContents:v7];
}

- (void)setShadowContentsCenter:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_shadowContentsCenter = a3;
  id v7 = [(UIView *)self->_shadowView layer];
  objc_msgSend(v7, "setContentsCenter:", x, y, width, height);
}

- (void)_layoutShadow
{
  if ([(_UIFloatingShadowView *)self isShadowEnabled])
  {
    [(UIView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    [(_UIFloatingShadowView *)self shadowSize];
    BOOL v9 = v7 == *MEMORY[0x1E4F1DB30];
    BOOL v10 = v8 == *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (v9 && v10) {
      double v11 = v6;
    }
    else {
      double v11 = v8;
    }
    if (v9 && v10) {
      double v12 = v4;
    }
    else {
      double v12 = v7;
    }
    [(_UIFloatingShadowView *)self shadowRadius];
    double v14 = v13 / 20.0;
    double v15 = v12 / (v13 / 20.0);
    double v16 = v11 / (v13 / 20.0);
    if ([(_UIFloatingShadowView *)self _disableOutsetShadowPath]) {
      [(_UIFloatingShadowView *)self shadowRadius];
    }
    else {
      double shadowExpansion = self->_shadowExpansion;
    }
    double v18 = shadowExpansion + shadowExpansion;
    double v19 = v15 + v18;
    double v20 = v16 + v18;
    [(UIView *)self bounds];
    -[UIView setFrame:](self->_shadowView, "setFrame:", round(v22 + (v21 - v19) * 0.5), round(v24 + (v23 - v20) * 0.5), v19, v20);
    CATransform3DMakeScale(&v38, v14, v14, 0.0);
    long long v25 = *(_OWORD *)&v38.m33;
    *(_OWORD *)&self->_shadowTransform.m31 = *(_OWORD *)&v38.m31;
    *(_OWORD *)&self->_shadowTransform.m33 = v25;
    long long v26 = *(_OWORD *)&v38.m43;
    *(_OWORD *)&self->_shadowTransform.m41 = *(_OWORD *)&v38.m41;
    *(_OWORD *)&self->_shadowTransform.m43 = v26;
    long long v27 = *(_OWORD *)&v38.m13;
    *(_OWORD *)&self->_shadowTransform.m11 = *(_OWORD *)&v38.m11;
    *(_OWORD *)&self->_shadowTransform.m13 = v27;
    long long v28 = *(_OWORD *)&v38.m23;
    *(_OWORD *)&self->_shadowTransform.m21 = *(_OWORD *)&v38.m21;
    *(_OWORD *)&self->_shadowTransform.m23 = v28;
    *(double *)&long long v28 = self->_shadowVerticalOffset;
    long long v29 = *(_OWORD *)&self->_shadowTransform.m33;
    *(_OWORD *)&v37.m31 = *(_OWORD *)&self->_shadowTransform.m31;
    *(_OWORD *)&v37.m33 = v29;
    long long v30 = *(_OWORD *)&self->_shadowTransform.m43;
    *(_OWORD *)&v37.m41 = *(_OWORD *)&self->_shadowTransform.m41;
    *(_OWORD *)&v37.m43 = v30;
    long long v31 = *(_OWORD *)&self->_shadowTransform.m13;
    *(_OWORD *)&v37.m11 = *(_OWORD *)&self->_shadowTransform.m11;
    *(_OWORD *)&v37.m13 = v31;
    long long v32 = *(_OWORD *)&self->_shadowTransform.m23;
    *(_OWORD *)&v37.m21 = *(_OWORD *)&self->_shadowTransform.m21;
    *(_OWORD *)&v37.m23 = v32;
    CATransform3DTranslate(&v38, &v37, 0.0, *(CGFloat *)&v28, 0.0);
    long long v33 = *(_OWORD *)&v38.m33;
    *(_OWORD *)&self->_shadowTransform.m31 = *(_OWORD *)&v38.m31;
    *(_OWORD *)&self->_shadowTransform.m33 = v33;
    long long v34 = *(_OWORD *)&v38.m43;
    *(_OWORD *)&self->_shadowTransform.m41 = *(_OWORD *)&v38.m41;
    *(_OWORD *)&self->_shadowTransform.m43 = v34;
    long long v35 = *(_OWORD *)&v38.m13;
    *(_OWORD *)&self->_shadowTransform.m11 = *(_OWORD *)&v38.m11;
    *(_OWORD *)&self->_shadowTransform.m13 = v35;
    long long v36 = *(_OWORD *)&v38.m23;
    *(_OWORD *)&self->_shadowTransform.m21 = *(_OWORD *)&v38.m21;
    *(_OWORD *)&self->_shadowTransform.m23 = v36;
  }
}

- (void)_updateShadowLayer
{
  if (self->_shadowView || ![(_UIFloatingShadowView *)self isShadowEnabled])
  {
    if (![(_UIFloatingShadowView *)self isShadowEnabled])
    {
      [(UIView *)self->_shadowView removeFromSuperview];
      shadowView = self->_shadowView;
      self->_shadowView = 0;
    }
  }
  else
  {
    double v3 = [(_UIFloatingShadowView *)self shadowImage];
    double v4 = [UIView alloc];
    [(UIView *)self frame];
    double v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    double v6 = self->_shadowView;
    self->_shadowView = v5;

    [(UIView *)self->_shadowView setOpaque:0];
    [(UIView *)self->_shadowView setBackgroundColor:0];
    double v7 = [(UIView *)self->_shadowView layer];
    id v8 = v3;
    objc_msgSend(v7, "setContents:", objc_msgSend(v8, "CGImage"));
    [(_UIFloatingShadowView *)self shadowContentsCenter];
    objc_msgSend(v7, "setContentsCenter:");
    [v7 setOpacity:0.0];
    [v7 setZPosition:-1000.0];
    [(_UIFloatingShadowView *)self _layoutShadow];
    long long v9 = *(_OWORD *)&self->_shadowTransform.m23;
    long long v16 = *(_OWORD *)&self->_shadowTransform.m21;
    long long v17 = v9;
    long long v18 = *(_OWORD *)&self->_shadowTransform.m31;
    CGFloat m33 = self->_shadowTransform.m33;
    long long v10 = *(_OWORD *)&self->_shadowTransform.m13;
    long long v14 = *(_OWORD *)&self->_shadowTransform.m11;
    long long v15 = v10;
    long long v11 = *(_OWORD *)&self->_shadowTransform.m43;
    long long v21 = *(_OWORD *)&self->_shadowTransform.m41;
    long long v22 = v11;
    double v12 = [(UIView *)self->_shadowView layer];
    unint64_t v20 = 0xBF50624DD2F1A9FCLL;
    [v12 setTransform:&v14];

    [(UIView *)self insertSubview:self->_shadowView atIndex:0];
  }
}

- (void)_setShadowImageIfNeeded
{
  if (!self->_shadowImage)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __48___UIFloatingShadowView__setShadowImageIfNeeded__block_invoke;
    v2[3] = &unk_1E52D9F70;
    v2[4] = self;
    +[UIView _performSystemAppearanceModifications:v2];
  }
}

- (CGPath)_shadowPathForSize:(CGSize)a3 radius:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  if (qword_1EB25CB28 != -1) {
    dispatch_once(&qword_1EB25CB28, &__block_literal_global_44);
  }
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(_UIFloatingShadowView *)self cornerRadius];
  v24[2] = v16;
  *(double *)&v24[3] = a4;
  long long v17 = [MEMORY[0x1E4F29238] valueWithBytes:v24 objCType:"{?={CGSize=dd}dd}"];
  long long v18 = (CGPath *)[(id)_MergedGlobals_3_2 objectForKey:v17];
  if (!v18)
  {
    double x = round(v9 + (v13 - width) * 0.5);
    double y = round(v11 + (v15 - height) * 0.5);
    if (![(_UIFloatingShadowView *)self _disableOutsetShadowPath])
    {
      v25.origin.double x = x;
      v25.origin.double y = y;
      v25.size.double width = width;
      v25.size.double height = height;
      CGRect v26 = CGRectInset(v25, -a4, -a4);
      double x = v26.origin.x;
      double y = v26.origin.y;
      double width = v26.size.width;
      double height = v26.size.height;
    }
    [(_UIFloatingShadowView *)self cornerRadius];
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v21);
    id v22 = objc_claimAutoreleasedReturnValue();
    long long v18 = (CGPath *)[v22 CGPath];

    if (v18) {
      [(id)_MergedGlobals_3_2 setObject:v18 forKey:v17];
    }
  }

  return v18;
}

- (BOOL)isShadowEnabled
{
  return self->_shadowEnabled;
}

- (CGSize)shadowSize
{
  double width = self->_shadowSize.width;
  double height = self->_shadowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setShadowSize:(CGSize)a3
{
  self->_shadowSize = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (double)shadowVerticalOffset
{
  return self->_shadowVerticalOffset;
}

- (void)setShadowVerticalOffset:(double)a3
{
  self->_shadowVerticalOffset = a3;
}

- (double)shadowExpansion
{
  return self->_shadowExpansion;
}

- (void)setShadowExpansion:(double)a3
{
  self->_double shadowExpansion = a3;
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (CGRect)shadowContentsCenter
{
  double x = self->_shadowContentsCenter.origin.x;
  double y = self->_shadowContentsCenter.origin.y;
  double width = self->_shadowContentsCenter.size.width;
  double height = self->_shadowContentsCenter.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (BOOL)_disableOutsetShadowPath
{
  return self->__disableOutsetShadowPath;
}

- (void)set_disableOutsetShadowPath:(BOOL)a3
{
  self->__disableOutsetShadowPath = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end