@interface UIAutonomousSingleAppModeConfiguration
+ (id)defaultConfiguration;
+ (id)defaultConfigurationForStyle:(unint64_t)a3;
- (BOOL)_BOOLValueForFeatureKey:(id)a3;
- (BOOL)__gaxTrampoline_defaultBoolValueForFeatureKey:(id)a3;
- (BOOL)allowsAccessibilityShortcut;
- (BOOL)allowsAutoLock;
- (BOOL)allowsLockButton;
- (BOOL)automaticallyRelaunchesAfterAppCrash;
- (BOOL)showsUserConfirmationPromptsAndBanners;
- (NSDictionary)managedConfigurationSettings;
- (NSDictionary)propertiesAsDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)style;
- (void)_setBoolValue:(BOOL)a3 forFeatureKey:(id)a4;
- (void)setAllowsAccessibilityShortcut:(BOOL)a3;
- (void)setAllowsAutoLock:(BOOL)a3;
- (void)setAllowsLockButton:(BOOL)a3;
- (void)setAutomaticallyRelaunchesAfterAppCrash:(BOOL)a3;
- (void)setManagedConfigurationSettings:(id)a3;
- (void)setShowsUserConfirmationPromptsAndBanners:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation UIAutonomousSingleAppModeConfiguration

+ (id)defaultConfiguration
{
  return (id)[a1 defaultConfigurationForStyle:2];
}

+ (id)defaultConfigurationForStyle:(unint64_t)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 setStyle:a3];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v5, "setStyle:", -[UIAutonomousSingleAppModeConfiguration style](self, "style"));
  uint64_t v6 = [(NSDictionary *)self->_managedConfigurationSettings copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSMutableDictionary *)self->_propertiesAsDictionary mutableCopy];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)allowsLockButton
{
  return [(UIAutonomousSingleAppModeConfiguration *)self _BOOLValueForFeatureKey:@"AllowsLockButton"];
}

- (void)setAllowsLockButton:(BOOL)a3
{
}

- (BOOL)allowsAutoLock
{
  return [(UIAutonomousSingleAppModeConfiguration *)self _BOOLValueForFeatureKey:@"AllowsAutoLock"];
}

- (void)setAllowsAutoLock:(BOOL)a3
{
}

- (BOOL)allowsAccessibilityShortcut
{
  return [(UIAutonomousSingleAppModeConfiguration *)self _BOOLValueForFeatureKey:@"AllowsAccessibilityShortcut"];
}

- (void)setAllowsAccessibilityShortcut:(BOOL)a3
{
}

- (BOOL)automaticallyRelaunchesAfterAppCrash
{
  return [(UIAutonomousSingleAppModeConfiguration *)self _BOOLValueForFeatureKey:@"AutomaticallyRelaunchesAfterAppCrash"];
}

- (void)setAutomaticallyRelaunchesAfterAppCrash:(BOOL)a3
{
}

- (BOOL)showsUserConfirmationPromptsAndBanners
{
  return [(UIAutonomousSingleAppModeConfiguration *)self _BOOLValueForFeatureKey:@"ShowsUserConfirmationPromptsAndBanners"];
}

- (void)setShowsUserConfirmationPromptsAndBanners:(BOOL)a3
{
}

- (NSDictionary)propertiesAsDictionary
{
  v2 = (void *)[(NSMutableDictionary *)self->_propertiesAsDictionary copy];
  return (NSDictionary *)v2;
}

- (BOOL)_BOOLValueForFeatureKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_propertiesAsDictionary objectForKeyedSubscript:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    char v7 = [v5 BOOLValue];
  }
  else
  {
    +[UIApplication _accessibilityLoadSettingsLoaderIfNeeded];
    char v7 = [(UIAutonomousSingleAppModeConfiguration *)self __gaxTrampoline_defaultBoolValueForFeatureKey:v4];
  }
  BOOL v8 = v7;

  return v8;
}

- (void)_setBoolValue:(BOOL)a3 forFeatureKey:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  if (!self->_propertiesAsDictionary)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    propertiesAsDictionary = self->_propertiesAsDictionary;
    self->_propertiesAsDictionary = v6;
  }
  BOOL v8 = [NSNumber numberWithBool:v4];
  [(NSMutableDictionary *)self->_propertiesAsDictionary setObject:v8 forKeyedSubscript:v9];
}

- (BOOL)__gaxTrampoline_defaultBoolValueForFeatureKey:(id)a3
{
  return 0;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (NSDictionary)managedConfigurationSettings
{
  return self->_managedConfigurationSettings;
}

- (void)setManagedConfigurationSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConfigurationSettings, 0);
  objc_storeStrong((id *)&self->_propertiesAsDictionary, 0);
}

@end