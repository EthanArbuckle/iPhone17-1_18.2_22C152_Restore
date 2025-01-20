@interface CLFenceHandoffConnectionManager
+ (BOOL)isSupported;
+ (id)CLFenceHandoffTypetoString:(int64_t)a3;
+ (id)getHandoffRegionTypeString:(int)a3;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)isActiveDeviceNearby;
- (BOOL)isCurrentActiveDevice:(id)a3;
- (CLFenceHandoffConnectionManager)init;
- (CLLocationManager)locationManager;
- (IDSService)service;
- (NSMutableDictionary)receivingEndUnacknowledgedMessages;
- (NSMutableDictionary)unacknowledgedMessages;
- (NSUUID)activeDeviceId;
- (id)defaultIDSOptions;
- (id)getDictionaryFromMessage:(id)a3;
- (id)getIdentifierFromMessage:(id)a3;
- (id)getPrimaryKeyFromIdentifier:(id)a3 type:(int64_t)a4;
- (id)getRegionFromMessage:(id)a3;
- (id)getResponseDictionary:(id)a3 forMessage:(id)a4;
- (int)covertRegionStateToFenceStatus:(int64_t)a3;
- (void)beginService;
- (void)disableHandoffDictionaryForDeviceId:(id)a3;
- (void)endService;
- (void)getHandoffTags;
- (void)handleAddingFenceOnCompanion:(id)a3 withContext:(id)a4;
- (void)handleGetRegionStateOnCompanion:(id)a3;
- (void)handleHandoffTagsOnCompanion:(id)a3 forDeviceID:(id)a4;
- (void)handleRemovingFenceOnCompanion:(id)a3 withContext:(id)a4;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didEnterRegion:(id)a4;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)responseWithAck:(id)a3 forMessage:(id)a4;
- (void)sendDictionaryMessage:(id)a3 withOptions:(id)a4;
- (void)sendMessage:(id)a3;
- (void)sendRegionEvent:(int64_t)a3 forRegion:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setActiveDeviceId:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setReceivingEndUnacknowledgedMessages:(id)a3;
- (void)setService:(id)a3;
- (void)setSilo:(id)a3;
- (void)setUnacknowledgedMessages:(id)a3;
- (void)updateActiveDeviceId:(id)a3;
@end

@implementation CLFenceHandoffConnectionManager

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
  if (qword_102487880 != -1) {
    dispatch_once(&qword_102487880, &stru_102323B80);
  }
  return (id)qword_102487878;
}

+ (id)CLFenceHandoffTypetoString:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 1) {
      return @"CLFenceHandoffTypeBeacon";
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    v4 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      int v6 = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#FenceHandoff Please update CLFenceHandoffTypetoString\"}", (uint8_t *)&v6, 0x12u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102323BE0);
      }
    }
    unint64_t v5 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      int v6 = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#FenceHandoff Please update CLFenceHandoffTypetoString", "{\"msg%{public}.0s\":\"#FenceHandoff Please update CLFenceHandoffTypetoString\"}", (uint8_t *)&v6, 0x12u);
    }
  }
  return @"CLFenceHandoffTypeGeo";
}

+ (id)getHandoffRegionTypeString:(int)a3
{
  if (!a3)
  {
    uint64_t v3 = 1;
    return +[CLFenceHandoffConnectionManager CLFenceHandoffTypetoString:v3];
  }
  if (a3 == 1)
  {
    uint64_t v3 = 0;
    return +[CLFenceHandoffConnectionManager CLFenceHandoffTypetoString:v3];
  }
  return 0;
}

- (id)getRegionFromMessage:(id)a3
{
  uint64_t v8 = 0;
  id v3 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), [a3 objectForKeyedSubscript:@"kCLFenceHandoffDictionaryMessagePayload"], &v8);
  if (v3) {
    BOOL v4 = v8 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    return v3;
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102323BE0);
  }
  unint64_t v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68289282;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff message has no region!\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
  }
  int v6 = qword_102419538;
  if (os_signpost_enabled((os_log_t)qword_102419538))
  {
    *(_DWORD *)buf = 68289282;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#FenceHandoff message has no region!", "{\"msg%{public}.0s\":\"#FenceHandoff message has no region!\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  return 0;
}

- (id)getIdentifierFromMessage:(id)a3
{
  if ([[objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"kCLFenceHandoffDictionaryMessageType"), "intValue"] intValue] == 6)return 0; {
  uint64_t v9 = 0;
  }
  id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), [a3 objectForKeyedSubscript:@"kCLFenceHandoffDictionaryMessagePayload"], &v9);
  int v6 = v5;
  if (v9 || !v5)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    int v7 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      int v11 = 0;
      __int16 v12 = 2082;
      __int16 v13 = "";
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff unable to get primary key\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102323BE0);
      }
    }
    uint64_t v8 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      *(_DWORD *)buf = 68289282;
      int v11 = 0;
      __int16 v12 = 2082;
      __int16 v13 = "";
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#FenceHandoff unable to get primary key", "{\"msg%{public}.0s\":\"#FenceHandoff unable to get primary key\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  return v6;
}

- (id)getDictionaryFromMessage:(id)a3
{
  uint64_t v11 = 0;
  id v3 = [a3 objectForKeyedSubscript:@"kCLFenceHandoffDictionaryMessagePayload"];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  id v6 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, objc_opt_class(), 0), v3, &v11);
  int v7 = v6;
  if (v11 || !v6)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    uint64_t v8 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      int v13 = 0;
      __int16 v14 = 2082;
      uint64_t v15 = "";
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff unable to get handoff tag dictionary\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102323BE0);
      }
    }
    uint64_t v9 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      *(_DWORD *)buf = 68289282;
      int v13 = 0;
      __int16 v14 = 2082;
      uint64_t v15 = "";
      __int16 v16 = 2114;
      uint64_t v17 = v11;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#FenceHandoff unable to get handoff tag dictionary", "{\"msg%{public}.0s\":\"#FenceHandoff unable to get handoff tag dictionary\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  return v7;
}

- (id)getPrimaryKeyFromIdentifier:(id)a3 type:(int64_t)a4
{
  id v5 = +[CLFenceHandoffConnectionManager CLFenceHandoffTypetoString:a4];
  id v6 = [a3 mutableCopy];
  [v6 replaceOccurrencesOfString:v5 withString:&stru_10234F018 options:0 range:[a3 length]];

  return v6;
}

+ (BOOL)isSupported
{
  if (qword_102487890 != -1) {
    dispatch_once(&qword_102487890, &stru_102323BA0);
  }
  return byte_102487888;
}

- (CLFenceHandoffConnectionManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLFenceHandoffConnectionManager;
  return [(CLFenceHandoffConnectionManager *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLFenceHandoffConnectionManagerServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLFenceHandoffConnectionManagerClientProtocol];
}

- (void)setSilo:(id)a3
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102323BE0);
  }
  id v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff suspending silo until IDS becomes available\"}", buf, 0x12u);
  }
  [a3 suspend];
  v8.receiver = self;
  v8.super_class = (Class)CLFenceHandoffConnectionManager;
  [(CLFenceHandoffConnectionManager *)&v8 setSilo:a3];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102323BE0);
  }
  id v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    __int16 v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff waiting on IDS to become available\"}", buf, 0x12u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1013D791C;
  v7[3] = &unk_1022B87F0;
  v7[4] = self;
  v7[5] = a3;
  +[IDSService serviceWithIdentifier:@"com.apple.private.alloy.location.fencehandoff" completion:v7];
}

- (void)beginService
{
  [self universe].silo
  -[CLFenceHandoffConnectionManager setLocationManager:](self, "setLocationManager:", [objc_alloc((Class)CLLocationManager) initWithEffectiveBundlePath:@"/System/Library/LocationBundles/LocationFenceSync.bundle" delegate:self onQueue:[objc_msgSend(-[CLFenceHandoffConnectionManager universe](self, "universe"), "silo") queue]]);
  [(CLFenceHandoffConnectionManager *)self setReceivingEndUnacknowledgedMessages:+[NSMutableDictionary dictionary]];
  -[IDSService addDelegate:queue:](-[CLFenceHandoffConnectionManager service](self, "service"), "addDelegate:queue:", self, [objc_msgSend(-[CLFenceHandoffConnectionManager universe](self, "universe"), "silo") queue]);
  [(CLFenceHandoffConnectionManager *)self setUnacknowledgedMessages:+[NSMutableDictionary dictionary]];
  id v3 = [(IDSService *)[(CLFenceHandoffConnectionManager *)self service] devices];

  [(CLFenceHandoffConnectionManager *)self updateActiveDeviceId:v3];
}

- (void)endService
{
  [self universe].silo
  [(CLFenceHandoffConnectionManager *)self setService:0];
  [(CLFenceHandoffConnectionManager *)self setUnacknowledgedMessages:0];
  [(CLFenceHandoffConnectionManager *)self setReceivingEndUnacknowledgedMessages:0];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1013D7D10;
  v3[3] = &unk_10229FED8;
  v3[4] = [(CLFenceHandoffConnectionManager *)self locationManager];
  [objc_msgSend(-[CLFenceHandoffConnectionManager universe](self, "universe"), "silo") async:v3];
  [(CLFenceHandoffConnectionManager *)self setLocationManager:0];
  [(CLFenceHandoffConnectionManager *)self setActiveDeviceId:0];
}

- (BOOL)isActiveDeviceNearby
{
  return self->_activeDeviceId != 0;
}

- (id)defaultIDSOptions
{
  v3[0] = IDSSendMessageOptionTimeoutKey;
  v4[0] = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
  v4[1] = &__kCFBooleanTrue;
  v3[1] = IDSSendMessageOptionEncryptPayloadKey;
  v3[2] = IDSSendMessageOptionRequireBluetoothKey;
  v4[2] = &__kCFBooleanTrue;
  return [+[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3] mutableCopy];
}

- (id)getResponseDictionary:(id)a3 forMessage:(id)a4
{
  v5[0] = @"kCLFenceHandoffResponseDictionaryIDSIdentifierKey";
  v5[1] = @"kCLFenceHandoffResponseDictionaryMessageKey";
  v6[0] = a3;
  v6[1] = a4;
  return +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
}

- (int)covertRegionStateToFenceStatus:(int64_t)a3
{
  if (a3 == 2) {
    int v3 = 1;
  }
  else {
    int v3 = -1;
  }
  if (a3 == 1) {
    return 0;
  }
  else {
    return v3;
  }
}

- (void)sendMessage:(id)a3
{
  [self universe].silo
  if (![(CLFenceHandoffConnectionManager *)self isActiveDeviceNearby])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    uint64_t v7 = qword_102419538;
    if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG)) {
      return;
    }
    *(_DWORD *)buf = 68289026;
    int v40 = 0;
    __int16 v41 = 2082;
    v42 = "";
    objc_super v8 = "{\"msg%{public}.0s\":\"#FenceHandoff there is no active device nearby\"}";
    uint64_t v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_DEBUG;
    uint32_t v11 = 18;
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, buf, v11);
    return;
  }
  if (![a3 messageType])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    __int16 v12 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v40 = 0;
      __int16 v41 = 2082;
      v42 = "";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#FenceHandoff message has no messageType!\"}", buf, 0x12u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102323BE0);
      }
    }
    uint64_t v13 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      *(_DWORD *)buf = 68289026;
      int v40 = 0;
      __int16 v41 = 2082;
      v42 = "";
      __int16 v14 = "#FenceHandoff message has no messageType!";
      uint64_t v15 = "{\"msg%{public}.0s\":\"#FenceHandoff message has no messageType!\"}";
      __int16 v16 = v13;
      uint32_t v17 = 18;
LABEL_31:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v14, v15, buf, v17);
      return;
    }
    return;
  }
  if (![a3 payload]
    && [a3 messageType] != (id)3
    && [a3 messageType] != (id)9)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    v31 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      id v32 = [a3 payload];
      [a3 messageType];
      *(_DWORD *)buf = 68289539;
      int v40 = 0;
      __int16 v41 = 2082;
      v42 = "";
      __int16 v43 = 2113;
      id v44 = v32;
      __int16 v45 = 2050;
      id v46 = [a3 messageType];
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#FenceHandoff message has no payload!\", \"payload\":%{private, location:escape_only}@, \"message type\":%{public, location:CLGeoFenceHandoffMessageType}lld}", buf, 0x26u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102323BE0);
      }
    }
    uint64_t v33 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      id v34 = [a3 payload];
      [a3 messageType];
      id v35 = [a3 messageType];
      *(_DWORD *)buf = 68289539;
      int v40 = 0;
      __int16 v41 = 2082;
      v42 = "";
      __int16 v43 = 2113;
      id v44 = v34;
      __int16 v45 = 2050;
      id v46 = v35;
      __int16 v14 = "#FenceHandoff message has no payload!";
      uint64_t v15 = "{\"msg%{public}.0s\":\"#FenceHandoff message has no payload!\", \"payload\":%{private, location:escape_only}"
            "@, \"message type\":%{public, location:CLGeoFenceHandoffMessageType}lld}";
      __int16 v16 = v33;
      uint32_t v17 = 38;
      goto LABEL_31;
    }
    return;
  }
  id v5 = +[NSMutableDictionary dictionary];
  [v5 setObject:+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 messageType]) forKeyedSubscript:@"kCLFenceHandoffDictionaryMessageType"];
  if ([a3 messageType] == (id)3 || objc_msgSend(a3, "messageType") == (id)9) {
    id v6 = [a3 primaryKey];
  }
  else {
    id v6 = [a3 payload];
  }
  v38 = 0;
  v18 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v38];
  if (v38)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    v19 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      int v40 = 0;
      __int16 v41 = 2082;
      v42 = "";
      __int16 v43 = 2114;
      id v44 = v38;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff unable to archive to send\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102323BE0);
      }
    }
    uint64_t v20 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      *(_DWORD *)buf = 68289282;
      int v40 = 0;
      __int16 v41 = 2082;
      v42 = "";
      __int16 v43 = 2114;
      id v44 = v38;
      __int16 v14 = "#FenceHandoff unable to archive to send";
      uint64_t v15 = "{\"msg%{public}.0s\":\"#FenceHandoff unable to archive to send\", \"error\":%{public, location:escape_only}@}";
