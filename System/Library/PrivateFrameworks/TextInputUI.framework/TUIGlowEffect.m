@interface TUIGlowEffect
+ (BOOL)adjustVisibilityForDarkMode:(BOOL)a3 tintColor:(CGColor *)a4 alpha:(double)a5 outTintColor:(CGColor *)a6 outAlpha:(double *)a7;
- (BOOL)pulsing;
- (CAFrameRateRange)preferredFrameRateRange;
- (CALayer)layer;
- (CGColor)tintColor;
- (TUIGlowEffect)initWithLayer:(id)a3;
- (double)blurRadius;
- (double)minimumRadius;
- (double)nonPulseRadius;
- (double)pulseInterval;
- (double)pulseRadius;
- (id)estimateAnimationValueForKeyPath:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)recordAnimation:(id)a3 duration:(double)a4 fromValue:(id)a5 toValue:(id)a6 keyPath:(id)a7;
- (void)setBlurRadius:(double)a3;
- (void)setMinimumRadius:(double)a3;
- (void)setNonPulseRadius:(double)a3;
- (void)setNonPulseRadius:(double)a3 animated:(BOOL)a4 duration:(double)a5;
- (void)setPreferredFrameRateRange:(CAFrameRateRange)a3;
- (void)setPulseInterval:(double)a3;
- (void)setPulseRadius:(double)a3;
- (void)setPulsing:(BOOL)a3;
- (void)setTintColor:(CGColor *)a3;
- (void)setTintColor:(CGColor *)a3 animated:(BOOL)a4 duration:(double)a5;
- (void)setTintColor:(CGColor *)a3 animated:(BOOL)a4 duration:(double)a5 autoreverses:(BOOL)a6 repeatCount:(double)a7;
- (void)setupFilters;
- (void)updatePropertyForKeyPath:(id)a3 oldValue:(id)a4 newValue:(id)a5 animated:(BOOL)a6 duration:(double)a7 autoreverses:(BOOL)a8 repeatCount:(double)a9;
- (void)updatePulseAnimationRadius;
@end

