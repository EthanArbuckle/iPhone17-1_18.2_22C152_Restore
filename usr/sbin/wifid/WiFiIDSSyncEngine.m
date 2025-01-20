@interface WiFiIDSSyncEngine
+ (id)getStringForDataType:(int64_t)a3;
- (BOOL)doesNetworkContainBssidForGuessing2GhzNetwork:(__WiFiNetwork *)a3;
- (BOOL)isKeychainUnlocked;
- (BOOL)isNetwork:(__WiFiNetwork *)a3 updatedSince:(double)a4 withinInterval:(double)a5 basedOn:(__CFString *)a6;
- (BOOL)isWaitingForIdsMessageDelivery;
- (BOOL)isWaitingForIdsSendResponse;
- (BOOL)skipSyncForNetwork:(__WiFiNetwork *)a3;
- (IDSService)idsService;
- (NSArray)knownNetworkList;
- (NSArray)knownNetworks;
- (NSArray)latestReceivedNetworkRecords;
- (NSArray)receivedKnownNetworks;
- (NSData)lastSyncedCompanionAssistedAutoJoinData;
- (NSData)lastSyncedCompanionLocaleData;
- (NSData)lastSyncedKnownNetworkPayloadData;
- (NSData)lastSyncedKnownNetworksData;
- (NSDictionary)receivedKnownNetworksAdded;
- (NSDictionary)receivedKnownNetworksRemoved;
- (NSDictionary)receivedKnownNetworksUpdated;
- (NSMutableDictionary)authGuessingDictionary;
- (NSMutableDictionary)bssidGuessingDictionary;
- (NSString)countryCodeStr;
- (NSString)lastSyncedCompanionAssistedAutoJoinDataGUID;
- (NSString)lastSyncedCompanionLocaleGUID;
- (NSString)lastSyncedKnownNetworkPayloadDataGUID;
- (NSString)lastSyncedKnownNetworksDataGUID;
- (NSString)pairedDeviceDestinationID;
- (NSString)pairedDeviceVersionID;
- (NSTimer)coalesceKnownNetworksSyncTimer;
- (NSTimer)waitForReAssociationTimer;
- (OS_dispatch_queue)managerQueue;
- (OS_dispatch_queue)serialIdsDispatchQ;
- (OS_dispatch_source)timer;
- (__WiFiManager)manager;
- (__WiFiNetwork)_findMatchingPlistNetworkForNetworkRecord:(id)a3;
- (__WiFiNetwork)currentNetwork;
- (id)copyPairedDestinationID;
- (id)getCorresponding5GhzSsidInPlistFor2GhzNetwork:(__WiFiNetwork *)a3;
- (id)getPairedVersionID;
- (id)stateChangeCallback;
- (int)connectionState;
- (int64_t)isRxdNetwork:(id)a3 equalToPlistNetwork:(__WiFiNetwork *)a4;
- (int64_t)role;
- (unint64_t)idsSendFailureCount;
- (unint64_t)knownNetworkStartPoint;
- (unint64_t)reSendIdsMessageBitMap;
- (unsigned)canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:(__WiFiNetwork *)a3;
- (unsigned)isNetworkKnown:(id)a3;
- (void)addToKnownNetworkGuessingDictionaryTheNetwork:(__WiFiNetwork *)a3;
- (void)checkForWiFiPasswordChange;
- (void)checkIfSoftwareUpdateStateEntered:(unsigned __int16)a3;
- (void)companionReAssociationWaitTimerFired:(id)a3;
- (void)createKnownNetworkGuessingDictionary;
- (void)currentNetworkChanged;
- (void)currentNetworkChannelChanged;
- (void)dealloc;
- (void)enteredCompatibilityState:(id)a3;
- (void)incrementGuessingFailedCountForScannedNetworkWithBssid:(id)a3;
- (void)initializeWithWiFiManager:(__WiFiManager *)a3 queue:(id)a4;
- (void)keychainAccessibleNow;
- (void)knownNetworksListChanged;
- (void)networkRemoved:(__WiFiNetwork *)a3;
- (void)notifyStateChanged;
- (void)pairedDeviceConnectionChanged:(id)a3;
- (void)processReceivedAutoJoinAssist:(id)a3;
- (void)processReceivedKnownNetwork:(id)a3;
- (void)processReceivedKnownNetworks:(id)a3;
- (void)processReceivedKnownNetworksInBatch:(id)a3;
- (void)processReceivedLocaleString:(id)a3;
- (void)reSendIdsMessage:(int64_t)a3;
- (void)registerForInitialSyncTrigger;
- (void)registerForSoftwareUpdateTrigger;
- (void)releaseKnownNetworkGuessingDictionary;
- (void)removeFromKnownNetworkGuessingDictionaryTheNetwork:(__WiFiNetwork *)a3;
- (void)sendCurrentCompanionNetworkWithChannelUpdate:(unsigned __int8)a3;
- (void)sendLocaleToGizmo:(id)a3;
- (void)sendToGizmoOfDataType:(int64_t)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setAuthGuessingDictionary:(id)a3;
- (void)setBssidGuessingDictionary:(id)a3;
- (void)setCoalesceKnownNetworksSyncTimer:(id)a3;
- (void)setConnectionState:(int)a3;
- (void)setCountryCodeStr:(id)a3;
- (void)setCurrentNetwork:(__WiFiNetwork *)a3;
- (void)setIdsSendFailureCount:(unint64_t)a3;
- (void)setIdsService:(id)a3;
- (void)setIsKeychainUnlocked:(BOOL)a3;
- (void)setIsWaitingForIdsMessageDelivery:(BOOL)a3;
- (void)setIsWaitingForIdsSendResponse:(BOOL)a3;
- (void)setKnownNetworkList:(id)a3;
- (void)setKnownNetworkStartPoint:(unint64_t)a3;
- (void)setKnownNetworks:(id)a3;
- (void)setLastSyncedCompanionAssistedAutoJoinData:(id)a3;
- (void)setLastSyncedCompanionAssistedAutoJoinDataGUID:(id)a3;
- (void)setLastSyncedCompanionLocaleData:(id)a3;
- (void)setLastSyncedCompanionLocaleGUID:(id)a3;
- (void)setLastSyncedKnownNetworkPayloadData:(id)a3;
- (void)setLastSyncedKnownNetworkPayloadDataGUID:(id)a3;
- (void)setLastSyncedKnownNetworksData:(id)a3;
- (void)setLastSyncedKnownNetworksDataGUID:(id)a3;
- (void)setLatestReceivedNetworkRecords:(id)a3;
- (void)setManager:(__WiFiManager *)a3;
- (void)setManagerQueue:(id)a3;
- (void)setPairedDeviceDestinationID:(id)a3;
- (void)setPairedDeviceVersionID:(id)a3;
- (void)setReSendIdsMessageBitMap:(unint64_t)a3;
- (void)setReceivedKnownNetworks:(id)a3;
- (void)setReceivedKnownNetworksAdded:(id)a3;
- (void)setReceivedKnownNetworksRemoved:(id)a3;
- (void)setReceivedKnownNetworksUpdated:(id)a3;
- (void)setRole:(int64_t)a3;
- (void)setSerialIdsDispatchQ:(id)a3;
- (void)setStateChangeCallback:(id)a3;
- (void)setStateChangeContext:(void *)a3;
- (void)setTimer:(id)a3;
- (void)setUpIDS;
- (void)setWaitForReAssociationTimer:(id)a3;
- (void)stateChangeContext;
- (void)subscribeToKeychainChanges;
- (void)syncKnownWiFiNetwork:(__WiFiNetwork *)a3 withOperation:(int)a4;
- (void)syncKnownWiFiNetworks:(id)a3;
- (void)updateBssidGuessingDictForBssid:(id)a3 guessingFailureCountDict:(id)a4 forNetworkSsid:(id)a5;
- (void)updateConnectionState:(id)a3 waitUntilDone:(unsigned __int8)a4;
- (void)updateGuessedNetworkCredentials:(__WiFiNetwork *)a3 password:(__CFString *)a4;
- (void)updatePairedDeviceID:(id)a3 versionID:(id)a4;
@end

@implementation WiFiIDSSyncEngine

- (void)initializeWithWiFiManager:(__WiFiManager *)a3 queue:(id)a4
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s", "-[WiFiIDSSyncEngine initializeWithWiFiManager:queue:]");
  }
  [(WiFiIDSSyncEngine *)self setConnectionState:0];
  [(WiFiIDSSyncEngine *)self setManager:a3];
  [(WiFiIDSSyncEngine *)self setManagerQueue:a4];
  [(WiFiIDSSyncEngine *)self setIsWaitingForIdsMessageDelivery:1];
  [(WiFiIDSSyncEngine *)self setUpIDS];
  [(WiFiIDSSyncEngine *)self setRole:1];
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017D68C;
  block[3] = &unk_10023EFA8;
  block[4] = self;
  dispatch_async(global_queue, block);
  [(WiFiIDSSyncEngine *)self registerForInitialSyncTrigger];
  [(WiFiIDSSyncEngine *)self registerForSoftwareUpdateTrigger];
  [(WiFiIDSSyncEngine *)self subscribeToKeychainChanges];
  v10 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)a4);
  self->_timer = v10;
  if (v10)
  {
    dispatch_set_context((dispatch_object_t)v10, self);
    dispatch_source_set_event_handler_f((dispatch_source_t)self->_timer, (dispatch_function_t)sub_10017D76C);
    dispatch_activate((dispatch_object_t)self->_timer);
  }
  self->_knownNetworkStartPoint = 0;
  [(WiFiIDSSyncEngine *)self setReceivedKnownNetworks:0];
}

- (void)dealloc
{
  serialIdsDispatchQ = self->_serialIdsDispatchQ;
  if (serialIdsDispatchQ) {
    dispatch_release(serialIdsDispatchQ);
  }

  [(WiFiIDSSyncEngine *)self releaseKnownNetworkGuessingDictionary];
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    dispatch_release((dispatch_object_t)self->_timer);
    self->_timer = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)WiFiIDSSyncEngine;
  [(WiFiIDSSyncEngine *)&v5 dealloc];
}

- (void)setUpIDS
{
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, "%s", "-[WiFiIDSSyncEngine setUpIDS]"];
  }
  objc_super v5 = off_10027D218;
  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = (OS_dispatch_queue *)dispatch_queue_create(v5, v6);
  self->_serialIdsDispatchQ = v7;
  if (v7)
  {
    self->_idsService = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.wifi.networksync"];
    [(IDSService *)[(WiFiIDSSyncEngine *)self idsService] addDelegate:self queue:[(WiFiIDSSyncEngine *)self serialIdsDispatchQ]];
  }
  else
  {
    if (qword_10027DD68) {
      [[(id)qword_10027DD68 WFLog:message:4, "%s: failed to create serialIdsDispatchQ", "-[WiFiIDSSyncEngine setUpIDS]"];
    }
  }
}

+ (id)getStringForDataType:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"unknown";
  }
  else {
    return off_100243718[a3];
  }
}

- (void)registerForInitialSyncTrigger
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s", "-[WiFiIDSSyncEngine registerForInitialSyncTrigger]");
  }
  int out_token = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10017DC4C;
  handler[3] = &unk_1002436A8;
  int v6 = 0;
  handler[4] = self;
  notify_register_dispatch("com.apple.nanoregistry.devicedidpair", &out_token, (dispatch_queue_t)[(WiFiIDSSyncEngine *)self serialIdsDispatchQ], handler);
}

- (void)registerForSoftwareUpdateTrigger
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017DDB0;
  block[3] = &unk_10023EFA8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_10027DD88, block);
}

- (void)enteredCompatibilityState:(id)a3
{
  id v6 = [a3 userInfo];
  -[WiFiIDSSyncEngine checkIfSoftwareUpdateStateEntered:](self, (unsigned __int16)[objc_msgSend(objc_msgSend(v6, "objectForKey:", NRPairedDeviceRegistryCompatibilityStateKey), "integerValue"]);
}

- (void)checkIfSoftwareUpdateStateEntered:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Entered NR Compatibility State %d", "-[WiFiIDSSyncEngine checkIfSoftwareUpdateStateEntered:]", v3);
  }
  if (v3 == 2)
  {
    v7 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v7 removeObserver:self name:NRPairedDeviceRegistryDeviceDidEnterCompatibilityStateNotification object:0];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10017DF9C;
    block[3] = &unk_10023EFA8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)[(WiFiIDSSyncEngine *)self managerQueue], block);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: rxd ids data from ID %@", "-[WiFiIDSSyncEngine service:account:incomingData:fromID:context:]", a6 message];
  }
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  id v15 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0), a5, 0);
  if (v15)
  {
    v16 = v15;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [(WiFiIDSSyncEngine *)self managerQueue];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10017E31C;
      v26[3] = &unk_10023EC30;
      v26[4] = self;
      v26[5] = v16;
      v18 = v26;
LABEL_15:
      dispatch_sync((dispatch_queue_t)v17, v18);
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = [v16 objectForKeyedSubscript:@"V2"];
      v17 = [(WiFiIDSSyncEngine *)self managerQueue];
      if (v19)
      {
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_10017E328;
        v25[3] = &unk_10023EC30;
        v25[4] = self;
        v25[5] = v16;
        v18 = v25;
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10017E36C;
        block[3] = &unk_10023EC30;
        block[4] = self;
        void block[5] = v16;
        v18 = block;
      }
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [(WiFiIDSSyncEngine *)self managerQueue];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10017E378;
      v23[3] = &unk_10023EC30;
      v23[4] = self;
      v23[5] = v16;
      v18 = v23;
      goto LABEL_15;
    }
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: unknown message type.", @"-[WiFiIDSSyncEngine service:account:incomingData:fromID:context:]"];
    }
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 4, "%s: null incoming data.", "-[WiFiIDSSyncEngine service:account:incomingData:fromID:context:]")];
    }
  }
