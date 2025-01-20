@interface UARPUSBPDAccessory
- (BOOL)autoAppliesStagedFirmware;
- (BOOL)goldrestoreQueryInProgress;
- (BOOL)isAuthenticated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMagSafeCable;
- (BOOL)isPowerAdapter;
- (BOOL)isUSBCLightning;
- (BOOL)needsConsentToStage;
- (BOOL)needsTransferAnalytics;
- (BOOL)needsTransferFirmware;
- (BOOL)needsTransferLogs;
- (BOOL)requiresAuthentication;
- (BOOL)requiresPowerAssertion;
- (BOOL)supportsAccMode7;
- (BOOL)vuarpAssetFullyStaged:(id)a3;
- (BOOL)vuarpAssetOffered;
- (BOOL)vuarpDynamicAssetSolicited:(id)a3;
- (BOOL)vuarpFirmwarePayloadComplete:(id)a3;
- (BOOL)vuarpFirmwarePayloadData:(id)a3 data:(id)a4 offset:(unint64_t)a5;
- (BOOL)vuarpFirmwarePayloadReady:(id)a3;
- (BOOL)vuarpHasStagedAssets;
- (BOOL)vuarpLastError:(unsigned int *)a3 lastAction:(unsigned int *)a4;
- (BOOL)vuarpRescindStagedAssets;
- (BOOL)vuarpSendMessage:(id)a3 error:(id *)a4;
- (BOOL)vuarpStageAllowed;
- (NSMutableSet)propertiesToQuery;
- (NSString)description;
- (NSString)identifier;
- (UARPAccessory)uarpAccessory;
- (UARPAccessoryID)uarpAccessoryID;
- (UARPAssetVersion)stagedFwVersion;
- (UARPHPMProtocol)hpmDelegate;
- (UARPUSBPDAccessory)init;
- (UARPUSBPDAccessory)initWithHardwareID:(id)a3 identifier:(id)a4 vuarpDelegate:(id)a5 hpmDelegate:(id)a6;
- (VUARPProtocol)vuarpDelegate;
- (id)locationID;
- (id)vuarpActiveFirmwareVersion;
- (id)vuarpAppleModelNumber;
- (id)vuarpHardwareVersion;
- (id)vuarpHwFusingType;
- (id)vuarpManufacturerName;
- (id)vuarpModelName;
- (id)vuarpSerialNumber;
- (id)vuarpStagedFirmwareVersion;
- (int)authStatus;
- (unsigned)options;
- (unsigned)productID;
- (unsigned)vendorID;
- (unsigned)vuarpApplyStagedAssets;
- (void)connectToVUARP:(unint64_t)a3 payloadWindowLength:(unint64_t)a4 delegate:(id)a5;
- (void)disconnectFromVUARP;
- (void)sendUARPMessage:(id)a3;
- (void)setAuthStatus:(int)a3;
- (void)setAutoAppliesStagedFirmware:(BOOL)a3;
- (void)setGoldrestoreQueryInProgress:(BOOL)a3;
- (void)setIsAuthenticated:(BOOL)a3;
- (void)setLocationID:(id)a3;
- (void)setNeedsTransferAnalytics:(BOOL)a3;
- (void)setNeedsTransferFirmware:(BOOL)a3;
- (void)setNeedsTransferLogs:(BOOL)a3;
- (void)setOptions:(unsigned int)a3;
- (void)setRequiresAuthentication:(BOOL)a3;
- (void)setRequiresPowerAssertion:(BOOL)a3;
- (void)setUarpAccessory:(id)a3;
- (void)setUarpAccessoryID:(id)a3;
@end

@implementation UARPUSBPDAccessory

- (UARPUSBPDAccessory)init
{
  return 0;
}

