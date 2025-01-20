@interface NIServerRangingAuthSession
- (BOOL)supportsBackgroundedClients;
- (NIRangingAuthConfiguration)configuration;
- (NIServerRangingAuthSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (duration<long)nominalCycleRate;
- (id).cxx_construct;
- (id)configure;
- (id)disableAllServices;
- (id)generateRandomSecureKey;
- (id)lastConfiguration;
- (id)pause;
- (id)run;
- (void)invalidate;
- (void)wifiRangingRangeError:(const int *)a3;
- (void)wifiRangingRangeResults:(const void *)a3;
- (void)wifiRangingReadiness:(const int *)a3;
@end

@implementation NIServerRangingAuthSession

- (NIServerRangingAuthSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = objc_opt_class();
  if (v11 != objc_opt_class())
  {
    v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"NIServerRangingAuthSession.mm" lineNumber:49 description:@"NIServerRangingAuthSession given invalid configuration."];
  }
  v25.receiver = self;
  v25.super_class = (Class)NIServerRangingAuthSession;
  v12 = [(NIServerBaseSession *)&v25 initWithResourcesManager:v9 configuration:v10 error:a5];
  if (v12)
  {
    uint64_t v13 = [v9 clientConnectionQueue];
    v14 = (void *)*((void *)v12 + 8);
    *((void *)v12 + 8) = v13;

    id v15 = [v10 copy];
    v16 = (void *)*((void *)v12 + 17);
    *((void *)v12 + 17) = v15;

    if (v9)
    {
      [v9 protobufLogger];
      long long v17 = v24;
    }
    else
    {
      long long v17 = 0uLL;
    }
    v18 = (std::__shared_weak_count *)*((void *)v12 + 10);
    *(_OWORD *)(v12 + 72) = v17;
    if (v18) {
      sub_10001A970(v18);
    }
    v19 = operator new(0x88uLL);
    v19[1] = 0;
    v19[2] = 0;
    void *v19 = off_1008561C8;
    sub_1002D7118((unsigned char *)v19 + 24);
    v20 = (std::__shared_weak_count *)*((void *)v12 + 12);
    *((void *)v12 + 11) = v19 + 3;
    *((void *)v12 + 12) = v19;
    if (v20) {
      sub_10001A970(v20);
    }
    v21 = v12;
  }

  return (NIServerRangingAuthSession *)v12;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)2000;
}

- (void)invalidate
{
  if (self->_wifiRangingSession.__ptr_)
  {
    v3 = [(NIServerRangingAuthSession *)self disableAllServices];
    v4 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-secure-ranging,Invalidate. Error: %@", buf, 0xCu);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NIServerRangingAuthSession;
  [(NIServerBaseSession *)&v5 invalidate];
}

- (id)disableAllServices
{
  p_wifiRangingSession = &self->_wifiRangingSession;
  ptr = self->_wifiRangingSession.__ptr_;
  if (ptr)
  {
    sub_10002E098((const std::string *)ptr);
    cntrl = (std::__shared_weak_count *)p_wifiRangingSession->__cntrl_;
    p_wifiRangingSession->__ptr_ = 0;
    p_wifiRangingSession->__cntrl_ = 0;
    if (cntrl)
    {
      sub_10001A970(cntrl);
      objc_super v5 = (std::__shared_weak_count *)p_wifiRangingSession->__cntrl_;
      p_wifiRangingSession->__ptr_ = 0;
      p_wifiRangingSession->__cntrl_ = 0;
      if (v5) {
        sub_10001A970(v5);
      }
    }
    else
    {
      p_wifiRangingSession->__ptr_ = 0;
      p_wifiRangingSession->__cntrl_ = 0;
    }
  }
  return 0;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (id)configure
{
  if (!self->_configuration) {
    sub_100416550();
  }
  v12.receiver = self;
  v12.super_class = (Class)NIServerRangingAuthSession;
  v3 = [(NIServerBaseSession *)&v12 resourcesManager];
  if ([v3 entitlementGranted:8])
  {
    v4 = self;
    objc_super v5 = [v3 serverSessionIdentifier];
    v6 = [v5 UUIDString];

    sub_100004950(&__p, (char *)[v6 UTF8String]);
    operator new();
  }
  v7 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10041657C(v7);
  }
  NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
  CFStringRef v14 = @"Missing entitlement";
  v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  id v9 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v8];

  return v9;
}

