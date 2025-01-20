@interface PIHeadroomSettings
+ (id)sharedInstance;
- (BOOL)useSoftLightBlendingModeForTopGradient;
- (PIHeadroomSettings)init;
- (double)blurMaskTopLocation;
- (double)blurRadius;
- (double)bottomGradientAlpha;
- (double)bottomGradientBottomLocation;
- (double)bottomGradientTopLocation;
- (double)falloffHeight;
- (double)gradientHeight;
- (double)gradientWhite;
- (double)highKeyGradientWhite;
- (double)topGradientAlpha;
- (double)topGradientBottomLocation;
- (double)topGradientTopLocation;
- (void)_setDefaultValues;
- (void)setBlurMaskTopLocation:(double)a3;
- (void)setBlurRadius:(double)a3;
- (void)setBottomGradientAlpha:(double)a3;
- (void)setBottomGradientBottomLocation:(double)a3;
- (void)setBottomGradientTopLocation:(double)a3;
- (void)setFalloffHeight:(double)a3;
- (void)setGradientHeight:(double)a3;
- (void)setGradientWhite:(double)a3;
- (void)setHighKeyGradientWhite:(double)a3;
- (void)setTopGradientAlpha:(double)a3;
- (void)setTopGradientBottomLocation:(double)a3;
- (void)setTopGradientTopLocation:(double)a3;
- (void)setUseSoftLightBlendingModeForTopGradient:(BOOL)a3;
@end

@implementation PIHeadroomSettings

- (void)setUseSoftLightBlendingModeForTopGradient:(BOOL)a3
{
  self->_useSoftLightBlendingModeForTopGradient = a3;
}

- (BOOL)useSoftLightBlendingModeForTopGradient
{
  return self->_useSoftLightBlendingModeForTopGradient;
}

- (void)setBlurMaskTopLocation:(double)a3
{
  self->_blurMaskTopLocation = a3;
}

- (double)blurMaskTopLocation
{
  return self->_blurMaskTopLocation;
}

