@interface CLNearbydInterfaceManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)isRegulatorySyncSupportedOnWatch:(id *)a3;
- (BOOL)pairSupportsRegulatorySync;
- (BOOL)sendMessageToWatch:(id)a3 identifier:(id *)a4;
- (CLNearbydInterfaceManagerAdapter)init;
- (IDSService)service;
- (NSString)nearbyPairUniqueID;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setNearbyPairUniqueID:(id)a3;
- (void)setPairSupportsRegulatorySync:(BOOL)a3;
- (void)setService:(id)a3;
- (void)setSilo:(id)a3;
- (void)updateNearbyStatusWithDevices:(id)a3;
@end

@implementation CLNearbydInterfaceManagerAdapter

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
  if (qword_102489768 != -1) {
    dispatch_once(&qword_102489768, &stru_10234C7A0);
  }
  return (id)qword_102489760;
}

+ (BOOL)isSupported
{
  sub_100103240();
  if (sub_10016CCBC()) {
    return 1;
  }
  sub_100103240();

  return sub_10010145C();
}

- (CLNearbydInterfaceManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLNearbydInterfaceManagerAdapter;
  return [(CLNearbydInterfaceManagerAdapter *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLNearbydInterfaceManagerProtocol outboundProtocol:&OBJC_PROTOCOL___CLNearbydInterfaceManagerClientProtocol];
}

- (void)setSilo:(id)a3
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_10234C7C0);
  }
  unint64_t v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#NearbydIfMgr,suspending silo until IDS becomes available\"}", buf, 0x12u);
  }
  [a3 suspend];
  v8.receiver = self;
  v8.super_class = (Class)CLNearbydInterfaceManagerAdapter;
  [(CLNearbydInterfaceManagerAdapter *)&v8 setSilo:a3];
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_10234C7C0);
  }
  v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v10 = 0;
    __int16 v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#NearbydIfMgr,waiting on IDS to become available\"}", buf, 0x12u);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1019EC764;
  v7[3] = &unk_1022B87F0;
  v7[4] = self;
  v7[5] = a3;
  +[IDSService serviceWithIdentifier:@"com.apple.private.alloy.regulatorysync" completion:v7];
}

- (void)beginService
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_10234C7C0);
  }
  objc_super v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&uint8_t buf[4] = 0;
    v5[0] = 2082;
    *(void *)&v5[1] = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#NearbydIfMgr,beginService\"}", buf, 0x12u);
  }
  [(CLNearbydInterfaceManagerAdapter *)self universe];
  operator new();
}

- (void)endService
{
  p_fNearbydIfMgrInstance = (uint64_t *)&self->fNearbydIfMgrInstance;
  value = self->fNearbydIfMgrInstance.__ptr_.__value_;
  *((void *)value + 16) = 0;
  uint64_t v5 = *((void *)value + 14);
  *((void *)value + 14) = 0;
  if (v5) {
    (*(void (**)(uint64_t, SEL))(*(void *)v5 + 8))(v5, a2);
  }
  uint64_t v6 = *((void *)value + 13);
  *((void *)value + 13) = 0;
  if (v6) {
    (*(void (**)(uint64_t, SEL))(*(void *)v6 + 8))(v6, a2);
  }
  uint64_t v7 = *((void *)value + 15);
  *((void *)value + 15) = 0;
  if (v7) {
    (*(void (**)(uint64_t, SEL))(*(void *)v7 + 8))(v7, a2);
  }
  sub_1019ED4D4(p_fNearbydIfMgrInstance, 0);

  [(CLNearbydInterfaceManagerAdapter *)self setService:0];
}

- (BOOL)isRegulatorySyncSupportedOnWatch:(id *)a3
{
  return a3->var0 > 7 || a3->var0 == 7 && a3->var1 > 3;
}

