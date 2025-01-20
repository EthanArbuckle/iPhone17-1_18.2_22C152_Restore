@interface CSFolderMonitorBackgroundScanningConfiguration
- (BOOL)allowBattery;
- (CSFolderMonitorBackgroundScanningConfiguration)initWithFileProtectionType:(id)a3 allowBattery:(BOOL)a4 periodInseconds:(unint64_t)a5;
- (NSString)fileProtectionType;
- (unint64_t)periodInSeconds;
- (void)setAllowBattery:(BOOL)a3;
- (void)setPeriodInSeconds:(unint64_t)a3;
@end

@implementation CSFolderMonitorBackgroundScanningConfiguration

- (CSFolderMonitorBackgroundScanningConfiguration)initWithFileProtectionType:(id)a3 allowBattery:(BOOL)a4 periodInseconds:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSFolderMonitorBackgroundScanningConfiguration;
  v10 = [(CSFolderMonitorBackgroundScanningConfiguration *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_fileProtectionType, a3);
    v11->_allowBattery = a4;
    v11->_periodInSeconds = a5;
  }

  return v11;
}

- (NSString)fileProtectionType
{
  return self->_fileProtectionType;
}

- (BOOL)allowBattery
{
  return self->_allowBattery;
}

- (void)setAllowBattery:(BOOL)a3
{
  self->_allowBattery = a3;
}

- (unint64_t)periodInSeconds
{
  return self->_periodInSeconds;
}

- (void)setPeriodInSeconds:(unint64_t)a3
{
  self->_periodInSeconds = a3;
}

- (void).cxx_destruct
{
}

@end