- (id)run
{
  v23.receiver = self;
  v23.super_class = (Class)NIServerRangingAuthSession;
  v3 = [(NIServerBaseSession *)&v23 resourcesManager];
  v4 = [v3 lifecycleSupervisor];
  [v4 runWithConfigurationCalled];

  objc_super v5 = +[NSData data];
  secureRangingKey = self->_secureRangingKey;
  self->_secureRangingKey = v5;

  v7 = [(NIRangingAuthConfiguration *)self->_configuration peerToken];
  v8 = sub_1002B7DA4(v7);

  if (v8)
  {
    id v9 = [v8 objectForKeyedSubscript:&off_1008786A0];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v10 = [v8 objectForKeyedSubscript:&off_1008786B8];
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v11 = [(NIRangingAuthConfiguration *)self->_configuration peerToken];
        peerToken = self->_peerToken;
        self->_peerToken = v11;

        objc_storeStrong((id *)&self->_peerMacAddress, v9);
        objc_storeStrong((id *)&self->_secureRangingKey, v10);
        if (self->_wifiRangingSession.__ptr_)
        {
          if ([(NIRangingAuthConfiguration *)self->_configuration isResponder]) {
            int v13 = 2;
          }
          else {
            int v13 = 1;
          }
          sub_10002DC8C((uint64_t)v22, self->_peerMacAddress, v13, self->_secureRangingKey);
          sub_10002E458((uint64_t)self->_wifiRangingSession.__ptr_, (uint64_t)v22);
        }
        long long v17 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_100416688(v17);
        }
        v18 = [v3 remote];
        NSErrorUserInfoKey v24 = NSLocalizedDescriptionKey;
        CFStringRef v25 = @"Failed to start WiFi service. session is nil";
        v19 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        v20 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v19];
        [v18 uwbSessionDidFailWithError:v20];

        id v15 = 0;
      }
      else
      {
        v16 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_100416644(v16);
        }
        id v15 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10012 userInfo:0];
      }
    }
    else
    {
      CFStringRef v14 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_100416600(v14);
      }
      id v15 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10012 userInfo:0];
    }
  }
  else
  {
    id v15 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10012 userInfo:0];
  }

  return v15;
}

- (id)pause
{
  v3 = [(NIServerRangingAuthSession *)self disableAllServices];
  v7.receiver = self;
  v7.super_class = (Class)NIServerRangingAuthSession;
  v4 = [(NIServerBaseSession *)&v7 resourcesManager];
  objc_super v5 = [v4 lifecycleSupervisor];
  [v5 pauseCalled];

  return v3;
}

