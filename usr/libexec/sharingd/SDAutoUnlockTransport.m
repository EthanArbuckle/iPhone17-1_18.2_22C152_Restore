@interface SDAutoUnlockTransport
+ (id)sharedTransport;
- (BOOL)activityServiceHasWatch;
- (BOOL)appleWatchExisted;
- (BOOL)canRetryCloudPairingForDeviceID:(id)a3 useShortDate:(BOOL)a4;
- (BOOL)deviceNearby;
- (BOOL)disableEncryption;
- (BOOL)isDeviceSatellitePaired;
- (BOOL)localDeviceIDSRegistered;
- (BOOL)macVersionEligibleForDeviceID:(id)a3;
- (BOOL)pairingRequestIsValidForDeviceID:(id)a3 messageContext:(id)a4;
- (BOOL)showIDInName;
- (BOOL)showOtherDevices;
- (BOOL)watchSeenRecently;
- (BOOL)watchVersionEligibleForDevice:(id)a3;
- (IDSService)activityService;
- (IDSService)idsService;
- (NSDate)lastSeenWatchDate;
- (NSDate)lastSendDate;
- (NSMapTable)clientMap;
- (NSMutableDictionary)autoUnlockDeviceCache;
- (NSMutableDictionary)cachedBluetoothIDToUniqueIDs;
- (NSMutableDictionary)cloudPairRetryRecords;
- (NSMutableDictionary)completionHandlers;
- (NSMutableDictionary)sendDates;
- (NSMutableDictionary)sendIdentifierToSessionID;
- (NSNumber)watchCurrentlyInList;
- (NSNumber)watchExistedInUnlockList;
- (NSSet)cachedApproveBluetoothIDs;
- (OS_dispatch_queue)clientQueue;
- (OS_dispatch_queue)transportQueue;
- (SDAutoUnlockTransport)init;
- (SDAutoUnlockTransportClient)primaryClient;
- (id)activeDevice;
- (id)approveBluetoothIDs;
- (id)autoUnlockDeviceForBluetoothID:(id)a3;
- (id)autoUnlockDeviceForBluetoothID:(id)a3 cached:(BOOL)a4;
- (id)autoUnlockDeviceForDeviceID:(id)a3;
- (id)autoUnlockDeviceForIDSDevice:(id)a3;
- (id)autoUnlockDeviceForIDSDevice:(id)a3 cloudPaired:(BOOL)a4 cached:(BOOL)a5;
- (id)autoUnlockEligibleDevicesWithCloudPairing:(BOOL)a3 deviceType:(int64_t)a4;
- (id)autoUnlockEligibleWatches;
- (id)autoUnlockEligibleWatchesWithCloudPairing:(BOOL)a3;
- (id)autoUnlockService;
- (id)bluetoothDeviceIdentifiers;
- (id)bluetoothIDForIDSID:(id)a3;
- (id)cachedIDSDeviceIDsForBluetoothID:(id)a3;
- (id)connectionCacheDevices;
- (id)dataFromUUID:(id)a3;
- (id)deviceNameForDeviceID:(id)a3;
- (id)devicesWithLTKs;
- (id)enabledAutoUnlockDevices;
- (id)enabledAutoUnlockDevicesUsingCache:(BOOL)a3;
- (id)enabledAutoUnlockLockDevices;
- (id)idsDeviceForBluetoothID:(id)a3;
- (id)idsDeviceForUniqueID:(id)a3;
- (id)idsDeviceIDsForBluetoothID:(id)a3;
- (id)idsDevicesIDs;
- (id)idsMacDeviceIDs;
- (id)modelIdentifierForDeviceID:(id)a3;
- (id)modelNameForDevice:(id)a3;
- (id)nameForDevice:(id)a3;
- (id)nanoRegistryDeviceForBluetoothIdentifier:(id)a3;
- (id)onqueue_autoUnlockEligibleDevices:(BOOL)a3 deviceType:(int64_t)a4;
- (id)onqueue_bluetoothDeviceIdentifiers;
- (id)onqueue_bluetoothIDForIDSID:(id)a3;
- (id)onqueue_devicesWithLTKs;
- (id)onqueue_enabledAutoUnlockDevicesUsingCache:(BOOL)a3;
- (id)pairedAutoUnlockDevice;
- (id)pairedDeviceID;
- (id)placeholderDevice;
- (id)proxyBluetoothDeviceIDForDeviceID:(id)a3;
- (id)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 wantsACK:(BOOL)a8 timeout:(id)a9 completion:(id)a10;
- (id)stableBluetoothIdentifierForIDSDevice:(id)a3;
- (id)state;
- (id)transferDataFromPayload:(id)a3 sessionID:(id)a4;
- (int64_t)deviceTypeForDevice:(id)a3;
- (int64_t)deviceTypeForDeviceID:(id)a3;
- (void)addClient:(id)a3 forIdentifer:(id)a4;
- (void)clearAutoUnlockDeviceCache;
- (void)handleSuccessfulMessageSentWithIdentifier:(id)a3 sessionID:(id)a4;
- (void)loadCloudPairRetries;
- (void)logBluetoothIDCache;
- (void)logDevices;
- (void)refreshAutoUnlockDeviceCache;
- (void)removeClientForIdentifier:(id)a3;
- (void)resetAppleWatchExisted;
- (void)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 timeout:(id)a8 completion:(id)a9;
- (void)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 timeout:(id)a8 errorHandler:(id)a9;
- (void)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 timeout:(id)a7 errorHandler:(id)a8;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setActivityService:(id)a3;
- (void)setAutoUnlockDeviceCache:(id)a3;
- (void)setCachedApproveBluetoothIDs:(id)a3;
- (void)setCachedBluetoothIDToUniqueIDs:(id)a3;
- (void)setClientMap:(id)a3;
- (void)setClientQueue:(id)a3;
- (void)setCloudPairRetryRecords:(id)a3;
- (void)setCompletionHandlers:(id)a3;
- (void)setIdsService:(id)a3;
- (void)setLastSeenWatchDate:(id)a3;
- (void)setLastSendDate:(id)a3;
- (void)setPrimaryClient:(id)a3;
- (void)setSendDates:(id)a3;
- (void)setSendIdentifierToSessionID:(id)a3;
- (void)setTransportQueue:(id)a3;
- (void)setWatchCurrentlyInList:(id)a3;
- (void)setWatchExistedInUnlockList:(id)a3;
- (void)updateApproveBluetoothIDs;
- (void)updateBluetoothIDCache;
- (void)updateRetryDatesForDeviceIDs:(id)a3;
@end

@implementation SDAutoUnlockTransport

+ (id)sharedTransport
{
  if (qword_1009801F0 != -1) {
    dispatch_once(&qword_1009801F0, &stru_1008CF180);
  }
  v2 = (void *)qword_1009801E8;

  return v2;
}

