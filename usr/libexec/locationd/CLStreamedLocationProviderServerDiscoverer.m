@interface CLStreamedLocationProviderServerDiscoverer
+ (BOOL)iOSSourceVersionNewEnough:(id *)a3;
+ (BOOL)macOSSourceVersionNewEnough:(id *)a3;
+ (BOOL)validateRemoteDeviceForStreaming:(id)a3;
- (NSMutableArray)probeClients;
- (OS_dispatch_queue)requestQ;
- (OS_dispatch_queue)workQ;
- (RPCompanionLinkClient)nearbyDeviceListener;
- (id)deviceWithEffectiveID:(id)a3;
- (id)initOnQueue:(id)a3;
- (void)dealloc;
- (void)findCandidateServersWithCompletion:(id)a3;
- (void)invalidate;
- (void)invalidateAndReleaseProbeClients;
- (void)setNearbyDeviceListener:(id)a3;
- (void)setProbeClients:(id)a3;
- (void)setRequestQ:(id)a3;
- (void)setWorkQ:(id)a3;
@end

@implementation CLStreamedLocationProviderServerDiscoverer

- (id)initOnQueue:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLStreamedLocationProviderServerDiscoverer;
  v4 = [(CLStreamedLocationProviderServerDiscoverer *)&v7 init];
  if (v4)
  {
    v4->_workQ = (OS_dispatch_queue *)dispatch_queue_create("CLStreamedLocationProviderServerDiscoverer.workQueue", 0);
    v4->_requestQ = (OS_dispatch_queue *)dispatch_queue_create("CLStreamedLocationProviderServerDiscoverer.requestQueue", 0);
    v4->_nearbyDeviceListener = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    sub_100103240();
    if (sub_10073AAE4())
    {
      [(RPCompanionLinkClient *)v4->_nearbyDeviceListener setFlags:1];
      uint64_t v5 = 4;
    }
    else
    {
      uint64_t v5 = 65538;
    }
    [(RPCompanionLinkClient *)v4->_nearbyDeviceListener setControlFlags:v5];
    [(RPCompanionLinkClient *)v4->_nearbyDeviceListener setDispatchQueue:a3];
    [(RPCompanionLinkClient *)v4->_nearbyDeviceListener setDeviceFoundHandler:&stru_1022B2FF8];
    [(RPCompanionLinkClient *)v4->_nearbyDeviceListener setDeviceLostHandler:&stru_1022B3018];
    [(RPCompanionLinkClient *)v4->_nearbyDeviceListener activateWithCompletion:&stru_1022B3058];
  }
  return v4;
}

- (void)dealloc
{
  [(CLStreamedLocationProviderServerDiscoverer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CLStreamedLocationProviderServerDiscoverer;
  [(CLStreamedLocationProviderServerDiscoverer *)&v3 dealloc];
}

- (void)invalidate
{
  [(RPCompanionLinkClient *)self->_nearbyDeviceListener invalidate];

  self->_nearbyDeviceListener = 0;

  [(CLStreamedLocationProviderServerDiscoverer *)self invalidateAndReleaseProbeClients];
}

- (void)invalidateAndReleaseProbeClients
{
  probeClients = self->_probeClients;
  if (probeClients)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v4 = [(NSMutableArray *)probeClients countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        objc_super v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(probeClients);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) invalidate];
          objc_super v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [(NSMutableArray *)probeClients countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }

  self->_probeClients = 0;
}

- (id)deviceWithEffectiveID:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(RPCompanionLinkClient *)[(CLStreamedLocationProviderServerDiscoverer *)self nearbyDeviceListener] activeDevices];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v9, "effectiveIdentifier"), "isEqualToString:", a3))
        {
          if (qword_102419540 != -1) {
            dispatch_once(&qword_102419540, &stru_1022B31C0);
          }
          long long v10 = qword_102419548;
          if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEBUG))
          {
            id v11 = [a3 UTF8String];
            *(_DWORD *)buf = 68289283;
            int v18 = 0;
            __int16 v19 = 2082;
            v20 = "";
            __int16 v21 = 2081;
            id v22 = v11;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#Multiclient found an active device with effective ID\", \"effectiveID\":%{private, location:escape_only}s}", buf, 0x1Cu);
          }
          return v9;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  return 0;
}

