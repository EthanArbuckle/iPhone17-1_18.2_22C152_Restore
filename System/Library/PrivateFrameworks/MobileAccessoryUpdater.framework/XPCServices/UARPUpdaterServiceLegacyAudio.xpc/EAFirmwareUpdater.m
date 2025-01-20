@interface EAFirmwareUpdater
+ (id)appProtocolStringWithEAID:(id)a3;
+ (id)bootloaderProtocolStringWithEAID:(id)a3;
+ (id)findAccessoryWithProtocolString:(id)a3 serialNum:(id)a4;
+ (id)getEAFirmwareRevisionActive:(id)a3 forProtocol:(id)a4;
+ (id)getEAFirmwareRevisionPending:(id)a3 forProtocol:(id)a4;
+ (id)multiAssetAppProtocolStringWithEAID:(id)a3;
- (BOOL)closeEASession;
- (BOOL)excludeUniqueAccessoryCheck;
- (BOOL)findAccessory;
- (BOOL)forceSilentUpdate;
- (BOOL)isDeploymentAllowed:(id)a3;
- (BOOL)isMultiAssetSession;
- (BOOL)isRestartRequired;
- (BOOL)isSleepWakeRequired;
- (BOOL)isUrgentUpdate;
- (BOOL)overrideProtocol;
- (BOOL)skipDFUMode;
- (BOOL)stitchManifestInSuperBinary:(id)a3 withManifest:(id)a4 withId:(unsigned int)a5;
- (BOOL)updateRequiresPersonalization;
- (BOOL)updateRequiresSuperBinary;
- (EAAccessory)accessory;
- (EAFirmwareUpdater)initWithDeviceClass:(id)a3 assetType:(id)a4 skipDFU:(BOOL)a5 byteEscape:(BOOL)a6 skipReconnect:(BOOL)a7 skipVersionCheck:(BOOL)a8 options:(id)a9 serialNum:(id)a10;
- (EASession)session;
- (NSDictionary)manifestIDs;
- (NSNumber)cumulativeCloak;
- (NSNumber)cumulativeProgressPercent;
- (NSNumber)cumulativeTimeTaken;
- (NSNumber)currentSessionTimeTaken;
- (NSNumber)resumeCount;
- (NSNumber)resumedFromPercentNum;
- (NSString)appProtocol;
- (NSString)bootloaderProtocol;
- (NSString)currentFirmwareVersionOnAcc;
- (NSString)firmwareBundleFilename;
- (NSString)firmwareVersionAvailable;
- (NSString)modelNumber;
- (NSString)multiAssetAppProtocol;
- (NSString)name;
- (NSString)protocolString;
- (NSString)serialNumber;
- (NSString)transportType;
- (NSURL)firmwareBundleURL;
- (id)applyCompletion;
- (id)applyFirmware:(id)a3 progress:(id)a4 update:(id)a5 personalization:(id)a6;
- (id)assetWithMaxVersion:(id)a3;
- (id)createEndOfUpdateEventDict:(id)a3 error:(id)a4;
- (id)flushOutput;
- (id)getDeviceClassName;
- (id)openSession;
- (id)queryPredicate;
- (id)supportedProtocolForAccessory:(id)a3;
- (id)validateAsset;
- (id)validateAssetAttributes:(id)a3;
- (id)writeData:(id)a3;
- (unsigned)getPersonalizationID;
- (unsigned)getWhitelistedPersonalizationFields;
- (void)_accessoryDidConnect:(id)a3;
- (void)_accessoryDidDisconnect:(id)a3;
- (void)closeSession;
- (void)dealloc;
- (void)firmwareUpdateComplete:(id)a3 error:(id)a4;
- (void)handleFirmwareUpdateStatus:(id)a3;
- (void)handleInputData;
- (void)handleSessionError:(unsigned int)a3 message:(id)a4;
- (void)logStatusString:(id)a3;
- (void)personalizationResponse:(id)a3 error:(id)a4;
- (void)processPersonalizationInfoFromAccessory:(id)a3;
- (void)reconnectTimerDidFire:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setAppProtocol:(id)a3;
- (void)setApplyCompletion:(id)a3;
- (void)setBootloaderProtocol:(id)a3;
- (void)setCloseEASession:(BOOL)a3;
- (void)setCumulativeCloak:(id)a3;
- (void)setCumulativeProgressPercent:(id)a3;
- (void)setCumulativeTimeTaken:(id)a3;
- (void)setCurrentFirmwareVersionOnAcc:(id)a3;
- (void)setCurrentSessionTimeTaken:(id)a3;
- (void)setExcludeUniqueAccessoryCheck:(BOOL)a3;
- (void)setFirmwareBundle:(id)a3;
- (void)setFirmwareBundleFilename:(id)a3;
- (void)setFirmwareBundleURL:(id)a3;
- (void)setFirmwareLocalURL:(id)a3;
- (void)setFirmwareURL:(id)a3 withManifest:(id)a4 signature:(id)a5 certificate:(id)a6 hash:(id)a7;
- (void)setFirmwareVersionAvailable:(id)a3;
- (void)setForceSilentUpdate:(BOOL)a3;
- (void)setIsMultiAssetSession:(BOOL)a3;
- (void)setManifestIDs:(id)a3;
- (void)setModelNumber:(id)a3;
- (void)setMultiAssetAppProtocol:(id)a3;
- (void)setName:(id)a3;
- (void)setOverrideProtocol:(BOOL)a3;
- (void)setProtocolString:(id)a3;
- (void)setResumeCount:(id)a3;
- (void)setResumedFromPercentNum:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSession:(id)a3;
- (void)setSkipDFUMode:(BOOL)a3;
- (void)setTransportType:(id)a3;
- (void)startReconnectTimer:(int)a3;
- (void)stopReconnectTimer;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
- (void)updateComplete:(id)a3 error:(id)a4;
- (void)updateProgress:(double)a3;
@end

@implementation EAFirmwareUpdater

+ (id)bootloaderProtocolStringWithEAID:(id)a3
{
  return +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.accessory.updater", @"dfu", a3];
}

+ (id)appProtocolStringWithEAID:(id)a3
{
  return +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.accessory.updater", @"app", a3];
}

+ (id)multiAssetAppProtocolStringWithEAID:(id)a3
{
  return +[NSString stringWithFormat:@"%@.%@.%@", @"com.apple.accessory.updater", @"app.multiasset", a3];
}

+ (id)getEAFirmwareRevisionActive:(id)a3 forProtocol:(id)a4
{
  id v4 = 0;
  if (a3)
  {
    if (a4)
    {
      id v4 = [a3 firmwareRevisionActive];
      unsigned int v7 = objc_msgSend(objc_msgSend(a3, "modelNumber"), "isEqualToString:", @"A2084");
      unsigned __int8 v8 = objc_msgSend(objc_msgSend(a3, "modelNumber"), "isEqualToString:", @"A2096");
      if ((objc_msgSend(objc_msgSend(a3, "modelNumber"), "isEqualToString:", @"A3184") & 1) != 0
        || (v8 & 1) != 0
        || v7)
      {
        if ([a3 protocolDetails]
          && objc_msgSend(objc_msgSend(a3, "protocolDetails"), "objectForKey:", a4))
        {
          id v9 = objc_msgSend(objc_msgSend(a3, "protocolDetails"), "objectForKey:", a4);
          id v4 = [v9 objectForKey:EAProtocolFirmwareVersionActiveKey];
          NSLog(@"%s(): fwRevisionActive=%@ forProtocol=%@", "+[EAFirmwareUpdater getEAFirmwareRevisionActive:forProtocol:]", v4, a4);
        }
        else
        {
          NSLog(@"%s() EAAccessory has no protocolDetails=%@ for protocol", "+[EAFirmwareUpdater getEAFirmwareRevisionActive:forProtocol:]", [a3 protocolDetails], a4);
        }
      }
    }
  }
  return v4;
}

+ (id)getEAFirmwareRevisionPending:(id)a3 forProtocol:(id)a4
{
  id v4 = 0;
  if (a3)
  {
    if (a4)
    {
      id v4 = [a3 firmwareRevisionPending];
      unsigned int v7 = objc_msgSend(objc_msgSend(a3, "modelNumber"), "isEqualToString:", @"A2084");
      unsigned __int8 v8 = objc_msgSend(objc_msgSend(a3, "modelNumber"), "isEqualToString:", @"A2096");
      if ((objc_msgSend(objc_msgSend(a3, "modelNumber"), "isEqualToString:", @"A3184") & 1) != 0
        || (v8 & 1) != 0
        || v7)
      {
        if ([a3 protocolDetails]
          && objc_msgSend(objc_msgSend(a3, "protocolDetails"), "objectForKey:", a4))
        {
          id v9 = objc_msgSend(objc_msgSend(a3, "protocolDetails"), "objectForKey:", a4);
          id v4 = [v9 objectForKey:EAProtocolFirmwareVersionPendingKey];
          NSLog(@"%s(): fwRevisionPending=%@ forProtocol=%@", "+[EAFirmwareUpdater getEAFirmwareRevisionPending:forProtocol:]", v4, a4);
        }
        else
        {
          NSLog(@"%s() EAAccessory has no protocolDetails=%@ for protocol", "+[EAFirmwareUpdater getEAFirmwareRevisionPending:forProtocol:]", [a3 protocolDetails], a4);
        }
      }
    }
  }
  return v4;
}

+ (id)findAccessoryWithProtocolString:(id)a3 serialNum:(id)a4
{
  if (a3)
  {
    v6 = +[EAAccessoryManager sharedAccessoryManager];
    if (v6)
    {
      unsigned int v7 = [(EAAccessoryManager *)v6 connectedAccessories];
      if (v7)
      {
        unsigned __int8 v8 = v7;
        if ([(NSArray *)v7 count])
        {
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
          if (v9)
          {
            id v10 = v9;
            obj = v8;
            uint64_t v21 = *(void *)v27;
            do
            {
              for (i = 0; i != v10; i = (char *)i + 1)
              {
                if (*(void *)v27 != v21) {
                  objc_enumerationMutation(obj);
                }
                v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
                id v13 = [v12 protocolStrings];
                if (v13)
                {
                  v14 = v13;
                  long long v24 = 0u;
                  long long v25 = 0u;
                  long long v22 = 0u;
                  long long v23 = 0u;
                  id v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
                  if (v15)
                  {
                    id v16 = v15;
                    uint64_t v17 = *(void *)v23;
LABEL_13:
                    uint64_t v18 = 0;
                    while (1)
                    {
                      if (*(void *)v23 != v17) {
                        objc_enumerationMutation(v14);
                      }
                      if ([*(id *)(*((void *)&v22 + 1) + 8 * v18) rangeOfString:a3] != (id)0x7FFFFFFFFFFFFFFFLL
                        && (!a4
                         || (objc_msgSend(a4, "isEqualToString:", objc_msgSend(v12, "serialNumber")) & 1) != 0))
                      {
                        break;
                      }
                      if (v16 == (id)++v18)
                      {
                        id v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
                        if (v16) {
                          goto LABEL_13;
                        }
                        goto LABEL_23;
                      }
                    }
                    if (v12) {
                      return v12;
                    }
                  }
                }
LABEL_23:
                ;
              }
              id v10 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
            }
            while (v10);
          }
        }
      }
    }
  }
  NSLog(@"%s() No EAAccessory found for protocol=%@", a2, "+[EAFirmwareUpdater findAccessoryWithProtocolString:serialNum:]", a3);
  return 0;
}

