@interface PREditingReticleView
+ (double)borderColor;
+ (double)maxBorderColor;
+ (double)minBorderColor;
+ (double)vibrancyStrength;
+ (id)reticleVibrancyForVibrancyConfiguration:(id)a3;
- (BOOL)isActive;
- (PREditingReticleView)init;
- (UIView)emptyView;
- (UIView)outlineBorderView;
- (double)outlineBorderCornerRadius;
- (void)_startActiveAnimation;
- (void)_stopActiveAnimation;
- (void)setActive:(BOOL)a3;
- (void)setEmptyView:(id)a3;
- (void)setOutlineBorderCornerRadius:(double)a3;
@end

@implementation PREditingReticleView

+ (double)borderColor
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 objectForKey:@"PRReticleBorderColor"];
  v4 = v3;
  if (!v3) {
    v3 = &unk_1ED9EF100;
  }
  [v3 doubleValue];
  double v6 = v5;

  return v6;
}

+ (double)minBorderColor
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 objectForKey:@"PRReticleMinBorderColor"];
  v4 = v3;
  if (!v3) {
    v3 = &unk_1ED9EF110;
  }
  [v3 doubleValue];
  double v6 = v5;

  return v6;
}

+ (double)maxBorderColor
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 objectForKey:@"PRReticleMaxBorderColor"];
  v4 = v3;
  if (!v3) {
    v3 = &unk_1ED9EF120;
  }
  [v3 doubleValue];
  double v6 = v5;

  return v6;
}

+ (double)vibrancyStrength
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 objectForKey:@"PRReticleVibrancyStrength"];
  v4 = v3;
  if (!v3) {
    v3 = &unk_1ED9EF130;
  }
  [v3 doubleValue];
  double v6 = v5;

  return v6;
}

+ (id)reticleVibrancyForVibrancyConfiguration:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4FB1618];
  +[PREditingReticleView vibrancyStrength];
  double v6 = [v4 colorWithWhite:1.0 alpha:v5];
  if (v3)
  {
    v7 = (void *)[v3 copyWithEffectType:0 color:v6];
    v8 = (void *)[v7 copyWithGroupName:0];
  }
  else
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F4F8E8]) initWithEffectType:0 backgroundType:0 color:v6 groupName:0];
  }

  return v8;
}

- (PREditingReticleView)init
{
  v18.receiver = self;
  v18.super_class = (Class)PREditingReticleView;
  v2 = [(PREditingReticleView *)&v18 init];
  id v3 = v2;
  if (v2)
  {
    v4 = [(PREditingReticleView *)v2 layer];
    [v4 setAllowsGroupOpacity:0];

    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(PREditingReticleView *)v3 bounds];
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:");
    outlineBorderView = v3->_outlineBorderView;
    v3->_outlineBorderView = (UIView *)v6;

    [(UIView *)v3->_outlineBorderView setAutoresizingMask:18];
    v8 = [(UIView *)v3->_outlineBorderView layer];
    v9 = (void *)MEMORY[0x1E4FB1618];
    +[PREditingReticleView borderColor];
    objc_msgSend(v9, "colorWithWhite:alpha:");
    id v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBorderColor:", objc_msgSend(v10, "CGColor"));

    v11 = [(UIView *)v3->_outlineBorderView layer];
    [v11 setBorderWidth:3.0];

    v12 = [(UIView *)v3->_outlineBorderView layer];
    v13 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v14 = [v13 userInterfaceIdiom];

    double v15 = 16.0;
    if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v15 = 20.0;
    }
    [v12 setCornerRadius:v15];

    v16 = [(UIView *)v3->_outlineBorderView layer];
    [v16 setCornerCurve:*MEMORY[0x1E4F39EA8]];

    [(PREditingReticleView *)v3 addSubview:v3->_outlineBorderView];
    [(PREditingReticleView *)v3 setAccessibilityIdentifier:@"posterboard-editing-reticle-view"];
  }
  return v3;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3) {
      [(PREditingReticleView *)self _startActiveAnimation];
    }
    else {
      [(PREditingReticleView *)self _stopActiveAnimation];
    }
  }
}

