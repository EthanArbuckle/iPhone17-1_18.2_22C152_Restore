@interface CLLocationStreamingConnectionManager
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)isRemoteWatchStreamingCompatible;
- (BOOL)pairIsNearby;
- (BOOL)rapportLinkActive;
- (BOOL)shouldUseIDSForLocationStreaming;
- (CLLocationStreamingConnectionManager)init;
- (IDSService)service;
- (NSMutableDictionary)unacknowledgedMessages;
- (NSMutableSet)clients;
- (RPCompanionLinkClient)rapportLink;
- (id)packageMessage:(id)a3;
- (void)activateRapportLinkIfNecessary;
- (void)addClient:(id)a3;
- (void)beginService;
- (void)endService;
- (void)retireClient:(id)a3;
- (void)sendMessage:(id)a3;
- (void)sendMessageIDS:(id)a3;
- (void)sendMessageRapport:(id)a3;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setClients:(id)a3;
- (void)setPairIsNearby:(BOOL)a3;
- (void)setRapportLink:(id)a3;
- (void)setRapportLinkActive:(BOOL)a3;
- (void)setService:(id)a3;
- (void)setSilo:(id)a3;
- (void)setUnacknowledgedMessages:(id)a3;
- (void)updateNearbyStatusWithCompanionLinkDevice:(id)a3 didConnect:(BOOL)a4;
- (void)updateNearbyStatusWithDevices:(id)a3;
- (void)withClients:(id)a3;
@end

@implementation CLLocationStreamingConnectionManager

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
  if (qword_10247B230 != -1) {
    dispatch_once(&qword_10247B230, &stru_1022B86E0);
  }
  return (id)qword_10247B228;
}

+ (BOOL)isSupported
{
  if (qword_10247B240 != -1) {
    dispatch_once(&qword_10247B240, &stru_1022B8700);
  }
  return byte_10247B238;
}

- (CLLocationStreamingConnectionManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLLocationStreamingConnectionManager;
  result = [(CLLocationStreamingConnectionManager *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLLocationStreamingConnectionManagerServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLLocationStreamingConnectionManagerClientProtocol];
  if (result) {
    result->_rapportLinkActive = 0;
  }
  return result;
}

- (void)updateNearbyStatusWithCompanionLinkDevice:(id)a3 didConnect:(BOOL)a4
{
  BOOL v4 = a4;
  if (objc_msgSend(objc_msgSend(a3, "effectiveIdentifier"), "hasPrefix:", @"BTPipe")
    && self->_pairIsNearby != v4)
  {
    self->_BOOL pairIsNearby = v4;
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022B88B0);
    }
    v6 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
    {
      BOOL pairIsNearby = self->_pairIsNearby;
      *(_DWORD *)buf = 68289282;
      int v10 = 0;
      __int16 v11 = 2082;
      v12 = "";
      __int16 v13 = 1026;
      BOOL v14 = pairIsNearby;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Nearby status change\", \"is nearby\":%{public}d}", buf, 0x18u);
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10051BC7C;
    v8[3] = &unk_1022B8728;
    v8[4] = self;
    [(CLLocationStreamingConnectionManager *)self withClients:v8];
  }
}

- (void)updateNearbyStatusWithDevices:(id)a3
{
  [self universe].silo
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v9 isDefaultPairedDevice] && objc_msgSend(v9, "isNearby"))
        {
          BOOL v10 = [v9 relationship] == (id)1;
          goto LABEL_12;
        }
      }
      id v6 = [a3 countByEnumeratingWithState:&v14 objects:v24 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_12:
  if (self->_pairIsNearby != v10)
  {
    self->_BOOL pairIsNearby = v10;
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022B88B0);
    }
    __int16 v11 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
    {
      BOOL pairIsNearby = self->_pairIsNearby;
      *(_DWORD *)buf = 68289282;
      int v19 = 0;
      __int16 v20 = 2082;
      v21 = "";
      __int16 v22 = 1026;
      BOOL v23 = pairIsNearby;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Nearby status change\", \"is nearby\":%{public}d}", buf, 0x18u);
    }
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10051BEBC;
    v13[3] = &unk_1022B8728;
    v13[4] = self;
    [(CLLocationStreamingConnectionManager *)self withClients:v13];
  }
}