- (UARPUSBPDAccessory)initWithHardwareID:(id)a3 identifier:(id)a4 vuarpDelegate:(id)a5 hpmDelegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)UARPUSBPDAccessory;
  v14 = [(UARPUSBPDAccessory *)&v18 init];
  if (v14)
  {
    os_log_t v15 = os_log_create("com.apple.accessoryupdater.uarp", "usbpdUpdater");
    log = v14->_log;
    v14->_log = (OS_os_log *)v15;

    v14->_vendorID = (unsigned __int16)[v10 vendorID];
    v14->_productID = (unsigned __int16)[v10 productID];
    objc_storeStrong((id *)&v14->_appleModelNumber, a4);
    objc_storeStrong((id *)&v14->_vuarpDelegate, a5);
    objc_storeStrong((id *)&v14->_hpmDelegate, a6);
    v14->_isMagSafeCable = [v10 isMagSafeCable];
    v14->_isPowerAdapter = [v10 isPowerAdapter];
    v14->_supportsAccMode7 = [v10 supportsAccMode7];
    v14->_isUSBCLightning = [v10 isUSBCLightning];
  }

  return v14;
}

- (void)setOptions:(unsigned int)a3
{
  self->_options = a3;
}

- (unsigned)options
{
  return self->_options;
}

- (void)setLocationID:(id)a3
{
}

- (id)locationID
{
  return self->_locationID;
}

- (NSString)identifier
{
  return self->_appleModelNumber;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UARPUSBPDAccessory *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unsigned int v6 = [(UARPUSBPDAccessory *)self vendorID];
      if (v6 == [(UARPUSBPDAccessory *)v5 vendorID])
      {
        unsigned int v7 = [(UARPUSBPDAccessory *)self productID];
        BOOL v8 = v7 == [(UARPUSBPDAccessory *)v5 productID];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (void)connectToVUARP:(unint64_t)a3 payloadWindowLength:(unint64_t)a4 delegate:(id)a5
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  v8[0] = a3;
  v8[1] = a3;
  v8[2] = a4;
  objc_storeWeak((id *)&self->_delegate, a5);
  unsigned int v6 = [[VUARPAccessory alloc] initWithDelegate:self options:v8];
  vuarpAccessory = self->_vuarpAccessory;
  self->_vuarpAccessory = v6;

  [(VUARPAccessory *)self->_vuarpAccessory connectToUARP:0];
}

- (void)disconnectFromVUARP
{
  [(VUARPAccessory *)self->_vuarpAccessory disconnectFromUARP];
  vuarpAccessory = self->_vuarpAccessory;
  self->_vuarpAccessory = 0;
}

- (void)sendUARPMessage:(id)a3
{
}

- (NSString)description
{
  v2 = "YES";
  if (self->_needsTransferFirmware) {
    v3 = "YES";
  }
  else {
    v3 = "NO";
  }
  if (self->_needsTransferLogs) {
    v4 = "YES";
  }
  else {
    v4 = "NO";
  }
  if (self->_needsTransferAnalytics) {
    v5 = "YES";
  }
  else {
    v5 = "NO";
  }
  if (self->_autoAppliesStagedFirmware) {
    unsigned int v6 = "YES";
  }
  else {
    unsigned int v6 = "NO";
  }
  if (!self->_supportsAccMode7) {
    v2 = "NO";
  }
  return +[NSString stringWithFormat:@"AMN=<%@> needsFirmware=<%s>, needsLogs=<%s>, needsAnalytics=<%s>, autoAppliesStagedFirmware=<%s> supportsAccmode7=<%s>", self->_appleModelNumber, v3, v4, v5, v6, v2];
}

- (BOOL)vuarpSendMessage:(id)a3 error:(id *)a4
{
  p_delegate = &self->_delegate;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a4) = [WeakRetained recvUarpMsgFromAccessory:self uarpMsg:v7 error:a4];

  return (char)a4;
}

- (id)vuarpManufacturerName
{
  return @"Apple Inc.";
}

- (id)vuarpModelName
{
  if (self->_requiresAuthentication)
  {
    v3 = +[UARPMagSafeCable authenticationStatusToString:self->_authStatus];
    v4 = [(VUARPProtocol *)self->_vuarpDelegate modelName];
    v5 = +[NSString stringWithFormat:@"%@ <%s>", v4, v3];
  }
  else
  {
    v5 = [(VUARPProtocol *)self->_vuarpDelegate modelName];
  }
  return v5;
}

- (id)vuarpSerialNumber
{
  return [(VUARPProtocol *)self->_vuarpDelegate serialNumber];
}

- (id)vuarpHardwareVersion
{
  return @"unknown";
}