LABEL_30:
      __int16 v16 = v20;
      uint32_t v17 = 28;
      goto LABEL_31;
    }
    return;
  }
  [v5 setObject:v18 forKey:@"kCLFenceHandoffDictionaryMessagePayload"];
  id v21 = [(CLFenceHandoffConnectionManager *)self defaultIDSOptions];
  [v21 setObject:&__kCFBooleanTrue forKeyedSubscript:IDSSendMessageOptionExpectsPeerResponseKey];
  id v22 = [a3 primaryKey];
  [v21 setObject:v22 forKeyedSubscript:IDSSendMessageOptionQueueOneIdentifierKey];
  id v37 = 0;
  v23 = [(CLFenceHandoffConnectionManager *)self service];
  if (![(IDSService *)v23 sendMessage:v5 toDestinations:+[NSSet setWithObject:IDSDefaultPairedDevice] priority:200 options:v21 identifier:&v37 error:&v38])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    uint64_t v25 = qword_102419538;
    if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    id v29 = [v37 UTF8String];
    [a3 messageType];
    id v30 = [a3 messageType];
    *(_DWORD *)buf = 68289794;
    int v40 = 0;
    __int16 v41 = 2082;
    v42 = "";
    __int16 v43 = 2082;
    id v44 = v29;
    __int16 v45 = 2050;
    id v46 = v30;
    __int16 v47 = 2114;
    id v48 = v38;
    objc_super v8 = "{\"msg%{public}.0s\":\"#Warn #FenceHandoff failed to send message to IDS\", \"identifier\":%{public, location:e"
         "scape_only}s, \"action\":%{public, location:CLGeoFenceHandoffMessageType}lld, \"Error\":%{public, location:escape_only}@}";
    goto LABEL_43;
  }
  if (v37)
  {
    v24 = [(CLFenceHandoffConnectionManager *)self unacknowledgedMessages];
    [(NSMutableDictionary *)v24 setObject:a3 forKeyedSubscript:v37];
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    uint64_t v25 = qword_102419538;
    if (!os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    id v26 = [v37 UTF8String];
    [a3 messageType];
    id v27 = [a3 messageType];
    id v28 = [a3 primaryKey];
    *(_DWORD *)buf = 68289794;
    int v40 = 0;
    __int16 v41 = 2082;
    v42 = "";
    __int16 v43 = 2082;
    id v44 = v26;
    __int16 v45 = 2050;
    id v46 = v27;
    __int16 v47 = 2114;
    id v48 = v28;
    objc_super v8 = "{\"msg%{public}.0s\":\"#FenceHandoff successfully requested to IDS to send a message\", \"identifier\":%{public"
         ", location:escape_only}s, \"action\":%{public, location:CLGeoFenceHandoffMessageType}lld, \"message\":%{public,"
         " location:escape_only}@}";
LABEL_43:
    uint64_t v9 = v25;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    uint32_t v11 = 48;
    goto LABEL_13;
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102323BE0);
  }
  v36 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v40 = 0;
    __int16 v41 = 2082;
    v42 = "";
    __int16 v43 = 2114;
    id v44 = v38;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#FenceHandoff sent message to IDS successfully but we received no identifier!\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
  }
  uint64_t v20 = qword_102419538;
  if (os_signpost_enabled((os_log_t)qword_102419538))
  {
    *(_DWORD *)buf = 68289282;
    int v40 = 0;
    __int16 v41 = 2082;
    v42 = "";
    __int16 v43 = 2114;
    id v44 = v38;
    __int16 v14 = "#FenceHandoff sent message to IDS successfully but we received no identifier!";
    uint64_t v15 = "{\"msg%{public}.0s\":\"#FenceHandoff sent message to IDS successfully but we received no identifier!\", \"erro"
          "r\":%{public, location:escape_only}@}";
    goto LABEL_30;
  }
}

