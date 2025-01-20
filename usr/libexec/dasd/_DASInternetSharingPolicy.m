@interface _DASInternetSharingPolicy
+ (id)policyInstance;
- (BOOL)appliesToActivity:(id)a3;
- (BOOL)enabled;
- (BOOL)hasStateForNetworkType:(__CFString *)a3 interfaceName:(__CFString *)a4;
- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4;
- (NSArray)triggers;
- (NSString)policyDescription;
- (NSString)policyName;
- (OS_dispatch_queue)wirelessModemDynamicStoreQueue;
- (_DASInternetSharingPolicy)init;
- (__CFString)wirelessModemDynamicStoreSharingKey;
- (__SCDynamicStore)wirelessModemDynamicStore;
- (double)weightForActivity:(id)a3;
- (id)responseForActivity:(id)a3 withState:(id)a4;
- (void)handleWirelessModemDynamicStoreChanged;
- (void)setEnabled:(BOOL)a3;
- (void)setPolicyDescription:(id)a3;
- (void)setPolicyName:(id)a3;
- (void)setTriggers:(id)a3;
- (void)setWirelessModemDynamicStore:(__SCDynamicStore *)a3;
- (void)setWirelessModemDynamicStoreQueue:(id)a3;
- (void)setWirelessModemDynamicStoreSharingKey:(__CFString *)a3;
@end

@implementation _DASInternetSharingPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3 = a3;
  id v4 = [v3 schedulingPriority];
  if ((unint64_t)v4 < _DASSchedulingPriorityUtility
    && ([v3 requiresNetwork] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unsigned __int8 v5 = [v3 requiresDeviceInactivity];
  }

  return v5;
}

- (_DASInternetSharingPolicy)init
{
  v12.receiver = self;
  v12.super_class = (Class)_DASInternetSharingPolicy;
  v2 = [(_DASInternetSharingPolicy *)&v12 init];
  id v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)@"Internet Sharing Policy";

    unsigned __int8 v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.dasd.wirelessModemDynamicStoreQueue", v5);
    wirelessModemDynamicStoreQueue = v3->_wirelessModemDynamicStoreQueue;
    v3->_wirelessModemDynamicStoreQueue = (OS_dispatch_queue *)v6;

    v8 = v3->_wirelessModemDynamicStoreQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004D874;
    block[3] = &unk_1001754F8;
    v11 = v3;
    dispatch_async(v8, block);
  }
  return v3;
}

+ (id)policyInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004DB6C;
  block[3] = &unk_1001753E0;
  void block[4] = a1;
  if (qword_1001C3D88 != -1) {
    dispatch_once(&qword_1001C3D88, block);
  }
  v2 = (void *)qword_1001C3D90;

  return v2;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 1;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  unsigned __int8 v5 = [[_DASPolicyResponseRationale alloc] initWithPolicyName:@"Internet Sharing Policy"];
  if ([(_DASInternetSharingPolicy *)self enabled])
  {
    dispatch_queue_t v6 = +[NSPredicate predicateWithFormat:@"InternetSharingActive = %@", &off_100186D18];
    [(_DASPolicyResponseRationale *)v5 addRationaleWithCondition:v6];

    uint64_t v7 = 33;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = +[_DASPolicyResponse policyResponseWithDecision:v7 validityDuration:v5 rationale:(double)0x384uLL];

  return v8;
}

- (void)handleWirelessModemDynamicStoreChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_wirelessModemDynamicStoreQueue);
  CFDictionaryRef v3 = (const __CFDictionary *)SCDynamicStoreCopyValue(self->_wirelessModemDynamicStore, self->_wirelessModemDynamicStoreSharingKey);
  if (!v3) {
    return;
  }
  CFDictionaryRef v4 = v3;
  CFTypeID v5 = CFGetTypeID(v3);
  if (v5 != CFDictionaryGetTypeID()) {
    goto LABEL_11;
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v4, @"InternalInterfaces");
  CFArrayRef v7 = Value;
  if (!Value) {
    goto LABEL_12;
  }
  if (!CFArrayGetCount(Value)
    || (ValueAtIndex = CFArrayGetValueAtIndex(v7, 0),
        ![(_DASInternetSharingPolicy *)self hasStateForNetworkType:kSCEntNetIPv4 interfaceName:ValueAtIndex])&& ![(_DASInternetSharingPolicy *)self hasStateForNetworkType:kSCEntNetIPv6 interfaceName:ValueAtIndex])
  {
LABEL_11:
    LODWORD(v7) = 0;
    goto LABEL_12;
  }
  CFDictionaryRef v9 = (const __CFDictionary *)CFDictionaryGetValue(v4, @"Hosts");
  CFArrayRef v7 = v9;
  if (v9)
  {
    if (CFDictionaryGetCount(v9))
    {
      v10 = CFDictionaryGetValue(v7, @"Current");
      v11 = v10;
      if (v10) {
        LODWORD(v7) = [v10 intValue];
      }
      else {
        LODWORD(v7) = 0;
      }

      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_12:
  if ([(_DASInternetSharingPolicy *)self enabled] != (int)v7 > 0)
  {
    [(_DASInternetSharingPolicy *)self setEnabled:(int)v7 > 0];
    objc_super v12 = +[_DASDaemonLogger logForCategory:@"InternetSharingPolicy"];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13[0] = 67109120;
      v13[1] = (int)v7 > 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "InternetSharing in use: %d", (uint8_t *)v13, 8u);
    }
  }
  CFRelease(v4);
}

- (BOOL)hasStateForNetworkType:(__CFString *)a3 interfaceName:(__CFString *)a4
{
  CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, a4, a3);
  if (!NetworkInterfaceEntity) {
    return 0;
  }
  CFStringRef v6 = NetworkInterfaceEntity;
  CFPropertyListRef v7 = SCDynamicStoreCopyValue(self->_wirelessModemDynamicStore, NetworkInterfaceEntity);
  BOOL v8 = v7 != 0;
  if (v7) {
    CFRelease(v7);
  }
  CFRelease(v6);
  return v8;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
}

- (__SCDynamicStore)wirelessModemDynamicStore
{
  return self->_wirelessModemDynamicStore;
}

- (void)setWirelessModemDynamicStore:(__SCDynamicStore *)a3
{
  self->_wirelessModemDynamicStore = a3;
}

- (OS_dispatch_queue)wirelessModemDynamicStoreQueue
{
  return self->_wirelessModemDynamicStoreQueue;
}

- (void)setWirelessModemDynamicStoreQueue:(id)a3
{
}

- (__CFString)wirelessModemDynamicStoreSharingKey
{
  return self->_wirelessModemDynamicStoreSharingKey;
}

- (void)setWirelessModemDynamicStoreSharingKey:(__CFString *)a3
{
  self->_wirelessModemDynamicStoreSharingKey = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wirelessModemDynamicStoreQueue, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);

  objc_storeStrong((id *)&self->_policyName, 0);
}

@end