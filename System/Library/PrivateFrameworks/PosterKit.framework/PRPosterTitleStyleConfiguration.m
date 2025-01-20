@interface PRPosterTitleStyleConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (PRPosterColor)defaultTitleColor;
+ (PRPosterContentStyle)defaultTitleContentStyle;
+ (PRPosterTitleStyleConfiguration)allocWithZone:(_NSZone *)a3;
+ (UIFont)defaultTimeFont;
+ (double)defaultContentsLuminance;
+ (id)defaultTitleFontForRole:(id)a3;
+ (id)titleColorForTitleContentStyle:(id)a3;
+ (unint64_t)defaultTitleAlignment;
+ (unint64_t)defaultTitleLayout;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVisiblyEqualToTitleStyleConfiguration:(id)a3;
- (BOOL)prefersVerticalTitleLayout;
- (BSUIVibrancyConfiguration)vibrancyConfiguration;
- (Class)classForCoder;
- (NSString)description;
- (NSString)effectiveTimeNumberingSystem;
- (PRPosterColor)effectiveTitleColor;
- (PRPosterContentStyle)effectiveTitleContentStyle;
- (PRPosterTitleStyleConfiguration)init;
- (PRPosterTitleStyleConfiguration)initWithBSXPCCoder:(id)a3;
- (PRPosterTitleStyleConfiguration)initWithCoder:(id)a3;
- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 preferredTitleAlignment:(unint64_t)a4 preferredTitleLayout:(unint64_t)a5 titleColor:(id)a6 timeNumberingSystem:(id)a7 userConfigured:(BOOL)a8 contentsLuminance:(double)a9 alternateDateEnabled:(BOOL)a10 groupName:(id)a11;
- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 preferredTitleAlignment:(unint64_t)a4 preferredTitleLayout:(unint64_t)a5 titleContentStyle:(id)a6 timeNumberingSystem:(id)a7 userConfigured:(BOOL)a8 contentsLuminance:(double)a9 alternateDateEnabled:(BOOL)a10 groupName:(id)a11;
- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 preferredTitleAlignment:(unint64_t)a4 preferredTitleLayout:(unint64_t)a5 titleContentStyle:(id)a6 titleColor:(id)a7 timeNumberingSystem:(id)a8 userConfigured:(BOOL)a9 contentsLuminance:(double)a10 alternateDateEnabled:(BOOL)a11 groupName:(id)a12;
- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 titleColor:(id)a4;
- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 titleColor:(id)a4 timeNumberingSystem:(id)a5;
- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 titleContentStyle:(id)a4;
- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 titleContentStyle:(id)a4 timeNumberingSystem:(id)a5;
- (PRPosterTitleStyleConfiguration)initWithTitleStyleConfiguration:(id)a3;
- (id)_effectiveTitlePrivateContentStyle;
- (id)_vibrancyConfigurationWithExtensionBundleURL:(id)a3 luminanceReduced:(BOOL)a4;
- (id)effectiveTimeFontWithExtensionBundle:(id)a3;
- (id)effectiveTimeFontWithExtensionBundle:(id)a3 forRole:(id)a4;
- (id)effectiveTimeFontWithExtensionBundleURL:(id)a3;
- (id)effectiveTimeFontWithExtensionBundleURL:(id)a3 forRole:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)resolvedWithLookDefaultTitleStyleConfiguration:(id)a3 allowTitleColorUpdates:(BOOL)a4 allowTitleFontUpdates:(BOOL)a5;
- (id)vibrancyConfigurationWithExtensionBundle:(id)a3;
- (id)vibrancyConfigurationWithExtensionBundle:(id)a3 luminanceReduced:(BOOL)a4;
- (id)vibrancyConfigurationWithExtensionBundleURL:(id)a3;
- (id)vibrancyConfigurationWithExtensionBundleURL:(id)a3 luminanceReduced:(BOOL)a4;
- (unint64_t)effectiveTitleAlignmentForText:(id)a3 withFont:(id)a4;
- (unint64_t)effectiveTitleLayoutForText:(id)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRPosterTitleStyleConfiguration

- (id)resolvedWithLookDefaultTitleStyleConfiguration:(id)a3 allowTitleColorUpdates:(BOOL)a4 allowTitleFontUpdates:(BOOL)a5
{
  id v8 = a3;
  v9 = (void *)[(PRPosterTitleStyleConfiguration *)self mutableCopy];
  [v8 contentsLuminance];
  objc_msgSend(v9, "setContentsLuminance:");
  v10 = [v8 groupName];
  [v9 setGroupName:v10];

  if (!a4)
  {
    v11 = [v8 effectiveTitleColor];
    [v9 setTitleColor:v11];
  }
  if (!a5)
  {
    v12 = [v8 timeFontConfiguration];
    [v9 setTimeFontConfiguration:v12];
  }
  v13 = (void *)[v9 copy];

  return v13;
}

