@interface CLTransitMacMonitor
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLLocation)mostRecentLocation;
- (CLTransitMacMonitor)init;
- (NSMutableArray)observedTransitAccessPointsCache;
- (NSMutableSet)clients;
- (id).cxx_construct;
- (unint64_t)currentState;
- (void)beginService;
- (void)endService;
- (void)onLocationNotification:(int)a3 data:(_OWORD *)a4;
- (void)onWifiServiceNotification:(int)a3 data:(uint64_t)a4;
- (void)processNewAccessPoints:(const void *)a3 transitTileResults:(id)a4;
- (void)setClients:(id)a3;
- (void)setCurrentState:(unint64_t)a3;
- (void)setMostRecentLocation:(id)a3;
- (void)setObservedTransitAccessPointsCache:(id)a3;
- (void)startMonitoringTransitStateForClient:(id)a3;
- (void)stopMonitoringTransitStateForClient:(id)a3;
@end

@implementation CLTransitMacMonitor

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
  if (qword_102487930 != -1) {
    dispatch_once(&qword_102487930, &stru_102324300);
  }
  return (id)qword_102487928;
}

- (CLTransitMacMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLTransitMacMonitor;
  return [(CLTransitMacMonitor *)&v3 initWithInboundProtocol:&OBJC_PROTOCOL___CLTransitMacMonitorProtocol outboundProtocol:&OBJC_PROTOCOL___CLTransitMacMonitorClientProtocol];
}

+ (BOOL)isSupported
{
  return 0;
}

- (void)beginService
{
  [(-[CLTransitMacMonitor universe](self, "universe")) silo];
  if (qword_102419480 != -1) {
    dispatch_once(&qword_102419480, &stru_102324378);
  }
  objc_super v3 = qword_102419488;
  if (os_log_type_enabled((os_log_t)qword_102419488, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#TransitMacMonitor: service begin", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419480 != -1) {
      dispatch_once(&qword_102419480, &stru_102324378);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTransitMacMonitor beginService]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLTransitMacMonitor *)self setCurrentState:0];
  [(CLTransitMacMonitor *)self setClients:+[NSMutableSet set]];
  [(CLTransitMacMonitor *)self setObservedTransitAccessPointsCache:+[NSMutableArray array]];
  self->_wifiServiceProxy = (CLWifiServiceProtocol *)[objc_msgSend(-[CLTransitMacMonitor universe](self, "universe"), "vendor") proxyForService:@"CLWifiService"];
  [(CLTransitMacMonitor *)self universe];
  sub_1001AE6FC();
}

- (void)endService
{
  [self universe].silo
  if (qword_102419480 != -1) {
    dispatch_once(&qword_102419480, &stru_102324378);
  }
  objc_super v3 = qword_102419488;
  if (os_log_type_enabled((os_log_t)qword_102419488, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#TransitMacMonitor: service end", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419480 != -1) {
      dispatch_once(&qword_102419480, &stru_102324378);
    }
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTransitMacMonitor endService]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  value = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8))(value);
  }
  [(CLTransitMacMonitor *)self setClients:0];
  [(CLTransitMacMonitor *)self setObservedTransitAccessPointsCache:0];

  self->_wifiServiceProxy = 0;
  unint64_t v5 = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (v5) {
    (*(void (**)(Client *))(*(void *)v5 + 8))(v5);
  }

  self->_transitMacTileDataProviderProxy = 0;
}

- (void)startMonitoringTransitStateForClient:(id)a3
{
  [self universe].silo
  if (![(NSMutableSet *)[(CLTransitMacMonitor *)self clients] count])
  {
    LODWORD(v5) = 3600;
    WORD2(v5) = 257;
    [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) register:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:3 registrationInfo:0 v5 @"dwr"];
    sub_1005E05AC();
  }
  [(NSMutableSet *)[(CLTransitMacMonitor *)self clients] addObject:a3];
  [a3 onTransitStateUpdate:-[CLTransitMacMonitor currentState](self, "currentState")];
}

