@interface PRPosterRenderingConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (PRPosterRenderingConfiguration)allocWithZone:(_NSZone *)a3;
- (BOOL)isEqual:(id)a3;
- (Class)classForArchiver;
- (NSString)description;
- (PRPosterRenderingConfiguration)init;
- (PRPosterRenderingConfiguration)initWithBSXPCCoder:(id)a3;
- (PRPosterRenderingConfiguration)initWithDepthEffectDisabled:(BOOL)a3 parallaxEnabled:(BOOL)a4;
- (PRPosterRenderingConfiguration)initWithRenderingConfiguration:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation PRPosterRenderingConfiguration

+ (PRPosterRenderingConfiguration)allocWithZone:(_NSZone *)a3
{
  self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
  {
    return (PRPosterRenderingConfiguration *)+[PRPosterRenderingConfiguration allocWithZone:a3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___PRPosterRenderingConfiguration;
    return (PRPosterRenderingConfiguration *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

- (PRPosterRenderingConfiguration)init
{
  return [(PRPosterRenderingConfiguration *)self initWithDepthEffectDisabled:0 parallaxEnabled:0];
}

- (PRPosterRenderingConfiguration)initWithDepthEffectDisabled:(BOOL)a3 parallaxEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  objc_super v7 = self;
  int v8 = [(PRPosterRenderingConfiguration *)self isMemberOfClass:v7];

  if (v8)
  {
    v9 = [[PRImmutablePosterRenderingConfiguration alloc] initWithDepthEffectDisabled:v5 parallaxEnabled:v4];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PRPosterRenderingConfiguration;
    v9 = [(PRPosterRenderingConfiguration *)&v12 init];
    self = &v9->super;
  }
  p_super = &v9->super;

  return p_super;
}

- (PRPosterRenderingConfiguration)initWithRenderingConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 isDepthEffectDisabled];
  uint64_t v6 = [v4 isParallaxEnabled];

  return [(PRPosterRenderingConfiguration *)self initWithDepthEffectDisabled:v5 parallaxEnabled:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRPosterRenderingConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    uint64_t v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_super v7 = v4;
      int v8 = [(PRPosterRenderingConfiguration *)self isDepthEffectDisabled];
      if (v8 == [(PRPosterRenderingConfiguration *)v7 isDepthEffectDisabled])
      {
        int v10 = [(PRPosterRenderingConfiguration *)self isParallaxEnabled];
        int v9 = v10 ^ [(PRPosterRenderingConfiguration *)v7 isParallaxEnabled] ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(PRPosterRenderingConfiguration *)self isDepthEffectDisabled];
  int v4 = [(PRPosterRenderingConfiguration *)self isParallaxEnabled];
  uint64_t v5 = 2;
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  int v9 = __45__PRPosterRenderingConfiguration_description__block_invoke;
  int v10 = &unk_1E54DAA08;
  v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  uint64_t v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __45__PRPosterRenderingConfiguration_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (Class)classForArchiver
{
  return (Class)self;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[PRPosterRenderingConfiguration allocWithZone:a3];
  return [(PRPosterRenderingConfiguration *)v4 initWithRenderingConfiguration:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterRenderingConfiguration isDepthEffectDisabled](self, "isDepthEffectDisabled"), @"depthEffectDisabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterRenderingConfiguration isParallaxEnabled](self, "isParallaxEnabled"), @"parallaxEnabled");
}

- (PRPosterRenderingConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"depthEffectDisabled"];
  uint64_t v6 = [v4 decodeBoolForKey:@"parallaxEnabled"];

  return [(PRPosterRenderingConfiguration *)self initWithDepthEffectDisabled:v5 parallaxEnabled:v6];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v6 = a3;
  id v4 = (id)objc_msgSend(v6, "appendBool:withName:", -[PRPosterRenderingConfiguration isDepthEffectDisabled](self, "isDepthEffectDisabled"), @"depthEffectDisabled");
  id v5 = (id)objc_msgSend(v6, "appendBool:withName:", -[PRPosterRenderingConfiguration isParallaxEnabled](self, "isParallaxEnabled"), @"parallaxEnabled");
}

@end