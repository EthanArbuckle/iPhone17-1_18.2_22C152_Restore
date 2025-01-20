@interface NIServerNearbyAccessoryRangingService
+ (id)sharedInstance;
- (BOOL)_buildAndRunRangingSession:(unsigned int)a3;
- (id)_initInternal;
- (id)_internalPrintableState;
- (id)addServiceClient:(id)a3 identifier:(id)a4 processName:(id)a5 configuration:(id)a6;
- (id)printableState;
- (optional<unsigned)_generateUwbSessionIdForNewServiceClientWithProcessName:(id)a3 parsedAccessoryConfigData:(const void *)a4 debugParameters:(id)a5;
- (void)_cleanupExcessiveDetachedSessions;
- (void)_prepareUwbSessionTrackingObjectsForClientTracking:(id)a3 outServiceRequest:(void *)a4 outStartOptions:(void *)a5 outShareableConfigData:(id *)a6;
- (void)_prepareUwbSessionTrackingObjectsFromDebugParameters:(id)a3 outServiceRequest:(void *)a4 outStartOptions:(void *)a5;
- (void)_relayToClientsOfUWBSessionId:(unsigned int)a3 blockToRelay:(id)a4;
- (void)_serviceRequestForUWBSessionID:(unsigned int)a3 didUpdateStatus:(ServiceRequestStatusUpdate)a4;
- (void)_updateUwbSessionState:(unsigned int)a3;
- (void)notifyServiceClientWithIdentifier:(id)a3 isRunning:(BOOL)a4;
- (void)removeServiceClientWithIdentifier:(id)a3;
@end

@implementation NIServerNearbyAccessoryRangingService

+ (id)sharedInstance
{
  if (qword_1008A7C70 != -1) {
    dispatch_once(&qword_1008A7C70, &stru_10085D8C0);
  }
  v2 = (void *)qword_1008A7C68;

  return v2;
}

- (id)addServiceClient:(id)a3 identifier:(id)a4 processName:(id)a5 configuration:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_1002AD6E8;
  v32 = sub_1002AD6F8;
  id v33 = 0;
  queue = self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1002AD700;
  v21[3] = &unk_10085D8E8;
  id v22 = v11;
  v23 = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v10;
  v27 = &v28;
  id v15 = v10;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  dispatch_sync((dispatch_queue_t)queue, v21);
  id v19 = (id)v29[5];

  _Block_object_dispose(&v28, 8);

  return v19;
}

- (void)removeServiceClientWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002AE170;
  v7[3] = &unk_100846588;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)notifyServiceClientWithIdentifier:(id)a3 isRunning:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002AE434;
  block[3] = &unk_100856158;
  id v10 = v6;
  id v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (id)printableState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1002AD6E8;
  id v10 = sub_1002AD6F8;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002AE79C;
  v5[3] = &unk_100856C00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_internalPrintableState
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_1002AD6E8;
  id v19 = sub_1002AD6F8;
  id v20 = (id)objc_opt_new();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  double v4 = sub_100006C38();
  v5 = (void *)v16[5];
  uint64_t v6 = +[NSString stringWithFormat:@"%d clients", [(NSMutableDictionary *)self->_clientTracking count]];
  [v5 addObject:v6];

  clientTracking = self->_clientTracking;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002AEA30;
  v14[3] = &unk_10085D910;
  v14[4] = &v15;
  [(NSMutableDictionary *)clientTracking enumerateKeysAndObjectsUsingBlock:v14];
  uint64_t v8 = (void *)v16[5];
  v9 = +[NSString stringWithFormat:@"%d UWB sessions", [(NSMutableDictionary *)self->_uwbSessionTracking count]];
  [v8 addObject:v9];

  uwbSessionTracking = self->_uwbSessionTracking;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002AEDB4;
  v13[3] = &unk_10085D938;
  v13[4] = &v15;
  *(double *)&v13[5] = v4;
  [(NSMutableDictionary *)uwbSessionTracking enumerateKeysAndObjectsUsingBlock:v13];
  id v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (id)_initInternal
{
  v16.receiver = self;
  v16.super_class = (Class)NIServerNearbyAccessoryRangingService;
  v2 = [(NIServerNearbyAccessoryRangingService *)&v16 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nearbyd.accessory-ranging-service", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[NSMapTable strongToWeakObjectsMapTable];
    clients = v2->_clients;
    v2->_clients = (NSMapTable *)v6;

    uint64_t v8 = objc_opt_new();
    clientTracking = v2->_clientTracking;
    v2->_clientTracking = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    uwbSessionTracking = v2->_uwbSessionTracking;
    v2->_uwbSessionTracking = (NSMutableDictionary *)v10;

    if (+[NIPlatformInfo isInternalBuild]
      || (+[NSUserDefaults standardUserDefaults],
          BOOL v12 = objc_claimAutoreleasedReturnValue(),
          unsigned int v13 = [v12 BOOLForKey:@"EnableStateDump"],
          v12,
          v13))
    {
      uint64_t v15 = v2;
      os_state_add_handler();
    }
  }
  return v2;
}

