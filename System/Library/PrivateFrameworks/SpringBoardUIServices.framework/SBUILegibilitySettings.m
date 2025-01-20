@interface SBUILegibilitySettings
+ (BOOL)supportsSecureCoding;
+ (id)sharedInstanceForStyle:(int64_t)a3;
- ($7EAA55B41BE6719E250DE54AFC18E175)shadowSettings;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLegibilitySettings:(id)a3;
- (NSString)description;
- (SBUILegibilitySettings)initWithCoder:(id)a3;
- (SBUILegibilitySettings)initWithContentColor:(id)a3;
- (SBUILegibilitySettings)initWithContentColor:(id)a3 contrast:(double)a4;
- (SBUILegibilitySettings)initWithStyle:(int64_t)a3;
- (SBUILegibilitySettings)initWithStyle:(int64_t)a3 contentColor:(id)a4;
- (SBUILegibilitySettings)initWithStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6;
- (SBUILegibilitySettings)initWithStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6 shadowSettings:(id *)a7;
- (SBUILegibilitySettings)initWithStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6 shadowSettings:(id *)a7 minFillHeight:(double)a8;
- (UIColor)primaryColor;
- (UIColor)secondaryColor;
- (UIColor)shadowColor;
- (double)imageOutset;
- (double)minFillHeight;
- (double)shadowAlpha;
- (double)shadowRadius;
- (id)_UILegibilitySettings;
- (id)compositingFilter;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)style;
- (unint64_t)hash;
- (void)_configureForStyle:(int64_t)a3 contentColor:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBUILegibilitySettings

+ (id)sharedInstanceForStyle:(int64_t)a3
{
  if (a3 == 2)
  {
    if (sharedInstanceForStyle__once_31 != -1) {
      dispatch_once(&sharedInstanceForStyle__once_31, &__block_literal_global_34);
    }
    v3 = &sharedInstanceForStyle__instance_32;
  }
  else
  {
    if (sharedInstanceForStyle__once != -1) {
      dispatch_once(&sharedInstanceForStyle__once, &__block_literal_global_24);
    }
    v3 = &sharedInstanceForStyle__instance;
  }
  id v4 = (id)*v3;
  return v4;
}

uint64_t __49__SBUILegibilitySettings_sharedInstanceForStyle___block_invoke()
{
  v0 = [[SBUILegibilitySettings alloc] initWithStyle:1];
  uint64_t v1 = sharedInstanceForStyle__instance;
  sharedInstanceForStyle__instance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __49__SBUILegibilitySettings_sharedInstanceForStyle___block_invoke_2()
{
  v0 = [[SBUILegibilitySettings alloc] initWithStyle:2];
  uint64_t v1 = sharedInstanceForStyle__instance_32;
  sharedInstanceForStyle__instance_32 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (SBUILegibilitySettings)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBUILegibilitySettings;
  id v4 = [(SBUILegibilitySettings *)&v7 init];
  v5 = v4;
  if (v4) {
    [(SBUILegibilitySettings *)v4 _configureForStyle:a3 contentColor:0];
  }
  return v5;
}

- (SBUILegibilitySettings)initWithContentColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F43230] styleForContentColor:v4];
  v9.receiver = self;
  v9.super_class = (Class)SBUILegibilitySettings;
  v6 = [(SBUILegibilitySettings *)&v9 init];
  objc_super v7 = v6;
  if (v6) {
    [(SBUILegibilitySettings *)v6 _configureForStyle:v5 contentColor:v4];
  }

  return v7;
}

- (SBUILegibilitySettings)initWithContentColor:(id)a3 contrast:(double)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBUILegibilitySettings;
  objc_super v7 = [(SBUILegibilitySettings *)&v9 init];
  if (v7) {
    -[SBUILegibilitySettings _configureForStyle:contentColor:](v7, "_configureForStyle:contentColor:", [MEMORY[0x1E4F43230] styleForContentColor:v6 contrast:a4], v6);
  }

  return v7;
}

