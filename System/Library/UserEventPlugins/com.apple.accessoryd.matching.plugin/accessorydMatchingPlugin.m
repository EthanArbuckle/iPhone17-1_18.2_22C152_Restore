@interface accessorydMatchingPlugin
- (BOOL)areAttachEventsInList:(id)a3;
- (BOOL)attachToBTServer;
- (BOOL)connectedToBTServer;
- (BOOL)detachFromBTServer;
- (BOOL)digitalIDMatchingEnabled;
- (BOOL)doAttachEventsForPrimaryPortExistInList:(id)a3;
- (BOOL)findUniqueEventsOnPrimaryPort:(id)a3 scanReason:(BOOL)a4 resultsArray:(id)a5;
- (BOOL)isCarPlayAllowed;
- (BOOL)isIOAccessoryManagerMonitorRunning;
- (BOOL)isUSBRestrictedModeTimeoutMonitorRunning;
- (BOOL)launchDigitalIDClients;
- (BOOL)rearLightningUSBPortExists;
- (BOOL)restrictedModeEnabled;
- (BOOL)roleSwapMaskWritten;
- (BTSessionImpl)btSession;
- (IONotificationPort)ioAccessoryManagerClassNotify;
- (IONotificationPort)ioAccessoryPortClassNotify;
- (IONotificationPort)ioNotifyPortLDCM;
- (IONotificationPort)ioNotifyPortTRM;
- (IONotificationPort)ioResourceNotifyPort;
- (IONotificationPort)systemPowerNotifyPortRef;
- (IOUIAngelService)angelServiceLDCM;
- (NSMutableArray)rmEventArray;
- (NSMutableDictionary)aidBulkPipeAccessoryDetachTimesDict;
- (NSMutableDictionary)chargeConfigDict;
- (NSMutableDictionary)digitalIDCacheDict;
- (NSMutableDictionary)mikeyBusAccessoryDetachTimesDict;
- (NSMutableDictionary)uartAccessoryDetachTimesDict;
- (NSMutableSet)btServiceTokenSet;
- (NSMutableSet)digitalIDTokenSet;
- (NSNumber)cachedUSBConnectType;
- (NSNumber)lastUSBAccessoryDetachTime;
- (NSUserDefaults)pluginDefaults;
- (OS_dispatch_queue)accPowerQueue;
- (OS_dispatch_queue)analyticsQueue;
- (OS_dispatch_queue)btEventQueue;
- (OS_dispatch_queue)carPlayEventQueue;
- (OS_dispatch_queue)ioAccessoryEventQueue;
- (OS_dispatch_queue)ioAccessoryManagerEventQueue;
- (OS_dispatch_queue)systemPowerQueue;
- (OS_dispatch_source)accPowerTimer;
- (TRMPortManager)portManager;
- (accessorydMatchingPlugin)initWithModule:(void *)a3;
- (id)bucketizeRMDurations:(id)a3;
- (id)scanEventsListForPrimaryPortsSeen;
- (int)springBoardLockStateToken;
- (ueaPluginSystemSettingsMonitor)ueaPluginSystemSettingsMonitor;
- (unsigned)ioAccessoryManagerClassIteratorArrived;
- (unsigned)ioAccessoryManagerClassIteratorTerminated;
- (unsigned)ioAccessoryPortClassIteratorArrived;
- (unsigned)ioAccessoryPortClassIteratorTerminated;
- (unsigned)ioAddedIteratorLDCM;
- (unsigned)ioAddedIteratorTRM;
- (unsigned)ioNotificationLDCM;
- (unsigned)ioRemovedIteratorTRM;
- (unsigned)ioResourceIterator;
- (unsigned)systemPowerIterator;
- (unsigned)systemPowerPort;
- (unsigned)usbRestrictedModeTimeout;
- (void)addBTServiceClient:(unint64_t)a3;
- (void)addDigitalIDClient:(unint64_t)a3;
- (void)attachToBTServer;
- (void)btServiceEventProvider;
- (void)dealloc;
- (void)detachFromBTServer;
- (void)digitalIDEventProvider;
- (void)eventModule;
- (void)findKnownBTDevices;
- (void)handleUSBPortAdded;
- (void)handleUSBPortTerminated;
- (void)intrusiveUIStateDidChange:(BOOL)a3 forService:(id)a4;
- (void)launchWirelessCarPlay:(BTDeviceImpl *)a3;
- (void)portManager:(id)a3 didAddPort:(id)a4;
- (void)portManager:(id)a3 didRemovePort:(id)a4;
- (void)portManager:(id)a3 didUpdateAuthorizationStateForPort:(id)a4;
- (void)postUniqueAnalyticEventToFigaro:(id)a3 scanReason:(BOOL)a4 scanTime:(id)a5;
- (void)printRMEventArray;
- (void)processAnalyticsEventListUsingTime:(id)a3 scanReason:(BOOL)a4 primaryPort:(id)a5;
- (void)removeBTServiceClient:(unint64_t)a3;
- (void)removeDigitalIDClient:(unint64_t)a3;
- (void)removeStandardModeEvents;
- (void)serverRunningDidChange:(id)a3 status:(int)a4;
- (void)setAccPowerQueue:(id)a3;
- (void)setAccPowerTimer:(id)a3;
- (void)setAidBulkPipeAccessoryDetachTimesDict:(id)a3;
- (void)setAnalyticsQueue:(id)a3;
- (void)setAngelServiceLDCM:(id)a3;
- (void)setBtEventQueue:(id)a3;
- (void)setBtServiceEventProvider:(void *)a3;
- (void)setBtServiceTokenSet:(id)a3;
- (void)setBtSession:(BTSessionImpl *)a3;
- (void)setCachedUSBConnectType:(id)a3;
- (void)setCarPlayEventQueue:(id)a3;
- (void)setChargeConfigDict:(id)a3;
- (void)setConnectedToBTServer:(BOOL)a3;
- (void)setDigitalIDCacheDict:(id)a3;
- (void)setDigitalIDEventProvider:(void *)a3;
- (void)setDigitalIDMatchingEnabled:(BOOL)a3;
- (void)setDigitalIDTokenSet:(id)a3;
- (void)setEventModule:(void *)a3;
- (void)setIoAccessoryEventQueue:(id)a3;
- (void)setIoAccessoryManagerClassIteratorArrived:(unsigned int)a3;
- (void)setIoAccessoryManagerClassIteratorTerminated:(unsigned int)a3;
- (void)setIoAccessoryManagerClassNotify:(IONotificationPort *)a3;
- (void)setIoAccessoryManagerEventQueue:(id)a3;
- (void)setIoAccessoryPortClassIteratorArrived:(unsigned int)a3;
- (void)setIoAccessoryPortClassIteratorTerminated:(unsigned int)a3;
- (void)setIoAccessoryPortClassNotify:(IONotificationPort *)a3;
- (void)setIoAddedIteratorLDCM:(unsigned int)a3;
- (void)setIoAddedIteratorTRM:(unsigned int)a3;
- (void)setIoNotificationLDCM:(unsigned int)a3;
- (void)setIoNotifyPortLDCM:(IONotificationPort *)a3;
- (void)setIoNotifyPortTRM:(IONotificationPort *)a3;
- (void)setIoRemovedIteratorTRM:(unsigned int)a3;
- (void)setIoResourceIterator:(unsigned int)a3;
- (void)setIoResourceNotifyPort:(IONotificationPort *)a3;
- (void)setIsCarPlayAllowed:(BOOL)a3;
- (void)setIsIOAccessoryManagerMonitorRunning:(BOOL)a3;
- (void)setIsUSBRestrictedModeTimeoutMonitorRunning:(BOOL)a3;
- (void)setLastUSBAccessoryDetachTime:(id)a3;
- (void)setMikeyBusAccessoryDetachTimesDict:(id)a3;
- (void)setPluginDefaults:(id)a3;
- (void)setPortManager:(id)a3;
- (void)setRearLightningUSBPortExists:(BOOL)a3;
- (void)setRestrictedModeEnabled:(BOOL)a3;
- (void)setRmEventArray:(id)a3;
- (void)setRoleSwapMaskDueToCarPlayStateChange;
- (void)setRoleSwapMaskForUSBPort;
- (void)setRoleSwapMaskWritten:(BOOL)a3;
- (void)setSpringBoardLockStateToken:(int)a3;
- (void)setSystemPowerIterator:(unsigned int)a3;
- (void)setSystemPowerNotifyPortRef:(IONotificationPort *)a3;
- (void)setSystemPowerPort:(unsigned int)a3;
- (void)setSystemPowerQueue:(id)a3;
- (void)setUartAccessoryDetachTimesDict:(id)a3;
- (void)setUeaPluginSystemSettingsMonitor:(id)a3;
- (void)setUsbRestrictedModeTimeout:(unsigned int)a3;
- (void)startBluetoothMatching;
- (void)startIOAccessoryManagerEventMonitoring;
- (void)startListeningForIOAccessoryPortClass;
- (void)startListeningForLDCMMitigationStatusChange;
- (void)startTRMMonitoring;
- (void)startUSBRestrictedModeTimeoutMonitoring;
- (void)stopBluetoothMatching;
- (void)stopIOAccessoryManagerEventMonitoring;
- (void)stopListeningForIOAccessoryPortClass;
- (void)stopListeningForLDCMMitigationStatusChange;
- (void)stopTRMMonitoring;
- (void)stopUSBRestrictedModeTimeoutMonitoring;
- (void)trmStatusDidChange;
- (void)updateRMDialogShownForPrimaryPort:(id)a3;
- (void)updateUSBChargeCurrent:(id)a3 AndChargeVoltage:(id)a4 ForPrimaryPort:(id)a5 WithDigitalID:(id)a6;
- (void)updateUSBConectType:(id)a3 ForPrimaryPort:(id)a4 WithDigitalID:(id)a5;
@end

@implementation accessorydMatchingPlugin

