@interface SBHIconImageStyleConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (SBHIconImageStyleConfiguration)allocWithZone:(_NSZone *)a3;
+ (SBHIconImageStyleConfiguration)automaticStyleConfiguration;
+ (SBHIconImageStyleConfiguration)automaticWithLightIconsStyleConfiguration;
+ (SBHIconImageStyleConfiguration)darkStyleConfiguration;
+ (SBHIconImageStyleConfiguration)lightStyleConfiguration;
+ (SBHIconImageStyleConfiguration)styleConfigurationWithHomeScreenConfiguration:(id)a3;
+ (SBHIconImageStyleConfiguration)styleConfigurationWithIconImageAppearance:(id)a3;
+ (id)sharedInstanceForStyleConfigurationType:(int64_t)a3;
+ (id)tintedStyleConfigurationWithTintColor:(id)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (NSString)description;
- (PUIStylePickerHomeScreenConfiguration)homeScreenConfiguration;
- (SBHIconImageStyleConfiguration)init;
- (SBHIconImageStyleConfiguration)initWithBSXPCCoder:(id)a3;
- (SBHIconImageStyleConfiguration)initWithCoder:(id)a3;
- (SBHIconImageStyleConfiguration)initWithConfigurationType:(int64_t)a3;
- (SBHIconImageStyleConfiguration)initWithConfigurationType:(int64_t)a3 tintColor:(id)a4;
- (SBSHomeScreenIconStyleConfiguration)homeScreenIconStyleConfiguration;
- (UIColor)tintColor;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)iconImageAppearanceWithUserInterfaceStyle:(int64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)widgetAppearanceWithUserInterfaceStyle:(int64_t)a3;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBHIconImageStyleConfiguration

+ (SBHIconImageStyleConfiguration)styleConfigurationWithHomeScreenConfiguration:(id)a3
{
  id v3 = a3;
  switch([v3 styleType])
  {
    case 0:
      uint64_t v4 = +[SBHIconImageStyleConfiguration automaticStyleConfiguration];
      goto LABEL_6;
    case 1:
      uint64_t v4 = +[SBHIconImageStyleConfiguration darkStyleConfiguration];
      goto LABEL_6;
    case 2:
      uint64_t v4 = +[SBHIconImageStyleConfiguration automaticWithLightIconsStyleConfiguration];
LABEL_6:
      v5 = (void *)v4;
      break;
    case 3:
      v7 = (void *)styleConfigurationWithHomeScreenConfiguration__sharedTintedStyleConfigurations;
      if (!styleConfigurationWithHomeScreenConfiguration__sharedTintedStyleConfigurations)
      {
        uint64_t v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
        v9 = (void *)styleConfigurationWithHomeScreenConfiguration__sharedTintedStyleConfigurations;
        styleConfigurationWithHomeScreenConfiguration__sharedTintedStyleConfigurations = v8;

        v7 = (void *)styleConfigurationWithHomeScreenConfiguration__sharedTintedStyleConfigurations;
      }
      v5 = [v7 objectForKey:v3];
      if (!v5)
      {
        v10 = [v3 accentColor];
        v5 = +[SBHIconImageStyleConfiguration tintedStyleConfigurationWithTintColor:v10];

        [(id)styleConfigurationWithHomeScreenConfiguration__sharedTintedStyleConfigurations setObject:v5 forKey:v3];
      }
      break;
    default:
      v5 = 0;
      break;
  }

  return (SBHIconImageStyleConfiguration *)v5;
}