- (SDAutoUnlockTransport)init
{
  v24.receiver = self;
  v24.super_class = (Class)SDAutoUnlockTransport;
  v2 = [(SDUnlockTransport *)&v24 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    sendDates = v2->_sendDates;
    v2->_sendDates = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    autoUnlockDeviceCache = v2->_autoUnlockDeviceCache;
    v2->_autoUnlockDeviceCache = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    sendIdentifierToSessionID = v2->_sendIdentifierToSessionID;
    v2->_sendIdentifierToSessionID = (NSMutableDictionary *)v9;

    v11 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:0x10000 valueOptions:5 capacity:0];
    clientMap = v2->_clientMap;
    v2->_clientMap = v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.sharingd.auto-unlock.transport-client-queue", 0);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.sharingd.auto-unlock.transport-queue", 0);
    transportQueue = v2->_transportQueue;
    v2->_transportQueue = (OS_dispatch_queue *)v15;

    v17 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.continuity.unlock"];
    idsService = v2->_idsService;
    v2->_idsService = v17;

    v19 = v2->_idsService;
    v20 = [(SDAutoUnlockTransport *)v2 transportQueue];
    [(IDSService *)v19 addDelegate:v2 queue:v20];

    v21 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.continuity.activity"];
    activityService = v2->_activityService;
    v2->_activityService = v21;

    objc_storeStrong((id *)&v2->_autoUnlockService, v2->_idsService);
    [(SDAutoUnlockTransport *)v2 loadCloudPairRetries];
    [(SDAutoUnlockTransport *)v2 updateBluetoothIDCache];
  }
  return v2;
}

- (void)addClient:(id)a3 forIdentifer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SDAutoUnlockTransport *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018F704;
  block[3] = &unk_1008CAF18;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)removeClientForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SDAutoUnlockTransport *)self clientQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10018F80C;
  v7[3] = &unk_1008CA640;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)logDevices
{
  uint64_t v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SDAutoUnlockTransport *)self idsService];
    uint64_t v5 = [v4 devices];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "IDS Devices: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)refreshAutoUnlockDeviceCache
{
  [(SDAutoUnlockTransport *)self clearAutoUnlockDeviceCache];
  id v3 = [(SDAutoUnlockTransport *)self enabledAutoUnlockDevicesUsingCache:0];
}

- (void)clearAutoUnlockDeviceCache
{
  id v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Clearing Auto Unlock device cache", v5, 2u);
  }

  id v4 = [(SDAutoUnlockTransport *)self autoUnlockDeviceCache];
  [v4 removeAllObjects];
}

- (id)bluetoothIDForIDSID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  dispatch_queue_t v15 = sub_10018FD08;
  v16 = sub_10018FD18;
  id v17 = 0;
  uint64_t v5 = [(SDAutoUnlockTransport *)self transportQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018FD20;
  block[3] = &unk_1008CD678;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)onqueue_bluetoothIDForIDSID:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [(SDAutoUnlockTransport *)self idsService];
  id v6 = [v5 devices];

  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [v12 uniqueID];
        unsigned int v14 = [v13 isEqualToString:v4];

        if (v14)
        {
          uint64_t v15 = [v12 nsuuid];

          id v9 = (void *)v15;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)bluetoothDeviceIdentifiers
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_10018FD08;
  v11 = sub_10018FD18;
  id v12 = &__NSArray0__struct;
  id v3 = [(SDAutoUnlockTransport *)self transportQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100190010;
  v6[3] = &unk_1008CC368;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)onqueue_bluetoothDeviceIdentifiers
{
  id v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(SDAutoUnlockTransport *)self idsService];
  uint64_t v5 = [v4 devices];

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 nsuuid];
        if ([v10 supportsHandoff]) {
          BOOL v12 = v11 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12) {
          [v3 addObject:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)pairedDeviceID
{
  v2 = [(SDAutoUnlockTransport *)self activeDevice];
  id v3 = [v2 uniqueIDOverride];

  return v3;
}

- (id)pairedAutoUnlockDevice
{
  id v3 = [(SDAutoUnlockTransport *)self activeDevice];
  id v4 = [(SDAutoUnlockTransport *)self autoUnlockDeviceForIDSDevice:v3];

  return v4;
}

- (id)activeDevice
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(SDAutoUnlockTransport *)self idsService];
  id v3 = [v2 devices];

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 isActive])
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)isDeviceSatellitePaired
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  id v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  uint64_t v5 = [v4 firstObject];

  id v6 = [v5 valueForProperty:NRDevicePropertyIsAltAccount];
  LOBYTE(v3) = [v6 BOOLValue];

  return (char)v3;
}

- (BOOL)deviceNearby
{
  v2 = [(SDAutoUnlockTransport *)self activeDevice];
  unsigned __int8 v3 = [v2 isNearby];

  return v3;
}

- (id)idsDevicesIDs
{
  unsigned __int8 v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(SDAutoUnlockTransport *)self idsService];
  uint64_t v5 = [v4 devices];

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) uniqueIDOverride];
        [v3 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)idsMacDeviceIDs
{
  unsigned __int8 v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(SDAutoUnlockTransport *)self idsService];
  uint64_t v5 = [v4 devices];

  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v11 = [v10 modelIdentifier];
        long long v12 = [v11 lowercaseString];
        unsigned int v13 = [v12 containsString:@"mac"];

        if (v13)
        {
          long long v14 = [v10 uniqueIDOverride];
          [v3 addObject:v14];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)deviceNameForDeviceID:(id)a3
{
  unsigned __int8 v3 = [(SDAutoUnlockTransport *)self idsDeviceForUniqueID:a3];
  id v4 = [v3 name];

  return v4;
}

- (int64_t)deviceTypeForDeviceID:(id)a3
{
  id v4 = [(SDAutoUnlockTransport *)self idsDeviceForUniqueID:a3];
  int64_t v5 = [(SDAutoUnlockTransport *)self deviceTypeForDevice:v4];

  return v5;
}

- (int64_t)deviceTypeForDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 modelIdentifier];
  int64_t v5 = [v4 lowercaseString];
  unsigned __int8 v6 = [v5 containsString:@"watch"];

  if (v6)
  {
    int64_t v7 = 1;
  }
  else
  {
    uint64_t v8 = [v3 modelIdentifier];
    long long v9 = [v8 lowercaseString];
    unsigned __int8 v10 = [v9 containsString:@"iphone"];

    if (v10)
    {
      int64_t v7 = 2;
    }
    else
    {
      long long v11 = [v3 modelIdentifier];
      long long v12 = [v11 lowercaseString];
      unsigned __int8 v13 = [v12 containsString:@"ipad"];

      if (v13)
      {
        int64_t v7 = 3;
      }
      else
      {
        long long v14 = [v3 modelIdentifier];
        long long v15 = [v14 lowercaseString];
        unsigned int v16 = [v15 containsString:@"reality"];

        if (v16) {
          int64_t v7 = 5;
        }
        else {
          int64_t v7 = 4;
        }
      }
    }
  }

  return v7;
}

- (id)modelIdentifierForDeviceID:(id)a3
{
  id v3 = [(SDAutoUnlockTransport *)self idsDeviceForUniqueID:a3];
  id v4 = [v3 modelIdentifier];

  return v4;
}

