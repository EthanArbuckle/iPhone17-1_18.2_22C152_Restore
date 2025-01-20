@interface SFAirDropDiscoveryController
- (BOOL)isCellularUsageEnabled;
- (BOOL)isLegacyDevice;
- (BOOL)isLegacyModeEnabled;
- (BOOL)isLegacyModeSettable;
- (BOOL)isNearbySharingEnabled;
- (BOOL)isNearbySharingSupported;
- (BOOL)isStoreDemoMode;
- (BOOL)isTimeLimitedEveryoneMode;
- (BOOL)isVisible;
- (SFAirDropDiscoveryAlertControllerDelegate)alertControllerDelegate;
- (SFAirDropDiscoveryController)init;
- (SFAirDropDiscoveryControllerDelegate)delegate;
- (id)discoverableModeAlertController;
- (id)discoverableModeToString:(int64_t)a3;
- (int64_t)discoverableMode;
- (int64_t)operationDiscoverableModeToInteger:(id)a3;
- (void)dealloc;
- (void)didChangeRadioState:(BOOL)a3;
- (void)handleOperationCallback:(__SFOperation *)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)invalidate;
- (void)isNearbySharingSupported;
- (void)setAlertControllerDelegate:(id)a3;
- (void)setCellularUsageEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDiscoverableMode:(int64_t)a3;
- (void)setLegacyModeEnabled:(BOOL)a3;
- (void)setNearbySharingEnabled:(BOOL)a3;
- (void)startNFCMonitoring;
- (void)updateAlertControllerTitle;
@end

@implementation SFAirDropDiscoveryController

- (SFAirDropDiscoveryController)init
{
  v8.receiver = self;
  v8.super_class = (Class)SFAirDropDiscoveryController;
  v2 = [(SFAirDropDiscoveryController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    objc_storeWeak(&v2->_delegate, 0);
    v3->_isVisible = 1;
    *(_WORD *)&v3->_isLegacyModeEnabled = 0;
    alertController = v3->_alertController;
    v3->_alertController = 0;

    objc_storeWeak(&v3->_alertControllerDelegate, 0);
    v5 = (SFWirelessSettingsController *)objc_alloc_init(MEMORY[0x263F6C2E8]);
    settingsController = v3->_settingsController;
    v3->_settingsController = v5;

    [(SFWirelessSettingsController *)v3->_settingsController setDelegate:v3];
    v3->_isLegacyDevice = SFDeviceSupportsAirDrop() ^ 1;
    v3->_discoverableMode = 0;
    v3->_controller = (__SFOperation *)SFOperationCreate();
    SFOperationSetClient();
    SFOperationSetDispatchQueue();
    SFOperationResume();
  }
  return v3;
}

- (void)handleOperationCallback:(__SFOperation *)a3 event:(int64_t)a4 withResults:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a5;
  objc_super v8 = v7;
  if (a4 == 10)
  {
    v12 = airdrop_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SFAirDropDiscoveryController handleOperationCallback:event:withResults:](v8, v12);
    }
  }
  else if (a4 == 12)
  {
    v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263F6C420]];
    self->_isLegacyDevice = [v9 BOOLValue];

    v10 = [v8 objectForKeyedSubscript:*MEMORY[0x263F6C428]];
    self->_isLegacyModeEnabled = [v10 BOOLValue];

    v11 = [v8 objectForKeyedSubscript:*MEMORY[0x263F6C430]];
    self->_isLegacyModeSettable = [v11 BOOLValue];

    v12 = [v8 objectForKeyedSubscript:*MEMORY[0x263F6C3C0]];
    v13 = airdrop_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412290;
      v24 = v12;
      _os_log_impl(&dword_21DB23000, v13, OS_LOG_TYPE_DEFAULT, "Discoverable mode changed to %@", (uint8_t *)&v23, 0xCu);
    }

    if (v12)
    {
      self->_isVisible = [v12 isEqual:*MEMORY[0x263F6C3B0]] ^ 1;
      self->_discoverableMode = [(SFAirDropDiscoveryController *)self operationDiscoverableModeToInteger:v12];
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        id v16 = objc_loadWeakRetained(&self->_delegate);
        [v16 discoveryControllerVisibilityDidChange:self];
      }
      id v17 = objc_loadWeakRetained(&self->_delegate);
      char v18 = objc_opt_respondsToSelector();

      if (v18)
      {
        id v19 = objc_loadWeakRetained(&self->_delegate);
        [v19 discoveryControllerSettingsDidChange:self];
      }
    }
    id v20 = objc_loadWeakRetained(&self->_delegate);
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v22 = objc_loadWeakRetained(&self->_delegate);
      [v22 discoveryControllerLegacyModePropertiesDidChange:self];
    }
  }
  else
  {
    v12 = airdrop_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SFAirDropDiscoveryController handleOperationCallback:event:withResults:](a4, (uint64_t)v8, v12);
    }
  }
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (BOOL)isTimeLimitedEveryoneMode
{
  return MEMORY[0x270F63718](self, a2);
}