- (optional<unsigned)_generateUwbSessionIdForNewServiceClientWithProcessName:(id)a3 parsedAccessoryConfigData:(const void *)a4 debugParameters:(id)a5
{
  id v41 = a3;
  id v40 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    uint64_t v8 = [v40 objectForKey:@"UWBSessionIdOverride"];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = v41;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = [v8 unsignedIntValue];
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#accessory-service,Generate UWB session ID - process %@ will use UWB session ID %u in overrides", buf, 0x12u);
        }

        LODWORD(v10) = [v8 unsignedIntValue];
        unint64_t v11 = 0;
        int v12 = v10 & 0xFFFFFF00;
        uint64_t v13 = (uint64_t)&_mh_execute_header;
        goto LABEL_28;
      }
    }
  }
  if (*((unsigned char *)a4 + 39))
  {
    v39 = a4;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3812000000;
    v61 = sub_1002AFAD8;
    v62 = nullsub_120;
    uint64_t v63 = 0;
    char v64 = 0;
    char v65 = 0;
    do
    {
      v14 = +[NSUserDefaults standardUserDefaults];
      unsigned int v15 = [v14 BOOLForKey:@"AccessoryUse32BitUwbSessionId"];

      if (v15)
      {
        LODWORD(v51) = 0;
        objc_super v16 = NSRandomData();
        [v16 getBytes:&v51 length:4];
        int v17 = v51;
      }
      else
      {
        LOWORD(v51) = 0;
        objc_super v16 = NSRandomData();
        [v16 getBytes:&v51 length:2];
        int v17 = (unsigned __int16)v51;
      }

      uint64_t v18 = *(void *)&buf[8];
      *(_DWORD *)(*(void *)&buf[8] + 48) = v17;
      *(unsigned char *)(v18 + 52) = 1;
      uwbSessionTracking = self->_uwbSessionTracking;
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_1002AFAF0;
      v55[3] = &unk_10085D960;
      v55[4] = buf;
      [(NSMutableDictionary *)uwbSessionTracking enumerateKeysAndObjectsUsingBlock:v55];
    }
    while (!*(unsigned char *)(*(void *)&buf[8] + 52));
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x2020000000;
    char v54 = 0;
    __int16 v50 = 0;
    if (!*((unsigned char *)a4 + 39)) {
      sub_10000AE44();
    }
    sub_1002AFBE0((uint64_t)a4, (unsigned char *)&v50 + 1, &v50);
    char v20 = HIBYTE(v50);
    char v21 = v50;
    BOOL v22 = v50 != 0;
    v23 = self->_uwbSessionTracking;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1002AFC88;
    v42[3] = &unk_10085D988;
    id v24 = v41;
    BOOL v47 = v22;
    char v48 = v20;
    char v49 = v21;
    id v43 = v24;
    v44 = buf;
    v45 = &v51;
    v46 = v39;
    [(NSMutableDictionary *)v23 enumerateKeysAndObjectsUsingBlock:v42];
    if (!*(unsigned char *)(*(void *)&buf[8] + 52)) {
      __assert_rtn("-[NIServerNearbyAccessoryRangingService _generateUwbSessionIdForNewServiceClientWithProcessName:parsedAccessoryConfigData:debugParameters:]", "NIServerNearbyAccessoryRangingService.mm", 813, "uwbSessionId.has_value()");
    }
    int v25 = *((unsigned __int8 *)v52 + 24);
    id v26 = (id)qword_1008ABDE0;
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        if (!*(unsigned char *)(*(void *)&buf[8] + 52)) {
          sub_10000AE44();
        }
        int v28 = *(_DWORD *)(*(void *)&buf[8] + 48);
        *(_DWORD *)v56 = 138412546;
        id v57 = v24;
        __int16 v58 = 1024;
        int v59 = v28;
        v29 = "#accessory-service,Generate UWB session ID - process %@ will use existing UWB session ID %u";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v29, v56, 0x12u);
      }
    }
    else if (v27)
    {
      if (!*(unsigned char *)(*(void *)&buf[8] + 52)) {
        sub_10000AE44();
      }
      int v37 = *(_DWORD *)(*(void *)&buf[8] + 48);
      *(_DWORD *)v56 = 138412546;
      id v57 = v24;
      __int16 v58 = 1024;
      int v59 = v37;
      v29 = "#accessory-service,Generate UWB session ID - process %@ will use new UWB session ID %u";
      goto LABEL_26;
    }

    uint64_t v10 = *(void *)(*(void *)&buf[8] + 48);
    int v12 = v10 & 0xFFFFFF00;
    unint64_t v11 = v10 & 0xFFFFFF0000000000;
    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(buf, 8);
    uint64_t v13 = v10 & 0xFF00000000;
    goto LABEL_28;
  }
  uint64_t v30 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_100429DB0((uint64_t)v41, v30, v31, v32, v33, v34, v35, v36);
  }
  uint64_t v13 = 0;
  unint64_t v11 = 0;
  LOBYTE(v10) = 0;
  int v12 = 0;
LABEL_28:

  return (optional<unsigned int>)(v11 | v13 | v12 | v10);
}

- (void)_prepareUwbSessionTrackingObjectsForClientTracking:(id)a3 outServiceRequest:(void *)a4 outStartOptions:(void *)a5 outShareableConfigData:(id *)a6
{
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (*((unsigned char *)a4 + 504)) {
    *((unsigned char *)a4 + 504) = 0;
  }
  if (*((unsigned char *)a5 + 112)) {
    *((unsigned char *)a5 + 112) = 0;
  }
  *a6 = 0;
  if (v10)
  {
    v131 = a6;
    v133 = [v10 niConfiguration];
    unint64_t v11 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = [v10 processName];
      unsigned int v13 = [v10 uwbSessionId];
      v14 = [v133 debugParameters];
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v13;
      *(_WORD *)&buf[18] = 2112;
      *(void *)&buf[20] = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#accessory-service,Prep session objects: process %@, UWB session ID %u. Configuration debug parameters: %@", buf, 0x1Cu);
    }
    unsigned int v15 = v133;
    if (!+[NIPlatformInfo isInternalBuild])
    {
      objc_super v16 = [v133 debugParameters];
      if (v16)
      {
        int v17 = [v133 debugParameters];
        BOOL v18 = [v17 count] == 0;

        unsigned int v15 = v133;
        if (!v18) {
          goto LABEL_235;
        }
      }
    }
    if ([v15 dataExchangeDisabledAndUsingParameterOverrides])
    {
      id v19 = [v15 debugParameters];
      [(NIServerNearbyAccessoryRangingService *)self _prepareUwbSessionTrackingObjectsFromDebugParameters:v19 outServiceRequest:a4 outStartOptions:a5];

      goto LABEL_234;
    }
    if (!*((unsigned char *)[v10 parsedAccessoryConfigData] + 39))
    {
      if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
      {
LABEL_235:

        goto LABEL_236;
      }
      sub_100429E50();
LABEL_234:
      unsigned int v15 = v133;
      goto LABEL_235;
    }
    char v20 = (unsigned __int8 *)[v10 parsedAccessoryConfigData];
    if (!v20[39]) {
      sub_10000AE44();
    }
    int v130 = v20[32];
    int v21 = *(unsigned __int16 *)(v20 + 33);
    int v22 = v20[4];
    __int16 v155 = 0;
    v129 = v20;
    sub_1002AFBE0((uint64_t)v20, (unsigned char *)&v155 + 1, &v155);
    LODWORD(v128) = v155;
    HIDWORD(v128) = HIBYTE(v155);
    BOOL v132 = (HIBYTE(v155) | v155) != 0;
    v23 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = "Multicast SS-TWR";
      if (!v128) {
        id v24 = "Unicast";
      }
      if (HIDWORD(v128)) {
        id v24 = "Multicast aDS-TWR";
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "#accessory-service,Prep session objects: %s ranging mode", buf, 0xCu);
    }

    if (v132 && v130 == 1)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100429F2C();
      }
      goto LABEL_234;
    }
    v118 = v129 + 8;
    BOOL v25 = v129[8] && (v129[8] != 1 || v129[9]);
    if (*(unsigned __int16 *)((char *)v129 + 35) <= 0x64u) {
      BOOL v25 = 0;
    }
    BOOL v119 = v25;
    do
    {
      *(_WORD *)buf = 0;
      id v26 = NSRandomData();
      [v26 getBytes:buf length:2];
      int v27 = *(unsigned __int16 *)buf;
    }
    while (v27 == v21);
    int v28 = [v133 debugParameters];
    v124 = [v28 objectForKeyedSubscript:@"LocalAddressOverride"];

    if (v124)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        LOWORD(v27) = (unsigned __int16)[v124 intValue];
      }
    }
    v29 = NSRandomData();
    [v29 getBytes:buf length:6];

    __int16 v154 = *(_WORD *)&buf[4];
    int v153 = *(_DWORD *)buf;
    uint64_t v30 = [v133 debugParameters];
    v127 = [v30 objectForKeyedSubscript:@"STSInitVectorOverride"];

    if (v127)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v127 length] == (id)6) {
        [v127 getBytes:&v153 length:6];
      }
    }
    if (v128) {
      char v31 = 10;
    }
    else {
      char v31 = 0;
    }
    if (v128) {
      int v32 = 12;
    }
    else {
      int v32 = 6;
    }
    if (HIDWORD(v128)) {
      char v33 = 30;
    }
    else {
      char v33 = v31;
    }
    if (HIDWORD(v128)) {
      int v34 = 31;
    }
    else {
      int v34 = v32;
    }
    if (v128) {
      int v35 = 2400;
    }
    else {
      int v35 = 3600;
    }
    unsigned int v121 = v35;
    unsigned int v122 = v34;
    char v36 = sub_1002B138C(v130 != 1, v132);
    if ([v133 backgroundMode])
    {
      if (!v22)
      {
        if (v132)
        {
          int v117 = 0;
          unsigned __int16 v38 = 2160;
        }
        else
        {
          if (v130 == 1)
          {
            if (v36)
            {
              int v117 = 0;
              unsigned __int16 v38 = 1944;
              goto LABEL_91;
            }
LABEL_78:
            v39 = (uint64_t *)&unk_1008A7BA8;
            goto LABEL_90;
          }
          if ((v36 & 1) == 0)
          {
            int v111 = sub_1002B1440(qword_1008A7C08);
            unsigned __int16 v38 = v111;
            int v117 = 1;
            if (v111) {
              goto LABEL_91;
            }
            goto LABEL_238;
          }
          int v117 = 1;
          unsigned __int16 v38 = 162;
        }
LABEL_91:
        v44 = [v133 debugParameters];
        v125 = [v44 objectForKeyedSubscript:@"RangingIntervalMsOverride"];

        if (v125)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unsigned __int16 v38 = (unsigned __int16)[v125 unsignedIntValue];
            v45 = (id)qword_1008ABDE0;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v38;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "#accessory-service,Prep session objects: Ranging interval override via config debug option: %d ms", buf, 8u);
            }
          }
        }
        v46 = +[NSUserDefaults standardUserDefaults];
        v126 = [v46 objectForKey:@"NIAccessoryRangingIntervalMsOverride"];

        if (v126)
        {
          BOOL v47 = v133;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_102;
          }
          unsigned __int16 v38 = (unsigned __int16)[v126 unsignedIntValue];
          char v48 = (id)qword_1008ABDE0;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v38;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "#accessory-service,Prep session objects: Ranging interval override via defaults write: %d ms", buf, 8u);
          }
        }
        BOOL v47 = v133;
