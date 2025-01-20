@interface CLDaemonBeaconIdentityCondition
- (BOOL)isAuthorized;
- (BOOL)valid;
- (MonitoredRegion)getBeaconRegion;
- (id)initFromClientCondition:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 identifier:(id)a7 removePersistingFenceFromMonitoring:(BOOL)a8 callbackHandler:(id)a9;
- (unint64_t)diagnosticMaskIfNonFunctional;
- (void)dealloc;
- (void)onNotification:(int)a3 withData:(id)a4;
- (void)setValid:(BOOL)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation CLDaemonBeaconIdentityCondition

- (id)initFromClientCondition:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 identifier:(id)a7 removePersistingFenceFromMonitoring:(BOOL)a8 callbackHandler:(id)a9
{
  BOOL v9 = a8;
  id v16 = [a3 major];
  id v17 = [a3 minor];
  if (v17)
  {
    v29.receiver = self;
    v29.super_class = (Class)CLDaemonBeaconIdentityCondition;
    v18 = -[CLDaemonBeaconIdentityCondition initWithUUID:major:minor:](&v29, "initWithUUID:major:minor:", [a3 UUID], [v16 unsignedShortValue], [v17 unsignedShortValue]);
  }
  else
  {
    id v19 = [a3 UUID];
    if (v16)
    {
      v28.receiver = self;
      v28.super_class = (Class)CLDaemonBeaconIdentityCondition;
      v18 = -[CLDaemonBeaconIdentityCondition initWithUUID:major:](&v28, "initWithUUID:major:", v19, [v16 unsignedShortValue]);
    }
    else
    {
      v27.receiver = self;
      v27.super_class = (Class)CLDaemonBeaconIdentityCondition;
      v18 = [(CLDaemonBeaconIdentityCondition *)&v27 initWithUUID:v19];
    }
  }
  p_isa = (id *)&v18->super.super.super.isa;
  if (v18)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1023152E8);
    }
    v21 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [p_isa UUID];
      id v23 = [p_isa major];
      id v24 = [p_isa minor];
      *(_DWORD *)buf = 68290563;
      __int16 v32 = 2082;
      int v31 = 0;
      v33 = "";
      __int16 v34 = 2113;
      id v35 = v22;
      __int16 v36 = 2113;
      id v37 = v23;
      __int16 v38 = 2113;
      id v39 = v24;
      __int16 v40 = 2114;
      id v41 = a7;
      __int16 v42 = 1026;
      BOOL v43 = v9;
      __int16 v44 = 2050;
      v45 = p_isa;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#beaconIdentityCondition created\", \"UUID\":%{private, location:escape_only}@, \"major\":%{private, location:escape_only}@, \"minor\":%{private, location:escape_only}@, \"identifier\":%{public, location:escape_only}@, \"removePersistingFenceFromMonitoring\":%{public}hhd, \"self\":\"%{public}p\"}", buf, 0x4Au);
    }
    [p_isa setAuthorizationContext:a5];
    [p_isa setUniverse:a6];
    [p_isa setOnConditionUpdateCallbackHandler:a9];
    [p_isa setCkp:a4];
    id v25 = [[[a6 vendor] proxyForService:@"CLBTLEFenceManager"];
    p_isa[1] = v25;
    [v25 registerDelegate:p_isa inSilo:[objc_msgSend(objc_msgSend(p_isa, "universe"), "silo") silo]];
    [p_isa[1] setDelegateEntityName:-[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-DaemonBeaconIdentityCondition", objc_msgSend(p_isa, "identifier")), "UTF8String")];
    [p_isa setValid:1];
    [p_isa setIdentifier:a7];
    if (v9) {
      [p_isa stopMonitoring];
    }
    else {
      [p_isa startMonitoring];
    }
  }
  return p_isa;
}

- (void)dealloc
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1023152E8);
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
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#beaconIdentityCondition dealloc\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
  }
  [(CLDaemonBeaconIdentityCondition *)self stopMonitoring];

  self->_btleFenceManagerProxy = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLDaemonBeaconIdentityCondition;
  [(CLDaemonBeaconIdentityCondition *)&v4 dealloc];
}