- (void)activateRapportLinkIfNecessary
{
  if (!self->_rapportLink)
  {
    self->_rapportLink = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    -[RPCompanionLinkClient setDispatchQueue:](self->_rapportLink, "setDispatchQueue:", [objc_msgSend(-[CLLocationStreamingConnectionManager universe](self, "universe"), "silo") queue]);
    [(RPCompanionLinkClient *)self->_rapportLink setControlFlags:32];
  }
  if (![(CLLocationStreamingConnectionManager *)self rapportLinkActive])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10051C0A8;
    v6[3] = &unk_1022B8750;
    v6[4] = self;
    [(RPCompanionLinkClient *)[(CLLocationStreamingConnectionManager *)self rapportLink] activateWithCompletion:v6];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10051C1AC;
    v5[3] = &unk_1022B8778;
    v5[4] = self;
    [(RPCompanionLinkClient *)[(CLLocationStreamingConnectionManager *)self rapportLink] setDeviceFoundHandler:v5];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10051C324;
    v4[3] = &unk_1022B8778;
    v4[4] = self;
    [(RPCompanionLinkClient *)[(CLLocationStreamingConnectionManager *)self rapportLink] setDeviceLostHandler:v4];
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10051C49C;
    v3[3] = &unk_1022B87C8;
    v3[4] = self;
    [(RPCompanionLinkClient *)[(CLLocationStreamingConnectionManager *)self rapportLink] registerEventID:@"com.apple.locationd.rapport.event" options:0 handler:v3];
  }
}

- (void)setSilo:(id)a3
{
  if (qword_102419540 != -1) {
    dispatch_once(&qword_102419540, &stru_1022B88B0);
  }
  id v5 = qword_102419548;
  if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"suspending silo until IDS becomes available\"}", buf, 0x12u);
  }
  [a3 suspend];
  v8.receiver = self;
  v8.super_class = (Class)CLLocationStreamingConnectionManager;
  [(CLLocationStreamingConnectionManager *)&v8 setSilo:a3];
  if (qword_102419540 != -1) {
    dispatch_once(&qword_102419540, &stru_1022B88B0);
  }
  id v6 = qword_102419548;
  if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"waiting on IDS to become available\"}", buf, 0x12u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10051CB50;
  v7[3] = &unk_1022B87F0;
  v7[4] = self;
  v7[5] = a3;
  +[IDSService serviceWithIdentifier:@"com.apple.private.alloy.location.stream" completion:v7];
}

- (void)beginService
{
  [self universe].silo
  -[IDSService addDelegate:queue:](-[CLLocationStreamingConnectionManager service](self, "service"), "addDelegate:queue:", self, [-[CLLocationStreamingConnectionManager universe](self, "universe") silo] queue]);
  [(CLLocationStreamingConnectionManager *)self activateRapportLinkIfNecessary];
  [(CLLocationStreamingConnectionManager *)self setUnacknowledgedMessages:+[NSMutableDictionary dictionary]];
  [(CLLocationStreamingConnectionManager *)self setClients:+[NSMutableSet set]];
  id v3 = [(IDSService *)[(CLLocationStreamingConnectionManager *)self service] devices];

  [(CLLocationStreamingConnectionManager *)self updateNearbyStatusWithDevices:v3];
}

- (void)endService
{
  [self universe].silo
  [(RPCompanionLinkClient *)[(CLLocationStreamingConnectionManager *)self rapportLink] invalidate];
  self->_rapportLinkActive = 0;
  self->_rapportLink = 0;
  [(CLLocationStreamingConnectionManager *)self setUnacknowledgedMessages:0];
  [(CLLocationStreamingConnectionManager *)self setClients:0];

  [(CLLocationStreamingConnectionManager *)self setService:0];
}