LABEL_102:
        double v49 = (double)v122 * (double)v121 / 1200.0;
        if (v49 <= 0.0)
        {
          v112 = "numMillisecondsPerRound > 0";
          int v113 = 240;
        }
        else
        {
          double v50 = ceil((double)v38 / v49);
          if (v50 <= 0.0)
          {
            v112 = "numRoundsPerBlockAsDouble > 0";
            int v113 = 244;
          }
          else
          {
            if (v50 < 65535.0)
            {
              LOBYTE(v51) = !v132 && [v47 backgroundMode] == 0;
              v52 = +[NSUserDefaults standardUserDefaults];
              v123 = [v52 objectForKey:@"NIAccessoryUseDedicatedAntennasOverride"];

              if (v123)
              {
                uint64_t v53 = v133;
                objc_opt_class();
                char v54 = v129;
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_114;
                }
                unsigned int v51 = [v123 BOOLValue];
                v55 = (id)qword_1008ABDE0;
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)&buf[4] = v51;
                  _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "#accessory-service,Prep session objects: Use dedicated antennas via defaults write: %d", buf, 8u);
                }
              }
              uint64_t v53 = v133;
              char v54 = v129;
LABEL_114:
              __int16 v137 = 0;
              char v138 = 0;
              unsigned int v139 = [v10 uwbSessionId];
              __int16 v140 = v121;
              __int16 v141 = v122;
              __int16 v142 = (int)v50;
              int v143 = v153;
              __int16 v144 = v154;
              uint64_t v56 = *(unsigned __int16 *)((char *)v54 + 33);
              if (v132 && v130 != 1) {
                uint64_t v56 = 0;
              }
              uint64_t v145 = (unsigned __int16)v27;
              uint64_t v146 = v56;
              uint64_t v147 = 0x400000003;
              char v148 = v51;
              __int16 v149 = 257;
              BOOL v150 = v119;
              int v151 = 50528256;
              int v152 = 6;
              if (HIDWORD(v128))
              {
                LOBYTE(v151) = 1;
              }
              else
              {
                if (!v128) {
                  goto LABEL_121;
                }
                BYTE1(v151) = 1;
              }
              HIBYTE(v151) = v33;
              BYTE2(v151) = v33;
