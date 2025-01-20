@interface NSUserDefaults(SafariCoreExtras)
+ (id)_safari_browserDefaults;
+ (id)as_developerDefaults;
+ (id)pm_defaults;
+ (id)safari_browserDefaults;
+ (id)safari_browserSharedDefaults;
+ (id)safari_cloudBookmarksDefaults;
+ (id)safari_standardUserDefaultsWithOptimizedKeyValueObserving;
+ (uint64_t)safari_canonicalApplicationDefaults;
+ (uint64_t)safari_notificationNameForUserDefaultsKey:()SafariCoreExtras;
- (WBSUserDefaultObservation)safari_observeValueForKey:()SafariCoreExtras onQueue:notifyForInitialValue:handler:;
- (WBSUserDefaultObservation)safari_observeValuesForKeys:()SafariCoreExtras onQueue:notifyForInitialValue:handler:;
- (double)safari_doubleForKey:()SafariCoreExtras defaultValue:;
- (id)safari_dateForKey:()SafariCoreExtras;
- (id)safari_numberForKey:()SafariCoreExtras;
- (id)safari_stringForKey:()SafariCoreExtras defaultValue:;
- (uint64_t)safari_BOOLForKey:()SafariCoreExtras defaultValue:;
- (uint64_t)safari_enableAdvancedPrivacyProtections:()SafariCoreExtras;
- (uint64_t)safari_toggleBoolAndNotifyForKey:()SafariCoreExtras;
- (uint64_t)safari_toggleBoolForKey:()SafariCoreExtras;
- (void)safari_addStringValue:()SafariCoreExtras toArrayWithKey:;
- (void)safari_incrementNumberForKey:()SafariCoreExtras;
- (void)safari_modifyDictionaryForKey:()SafariCoreExtras block:;
- (void)safari_removeObjectsForKeysWithPrefix:()SafariCoreExtras;
- (void)safari_removeStringValue:()SafariCoreExtras fromArrayWithKey:;
- (void)safari_setBool:()SafariCoreExtras andNotifyForKey:;
- (void)safari_setBool:()SafariCoreExtras forKey:andNotifyWithUserInfo:;
- (void)safari_setInteger:()SafariCoreExtras andNotifyForKey:;
- (void)safari_setObject:()SafariCoreExtras andNotifyForKey:;
@end

@implementation NSUserDefaults(SafariCoreExtras)

- (uint64_t)safari_BOOLForKey:()SafariCoreExtras defaultValue:
{
  id v6 = a3;
  v7 = [a1 objectForKey:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = [a1 BOOLForKey:v6];
  }

  return a4;
}

+ (id)safari_browserDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__NSUserDefaults_SafariCoreExtras__safari_browserDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_browserDefaults_onceToken != -1) {
    dispatch_once(&safari_browserDefaults_onceToken, block);
  }
  v1 = (void *)safari_browserDefaults_userDefaults;
  return v1;
}

- (double)safari_doubleForKey:()SafariCoreExtras defaultValue:
{
  v3 = objc_msgSend(a1, "safari_numberForKey:");
  v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    a2 = v5;
  }

  return a2;
}

- (id)safari_numberForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (WBSUserDefaultObservation)safari_observeValueForKey:()SafariCoreExtras onQueue:notifyForInitialValue:handler:
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = [WBSUserDefaultObservation alloc];
  v17[0] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];

  v15 = [(WBSUserDefaultObservation *)v13 initWithUserDefaults:a1 keys:v14 queue:v11 notifyForInitialValue:a5 handler:v10];
  return v15;
}

+ (uint64_t)safari_notificationNameForUserDefaultsKey:()SafariCoreExtras
{
  return [a3 stringByAppendingString:@"_UserDefaultsNotification"];
}

+ (id)safari_browserSharedDefaults
{
  if (safari_browserSharedDefaults_onceToken != -1) {
    dispatch_once(&safari_browserSharedDefaults_onceToken, &__block_literal_global_31);
  }
  v0 = (void *)safari_browserSharedDefaults_safariSharedDefaults;
  return v0;
}

