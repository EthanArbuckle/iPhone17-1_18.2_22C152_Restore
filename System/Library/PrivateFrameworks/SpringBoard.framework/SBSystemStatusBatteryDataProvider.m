@interface SBSystemStatusBatteryDataProvider
- (BCBatteryDeviceController)batteryDeviceController;
- (BOOL)_isInNotChargingState;
- (BOOL)shouldExposeNotChargingState;
- (SBSystemStatusBatteryDataProvider)init;
- (STBatteryStatusDomainPublisher)batteryDataPublisher;
- (void)_noteNotChargingStatusChanged;
- (void)_registerForNotifications;
- (void)_updateData;
- (void)_updateShouldExposeNotChargingState;
- (void)connectedDevicesDidChange:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setShouldExposeNotChargingState:(BOOL)a3;
@end

@implementation SBSystemStatusBatteryDataProvider

- (BOOL)shouldExposeNotChargingState
{
  return self->_shouldExposeNotChargingState;
}

- (void)connectedDevicesDidChange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * v8) isInternal]) {
          [(SBSystemStatusBatteryDataProvider *)self _updateData];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_updateData
{
  v3 = [(BCBatteryDeviceController *)self->_batteryDeviceController sb_deviceInternalBattery];
  if (v3)
  {
    id v15 = v3;
    id v4 = objc_alloc_init(MEMORY[0x1E4FA93F8]);
    BOOL v5 = [(SBSystemStatusBatteryDataProvider *)self shouldExposeNotChargingState];
    uint64_t v6 = [(id)SBApp isBatterySaverModeActive];
    unint64_t v7 = [v15 percentCharge];
    if (v7 <= 1) {
      unint64_t v8 = 1;
    }
    else {
      unint64_t v8 = v7;
    }
    if ([v15 isCharging])
    {
      uint64_t v9 = 1;
      if (!v5)
      {
LABEL_7:
        long long v10 = [MEMORY[0x1E4F4F9C8] localizedBatteryDetailTextForBatteryLevel:(double)v8];
        uint64_t v11 = 1;
LABEL_15:
        [v4 setChargingState:v9];
        [v4 setPercentCharge:v8];
        [v4 setBatterySaverModeActive:v6];
        [v4 setChargingDescription:v10];
        [v4 setChargingDescriptionType:v11];
        uint64_t v14 = [(SBSystemStatusBatteryDataProvider *)self batteryDataPublisher];
        [v14 setData:v4];

        v3 = v15;
        goto LABEL_16;
      }
    }
    else
    {
      uint64_t v12 = [v15 powerSourceState];
      uint64_t v13 = 2;
      if (v5) {
        uint64_t v13 = 0;
      }
      if (v12 == 2) {
        uint64_t v9 = v13;
      }
      else {
        uint64_t v9 = 0;
      }
      if (!v5) {
        goto LABEL_7;
      }
    }
    uint64_t v11 = 2;
    long long v10 = UIStatusBarLocalizedNotChargingString();
    goto LABEL_15;
  }
LABEL_16:
}

- (STBatteryStatusDomainPublisher)batteryDataPublisher
{
  return self->_batteryDataPublisher;
}

- (SBSystemStatusBatteryDataProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)SBSystemStatusBatteryDataProvider;
  v2 = [(SBSystemStatusBatteryDataProvider *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FA9358]);
    id v4 = [(id)SBApp systemStatusServer];
    uint64_t v5 = [v3 initWithServerHandle:v4];
    batteryDataPublisher = v2->_batteryDataPublisher;
    v2->_batteryDataPublisher = (STBatteryStatusDomainPublisher *)v5;

    unint64_t v7 = (BCBatteryDeviceController *)objc_alloc_init(MEMORY[0x1E4F4F9D0]);
    batteryDeviceController = v2->_batteryDeviceController;
    v2->_batteryDeviceController = v7;

    [(BCBatteryDeviceController *)v2->_batteryDeviceController addBatteryDeviceObserver:v2 queue:MEMORY[0x1E4F14428]];
    [(SBSystemStatusBatteryDataProvider *)v2 _registerForNotifications];
  }
  return v2;
}

- (void)dealloc
{
  [(SBSystemStatusBatteryDataProvider *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSystemStatusBatteryDataProvider;
  [(SBSystemStatusBatteryDataProvider *)&v3 dealloc];
}

- (void)invalidate
{
  [(STBatteryStatusDomainPublisher *)self->_batteryDataPublisher invalidate];
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  batteryDeviceController = self->_batteryDeviceController;
  [(BCBatteryDeviceController *)batteryDeviceController removeBatteryDeviceObserver:self];
}

- (void)_registerForNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__updateData name:@"SBBootCompleteNotification" object:0];
  [v3 addObserver:self selector:sel__updateData name:@"SBCurrentLocaleDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__updateData name:@"SBBatterySaverModeDidChangeNotification" object:0];
  [v3 addObserver:self selector:sel__noteNotChargingStatusChanged name:@"SBUIBatteryNotChargingStatusChangedNotification" object:0];
}

- (void)_noteNotChargingStatusChanged
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ([(SBSystemStatusBatteryDataProvider *)self _isInNotChargingState]) {
    double v3 = 0.6;
  }
  else {
    double v3 = 0.0;
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__updateShouldExposeNotChargingState object:0];
  v5[0] = *MEMORY[0x1E4F1C4B0];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(SBSystemStatusBatteryDataProvider *)self performSelector:sel__updateShouldExposeNotChargingState withObject:0 afterDelay:v4 inModes:v3];
}

- (void)_updateShouldExposeNotChargingState
{
  BOOL v3 = [(SBSystemStatusBatteryDataProvider *)self _isInNotChargingState];
  if (v3 != [(SBSystemStatusBatteryDataProvider *)self shouldExposeNotChargingState])
  {
    [(SBSystemStatusBatteryDataProvider *)self setShouldExposeNotChargingState:v3];
    [(SBSystemStatusBatteryDataProvider *)self _updateData];
  }
}

- (BOOL)_isInNotChargingState
{
  int v3 = __sb__runningInSpringBoard();
  char v4 = v3;
  if (!v3)
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom] != 1)
    {
      LOBYTE(v5) = 0;
      goto LABEL_10;
    }
LABEL_5:
    uint64_t v6 = +[SBUIController sharedInstance];
    if ([v6 isConnectedToChargeIncapablePowerSource])
    {
      unint64_t v7 = +[SBUIController sharedInstance];
      int v5 = [v7 isFullyCharged] ^ 1;

      if (v4) {
        return v5;
      }
    }
    else
    {

      LOBYTE(v5) = 0;
      if (v4) {
        return v5;
      }
    }
LABEL_10:

    return v5;
  }
  if (SBFEffectiveDeviceClass() == 2) {
    goto LABEL_5;
  }
  LOBYTE(v5) = 0;
  return v5;
}

- (BCBatteryDeviceController)batteryDeviceController
{
  return self->_batteryDeviceController;
}

- (void)setShouldExposeNotChargingState:(BOOL)a3
{
  self->_shouldExposeNotChargingState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryDeviceController, 0);
  objc_storeStrong((id *)&self->_batteryDataPublisher, 0);
}

@end