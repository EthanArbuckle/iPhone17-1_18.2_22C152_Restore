@interface UIKBRenderConfig
+ (Class)preferredVisualProviderClass;
+ (id)animatedConfigDark;
+ (id)animatedConfigLight;
+ (id)clearConfigDarkKeys;
+ (id)clearConfigLightKeys;
+ (id)clearConfigWithLightKeys:(BOOL)a3;
+ (id)configForAnimatedBackgroundWithLightKeys:(BOOL)a3;
+ (id)configForAppearance:(int64_t)a3 inputMode:(id)a4 traitEnvironment:(id)a5;
+ (id)darkConfig;
+ (id)defaultConfig;
+ (id)defaultEmojiConfig;
+ (id)lowQualityDarkConfig;
+ (int64_t)backdropStyleForStyle:(int64_t)a3 quality:(int64_t)a4;
- (BOOL)animatedBackground;
- (BOOL)emptyBackground;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFloating;
- (BOOL)lightKeyboard;
- (BOOL)whiteText;
- (NSString)activatedKeyplaneSwitchControlKeyBackgroundName;
- (NSString)controlKeyBackgroundName;
- (_UIButtonBarButtonVisualProvider)buttonBarVisualProvider;
- (double)blurRadius;
- (double)blurSaturation;
- (double)keycapOpacity;
- (double)lightKeycapOpacity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)imageNameForType:(int)a3;
- (int64_t)backdropStyle;
- (int64_t)blurEffectStyle;
- (int64_t)forceQuality;
- (int64_t)keyBackdropStyle;
- (void)overrideKeycapWithSymbol:(id)a3 forDisplayType:(int)a4;
- (void)setActivatedKeyplaneSwitchControlKeyBackgroundName:(id)a3;
- (void)setAnimatedBackground:(BOOL)a3;
- (void)setBlurRadius:(double)a3;
- (void)setBlurSaturation:(double)a3;
- (void)setControlKeyBackgroundName:(id)a3;
- (void)setEmptyBackground:(BOOL)a3;
- (void)setForceQuality:(int64_t)a3;
- (void)setIsFloating:(BOOL)a3;
- (void)setKeycapOpacity:(double)a3;
- (void)setLightKeyboard:(BOOL)a3;
- (void)setLightKeycapOpacity:(double)a3;
@end

@implementation UIKBRenderConfig

- (BOOL)animatedBackground
{
  return self->_animatedBackground;
}

+ (id)defaultConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__UIKBRenderConfig_defaultConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB2618A8 != -1) {
    dispatch_once(&qword_1EB2618A8, block);
  }
  v2 = (void *)qword_1EB2618A0;
  return v2;
}

- (BOOL)lightKeyboard
{
  return self->_lightKeyboard;
}

+ (id)darkConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__UIKBRenderConfig_darkConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB2618C8 != -1) {
    dispatch_once(&qword_1EB2618C8, block);
  }
  v2 = (void *)qword_1EB2618C0;
  return v2;
}

uint64_t __30__UIKBRenderConfig_darkConfig__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(UIKBRenderConfig);
  v3 = (void *)qword_1EB2618C0;
  qword_1EB2618C0 = (uint64_t)v2;

  [(id)qword_1EB2618C0 setLightKeyboard:0];
  [(id)qword_1EB2618C0 setBlurRadius:20.0];
  [(id)qword_1EB2618C0 setBlurSaturation:0.5];
  [(id)qword_1EB2618C0 setKeycapOpacity:1.0];
  [(id)qword_1EB2618C0 setLightKeycapOpacity:1.0];
  [(id)qword_1EB2618C0 setControlKeyBackgroundName:@"UIKBColorKeyGrayKeyDarkBackground"];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "preferredVisualProviderClass"), "darkKeyboardProvider");
  v5 = *(void **)(qword_1EB2618C0 + 88);
  *(void *)(qword_1EB2618C0 + 88) = v4;

  [(id)qword_1EB2618C0 setIsFloating:0];
  v6 = (void *)qword_1EB2618C0;
  return [v6 setActivatedKeyplaneSwitchControlKeyBackgroundName:@"UIKBColorWhite_Alpha24"];
}

