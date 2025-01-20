@interface APPCEventStorageListener
+ (id)sharedInstance;
- (APPCEventStorageListener)init;
- (NSSet)allowList;
- (void)_storeEvent:(id)a3;
- (void)start;
@end

@implementation APPCEventStorageListener

+ (id)sharedInstance
{
  v3 = +[APUniversalSingleton sharedInstance];
  v4 = [v3 eventStorageListener];
  if (!v4)
  {
    id v5 = a1;
    objc_sync_enter(v5);
    v4 = [v3 eventStorageListener];
    if (!v4)
    {
      v4 = objc_alloc_init(APPCEventStorageListener);
      [v3 setEventStorageListener:v4];
    }
    objc_sync_exit(v5);
  }

  return v4;
}

- (APPCEventStorageListener)init
{
  v6.receiver = self;
  v6.super_class = (Class)APPCEventStorageListener;
  v2 = [(APPCBaseEventListener *)&v6 init];
  if (v2)
  {
    v3 = (NSSet *)[objc_alloc((Class)NSSet) initWithObjects:@"com.apple.AppStore", @"com.apple.AppStore.ProductPageExtension", nil];
    allowList = v2->_allowList;
    v2->_allowList = v3;
  }
  return v2;
}

- (void)start
{
  objc_initWeak(&location, self);
  v3 = +[MetricsModule storage];
  v4 = [v3 notificationRegistrar];
  objc_super v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  v8 = sub_1001814F4;
  v9 = &unk_100238958;
  objc_copyWeak(&v10, &location);
  id v5 = [v4 registerHandlerForPurpose:100 closure:&v6];
  -[APPCBaseEventListener setToken:](self, "setToken:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_storeEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bundleIdentifier];
  if ([v5 length])
  {
    objc_super v6 = [(APPCEventStorageListener *)self allowList];
    unsigned __int8 v7 = [v6 containsObject:v5];

    if ((v7 & 1) == 0)
    {
      v8 = APLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478083;
        id v52 = (id)objc_opt_class();
        __int16 v53 = 2114;
        uint64_t v54 = (uint64_t)v5;
        id v9 = v52;
        id v10 = "[%{private}@] Event Storage discarding metric for BundleId: %{public}@";
        v11 = v8;
        uint32_t v12 = 22;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, v10, buf, v12);

        goto LABEL_38;
      }
      goto LABEL_38;
    }
LABEL_8:
    v19 = +[APDatabaseManager mainDatabase];
    v8 = [v19 getTableForClass:objc_opt_class()];

    if (v8)
    {
      v20 = (char *)[v4 metric];
      if ((unint64_t)(v20 - 1406) <= 5 && ((1 << (v20 - 126)) & 0x25) != 0)
      {
        if ([v4 metric] == (id)1406)
        {
          v21 = [v4 properties];
          v22 = [v21 objectForKey:@"percent"];

          v23 = [v4 properties];
          v24 = [v23 objectForKey:@"duration"];

          BOOL v25 = 0;
          if (v22 && v24)
          {
            [v22 doubleValue];
            if (v26 >= 50.0)
            {
              [v24 doubleValue];
              BOOL v25 = v36 >= 1000.0;
            }
            else
            {
              BOOL v25 = 0;
            }
          }
        }
        else
        {
          BOOL v25 = 0;
        }
        v37 = APLogForCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          v38 = objc_opt_class();
          id v39 = v38;
          uint64_t v40 = [v4 description];
          v41 = (void *)v40;
          CFStringRef v42 = @"NO";
          *(_DWORD *)buf = 138478339;
          id v52 = v38;
          __int16 v53 = 2114;
          if (v25) {
            CFStringRef v42 = @"YES";
          }
          uint64_t v54 = v40;
          __int16 v55 = 2114;
          CFStringRef v56 = v42;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "[%{private}@] Storing event %{public}@ as impression: %{public}@", buf, 0x20u);
        }
        v31 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 metric]);
        v34 = [v4 handle];
        v35 = [v4 timestamp];
        [v8 insertEvent:v31 handle:v34 impression:v25 timestamp:v35];
      }
      else
      {
        if (v20 != (char *)1000) {
          goto LABEL_38;
        }
        v29 = [v4 internalProperties];
        v30 = v29;
        if (v29)
        {
          v31 = [v29 objectForKey:kAPMetricSubscriptionIdentifier];
          uint64_t v32 = kAPMetricImpressionIdentifier;
          v33 = [v30 objectForKey:kAPMetricImpressionIdentifier];
          v34 = [v30 objectForKey:kAPMetadataIdentifier];
          if (v33)
          {
            uint64_t v49 = v32;
            v50 = v33;
            v35 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
          }
          else
          {
            v35 = 0;
          }
        }
        else
        {
          v35 = 0;
          v34 = 0;
          v31 = 0;
        }
        v43 = APLogForCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          v44 = objc_opt_class();
          id v48 = v44;
          v45 = [v4 description];
          *(_DWORD *)buf = 138478083;
          id v52 = v44;
          __int16 v53 = 2114;
          uint64_t v54 = (uint64_t)v45;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "[%{private}@] Storing recieved event %{public}@", buf, 0x16u);
        }
        v46 = [v4 handle];
        v47 = [v4 bundleIdentifier];
        [v8 insertReceivedEventWithHandle:v46 bundleId:v47 adamId:v31 adMetadata:v34 adProperties:v35];
      }
      goto LABEL_38;
    }
    goto LABEL_38;
  }
  v13 = APLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = objc_opt_class();
    id v15 = v14;
    id v16 = [v4 metric];
    v17 = [v4 contentIdentifier];
    *(_DWORD *)buf = 138478339;
    id v52 = v14;
    __int16 v53 = 2048;
    uint64_t v54 = (uint64_t)v16;
    __int16 v55 = 2114;
    CFStringRef v56 = v17;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "[%{private}@] BundleID is nil for metric %ld for contentIdentifier %{public}@", buf, 0x20u);
  }
  unsigned int v18 = [v4 source];
  if (v18 == 978) {
    goto LABEL_8;
  }
  unsigned int v27 = v18;
  v8 = APLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v28 = objc_opt_class();
    *(_DWORD *)buf = 138478083;
    id v52 = v28;
    __int16 v53 = 1024;
    LODWORD(v54) = v27;
    id v9 = v28;
    id v10 = "[%{private}@] Event Storage discarding metric for source: %u";
    v11 = v8;
    uint32_t v12 = 18;
    goto LABEL_18;
  }
LABEL_38:
}

- (NSSet)allowList
{
  return self->_allowList;
}

- (void).cxx_destruct
{
}

@end