- (void)updateNearbyStatusWithDevices:(id)a3
{
  [self universe].silo
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v8)
  {
    id v3 = v8;
    uint64_t v9 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(a3);
        }
        v4 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v4 isDefaultPairedDevice] && objc_msgSend(v4, "isNearby"))
        {
          id v11 = [v4 uniqueIDOverride];
          if (v4)
          {
            [v4 operatingSystemVersion];
            v4 = *(void **)buf;
            id v3 = *(id *)&buf[8];
            uint64_t v5 = *(void *)&buf[16];
          }
          else
          {
            uint64_t v5 = 0;
            id v3 = 0;
          }
          goto LABEL_14;
        }
      }
      id v3 = [a3 countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_14:
  if ((objc_msgSend(v11, "isEqualToString:", -[CLNearbydInterfaceManagerAdapter nearbyPairUniqueID](self, "nearbyPairUniqueID")) & 1) == 0)
  {
    [(CLNearbydInterfaceManagerAdapter *)self setNearbyPairUniqueID:v11];
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10234C7C0);
    }
    v12 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(CLNearbydInterfaceManagerAdapter *)self nearbyPairUniqueID];
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&uint8_t buf[8] = 2082;
      *(void *)&buf[10] = "";
      *(_WORD *)&buf[18] = 1026;
      *(_DWORD *)&buf[20] = v13 != 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#NearbydIfMgr,Nearby status change\", \"is nearby\":%{public}d}", buf, 0x18u);
    }
    v23[0] = v4;
    v23[1] = v3;
    v23[2] = v5;
    self->_pairSupportsRegulatorySync = [(CLNearbydInterfaceManagerAdapter *)self isRegulatorySyncSupportedOnWatch:v23];
    BOOL v14 = [(CLNearbydInterfaceManagerAdapter *)self nearbyPairUniqueID] != 0;
    value = self->fNearbydIfMgrInstance.__ptr_.__value_;
    *(unsigned char *)value = v14;
    *((unsigned char *)value + 1) = self->_pairSupportsRegulatorySync;
    if ([(CLNearbydInterfaceManagerAdapter *)self nearbyPairUniqueID])
    {
      if (self->_pairSupportsRegulatorySync)
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10234C7C0);
        }
        v16 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = v4;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v3;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#NearbydIfMgr, Phone found its paired watch, OS version number = %ld.%ld, Calling fNearbydIfMgrInstance->syncIsoCountry()", buf, 0x16u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_10234C7C0);
          }
          int v28 = 134218240;
          v29 = v4;
          __int16 v30 = 2048;
          id v31 = v3;
          v21 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNearbydInterfaceManagerAdapter updateNearbyStatusWithDevices:]", "%s\n", v21);
          if (v21 != buf) {
            free(v21);
          }
        }
        v17 = self->fNearbydIfMgrInstance.__ptr_.__value_;
        v18 = sub_1000C9530((void *)v17 + 1, 0);
        if (v18)
        {
          *((unsigned char *)v18 + 48) = 1;
          sub_1000A7BA0(v18 + 7);
        }
        sub_1019EF1B4((uint64_t)v17, 0);
        v19 = sub_1000C9530((void *)v17 + 1, 1);
        if (v19)
        {
          *((unsigned char *)v19 + 48) = 1;
          sub_1000A7BA0(v19 + 7);
        }
        sub_1019EF1B4((uint64_t)v17, 1);
      }
      else
      {
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10234C7C0);
        }
        v20 = qword_102419538;
        if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = v4;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v3;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#NearbydIfMgr, Phone found its paired watch, OS version number = %ld.%ld, watch does not support regulatorysync", buf, 0x16u);
        }
        if (sub_10013D1A0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_102419530 != -1) {
            dispatch_once(&qword_102419530, &stru_10234C7C0);
          }
          int v28 = 134218240;
          v29 = v4;
          __int16 v30 = 2048;
          id v31 = v3;
          v22 = (char *)_os_log_send_and_compose_impl();
          sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNearbydInterfaceManagerAdapter updateNearbyStatusWithDevices:]", "%s\n", v22);
          if (v22 != buf) {
            free(v22);
          }
        }
      }
    }
  }
}

- (BOOL)sendMessageToWatch:(id)a3 identifier:(id *)a4
{
  [self universe].silo
  if (![(CLNearbydInterfaceManagerAdapter *)self nearbyPairUniqueID])
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10234C7C0);
    }
    id v11 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#NearbydIfMgr,sendMessageToWatch, returned early, watch is not nearby", buf, 2u);
    }
    LOBYTE(v10) = 0;
    if (!sub_10013D1A0(115, 0)) {
      return v10;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10234C7C0);
    }
    LOWORD(v21) = 0;
