@interface CSCompanionService
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncget_isCompanionConnected;
- (BOOL)syncget_isCompanionPaired;
- (CSCompanionService)init;
- (CompanionDelegate)delegate;
- (IDSService)idsService;
- (NSHashTable)clients;
- (void)beginService;
- (void)messageHandler:(int)a3 data:(id)a4 timestamp:(double)a5;
- (void)notifyCompanionOfForwardMsgCompatibility;
- (void)notifyCompanionOfLocalCrash:(id)a3 forMode:(int)a4 martyIsBicycle:(BOOL)a5;
- (void)onCompanionConnectionStatusUpdate:(int)a3 cftime:(double)a4 sputime:(unint64_t)a5;
- (void)queryCompanion:(int)a3;
- (void)registerClient:(id)a3;
- (void)returnQueryToCompanion:(id)a3;
- (void)sendData:(id)a3 type:(int)a4;
- (void)sendTestTrigger;
- (void)setDelegate:(id)a3;
- (void)setIdsService:(id)a3;
- (void)statusHandler:(BOOL)a3 pairedDevice:(id)a4 timestamp:(double)a5;
- (void)testTriggerHandler:(double)a3;
- (void)unregisterClient:(id)a3;
@end

@implementation CSCompanionService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v5 = a4 + 1;
  if (v5 < (unint64_t)[v6 count]) {
    [objc_msgSend(v6, "objectAtIndexedSubscript:", v5) becameFatallyBlocked:v6 index:v5];
  }
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1003DD7B8 != -1) {
    dispatch_once(&qword_1003DD7B8, &stru_1003BADF8);
  }
  v2 = (void *)qword_1003DD7B0;

  return v2;
}

- (CSCompanionService)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSCompanionService;
  return [(CSCompanionService *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CSCompanionServiceIBProtocol outboundProtocol:&OBJC_PROTOCOL___CSCompanionServiceClientProtocol];
}

- (void)beginService
{
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  objc_super v3 = qword_1003DB718;
  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "beginService", (uint8_t *)buf, 2u);
  }
  v4 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:5 capacity:0];
  clients = self->_clients;
  self->_clients = v4;

  _companionCompatibility = 0;
  objc_initWeak(buf, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100317A80;
  v6[3] = &unk_1003BAF60;
  objc_copyWeak(&v7, buf);
  v6[4] = self;
  +[IDSService serviceWithIdentifier:@"com.apple.private.alloy.kappa" completion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)statusHandler:(BOOL)a3 pairedDevice:(id)a4 timestamp:(double)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  v9 = qword_1003DB718;
  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "statusHandler", buf, 2u);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v10 = [(CSCompanionService *)self clients];
  id v11 = [v10 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) onCompanionStatusUpdate:v6 pairedDevice:v8 updatedTimestamp:a5];
      }
      id v11 = [v10 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)testTriggerHandler:(double)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v3 = [(CSCompanionService *)self clients];
  v4 = (char *)[v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (1)
    {
      if (*(void *)v9 != v5) {
        objc_enumerationMutation(v3);
      }
      if (qword_1003DB710 != -1) {
        dispatch_once(&qword_1003DB710, &stru_1003BAF80);
      }
      BOOL v6 = qword_1003DB718;
      if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "testTriggerHandler", v7, 2u);
      }
      if (!--v4)
      {
        v4 = (char *)[v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (!v4) {
          break;
        }
      }
    }
  }
}

- (void)messageHandler:(int)a3 data:(id)a4 timestamp:(double)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  long long v9 = qword_1003DB718;
  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "messageHandler", buf, 2u);
  }
  if (v6 == 11 && !_companionCompatibility)
  {
    if (qword_1003DB710 != -1) {
      dispatch_once(&qword_1003DB710, &stru_1003BAF80);
    }
    long long v10 = qword_1003DB718;
    if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Determined that companion is forward compatible", buf, 2u);
    }
    _companionCompatibility = 1;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v11 = [(CSCompanionService *)self clients];
  id v12 = [v11 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * i) onCompanionMessage:v6 data:v8 receivedTimestamp:a5];
      }
      id v12 = [v11 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v12);
  }
}

