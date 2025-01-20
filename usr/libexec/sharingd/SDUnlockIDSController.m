@interface SDUnlockIDSController
+ (SDUnlockIDSController)sharedController;
- (BOOL)hasDefaultDevice;
- (BOOL)isDefaultPairedDeviceNearby;
- (IDSService)idsService;
- (IDSService)idsServiceClassA;
- (NSHashTable)delegates;
- (NSMutableDictionary)errorHandlers;
- (NSSet)autoUnlockEligibleDevices;
- (OS_dispatch_queue)serviceQueue;
- (SDUnlockIDSController)init;
- (id)activeIDSDevice;
- (id)autoUnlockDeviceForIDSDevice:(id)a3;
- (id)autoUnlockService;
- (id)dataClassStringForDataClass:(int64_t)a3;
- (void)addDelegate:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)sendProtocolBufferData:(id)a3 withType:(unsigned __int16)a4 timeout:(id)a5 option:(int64_t)a6 dataClass:(int64_t)a7 queueOneID:(id)a8 errorHandler:(id)a9;
- (void)sendProtocolBufferData:(id)a3 withType:(unsigned __int16)a4 timeout:(id)a5 option:(int64_t)a6 errorHandler:(id)a7;
- (void)sendProtocolBufferData:(id)a3 withType:(unsigned __int16)a4 timeout:(id)a5 option:(int64_t)a6 queueOneID:(id)a7 errorHandler:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)serviceSpaceDidBecomeAvailable:(id)a3;
- (void)setErrorHandlers:(id)a3;
- (void)setIdsService:(id)a3;
- (void)setIdsServiceClassA:(id)a3;
- (void)updateSendOptions:(id)a3;
@end

@implementation SDUnlockIDSController

- (SDUnlockIDSController)init
{
  v16.receiver = self;
  v16.super_class = (Class)SDUnlockIDSController;
  v2 = [(SDUnlockTransport *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    errorHandlers = v2->_errorHandlers;
    v2->_errorHandlers = (NSMutableDictionary *)v3;

    uint64_t v5 = SFMainQueue();
    serviceQueue = v2->_serviceQueue;
    v2->_serviceQueue = (OS_dispatch_queue *)v5;

    v7 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.continuity.auth"];
    idsService = v2->_idsService;
    v2->_idsService = v7;

    [(IDSService *)v2->_idsService addDelegate:v2 queue:v2->_serviceQueue];
    v9 = paired_unlock_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v2->_idsService;
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Created continuity.auth service %@", buf, 0xCu);
    }

    v11 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.continuity.auth.classa"];
    idsServiceClassA = v2->_idsServiceClassA;
    v2->_idsServiceClassA = v11;

    [(IDSService *)v2->_idsServiceClassA addDelegate:v2 queue:v2->_serviceQueue];
    objc_storeStrong((id *)&v2->_autoUnlockService, v2->_idsServiceClassA);
    uint64_t v13 = +[NSHashTable weakObjectsHashTable];
    delegates = v2->_delegates;
    v2->_delegates = (NSHashTable *)v13;
  }
  return v2;
}

+ (SDUnlockIDSController)sharedController
{
  if (qword_10097FB38 != -1) {
    dispatch_once(&qword_10097FB38, &stru_1008CA5F0);
  }
  v2 = (void *)qword_10097FB30;

  return (SDUnlockIDSController *)v2;
}

- (BOOL)hasDefaultDevice
{
  v2 = [(IDSService *)self->_idsService devices];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) isDefaultPairedDevice];
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (BOOL)isDefaultPairedDeviceNearby
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(IDSService *)self->_idsService devices];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v6 isDefaultPairedDevice]
          && ([v6 isNearby] & 1) != 0)
        {
          LODWORD(v3) = 1;
          goto LABEL_12;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  v7 = paired_unlock_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v8 = @"NO";
    if (v3) {
      CFStringRef v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Default paired device nearby = %@", buf, 0xCu);
  }

  return (char)v3;
}

- (id)activeIDSDevice
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(IDSService *)self->_idsService devices];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isActive])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)sendProtocolBufferData:(id)a3 withType:(unsigned __int16)a4 timeout:(id)a5 option:(int64_t)a6 errorHandler:(id)a7
{
}

- (void)sendProtocolBufferData:(id)a3 withType:(unsigned __int16)a4 timeout:(id)a5 option:(int64_t)a6 queueOneID:(id)a7 errorHandler:(id)a8
{
}