- (id)vuarpActiveFirmwareVersion
{
  return [(VUARPProtocol *)self->_vuarpDelegate activeFwVersion];
}

- (id)vuarpStagedFirmwareVersion
{
  return [(VUARPProtocol *)self->_vuarpDelegate stagedFwVersion];
}

- (BOOL)vuarpLastError:(unsigned int *)a3 lastAction:(unsigned int *)a4
{
  *a3 = 1;
  *a4 = 140989193;
  return 1;
}

- (id)vuarpAppleModelNumber
{
  id v2 = [(NSString *)self->_appleModelNumber copy];
  return v2;
}

- (id)vuarpHwFusingType
{
  return +[NSString stringWithFormat:@"%s", UARPAccessoryHardwareFusingToString()];
}

- (BOOL)vuarpAssetOffered
{
  unsigned __int8 v3 = [(VUARPProtocol *)self->_vuarpDelegate firmwareUpdateInitialize:0];
  if ((v3 & 1) == 0) {
    [(VUARPProtocol *)self->_vuarpDelegate firmwareUpdateCleanup:0];
  }
  return v3;
}

- (BOOL)vuarpStageAllowed
{
  return [(VUARPProtocol *)self->_vuarpDelegate firmwareUpdateAllowed:0];
}

- (BOOL)vuarpAssetFullyStaged:(id)a3
{
  v4 = (UARPAssetVersion *)a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Asset Fully Staged", v8, 2u);
  }
  stagedFwVersion = self->_stagedFwVersion;
  self->_stagedFwVersion = v4;

  return 1;
}

- (unsigned)vuarpApplyStagedAssets
{
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Apply Firmware", v6, 2u);
  }
  if (![(UARPUSBPDAccessory *)self vuarpHasStagedAssets]) {
    return 4;
  }
  if (![(VUARPProtocol *)self->_vuarpDelegate firmwareApply:0]) {
    return 2;
  }
  stagedFwVersion = self->_stagedFwVersion;
  self->_stagedFwVersion = 0;

  return 1;
}

- (BOOL)vuarpHasStagedAssets
{
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Has Staged Assets", v5, 2u);
  }
  return [(VUARPProtocol *)self->_vuarpDelegate firmwareHasStagedAssets:0];
}

- (BOOL)vuarpRescindStagedAssets
{
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Rescind Firmware", v7, 2u);
  }
  unsigned int v4 = [(VUARPProtocol *)self->_vuarpDelegate firmwareRescind:0];
  if (v4)
  {
    stagedFwVersion = self->_stagedFwVersion;
    self->_stagedFwVersion = 0;
  }
  return v4;
}

- (BOOL)vuarpFirmwarePayloadReady:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Payload %@ Ready", (uint8_t *)&v7, 0xCu);
  }

  return 1;
}

- (BOOL)vuarpFirmwarePayloadData:(id)a3 data:(id)a4 offset:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    id v13 = log;
    int v14 = 138412802;
    id v15 = v8;
    __int16 v16 = 2048;
    id v17 = [v9 length];
    __int16 v18 = 2048;
    unint64_t v19 = a5;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Write Payload %@ data length %lu, offset %lu", (uint8_t *)&v14, 0x20u);
  }
  unsigned __int8 v11 = [(VUARPProtocol *)self->_vuarpDelegate firmwareUpdateWriteData:v9 offset:a5 error:0];
  if ((v11 & 1) == 0) {
    [(VUARPProtocol *)self->_vuarpDelegate firmwareUpdateCleanup:0];
  }

  return v11;
}

- (BOOL)vuarpFirmwarePayloadComplete:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Write Payload %@ Complete", (uint8_t *)&v8, 0xCu);
  }
  unsigned __int8 v6 = [(VUARPProtocol *)self->_vuarpDelegate firmwareVerifyStagedAsset:0];
  [(VUARPProtocol *)self->_vuarpDelegate firmwareUpdateCleanup:0];

  return v6;
}