+ (PRPosterTitleStyleConfiguration)allocWithZone:(_NSZone *)a3
{
  self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
  {
    return (PRPosterTitleStyleConfiguration *)+[PRPosterTitleStyleConfiguration allocWithZone:a3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___PRPosterTitleStyleConfiguration;
    return (PRPosterTitleStyleConfiguration *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

+ (id)titleColorForTitleContentStyle:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 type];
  id v5 = [v3 colors];
  v6 = [v5 firstObject];

  if ([v3 allowsVariation])
  {
    objc_super v7 = [v3 variationAppliedColors];
    uint64_t v8 = [v7 firstObject];

    v6 = (void *)v8;
  }
  switch(v4)
  {
    case 0:
      int v11 = [v3 isVibrant];
      v12 = [PRPosterColor alloc];
      if (v11) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 1;
      }
      v14 = [v3 localizedName];
      v10 = [(PRPosterColor *)v12 initWithColor:v6 preferredStyle:v13 localizedName:v14];

      break;
    case 1:
    case 2:
      uint64_t v9 = +[PRPosterColor vibrantMaterialColor];
      goto LABEL_11;
    case 3:
      uint64_t v9 = +[PRPosterColor vibrantMonochromeColor];
LABEL_11:
      v10 = (PRPosterColor *)v9;
      break;
    case 4:
      v15 = [v3 lutIdentifier];
      v10 = [[PRPosterColor alloc] initWithLUTIdentifier:v15];

      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

- (PRPosterTitleStyleConfiguration)init
{
  [(id)objc_opt_class() defaultContentsLuminance];
  LOBYTE(v4) = 0;
  return -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", 0, 0, 0, 0, 0, 0, v4, 0);
}

- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 titleContentStyle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(id)objc_opt_class() defaultContentsLuminance];
  LOBYTE(v10) = 0;
  uint64_t v8 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v7, 0, 0, v6, 0, 0, v10, 0);

  return v8;
}

- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 titleContentStyle:(id)a4 timeNumberingSystem:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  +[PRPosterTitleStyleConfiguration defaultContentsLuminance];
  LOBYTE(v13) = 0;
  int v11 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v10, 0, 0, v9, v8, 0, v13, 0);

  return v11;
}

- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 preferredTitleAlignment:(unint64_t)a4 preferredTitleLayout:(unint64_t)a5 titleContentStyle:(id)a6 timeNumberingSystem:(id)a7 userConfigured:(BOOL)a8 contentsLuminance:(double)a9 alternateDateEnabled:(BOOL)a10 groupName:(id)a11
{
  id v19 = a11;
  id v20 = a7;
  id v21 = a6;
  id v22 = a3;
  v23 = [(id)objc_opt_class() titleColorForTitleContentStyle:v21];
  BYTE1(v26) = a10;
  LOBYTE(v26) = a8;
  v24 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v22, a4, a5, v21, v23, v20, a9, v26, v19);

  return v24;
}

- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 preferredTitleAlignment:(unint64_t)a4 preferredTitleLayout:(unint64_t)a5 titleContentStyle:(id)a6 titleColor:(id)a7 timeNumberingSystem:(id)a8 userConfigured:(BOOL)a9 contentsLuminance:(double)a10 alternateDateEnabled:(BOOL)a11 groupName:(id)a12
{
  id v19 = a3;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a12;
  v24 = self;
  int v25 = [(PRPosterTitleStyleConfiguration *)self isMemberOfClass:v24];

  if (v25)
  {
    LOWORD(v29) = __PAIR16__(a11, a9);
    uint64_t v26 = -[PRImmutablePosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:]([PRImmutablePosterTitleStyleConfiguration alloc], "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v19, a4, a5, v20, v21, v22, a10, v29, v23);
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)PRPosterTitleStyleConfiguration;
    uint64_t v26 = [(PRPosterTitleStyleConfiguration *)&v30 init];
    self = &v26->super;
  }
  p_super = &v26->super;

  return p_super;
}

- (PRPosterTitleStyleConfiguration)initWithTitleStyleConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 timeFontConfiguration];
  uint64_t v5 = [v3 preferredTitleAlignment];
  uint64_t v6 = [v3 preferredTitleLayout];
  id v7 = [v3 titleContentStyle];
  id v8 = [v3 titleColor];
  id v9 = [v3 timeNumberingSystem];
  char v10 = [v3 isUserConfigured];
  [v3 contentsLuminance];
  double v12 = v11;
  char v13 = [v3 isAlternateDateEnabled];
  v14 = [v3 groupName];

  BYTE1(v17) = v13;
  LOBYTE(v17) = v10;
  v15 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v4, v5, v6, v7, v8, v9, v12, v17, v14);

  return v15;
}

