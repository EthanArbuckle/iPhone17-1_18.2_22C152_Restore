@interface NEHelperCacheManager
- (NEHelperCacheManager)init;
- (NEHelperCacheManager)initWithFirstMessage:(id)a3;
- (OS_dispatch_queue)handlerQueue;
- (void)dealloc;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperCacheManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientName, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  sub_100020288();
  selfa = (SCPreferencesRef *)objc_claimAutoreleasedReturnValue();
  if (self) {
    id Property = objc_getProperty(self, v5, 24, 1);
  }
  else {
    id Property = 0;
  }
  v7 = selfa;
  if (selfa)
  {
    objc_setProperty_atomic(selfa, v5, Property, 24);
    v7 = selfa;
  }
  sub_1000202E0(v7, v4);
}

- (OS_dispatch_queue)handlerQueue
{
  id Property = sub_100020288();
  id v4 = Property;
  if (Property) {
    id Property = objc_getProperty(Property, v3, 8, 1);
  }
  v5 = Property;

  return v5;
}

- (void)dealloc
{
  myCFRelease();
  v3.receiver = self;
  v3.super_class = (Class)NEHelperCacheManager;
  [(NEHelperCacheManager *)&v3 dealloc];
}

- (NEHelperCacheManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)NEHelperCacheManager;
  v2 = [(NEHelperCacheManager *)&v9 init];
  if (!v2) {
    goto LABEL_3;
  }
  objc_super v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("nehelper cache manager", v3);
  queue = v2->_queue;
  v2->_queue = (OS_dispatch_queue *)v4;

  SCPreferencesRef v6 = SCPreferencesCreate(kCFAllocatorDefault, @"nehelper", @"/Library/Preferences/com.apple.networkextension.cache.plist");
  v2->_prefs = v6;
  if (!v6) {
    v7 = 0;
  }
  else {
LABEL_3:
  }
    v7 = v2;

  return v7;
}

- (NEHelperCacheManager)initWithFirstMessage:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NEHelperCacheManager;
  v5 = [(NEHelperCacheManager *)&v12 init];
  if (v5)
  {
    xpc_dictionary_get_remote_connection(v4);
    SCPreferencesRef v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      pid_t pid = xpc_connection_get_pid(v6);
      if (proc_name(pid, buffer, 0x100u) < 1)
      {
        clientName = ne_log_obj();
        if (os_log_type_enabled(clientName, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          pid_t v14 = pid;
          _os_log_error_impl((void *)&_mh_execute_header, clientName, OS_LOG_TYPE_ERROR, "Failed to get the process name for %d", buf, 8u);
        }
      }
      else
      {
        objc_super v9 = (NSString *)[objc_alloc((Class)NSString) initWithCString:buffer encoding:4];
        clientName = v5->_clientName;
        v5->_clientName = v9;
      }
    }
  }

  return v5;
}

@end