+ (id)_safari_browserDefaults
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 bundleIdentifier];
  int v2 = [v1 isEqualToString:@"com.apple.mobilesafari"];

  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
LABEL_6:
    double v5 = (void *)v3;
    goto LABEL_8;
  }
  getpid();
  int v4 = sandbox_container_path_for_pid();
  if ((objc_msgSend(v0, "safari_isPasswordsAppBundle") & 1) == 0 && !v4)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.mobilesafari"];
    goto LABEL_6;
  }
  WBSSetUpAccessToAppDataContainerWithIdentifier(@"com.apple.mobilesafari");
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v7 = objc_msgSend(v6, "safari_mobileSafariContainerDirectoryURL");

  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) _initWithSuiteName:@"com.apple.mobilesafari" container:v7];
LABEL_8:

  return v5;
}

- (id)safari_dateForKey:()SafariCoreExtras
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

+ (id)safari_standardUserDefaultsWithOptimizedKeyValueObserving
{
  if (safari_standardUserDefaultsWithOptimizedKeyValueObserving_onceToken != -1) {
    dispatch_once(&safari_standardUserDefaultsWithOptimizedKeyValueObserving_onceToken, &__block_literal_global_17);
  }
  v0 = (void *)safari_standardUserDefaultsWithOptimizedKeyValueObserving_userDefaults;
  return v0;
}

- (uint64_t)safari_enableAdvancedPrivacyProtections:()SafariCoreExtras
{
  uint64_t result = [a1 BOOLForKey:@"EnableEnhancedPrivacyInPrivateBrowsing"];
  if (result && (a3 & 1) == 0)
  {
    return [a1 BOOLForKey:@"EnableEnhancedPrivacyInRegularBrowsing"];
  }
  return result;
}

- (void)safari_incrementNumberForKey:()SafariCoreExtras
{
  id v4 = a3;
  objc_msgSend(a1, "setInteger:forKey:", objc_msgSend(a1, "integerForKey:", v4) + 1, v4);
}

- (uint64_t)safari_toggleBoolForKey:()SafariCoreExtras
{
  id v4 = a3;
  uint64_t v5 = [a1 BOOLForKey:v4] ^ 1;
  [a1 setBool:v5 forKey:v4];

  return v5;
}

+ (id)pm_defaults
{
  if (pm_defaults_onceToken != -1) {
    dispatch_once(&pm_defaults_onceToken, &__block_literal_global_5_0);
  }
  v0 = (void *)pm_defaults_userDefaults;
  return v0;
}

+ (id)as_developerDefaults
{
  if (as_developerDefaults_onceToken != -1) {
    dispatch_once(&as_developerDefaults_onceToken, &__block_literal_global_12);
  }
  v0 = (void *)as_developerDefaults_userDefaults;
  return v0;
}

+ (id)safari_cloudBookmarksDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__NSUserDefaults_SafariCoreExtras__safari_cloudBookmarksDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (safari_cloudBookmarksDefaults_onceToken != -1) {
    dispatch_once(&safari_cloudBookmarksDefaults_onceToken, block);
  }
  v1 = (void *)safari_cloudBookmarksDefaults_defaults;
  return v1;
}

+ (uint64_t)safari_canonicalApplicationDefaults
{
  return [MEMORY[0x1E4F1CB18] standardUserDefaults];
}

- (void)safari_setInteger:()SafariCoreExtras andNotifyForKey:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [a1 setInteger:a3 forKey:v6];
  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v8 = objc_msgSend((id)objc_opt_class(), "safari_notificationNameForUserDefaultsKey:", v6);
  id v11 = v6;
  v9 = [NSNumber numberWithInteger:a3];
  v12[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  [v7 postNotificationName:v8 object:a1 userInfo:v10];
}

- (void)safari_setBool:()SafariCoreExtras andNotifyForKey:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [a1 setBool:a3 forKey:v6];
  v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v8 = objc_msgSend((id)objc_opt_class(), "safari_notificationNameForUserDefaultsKey:", v6);
  id v11 = v6;
  v9 = [NSNumber numberWithBool:a3];
  v12[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  [v7 postNotificationName:v8 object:a1 userInfo:v10];
}

