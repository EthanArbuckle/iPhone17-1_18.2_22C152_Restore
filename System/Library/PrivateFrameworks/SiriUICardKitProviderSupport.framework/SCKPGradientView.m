@interface SCKPGradientView
+ (Class)layerClass;
- (CGPoint)gradientOrigin;
- (NSString)gradientType;
- (SCKPGradientView)initWithGradientType:(id)a3;
- (double)gradientEndOpacity;
- (double)gradientHeight;
- (double)gradientStartOpacity;
- (id)_fadeInAnimation;
- (id)_fadeOutAnimation;
- (void)_updateGradientOpacity;
- (void)layoutSubviews;
- (void)setGradientEndOpacity:(double)a3;
- (void)setGradientHeight:(double)a3;
- (void)setGradientOrigin:(CGPoint)a3;
- (void)setGradientStartOpacity:(double)a3;
- (void)setGradientType:(id)a3;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation SCKPGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SCKPGradientView)initWithGradientType:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCKPGradientView;
  v5 = -[SCKPGradientView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_gradientHeight = 240.0;
    v5->_gradientOrigin.x = 0.0;
    v5->_gradientOrigin.y = 0.0;
    [(SCKPGradientView *)v5 setGradientType:v4];
    *(void *)&v6->_gradientStartOpacity = qword_228A22D00[*MEMORY[0x263F15DE0] == (void)v4];
    v6->_gradientEndOpacity = 0.09021;
    [(SCKPGradientView *)v6 _updateGradientOpacity];
    [(SCKPGradientView *)v6 setOpaque:0];
    v7 = [MEMORY[0x263F1C550] clearColor];
    [(SCKPGradientView *)v6 setBackgroundColor:v7];

    [(SCKPGradientView *)v6 setUserInteractionEnabled:0];
    v8 = [(SCKPGradientView *)v6 layer];
    [v8 setOpacity:0.0];

    v9 = [(SCKPGradientView *)v6 layer];
    [v9 setAllowsHitTesting:0];
  }
  return v6;
}

- (void)setGradientType:(id)a3
{
  v5 = (NSString *)a3;
  p_gradientType = &self->_gradientType;
  if (self->_gradientType != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_gradientType, a3);
    v7 = [(SCKPGradientView *)self layer];
    [v7 setType:*p_gradientType];

    v5 = v8;
  }
}

- (void)setGradientStartOpacity:(double)a3
{
  if (vabdd_f64(a3, self->_gradientStartOpacity) >= 2.22044605e-16)
  {
    self->_gradientStartOpacity = a3;
    [(SCKPGradientView *)self _updateGradientOpacity];
  }
}

- (void)setGradientEndOpacity:(double)a3
{
  if (vabdd_f64(a3, self->_gradientEndOpacity) >= 2.22044605e-16)
  {
    self->_gradientEndOpacity = a3;
    [(SCKPGradientView *)self _updateGradientOpacity];
  }
}

