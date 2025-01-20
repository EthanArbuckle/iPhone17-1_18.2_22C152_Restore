@interface WFSecuredPreferences
+ (WFSecuredPreferences)standardPreferences;
- (BOOL)BOOLForKey:(id)a3;
- (NSUserDefaults)userDefaults;
- (WFSecuredPreferences)init;
- (id)objectForKey:(id)a3;
- (void)registerDefaults:(id)a3;
- (void)removeObjectForKey:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setUserDefaults:(id)a3;
- (void)userDefaultsDidChange:(id)a3;
@end

@implementation WFSecuredPreferences

- (void).cxx_destruct
{
}

- (void)setUserDefaults:(id)a3
{
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)userDefaultsDidChange:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"WFSecuredPreferencesDidChangeNotification" object:self];
}

- (void)registerDefaults:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSecuredPreferences *)self userDefaults];
  [v5 registerDefaults:v4];
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(WFSecuredPreferences *)self userDefaults];
  [v7 setBool:v4 forKey:v6];
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSecuredPreferences *)self userDefaults];
  char v6 = [v5 BOOLForKey:v4];

  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSecuredPreferences *)self userDefaults];
  [v5 removeObjectForKey:v4];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFSecuredPreferences *)self userDefaults];
  [v8 setObject:v7 forKey:v6];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSecuredPreferences *)self userDefaults];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (WFSecuredPreferences)init
{
  v10.receiver = self;
  v10.super_class = (Class)WFSecuredPreferences;
  v2 = [(WFSecuredPreferences *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB18] systemShortcutsUserDefaults];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;

    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = *MEMORY[0x1E4F28AC8];
    id v7 = [(WFSecuredPreferences *)v2 userDefaults];
    [v5 addObserver:v2 selector:sel_userDefaultsDidChange_ name:v6 object:v7];

    id v8 = v2;
  }

  return v2;
}

+ (WFSecuredPreferences)standardPreferences
{
  if (standardPreferences_onceToken[0] != -1) {
    dispatch_once(standardPreferences_onceToken, &__block_literal_global_2899);
  }
  v2 = (void *)standardPreferences_standardPreferences;
  return (WFSecuredPreferences *)v2;
}

void __43__WFSecuredPreferences_standardPreferences__block_invoke()
{
  v0 = objc_alloc_init(WFSecuredPreferences);
  v1 = (void *)standardPreferences_standardPreferences;
  standardPreferences_standardPreferences = (uint64_t)v0;
}

@end