LABEL_16:
}

- (void)sendToGizmoOfDataType:(int64_t)a3
{
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  v22[0] = IDSSendMessageOptionEncryptPayloadKey;
  v22[1] = IDSSendMessageOptionWantsClientAcknowledgementKey;
  v23[0] = &__kCFBooleanTrue;
  v23[1] = &__kCFBooleanTrue;
  v22[2] = IDSSendMessageOptionEnforceRemoteTimeoutsKey;
  v23[2] = &__kCFBooleanFalse;
  id v6 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: ID:%@, data type <%@>", "-[WiFiIDSSyncEngine sendToGizmoOfDataType:]", -[WiFiIDSSyncEngine pairedDeviceDestinationID](self, "pairedDeviceDestinationID"), +[WiFiIDSSyncEngine getStringForDataType:](WiFiIDSSyncEngine, "getStringForDataType:", a3) message];
  }
  if ([(WiFiIDSSyncEngine *)self pairedDeviceDestinationID])
  {
    if (a3)
    {
      if (a3 == 1)
      {
        if (![(WiFiIDSSyncEngine *)self lastSyncedCompanionAssistedAutoJoinData])goto LABEL_23; {
        v8 = [(WiFiIDSSyncEngine *)self lastSyncedCompanionAssistedAutoJoinData];
        }
      }
      else
      {
        if (a3 != 2)
        {
          if (a3 == 3
            && [(WiFiIDSSyncEngine *)self lastSyncedKnownNetworkPayloadData])
          {
            v8 = [(WiFiIDSSyncEngine *)self lastSyncedKnownNetworkPayloadData];
            goto LABEL_16;
          }
LABEL_23:
          if (qword_10027DD68) {
            [(id)qword_10027DD68 WFLog:3, "there is no data of type <%@> to send...", +[WiFiIDSSyncEngine getStringForDataType:](WiFiIDSSyncEngine, "getStringForDataType:", a3), v15, v16, v17, v18 message];
          }
          goto LABEL_31;
        }
        if (![(WiFiIDSSyncEngine *)self lastSyncedCompanionLocaleData]) {
          goto LABEL_23;
        }
        v8 = [(WiFiIDSSyncEngine *)self lastSyncedCompanionLocaleData];
      }
    }
    else
    {
      if (![(WiFiIDSSyncEngine *)self lastSyncedKnownNetworksData]) {
        goto LABEL_23;
      }
      v8 = [(WiFiIDSSyncEngine *)self lastSyncedKnownNetworksData];
    }
LABEL_16:
    v9 = v8;
    [(WiFiIDSSyncEngine *)self setIsWaitingForIdsMessageDelivery:1];
    if (([(WiFiIDSSyncEngine *)self reSendIdsMessageBitMap] & (1 << a3)) == 0)
    {
      dispatch_time_t v10 = dispatch_time(0, 600000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10017E738;
      block[3] = &unk_100240790;
      block[4] = self;
      void block[5] = a3;
      dispatch_after(v10, (dispatch_queue_t)[(WiFiIDSSyncEngine *)self serialIdsDispatchQ], block);
    }
    unsigned int v11 = [(IDSService *)[(WiFiIDSSyncEngine *)self idsService] sendData:v9 toDestinations:+[NSSet setWithObject:[(WiFiIDSSyncEngine *)self pairedDeviceDestinationID]] priority:200 options:v6 identifier:&v20 error:&v21];
    if (a3)
    {
      if (a3 == 1)
      {
        [(WiFiIDSSyncEngine *)self setLastSyncedCompanionAssistedAutoJoinDataGUID:v20];
        if (!v11) {
          goto LABEL_29;
        }
        goto LABEL_28;
      }
      if (a3 != 2)
      {
        [(WiFiIDSSyncEngine *)self setLastSyncedKnownNetworkPayloadDataGUID:v20];
        if (!v11) {
          goto LABEL_29;
        }
LABEL_28:
        [(WiFiIDSSyncEngine *)self setIsWaitingForIdsSendResponse:1];
        goto LABEL_29;
      }
      [(WiFiIDSSyncEngine *)self setLastSyncedCompanionLocaleGUID:v20];
      if (v11) {
        goto LABEL_28;
      }
    }
    else
    {
      [(WiFiIDSSyncEngine *)self setLastSyncedKnownNetworksDataGUID:v20];
      if (v11) {
        goto LABEL_28;
      }
    }
LABEL_29:
    uint64_t v13 = (void *)qword_10027DD68;
    if (qword_10027DD68)
    {
      id v14 = +[WiFiIDSSyncEngine getStringForDataType:a3];
      [v13 WFLog:3, "%s: dataType <%@>, success %d, guid %@, error %@ ", "-[WiFiIDSSyncEngine sendToGizmoOfDataType:]", v14, v11, v20, v21 message];
    }
LABEL_31:
  }
}

- (void)reSendIdsMessage:(int64_t)a3
{
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: reSendIdsMessageBitMap 0x%lx, isWaitingForIdsMessageDelivery %d, data type <%@>", "-[WiFiIDSSyncEngine reSendIdsMessage:]", -[WiFiIDSSyncEngine reSendIdsMessageBitMap](self, "reSendIdsMessageBitMap"), -[WiFiIDSSyncEngine isWaitingForIdsMessageDelivery](self, "isWaitingForIdsMessageDelivery"), +[WiFiIDSSyncEngine getStringForDataType:](WiFiIDSSyncEngine, "getStringForDataType:", a3) message];
  }
  uint64_t v7 = 1 << a3;
  if (([(WiFiIDSSyncEngine *)self reSendIdsMessageBitMap] & v7) == 0
    && [(WiFiIDSSyncEngine *)self isWaitingForIdsMessageDelivery])
  {
    [(WiFiIDSSyncEngine *)self sendToGizmoOfDataType:a3];
    [(WiFiIDSSyncEngine *)self setReSendIdsMessageBitMap:[(WiFiIDSSyncEngine *)self reSendIdsMessageBitMap] | v7];
  }
}

- (id)copyPairedDestinationID
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(IDSService *)[(WiFiIDSSyncEngine *)self idsService] devices];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) isDefaultPairedDevice])
        {
          v9 = (void *)IDSCopyIDForDevice();
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  v9 = 0;
LABEL_11:
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: devices# %lu, destinationID %@", "-[WiFiIDSSyncEngine copyPairedDestinationID]", [(-[IDSService devices](-[WiFiIDSSyncEngine idsService](self, "idsService"), "devices")) count], v9 message];
  }
  return v9;
}

- (id)getPairedVersionID
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(IDSService *)[(WiFiIDSSyncEngine *)self idsService] devices];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 isDefaultPairedDevice])
        {
          id v10 = [v9 productVersion];
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: paired device version ID %@", "-[WiFiIDSSyncEngine getPairedVersionID]", v10 message];
  }
  return v10;
}

- (void)updateConnectionState:(id)a3 waitUntilDone:(unsigned __int8)a4
{
  int v4 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    CFStringRef v11 = @"Connected";
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(a3);
        }
        if ([*(id *)(*((void *)&v22 + 1) + 8 * i) isNearby])
        {
          uint64_t v13 = 2;
          goto LABEL_12;
        }
      }
      id v9 = [a3 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    uint64_t v13 = 1;
    CFStringRef v11 = @"Not Connected";
  }
  else
  {
    uint64_t v13 = 1;
    CFStringRef v11 = @"Not Connected";
  }
LABEL_12:
  unsigned int v14 = [(WiFiIDSSyncEngine *)self connectionState];
  long long v16 = (void *)qword_10027DD68;
  if (v13 == v14)
  {
    if (qword_10027DD68)
    {
      unsigned int v17 = [(WiFiIDSSyncEngine *)self connectionState];
      CFStringRef v18 = @"Unknown";
      if (v17 == 2) {
        CFStringRef v18 = @"Connected";
      }
      if (v17 == 1) {
        CFStringRef v18 = @"Not Connected";
      }
      [v16 WFLog:3, "%s: no change to connection state (is %@)", "-[WiFiIDSSyncEngine updateConnectionState:waitUntilDone:]", v18 message];
    }
  }
  else
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: connection state changed (is %@)", "-[WiFiIDSSyncEngine updateConnectionState:waitUntilDone:]", v11 message];
    }
    [(WiFiIDSSyncEngine *)self setConnectionState:v13];
    id v19 = [(WiFiIDSSyncEngine *)self managerQueue];
    if (v4)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10017EDE8;
      block[3] = &unk_10023EFA8;
      block[4] = self;
      dispatch_sync((dispatch_queue_t)v19, block);
    }
    else
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10017EDF0;
      v20[3] = &unk_10023EFA8;
      v20[4] = self;
      dispatch_async((dispatch_queue_t)v19, v20);
    }
  }
}

- (void)updatePairedDeviceID:(id)a3 versionID:(id)a4
{
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: isWaitingForIdsMessageDelivery %d, isWaitingForIdsSendResponse %d, pairedDeviceDestinationID prev %@, new %@, pairedDeviceVersionID prev %@, new %@", "-[WiFiIDSSyncEngine updatePairedDeviceID:versionID:]", -[WiFiIDSSyncEngine isWaitingForIdsMessageDelivery](self, "isWaitingForIdsMessageDelivery"), -[WiFiIDSSyncEngine isWaitingForIdsSendResponse](self, "isWaitingForIdsSendResponse"), -[WiFiIDSSyncEngine pairedDeviceDestinationID](self, "pairedDeviceDestinationID"), a3, -[WiFiIDSSyncEngine pairedDeviceVersionID](self, "pairedDeviceVersionID"), a4 message];
  }
  [(WiFiIDSSyncEngine *)self setPairedDeviceDestinationID:a3];
  [(WiFiIDSSyncEngine *)self setPairedDeviceVersionID:a4];
  if ([(WiFiIDSSyncEngine *)self isWaitingForIdsMessageDelivery]
    && ![(WiFiIDSSyncEngine *)self isWaitingForIdsSendResponse])
  {
    if ([(WiFiIDSSyncEngine *)self lastSyncedKnownNetworksData])
    {
      [(WiFiIDSSyncEngine *)self sendToGizmoOfDataType:0];
    }
    else
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:message:3, "%s: there is no previous data blob for known networks", "-[WiFiIDSSyncEngine updatePairedDeviceID:versionID:]"];
      }
      [(WiFiIDSSyncEngine *)self knownNetworksListChanged];
    }
    [(WiFiIDSSyncEngine *)self sendToGizmoOfDataType:1];
    [(WiFiIDSSyncEngine *)self sendToGizmoOfDataType:2];
  }
}

