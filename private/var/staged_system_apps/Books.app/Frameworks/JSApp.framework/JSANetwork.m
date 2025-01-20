@interface JSANetwork
+ (NSString)connectionTypeHeader;
+ (id)sharedInstance;
- (BOOL)hasReachabilityCallbackScheduled;
- (BOOL)isReachable;
- (BOOL)isRunningOfflineCache;
- (JSManagedValue)networkCallbackValue;
- (__SCNetworkReachability)reachabilityRef;
- (void)dealloc;
- (void)registerOnNetworkChange:(id)a3;
- (void)setHasReachabilityCallbackScheduled:(BOOL)a3;
- (void)setNetworkCallbackValue:(id)a3;
- (void)setReachabilityRef:(__SCNetworkReachability *)a3;
- (void)unregisterOnNetworkChange;
@end

@implementation JSANetwork

+ (id)sharedInstance
{
  if (qword_CE330 != -1) {
    dispatch_once(&qword_CE330, &stru_B26F0);
  }
  v2 = (void *)qword_CE338;

  return v2;
}

+ (NSString)connectionTypeHeader
{
  return (NSString *)+[ICStoreURLRequest currentConnectionTypeHeader];
}

- (BOOL)isReachable
{
  unsigned int v3 = [(JSANetwork *)self isRunningOfflineCache];
  SCNetworkReachabilityFlags flags = 0;
  if (SCNetworkReachabilityGetFlags([(JSANetwork *)self reachabilityRef], &flags)) {
    v3 |= (flags & 2) >> 1;
  }
  return v3;
}

- (BOOL)isRunningOfflineCache
{
  return +[JSAOfflineCache runFromCache];
}

- (void)registerOnNetworkChange:(id)a3
{
  id v4 = a3;
  v5 = JSALog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v9.version) = 136446210;
    *(CFIndex *)((char *)&v9.version + 4) = (CFIndex)"-[JSANetwork registerOnNetworkChange:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v9, 0xCu);
  }

  v6 = +[JSManagedValue managedValueWithValue:v4];

  [(JSANetwork *)self setNetworkCallbackValue:v6];
  if ([(JSANetwork *)self reachabilityRef])
  {
    if (![(JSANetwork *)self hasReachabilityCallbackScheduled])
    {
      SCNetworkReachabilitySetCallback([(JSANetwork *)self reachabilityRef], (SCNetworkReachabilityCallBack)sub_102B8, &v9);
      v7 = [(JSANetwork *)self reachabilityRef];
      Current = CFRunLoopGetCurrent();
      [(JSANetwork *)self setHasReachabilityCallbackScheduled:SCNetworkReachabilityScheduleWithRunLoop(v7, Current, kCFRunLoopDefaultMode) != 0];
    }
  }
}

- (void)unregisterOnNetworkChange
{
  [(JSANetwork *)self setNetworkCallbackValue:0];
  if ([(JSANetwork *)self reachabilityRef]
    && [(JSANetwork *)self hasReachabilityCallbackScheduled])
  {
    unsigned int v3 = [(JSANetwork *)self reachabilityRef];
    Current = CFRunLoopGetCurrent();
    BOOL v5 = SCNetworkReachabilityUnscheduleFromRunLoop(v3, Current, kCFRunLoopDefaultMode) == 0;
    [(JSANetwork *)self setHasReachabilityCallbackScheduled:v5];
  }
}

- (__SCNetworkReachability)reachabilityRef
{
  result = self->_reachabilityRef;
  if (!result)
  {
    *(void *)&address.sa_data[6] = 0;
    *(void *)&address.sa_len = 528;
    result = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, &address);
    self->_reachabilityRef = result;
  }
  return result;
}

- (void)dealloc
{
  [(JSANetwork *)self unregisterOnNetworkChange];
  networkCallbackValue = self->_networkCallbackValue;
  self->_networkCallbackValue = 0;

  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef) {
    CFRelease(reachabilityRef);
  }
  v5.receiver = self;
  v5.super_class = (Class)JSANetwork;
  [(JSANetwork *)&v5 dealloc];
}

- (JSManagedValue)networkCallbackValue
{
  return self->_networkCallbackValue;
}

- (void)setNetworkCallbackValue:(id)a3
{
}

- (BOOL)hasReachabilityCallbackScheduled
{
  return self->_hasReachabilityCallbackScheduled;
}

- (void)setHasReachabilityCallbackScheduled:(BOOL)a3
{
  self->_hasReachabilityCallbackScheduled = a3;
}

- (void)setReachabilityRef:(__SCNetworkReachability *)a3
{
  self->_reachabilityRef = a3;
}

- (void).cxx_destruct
{
}

@end