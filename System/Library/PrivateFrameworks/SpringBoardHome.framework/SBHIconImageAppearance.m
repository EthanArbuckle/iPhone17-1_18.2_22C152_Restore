@interface SBHIconImageAppearance
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (SBHIconImageAppearance)allocWithZone:(_NSZone *)a3;
+ (SBHIconImageAppearance)darkAppearance;
+ (SBHIconImageAppearance)lightAppearance;
+ (SBHIconImageAppearance)tintableAppearance;
+ (id)sharedInstanceForAppearanceType:(int64_t)a3;
+ (id)tintedAppearanceWithTintColor:(id)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (NSString)description;
- (SBHIconImageAppearance)init;
- (SBHIconImageAppearance)initWithAppearanceType:(int64_t)a3;
- (SBHIconImageAppearance)initWithAppearanceType:(int64_t)a3 tintColor:(id)a4;
- (SBHIconImageAppearance)initWithBSXPCCoder:(id)a3;
- (SBHIconImageAppearance)initWithCoder:(id)a3;
- (UIColor)tintColor;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SBHIconImageAppearance

+ (SBHIconImageAppearance)lightAppearance
{
  if (lightAppearance_onceToken != -1) {
    dispatch_once(&lightAppearance_onceToken, &__block_literal_global_79);
  }
  v2 = (void *)lightAppearance_lightAppearance;
  return (SBHIconImageAppearance *)v2;
}

void __41__SBHIconImageAppearance_lightAppearance__block_invoke()
{
  v0 = objc_alloc_init(SBHLightIconImageAppearance);
  v1 = (void *)lightAppearance_lightAppearance;
  lightAppearance_lightAppearance = (uint64_t)v0;
}

+ (SBHIconImageAppearance)darkAppearance
{
  if (darkAppearance_onceToken != -1) {
    dispatch_once(&darkAppearance_onceToken, &__block_literal_global_2_1);
  }
  v2 = (void *)darkAppearance_darkAppearance;
  return (SBHIconImageAppearance *)v2;
}

void __40__SBHIconImageAppearance_darkAppearance__block_invoke()
{
  v0 = objc_alloc_init(SBHDarkIconImageAppearance);
  v1 = (void *)darkAppearance_darkAppearance;
  darkAppearance_darkAppearance = (uint64_t)v0;
}

+ (id)tintedAppearanceWithTintColor:(id)a3
{
  id v3 = a3;
  v4 = [[SBHTintedIconImageAppearance alloc] initWithAppearanceType:2 tintColor:v3];

  return v4;
}

+ (SBHIconImageAppearance)tintableAppearance
{
  if (tintableAppearance_onceToken != -1) {
    dispatch_once(&tintableAppearance_onceToken, &__block_literal_global_6_2);
  }
  v2 = (void *)tintableAppearance_tintableAppearance;
  return (SBHIconImageAppearance *)v2;
}

void __44__SBHIconImageAppearance_tintableAppearance__block_invoke()
{
  v0 = objc_alloc_init(SBHTintableIconImageAppearance);
  v1 = (void *)tintableAppearance_tintableAppearance;
  tintableAppearance_tintableAppearance = (uint64_t)v0;
}

+ (id)sharedInstanceForAppearanceType:(int64_t)a3
{
  if (a3 == 3)
  {
    id v3 = [a1 tintableAppearance];
  }
  else if (a3 == 1)
  {
    id v3 = [a1 darkAppearance];
  }
  else if (a3)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [a1 lightAppearance];
  }
  return v3;
}

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = [SBHPlaceholderIconImageAppearance alloc];
    v5 = (void *)reusablePlaceholderImageAppearance;
    reusablePlaceholderImageAppearance = (uint64_t)v4;
  }
}

+ (SBHIconImageAppearance)allocWithZone:(_NSZone *)a3
{
  self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
  {
    v7 = (void *)reusablePlaceholderImageAppearance;
    return (SBHIconImageAppearance *)v7;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SBHIconImageAppearance;
    return (SBHIconImageAppearance *)objc_msgSendSuper2(&v8, sel_allocWithZone_, a3);
  }
}

