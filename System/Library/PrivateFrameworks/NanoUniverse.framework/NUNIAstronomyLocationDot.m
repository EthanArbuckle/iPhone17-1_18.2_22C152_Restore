@interface NUNIAstronomyLocationDot
+ (double)defaultPulseAlphaDelay;
+ (double)defaultPulseDuration;
+ (id)_defaultColor;
- (BOOL)animating;
- (NUNIAstronomyLocationDot)init;
- (NUNIAstronomyLocationDot)initWithConfiguration:(id)a3;
- (NUNIAstronomyLocationDot)initWithFrame:(CGRect)a3 configuration:(id)a4;
- (UIColor)innerDotColor;
- (UIColor)outerDotColor;
- (double)innerDotDiameter;
- (double)outerDotDiameter;
- (double)pulseAlphaDelay;
- (double)pulseDuration;
- (double)screenScale;
- (void)_generateInnerDotImage;
- (void)layoutSubviews;
- (void)setAnimating:(BOOL)a3;
- (void)setInnerDotColor:(id)a3;
- (void)setInnerDotDiameter:(double)a3;
- (void)setOuterDotColor:(id)a3;
- (void)setOuterDotDiameter:(double)a3;
- (void)setPulseAlphaDelay:(double)a3;
- (void)setPulseDuration:(double)a3;
- (void)startAnimation;
- (void)startAnimationWithCompletionBlock:(id)a3;
- (void)stopAnimation;
@end

@implementation NUNIAstronomyLocationDot

- (NUNIAstronomyLocationDot)init
{
  v3 = objc_alloc_init(NUNIAstronomyLocationDotConfiguration);
  v4 = [(NUNIAstronomyLocationDot *)self initWithConfiguration:v3];

  return v4;
}

- (NUNIAstronomyLocationDot)initWithConfiguration:(id)a3
{
  id v4 = a3;
  [v4 defaultSize];
  v7 = -[NUNIAstronomyLocationDot initWithFrame:configuration:](self, "initWithFrame:configuration:", v4, 0.0, 0.0, v5, v6);

  return v7;
}

- (NUNIAstronomyLocationDot)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)NUNIAstronomyLocationDot;
  v11 = -[NUNIAstronomyLocationDot initWithFrame:](&v26, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    p_configuration = (id *)&v11->_configuration;
    objc_storeStrong((id *)&v11->_configuration, a4);
    v14 = +[NUNIAstronomyLocationDot _defaultColor];
    [*p_configuration defaultOuterDotDiameter];
    v12->_outerDotDiameter = v15;
    [*p_configuration defaultInnerDotDiameter];
    v12->_innerDotDiameter = v16;
    +[NUNIAstronomyLocationDot defaultPulseDuration];
    v12->_pulseDuration = v17;
    +[NUNIAstronomyLocationDot defaultPulseAlphaDelay];
    v12->_pulseAlphaDeladouble y = v18;
    v19 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    innerDotImageView = v12->_innerDotImageView;
    v12->_innerDotImageView = v19;

    id v21 = objc_alloc(MEMORY[0x263F82E00]);
    uint64_t v22 = objc_msgSend(v21, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    outerDot = v12->_outerDot;
    v12->_outerDot = (UIView *)v22;

    v24 = [(UIView *)v12->_outerDot layer];
    objc_msgSend(v24, "setAnchorPoint:", 0.5, 0.5);

    [(NUNIAstronomyLocationDot *)v12 setOuterDotColor:v14];
    [(NUNIAstronomyLocationDot *)v12 setInnerDotColor:v14];
    [(NUNIAstronomyLocationDot *)v12 addSubview:v12->_outerDot];
    [(NUNIAstronomyLocationDot *)v12 addSubview:v12->_innerDotImageView];
  }
  return v12;
}

