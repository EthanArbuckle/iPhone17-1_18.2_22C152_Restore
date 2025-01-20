@interface NSUserDefaults(MTUnitTesting)
+ (id)appUserDefaultsForUnitTesting;
+ (id)groupUserDefaultsForUnitTesting;
+ (void)setAppUserDefaultsForUnitTesting:()MTUnitTesting;
+ (void)setGroupUserDefaultsForUnitTesting:()MTUnitTesting;
@end

@implementation NSUserDefaults(MTUnitTesting)

+ (id)appUserDefaultsForUnitTesting
{
  return (id)sAppUserDefaultsForUnitTesting;
}

+ (void)setAppUserDefaultsForUnitTesting:()MTUnitTesting
{
  id v4 = a3;
  if (NSClassFromString(&cfstr_Xctestcase.isa)) {
    objc_storeStrong((id *)&sAppUserDefaultsForUnitTesting, a3);
  }
}

+ (void)setGroupUserDefaultsForUnitTesting:()MTUnitTesting
{
  id v4 = a3;
  if (NSClassFromString(&cfstr_Xctestcase.isa)) {
    objc_storeStrong((id *)&sGroupUserDefaultsForUnitTesting, a3);
  }
}

+ (id)groupUserDefaultsForUnitTesting
{
  return (id)sGroupUserDefaultsForUnitTesting;
}

@end