LABEL_121:
              id v57 = sub_1002F6464();
              uint64_t v58 = v57[406];
              int v59 = (std::__shared_weak_count *)v57[407];
              if (v59) {
                atomic_fetch_add_explicit(&v59->__shared_owners_, 1uLL, memory_order_relaxed);
              }
              v120 = v59;
              if (!v58)
              {
                if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
                  sub_100429E84();
                }
                goto LABEL_231;
              }
              if (!sub_1002CE2DC(v58, (char *)&v137, (unsigned __int8 *)&v137 + 1, 0))
              {
                if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
                  sub_100429EF8();
                }
                goto LABEL_231;
              }
              sub_1002CEA1C(v58, v135);
              unint64_t v60 = v136;
              if ((v136 & 0x80u) != 0) {
                unint64_t v60 = (unint64_t)v135[1];
              }
              if (!v60)
              {
                if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
                  sub_100429EB8();
                }
                goto LABEL_229;
              }
              if (v130 == 1) {
                sub_100180A9C((char *)&v137, (uint64_t)buf);
              }
              else {
                sub_100180748((char *)&v137, (uint64_t)buf);
              }
              int v61 = *((unsigned __int8 *)a4 + 504);
              memcpy(a4, buf, 0x1F8uLL);
              if (!v61) {
                *((unsigned char *)a4 + 504) = 1;
              }
              id v116 = [v53 backgroundMode];
              id v62 = [v53 backgroundMode];
              int v63 = (int)v50;
              if (v62 == (id)1)
              {
                *((_DWORD *)a4 + 17) |= 0xDu;
                *((void *)a4 + 9) = -4275240961;
                *((_WORD *)a4 + 40) = -1;
                *((unsigned char *)a4 + 82) = 0;
                *(_WORD *)((char *)a4 + 83) = -1;
              }
              else if (v62 == (id)2)
              {
                *((_DWORD *)a4 + 17) |= 0xBu;
                char v64 = +[NSUserDefaults standardUserDefaults];
                char v65 = [v64 objectForKey:@"NIBackgroundAccessoryTimeoutSecondsOverride_InactivityBeforeTracking"];

                v66 = +[NSUserDefaults standardUserDefaults];
                v67 = [v66 objectForKey:@"NIBackgroundAccessoryTimeoutSecondsOverride_InactivityAfterTracking"];

                v68 = +[NSUserDefaults standardUserDefaults];
                v69 = [v68 objectForKey:@"NIBackgroundAccessoryTimeoutSecondsOverride_TotalJobTime"];

                if (v65 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
                  unsigned __int16 v70 = (unsigned __int16)[v65 unsignedIntValue];
                }
                else {
                  unsigned __int16 v70 = -1;
                }
                if (v67 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
                  unsigned __int16 v71 = (unsigned __int16)[v67 unsignedIntValue];
                }
                else {
                  unsigned __int16 v71 = -1;
                }
                if (v69 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
                  unsigned __int16 v72 = (unsigned __int16)[v69 unsignedIntValue];
                }
                else {
                  unsigned __int16 v72 = 7200;
                }
                *((_WORD *)a4 + 36) = v70;
                *((_WORD *)a4 + 37) = v71;
                *((_WORD *)a4 + 38) = -1;
                *((_WORD *)a4 + 39) = v72;
                *((_WORD *)a4 + 40) = -1;
                *((unsigned char *)a4 + 82) = 0;
                *(_WORD *)((char *)a4 + 83) = -1;

                uint64_t v53 = v133;
                char v54 = v129;
                int v63 = (int)v50;
              }
              if (*((unsigned char *)a4 + 68))
              {
                v73 = (id)qword_1008ABDE0;
                if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned int v74 = [v10 uwbSessionId];
                  int v75 = *((unsigned __int16 *)a4 + 36);
                  int v76 = *((unsigned __int16 *)a4 + 37);
                  int v77 = *((unsigned __int16 *)a4 + 38);
                  int v78 = *((unsigned __int16 *)a4 + 39);
                  *(_DWORD *)buf = 67110144;
                  *(_DWORD *)&buf[4] = v74;
                  *(_WORD *)&buf[8] = 1024;
                  *(_DWORD *)&buf[10] = v75;
                  *(_WORD *)&buf[14] = 1024;
                  *(_DWORD *)&buf[16] = v76;
                  *(_WORD *)&buf[20] = 1024;
                  *(_DWORD *)&buf[22] = v77;
                  *(_WORD *)&buf[26] = 1024;
                  *(_DWORD *)&buf[28] = v78;
                  _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "#accessory-service,Prep session objects: UWB session ID %u enables AP sleep operation. Timeouts: discovery %d, reacq %d, tracking %d, job %d", buf, 0x20u);
                }

                uint64_t v53 = v133;
                char v54 = v129;
                int v63 = (int)v50;
              }
              if (v117)
              {
                v79 = (id)qword_1008ABDE0;
                if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "#accessory-service,Prep session objects: Automatic subrating in AOP enabled", buf, 2u);
                }

                *((_DWORD *)a4 + 17) |= 0x20u;
                sub_1002B149C(__p);
                uint64_t v80 = 0;
                char v81 = 1;
                while (1)
                {
                  v82 = &__p[3 * v80];
                  if (*(unsigned __int8 *)v82 >= 0xFu) {
                    unsigned int v83 = 15;
                  }
                  else {
                    unsigned int v83 = *(unsigned __int8 *)v82;
                  }
                  double v84 = *((double *)v82 + 1);
                  double v85 = *((double *)v82 + 2);
                  unint64_t v86 = vcvtd_n_u64_f64(v84, 2uLL);
                  if (v86 >= 0x7F) {
                    unint64_t v86 = 127;
                  }
                  char v87 = v81;
                  unint64_t v88 = vcvtd_n_u64_f64(v85, 2uLL);
                  if (v84 <= 0.0) {
                    unint64_t v89 = 0;
                  }
                  else {
                    unint64_t v89 = v86;
                  }
                  if (v88 >= 0xF) {
                    unint64_t v88 = 15;
                  }
                  unint64_t v90 = v85 <= 0.0 ? 0 : v88;
                  v91 = (id)qword_1008ABDE0;
                  BOOL v92 = os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT);
                  if (!v83) {
                    break;
                  }
                  if (v92)
                  {
                    *(_DWORD *)buf = 67110400;
                    *(_DWORD *)&buf[4] = v80;
                    *(_WORD *)&buf[8] = 1024;
                    *(_DWORD *)&buf[10] = v83;
                    *(_WORD *)&buf[14] = 2048;
                    *(void *)&buf[16] = v89;
                    *(_WORD *)&unsigned char buf[24] = 2048;
                    *(double *)&buf[26] = (double)v89 * 0.25;
                    *(_WORD *)&buf[34] = 2048;
                    *(void *)&buf[36] = v90;
                    *(_WORD *)&buf[44] = 2048;
                    *(double *)&buf[46] = (double)v90 * 0.25;
                    _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "#accessory-service,Prep session objects: Subrating config %d: [subrate %d, dist_0_25_m %llu (%0.2f m), hyst_0_25_m %llu (%0.2f m)", buf, 0x36u);
                  }

                  if (!v89) {
                    goto LABEL_193;
                  }
                  uint64_t v93 = 0;
                  char v94 = 1;
                  while (1)
                  {
                    char v95 = v94;
                    v96 = (char *)a4 + 2 * v93;
                    __int16 v98 = *(_WORD *)(v96 + 87);
                    v97 = v96 + 87;
                    if ((v98 & 1) == 0) {
                      break;
                    }
                    char v94 = 0;
                    uint64_t v93 = 1;
                    if ((v95 & 1) == 0) {
                      goto LABEL_193;
                    }
                  }
                  if ((v94 & 1) == 0)
                  {
                    unsigned int v99 = *(unsigned __int16 *)((char *)a4 + 87);
                    if (((v99 >> 1) & 0xF) >= v83 || ((v99 >> 5) & 0x7F) >= (unsigned __int16)v89)
                    {
LABEL_193:
                      v91 = (id)qword_1008ABDE0;
                      if (os_log_type_enabled(v91, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = 67109120;
                        *(_DWORD *)&buf[4] = v80;
                        _os_log_fault_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_FAULT, "#accessory-service,Prep session objects: Error adding subrating config %d", buf, 8u);
                      }
LABEL_195:

                      goto LABEL_196;
                    }
                  }
                  _WORD *v97 = (32 * (v89 & 0x7F)) | (2 * (v83 & 0x7F)) | ((_WORD)v90 << 12) | 1;
LABEL_196:
                  char v81 = 0;
                  uint64_t v80 = 1;
                  if ((v87 & 1) == 0)
                  {
                    uint64_t v53 = v133;
                    char v54 = v129;
                    int v63 = (int)v50;
                    goto LABEL_198;
                  }
                }
                if (v92)
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)&buf[4] = v80;
                  _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "#accessory-service,Prep session objects: Subrating config %d is empty", buf, 8u);
                }
                goto LABEL_195;
              }
