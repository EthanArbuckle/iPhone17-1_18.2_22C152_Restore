@interface SHFUPlugin
- (AUFileParser)personalizationParser;
- (BOOL)abortRegistryEntryID:(id)a3;
- (BOOL)bluetoothPoweredOn;
- (BOOL)deviceNeedsUpdate:(id)a3;
- (BOOL)hostBatteryOnACPower;
- (BOOL)hostConnectedToNetwork;
- (BOOL)reconnectDeviceToHost;
- (BTSessionImpl)btSession;
- (CBCentralManager)centralManager;
- (FudPluginDelegate)delegate;
- (NSArray)equivalentPIDs;
- (NSDictionary)hostPowerSource;
- (NSDictionary)options;
- (NSError)error;
- (NSMutableDictionary)latestFirmwareVersions;
- (NSMutableDictionary)parsers;
- (NSMutableDictionary)pluginInfo;
- (NSNumber)STFWFirst;
- (NSNumber)abortUpdate;
- (NSNumber)allowDowngrade;
- (NSNumber)batteryCheckDevice;
- (NSNumber)batteryCheckHost;
- (NSNumber)bootstrapDelay;
- (NSNumber)btReconnectDelay;
- (NSNumber)compatibilityVersion;
- (NSNumber)deviceNeedsBTReconnect;
- (NSNumber)featureReportDelay;
- (NSNumber)inactivityDelay;
- (NSNumber)inactivityDelayPreflight;
- (NSNumber)manifestCount;
- (NSNumber)minBatteryDevice;
- (NSNumber)minBatteryHost;
- (NSNumber)networkDelay;
- (NSNumber)productID;
- (NSNumber)resetEveryFWPayload;
- (NSNumber)sendSDPQueryNotification;
- (NSNumber)vendorID;
- (NSNumber)versionCheckDelay;
- (NSString)btAddress;
- (NSString)description;
- (NSString)deviceClass;
- (NSString)errorDomain;
- (NSString)loggingIdentifier;
- (NSString)mobileAssetType;
- (NSString)targetDevice;
- (NSURL)firmwareDirectory;
- (OS_dispatch_queue)serialQueue;
- (OS_dispatch_semaphore)btSessionSemaphore;
- (OS_dispatch_semaphore)matchSemaphore;
- (OS_dispatch_semaphore)personalizationSemaphore;
- (OS_dispatch_source)batteryTimer;
- (OS_dispatch_source)delayBootstrapSource;
- (OS_dispatch_source)networkStatus;
- (OS_dispatch_source)userInactivityStatus;
- (OS_os_log)logHandle;
- (OS_os_transaction)transaction;
- (SHFUPlugin)init;
- (SHFUPlugin)initWithCoder:(id)a3;
- (SHFUPlugin)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6;
- (SHFUPlugin)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6 deviceProperties:(id)a7;
- (__SCNetworkReachability)networkReachability;
- (id)getParsersForHWRevID:(id)a3;
- (id)getPreloadedFWVersions:(id *)a3;
- (id)sendPersonalizedFirmwareToDevice;
- (id)verifyDeviceBattery;
- (id)verifyLatestFWVersions;
- (int)batteryToken;
- (int)hostBatteryCapacity;
- (unint64_t)getTotalPrepareBytes:(id)a3;
- (unint64_t)pmNotificationHandle;
- (unsigned)powerAssertionID;
- (void)applyFirmwareWithOptions:(id)a3;
- (void)bootstrapWithOptions:(id)a3;
- (void)btSessionArrived;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)checkNetworkReachability:(unsigned int)a3;
- (void)clearNotification;
- (void)clearOldRegistryEntryIDs;
- (void)commitFirmwareWithOptions:(id)a3;
- (void)createPowerAssertion;
- (void)dealloc;
- (void)delayBootstrap;
- (void)downloadFirmwareWithOptions:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeNextBootstrapAction;
- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4;
- (void)finishWithOptions:(id)a3;
- (void)logIORegistryEntry:(id)a3;
- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5;
- (void)prepareFirmwareWithOptions:(id)a3;
- (void)registerForMatchNotification;
- (void)releasePowerAssertion;
- (void)sendFirmwareToDeviceWithOptions:(id)a3;
- (void)sendPersonalizedManifestsToDevice;
- (void)setBatteryTimer:(id)a3;
- (void)setBatteryToken:(int)a3;
- (void)setBluetoothPoweredOn:(BOOL)a3;
- (void)setBtAddress:(id)a3;
- (void)setBtSession:(BTSessionImpl *)a3;
- (void)setBtSessionSemaphore:(id)a3;
- (void)setCentralManager:(id)a3;
- (void)setDelayBootstrapSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setFirmwareDirectory:(id)a3;
- (void)setHostPowerSource:(id)a3;
- (void)setLatestFirmwareVersions:(id)a3;
- (void)setMatchSemaphore:(id)a3;
- (void)setNetworkReachability:(__SCNetworkReachability *)a3;
- (void)setNetworkStatus:(id)a3;
- (void)setParsers:(id)a3;
- (void)setPersonalizationParser:(id)a3;
- (void)setPersonalizationSemaphore:(id)a3;
- (void)setPmNotificationHandle:(unint64_t)a3;
- (void)setPowerAssertionID:(unsigned int)a3;
- (void)setSerialQueue:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUserInactivityStatus:(id)a3;
- (void)setupBTSession;
- (void)storeRegistryEntryID:(id)a3;
- (void)tagForBluetoothGATTServicesDiscovery;
- (void)verifyHostBattery;
- (void)waitForBTSession;
- (void)waitForDeviceEnumerationWithProgressUpdates:(BOOL)a3;
- (void)waitForNetwork;
- (void)waitForUserInactivity:(int)a3 withOptions:(id)a4;
@end

@implementation SHFUPlugin

- (void)clearNotification
{
  io_object_t notificationIter = self->_notificationIter;
  if (notificationIter)
  {
    IOObjectRelease(notificationIter);
    self->_io_object_t notificationIter = 0;
  }
  notificationPort = self->_notificationPort;
  if (notificationPort)
  {
    IONotificationPortDestroy(notificationPort);
    self->_notificationPort = 0;
  }
}

- (void)registerForMatchNotification
{
  v3 = IONotificationPortCreate(kIOMasterPortDefault);
  self->_notificationPort = v3;
  if (!v3) {
    return;
  }
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  [(SHFUPlugin *)self setMatchSemaphore:v4];

  notificationPort = self->_notificationPort;
  v6 = [(SHFUPlugin *)self serialQueue];
  IONotificationPortSetDispatchQueue(notificationPort, v6);

  IOServiceMatching("IOHIDDevice");
  CFDictionaryRef matching = (CFDictionaryRef)objc_claimAutoreleasedReturnValue();
  v7 = [(SHFUPlugin *)self vendorID];
  [(__CFDictionary *)matching setObject:v7 forKeyedSubscript:@"VendorID"];

  v8 = [(SHFUPlugin *)self productID];
  [(__CFDictionary *)matching setObject:v8 forKeyedSubscript:@"ProductID"];

  v9 = [(SHFUPlugin *)self productID];
  int v10 = [v9 intValue];

  if (v10 > 612)
  {
    if (((v10 - 613) > 0x3A || ((1 << (v10 - 101)) & 0x4A06000001F01FFLL) == 0)
      && v10 != 786)
    {
      goto LABEL_17;
    }
LABEL_5:
    [(__CFDictionary *)matching setObject:&off_100026970 forKeyedSubscript:@"PrimaryUsagePage"];
    v11 = &off_100026988;
    CFStringRef v12 = @"PrimaryUsage";
    goto LABEL_6;
  }
  if (v10 == 332 || v10 == 546) {
    goto LABEL_5;
  }
LABEL_17:
  v11 = &off_100026B10;
  CFStringRef v12 = @"DeviceUsagePairs";
LABEL_6:
  [(__CFDictionary *)matching setObject:v11 forKeyedSubscript:v12];
  p_io_object_t notificationIter = &self->_notificationIter;
  if (!IOServiceAddMatchingNotification(self->_notificationPort, "IOServiceMatched", matching, (IOServiceMatchingCallback)sub_1000037C8, self, &self->_notificationIter)&& *p_notificationIter)
  {
    while (IOIteratorNext(*p_notificationIter))
      ;
  }
}

- (void)encodeWithCoder:(id)a3
{
}

- (SHFUPlugin)initWithCoder:(id)a3
{
  +[NSException raise:NSInternalInconsistencyException format:@"NSCoding protocol unused by fud"];
  return [(SHFUPlugin *)self initWithDeviceClass:&stru_1000249B8 delegate:0 info:0 options:0 deviceProperties:0];
}

- (SHFUPlugin)init
{
  +[NSException raise:NSInternalInconsistencyException format:@"use -initWithDeviceClass:delegate:info:options:deviceProperties:"];
  return [(SHFUPlugin *)self initWithDeviceClass:&stru_1000249B8 delegate:0 info:0 options:0 deviceProperties:0];
}

- (SHFUPlugin)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6
{
  +[NSException raise:NSInternalInconsistencyException, @"use -initWithDeviceClass:delegate:info:options:deviceProperties:", a5, a6 format];
  return [(SHFUPlugin *)self initWithDeviceClass:&stru_1000249B8 delegate:0 info:0 options:0 deviceProperties:0];
}