- (id)autoUnlockDeviceForDeviceID:(id)a3
{
  id v4 = [(SDAutoUnlockTransport *)self idsDeviceForUniqueID:a3];
  if (v4)
  {
    int64_t v5 = [(SDAutoUnlockTransport *)self autoUnlockDeviceForIDSDevice:v4];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)autoUnlockDeviceForBluetoothID:(id)a3
{
  return [(SDAutoUnlockTransport *)self autoUnlockDeviceForBluetoothID:a3 cached:0];
}

- (id)autoUnlockDeviceForBluetoothID:(id)a3 cached:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned __int8 v6 = [(SDAutoUnlockTransport *)self idsDeviceForBluetoothID:a3];
  if (v6)
  {
    int64_t v7 = [(SDAutoUnlockTransport *)self autoUnlockDeviceForIDSDevice:v6 cloudPaired:0 cached:v4];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)devicesWithLTKs
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unsigned __int8 v10 = sub_10018FD08;
  long long v11 = sub_10018FD18;
  id v12 = 0;
  id v12 = (id)objc_opt_new();
  id v3 = [(SDAutoUnlockTransport *)self transportQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100190B68;
  v6[3] = &unk_1008CC368;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)onqueue_devicesWithLTKs
{
  id v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(SDAutoUnlockTransport *)self idsService];
  int64_t v5 = [v4 devices];

  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v11 = +[SDAutoUnlockAKSManager sharedManager];
        id v12 = [v10 uniqueIDOverride];
        unsigned int v13 = [v11 ltkExistsForKeyDevice:v12];

        if (v13)
        {
          long long v14 = [v10 uniqueIDOverride];
          [v3 addObject:v14];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)autoUnlockEligibleWatches
{
  return [(SDAutoUnlockTransport *)self autoUnlockEligibleWatchesWithCloudPairing:1];
}

- (id)autoUnlockEligibleWatchesWithCloudPairing:(BOOL)a3
{
  return [(SDAutoUnlockTransport *)self autoUnlockEligibleDevicesWithCloudPairing:a3 deviceType:1];
}

- (id)autoUnlockEligibleDevicesWithCloudPairing:(BOOL)a3 deviceType:(int64_t)a4
{
  uint64_t v12 = 0;
  unsigned int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  long long v15 = sub_10018FD08;
  long long v16 = sub_10018FD18;
  id v17 = 0;
  id v17 = (id)objc_opt_new();
  id v7 = [(SDAutoUnlockTransport *)self transportQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100190EA4;
  v10[3] = &unk_1008CF1A8;
  v10[4] = self;
  v10[5] = &v12;
  BOOL v11 = a3;
  v10[6] = a4;
  dispatch_sync(v7, v10);

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

- (id)onqueue_autoUnlockEligibleDevices:(BOOL)a3 deviceType:(int64_t)a4
{
  BOOL v5 = a3;
  v44 = (void *)sub_1000D91F0(@"AUDeviceBlackList");
  v43 = objc_opt_new();
  [(SDAutoUnlockTransport *)self clearAutoUnlockDeviceCache];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v7 = [(SDAutoUnlockTransport *)self idsService];
  id v8 = [v7 devices];

  id obj = v8;
  id v9 = [v8 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v49;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(obj);
        }
        unsigned int v13 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        uint64_t v14 = [(SDAutoUnlockTransport *)self autoUnlockDeviceForIDSDevice:v13 cloudPaired:v5 cached:0];
        long long v15 = v14;
        if (v14)
        {
          if ([v14 type] == (id)a4
            || [(SDAutoUnlockTransport *)self showOtherDevices])
          {
            if (a4 == 1
              && ![(SDAutoUnlockTransport *)self watchVersionEligibleForDevice:v13])
            {
              long long v18 = auto_unlock_log();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
                sub_100195F5C(&v46, v47, v18);
              }
            }
            else
            {
LABEL_11:
              long long v16 = [v15 uniqueID];
              unsigned int v17 = [v44 containsObject:v16];

              if (!v17)
              {
                long long v20 = +[SDStatusMonitor sharedMonitor];
                id v21 = [v20 deviceKeyBagUnlocked];

                v22 = +[SDAutoUnlockAKSManager sharedManager];
                v23 = [v13 uniqueIDOverride];
                [v15 setKeyExists:[v22 ltkExistsForKeyDevice:v23 updateLTKs:v21]];

                [v43 addObject:v15];
                goto LABEL_22;
              }
              long long v18 = auto_unlock_log();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                long long v19 = [v15 uniqueID];
                *(_DWORD *)buf = 138412290;
                v53 = v19;
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Skipping device in blacklist (device ID: %@)", buf, 0xCu);
              }
            }

            goto LABEL_22;
          }
          if (a4 == 5 && [v15 type] == (id)3 && (_os_feature_enabled_impl() & 1) != 0) {
            goto LABEL_11;
          }
        }
LABEL_22:
      }
      id v10 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v10);
  }

  if (a4 == 1)
  {
    id v24 = [v43 count];
    v25 = [(SDAutoUnlockTransport *)self lastSeenWatchDate];
    v26 = v25;
    if (v24)
    {

      if (!v26)
      {
        v27 = auto_unlock_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Updating last seen date", buf, 2u);
        }

        v28 = objc_opt_new();
        [(SDAutoUnlockTransport *)self setLastSeenWatchDate:v28];
      }
      v29 = [(SDAutoUnlockTransport *)self watchCurrentlyInList];
      unsigned __int8 v30 = [v29 BOOLValue];

      if ((v30 & 1) == 0)
      {
        v31 = auto_unlock_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Watch added to list -- updating watchCurrentlyInList and lastSeenWatchDate", buf, 2u);
        }

        [(SDAutoUnlockTransport *)self setWatchCurrentlyInList:&__kCFBooleanTrue];
        v32 = objc_opt_new();
        [(SDAutoUnlockTransport *)self setLastSeenWatchDate:v32];
      }
      v33 = [(SDAutoUnlockTransport *)self watchExistedInUnlockList];
      unsigned __int8 v34 = [v33 BOOLValue];

      if ((v34 & 1) == 0)
      {
        v35 = auto_unlock_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Updating existed in list", buf, 2u);
        }

        [(SDAutoUnlockTransport *)self setWatchExistedInUnlockList:&__kCFBooleanTrue];
      }
    }
    else
    {

      if (v26)
      {
        v36 = [(SDAutoUnlockTransport *)self watchCurrentlyInList];
        unsigned int v37 = [v36 BOOLValue];

        if (!v37) {
          goto LABEL_48;
        }
        v38 = auto_unlock_log();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Last watch removed from list -- updating watchCurrentlyInList and lastSeenWatchDate", buf, 2u);
        }

        [(SDAutoUnlockTransport *)self setWatchCurrentlyInList:&__kCFBooleanFalse];
      }
      else
      {
        if (![(SDAutoUnlockTransport *)self activityServiceHasWatch]) {
          goto LABEL_48;
        }
        v39 = auto_unlock_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Activity service has a Watch updating last seen date", buf, 2u);
        }
      }
      v40 = objc_opt_new();
      [(SDAutoUnlockTransport *)self setLastSeenWatchDate:v40];
    }
  }
LABEL_48:
  id v41 = [v43 copy];

  return v41;
}

- (id)enabledAutoUnlockDevices
{
  return [(SDAutoUnlockTransport *)self enabledAutoUnlockDevicesUsingCache:0];
}