- (BOOL)isLegacyDevice
{
  return self->_isLegacyDevice;
}

- (BOOL)isLegacyModeEnabled
{
  return self->_isLegacyModeEnabled;
}

- (void)setLegacyModeEnabled:(BOOL)a3
{
  if (self->_isLegacyModeEnabled != a3)
  {
    BOOL v3 = a3;
    v4 = airdrop_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[SFAirDropDiscoveryController setLegacyModeEnabled:](v3, v4);
    }

    [NSNumber numberWithBool:v3];
    SFOperationSetProperty();
  }
}

- (BOOL)isLegacyModeSettable
{
  return self->_isLegacyModeSettable;
}

- (BOOL)isStoreDemoMode
{
  if (isStoreDemoMode_onceToken != -1) {
    dispatch_once(&isStoreDemoMode_onceToken, &__block_literal_global_5);
  }
  return isStoreDemoMode_result;
}

uint64_t __47__SFAirDropDiscoveryController_isStoreDemoMode__block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"StoreDemoMode", @"com.apple.demo-settings", &keyExistsAndHasValidFormat);
  isStoreDemoMode_uint64_t result = result != 0;
  return result;
}

- (BOOL)isNearbySharingSupported
{
  BOOL v3 = [(objc_class *)getNFHardwareManagerClass() sharedHardwareManagerWithNoUI];
  id v14 = 0;
  int v4 = [v3 areFeaturesSupported:1 outError:&v14];
  id v5 = v14;

  if (v5)
  {
    v6 = airdrop_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SFAirDropDiscoveryController isNearbySharingSupported]();
    }

    goto LABEL_10;
  }
  if (!v4)
  {
LABEL_10:
    BOOL v10 = 0;
    goto LABEL_11;
  }
  uint64_t v13 = 0;
  id v7 = [(objc_class *)getNFHardwareManagerClass() sharedHardwareManagerWithNoUI];
  objc_super v8 = [v7 getRadioEnabledState:&v13];

  if (v8)
  {
    v9 = airdrop_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SFAirDropDiscoveryController isNearbySharingSupported]();
    }

    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = v13 == 1;
  }

LABEL_11:
  if ([(SFAirDropDiscoveryController *)self isStoreDemoMode])
  {
    v11 = airdrop_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_21DB23000, v11, OS_LOG_TYPE_DEFAULT, "Nearby sharing not supported for store demo devices", (uint8_t *)&v13, 2u);
    }

    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isNearbySharingEnabled
{
  return [MEMORY[0x263F6C1C0] nearFieldSharingEnabled];
}

- (void)setNearbySharingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F6C1C0] nearFieldSharingEnabled] != a3)
  {
    int v4 = airdrop_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_21DB23000, v4, OS_LOG_TYPE_DEFAULT, "Changing nearby sharing enabled to %d", (uint8_t *)v5, 8u);
    }

    [MEMORY[0x263F6C1C0] setNearFieldSharingEnabled:v3];
    notify_post((const char *)[(id)*MEMORY[0x263F6C360] UTF8String]);
  }
}

- (void)startNFCMonitoring
{
  id v3 = [(objc_class *)getNFHardwareManagerClass() sharedHardwareManagerWithNoUI];
  [v3 registerEventListener:self];
}

- (BOOL)isCellularUsageEnabled
{
  return [MEMORY[0x263F6C1C0] cellularUsageEnabled];
}

