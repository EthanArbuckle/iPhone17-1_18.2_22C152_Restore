@interface _UISceneHostingSceneSpecification
- (Class)uiSceneMinimumClass;
- (id)defaultExtensions;
- (id)finalActionHandlers;
- (id)uiSceneSessionRole;
- (id)userActivity;
@end

@implementation _UISceneHostingSceneSpecification

- (id)defaultExtensions
{
  v8[9] = *MEMORY[0x1E4F143B8];
  v8[0] = objc_opt_class();
  v8[1] = objc_opt_class();
  v8[2] = objc_opt_class();
  v8[3] = objc_opt_class();
  v8[4] = objc_opt_class();
  v8[5] = objc_opt_class();
  v8[6] = objc_opt_class();
  v8[7] = objc_opt_class();
  v8[8] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:9];
  v7.receiver = self;
  v7.super_class = (Class)_UISceneHostingSceneSpecification;
  v4 = [(UIApplicationSceneSpecification *)&v7 defaultExtensions];
  v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (Class)uiSceneMinimumClass
{
  return (Class)objc_opt_class();
}

- (id)uiSceneSessionRole
{
  return @"UISceneSessionRoleSceneHosting";
}

- (id)finalActionHandlers
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v9[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  v8.receiver = self;
  v8.super_class = (Class)_UISceneHostingSceneSpecification;
  v5 = [(UIApplicationSceneSpecification *)&v8 finalActionHandlers];
  v6 = [v4 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (id)userActivity
{
  return 0;
}

@end