- (accessorydMatchingPlugin)initWithModule:(void *)a3
{
  v3 = self;
  if (a3)
  {
    init_logging();
    v5 = [(accessorydMatchingPlugin *)v3 init];
    v3 = v5;
    if (v5)
    {
      v5->_eventModule = (void **)a3;
      v6 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithCapacity:1];
      digitalIDTokenSet = v3->_digitalIDTokenSet;
      v3->_digitalIDTokenSet = v6;

      v8 = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithCapacity:1];
      btServiceTokenSet = v3->_btServiceTokenSet;
      v3->_btServiceTokenSet = v8;

      dispatch_queue_t v10 = dispatch_queue_create("accessorydMatchingPlugin_AccPowerTimerQueue", 0);
      accPowerQueue = v3->_accPowerQueue;
      v3->_accPowerQueue = (OS_dispatch_queue *)v10;

      accPowerTimer = v3->_accPowerTimer;
      v3->_accPowerTimer = 0;

      dispatch_queue_t v13 = dispatch_queue_create("accessorydMatchingPlugin_SystemPowerQueue", 0);
      systemPowerQueue = v3->_systemPowerQueue;
      v3->_systemPowerQueue = (OS_dispatch_queue *)v13;

      v3->_systemPowerNotifyPortRef = 0;
      v3->_systemPowerIterator = 0;
      v3->_systemPowerPort = 0;
      CFRunLoopGetMain();
      if (!IOAccessoryStartVoltageEventMonitor())
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v15 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[AirplaneMode init]();
          }
          v15 = &_os_log_default;
          id v16 = &_os_log_default;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[accessorydMatchingPlugin initWithModule:]2();
        }
      }
      v3->_btSession = 0;
      *(_WORD *)&v3->_digitalIDMatchingEnabled = 0;
      *(void *)&v3->_ioAccessoryManagerClassIteratorArrived = 0;
      chargeConfigDict = v3->_chargeConfigDict;
      *(_OWORD *)&v3->_ioAccessoryManagerClassNotify = 0u;

      v3->_isCarPlayAllowed = 0;
      dispatch_queue_t v18 = dispatch_queue_create("accessorydMatchingPlugin_CarPlayEventQueue", 0);
      carPlayEventQueue = v3->_carPlayEventQueue;
      v3->_carPlayEventQueue = (OS_dispatch_queue *)v18;

      dispatch_queue_t v20 = dispatch_queue_create("com.apple.accessoryd.uea.IOAccessoryEventQueue", 0);
      ioAccessoryEventQueue = v3->_ioAccessoryEventQueue;
      v3->_ioAccessoryEventQueue = (OS_dispatch_queue *)v20;

      dispatch_queue_t v22 = dispatch_queue_create("accessorydMatchingPlugin_BTEventQueue", 0);
      btEventQueue = v3->_btEventQueue;
      v3->_btEventQueue = (OS_dispatch_queue *)v22;

      v3->_isIOAccessoryManagerMonitorRunning = 0;
      v3->_ioResourceNotifyPort = 0;
      *(_OWORD *)&v3->_ioAccessoryPortClassIteratorArrived = 0u;
      v24 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      rmEventArray = v3->_rmEventArray;
      v3->_rmEventArray = v24;

      v3->_roleSwapMaskWritten = 0;
      v26 = (NSUserDefaults *)objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", @"com.apple.accessoryd.plugin", &v3->_systemPowerIterator);
      pluginDefaults = v3->_pluginDefaults;
      v3->_pluginDefaults = v26;

      v28 = [(NSUserDefaults *)v3->_pluginDefaults objectForKey:@"cachedDigitalID"];
      uint64_t v29 = +[NSMutableDictionary dictionaryWithDictionary:v28];
      digitalIDCacheDict = v3->_digitalIDCacheDict;
      v3->_digitalIDCacheDict = (NSMutableDictionary *)v29;

      v31 = [(NSUserDefaults *)v3->_pluginDefaults objectForKey:@"uartDetachTimes"];
      uint64_t v32 = +[NSMutableDictionary dictionaryWithDictionary:v31];
      uartAccessoryDetachTimesDict = v3->_uartAccessoryDetachTimesDict;
      v3->_uartAccessoryDetachTimesDict = (NSMutableDictionary *)v32;

      v34 = [(NSUserDefaults *)v3->_pluginDefaults objectForKey:@"mikeyBusDetachTimes"];
      uint64_t v35 = +[NSMutableDictionary dictionaryWithDictionary:v34];
      mikeyBusAccessoryDetachTimesDict = v3->_mikeyBusAccessoryDetachTimesDict;
      v3->_mikeyBusAccessoryDetachTimesDict = (NSMutableDictionary *)v35;

      v37 = [(NSUserDefaults *)v3->_pluginDefaults objectForKey:@"aidBulkPipeDetachTimes"];
      uint64_t v38 = +[NSMutableDictionary dictionaryWithDictionary:v37];
      aidBulkPipeAccessoryDetachTimesDict = v3->_aidBulkPipeAccessoryDetachTimesDict;
      v3->_aidBulkPipeAccessoryDetachTimesDict = (NSMutableDictionary *)v38;

      uint64_t v40 = [(NSUserDefaults *)v3->_pluginDefaults objectForKey:@"lastUSBDetach"];
      lastUSBAccessoryDetachTime = v3->_lastUSBAccessoryDetachTime;
      v3->_lastUSBAccessoryDetachTime = (NSNumber *)v40;

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v42 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        v42 = &_os_log_default;
        id v43 = &_os_log_default;
      }
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v44 = v3->_digitalIDCacheDict;
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v44;
        _os_log_impl(&dword_0, v42, OS_LOG_TYPE_DEFAULT, "digitalIDCacheDict: %@", (uint8_t *)&buf, 0xCu);
      }

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v45 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        v45 = &_os_log_default;
        id v46 = &_os_log_default;
      }
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v47 = v3->_uartAccessoryDetachTimesDict;
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v47;
        _os_log_impl(&dword_0, v45, OS_LOG_TYPE_DEFAULT, "uartAccessoryDetachTimesDict: %@", (uint8_t *)&buf, 0xCu);
      }

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v48 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        v48 = &_os_log_default;
        id v49 = &_os_log_default;
      }
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v50 = v3->_mikeyBusAccessoryDetachTimesDict;
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v50;
        _os_log_impl(&dword_0, v48, OS_LOG_TYPE_DEFAULT, "mikeyBusAccessoryDetachTimesDict: %@", (uint8_t *)&buf, 0xCu);
      }

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v51 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        v51 = &_os_log_default;
        id v52 = &_os_log_default;
      }
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v53 = v3->_aidBulkPipeAccessoryDetachTimesDict;
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v53;
        _os_log_impl(&dword_0, v51, OS_LOG_TYPE_DEFAULT, "aidBulkPipeAccessoryDetachTimesDict: %@", (uint8_t *)&buf, 0xCu);
      }

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v54 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        v54 = &_os_log_default;
        id v55 = &_os_log_default;
      }
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v56 = v3->_lastUSBAccessoryDetachTime;
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v56;
        _os_log_impl(&dword_0, v54, OS_LOG_TYPE_DEFAULT, "lastUSBAccessoryDetachTime: %@", (uint8_t *)&buf, 0xCu);
      }

      uint64_t v57 = [(NSUserDefaults *)v3->_pluginDefaults objectForKey:@"cachedUSBConnectType"];
      cachedUSBConnectType = v3->_cachedUSBConnectType;
      v3->_cachedUSBConnectType = (NSNumber *)v57;

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v59 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          -[AirplaneMode init]();
        }
        v59 = &_os_log_default;
        id v60 = &_os_log_default;
      }
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        v61 = v3->_cachedUSBConnectType;
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v61;
        _os_log_impl(&dword_0, v59, OS_LOG_TYPE_DEFAULT, "cachedUSBConnectType: %@", (uint8_t *)&buf, 0xCu);
      }

      dispatch_queue_t v62 = dispatch_queue_create("accessorydMatchingPlugin_EventLoggerQueue", 0);
      analyticsQueue = v3->_analyticsQueue;
      v3->_analyticsQueue = (OS_dispatch_queue *)v62;

      v3->_ioNotifyPortLDCM = 0;
      *(void *)&v3->_ioNotificationLDCM = 0;
      *(void *)&v3->_ioAddedIteratorTRM = 0;
      ueaPluginSystemSettingsMonitor = v3->_ueaPluginSystemSettingsMonitor;
      v3->_ueaPluginSystemSettingsMonitor = 0;
      v3->_ioNotifyPortTRM = 0;

      io_object_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
      if (ServiceWithPrimaryPort)
      {
        IOObjectRelease(ServiceWithPrimaryPort);
        if (gLogObjects && gNumLogObjects >= 3)
        {
          v66 = *(id *)(gLogObjects + 16);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[AirplaneMode init]();
          }
          v66 = &_os_log_default;
          id v68 = &_os_log_default;
        }
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_0, v66, OS_LOG_TYPE_DEFAULT, "Init _ueaPluginSystemSettingsMonitor", (uint8_t *)&buf, 2u);
        }

        v69 = objc_alloc_init(ueaPluginSystemSettingsMonitor);
        p_super = &v3->_ueaPluginSystemSettingsMonitor->super;
        v3->_ueaPluginSystemSettingsMonitor = v69;
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 3)
        {
          p_super = *(id *)(gLogObjects + 16);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[AirplaneMode init]();
          }
          p_super = &_os_log_default;
          id v70 = &_os_log_default;
        }
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_0, p_super, OS_LOG_TYPE_DEFAULT, "Scorpius not supported. Don't Init _ueaPluginSystemSettingsMonitor", (uint8_t *)&buf, 2u);
        }
      }

      for (uint64_t i = 0; i != 6; ++i)
      {
        v72 = (&off_51900)[i];
        v73 = +[NSFileManager defaultManager];
        v74 = +[NSString stringWithUTF8String:v72];
        [v73 removeItemAtPath:v74 error:0];
      }
      v82[0] = NSFileOwnerAccountName;
      v82[1] = NSFileGroupOwnerAccountName;
      *(void *)&long long buf = @"mobile";
      *((void *)&buf + 1) = @"mobile";
      v75 = +[NSDictionary dictionaryWithObjects:&buf forKeys:v82 count:2];
      v76 = +[NSFileManager defaultManager];
      uint64_t v81 = 0;
      unsigned __int8 v77 = [v76 createDirectoryAtPath:@"/var/mobile/Library/CoreAccessories/Analytics" withIntermediateDirectories:1 attributes:v75 error:&v81];

      if ((v77 & 1) == 0)
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v78 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[AirplaneMode init]();
          }
          v78 = &_os_log_default;
          id v79 = &_os_log_default;
        }
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_0, v78, OS_LOG_TYPE_DEFAULT, "Unable to create event database directory", (uint8_t *)&buf, 2u);
        }
      }
      xpc_event_provider_create();
    }
  }
  else if (self)
  {

    notify_cancel(0);
    v3 = 0;
    *(_DWORD *)&stru_20.segname[8] = -1;
  }
  return v3;
}

- (void)dealloc
{
  int springBoardLockStateToken = self->_springBoardLockStateToken;
  if ((springBoardLockStateToken & 0x80000000) == 0)
  {
    notify_cancel(springBoardLockStateToken);
    self->_int springBoardLockStateToken = -1;
  }
  if (self->_systemPowerIterator) {
    IODeregisterForSystemPower(&self->_systemPowerIterator);
  }
  systemPowerNotifyPortRef = self->_systemPowerNotifyPortRef;
  if (systemPowerNotifyPortRef) {
    IONotificationPortDestroy(systemPowerNotifyPortRef);
  }
  io_connect_t systemPowerPort = self->_systemPowerPort;
  if (systemPowerPort) {
    IOServiceClose(systemPowerPort);
  }
  accPowerTimer = self->_accPowerTimer;
  if (accPowerTimer) {
    dispatch_source_cancel(accPowerTimer);
  }
  v7 = _uiQueue();
  dispatch_sync(v7, &__block_literal_global_238);

  ioAccessoryEventQueue = self->_ioAccessoryEventQueue;
  self->_ioAccessoryEventQueue = 0;

  if (self->_btSession)
  {
    btSession = self->_btSession;
    BTSessionDetachWithQueue();
    self->_btSession = 0;
  }
  ioAccessoryManagerClassNotify = self->_ioAccessoryManagerClassNotify;
  if (ioAccessoryManagerClassNotify)
  {
    IONotificationPortDestroy(ioAccessoryManagerClassNotify);
    self->_ioAccessoryManagerClassNotify = 0;
  }
  [(accessorydMatchingPlugin *)self stopListeningForLDCMMitigationStatusChange];
  v10.receiver = self;
  v10.super_class = (Class)accessorydMatchingPlugin;
  [(accessorydMatchingPlugin *)&v10 dealloc];
}

