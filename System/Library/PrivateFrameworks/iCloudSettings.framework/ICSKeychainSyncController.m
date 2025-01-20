@interface ICSKeychainSyncController
+ (BOOL)isKeychainSyncEnabled;
@end

@implementation ICSKeychainSyncController

+ (BOOL)isKeychainSyncEnabled
{
  return [MEMORY[0x263F343A0] isUserVisibleKeychainSyncEnabled];
}

@end