- (void)stopMonitoringTransitStateForClient:(id)a3
{
  [self universe].silo
  if ([(NSMutableSet *)[(CLTransitMacMonitor *)self clients] containsObject:a3])
  {
    [(NSMutableSet *)[(CLTransitMacMonitor *)self clients] removeObject:a3];
    if (![(NSMutableSet *)[(CLTransitMacMonitor *)self clients] count])
    {
      [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:3];
      [*((id *)self->_wifiServiceClient.__ptr_.__value_ + 2) unregister:*((void *)self->_wifiServiceClient.__ptr_.__value_ + 1) forNotification:12];
      value = self->_locationClient.__ptr_.__value_;
      uint64_t v7 = *((void *)value + 1);
      v6 = (void *)*((void *)value + 2);
      [v6 unregister:v7 forNotification:4];
    }
  }
}

- (void)setCurrentState:(unint64_t)a3
{
  if (self->_currentState != a3)
  {
    if (qword_102419480 != -1) {
      dispatch_once(&qword_102419480, &stru_102324378);
    }
    uint64_t v5 = qword_102419488;
    if (os_log_type_enabled((os_log_t)qword_102419488, OS_LOG_TYPE_DEBUG))
    {
      unint64_t currentState = self->_currentState;
      *(_DWORD *)buf = 134349312;
      unint64_t v24 = currentState;
      __int16 v25 = 2050;
      unint64_t v26 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#TransitMacMonitor: transit state changed from, %{public}lu, to, %{public}lu", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419480 != -1) {
        dispatch_once(&qword_102419480, &stru_102324378);
      }
      unint64_t v12 = self->_currentState;
      int v19 = 134349312;
      unint64_t v20 = v12;
      __int16 v21 = 2050;
      unint64_t v22 = a3;
      v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTransitMacMonitor setCurrentState:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
    self->_unint64_t currentState = a3;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [(CLTransitMacMonitor *)self clients];
    id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) onTransitStateUpdate:a3];
        }
        id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
}

