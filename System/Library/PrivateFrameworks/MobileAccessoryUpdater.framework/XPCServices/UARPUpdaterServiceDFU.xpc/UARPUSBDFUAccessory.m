@interface UARPUSBDFUAccessory
+ (id)matchingDictionaryForIdentifier:(id)a3 serialNumber:(id)a4;
+ (id)matchingDictionaryHIDForIdentifier:(id)a3 serialNumber:(id)a4;
- (BOOL)dfuModeActive;
- (BOOL)requiresPowerAssertion;
- (BOOL)simulator;
- (BOOL)updateQueriesCompleted:(id)a3;
- (BOOL)waitForQueriesCompletion:(id)a3;
- (NSString)identifier;
- (NSString)modelName;
- (NSString)modelNumber;
- (NSString)serialNumber;
- (NSString)vendorName;
- (UARPAccessory)uarpAccessory;
- (UARPUSBDFUAccessory)initWithIdentifier:(id)a3 serialNumber:(id)a4 fwVersion:(UARPVersion *)a5;
- (UARPVersion)activeFW;
- (UARPVersion)stagedFW;
- (USBAudioAsset)pRxSuperBinaries;
- (id)description;
- (int)applyFirmware;
- (int)disableDisconnectCallback;
- (int)enableDisconnectCallback:(void *)a3 reference:(void *)a4;
- (int)sendBurnCommand:(char *)a3 length:(unsigned __int16)a4;
- (int)setDfuMode;
- (uarpPlatformEndpoint)localEP;
- (uarpPlatformRemoteEndpoint)remoteEP;
- (unsigned)connectUarpController:(id)a3 options:(uarpPlatformOptionsObj *)a4;
- (unsigned)disconnectUarpController;
- (unsigned)recvMessage:(id)a3;
- (void)setPRxSuperBinaries:(id)a3;
- (void)setRequiresPowerAssertion:(BOOL)a3;
- (void)setStagedFW:(UARPVersion)a3;
@end

@implementation UARPUSBDFUAccessory

+ (id)matchingDictionaryForIdentifier:(id)a3 serialNumber:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[UARPSupportedAccessory findByAppleModelNumber:v5];
  v8 = [v7 hardwareID];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v10 = [v7 hardwareID];
    v11 = +[USBDFUUpdater matchingDictionaryForVendorID:productId:serialNumber:](USBDFUUpdater, "matchingDictionaryForVendorID:productId:serialNumber:", [v10 vendorID], objc_msgSend(v10, "productID"), v6);
  }
  else
  {
    v12 = os_log_create("com.apple.accessoryupdater.uarp", "dfuUpdater");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100018C78();
    }

    v11 = 0;
  }

  return v11;
}

+ (id)matchingDictionaryHIDForIdentifier:(id)a3 serialNumber:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[UARPSupportedAccessory findByAppleModelNumber:v5];
  v8 = [v7 hardwareID];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v10 = [v7 hardwareID];
    v11 = +[USBDFUUpdater matchingDictionaryHIDForVendorID:productId:serialNumber:](USBDFUUpdater, "matchingDictionaryHIDForVendorID:productId:serialNumber:", [v10 vendorID], objc_msgSend(v10, "productID"), v6);
  }
  else
  {
    v12 = os_log_create("com.apple.accessoryupdater.uarp", "dfuUpdater");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100018CF8();
    }

    v11 = 0;
  }

  return v11;
}

