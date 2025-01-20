@interface SCUIResources
+ (id)localizedStringForKey:(id)a3;
+ (id)mainBundle;
@end

@implementation SCUIResources

+ (id)mainBundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 bundleForClass:v3];
}

+ (id)localizedStringForKey:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() mainBundle];
  v5 = [v4 localizedStringForKey:v3 value:&stru_270980950 table:@"SensitiveContentAnalysisLocalizable"];

  return v5;
}

@end