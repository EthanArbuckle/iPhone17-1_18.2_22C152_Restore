@interface NNMKDirectoryProvider
+ (void)removePairedDeviceRegistryPathFromUserDefaults;
- (NSString)pairedDeviceRegistryPath;
- (void)setPairedDeviceRegistryPath:(id)a3;
@end

@implementation NNMKDirectoryProvider

- (void)setPairedDeviceRegistryPath:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v3 setObject:v5 forKey:@"kPairedDeviceRegistryPathKey"];

    v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v4 synchronize];
  }
  else
  {
    [(id)objc_opt_class() removePairedDeviceRegistryPathFromUserDefaults];
  }
}

- (NSString)pairedDeviceRegistryPath
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v3 = [v2 stringForKey:@"kPairedDeviceRegistryPathKey"];

  return (NSString *)v3;
}

+ (void)removePairedDeviceRegistryPathFromUserDefaults
{
  CFPreferencesSetAppValue(@"kPairedDeviceRegistryPathKey", 0, (CFStringRef)*MEMORY[0x263EFFE48]);
  CFPreferencesSetAppValue(@"kPairedDeviceRegistryPathKey", 0, (CFStringRef)*MEMORY[0x263EFFE60]);
  [MEMORY[0x263EFFA40] resetStandardUserDefaults];
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 removeObjectForKey:@"kPairedDeviceRegistryPathKey"];

  id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v3 synchronize];
}

@end