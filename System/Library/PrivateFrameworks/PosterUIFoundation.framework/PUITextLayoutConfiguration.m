@interface PUITextLayoutConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (PUIStyle)defaultStyle;
+ (double)defaultContentsLuminance;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)defaultFontForRole:(id)a3;
+ (id)defaultStyleColor;
+ (id)styleColorForStyle:(id)a3;
+ (unint64_t)defaultAlignment;
+ (unint64_t)defaultLayout;
+ (unint64_t)maximumVerticalTextCharacters;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVisiblyEqualToTextLayoutConfiguration:(id)a3;
- (BOOL)prefersVerticalTextLayout;
- (BOOL)prefersVerticalTitleLayout;
- (BSUIVibrancyConfiguration)vibrancyConfiguration;
- (Class)classForCoder;
- (NSString)description;
- (NSString)effectiveNumberingSystemType;
- (PUIStyle)effectiveStyle;
- (PUITextLayoutConfiguration)init;
- (PUITextLayoutConfiguration)initWithBSXPCCoder:(id)a3;
- (PUITextLayoutConfiguration)initWithCoder:(id)a3;
- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 preferredAlignment:(unint64_t)a4 preferredLayout:(unint64_t)a5 style:(id)a6 numberingSystemType:(id)a7 userConfigured:(BOOL)a8 contentsLuminance:(double)a9 alternateDateEnabled:(BOOL)a10 groupName:(id)a11;
- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 preferredAlignment:(unint64_t)a4 preferredLayout:(unint64_t)a5 style:(id)a6 styleColor:(id)a7 numberingSystemType:(id)a8 userConfigured:(BOOL)a9 contentsLuminance:(double)a10 alternateDateEnabled:(BOOL)a11 groupName:(id)a12;
- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 preferredAlignment:(unint64_t)a4 preferredLayout:(unint64_t)a5 styleColor:(id)a6 numberingSystemType:(id)a7 userConfigured:(BOOL)a8 contentsLuminance:(double)a9 alternateDateEnabled:(BOOL)a10 groupName:(id)a11;
- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 style:(id)a4;
- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 style:(id)a4 numberingSystemType:(id)a5;
- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 styleColor:(id)a4;
- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 styleColor:(id)a4 numberingSystemType:(id)a5;
- (PUITextLayoutConfiguration)initWithTextLayoutConfiguration:(id)a3;
- (id)_effectivePrivateStyle;
- (id)_vibrancyConfigurationWithExtensionBundleURL:(id)a3 luminanceReduced:(BOOL)a4;
- (id)effectiveFontWithExtensionBundle:(id)a3;
- (id)effectiveFontWithExtensionBundle:(id)a3 forRole:(id)a4;
- (id)effectiveFontWithExtensionBundleURL:(id)a3;
- (id)effectiveFontWithExtensionBundleURL:(id)a3 forRole:(id)a4;
- (id)effectiveStyleColor;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)vibrancyConfigurationWithExtensionBundle:(id)a3;
- (id)vibrancyConfigurationWithExtensionBundle:(id)a3 luminanceReduced:(BOOL)a4;
- (id)vibrancyConfigurationWithExtensionBundleURL:(id)a3;
- (id)vibrancyConfigurationWithExtensionBundleURL:(id)a3 luminanceReduced:(BOOL)a4;
- (unint64_t)effectiveAlignmentForText:(id)a3 withFont:(id)a4;
- (unint64_t)effectiveLayoutForText:(id)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUITextLayoutConfiguration

+ (id)allocWithZone:(_NSZone *)a3
{
  self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
  {
    return +[PUITextLayoutConfiguration allocWithZone:a3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___PUITextLayoutConfiguration;
    return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

+ (id)styleColorForStyle:(id)a3
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
      v12 = [PUIStyleColor alloc];
      if (v11) {
        uint64_t v13 = 2;
      }
      else {
        uint64_t v13 = 1;
      }
      v14 = [v3 localizedName];
      v10 = [(PUIStyleColor *)v12 initWithColor:v6 preferredStyle:v13 localizedName:v14];

      break;
    case 1:
    case 2:
      uint64_t v9 = +[PUIStyleColor vibrantMaterialColor];
      goto LABEL_11;
    case 3:
      uint64_t v9 = +[PUIStyleColor vibrantMonochromeColor];
LABEL_11:
      v10 = (PUIStyleColor *)v9;
      break;
    case 4:
      v15 = [v3 LUTIdentifier];
      v10 = [[PUIStyleColor alloc] initWithLUTIdentifier:v15];

      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

- (PUITextLayoutConfiguration)init
{
  [(id)objc_opt_class() defaultContentsLuminance];
  LOBYTE(v4) = 0;
  return -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:style:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithFontConfiguration:preferredAlignment:preferredLayout:style:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", 0, 0, 0, 0, 0, 0, v4, 0);
}

- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 style:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(id)objc_opt_class() defaultContentsLuminance];
  LOBYTE(v10) = 0;
  uint64_t v8 = -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:style:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithFontConfiguration:preferredAlignment:preferredLayout:style:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v7, 0, 0, v6, 0, 0, v10, 0);

  return v8;
}

- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 style:(id)a4 numberingSystemType:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  +[PUITextLayoutConfiguration defaultContentsLuminance];
  LOBYTE(v13) = 0;
  int v11 = -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:style:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithFontConfiguration:preferredAlignment:preferredLayout:style:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v10, 0, 0, v9, v8, 0, v13, 0);

  return v11;
}

- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 preferredAlignment:(unint64_t)a4 preferredLayout:(unint64_t)a5 style:(id)a6 numberingSystemType:(id)a7 userConfigured:(BOOL)a8 contentsLuminance:(double)a9 alternateDateEnabled:(BOOL)a10 groupName:(id)a11
{
  id v19 = a11;
  id v20 = a7;
  id v21 = a6;
  id v22 = a3;
  v23 = [(id)objc_opt_class() styleColorForStyle:v21];
  BYTE1(v26) = a10;
  LOBYTE(v26) = a8;
  v24 = -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:style:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithFontConfiguration:preferredAlignment:preferredLayout:style:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v22, a4, a5, v21, v23, v20, a9, v26, v19);

  return v24;
}

- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 preferredAlignment:(unint64_t)a4 preferredLayout:(unint64_t)a5 style:(id)a6 styleColor:(id)a7 numberingSystemType:(id)a8 userConfigured:(BOOL)a9 contentsLuminance:(double)a10 alternateDateEnabled:(BOOL)a11 groupName:(id)a12
{
  id v19 = a3;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a12;
  v24 = self;
  int v25 = [(PUITextLayoutConfiguration *)self isMemberOfClass:v24];

  if (v25)
  {
    LOWORD(v29) = __PAIR16__(a11, a9);
    uint64_t v26 = -[PUIImmutableTextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:style:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:]([PUIImmutableTextLayoutConfiguration alloc], "initWithFontConfiguration:preferredAlignment:preferredLayout:style:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v19, a4, a5, v20, v21, v22, a10, v29, v23);
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)PUITextLayoutConfiguration;
    uint64_t v26 = [(PUITextLayoutConfiguration *)&v30 init];
    self = &v26->super;
  }
  p_super = &v26->super;

  return p_super;
}

- (PUITextLayoutConfiguration)initWithTextLayoutConfiguration:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 fontConfiguration];
  uint64_t v5 = [v3 preferredAlignment];
  uint64_t v6 = [v3 preferredLayout];
  id v7 = [v3 style];
  id v8 = [v3 styleColor];
  id v9 = [v3 numberingSystemType];
  char v10 = [v3 isUserConfigured];
  [v3 contentsLuminance];
  double v12 = v11;
  char v13 = [v3 isAlternateDateEnabled];
  v14 = [v3 groupName];

  BYTE1(v17) = v13;
  LOBYTE(v17) = v10;
  v15 = -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:style:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithFontConfiguration:preferredAlignment:preferredLayout:style:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v4, v5, v6, v7, v8, v9, v12, v17, v14);

  return v15;
}

- (id)effectiveFontWithExtensionBundle:(id)a3
{
  return [(PUITextLayoutConfiguration *)self effectiveFontWithExtensionBundle:a3 forRole:*MEMORY[0x263F5F460]];
}

