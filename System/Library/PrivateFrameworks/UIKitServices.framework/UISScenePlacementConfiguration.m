@interface UISScenePlacementConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (unint64_t)placementType;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (UISScenePlacementConfiguration)init;
- (UISScenePlacementConfiguration)initWithBSXPCCoder:(id)a3;
- (UISScenePlacementConfiguration)initWithCoder:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation UISScenePlacementConfiguration

+ (unint64_t)placementType
{
  return 0;
}

- (UISScenePlacementConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)UISScenePlacementConfiguration;
  return [(UISScenePlacementConfiguration *)&v3 init];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UISScenePlacementConfiguration *)a3;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISScenePlacementConfiguration)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UISScenePlacementConfiguration;
  return [(UISScenePlacementConfiguration *)&v4 init];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (UISScenePlacementConfiguration)initWithBSXPCCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UISScenePlacementConfiguration;
  return [(UISScenePlacementConfiguration *)&v4 init];
}

- (NSString)debugDescription
{
  return (NSString *)[(UISScenePlacementConfiguration *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(UISScenePlacementConfiguration *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  objc_super v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__UISScenePlacementConfiguration_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E57351C0;
  id v4 = v3;
  id v8 = v4;
  v9 = self;
  [v4 appendProem:0 block:v7];
  id v5 = v4;

  return v5;
}

void __60__UISScenePlacementConfiguration_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [(id)objc_opt_class() placementType];
  NSStringForUISScenePlacementType(v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v1 appendString:v3 withName:@"placementType"];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(UISScenePlacementConfiguration *)self succinctDescriptionBuilder];
  [v5 setActiveMultilinePrefix:v4];

  return v5;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(UISScenePlacementConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(UISScenePlacementConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

@end