- (void)_generateInnerDotImage
{
  [(NUNIAstronomyLocationDot *)self screenScale];
  CGFloat v4 = v3;
  double innerDotDiameter = self->_innerDotDiameter;
  CGFloat v6 = ceil(innerDotDiameter + 1.73205078 + innerDotDiameter * 1.05 * 2.0);
  v22.double width = v6;
  v22.double height = v6;
  UIGraphicsBeginImageContextWithOptions(v22, 0, v4);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v8 = [MEMORY[0x263F825C8] blackColor];
  v9 = (CGColor *)[v8 CGColor];
  v23.double width = 0.50000006;
  v23.double height = 0.866025388;
  CGContextSetShadowWithColor(CurrentContext, v23, innerDotDiameter * 1.05, v9);

  [(NUNIAstronomyLocationDotConfiguration *)self->_configuration screenScale];
  uint64_t v19 = v10;
  UIRectCenteredIntegralRectScale();
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGContextSetFillColorWithColor(CurrentContext, [(UIColor *)self->_innerDotColor CGColor]);
  v24.origin.double x = v12;
  v24.origin.double y = v14;
  v24.size.double width = v16;
  v24.size.double height = v18;
  CGContextAddEllipseInRect(CurrentContext, v24);
  CGContextFillPath(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  [(UIImageView *)self->_innerDotImageView setImage:v20];
  -[UIImageView setBounds:](self->_innerDotImageView, "setBounds:", 0.0, 0.0, v6, v6);
}

- (double)screenScale
{
  [(NUNIAstronomyLocationDotConfiguration *)self->_configuration screenScale];
  return result;
}

+ (id)_defaultColor
{
  return (id)[MEMORY[0x263F825C8] colorWithRed:0.129411765 green:0.756862745 blue:0.360784314 alpha:1.0];
}

+ (double)defaultPulseDuration
{
  return 2.0;
}

+ (double)defaultPulseAlphaDelay
{
  return 1.0;
}

- (void)setOuterDotColor:(id)a3
{
  id v5 = a3;
  if ((CLKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_outerDotColor, a3);
    [(UIView *)self->_outerDot setBackgroundColor:v5];
  }
}

- (void)setInnerDotColor:(id)a3
{
  id v5 = a3;
  if ((CLKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_innerDotColor, a3);
    [(NUNIAstronomyLocationDot *)self _generateInnerDotImage];
  }
}

- (void)setOuterDotDiameter:(double)a3
{
  self->_outerDotDiameter = a3;
  [(NUNIAstronomyLocationDot *)self setNeedsLayout];
}

- (void)setInnerDotDiameter:(double)a3
{
  if (self->_innerDotDiameter != a3)
  {
    self->_double innerDotDiameter = a3;
    [(NUNIAstronomyLocationDot *)self _generateInnerDotImage];
    [(NUNIAstronomyLocationDot *)self setNeedsLayout];
  }
}

- (void)setPulseDuration:(double)a3
{
  self->_pulseDuration = a3;
  if (self->_animating)
  {
    [(NUNIAstronomyLocationDot *)self stopAnimation];
    [(NUNIAstronomyLocationDot *)self startAnimation];
  }
}

- (void)startAnimation
{
}

- (void)startAnimationWithCompletionBlock:(id)a3
{
  v17[3] = *MEMORY[0x263EF8340];
  CGFloat v4 = (void (**)(void))a3;
  [(NUNIAstronomyLocationDot *)self stopAnimation];
  self->_animating = 1;
  [(UIImageView *)self->_innerDotImageView setAlpha:1.0];
  [(UIView *)self->_outerDot setAlpha:0.0];
  -[UIView setBounds:](self->_outerDot, "setBounds:", 0.0, 0.0, self->_outerDotDiameter, self->_outerDotDiameter);
  if (self->_pulseDuration <= 0.0)
  {
    if (v4) {
      v4[2](v4);
    }
  }
  else
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setCompletionBlock:v4];
    id v5 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale"];
    [v5 setDuration:self->_pulseDuration];
    CGFloat v6 = [NSNumber numberWithDouble:self->_innerDotDiameter / self->_outerDotDiameter];
    [v5 setFromValue:v6];

    [v5 setToValue:&unk_26CFE7928];
    v7 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v7 setDuration:self->_pulseDuration - self->_pulseAlphaDelay];
    [v7 setFromValue:&unk_26CFE7928];
    [v7 setToValue:&unk_26CFE7928];
    id v8 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
    [v8 setDuration:self->_pulseDuration - self->_pulseAlphaDelay];
    [v8 setFromValue:&unk_26CFE7928];
    [v8 setToValue:&unk_26CFE7938];
    [v8 setBeginTime:self->_pulseAlphaDelay];
    LODWORD(v9) = 1050253722;
    LODWORD(v10) = *(_DWORD *)"333?";
    LODWORD(v11) = 1.0;
    CGFloat v12 = [MEMORY[0x263F15808] functionWithControlPoints:v9 :0.0 :v10 :v11];
    [v8 setTimingFunction:v12];

    double v13 = [MEMORY[0x263F15750] animation];
    v17[0] = v5;
    v17[1] = v7;
    v17[2] = v8;
    CGFloat v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
    [v13 setAnimations:v14];

    [v13 setDuration:self->_pulseDuration];
    LODWORD(v15) = 2.0;
    [v13 setRepeatCount:v15];
    [v13 setFrameInterval:0.0666666667];
    [v13 setDiscretizesTime:1];
    CGFloat v16 = [(UIView *)self->_outerDot layer];
    [v16 addAnimation:v13 forKey:@"pulse"];

    [MEMORY[0x263F158F8] commit];
  }
}

- (void)stopAnimation
{
  self->_animating = 0;
  id v2 = [(UIView *)self->_outerDot layer];
  [v2 removeAnimationForKey:@"pulse"];
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)NUNIAstronomyLocationDot;
  [(NUNIAstronomyLocationDot *)&v9 layoutSubviews];
  [(NUNIAstronomyLocationDot *)self bounds];
  [(NUNIAstronomyLocationDotConfiguration *)self->_configuration screenScale];
  uint64_t v7 = v3;
  UIRectCenteredIntegralRectScale();
  [(UIView *)self->_outerDot setFrame:v7];
  CGFloat v4 = [(UIView *)self->_outerDot layer];
  [v4 setCornerRadius:self->_outerDotDiameter * 0.5];

  innerDotImageView = self->_innerDotImageView;
  [(UIImageView *)innerDotImageView bounds];
  [(NUNIAstronomyLocationDotConfiguration *)self->_configuration screenScale];
  uint64_t v8 = v6;
  UIRectCenteredIntegralRectScale();
  [(UIImageView *)innerDotImageView setFrame:v8];
}

- (UIColor)outerDotColor
{
  return self->_outerDotColor;
}

- (double)outerDotDiameter
{
  return self->_outerDotDiameter;
}

- (UIColor)innerDotColor
{
  return self->_innerDotColor;
}

- (double)innerDotDiameter
{
  return self->_innerDotDiameter;
}

- (double)pulseDuration
{
  return self->_pulseDuration;
}

- (double)pulseAlphaDelay
{
  return self->_pulseAlphaDelay;
}

- (void)setPulseAlphaDelay:(double)a3
{
  self->_pulseAlphaDeladouble y = a3;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerDotColor, 0);
  objc_storeStrong((id *)&self->_outerDotColor, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_innerDotImageView, 0);
  objc_storeStrong((id *)&self->_outerDot, 0);
}

@end