- (void)sendProtocolBufferData:(id)a3 withType:(unsigned __int16)a4 timeout:(id)a5 option:(int64_t)a6 dataClass:(int64_t)a7 queueOneID:(id)a8 errorHandler:(id)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  v19 = [(SDUnlockIDSController *)self serviceQueue];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10002B2B4;
  v24[3] = &unk_1008CA618;
  id v25 = v16;
  id v26 = v17;
  unsigned __int16 v32 = a4;
  id v27 = v15;
  v28 = self;
  int64_t v30 = a6;
  int64_t v31 = a7;
  id v29 = v18;
  id v20 = v18;
  id v21 = v15;
  id v22 = v17;
  id v23 = v16;
  dispatch_async(v19, v24);
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  int v5 = [(SDUnlockIDSController *)self serviceQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B6E8;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  int v5 = [(SDUnlockIDSController *)self serviceQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002B7F0;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)updateSendOptions:(id)a3
{
}

- (NSSet)autoUnlockEligibleDevices
{
  id v29 = +[NSMutableSet set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v3 = [(SDUnlockIDSController *)self idsService];
  id v4 = [v3 devices];

  id v5 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v31;
    id v8 = &_mh_execute_header;
    long long v9 = "Skipping unpaired device: %@";
    v28 = v4;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isLocallyPaired", v28) & 1) == 0)
        {
          id v15 = auto_unlock_log();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_16;
          }
          *(_DWORD *)buf = 138412290;
          v35 = v11;
          v24 = (mach_header_64 *)v8;
          id v25 = v15;
          id v26 = v9;
LABEL_15:
          _os_log_impl(v24, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
          goto LABEL_16;
        }
        long long v12 = [v11 modelIdentifier];
        BOOL v13 = sub_1000D35D0(v12);

        if (!v13)
        {
          id v15 = auto_unlock_log();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_16;
          }
          *(_DWORD *)buf = 138412290;
          v35 = v11;
          v24 = (mach_header_64 *)v8;
          id v25 = v15;
          id v26 = "Skipping Unsupported hardware: %@";
          goto LABEL_15;
        }
        v14 = [(SDUnlockIDSController *)self autoUnlockDeviceForIDSDevice:v11];
        id v15 = v14;
        if (v14 && [v14 type] == (id)1)
        {
          id v16 = +[SDStatusMonitor sharedMonitor];
          id v17 = self;
          id v18 = v8;
          v19 = v9;
          id v20 = [v16 deviceKeyBagUnlocked];

          id v21 = +[SDAutoUnlockAKSManager sharedManager];
          id v22 = [v11 uniqueIDOverride];
          id v23 = v20;
          long long v9 = v19;
          id v8 = v18;
          self = v17;
          id v4 = v28;
          -[NSObject setKeyExists:](v15, "setKeyExists:", [v21 ltkExistsForKeyDevice:v22 updateLTKs:v23]);

          [v29 addObject:v15];
        }
LABEL_16:
      }
      id v6 = [v4 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v6);
  }

  return (NSSet *)v29;
}

- (id)autoUnlockDeviceForIDSDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 nsuuid];

  if (v4)
  {
    id v5 = objc_opt_new();
    id v6 = [v3 uniqueIDOverride];
    [v5 setUniqueID:v6];

    uint64_t v7 = [v3 nsuuid];
    [v5 setBluetoothID:v7];

    id v8 = [v3 modelIdentifier];
    [v5 setModelIdentifier:v8];

    long long v9 = [v3 productName];
    [v5 setProductName:v9];

    long long v10 = [v3 productVersion];
    [v5 setProductVersion:v10];

    long long v11 = [v3 productBuildVersion];
    [v5 setProductBuildVersion:v11];

    long long v12 = [v3 name];
    [v5 setName:v12];

    BOOL v13 = [v3 enclosureColor];
    [v5 setEnclosureColor:v13];

    [v5 setDefaultPairedDevice:[v3 isDefaultPairedDevice]];
    [v5 setModelName:@"Apple Watch"];
    if (v3)
    {
      [v3 operatingSystemVersion];
      uint64_t v14 = v38;
      [v3 operatingSystemVersion];
      BOOL v15 = v36 > 3;
    }
    else
    {
      BOOL v15 = 0;
      uint64_t v14 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v35 = 0;
    }
    [v5 setMajorOSVersion:v14, v35, v36, v37, v38, v39, v40];
    id v17 = [v3 modelIdentifier];
    id v18 = sub_1000D361C(v17);
    uint64_t v19 = (uint64_t)[v18 integerValue];

    unsigned int v20 = v14 == 7 && v15;
    if (v14 > 7) {
      unsigned int v20 = 1;
    }
    if (v19 > 2) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = 0;
    }
    [v5 setSupportsApproveWithWatch:v21];
    [v5 setSupportsApproveIcon:[v5 supportsApproveWithWatch]];
    id v22 = +[SDAutoUnlockAKSManager sharedManager];
    id v23 = [v3 uniqueIDOverride];
    unsigned int v24 = [v22 sessionKeyExistsForDeviceID:v23];

    id v25 = +[SDAutoUnlockAKSManager sharedManager];
    id v26 = [v25 deviceIDsMissingSessionKey];
    id v27 = [v3 uniqueIDOverride];
    unsigned int v28 = [v26 containsObject:v27];

    [v5 setSupportsEncryption:v24 & (v28 ^ 1)];
    id v29 = +[SDAutoUnlockAKSManager sharedManager];
    long long v30 = [v3 uniqueIDOverride];
    id v31 = [v29 deviceEnabledAsKey:v30];

    [v5 setUnlockEnabled:v31];
    uint64_t v32 = [v3 nsuuid];
    id v16 = v32;
    if (v32 && (v31 & 1) != 0)
    {
      long long v33 = [v5 proxyBluetoothID];
      [v5 setBluetoothCloudPaired:v33 != 0];
    }
    else
    {
      [v5 setBluetoothCloudPaired:v32 != 0];
    }
  }
  else
  {
    id v16 = auto_unlock_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10002C910((uint64_t)v3, v16);
    }
    id v5 = 0;
  }

  return v5;
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5 = a4;
  id v6 = paired_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 valueForKeyPath:@"@unionOfObjects.uniqueID"];
    id v8 = SFCompactStringFromCollection();
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "nearbyDevicesChanged %@", buf, 0xCu);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v9 = [(SDUnlockIDSController *)self delegates];
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      BOOL v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
        if (objc_opt_respondsToSelector()) {
          [v14 idsControllerNearbyStateChanged:self];
        }
        BOOL v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)serviceSpaceDidBecomeAvailable:(id)a3
{
  id v4 = paired_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Space became avaliable", buf, 2u);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(SDUnlockIDSController *)self delegates];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 idsControllerSpaceDidBecomeAvailable:self];
        }
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a7;
  id v14 = a4;
  id v15 = a3;
  long long v16 = paired_unlock_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v17 = @"NO";
    *(_DWORD *)buf = 138412802;
    if (v8) {
      CFStringRef v17 = @"YES";
    }
    CFStringRef v23 = v17;
    __int16 v24 = 2112;
    id v25 = v12;
    __int16 v26 = 2112;
    id v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "success = %@, identifier = %@, error = %@", buf, 0x20u);
  }

  v21.receiver = self;
  v21.super_class = (Class)SDUnlockIDSController;
  [(SDUnlockTransport *)&v21 service:v15 account:v14 identifier:v12 didSendWithSuccess:v8 error:v13];

  if (!v8)
  {
    uint64_t v18 = [(NSMutableDictionary *)self->_errorHandlers objectForKeyedSubscript:v12];
    uint64_t v19 = (void *)v18;
    if (v18)
    {
      (*(void (**)(uint64_t, id))(v18 + 16))(v18, v13);
    }
    else
    {
      unsigned int v20 = paired_unlock_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10002C988(v20);
      }
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = paired_unlock_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = [v11 type];
    id v15 = [v11 data];
    unsigned int v16 = [v15 length];
    CFStringRef v17 = [v11 data];
    *(_DWORD *)buf = 67109634;
    unsigned int v36 = v14;
    __int16 v37 = 1024;
    unsigned int v38 = v16;
    __int16 v39 = 2112;
    uint64_t v40 = v17;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Incoming protobuf (type = %d, size = %u, data = %@)", buf, 0x18u);
  }
  uint64_t v18 = [v10 deviceForFromID:v12];
  id v29 = [v18 uniqueIDOverride];

  if (v11)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v19 = [(SDUnlockIDSController *)self delegates];
    id v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v20)
    {
      id v21 = v20;
      id v27 = v12;
      id v28 = v10;
      uint64_t v22 = *(void *)v31;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          __int16 v24 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            id v25 = [v11 data];
            [v24 idsController:self didReceiveProtoData:v25 forType:[v11 type]];
          }
          if (objc_opt_respondsToSelector())
          {
            __int16 v26 = [v11 data];
            [v24 idsController:self didReceiveProtoData:v26 forType:[v11 type] deviceID:v29];
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v21);
      id v12 = v27;
      id v10 = v28;
    }
  }
  else
  {
    uint64_t v19 = paired_unlock_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10002C9CC(v19);
    }
  }
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  id v6 = a4;
  id v7 = (void (**)(void))a5;
  BOOL v8 = paired_unlock_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "didSwitchActivePairedDevice %@", (uint8_t *)&v9, 0xCu);
  }

  v7[2](v7);
}

- (id)dataClassStringForDataClass:(int64_t)a3
{
  CFStringRef v3 = @"Unknown";
  if (a3 == 2) {
    CFStringRef v3 = @"SDUnlockSendDataClassClassA";
  }
  if (a3 == 1) {
    return @"SDUnlockSendDataClassClassD";
  }
  else {
    return (id)v3;
  }
}

- (id)autoUnlockService
{
  return self->_autoUnlockService;
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (IDSService)idsService
{
  return (IDSService *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIdsService:(id)a3
{
}

- (IDSService)idsServiceClassA
{
  return (IDSService *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIdsServiceClassA:(id)a3
{
}

- (NSMutableDictionary)errorHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setErrorHandlers:(id)a3
{
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_errorHandlers, 0);
  objc_storeStrong((id *)&self->_idsServiceClassA, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);

  objc_storeStrong((id *)&self->_autoUnlockService, 0);
}

@end