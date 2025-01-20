@interface CLUsageSyncManager
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)_sendMessage:(id)a3 identifier:(id *)a4 error:(id *)a5;
- (BOOL)dirtyUsageSyncState;
- (BOOL)isPaired;
- (BOOL)needFullResync;
- (BOOL)retryTimerSet;
- (CLClientManagerPublicProtocol)manager;
- (CLTimer)retryTimer;
- (CLUsageSyncManager)init;
- (IDSService)service;
- (NSMutableArray)errorQueue;
- (NSMutableDictionary)messagesWaitingForAck;
- (NSUUID)pairedDeviceID;
- (id).cxx_construct;
- (id)currentlyActiveDevice;
- (id)mungedUsageDataForPotentiallyOldUsageData:(id)a3;
- (id)pairedDeviceRegistry;
- (int)activeDeviceNearbyStatus;
- (void)addMessageToErrorQueue:(id)a3;
- (void)beginService;
- (void)client:(id)a3 didChangeUsageData:(id)a4;
- (void)client:(id)a3 didChangeUsageDataInternal:(id)a4;
- (void)drainErrorQueue;
- (void)endService;
- (void)handleActiveNotification_bounce:(id)a3;
- (void)handleInactiveNotification_bounce:(id)a3;
- (void)handleMessageError:(id)a3;
- (void)handleMessageResyncRequestWithMessageData:(id)a3;
- (void)handleMessageResyncResponseWithMessageData:(id)a3;
- (void)handleMessageSendError:(id)a3 identifier:(id)a4;
- (void)handleMessageSendSuccessForIdentifier:(id)a3;
- (void)handleMessageUsageUpdateWithMessageData:(id)a3;
- (void)handlePair;
- (void)handlePairNotification_bounce:(id)a3;
- (void)handleUnpair;
- (void)handleUnpairNotification_bounce:(id)a3;
- (void)messageFailedToSend:(id)a3 withError:(id)a4 recoverable:(BOOL)a5;
- (void)onClientManagerNotification:(int)a3 data:(const void *)a4;
- (void)onStatusBarIconChange:(int)a3;
- (void)onStatusBarIconChangeInternal:(int)a3;
- (void)requestFullResync;
- (void)sendAllUsageSyncData;
- (void)sendMessage:(id)a3;
- (void)sendMessageWithMessageType:(id)a3 dataPayload:(id)a4 priority:(int64_t)a5 idsOptions:(id)a6;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setActiveDeviceNearbyStatus:(int)a3;
- (void)setDirtyUsageSyncState:(BOOL)a3;
- (void)setErrorQueue:(id)a3;
- (void)setMessagesWaitingForAck:(id)a3;
- (void)setNeedFullResync:(BOOL)a3;
- (void)setPairedDeviceID:(id)a3;
- (void)setPairedDeviceRegistry:(id)a3;
- (void)setRetryTimer:(id)a3;
- (void)setRetryTimerSet:(BOOL)a3;
- (void)setService:(id)a3;
- (void)setSilo:(id)a3;
@end

@implementation CLUsageSyncManager

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)[a3 count]) {
    [objc_msgSend(a3, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:a3 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10247ED30 != -1) {
    dispatch_once(&qword_10247ED30, &stru_1022CFD60);
  }
  return (id)qword_10247ED28;
}

+ (BOOL)isSupported
{
  if (qword_10247ED40 != -1) {
    dispatch_once(&qword_10247ED40, &stru_1022CFD80);
  }
  return byte_10247ED38;
}

- (CLUsageSyncManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLUsageSyncManager;
  return [(CLUsageSyncManager *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLUsageSyncManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLUsageSyncManagerClientProtocol];
}

- (void)setSilo:(id)a3
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CFED0);
  }
  unint64_t v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync suspending silo until IDS becomes available\"}", buf, 0x12u);
  }
  [a3 suspend];
  v8.receiver = self;
  v8.super_class = (Class)CLUsageSyncManager;
  [(CLUsageSyncManager *)&v8 setSilo:a3];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CFED0);
  }
  v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync waiting on IDS to become available\"}", buf, 0x12u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1008BA3F0;
  v7[3] = &unk_1022B87F0;
  v7[4] = self;
  v7[5] = a3;
  +[IDSService serviceWithIdentifier:@"com.apple.private.alloy.location.usage" completion:v7];
}

- (void)beginService
{
}

- (void)endService
{
  [(IDSService *)self->_service removeDelegate:self];

  self->_service = 0;
  self->_pairedDeviceID = 0;
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 removeObserver:self name:off_10241EA10() object:self->_pairedDeviceRegistry];
  v4 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v4 removeObserver:self name:off_10241EA18() object:self->_pairedDeviceRegistry];
  unint64_t v5 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v5 removeObserver:self name:off_10241EA20() object:self->_pairedDeviceRegistry];
  v6 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v6 removeObserver:self name:off_10241EA28() object:self->_pairedDeviceRegistry];

  self->_pairedDeviceRegistry = 0;
  [(CLTimer *)self->_retryTimer setHandler:0];

  self->_retryTimer = 0;
  self->_errorQueue = 0;

  self->_messagesWaitingForAck = 0;
}

- (void)onClientManagerNotification:(int)a3 data:(const void *)a4
{
  [(CLUsageSyncManager *)self requestFullResync];

  [(CLUsageSyncManager *)self sendAllUsageSyncData];
}

- (void)handleUnpairNotification_bounce:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1008BAF34;
  v3[3] = &unk_10229FED8;
  v3[4] = self;
  [objc_msgSend(-[CLUsageSyncManager universe](self, "universe", a3), "silo") async:v3];
}

- (void)handlePairNotification_bounce:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1008BAFBC;
  v3[3] = &unk_10229FED8;
  v3[4] = self;
  [objc_msgSend(-[CLUsageSyncManager universe](self, "universe", a3), "silo") async:v3];
}

