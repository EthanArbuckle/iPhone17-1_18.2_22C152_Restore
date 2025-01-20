@interface UIApplication(SMUPrivate)
+ (id)smu_applicationWillEnterIdleMode;
+ (id)smu_applicationWillExitIdleMode;
@end

@implementation UIApplication(SMUPrivate)

+ (id)smu_applicationWillEnterIdleMode
{
  return (id)*MEMORY[0x263F83CA8];
}

+ (id)smu_applicationWillExitIdleMode
{
  return (id)*MEMORY[0x263F83CB0];
}

@end