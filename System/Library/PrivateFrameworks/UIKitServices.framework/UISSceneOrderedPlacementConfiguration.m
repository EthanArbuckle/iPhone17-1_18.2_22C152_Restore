@interface UISSceneOrderedPlacementConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (unint64_t)placementType;
- (BOOL)isEqual:(id)a3;
- (NSString)relativeScenePersistenceIdentifier;
- (UISSceneOrderedPlacementConfiguration)initWithBSXPCCoder:(id)a3;
- (UISSceneOrderedPlacementConfiguration)initWithCoder:(id)a3;
- (UISSceneOrderedPlacementConfiguration)initWithOrder:(int64_t)a3 relativeScenePersistenceIdentifer:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)order;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UISSceneOrderedPlacementConfiguration

+ (unint64_t)placementType
{
  return 7;
}

- (UISSceneOrderedPlacementConfiguration)initWithOrder:(int64_t)a3 relativeScenePersistenceIdentifer:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UISSceneOrderedPlacementConfiguration;
  v8 = [(UISScenePlacementConfiguration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_order = (int64_t *)a3;
    objc_storeStrong((id *)&v8->_relativeScenePersistenceIdentifier, a4);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [UISSceneOrderedPlacementConfiguration alloc];
  v5 = [(UISSceneOrderedPlacementConfiguration *)self order];
  v6 = [(UISSceneOrderedPlacementConfiguration *)self relativeScenePersistenceIdentifier];
  id v7 = [(UISSceneOrderedPlacementConfiguration *)v4 initWithOrder:v5 relativeScenePersistenceIdentifer:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UISSceneOrderedPlacementConfiguration;
  if ([(UISScenePlacementConfiguration *)&v10 isEqual:v4])
  {
    v5 = [v4 relativeScenePersistenceIdentifier];
    v6 = (int64_t *)[v4 order];
    id v7 = [(UISSceneOrderedPlacementConfiguration *)self relativeScenePersistenceIdentifier];
    if ([v7 isEqualToString:v5]) {
      BOOL v8 = [(UISSceneOrderedPlacementConfiguration *)self order] == v6;
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISSceneOrderedPlacementConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISSceneOrderedPlacementConfiguration;
  v5 = [(UISScenePlacementConfiguration *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_order = (int64_t *)[v4 decodeInt64ForKey:@"kOrderKey"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kRelativeScenePersistenceIdentifierKey"];
    relativeScenePersistenceIdentifier = v5->_relativeScenePersistenceIdentifier;
    v5->_relativeScenePersistenceIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UISSceneOrderedPlacementConfiguration;
  id v4 = a3;
  [(UISScenePlacementConfiguration *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", -[UISSceneOrderedPlacementConfiguration order](self, "order", v6.receiver, v6.super_class), @"kOrderKey");
  v5 = [(UISSceneOrderedPlacementConfiguration *)self relativeScenePersistenceIdentifier];
  [v4 encodeObject:v5 forKey:@"kRelativeScenePersistenceIdentifierKey"];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (UISSceneOrderedPlacementConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UISSceneOrderedPlacementConfiguration;
  v5 = [(UISScenePlacementConfiguration *)&v9 initWithBSXPCCoder:v4];
  if (v5)
  {
    v5->_order = (int64_t *)[v4 decodeInt64ForKey:@"kOrderKey"];
    uint64_t v6 = [v4 decodeStringForKey:@"kRelativeScenePersistenceIdentifierKey"];
    relativeScenePersistenceIdentifier = v5->_relativeScenePersistenceIdentifier;
    v5->_relativeScenePersistenceIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UISSceneOrderedPlacementConfiguration;
  id v4 = a3;
  [(UISScenePlacementConfiguration *)&v6 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", -[UISSceneOrderedPlacementConfiguration order](self, "order", v6.receiver, v6.super_class), @"kOrderKey");
  v5 = [(UISSceneOrderedPlacementConfiguration *)self relativeScenePersistenceIdentifier];
  [v4 encodeObject:v5 forKey:@"kRelativeScenePersistenceIdentifierKey"];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)UISSceneOrderedPlacementConfiguration;
  id v4 = a3;
  v5 = [(UISScenePlacementConfiguration *)&v12 descriptionBuilderWithMultilinePrefix:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__UISSceneOrderedPlacementConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E57351C0;
  id v6 = v5;
  id v10 = v6;
  objc_super v11 = self;
  [v6 appendBodySectionWithName:&stru_1EE28C550 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __79__UISSceneOrderedPlacementConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) relativeScenePersistenceIdentifier];
  [v2 appendString:v3 withName:@"relativeScenePersistenceIdentifier"];

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInt:withName:", objc_msgSend(*(id *)(a1 + 40), "order"), @"order");
}

- (int64_t)order
{
  return self->_order;
}

- (NSString)relativeScenePersistenceIdentifier
{
  return self->_relativeScenePersistenceIdentifier;
}

- (void).cxx_destruct
{
}

@end