@implementation TUIGlowEffect

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationStates, 0);
  objc_storeStrong((id *)&self->_colorAnimation, 0);
  objc_storeStrong((id *)&self->_radiusAnimation, 0);
  objc_storeStrong((id *)&self->_pulseAnimation, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

- (CAFrameRateRange)preferredFrameRateRange
{
  float minimum = self->_preferredFrameRateRange.minimum;
  float maximum = self->_preferredFrameRateRange.maximum;
  float preferred = self->_preferredFrameRateRange.preferred;
  result.float preferred = preferred;
  result.float maximum = maximum;
  result.float minimum = minimum;
  return result;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (double)nonPulseRadius
{
  return self->_nonPulseRadius;
}

- (double)pulseRadius
{
  return self->_pulseRadius;
}

- (double)minimumRadius
{
  return self->_minimumRadius;
}

- (double)pulseInterval
{
  return self->_pulseInterval;
}

- (BOOL)pulsing
{
  return self->_pulsing;
}

- (CGColor)tintColor
{
  return self->_tintColor;
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)updatePropertyForKeyPath:(id)a3 oldValue:(id)a4 newValue:(id)a5 animated:(BOOL)a6 duration:(double)a7 autoreverses:(BOOL)a8 repeatCount:(double)a9
{
  BOOL v10 = a8;
  BOOL v12 = a6;
  id v29 = a3;
  id v16 = a4;
  id v17 = a5;
  v18 = [(TUIGlowEffect *)self layer];
  [v18 removeAnimationForKey:v29];

  if (v12)
  {
    v19 = [(TUIGlowEffect *)self estimateAnimationValueForKeyPath:v29];
    v20 = [MEMORY[0x1E4F39B48] animationWithKeyPath:v29];
    v21 = v20;
    if (v19) {
      id v22 = v19;
    }
    else {
      id v22 = v16;
    }
    [v20 setFromValue:v22];
    [v21 setToValue:v17];
    [v21 setDuration:a7];
    [v21 setRemovedOnCompletion:0];
    [v21 setFillMode:*MEMORY[0x1E4F39FA8]];
    [v21 setDelegate:self];
    *(float *)&double v23 = self->_preferredFrameRateRange.minimum;
    *(float *)&double v24 = self->_preferredFrameRateRange.maximum;
    *(float *)&double v25 = self->_preferredFrameRateRange.preferred;
    objc_msgSend(v21, "setPreferredFrameRateRange:", v23, v24, v25);
    *(float *)&double v26 = a9;
    [v21 setRepeatCount:v26];
    [v21 setAutoreverses:v10];
    v27 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
    [v21 setTimingFunction:v27];

    v28 = [(TUIGlowEffect *)self layer];
    [v28 addAnimation:v21 forKey:v29];

    [(TUIGlowEffect *)self recordAnimation:v21 duration:v16 fromValue:v17 toValue:v29 keyPath:a7];
    id v17 = v21;
  }
  else
  {
    v19 = [(TUIGlowEffect *)self layer];
    [v19 setValue:v17 forKeyPath:v29];
  }
}

- (id)estimateAnimationValueForKeyPath:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  [v4 timeIntervalSinceReferenceDate];
  double v7 = v6;
  v8 = [(NSMutableDictionary *)self->_animationStates objectForKeyedSubscript:v5];

  if (v8)
  {
    v9 = [v8 animation];
    BOOL v10 = [v9 fromValue];
    v11 = [v9 toValue];
    [v8 startTime];
    double v13 = v12;
    [v9 duration];
    if (v7 >= v13 + v14 || ([v9 duration], v15 < 2.22044605e-16))
    {
      id v16 = v11;
LABEL_5:
      CGColorRef v17 = v16;
LABEL_6:

      goto LABEL_8;
    }
    [v8 startTime];
    double v20 = v19;
    [v9 duration];
    double v22 = v21;
    CFTypeID v23 = CFGetTypeID(v10);
    if (v23 == CFGetTypeID(v11))
    {
      double v35 = (v7 - v20) / v22;
      if (v23 == CFNumberGetTypeID())
      {
        [v10 floatValue];
        double v25 = v24;
        [v11 floatValue];
        id v16 = [NSNumber numberWithDouble:v25 + v35 * (v26 - v25)];
        goto LABEL_5;
      }
      if (v23 == CGColorGetTypeID())
      {
        v27 = v10;
        v28 = v11;
        size_t NumberOfComponents = CGColorGetNumberOfComponents(v27);
        size_t v30 = CGColorGetNumberOfComponents(v27);
        if (NumberOfComponents == 4 && v30 == 4)
        {
          v31 = (float64x2_t *)CGColorGetComponents(v27);
          v32 = (float64x2_t *)CGColorGetComponents(v28);
          float64x2_t v34 = vmlaq_n_f64(v31[1], vsubq_f64(v32[1], v31[1]), v35);
          float64x2_t v36 = vmlaq_n_f64(*v31, vsubq_f64(*v32, *v31), v35);
          ColorSpace = CGColorGetColorSpace(v27);
          *(float64x2_t *)components = v36;
          float64x2_t v38 = v34;
          CGColorRef v17 = CGColorCreate(ColorSpace, components);
          CFRelease(v27);
          CFRelease(v28);
          goto LABEL_6;
        }
        CFRelease(v27);
        CFRelease(v28);
      }
    }
    CGColorRef v17 = 0;
    goto LABEL_6;
  }
  CGColorRef v17 = 0;
LABEL_8:

  return v17;
}

- (void)recordAnimation:(id)a3 duration:(double)a4 fromValue:(id)a5 toValue:(id)a6 keyPath:(id)a7
{
  id v9 = a7;
  id v10 = a3;
  v11 = objc_alloc_init(_TUICursorEffectAnimationState);
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  -[_TUICursorEffectAnimationState setStartTime:](v11, "setStartTime:");
  [(_TUICursorEffectAnimationState *)v11 setAnimation:v10];

  [(NSMutableDictionary *)self->_animationStates setObject:v11 forKeyedSubscript:v9];
}

- (void)setPreferredFrameRateRange:(CAFrameRateRange)a3
{
  float preferred = a3.preferred;
  float maximum = a3.maximum;
  float minimum = a3.minimum;
  if (!CAFrameRateRangeIsEqualToRange(self->_preferredFrameRateRange, a3))
  {
    self->_preferredFrameRateRange.float minimum = minimum;
    self->_preferredFrameRateRange.float maximum = maximum;
    self->_preferredFrameRateRange.float preferred = preferred;
    BOOL pulsing = self->_pulsing;
    [(TUIGlowEffect *)self setPulsing:pulsing];
  }
}

- (void)setBlurRadius:(double)a3
{
  if (self->_blurRadius != a3)
  {
    id v5 = objc_msgSend(NSNumber, "numberWithDouble:");
    double v6 = [NSNumber numberWithDouble:a3];
    [(TUIGlowEffect *)self updatePropertyForKeyPath:@"filters.blurFilter.inputRadius" oldValue:v5 newValue:v6 animated:0 duration:0 autoreverses:0.0 repeatCount:0.0];

    self->_blurRadius = a3;
  }
}

- (void)setNonPulseRadius:(double)a3 animated:(BOOL)a4 duration:(double)a5
{
  if (self->_nonPulseRadius != a3)
  {
    BOOL v7 = a4;
    id v9 = objc_msgSend(NSNumber, "numberWithDouble:");
    id v10 = [NSNumber numberWithDouble:a3];
    [(TUIGlowEffect *)self updatePropertyForKeyPath:@"filters.nonPulseFilter.inputRadius" oldValue:v9 newValue:v10 animated:v7 duration:0 autoreverses:a5 repeatCount:0.0];

    self->_nonPulseRadius = a3;
  }
}

- (void)setNonPulseRadius:(double)a3
{
}

- (void)setPulseRadius:(double)a3
{
  if (self->_pulseRadius != a3)
  {
    self->_pulseRadius = a3;
    [(TUIGlowEffect *)self setPulsing:self->_pulsing];
  }
}

- (void)setMinimumRadius:(double)a3
{
  if (self->_minimumRadius != a3)
  {
    self->_minimumRadius = a3;
    [(TUIGlowEffect *)self setPulsing:self->_pulsing];
  }
}

- (void)setPulseInterval:(double)a3
{
  if (self->_pulseInterval != a3)
  {
    if (self->_pulsing)
    {
      [(CABasicAnimation *)self->_pulseAnimation setDuration:a3];
      [(TUIGlowEffect *)self setPulsing:self->_pulsing];
    }
    self->_pulseInterval = a3;
  }
}

- (void)setPulsing:(BOOL)a3
{
  if (a3)
  {
    id v5 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"filters.pulseFilter.inputRadius"];
    [(CABasicAnimation *)v5 setDuration:self->_pulseInterval * 0.5];
    LODWORD(v6) = 2139095040;
    [(CABasicAnimation *)v5 setRepeatCount:v6];
    [(CABasicAnimation *)v5 setAutoreverses:1];
    [(CABasicAnimation *)v5 setDelegate:self];
    *(float *)&double v7 = self->_preferredFrameRateRange.minimum;
    *(float *)&double v8 = self->_preferredFrameRateRange.maximum;
    *(float *)&double v9 = self->_preferredFrameRateRange.preferred;
    -[CABasicAnimation setPreferredFrameRateRange:](v5, "setPreferredFrameRateRange:", v7, v8, v9);
    pulseAnimation = self->_pulseAnimation;
    self->_pulseAnimation = v5;
    v11 = v5;

    [(TUIGlowEffect *)self updatePulseAnimationRadius];
    double v12 = [(TUIGlowEffect *)self layer];
    [v12 addAnimation:v11 forKey:@"filters.pulseFilter.inputRadius"];
  }
  else
  {
    double v13 = [(TUIGlowEffect *)self layer];
    [v13 removeAnimationForKey:@"filters.pulseFilter.inputRadius"];

    double v14 = [(TUIGlowEffect *)self layer];
    double v15 = [NSNumber numberWithDouble:self->_minimumRadius];
    [v14 setValue:v15 forKeyPath:@"filters.pulseFilter.inputRadius"];

    double v12 = self->_pulseAnimation;
    self->_pulseAnimation = 0;
  }

  self->_BOOL pulsing = a3;
}

