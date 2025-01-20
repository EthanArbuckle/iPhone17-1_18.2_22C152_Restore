@interface UARPPowerAdapter
- (BOOL)firmwareApply:(id *)a3;
- (BOOL)firmwareHasStagedAssets:(id *)a3;
- (BOOL)firmwareRescind:(id *)a3;
- (BOOL)firmwareUpdateAllowed:(id *)a3;
- (BOOL)firmwareUpdateCleanup:(id *)a3;
- (BOOL)firmwareUpdateInitialize:(id *)a3;
- (BOOL)firmwareUpdateWriteData:(id)a3 offset:(unint64_t)a4 error:(id *)a5;
- (BOOL)firmwareVerifyStagedAsset:(id *)a3;
- (BOOL)isActive;
- (BOOL)isAuthenticated;
- (BOOL)isConnected;
- (BOOL)requiresAuthentication;
- (BOOL)solicitAnalytics:(id)a3 error:(id *)a4;
- (BOOL)solicitLogs:(id)a3 error:(id *)a4;
- (BOOL)supportsAccMode7;
- (NSString)description;
- (UARPPowerAdapter)init;
- (UARPPowerAdapter)initWithHPM:(id)a3 supportsAccMode7:(BOOL)a4;
- (id)activeFwVersion;
- (id)modelName;
- (id)serialNumber;
- (id)stagedFwVersion;
- (int)authenticationStatus;
- (unint64_t)productID;
- (unint64_t)routerID;
- (unint64_t)uarpMaxPayloadSize;
- (unint64_t)uarpPayloadWindowSize;
- (unint64_t)vendorID;
- (void)prepareFirmwareVersion;
- (void)updateWithHPM:(id)a3;
@end

@implementation UARPPowerAdapter

- (UARPPowerAdapter)init
{
  return 0;
}

- (UARPPowerAdapter)initWithHPM:(id)a3 supportsAccMode7:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UARPPowerAdapter;
  v8 = [(UARPPowerAdapter *)&v13 init];
  if (v8)
  {
    os_log_t v9 = os_log_create("com.apple.accessoryupdater.uarp", "powerAdapter");
    log = v8->_log;
    v8->_log = (OS_os_log *)v9;

    objc_storeStrong((id *)&v8->_hpm, a3);
    *(void *)&long long v11 = 0xFFFFLL;
    *((void *)&v11 + 1) = 0xFFFFLL;
    *(_OWORD *)&v8->_routerID = v11;
    v8->_productID = 0xFFFFLL;
    *(_WORD *)&v8->_requiresAuthentication = 0;
    v8->_authenticationStatus = 0;
    v8->_supportsAccMode7 = a4;
  }

  return v8;
}

- (void)updateWithHPM:(id)a3
{
  self->_isConnected = [(UARPAppleHPM *)self->_hpm connected];
  self->_routerID = [(UARPAppleHPM *)self->_hpm rid];
  id v4 = [(UARPAppleHPM *)self->_hpm manufacturerVDO];
  v5 = (const char *)[v4 UTF8String];

  if (v5) {
    unint64_t v6 = strtoul(v5, 0, 16);
  }
  else {
    unint64_t v6 = 0xFFFFLL;
  }
  self->_vendorID = v6;
  id v7 = [(UARPAppleHPM *)self->_hpm modelStringVDO];
  v8 = (const char *)[v7 UTF8String];

  if (v8) {
    unint64_t v9 = strtoul(v8, 0, 16);
  }
  else {
    unint64_t v9 = 0xFFFFLL;
  }
  self->_productID = v9;
}

- (NSString)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", @"isConnected = <%d>", self->_isConnected);
  [v3 appendFormat:@", Router ID = <%lu>", self->_routerID];
  [v3 appendFormat:@", Vendor ID = <0x%lx>", self->_vendorID];
  [v3 appendFormat:@", Product ID = <0x%lx>", self->_productID];
  id v4 = +[NSString stringWithString:v3];

  return (NSString *)v4;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (BOOL)isActive
{
  return self->_isConnected;
}

- (unint64_t)routerID
{
  return self->_routerID;
}

- (unint64_t)vendorID
{
  return self->_vendorID;
}