- (SHFUPlugin)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6 deviceProperties:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = [v15 objectForKeyedSubscript:@"Policy"];
  uint64_t v17 = [v15 objectForKeyedSubscript:@"MatchingDictionary"];
  v18 = (void *)v17;
  v19 = 0;
  if (v15 && v16 && v17)
  {
    v131.receiver = self;
    v131.super_class = (Class)SHFUPlugin;
    v20 = [(SHFUPlugin *)&v131 init];
    if (v20)
    {
      v128 = a5;
      dispatch_queue_t v21 = dispatch_queue_create("com.apple.StandaloneHIDFudPlugins.SHFUPlugin", 0);
      serialQueue = v20->_serialQueue;
      v20->_serialQueue = (OS_dispatch_queue *)v21;

      v20->_powerAssertionID = 0;
      v20->_io_object_t notificationIter = 0;
      v20->_notificationPort = 0;
      uint64_t v23 = [v16 objectForKeyedSubscript:@"MobileAssetType"];
      mobileAssetType = v20->_mobileAssetType;
      v20->_mobileAssetType = (NSString *)v23;

      uint64_t v25 = [v18 objectForKeyedSubscript:@"VendorID"];
      vendorID = v20->_vendorID;
      v20->_vendorID = (NSNumber *)v25;

      uint64_t v27 = [v18 objectForKeyedSubscript:@"ProductID"];
      productID = v20->_productID;
      v20->_productID = (NSNumber *)v27;

      uint64_t v29 = [v16 objectForKeyedSubscript:@"EquivalentPIDs"];
      equivalentPIDs = v20->_equivalentPIDs;
      v20->_equivalentPIDs = (NSArray *)v29;

      uint64_t v31 = [v16 objectForKeyedSubscript:@"VersionCheckDelay"];
      versionCheckDelay = v20->_versionCheckDelay;
      v20->_versionCheckDelay = (NSNumber *)v31;

      id v130 = v12;
      v33 = (NSString *)[objc_alloc((Class)NSString) initWithString:v12];
      deviceClass = v20->_deviceClass;
      v20->_deviceClass = v33;

      v35 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithDictionary:v14];
      options = v20->_options;
      v20->_options = v35;

      v37 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      pluginInfo = v20->_pluginInfo;
      v20->_pluginInfo = v37;

      id v129 = v13;
      objc_storeWeak((id *)&v20->_delegate, v13);
      v39 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      parsers = v20->_parsers;
      v20->_parsers = v39;

      v41 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      latestFirmwareVersions = v20->_latestFirmwareVersions;
      v20->_latestFirmwareVersions = v41;

      id v43 = objc_alloc((Class)NSURL);
      v44 = [v16 objectForKeyedSubscript:@"FirmwareDirectory"];
      v45 = [v44 stringByStandardizingPath];
      v46 = (NSURL *)[v43 initFileURLWithPath:v45 isDirectory:1];
      firmwareDirectory = v20->_firmwareDirectory;
      v20->_firmwareDirectory = v46;

      uint64_t v48 = [v16 objectForKeyedSubscript:@"InactivityDelayPreflight"];
      inactivityDelayPreflight = v20->_inactivityDelayPreflight;
      v20->_inactivityDelayPreflight = (NSNumber *)v48;

      uint64_t v50 = [v16 objectForKeyedSubscript:@"AllowDowngrade"];
      allowDowngrade = v20->_allowDowngrade;
      v20->_allowDowngrade = (NSNumber *)v50;

      uint64_t v52 = [v16 objectForKeyedSubscript:@"BootstrapDelay"];
      bootstrapDelay = v20->_bootstrapDelay;
      v20->_bootstrapDelay = (NSNumber *)v52;

      uint64_t v54 = [v16 objectForKeyedSubscript:@"InactivityDelay"];
      inactivityDelay = v20->_inactivityDelay;
      v20->_inactivityDelay = (NSNumber *)v54;

      uint64_t v56 = [v16 objectForKeyedSubscript:@"NetworkDelay"];
      networkDelay = v20->_networkDelay;
      v20->_networkDelay = (NSNumber *)v56;

      uint64_t v58 = [v16 objectForKeyedSubscript:@"FeatureReportDelay"];
      featureReportDelay = v20->_featureReportDelay;
      v20->_featureReportDelay = (NSNumber *)v58;

      uint64_t v60 = [v16 objectForKeyedSubscript:@"LoggingIdentifier"];
      loggingIdentifier = v20->_loggingIdentifier;
      v20->_loggingIdentifier = (NSString *)v60;

      uint64_t v62 = [v16 objectForKeyedSubscript:@"CompatibilityVersion"];
      compatibilityVersion = v20->_compatibilityVersion;
      v20->_compatibilityVersion = (NSNumber *)v62;

      uint64_t v64 = [v16 objectForKeyedSubscript:@"BatteryCheckHost"];
      batteryCheckHost = v20->_batteryCheckHost;
      v20->_batteryCheckHost = (NSNumber *)v64;

      uint64_t v66 = [v16 objectForKeyedSubscript:@"BatteryCheckDevice"];
      batteryCheckDevice = v20->_batteryCheckDevice;
      v20->_batteryCheckDevice = (NSNumber *)v66;

      uint64_t v68 = [v16 objectForKeyedSubscript:@"MinBatteryHost"];
      minBatteryHost = v20->_minBatteryHost;
      v20->_minBatteryHost = (NSNumber *)v68;

      uint64_t v70 = [v16 objectForKeyedSubscript:@"MinBatteryDevice"];
      minBatteryDevice = v20->_minBatteryDevice;
      v20->_minBatteryDevice = (NSNumber *)v70;

      uint64_t v72 = [v16 objectForKeyedSubscript:@"STFWFirst"];
      STFWFirst = v20->_STFWFirst;
      v20->_STFWFirst = (NSNumber *)v72;

      uint64_t v74 = [v16 objectForKeyedSubscript:@"ResetEveryFWPayload"];
      resetEveryFWPayload = v20->_resetEveryFWPayload;
      v20->_resetEveryFWPayload = (NSNumber *)v74;

      uint64_t v76 = [v16 objectForKeyedSubscript:@"NeedsBluetoothReconnect"];
      deviceNeedsBTReconnect = v20->_deviceNeedsBTReconnect;
      v20->_deviceNeedsBTReconnect = (NSNumber *)v76;

      uint64_t v78 = [v16 objectForKeyedSubscript:@"SendSDPQueryNotification"];
      sendSDPQueryNotification = v20->_sendSDPQueryNotification;
      v20->_sendSDPQueryNotification = (NSNumber *)v78;

      uint64_t v80 = [v16 objectForKeyedSubscript:@"BluetoothReconnectDelay"];
      btReconnectDelay = v20->_btReconnectDelay;
      v20->_btReconnectDelay = (NSNumber *)v80;

      btAddress = v20->_btAddress;
      v20->_btAddress = (NSString *)&stru_1000249B8;

      targetDevice = v20->_targetDevice;
      v20->_targetDevice = (NSString *)&stru_1000249B8;

      v20->_pmNotificationHandle = 0;
      uint64_t v84 = [v16 objectForKeyedSubscript:@"FeatureReportDelay"];
      v85 = v20->_featureReportDelay;
      v20->_featureReportDelay = (NSNumber *)v84;

      uint64_t v86 = [v16 objectForKeyedSubscript:@"ManifestCount"];
      manifestCount = v20->_manifestCount;
      v20->_manifestCount = (NSNumber *)v86;

      v88 = +[NSUserDefaults standardUserDefaults];
      v89 = [v88 objectForKey:@"FeatureReportDelay"];

      if (v89)
      {
        [v88 doubleForKey:@"FeatureReportDelay"];
        uint64_t v90 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v91 = v20->_featureReportDelay;
        v20->_featureReportDelay = (NSNumber *)v90;
      }
      v92 = [v88 objectForKey:@"BootstrapDelay"];

      if (v92)
      {
        [v88 doubleForKey:@"BootstrapDelay"];
        uint64_t v93 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v94 = v20->_bootstrapDelay;
        v20->_bootstrapDelay = (NSNumber *)v93;
      }
      v95 = [v88 objectForKey:@"InactivityDelay"];

      if (v95)
      {
        uint64_t v96 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v88 integerForKey:@"InactivityDelay"]);
        v97 = v20->_inactivityDelay;
        v20->_inactivityDelay = (NSNumber *)v96;
      }
      v98 = [v88 objectForKey:@"NetworkDelay"];

      if (v98)
      {
        uint64_t v99 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v88 integerForKey:@"NetworkDelay"]);
        v100 = v20->_networkDelay;
        v20->_networkDelay = (NSNumber *)v99;
      }
      v101 = [v88 objectForKey:@"MinBatteryHost"];

      if (v101)
      {
        uint64_t v102 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v88 integerForKey:@"MinBatteryHost"]);
        v103 = v20->_minBatteryHost;
        v20->_minBatteryHost = (NSNumber *)v102;
      }
      v104 = [v88 objectForKey:@"MinBatteryDevice"];

      if (v104)
      {
        uint64_t v105 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v88 integerForKey:@"MinBatteryDevice"]);
        v106 = v20->_minBatteryDevice;
        v20->_minBatteryDevice = (NSNumber *)v105;
      }
      v107 = [v88 objectForKey:@"ManifestCount"];

      if (v107)
      {
        uint64_t v108 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v88 integerForKey:@"ManifestCount"]);
        v109 = v20->_manifestCount;
        v20->_manifestCount = (NSNumber *)v108;
      }
      abortUpdate = v20->_abortUpdate;
      v20->_abortUpdate = (NSNumber *)&__kCFBooleanFalse;

      v111 = [v88 stringForKey:@"TargetDevice"];
      if (v111)
      {
        v112 = [(NSURL *)v20->_firmwareDirectory path];
        unsigned int v113 = [v112 hasSuffix:v111];

        if (v113)
        {
          v114 = v111;
          v115 = (NSNumber *)v20->_targetDevice;
          v20->_targetDevice = v114;
        }
        else
        {
          v116 = v20->_targetDevice;
          v20->_targetDevice = (NSString *)@"notTargetedDevice";

          v115 = v20->_abortUpdate;
          v20->_abortUpdate = (NSNumber *)&__kCFBooleanTrue;
        }
      }
      v117 = [v88 stringForKey:@"FirmwareDirectory"];
      if (v117)
      {
        id v118 = objc_alloc((Class)NSURL);
        v119 = [v117 stringByStandardizingPath];
        v120 = (NSURL *)[v118 initFileURLWithPath:v119 isDirectory:1];
        v121 = v20->_firmwareDirectory;
        v20->_firmwareDirectory = v120;
      }
      os_log_t v122 = os_log_create("com.apple.StandaloneHIDFudPlugins", [(NSString *)v20->_loggingIdentifier UTF8String]);
      logHandle = v20->_logHandle;
      v20->_logHandle = (OS_os_log *)v122;

      uint64_t v124 = os_transaction_create();
      transaction = v20->_transaction;
      v20->_transaction = (OS_os_transaction *)v124;

      v126 = [v15 objectForKeyedSubscript:@"DeviceClassName"];
      [(NSMutableDictionary *)v20->_pluginInfo setObject:v126 forKeyedSubscript:@"DeviceClassName"];

      [(NSMutableDictionary *)v20->_pluginInfo setObject:&off_100026B58 forKeyedSubscript:@"PrepareWeight"];
      [(NSMutableDictionary *)v20->_pluginInfo setObject:&off_100026B68 forKeyedSubscript:@"ApplyWeight"];
      [(NSMutableDictionary *)v20->_pluginInfo setObject:&off_100026B78 forKeyedSubscript:@"FinishWeight"];
      id *v128 = v20->_pluginInfo;

      id v13 = v129;
      id v12 = v130;
    }
    self = v20;
    v19 = self;
  }

  return v19;
}

- (NSString)errorDomain
{
  v2 = [(SHFUPlugin *)self loggingIdentifier];
  v3 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.MobileAccessoryUpdater.StandaloneHIDFudPlugins", v2];

  return (NSString *)v3;
}

- (void)dealloc
{
  if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG)) {
    sub_100016AEC();
  }
  io_object_t notificationIter = self->_notificationIter;
  if (notificationIter)
  {
    IOObjectRelease(notificationIter);
    self->_io_object_t notificationIter = 0;
  }
  notificationPort = self->_notificationPort;
  if (notificationPort)
  {
    IONotificationPortDestroy(notificationPort);
    self->_notificationPort = 0;
  }
  networkReachability = self->_networkReachability;
  if (networkReachability)
  {
    SCNetworkReachabilitySetCallback(networkReachability, 0, 0);
    SCNetworkReachabilitySetDispatchQueue(self->_networkReachability, 0);
    CFRelease(self->_networkReachability);
    self->_networkReachability = 0;
  }
  networkStatus = self->_networkStatus;
  if (networkStatus)
  {
    dispatch_source_cancel((dispatch_source_t)networkStatus);
    v7 = self->_networkStatus;
    self->_networkStatus = 0;
  }
  userInactivityStatus = self->_userInactivityStatus;
  if (userInactivityStatus)
  {
    dispatch_source_cancel((dispatch_source_t)userInactivityStatus);
    v9 = self->_userInactivityStatus;
    self->_userInactivityStatus = 0;
  }
  if (self->_pmNotificationHandle)
  {
    IOPMUnregisterNotification();
    self->_pmNotificationHandle = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)SHFUPlugin;
  [(SHFUPlugin *)&v10 dealloc];
}

