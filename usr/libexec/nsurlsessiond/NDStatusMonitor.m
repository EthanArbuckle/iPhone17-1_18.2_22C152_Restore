@interface NDStatusMonitor
+ (id)sharedMonitor;
- (NDStatusMonitor)init;
- (void)dealloc;
- (void)handleBetterNetworkEvent;
- (void)performCallbackAfterNetworkChangedEvent:(id)a3 identifier:(unint64_t)a4 delay:(int64_t)a5;
- (void)performCallbackAfterNetworkChangedEvent:(id)a3 identifier:(unint64_t)a4 numberOfPreviousRetries:(unint64_t)a5;
- (void)simulateNetworkChangedEvent:(id)a3 identifier:(unint64_t)a4;
- (void)start;
- (void)startMonitoringDynamicStore;
- (void)stop;
- (void)stopMonitoringDynamicStore;
@end

@implementation NDStatusMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_clients, 0);
}

- (void)stop
{
  int symptomToken = self->_symptomToken;
  if (symptomToken)
  {
    notify_cancel(symptomToken);
    self->_int symptomToken = 0;
  }
}

- (void)start
{
  queue = self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100040B24;
  handler[3] = &unk_1000B5DA8;
  handler[4] = self;
  notify_register_dispatch("com.apple.symptoms.managed_events.joined-known-good-network", &self->_symptomToken, queue, handler);
}

- (void)stopMonitoringDynamicStore
{
  dynamicStore = self->_dynamicStore;
  if (dynamicStore) {
    SCDynamicStoreSetDispatchQueue(dynamicStore, 0);
  }
}

- (void)startMonitoringDynamicStore
{
  dynamicStore = self->_dynamicStore;
  if (dynamicStore) {
    goto LABEL_10;
  }
  context.version = 0;
  context.info = self;
  memset(&context.retain, 0, 24);
  v4 = SCDynamicStoreCreate(0, @"com.apple.nsurlsessiond", (SCDynamicStoreCallBack)sub_100040DC8, &context);
  if (v4)
  {
    CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetIPv4);
    CFStringRef v6 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetIPv6);
    CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetIPv4);
    CFStringRef v8 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetIPv6);
    Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    v10 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(Mutable, NetworkGlobalEntity);
    CFArrayAppendValue(Mutable, v6);
    CFArrayAppendValue(v10, NetworkInterfaceEntity);
    CFArrayAppendValue(v10, v8);
    if (SCDynamicStoreSetNotificationKeys(v4, Mutable, v10))
    {
      self->_dynamicStore = v4;
    }
    else
    {
      v11 = (id)qword_1000CB148;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = SCError();
        v13 = SCErrorString(v12);
        int v14 = SCError();
        *(_DWORD *)buf = 136315394;
        v17 = v13;
        __int16 v18 = 1024;
        int v19 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "SCDynamicStoreSetNotificationKeys failed: %s [%d]", buf, 0x12u);
      }

      CFRelease(v4);
    }
    CFRelease(NetworkGlobalEntity);
    CFRelease(v6);
    CFRelease(NetworkInterfaceEntity);
    CFRelease(v8);
    CFRelease(Mutable);
    CFRelease(v10);
  }
  dynamicStore = self->_dynamicStore;
  if (dynamicStore) {
LABEL_10:
  }
    SCDynamicStoreSetDispatchQueue(dynamicStore, (dispatch_queue_t)self->_queue);
}

- (void)handleBetterNetworkEvent
{
  v3 = qword_1000CB148;
  if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received symptom that we may be on a better network", buf, 2u);
  }
  if ([(NSMutableSet *)self->_clients count])
  {
    v4 = qword_1000CB148;
    if (os_log_type_enabled((os_log_t)qword_1000CB148, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "executing blocks waiting for network change", buf, 2u);
    }
    v5 = self->_clients;
    CFStringRef v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    clients = self->_clients;
    self->_clients = v6;

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    CFStringRef v8 = v5;
    id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          int v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v13 = [v12 client:v14];
          [v13 statusMonitor:self callbackForIdentifier:[v12 identifier] networkChanged:1];
        }
        id v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }

    symptom_create();
    symptom_send();
  }
}

- (void)simulateNetworkChangedEvent:(id)a3 identifier:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000410AC;
  block[3] = &unk_1000B63F8;
  v11 = self;
  unint64_t v12 = a4;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)performCallbackAfterNetworkChangedEvent:(id)a3 identifier:(unint64_t)a4 delay:(int64_t)a5
{
  id v8 = a3;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004125C;
  v11[3] = &unk_1000B5750;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  int64_t v14 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (void)performCallbackAfterNetworkChangedEvent:(id)a3 identifier:(unint64_t)a4 numberOfPreviousRetries:(unint64_t)a5
{
  double v8 = exp2((double)a5);

  [(NDStatusMonitor *)self performCallbackAfterNetworkChangedEvent:a3 identifier:a4 delay:(uint64_t)(v8 * 900.0)];
}

- (void)dealloc
{
  [(NDStatusMonitor *)self stop];
  dynamicStore = self->_dynamicStore;
  if (dynamicStore) {
    CFRelease(dynamicStore);
  }
  v4.receiver = self;
  v4.super_class = (Class)NDStatusMonitor;
  [(NDStatusMonitor *)&v4 dealloc];
}

- (NDStatusMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)NDStatusMonitor;
  v2 = [(NDStatusMonitor *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    clients = v2->_clients;
    v2->_clients = v3;

    v2->_networkChangeEventCount = 0;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.nsurlsessiond.status-monitor", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

+ (id)sharedMonitor
{
  if (qword_1000CB058 != -1) {
    dispatch_once(&qword_1000CB058, &stru_1000B5728);
  }
  v2 = (void *)qword_1000CB060;

  return v2;
}

@end