- (void)updatePulseAnimationRadius
{
  v3 = [NSNumber numberWithDouble:self->_minimumRadius];
  [(CABasicAnimation *)self->_pulseAnimation setFromValue:v3];

  v4 = [NSNumber numberWithDouble:self->_minimumRadius + self->_pulseRadius];
  [(CABasicAnimation *)self->_pulseAnimation setToValue:v4];

  id v5 = [(TUIGlowEffect *)self layer];
  [v5 removeAnimationForKey:@"filters.pulseFilter.inputRadius"];

  id v6 = [(TUIGlowEffect *)self layer];
  [v6 addAnimation:self->_pulseAnimation forKey:@"filters.pulseFilter.inputRadius"];
}

- (void)setTintColor:(CGColor *)a3 animated:(BOOL)a4 duration:(double)a5 autoreverses:(BOOL)a6 repeatCount:(double)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  BOOL v13 = !a4;
  double v14 = [(TUIGlowEffect *)self layer];
  id v18 = [v14 animationForKey:@"filters.thresholdFilter.inputColor"];

  tintColor = self->_tintColor;
  if (v18) {
    BOOL v16 = v13;
  }
  else {
    BOOL v16 = 0;
  }
  if (v16 || tintColor != a3)
  {
    [(TUIGlowEffect *)self updatePropertyForKeyPath:@"filters.thresholdFilter.inputColor" oldValue:tintColor newValue:a3 animated:v10 duration:v8 autoreverses:a5 repeatCount:a7];
    Copy = CGColorCreateCopy(a3);
    CGColorRelease(self->_tintColor);
    self->_tintColor = Copy;
  }
}