- (id)effectiveTimeFontWithExtensionBundle:(id)a3
{
  return [(PRPosterTitleStyleConfiguration *)self effectiveTimeFontWithExtensionBundle:a3 forRole:@"PRPosterRoleLockScreen"];
}

- (id)effectiveTimeFontWithExtensionBundle:(id)a3 forRole:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PRPosterTitleStyleConfiguration.m", 127, @"Invalid parameter not satisfying: %@", @"extensionBundle != nil" object file lineNumber description];
  }
  id v9 = [v7 bundleURL];
  char v10 = [(PRPosterTitleStyleConfiguration *)self effectiveTimeFontWithExtensionBundleURL:v9 forRole:v8];

  return v10;
}

- (id)effectiveTimeFontWithExtensionBundleURL:(id)a3
{
  return [(PRPosterTitleStyleConfiguration *)self effectiveTimeFontWithExtensionBundleURL:a3 forRole:@"PRPosterRoleLockScreen"];
}

- (id)effectiveTimeFontWithExtensionBundleURL:(id)a3 forRole:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PRPosterTitleStyleConfiguration.m", 136, @"Invalid parameter not satisfying: %@", @"extensionBundleURL != nil" object file lineNumber description];
  }
  id v9 = [(PRPosterTitleStyleConfiguration *)self timeFontConfiguration];
  char v10 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v12 = v9;
    char v13 = [v12 timeFontIdentifier];
    if (v13)
    {
      v14 = objc_msgSend(MEMORY[0x1E4FB08E0], "pr_fontWithTimeFontIdentifier:forRole:", v13, v8);
      [v12 weight];
      v16 = objc_msgSend(v14, "pr_fontWithVariantWeight:forRole:", (unint64_t)v15, v8);
    }
    else
    {
      v16 = 0;
    }

    if (v16) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v17 = self;
  char v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) == 0
    || ([v9 fontWithExtensionBundleURL:v7], (v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_11:
    v16 = [(id)objc_opt_class() defaultTitleFontForRole:v8];
  }
LABEL_12:

  return v16;
}

- (PRPosterContentStyle)effectiveTitleContentStyle
{
  id v3 = [(PRPosterTitleStyleConfiguration *)self titleContentStyle];
  if (!v3)
  {
    if ([(PRPosterTitleStyleConfiguration *)self isUserConfigured])
    {
      id v3 = 0;
    }
    else
    {
      id v3 = [(id)objc_opt_class() defaultTitleContentStyle];
    }
  }
  return (PRPosterContentStyle *)v3;
}

- (id)_effectiveTitlePrivateContentStyle
{
  v2 = [(PRPosterTitleStyleConfiguration *)self effectiveTitleContentStyle];
  if ([v2 conformsToProtocol:&unk_1EDA0F8A0]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (PRPosterColor)effectiveTitleColor
{
  id v3 = [(PRPosterTitleStyleConfiguration *)self titleColor];
  if (!v3)
  {
    if ([(PRPosterTitleStyleConfiguration *)self isUserConfigured])
    {
      id v3 = 0;
    }
    else
    {
      id v3 = [(id)objc_opt_class() defaultTitleColor];
    }
  }
  return (PRPosterColor *)v3;
}

- (unint64_t)effectiveTitleAlignmentForText:(id)a3 withFont:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PRPosterTitleStyleConfiguration *)self preferredTitleAlignment] != 1
    || (BOOL v8 = +[PRIncomingCallMetricsProvider canApplyKashidaToText:withFont:](PRIncomingCallMetricsProvider, "canApplyKashidaToText:withFont:", v6, v7), v9 = 0, objc_msgSend(v6, "pr_isSuitableForArabicJustification"))&& v8)
  {
    unint64_t v9 = [(PRPosterTitleStyleConfiguration *)self preferredTitleAlignment];
  }

  return v9;
}

- (unint64_t)effectiveTitleLayoutForText:(id)a3
{
  id v4 = a3;
  if (![(PRPosterTitleStyleConfiguration *)self prefersVerticalTitleLayout]
    || (unint64_t v5 = [v4 length],
        v6 = +[PRIncomingCallMetricsProvider maximumVerticalTextLength](PRIncomingCallMetricsProvider, "maximumVerticalTextLength"), unint64_t v7 = 0, objc_msgSend(v4, "pr_isSuitableForVerticalLayout"))&& v5 <= v6)
  {
    unint64_t v7 = [(PRPosterTitleStyleConfiguration *)self preferredTitleLayout];
  }

  return v7;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return (BSUIVibrancyConfiguration *)[(PRPosterTitleStyleConfiguration *)self _vibrancyConfigurationWithExtensionBundleURL:0 luminanceReduced:0];
}

