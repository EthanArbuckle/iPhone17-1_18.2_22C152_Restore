@interface STNetworkDetector
+ (id)sharedInstance;
- (BOOL)_isOnlineWithFlags:(unsigned int)a3;
- (BOOL)isOnline;
- (id)_init;
- (void)_detectedChangeInFlags:(unsigned int)a3;
- (void)_startOfflineDetection;
- (void)_stopOfflineDetection;
- (void)setIsOnline:(BOOL)a3;
@end

@implementation STNetworkDetector

+ (id)sharedInstance
{
  if (qword_100346918 != -1) {
    dispatch_once(&qword_100346918, &stru_1002FB870);
  }
  v2 = (void *)qword_100346910;
  return v2;
}

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)STNetworkDetector;
  v2 = [(STNetworkDetector *)&v5 init];
  v3 = v2;
  if (v2) {
    [(STNetworkDetector *)v2 _startOfflineDetection];
  }
  return v3;
}

- (BOOL)_isOnlineWithFlags:(unsigned int)a3
{
  return (a3 & 6) == 2;
}

- (void)_startOfflineDetection
{
  if (!self->_reachabilityRef)
  {
    context.version = 0;
    context.info = self;
    memset(&context.retain, 0, 24);
    sockaddr address = (sockaddr)xmmword_100284AF0;
    v3 = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, &address);
    self->_reachabilityRef = v3;
    SCNetworkReachabilitySetCallback(v3, (SCNetworkReachabilityCallBack)sub_1000154DC, &context);
    SCNetworkReachabilitySetDispatchQueue(self->_reachabilityRef, (dispatch_queue_t)&_dispatch_main_q);
    SCNetworkReachabilityFlags flags = 0;
    SCNetworkReachabilityGetFlags(self->_reachabilityRef, &flags);
    [(STNetworkDetector *)self setIsOnline:[(STNetworkDetector *)self _isOnlineWithFlags:flags]];
  }
}

- (void)_stopOfflineDetection
{
  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef)
  {
    SCNetworkReachabilitySetDispatchQueue(reachabilityRef, 0);
    self->_reachabilityRef = 0;
  }
}

- (void)_detectedChangeInFlags:(unsigned int)a3
{
  BOOL v4 = [(STNetworkDetector *)self _isOnlineWithFlags:*(void *)&a3];
  if (v4 != [(STNetworkDetector *)self isOnline])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v6[0] = 67109120;
      v6[1] = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Detected change in network connectivity: isOnline = %d", (uint8_t *)v6, 8u);
    }
    [(STNetworkDetector *)self setIsOnline:v4];
    objc_super v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotificationName:@"STNetworkDetectorChangedNotificationName" object:self];
  }
}

- (BOOL)isOnline
{
  return self->_isOnline;
}

- (void)setIsOnline:(BOOL)a3
{
  self->_isOnline = a3;
}

@end