- (void)pairedDeviceConnectionChanged:(id)a3
{
  int64_t v6 = [(WiFiIDSSyncEngine *)self role];
  if (a3 && v6 && [a3 count])
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, "%s", "-[WiFiIDSSyncEngine pairedDeviceConnectionChanged:]"];
    }
    id v8 = [(WiFiIDSSyncEngine *)self copyPairedDestinationID];
    id v9 = [(WiFiIDSSyncEngine *)self getPairedVersionID];
    if (v8)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10017F09C;
      block[3] = &unk_1002425E0;
      block[4] = self;
      void block[5] = v8;
      void block[6] = v9;
      dispatch_sync((dispatch_queue_t)[(WiFiIDSSyncEngine *)self managerQueue], block);
    }
  }
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: #devices %lu", "-[WiFiIDSSyncEngine service:nearbyDevicesChanged:]", objc_msgSend(a4, "count"));
  }
  if (a4 && [a4 count])
  {
    uint64_t v8 = 2;
    CFStringRef v9 = @"Connected";
  }
  else
  {
    uint64_t v8 = 1;
    CFStringRef v9 = @"Not Connected";
  }
  unsigned int v10 = [(WiFiIDSSyncEngine *)self connectionState];
  long long v12 = (void *)qword_10027DD68;
  if (v8 == v10)
  {
    if (qword_10027DD68)
    {
      unsigned int v13 = [(WiFiIDSSyncEngine *)self connectionState];
      CFStringRef v14 = @"Unknown";
      if (v13 == 2) {
        CFStringRef v14 = @"Connected";
      }
      if (v13 == 1) {
        CFStringRef v14 = @"Not Connected";
      }
      [v12 WFLog:3, "%s: no change to connection state (is %@)", "-[WiFiIDSSyncEngine service:nearbyDevicesChanged:]", v14 message];
    }
  }
  else
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: connection state changed (is %@)", "-[WiFiIDSSyncEngine service:nearbyDevicesChanged:]", v9 message];
    }
    [(WiFiIDSSyncEngine *)self setConnectionState:v8];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10017F290;
    block[3] = &unk_10023EFA8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)[(WiFiIDSSyncEngine *)self managerQueue], block);
  }
  [(WiFiIDSSyncEngine *)self pairedDeviceConnectionChanged:a4];
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: #devices %lu", "-[WiFiIDSSyncEngine service:devicesChanged:]", objc_msgSend(a4, "count"));
  }
  [(WiFiIDSSyncEngine *)self pairedDeviceConnectionChanged:a4];
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: devices %lu", "-[WiFiIDSSyncEngine service:connectedDevicesChanged:]", objc_msgSend(a4, "count"));
  }
  [(WiFiIDSSyncEngine *)self pairedDeviceConnectionChanged:a4];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  [(WiFiIDSSyncEngine *)self setIsWaitingForIdsSendResponse:0];
  unsigned int v12 = [(NSString *)[(WiFiIDSSyncEngine *)self lastSyncedKnownNetworksDataGUID] isEqualToString:a5];
  if (v12)
  {
    int v24 = 0;
    int v13 = 0;
    int v14 = 0;
    uint64_t v25 = 0;
  }
  else
  {
    if ([(NSString *)[(WiFiIDSSyncEngine *)self lastSyncedKnownNetworkPayloadDataGUID] isEqualToString:a5])
    {
      int v13 = 0;
      int v14 = 0;
      int v24 = 1;
      uint64_t v15 = 3;
    }
    else if ([(NSString *)[(WiFiIDSSyncEngine *)self lastSyncedCompanionAssistedAutoJoinDataGUID] isEqualToString:a5])
    {
      int v24 = 0;
      int v14 = 0;
      int v13 = 1;
      uint64_t v15 = 1;
    }
    else
    {
      if (![(NSString *)[(WiFiIDSSyncEngine *)self lastSyncedCompanionLocaleGUID] isEqualToString:a5])
      {
        if (qword_10027DD68) {
          [(id)qword_10027DD68 WFLog:4, "%s: Unrecogonized ID... success %d, error %@, id %@, KNs guid %@, AJA guid %@", "-[WiFiIDSSyncEngine service:account:identifier:didSendWithSuccess:error:]", v8, a7, a5, -[WiFiIDSSyncEngine lastSyncedKnownNetworksDataGUID](self, "lastSyncedKnownNetworksDataGUID"), -[WiFiIDSSyncEngine lastSyncedCompanionAssistedAutoJoinDataGUID](self, "lastSyncedCompanionAssistedAutoJoinDataGUID") message];
        }
        goto LABEL_38;
      }
      int v24 = 0;
      int v13 = 0;
      int v14 = 1;
      uint64_t v15 = 2;
    }
    uint64_t v25 = v15;
  }
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: %d, error %@, idsSendFailureCount %lu, data type <%@>", "-[WiFiIDSSyncEngine service:account:identifier:didSendWithSuccess:error:]", v8, a7, -[WiFiIDSSyncEngine idsSendFailureCount](self, "idsSendFailureCount"), +[WiFiIDSSyncEngine getStringForDataType:](WiFiIDSSyncEngine, "getStringForDataType:", v25) message];
  }
  if (v8)
  {
    if (v12) {
      [(WiFiIDSSyncEngine *)self setLastSyncedKnownNetworksData:0];
    }
    if (v24)
    {
      [(WiFiIDSSyncEngine *)self setLastSyncedKnownNetworkPayloadData:0];
      if (!v13) {
        goto LABEL_17;
      }
    }
    else if (!v13)
    {
LABEL_17:
      if (!v14) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    [(WiFiIDSSyncEngine *)self setLastSyncedCompanionAssistedAutoJoinData:0];
    if (!v14)
    {
LABEL_19:
      if (![(WiFiIDSSyncEngine *)self lastSyncedCompanionAssistedAutoJoinData]&& ![(WiFiIDSSyncEngine *)self lastSyncedKnownNetworksData]&& ![(WiFiIDSSyncEngine *)self lastSyncedCompanionLocaleData])
      {
        [(WiFiIDSSyncEngine *)self setIsWaitingForIdsMessageDelivery:0];
      }
      [(WiFiIDSSyncEngine *)self setIdsSendFailureCount:0];
      [(WiFiIDSSyncEngine *)self setReSendIdsMessageBitMap:[(WiFiIDSSyncEngine *)self reSendIdsMessageBitMap] & ~(1 << v25)];
      if (v12)
      {
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: known networks delivered, now resend companion assist", "-[WiFiIDSSyncEngine service:account:identifier:didSendWithSuccess:error:]");
        }
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10017F888;
        block[3] = &unk_10023EFA8;
        block[4] = self;
        dispatch_async((dispatch_queue_t)[(WiFiIDSSyncEngine *)self managerQueue], block);
      }
      goto LABEL_36;
    }
LABEL_18:
    [(WiFiIDSSyncEngine *)self setLastSyncedCompanionLocaleData:0];
    goto LABEL_19;
  }
  if ([(WiFiIDSSyncEngine *)self idsSendFailureCount] > 4)
  {
LABEL_36:
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: failure count %ld, reSendIdsMessageBitMap 0x%lx, is waiting for delivery %d", "-[WiFiIDSSyncEngine service:account:identifier:didSendWithSuccess:error:]", -[WiFiIDSSyncEngine idsSendFailureCount](self, "idsSendFailureCount"), -[WiFiIDSSyncEngine reSendIdsMessageBitMap](self, "reSendIdsMessageBitMap"), -[WiFiIDSSyncEngine isWaitingForIdsMessageDelivery](self, "isWaitingForIdsMessageDelivery"), v22, v23)];
    }
LABEL_38:
    goto LABEL_39;
  }
  [(WiFiIDSSyncEngine *)self setIdsSendFailureCount:(char *)[(WiFiIDSSyncEngine *)self idsSendFailureCount] + 1];
  if ((id)[(WiFiIDSSyncEngine *)self idsSendFailureCount] != (id)5)
  {
    char v18 = [a7 code] == (id)27 ? 1 : v12;
    if ((v18 & 1) == 0)
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: will retry ids send in 60secs...", "-[WiFiIDSSyncEngine service:account:identifier:didSendWithSuccess:error:]")
      }
      dispatch_time_t v20 = dispatch_time(0, 60000000000);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10017F87C;
      v27[3] = &unk_100240790;
      v27[4] = self;
      v27[5] = v25;
      dispatch_after(v20, (dispatch_queue_t)[(WiFiIDSSyncEngine *)self serialIdsDispatchQ], v27);
      goto LABEL_36;
    }
  }
LABEL_39:
}

- (BOOL)doesNetworkContainBssidForGuessing2GhzNetwork:(__WiFiNetwork *)a3
{
  if (a3)
  {
    if (sub_10001E404((uint64_t)a3, @"GUESSED_2ghzBSSID1")) {
      return 1;
    }
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null guessedBssid1", "-[WiFiIDSSyncEngine doesNetworkContainBssidForGuessing2GhzNetwork:]")
    }
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null network", "-[WiFiIDSSyncEngine doesNetworkContainBssidForGuessing2GhzNetwork:]")
    }
  }
  return 0;
}

- (int64_t)isRxdNetwork:(id)a3 equalToPlistNetwork:(__WiFiNetwork *)a4
{
  if (!objc_msgSend(objc_msgSend(a3, "objectForKey:", @"SSID_STR"), "isEqualToString:", sub_10001A43C(a4)))
  {
LABEL_24:
    CFStringRef v11 = 0;
    CFStringRef v9 = 0;
LABEL_26:
    int64_t v20 = 0;
    goto LABEL_20;
  }
  BOOL v8 = sub_100185674(a4, (uint64_t)[(WiFiIDSSyncEngine *)self manager]);
  if (!v8)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null syncFormattedNetworkRecord", "-[WiFiIDSSyncEngine isRxdNetwork:equalToPlistNetwork:]")
    }
    goto LABEL_24;
  }
  CFStringRef v9 = v8;
  int v10 = sub_100187080(v8);
  if (v10 != sub_100187080(a3))
  {
    CFStringRef v11 = 0;
    goto LABEL_26;
  }
  if (v10)
  {
    CFStringRef v11 = (__CFString *)sub_1000C62C8((CFDictionaryRef *)a4);
    if (-[__CFString isEqualToString:](v11, "isEqualToString:", [a3 objectForKey:@"WiFiNetworkPasswordString"]))uint64_t v12 = 0; {
    else
    }
      uint64_t v12 = 2;
  }
  else
  {
    CFStringRef v11 = 0;
    uint64_t v12 = 0;
  }
  int v13 = sub_10001EE48(a4);
  if (v13 != objc_msgSend(objc_msgSend(a3, "objectForKey:", @"UserDirected"), "BOOLValue")) {
    v12 |= 4uLL;
  }
  CFStringRef v14 = (const __CFString *)[a3 objectForKey:@"GUESSED_2ghzBSSID4"];
  if (v14)
  {
    CFStringRef v15 = v14;
    CFStringRef v16 = (const __CFString *)sub_10001E404((uint64_t)a4, @"GUESSED_2ghzBSSID4");
    if (v16)
    {
      CFStringRef v17 = v15;
      goto LABEL_17;
    }
LABEL_18:
    v12 |= 8uLL;
    goto LABEL_19;
  }
  CFStringRef v18 = (const __CFString *)[a3 objectForKey:@"GUESSED_2ghzBSSID1"];
  if (!v18) {
    goto LABEL_19;
  }
  CFStringRef v19 = v18;
  CFStringRef v16 = (const __CFString *)sub_10001E404((uint64_t)a4, @"GUESSED_2ghzBSSID1");
  if (!v16) {
    goto LABEL_18;
  }
  CFStringRef v17 = v19;
LABEL_17:
  if (CFStringCompare(v16, v17, 1uLL)) {
    goto LABEL_18;
  }
LABEL_19:
  int64_t v20 = v12 | 1;
LABEL_20:

  return v20;
}

- (void)updateGuessedNetworkCredentials:(__WiFiNetwork *)a3 password:(__CFString *)a4
{
  CFStringRef v19 = a4;
  if (a3)
  {
    id v5 = sub_10001A43C(a3);
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: Received companion network <%@>", "-[WiFiIDSSyncEngine updateGuessedNetworkCredentials:password:]", v5, v19 message];
    }
    CFArrayRef v7 = sub_10008EE94((uint64_t)[(WiFiIDSSyncEngine *)self manager]);
    if (v7)
    {
      CFArrayRef v8 = v7;
      for (unint64_t i = 0; i < (unint64_t)[(__CFArray *)v8 count]; ++i)
      {
        id v10 = [(__CFArray *)v8 objectAtIndex:i];
        if (v10)
        {
          CFStringRef v11 = v10;
          CFNumberRef v12 = (const __CFNumber *)sub_10001E404((uint64_t)v10, @"WiFiManagerKnownNetworksEventType");
          int valuePtr = 0;
          if (!v12 || (CFNumberGetValue(v12, kCFNumberIntType, &valuePtr), valuePtr == 5))
          {
            if (qword_10027DD68) {
              [(id)qword_10027DD68 WFLog:3, "%s: Guessed network <%@>", "-[WiFiIDSSyncEngine updateGuessedNetworkCredentials:password:]", sub_10001A43C(v11) message];
            }
            id v14 = [(WiFiIDSSyncEngine *)self getCorresponding5GhzSsidInPlistFor2GhzNetwork:v11];
            if (v14)
            {
              CFStringRef v15 = v14;
              if (qword_10027DD68) {
                [(id)qword_10027DD68 WFLog:3, "%s: Correspondng 5GHz network <%@>", "-[WiFiIDSSyncEngine updateGuessedNetworkCredentials:password:]", v15 message];
              }
              if ([v15 isEqualToString:v5])
              {
                if (qword_10027DD68) {
                  [(id)qword_10027DD68 WFLog:3, "%s: Networks matched, updating password for <%@>", "-[WiFiIDSSyncEngine updateGuessedNetworkCredentials:password:]", sub_10001A43C(v11) message];
                }
                sub_1000C93E0(v11, v19);
              }
            }
          }
        }
      }
      CFRelease(v8);
    }
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null network", "-[WiFiIDSSyncEngine updateGuessedNetworkCredentials:password:]")
    }
  }
}

- (__WiFiNetwork)_findMatchingPlistNetworkForNetworkRecord:(id)a3
{
  CFArrayRef v5 = sub_10008EE94((uint64_t)[(WiFiIDSSyncEngine *)self manager]);
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: %lu plist networks, %lu rxd networks", "-[WiFiIDSSyncEngine _findMatchingPlistNetworkForNetworkRecord:]", -[__CFArray count](v5, "count"), objc_msgSend(a3, "objectForKey:", @"SSID_STR"));
  }
  if (![(__CFArray *)v5 count])
  {
LABEL_7:
    CFArrayRef v8 = 0;
    if (!v5) {
      return v8;
    }
LABEL_8:
    CFRelease(v5);
    return v8;
  }
  uint64_t v7 = 0;
  while (1)
  {
    CFArrayRef v8 = (__WiFiNetwork *)[(__CFArray *)v5 objectAtIndex:v7];
    if ([(WiFiIDSSyncEngine *)self isRxdNetwork:a3 equalToPlistNetwork:v8] >= 1) {
      break;
    }
    if (++v7 >= (unint64_t)[(__CFArray *)v5 count]) {
      goto LABEL_7;
    }
  }
  CFRetain(v8);
  if (v5) {
    goto LABEL_8;
  }
  return v8;
}

