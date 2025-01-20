@interface PRDiagnosticsService
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (BOOL)validateClientEntitlements:(id)a3;
- (NSArray)machServicesNames;
- (PRDiagnosticsService)init;
- (void)getChipInfoSync:(BOOL)a3 reply:(id)a4;
- (void)getChipPublicKey:(id)a3;
- (void)getChipType:(id)a3;
- (void)getDeepSleepState:(id)a3;
- (void)getPowerStatsWithTimeout:(unint64_t)a3 reply:(id)a4;
- (void)getPreflightInfo:(id)a3;
- (void)getRoseChipPowerState:(id)a3;
- (void)handleXPCDisconnection;
- (void)hasFailedRoseUpdate:(id)a3;
- (void)injectIsoCode:(id)a3;
- (void)prepareForRegulatoryAssistance:(id)a3;
- (void)publishBytes:(char *)a3 amount:(unint64_t)a4;
- (void)requestPowerChange:(BOOL)a3 reply:(id)a4;
- (void)sendHelloWithTimeout:(unint64_t)a3 reply:(id)a4;
- (void)setNarrowbandSarState:(int64_t)a3 reply:(id)a4;
- (void)setRegulatoryAccessoryState:(id)a3 reply:(id)a4;
- (void)setRegulatoryIsoCountry:(id)a3 reply:(id)a4;
- (void)setRegulatoryMcc:(id)a3 reply:(id)a4;
- (void)setRoseGlobalConfigParams:(id)a3 reply:(id)a4;
- (void)startStreamingProtobufDataForClientId:(id)a3 reply:(id)a4;
- (void)stopStreamingProtobufDataForClientId:(id)a3 reply:(id)a4;
- (void)triggerLogCollection:(int64_t)a3 reply:(id)a4;
@end

@implementation PRDiagnosticsService

- (PRDiagnosticsService)init
{
  v8.receiver = self;
  v8.super_class = (Class)PRDiagnosticsService;
  v2 = [(PRDiagnosticsService *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_protobufLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = objc_opt_new();
    protobufClients = v3->_protobufClients;
    v3->_protobufClients = (NSMutableDictionary *)v4;

    v6 = (std::recursive_mutex *)sub_1002F6464();
    sub_1002F65A8(v6, v3);
  }
  return v3;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_10040B634(v5);
  }
  int v6 = [v4 processIdentifier];
  BOOL v7 = [(PRDiagnosticsService *)self validateClientEntitlements:v4];
  objc_super v8 = qword_1008ABDE0;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
      sub_10040B544(v6, v8);
    }
    v9 = [v4 valueForEntitlement:@"com.apple.private.nearbyd.protobuf-client"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      unsigned int v10 = [v9 BOOLValue];

      if (v10)
      {
        v11 = sub_100195C64();
        [v4 setRemoteObjectInterface:v11];

        v12 = sub_100195BCC();
        [v4 setExportedInterface:v12];
        goto LABEL_19;
      }
    }
    else
    {
    }
    if (sub_1000090F0(v4))
    {
      v13 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#reg-assist, setExportedInterface,calling", (uint8_t *)buf, 2u);
      }
      v14 = sub_100195D00();
      [v4 setExportedInterface:v14];

      v15 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#reg-assist, setExportedInterface,called", (uint8_t *)buf, 2u);
      }
      goto LABEL_20;
    }
    [v4 setRemoteObjectInterface:0];
    v12 = sub_100195A24();
    [v4 setExportedInterface:v12];
LABEL_19:

LABEL_20:
    [v4 setExportedObject:self];
    objc_initWeak(buf, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000916C;
    v23[3] = &unk_100845ED8;
    int v25 = v6;
    objc_copyWeak(&v24, buf);
    [v4 setInterruptionHandler:v23];
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_100009248;
    v20 = &unk_100845ED8;
    int v22 = v6;
    objc_copyWeak(&v21, buf);
    [v4 setInvalidationHandler:&v17];
    [v4 resume:v17, v18, v19, v20];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v24);
    objc_destroyWeak(buf);
    goto LABEL_21;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10040B5BC(v6, v8);
  }
LABEL_21:

  return v7;
}

- (NSArray)machServicesNames
{
  return (NSArray *)&off_100878460;
}

- (void)getChipInfoSync:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100009440;
  v14[3] = &unk_100845F00;
  id v5 = a4;
  id v15 = v5;
  int v6 = objc_retainBlock(v14);
  BOOL v7 = sub_1002F6464();
  if (v4)
  {
    uint64_t v8 = sub_1002F9174((uint64_t)v7, (uint64_t)&v12);
    uint64_t v10 = v13;
    long long v9 = v12;
    char v11 = 1;
    ((void (*)(void *, uint64_t, long long *))v6[2])(v6, v8, &v9);
  }
  else
  {
    sub_1002F917C((uint64_t)v7, v6);
  }
}