- (SBUILegibilitySettings)initWithStyle:(int64_t)a3 contentColor:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBUILegibilitySettings;
  objc_super v7 = [(SBUILegibilitySettings *)&v10 init];
  v8 = v7;
  if (v7) {
    [(SBUILegibilitySettings *)v7 _configureForStyle:a3 contentColor:v6];
  }

  return v8;
}

- (SBUILegibilitySettings)initWithStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SBUILegibilitySettings;
  v14 = [(SBUILegibilitySettings *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(SBUILegibilitySettings *)v14 _configureForStyle:a3 contentColor:0];
    objc_storeStrong((id *)&v15->_primaryColor, a4);
    objc_storeStrong((id *)&v15->_secondaryColor, a5);
    objc_storeStrong((id *)&v15->_shadowColor, a6);
  }

  return v15;
}

- (SBUILegibilitySettings)initWithStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6 shadowSettings:(id *)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBUILegibilitySettings;
  v16 = [(SBUILegibilitySettings *)&v20 init];
  objc_super v17 = v16;
  if (v16)
  {
    [(SBUILegibilitySettings *)v16 _configureForStyle:a3 contentColor:0];
    objc_storeStrong((id *)&v17->_primaryColor, a4);
    objc_storeStrong((id *)&v17->_secondaryColor, a5);
    objc_storeStrong((id *)&v17->_shadowColor, a6);
    long long v18 = *(_OWORD *)&a7->var2;
    *(_OWORD *)&v17->_shadowSettings.shadowRadius = *(_OWORD *)&a7->var0;
    *(_OWORD *)&v17->_shadowSettings.imageOutset = v18;
  }

  return v17;
}

- (SBUILegibilitySettings)initWithStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6 shadowSettings:(id *)a7 minFillHeight:(double)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SBUILegibilitySettings;
  long long v18 = [(SBUILegibilitySettings *)&v22 init];
  v19 = v18;
  if (v18)
  {
    [(SBUILegibilitySettings *)v18 _configureForStyle:a3 contentColor:0];
    objc_storeStrong((id *)&v19->_primaryColor, a4);
    objc_storeStrong((id *)&v19->_secondaryColor, a5);
    objc_storeStrong((id *)&v19->_shadowColor, a6);
    long long v20 = *(_OWORD *)&a7->var2;
    *(_OWORD *)&v19->_shadowSettings.shadowRadius = *(_OWORD *)&a7->var0;
    *(_OWORD *)&v19->_shadowSettings.imageOutset = v20;
    v19->_minFillHeight = a8;
  }

  return v19;
}

- (id)_UILegibilitySettings
{
  cachedLegacyLegibiltiySettings = self->_cachedLegacyLegibiltiySettings;
  if (!cachedLegacyLegibiltiySettings)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F43228]);
    int64_t style = self->_style;
    id v6 = [(SBUILegibilitySettings *)self primaryColor];
    objc_super v7 = [(SBUILegibilitySettings *)self secondaryColor];
    v8 = [(SBUILegibilitySettings *)self shadowColor];
    objc_super v9 = (_UILegibilitySettings *)[v4 initWithStyle:style primaryColor:v6 secondaryColor:v7 shadowColor:v8];
    objc_super v10 = self->_cachedLegacyLegibiltiySettings;
    self->_cachedLegacyLegibiltiySettings = v9;

    [(_UILegibilitySettings *)self->_cachedLegacyLegibiltiySettings setShadowAlpha:self->_shadowSettings.shadowAlpha];
    [(_UILegibilitySettings *)self->_cachedLegacyLegibiltiySettings setShadowRadius:self->_shadowSettings.shadowRadius];
    [(_UILegibilitySettings *)self->_cachedLegacyLegibiltiySettings setImageOutset:self->_shadowSettings.imageOutset];
    [(_UILegibilitySettings *)self->_cachedLegacyLegibiltiySettings setMinFillHeight:self->_minFillHeight];
    cachedLegacyLegibiltiySettings = self->_cachedLegacyLegibiltiySettings;
  }
  id v11 = cachedLegacyLegibiltiySettings;
  return v11;
}