- (void)handleUnpair
{
  [self universe].silo
  id v3 = [[(objc_class *)off_10241EA08() sharedInstance] getActivePairedDevice];
  id v4 = [v3 valueForProperty:off_10241EA30()];
  if (objc_msgSend(v4, "isEqual:", -[CLUsageSyncManager pairedDeviceID](self, "pairedDeviceID")))
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    unint64_t v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 68289282;
      int v9 = 0;
      __int16 v10 = 2082;
      __int16 v11 = "";
      __int16 v12 = 2082;
      v13 = (const char *)[v4 UUIDString].UTF8String;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Non-active device unpaired\", \"current id\":%{public, location:escape_only}s}", (uint8_t *)&v8, 0x1Cu);
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    v6 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 68289538;
      int v9 = 0;
      __int16 v10 = 2082;
      __int16 v11 = "";
      __int16 v12 = 2082;
      v13 = [(NSString *)[(NSUUID *)[(CLUsageSyncManager *)self pairedDeviceID] UUIDString] UTF8String];
      __int16 v14 = 2082;
      id v15 = [[[v4 UUIDString] UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Unpair\", \"current id\":%{public, location:escape_only}s, \"active id\":%{public, location:escape_only}s}", (uint8_t *)&v8, 0x26u);
    }
    [(CLClientManagerPublicProtocol *)[(CLUsageSyncManager *)self manager] syncgetDoSync:&stru_1022CFDA0];
    [(CLUsageSyncManager *)self setPairedDeviceID:0];
    [(CLUsageSyncManager *)self setErrorQueue:+[NSMutableArray array]];
    [(CLTimer *)self->_retryTimer setNextFireDelay:1.79769313e308];
    self->_retryTimerSet = 0;
    [(CLUsageSyncManager *)self setMessagesWaitingForAck:+[NSMutableDictionary dictionary]];
    uint64_t v7 = sub_1000A6958();
    sub_1004CF870(v7);
    [(CLUsageSyncManager *)self service:[(CLUsageSyncManager *)self service] nearbyDevicesChanged:[(IDSService *)[(CLUsageSyncManager *)self service] devices]];
  }
}

- (void)handlePair
{
  [self universe].silo
  id v3 = [[(objc_class *)off_10241EA08() sharedInstance] getActivePairedDevice];
  id v4 = [v3 valueForProperty:off_10241EA30()];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CFED0);
  }
  unint64_t v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289538;
    v8[1] = 0;
    __int16 v9 = 2082;
    __int16 v10 = "";
    __int16 v11 = 2082;
    id v12 = [[[v4 UUIDString] UTF8String];
    __int16 v13 = 2082;
    __int16 v14 = [(NSString *)[(NSUUID *)[(CLUsageSyncManager *)self pairedDeviceID] UUIDString] UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Pairing\", \"new id\":%{public, location:escape_only}s, \"old id\":%{public, location:escape_only}s}", (uint8_t *)v8, 0x26u);
  }
  if (v4)
  {
    if ((objc_msgSend(v4, "isEqual:", -[CLUsageSyncManager pairedDeviceID](self, "pairedDeviceID")) & 1) == 0)
    {
      [(CLUsageSyncManager *)self setPairedDeviceID:v4];
      uint64_t v6 = sub_1000A6958();
      sub_1004D3518(v6, @"kCLUsageSyncPairedDeviceID", (char *)[(NSString *)[(NSUUID *)self->_pairedDeviceID UUIDString] UTF8String]);
      uint64_t v7 = *(void *)sub_1000A6958();
      (*(void (**)(void))(v7 + 944))();
      [(CLUsageSyncManager *)self service:[(CLUsageSyncManager *)self service] nearbyDevicesChanged:[(IDSService *)[(CLUsageSyncManager *)self service] devices]];
    }
  }
}

- (void)handleActiveNotification_bounce:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1008BB504;
  v3[3] = &unk_10229FED8;
  v3[4] = self;
  [objc_msgSend(-[CLUsageSyncManager universe](self, "universe", a3), "silo") async:v3];
}

- (void)handleInactiveNotification_bounce:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1008BB58C;
  v3[3] = &unk_10229FED8;
  v3[4] = self;
  [objc_msgSend(-[CLUsageSyncManager universe](self, "universe", a3), "silo") async:v3];
}

- (id)currentlyActiveDevice
{
  id v3 = [(CLUsageSyncManager *)self pairedDeviceID];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v4 = [[(objc_class *)off_10241EA08() sharedInstance] getPairedDevices];
  id v5 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v26 != v7) {
        objc_enumerationMutation(v4);
      }
      __int16 v9 = *(void **)(*((void *)&v25 + 1) + 8 * v8);
      if (objc_msgSend(objc_msgSend(v9, "valueForProperty:", off_10241EA30()), "isEqual:", v3)) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_20;
      }
    }
    id v10 = v9;
    if (!v10) {
      goto LABEL_20;
    }
    id v11 = [v10 valueForProperty:off_10241EA40()];
    id v12 = [(IDSService *)[(CLUsageSyncManager *)self service] linkedDevicesWithRelationship:1];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
LABEL_13:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v21 + 1) + 8 * v16);
        if (objc_msgSend(objc_msgSend(v17, "nsuuid"), "isEqual:", v11)) {
          break;
        }
        if (v14 == (id)++v16)
        {
          id v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v14) {
            goto LABEL_13;
          }
          goto LABEL_25;
        }
      }
      id result = v17;
      if (result) {
        return result;
      }
    }
LABEL_25:
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    v18 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v31 = 2082;
      v32 = "";
      v19 = "{\"msg%{public}.0s\":\"#usesync #warning Couldn't find a matching IDS device\"}";
      goto LABEL_29;
    }
  }
  else
  {
LABEL_20:
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    v18 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v31 = 2082;
      v32 = "";
      v19 = "{\"msg%{public}.0s\":\"#usesync #warning Couldn't find an active device\"}";
LABEL_29:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&buf, 0x12u);
    }
  }
  return 0;
}

- (BOOL)isPaired
{
  return [(CLUsageSyncManager *)self pairedDeviceID] != 0;
}