LABEL_198:
              int v100 = sub_1002B195C((uint64_t)[v53 backgroundMode]);
              if (sub_1002B138C(v130 != 1, v132)) {
                __int16 v101 = 276;
              }
              else {
                __int16 v101 = 0;
              }
              *((void *)a5 + 8) = 0;
              *((void *)a5 + 9) = 0;
              *(void *)((char *)a5 + 78) = 0;
              *((void *)a5 + 12) = 0;
              *((void *)a5 + 13) = 0;
              *((void *)a5 + 11) = 0;
              int v102 = *((unsigned __int8 *)a5 + 112);
              *(unsigned char *)a5 = 0;
              *((unsigned char *)a5 + 40) = 0;
              *((void *)a5 + 6) = 250000;
              *((unsigned char *)a5 + 56) = 1;
              *((_DWORD *)a5 + 15) = v100;
              *((_WORD *)a5 + 43) = v101;
              if (!v102) {
                *((unsigned char *)a5 + 112) = 1;
              }
              if (*((unsigned char *)a4 + 355))
              {
                if (!v132) {
                  goto LABEL_207;
                }
                if (*((unsigned char *)a4 + 435))
                {
                  if (*((unsigned char *)a4 + 437))
                  {
LABEL_207:
                    LODWORD(__p[0]) = 131073;
                    unsigned int v103 = *v118;
                    if (v103 > 1 || v103 == 1 && (unsigned __int16)v54[9] >= 3u) {
                      v118 = (unsigned __int16 *)__p;
                    }
                    if (v137 == 5) {
                      char v104 = 5;
                    }
                    else {
                      char v104 = 9;
                    }
                    char v105 = sub_1002B1C9C(*((unsigned __int8 *)a4 + 354));
                    int v106 = [v10 uwbSessionId];
                    if (v116) {
                      __int16 v107 = 200;
                    }
                    else {
                      __int16 v107 = 100;
                    }
                    if (v128) {
                      char v108 = 3;
                    }
                    else {
                      char v108 = 2;
                    }
                    if (HIDWORD(v128)) {
                      char v108 = 8;
                    }
                    char v109 = v132;
                    if (v132)
                    {
                      if (!*((unsigned char *)a4 + 437) || !*((unsigned char *)a4 + 435)) {
                        sub_10000AE44();
                      }
                      char v109 = *((unsigned char *)a4 + 436);
                      char v110 = *((unsigned char *)a4 + 434);
                    }
                    else
                    {
                      char v110 = 0;
                    }
                    sub_1002B1A88(v118, (uint64_t)v135, v104, v105, v106, v121, v122, v63, (uint64_t)buf, v149 != 0, (uint64_t)&v153, v27, v107, v132, v108, v109, v110);
                    sub_1002B1E74((__int16 *)buf, __p);
                    id *v131 = +[NSData dataWithBytes:__p[0] length:(char *)__p[1] - (char *)__p[0]];
                    if (__p[0])
                    {
                      __p[1] = __p[0];
                      operator delete(__p[0]);
                    }
LABEL_229:
                    if ((char)v136 < 0) {
                      operator delete(v135[0]);
                    }
LABEL_231:
                    if (v120) {
                      sub_10001A970(v120);
                    }

                    goto LABEL_234;
                  }
                  v114 = "req.range_enable_params.fira.cap_size_max.has_value()";
                  int v115 = 1237;
                }
                else
                {
                  v114 = "req.range_enable_params.fira.cap_size_min.has_value()";
                  int v115 = 1236;
                }
              }
              else
              {
                v114 = "req.range_enable_params.fira.preamble.has_value()";
                int v115 = 1233;
              }
              __assert_rtn("-[NIServerNearbyAccessoryRangingService _prepareUwbSessionTrackingObjectsForClientTracking:outServiceRequest:outStartOptions:outShareableConfigData:]", "NIServerNearbyAccessoryRangingService.mm", v115, v114);
            }
            v112 = "numRoundsPerBlockAsDouble < std::numeric_limits<uint16_t>::max()";
            int v113 = 245;
          }
        }
        __assert_rtn("NumRoundsPerRangingBlock", "NIFiRaDefinitions.h", v113, v112);
      }
      if (v22 != 10)
      {
        if (v22 != 20) {
          goto LABEL_238;
        }
        char v37 = v132 | v36;
        if (v132) {
          unsigned __int16 v38 = 450;
        }
        else {
          unsigned __int16 v38 = 486;
        }
        if ((v37 & 1) == 0)
        {
          v39 = (uint64_t *)&unk_1008A7B48;
          goto LABEL_90;
        }
        goto LABEL_85;
      }
      char v41 = v132 | v36;
      if (v132) {
        unsigned __int16 v38 = 2160;
      }
      else {
        unsigned __int16 v38 = 1944;
      }
      if ((v41 & 1) == 0) {
        goto LABEL_78;
      }
LABEL_85:
      int v117 = 0;
      goto LABEL_91;
    }
    if (v22)
    {
      if (v22 == 10)
      {
        char v42 = v132 | v36;
        if (v132) {
          unsigned __int16 v38 = 1080;
        }
        else {
          unsigned __int16 v38 = 972;
        }
        if ((v42 & 1) == 0)
        {
          v39 = (uint64_t *)&unk_1008A7AE8;
LABEL_90:
          int v43 = sub_1002B1440(v39);
          unsigned __int16 v38 = v43;
          int v117 = 0;
          if (v43) {
            goto LABEL_91;
          }
LABEL_238:
          __assert_rtn("-[NIServerNearbyAccessoryRangingService _prepareUwbSessionTrackingObjectsForClientTracking:outServiceRequest:outStartOptions:outShareableConfigData:]", "NIServerNearbyAccessoryRangingService.mm", 1019, "rangingIntervalMsec > 0");
        }
        goto LABEL_85;
      }
      if (v22 != 20) {
        goto LABEL_238;
      }
    }
    char v40 = v132 | v36;
    if (v132) {
      unsigned __int16 v38 = 180;
    }
    else {
      unsigned __int16 v38 = 162;
    }
    if ((v40 & 1) == 0)
    {
      v39 = (uint64_t *)&unk_1008A7A88;
      goto LABEL_90;
    }
    goto LABEL_85;
  }
LABEL_236:
}