- (void)processReceivedKnownNetwork:(id)a3
{
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = [a3 allKeys];
  id v7 = [v6 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v44;
    do
    {
      for (unint64_t i = 0; i != v8; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        CFStringRef v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v12 = [a3 objectForKey:v11];
      }
      int v13 = v12;
      id v8 = [v6 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v8);
  }
  else
  {
    CFStringRef v11 = 0;
    int v13 = 0;
  }
  if (sub_1000A6F14((uint64_t)[(WiFiIDSSyncEngine *)self manager]))
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: %@ operation", "-[WiFiIDSSyncEngine processReceivedKnownNetwork:]", v11 message];
    }
    if ([v11 isEqual:@"REMOVE"])
    {
      CFStringRef v15 = [(WiFiIDSSyncEngine *)self _findMatchingPlistNetworkForNetworkRecord:v13];
      CFStringRef v16 = sub_10001A43C(v15);
      if (v15)
      {
        CFStringRef v17 = v16;
        if (qword_10027DD68) {
          [(id)qword_10027DD68 WFLog:3, "%s: Network needs removing %@", "-[WiFiIDSSyncEngine processReceivedKnownNetwork:]", v17 message];
        }
        CFNumberRef v19 = (const __CFNumber *)sub_10001E404((uint64_t)v15, @"WiFiManagerKnownNetworksEventType");
        unsigned int valuePtr = 0;
        if (v19)
        {
          CFNumberGetValue(v19, kCFNumberIntType, &valuePtr);
          if (qword_10027DD68) {
            [(id)qword_10027DD68 WFLog:3, "Reason for adding <%@> is %d: ", v17, valuePtr message];
          }
          if ((valuePtr & 0xFFFFFFFB) != 1 && (!sub_1000C8140((uint64_t)v15) || !sub_1000CE714((uint64_t)v15)))
          {
            [(WiFiIDSSyncEngine *)self removeFromKnownNetworkGuessingDictionaryTheNetwork:v15];
            sub_10009A098((uint64_t)[(WiFiIDSSyncEngine *)self manager], v15, 21);
            if (![(WiFiIDSSyncEngine *)self getCorresponding5GhzSsidInPlistFor2GhzNetwork:v15])[(WiFiIDSSyncEngine *)self removeFromKnownNetworkGuessingDictionaryTheNetwork:v15]; {
            sub_10009A098((uint64_t)[(WiFiIDSSyncEngine *)self manager], v15, 21);
            }
          }
        }
      }
    }
    else
    {
      CFStringRef v15 = 0;
    }
    if (([v11 isEqual:@"ADD"] & 1) == 0
      && ![v11 isEqual:@"UPDATE"])
    {
      goto LABEL_74;
    }
    id v21 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v13];
    id v22 = [v13 objectForKey:@"SSID_STR"];
    if (!v22)
    {
LABEL_72:
      if (v21) {

      }
LABEL_74:
      if (v15) {
        CFRelease(v15);
      }
      goto LABEL_76;
    }
    id v23 = v22;
    unint64_t v24 = (unint64_t)[v21 objectForKey:@"IS_NETWORK_CAPTIVE"];
    if (!(v24 | (unint64_t)[v21 objectForKey:@"IS_NETWORK_WHITELISTING_CAPTIVE"]))
    {
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:4, "%s: captive determination is not present for %@, not adding network!!", "-[WiFiIDSSyncEngine processReceivedKnownNetwork:]", v23 message];
      }
      goto LABEL_72;
    }
    uint64_t v25 = [(WiFiIDSSyncEngine *)self isRxdNetwork:v13 equalToPlistNetwork:v15];
    if (v25 < 1)
    {
      if (!sub_100187080(v13)) {
        goto LABEL_62;
      }
      v29 = 0;
    }
    else
    {
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "rxd network <%@> exits in plist", v23 message];
      }
      if (v25 == 1) {
        goto LABEL_72;
      }
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: rxd network properties have changed(%d), update the network <%@>", "-[WiFiIDSSyncEngine processReceivedKnownNetwork:]", v25, v23 message];
      }
      [(WiFiIDSSyncEngine *)self manager];
      v28 = sub_100186414(v13);
      if (!v28) {
        goto LABEL_72;
      }
      v29 = v28;
      if ((v25 & 8) != 0)
      {
        [(WiFiIDSSyncEngine *)self removeFromKnownNetworkGuessingDictionaryTheNetwork:v15];
        [(WiFiIDSSyncEngine *)self addToKnownNetworkGuessingDictionaryTheNetwork:v29];
      }
      if (!sub_1000C9930((uint64_t)v15))
      {
        v31 = (void *)qword_10027DD68;
        if (qword_10027DD68)
        {
          contexta = v30;
          v39 = sub_10001A43C(v15);
          [v31 WFLog:4, "%s: local network record for '%@' contains autojoin preference (%d)", "-[WiFiIDSSyncEngine processReceivedKnownNetwork:]", v39, sub_10001EBB4((uint64_t)v15) message];
          v30 = contexta;
        }
        sub_10001C6A4((uint64_t)v29, @"enabled", 0);
      }
      sub_10009B1AC((uint64_t)[(WiFiIDSSyncEngine *)self manager], v29, 1u);
      sub_10001C6A4((uint64_t)v29, @"SyncedHomeProperties", 0);
      if ((v25 & 2) == 0) {
        goto LABEL_71;
      }
      if (qword_10027DD68) {
        [qword_10027DD68 WFLog:3, @"%s: Password update required", @"-[WiFiIDSSyncEngine processReceivedKnownNetwork:]"];
      }
      if (!sub_100187080(v13))
      {
        CFRelease(v29);
LABEL_62:
        [(WiFiIDSSyncEngine *)self manager];
        v29 = sub_100186414(v21);
        goto LABEL_63;
      }
    }
    CFStringRef context = (const __CFString *)[v13 objectForKey:@"WiFiNetworkPasswordString"];
    if (!context) {
      goto LABEL_66;
    }
    [v21 removeObjectForKey:@"WiFiNetworkPasswordString"];
    if (v29) {
      CFRelease(v29);
    }
    [(WiFiIDSSyncEngine *)self manager];
    v34 = sub_100186414(v13);
    if (!v34) {
      goto LABEL_72;
    }
    v29 = v34;
    LOBYTE(valuePtr) = 0;
    unsigned int v35 = sub_1000C92F8(v34, context, (BOOL *)&valuePtr, 0.1);
    unsigned int v36 = v35;
    if ((_BYTE)valuePtr || !v35)
    {
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: WiFiNetworkSetPasswordWithTimeout for <%@> has timeout = %d and result = %d", "-[WiFiIDSSyncEngine processReceivedKnownNetwork:]", v23, valuePtr, v36 message];
      }
      goto LABEL_71;
    }
    if (v25 >= 1)
    {
      [(WiFiIDSSyncEngine *)self updateGuessedNetworkCredentials:v29 password:context];
      goto LABEL_71;
    }
LABEL_63:
    [(WiFiIDSSyncEngine *)self addToKnownNetworkGuessingDictionaryTheNetwork:v29];
    sub_100180588(v21, v29);
    sub_100186A24(v29, (uint64_t)[(WiFiIDSSyncEngine *)self manager]);
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: ADDED <%@> to plist !!!", "-[WiFiIDSSyncEngine processReceivedKnownNetwork:]", v23 message];
    }
LABEL_66:
    if (!v29) {
      goto LABEL_72;
    }
LABEL_71:
    CFRelease(v29);
    goto LABEL_72;
  }
LABEL_76:
}

- (void)processReceivedKnownNetworks:(id)a3
{
  if (self->_knownNetworkList)
  {

    self->_latestReceivedNetworkRecords = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:a3 copyItems:1];
  }
  else
  {
    self->_knownNetworkList = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:a3 copyItems:1];
    timer = self->_timer;
    dispatch_time_t v6 = dispatch_time(0, 0);
    dispatch_source_set_timer(timer, v6, 0x12A05F200uLL, 0x77359400uLL);
  }
}

