@interface TPSLocalizedString
+ (NSBundle)classBundle;
+ (NSString)localizationTableName;
+ (id)localizedStringForKey:(id)a3;
+ (id)localizedStringFromTable:(id)a3 forKey:(id)a4;
@end

@implementation TPSLocalizedString

+ (NSBundle)classBundle
{
  v2 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v3 = objc_opt_class();
  return (NSBundle *)[v2 bundleForClass:v3];
}

+ (NSString)localizationTableName
{
  return (NSString *)@"TelephonyPreferences";
}

+ (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  v5 = [a1 localizationTableName];
  v6 = [a1 localizedStringFromTable:v5 forKey:v4];

  return v6;
}

+ (id)localizedStringFromTable:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 classBundle];
  v9 = [v8 localizedStringForKey:v6 value:&stru_1F40BEF98 table:v7];

  return v9;
}

@end