- (void)_prepareUwbSessionTrackingObjectsFromDebugParameters:(id)a3 outServiceRequest:(void *)a4 outStartOptions:(void *)a5
{
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v8) {
    __assert_rtn("-[NIServerNearbyAccessoryRangingService _prepareUwbSessionTrackingObjectsFromDebugParameters:outServiceRequest:outStartOptions:]", "NIServerNearbyAccessoryRangingService.mm", 1266, "debugParameters");
  }
  if (*((unsigned char *)a4 + 504)) {
    *((unsigned char *)a4 + 504) = 0;
  }
  if (*((unsigned char *)a5 + 112)) {
    *((unsigned char *)a5 + 112) = 0;
  }
  uint64_t v94 = 0;
  char v95 = &v94;
  uint64_t v96 = 0x2020000000;
  char v97 = 0;
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_1002B29DC;
  v91[3] = &unk_10085D9B0;
  id v9 = v8;
  id v92 = v9;
  uint64_t v93 = &v94;
  [&off_1008785B0 enumerateObjectsUsingBlock:v91];
  if (!*((unsigned char *)v95 + 24))
  {
    id v10 = [v9 objectForKeyedSubscript:@"InitiatorRoleOverride"];
    char v64 = [v9 objectForKeyedSubscript:@"UWBChannelOverride"];
    unsigned __int16 v71 = [v9 objectForKeyedSubscript:@"UWBSessionIdOverride"];
    unsigned __int16 v70 = [v9 objectForKeyedSubscript:@"NumRSTUsPerSlotOverride"];
    v69 = [v9 objectForKeyedSubscript:@"NumSlotsPerRoundOverride"];
    v68 = [v9 objectForKeyedSubscript:@"NumRoundsPerBlockOverride"];
    unsigned __int16 v72 = [v9 objectForKeyedSubscript:@"STSInitVectorOverride"];
    v67 = [v9 objectForKeyedSubscript:@"LocalAddressOverride"];
    v66 = [v9 objectForKeyedSubscript:@"PeerAddressOverride"];
    char v65 = [v9 objectForKeyedSubscript:@"UseDedicatedAntennaOverride"];
    int v63 = [v9 objectForKeyedSubscript:@"RangingModeOverride"];
    uint64_t v56 = [v9 objectForKeyedSubscript:@"MulticastCapSizeMaxOverride"];
    v55 = [v9 objectForKeyedSubscript:@"MulticastCapSizeMinOverride"];
    id v62 = [v9 objectForKeyedSubscript:@"SBREnabledLocallyOverride"];
    unint64_t v11 = [v9 objectForKeyedSubscript:@"SBREnabledRemotelyOverride"];
    uint64_t v58 = [v9 objectForKeyedSubscript:@"StartTimeOffsetUsecOverride"];
    id v57 = [v9 objectForKeyedSubscript:@"StartTimeUncertaintyUsecOverride"];
    int v59 = [v9 objectForKeyedSubscript:@"InitiatorCrossSessionOffsetMsecOverride"];
    int v61 = [v9 objectForKeyedSubscript:@"AOPSubratingEnabledOverride"];
    unint64_t v60 = [v9 objectForKeyedSubscript:@"AOPSubratingOverride_Config0_Subrate"];
    uint64_t v53 = [v9 objectForKeyedSubscript:@"AOPSubratingOverride_Config0_DistanceThresholdMeters"];
    char v54 = [v9 objectForKeyedSubscript:@"AOPSubratingOverride_Config0_HysteresisMeters"];
    v52 = [v9 objectForKeyedSubscript:@"AOPSubratingOverride_Config1_Subrate"];
    int v12 = [v9 objectForKeyedSubscript:@"AOPSubratingOverride_Config1_DistanceThresholdMeters"];
    unsigned int v13 = [v9 objectForKeyedSubscript:@"AOPSubratingOverride_Config1_HysteresisMeters"];
    unsigned int v14 = [v10 BOOLValue];
    [v72 getBytes:&v89 length:6];
    __int16 v73 = 0;
    char v74 = 0;
    unsigned int v75 = [v71 unsignedIntValue];
    unsigned __int16 v76 = (unsigned __int16)[v70 unsignedShortValue];
    unsigned __int16 v77 = (unsigned __int16)[v69 unsignedShortValue];
    unsigned __int16 v78 = (unsigned __int16)[v68 unsignedShortValue];
    int v79 = v89;
    __int16 v80 = v90;
    id v81 = [v67 unsignedLongLongValue];
    id v82 = [v66 unsignedLongLongValue];
    uint64_t v83 = 0x400000003;
    unsigned __int8 v84 = [v65 BOOLValue];
    __int16 v85 = 257;
    unsigned __int8 v86 = [v11 BOOLValue];
    int v87 = 50528256;
    int v88 = 6;
    unsigned __int16 v15 = sub_1003A9058((unsigned __int16)[v64 unsignedIntValue] | 0x10000u);
    if (v15 < 0x100u)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10042A0C8();
      }
LABEL_72:

      goto LABEL_73;
    }
    LOBYTE(v73) = v15;
    if ([v63 isEqualToString:@"Multicast aDS-TWR"])
    {
      objc_super v16 = sub_100007D00();
      if (!sub_1003D2E64((uint64_t)v16))
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_10042A164();
        }
        goto LABEL_72;
      }
      LOBYTE(v87) = 1;
    }
    else
    {
      if (![v63 isEqualToString:@"Multicast SS-TWR"]) {
        goto LABEL_18;
      }
      BYTE1(v87) = 1;
    }
    HIBYTE(v87) = [v56 unsignedIntValue];
    BYTE2(v87) = [v55 unsignedIntValue];
LABEL_18:
    int v17 = v10;
    if (v14) {
      sub_100180748((char *)&v73, (uint64_t)__src);
    }
    else {
      sub_100180A9C((char *)&v73, (uint64_t)__src);
    }
    int v18 = *((unsigned __int8 *)a4 + 504);
    memcpy(a4, __src, 0x1F8uLL);
    if (!v18) {
      *((unsigned char *)a4 + 504) = 1;
    }
    id v10 = v17;
    if ([v62 BOOLValue])
    {
      if (!*((unsigned char *)a4 + 504)) {
        goto LABEL_77;
      }
      *((_DWORD *)a4 + 17) |= 8u;
    }
    if ([v61 BOOLValue] && (int)objc_msgSend(v60, "intValue") >= 1)
    {
      if (!*((unsigned char *)a4 + 504)) {
        goto LABEL_77;
      }
      unsigned __int8 v19 = [v60 intValue];
      [v53 doubleValue];
      double v21 = v20;
      [v54 doubleValue];
      unint64_t v23 = vcvtd_n_u64_f64(v21, 2uLL);
      if (v23 >= 0x7F) {
        LOBYTE(v23) = 127;
      }
      if (v21 <= 0.0) {
        unsigned __int8 v24 = 0;
      }
      else {
        unsigned __int8 v24 = v23;
      }
      unint64_t v25 = vcvtd_n_u64_f64(v22, 2uLL);
      if (v25 >= 0xF) {
        LOWORD(v25) = 15;
      }
      if (!v19 || !v24) {
        goto LABEL_70;
      }
      unsigned __int8 v26 = v19;
      uint64_t v27 = 0;
      int v28 = (char *)a4 + 68;
      char v29 = 1;
      while (1)
      {
        char v30 = v29;
        char v31 = (char *)a4 + 2 * v27;
        __int16 v33 = *(_WORD *)(v31 + 87);
        int v32 = v31 + 87;
        if ((v33 & 1) == 0) {
          break;
        }
        char v29 = 0;
        uint64_t v27 = 1;
        if ((v30 & 1) == 0) {
          goto LABEL_70;
        }
      }
      if ((v29 & 1) == 0)
      {
        unsigned int v51 = *(unsigned __int16 *)((char *)a4 + 87);
        if (((v51 >> 1) & 0xF) >= v26 || ((v51 >> 5) & 0x7F) >= v24)
        {
LABEL_70:
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
            sub_10042A0FC();
          }
          goto LABEL_72;
        }
      }
      __int16 v34 = (_WORD)v25 << 12;
      if (v22 <= 0.0) {
        __int16 v34 = 0;
      }
      *int v32 = v34 & 0xF001 | (2 * (v26 & 0xF)) & 0x1F | (32 * (v24 & 0x7F)) | 1;
      if ((int)[v52 intValue] >= 1)
      {
        if (*((unsigned char *)a4 + 504))
        {
          unsigned __int8 v35 = [v52 intValue];
          [v12 doubleValue];
          double v37 = v36;
          [v13 doubleValue];
          unint64_t v39 = vcvtd_n_u64_f64(v37, 2uLL);
          if (v39 >= 0x7F) {
            LODWORD(v39) = 127;
          }
          unint64_t v40 = vcvtd_n_u64_f64(v38, 2uLL);
          if (v37 <= 0.0) {
            unsigned int v41 = 0;
          }
          else {
            unsigned int v41 = v39;
          }
          __int16 v42 = 15;
          if (v40 < 0xF) {
            __int16 v42 = v40;
          }
          if (v38 <= 0.0) {
            __int16 v43 = 0;
          }
          else {
            __int16 v43 = v42;
          }
          if ((sub_1002B18D4((uint64_t)v28, v35, v41, v43) & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
              sub_10042A130();
            }
            goto LABEL_72;
          }
          goto LABEL_60;
        }
LABEL_77:
        sub_10000AE44();
      }
    }