- (void)responseWithAck:(id)a3 forMessage:(id)a4
{
  id v7 = +[NSMutableDictionary dictionary];
  [v7 setObject:objc_msgSend(a4, "objectForKeyedSubscript:", @"kCLFenceHandoffDictionaryMessagePayload") forKeyedSubscript:@"kCLFenceHandoffDictionaryMessagePayload"];
  signed int v8 = [[a4 objectForKeyedSubscript:@"kCLFenceHandoffDictionaryMessageType"] intValue];
  uint64_t v9 = (void *)v8;
  switch(v8)
  {
    case 1:
      [v7 setObject:&off_102394730 forKeyedSubscript:@"kCLFenceHandoffDictionaryMessageType"];
      id v10 = [(CLFenceHandoffConnectionManager *)self getRegionFromMessage:a4];
      if (v10)
      {
        id v26 = 0;
        id v11 = [[[v10 identifier] copy];
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_102323BE0);
        }
        __int16 v12 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68289282;
          int v28 = 0;
          __int16 v29 = 2082;
          id v30 = "";
          __int16 v31 = 2082;
          id v32 = [v11 UTF8String];
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff sending ack with primary key\", \"primaryKey\":%{public, location:escape_only}s}", buf, 0x1Cu);
        }
        uint64_t v13 = +[NSKeyedArchiver archivedDataWithRootObject:v11 requiringSecureCoding:1 error:&v26];
        if (!v26)
        {
          uint64_t v20 = v13;
          CFStringRef v21 = @"kCLFenceHandoffDictionaryMessagePayload";
          goto LABEL_32;
        }
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_102323BE0);
        }
        __int16 v14 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289282;
          int v28 = 0;
          __int16 v29 = 2082;
          id v30 = "";
          __int16 v31 = 2114;
          id v32 = v26;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff unable to archive to send\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_102323BE0);
          }
        }
        uint64_t v15 = qword_102419538;
        if (os_signpost_enabled((os_log_t)qword_102419538))
        {
          *(_DWORD *)buf = 68289282;
          int v28 = 0;
          __int16 v29 = 2082;
          id v30 = "";
          __int16 v31 = 2114;
          id v32 = v26;
          __int16 v16 = "#FenceHandoff unable to archive to send";
          uint32_t v17 = "{\"msg%{public}.0s\":\"#FenceHandoff unable to archive to send\", \"error\":%{public, location:escape_only}@}";
          goto LABEL_22;
        }
      }
      else
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_102323BE0);
        }
        v23 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289282;
          int v28 = 0;
          __int16 v29 = 2082;
          id v30 = "";
          __int16 v31 = 2082;
          id v32 = [a3 UTF8String];
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff unable to send ack\", \"idsIdentifier\":%{public, location:escape_only}s}", buf, 0x1Cu);
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_102323BE0);
          }
        }
        uint64_t v24 = qword_102419538;
        if (os_signpost_enabled((os_log_t)qword_102419538))
        {
          id v25 = [a3 UTF8String];
          *(_DWORD *)buf = 68289282;
          int v28 = 0;
          __int16 v29 = 2082;
          id v30 = "";
          __int16 v31 = 2082;
          id v32 = v25;
          __int16 v16 = "#FenceHandoff unable to send ack";
          uint32_t v17 = "{\"msg%{public}.0s\":\"#FenceHandoff unable to send ack\", \"idsIdentifier\":%{public, location:escape_only}s}";
          v19 = v24;
          goto LABEL_41;
        }
      }
      return;
    case 3:
      uint64_t v20 = (NSData *)&off_102394748;
      goto LABEL_31;
    case 5:
      uint64_t v20 = (NSData *)&off_102394778;
      goto LABEL_31;
    case 7:
      uint64_t v20 = (NSData *)&off_102394760;
      goto LABEL_31;
    case 9:
      uint64_t v20 = (NSData *)&off_102394790;
      goto LABEL_31;
    case 11:
      uint64_t v20 = (NSData *)&off_1023947A8;
      goto LABEL_31;
    case 13:
      uint64_t v20 = (NSData *)&off_1023947C0;
      goto LABEL_31;
    case 15:
      uint64_t v20 = (NSData *)&off_1023947D8;
      goto LABEL_31;
    case 17:
      uint64_t v20 = (NSData *)&off_1023947F0;
LABEL_31:
      CFStringRef v21 = @"kCLFenceHandoffDictionaryMessageType";
LABEL_32:
      [v7 setObject:v20 forKeyedSubscript:v21];
      id v22 = [(CLFenceHandoffConnectionManager *)self defaultIDSOptions];
      [v22 setObject:a3 forKeyedSubscript:IDSSendMessageOptionPeerResponseIdentifierKey];
      [(CLFenceHandoffConnectionManager *)self sendDictionaryMessage:v7 withOptions:v22];
      break;
    default:
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102323BE0);
      }
      v18 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289282;
        int v28 = 0;
        __int16 v29 = 2082;
        id v30 = "";
        __int16 v31 = 2050;
        id v32 = v9;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#FenceHandoff unknown message type ack!\", \"messageType\":%{public, location:CLGeoFenceHandoffMessageType}lld}", buf, 0x1Cu);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_102323BE0);
        }
      }
      uint64_t v15 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        *(_DWORD *)buf = 68289282;
        int v28 = 0;
        __int16 v29 = 2082;
        id v30 = "";
        __int16 v31 = 2050;
        id v32 = v9;
        __int16 v16 = "#FenceHandoff unknown message type ack!";
        uint32_t v17 = "{\"msg%{public}.0s\":\"#FenceHandoff unknown message type ack!\", \"messageType\":%{public, location:CLGeo"
              "FenceHandoffMessageType}lld}";
LABEL_22:
        v19 = v15;
LABEL_41:
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v16, v17, buf, 0x1Cu);
      }
      break;
  }
}

- (void)sendDictionaryMessage:(id)a3 withOptions:(id)a4
{
  if ([(CLFenceHandoffConnectionManager *)self isActiveDeviceNearby])
  {
    id v15 = 0;
    uint64_t v16 = 0;
    id v7 = [(CLFenceHandoffConnectionManager *)self service];
    if (([(IDSService *)v7 sendMessage:a3 toDestinations:+[NSSet setWithObject:IDSDefaultPairedDevice] priority:200 options:a4 identifier:&v15 error:&v16] & 1) == 0)
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102323BE0);
      }
      uint64_t v8 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [v15 UTF8String];
        *(_DWORD *)buf = 68289538;
        int v18 = 0;
        __int16 v19 = 2082;
        uint64_t v20 = "";
        __int16 v21 = 2082;
        id v22 = v9;
        __int16 v23 = 2114;
        uint64_t v24 = v16;
        id v10 = "{\"msg%{public}.0s\":\"#Warn #FenceHandoff failed to send message IDS\", \"identifier\":%{public, location"
              ":escape_only}s, \"Error\":%{public, location:escape_only}@}";
        id v11 = v8;
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
        uint32_t v13 = 38;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, v13);
      }
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    uint64_t v14 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      int v18 = 0;
      __int16 v19 = 2082;
      uint64_t v20 = "";
      id v10 = "{\"msg%{public}.0s\":\"#FenceHandoff there is no active device nearby\"}";
      id v11 = v14;
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
      uint32_t v13 = 18;
      goto LABEL_11;
    }
  }
}

- (void)updateActiveDeviceId:(id)a3
{
  id v5 = [(NSString *)[(NSUUID *)[(CLFenceHandoffConnectionManager *)self activeDeviceId] UUIDString] copy];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(a3);
      }
      id v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
      if ([v10 isNearby])
      {
        if ([v10 isConnected]) {
          break;
        }
      }
      if (v7 == (id)++v9)
      {
        id v7 = [a3 countByEnumeratingWithState:&v19 objects:v29 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v11 = [v10 nsuuid];
    if (!v5) {
      goto LABEL_19;
    }
  }
  else
  {
LABEL_10:
    id v11 = 0;
    if (!v5) {
      goto LABEL_19;
    }
  }
  if ((objc_msgSend(objc_msgSend(v11, "UUIDString"), "isEqualToString:", v5) & 1) == 0)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    os_log_type_t v12 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v13 = (const char *)[v5 UTF8String];
      *(_DWORD *)buf = 68289282;
      int v24 = 0;
      __int16 v25 = 2082;
      id v26 = "";
      __int16 v27 = 2082;
      int v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff device disconnected\", \"inactive\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    [(CLFenceHandoffConnectionManager *)self setActiveDeviceId:0];
    [(CLFenceHandoffConnectionManager *)self disableHandoffDictionaryForDeviceId:v5];
  }
