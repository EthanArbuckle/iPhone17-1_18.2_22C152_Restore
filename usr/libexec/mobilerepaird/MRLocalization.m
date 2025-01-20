@interface MRLocalization
- (id)localizedStringWithKey:(id)a3 defaultString:(id)a4;
@end

@implementation MRLocalization

- (id)localizedStringWithKey:(id)a3 defaultString:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/CoreRepairKit.framework"];
  v8 = [v7 localizations];
  v9 = +[NSLocale preferredLanguages];
  v10 = +[NSBundle preferredLocalizationsFromArray:v8 forPreferences:v9];

  v11 = [v10 objectAtIndexedSubscript:0];
  v12 = [v7 localizedStringForKey:v6 value:@"NOTFOUND" table:@"Localizable" localization:v11];

  if ([v12 isEqualToString:@"NOTFOUND"])
  {
    id v13 = v5;

    v12 = v13;
  }

  return v12;
}

@end