- (NSString)description
{
  v16 = [(SHFUPlugin *)self versionCheckDelay];
  uint64_t v23 = [(SHFUPlugin *)self inactivityDelayPreflight];
  id v15 = [(SHFUPlugin *)self allowDowngrade];
  v22 = [(SHFUPlugin *)self bootstrapDelay];
  id v14 = [(SHFUPlugin *)self inactivityDelay];
  id v13 = [(SHFUPlugin *)self networkDelay];
  dispatch_queue_t v21 = [(SHFUPlugin *)self featureReportDelay];
  v20 = [(SHFUPlugin *)self compatibilityVersion];
  v19 = [(SHFUPlugin *)self batteryCheckHost];
  v18 = [(SHFUPlugin *)self batteryCheckDevice];
  v3 = [(SHFUPlugin *)self minBatteryHost];
  id v12 = [(SHFUPlugin *)self minBatteryDevice];
  dispatch_semaphore_t v4 = [(SHFUPlugin *)self STFWFirst];
  v11 = [(SHFUPlugin *)self resetEveryFWPayload];
  v5 = [(SHFUPlugin *)self deviceNeedsBTReconnect];
  objc_super v10 = [(SHFUPlugin *)self sendSDPQueryNotification];
  v6 = [(SHFUPlugin *)self btReconnectDelay];
  v7 = [(SHFUPlugin *)self targetDevice];
  v8 = [(SHFUPlugin *)self abortUpdate];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"FW update policy: %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@", @"VersionCheckDelay", v16, @"InactivityDelayPreflight", v23, @"AllowDowngrade", v15, @"BootstrapDelay", v22, @"InactivityDelay", v14, @"NetworkDelay", v13, @"FeatureReportDelay", v21, @"CompatibilityVersion", v20,
    @"BatteryCheckHost",
    v19,
    @"BatteryCheckDevice",
    v18,
    @"MinBatteryHost",
    v3,
    @"MinBatteryDevice",
    v12,
    @"STFWFirst",
    v4,
    @"ResetEveryFWPayload",
    v11,
    @"NeedsBluetoothReconnect",
    v5,
    @"SendSDPQueryNotification",
    v10,
    @"BluetoothReconnectDelay",
    v6,
    @"TargetDevice",
    v7,
    @"AbortUpdate",
  uint64_t v17 = v8);

  return (NSString *)v17;
}

- (void)logIORegistryEntry:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(SHFUPlugin *)self logHandle];
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

    if (v6)
    {
      CFDictionaryRef v7 = IORegistryEntryIDMatching((uint64_t)[v4 unsignedLongLongValue]);
      io_iterator_t existing = 0;
      if (!IOServiceGetMatchingServices(kIOMasterPortDefault, v7, &existing))
      {
        io_object_t v8 = IOIteratorNext(existing);
        if (v8)
        {
          io_registry_entry_t v9 = v8;
          do
          {
            CFMutableDictionaryRef properties = 0;
            CFAllocatorRef Default = CFAllocatorGetDefault();
            if (!IORegistryEntryCreateCFProperties(v9, &properties, Default, 0))
            {
              CFMutableDictionaryRef v11 = properties;
              if (properties)
              {
                [(__CFDictionary *)properties removeObjectForKey:@"Elements"];
                id v12 = [(SHFUPlugin *)self logHandle];
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
                {
                  id v13 = [v4 unsignedLongLongValue];
                  *(_DWORD *)buf = 134218242;
                  id v17 = v13;
                  __int16 v18 = 2112;
                  CFMutableDictionaryRef v19 = v11;
                  _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "IORegistryEntry ID 0x%016llX properties: %@", buf, 0x16u);
                }
              }
            }
            IOObjectRelease(v9);
            io_registry_entry_t v9 = IOIteratorNext(existing);
          }
          while (v9);
        }
        IOObjectRelease(existing);
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100016B20();
  }

  objc_storeWeak((id *)&self->_delegate, v4);
}

- (BOOL)hostBatteryOnACPower
{
  v2 = [(SHFUPlugin *)self hostPowerSource];
  v3 = [v2 objectForKeyedSubscript:@"Power Source State"];

  LOBYTE(v2) = [v3 isEqualToString:@"AC Power"];
  return (char)v2;
}

- (int)hostBatteryCapacity
{
  v2 = [(SHFUPlugin *)self hostPowerSource];
  v3 = [v2 objectForKeyedSubscript:@"Current Capacity"];

  LODWORD(v2) = [v3 intValue];
  return (int)v2;
}

- (NSDictionary)hostPowerSource
{
  hostPowerSource = self->_hostPowerSource;
  if (!hostPowerSource)
  {
    id v4 = (const void *)IOPSCopyPowerSourcesByType();
    if (v4)
    {
      v5 = v4;
      CFArrayRef v6 = IOPSCopyPowerSourcesList(v4);
      if (v6)
      {
        CFArrayRef v7 = v6;
        CFIndex Count = CFArrayGetCount(v6);
        if (Count >= 1)
        {
          CFIndex v9 = Count;
          for (CFIndex i = 0; i != v9; ++i)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v7, i);
            if (ValueAtIndex)
            {
              CFDictionaryRef v12 = IOPSGetPowerSourceDescription(v5, ValueAtIndex);
              if (v12)
              {
                id v13 = +[NSDictionary dictionaryWithDictionary:v12];
                id v14 = self->_hostPowerSource;
                self->_hostPowerSource = v13;
              }
            }
          }
        }
        CFRelease(v7);
      }
      CFRelease(v5);
    }
    hostPowerSource = self->_hostPowerSource;
  }
  id v15 = hostPowerSource;
  return v15;
}

- (void)verifyHostBattery
{
  v3 = [(SHFUPlugin *)self batteryCheckHost];
  if ([v3 BOOLValue])
  {
    signed int v4 = [(SHFUPlugin *)self hostBatteryCapacity];
    v5 = [(SHFUPlugin *)self minBatteryHost];
    signed int v6 = [v5 intValue];

    if (v4 < v6)
    {
      CFArrayRef v7 = [(SHFUPlugin *)self logHandle];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v8 = [(SHFUPlugin *)self hostBatteryCapacity];
        CFIndex v9 = [(SHFUPlugin *)self minBatteryHost];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v45 = v8;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = [v9 intValue];
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Host battery %d%% is below minimum %d%%", buf, 0xEu);
      }
      objc_initWeak(&location, self);
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_1000050DC;
      v41[3] = &unk_1000245A8;
      objc_copyWeak(&v42, &location);
      v41[4] = self;
      objc_super v10 = objc_retainBlock(v41);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_100005228;
      v39[3] = &unk_1000245D0;
      objc_copyWeak(&v40, &location);
      CFMutableDictionaryRef v11 = objc_retainBlock(v39);
      if ([(SHFUPlugin *)self hostBatteryOnACPower])
      {
        CFDictionaryRef v12 = [(SHFUPlugin *)self logHandle];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)v45 = 3600;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Host battery on AC power. Wait %llu seconds for battery level to reach minimum.", buf, 0xCu);
        }

        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_1000052D4;
        v35[3] = &unk_1000245F8;
        uint64_t v25 = &v38;
        objc_copyWeak(&v38, &location);
        id v13 = v11;
        id v36 = v13;
        id v14 = v10;
        id v37 = v14;
        id v15 = objc_retainBlock(v35);
        v16 = [(SHFUPlugin *)self serialQueue];
        dispatch_source_t v17 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v16);
        [(SHFUPlugin *)self setBatteryTimer:v17];

        __int16 v18 = [(SHFUPlugin *)self batteryTimer];

        if (v18)
        {
          CFMutableDictionaryRef v19 = [(SHFUPlugin *)self batteryTimer];
          dispatch_time_t v20 = dispatch_time(0, 3600000000000);
          dispatch_source_set_timer(v19, v20, 0x34630B8A000uLL, 0x12A05F200uLL);

          dispatch_queue_t v21 = [(SHFUPlugin *)self batteryTimer];
          handler = _NSConcreteStackBlock;
          uint64_t v28 = 3221225472;
          uint64_t v29 = sub_100005444;
          v30 = &unk_100024620;
          objc_copyWeak(&v34, &location);
          uint64_t v31 = v15;
          v32 = v13;
          v33 = v14;
          dispatch_source_set_event_handler(v21, &handler);

          v22 = [(SHFUPlugin *)self batteryTimer];
          dispatch_activate(v22);

          objc_destroyWeak(&v34);
        }
        uint64_t v23 = [(SHFUPlugin *)self serialQueue];
        uint32_t v24 = notify_register_dispatch("com.apple.system.powersources.percent", &self->_batteryToken, v23, v15);

        if (v24)
        {
          v13[2](v13);
          v14[2](v14);
        }
        else
        {
          ((void (*)(void *, void))v15[2])(v15, [(SHFUPlugin *)self batteryToken]);
        }

        objc_destroyWeak(v26);
      }
      else
      {
        ((void (*)(void *))v10[2])(v10);
      }

      objc_destroyWeak(&v40);
      objc_destroyWeak(&v42);
      objc_destroyWeak(&location);
      return;
    }
  }
  else
  {
  }
  [(SHFUPlugin *)self executeNextBootstrapAction];
}

- (id)verifyDeviceBattery
{
  v3 = [(SHFUPlugin *)self batteryCheckDevice];
  unsigned int v4 = [v3 BOOLValue];

  if (!v4)
  {
    id v13 = 0;
    goto LABEL_22;
  }
  v5 = [(SHFUPlugin *)self delegate];
  signed int v6 = [(SHFUPlugin *)self batteryCheckDevice];
  id v7 = [v6 BOOLValue];
  unsigned int v8 = [(SHFUPlugin *)self logHandle];
  CFIndex v9 = [(SHFUPlugin *)self options];
  objc_super v10 = [v9 objectForKeyedSubscript:@"IOMatchLaunchServiceID"];
  CFMutableDictionaryRef v11 = [(SHFUPlugin *)self errorDomain];
  id v40 = 0;
  CFDictionaryRef v12 = +[SHFUDevice getDevices:v5 hasPowerSource:v7 logHandle:v8 registryEntryID:v10 errorDomain:v11 error:&v40];
  id v13 = v40;

  if (v13) {
    goto LABEL_21;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (!v15)
  {
    id v13 = v14;
    goto LABEL_20;
  }
  id v16 = v15;
  v33 = v12;
  id v13 = 0;
  char v34 = 0;
  uint64_t v17 = *(void *)v37;
  id obj = v14;
  do
  {
    for (CFIndex i = 0; i != v16; CFIndex i = (char *)i + 1)
    {
      if (*(void *)v37 != v17) {
        objc_enumerationMutation(obj);
      }
      CFMutableDictionaryRef v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      dispatch_time_t v20 = [v19 powerSource];

      if (!v20)
      {
        v26 = +[NSString stringWithFormat:@"No power source for device %@", v19];
        id v30 = objc_alloc((Class)NSError);
        uint64_t v28 = [(SHFUPlugin *)self errorDomain];
        NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
        v44 = v26;
        uint64_t v31 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        id v29 = [v30 initWithDomain:v28 code:58 userInfo:v31];

        id v13 = (id)v31;
        goto LABEL_12;
      }
      signed int v21 = [v19 batteryCapacity];
      v22 = [(SHFUPlugin *)self minBatteryDevice];
      signed int v23 = [v22 intValue];

      if (v21 < v23)
      {
        id v24 = [v19 batteryCapacity];
        uint64_t v25 = [(SHFUPlugin *)self minBatteryDevice];
        v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Low battery %d%% below minimum %d%% for device %@", v24, [v25 intValue], v19);

        id v27 = objc_alloc((Class)NSError);
        NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
        id v42 = v26;
        uint64_t v28 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        id v29 = [v27 initWithDomain:@"com.apple.MobileAccessoryUpdater.ErrorDomain" code:-1 userInfo:v28];
LABEL_12:

        id v13 = v29;
        continue;
      }
      char v34 = 1;
    }
    id v16 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  }
  while (v16);

  CFDictionaryRef v12 = v33;
  if (v34)
  {
LABEL_20:

    id v13 = 0;
  }
LABEL_21:

LABEL_22:
  return v13;
}

- (void)btSessionArrived
{
  v2 = [(SHFUPlugin *)self btSessionSemaphore];
  dispatch_semaphore_signal(v2);
}

- (void)setupBTSession
{
  v3 = [(SHFUPlugin *)self serialQueue];
  int v4 = BTSessionAttachWithQueue();

  if (v4)
  {
    v5 = [(SHFUPlugin *)self logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100016B88();
    }
  }
}

- (void)waitForBTSession
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  [(SHFUPlugin *)self setBtSessionSemaphore:v3];

  [(SHFUPlugin *)self setupBTSession];
  dispatch_time_t v4 = dispatch_time(0, 10000000000);
  v5 = [(SHFUPlugin *)self btSessionSemaphore];
  intptr_t v6 = dispatch_semaphore_wait(v5, v4);

  if (v6)
  {
    id v7 = [(SHFUPlugin *)self logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100016BF0();
    }
  }
}

