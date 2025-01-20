@interface TSDgPTPPort
+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4;
+ (id)diagnosticInfoForService:(id)a3;
+ (id)gPTPPortWithClockIdentifier:(unint64_t)a3 portNumber:(unsigned __int16)a4;
+ (id)gPTPPortWithService:(id)a3;
+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4;
+ (id)iokitMatchingDictionaryForPortClass:(id)a3 clockIdentifier:(unint64_t)a4 andPortNumber:(unsigned __int16)a5;
- (BOOL)startAutomaticPropertyUpdates;
- (BOOL)stopAutomaticPropertyUpdates;
- (IODConnection)connection;
- (IOKService)service;
- (OS_dispatch_queue)propertyUpdateQueue;
- (TSDgPTPPort)init;
- (TSDgPTPPort)initWithService:(id)a3;
- (TSDgPTPPort)initWithService:(id)a3 pid:(int)a4;
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

@implementation TSDgPTPPort

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyUpdateQueue, 0);
  objc_storeStrong((id *)&self->_generalInterestNotification, 0);
  objc_storeStrong((id *)&self->_notificationPort, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

- (int)_portRole
{
  v2 = [(TSDgPTPPort *)self service];
  v3 = [v2 iodPropertyForKey:@"PortRole"];

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
  v2 = [(TSDgPTPPort *)self service];
  v3 = [v2 iodPropertyForKey:@"ClockIdentifier"];

  if (v3) {
    id v4 = [v3 unsignedLongLongValue];
  }
  else {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (unsigned)_portNumber
{
  v2 = [(TSDgPTPPort *)self service];
  v3 = [v2 iodPropertyForKey:@"PortNumber"];

  if (v3) {
    unsigned __int16 v4 = (unsigned __int16)[v3 unsignedShortValue];
  }
  else {
    unsigned __int16 v4 = 0;
  }

  return v4;
}

+ (id)gPTPPortWithService:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToIOClassName:@"IOTimeSyncEthernetPort"])
  {
    unsigned __int16 v4 = off_10003C3E0;
LABEL_21:
    id v5 = [objc_alloc(*v4) initWithService:v3];
    goto LABEL_22;
  }
  if ([v3 conformsToIOClassName:@"IOTimeSyncUnicastLinkLayerPtPPort"])
  {
    unsigned __int16 v4 = off_10003C408;
    goto LABEL_21;
  }
  if ([v3 conformsToIOClassName:@"IOTimeSyncUnicastUDPv4PtPPort"])
  {
    unsigned __int16 v4 = off_10003C418;
    goto LABEL_21;
  }
  if ([v3 conformsToIOClassName:@"IOTimeSyncUnicastUDPv6PtPPort"])
  {
    unsigned __int16 v4 = &off_10003C428;
    goto LABEL_21;
  }
  if ([v3 conformsToIOClassName:@"IOTimeSyncUnicastLinkLayerEtEPort"])
  {
    unsigned __int16 v4 = off_10003C400;
    goto LABEL_21;
  }
  if ([v3 conformsToIOClassName:@"IOTimeSyncUnicastUDPv4EtEPort"])
  {
    unsigned __int16 v4 = off_10003C410;
    goto LABEL_21;
  }
  if ([v3 conformsToIOClassName:@"IOTimeSyncUnicastUDPv6EtEPort"])
  {
    unsigned __int16 v4 = off_10003C420;
    goto LABEL_21;
  }
  if ([v3 conformsToIOClassName:@"IOTimeSyncLocalClockPort"])
  {
    unsigned __int16 v4 = off_10003C3E8;
    goto LABEL_21;
  }
  if ([v3 conformsToIOClassName:@"IOTimeSyncNetworkPort"])
  {
    unsigned __int16 v4 = off_10003C3F0;
    goto LABEL_21;
  }
  if ([v3 conformsToIOClassName:@"IOTimeSyncPort"])
  {
    unsigned __int16 v4 = off_10003C3F8;
    goto LABEL_21;
  }
  id v5 = 0;
LABEL_22:

  return v5;
}

