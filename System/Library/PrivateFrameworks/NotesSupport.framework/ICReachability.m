@interface ICReachability
+ (id)reachabilityForInternetConnection;
+ (id)reachabilityForLocalWiFi;
+ (id)reachabilityWithAddress:(const sockaddr_in *)a3;
+ (id)reachabilityWithHostName:(id)a3;
+ (id)sharedReachabilityForInternetConnection;
- (BOOL)connectionRequired;
- (BOOL)startNotifier;
- (NSNumber)overrideReachabilityStatus;
- (int64_t)currentReachabilityStatus;
- (int64_t)localWiFiStatusForFlags:(unsigned int)a3;
- (int64_t)networkStatusForFlags:(unsigned int)a3;
- (void)dealloc;
- (void)setOverrideReachabilityStatus:(id)a3;
- (void)stopNotifier;
@end

@implementation ICReachability

+ (id)sharedReachabilityForInternetConnection
{
  v2 = (void *)sharedReachabilityForInternetConnection_sharedReachability;
  if (!sharedReachabilityForInternetConnection_sharedReachability)
  {
    uint64_t v3 = +[ICReachability reachabilityForInternetConnection];
    v4 = (void *)sharedReachabilityForInternetConnection_sharedReachability;
    sharedReachabilityForInternetConnection_sharedReachability = v3;

    v2 = (void *)sharedReachabilityForInternetConnection_sharedReachability;
  }
  return v2;
}

+ (id)reachabilityForInternetConnection
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[1] = 0;
  v4[0] = 528;
  v2 = [a1 reachabilityWithAddress:v4];
  return v2;
}

+ (id)reachabilityWithAddress:(const sockaddr_in *)a3
{
  SCNetworkReachabilityRef v4 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x263EFFB08], (const sockaddr *)a3);
  if (v4)
  {
    SCNetworkReachabilityRef v5 = v4;
    v6 = objc_alloc_init((Class)a1);
    if (v6)
    {
      v6[2] = CFRetain(v5);
      *((unsigned char *)v6 + 8) = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)reachabilityWithHostName:(id)a3
{
  SCNetworkReachabilityRef v4 = SCNetworkReachabilityCreateWithName(0, (const char *)[a3 UTF8String]);
  if (v4)
  {
    SCNetworkReachabilityRef v5 = v4;
    v6 = objc_alloc_init((Class)a1);
    if (v6)
    {
      v6[2] = CFRetain(v5);
      *((unsigned char *)v6 + 8) = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)reachabilityForLocalWiFi
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[1] = 0;
  v4[0] = 0xFEA900000210;
  v2 = [a1 reachabilityWithAddress:v4];
  if (v2) {
    v2[8] = 1;
  }
  return v2;
}

- (BOOL)startNotifier
{
  v7.version = 0;
  memset(&v7.retain, 0, 24);
  v7.info = self;
  int v3 = SCNetworkReachabilitySetCallback(self->_reachabilityRef, (SCNetworkReachabilityCallBack)ReachabilityCallback, &v7);
  if (v3)
  {
    reachabilityRef = self->_reachabilityRef;
    Current = CFRunLoopGetCurrent();
    LOBYTE(v3) = SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, Current, (CFStringRef)*MEMORY[0x263EFFE88]) != 0;
  }
  return v3;
}

- (void)stopNotifier
{
  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef)
  {
    Current = CFRunLoopGetCurrent();
    CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE88];
    SCNetworkReachabilityUnscheduleFromRunLoop(reachabilityRef, Current, v4);
  }
}

- (void)dealloc
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  [(ICReachability *)self stopNotifier];
  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef) {
    CFRelease(reachabilityRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)ICReachability;
  [(ICReachability *)&v4 dealloc];
}

- (int64_t)localWiFiStatusForFlags:(unsigned int)a3
{
  return (~a3 & 0x20002) == 0;
}

- (int64_t)networkStatusForFlags:(unsigned int)a3
{
  if ((a3 & 2) == 0) {
    return 0;
  }
  LODWORD(v4) = (a3 & 0x28) != 0;
  if ((a3 & 0x10) != 0) {
    LODWORD(v4) = 0;
  }
  if ((a3 & 4) != 0) {
    int64_t v4 = v4;
  }
  else {
    int64_t v4 = 1;
  }
  if ((a3 & 0x40000) != 0) {
    return 2;
  }
  else {
    return v4;
  }
}

- (BOOL)connectionRequired
{
  SCNetworkReachabilityFlags flags = 0;
  return SCNetworkReachabilityGetFlags(self->_reachabilityRef, &flags) && (flags & 4) != 0;
}

- (int64_t)currentReachabilityStatus
{
  int v3 = [(ICReachability *)self overrideReachabilityStatus];

  if (v3)
  {
    int64_t v4 = [(ICReachability *)self overrideReachabilityStatus];
    int64_t v5 = (int)[v4 intValue];
  }
  else
  {
    SCNetworkReachabilityFlags flags = 0;
    if (SCNetworkReachabilityGetFlags(self->_reachabilityRef, &flags))
    {
      if (self->_alwaysReturnLocalWiFiStatus) {
        return [(ICReachability *)self localWiFiStatusForFlags:flags];
      }
      else {
        return [(ICReachability *)self networkStatusForFlags:flags];
      }
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (NSNumber)overrideReachabilityStatus
{
  return self->_overrideReachabilityStatus;
}

- (void)setOverrideReachabilityStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end