- (void)setCellularUsageEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F6C1C0] cellularUsageEnabled] != a3)
  {
    int v4 = airdrop_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_21DB23000, v4, OS_LOG_TYPE_DEFAULT, "Changing cellular usage enabled to %d", (uint8_t *)v5, 8u);
    }

    [MEMORY[0x263F6C1C0] setCellularUsageEnabled:v3];
    notify_post((const char *)[(id)*MEMORY[0x263F6C358] UTF8String]);
  }
}

- (void)dealloc
{
  [(SFAirDropDiscoveryController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SFAirDropDiscoveryController;
  [(SFAirDropDiscoveryController *)&v3 dealloc];
}

- (void)invalidate
{
  if (self->_controller)
  {
    SFOperationCancel();
    CFRelease(self->_controller);
    self->_controller = 0;
  }
  [(SFWirelessSettingsController *)self->_settingsController setDelegate:0];
  [(SFWirelessSettingsController *)self->_settingsController invalidate];
  id v3 = [(objc_class *)getNFHardwareManagerClass() sharedHardwareManagerWithNoUI];
  [v3 unregisterEventListener:self];
}

- (void)updateAlertControllerTitle
{
  if ([(SFWirelessSettingsController *)self->_settingsController deviceSupportsWAPI])
  {
    int v3 = [(SFWirelessSettingsController *)self->_settingsController isWifiEnabled];
    int v4 = [(SFWirelessSettingsController *)self->_settingsController isBluetoothEnabled];
    SFLocalizedStringForKey();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v3) {
      BOOL v5 = v4 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      uint64_t v6 = SFLocalizedStringForKey();
      id v7 = NSString;
      objc_super v8 = SFLocalizedStringForKey();
      v9 = objc_msgSend(v7, "stringWithFormat:", v8, v10, v6);

      [(UIAlertController *)self->_alertController setTitle:v9];
    }
    else
    {
      [(UIAlertController *)self->_alertController setTitle:v10];
    }
  }
}

- (id)discoverableModeAlertController
{
  alertController = self->_alertController;
  if (!alertController)
  {
    int v4 = [(objc_class *)getUMUserManagerClass() sharedManager];
    v30 = v4;
    if ([v4 isMultiUser])
    {
      BOOL v5 = [v4 currentUser];
      BOOL v6 = [v5 userType] == 1;
    }
    else
    {
      BOOL v6 = 0;
    }
    v31 = SFLocalizedStringForKey();
    id v7 = SFLocalizedStringForKey();
    objc_super v8 = SFLocalizedStringForKey();
    v9 = SFLocalizedStringForKey();
    v29 = SFLocalizedStringForKey();
    objc_msgSend(MEMORY[0x263F82418], "alertControllerWithTitle:message:preferredStyle:");
    id v10 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
    v11 = self->_alertController;
    self->_alertController = v10;

    [(SFAirDropDiscoveryController *)self updateAlertControllerTitle];
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x3032000000;
    v46[3] = __Block_byref_object_copy_;
    v46[4] = __Block_byref_object_dispose_;
    v47 = 0;
    v47 = self;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x3032000000;
    v44[3] = __Block_byref_object_copy_;
    v44[4] = __Block_byref_object_dispose_;
    v45 = 0;
    v45 = self->_alertController;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke;
    aBlock[3] = &unk_264472580;
    aBlock[4] = v46;
    aBlock[5] = v44;
    v12 = _Block_copy(aBlock);
    uint64_t v13 = self->_alertController;
    id v14 = (void *)MEMORY[0x263F82400];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke_2;
    v41[3] = &unk_2644725A8;
    id v15 = v12;
    id v42 = v15;
    id v16 = [v14 actionWithTitle:v7 style:1 handler:v41];
    [(UIAlertController *)v13 addAction:v16];

    id v17 = self->_alertController;
    char v18 = (void *)MEMORY[0x263F82400];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke_3;
    v38[3] = &unk_2644725D0;
    v40 = v46;
    id v19 = v15;
    id v39 = v19;
    id v20 = [v18 actionWithTitle:v31 style:0 handler:v38];
    [(UIAlertController *)v17 addAction:v20];

    if (!v6)
    {
      char v21 = self->_alertController;
      id v22 = (void *)MEMORY[0x263F82400];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke_4;
      v35[3] = &unk_2644725D0;
      v37 = v46;
      id v36 = v19;
      int v23 = [v22 actionWithTitle:v9 style:0 handler:v35];
      [(UIAlertController *)v21 addAction:v23];
    }
    v24 = self->_alertController;
    uint64_t v25 = (void *)MEMORY[0x263F82400];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke_5;
    v32[3] = &unk_2644725D0;
    v34 = v46;
    id v26 = v19;
    id v33 = v26;
    v27 = [v25 actionWithTitle:v8 style:0 handler:v32];
    [(UIAlertController *)v24 addAction:v27];

    _Block_object_dispose(v44, 8);
    _Block_object_dispose(v46, 8);

    alertController = self->_alertController;
  }
  return alertController;
}

void __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) alertControllerDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) alertControllerDelegate];
    [v4 discoveryController:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) alertControllerDidDismiss:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

