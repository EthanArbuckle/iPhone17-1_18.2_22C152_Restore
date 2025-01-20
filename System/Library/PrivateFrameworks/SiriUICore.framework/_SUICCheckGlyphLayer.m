@interface _SUICCheckGlyphLayer
- (BOOL)isRevealed;
- (UIColor)primaryColor;
- (_SUICCheckGlyphLayer)initWithFrame:(CGRect)a3;
- (double)_pointScaleToMatchBoundsSize:(CGSize)a3;
- (double)_updateCovered:(BOOL)a3 completion:(id)a4;
- (double)setCovered:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_createMask;
- (void)layoutSublayers;
- (void)setPrimaryColor:(id)a3;
- (void)setPrimaryColor:(id)a3 animated:(BOOL)a4;
- (void)setPrimaryColor:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setRevealed:(BOOL)a3;
@end

@implementation _SUICCheckGlyphLayer

- (_SUICCheckGlyphLayer)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (void *)MEMORY[0x1E4F39C38];
  v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 URLForResource:@"glyph_check" withExtension:@"caar"];
  uint64_t v11 = *MEMORY[0x1E4F3A4B8];
  id v29 = 0;
  v12 = [v8 packageWithContentsOfURL:v10 type:v11 options:0 error:&v29];
  id v13 = v29;

  v14 = [v12 rootLayer];
  if (v14)
  {
    v28.receiver = self;
    v28.super_class = (Class)_SUICCheckGlyphLayer;
    v15 = [(_SUICCheckGlyphLayer *)&v28 init];
    if (v15)
    {
      -[_SUICCheckGlyphLayer setGeometryFlipped:](v15, "setGeometryFlipped:", [v12 isGeometryFlipped]);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v16 = v14;
      }
      else {
        v16 = 0;
      }
      p_checkPackageLayer = &v15->_checkPackageLayer;
      objc_storeStrong((id *)&v15->_checkPackageLayer, v16);
      [(CAShapeLayer *)v15->_checkPackageLayer setLineCap:*MEMORY[0x1E4F3A458]];
      [(CAShapeLayer *)v15->_checkPackageLayer bounds];
      double v19 = v18;
      double v21 = v20;
      v30.origin.double x = x;
      v30.origin.double y = y;
      v30.size.double width = width;
      v30.size.double height = height;
      if (CGRectIsNull(v30))
      {
        double x = *MEMORY[0x1E4F1DAD8];
        double y = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        double width = v19 * 0.5;
        double height = v21 * 0.5;
      }
      v22 = _SUICLayerNullActions();
      [(_SUICCheckGlyphLayer *)v15 setActions:v22];

      v23 = *p_checkPackageLayer;
      CGFloat v24 = fmin(width / v19, height / v21);
      CATransform3DMakeScale(&v27, v24, v24, 1.0);
      [(CAShapeLayer *)v23 setTransform:&v27];
      -[_SUICCheckGlyphLayer setFrame:](v15, "setFrame:", x, y, width, height);
      [(_SUICCheckGlyphLayer *)v15 addSublayer:*p_checkPackageLayer];
      if (*p_checkPackageLayer)
      {
        [(_SUICCheckGlyphLayer *)v15 _createMask];
        [(_SUICCheckGlyphLayer *)v15 _updateCovered:0 completion:0];
      }
    }
    self = v15;
    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)layoutSublayers
{
  v15.receiver = self;
  v15.super_class = (Class)_SUICCheckGlyphLayer;
  [(_SUICCheckGlyphLayer *)&v15 layoutSublayers];
  [(_SUICCheckGlyphLayer *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[_SUICCheckGlyphLayer _pointScaleToMatchBoundsSize:](self, "_pointScaleToMatchBoundsSize:", v7, v9);
  checkPackageLayer = self->_checkPackageLayer;
  CATransform3DMakeScale(&v14, v12 * 0.5, v12 * 0.5, 1.0);
  [(CAShapeLayer *)checkPackageLayer setTransform:&v14];
  v16.origin.double x = v4;
  v16.origin.double y = v6;
  v16.size.double width = v8;
  v16.size.double height = v10;
  double MidX = CGRectGetMidX(v16);
  v17.origin.double x = v4;
  v17.origin.double y = v6;
  v17.size.double width = v8;
  v17.size.double height = v10;
  -[CAShapeLayer setPosition:](self->_checkPackageLayer, "setPosition:", MidX, CGRectGetMidY(v17));
}

- (double)_pointScaleToMatchBoundsSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CAShapeLayer *)self->_checkPackageLayer bounds];
  double v7 = width / v6;
  double v8 = 0.0;
  if (v6 == 0.0) {
    double v7 = 0.0;
  }
  if (v5 != 0.0) {
    double v8 = height / v5;
  }
  double v9 = fmin(v7, v8);
  return v9 + v9;
}