- (void)safari_setBool:()SafariCoreExtras forKey:andNotifyWithUserInfo:
{
  id v8 = a5;
  id v9 = a4;
  [a1 setBool:a3 forKey:v9];
  id v13 = (id)[v8 mutableCopy];

  id v10 = [NSNumber numberWithBool:a3];
  [v13 setObject:v10 forKeyedSubscript:v9];

  id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v12 = objc_msgSend((id)objc_opt_class(), "safari_notificationNameForUserDefaultsKey:", v9);

  [v11 postNotificationName:v12 object:a1 userInfo:v13];
}

- (void)safari_setObject:()SafariCoreExtras andNotifyForKey:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  [a1 setObject:v7 forKey:v6];
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v9 = objc_msgSend((id)objc_opt_class(), "safari_notificationNameForUserDefaultsKey:", v6);
  id v11 = v6;
  v12[0] = v7;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  [v8 postNotificationName:v9 object:a1 userInfo:v10];
}

- (void)safari_modifyDictionaryForKey:()SafariCoreExtras block:
{
  id v6 = a4;
  id v7 = a3;
  id v13 = [a1 dictionaryForKey:v7];
  id v8 = (void *)[v13 mutableCopy];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v11 = v10;

  v6[2](v6, v11);
  id v12 = (void *)[v11 copy];
  [a1 setObject:v12 forKey:v7];
}

- (uint64_t)safari_toggleBoolAndNotifyForKey:()SafariCoreExtras
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(a1, "safari_toggleBoolForKey:", v4);
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v7 = objc_msgSend((id)objc_opt_class(), "safari_notificationNameForUserDefaultsKey:", v4);
  id v11 = v4;
  id v8 = [NSNumber numberWithBool:v5];
  v12[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  [v6 postNotificationName:v7 object:a1 userInfo:v9];
  return v5;
}

- (id)safari_stringForKey:()SafariCoreExtras defaultValue:
{
  id v6 = a4;
  id v7 = [a1 stringForKey:a3];
  if ([v7 length]) {
    id v8 = v7;
  }
  else {
    id v8 = v6;
  }
  id v9 = v8;

  return v9;
}

- (WBSUserDefaultObservation)safari_observeValuesForKeys:()SafariCoreExtras onQueue:notifyForInitialValue:handler:
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[WBSUserDefaultObservation alloc] initWithUserDefaults:a1 keys:v12 queue:v11 notifyForInitialValue:a5 handler:v10];

  return v13;
}

- (void)safari_addStringValue:()SafariCoreExtras toArrayWithKey:
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB18];
  id v6 = a4;
  id v7 = a3;
  objc_msgSend(v5, "safari_browserDefaults");
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v9 = [v14 arrayForKey:v6];
  id v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = MEMORY[0x1E4F1CBF0];
  }
  id v12 = [v8 setWithArray:v11];

  [v12 addObject:v7];
  id v13 = [v12 allObjects];
  [v14 setValue:v13 forKey:v6];
}

- (void)safari_removeStringValue:()SafariCoreExtras fromArrayWithKey:
{
  id v14 = a4;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CB18];
  id v6 = a3;
  id v7 = objc_msgSend(v5, "safari_browserDefaults");
  id v8 = (void *)MEMORY[0x1E4F1CA80];
  uint64_t v9 = [v7 arrayForKey:v14];
  id v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = MEMORY[0x1E4F1CBF0];
  }
  id v12 = [v8 setWithArray:v11];

  [v12 removeObject:v6];
  if ([v12 count])
  {
    id v13 = [v12 allObjects];
    [v7 setValue:v13 forKey:v14];
  }
  else
  {
    [v7 removeObjectForKey:v14];
  }
}

- (void)safari_removeObjectsForKeysWithPrefix:()SafariCoreExtras
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = objc_msgSend(a1, "dictionaryRepresentation", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v10 hasPrefix:v4]) {
          [a1 removeObjectForKey:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

@end