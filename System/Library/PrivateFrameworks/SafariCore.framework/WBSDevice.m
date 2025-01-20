@interface WBSDevice
+ (WBSDevice)currentDevice;
- (NSString)deviceTypeIdentifier;
- (NSString)userAssignedName;
- (NSString)userUniqueDeviceIdentifier;
- (WBSDevice)init;
- (int)deviceClass;
- (void)_setUserAssignedName:(id)a3;
- (void)dealloc;
- (void)registerForNotifications;
- (void)test_setUserAssignedName:(id)a3;
- (void)unregisterForNotifications;
@end

@implementation WBSDevice

+ (WBSDevice)currentDevice
{
  if (currentDevice_onceToken != -1) {
    dispatch_once(&currentDevice_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)currentDevice_currentDevice;
  return (WBSDevice *)v2;
}

uint64_t __26__WBSDevice_currentDevice__block_invoke()
{
  v0 = objc_alloc_init(WBSDevice);
  v1 = (void *)currentDevice_currentDevice;
  currentDevice_currentDevice = (uint64_t)v0;

  v2 = (void *)currentDevice_currentDevice;
  return [v2 registerForNotifications];
}

- (WBSDevice)init
{
  v5.receiver = self;
  v5.super_class = (Class)WBSDevice;
  v2 = [(WBSDevice *)&v5 init];
  if (v2)
  {
    v2->_deviceClass = MGGetSInt32Answer();
    v3 = v2;
  }

  return v2;
}

- (NSString)userAssignedName
{
  userAssignedName = self->_userAssignedName;
  if (!userAssignedName)
  {
    v4 = (NSString *)MGCopyAnswer();
    objc_super v5 = self->_userAssignedName;
    self->_userAssignedName = v4;

    userAssignedName = self->_userAssignedName;
    if (!userAssignedName)
    {
      switch(self->_deviceClass)
      {
        case 1:
          v6 = @"iPhone";
          goto LABEL_8;
        case 3:
          v6 = @"iPad";
          goto LABEL_8;
        case 4:
          v6 = @"Apple TV";
          goto LABEL_8;
        case 6:
          v6 = @"Apple Watch";
LABEL_8:
          _WBSLocalizedString(v6, &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
          v7 = (NSString *)objc_claimAutoreleasedReturnValue();
          v8 = self->_userAssignedName;
          self->_userAssignedName = v7;

          break;
        default:
          break;
      }
      userAssignedName = self->_userAssignedName;
    }
  }
  v9 = userAssignedName;
  return v9;
}

- (void)registerForNotifications
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (!self->_notificationToken)
  {
    objc_initWeak(&location, self);
    v6[0] = @"UserAssignedDeviceName";
    [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    id v3 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v4, &location);
    self->_notificationToken = (MGNotificationTokenStruct *)MGRegisterForUpdates();

    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  if (self->_notificationToken) {
    MGCancelNotifications();
  }
  v3.receiver = self;
  v3.super_class = (Class)WBSDevice;
  [(WBSDevice *)&v3 dealloc];
}

- (NSString)userUniqueDeviceIdentifier
{
  userUniqueDeviceIdentifier = self->_userUniqueDeviceIdentifier;
  if (!userUniqueDeviceIdentifier)
  {
    id v4 = (NSString *)MGGetStringAnswer();
    objc_super v5 = self->_userUniqueDeviceIdentifier;
    self->_userUniqueDeviceIdentifier = v4;

    userUniqueDeviceIdentifier = self->_userUniqueDeviceIdentifier;
    if (!userUniqueDeviceIdentifier)
    {
      v6 = [MEMORY[0x1E4F29128] UUID];
      v7 = [v6 UUIDString];
      v8 = self->_userUniqueDeviceIdentifier;
      self->_userUniqueDeviceIdentifier = v7;

      userUniqueDeviceIdentifier = self->_userUniqueDeviceIdentifier;
    }
  }
  v9 = userUniqueDeviceIdentifier;
  return v9;
}

void __37__WBSDevice_registerForNotifications__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    int v4 = [a2 isEqualToString:@"UserAssignedDeviceName"];
    id WeakRetained = v6;
    if (v4)
    {
      objc_super v5 = (void *)MGCopyAnswer();
      [v6 _setUserAssignedName:v5];

      id WeakRetained = v6;
    }
  }
}

- (void)unregisterForNotifications
{
  if (self->_notificationToken) {
    MGCancelNotifications();
  }
}

- (NSString)deviceTypeIdentifier
{
  deviceTypeIdentifier = self->_deviceTypeIdentifier;
  if (!deviceTypeIdentifier)
  {
    int v4 = [MEMORY[0x1E4F442D8] _typeOfCurrentDevice];
    objc_super v5 = [v4 identifier];
    v6 = self->_deviceTypeIdentifier;
    self->_deviceTypeIdentifier = v5;

    deviceTypeIdentifier = self->_deviceTypeIdentifier;
  }
  return deviceTypeIdentifier;
}

- (void)test_setUserAssignedName:(id)a3
{
  id v4 = a3;
  if (+[WBSFeatureAvailability isInternalInstall]) {
    [(WBSDevice *)self _setUserAssignedName:v4];
  }
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (void)_setUserAssignedName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAssignedName, 0);
  objc_storeStrong((id *)&self->_userUniqueDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceTypeIdentifier, 0);
}

@end