- (BOOL)isRemoteWatchStreamingCompatible
{
  [self universe].silo
  id v2 = [[(objc_class *)off_10241C208() sharedInstance] getActivePairedDevice];
  if (v2) {
    LOBYTE(v2) = (NRWatchOSVersionForRemoteDevice() & 0xFFFE0000) != 0;
  }
  return (char)v2;
}

- (BOOL)shouldUseIDSForLocationStreaming
{
  [self universe].silo
  LODWORD(v3) = [(CLLocationStreamingConnectionManager *)self isRemoteWatchStreamingCompatible];
  if (v3)
  {
    id v3 = [[(objc_class *)off_10241C208() sharedInstance] getActivePairedDevice];
    if (v3) {
      LOBYTE(v3) = (int)[[[objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v3, "valueForProperty:", off_10241C210()), "componentsSeparatedByString:", @"."), "objectAtIndex:", 0), "intValue");
    }
  }
  return (char)v3;
}

- (void)addClient:(id)a3
{
  [self universe].silo
  [(NSMutableSet *)self->_clients addObject:a3];
  BOOL pairIsNearby = self->_pairIsNearby;

  _[a3 pairedDeviceIsNearby:pairIsNearby];
}

- (void)retireClient:(id)a3
{
  [self universe].silo
  clients = self->_clients;

  [(NSMutableSet *)clients removeObject:a3];
}

- (id)packageMessage:(id)a3
{
  id v4 = +[NSMutableDictionary dictionary];
  [v4 setObject:objc_msgSend(a3, "messageType") forKeyedSubscript:@"kCLLocationStreamingMessageKeyType"];
  [v4 setObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a3 protocolVersion]) forKeyedSubscript:@"kCLLocationStreamingMessageKeyVersion"];
  if ([a3 payload]) {
    [v4 setObject:objc_msgSend(a3, "payload") forKeyedSubscript:@"kCLLocationStreamingMessageKeyPayload"];
  }
  return v4;
}

- (void)sendMessageIDS:(id)a3
{
  id v5 = -[CLLocationStreamingConnectionManager packageMessage:](self, "packageMessage:");
  long long v22 = 0uLL;
  id v6 = [(CLLocationStreamingConnectionManager *)self service];
  unsigned __int8 v7 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](v6, "sendMessage:toDestinations:priority:options:identifier:error:", v5, +[NSSet setWithObject:](NSSet, "setWithObject:", IDSDefaultPairedDevice), [a3 priority], objc_msgSend(a3, "idsOptions"), (char *)&v22 + 8, &v22);
  if (v22 == 0)
  {
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022B88B0);
    }
    v12 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_FAULT))
    {
      id v13 = [[objc_msgSend(a3, "messageType") UTF8String];
      *(_DWORD *)buf = 68289282;
      int v24 = 0;
      __int16 v25 = 2082;
      v26 = "";
      __int16 v27 = 2082;
      id v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"No error, but also no identifier\", \"message type\":%{public, location:escape_only}s}", buf, 0x1Cu);
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022B88B0);
      }
    }
    long long v14 = qword_102419548;
    if (os_signpost_enabled((os_log_t)qword_102419548))
    {
      id v15 = [[objc_msgSend(a3, "messageType") UTF8String];
      *(_DWORD *)buf = 68289282;
      int v24 = 0;
      __int16 v25 = 2082;
      v26 = "";
      __int16 v27 = 2082;
      id v28 = v15;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "No error, but also no identifier", "{\"msg%{public}.0s\":\"No error, but also no identifier\", \"message type\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
  }
  else if ((void)v22)
  {
    unsigned __int8 v8 = v7;
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022B88B0);
    }
    v9 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = (void *)v22;
      id v11 = [[objc_msgSend(a3, "messageType") UTF8String];
      *(_DWORD *)buf = 68289538;
      int v24 = 0;
      __int16 v25 = 2082;
      v26 = "";
      __int16 v27 = 2114;
      id v28 = v10;
      __int16 v29 = 2082;
      id v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning Got error from IDS\", \"error\":%{public, location:escape_only}@, \"message type\":%{public, location:escape_only}s}", buf, 0x26u);
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10051D4BC;
    v20[3] = &unk_1022B8818;
    v20[4] = a3;
    v20[5] = v22;
    unsigned __int8 v21 = v8;
    [(CLLocationStreamingConnectionManager *)self withClients:v20];
  }
  else
  {
    long long v16 = [(CLLocationStreamingConnectionManager *)self unacknowledgedMessages];
    [(NSMutableDictionary *)v16 setObject:a3 forKeyedSubscript:*((void *)&v22 + 1)];
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022B88B0);
    }
    long long v17 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO))
    {
      id v18 = [[objc_msgSend(a3, "messageType") UTF8String];
      id v19 = [*((id *)&v22 + 1) UTF8String];
      *(_DWORD *)buf = 68289538;
      int v24 = 0;
      __int16 v25 = 2082;
      v26 = "";
      __int16 v27 = 2082;
      id v28 = v18;
      __int16 v29 = 2082;
      id v30 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Handed off message to IDS\", \"message type\":%{public, location:escape_only}s, \"identifier\":%{public, location:escape_only}s}", buf, 0x26u);
    }
  }
}

