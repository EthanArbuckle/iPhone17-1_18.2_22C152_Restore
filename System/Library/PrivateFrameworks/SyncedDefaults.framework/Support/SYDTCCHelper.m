@interface SYDTCCHelper
+ (id)sharedHelper;
- (BOOL)isUbiquityDisabledForStoreIdentifier:(id)a3;
- (NSSet)cachedDisabledStoreIdentifiers;
- (OS_dispatch_queue)queue;
- (SYDTCCHelper)init;
- (id)findDisabledStoreIdentifiers;
- (int)notifyToken;
- (void)dealloc;
- (void)enableUbiquityIfNecessaryForAuditToken:(id *)a3;
- (void)setCachedDisabledStoreIdentifiers:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setQueue:(id)a3;
- (void)startListeningToTCCAccessChangedNotifications;
- (void)stopListeningToTCCAccessChangedNotifications;
@end

@implementation SYDTCCHelper

- (void)enableUbiquityIfNecessaryForAuditToken:(id *)a3
{
  v4 = SYDGetTCCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100005FC4();
  }

  id v32 = 0;
  long long v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)buf = *(_OWORD *)a3->var0;
  long long v35 = v5;
  v6 = +[LSBundleRecord bundleRecordForAuditToken:buf error:&v32];
  id v7 = v32;
  v8 = [v6 bundleIdentifier];
  if (v8)
  {
    id v27 = v7;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v9 = (id)TCCAccessCopyInformationForBundleId();
    id v10 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v29;
LABEL_6:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v28 + 1) + 8 * v13);
        v15 = [v14 objectForKeyedSubscript:kTCCInfoService];
        if ([v15 isEqualToString:kTCCServiceUbiquity]) {
          break;
        }

        if (v11 == (id)++v13)
        {
          id v11 = [v9 countByEnumeratingWithState:&v28 objects:v33 count:16];
          if (v11) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      v16 = [v14 objectForKeyedSubscript:kTCCInfoGranted];

      if (!v16) {
        goto LABEL_17;
      }
      unsigned int v17 = [v16 BOOLValue];
      v18 = SYDGetTCCLog();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
      if (v17)
      {
        if (v19) {
          sub_100006070((uint64_t)v8, v18, v20, v21, v22, v23, v24, v25);
        }
      }
      else if (v19)
      {
        sub_1000311C4((uint64_t)v8, v18, v20, v21, v22, v23, v24, v25);
      }
    }
    else
    {
LABEL_12:

LABEL_17:
      v26 = SYDGetTCCLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v8;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Enabling TCC for %@", buf, 0xCu);
      }

      TCCAccessSetForBundleId();
    }
    id v7 = v27;
  }
  else
  {
    v9 = SYDGetTCCLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100031190();
    }
  }
}

+ (id)sharedHelper
{
  if (qword_10005BB90 != -1) {
    dispatch_once(&qword_10005BB90, &stru_100050F28);
  }
  v2 = (void *)qword_10005BB88;
  return v2;
}

- (SYDTCCHelper)init
{
  v7.receiver = self;
  v7.super_class = (Class)SYDTCCHelper;
  v2 = [(SYDTCCHelper *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.kvs.tcc", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v2->_notifyToken = -1;
    [(SYDTCCHelper *)v2 startListeningToTCCAccessChangedNotifications];
  }
  return v2;
}

- (void)dealloc
{
  [(SYDTCCHelper *)self stopListeningToTCCAccessChangedNotifications];
  v3.receiver = self;
  v3.super_class = (Class)SYDTCCHelper;
  [(SYDTCCHelper *)&v3 dealloc];
}

- (BOOL)isUbiquityDisabledForStoreIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  long long v5 = [(SYDTCCHelper *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019400;
  block[3] = &unk_100050F50;
  id v9 = v4;
  id v10 = self;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

- (id)findDisabledStoreIdentifiers
{
  v2 = SYDGetTCCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Finding list of disabled store identifiers", buf, 2u);
  }

  id v25 = +[NSMutableSet set];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = (id)TCCAccessCopyBundleIdentifiersDisabledForService();
  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v28;
    v8 = &_sSS10FoundationE19_bridgeToObjectiveCSo8NSStringCyF_ptr;
    *(void *)&long long v5 = 138412802;
    long long v23 = v5;
    uint64_t v24 = *(void *)v28;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v11 = v8[229];
        id v26 = 0;
        uint64_t v12 = objc_msgSend(v11, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v10, 0, &v26, v23);
        id v13 = v26;
        if (v13)
        {
          uint64_t v14 = SYDGetTCCLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v32 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error getting bundle record: %@", buf, 0xCu);
          }
        }
        else if (v12)
        {
          id v15 = v3;
          uint64_t v14 = [v12 entitlements];
          v16 = [v14 objectForKey:@"com.apple.developer.ubiquity-kvstore-identifier" ofClass:objc_opt_class()];
          uint64_t v17 = objc_opt_class();
          v18 = [v14 objectForKey:@"com.apple.private.ubiquity-additional-kvstore-identifiers" ofClass:v17 valuesOfClass:objc_opt_class()];
          BOOL v19 = v18;
          if (v16 || [v18 count])
          {
            uint64_t v20 = SYDGetTCCLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v23;
              id v32 = v10;
              __int16 v33 = 2112;
              v34 = v16;
              __int16 v35 = 2112;
              v36 = v19;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Bundle %@ has Ubiquity disabled and is entitled to defaultStoreIdentifier=%@ additionalStoreIdentifiers=%@", buf, 0x20u);
            }

            if (v16) {
              [v25 addObject:v16];
            }
            id v3 = v15;
            if ([v19 count]) {
              [v25 addObjectsFromArray:v19];
            }
          }
          else
          {
            uint64_t v21 = SYDGetTCCLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v32 = v10;
              _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Bundle %@ has Ubiquity disabled, but is not entitled to any KVS stores", buf, 0xCu);
            }

            id v3 = v15;
          }

          uint64_t v7 = v24;
          v8 = &_sSS10FoundationE19_bridgeToObjectiveCSo8NSStringCyF_ptr;
        }
        else
        {
          uint64_t v14 = SYDGetTCCLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v32 = v10;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Couldn't find bundle record for disabled bundle %@", buf, 0xCu);
          }
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v6);
  }

  return v25;
}

- (void)startListeningToTCCAccessChangedNotifications
{
  id v3 = SYDGetTCCLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100031230();
  }

  objc_initWeak(&location, self);
  int out_token = -1;
  id v4 = [(SYDTCCHelper *)self queue];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100019AAC;
  handler[3] = &unk_100050F78;
  objc_copyWeak(&v8, &location);
  uint32_t v5 = notify_register_dispatch("com.apple.tcc.access.changed", &out_token, v4, handler);

  if (v5) {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v6 = out_token;
  }
  [(SYDTCCHelper *)self setNotifyToken:v6];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)stopListeningToTCCAccessChangedNotifications
{
  if ([(SYDTCCHelper *)self notifyToken] != -1)
  {
    id v3 = SYDGetTCCLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100031298();
    }

    notify_cancel([(SYDTCCHelper *)self notifyToken]);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (NSSet)cachedDisabledStoreIdentifiers
{
  return self->_cachedDisabledStoreIdentifiers;
}

- (void)setCachedDisabledStoreIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDisabledStoreIdentifiers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end