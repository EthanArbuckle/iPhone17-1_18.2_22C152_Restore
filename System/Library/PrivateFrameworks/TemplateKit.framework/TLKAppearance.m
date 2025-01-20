@interface TLKAppearance
+ (BOOL)viewHasOverriddenAppearance:(id)a3;
+ (TLKAppearance)appearanceWithStyle:(unint64_t)a3;
+ (TLKAppearance)appearanceWithVibrancyEnabled:(BOOL)a3 isDark:(BOOL)a4;
+ (id)allAppearances;
+ (id)bestAppearanceForSystem;
+ (id)bestAppearanceForTraitCollection:(id)a3;
+ (id)bestAppearanceForView:(id)a3;
+ (id)colorWithRed:(unint64_t)a3 green:(unint64_t)a4 blue:(unint64_t)a5;
+ (void)disableAppearanceOverrideForView:(id)a3;
- (BOOL)isDark;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVibrant;
- (NSString)name;
- (UIColor)backgroundColor;
- (UIColor)groupedBackgroundColor;
- (UIColor)platterColor;
- (UIColor)primaryColor;
- (UIColor)quaternaryColor;
- (UIColor)quinaryColor;
- (UIColor)secondaryButtonColor;
- (UIColor)secondaryColor;
- (UIColor)tertiaryColor;
- (double)accessibilityContrastColorBoost;
- (id)buttonColorForProminence:(unint64_t)a3;
- (id)colorForProminence:(unint64_t)a3;
- (id)compositingFilter;
- (id)primaryColorWithDefaultAlpha:(double)a3;
- (id)textColorForColor:(int64_t)a3;
- (unint64_t)style;
- (void)disableAppearanceForView:(id)a3;
- (void)enableAppearanceForContainer:(id)a3;
- (void)enableAppearanceForView:(id)a3;
- (void)overrideAppearanceForView:(id)a3;
@end

@implementation TLKAppearance

+ (void)disableAppearanceOverrideForView:(id)a3
{
  id v3 = a3;
  [v3 setOverrideUserInterfaceStyle:0];
  [v3 _setOverrideVibrancyTrait:-1];
}

- (void)disableAppearanceForView:(id)a3
{
  id v3 = [a3 layer];
  [v3 setCompositingFilter:0];
}

- (id)colorForProminence:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      self = [(TLKAppearance *)self primaryColor];
      goto LABEL_10;
    case 1uLL:
      self = [(TLKAppearance *)self secondaryColor];
      goto LABEL_10;
    case 2uLL:
      self = [(TLKAppearance *)self tertiaryColor];
      goto LABEL_10;
    case 3uLL:
      self = [(TLKAppearance *)self quaternaryColor];
      goto LABEL_10;
    case 4uLL:
      self = [(TLKAppearance *)self quinaryColor];
LABEL_10:
      break;
    default:
      break;
  }
  return self;
}

- (id)primaryColorWithDefaultAlpha:(double)a3
{
  if (UIAccessibilityDarkerSystemColorsEnabled()) {
    a3 = a3 + 0.2;
  }
  v5 = [(TLKAppearance *)self primaryColor];
  v6 = [v5 colorWithAlphaComponent:a3];

  return v6;
}

+ (id)bestAppearanceForView:(id)a3
{
  uint64_t v4 = [a3 traitCollection];
  v5 = [a1 bestAppearanceForTraitCollection:v4];

  return v5;
}