- (void)processReceivedKnownNetworksInBatch:(id)a3
{
  if (sub_1000A6F14((uint64_t)[(WiFiIDSSyncEngine *)self manager]))
  {
    long long v45 = v5;
    CFArrayRef v6 = sub_10008EE94((uint64_t)[(WiFiIDSSyncEngine *)self manager]);
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: %lu plist networks, %lu rxd networks", "-[WiFiIDSSyncEngine processReceivedKnownNetworksInBatch:]", -[__CFArray count](v6, "count"), objc_msgSend(a3, "count"));
    }
    if (v6)
    {
      if ([(__CFArray *)v6 count])
      {
        uint64_t v8 = 0;
        while (1)
        {
          id v9 = [(__CFArray *)v6 objectAtIndex:v8];
          CFNumberRef v10 = (const __CFNumber *)sub_10001E404((uint64_t)v9, @"WiFiManagerKnownNetworksEventType");
          int valuePtr = 0;
          if (!v10) {
            goto LABEL_13;
          }
          CFNumberGetValue(v10, kCFNumberIntType, &valuePtr);
          if (valuePtr == 1)
          {
            if (qword_10027DD68) {
              [(id)qword_10027DD68 WFLog:3, "Network added by UI, so ignore removal check for plist network <%@>", sub_10001A43C(v9) message];
            }
            goto LABEL_18;
          }
          if (valuePtr == 5)
          {
            if (qword_10027DD68) {
              [(id)qword_10027DD68 WFLog:3, "Guessed network, so ignore removal check for plist network <%@>", sub_10001A43C(v9) message];
            }
          }
          else
          {
LABEL_13:
            if (!sub_1000C8140((uint64_t)v9) && !sub_1000CE714((uint64_t)v9))
            {
              if ([a3 count])
              {
                uint64_t v12 = 0;
                while (-[WiFiIDSSyncEngine isRxdNetwork:equalToPlistNetwork:](self, "isRxdNetwork:equalToPlistNetwork:", [a3 objectAtIndex:v12], v9) < 1)
                {
                  if (++v12 >= (unint64_t)[a3 count]) {
                    goto LABEL_25;
                  }
                }
              }
              else
              {
LABEL_25:
                if (qword_10027DD68) {
                  [(id)qword_10027DD68 WFLog:4, "%s: REMOVE <%@> from plist !!!", "-[WiFiIDSSyncEngine processReceivedKnownNetworksInBatch:]", sub_10001A43C(v9) message];
                }
                [(WiFiIDSSyncEngine *)self removeFromKnownNetworkGuessingDictionaryTheNetwork:v9];
                sub_10009A098((uint64_t)[(WiFiIDSSyncEngine *)self manager], v9, 21);
              }
              goto LABEL_19;
            }
            if (qword_10027DD68) {
              [(id)qword_10027DD68 WFLog:3, "Network added by profile, so ignore removal check for plist network <%@>", sub_10001A43C(v9) message];
            }
          }
LABEL_18:
LABEL_19:
          if (++v8 >= (unint64_t)[(__CFArray *)v6 count]) {
            goto LABEL_33;
          }
        }
      }
      id v9 = 0;
LABEL_33:
      CFRelease(v6);
    }
    else
    {
      id v9 = 0;
    }
    CFArrayRef v15 = sub_10008EE94((uint64_t)[(WiFiIDSSyncEngine *)self manager]);
    if (v15)
    {
      CFArrayRef v16 = v15;
      if ([(__CFArray *)v15 count])
      {
        unint64_t v17 = 0;
        do
        {
          id v18 = [(__CFArray *)v16 objectAtIndex:v17];
          id v9 = v18;
          if (v18)
          {
            CFNumberRef v19 = (const __CFNumber *)sub_10001E404((uint64_t)v18, @"WiFiManagerKnownNetworksEventType");
            int v48 = 0;
            if (!v19 || (CFNumberGetValue(v19, kCFNumberIntType, &v48), v48 == 5))
            {
              if (![(WiFiIDSSyncEngine *)self getCorresponding5GhzSsidInPlistFor2GhzNetwork:v9])
              {
                if (qword_10027DD68) {
                  [(id)qword_10027DD68 WFLog:4, "%s: REMOVE guessed <%@> from plist", "-[WiFiIDSSyncEngine processReceivedKnownNetworksInBatch:]", sub_10001A43C(v9) message];
                }
                [(WiFiIDSSyncEngine *)self removeFromKnownNetworkGuessingDictionaryTheNetwork:v9];
                sub_10009A098((uint64_t)[(WiFiIDSSyncEngine *)self manager], v9, 21);
              }
            }
          }
          ++v17;
        }
        while (v17 < (unint64_t)[(__CFArray *)v16 count]);
      }
      CFRelease(v16);
    }
    CFArrayRef v21 = sub_10008EE94((uint64_t)[(WiFiIDSSyncEngine *)self manager]);
    if ([a3 count])
    {
      unint64_t v22 = 0;
      uint64_t v23 = 0;
      do
      {
        id v24 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:[a3 objectAtIndex:v22]];
        id v25 = [v24 objectForKey:@"SSID_STR"];
        if (!v25) {
          goto LABEL_94;
        }
        id v26 = v25;
        unint64_t v27 = (unint64_t)[v24 objectForKey:@"IS_NETWORK_CAPTIVE"];
        unint64_t v28 = v27 | (unint64_t)[v24 objectForKey:@"IS_NETWORK_WHITELISTING_CAPTIVE"];
        if (!v28)
        {
          if (qword_10027DD68) {
            [(id)qword_10027DD68 WFLog:4, "%s: captive determination is not present for %@, not adding network!!", "-[WiFiIDSSyncEngine processReceivedKnownNetworksInBatch:]", v26 message];
          }
          goto LABEL_94;
        }
        if (qword_10027DD68) {
          [(id)qword_10027DD68 WFLog:3, "check rxd <%@> for ADD", v26 message];
        }
        if ([(__CFArray *)v21 count])
        {
          uint64_t v30 = 0;
          while (1)
          {
            id v9 = [(__CFArray *)v21 objectAtIndex:v30];
            uint64_t v23 = [(WiFiIDSSyncEngine *)self isRxdNetwork:v24 equalToPlistNetwork:v9];
            if (v23 >= 1) {
              break;
            }
            if (++v30 >= (unint64_t)[(__CFArray *)v21 count]) {
              goto LABEL_61;
            }
          }
          if (qword_10027DD68) {
            [(id)qword_10027DD68 WFLog:3, "rxd network <%@> exits in plist", v26 message];
          }
          if (v23 == 1) {
            goto LABEL_94;
          }
        }
        else if (v23 < 2)
        {
LABEL_61:
          if (!sub_100187080(v24)) {
            goto LABEL_88;
          }
          int v46 = 0;
          v31 = 0;
          goto LABEL_63;
        }
        if (qword_10027DD68) {
          [(id)qword_10027DD68 WFLog:3, "%s: rxd network properties have changed(%d), update the network <%@>", "-[WiFiIDSSyncEngine processReceivedKnownNetworksInBatch:]", v23, v26 message];
        }
        [(WiFiIDSSyncEngine *)self manager];
        v38 = sub_100186414(v24);
        if (!v38) {
          goto LABEL_94;
        }
        v31 = v38;
        if ((v23 & 8) != 0)
        {
          [(WiFiIDSSyncEngine *)self removeFromKnownNetworkGuessingDictionaryTheNetwork:v9];
          [(WiFiIDSSyncEngine *)self addToKnownNetworkGuessingDictionaryTheNetwork:v31];
        }
        sub_10009B1AC((uint64_t)[(WiFiIDSSyncEngine *)self manager], v31, 1u);
        sub_10001C6A4((uint64_t)v31, @"SyncedHomeProperties", 0);
        if ((v23 & 2) == 0) {
          goto LABEL_93;
        }
        if (qword_10027DD68) {
          [((id)qword_10027DD68) WFLog:message:3, "%s: Password update required", "-[WiFiIDSSyncEngine processReceivedKnownNetworksInBatch:]"];
        }
        if (!sub_100187080(v24))
        {
          CFRelease(v31);
LABEL_88:
          [(WiFiIDSSyncEngine *)self manager];
          v31 = sub_100186414(v24);
          goto LABEL_89;
        }
        int v46 = 1;
LABEL_63:
        CFStringRef v32 = (const __CFString *)[v24 objectForKey:@"WiFiNetworkPasswordString"];
        if (!v32) {
          goto LABEL_92;
        }
        CFStringRef v33 = v32;
        [v24 removeObjectForKey:@"WiFiNetworkPasswordString"];
        if (v31) {
          CFRelease(v31);
        }
        [(WiFiIDSSyncEngine *)self manager];
        v34 = sub_100186414(v24);
        if (!v34) {
          goto LABEL_94;
        }
        v31 = v34;
        BOOL v47 = 0;
        unsigned int v35 = sub_1000C92F8(v34, v33, &v47, 0.1);
        if (v47 || !v35)
        {
          unsigned int v40 = v35;
          if (qword_10027DD68)
          {
            uint64_t v44 = v40;
            v42 = v41;
            [(id)qword_10027DD68 WFLog:3, "%s: WiFiNetworkSetPasswordWithTimeout for <%@> has timeout = %d and result = %d", "-[WiFiIDSSyncEngine processReceivedKnownNetworksInBatch:]", v26, v47, v44 message];
            v41 = v42;
          }
          goto LABEL_93;
        }
        if (v46)
        {
          [(WiFiIDSSyncEngine *)self updateGuessedNetworkCredentials:v31 password:v33];
LABEL_93:
          CFRelease(v31);
          goto LABEL_94;
        }
LABEL_89:
        [(WiFiIDSSyncEngine *)self addToKnownNetworkGuessingDictionaryTheNetwork:v31];
        sub_100180588(v24, v31);
        sub_100186A24(v31, (uint64_t)[(WiFiIDSSyncEngine *)self manager]);
        if (qword_10027DD68) {
          [(id)qword_10027DD68 WFLog:3, "%s: ADDED <%@> to plist !!!", "-[WiFiIDSSyncEngine processReceivedKnownNetworksInBatch:]", v26 message];
        }
LABEL_92:
        if (v31) {
          goto LABEL_93;
        }
LABEL_94:

        ++v22;
      }
      while (v22 < (unint64_t)[a3 count]);
    }
    CFArrayRef v5 = v45;
    if (v21) {
      CFRelease(v21);
    }
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: Cannot apply synced networks as device has not unlock after boot", "-[WiFiIDSSyncEngine processReceivedKnownNetworksInBatch:]")
    }

    self->_receivedKnownNetworks = (NSArray *)[a3 copy];
  }
}

- (void)knownNetworksListChanged
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: role %ld, isKeychainUnlocked %d", "-[WiFiIDSSyncEngine knownNetworksListChanged]", -[WiFiIDSSyncEngine role](self, "role"), -[WiFiIDSSyncEngine isKeychainUnlocked](self, "isKeychainUnlocked"));
  }
  if ([(WiFiIDSSyncEngine *)self role] && [(WiFiIDSSyncEngine *)self isKeychainUnlocked])
  {
    if ([(WiFiIDSSyncEngine *)self coalesceKnownNetworksSyncTimer])
    {
      [(NSTimer *)[(WiFiIDSSyncEngine *)self coalesceKnownNetworksSyncTimer] setFireDate:+[NSDate dateWithTimeIntervalSinceNow:10.0]];
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: adjusted coalesceKnownNetworksSyncTimer %@", "-[WiFiIDSSyncEngine knownNetworksListChanged]", -[WiFiIDSSyncEngine coalesceKnownNetworksSyncTimer](self, "coalesceKnownNetworksSyncTimer") message];
      }
    }
    else
    {
      self->_coalesceKnownNetworksSyncTimer = (NSTimer *)[objc_alloc((Class)NSTimer) initWithFireDate:+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 10.0) interval:self target:self selector:@"syncKnownWiFiNetworks:" userInfo:0 repeats:1];
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: created coalesceKnownNetworksSyncTimer %@", "-[WiFiIDSSyncEngine knownNetworksListChanged]", -[WiFiIDSSyncEngine coalesceKnownNetworksSyncTimer](self, "coalesceKnownNetworksSyncTimer") message];
      }
      [+[NSRunLoop mainRunLoop] addTimer:[(WiFiIDSSyncEngine *)self coalesceKnownNetworksSyncTimer] forMode:NSDefaultRunLoopMode];
    }
  }
}

- (BOOL)isNetwork:(__WiFiNetwork *)a3 updatedSince:(double)a4 withinInterval:(double)a5 basedOn:(__CFString *)a6
{
  CFDateRef v8 = (const __CFDate *)sub_10001E404((uint64_t)a3, a6);
  double AbsoluteTime = 0.0;
  if (v8)
  {
    CFDateRef v10 = v8;
    CFTypeID v11 = CFGetTypeID(v8);
    if (v11 == CFDateGetTypeID()) {
      double AbsoluteTime = CFDateGetAbsoluteTime(v10);
    }
  }
  BOOL v12 = a4 > 0.0;
  if (AbsoluteTime <= 0.0) {
    BOOL v12 = 0;
  }
  return a4 - AbsoluteTime < a5 && v12;
}

- (BOOL)skipSyncForNetwork:(__WiFiNetwork *)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  unsigned __int8 v6 = [(WiFiIDSSyncEngine *)self isNetwork:a3 updatedSince:@"lastAutoJoined" withinInterval:Current basedOn:604800.0];
  unsigned __int8 v7 = [(WiFiIDSSyncEngine *)self isNetwork:a3 updatedSince:@"lastJoined" withinInterval:Current basedOn:604800.0];
  unsigned __int8 v8 = [(WiFiIDSSyncEngine *)self isNetwork:a3 updatedSince:@"lastUpdated" withinInterval:Current basedOn:604800.0];
  return (v6 | v7 | v8 | [(WiFiIDSSyncEngine *)self isNetwork:a3 updatedSince:@"addedAt" withinInterval:Current basedOn:604800.0]) ^ 1;
}

- (void)syncKnownWiFiNetwork:(__WiFiNetwork *)a3 withOperation:(int)a4
{
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: role %ld, destinationID %@, version %@", "-[WiFiIDSSyncEngine syncKnownWiFiNetwork:withOperation:]", -[WiFiIDSSyncEngine role](self, "role"), -[WiFiIDSSyncEngine pairedDeviceDestinationID](self, "pairedDeviceDestinationID"), -[WiFiIDSSyncEngine pairedDeviceVersionID](self, "pairedDeviceVersionID") message];
  }
  if ([(WiFiIDSSyncEngine *)self role])
  {
    if ([(WiFiIDSSyncEngine *)self pairedDeviceDestinationID])
    {
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x3052000000;
      v29[3] = sub_100022DC8;
      v29[4] = sub_100022C8C;
      uint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v30 = sub_10000D990((uint64_t)"-[WiFiIDSSyncEngine syncKnownWiFiNetwork:withOperation:]");
      id v8 = +[NSMutableDictionary dictionary];
      id v9 = (void *)sub_1000DD148();
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v10 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v26;
        do
        {
          for (unint64_t i = 0; i != v10; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v9);
            }
            [v8 setObject:*(void *)(*((void *)&v25 + 1) + 8 * i) forKeyedSubscript:objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "objectForKeyedSubscript:", kSecAttrAccount)];
          }
          id v10 = [v9 countByEnumeratingWithState:&v25 objects:v31 count:16];
        }
        while (v10);
      }

      if ([(WiFiIDSSyncEngine *)self skipSyncForNetwork:a3])
      {
        if (qword_10027DD68) {
          [(id)qword_10027DD68 WFLog:3, "%s: Skipping sync for network: <%@>", "-[WiFiIDSSyncEngine syncKnownWiFiNetwork:withOperation:]", sub_10001A43C(a3) message];
        }
        goto LABEL_35;
      }
      id v14 = sub_100185674(a3, (uint64_t)[(WiFiIDSSyncEngine *)self manager]);
      CFArrayRef v15 = v14;
      if (v14 && sub_100186D50(v14))
      {
        if (sub_100187080(v15))
        {
          CFStringRef v16 = sub_1000C62C8((CFDictionaryRef *)a3);
          if (!v16)
          {
LABEL_35:
            _Block_object_dispose(v29, 8);
            goto LABEL_36;
          }
          [v15 setObject:v16 forKey:@"WiFiNetworkPasswordString"];
          if (!sub_1000CD558((uint64_t)a3))
          {
            id v17 = [[objc_msgSend(v8, "objectForKeyedSubscript:", sub_10001A43C(a3)) objectForKeyedSubscript:kSecAttrModificationDate];
            sub_1000CD3F8(a3, v17);
            sub_100093410((uint64_t)[(WiFiIDSSyncEngine *)self manager], (CFDictionaryRef *)a3, 0);
          }
        }
        else
        {
          CFStringRef v16 = 0;
        }
        id v18 = sub_10001E404((uint64_t)a3, @"NetworkOfInterestHomeState");
        if (v18)
        {
          [v15 setObject:v18 forKey:@"NetworkOfInterestHomeState"];
          if (qword_10027DD68) {
            [(id)qword_10027DD68 WFLog:3, "%s: WFMacRandomisation : syncing NOI for network : <%@>", "-[WiFiIDSSyncEngine syncKnownWiFiNetwork:withOperation:]", sub_10001A43C(a3) message];
          }
        }
        int64_t v20 = sub_10001E404((uint64_t)a3, @"NetworkAtLocationOfInterestType");
        if (v20)
        {
          [v15 setObject:v20 forKey:@"NetworkAtLocationOfInterestType"];
          if (qword_10027DD68) {
            [(id)qword_10027DD68 WFLog:3, "%s: WFMacRandomisation : syncing LOI for network : <%@>", "-[WiFiIDSSyncEngine syncKnownWiFiNetwork:withOperation:]", sub_10001A43C(a3) message];
          }
        }
        if (v16) {
          CFRelease(v16);
        }
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100181834;
      block[3] = &unk_1002436D0;
      int v24 = a4;
      block[4] = v15;
      void block[5] = self;
      void block[6] = v29;
      dispatch_async((dispatch_queue_t)[(WiFiIDSSyncEngine *)self serialIdsDispatchQ], block);

      goto LABEL_35;
    }
    [(WiFiIDSSyncEngine *)self setIsWaitingForIdsMessageDelivery:1];
  }
LABEL_36:
}

- (void)syncKnownWiFiNetworks:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100181A4C;
  block[3] = &unk_10023EFA8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[(WiFiIDSSyncEngine *)self managerQueue], block);
}

