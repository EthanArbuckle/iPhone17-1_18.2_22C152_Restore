@interface UIQuickLookInternalSceneSpecification
- (BOOL)affectsAppLifecycleIfInternal;
- (BOOL)isInternal;
- (id)initialActionHandlers;
- (id)uiSceneSessionRole;
@end

@implementation UIQuickLookInternalSceneSpecification

- (id)uiSceneSessionRole
{
  return @"UISceneSessionRoleQuickLook";
}

- (id)initialActionHandlers
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v9[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v8.receiver = self;
  v8.super_class = (Class)UIQuickLookInternalSceneSpecification;
  v5 = [(UIApplicationSceneSpecification *)&v8 initialActionHandlers];
  v6 = [v4 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (BOOL)isInternal
{
  return 1;
}

- (BOOL)affectsAppLifecycleIfInternal
{
  return 1;
}

@end