- (EAFirmwareUpdater)initWithDeviceClass:(id)a3 assetType:(id)a4 skipDFU:(BOOL)a5 byteEscape:(BOOL)a6 skipReconnect:(BOOL)a7 skipVersionCheck:(BOOL)a8 options:(id)a9 serialNum:(id)a10
{
  v27.receiver = self;
  v27.super_class = (Class)EAFirmwareUpdater;
  id v15 = [(EAFirmwareUpdater *)&v27 initWithAssetType:a4];
  if (!v15) {
    goto LABEL_14;
  }
  if (([a3 hasPrefix:@"com.apple.MobileAccessoryUpdater.EA"] & 1) == 0
    && ([a3 hasPrefix:@"com.apple.UARP.EA"] & 1) == 0)
  {
    NSLog(@"%s: Invalid deviceClass base = %@\n", "-[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]", a3);
    goto LABEL_14;
  }
  id v16 = [a3 rangeOfString:@"dfu"];
  id v17 = [a3 rangeOfString:@"app"];
  id v18 = [a3 rangeOfString:@"app.multiasset"];
  id v19 = v18;
  if (v16 == (id)0x7FFFFFFFFFFFFFFFLL && v17 == (id)0x7FFFFFFFFFFFFFFFLL && v18 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    NSLog(@"%s: Invalid deviceClass extension = %@\n", "-[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]", a3);
    goto LABEL_14;
  }
  id v20 = [a3 componentsSeparatedByString:@"."];
  if ([v20 count] != (id)7 && objc_msgSend(v20, "count") != (id)8)
  {
    NSLog(@"%s: Invalid deviceClass components = %@\n", "-[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]", a3);
    goto LABEL_14;
  }
  id v21 = [v20 lastObject];
  if (!v21)
  {
    NSLog(@"%s: Invalid deviceClass eaID string = %@\n", "-[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]", a3);
    goto LABEL_14;
  }
  id v22 = v21;
  v15->_overrideProtocol = 0;
  v15->_firmwareUpdateIsUrgent = 0;
  v15->_firmwareUpdateComplete = 0;
  v15->_isExpectingReconnect = 0;
  v15->_forceSilentUpdate = 0;
  v15->_skipDFUMode = a5;
  v15->_skipVersionCheck = a8;
  v15->_closeEASession = 0;
  v15->_excludeUniqueAccessoryCheck = 0;
  v15->_reconnectTimer = 0;
  v15->_progressHandler = 0;
  v15->_applyCompletion = 0;
  v15->_personalizationRequestHandler = 0;
  v15->_updateHandler = 0;
  v15->_currentFirmwareVersionOnAcc = 0;
  v15->_firmwareVersionAvailable = 0;
  v15->_outputData = 0;
  pthread_mutex_init(&v15->_flushOutputLock, 0);
  v15->_currentSessionTimeTaken = (NSNumber *)&off_100038CB0;
  v15->_cumulativeBytesDownloaded = (NSNumber *)&off_100038CB0;
  v15->_totalBytesForCompleteUpdate = (NSNumber *)&off_100038CB0;
  v15->_cumulativeProgressPercent = (NSNumber *)&off_100038CB0;
  v15->_cumulativeTimeTaken = (NSNumber *)&off_100038CB0;
  v15->_cumulativeCloakTime = (NSNumber *)&off_100038CB0;
  v15->_resumeCount = (NSNumber *)&off_100038CB0;
  -[EAFirmwareUpdater setBootloaderProtocol:](v15, "setBootloaderProtocol:", [(id)objc_opt_class() bootloaderProtocolStringWithEAID:v22]);
  -[EAFirmwareUpdater setAppProtocol:](v15, "setAppProtocol:", [(id)objc_opt_class() appProtocolStringWithEAID:v22]);
  -[EAFirmwareUpdater setMultiAssetAppProtocol:](v15, "setMultiAssetAppProtocol:", [(id)objc_opt_class() multiAssetAppProtocolStringWithEAID:v22]);
  v15->_manifestIDs = 0;
  v15->_manifestList = 0;
  v15->_manifestIndex = 0;
  v15->_serialNumber = (NSString *)[a10 copy];
  if (v19 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v16 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if (v17 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        -[EAFirmwareUpdater log:format:](v15, "log:format:", 5, @"%s: huh? Unknown session type in device class %@", "-[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]", a3);
LABEL_14:
        long long v23 = v15;
        return 0;
      }
      [(EAFirmwareUpdater *)v15 setProtocolString:v15->_appProtocol];
      v15->_isMultiAssetSession = 0;
      v15->_byteEscape = a6;
      int v24 = 468;
      a6 = a7;
    }
    else
    {
      [(EAFirmwareUpdater *)v15 setProtocolString:v15->_bootloaderProtocol];
      v15->_isMultiAssetSession = 0;
      int v24 = 467;
    }
  }
  else
  {
    [(EAFirmwareUpdater *)v15 setProtocolString:v15->_multiAssetAppProtocol];
    a6 = 0;
    v15->_isMultiAssetSession = 1;
    v15->_skipDFUMode = 1;
    int v24 = 467;
  }
  v15->MobileAssetUpdater_opaque[v24] = a6;
  v15->_deviceClass = (NSString *)a3;
  v15->_deviceOptions = (NSDictionary *)a9;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &stru_1000315C8);
  [+[EAAccessoryManager sharedAccessoryManager] registerForLocalNotifications];
  [+[EAAccessoryManager sharedAccessoryManager] setShouldAllowInternalProtocols:1];
  +[EAAccessoryManager registerCapabilities:64];
  if (![(EAFirmwareUpdater *)v15 findAccessory])
  {
    NSLog(@"%s: No EAAccessory found matching protocol = %@\n", "-[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]", v15->_protocolString);
    goto LABEL_14;
  }
  v15->_overrideProtocol = [(NSString *)[(EAFirmwareUpdater *)v15 protocolString] hasSuffix:@"-override"];
  if (!v15->_serialNumber) {
    v15->_serialNumber = (NSString *)[(NSString *)[(EAAccessory *)[(EAFirmwareUpdater *)v15 accessory] serialNumber] copy];
  }
  v15->_modelNumber = (NSString *)[(NSString *)[(EAAccessory *)[(EAFirmwareUpdater *)v15 accessory] modelNumber] copy];
  v15->_name = (NSString *)[(NSString *)[(EAAccessory *)[(EAFirmwareUpdater *)v15 accessory] name] copy];
  deviceOptions = v15->_deviceOptions;
  if (deviceOptions) {
    LOBYTE(deviceOptions) = objc_msgSend(-[NSDictionary objectForKey:](deviceOptions, "objectForKey:", @"closeEASession"), "BOOLValue");
  }
  v15->_closeEASession = (char)deviceOptions;
  NSLog(@"%s: _accessory = %@\n", "-[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]", v15->_accessory);
  -[EAFirmwareUpdater log:format:](v15, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]", [objc_alloc((Class)NSString) initWithFormat:@"deviceClass=%@ protocolString=%@ isMultiAssetSession=%d byteEscape=%d skipDFU=%d", v15->_deviceClass, -[EAFirmwareUpdater protocolString](v15, "protocolString"), v15->_isMultiAssetSession, v15->_byteEscape, v15->_skipDFUMode]);
  -[EAFirmwareUpdater log:format:](v15, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater initWithDeviceClass:assetType:skipDFU:byteEscape:skipReconnect:skipVersionCheck:options:serialNum:]", [objc_alloc((Class)NSString) initWithFormat:@"appProtocol=%@ bootloaderProtocol=%@ multiAssetAppProtocol=%@", -[EAFirmwareUpdater appProtocol](v15, "appProtocol"), -[EAFirmwareUpdater bootloaderProtocol](v15, "bootloaderProtocol"), -[EAFirmwareUpdater multiAssetAppProtocol](v15, "multiAssetAppProtocol")]);
  return v15;
}

- (void)dealloc
{
  -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater dealloc]", objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%s: EAFirmwareUpdater dealloc\n", "-[EAFirmwareUpdater dealloc]"));
  [(EAFirmwareUpdater *)self stopReconnectTimer];
  appProtocol = self->_appProtocol;
  if (appProtocol) {

  }
  bootloaderProtocol = self->_bootloaderProtocol;
  if (bootloaderProtocol) {

  }
  multiAssetAppProtocol = self->_multiAssetAppProtocol;
  if (multiAssetAppProtocol) {

  }
  protocolString = self->_protocolString;
  if (protocolString) {

  }
  iAUPServer = self->_iAUPServer;
  if (iAUPServer) {

  }
  manifestIDs = self->_manifestIDs;
  if (manifestIDs) {

  }
  manifestList = self->_manifestList;
  if (manifestList) {

  }
  buildIdentities = self->_buildIdentities;
  if (buildIdentities) {

  }
  serialNumber = self->_serialNumber;
  if (serialNumber) {

  }
  pthread_mutex_destroy(&self->_flushOutputLock);
  v12.receiver = self;
  v12.super_class = (Class)EAFirmwareUpdater;
  [(EAFirmwareUpdater *)&v12 dealloc];
}

- (void)setFirmwareLocalURL:(id)a3
{
  -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater setFirmwareLocalURL:]", objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%s: EAFirmwareUpdater setFirmwareImage\n", "-[EAFirmwareUpdater setFirmwareLocalURL:]"));
  if (!self->_iAUPServer)
  {
    v5 = [[iAUPServer alloc] initInstanceWithByteEscape:self->_byteEscape];
    self->_iAUPServer = v5;
    [(iAUPServer *)v5 setDelegate:self];
  }
  v6 = [[FirmwareBundle alloc] initWithURL:a3 hashData:0 signatureData:0 certData:0];
  [self->_iAUPServer setFirmwareBundle:v6];

  unsigned int v7 = [(NSString *)self->_protocolString componentsSeparatedByString:@"."];
  if (v7) {
    id v8 = objc_msgSend(-[NSArray lastObject](v7, "lastObject"), "intValue");
  }
  else {
    id v8 = 0;
  }
  id v9 = [self->_iAUPServer firmwareBundle];
  [(FirmwareBundle *)v9 setProductIDCode:v8];
}

- (BOOL)findAccessory
{
  if (![(EAFirmwareUpdater *)self accessory]) {
    -[EAFirmwareUpdater setAccessory:](self, "setAccessory:", objc_msgSend((id)objc_opt_class(), "findAccessoryWithProtocolString:serialNum:", -[EAFirmwareUpdater protocolString](self, "protocolString"), self->_serialNumber));
  }
  return [(EAFirmwareUpdater *)self accessory] != 0;
}

- (void)startReconnectTimer:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_sync_enter(self);
  -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater startReconnectTimer:]", objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"_isExpectingReconnect=%d reconnectType=%d", self->_isExpectingReconnect, v3));
  if (self->_reconnectTimer) {
    [(EAFirmwareUpdater *)self stopReconnectTimer];
  }
  self->_isExpectingReconnect = v3;
  self->_reconnectTimer = +[NSTimer timerWithTimeInterval:self target:"reconnectTimerDidFire:" selector:0 userInfo:0 repeats:90.0];
  [+[NSRunLoop mainRunLoop] addTimer:self->_reconnectTimer forMode:NSDefaultRunLoopMode];
  objc_sync_exit(self);
}

- (void)setManifestIDs:(id)a3
{
  id v4 = (NSDictionary *)[a3 copy];
  self->_manifestIDs = v4;
  self->_manifestList = [(NSDictionary *)v4 allKeys];
  self->_manifestIndex = 0;
}

- (void)stopReconnectTimer
{
  objc_sync_enter(self);
  -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater stopReconnectTimer]", objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"_isExpectingReconnect=%d", self->_isExpectingReconnect));
  self->_isExpectingReconnect = 0;
  reconnectTimer = self->_reconnectTimer;
  if (reconnectTimer)
  {
    [(NSTimer *)reconnectTimer invalidate];

    self->_reconnectTimer = 0;
  }
  objc_sync_exit(self);
}