- (BOOL)_sendMessage:(id)a3 identifier:(id *)a4 error:(id *)a5
{
  [self universe].silo
  if ([(CLUsageSyncManager *)self isPaired])
  {
    id v9 = +[NSMutableDictionary dictionary];
    [v9 setObject:objc_msgSend(a3, "messageType") forKeyedSubscript:@"kCLUsageSyncMessageTypeKey"];
    if ([a3 dataPayload]) {
      [v9 setObject:objc_msgSend(a3, "dataPayload") forKeyedSubscript:@"kCLUsageSyncMessageDataKey"];
    }
    sub_100103240();
    if (sub_100106424())
    {
      id v10 = [(CLUsageSyncManager *)self currentlyActiveDevice];
      if (!v10 || ([v10 operatingSystemVersion], *(uint64_t *)buf <= 4))
      {
        *(void *)uint64_t buf = 0;
        uint64_t v11 = sub_1000A6958();
        sub_1004D0C04(v11, @"kCLUsageSyncNextSequenceNumberKey", buf);
        uint64_t v12 = sub_1000A6958();
        uint64_t v19 = *(void *)buf + 1;
        sub_1004D2F30(v12, @"kCLUsageSyncNextSequenceNumberKey", &v19);
        uint64_t v13 = *(void *)sub_1000A6958();
        (*(void (**)(void))(v13 + 944))();
        [v9 setObject:+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", *(void *)buf) forKeyedSubscript:@"kCLUsageSyncMessageSequenceNumberKey"];
      }
    }
    id v14 = [(CLUsageSyncManager *)self currentlyActiveDevice];
    if (v14)
    {
      if ([v14 relationship] == (id)2)
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022CFED0);
        }
        uint64_t v15 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t buf = 68289026;
          *(_DWORD *)&uint8_t buf[4] = 0;
          __int16 v21 = 2082;
          long long v22 = "";
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync device is standalone watch. Spoof it is sent\"}", buf, 0x12u);
        }
        LOBYTE(v14) = 1;
      }
      else
      {
        LOBYTE(v14) = -[self->_service sendMessage:v9 toDestinations:+[NSSet setWithObject:](NSSet, "setWithObject:", (id)IDSCopyIDForDevice()) priority:[a3 priority] options:[a3 idsOptions] identifier:a4 error:a5];
      }
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    uint64_t v16 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v21 = 2082;
      long long v22 = "";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Attempted to send when unpaired\"}", buf, 0x12u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CFED0);
      }
    }
    v17 = qword_102419538;
    LODWORD(v14) = os_signpost_enabled((os_log_t)qword_102419538);
    if (v14)
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v21 = 2082;
      long long v22 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#usesync Attempted to send when unpaired", "{\"msg%{public}.0s\":\"#usesync Attempted to send when unpaired\"}", buf, 0x12u);
      LOBYTE(v14) = 0;
    }
  }
  return (char)v14;
}

- (void)addMessageToErrorQueue:(id)a3
{
  [self universe].silo
  if (!self->_retryTimerSet)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    id v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 68289026;
      int v9 = 0;
      __int16 v10 = 2082;
      uint64_t v11 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Setting 5 minute error retry timer\"}", (uint8_t *)&v8, 0x12u);
    }
    [(CLTimer *)self->_retryTimer setNextFireDelay:300.0];
    self->_retryTimerSet = 1;
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CFED0);
  }
  id v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [[[a3 message] messageType] UTF8String];
    int v8 = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    uint64_t v11 = "";
    __int16 v12 = 2082;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Adding a message to the error queue\", \"type\":%{public, location:escape_only}s}", (uint8_t *)&v8, 0x1Cu);
  }
  [(NSMutableArray *)self->_errorQueue addObject:a3];
}

- (void)drainErrorQueue
{
  [(-[CLUsageSyncManager universe](self, "universe")) silo];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CFED0);
  }
  id v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(NSMutableArray *)self->_errorQueue count];
    uint64_t buf = 68289282;
    __int16 v17 = 2082;
    v18 = "";
    __int16 v19 = 2050;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Draining the error queue\", \"count\":%{public}lu}", (uint8_t *)&buf, 0x1Cu);
  }
  id v5 = self->_errorQueue;
  [(CLUsageSyncManager *)self setErrorQueue:+[NSMutableArray array]];
  [(CLTimer *)self->_retryTimer setNextFireDelay:1.79769313e308];
  self->_retryTimerSet = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CLUsageSyncManager *)self handleMessageError:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CFED0);
  }
  __int16 v10 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289026;
    __int16 v17 = 2082;
    v18 = "";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Error queue drained\"}", (uint8_t *)&buf, 0x12u);
  }
}

- (void)messageFailedToSend:(id)a3 withError:(id)a4 recoverable:(BOOL)a5
{
  BOOL v5 = a5;
  if ([a4 code] == (id)24)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    int v9 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 68289026;
      int v13 = 0;
      __int16 v14 = 2082;
      uint64_t v15 = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Message was replaced\"}", (uint8_t *)&v12, 0x12u);
    }
  }
  else
  {
    __int16 v10 = objc_alloc_init(CLClientManagerUsageSyncMessageError);
    [(CLClientManagerUsageSyncMessageError *)v10 setMessage:a3];
    [(CLClientManagerUsageSyncMessageError *)v10 setError:a4];
    [(CLClientManagerUsageSyncMessageError *)v10 setRecoverable:v5];
    if ([a4 code] == (id)23 && v5)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CFED0);
      }
      long long v11 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 68289026;
        int v13 = 0;
        __int16 v14 = 2082;
        uint64_t v15 = "";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Message timed out.  Retrying\"}", (uint8_t *)&v12, 0x12u);
      }
      [(CLUsageSyncManager *)self handleMessageError:v10];
    }
    else
    {
      [(CLUsageSyncManager *)self addMessageToErrorQueue:v10];
    }
  }
}

- (void)handleMessageError:(id)a3
{
  id v5 = [a3 message];
  id v6 = [a3 error];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CFED0);
  }
  id v7 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289282;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)uint64_t v16 = 2082;
    *(void *)&v16[2] = "";
    *(_WORD *)&v16[10] = 2114;
    *(void *)&v16[12] = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync #warning Got error from IDS, attempting to recover\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  if ([v5 isMessageOfType:@"kCLUsageSyncMessageUsageUpdateKey"])
  {
    id v8 = sub_1008BC6D0((uint64_t)[v5 dataPayload][@"kCLUsageSyncClientKey"]);
    *(void *)uint64_t buf = 0;
    *(void *)uint64_t v16 = buf;
    *(void *)&v16[8] = 0x3052000000;
    *(void *)&v16[16] = sub_100177AF8;
    __int16 v17 = sub_100177428;
    uint64_t v18 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1008BC740;
    v14[3] = &unk_1022CFDC8;
    v14[4] = v8;
    v14[5] = buf;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1008BC7D4;
    v13[3] = &unk_1022CFDF0;
    v13[5] = v8;
    v13[6] = buf;
    v13[4] = self;
    [(CLClientManagerPublicProtocol *)[(CLUsageSyncManager *)self manager] doAsync:v14 withReply:v13];
    _Block_object_dispose(buf, 8);
  }
  else if ([v5 isMessageOfType:@"kCLUsageSyncMessageResyncResponseKey"])
  {
    [(CLUsageSyncManager *)self sendAllUsageSyncData];
  }
  else if ([v5 isMessageOfType:@"kCLUsageSyncMessageResyncRequestKey"])
  {
    [(CLUsageSyncManager *)self requestFullResync];
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    int v9 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      id v10 = [[[v5 messageType] UTF8String];
      *(_DWORD *)uint64_t buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)uint64_t v16 = 2082;
      *(void *)&v16[2] = "";
      *(_WORD *)&v16[10] = 2082;
      *(void *)&v16[12] = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Unrecognized type message failed to send.  Cannot recover.\", \"type\":%{public, location:escape_only}s}", buf, 0x1Cu);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CFED0);
      }
    }
    long long v11 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      id v12 = [[[v5 messageType] UTF8String];
      *(_DWORD *)uint64_t buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)uint64_t v16 = 2082;
      *(void *)&v16[2] = "";
      *(_WORD *)&v16[10] = 2082;
      *(void *)&v16[12] = v12;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#usesync Unrecognized type message failed to send.  Cannot recover.", "{\"msg%{public}.0s\":\"#usesync Unrecognized type message failed to send.  Cannot recover.\", \"type\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
  }
}

