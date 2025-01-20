@interface CLVisionNotifier
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)hasSessionTimedOut:(double)a3;
- (BOOL)isARSessionActive;
- (CLTimer)sessionTimer;
- (CLVisionNotifier)init;
- (NSMutableSet)clients;
- (double)lastARKitUpdate;
- (void)beginService;
- (void)closeSessionWithState:(unint64_t)a3 fromClient:(id)a4;
- (void)deregisterForVisionNotifications:(id)a3;
- (void)endService;
- (void)registerForVisionNotifications:(id)a3;
- (void)sendARSessionState:(id)a3 fromClient:(id)a4;
- (void)sendVIOEstimation:(id)a3 fromClient:(id)a4;
- (void)sendVLLocalizationResult:(id)a3 fromClient:(id)a4;
- (void)setArSessionActive:(BOOL)a3;
- (void)setClients:(id)a3;
- (void)setLastARKitUpdate:(double)a3;
- (void)setSessionTimer:(id)a3;
- (void)startSessionWithState:(unint64_t)a3 fromClient:(id)a4;
- (void)updateClientsWithHandler:(id)a3;
@end

@implementation CLVisionNotifier

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
  if (qword_10247AC10 != -1) {
    dispatch_once(&qword_10247AC10, &stru_1022B4D50);
  }
  return (id)qword_10247AC08;
}

+ (BOOL)isSupported
{
  return 1;
}

- (CLVisionNotifier)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLVisionNotifier;
  return [(CLVisionNotifier *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLVisionNotifierServiceProtocol outboundProtocol:&OBJC_PROTOCOL___CLVisionNotifierClientProtocol];
}