- (double)shadowRadius
{
  return self->_shadowSettings.shadowRadius;
}

- (double)shadowAlpha
{
  return self->_shadowSettings.shadowAlpha;
}

- (double)imageOutset
{
  return self->_shadowSettings.imageOutset;
}

- (id)compositingFilter
{
  return CAFilterForSBUILegibilityShadowCompositingFilter(self->_shadowSettings.compositingFilter);
}

- (BOOL)isEqualToLegibilitySettings:(id)a3
{
  id v4 = (SBUILegibilitySettings *)a3;
  uint64_t v5 = (double *)v4;
  if (!v4) {
    goto LABEL_15;
  }
  if (v4 == self)
  {
    char v14 = 1;
    goto LABEL_17;
  }
  if (self->_style != v4->_style) {
    goto LABEL_15;
  }
  long long v6 = *(_OWORD *)&self->_shadowSettings.imageOutset;
  v17[0] = *(_OWORD *)&self->_shadowSettings.shadowRadius;
  v17[1] = v6;
  long long v7 = *(_OWORD *)&v4->_shadowSettings.imageOutset;
  v16[0] = *(_OWORD *)&v4->_shadowSettings.shadowRadius;
  v16[1] = v7;
  if (!SBUI_LegibilityShadowSettingsAreEqual((uint64_t)v17, (uint64_t)v16)) {
    goto LABEL_15;
  }
  if (vabdd_f64(self->_minFillHeight, v5[6]) >= 2.22044605e-16) {
    goto LABEL_15;
  }
  primaryColor = self->_primaryColor;
  unint64_t v9 = *((void *)v5 + 3);
  if (primaryColor != (UIColor *)v9
    && (unint64_t)primaryColor | v9
    && !-[UIColor _isSimilarToColor:withinPercentage:](primaryColor, "_isSimilarToColor:withinPercentage:", 0.01))
  {
    goto LABEL_15;
  }
  secondaryColor = self->_secondaryColor;
  unint64_t v11 = *((void *)v5 + 4);
  if (secondaryColor == (UIColor *)v11
    || !((unint64_t)secondaryColor | v11)
    || -[UIColor _isSimilarToColor:withinPercentage:](secondaryColor, "_isSimilarToColor:withinPercentage:", 0.01))
  {
    shadowColor = self->_shadowColor;
    unint64_t v13 = *((void *)v5 + 5);
    char v14 = 1;
    if (shadowColor != (UIColor *)v13 && (unint64_t)shadowColor | v13) {
      char v14 = -[UIColor _isSimilarToColor:withinPercentage:](shadowColor, "_isSimilarToColor:withinPercentage:", 0.01);
    }
  }
  else
  {
LABEL_15:
    char v14 = 0;
  }
LABEL_17:

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBUILegibilitySettings *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    BOOL v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [(SBUILegibilitySettings *)self isEqualToLegibilitySettings:v5];
  }
  else {
LABEL_5:
  }
    BOOL v6 = 0;
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  unint64_t result = self->_computedHash;
  if (!result)
  {
    int64_t style = self->_style;
    long long v5 = *(_OWORD *)&self->_shadowSettings.imageOutset;
    v11[0] = *(_OWORD *)&self->_shadowSettings.shadowRadius;
    v11[1] = v5;
    uint64_t v6 = SBUILegibilityShadowSettingsHash((uint64_t)v11) ^ style;
    uint64_t v7 = v6 ^ [(UIColor *)self->_primaryColor hash];
    uint64_t v8 = [(UIColor *)self->_secondaryColor hash];
    uint64_t v9 = v7 ^ v8 ^ [(UIColor *)self->_shadowColor hash];
    objc_super v10 = [NSNumber numberWithDouble:self->_minFillHeight];
    self->_computedHash = v9 ^ [v10 hash];

    return self->_computedHash;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[SBUILegibilitySettings allocWithZone:a3] init];
  v4->_int64_t style = self->_style;
  objc_storeStrong((id *)&v4->_primaryColor, self->_primaryColor);
  objc_storeStrong((id *)&v4->_secondaryColor, self->_secondaryColor);
  objc_storeStrong((id *)&v4->_shadowColor, self->_shadowColor);
  long long v5 = *(_OWORD *)&self->_shadowSettings.imageOutset;
  *(_OWORD *)&v4->_shadowSettings.shadowRadius = *(_OWORD *)&self->_shadowSettings.shadowRadius;
  *(_OWORD *)&v4->_shadowSettings.imageOutset = v5;
  v4->_minFillHeight = self->_minFillHeight;
  return v4;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = v3;
  int64_t style = self->_style;
  uint64_t v6 = @"SBUIModernLegibilityStyleDefault";
  if (style == 2) {
    uint64_t v6 = @"SBUIModernLegibilityStyleDarkContentWithLightShadow";
  }
  if (style == 1) {
    uint64_t v7 = @"SBUIModernLegibilityStyleLightContentWithDarkShadow";
  }
  else {
    uint64_t v7 = v6;
  }
  id v8 = (id)[v3 appendObject:v7 withName:@"style"];
  uint64_t v9 = [(SBUILegibilitySettings *)self primaryColor];
  id v10 = (id)[v4 appendObject:v9 withName:@"primaryColor"];

  unint64_t v11 = [(SBUILegibilitySettings *)self secondaryColor];
  id v12 = (id)[v4 appendObject:v11 withName:@"secondaryColor"];

  unint64_t v13 = [(SBUILegibilitySettings *)self shadowColor];
  id v14 = (id)[v4 appendObject:v13 withName:@"shadowColor"];

  [(SBUILegibilitySettings *)self minFillHeight];
  id v16 = (id)[v4 appendInteger:(uint64_t)v15 withName:@"minFillHeight"];
  [(SBUILegibilitySettings *)self shadowSettings];
  id v17 = NSDictionaryFromSBUILegibilityShadowSettings((uint64_t)&v21);
  id v18 = (id)[v4 appendObject:v17 withName:@"shadowSettings"];

  v19 = [v4 build];

  return (NSString *)v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBUILegibilitySettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBUILegibilitySettings;
  long long v5 = [(SBUILegibilitySettings *)&v17 init];
  if (v5)
  {
    v5->_int64_t style = [v4 decodeIntegerForKey:@"kSBUIModernLegibilityStyleKey"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSBUIModernLegibilityPrimaryColorKey"];
    primaryColor = v5->_primaryColor;
    v5->_primaryColor = (UIColor *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSBUIModernLegibilitySecondaryColorKey"];
    secondaryColor = v5->_secondaryColor;
    v5->_secondaryColor = (UIColor *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSBUIModernLegibilityShadowColorKey"];
    shadowColor = v5->_shadowColor;
    v5->_shadowColor = (UIColor *)v10;

    v5->_shadowSettings.compositingFilter = [v4 decodeIntegerForKey:@"kSBUIModernLegibilityShadowCompositingFilterNameKey"];
    [v4 decodeDoubleForKey:@"kSBUIModernLegibilityShadowRadiusKey"];
    v5->_shadowSettings.shadowRadius = v12;
    [v4 decodeDoubleForKey:@"kSBUIModernLegibilityShadowAlphaKey"];
    v5->_shadowSettings.shadowAlpha = v13;
    [v4 decodeDoubleForKey:@"kSBUIModernLegibilityImageOutsetKey"];
    v5->_shadowSettings.imageOutset = v14;
    [v4 decodeDoubleForKey:@"kSBUIModernLegibilityMinFillHeightKey"];
    v5->_minFillHeight = v15;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t style = self->_style;
  id v5 = a3;
  [v5 encodeInteger:style forKey:@"kSBUIModernLegibilityStyleKey"];
  [v5 encodeObject:self->_primaryColor forKey:@"kSBUIModernLegibilityPrimaryColorKey"];
  [v5 encodeObject:self->_secondaryColor forKey:@"kSBUIModernLegibilitySecondaryColorKey"];
  [v5 encodeObject:self->_shadowColor forKey:@"kSBUIModernLegibilityShadowColorKey"];
  [v5 encodeInteger:self->_shadowSettings.compositingFilter forKey:@"kSBUIModernLegibilityShadowCompositingFilterNameKey"];
  [v5 encodeDouble:@"kSBUIModernLegibilityShadowRadiusKey" forKey:self->_shadowSettings.shadowRadius];
  [v5 encodeDouble:@"kSBUIModernLegibilityShadowAlphaKey" forKey:self->_shadowSettings.shadowAlpha];
  [v5 encodeDouble:@"kSBUIModernLegibilityImageOutsetKey" forKey:self->_shadowSettings.imageOutset];
  [(SBUILegibilitySettings *)self minFillHeight];
  objc_msgSend(v5, "encodeDouble:forKey:", @"kSBUIModernLegibilityMinFillHeightKey");
}

- (void)_configureForStyle:(int64_t)a3 contentColor:(id)a4
{
  id v6 = a4;
  id v26 = v6;
  switch(a3)
  {
    case 2:
      if (v6) {
        ComputeLegibilityColorFromColor(v6);
      }
      else {
      double v13 = [MEMORY[0x1E4F428B8] blackColor];
      }
      primaryColor = self->_primaryColor;
      self->_primaryColor = v13;

      long long v20 = [(UIColor *)self->_primaryColor colorWithAlphaComponent:0.45];
      secondaryColor = self->_secondaryColor;
      self->_secondaryColor = v20;

      objc_super v22 = [MEMORY[0x1E4F428B8] whiteColor];
      shadowColor = self->_shadowColor;
      self->_shadowColor = v22;

      int64_t v24 = 2;
      goto LABEL_13;
    case 1:
      double v14 = [MEMORY[0x1E4F428B8] whiteColor];
      double v15 = self->_primaryColor;
      self->_primaryColor = v14;

      id v16 = [(UIColor *)self->_primaryColor colorWithAlphaComponent:0.45];
      objc_super v17 = self->_secondaryColor;
      self->_secondaryColor = v16;

      if (v26) {
        ComputeLegibilityColorFromColor(v26);
      }
      else {
      id v18 = [MEMORY[0x1E4F428B8] blackColor];
      }
      v25 = self->_shadowColor;
      self->_shadowColor = v18;

      int64_t v24 = 1;
LABEL_13:
      *(_OWORD *)&self->_shadowSettings.shadowRadius = xmmword_1A76A5720;
      self->_shadowSettings.imageOutset = 24.0;
      self->_shadowSettings.compositingFilter = v24;
      break;
    case 0:
      uint64_t v7 = [MEMORY[0x1E4F428B8] clearColor];
      uint64_t v8 = self->_primaryColor;
      self->_primaryColor = v7;

      uint64_t v9 = [MEMORY[0x1E4F428B8] clearColor];
      uint64_t v10 = self->_secondaryColor;
      self->_secondaryColor = v9;

      unint64_t v11 = [MEMORY[0x1E4F428B8] clearColor];
      double v12 = self->_shadowColor;
      self->_shadowColor = v11;

      self->_shadowSettings.shadowRadius = 0.0;
      self->_shadowSettings.shadowAlpha = 0.0;
      self->_shadowSettings.imageOutset = 0.0;
      break;
  }
  self->_minFillHeight = 20.0;
  self->_int64_t style = a3;
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (UIColor)secondaryColor
{
  return self->_secondaryColor;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- ($7EAA55B41BE6719E250DE54AFC18E175)shadowSettings
{
  long long v3 = *(_OWORD *)&self[2].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var0;
  *(_OWORD *)&retstr->var2 = v3;
  return self;
}

- (double)minFillHeight
{
  return self->_minFillHeight;
}

- (int64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_cachedLegacyLegibiltiySettings, 0);
}

@end