- (BOOL)vuarpDynamicAssetSolicited:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Dynamic Asset solicited %@", (uint8_t *)&v16, 0xCu);
  }
  unsigned __int8 v6 = [v4 assetTag];
  int v7 = isDynamicAssetLogs();

  if (v7)
  {
    vuarpDelegate = self->_vuarpDelegate;
    id v9 = [v4 url];
    unsigned __int8 v10 = [(VUARPProtocol *)vuarpDelegate solicitLogs:v9 error:0];
  }
  else
  {
    unsigned __int8 v11 = [v4 assetTag];
    int v12 = isDynamicAssetAnalytics();

    if (!v12)
    {
      BOOL v14 = 0;
      goto LABEL_9;
    }
    id v13 = self->_vuarpDelegate;
    id v9 = [v4 url];
    unsigned __int8 v10 = [(VUARPProtocol *)v13 solicitAnalytics:v9 error:0];
  }
  BOOL v14 = v10;

LABEL_9:
  return v14;
}

- (UARPAccessoryID)uarpAccessoryID
{
  return (UARPAccessoryID *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUarpAccessoryID:(id)a3
{
}

- (UARPAccessory)uarpAccessory
{
  return (UARPAccessory *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUarpAccessory:(id)a3
{
}

- (NSMutableSet)propertiesToQuery
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)goldrestoreQueryInProgress
{
  return self->_goldrestoreQueryInProgress;
}

- (void)setGoldrestoreQueryInProgress:(BOOL)a3
{
  self->_goldrestoreQueryInProgress = a3;
}

- (BOOL)needsConsentToStage
{
  return self->_needsConsentToStage;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (unsigned)productID
{
  return self->_productID;
}

- (BOOL)isMagSafeCable
{
  return self->_isMagSafeCable;
}

- (BOOL)isPowerAdapter
{
  return self->_isPowerAdapter;
}

- (BOOL)supportsAccMode7
{
  return self->_supportsAccMode7;
}

- (BOOL)isUSBCLightning
{
  return self->_isUSBCLightning;
}

- (BOOL)needsTransferFirmware
{
  return self->_needsTransferFirmware;
}

- (void)setNeedsTransferFirmware:(BOOL)a3
{
  self->_needsTransferFirmware = a3;
}

- (BOOL)needsTransferLogs
{
  return self->_needsTransferLogs;
}

- (void)setNeedsTransferLogs:(BOOL)a3
{
  self->_needsTransferLogs = a3;
}

- (BOOL)needsTransferAnalytics
{
  return self->_needsTransferAnalytics;
}

- (void)setNeedsTransferAnalytics:(BOOL)a3
{
  self->_needsTransferAnalytics = a3;
}

- (BOOL)autoAppliesStagedFirmware
{
  return self->_autoAppliesStagedFirmware;
}

- (void)setAutoAppliesStagedFirmware:(BOOL)a3
{
  self->_autoAppliesStagedFirmware = a3;
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  self->_requiresAuthentication = a3;
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (void)setIsAuthenticated:(BOOL)a3
{
  self->_isAuthenticated = a3;
}

- (BOOL)requiresPowerAssertion
{
  return self->_requiresPowerAssertion;
}

- (void)setRequiresPowerAssertion:(BOOL)a3
{
  self->_requiresPowerAssertion = a3;
}

- (int)authStatus
{
  return self->_authStatus;
}

- (void)setAuthStatus:(int)a3
{
  self->_authStatus = a3;
}

- (UARPAssetVersion)stagedFwVersion
{
  return (UARPAssetVersion *)objc_getProperty(self, a2, 112, 1);
}

- (VUARPProtocol)vuarpDelegate
{
  return (VUARPProtocol *)objc_getProperty(self, a2, 120, 1);
}

- (UARPHPMProtocol)hpmDelegate
{
  return (UARPHPMProtocol *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hpmDelegate, 0);
  objc_storeStrong((id *)&self->_vuarpDelegate, 0);
  objc_storeStrong((id *)&self->_stagedFwVersion, 0);
  objc_storeStrong((id *)&self->_propertiesToQuery, 0);
  objc_storeStrong((id *)&self->_uarpAccessory, 0);
  objc_storeStrong((id *)&self->_uarpAccessoryID, 0);
  objc_storeStrong((id *)&self->_appleModelNumber, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vuarpAccessory, 0);
  objc_storeStrong((id *)&self->_locationID, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end