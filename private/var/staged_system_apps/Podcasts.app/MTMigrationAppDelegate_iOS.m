@interface MTMigrationAppDelegate_iOS
+ (Class)appDelegateClass;
@end

@implementation MTMigrationAppDelegate_iOS

+ (Class)appDelegateClass
{
  return (Class)objc_opt_class();
}

@end