- (id)vibrancyConfigurationWithExtensionBundle:(id)a3
{
  id v4 = [a3 bundleURL];
  unint64_t v5 = [(PRPosterTitleStyleConfiguration *)self vibrancyConfigurationWithExtensionBundleURL:v4];

  return v5;
}

- (id)vibrancyConfigurationWithExtensionBundle:(id)a3 luminanceReduced:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = [a3 bundleURL];
  unint64_t v7 = [(PRPosterTitleStyleConfiguration *)self vibrancyConfigurationWithExtensionBundleURL:v6 luminanceReduced:v4];

  return v7;
}

- (id)vibrancyConfigurationWithExtensionBundleURL:(id)a3
{
  return [(PRPosterTitleStyleConfiguration *)self _vibrancyConfigurationWithExtensionBundleURL:a3 luminanceReduced:0];
}

- (id)vibrancyConfigurationWithExtensionBundleURL:(id)a3 luminanceReduced:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    unint64_t v7 = PRLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[PRPosterTitleStyleConfiguration vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:](v7);
    }
  }
  BOOL v8 = [(PRPosterTitleStyleConfiguration *)self _vibrancyConfigurationWithExtensionBundleURL:v6 luminanceReduced:v4];

  return v8;
}

- (id)_vibrancyConfigurationWithExtensionBundleURL:(id)a3 luminanceReduced:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  vibrancyConfiguration = self->_vibrancyConfiguration;
  BOOL v8 = [(PRPosterTitleStyleConfiguration *)self _effectiveTitlePrivateContentStyle];
  [(PRPosterTitleStyleConfiguration *)self contentsLuminance];
  uint64_t v10 = PRPosterContentsBackgroundTypeForLuminance(v9);
  uint64_t v11 = [v8 vibrancyEffectType];
  if (vibrancyConfiguration)
  {
    if ([(BSUIVibrancyConfiguration *)self->_vibrancyConfiguration effectType] == v11)
    {
      id v12 = [(BSUIVibrancyConfiguration *)self->_vibrancyConfiguration groupName];
      char v13 = [(PRPosterTitleStyleConfiguration *)self groupName];
      LODWORD(vibrancyConfiguration) = BSEqualObjects();
    }
    else
    {
      LODWORD(vibrancyConfiguration) = 0;
    }
  }
  v14 = [MEMORY[0x1E4F4F8E8] vibrancyLUTFromPrivateContentStyle:v8 extensionBundleURL:v6 luminanceReduced:v4];
  if (!vibrancyConfiguration
    || ([(BSUIVibrancyConfiguration *)self->_vibrancyConfiguration alternativeVibrancyEffectLUT], double v15 = objc_claimAutoreleasedReturnValue(), v16 = BSEqualObjects(), v15, (v16 & 1) == 0))
  {
    id v17 = objc_alloc(MEMORY[0x1E4F4F8E8]);
    uint64_t v18 = BSUIVibrancyBackgroundTypeForPRPosterContentsBackgroundType(v10);
    id v19 = [v8 vibrancyEffectColor];
    id v20 = [(PRPosterTitleStyleConfiguration *)self groupName];
    id v21 = (BSUIVibrancyConfiguration *)[v17 initWithEffectType:v11 backgroundType:v18 color:v19 groupName:v20 blendConfiguration:0 blendAmount:v14 alternativeVibrancyEffectLUT:0.0];
    id v22 = self->_vibrancyConfiguration;
    self->_vibrancyConfiguration = v21;
  }
  id v23 = self->_vibrancyConfiguration;

  return v23;
}

- (NSString)effectiveTimeNumberingSystem
{
  v2 = [(PRPosterTitleStyleConfiguration *)self timeNumberingSystem];
  if (!v2)
  {
    v2 = [(id)objc_opt_class() defaultTimeNumberingSystem];
  }
  return (NSString *)v2;
}

- (BOOL)prefersVerticalTitleLayout
{
  uint64_t v2 = [(PRPosterTitleStyleConfiguration *)self preferredTitleLayout];
  return PRPosterTitleLayoutIsVertical(v2);
}

+ (UIFont)defaultTimeFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E4FB08E0], "pr_defaultTimeFont");
}

+ (id)defaultTitleFontForRole:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "pr_defaultTimeFontForRole:", a3);
}

+ (unint64_t)defaultTitleAlignment
{
  return 0;
}

