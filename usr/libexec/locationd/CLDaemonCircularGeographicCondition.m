@interface CLDaemonCircularGeographicCondition
- (BOOL)isAuthorized;
- (BOOL)valid;
- (id)initFromClientCondition:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 identifier:(id)a7 removePersistingFenceFromMonitoring:(BOOL)a8 callbackHandler:(id)a9;
- (unint64_t)diagnosticMaskIfNonFunctional;
- (void)dealloc;
- (void)onNotification:(int)a3 withData:(id)a4;
- (void)setValid:(BOOL)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation CLDaemonCircularGeographicCondition

- (id)initFromClientCondition:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 identifier:(id)a7 removePersistingFenceFromMonitoring:(BOOL)a8 callbackHandler:(id)a9
{
  BOOL v9 = a8;
  [a3 center];
  double v17 = v16;
  double v19 = v18;
  [a3 radius];
  v30.receiver = self;
  v30.super_class = (Class)CLDaemonCircularGeographicCondition;
  v21 = -[CLDaemonCircularGeographicCondition initWithCenter:radius:](&v30, "initWithCenter:radius:", v17, v19, v20);
  if (v21)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230B1C8);
    }
    v22 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      [(CLDaemonCircularGeographicCondition *)v21 center];
      uint64_t v24 = v23;
      [(CLDaemonCircularGeographicCondition *)v21 center];
      uint64_t v26 = v25;
      [(CLDaemonCircularGeographicCondition *)v21 radius];
      *(_DWORD *)buf = 68290563;
      int v32 = 0;
      __int16 v33 = 2082;
      v34 = "";
      __int16 v35 = 2049;
      uint64_t v36 = v24;
      __int16 v37 = 2049;
      uint64_t v38 = v26;
      __int16 v39 = 2050;
      uint64_t v40 = v27;
      __int16 v41 = 2114;
      id v42 = a7;
      __int16 v43 = 1026;
      BOOL v44 = v9;
      __int16 v45 = 2050;
      v46 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#circularGeographicCondition created\", \"lat\":\"%{private}.08f\", \"lon\":\"%{private}.08f\", \"radius\":\"%{public}f\", \"identifier\":%{public, location:escape_only}@, \"removePersistingFenceFromMonitoring\":%{public}hhd, \"self\":\"%{public}p\"}", buf, 0x4Au);
    }
    [(CLDaemonCircularGeographicCondition *)v21 setAuthorizationContext:a5];
    [(CLDaemonCircularGeographicCondition *)v21 setOnConditionUpdateCallbackHandler:a9];
    [(CLDaemonCircularGeographicCondition *)v21 setUniverse:a6];
    [(CLDaemonCircularGeographicCondition *)v21 setCkp:a4];
    [(CLDaemonCircularGeographicCondition *)v21 setLastMonitoringState:0];
    v28 = (CLFenceManagerProtocol *)[objc_msgSend(objc_msgSend(a6, "vendor"), "proxyForService:", @"CLFenceManager")];
    v21->_fenceManagerProxy = v28;
    -[CLFenceManagerProtocol registerDelegate:inSilo:](v28, "registerDelegate:inSilo:", v21, [CLDaemonCircularGeographicCondition universe](v21, "universe").silo);
    [(CLFenceManagerProtocol *)v21->_fenceManagerProxy setDelegateEntityName:[+[NSString stringWithFormat:@"%@-DaemonCircularGeographicCondition", a7] UTF8String]];
    [(CLDaemonCircularGeographicCondition *)v21 setValid:1];
    [(CLDaemonCircularGeographicCondition *)v21 setIdentifier:a7];
    if (v9) {
      [(CLDaemonCircularGeographicCondition *)v21 stopMonitoring];
    }
    else {
      [(CLDaemonCircularGeographicCondition *)v21 startMonitoring];
    }
  }
  return v21;
}

- (void)dealloc
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_10230B1C8);
  }
  v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v6 = 0;
    __int16 v7 = 2082;
    v8 = "";
    __int16 v9 = 2050;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#circularGeographicCondition dealloc\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
  }
  [(CLDaemonCircularGeographicCondition *)self stopMonitoring];

  self->_fenceManagerProxy = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLDaemonCircularGeographicCondition;
  [(CLDaemonCircularGeographicCondition *)&v4 dealloc];
}

- (BOOL)isAuthorized
{
  id v2 = [(CLDaemonCircularGeographicCondition *)self authorizationContext];

  return [v2 isAuthorizedForServiceTypeMask:524290];
}