- (void)layoutSubviews
{
  v20[2] = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)SCKPGradientView;
  [(SCKPGradientView *)&v19 layoutSubviews];
  v3 = [(SCKPGradientView *)self layer];
  [(SCKPGradientView *)self bounds];
  objc_msgSend(v3, "setFrame:");

  [(SCKPGradientView *)self frame];
  double Width = CGRectGetWidth(v21);
  [(SCKPGradientView *)self frame];
  double Height = CGRectGetHeight(v22);
  double v6 = Height;
  if (self->_gradientType == (NSString *)*MEMORY[0x263F15DE0])
  {
    CGFloat v12 = self->_gradientOrigin.x / Width;
    CGFloat v13 = self->_gradientOrigin.y / Height;
    double v14 = self->_gradientHeight * 0.5;
    CGFloat v15 = v12 - v14 / Width;
    CGFloat v16 = v13 - v14 / v6;
    v17 = [(SCKPGradientView *)self layer];
    objc_msgSend(v17, "setStartPoint:", v12, v13);

    v18 = [(SCKPGradientView *)self layer];
    objc_msgSend(v18, "setEndPoint:", v15, v16);

    v9 = [(SCKPGradientView *)self layer];
    [v9 setLocations:&unk_26DD17660];
  }
  else
  {
    v7 = [(SCKPGradientView *)self layer];
    objc_msgSend(v7, "setStartPoint:", 0.5, 1.0);

    v8 = [(SCKPGradientView *)self layer];
    objc_msgSend(v8, "setEndPoint:", 0.5, 0.0);

    v9 = [(SCKPGradientView *)self layer];
    v20[0] = &unk_26DD17640;
    v10 = [NSNumber numberWithDouble:self->_gradientHeight / v6];
    v20[1] = v10;
    objc_super v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    [v9 setLocations:v11];
  }
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_isVisible != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_isVisible = a3;
    v7 = [(SCKPGradientView *)self layer];
    v8 = v7;
    double v9 = 0.0;
    if (v5) {
      *(float *)&double v9 = 1.0;
    }
    [v7 setOpacity:v9];

    if (v4)
    {
      id v11 = [(SCKPGradientView *)self layer];
      if (v5) {
        [(SCKPGradientView *)self _fadeInAnimation];
      }
      else {
      v10 = [(SCKPGradientView *)self _fadeOutAnimation];
      }
      [v11 addAnimation:v10 forKey:0];
    }
  }
}

- (void)_updateGradientOpacity
{
  v9[2] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:self->_gradientStartOpacity];
  BOOL v4 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:self->_gradientEndOpacity];
  BOOL v5 = [(SCKPGradientView *)self layer];
  id v6 = v3;
  v9[0] = [v6 CGColor];
  id v7 = v4;
  v9[1] = [v7 CGColor];
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  [v5 setColors:v8];
}

- (id)_fadeInAnimation
{
  v2 = [MEMORY[0x263F15890] animationWithKeyPath:@"opacity"];
  [v2 setDamping:100.0];
  [v2 setMass:2.0];
  [v2 setStiffness:350.0];
  [v2 setFillMode:*MEMORY[0x263F15AA0]];
  id v3 = objc_alloc(MEMORY[0x263F15808]);
  LODWORD(v4) = 1059559876;
  LODWORD(v5) = 1.0;
  LODWORD(v6) = 1.0;
  id v7 = (void *)[v3 initWithControlPoints:v4 :0.0 :v5 :v6];
  [v2 setTimingFunction:v7];

  [v2 setRemovedOnCompletion:1];
  [v2 setDuration:2.0];
  [v2 setFromValue:&unk_26DD17678];
  [v2 setToValue:&unk_26DD17650];

  return v2;
}

- (id)_fadeOutAnimation
{
  v2 = [MEMORY[0x263F15890] animationWithKeyPath:@"opacity"];
  [v2 setDamping:500.0];
  [v2 setMass:3.0];
  [v2 setStiffness:1000.0];
  [v2 setFillMode:*MEMORY[0x263F15AA0]];
  [v2 setRemovedOnCompletion:1];
  [v2 setDuration:0.5];
  [v2 setFromValue:&unk_26DD17688];
  [v2 setToValue:&unk_26DD17678];

  return v2;
}

- (double)gradientHeight
{
  return self->_gradientHeight;
}

- (void)setGradientHeight:(double)a3
{
  self->_gradientdouble Height = a3;
}

- (CGPoint)gradientOrigin
{
  double x = self->_gradientOrigin.x;
  double y = self->_gradientOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setGradientOrigin:(CGPoint)a3
{
  self->_gradientOrigin = a3;
}

- (NSString)gradientType
{
  return self->_gradientType;
}

- (double)gradientStartOpacity
{
  return self->_gradientStartOpacity;
}

- (double)gradientEndOpacity
{
  return self->_gradientEndOpacity;
}

- (void).cxx_destruct
{
}

@end