- (void)wifiRangingRangeResults:(const void *)a3
{
  objc_super v5 = [[NINearbyObject alloc] initWithToken:self->_peerToken];
  __p = 0;
  v48 = 0;
  v49 = 0;
  uint64_t v7 = *(void *)a3;
  v44 = v5;
  if (*(void *)a3 != *((void *)a3 + 1))
  {
    v43 = &v46;
    *(void *)&long long v6 = 136315138;
    long long v42 = v6;
    uint64_t v8 = *(void *)(v7 + 24);
    if (*(void *)(v7 + 32) != v8)
    {
      unint64_t v9 = 0;
      do
      {
        uint64_t v10 = v8 + 24 * v9;
        int v11 = *(_DWORD *)v10;
        uint64_t v12 = *(unsigned __int8 *)(v10 + 8);
        uint64_t v13 = *(unsigned __int8 *)(v10 + 9);
        double v14 = sub_100006A9C(*(void *)(v10 + 16));
        float v15 = (double)v11 * 0.0149896229;
        v16 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          *(double *)&uint8_t buf[4] = v15;
          __int16 v51 = 1024;
          int v52 = v12;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#ses-secure-ranging,Wifi RTT measurement: %f, CoreID: %i", buf, 0x12u);
        }
        *(void *)buf = 0;
        -[NSData getBytes:length:](self->_peerMacAddress, "getBytes:length:", buf, 8, v42, v43);
        uint64_t v17 = *(void *)buf;
        unint64_t v18 = v12 | (unint64_t)&_mh_execute_header;
        unint64_t v19 = v13 | (unint64_t)&_mh_execute_header;
        v20 = v48;
        if (v48 >= v49)
        {
          unint64_t v22 = 0xD37A6F4DE9BD37A7 * ((v48 - (unsigned char *)__p) >> 3);
          unint64_t v23 = v22 + 1;
          if (v22 + 1 > 0x1642C8590B21642) {
            sub_1000267C4();
          }
          if (0xA6F4DE9BD37A6F4ELL * ((v49 - (unsigned char *)__p) >> 3) > v23) {
            unint64_t v23 = 0xA6F4DE9BD37A6F4ELL * ((v49 - (unsigned char *)__p) >> 3);
          }
          if (0xD37A6F4DE9BD37A7 * ((v49 - (unsigned char *)__p) >> 3) >= 0xB21642C8590B21) {
            unint64_t v24 = 0x1642C8590B21642;
          }
          else {
            unint64_t v24 = v23;
          }
          if (v24) {
            CFStringRef v25 = (char *)sub_1001A0D08((uint64_t)&v49, v24);
          }
          else {
            CFStringRef v25 = 0;
          }
          v26 = &v25[184 * v22];
          *(void *)v26 = v17;
          *((double *)v26 + 1) = v14;
          *((float *)v26 + 4) = v15;
          *((_DWORD *)v26 + 5) = 2;
          v26[24] = 0;
          v26[36] = 0;
          *((void *)v26 + 6) = v18;
          *((void *)v26 + 7) = v19;
          v26[64] = 0;
          v26[72] = 0;
          *((_WORD *)v26 + 40) = 0;
          v26[88] = 0;
          v26[96] = 0;
          v26[104] = 0;
          v26[112] = 0;
          *((_DWORD *)v26 + 30) = 0;
          v26[128] = 0;
          v26[152] = 0;
          v26[160] = 0;
          v26[168] = 0;
          v26[176] = 0;
          v26[178] = 0;
          *((_DWORD *)v26 + 45) = 0;
          v28 = (char *)__p;
          v27 = v48;
          v29 = v26;
          if (v48 != __p)
          {
            do
            {
              long long v30 = *(_OWORD *)(v27 - 184);
              long long v31 = *(_OWORD *)(v27 - 168);
              long long v32 = *(_OWORD *)(v27 - 152);
              *(_OWORD *)(v29 - 136) = *(_OWORD *)(v27 - 136);
              *(_OWORD *)(v29 - 152) = v32;
              *(_OWORD *)(v29 - 168) = v31;
              *(_OWORD *)(v29 - 184) = v30;
              long long v33 = *(_OWORD *)(v27 - 120);
              long long v34 = *(_OWORD *)(v27 - 104);
              long long v35 = *(_OWORD *)(v27 - 88);
              *(_OWORD *)(v29 - 72) = *(_OWORD *)(v27 - 72);
              *(_OWORD *)(v29 - 88) = v35;
              *(_OWORD *)(v29 - 104) = v34;
              *(_OWORD *)(v29 - 120) = v33;
              long long v36 = *(_OWORD *)(v27 - 56);
              long long v37 = *(_OWORD *)(v27 - 40);
              long long v38 = *(_OWORD *)(v27 - 24);
              *((void *)v29 - 1) = *((void *)v27 - 1);
              *(_OWORD *)(v29 - 24) = v38;
              *(_OWORD *)(v29 - 40) = v37;
              *(_OWORD *)(v29 - 56) = v36;
              v29 -= 184;
              v27 -= 184;
            }
            while (v27 != v28);
            v27 = v28;
          }
          v21 = v26 + 184;
          __p = v29;
          v48 = v26 + 184;
          v49 = &v25[184 * v24];
          if (v27) {
            operator delete(v27);
          }
        }
        else
        {
          *(void *)v48 = *(void *)buf;
          *((double *)v20 + 1) = v14;
          *((float *)v20 + 4) = v15;
          *((_DWORD *)v20 + 5) = 2;
          v20[24] = 0;
          v20[36] = 0;
          *((void *)v20 + 6) = v18;
          *((void *)v20 + 7) = v19;
          v20[64] = 0;
          v20[72] = 0;
          *((_WORD *)v20 + 40) = 0;
          v20[88] = 0;
          v20[96] = 0;
          v20[104] = 0;
          v20[112] = 0;
          *((_DWORD *)v20 + 30) = 0;
          v20[128] = 0;
          v20[152] = 0;
          v20[160] = 0;
          v20[168] = 0;
          v20[176] = 0;
          v20[178] = 0;
          v21 = v20 + 184;
          *((_DWORD *)v20 + 45) = 0;
        }
        v48 = v21;
        ++v9;
        uint64_t v8 = *(void *)(v7 + 24);
      }
      while (0xAAAAAAAAAAAAAAABLL * ((*(void *)(v7 + 32) - v8) >> 3) > v9);
    }
    sub_1000328AC();
    sub_100032BEC();
    operator new();
  }
  v39 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "#ses-secure-ranging,One-shot ranging session complete, invalidating session...", buf, 2u);
  }
  [(NIServerRangingAuthSession *)self invalidate];
  v45.receiver = self;
  v45.super_class = (Class)NIServerRangingAuthSession;
  v40 = [(NIServerBaseSession *)&v45 invalidationHandler];
  v41 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-10008 userInfo:0];
  ((void (**)(void, void *))v40)[2](v40, v41);

  if (__p)
  {
    v48 = (char *)__p;
    operator delete(__p);
  }
}

