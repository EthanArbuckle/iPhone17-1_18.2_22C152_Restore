@interface UISSceneProminentPlacementConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (unint64_t)placementType;
- (BOOL)isEqual:(id)a3;
- (BOOL)prefersLargeSize;
- (UISSceneProminentPlacementConfiguration)init;
- (UISSceneProminentPlacementConfiguration)initWithBSXPCCoder:(id)a3;
- (UISSceneProminentPlacementConfiguration)initWithCoder:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setPrefersLargeSize:(BOOL)a3;
@end

@implementation UISSceneProminentPlacementConfiguration

+ (unint64_t)placementType
{
  return 2;
}

- (UISSceneProminentPlacementConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)UISSceneProminentPlacementConfiguration;
  result = [(UISScenePlacementConfiguration *)&v3 init];
  if (result) {
    result->_prefersLargeSize = 0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UISSceneProminentPlacementConfiguration;
  if ([(UISScenePlacementConfiguration *)&v8 isEqual:v4])
  {
    int v5 = [v4 prefersLargeSize];
    int v6 = v5 ^ [(UISSceneProminentPlacementConfiguration *)self prefersLargeSize] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISSceneProminentPlacementConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UISSceneProminentPlacementConfiguration;
  int v5 = [(UISScenePlacementConfiguration *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_prefersLargeSize = [v4 decodeBoolForKey:@"kPrefersLargeSizeKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UISSceneProminentPlacementConfiguration;
  id v4 = a3;
  [(UISScenePlacementConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[UISSceneProminentPlacementConfiguration prefersLargeSize](self, "prefersLargeSize", v5.receiver, v5.super_class), @"kPrefersLargeSizeKey");
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (UISSceneProminentPlacementConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UISSceneProminentPlacementConfiguration;
  objc_super v5 = [(UISScenePlacementConfiguration *)&v7 initWithBSXPCCoder:v4];
  if (v5) {
    v5->_prefersLargeSize = [v4 decodeBoolForKey:@"kPrefersLargeSizeKey"];
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UISSceneProminentPlacementConfiguration;
  id v4 = a3;
  [(UISScenePlacementConfiguration *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[UISSceneProminentPlacementConfiguration prefersLargeSize](self, "prefersLargeSize", v5.receiver, v5.super_class), @"kPrefersLargeSizeKey");
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UISSceneProminentPlacementConfiguration;
  id v4 = a3;
  objc_super v5 = [(UISScenePlacementConfiguration *)&v12 descriptionBuilderWithMultilinePrefix:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__UISSceneProminentPlacementConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E57351C0;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:&stru_1EE28C550 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __81__UISSceneProminentPlacementConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "prefersLargeSize"), @"prefersLargeSize");
}

- (BOOL)prefersLargeSize
{
  return self->_prefersLargeSize;
}

- (void)setPrefersLargeSize:(BOOL)a3
{
  self->_prefersLargeSize = a3;
}

@end