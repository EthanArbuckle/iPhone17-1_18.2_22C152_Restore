@interface APServerConfigurationSettings
+ (id)storageWithDefaultValues:(id)a3;
- (NSDictionary)serverConfig;
- (id)_loadServerConfig;
@end

@implementation APServerConfigurationSettings

+ (id)storageWithDefaultValues:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)APSettingsStorageKeychain) initWithDefaultValues:v3];

  return v4;
}

- (id)_loadServerConfig
{
  v2 = [(APServerConfigurationSettings *)self serverConfigRecord];
  if ([v2 count])
  {
    +[NSMutableDictionary dictionary];
    v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    v9 = sub_10009B300;
    v10 = &unk_100234FE0;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v2 count]];
    id v3 = v12;
    id v4 = v11;
    [v2 enumerateKeysAndObjectsUsingBlock:&v7];
    id v5 = [v3 copy:v7, v8, v9, v10];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSDictionary)serverConfig
{
  id v4 = [(APServerConfigurationSettings *)self _loadServerConfig];

  return (NSDictionary *)v4;
}

@end