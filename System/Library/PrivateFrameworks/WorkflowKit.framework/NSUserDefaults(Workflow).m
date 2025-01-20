@interface NSUserDefaults(Workflow)
+ (id)lastAppShortcutUpdateDate;
+ (id)simulatedFeatureFlagState:()Workflow;
+ (id)siriAssistantUserDefaults;
+ (id)systemShortcutsUserDefaults;
+ (id)workflowUserDefaults;
+ (uint64_t)allowActionsFromAllBundles;
+ (uint64_t)initialBiomeStreamWrites;
+ (uint64_t)remoteWidgetConfigurationEnabled;
+ (uint64_t)showAllAppIntents;
+ (uint64_t)toolKitIndexingEnabled;
+ (uint64_t)universalPreviewsEnabled;
+ (uint64_t)watchAutomationEnabled;
+ (void)setSimulatedStateForTesting:()Workflow forFeatureFlag:;
@end

@implementation NSUserDefaults(Workflow)

+ (id)simulatedFeatureFlagState:()Workflow
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&WFFeatureFlagTestingLock);
  v4 = WFGetFeatureFlagTestingTable();
  v5 = [v4 objectForKeyedSubscript:v3];

  os_unfair_lock_unlock((os_unfair_lock_t)&WFFeatureFlagTestingLock);
  return v5;
}

+ (id)systemShortcutsUserDefaults
{
  if (systemShortcutsUserDefaults_onceToken != -1) {
    dispatch_once(&systemShortcutsUserDefaults_onceToken, &__block_literal_global_319);
  }
  v0 = (void *)systemShortcutsUserDefaults_systemShortcutsUserDefaults;
  return v0;
}

+ (id)workflowUserDefaults
{
  if (workflowUserDefaults_onceToken != -1) {
    dispatch_once(&workflowUserDefaults_onceToken, &__block_literal_global_789);
  }
  v0 = (void *)workflowUserDefaults_workflowUserDefaults;
  return v0;
}

+ (id)lastAppShortcutUpdateDate
{
  v1 = [a1 systemShortcutsUserDefaults];
  v2 = [v1 objectForKey:@"WFLastAppShortcutUpdateDateKey"];

  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (uint64_t)showAllAppIntents
{
  v1 = [a1 systemShortcutsUserDefaults];
  v2 = [v1 stringForKey:@"WFShortcutsDrawerVisibilityLevelKey"];
  uint64_t v3 = [v2 isEqualToString:@"Everything"];

  return v3;
}

+ (uint64_t)toolKitIndexingEnabled
{
  v1 = [a1 systemShortcutsUserDefaults];
  uint64_t v2 = [v1 BOOLForKey:@"WFToolKitIndexingEnabled"];

  return v2;
}

+ (uint64_t)initialBiomeStreamWrites
{
  v1 = [a1 systemShortcutsUserDefaults];
  uint64_t v2 = [v1 BOOLForKey:@"WFInitialBiomeStreamWritesKey"];

  return v2;
}

+ (uint64_t)remoteWidgetConfigurationEnabled
{
  v0 = [MEMORY[0x1E4F1CB18] simulatedFeatureFlagState:@"remote_widget_configuration"];
  v1 = v0;
  if (v0) {
    uint64_t v2 = [v0 BOOLValue];
  }
  else {
    uint64_t v2 = _os_feature_enabled_impl();
  }
  uint64_t v3 = v2;

  return v3;
}

+ (uint64_t)watchAutomationEnabled
{
  v0 = [MEMORY[0x1E4F1CB18] simulatedFeatureFlagState:@"watch_automation"];
  v1 = v0;
  if (v0) {
    uint64_t v2 = [v0 BOOLValue];
  }
  else {
    uint64_t v2 = _os_feature_enabled_impl();
  }
  uint64_t v3 = v2;

  return v3;
}

+ (uint64_t)allowActionsFromAllBundles
{
  v1 = [a1 systemShortcutsUserDefaults];
  uint64_t v2 = [v1 BOOLForKey:@"WFAllowActionsFromAllBundles"];

  return v2;
}

+ (uint64_t)universalPreviewsEnabled
{
  v0 = [MEMORY[0x1E4F1CB18] simulatedFeatureFlagState:@"universal_previews"];
  v1 = v0;
  if (v0) {
    uint64_t v2 = [v0 BOOLValue];
  }
  else {
    uint64_t v2 = _os_feature_enabled_impl();
  }
  uint64_t v3 = v2;

  return v3;
}

+ (void)setSimulatedStateForTesting:()Workflow forFeatureFlag:
{
  id v7 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&WFFeatureFlagTestingLock);
  v5 = [NSNumber numberWithBool:a3];
  v6 = WFGetFeatureFlagTestingTable();
  [v6 setObject:v5 forKeyedSubscript:v7];

  os_unfair_lock_unlock((os_unfair_lock_t)&WFFeatureFlagTestingLock);
}

+ (id)siriAssistantUserDefaults
{
  if (siriAssistantUserDefaults_onceToken != -1) {
    dispatch_once(&siriAssistantUserDefaults_onceToken, &__block_literal_global_334);
  }
  v0 = (void *)siriAssistantUserDefaults_siriAssistantUserDefaults;
  return v0;
}

@end