+ (TLKAppearance)appearanceWithStyle:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      uint64_t v4 = &appearanceWithStyle__cachedLightAppearance;
      v5 = (void *)appearanceWithStyle__cachedLightAppearance;
      if (appearanceWithStyle__cachedLightAppearance) {
        goto LABEL_13;
      }
      goto LABEL_12;
    case 1uLL:
      uint64_t v4 = &appearanceWithStyle__cachedDarkAppearance;
      v5 = (void *)appearanceWithStyle__cachedDarkAppearance;
      if (!appearanceWithStyle__cachedDarkAppearance) {
        goto LABEL_12;
      }
      goto LABEL_13;
    case 2uLL:
      uint64_t v4 = &appearanceWithStyle__cachedVibrantLightAppearance;
      v5 = (void *)appearanceWithStyle__cachedVibrantLightAppearance;
      if (!appearanceWithStyle__cachedVibrantLightAppearance) {
        goto LABEL_12;
      }
      goto LABEL_13;
    case 3uLL:
      uint64_t v4 = &appearanceWithStyle__cachedVibrantDarkAppearance;
      v5 = (void *)appearanceWithStyle__cachedVibrantDarkAppearance;
      if (!appearanceWithStyle__cachedVibrantDarkAppearance)
      {
LABEL_12:
        uint64_t v7 = objc_opt_new();
        v8 = (void *)*v4;
        *uint64_t v4 = v7;

        v5 = (void *)*v4;
      }
LABEL_13:
      a1 = v5;
      break;
    default:
      break;
  }
  return (TLKAppearance *)a1;
}

+ (id)bestAppearanceForTraitCollection:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 _vibrancy] == 1;
  uint64_t v6 = [v4 userInterfaceStyle];

  return (id)[a1 appearanceWithVibrancyEnabled:v5 isDark:v6 == 2];
}

+ (TLKAppearance)appearanceWithVibrancyEnabled:(BOOL)a3 isDark:(BOOL)a4
{
  uint64_t v4 = 3;
  if (!a3 || !a4) {
    uint64_t v4 = 0;
  }
  uint64_t v5 = 2;
  if (a4 || !a3) {
    uint64_t v5 = v4;
  }
  if (!a4 || a3) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 1;
  }
  return +[TLKAppearance appearanceWithStyle:v6];
}

- (void)enableAppearanceForContainer:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(TLKAppearance *)self compositingFilter];

  uint64_t v5 = v13;
  if (v4)
  {
    id v6 = v13;
    uint64_t v7 = [v6 layer];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      do
      {
        v9 = [v6 superview];

        v10 = [v9 layer];
        objc_opt_class();
        char v11 = objc_opt_isKindOfClass();

        id v6 = v9;
      }
      while ((v11 & 1) != 0);
    }
    else
    {
      v9 = v6;
    }
    v12 = [v9 layer];
    [v12 setAllowsGroupBlending:0];

    uint64_t v5 = v13;
  }
}

- (void)enableAppearanceForView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TLKAppearance *)self compositingFilter];
  id v6 = [v4 layer];
  [v6 setCompositingFilter:v5];

  id v7 = [v4 superview];

  [(TLKAppearance *)self enableAppearanceForContainer:v7];
}

- (id)compositingFilter
{
  return objc_getProperty(self, a2, 32, 1);
}

- (id)buttonColorForProminence:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      self = [(TLKAppearance *)self primaryButtonColor];
      goto LABEL_9;
    case 1uLL:
      self = [(TLKAppearance *)self secondaryButtonColor];
      goto LABEL_9;
    case 2uLL:
      self = [(TLKAppearance *)self tertiaryButtonColor];
      goto LABEL_9;
    case 3uLL:
    case 4uLL:
      self = [(TLKAppearance *)self quaternaryButtonColor];
LABEL_9:
      break;
    default:
      break;
  }
  return self;
}

- (BOOL)isDark
{
  return self->_isDark;
}

- (BOOL)isVibrant
{
  return self->_isVibrant;
}

- (UIColor)quaternaryColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] quaternaryLabelColor];
}

