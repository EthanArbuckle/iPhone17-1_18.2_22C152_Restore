@interface SBSUISystemNotesSceneSpecification
- (Class)clientSettingsClass;
- (Class)settingsClass;
- (Class)uiSceneMinimumClass;
- (id)initialActionHandlers;
- (id)uiSceneSessionRole;
@end

@implementation SBSUISystemNotesSceneSpecification

- (Class)clientSettingsClass
{
  return (Class)self;
}

- (Class)settingsClass
{
  return (Class)self;
}

- (id)uiSceneSessionRole
{
  return @"SBSUIWindowSceneSessionRoleSystemNotes";
}

- (Class)uiSceneMinimumClass
{
  return (Class)self;
}

- (id)initialActionHandlers
{
  v6.receiver = self;
  v6.super_class = (Class)SBSUISystemNotesSceneSpecification;
  v2 = [(UIApplicationSceneSpecification *)&v6 initialActionHandlers];
  v3 = objc_alloc_init(SBSUISystemNotesWindowSceneBSActionsHandler);
  v4 = [v2 arrayByAddingObject:v3];

  return v4;
}

@end