- (UARPUSBDFUAccessory)initWithIdentifier:(id)a3 serialNumber:(id)a4 fwVersion:(UARPVersion *)a5
{
  id v8 = a3;
  id v9 = a4;
  v38.receiver = self;
  v38.super_class = (Class)UARPUSBDFUAccessory;
  v10 = [(UARPUSBDFUAccessory *)&v38 init];
  if (!v10)
  {
LABEL_11:
    v14 = v10;
    goto LABEL_12;
  }
  os_log_t v11 = os_log_create("com.apple.accessoryupdater.uarp", "dfuUpdater");
  log = v10->_log;
  v10->_log = (OS_os_log *)v11;

  v13 = v10->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_100018D78(v13);
  }
  v14 = +[UARPSupportedAccessory findByAppleModelNumber:v8];
  if (v14)
  {
    v10->_activeFW = *a5;
    v15 = (NSString *)[v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = v15;

    uint64_t v17 = [(UARPUSBDFUAccessory *)v14 modelName];
    modelName = v10->_modelName;
    v10->_modelName = (NSString *)v17;

    uint64_t v19 = [(UARPUSBDFUAccessory *)v14 appleModelNumber];
    modelNumber = v10->_modelNumber;
    v10->_modelNumber = (NSString *)v19;

    uint64_t v21 = [(UARPUSBDFUAccessory *)v14 vendorName];
    vendorName = v10->_vendorName;
    v10->_vendorName = (NSString *)v21;

    pRxSuperBinaries = v10->_pRxSuperBinaries;
    v10->_pRxSuperBinaries = 0;

    v24 = [(UARPUSBDFUAccessory *)v14 hardwareID];
    v25 = -[USBDFUUpdater initWithVendorID:productID:serialNumber:dfuModeActive:simulator:]([USBDFUUpdater alloc], "initWithVendorID:productID:serialNumber:dfuModeActive:simulator:", [v24 vendorID], objc_msgSend(v24, "productID"), v9, -[UARPUSBDFUAccessory dfuMode](v14, "dfuMode"), -[UARPUSBDFUAccessory isSimulator](v14, "isSimulator"));
    usbDfuAccessory = v10->_usbDfuAccessory;
    v10->_usbDfuAccessory = v25;

    if ([(UARPUSBDFUAccessory *)v14 isSimulator]
      && [(UARPUSBDFUAccessory *)v14 dfuMode])
    {
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      [(USBDFUUpdater *)v10->_usbDfuAccessory openDfuDevice];
      if (![(USBDFUUpdater *)v10->_usbDfuAccessory dfuGetVersionCmdMajor:(char *)&v37 + 4 minor:&v37 release:(char *)&v36 + 4 build:&v36])
      {
        v10->_stagedFW.major = HIDWORD(v37);
        v10->_stagedFW.minor = v37;
        v10->_stagedFW.release = HIDWORD(v36);
        v10->_stagedFW.build = v36;
      }
      [(USBDFUUpdater *)v10->_usbDfuAccessory closeDfuDevice];
    }
    v27 = (UARPAccessory *)[objc_alloc((Class)UARPAccessory) initWithModelNumber:v8];
    uarpAccessory = v10->_uarpAccessory;
    v10->_uarpAccessory = v27;

    [(UARPAccessory *)v10->_uarpAccessory setCapability:[(UARPUSBDFUAccessory *)v14 capabilities]];
    [(UARPAccessory *)v10->_uarpAccessory setSerialNumber:v9];
    v10->_requiresPowerAssertion = [(UARPUSBDFUAccessory *)v14 updateRequiresPowerAssertion];
    dispatch_queue_t v29 = dispatch_queue_create("com.apple.accessoryupdater.uarpdfuotp.notification.queue", 0);
    notificationQueue = v10->_notificationQueue;
    v10->_notificationQueue = (OS_dispatch_queue *)v29;

    v10->_mNotificationPort = IONotificationPortCreate(kIOMainPortDefault);
    v31 = (NSCondition *)objc_alloc_init((Class)NSCondition);
    queriesCompleteLock = v10->_queriesCompleteLock;
    v10->_queriesCompleteLock = v31;

    [(NSCondition *)v10->_queriesCompleteLock setName:@"queriesComplete"];
    v33 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pendingProperties = v10->_pendingProperties;
    v10->_pendingProperties = v33;

    goto LABEL_11;
  }
LABEL_12:

  return v14;
}

