@interface PBUIPosterWallpaperMigrationInfo
- (char)homeProvider;
- (char)lockProvider;
- (char)pairingType;
- (id)_initWithPairingType:(char)a3 lockProvider:(char)a4 homeProvider:(char)a5;
- (id)description;
@end

@implementation PBUIPosterWallpaperMigrationInfo

- (id)_initWithPairingType:(char)a3 lockProvider:(char)a4 homeProvider:(char)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PBUIPosterWallpaperMigrationInfo;
  id result = [(PBUIPosterWallpaperMigrationInfo *)&v9 init];
  if (result)
  {
    *((unsigned char *)result + 8) = a3;
    *((unsigned char *)result + 9) = a4;
    *((unsigned char *)result + 10) = a5;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = PBUIStringForPosterWallpaperPairingType(self->_pairingType);
  v7 = PBUIStringForPosterWallpaperMigrationProvider(self->_lockProvider);
  v8 = PBUIStringForPosterWallpaperMigrationProvider(self->_homeProvider);
  objc_super v9 = [v3 stringWithFormat:@"<%@:%p pairing=%@ lockProvider=%@ homeProvider=%@>", v5, self, v6, v7, v8];

  return v9;
}

- (char)pairingType
{
  return self->_pairingType;
}

- (char)lockProvider
{
  return self->_lockProvider;
}

- (char)homeProvider
{
  return self->_homeProvider;
}

@end