- (id)effectiveFontWithExtensionBundle:(id)a3 forRole:(id)a4
{
  id v6 = a4;
  id v7 = [a3 bundleURL];
  id v8 = [(PUITextLayoutConfiguration *)self effectiveFontWithExtensionBundleURL:v7 forRole:v6];

  return v8;
}

- (id)effectiveFontWithExtensionBundleURL:(id)a3
{
  return [(PUITextLayoutConfiguration *)self effectiveFontWithExtensionBundleURL:a3 forRole:*MEMORY[0x263F5F460]];
}

- (id)effectiveFontWithExtensionBundleURL:(id)a3 forRole:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUITextLayoutConfiguration *)self fontConfiguration];
  id v9 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v11 = v8;
    double v12 = [v11 fontIdentifier];
    if (v12)
    {
      char v13 = objc_msgSend(MEMORY[0x263F1C658], "pui_UIFontWithPUIFontIdentifier:forRole:", v12, v7);
      [v11 weight];
      v15 = objc_msgSend(v13, "pui_UIFontWithVariantWeight:forRole:", (unint64_t)v14, v7);
    }
    else
    {
      v15 = 0;
    }

    if (v15) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v16 = self;
  char v17 = objc_opt_isKindOfClass();

  if ((v17 & 1) == 0
    || ([v8 fontWithExtensionBundleURL:v6], (v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_9:
    v15 = [(id)objc_opt_class() defaultFontForRole:v7];
  }
LABEL_10:

  return v15;
}

- (PUIStyle)effectiveStyle
{
  id v3 = [(PUITextLayoutConfiguration *)self style];
  if (!v3)
  {
    if ([(PUITextLayoutConfiguration *)self isUserConfigured])
    {
      id v3 = 0;
    }
    else
    {
      id v3 = [(id)objc_opt_class() defaultStyle];
    }
  }
  return (PUIStyle *)v3;
}

- (id)_effectivePrivateStyle
{
  v2 = [(PUITextLayoutConfiguration *)self effectiveStyle];
  if ([v2 conformsToProtocol:&unk_27082AAF0]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)effectiveStyleColor
{
  id v3 = [(PUITextLayoutConfiguration *)self styleColor];
  if (!v3)
  {
    if ([(PUITextLayoutConfiguration *)self isUserConfigured])
    {
      id v3 = 0;
    }
    else
    {
      id v3 = [(id)objc_opt_class() defaultStyleColor];
    }
  }
  return v3;
}

- (unint64_t)effectiveAlignmentForText:(id)a3 withFont:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PUITextLayoutConfiguration *)self preferredAlignment] != 1
    || (int v8 = [getPRIncomingCallMetricsProviderClass() canApplyKashidaToText:v6 withFont:v7],
        unint64_t v9 = 0,
        objc_msgSend(v6, "pui_isSuitableForArabicJustification"))
    && v8)
  {
    unint64_t v9 = [(PUITextLayoutConfiguration *)self preferredAlignment];
  }

  return v9;
}

- (unint64_t)effectiveLayoutForText:(id)a3
{
  id v4 = a3;
  if (![(PUITextLayoutConfiguration *)self prefersVerticalTitleLayout]
    || (unint64_t v5 = [v4 length],
        unint64_t v6 = [getPRIncomingCallMetricsProviderClass() maximumVerticalTextLength],
        unint64_t v7 = 0,
        objc_msgSend(v4, "pui_isSuitableForVerticalLayout"))
    && v5 <= v6)
  {
    unint64_t v7 = [(PUITextLayoutConfiguration *)self preferredLayout];
  }

  return v7;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return (BSUIVibrancyConfiguration *)[(PUITextLayoutConfiguration *)self _vibrancyConfigurationWithExtensionBundleURL:0 luminanceReduced:0];
}

- (id)vibrancyConfigurationWithExtensionBundle:(id)a3
{
  id v4 = [a3 bundleURL];
  unint64_t v5 = [(PUITextLayoutConfiguration *)self vibrancyConfigurationWithExtensionBundleURL:v4];

  return v5;
}

