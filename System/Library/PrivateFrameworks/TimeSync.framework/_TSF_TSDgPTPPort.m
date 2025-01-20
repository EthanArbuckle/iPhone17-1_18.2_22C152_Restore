@interface _TSF_TSDgPTPPort
+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4;
+ (id)diagnosticInfoForService:(id)a3;
+ (id)gPTPPortWithClockIdentifier:(unint64_t)a3 portNumber:(unsigned __int16)a4;
+ (id)gPTPPortWithService:(id)a3;
+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4;
+ (id)iokitMatchingDictionaryForPortClass:(id)a3 clockIdentifier:(unint64_t)a4 andPortNumber:(unsigned __int16)a5;
- (BOOL)startAutomaticPropertyUpdates;
- (BOOL)stopAutomaticPropertyUpdates;
- (IOKService)service;
- (OS_dispatch_queue)propertyUpdateQueue;
- (_TSF_IODConnection)connection;
- (_TSF_TSDgPTPPort)init;
- (_TSF_TSDgPTPPort)initWithService:(id)a3;
- (_TSF_TSDgPTPPort)initWithService:(id)a3 pid:(int)a4;
- (id)getMetrics;
- (id)getMetricsWithDelta:(id)a3;
- (id)propertiesForXPC;
- (int)_portRole;
- (int)portRole;
- (int)portType;
- (unint64_t)_clockIdentifier;
- (unint64_t)clockIdentifier;
- (unsigned)_portNumber;
- (unsigned)portNumber;
- (void)finalizeNotifications;
- (void)setClockIdentifier:(unint64_t)a3;
- (void)setPortNumber:(unsigned __int16)a3;
- (void)setPortRole:(int)a3;
- (void)setPropertyUpdateQueue:(id)a3;
- (void)updateProperties;
@end

@implementation _TSF_TSDgPTPPort

+ (id)iokitMatchingDictionaryForPortClass:(id)a3 clockIdentifier:(unint64_t)a4 andPortNumber:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = @"IOProviderClass";
  v16[1] = @"IOPropertyMatch";
  v17[0] = a3;
  v14[0] = @"PortNumber";
  v7 = NSNumber;
  id v8 = a3;
  v9 = [v7 numberWithUnsignedShort:v5];
  v14[1] = @"ClockIdentifier";
  v15[0] = v9;
  v10 = [NSNumber numberWithUnsignedLongLong:a4];
  v15[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  v17[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v12;
}

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4
{
  return (id)[a1 iokitMatchingDictionaryForPortClass:@"IOTimeSyncPort" clockIdentifier:a3 andPortNumber:a4];
}

- (_TSF_TSDgPTPPort)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  uint64_t v5 = [NSString stringWithUTF8String:"-[_TSF_TSDgPTPPort init]"];
  [v3 raise:v4, @"Do not call %@", v5 format];

  return 0;
}

+ (id)gPTPPortWithService:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToIOClassName:@"IOTimeSyncEthernetPort"])
  {
    uint64_t v4 = off_1E622A858;
LABEL_21:
    uint64_t v5 = (void *)[objc_alloc(*v4) initWithService:v3];
    goto LABEL_22;
  }
  if ([v3 conformsToIOClassName:@"IOTimeSyncUnicastLinkLayerPtPPort"])
  {
    uint64_t v4 = off_1E622A8A0;
    goto LABEL_21;
  }
  if ([v3 conformsToIOClassName:@"IOTimeSyncUnicastUDPv4PtPPort"])
  {
    uint64_t v4 = off_1E622A8B0;
    goto LABEL_21;
  }
  if ([v3 conformsToIOClassName:@"IOTimeSyncUnicastUDPv6PtPPort"])
  {
    uint64_t v4 = &off_1E622A8C0;
    goto LABEL_21;
  }
  if ([v3 conformsToIOClassName:@"IOTimeSyncUnicastLinkLayerEtEPort"])
  {
    uint64_t v4 = off_1E622A898;
    goto LABEL_21;
  }
  if ([v3 conformsToIOClassName:@"IOTimeSyncUnicastUDPv4EtEPort"])
  {
    uint64_t v4 = off_1E622A8A8;
    goto LABEL_21;
  }
  if ([v3 conformsToIOClassName:@"IOTimeSyncUnicastUDPv6EtEPort"])
  {
    uint64_t v4 = off_1E622A8B8;
    goto LABEL_21;
  }
  if ([v3 conformsToIOClassName:@"IOTimeSyncLocalClockPort"])
  {
    uint64_t v4 = off_1E622A870;
    goto LABEL_21;
  }
  if ([v3 conformsToIOClassName:@"IOTimeSyncNetworkPort"])
  {
    uint64_t v4 = off_1E622A880;
    goto LABEL_21;
  }
  if ([v3 conformsToIOClassName:@"IOTimeSyncPort"])
  {
    uint64_t v4 = off_1E622A888;
    goto LABEL_21;
  }
  uint64_t v5 = 0;