- (BOOL)reconnectDeviceToHost
{
  objc_initWeak(&location, self);
  dispatch_semaphore_t v3 = [(SHFUPlugin *)self deviceNeedsBTReconnect];
  if (![v3 BOOLValue]) {
    goto LABEL_10;
  }
  dispatch_time_t v4 = [(SHFUPlugin *)self btAddress];
  BOOL v5 = [v4 length] == 0;

  if (!v5)
  {
    if ([(SHFUPlugin *)self btSession])
    {
      intptr_t v6 = [(SHFUPlugin *)self btReconnectDelay];
      [v6 doubleValue];
      dispatch_semaphore_t v3 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");

      id v7 = [(SHFUPlugin *)self logHandle];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v18 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reconnect device at %@", buf, 0xCu);
      }

      unsigned int v8 = [(SHFUPlugin *)self btReconnectDelay];
      [v8 doubleValue];
      dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
      CFMutableDictionaryRef v11 = [(SHFUPlugin *)self serialQueue];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100005D34;
      v14[3] = &unk_1000245D0;
      objc_copyWeak(&v15, &location);
      dispatch_after(v10, v11, v14);

      objc_destroyWeak(&v15);
      BOOL v12 = 1;
      goto LABEL_11;
    }
    dispatch_semaphore_t v3 = [(SHFUPlugin *)self logHandle];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100016C24();
    }
LABEL_10:
    BOOL v12 = 0;
LABEL_11:

    goto LABEL_12;
  }
  BOOL v12 = 0;
LABEL_12:
  objc_destroyWeak(&location);
  return v12;
}

- (void)delayBootstrap
{
  dispatch_semaphore_t v3 = [(SHFUPlugin *)self bootstrapDelay];
  int v4 = [v3 intValue];

  if (v4 < 1)
  {
    [(SHFUPlugin *)self executeNextBootstrapAction];
  }
  else
  {
    BOOL v5 = [(SHFUPlugin *)self serialQueue];
    dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
    [(SHFUPlugin *)self setDelayBootstrapSource:v6];

    id v7 = [(SHFUPlugin *)self delayBootstrapSource];

    if (v7)
    {
      unsigned int v8 = [(SHFUPlugin *)self delayBootstrapSource];
      double v9 = [(SHFUPlugin *)self bootstrapDelay];
      dispatch_time_t v10 = dispatch_time(0, 1000000000 * (int)[v9 intValue]);
      CFMutableDictionaryRef v11 = [(SHFUPlugin *)self bootstrapDelay];
      dispatch_source_set_timer(v8, v10, 1000000000 * (int)[v11 intValue], 0xEE6B280uLL);

      objc_initWeak(&location, self);
      BOOL v12 = [(SHFUPlugin *)self delayBootstrapSource];
      uint64_t v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      CFMutableDictionaryRef v19 = sub_10000615C;
      dispatch_time_t v20 = &unk_1000245D0;
      objc_copyWeak(&v21, &location);
      dispatch_source_set_event_handler(v12, &v17);

      id v13 = [(SHFUPlugin *)self delayBootstrapSource];
      dispatch_activate(v13);

      id v14 = [(SHFUPlugin *)self logHandle];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        id v15 = [(SHFUPlugin *)self bootstrapDelay];
        unsigned int v16 = [v15 intValue];
        *(_DWORD *)buf = 67109120;
        unsigned int v24 = v16;
        _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Delay bootstrap for %d seconds", buf, 8u);
      }
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
}

- (BOOL)hostConnectedToNetwork
{
  sockaddr address = (sockaddr)xmmword_100022610;
  dispatch_semaphore_t v3 = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, &address);
  if (v3)
  {
    int v4 = v3;
    SCNetworkReachabilityFlags v9 = 0;
    if (SCNetworkReachabilityGetFlags(v3, &v9)) {
      SCNetworkReachabilityFlags v5 = (v9 >> 1) & 1;
    }
    else {
      SCNetworkReachabilityFlags v5 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    SCNetworkReachabilityFlags v5 = 0;
  }
  dispatch_source_t v6 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = "NOT ";
    if (v5) {
      id v7 = "";
    }
    SCNetworkReachabilityFlags v9 = 136315138;
    dispatch_time_t v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%sconnected to the network", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (void)checkNetworkReachability:(unsigned int)a3
{
  char v3 = a3;
  SCNetworkReachabilityFlags v5 = [(SHFUPlugin *)self networkReachability];
  if ((v3 & 2) != 0 && v5)
  {
    dispatch_source_t v6 = [(SHFUPlugin *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Network connection established", (uint8_t *)buf, 2u);
    }

    id v7 = [(SHFUPlugin *)self networkStatus];

    if (v7)
    {
      unsigned int v8 = [(SHFUPlugin *)self networkStatus];
      dispatch_source_cancel(v8);

      [(SHFUPlugin *)self setNetworkStatus:0];
    }
    SCNetworkReachabilitySetCallback([(SHFUPlugin *)self networkReachability], 0, 0);
    SCNetworkReachabilitySetDispatchQueue([(SHFUPlugin *)self networkReachability], 0);
    CFRelease([(SHFUPlugin *)self networkReachability]);
    [(SHFUPlugin *)self setNetworkReachability:0];
    objc_initWeak(buf, self);
    dispatch_time_t v9 = dispatch_time(0, 10000000000);
    dispatch_time_t v10 = [(SHFUPlugin *)self serialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000064CC;
    block[3] = &unk_1000245D0;
    objc_copyWeak(&v12, buf);
    dispatch_after(v9, v10, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
}

- (void)waitForNetwork
{
  sockaddr address = (sockaddr)xmmword_100022610;
  [(SHFUPlugin *)self setNetworkReachability:SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, &address)];
  if ([(SHFUPlugin *)self networkReachability])
  {
    char v3 = [(SHFUPlugin *)self networkReachability];
    int v4 = [(SHFUPlugin *)self serialQueue];
    LODWORD(v3) = SCNetworkReachabilitySetDispatchQueue(v3, v4);

    if (v3)
    {
      SCNetworkReachabilityFlags v5 = [(SHFUPlugin *)self logHandle];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        dispatch_source_t v6 = [(SHFUPlugin *)self networkDelay];
        LODWORD(buf.version) = 67109120;
        HIDWORD(buf.version) = [v6 intValue];
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Will wait %d seconds for a network connection", (uint8_t *)&buf, 8u);
      }
      id v7 = [(SHFUPlugin *)self serialQueue];
      dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v7);
      [(SHFUPlugin *)self setNetworkStatus:v8];

      dispatch_time_t v9 = [(SHFUPlugin *)self networkStatus];

      if (v9)
      {
        dispatch_time_t v10 = [(SHFUPlugin *)self networkStatus];
        CFMutableDictionaryRef v11 = [(SHFUPlugin *)self networkDelay];
        dispatch_time_t v12 = dispatch_time(0, 1000000000 * (int)[v11 intValue]);
        id v13 = [(SHFUPlugin *)self networkDelay];
        dispatch_source_set_timer(v10, v12, 1000000000 * (int)[v13 intValue], 0x12A05F200uLL);

        objc_initWeak(&location, self);
        id v14 = [(SHFUPlugin *)self networkStatus];
        unsigned int v16 = _NSConcreteStackBlock;
        uint64_t v17 = 3221225472;
        uint64_t v18 = sub_100006828;
        CFMutableDictionaryRef v19 = &unk_1000245D0;
        objc_copyWeak(&v20, &location);
        dispatch_source_set_event_handler(v14, &v16);

        id v15 = [(SHFUPlugin *)self networkStatus];
        dispatch_activate(v15);

        buf.version = 0;
        memset(&buf.retain, 0, 24);
        buf.info = self;
        SCNetworkReachabilitySetCallback([(SHFUPlugin *)self networkReachability], (SCNetworkReachabilityCallBack)sub_10000698C, &buf);
        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)executeNextBootstrapAction
{
  char v3 = [(SHFUPlugin *)self error];

  if (v3)
  {
    int v4 = [(SHFUPlugin *)self logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      SCNetworkReachabilityFlags v5 = [(SHFUPlugin *)self targetDevice];
      dispatch_source_t v6 = [(SHFUPlugin *)self error];
      *(_DWORD *)SCNetworkReachabilityContext buf = 138412802;
      unsigned int v16 = v5;
      __int16 v17 = 1024;
      int v18 = 0;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "bootstrap: target device %@ successful %d error %@", buf, 0x1Cu);
    }
    id v7 = [(SHFUPlugin *)self delegate];
    dispatch_source_t v8 = [(SHFUPlugin *)self pluginInfo];
    dispatch_time_t v9 = [(SHFUPlugin *)self error];
    [v7 didBootstrap:0 info:v8 error:v9];

    [(SHFUPlugin *)self setSerialQueue:0];
    [(SHFUPlugin *)self setTransaction:0];
  }
  else if ([(NSMutableArray *)self->_bootstrapActions count])
  {
    id v14 = [(NSMutableArray *)self->_bootstrapActions objectAtIndexedSubscript:0];
    [(NSMutableArray *)self->_bootstrapActions removeObjectAtIndex:0];
    v14[2]();
  }
  else
  {
    dispatch_time_t v10 = [(SHFUPlugin *)self logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      CFMutableDictionaryRef v11 = [(SHFUPlugin *)self targetDevice];
      *(_DWORD *)SCNetworkReachabilityContext buf = 138412802;
      unsigned int v16 = v11;
      __int16 v17 = 1024;
      int v18 = 1;
      __int16 v19 = 2112;
      id v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "bootstrap: target device %@ successful %d error %@", buf, 0x1Cu);
    }
    dispatch_time_t v12 = [(SHFUPlugin *)self delegate];
    id v13 = [(SHFUPlugin *)self pluginInfo];
    [v12 didBootstrap:1 info:v13 error:0];
  }
}

- (void)bootstrapWithOptions:(id)a3
{
  id v17 = a3;
  val = self;
  int v4 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100016E54();
  }

  objc_initWeak(&location, val);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100007198;
  v41[3] = &unk_1000245D0;
  objc_copyWeak(&v42, &location);
  uint64_t v25 = objc_retainBlock(v41);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10000739C;
  v39[3] = &unk_1000245D0;
  objc_copyWeak(&v40, &location);
  unsigned int v24 = objc_retainBlock(v39);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000073E0;
  v37[3] = &unk_1000245D0;
  objc_copyWeak(&v38, &location);
  signed int v23 = objc_retainBlock(v37);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10000765C;
  v35[3] = &unk_1000245D0;
  objc_copyWeak(&v36, &location);
  v22 = objc_retainBlock(v35);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000078AC;
  v33[3] = &unk_1000245D0;
  objc_copyWeak(&v34, &location);
  id v21 = objc_retainBlock(v33);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000078F0;
  v31[3] = &unk_1000245D0;
  objc_copyWeak(&v32, &location);
  id v20 = objc_retainBlock(v31);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000795C;
  v29[3] = &unk_1000245D0;
  objc_copyWeak(&v30, &location);
  __int16 v19 = objc_retainBlock(v29);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000079E8;
  v27[3] = &unk_1000245D0;
  objc_copyWeak(&v28, &location);
  int v18 = objc_retainBlock(v27);
  id v5 = objc_alloc((Class)NSMutableArray);
  dispatch_source_t v6 = objc_retainBlock(v25);
  v44[0] = v6;
  id v7 = objc_retainBlock(v24);
  v44[1] = v7;
  dispatch_source_t v8 = objc_retainBlock(v23);
  v44[2] = v8;
  dispatch_time_t v9 = objc_retainBlock(v22);
  v44[3] = v9;
  dispatch_time_t v10 = objc_retainBlock(v21);
  v44[4] = v10;
  CFMutableDictionaryRef v11 = objc_retainBlock(v20);
  v44[5] = v11;
  dispatch_time_t v12 = objc_retainBlock(v19);
  v44[6] = v12;
  id v13 = objc_retainBlock(v18);
  v44[7] = v13;
  id v14 = +[NSArray arrayWithObjects:v44 count:8];
  id v15 = (NSMutableArray *)[v5 initWithArray:v14];
  bootstrapActions = val->_bootstrapActions;
  val->_bootstrapActions = v15;

  [(SHFUPlugin *)val executeNextBootstrapAction];
  objc_destroyWeak(&v28);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);

  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  id v5 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100016EF0(v4);
  }

  if ([v4 state] == (id)5)
  {
    dispatch_source_t v6 = [(SHFUPlugin *)self logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100016EBC();
    }

    [(SHFUPlugin *)self setBluetoothPoweredOn:1];
  }
}

- (void)tagForBluetoothGATTServicesDiscovery
{
  char v3 = [(SHFUPlugin *)self centralManager];
  id v4 = [v3 retrieveConnectedPeripheralsWithServices:0 allowAll:1];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v16;
    *(void *)&long long v7 = 138412546;
    long long v14 = v7;
    do
    {
      for (CFIndex i = 0; i != v8; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        CFMutableDictionaryRef v11 = *(__CFString **)(*((void *)&v15 + 1) + 8 * i);
        dispatch_time_t v12 = [(SHFUPlugin *)self logHandle];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)SCNetworkReachabilityContext buf = 138412290;
          CFStringRef v20 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found Bluetooth peripheral %@", buf, 0xCu);
        }

        if ([(__CFString *)v11 hasTag:@"BluetoothTVRemote"])
        {
          id v13 = [(SHFUPlugin *)self logHandle];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)SCNetworkReachabilityContext buf = v14;
            CFStringRef v20 = @"BluetoothTVRemote";
            __int16 v21 = 2112;
            CFStringRef v22 = @"_FORCE_GATT_SERVICES_DISCOVERY_";
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Found Bluetooth peripheral with tag %@. Setting tag %@", buf, 0x16u);
          }

          [(__CFString *)v11 tag:@"_FORCE_GATT_SERVICES_DISCOVERY_"];
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v8);
  }
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
}