- (void)sendMessage:(id)a3
{
  [(-[CLUsageSyncManager universe](self, "universe")) silo];
  if (self->_pairedDeviceID)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    BOOL v5 = [(CLUsageSyncManager *)self _sendMessage:a3 identifier:&v13 error:&v12];
    if (!v5 || v12)
    {
      [(CLUsageSyncManager *)self messageFailedToSend:a3 withError:v12 recoverable:v5];
    }
    else if (v13)
    {
      id v6 = [(CLUsageSyncManager *)self messagesWaitingForAck];
      [(NSMutableDictionary *)v6 setObject:a3 forKeyedSubscript:v13];
    }
    else
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CFED0);
      }
      id v8 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        id v9 = [[objc_msgSend(a3, "messageType") UTF8String];
        *(_DWORD *)uint64_t buf = 68289282;
        int v15 = 0;
        __int16 v16 = 2082;
        __int16 v17 = "";
        __int16 v18 = 2082;
        id v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Didn't get an identifier for message\", \"type\":%{public, location:escape_only}s}", buf, 0x1Cu);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022CFED0);
        }
      }
      id v10 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        id v11 = [[objc_msgSend(a3, "messageType") UTF8String];
        *(_DWORD *)uint64_t buf = 68289282;
        int v15 = 0;
        __int16 v16 = 2082;
        __int16 v17 = "";
        __int16 v18 = 2082;
        id v19 = v11;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#usesync Didn't get an identifier for message", "{\"msg%{public}.0s\":\"#usesync Didn't get an identifier for message\", \"type\":%{public, location:escape_only}s}", buf, 0x1Cu);
      }
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    id v7 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v15 = 0;
      __int16 v16 = 2082;
      __int16 v17 = "";
      __int16 v18 = 2082;
      id v19 = [[[a3 messageType] UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Dropping a message because we aren't paired\", \"type\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
  }
}

- (void)sendMessageWithMessageType:(id)a3 dataPayload:(id)a4 priority:(int64_t)a5 idsOptions:(id)a6
{
  [(-[CLUsageSyncManager universe](self, "universe")) silo];
  id v11 = objc_alloc_init(CLClientManagerUsageSyncMessage);
  [(CLClientManagerUsageSyncMessage *)v11 setMessageType:a3];
  [(CLClientManagerUsageSyncMessage *)v11 setDataPayload:a4];
  [(CLClientManagerUsageSyncMessage *)v11 setPriority:a5];
  [(CLClientManagerUsageSyncMessage *)v11 setIdsOptions:a6];

  [(CLUsageSyncManager *)self sendMessage:v11];
}

- (void)requestFullResync
{
  [self universe].silo
  if ([(CLUsageSyncManager *)self isPaired])
  {
    v8[0] = IDSSendMessageOptionTimeoutKey;
    v8[1] = IDSSendMessageOptionEncryptPayloadKey;
    v9[0] = &off_102392BE8;
    v9[1] = &__kCFBooleanTrue;
    _DWORD v8[2] = IDSSendMessageOptionForceLocalDeliveryKey;
    v8[3] = IDSSendMessageOptionQueueOneIdentifierKey;
    v9[2] = &__kCFBooleanTrue;
    v9[3] = @"kCLUsageSyncResyncRequestQueueIdentifierKey";
    [(CLUsageSyncManager *)self sendMessageWithMessageType:@"kCLUsageSyncMessageResyncRequestKey" dataPayload:0 priority:300 idsOptions:+[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4]];
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    uint64_t v3 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t buf = 68289026;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      id v4 = "{\"msg%{public}.0s\":\"#usesync Full resync requested\"}";
      BOOL v5 = v3;
      os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v5, v6, v4, (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    uint64_t v7 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
    {
      uint64_t buf = 68289026;
      __int16 v11 = 2082;
      uint64_t v12 = "";
      id v4 = "{\"msg%{public}.0s\":\"#usesync Not performing full sync due to being unpaired\"}";
      BOOL v5 = v7;
      os_log_type_t v6 = OS_LOG_TYPE_INFO;
      goto LABEL_10;
    }
  }
}

- (void)client:(id)a3 didChangeUsageData:(id)a4
{
  char v7 = _os_feature_enabled_impl();
  sub_100103240();
  if (v7)
  {
    if (sub_10010145C())
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CFED0);
      }
      id v8 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 68289026;
        int v11 = 0;
        __int16 v12 = 2082;
        uint64_t v13 = "";
        id v9 = "{\"msg%{public}.0s\":\"#usesync dropping watch usage data change\"}";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0x12u);
        return;
      }
      return;
    }
LABEL_14:
    [(CLUsageSyncManager *)self client:a3 didChangeUsageDataInternal:a4];
    return;
  }
  if (!sub_100106424()) {
    goto LABEL_14;
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CFED0);
  }
  id v8 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 68289026;
    int v11 = 0;
    __int16 v12 = 2082;
    uint64_t v13 = "";
    id v9 = "{\"msg%{public}.0s\":\"#didChangeUsageData dropping companion usage data change\"}";
    goto LABEL_12;
  }
}

