@interface TSUNetworkReachability
+ (id)networkReachabilityForDocumentResources;
+ (id)networkReachabilityForInternetConnection;
+ (id)networkReachabilityForLocalWiFi;
+ (id)networkReachabilityWithAddress:(const sockaddr_in *)a3;
+ (id)networkReachabilityWithHostName:(id)a3;
+ (int64_t)networkReachabilityStatusForDocumentResources;
+ (int64_t)networkReachabilityStatusForInternetConnection;
+ (int64_t)networkReachabilityStatusForLocalWiFi;
- (BOOL)connectionRequired;
- (TSUNetworkReachability)init;
- (TSUNetworkReachability)initWithReachabilityRef:(__SCNetworkReachability *)a3;
- (int64_t)localWiFiStatusForFlags:(unsigned int)a3;
- (int64_t)networkStatusForFlags:(unsigned int)a3;
- (int64_t)status;
- (void)dealloc;
@end

@implementation TSUNetworkReachability

- (TSUNetworkReachability)init
{
  v2 = +[TSUAssertionHandler currentHandler];
  v3 = [NSString stringWithUTF8String:"-[TSUNetworkReachability init]"];
  v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNetworkReachability.m"];
  [v2 handleFailureInFunction:v3 file:v4 lineNumber:47 description:@"Do not call method"];

  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[TSUNetworkReachability init]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (TSUNetworkReachability)initWithReachabilityRef:(__SCNetworkReachability *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSUNetworkReachability;
  v4 = [(TSUNetworkReachability *)&v6 init];
  if (v4)
  {
    CFRetain(a3);
    v4->_reachabilityRef = a3;
  }
  return v4;
}

- (void)dealloc
{
  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef) {
    CFRelease(reachabilityRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUNetworkReachability;
  [(TSUNetworkReachability *)&v4 dealloc];
}

+ (id)networkReachabilityWithHostName:(id)a3
{
  SCNetworkReachabilityRef v3 = SCNetworkReachabilityCreateWithName(0, (const char *)[a3 UTF8String]);
  if (v3)
  {
    SCNetworkReachabilityRef v4 = v3;
    v5 = [[TSUNetworkReachability alloc] initWithReachabilityRef:v3];
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)networkReachabilityWithAddress:(const sockaddr_in *)a3
{
  SCNetworkReachabilityRef v3 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x263EFFB08], (const sockaddr *)a3);
  if (v3)
  {
    SCNetworkReachabilityRef v4 = v3;
    v5 = [[TSUNetworkReachability alloc] initWithReachabilityRef:v3];
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)networkReachabilityForDocumentResources
{
  return (id)[a1 networkReachabilityWithHostName:@"configuration.apple.com"];
}

+ (id)networkReachabilityForInternetConnection
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[1] = 0;
  v4[0] = 528;
  v2 = [a1 networkReachabilityWithAddress:v4];
  return v2;
}

+ (id)networkReachabilityForLocalWiFi
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[1] = 0;
  v4[0] = 0xFEA900000210;
  v2 = [a1 networkReachabilityWithAddress:v4];
  if (v2) {
    v2[16] = 1;
  }
  return v2;
}

+ (int64_t)networkReachabilityStatusForDocumentResources
{
  v2 = [a1 networkReachabilityForDocumentResources];
  int64_t v3 = [v2 status];

  return v3;
}

+ (int64_t)networkReachabilityStatusForInternetConnection
{
  v2 = [a1 networkReachabilityForInternetConnection];
  int64_t v3 = [v2 status];

  return v3;
}

+ (int64_t)networkReachabilityStatusForLocalWiFi
{
  v2 = [a1 networkReachabilityForLocalWiFi];
  int64_t v3 = [v2 status];

  return v3;
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
  reachabilityRef = self->_reachabilityRef;
  if (!reachabilityRef)
  {
    int64_t v4 = +[TSUAssertionHandler currentHandler];
    v5 = [NSString stringWithUTF8String:"-[TSUNetworkReachability connectionRequired]"];
    objc_super v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNetworkReachability.m"];
    [v4 handleFailureInFunction:v5 file:v6 lineNumber:193 description:@"connectionRequired called with NULL _reachabilityRef"];

    reachabilityRef = self->_reachabilityRef;
  }
  SCNetworkReachabilityFlags flags = 0;
  return SCNetworkReachabilityGetFlags(reachabilityRef, &flags) && (flags & 4) != 0;
}

- (int64_t)status
{
  reachabilityRef = self->_reachabilityRef;
  if (!reachabilityRef)
  {
    int64_t v4 = +[TSUAssertionHandler currentHandler];
    v5 = [NSString stringWithUTF8String:"-[TSUNetworkReachability status]"];
    objc_super v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUNetworkReachability.m"];
    [v4 handleFailureInFunction:v5 file:v6 lineNumber:205 description:@"currentNetworkStatus called with NULL _reachabilityRef"];

    reachabilityRef = self->_reachabilityRef;
  }
  SCNetworkReachabilityFlags flags = 0;
  if (!SCNetworkReachabilityGetFlags(reachabilityRef, &flags)) {
    return 0;
  }
  if (self->_localWiFi) {
    return [(TSUNetworkReachability *)self localWiFiStatusForFlags:flags];
  }
  return [(TSUNetworkReachability *)self networkStatusForFlags:flags];
}

@end