uint64_t __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDiscoverableMode:0];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

uint64_t __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDiscoverableMode:1];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

uint64_t __63__SFAirDropDiscoveryController_discoverableModeAlertController__block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setDiscoverableMode:2];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v2();
}

- (void)setDiscoverableMode:(int64_t)a3
{
  BOOL v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(SFAirDropDiscoveryController *)self setDiscoverableMode:v5];
  }

  [(SFAirDropDiscoveryController *)self discoverableModeToString:a3];
  SFOperationSetProperty();
}

- (int64_t)discoverableMode
{
  return self->_discoverableMode;
}

- (int64_t)operationDiscoverableModeToInteger:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x263F6C3C8]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F6C3B0]] & 1) != 0)
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F6C3A8]])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F6C3B8]])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)discoverableModeToString:(int64_t)a3
{
  if ((unint64_t)a3 <= 2) {
    self = (SFAirDropDiscoveryController *)**((id **)&unk_264472668 + a3);
  }
  return self;
}

- (void)didChangeRadioState:(BOOL)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained(p_delegate);
    [v7 discoveryControllerSettingsDidChange:self];
  }
}

- (SFAirDropDiscoveryControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return (SFAirDropDiscoveryControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SFAirDropDiscoveryAlertControllerDelegate)alertControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_alertControllerDelegate);
  return (SFAirDropDiscoveryAlertControllerDelegate *)WeakRetained;
}

- (void)setAlertControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_destroyWeak(&self->_alertControllerDelegate);
  objc_destroyWeak(&self->_delegate);
}

- (void)handleOperationCallback:(uint64_t)a1 event:(uint64_t)a2 withResults:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5 = a1;
  uint64_t v11 = *MEMORY[0x263EF8340];
  SFOperationEventToString(a1);
  OUTLINED_FUNCTION_0_0();
  __int16 v7 = 1024;
  int v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_21DB23000, a3, OS_LOG_TYPE_ERROR, "SFAirDropDiscoveryController UNHANDLED EVENT %@ [%d] %@", v6, 0x1Cu);
}

- (void)handleOperationCallback:(void *)a1 event:(NSObject *)a2 withResults:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 objectForKeyedSubscript:*MEMORY[0x263F6C3D0]];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_21DB23000, a2, OS_LOG_TYPE_ERROR, "SFAirDropDiscoveryController %@", v4, 0xCu);
}

- (void)setLegacyModeEnabled:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = @"Off";
  if (a1) {
    v2 = @"On";
  }
  int v3 = 138412290;
  int64_t v4 = v2;
  _os_log_debug_impl(&dword_21DB23000, a2, OS_LOG_TYPE_DEBUG, "Turning AirDrop Legacy Mode %@", (uint8_t *)&v3, 0xCu);
}

- (void)isNearbySharingSupported
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_21DB23000, v0, OS_LOG_TYPE_ERROR, "Failed to get NFC reader mode supported: %@", v1, 0xCu);
}

- (void)setDiscoverableMode:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int64_t v4 = [a1 discoverableModeToString:a2];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_21DB23000, a3, OS_LOG_TYPE_DEBUG, "Changing discoverable mode to %@", v5, 0xCu);
}

@end