- (void)startMonitoring
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_10230B1C8);
  }
  v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290050;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v8 = 2082;
    __int16 v9 = "";
    __int16 v10 = 2050;
    v11 = self;
    __int16 v12 = 2114;
    id v13 = [(CLDaemonCircularGeographicCondition *)self identifier];
    __int16 v14 = 1026;
    unsigned int v15 = [(CLDaemonCircularGeographicCondition *)self isAuthorized];
    __int16 v16 = 1026;
    unsigned int v17 = [(CLDaemonCircularGeographicCondition *)self isMonitoring];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #circularGeographicCondition startMonitoring\", \"self\":\"%{public}p\", \"name\":%{public, location:escape_only}@, \"isAuthorized\":%{public}d, \"isMonitoring\":%{public}d}", buf, 0x32u);
  }
  if (([(CLDaemonCircularGeographicCondition *)self isMonitoring] & 1) == 0)
  {
    if ([(CLDaemonCircularGeographicCondition *)self isAuthorized])
    {
      [(CLDaemonCircularGeographicCondition *)self setIsMonitoring:1];
      sub_100134750(&v6, (char *)[[-[CLDaemonCircularGeographicCondition ckp](self, "ckp") legacyClientKey] UTF8String]);
      sub_10100CB80();
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230B1C8);
    }
    objc_super v4 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(CLDaemonCircularGeographicCondition *)self identifier];
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&uint8_t buf[4] = 0;
      __int16 v8 = 2082;
      __int16 v9 = "";
      __int16 v10 = 2050;
      v11 = self;
      __int16 v12 = 2114;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #circularGeographicCondition startMonitoring not authorized\", \"self\":\"%{public}p\", \"name\":%{public, location:escape_only}@}", buf, 0x26u);
    }
  }
}