- (SBHIconImageAppearance)initWithAppearanceType:(int64_t)a3 tintColor:(id)a4
{
  id v6 = a4;
  v7 = self;
  if ([(SBHIconImageAppearance *)self isMemberOfClass:v7])
  {
  }
  else
  {
    objc_super v8 = self;
    int v9 = [(SBHIconImageAppearance *)self isMemberOfClass:v8];

    if (!v9)
    {
      v12.receiver = self;
      v12.super_class = (Class)SBHIconImageAppearance;
      v10 = [(SBHIconImageAppearance *)&v12 init];
      self = &v10->super;
LABEL_10:
      a3 = (int64_t)v10;
      goto LABEL_11;
    }
  }
  switch(a3)
  {
    case 0:
      v10 = +[SBHIconImageAppearance lightAppearance];
      goto LABEL_10;
    case 1:
      v10 = +[SBHIconImageAppearance darkAppearance];
      goto LABEL_10;
    case 2:
      v10 = [[SBHTintedIconImageAppearance alloc] initWithAppearanceType:2 tintColor:v6];
      goto LABEL_10;
    case 3:
      v10 = +[SBHIconImageAppearance tintableAppearance];
      goto LABEL_10;
    default:
      break;
  }
LABEL_11:

  return (SBHIconImageAppearance *)a3;
}

- (SBHIconImageAppearance)initWithAppearanceType:(int64_t)a3
{
  return [(SBHIconImageAppearance *)self initWithAppearanceType:a3 tintColor:0];
}

- (SBHIconImageAppearance)init
{
  return [(SBHIconImageAppearance *)self initWithAppearanceType:0 tintColor:0];
}

- (UIColor)tintColor
{
  return 0;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SBHIconImageAppearance *)self appearanceType];
  v4 = [(SBHIconImageAppearance *)self tintColor];
  unint64_t v5 = [v4 hash] + v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBHIconImageAppearance *)a3;
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
      uint64_t v8 = [(SBHIconImageAppearance *)self appearanceType];
      if (v8 == [(SBHIconImageAppearance *)v7 appearanceType])
      {
        int v9 = [(SBHIconImageAppearance *)self tintColor];
        v10 = [(SBHIconImageAppearance *)v7 tintColor];
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
  return (NSString *)[(SBHIconImageAppearance *)self descriptionWithMultilinePrefix:0];
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
  objc_msgSend(v4, "encodeInteger:forKey:", -[SBHIconImageAppearance appearanceType](self, "appearanceType"), @"appearanceType");
  id v5 = [(SBHIconImageAppearance *)self tintColor];
  [v4 encodeObject:v5 forKey:@"tintColor"];
}

- (SBHIconImageAppearance)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"appearanceType"];
  id v6 = self;
  v7 = [v4 decodeObjectOfClass:v6 forKey:@"tintColor"];

  uint64_t v8 = [(SBHIconImageAppearance *)self initWithAppearanceType:v5 tintColor:v7];
  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SBHIconImageAppearance appearanceType](self, "appearanceType"), @"appearanceType");
  id v5 = [(SBHIconImageAppearance *)self tintColor];
  [v4 encodeObject:v5 forKey:@"tintColor"];
}

- (SBHIconImageAppearance)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"appearanceType"];
  id v6 = self;
  v7 = [v4 decodeObjectOfClass:v6 forKey:@"tintColor"];

  uint64_t v8 = [(SBHIconImageAppearance *)self initWithAppearanceType:v5 tintColor:v7];
  return v8;
}

- (id)succinctDescription
{
  v2 = [(SBHIconImageAppearance *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBHIconImageAppearance *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBHIconImageAppearance *)self succinctDescriptionBuilder];
  uint64_t v5 = [(SBHIconImageAppearance *)self tintColor];
  id v6 = (id)[v4 appendObject:v5 withName:@"tintColor" skipIfNil:1];

  return v4;
}

@end