- (void)addDigitalIDClient:(unint64_t)a3
{
  v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  if (v4)
  {
    v5 = [(accessorydMatchingPlugin *)self digitalIDTokenSet];
    [v5 addObject:v4];

    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 1;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      v8 = &_os_log_default;
      id v7 = &_os_log_default;
    }
    else
    {
      v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(accessorydMatchingPlugin *)self digitalIDTokenSet];
      int v12 = 134217984;
      id v13 = [v9 count];
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "addDigitalIDClient digitalIDTokenSet count: %lu", (uint8_t *)&v12, 0xCu);
    }
    objc_super v10 = [(accessorydMatchingPlugin *)self digitalIDTokenSet];
    v11 = (char *)[v10 count];

    if (v11 == (unsigned char *)&dword_0 + 1)
    {
      [(accessorydMatchingPlugin *)self startListeningForIOAccessoryPortClass];
      [(accessorydMatchingPlugin *)self startIOAccessoryManagerEventMonitoring];
      [(accessorydMatchingPlugin *)self startUSBRestrictedModeTimeoutMonitoring];
      [(accessorydMatchingPlugin *)self startTRMMonitoring];
    }
  }
}

- (void)removeDigitalIDClient:(unint64_t)a3
{
  v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  if (v4)
  {
    v5 = [(accessorydMatchingPlugin *)self digitalIDTokenSet];
    [v5 removeObject:v4];

    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 1;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      v8 = &_os_log_default;
      id v7 = &_os_log_default;
    }
    else
    {
      v8 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(accessorydMatchingPlugin *)self digitalIDTokenSet];
      int v12 = 134217984;
      id v13 = [v9 count];
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "removeDigitalIDClient digitalIDTokenSet count: %lu", (uint8_t *)&v12, 0xCu);
    }
    objc_super v10 = [(accessorydMatchingPlugin *)self digitalIDTokenSet];
    id v11 = [v10 count];

    if (!v11)
    {
      [(accessorydMatchingPlugin *)self stopIOAccessoryManagerEventMonitoring];
      [(accessorydMatchingPlugin *)self stopListeningForIOAccessoryPortClass];
      [(accessorydMatchingPlugin *)self stopUSBRestrictedModeTimeoutMonitoring];
      [(accessorydMatchingPlugin *)self stopTRMMonitoring];
    }
  }
}

- (void)startIOAccessoryManagerEventMonitoring
{
  v3 = [(accessorydMatchingPlugin *)self ioAccessoryEventQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __66__accessorydMatchingPlugin_startIOAccessoryManagerEventMonitoring__block_invoke;
  block[3] = &unk_51448;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)stopIOAccessoryManagerEventMonitoring
{
  v3 = [(accessorydMatchingPlugin *)self ioAccessoryEventQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __65__accessorydMatchingPlugin_stopIOAccessoryManagerEventMonitoring__block_invoke;
  block[3] = &unk_51448;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)startUSBRestrictedModeTimeoutMonitoring
{
  v3 = [(accessorydMatchingPlugin *)self ioAccessoryEventQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __67__accessorydMatchingPlugin_startUSBRestrictedModeTimeoutMonitoring__block_invoke;
  block[3] = &unk_51448;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)stopUSBRestrictedModeTimeoutMonitoring
{
  v3 = [(accessorydMatchingPlugin *)self ioAccessoryEventQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __66__accessorydMatchingPlugin_stopUSBRestrictedModeTimeoutMonitoring__block_invoke;
  block[3] = &unk_51448;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)startTRMMonitoring
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 4;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    v5 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Starting TRM monitoring...", v17, 2u);
  }

  [(accessorydMatchingPlugin *)self setIoNotifyPortTRM:IONotificationPortCreate(kIOMainPortDefault)];
  BOOL v6 = [(accessorydMatchingPlugin *)self ioNotifyPortTRM];
  id v7 = [(accessorydMatchingPlugin *)self ioAccessoryEventQueue];
  IONotificationPortSetDispatchQueue(v6, v7);

  CFMutableDictionaryRef v8 = IOServiceMatching("IOAccessoryTRM");
  v9 = [(accessorydMatchingPlugin *)self ioNotifyPortTRM];
  CFDictionaryRef v10 = (const __CFDictionary *)CFRetain(v8);
  IOServiceAddMatchingNotification(v9, "IOServiceFirstMatch", v10, (IOServiceMatchingCallback)serviceAddedTRM, self, &self->_ioAddedIteratorTRM);
  serviceAddedTRM(self, [(accessorydMatchingPlugin *)self ioAddedIteratorTRM]);
  id v11 = [(accessorydMatchingPlugin *)self ioNotifyPortTRM];
  CFDictionaryRef v12 = (const __CFDictionary *)CFRetain(v8);
  IOServiceAddMatchingNotification(v11, "IOServiceTerminate", v12, (IOServiceMatchingCallback)serviceRemovedTRM, self, &self->_ioRemovedIteratorTRM);
  [(accessorydMatchingPlugin *)self ioRemovedIteratorTRM];
  serviceRemovedTRM(self);
  if (v8) {
    CFRelease(v8);
  }
  CFMutableDictionaryRef v13 = IOServiceMatching("IOPort");
  [(__CFDictionary *)v13 setObject:&off_5A7E0 forKey:@"IOPropertyMatch"];
  uint64_t v14 = +[NSMutableDictionary dictionary];
  v15 = (void *)_portsPendingUserAuthorization;
  _portsPendingUserAuthorization = v14;

  id v16 = [[TRMPortManager alloc] initWithMatchingDictionary:v13 andDelegate:self];
  [(accessorydMatchingPlugin *)self setPortManager:v16];
}

- (void)stopTRMMonitoring
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 4;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    v5 = &_os_log_default;
    id v4 = &_os_log_default;
  }
  else
  {
    v5 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Stopping TRM monitoring...", v6, 2u);
  }

  if ([(accessorydMatchingPlugin *)self ioNotifyPortTRM])
  {
    IONotificationPortDestroy([(accessorydMatchingPlugin *)self ioNotifyPortTRM]);
    [(accessorydMatchingPlugin *)self setIoNotifyPortTRM:0];
  }
  IOObjectRelease([(accessorydMatchingPlugin *)self ioAddedIteratorTRM]);
  IOObjectRelease([(accessorydMatchingPlugin *)self ioRemovedIteratorTRM]);
}

- (BOOL)launchDigitalIDClients
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v3 = [(accessorydMatchingPlugin *)self digitalIDTokenSet];
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v5 = 134218240;
    long long v15 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "unsignedLongLongValue", v15))
        {
          uint64_t v9 = gLogObjects;
          int v10 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v11 = gNumLogObjects < 1;
          }
          else {
            BOOL v11 = 1;
          }
          if (v11)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = v15;
              uint64_t v22 = v9;
              __int16 v23 = 1024;
              int v24 = v10;
              _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v12 = &_os_log_default;
            CFMutableDictionaryRef v13 = &_os_log_default;
          }
          else
          {
            CFMutableDictionaryRef v13 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "launchDigitalIDClients launching accessoryd", buf, 2u);
          }

          [(accessorydMatchingPlugin *)self digitalIDEventProvider];
          xpc_event_provider_token_fire();
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return 0;
}

- (void)startListeningForIOAccessoryPortClass
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_0, v0, v1, "ret = 0x%X for kIOAccessoryPortClass kIOPublishNotification", v2, v3, v4, v5, v6);
}

- (void)stopListeningForIOAccessoryPortClass
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.carplay.allowed-changed", 0);
  if ([(accessorydMatchingPlugin *)self ioAccessoryPortClassNotify])
  {
    IONotificationPortDestroy([(accessorydMatchingPlugin *)self ioAccessoryPortClassNotify]);
    [(accessorydMatchingPlugin *)self setIoAccessoryPortClassNotify:0];
  }
  if ([(accessorydMatchingPlugin *)self ioAccessoryPortClassIteratorArrived])
  {
    IOObjectRelease([(accessorydMatchingPlugin *)self ioAccessoryPortClassIteratorArrived]);
    [(accessorydMatchingPlugin *)self setIoAccessoryPortClassIteratorArrived:0];
  }
  if ([(accessorydMatchingPlugin *)self ioAccessoryPortClassIteratorTerminated])
  {
    IOObjectRelease([(accessorydMatchingPlugin *)self ioAccessoryPortClassIteratorTerminated]);
    [(accessorydMatchingPlugin *)self setIoAccessoryPortClassIteratorTerminated:0];
  }
}

- (void)addBTServiceClient:(unint64_t)a3
{
  id v7 = +[NSNumber numberWithUnsignedLongLong:a3];
  if (v7)
  {
    uint64_t v4 = [(accessorydMatchingPlugin *)self btServiceTokenSet];
    [v4 addObject:v7];

    uint64_t v5 = [(accessorydMatchingPlugin *)self btServiceTokenSet];
    uint8_t v6 = (char *)[v5 count];

    if (v6 == (unsigned char *)&dword_0 + 1) {
      [(accessorydMatchingPlugin *)self startBluetoothMatching];
    }
  }
}

- (void)removeBTServiceClient:(unint64_t)a3
{
  uint64_t v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [(accessorydMatchingPlugin *)self btServiceTokenSet];
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v10 isEqualToNumber:v4])
          {
            BOOL v11 = [(accessorydMatchingPlugin *)self btServiceTokenSet];
            [v11 removeObject:v10];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    id v12 = [(accessorydMatchingPlugin *)self btServiceTokenSet];
    id v13 = [v12 count];

    if (!v13) {
      [(accessorydMatchingPlugin *)self stopBluetoothMatching];
    }
  }
}

