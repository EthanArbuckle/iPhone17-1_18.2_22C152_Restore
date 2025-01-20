@interface SUSettingsScanOptions
- (BOOL)allowUnrestrictedCellularDownload;
- (BOOL)clientIsBuddy;
- (SDDevice)currentSeedingDevice;
- (SUScanOptions)scanOptions;
- (SUSettingsScanOptions)init;
- (SUSettingsScanOptions)initWithScanOptions:(id)a3;
- (void)setAllowUnrestrictedCellularDownload:(BOOL)a3;
- (void)setClientIsBuddy:(BOOL)a3;
- (void)setCurrentSeedingDevice:(id)a3;
- (void)setScanOptions:(id)a3;
@end

@implementation SUSettingsScanOptions

- (SUSettingsScanOptions)init
{
  v4 = 0;
  v4 = -[SUSettingsScanOptions initWithScanOptions:](self, "initWithScanOptions:");
  v3 = v4;
  objc_storeStrong((id *)&v4, 0);
  return v3;
}

- (SUSettingsScanOptions)initWithScanOptions:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)SUSettingsScanOptions;
  v8 = [(SUSettingsScanOptions *)&v9 init];
  v11 = v8;
  objc_storeStrong((id *)&v11, v8);
  if (v8)
  {
    if (!location[0])
    {
      id v4 = objc_alloc_init(MEMORY[0x263F78240]);
      id v5 = location[0];
      location[0] = v4;

      [location[0] setForced:1];
      [location[0] setIdentifier:@"com.apple.Preferences.software_update"];
    }
    [(SUSettingsScanOptions *)v11 setScanOptions:location[0]];
  }
  v7 = v11;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (SUScanOptions)scanOptions
{
  return self->_scanOptions;
}

- (void)setScanOptions:(id)a3
{
}

- (BOOL)allowUnrestrictedCellularDownload
{
  return self->_allowUnrestrictedCellularDownload;
}

- (void)setAllowUnrestrictedCellularDownload:(BOOL)a3
{
  self->_allowUnrestrictedCellularDownload = a3;
}

- (SDDevice)currentSeedingDevice
{
  return (SDDevice *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentSeedingDevice:(id)a3
{
}

- (BOOL)clientIsBuddy
{
  return self->_clientIsBuddy;
}

- (void)setClientIsBuddy:(BOOL)a3
{
  self->_clientIsBuddy = a3;
}

- (void).cxx_destruct
{
}

@end