- (TSDgPTPPort)initWithService:(id)a3 pid:(int)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TSDgPTPPort;
  v7 = [(TSDgPTPPort *)&v19 init];
  if (v7)
  {
    objc_initWeak(&location, v7);
    objc_storeStrong((id *)&v7->_service, a3);
    if (v7->_service)
    {
      v7->_portNumber = [(TSDgPTPPort *)v7 _portNumber];
      v7->_clockIdentifier = [(TSDgPTPPort *)v7 _clockIdentifier];
      if (qword_100047C40 != -1) {
        dispatch_once(&qword_100047C40, &stru_10003C630);
      }
      if (qword_100047C38)
      {
        objc_storeStrong((id *)&v7->_propertyUpdateQueue, (id)qword_100047C38);
        v7->_portRole = [(TSDgPTPPort *)v7 _portRole];
        id v8 = objc_alloc((Class)IOKNotificationPort);
        v9 = (IOKNotificationPort *)[v8 initOnDispatchQueue:qword_100047C38];
        notificationPort = v7->_notificationPort;
        v7->_notificationPort = v9;

        v11 = v7->_notificationPort;
        if (v11)
        {
          service = v7->_service;
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_10000D0D8;
          v16[3] = &unk_10003C658;
          objc_copyWeak(&v17, &location);
          uint64_t v13 = [(IOKService *)service addInterestNotifcationOfType:IOKGeneralInterest usingNotificationPort:v11 error:0 withHandler:v16];
          generalInterestNotification = v7->_generalInterestNotification;
          v7->_generalInterestNotification = (IOKInterestNotification *)v13;

          objc_destroyWeak(&v17);
          if (v7->_generalInterestNotification)
          {
LABEL_8:
            objc_destroyWeak(&location);
            goto LABEL_9;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            v21 = "_generalInterestNotification != nil";
            __int16 v22 = 2048;
            uint64_t v23 = 0;
            __int16 v24 = 2048;
            uint64_t v25 = 0;
            __int16 v26 = 2080;
            v27 = &unk_100030E47;
            __int16 v28 = 2080;
            v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
            __int16 v30 = 1024;
            int v31 = 280;
            goto LABEL_18;
          }
LABEL_19:

          v7 = 0;
          goto LABEL_8;
        }
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 136316418;
        v21 = "_notificationPort != nil";
        __int16 v22 = 2048;
        uint64_t v23 = 0;
        __int16 v24 = 2048;
        uint64_t v25 = 0;
        __int16 v26 = 2080;
        v27 = &unk_100030E47;
        __int16 v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
        __int16 v30 = 1024;
        int v31 = 258;
      }
      else
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_19;
        }
        *(_DWORD *)buf = 136316418;
        v21 = "_sharedNotificationsQueue != nil";
        __int16 v22 = 2048;
        uint64_t v23 = 0;
        __int16 v24 = 2048;
        uint64_t v25 = 0;
        __int16 v26 = 2080;
        v27 = &unk_100030E47;
        __int16 v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
        __int16 v30 = 1024;
        int v31 = 251;
      }
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 136316418;
      v21 = "_service != nil";
      __int16 v22 = 2048;
      uint64_t v23 = 0;
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2080;
      v27 = &unk_100030E47;
      __int16 v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
      __int16 v30 = 1024;
      int v31 = 242;
    }
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_19;
  }
LABEL_9:

  return v7;
}

- (IOKService)service
{
  return self->_service;
}

- (TSDgPTPPort)initWithService:(id)a3
{
  return [(TSDgPTPPort *)self initWithService:a3 pid:0];
}

+ (id)iokitMatchingDictionaryForPortClass:(id)a3 clockIdentifier:(unint64_t)a4 andPortNumber:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  v15[0] = @"IOProviderClass";
  v15[1] = @"IOPropertyMatch";
  v16[0] = a3;
  v13[0] = @"PortNumber";
  id v7 = a3;
  id v8 = +[NSNumber numberWithUnsignedShort:v5];
  v13[1] = @"ClockIdentifier";
  v14[0] = v8;
  v9 = +[NSNumber numberWithUnsignedLongLong:a4];
  v14[1] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[1] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v11;
}

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4
{
  return [a1 iokitMatchingDictionaryForPortClass:@"IOTimeSyncPort" clockIdentifier:a3 andPortNumber:a4];
}

- (TSDgPTPPort)init
{
  id v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSDgPTPPort init]");
  +[NSException raise:NSInvalidArgumentException, @"Do not call %@", v3 format];

  return 0;
}

+ (id)gPTPPortWithClockIdentifier:(unint64_t)a3 portNumber:(unsigned __int16)a4
{
  uint64_t v5 = [a1 iokitMatchingDictionaryForClockIdentifier:a3 andPortNumber:a4];
  id v6 = +[IOKService matchingService:v5];

  id v7 = [a1 gPTPPortWithService:v6];

  return v7;
}