+ (SBHIconImageStyleConfiguration)automaticWithLightIconsStyleConfiguration
{
  if (automaticWithLightIconsStyleConfiguration_onceToken != -1) {
    dispatch_once(&automaticWithLightIconsStyleConfiguration_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)automaticWithLightIconsStyleConfiguration_automaticWithLightIconsStyleConfiguration;
  return (SBHIconImageStyleConfiguration *)v2;
}

- (id)iconImageAppearanceWithUserInterfaceStyle:(int64_t)a3
{
  switch([(SBHIconImageStyleConfiguration *)self configurationType])
  {
    case 0:
      if (a3 == 2) {
        goto LABEL_5;
      }
      goto LABEL_4;
    case 1:
    case 2:
LABEL_4:
      uint64_t v6 = +[SBHIconImageAppearance lightAppearance];
      goto LABEL_6;
    case 3:
LABEL_5:
      uint64_t v6 = +[SBHIconImageAppearance darkAppearance];
LABEL_6:
      v5 = (void *)v6;
      break;
    case 4:
      v7 = [(SBHIconImageStyleConfiguration *)self tintColor];
      v5 = +[SBHIconImageAppearance tintedAppearanceWithTintColor:v7];

      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

+ (SBHIconImageStyleConfiguration)lightStyleConfiguration
{
  if (lightStyleConfiguration_onceToken != -1) {
    dispatch_once(&lightStyleConfiguration_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)lightStyleConfiguration_lightStyleConfiguration;
  return (SBHIconImageStyleConfiguration *)v2;
}

+ (SBHIconImageStyleConfiguration)automaticStyleConfiguration
{
  if (automaticStyleConfiguration_onceToken != -1) {
    dispatch_once(&automaticStyleConfiguration_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)automaticStyleConfiguration_automaticStyleConfiguration;
  return (SBHIconImageStyleConfiguration *)v2;
}

void __61__SBHIconImageStyleConfiguration_automaticStyleConfiguration__block_invoke()
{
  v0 = objc_alloc_init(SBHAutomaticIconImageStyleConfiguration);
  v1 = (void *)automaticStyleConfiguration_automaticStyleConfiguration;
  automaticStyleConfiguration_automaticStyleConfiguration = (uint64_t)v0;
}

void __75__SBHIconImageStyleConfiguration_automaticWithLightIconsStyleConfiguration__block_invoke()
{
  v0 = objc_alloc_init(SBHAutomaticWithLightIconsIconImageStyleConfiguration);
  v1 = (void *)automaticWithLightIconsStyleConfiguration_automaticWithLightIconsStyleConfiguration;
  automaticWithLightIconsStyleConfiguration_automaticWithLightIconsStyleConfiguration = (uint64_t)v0;
}

void __57__SBHIconImageStyleConfiguration_lightStyleConfiguration__block_invoke()
{
  v0 = objc_alloc_init(SBHLightIconImageStyleConfiguration);
  v1 = (void *)lightStyleConfiguration_lightStyleConfiguration;
  lightStyleConfiguration_lightStyleConfiguration = (uint64_t)v0;
}

+ (SBHIconImageStyleConfiguration)darkStyleConfiguration
{
  if (darkStyleConfiguration_onceToken != -1) {
    dispatch_once(&darkStyleConfiguration_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)darkStyleConfiguration_darkStyleConfiguration;
  return (SBHIconImageStyleConfiguration *)v2;
}

void __56__SBHIconImageStyleConfiguration_darkStyleConfiguration__block_invoke()
{
  v0 = objc_alloc_init(SBHDarkIconImageStyleConfiguration);
  v1 = (void *)darkStyleConfiguration_darkStyleConfiguration;
  darkStyleConfiguration_darkStyleConfiguration = (uint64_t)v0;
}

+ (id)tintedStyleConfigurationWithTintColor:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[SBHTintedIconImageStyleConfiguration alloc] initWithConfigurationType:4 tintColor:v3];

  return v4;
}

+ (id)sharedInstanceForStyleConfigurationType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v5 = objc_msgSend(a1, "automaticStyleConfiguration", v3);
      goto LABEL_9;
    case 1:
      v5 = objc_msgSend(a1, "automaticWithLightIconsStyleConfiguration", v3);
      goto LABEL_9;
    case 2:
      v5 = objc_msgSend(a1, "lightStyleConfiguration", v3);
      goto LABEL_9;
    case 3:
      v5 = objc_msgSend(a1, "darkStyleConfiguration", v3);
LABEL_9:
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    uint64_t v4 = [SBHPlaceholderIconImageStyleConfiguration alloc];
    v5 = (void *)reusablePlaceholderImageStyleConfiguration;
    reusablePlaceholderImageStyleConfiguration = (uint64_t)v4;
  }
}

+ (SBHIconImageStyleConfiguration)allocWithZone:(_NSZone *)a3
{
  self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
  {
    v7 = (void *)reusablePlaceholderImageStyleConfiguration;
    return (SBHIconImageStyleConfiguration *)v7;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SBHIconImageStyleConfiguration;
    return (SBHIconImageStyleConfiguration *)objc_msgSendSuper2(&v8, sel_allocWithZone_, a3);
  }
}

- (SBHIconImageStyleConfiguration)initWithConfigurationType:(int64_t)a3 tintColor:(id)a4
{
  id v6 = a4;
  v7 = self;
  if ([(SBHIconImageStyleConfiguration *)self isMemberOfClass:v7])
  {
  }
  else
  {
    objc_super v8 = self;
    int v9 = [(SBHIconImageStyleConfiguration *)self isMemberOfClass:v8];

    if (!v9)
    {
      v12.receiver = self;
      v12.super_class = (Class)SBHIconImageStyleConfiguration;
      v10 = [(SBHIconImageStyleConfiguration *)&v12 init];
      self = &v10->super;
LABEL_11:
      a3 = (int64_t)v10;
      goto LABEL_12;
    }
  }
  switch(a3)
  {
    case 0:
      v10 = +[SBHIconImageStyleConfiguration automaticStyleConfiguration];
      goto LABEL_11;
    case 1:
      v10 = +[SBHIconImageStyleConfiguration automaticWithLightIconsStyleConfiguration];
      goto LABEL_11;
    case 2:
      v10 = +[SBHIconImageStyleConfiguration lightStyleConfiguration];
      goto LABEL_11;
    case 3:
      v10 = +[SBHIconImageStyleConfiguration darkStyleConfiguration];
      goto LABEL_11;
    case 4:
      v10 = [[SBHTintedIconImageStyleConfiguration alloc] initWithConfigurationType:4 tintColor:v6];
      goto LABEL_11;
    default:
      break;
  }
LABEL_12:

  return (SBHIconImageStyleConfiguration *)a3;
}

- (SBHIconImageStyleConfiguration)initWithConfigurationType:(int64_t)a3
{
  return [(SBHIconImageStyleConfiguration *)self initWithConfigurationType:a3 tintColor:0];
}

+ (SBHIconImageStyleConfiguration)styleConfigurationWithIconImageAppearance:(id)a3
{
  id v4 = a3;
  switch([v4 appearanceType])
  {
    case 0:
      uint64_t v5 = [a1 automaticWithLightIconsStyleConfiguration];
      goto LABEL_5;
    case 1:
    case 3:
      uint64_t v5 = [a1 darkStyleConfiguration];
LABEL_5:
      id v6 = (void *)v5;
      break;
    case 2:
      v7 = [v4 tintColor];
      id v6 = [a1 tintedStyleConfigurationWithTintColor:v7];

      break;
    default:
      id v6 = 0;
      break;
  }

  return (SBHIconImageStyleConfiguration *)v6;
}

- (SBHIconImageStyleConfiguration)init
{
  return [(SBHIconImageStyleConfiguration *)self initWithConfigurationType:0 tintColor:0];
}

- (UIColor)tintColor
{
  return 0;
}

- (id)widgetAppearanceWithUserInterfaceStyle:(int64_t)a3
{
  switch([(SBHIconImageStyleConfiguration *)self configurationType])
  {
    case 0:
    case 1:
      if (a3 != 2) {
        goto LABEL_5;
      }
      goto LABEL_6;
    case 2:
LABEL_5:
      uint64_t v6 = +[SBHIconImageAppearance lightAppearance];
      goto LABEL_7;
    case 3:
LABEL_6:
      uint64_t v6 = +[SBHIconImageAppearance darkAppearance];
LABEL_7:
      uint64_t v5 = (void *)v6;
      break;
    case 4:
      v7 = [(SBHIconImageStyleConfiguration *)self tintColor];
      uint64_t v5 = +[SBHIconImageAppearance tintedAppearanceWithTintColor:v7];

      break;
    default:
      uint64_t v5 = 0;
      break;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SBHIconImageStyleConfiguration *)self configurationType];
  id v4 = [(SBHIconImageStyleConfiguration *)self tintColor];
  unint64_t v5 = [v4 hash] + v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBHIconImageStyleConfiguration *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    unint64_t v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      uint64_t v8 = [(SBHIconImageStyleConfiguration *)self configurationType];
      if (v8 == [(SBHIconImageStyleConfiguration *)v7 configurationType])
      {
        int v9 = [(SBHIconImageStyleConfiguration *)self tintColor];
        v10 = [(SBHIconImageStyleConfiguration *)v7 tintColor];
        char v11 = BSEqualObjects();
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (NSString)description
{
  return (NSString *)[(SBHIconImageStyleConfiguration *)self descriptionWithMultilinePrefix:0];
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
  objc_msgSend(v4, "encodeInteger:forKey:", -[SBHIconImageStyleConfiguration configurationType](self, "configurationType"), @"configurationType");
  id v5 = [(SBHIconImageStyleConfiguration *)self tintColor];
  [v4 encodeObject:v5 forKey:@"tintColor"];
}

- (SBHIconImageStyleConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"configurationType"];
  uint64_t v6 = self;
  v7 = [v4 decodeObjectOfClass:v6 forKey:@"tintColor"];

  uint64_t v8 = [(SBHIconImageStyleConfiguration *)self initWithConfigurationType:v5 tintColor:v7];
  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SBHIconImageStyleConfiguration configurationType](self, "configurationType"), @"configurationType");
  id v5 = [(SBHIconImageStyleConfiguration *)self tintColor];
  [v4 encodeObject:v5 forKey:@"tintColor"];
}

