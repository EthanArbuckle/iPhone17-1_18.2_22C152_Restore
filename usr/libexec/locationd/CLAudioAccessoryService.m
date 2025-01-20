@interface CLAudioAccessoryService
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLAudioAccessoryService)init;
- (NSDictionary)latestData;
- (NSMutableSet)clients;
- (void)beginService;
- (void)endService;
- (void)fireMotionAlarm;
- (void)onAudioAccessoryInterfaceDailyUsageCallback:(int)a3 data:(id)a4;
- (void)registerForUsageMetricsUpdates:(id)a3;
- (void)setClients:(id)a3;
- (void)setLatestData:(id)a3;
- (void)unregisterForUsageMetricsUpdates:(id)a3;
@end

@implementation CLAudioAccessoryService

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
  if (qword_102487998 != -1) {
    dispatch_once(&qword_102487998, &stru_102324CA0);
  }
  return (id)qword_102487990;
}

- (CLAudioAccessoryService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLAudioAccessoryService;
  return [(CLAudioAccessoryService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLAudioAccessoryServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLAudioAccessoryServiceClientProtocol];
}

+ (BOOL)isSupported
{
  if (qword_1024879A8 != -1) {
    dispatch_once(&qword_1024879A8, &stru_102324CC0);
  }
  return byte_1024879A0;
}

- (void)beginService
{
  if (qword_1024190E0 != -1) {
    dispatch_once(&qword_1024190E0, &stru_102324CE0);
  }
  objc_super v3 = qword_1024190E8;
  if (os_log_type_enabled((os_log_t)qword_1024190E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] Starting up CLAudioAccessoryService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190E0 != -1) {
      dispatch_once(&qword_1024190E0, &stru_102324CE0);
    }
    unint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAudioAccessoryService beginService]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v4 = sub_100514790();
  sub_1005170C4(v4, (uint64_t)sub_10140B6A0, (uint64_t)self);
  [(CLAudioAccessoryService *)self setClients:objc_opt_new()];
  [(CLAudioAccessoryService *)self setLatestData:0];
}

- (void)endService
{
  if (qword_1024190E0 != -1) {
    dispatch_once(&qword_1024190E0, &stru_102324CE0);
  }
  objc_super v3 = qword_1024190E8;
  if (os_log_type_enabled((os_log_t)qword_1024190E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] Shutting down CLAudioAccessoryService", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190E0 != -1) {
      dispatch_once(&qword_1024190E0, &stru_102324CE0);
    }
    unint64_t v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAudioAccessoryService endService]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  uint64_t v4 = sub_100514790();
  sub_100517118(v4, (uint64_t)self);

  [(CLAudioAccessoryService *)self setClients:0];
  [(CLAudioAccessoryService *)self setLatestData:0];
}

- (void)registerForUsageMetricsUpdates:(id)a3
{
  if (qword_1024190E0 != -1) {
    dispatch_once(&qword_1024190E0, &stru_102324CE0);
  }
  unint64_t v5 = qword_1024190E8;
  if (os_log_type_enabled((os_log_t)qword_1024190E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] AccessoryService - registerForUsageMetricsUpdates %@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190E0 != -1) {
      dispatch_once(&qword_1024190E0, &stru_102324CE0);
    }
    v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAudioAccessoryService registerForUsageMetricsUpdates:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  [(NSMutableSet *)[(CLAudioAccessoryService *)self clients] addObject:a3];
  if ([(CLAudioAccessoryService *)self latestData])
  {
    if (qword_1024190E0 != -1) {
      dispatch_once(&qword_1024190E0, &stru_102324CE0);
    }
    v6 = qword_1024190E8;
    if (os_log_type_enabled((os_log_t)qword_1024190E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] Sending cached data", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024190E0 != -1) {
        dispatch_once(&qword_1024190E0, &stru_102324CE0);
      }
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAudioAccessoryService registerForUsageMetricsUpdates:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
    [a3 onUsageMetricsEvent:-[CLAudioAccessoryService latestData](self, "latestData")];
  }
}

