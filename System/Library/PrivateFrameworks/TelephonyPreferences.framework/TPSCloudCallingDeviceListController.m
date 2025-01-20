@interface TPSCloudCallingDeviceListController
- (NSArray)deviceSwitchSpecifiers;
- (PSSpecifier)devicesGroupSpecifier;
- (PSSpecifier)mainGroupSpecifier;
- (PSSpecifier)mainSwitchSpecifier;
- (TPSCloudCallingDeviceController)deviceController;
- (TPSCloudCallingDeviceListController)init;
- (id)isDeviceSwitchOn:(id)a3;
- (id)isMainSwitchOn:(id)a3;
- (id)specifiers;
- (void)cloudCallingDeviceController:(id)a3 didChangeDevices:(id)a4;
- (void)setDeviceSwitchOn:(id)a3 specifier:(id)a4;
- (void)setDeviceSwitchSpecifiers:(id)a3;
- (void)setMainSwitchOn:(id)a3 specifier:(id)a4;
@end

@implementation TPSCloudCallingDeviceListController

- (TPSCloudCallingDeviceListController)init
{
  v6.receiver = self;
  v6.super_class = (Class)TPSCloudCallingDeviceListController;
  v2 = [(TPSCloudCallingDeviceListController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(TPSCloudCallingDeviceController);
    deviceController = v2->_deviceController;
    v2->_deviceController = v3;

    [(TPSCloudCallingDeviceController *)v2->_deviceController setDelegate:v2];
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1CA48] array];
    objc_super v6 = [(TPSCloudCallingDeviceListController *)self mainGroupSpecifier];
    [v5 addObject:v6];

    v7 = [(TPSCloudCallingDeviceListController *)self mainSwitchSpecifier];
    [v5 addObject:v7];

    v8 = [(TPSCloudCallingDeviceListController *)self deviceSwitchSpecifiers];
    if ([v8 count])
    {
      v9 = [(TPSCloudCallingDeviceListController *)self devicesGroupSpecifier];
      [v5 addObject:v9];

      [v5 addObjectsFromArray:v8];
    }

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (PSSpecifier)devicesGroupSpecifier
{
  devicesGroupSpecifier = self->_devicesGroupSpecifier;
  if (!devicesGroupSpecifier)
  {
    v4 = +[TPSLocalizedString localizedStringForKey:@"CLOUD_CALLING_DEVICE_LIST_DEVICES_GROUP_TITLE"];
    v5 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"CLOUD_CALLING_DEVICE_LIST_DEVICES_GROUP_ID" name:v4];
    objc_super v6 = self->_devicesGroupSpecifier;
    self->_devicesGroupSpecifier = v5;

    devicesGroupSpecifier = self->_devicesGroupSpecifier;
  }
  return devicesGroupSpecifier;
}

- (NSArray)deviceSwitchSpecifiers
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  deviceSwitchSpecifiers = self->_deviceSwitchSpecifiers;
  if (!deviceSwitchSpecifiers)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [MEMORY[0x1E4FADA88] cloudCallingDevices];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v21 != v6) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ([v8 supportsRestrictingSecondaryCalling])
          {
            v9 = NSString;
            v10 = [v8 name];
            v11 = objc_msgSend(v8, "tps_modelName");
            v12 = [v9 stringWithFormat:@"%@ (%@)", v10, v11];

            v13 = [MEMORY[0x1E4F92E70] preferenceSpecifierNamed:v12 target:self set:sel_setDeviceSwitchOn_specifier_ get:sel_isDeviceSwitchOn_ detail:0 cell:6 edit:0];
            v14 = [v8 uniqueID];
            [v13 setIdentifier:v14];

            [v18 addObject:v13];
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v5);
    }
    v15 = (NSArray *)[v18 copy];
    v16 = self->_deviceSwitchSpecifiers;
    self->_deviceSwitchSpecifiers = v15;

    deviceSwitchSpecifiers = self->_deviceSwitchSpecifiers;
  }
  return deviceSwitchSpecifiers;
}

- (PSSpecifier)mainGroupSpecifier
{
  mainGroupSpecifier = self->_mainGroupSpecifier;
  if (!mainGroupSpecifier)
  {
    uint64_t v4 = [MEMORY[0x1E4F92E70] groupSpecifierWithID:@"CLOUD_CALLING_DEVICE_LIST_MAIN_GROUP_ID"];
    uint64_t v5 = self->_mainGroupSpecifier;
    self->_mainGroupSpecifier = v4;

    mainGroupSpecifier = self->_mainGroupSpecifier;
  }
  return mainGroupSpecifier;
}

- (PSSpecifier)mainSwitchSpecifier
{
  mainSwitchSpecifier = self->_mainSwitchSpecifier;
  if (!mainSwitchSpecifier)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F92E70];
    uint64_t v5 = +[TPSLocalizedString localizedStringForKey:@"CLOUD_CALLING_DEVICE_LIST_MAIN_SWITCH_TITLE"];
    uint64_t v6 = [v4 preferenceSpecifierNamed:v5 target:self set:sel_setMainSwitchOn_specifier_ get:sel_isMainSwitchOn_ detail:0 cell:6 edit:0];
    v7 = self->_mainSwitchSpecifier;
    self->_mainSwitchSpecifier = v6;

    [(PSSpecifier *)self->_mainSwitchSpecifier setIdentifier:@"CLOUD_CALLING_DEVICE_LIST_MAIN_SWITCH_ID"];
    mainSwitchSpecifier = self->_mainSwitchSpecifier;
  }
  return mainSwitchSpecifier;
}

- (id)isDeviceSwitchOn:(id)a3
{
  return (id)[NSNumber numberWithBool:1];
}

- (void)setDeviceSwitchOn:(id)a3 specifier:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F930F0];
  id v7 = a4;
  id v8 = a3;
  id v11 = [v7 propertyForKey:v6];
  uint64_t v9 = [v8 BOOLValue];

  [v11 setOn:v9 animated:1];
  v10 = [(TPSCloudCallingDeviceListController *)self cachedCellForSpecifier:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v10 setLoading:1];
  }
}

- (id)isMainSwitchOn:(id)a3
{
  return (id)[NSNumber numberWithBool:1];
}

- (void)setMainSwitchOn:(id)a3 specifier:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F930F0];
  id v7 = a4;
  id v8 = a3;
  id v11 = [v7 propertyForKey:v6];
  uint64_t v9 = [v8 BOOLValue];

  [v11 setOn:v9 animated:1];
  v10 = [(TPSCloudCallingDeviceListController *)self cachedCellForSpecifier:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v10 setLoading:1];
  }
}

- (void)cloudCallingDeviceController:(id)a3 didChangeDevices:(id)a4
{
  uint64_t v5 = TPSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4DD4000, v5, OS_LOG_TYPE_DEFAULT, "Cloud calling devices have changed. Reloading specifiers.", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__TPSCloudCallingDeviceListController_cloudCallingDeviceController_didChangeDevices___block_invoke;
  block[3] = &unk_1E6EB2258;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __85__TPSCloudCallingDeviceListController_cloudCallingDeviceController_didChangeDevices___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDeviceSwitchSpecifiers:0];
  v2 = *(void **)(a1 + 32);
  return [v2 reloadSpecifiers];
}

- (TPSCloudCallingDeviceController)deviceController
{
  return self->_deviceController;
}

- (void)setDeviceSwitchSpecifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSwitchSpecifiers, 0);
  objc_storeStrong((id *)&self->_deviceController, 0);
  objc_storeStrong((id *)&self->_mainSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_mainGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_devicesGroupSpecifier, 0);
}

@end