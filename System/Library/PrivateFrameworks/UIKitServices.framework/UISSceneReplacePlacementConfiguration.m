@interface UISSceneReplacePlacementConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (unint64_t)placementType;
- (BOOL)isEqual:(id)a3;
- (NSString)targetSceneSessionPersistentIdentifier;
- (UISSceneReplacePlacementConfiguration)initWithBSXPCCoder:(id)a3;
- (UISSceneReplacePlacementConfiguration)initWithCoder:(id)a3;
- (UISSceneReplacePlacementConfiguration)initWithTargetSceneSessionPersistentIdentifier:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UISSceneReplacePlacementConfiguration

+ (unint64_t)placementType
{
  return 8;
}

- (UISSceneReplacePlacementConfiguration)initWithTargetSceneSessionPersistentIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISSceneReplacePlacementConfiguration;
  v6 = [(UISScenePlacementConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_targetSceneSessionPersistentIdentifier, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISSceneReplacePlacementConfiguration;
  if ([(UISScenePlacementConfiguration *)&v9 isEqual:v4])
  {
    id v5 = [v4 targetSceneSessionPersistentIdentifier];
    v6 = [(UISSceneReplacePlacementConfiguration *)self targetSceneSessionPersistentIdentifier];
    char v7 = [v6 isEqual:v5];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISSceneReplacePlacementConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISSceneReplacePlacementConfiguration;
  id v5 = [(UISScenePlacementConfiguration *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTargetSceneSessionPersistentIdentifierKey"];
    targetSceneSessionPersistentIdentifier = v5->_targetSceneSessionPersistentIdentifier;
    v5->_targetSceneSessionPersistentIdentifier = (NSString *)v6;

    if (!v5->_targetSceneSessionPersistentIdentifier)
    {

      id v5 = 0;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UISSceneReplacePlacementConfiguration;
  id v4 = a3;
  [(UISScenePlacementConfiguration *)&v6 encodeWithCoder:v4];
  id v5 = [(UISSceneReplacePlacementConfiguration *)self targetSceneSessionPersistentIdentifier];
  [v4 encodeObject:v5 forKey:@"kTargetSceneSessionPersistentIdentifierKey"];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (UISSceneReplacePlacementConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISSceneReplacePlacementConfiguration;
  id v5 = [(UISScenePlacementConfiguration *)&v9 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kTargetSceneSessionPersistentIdentifierKey"];
    targetSceneSessionPersistentIdentifier = v5->_targetSceneSessionPersistentIdentifier;
    v5->_targetSceneSessionPersistentIdentifier = (NSString *)v6;

    if (!v5->_targetSceneSessionPersistentIdentifier)
    {

      id v5 = 0;
    }
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UISSceneReplacePlacementConfiguration;
  id v4 = a3;
  [(UISScenePlacementConfiguration *)&v6 encodeWithBSXPCCoder:v4];
  id v5 = [(UISSceneReplacePlacementConfiguration *)self targetSceneSessionPersistentIdentifier];
  [v4 encodeObject:v5 forKey:@"kTargetSceneSessionPersistentIdentifierKey"];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UISSceneReplacePlacementConfiguration;
  id v4 = a3;
  id v5 = [(UISScenePlacementConfiguration *)&v12 descriptionBuilderWithMultilinePrefix:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__UISSceneReplacePlacementConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E57351C0;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:&stru_1EE28C550 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __79__UISSceneReplacePlacementConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) targetSceneSessionPersistentIdentifier];
  id v2 = (id)[v1 appendObject:v3 withName:@"targetSceneSessionPersistentIdentifier"];
}

- (NSString)targetSceneSessionPersistentIdentifier
{
  return self->_targetSceneSessionPersistentIdentifier;
}

- (void).cxx_destruct
{
}

@end