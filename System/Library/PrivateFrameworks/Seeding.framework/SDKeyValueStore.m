@interface SDKeyValueStore
+ (NSDictionary)devicesDictionary;
+ (id)deviceDictionaryForDeviceIdentifier:(id)a3;
+ (void)insertOrUpdateDevice:(id)a3;
+ (void)synchronize;
@end

@implementation SDKeyValueStore

+ (NSDictionary)devicesDictionary
{
  if (_os_feature_enabled_impl())
  {
    id v3 = a1;
    objc_sync_enter(v3);
    v4 = [MEMORY[0x1E4F29130] defaultStore];
    [v4 synchronize];
    v5 = [v4 dictionaryForKey:@"BetaDevices"];

    objc_sync_exit(v3);
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CC08];
  }
  return (NSDictionary *)v5;
}

+ (id)deviceDictionaryForDeviceIdentifier:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = a1;
    objc_sync_enter(v5);
    v6 = [v5 devicesDictionary];
    v7 = [v6 objectForKey:v4];

    objc_sync_exit(v5);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v7;
}

+ (void)insertOrUpdateDevice:(id)a3
{
  id v12 = a3;
  if (_os_feature_enabled_impl())
  {
    id v4 = a1;
    objc_sync_enter(v4);
    id v5 = (void *)MEMORY[0x1E4F1CA60];
    v6 = [v4 devicesDictionary];
    v7 = [v5 dictionaryWithDictionary:v6];

    v8 = [v12 dictionaryRepresentation];
    v9 = [v12 identifier];
    [v7 setObject:v8 forKey:v9];

    v10 = [MEMORY[0x1E4F29130] defaultStore];
    [v10 setDictionary:v7 forKey:@"BetaDevices"];

    v11 = [MEMORY[0x1E4F29130] defaultStore];
    [v11 synchronize];

    objc_sync_exit(v4);
  }
}

+ (void)synchronize
{
  if (_os_feature_enabled_impl())
  {
    id obj = a1;
    objc_sync_enter(obj);
    id v3 = [MEMORY[0x1E4F29130] defaultStore];
    [v3 synchronize];

    objc_sync_exit(obj);
  }
}

@end