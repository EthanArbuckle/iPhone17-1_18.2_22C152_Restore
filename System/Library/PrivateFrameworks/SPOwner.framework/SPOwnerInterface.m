@interface SPOwnerInterface
+ (id)cbPeripheralManagementSession;
- (id)beaconSharingSession;
- (id)beaconSharingSessionWithToolingSupport;
- (id)firmwareUpdateSession;
- (id)fmipRegisterInfo;
- (id)maintenanceConnectionSession;
- (id)ownerSession;
- (id)persistentConnectionSession;
- (id)privateFirmwareUpdateSession;
- (id)privateOwnerSession;
- (id)separationMonitoringSession;
- (id)settingsConfiguration;
- (id)tagSeparationSession;
- (id)trackingAvoidanceService;
@end

@implementation SPOwnerInterface

+ (id)cbPeripheralManagementSession
{
  if (cbPeripheralManagementSession_onceToken != -1) {
    dispatch_once(&cbPeripheralManagementSession_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)cbPeripheralManagementSession_sharedInstance;

  return v2;
}

uint64_t __49__SPOwnerInterface_cbPeripheralManagementSession__block_invoke()
{
  cbPeripheralManagementSession_sharedInstance = objc_alloc_init(SPCBPeripheralManager);

  return MEMORY[0x1F41817F8]();
}

- (id)ownerSession
{
  v2 = objc_alloc_init(SPOwnerSession);

  return v2;
}

- (id)privateOwnerSession
{
  v2 = objc_alloc_init(SPOwnerSession);

  return v2;
}

- (id)persistentConnectionSession
{
  v2 = objc_alloc_init(SPOwnerSession);

  return v2;
}

- (id)privateFirmwareUpdateSession
{
  v2 = objc_alloc_init(SPFirmwareUpdateSession);

  return v2;
}

- (id)firmwareUpdateSession
{
  v2 = objc_alloc_init(SPFirmwareUpdateSession);

  return v2;
}

- (id)tagSeparationSession
{
  v2 = objc_alloc_init(SPOwnerSession);

  return v2;
}

- (id)separationMonitoringSession
{
  v2 = objc_alloc_init(SPOwnerSession);

  return v2;
}

- (id)trackingAvoidanceService
{
  v2 = objc_alloc_init(SPOwnerSession);

  return v2;
}

- (id)settingsConfiguration
{
  v2 = objc_opt_new();

  return v2;
}

- (id)fmipRegisterInfo
{
  v2 = objc_opt_new();

  return v2;
}

- (id)maintenanceConnectionSession
{
  v2 = objc_alloc_init(SPOwnerSession);

  return v2;
}

- (id)beaconSharingSession
{
  v2 = objc_alloc_init(SPBeaconSharingManager);

  return v2;
}

- (id)beaconSharingSessionWithToolingSupport
{
  v2 = objc_alloc_init(SPBeaconSharingManager);

  return v2;
}

@end