- (void)startBluetoothMatching
{
  uint64_t v3 = [(accessorydMatchingPlugin *)self btEventQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __50__accessorydMatchingPlugin_startBluetoothMatching__block_invoke;
  block[3] = &unk_51448;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)stopBluetoothMatching
{
  uint64_t v3 = [(accessorydMatchingPlugin *)self btEventQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49__accessorydMatchingPlugin_stopBluetoothMatching__block_invoke;
  block[3] = &unk_51448;
  block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)attachToBTServer
{
  signal(30, (void (__cdecl *)(int))drop_signal);
  id v3 = +[NSString stringWithFormat:@"com.apple.accessoryd.btServiceMatching-%d", getpid(), BTSessionCallback];
  [v3 cStringUsingEncoding:4];
  uint64_t v4 = [(accessorydMatchingPlugin *)self btEventQueue];
  int v5 = BTSessionAttachWithQueue();

  if (v5)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v6 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      id v6 = &_os_log_default;
      id v7 = &_os_log_default;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(accessorydMatchingPlugin *)v6 attachToBTServer];
    }
  }
  return v5 == 0;
}

- (BOOL)detachFromBTServer
{
  if (![(accessorydMatchingPlugin *)self btSession]) {
    return 1;
  }
  [(accessorydMatchingPlugin *)self btSession];
  int v3 = BTSessionDetachWithQueue();
  [(accessorydMatchingPlugin *)self setBtSession:0];
  if (!v3) {
    return 1;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    uint64_t v4 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    uint64_t v4 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[accessorydMatchingPlugin detachFromBTServer]();
  }

  return 0;
}

- (void)findKnownBTDevices
{
}

- (void)launchWirelessCarPlay:(BTDeviceImpl *)a3
{
  memset(__s, 170, 18);
  if (!BTDeviceGetAddressString())
  {
    id v3 = [objc_alloc((Class)NSString) initWithBytes:__s length:strlen(__s) encoding:4];
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 2;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      id v6 = &_os_log_default;
      id v5 = &_os_log_default;
    }
    else
    {
      id v6 = *(id *)(gLogObjects + 8);
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Launching CarPlay with formattedBluetoothAddress: %@", (uint8_t *)&v7, 0xCu);
    }

    CRHandleConnectionForBluetoothAddress();
  }
}

- (void)setRoleSwapMaskForUSBPort
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_0, v0, v1, "ERROR, could not find IOAccessoryPort service for kIOAccessoryPortIDUSB\n", v2, v3, v4, v5, v6);
}

- (void)setRoleSwapMaskDueToCarPlayStateChange
{
}

- (void)handleUSBPortAdded
{
  [(accessorydMatchingPlugin *)self setRearLightningUSBPortExists:1];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)CarPlayStateChanged, @"com.apple.carplay.allowed-changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CRIsCarPlayAllowed();
}

- (void)handleUSBPortTerminated
{
}

- (void)printRMEventArray
{
  uint64_t v2 = ueaPluginSystemSettingsMonitor;
  uint64_t v3 = ueaPluginSystemSettingsMonitor;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    uint8_t v6 = &_os_log_default;
    id v5 = &_os_log_default;
  }
  else
  {
    uint8_t v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(accessorydMatchingPlugin *)self rmEventArray];
    *(_DWORD *)long long buf = 134217984;
    dispatch_queue_t v62 = (id *)[v7 count];
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "printRMEventArray rmEventArray has count of: %lu", buf, 0xCu);
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = [(accessorydMatchingPlugin *)self rmEventArray];
  id v55 = [obj countByEnumeratingWithState:&v57 objects:v75 count:16];
  if (v55)
  {
    uint64_t v8 = *(void *)v58;
    uint64_t v47 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v55; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v58 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v56 = v10;
          id v11 = v10;
          p_isa = (id *)&v2[62].isa->isa;
          int superclass = (int)v3[62].superclass;
          if (p_isa && superclass >= 1)
          {
            uint64_t v14 = *p_isa;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 134218240;
              dispatch_queue_t v62 = p_isa;
              __int16 v63 = 1024;
              unsigned int v64 = superclass;
              _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v19 = &_os_log_default;
            uint64_t v14 = &_os_log_default;
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            dispatch_queue_t v20 = [(accessorydMatchingPlugin *)self rmEventArray];
            v21 = (id *)[v20 indexOfObject:v11];
            *(_DWORD *)long long buf = 134217984;
            dispatch_queue_t v62 = v21;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "AttachEvent object at index: %lu", buf, 0xCu);
          }
          uint64_t v22 = (id *)&v2[62].isa->isa;
          int v23 = (int)v3[62].superclass;
          if (v22 && v23 >= 1)
          {
            int v24 = *v22;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 134218240;
              dispatch_queue_t v62 = v22;
              __int16 v63 = 1024;
              unsigned int v64 = v23;
              _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v25 = &_os_log_default;
            int v24 = &_os_log_default;
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            id v52 = [v11 timestamp];
            v50 = (id *)[v52 unsignedLongLongValue];
            v51 = [v11 connectType];
            unsigned int v49 = [v51 intValue];
            v26 = [v11 primaryPort];
            unsigned int v27 = [v26 intValue];
            unsigned int v28 = [v11 restrictedModeEnabled];
            unsigned int v29 = [v11 rmDialogShown];
            unsigned int v30 = [v11 accSupoortsUSB];
            unsigned int v31 = [v11 accSupoortsUART];
            unsigned int v32 = [v11 accSupoortsMikeyBus];
            v33 = [v11 accDigitalID];
            *(_DWORD *)long long buf = 134220034;
            dispatch_queue_t v62 = v50;
            __int16 v63 = 1024;
            unsigned int v64 = v49;
            __int16 v65 = 1024;
            unsigned int v66 = v27;
            __int16 v67 = 1024;
            *(_DWORD *)id v68 = v28;
            *(_WORD *)&v68[4] = 1024;
            *(_DWORD *)&v68[6] = v29;
            LOWORD(v69) = 1024;
            *(_DWORD *)((char *)&v69 + 2) = v30;
            uint64_t v2 = ueaPluginSystemSettingsMonitor;
            HIWORD(v69) = 1024;
            unsigned int v70 = v31;
            uint64_t v3 = ueaPluginSystemSettingsMonitor;
            __int16 v71 = 1024;
            unsigned int v72 = v32;
            uint64_t v8 = v47;
            __int16 v73 = 2112;
            v74 = v33;
            _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "timestamp: %llu\nconnectType: %d\nprimaryPort: %d\nrestrictedModeEnabled: %d\nrmDialogShown: %d\naccSupoortsUSB: %d\naccSupoortsUART: %d\naccSupoortsMikeyBus: %d\naccDigitalID: %@", buf, 0x40u);
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          v56 = v10;
          id v15 = v10;
          long long v16 = (id *)&v2[62].isa->isa;
          int v17 = (int)v3[62].superclass;
          if (v16 && v17 >= 1)
          {
            long long v18 = *v16;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 134218240;
              dispatch_queue_t v62 = v16;
              __int16 v63 = 1024;
              unsigned int v64 = v17;
              _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v34 = &_os_log_default;
            long long v18 = &_os_log_default;
          }
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v35 = [(accessorydMatchingPlugin *)self rmEventArray];
            v36 = (id *)[v35 indexOfObject:v15];
            *(_DWORD *)long long buf = 134217984;
            dispatch_queue_t v62 = v36;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "DetachEvent object at index: %lu", buf, 0xCu);
          }
          v37 = (id *)&v2[62].isa->isa;
          int v38 = (int)v3[62].superclass;
          if (v37 && v38 >= 1)
          {
            int v24 = *v37;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 134218240;
              dispatch_queue_t v62 = v37;
              __int16 v63 = 1024;
              unsigned int v64 = v38;
              _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            id v39 = &_os_log_default;
            int v24 = &_os_log_default;
          }
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v53 = [v15 timestamp];
            uint64_t v40 = (id *)[v53 unsignedLongLongValue];
            v41 = [v15 primaryPort];
            unsigned int v42 = [v41 intValue];
            unsigned int v43 = [v15 restrictedModeEnabled];
            v44 = [v15 duration];
            id v45 = [v44 unsignedLongLongValue];
            id v46 = [v15 accDigitalID];
            *(_DWORD *)long long buf = 134219010;
            dispatch_queue_t v62 = v40;
            __int16 v63 = 1024;
            unsigned int v64 = v42;
            __int16 v65 = 1024;
            unsigned int v66 = v43;
            uint64_t v2 = ueaPluginSystemSettingsMonitor;
            __int16 v67 = 2048;
            *(void *)id v68 = v45;
            uint64_t v8 = v47;
            *(_WORD *)&v68[8] = 2112;
            v69 = v46;
            _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "timestamp: %llu\nprimaryPort: %d\nrestictedModeEnabled: %d\nduration: %llu\naccDigitalID: %@", buf, 0x2Cu);

            uint64_t v3 = ueaPluginSystemSettingsMonitor;
          }
        }
      }
      id v55 = [obj countByEnumeratingWithState:&v57 objects:v75 count:16];
    }
    while (v55);
  }
}

- (void)processAnalyticsEventListUsingTime:(id)a3 scanReason:(BOOL)a4 primaryPort:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = +[NSMutableArray array];
  [(accessorydMatchingPlugin *)self removeStandardModeEvents];
  if (v9)
  {
    id v11 = 0;
    if (a4)
    {
LABEL_3:
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v12 = v11;
      id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v19;
        do
        {
          long long v16 = 0;
          do
          {
            if (*(void *)v19 != v15) {
              objc_enumerationMutation(v12);
            }
            if (-[accessorydMatchingPlugin findUniqueEventsOnPrimaryPort:scanReason:resultsArray:](self, "findUniqueEventsOnPrimaryPort:scanReason:resultsArray:", *(void *)(*((void *)&v18 + 1) + 8 * (void)v16), 1, v10, (void)v18))
            {
              [(accessorydMatchingPlugin *)self postUniqueAnalyticEventToFigaro:v10 scanReason:1 scanTime:v8];
            }
            long long v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v14);
      }

      int v17 = [(accessorydMatchingPlugin *)self rmEventArray];
      [v17 removeAllObjects];

      goto LABEL_16;
    }
  }
  else
  {
    id v11 = [(accessorydMatchingPlugin *)self scanEventsListForPrimaryPortsSeen];
    if (a4) {
      goto LABEL_3;
    }
  }
  if ([(accessorydMatchingPlugin *)self findUniqueEventsOnPrimaryPort:v9 scanReason:0 resultsArray:v10])
  {
    [(accessorydMatchingPlugin *)self postUniqueAnalyticEventToFigaro:v10 scanReason:0 scanTime:v8];
  }
LABEL_16:
  [(accessorydMatchingPlugin *)self printRMEventArray];
}