- (void)reconnectTimerDidFire:(id)a3
{
  id v4 = objc_alloc((Class)NSString);
  uint64_t isExpectingReconnect = self->_isExpectingReconnect;
  v6 = [(EAAccessory *)[(EAFirmwareUpdater *)self accessory] modelNumber];
  NSUInteger v7 = [(EAAccessory *)[(EAFirmwareUpdater *)self accessory] connectionID];
  id v8 = objc_msgSend((id)objc_opt_class(), "getEAFirmwareRevisionActive:forProtocol:", -[EAFirmwareUpdater accessory](self, "accessory"), self->_protocolString);
  -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater reconnectTimerDidFire:]", [v4 initWithFormat:@"Timed out waiting for accessory to reconnect _isExpectingReconnect=%d accessory=[%@:%lu:FWvA%@:FWvP%@]", isExpectingReconnect, v6, v7, v8, objc_msgSend((id)objc_opt_class(), "getEAFirmwareRevisionPending:forProtocol:", -[EAFirmwareUpdater accessory](self, "accessory"), self->_protocolString)]);
  objc_sync_enter(self);
  if ([(EAFirmwareUpdater *)self accessory])
  {
    -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s() self.accessory is valid. Ignoring fired timer ", "-[EAFirmwareUpdater reconnectTimerDidFire:]");
  }
  else
  {
    if (self->_isExpectingReconnect == 2) {
      int v9 = 3;
    }
    else {
      int v9 = 0;
    }
    self->_uint64_t isExpectingReconnect = v9;
    [(EAFirmwareUpdater *)self _accessoryDidDisconnect:0];
  }
  objc_sync_exit(self);
}

- (void)setFirmwareURL:(id)a3 withManifest:(id)a4 signature:(id)a5 certificate:(id)a6 hash:(id)a7
{
  -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater setFirmwareURL:withManifest:signature:certificate:hash:]", [objc_alloc((Class)NSString) initWithFormat:@"%s: EAFirmwareUpdater using local files for %@\n", "-[EAFirmwareUpdater setFirmwareURL:withManifest:signature:certificate:hash:]", self->_protocolString]);
  if (!self->_iAUPServer)
  {
    id v13 = [[iAUPServer alloc] initInstanceWithByteEscape:self->_byteEscape];
    self->_iAUPServer = v13;
    [(iAUPServer *)v13 setDelegate:self];
  }
  v14 = [[FirmwareBundle alloc] initWithURL:a3 hashData:a7 signatureData:a5 certData:a6];
  [self->_iAUPServer setFirmwareBundle:v14];
  [(FirmwareBundle *)[self->_iAUPServer firmwareBundle] setBuildManifest:a4];

  id v15 = [(NSString *)self->_protocolString componentsSeparatedByString:@"."];
  if (v15) {
    id v16 = objc_msgSend(-[NSArray lastObject](v15, "lastObject"), "intValue");
  }
  else {
    id v16 = 0;
  }
  id v17 = [self->_iAUPServer firmwareBundle];
  [(FirmwareBundle *)v17 setProductIDCode:v16];
}

- (void)setFirmwareBundle:(id)a3
{
  -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater setFirmwareBundle:]", [objc_alloc((Class)NSString) initWithFormat:@"%s: EAFirmwareUpdater using local firmware bundles for %@\n", "-[EAFirmwareUpdater setFirmwareBundle:]", self->_protocolString]);
  iAUPServer = self->_iAUPServer;
  if (!iAUPServer)
  {
    v6 = [[iAUPServer alloc] initInstanceWithByteEscape:self->_byteEscape];
    self->_iAUPServer = v6;
    [(iAUPServer *)v6 setDelegate:self];
    iAUPServer = self->_iAUPServer;
  }
  [iAUPServer setFirmwareBundle:a3];
}

- (void)setAccessory:(id)a3
{
  if (self->_accessory == a3) {
    return;
  }
  id v18 = [(id)objc_opt_class() getEAFirmwareRevisionPending:self->_accessory forProtocol:self->_protocolString];
  id v17 = [(id)objc_opt_class() getEAFirmwareRevisionActive:self->_accessory forProtocol:self->_protocolString];
  id v5 = objc_alloc((Class)NSString);
  v6 = [(EAAccessory *)self->_accessory modelNumber];
  NSUInteger v7 = [(EAAccessory *)self->_accessory connectionID];
  id v8 = [a3 modelNumber];
  id v9 = [a3 connectionID];
  id v10 = [(id)objc_opt_class() getEAFirmwareRevisionActive:a3 forProtocol:self->_protocolString];
  -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater setAccessory:]", [v5 initWithFormat:@"old=[%@:%lu:FWvA%@:FWvP%@] new=[%@:%lu:FWvA%@:FWvP%@] ", v6, v7, v17, v18, v8, v9, v10, objc_msgSend((id)objc_opt_class(), "getEAFirmwareRevisionPending:forProtocol:", a3, self->_protocolString)]);
  accessory = self->_accessory;
  if (accessory)
  {
    [(EAAccessory *)accessory setDelegate:0];
  }
  self->_accessory = (EAAccessory *)a3;
  if (!a3) {
    goto LABEL_15;
  }
  id v12 = a3;
  [(EAFirmwareUpdater *)self setProtocolString:[(EAFirmwareUpdater *)self supportedProtocolForAccessory:self->_accessory]];
  if (![(EAFirmwareUpdater *)self protocolString]) {
    [(EAFirmwareUpdater *)self log:5 format:@"No supported protocol string"];
  }
  if ([(EAFirmwareUpdater *)self isMultiAssetSession])
  {
LABEL_14:
    -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater setAccessory:]", [objc_alloc((Class)NSString) initWithFormat:@" - FW Version: %llu.%llu.%llu (%@)", self->_firmwareVersionMajor, self->_firmwareVersionMinor, self->_firmwareVersionRelease, -[EAFirmwareUpdater protocolString](self, "protocolString")]);
    [(EAFirmwareUpdater *)self setCurrentFirmwareVersionOnAcc:+[NSString stringWithFormat:@"%llu.%llu.%llu", self->_firmwareVersionMajor, self->_firmwareVersionMinor, self->_firmwareVersionRelease]];
LABEL_15:
    [(EAFirmwareUpdater *)self setSession:0];
    return;
  }
  id v13 = [(id)objc_opt_class() getEAFirmwareRevisionPending:self->_accessory forProtocol:self->_protocolString];
  id v14 = [(id)objc_opt_class() getEAFirmwareRevisionActive:self->_accessory forProtocol:self->_protocolString];
  if (v13) {
    id v14 = v13;
  }
  if (v14)
  {
    id v15 = [v14 componentsSeparatedByString:@"."];
    if (v15)
    {
      id v16 = v15;
      if ([v15 count] == (id)3)
      {
        self->_firmwareVersionMajor = (unint64_t)objc_msgSend(objc_msgSend(v16, "objectAtIndex:", 0), "longLongValue");
        self->_firmwareVersionMinor = (unint64_t)objc_msgSend(objc_msgSend(v16, "objectAtIndex:", 1), "longLongValue");
        self->_firmwareVersionRelease = (unint64_t)objc_msgSend(objc_msgSend(v16, "objectAtIndex:", 2), "longLongValue");
        -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater setAccessory:]", objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @" - FW Version: %llu.%llu.%llu", self->_firmwareVersionMajor, self->_firmwareVersionMinor, self->_firmwareVersionRelease));
        goto LABEL_14;
      }
    }
  }
}