LABEL_22:

  return v5;
}

+ (id)gPTPPortWithClockIdentifier:(unint64_t)a3 portNumber:(unsigned __int16)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F6EC30];
  v6 = [a1 iokitMatchingDictionaryForClockIdentifier:a3 andPortNumber:a4];
  v7 = [v5 matchingService:v6];

  id v8 = [a1 gPTPPortWithService:v7];

  return v8;
}

- (_TSF_TSDgPTPPort)initWithService:(id)a3
{
  return [(_TSF_TSDgPTPPort *)self initWithService:a3 pid:0];
}

- (_TSF_TSDgPTPPort)initWithService:(id)a3 pid:(int)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_TSF_TSDgPTPPort;
  v7 = [(_TSF_TSDgPTPPort *)&v20 init];
  if (v7)
  {
    objc_initWeak(&location, v7);
    objc_storeStrong((id *)&v7->_service, a3);
    if (v7->_service)
    {
      v7->_portNumber = [(_TSF_TSDgPTPPort *)v7 _portNumber];
      v7->_clockIdentifier = [(_TSF_TSDgPTPPort *)v7 _clockIdentifier];
      if (initWithService_pid__onceToken != -1) {
        dispatch_once(&initWithService_pid__onceToken, &__block_literal_global_2);
      }
      if (_sharedNotificationsQueue)
      {
        objc_storeStrong((id *)&v7->_propertyUpdateQueue, (id)_sharedNotificationsQueue);
        v7->_portRole = [(_TSF_TSDgPTPPort *)v7 _portRole];
        id v8 = objc_alloc(MEMORY[0x1E4F6EC28]);
        uint64_t v9 = [v8 initOnDispatchQueue:_sharedNotificationsQueue];
        notificationPort = v7->_notificationPort;
        v7->_notificationPort = (IOKNotificationPort *)v9;

        v11 = v7->_notificationPort;
        if (v11)
        {
          service = v7->_service;
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __40___TSF_TSDgPTPPort_initWithService_pid___block_invoke_65;
          void v17[3] = &unk_1E622AB98;
          objc_copyWeak(&v18, &location);
          uint64_t v13 = [(IOKService *)service addInterestNotifcationOfType:*MEMORY[0x1E4F6EC18] usingNotificationPort:v11 error:0 withHandler:v17];
          generalInterestNotification = v7->_generalInterestNotification;
          v7->_generalInterestNotification = (IOKInterestNotification *)v13;

          objc_destroyWeak(&v18);
          if (v7->_generalInterestNotification)
          {
LABEL_8:
            objc_destroyWeak(&location);
            goto LABEL_9;
          }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            v22 = "_generalInterestNotification != nil";
            __int16 v23 = 2048;
            uint64_t v24 = 0;
            __int16 v25 = 2048;
            uint64_t v26 = 0;
            __int16 v27 = 2080;
            v28 = "";
            __int16 v29 = 2080;
            v30 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
            __int16 v31 = 1024;
            int v32 = 280;
            v16 = MEMORY[0x1E4F14500];
            goto LABEL_18;
          }
LABEL_19:

          v7 = 0;
          goto LABEL_8;
        }
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 136316418;
        v22 = "_notificationPort != nil";
        __int16 v23 = 2048;
        uint64_t v24 = 0;
        __int16 v25 = 2048;
        uint64_t v26 = 0;
        __int16 v27 = 2080;
        v28 = "";
        __int16 v29 = 2080;
        v30 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
        __int16 v31 = 1024;
        int v32 = 258;
        v16 = MEMORY[0x1E4F14500];
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 136316418;
        v22 = "_sharedNotificationsQueue != nil";
        __int16 v23 = 2048;
        uint64_t v24 = 0;
        __int16 v25 = 2048;
        uint64_t v26 = 0;
        __int16 v27 = 2080;
        v28 = "";
        __int16 v29 = 2080;
        v30 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
        __int16 v31 = 1024;
        int v32 = 251;
        v16 = MEMORY[0x1E4F14500];
      }
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 136316418;
      v22 = "_service != nil";
      __int16 v23 = 2048;
      uint64_t v24 = 0;
      __int16 v25 = 2048;
      uint64_t v26 = 0;
      __int16 v27 = 2080;
      v28 = "";
      __int16 v29 = 2080;
      v30 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
      __int16 v31 = 1024;
      int v32 = 242;
      v16 = MEMORY[0x1E4F14500];
    }