- (unint64_t)productID
{
  return self->_productID;
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (int)authenticationStatus
{
  return self->_authenticationStatus;
}

- (id)activeFwVersion
{
  fwVersion = self->_fwVersion;
  if (!fwVersion)
  {
    id v4 = [(UARPAppleHPM *)self->_hpm firmwareVersionVDO];
    id v5 = [v4 UTF8String];

    if (v5)
    {
      id v6 = [(UARPAppleHPM *)self->_hpm firmwareVersionVDO];
      unsigned int v7 = strtoul((const char *)[v6 UTF8String], 0, 16);
    }
    else
    {
      unsigned int v7 = 0;
    }
    v8 = (UARPAssetVersion *)[objc_alloc((Class)UARPAssetVersion) initWithMajorVersion:(-6 * (v7 >> 28) + HIBYTE(v7)) minorVersion:(-6 * ((v7 >> 20) & 0xF) + BYTE2(v7)) releaseVersion:(v7 - 6 * (v7 >> 4)) buildVersion:0];
    unint64_t v9 = self->_fwVersion;
    self->_fwVersion = v8;

    fwVersion = self->_fwVersion;
  }
  return fwVersion;
}

- (id)stagedFwVersion
{
  if (self->_supportsAccMode7)
  {
    id v2 = [(UARPAppleHPM *)self->_hpm accMode7StagedFwVersion:0];
  }
  else
  {
    id v2 = [objc_alloc((Class)UARPAssetVersion) initWithMajorVersion:0 minorVersion:0 releaseVersion:0 buildVersion:0];
  }
  return v2;
}

- (id)modelName
{
  return [(UARPAppleHPM *)self->_hpm userStringVDO];
}

- (id)serialNumber
{
  return [(UARPAppleHPM *)self->_hpm serialNumberVDO];
}

- (unint64_t)uarpMaxPayloadSize
{
  return 48;
}

- (unint64_t)uarpPayloadWindowSize
{
  return 96;
}

- (void)prepareFirmwareVersion
{
  id v3 = [(UARPAppleHPM *)self->_hpm firmwareVersionVDO];
  id v4 = [v3 UTF8String];

  if (v4)
  {
    id v5 = [(UARPAppleHPM *)self->_hpm firmwareVersionVDO];
    int v6 = strtoul((const char *)[v5 UTF8String], 0, 16);

    self->_fwVersion = (UARPAssetVersion *)[objc_alloc((Class)UARPAssetVersion) initWithMajorVersion:(HIBYTE(v6) - 6 * (HIBYTE(v6) >> 4)) minorVersion:(BYTE2(v6) - 6 * (BYTE2(v6) >> 4)) releaseVersion:(v6 - 6 * (v6 >> 4)) buildVersion:0];
    _objc_release_x1();
  }
}

- (BOOL)firmwareUpdateAllowed:(id *)a3
{
  if (self->_supportsAccMode7) {
    return [(UARPAppleHPM *)self->_hpm accMode7FirmwareUpdateAllowed:a3];
  }
  else {
    return 1;
  }
}

- (BOOL)firmwareUpdateInitialize:(id *)a3
{
  BOOL supportsAccMode7 = self->_supportsAccMode7;
  hpm = self->_hpm;
  if (supportsAccMode7) {
    return [(UARPAppleHPM *)hpm accMode7FirmwareUpdateInitialize:a3];
  }
  else {
    return [(UARPAppleHPM *)hpm legacyPAFirmwareUpdateInitialize:a3];
  }
}

- (BOOL)firmwareUpdateWriteData:(id)a3 offset:(unint64_t)a4 error:(id *)a5
{
  BOOL supportsAccMode7 = self->_supportsAccMode7;
  hpm = self->_hpm;
  if (supportsAccMode7) {
    return [(UARPAppleHPM *)hpm accMode7FirmwareUpdateWriteData:a3 offset:a4 error:a5];
  }
  else {
    return [(UARPAppleHPM *)hpm legacyPAFirmwareUpdateWriteData:a3 offset:a4 error:a5];
  }
}

- (BOOL)firmwareVerifyStagedAsset:(id *)a3
{
  BOOL supportsAccMode7 = self->_supportsAccMode7;
  hpm = self->_hpm;
  if (supportsAccMode7) {
    return [(UARPAppleHPM *)hpm accMode7FirmwareVerifyStagedAsset:a3];
  }
  else {
    return [(UARPAppleHPM *)hpm legacyPAFirmwareVerifyStagedAsset:a3];
  }
}

- (BOOL)firmwareUpdateCleanup:(id *)a3
{
  BOOL supportsAccMode7 = self->_supportsAccMode7;
  hpm = self->_hpm;
  if (supportsAccMode7) {
    return [(UARPAppleHPM *)hpm accMode7FirmwareUpdateCleanup:a3];
  }
  else {
    return [(UARPAppleHPM *)hpm legacyPAFirmwareUpdateCleanup:a3];
  }
}

- (BOOL)firmwareApply:(id *)a3
{
  if (self->_supportsAccMode7)
  {
    hpm = self->_hpm;
    return [(UARPAppleHPM *)hpm accMode7FirmwareApply:a3];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_10002416C(log, v5, v6, v7, v8, v9, v10, v11);
    }
    return 0;
  }
}

- (BOOL)firmwareHasStagedAssets:(id *)a3
{
  if (self->_supportsAccMode7)
  {
    hpm = self->_hpm;
    return [(UARPAppleHPM *)hpm accMode7FirmwareHasStagedAssets:a3];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_1000241E4(log, v5, v6, v7, v8, v9, v10, v11);
    }
    return 0;
  }
}

- (BOOL)firmwareRescind:(id *)a3
{
  if (self->_supportsAccMode7)
  {
    hpm = self->_hpm;
    return [(UARPAppleHPM *)hpm accMode7FirmwareRescind:a3];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_10002425C(log, v5, v6, v7, v8, v9, v10, v11);
    }
    return 0;
  }
}

- (BOOL)solicitLogs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_supportsAccMode7)
  {
    hpm = self->_hpm;
    uint64_t v8 = [(UARPPowerAdapter *)self modelName];
    uint64_t v9 = [(UARPPowerAdapter *)self serialNumber];
    unsigned __int8 v10 = [(UARPAppleHPM *)hpm accMode7SolicitLogs:v6 modelName:v8 serialNumber:v9 error:a4];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_1000242D4(log, v12, v13, v14, v15, v16, v17, v18);
    }
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)solicitAnalytics:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (self->_supportsAccMode7)
  {
    BOOL v7 = [(UARPAppleHPM *)self->_hpm accMode7SolicitAnalytics:v6 error:a4];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_10002434C(log, v9, v10, v11, v12, v13, v14, v15);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)supportsAccMode7
{
  return self->_supportsAccMode7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hpm, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_fwVersion, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end