- (void)client:(id)a3 didChangeUsageDataInternal:(id)a4
{
  [self universe].silo
  if (a4)
  {
    if ([(CLUsageSyncManager *)self isPaired])
    {
      v27[0] = @"kCLUsageSyncClientKey";
      v27[1] = @"kCLUsageSyncUsageKey";
      v28[0] = a3;
      v28[1] = a4;
      char v7 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
      v25[0] = IDSSendMessageOptionTimeoutKey;
      v25[1] = IDSSendMessageOptionEncryptPayloadKey;
      v26[0] = &off_102392BE8;
      v26[1] = &__kCFBooleanTrue;
      v25[2] = IDSSendMessageOptionForceLocalDeliveryKey;
      v25[3] = IDSSendMessageOptionNonWakingKey;
      v26[2] = &__kCFBooleanTrue;
      v26[3] = &__kCFBooleanTrue;
      v25[4] = IDSSendMessageOptionQueueOneIdentifierKey;
      v26[4] = [@"usage-" stringByAppendingString:a3];
      [(CLUsageSyncManager *)self sendMessageWithMessageType:@"kCLUsageSyncMessageUsageUpdateKey" dataPayload:v7 priority:300 idsOptions:+[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:5]];
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CFED0);
      }
      uint64_t v8 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 68289538;
        int v18 = 0;
        __int16 v19 = 2082;
        id v20 = "";
        __int16 v21 = 2082;
        id v22 = [a3 UTF8String];
        __int16 v23 = 2114;
        id v24 = a4;
        id v9 = "{\"msg%{public}.0s\":\"#usesync Enqueued usage update message\", \"client\":%{public, location:escape_only}"
             "s, \"usage\":%{public, location:escape_only}@}";
        int v10 = v8;
        os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
        uint32_t v12 = 38;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v17, v12);
      }
    }
    else
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CFED0);
      }
      uint64_t v16 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
      {
        int v17 = 68289026;
        int v18 = 0;
        __int16 v19 = 2082;
        id v20 = "";
        id v9 = "{\"msg%{public}.0s\":\"#usesync Not performing sync due to being unpaired\"}";
        int v10 = v16;
        os_log_type_t v11 = OS_LOG_TYPE_INFO;
        uint32_t v12 = 18;
        goto LABEL_18;
      }
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    uint64_t v13 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      int v17 = 68289282;
      int v18 = 0;
      __int16 v19 = 2082;
      id v20 = "";
      __int16 v21 = 2082;
      id v22 = [a3 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Got empty usage dictionary\", \"client\":%{public, location:escape_only}s}", (uint8_t *)&v17, 0x1Cu);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CFED0);
      }
    }
    __int16 v14 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      id v15 = [a3 UTF8String];
      int v17 = 68289282;
      int v18 = 0;
      __int16 v19 = 2082;
      id v20 = "";
      __int16 v21 = 2082;
      id v22 = v15;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#usesync Got empty usage dictionary", "{\"msg%{public}.0s\":\"#usesync Got empty usage dictionary\", \"client\":%{public, location:escape_only}s}", (uint8_t *)&v17, 0x1Cu);
    }
  }
}

- (void)onStatusBarIconChange:(int)a3
{
  sub_100103240();
  if (sub_10010145C())
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    BOOL v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v10 = 0;
      __int16 v11 = 2082;
      uint32_t v12 = "";
      os_log_type_t v6 = "{\"msg%{public}.0s\":\"#onStatusBarIconChange on watch, dropping iconState change\"}";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0x12u);
    }
  }
  else
  {
    dword_10247ED48 = a3;
    if (self->_coalescingUpdates)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CFED0);
      }
      BOOL v5 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289026;
        int v10 = 0;
        __int16 v11 = 2082;
        uint32_t v12 = "";
        os_log_type_t v6 = "{\"msg%{public}.0s\":\"#onStatusBarIconChange dropping iconState change, coalescing updates\"}";
        goto LABEL_11;
      }
    }
    else
    {
      self->_coalescingUpdates = 1;
      dispatch_time_t v7 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1008BD524;
      block[3] = &unk_10229FED8;
      block[4] = self;
      dispatch_after(v7, (dispatch_queue_t)[objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo") queue], block);
    }
  }
}

- (void)onStatusBarIconChangeInternal:(int)a3
{
  if (self->_lastStatusBarIconState == a3)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    id v4 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v16 = 0;
      __int16 v17 = 2082;
      int v18 = "";
      __int16 v19 = 1026;
      LODWORD(v20) = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#onStatusBarIconChangeInternal dropping duplicate iconState\", \"iconState\":%{public}d}", buf, 0x18u);
    }
  }
  else
  {
    self->_lastStatusBarIconState = a3;
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    os_log_type_t v6 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      int v16 = 0;
      __int16 v17 = 2082;
      int v18 = "";
      __int16 v19 = 1025;
      LODWORD(v20) = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#onStatusBarIconChangeInternal processing iconState\", \"iconState\":%{private}d}", buf, 0x18u);
    }
    if (a3 == 1)
    {
      char v7 = 0;
      uint64_t v8 = 2;
    }
    else if (a3 == 2)
    {
      char v7 = 0;
      uint64_t v8 = 10;
    }
    else
    {
      char v7 = 1;
      uint64_t v8 = 21;
    }
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    if ((v7 & 1) == 0)
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      sub_100101464(v8, &v14, &v13);
      if (v14)
      {
        int v10 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
        [v9 setValue:v10 forKey:v14];
      }
      else
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022CFED0);
        }
        __int16 v11 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)uint64_t buf = 68289282;
          int v16 = 0;
          __int16 v17 = 2082;
          int v18 = "";
          __int16 v19 = 2050;
          uint64_t v20 = v8;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#onStatusBarIconChangeInternal lacks start key\", \"clientServiceType\":%{public}lu}", buf, 0x1Cu);
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_1022CFED0);
          }
        }
        uint32_t v12 = qword_102419538;
        if (os_signpost_enabled((os_log_t)qword_102419538))
        {
          *(_DWORD *)uint64_t buf = 68289282;
          int v16 = 0;
          __int16 v17 = 2082;
          int v18 = "";
          __int16 v19 = 2050;
          uint64_t v20 = v8;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#onStatusBarIconChangeInternal lacks start key", "{\"msg%{public}.0s\":\"#onStatusBarIconChangeInternal lacks start key\", \"clientServiceType\":%{public}lu}", buf, 0x1Cu);
        }
      }
    }
    [(CLUsageSyncManager *)self client:@"com.apple.location.AggregateLocationIconApp" didChangeUsageDataInternal:v9];
  }
}

- (void)sendAllUsageSyncData
{
  [self universe].silo
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3052000000;
  v5[3] = sub_100177AF8;
  v5[4] = sub_100177428;
  v5[5] = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008BDA00;
  v4[3] = &unk_1022C16C0;
  v4[4] = v5;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1008BDA50;
  v3[3] = &unk_1022CFE18;
  v3[4] = self;
  void v3[5] = v5;
  [(CLClientManagerPublicProtocol *)[(CLUsageSyncManager *)self manager] doAsync:v4 withReply:v3];
  _Block_object_dispose(v5, 8);
}

