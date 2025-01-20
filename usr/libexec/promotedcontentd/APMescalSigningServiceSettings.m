@interface APMescalSigningServiceSettings
+ (id)storageWithDefaultValues:(id)a3;
- (BOOL)useAMSMescal;
- (NSNumber)useAMSMescalObject;
- (void)setUseAMSMescal:(BOOL)a3;
- (void)setUseAMSMescalObject:(id)a3;
@end

@implementation APMescalSigningServiceSettings

+ (id)storageWithDefaultValues:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)APSettingsStorageKeychain) initWithDefaultValues:v3];

  return v4;
}

- (BOOL)useAMSMescal
{
  id v3 = [(APMescalSigningServiceSettings *)self useAMSMescalObject];

  if (!v3) {
    return 1;
  }
  id v4 = [(APMescalSigningServiceSettings *)self useAMSMescalObject];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (void)setUseAMSMescal:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(APMescalSigningServiceSettings *)self setUseAMSMescalObject:v4];
}

- (NSNumber)useAMSMescalObject
{
  return self->_useAMSMescalObject;
}

- (void)setUseAMSMescalObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end