+ (unint64_t)defaultTitleLayout
{
  return 0;
}

+ (PRPosterContentStyle)defaultTitleContentStyle
{
  uint64_t v2 = objc_alloc_init(PRPosterContentVibrantMaterialStyle);
  return (PRPosterContentStyle *)v2;
}

+ (PRPosterColor)defaultTitleColor
{
  return +[PRPosterColor vibrantMaterialColor];
}

+ (double)defaultContentsLuminance
{
  return 0.5;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (PRPosterTitleStyleConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v23) = 1;
  }
  else
  {
    unint64_t v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      unint64_t v7 = v4;
      BOOL v8 = [(PRPosterTitleStyleConfiguration *)self timeFontConfiguration];
      double v9 = [(PRPosterTitleStyleConfiguration *)v7 timeFontConfiguration];
      int v10 = BSEqualObjects();

      if (!v10) {
        goto LABEL_10;
      }
      uint64_t v11 = [(PRPosterTitleStyleConfiguration *)self preferredTitleAlignment];
      if (v11 != [(PRPosterTitleStyleConfiguration *)v7 preferredTitleAlignment]) {
        goto LABEL_10;
      }
      uint64_t v12 = [(PRPosterTitleStyleConfiguration *)self preferredTitleLayout];
      if (v12 != [(PRPosterTitleStyleConfiguration *)v7 preferredTitleLayout]) {
        goto LABEL_10;
      }
      char v13 = [(PRPosterTitleStyleConfiguration *)self titleContentStyle];
      v14 = [(PRPosterTitleStyleConfiguration *)v7 titleContentStyle];
      int v15 = BSEqualObjects();

      if (!v15) {
        goto LABEL_10;
      }
      char v16 = [(PRPosterTitleStyleConfiguration *)self timeNumberingSystem];
      id v17 = [(PRPosterTitleStyleConfiguration *)v7 timeNumberingSystem];
      int v18 = BSEqualObjects();

      if (!v18) {
        goto LABEL_10;
      }
      [(PRPosterTitleStyleConfiguration *)self contentsLuminance];
      unint64_t v20 = vcvtad_u64_f64(v19 * 10000.0);
      [(PRPosterTitleStyleConfiguration *)v7 contentsLuminance];
      if (v20 == vcvtad_u64_f64(v21 * 10000.0)
        && (int v22 = [(PRPosterTitleStyleConfiguration *)self isUserConfigured],
            v22 == [(PRPosterTitleStyleConfiguration *)v7 isUserConfigured]))
      {
        int v25 = [(PRPosterTitleStyleConfiguration *)self isAlternateDateEnabled];
        int v23 = v25 ^ [(PRPosterTitleStyleConfiguration *)v7 isAlternateDateEnabled] ^ 1;
      }
      else
      {
LABEL_10:
        LOBYTE(v23) = 0;
      }
    }
    else
    {
      LOBYTE(v23) = 0;
    }
  }

  return v23;
}