- (void)removeStandardModeEvents
{
  unsigned int v31 = +[NSMutableArray array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v3 = [(accessorydMatchingPlugin *)self rmEventArray];
  id v4 = [v3 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v37;
    *(void *)&long long v5 = 134218240;
    long long v30 = v5;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          if (([v10 restrictedModeEnabled] & 1) == 0)
          {
            [v31 addObject:v10];
            uint64_t v11 = gLogObjects;
            int v12 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 1)
            {
              id v13 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = v30;
                uint64_t v43 = v11;
                __int16 v44 = 1024;
                int v45 = v12;
                _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              id v17 = &_os_log_default;
              id v13 = &_os_log_default;
            }
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              long long v18 = v13;
              long long v19 = "AttachEvent occurred in Standard Mode, skipping...";
              goto LABEL_26;
            }
            goto LABEL_27;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_29;
          }
          id v14 = v9;
          if (([v14 restrictedModeEnabled] & 1) == 0)
          {
            [v31 addObject:v14];
            uint64_t v15 = gLogObjects;
            int v16 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 1)
            {
              id v13 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = v30;
                uint64_t v43 = v15;
                __int16 v44 = 1024;
                int v45 = v16;
                _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              id v20 = &_os_log_default;
              id v13 = &_os_log_default;
            }
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              long long v18 = v13;
              long long v19 = "DetachEvent occurred in Standard Mode, skipping...";
LABEL_26:
              _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 2u);
            }
LABEL_27:
          }
        }

LABEL_29:
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v6);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    long long v21 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    long long v21 = &_os_log_default;
    id v22 = &_os_log_default;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v43 = (uint64_t)v31;
    _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "eventsToRemove: %@", buf, 0xCu);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v23 = v31;
  id v24 = [v23 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v25; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        unsigned int v29 = [(accessorydMatchingPlugin *)self rmEventArray];
        [v29 removeObject:v28];
      }
      id v25 = [v23 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v25);
  }
}

- (id)scanEventsListForPrimaryPortsSeen
{
  uint64_t v3 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(accessorydMatchingPlugin *)self rmEventArray];
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }
        id v10 = [v9 primaryPort];
        unsigned __int8 v11 = [v3 containsObject:v10];

        if ((v11 & 1) == 0)
        {
          int v12 = [v9 primaryPort];
          [v3 addObject:v12];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }

  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 1;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    uint64_t v15 = &_os_log_default;
    id v14 = &_os_log_default;
  }
  else
  {
    uint64_t v15 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v22 = v3;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "primaryPortsSeen: %@", buf, 0xCu);
  }

  return v3;
}

- (BOOL)areAttachEventsInList:(id)a3
{
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        v6 |= objc_opt_isKindOfClass();
      }
      id v5 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6 & 1;
}

- (BOOL)findUniqueEventsOnPrimaryPort:(id)a3 scanReason:(BOOL)a4 resultsArray:(id)a5
{
  int v6 = a4;
  id v74 = a3;
  id v67 = a5;
  [v67 removeAllObjects];
  [(accessorydMatchingPlugin *)self printRMEventArray];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = [(accessorydMatchingPlugin *)self rmEventArray];
  id v8 = [obj countByEnumeratingWithState:&v75 objects:v83 count:16];
  if (!v8)
  {
    long long v12 = 0;
    __int16 v73 = 0;
    long long v10 = 0;
    long long v38 = 0;
    goto LABEL_59;
  }
  id v9 = v8;
  int v66 = v6;
  id v68 = 0;
  long long v10 = 0;
  long long v11 = 0;
  long long v12 = 0;
  uint64_t v13 = *(void *)v76;
  do
  {
    id v14 = 0;
    do
    {
      if (*(void *)v76 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v75 + 1) + 8 * (void)v14);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;

        long long v17 = [v16 primaryPort];
        unsigned int v18 = [v17 isEqualToNumber:v74];

        if (v18) {
          [v67 addObject:v16];
        }
        long long v12 = v16;
        goto LABEL_33;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_33;
      }
      __int16 v71 = v12;
      id v19 = v15;
      long long v20 = [v19 primaryPort];
      unsigned int v21 = [v20 isEqualToNumber:v74];

      if (!v21)
      {

        goto LABEL_32;
      }
      __int16 v73 = [v19 primaryPort];

      id v22 = [(accessorydMatchingPlugin *)self rmEventArray];
      id v23 = (char *)[v22 indexOfObject:v19];

      unsigned int v70 = [v19 timestamp];

      [v67 addObject:v19];
      id v24 = v23 + 1;
      id v25 = [(accessorydMatchingPlugin *)self rmEventArray];
      uint64_t v26 = (char *)[v25 count];

      if (v24 == v26)
      {
        unint64_t CurrentUnixTimeMS = systemInfo_getCurrentUnixTimeMS();
        uint64_t v28 = gLogObjects;
        int v29 = gNumLogObjects;
        if (gLogObjects && gNumLogObjects >= 1)
        {
          long long v30 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 134218240;
            *(void *)v80 = v28;
            *(_WORD *)&v80[8] = 1024;
            *(_DWORD *)&v80[10] = v29;
            _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          id v39 = &_os_log_default;
          long long v30 = &_os_log_default;
        }
        long long v10 = v70;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          id v40 = [v70 unsignedLongLongValue];
          id v41 = [v70 unsignedLongLongValue];
          *(_DWORD *)long long buf = 134218496;
          *(void *)v80 = CurrentUnixTimeMS;
          *(_WORD *)&v80[8] = 2048;
          *(void *)&v80[10] = v40;
          __int16 v81 = 2048;
          unint64_t v82 = CurrentUnixTimeMS - (void)v41;
          _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "now: %llu, currentDetachEventTimestamp: %llu, delta: %llu", buf, 0x20u);
        }

        unint64_t v42 = CurrentUnixTimeMS - (void)[v70 unsignedLongLongValue];
        if (v42 <= 0xEA60) {
          goto LABEL_31;
        }
        int v6 = 1;
        long long v38 = v68;
        goto LABEL_58;
      }
      while (1)
      {
        unsigned int v31 = [(accessorydMatchingPlugin *)self rmEventArray];
        long long v32 = (char *)[v31 count];

        if (v24 >= v32)
        {

          long long v10 = v70;
          goto LABEL_31;
        }
        long long v33 = [(accessorydMatchingPlugin *)self rmEventArray];
        long long v34 = [v33 objectAtIndex:v24];

        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
LABEL_22:

        ++v24;
      }
      id v35 = v34;
      long long v36 = [v35 primaryPort];
      unsigned int v37 = [v73 isEqualToNumber:v36];

      if (!v37) {
        goto LABEL_21;
      }
      long long v38 = [v35 timestamp];

      if (!v70)
      {
        id v68 = v38;
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v43 = gLogObjects;
      int v44 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        int v45 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 134218240;
          *(void *)v80 = v43;
          *(_WORD *)&v80[8] = 1024;
          *(_DWORD *)&v80[10] = v44;
          _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        id v46 = &_os_log_default;
        int v45 = &_os_log_default;
      }
      uint64_t v47 = v70;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        id v69 = [v70 unsignedLongLongValue];
        id v48 = [v38 unsignedLongLongValue];
        unsigned int v49 = [v38 unsignedLongLongValue];
        v50 = [v70 unsignedLongLongValue];
        *(_DWORD *)long long buf = 134218496;
        int64_t v51 = v49 - v50;
        uint64_t v47 = v70;
        *(void *)v80 = v69;
        *(_WORD *)&v80[8] = 2048;
        *(void *)&v80[10] = v48;
        __int16 v81 = 2048;
        unint64_t v82 = v51;
        _os_log_impl(&dword_0, v45, OS_LOG_TYPE_DEFAULT, "currentDetachEventTimestamp: %llu, currentAttachEventTimestamp: %llu, delta: %llu", buf, 0x20u);
      }

      id v52 = [v38 unsignedLongLongValue];
      if ((unint64_t)(v52 - (unsigned char *)[v47 unsignedLongLongValue]) > 0xEA60
        || ([v71 accDigitalID],
            v53 = objc_claimAutoreleasedReturnValue(),
            [v35 accDigitalID],
            v54 = objc_claimAutoreleasedReturnValue(),
            unsigned int v55 = [v53 isEqualToData:v54],
            v54,
            v53,
            !v55))
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          unsigned int v64 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[AirplaneMode init]();
          }
          unsigned int v64 = &_os_log_default;
          id v65 = &_os_log_default;
        }
        long long v10 = v70;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_0, v64, OS_LOG_TYPE_DEFAULT, "Unique event detected", buf, 2u);
        }

        int v6 = 1;
LABEL_58:
        long long v12 = v71;
        goto LABEL_59;
      }
      uint64_t v56 = gLogObjects;
      int v57 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 1)
      {
        long long v58 = *(id *)gLogObjects;
      }
      else
      {
        long long v58 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 134218240;
          *(void *)v80 = v56;
          *(_WORD *)&v80[8] = 1024;
          *(_DWORD *)&v80[10] = v57;
          _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        id v59 = &_os_log_default;
      }
      long long v10 = v70;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v58, OS_LOG_TYPE_DEFAULT, "Flurry detected", buf, 2u);
      }

      id v68 = v38;
LABEL_31:
      long long v11 = v73;
LABEL_32:
      long long v12 = v71;
LABEL_33:
      id v14 = (char *)v14 + 1;
    }
    while (v14 != v9);
    id v60 = [obj countByEnumeratingWithState:&v75 objects:v83 count:16];
    id v9 = v60;
  }
  while (v60);
  __int16 v73 = v11;
  long long v38 = v68;
  int v6 = v66;
LABEL_59:

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v61 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    v61 = &_os_log_default;
    id v62 = &_os_log_default;
  }
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109378;
    *(_DWORD *)v80 = v6;
    *(_WORD *)&v80[4] = 2112;
    *(void *)&v80[6] = v67;
    _os_log_impl(&dword_0, v61, OS_LOG_TYPE_DEFAULT, "uniqueEventDetected: %d, uniqueEvent: %@", buf, 0x12u);
  }

  return v6;
}

- (id)bucketizeRMDurations:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 unsignedLongLongValue];
  unint64_t v4 = v3;
  unint64_t v5 = v3 >> 3;
  if (v3 >= 0x3E8)
  {
    if (v3 >= 0xBB8)
    {
      if (v3 >> 4 >= 0x177)
      {
        if (v5 >= 0x55F)
        {
          if (v5 >= 0xF23)
          {
            if (v3 >= 0xEE48)
            {
              if (v3 >= 0x92BA8)
              {
                if (v3 >= 0x1B7B28)
                {
                  if (v3 < 0x36F268) {
                    unsigned __int8 v6 = 9;
                  }
                  else {
                    unsigned __int8 v6 = 10;
                  }
                }
                else
                {
                  unsigned __int8 v6 = 8;
                }
              }
              else
              {
                unsigned __int8 v6 = 7;
              }
            }
            else
            {
              unsigned __int8 v6 = 6;
            }
          }
          else
          {
            unsigned __int8 v6 = 5;
          }
        }
        else
        {
          unsigned __int8 v6 = 4;
        }
      }
      else
      {
        unsigned __int8 v6 = 3;
      }
    }
    else
    {
      unsigned __int8 v6 = 2;
    }
  }
  else
  {
    unsigned __int8 v6 = 1;
  }
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    id v9 = &_os_log_default;
    id v8 = &_os_log_default;
  }
  else
  {
    id v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v12 = 134218496;
    unint64_t v13 = v4;
    __int16 v14 = 2048;
    unint64_t v15 = (unint64_t)((v5 * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 4;
    __int16 v16 = 1024;
    int v17 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "bucketizeRMDurations rawTimeInMS: %llu, rawTimeInS: %llu bucketValue: %d", (uint8_t *)&v12, 0x1Cu);
  }

  long long v10 = +[NSNumber numberWithUnsignedChar:v6];

  return v10;
}

