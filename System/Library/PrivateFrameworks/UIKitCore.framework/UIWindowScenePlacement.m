@interface UIWindowScenePlacement
+ (id)_default;
+ (unint64_t)_placementType;
- (BOOL)_preserveLayout;
- (BOOL)_requestBackground;
- (BOOL)_requestCenterSlot;
- (BOOL)_requestFullscreen;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (id)_createConfigurationWithError:(id *)a3;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation UIWindowScenePlacement

+ (unint64_t)_placementType
{
  return 0;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)UIWindowScenePlacement;
  return [(UIWindowScenePlacement *)&v3 init];
}

+ (id)_default
{
  v2 = (void *)[objc_alloc((Class)a1) _init];
  return v2;
}

- (id)_createConfigurationWithError:(id *)a3
{
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = objc_alloc((Class)objc_opt_class());
  return (id)[v3 _init];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIWindowScenePlacement *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      BOOL v7 = 1;
    }
    else
    {
      uint64_t v6 = objc_opt_class();
      BOOL v7 = v6 == objc_opt_class();
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_preserveLayout
{
  return 0;
}

- (BOOL)_requestFullscreen
{
  return 0;
}

- (BOOL)_requestCenterSlot
{
  return 0;
}

- (BOOL)_requestBackground
{
  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)[(UIWindowScenePlacement *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(UIWindowScenePlacement *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(UIWindowScenePlacement *)self succinctDescriptionBuilder];
  [v5 setActiveMultilinePrefix:v4];

  return v5;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(UIWindowScenePlacement *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(UIWindowScenePlacement *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

@end