- (void)sendMessageRapport:(id)a3
{
  id v5 = -[CLLocationStreamingConnectionManager packageMessage:](self, "packageMessage:");
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 1;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3052000000;
  __int16 v20 = sub_1001778E8;
  unsigned __int8 v21 = sub_1001772F0;
  uint64_t v22 = 0;
  id v6 = [(CLLocationStreamingConnectionManager *)self rapportLink];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10051D8D4;
  v16[3] = &unk_1022B8868;
  v16[6] = &v17;
  v16[7] = v23;
  v16[4] = a3;
  v16[5] = self;
  [(RPCompanionLinkClient *)v6 sendEventID:@"com.apple.locationd.rapport.event" event:v5 destinationID:RPDestinationIdentifierPairedCompanion options:0 completion:v16];
  if (v18[5])
  {
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022B88B0);
    }
    unsigned __int8 v7 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v8 = (void *)v18[5];
      id v9 = [[objc_msgSend(a3, "messageType") UTF8String];
      uint64_t buf = 68289538;
      __int16 v26 = 2082;
      __int16 v27 = "";
      __int16 v28 = 2114;
      id v29 = v8;
      __int16 v30 = 2082;
      id v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#warning Got error from #Rapport\", \"error\":%{public, location:escape_only}@, \"message type\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022B88B0);
      }
    }
    int v10 = qword_102419548;
    if (os_signpost_enabled((os_log_t)qword_102419548))
    {
      id v11 = (void *)v18[5];
      id v12 = [[objc_msgSend(a3, "messageType") UTF8String];
      uint64_t buf = 68289538;
      __int16 v26 = 2082;
      __int16 v27 = "";
      __int16 v28 = 2114;
      id v29 = v11;
      __int16 v30 = 2082;
      id v31 = v12;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#warning Got error from #Rapport", "{\"msg%{public}.0s\":\"#warning Got error from #Rapport\", \"error\":%{public, location:escape_only}@, \"message type\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x26u);
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10051DB84;
    v15[3] = &unk_1022B8890;
    v15[4] = a3;
    v15[5] = &v17;
    v15[6] = v23;
    [(CLLocationStreamingConnectionManager *)self withClients:v15];
  }
  else
  {
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022B88B0);
    }
    id v13 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO))
    {
      id v14 = [[[a3 messageType] UTF8String];
      uint64_t buf = 68289282;
      __int16 v26 = 2082;
      __int16 v27 = "";
      __int16 v28 = 2082;
      id v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Handed off message to #Rapport\", \"message type\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v23, 8);
}

- (void)sendMessage:(id)a3
{
  [self universe].silo
  if ([(CLLocationStreamingConnectionManager *)self isRemoteWatchStreamingCompatible])
  {
    if ([(CLLocationStreamingConnectionManager *)self shouldUseIDSForLocationStreaming])
    {
      [(CLLocationStreamingConnectionManager *)self sendMessageIDS:a3];
    }
    else
    {
      [(CLLocationStreamingConnectionManager *)self sendMessageRapport:a3];
    }
  }
  else
  {
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022B88B0);
    }
    id v5 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289026;
      v6[1] = 0;
      __int16 v7 = 2082;
      unsigned __int8 v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Dropping message due to incompatible remote device\"}", (uint8_t *)v6, 0x12u);
    }
  }
}