- (void)unregisterForUsageMetricsUpdates:(id)a3
{
  if (qword_1024190E0 != -1) {
    dispatch_once(&qword_1024190E0, &stru_102324CE0);
  }
  unint64_t v5 = qword_1024190E8;
  if (os_log_type_enabled((os_log_t)qword_1024190E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] AccessoryService - unregisterForUsageMetricsUpdates %@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190E0 != -1) {
      dispatch_once(&qword_1024190E0, &stru_102324CE0);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAudioAccessoryService unregisterForUsageMetricsUpdates:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  [(NSMutableSet *)[(CLAudioAccessoryService *)self clients] removeObject:a3];
}

- (void)onAudioAccessoryInterfaceDailyUsageCallback:(int)a3 data:(id)a4
{
  double Current = CFAbsoluteTimeGetCurrent();
  if (qword_1024190E0 != -1) {
    dispatch_once(&qword_1024190E0, &stru_102324CE0);
  }
  id v8 = qword_1024190E8;
  if (os_log_type_enabled((os_log_t)qword_1024190E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v31 = a3;
    *(_WORD *)&v31[4] = 2048;
    *(void *)&v31[6] = [(NSMutableSet *)[(CLAudioAccessoryService *)self clients] count];
    __int16 v32 = 1024;
    int v33 = (int)Current;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] Service received bluetooth event:%d, numClients:%lu, timestamp:%d", buf, 0x18u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190E0 != -1) {
      dispatch_once(&qword_1024190E0, &stru_102324CE0);
    }
    int v26 = 67109632;
    *(_DWORD *)v27 = a3;
    *(_WORD *)&v27[4] = 2048;
    *(void *)&v27[6] = [(NSMutableSet *)[(CLAudioAccessoryService *)self clients] count];
    __int16 v28 = 1024;
    int v29 = (int)Current;
    v19 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAudioAccessoryService onAudioAccessoryInterfaceDailyUsageCallback:data:]", "%s\n", v19);
    if (v19 != (char *)buf) {
      free(v19);
    }
  }
  [(CLAudioAccessoryService *)self fireMotionAlarm];
  v9 = +[NSMutableDictionary dictionaryWithDictionary:a4];
  [(NSMutableDictionary *)v9 setObject:+[NSNumber numberWithInt:(int)Current] forKeyedSubscript:@"timestamp_received_on_companion"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v20 = self;
  id v10 = [(CLAudioAccessoryService *)self clients];
  id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v14);
        if (qword_1024190E0 != -1) {
          dispatch_once(&qword_1024190E0, &stru_102324CE0);
        }
        v16 = qword_1024190E8;
        if (os_log_type_enabled((os_log_t)qword_1024190E8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v31 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[HeadphoneUsage] AccessoryService - Notifying client %@", buf, 0xCu);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_1024190E0 != -1) {
            dispatch_once(&qword_1024190E0, &stru_102324CE0);
          }
          int v26 = 138412290;
          *(void *)v27 = v15;
          v17 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAudioAccessoryService onAudioAccessoryInterfaceDailyUsageCallback:data:]", "%s\n", v17);
          if (v17 != (char *)buf) {
            free(v17);
          }
        }
        [v15 onUsageMetricsEvent:v9];
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v18 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      id v12 = v18;
    }
    while (v18);
  }
  [(CLAudioAccessoryService *)v20 setLatestData:v9];
}

- (void)fireMotionAlarm
{
  id v2 = [[objc_msgSend(-[CLAudioAccessoryService universe](self, "universe"), "vendor") proxyForService:@"CLMotionAlarmNotifier"];
  if (qword_1024190E0 != -1) {
    dispatch_once(&qword_1024190E0, &stru_102324CE0);
  }
  objc_super v3 = qword_1024190E8;
  if (os_log_type_enabled((os_log_t)qword_1024190E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[HeadphoneUsage] Firing motion alarm kCMMotionAlarmTriggerTypeMetricsEvent", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024190E0 != -1) {
      dispatch_once(&qword_1024190E0, &stru_102324CE0);
    }
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLAudioAccessoryService fireMotionAlarm]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [v2 fireEventAlarm:27];
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (NSDictionary)latestData
{
  return self->_latestData;
}

- (void)setLatestData:(id)a3
{
}

@end