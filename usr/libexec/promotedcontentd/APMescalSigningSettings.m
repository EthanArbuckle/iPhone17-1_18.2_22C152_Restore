@interface APMescalSigningSettings
+ (id)storageWithDefaultValues:(id)a3;
@end

@implementation APMescalSigningSettings

+ (id)storageWithDefaultValues:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)APSettingsStorageKeychain) initWithDefaultValues:v3];

  return v4;
}

@end