- (id)mungedUsageDataForPotentiallyOldUsageData:(id)a3
{
  sub_100103240();
  if (!sub_100106424()) {
    return a3;
  }
  id v5 = [(CLUsageSyncManager *)self currentlyActiveDevice];
  if (v5)
  {
    [v5 operatingSystemVersion];
    if (*(uint64_t *)buf > 3) {
      return a3;
    }
  }
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  unint64_t v9 = 0;
  *(void *)&long long v6 = 68289282;
  long long v32 = v6;
  do
  {
    uint64_t v10 = qword_101D51898[v7];
    v33 = 0;
    v34 = 0;
    sub_100101464(v10, &v34, &v33);
    if (v34) {
      BOOL v11 = v33 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      uint64_t v14 = [(NSNumber *)[a3 objectForKeyedSubscript:];
      id v15 = [a3 objectForKeyedSubscript:v33];
      int v16 = v15;
      if (v14) {
        BOOL v17 = v15 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      if (v17)
      {
        if (!v14)
        {
LABEL_36:
          uint64_t v14 = v8;
          goto LABEL_37;
        }
        if (v8)
        {
LABEL_35:
          [(NSNumber *)v8 doubleValue];
          double v24 = v23;
          [(NSNumber *)v14 doubleValue];
          if (v24 > v25) {
            goto LABEL_37;
          }
          goto LABEL_36;
        }
      }
      else
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022CFED0);
        }
        int v18 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)uint64_t buf = v32;
          *(_DWORD *)&uint8_t buf[4] = 0;
          __int16 v36 = 2082;
          v37 = "";
          __int16 v38 = 2114;
          uint64_t v39 = (uint64_t)a3;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Found start time AND stop time for a service\", \"usageData\":%{public, location:escape_only}@}", buf, 0x1Cu);
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_1022CFED0);
          }
        }
        __int16 v19 = qword_102419538;
        if (os_signpost_enabled((os_log_t)qword_102419538))
        {
          *(_DWORD *)uint64_t buf = v32;
          *(_DWORD *)&uint8_t buf[4] = 0;
          __int16 v36 = 2082;
          v37 = "";
          __int16 v38 = 2114;
          uint64_t v39 = (uint64_t)a3;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#usesync Found start time AND stop time for a service", "{\"msg%{public}.0s\":\"#usesync Found start time AND stop time for a service\", \"usageData\":%{public, location:escape_only}@}", buf, 0x1Cu);
        }
        [v16 doubleValue:v32];
        double v21 = v20;
        [(NSNumber *)v14 doubleValue];
        if (v21 > v22)
        {
          uint64_t v14 = v8;
          goto LABEL_38;
        }
        int v16 = 0;
        if (v8) {
          goto LABEL_35;
        }
      }
LABEL_37:
      if (!v16)
      {
LABEL_41:
        uint64_t v8 = v14;
        goto LABEL_42;
      }
LABEL_38:
      if (!v9 || ([(id)v9 doubleValue], double v27 = v26, objc_msgSend(v16, "doubleValue"), v27 < v28)) {
        unint64_t v9 = (unint64_t)v16;
      }
      goto LABEL_41;
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    uint32_t v12 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = v32;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v36 = 2082;
      v37 = "";
      __int16 v38 = 2050;
      uint64_t v39 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Insanity!  A service lacks start/stop keys\", \"service\":%{public}lu}", buf, 0x1Cu);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CFED0);
      }
    }
    uint64_t v13 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      *(_DWORD *)uint64_t buf = v32;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v36 = 2082;
      v37 = "";
      __int16 v38 = 2050;
      uint64_t v39 = v10;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#usesync Insanity!  A service lacks start/stop keys", "{\"msg%{public}.0s\":\"#usesync Insanity!  A service lacks start/stop keys\", \"service\":%{public}lu}", buf, 0x1Cu);
    }
LABEL_42:
    ++v7;
  }
  while (v7 != 7);
  if ((unint64_t)v8 | v9)
  {
    a3 = [a3 mutableCopy];
    v34 = 0;
    *(void *)uint64_t buf = 0;
    sub_100101464(10, buf, &v34);
    if (v8)
    {
      v29 = *(__CFString **)buf;
    }
    else
    {
      v29 = v34;
      [(id)v9 doubleValue];
      uint64_t v8 = +[NSNumber numberWithDouble:v30 + 10.0];
    }
    [a3 setObject:v8 forKeyedSubscript:v29];
  }
  return a3;
}

- (CLClientManagerPublicProtocol)manager
{
  return (CLClientManagerPublicProtocol *)*((void *)self->_clientManagerClient.__ptr_.__value_ + 2);
}

- (void)handleMessageSendError:(id)a3 identifier:(id)a4
{
  if (a4)
  {
    id v7 = [(NSMutableDictionary *)[(CLUsageSyncManager *)self messagesWaitingForAck] objectForKeyedSubscript:a4];
    if (v7)
    {
      [(CLUsageSyncManager *)self messageFailedToSend:v7 withError:a3 recoverable:1];
    }
    else
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CFED0);
      }
      uint64_t v10 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 68289538;
        int v12 = 0;
        __int16 v13 = 2082;
        uint64_t v14 = "";
        __int16 v15 = 2082;
        id v16 = [a4 UTF8String];
        __int16 v17 = 2114;
        id v18 = a3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Message from past life failed\", \"identifier\":%{public, location:escape_only}s, \"error\":%{public, location:escape_only}@}", (uint8_t *)&v11, 0x26u);
      }
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    uint64_t v8 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      int v11 = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      uint64_t v14 = "";
      __int16 v15 = 2114;
      id v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Unknown message failed\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&v11, 0x1Cu);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CFED0);
      }
    }
    unint64_t v9 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      int v11 = 68289282;
      int v12 = 0;
      __int16 v13 = 2082;
      uint64_t v14 = "";
      __int16 v15 = 2114;
      id v16 = a3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#usesync Unknown message failed", "{\"msg%{public}.0s\":\"#usesync Unknown message failed\", \"error\":%{public, location:escape_only}@}", (uint8_t *)&v11, 0x1Cu);
    }
  }
}

- (void)handleMessageSendSuccessForIdentifier:(id)a3
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CFED0);
  }
  id v4 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289282;
    v5[1] = 0;
    __int16 v6 = 2082;
    id v7 = "";
    __int16 v8 = 2082;
    id v9 = [a3 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Message sent\", \"identifier\":%{public, location:escape_only}s}", (uint8_t *)v5, 0x1Cu);
  }
}

