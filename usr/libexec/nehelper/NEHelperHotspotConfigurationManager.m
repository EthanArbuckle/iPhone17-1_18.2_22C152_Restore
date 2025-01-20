@interface NEHelperHotspotConfigurationManager
- (NEHelperHotspotConfigurationManager)initWithFirstMessage:(id)a3;
- (NSString)name;
- (OS_dispatch_queue)handlerQueue;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperHotspotConfigurationManager

- (void).cxx_destruct
{
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  if (!sub_100006998((uint64_t)self, v4))
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412290;
      id v8 = (id)objc_opt_class();
      id v6 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ failed to process request.", (uint8_t *)&v7, 0xCu);
    }
    if (xpc_dictionary_get_BOOL(v4, "IsResponseExpected")) {
      sub_100001CA0((uint64_t)NEHelperServer, v4, 107, 0);
    }
  }
}

- (OS_dispatch_queue)handlerQueue
{
  return (OS_dispatch_queue *)(id)qword_100042C18;
}

- (NSString)name
{
  return self->_bundleID;
}

- (NEHelperHotspotConfigurationManager)initWithFirstMessage:(id)a3
{
  id v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (_xpc_connection_s *)(id)objc_claimAutoreleasedReturnValue();
  self;
  id v6 = (void *)xpc_connection_copy_entitlement_value();
  int v7 = v6;
  if (!v6 || xpc_get_type(v6) != (xpc_type_t)&_xpc_type_BOOL || !xpc_BOOL_get_value(v7))
  {
    pid_t pid = xpc_connection_get_pid(v5);
    int v15 = proc_name(pid, buf, 0x100u);
    v16 = ne_log_obj();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v15 < 1)
    {
      if (v17)
      {
        *(_DWORD *)v24 = 138412546;
        id v25 = (id)objc_opt_class();
        __int16 v26 = 1024;
        LODWORD(v27) = pid;
        id v18 = v25;
        v19 = "%@ process %d is missing the com.apple.developer.networking.HotspotConfiguration entitlement.";
        v20 = v16;
        uint32_t v21 = 18;
        goto LABEL_18;
      }
    }
    else if (v17)
    {
      *(_DWORD *)v24 = 138412802;
      id v25 = (id)objc_opt_class();
      __int16 v26 = 2080;
      v27 = buf;
      __int16 v28 = 1024;
      pid_t v29 = pid;
      id v18 = v25;
      v19 = "%@ process %s[%d] is missing the com.apple.developer.networking.HotspotConfiguration entitlement.";
      v20 = v16;
      uint32_t v21 = 28;
LABEL_18:
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v19, v24, v21);
    }
    v13 = 0;
    goto LABEL_16;
  }

  v23.receiver = self;
  v23.super_class = (Class)NEHelperHotspotConfigurationManager;
  id v8 = [(NEHelperHotspotConfigurationManager *)&v23 init];
  if (v8)
  {
    self;
    if (qword_100042C28 != -1) {
      dispatch_once(&qword_100042C28, &stru_100038D30);
    }
    uint64_t v9 = NECopySigningIdentifierForXPCMessage();
    bundleID = v8->_bundleID;
    v8->_bundleID = (NSString *)v9;

    v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = v8->_bundleID;
      *(_DWORD *)buf = 138412290;
      v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Created new Hotspot configuration delegate with bundleID = %@", buf, 0xCu);
    }
  }
  self = v8;
  v13 = self;
LABEL_16:

  return v13;
}

@end