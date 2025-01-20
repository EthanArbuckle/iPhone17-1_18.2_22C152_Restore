@interface HDSHSleepHealthDaemonPlugin
+ (BOOL)shouldLoadPluginForDaemon:(id)a3;
- (NSString)pluginIdentifier;
- (id)extensionForHealthDaemon:(id)a3;
- (id)extensionForProfile:(id)a3;
- (id)taskServerClasses;
@end

@implementation HDSHSleepHealthDaemonPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)(id)*MEMORY[0x263F75F00];
}

+ (BOOL)shouldLoadPluginForDaemon:(id)a3
{
  v3 = [a3 behavior];
  char v4 = [v3 isRealityDevice];

  return v4 ^ 1;
}

- (id)extensionForProfile:(id)a3
{
  id v3 = a3;
  if ([v3 profileType] == 1) {
    char v4 = [[HDSHProfileExtension alloc] initWithProfile:v3];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)extensionForHealthDaemon:(id)a3
{
  return 0;
}

- (id)taskServerClasses
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

@end