- (void)withClients:(id)a3
{
  [self universe] silo
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  clients = self->_clients;
  id v6 = [(NSMutableSet *)clients countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(clients);
        }
        (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)clients countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  [self universe:a3, a4, a5, a6, a7].silo
  id v9 = [a5 objectForKeyedSubscript:@"kCLLocationStreamingMessageKeyPayload"];
  id v10 = [a5 objectForKeyedSubscript:@"kCLLocationStreamingMessageKeyType"];
  if (v10)
  {
    long long v11 = v10;
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022B88B0);
    }
    long long v12 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v23 = 2082;
      char v24 = "";
      __int16 v25 = 2082;
      id v26 = [v11 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"IDS Got message\", \"type\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    signed int v13 = [[objc_msgSend(a5, "objectForKeyedSubscript:", @"kCLLocationStreamingMessageKeyVersion") intValue];
    sub_10051C8A0();
    sub_100134750(buf, (char *)[v11 UTF8String]);
    uint64_t v14 = sub_10012FFE0((uint64_t)&qword_10247B248, (const void **)buf);
    if (SBYTE3(v26) < 0) {
      operator delete(*(void **)buf);
    }
    if ((uint64_t *)v14 == &qword_10247B250)
    {
      int v15 = -1;
      int v16 = -1;
    }
    else
    {
      int v16 = *(_DWORD *)(v14 + 56);
      int v15 = *(_DWORD *)(v14 + 60);
      if (v13 >= v16 && v13 <= v15)
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10051E248;
        v21[3] = &unk_1022B87A0;
        v21[4] = v11;
        v21[5] = v9;
        [(CLLocationStreamingConnectionManager *)self withClients:v21];
        return;
      }
    }
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022B88B0);
    }
    uint64_t v19 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = [v11 UTF8String];
      *(_DWORD *)uint64_t buf = 68290050;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v23 = 2082;
      char v24 = "";
      __int16 v25 = 2082;
      id v26 = v20;
      __int16 v27 = 1026;
      signed int v28 = v13;
      __int16 v29 = 1026;
      int v30 = v16;
      __int16 v31 = 1026;
      int v32 = v15;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Received message of unsupported version\", \"type\":%{public, location:escape_only}s, \"declared version\":%{public}d, \"minimum version\":%{public}d, \"maximum version\":%{public}d}", buf, 0x2Eu);
    }
  }
  else
  {
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022B88B0);
    }
    uint64_t v17 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v23 = 2082;
      char v24 = "";
      __int16 v25 = 2113;
      id v26 = a5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Missing message type\", \"message\":%{private, location:escape_only}@}", buf, 0x1Cu);
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022B88B0);
      }
    }
    id v18 = qword_102419548;
    if (os_signpost_enabled((os_log_t)qword_102419548))
    {
      *(_DWORD *)uint64_t buf = 68289283;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v23 = 2082;
      char v24 = "";
      __int16 v25 = 2113;
      id v26 = a5;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Missing message type", "{\"msg%{public}.0s\":\"Missing message type\", \"message\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  [[-[CLLocationStreamingConnectionManager universe](self, "universe", a3, a4) silo];
  if (a5)
  {
    id v11 = [(NSMutableDictionary *)[(CLLocationStreamingConnectionManager *)self unacknowledgedMessages] objectForKeyedSubscript:a5];
    id v12 = v11;
    [(NSMutableDictionary *)[(CLLocationStreamingConnectionManager *)self unacknowledgedMessages] removeObjectForKey:a5];
    if (a7 && v8) {
      sub_101A64510();
    }
    if (!a7 && v8)
    {
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022B88B0);
      }
      signed int v13 = qword_102419548;
      if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 68289538;
        int v23 = 0;
        __int16 v24 = 2082;
        __int16 v25 = "";
        __int16 v26 = 2082;
        id v27 = [a5 UTF8String];
        __int16 v28 = 2082;
        *(void *)__int16 v29 = [v11 messageType];
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"IDS Send success\", \"identifier\":%{public, location:escape_only}s, \"type\":%{public, location:escape_only}s}", buf, 0x26u);
      }
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10051E70C;
      v20[3] = &unk_1022B8728;
      v20[4] = v11;
      uint64_t v14 = v20;