LABEL_60:
    if (v59) {
      unsigned int v44 = v14;
    }
    else {
      unsigned int v44 = 0;
    }
    v45 = v10;
    if (v44 == 1)
    {
      unsigned __int8 v46 = [v59 unsignedIntValue];
      __int16 v47 = 1;
    }
    else
    {
      unsigned __int8 v46 = 0;
      __int16 v47 = 0;
    }
    unsigned int v48 = [v58 intValue];
    unsigned int v49 = [v57 intValue];
    *((void *)a5 + 8) = 0;
    *((void *)a5 + 9) = 0;
    *(void *)((char *)a5 + 78) = 0;
    *((void *)a5 + 12) = 0;
    *((void *)a5 + 13) = 0;
    *((void *)a5 + 11) = 0;
    int v50 = *((unsigned __int8 *)a5 + 112);
    *(unsigned char *)a5 = 0;
    *((unsigned char *)a5 + 40) = 0;
    *((void *)a5 + 6) = v48;
    *((unsigned char *)a5 + 56) = 1;
    *((_DWORD *)a5 + 15) = v49;
    *((_WORD *)a5 + 43) = v46 | (unsigned __int16)(v47 << 8);
    id v10 = v45;
    if (!v50) {
      *((unsigned char *)a5 + 112) = 1;
    }
    goto LABEL_72;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10042A198();
  }
LABEL_73:

  _Block_object_dispose(&v94, 8);
}

- (BOOL)_buildAndRunRangingSession:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uwbSessionTracking = self->_uwbSessionTracking;
  uint64_t v6 = +[NSNumber numberWithUnsignedInt:v3];
  v7 = [(NSMutableDictionary *)uwbSessionTracking objectForKey:v6];

  if (!v7)
  {
    BOOL v19 = 0;
    goto LABEL_24;
  }
  id v8 = self;
  std::to_string(&v22, v3);
  id v9 = [v7 serviceRequest];
  id v10 = sub_1002F6464();
  uint64_t v12 = *((void *)v10 + 20);
  unint64_t v11 = (std::__shared_weak_count *)*((void *)v10 + 21);
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unsigned int v13 = (std::__shared_weak_count *)operator new(0x5D8uLL);
  v13->__shared_owners_ = 0;
  v13->__shared_weak_owners_ = 0;
  v13->__vftable = (std::__shared_weak_count_vtbl *)off_10085DB00;
  unsigned int v14 = v8;
  v35[0] = off_10085DB50;
  v35[1] = v14;
  int v36 = v3;
  double v37 = v35;
  unsigned __int16 v15 = v14;
  v32[0] = off_10085DBF8;
  v32[1] = v15;
  int v33 = v3;
  __int16 v34 = v32;
  objc_super v16 = v15;
  v29[0] = off_10085DC98;
  v29[1] = v16;
  int v30 = v3;
  char v31 = v29;
  v28[3] = 0;
  v27[3] = 0;
  uint64_t v25 = v12;
  unsigned __int8 v26 = v11;
  sub_1002DE010(&v13[1].__vftable, (long long *)&v22, v9, (uint64_t)v35, (uint64_t)v32, (uint64_t)v29, (uint64_t)v28, (uint64_t)v27, &v25);
  if (v26) {
    sub_10001A970(v26);
  }
  sub_1001D2B78(v27);
  sub_1001D2BFC(v28);
  sub_1001E1258(v29);
  sub_1001D2C80(v32);
  sub_1001D2D04(v35);
  unint64_t v23 = v13 + 1;
  unsigned __int8 v24 = v13;
  sub_10001ABCC((uint64_t)&v23, &v13[1].__shared_weak_owners_, (uint64_t)&v13[1]);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  if (v23)
  {
    int v17 = sub_1002D85F4((uint64_t)v23);
    if (v17)
    {
      int v18 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        sub_1002DE064(v17, v35);
        sub_10042A2C0();
      }
    }
    else
    {
      int v20 = sub_1002DB434((uint64_t)v23, (long long *)[v7 startOptions]);
      if (!v20)
      {
        [v7 setRangingSession:&v23];
        BOOL v19 = 1;
        goto LABEL_21;
      }
      int v18 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        sub_1002DE064(v20, v35);
        sub_10042A26C();
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
  {
    sub_10042A238();
  }
  BOOL v19 = 0;
LABEL_21:
  if (v24) {
    sub_10001A970(v24);
  }

LABEL_24:
  return v19;
}