+ (BOOL)iOSSourceVersionNewEnough:(id *)a3
{
  if (a3->var0 < 16) {
    return 0;
  }
  if (a3->var0 == 16) {
    return a3->var1 > 3;
  }
  return 1;
}

+ (BOOL)macOSSourceVersionNewEnough:(id *)a3
{
  if (a3->var0 < 14) {
    return 0;
  }
  if (a3->var0 == 14) {
    return a3->var1 > 3;
  }
  return 1;
}

+ (BOOL)validateRemoteDeviceForStreaming:(id)a3
{
  unint64_t v4 = (unint64_t)[a3 statusFlags];
  if (objc_msgSend(objc_msgSend(a3, "model"), "containsString:", @"Mac"))
  {
    sub_100103240();
    if (!sub_10073AAE4())
    {
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022B31C0);
      }
      uint64_t v5 = qword_102419548;
      if (!os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      *(_DWORD *)buf = 68289026;
      int v29 = 0;
      __int16 v30 = 2082;
      v31 = "";
      id v6 = "{\"msg%{public}.0s\":\"#Multiclient not a VM, so not using mac\"}";
      uint64_t v7 = v5;
      uint32_t v8 = 18;
      goto LABEL_42;
    }
    if (a3) {
      [a3 operatingSystemVersion];
    }
    else {
      memset(v27, 0, sizeof(v27));
    }
    if (!+[CLStreamedLocationProviderServerDiscoverer macOSSourceVersionNewEnough:v27])
    {
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022B31C0);
      }
      uint64_t v12 = qword_102419548;
      if (!os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      id v13 = [a3 name];
      if (a3)
      {
        [a3 operatingSystemVersion];
        long long v14 = v24;
        [a3 operatingSystemVersion];
        uint64_t v15 = v22;
      }
      else
      {
        uint64_t v15 = 0;
        long long v14 = 0;
        v24 = 0;
        uint64_t v25 = 0;
        uint64_t v26 = 0;
        uint64_t v21 = 0;
        uint64_t v22 = 0;
        uint64_t v23 = 0;
      }
      *(_DWORD *)buf = 68289795;
      int v29 = 0;
      __int16 v30 = 2082;
      v31 = "";
      __int16 v32 = 2113;
      id v33 = v13;
      __int16 v34 = 2050;
      id v35 = v14;
      __int16 v36 = 2050;
      uint64_t v37 = v15;
      id v6 = "{\"msg%{public}.0s\":\"#Multiclient macOS device running too-old software, ignoring\", \"name\":%{private, lo"
           "cation:escape_only}@, \"major\":%{public}ld, \"minor\":%{public}ld}";
      goto LABEL_41;
    }
    return 1;
  }
  if (objc_msgSend(objc_msgSend(a3, "model"), "hasPrefix:", @"iPhone"))
  {
    if (a3) {
      [a3 operatingSystemVersion];
    }
    else {
      memset(v20, 0, sizeof(v20));
    }
    if (!+[CLStreamedLocationProviderServerDiscoverer iOSSourceVersionNewEnough:v20])
    {
      if (qword_102419540 != -1) {
        dispatch_once(&qword_102419540, &stru_1022B31C0);
      }
      uint64_t v12 = qword_102419548;
      if (!os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      id v16 = [a3 name];
      if (a3)
      {
        [a3 operatingSystemVersion];
        v17 = v24;
        [a3 operatingSystemVersion];
        uint64_t v18 = v22;
      }
      else
      {
        uint64_t v18 = 0;
        v17 = 0;
        v24 = 0;
        uint64_t v25 = 0;
        uint64_t v26 = 0;
        uint64_t v21 = 0;
        uint64_t v22 = 0;
        uint64_t v23 = 0;
      }
      *(_DWORD *)buf = 68289795;
      int v29 = 0;
      __int16 v30 = 2082;
      v31 = "";
      __int16 v32 = 2113;
      id v33 = v16;
      __int16 v34 = 2050;
      id v35 = v17;
      __int16 v36 = 2050;
      uint64_t v37 = v18;
      id v6 = "{\"msg%{public}.0s\":\"#Multiclient iOS device running too-old software, ignoring\", \"name\":%{private, loca"
           "tion:escape_only}@, \"major\":%{public}ld, \"minor\":%{public}ld}";
LABEL_41:
      uint64_t v7 = v12;
      uint32_t v8 = 48;
LABEL_42:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v6, buf, v8);
      return 0;
    }
    return 1;
  }
  sub_100103240();
  if (!sub_10073AAE4() || (v4 & 0x1000000) == 0)
  {
    if (qword_102419540 != -1) {
      dispatch_once(&qword_102419540, &stru_1022B31C0);
    }
    uint64_t v11 = qword_102419548;
    if (!os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_DWORD *)buf = 68289795;
    int v29 = 0;
    __int16 v30 = 2082;
    v31 = "";
    __int16 v32 = 2113;
    id v33 = [a3 name];
    __int16 v34 = 2114;
    id v35 = [a3 model];
    __int16 v36 = 1026;
    LODWORD(v37) = (v4 >> 24) & 1;
    id v6 = "{\"msg%{public}.0s\":\"#Multiclient candidate is neither a phone nor a mac host, skipping\", \"name\":%{private"
         ", location:escape_only}@, \"model\":%{public, location:escape_only}@, \"USB?\":%{public}hhd}";
    uint64_t v7 = v11;
    uint32_t v8 = 44;
    goto LABEL_42;
  }
  if (qword_102419540 != -1) {
    dispatch_once(&qword_102419540, &stru_1022B31C0);
  }
  long long v9 = qword_102419548;
  BOOL v10 = 1;
  if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289283;
    int v29 = 0;
    __int16 v30 = 2082;
    v31 = "";
    __int16 v32 = 2113;
    id v33 = [a3 name];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#Multiclient accepting this device because it looks like it's our host\", \"name\":%{private, location:escape_only}@}", buf, 0x1Cu);
  }
  return v10;
}