- (UIColor)backgroundColor
{
  if ([(TLKAppearance *)self isVibrant])
  {
    v2 = 0;
  }
  else
  {
    v2 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  return (UIColor *)v2;
}

+ (id)allAppearances
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = +[TLKAppearance appearanceWithStyle:0];
  v8[0] = v2;
  uint64_t v3 = +[TLKAppearance appearanceWithStyle:1];
  v8[1] = v3;
  uint64_t v4 = +[TLKAppearance appearanceWithStyle:2];
  v8[2] = v4;
  uint64_t v5 = +[TLKAppearance appearanceWithStyle:3];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)bestAppearanceForSystem
{
  uint64_t v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  uint64_t v4 = [v3 traitCollection];
  uint64_t v5 = [a1 bestAppearanceForTraitCollection:v4];

  return v5;
}

- (UIColor)primaryColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] labelColor];
}

- (UIColor)secondaryColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] secondaryLabelColor];
}

- (UIColor)tertiaryColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] tertiaryLabelColor];
}

- (UIColor)quinaryColor
{
  double v7 = 0.0;
  uint64_t v3 = [(TLKAppearance *)self quaternaryColor];
  [v3 getHue:0 saturation:0 brightness:0 alpha:&v7];

  double v7 = v7 * 0.6;
  uint64_t v4 = [(TLKAppearance *)self quaternaryColor];
  uint64_t v5 = [v4 colorWithAlphaComponent:v7];

  return (UIColor *)v5;
}

- (UIColor)secondaryButtonColor
{
  if ([(TLKAppearance *)self isVibrant]) {
    [(TLKAppearance *)self primaryButtonColor];
  }
  else {
  uint64_t v3 = [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  return (UIColor *)v3;
}

- (UIColor)platterColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
}

- (UIColor)groupedBackgroundColor
{
  if ([(TLKAppearance *)self isVibrant])
  {
    v2 = 0;
  }
  else
  {
    v2 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  return (UIColor *)v2;
}

+ (BOOL)viewHasOverriddenAppearance:(id)a3
{
  id v3 = a3;
  if ([v3 overrideUserInterfaceStyle]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [v3 _overrideVibrancyTrait] != -1;
  }

  return v4;
}

- (void)overrideAppearanceForView:(id)a3
{
  id v5 = a3;
  if ([(TLKAppearance *)self isDark]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  [v5 setOverrideUserInterfaceStyle:v4];
  objc_msgSend(v5, "_setOverrideVibrancyTrait:", -[TLKAppearance isVibrant](self, "isVibrant"));
}

- (id)textColorForColor:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v3 = [MEMORY[0x1E4FB1618] systemRedColor];
      break;
    case 2:
      id v3 = [MEMORY[0x1E4FB1618] systemOrangeColor];
      break;
    case 3:
      id v3 = [MEMORY[0x1E4FB1618] systemYellowColor];
      break;
    case 4:
      id v3 = [MEMORY[0x1E4FB1618] systemGreenColor];
      break;
    case 5:
      id v3 = [MEMORY[0x1E4FB1618] systemBlueColor];
      break;
    case 6:
      id v3 = [MEMORY[0x1E4FB1618] systemPurpleColor];
      break;
    case 7:
      id v3 = [MEMORY[0x1E4FB1618] whiteColor];
      break;
    case 8:
      id v3 = [MEMORY[0x1E4FB1618] linkColor];
      break;
    default:
      id v3 = [(TLKAppearance *)self primaryColor];
      break;
  }
  return v3;
}

+ (id)colorWithRed:(unint64_t)a3 green:(unint64_t)a4 blue:(unint64_t)a5
{
  return (id)[MEMORY[0x1E4FB1618] colorWithRed:(double)a3 / 255.0 green:(double)a4 / 255.0 blue:(double)a5 / 255.0 alpha:1.0];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TLKAppearance *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v6 = [(TLKAppearance *)self style];
    BOOL v7 = v6 == [(TLKAppearance *)v5 style];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)style
{
  return self->_style;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (double)accessibilityContrastColorBoost
{
  return self->_accessibilityContrastColorBoost;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_compositingFilter, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end