- (void)getPreflightInfo:(id)a3
{
  id v5 = (void (**)(void))a3;
  v3 = sub_1002F6464();
  BOOL v4 = (void *)sub_1002F9164((uint64_t)v3);
  v5[2]();
  if (v4) {
}
  }

- (void)hasFailedRoseUpdate:(id)a3
{
  id v5 = (void (**)(id, uint64_t))a3;
  v3 = sub_1002F6464();
  uint64_t v4 = sub_1002F916C((uint64_t)v3);
  v5[2](v5, v4);
}

- (void)sendHelloWithTimeout:(unint64_t)a3 reply:(id)a4
{
  id v5 = (void (**)(id, id))a4;
  int v6 = sub_1002F6464();
  sub_1002F6670((uint64_t)v6, a3, v9);
  if (v10)
  {
    id v7 = objc_alloc((Class)PRHelloResponse);
    if (!v10) {
      sub_10000AE44();
    }
    id v8 = [v7 initWithHelloResponse:v9];
    v5[2](v5, v8);
  }
  else
  {
    v5[2](v5, 0);
  }
  sub_10000AE90((uint64_t)v9);
}

- (void)getPowerStatsWithTimeout:(unint64_t)a3 reply:(id)a4
{
  id v5 = (void (**)(id, id))a4;
  int v6 = sub_1002F6464();
  sub_1002F92BC((uint64_t)v6, a3, (uint64_t)v9);
  if (v10)
  {
    id v7 = objc_alloc((Class)PRGetPowerStatsResponse);
    if (!v10) {
      sub_10000AE44();
    }
    id v8 = [v7 initWithGetPowerStatsResponse:v9];
    v5[2](v5, v8);
  }
  else
  {
    v5[2](v5, 0);
  }
}

- (void)setRegulatoryMcc:(id)a3 reply:(id)a4
{
  id v8 = a3;
  id v5 = (void (**)(id, BOOL))a4;
  id v6 = v8;
  if (v8)
  {
    id v7 = +[PRGlobalDebugSettings sharedSettings];
    [v7 setObject:v8 forKey:PRDebugConfigArgMcc];

    id v6 = v8;
  }
  v5[2](v5, v6 != 0);
}

- (void)setRegulatoryIsoCountry:(id)a3 reply:(id)a4
{
  id v8 = a3;
  id v5 = (void (**)(id, BOOL))a4;
  id v6 = v8;
  if (v8)
  {
    id v7 = +[PRGlobalDebugSettings sharedSettings];
    [v7 setObject:v8 forKey:PRDebugConfigArgIsoCountry];

    id v6 = v8;
  }
  v5[2](v5, v6 != 0);
}

- (void)setRegulatoryAccessoryState:(id)a3 reply:(id)a4
{
  id v8 = a3;
  id v5 = (void (**)(id, BOOL))a4;
  id v6 = v8;
  if (v8)
  {
    id v7 = +[PRGlobalDebugSettings sharedSettings];
    [v7 setObject:v8 forKey:PRDebugConfigArgAccessoryState];

    id v6 = v8;
  }
  v5[2](v5, v6 != 0);
}