- (void)setSession:(id)a3
{
  session = self->_session;
  if (session != a3)
  {
    if (session)
    {
      id v10 = a3;
      id v5 = [(EASession *)session inputStream];
      if (v5)
      {
        v6 = v5;
        [(NSInputStream *)v5 close];
        [(NSInputStream *)v6 removeFromRunLoop:+[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
      }
      NSUInteger v7 = [(EASession *)self->_session outputStream];
      if (v7)
      {
        id v8 = v7;
        [(NSOutputStream *)v7 close];
        [(NSOutputStream *)v8 removeFromRunLoop:+[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
      }

      a3 = v10;
    }
    self->_session = (EASession *)a3;
    if (a3)
    {
      id v9 = a3;
    }
  }
}

- (id)supportedProtocolForAccessory:(id)a3
{
  if (!a3) {
    return 0;
  }
  id result = [(EAFirmwareUpdater *)self bootloaderProtocol];
  if (result)
  {
    id result = [(EAFirmwareUpdater *)self appProtocol];
    if (result)
    {
      id result = [a3 protocolStrings];
      if (result)
      {
        id v6 = result;
        long long v13 = 0u;
        long long v14 = 0u;
        long long v11 = 0u;
        long long v12 = 0u;
        id result = [result countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (result)
        {
          id v7 = result;
          uint64_t v8 = *(void *)v12;
          while (2)
          {
            id v9 = 0;
            do
            {
              if (*(void *)v12 != v8) {
                objc_enumerationMutation(v6);
              }
              id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
              if ([(EAFirmwareUpdater *)self isMultiAssetSession])
              {
                if (objc_msgSend(v10, "rangeOfString:options:", -[EAFirmwareUpdater multiAssetAppProtocol](self, "multiAssetAppProtocol"), 1) != (id)0x7FFFFFFFFFFFFFFFLL)return -[EAFirmwareUpdater multiAssetAppProtocol](self, "multiAssetAppProtocol"); {
              }
                }
              else
              {
                if (objc_msgSend(v10, "rangeOfString:options:", -[EAFirmwareUpdater bootloaderProtocol](self, "bootloaderProtocol"), 1) != (id)0x7FFFFFFFFFFFFFFFLL)return -[EAFirmwareUpdater bootloaderProtocol](self, "bootloaderProtocol"); {
                if (objc_msgSend(v10, "rangeOfString:options:", -[EAFirmwareUpdater appProtocol](self, "appProtocol"), 1) != (id)0x7FFFFFFFFFFFFFFFLL)return -[EAFirmwareUpdater appProtocol](self, "appProtocol");
                }
              }
              id v9 = (char *)v9 + 1;
            }
            while (v7 != v9);
            id result = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
            id v7 = result;
            if (result) {
              continue;
            }
            break;
          }
        }
      }
    }
  }
  return result;
}

- (id)queryPredicate
{
  if ([(EAFirmwareUpdater *)self isMultiAssetSession]
    || ![(NSString *)[(EAFirmwareUpdater *)self protocolString] isEqualToString:[(EAFirmwareUpdater *)self appProtocol]])
  {
    return 0;
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000AA18;
  v4[3] = &unk_1000315F0;
  v4[4] = self;
  v4[5] = 2;
  return +[NSPredicate predicateWithBlock:v4];
}

- (id)assetWithMaxVersion:(id)a3
{
  if (!a3) {
    return 0;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [a3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  id v22 = 0;
  unsigned long long v23 = 0uLL;
  id v6 = 0;
  id obj = a3;
  id v7 = 0;
  uint64_t v8 = *(void *)v26;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v26 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      id v11 = objc_msgSend(v10, "attributes", v22);
      if (v11)
      {
        long long v12 = v11;
        id v13 = [v11 objectForKey:@"FirmwareVersionMajor"];
        if (v13)
        {
          id v14 = [v13 unsignedLongLongValue];
          id v15 = [v12 objectForKey:@"FirmwareVersionMinor"];
          if (v15)
          {
            id v16 = [v15 unsignedLongLongValue];
            id v17 = [v12 objectForKey:@"FirmwareVersionRelease"];
            if (v17)
            {
              id v18 = [v17 unsignedLongLongValue];
              id v19 = [v12 objectForKey:@"FormatVersion"];
              if (v19)
              {
                id v20 = [v19 unsignedLongLongValue];
                if (v20 >= v7
                  && (v14 > v6 || v14 == v6 && __PAIR128__((unint64_t)v16, (unint64_t)v18) > v23))
                {
                  id v22 = v10;
                  *(void *)&unsigned long long v23 = v18;
                  id v6 = v14;
                  *((void *)&v23 + 1) = v16;
                  id v7 = v20;
                }
              }
            }
          }
        }
      }
    }
    id v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v5);
  return v22;
}

- (id)validateAssetAttributes:(id)a3
{
  if (a3)
  {
    -[EAFirmwareUpdater setFirmwareBundleFilename:](self, "setFirmwareBundleFilename:", [a3 objectForKey:@"FirmwareBundle"]);
    if ([(EAFirmwareUpdater *)self firmwareBundleFilename])
    {
      id v16 = [a3 objectForKey:@"ForceSilentUpdate"];
      if (v16) {
        id v17 = [v16 BOOLValue];
      }
      else {
        id v17 = 0;
      }
      [(EAFirmwareUpdater *)self setForceSilentUpdate:v17];
      -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater validateAssetAttributes:]", objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"EA FUD Plugin: forceSilentUpdate=%d", -[EAFirmwareUpdater forceSilentUpdate](self, "forceSilentUpdate")));
      self->_firmwareVersionAvailable = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@.%@", [a3 objectForKeyedSubscript:@"FirmwareVersionMajor"], objc_msgSend(a3, "objectForKeyedSubscript:", @"FirmwareVersionMinor"), objc_msgSend(a3, "objectForKeyedSubscript:", @"FirmwareVersionRelease"));
      -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater validateAssetAttributes:]", [objc_alloc((Class)NSString) initWithFormat:@"Firmware version available = %@", self->_firmwareVersionAvailable]);
    }
    else
    {
      sub_10000AF34(0, 4, @"No firmware bundle filename in asset: %@", v11, v12, v13, v14, v15, @"FirmwareBundle");
    }
    return 0;
  }
  else
  {
    return sub_10000AF34(0, 3, @"No asset attributes", v3, v4, v5, v6, v7, v19);
  }
}

- (BOOL)isDeploymentAllowed:(id)a3
{
  id v3 = [a3 objectForKey:@"DeploymentList"];
  if (!v3) {
    return 1;
  }
  id v4 = v3;
  id v5 = [objc_alloc((Class)UARPAssetID) initWithLocationType:3 remoteURL:0];
  [v5 processUARPDeploymentRules:v4];
  LOBYTE(v4) = [v5 deploymentAllowed];

  return (char)v4;
}

- (id)validateAsset
{
  if (![(EAFirmwareUpdater *)self asset])
  {
    CFStringRef v30 = @"NoAsset";
    int v31 = 2;
LABEL_27:
    long long v27 = sub_10000AF34(0, v31, (uint64_t)v30, v3, v4, v5, v6, v7, (uint64_t)v34);
    uint64_t v14 = 0;
    goto LABEL_19;
  }
  uint64_t v8 = (FirmwareBundle *)objc_msgSend(-[EAFirmwareUpdater asset](self, "asset"), "getLocalFileUrl");
  uint64_t v14 = v8;
  if (!v8)
  {
    CFStringRef v32 = @"No local URL for asset";
    int v33 = 5;
LABEL_32:
    long long v27 = sub_10000AF34(0, v33, (uint64_t)v32, v9, v10, v11, v12, v13, (uint64_t)v34);
    goto LABEL_19;
  }
  id v15 = [objc_alloc((Class)NSString) initWithFormat:@"validating MobileAsset [localURL=%@] attributes=%@\n", v8, objc_msgSend(-[EAFirmwareUpdater asset](self, "asset"), "attributes")];
  v34 = (NSURL *)"-[EAFirmwareUpdater validateAsset]";
  [(EAFirmwareUpdater *)self log:5 format:@"%s %@"];
  -[EAFirmwareUpdater setFirmwareBundleURL:](self, "setFirmwareBundleURL:", objc_msgSend(-[FirmwareBundle URLByAppendingPathComponent:](v14, "URLByAppendingPathComponent:", -[EAFirmwareUpdater firmwareBundleFilename](self, "firmwareBundleFilename")), "filePathURL"));
  if (![(EAFirmwareUpdater *)self firmwareBundleURL])
  {
    CFStringRef v30 = @"Couldn't build firmware update URL";
    int v31 = 4;
    goto LABEL_27;
  }
  if (![+[NSFileManager defaultManager] isReadableFileAtPath:[(NSURL *)[(EAFirmwareUpdater *)self firmwareBundleURL] path]])
  {
    v34 = [(EAFirmwareUpdater *)self firmwareBundleURL];
    CFStringRef v30 = @"No firmware bundle: %@";
    int v31 = 6;
    goto LABEL_27;
  }
  if (![(EAFirmwareUpdater *)self updateRequiresSuperBinary])
  {
    uint64_t v14 = 0;
    long long v27 = 0;
    goto LABEL_19;
  }
  id v16 = [[FirmwareBundle alloc] initWithBundlePath:[(NSURL *)[(EAFirmwareUpdater *)self firmwareBundleURL] path]];
  uint64_t v14 = v16;
  if (!v16)
  {
    CFStringRef v32 = @"Couldn't read firmware bundle";
LABEL_31:
    int v33 = 4;
    goto LABEL_32;
  }
  if (![(FirmwareBundle *)v16 firmwareImage]
    && [(FirmwareBundle *)v14 firmwareLocalURL])
  {
    [(FirmwareBundle *)v14 loadFirmwareImage];
  }
  [(NSData *)[(FirmwareBundle *)v14 firmwareImage] bytes];
  [(NSData *)[(FirmwareBundle *)v14 firmwareImage] length];
  uint64_t v17 = parseSuperBinaryAndPayloadHeaders();
  if (!v17)
  {
    CFStringRef v32 = @"Couldn't parse SuperBinary header";
    goto LABEL_31;
  }
  id v18 = (unsigned __int16 *)v17;
  if (*(_WORD *)(v17 + 16))
  {
    unint64_t v19 = 0;
    id v20 = (char *)(v17 + 20);
    while (1)
    {
      id v21 = +[NSString stringWithFormat:@"%c%c%c%c", *v20, v20[1], v20[2], v20[3]];
      if (!v21) {
        break;
      }
      if ([(NSString *)v21 isEqualToString:@"sbmd"])
      {
        if (metadataTLVGetNext())
        {
          id v29 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Warning: Unsupported TLV type found in metadata: %d", 0);
          [(EAFirmwareUpdater *)self log:5 format:@"%s %@"];
        }
LABEL_16:
        long long v27 = 0;
        goto LABEL_18;
      }
      ++v19;
      v20 += 20;
      if (v19 >= v18[8]) {
        goto LABEL_16;
      }
    }
    long long v27 = sub_10000AF34(0, 4, @"Couldn't parse SuperBinary header tag", v22, v23, v24, v25, v26, v35);
  }
  else
  {
    long long v27 = 0;
  }
LABEL_18:
  free(v18);
LABEL_19:

  return v27;
}

- (BOOL)updateRequiresSuperBinary
{
  id v2 = [(NSDictionary *)self->_deviceOptions objectForKey:@"UpdateRequiresSuperBinary"];
  return [v2 BOOLValue];
}

- (BOOL)updateRequiresPersonalization
{
  id v2 = [(NSDictionary *)self->_deviceOptions objectForKey:@"NeedsPersonalization"];
  return [v2 BOOLValue];
}

- (id)getDeviceClassName
{
  return [(NSDictionary *)self->_deviceOptions objectForKey:@"DeviceClassName"];
}

- (unsigned)getWhitelistedPersonalizationFields
{
  if (![(NSDictionary *)self->_deviceOptions objectForKey:@"WhitelistedPersonalizationFields"]) {
    return -1;
  }
  id v3 = [(NSDictionary *)self->_deviceOptions objectForKey:@"WhitelistedPersonalizationFields"];
  return [v3 unsignedIntValue];
}

- (BOOL)isRestartRequired
{
  iAUPServer = self->_iAUPServer;
  if (iAUPServer) {
    LOBYTE(iAUPServer) = [iAUPServer restartRequired];
  }
  return (char)iAUPServer;
}

- (BOOL)isSleepWakeRequired
{
  iAUPServer = self->_iAUPServer;
  if (iAUPServer) {
    LOBYTE(iAUPServer) = [iAUPServer sleepWakeRequired];
  }
  return (char)iAUPServer;
}

- (BOOL)isUrgentUpdate
{
  if (self->_firmwareUpdateIsUrgent) {
    return 1;
  }
  else {
    return [self->_iAUPServer urgentUpdate];
  }
}

- (void)processPersonalizationInfoFromAccessory:(id)a3
{
  id v54 = +[NSMutableArray array];
  unint64_t v62 = 0;
  if (!a3)
  {
    CFStringRef v45 = @"Invalid Info from Accessory";
LABEL_88:
    v46 = sub_10000AF34(0, 21, (uint64_t)v45, v5, v6, v7, v8, v9, (uint64_t)v51);
    uint64_t v11 = 0;
    id v19 = 0;
    char v44 = 1;
    goto LABEL_109;
  }
  if (!self->_personalizationRequestHandler)
  {
    CFStringRef v45 = @"Invalid _personalizationRequestHandler";
    goto LABEL_88;
  }
  v51 = @"PersonalizationRequest";
  [(EAFirmwareUpdater *)self protocolString];
  id v10 = [objc_alloc((Class)FudPersonalizationRequest) initWithName:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_%@"];
  if (!v10)
  {
    CFStringRef v45 = @"Failed to init FudPersonalizationRequest";
    goto LABEL_88;
  }
  uint64_t v11 = v10;
  if ([(NSDictionary *)self->_deviceOptions objectForKey:@"PersonalizationResponseFormat"])
  {
    objc_msgSend(v11, "setResponseFormat:", objc_msgSend(-[NSDictionary objectForKey:](self->_deviceOptions, "objectForKey:", @"PersonalizationResponseFormat"), "unsignedIntValue"));
    if ([v11 responseFormat] >= 3)
    {
      CFStringRef v47 = @"Invalid Response format specified";
    }
    else
    {
      if ([v11 responseFormat] == 1
        && [(NSDictionary *)self->_deviceOptions objectForKey:@"PersonalizationResponseAlign"])
      {
        objc_msgSend(v11, "setResponseAlignment:", (unsigned __int16)objc_msgSend(-[NSDictionary objectForKey:](self->_deviceOptions, "objectForKey:", @"PersonalizationResponseAlign"), "unsignedIntValue"));
      }
      if (self->_manifestIDs)
      {
        unint64_t manifestIndex = self->_manifestIndex;
        if ([(NSArray *)self->_manifestList count] > manifestIndex)
        {
          manifestList = self->_manifestList;
          ++self->_manifestIndex;
          objc_msgSend(v11, "setRequestPrefix:", -[NSArray objectAtIndexedSubscript:](manifestList, "objectAtIndexedSubscript:"));
        }
      }
      if ([a3 objectForKey:@"BoardID"])
      {
        objc_msgSend(v11, "setBoardID:", objc_msgSend(objc_msgSend(a3, "objectForKey:", @"BoardID"), "unsignedIntValue"));
        if ([a3 objectForKey:@"ChipID"])
        {
          objc_msgSend(v11, "setChipID:", objc_msgSend(objc_msgSend(a3, "objectForKey:", @"ChipID"), "unsignedIntValue"));
          if ([a3 objectForKey:@"ECID"])
          {
            if ([v11 requestPrefix]
              && objc_msgSend(objc_msgSend(v11, "requestPrefix"), "isEqualToString:", @"Baobab"))
            {
              uint64_t v61 = 0;
              unint64_t v62 = bswap64((unint64_t)objc_msgSend(objc_msgSend(a3, "objectForKey:", @"ECID"), "unsignedLongValue"));
              id v19 = [objc_alloc((Class)NSMutableData) initWithBytes:&v61 length:8];
              [v19 appendBytes:&v62 length:8];
              [v11 setExtEcID:v19];
            }
            else
            {
              objc_msgSend(v11, "setEcID:", objc_msgSend(objc_msgSend(a3, "objectForKey:", @"ECID"), "unsignedLongValue"));
              id v19 = 0;
            }
            [v11 setGlobalSigning:0];
          }
          else
          {
            [v11 setGlobalSigning:1];
            id v19 = 0;
          }
          if ([a3 objectForKey:@"securityDomain"])
          {
            objc_msgSend(v11, "setSecurityDomain:", objc_msgSend(objc_msgSend(a3, "objectForKey:", @"securityDomain"), "unsignedIntValue"));
            if ([a3 objectForKey:@"productionMode"])
            {
              objc_msgSend(v11, "setProductionMode:", objc_msgSend(objc_msgSend(a3, "objectForKey:", @"productionMode"), "BOOLValue"));
              if ([a3 objectForKey:@"securityMode"])
              {
                uint64_t v25 = (NSNull *)[a3 objectForKey:@"securityMode"];
                if (v25 != +[NSNull null]) {
                  objc_msgSend(v11, "setSecurityMode:", objc_msgSend(objc_msgSend(a3, "objectForKey:", @"securityMode"), "BOOLValue"));
                }
                if ([a3 objectForKey:@"nonceHash"])
                {
                  if ([v11 requestPrefix]
                    && objc_msgSend(objc_msgSend(v11, "requestPrefix"), "isEqualToString:", @"Baobab"))
                  {
                    id v26 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", objc_msgSend(objc_msgSend(a3, "objectForKey:", @"nonceHash"), "bytes"), 16);
                    [v11 setNonceHash:v26];

                    id v27 = [objc_alloc((Class)NSString) initWithFormat:@"Truncating nonceHash=%@\n", objc_msgSend(v11, "nonceHash")];
                    v51 = "-[EAFirmwareUpdater processPersonalizationInfoFromAccessory:]";
                    [(EAFirmwareUpdater *)self log:5 format:@"%s %@"];
                  }
                  else
                  {
                    objc_msgSend(v11, "setNonceHash:", objc_msgSend(a3, "objectForKey:", @"nonceHash"));
                  }
                  long long v28 = (NSNull *)[a3 objectForKey:@"chipEpoch"];
                  if (v28 != +[NSNull null]
                    && (![v11 requestPrefix]
                     || (objc_msgSend(objc_msgSend(v11, "requestPrefix"), "isEqualToString:", @"DMC") & 1) == 0))
                  {
                    objc_msgSend(v11, "setChipEpoch:", objc_msgSend(objc_msgSend(a3, "objectForKey:", @"chipEpoch"), "unsignedIntValue"));
                  }
                  if ([a3 objectForKey:@"enableMixMatch"])
                  {
                    objc_msgSend(v11, "setEnableMixMatch:", objc_msgSend(objc_msgSend(a3, "objectForKey:", @"enableMixMatch"), "BOOLValue"));
                    if ([(EAFirmwareUpdater *)self firmwareBundleURL]
                      || [self->_iAUPServer firmwareBundle])
                    {
                      if (![v11 responseFormat])
                      {
                        buildIdentities = self->_buildIdentities;
                        if (buildIdentities)
                        {
                          id v29 = 0;
LABEL_50:
                          memset(v60, 0, sizeof(v60));
                          v53 = self;
                          v52 = v29;
                          if (-[NSArray countByEnumeratingWithState:objects:count:](buildIdentities, "countByEnumeratingWithState:objects:count:", v60, v66, 16)&& (v34 = [**((id **)&v60[0] + 1) objectForKey:@"Manifest"], v56 = 0u, v57 = 0u, v58 = 0u, v59 = 0u, (id v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v56, v65, 16)) != 0))
                          {
                            id v36 = v35;
                            id v37 = 0;
                            uint64_t v38 = *(void *)v57;
                            while (2)
                            {
                              for (i = 0; i != v36; i = (char *)i + 1)
                              {
                                if (*(void *)v57 != v38) {
                                  objc_enumerationMutation(v34);
                                }
                                v40 = *(void **)(*((void *)&v56 + 1) + 8 * i);
                                if (v37) {

                                }
                                id v41 = [v34 objectForKey:v40];
                                if (!v41)
                                {
                                  id v37 = 0;
LABEL_84:
                                  self = v53;
                                  goto LABEL_76;
                                }
                                v42 = v41;
                                if ([v11 requestPrefix]
                                  && !objc_msgSend(v40, "hasPrefix:", objc_msgSend(v11, "requestPrefix")))
                                {
                                  id v37 = 0;
                                }
                                else
                                {
                                  id v37 = [objc_alloc((Class)FudPersonalizationObjectInfo) initWithTag:v40];
                                  if (!v37) {
                                    goto LABEL_84;
                                  }
                                  objc_msgSend(v37, "setDigest:", objc_msgSend(v42, "objectForKey:", @"Digest"));
                                  if ([v42 objectForKey:@"Trusted"]) {
                                    objc_msgSend(v37, "setTrusted:", objc_msgSend(objc_msgSend(v42, "objectForKey:", @"Trusted"), "BOOLValue"));
                                  }
                                  objc_msgSend(v37, "setEffectiveProductionMode:", objc_msgSend(v11, "productionMode"));
                                  if ([v11 isSecurityModeSet]) {
                                    objc_msgSend(v37, "setEffectiveSecurityMode:", objc_msgSend(v11, "securityMode"));
                                  }
                                  [v54 addObject:v37];
                                }
                              }
                              id v36 = [v34 countByEnumeratingWithState:&v56 objects:v65 count:16];
                              if (v36) {
                                continue;
                              }
                              break;
                            }
                          }
                          else
                          {
                            id v37 = 0;
                          }
                          objc_msgSend(v11, "setObjectList:", objc_msgSend(v54, "copy"));
                          if ([v11 responseFormat]) {
                            v43 = [(FirmwareBundle *)v52 firmwareImage];
                          }
                          else {
                            v43 = 0;
                          }
                          self = v53;
                          [v11 setPayload:v43];
LABEL_76:
                          (*((void (**)(void))self->_personalizationRequestHandler + 2))();
                          char v44 = 0;
                          if (!v19) {
                            goto LABEL_78;
                          }
                          goto LABEL_77;
                        }
                      }
                      id v29 = [self->_iAUPServer firmwareBundle];
                      if (v29
                        || (v30 = [[FirmwareBundle alloc] initWithBundlePath:[(NSURL *)[(EAFirmwareUpdater *)self firmwareBundleURL] path]], [self->_iAUPServer setFirmwareBundle:v30], v30, (id v29 = [self->_iAUPServer firmwareBundle]) != 0))
                      {
                        if ([(FirmwareBundle *)v29 buildManifest])
                        {
                          if (![(FirmwareBundle *)v29 firmwareImage]
                            && [(FirmwareBundle *)v29 firmwareLocalURL])
                          {
                            [(FirmwareBundle *)v29 loadFirmwareImage];
                          }
                          if ([(FirmwareBundle *)v29 firmwareImage])
                          {
                            int v31 = [(NSDictionary *)[(FirmwareBundle *)v29 buildManifest] objectForKey:@"BuildIdentities"];
                            self->_buildIdentities = v31;
                            if (v31)
                            {
                              CFStringRef v32 = v31;
                              buildIdentities = self->_buildIdentities;
                              goto LABEL_50;
                            }
                            CFStringRef v48 = @"Unable to find BuildIdentities in firmwareBundle.buildManifest";
                          }
                          else
                          {
                            CFStringRef v48 = @"Unable to find firmwareImage from MobileAsset";
                          }
                        }
                        else
                        {
                          CFStringRef v48 = @"Unable to find BuildManifest.plist";
                        }
                      }
                      else
                      {
                        CFStringRef v48 = @"Unable to allocate FirmwareBundle object";
                      }
                    }
                    else
                    {
                      CFStringRef v48 = @"No firmware bundle URL";
                    }
                    int v49 = 6;
                    goto LABEL_106;
                  }
                  CFStringRef v48 = @"Missing kManifestPropertyKeyEnableMixMatch from Accessory";
                }
                else
                {
                  CFStringRef v48 = @"Missing kManifestPropertyKeyNonceHash from Accessory";
                }
              }
              else
              {
                CFStringRef v48 = @"Missing kManifestPropertyKeySecurityMode from Accessory";
              }
            }
            else
            {
              CFStringRef v48 = @"Missing kManifestPropertyKeyProductionMode from Accessory";
            }
          }
          else
          {
            CFStringRef v48 = @"Missing kManifestPropertyKeySecurityDomain from Accessory";
          }
          int v49 = 21;
LABEL_106:
          v46 = sub_10000AF34(0, v49, (uint64_t)v48, v20, v21, v22, v23, v24, (uint64_t)v51);
          goto LABEL_107;
        }
        CFStringRef v47 = @"PersonalizationInfo: Missing kManifestPropertyKeyChipID from Accessory";
      }
      else
      {
        CFStringRef v47 = @"PersonalizationInfo: Missing kManifestPropertyKeyBoardID from Accessory";
      }
    }
  }
  else
  {
    CFStringRef v47 = @"No Response format specified";
  }
  v46 = sub_10000AF34(0, 21, (uint64_t)v47, v12, v13, v14, v15, v16, @"PersonalizationRequest");
  id v19 = 0;
LABEL_107:
  if (!v46)
  {
    id v37 = 0;
    goto LABEL_76;
  }
  char v44 = 0;
LABEL_109:
  eaNotificationDispatchQueue = self->_eaNotificationDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C15C;
  block[3] = &unk_100031618;
  block[4] = self;
  dispatch_async((dispatch_queue_t)eaNotificationDispatchQueue, block);
  CFStringRef v63 = @"Event";
  CFStringRef v64 = @"com.apple.fud.updateFailed";
  [(EAFirmwareUpdater *)self updateComplete:+[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1] error:v46];
  id v37 = 0;
  if (v19) {
LABEL_77:
  }

LABEL_78:
  if (v37) {

  }
  if ((v44 & 1) == 0) {
}
  }

- (BOOL)stitchManifestInSuperBinary:(id)a3 withManifest:(id)a4 withId:(unsigned int)a5
{
  CFStringRef v7 = @"Error null data to stitchManifestInSuperBinary";
  if (!a3 || !a4) {
    goto LABEL_18;
  }
  [a3 bytes];
  [a3 length];
  uint64_t v10 = parseSuperBinaryAndPayloadHeaders();
  if (!v10)
  {
    CFStringRef v7 = @"Error could not parse SuperBinary headers";
LABEL_18:
    -[EAFirmwareUpdater log:format:](self, "log:format:", 5, v7, *(void *)&a5);
    BOOL v15 = 0;
    id v14 = 0;
    goto LABEL_11;
  }
  uint64_t v11 = (unsigned __int16 *)v10;
  if (*(_WORD *)(v10 + 16))
  {
    id v18 = self;
    unsigned __int8 v12 = 0;
    while (1)
    {
      int v13 = v12;
      id v14 = [objc_alloc((Class)NSString) initWithBytes:&v11[10 * v12 + 10] length:4 encoding:4];
      if ([v14 isEqualToString:@"IM4M"])
      {
        if ((*(_DWORD *)&v11[10 * v13 + 12] & a5) != 0) {
          break;
        }
      }

      unsigned __int8 v12 = v13 + 1;
      if (v11[8] <= (v13 + 1)) {
        goto LABEL_9;
      }
    }
    if ((unint64_t)[a4 length] > *(unsigned int *)&v11[10 * v13 + 18])
    {
      CFStringRef v17 = @"Error manifest too large for SuperBinary payload";
    }
    else
    {
      [a3 mutableBytes];
      [a3 length];
      [a4 bytes];
      [a4 length];
      if (updateSuperBinaryPayload())
      {
        BOOL v15 = 1;
        goto LABEL_10;
      }
      CFStringRef v17 = @"Error could not update Manifest size in SuperBinary header";
    }
    [(EAFirmwareUpdater *)v18 log:5 format:v17];
    BOOL v15 = 0;
    goto LABEL_10;
  }
LABEL_9:
  BOOL v15 = 0;
  id v14 = 0;
LABEL_10:
  free(v11);
LABEL_11:

  return v15;
}

- (void)personalizationResponse:(id)a3 error:(id)a4
{
  if (!a3 || a4)
  {
    eaNotificationDispatchQueue = self->_eaNotificationDispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000C594;
    block[3] = &unk_100031640;
    block[4] = self;
    void block[5] = a4;
    block[6] = a3;
    dispatch_async((dispatch_queue_t)eaNotificationDispatchQueue, block);
    goto LABEL_7;
  }
  unsigned int v6 = objc_msgSend(-[NSDictionary objectForKey:](self->_deviceOptions, "objectForKey:", @"PersonalizationResponseFormat"), "unsignedIntValue");
  if ([self->_iAUPServer firmwareBundle])
  {
    uint64_t v7 = [(FirmwareBundle *)[self->_iAUPServer firmwareBundle] productIDCode];
    if (v6) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (v6) {
      goto LABEL_13;
    }
  }
  if (self->_buildIdentities)
  {
    unsigned int v10 = objc_msgSend(-[NSDictionary objectForKey:](self->_manifestIDs, "objectForKey:", -[NSArray objectAtIndexedSubscript:](self->_manifestList, "objectAtIndexedSubscript:", self->_manifestIndex - 1)), "intValue");
    if ([self->_iAUPServer firmwareBundle])
    {
      uint64_t v11 = v10 << 24;
      id v9 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithData:", -[FirmwareBundle firmwareImage](-[iAUPServer firmwareBundle](self->_iAUPServer, "firmwareBundle"), "firmwareImage"));
      if (![(EAFirmwareUpdater *)self stitchManifestInSuperBinary:v9 withManifest:a3 withId:v11])
      {
        CFStringRef v13 = @"Failed to stitched signed manifest into SuperBinary";
        goto LABEL_18;
      }
      unsigned __int8 v12 = [[FirmwareBundle alloc] initWithData:v9 hashData:0 signatureData:0 certData:0];
      goto LABEL_14;
    }
    [(EAFirmwareUpdater *)self handleSessionError:15 message:@"No FW bundle to stitch manifest"];
LABEL_7:
    id v9 = 0;
    goto LABEL_19;
  }
LABEL_13:
  unsigned __int8 v12 = [[FirmwareBundle alloc] initWithData:a3 hashData:0 signatureData:0 certData:0];
  id v9 = 0;
LABEL_14:
  [self->_iAUPServer setFirmwareBundle:v12];

  if (v7) {
    [(FirmwareBundle *)[self->_iAUPServer firmwareBundle] setProductIDCode:v7];
  }
  if (![self->_iAUPServer personalizationComplete])
  {
    CFStringRef v13 = @"Error during personalization response";
LABEL_18:
    [(EAFirmwareUpdater *)self handleSessionError:15 message:v13];
  }
LABEL_19:
}

- (void)handleSessionError:(unsigned int)a3 message:(id)a4
{
  id v9 = sub_10000AF34(0, a3, (uint64_t)a4, (uint64_t)a4, v4, v5, v6, v7, v11[0]);
  eaNotificationDispatchQueue = self->_eaNotificationDispatchQueue;
  v11[0] = (uint64_t)_NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = (uint64_t)sub_10000C790;
  v11[3] = (uint64_t)&unk_100031618;
  v11[4] = (uint64_t)self;
  dispatch_async((dispatch_queue_t)eaNotificationDispatchQueue, v11);
  CFStringRef v12 = @"Event";
  CFStringRef v13 = @"com.apple.fud.updateFailed";
  [(EAFirmwareUpdater *)self updateComplete:+[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1] error:v9];
}

- (id)applyFirmware:(id)a3 progress:(id)a4 update:(id)a5 personalization:(id)a6
{
  [(EAFirmwareUpdater *)self log:5 format:@"%s"];
  self->_applyCompletion = _Block_copy(a3);
  self->_progressHandler = _Block_copy(a4);
  self->_updateHandler = _Block_copy(a5);
  uint64_t v11 = _Block_copy(a6);
  self->_personalizationRequestHandler = v11;
  if (!self->_applyCompletion
    || !self->_progressHandler
    || (self->_updateHandler ? (BOOL v12 = v11 == 0) : (BOOL v12 = 1), v12))
  {
    -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater applyFirmware:progress:update:personalization:]", [objc_alloc((Class)NSString) initWithFormat:@"Invalid handlers passed"]);
    return 0;
  }
  iAUPServer = self->_iAUPServer;
  if (!iAUPServer)
  {
    id v14 = [[iAUPServer alloc] initInstanceWithByteEscape:self->_byteEscape];
    self->_iAUPServer = v14;
    if (!v14)
    {
      CFStringRef v33 = @"Can't create iAUPServer";
      int v34 = 17;
      goto LABEL_36;
    }
    [(iAUPServer *)v14 setDelegate:self];
    iAUPServer = self->_iAUPServer;
  }
  [iAUPServer setAckAppReentry:self->_closeEASession];
  if ([(EAFirmwareUpdater *)self isMultiAssetSession]
    || [self->_iAUPServer firmwareBundle])
  {
    goto LABEL_26;
  }
  if (![(EAFirmwareUpdater *)self firmwareBundleURL])
  {
    CFStringRef v33 = @"No firmware bundle URL";
LABEL_35:
    int v34 = 6;
    goto LABEL_36;
  }
  uint64_t v20 = [[FirmwareBundle alloc] initWithBundlePath:[(NSURL *)[(EAFirmwareUpdater *)self firmwareBundleURL] path]];
  if (!v20)
  {
    CFStringRef v33 = @"Unable to allocated FirmwareBundle object";
    goto LABEL_35;
  }
  uint64_t v21 = v20;
  id v22 = objc_alloc((Class)NSString);
  uint64_t v23 = "nil";
  if ([(FirmwareBundle *)v21 firmwareImage]) {
    uint64_t v24 = "valid";
  }
  else {
    uint64_t v24 = "nil";
  }
  id v25 = (id)[(FirmwareBundle *)v21 firmwareImageSize];
  if ([(FirmwareBundle *)v21 hash]) {
    id v26 = "valid";
  }
  else {
    id v26 = "nil";
  }
  if ([(FirmwareBundle *)v21 signature]) {
    id v27 = "valid";
  }
  else {
    id v27 = "nil";
  }
  if ([(FirmwareBundle *)v21 certificate]) {
    uint64_t v23 = "valid";
  }
  id v28 = objc_msgSend(v22, "initWithFormat:", @"FirmwareBundle created [image=%s imageSize=%d hash=%s signature=%s cert=%s productID=%d baseAddress=%d]\n", v24, v25, v26, v27, v23, -[FirmwareBundle productIDCode](v21, "productIDCode"), -[FirmwareBundle firmwareImageBaseAddress](v21, "firmwareImageBaseAddress"));
  [(EAFirmwareUpdater *)self log:5 format:@"%s %@"];
  [self->_iAUPServer setFirmwareBundle:v21];

LABEL_26:
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:"_accessoryDidConnect:" name:EAAccessoryDidConnectNotification object:0];
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:"_accessoryDidDisconnect:" name:EAAccessoryDidDisconnectNotification object:0];
  id v29 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MobileAccessoryUpdater.EAFirmwareUpdater", 0);
  self->_eaNotificationDispatchQueue = v29;
  if (v29)
  {
    [self->_iAUPServer setDispatchQ:v29];
    eaNotificationDispatchQueue = self->_eaNotificationDispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000CBBC;
    block[3] = &unk_100031618;
    block[4] = self;
    dispatch_async((dispatch_queue_t)eaNotificationDispatchQueue, block);
    return 0;
  }
  CFStringRef v33 = @"Unable to allocate dispatch queue for EA notifications";
  int v34 = 19;
LABEL_36:
  int v31 = sub_10000AF34(0, v34, (uint64_t)v33, v15, v16, v17, v18, v19, (uint64_t)"-[EAFirmwareUpdater applyFirmware:progress:update:personalization:]");
  if (v31)
  {
    CFStringRef v36 = @"Event";
    CFStringRef v37 = @"com.apple.fud.updateFailed";
    [(EAFirmwareUpdater *)self updateComplete:+[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1] error:v31];
  }
  return v31;
}

- (id)openSession
{
  if ([(EAFirmwareUpdater *)self accessory])
  {
    if ([(EAFirmwareUpdater *)self protocolString])
    {
      NSLog(@"accessory = %@\n", [(EAFirmwareUpdater *)self accessory]);
      NSLog(@"protocolString = %@\n", [(EAFirmwareUpdater *)self protocolString]);
      id v8 = objc_msgSend(objc_alloc((Class)EASession), "initWithAccessory:forProtocol:", -[EAFirmwareUpdater accessory](self, "accessory"), -[EAFirmwareUpdater protocolString](self, "protocolString"));
      if (v8)
      {
        id v9 = v8;
        [(EAFirmwareUpdater *)self setSession:v8];

        unsigned int v10 = [(EASession *)self->_session inputStream];
        if (v10)
        {
          uint64_t v11 = v10;
          [(NSInputStream *)v10 setDelegate:self];
          [(NSInputStream *)v11 scheduleInRunLoop:+[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
          [(NSInputStream *)v11 open];
          BOOL v12 = [(EASession *)self->_session outputStream];
          if (v12)
          {
            CFStringRef v13 = v12;
            [(NSOutputStream *)v12 setDelegate:self];
            [(NSOutputStream *)v13 scheduleInRunLoop:+[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
            [(NSOutputStream *)v13 open];
            return 0;
          }
          CFStringRef v15 = @"EASession has no output stream";
        }
        else
        {
          CFStringRef v15 = @"EASession has no input stream";
        }
        int v16 = 15;
      }
      else
      {
        CFStringRef v15 = @"Unable to allocate new session";
        int v16 = 14;
      }
    }
    else
    {
      CFStringRef v15 = @"No protocol string";
      int v16 = 13;
    }
  }
  else
  {
    CFStringRef v15 = @"No accessory";
    int v16 = 12;
  }
  return sub_10000AF34(0, v16, (uint64_t)v15, v3, v4, v5, v6, v7, v18);
}

- (void)closeSession
{
  if (self->_session)
  {
    -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater closeSession]", [objc_alloc((Class)NSString) initWithFormat:@"Closing EA Session=%@", self->_session]);
    uint64_t v3 = [(EASession *)self->_session inputStream];
    if (v3)
    {
      uint64_t v4 = v3;
      [(NSInputStream *)v3 close];
      [(NSInputStream *)v4 removeFromRunLoop:+[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    uint64_t v5 = [(EASession *)self->_session outputStream];
    if (v5)
    {
      uint64_t v6 = v5;
      [(NSOutputStream *)v5 close];
      [(NSOutputStream *)v6 removeFromRunLoop:+[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }

    self->_session = 0;
  }
}

- (id)writeData:(id)a3
{
  if (a3)
  {
    -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater writeData:]", objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"- writing %u bytes", objc_msgSend(a3, "length")));
    if (![(EAFirmwareUpdater *)self isMultiAssetSession] && !self->_closeEASession)
    {
      unsigned int v10 = [a3 bytes];
      uint64_t v11 = 3;
      if (!self->_byteEscape) {
        uint64_t v11 = 4;
      }
      if (v10[v11] == 65 && !self->_skipReconnect) {
        [(EAFirmwareUpdater *)self startReconnectTimer:2];
      }
    }
    outputData = self->_outputData;
    if (outputData)
    {
      [(NSMutableData *)outputData appendData:a3];
LABEL_12:
      return [(EAFirmwareUpdater *)self flushOutput];
    }
    CFStringRef v13 = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithData:a3];
    self->_outputData = v13;
    if (v13) {
      goto LABEL_12;
    }
    CFStringRef v14 = @"Couldn't allocate NSMutableData object to store bytes to be written";
    int v15 = 16;
  }
  else
  {
    CFStringRef v14 = @"No data to write";
    int v15 = 18;
  }
  return sub_10000AF34(0, v15, (uint64_t)v14, v3, v4, v5, v6, v7, v18);
}

- (void)logStatusString:(id)a3
{
}

- (void)updateProgress:(double)a3
{
  progressHandler = (void (**)(double))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](a3);
  }
}

- (id)createEndOfUpdateEventDict:(id)a3 error:(id)a4
{
  -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater createEndOfUpdateEventDict:error:]", [objc_alloc((Class)NSString) initWithFormat:&stru_100035320]);
  id v7 = [a3 objectForKey:@"Event"];
  if (!v7)
  {
    [(EAFirmwareUpdater *)self log:5 format:@"Event = NULL"];
    uint64_t v23 = 0;
    goto LABEL_23;
  }
  id v8 = v7;
  if (self->_updateStartTime)
  {
    [+[NSDate date] timeIntervalSinceDate:self->_updateStartTime];
    double v10 = v9;
    self->_currentSessionTimeTaken = +[NSNumber numberWithUnsignedInt:v9];
  }
  else
  {
    double v10 = 0.0;
  }
  id v11 = objc_msgSend(-[iAUPServer getNumberOfBytesDownloadedInCurrentSession](self->_iAUPServer, "getNumberOfBytesDownloadedInCurrentSession"), "unsignedIntValue");
  id v12 = v11;
  if (v10 == 0.0) {
    id v26 = (NSNumber *)&off_100038CB0;
  }
  else {
    id v26 = +[NSNumber numberWithUnsignedInt:((double)(8 * v11) / v10)];
  }
  uint64_t v13 = [(NSNumber *)self->_cumulativeBytesDownloaded unsignedIntValue] + v12;
  [(EAFirmwareUpdater *)self log:5, @"_cumulativeBytesDownloaded = %d (= %d earlier + %d current session)", v13, [(NSNumber *)self->_cumulativeBytesDownloaded unsignedIntValue], v12 format];
  self->_cumulativeBytesDownloaded = +[NSNumber numberWithUnsignedInt:v13];
  if ([(NSNumber *)self->_totalBytesForCompleteUpdate unsignedIntValue])
  {
    [(NSNumber *)self->_totalBytesForCompleteUpdate floatValue];
    uint64_t v15 = (float)((float)((float)v13 / v14) * 100.0);
    self->_cumulativeProgressPercent = +[NSNumber numberWithUnsignedInt:v15];
  }
  else
  {
    uint64_t v15 = 0;
  }
  [(EAFirmwareUpdater *)self log:5, @"_totalBytesForCompleteUpdate = %d, So _cumulativeProgressPercent = %d [ = (%d / %d) * 100 ]", [(NSNumber *)self->_totalBytesForCompleteUpdate unsignedIntValue], v15, v13, [(NSNumber *)self->_totalBytesForCompleteUpdate unsignedIntValue] format];
  self->_cumulativeTimeTaken = +[NSNumber numberWithUnsignedInt:[(NSNumber *)self->_currentSessionTimeTaken unsignedIntValue]+ [(NSNumber *)self->_cumulativeTimeTaken unsignedIntValue]];
  self->_cumulativeCloakTime = +[NSNumber numberWithUnsignedInt:[(NSNumber *)self->_currentSessionCloakTime unsignedIntValue]+ [(NSNumber *)self->_cumulativeCloakTime unsignedIntValue]];
  int v16 = +[NSNumber numberWithUnsignedInt:[(NSNumber *)self->_resumeCount unsignedIntValue] + 1];
  if (a4)
  {
    uint64_t v17 = v26;
    if ([a4 userInfo]
      && objc_msgSend(objc_msgSend(a4, "userInfo"), "objectForKey:", NSLocalizedDescriptionKey))
    {
      CFStringRef v18 = (const __CFString *)objc_msgSend(objc_msgSend(a4, "userInfo"), "objectForKey:", NSLocalizedDescriptionKey);
    }
    else
    {
      CFStringRef v18 = @"Unknown";
    }
  }
  else
  {
    CFStringRef v18 = @"Unknown";
    uint64_t v17 = v26;
  }
  cumulativeProgressPercent = self->_cumulativeProgressPercent;
  v27[0] = @"cumulativeProgressPercent";
  v27[1] = @"currentSessionTimeTaken";
  currentSessionTimeTaken = self->_currentSessionTimeTaken;
  v28[0] = cumulativeProgressPercent;
  v28[1] = currentSessionTimeTaken;
  cumulativeTimeTaken = self->_cumulativeTimeTaken;
  v27[2] = @"cumulativeTimeTaken";
  v27[3] = @"cumulativeCloakingTime";
  cumulativeCloakTime = self->_cumulativeCloakTime;
  v28[2] = cumulativeTimeTaken;
  v28[3] = cumulativeCloakTime;
  v27[4] = @"averageBitRate";
  v27[5] = @"totalSessionCount";
  v28[4] = v17;
  v28[5] = v16;
  v27[6] = @"error";
  v28[6] = v18;
  uint64_t v23 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:7]);
  if (([v8 isEqualToString:@"com.apple.fud.updateCompleted"] & 1) == 0)
  {
    if ([v8 isEqualToString:@"com.apple.fud.updateInterrupted"])
    {
      CFStringRef v24 = @"interruptedState";
LABEL_22:
      [(NSMutableDictionary *)v23 setObject:@"FailureStateApply" forKey:v24];
      goto LABEL_23;
    }
    if ([v8 isEqualToString:@"com.apple.fud.updateFailed"])
    {
      CFStringRef v24 = @"failureState";
      goto LABEL_22;
    }
  }
LABEL_23:
  [(EAFirmwareUpdater *)self log:5, @"Event dict = %@", v23 format];
  return v23;
}

- (void)handleFirmwareUpdateStatus:(id)a3
{
  if (a3)
  {
    id v5 = [a3 objectForKey:@"Event"];
    if (([v5 isEqualToString:@"com.apple.fud.updateStarted"] & 1) != 0
      || [v5 isEqualToString:@"com.apple.fud.updateResumed"])
    {
      self->_updateStartTime = +[NSDate date];
      self->_cumulativeBytesDownloaded = (NSNumber *)[a3 objectForKeyedSubscript:@"totalBytesDownloadedSoFar"];
      self->_totalBytesForCompleteUpdate = (NSNumber *)[a3 objectForKeyedSubscript:@"totalBytesForCompleteUpdate"];
      [(NSNumber *)self->_cumulativeBytesDownloaded floatValue];
      float v7 = v6;
      [(NSNumber *)self->_totalBytesForCompleteUpdate floatValue];
      self->_resumedFromPercentNum = +[NSNumber numberWithUnsignedInt:(float)((float)(v7 / v8) * 100.0)];
      self->_resumeCount = (NSNumber *)[a3 objectForKeyedSubscript:@"resumeCount"];
      self->_cumulativeCloakTime = (NSNumber *)[a3 objectForKeyedSubscript:@"cumulativeCloakTime"];
      self->_cumulativeTimeTaken = (NSNumber *)[a3 objectForKeyedSubscript:@"cumulativeUpdateTime"];
      v13[0] = @"Event";
      v13[1] = @"transportType";
      v14[0] = v5;
      v14[1] = @"EATransport";
      resumedFromPercentNum = self->_resumedFromPercentNum;
      v13[2] = @"resumingFromPercent";
      v13[3] = @"resumeCount";
      resumeCount = self->_resumeCount;
      v14[2] = resumedFromPercentNum;
      v14[3] = resumeCount;
      id v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
    }
    else
    {
      id v11 = 0;
    }
    updateHandler = (void (**)(id, NSDictionary *))self->_updateHandler;
    if (updateHandler) {
      updateHandler[2](updateHandler, v11);
    }
  }
}

- (void)firmwareUpdateComplete:(id)a3 error:(id)a4
{
  if (a4)
  {
    -[EAFirmwareUpdater updateComplete:error:](self, "updateComplete:error:");
  }
  else
  {
    self->_firmwareUpdateComplete = 1;
    if (self->_isMultiAssetSession
      || [self->_iAUPServer iAUPVersion] == 2
      || self->_closeEASession)
    {
      [(EAFirmwareUpdater *)self updateComplete:a3 error:0];
      eaNotificationDispatchQueue = self->_eaNotificationDispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000DA48;
      block[3] = &unk_100031618;
      block[4] = self;
      dispatch_async((dispatch_queue_t)eaNotificationDispatchQueue, block);
    }
  }
}

- (unsigned)getPersonalizationID
{
  manifestList = self->_manifestList;
  if (!manifestList)
  {
    [(EAFirmwareUpdater *)self log:5 format:@"Error: _manifestList = NULL n"];
    return 1;
  }
  if (!self->_manifestIDs) {
    return 1;
  }
  unint64_t manifestIndex = self->_manifestIndex;
  if ([(NSArray *)manifestList count] <= manifestIndex) {
    return 1;
  }
  return objc_msgSend(-[NSDictionary objectForKey:](self->_manifestIDs, "objectForKey:", -[NSArray objectAtIndexedSubscript:](self->_manifestList, "objectAtIndexedSubscript:", self->_manifestIndex)), "intValue") | 1;
}

- (void)updateComplete:(id)a3 error:(id)a4
{
  objc_sync_enter(self);
  [(EAFirmwareUpdater *)self log:5, @"error=%@", a4 format];
  [(EAFirmwareUpdater *)self stopReconnectTimer];
  eaNotificationDispatchQueue = self->_eaNotificationDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DD2C;
  block[3] = &unk_100031618;
  block[4] = self;
  dispatch_async((dispatch_queue_t)eaNotificationDispatchQueue, block);
  if (!self->_applyCompletion) {
    goto LABEL_16;
  }
  if (a3)
  {
    id v8 = [(EAFirmwareUpdater *)self createEndOfUpdateEventDict:a3 error:a4];
    if (objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"Event"), "isEqualToString:", @"com.apple.fud.updateInterrupted"))
    {
      id v9 = [a4 userInfo];
      uint64_t v10 = 1;
    }
    else
    {
      if (!objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"Event"), "isEqualToString:", @"com.apple.fud.updateFailed"))
      {
        id v11 = 0;
        goto LABEL_10;
      }
      id v9 = [a4 userInfo];
      uint64_t v10 = 4;
    }
    id v11 = +[NSError errorWithDomain:@"com.apple.MobileAccessoryUpdater.ErrorDomain" code:v10 userInfo:v9];
  }
  else
  {
    id v11 = 0;
    id v8 = 0;
  }