- (MonitoredRegion)getBeaconRegion
{
  v2 = v1;
  sub_100134750(&v9, (char *)[v1 ckp].legacyClientKey.UTF8String);
  sub_100134750(v7, [objc_msgSend(objc_msgSend(v2, "identifier"), "UTF8String") UTF8String]);
  sub_100134750(__p, "");
  sub_10048B0C8((uint64_t)retstr, &v9, (long long *)v7, (long long *)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
  if (v10 < 0) {
    operator delete((void *)v9);
  }
  *(_DWORD *)&retstr->var1.__r_.var1 = 0;
  if ([v2 UUID])
  {
    *(_DWORD *)&retstr->var1.__r_.var1 |= 1u;
    std::string::assign((std::string *)&retstr->var1, (const std::string::value_type *)[([[objc_msgSend(objc_msgSend(v2, "UUID"), "UUIDString")] UTF8String])]);
  }
  if ([v2 major])
  {
    *(_DWORD *)&retstr->var1.__r_.var1 |= 2u;
    LOWORD(retstr->var1.__r_.var0) = (unsigned __int16)[[[v2 major] unsignedShortValue];
  }
  result = (MonitoredRegion *)[v2 minor];
  if (result)
  {
    *(_DWORD *)&retstr->var1.__r_.var1 |= 4u;
    result = (MonitoredRegion *)[v2 minor];
    HIWORD(retstr->var1.__r_.var0) = (_WORD)result;
  }
  LODWORD(retstr[2].var1.__r_.__value_.var0.var1.__size_) = 259;
  return result;
}

- (void)startMonitoring
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1023152E8);
  }
  v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289794;
    int v7 = 0;
    __int16 v8 = 2082;
    long long v9 = "";
    __int16 v10 = 2050;
    v11 = self;
    __int16 v12 = 1026;
    unsigned int v13 = [(CLDaemonBeaconIdentityCondition *)self isAuthorized];
    __int16 v14 = 1026;
    unsigned int v15 = [(CLDaemonBeaconIdentityCondition *)self isMonitoring];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #beaconIdentityCondition startMonitoring\", \"self\":\"%{public}p\", \"isAuthorized\":%{public}d, \"isMonitoring\":%{public}d}", buf, 0x28u);
  }
  if (([(CLDaemonBeaconIdentityCondition *)self isMonitoring] & 1) == 0)
  {
    if ([(CLDaemonBeaconIdentityCondition *)self isAuthorized])
    {
      [(CLDaemonBeaconIdentityCondition *)self setIsMonitoring:1];
      sub_100134750(&__p, (char *)[[-[CLDaemonBeaconIdentityCondition ckp](self, "ckp") legacyClientKey] UTF8String]);
      sub_10100CB80();
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1023152E8);
    }
    objc_super v4 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      int v7 = 0;
      __int16 v8 = 2082;
      long long v9 = "";
      __int16 v10 = 2050;
      v11 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #beaconIdentityCondition startMonitoring not authorized\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
    }
  }
}

- (void)stopMonitoring
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1023152E8);
  }
  v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289794;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)&buf[8] = 2082;
    *(void *)&buf[10] = "";
    *(_WORD *)&buf[18] = 2050;
    *(void *)&buf[20] = self;
    *(_WORD *)&buf[28] = 1026;
    *(_DWORD *)&buf[30] = [(CLDaemonBeaconIdentityCondition *)self isAuthorized];
    *(_WORD *)&buf[34] = 1026;
    *(_DWORD *)&buf[36] = [(CLDaemonBeaconIdentityCondition *)self isMonitoring];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#beaconIdentityCondition stopMonitoring\", \"self\":\"%{public}p\", \"isAuthorized\":%{public}d, \"isMonitoring\":%{public}d}", buf, 0x28u);
  }
  if ([(CLDaemonBeaconIdentityCondition *)self isMonitoring])
  {
    if (self)
    {
      [(CLDaemonBeaconIdentityCondition *)self getBeaconRegion];
    }
    else
    {
      uint64_t v11 = 0;
      long long v9 = 0u;
      long long v10 = 0u;
      long long v7 = 0u;
      long long v8 = 0u;
      memset(buf, 0, sizeof(buf));
    }
    btleFenceManagerProxy = self->_btleFenceManagerProxy;
    sub_10048B9C8((uint64_t)v5, (uint64_t)buf);
    [(CLBTLEFenceManagerProtocol *)btleFenceManagerProxy removeMonitoredRegion:sub_101179EA0((uint64_t)v5)];
    sub_100111F40((uint64_t)v5);
    [(CLBTLEFenceManagerProtocol *)self->_btleFenceManagerProxy unregister:self forNotification:2];
    [(CLBTLEFenceManagerProtocol *)self->_btleFenceManagerProxy unregister:self forNotification:3];
    [(CLDaemonBeaconIdentityCondition *)self setIsMonitoring:0];
    [(CLDaemonBeaconIdentityCondition *)self setLastMonitoringState:0];
    [(CLDaemonBeaconIdentityCondition *)self setRefinement:0];
    sub_100111F40((uint64_t)buf);
  }
}

