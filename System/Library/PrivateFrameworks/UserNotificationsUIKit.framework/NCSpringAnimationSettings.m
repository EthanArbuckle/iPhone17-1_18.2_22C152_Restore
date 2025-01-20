@interface NCSpringAnimationSettings
+ (id)moduleWithSectionTitle:(id)a3;
+ (id)settingsControllerModule;
- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4;
- (CAFrameRateRange)frameRateRange;
- (PTFrameRateRangeSettings)preferredFrameRateRange;
- (double)dampingRatio;
- (double)response;
- (double)retargetImpulse;
- (void)animateTracking:(BOOL)a3 animations:(id)a4 completion:(id)a5;
- (void)setDampingRatio:(double)a3;
- (void)setDefaultCriticallyDampedValues;
- (void)setDefaultValues;
- (void)setFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4;
- (void)setPreferredFrameRateRange:(id)a3;
- (void)setResponse:(double)a3;
- (void)setRetargetImpulse:(double)a3;
@end

@implementation NCSpringAnimationSettings

+ (id)moduleWithSectionTitle:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = [v3 array];
  v6 = [MEMORY[0x1E4F94148] rowWithTitle:@"Damping Ratio" valueKeyPath:@"dampingRatio"];
  v7 = [v6 between:0.001 and:10.0];
  v8 = [v7 precision:3];
  [v5 addObject:v8];

  v9 = [MEMORY[0x1E4F94148] rowWithTitle:@"Response" valueKeyPath:@"response"];
  v10 = [v9 between:0.0 and:1000.0];
  v11 = [v10 precision:3];
  [v5 addObject:v11];

  v12 = [MEMORY[0x1E4F94148] rowWithTitle:@"Retarget Impulse" valueKeyPath:@"retargetImpulse"];
  v13 = [v12 between:0.0 and:1.0];
  v14 = [v13 precision:3];
  [v5 addObject:v14];

  v15 = [MEMORY[0x1E4F94130] rowWithTitle:@"Frame Rate Range" childSettingsKeyPath:@"preferredFrameRateRange"];
  [v5 addObject:v15];

  v16 = (void *)MEMORY[0x1E4F94160];
  v17 = [MEMORY[0x1E4F94160] sectionWithRows:v5 title:v4];

  v21[0] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v19 = [v16 moduleWithTitle:0 contents:v18];

  return v19;
}

+ (id)settingsControllerModule
{
  return (id)[a1 moduleWithSectionTitle:@"Spring Animation Settings"];
}

- (void)setFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  float preferred = a3.preferred;
  float maximum = a3.maximum;
  float minimum = a3.minimum;
  id v11 = [(NCSpringAnimationSettings *)self preferredFrameRateRange];
  *(float *)&double v8 = minimum;
  *(float *)&double v9 = maximum;
  *(float *)&double v10 = preferred;
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", v4, v8, v9, v10);
}

- (CAFrameRateRange)frameRateRange
{
  v2 = [(NCSpringAnimationSettings *)self preferredFrameRateRange];
  [v2 frameRateRange];
  float v4 = v3;
  float v6 = v5;
  float v8 = v7;

  float v9 = v4;
  float v10 = v6;
  float v11 = v8;
  result.float preferred = v11;
  result.float maximum = v10;
  result.float minimum = v9;
  return result;
}

- (void)animateTracking:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  float v8 = (void *)MEMORY[0x1E4FB1EB0];
  id v9 = a5;
  NCModifyFrameRateForAnimationBlockFromSettings(a4, self);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v8 _animateUsingSpringBehavior:self tracking:v6 animations:v10 completion:v9];
}

- (void)setDefaultValues
{
  [(NCSpringAnimationSettings *)self setDampingRatio:0.845];
  [(NCSpringAnimationSettings *)self setResponse:0.531];

  [(NCSpringAnimationSettings *)self setRetargetImpulse:0.0];
}

- (void)setDefaultCriticallyDampedValues
{
  [(NCSpringAnimationSettings *)self setDefaultValues];
  [(NCSpringAnimationSettings *)self setDampingRatio:1.0];

  [(NCSpringAnimationSettings *)self setResponse:0.336];
}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  retstr->var9 = 0.0;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->double var7 = 0u;
  double var7 = self->var7;
  *(_OWORD *)&retstr->var2 = 0u;
  double var8 = self->var8;
  retstr->var0 = var7;
  retstr->var1 = var8;
  retstr->var10 = self->var9;
  return self;
}

- (double)dampingRatio
{
  return self->_dampingRatio;
}

- (void)setDampingRatio:(double)a3
{
  self->_dampingRatio = a3;
}

- (double)response
{
  return self->_response;
}

- (void)setResponse:(double)a3
{
  self->_response = a3;
}

- (double)retargetImpulse
{
  return self->_retargetImpulse;
}

- (void)setRetargetImpulse:(double)a3
{
  self->_retargetImpulse = a3;
}

- (PTFrameRateRangeSettings)preferredFrameRateRange
{
  return self->_preferredFrameRateRange;
}

- (void)setPreferredFrameRateRange:(id)a3
{
}

- (void).cxx_destruct
{
}

@end