LABEL_10:
  id v12 = [(EAFirmwareUpdater *)self applyCompletion];
  v12[2](v12, v8, v11);
  _Block_release(self->_applyCompletion);
  self->_applyCompletion = 0;
  id progressHandler = self->_progressHandler;
  if (progressHandler)
  {
    _Block_release(progressHandler);
    self->_id progressHandler = 0;
  }
  id updateHandler = self->_updateHandler;
  if (updateHandler)
  {
    _Block_release(updateHandler);
    self->_id updateHandler = 0;
  }
  id personalizationRequestHandler = self->_personalizationRequestHandler;
  if (personalizationRequestHandler)
  {
    _Block_release(personalizationRequestHandler);
    self->_id personalizationRequestHandler = 0;
  }
LABEL_16:
  [(EAFirmwareUpdater *)self doneWithAsset];
  [+[NSNotificationCenter defaultCenter] removeObserver:self];
  objc_sync_exit(self);
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  switch(a4)
  {
    case 0uLL:
      [(EAFirmwareUpdater *)self log:5, @"stream %@ event none", a3 format];
      break;
    case 1uLL:
      [(EAFirmwareUpdater *)self log:5, @"stream %@ event open completed", a3 format];
      break;
    case 2uLL:
      [(EAFirmwareUpdater *)self log:5, @"stream %@ event bytes available", a3 format];
      eaNotificationDispatchQueue = self->_eaNotificationDispatchQueue;
      if (eaNotificationDispatchQueue)
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_10000DEF0;
        v8[3] = &unk_100031618;
        v8[4] = self;
        float v6 = v8;
        goto LABEL_10;
      }
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return;
    case 4uLL:
      [(EAFirmwareUpdater *)self log:5, @"stream %@ event space available", a3 format];
      eaNotificationDispatchQueue = self->_eaNotificationDispatchQueue;
      if (eaNotificationDispatchQueue)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000DEF8;
        block[3] = &unk_100031618;
        block[4] = self;
        float v6 = block;