- (void)processNewAccessPoints:(const void *)a3 transitTileResults:(id)a4
{
  v6 = self;
  [self universe].silo
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_1013EEAD4;
  v83[3] = &unk_102324320;
  v83[4] = CFAbsoluteTimeGetCurrent();
  [(NSMutableArray *)[(CLTransitMacMonitor *)v6 observedTransitAccessPointsCache] filterUsingPredicate:+[NSPredicate predicateWithBlock:v83]];
  uint64_t v7 = *(void *)a3;
  v66 = v6;
  for (int i = 0; v7 != *((void *)a3 + 1); v7 += 88)
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v9 = [a4 countByEnumeratingWithState:&v79 objects:v94 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v80;
      while (2)
      {
        for (j = 0; j != v10; j = (char *)j + 1)
        {
          if (*(void *)v80 != v11) {
            objc_enumerationMutation(a4);
          }
          v13 = *(void **)(*((void *)&v79 + 1) + 8 * (void)j);
          *(void *)buf = *(void *)v7;
          id v14 = (id)sub_1000D8908((uint64_t)buf);
          if (v14 == [v13 macAddress])
          {
            v6 = v66;
            long long v15 = [(CLTransitMacMonitor *)v66 observedTransitAccessPointsCache];
            long long v16 = [CLTransitMacMonitorAccessPoint alloc];
            *(void *)buf = *(void *)v7;
            [(NSMutableArray *)v15 addObject:[(CLTransitMacMonitorAccessPoint *)v16 initWithMacAddress:sub_1000D8908((uint64_t)buf) timestamp:*(double *)(v7 + 56)]];
            ++i;
            goto LABEL_12;
          }
        }
        id v10 = [a4 countByEnumeratingWithState:&v79 objects:v94 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      v6 = v66;
    }
LABEL_12:
    ;
  }
  if (qword_102419480 != -1) {
    dispatch_once(&qword_102419480, &stru_102324378);
  }
  long long v17 = qword_102419488;
  if (os_log_type_enabled((os_log_t)qword_102419488, OS_LOG_TYPE_INFO))
  {
    id v18 = [(NSMutableArray *)[(CLTransitMacMonitor *)v6 observedTransitAccessPointsCache] count];
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)&uint8_t buf[4] = i;
    *(_WORD *)&buf[8] = 2050;
    *(void *)&buf[10] = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "#TransitMacMonitor: added %{public}d new access point scans, total cache size, %{public}lu", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419480 != -1) {
      dispatch_once(&qword_102419480, &stru_102324378);
    }
    id v62 = [(NSMutableArray *)[(CLTransitMacMonitor *)v6 observedTransitAccessPointsCache] count];
    int v84 = 67240448;
    *(_DWORD *)v85 = i;
    *(_WORD *)&v85[4] = 2050;
    *(void *)&v85[6] = v62;
    v63 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTransitMacMonitor processNewAccessPoints:transitTileResults:]", "%s\n", v63);
    if (v63 != buf) {
      free(v63);
    }
  }
  if (![(NSMutableArray *)[(CLTransitMacMonitor *)v6 observedTransitAccessPointsCache] count])
  {
    if (qword_102419480 != -1) {
      dispatch_once(&qword_102419480, &stru_102324378);
    }
    v37 = qword_102419488;
    if (os_log_type_enabled((os_log_t)qword_102419488, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "#TransitMacMonitor: no scan history", buf, 2u);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_72;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419480 != -1) {
      dispatch_once(&qword_102419480, &stru_102324378);
    }
    LOWORD(v84) = 0;
LABEL_49:
    v38 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTransitMacMonitor processNewAccessPoints:transitTileResults:]", "%s\n", v38);
    if (v38 != buf) {
      free(v38);
    }
    goto LABEL_72;
  }
  id v19 = +[NSMutableDictionary dictionary];
  [[-[NSMutableArray objectAtIndexedSubscript:](-[CLTransitMacMonitor observedTransitAccessPointsCache](v6, "observedTransitAccessPointsCache"), "objectAtIndexedSubscript:", 0) timestamp];
  double v21 = v20;
  [[-[NSMutableArray objectAtIndexedSubscript:](-[CLTransitMacMonitor observedTransitAccessPointsCache](v6, "observedTransitAccessPointsCache"), "objectAtIndexedSubscript:", 0) timestamp];
  double v23 = v22;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  unint64_t v24 = [(CLTransitMacMonitor *)v6 observedTransitAccessPointsCache];
  id v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v75 objects:v90 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v76;
    do
    {
      for (k = 0; k != v26; k = (char *)k + 1)
      {
        if (*(void *)v76 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v75 + 1) + 8 * (void)k);
        id v30 = [v19 objectForKeyedSubscript:[+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v29, "macAddress"))]];
        if (!v30)
        {
          id v30 = +[NSMutableArray array];
          [v19 setObject:v30 forKeyedSubscript:[NSNumber numberWithUnsignedLongLong:objc_msgSend(v29, "macAddress")]];
        }
        [v30 addObject:v29];
        [v29 timestamp];
        if (v31 < v21)
        {
          [v29 timestamp];
          double v21 = v32;
        }
        [v29 timestamp];
        if (v33 > v23)
        {
          [v29 timestamp];
          double v23 = v34;
        }
      }
      id v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v75 objects:v90 count:16];
    }
    while (v26);
  }
  double v35 = v23 - v21;
  if (v35 < 180.0)
  {
    if (qword_102419480 != -1) {
      dispatch_once(&qword_102419480, &stru_102324378);
    }
    v36 = qword_102419488;
    if (os_log_type_enabled((os_log_t)qword_102419488, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      *(double *)&uint8_t buf[4] = v35;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "#TransitMacMonitor: not enough scan history, length, %{public}f", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 2)) {
      goto LABEL_72;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419480 != -1) {
      dispatch_once(&qword_102419480, &stru_102324378);
    }
    int v84 = 134349056;
    *(double *)v85 = v35;
    goto LABEL_49;
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v39 = [v19 countByEnumeratingWithState:&v71 objects:v89 count:16];
  if (!v39)
  {
LABEL_72:
    uint64_t v59 = 0;
    goto LABEL_73;
  }
  id v40 = v39;
  uint64_t v41 = *(void *)v72;
  while (2)
  {
    for (m = 0; m != v40; m = (char *)m + 1)
    {
      if (*(void *)v72 != v41) {
        objc_enumerationMutation(v19);
      }
      uint64_t v43 = *(void *)(*((void *)&v71 + 1) + 8 * (void)m);
      id v44 = [v19 objectForKeyedSubscript:v43];
      if ((unint64_t)[v44 count] >= 3)
      {
        [objc_msgSend(v44, "objectAtIndexedSubscript:", 0) timestamp];
        double v46 = v45;
        [objc_msgSend(v44, "objectAtIndexedSubscript:", 0) timestamp];
        double v48 = v47;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v49 = [v44 countByEnumeratingWithState:&v67 objects:v88 count:16];
        if (v49)
        {
          id v50 = v49;
          uint64_t v51 = *(void *)v68;
          do
          {
            for (n = 0; n != v50; n = (char *)n + 1)
            {
              if (*(void *)v68 != v51) {
                objc_enumerationMutation(v44);
              }
              v53 = *(void **)(*((void *)&v67 + 1) + 8 * (void)n);
              [v53 timestamp];
              if (v54 < v46)
              {
                [v53 timestamp];
                double v46 = v55;
              }
              [v53 timestamp];
              if (v56 > v48)
              {
                [v53 timestamp];
                double v48 = v57;
              }
            }
            id v50 = [v44 countByEnumeratingWithState:&v67 objects:v88 count:16];
          }
          while (v50);
        }
        double v58 = v48 - v46;
        if (v58 >= 180.0)
        {
          if (qword_102419480 != -1) {
            dispatch_once(&qword_102419480, &stru_102324378);
          }
          v60 = qword_102419488;
          if (os_log_type_enabled((os_log_t)qword_102419488, OS_LOG_TYPE_INFO))
          {
            id v61 = [v44 count];
            *(_DWORD *)buf = 138478339;
            *(void *)&uint8_t buf[4] = v43;
            *(_WORD *)&buf[12] = 2050;
            *(void *)&buf[14] = v61;
            __int16 v92 = 2050;
            double v93 = v58;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "#TransitMacMonitor: transit state, on transit, based on mac, %{private}@, history count, %{public}lu, interval, %{public}f", buf, 0x20u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_102419480 != -1) {
              dispatch_once(&qword_102419480, &stru_102324378);
            }
            id v64 = [v44 count];
            int v84 = 138478339;
            *(void *)v85 = v43;
            *(_WORD *)&v85[8] = 2050;
            *(void *)&v85[10] = v64;
            __int16 v86 = 2050;
            double v87 = v58;
            v65 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTransitMacMonitor processNewAccessPoints:transitTileResults:]", "%s\n", v65);
            if (v65 != buf) {
              free(v65);
            }
          }
          uint64_t v59 = 1;
          goto LABEL_73;
        }
      }
    }
    id v40 = [v19 countByEnumeratingWithState:&v71 objects:v89 count:16];
    uint64_t v59 = 0;
    if (v40) {
      continue;
    }
    break;
  }