LABEL_19:
  if (v11)
  {
    [(CLFenceHandoffConnectionManager *)self setActiveDeviceId:v11];
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    uint64_t v14 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
    {
      id v15 = [(NSString *)[(NSUUID *)[(CLFenceHandoffConnectionManager *)self activeDeviceId] UUIDString] UTF8String];
      *(_DWORD *)buf = 68289282;
      int v24 = 0;
      __int16 v25 = 2082;
      id v26 = "";
      __int16 v27 = 2082;
      int v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff nearby devices changed\", \"activeId\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    if ([(CLFenceHandoffConnectionManager *)self isActiveDeviceNearby])
    {
      dispatch_time_t v16 = dispatch_time(0, 3000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1013D9350;
      block[3] = &unk_10229FED8;
      block[4] = self;
      dispatch_after(v16, (dispatch_queue_t)[objc_msgSend(-[CLFenceHandoffConnectionManager universe](self, "universe"), "silo") queue], block);
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    uint32_t v17 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v24 = 0;
      __int16 v25 = 2082;
      id v26 = "";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff no devices found nearby\"}", buf, 0x12u);
    }
  }
}

- (void)handleAddingFenceOnCompanion:(id)a3 withContext:(id)a4
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102323BE0);
  }
  id v7 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289026;
    int v40 = 0;
    __int16 v41 = 2082;
    v42 = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff handleAddingFenceOnCompanion\"}", buf, 0x12u);
  }
  id v8 = [(CLFenceHandoffConnectionManager *)self getRegionFromMessage:a3];
  if (v8)
  {
    uint64_t v9 = v8;
    if ([v8 type] == 1)
    {
      id v10 = [(CLFenceHandoffConnectionManager *)self activeDeviceId];
      if (v10)
      {
        id v11 = v10;
        id v12 = objc_alloc_init((Class)NSMutableString);
        [v12 appendFormat:@"%@", -[NSUUID UUIDString](v11, "UUIDString")];
        [v12 appendFormat:@"%@", [v9 identifier]];
        if ([v9 type] == 1)
        {
          id v32 = a4;
          id v38 = objc_alloc((Class)CLCircularRegion);
          [v9 geoCenter];
          double v14 = v13;
          double v16 = v15;
          [v9 geoRadius];
          double v18 = v17;
          unsigned int v37 = [v9 geoReferenceFrame];
          unsigned int v36 = [v9 allowMonitoringWhileNearby];
          unsigned int v35 = [v9 isLowPower];
          id v34 = [v9 onBehalfOfBundleId];
          unsigned int v33 = [v9 notifyOnEntry];
          unsigned __int8 v19 = [v9 notifyOnExit];
          unsigned __int8 v20 = [v9 conservativeEntry];
          BYTE2(v31) = [v9 emergency];
          BYTE1(v31) = v20;
          LOBYTE(v31) = v19;
          id v21 = [v38 initWithCenter:v37 radius:v36 referenceFrame:v35 allowMonitoringWhenNearby:v12 lowPower:v34 identifier:v33 onBehalfOfBundleId:v14 notifyOnEntry:v16 notifyOnExit:v18 conservativeEntry:v31 emergency:v11 deviceId:objc_msgSend(v9 handoffTag:"handoffTag")];
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_102323BE0);
          }
          long long v22 = qword_102419538;
          if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
          {
            __int16 v23 = [(NSString *)[(NSUUID *)v11 UUIDString] UTF8String];
            *(_DWORD *)buf = 68289538;
            int v40 = 0;
            __int16 v41 = 2082;
            v42 = "";
            __int16 v43 = 2114;
            id v44 = v21;
            __int16 v45 = 2082;
            unint64_t v46 = (unint64_t)v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff Adding region from watch\", \"region\":%{public, location:escape_only}@, \"deviceId\":%{public, location:escape_only}s}", buf, 0x26u);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](-[CLFenceHandoffConnectionManager receivingEndUnacknowledgedMessages](self, "receivingEndUnacknowledgedMessages"), "setObject:forKeyedSubscript:", -[CLFenceHandoffConnectionManager getResponseDictionary:forMessage:](self, "getResponseDictionary:forMessage:", [v32 outgoingResponseIdentifier], a3), v12);
          [(CLLocationManager *)[(CLFenceHandoffConnectionManager *)self locationManager] startMonitoringForRegion:v21];
        }
        return;
      }
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102323BE0);
      }
      id v30 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v40 = 0;
        __int16 v41 = 2082;
        v42 = "";
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#FenceHandoff handleAddingFenceOnCompanion: deviceId is nil\"}", buf, 0x12u);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_102323BE0);
        }
      }
      __int16 v25 = qword_102419538;
      if (os_signpost_enabled((os_log_t)qword_102419538))
      {
        *(_DWORD *)buf = 68289026;
        int v40 = 0;
        __int16 v41 = 2082;
        v42 = "";
        id v26 = "#FenceHandoff handleAddingFenceOnCompanion: deviceId is nil";
        __int16 v27 = "{\"msg%{public}.0s\":\"#FenceHandoff handleAddingFenceOnCompanion: deviceId is nil\"}";
        goto LABEL_32;
      }
    }
    else
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102323BE0);
      }
      int v28 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        [v9 type];
        unsigned int v29 = [v9 type];
        *(_DWORD *)buf = 68289539;
        int v40 = 0;
        __int16 v41 = 2082;
        v42 = "";
        __int16 v43 = 2113;
        id v44 = v9;
        __int16 v45 = 2050;
        unint64_t v46 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff Not a Geographic region\", \"region\":%{private, location:escape_only}@, \"type\":%{public, location:CLClientRegionType}lld}", buf, 0x26u);
      }
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    int v24 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      int v40 = 0;
      __int16 v41 = 2082;
      v42 = "";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff companion got a nil region for monitoring\"}", buf, 0x12u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102323BE0);
      }
    }
    __int16 v25 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      *(_DWORD *)buf = 68289026;
      int v40 = 0;
      __int16 v41 = 2082;
      v42 = "";
      id v26 = "#FenceHandoff companion got a nil region for monitoring";
      __int16 v27 = "{\"msg%{public}.0s\":\"#FenceHandoff companion got a nil region for monitoring\"}";
LABEL_32:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v26, v27, buf, 0x12u);
    }
  }
}