- (void)setTintColor:(CGColor *)a3 animated:(BOOL)a4 duration:(double)a5
{
}

- (void)setTintColor:(CGColor *)a3
{
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v11 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    animationStates = self->_animationStates;
    id v6 = [v11 keyPath];
    double v7 = [(NSMutableDictionary *)animationStates objectForKeyedSubscript:v6];

    id v8 = [v7 animation];

    if (v8 == v11)
    {
      double v9 = self->_animationStates;
      BOOL v10 = [v11 keyPath];
      [(NSMutableDictionary *)v9 removeObjectForKey:v10];
    }
  }
}

- (void)setupFilters
{
  v16[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F3A0D0];
  v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  id v5 = NSNumber;
  [(TUIGlowEffect *)self nonPulseRadius];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 setValue:v6 forKey:@"inputRadius"];

  [v4 setName:@"nonPulseFilter"];
  double v7 = [MEMORY[0x1E4F39BC0] filterWithType:v3];
  id v8 = NSNumber;
  [(TUIGlowEffect *)self minimumRadius];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  [v7 setValue:v9 forKey:@"inputRadius"];

  [v7 setName:@"pulseFilter"];
  BOOL v10 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F39FC8]];
  [v10 setValue:&unk_1EDC79D20 forKey:@"inputAmount"];
  objc_msgSend(v10, "setValue:forKey:", -[TUIGlowEffect tintColor](self, "tintColor"), @"inputColor");
  [v10 setName:@"thresholdFilter"];
  id v11 = [MEMORY[0x1E4F39BC0] filterWithType:v3];
  double v12 = NSNumber;
  [(TUIGlowEffect *)self blurRadius];
  BOOL v13 = objc_msgSend(v12, "numberWithDouble:");
  [v11 setValue:v13 forKey:@"inputRadius"];

  [v11 setName:@"blurFilter"];
  v16[0] = v4;
  v16[1] = v7;
  v16[2] = v10;
  v16[3] = v11;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  double v15 = [(TUIGlowEffect *)self layer];
  [v15 setFilters:v14];
}