- (void)triggerLogCollection:(int64_t)a3 reply:(id)a4
{
  id v5 = (void (**)(id, uint64_t))a4;
  memset(&v25, 0, sizeof(v25));
  id v6 = sub_100007D00();
  sub_10000B140(v23, (uint64_t)v6);
  if (v24)
  {
    id v7 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (!v24) {
        sub_10000AE44();
      }
      sub_1003C9E70((uint64_t)v23);
      if (v27 >= 0) {
        id v8 = v26;
      }
      else {
        id v8 = *(uint8_t **)v26;
      }
      *(_DWORD *)buf = 136315138;
      v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cached Hello Response: %s", buf, 0xCu);
      if (v27 < 0) {
        operator delete(*(void **)v26);
      }
    }
  }
  long long v9 = +[NSUserDefaults standardUserDefaults];
  char v10 = [v9 dictionaryRepresentation];

  char v11 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v12 = [v10 count];
    *(_DWORD *)v26 = 67109120;
    *(_DWORD *)&v26[4] = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "===== Current defaults (%d) =====", v26, 8u);
  }

  [v10 enumerateKeysAndObjectsUsingBlock:&stru_100845F40];
  uint64_t v13 = +[NIServerFindableDeviceProxySessionManager sharedInstance];
  v14 = [v13 printableState];

  id v15 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "===== Findable Device =====", v26, 2u);
  }
  [v14 enumerateObjectsUsingBlock:&stru_100845F80];
  uint64_t v16 = +[NIServerFindingSession sharedServicePrintableState];

  v17 = (void *)v16;
  uint64_t v18 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "===== Finding Service =====", v26, 2u);
  }
  [v17 enumerateObjectsUsingBlock:&stru_100845FA0];
  v19 = "sysdiagnose-triggered";
  switch(a3)
  {
    case 0:
      goto LABEL_19;
    case 1:
      std::string::assign(&v25, "user-triggered-non-fatal");
      uint64_t v20 = 1;
      goto LABEL_23;
    case 2:
      std::string::assign(&v25, "user-triggered-fatal");
      goto LABEL_21;
    case 3:
      std::string::assign(&v25, "user-triggered-dump-all-existing-logs-if-crashlog");
      uint64_t v20 = 2;
      goto LABEL_23;
    case 4:
      v19 = "user-triggered-dump-all-existing-logs";
LABEL_19:
      std::string::assign(&v25, v19);
      uint64_t v20 = 3;
      goto LABEL_23;
    default:
LABEL_21:
      uint64_t v20 = 0;
LABEL_23:
      id v21 = sub_1002F6464();
      uint64_t v22 = sub_1002F9184((uint64_t)v21, v20, (std::string::size_type)&v25);
      v5[2](v5, v22);

      sub_10000AE90((uint64_t)v23);
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v25.__r_.__value_.__l.__data_);
      }

      return;
  }
}

- (void)setRoseGlobalConfigParams:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void (**)(void, void))v6;
  if (v5)
  {
    id v17 = 0;
    uint64_t v8 = sub_100012DE0(v5, &v17);
    id v9 = v17;
    if ((v8 & 1) == 0)
    {
      char v10 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040B678((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    v7[2](v7, v8);
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)getRoseChipPowerState:(id)a3
{
  v3 = (void (**)(id, uint64_t, uint64_t))a3;
  __int16 v9 = 0;
  uint64_t v4 = sub_1002F6464();
  if (sub_1002F92C4((uint64_t)v4, (BOOL *)&v9 + 1))
  {
    if (!HIBYTE(v9))
    {
      uint64_t v7 = 0;
LABEL_12:
      uint64_t v8 = 1;
      goto LABEL_13;
    }
    id v5 = sub_1002F6464();
    if (sub_1002F92D4((uint64_t)v5, &v9))
    {
      if (HIBYTE(v9)) {
        BOOL v6 = v9 == 0;
      }
      else {
        BOOL v6 = 0;
      }
      uint64_t v7 = v6;
      goto LABEL_12;
    }
  }
  uint64_t v8 = 0;
  uint64_t v7 = 0;
LABEL_13:
  v3[2](v3, v8, v7);
}

- (void)requestPowerChange:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  id v5 = sub_1002F6464();
  uint64_t v6 = sub_1002F92CC((uint64_t)v5, v4);
  v7[2](v7, v6);
}

- (void)getChipType:(id)a3
{
  id v5 = (void (**)(id, uint64_t))a3;
  int v3 = sub_1003D13CC();
  if (v3) {
    uint64_t v4 = 2 * (v3 == 1);
  }
  else {
    uint64_t v4 = 1;
  }
  v5[2](v5, v4);
}

- (void)getChipPublicKey:(id)a3
{
  id v5 = (void (**)(void))a3;
  int v3 = sub_1002F6464();
  CFDataRef v4 = sub_1002F92DC((uint64_t)v3);
  v5[2]();
  if (v4) {
}
  }

- (void)setNarrowbandSarState:(int64_t)a3 reply:(id)a4
{
  __int16 v9 = (void (**)(id, uint64_t))a4;
  switch(a3)
  {
    case 3:
      uint64_t v7 = 2;
      break;
    case 2:
      uint64_t v7 = 1;
      break;
    case 0:
      id v5 = sub_1002F6464();
      uint64_t v6 = (*(uint64_t (**)(void *))(*(void *)v5 + 144))(v5);
      goto LABEL_9;
    default:
      uint64_t v7 = 0;
      break;
  }
  uint64_t v8 = sub_1002F6464();
  uint64_t v6 = (*(uint64_t (**)(void *, uint64_t))(*(void *)v8 + 136))(v8, v7);
LABEL_9:
  v9[2](v9, v6);
}

- (void)getDeepSleepState:(id)a3
{
  int v3 = (void (**)(id, void))a3;
  CFDataRef v4 = sub_1002F6464();
  unsigned __int16 v5 = sub_1002F92E4((uint64_t)v4);
  unsigned __int8 v6 = v5;
  unsigned int v7 = v5;
  uint64_t v8 = qword_1008ABDE0;
  BOOL v9 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
  if (v7 > 0xFF)
  {
    if (v9)
    {
      if (v6 > 2u) {
        uint64_t v11 = "";
      }
      else {
        uint64_t v11 = off_1008460A0[(char)v6];
      }
      int v12 = 136315138;
      uint64_t v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#deep-slp PRDiagnosticsService getDeepSleepState %s", (uint8_t *)&v12, 0xCu);
    }
    if (v6 >= 3u) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = v6 + 1;
    }
  }
  else
  {
    if (v9)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#deep-slp PRDiagnosticsService getDeepSleepState nullopt", (uint8_t *)&v12, 2u);
    }
    uint64_t v10 = 0;
  }
  v3[2](v3, v10);
}