- (void)handleRemovingFenceOnCompanion:(id)a3 withContext:(id)a4
{
  id v7 = [(CLFenceHandoffConnectionManager *)self activeDeviceId];
  id v8 = [(CLFenceHandoffConnectionManager *)self getIdentifierFromMessage:a3];
  if (v8)
  {
    id v9 = v8;
    id v10 = objc_alloc_init((Class)NSMutableString);
    [v10 appendFormat:@"%@", -[NSUUID UUIDString](v7, "UUIDString")];
    [v10 appendFormat:@"%@", v9];
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    id v11 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289282;
      int v20 = 0;
      __int16 v21 = 2082;
      long long v22 = "";
      __int16 v23 = 2082;
      id v24 = [v10 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff remove fence\", \"primaryKey\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    id v12 = [objc_alloc((Class)CLLocation) initWithLatitude:0.0 longitude:0.0];
    id v13 = objc_alloc((Class)CLCircularRegion);
    [v12 coordinate];
    id v14 = [v13 initNearbyAllowedWithCenter:v10];
    -[NSMutableDictionary setObject:forKeyedSubscript:](-[CLFenceHandoffConnectionManager receivingEndUnacknowledgedMessages](self, "receivingEndUnacknowledgedMessages"), "setObject:forKeyedSubscript:", -[CLFenceHandoffConnectionManager getResponseDictionary:forMessage:](self, "getResponseDictionary:forMessage:", [a4 outgoingResponseIdentifier], a3), v10);
    [(CLLocationManager *)[(CLFenceHandoffConnectionManager *)self locationManager] stopMonitoringForRegion:v14];
    dispatch_time_t v15 = dispatch_time(0, 30000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1013D9CF8;
    block[3] = &unk_10229FEB0;
    block[4] = self;
    void block[5] = v10;
    dispatch_after(v15, (dispatch_queue_t)[objc_msgSend(-[CLFenceHandoffConnectionManager universe](self, "universe"), "silo") queue], block);
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    double v16 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      int v20 = 0;
      __int16 v21 = 2082;
      long long v22 = "";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff unable to get primary for deletion\"}", buf, 0x12u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102323BE0);
      }
    }
    double v17 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      *(_DWORD *)buf = 68289026;
      int v20 = 0;
      __int16 v21 = 2082;
      long long v22 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#FenceHandoff unable to get primary for deletion", "{\"msg%{public}.0s\":\"#FenceHandoff unable to get primary for deletion\"}", buf, 0x12u);
    }
  }
}

- (void)handleGetRegionStateOnCompanion:(id)a3
{
  id v5 = [(CLFenceHandoffConnectionManager *)self activeDeviceId];
  id v6 = [(CLFenceHandoffConnectionManager *)self getIdentifierFromMessage:a3];
  if (v6)
  {
    id v7 = v6;
    id v8 = objc_alloc_init((Class)NSMutableString);
    [v8 appendFormat:@"%@", -[NSUUID UUIDString](v5, "UUIDString")];
    [v8 appendFormat:@"%@", v7];
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    id v9 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289282;
      int v16 = 0;
      __int16 v17 = 2082;
      double v18 = "";
      __int16 v19 = 2082;
      id v20 = [v8 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff get Region state\", \"primaryKey\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    id v10 = [objc_alloc((Class)CLLocation) initWithLatitude:0.0 longitude:0.0];
    id v11 = objc_alloc((Class)CLCircularRegion);
    [v10 coordinate];
    id v12 = [v11 initNearbyAllowedWithCenter:v8];
    [(CLLocationManager *)[(CLFenceHandoffConnectionManager *)self locationManager] requestStateForRegion:v12];
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    id v13 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      int v16 = 0;
      __int16 v17 = 2082;
      double v18 = "";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff unable to get primary key for Region state\"}", buf, 0x12u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102323BE0);
      }
    }
    id v14 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      *(_DWORD *)buf = 68289026;
      int v16 = 0;
      __int16 v17 = 2082;
      double v18 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#FenceHandoff unable to get primary key for Region state", "{\"msg%{public}.0s\":\"#FenceHandoff unable to get primary key for Region state\"}", buf, 0x12u);
    }
  }
}

- (void)handleHandoffTagsOnCompanion:(id)a3 forDeviceID:(id)a4
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102323BE0);
  }
  id v7 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289282;
    v8[1] = 0;
    __int16 v9 = 2082;
    id v10 = "";
    __int16 v11 = 2114;
    id v12 = [a4 UUIDString];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff handleHandoffTagsOnCompanion\", \"deviceID\":%{public, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
  }
  if (a4) {
    [(CLLocationManager *)[(CLFenceHandoffConnectionManager *)self locationManager] changeFencesStateMatchingHandoffTags:[(CLFenceHandoffConnectionManager *)self getDictionaryFromMessage:a3] forDeviceID:a4 completion:&stru_102323BC0];
  }
}

- (void)disableHandoffDictionaryForDeviceId:(id)a3
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102323BE0);
  }
  id v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68289282;
    int v9 = 0;
    __int16 v10 = 2082;
    __int16 v11 = "";
    __int16 v12 = 2082;
    id v13 = [a3 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff sending dummy handoff dictionary\", \"inactiveDeviceId\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  id v6 = +[NSMutableDictionary dictionary];
  [v6 setObject:@"inactive" forKeyedSubscript:a3];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1013DA6C8;
  v7[3] = &unk_1022B8750;
  v7[4] = a3;
  -[CLLocationManager changeFencesStateMatchingHandoffTags:forDeviceID:completion:](-[CLFenceHandoffConnectionManager locationManager](self, "locationManager"), "changeFencesStateMatchingHandoffTags:forDeviceID:completion:", v6, [objc_alloc((Class)NSUUID) initWithUUIDString:a3], v7);
}

