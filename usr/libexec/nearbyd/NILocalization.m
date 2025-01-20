@interface NILocalization
+ (id)_niFrameworkBundle;
+ (id)_niLocalizedStringFromBundle:(id)a3 withKey:(id)a4;
+ (id)_niLocalizedStringFromFrameworkBundleWithKey:(id)a3;
+ (id)fallbackBundle;
+ (id)fallbackBundleWithBundle:(id)a3;
+ (id)localizedBundle;
+ (id)localizedBundleWithBundle:(id)a3;
@end

@implementation NILocalization

+ (id)_niFrameworkBundle
{
  if (qword_1008A57B0 != -1) {
    dispatch_once(&qword_1008A57B0, &stru_10085B820);
  }
  v2 = (void *)qword_1008A57A8;

  return v2;
}

+ (id)_niLocalizedStringFromFrameworkBundleWithKey:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() localizedBundle];
  v5 = [v4 localizedStringForKey:v3 value:0 table:0];

  if (!v5)
  {
    v6 = [(id)objc_opt_class() fallbackBundle];
    v5 = [v6 localizedStringForKey:v3 value:0 table:0];

    if (!v5)
    {
      v7 = [(id)objc_opt_class() _niFrameworkBundle];
      v5 = [v7 localizedStringForKey:v3 value:0 table:0];
    }
  }

  return v5;
}

+ (id)fallbackBundle
{
  v2 = objc_opt_class();
  id v3 = [(id)objc_opt_class() _niFrameworkBundle];
  v4 = [v2 fallbackBundleWithBundle:v3];

  return v4;
}

+ (id)localizedBundle
{
  v2 = objc_opt_class();
  id v3 = [(id)objc_opt_class() _niFrameworkBundle];
  v4 = [v2 localizedBundleWithBundle:v3];

  return v4;
}

+ (id)_niLocalizedStringFromBundle:(id)a3 withKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [(id)objc_opt_class() localizedBundleWithBundle:v5];
  v8 = [v7 localizedStringForKey:v6 value:0 table:0];

  if (!v8)
  {
    v9 = [(id)objc_opt_class() fallbackBundleWithBundle:v5];
    v8 = [v9 localizedStringForKey:v6 value:0 table:0];

    if (!v8)
    {
      v8 = [v5 localizedStringForKey:v6 value:0 table:0];
    }
  }

  return v8;
}

+ (id)fallbackBundleWithBundle:(id)a3
{
  id v3 = a3;
  v4 = +[NSLocale preferredLanguages];
  id v5 = [v4 firstObject];
  id v6 = [v5 componentsSeparatedByString:@"-"];
  v7 = [v6 firstObject];

  v8 = [v3 pathForResource:@"Localizable" ofType:@"strings" inDirectory:0 forLocalization:v7];

  v9 = [v8 stringByDeletingLastPathComponent];
  v10 = +[NSBundle bundleWithPath:v9];

  return v10;
}

+ (id)localizedBundleWithBundle:(id)a3
{
  id v3 = a3;
  v4 = +[NSLocale preferredLanguages];
  id v5 = [(id)objc_opt_class() _niFrameworkBundle];
  id v6 = [v5 localizations];
  v7 = +[NSBundle preferredLocalizationsFromArray:v6 forPreferences:v4];

  v8 = [v3 resourcePath];

  v9 = [v7 firstObject];
  v10 = +[NSString stringWithFormat:@"%@.lproj", v9];

  v11 = [v8 stringByAppendingPathComponent:v10];
  v12 = +[NSBundle bundleWithPath:v11];

  return v12;
}

@end