- (BOOL)isAuthorized
{
  id v2 = [(CLDaemonBeaconIdentityCondition *)self authorizationContext];

  return [v2 isAuthorizedForServiceTypeMask:524289];
}

- (unint64_t)diagnosticMaskIfNonFunctional
{
  if ([(CLDaemonBeaconIdentityCondition *)self isMonitoring]) {
    return 0;
  }
  if ((int)[self authorizationContext].inUseLevel <= 0)unint64_t v3 = 16* ([self authorizationContext].transientAwareRegistrationResult != 0); {
  else
  }
    unint64_t v3 = 0;
  if (![[-[CLDaemonBeaconIdentityCondition authorizationContext](self, "authorizationContext") isAuthorizedForServiceType:12];
  unint64_t v4 = v3 | 0x1000;
  }
  if ([self.authorizationContext isAuthorizedForServiceTypeMask:1])v3 |= 0x1000uLL; {
  if ((objc_msgSend(-[CLDaemonBeaconIdentityCondition authorizationContext](self, "authorizationContext"), "isAuthorizedForServiceTypeMask:", 0x100000) & 1) == 0&& objc_msgSend(-[CLDaemonBeaconIdentityCondition authorizationContext](self, "authorizationContext"), "transientAwareRegistrationResult") == 4)
  }
  {
    return v4;
  }
  return v3;
}

- (void)onNotification:(int)a3 withData:(id)a4
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1023152E8);
  }
  long long v7 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289538;
    int v40 = 0;
    __int16 v41 = 2082;
    __int16 v42 = "";
    __int16 v43 = 2050;
    uint64_t v44 = a3;
    __int16 v45 = 2050;
    v46 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#beaconIdentityCondition received notification\", \"notification\":%{public, location:CLBTLEFenceManager_Type::Notification}lld, \"self\":\"%{public}p\"}", buf, 0x26u);
  }
  long long v8 = (char *)sub_10078AB1C(a4);
  int v9 = *((_DWORD *)v8 + 42);
  int v10 = *((_DWORD *)v8 + 30);
  sub_10048B9C8((uint64_t)buf, (uint64_t)v8);
  if ([(CLDaemonBeaconIdentityCondition *)self isMonitoring]
    && [(CLDaemonBeaconIdentityCondition *)self onConditionUpdateCallbackHandler])
  {
    id v11 = [(CLDaemonBeaconIdentityCondition *)self identifier];
    __int16 v12 = v48 >= 0 ? &v47 : v47;
    if (objc_msgSend(v11, "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v12)))
    {
      if (v10)
      {
        int v13 = 0;
        uint64_t v14 = 3;
      }
      else if (v9 == 4)
      {
        int v13 = 0;
        uint64_t v14 = 2;
      }
      else
      {
        if (v9 != 2)
        {
          if (qword_102419530 != -1) {
            goto LABEL_58;
          }
          while (1)
          {
            id v23 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
            {
              int v24 = *((_DWORD *)v8 + 42);
              *(_DWORD *)objc_super v29 = 68290051;
              int v30 = 0;
              __int16 v31 = 2082;
              __int16 v32 = "";
              __int16 v33 = 1026;
              *(_DWORD *)__int16 v34 = a3;
              *(_WORD *)&v34[4] = 1026;
              *(_DWORD *)&v34[6] = v24;
              __int16 v35 = 2082;
              __int16 v36 = "assert";
              __int16 v37 = 2081;
              __int16 v38 = "region";
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#beaconIdentityCondition Region is nil\", \"notification\":%{public}d, \"state\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v29, 0x32u);
              if (qword_102419530 != -1) {
                dispatch_once(&qword_102419530, &stru_1023152E8);
              }
            }
            id v25 = qword_102419538;
            if (os_signpost_enabled((os_log_t)qword_102419538))
            {
              int v26 = *((_DWORD *)v8 + 42);
              *(_DWORD *)objc_super v29 = 68290051;
              int v30 = 0;
              __int16 v31 = 2082;
              __int16 v32 = "";
              __int16 v33 = 1026;
              *(_DWORD *)__int16 v34 = a3;
              *(_WORD *)&v34[4] = 1026;
              *(_DWORD *)&v34[6] = v26;
              __int16 v35 = 2082;
              __int16 v36 = "assert";
              __int16 v37 = 2081;
              __int16 v38 = "region";
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#beaconIdentityCondition Region is nil", "{\"msg%{public}.0s\":\"#beaconIdentityCondition Region is nil\", \"notification\":%{public}d, \"state\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v29, 0x32u);
              if (qword_102419530 != -1) {
                dispatch_once(&qword_102419530, &stru_1023152E8);
              }
            }
            objc_super v27 = qword_102419538;
            if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_INFO))
            {
              int v28 = *((_DWORD *)v8 + 42);
              *(_DWORD *)objc_super v29 = 68290051;
              int v30 = 0;
              __int16 v31 = 2082;
              __int16 v32 = "";
              __int16 v33 = 1026;
              *(_DWORD *)__int16 v34 = a3;
              *(_WORD *)&v34[4] = 1026;
              *(_DWORD *)&v34[6] = v28;
              __int16 v35 = 2082;
              __int16 v36 = "assert";
              __int16 v37 = 2081;
              __int16 v38 = "region";
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#beaconIdentityCondition Region is nil\", \"notification\":%{public}d, \"state\":%{public}d, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v29, 0x32u);
            }
            abort_report_np();
            __break(1u);
LABEL_58:
            dispatch_once(&qword_102419530, &stru_1023152E8);
          }
        }
        v8 += 128;
        int v13 = 1;
        uint64_t v14 = 1;
      }
      id v15 = objc_alloc((Class)NSUUID);
      id v16 = v8 + 8;
      if (v8[31] < 0) {
        id v16 = (void *)*v16;
      }
      id v17 = [v15 initWithUUIDString:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v16)];
      if ((v8[36] & 1) == 0
        || !objc_msgSend(-[CLDaemonBeaconIdentityCondition UUID](self, "UUID"), "isEqual:", v17))
      {
        goto LABEL_35;
      }
      if ((v8[36] & 2) != 0)
      {
        if ([(CLDaemonBeaconIdentityCondition *)self major]
          && objc_msgSend(-[CLDaemonBeaconIdentityCondition major](self, "major"), "unsignedShortValue") != *((unsigned __int16 *)v8 + 16))
        {
          goto LABEL_35;
        }
        uint64_t v18 = 2;
      }
      else
      {
        uint64_t v18 = 1;
      }
      if ((v8[36] & 4) == 0) {
        goto LABEL_30;
      }
      if (![(CLDaemonBeaconIdentityCondition *)self minor]
        || objc_msgSend(-[CLDaemonBeaconIdentityCondition minor](self, "minor"), "unsignedShortValue") == *((unsigned __int16 *)v8 + 17))
      {
        ++v18;
LABEL_30:
        if (!v13)
        {
          v20 = 0;
LABEL_47:
          [(CLDaemonBeaconIdentityCondition *)self setLastMonitoringState:v14];
          [(CLDaemonBeaconIdentityCondition *)self setRefinement:v20];
          id v22 = (void (**)(id, id, CLDaemonBeaconIdentityCondition *, uint64_t, void *))[(CLDaemonBeaconIdentityCondition *)self onConditionUpdateCallbackHandler];
          v22[2](v22, [(CLDaemonBeaconIdentityCondition *)self monitoredIdentifier], self, v14, v20);
          goto LABEL_36;
        }
        switch(v18)
        {
          case 3:
            id v19 = [objc_alloc((Class)CLBeaconIdentityCondition) initWithUUID:v17 major:*((unsigned __int16 *)v8 + 16) minor:*((unsigned __int16 *)v8 + 17)];
            break;
          case 2:
            id v19 = [objc_alloc((Class)CLBeaconIdentityCondition) initWithUUID:v17 major:*((unsigned __int16 *)v8 + 16)];
            break;
          case 1:
            id v19 = [objc_alloc((Class)CLBeaconIdentityCondition) initWithUUID:v17];
            break;
          default:
            v20 = 0;
            goto LABEL_43;
        }
        v20 = v19;
LABEL_43:
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_1023152E8);
        }
        v21 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)objc_super v29 = 68289283;
          int v30 = 0;
          __int16 v31 = 2082;
          __int16 v32 = "";
          __int16 v33 = 2113;
          *(void *)__int16 v34 = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#beaconIdentityCondition received event\", \"condition\":%{private, location:escape_only}@}", v29, 0x1Cu);
        }
        goto LABEL_47;
      }
LABEL_35:
      v20 = 0;
LABEL_36:
    }
  }
  sub_100111F40((uint64_t)buf);
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