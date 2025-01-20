@interface SBUISystemUISceneContinuitySceneSpecification
- (Class)uiSceneMinimumClass;
- (id)defaultExtensions;
- (id)uiSceneSessionRole;
@end

@implementation SBUISystemUISceneContinuitySceneSpecification

- (Class)uiSceneMinimumClass
{
  return NSClassFromString(&cfstr_Uiwindowscene.isa);
}

- (id)defaultExtensions
{
  v8.receiver = self;
  v8.super_class = (Class)SBUISystemUISceneContinuitySceneSpecification;
  v2 = [(UIApplicationSceneSpecification *)&v8 defaultExtensions];
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }
  v5 = v4;

  v6 = [v5 arrayByAddingObject:objc_opt_class()];

  return v6;
}

- (id)uiSceneSessionRole
{
  return @"SBUIWindowSceneSessionRoleSystemUISceneContinuity";
}

@end