- (void)postUniqueAnalyticEventToFigaro:(id)a3 scanReason:(BOOL)a4 scanTime:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([(accessorydMatchingPlugin *)self areAttachEventsInList:v7])
  {
    id v9 = [v7 firstObject];
    objc_opt_class();
    long long v10 = &AnalyticsSendEvent_ptr;
    long long v77 = v9;
    if (objc_opt_isKindOfClass())
    {
      id v11 = v9;
      CFDataRef v81 = [v11 accDigitalID];
      unsigned int v70 = [v11 accSupoortsMikeyBus];
      unsigned int v74 = [v11 accSupoortsUART];
      unsigned int v72 = [v11 accSupoortsUSB];
      unsigned int cf = [v11 rmDialogShown];
      v87 = [v11 primaryPort];
      v86 = [v11 connectType];
      int v12 = [v11 currentLimit];
      v88 = [v11 chargeVoltage];
      unint64_t v13 = [v8 unsignedLongLongValue];
      __int16 v14 = [v11 timestamp];
      uint64_t v15 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v13 - (unsigned char *)[v14 unsignedLongLongValue]);

      unint64_t v82 = (void *)v15;
      if (v12)
      {
        __int16 v16 = +[NSNumber numberWithInt:0];
        int v17 = v12;
        unsigned __int8 v18 = [v12 isEqualToNumber:v16];
        unsigned int v19 = 0;
        if ((v18 & 1) == 0 && v88)
        {
          long long v20 = +[NSNumber numberWithInt:0];
          unsigned int v19 = [v88 isEqualToNumber:v20] ^ 1;
        }
        unsigned int v84 = v19;

        unsigned int v21 = @"unlock";
        id v22 = v17;
      }
      else
      {
        unsigned int v84 = 0;
        id v22 = 0;
        unsigned int v21 = @"unlock";
      }
    }
    else
    {
      unsigned int v21 = 0;
      CFDataRef v81 = 0;
      unint64_t v82 = 0;
      unsigned int v70 = 0;
      unsigned int v74 = 0;
      unsigned int v72 = 0;
      unsigned int v84 = 0;
      unsigned int cf = 0;
      id v11 = 0;
      v87 = 0;
      v88 = 0;
      id v22 = 0;
      v86 = 0;
    }
    id v25 = [v7 lastObject];
    objc_opt_class();
    id v78 = v7;
    v83 = v11;
    long long v76 = v25;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v26 = v22;
      id v27 = v25;
      if (v11)
      {
        id v28 = [v7 indexOfObject:v11];
        if (v28 == [v7 indexOfObject:v27])
        {
          id v22 = v26;
          int v29 = v88;
          long long v10 = &AnalyticsSendEvent_ptr;
        }
        else
        {
          id v22 = [v27 currentLimit];

          int v29 = [v27 chargeVoltage];

          uint64_t v89 = [v27 connectType];

          if (cf) {
            unsigned int cf = 1;
          }
          else {
            unsigned int cf = [v27 rmDialogShown];
          }
          long long v10 = &AnalyticsSendEvent_ptr;
          id v40 = v8;
          if (v22)
          {
            id v41 = +[NSNumber numberWithInt:0];
            unsigned int v42 = 0;
            if (([v22 isEqualToNumber:v41] & 1) == 0 && v29)
            {
              uint64_t v43 = +[NSNumber numberWithInt:0];
              unsigned int v42 = [v29 isEqualToNumber:v43] ^ 1;
            }
            id v7 = v78;
          }
          else
          {
            unsigned int v42 = 0;
          }
          v84 |= v42;
          v86 = (void *)v89;
          id v8 = v40;
        }
      }
      else
      {
        unsigned int v37 = [v8 unsignedLongLongValue];
        long long v38 = [v27 timestamp];
        uint64_t v39 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v37 - (unsigned char *)[v38 unsignedLongLongValue]);

        long long v10 = &AnalyticsSendEvent_ptr;
        int v29 = v88;
        unint64_t v82 = (void *)v39;
        id v7 = v78;
      }

      uint64_t v36 = cf != 0;
      v88 = v29;
      uint64_t v35 = v70;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && v11)
      {
        [v25 timestamp];
        v31 = long long v30 = v22;
        long long v32 = [v31 unsignedLongLongValue];
        long long v33 = [v11 timestamp];
        uint64_t v34 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v32 - (unsigned char *)[v33 unsignedLongLongValue]);

        id v22 = v30;
        long long v10 = &AnalyticsSendEvent_ptr;
        unsigned int v21 = @"detach";
        unint64_t v82 = (void *)v34;
      }
      uint64_t v35 = v70;
      uint64_t v36 = cf;
    }
    BOOL v44 = (unint64_t)[v7 count] > 2;
    int v45 = CFStringCreateFromCFData(v81, @"%02X");
    v95[0] = @"bucketedEventDuration";
    __int16 v71 = [(accessorydMatchingPlugin *)self bucketizeRMDurations:v82];
    v96[0] = v71;
    v95[1] = @"flurryOccurred";
    uint64_t v46 = [v10[278] numberWithBool:v44];
    uint64_t v47 = @"unknown";
    if (v21) {
      uint64_t v47 = v21;
    }
    id v69 = (void *)v46;
    v96[1] = v46;
    v96[2] = v47;
    v95[2] = @"eventEnd";
    v95[3] = @"lightningDigitalID";
    cfa = v45;
    if (v45) {
      CFTypeRef v48 = CFRetain(v45);
    }
    else {
      CFTypeRef v48 = 0;
    }
    id v68 = (void *)v48;
    v96[3] = v48;
    v95[4] = @"supportsUSB";
    __int16 v73 = [v10[278] numberWithBool:v72];
    v96[4] = v73;
    v95[5] = @"supportsUART";
    long long v75 = [v10[278] numberWithBool:v74];
    v96[5] = v75;
    v95[6] = @"supportsMikeyBus";
    id v67 = [v10[278] numberWithBool:v35];
    v96[6] = v67;
    v95[7] = @"supportsAIDBulkPipes";
    int v66 = [v10[278] numberWithBool:0];
    v96[7] = v66;
    v95[8] = @"unlockDialogSeen";
    id v65 = [v10[278] numberWithBool:v36];
    v96[8] = v65;
    v95[9] = @"chargingCapable";
    unsigned int v49 = [v10[278] numberWithBool:v84];
    v96[9] = v49;
    v95[10] = @"lightningPrimaryPortNumber";
    v50 = v87;
    if (!v87)
    {
      v50 = [v10[278] numberWithInt:0];
    }
    v96[10] = v50;
    v95[11] = @"chargingVoltage";
    int64_t v51 = v88;
    if (!v88)
    {
      int64_t v51 = [v10[278] numberWithInt:0];
    }
    v96[11] = v51;
    v95[12] = @"chargingCurrent";
    id v52 = v22;
    v85 = v22;
    if (!v22)
    {
      id v52 = [v10[278] numberWithInt:0];
    }
    v96[12] = v52;
    v95[13] = @"lightningCableType";
    v53 = v86;
    if (!v86)
    {
      v53 = [v10[278] numberWithInt:0];
    }
    v96[13] = v53;
    v96[14] = @"1.1";
    v95[14] = @"eventVersion";
    v95[15] = @"restrictedModeTimeout";
    v54 = objc_msgSend(v10[278], "numberWithInt:", -[accessorydMatchingPlugin usbRestrictedModeTimeout](self, "usbRestrictedModeTimeout"));
    v96[15] = v54;
    unsigned int v55 = +[NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:16];
    uint64_t v56 = +[NSMutableDictionary dictionaryWithDictionary:v55];

    if (!v86) {
    CFDataRef v23 = v81;
    }
    id v7 = v78;
    if (!v85) {

    }
    if (!v88) {
    if (!v87)
    }

    int v57 = +[ACCAnalytics loggerForUser:0];
    [v57 logACCAnalyticsForEventNamed:@"accessoryConnectedDuringRM" withAttributes:v56];

    if (cfa) {
      CFRelease(cfa);
    }

    id v24 = v82;
  }
  else
  {
    CFDataRef v23 = 0;
    v83 = 0;
    v85 = 0;
    v87 = 0;
    v88 = 0;
    v86 = 0;
    id v24 = 0;
  }
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v58 = v7;
  id v59 = [v58 countByEnumeratingWithState:&v90 objects:v94 count:16];
  if (v59)
  {
    id v60 = v59;
    uint64_t v61 = *(void *)v91;
    do
    {
      for (uint64_t i = 0; i != v60; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v91 != v61) {
          objc_enumerationMutation(v58);
        }
        uint64_t v63 = *(void *)(*((void *)&v90 + 1) + 8 * i);
        unsigned int v64 = [(accessorydMatchingPlugin *)self rmEventArray];
        [v64 removeObject:v63];
      }
      id v60 = [v58 countByEnumeratingWithState:&v90 objects:v94 count:16];
    }
    while (v60);
  }
}

- (void)updateRMDialogShownForPrimaryPort:(id)a3
{
  id v11 = a3;
  unint64_t v4 = [(accessorydMatchingPlugin *)self rmEventArray];
  unint64_t v5 = (char *)[v4 count];

  if ((uint64_t)(v5 - 1) >= 0)
  {
    do
    {
      --v5;
      unsigned __int8 v6 = [(accessorydMatchingPlugin *)self rmEventArray];
      id v7 = [v6 objectAtIndex:v5];

      if (v7)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = v7;
          id v9 = [v8 primaryPort];
          unsigned int v10 = [v9 isEqualToNumber:v11];

          if (v10)
          {
            [v8 setRmDialogShown:1];

            break;
          }
        }
      }
    }
    while ((uint64_t)v5 > 0);
  }
}

- (void)updateUSBConectType:(id)a3 ForPrimaryPort:(id)a4 WithDigitalID:(id)a5
{
  id v21 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = [(accessorydMatchingPlugin *)self rmEventArray];
  id v11 = (char *)[v10 count];

  if ((uint64_t)(v11 - 1) < 0) {
    goto LABEL_15;
  }
  while (1)
  {
    --v11;
    int v12 = [(accessorydMatchingPlugin *)self rmEventArray];
    unint64_t v13 = [v12 objectAtIndex:v11];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v13;
      uint64_t v15 = [v18 primaryPort];
      if ([v15 isEqualToNumber:v8])
      {
        unsigned int v19 = [v18 accDigitalID];
        unsigned int v20 = [v19 isEqualToData:v9];

        if (v20) {
          goto LABEL_14;
        }
        goto LABEL_11;
      }
LABEL_10:

LABEL_11:
    }

    if ((uint64_t)v11 <= 0) {
      goto LABEL_15;
    }
  }
  id v14 = v13;
  uint64_t v15 = [v14 primaryPort];
  if (![v15 isEqualToNumber:v8]) {
    goto LABEL_10;
  }
  __int16 v16 = [v14 accDigitalID];
  unsigned int v17 = [v16 isEqualToData:v9];

  if (!v17) {
    goto LABEL_11;
  }
  [v14 setConnectType:v21];