- (void)setControlKeyBackgroundName:(id)a3
{
}

uint64_t __33__UIKBRenderConfig_defaultConfig__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(UIKBRenderConfig);
  v3 = (void *)qword_1EB2618A0;
  qword_1EB2618A0 = (uint64_t)v2;

  [(id)qword_1EB2618A0 setLightKeyboard:1];
  [(id)qword_1EB2618A0 setBlurRadius:30.0];
  [(id)qword_1EB2618A0 setBlurSaturation:0.9];
  [(id)qword_1EB2618A0 setKeycapOpacity:0.96];
  [(id)qword_1EB2618A0 setLightKeycapOpacity:1.0];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "preferredVisualProviderClass"), "lightKeyboardProvider");
  v5 = *(void **)(qword_1EB2618A0 + 88);
  *(void *)(qword_1EB2618A0 + 88) = v4;

  [(id)qword_1EB2618A0 setIsFloating:0];
  [(id)qword_1EB2618A0 setActivatedKeyplaneSwitchControlKeyBackgroundName:@"UIKBColor10KeyLightActiveKeyplaneSwitch"];
  int64_t v6 = +[UIKBRenderFactory _graphicsQuality];
  v7 = UIKBColorGray_Percent55;
  if (v6 != 100) {
    v7 = UIKBColorKeyGrayKeyLightBackgroundMedium;
  }
  v8 = *v7;
  v9 = (void *)qword_1EB2618A0;
  return [v9 setControlKeyBackgroundName:v8];
}

- (void)setLightKeycapOpacity:(double)a3
{
  self->_lightKeycapOpacity = a3;
}

- (void)setLightKeyboard:(BOOL)a3
{
  self->_lightKeyboard = a3;
}

- (void)setKeycapOpacity:(double)a3
{
  self->_keycapOpacity = a3;
}

- (void)setIsFloating:(BOOL)a3
{
  self->_isFloating = a3;
}

- (void)setBlurSaturation:(double)a3
{
  self->_blurSaturation = a3;
}

- (void)setBlurRadius:(double)a3
{
  self->_blurRadius = a3;
}

- (void)setActivatedKeyplaneSwitchControlKeyBackgroundName:(id)a3
{
}

