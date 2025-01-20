@interface APMediaServiceSettings
+ (id)storageWithDefaultValues:(id)a3;
@end

@implementation APMediaServiceSettings

+ (id)storageWithDefaultValues:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)APSettingsStorageUserDefaults) initWithDefaultValues:v3];

  return v4;
}

@end