- (void)dealloc
{
  CGColorRelease(self->_tintColor);
  v3.receiver = self;
  v3.super_class = (Class)TUIGlowEffect;
  [(TUIGlowEffect *)&v3 dealloc];
}

- (TUIGlowEffect)initWithLayer:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIGlowEffect;
  id v6 = [(TUIGlowEffect *)&v11 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_layer, a3);
    v7->_tintColor = CGColorCreateSRGB(0.2, 0.5, 1.0, 0.6);
    v7->_blurRadius = 5.0;
    v7->_BOOL pulsing = 1;
    v7->_pulseRadius = 1.5;
    *(_OWORD *)&v7->_pulseInterval = xmmword_18D516060;
    v7->_preferredFrameRateRange = CAFrameRateRangeMake(30.0, 60.0, 30.0);
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    animationStates = v7->_animationStates;
    v7->_animationStates = v8;

    [(TUIGlowEffect *)v7 setupFilters];
  }

  return v7;
}

+ (BOOL)adjustVisibilityForDarkMode:(BOOL)a3 tintColor:(CGColor *)a4 alpha:(double)a5 outTintColor:(CGColor *)a6 outAlpha:(double *)a7
{
  components[4] = *(CGFloat *)MEMORY[0x1E4F143B8];
  if (adjustVisibilityForDarkMode_tintColor_alpha_outTintColor_outAlpha__onceToken != -1)
  {
    dispatch_once(&adjustVisibilityForDarkMode_tintColor_alpha_outTintColor_outAlpha__onceToken, &__block_literal_global_3421);
    if (a3) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL result = 0;
    *a6 = a4;
    *a7 = a5;
    return result;
  }
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  if (CGColorGetNumberOfComponents(a4) <= 2) {
    goto LABEL_5;
  }
  double v12 = CGColorGetComponents(a4);
  *(CGFloat *)v13.i64 = v12[2];
  v14.f64[0] = 0.0784313725;
  int64x2_t v15 = vcgtq_f64(vabdq_f64(*(float64x2_t *)v12, (float64x2_t)vextq_s8(*(int8x16_t *)v12, v13, 8uLL)), (float64x2_t)vdupq_n_s64(0x3FB4141414141414uLL));
  if ((vorrq_s8((int8x16_t)vdupq_laneq_s64(v15, 1), vorrq_s8((int8x16_t)vcgtq_f64(vabdq_f64((float64x2_t)v13, *(float64x2_t *)v12), v14), (int8x16_t)v15)).u64[0] & 0x8000000000000000) == 0)goto LABEL_5; {
  double v43 = v12[2];
  }
  float64x2_t v44 = *(float64x2_t *)v12;
  MEMORY[0x192FA0210](adjustVisibilityForDarkMode_tintColor_alpha_outTintColor_outAlpha__extendedGrayColorSpace, 0);
  CGColorRef v17 = (CGColor *)CGColorTransformConvertColor();
  CGColorTransformRelease();
  double v18 = *CGColorGetComponents(v17);
  CGColorRelease(v17);
  if (v44.f64[0] < v44.f64[1] || v44.f64[0] < v43)
  {
    if (v44.f64[1] < v44.f64[0] || v44.f64[1] < v43)
    {
      if (v44.f64[1] >= v44.f64[0]) {
        double v20 = v44.f64[0];
      }
      else {
        double v20 = v44.f64[1];
      }
      double v21 = v43;
    }
    else
    {
      if (v44.f64[0] >= v43) {
        double v20 = v43;
      }
      else {
        double v20 = v44.f64[0];
      }
      double v21 = v44.f64[1];
    }
  }
  else
  {
    if (v44.f64[1] >= v43) {
      double v20 = v43;
    }
    else {
      double v20 = v44.f64[1];
    }
    double v21 = v44.f64[0];
  }
  double v22 = 0.0;
  if (v21 <= 0.0)
  {
    double v24 = 0.0;
  }
  else
  {
    double v23 = v21 - v20;
    double v24 = (v21 - v20) / v21;
    if (v24 != 0.0)
    {
      double v25 = (v21 - v44.f64[1]) / v23;
      double v26 = (v21 - v43) / v23;
      if (v21 == v44.f64[0])
      {
        if (v20 == v44.f64[1]) {
          double v22 = v26 + 5.0;
        }
        else {
          double v22 = 1.0 - v25;
        }
      }
      else
      {
        double v42 = (v21 - v44.f64[0]) / v23;
        if (v21 == v44.f64[1])
        {
          if (v20 == v43) {
            double v22 = v42 + 1.0;
          }
          else {
            double v22 = 3.0 - v26;
          }
        }
        else if (v20 == v44.f64[0])
        {
          double v22 = v25 + 3.0;
        }
        else
        {
          double v22 = 5.0 - v42;
        }
      }
    }
  }
  long double v27 = fmod(v22 / 6.0, 1.0);
  double v28 = 0.1;
  BOOL v29 = v18 <= 0.48;
  if (v18 <= 0.48) {
    double v30 = v21 + 0.1;
  }
  else {
    double v30 = v21;
  }
  if (v29) {
    double v28 = 0.2;
  }
  double v31 = v28 + a5;
  long double v32 = fmod(v27, 1.0) * 6.0;
  int v33 = (int)v32;
  double v34 = fmin(v24 + 0.2, 1.0);
  long double v35 = v32 - (double)(int)v32;
  double v36 = v30 * (1.0 - v34);
  double v37 = v30 * (1.0 - v34 * v35);
  double v38 = v30 * (1.0 - v34 * (1.0 - v35));
  CGFloat v39 = v30;
  CGFloat v40 = v38;
  switch(v33)
  {
    case 0:
      goto LABEL_44;
    case 1:
      CGFloat v39 = v37;
      CGFloat v40 = v30;
      goto LABEL_44;
    case 2:
      CGFloat v39 = v36;
      CGFloat v40 = v30;
      double v36 = v38;
      goto LABEL_44;
    case 3:
      CGFloat v39 = v36;
      CGFloat v40 = v37;
      goto LABEL_42;
    case 4:
      CGFloat v39 = v38;
      CGFloat v40 = v36;
LABEL_42:
      double v36 = v30;
      goto LABEL_44;
    case 5:
      CGFloat v39 = v30;
      CGFloat v40 = v36;
      double v36 = v37;
LABEL_44:
      components[0] = v39;
      components[1] = v40;
      CGFloat components[2] = v36;
      break;
    default:
      break;
  }
  components[3] = 1.0;
  CGColorRef v41 = CGColorCreate((CGColorSpaceRef)adjustVisibilityForDarkMode_tintColor_alpha_outTintColor_outAlpha__extendedSRGBColorSpace, components);
  CFAutorelease(v41);
  *a6 = v41;
  *a7 = v31;
  return 1;
}

CGColorSpaceRef __83__TUIGlowEffect_adjustVisibilityForDarkMode_tintColor_alpha_outTintColor_outAlpha___block_invoke()
{
  adjustVisibilityForDarkMode_tintColor_alpha_outTintColor_outAlpha__extendedGrayColorSpace = (uint64_t)CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBB8]);
  CGColorSpaceRef result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE8]);
  adjustVisibilityForDarkMode_tintColor_alpha_outTintColor_outAlpha__extendedSRGBColorSpace = (uint64_t)result;
  return result;
}

@end