@interface ULEnvironment
+ (id)standardEnvironment;
- (OS_dispatch_queue)queue;
- (ULAirplaneModeMonitor)airplaneModeMonitor;
- (ULBGSystemTaskManager)backgroundSystemTaskManager;
- (ULBatteryModeMonitor)batteryModeMonitor;
- (ULBluetoothMonitor)bluetoothMonitor;
- (ULBuddyMonitor)buddyMonitor;
- (ULDarwinNotificationHelper)notificationHelper;
- (ULDataProtectionMonitor)dataProtectionMonitor;
- (ULDiagnostics)diagnostics;
- (ULDisplayMonitor)displayMonitor;
- (ULDisplayMonitor_OSX)displayMonitor_OSX;
- (ULEnvironment)init;
- (ULInternalNotifyMonitor)internalNotifyMonitor;
- (ULPrivacyMonitor)privacyMonitor;
- (ULRapportMonitor)rapportMonitor;
- (ULSleepWakeMonitor)sleepWakeMonitor;
- (void)setAirplaneModeMonitor:(id)a3;
- (void)setBackgroundSystemTaskManager:(id)a3;
- (void)setBatteryModeMonitor:(id)a3;
- (void)setBluetoothMonitor:(id)a3;
- (void)setBuddyMonitor:(id)a3;
- (void)setDataProtectionMonitor:(id)a3;
- (void)setDiagnostics:(id)a3;
- (void)setDisplayMonitor:(id)a3;
- (void)setDisplayMonitor_OSX:(id)a3;
- (void)setInternalNotifyMonitor:(id)a3;
- (void)setNotificationHelper:(id)a3;
- (void)setPrivacyMonitor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRapportMonitor:(id)a3;
- (void)setSleepWakeMonitor:(id)a3;
@end

@implementation ULEnvironment

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

+ (id)standardEnvironment
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (ULEnvironment)init
{
  v31.receiver = self;
  v31.super_class = (Class)ULEnvironment;
  id v2 = [(ULEnvironment *)&v31 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.milod.mainQueue", v3);
    [(ULEnvironment *)v2 setQueue:v4];

    id v5 = objc_alloc_init(MEMORY[0x263F55808]);
    [(ULEnvironment *)v2 setNotificationHelper:v5];

    v6 = [ULDataProtectionMonitor alloc];
    v7 = [(ULEnvironment *)v2 notificationHelper];
    v8 = [(ULDataProtectionMonitor *)v6 initWithNotificationHelper:v7];
    [(ULEnvironment *)v2 setDataProtectionMonitor:v8];

    v9 = objc_alloc_init(ULAirplaneModeMonitor);
    [(ULEnvironment *)v2 setAirplaneModeMonitor:v9];

    v10 = [ULBatteryModeMonitor alloc];
    v11 = [(ULEnvironment *)v2 notificationHelper];
    v12 = [(ULBatteryModeMonitor *)v10 initWithNotificationHelper:v11];
    [(ULEnvironment *)v2 setBatteryModeMonitor:v12];

    v13 = objc_alloc_init(ULBluetoothMonitor);
    [(ULEnvironment *)v2 setBluetoothMonitor:v13];

    v14 = [ULRapportMonitor alloc];
    v15 = [(ULEnvironment *)v2 notificationHelper];
    v16 = [(ULRapportMonitor *)v14 initWithNotificationHelper:v15 identityTypeFlags:10 controlFlags:4];
    [(ULEnvironment *)v2 setRapportMonitor:v16];

    if ([MEMORY[0x263F55810] isMac])
    {
      v17 = objc_alloc_init(ULDisplayMonitor_OSX);
      [(ULEnvironment *)v2 setDisplayMonitor_OSX:v17];
    }
    else
    {
      v17 = objc_alloc_init(ULDisplayMonitor);
      [(ULEnvironment *)v2 setDisplayMonitor:v17];
    }

    v18 = [ULInternalNotifyMonitor alloc];
    v19 = [(ULEnvironment *)v2 notificationHelper];
    v20 = [(ULInternalNotifyMonitor *)v18 initWithNotificationHelper:v19];
    [(ULEnvironment *)v2 setInternalNotifyMonitor:v20];

    v21 = objc_alloc_init(ULBGSystemTaskManager);
    [(ULEnvironment *)v2 setBackgroundSystemTaskManager:v21];

    v22 = [[ULDiagnostics alloc] initWithLabel:@"milod"];
    [(ULEnvironment *)v2 setDiagnostics:v22];

    v23 = [ULPrivacyMonitor alloc];
    v24 = [(ULEnvironment *)v2 notificationHelper];
    v25 = [(ULPrivacyMonitor *)v23 initWithNotificationHelper:v24];
    [(ULEnvironment *)v2 setPrivacyMonitor:v25];

    v26 = [ULBuddyMonitor alloc];
    v27 = [(ULEnvironment *)v2 notificationHelper];
    v28 = [(ULBuddyMonitor *)v26 initWithNotificationHelper:v27];
    [(ULEnvironment *)v2 setBuddyMonitor:v28];

    v29 = objc_alloc_init(ULSleepWakeMonitor);
    [(ULEnvironment *)v2 setSleepWakeMonitor:v29];
  }
  return v2;
}