- (void)handleMessageUsageUpdateWithMessageData:(id)a3
{
  if (!_os_feature_enabled_impl() || (sub_100103240(), !sub_100106424()))
  {
    [self universe].silo
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    id v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      *(_DWORD *)&uint8_t buf[4] = 0;
      LOWORD(v16) = 2082;
      *(void *)((char *)&v16 + 2) = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Got usage update\"}", buf, 0x12u);
    }
    id v6 = [a3 objectForKeyedSubscript:@"kCLUsageSyncClientKey"];
    id v7 = [a3 objectForKeyedSubscript:@"kCLUsageSyncUsageKey"];
    id v8 = v7;
    if (v6 && v7)
    {
      id v9 = sub_1008BC6D0((uint64_t)v6);
      id v10 = [(CLUsageSyncManager *)self mungedUsageDataForPotentiallyOldUsageData:v8];
      *(void *)uint64_t buf = 0;
      *(void *)&long long v16 = buf;
      *((void *)&v16 + 1) = 0x2020000000;
      LOBYTE(v17) = 0;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1008BE8F0;
      v14[3] = &unk_1022CFE40;
      v14[4] = v9;
      v14[5] = v10;
      void v14[6] = buf;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1008BE984;
      v13[3] = &unk_1022CFE18;
      v13[4] = self;
      v13[5] = buf;
      [(CLClientManagerPublicProtocol *)[(CLUsageSyncManager *)self manager] doAsync:v14 withReply:v13];
      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CFED0);
      }
      int v11 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)uint64_t buf = 68289538;
        *(_DWORD *)&uint8_t buf[4] = 0;
        LOWORD(v16) = 2082;
        *(void *)((char *)&v16 + 2) = "";
        WORD5(v16) = 1026;
        HIDWORD(v16) = v6 != 0;
        __int16 v17 = 1026;
        BOOL v18 = v8 != 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Didn't get an expected parameter\", \"client key\":%{public}hhd, \"usage data\":%{public}hhd}", buf, 0x1Eu);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1022CFED0);
        }
      }
      int v12 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        *(_DWORD *)uint64_t buf = 68289538;
        *(_DWORD *)&uint8_t buf[4] = 0;
        LOWORD(v16) = 2082;
        *(void *)((char *)&v16 + 2) = "";
        WORD5(v16) = 1026;
        HIDWORD(v16) = v6 != 0;
        __int16 v17 = 1026;
        BOOL v18 = v8 != 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#usesync Didn't get an expected parameter", "{\"msg%{public}.0s\":\"#usesync Didn't get an expected parameter\", \"client key\":%{public}hhd, \"usage data\":%{public}hhd}", buf, 0x1Eu);
      }
    }
  }
}

- (void)handleMessageResyncRequestWithMessageData:(id)a3
{
  [self universe:a3 silo];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CFED0);
  }
  id v4 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    id v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Got request for full resync of data\"}", (uint8_t *)v5, 0x12u);
  }
  [(CLUsageSyncManager *)self sendAllUsageSyncData];
}

- (void)handleMessageResyncResponseWithMessageData:(id)a3
{
  [self universe].silo
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CFED0);
  }
  id v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    LOWORD(v17) = 2082;
    *(void *)((char *)&v17 + 2) = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Got full resync data\"}", buf, 0x12u);
  }
  id v6 = +[NSMutableDictionary dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v12 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(a3);
        }
        [v6 setObject:-[CLUsageSyncManager mungedUsageDataForPotentiallyOldUsageData:](self, "mungedUsageDataForPotentiallyOldUsageData:", objc_msgSend(a3, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i))) forKeyedSubscript:sub_1008BC6D0(*(void *)(*((void *)&v12 + 1) + 8 * i))];
      }
      id v7 = [a3 countByEnumeratingWithState:&v12 objects:v19 count:16];
    }
    while (v7);
  }
  *(void *)uint64_t buf = 0;
  *(void *)&long long v17 = buf;
  *((void *)&v17 + 1) = 0x2020000000;
  char v18 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1008BED40;
  v11[3] = &unk_1022CFE68;
  v11[4] = v6;
  v11[5] = buf;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1008BEE5C;
  v10[3] = &unk_1022CFE18;
  v10[4] = self;
  v10[5] = buf;
  [(CLClientManagerPublicProtocol *)[(CLUsageSyncManager *)self manager] doAsync:v11 withReply:v10];
  _Block_object_dispose(buf, 8);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  [self universe:a3, a4 silo];
  if (!a7 && v8)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    int v11 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 68289282;
      int v16 = 0;
      __int16 v17 = 2082;
      char v18 = "";
      __int16 v19 = 2082;
      id v20 = [a5 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync sent\", \"identifier\":%{public, location:escape_only}s}", (uint8_t *)&v15, 0x1Cu);
    }
    [(CLUsageSyncManager *)self handleMessageSendSuccessForIdentifier:a5];