- (void)keychainAccessibleNow
{
  if (qword_10027DD68) {
    [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s", "-[WiFiIDSSyncEngine keychainAccessibleNow]")
  }
  [(WiFiIDSSyncEngine *)self setIsKeychainUnlocked:1];
  [(WiFiIDSSyncEngine *)self knownNetworksListChanged];
}

- (void)checkForWiFiPasswordChange
{
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, "%s", "-[WiFiIDSSyncEngine checkForWiFiPasswordChange]"];
  }
  CFArrayRef v5 = (void *)sub_10000D990((uint64_t)"-[WiFiIDSSyncEngine checkForWiFiPasswordChange]");
  [(WiFiIDSSyncEngine *)self setKnownNetworks:sub_1000830B8((uint64_t)[(WiFiIDSSyncEngine *)self manager])];
  id v6 = +[NSMutableDictionary dictionary];
  unsigned __int8 v7 = (void *)sub_1000DD148();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        [v6 setObject:*(void *)(*((void *)&v22 + 1) + 8 * i) forKeyedSubscript:objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "objectForKeyedSubscript:", kSecAttrAccount)];
      }
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }
  if ([(NSArray *)[(WiFiIDSSyncEngine *)self knownNetworks] count])
  {
    CFArrayRef v21 = v5;
    uint64_t v12 = 0;
    char v13 = 0;
    while (1)
    {
      id v14 = [(NSArray *)[(WiFiIDSSyncEngine *)self knownNetworks] objectAtIndex:v12];
      CFArrayRef v15 = sub_10001A43C(v14);
      if (sub_1000C8A5C((uint64_t)v14))
      {
        if (MGGetBoolAnswer()) {
          sub_1000A0968((CFArrayRef *)[(WiFiIDSSyncEngine *)self manager], v14);
        }
        CFDateRef v16 = (const __CFDate *)sub_1000CD558((uint64_t)v14);
        CFDateRef v17 = (const __CFDate *)[[[v6 objectForKeyedSubscript:v15] objectForKeyedSubscript:kSecAttrModificationDate];
        CFDateRef v18 = v17;
        if (v16 && v17)
        {
          if (CFDateCompare(v16, v17, 0))
          {
            char v13 = 1;
LABEL_20:
            sub_1000CD3F8(v14, v18);
            sub_100093410((uint64_t)[(WiFiIDSSyncEngine *)self manager], (CFDictionaryRef *)v14, 0);
          }
        }
        else if (v17)
        {
          goto LABEL_20;
        }
      }
      if (++v12 >= [(NSArray *)[(WiFiIDSSyncEngine *)self knownNetworks] count])
      {
        CFArrayRef v5 = v21;
        if (v13)
        {
          unsigned int v19 = sub_100094834((uint64_t)[(WiFiIDSSyncEngine *)self manager], (const __CFArray *)[(WiFiIDSSyncEngine *)self knownNetworks]);
          if (qword_10027DD68) {
            [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: mod date changes saved to the plist: %d", "-[WiFiIDSSyncEngine checkForWiFiPasswordChange]", v19)];
          }
          if (v19) {
            [(WiFiIDSSyncEngine *)self knownNetworksListChanged];
          }
        }
        break;
      }
    }
  }
}

- (void)subscribeToKeychainChanges
{
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3, "%s", "-[WiFiIDSSyncEngine subscribeToKeychainChanges]"];
  }
  int out_token = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100182600;
  handler[3] = &unk_1002436F8;
  handler[4] = self;
  notify_register_dispatch("com.apple.security.keychainchanged", &out_token, (dispatch_queue_t)qword_10027DD88, handler);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001826C8;
  v5[3] = &unk_1002436F8;
  v5[4] = self;
  notify_register_dispatch("com.apple.wifid.WiFiPasswordChanged", &out_token, (dispatch_queue_t)qword_10027DD88, v5);
}

- (void)currentNetworkChanged
{
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: role %ld, currentNetwork %@", "-[WiFiIDSSyncEngine currentNetworkChanged]", -[WiFiIDSSyncEngine role](self, "role"), -[WiFiIDSSyncEngine currentNetwork](self, "currentNetwork") message];
  }
  if ([(WiFiIDSSyncEngine *)self role]
    && [(WiFiIDSSyncEngine *)self pairedDeviceDestinationID])
  {
    if ([(WiFiIDSSyncEngine *)self currentNetwork])
    {
      [(NSTimer *)[(WiFiIDSSyncEngine *)self waitForReAssociationTimer] setFireDate:+[NSDate dateWithTimeIntervalSinceNow:CFAbsoluteTimeGetCurrent() + 315360000.0]];
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: reset waitForReAssociationTimer %@", "-[WiFiIDSSyncEngine currentNetworkChanged]", -[WiFiIDSSyncEngine waitForReAssociationTimer](self, "waitForReAssociationTimer") message];
      }
      [(WiFiIDSSyncEngine *)self sendCurrentCompanionNetworkWithChannelUpdate:0];
    }
    else if ([(WiFiIDSSyncEngine *)self waitForReAssociationTimer])
    {
      [(NSTimer *)[(WiFiIDSSyncEngine *)self waitForReAssociationTimer] setFireDate:+[NSDate dateWithTimeIntervalSinceNow:30.0]];
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: adjusted waitForReAssociationTimer %@", "-[WiFiIDSSyncEngine currentNetworkChanged]", -[WiFiIDSSyncEngine waitForReAssociationTimer](self, "waitForReAssociationTimer") message];
      }
    }
    else
    {
      -[WiFiIDSSyncEngine setWaitForReAssociationTimer:](self, "setWaitForReAssociationTimer:", [objc_alloc((Class)NSTimer) initWithFireDate:+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 30.0) interval:self target:self selector:@"companionReAssociationWaitTimerFired:" userInfo:0 repeats:CFAbsoluteTimeGetCurrent() + 315360000.0]);
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: created waitForReAssociationTimer %@", "-[WiFiIDSSyncEngine currentNetworkChanged]", -[WiFiIDSSyncEngine waitForReAssociationTimer](self, "waitForReAssociationTimer") message];
      }
      [+[NSRunLoop mainRunLoop] addTimer:[(WiFiIDSSyncEngine *)self waitForReAssociationTimer] forMode:NSDefaultRunLoopMode];
    }
  }
}

- (void)companionReAssociationWaitTimerFired:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100182AB4;
  block[3] = &unk_10023EFA8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[(WiFiIDSSyncEngine *)self managerQueue], block);
}

- (void)sendCurrentCompanionNetworkWithChannelUpdate:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3052000000;
  uint64_t v30 = sub_100022DC8;
  v31 = sub_100022C8C;
  CFStringRef v32 = (void *)0xAAAAAAAAAAAAAAAALL;
  CFStringRef v32 = sub_100185674([(WiFiIDSSyncEngine *)self currentNetwork], (uint64_t)[(WiFiIDSSyncEngine *)self manager]);
  id v6 = (void *)v28[5];
  if (v6 && sub_100186D50(v6))
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: autojoinAssist SSID %@", "-[WiFiIDSSyncEngine sendCurrentCompanionNetworkWithChannelUpdate:]", [v28[5] objectForKey:@"SSID_STR" message];
    }
    if (&_CNForgetSSID)
    {
      BOOL v8 = sub_1000C74BC((uint64_t)[(WiFiIDSSyncEngine *)self currentNetwork]);
      [v28[5] setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8)] forKey:@"IS_NETWORK_CAPTIVE"];
    }
    if (sub_100187080((void *)v28[5]))
    {
      CFStringRef v9 = sub_1000C62C8((CFDictionaryRef *)[(WiFiIDSSyncEngine *)self currentNetwork]);
      if (v9)
      {
        [(id)v28[5] setObject:v9 forKey:@"WiFiNetworkPasswordString"];
        CFRelease(v9);
      }
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100182FA0;
    block[3] = &unk_10023ECC0;
    block[4] = self;
    void block[5] = &v27;
    dispatch_async((dispatch_queue_t)[(WiFiIDSSyncEngine *)self serialIdsDispatchQ], block);
  }
  else
  {
    if ([(WiFiIDSSyncEngine *)self currentNetwork]) {
      uint64_t v10 = sub_10001A43C([(WiFiIDSSyncEngine *)self currentNetwork]);
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v20 = 0;
    CFArrayRef v21 = &v20;
    uint64_t v22 = 0x3052000000;
    long long v23 = sub_100022DC8;
    long long v24 = sub_100022C8C;
    id v25 = (id)0xAAAAAAAAAAAAAAAALL;
    id v25 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:3];
    if (v10)
    {
      [(id)v21[5] setObject:v10 forKey:@"SSID_STR"];
      float valuePtr = 0.0;
      CFNumberRef v11 = (const __CFNumber *)sub_10001E404((uint64_t)[(WiFiIDSSyncEngine *)self currentNetwork], @"RSSI");
      if (v11) {
        CFNumberGetValue(v11, kCFNumberFloatType, &valuePtr);
      }
      uint64_t v12 = +[NSNumber numberWithDouble:valuePtr];
      [(id)v21[5] setObject:v12 forKey:@"RSSI"];
      unsigned int v18 = 0;
      CFNumberRef v13 = (const __CFNumber *)sub_10001E404((uint64_t)[(WiFiIDSSyncEngine *)self currentNetwork], @"CHANNEL");
      if (v13)
      {
        CFNumberGetValue(v13, kCFNumberIntType, &v18);
        uint64_t v14 = v18;
      }
      else
      {
        uint64_t v14 = 0;
      }
      CFArrayRef v15 = +[NSNumber numberWithInt:v14];
      [(id)v21[5] setObject:v15 forKey:@"CHANNEL"];
      if (v3) {
        [v21[5] setObject:[+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1)] forKey:@"CHANNEL_UPDATE"];
      }
    }
    if ([(WiFiIDSSyncEngine *)self countryCodeStr]) {
      [v21[5] setObject: -[WiFiIDSSyncEngine countryCodeStr](self, "countryCodeStr") forKey:@"ISO_CC_CODE"];
    }
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: autojoinAssistDict %@", "-[WiFiIDSSyncEngine sendCurrentCompanionNetworkWithChannelUpdate:]", v21[5] message];
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001830D4;
    v17[3] = &unk_10023ECC0;
    v17[4] = self;
    v17[5] = &v20;
    dispatch_async((dispatch_queue_t)[(WiFiIDSSyncEngine *)self serialIdsDispatchQ], v17);
    _Block_object_dispose(&v20, 8);
  }
  _Block_object_dispose(&v27, 8);
}

- (void)sendLocaleToGizmo:(id)a3
{
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: Sending countryCode %@", "-[WiFiIDSSyncEngine sendLocaleToGizmo:]", a3 message];
  }

  self->_countryCodeStr = (NSString *)[a3 copy];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001832A4;
  block[3] = &unk_10023EFA8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[(WiFiIDSSyncEngine *)self serialIdsDispatchQ], block);
}

- (void)currentNetworkChannelChanged
{
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: role %ld, currentNetwork %@", "-[WiFiIDSSyncEngine currentNetworkChannelChanged]", -[WiFiIDSSyncEngine role](self, "role"), -[WiFiIDSSyncEngine currentNetwork](self, "currentNetwork") message];
  }
  if ([(WiFiIDSSyncEngine *)self currentNetwork]
    && [(WiFiIDSSyncEngine *)self role]
    && [(WiFiIDSSyncEngine *)self pairedDeviceDestinationID])
  {
    [(WiFiIDSSyncEngine *)self sendCurrentCompanionNetworkWithChannelUpdate:1];
  }
}

- (void)networkRemoved:(__WiFiNetwork *)a3
{
  if ((id)[(WiFiIDSSyncEngine *)self role] != (id)1)
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: Clear the guessing dictionaries for %@", "-[WiFiIDSSyncEngine networkRemoved:]", a3 message];
    }
    [(WiFiIDSSyncEngine *)self removeFromKnownNetworkGuessingDictionaryTheNetwork:a3];
    id v7 = [(WiFiIDSSyncEngine *)self getCorresponding5GhzSsidInPlistFor2GhzNetwork:a3];
    if (v7)
    {
      id v8 = v7;
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: Clear the dictionaries for corresponding 5GHz network %@", "-[WiFiIDSSyncEngine networkRemoved:]", v8 message];
      }
      [(NSMutableDictionary *)[(WiFiIDSSyncEngine *)self authGuessingDictionary] removeObjectForKey:v8];
    }
  }
}

- (void)processReceivedAutoJoinAssist:(id)a3
{
  if (!a3)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: null autojoin assist", @"-[WiFiIDSSyncEngine processReceivedAutoJoinAssist:]"];
    }
    goto LABEL_55;
  }
  id v6 = [a3 objectForKeyedSubscript:@"SSID_STR"];
  if (!v6)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: null companionSsid", @"-[WiFiIDSSyncEngine processReceivedAutoJoinAssist:]"];
    }