- (unsigned)connectUarpController:(id)a3 options:(uarpPlatformOptionsObj *)a4
{
  id v6 = a3;
  int v7 = *(_DWORD *)&a4->upgradeOnly;
  long long v8 = *(_OWORD *)&a4->responseTimeout;
  *(_OWORD *)&self->_options.maxTxPayloadLength = *(_OWORD *)&a4->maxTxPayloadLength;
  *(_OWORD *)&self->_options.responseTimeout = v8;
  *(_DWORD *)&self->_options.upgradeOnly = v7;
  *(void *)&self->_options.maxTxPayloadLength = 0x100000001000;
  self->_options.payloadWindowLength = 4096;
  *(_OWORD *)&self->_callbacks.fTxWatchdogSet = 0u;
  *(_OWORD *)&self->_callbacks.fActiveFirmwareVersion = 0u;
  *(_OWORD *)&self->_callbacks.fVendorSpecificCheckValidToSend = 0u;
  *(_OWORD *)&self->_callbacks.fVendorSpecificRecvMsg = 0u;
  *(_OWORD *)&self->_callbacks.fDownstreamRecvMessage = 0u;
  *(_OWORD *)&self->_callbacks.fDownstreamUnreachable = 0u;
  *(_OWORD *)&self->_callbacks.fDownstreamDiscovery = 0u;
  *(_OWORD *)&self->_callbacks.fLogDebug = 0u;
  *(_OWORD *)&self->_callbacks.fLogError = 0u;
  *(_OWORD *)&self->_callbacks.fHashLog = 0u;
  *(_OWORD *)&self->_callbacks.fHashUpdate = 0u;
  *(_OWORD *)&self->_callbacks.fHashInfo = 0u;
  *(_OWORD *)&self->_callbacks.fDecompressBuffer = 0u;
  *(_OWORD *)&self->_callbacks.fFriendlyName = 0u;
  *(_OWORD *)&self->_callbacks.fLayer2WatchdogCancel = 0u;
  *(_OWORD *)&self->_callbacks.fRescindAllAssetsAck = 0u;
  *(_OWORD *)&self->_callbacks.fAssetSolicitation = 0u;
  *(_OWORD *)&self->_callbacks.fStagedFirmwareVersionResponse = 0u;
  *(_OWORD *)&self->_callbacks.fLastErrorResponse = 0u;
  *(_OWORD *)&self->_callbacks.fHardwareVersionResponse = 0u;
  *(_OWORD *)&self->_callbacks.fActiveFirmwareVersionResponse = 0u;
  *(_OWORD *)&self->_callbacks.fModelNameResponse = 0u;
  *(_OWORD *)&self->_callbacks.fSerialNumberResponse = 0u;
  *(_OWORD *)&self->_callbacks.fApplyStagedAssetsResponse = 0u;
  *(_OWORD *)&self->_callbacks.fManufacturerNameResponse = 0u;
  *(_OWORD *)&self->_callbacks.fDataTransferResumeAck = 0u;
  *(_OWORD *)&self->_callbacks.fDynamicAssetOffered = 0u;
  *(_OWORD *)&self->_callbacks.fSendMessage = 0u;
  *(_OWORD *)&self->_callbacks.fDataTransferPauseAck = 0u;
  *(_OWORD *)&self->_callbacks.fRequestBuffer = 0u;
  *(_OWORD *)&self->_callbacks.fRequestTransmitMsgBuffer = 0u;
  self->_callbacks.fRequestBuffer = sub_10000A208;
  self->_callbacks.fReturnBuffer = sub_10000A244;
  self->_callbacks.fRequestTransmitMsgBuffer = sub_10000A24C;
  self->_callbacks.fReturnTransmitMsgBuffer = sub_10000A2B4;
  self->_callbacks.fSendMessage = sub_10000A2C4;
  self->_callbacks.fSuperBinaryOffered = sub_10000A39C;
  self->_callbacks.fDynamicAssetOffered = sub_10000A5C0;
  self->_callbacks.fApplyStagedAssets = sub_10000A648;
  self->_callbacks.fManufacturerName = sub_10000A6FC;
  self->_callbacks.fModelName = sub_10000A7F8;
  self->_callbacks.fFriendlyName = sub_10000A7F8;
  self->_callbacks.fSerialNumber = sub_10000A8F8;
  self->_callbacks.fHardwareVersion = sub_10000A9F4;
  self->_callbacks.fActiveFirmwareVersion2 = sub_10000AA8C;
  self->_callbacks.fStagedFirmwareVersion2 = sub_10000AAFC;
  self->_localEpApple.callbacks.fAppleModelNumber = sub_10000AB6C;
  self->_localEpApple.callbacks.fHwFusingType = sub_10000AC68;
  *(_WORD *)&self->_localEpApple.supportsPersonalization = 0;
  self->_localEP.fVendorSpecific = uarpPlatformEndpointCallbackAppleSpecific;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    LOWORD(v29) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Init Platform Endpoint", (uint8_t *)&v29, 2u);
  }
  unsigned int v10 = uarpPlatformEndpointInit((char *)&self->_localEP, (uint64_t)self, 0, (long long *)&self->_options, &self->_callbacks, (uint64_t)&self->_localEpApple, (uint64_t)uarpPlatformEndpointCallbackAppleSpecific);
  os_log_t v11 = self->_log;
  if (v10)
  {
    unsigned int v12 = v10;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100018DFC(v11, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_INFO))
    {
      int v29 = 138412290;
      v30 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_INFO, "Link Controller to Accessory %@", (uint8_t *)&v29, 0xCu);
    }
    unsigned int v12 = uarpPlatformRemoteEndpointAdd((uint64_t)&self->_localEP, (uint64_t)&self->_remoteEP, (long long *)&self->_options, (uint64_t)v6);
    if (v12)
    {
      v20 = self->_log;
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
        sub_100018DFC(v20, v21, v22, v23, v24, v25, v26, v27);
      }
    }
  }

  return v12;
}

