@interface SBSUIStarkNotificationsSceneSpecification
- (BOOL)isInternal;
- (BOOL)isUIKitManaged;
- (Class)clientSettingsClass;
- (Class)settingsClass;
- (Class)transitionContextClass;
- (id)baseActionHandlers;
- (id)baseSettingsDiffActions;
@end

@implementation SBSUIStarkNotificationsSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (Class)clientSettingsClass
{
  return (Class)objc_opt_class();
}

- (Class)transitionContextClass
{
  return (Class)objc_opt_class();
}

- (id)baseSettingsDiffActions
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)baseActionHandlers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isUIKitManaged
{
  return 1;
}

- (BOOL)isInternal
{
  return 1;
}

@end