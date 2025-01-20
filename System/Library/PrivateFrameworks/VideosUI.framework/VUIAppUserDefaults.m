@interface VUIAppUserDefaults
+ (id)sharedUserDefaults;
- (BOOL)_isWLKDomain:(id)a3;
- (id)dataForKey:(id)a3;
- (void)removeDataForKey:(id)a3;
- (void)setData:(id)a3 forKey:(id)a4;
@end

@implementation VUIAppUserDefaults

- (void)setData:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(VUIAppUserDefaults *)self _isWLKDomain:v6])
  {
    v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
    [v8 setObject:v7 forKey:v6];

    objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
  }
  else
  {
    v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v9 setObject:v7 forKey:v6];

    [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 synchronize];
}

- (id)dataForKey:(id)a3
{
  id v4 = a3;
  if ([(VUIAppUserDefaults *)self _isWLKDomain:v4]) {
    objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
  }
  else {
  v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (BOOL)_isWLKDomain:(id)a3
{
  return [a3 isEqualToString:@"FeatureEnablementAdditionalFlags"];
}

+ (id)sharedUserDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__VUIAppUserDefaults_sharedUserDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedUserDefaults_onceToken != -1) {
    dispatch_once(&sharedUserDefaults_onceToken, block);
  }
  v2 = (void *)sharedUserDefaults_userDefaults;
  return v2;
}

void __40__VUIAppUserDefaults_sharedUserDefaults__block_invoke()
{
  objc_opt_class();
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedUserDefaults_userDefaults;
  sharedUserDefaults_userDefaults = v0;
}

- (void)removeDataForKey:(id)a3
{
  id v4 = a3;
  if ([(VUIAppUserDefaults *)self _isWLKDomain:v4])
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
    [v5 removeObjectForKey:v4];

    objc_msgSend(MEMORY[0x1E4F1CB18], "wlk_userDefaults");
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v6 removeObjectForKey:v4];

    [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 synchronize];
}

@end