+ (Class)preferredVisualProviderClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (unsigned __int8 *)v4;
    int v6 = [(UIKBRenderConfig *)self lightKeyboard];
    if (v6 != [v5 lightKeyboard]) {
      goto LABEL_12;
    }
    int64_t v7 = [(UIKBRenderConfig *)self forceQuality];
    if (v7 != [v5 forceQuality]) {
      goto LABEL_12;
    }
    [(UIKBRenderConfig *)self blurRadius];
    double v9 = v8;
    [v5 blurRadius];
    if (v9 != v10) {
      goto LABEL_12;
    }
    [(UIKBRenderConfig *)self blurSaturation];
    double v12 = v11;
    [v5 blurSaturation];
    if (v12 != v13) {
      goto LABEL_12;
    }
    [(UIKBRenderConfig *)self keycapOpacity];
    double v15 = v14;
    [v5 keycapOpacity];
    if (v15 == v16
      && ([(UIKBRenderConfig *)self lightKeycapOpacity],
          double v18 = v17,
          [v5 lightKeycapOpacity],
          v18 == v19)
      && self->_useEmojiStyles == v5[8]
      && (int v20 = -[UIKBRenderConfig isFloating](self, "isFloating"), v20 == [v5 isFloating])
      && self->_controlKeyBackgroundName == (NSString *)*((void *)v5 + 9)
      && self->_activatedKeyplaneSwitchControlKeyBackgroundName == (NSString *)*((void *)v5 + 10))
    {
      BOOL v21 = self->_animatedBackground == v5[27];
    }
    else
    {
LABEL_12:
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[UIKBRenderConfig allocWithZone:a3] init];
  v4->_lightKeyboard = self->_lightKeyboard;
  v4->_forceQuality = self->_forceQuality;
  v4->_blurRadius = self->_blurRadius;
  v4->_blurSaturation = self->_blurSaturation;
  v4->_keycapOpacity = self->_keycapOpacity;
  v4->_lightKeycapOpacity = self->_lightKeycapOpacity;
  v4->_useEmojiStyles = self->_useEmojiStyles;
  [(UIKBRenderConfig *)v4 setIsFloating:[(UIKBRenderConfig *)self isFloating]];
  uint64_t v5 = [(NSString *)self->_controlKeyBackgroundName copy];
  controlKeyBackgroundName = v4->_controlKeyBackgroundName;
  v4->_controlKeyBackgroundName = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_activatedKeyplaneSwitchControlKeyBackgroundName copy];
  activatedKeyplaneSwitchControlKeyBackgroundName = v4->_activatedKeyplaneSwitchControlKeyBackgroundName;
  v4->_activatedKeyplaneSwitchControlKeyBackgroundName = (NSString *)v7;

  uint64_t v9 = [(_UIButtonBarButtonVisualProvider *)self->_buttonBarVisualProvider copy];
  buttonBarVisualProvider = v4->_buttonBarVisualProvider;
  v4->_buttonBarVisualProvider = (_UIButtonBarButtonVisualProvider *)v9;

  v4->_animatedBackground = self->_animatedBackground;
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)UIKBRenderConfig;
  id v4 = [(UIKBRenderConfig *)&v8 description];
  if ([(UIKBRenderConfig *)self lightKeyboard]) {
    uint64_t v5 = @"light";
  }
  else {
    uint64_t v5 = @"dark";
  }
  objc_msgSend(v3, "stringWithFormat:", @"%@: %@ keyboard; backdropStyle = %ld, floating = %d",
    v4,
    v5,
    [(UIKBRenderConfig *)self backdropStyle],
  int v6 = [(UIKBRenderConfig *)self isFloating]);

  return v6;
}

- (BOOL)whiteText
{
  return ![(UIKBRenderConfig *)self lightKeyboard];
}

+ (id)defaultEmojiConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__UIKBRenderConfig_defaultEmojiConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB2618B8 != -1) {
    dispatch_once(&qword_1EB2618B8, block);
  }
  v2 = (void *)qword_1EB2618B0;
  return v2;
}

uint64_t __38__UIKBRenderConfig_defaultEmojiConfig__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) defaultConfig];
  uint64_t v2 = [v1 copy];
  v3 = (void *)qword_1EB2618B0;
  qword_1EB2618B0 = v2;

  id v4 = (void *)qword_1EB2618B0;
  *(unsigned char *)(qword_1EB2618B0 + 8) = 1;
  [v4 setActivatedKeyplaneSwitchControlKeyBackgroundName:@"UIKBColorWhite"];
  int64_t v5 = +[UIKBRenderFactory _graphicsQuality];
  int v6 = UIKBColorGray_Percent37;
  if (v5 != 100) {
    int v6 = UIKBColorGray_Percent80;
  }
  uint64_t v7 = *v6;
  objc_super v8 = (void *)qword_1EB2618B0;
  return [v8 setControlKeyBackgroundName:v7];
}

+ (id)clearConfigLightKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__UIKBRenderConfig_clearConfigLightKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB2618D8 != -1) {
    dispatch_once(&qword_1EB2618D8, block);
  }
  uint64_t v2 = (void *)qword_1EB2618D0;
  return v2;
}