LABEL_19:
    [(NSMutableDictionary *)[(CLUsageSyncManager *)self messagesWaitingForAck] removeObjectForKey:a5];
    return;
  }
  id v12 = [[objc_msgSend(a7, "userInfo") objectForKeyedSubscript:NSUnderlyingErrorKey];
  if (!v12 || [v12 code] != (id)32)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    long long v14 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 68289794;
      int v16 = 0;
      __int16 v17 = 2082;
      char v18 = "";
      __int16 v19 = 2082;
      id v20 = [a5 UTF8String];
      __int16 v21 = 1026;
      BOOL v22 = v8;
      __int16 v23 = 2114;
      id v24 = a7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync #warning Failure\", \"identifier\":%{public, location:escape_only}s, \"succeeded\":%{public}hhd, \"error\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x2Cu);
    }
    [(CLUsageSyncManager *)self handleMessageSendError:a7 identifier:a5];
    goto LABEL_19;
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CFED0);
  }
  long long v13 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 68289026;
    int v16 = 0;
    __int16 v17 = 2082;
    char v18 = "";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Sync to/from standalone watch is not supported\"}", (uint8_t *)&v15, 0x12u);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  [self universe:a3, a4, a5, a6, a7]
  sub_100103240();
  if (!sub_10010145C()) {
    return;
  }
  id v9 = [a5 objectForKeyedSubscript:@"kCLUsageSyncMessageTypeKey"];
  if (v9)
  {
    id v10 = v9;
    id v11 = [a5 objectForKeyedSubscript:@"kCLUsageSyncMessageDataKey"];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    id v24 = sub_1008BF5B0;
    double v25 = &unk_1022CFE90;
    double v26 = v10;
    if ([@"kCLUsageSyncMessageUsageUpdateKey" isEqualToString:v10])
    {
      [(CLUsageSyncManager *)self handleMessageUsageUpdateWithMessageData:v11];
      return;
    }
    if (v24((uint64_t)v23, @"kCLUsageSyncMessageResyncRequestKey"))
    {
      [(CLUsageSyncManager *)self handleMessageResyncRequestWithMessageData:v11];
      return;
    }
    if (v24((uint64_t)v23, @"kCLUsageSyncMessageResyncResponseKey"))
    {
      [(CLUsageSyncManager *)self handleMessageResyncResponseWithMessageData:v11];
      return;
    }
    if (v24((uint64_t)v23, @"kCLUsageSyncMessagePromptKey"))
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CFED0);
      }
      char v18 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68289283;
        int v28 = 0;
        __int16 v29 = 2082;
        double v30 = "";
        __int16 v31 = 2113;
        id v32 = a5;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync #warning received legacy kCLUsageSyncMessagePromptKey message, ignoring\", \"payload\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
      return;
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    __int16 v19 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      id v20 = [v10 UTF8String];
      *(_DWORD *)uint64_t buf = 68289539;
      int v28 = 0;
      __int16 v29 = 2082;
      double v30 = "";
      __int16 v31 = 2082;
      id v32 = v20;
      __int16 v33 = 2113;
      id v34 = a5;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Unrecognized message\", \"type\":%{public, location:escape_only}s, \"payload\":%{private, location:escape_only}@}", buf, 0x26u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CFED0);
      }
    }
    uint64_t v21 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      id v22 = [v10 UTF8String];
      *(_DWORD *)uint64_t buf = 68289539;
      int v28 = 0;
      __int16 v29 = 2082;
      double v30 = "";
      __int16 v31 = 2082;
      id v32 = v22;
      __int16 v33 = 2113;
      id v34 = a5;
      long long v14 = "#usesync Unrecognized message";
      int v15 = "{\"msg%{public}.0s\":\"#usesync Unrecognized message\", \"type\":%{public, location:escape_only}s, \"payload"
            "\":%{private, location:escape_only}@}";
      int v16 = v21;
      uint32_t v17 = 38;
      goto LABEL_12;
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022CFED0);
    }
    id v12 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v28 = 0;
      __int16 v29 = 2082;
      double v30 = "";
      __int16 v31 = 2114;
      id v32 = a5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#usesync Got invalid message from IDS\", \"message\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022CFED0);
      }
    }
    uint64_t v13 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      int v28 = 0;
      __int16 v29 = 2082;
      double v30 = "";
      __int16 v31 = 2114;
      id v32 = a5;
      long long v14 = "#usesync Got invalid message from IDS";
      int v15 = "{\"msg%{public}.0s\":\"#usesync Got invalid message from IDS\", \"message\":%{public, location:escape_only}@}";
      int v16 = v13;
      uint32_t v17 = 28;
LABEL_12:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v14, v15, buf, v17);
    }
  }
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  [self universe:a3, a4 silo];
  id v5 = [(CLUsageSyncManager *)self currentlyActiveDevice];
  if (v5 && [v5 isNearby])
  {
    if ([(CLUsageSyncManager *)self activeDeviceNearbyStatus] == 1) {
      return;
    }
    int v6 = 1;
    uint64_t v7 = 1;
  }
  else
  {
    if ([(CLUsageSyncManager *)self activeDeviceNearbyStatus] == 2) {
      return;
    }
    int v6 = 0;
    uint64_t v7 = 2;
  }
  [(CLUsageSyncManager *)self setActiveDeviceNearbyStatus:v7];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022CFED0);
  }
  BOOL v8 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t buf = 68289282;
    __int16 v12 = 2082;
    uint64_t v13 = "";
    __int16 v14 = 1026;
    int v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#usesync Paired device nearby change\", \"is nearby\":%{public}hhd}", (uint8_t *)&buf, 0x18u);
  }
  if (v6)
  {
    if (self->_needFullResync)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1008BF8F4;
      v9[3] = &unk_10229FED8;
      void v9[4] = self;
      [objc_msgSend(-[CLUsageSyncManager universe](self, "universe"), "silo") async:v9];
    }
  }
  else if (self->_dirtyUsageSyncState)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1008BF8CC;
    v10[3] = &unk_10229FED8;
    v10[4] = self;
    [(CLClientManagerPublicProtocol *)[(CLUsageSyncManager *)self manager] doAsync:&stru_1022CFEB0 withReply:v10];
  }
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 32, 1);
}

- (void)setService:(id)a3
{
}

- (BOOL)dirtyUsageSyncState
{
  return self->_dirtyUsageSyncState;
}

- (void)setDirtyUsageSyncState:(BOOL)a3
{
  self->_dirtyUsageSyncState = a3;
}

- (BOOL)needFullResync
{
  return self->_needFullResync;
}

- (void)setNeedFullResync:(BOOL)a3
{
  self->_needFullResync = a3;
}

- (NSUUID)pairedDeviceID
{
  return self->_pairedDeviceID;
}

- (void)setPairedDeviceID:(id)a3
{
}

- (id)pairedDeviceRegistry
{
  return self->_pairedDeviceRegistry;
}

- (void)setPairedDeviceRegistry:(id)a3
{
}

- (BOOL)retryTimerSet
{
  return self->_retryTimerSet;
}

- (void)setRetryTimerSet:(BOOL)a3
{
  self->_retryTimerSet = a3;
}

- (CLTimer)retryTimer
{
  return self->_retryTimer;
}

- (void)setRetryTimer:(id)a3
{
}

- (NSMutableArray)errorQueue
{
  return self->_errorQueue;
}

- (void)setErrorQueue:(id)a3
{
}

- (NSMutableDictionary)messagesWaitingForAck
{
  return self->_messagesWaitingForAck;
}

- (void)setMessagesWaitingForAck:(id)a3
{
}

- (int)activeDeviceNearbyStatus
{
  return self->_activeDeviceNearbyStatus;
}

- (void)setActiveDeviceNearbyStatus:(int)a3
{
  self->_activeDeviceNearbyStatus = a3;
}

- (void).cxx_destruct
{
  value = self->_clientManagerClient.__ptr_.__value_;
  self->_clientManagerClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end