- (id)vibrancyConfigurationWithExtensionBundle:(id)a3 luminanceReduced:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v6 = [a3 bundleURL];
  unint64_t v7 = [(PUITextLayoutConfiguration *)self vibrancyConfigurationWithExtensionBundleURL:v6 luminanceReduced:v4];

  return v7;
}

- (id)vibrancyConfigurationWithExtensionBundleURL:(id)a3
{
  return [(PUITextLayoutConfiguration *)self _vibrancyConfigurationWithExtensionBundleURL:a3 luminanceReduced:0];
}

- (id)vibrancyConfigurationWithExtensionBundleURL:(id)a3 luminanceReduced:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    unint64_t v7 = PUILogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[PUITextLayoutConfiguration vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:](v7);
    }
  }
  int v8 = [(PUITextLayoutConfiguration *)self _vibrancyConfigurationWithExtensionBundleURL:v6 luminanceReduced:v4];

  return v8;
}

- (id)_vibrancyConfigurationWithExtensionBundleURL:(id)a3 luminanceReduced:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  vibrancyConfiguration = self->_vibrancyConfiguration;
  int v8 = [(PUITextLayoutConfiguration *)self _effectivePrivateStyle];
  [(PUITextLayoutConfiguration *)self contentsLuminance];
  uint64_t v10 = PUIStyleBackgroundTypeForLuminance(v9);
  uint64_t v11 = [v8 vibrancyEffectType];
  if (vibrancyConfiguration)
  {
    if ([(BSUIVibrancyConfiguration *)self->_vibrancyConfiguration effectType] == v11)
    {
      double v12 = [(BSUIVibrancyConfiguration *)self->_vibrancyConfiguration groupName];
      char v13 = [(PUITextLayoutConfiguration *)self groupName];
      LODWORD(vibrancyConfiguration) = BSEqualObjects();
    }
    else
    {
      LODWORD(vibrancyConfiguration) = 0;
    }
  }
  double v14 = objc_msgSend(MEMORY[0x263F29D60], "pui_vibrancyLUTFromPrivateStyle:extensionBundleURL:luminanceReduced:", v8, v6, v4);
  if (!vibrancyConfiguration
    || ([(BSUIVibrancyConfiguration *)self->_vibrancyConfiguration alternativeVibrancyEffectLUT], v15 = objc_claimAutoreleasedReturnValue(), char v16 = BSEqualObjects(), v15, (v16 & 1) == 0))
  {
    id v17 = objc_alloc(MEMORY[0x263F29D60]);
    uint64_t v18 = BSUIVibrancyBackgroundTypeForPUIStyleBackgroundType(v10);
    id v19 = [v8 vibrancyEffectColor];
    id v20 = [(PUITextLayoutConfiguration *)self groupName];
    id v21 = (BSUIVibrancyConfiguration *)[v17 initWithEffectType:v11 backgroundType:v18 color:v19 groupName:v20 blendConfiguration:0 blendAmount:v14 alternativeVibrancyEffectLUT:0.0];
    id v22 = self->_vibrancyConfiguration;
    self->_vibrancyConfiguration = v21;
  }
  id v23 = self->_vibrancyConfiguration;

  return v23;
}

- (NSString)effectiveNumberingSystemType
{
  v2 = [(PUITextLayoutConfiguration *)self numberingSystemType];
  if (!v2)
  {
    v2 = [(id)objc_opt_class() defaultNumberingSystemType];
  }
  return (NSString *)v2;
}

- (BOOL)prefersVerticalTitleLayout
{
  uint64_t v2 = [(PUITextLayoutConfiguration *)self preferredLayout];
  return PUITextLayoutIsVertical(v2);
}

+ (id)defaultFontForRole:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F1C658], "pui_defaultFontForRole:", a3);
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F1C658], "pui_defaultFont");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v6 = v5;

  return v6;
}

+ (unint64_t)defaultAlignment
{
  return 0;
}

+ (unint64_t)defaultLayout
{
  return 0;
}

+ (PUIStyle)defaultStyle
{
  uint64_t v2 = objc_alloc_init(PUIStyleVibrantMaterial);
  return (PUIStyle *)v2;
}

