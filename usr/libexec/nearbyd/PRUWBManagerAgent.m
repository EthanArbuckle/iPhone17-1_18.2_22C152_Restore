@interface PRUWBManagerAgent
- (PRUWBDeviceCapabilities)deviceCapabilities;
- (PRUWBManagerAgent)initWithClientReference:(shared_ptr<PRRangingManagerClient>)a3;
- (RoseServiceStateUpdate)currentServiceState;
- (id).cxx_construct;
- (id)getQueue;
- (shared_ptr<PRConfigurationManager>)configurationManager;
- (void)connect;
- (void)disconnect;
- (void)requestAsyncServiceStatusUpdate;
@end

@implementation PRUWBManagerAgent

- (PRUWBManagerAgent)initWithClientReference:(shared_ptr<PRRangingManagerClient>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)PRUWBManagerAgent;
  v4 = [(PRUWBManagerAgent *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(PRRangingManagerClient **)ptr;
    uint64_t v6 = *((void *)ptr + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_clientReference.__cntrl_;
    v5->_clientReference.__ptr_ = v7;
    v5->_clientReference.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      sub_10001A970(cntrl);
    }
  }
  return v5;
}

- (id)getQueue
{
  v2 = (void *)*((void *)sub_1002F6464() + 7);

  return v2;
}

- (PRUWBDeviceCapabilities)deviceCapabilities
{
  v2 = sub_100007D00();
  BOOL v3 = sub_1003D2E54((uint64_t)v2);
  v4 = sub_100007D00();
  int v5 = sub_1003D2E5C((uint64_t)v4);
  uint64_t v6 = sub_100007D00();
  BOOL v7 = sub_1003D2ECC((uint64_t)v6);
  v8 = +[NSUserDefaults standardUserDefaults];
  unsigned int v9 = [v8 BOOLForKey:@"NI_SimulateUnsupportedPlatform"];
  int v10 = (v9 ^ 1) & v3;
  int v11 = (v9 ^ 1) & v5;
  int v12 = (v9 ^ 1) & v7;
  v13 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v14 = @"NO";
    if (v10) {
      CFStringRef v15 = @"YES";
    }
    else {
      CFStringRef v15 = @"NO";
    }
    if (v11) {
      CFStringRef v16 = @"YES";
    }
    else {
      CFStringRef v16 = @"NO";
    }
    int v21 = 138413058;
    CFStringRef v22 = v15;
    if (v12) {
      CFStringRef v17 = @"YES";
    }
    else {
      CFStringRef v17 = @"NO";
    }
    __int16 v23 = 2112;
    CFStringRef v24 = v16;
    __int16 v25 = 2112;
    CFStringRef v26 = v17;
    if (v9) {
      CFStringRef v14 = @"YES";
    }
    __int16 v27 = 2112;
    CFStringRef v28 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[UWBAgent] query device capabilities. Supports UWB: %@, Supports AoA: %@, Supports NMI: %@, Simulated: %@", (uint8_t *)&v21, 0x2Au);
  }

  if (v12) {
    int v18 = 0x10000;
  }
  else {
    int v18 = 0;
  }
  if (v11) {
    int v19 = 256;
  }
  else {
    int v19 = 0;
  }
  return (PRUWBDeviceCapabilities)(v18 | v19 | v10);
}

- (shared_ptr<PRConfigurationManager>)configurationManager
{
  BOOL v3 = v2;
  v4 = (PRConfigurationManager *)sub_1002F6464();
  uint64_t v6 = *((void *)v4 + 407);
  *BOOL v3 = *((void *)v4 + 406);
  v3[1] = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (void)connect
{
  BOOL v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[UWBAgent] connect with client reference", (uint8_t *)&v5, 2u);
  }
  v4 = sub_1002F6464();
  sub_10001A8A4(&v5, (void *)self->_clientReference.__ptr_ + 1);
  long long v6 = v5;
  long long v5 = 0uLL;
  sub_1002FA4B8((uint64_t)v4, (unint64_t *)&v6);
  if (*((void *)&v6 + 1)) {
    sub_10001A970(*((std::__shared_weak_count **)&v6 + 1));
  }
  if (*((void *)&v5 + 1)) {
    sub_10001A970(*((std::__shared_weak_count **)&v5 + 1));
  }
}

- (void)disconnect
{
  BOOL v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[UWBAgent] disconnect", (uint8_t *)&v5, 2u);
  }
  v4 = sub_1002F6464();
  sub_10001A8A4(&v5, (void *)self->_clientReference.__ptr_ + 1);
  long long v6 = v5;
  long long v5 = 0uLL;
  sub_1002FA594((uint64_t)v4, (unint64_t *)&v6);
  if (*((void *)&v6 + 1)) {
    sub_10001A970(*((std::__shared_weak_count **)&v6 + 1));
  }
  if (*((void *)&v5 + 1)) {
    sub_10001A970(*((std::__shared_weak_count **)&v5 + 1));
  }
}

- (void)requestAsyncServiceStatusUpdate
{
  BOOL v3 = sub_1002F6464();
  sub_10001A8A4(&v4, (void *)self->_clientReference.__ptr_ + 1);
  uint64_t v6 = v4;
  BOOL v7 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1002F6B1C((uint64_t)v3, &v6);
  if (v7) {
    std::__shared_weak_count::__release_weak(v7);
  }
  if (v5) {
    sub_10001A970(v5);
  }
}

- (RoseServiceStateUpdate)currentServiceState
{
  v2 = *(uint64_t (**)(void))(**((void **)sub_1002F6464() + 808) + 72);

  return (RoseServiceStateUpdate)v2();
}

- (void).cxx_destruct
{
  cntrl = (std::__shared_weak_count *)self->_clientReference.__cntrl_;
  if (cntrl) {
    sub_10001A970(cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end