LABEL_14:

LABEL_15:
}

- (void)updateUSBChargeCurrent:(id)a3 AndChargeVoltage:(id)a4 ForPrimaryPort:(id)a5 WithDigitalID:(id)a6
{
  id v29 = a3;
  id v28 = a4;
  id v10 = a5;
  id v30 = a6;
  id v11 = [(accessorydMatchingPlugin *)self rmEventArray];
  int v12 = (char *)[v11 count];

  if ((uint64_t)(v12 - 1) < 0) {
    goto LABEL_21;
  }
  while (1)
  {
    --v12;
    unint64_t v13 = [(accessorydMatchingPlugin *)self rmEventArray];
    id v14 = [v13 objectAtIndex:v12];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    id v15 = v14;
    __int16 v16 = [v15 primaryPort];
    if (([v16 isEqualToNumber:v10] & 1) == 0)
    {

      goto LABEL_7;
    }
    unsigned int v17 = [v15 accDigitalID];
    unsigned int v18 = [v17 isEqualToData:v30];

    if (v18) {
      break;
    }
LABEL_7:

LABEL_8:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = v14;
      unsigned int v20 = [v19 primaryPort];
      if ([v20 isEqualToNumber:v10])
      {
        id v21 = [v19 accDigitalID];
        unsigned int v22 = [v21 isEqualToData:v30];

        if (v22) {
          goto LABEL_20;
        }
      }
      else
      {
      }
    }

    if ((uint64_t)v12 <= 0) {
      goto LABEL_21;
    }
  }
  [v15 setCurrentLimit:v29];
  [v15 setChargeVoltage:v28];
  CFDataRef v23 = [v15 currentLimit];
  id v24 = +[NSNumber numberWithInt:0];
  if ([v23 isEqualToNumber:v24])
  {
  }
  else
  {
    id v25 = [v15 chargeVoltage];
    uint64_t v26 = +[NSNumber numberWithInt:0];
    unsigned __int8 v27 = [v25 isEqualToNumber:v26];

    if ((v27 & 1) == 0) {
      [v15 setAccSupoortsCharging:1];
    }
  }
LABEL_20:

LABEL_21:
}

- (BOOL)doAttachEventsForPrimaryPortExistInList:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(accessorydMatchingPlugin *)self rmEventArray];
  unsigned __int8 v6 = (char *)[v5 count];

  id v7 = v6 - 1;
  if ((uint64_t)(v6 - 1) < 0)
  {
LABEL_7:
    BOOL v14 = 0;
  }
  else
  {
    while (1)
    {
      id v8 = [(accessorydMatchingPlugin *)self rmEventArray];
      id v9 = [v8 objectAtIndex:v7];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [v9 primaryPort];
        unsigned __int8 v11 = [v10 isEqualToNumber:v4];

        if (v11)
        {
          BOOL v14 = 1;
          goto LABEL_10;
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v12 = [v9 primaryPort];
        unsigned int v13 = [v12 isEqualToNumber:v4];

        if (v13) {
          break;
        }
      }

      if ((uint64_t)--v7 < 0) {
        goto LABEL_7;
      }
    }
    BOOL v14 = 0;
LABEL_10:
  }
  return v14;
}

- (void)trmStatusDidChange
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 4;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    id v4 = &_os_log_default;
    id v3 = &_os_log_default;
  }
  else
  {
    id v4 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v6 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "TRM status changed!", v6, 2u);
  }

  if (_shouldPresentUnlockDialog())
  {
    if (_presentUnlockDialog_onceToken != -1) {
      dispatch_once(&_presentUnlockDialog_onceToken, &__block_literal_global_922);
    }
    unint64_t v5 = _uiQueue();
    dispatch_async(v5, &__block_literal_global_939);
  }
  else
  {
    _dismissUnlockDialog();
  }
}

- (void)startListeningForLDCMMitigationStatusChange
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_0, v0, v1, "CriticalUI disabled", v2, v3, v4, v5, v6);
}

- (void)stopListeningForLDCMMitigationStatusChange
{
  if ([(accessorydMatchingPlugin *)self ioNotifyPortLDCM])
  {
    IONotificationPortDestroy([(accessorydMatchingPlugin *)self ioNotifyPortLDCM]);
    [(accessorydMatchingPlugin *)self setIoNotifyPortLDCM:0];
  }
  if ([(accessorydMatchingPlugin *)self ioNotificationLDCM])
  {
    IOObjectRelease([(accessorydMatchingPlugin *)self ioNotificationLDCM]);
    [(accessorydMatchingPlugin *)self setIoNotificationLDCM:0];
  }
  if ([(accessorydMatchingPlugin *)self ioAddedIteratorLDCM])
  {
    IOObjectRelease([(accessorydMatchingPlugin *)self ioAddedIteratorLDCM]);
    [(accessorydMatchingPlugin *)self setIoAddedIteratorLDCM:0];
  }
}

- (void)portManager:(id)a3 didAddPort:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 4;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    id v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v15 = v7;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Port added: %@", buf, 0xCu);
  }

  if ([v7 authorizationRequired]
    && [v7 userAuthorizationPending])
  {
    unsigned __int8 v11 = _uiQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __51__accessorydMatchingPlugin_portManager_didAddPort___block_invoke;
    block[3] = &unk_51448;
    id v13 = v7;
    dispatch_sync(v11, block);

    [(accessorydMatchingPlugin *)self trmStatusDidChange];
  }
}

- (void)portManager:(id)a3 didRemovePort:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 4;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    id v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = v7;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Port removed: %@", buf, 0xCu);
  }

  unsigned __int8 v11 = _uiQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __54__accessorydMatchingPlugin_portManager_didRemovePort___block_invoke;
  block[3] = &unk_51448;
  id v14 = v7;
  id v12 = v7;
  dispatch_sync(v11, block);

  [(accessorydMatchingPlugin *)self trmStatusDidChange];
}

- (void)portManager:(id)a3 didUpdateAuthorizationStateForPort:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 4;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    id v10 = &_os_log_default;
    id v9 = &_os_log_default;
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = v7;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Port authorization state updated: %@", buf, 0xCu);
  }

  unsigned __int8 v11 = _uiQueue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __75__accessorydMatchingPlugin_portManager_didUpdateAuthorizationStateForPort___block_invoke;
  block[3] = &unk_51448;
  id v14 = v7;
  id v12 = v7;
  dispatch_sync(v11, block);

  [(accessorydMatchingPlugin *)self trmStatusDidChange];
}

- (void)intrusiveUIStateDidChange:(BOOL)a3 forService:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects <= 4;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = !v6;
  if (v4)
  {
    if (v7)
    {
      BOOL v8 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      BOOL v8 = &_os_log_default;
      id v10 = &_os_log_default;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[accessorydMatchingPlugin intrusiveUIStateDidChange:forService:]();
    }
  }
  else
  {
    if (v7)
    {
      id v9 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[AirplaneMode init]();
      }
      id v9 = &_os_log_default;
      id v11 = &_os_log_default;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[accessorydMatchingPlugin intrusiveUIStateDidChange:forService:]();
    }

    [v5 invalidate];
  }
}

- (void)serverRunningDidChange:(id)a3 status:(int)a4
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 5;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[AirplaneMode init]();
    }
    int v7 = &_os_log_default;
    id v6 = &_os_log_default;
  }
  else
  {
    int v7 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[accessorydMatchingPlugin serverRunningDidChange:status:]();
  }
}

- (void)eventModule
{
  return self->_eventModule;
}

- (void)setEventModule:(void *)a3
{
  self->_eventModule = a3;
}

- (void)digitalIDEventProvider
{
  return self->_digitalIDEventProvider;
}

- (void)setDigitalIDEventProvider:(void *)a3
{
  self->_digitalIDEventProvider = a3;
}

- (NSMutableSet)digitalIDTokenSet
{
  return self->_digitalIDTokenSet;
}

- (void)setDigitalIDTokenSet:(id)a3
{
}

- (void)btServiceEventProvider
{
  return self->_btServiceEventProvider;
}

- (void)setBtServiceEventProvider:(void *)a3
{
  self->_btServiceEventProvider = a3;
}

- (NSMutableSet)btServiceTokenSet
{
  return self->_btServiceTokenSet;
}

- (void)setBtServiceTokenSet:(id)a3
{
}

- (OS_dispatch_queue)accPowerQueue
{
  return self->_accPowerQueue;
}

- (void)setAccPowerQueue:(id)a3
{
}

- (OS_dispatch_source)accPowerTimer
{
  return self->_accPowerTimer;
}

- (void)setAccPowerTimer:(id)a3
{
}

- (OS_dispatch_queue)systemPowerQueue
{
  return self->_systemPowerQueue;
}

- (void)setSystemPowerQueue:(id)a3
{
}

- (unsigned)systemPowerPort
{
  return self->_systemPowerPort;
}

- (void)setSystemPowerPort:(unsigned int)a3
{
  self->_io_connect_t systemPowerPort = a3;
}

- (IONotificationPort)systemPowerNotifyPortRef
{
  return self->_systemPowerNotifyPortRef;
}

- (void)setSystemPowerNotifyPortRef:(IONotificationPort *)a3
{
  self->_systemPowerNotifyPortRef = a3;
}

- (unsigned)systemPowerIterator
{
  return self->_systemPowerIterator;
}

- (void)setSystemPowerIterator:(unsigned int)a3
{
  self->_systemPowerIterator = a3;
}

- (BOOL)digitalIDMatchingEnabled
{
  return self->_digitalIDMatchingEnabled;
}

- (void)setDigitalIDMatchingEnabled:(BOOL)a3
{
  self->_digitalIDMatchingEnabled = a3;
}

- (BTSessionImpl)btSession
{
  return self->_btSession;
}

- (void)setBtSession:(BTSessionImpl *)a3
{
  self->_btSession = a3;
}

- (BOOL)connectedToBTServer
{
  return self->_connectedToBTServer;
}

- (void)setConnectedToBTServer:(BOOL)a3
{
  self->_connectedToBTServer = a3;
}

- (OS_dispatch_queue)btEventQueue
{
  return self->_btEventQueue;
}

- (void)setBtEventQueue:(id)a3
{
}

- (OS_dispatch_queue)ioAccessoryEventQueue
{
  return self->_ioAccessoryEventQueue;
}

- (void)setIoAccessoryEventQueue:(id)a3
{
}

- (IONotificationPort)ioAccessoryManagerClassNotify
{
  return self->_ioAccessoryManagerClassNotify;
}