- (BOOL)isVisiblyEqualToTitleStyleConfiguration:(id)a3
{
  BOOL v4 = (PRPosterTitleStyleConfiguration *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    unint64_t v5 = [(PRPosterTitleStyleConfiguration *)self timeFontConfiguration];
    id v6 = [(PRPosterTitleStyleConfiguration *)v4 timeFontConfiguration];
    int v7 = BSEqualObjects();

    if (!v7) {
      goto LABEL_8;
    }
    uint64_t v8 = [(PRPosterTitleStyleConfiguration *)self preferredTitleAlignment];
    if (v8 != [(PRPosterTitleStyleConfiguration *)v4 preferredTitleAlignment]) {
      goto LABEL_8;
    }
    uint64_t v9 = [(PRPosterTitleStyleConfiguration *)self preferredTitleLayout];
    if (v9 != [(PRPosterTitleStyleConfiguration *)v4 preferredTitleLayout]) {
      goto LABEL_8;
    }
    int v10 = [(PRPosterTitleStyleConfiguration *)self titleContentStyle];
    uint64_t v11 = [(PRPosterTitleStyleConfiguration *)v4 titleContentStyle];
    int v12 = BSEqualObjects();

    if (!v12) {
      goto LABEL_8;
    }
    char v13 = [(PRPosterTitleStyleConfiguration *)self timeNumberingSystem];
    v14 = [(PRPosterTitleStyleConfiguration *)v4 timeNumberingSystem];
    int v15 = BSEqualObjects();

    if (v15)
    {
      [(PRPosterTitleStyleConfiguration *)self isAlternateDateEnabled];
      [(PRPosterTitleStyleConfiguration *)v4 isAlternateDateEnabled];
      char v16 = BSEqualBools();
    }
    else
    {
LABEL_8:
      char v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  [(PRPosterTitleStyleConfiguration *)self contentsLuminance];
  unint64_t v4 = vcvtad_u64_f64(v3 * 10000.0);
  unint64_t v5 = [(PRPosterTitleStyleConfiguration *)self timeFontConfiguration];
  uint64_t v6 = [v5 hash];
  int v7 = [(PRPosterTitleStyleConfiguration *)self titleContentStyle];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = [(PRPosterTitleStyleConfiguration *)self timeNumberingSystem];
  uint64_t v10 = [v9 hash];
  uint64_t v11 = [(PRPosterTitleStyleConfiguration *)self isUserConfigured];
  int v12 = objc_msgSend(NSNumber, "numberWithBool:", -[PRPosterTitleStyleConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled"));
  unint64_t v13 = v6 ^ v8 ^ v10 ^ v11 ^ [v12 hash] ^ v4;

  return v13;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __46__PRPosterTitleStyleConfiguration_description__block_invoke;
  uint64_t v10 = &unk_1E54DAA08;
  uint64_t v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  unint64_t v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __46__PRPosterTitleStyleConfiguration_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[PRPosterTitleStyleConfiguration allocWithZone:a3];
  return [(PRPosterTitleStyleConfiguration *)v4 initWithTitleStyleConfiguration:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PRPosterTitleStyleConfiguration *)self timeFontConfiguration];
  [v4 encodeObject:v5 forKey:@"timeFontConfiguration"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PRPosterTitleStyleConfiguration preferredTitleAlignment](self, "preferredTitleAlignment"));
  [v4 encodeObject:v6 forKey:@"preferredTitleAlignment"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PRPosterTitleStyleConfiguration preferredTitleLayout](self, "preferredTitleLayout"));
  [v4 encodeObject:v7 forKey:@"preferredTitleLayout"];

  uint64_t v8 = [(PRPosterTitleStyleConfiguration *)self titleContentStyle];
  id v14 = +[PRPosterContentStyleSerialization dataForContentStyle:v8 error:0];

  [v4 encodeObject:v14 forKey:@"titleContentStyle"];
  uint64_t v9 = [(PRPosterTitleStyleConfiguration *)self titleColor];
  [v4 encodeObject:v9 forKey:@"titleColor"];

  uint64_t v10 = [(PRPosterTitleStyleConfiguration *)self timeNumberingSystem];
  [v4 encodeObject:v10 forKey:@"timeNumberingSystem"];

  uint64_t v11 = NSNumber;
  [(PRPosterTitleStyleConfiguration *)self contentsLuminance];
  id v12 = objc_msgSend(v11, "numberWithDouble:");
  [v4 encodeObject:v12 forKey:@"contentsLuminence"];

  unint64_t v13 = [(PRPosterTitleStyleConfiguration *)self groupName];
  [v4 encodeObject:v13 forKey:@"groupName"];

  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterTitleStyleConfiguration isUserConfigured](self, "isUserConfigured"), @"userConfigured");
  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterTitleStyleConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled"), @"alternateDateEnabled");
}