LABEL_55:
    uint64_t v27 = [(WiFiIDSSyncEngine *)self manager];
    long long v28 = 0;
    unsigned int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    goto LABEL_39;
  }
  id v7 = v6;
  id v8 = [a3 objectForKeyedSubscript:@"RSSI"];
  if (v8)
  {
    id v9 = [v8 intValue];
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "rxd companion rssi %d", v9);
    }
  }
  else
  {
    LODWORD(v9) = 0;
  }
  id v11 = [a3 objectForKeyedSubscript:@"CHANNEL"];
  if (v11)
  {
    id v12 = [v11 intValue];
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "rxd companion channel %d", v12);
    }
  }
  else
  {
    LODWORD(v12) = 0;
  }
  int v36 = (int)v9;
  id v14 = [a3 objectForKeyedSubscript:@"CHANNEL_UPDATE"];
  if (v14)
  {
    unsigned __int8 v15 = [v14 intValue];
    int v16 = v15;
    if (qword_10027DD68)
    {
      unsigned int v18 = "true";
      if (!v15) {
        unsigned int v18 = "false";
      }
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "rxd channel update request: %s", v18);
    }
  }
  else
  {
    int v16 = 0;
  }
  id v19 = [a3 objectForKeyedSubscript:@"ISO_CC_CODE"];
  if (v19) {
    sub_10009E48C((uint64_t)[(WiFiIDSSyncEngine *)self manager], v19);
  }
  uint64_t v20 = (void *)sub_1000830B8((uint64_t)[(WiFiIDSSyncEngine *)self manager]);
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: %lu plist networks, autojoin assist SSID: %@", "-[WiFiIDSSyncEngine processReceivedAutoJoinAssist:]", [v20 count], [a3 objectForKey:@"SSID_STR" message];
  }
  if ([v20 count])
  {
    uint64_t v22 = 0;
    while (1)
    {
      id v23 = [v20 objectAtIndex:v22];
      long long v24 = (void *)sub_10001A43C(v23);
      if ([v24 isEqualToString:v7]) {
        break;
      }
      if (++v22 >= (unint64_t)[v20 count]) {
        goto LABEL_30;
      }
    }
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "rxd companion network <%@> exists in gizmo plist", v24 message];
    }
  }
  else
  {
    long long v24 = 0;
    id v23 = 0;
LABEL_30:
    id v25 = [objc_alloc((Class)NSDictionary) initWithObjectsAndKeys:a3, @"ADD", 0];
    [(WiFiIDSSyncEngine *)self processReceivedKnownNetwork:v25];
  }
  if ([(WiFiIDSSyncEngine *)self doesNetworkContainBssidForGuessing2GhzNetwork:v23])
  {
    if (sub_100091764((uint64_t)[(WiFiIDSSyncEngine *)self manager])
      || ![v20 count])
    {
      goto LABEL_36;
    }
    uint64_t v32 = 0;
    while (1)
    {
      id v33 = [v20 objectAtIndex:v32];
      if ([[-[WiFiIDSSyncEngine getCorresponding5GhzSsidInPlistFor2GhzNetwork:](self, "getCorresponding5GhzSsidInPlistFor2GhzNetwork:", v33) isEqualToString:v7];
      if (++v32 >= (unint64_t)[v20 count])
      }
        goto LABEL_36;
    }
    long long v24 = (void *)sub_10001A43C(v33);
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "rxd companion network <%@> has guessed counterpart 2.4ghz network <%@> in gizmo plist", v7, v24 message];
    }
  }
  else
  {
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: companion network %@ is not a 5ghz network", "-[WiFiIDSSyncEngine processReceivedAutoJoinAssist:]", v7 message];
    }
  }
LABEL_36:
  uint64_t v27 = [(WiFiIDSSyncEngine *)self manager];
  if (v16)
  {
    sub_1000A18BC((uint64_t)v27, (int)v12, 0);
    goto LABEL_40;
  }
  long long v28 = v24;
  unsigned int v29 = 1;
  int v30 = v36;
  int v31 = (int)v12;
LABEL_39:
  sub_1000A13D0((uint64_t)v27, v28, v29, v30, v31);
LABEL_40:
}

- (void)processReceivedLocaleString:(id)a3
{
  sub_10009E48C((uint64_t)[(WiFiIDSSyncEngine *)self manager], a3);
}

- (void)notifyStateChanged
{
  if ([(WiFiIDSSyncEngine *)self stateChangeCallback])
  {
    int v3 = [(WiFiIDSSyncEngine *)self stateChangeCallback];
    uint64_t v4 = [(WiFiIDSSyncEngine *)self connectionState];
    CFArrayRef v5 = [(WiFiIDSSyncEngine *)self stateChangeContext];
    id v6 = (void (*)(void *, uint64_t, void *))v3[2];
    v6(v3, v4, v5);
  }
}

- (void)releaseKnownNetworkGuessingDictionary
{
  authGuessingDictionary = self->_authGuessingDictionary;
}

- (void)createKnownNetworkGuessingDictionary
{
  self->_bssidGuessingDictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  self->_authGuessingDictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  int v3 = (void *)sub_1000830B8((uint64_t)[(WiFiIDSSyncEngine *)self manager]);
  if (v3)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: %lu known networks", "-[WiFiIDSSyncEngine createKnownNetworkGuessingDictionary]", objc_msgSend(v3, "count"));
    }
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (unint64_t i = 0; i != v7; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v3);
          }
          [(WiFiIDSSyncEngine *)self addToKnownNetworkGuessingDictionaryTheNetwork:*(void *)(*((void *)&v10 + 1) + 8 * i)];
        }
        id v7 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null plistNetworks", "-[WiFiIDSSyncEngine createKnownNetworkGuessingDictionary]")];
    }
  }
}

- (void)updateBssidGuessingDictForBssid:(id)a3 guessingFailureCountDict:(id)a4 forNetworkSsid:(id)a5
{
  if (a4 && [a4 valueForKey:a3])
  {
    v14[0] = @"5GhzSsid";
    v14[1] = @"GuessingFailureCount";
    v15[0] = a5;
    v15[1] = [a4 valueForKey:a3];
    id v9 = (id *)v15;
    long long v10 = (const __CFString **)v14;
    uint64_t v11 = 2;
  }
  else
  {
    CFStringRef v12 = @"5GhzSsid";
    id v13 = a5;
    id v9 = &v13;
    long long v10 = &v12;
    uint64_t v11 = 1;
  }
  [(NSMutableDictionary *)[(WiFiIDSSyncEngine *)self bssidGuessingDictionary] setValue:+[NSDictionary dictionaryWithObjects:v9 forKeys:v10 count:v11] forKey:a3];
}

- (void)addToKnownNetworkGuessingDictionaryTheNetwork:(__WiFiNetwork *)a3
{
  if (a3 && (CFArrayRef v5 = sub_10001A43C(a3)) != 0)
  {
    id v6 = v5;
    uint64_t v7 = sub_1000C8A5C((uint64_t)a3);
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: %@[%d]", "-[WiFiIDSSyncEngine addToKnownNetworkGuessingDictionaryTheNetwork:]", v6, v7 message];
    }
    if (!v7)
    {
      uint64_t v11 = (NSDictionary *)&off_100264110;
LABEL_15:
      [(NSMutableDictionary *)[(WiFiIDSSyncEngine *)self authGuessingDictionary] setObject:v11 forKey:v6];
      id v14 = sub_10001E404((uint64_t)a3, @"GUESSED_2ghzBSSID1");
      if (v14)
      {
        unsigned __int8 v15 = v14;
        int v16 = sub_10001E404((uint64_t)a3, @"GUESSED_2ghzBSSID2");
        CFDateRef v17 = sub_10001E404((uint64_t)a3, @"GUESSED_2ghzBSSID3");
        unsigned int v18 = sub_10001E404((uint64_t)a3, @"GUESSED_2ghzBSSID4");
        id v19 = sub_10001E404((uint64_t)a3, @"WiFiPreference2GhzGuessingAttemptsPerBSSID");
        [(WiFiIDSSyncEngine *)self updateBssidGuessingDictForBssid:v15 guessingFailureCountDict:v19 forNetworkSsid:v6];
        if (v16) {
          [(WiFiIDSSyncEngine *)self updateBssidGuessingDictForBssid:v16 guessingFailureCountDict:v19 forNetworkSsid:v6];
        }
        if (v17) {
          [(WiFiIDSSyncEngine *)self updateBssidGuessingDictForBssid:v17 guessingFailureCountDict:v19 forNetworkSsid:v6];
        }
        if (v18) {
          [(WiFiIDSSyncEngine *)self updateBssidGuessingDictForBssid:v18 guessingFailureCountDict:v19 forNetworkSsid:v6];
        }
      }
      else
      {
        if (qword_10027DD68) {
          [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null guessedBssid1", "-[WiFiIDSSyncEngine addToKnownNetworkGuessingDictionaryTheNetwork:]")
        }
      }
      return;
    }
    CFStringRef v9 = sub_1000C62C8((CFDictionaryRef *)a3);
    if (v9)
    {
      CFStringRef v10 = v9;
      v22[0] = @"AuthFlag";
      v22[1] = @"Password";
      v23[0] = +[NSNumber numberWithUnsignedInteger:v7];
      v23[1] = v10;
      uint64_t v11 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
      CFRelease(v10);
      goto LABEL_15;
    }
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: no password for %@", "-[WiFiIDSSyncEngine addToKnownNetworkGuessingDictionaryTheNetwork:]", v6 message];
    }
    id v13 = v21;
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: null network", @"-[WiFiIDSSyncEngine addToKnownNetworkGuessingDictionaryTheNetwork:]"];
    }
    id v13 = v12;
  }
}

- (void)removeFromKnownNetworkGuessingDictionaryTheNetwork:(__WiFiNetwork *)a3
{
  if (a3)
  {
    CFArrayRef v5 = sub_10001A43C(a3);
    if (!v5)
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null network", "-[WiFiIDSSyncEngine removeFromKnownNetworkGuessingDictionaryTheNetwork:]");
      }
      id v14 = v6;
      goto LABEL_22;
    }
    if (qword_10027DD68) {
      [(id)qword_10027DD68 WFLog:3, "%s: %@", "-[WiFiIDSSyncEngine removeFromKnownNetworkGuessingDictionaryTheNetwork:]", v5 message];
    }
    [(NSMutableDictionary *)[(WiFiIDSSyncEngine *)self authGuessingDictionary] removeObjectForKey:v5];
    uint64_t v7 = sub_10001E404((uint64_t)a3, @"GUESSED_2ghzBSSID1");
    if (v7)
    {
      [(NSMutableDictionary *)[(WiFiIDSSyncEngine *)self bssidGuessingDictionary] removeObjectForKey:v7];
      uint64_t v8 = sub_10001E404((uint64_t)a3, @"GUESSED_2ghzBSSID2");
      if (v8) {
        [(NSMutableDictionary *)[(WiFiIDSSyncEngine *)self bssidGuessingDictionary] removeObjectForKey:v8];
      }
      CFStringRef v9 = sub_10001E404((uint64_t)a3, @"GUESSED_2ghzBSSID3");
      if (v9) {
        [(NSMutableDictionary *)[(WiFiIDSSyncEngine *)self bssidGuessingDictionary] removeObjectForKey:v9];
      }
      CFStringRef v10 = sub_10001E404((uint64_t)a3, @"GUESSED_2ghzBSSID4");
      if (v10)
      {
        uint64_t v11 = v10;
        CFStringRef v12 = [(WiFiIDSSyncEngine *)self bssidGuessingDictionary];
        [(NSMutableDictionary *)v12 removeObjectForKey:v11];
      }
      return;
    }
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null guessedBssid1", "-[WiFiIDSSyncEngine removeFromKnownNetworkGuessingDictionaryTheNetwork:]")];
    }
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3 message:@"%s: null network" arguments:@"-[WiFiIDSSyncEngine removeFromKnownNetworkGuessingDictionaryTheNetwork:]"];
    }
  }
  id v14 = v13;
LABEL_22:
}

