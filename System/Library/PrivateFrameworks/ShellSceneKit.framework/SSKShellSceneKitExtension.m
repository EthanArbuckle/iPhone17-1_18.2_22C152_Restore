@interface SSKShellSceneKitExtension
+ (id)clientComponents;
+ (id)clientSettingsExtensions;
+ (id)hostComponents;
+ (id)settingsExtensions;
+ (id)transitionContextExtensions;
@end

@implementation SSKShellSceneKitExtension

+ (id)settingsExtensions
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)clientSettingsExtensions
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)transitionContextExtensions
{
  return 0;
}

+ (id)hostComponents
{
  return (id)MEMORY[0x263EFFA68];
}

+ (id)clientComponents
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end