- (PRPosterTitleStyleConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = self;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"timeFontConfiguration"];

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleContentStyle"];
  v40 = (void *)v10;
  v41 = (void *)v9;
  if (v10)
  {
    id v42 = 0;
    uint64_t v11 = +[PRPosterContentStyleSerialization contentStyleForData:v10 error:&v42];
    id v12 = v42;
    if (!v11)
    {
      unint64_t v13 = PRLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[PRPosterTitleStyleConfiguration initWithCoder:]((uint64_t)v12, v13);
      }

      uint64_t v11 = [(id)objc_opt_class() defaultTitleContentStyle];
    }
  }
  else
  {
    id v14 = self;
    int v15 = [v4 decodeObjectOfClass:v14 forKey:@"titleColor"];

    if (!v15)
    {
      char v16 = self;
      id v17 = [v4 decodeObjectOfClass:v16 forKey:@"titleColor"];

      if (v17) {
        int v15 = [[PRPosterColor alloc] initWithColor:v17];
      }
      else {
        int v15 = 0;
      }
    }
    uint64_t v11 = [(PRPosterColor *)v15 contentStyle];
  }
  int v18 = self;
  double v19 = [v4 decodeObjectOfClass:v18 forKey:@"preferredTitleAlignment"];

  if (v19) {
    uint64_t v38 = [v19 unsignedIntegerValue];
  }
  else {
    uint64_t v38 = 0;
  }
  unint64_t v20 = self;
  double v21 = [v4 decodeObjectOfClass:v20 forKey:@"preferredTitleLayout"];

  v39 = v19;
  if (v21) {
    uint64_t v37 = [v21 unsignedIntegerValue];
  }
  else {
    uint64_t v37 = 0;
  }
  int v22 = self;
  int v23 = [v4 decodeObjectOfClass:v22 forKey:@"timeNumberingSystem"];

  uint64_t v24 = [v4 decodeBoolForKey:@"userConfigured"];
  int v25 = self;
  uint64_t v26 = [v4 decodeObjectOfClass:v25 forKey:@"contentsLuminence"];

  [(id)objc_opt_class() defaultContentsLuminance];
  if (v26)
  {
    v28 = self;
    [v26 doubleValue];
    double v30 = v29;
  }
  else
  {
    double v30 = v27;
    v28 = self;
  }
  char v31 = [v4 decodeBoolForKey:@"alternateDateEnabled"];
  v32 = self;
  v33 = [v4 decodeObjectOfClass:v32 forKey:@"groupName"];

  LOBYTE(v36) = v31;
  v34 = [(PRPosterTitleStyleConfiguration *)v28 initWithTimeFontConfiguration:v41 preferredTitleAlignment:v38 preferredTitleLayout:v37 titleContentStyle:v11 timeNumberingSystem:v23 userConfigured:v24 contentsLuminance:v30 alternateDateEnabled:v36 groupName:v33];

  return v34;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PRPosterTitleStyleConfiguration *)self timeFontConfiguration];
  [v4 encodeObject:v5 forKey:@"timeFontConfiguration"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PRPosterTitleStyleConfiguration preferredTitleAlignment](self, "preferredTitleAlignment"));
  [v4 encodeObject:v6 forKey:@"preferredTitleAlignment"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PRPosterTitleStyleConfiguration preferredTitleLayout](self, "preferredTitleLayout"));
  [v4 encodeObject:v7 forKey:@"preferredTitleLayout"];

  uint64_t v8 = [(PRPosterTitleStyleConfiguration *)self titleContentStyle];
  id v14 = +[PRPosterContentStyleSerialization dataForContentStyle:v8 error:0];

  [v4 encodeObject:v14 forKey:@"titleContentStyle"];
  uint64_t v9 = [(PRPosterTitleStyleConfiguration *)self titleColor];
  [v4 encodeObject:v9 forKey:@"titleColor"];

  uint64_t v10 = [(PRPosterTitleStyleConfiguration *)self timeNumberingSystem];
  [v4 encodeObject:v10 forKey:@"timeNumberingSystem"];

  uint64_t v11 = NSNumber;
  [(PRPosterTitleStyleConfiguration *)self contentsLuminance];
  id v12 = objc_msgSend(v11, "numberWithDouble:");
  [v4 encodeObject:v12 forKey:@"contentsLuminence"];

  unint64_t v13 = [(PRPosterTitleStyleConfiguration *)self groupName];
  [v4 encodeObject:v13 forKey:@"groupName"];

  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterTitleStyleConfiguration isUserConfigured](self, "isUserConfigured"), @"userConfigured");
  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterTitleStyleConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled"), @"alternateDateEnabled");
}

