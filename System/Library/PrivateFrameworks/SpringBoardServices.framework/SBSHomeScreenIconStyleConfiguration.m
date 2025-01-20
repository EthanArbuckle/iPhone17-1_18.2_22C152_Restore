@interface SBSHomeScreenIconStyleConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (SBSHomeScreenIconStyleConfiguration)automaticStyleConfiguration;
+ (SBSHomeScreenIconStyleConfiguration)darkStyleConfiguration;
+ (SBSHomeScreenIconStyleConfiguration)lightStyleConfiguration;
+ (id)tintedStyleConfigurationWithTintColor:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BSColor)tintColor;
- (Class)classForCoder;
- (NSString)description;
- (SBSHomeScreenIconStyleConfiguration)initWithBSXPCCoder:(id)a3;
- (SBSHomeScreenIconStyleConfiguration)initWithCoder:(id)a3;
- (SBSHomeScreenIconStyleConfiguration)initWithConfigurationType:(int64_t)a3;
- (SBSHomeScreenIconStyleConfiguration)initWithConfigurationType:(int64_t)a3 tintColor:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)configurationType;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBSHomeScreenIconStyleConfiguration

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SBSHomeScreenIconStyleConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"configurationType"];
  v6 = self;
  v7 = [v4 decodeObjectOfClass:v6 forKey:@"tintColor"];

  v8 = [(SBSHomeScreenIconStyleConfiguration *)self initWithConfigurationType:v5 tintColor:v7];
  return v8;
}

- (SBSHomeScreenIconStyleConfiguration)initWithConfigurationType:(int64_t)a3 tintColor:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSHomeScreenIconStyleConfiguration;
  v8 = [(SBSHomeScreenIconStyleConfiguration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_configurationType = a3;
    objc_storeStrong((id *)&v8->_tintColor, a4);
  }

  return v9;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt64:-[SBSHomeScreenIconStyleConfiguration configurationType](self, "configurationType") forKey:@"configurationType"];
  id v5 = [(SBSHomeScreenIconStyleConfiguration *)self tintColor];
  [v4 encodeObject:v5 forKey:@"tintColor"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBSHomeScreenIconStyleConfiguration *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      int64_t v8 = [(SBSHomeScreenIconStyleConfiguration *)self configurationType];
      if (v8 == [(SBSHomeScreenIconStyleConfiguration *)v7 configurationType])
      {
        v9 = [(SBSHomeScreenIconStyleConfiguration *)self tintColor];
        v10 = [(SBSHomeScreenIconStyleConfiguration *)v7 tintColor];
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

- (int64_t)configurationType
{
  return self->_configurationType;
}

- (BSColor)tintColor
{
  return self->_tintColor;
}

- (Class)classForCoder
{
  return (Class)self;
}

+ (SBSHomeScreenIconStyleConfiguration)lightStyleConfiguration
{
  if (lightStyleConfiguration_onceToken != -1) {
    dispatch_once(&lightStyleConfiguration_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)lightStyleConfiguration_lightStyleConfiguration;
  return (SBSHomeScreenIconStyleConfiguration *)v2;
}

+ (SBSHomeScreenIconStyleConfiguration)automaticStyleConfiguration
{
  if (automaticStyleConfiguration_onceToken != -1) {
    dispatch_once(&automaticStyleConfiguration_onceToken, &__block_literal_global_36);
  }
  v2 = (void *)automaticStyleConfiguration_automaticStyleConfiguration;
  return (SBSHomeScreenIconStyleConfiguration *)v2;
}

uint64_t __66__SBSHomeScreenIconStyleConfiguration_automaticStyleConfiguration__block_invoke()
{
  automaticStyleConfiguration_automaticStyleConfiguration = [[SBSHomeScreenIconStyleConfiguration alloc] initWithConfigurationType:0];
  return MEMORY[0x1F41817F8]();
}

uint64_t __62__SBSHomeScreenIconStyleConfiguration_lightStyleConfiguration__block_invoke()
{
  lightStyleConfiguration_lightStyleConfiguration = [[SBSHomeScreenIconStyleConfiguration alloc] initWithConfigurationType:1];
  return MEMORY[0x1F41817F8]();
}

+ (SBSHomeScreenIconStyleConfiguration)darkStyleConfiguration
{
  if (darkStyleConfiguration_onceToken != -1) {
    dispatch_once(&darkStyleConfiguration_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)darkStyleConfiguration_darkStyleConfiguration;
  return (SBSHomeScreenIconStyleConfiguration *)v2;
}

uint64_t __61__SBSHomeScreenIconStyleConfiguration_darkStyleConfiguration__block_invoke()
{
  darkStyleConfiguration_darkStyleConfiguration = [[SBSHomeScreenIconStyleConfiguration alloc] initWithConfigurationType:2];
  return MEMORY[0x1F41817F8]();
}

+ (id)tintedStyleConfigurationWithTintColor:(id)a3
{
  id v3 = a3;
  id v4 = [[SBSHomeScreenIconStyleConfiguration alloc] initWithConfigurationType:3 tintColor:v3];

  return v4;
}

- (SBSHomeScreenIconStyleConfiguration)initWithConfigurationType:(int64_t)a3
{
  return [(SBSHomeScreenIconStyleConfiguration *)self initWithConfigurationType:a3 tintColor:0];
}

- (unint64_t)hash
{
  int64_t v3 = [(SBSHomeScreenIconStyleConfiguration *)self configurationType];
  id v4 = [(SBSHomeScreenIconStyleConfiguration *)self tintColor];
  unint64_t v5 = [v4 hash] + v3;

  return v5;
}

- (NSString)description
{
  return (NSString *)[(SBSHomeScreenIconStyleConfiguration *)self descriptionWithMultilinePrefix:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:-[SBSHomeScreenIconStyleConfiguration configurationType](self, "configurationType") forKey:@"configurationType"];
  id v5 = [(SBSHomeScreenIconStyleConfiguration *)self tintColor];
  [v4 encodeObject:v5 forKey:@"tintColor"];
}

- (SBSHomeScreenIconStyleConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"configurationType"];
  v6 = self;
  id v7 = [v4 decodeObjectOfClass:v6 forKey:@"tintColor"];

  int64_t v8 = [(SBSHomeScreenIconStyleConfiguration *)self initWithConfigurationType:v5 tintColor:v7];
  return v8;
}

- (id)succinctDescription
{
  v2 = [(SBSHomeScreenIconStyleConfiguration *)self succinctDescriptionBuilder];
  int64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int64_t v3 = [(SBSHomeScreenIconStyleConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBSHomeScreenIconStyleConfiguration *)self succinctDescriptionBuilder];
  unint64_t v5 = [(SBSHomeScreenIconStyleConfiguration *)self configurationType];
  if (v5 > 3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = *((void *)&off_1E566CD60 + v5);
  }
  id v7 = (id)[v4 appendObject:v6 withName:@"configurationType"];
  int64_t v8 = [(SBSHomeScreenIconStyleConfiguration *)self tintColor];
  id v9 = (id)[v4 appendObject:v8 withName:@"tintColor" skipIfNil:1];

  return v4;
}

- (void).cxx_destruct
{
}

@end