LABEL_29:
      [(CLLocationStreamingConnectionManager *)self withClients:v14];
      return;
    }
    id v17 = [objc_msgSend(a7, "userInfo") objectForKeyedSubscript:NSUnderlyingErrorKey];
    if (!v17 || [v17 code] != (id)32)
    {
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022B88B0);
      }
      uint64_t v19 = qword_102419548;
      if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t buf = 68290050;
        int v23 = 0;
        __int16 v24 = 2082;
        __int16 v25 = "";
        __int16 v26 = 2082;
        id v27 = [a5 UTF8String];
        __int16 v28 = 1026;
        *(_DWORD *)__int16 v29 = v8;
        *(_WORD *)&v29[4] = 2114;
        *(void *)&v29[6] = a7;
        __int16 v30 = 2082;
        id v31 = [[objc_msgSend(v11, "messageType") UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#warning Send failure\", \"identifier\":%{public, location:escape_only}s, \"success\":%{public}d, \"error\":%{public, location:escape_only}@, \"type\":%{public, location:escape_only}s}", buf, 0x36u);
      }
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10051E6FC;
      v21[3] = &unk_1022B87A0;
      v21[4] = v11;
      v21[5] = a7;
      uint64_t v14 = v21;
      goto LABEL_29;
    }
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022B88B0);
    }
    id v18 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v23 = 0;
      __int16 v24 = 2082;
      __int16 v25 = "";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Sync to/from standalone watch is not supported\"}", buf, 0x12u);
    }
  }
  else
  {
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022B88B0);
    }
    int v15 = qword_102419548;
    if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v23 = 0;
      __int16 v24 = 2082;
      __int16 v25 = "";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Missing identifier\"}", buf, 0x12u);
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022B88B0);
      }
    }
    int v16 = qword_102419548;
    if (os_signpost_enabled((os_log_t)qword_102419548))
    {
      *(_DWORD *)uint64_t buf = 68289026;
      int v23 = 0;
      __int16 v24 = 2082;
      __int16 v25 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Missing identifier", "{\"msg%{public}.0s\":\"Missing identifier\"}", buf, 0x12u);
    }
  }
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  [self universe].silo

  [(CLLocationStreamingConnectionManager *)self updateNearbyStatusWithDevices:a4];
}

- (RPCompanionLinkClient)rapportLink
{
  return (RPCompanionLinkClient *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRapportLink:(id)a3
{
}

- (BOOL)rapportLinkActive
{
  return self->_rapportLinkActive;
}

- (void)setRapportLinkActive:(BOOL)a3
{
  self->_rapportLinkActive = a3;
}

- (NSMutableDictionary)unacknowledgedMessages
{
  return self->_unacknowledgedMessages;
}

- (void)setUnacknowledgedMessages:(id)a3
{
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 40, 1);
}

- (void)setService:(id)a3
{
}

- (BOOL)pairIsNearby
{
  return self->_pairIsNearby;
}

- (void)setPairIsNearby:(BOOL)a3
{
  self->_BOOL pairIsNearby = a3;
}

@end