- (void)getHandoffTags
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102323BE0);
  }
  int v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    __int16 v6 = 2082;
    id v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff getHandoffTags\"}", (uint8_t *)v5, 0x12u);
  }
  uint64_t v4 = objc_alloc_init(CLFenceHandoffMessage);
  [(CLFenceHandoffMessage *)v4 setMessageType:7];
  [(CLFenceHandoffMessage *)v4 setPayload:&off_102394808];
  [(CLFenceHandoffConnectionManager *)self sendMessage:v4];
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102323BE0);
  }
  __int16 v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 68289539;
    int v11 = 0;
    __int16 v12 = 2082;
    id v13 = "";
    __int16 v14 = 2113;
    id v15 = a4;
    __int16 v16 = 2082;
    id v17 = [[objc_msgSend(a4, "identifier") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff region monitoring started\", \"region\":%{private, location:escape_only}@, \"regionIdentifier\":%{public, location:escape_only}s}", (uint8_t *)&v10, 0x26u);
  }
  if (-[NSMutableDictionary objectForKeyedSubscript:](-[CLFenceHandoffConnectionManager receivingEndUnacknowledgedMessages](self, "receivingEndUnacknowledgedMessages"), "objectForKeyedSubscript:", [a4 identifier]))
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    id v7 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [[objc_msgSend(a4, "identifier") UTF8String];
      int v10 = 68289282;
      int v11 = 0;
      __int16 v12 = 2082;
      id v13 = "";
      __int16 v14 = 2082;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff didStartMonitoringForRegion found key in unacknowledged messages\", \"primaryKey\":%{public, location:escape_only}s}", (uint8_t *)&v10, 0x1Cu);
    }
    id v9 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLFenceHandoffConnectionManager receivingEndUnacknowledgedMessages](self, "receivingEndUnacknowledgedMessages"), "objectForKeyedSubscript:", [a4 identifier]);
    -[CLFenceHandoffConnectionManager responseWithAck:forMessage:](self, "responseWithAck:forMessage:", [v9 objectForKeyedSubscript:@"kCLFenceHandoffResponseDictionaryIDSIdentifierKey"], [v9 objectForKeyedSubscript:@"kCLFenceHandoffResponseDictionaryMessageKey"]);
    -[NSMutableDictionary removeObjectForKey:](-[CLFenceHandoffConnectionManager receivingEndUnacknowledgedMessages](self, "receivingEndUnacknowledgedMessages"), "removeObjectForKey:", [a4 identifier]);
  }
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102323BE0);
  }
  id v7 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
  {
    int v11 = 68289795;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    id v16 = [[objc_msgSend(a4, "identifier") UTF8String];
    __int16 v17 = 2113;
    id v18 = a4;
    __int16 v19 = 2082;
    id v20 = [[objc_msgSend(a5, "description") UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#FenceHandoff region monitoring failed to start\", \"regionIdentifier\":%{public, location:escape_only}s, \"region\":%{private, location:escape_only}@, \"Error\":%{public, location:escape_only}s}", (uint8_t *)&v11, 0x30u);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
  }
  id v8 = qword_102419538;
  if (os_signpost_enabled((os_log_t)qword_102419538))
  {
    id v9 = [[[a4 identifier] UTF8String];
    id v10 = [[[a5 description] UTF8String];
    int v11 = 68289795;
    int v12 = 0;
    __int16 v13 = 2082;
    __int16 v14 = "";
    __int16 v15 = 2082;
    id v16 = v9;
    __int16 v17 = 2113;
    id v18 = a4;
    __int16 v19 = 2082;
    id v20 = v10;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#FenceHandoff region monitoring failed to start", "{\"msg%{public}.0s\":\"#FenceHandoff region monitoring failed to start\", \"regionIdentifier\":%{public, location:escape_only}s, \"region\":%{private, location:escape_only}@, \"Error\":%{public, location:escape_only}s}", (uint8_t *)&v11, 0x30u);
  }
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102323BE0);
  }
  __int16 v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 68289283;
    int v9 = 0;
    __int16 v10 = 2082;
    int v11 = "";
    __int16 v12 = 2113;
    id v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff didEnterRegion\", \"Region\":%{private, location:escape_only}@}", (uint8_t *)&v8, 0x1Cu);
  }
  if (-[CLFenceHandoffConnectionManager isCurrentActiveDevice:](self, "isCurrentActiveDevice:", [a4 deviceId]))
  {
    [(CLFenceHandoffConnectionManager *)self sendRegionEvent:11 forRegion:a4];
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    id v7 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 68289283;
      int v9 = 0;
      __int16 v10 = 2082;
      int v11 = "";
      __int16 v12 = 2113;
      id v13 = a4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff ignoring entry notification\", \"region\":%{private, location:escape_only}@}", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102323BE0);
  }
  __int16 v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 68289283;
    int v9 = 0;
    __int16 v10 = 2082;
    int v11 = "";
    __int16 v12 = 2113;
    id v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff didExitRegion\", \"Region\":%{private, location:escape_only}@}", (uint8_t *)&v8, 0x1Cu);
  }
  if (-[CLFenceHandoffConnectionManager isCurrentActiveDevice:](self, "isCurrentActiveDevice:", [a4 deviceId]))
  {
    [(CLFenceHandoffConnectionManager *)self sendRegionEvent:13 forRegion:a4];
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    id v7 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 68289283;
      int v9 = 0;
      __int16 v10 = 2082;
      int v11 = "";
      __int16 v12 = 2113;
      id v13 = a4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff ignoring exit notification\", \"region\":%{private, location:escape_only}@}", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102323BE0);
  }
  int v8 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 68289283;
    int v17 = 0;
    __int16 v18 = 2082;
    __int16 v19 = "";
    __int16 v20 = 2113;
    id v21 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff didDetermineState:forRegion:\", \"Region\":%{private, location:escape_only}@}", (uint8_t *)&v16, 0x1Cu);
  }
  if (-[CLFenceHandoffConnectionManager isCurrentActiveDevice:](self, "isCurrentActiveDevice:", [a5 deviceId]))
  {
    if (a4 == 2)
    {
      int v9 = self;
      uint64_t v10 = 17;
      goto LABEL_14;
    }
    if (a4 == 1)
    {
      int v9 = self;
      uint64_t v10 = 15;
LABEL_14:
      [(CLFenceHandoffConnectionManager *)v9 sendRegionEvent:v10 forRegion:a5];
      return;
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    __int16 v12 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      id v13 = [objc_msgSend(a5, "identifier") UTF8String];
      int v16 = 68289538;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      __int16 v20 = 2082;
      id v21 = v13;
      __int16 v22 = 2050;
      int64_t v23 = a4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#FenceHandoff unknown region state\", \"region\":%{public, location:escape_only}s, \"state\":%{public, location:CLRegionState}lld}", (uint8_t *)&v16, 0x26u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102323BE0);
      }
    }
    __int16 v14 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      id v15 = [[[a5 identifier] UTF8String];
      int v16 = 68289538;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      __int16 v20 = 2082;
      id v21 = v15;
      __int16 v22 = 2050;
      int64_t v23 = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#FenceHandoff unknown region state", "{\"msg%{public}.0s\":\"#FenceHandoff unknown region state\", \"region\":%{public, location:escape_only}s, \"state\":%{public, location:CLRegionState}lld}", (uint8_t *)&v16, 0x26u);
    }
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    int v11 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 68289283;
      int v17 = 0;
      __int16 v18 = 2082;
      __int16 v19 = "";
      __int16 v20 = 2113;
      id v21 = a5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#FenceHandoff ignoring did determine state notification\", \"region\":%{private, location:escape_only}@}", (uint8_t *)&v16, 0x1Cu);
    }
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  if ((a4 - 3) <= 1) {
    [(CLFenceHandoffConnectionManager *)self getHandoffTags];
  }
}

- (BOOL)isCurrentActiveDevice:(id)a3
{
  unsigned int v5 = [(CLFenceHandoffConnectionManager *)self isActiveDeviceNearby];
  if (v5)
  {
    __int16 v6 = [(CLFenceHandoffConnectionManager *)self activeDeviceId];
    LOBYTE(v5) = [(NSUUID *)v6 isEqual:a3];
  }
  return v5;
}