void __40__UIKBRenderConfig_clearConfigLightKeys__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(UIKBRenderConfig);
  v3 = (void *)qword_1EB2618D0;
  qword_1EB2618D0 = (uint64_t)v2;

  [(id)qword_1EB2618D0 setEmptyBackground:1];
  [(id)qword_1EB2618D0 setAnimatedBackground:0];
  [(id)qword_1EB2618D0 setLightKeyboard:1];
  [(id)qword_1EB2618D0 setBlurRadius:0.0];
  [(id)qword_1EB2618D0 setBlurSaturation:0.9];
  [(id)qword_1EB2618D0 setKeycapOpacity:0.96];
  [(id)qword_1EB2618D0 setLightKeycapOpacity:1.0];
  [(id)qword_1EB2618D0 setIsFloating:0];
  [(id)qword_1EB2618D0 setActivatedKeyplaneSwitchControlKeyBackgroundName:@"UIKBColor10KeyLightActiveKeyplaneSwitch"];
  int64_t v4 = +[UIKBRenderFactory _graphicsQuality];
  int64_t v5 = UIKBColorGray_Percent85;
  if (v4 != 100) {
    int64_t v5 = UIKBColorKeyGrayKeyLightBackgroundMedium;
  }
  [(id)qword_1EB2618D0 setControlKeyBackgroundName:*v5];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "preferredVisualProviderClass"), "lightKeyboardProvider");
  uint64_t v7 = *(void **)(qword_1EB2618D0 + 88);
  *(void *)(qword_1EB2618D0 + 88) = v6;
}

+ (id)clearConfigDarkKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__UIKBRenderConfig_clearConfigDarkKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB2618E8 != -1) {
    dispatch_once(&qword_1EB2618E8, block);
  }
  uint64_t v2 = (void *)qword_1EB2618E0;
  return v2;
}

void __39__UIKBRenderConfig_clearConfigDarkKeys__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(UIKBRenderConfig);
  v3 = (void *)qword_1EB2618E0;
  qword_1EB2618E0 = (uint64_t)v2;

  [(id)qword_1EB2618E0 setEmptyBackground:1];
  [(id)qword_1EB2618E0 setLightKeyboard:0];
  [(id)qword_1EB2618E0 setAnimatedBackground:0];
  [(id)qword_1EB2618E0 setBlurRadius:0.0];
  [(id)qword_1EB2618E0 setBlurSaturation:0.5];
  [(id)qword_1EB2618E0 setKeycapOpacity:1.0];
  [(id)qword_1EB2618E0 setLightKeycapOpacity:1.0];
  [(id)qword_1EB2618E0 setIsFloating:0];
  [(id)qword_1EB2618E0 setControlKeyBackgroundName:@"UIKBColorKeyGrayKeyDarkBackground"];
  [(id)qword_1EB2618E0 setActivatedKeyplaneSwitchControlKeyBackgroundName:@"UIKBColorWhite_Alpha24"];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "preferredVisualProviderClass"), "darkKeyboardProvider");
  int64_t v5 = *(void **)(qword_1EB2618E0 + 88);
  *(void *)(qword_1EB2618E0 + 88) = v4;
}

+ (id)clearConfigWithLightKeys:(BOOL)a3
{
  if (a3) {
    +[UIKBRenderConfig clearConfigLightKeys];
  }
  else {
  v3 = +[UIKBRenderConfig clearConfigDarkKeys];
  }
  return v3;
}

+ (id)animatedConfigLight
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__UIKBRenderConfig_animatedConfigLight__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB2618F8 != -1) {
    dispatch_once(&qword_1EB2618F8, block);
  }
  uint64_t v2 = (void *)qword_1EB2618F0;
  return v2;
}

uint64_t __39__UIKBRenderConfig_animatedConfigLight__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) clearConfigLightKeys];
  uint64_t v2 = [v1 copy];
  v3 = (void *)qword_1EB2618F0;
  qword_1EB2618F0 = v2;

  [(id)qword_1EB2618F0 setLightKeyboard:1];
  [(id)qword_1EB2618F0 setEmptyBackground:0];
  [(id)qword_1EB2618F0 setAnimatedBackground:1];
  [(id)qword_1EB2618F0 setKeycapOpacity:0.85];
  [(id)qword_1EB2618F0 setLightKeycapOpacity:0.85];
  uint64_t v4 = (void *)qword_1EB2618F0;
  return [v4 setControlKeyBackgroundName:@"UIKBColorWhite_Alpha75"];
}

