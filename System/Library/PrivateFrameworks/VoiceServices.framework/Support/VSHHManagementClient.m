@interface VSHHManagementClient
+ (VSHHManagementClient)sharedInstance;
- (BOOL)isExistingAccessoryId:(id)a3;
- (void)cleanUnknownAccessoriesPreferences;
@end

@implementation VSHHManagementClient

+ (VSHHManagementClient)sharedInstance
{
  return 0;
}

- (BOOL)isExistingAccessoryId:(id)a3
{
  id v3 = a3;
  objc_exception_throw(0);
}

- (void)cleanUnknownAccessoriesPreferences
{
}

@end