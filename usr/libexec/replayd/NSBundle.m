@interface NSBundle
+ (NSBundle)bundleWithPID:(int)a3;
+ (id)_rpFrameworkBundle;
+ (id)_rpLocalizedAppNameFromBundleID:(id)a3;
+ (id)_rpLocalizedStringFromFrameworkBundleWithKey:(id)a3;
+ (id)baseIdentifier:(id)a3;
+ (id)executablePathWithPID:(int)a3;
+ (id)fallbackLanguage;
+ (id)preferredLanguage;
- (id)_rpLocalizedAppName;
@end

@implementation NSBundle

+ (id)_rpFrameworkBundle
{
  if (qword_100099CA8 != -1) {
    dispatch_once(&qword_100099CA8, &stru_100085BD8);
  }
  v2 = (void *)qword_100099CA0;

  return v2;
}

- (id)_rpLocalizedAppName
{
  v3 = [(NSBundle *)self objectForInfoDictionaryKey:_kCFBundleDisplayNameKey];
  if (v3
    || ([(NSBundle *)self objectForInfoDictionaryKey:kCFBundleNameKey],
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = v3;
    v5 = v4;
  }
  else
  {
    id v4 = [(NSBundle *)self objectForInfoDictionaryKey:kCFBundleExecutableKey];
    v5 = 0;
  }

  return v4;
}

+ (id)_rpLocalizedAppNameFromBundleID:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle bundleWithIdentifier:v3];
  id v5 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:0 error:0];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 localizedName];
    v8 = v7;
    if (v7
      && ([v7 isEqualToString:&stru_100087990] & 1) == 0
      && ![v8 isEqualToString:@"$(PRODUCT_BUNDLE_IDENTIFIER)"])
    {
      goto LABEL_8;
    }
  }
  else
  {
    v8 = 0;
  }
  uint64_t v9 = [v4 _rpLocalizedAppName];

  v8 = (void *)v9;
  if (!v9)
  {
LABEL_10:
    id v10 = v3;

    v8 = v10;
    goto LABEL_11;
  }
LABEL_8:
  if (([v8 isEqualToString:&stru_100087990] & 1) != 0
    || [v8 isEqualToString:@"$(PRODUCT_BUNDLE_IDENTIFIER)"])
  {
    goto LABEL_10;
  }
LABEL_11:

  return v8;
}

+ (id)_rpLocalizedStringFromFrameworkBundleWithKey:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle _rpFrameworkBundle];
  v6 = [a1 preferredLanguage];
  v7 = [v5 localizedStringForKey:v4 value:0 table:@"Localizable" localization:v6];

  if (!v7)
  {
    v8 = [a1 fallbackLanguage];
    v7 = [v5 localizedStringForKey:v4 value:0 table:@"Localizable" localization:v8];

    if (!v7)
    {
      v7 = [v5 localizedStringForKey:v4 value:0 table:@"Localizable"];
    }
  }

  return v7;
}

+ (id)fallbackLanguage
{
  v2 = +[NSLocale preferredLanguages];
  id v3 = [v2 firstObject];
  id v4 = [v3 componentsSeparatedByString:@"-"];
  id v5 = [v4 firstObject];

  return v5;
}

+ (id)preferredLanguage
{
  v2 = +[NSLocale preferredLanguages];
  id v3 = [(id)objc_opt_class() _rpFrameworkBundle];
  id v4 = [v3 localizations];
  id v5 = +[NSBundle preferredLocalizationsFromArray:v4 forPreferences:v2];

  v6 = [v5 firstObject];

  return v6;
}

+ (id)baseIdentifier:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"."];
  id v4 = [v3 mutableCopy];

  [v4 removeLastObject];
  id v5 = [v4 componentsJoinedByString:@"."];

  return v5;
}

+ (id)executablePathWithPID:(int)a3
{
  id v3 = [objc_alloc((Class)NSString) initWithBytes:buffer length:proc_pidpath(a3, buffer, 0x1000u) encoding:4];

  return v3;
}

+ (NSBundle)bundleWithPID:(int)a3
{
  id v3 = +[NSBundle executablePathWithPID:*(void *)&a3];
  id v4 = +[NSURL fileURLWithPath:v3];

  if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446722;
    uint64_t v9 = "+[NSBundle(RPExtensions) bundleWithPID:]";
    __int16 v10 = 1024;
    int v11 = 115;
    __int16 v12 = 2112;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d  executableURL:%@", (uint8_t *)&v8, 0x1Cu);
  }
  if (v4)
  {
    id v5 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446722;
      uint64_t v9 = "+[NSBundle(RPExtensions) bundleWithPID:]";
      __int16 v10 = 1024;
      int v11 = 119;
      __int16 v12 = 2112;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d  bundleURL:%@", (uint8_t *)&v8, 0x1Cu);
    }
    if (v5)
    {
      v6 = +[NSBundle bundleWithURL:v5];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return (NSBundle *)v6;
}

@end