LABEL_10:
        dispatch_async((dispatch_queue_t)eaNotificationDispatchQueue, v6);
      }
      break;
    case 8uLL:
      [(EAFirmwareUpdater *)self log:5, @"stream %@ event error", a3 format];
      break;
    default:
      if (a4 == 16) {
        [(EAFirmwareUpdater *)self log:5, @"stream %@ event end encountered", a3 format];
      }
      break;
  }
}

- (id)flushOutput
{
  p_flushOutputLock = &self->_flushOutputLock;
  pthread_mutex_lock(&self->_flushOutputLock);
  if ([(EAFirmwareUpdater *)self accessory])
  {
    session = self->_session;
    if (session)
    {
      uint64_t v10 = [(EASession *)session outputStream];
      if (v10)
      {
        id v11 = v10;
        if ([(NSOutputStream *)v10 hasSpaceAvailable])
        {
          while ([(NSMutableData *)self->_outputData length])
          {
            uint64_t v12 = [(NSOutputStream *)v11 write:[(NSMutableData *)self->_outputData bytes] maxLength:[(NSMutableData *)self->_outputData length]];
            if (v12 == -1)
            {
              CFStringRef v15 = @"Failure attempting to write to NSOutputStream";
              int v16 = 16;
              goto LABEL_13;
            }
            if (v12 >= 1) {
              -[NSMutableData replaceBytesInRange:withBytes:length:](self->_outputData, "replaceBytesInRange:withBytes:length:", 0, v12, 0, 0);
            }
            if (![(NSOutputStream *)v11 hasSpaceAvailable]) {
              goto LABEL_10;
            }
          }
        }
        goto LABEL_10;
      }
      CFStringRef v15 = @"No output stream on session";
      int v16 = 15;
    }
    else
    {
      CFStringRef v15 = @"No session";
      int v16 = 14;
    }
LABEL_13:
    uint64_t v13 = sub_10000AF34(0, v16, (uint64_t)v15, v4, v5, v6, v7, v8, v17);
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v13 = 0;
LABEL_11:
  pthread_mutex_unlock(p_flushOutputLock);
  return v13;
}

- (void)handleInputData
{
  -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s", "-[EAFirmwareUpdater handleInputData]");
  if (self->_iAUPServer)
  {
    session = self->_session;
    if (session)
    {
      uint64_t v4 = [(EASession *)session inputStream];
      if (v4)
      {
        uint64_t v5 = v4;
        if ([(NSInputStream *)v4 hasBytesAvailable])
        {
          do
          {
            uint64_t v6 = [(NSInputStream *)v5 read:v9 maxLength:128];
            [(EAFirmwareUpdater *)self log:5, @"read %d bytes\n", v6 format];
            if (v6 >= 1)
            {
              uint64_t v7 = v9;
              do
              {
                unsigned int v8 = *v7++;
                [self->_iAUPServer processInByte:v8];
                --v6;
              }
              while (v6);
            }
          }
          while ([(NSInputStream *)v5 hasBytesAvailable]);
        }
      }
    }
  }
}

- (void)_accessoryDidConnect:(id)a3
{
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3052000000;
  v22[3] = sub_10000E58C;
  v22[4] = sub_10000E59C;
  v22[5] = 0;
  -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater _accessoryDidConnect:]", [objc_alloc((Class)NSString) initWithFormat:@"notification=%@", a3]);
  -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater _accessoryDidConnect:]", objc_autorelease(objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"_isExpectingReconnect=%d _isMultiAssetSession=%d current=[%@:%lu:FWvA%@:FWvP%@] ", self->_isExpectingReconnect, self->_isMultiAssetSession, -[EAAccessory modelNumber](-[EAFirmwareUpdater accessory](self, "accessory"), "modelNumber"), -[EAAccessory connectionID](-[EAFirmwareUpdater accessory](self, "accessory"), "connectionID"), -[EAAccessory firmwareRevisionActive](-[EAFirmwareUpdater accessory](self, "accessory"), "firmwareRevisionActive"), -[EAAccessory firmwareRevisionPending](-[EAFirmwareUpdater accessory](self, "accessory"),
          "firmwareRevisionPending"))));
  if (a3)
  {
    id v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", EAAccessoryKey);
    if (v5)
    {
      id v6 = [(EAFirmwareUpdater *)self supportedProtocolForAccessory:v5];
      if (v6)
      {
        unsigned __int8 v7 = objc_msgSend(objc_msgSend(v5, "serialNumber"), "isEqualToString:", self->_serialNumber);
        if (self->_excludeUniqueAccessoryCheck) {
          char v8 = 1;
        }
        else {
          char v8 = v7;
        }
        if ((v8 & 1) == 0)
        {
          -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater _accessoryDidConnect:]", [objc_alloc((Class)NSString) initWithFormat:@"%s: notification tracking different accessory, expected serial# %@ got %@", "-[EAFirmwareUpdater _accessoryDidConnect:]", self->_serialNumber, objc_msgSend(v5, "serialNumber")]);
          goto LABEL_20;
        }
        int isExpectingReconnect = self->_isExpectingReconnect;
        [(EAFirmwareUpdater *)self stopReconnectTimer];
        if (objc_msgSend(v6, "isEqualToString:", -[EAFirmwareUpdater bootloaderProtocol](self, "bootloaderProtocol")))
        {
          if (isExpectingReconnect == 1)
          {
            eaNotificationDispatchQueue = self->_eaNotificationDispatchQueue;
            if (eaNotificationDispatchQueue)
            {
              v21[0] = _NSConcreteStackBlock;
              v21[1] = 3221225472;
              v21[2] = sub_10000E5A8;
              v21[3] = &unk_100031668;
              v21[4] = self;
              v21[5] = v5;
              id v11 = v21;
LABEL_16:
              dispatch_async((dispatch_queue_t)eaNotificationDispatchQueue, v11);
              goto LABEL_20;
            }
LABEL_22:
            CFStringRef v12 = @"System error";
            goto LABEL_18;
          }
        }
        else
        {
          if (!objc_msgSend(v6, "isEqualToString:", -[EAFirmwareUpdater appProtocol](self, "appProtocol")))
          {
            -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s() Ignoring unrelated connect notification", "-[EAFirmwareUpdater _accessoryDidConnect:]");
            goto LABEL_20;
          }
          if (isExpectingReconnect == 2)
          {
            eaNotificationDispatchQueue = self->_eaNotificationDispatchQueue;
            if (eaNotificationDispatchQueue)
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_10000E5E4;
              block[3] = &unk_100031690;
              block[4] = self;
              void block[5] = v22;
              id v11 = block;
              goto LABEL_16;
            }
            goto LABEL_22;
          }
        }
        CFStringRef v12 = @"Accessory reconnected in wrong mode";
LABEL_18:
        -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s() Error - connect notification: supportedProtocol=%@ deviceClass=%@ [%@] ", "-[EAFirmwareUpdater _accessoryDidConnect:]", v6, self->_deviceClass, v12);
        CFStringRef v23 = @"Event";
        CFStringRef v24 = @"com.apple.fud.updateFailed";
        uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        [(EAFirmwareUpdater *)self updateComplete:v13 error:sub_10000AF34(0, 11, (uint64_t)v12, v14, v15, v16, v17, v18, v19)];
      }
    }
  }
