@interface _UIBackdropViewSettings
+ (id)darkeningTintColor;
+ (id)settingsForStyle:(int64_t)a3;
+ (id)settingsForStyle:(int64_t)a3 graphicsQuality:(int64_t)a4;
+ (id)settingsPreservingHintsFromSettings:(id)a3 graphicsQuality:(int64_t)a4;
- (BOOL)appliesTintAndBlurSettings;
- (BOOL)blursWithHardEdges;
- (BOOL)darkenWithSourceOver;
- (BOOL)designMode;
- (BOOL)explicitlySetGraphicsQuality;
- (BOOL)isBackdropVisible;
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (BOOL)lightenGrayscaleWithSourceOver;
- (BOOL)requiresColorStatistics;
- (BOOL)usesBackdropEffectView;
- (BOOL)usesColorBurnTintView;
- (BOOL)usesColorOffset;
- (BOOL)usesColorTintView;
- (BOOL)usesContentView;
- (BOOL)usesDarkeningTintView;
- (BOOL)usesGrayscaleTintView;
- (BOOL)zoomsBack;
- (NSString)blurQuality;
- (NSValue)colorOffsetMatrix;
- (UIColor)colorTint;
- (UIColor)combinedTintColor;
- (UIColor)legibleColor;
- (UIImage)colorBurnTintMaskImage;
- (UIImage)colorTintMaskImage;
- (UIImage)darkeningTintMaskImage;
- (UIImage)filterMaskImage;
- (UIImage)grayscaleTintMaskImage;
- (_UIBackdropColorSettings)colorSettings;
- (_UIBackdropView)backdrop;
- (_UIBackdropViewSettings)initWithDefaultValues;
- (_UIBackdropViewSettings)initWithDefaultValuesForGraphicsQuality:(int64_t)a3;
- (double)blurRadius;
- (double)colorBurnTintAlpha;
- (double)colorBurnTintLevel;
- (double)colorOffsetAlpha;
- (double)colorTintAlpha;
- (double)colorTintMaskAlpha;
- (double)darkeningTintAlpha;
- (double)darkeningTintBrightness;
- (double)darkeningTintHue;
- (double)darkeningTintSaturation;
- (double)filterMaskAlpha;
- (double)grayscaleTintAlpha;
- (double)grayscaleTintLevel;
- (double)grayscaleTintMaskAlpha;
- (double)saturationDeltaFactor;
- (double)scale;
- (double)statisticsInterval;
- (double)zoom;
- (id)description;
- (int64_t)blurHardEdges;
- (int64_t)graphicsQuality;
- (int64_t)renderingHint;
- (int64_t)stackingLevel;
- (int64_t)style;
- (int64_t)suppressSettingsDidChange;
- (unint64_t)version;
- (void)clearRunLoopObserver;
- (void)computeOutputSettingsUsingModel:(id)a3;
- (void)dealloc;
- (void)restoreDefaultValues;
- (void)scheduleSettingsDidChangeIfNeeded;
- (void)setAppliesTintAndBlurSettings:(BOOL)a3;
- (void)setBackdrop:(id)a3;
- (void)setBackdropVisible:(BOOL)a3;
- (void)setBlurHardEdges:(int64_t)a3;
- (void)setBlurQuality:(id)a3;
- (void)setBlurRadius:(double)a3;
- (void)setBlursWithHardEdges:(BOOL)a3;
- (void)setColorBurnTintAlpha:(double)a3;
- (void)setColorBurnTintLevel:(double)a3;
- (void)setColorBurnTintMaskImage:(id)a3;
- (void)setColorOffsetAlpha:(double)a3;
- (void)setColorOffsetMatrix:(id)a3;
- (void)setColorSettings:(id)a3;
- (void)setColorTint:(id)a3;
- (void)setColorTintAlpha:(double)a3;
- (void)setColorTintMaskAlpha:(double)a3;
- (void)setColorTintMaskImage:(id)a3;
- (void)setDarkenWithSourceOver:(BOOL)a3;
- (void)setDarkeningTintAlpha:(double)a3;
- (void)setDarkeningTintBrightness:(double)a3;
- (void)setDarkeningTintHue:(double)a3;
- (void)setDarkeningTintMaskImage:(id)a3;
- (void)setDarkeningTintSaturation:(double)a3;
- (void)setDefaultValues;
- (void)setDesignMode:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setExplicitlySetGraphicsQuality:(BOOL)a3;
- (void)setFilterMaskAlpha:(double)a3;
- (void)setFilterMaskImage:(id)a3;
- (void)setGraphicsQuality:(int64_t)a3;
- (void)setGrayscaleTintAlpha:(double)a3;
- (void)setGrayscaleTintLevel:(double)a3;
- (void)setGrayscaleTintMaskAlpha:(double)a3;
- (void)setGrayscaleTintMaskImage:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLegibleColor:(id)a3;
- (void)setLightenGrayscaleWithSourceOver:(BOOL)a3;
- (void)setRenderingHint:(int64_t)a3;
- (void)setRequiresColorStatistics:(BOOL)a3;
- (void)setSaturationDeltaFactor:(double)a3;
- (void)setScale:(double)a3;
- (void)setSelected:(BOOL)a3;
- (void)setStackingLevel:(int64_t)a3;
- (void)setStackinglevel:(int64_t)a3;
- (void)setStatisticsInterval:(double)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSuppressSettingsDidChange:(int64_t)a3;
- (void)setUsesBackdropEffectView:(BOOL)a3;
- (void)setUsesColorBurnTintView:(BOOL)a3;
- (void)setUsesColorOffset:(BOOL)a3;
- (void)setUsesColorTintView:(BOOL)a3;
- (void)setUsesContentView:(BOOL)a3;
- (void)setUsesDarkeningTintView:(BOOL)a3;
- (void)setUsesGrayscaleTintView:(BOOL)a3;
- (void)setValuesFromModel:(id)a3;
- (void)setVersion:(unint64_t)a3;
- (void)setZoom:(double)a3;
- (void)setZoomsBack:(BOOL)a3;
@end