- (id)enabledAutoUnlockDevicesUsingCache:(BOOL)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  unsigned int v13 = sub_10018FD08;
  uint64_t v14 = sub_10018FD18;
  id v15 = 0;
  id v15 = (id)objc_opt_new();
  BOOL v5 = [(SDAutoUnlockTransport *)self transportQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100191618;
  block[3] = &unk_1008CF1D0;
  block[4] = self;
  void block[5] = &v10;
  BOOL v9 = a3;
  dispatch_sync(v5, block);

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)onqueue_enabledAutoUnlockDevicesUsingCache:(BOOL)a3
{
  BOOL v26 = a3;
  v25 = (void *)sub_1000D91F0(@"AUDeviceBlackList");
  id v24 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = [(SDAutoUnlockTransport *)self idsService];
  BOOL v5 = [v4 devices];

  id v6 = [v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v28;
    *(void *)&long long v7 = 138412290;
    long long v23 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v12 = +[SDAutoUnlockAKSManager sharedManager];
        unsigned int v13 = [v11 uniqueIDOverride];
        unsigned int v14 = [v12 ltkExistsForKeyDevice:v13 updateLTKs:0];

        if (v14)
        {
          id v15 = [(SDAutoUnlockTransport *)self autoUnlockDeviceForIDSDevice:v11 cloudPaired:1 cached:v26];
          long long v16 = v15;
          if (v15 && [v15 unlockEnabled])
          {
            unsigned int v17 = [v16 uniqueID];
            unsigned int v18 = [v25 containsObject:v17];

            if (v18)
            {
              long long v19 = auto_unlock_log();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                long long v20 = [v16 uniqueID];
                *(_DWORD *)buf = v23;
                v32 = v20;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Skipping enabled device in blacklist (device ID: %@)", buf, 0xCu);
              }
            }
            else
            {
              [v24 addObject:v16];
            }
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v8);
  }

  id v21 = [v24 copy];

  return v21;
}

- (id)enabledAutoUnlockLockDevices
{
  id v3 = objc_opt_new();
  id v4 = [(SDAutoUnlockTransport *)self transportQueue];
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  uint64_t v10 = sub_1001919C4;
  uint64_t v11 = &unk_1008CA640;
  uint64_t v12 = self;
  id v13 = v3;
  id v5 = v3;
  dispatch_sync(v4, &v8);

  id v6 = [v5 copy:v8, v9, v10, v11, v12];

  return v6;
}

- (id)autoUnlockDeviceForIDSDevice:(id)a3
{
  return [(SDAutoUnlockTransport *)self autoUnlockDeviceForIDSDevice:a3 cloudPaired:1 cached:0];
}

- (id)autoUnlockDeviceForIDSDevice:(id)a3 cloudPaired:(BOOL)a4 cached:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [(SDAutoUnlockTransport *)self stableBluetoothIdentifierForIDSDevice:v8];
  uint64_t v10 = [(SDAutoUnlockTransport *)self nameForDevice:v8];
  if (!v8
    || ([v8 uniqueIDOverride], uint64_t v11 = objc_claimAutoreleasedReturnValue(), v11, !v11))
  {
    long long v20 = auto_unlock_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_100195F9C(v20);
    }
    goto LABEL_16;
  }
  if ([v8 deviceType] == (id)6)
  {
    if (([v8 isLocallyPaired] & 1) == 0)
    {
      long long v20 = auto_unlock_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_1001960C8();
      }
      goto LABEL_16;
    }
    uint64_t v12 = [v8 modelIdentifier];
    BOOL v13 = sub_1000D35D0(v12);

    if (!v13)
    {
      long long v20 = auto_unlock_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_100196054();
      }
      goto LABEL_16;
    }
    unsigned int v14 = [v9 UUIDString];
    id v15 = [(SDAutoUnlockTransport *)self nanoRegistryDeviceForBluetoothIdentifier:v14];

    uint64_t v16 = [v15 valueForProperty:NRDevicePropertyName];
    unsigned int v17 = (void *)v16;
    if (v16) {
      unsigned int v18 = (void *)v16;
    }
    else {
      unsigned int v18 = v10;
    }
    id v19 = v18;

    uint64_t v10 = v19;
  }
  if (v6 && !v9)
  {
    long long v20 = auto_unlock_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100195FE0();
    }
LABEL_16:
    id v21 = 0;
LABEL_17:

    goto LABEL_18;
  }
  if (v5)
  {
    long long v23 = [(SDAutoUnlockTransport *)self autoUnlockDeviceCache];
    id v24 = [v8 uniqueIDOverride];
    id v21 = [v23 objectForKeyedSubscript:v24];

    v25 = auto_unlock_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v21;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Using cached device: %@", buf, 0xCu);
    }

    if (v21) {
      goto LABEL_52;
    }
  }
  id v21 = objc_opt_new();
  BOOL v26 = [v8 uniqueIDOverride];
  [v21 setUniqueID:v26];

  [v21 setBluetoothID:v9];
  long long v27 = [v8 modelIdentifier];
  [v21 setModelIdentifier:v27];

  long long v28 = [v8 productName];
  [v21 setProductName:v28];

  long long v29 = [v8 productVersion];
  [v21 setProductVersion:v29];

  long long v30 = [v8 productBuildVersion];
  [v21 setProductBuildVersion:v30];

  [v21 setName:v10];
  v31 = [v8 enclosureColor];
  [v21 setEnclosureColor:v31];

  [v21 setDefaultPairedDevice:[v8 isDefaultPairedDevice]];
  v32 = [(SDAutoUnlockTransport *)self modelNameForDevice:v8];
  [v21 setModelName:v32];

  [v8 operatingSystemVersion];
  [v8 operatingSystemVersion];
  BOOL v33 = v60 > 3 && v61 == 7;
  unsigned int v34 = v61 > 7 || v33;
  [v21 setMajorOSVersion:v61];
  [v21 setSupportsAlwaysDirect:v61 > 3];
  v35 = [v8 modelIdentifier];
  v36 = sub_1000D361C(v35);
  uint64_t v59 = (uint64_t)[v36 integerValue];

  uint64_t v37 = v59 > 2 ? v34 : 0;
  [v21 setSupportsApproveWithWatch:v37];
  int v38 = sub_1000D9060(@"AUForceApproveLabel", 0);
  unsigned int v39 = [v21 supportsApproveWithWatch];
  uint64_t v40 = v38 ? 0 : v39;
  [v21 setSupportsApproveIcon:v40];
  id v41 = +[SDAutoUnlockAKSManager sharedManager];
  v42 = [v8 uniqueIDOverride];
  unsigned int v58 = [v41 sessionKeyExistsForDeviceID:v42];

  v43 = +[SDAutoUnlockAKSManager sharedManager];
  v44 = [v43 deviceIDsMissingSessionKey];
  v45 = [v8 uniqueIDOverride];
  unsigned int v46 = [v44 containsObject:v45] ^ 1;
  unsigned int v47 = v61 > 3 ? v46 : 0;

  [v21 setSupportsEncryption:v58 & ~-[SDAutoUnlockTransport disableEncryption](self, "disableEncryption") & v47];
  [v21 setSupportsAdvertisingUnlocked:v61 > 4];
  unsigned int v48 = sub_1000D2868();
  uint64_t v49 = v61 > 6 ? v48 : 0;
  [v21 setSupportsConnectionCache:v49];
  [v21 setSupportsHEIC:v59 > 3];
  long long v50 = +[SDAutoUnlockAKSManager sharedManager];
  long long v51 = [v8 uniqueIDOverride];
  id v52 = [v50 deviceEnabledAsKeyForIDSDeviceID:v51];

  [v21 setCanUnlockDevice:v52];
  v53 = +[SDAutoUnlockAKSManager sharedManager];
  v54 = [v8 uniqueIDOverride];
  id v55 = [v53 deviceEnabledAsKey:v54];

  [v21 setUnlockEnabled:v55];
  if (!v9) {
    goto LABEL_50;
  }
  if (v55)
  {
    v56 = [v21 proxyBluetoothID];
    [v21 setBluetoothCloudPaired:v56 != 0];
  }
  else
  {
LABEL_50:
    [v21 setBluetoothCloudPaired:v9 != 0];
  }
  if (v21)
  {
LABEL_52:
    long long v20 = [(SDAutoUnlockTransport *)self autoUnlockDeviceCache];
    v57 = [v21 uniqueID];
    [v20 setObject:v21 forKeyedSubscript:v57];

    goto LABEL_17;
  }