- (void)downloadFirmwareWithOptions:(id)a3
{
}

- (BOOL)deviceNeedsUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(SHFUPlugin *)self latestFirmwareVersions];
  unsigned int v6 = [v4 hardwareVersionSupportedBy:v5];

  if (!v6)
  {
    CFMutableDictionaryRef v11 = [(SHFUPlugin *)self logHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100016F70();
    }
LABEL_7:

    goto LABEL_8;
  }
  long long v7 = [(SHFUPlugin *)self allowDowngrade];
  unsigned int v8 = [v7 BOOLValue];

  uint64_t v9 = [(SHFUPlugin *)self latestFirmwareVersions];
  if (!v8)
  {
    int v13 = [v4 firmwareVersionsOlderThan:v9];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_10;
  }
  unsigned __int8 v10 = [v4 firmwareVersionsEqualTo:v9];

  if (v10)
  {
LABEL_10:
    if (!+[SHFUDevice ignoreVersionCheck])
    {
      LOBYTE(v6) = 0;
      goto LABEL_8;
    }
    CFMutableDictionaryRef v11 = [(SHFUPlugin *)self logHandle];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating firmware due to preference telling us to ignore the FW version check.", v14, 2u);
    }
    goto LABEL_7;
  }
LABEL_4:
  LOBYTE(v6) = 1;
LABEL_8:

  return v6;
}

- (id)getParsersForHWRevID:(id)a3
{
  id v4 = a3;
  id v5 = [(SHFUPlugin *)self parsers];
  unsigned int v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    long long v7 = [(SHFUPlugin *)self parsers];
    unsigned int v6 = [v7 objectForKeyedSubscript:&off_1000269A0];
  }
  return v6;
}

- (unint64_t)getTotalPrepareBytes:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (CFIndex i = 0; i != v6; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([(SHFUPlugin *)self deviceNeedsUpdate:v10]
          && [v10 hardwareVersion])
        {
          CFMutableDictionaryRef v11 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v10 hardwareVersion]);
          dispatch_time_t v12 = [(SHFUPlugin *)self getParsersForHWRevID:v11];

          v7 += (unint64_t)[v10 getTotalFirmwareBytes:v12];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)createPowerAssertion
{
  IOReturn v3 = IOPMAssertionCreateWithName(@"PreventUserIdleSystemSleep", 0xFFu, @"com.apple.StandaloneHIDFudPlugins.FirmwareUpdate", &self->_powerAssertionID);
  id v4 = [(SHFUPlugin *)self logHandle];
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100016FD8();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    sub_100016FA4();
  }
}

- (void)releasePowerAssertion
{
  if ([(SHFUPlugin *)self powerAssertionID])
  {
    IOReturn v3 = IOPMAssertionRelease([(SHFUPlugin *)self powerAssertionID]);
    id v4 = [(SHFUPlugin *)self logHandle];
    id v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100017074();
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      sub_100017040();
    }

    [(SHFUPlugin *)self setPowerAssertionID:0];
  }
}

- (void)waitForUserInactivity:(int)a3 withOptions:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  unint64_t v7 = [(SHFUPlugin *)self serialQueue];
  dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v7);
  [(SHFUPlugin *)self setUserInactivityStatus:v8];

  uint64_t v9 = [(SHFUPlugin *)self userInactivityStatus];

  if (v9)
  {
    unsigned __int8 v10 = [(SHFUPlugin *)self userInactivityStatus];
    dispatch_time_t v11 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v10, v11, 0xDF8475800uLL, 0x1DCD6500uLL);

    dispatch_time_t v12 = [(SHFUPlugin *)self userInactivityStatus];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100008710;
    handler[3] = &unk_1000245D0;
    objc_copyWeak(&v25, &location);
    dispatch_source_set_event_handler(v12, handler);

    int v13 = [(SHFUPlugin *)self userInactivityStatus];
    dispatch_activate(v13);

    objc_destroyWeak(&v25);
  }
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_1000087E8;
  v22[4] = sub_100008814;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000881C;
  v18[3] = &unk_100024648;
  objc_copyWeak(&v20, &location);
  int v21 = a3;
  id v14 = v6;
  id v19 = v14;
  signed int v23 = objc_retainBlock(v18);
  long long v15 = [(SHFUPlugin *)self serialQueue];
  long long v16 = [(SHFUPlugin *)self inactivityDelay];
  [v16 intValue];
  objc_copyWeak(&v17, &location);
  [(SHFUPlugin *)self setPmNotificationHandle:IOPMScheduleUserActivityLevelNotificationWithTimeout()];

  objc_destroyWeak(&v17);
  _Block_object_dispose(v22, 8);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)prepareFirmwareWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100016E54();
  }

  [(SHFUPlugin *)self createPowerAssertion];
  id v6 = [(SHFUPlugin *)self inactivityDelayPreflight];
  if (([v6 BOOLValue] & 1) == 0)
  {

    goto LABEL_7;
  }
  unint64_t v7 = [(SHFUPlugin *)self inactivityDelay];
  int v8 = [v7 intValue];

  if (v8 < 1)
  {
LABEL_7:
    [(SHFUPlugin *)self sendFirmwareToDeviceWithOptions:v4];
    goto LABEL_8;
  }
  [(SHFUPlugin *)self waitForUserInactivity:0 withOptions:v4];
LABEL_8:
}

