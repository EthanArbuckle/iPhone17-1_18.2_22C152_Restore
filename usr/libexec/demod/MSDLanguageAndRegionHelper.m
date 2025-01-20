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
  if (qword_100189D38 != -1) {
    dispatch_once(&qword_100189D38, &stru_1001542B0);
  }
  v2 = (void *)qword_100189D30;

  return v2;
}

- (int)setDeviceLanguage:(id)a3 andRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v20 = v6;
  v8 = +[NSArray arrayWithObjects:&v20 count:1];
  v9 = [(MSDLanguageAndRegionHelper *)self _systemLocalizedLanguageCodeFromArray:v8];

  v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543874;
    id v15 = v6;
    __int16 v16 = 2114;
    v17 = v9;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting device language to %{public}@ (%{public}@) and region code to %{public}@.", (uint8_t *)&v14, 0x20u);
  }

  if ([(MSDLanguageAndRegionHelper *)self _isCurrentDeviceLanguage:v9 andRegion:v7])
  {
    v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543874;
      id v15 = v6;
      __int16 v16 = 2114;
      v17 = v9;
      __int16 v18 = 2114;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Device already has language %{public}@ (%{public}@) and region %{public}@", (uint8_t *)&v14, 0x20u);
    }

    int v12 = 2;
  }
  else
  {
    +[IPSettingsUtilities setRegion:v7];
    +[IPSettingsUtilities setLanguage:v9];
    int v12 = 0;
  }

  return v12;
}

- (id)getCurrentDeviceLanguage
{
  v3 = +[NSLocale preferredLanguages];
  v4 = [(MSDLanguageAndRegionHelper *)self _systemLocalizedLanguageCodeFromArray:v3];

  return v4;
}

- (id)getCurrentDevicePreferredLanguage
{
  v2 = +[NSLocale preferredLanguages];
  v3 = [v2 firstObject];

  return v3;
}

- (id)getCurrentDeviceRegion
{
  v2 = +[NSLocale currentLocale];
  v3 = [v2 countryCode];

  return v3;
}

- (id)getCurrentLocaleCode
{
  v3 = [(MSDLanguageAndRegionHelper *)self getCurrentDevicePreferredLanguage];
  v4 = [(MSDLanguageAndRegionHelper *)self getCurrentDeviceRegion];
  v5 = +[NSString stringWithFormat:@"%@_%@", v3, v4];

  return v5;
}

- (BOOL)_isCurrentDeviceLanguage:(id)a3 andRegion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(MSDLanguageAndRegionHelper *)self getCurrentDeviceLanguage];
  unsigned int v9 = [v8 isEqualToString:v7];

  if (v9)
  {
    v10 = [(MSDLanguageAndRegionHelper *)self getCurrentDeviceRegion];
    unsigned __int8 v11 = [v10 isEqualToString:v6];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)_systemLocalizedLanguageCodeFromArray:(id)a3
{
  id v3 = a3;
  v4 = +[NSLocale systemLanguages];
  v5 = +[NSBundle preferredLocalizationsFromArray:v4 forPreferences:v3];

  id v6 = [v5 firstObject];

  return v6;
}

@end