- (unsigned)disconnectUarpController
{
  unsigned int v3 = uarpPlatformRemoteEndpointRemove((uint64_t)&self->_localEP, (uint64_t)&self->_remoteEP);
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_100018E74(log, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  return v3;
}

- (int)enableDisconnectCallback:(void *)a3 reference:(void *)a4
{
  kern_return_t v14;
  io_object_t v15;
  OS_os_log *log;
  int v18;
  const char *v19;
  __int16 v20;
  UARPUSBDFUAccessory *v21;

  IONotificationPortSetDispatchQueue(self->_mNotificationPort, (dispatch_queue_t)self->_notificationQueue);
  identifier = self->_identifier;
  uint64_t v8 = [(UARPAccessory *)self->_uarpAccessory serialNumber];
  uint64_t v9 = +[UARPUSBDFUAccessory matchingDictionaryForIdentifier:identifier serialNumber:v8];

  Current = CFRunLoopGetCurrent();
  RunLoopSource = IONotificationPortGetRunLoopSource(self->_mNotificationPort);
  CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
  mNotificationPort = self->_mNotificationPort;
  CFDictionaryRef v13 = v9;
  uint64_t v14 = IOServiceAddMatchingNotification(mNotificationPort, "IOServiceTerminate", v13, (IOServiceMatchingCallback)a3, a4, &self->_notificationIterator);
  if (!v14)
  {
    while (1)
    {
      uint64_t v15 = IOIteratorNext(self->_notificationIterator);
      if (!v15) {
        break;
      }
      IOObjectRelease(v15);
    }
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = 136315394;
      uint64_t v19 = "-[UARPUSBDFUAccessory enableDisconnectCallback:reference:]";
      v20 = 2112;
      uint64_t v21 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: Enabled disconnect callback for %@", (uint8_t *)&v18, 0x16u);
    }
  }

  return v14;
}

- (int)disableDisconnectCallback
{
  BOOLean_t IsValid = IOIteratorIsValid(self->_notificationIterator);
  log = self->_log;
  BOOL v5 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO);
  if (IsValid)
  {
    if (v5)
    {
      int v7 = 136315394;
      uint64_t v8 = "-[UARPUSBDFUAccessory disableDisconnectCallback]";
      __int16 v9 = 2112;
      uint64_t v10 = self;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: Disabling disconnect callback for %@", (uint8_t *)&v7, 0x16u);
    }
    IOObjectRelease(self->_notificationIterator);
    self->_notificationIterator = 0;
  }
  else if (v5)
  {
    int v7 = 136315394;
    uint64_t v8 = "-[UARPUSBDFUAccessory disableDisconnectCallback]";
    __int16 v9 = 2112;
    uint64_t v10 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: Disconnect callback is already disabled for %@", (uint8_t *)&v7, 0x16u);
  }
  return 0;
}

- (BOOL)waitForQueriesCompletion:(id)a3
{
  id v4 = a3;
  [(NSCondition *)self->_queriesCompleteLock lock];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        -[NSMutableSet addObject:](self->_pendingProperties, "addObject:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v7);
  }

  if (!self->_queriesCompleted)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
    {
      pendingProperties = self->_pendingProperties;
      *(_DWORD *)buf = 136315394;
      v20 = "-[UARPUSBDFUAccessory waitForQueriesCompletion:]";
      __int16 v21 = 2112;
      uint64_t v22 = pendingProperties;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: Waiting for property queries %@", buf, 0x16u);
    }
    [(NSCondition *)self->_queriesCompleteLock wait];
    unsigned int v12 = self->_log;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[UARPUSBDFUAccessory waitForQueriesCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_INFO, "%s: Pending properties completed", buf, 0xCu);
    }
  }
  [(NSCondition *)self->_queriesCompleteLock unlock];
  BOOL queriesCompleted = self->_queriesCompleted;

  return queriesCompleted;
}