@implementation _UIBackdropViewSettings

- (double)scale
{
  return self->_scale;
}

- (double)colorTintAlpha
{
  return self->_colorTintAlpha;
}

- (BOOL)requiresColorStatistics
{
  return self->_requiresColorStatistics;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (UIImage)grayscaleTintMaskImage
{
  return self->_grayscaleTintMaskImage;
}

- (UIImage)filterMaskImage
{
  return self->_filterMaskImage;
}

- (UIImage)colorTintMaskImage
{
  return self->_colorTintMaskImage;
}

- (double)grayscaleTintAlpha
{
  return self->_grayscaleTintAlpha;
}

- (double)saturationDeltaFactor
{
  return self->_saturationDeltaFactor;
}

- (BOOL)lightenGrayscaleWithSourceOver
{
  return self->_lightenGrayscaleWithSourceOver;
}

- (double)grayscaleTintLevel
{
  return self->_grayscaleTintLevel;
}

- (double)zoom
{
  return self->_zoom;
}

- (NSValue)colorOffsetMatrix
{
  return self->_colorOffsetMatrix;
}

- (double)colorOffsetAlpha
{
  return self->_colorOffsetAlpha;
}

- (void)setLightenGrayscaleWithSourceOver:(BOOL)a3
{
  self->_lightenGrayscaleWithSourceOver = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setDarkeningTintSaturation:(double)a3
{
  self->_darkeningTintSaturation = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setDarkeningTintHue:(double)a3
{
  self->_darkeningTintHue = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setDarkeningTintBrightness:(double)a3
{
  self->_darkeningTintBrightness = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setDarkeningTintAlpha:(double)a3
{
  self->_darkeningTintAlpha = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setDarkenWithSourceOver:(BOOL)a3
{
  self->_darkenWithSourceOver = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (UIColor)legibleColor
{
  return self->_legibleColor;
}

- (double)grayscaleTintMaskAlpha
{
  return self->_grayscaleTintMaskAlpha;
}

- (double)filterMaskAlpha
{
  return self->_filterMaskAlpha;
}

- (double)darkeningTintSaturation
{
  return self->_darkeningTintSaturation;
}

- (double)darkeningTintHue
{
  return self->_darkeningTintHue;
}

- (double)darkeningTintBrightness
{
  return self->_darkeningTintBrightness;
}

- (double)darkeningTintAlpha
{
  return self->_darkeningTintAlpha;
}

- (BOOL)darkenWithSourceOver
{
  return self->_darkenWithSourceOver;
}

- (UIColor)colorTint
{
  return self->_colorTint;
}

- (double)colorBurnTintAlpha
{
  return self->_colorBurnTintAlpha;
}

- (int64_t)style
{
  return self->_style;
}

- (void)dealloc
{
  [(_UIBackdropViewSettings *)self clearRunLoopObserver];
  v3.receiver = self;
  v3.super_class = (Class)_UIBackdropViewSettings;
  [(_UIBackdropViewSettings *)&v3 dealloc];
}

- (void)clearRunLoopObserver
{
  runLoopObserver = self->_runLoopObserver;
  if (runLoopObserver)
  {
    CFRunLoopObserverInvalidate(runLoopObserver);
    CFRelease(self->_runLoopObserver);
    self->_runLoopObserver = 0;
  }
}

- (void)setBackdrop:(id)a3
{
  self->_backdrop = (_UIBackdropView *)a3;
}

- (BOOL)usesGrayscaleTintView
{
  return self->_usesGrayscaleTintView;
}

- (BOOL)usesDarkeningTintView
{
  return self->_usesDarkeningTintView;
}

- (BOOL)usesContentView
{
  return self->_usesContentView;
}

- (BOOL)usesColorTintView
{
  return self->_usesColorTintView;
}

- (BOOL)usesColorBurnTintView
{
  return self->_usesColorBurnTintView;
}

- (BOOL)usesBackdropEffectView
{
  return self->_usesBackdropEffectView;
}

+ (id)settingsForStyle:(int64_t)a3 graphicsQuality:(int64_t)a4
{
  if (a3 <= 3999)
  {
    if (a3 <= 2028)
    {
      if (a3 <= 1000)
      {
        switch(a3)
        {
          case -4:
            v6 = _UIBackdropViewSettingsReplicator;
            break;
          case -3:
            v6 = _UIBackdropViewSettingsCombiner;
            break;
          case -2:
            v6 = _UIBackdropViewSettingsNone;
            break;
          case -1:
            goto LABEL_97;
          case 0:
            goto LABEL_81;
          case 1:
            goto LABEL_53;
          case 2:
            v6 = _UIBackdropViewSettingsBlur;
            break;
          default:
            if (a3 == 1000) {
              goto LABEL_81;
            }
            goto LABEL_97;
        }
        goto LABEL_82;
      }
      if (a3 > 1999)
      {
        if (a3 == 2000)
        {
          v6 = _UIBackdropViewSettingsColorSample;
          goto LABEL_82;
        }
        if (a3 == 2010) {
          goto LABEL_49;
        }
        if (a3 != 2020) {
          goto LABEL_97;
        }
      }
      else
      {
        if (a3 == 1001) {
          goto LABEL_53;
        }
        if (a3 != 1003)
        {
          if (a3 != 1100) {
            goto LABEL_97;
          }
          goto LABEL_53;
        }
      }
      goto LABEL_81;
    }
    if (a3 <= 2059)
    {
      switch(a3)
      {
        case 2029:
          v6 = _UIBackdropViewSettingsLightLow;
          break;
        case 2030:
          goto LABEL_53;
        case 2031:
          v6 = _UIBackdropViewSettingsDarkWithZoom;
          break;
        case 2032:
          v6 = _UIBackdropViewSettingsUltraDarkWithZoom;
          break;
        case 2033:
        case 2034:
        case 2035:
        case 2036:
        case 2037:
        case 2038:
          goto LABEL_97;
        case 2039:
          v6 = _UIBackdropViewSettingsDarkLow;
          break;
        case 2040:
          v6 = _UIBackdropViewSettingsColored;
          break;
        default:
          if (a3 == 2050) {
            goto LABEL_74;
          }
          goto LABEL_97;
      }
      goto LABEL_82;
    }
    if (a3 <= 2079)
    {
      switch(a3)
      {
        case 2060:
          v6 = _UIBackdropViewSettingsAdaptiveLight;
          goto LABEL_82;
        case 2070:
          v6 = _UIBackdropViewSettingsSemiLight;
          goto LABEL_82;
        case 2071:
          v6 = _UIBackdropViewSettingsFlatSemiLight;
          goto LABEL_82;
      }
    }
    else if (a3 > 3900)
    {
      if (a3 == 3901)
      {
        v6 = _UIBackdropViewSettingsLightKeyboard;
        goto LABEL_82;
      }
      if (a3 == 3902)
      {
        v6 = _UIBackdropViewSettingsLightEmojiKeyboard;
        goto LABEL_82;
      }
    }
    else
    {
      if (a3 == 2080)
      {
        v6 = _UIBackdropViewSettingsUltraColored;
        goto LABEL_82;
      }
      if (a3 == 3900)
      {
        v6 = _UIBackdropViewSettingsPasscodePaddle;
        goto LABEL_82;
      }
    }
    goto LABEL_97;
  }
  if (a3 <= 10049)
  {
    switch(a3)
    {
      case 4000:
        v5 = _UIBackdropViewSettingsATVSemiLight;
        break;
      case 4001:
        v5 = _UIBackdropViewSettingsATVMediumLight;
        break;
      case 4002:
        v5 = _UIBackdropViewSettingsATVLight;
        break;
      case 4003:
        v5 = _UIBackdropViewSettingsATVUltraLight;
        break;
      case 4004:
        v5 = _UIBackdropViewSettingsATVMenuLight;
        break;
      case 4005:
        v5 = _UIBackdropViewSettingsATVSemiDark;
        break;
      case 4006:
        v5 = _UIBackdropViewSettingsATVMediumDark;
        break;
      case 4007:
        v5 = _UIBackdropViewSettingsATVDark;
        break;
      case 4008:
        v5 = _UIBackdropViewSettingsATVUltraDark;
        break;
      case 4009:
        v5 = _UIBackdropViewSettingsATVMenuDark;
        break;
      case 4010:
        v5 = _UIBackdropViewSettingsATVAdaptive;
        break;
      case 4011:
        v5 = _UIBackdropViewSettingsATVAdaptiveLighten;
        break;
      case 4012:
        v5 = _UIBackdropViewSettingsATVAccessoryLight;
        break;
      case 4013:
        v5 = _UIBackdropViewSettingsATVAccessoryDark;
        break;
      case 4014:
        v5 = _UIBackdropViewSettingsATVTabBarLight;
        break;
      case 4015:
        v5 = _UIBackdropViewSettingsATVTabBarDark;
        break;
      default:
        goto LABEL_97;
    }
    v10 = (_UIBackdropViewSettingsColored *)objc_alloc_init(v5);
    goto LABEL_83;
  }
  if (a3 <= 10091)
  {
    if (a3 <= 10079)
    {
      if (a3 != 10050 && a3 != 10060)
      {
        uint64_t v7 = 10070;
        goto LABEL_35;
      }
LABEL_49:
      v6 = _UIBackdropViewSettingsUltraLight;
      goto LABEL_82;
    }
    switch(a3)
    {
      case 10080:
        goto LABEL_49;
      case 10090:
        goto LABEL_81;
      case 10091:
        v8 = objc_alloc_init(_UIBackdropViewSettingsColored);
        _UIBackdropViewSettingsColorAcceptGreen();
        v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
        goto LABEL_92;
    }
LABEL_97:
    NSLog(&cfstr_WarningUsingUi.isa, a2, a3);
    v6 = +[_UIBackdropView defaultSettingsClass];
    goto LABEL_82;
  }
  if (a3 <= 10119)
  {
    if (a3 == 10092)
    {
      v8 = objc_alloc_init(_UIBackdropViewSettingsColored);
      _UIBackdropViewSettingsColorCancelRed();
      v9 = (UIColor *)objc_claimAutoreleasedReturnValue();
      goto LABEL_92;
    }
    if (a3 != 10100)
    {
      uint64_t v7 = 10110;
LABEL_35:
      if (a3 != v7) {
        goto LABEL_97;
      }
      goto LABEL_49;
    }
LABEL_81:
    v6 = _UIBackdropViewSettingsLight;
    goto LABEL_82;
  }
  if (a3 > 11059)
  {
    if (a3 != 11060)
    {
      if (a3 != 11070) {
        goto LABEL_97;
      }
LABEL_74:
      v6 = _UIBackdropViewSettingsUltraDark;
LABEL_82:
      v10 = (_UIBackdropViewSettingsColored *)[[v6 alloc] initWithDefaultValuesForGraphicsQuality:a4];
LABEL_83:
      v8 = v10;
      goto LABEL_84;
    }
LABEL_53:
    v6 = _UIBackdropViewSettingsDark;
    goto LABEL_82;
  }
  if (a3 != 10120)
  {
    if (a3 != 11050) {
      goto LABEL_97;
    }
    goto LABEL_53;
  }
  v8 = objc_alloc_init(_UIBackdropViewSettingsColored);
  v9 = [[UIColor alloc] initWithRed:0.031372549 green:0.262745098 blue:0.560784314 alpha:1.0];
LABEL_92:
  v12 = v9;
  [(_UIBackdropViewSettings *)v8 setColorTint:v9];

LABEL_84:
  return v8;
}

- (_UIBackdropViewSettings)initWithDefaultValuesForGraphicsQuality:(int64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)_UIBackdropViewSettings;
  v4 = [(_UIBackdropViewSettings *)&v16 init];
  v5 = v4;
  if (v4)
  {
    uint64_t suppressSettingsDidChange = v4->_suppressSettingsDidChange;
    if (suppressSettingsDidChange >= 0) {
      uint64_t v7 = suppressSettingsDidChange + 1;
    }
    else {
      uint64_t v7 = 1;
    }
    v4->_uint64_t suppressSettingsDidChange = v7;
    if (a3)
    {
      v4->_explicitlySetGraphicsQuality = 1;
    }
    else if (_AXSEnhanceBackgroundContrastEnabled())
    {
      a3 = 10;
    }
    else
    {
      v8 = +[UIDevice currentDevice];
      a3 = [v8 _graphicsQuality];
    }
    v5->_graphicsQuality = a3;
    [(_UIBackdropViewSettings *)v5 setDefaultValues];
    v9 = objc_alloc_init(_UIBackdropColorSettings);
    colorSettings = v5->_colorSettings;
    v5->_colorSettings = v9;

    [(_UIBackdropColorSettings *)v5->_colorSettings setParentSettings:v5];
    uint64_t v11 = v5->_suppressSettingsDidChange;
    BOOL v12 = v11 <= 1;
    int64_t v13 = v11 - 1;
    if (v12) {
      int64_t v13 = 0;
    }
    v5->_uint64_t suppressSettingsDidChange = v13;
    v14 = v5;
  }

  return v5;
}

- (void)setDefaultValues
{
  int64_t suppressSettingsDidChange = self->_suppressSettingsDidChange;
  if (suppressSettingsDidChange >= 0) {
    int64_t v4 = suppressSettingsDidChange + 1;
  }
  else {
    int64_t v4 = 1;
  }
  self->_int64_t suppressSettingsDidChange = v4;
  self->_version = 1;
  v5 = +[UIScreen mainScreen];
  [v5 scale];
  double v7 = v6;

  double v8 = ceil(v7 * 0.5);
  double v9 = v8 + v8;
  if (v7 > 1.0) {
    double v7 = v9;
  }
  v10 = (objc_class *)objc_opt_class();
  if (qword_1EB25D4D0 != -1) {
    dispatch_once(&qword_1EB25D4D0, &__block_literal_global_521);
  }
  uint64_t v11 = (void *)qword_1EB25D4D8;
  BOOL v12 = NSStringFromClass(v10);
  int64_t v13 = [v11 objectForKeyedSubscript:v12];

  if (v13) {
    int64_t v14 = (int)[v13 intValue];
  }
  else {
    int64_t v14 = 0;
  }

  self->_style = v14;
  *(_WORD *)&self->_usesBackdropEffectView = 257;
  self->_usesColorTintView = 1;
  *(_WORD *)&self->_usesContentView = 1;
  self->_usesColorOffset = 0;
  *(_DWORD *)&self->_highlighted = 16842752;
  int64_t graphicsQuality = self->_graphicsQuality;
  if (graphicsQuality == 100)
  {
    double v16 = 0.25;
    double v17 = 2.0;
  }
  else
  {
    if (graphicsQuality != 10) {
      goto LABEL_16;
    }
    self->_usesBackdropEffectView = 0;
    double v16 = 1.0;
    double v17 = 4.0;
  }
  self->_scale = 1.0 / (v7 * v17);
  self->_statisticsInterval = v16;
LABEL_16:
  self->_requiresColorStatistics = 0;
  self->_appliesTintAndBlurSettings = 1;
  self->_stackingLevel = 0;
  self->_grayscaleTintLevel = 0.0;
  self->_grayscaleTintAlpha = 0.0;
  grayscaleTintMaskImage = self->_grayscaleTintMaskImage;
  self->_grayscaleTintMaskAlpha = 1.0;
  self->_grayscaleTintMaskImage = 0;

  colorTint = self->_colorTint;
  self->_colorTint = 0;

  *(_OWORD *)&self->_colorTintAlpha = xmmword_186B89740;
  colorTintMaskImage = self->_colorTintMaskImage;
  self->_colorTintMaskImage = 0;

  *(_OWORD *)&self->_darkeningTintAlpha = xmmword_186B93000;
  *(_OWORD *)&self->_darkeningTintSaturation = xmmword_186B93010;
  darkeningTintMaskImage = self->_darkeningTintMaskImage;
  self->_darkeningTintMaskImage = 0;

  blurQuality = self->_blurQuality;
  self->_blurRadius = 0.0;
  self->_blurQuality = (NSString *)@"default";

  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&self->_saturationDeltaFactor = _Q0;
  filterMaskImage = self->_filterMaskImage;
  self->_filterMaskImage = 0;

  v29 = +[UIColor whiteColor];
  legibleColor = self->_legibleColor;
  self->_legibleColor = v29;

  int64_t v31 = self->_suppressSettingsDidChange;
  BOOL v32 = v31 <= 1;
  int64_t v33 = v31 - 1;
  if (v32) {
    int64_t v33 = 0;
  }
  self->_int64_t suppressSettingsDidChange = v33;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)computeOutputSettingsUsingModel:(id)a3
{
  [(_UIBackdropViewSettings *)self setValuesFromModel:a3];
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setValuesFromModel:(id)a3
{
  id v4 = a3;
  if (self->_style)
  {
    int64_t v13 = v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v4 = v13;
    if (isKindOfClass)
    {
      id v6 = v13;
      id v7 = v6;
      if (*((void *)v6 + 3))
      {
        int64_t suppressSettingsDidChange = self->_suppressSettingsDidChange;
        if (suppressSettingsDidChange >= 0) {
          int64_t v9 = suppressSettingsDidChange + 1;
        }
        else {
          int64_t v9 = 1;
        }
        self->_int64_t suppressSettingsDidChange = v9;
        self->_appliesTintAndBlurSettings = *((unsigned char *)v6 + 328);
        self->_backdropVisible = *((unsigned char *)v6 + 75);
        objc_storeStrong((id *)&self->_blurQuality, *((id *)v6 + 30));
        self->_blurRadius = *((double *)v7 + 29);
        objc_storeStrong((id *)&self->_colorTint, *((id *)v7 + 16));
        self->_colorTintAlpha = *((double *)v7 + 17);
        self->_colorTintMaskAlpha = *((double *)v7 + 18);
        objc_storeStrong((id *)&self->_colorTintMaskImage, *((id *)v7 + 19));
        self->_colorBurnTintLevel = *((double *)v7 + 20);
        self->_colorBurnTintAlpha = *((double *)v7 + 21);
        objc_storeStrong((id *)&self->_colorBurnTintMaskImage, *((id *)v7 + 22));
        self->_darkeningTintAlpha = *((double *)v7 + 23);
        self->_darkeningTintHue = *((double *)v7 + 24);
        self->_darkeningTintSaturation = *((double *)v7 + 25);
        self->_darkeningTintBrightness = *((double *)v7 + 26);
        objc_storeStrong((id *)&self->_darkeningTintMaskImage, *((id *)v7 + 27));
        self->_darkenWithSourceOver = *((unsigned char *)v7 + 224);
        self->_enabled = *((unsigned char *)v7 + 74);
        self->_explicitlySetGraphicsQuality = *((unsigned char *)v7 + 40);
        self->_filterMaskAlpha = *((double *)v7 + 32);
        objc_storeStrong((id *)&self->_filterMaskImage, *((id *)v7 + 33));
        self->_int64_t graphicsQuality = *((void *)v7 + 4);
        self->_grayscaleTintAlpha = *((double *)v7 + 12);
        self->_grayscaleTintLevel = *((double *)v7 + 11);
        self->_grayscaleTintMaskAlpha = *((double *)v7 + 13);
        objc_storeStrong((id *)&self->_grayscaleTintMaskImage, *((id *)v7 + 14));
        self->_lightenGrayscaleWithSourceOver = *((unsigned char *)v7 + 120);
        self->_highlighted = *((unsigned char *)v7 + 72);
        objc_storeStrong((id *)&self->_legibleColor, *((id *)v7 + 34));
        self->_renderingHint = *((void *)v7 + 7);
        self->_requiresColorStatistics = *((unsigned char *)v7 + 41);
        self->_saturationDeltaFactor = *((double *)v7 + 31);
        self->_scale = *((double *)v7 + 36);
        self->_selected = *((unsigned char *)v7 + 73);
        self->_stackingLevel = *((void *)v7 + 8);
        self->_statisticsInterval = *((double *)v7 + 37);
        self->_style = *((void *)v7 + 3);
        self->_usesBackdropEffectView = *((unsigned char *)v7 + 304);
        self->_usesColorTintView = *((unsigned char *)v7 + 306);
        self->_usesColorOffset = *((unsigned char *)v7 + 310);
        self->_usesContentView = *((unsigned char *)v7 + 308);
        self->_usesGrayscaleTintView = *((unsigned char *)v7 + 305);
        self->_version = *((void *)v7 + 45);
        self->_zoom = *((double *)v7 + 10);
        self->_shouldDoRasterizationAndAlphaHack = *((unsigned char *)v7 + 76);
        [(_UIBackdropColorSettings *)self->_colorSettings setValuesFromModel:*((void *)v7 + 6)];
        int64_t v10 = self->_suppressSettingsDidChange;
        BOOL v11 = v10 <= 1;
        int64_t v12 = v10 - 1;
        if (v11) {
          int64_t v12 = 0;
        }
        self->_int64_t suppressSettingsDidChange = v12;
        [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
      }

      id v4 = v13;
    }
  }
}

- (void)scheduleSettingsDidChangeIfNeeded
{
  if (!self->_runLoopObserver && self->_suppressSettingsDidChange <= 0)
  {
    if (self->_backdrop)
    {
      objc_initWeak(&location, self);
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __60___UIBackdropViewSettings_scheduleSettingsDidChangeIfNeeded__block_invoke;
      v4[3] = &unk_1E52DD1A0;
      objc_copyWeak(&v5, &location);
      self->_runLoopObserver = CFRunLoopObserverCreateWithHandler(0, 0x20uLL, 0, 0, v4);
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddObserver(Current, self->_runLoopObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
  }
}

- (int64_t)graphicsQuality
{
  return self->_graphicsQuality;
}

- (void)setLegibleColor:(id)a3
{
  objc_storeStrong((id *)&self->_legibleColor, a3);
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setGrayscaleTintMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_grayscaleTintMaskImage, a3);
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setGrayscaleTintMaskAlpha:(double)a3
{
  self->_grayscaleTintMaskAlpha = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setFilterMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_filterMaskImage, a3);
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setFilterMaskAlpha:(double)a3
{
  self->_filterMaskAlpha = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setColorTint:(id)a3
{
  objc_storeStrong((id *)&self->_colorTint, a3);
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setGrayscaleTintLevel:(double)a3
{
  self->_grayscaleTintLevel = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setGrayscaleTintAlpha:(double)a3
{
  self->_grayscaleTintAlpha = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (BOOL)isBackdropVisible
{
  return self->_backdropVisible;
}

- (void)setUsesColorTintView:(BOOL)a3
{
  self->_usesColorTintView = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setSaturationDeltaFactor:(double)a3
{
  self->_saturationDeltaFactor = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setRequiresColorStatistics:(BOOL)a3
{
  self->_requiresColorStatistics = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setColorTintMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_colorTintMaskImage, a3);
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setColorTintMaskAlpha:(double)a3
{
  self->_colorTintMaskAlpha = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setColorTintAlpha:(double)a3
{
  self->_colorTintAlpha = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setBlurRadius:(double)a3
{
  self->_blurRadius = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setBackdropVisible:(BOOL)a3
{
  self->_backdropVisible = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

+ (id)settingsForStyle:(int64_t)a3
{
  return (id)[a1 settingsForStyle:a3 graphicsQuality:0];
}

- (_UIBackdropViewSettings)initWithDefaultValues
{
  return [(_UIBackdropViewSettings *)self initWithDefaultValuesForGraphicsQuality:0];
}

- (void)setColorSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorOffsetMatrix, 0);
  objc_storeStrong((id *)&self->_combinedTintColor, 0);
  objc_storeStrong((id *)&self->_legibleColor, 0);
  objc_storeStrong((id *)&self->_filterMaskImage, 0);
  objc_storeStrong((id *)&self->_blurQuality, 0);
  objc_storeStrong((id *)&self->_darkeningTintMaskImage, 0);
  objc_storeStrong((id *)&self->_colorBurnTintMaskImage, 0);
  objc_storeStrong((id *)&self->_colorTintMaskImage, 0);
  objc_storeStrong((id *)&self->_colorTint, 0);
  objc_storeStrong((id *)&self->_grayscaleTintMaskImage, 0);
  objc_storeStrong((id *)&self->_colorSettings, 0);
}

+ (id)settingsPreservingHintsFromSettings:(id)a3 graphicsQuality:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[_UIBackdropViewSettings settingsForStyle:graphicsQuality:](_UIBackdropViewSettings, "settingsForStyle:graphicsQuality:", [v5 style], a4);
  objc_msgSend(v6, "setRenderingHint:", objc_msgSend(v5, "renderingHint"));
  objc_msgSend(v6, "setStackingLevel:", objc_msgSend(v5, "stackingLevel"));
  [v6 copyAdditionalSettingsFromSettings:v5];

  return v6;
}

- (int64_t)stackingLevel
{
  return self->_stackingLevel;
}

- (void)setStackingLevel:(int64_t)a3
{
  self->_stackingLevel = a3;
}

- (void)setRenderingHint:(int64_t)a3
{
  self->_renderingHint = a3;
  if (a3 == 1) {
    -[_UIBackdropViewSettings setUsesColorTintView:](self, "setUsesColorTintView:");
  }
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (int64_t)renderingHint
{
  return self->_renderingHint;
}

- (_UIBackdropColorSettings)colorSettings
{
  return self->_colorSettings;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)restoreDefaultValues
{
  [(_UIBackdropViewSettings *)self setDefaultValues];
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

+ (id)darkeningTintColor
{
  if (qword_1EB25D4C0 != -1) {
    dispatch_once(&qword_1EB25D4C0, &__block_literal_global_52);
  }
  v2 = (void *)qword_1EB25D4C8;
  return v2;
}

- (void)setAppliesTintAndBlurSettings:(BOOL)a3
{
  self->_appliesTintAndBlurSettings = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setBlurHardEdges:(int64_t)a3
{
  self->_blurHardEdges = a3;
}

- (void)setBlurQuality:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  blurQuality = self->_blurQuality;
  self->_blurQuality = v4;

  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setBlursWithHardEdges:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 15;
  }
  else {
    uint64_t v3 = 0;
  }
  [(_UIBackdropViewSettings *)self setBlurHardEdges:v3];
}

- (void)setColorBurnTintLevel:(double)a3
{
  self->_colorBurnTintLevel = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setColorBurnTintAlpha:(double)a3
{
  self->_colorBurnTintAlpha = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setColorBurnTintMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_colorBurnTintMaskImage, a3);
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setDarkeningTintMaskImage:(id)a3
{
  objc_storeStrong((id *)&self->_darkeningTintMaskImage, a3);
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setGraphicsQuality:(int64_t)a3
{
  self->_int64_t graphicsQuality = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
  if (a3) {
    [(_UIBackdropViewSettings *)self setUsesColorTintView:1];
  }
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  if (a3) {
    [(_UIBackdropViewSettings *)self setUsesColorTintView:1];
  }
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setStackinglevel:(int64_t)a3
{
  self->_stackingLevel = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setStatisticsInterval:(double)a3
{
  self->_statisticsInterval = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setUsesBackdropEffectView:(BOOL)a3
{
  self->_usesBackdropEffectView = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setUsesColorBurnTintView:(BOOL)a3
{
  self->_usesColorBurnTintView = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setUsesColorOffset:(BOOL)a3
{
  self->_usesColorOffset = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setUsesContentView:(BOOL)a3
{
  self->_usesContentView = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setUsesGrayscaleTintView:(BOOL)a3
{
  self->_usesGrayscaleTintView = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (BOOL)zoomsBack
{
  return self->_zoom > 0.0;
}

- (void)setZoomsBack:(BOOL)a3
{
  double v3 = 0.05;
  if (a3) {
    double v3 = 0.0;
  }
  [(_UIBackdropViewSettings *)self setZoom:v3];
}

- (void)setZoom:(double)a3
{
  self->_zoom = a3;
  [(_UIBackdropViewSettings *)self scheduleSettingsDidChangeIfNeeded];
}

- (BOOL)blursWithHardEdges
{
  return self->_blurHardEdges == 15;
}

- (UIColor)combinedTintColor
{
  double grayscaleTintLevel = self->_grayscaleTintLevel;
  double grayscaleTintAlpha = self->_grayscaleTintAlpha;
  double v12 = 0.0;
  double v13 = 0.0;
  double v10 = 0.0;
  double v11 = 0.0;
  id v4 = self->_colorTint;
  id v5 = v4;
  if (v4)
  {
    [(UIColor *)v4 getRed:&v13 green:&v12 blue:&v11 alpha:&v10];
    double v6 = v10;
  }
  else
  {
    double v6 = 0.0;
  }
  double v7 = 1.0 - (1.0 - grayscaleTintAlpha) * (1.0 - v6);
  if (v7 >= 0.00000011920929) {
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", grayscaleTintLevel * grayscaleTintAlpha * (1.0 - v6) / v7 + v6 * v13 / v7, grayscaleTintLevel * grayscaleTintAlpha * (1.0 - v6) / v7 + v6 * v12 / v7, grayscaleTintLevel * grayscaleTintAlpha * (1.0 - v6) / v7 + v6 * v11 / v7);
  }
  else {
  double v8 = +[UIColor clearColor];
  }

  return (UIColor *)v8;
}

- (id)description
{
  double v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendFormat:@"<%@ : %p>\n", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"    graphicsQuality:        %ld\n", -[_UIBackdropViewSettings graphicsQuality](self, "graphicsQuality"));
  BOOL v4 = [(_UIBackdropViewSettings *)self isBackdropVisible];
  id v5 = @"NO";
  if (v4) {
    id v5 = @"YES";
  }
  [v3 appendFormat:@"    backdrop visible:       %@\n", v5];
  [(_UIBackdropViewSettings *)self grayscaleTintLevel];
  [v3 appendFormat:@"    grayscaleTintLevel:     %.2f\n", v6];
  [(_UIBackdropViewSettings *)self grayscaleTintAlpha];
  [v3 appendFormat:@"    grayscaleTintAlpha:     %.2f\n", v7];
  double v8 = [(_UIBackdropViewSettings *)self grayscaleTintMaskImage];
  [v3 appendFormat:@"    grayscaleTintMaskImage: %@\n", v8];

  [(_UIBackdropViewSettings *)self grayscaleTintMaskAlpha];
  [v3 appendFormat:@"    grayscaleTintMaskAlpha: %.2f\n", v9];
  double v10 = [(_UIBackdropViewSettings *)self colorTint];
  [v3 appendFormat:@"    colorTint:              %@\n", v10];

  [(_UIBackdropViewSettings *)self colorTintAlpha];
  [v3 appendFormat:@"    colorTintAlpha:         %.2f\n", v11];
  double v12 = [(_UIBackdropViewSettings *)self colorTintMaskImage];
  [v3 appendFormat:@"    colorTintMaskImage:     %@\n", v12];

  [(_UIBackdropViewSettings *)self colorTintMaskAlpha];
  [v3 appendFormat:@"    colorTintMaskAlpha:     %.2f\n", v13];
  [(_UIBackdropViewSettings *)self blurRadius];
  [v3 appendFormat:@"    blurRadius:             %.2f\n", v14];
  [(_UIBackdropViewSettings *)self saturationDeltaFactor];
  [v3 appendFormat:@"    saturationDeltaFactor:  %.2f\n", v15];
  double v16 = [(_UIBackdropViewSettings *)self filterMaskImage];
  [v3 appendFormat:@"    filterMaskImage:        %@\n", v16];

  [(_UIBackdropViewSettings *)self filterMaskAlpha];
  [v3 appendFormat:@"    filterMaskAlpha:        %.2f\n", v17];
  v18 = [(_UIBackdropViewSettings *)self combinedTintColor];
  [v3 appendFormat:@"    combinedTintColor:      %@\n", v18];

  return v3;
}

- (_UIBackdropView)backdrop
{
  return self->_backdrop;
}

- (BOOL)explicitlySetGraphicsQuality
{
  return self->_explicitlySetGraphicsQuality;
}

- (void)setExplicitlySetGraphicsQuality:(BOOL)a3
{
  self->_explicitlySetGraphicsQuality = a3;
}

- (double)colorTintMaskAlpha
{
  return self->_colorTintMaskAlpha;
}

- (double)colorBurnTintLevel
{
  return self->_colorBurnTintLevel;
}

- (UIImage)colorBurnTintMaskImage
{
  return self->_colorBurnTintMaskImage;
}

- (UIImage)darkeningTintMaskImage
{
  return self->_darkeningTintMaskImage;
}

- (NSString)blurQuality
{
  return self->_blurQuality;
}

- (int64_t)blurHardEdges
{
  return self->_blurHardEdges;
}

- (double)statisticsInterval
{
  return self->_statisticsInterval;
}

- (int64_t)suppressSettingsDidChange
{
  return self->_suppressSettingsDidChange;
}

- (void)setSuppressSettingsDidChange:(int64_t)a3
{
  self->_int64_t suppressSettingsDidChange = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (BOOL)designMode
{
  return self->_designMode;
}

- (void)setDesignMode:(BOOL)a3
{
  self->_designMode = a3;
}

- (void)setUsesDarkeningTintView:(BOOL)a3
{
  self->_usesDarkeningTintView = a3;
}

- (BOOL)usesColorOffset
{
  return self->_usesColorOffset;
}

- (void)setColorOffsetAlpha:(double)a3
{
  self->_colorOffsetAlpha = a3;
}

- (void)setColorOffsetMatrix:(id)a3
{
}

- (BOOL)appliesTintAndBlurSettings
{
  return self->_appliesTintAndBlurSettings;
}

@end