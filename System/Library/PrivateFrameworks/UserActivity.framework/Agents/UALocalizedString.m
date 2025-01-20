@interface UALocalizedString
+ (id)_UABundle;
+ (id)localizedStringForKey:(id)a3 comment:(id)a4;
@end

@implementation UALocalizedString

+ (id)localizedStringForKey:(id)a3 comment:(id)a4
{
  id v4 = a3;
  v5 = sub_10000BA18(@"Localization");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Looking for localized string for key: %@", (uint8_t *)&v16, 0xCu);
  }

  v6 = +[UALocalizedString _UABundle];
  v7 = [v6 localizations];
  v8 = +[NSLocale preferredLanguages];
  v9 = +[NSBundle preferredLocalizationsFromArray:v7 forPreferences:v8];

  if ([v9 count])
  {
    v10 = [v9 objectAtIndexedSubscript:0];
    v11 = [v6 pathForResource:@"Localizable" ofType:@"strings" inDirectory:@"." forLocalization:v10];
    id v12 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v11];
    v13 = [v12 objectForKey:v4];
    if (!v13)
    {
      v14 = sub_10000BA18(@"Localization");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Falling back to NSLocalizedString", (uint8_t *)&v16, 2u);
      }

      v13 = [v6 localizedStringForKey:v4 value:&stru_1000C6800 table:@"Localizable"];
    }
  }
  else
  {
    id v12 = 0;
    v13 = 0;
  }

  return v13;
}

+ (id)_UABundle
{
  return +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/UserActivity.framework"];
}

@end