- (void)_createMask
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v4 = [v3 CGColor];

  id v5 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.0];
  uint64_t v6 = [v5 CGColor];

  double v7 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E4F39BD0]);
  maskLayer = self->_maskLayer;
  self->_maskLayer = v7;

  double v9 = self->_maskLayer;
  v40[0] = v6;
  v40[1] = v4;
  CGFloat v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  [(CAGradientLayer *)v9 setColors:v10];

  -[CAGradientLayer setAnchorPoint:](self->_maskLayer, "setAnchorPoint:", 1.0, 0.0);
  uint64_t v11 = self->_maskLayer;
  double v12 = _SUICLayerNullActions();
  [(CAGradientLayer *)v11 setActions:v12];

  [(CAShapeLayer *)self->_checkPackageLayer setMask:self->_maskLayer];
  [(CAShapeLayer *)self->_checkPackageLayer bounds];
  double x = v41.origin.x;
  CGFloat y = v41.origin.y;
  CGFloat width = v41.size.width;
  CGFloat height = v41.size.height;
  CGFloat v17 = v41.size.width * 0.363636364;
  double MinY = CGRectGetMinY(v41);
  double v19 = (v17 - x) / 0.707106781;
  v42.origin.double x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  double v20 = (CGRectGetMaxX(v42) - v17) / 0.707106781;
  CGFloat v21 = v17 + v20 * 0.707106781 + v19 * -0.707106781;
  double v22 = MinY + v20 * 0.707106781 + v19 * 0.707106781;
  double v23 = sqrt((v21 - v17) * (v21 - v17) + (v22 - MinY) * (v22 - MinY));
  -[CAGradientLayer setPosition:](self->_maskLayer, "setPosition:", v21 + 2.82842712, v22 + 2.82842712);
  double v24 = fmax(v19, fmax(v20, v23)) + 8.0;
  -[CAGradientLayer setBounds:](self->_maskLayer, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v24, v24);
  -[CAGradientLayer setStartPoint:](self->_maskLayer, "setStartPoint:", 0.5, 0.0);
  -[CAGradientLayer setEndPoint:](self->_maskLayer, "setEndPoint:", 0.5, 4.0 / v24);
  p_uncoveredTransform = &self->_uncoveredTransform;
  CATransform3DMakeRotation(&v39, 0.785398163, 0.0, 0.0, 1.0);
  long long v26 = *(_OWORD *)&v39.m33;
  *(_OWORD *)&self->_uncoveredTransform.m31 = *(_OWORD *)&v39.m31;
  *(_OWORD *)&self->_uncoveredTransform.m33 = v26;
  long long v27 = *(_OWORD *)&v39.m43;
  *(_OWORD *)&self->_uncoveredTransform.m41 = *(_OWORD *)&v39.m41;
  *(_OWORD *)&self->_uncoveredTransform.m43 = v27;
  long long v28 = *(_OWORD *)&v39.m13;
  *(_OWORD *)&self->_uncoveredTransform.m11 = *(_OWORD *)&v39.m11;
  *(_OWORD *)&self->_uncoveredTransform.m13 = v28;
  long long v29 = *(_OWORD *)&v39.m23;
  *(_OWORD *)&self->_uncoveredTransform.m21 = *(_OWORD *)&v39.m21;
  *(_OWORD *)&self->_uncoveredTransform.m23 = v29;
  self = (_SUICCheckGlyphLayer *)((char *)self + 184);
  long long v30 = *(_OWORD *)&p_uncoveredTransform->m33;
  *(_OWORD *)&v38.m31 = *(_OWORD *)&p_uncoveredTransform->m31;
  *(_OWORD *)&v38.m33 = v30;
  long long v31 = *(_OWORD *)&p_uncoveredTransform->m43;
  *(_OWORD *)&v38.m41 = *(_OWORD *)&p_uncoveredTransform->m41;
  *(_OWORD *)&v38.m43 = v31;
  long long v32 = *(_OWORD *)&p_uncoveredTransform->m13;
  *(_OWORD *)&v38.m11 = *(_OWORD *)&p_uncoveredTransform->m11;
  *(_OWORD *)&v38.m13 = v32;
  long long v33 = *(_OWORD *)&p_uncoveredTransform->m23;
  *(_OWORD *)&v38.m21 = *(_OWORD *)&p_uncoveredTransform->m21;
  *(_OWORD *)&v38.m23 = v33;
  CATransform3DRotate(&v39, &v38, 1.57079633, 0.0, 0.0, 1.0);
  long long v34 = *(_OWORD *)&v39.m33;
  *(_OWORD *)&self->_uncoveredTransform.m12 = *(_OWORD *)&v39.m31;
  *(_OWORD *)&self->_uncoveredTransform.m14 = v34;
  long long v35 = *(_OWORD *)&v39.m43;
  *(_OWORD *)&self->_uncoveredTransform.m22 = *(_OWORD *)&v39.m41;
  *(_OWORD *)&self->_uncoveredTransform.m24 = v35;
  long long v36 = *(_OWORD *)&v39.m13;
  *(_OWORD *)&self->super.super.isa = *(_OWORD *)&v39.m11;
  *(_OWORD *)&self->super._attr.layer = v36;
  long long v37 = *(_OWORD *)&v39.m23;
  *(_OWORD *)&self->_checkPackageLayer = *(_OWORD *)&v39.m21;
  *(_OWORD *)&self->_covered = v37;
}