LABEL_73:
  [(CLTransitMacMonitor *)v66 setCurrentState:v59];
}

- (void)onWifiServiceNotification:(int)a3 data:(uint64_t)a4
{
  void (**v7)(uint8_t *__return_ptr);
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  char *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  char *v35;
  void v36[5];
  void *v37[3];
  void *__p;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  unsigned char v44[12];
  uint8_t buf[16];
  long long v46[101];

  [objc_msgSend((id)a1, "universe") silo];
  uint64_t v41 = 0;
  v42 = 0;
  uint64_t v43 = 0;
  if (a3 != 12)
  {
    if (a3 == 3)
    {
      uint64_t v7 = (void (**)(uint8_t *__return_ptr))[*(id *)(a1 + 8) syncgetScanResult];
      if (v7)
      {
        v7[2](buf);
        id v8 = *(void *)&buf[8];
        id v9 = *(void *)&v46[0];
      }
      else
      {
        id v9 = 0;
        id v8 = 0;
        *(_OWORD *)buf = 0u;
        v46[0] = 0u;
      }
      sub_1000DAC8C((uint64_t *)&v41, v8, v9, 0x2E8BA2E8BA2E8BA3 * ((v9 - v8) >> 3));
      *(void *)id v44 = &buf[8];
      sub_1000D7F78((void ***)v44);
    }
LABEL_18:
    if (qword_102419480 != -1) {
      dispatch_once(&qword_102419480, &stru_102324378);
    }
    id v14 = qword_102419488;
    if (os_log_type_enabled((os_log_t)qword_102419488, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "#TransitMacMonitor: wifi notification, %{public}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419480 != -1) {
        dispatch_once(&qword_102419480, &stru_102324378);
      }
      *(_DWORD *)id v44 = 67240192;
      *(_DWORD *)&v44[4] = a3;
      double v35 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTransitMacMonitor onWifiServiceNotification:data:]", "%s\n", v35);
      if (v35 != (char *)buf) {
        free(v35);
      }
    }
    if (v42 != v41)
    {
      if ([(id)a1 mostRecentLocation])
      {
        memset(buf, 0, sizeof(buf));
        *(void *)&v46[0] = 0;
        sub_100288630((void **)buf, 0x2E8BA2E8BA2E8BA3 * (v42 - v41));
        long long v15 = v41;
        if (v41 == v42)
        {
          id v19 = *(void *)&buf[8];
        }
        else
        {
          do
          {
            *(void *)id v44 = *v15;
            long long v16 = sub_1000D8908((uint64_t)v44);
            long long v17 = v16;
            id v18 = *(char **)&buf[8];
            if (*(void *)&buf[8] >= *(void *)&v46[0])
            {
              double v20 = *(char **)buf;
              double v21 = (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3;
              double v22 = v21 + 1;
              if ((unint64_t)(v21 + 1) >> 61) {
                sub_1001D7FD4();
              }
              double v23 = *(void *)&v46[0] - *(void *)buf;
              if ((uint64_t)(*(void *)&v46[0] - *(void *)buf) >> 2 > v22) {
                double v22 = v23 >> 2;
              }
              if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v24 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v24 = v22;
              }
              if (v24)
              {
                id v25 = (char *)sub_1000DA54C((uint64_t)v46, v24);
                double v20 = *(char **)buf;
                id v18 = *(char **)&buf[8];
              }
              else
              {
                id v25 = 0;
              }
              id v26 = (uint64_t *)&v25[8 * v21];
              *id v26 = v17;
              id v19 = (uint64_t)(v26 + 1);
              while (v18 != v20)
              {
                uint64_t v27 = *((void *)v18 - 1);
                v18 -= 8;
                *--id v26 = v27;
              }
              *(void *)buf = v26;
              *(void *)&buf[8] = v19;
              *(void *)&v46[0] = &v25[8 * v24];
              if (v20) {
                operator delete(v20);
              }
            }
            else
            {
              **(void **)&buf[8] = v16;
              id v19 = (uint64_t)(v18 + 8);
            }
            *(void *)&buf[8] = v19;
            v15 += 11;
          }
          while (v15 != v42);
        }
        v29 = *(void **)(a1 + 24);
        id v39 = 0;
        id v40 = 0;
        __p = 0;
        sub_1001DD364(&__p, *(const void **)buf, v19, (v19 - *(void *)buf) >> 3);
        id v30 = sub_10096852C((uint64_t)&__p);
        [objc_msgSend((id)a1, "mostRecentLocation") coordinate];
        double v32 = v31;
        [objc_msgSend((id)a1, "mostRecentLocation") coordinate];
        double v34 = v33;
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3321888768;
        v36[2] = sub_1013EF380;
        v36[3] = &unk_102324348;
        v36[4] = a1;
        memset(v37, 0, sizeof(v37));
        sub_1000DA6E8(v37, (uint64_t)v41, (uint64_t)v42, 0x2E8BA2E8BA2E8BA3 * (v42 - v41));
        [v29 fetchMacAddressesAmong:v30 nearLatitude:v36 longitude:v32 withReply:v34];
        if (__p)
        {
          id v39 = __p;
          operator delete(__p);
        }
        *(void *)id v44 = v37;
        sub_1000D7F78((void ***)v44);
        if (*(void *)buf)
        {
          *(void *)&buf[8] = *(void *)buf;
          operator delete(*(void **)buf);
        }
        goto LABEL_59;
      }
      if (qword_102419480 != -1) {
        dispatch_once(&qword_102419480, &stru_102324378);
      }
      v28 = qword_102419488;
      if (os_log_type_enabled((os_log_t)qword_102419488, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134283521;
        *(void *)&uint8_t buf[4] = 0x2E8BA2E8BA2E8BA3 * (v42 - v41);
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "#TransitMacMonitor: received a wifi scan with %{private}lu access points, but we don't have a location to query tiles", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419480 != -1) {
          dispatch_once(&qword_102419480, &stru_102324378);
        }
        *(_DWORD *)id v44 = 134283521;
        *(void *)&v44[4] = 0x2E8BA2E8BA2E8BA3 * (v42 - v41);
        v13 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTransitMacMonitor onWifiServiceNotification:data:]", "%s\n", v13);
LABEL_52:
        if (v13 != (char *)buf) {
          free(v13);
        }
        goto LABEL_59;
      }
    }
    goto LABEL_59;
  }
  if (!sub_101118FC4(*(_DWORD *)(a4 + 140)))
  {
    if (&v41 != (void **)(a4 + 112)) {
      sub_1000DAC8C((uint64_t *)&v41, *(void *)(a4 + 112), *(void *)(a4 + 120), 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*(void *)(a4 + 120) - *(void *)(a4 + 112)) >> 3));
    }
    goto LABEL_18;
  }
  if (qword_102419480 != -1) {
    dispatch_once(&qword_102419480, &stru_102324378);
  }
  id v10 = qword_102419488;
  if (os_log_type_enabled((os_log_t)qword_102419488, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = sub_100D54ED8(*(_DWORD *)(a4 + 140));
    *(_DWORD *)buf = 136446210;
    *(void *)&uint8_t buf[4] = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "#TransitMacMonitor: ignoring NotificationScanCache source %{public}s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419480 != -1) {
      dispatch_once(&qword_102419480, &stru_102324378);
    }
    unint64_t v12 = sub_100D54ED8(*(_DWORD *)(a4 + 140));
    *(_DWORD *)id v44 = 136446210;
    *(void *)&v44[4] = v12;
    v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLTransitMacMonitor onWifiServiceNotification:data:]", "%s\n", v13);
    goto LABEL_52;
  }