- (unsigned)canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:(__WiFiNetwork *)a3
{
  if (!a3)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null scanned network", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v29, v30);
    }
    goto LABEL_14;
  }
  CFArrayRef v5 = sub_10001A43C(a3);
  if (!v5)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null scanned network ssid", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v29, v30);
    }
    goto LABEL_14;
  }
  id v6 = v5;
  uint64_t v7 = sub_10001E404((uint64_t)a3, @"BSSID");
  if (!v7)
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: null scanned network bssid", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v29, v30);
    }
    goto LABEL_14;
  }
  uint64_t v8 = v7;
  if (![(WiFiIDSSyncEngine *)self isNetworkKnown:v6])
  {
    id v13 = [(NSMutableDictionary *)[(WiFiIDSSyncEngine *)self bssidGuessingDictionary] valueForKey:v8];
    if (!v13)
    {
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: %@: null bssidGuessingDictionary", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v6 message];
      }
      goto LABEL_7;
    }
    id v14 = v13;
    id v15 = [v13 valueForKey:@"5GhzSsid"];
    if (v15)
    {
      id v16 = v15;
      id v17 = [v14 valueForKey:@"GuessingFailureCount"];
      if (!v17 || (int)[v17 intValue] < 5)
      {
        id v18 = [(NSMutableDictionary *)[(WiFiIDSSyncEngine *)self authGuessingDictionary] objectForKey:v16];
        if (v18)
        {
          id v19 = v18;
          id v20 = [v18 valueForKey:@"AuthFlag"];
          if (v20)
          {
            unsigned int v21 = [v20 unsignedIntegerValue];
            if (sub_1000C8A5C((uint64_t)a3) == v21)
            {
              if (!v21) {
                return 0;
              }
              CFStringRef v22 = (const __CFString *)[v19 valueForKey:@"Password"];
              if (v22)
              {
                CFStringRef v23 = v22;
                CFStringRef v32 = @"SSID_STR";
                id v33 = v6;
                long long v24 = sub_100019658((int)kCFAllocatorDefault, +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1]);
                if (v24)
                {
                  id v25 = v24;
                  if (sub_1000C95D0((CFDictionaryRef *)a3))
                  {
                    if (qword_10027DD68) {
                      [(id)qword_10027DD68 WFLog:3, "%s: Password is already available for scanned network [%@]", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", sub_10001A43C(a3), v30, v31 message];
                    }
                  }
                  else
                  {
                    BOOL v28 = sub_1000C93E0(v25, v23);
                    if (!v28)
                    {
                      if (qword_10027DD68) {
                        [(id)qword_10027DD68 WFLog:3, "%s: %@[%@]: failed to set password", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v16, v8 message];
                      }
                      CFRelease(v25);
                      return 0;
                    }
                    if (qword_10027DD68) {
                      [(id)qword_10027DD68 WFLog:3, "%s: 2Ghz scanned network[%@] has a matching known 5Ghz network [%@]. Using password from [%@]", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v6, v16, v16 message];
                    }
                  }
                  CFRelease(v25);
                  return 1;
                }
                if (qword_10027DD68) {
                  [(id)qword_10027DD68 WFLog:3, "%s: %@[%@]: failed to create network ref", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v16, v8 message];
                }
              }
              else
              {
                if (qword_10027DD68) {
                  [(id)qword_10027DD68 WFLog:3, "%s: %@[%@]: password not found", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v16, v8 message];
                }
              }
              goto LABEL_14;
            }
            if (qword_10027DD68) {
              [(id)qword_10027DD68 WFLog:3, "%s: %@ - %@: auth mismatch", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v6, v16 message];
            }
          }
          else
          {
            if (qword_10027DD68) {
              [(id)qword_10027DD68 WFLog:3, "%s: %@ - %@: null auth", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v6, v16 message];
            }
          }
        }
        else
        {
          if (qword_10027DD68) {
            [(id)qword_10027DD68 WFLog:3, "%s: %@ - %@: null authGuessingDictionary", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v6, v16 message];
          }
        }
        CFStringRef v10 = v27;
        goto LABEL_15;
      }
      if (qword_10027DD68) {
        [(id)qword_10027DD68 WFLog:3, "%s: %@[%@]: reached max failed attempts", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v16, v8 message];
      }
    }
    else
    {
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s: invalid 5ghzSsid", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v29, v30);
      }
    }
LABEL_14:
    CFStringRef v10 = v11;
    goto LABEL_15;
  }
  if (qword_10027DD68) {
    [(id)qword_10027DD68 WFLog:3, "%s: scanned [%@] is a known network", "-[WiFiIDSSyncEngine canAttemptAssociationBasedOnBssidGuessingForScannedNetwork:]", v6 message];
  }
LABEL_7:
  CFStringRef v10 = v9;
LABEL_15:
  return 0;
}

- (unsigned)isNetworkKnown:(id)a3
{
  if (a3) {
    return [(NSMutableDictionary *)[(WiFiIDSSyncEngine *)self authGuessingDictionary] objectForKey:a3] != 0;
  }
  if (qword_10027DD68) {
    [((id)qword_10027DD68) WFLog:3 message:@"%s: invalid ssid" arguments:@"-[WiFiIDSSyncEngine isNetworkKnown:]"];
  }
  return 0;
}

- (void)incrementGuessingFailedCountForScannedNetworkWithBssid:(id)a3
{
  if (a3)
  {
    id v5 = [(NSMutableDictionary *)[(WiFiIDSSyncEngine *)self bssidGuessingDictionary] valueForKey:a3];
    if (v5)
    {
      id v6 = v5;
      CFStringRef v7 = (const __CFString *)[v5 valueForKey:@"5GhzSsid"];
      if (v7)
      {
        CFStringRef v8 = v7;
        uint64_t v9 = [[objc_msgSend(v6, "valueForKey:", @"GuessingFailureCount") unsignedIntegerValue] + 1;
        id v10 = [objc_alloc((Class)NSNumber) initWithUnsignedInt:v9];
        v14[0] = @"5GhzSsid";
        v14[1] = @"GuessingFailureCount";
        v15[0] = v8;
        v15[1] = v10;
        [(NSMutableDictionary *)[(WiFiIDSSyncEngine *)self bssidGuessingDictionary] setValue:+[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2] forKey:a3];
        unsigned int v11 = sub_10009D284([(WiFiIDSSyncEngine *)self manager], v8, a3, v10);
        if (qword_10027DD68) {
          [(id)qword_10027DD68 WFLog:3, "%s: %@[%@]: update guessing failure count to %d, status:%d", "-[WiFiIDSSyncEngine incrementGuessingFailedCountForScannedNetworkWithBssid:]", a3, v8, v9, v11 message];
        }

        return;
      }
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3, @"%s: null known5ghzSsid", @"-[WiFiIDSSyncEngine incrementGuessingFailedCountForScannedNetworkWithBssid:]"];
      }
    }
    else
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:message:3, "%s: null bssidGuessingDictionary", "-[WiFiIDSSyncEngine incrementGuessingFailedCountForScannedNetworkWithBssid:]"];
      }
    }
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s: invalid bssid", @"-[WiFiIDSSyncEngine incrementGuessingFailedCountForScannedNetworkWithBssid:]"];
    }
  }
}

- (id)getCorresponding5GhzSsidInPlistFor2GhzNetwork:(__WiFiNetwork *)a3
{
  id result = (id)sub_10001E404((uint64_t)a3, @"BSSID");
  if (result)
  {
    id result = [[-[NSMutableDictionary valueForKey:](-[WiFiIDSSyncEngine bssidGuessingDictionary](self, "bssidGuessingDictionary")) valueForKey:@"5GhzSsid"];
    if (result)
    {
      id v5 = result;
      if ([(NSMutableDictionary *)[(WiFiIDSSyncEngine *)self authGuessingDictionary] objectForKey:result])
      {
        return v5;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (OS_dispatch_queue)managerQueue
{
  return self->_managerQueue;
}

- (void)setManagerQueue:(id)a3
{
}

- (OS_dispatch_queue)serialIdsDispatchQ
{
  return self->_serialIdsDispatchQ;
}

- (void)setSerialIdsDispatchQ:(id)a3
{
}

- (__WiFiManager)manager
{
  return self->_manager;
}

- (void)setManager:(__WiFiManager *)a3
{
  self->_manager = a3;
}

- (int64_t)role
{
  return self->_role;
}

- (void)setRole:(int64_t)a3
{
  self->_role = a3;
}

- (__WiFiNetwork)currentNetwork
{
  return self->_currentNetwork;
}

- (void)setCurrentNetwork:(__WiFiNetwork *)a3
{
  self->_currentNetwork = a3;
}

- (NSArray)knownNetworks
{
  return self->_knownNetworks;
}

- (void)setKnownNetworks:(id)a3
{
}

- (NSArray)receivedKnownNetworks
{
  return self->_receivedKnownNetworks;
}

- (void)setReceivedKnownNetworks:(id)a3
{
  self->_receivedKnownNetworks = (NSArray *)a3;
}

- (NSDictionary)receivedKnownNetworksAdded
{
  return self->_receivedKnownNetworksAdded;
}

- (void)setReceivedKnownNetworksAdded:(id)a3
{
  self->_receivedKnownNetworksAdded = (NSDictionary *)a3;
}

- (NSDictionary)receivedKnownNetworksRemoved
{
  return self->_receivedKnownNetworksRemoved;
}

- (void)setReceivedKnownNetworksRemoved:(id)a3
{
  self->_receivedKnownNetworksRemoved = (NSDictionary *)a3;
}

- (NSDictionary)receivedKnownNetworksUpdated
{
  return self->_receivedKnownNetworksUpdated;
}

- (void)setReceivedKnownNetworksUpdated:(id)a3
{
  self->_receivedKnownNetworksUpdated = (NSDictionary *)a3;
}

- (BOOL)isWaitingForIdsMessageDelivery
{
  return self->_isWaitingForIdsMessageDelivery;
}

- (void)setIsWaitingForIdsMessageDelivery:(BOOL)a3
{
  self->_isWaitingForIdsMessageDelivery = a3;
}

- (BOOL)isWaitingForIdsSendResponse
{
  return self->_isWaitingForIdsSendResponse;
}

- (void)setIsWaitingForIdsSendResponse:(BOOL)a3
{
  self->_isWaitingForIdsSendResponse = a3;
}

- (unint64_t)reSendIdsMessageBitMap
{
  return self->_reSendIdsMessageBitMap;
}

- (void)setReSendIdsMessageBitMap:(unint64_t)a3
{
  self->_reSendIdsMessageBitMap = a3;
}

- (NSString)pairedDeviceDestinationID
{
  return self->_pairedDeviceDestinationID;
}

- (void)setPairedDeviceDestinationID:(id)a3
{
}

- (NSString)pairedDeviceVersionID
{
  return self->_pairedDeviceVersionID;
}

- (void)setPairedDeviceVersionID:(id)a3
{
}

- (NSTimer)coalesceKnownNetworksSyncTimer
{
  return self->_coalesceKnownNetworksSyncTimer;
}

- (void)setCoalesceKnownNetworksSyncTimer:(id)a3
{
}

- (NSTimer)waitForReAssociationTimer
{
  return self->_waitForReAssociationTimer;
}

- (void)setWaitForReAssociationTimer:(id)a3
{
}

- (NSData)lastSyncedKnownNetworksData
{
  return self->_lastSyncedKnownNetworksData;
}

- (void)setLastSyncedKnownNetworksData:(id)a3
{
}

- (NSData)lastSyncedKnownNetworkPayloadData
{
  return self->_lastSyncedKnownNetworkPayloadData;
}

- (void)setLastSyncedKnownNetworkPayloadData:(id)a3
{
}

- (NSData)lastSyncedCompanionAssistedAutoJoinData
{
  return self->_lastSyncedCompanionAssistedAutoJoinData;
}

- (void)setLastSyncedCompanionAssistedAutoJoinData:(id)a3
{
}

- (NSData)lastSyncedCompanionLocaleData
{
  return self->_lastSyncedCompanionLocaleData;
}

- (void)setLastSyncedCompanionLocaleData:(id)a3
{
}

- (NSString)lastSyncedKnownNetworksDataGUID
{
  return self->_lastSyncedKnownNetworksDataGUID;
}

- (void)setLastSyncedKnownNetworksDataGUID:(id)a3
{
}

- (NSString)lastSyncedKnownNetworkPayloadDataGUID
{
  return self->_lastSyncedKnownNetworkPayloadDataGUID;
}

- (void)setLastSyncedKnownNetworkPayloadDataGUID:(id)a3
{
}

- (NSString)lastSyncedCompanionAssistedAutoJoinDataGUID
{
  return self->_lastSyncedCompanionAssistedAutoJoinDataGUID;
}

- (void)setLastSyncedCompanionAssistedAutoJoinDataGUID:(id)a3
{
}

- (NSString)lastSyncedCompanionLocaleGUID
{
  return self->_lastSyncedCompanionLocaleGUID;
}

- (void)setLastSyncedCompanionLocaleGUID:(id)a3
{
}

- (NSString)countryCodeStr
{
  return self->_countryCodeStr;
}

- (void)setCountryCodeStr:(id)a3
{
}

- (unint64_t)idsSendFailureCount
{
  return self->_idsSendFailureCount;
}

- (void)setIdsSendFailureCount:(unint64_t)a3
{
  self->_idsSendFailureCount = a3;
}

- (BOOL)isKeychainUnlocked
{
  return self->_isKeychainUnlocked;
}

- (void)setIsKeychainUnlocked:(BOOL)a3
{
  self->_isKeychainUnlocked = a3;
}

- (id)stateChangeCallback
{
  return self->_stateChangeCallback;
}

- (void)setStateChangeCallback:(id)a3
{
}

- (void)stateChangeContext
{
  return self->_stateChangeContext;
}

- (void)setStateChangeContext:(void *)a3
{
  self->_stateChangeContext = a3;
}

- (int)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int)a3
{
  self->_connectionState = a3;
}

- (NSMutableDictionary)bssidGuessingDictionary
{
  return self->_bssidGuessingDictionary;
}

- (void)setBssidGuessingDictionary:(id)a3
{
}

- (NSMutableDictionary)authGuessingDictionary
{
  return self->_authGuessingDictionary;
}

- (void)setAuthGuessingDictionary:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSArray)knownNetworkList
{
  return self->_knownNetworkList;
}

- (void)setKnownNetworkList:(id)a3
{
}

- (NSArray)latestReceivedNetworkRecords
{
  return self->_latestReceivedNetworkRecords;
}

- (void)setLatestReceivedNetworkRecords:(id)a3
{
}

- (unint64_t)knownNetworkStartPoint
{
  return self->_knownNetworkStartPoint;
}

- (void)setKnownNetworkStartPoint:(unint64_t)a3
{
  self->_knownNetworkStartPoint = a3;
}

@end