- (void)sendFirmwareToDeviceWithOptions:(id)a3
{
  id v65 = a3;
  id v4 = [(SHFUPlugin *)self firmwareDirectory];
  id v5 = [(SHFUPlugin *)self logHandle];
  id v6 = [(SHFUPlugin *)self productID];
  unint64_t v7 = [(SHFUPlugin *)self equivalentPIDs];
  int v8 = [(SHFUPlugin *)self errorDomain];
  uint64_t v9 = [(SHFUPlugin *)self STFWFirst];
  unsigned __int8 v10 = [(SHFUPlugin *)self parsers];
  uint64_t v11 = +[AUFileParser loadParsersFromFWDirectory:v4 logHandle:v5 productID:v6 equivalentPIDs:v7 errorDomain:v8 STFWFirst:v9 parsers:v10];

  dispatch_time_t v12 = (void *)v11;
  if (v11)
  {
    id v13 = 0;
    id v14 = self;
LABEL_5:
    [(SHFUPlugin *)v14 setTransaction:0];
    [(SHFUPlugin *)v14 setSerialQueue:0];
    unsigned int v24 = v12;
    [(SHFUPlugin *)v14 setError:v12];
    [(SHFUPlugin *)v14 releasePowerAssertion];
    uint64_t v25 = 0;
    goto LABEL_6;
  }
  long long v15 = [(SHFUPlugin *)self delegate];
  long long v16 = [(SHFUPlugin *)self batteryCheckDevice];
  id v17 = [v16 BOOLValue];
  long long v18 = [(SHFUPlugin *)self logHandle];
  id v19 = [(SHFUPlugin *)self options];
  id v20 = [v19 objectForKeyedSubscript:@"IOMatchLaunchServiceID"];
  int v21 = [(SHFUPlugin *)self errorDomain];
  id v78 = 0;
  CFStringRef v22 = +[SHFUDevice getDevices:v15 hasPowerSource:v17 logHandle:v18 registryEntryID:v20 errorDomain:v21 error:&v78];
  id v23 = v78;

  dispatch_time_t v12 = v23;
  if (v23)
  {
    id v14 = self;
    id v13 = v22;
    goto LABEL_5;
  }
  unint64_t v71 = [(SHFUPlugin *)self getTotalPrepareBytes:v22];
  *(void *)SCNetworkReachabilityContext buf = 0;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v13 = v22;
  id v30 = [v13 countByEnumeratingWithState:&v74 objects:v88 count:16];
  id v14 = self;
  if (!v30)
  {

    dispatch_time_t v12 = 0;
    goto LABEL_5;
  }
  id v31 = v30;
  dispatch_time_t v12 = 0;
  char v67 = 0;
  uint64_t v32 = *(void *)v75;
  p_base_props = &SHFUPluginPreloaded__metaData.base_props;
  uint64_t v73 = *(void *)v75;
  id v66 = v13;
  do
  {
    id v34 = 0;
    id v72 = v31;
    do
    {
      if (*(void *)v75 != v32) {
        objc_enumerationMutation(v13);
      }
      v35 = *(void **)(*((void *)&v74 + 1) + 8 * (void)v34);
      if ([(SHFUPlugin *)v14 deviceNeedsUpdate:v35])
      {
        id v36 = [(SHFUPlugin *)v14 deviceNeedsBTReconnect];
        unsigned int v37 = [v36 BOOLValue];

        if (!v37) {
          goto LABEL_41;
        }
        [(SHFUPlugin *)v14 waitForBTSession];
        if ([(SHFUPlugin *)v14 btSession]) {
          goto LABEL_41;
        }
        v55 = +[NSString stringWithFormat:@"Bluetooth Session not found for device %@", v35];
        id v56 = objc_alloc((Class)NSError);
        v57 = [(SHFUPlugin *)v14 errorDomain];
        NSErrorUserInfoKey v86 = NSLocalizedDescriptionKey;
        v87 = v55;
        +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
        v59 = id v58 = v13;
        id v49 = [v56 initWithDomain:v57 code:34 userInfo:v59];

        id v13 = v58;
        id v31 = v72;

        char v67 = 0;
        if (!v49)
        {
LABEL_41:
          if ([v35 hardwareVersion]) {
            goto LABEL_42;
          }
          uint64_t v50 = +[NSString stringWithFormat:@"No hardware revision ID for device %@", v35];
          id v51 = objc_alloc((Class)NSError);
          uint64_t v52 = [(SHFUPlugin *)v14 errorDomain];
          NSErrorUserInfoKey v84 = NSLocalizedDescriptionKey;
          v85 = v50;
          +[NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
          uint64_t v54 = v53 = v13;
          id v49 = [v51 initWithDomain:v52 code:9 userInfo:v54];

          id v13 = v53;
          id v31 = v72;

          if (!v49)
          {
LABEL_42:
            id v38 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v35 hardwareVersion]);
            long long v39 = [(SHFUPlugin *)v14 getParsersForHWRevID:v38];

            id v40 = [(SHFUPlugin *)v14 resetEveryFWPayload];
            unsigned int v41 = [v40 BOOLValue];

            if (v41)
            {
              uint64_t v68 = p_base_props + 471;
              id v42 = [(SHFUPlugin *)v14 vendorID];
              NSErrorUserInfoKey v43 = [(SHFUPlugin *)v14 productID];
              v69 = [(SHFUPlugin *)v14 batteryCheckDevice];
              id v44 = [v69 BOOLValue];
              v45 = [(SHFUPlugin *)v14 featureReportDelay];
              [(SHFUPlugin *)v14 logHandle];
              v46 = uint64_t v70 = v12;
              v47 = [(SHFUPlugin *)v14 delegate];
              uint64_t v48 = [(SHFUPlugin *)v14 errorDomain];
              id v49 = [v68 sendAllFirmwaresToDeviceWithVendorID:v42 productID:v43 hasPowerSource:v44 parsers:v39 totalPrepareBytes:v71 bytesSent:buf featureReportDelay:v45 logHandle:v46 pluginDelegate:v47 errorDomain:v48];

              id v31 = v72;
              dispatch_time_t v12 = v70;

              p_base_props = (__objc2_prop_list **)(&SHFUPluginPreloaded__metaData + 64);
              id v13 = v66;
            }
            else
            {
              id v42 = [(SHFUPlugin *)v14 featureReportDelay];
              id v49 = [v35 sendAllFirmwaresToDevice:v39 totalPrepareBytes:v71 bytesSent:buf featureReportDelay:v42];
            }

            if (!v49)
            {
              char v67 = 1;
LABEL_33:
              uint64_t v32 = v73;
              goto LABEL_34;
            }
          }
        }
        uint64_t v60 = [(SHFUPlugin *)v14 verifyDeviceBattery];
        v61 = v60;
        if (v60)
        {
          uint64_t v62 = [v60 domain];
          if ([v62 isEqualToString:@"com.apple.MobileAccessoryUpdater.ErrorDomain"])
          {
            id v63 = [v61 code];

            if (v63 != (id)-1)
            {
              p_base_props = (__objc2_prop_list **)(&SHFUPluginPreloaded__metaData + 64);
              goto LABEL_32;
            }
            uint64_t v62 = v49;
            id v49 = v61;
            p_base_props = (__objc2_prop_list **)(&SHFUPluginPreloaded__metaData + 64);
          }
        }
LABEL_32:

        id v64 = v49;
        dispatch_time_t v12 = v64;
        goto LABEL_33;
      }
LABEL_34:
      id v34 = (char *)v34 + 1;
    }
    while (v31 != v34);
    id v31 = [v13 countByEnumeratingWithState:&v74 objects:v88 count:16];
  }
  while (v31);

  if ((v67 & 1) == 0) {
    goto LABEL_5;
  }

  unsigned int v24 = 0;
  uint64_t v25 = 1;
LABEL_6:
  v26 = [(SHFUPlugin *)v14 logHandle];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = [(SHFUPlugin *)v14 targetDevice];
    *(_DWORD *)SCNetworkReachabilityContext buf = 138412802;
    *(void *)&uint8_t buf[4] = v27;
    __int16 v80 = 1024;
    int v81 = v25;
    __int16 v82 = 2112;
    v83 = v24;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "prepareFirmware: target device %@ successful %d error %@", buf, 0x1Cu);
  }
  id v28 = [(SHFUPlugin *)v14 delegate];
  id v29 = [(SHFUPlugin *)v14 pluginInfo];
  [v28 didPrepare:v25 info:v29 error:v24];
}

- (void)applyFirmwareWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100016E54();
  }

  id v6 = [(SHFUPlugin *)self resetEveryFWPayload];
  unsigned int v7 = [v6 BOOLValue];

  if (!v7)
  {
    id v13 = [(SHFUPlugin *)self inactivityDelayPreflight];
    if ([v13 BOOLValue])
    {
    }
    else
    {
      id v14 = [(SHFUPlugin *)self inactivityDelay];
      int v15 = [v14 intValue];

      if (v15 >= 1)
      {
        [(SHFUPlugin *)self waitForUserInactivity:1 withOptions:v4];
        goto LABEL_12;
      }
    }
    [(SHFUPlugin *)self commitFirmwareWithOptions:v4];
    goto LABEL_12;
  }
  [(SHFUPlugin *)self reconnectDeviceToHost];
  int v8 = [(SHFUPlugin *)self delegate];
  [v8 progress:100.0];

  uint64_t v9 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v10 = [(SHFUPlugin *)self targetDevice];
    int v16 = 138412802;
    id v17 = v10;
    __int16 v18 = 1024;
    int v19 = 1;
    __int16 v20 = 2112;
    uint64_t v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "applyFirmware: target device %@ successful %d error %@", (uint8_t *)&v16, 0x1Cu);
  }
  uint64_t v11 = [(SHFUPlugin *)self delegate];
  dispatch_time_t v12 = [(SHFUPlugin *)self pluginInfo];
  [v11 didApply:1 info:v12 error:0];

LABEL_12:
}

- (void)commitFirmwareWithOptions:(id)a3
{
  id v38 = a3;
  id v4 = [(SHFUPlugin *)self delegate];
  id v5 = [(SHFUPlugin *)self batteryCheckDevice];
  id v6 = [v5 BOOLValue];
  unsigned int v7 = [(SHFUPlugin *)self logHandle];
  int v8 = [(SHFUPlugin *)self options];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"IOMatchLaunchServiceID"];
  unsigned __int8 v10 = [(SHFUPlugin *)self errorDomain];
  id v44 = 0;
  uint64_t v11 = +[SHFUDevice getDevices:v4 hasPowerSource:v6 logHandle:v7 registryEntryID:v9 errorDomain:v10 error:&v44];
  id v12 = v44;

  if (v12)
  {
    uint64_t v13 = 0;
    id v14 = v11;
    goto LABEL_24;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v15 = v11;
  id v16 = [v15 countByEnumeratingWithState:&v40 objects:v53 count:16];
  uint64_t v13 = v16 != 0;
  id v14 = v11;
  if (!v16) {
    goto LABEL_22;
  }
  id v17 = v16;
  BOOL v36 = v16 != 0;
  unsigned int v37 = v11;
  id v12 = 0;
  char v18 = 0;
  uint64_t v19 = *(void *)v41;
  id obj = v15;
  do
  {
    for (CFIndex i = 0; i != v17; CFIndex i = (char *)i + 1)
    {
      if (*(void *)v41 != v19) {
        objc_enumerationMutation(obj);
      }
      uint64_t v21 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      if (![(SHFUPlugin *)self deviceNeedsUpdate:v21])
      {
        v26 = +[NSString stringWithFormat:@"Update not needed for device %@", v21];
        id v27 = objc_alloc((Class)NSError);
        id v28 = [(SHFUPlugin *)self errorDomain];
        NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
        uint64_t v52 = v26;
        id v29 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        id v25 = [v27 initWithDomain:v28 code:17 userInfo:v29];

        if (!v25) {
          goto LABEL_18;
        }
LABEL_17:
        id v30 = v25;

        id v12 = v30;
        goto LABEL_18;
      }
      CFStringRef v22 = [(SHFUPlugin *)self sendSDPQueryNotification];
      unsigned int v23 = [v22 BOOLValue];

      if (v23)
      {
        unsigned int v24 = [(SHFUPlugin *)self productID];
        -[SHFUPlugin sendUpdateSDPQueryNotificationForPID:](self, "sendUpdateSDPQueryNotificationForPID:", [v24 intValue]);
      }
      if ([v21 GATTServicesDiscoveryNeeded]
        && [(SHFUPlugin *)self bluetoothPoweredOn])
      {
        [(SHFUPlugin *)self tagForBluetoothGATTServicesDiscovery];
      }
      id v25 = [v21 commitAllFirmwares];
      v18 |= v25 == 0;
      if (v25) {
        goto LABEL_17;
      }
LABEL_18:
    }
    id v17 = [obj countByEnumeratingWithState:&v40 objects:v53 count:16];
  }
  while (v17);

  if (v18)
  {
    id v15 = v12;
    id v14 = v37;
    uint64_t v13 = v36;
LABEL_22:

    id v12 = 0;
  }
  else
  {
    uint64_t v13 = 0;
    id v14 = v37;
  }
LABEL_24:
  [(SHFUPlugin *)self reconnectDeviceToHost];
  id v31 = [(SHFUPlugin *)self delegate];
  [v31 progress:100.0];

  uint64_t v32 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = [(SHFUPlugin *)self targetDevice];
    *(_DWORD *)SCNetworkReachabilityContext buf = 138412802;
    v46 = v33;
    __int16 v47 = 1024;
    int v48 = v13;
    __int16 v49 = 2112;
    id v50 = v12;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "applyFirmware: target device %@ successful %d error %@", buf, 0x1Cu);
  }
  id v34 = [(SHFUPlugin *)self delegate];
  v35 = [(SHFUPlugin *)self pluginInfo];
  [v34 didApply:v13 info:v35 error:v12];

  if ((v13 & 1) == 0)
  {
    [(SHFUPlugin *)self setError:v12];
    [(SHFUPlugin *)self setTransaction:0];
    [(SHFUPlugin *)self setSerialQueue:0];
    [(SHFUPlugin *)self releasePowerAssertion];
  }
}

- (void)clearOldRegistryEntryIDs
{
  id v15 = +[NSUserDefaults standardUserDefaults];
  IOReturn v3 = [v15 arrayForKey:@"RegistryEntryIDs"];
  id v4 = [v3 mutableCopy];

  id v5 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10001727C();
  }

  id v16 = objc_alloc_init((Class)NSMutableArray);
  id v17 = +[NSDate dateWithTimeIntervalSinceNow:-172800.0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (CFIndex i = 0; i != v7; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = [v10 objectForKeyedSubscript:@"Timestamp"];
        [v11 doubleValue];
        id v12 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
        uint64_t v13 = +[NSDate date];
        id v14 = [v12 compare:v13];

        if (v14 != (id)1 && [v12 compare:v17] != (id)-1) {
          [v16 addObject:v10];
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  [v15 setObject:v16 forKey:@"RegistryEntryIDs"];
}

- (BOOL)abortRegistryEntryID:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 arrayForKey:@"RegistryEntryIDs"];
  id v7 = [v6 mutableCopy];

  if ([v7 count])
  {
    uint64_t v8 = 0;
    while (1)
    {
      uint64_t v9 = [v7 objectAtIndexedSubscript:v8];
      unsigned __int8 v10 = [v9 objectForKeyedSubscript:@"EntryID"];
      if ([v10 isEqualToNumber:v4]) {
        break;
      }

      if (++v8 >= (unint64_t)[v7 count]) {
        goto LABEL_5;
      }
    }
    [v7 removeObjectAtIndex:v8];
    id v12 = [(SHFUPlugin *)self logHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000172E4();
    }

    BOOL v11 = 1;
  }
  else
  {
LABEL_5:
    BOOL v11 = 0;
  }
  [v5 setObject:v7 forKey:@"RegistryEntryIDs"];

  return v11;
}