- (void)setQueue:(id)a3
{
}

- (ULDataProtectionMonitor)dataProtectionMonitor
{
  return self->_dataProtectionMonitor;
}

- (void)setDataProtectionMonitor:(id)a3
{
}

- (ULAirplaneModeMonitor)airplaneModeMonitor
{
  return self->_airplaneModeMonitor;
}

- (void)setAirplaneModeMonitor:(id)a3
{
}

- (ULBatteryModeMonitor)batteryModeMonitor
{
  return self->_batteryModeMonitor;
}

- (void)setBatteryModeMonitor:(id)a3
{
}

- (ULBluetoothMonitor)bluetoothMonitor
{
  return self->_bluetoothMonitor;
}

- (void)setBluetoothMonitor:(id)a3
{
}

- (ULRapportMonitor)rapportMonitor
{
  return self->_rapportMonitor;
}

- (void)setRapportMonitor:(id)a3
{
}

- (ULDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
}

- (ULDisplayMonitor_OSX)displayMonitor_OSX
{
  return self->_displayMonitor_OSX;
}

- (void)setDisplayMonitor_OSX:(id)a3
{
}

- (ULInternalNotifyMonitor)internalNotifyMonitor
{
  return self->_internalNotifyMonitor;
}

- (void)setInternalNotifyMonitor:(id)a3
{
}

- (ULBGSystemTaskManager)backgroundSystemTaskManager
{
  return self->_backgroundSystemTaskManager;
}

- (void)setBackgroundSystemTaskManager:(id)a3
{
}

- (ULDiagnostics)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
}

- (ULPrivacyMonitor)privacyMonitor
{
  return self->_privacyMonitor;
}

- (void)setPrivacyMonitor:(id)a3
{
}

- (ULBuddyMonitor)buddyMonitor
{
  return self->_buddyMonitor;
}

- (void)setBuddyMonitor:(id)a3
{
}

- (ULSleepWakeMonitor)sleepWakeMonitor
{
  return self->_sleepWakeMonitor;
}

- (void)setSleepWakeMonitor:(id)a3
{
}

- (ULDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_sleepWakeMonitor, 0);
  objc_storeStrong((id *)&self->_buddyMonitor, 0);
  objc_storeStrong((id *)&self->_privacyMonitor, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_backgroundSystemTaskManager, 0);
  objc_storeStrong((id *)&self->_internalNotifyMonitor, 0);
  objc_storeStrong((id *)&self->_displayMonitor_OSX, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_rapportMonitor, 0);
  objc_storeStrong((id *)&self->_bluetoothMonitor, 0);
  objc_storeStrong((id *)&self->_batteryModeMonitor, 0);
  objc_storeStrong((id *)&self->_airplaneModeMonitor, 0);
  objc_storeStrong((id *)&self->_dataProtectionMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end