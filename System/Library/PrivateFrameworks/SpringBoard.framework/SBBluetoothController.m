@interface SBBluetoothController
+ (SBBluetoothController)sharedInstance;
- (BOOL)canReportBatteryLevel;
- (BOOL)tetheringConnected;
- (id)deviceForAudioRoute:(id)a3;
- (id)firstBTDeviceToReportBatteryLevel;
- (int)batteryLevel;
- (void)addDeviceNotification:(id)a3;
- (void)batteryChanged:(id)a3;
- (void)bluetoothDeviceEndedVoiceControl:(id)a3;
- (void)bluetoothDeviceInitiatedVoiceControl:(id)a3;
- (void)connectionChanged:(id)a3;
- (void)dealloc;
- (void)iapDeviceChanged:(id)a3;
- (void)noteDevicesChanged;
- (void)removeDeviceNotification:(id)a3;
- (void)startWatchingForDevices;
- (void)stopWatchingForDevices;
- (void)updateBattery;
- (void)updateTetheringConnected;
@end

@implementation SBBluetoothController

+ (SBBluetoothController)sharedInstance
{
  v2 = (void *)__sharedBluetoothController;
  if (!__sharedBluetoothController)
  {
    kdebug_trace();
    v3 = objc_alloc_init(SBBluetoothController);
    v4 = (void *)__sharedBluetoothController;
    __sharedBluetoothController = (uint64_t)v3;

    kdebug_trace();
    v2 = (void *)__sharedBluetoothController;
  }
  return (SBBluetoothController *)v2;
}

- (void)dealloc
{
  [(SBBluetoothController *)self stopWatchingForDevices];
  v3.receiver = self;
  v3.super_class = (Class)SBBluetoothController;
  [(SBBluetoothController *)&v3 dealloc];
}

- (id)firstBTDeviceToReportBatteryLevel
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_devices;
  id v3 = (id)[(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v6, "supportsBatteryLevel", (void)v8)
          && ([v6 connected] & 1) != 0)
        {
          id v3 = v6;
          goto LABEL_12;
        }
      }
      id v3 = (id)[(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)canReportBatteryLevel
{
  id v3 = +[SBUIController sharedInstance];
  if ([v3 isHeadsetDocked])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(SBBluetoothController *)self firstBTDeviceToReportBatteryLevel];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (int)batteryLevel
{
  id v3 = +[SBUIController sharedInstance];
  if ([v3 isHeadsetDocked])
  {
    int v4 = [v3 headsetBatteryCapacity];
  }
  else
  {
    v5 = [(SBBluetoothController *)self firstBTDeviceToReportBatteryLevel];
    v6 = v5;
    if (v5) {
      int v4 = [v5 batteryLevel];
    }
    else {
      int v4 = 0;
    }
  }
  return v4;
}

- (void)noteDevicesChanged
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:SBBluetoothBatteryAvailabilityChangedNotification object:0];
}

- (void)startWatchingForDevices
{
  id v9 = [MEMORY[0x1E4F50B70] sharedInstance];
  [(SBBluetoothController *)self stopWatchingForDevices];
  id v3 = [v9 pairedDevices];
  int v4 = (NSMutableArray *)[v3 mutableCopy];
  devices = self->_devices;
  self->_devices = v4;

  if (!self->_devices)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_devices;
    self->_devices = v6;
  }
  long long v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel_iapDeviceChanged_ name:@"SBUIHeadsetDockStatusChangedNotification" object:0];
  [v8 addObserver:self selector:sel_connectionChanged_ name:*MEMORY[0x1E4F50AE8] object:0];
  [v8 addObserver:self selector:sel_addDeviceNotification_ name:*MEMORY[0x1E4F50B08] object:0];
  [v8 addObserver:self selector:sel_removeDeviceNotification_ name:*MEMORY[0x1E4F50B18] object:0];
  [v8 addObserver:self selector:sel_connectionChanged_ name:*MEMORY[0x1E4F50AF0] object:0];
  [v8 addObserver:self selector:sel_batteryChanged_ name:*MEMORY[0x1E4F50AF8] object:0];
  [v8 addObserver:self selector:sel_bluetoothDeviceInitiatedVoiceControl_ name:*MEMORY[0x1E4F50B50] object:0];
  [v8 addObserver:self selector:sel_bluetoothDeviceEndedVoiceControl_ name:*MEMORY[0x1E4F50B48] object:0];
  [(SBBluetoothController *)self noteDevicesChanged];
}

- (void)stopWatchingForDevices
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  devices = self->_devices;
  self->_devices = 0;
}