+ (id)animatedConfigDark
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__UIKBRenderConfig_animatedConfigDark__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB261908 != -1) {
    dispatch_once(&qword_1EB261908, block);
  }
  uint64_t v2 = (void *)qword_1EB261900;
  return v2;
}

uint64_t __38__UIKBRenderConfig_animatedConfigDark__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) clearConfigDarkKeys];
  uint64_t v2 = [v1 copy];
  v3 = (void *)qword_1EB261900;
  qword_1EB261900 = v2;

  [(id)qword_1EB261900 setLightKeyboard:0];
  [(id)qword_1EB261900 setEmptyBackground:0];
  [(id)qword_1EB261900 setAnimatedBackground:1];
  [(id)qword_1EB261900 setKeycapOpacity:0.85];
  [(id)qword_1EB261900 setLightKeycapOpacity:0.85];
  uint64_t v4 = (void *)qword_1EB261900;
  return [v4 setControlKeyBackgroundName:@"UIKBColorWhite_Alpha75"];
}

+ (id)configForAnimatedBackgroundWithLightKeys:(BOOL)a3
{
  if (a3) {
    +[UIKBRenderConfig animatedConfigLight];
  }
  else {
  v3 = +[UIKBRenderConfig animatedConfigDark];
  }
  return v3;
}

+ (id)lowQualityDarkConfig
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__UIKBRenderConfig_lowQualityDarkConfig__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB261918 != -1) {
    dispatch_once(&qword_1EB261918, block);
  }
  uint64_t v2 = (void *)qword_1EB261910;
  return v2;
}

uint64_t __40__UIKBRenderConfig_lowQualityDarkConfig__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) darkConfig];
  uint64_t v2 = [v1 copy];
  v3 = (void *)qword_1EB261910;
  qword_1EB261910 = v2;

  uint64_t v4 = (void *)qword_1EB261910;
  return [v4 setForceQuality:10];
}

+ (id)configForAppearance:(int64_t)a3 inputMode:(id)a4 traitEnvironment:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v10 = v9;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v8 identifier],
          double v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 hasPrefix:@"emoji"],
          v12,
          v13))
    {
      uint64_t v11 = [a1 defaultEmojiConfig];
    }
    else
    {
      uint64_t v11 = [a1 defaultConfig];
    }
    goto LABEL_15;
  }
  if (a3 == 13)
  {
    double v16 = [v9 traitCollection];
    double v15 = objc_msgSend(a1, "configForAnimatedBackgroundWithLightKeys:", objc_msgSend(v16, "userInterfaceStyle") != 2);

    double v17 = [v10 traitCollection];
    uint64_t v18 = [v17 accessibilityContrast];

    if (v18 == 1)
    {
      [v15 setKeycapOpacity:0.93];
      [v15 setLightKeycapOpacity:0.93];
    }
  }
  else
  {
    if (a3 != 12)
    {
      if (a3 == 9) {
        [a1 lowQualityDarkConfig];
      }
      else {
      uint64_t v11 = [a1 darkConfig];
      }
LABEL_15:
      double v15 = (void *)v11;
      goto LABEL_16;
    }
    double v14 = [v9 traitCollection];
    double v15 = objc_msgSend(a1, "clearConfigWithLightKeys:", objc_msgSend(v14, "userInterfaceStyle") == 1);
  }
LABEL_16:
  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    if (objc_opt_respondsToSelector())
    {
      double v19 = [v10 insertionPointColor];
      int v20 = [v15 buttonBarVisualProvider];
      [v20 setTintColor:v19];
    }
    else
    {
      double v19 = [v15 buttonBarVisualProvider];
      [v19 setTintColor:0];
    }
  }
  return v15;
}

+ (int64_t)backdropStyleForStyle:(int64_t)a3 quality:(int64_t)a4
{
  if (a4 == 10 && a3 == 2030) {
    return 2039;
  }
  else {
    return a3;
  }
}