- (void)sendRegionEvent:(int64_t)a3 forRegion:(id)a4
{
  if ([a4 type] == 1)
  {
    id v7 = objc_alloc_init(CLFenceHandoffMessage);
    id v27 = [[objc_msgSend(a4, "identifier") stringByReplacingOccurrencesOfString:-[NSUUID UUIDString](-[CLFenceHandoffConnectionManager activeDeviceId](self, "activeDeviceId"), "UUIDString") withString:&stru_10234F018];
    id v26 = objc_alloc((Class)CLCircularRegion);
    [a4 center];
    double v9 = v8;
    double v11 = v10;
    [a4 radius];
    double v13 = v12;
    id v14 = [a4 geoReferenceFrame];
    id v15 = [a4 allowMonitoringWhileNearby];
    id v16 = [a4 isLowPower];
    id v17 = [a4 notifyOnEntry];
    unsigned __int8 v18 = [a4 notifyOnExit];
    unsigned __int8 v19 = [a4 conservativeEntry];
    BYTE2(v25) = [a4 emergency];
    BYTE1(v25) = v19;
    LOBYTE(v25) = v18;
    id v20 = [v26 initWithCenter:v14 radius:v15 referenceFrame:v16 allowMonitoringWhenNearby:v27 lowPower:0 identifier:v17 notifyOnEntry:v9 notifyOnExit:v11 conservativeEntry:v13 emergency:v25];
    [(CLFenceHandoffMessage *)v7 setMessageType:a3];
    [(CLFenceHandoffMessage *)v7 setPayload:v20];
    [(CLFenceHandoffConnectionManager *)self sendMessage:v7];
    id v21 = v20;
  }
  else
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    __int16 v22 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      [a4 type];
      *(_DWORD *)buf = 68289539;
      int v29 = 0;
      __int16 v30 = 2082;
      uint64_t v31 = "";
      __int16 v32 = 2050;
      uint64_t v33 = [a4 type];
      __int16 v34 = 2113;
      id v35 = a4;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#FenceHandoff Only Circular Region are supported\", \"type\":%{public, location:CLClientRegionType}lld, \"region\":%{private, location:escape_only}@}", buf, 0x26u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102323BE0);
      }
    }
    int64_t v23 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      [a4 type];
      unsigned int v24 = [a4 type];
      *(_DWORD *)buf = 68289539;
      int v29 = 0;
      __int16 v30 = 2082;
      uint64_t v31 = "";
      __int16 v32 = 2050;
      uint64_t v33 = v24;
      __int16 v34 = 2113;
      id v35 = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#FenceHandoff Only Circular Region are supported", "{\"msg%{public}.0s\":\"#FenceHandoff Only Circular Region are supported\", \"type\":%{public, location:CLClientRegionType}lld, \"region\":%{private, location:escape_only}@}", buf, 0x26u);
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  [self universe:a3 silo:a4];
  if ([(CLFenceHandoffConnectionManager *)self isActiveDeviceNearby]) {
    dispatch_time_t v11 = 0;
  }
  else {
    dispatch_time_t v11 = 3000000000;
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1013DB84C;
  v12[3] = &unk_1022C6138;
  v12[4] = self;
  v12[5] = a5;
  v12[6] = a7;
  v12[7] = a6;
  dispatch_after(v11, (dispatch_queue_t)[-[CLFenceHandoffConnectionManager silo](self, "silo") queue], v12);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  BOOL v10 = a6;
  [self universe:a3 silo:a4];
  if (v10)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323BE0);
    }
    double v13 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68290050;
      int v21 = 0;
      __int16 v22 = 2082;
      int64_t v23 = "";
      __int16 v24 = 2082;
      id v25 = [a5 UTF8String];
      __int16 v26 = 1026;
      int v27 = 1;
      __int16 v28 = 2114;
      id v29 = a7;
      __int16 v30 = 2114;
      id v31 = a8;
      id v14 = "{\"msg%{public}.0s\":\"#FenceHandoff did send message to IDS to be delivered\", \"identifier\":%{public, loc"
            "ation:escape_only}s, \"success\":%{public}hhd, \"error\":%{public, location:escape_only}@, \"context\":%{pub"
            "lic, location:escape_only}@}";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0x36u);
    }
  }
  else
  {
    id v15 = [(NSMutableDictionary *)[(CLFenceHandoffConnectionManager *)self unacknowledgedMessages] objectForKeyedSubscript:a5];
    if (v15)
    {
      id v16 = v15;
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102323BE0);
      }
      id v17 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68290050;
        int v21 = 0;
        __int16 v22 = 2082;
        int64_t v23 = "";
        __int16 v24 = 2082;
        id v25 = [a5 UTF8String];
        __int16 v26 = 1026;
        int v27 = 0;
        __int16 v28 = 2114;
        id v29 = a7;
        __int16 v30 = 2114;
        id v31 = a8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff resending message again\", \"identifier\":%{public, location:escape_only}s, \"success\":%{public}hhd, \"error\":%{public, location:escape_only}@, \"context\":%{public, location:escape_only}@}", buf, 0x36u);
      }
      dispatch_time_t v18 = dispatch_time(0, 300000000000);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1013DC5A0;
      v19[3] = &unk_10229FEB0;
      v19[4] = self;
      v19[5] = v16;
      dispatch_after(v18, (dispatch_queue_t)[objc_msgSend(-[CLFenceHandoffConnectionManager universe](self, "universe"), "silo") queue], v19);
    }
    else
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102323BE0);
      }
      double v13 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68290050;
        int v21 = 0;
        __int16 v22 = 2082;
        int64_t v23 = "";
        __int16 v24 = 2082;
        id v25 = [a5 UTF8String];
        __int16 v26 = 1026;
        int v27 = 0;
        __int16 v28 = 2114;
        id v29 = a7;
        __int16 v30 = 2114;
        id v31 = a8;
        id v14 = "{\"msg%{public}.0s\":\"#FenceHandoff old message queued by IDS failed\", \"identifier\":%{public, location"
              ":escape_only}s, \"success\":%{public}hhd, \"error\":%{public, location:escape_only}@, \"context\":%{public"
              ", location:escape_only}@}";
        goto LABEL_16;
      }
    }
  }
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102323BE0);
  }
  __int16 v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 68289026;
    v7[1] = 0;
    __int16 v8 = 2082;
    double v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#FenceHandoff nearby devices changed\"}", (uint8_t *)v7, 0x12u);
  }
  [(CLFenceHandoffConnectionManager *)self updateActiveDeviceId:a4];
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setService:(id)a3
{
}

- (NSMutableDictionary)unacknowledgedMessages
{
  return self->_unacknowledgedMessages;
}

- (void)setUnacknowledgedMessages:(id)a3
{
}

- (NSUUID)activeDeviceId
{
  return self->_activeDeviceId;
}

- (void)setActiveDeviceId:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (NSMutableDictionary)receivingEndUnacknowledgedMessages
{
  return self->_receivingEndUnacknowledgedMessages;
}

- (void)setReceivingEndUnacknowledgedMessages:(id)a3
{
}

@end