LABEL_18:

  return v21;
}

- (id)approveBluetoothIDs
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(SDAutoUnlockTransport *)v2 cachedApproveBluetoothIDs];

  if (!v3) {
    [(SDAutoUnlockTransport *)v2 updateApproveBluetoothIDs];
  }
  id v4 = [(SDAutoUnlockTransport *)v2 cachedApproveBluetoothIDs];
  objc_sync_exit(v2);

  return v4;
}

- (void)updateApproveBluetoothIDs
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_opt_new();
  [(SDAutoUnlockTransport *)v2 enabledAutoUnlockDevices];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v8, "supportsApproveWithWatch", (void)v16))
        {
          uint64_t v9 = [v8 bluetoothID];
          [v3 addObject:v9];
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [(SDAutoUnlockTransport *)v2 cachedApproveBluetoothIDs];
  [(SDAutoUnlockTransport *)v2 setCachedApproveBluetoothIDs:v3];

  objc_sync_exit(v2);
  uint64_t v11 = [(SDAutoUnlockTransport *)v2 cachedApproveBluetoothIDs];
  unsigned __int8 v12 = [v10 isEqualToSet:v11];

  if ((v12 & 1) == 0)
  {
    BOOL v13 = auto_unlock_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = [(SDAutoUnlockTransport *)v2 cachedApproveBluetoothIDs];
      *(_DWORD *)buf = 138412290;
      id v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updated approve bluetooth IDs: %@", buf, 0xCu);
    }
    id v15 = +[NSNotificationCenter defaultCenter];
    [v15 postNotificationName:@"ApproveBluetoothIDsChanged" object:0];
  }
}

- (id)modelNameForDevice:(id)a3
{
  int64_t v3 = [(SDAutoUnlockTransport *)self deviceTypeForDevice:a3];
  if ((unint64_t)(v3 - 1) > 3) {
    return &stru_1008E7020;
  }
  else {
    return off_1008CF218[v3 - 1];
  }
}

- (BOOL)watchVersionEligibleForDevice:(id)a3
{
  id v3 = a3;
  id v4 = auto_unlock_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
    {
      [v3 operatingSystemVersion];
      int v5 = v9;
    }
    else
    {
      int v5 = 0;
    }
    *(_DWORD *)buf = 67109120;
    int v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device version: %d", buf, 8u);
  }

  if (v3)
  {
    [v3 operatingSystemVersion];
    BOOL v6 = v8 > 2;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)macVersionEligibleForDeviceID:(id)a3
{
  id v4 = a3;
  int v5 = [(SDAutoUnlockTransport *)self idsDeviceForUniqueID:v4];
  BOOL v6 = [v5 modelIdentifier];
  int v7 = GestaltProductTypeStringToDeviceClass();

  if (!v5)
  {
    uint64_t v10 = auto_unlock_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_10019613C();
    }

    goto LABEL_19;
  }
  if (v7 == 1)
  {
    int v11 = auto_unlock_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      [v5 operatingSystemVersion];
      [v5 operatingSystemVersion];
      *(_DWORD *)buf = 67109376;
      int v25 = v18;
      __int16 v26 = 1024;
      int v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Remote iOS major version: %d and minor version: %d", buf, 0xEu);
    }

    [v5 operatingSystemVersion];
    if (v16 <= 14)
    {
      [v5 operatingSystemVersion];
      if (v15 == 14)
      {
        [v5 operatingSystemVersion];
        BOOL v9 = v14 >= 0;
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  if (v7 != 100)
  {
    unsigned __int8 v12 = auto_unlock_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_1001961B0((uint64_t)v4, v7, v12);
    }

    goto LABEL_19;
  }
  uint64_t v8 = auto_unlock_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [v5 operatingSystemVersion];
    [v5 operatingSystemVersion];
    *(_DWORD *)buf = 67109376;
    int v25 = v23;
    __int16 v26 = 1024;
    int v27 = v22;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Remote MacOS major version: %d and minor version: %d", buf, 0xEu);
  }

  [v5 operatingSystemVersion];
  if (v21 > 10)
  {
LABEL_15:
    BOOL v9 = 1;
    goto LABEL_20;
  }
  [v5 operatingSystemVersion];
  if (v20 != 10)
  {
LABEL_19:
    BOOL v9 = 0;
    goto LABEL_20;
  }
  [v5 operatingSystemVersion];
  BOOL v9 = v19 > 12;
LABEL_20:

  return v9;
}

- (id)nameForDevice:(id)a3
{
  id v4 = a3;
  int v5 = [v4 name];
  if ([(SDAutoUnlockTransport *)self showIDInName])
  {
    BOOL v6 = [v4 name];
    int v7 = [v4 uniqueIDOverride];
    uint64_t v8 = +[NSString stringWithFormat:@"%@ (%@)", v6, v7];

    int v5 = (void *)v8;
  }

  return v5;
}

- (id)proxyBluetoothDeviceIDForDeviceID:(id)a3
{
  id v4 = a3;
  int v5 = +[SDAutoUnlockAKSManager sharedManager];
  BOOL v6 = [v5 companionIDForWatchID:v4];

  if (v6)
  {
    int v7 = [(SDAutoUnlockTransport *)self onqueue_bluetoothIDForIDSID:v6];
    if (v7) {
      goto LABEL_7;
    }
    uint64_t v8 = auto_unlock_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10019624C(v8);
    }
  }
  int v7 = 0;
LABEL_7:

  return v7;
}

- (id)idsDeviceForUniqueID:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v5 = [(SDAutoUnlockTransport *)self idsService];
  BOOL v6 = [v5 devices];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v11 = [v10 uniqueIDOverride];
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)idsDeviceForBluetoothID:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v5 = [(SDAutoUnlockTransport *)self idsService];
  BOOL v6 = [v5 devices];

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        int v11 = [v10 nsuuid];
        unsigned int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)idsDeviceIDsForBluetoothID:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v6 = [(SDAutoUnlockTransport *)self idsService];
  id v7 = [v6 devices];

  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        BOOL v13 = [v12 nsuuid];
        unsigned int v14 = [v13 isEqual:v4];

        if (v14)
        {
          long long v15 = [v12 uniqueIDOverride];
          [v5 addObject:v15];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v5;
}