LABEL_59:
  *(void *)buf = &v41;
  sub_1000D7F78((void ***)buf);
}

- (void)onLocationNotification:(int)a3 data:(_OWORD *)a4
{
  [objc_msgSend(a1, "universe") silo];
  if ((a3 | 4) == 4)
  {
    id v7 = objc_alloc((Class)CLLocation);
    long long v8 = a4[7];
    v14[6] = a4[6];
    v14[7] = v8;
    v15[0] = a4[8];
    *(_OWORD *)((char *)v15 + 12) = *(_OWORD *)((char *)a4 + 140);
    long long v9 = a4[3];
    v14[2] = a4[2];
    v14[3] = v9;
    long long v10 = a4[5];
    v14[4] = a4[4];
    v14[5] = v10;
    long long v11 = a4[1];
    v14[0] = *a4;
    v14[1] = v11;
    [a1 setMostRecentLocation:[v7 initWithClientLocation:v14]];
  }
  else
  {
    if (qword_102419550 != -1) {
      dispatch_once(&qword_102419550, &stru_102324398);
    }
    unint64_t v12 = qword_102419558;
    if (os_log_type_enabled((os_log_t)qword_102419558, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67240192;
      int v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "received unhandled notification %{public, location:CLLocationProvider_Type::Notification}d", buf, 8u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419550 != -1) {
        dispatch_once(&qword_102419550, &stru_102324398);
      }
      int v16 = 67240192;
      int v17 = a3;
      v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLTransitMacMonitor onLocationNotification:data:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        free(v13);
      }
    }
  }
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (NSMutableArray)observedTransitAccessPointsCache
{
  return self->_observedTransitAccessPointsCache;
}

- (void)setObservedTransitAccessPointsCache:(id)a3
{
}

- (CLLocation)mostRecentLocation
{
  return self->_mostRecentLocation;
}

- (void)setMostRecentLocation:(id)a3
{
}

- (void).cxx_destruct
{
  value = self->_locationClient.__ptr_.__value_;
  self->_locationClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8))(value, a2);
  }
  v4 = self->_wifiServiceClient.__ptr_.__value_;
  self->_wifiServiceClient.__ptr_.__value_ = 0;
  if (v4)
  {
    uint64_t v5 = *(void (**)(void))(*(void *)v4 + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end