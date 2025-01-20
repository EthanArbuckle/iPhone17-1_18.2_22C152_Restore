@interface _UIWindowSceneOrderedPlacement
+ (id)orderedPlacementAbove:(id)a3;
+ (id)orderedPlacementBelow:(id)a3;
+ (unint64_t)_placementType;
- (BOOL)isEqual:(id)a3;
- (UISScenePlacementConfiguration)config;
- (id)_createConfigurationWithError:(id *)a3;
- (id)_initWithConfiguration:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)setConfig:(id)a3;
@end

@implementation _UIWindowSceneOrderedPlacement

+ (unint64_t)_placementType
{
  return 7;
}

- (id)_initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIWindowSceneOrderedPlacement;
  v6 = [(UIWindowScenePlacement *)&v9 _init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(v6 + 1, a3);
  }

  return v7;
}

+ (id)orderedPlacementAbove:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4FB3438];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 _persistenceIdentifier];

  v8 = (void *)[v6 initWithOrder:0 relativeScenePersistenceIdentifer:v7];
  objc_super v9 = (void *)[objc_alloc((Class)a1) _initWithConfiguration:v8];

  return v9;
}

+ (id)orderedPlacementBelow:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4FB3438];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = [v5 _persistenceIdentifier];

  v8 = (void *)[v6 initWithOrder:1 relativeScenePersistenceIdentifer:v7];
  objc_super v9 = (void *)[objc_alloc((Class)a1) _initWithConfiguration:v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIWindowSceneOrderedPlacement;
  id v4 = [(UIWindowScenePlacement *)&v8 copyWithZone:a3];
  id v5 = [(_UIWindowSceneOrderedPlacement *)self config];
  id v6 = (void *)[v5 copy];
  [v4 setConfig:v6];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIWindowSceneOrderedPlacement;
  if ([(UIWindowScenePlacement *)&v9 isEqual:v4])
  {
    id v5 = [v4 config];
    id v6 = [(_UIWindowSceneOrderedPlacement *)self config];
    char v7 = [v6 isEqual:v5];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)_createConfigurationWithError:(id *)a3
{
  return self->_config;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_UIWindowSceneOrderedPlacement;
  id v4 = a3;
  id v5 = [(UIWindowScenePlacement *)&v12 descriptionBuilderWithMultilinePrefix:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72___UIWindowSceneOrderedPlacement_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:&stru_1ED0E84C0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

- (UISScenePlacementConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
}

@end