- (id)cachedIDSDeviceIDsForBluetoothID:(id)a3
{
  id v4 = a3;
  int v5 = [(SDAutoUnlockTransport *)self cachedBluetoothIDToUniqueIDs];
  BOOL v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)logBluetoothIDCache
{
  id v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(SDAutoUnlockTransport *)self cachedBluetoothIDToUniqueIDs];
    int v5 = 138412290;
    BOOL v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Bluetooth ID cache %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)updateBluetoothIDCache
{
  id v3 = +[NSMutableDictionary dictionary];
  [(SDAutoUnlockTransport *)self setCachedBluetoothIDToUniqueIDs:v3];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = [(SDAutoUnlockTransport *)self idsService];
  int v5 = [v4 devices];

  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        int v11 = [(SDAutoUnlockTransport *)self stableBluetoothIdentifierForIDSDevice:v10];
        uint64_t v12 = [v10 uniqueIDOverride];
        BOOL v13 = (void *)v12;
        if (v11) {
          BOOL v14 = v12 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14)
        {
          long long v15 = [(SDAutoUnlockTransport *)self cachedBluetoothIDToUniqueIDs];
          long long v16 = [v15 objectForKeyedSubscript:v11];
          id v17 = [v16 mutableCopy];
          long long v18 = v17;
          if (v17)
          {
            id v19 = v17;
          }
          else
          {
            id v19 = +[NSMutableArray array];
          }
          long long v20 = v19;

          [v20 addObject:v13];
          id v21 = [v20 copy];
          int v22 = [(SDAutoUnlockTransport *)self cachedBluetoothIDToUniqueIDs];
          [v22 setObject:v21 forKeyedSubscript:v11];
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  int v23 = auto_unlock_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Updated bluetooth ID cache", buf, 2u);
  }
}

- (id)placeholderDevice
{
  v2 = objc_opt_new();
  [v2 setUniqueID:@"5EAFD122-F291-4D56-B1F9-D856CBBC7E0C"];
  [v2 setBluetoothID:0];
  [v2 setModelIdentifier:@"Watch0,0"];
  [v2 setProductName:@"Watch OS"];
  [v2 setProductVersion:@"0.0"];
  [v2 setProductBuildVersion:@"14S000"];
  [v2 setName:@"Placeholder"];
  [v2 setEnclosureColor:@"0"];
  [v2 setDefaultPairedDevice:0];
  [v2 setModelName:@"Apple Watch"];
  [v2 setProxyBluetoothID:0];
  [v2 setUnlockEnabled:0];
  [v2 setBluetoothCloudPaired:0];
  [v2 setPlaceholder:1];

  return v2;
}

- (BOOL)activityServiceHasWatch
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [(SDAutoUnlockTransport *)self activityService];
  id v3 = [v2 devices];

  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v4) {
    goto LABEL_14;
  }
  id v5 = v4;
  uint64_t v6 = *(void *)v15;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      id v9 = [v8 modelIdentifier];
      uint64_t v10 = [v9 lowercaseString];
      if (![v10 containsString:@"watch"]) {
        goto LABEL_11;
      }
      if (!v8)
      {
        uint64_t v13 = 0;
LABEL_11:

        continue;
      }
      [v8 operatingSystemVersion];

      if (v13 > 2)
      {
        BOOL v11 = 1;
        goto LABEL_15;
      }
    }
    id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v5);
LABEL_14:
  BOOL v11 = 0;
LABEL_15:

  return v11;
}

- (BOOL)localDeviceIDSRegistered
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = [(SDAutoUnlockTransport *)self idsService];
  id v3 = [v2 accounts];

  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v9 accountType] == 1)
        {
          id v10 = v9;

          uint64_t v6 = v10;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  BOOL v11 = auto_unlock_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = [v6 registrationStatus];
    *(_DWORD *)buf = 67109120;
    unsigned int v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "IDS registration status: %d", buf, 8u);
  }

  BOOL v13 = [v6 registrationStatus] == 5;
  return v13;
}

- (id)connectionCacheDevices
{
  id v3 = objc_opt_new();
  id v4 = [(SDAutoUnlockTransport *)self enabledAutoUnlockDevices];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 supportsConnectionCache]) {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)nanoRegistryDeviceForBluetoothIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[NRPairedDeviceRegistry sharedInstance];
  id v5 = [v4 getAllDevices];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    uint64_t v10 = _NRDevicePropertyBluetoothIdentifier;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v13 = [v12 valueForProperty:v10, v16];
        if ([v3 isEqualToString:v13])
        {
          id v14 = v12;

          goto LABEL_11;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (id)stableBluetoothIdentifierForIDSDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 nsuuid];
  if (!v4)
  {
    if (objc_opt_respondsToSelector())
    {
      id v4 = [v3 performSelector:"stableBluetoothIdentifier"];
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (void)handleSuccessfulMessageSentWithIdentifier:(id)a3 sessionID:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [(SDAutoUnlockTransport *)self clientMap];
    id v8 = [v6 UUIDString];
    uint64_t v9 = [v7 objectForKey:v8];

    if (v9)
    {
      uint64_t v10 = [v6 UUIDString];
      long long v11 = [(SDAutoUnlockTransport *)self sendIdentifierToSessionID];
      [v11 setObject:v10 forKeyedSubscript:v12];
    }
  }
}

- (void)updateRetryDatesForDeviceIDs:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate date];
  id v6 = [v5 dateByAddingTimeInterval:86400.0];

  id v7 = +[NSDate date];
  id v8 = [v7 dateByAddingTimeInterval:900.0];

  v29[0] = @"CloudPairGeneralRetryDate";
  v29[1] = @"CloudPairShortRetryDate";
  v30[0] = v6;
  v30[1] = v8;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = v4;
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v14);
        long long v16 = [(SDAutoUnlockTransport *)self cloudPairRetryRecords];
        [v16 setObject:v9 forKeyedSubscript:v15];

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v12);
  }

  long long v17 = +[NSUserDefaults standardUserDefaults];
  long long v18 = [(SDAutoUnlockTransport *)self cloudPairRetryRecords];
  [v17 setObject:v18 forKey:@"AutoUnlockCloudPairRetries"];

  long long v19 = +[NSUserDefaults standardUserDefaults];
  [v19 synchronize];

  unsigned int v20 = auto_unlock_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [(SDAutoUnlockTransport *)self cloudPairRetryRecords];
    *(_DWORD *)buf = 138412290;
    long long v27 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Updated cloud pairing retry dates %@", buf, 0xCu);
  }
}

- (BOOL)canRetryCloudPairingForDeviceID:(id)a3 useShortDate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(SDAutoUnlockTransport *)self cloudPairRetryRecords];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    if (v4) {
      CFStringRef v9 = @"CloudPairShortRetryDate";
    }
    else {
      CFStringRef v9 = @"CloudPairGeneralRetryDate";
    }
    id v10 = [v8 objectForKeyedSubscript:v9];
    if (v10
      && (+[NSDate date],
          id v11 = objc_claimAutoreleasedReturnValue(),
          [v11 timeIntervalSinceDate:v10],
          double v13 = v12,
          v11,
          v13 < 0.0))
    {
      id v14 = auto_unlock_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        if (v4) {
          CFStringRef v15 = @"YES";
        }
        else {
          CFStringRef v15 = @"NO";
        }
        long long v16 = [v8 objectForKeyedSubscript:@"CloudPairShortRetryDate"];
        long long v17 = [v8 objectForKeyedSubscript:@"CloudPairGeneralRetryDate"];
        int v20 = 138413058;
        id v21 = v6;
        __int16 v22 = 2112;
        CFStringRef v23 = v15;
        __int16 v24 = 2112;
        long long v25 = v16;
        __int16 v26 = 2112;
        long long v27 = v17;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Still backing off cloud pair retry (device ID: %@, use short: %@, short date: %@, general date: %@)", (uint8_t *)&v20, 0x2Au);
      }
      BOOL v18 = 0;
    }
    else
    {
      BOOL v18 = 1;
    }
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

- (void)loadCloudPairRetries
{
  id v6 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v6 objectForKey:@"AutoUnlockCloudPairRetries"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = [v3 mutableCopy];
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  id v5 = v4;
  [(SDAutoUnlockTransport *)self setCloudPairRetryRecords:v4];
}

