@interface SBBluetoothAccessoryBatteryMonitor
- (NSString)description;
- (SBBluetoothAccessoryBatteryMonitor)init;
- (id)descriptionBuilder;
- (void)_popLowPowerAlertForAccessoryIfNecessary:(id)a3;
- (void)connectedDevicesDidChange:(id)a3;
@end

@implementation SBBluetoothAccessoryBatteryMonitor

- (void)connectedDevicesDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    uint64_t v8 = *MEMORY[0x1E4F4F9E0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v10 productIdentifier] == v8 && objc_msgSend(v10, "vendor") == 1) {
          [(SBBluetoothAccessoryBatteryMonitor *)self _popLowPowerAlertForAccessoryIfNecessary:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (SBBluetoothAccessoryBatteryMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBBluetoothAccessoryBatteryMonitor;
  v2 = [(SBBluetoothAccessoryBatteryMonitor *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    accessoryNamesInLowPower = v2->_accessoryNamesInLowPower;
    v2->_accessoryNamesInLowPower = v3;

    uint64_t v5 = (BCBatteryDeviceController *)objc_alloc_init(MEMORY[0x1E4F4F9D0]);
    batteryDeviceController = v2->_batteryDeviceController;
    v2->_batteryDeviceController = v5;

    [(BCBatteryDeviceController *)v2->_batteryDeviceController addBatteryDeviceObserver:v2 queue:MEMORY[0x1E4F14428]];
  }
  return v2;
}

- (void)_popLowPowerAlertForAccessoryIfNecessary:(id)a3
{
  id v8 = a3;
  id v4 = [v8 name];
  int v5 = [(NSMutableSet *)self->_accessoryNamesInLowPower containsObject:v4];
  if ([v8 isLowBattery] && objc_msgSend(v8, "isConnected"))
  {
    if ((v5 & 1) == 0)
    {
      [(NSMutableSet *)self->_accessoryNamesInLowPower addObject:v4];
      uint64_t v6 = -[SBBluetoothAccessoryLowPowerAlertItem initWithAccessory:batteryLevel:]([SBBluetoothAccessoryLowPowerAlertItem alloc], "initWithAccessory:batteryLevel:", v4, [v8 percentCharge]);
      uint64_t v7 = +[SBAlertItemsController sharedInstance];
      [v7 activateAlertItem:v6];
    }
  }
  else if (([v8 isLowBattery] & 1) == 0 && ((v5 ^ 1) & 1) == 0)
  {
    [(NSMutableSet *)self->_accessoryNamesInLowPower removeObject:v4];
  }
}

- (NSString)description
{
  v2 = [(SBBluetoothAccessoryBatteryMonitor *)self descriptionBuilder];
  v3 = [v2 build];

  return (NSString *)v3;
}

- (id)descriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_accessoryNamesInLowPower withName:@"Accessory Names in Low Power"];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryDeviceController, 0);
  objc_storeStrong((id *)&self->_accessoryNamesInLowPower, 0);
}

@end