- (int64_t)backdropStyle
{
  if ([(UIKBRenderConfig *)self animatedBackground])
  {
    uint64_t v3 = 3904;
  }
  else if ([(UIKBRenderConfig *)self emptyBackground])
  {
    uint64_t v3 = 3903;
  }
  else if ([(UIKBRenderConfig *)self lightKeyboard])
  {
    if (self->_useEmojiStyles) {
      uint64_t v3 = 3902;
    }
    else {
      uint64_t v3 = 3901;
    }
  }
  else
  {
    uint64_t v3 = 2030;
  }
  int64_t v4 = [(UIKBRenderConfig *)self forceQuality];
  if (!v4) {
    int64_t v4 = +[UIKBRenderFactory _graphicsQuality];
  }
  int64_t v5 = objc_opt_class();
  return [v5 backdropStyleForStyle:v3 quality:v4];
}

- (int64_t)keyBackdropStyle
{
  if ([(UIKBRenderConfig *)self animatedBackground]) {
    return 3905;
  }
  return [(UIKBRenderConfig *)self backdropStyle];
}

- (int64_t)blurEffectStyle
{
  int64_t v2 = [(UIKBRenderConfig *)self backdropStyle];
  int64_t v3 = 1000;
  if (v2 == 3902) {
    int64_t v3 = 502;
  }
  if (v2 == 3901) {
    return 501;
  }
  else {
    return v3;
  }
}

- (int64_t)forceQuality
{
  return self->_forceQuality;
}

- (void)setForceQuality:(int64_t)a3
{
  self->_forceQuality = a3;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (double)blurSaturation
{
  return self->_blurSaturation;
}

- (double)keycapOpacity
{
  return self->_keycapOpacity;
}

- (double)lightKeycapOpacity
{
  return self->_lightKeycapOpacity;
}

- (NSString)controlKeyBackgroundName
{
  return self->_controlKeyBackgroundName;
}

- (NSString)activatedKeyplaneSwitchControlKeyBackgroundName
{
  return self->_activatedKeyplaneSwitchControlKeyBackgroundName;
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

- (_UIButtonBarButtonVisualProvider)buttonBarVisualProvider
{
  return self->_buttonBarVisualProvider;
}

- (BOOL)emptyBackground
{
  return self->_emptyBackground;
}

- (void)setEmptyBackground:(BOOL)a3
{
  self->_emptyBackground = a3;
}

- (void)setAnimatedBackground:(BOOL)a3
{
  self->_animatedBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonBarVisualProvider, 0);
  objc_storeStrong((id *)&self->_activatedKeyplaneSwitchControlKeyBackgroundName, 0);
  objc_storeStrong((id *)&self->_controlKeyBackgroundName, 0);
  objc_storeStrong((id *)&self->_customSymbolImages, 0);
}

- (void)overrideKeycapWithSymbol:(id)a3 forDisplayType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  customSymbolImages = self->_customSymbolImages;
  id v11 = v6;
  if (v6)
  {
    if (!customSymbolImages)
    {
      id v8 = [MEMORY[0x1E4F1CA60] dictionary];
      id v9 = self->_customSymbolImages;
      self->_customSymbolImages = v8;

      customSymbolImages = self->_customSymbolImages;
    }
    double v10 = [NSNumber numberWithUnsignedInt:v4];
    [(NSMutableDictionary *)customSymbolImages setObject:v11 forKey:v10];
  }
  else
  {
    if (!customSymbolImages) {
      goto LABEL_8;
    }
    double v10 = [NSNumber numberWithUnsignedInt:v4];
    [(NSMutableDictionary *)customSymbolImages removeObjectForKey:v10];
  }

LABEL_8:
}

- (id)imageNameForType:(int)a3
{
  customSymbolImages = self->_customSymbolImages;
  if (customSymbolImages)
  {
    uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
    customSymbolImages = [customSymbolImages objectForKey:v4];
  }
  return customSymbolImages;
}

@end