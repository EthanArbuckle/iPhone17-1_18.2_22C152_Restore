@interface ICReachability
+ (id)reachabilityForInternetConnection;
+ (id)reachabilityForLocalWiFi;
+ (id)reachabilityWithAddress:(const sockaddr_in *)a3;
+ (id)reachabilityWithHostName:(id)a3;
+ (id)sharedReachabilityForInternetConnection;
- (BOOL)connectionRequired;
- (BOOL)startNotifier;
- (int64_t)currentReachabilityStatus;
- (int64_t)localWiFiStatusForFlags:(unsigned int)a3;
- (int64_t)networkStatusForFlags:(unsigned int)a3;
- (void)dealloc;
- (void)stopNotifier;
@end

@implementation ICReachability

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

+ (id)reachabilityWithAddress:(const sockaddr_in *)a3
{
  SCNetworkReachabilityRef v4 = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, (const sockaddr *)a3);
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

+ (id)reachabilityForInternetConnection
{
  v4[1] = 0;
  v4[0] = 528;
  v2 = [a1 reachabilityWithAddress:v4];

  return v2;
}

+ (id)sharedReachabilityForInternetConnection
{
  v2 = (void *)qword_100922AB8;
  if (!qword_100922AB8)
  {
    uint64_t v3 = +[ICReachability reachabilityForInternetConnection];
    SCNetworkReachabilityRef v4 = (void *)qword_100922AB8;
    qword_100922AB8 = v3;

    v2 = (void *)qword_100922AB8;
  }

  return v2;
}

+ (id)reachabilityForLocalWiFi
{
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
  int v3 = SCNetworkReachabilitySetCallback(self->_reachabilityRef, (SCNetworkReachabilityCallBack)sub_100081A60, &v7);
  if (v3)
  {
    reachabilityRef = self->_reachabilityRef;
    Current = CFRunLoopGetCurrent();
    LOBYTE(v3) = SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, Current, kCFRunLoopDefaultMode) != 0;
  }
  return v3;
}

- (void)stopNotifier
{
  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef)
  {
    Current = CFRunLoopGetCurrent();
    SCNetworkReachabilityUnscheduleFromRunLoop(reachabilityRef, Current, kCFRunLoopDefaultMode);
  }
}

- (void)dealloc
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
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
  SCNetworkReachabilityFlags flags = 0;
  if (!SCNetworkReachabilityGetFlags(self->_reachabilityRef, &flags)) {
    return 0;
  }
  if (self->_alwaysReturnLocalWiFiStatus) {
    return [(ICReachability *)self localWiFiStatusForFlags:flags];
  }
  return [(ICReachability *)self networkStatusForFlags:flags];
}

@end