- (void)setPrimaryColor:(id)a3 animated:(BOOL)a4
{
}

- (void)setPrimaryColor:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  double v8 = (UIColor *)a3;
  id v9 = a5;
  primaryColor = self->_primaryColor;
  if (v8 && primaryColor)
  {
    if (![(UIColor *)primaryColor isEqual:v8])
    {
LABEL_6:
      uint64_t v11 = (UIColor *)[(UIColor *)v8 copy];
      double v12 = self->_primaryColor;
      self->_primaryColor = v11;

      id v13 = [(UIColor *)self->_primaryColor CGColor];
      if (v6)
      {
        CATransform3D v14 = [(CAShapeLayer *)self->_checkPackageLayer presentationLayer];
        uint64_t v15 = [v14 strokeColor];
        CGRect v16 = +[_SUICCheckGlyphSpringAnimationFactory springAnimationWithKeyPath:@"strokeColor"];
        [v16 setAdditive:0];
        [v16 setFromValue:v15];
        [v16 setToValue:v13];
        uint64_t v17 = [v14 fillColor];
        double v18 = +[_SUICCheckGlyphSpringAnimationFactory springAnimationWithKeyPath:@"fillColor"];

        [v18 setAdditive:0];
        [v18 setFromValue:v17];
        [v18 setToValue:v13];
        [MEMORY[0x1E4F39CF8] begin];
        if (v9)
        {
          double v19 = (void *)MEMORY[0x1E4F39CF8];
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __60___SUICCheckGlyphLayer_setPrimaryColor_animated_completion___block_invoke;
          v20[3] = &unk_1E5C593F8;
          id v21 = v9;
          [v19 setCompletionBlock:v20];
        }
        [(CAShapeLayer *)self->_checkPackageLayer removeAnimationForKey:@"strokeColor"];
        [(CAShapeLayer *)self->_checkPackageLayer removeAnimationForKey:@"fillColor"];
        [(CAShapeLayer *)self->_checkPackageLayer addAnimation:v18 forKey:@"strokeColor"];
        [(CAShapeLayer *)self->_checkPackageLayer addAnimation:v18 forKey:@"fillColor"];
        [MEMORY[0x1E4F39CF8] commit];
      }
      [(CAShapeLayer *)self->_checkPackageLayer setStrokeColor:v13];
      [(CAShapeLayer *)self->_checkPackageLayer setFillColor:v13];
      goto LABEL_11;
    }
    primaryColor = self->_primaryColor;
  }
  if (primaryColor != v8) {
    goto LABEL_6;
  }
  if (v9) {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }
