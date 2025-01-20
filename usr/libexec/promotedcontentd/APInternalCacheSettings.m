@interface APInternalCacheSettings
+ (id)storageWithDefaultValues:(id)a3;
- (double)diagnosticsIntervalValue;
@end

@implementation APInternalCacheSettings

+ (id)storageWithDefaultValues:(id)a3
{
  id v3 = [objc_alloc((Class)APSettingsStorageUserDefaults) initWithDefaultValues:&off_10024B4F8];

  return v3;
}

- (double)diagnosticsIntervalValue
{
  v2 = [(APInternalCacheSettings *)self diagnosticsInterval];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

@end