- (void)setOutlineBorderCornerRadius:(double)a3
{
  if (self->_outlineBorderCornerRadius != a3)
  {
    self->_outlineBorderCornerRadius = a3;
    id v4 = [(UIView *)self->_outlineBorderView layer];
    [v4 setCornerRadius:a3];
  }
}

- (void)_startActiveAnimation
{
  id v26 = [(PREditingReticleView *)self outlineBorderView];
  v2 = (void *)MEMORY[0x1E4FB1618];
  +[PREditingReticleView minBorderColor];
  id v3 = objc_msgSend(v2, "colorWithWhite:alpha:");
  id v4 = (void *)MEMORY[0x1E4FB1618];
  +[PREditingReticleView maxBorderColor];
  id v5 = objc_msgSend(v4, "colorWithWhite:alpha:");
  CAFrameRateRange v28 = CAFrameRateRangeMake(20.0, 30.0, 24.0);
  float minimum = v28.minimum;
  float maximum = v28.maximum;
  float preferred = v28.preferred;
  v9 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"borderColor"];
  id v10 = [v26 layer];
  objc_msgSend(v9, "setFromValue:", objc_msgSend(v10, "borderColor"));

  id v11 = v3;
  objc_msgSend(v9, "setToValue:", objc_msgSend(v11, "CGColor"));
  [v9 setDuration:0.5];
  uint64_t v12 = *MEMORY[0x1E4F39D98];
  [v9 setBeginTimeMode:*MEMORY[0x1E4F39D98]];
  *(float *)&double v13 = minimum;
  *(float *)&double v14 = maximum;
  *(float *)&double v15 = preferred;
  objc_msgSend(v9, "setPreferredFrameRateRange:", v13, v14, v15);
  v16 = [v26 layer];
  [v16 addAnimation:v9 forKey:@"pre-active animation"];

  v17 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"borderColor"];
  id v18 = v11;
  objc_msgSend(v17, "setFromValue:", objc_msgSend(v18, "CGColor"));
  id v19 = v5;
  objc_msgSend(v17, "setToValue:", objc_msgSend(v19, "CGColor"));
  LODWORD(v20) = 2139095040;
  [v17 setRepeatCount:v20];
  [v17 setDuration:0.7];
  [v17 setAutoreverses:1];
  [v17 setBeginTime:0.5];
  [v17 setBeginTimeMode:v12];
  *(float *)&double v21 = minimum;
  *(float *)&double v22 = maximum;
  *(float *)&double v23 = preferred;
  objc_msgSend(v17, "setPreferredFrameRateRange:", v21, v22, v23);
  v24 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v17 setTimingFunction:v24];

  v25 = [v26 layer];
  [v25 addAnimation:v17 forKey:@"active animation"];
}

- (void)_stopActiveAnimation
{
  id v12 = [(PREditingReticleView *)self outlineBorderView];
  v2 = [v12 layer];
  id v3 = [v2 presentationLayer];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v12 layer];
  }
  uint64_t v6 = v5;

  v7 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"borderColor"];
  objc_msgSend(v7, "setFromValue:", objc_msgSend(v6, "borderColor"));
  v8 = (void *)MEMORY[0x1E4FB1618];
  +[PREditingReticleView borderColor];
  objc_msgSend(v8, "colorWithWhite:alpha:");
  id v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToValue:", objc_msgSend(v9, "CGColor"));

  [MEMORY[0x1E4FB1EB0] _currentAnimationDuration];
  if (v10 == 0.0) {
    double v10 = 0.3;
  }
  [v7 setDuration:v10];
  CAFrameRateRange v14 = CAFrameRateRangeMake(20.0, 30.0, 24.0);
  objc_msgSend(v7, "setPreferredFrameRateRange:", *(double *)&v14.minimum, *(double *)&v14.maximum, *(double *)&v14.preferred);
  id v11 = [v12 layer];
  [v11 addAnimation:v7 forKey:@"active animation"];
}

- (BOOL)isActive
{
  return self->_active;
}

- (double)outlineBorderCornerRadius
{
  return self->_outlineBorderCornerRadius;
}

- (UIView)emptyView
{
  return self->_emptyView;
}

- (void)setEmptyView:(id)a3
{
}

- (UIView)outlineBorderView
{
  return self->_outlineBorderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outlineBorderView, 0);
  objc_storeStrong((id *)&self->_emptyView, 0);
}

@end