- (void)wifiRangingRangeError:(const int *)a3
{
  sub_10002EC8C(*a3, __p);
  if (v16 >= 0) {
    v4 = __p;
  }
  else {
    v4 = (void **)__p[0];
  }
  objc_super v5 = +[NSString stringWithUTF8String:v4];
  long long v6 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_10041670C(&v16, __p, v6);
  }
  NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
  unint64_t v18 = v5;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  uint64_t v8 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5887 userInfo:v7];

  clientQueue = self->_clientQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019FBF0;
  block[3] = &unk_100846588;
  block[4] = self;
  id v10 = v8;
  id v14 = v10;
  dispatch_async((dispatch_queue_t)clientQueue, block);
  int v11 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ses-secure-ranging,One-shot ranging session error, invalidating session...", v12, 2u);
  }

  if (v16 < 0) {
    operator delete(__p[0]);
  }
}

- (void)wifiRangingReadiness:(const int *)a3
{
  v4 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    sub_10002ECD0(*a3, __p);
    if (v7 >= 0) {
      objc_super v5 = __p;
    }
    else {
      objc_super v5 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315138;
    unint64_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ses-secure-ranging,Readiness update: %s", buf, 0xCu);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
  }
}

- (id)generateRandomSecureKey
{
  int v2 = 64;
  v3 = +[NSMutableData dataWithCapacity:64];
  while (1)
  {
    char bytes = 0;
    if (SecRandomCopyBytes(kSecRandomDefault, 1uLL, &bytes)) {
      break;
    }
    [v3 appendBytes:&bytes length:1];
    if (!--v2)
    {
      id v4 = v3;
      goto LABEL_6;
    }
  }
  id v4 = 0;
LABEL_6:

  return v4;
}

- (BOOL)supportsBackgroundedClients
{
  return 1;
}

- (NIRangingAuthConfiguration)configuration
{
  return (NIRangingAuthConfiguration *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_secureRangingKey, 0);
  objc_storeStrong((id *)&self->_peerMacAddress, 0);
  objc_storeStrong((id *)&self->_peerToken, 0);
  objc_storeStrong((id *)&self->_localToken, 0);
  cntrl = (std::__shared_weak_count *)self->_caManager.__cntrl_;
  if (cntrl) {
    sub_10001A970(cntrl);
  }
  id v4 = (std::__shared_weak_count *)self->_pbLogger.__cntrl_;
  if (v4) {
    sub_10001A970(v4);
  }
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_super v5 = (std::__shared_weak_count *)self->_wifiRangingSession.__cntrl_;
  if (v5)
  {
    sub_10001A970(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = 0;
  return self;
}

@end