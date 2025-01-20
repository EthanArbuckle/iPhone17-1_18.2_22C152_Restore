@interface FBSSceneSpecification(UIKitSceneSpecification)
- (__CFString)uiSceneSessionRole;
- (uint64_t)_transitionContextHandlers;
- (uint64_t)affectsAppLifecycleIfInternal;
- (uint64_t)affectsScreenOrientation;
- (uint64_t)allowsConfigurationByAppDelegate;
- (uint64_t)baseSceneComponentClassDictionary;
- (uint64_t)connectionHandlers;
- (uint64_t)coreSceneComponentClassDictionary;
- (uint64_t)disconnectionHandlers;
- (uint64_t)finalActionHandlers;
- (uint64_t)finalSettingsDiffActions;
- (uint64_t)initialActionHandlers;
- (uint64_t)initialSettingsDiffActions;
- (uint64_t)isInternal;
- (uint64_t)isUIKitManaged;
- (uint64_t)lifecycleMonitorClass;
- (uint64_t)sceneSubstrateClass;
- (uint64_t)uiSceneMinimumClass;
@end

@implementation FBSSceneSpecification(UIKitSceneSpecification)

- (uint64_t)initialSettingsDiffActions
{
  return MEMORY[0x1E4F1CBF0];
}

- (uint64_t)initialActionHandlers
{
  return MEMORY[0x1E4F1CBF0];
}

- (uint64_t)finalSettingsDiffActions
{
  return MEMORY[0x1E4F1CBF0];
}

- (uint64_t)allowsConfigurationByAppDelegate
{
  return 1;
}

- (uint64_t)_transitionContextHandlers
{
  return MEMORY[0x1E4F1CBF0];
}

- (uint64_t)finalActionHandlers
{
  return MEMORY[0x1E4F1CBF0];
}

- (uint64_t)coreSceneComponentClassDictionary
{
  return MEMORY[0x1E4F1CC08];
}

- (uint64_t)baseSceneComponentClassDictionary
{
  return MEMORY[0x1E4F1CC08];
}

- (__CFString)uiSceneSessionRole
{
  return @"UIWindowSceneSessionRoleApplication";
}

- (uint64_t)connectionHandlers
{
  return MEMORY[0x1E4F1CBF0];
}

- (uint64_t)disconnectionHandlers
{
  return MEMORY[0x1E4F1CBF0];
}

- (uint64_t)isUIKitManaged
{
  return 0;
}

- (uint64_t)lifecycleMonitorClass
{
  return 0;
}

- (uint64_t)sceneSubstrateClass
{
  return objc_opt_class();
}

- (uint64_t)uiSceneMinimumClass
{
  return self;
}

- (uint64_t)isInternal
{
  return 1;
}

- (uint64_t)affectsAppLifecycleIfInternal
{
  return 0;
}

- (uint64_t)affectsScreenOrientation
{
  return 1;
}

@end