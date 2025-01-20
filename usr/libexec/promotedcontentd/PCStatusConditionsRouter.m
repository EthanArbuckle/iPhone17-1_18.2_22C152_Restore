@interface PCStatusConditionsRouter
- (NSString)bundleID;
- (PCStatusConditionsRouter)init;
- (id)actionReceiverForConnection:(id)a3;
- (id)machServiceName;
- (void)setBundleID:(id)a3;
@end

@implementation PCStatusConditionsRouter

- (PCStatusConditionsRouter)init
{
  v7.receiver = self;
  v7.super_class = (Class)PCStatusConditionsRouter;
  v2 = [(PCStatusConditionsRouter *)&v7 init];
  if (v2)
  {
    v3 = APLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = objc_opt_class();
      *(_DWORD *)buf = 138477827;
      v9 = v4;
      id v5 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{private}@] Initializing listener for PCStatusConditions ", buf, 0xCu);
    }
    +[APXPCListenerManager addDelegate:v2];
  }
  return v2;
}

- (id)actionReceiverForConnection:(id)a3
{
  id v3 = a3;
  v4 = [v3 bundleID];
  if (![v4 length])
  {
    if (proc_pidpath((int)[v3 processIdentifier], buf, 0x1000u) <= 0)
    {
      v10 = APLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "StatusConditionListener: Unable to determine process path. Cannot continue.", (uint8_t *)&v22, 2u);
      }
    }
    else
    {
      v10 = +[NSURL fileURLWithFileSystemRepresentation:buf isDirectory:0 relativeToURL:0];
      v11 = [v10 path];
      v12 = [v11 description];
      id v13 = [v12 length];

      if (v13)
      {
        v14 = [v10 path];
        v15 = [v14 description];
        v16 = [v15 sha256hash];

        v17 = APLogForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v22 = 138477827;
          id v23 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "StatusConditionListener: looking up '%{private}@'.", (uint8_t *)&v22, 0xCu);
        }

        id v18 = [&off_10024B548 objectForKeyedSubscript:v16];

        if (!v18)
        {
          id v18 = v16;
          v19 = APLogForCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            int v22 = 138477827;
            id v23 = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "StatusConditionListener: bundleID for %{private}@ not found.", (uint8_t *)&v22, 0xCu);
          }
        }
        v4 = v18;
        goto LABEL_2;
      }
      v20 = APLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "StatusConditionListener: The BundleID and path of process are both empty. Cannot continue.", (uint8_t *)&v22, 2u);
      }
    }
    id v5 = 0;
    goto LABEL_26;
  }
LABEL_2:
  id v5 = [[PCStatusConditionsReceiver alloc] initWithBundleID:v4 connection:v3];
  v6 = APLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if ([(PCStatusConditionsReceiver *)v5 hasWriteEntitlement]) {
      CFStringRef v7 = @"YES";
    }
    else {
      CFStringRef v7 = @"NO";
    }
    unsigned int v8 = [(PCStatusConditionsReceiver *)v5 hasReadEntitlement];
    *(_DWORD *)buf = 138543874;
    if (v8) {
      CFStringRef v9 = @"YES";
    }
    else {
      CFStringRef v9 = @"NO";
    }
    v25 = v4;
    __int16 v26 = 2114;
    CFStringRef v27 = v7;
    __int16 v28 = 2114;
    CFStringRef v29 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "StatusConditionListener: accepting ADStatusConditionService connection from client %{public}@.\nWrite entitlement: %{public}@\nRead entitlement: %{public}@", buf, 0x20u);
  }

LABEL_26:

  return v5;
}

- (id)machServiceName
{
  return @"com.apple.ap.adservicesd.statusconditionservice";
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end