- (void)updateProperties
{
  id v3 = [(TSDgPTPPort *)self propertyUpdateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D234;
  block[3] = &unk_10003C680;
  unsigned int v5 = [(TSDgPTPPort *)self _portRole];
  block[4] = self;
  block[5] = [(TSDgPTPPort *)self _clockIdentifier];
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
  dispatch_sync((dispatch_queue_t)qword_100047C38, &stru_10003C6A0);
  return 1;
}

- (int)portType
{
  return 0;
}

- (void)setPropertyUpdateQueue:(id)a3
{
  unsigned __int16 v4 = (OS_dispatch_queue *)a3;
  if (!v4) {
    unsigned __int16 v4 = (OS_dispatch_queue *)(id)qword_100047C38;
  }
  self->_propertyUpdateQueue = v4;

  _objc_release_x1();
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
  unsigned __int16 v4 = [(TSDgPTPPort *)self service];
  unsigned int v5 = [v3 diagnosticInfoForService:v4];

  id v6 = [v5 objectForKeyedSubscript:@"PortRole"];
  if (v6)
  {
    id v7 = v6;
    switch([v6 intValue])
    {
      case 0u:
        uint64_t v8 = 1;
        goto LABEL_8;
      case 1u:
        uint64_t v8 = 2;
        goto LABEL_8;
      case 2u:
        uint64_t v8 = 3;
        goto LABEL_8;
      case 3u:
        uint64_t v8 = 4;
LABEL_8:
        uint64_t v9 = +[NSNumber numberWithInt:v8];

        id v7 = (void *)v9;
        break;
      default:
        break;
    }
  }
  else
  {
    id v7 = +[NSNumber numberWithInt:0];
  }
  [v5 setObject:v7 forKeyedSubscript:@"PortRole"];

  return v5;
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v3 = a3;
  unsigned __int16 v4 = +[NSMutableDictionary dictionary];
  unsigned int v5 = [v3 ioClassName];
  [v4 setObject:v5 forKeyedSubscript:@"ClassName"];

  id v6 = [v3 iodProperties];

  [v4 addEntriesFromDictionary:v6];
  [v4 removeObjectForKey:@"IOUserClientClass"];
  [v4 removeObjectForKey:@"IOGeneralInterest"];
  [v4 removeObjectForKey:@"SourceMACAddress"];
  [v4 removeObjectForKey:@"DestinationMACAddress"];
  [v4 removeObjectForKey:@"SourceIPAddress"];
  [v4 removeObjectForKey:@"SourceIPMask"];
  [v4 removeObjectForKey:@"DestinationIPAddress"];

  return v4;
}

+ (id)diagnosticInfoForClockIdentifier:(unint64_t)a3 andPortNumber:(unsigned __int16)a4
{
  unsigned __int16 v4 = [a1 iokitMatchingDictionaryForClockIdentifier:a3 andPortNumber:a4];
  unsigned int v5 = +[IOKService matchingService:v4];

  if (v5)
  {
    if ([v5 conformsToIOClassName:@"IOTimeSyncEthernetPort"])
    {
      id v6 = TSDgPTPEthernetPort;
LABEL_20:
      id v7 = [(__objc2_class *)v6 diagnosticInfoForService:v5];
      goto LABEL_21;
    }
    if ([v5 conformsToIOClassName:@"IOTimeSyncUnicastLinkLayerPtPPort"])
    {
      id v6 = TSDgPTPUnicastLinkLayerPtPPort;
      goto LABEL_20;
    }
    if ([v5 conformsToIOClassName:@"IOTimeSyncUnicastLinkLayerEtEPort"])
    {
      id v6 = TSDgPTPUnicastLinkLayerEtEPort;
      goto LABEL_20;
    }
    if ([v5 conformsToIOClassName:@"IOTimeSyncUnicastUDPv4PtPPort"])
    {
      id v6 = TSDgPTPUnicastUDPv4PtPPort;
      goto LABEL_20;
    }
    if ([v5 conformsToIOClassName:@"IOTimeSyncUnicastUDPv6PtPPort"])
    {
      id v6 = TSDgPTPUnicastUDPv6PtPPort;
      goto LABEL_20;
    }
    if ([v5 conformsToIOClassName:@"IOTimeSyncUnicastUDPv4EtEPort"])
    {
      id v6 = TSDgPTPUnicastUDPv4EtEPort;
      goto LABEL_20;
    }
    if ([v5 conformsToIOClassName:@"IOTimeSyncUnicastUDPv6EtEPort"])
    {
      id v6 = TSDgPTPUnicastUDPv6EtEPort;
      goto LABEL_20;
    }
    if ([v5 conformsToIOClassName:@"IOTimeSyncLocalClockPort"])
    {
      id v6 = TSDgPTPLocalClockPort;
      goto LABEL_20;
    }
    if ([v5 conformsToIOClassName:@"IOTimeSyncPort"])
    {
      id v6 = TSDgPTPPort;
      goto LABEL_20;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136316418;
    v10 = "service != nil";
    __int16 v11 = 2048;
    uint64_t v12 = 0;
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    v16 = &unk_100030E47;
    __int16 v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
    __int16 v19 = 1024;
    int v20 = 470;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v9, 0x3Au);
  }
  id v7 = 0;
LABEL_21:

  return v7;
}

- (id)getMetrics
{
  BOOL v2 = [[TSDPortMetrics alloc] initWithPort:self];

  return v2;
}

- (id)getMetricsWithDelta:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(TSDgPTPPort *)self getMetrics];
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

- (IODConnection)connection
{
  return self->_connection;
}

@end