LABEL_26:
    v13 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLNearbydInterfaceManagerAdapter sendMessageToWatch:identifier:]", "%s\n");
    goto LABEL_46;
  }
  if (!self->_pairSupportsRegulatorySync)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10234C7C0);
    }
    v12 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#NearbydIfMgr,sendMessageToWatch, returned early, watchOS does not support IDS regulatory sync", buf, 2u);
    }
    LOBYTE(v10) = 0;
    if (!sub_10013D1A0(115, 0)) {
      return v10;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10234C7C0);
    }
    LOWORD(v21) = 0;
    goto LABEL_26;
  }
  *a4 = 0;
  uint64_t v20 = 0;
  uint64_t v7 = [(CLNearbydInterfaceManagerAdapter *)self service];
  unsigned int v8 = [(IDSService *)v7 sendMessage:a3 toDestinations:+[NSSet setWithObject:IDSDefaultPairedDevice] priority:200 options:0 identifier:a4 error:&v20];
  if (v20)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10234C7C0);
    }
    uint64_t v9 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24[0] = v20;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#NearbydIfMgr,sendMessageToWatch, #warning got error from IDS, error, %@", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_9;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10234C7C0);
    }
    int v21 = 138412290;
    v22[0] = v20;
    v13 = (uint8_t *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNearbydInterfaceManagerAdapter sendMessageToWatch:identifier:]", "%s\n");
LABEL_46:
    if (v13 != buf) {
      free(v13);
    }
LABEL_9:
    LOBYTE(v10) = 0;
    return v10;
  }
  if (*a4)
  {
    BOOL v10 = v8;
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10234C7C0);
    }
    BOOL v14 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = *a4;
      *(_DWORD *)buf = 67109378;
      LODWORD(v24[0]) = v10;
      WORD2(v24[0]) = 2112;
      *(void *)((char *)v24 + 6) = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#NearbydIfMgr,sendMessageToWatch,recoverable=%d,identifier=%@", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10234C7C0);
      }
      id v16 = *a4;
      int v21 = 67109378;
      LODWORD(v22[0]) = v10;
      WORD2(v22[0]) = 2112;
      *(void *)((char *)v22 + 6) = v16;
      v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNearbydInterfaceManagerAdapter sendMessageToWatch:identifier:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
    return v10;
  }
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_10234C7C0);
  }
  v18 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "#NearbydIfMgr,sendMessageToWatch, No error, but also no identifier", buf, 2u);
  }
  LOBYTE(v10) = 0;
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10234C7C0);
    }
    LOWORD(v21) = 0;
    goto LABEL_26;
  }
  return v10;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v7 = [(CLNearbydInterfaceManagerAdapter *)self universe];

  [v7 silo];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v7 = a6;
  [self universe:a3, a4, a5, a6, a7].silo;
  if (a5) {
    BOOL v10 = (char *)[a5 UTF8String];
  }
  else {
    BOOL v10 = "";
  }
  sub_100134750(__p, v10);
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_10234C7C0);
  }
  id v11 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v38 = a5;
    *(_WORD *)&v38[8] = 1024;
    *(_DWORD *)&v38[10] = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#NearbydIfMgr, Calling processDidSendMsgWithSuccess,identifier=%@,success=%d", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10234C7C0);
    }
    int v31 = 138412546;
    *(void *)v32 = a5;
    *(_WORD *)&v32[8] = 1024;
    *(_DWORD *)&v32[10] = v7;
    long long v24 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNearbydInterfaceManagerAdapter service:account:identifier:didSendWithSuccess:error:]", "%s\n", v24);
    if (v24 != (char *)buf) {
      free(v24);
    }
  }
  v12 = (uint64_t *)*((void *)self->fNearbydIfMgrInstance.__ptr_.__value_ + 3);
  if (v12)
  {
    while (1)
    {
      uint64_t v13 = sub_1000A7C40(v12[7], v12[8], (unsigned __int8 **)__p);
      if (v13 != v12[8]) {
        break;
      }
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10234C7C0);
      }
      BOOL v14 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        if (v30 >= 0) {
          id v15 = __p;
        }
        else {
          id v15 = (void **)__p[0];
        }
        *(_DWORD *)buf = 136315138;
        *(void *)v38 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#NearbydIfMgr,#processDidSendMsgWithSuccess,could not find msgIdentifier:%s", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419530 != -1) {
          dispatch_once(&qword_102419530, &stru_10234C7C0);
        }
        if (v30 >= 0) {
          id v16 = __p;
        }
        else {
          id v16 = (void **)__p[0];
        }
        int v31 = 136315138;
        *(void *)v32 = v16;
        v17 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "void CLNearbydInterfaceManager::processDidSendMsgWithSuccess(const std::string &, BOOL)", "%s\n", v17);
        if (v17 != (char *)buf) {
          free(v17);
        }
      }
      v12 = (uint64_t *)*v12;
      if (!v12) {
        goto LABEL_38;
      }
    }
    uint64_t v18 = v13;
    v19 = v12 + 7;
    if (v7)
    {
      *((unsigned char *)v12 + 48) = 0;
      sub_1000A7BA0(v19);
    }
    else
    {
      sub_101279BFC((uint64_t)v19, v18, (long long *)(v18 + 24));
    }
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10234C7C0);
    }
    uint64_t v20 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = -1431655765 * ((unint64_t)(v12[8] - v12[7]) >> 3);
      v22 = __p;
      if (v30 < 0) {
        v22 = (void **)__p[0];
      }
      int v23 = *((unsigned __int8 *)v12 + 48);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v38 = v21;
      *(_WORD *)&v38[4] = 2080;
      *(void *)&v38[6] = v22;
      __int16 v39 = 1024;
      BOOL v40 = v7;
      __int16 v41 = 1024;
      int v42 = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#NearbydIfMgr,#processDidSendMsgWithSuccess, identifier was found & removed, savedMsgIdentifiers.size()=%d, identifier=%s, success=%d, sendIt=%d", buf, 0x1Eu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_10234C7C0);
      }
      int v25 = -1431655765 * ((unint64_t)(v12[8] - v12[7]) >> 3);
      long long v26 = __p;
      if (v30 < 0) {
        long long v26 = (void **)__p[0];
      }
      int v27 = *((unsigned __int8 *)v12 + 48);
      int v31 = 67109890;
      *(_DWORD *)v32 = v25;
      *(_WORD *)&v32[4] = 2080;
      *(void *)&v32[6] = v26;
      __int16 v33 = 1024;
      BOOL v34 = v7;
      __int16 v35 = 1024;
      int v36 = v27;
      int v28 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "void CLNearbydInterfaceManager::processDidSendMsgWithSuccess(const std::string &, BOOL)", "%s\n", v28);
      if (v28 != (char *)buf) {
        free(v28);
      }
    }
  }