- (SBHIconImageStyleConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"configurationType"];
  uint64_t v6 = self;
  v7 = [v4 decodeObjectOfClass:v6 forKey:@"tintColor"];

  uint64_t v8 = [(SBHIconImageStyleConfiguration *)self initWithConfigurationType:v5 tintColor:v7];
  return v8;
}

- (id)succinctDescription
{
  v2 = [(SBHIconImageStyleConfiguration *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBHIconImageStyleConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBHIconImageStyleConfiguration *)self succinctDescriptionBuilder];
  uint64_t v5 = [(SBHIconImageStyleConfiguration *)self tintColor];
  id v6 = (id)[v4 appendObject:v5 withName:@"tintColor" skipIfNil:1];

  return v4;
}

- (PUIStylePickerHomeScreenConfiguration)homeScreenConfiguration
{
  uint64_t v3 = [(SBHIconImageStyleConfiguration *)self configurationType];
  if ((unint64_t)(v3 - 1) < 2)
  {
    id v4 = 0;
    uint64_t v5 = 2;
  }
  else if (v3 == 3)
  {
    id v4 = 0;
    uint64_t v5 = 1;
  }
  else if (v3 == 4)
  {
    id v4 = [(SBHIconImageStyleConfiguration *)self tintColor];
    uint64_t v5 = 3;
  }
  else
  {
    id v4 = 0;
    uint64_t v5 = 0;
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F927E8]) initWithStyleType:v5 variation:0.0 luminance:0.0];
  v7 = v6;
  if (v4) {
    [v6 setAccentColor:v4];
  }

  return (PUIStylePickerHomeScreenConfiguration *)v7;
}

- (SBSHomeScreenIconStyleConfiguration)homeScreenIconStyleConfiguration
{
  uint64_t v3 = [(SBHIconImageStyleConfiguration *)self configurationType];
  if (v3 == 4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FA6AB8];
    id v6 = [(SBHIconImageStyleConfiguration *)self tintColor];
    v7 = [v6 BSColor];
    uint64_t v8 = [v5 tintedStyleConfigurationWithTintColor:v7];
  }
  else
  {
    if (v3 == 3)
    {
      uint64_t v4 = [MEMORY[0x1E4FA6AB8] darkStyleConfiguration];
    }
    else
    {
      if (v3) {
        [MEMORY[0x1E4FA6AB8] lightStyleConfiguration];
      }
      else {
      uint64_t v4 = [MEMORY[0x1E4FA6AB8] automaticStyleConfiguration];
      }
    }
    uint64_t v8 = (void *)v4;
  }
  return (SBSHomeScreenIconStyleConfiguration *)v8;
}

@end