LABEL_20:
  _Block_object_dispose(v22, 8);
}

- (void)_accessoryDidDisconnect:(id)a3
{
  -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater _accessoryDidDisconnect:]", [objc_alloc((Class)NSString) initWithFormat:@"notification=%@", a3]);
  if (self->_eaNotificationDispatchQueue)
  {
    objc_sync_enter(self);
    id v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", EAAccessoryKey);
    -[EAFirmwareUpdater log:format:](self, "log:format:", 5, @"%s %@", "-[EAFirmwareUpdater _accessoryDidDisconnect:]", objc_autorelease(objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"_isExpectingReconnect=%d _isMultiAssetSession=%d disconnecting=[%@:%lu:FWvA%@:FWvP%@] current=[%@:%lu:FWvA%@:FWP%@]", self->_isExpectingReconnect, self->_isMultiAssetSession, objc_msgSend(v5, "modelNumber"), objc_msgSend(v5, "connectionID"), objc_msgSend(v5, "firmwareRevisionActive"), objc_msgSend(v5, "firmwareRevisionPending"), -[EAAccessory modelNumber](-[EAFirmwareUpdater accessory](self, "accessory"), "modelNumber"), -[EAAccessory connectionID](-[EAFirmwareUpdater accessory](self, "accessory"), "connectionID"), -[EAAccessory firmwareRevisionActive](
            [(EAFirmwareUpdater *)self accessory],
            "firmwareRevisionActive"),
          [(EAAccessory *)[(EAFirmwareUpdater *)self accessory] firmwareRevisionPending])));
    eaNotificationDispatchQueue = self->_eaNotificationDispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E8AC;
    block[3] = &unk_100031668;
    block[4] = v5;
    void block[5] = self;
    dispatch_async((dispatch_queue_t)eaNotificationDispatchQueue, block);
    objc_sync_exit(self);
  }
}

