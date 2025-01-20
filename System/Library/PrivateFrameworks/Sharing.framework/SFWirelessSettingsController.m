@interface SFWirelessSettingsController
- (BOOL)deviceSupportsWAPI;
- (BOOL)isAirplaneModeEnabled;
- (BOOL)isBluetoothEnabled;
- (BOOL)isWifiEnabled;
- (BOOL)isWirelessAccessPointEnabled;
- (BOOL)isWirelessCarPlayEnabled;
- (SFWirelessSettingsController)init;
- (SFWirelessSettingsControllerDelegate)delegate;
- (unint64_t)ultraWideBandStatus;
- (void)dealloc;
- (void)handleOperationCallback:(__SFOperation *)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)invalidate;
- (void)setAirplaneModeEnabled:(BOOL)a3;
- (void)setBluetoothEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setWifiEnabled:(BOOL)a3;
- (void)setWirelessAccessPointEnabled:(BOOL)a3;
@end

@implementation SFWirelessSettingsController

- (SFWirelessSettingsController)init
{
  v8.receiver = self;
  v8.super_class = (Class)SFWirelessSettingsController;
  v2 = [(SFWirelessSettingsController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    *((void *)v2 + 6) = 0;
    *((_DWORD *)v2 + 4) = 65537;
    *(_WORD *)(v2 + 33) = 0;
    v4 = SFOperationCreate(0, @"Information");
    *((void *)v3 + 5) = v4;
    *(void *)&v6[0] = 0;
    v6[1] = 0u;
    uint64_t v7 = 0;
    *((void *)&v6[0] + 1) = v3;
    SFOperationSetClient((uint64_t)v4, (uint64_t)operationCallBack_0, v6);
    SFOperationSetDispatchQueue(*((void *)v3 + 5), MEMORY[0x1E4F14428]);
    SFOperationResume(*((void *)v3 + 5));
  }
  return (SFWirelessSettingsController *)v3;
}

- (void)handleOperationCallback:(__SFOperation *)a3 event:(int64_t)a4 withResults:(id)a5
{
  id v7 = a5;
  objc_super v8 = v7;
  if (a4 == 10)
  {
    v16 = airdrop_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SFWirelessSettingsController handleOperationCallback:event:withResults:](v8, v16);
    }
    goto LABEL_8;
  }
  if (a4 != 12)
  {
    v16 = airdrop_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SFWirelessSettingsController handleOperationCallback:event:withResults:](a4, (uint64_t)v8, v16);
    }
LABEL_8:

    goto LABEL_9;
  }
  v9 = [v7 objectForKeyedSubscript:@"WirelessEnabled"];
  self->_wifiEnabled = [v9 BOOLValue];

  v10 = [v8 objectForKeyedSubscript:@"BluetoothEnabled"];
  self->_bluetoothEnabled = [v10 BOOLValue];

  v11 = [v8 objectForKeyedSubscript:@"AirplaneModeEnabled"];
  self->_airplaneModeEnabled = [v11 BOOLValue];

  v12 = [v8 objectForKeyedSubscript:@"UltraWideBandEnabled"];
  self->_ultraWideBandStatus = (int)[v12 intValue];

  v13 = [v8 objectForKeyedSubscript:@"DeviceSupportsWAPI"];
  self->_deviceSupportsWAPI = [v13 BOOLValue];

  v14 = [v8 objectForKeyedSubscript:@"WirelessCarPlay"];
  self->_wirelessCarPlayEnabled = [v14 BOOLValue];

  v15 = [v8 objectForKeyedSubscript:@"WirelessAccessPoint"];
  self->_wirelessAccessPointEnabled = [v15 BOOLValue];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SFWirelessSettingsController_handleOperationCallback_event_withResults___block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
LABEL_9:
}

void __74__SFWirelessSettingsController_handleOperationCallback_event_withResults___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  [WeakRetained wirelessSettingsDidChange:*(void *)(a1 + 32)];
}

- (void)setWifiEnabled:(BOOL)a3
{
  information = self->_information;
  v4 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    v4 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  SFOperationSetProperty((pthread_mutex_t *)information, @"WirelessEnabled", *v4);
}

- (BOOL)isWifiEnabled
{
  return self->_wifiEnabled;
}

- (void)setBluetoothEnabled:(BOOL)a3
{
  information = self->_information;
  v4 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    v4 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  SFOperationSetProperty((pthread_mutex_t *)information, @"BluetoothEnabled", *v4);
}

- (BOOL)isBluetoothEnabled
{
  return self->_bluetoothEnabled;
}

- (BOOL)isAirplaneModeEnabled
{
  return self->_airplaneModeEnabled;
}

- (void)setAirplaneModeEnabled:(BOOL)a3
{
  information = self->_information;
  v4 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    v4 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  SFOperationSetProperty((pthread_mutex_t *)information, @"AirplaneModeEnabled", *v4);
}

- (BOOL)deviceSupportsWAPI
{
  return self->_deviceSupportsWAPI;
}

- (BOOL)isWirelessAccessPointEnabled
{
  return self->_wirelessAccessPointEnabled;
}

- (void)setWirelessAccessPointEnabled:(BOOL)a3
{
  information = self->_information;
  v4 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    v4 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  SFOperationSetProperty((pthread_mutex_t *)information, @"WirelessAccessPoint", *v4);
}

- (BOOL)isWirelessCarPlayEnabled
{
  return self->_wirelessCarPlayEnabled;
}

- (void)dealloc
{
  [(SFWirelessSettingsController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SFWirelessSettingsController;
  [(SFWirelessSettingsController *)&v3 dealloc];
}

- (void)invalidate
{
  information = self->_information;
  if (information)
  {
    SFOperationCancel((uint64_t)information);
    CFRelease(self->_information);
    self->_information = 0;
  }
}

- (SFWirelessSettingsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return (SFWirelessSettingsControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)ultraWideBandStatus
{
  return self->_ultraWideBandStatus;
}

- (void).cxx_destruct
{
}

- (void)handleOperationCallback:(uint64_t)a1 event:(uint64_t)a2 withResults:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5 = a1;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v6 = 138412802;
  id v7 = SFOperationEventToString_0(a1);
  __int16 v8 = 1024;
  int v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_1A5389000, a3, OS_LOG_TYPE_ERROR, "SFWirelessSettingsController UNHANDLED EVENT %@ [%d] %@", (uint8_t *)&v6, 0x1Cu);
}

- (void)handleOperationCallback:(void *)a1 event:(NSObject *)a2 withResults:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [a1 objectForKeyedSubscript:@"Error"];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "SFWirelessSettingsController %@", (uint8_t *)&v4, 0xCu);
}

@end