+ (id)defaultStyleColor
{
  return +[PUIStyleColor vibrantMaterialColor];
}

+ (double)defaultContentsLuminance
{
  return 0.5;
}

+ (unint64_t)maximumVerticalTextCharacters
{
  if (maximumVerticalTextCharacters_onceToken != -1) {
    dispatch_once(&maximumVerticalTextCharacters_onceToken, &__block_literal_global_13);
  }
  return maximumVerticalTextCharacters_maximumVerticalTextCharacters;
}

uint64_t __59__PUITextLayoutConfiguration_maximumVerticalTextCharacters__block_invoke()
{
  uint64_t result = [getPRIncomingCallMetricsProviderClass() maxVerticalTextLength];
  maximumVerticalTextCharacters_maximumVerticalTextCharacters = result;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (PUITextLayoutConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v23) = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      unint64_t v7 = v4;
      int v8 = [(PUITextLayoutConfiguration *)self fontConfiguration];
      double v9 = [(PUITextLayoutConfiguration *)v7 fontConfiguration];
      int v10 = BSEqualObjects();

      if (!v10) {
        goto LABEL_10;
      }
      uint64_t v11 = [(PUITextLayoutConfiguration *)self preferredAlignment];
      if (v11 != [(PUITextLayoutConfiguration *)v7 preferredAlignment]) {
        goto LABEL_10;
      }
      uint64_t v12 = [(PUITextLayoutConfiguration *)self preferredLayout];
      if (v12 != [(PUITextLayoutConfiguration *)v7 preferredLayout]) {
        goto LABEL_10;
      }
      char v13 = [(PUITextLayoutConfiguration *)self style];
      double v14 = [(PUITextLayoutConfiguration *)v7 style];
      int v15 = BSEqualObjects();

      if (!v15) {
        goto LABEL_10;
      }
      char v16 = [(PUITextLayoutConfiguration *)self numberingSystemType];
      id v17 = [(PUITextLayoutConfiguration *)v7 numberingSystemType];
      int v18 = BSEqualObjects();

      if (!v18) {
        goto LABEL_10;
      }
      [(PUITextLayoutConfiguration *)self contentsLuminance];
      unint64_t v20 = vcvtad_u64_f64(v19 * 10000.0);
      [(PUITextLayoutConfiguration *)v7 contentsLuminance];
      if (v20 == vcvtad_u64_f64(v21 * 10000.0)
        && (int v22 = [(PUITextLayoutConfiguration *)self isUserConfigured],
            v22 == [(PUITextLayoutConfiguration *)v7 isUserConfigured]))
      {
        int v25 = [(PUITextLayoutConfiguration *)self isAlternateDateEnabled];
        int v23 = v25 ^ [(PUITextLayoutConfiguration *)v7 isAlternateDateEnabled] ^ 1;
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

- (BOOL)isVisiblyEqualToTextLayoutConfiguration:(id)a3
{
  BOOL v4 = (PUITextLayoutConfiguration *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    id v5 = [(PUITextLayoutConfiguration *)self fontConfiguration];
    id v6 = [(PUITextLayoutConfiguration *)v4 fontConfiguration];
    int v7 = BSEqualObjects();

    if (!v7) {
      goto LABEL_8;
    }
    uint64_t v8 = [(PUITextLayoutConfiguration *)self preferredAlignment];
    if (v8 != [(PUITextLayoutConfiguration *)v4 preferredAlignment]) {
      goto LABEL_8;
    }
    uint64_t v9 = [(PUITextLayoutConfiguration *)self preferredLayout];
    if (v9 != [(PUITextLayoutConfiguration *)v4 preferredLayout]) {
      goto LABEL_8;
    }
    int v10 = [(PUITextLayoutConfiguration *)self style];
    uint64_t v11 = [(PUITextLayoutConfiguration *)v4 style];
    int v12 = BSEqualObjects();

    if (!v12) {
      goto LABEL_8;
    }
    char v13 = [(PUITextLayoutConfiguration *)self numberingSystemType];
    double v14 = [(PUITextLayoutConfiguration *)v4 numberingSystemType];
    int v15 = BSEqualObjects();

    if (v15)
    {
      [(PUITextLayoutConfiguration *)self isAlternateDateEnabled];
      [(PUITextLayoutConfiguration *)v4 isAlternateDateEnabled];
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
  [(PUITextLayoutConfiguration *)self contentsLuminance];
  unint64_t v4 = vcvtad_u64_f64(v3 * 10000.0);
  id v5 = [(PUITextLayoutConfiguration *)self fontConfiguration];
  uint64_t v6 = [v5 hash];
  int v7 = [(PUITextLayoutConfiguration *)self style];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = [(PUITextLayoutConfiguration *)self numberingSystemType];
  uint64_t v10 = [v9 hash];
  uint64_t v11 = [(PUITextLayoutConfiguration *)self isUserConfigured];
  int v12 = objc_msgSend(NSNumber, "numberWithBool:", -[PUITextLayoutConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled"));
  unint64_t v13 = v6 ^ v8 ^ v10 ^ v11 ^ [v12 hash] ^ v4;

  return v13;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C48]);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __41__PUITextLayoutConfiguration_description__block_invoke;
  uint64_t v10 = &unk_265471108;
  uint64_t v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __41__PUITextLayoutConfiguration_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[PUITextLayoutConfiguration allocWithZone:a3];
  return [(PUITextLayoutConfiguration *)v4 initWithTextLayoutConfiguration:self];
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
  id v13 = a3;
  id v4 = [(PUITextLayoutConfiguration *)self fontConfiguration];
  [v13 encodeObject:v4 forKey:@"fontConfiguration"];

  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PUITextLayoutConfiguration preferredAlignment](self, "preferredAlignment"));
  [v13 encodeObject:v5 forKey:@"preferredAlignment"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PUITextLayoutConfiguration preferredLayout](self, "preferredLayout"));
  [v13 encodeObject:v6 forKey:@"preferredLayout"];

  uint64_t v7 = [(PUITextLayoutConfiguration *)self style];
  objc_msgSend(v13, "pui_encodeStyle:forKey:error:", v7, @"style", 0);

  uint64_t v8 = [(PUITextLayoutConfiguration *)self styleColor];
  [v13 encodeObject:v8 forKey:@"styleColor"];

  uint64_t v9 = [(PUITextLayoutConfiguration *)self numberingSystemType];
  [v13 encodeObject:v9 forKey:@"numberingSystemType"];

  uint64_t v10 = NSNumber;
  [(PUITextLayoutConfiguration *)self contentsLuminance];
  uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
  [v13 encodeObject:v11 forKey:@"contentsLuminence"];

  id v12 = [(PUITextLayoutConfiguration *)self groupName];
  [v13 encodeObject:v12 forKey:@"groupName"];

  objc_msgSend(v13, "encodeBool:forKey:", -[PUITextLayoutConfiguration isUserConfigured](self, "isUserConfigured"), @"userConfigured");
  objc_msgSend(v13, "encodeBool:forKey:", -[PUITextLayoutConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled"), @"alternateDateEnabled");
}

- (PUITextLayoutConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = self;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"fontConfiguration"];

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"style"];
  v40 = (void *)v10;
  v41 = (void *)v9;
  if (v10)
  {
    id v42 = 0;
    uint64_t v11 = +[PUIStyleSerialization styleForData:v10 error:&v42];
    id v12 = v42;
    if (!v11)
    {
      id v13 = PUILogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[PUITextLayoutConfiguration initWithCoder:]((uint64_t)v12, v13);
      }

      uint64_t v11 = [(id)objc_opt_class() defaultStyle];
    }
  }
  else
  {
    double v14 = self;
    int v15 = [v4 decodeObjectOfClass:v14 forKey:@"styleColor"];

    if (!v15)
    {
      char v16 = self;
      id v17 = [v4 decodeObjectOfClass:v16 forKey:@"styleColor"];

      if (v17) {
        int v15 = [[PUIStyleColor alloc] initWithColor:v17];
      }
      else {
        int v15 = 0;
      }
    }
    uint64_t v11 = [(PUIStyleColor *)v15 contentStyle];
  }
  int v18 = self;
  double v19 = [v4 decodeObjectOfClass:v18 forKey:@"textAlignment"];

  if (v19) {
    uint64_t v38 = [v19 unsignedIntegerValue];
  }
  else {
    uint64_t v38 = 0;
  }
  unint64_t v20 = self;
  double v21 = [v4 decodeObjectOfClass:v20 forKey:@"preferredLayout"];

  v39 = v19;
  if (v21) {
    uint64_t v37 = [v21 unsignedIntegerValue];
  }
  else {
    uint64_t v37 = 0;
  }
  int v22 = self;
  int v23 = [v4 decodeObjectOfClass:v22 forKey:@"numberingSystemType"];

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
  v34 = [(PUITextLayoutConfiguration *)v28 initWithFontConfiguration:v41 preferredAlignment:v38 preferredLayout:v37 style:v11 numberingSystemType:v23 userConfigured:v24 contentsLuminance:v30 alternateDateEnabled:v36 groupName:v33];

  return v34;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PUITextLayoutConfiguration *)self fontConfiguration];
  [v4 encodeObject:v5 forKey:@"fontConfiguration"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PUITextLayoutConfiguration preferredAlignment](self, "preferredAlignment"));
  [v4 encodeObject:v6 forKey:@"preferredAlignment"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PUITextLayoutConfiguration preferredLayout](self, "preferredLayout"));
  [v4 encodeObject:v7 forKey:@"preferredLayout"];

  uint64_t v8 = [(PUITextLayoutConfiguration *)self style];
  id v14 = +[PUIStyleSerialization dataForStyle:v8 error:0];

  [v4 encodeObject:v14 forKey:@"style"];
  uint64_t v9 = [(PUITextLayoutConfiguration *)self styleColor];
  [v4 encodeObject:v9 forKey:@"styleColor"];

  uint64_t v10 = [(PUITextLayoutConfiguration *)self numberingSystemType];
  [v4 encodeObject:v10 forKey:@"numberingSystemType"];

  uint64_t v11 = NSNumber;
  [(PUITextLayoutConfiguration *)self contentsLuminance];
  id v12 = objc_msgSend(v11, "numberWithDouble:");
  [v4 encodeObject:v12 forKey:@"contentsLuminence"];

  id v13 = [(PUITextLayoutConfiguration *)self groupName];
  [v4 encodeObject:v13 forKey:@"groupName"];

  objc_msgSend(v4, "encodeBool:forKey:", -[PUITextLayoutConfiguration isUserConfigured](self, "isUserConfigured"), @"userConfigured");
  objc_msgSend(v4, "encodeBool:forKey:", -[PUITextLayoutConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled"), @"alternateDateEnabled");
}

- (PUITextLayoutConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = [v4 decodeObjectOfClass:v5 forKey:@"fontConfiguration"];

  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"style"];
  uint64_t v36 = (void *)v7;
  uint64_t v37 = (void *)v6;
  if (v7)
  {
    id v38 = 0;
    uint64_t v8 = +[PUIStyleSerialization styleForData:v7 error:&v38];
    id v9 = v38;
    if (v8)
    {
      v34 = (void *)v8;
    }
    else
    {
      id v14 = PUILogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[PUITextLayoutConfiguration initWithCoder:]((uint64_t)v9, v14);
      }

      v34 = [(id)objc_opt_class() defaultStyle];
    }
  }
  else
  {
    uint64_t v10 = self;
    uint64_t v11 = [v4 decodeObjectOfClass:v10 forKey:@"styleColor"];

    if (!v11)
    {
      id v12 = self;
      id v13 = [v4 decodeObjectOfClass:v12 forKey:@"styleColor"];

      if (v13) {
        uint64_t v11 = [[PUIStyleColor alloc] initWithColor:v13];
      }
      else {
        uint64_t v11 = 0;
      }
    }
    v34 = [(PUIStyleColor *)v11 contentStyle];

    id v9 = 0;
  }
  int v15 = self;
  char v16 = [v4 decodeObjectOfClass:v15 forKey:@"preferredAlignment"];

  if (v16) {
    uint64_t v33 = [v16 unsignedIntegerValue];
  }
  else {
    uint64_t v33 = 0;
  }
  id v17 = self;
  int v18 = [v4 decodeObjectOfClass:v17 forKey:@"preferredLayout"];

  v35 = v9;
  if (v18) {
    uint64_t v32 = [v18 unsignedIntegerValue];
  }
  else {
    uint64_t v32 = 0;
  }
  double v19 = self;
  unint64_t v20 = [v4 decodeObjectOfClass:v19 forKey:@"numberingSystemType"];

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
  double v29 = [(PUITextLayoutConfiguration *)self initWithFontConfiguration:v37 preferredAlignment:v33 preferredLayout:v32 style:v34 numberingSystemType:v20 userConfigured:v21 contentsLuminance:v25 alternateDateEnabled:v31 groupName:v28];

  return v29;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v15 = a3;
  id v4 = [(PUITextLayoutConfiguration *)self fontConfiguration];
  id v5 = (id)[v15 appendObject:v4 withName:@"fontConfiguration"];

  id v6 = (id)objc_msgSend(v15, "appendInteger:withName:", -[PUITextLayoutConfiguration preferredAlignment](self, "preferredAlignment"), @"preferredAlignment");
  id v7 = (id)objc_msgSend(v15, "appendInteger:withName:", -[PUITextLayoutConfiguration preferredLayout](self, "preferredLayout"), @"preferredLayout");
  uint64_t v8 = [(PUITextLayoutConfiguration *)self style];
  id v9 = (id)[v15 appendObject:v8 withName:@"style"];

  uint64_t v10 = [(PUITextLayoutConfiguration *)self numberingSystemType];
  id v11 = (id)[v15 appendObject:v10 withName:@"numberingSystemType"];

  [(PUITextLayoutConfiguration *)self contentsLuminance];
  id v12 = (id)objc_msgSend(v15, "appendDouble:withName:decimalPrecision:", @"contentsLuminance", 5);
  id v13 = (id)objc_msgSend(v15, "appendBool:withName:", -[PUITextLayoutConfiguration isUserConfigured](self, "isUserConfigured"), @"userConfigured");
  id v14 = (id)objc_msgSend(v15, "appendBool:withName:", -[PUITextLayoutConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled"), @"isAlternateDateEnabled");
}

- (BOOL)prefersVerticalTextLayout
{
  return self->_prefersVerticalTextLayout;
}

- (void).cxx_destruct
{
}

- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 styleColor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(id)objc_opt_class() defaultContentsLuminance];
  LOBYTE(v10) = 0;
  uint64_t v8 = -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithFontConfiguration:preferredAlignment:preferredLayout:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v7, 0, 0, v6, 0, 0, v10, 0);

  return v8;
}

- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 styleColor:(id)a4 numberingSystemType:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  +[PUITextLayoutConfiguration defaultContentsLuminance];
  LOBYTE(v13) = 0;
  id v11 = -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithFontConfiguration:preferredAlignment:preferredLayout:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v10, 0, 0, v9, v8, 0, v13, 0);

  return v11;
}

- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 preferredAlignment:(unint64_t)a4 preferredLayout:(unint64_t)a5 styleColor:(id)a6 numberingSystemType:(id)a7 userConfigured:(BOOL)a8 contentsLuminance:(double)a9 alternateDateEnabled:(BOOL)a10 groupName:(id)a11
{
  id v19 = a11;
  id v20 = a7;
  id v21 = a6;
  id v22 = a3;
  int v23 = [v21 contentStyle];
  BYTE1(v26) = a10;
  LOBYTE(v26) = a8;
  double v24 = -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:style:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithFontConfiguration:preferredAlignment:preferredLayout:style:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v22, a4, a5, v23, v21, v20, a9, v26, v19);

  return v24;
}

- (void)vibrancyConfigurationWithExtensionBundleURL:(os_log_t)log luminanceReduced:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_25A0AF000, log, OS_LOG_TYPE_FAULT, "Fault: Attempting to fetch vibrancy configuration for nil URL", v1, 2u);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25A0AF000, a2, OS_LOG_TYPE_ERROR, "Content style deserialization failed with error: %{public}@, falling back to defaultStyle", (uint8_t *)&v2, 0xCu);
}

@end