- (BOOL)updateQueriesCompleted:(id)a3
{
  id v4 = a3;
  [(NSCondition *)self->_queriesCompleteLock lock];
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    __int16 v9 = "-[UARPUSBDFUAccessory updateQueriesCompleted:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "%s: Removing pending property query %@", (uint8_t *)&v8, 0x16u);
  }
  [(NSMutableSet *)self->_pendingProperties removeObject:v4];
  if (![(NSMutableSet *)self->_pendingProperties count])
  {
    self->_BOOL queriesCompleted = 1;
    [(NSCondition *)self->_queriesCompleteLock signal];
  }
  [(NSCondition *)self->_queriesCompleteLock unlock];
  BOOL queriesCompleted = self->_queriesCompleted;

  return queriesCompleted;
}

- (uarpPlatformEndpoint)localEP
{
  return &self->_localEP;
}

- (uarpPlatformRemoteEndpoint)remoteEP
{
  return &self->_remoteEP;
}

- (unsigned)recvMessage:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_100018F74((os_log_t)log);
  }
  id v6 = v4;
  unsigned int v7 = uarpPlatformEndpointRecvMessage((uint64_t)&self->_localEP, (uint64_t)&self->_remoteEP, (unsigned __int16 *)[v6 bytes], objc_msgSend(v6, "length"));
  if (v7)
  {
    int v8 = self->_log;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      sub_100018EEC((uint64_t)v6, v7, (os_log_t)v8);
    }
  }

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)serialNumber
{
  return (NSString *)[(UARPAccessory *)self->_uarpAccessory serialNumber];
}

- (int)setDfuMode
{
  return [(USBDFUUpdater *)self->_usbDfuAccessory setDfuMode];
}

- (BOOL)dfuModeActive
{
  return [(USBDFUUpdater *)self->_usbDfuAccessory dfuMode];
}

- (BOOL)simulator
{
  return [(USBDFUUpdater *)self->_usbDfuAccessory simulator];
}

- (id)description
{
  identifier = self->_identifier;
  unsigned int v4 = [(USBDFUUpdater *)self->_usbDfuAccessory vid];
  unsigned int v5 = [(USBDFUUpdater *)self->_usbDfuAccessory pid];
  id v6 = [(UARPUSBDFUAccessory *)self serialNumber];
  if ([(UARPUSBDFUAccessory *)self dfuModeActive]) {
    unsigned int v7 = "DFU";
  }
  else {
    unsigned int v7 = "APP";
  }
  unsigned int v8 = [(UARPUSBDFUAccessory *)self simulator];
  __int16 v9 = "NO";
  if (v8) {
    __int16 v9 = "YES";
  }
  __int16 v10 = +[NSString stringWithFormat:@"<%@, vid=%d, pid=%d, %@, dfuMode=<%s> simulator=<%s>>", identifier, v4, v5, v6, v7, v9];

  return v10;
}

- (int)sendBurnCommand:(char *)a3 length:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  int v7 = [(USBDFUUpdater *)self->_usbDfuAccessory openDfuDevice];
  if (!v7)
  {
    unsigned int v8 = [(USBDFUUpdater *)self->_usbDfuAccessory sendDfuBlockData:a3 length:v4];
    if (v8)
    {
      int v7 = v8;
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
        sub_10001918C(v7, log);
      }
    }
    else
    {
      unsigned int v10 = [(USBDFUUpdater *)self->_usbDfuAccessory sendDfuBlockData:0 length:0];
      if (v10)
      {
        int v7 = v10;
        id v11 = self->_log;
        if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
          sub_1000190FC((os_log_t)v11);
        }
      }
      else
      {
        unsigned int v12 = [(USBDFUUpdater *)self->_usbDfuAccessory dfuSetState:7];
        if (v12)
        {
          int v7 = v12;
          CFDictionaryRef v13 = self->_log;
          if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
            sub_100019084(v13, v14, v15, v16, v17, v18, v19, v20);
          }
        }
        else
        {
          unsigned __int8 v21 = 0;
          unsigned int v22 = 0;
          while (1)
          {
            int v44 = 0;
            uint64_t v43 = 0;
            unsigned int v23 = [(USBDFUUpdater *)self->_usbDfuAccessory dfuGetStatusCmd:&v43];
            if (v23) {
              break;
            }
            if (BYTE4(v43) != 7) {
              ++v21;
            }
            v22 += v44;
            usleep(1000 * v44);
            if (v22 >> 4 > 0x270 || v21 >= 3u)
            {
              char v42 = 11;
              if (![(USBDFUUpdater *)self->_usbDfuAccessory dfuGetStateCmd:&v42] && v42 == 2) {
                return 0;
              }
              v34 = self->_log;
              if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_ERROR)) {
                sub_10001900C(v34, v35, v36, v37, v38, v39, v40, v41);
              }
              [(USBDFUUpdater *)self->_usbDfuAccessory closeDfuDevice];
              return -536870212;
            }
          }
          int v7 = v23;
          uint64_t v25 = self->_log;
          if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR)) {
            sub_10001900C(v25, v26, v27, v28, v29, v30, v31, v32);
          }
        }
      }
    }
    [(USBDFUUpdater *)self->_usbDfuAccessory closeDfuDevice];
  }
  return v7;
}