LABEL_38:
  if (v30 < 0) {
    operator delete(__p[0]);
  }
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  [self universe].silo
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_10234C7C0);
  }
  uint64_t v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289026;
    v7[1] = 0;
    __int16 v8 = 2082;
    uint64_t v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#NearbydIfMgr,nearbyDevicesChanged\"}", (uint8_t *)v7, 0x12u);
  }
  [(CLNearbydInterfaceManagerAdapter *)self updateNearbyStatusWithDevices:a4];
}

- (void)service:(id)a3 didSwitchActivePairedDevice:(id)a4 acknowledgementBlock:(id)a5
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_10234C7C0);
  }
  __int16 v8 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#NearbydIfMgr,didSwitchActivePairedDevice,activePairedDevice=%@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_10234C7C0);
    }
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLNearbydInterfaceManagerAdapter service:didSwitchActivePairedDevice:acknowledgementBlock:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  (*((void (**)(id))a5 + 2))(a5);
  self->_nearbyPairUniqueID = 0;
  [(CLNearbydInterfaceManagerAdapter *)self updateNearbyStatusWithDevices:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", a4, 0)];
}

- (IDSService)service
{
  return (IDSService *)objc_getProperty(self, a2, 24, 1);
}

- (void)setService:(id)a3
{
}

- (NSString)nearbyPairUniqueID
{
  return self->_nearbyPairUniqueID;
}

- (void)setNearbyPairUniqueID:(id)a3
{
}

- (BOOL)pairSupportsRegulatorySync
{
  return self->_pairSupportsRegulatorySync;
}

- (void)setPairSupportsRegulatorySync:(BOOL)a3
{
  self->_pairSupportsRegulatorySync = a3;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end