- (EAAccessory)accessory
{
  return self->_accessory;
}

- (EASession)session
{
  return self->_session;
}

- (NSString)protocolString
{
  return self->_protocolString;
}

- (void)setProtocolString:(id)a3
{
}

- (BOOL)overrideProtocol
{
  return self->_overrideProtocol;
}

- (void)setOverrideProtocol:(BOOL)a3
{
  self->_overrideProtocol = a3;
}

- (NSString)bootloaderProtocol
{
  return self->_bootloaderProtocol;
}

- (void)setBootloaderProtocol:(id)a3
{
}

- (NSString)appProtocol
{
  return self->_appProtocol;
}

- (void)setAppProtocol:(id)a3
{
}

- (NSString)multiAssetAppProtocol
{
  return self->_multiAssetAppProtocol;
}

- (void)setMultiAssetAppProtocol:(id)a3
{
}

- (NSString)firmwareBundleFilename
{
  return self->_updateBundleFilename;
}

- (void)setFirmwareBundleFilename:(id)a3
{
}

- (NSURL)firmwareBundleURL
{
  return self->_updateBundleURL;
}

- (void)setFirmwareBundleURL:(id)a3
{
}

- (id)applyCompletion
{
  return self->_applyCompletion;
}

- (void)setApplyCompletion:(id)a3
{
}

- (BOOL)forceSilentUpdate
{
  return self->_forceSilentUpdate;
}

- (void)setForceSilentUpdate:(BOOL)a3
{
  self->_forceSilentUpdate = a3;
}

- (BOOL)skipDFUMode
{
  return self->_skipDFUMode;
}

- (void)setSkipDFUMode:(BOOL)a3
{
  self->_skipDFUMode = a3;
}

- (BOOL)isMultiAssetSession
{
  return self->_isMultiAssetSession;
}

- (void)setIsMultiAssetSession:(BOOL)a3
{
  self->_isMultiAssetSession = a3;
}

- (BOOL)closeEASession
{
  return self->_closeEASession;
}

- (void)setCloseEASession:(BOOL)a3
{
  self->_closeEASession = a3;
}

- (BOOL)excludeUniqueAccessoryCheck
{
  return self->_excludeUniqueAccessoryCheck;
}

- (void)setExcludeUniqueAccessoryCheck:(BOOL)a3
{
  self->_excludeUniqueAccessoryCheck = a3;
}

- (NSString)currentFirmwareVersionOnAcc
{
  return self->_currentFirmwareVersionOnAcc;
}

- (void)setCurrentFirmwareVersionOnAcc:(id)a3
{
}

- (NSString)firmwareVersionAvailable
{
  return self->_firmwareVersionAvailable;
}

- (void)setFirmwareVersionAvailable:(id)a3
{
}

- (NSString)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(id)a3
{
}

- (NSNumber)resumedFromPercentNum
{
  return self->_resumedFromPercentNum;
}

- (void)setResumedFromPercentNum:(id)a3
{
}

- (NSNumber)resumeCount
{
  return self->_resumeCount;
}

- (void)setResumeCount:(id)a3
{
}

- (NSNumber)cumulativeProgressPercent
{
  return self->_cumulativeProgressPercent;
}

- (void)setCumulativeProgressPercent:(id)a3
{
}

- (NSNumber)cumulativeTimeTaken
{
  return self->_cumulativeTimeTaken;
}

- (void)setCumulativeTimeTaken:(id)a3
{
}

- (NSNumber)cumulativeCloak
{
  return self->_cumulativeCloak;
}

- (void)setCumulativeCloak:(id)a3
{
}

- (NSNumber)currentSessionTimeTaken
{
  return self->_currentSessionTimeTaken;
}

- (void)setCurrentSessionTimeTaken:(id)a3
{
}

- (NSDictionary)manifestIDs
{
  return self->_manifestIDs;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)modelNumber
{
  return self->_modelNumber;
}

- (void)setModelNumber:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

@end