- (void)iapDeviceChanged:(id)a3
{
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    int v4 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = [NSString stringWithUTF8String:"-[SBBluetoothController iapDeviceChanged:]"];
    [v4 handleFailureInFunction:v5 file:@"SBBluetoothController.m" lineNumber:120 description:@"this call must be made on the main thread"];
  }
  [(SBBluetoothController *)self noteDevicesChanged];
}

- (void)addDeviceNotification:(id)a3
{
  id v7 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = [NSString stringWithUTF8String:"-[SBBluetoothController addDeviceNotification:]"];
    [v5 handleFailureInFunction:v6 file:@"SBBluetoothController.m" lineNumber:126 description:@"this call must be made on the main thread"];
  }
  int v4 = [v7 object];
  if (v4 && ([(NSMutableArray *)self->_devices containsObject:v4] & 1) == 0)
  {
    [(NSMutableArray *)self->_devices addObject:v4];
    [(SBBluetoothController *)self noteDevicesChanged];
  }
}

- (void)removeDeviceNotification:(id)a3
{
  id v7 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    v6 = [NSString stringWithUTF8String:"-[SBBluetoothController removeDeviceNotification:]"];
    [v5 handleFailureInFunction:v6 file:@"SBBluetoothController.m" lineNumber:141 description:@"this call must be made on the main thread"];
  }
  int v4 = [v7 object];
  if (v4)
  {
    [(NSMutableArray *)self->_devices removeObject:v4];
    [(SBBluetoothController *)self noteDevicesChanged];
  }
}

- (void)updateTetheringConnected
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  self->_tetheringConnected = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_devices;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "connectedServices", (void)v8) & 0x1000) != 0)
        {
          self->_tetheringConnected = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)connectionChanged:(id)a3
{
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    long long v10 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v11 = [NSString stringWithUTF8String:"-[SBBluetoothController connectionChanged:]"];
    [v10 handleFailureInFunction:v11 file:@"SBBluetoothController.m" lineNumber:169 description:@"this call must be made on the main thread"];
  }
  uint64_t v4 = [MEMORY[0x1E4F50B70] sharedInstance];
  uint64_t v5 = [v4 pairedDevices];
  uint64_t v6 = (NSMutableArray *)[v5 mutableCopy];
  devices = self->_devices;
  self->_devices = v6;

  if (!self->_devices)
  {
    long long v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v9 = self->_devices;
    self->_devices = v8;
  }
  [(SBBluetoothController *)self noteDevicesChanged];
  [(SBBluetoothController *)self updateTetheringConnected];
  id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:SBBluetoothConnectionChangedNotification object:0 userInfo:0];
}

- (void)batteryChanged:(id)a3
{
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3) & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[SBBluetoothController batteryChanged:]"];
    [v4 handleFailureInFunction:v5 file:@"SBBluetoothController.m" lineNumber:184 description:@"this call must be made on the main thread"];
  }
  [(SBBluetoothController *)self updateBattery];
  [(SBBluetoothController *)self noteDevicesChanged];
}

- (void)updateBattery
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:SBBluetoothBatteryLevelChangedNotification object:0];
}

- (id)deviceForAudioRoute:(id)a3
{
  id v4 = a3;
  devices = self->_devices;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__SBBluetoothController_deviceForAudioRoute___block_invoke;
  v10[3] = &unk_1E6AF83F0;
  id v6 = v4;
  id v11 = v6;
  uint64_t v7 = [(NSMutableArray *)devices indexOfObjectPassingTest:v10];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v8 = 0;
  }
  else
  {
    long long v8 = [(NSMutableArray *)self->_devices objectAtIndex:v7];
  }

  return v8;
}

uint64_t __45__SBBluetoothController_deviceForAudioRoute___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 address];
  uint64_t v4 = [v2 matchesUID:v3];

  return v4;
}

- (BOOL)tetheringConnected
{
  return self->_tetheringConnected;
}

- (void)bluetoothDeviceInitiatedVoiceControl:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = SBLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "Bluetooth device voice control initiated: %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = +[SBVoiceControlController sharedInstance];
  id v6 = [v3 object];
  [v5 bluetoothDeviceInitiatedVoiceControl:v6];
}

- (void)bluetoothDeviceEndedVoiceControl:(id)a3
{
  id v3 = a3;
  id v5 = +[SBVoiceControlController sharedInstance];
  uint64_t v4 = [v3 object];

  [v5 bluetoothDeviceEndedVoiceControl:v4];
}

- (void).cxx_destruct
{
}

@end