@interface MSDLanguageAndRegionHelper
+ (id)sharedInstance;
- (BOOL)_isCurrentDeviceLanguage:(id)a3 andRegion:(id)a4;
- (id)_systemLocalizedLanguageCodeFromArray:(id)a3;
- (id)getCurrentDeviceLanguage;
- (id)getCurrentDevicePreferredLanguage;
- (id)getCurrentDeviceRegion;
- (id)getCurrentLocaleCode;
- (int)setDeviceLanguage:(id)a3 andRegion:(id)a4;
@end

@implementation MSDLanguageAndRegionHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_shared_0;
  return v2;
}

uint64_t __44__MSDLanguageAndRegionHelper_sharedInstance__block_invoke()
{
  sharedInstance_shared_0 = objc_alloc_init(MSDLanguageAndRegionHelper);
  return MEMORY[0x270F9A758]();
}

- (int)setDeviceLanguage:(id)a3 andRegion:(id)a4
{
  v20[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v20[0] = v6;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  v9 = [(MSDLanguageAndRegionHelper *)self _systemLocalizedLanguageCodeFromArray:v8];

  v10 = defaultLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543874;
    id v15 = v6;
    __int16 v16 = 2114;
    v17 = v9;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_23911B000, v10, OS_LOG_TYPE_DEFAULT, "Setting device language to %{public}@ (%{public}@) and region code to %{public}@.", (uint8_t *)&v14, 0x20u);
  }

  if ([(MSDLanguageAndRegionHelper *)self _isCurrentDeviceLanguage:v9 andRegion:v7])
  {
    v11 = defaultLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543874;
      id v15 = v6;
      __int16 v16 = 2114;
      v17 = v9;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl(&dword_23911B000, v11, OS_LOG_TYPE_DEFAULT, "Device already has language %{public}@ (%{public}@) and region %{public}@", (uint8_t *)&v14, 0x20u);
    }

    int v12 = 2;
  }
  else
  {
    [MEMORY[0x263F50750] setRegion:v7];
    [MEMORY[0x263F50750] setLanguage:v9];
    int v12 = 0;
  }

  return v12;
}

- (id)getCurrentDeviceLanguage
{
  v3 = [MEMORY[0x263EFF960] preferredLanguages];
  v4 = [(MSDLanguageAndRegionHelper *)self _systemLocalizedLanguageCodeFromArray:v3];

  return v4;
}

- (id)getCurrentDevicePreferredLanguage
{
  v2 = [MEMORY[0x263EFF960] preferredLanguages];
  v3 = [v2 firstObject];

  return v3;
}

- (id)getCurrentDeviceRegion
{
  v2 = [MEMORY[0x263EFF960] currentLocale];
  v3 = [v2 countryCode];

  return v3;
}

- (id)getCurrentLocaleCode
{
  v3 = NSString;
  v4 = [(MSDLanguageAndRegionHelper *)self getCurrentDevicePreferredLanguage];
  v5 = [(MSDLanguageAndRegionHelper *)self getCurrentDeviceRegion];
  id v6 = [v3 stringWithFormat:@"%@_%@", v4, v5];

  return v6;
}

- (BOOL)_isCurrentDeviceLanguage:(id)a3 andRegion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(MSDLanguageAndRegionHelper *)self getCurrentDeviceLanguage];
  int v9 = [v8 isEqualToString:v7];

  if (v9)
  {
    v10 = [(MSDLanguageAndRegionHelper *)self getCurrentDeviceRegion];
    char v11 = [v10 isEqualToString:v6];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)_systemLocalizedLanguageCodeFromArray:(id)a3
{
  v3 = (void *)MEMORY[0x263F086E0];
  v4 = (void *)MEMORY[0x263EFF960];
  id v5 = a3;
  id v6 = [v4 systemLanguages];
  id v7 = [v3 preferredLocalizationsFromArray:v6 forPreferences:v5];

  v8 = [v7 firstObject];

  return v8;
}

@end