- (void)storeRegistryEntryID:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 arrayForKey:@"RegistryEntryIDs"];
  id v7 = [v6 mutableCopy];

  if (!v7) {
    id v7 = objc_alloc_init((Class)NSMutableArray);
  }
  v17[0] = @"EntryID";
  v17[1] = @"Timestamp";
  v18[0] = v4;
  uint64_t v8 = +[NSDate date];
  [v8 timeIntervalSince1970];
  uint64_t v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v18[1] = v9;
  unsigned __int8 v10 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  [v7 addObject:v10];

  [v5 setObject:v7 forKey:@"RegistryEntryIDs"];
  BOOL v11 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = +[NSDate date];
    int v13 = 138412546;
    id v14 = v4;
    __int16 v15 = 2112;
    id v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Store registry entry ID %@ at %@", (uint8_t *)&v13, 0x16u);
  }
}

- (id)sendPersonalizedFirmwareToDevice
{
  unsigned __int8 v48 = 0;
  v35 = [(SHFUPlugin *)self delegate];
  id obja = [(SHFUPlugin *)self batteryCheckDevice];
  id v3 = [obja BOOLValue];
  id v4 = [(SHFUPlugin *)self logHandle];
  id v5 = [(SHFUPlugin *)self vendorID];
  id v6 = [v5 intValue];
  id v7 = [(SHFUPlugin *)self productID];
  id v8 = [v7 intValue];
  uint64_t v9 = SHFU_UNKNOWN_LOCATION_ID;
  int v10 = SHFU_UNKNOWN_INTERFACE_NUMBER;
  BOOL v11 = [(SHFUPlugin *)self errorDomain];
  id v47 = 0;
  LODWORD(v34) = v10;
  id v12 = +[SHFUDevice getDevices:v35 hasPowerSource:v3 logHandle:v4 withVendorID:v6 productID:v8 locationID:v9 interfaceNumber:v34 errorDomain:v11 error:&v47];
  id v13 = v47;

  if (!v13)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    BOOL v36 = v12;
    id obj = v12;
    id v14 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v44;
LABEL_4:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(obj);
        }
        char v18 = *(void **)(*((void *)&v43 + 1) + 8 * v17);
        if ([(SHFUPlugin *)self deviceNeedsUpdate:v18])
        {
          long long v19 = +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", [v18 hardwareVersion]);
          long long v20 = [(SHFUPlugin *)self getParsersForHWRevID:v19];

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v21 = v20;
          id v22 = [v21 countByEnumeratingWithState:&v39 objects:v49 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v40;
            while (2)
            {
              for (CFIndex i = 0; i != v23; CFIndex i = (char *)i + 1)
              {
                if (*(void *)v40 != v24) {
                  objc_enumerationMutation(v21);
                }
                v26 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                if ([v26 personalizationRequired])
                {
                  id v27 = [v18 registryEntryID];
                  [(SHFUPlugin *)self storeRegistryEntryID:v27];

                  [(SHFUPlugin *)self setPersonalizationParser:v26];
                  id v28 = [(SHFUPlugin *)self personalizationParser];
                  id v29 = [(SHFUPlugin *)self featureReportDelay];
                  id v13 = [v18 sendUnsignedFWToDevice:v28 featureReportDelay:v29 sendPersonalizedManifests:&v48];

                  goto LABEL_18;
                }
              }
              id v23 = [v21 countByEnumeratingWithState:&v39 objects:v49 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }
          id v13 = 0;
LABEL_18:

          int v30 = v48;
          if (v13 || v30) {
            break;
          }
        }
        if ((id)++v17 == v15)
        {
          id v15 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
          if (v15) {
            goto LABEL_4;
          }
          goto LABEL_22;
        }
      }
    }
    else
    {
LABEL_22:
      id v13 = 0;
    }

    if (v13)
    {
      id v12 = v36;
    }
    else
    {
      id v12 = v36;
      if (v48)
      {
        dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
        [(SHFUPlugin *)self setPersonalizationSemaphore:v31];

        [(SHFUPlugin *)self waitForUserInactivity:2 withOptions:0];
      }
    }
  }
  id v32 = v13;

  return v32;
}

- (void)sendPersonalizedManifestsToDevice
{
  v26 = [(SHFUPlugin *)self delegate];
  id v27 = [(SHFUPlugin *)self batteryCheckDevice];
  id v3 = [v27 BOOLValue];
  id v4 = [(SHFUPlugin *)self logHandle];
  id v5 = [(SHFUPlugin *)self vendorID];
  id v6 = [v5 intValue];
  id v7 = [(SHFUPlugin *)self productID];
  id v8 = [v7 intValue];
  uint64_t v9 = SHFU_UNKNOWN_LOCATION_ID;
  int v10 = SHFU_UNKNOWN_INTERFACE_NUMBER;
  BOOL v11 = [(SHFUPlugin *)self errorDomain];
  id v32 = 0;
  LODWORD(v25) = v10;
  id v12 = +[SHFUDevice getDevices:v26 hasPowerSource:v3 logHandle:v4 withVendorID:v6 productID:v8 locationID:v9 interfaceNumber:v25 errorDomain:v11 error:&v32];
  id v13 = v32;

  if (v13)
  {
    [(SHFUPlugin *)self setError:v13];
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v29;
      while (2)
      {
        for (CFIndex i = 0; i != v16; CFIndex i = (char *)i + 1)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([(SHFUPlugin *)self deviceNeedsUpdate:v19])
          {
            long long v20 = [(SHFUPlugin *)self personalizationParser];
            id v21 = [(SHFUPlugin *)self featureReportDelay];
            id v22 = [(SHFUPlugin *)self manifestCount];
            id v23 = [v19 sendPersonalizedManifestsToDevice:v20 featureReportDelay:v21 manifestCount:v22];
            [(SHFUPlugin *)self setError:v23];

            goto LABEL_13;
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    uint64_t v24 = [(SHFUPlugin *)self personalizationSemaphore];
    dispatch_semaphore_signal(v24);
  }
}

- (void)waitForDeviceEnumerationWithProgressUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SHFUPlugin *)self resetEveryFWPayload];
  unsigned __int8 v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0)
  {
    [(SHFUPlugin *)self registerForMatchNotification];
    id v7 = [(SHFUPlugin *)self versionCheckDelay];
    [v7 doubleValue];
    double v9 = v8 + 300.0;

    for (int i = 0; i != 300; ++i)
    {
      dispatch_time_t v11 = dispatch_time(0, 1000000000);
      id v12 = [(SHFUPlugin *)self matchSemaphore];
      intptr_t v13 = dispatch_semaphore_wait(v12, v11);

      if (!v13) {
        break;
      }
      if (v3)
      {
        id v14 = [(SHFUPlugin *)self delegate];
        [v14 progress:((double)i + 1.0) / v9 * 100.0];
      }
    }
    id v15 = [(SHFUPlugin *)self versionCheckDelay];
    unsigned __int8 v16 = [v15 isEqualToNumber:&off_1000269B8];

    if ((v16 & 1) == 0)
    {
      uint64_t v17 = [(SHFUPlugin *)self versionCheckDelay];
      [v17 doubleValue];
      double v19 = v18;

      if (v19 > 0.0)
      {
        double v20 = 0.0;
        do
        {
          +[NSThread sleepForTimeInterval:1.0];
          double v20 = v20 + 1.0;
          if (v3)
          {
            id v21 = [(SHFUPlugin *)self delegate];
            [v21 progress:(v20 + 300.0) / v9 * 100.0];
          }
          id v22 = [(SHFUPlugin *)self versionCheckDelay];
          [v22 doubleValue];
          double v24 = v23;
        }
        while (v20 < v24);
      }
    }
  }
}

- (void)finishWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(SHFUPlugin *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100016E54();
  }

  unsigned __int8 v6 = [(SHFUPlugin *)self error];
  if (v6)
  {

LABEL_5:
    uint64_t v7 = +[NSString stringWithFormat:@"Previous FudPlugin method failed"];
    id v8 = objc_alloc((Class)NSError);
    double v9 = [(SHFUPlugin *)self errorDomain];
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    uint64_t v31 = v7;
    int v10 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v11 = [v8 initWithDomain:v9 code:55 userInfo:v10];

    [(SHFUPlugin *)self releasePowerAssertion];
    [(SHFUPlugin *)self setTransaction:0];
    id v12 = [(SHFUPlugin *)self logHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      intptr_t v13 = [(SHFUPlugin *)self targetDevice];
      *(_DWORD *)SCNetworkReachabilityContext buf = 138412802;
      uint64_t v25 = v13;
      __int16 v26 = 1024;
      int v27 = 0;
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "finish: target device %@ successful %d error %@", buf, 0x1Cu);
    }
    id v14 = [(SHFUPlugin *)self delegate];
    id v15 = [(SHFUPlugin *)self pluginInfo];
    [v14 didFinish:0 info:v15 error:v11];

    goto LABEL_8;
  }
  unsigned __int8 v16 = [(SHFUPlugin *)self serialQueue];

  if (!v16) {
    goto LABEL_5;
  }
  [(SHFUPlugin *)self waitForDeviceEnumerationWithProgressUpdates:1];
  uint64_t v17 = [(SHFUPlugin *)self sendPersonalizedFirmwareToDevice];
  [(SHFUPlugin *)self setError:v17];

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000ACA0;
  v23[3] = &unk_100024698;
  v23[4] = self;
  uint64_t v7 = objc_retainBlock(v23);
  double v18 = [(SHFUPlugin *)self error];
  if (v18)
  {
  }
  else
  {
    double v19 = [(SHFUPlugin *)self personalizationSemaphore];

    if (v19)
    {
      double v20 = dispatch_get_global_queue(17, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000AE84;
      block[3] = &unk_1000246C0;
      void block[4] = self;
      id v22 = (id)v7;
      dispatch_async(v20, block);

      goto LABEL_8;
    }
  }
  (*(void (**)(uint64_t))(v7 + 16))(v7);
LABEL_8:
}

- (id)verifyLatestFWVersions
{
  NSErrorUserInfoKey v30 = [(SHFUPlugin *)self delegate];
  id v32 = [(SHFUPlugin *)self batteryCheckDevice];
  id v3 = [v32 BOOLValue];
  id v4 = [(SHFUPlugin *)self logHandle];
  id v5 = [(SHFUPlugin *)self vendorID];
  id v6 = [v5 intValue];
  uint64_t v7 = [(SHFUPlugin *)self productID];
  id v8 = [v7 intValue];
  uint64_t v9 = SHFU_UNKNOWN_LOCATION_ID;
  int v10 = SHFU_UNKNOWN_INTERFACE_NUMBER;
  id v11 = [(SHFUPlugin *)self errorDomain];
  id v37 = 0;
  LODWORD(v29) = v10;
  id v12 = +[SHFUDevice getDevices:v30 hasPowerSource:v3 logHandle:v4 withVendorID:v6 productID:v8 locationID:v9 interfaceNumber:v29 errorDomain:v11 error:&v37];
  id v13 = v37;

  if (!v13)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v31 = v12;
      uint64_t v17 = *(void *)v34;
      while (2)
      {
        for (int i = 0; i != v16; int i = (char *)i + 1)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v14);
          }
          double v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          double v20 = [(SHFUPlugin *)self loggingIdentifier];
          [v19 logVersions:v20];

          id v21 = [(SHFUPlugin *)self latestFirmwareVersions];
          unsigned int v22 = [v19 firmwareVersionsEqualTo:v21];

          if (!v22)
          {
            double v24 = +[NSString stringWithFormat:@"%@ does not have latest FW versions", v19];
            id v25 = objc_alloc((Class)NSError);
            __int16 v26 = [(SHFUPlugin *)self errorDomain];
            NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
            long long v41 = v24;
            int v27 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
            id v13 = [v25 initWithDomain:v26 code:14 userInfo:v27];

            goto LABEL_14;
          }
          double v23 = [(SHFUPlugin *)self logHandle];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)SCNetworkReachabilityContext buf = 138412290;
            long long v39 = v19;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "successfully updated %@", buf, 0xCu);
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v16) {
          continue;
        }
        break;
      }
      id v13 = 0;