- (void)startStreamingProtobufDataForClientId:(id)a3 reply:(id)a4
{
  id v8 = a3;
  unsigned __int8 v6 = (void (**)(id, uint64_t))a4;
  os_unfair_lock_lock(&self->_protobufLock);
  unsigned int v7 = +[NSXPCConnection currentConnection];
  [(NSMutableDictionary *)self->_protobufClients setObject:v7 forKeyedSubscript:v8];

  os_unfair_lock_unlock(&self->_protobufLock);
  v6[2](v6, 1);
}

- (void)stopStreamingProtobufDataForClientId:(id)a3 reply:(id)a4
{
  id v7 = a3;
  unsigned __int8 v6 = (void (**)(id, uint64_t))a4;
  os_unfair_lock_lock(&self->_protobufLock);
  [(NSMutableDictionary *)self->_protobufClients removeObjectForKey:v7];
  os_unfair_lock_unlock(&self->_protobufLock);
  v6[2](v6, 1);
}

- (void)prepareForRegulatoryAssistance:(id)a3
{
  int v3 = (void (**)(id, void))a3;
  CFDataRef v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#reg-assist, prepareForRegulatoryAssistance called.", v9, 2u);
  }
  unsigned __int16 v5 = +[NSXPCConnection currentConnection];
  unsigned __int8 v6 = sub_1000090F0(v5);

  if (v6)
  {
    v3[2](v3, 0);
  }
  else
  {
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    CFStringRef v11 = @"Insufficient entitlements.";
    id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v8 = +[NSError errorWithDomain:@"com.apple.Proximity.ErrorDomain" code:999 userInfo:v7];
    ((void (**)(id, void *))v3)[2](v3, v8);
  }
}

- (void)injectIsoCode:(id)a3
{
  id v3 = a3;
  CFDataRef v4 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#reg-assist, injectIsoCode called.", (uint8_t *)__p, 2u);
  }
  unsigned __int16 v5 = +[NSXPCConnection currentConnection];
  if (sub_1000090F0(v5))
  {
    if (v3)
    {
      id v6 = v3;
      sub_100004950(__p, (char *)[v6 UTF8String]);
      id v7 = sub_1002F6464();
      char v8 = (*(uint64_t (**)(void *, void **))(*(void *)v7 + 128))(v7, __p);
      BOOL v9 = qword_1008ABDE0;
      if (v8)
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v6;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#reg-assist, successfully inject iso code: %@.", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
      {
        sub_10040B728((uint64_t)v6, v9, v18, v19, v20, v21, v22, v23);
      }
      if (v25 < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      id v17 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040B6E4(v17);
      }
    }
  }
  else
  {
    NSErrorUserInfoKey v10 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040B794((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (BOOL)validateClientEntitlements:(id)a3
{
  id v3 = [a3 valueForEntitlement:@"com.apple.nearbyd.diagnostics"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v4 = [v3 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)handleXPCDisconnection
{
  v2 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[PRDiagnosticsService] xpc disconnection", v3, 2u);
  }
}

- (void)publishBytes:(char *)a3 amount:(unint64_t)a4
{
  if (a4 >= 0x3E9) {
    sub_10040B800();
  }
  p_protobufLock = &self->_protobufLock;
  os_unfair_lock_lock(&self->_protobufLock);
  char v8 = +[NSData dataWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v9 = self->_protobufClients;
  id v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(id *)(*((void *)&v16 + 1) + 8 * (void)v12);
        uint64_t v14 = -[NSMutableDictionary objectForKeyedSubscript:](self->_protobufClients, "objectForKeyedSubscript:", v13, (void)v16);
        uint64_t v15 = [v14 remoteObjectProxy];
        [v15 consumeProtobufBytes:v8];

        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_protobufLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->machServicesNames, 0);

  objc_storeStrong((id *)&self->_protobufClients, 0);
}

@end