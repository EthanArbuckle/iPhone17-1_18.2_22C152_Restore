@interface STScreenTimeSettingsUIBundle
+ (NSBundle)bundle;
+ (NSString)restrictionsStringsTable;
@end

@implementation STScreenTimeSettingsUIBundle

+ (NSBundle)bundle
{
  return (NSBundle *)[MEMORY[0x263F086E0] bundleForClass:a1];
}

+ (NSString)restrictionsStringsTable
{
  return (NSString *)@"Restrictions";
}

@end