- (void)findCandidateServersWithCompletion:(id)a3
{
  id v23 = +[NSMutableDictionary dictionary];
  id v22 = +[NSMutableDictionary dictionary];
  [v22 setObject:[-[RPCompanionLinkClient localDevice](-[CLStreamedLocationProviderServerDiscoverer nearbyDeviceListener](self, "nearbyDeviceListener"), "localDevice") effectiveIdentifier] forKeyedSubscript:@"kCLLocationSTreamingMessageRapportDeviceIDKey"];
  if (!self->_probeClients) {
    self->_probeClients = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:[-[RPCompanionLinkClient activeDevices](-[CLStreamedLocationProviderServerDiscoverer nearbyDeviceListener](self, "nearbyDeviceListener"), "activeDevices") count]];
  }
  sub_100103240();
  long long v26 = 0u;
  if (sub_10073AAE4()) {
    uint64_t v4 = 0x380000103C04;
  }
  else {
    uint64_t v4 = 532482;
  }
  long long v27 = 0uLL;
  long long v28 = 0uLL;
  long long v29 = 0uLL;
  id v5 = [(RPCompanionLinkClient *)[(CLStreamedLocationProviderServerDiscoverer *)self nearbyDeviceListener] activeDevices];
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    uint64_t v21 = RPOptionTimeoutSeconds;
    uint64_t v20 = RPOptionStatusFlags;
    uint64_t v19 = RPOptionAllowUnauthenticated;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v9);
        unsigned int v11 = [v10 statusFlags];
        sub_100103240();
        if (!sub_10073AAE4() || (v11 & 0x1000000) != 0)
        {
          if (+[CLStreamedLocationProviderServerDiscoverer validateRemoteDeviceForStreaming:v10])
          {
            id v15 = objc_alloc_init((Class)RPCompanionLinkClient);
            [v15 setDispatchQueue:-[CLStreamedLocationProviderServerDiscoverer workQ](self, "workQ")];
            sub_100103240();
            if (sub_10073AAE4())
            {
              [v15 setControlFlags:v4];
              [v15 setFlags:1];
              v32[0] = v21;
              v32[1] = v19;
              v33[0] = &off_102392528;
              v33[1] = &__kCFBooleanTrue;
              v32[2] = v20;
              v33[2] = +[NSNumber numberWithUnsignedLongLong:v4];
              id v16 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
            }
            else
            {
              [v15 setControlFlags:2];
              v30[0] = v21;
              v30[1] = v20;
              v31[0] = &off_102392528;
              v31[1] = +[NSNumber numberWithUnsignedLongLong:v4];
              id v16 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
              [v15 setControlFlags:((unint64_t)[v15 controlFlags] | 0x100)];
            }
            [v15 setDestinationDevice:v10];
            v25[0] = _NSConcreteStackBlock;
            v25[1] = 3221225472;
            v25[2] = sub_100459FBC;
            v25[3] = &unk_1022B30D0;
            v25[4] = v15;
            v25[5] = self;
            v25[6] = v22;
            v25[7] = v16;
            v25[8] = v23;
            [v15 activateWithCompletion:v25];
            [(NSMutableArray *)[(CLStreamedLocationProviderServerDiscoverer *)self probeClients] addObject:v15];
          }
        }
        else
        {
          if (qword_102419540 != -1) {
            dispatch_once(&qword_102419540, &stru_1022B31C0);
          }
          uint64_t v12 = qword_102419548;
          if (os_log_type_enabled((os_log_t)qword_102419548, OS_LOG_TYPE_DEBUG))
          {
            id v13 = [v10 name];
            id v14 = [v10 model];
            *(_DWORD *)buf = 68289538;
            int v35 = 0;
            __int16 v36 = 2082;
            uint64_t v37 = "";
            __int16 v38 = 2114;
            id v39 = v13;
            __int16 v40 = 2114;
            id v41 = v14;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#Multiclient skipping this device because it's not the host\", \"name\":%{public, location:escape_only}@, \"model\":%{public, location:escape_only}@}", buf, 0x26u);
          }
        }
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v26 objects:v42 count:16];
    }
    while (v7);
  }
  dispatch_time_t v17 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10045A5F8;
  block[3] = &unk_1022B30F8;
  block[4] = v23;
  block[5] = a3;
  dispatch_after(v17, (dispatch_queue_t)[(RPCompanionLinkClient *)[(CLStreamedLocationProviderServerDiscoverer *)self nearbyDeviceListener] dispatchQueue], block);
}

- (RPCompanionLinkClient)nearbyDeviceListener
{
  return self->_nearbyDeviceListener;
}

- (void)setNearbyDeviceListener:(id)a3
{
  self->_nearbyDeviceListener = (RPCompanionLinkClient *)a3;
}

- (OS_dispatch_queue)workQ
{
  return self->_workQ;
}

- (void)setWorkQ:(id)a3
{
  self->_workQ = (OS_dispatch_queue *)a3;
}

- (OS_dispatch_queue)requestQ
{
  return self->_requestQ;
}

- (void)setRequestQ:(id)a3
{
  self->_requestQ = (OS_dispatch_queue *)a3;
}

- (NSMutableArray)probeClients
{
  return self->_probeClients;
}

- (void)setProbeClients:(id)a3
{
  self->_probeClients = (NSMutableArray *)a3;
}

@end