- (PRPosterTitleStyleConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  uint64_t v6 = [v4 decodeObjectOfClass:v5 forKey:@"timeFontConfiguration"];

  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleContentStyle"];
  uint64_t v36 = (void *)v7;
  uint64_t v37 = (void *)v6;
  if (v7)
  {
    id v38 = 0;
    uint64_t v8 = +[PRPosterContentStyleSerialization contentStyleForData:v7 error:&v38];
    id v9 = v38;
    if (v8)
    {
      v34 = (void *)v8;
    }
    else
    {
      id v14 = PRLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[PRPosterTitleStyleConfiguration initWithCoder:]((uint64_t)v9, v14);
      }

      v34 = [(id)objc_opt_class() defaultTitleContentStyle];
    }
  }
  else
  {
    uint64_t v10 = self;
    uint64_t v11 = [v4 decodeObjectOfClass:v10 forKey:@"titleColor"];

    if (!v11)
    {
      id v12 = self;
      unint64_t v13 = [v4 decodeObjectOfClass:v12 forKey:@"titleColor"];

      if (v13) {
        uint64_t v11 = [[PRPosterColor alloc] initWithColor:v13];
      }
      else {
        uint64_t v11 = 0;
      }
    }
    v34 = [(PRPosterColor *)v11 contentStyle];

    id v9 = 0;
  }
  int v15 = self;
  char v16 = [v4 decodeObjectOfClass:v15 forKey:@"preferredTitleAlignment"];

  if (v16) {
    uint64_t v33 = [v16 unsignedIntegerValue];
  }
  else {
    uint64_t v33 = 0;
  }
  id v17 = self;
  int v18 = [v4 decodeObjectOfClass:v17 forKey:@"preferredTitleLayout"];

  v35 = v9;
  if (v18) {
    uint64_t v32 = [v18 unsignedIntegerValue];
  }
  else {
    uint64_t v32 = 0;
  }
  double v19 = self;
  unint64_t v20 = [v4 decodeObjectOfClass:v19 forKey:@"timeNumberingSystem"];

  uint64_t v21 = [v4 decodeBoolForKey:@"userConfigured"];
  int v22 = self;
  int v23 = [v4 decodeObjectOfClass:v22 forKey:@"contentsLuminence"];

  [(id)objc_opt_class() defaultContentsLuminance];
  if (v23) {
    [v23 doubleValue];
  }
  double v25 = v24;
  char v26 = [v4 decodeBoolForKey:@"alternateDateEnabled"];
  double v27 = self;
  v28 = [v4 decodeObjectOfClass:v27 forKey:@"groupName"];

  LOBYTE(v31) = v26;
  double v29 = [(PRPosterTitleStyleConfiguration *)self initWithTimeFontConfiguration:v37 preferredTitleAlignment:v33 preferredTitleLayout:v32 titleContentStyle:v34 timeNumberingSystem:v20 userConfigured:v21 contentsLuminance:v25 alternateDateEnabled:v31 groupName:v28];

  return v29;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v15 = a3;
  id v4 = [(PRPosterTitleStyleConfiguration *)self timeFontConfiguration];
  id v5 = (id)[v15 appendObject:v4 withName:@"timeFontConfiguration"];

  id v6 = (id)objc_msgSend(v15, "appendInteger:withName:", -[PRPosterTitleStyleConfiguration preferredTitleAlignment](self, "preferredTitleAlignment"), @"preferredTitleAlignment");
  id v7 = (id)objc_msgSend(v15, "appendInteger:withName:", -[PRPosterTitleStyleConfiguration preferredTitleLayout](self, "preferredTitleLayout"), @"preferredTitleLayout");
  uint64_t v8 = [(PRPosterTitleStyleConfiguration *)self titleContentStyle];
  id v9 = (id)[v15 appendObject:v8 withName:@"titleContentStyle"];

  uint64_t v10 = [(PRPosterTitleStyleConfiguration *)self timeNumberingSystem];
  id v11 = (id)[v15 appendObject:v10 withName:@"timeNumberingSystem"];

  [(PRPosterTitleStyleConfiguration *)self contentsLuminance];
  id v12 = (id)objc_msgSend(v15, "appendDouble:withName:decimalPrecision:", @"contentsLuminance", 5);
  id v13 = (id)objc_msgSend(v15, "appendBool:withName:", -[PRPosterTitleStyleConfiguration isUserConfigured](self, "isUserConfigured"), @"userConfigured");
  id v14 = (id)objc_msgSend(v15, "appendBool:withName:", -[PRPosterTitleStyleConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled"), @"isAlternateDateEnabled");
}

- (void).cxx_destruct
{
}

- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 titleColor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(id)objc_opt_class() defaultContentsLuminance];
  LOBYTE(v10) = 0;
  uint64_t v8 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v7, 0, 0, v6, 0, 0, v10, 0);

  return v8;
}

- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 titleColor:(id)a4 timeNumberingSystem:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  +[PRPosterTitleStyleConfiguration defaultContentsLuminance];
  LOBYTE(v13) = 0;
  id v11 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v10, 0, 0, v9, v8, 0, v13, 0);

  return v11;
}

- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 preferredTitleAlignment:(unint64_t)a4 preferredTitleLayout:(unint64_t)a5 titleColor:(id)a6 timeNumberingSystem:(id)a7 userConfigured:(BOOL)a8 contentsLuminance:(double)a9 alternateDateEnabled:(BOOL)a10 groupName:(id)a11
{
  id v19 = a11;
  id v20 = a7;
  id v21 = a6;
  id v22 = a3;
  int v23 = [v21 contentStyle];
  BYTE1(v26) = a10;
  LOBYTE(v26) = a8;
  double v24 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v22, a4, a5, v23, v21, v20, a9, v26, v19);

  return v24;
}

- (void)vibrancyConfigurationWithExtensionBundleURL:(os_log_t)log luminanceReduced:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18C1C4000, log, OS_LOG_TYPE_FAULT, "Fault: Attempting to fetch vibrancy configuration for nil URL", v1, 2u);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18C1C4000, a2, OS_LOG_TYPE_ERROR, "Content style deserialization failed with error: %{public}@, falling back to defaultTitleContentStyle", (uint8_t *)&v2, 0xCu);
}

@end