LABEL_14:
      id v12 = v31;
    }
    else
    {
      id v13 = 0;
    }
  }
  return v13;
}

- (id)getPreloadedFWVersions:(id *)a3
{
  id v37 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = +[NSFileManager defaultManager];
  id v6 = [(SHFUPlugin *)self firmwareDirectory];
  NSURLResourceKey v45 = NSURLPathKey;
  uint64_t v7 = +[NSArray arrayWithObjects:&v45 count:1];
  id v8 = [v5 contentsOfDirectoryAtURL:v6 includingPropertiesForKeys:v7 options:4 error:a3];

  if (!*a3)
  {
    if ([v8 count])
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id obj = v8;
      id v9 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v9)
      {
        id v10 = v9;
        long long v34 = v8;
        uint64_t v36 = *(void *)v39;
        while (2)
        {
          for (int i = 0; i != v10; int i = (char *)i + 1)
          {
            if (*(void *)v39 != v36) {
              objc_enumerationMutation(obj);
            }
            id v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            id v13 = [AUFileParser alloc];
            id v14 = [v12 path];
            id v15 = [(SHFUPlugin *)self productID];
            id v16 = [(SHFUPlugin *)self equivalentPIDs];
            uint64_t v17 = [(SHFUPlugin *)self logHandle];
            double v18 = [(SHFUPlugin *)self errorDomain];
            double v19 = [(AUFileParser *)v13 initWithFilePath:v14 productID:v15 equivalentPIDs:v16 logHandle:v17 errorDomain:v18 error:a3];

            if (*a3)
            {
              id v8 = v34;
              goto LABEL_16;
            }
            double v20 = [(AUFileParser *)v19 getFirmwareType];
            id v21 = [(AUFileParser *)v19 getFirmwareVersion];
            unsigned int v22 = [(AUFileParser *)v19 getHardwareRevisionID];
            double v23 = [v22 stringValue];
            id v24 = [v37 objectForKeyedSubscript:v23];

            if (!v24)
            {
              id v24 = objc_alloc_init((Class)NSMutableDictionary);
              id v25 = [v22 stringValue];
              [v37 setObject:v24 forKeyedSubscript:v25];
            }
            __int16 v26 = [v20 stringValue];
            [v24 setObject:v21 forKeyedSubscript:v26];
          }
          id v10 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
          if (v10) {
            continue;
          }
          break;
        }
        id v8 = v34;
      }
    }
    else
    {
      int v27 = [(SHFUPlugin *)self firmwareDirectory];
      __int16 v28 = [v27 path];
      uint64_t v29 = +[NSString stringWithFormat:@"No firmware files found at %@", v28];

      id v30 = objc_alloc((Class)NSError);
      double v19 = [(SHFUPlugin *)self errorDomain];
      NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
      uint64_t v44 = v29;
      id obj = (id)v29;
      uint64_t v31 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      *a3 = [v30 initWithDomain:v19 code:3 userInfo:v31];

LABEL_16:
    }

    if (!*a3)
    {
      id v32 = [(SHFUPlugin *)self logHandle];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        sub_10001734C(self);
      }
    }
  }

  return v37;
}

- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SHFUPlugin *)self logHandle];
  id v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100017424();
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B7A0;
    block[3] = &unk_1000246E8;
    id v14 = v10;
    id v15 = v8;
    id v16 = v9;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    id v12 = v14;
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    sub_1000173F0();
  }
}

- (void)setHostPowerSource:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (FudPluginDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FudPluginDelegate *)WeakRetained;
}

- (NSString)mobileAssetType
{
  return self->_mobileAssetType;
}

- (NSString)loggingIdentifier
{
  return self->_loggingIdentifier;
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (NSNumber)productID
{
  return self->_productID;
}

- (NSArray)equivalentPIDs
{
  return self->_equivalentPIDs;
}

- (NSNumber)versionCheckDelay
{
  return self->_versionCheckDelay;
}

- (NSNumber)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (NSURL)firmwareDirectory
{
  return self->_firmwareDirectory;
}

- (void)setFirmwareDirectory:(id)a3
{
}

- (NSMutableDictionary)latestFirmwareVersions
{
  return self->_latestFirmwareVersions;
}

- (void)setLatestFirmwareVersions:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSNumber)inactivityDelayPreflight
{
  return self->_inactivityDelayPreflight;
}

- (NSNumber)allowDowngrade
{
  return self->_allowDowngrade;
}

- (NSNumber)bootstrapDelay
{
  return self->_bootstrapDelay;
}

- (NSNumber)inactivityDelay
{
  return self->_inactivityDelay;
}

- (NSNumber)networkDelay
{
  return self->_networkDelay;
}

- (NSNumber)featureReportDelay
{
  return self->_featureReportDelay;
}

- (NSMutableDictionary)pluginInfo
{
  return self->_pluginInfo;
}

- (NSNumber)batteryCheckHost
{
  return self->_batteryCheckHost;
}

- (NSNumber)batteryCheckDevice
{
  return self->_batteryCheckDevice;
}

- (NSNumber)minBatteryHost
{
  return self->_minBatteryHost;
}

- (NSNumber)minBatteryDevice
{
  return self->_minBatteryDevice;
}

- (NSNumber)STFWFirst
{
  return self->_STFWFirst;
}

- (NSNumber)resetEveryFWPayload
{
  return self->_resetEveryFWPayload;
}

- (OS_os_log)logHandle
{
  return self->_logHandle;
}

- (NSNumber)sendSDPQueryNotification
{
  return self->_sendSDPQueryNotification;
}

- (NSNumber)deviceNeedsBTReconnect
{
  return self->_deviceNeedsBTReconnect;
}

- (NSNumber)btReconnectDelay
{
  return self->_btReconnectDelay;
}

- (NSString)targetDevice
{
  return self->_targetDevice;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSNumber)manifestCount
{
  return self->_manifestCount;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (OS_dispatch_semaphore)personalizationSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 328, 1);
}

- (void)setPersonalizationSemaphore:(id)a3
{
}

- (AUFileParser)personalizationParser
{
  return self->_personalizationParser;
}

- (void)setPersonalizationParser:(id)a3
{
}

- (NSMutableDictionary)parsers
{
  return self->_parsers;
}

- (void)setParsers:(id)a3
{
}

- (NSString)btAddress
{
  return self->_btAddress;
}

- (void)setBtAddress:(id)a3
{
}

- (OS_dispatch_semaphore)matchSemaphore
{
  return self->_matchSemaphore;
}

- (void)setMatchSemaphore:(id)a3
{
}

- (OS_dispatch_source)networkStatus
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 368, 1);
}

- (void)setNetworkStatus:(id)a3
{
}

- (__SCNetworkReachability)networkReachability
{
  return self->_networkReachability;
}

- (void)setNetworkReachability:(__SCNetworkReachability *)a3
{
  self->_networkReachability = a3;
}

- (OS_dispatch_source)userInactivityStatus
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 384, 1);
}

- (void)setUserInactivityStatus:(id)a3
{
}

- (OS_dispatch_source)delayBootstrapSource
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 392, 1);
}

- (void)setDelayBootstrapSource:(id)a3
{
}

- (unint64_t)pmNotificationHandle
{
  return self->_pmNotificationHandle;
}

- (void)setPmNotificationHandle:(unint64_t)a3
{
  self->_pmNotificationHandle = a3;
}

- (CBCentralManager)centralManager
{
  return (CBCentralManager *)objc_getProperty(self, a2, 408, 1);
}

- (void)setCentralManager:(id)a3
{
}

- (OS_dispatch_semaphore)btSessionSemaphore
{
  return self->_btSessionSemaphore;
}

- (void)setBtSessionSemaphore:(id)a3
{
}

- (BTSessionImpl)btSession
{
  return self->_btSession;
}

- (void)setBtSession:(BTSessionImpl *)a3
{
  self->_btSession = a3;
}

- (OS_dispatch_source)batteryTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 432, 1);
}

- (void)setBatteryTimer:(id)a3
{
}

- (int)batteryToken
{
  return self->_batteryToken;
}

- (void)setBatteryToken:(int)a3
{
  self->_batteryToken = a3;
}

- (NSNumber)abortUpdate
{
  return self->_abortUpdate;
}

- (unsigned)powerAssertionID
{
  return self->_powerAssertionID;
}

- (void)setPowerAssertionID:(unsigned int)a3
{
  self->_powerAssertionID = a3;
}

- (BOOL)bluetoothPoweredOn
{
  return self->_bluetoothPoweredOn;
}

- (void)setBluetoothPoweredOn:(BOOL)a3
{
  self->_bluetoothPoweredOn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abortUpdate, 0);
  objc_storeStrong((id *)&self->_batteryTimer, 0);
  objc_storeStrong((id *)&self->_btSessionSemaphore, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_delayBootstrapSource, 0);
  objc_storeStrong((id *)&self->_userInactivityStatus, 0);
  objc_storeStrong((id *)&self->_networkStatus, 0);
  objc_storeStrong((id *)&self->_matchSemaphore, 0);
  objc_storeStrong((id *)&self->_btAddress, 0);
  objc_storeStrong((id *)&self->_parsers, 0);
  objc_storeStrong((id *)&self->_personalizationParser, 0);
  objc_storeStrong((id *)&self->_personalizationSemaphore, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_manifestCount, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_btReconnectDelay, 0);
  objc_storeStrong((id *)&self->_deviceNeedsBTReconnect, 0);
  objc_storeStrong((id *)&self->_sendSDPQueryNotification, 0);
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_resetEveryFWPayload, 0);
  objc_storeStrong((id *)&self->_STFWFirst, 0);
  objc_storeStrong((id *)&self->_minBatteryDevice, 0);
  objc_storeStrong((id *)&self->_minBatteryHost, 0);
  objc_storeStrong((id *)&self->_batteryCheckDevice, 0);
  objc_storeStrong((id *)&self->_batteryCheckHost, 0);
  objc_storeStrong((id *)&self->_pluginInfo, 0);
  objc_storeStrong((id *)&self->_featureReportDelay, 0);
  objc_storeStrong((id *)&self->_networkDelay, 0);
  objc_storeStrong((id *)&self->_inactivityDelay, 0);
  objc_storeStrong((id *)&self->_bootstrapDelay, 0);
  objc_storeStrong((id *)&self->_allowDowngrade, 0);
  objc_storeStrong((id *)&self->_inactivityDelayPreflight, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_latestFirmwareVersions, 0);
  objc_storeStrong((id *)&self->_firmwareDirectory, 0);
  objc_storeStrong((id *)&self->_compatibilityVersion, 0);
  objc_storeStrong((id *)&self->_versionCheckDelay, 0);
  objc_storeStrong((id *)&self->_equivalentPIDs, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_loggingIdentifier, 0);
  objc_storeStrong((id *)&self->_mobileAssetType, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_hostPowerSource, 0);
  objc_storeStrong((id *)&self->_bootstrapActions, 0);
}

@end