LABEL_18:
    _os_log_impl(&dword_1BA88B000, v16, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_19;
  }
LABEL_9:

  return v7;
}

- (IOKService)service
{
  return self->_service;
}

- (void)updateProperties
{
  id v3 = [(_TSF_TSDgPTPPort *)self propertyUpdateQueue];
  int v4 = [(_TSF_TSDgPTPPort *)self _portRole];
  unint64_t v5 = [(_TSF_TSDgPTPPort *)self _clockIdentifier];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36___TSF_TSDgPTPPort_updateProperties__block_invoke;
  block[3] = &unk_1E622ABC0;
  int v7 = v4;
  block[4] = self;
  block[5] = v5;
  dispatch_async(v3, block);
}

- (BOOL)startAutomaticPropertyUpdates
{
  BOOL v2 = self->_generalInterestNotification != 0;
  self->_updatePropertiesOnPropertyChange = 1;
  return v2;
}

- (BOOL)stopAutomaticPropertyUpdates
{
  self->_updatePropertiesOnPropertyChange = 0;
  dispatch_sync((dispatch_queue_t)_sharedNotificationsQueue, &__block_literal_global_69);
  return 1;
}

- (unsigned)_portNumber
{
  BOOL v2 = [(_TSF_TSDgPTPPort *)self service];
  id v3 = [v2 iodPropertyForKey:@"PortNumber"];

  if (v3) {
    unsigned __int16 v4 = [v3 unsignedShortValue];
  }
  else {
    unsigned __int16 v4 = 0;
  }

  return v4;
}