- (void)onCompanionConnectionStatusUpdate:(int)a3 cftime:(double)a4 sputime:(unint64_t)a5
{
  uint64_t v7 = *(void *)&a3;
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  long long v9 = qword_1003DB718;
  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    int v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "onCompanionConnectionStatusUpdate %d", buf, 8u);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v10 = [(CSCompanionService *)self clients];
  id v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) onCompanionConnectionStatusUpdate:v7 cftime:a5 sputime:a4];
      }
      id v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  uint64_t v5 = qword_1003DB718;
  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "registerClient", v6, 2u);
  }
  [(NSHashTable *)self->_clients addObject:v4];
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  uint64_t v5 = qword_1003DB718;
  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "unregisterClient", v6, 2u);
  }
  [(NSHashTable *)self->_clients removeObject:v4];
}

- (BOOL)syncget_isCompanionConnected
{
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  objc_super v3 = qword_1003DB718;
  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "isCompanionConnected", v5, 2u);
  }
  [(CompanionDelegate *)self->_delegate updateIDSStatus];
  return [(CompanionDelegate *)self->_delegate isConnected];
}

- (BOOL)syncget_isCompanionPaired
{
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  objc_super v3 = qword_1003DB718;
  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "isCompanionPaired", v7, 2u);
  }
  [(CompanionDelegate *)self->_delegate updateIDSStatus];
  id v4 = [(CompanionDelegate *)self->_delegate pairedDevice];
  unsigned __int8 v5 = [v4 isLocallyPaired];

  return v5;
}

- (void)notifyCompanionOfLocalCrash:(id)a3 forMode:(int)a4 martyIsBicycle:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (!a4)
  {
    if (qword_1003DB710 != -1) {
      dispatch_once(&qword_1003DB710, &stru_1003BAF80);
    }
    uint64_t v13 = qword_1003DB718;
    if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "invalid mode", buf, 2u);
    }
    goto LABEL_23;
  }
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  long long v9 = qword_1003DB718;
  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "notifyCompanionOfLocalCrash", buf, 2u);
  }
  *(void *)buf = 0;
  uint64_t v18 = 0;
  if (v8)
  {
    [v8 getUUIDBytes:buf];
    if (qword_1003DB710 != -1) {
      dispatch_once(&qword_1003DB710, &stru_1003BAF80);
    }
    long long v10 = (id)qword_1003DB718;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [v8 UUIDString];
      *(_DWORD *)long long v16 = 138412290;
      *(void *)&v16[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Test UUID bytes %@", v16, 0xCu);
    }
  }
  if (a4 == 1)
  {
    uint64_t v12 = 6;
LABEL_22:
    delegate = self->_delegate;
    long long v15 = +[NSData dataWithBytes:buf length:16];
    [(CompanionDelegate *)delegate sendData:v15 type:v12];

LABEL_23:
    return;
  }
  if (a4 == 2)
  {
    if (v5) {
      uint64_t v12 = 306;
    }
    else {
      uint64_t v12 = 305;
    }
    goto LABEL_22;
  }
  sub_100319808((NSObject **)v16);

  abort_report_np();
  __break(1u);
}

- (void)notifyCompanionOfForwardMsgCompatibility
{
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  objc_super v3 = qword_1003DB718;
  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "notifyCompanionOfForwardMsgCompatibility", buf, 2u);
  }
  int v6 = 1;
  delegate = self->_delegate;
  BOOL v5 = +[NSData dataWithBytes:&v6 length:4];
  [(CompanionDelegate *)delegate sendData:v5 type:11];
}

- (void)queryCompanion:(int)a3
{
  int v8 = a3;
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  BOOL v5 = qword_1003DB718;
  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    int v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "queryCompanion type:%d", buf, 8u);
  }
  delegate = self->_delegate;
  uint64_t v7 = +[NSData dataWithBytes:&v8 length:4];
  [(CompanionDelegate *)delegate sendData:v7 type:9];
}

- (void)returnQueryToCompanion:(id)a3
{
  id v4 = a3;
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  BOOL v5 = qword_1003DB718;
  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "returnQueryToCompanion", v6, 2u);
  }
  [(CompanionDelegate *)self->_delegate sendData:v4 type:10];
}

- (void)sendData:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  uint64_t v7 = qword_1003DB718;
  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 67109120;
    v8[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "sendMessage: type: %d", (uint8_t *)v8, 8u);
  }
  [(CompanionDelegate *)self->_delegate sendData:v6 type:v4];
}

- (void)sendTestTrigger
{
  if (qword_1003DB710 != -1) {
    dispatch_once(&qword_1003DB710, &stru_1003BAF80);
  }
  objc_super v3 = qword_1003DB718;
  if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "sendTestTrigger", v4, 2u);
  }
  [(CompanionDelegate *)self->_delegate sendData:0 type:0];
}

- (NSHashTable)clients
{
  return self->_clients;
}

- (CompanionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_clients, 0);
}

@end