- (void)beginService
{
  [self universe].silo
  [(CLVisionNotifier *)self setArSessionActive:0];
  [(CLVisionNotifier *)self setLastARKitUpdate:-1.0];
  -[CLVisionNotifier setSessionTimer:](self, "setSessionTimer:", [objc_msgSend(-[CLVisionNotifier universe](self, "universe"), "silo") newTimer]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10049D790;
  v5[3] = &unk_10229FED8;
  v5[4] = self;
  [(CLTimer *)[(CLVisionNotifier *)self sessionTimer] setHandler:v5];
  [(CLVisionNotifier *)self setClients:+[NSMutableSet set]];
  if (qword_102419420 != -1) {
    dispatch_once(&qword_102419420, &stru_1022B4DC0);
  }
  objc_super v3 = qword_102419428;
  if (os_log_type_enabled((os_log_t)qword_102419428, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLVN,beginService,vision notifier started.", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419420 != -1) {
      dispatch_once(&qword_102419420, &stru_1022B4DC0);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVisionNotifier beginService]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)endService
{
  [universe silo];
  [(CLVisionNotifier *)self setArSessionActive:0];
  [(CLVisionNotifier *)self setLastARKitUpdate:-1.0];
  [(CLTimer *)[(CLVisionNotifier *)self sessionTimer] invalidate];
  [(CLVisionNotifier *)self setSessionTimer:0];
  [(CLVisionNotifier *)self setClients:0];
  if (qword_102419420 != -1) {
    dispatch_once(&qword_102419420, &stru_1022B4DC0);
  }
  objc_super v3 = qword_102419428;
  if (os_log_type_enabled((os_log_t)qword_102419428, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "CLVN,endService,vision notifier ended.", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419420 != -1) {
      dispatch_once(&qword_102419420, &stru_1022B4DC0);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVisionNotifier endService]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
}

- (void)registerForVisionNotifications:(id)a3
{
  [self universe].silo
  clients = self->_clients;

  [(NSMutableSet *)clients addObject:a3];
}

- (void)deregisterForVisionNotifications:(id)a3
{
  [universe silo];
  clients = self->_clients;

  [(NSMutableSet *)clients removeObject:a3];
}

- (void)sendARSessionState:(id)a3 fromClient:(id)a4
{
  [universe silo];
  uint64_t v11 = 0;
  if (a3 && [a3 length] == (id)8)
  {
    [a3 getBytes:&v11 length:8];
    if (v11 == 1)
    {
      if ([(CLVisionNotifier *)self isARSessionActive])
      {
        if (qword_102419420 != -1) {
          dispatch_once(&qword_102419420, &stru_1022B4DC0);
        }
        v7 = qword_102419428;
        if (os_log_type_enabled((os_log_t)qword_102419428, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLVN,sendARSessionState:fromClient:,New session has started without end notification of previous session.", buf, 2u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419420 != -1) {
            dispatch_once(&qword_102419420, &stru_1022B4DC0);
          }
          v10 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVisionNotifier sendARSessionState:fromClient:]", "%s\n", v10);
          if (v10 != (char *)buf) {
            free(v10);
          }
        }
        [(CLVisionNotifier *)self closeSessionWithState:2 fromClient:a4];
      }
      [(CLVisionNotifier *)self startSessionWithState:v11 fromClient:a4];
    }
    else
    {
      [(CLVisionNotifier *)self closeSessionWithState:v11 fromClient:a4];
    }
  }
  else
  {
    if (qword_102419420 != -1) {
      dispatch_once(&qword_102419420, &stru_1022B4DC0);
    }
    v8 = qword_102419428;
    if (os_log_type_enabled((os_log_t)qword_102419428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      int v13 = 0;
      __int16 v14 = 2082;
      v15 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLVN,sendARSessionState:fromClient:,Could not decode payload\"}", buf, 0x12u);
      if (qword_102419420 != -1) {
        dispatch_once(&qword_102419420, &stru_1022B4DC0);
      }
    }
    v9 = qword_102419428;
    if (os_signpost_enabled((os_log_t)qword_102419428))
    {
      *(_DWORD *)buf = 68289026;
      int v13 = 0;
      __int16 v14 = 2082;
      v15 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLVN,sendARSessionState:fromClient:,Could not decode payload", "{\"msg%{public}.0s\":\"CLVN,sendARSessionState:fromClient:,Could not decode payload\"}", buf, 0x12u);
    }
  }
}

- (void)sendVIOEstimation:(id)a3 fromClient:(id)a4
{
  [universe silo];
  uint64_t v15 = 0;
  id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", +[NSSet setWithObject:objc_opt_class()], a3, &v15);
  if (v15 || (id v8 = v7) == 0)
  {
    if (qword_102419420 != -1) {
      dispatch_once(&qword_102419420, &stru_1022B4DC0);
    }
    v10 = qword_102419428;
    if (os_log_type_enabled((os_log_t)qword_102419428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = "";
      __int16 v20 = 2114;
      uint64_t v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLVN,sendVIOEstimation:fromClient:,Could not decode payload\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_102419420 != -1) {
        dispatch_once(&qword_102419420, &stru_1022B4DC0);
      }
    }
    uint64_t v11 = qword_102419428;
    if (os_signpost_enabled((os_log_t)qword_102419428))
    {
      *(_DWORD *)buf = 68289282;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = "";
      __int16 v20 = 2114;
      uint64_t v21 = v15;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLVN,sendVIOEstimation:fromClient:,Could not decode payload", "{\"msg%{public}.0s\":\"CLVN,sendVIOEstimation:fromClient:,Could not decode payload\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  else
  {
    if (![(CLVisionNotifier *)self isARSessionActive])
    {
      if (qword_102419420 != -1) {
        dispatch_once(&qword_102419420, &stru_1022B4DC0);
      }
      v9 = qword_102419428;
      if (os_log_type_enabled((os_log_t)qword_102419428, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "CLVN,sendVIOEstimation:fromClient:,Payload was sent without start notification of current session", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419420 != -1) {
          dispatch_once(&qword_102419420, &stru_1022B4DC0);
        }
        __int16 v14 = 0;
        v12 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVisionNotifier sendVIOEstimation:fromClient:]", "%s\n", v12);
        if (v12 != (char *)buf) {
          free(v12);
        }
      }
      [(CLVisionNotifier *)self startSessionWithState:1 fromClient:a4];
    }
    [(CLVisionNotifier *)self setLastARKitUpdate:sub_10016C458()];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10049E2CC;
    v13[3] = &unk_1022B4D78;
    v13[4] = v8;
    v13[5] = a4;
    [(CLVisionNotifier *)self updateClientsWithHandler:v13];
  }
}

- (void)sendVLLocalizationResult:(id)a3 fromClient:(id)a4
{
  [universe silo];
  uint64_t v15 = 0;
  id v7 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", +[NSSet setWithObject:objc_opt_class()], a3, &v15);
  if (v15 || (id v8 = v7) == 0)
  {
    if (qword_102419420 != -1) {
      dispatch_once(&qword_102419420, &stru_1022B4DC0);
    }
    v10 = qword_102419428;
    if (os_log_type_enabled((os_log_t)qword_102419428, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289282;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = "";
      __int16 v20 = 2114;
      uint64_t v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"CLVN,sendVLLocalizationResult:fromClient:,Could not decode payload\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
      if (qword_102419420 != -1) {
        dispatch_once(&qword_102419420, &stru_1022B4DC0);
      }
    }
    uint64_t v11 = qword_102419428;
    if (os_signpost_enabled((os_log_t)qword_102419428))
    {
      *(_DWORD *)buf = 68289282;
      int v17 = 0;
      __int16 v18 = 2082;
      v19 = "";
      __int16 v20 = 2114;
      uint64_t v21 = v15;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CLVN,sendVLLocalizationResult:fromClient:,Could not decode payload", "{\"msg%{public}.0s\":\"CLVN,sendVLLocalizationResult:fromClient:,Could not decode payload\", \"error\":%{public, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  else
  {
    if (![(CLVisionNotifier *)self isARSessionActive])
    {
      if (qword_102419420 != -1) {
        dispatch_once(&qword_102419420, &stru_1022B4DC0);
      }
      v9 = qword_102419428;
      if (os_log_type_enabled((os_log_t)qword_102419428, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "CLVN,sendVLLocalizationResult:fromClient:,Payload was sent without start notification of current session", buf, 2u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419420 != -1) {
          dispatch_once(&qword_102419420, &stru_1022B4DC0);
        }
        __int16 v14 = 0;
        v12 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVisionNotifier sendVLLocalizationResult:fromClient:]", "%s\n", v12);
        if (v12 != (char *)buf) {
          free(v12);
        }
      }
      [(CLVisionNotifier *)self startSessionWithState:1 fromClient:a4];
    }
    [(CLVisionNotifier *)self setLastARKitUpdate:sub_10016C458()];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10049E680;
    v13[3] = &unk_1022B4D78;
    v13[4] = v8;
    v13[5] = a4;
    [(CLVisionNotifier *)self updateClientsWithHandler:v13];
  }
}

- (void)updateClientsWithHandler:(id)a3
{
  [self universe].silo
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
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(clients);
        }
        (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)clients countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)startSessionWithState:(unint64_t)a3 fromClient:(id)a4
{
  [universe silo];
  [(CLVisionNotifier *)self setArSessionActive:1];
  [(CLVisionNotifier *)self setLastARKitUpdate:sub_10016C458()];
  [(CLTimer *)[(CLVisionNotifier *)self sessionTimer] setNextFireDelay:5.0 interval:5.0];
  if (qword_102419420 != -1) {
    dispatch_once(&qword_102419420, &stru_1022B4DC0);
  }
  id v7 = qword_102419428;
  if (os_log_type_enabled((os_log_t)qword_102419428, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349314;
    unint64_t v15 = a3;
    __int16 v16 = 2082;
    id v17 = [a4 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLVN,startSessionWithState:%{public}lu fromClient:%{public}s", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419420 != -1) {
      dispatch_once(&qword_102419420, &stru_1022B4DC0);
    }
    int v10 = 134349314;
    unint64_t v11 = a3;
    __int16 v12 = 2082;
    id v13 = [a4 UTF8String];
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVisionNotifier startSessionWithState:fromClient:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10049EA0C;
  v9[3] = &unk_1022B4DA0;
  v9[4] = a4;
  v9[5] = a3;
  [(CLVisionNotifier *)self updateClientsWithHandler:v9];
}

- (void)closeSessionWithState:(unint64_t)a3 fromClient:(id)a4
{
  [universe silo];
  [(CLVisionNotifier *)self setArSessionActive:0];
  [(CLVisionNotifier *)self setLastARKitUpdate:-1.0];
  [(CLTimer *)[(CLVisionNotifier *)self sessionTimer] setNextFireDelay:1.79769313e308 interval:1.79769313e308];
  if (qword_102419420 != -1) {
    dispatch_once(&qword_102419420, &stru_1022B4DC0);
  }
  id v7 = qword_102419428;
  if (os_log_type_enabled((os_log_t)qword_102419428, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349314;
    unint64_t v15 = a3;
    __int16 v16 = 2082;
    id v17 = [a4 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CLVN,closeSessionWithState:%{public}lu fromClient:%{public}s", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419420 != -1) {
      dispatch_once(&qword_102419420, &stru_1022B4DC0);
    }
    int v10 = 134349314;
    unint64_t v11 = a3;
    __int16 v12 = 2082;
    id v13 = [a4 UTF8String];
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLVisionNotifier closeSessionWithState:fromClient:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10049EC8C;
  v9[3] = &unk_1022B4DA0;
  v9[4] = a4;
  v9[5] = a3;
  [(CLVisionNotifier *)self updateClientsWithHandler:v9];
}

- (BOOL)hasSessionTimedOut:(double)a3
{
  [(CLVisionNotifier *)self lastARKitUpdate];
  if (v5 < 0.0) {
    return 1;
  }
  [(CLVisionNotifier *)self lastARKitUpdate];
  return vabdd_f64(a3, v7) > 10.0;
}

- (BOOL)isARSessionActive
{
  return self->_arSessionActive;
}

- (void)setArSessionActive:(BOOL)a3
{
  self->_arSessionActive = a3;
}

- (double)lastARKitUpdate
{
  return self->_lastARKitUpdate;
}

- (void)setLastARKitUpdate:(double)a3
{
  self->_lastARKitUpdate = a3;
}

- (CLTimer)sessionTimer
{
  return self->_sessionTimer;
}

- (void)setSessionTimer:(id)a3
{
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

@end