- (int)applyFirmware
{
  unsigned int v3 = [(USBDFUUpdater *)self->_usbDfuAccessory openDfuDevice];
  if (v3)
  {
    int v4 = v3;
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_100019290(log, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else if ([(USBDFUUpdater *)self->_usbDfuAccessory simulator] {
         && (unsigned int v13 = [(USBDFUUpdater *)self->_usbDfuAccessory dfuGetVersionCmdMajor:&self->_stagedFW minor:&self->_stagedFW.minor release:&self->_stagedFW.release build:&self->_stagedFW.build]) != 0)
  }
  {
    int v4 = v13;
    uint64_t v14 = self->_log;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      sub_100019218(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    [(USBDFUUpdater *)self->_usbDfuAccessory closeDfuDevice];
  }
  else
  {
    [(UARPUSBDFUAccessory *)self disableDisconnectCallback];
    if ([(USBDFUUpdater *)self->_usbDfuAccessory dfuSetState:0])
    {
      unsigned int v22 = self->_log;
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR)) {
        sub_100019218(v22, v23, v24, v25, v26, v27, v28, v29);
      }
      return 54;
    }
    else
    {
      [(USBDFUUpdater *)self->_usbDfuAccessory closeDfuDevice];
      int v4 = 0;
      self->_activeFW = self->_stagedFW;
      self->_stagedFW = 0u;
    }
  }
  return v4;
}

- (void)setStagedFW:(UARPVersion)a3
{
  unint64_t v3 = *(void *)&a3.release;
  unint64_t v4 = *(void *)&a3.major;
  self->_stagedFW = a3;
  if ([(USBDFUUpdater *)self->_usbDfuAccessory simulator]
    && [(USBDFUUpdater *)self->_usbDfuAccessory dfuSetVersionCmdMajor:v4 minor:HIDWORD(v4) release:v3 build:HIDWORD(v3)])
  {
    usbDfuAccessory = self->_usbDfuAccessory;
    [(USBDFUUpdater *)usbDfuAccessory closeDfuDevice];
  }
}

- (UARPAccessory)uarpAccessory
{
  return (UARPAccessory *)objc_getProperty(self, a2, 1888, 1);
}

- (NSString)modelName
{
  return (NSString *)objc_getProperty(self, a2, 1896, 1);
}

- (NSString)modelNumber
{
  return (NSString *)objc_getProperty(self, a2, 1904, 1);
}

- (NSString)vendorName
{
  return (NSString *)objc_getProperty(self, a2, 1912, 1);
}

- (UARPVersion)activeFW
{
  objc_copyStruct(v4, &self->_activeFW, 16, 1, 0);
  uint64_t v2 = v4[0];
  uint64_t v3 = v4[1];
  result.release = v3;
  result.build = HIDWORD(v3);
  result.major = v2;
  result.minor = HIDWORD(v2);
  return result;
}

- (UARPVersion)stagedFW
{
  uint64_t v2 = *(void *)&self->_stagedFW.release;
  uint64_t v3 = *(void *)&self->_stagedFW.major;
  result.release = v2;
  result.build = HIDWORD(v2);
  result.major = v3;
  result.minor = HIDWORD(v3);
  return result;
}

- (BOOL)requiresPowerAssertion
{
  return self->_requiresPowerAssertion;
}

- (void)setRequiresPowerAssertion:(BOOL)a3
{
  self->_requiresPowerAssertion = a3;
}

- (USBAudioAsset)pRxSuperBinaries
{
  return (USBAudioAsset *)objc_getProperty(self, a2, 1920, 1);
}

- (void)setPRxSuperBinaries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pRxSuperBinaries, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_modelNumber, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_uarpAccessory, 0);
  objc_storeStrong((id *)&self->_pendingProperties, 0);
  objc_storeStrong((id *)&self->_queriesCompleteLock, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_usbDfuAccessory, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end