- (void)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 timeout:(id)a7 errorHandler:(id)a8
{
}

- (void)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 timeout:(id)a8 errorHandler:(id)a9
{
  uint64_t v12 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100194074;
  v17[3] = &unk_1008CF1F8;
  id v18 = a9;
  id v16 = v18;
  [(SDAutoUnlockTransport *)self sendPayload:a3 toDevice:a4 type:v12 sessionID:a6 queueOneID:a7 timeout:a8 completion:v17];
}

- (void)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 timeout:(id)a8 completion:(id)a9
{
  id v9 = [(SDAutoUnlockTransport *)self sendPayload:a3 toDevice:a4 type:a5 sessionID:a6 queueOneID:a7 wantsACK:0 timeout:a8 completion:a9];
}

- (id)sendPayload:(id)a3 toDevice:(id)a4 type:(unsigned __int16)a5 sessionID:(id)a6 queueOneID:(id)a7 wantsACK:(BOOL)a8 timeout:(id)a9 completion:(id)a10
{
  v12.receiver = self;
  v12.super_class = (Class)SDAutoUnlockTransport;
  id v10 = [(SDUnlockTransport *)&v12 sendAutoUnlockPayload:a3 toDevice:a4 type:a5 sessionID:a6 queueOneID:a7 timeout:a9 completion:a10];

  return v10;
}

- (id)transferDataFromPayload:(id)a3 sessionID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  [v8 setVersion:1];
  id v9 = [(SDAutoUnlockTransport *)self dataFromUUID:v6];

  [v8 setSessionID:v9];
  [v8 setPayload:v7];

  id v10 = [v8 data];

  return v10;
}

- (id)dataFromUUID:(id)a3
{
  v5[0] = 0;
  v5[1] = 0;
  [a3 getUUIDBytes:v5];
  id v3 = +[NSData dataWithBytes:v5 length:16];

  return v3;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  [(SDAutoUnlockTransport *)self updateBluetoothIDCache];
  id v5 = [(SDAutoUnlockTransport *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001942E4;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5 = a4;
  id v6 = auto_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Nearby devices changed %@", buf, 0xCu);
  }

  id v7 = [(SDAutoUnlockTransport *)self clientQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100194498;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(v7, block);
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  double v13 = [(SDAutoUnlockTransport *)self clientQueue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100194630;
  v17[3] = &unk_1008CA770;
  void v17[4] = self;
  id v18 = v11;
  id v19 = v10;
  id v20 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(v13, v17);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v7 = a5;
  if (v7)
  {
    id v8 = auto_unlock_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(SDAutoUnlockTransport *)self sendIdentifierToSessionID];
      *(_DWORD *)buf = 138412546;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received IDS ACK (identifier: %@, mapping: %@)", buf, 0x16u);
    }
    id v10 = [(SDAutoUnlockTransport *)self clientQueue];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100194DBC;
    v11[3] = &unk_1008CA640;
    v11[4] = self;
    id v12 = v7;
    dispatch_async(v10, v11);
  }
}

- (BOOL)appleWatchExisted
{
  v2 = [(SDAutoUnlockTransport *)self lastSeenWatchDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)resetAppleWatchExisted
{
  BOOL v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Resetting apple watch existed state", v4, 2u);
  }

  [(SDAutoUnlockTransport *)self setLastSeenWatchDate:0];
  [(SDAutoUnlockTransport *)self setWatchExistedInUnlockList:&__kCFBooleanFalse];
  [(SDAutoUnlockTransport *)self setWatchCurrentlyInList:&__kCFBooleanFalse];
}

- (BOOL)watchSeenRecently
{
  v2 = [(SDAutoUnlockTransport *)self lastSeenWatchDate];
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = [v2 dateByAddingTimeInterval:2419200.0];
    id v5 = objc_opt_new();
    [v5 timeIntervalSinceDate:v4];
    BOOL v7 = v6 < 0.0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSDate)lastSeenWatchDate
{
  lastSeenWatchDate = self->_lastSeenWatchDate;
  if (!lastSeenWatchDate)
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    id v5 = [v4 objectForKey:@"AutoUnlockLastSeenWatchDate"];
    double v6 = self->_lastSeenWatchDate;
    self->_lastSeenWatchDate = v5;

    if (self->_lastSeenWatchDate)
    {
      BOOL v7 = auto_unlock_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = self->_lastSeenWatchDate;
        int v10 = 138412290;
        id v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Loaded lastSeenWatchDate %@", (uint8_t *)&v10, 0xCu);
      }

      lastSeenWatchDate = self->_lastSeenWatchDate;
    }
    else
    {
      lastSeenWatchDate = 0;
    }
  }

  return lastSeenWatchDate;
}

- (void)setLastSeenWatchDate:(id)a3
{
  id v9 = a3;
  p_lastSeenWatchDate = &self->_lastSeenWatchDate;
  objc_storeStrong((id *)p_lastSeenWatchDate, a3);
  double v6 = *p_lastSeenWatchDate;
  BOOL v7 = +[NSUserDefaults standardUserDefaults];
  id v8 = v7;
  if (v6) {
    [v7 setObject:*p_lastSeenWatchDate forKey:@"AutoUnlockLastSeenWatchDate"];
  }
  else {
    [v7 removeObjectForKey:@"AutoUnlockLastSeenWatchDate"];
  }
}

- (NSNumber)watchExistedInUnlockList
{
  watchExistedInUnlockList = self->_watchExistedInUnlockList;
  if (!watchExistedInUnlockList)
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 BOOLForKey:@"AutoUnlockWatchExistedInUnlockList"]);
    id v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    double v6 = self->_watchExistedInUnlockList;
    self->_watchExistedInUnlockList = v5;

    BOOL v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [(NSNumber *)self->_watchExistedInUnlockList BOOLValue];
      CFStringRef v9 = @"NO";
      if (v8) {
        CFStringRef v9 = @"YES";
      }
      int v11 = 138412290;
      CFStringRef v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Loaded watchExistedInUnlockList %@", (uint8_t *)&v11, 0xCu);
    }

    watchExistedInUnlockList = self->_watchExistedInUnlockList;
  }

  return watchExistedInUnlockList;
}

- (void)setWatchExistedInUnlockList:(id)a3
{
  objc_storeStrong((id *)&self->_watchExistedInUnlockList, a3);
  id v4 = a3;
  id v6 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 BOOLValue];

  [v6 setBool:v5 forKey:@"AutoUnlockWatchExistedInUnlockList"];
}

- (NSNumber)watchCurrentlyInList
{
  watchCurrentlyInList = self->_watchCurrentlyInList;
  if (!watchCurrentlyInList)
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 BOOLForKey:@"AutoUnlockWatchCurrentlyInList"]);
    id v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_watchCurrentlyInList;
    self->_watchCurrentlyInList = v5;

    BOOL v7 = auto_unlock_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [(NSNumber *)self->_watchCurrentlyInList BOOLValue];
      CFStringRef v9 = @"NO";
      if (v8) {
        CFStringRef v9 = @"YES";
      }
      int v11 = 138412290;
      CFStringRef v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Loaded watchCurrentlyInList %@", (uint8_t *)&v11, 0xCu);
    }

    watchCurrentlyInList = self->_watchCurrentlyInList;
  }

  return watchCurrentlyInList;
}