- (void)_updateUwbSessionState:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uwbSessionTracking = self->_uwbSessionTracking;
  unsigned int v20 = v3;
  uint64_t v6 = +[NSNumber numberWithUnsignedInt:v3];
  v7 = [(NSMutableDictionary *)uwbSessionTracking objectForKey:v6];

  if (v7) {
    BOOL v8 = *(void *)[v7 rangingSession] != 0;
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = [v7 interestedClients];
  if ([v9 count]) {
    unsigned int v10 = 1;
  }
  else {
    unsigned int v10 = [v7 persistWhileDetached];
  }

  uint64_t v22 = 0;
  unint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  unint64_t v11 = [v7 interestedClients];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1002B3278;
  v21[3] = &unk_10085D9D8;
  void v21[4] = self;
  v21[5] = &v22;
  [v11 enumerateObjectsUsingBlock:v21];

  uint64_t v12 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *((unsigned __int8 *)v23 + 24);
    unsigned int v14 = [v7 interestedClients];
    unsigned int v15 = [v14 count];
    unsigned int v16 = [v7 persistWhileDetached];
    *(_DWORD *)buf = 67110656;
    unsigned int v27 = v20;
    __int16 v28 = 1024;
    BOOL v29 = v7 != 0;
    __int16 v30 = 1024;
    BOOL v31 = v8;
    __int16 v32 = 1024;
    unsigned int v33 = v10;
    __int16 v34 = 1024;
    int v35 = v13;
    __int16 v36 = 1024;
    unsigned int v37 = v15;
    __int16 v38 = 1024;
    unsigned int v39 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#accessory-service,Update session state for UWB session ID %u. Currently: tracking %d, ranging %d. Should be: tracking %d, ranging %d. Clients: %d. Persist-detached: %d.", buf, 0x2Cu);
  }
  if ((v7 != 0) | (v10 ^ 1) & 1)
  {
    if (v7) {
      char v17 = v10;
    }
    else {
      char v17 = 1;
    }
    if (v17)
    {
      if (v7)
      {
        if (v8)
        {
          if (!*((unsigned char *)v23 + 24)) {
            [v7 stopRanging];
          }
        }
        else if (*((unsigned char *)v23 + 24))
        {
          if (*(void *)[v7 rangingSession]) {
            __assert_rtn("-[NIServerNearbyAccessoryRangingService _updateUwbSessionState:]", "NIServerNearbyAccessoryRangingService.mm", 1541, "uwbSessionTracking.rangingSession == nullptr");
          }
          if (![(NIServerNearbyAccessoryRangingService *)self _buildAndRunRangingSession:v20])[(NIServerNearbyAccessoryRangingService *)self _relayToClientsOfUWBSessionId:v20 blockToRelay:&stru_10085DA18]; {
        }
          }
      }
    }
    else
    {
      [v7 stopRanging];
      int v18 = self->_uwbSessionTracking;
      BOOL v19 = +[NSNumber numberWithUnsignedInt:v20];
      [(NSMutableDictionary *)v18 removeObjectForKey:v19];
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
  {
    sub_10042A314();
  }
  _Block_object_dispose(&v22, 8);
}

- (void)_cleanupExcessiveDetachedSessions
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = +[NSUserDefaults standardUserDefaults];
  dispatch_queue_t v4 = [v3 objectForKey:@"NIAccessoryMaxDetachedSessionsOverride"];

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned int v5 = [v4 unsignedIntValue];
  }
  else {
    unsigned int v5 = 12;
  }
  uint64_t v6 = objc_opt_new();
  uwbSessionTracking = self->_uwbSessionTracking;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002B3518;
  v11[3] = &unk_10085DA40;
  id v8 = v6;
  id v12 = v8;
  [(NSMutableDictionary *)uwbSessionTracking enumerateKeysAndObjectsUsingBlock:v11];
  if ((unint64_t)[v8 count] > v5)
  {
    id v9 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = [v8 count];
      *(_DWORD *)buf = 67109376;
      unsigned int v14 = v10;
      __int16 v15 = 1024;
      unsigned int v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#accessory-service,Cleaning up detached sessions. %d found, exceeds max of %d", buf, 0xEu);
    }

    [(NSMutableDictionary *)self->_uwbSessionTracking removeObjectsForKeys:v8];
  }
}

- (void)_serviceRequestForUWBSessionID:(unsigned int)a3 didUpdateStatus:(ServiceRequestStatusUpdate)a4
{
  int var2 = a4.var2;
  uint64_t v5 = *(void *)&a4.var0;
  uint64_t v6 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    sub_100004950(v36, off_10085DE50[v5 >> 32]);
    int v9 = v37;
    unsigned int v10 = (void **)v36[0];
    sub_100004950(__p, off_10085DEC8[var2]);
    unint64_t v11 = v36;
    if (v9 < 0) {
      unint64_t v11 = v10;
    }
    if (v35 >= 0) {
      id v12 = __p;
    }
    else {
      id v12 = (void **)__p[0];
    }
    LODWORD(buf) = 67109634;
    HIDWORD(buf) = v6;
    __int16 v39 = 2080;
    unint64_t v40 = v11;
    __int16 v41 = 2080;
    __int16 v42 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#accessory-service,Service request status update for UWB session ID %u. Event type: %s. Reason: %s", (uint8_t *)&buf, 0x1Cu);
    if (v35 < 0) {
      operator delete(__p[0]);
    }
    if (v37 < 0) {
      operator delete(v36[0]);
    }
  }

  uwbSessionTracking = self->_uwbSessionTracking;
  unsigned int v14 = +[NSNumber numberWithUnsignedInt:v6];
  __int16 v15 = [(NSMutableDictionary *)uwbSessionTracking objectForKey:v14];

  if (!v15 || (v5 & 0xFFFFFFFF00000000) != 0x200000000 || (var2 - 9) > 1) {
    goto LABEL_22;
  }
  if ([v15 rangingRetryCount] > 7)
  {
    unsigned __int8 v26 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      id buf = (id)0x804000100;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#accessory-service,Max # of retries (%d) reached. Stop tracking peer.", (uint8_t *)&buf, 8u);
    }
LABEL_22:
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1002B3C88;
    v27[3] = &unk_10085DA60;
    void v27[4] = v5;
    int v28 = var2;
    [(NIServerNearbyAccessoryRangingService *)self _relayToClientsOfUWBSessionId:v6 blockToRelay:v27];
    goto LABEL_23;
  }
  [v15 setRangingRetryCount:[v15 rangingRetryCount] + 1];
  unsigned int v16 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v17 = [v15 rangingRetryCount];
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = v17;
    __int16 v39 = 1024;
    LODWORD(v40) = 8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#accessory-service,Retry ranging (%d of %d)", (uint8_t *)&buf, 0xEu);
  }

  int v18 = [v15 rangingRetryTimer];
  BOOL v19 = v18 == 0;

  if (!v19)
  {
    unsigned int v20 = [v15 rangingRetryTimer];
    dispatch_source_cancel(v20);

    [v15 setRangingRetryTimer:0];
  }
  dispatch_source_t v21 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
  [v15 setRangingRetryTimer:v21];

  uint64_t v22 = [v15 rangingRetryTimer];
  dispatch_time_t v23 = dispatch_time(0, 500000000);
  dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);

  objc_initWeak(&buf, self);
  uint64_t v24 = [v15 rangingRetryTimer];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1002B3AA0;
  handler[3] = &unk_10085DA88;
  objc_copyWeak(&v30, &buf);
  int v31 = v6;
  uint64_t v32 = v5 | 0x200000000;
  int v33 = var2;
  dispatch_source_set_event_handler(v24, handler);

  char v25 = [v15 rangingRetryTimer];
  dispatch_resume(v25);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&buf);
LABEL_23:
}

- (void)_relayToClientsOfUWBSessionId:(unsigned int)a3 blockToRelay:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  clientTracking = self->_clientTracking;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002B3DCC;
  v12[3] = &unk_10085DAA8;
  unsigned int v13 = a3;
  id v8 = [(NSMutableDictionary *)clientTracking keysOfEntriesPassingTest:v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002B3E00;
  v10[3] = &unk_10085DAD0;
  id v9 = v6;
  v10[4] = self;
  id v11 = v9;
  [v8 enumerateObjectsUsingBlock:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uwbSessionTracking, 0);
  objc_storeStrong((id *)&self->_clientTracking, 0);
  objc_storeStrong((id *)&self->_clients, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end