- (void)stopMonitoring
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_10230B1C8);
  }
  v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290050;
    *(_DWORD *)&uint8_t buf[4] = 0;
    __int16 v23 = 2082;
    uint64_t v24 = "";
    __int16 v25 = 2050;
    *(void *)uint64_t v26 = self;
    *(_WORD *)&v26[8] = 2114;
    *(void *)&v26[10] = [(CLDaemonCircularGeographicCondition *)self identifier];
    __int16 v27 = 1026;
    unsigned int v28 = [(CLDaemonCircularGeographicCondition *)self isAuthorized];
    __int16 v29 = 1026;
    *(_DWORD *)objc_super v30 = [(CLDaemonCircularGeographicCondition *)self isMonitoring];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #circularGeographicCondition stopMonitoring\", \"self\":\"%{public}p\", \"name\":%{public, location:escape_only}@, \"isAuthorized\":%{public}d, \"isMonitoring\":%{public}d}", buf, 0x32u);
  }
  if ([(CLDaemonCircularGeographicCondition *)self isMonitoring])
  {
    sub_100134750(v20, (char *)[objc_msgSend(-[CLDaemonCircularGeographicCondition ckp](self, "ckp"), "legacyClientKey") UTF8String]);
    sub_100134750(v18, (char *)[[-[CLDaemonCircularGeographicCondition identifier](self, "identifier") UTF8String];
    sub_100134750(__p, "");
    sub_100110A5C((char *)buf, (uint64_t)v20, (uint64_t)v18, (uint64_t)__p);
    if (v17 < 0) {
      operator delete(__p[0]);
    }
    if (v19 < 0) {
      operator delete(v18[0]);
    }
    if (v21 < 0) {
      operator delete(v20[0]);
    }
    fenceManagerProxy = self->_fenceManagerProxy;
    sub_10048AEC0((char *)v5, (long long *)buf);
    [(CLFenceManagerProtocol *)fenceManagerProxy removeFence:sub_100488290((long long *)v5)];
    if (v14)
    {
      unsigned int v15 = v14;
      operator delete(v14);
    }

    if (v12 < 0) {
      operator delete(v11);
    }
    if (v10 < 0) {
      operator delete(v9);
    }
    if (v8 < 0) {
      operator delete(v7);
    }
    if (v6 < 0) {
      operator delete(v5[0]);
    }
    [(CLFenceManagerProtocol *)self->_fenceManagerProxy unregister:self forNotification:8];
    [(CLFenceManagerProtocol *)self->_fenceManagerProxy unregister:self forNotification:1];
    [(CLFenceManagerProtocol *)self->_fenceManagerProxy unregister:self forNotification:0];
    [(CLFenceManagerProtocol *)self->_fenceManagerProxy unregister:self forNotification:4];
    [(CLFenceManagerProtocol *)self->_fenceManagerProxy unregister:self forNotification:7];
    [(CLDaemonCircularGeographicCondition *)self setIsMonitoring:0];
    [(CLDaemonCircularGeographicCondition *)self setLastMonitoringState:0];
    [(CLDaemonCircularGeographicCondition *)self setRefinement:0];
    if (v35)
    {
      uint64_t v36 = v35;
      operator delete(v35);
    }

    if (v33 < 0) {
      operator delete(v32);
    }
    if (v31 < 0) {
      operator delete(*(void **)&v30[2]);
    }
    if ((v30[1] & 0x80000000) != 0) {
      operator delete(*(void **)&v26[4]);
    }
    if ((v26[3] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
  }
}

- (unint64_t)diagnosticMaskIfNonFunctional
{
  if ([(CLDaemonCircularGeographicCondition *)self isMonitoring]) {
    return 0;
  }
  if ((int)[self authorizationContext].inUseLevel <= 0)unint64_t v3 = 16* ([self authorizationContext].transientAwareRegistrationResult != 0); {
  else
  }
    unint64_t v3 = 0;
  if (![[-[CLDaemonCircularGeographicCondition authorizationContext](self, "authorizationContext") isAuthorizedForServiceType:12];
  unint64_t v4 = v3 | 0x1000;
  }
  if ([self.authorizationContext isAuthorizedForServiceTypeMask:2])v3 |= 0x1000uLL; {
  if ((objc_msgSend(-[CLDaemonCircularGeographicCondition authorizationContext](self, "authorizationContext"), "isAuthorizedForServiceTypeMask:", 0x100000) & 1) == 0&& objc_msgSend(-[CLDaemonCircularGeographicCondition authorizationContext](self, "authorizationContext"), "transientAwareRegistrationResult") == 4)
  }
  {
    return v4;
  }
  return v3;
}

- (void)onNotification:(int)a3 withData:(id)a4
{
  char v6 = (char *)sub_10091FF08(a4);
  int v7 = *((_DWORD *)v6 + 163);
  id v8 = [(CLDaemonCircularGeographicCondition *)self identifier];
  __int16 v9 = v6 + 24;
  if (v6[47] < 0) {
    __int16 v9 = (void *)*v9;
  }
  if (objc_msgSend(v8, "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9)))
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10230B1C8);
    }
    char v10 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      sub_100C8C864((uint64_t)v6);
      v11 = v19 >= 0 ? &__p : (void **)__p;
      *(_DWORD *)buf = 68290051;
      int v21 = 0;
      __int16 v22 = 2082;
      __int16 v23 = "";
      __int16 v24 = 2050;
      __int16 v25 = (CLDaemonCircularGeographicCondition *)a3;
      __int16 v26 = 2081;
      uint64_t v27 = (uint64_t)v11;
      __int16 v28 = 2050;
      __int16 v29 = self;
      __int16 v30 = 2049;
      uint64_t v31 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#circularGeographicCondition received notification\", \"notification\":%{public, location:CLFenceManager_Type::Notification}lld, \"fence\":%{private, location:escape_only}s, \"self\":\"%{public}p\", \"status\":%{private, location:CLFenceManager_Type::FenceStatus}lld}", buf, 0x3Au);
      if (v19 < 0) {
        operator delete(__p);
      }
    }
    CLLocationCoordinate2D v12 = CLLocationCoordinate2DMake(*((CLLocationDegrees *)v6 + 9), *((CLLocationDegrees *)v6 + 10));
    id v13 = [objc_alloc((Class)CLCircularGeographicCondition) initWithCenter:v12.latitude, v12.longitude, *((double *)v6 + 11)];
    uint64_t v14 = 2;
    if (a3 != 1 && v7 != 1)
    {
      uint64_t v14 = 1;
      if (a3)
      {
        if (v7)
        {
          if (a3 == 4 || a3 == 7) {
            uint64_t v14 = 3;
          }
          else {
            uint64_t v14 = 0;
          }
        }
      }
    }
    if ([(CLDaemonCircularGeographicCondition *)self isEqual:v13]
      && [(CLDaemonCircularGeographicCondition *)self isMonitoring])
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10230B1C8);
      }
      __int16 v16 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289795;
        int v21 = 0;
        __int16 v22 = 2082;
        __int16 v23 = "";
        __int16 v24 = 2113;
        __int16 v25 = self;
        __int16 v26 = 2050;
        uint64_t v27 = v14;
        __int16 v28 = 2050;
        __int16 v29 = self;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#circularGeographicCondition received state update\", \"condition\":%{private, location:escape_only}@, \"monitoringState\":%{public, location:CLMonitoringState}lld, \"self\":\"%{public}p\"}", buf, 0x30u);
      }
      [(CLDaemonCircularGeographicCondition *)self setLastMonitoringState:v14];
      if ([(CLDaemonCircularGeographicCondition *)self onConditionUpdateCallbackHandler])
      {
        char v17 = (void (**)(id, id, CLDaemonCircularGeographicCondition *, uint64_t, void))[(CLDaemonCircularGeographicCondition *)self onConditionUpdateCallbackHandler];
        v17[2](v17, [(CLDaemonCircularGeographicCondition *)self monitoredIdentifier], self, v14, 0);
      }
    }
  }
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

@end