LABEL_11:
}

- (BOOL)isRevealed
{
  return self->_covered;
}

- (void)setRevealed:(BOOL)a3
{
}

- (double)setCovered:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  if ((!self->_covered ^ a3)) {
    return 0.0;
  }
  self->_covered = a3;
  [(_SUICCheckGlyphLayer *)self _updateCovered:a4 completion:a5];
  return result;
}

- (double)_updateCovered:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (self->_covered) {
    double v7 = &OBJC_IVAR____SUICCheckGlyphLayer__coveredTransform;
  }
  else {
    double v7 = &OBJC_IVAR____SUICCheckGlyphLayer__uncoveredTransform;
  }
  double v8 = (_OWORD *)((char *)self + *v7);
  long long v9 = v8[5];
  *(_OWORD *)&v27.m31 = v8[4];
  *(_OWORD *)&v27.m33 = v9;
  long long v10 = v8[7];
  *(_OWORD *)&v27.m41 = v8[6];
  *(_OWORD *)&v27.m43 = v10;
  long long v11 = v8[1];
  *(_OWORD *)&v27.m11 = *v8;
  *(_OWORD *)&v27.m13 = v11;
  long long v12 = v8[3];
  *(_OWORD *)&v27.m21 = v8[2];
  *(_OWORD *)&v27.m23 = v12;
  memset(&v26, 0, sizeof(v26));
  maskLayer = self->_maskLayer;
  if (maskLayer) {
    [(CAGradientLayer *)maskLayer transform];
  }
  CATransform3D a = v27;
  CATransform3D b = v26;
  if (!CATransform3DEqualToTransform(&a, &b))
  {
    if (v4)
    {
      CATransform3D v14 = +[_SUICCheckGlyphSpringAnimationFactory springAnimationWithKeyPath:@"transform"];
      [MEMORY[0x1E4F39CF8] begin];
      if (v6)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F39CF8];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __50___SUICCheckGlyphLayer__updateCovered_completion___block_invoke;
        v22[3] = &unk_1E5C593F8;
        id v23 = v6;
        [v15 setCompletionBlock:v22];
      }
      CATransform3D a = v26;
      CATransform3D b = v27;
      objc_msgSend(v14, "_suic_updateForAdditiveAnimationFromTransform:toTransform:", &a, &b);
      id v16 = (id)[(CAGradientLayer *)self->_maskLayer _suic_addAdditiveAnimation:v14];
      [MEMORY[0x1E4F39CF8] commit];
      [v14 duration];
      uint64_t v17 = self->_maskLayer;
      double v19 = fmax(v18, 0.0);
      CATransform3D a = v27;
      [(CAGradientLayer *)v17 setTransform:&a];

      goto LABEL_14;
    }
    double v20 = self->_maskLayer;
    CATransform3D a = v27;
    [(CAGradientLayer *)v20 setTransform:&a];
  }
  double v19 = 0.0;
  if (v6) {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
LABEL_14:

  return v19;
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (void)setPrimaryColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);

  objc_storeStrong((id *)&self->_checkPackageLayer, 0);
}

@end