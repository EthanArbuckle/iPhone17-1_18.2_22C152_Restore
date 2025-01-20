@interface SSVMutablePlayActivityEnqueuerProperties
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)setBuildVersion:(id)a3;
- (void)setDeviceGUID:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setPrivateListeningEnabled:(id)a3;
- (void)setSBEnabled:(BOOL)a3;
- (void)setStoreAccountID:(unint64_t)a3;
- (void)setStoreFrontID:(id)a3;
- (void)setSystemReleaseType:(int64_t)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation SSVMutablePlayActivityEnqueuerProperties

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  return [(SSVPlayActivityEnqueuerProperties *)self _copyWithClass:v5 zone:a3];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  return [(SSVPlayActivityEnqueuerProperties *)self _copyWithClass:v5 zone:a3];
}

- (void)setBuildVersion:(id)a3
{
  if (self->super._buildVersion != a3)
  {
    v4 = (NSString *)[a3 copy];
    buildVersion = self->super._buildVersion;
    self->super._buildVersion = v4;
  }
}

- (void)setDeviceGUID:(id)a3
{
  if (self->super._deviceGUID != a3)
  {
    v4 = (NSString *)[a3 copy];
    deviceGUID = self->super._deviceGUID;
    self->super._deviceGUID = v4;
  }
}

- (void)setDeviceName:(id)a3
{
  if (self->super._deviceName != a3)
  {
    v4 = (NSString *)[a3 copy];
    deviceName = self->super._deviceName;
    self->super._deviceName = v4;
  }
}

- (void)setPrivateListeningEnabled:(id)a3
{
  if (self->super._privateListeningEnabled != a3)
  {
    v4 = (NSNumber *)[a3 copy];
    privateListeningEnabled = self->super._privateListeningEnabled;
    self->super._privateListeningEnabled = v4;
  }
}

- (void)setSBEnabled:(BOOL)a3
{
  self->super._SBEnabled = a3;
}

- (void)setStoreAccountID:(unint64_t)a3
{
  self->super._storeAccountID = a3;
}

- (void)setStoreFrontID:(id)a3
{
  if (self->super._storeFrontID != a3)
  {
    v4 = (NSString *)[a3 copy];
    storeFrontID = self->super._storeFrontID;
    self->super._storeFrontID = v4;
  }
}

- (void)setSystemReleaseType:(int64_t)a3
{
  self->super._systemReleaseType = a3;
}

- (void)setTimeZone:(id)a3
{
  if (self->super._timeZone != a3)
  {
    v4 = (NSTimeZone *)[a3 copy];
    timeZone = self->super._timeZone;
    self->super._timeZone = v4;
  }
}

@end