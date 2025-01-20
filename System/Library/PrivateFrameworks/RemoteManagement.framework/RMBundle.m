@interface RMBundle
+ (NSBundle)remoteManagementBundle;
+ (int64_t)managementScope;
+ (void)setManagementScope:(int64_t)a3;
@end

@implementation RMBundle

+ (void)setManagementScope:(int64_t)a3
{
  _managementScope = a3;
}

+ (int64_t)managementScope
{
  return _managementScope;
}

+ (NSBundle)remoteManagementBundle
{
  return (NSBundle *)[MEMORY[0x263F086E0] bundleForClass:a1];
}

@end