- (void)setWatchCurrentlyInList:(id)a3
{
  objc_storeStrong((id *)&self->_watchCurrentlyInList, a3);
  id v4 = a3;
  id v6 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 BOOLValue];

  [v6 setBool:v5 forKey:@"AutoUnlockWatchCurrentlyInList"];
}

- (BOOL)showIDInName
{
  return sub_1000D9060(@"AUShowIDInName", 0) != 0;
}

- (BOOL)showOtherDevices
{
  return sub_1000D9060(@"AUShowOtherDevices", 0) != 0;
}

- (BOOL)disableEncryption
{
  return sub_1000D9060(@"AUDisableEncryption", 0) != 0;
}

- (BOOL)pairingRequestIsValidForDeviceID:(id)a3 messageContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v6 serverReceivedTime];
  unsigned int v8 = +[SDAutoUnlockAKSManager sharedManager];
  CFStringRef v9 = [v8 escrowSecretCreationDateForDeviceID:v5];

  int v10 = auto_unlock_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412802;
    id v20 = v9;
    __int16 v21 = 2112;
    __int16 v22 = v7;
    __int16 v23 = 2112;
    id v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Pairing request arrived (creation date: %@ server date: %@) from device: %@", (uint8_t *)&v19, 0x20u);
  }

  if (v9)
  {
    if (v7)
    {
      [v7 timeIntervalSinceDate:v9];
      if (v11 < 0.0) {
        goto LABEL_9;
      }
    }
  }
  if (![v6 fromServerStorage]) {
    goto LABEL_8;
  }
  CFStringRef v12 = +[NSDate date];
  double v13 = [v6 serverReceivedTime];
  [v12 timeIntervalSinceDate:v13];
  double v15 = v14;

  if (v15 >= 60.0)
  {
LABEL_9:
    long long v17 = auto_unlock_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      id v20 = v9;
      __int16 v21 = 2112;
      __int16 v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Pairing request arrived outside window (creation date: %@ server date: %@)", (uint8_t *)&v19, 0x16u);
    }

    BOOL v16 = 0;
  }
  else
  {
LABEL_8:
    BOOL v16 = 1;
  }

  return v16;
}

- (id)state
{
  uint64_t v46 = 0;
  BOOL v3 = (objc_class *)objc_opt_class();
  long long v29 = NSStringFromClass(v3);
  NSAppendPrintF();
  id v4 = 0;

  id v45 = v4;
  NSAppendPrintF();
  id v5 = v4;

  id v6 = objc_alloc_init((Class)NSMutableSet);
  if (SFDeviceClassCodeGet() == 1)
  {
    BOOL v7 = self;
    uint64_t v8 = 0;
    uint64_t v9 = 1;
  }
  else
  {
    if (SFDeviceClassCodeGet() != 8) {
      goto LABEL_6;
    }
    BOOL v7 = self;
    uint64_t v8 = 1;
    uint64_t v9 = 2;
  }
  int v10 = -[SDAutoUnlockTransport autoUnlockEligibleDevicesWithCloudPairing:deviceType:](v7, "autoUnlockEligibleDevicesWithCloudPairing:deviceType:", v8, v9, v29);
  [v6 unionSet:v10];

LABEL_6:
  id v44 = v5;
  NSAppendPrintF();
  id v11 = v5;

  id v43 = v11;
  NSAppendPrintF();
  id v12 = v11;

  id v42 = v12;
  NSAppendPrintF();
  id v13 = v12;

  id v41 = v13;
  NSAppendPrintF();
  id v14 = v13;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  double v15 = [(SDAutoUnlockTransport *)self idsService];
  BOOL v16 = [v15 devices];

  id v17 = [v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v17)
  {
    id v18 = v17;
    id v35 = v6;
    id obj = v16;
    uint64_t v19 = *(void *)v38;
    id v20 = v14;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(obj);
        }
        __int16 v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        __int16 v23 = [v22 name:v30, v31, v32, v33, v34];
        id v24 = [v22 uniqueID];
        long long v25 = [v22 modelIdentifier];
        __int16 v26 = [v22 productBuildVersion];
        [v22 nsuuid];
        unsigned int v34 = v33 = v26;
        v31 = v24;
        v32 = v25;
        long long v30 = v23;
        NSAppendPrintF();
        id v27 = v20;

        NSAppendPrintF();
        id v20 = v27;
      }
      id v18 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v18);
    id v14 = obj;
    id v6 = v35;
  }
  else
  {

    NSAppendPrintF();
    id v20 = v14;
  }

  return v20;
}

- (id)autoUnlockService
{
  return self->_autoUnlockService;
}

- (SDAutoUnlockTransportClient)primaryClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_primaryClient);

  return (SDAutoUnlockTransportClient *)WeakRetained;
}

- (void)setPrimaryClient:(id)a3
{
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (IDSService)activityService
{
  return self->_activityService;
}

- (void)setActivityService:(id)a3
{
}

- (OS_dispatch_queue)transportQueue
{
  return self->_transportQueue;
}

- (void)setTransportQueue:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (NSMapTable)clientMap
{
  return self->_clientMap;
}

- (void)setClientMap:(id)a3
{
}

- (NSMutableDictionary)completionHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCompletionHandlers:(id)a3
{
}

- (NSMutableDictionary)sendIdentifierToSessionID
{
  return self->_sendIdentifierToSessionID;
}

- (void)setSendIdentifierToSessionID:(id)a3
{
}

- (NSMutableDictionary)sendDates
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSendDates:(id)a3
{
}

- (NSDate)lastSendDate
{
  return self->_lastSendDate;
}

- (void)setLastSendDate:(id)a3
{
}

- (NSMutableDictionary)autoUnlockDeviceCache
{
  return self->_autoUnlockDeviceCache;
}

- (void)setAutoUnlockDeviceCache:(id)a3
{
}

- (NSMutableDictionary)cloudPairRetryRecords
{
  return self->_cloudPairRetryRecords;
}

- (void)setCloudPairRetryRecords:(id)a3
{
}

- (NSMutableDictionary)cachedBluetoothIDToUniqueIDs
{
  return self->_cachedBluetoothIDToUniqueIDs;
}

- (void)setCachedBluetoothIDToUniqueIDs:(id)a3
{
}

- (NSSet)cachedApproveBluetoothIDs
{
  return self->_cachedApproveBluetoothIDs;
}

- (void)setCachedApproveBluetoothIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedApproveBluetoothIDs, 0);
  objc_storeStrong((id *)&self->_cachedBluetoothIDToUniqueIDs, 0);
  objc_storeStrong((id *)&self->_cloudPairRetryRecords, 0);
  objc_storeStrong((id *)&self->_autoUnlockDeviceCache, 0);
  objc_storeStrong((id *)&self->_lastSendDate, 0);
  objc_storeStrong((id *)&self->_sendDates, 0);
  objc_storeStrong((id *)&self->_sendIdentifierToSessionID, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_clientMap, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_transportQueue, 0);
  objc_storeStrong((id *)&self->_activityService, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_destroyWeak((id *)&self->_primaryClient);
  objc_storeStrong((id *)&self->_autoUnlockService, 0);
  objc_storeStrong((id *)&self->_watchCurrentlyInList, 0);
  objc_storeStrong((id *)&self->_watchExistedInUnlockList, 0);

  objc_storeStrong((id *)&self->_lastSeenWatchDate, 0);
}

@end