- (void)setIoAccessoryManagerClassNotify:(IONotificationPort *)a3
{
  self->_ioAccessoryManagerClassNotify = a3;
}

- (unsigned)ioAccessoryManagerClassIteratorArrived
{
  return self->_ioAccessoryManagerClassIteratorArrived;
}

- (void)setIoAccessoryManagerClassIteratorArrived:(unsigned int)a3
{
  self->_ioAccessoryManagerClassIteratorArrived = a3;
}

- (unsigned)ioAccessoryManagerClassIteratorTerminated
{
  return self->_ioAccessoryManagerClassIteratorTerminated;
}

- (void)setIoAccessoryManagerClassIteratorTerminated:(unsigned int)a3
{
  self->_ioAccessoryManagerClassIteratorTerminated = a3;
}

- (NSMutableDictionary)chargeConfigDict
{
  return self->_chargeConfigDict;
}

- (void)setChargeConfigDict:(id)a3
{
}

- (IONotificationPort)ioAccessoryPortClassNotify
{
  return self->_ioAccessoryPortClassNotify;
}

- (void)setIoAccessoryPortClassNotify:(IONotificationPort *)a3
{
  self->_ioAccessoryPortClassNotify = a3;
}

- (unsigned)ioAccessoryPortClassIteratorArrived
{
  return self->_ioAccessoryPortClassIteratorArrived;
}

- (void)setIoAccessoryPortClassIteratorArrived:(unsigned int)a3
{
  self->_ioAccessoryPortClassIteratorArrived = a3;
}

- (unsigned)ioAccessoryPortClassIteratorTerminated
{
  return self->_ioAccessoryPortClassIteratorTerminated;
}

- (void)setIoAccessoryPortClassIteratorTerminated:(unsigned int)a3
{
  self->_ioAccessoryPortClassIteratorTerminated = a3;
}

- (BOOL)rearLightningUSBPortExists
{
  return self->_rearLightningUSBPortExists;
}

- (void)setRearLightningUSBPortExists:(BOOL)a3
{
  self->_rearLightningUSBPortExists = a3;
}

- (OS_dispatch_queue)carPlayEventQueue
{
  return self->_carPlayEventQueue;
}

- (void)setCarPlayEventQueue:(id)a3
{
}

- (BOOL)isCarPlayAllowed
{
  return self->_isCarPlayAllowed;
}

- (void)setIsCarPlayAllowed:(BOOL)a3
{
  self->_isCarPlayAllowed = a3;
}

- (BOOL)isIOAccessoryManagerMonitorRunning
{
  return self->_isIOAccessoryManagerMonitorRunning;
}

- (void)setIsIOAccessoryManagerMonitorRunning:(BOOL)a3
{
  self->_isIOAccessoryManagerMonitorRunning = a3;
}

- (OS_dispatch_queue)ioAccessoryManagerEventQueue
{
  return self->_ioAccessoryManagerEventQueue;
}

- (void)setIoAccessoryManagerEventQueue:(id)a3
{
}

- (BOOL)isUSBRestrictedModeTimeoutMonitorRunning
{
  return self->_isUSBRestrictedModeTimeoutMonitorRunning;
}

- (void)setIsUSBRestrictedModeTimeoutMonitorRunning:(BOOL)a3
{
  self->_isUSBRestrictedModeTimeoutMonitorRunning = a3;
}

- (IONotificationPort)ioResourceNotifyPort
{
  return self->_ioResourceNotifyPort;
}

- (void)setIoResourceNotifyPort:(IONotificationPort *)a3
{
  self->_ioResourceNotifyPort = a3;
}

- (unsigned)ioResourceIterator
{
  return self->_ioResourceIterator;
}

- (void)setIoResourceIterator:(unsigned int)a3
{
  self->_ioResourceIterator = a3;
}

- (BOOL)restrictedModeEnabled
{
  return self->_restrictedModeEnabled;
}

- (void)setRestrictedModeEnabled:(BOOL)a3
{
  self->_restrictedModeEnabled = a3;
}

- (unsigned)usbRestrictedModeTimeout
{
  return self->_usbRestrictedModeTimeout;
}

- (void)setUsbRestrictedModeTimeout:(unsigned int)a3
{
  self->_usbRestrictedModeTimeout = a3;
}

- (NSMutableArray)rmEventArray
{
  return self->_rmEventArray;
}

- (void)setRmEventArray:(id)a3
{
}

- (BOOL)roleSwapMaskWritten
{
  return self->_roleSwapMaskWritten;
}

- (void)setRoleSwapMaskWritten:(BOOL)a3
{
  self->_roleSwapMaskWritten = a3;
}

- (NSMutableDictionary)digitalIDCacheDict
{
  return self->_digitalIDCacheDict;
}

- (void)setDigitalIDCacheDict:(id)a3
{
}

- (NSMutableDictionary)uartAccessoryDetachTimesDict
{
  return self->_uartAccessoryDetachTimesDict;
}

- (void)setUartAccessoryDetachTimesDict:(id)a3
{
}

- (NSMutableDictionary)mikeyBusAccessoryDetachTimesDict
{
  return self->_mikeyBusAccessoryDetachTimesDict;
}

- (void)setMikeyBusAccessoryDetachTimesDict:(id)a3
{
}

- (NSMutableDictionary)aidBulkPipeAccessoryDetachTimesDict
{
  return self->_aidBulkPipeAccessoryDetachTimesDict;
}

- (void)setAidBulkPipeAccessoryDetachTimesDict:(id)a3
{
}

- (NSNumber)lastUSBAccessoryDetachTime
{
  return self->_lastUSBAccessoryDetachTime;
}

- (void)setLastUSBAccessoryDetachTime:(id)a3
{
}

- (NSUserDefaults)pluginDefaults
{
  return self->_pluginDefaults;
}

- (void)setPluginDefaults:(id)a3
{
}

- (NSNumber)cachedUSBConnectType
{
  return self->_cachedUSBConnectType;
}

- (void)setCachedUSBConnectType:(id)a3
{
}

- (OS_dispatch_queue)analyticsQueue
{
  return self->_analyticsQueue;
}

- (void)setAnalyticsQueue:(id)a3
{
}

- (int)springBoardLockStateToken
{
  return self->_springBoardLockStateToken;
}

- (void)setSpringBoardLockStateToken:(int)a3
{
  self->_int springBoardLockStateToken = a3;
}

- (ueaPluginSystemSettingsMonitor)ueaPluginSystemSettingsMonitor
{
  return self->_ueaPluginSystemSettingsMonitor;
}

- (void)setUeaPluginSystemSettingsMonitor:(id)a3
{
}

- (IONotificationPort)ioNotifyPortTRM
{
  return self->_ioNotifyPortTRM;
}

- (void)setIoNotifyPortTRM:(IONotificationPort *)a3
{
  self->_ioNotifyPortTRM = a3;
}

- (unsigned)ioAddedIteratorTRM
{
  return self->_ioAddedIteratorTRM;
}

- (void)setIoAddedIteratorTRM:(unsigned int)a3
{
  self->_ioAddedIteratorTRM = a3;
}

- (unsigned)ioRemovedIteratorTRM
{
  return self->_ioRemovedIteratorTRM;
}

- (void)setIoRemovedIteratorTRM:(unsigned int)a3
{
  self->_ioRemovedIteratorTRM = a3;
}

- (TRMPortManager)portManager
{
  return self->_portManager;
}

- (void)setPortManager:(id)a3
{
}

- (IONotificationPort)ioNotifyPortLDCM
{
  return self->_ioNotifyPortLDCM;
}

- (void)setIoNotifyPortLDCM:(IONotificationPort *)a3
{
  self->_ioNotifyPortLDCM = a3;
}

- (unsigned)ioNotificationLDCM
{
  return self->_ioNotificationLDCM;
}

- (void)setIoNotificationLDCM:(unsigned int)a3
{
  self->_ioNotificationLDCM = a3;
}

- (unsigned)ioAddedIteratorLDCM
{
  return self->_ioAddedIteratorLDCM;
}

- (void)setIoAddedIteratorLDCM:(unsigned int)a3
{
  self->_ioAddedIteratorLDCM = a3;
}

- (IOUIAngelService)angelServiceLDCM
{
  return self->_angelServiceLDCM;
}

- (void)setAngelServiceLDCM:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_angelServiceLDCM, 0);
  objc_storeStrong((id *)&self->_portManager, 0);
  objc_storeStrong((id *)&self->_ueaPluginSystemSettingsMonitor, 0);
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
  objc_storeStrong((id *)&self->_cachedUSBConnectType, 0);
  objc_storeStrong((id *)&self->_pluginDefaults, 0);
  objc_storeStrong((id *)&self->_lastUSBAccessoryDetachTime, 0);
  objc_storeStrong((id *)&self->_aidBulkPipeAccessoryDetachTimesDict, 0);
  objc_storeStrong((id *)&self->_mikeyBusAccessoryDetachTimesDict, 0);
  objc_storeStrong((id *)&self->_uartAccessoryDetachTimesDict, 0);
  objc_storeStrong((id *)&self->_digitalIDCacheDict, 0);
  objc_storeStrong((id *)&self->_rmEventArray, 0);
  objc_storeStrong((id *)&self->_ioAccessoryManagerEventQueue, 0);
  objc_storeStrong((id *)&self->_carPlayEventQueue, 0);
  objc_storeStrong((id *)&self->_chargeConfigDict, 0);
  objc_storeStrong((id *)&self->_ioAccessoryEventQueue, 0);
  objc_storeStrong((id *)&self->_btEventQueue, 0);
  objc_storeStrong((id *)&self->_systemPowerQueue, 0);
  objc_storeStrong((id *)&self->_accPowerTimer, 0);
  objc_storeStrong((id *)&self->_accPowerQueue, 0);
  objc_storeStrong((id *)&self->_btServiceTokenSet, 0);

  objc_storeStrong((id *)&self->_digitalIDTokenSet, 0);
}

- (void)initWithModule:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_0, v0, v1, "IORegisterForSystemPower failed!!  Accesssory power will not be turned on after system sleep.", v2, v3, v4, v5, v6);
}

- (void)initWithModule:.cold.12()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_0, v0, v1, "Unable to start LDCM monitoring", v2, v3, v4, v5, v6);
}

- (void)attachToBTServer
{
}

- (void)detachFromBTServer
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_0(&dword_0, v0, v1, "%s failed detaching from BT server, result: %d\n", v2, v3, v4, v5, 2u);
}

- (void)intrusiveUIStateDidChange:forService:.cold.1()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_12(&dword_0, v0, v1, "%s: UI state: %d.\n", v2, v3, v4, v5, v6);
}

- (void)intrusiveUIStateDidChange:forService:.cold.3()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12(&dword_0, v0, v1, "%s: UI state: %d.\n", v2, v3, v4, v5, 2u);
}

- (void)serverRunningDidChange:status:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12(&dword_0, v0, v1, "%s: Running server state: %d.\n", v2, v3, v4, v5, 2u);
}

@end