- (int)_portRole
{
  BOOL v2 = [(_TSF_TSDgPTPPort *)self service];
  id v3 = [v2 iodPropertyForKey:@"PortRole"];

  if (v3)
  {
    unsigned int v4 = [v3 intValue];
    if (v4 < 4) {
      int v5 = v4 + 1;
    }
    else {
      int v5 = 0;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (unint64_t)_clockIdentifier
{
  BOOL v2 = [(_TSF_TSDgPTPPort *)self service];
  id v3 = [v2 iodPropertyForKey:@"ClockIdentifier"];

  if (v3) {
    unint64_t v4 = [v3 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (int)portType
{
  return 0;
}

- (void)setPropertyUpdateQueue:(id)a3
{
  unint64_t v4 = (OS_dispatch_queue *)a3;
  if (!v4) {
    unint64_t v4 = (OS_dispatch_queue *)(id)_sharedNotificationsQueue;
  }
  self->_propertyUpdateQueue = v4;
  MEMORY[0x1F41817F8]();
}

- (void)finalizeNotifications
{
  self->_updatePropertiesOnPropertyChange = 0;
  generalInterestNotification = self->_generalInterestNotification;
  self->_generalInterestNotification = 0;

  notificationPort = self->_notificationPort;
  self->_notificationPort = 0;
}

- (id)propertiesForXPC
{
  id v3 = objc_opt_class();
  unint64_t v4 = [(_TSF_TSDgPTPPort *)self service];
  int v5 = [v3 diagnosticInfoForService:v4];

  id v6 = [v5 objectForKeyedSubscript:@"PortRole"];
  if (v6)
  {
    int v7 = v6;
    switch([v6 intValue])
    {
      case 0u:
        id v8 = NSNumber;
        uint64_t v9 = 1;
        goto LABEL_8;
      case 1u:
        id v8 = NSNumber;
        uint64_t v9 = 2;
        goto LABEL_8;
      case 2u:
        id v8 = NSNumber;
        uint64_t v9 = 3;
        goto LABEL_8;
      case 3u:
        id v8 = NSNumber;
        uint64_t v9 = 4;
LABEL_8:
        uint64_t v10 = [v8 numberWithInt:v9];

        int v7 = (void *)v10;
        break;
      default:
        break;
    }
  }
  else
  {
    int v7 = [NSNumber numberWithInt:0];
  }
  [v5 setObject:v7 forKeyedSubscript:@"PortRole"];

  return v5;
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  int v5 = [v3 dictionary];
  id v6 = [v4 ioClassName];
  [v5 setObject:v6 forKeyedSubscript:@"ClassName"];

  int v7 = [v4 iodProperties];

  [v5 addEntriesFromDictionary:v7];
  [v5 removeObjectForKey:@"IOUserClientClass"];
  [v5 removeObjectForKey:@"IOGeneralInterest"];
  [v5 removeObjectForKey:@"SourceMACAddress"];
  [v5 removeObjectForKey:@"DestinationMACAddress"];
  [v5 removeObjectForKey:@"SourceIPAddress"];
  [v5 removeObjectForKey:@"SourceIPMask"];
  [v5 removeObjectForKey:@"DestinationIPAddress"];
  return v5;
}

+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F6EC30];
  int v5 = [a1 iokitMatchingDictionaryForClockIdentifier:a3 andPortNumber:a4];
  id v6 = [v4 matchingService:v5];

  if (v6)
  {
    if ([v6 conformsToIOClassName:@"IOTimeSyncEthernetPort"])
    {
      int v7 = _TSF_TSDgPTPEthernetPort;
LABEL_20:
      id v8 = [(__objc2_class *)v7 diagnosticInfoForService:v6];
      goto LABEL_21;
    }
    if ([v6 conformsToIOClassName:@"IOTimeSyncUnicastLinkLayerPtPPort"])
    {
      int v7 = _TSF_TSDgPTPUnicastLinkLayerPtPPort;
      goto LABEL_20;
    }
    if ([v6 conformsToIOClassName:@"IOTimeSyncUnicastLinkLayerEtEPort"])
    {
      int v7 = _TSF_TSDgPTPUnicastLinkLayerEtEPort;
      goto LABEL_20;
    }
    if ([v6 conformsToIOClassName:@"IOTimeSyncUnicastUDPv4PtPPort"])
    {
      int v7 = _TSF_TSDgPTPUnicastUDPv4PtPPort;
      goto LABEL_20;
    }
    if ([v6 conformsToIOClassName:@"IOTimeSyncUnicastUDPv6PtPPort"])
    {
      int v7 = _TSF_TSDgPTPUnicastUDPv6PtPPort;
      goto LABEL_20;
    }
    if ([v6 conformsToIOClassName:@"IOTimeSyncUnicastUDPv4EtEPort"])
    {
      int v7 = _TSF_TSDgPTPUnicastUDPv4EtEPort;
      goto LABEL_20;
    }
    if ([v6 conformsToIOClassName:@"IOTimeSyncUnicastUDPv6EtEPort"])
    {
      int v7 = _TSF_TSDgPTPUnicastUDPv6EtEPort;
      goto LABEL_20;
    }
    if ([v6 conformsToIOClassName:@"IOTimeSyncLocalClockPort"])
    {
      int v7 = _TSF_TSDgPTPLocalClockPort;
      goto LABEL_20;
    }
    if ([v6 conformsToIOClassName:@"IOTimeSyncPort"])
    {
      int v7 = _TSF_TSDgPTPPort;
      goto LABEL_20;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136316418;
    v11 = "service != nil";
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2080;
    v17 = "";
    __int16 v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
    __int16 v20 = 1024;
    int v21 = 470;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v10, 0x3Au);
  }
  id v8 = 0;
LABEL_21:

  return v8;
}

- (id)getMetrics
{
  BOOL v2 = [[_TSF_TSDPortMetrics alloc] initWithPort:self];
  return v2;
}

- (id)getMetricsWithDelta:(id)a3
{
  id v4 = a3;
  int v5 = [(_TSF_TSDgPTPPort *)self getMetrics];
  id v6 = [v5 getDelta:v4];

  return v6;
}

- (unsigned)portNumber
{
  return self->_portNumber;
}

- (void)setPortNumber:(unsigned __int16)a3
{
  self->_portNumber = a3;
}

- (int)portRole
{
  return self->_portRole;
}

- (void)setPortRole:(int)a3
{
  self->_portRole = a3;
}

- (unint64_t)clockIdentifier
{
  return self->_clockIdentifier;
}

- (void)setClockIdentifier:(unint64_t)a3
{
  self->_clockIdentifier = a3;
}

- (OS_dispatch_queue)propertyUpdateQueue
{
  return self->_propertyUpdateQueue;
}

- (_TSF_IODConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyUpdateQueue, 0);
  objc_storeStrong((id *)&self->_generalInterestNotification, 0);
  objc_storeStrong((id *)&self->_notificationPort, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end