- (void)setTopGradientBottomLocation:(double)a3
{
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = NSString;
  v5 = NSStringFromSelector(sel_topGradientBottomLocation);
  v6 = [v5 uppercaseString];
  v7 = [v4 stringWithFormat:@"PI_HEADROOM_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (double)topGradientBottomLocation
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = NSString;
  v4 = NSStringFromSelector(sel_topGradientBottomLocation);
  v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PI_HEADROOM_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (void)setTopGradientTopLocation:(double)a3
{
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = NSString;
  v5 = NSStringFromSelector(sel_topGradientTopLocation);
  v6 = [v5 uppercaseString];
  float v7 = [v4 stringWithFormat:@"PI_HEADROOM_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (double)topGradientTopLocation
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = NSString;
  v4 = NSStringFromSelector(sel_topGradientTopLocation);
  v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PI_HEADROOM_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (void)setTopGradientAlpha:(double)a3
{
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = NSString;
  v5 = NSStringFromSelector(sel_topGradientAlpha);
  v6 = [v5 uppercaseString];
  float v7 = [v4 stringWithFormat:@"PI_HEADROOM_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (double)topGradientAlpha
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = NSString;
  v4 = NSStringFromSelector(sel_topGradientAlpha);
  v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PI_HEADROOM_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (void)setBottomGradientBottomLocation:(double)a3
{
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = NSString;
  v5 = NSStringFromSelector(sel_bottomGradientBottomLocation);
  v6 = [v5 uppercaseString];
  float v7 = [v4 stringWithFormat:@"PI_HEADROOM_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (double)bottomGradientBottomLocation
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = NSString;
  v4 = NSStringFromSelector(sel_bottomGradientBottomLocation);
  v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PI_HEADROOM_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (void)setBottomGradientTopLocation:(double)a3
{
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = NSString;
  v5 = NSStringFromSelector(sel_bottomGradientTopLocation);
  v6 = [v5 uppercaseString];
  float v7 = [v4 stringWithFormat:@"PI_HEADROOM_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (double)bottomGradientTopLocation
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = NSString;
  v4 = NSStringFromSelector(sel_bottomGradientTopLocation);
  v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PI_HEADROOM_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (void)setBottomGradientAlpha:(double)a3
{
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = NSString;
  v5 = NSStringFromSelector(sel_bottomGradientAlpha);
  v6 = [v5 uppercaseString];
  float v7 = [v4 stringWithFormat:@"PI_HEADROOM_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (double)bottomGradientAlpha
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = NSString;
  v4 = NSStringFromSelector(sel_bottomGradientAlpha);
  v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PI_HEADROOM_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (void)setHighKeyGradientWhite:(double)a3
{
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = NSString;
  v5 = NSStringFromSelector(sel_highKeyGradientWhite);
  v6 = [v5 uppercaseString];
  float v7 = [v4 stringWithFormat:@"PI_HEADROOM_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (double)highKeyGradientWhite
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = NSString;
  v4 = NSStringFromSelector(sel_highKeyGradientWhite);
  v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PI_HEADROOM_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (void)setGradientWhite:(double)a3
{
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = NSString;
  v5 = NSStringFromSelector(sel_gradientWhite);
  v6 = [v5 uppercaseString];
  float v7 = [v4 stringWithFormat:@"PI_HEADROOM_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (double)gradientWhite
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = NSString;
  v4 = NSStringFromSelector(sel_gradientWhite);
  v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PI_HEADROOM_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (void)setGradientHeight:(double)a3
{
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = NSString;
  v5 = NSStringFromSelector(sel_gradientHeight);
  v6 = [v5 uppercaseString];
  float v7 = [v4 stringWithFormat:@"PI_HEADROOM_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (double)gradientHeight
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = NSString;
  v4 = NSStringFromSelector(sel_gradientHeight);
  v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PI_HEADROOM_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (void)setFalloffHeight:(double)a3
{
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = NSString;
  v5 = NSStringFromSelector(sel_falloffHeight);
  v6 = [v5 uppercaseString];
  float v7 = [v4 stringWithFormat:@"PI_HEADROOM_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (double)falloffHeight
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = NSString;
  v4 = NSStringFromSelector(sel_falloffHeight);
  v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PI_HEADROOM_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (void)setBlurRadius:(double)a3
{
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v4 = NSString;
  v5 = NSStringFromSelector(sel_blurRadius);
  v6 = [v5 uppercaseString];
  float v7 = [v4 stringWithFormat:@"PI_HEADROOM_%@", v6];
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  [v9 setFloat:v7 forKey:v8];
}

- (double)blurRadius
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = NSString;
  v4 = NSStringFromSelector(sel_blurRadius);
  v5 = [v4 uppercaseString];
  v6 = [v3 stringWithFormat:@"PI_HEADROOM_%@", v5];
  [v2 floatForKey:v6];
  double v8 = v7;

  return v8;
}

- (void)_setDefaultValues
{
  [(PIHeadroomSettings *)self setBlurRadius:7.0];
  [(PIHeadroomSettings *)self setBlurMaskTopLocation:0.49000001];
  [(PIHeadroomSettings *)self setFalloffHeight:0.180000007];
  [(PIHeadroomSettings *)self setGradientHeight:1.0];
  [(PIHeadroomSettings *)self setGradientWhite:0.0];
  [(PIHeadroomSettings *)self setHighKeyGradientWhite:1.0];
  [(PIHeadroomSettings *)self setBottomGradientAlpha:0.75999999];
  [(PIHeadroomSettings *)self setBottomGradientTopLocation:0.330000013];
  [(PIHeadroomSettings *)self setBottomGradientBottomLocation:1.0];
  [(PIHeadroomSettings *)self setTopGradientAlpha:0.709999979];
  [(PIHeadroomSettings *)self setTopGradientTopLocation:0.300000012];
  [(PIHeadroomSettings *)self setTopGradientBottomLocation:1.0];
  [(PIHeadroomSettings *)self setUseSoftLightBlendingModeForTopGradient:1];
}

- (PIHeadroomSettings)init
{
  v5.receiver = self;
  v5.super_class = (Class)PIHeadroomSettings;
  v2 = [(PIHeadroomSettings *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PIHeadroomSettings *)v2 _setDefaultValues];
  }
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_headroomSettings;
  return v2;
}

uint64_t __36__PIHeadroomSettings_sharedInstance__block_invoke()
{
  sharedInstance_headroomSettings = objc_alloc_init(PIHeadroomSettings);
  return MEMORY[0x1F41817F8]();
}

@end