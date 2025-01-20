@interface NRLocalPropertyMonitor
+ (BOOL)_supportsR2;
+ (BOOL)supportsSecureCoding;
+ (NRLocalPropertyMonitor)sharedInstance;
+ (id)_getGestaltData:(__CFString *)a3;
+ (id)_getGestaltDictionary:(__CFString *)a3;
+ (id)_getGestaltDmin:(__CFString *)a3;
+ (id)_getGestaltNumber:(__CFString *)a3;
+ (id)_getGestaltString:(__CFString *)a3;
+ (id)_getGestaltStringValue:(__CFString *)a3 withName:(id)a4;
+ (id)remoteDeviceChipIDNumber;
+ (void)initializeGetters;
- (BOOL)hasRegisteredForNotifications;
- (BOOL)logAllPropertyReads;
- (MCProfileConnection)mcConnection;
- (MGNotificationTokenStruct)MGToken;
- (NRLocalPropertyMonitor)init;
- (NRLocalPropertyMonitor)initWithCoder:(id)a3;
- (NSDictionary)properties;
- (NSMutableDictionary)propertyCache;
- (NSObject)localeToken;
- (NSObject)planToken;
- (NSPointerArray)observers;
- (double)abs_to_seconds:(unint64_t)a3;
- (double)blockTimer:(id)a3;
- (id)_readProperty:(id)a3 shouldUpdateCache:(BOOL)a4 isUpdated:(BOOL *)a5 forceLog:(BOOL)a6;
- (id)description;
- (id)deviceCollectionObserver;
- (id)objectForKeyedSubscript:(id)a3;
- (unint64_t)abs_to_nanos:(unint64_t)a3;
- (void)_notifyObserversPropertiesDidChange:(id)a3 thisIsAllOfThem:(BOOL)a4;
- (void)_pollPropertiesAllOfThem:(BOOL)a3 dontSendChanges:(BOOL)a4;
- (void)addPropertyObserver:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleMDMDistributedNotification;
- (void)handleMDMNotification:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pollProperties;
- (void)refreshPropertyCache;
- (void)registerForMDMNotifications;
- (void)registerForNotifications;
- (void)removePropertyObserver:(id)a3;
- (void)setDeviceCollectionObserver:(id)a3;
- (void)setHasRegisteredForNotifications:(BOOL)a3;
- (void)setLocaleToken:(id)a3;
- (void)setLogAllPropertyReads:(BOOL)a3;
- (void)setMGToken:(MGNotificationTokenStruct *)a3;
- (void)setMcConnection:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPlanToken:(id)a3;
- (void)setProperties:(id)a3;
- (void)setPropertyCache:(id)a3;
- (void)setRemoteDeviceChipIDNumber:(id)a3;
- (void)unregisterFromNotifications;
@end

@implementation NRLocalPropertyMonitor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NRLocalPropertyMonitor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NRLocalPropertyMonitor *)self init];
  if (v5)
  {
    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    v6 = +[NSArray arrayWithObjects:v12 count:2];
    v7 = NRClassesForPropertiesWithArray(v6);
    v8 = [v4 decodeObjectOfClasses:v7 forKey:@"propertyCache"];
    v9 = (NSMutableDictionary *)[v8 mutableCopy];
    propertyCache = v5->_propertyCache;
    v5->_propertyCache = v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(NSMutableDictionary *)self->_propertyCache allKeys];
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    v7 = @"NRLocalPropertyMonitor cache: ";
    do
    {
      v8 = 0;
      v9 = v7;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v8);
        v11 = [(NSMutableDictionary *)self->_propertyCache objectForKey:v10];
        [(__CFString *)v9 stringByAppendingFormat:@"%@=\"%@\" ", v10, v11];
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v8 = (char *)v8 + 1;
        v9 = v7;
      }
      while (v5 != v8);
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    v7 = @"NRLocalPropertyMonitor cache: ";
  }

  return v7;
}

+ (id)_getGestaltNumber:(__CFString *)a3
{
  v3 = (void *)MGCopyAnswer();

  return v3;
}

+ (id)_getGestaltString:(__CFString *)a3
{
  return +[NRLocalPropertyMonitor _getGestaltStringValue:a3 withName:0];
}

+ (id)_getGestaltStringValue:(__CFString *)a3 withName:(id)a4
{
  if (a4) {
    [(id)qword_1001A1320 setObject:a4 forKey:a3];
  }
  id v4 = (__CFString *)MGCopyAnswer();
  id v5 = v4;
  if (!v4) {
    id v4 = @"Unknown";
  }
  uint64_t v6 = v4;

  return v6;
}

+ (id)_getGestaltData:(__CFString *)a3
{
  v3 = (void *)MGCopyAnswer();
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NSData data];
  }
  uint64_t v6 = v5;

  return v6;
}

+ (id)_getGestaltDictionary:(__CFString *)a3
{
  v3 = (_UNKNOWN **)MGCopyAnswer();
  id v4 = v3;
  if (!v3) {
    v3 = &off_100177B40;
  }
  id v5 = v3;

  return v5;
}

+ (id)_getGestaltDmin:(__CFString *)a3
{
  v3 = (void *)MGCopyAnswer();

  return v3;
}

- (void)setRemoteDeviceChipIDNumber:(id)a3
{
  id v4 = a3;
  id v5 = qword_1001A1328;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A6504;
  v7[3] = &unk_100165530;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (id)remoteDeviceChipIDNumber
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_1000A66BC;
  v9 = sub_1000A66CC;
  id v10 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A66D4;
  block[3] = &unk_1001657F0;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)qword_1001A1328, block);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (NRLocalPropertyMonitor)sharedInstance
{
  if (qword_1001A1340 != -1) {
    dispatch_once(&qword_1001A1340, &stru_100168830);
  }
  id v2 = (void *)qword_1001A1338;

  return (NRLocalPropertyMonitor *)v2;
}

- (NRLocalPropertyMonitor)init
{
  v10.receiver = self;
  v10.super_class = (Class)NRLocalPropertyMonitor;
  id v2 = [(NRLocalPropertyMonitor *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[NSPointerArray pointerArrayWithOptions:5];
    observers = v2->_observers;
    v2->_observers = (NSPointerArray *)v3;

    uint64_t v5 = +[NSUserDefaults standardUserDefaults];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v5;

    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    propertyCache = v2->_propertyCache;
    v2->_propertyCache = v7;

    v2->_MGToken = (MGNotificationTokenStruct *)-1;
    v2->_logAllPropertyReads = [(NSUserDefaults *)v2->_userDefaults BOOLForKey:@"logAllPropertyReads"];
    if (qword_1001A1350 != -1) {
      dispatch_once(&qword_1001A1350, &stru_100168850);
    }
    [(NRLocalPropertyMonitor *)v2 registerForMDMNotifications];
  }
  return v2;
}

- (void)dealloc
{
  [(NRLocalPropertyMonitor *)self unregisterFromNotifications];
  v3.receiver = self;
  v3.super_class = (Class)NRLocalPropertyMonitor;
  [(NRLocalPropertyMonitor *)&v3 dealloc];
}

- (void)registerForNotifications
{
  if (!self->_hasRegisteredForNotifications)
  {
    self->_hasRegisteredForNotifications = 1;
    objc_super v3 = nr_daemon_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      uint64_t v5 = nr_daemon_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v38 = "-[NRLocalPropertyMonitor registerForNotifications]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: trace", buf, 0xCu);
      }
    }
    [(NRLocalPropertyMonitor *)self _pollPropertiesAllOfThem:1 dontSendChanges:1];
    objc_initWeak(&location, self);
    id v6 = [(id)qword_1001A1320 allKeys];
    BOOL v7 = [v6 count] == 0;

    if (!v7)
    {
      id v8 = nr_daemon_log();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

      if (v9)
      {
        objc_super v10 = nr_daemon_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = [(id)qword_1001A1320 allKeys];
          *(_DWORD *)buf = 138543362;
          v38 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Registering for MobileGestalt updates %{public}@", buf, 0xCu);
        }
      }
      [(id)qword_1001A1320 allKeys];
      v12 = +[NRQueue registryDaemonQueue];
      long long v13 = [v12 queue];
      v34[1] = _NSConcreteStackBlock;
      v34[2] = (id)3221225472;
      v34[3] = sub_1000A6F0C;
      v34[4] = &unk_100168878;
      objc_copyWeak(&v35, &location);
      self->_MGToken = (MGNotificationTokenStruct *)MGRegisterForBulkUpdates();

      objc_destroyWeak(&v35);
    }
    long long v14 = nr_daemon_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      long long v16 = nr_daemon_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Registering for locale changes", buf, 2u);
      }
    }
    v17 = +[NSNotificationCenter defaultCenter];
    v18 = +[NSOperationQueue mainQueue];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000A7110;
    v33[3] = &unk_1001688A0;
    objc_copyWeak(v34, &location);
    v19 = [v17 addObserverForName:NSCurrentLocaleDidChangeNotification object:0 queue:v18 usingBlock:v33];
    objc_storeWeak((id *)&self->_localeToken, v19);

    v20 = dispatch_queue_create("com.nanoregistry.cellular.plan.manager.temporary", 0);
    dispatch_async(v20, &stru_1001688C0);

    v21 = +[NSNotificationCenter defaultCenter];
    v22 = +[NSOperationQueue mainQueue];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000A7390;
    v31[3] = &unk_1001688E8;
    objc_copyWeak(&v32, &location);
    v31[4] = self;
    v23 = [v21 addObserverForName:CTCellularPlanInfoDidChangeNotification object:0 queue:v22 usingBlock:v31];
    objc_storeWeak((id *)&self->_planToken, v23);

    v24 = +[NRPairingDaemon sharedInstance];
    v25 = [v24 history];

    if (v25)
    {
      v26 = [v25 deviceCollection];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000A74BC;
      v29[3] = &unk_100168938;
      objc_copyWeak(&v30, &location);
      v27 = [v26 addObserverQueue:0 withBlock:v29];
      id deviceCollectionObserver = self->_deviceCollectionObserver;
      self->_id deviceCollectionObserver = v27;

      objc_destroyWeak(&v30);
    }
    if (_NRIsInternalInstall()) {
      [(NSUserDefaults *)self->_userDefaults addObserver:self forKeyPath:@"localPropertyOverride" options:7 context:0];
    }

    objc_destroyWeak(&v32);
    objc_destroyWeak(v34);
    objc_destroyWeak(&location);
  }
}

- (void)unregisterFromNotifications
{
  if (self->_hasRegisteredForNotifications)
  {
    self->_hasRegisteredForNotifications = 0;
    objc_super v3 = nr_daemon_log();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      uint64_t v5 = nr_daemon_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315138;
        v17 = "-[NRLocalPropertyMonitor unregisterFromNotifications]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: trace", (uint8_t *)&v16, 0xCu);
      }
    }
    if (self->_MGToken != (MGNotificationTokenStruct *)-1)
    {
      MGCancelNotifications();
      self->_MGToken = (MGNotificationTokenStruct *)-1;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_localeToken);

    if (WeakRetained)
    {
      BOOL v7 = +[NSNotificationCenter defaultCenter];
      id v8 = objc_loadWeakRetained((id *)&self->_localeToken);
      [v7 removeObserver:v8];

      objc_storeWeak((id *)&self->_localeToken, 0);
    }
    id v9 = objc_loadWeakRetained((id *)&self->_planToken);

    if (v9)
    {
      objc_super v10 = +[NSNotificationCenter defaultCenter];
      id v11 = objc_loadWeakRetained((id *)&self->_planToken);
      [v10 removeObserver:v11];

      objc_storeWeak((id *)&self->_planToken, 0);
    }
    v12 = +[NRPairingDaemon sharedInstance];
    long long v13 = [v12 history];

    if (v13 && self->_deviceCollectionObserver)
    {
      long long v14 = [v13 deviceCollection];
      [v14 removeObserver:self->_deviceCollectionObserver];
      id deviceCollectionObserver = self->_deviceCollectionObserver;
      self->_id deviceCollectionObserver = 0;
    }
    if (_NRIsInternalInstall()) {
      [(NSUserDefaults *)self->_userDefaults removeObserver:self forKeyPath:@"localPropertyOverride"];
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = nr_daemon_log();
  LODWORD(a4) = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

  if (a4)
  {
    long long v14 = nr_daemon_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v62 = v10;
      __int16 v63 = 2112;
      id v64 = v11;
      __int16 v65 = 2112;
      id v66 = v12;
      __int16 v67 = 2112;
      v68 = a6;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "KVO:- keyPath:%@, object:%@, change:%@, context:%@", buf, 0x2Au);
    }
  }
  if ([v10 isEqual:@"localPropertyOverride"])
  {
    p_propertiesToOverride = &self->_propertiesToOverride;
    v49 = self->_propertiesToOverride;
    int v16 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
    if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v46 = v12;
      id v47 = v11;
      id v48 = v10;
      objc_storeStrong((id *)&self->_propertiesToOverride, v16);
      v50 = objc_alloc_init((Class)NSMutableDictionary);
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      v17 = [(NSDictionary *)*p_propertiesToOverride allKeys];
      id v18 = [v17 countByEnumeratingWithState:&v55 objects:v60 count:16];
      if (!v18) {
        goto LABEL_24;
      }
      id v19 = v18;
      uint64_t v20 = *(void *)v56;
      while (1)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v56 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          v23 = [(id)qword_1001A1358 objectForKeyedSubscript:v22];

          if (v23)
          {
            buf[0] = 0;
            uint64_t v24 = [(NRLocalPropertyMonitor *)self _readProperty:v22 shouldUpdateCache:1 isUpdated:buf forceLog:1];
            v25 = v24;
            if (buf[0])
            {
              if (v24)
              {
                [v50 setObject:v24 forKeyedSubscript:v22];
              }
              else
              {
                v28 = +[NSNull null];
                [v50 setObject:v28 forKeyedSubscript:v22];
              }
            }
          }
          else
          {
            v26 = nr_daemon_log();
            BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

            if (!v27) {
              continue;
            }
            v25 = nr_daemon_log();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              id v62 = v22;
              _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Local overriding of unrecognized property %{public}@, ignoring", buf, 0xCu);
            }
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v55 objects:v60 count:16];
        if (!v19)
        {
LABEL_24:

          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          v29 = [(NSDictionary *)v49 allKeys];
          id v30 = [v29 countByEnumeratingWithState:&v51 objects:v59 count:16];
          if (v30)
          {
            id v31 = v30;
            uint64_t v32 = *(void *)v52;
            do
            {
              for (j = 0; j != v31; j = (char *)j + 1)
              {
                if (*(void *)v52 != v32) {
                  objc_enumerationMutation(v29);
                }
                v34 = *(void **)(*((void *)&v51 + 1) + 8 * (void)j);
                id v35 = [(id)qword_1001A1358 objectForKeyedSubscript:v34];

                if (v35)
                {
                  v36 = [(NSDictionary *)*p_propertiesToOverride objectForKeyedSubscript:v34];

                  if (!v36)
                  {
                    v37 = nr_daemon_log();
                    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);

                    if (v38)
                    {
                      v39 = nr_daemon_log();
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138543362;
                        id v62 = v34;
                        _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "No longer overriding local property %{public}@", buf, 0xCu);
                      }
                    }
                    buf[0] = 0;
                    uint64_t v40 = [(NRLocalPropertyMonitor *)self _readProperty:v34 shouldUpdateCache:1 isUpdated:buf forceLog:1];
                    v41 = (void *)v40;
                    if (buf[0])
                    {
                      if (v40)
                      {
                        [v50 setObject:v40 forKeyedSubscript:v34];
                      }
                      else
                      {
                        v42 = +[NSNull null];
                        [v50 setObject:v42 forKeyedSubscript:v34];
                      }
                    }
                  }
                }
              }
              id v31 = [v29 countByEnumeratingWithState:&v51 objects:v59 count:16];
            }
            while (v31);
          }

          v43 = v50;
          if ([v50 count]) {
            [(NRLocalPropertyMonitor *)self _notifyObserversPropertiesDidChange:v50 thisIsAllOfThem:0];
          }
          id v11 = v47;
          id v10 = v48;
          id v12 = v46;
          goto LABEL_45;
        }
      }
    }
    v44 = nr_daemon_log();
    BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);

    if (v45)
    {
      v43 = nr_daemon_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_1000FAA68((uint64_t)v16, v43);
      }
LABEL_45:
    }
  }
}

- (void)addPropertyObserver:(id)a3
{
}

- (void)removePropertyObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSPointerArray pointerArrayWithOptions:5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_observers;
  id v7 = [(NSPointerArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v14 + 1) + 8 * (void)v10);
        if (v11) {
          BOOL v12 = v11 == v4;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12) {
          [(NSPointerArray *)v5 addPointer:(void)v14];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSPointerArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  observers = self->_observers;
  self->_observers = v5;
}

- (void)registerForMDMNotifications
{
  if (!self->_mcConnection)
  {
    objc_super v3 = +[MCProfileConnection sharedConnection];
    mcConnection = self->_mcConnection;
    self->_mcConnection = v3;
  }
  uint64_t v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"handleMDMNotification:" name:MCProfileListChangedNotification object:self->_mcConnection];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"handleMDMNotification:" name:MCCloudConfigurationDidChangeNotification object:self->_mcConnection];

  id v7 = +[NSDistributedNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"handleMDMDistributedNotification" name:kMDMUprootedNotification object:0];
}

- (void)handleMDMNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = nr_daemon_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 name];
      *(_DWORD *)buf = 138412290;
      BOOL v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received %@ notification, which could mean MDM status changes, polling properties.", buf, 0xCu);
    }
  }
  uint64_t v9 = +[NRQueue registryDaemonQueue];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000A83C8;
  v10[3] = &unk_1001655F8;
  v10[4] = self;
  [v9 dispatchAsync:v10];
}

- (void)handleMDMDistributedNotification
{
  objc_super v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    uint64_t v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received kMDMUprootedNotification notification, which could mean MDM status changes, polling properties.", buf, 2u);
    }
  }
  BOOL v6 = +[NRQueue registryDaemonQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A84CC;
  v7[3] = &unk_1001655F8;
  void v7[4] = self;
  [v6 dispatchAsync:v7];
}

+ (void)initializeGetters
{
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = sub_1000A66BC;
  v72[4] = sub_1000A66CC;
  id v73 = 0;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x3032000000;
  v70[3] = sub_1000A66BC;
  v70[4] = sub_1000A66CC;
  id v71 = 0;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = sub_1000A66BC;
  v68[4] = sub_1000A66CC;
  id v69 = 0;
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = sub_1000A66BC;
  v66[4] = sub_1000A66CC;
  id v67 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = sub_1000A66BC;
  v64[4] = sub_1000A66CC;
  id v65 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = sub_1000A66BC;
  v62[4] = sub_1000A66CC;
  id v63 = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = sub_1000A66BC;
  v60[4] = sub_1000A66CC;
  id v61 = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = sub_1000A66BC;
  v58[4] = sub_1000A66CC;
  id v59 = 0;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = sub_1000A66BC;
  v56[4] = sub_1000A66CC;
  id v57 = 0;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = sub_1000A66BC;
  v54[4] = sub_1000A66CC;
  id v55 = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = sub_1000A66BC;
  v52[4] = sub_1000A66CC;
  id v53 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = sub_1000A66BC;
  v50[4] = sub_1000A66CC;
  id v51 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = sub_1000A66BC;
  v48[4] = sub_1000A66CC;
  id v49 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = sub_1000A66BC;
  v46[4] = sub_1000A66CC;
  id v47 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = sub_1000A66BC;
  v44[4] = sub_1000A66CC;
  id v45 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A9824;
  block[3] = &unk_100168960;
  block[4] = v72;
  void block[5] = v70;
  block[6] = v68;
  block[7] = v66;
  block[8] = v64;
  block[9] = v62;
  block[10] = v60;
  block[11] = v58;
  block[12] = v56;
  block[13] = v54;
  block[14] = v52;
  block[15] = v50;
  block[16] = v46;
  block[17] = v48;
  block[18] = v44;
  if (qword_1001A1360 != -1) {
    dispatch_once(&qword_1001A1360, block);
  }
  v74[0] = NRDevicePropertyBackgroundAtrialFibrillationVersion;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000A9C90;
  v42[3] = &unk_100168988;
  v42[4] = v72;
  v23 = objc_retainBlock(v42);
  v75[0] = v23;
  v74[1] = NRDevicePropertyBackgroundAtrialFibrillationUDI;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000A9CA0;
  v41[3] = &unk_100168988;
  v41[4] = v70;
  v22 = objc_retainBlock(v41);
  v75[1] = v22;
  v74[2] = NRDevicePropertyBackgroundAtrialFibrillationReleaseYear;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000A9CB0;
  v40[3] = &unk_100168988;
  v40[4] = v68;
  v21 = objc_retainBlock(v40);
  v75[2] = v21;
  v74[3] = NRDevicePropertyElectrocardiogramVersion;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000A9CC0;
  v39[3] = &unk_100168988;
  v39[4] = v66;
  uint64_t v20 = objc_retainBlock(v39);
  v75[3] = v20;
  v74[4] = NRDevicePropertyElectrocardiogramUDI;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000A9CD0;
  v38[3] = &unk_100168988;
  v38[4] = v64;
  id v19 = objc_retainBlock(v38);
  v75[4] = v19;
  v74[5] = NRDevicePropertyElectrocardiogramReleaseYear;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000A9CE0;
  v37[3] = &unk_100168988;
  v37[4] = v62;
  id v18 = objc_retainBlock(v37);
  v75[5] = v18;
  v74[6] = NRDevicePropertyElectrocardiogramV2AvailableRegions;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000A9CF0;
  v36[3] = &unk_100168988;
  v36[4] = v58;
  long long v17 = objc_retainBlock(v36);
  v75[6] = v17;
  v74[7] = NRDevicePropertyMenstrualCyclesAlgorithmsVersion;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1000A9D00;
  v35[3] = &unk_100168988;
  v35[4] = v56;
  long long v16 = objc_retainBlock(v35);
  v75[7] = v16;
  v74[8] = NRDevicePropertyCardioFitnessVersion;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000A9D10;
  v34[3] = &unk_100168988;
  v34[4] = v54;
  long long v15 = objc_retainBlock(v34);
  v75[8] = v15;
  v74[9] = NRDevicePropertyCardioFitnessAvailableRegions;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000A9D20;
  v33[3] = &unk_100168988;
  void v33[4] = v52;
  long long v14 = objc_retainBlock(v33);
  v75[9] = v14;
  v75[10] = &stru_1001689C8;
  v74[10] = NRDevicePropertyMedicationScheduleCompatibilityVersion;
  v74[11] = NRDevicePropertySleepCoachingVersion;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000A9D3C;
  v32[3] = &unk_100168988;
  v32[4] = v50;
  long long v13 = objc_retainBlock(v32);
  v75[11] = v13;
  v74[12] = NRDevicePropertySleepActionsVersion;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000A9D4C;
  v31[3] = &unk_100168988;
  v31[4] = v48;
  objc_super v3 = objc_retainBlock(v31);
  v75[12] = v3;
  v74[13] = NRDevicePropertySleepTrackingVersion;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000A9D5C;
  v30[3] = &unk_100168988;
  v30[4] = v46;
  BOOL v4 = objc_retainBlock(v30);
  v75[13] = v4;
  v74[14] = NRDevicePropertyOxygenSaturationRecordingVersion;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000A9D6C;
  v29[3] = &unk_100168988;
  void v29[4] = v44;
  uint64_t v5 = objc_retainBlock(v29);
  v75[14] = v5;
  v74[15] = NRDevicePropertyName;
  v74[16] = NRDevicePropertyBluetoothMACAddress;
  v75[15] = &stru_1001689E8;
  v75[16] = &stru_100168A08;
  v75[17] = &stru_100168A28;
  v74[17] = NRDevicePropertyWIFIMACAddress;
  v74[18] = NRDevicePropertyTotalStorage;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000A9DC4;
  v28[3] = &unk_100168A48;
  v28[4] = a1;
  BOOL v6 = objc_retainBlock(v28);
  v75[18] = v6;
  v74[19] = NRDevicePropertySerialNumber;
  v74[20] = NRDevicePropertyProductType;
  v75[19] = &stru_100168A68;
  v75[20] = &stru_100168A88;
  v74[21] = NRDevicePropertyHomeButtonType;
  v74[22] = NRDevicePropertyLocalizedModel;
  v75[21] = &stru_100168AA8;
  v75[22] = &stru_100168AC8;
  v74[23] = NRDevicePropertyRegionCode;
  v74[24] = NRDevicePropertyRegionInfo;
  v75[23] = &stru_100168AE8;
  v75[24] = &stru_100168B08;
  v74[25] = NRDevicePropertyModelNumber;
  v74[26] = NRDevicePropertyHWModelString;
  v75[25] = &stru_100168B28;
  v75[26] = &stru_100168B48;
  v74[27] = NRDevicePropertyUDID;
  v74[28] = NRDevicePropertyMainScreenWidth;
  v75[27] = &stru_100168B68;
  v75[28] = &stru_100168B88;
  v74[29] = NRDevicePropertyMainScreenHeight;
  v74[30] = NRDevicePropertyScreenSize;
  v75[29] = &stru_100168BA8;
  v75[30] = &stru_100168BC8;
  v74[31] = NRDevicePropertyClass;
  v74[32] = NRDevicePropertyScreenScale;
  v75[31] = &stru_100168BE8;
  v75[32] = &stru_100168C08;
  v74[33] = NRDevicePropertyBuildType;
  v74[34] = NRDevicePropertyEnclosureMaterial;
  v75[33] = &stru_100168C28;
  v75[34] = &stru_100168C48;
  v74[35] = _NRDevicePropertyAdvertisingIdentifierSeed;
  v74[36] = NRDevicePropertyPairedDeviceCount;
  v75[35] = &stru_100168C68;
  v75[36] = &stru_100168C88;
  v74[37] = NRDevicePropertyGreenTeaDevice;
  v74[38] = NRDevicePropertySigningFuse;
  v75[37] = &stru_100168CA8;
  v75[38] = &stru_100168CC8;
  v74[39] = _NRDevicePropertySupportedPairingStrategy;
  v74[40] = NRDevicePropertyDeviceNameString;
  v75[39] = &stru_100168CE8;
  v75[40] = &stru_100168D08;
  v74[41] = NRDevicePropertyCurrentUserLocale;
  v74[42] = NRDevicePropertyDeviceInDemoMode;
  v75[41] = &stru_100168D28;
  v75[42] = &stru_100168D48;
  v74[43] = NRDevicePropertyPreferredLanguages;
  v74[44] = NRDevicePropertyMarketingVersion;
  v75[43] = &stru_100168D68;
  v75[44] = &stru_100168D88;
  v74[45] = NRDevicePropertyIMEI;
  v74[46] = NRDevicePropertyMEID;
  v75[45] = &stru_100168DA8;
  v75[46] = &stru_100168DC8;
  v75[47] = &stru_100168DE8;
  v74[47] = NRDevicePropertyIMEI2;
  v74[48] = _NRDevicePropertyCapabilities;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000AA328;
  v27[3] = &unk_100168A48;
  v27[4] = a1;
  id v7 = objc_retainBlock(v27);
  v75[48] = v7;
  v74[49] = NRDevicePropertyIsInternalInstall;
  v74[50] = NRDevicePropertyRegulatoryModelNumber;
  v75[49] = &stru_100168E08;
  v75[50] = &stru_100168E28;
  v74[51] = NRDevicePropertyHasSEP;
  v74[52] = NRDevicePropertyHasSecureElement;
  v75[51] = &stru_100168E48;
  v75[52] = &stru_100168E68;
  v74[53] = NRDevicePropertyMarketingProductName;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000ADA2C;
  v26[3] = &unk_100168A48;
  v26[4] = a1;
  id v8 = objc_retainBlock(v26);
  v75[53] = v8;
  v74[54] = NRDevicePropertyCPUType;
  v74[55] = NRDevicePropertyCPUSubType;
  v75[54] = &stru_100168E88;
  v75[55] = &stru_100168EA8;
  v74[56] = NRDevicePropertyMainScreenClass;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000ADA64;
  v25[3] = &unk_100168A48;
  v25[4] = a1;
  uint64_t v9 = objc_retainBlock(v25);
  v75[56] = v9;
  v74[57] = NRDevicePropertyChipID;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000ADA74;
  v24[3] = &unk_100168A48;
  v24[4] = a1;
  id v10 = objc_retainBlock(v24);
  v75[57] = v10;
  v74[58] = NRDevicePropertyIsAltAccount;
  v74[59] = NRDevicePropertyMDMManagementState;
  v75[58] = &stru_100168EC8;
  v75[59] = &stru_100168EE8;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:60];
  BOOL v12 = (void *)qword_1001A1358;
  qword_1001A1358 = v11;

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);

  _Block_object_dispose(v52, 8);
  _Block_object_dispose(v54, 8);

  _Block_object_dispose(v56, 8);
  _Block_object_dispose(v58, 8);

  _Block_object_dispose(v60, 8);
  _Block_object_dispose(v62, 8);

  _Block_object_dispose(v64, 8);
  _Block_object_dispose(v66, 8);

  _Block_object_dispose(v68, 8);
  _Block_object_dispose(v70, 8);

  _Block_object_dispose(v72, 8);
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [(id)qword_1001A1358 objectForKey:v3];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    BOOL v6 = (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)_supportsR2
{
  CFNumberRef v2 = (const __CFNumber *)MGCopyAnswer();
  if (!v2) {
    return 0;
  }
  CFNumberRef v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  if (v4 == CFNumberGetTypeID())
  {
    int valuePtr = 0;
    if (CFNumberGetValue(v3, kCFNumberSInt32Type, &valuePtr)) {
      BOOL v5 = valuePtr == 8228;
    }
    else {
      BOOL v5 = 0;
    }
    BOOL v6 = v5;
  }
  else
  {
    BOOL v6 = 0;
  }
  CFRelease(v3);
  return v6;
}

- (void)pollProperties
{
  CFNumberRef v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    BOOL v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[NRLocalPropertyMonitor pollProperties]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: trace", (uint8_t *)&v6, 0xCu);
    }
  }
  [(NRLocalPropertyMonitor *)self _pollPropertiesAllOfThem:0 dontSendChanges:0];
}

- (void)_pollPropertiesAllOfThem:(BOOL)a3 dontSendChanges:(BOOL)a4
{
  BOOL v21 = a4;
  BOOL v4 = a3;
  int v6 = nr_daemon_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    id v8 = nr_daemon_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = @"NO";
      if (v4) {
        CFStringRef v10 = @"YES";
      }
      else {
        CFStringRef v10 = @"NO";
      }
      if (v21) {
        CFStringRef v9 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v29 = v10;
      __int16 v30 = 2112;
      CFStringRef v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_pollPropertiesAllOfThem: thisIsAllOfThem=%@ dontSendChanges=%@", buf, 0x16u);
    }
  }
  id v22 = objc_alloc_init((Class)NSMutableDictionary);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v11 = [(id)qword_1001A1358 allKeys];
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        buf[0] = 0;
        uint64_t v17 = [(NRLocalPropertyMonitor *)self _readProperty:v16 shouldUpdateCache:!v21 isUpdated:buf forceLog:v4];
        id v18 = (void *)v17;
        if (buf[0]) {
          BOOL v19 = 0;
        }
        else {
          BOOL v19 = !v4;
        }
        if (!v19)
        {
          if (v17)
          {
            [v22 setObject:v17 forKey:v16];
          }
          else
          {
            uint64_t v20 = +[NSNull null];
            [v22 setObject:v20 forKey:v16];
          }
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  if ([v22 count] && !v21) {
    [(NRLocalPropertyMonitor *)self _notifyObserversPropertiesDidChange:v22 thisIsAllOfThem:v4];
  }
}

- (void)_notifyObserversPropertiesDidChange:(id)a3 thisIsAllOfThem:(BOOL)a4
{
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v7 = self->_observers;
  id v8 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v11);
        if (v12)
        {
          id v13 = +[NRQueue registryDaemonQueue];
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_1000AE200;
          v14[3] = &unk_100165C98;
          v14[4] = v12;
          v14[5] = self;
          id v15 = v6;
          BOOL v16 = a4;
          [v13 dispatchAsync:v14];
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSPointerArray *)v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (id)_readProperty:(id)a3 shouldUpdateCache:(BOOL)a4 isUpdated:(BOOL *)a5 forceLog:(BOOL)a6
{
  BOOL v7 = a4;
  id v9 = a3;
  uint64_t v10 = [(NSMutableDictionary *)self->_propertyCache objectForKey:v9];
  uint64_t v11 = [(id)qword_1001A1358 objectForKey:v9];
  uint64_t v12 = v11;
  if (!v11)
  {
    id v36 = 0;
    goto LABEL_38;
  }
  uint64_t v42 = 0;
  v43 = (id *)&v42;
  uint64_t v44 = 0x3032000000;
  id v45 = sub_1000A66BC;
  id v46 = sub_1000A66CC;
  id v47 = 0;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000AE6B8;
  v38[3] = &unk_100166DA8;
  v41 = &v42;
  id v40 = v11;
  id v13 = v9;
  id v39 = v13;
  [(NRLocalPropertyMonitor *)self blockTimer:v38];
  double v15 = v14;
  if (self->_logAllPropertyReads)
  {
    BOOL v16 = nr_daemon_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      long long v18 = nr_daemon_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = v43[5];
        *(_DWORD *)buf = 138412802;
        id v49 = v13;
        __int16 v50 = 2112;
        double v51 = *(double *)&v19;
        __int16 v52 = 2048;
        double v53 = v15;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Property %@ reads as %@ and took %1.2f seconds to query", buf, 0x20u);
      }
    }
  }
  if (v15 > 0.1)
  {
    long long v20 = nr_daemon_log();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (v21)
    {
      id v22 = nr_daemon_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v49 = v13;
        __int16 v50 = 2048;
        double v51 = v15;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Property %{public}@ took %1.2f seconds to query! That seems like a long time.", buf, 0x16u);
      }
    }
  }
  if (_NRIsInternalInstall())
  {
    long long v23 = [(NSDictionary *)self->_propertiesToOverride objectForKeyedSubscript:v13];
    if (v23)
    {
      long long v24 = nr_daemon_log();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

      if (v25)
      {
        long long v26 = nr_daemon_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = v43[5];
          *(_DWORD *)buf = 138543874;
          id v49 = v13;
          __int16 v50 = 2112;
          double v51 = *(double *)&v27;
          __int16 v52 = 2114;
          double v53 = *(double *)&v23;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "NRLocalPropertyMonitor overrides the actual value of %{public}@ from %@ with %{public}@", buf, 0x20u);
        }
      }
      objc_storeStrong(v43 + 5, v23);
    }
  }
  v28 = +[NSNull null];
  if ([v10 isEqual:v28]) {
    CFStringRef v29 = 0;
  }
  else {
    CFStringRef v29 = v10;
  }
  id v30 = v29;

  if (v7)
  {
    propertyCache = self->_propertyCache;
    id v32 = v43[5];
    v33 = v32;
    if (!v32)
    {
      v33 = +[NSNull null];
    }
    [(NSMutableDictionary *)propertyCache setObject:v33 forKey:v13];
    if (!v32) {
  }
    }
  id v34 = v43[5];
  if (v34)
  {
    if (![v34 isEqual:v30])
    {
      if (!a5) {
        goto LABEL_37;
      }
      goto LABEL_36;
    }
    BOOL v35 = v43[5] == 0;
    if (!a5) {
      goto LABEL_37;
    }
LABEL_34:
    if (!v35 || !v30) {
      goto LABEL_37;
    }
LABEL_36:
    *a5 = 1;
    goto LABEL_37;
  }
  BOOL v35 = 1;
  if (a5) {
    goto LABEL_34;
  }
LABEL_37:
  id v36 = v43[5];

  _Block_object_dispose(&v42, 8);
  uint64_t v10 = v30;
LABEL_38:

  return v36;
}

- (double)blockTimer:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  [(NRLocalPropertyMonitor *)self abs_to_seconds:mach_absolute_time()];
  double v6 = v5;
  v4[2](v4);

  [(NRLocalPropertyMonitor *)self abs_to_seconds:mach_absolute_time()];
  return v7 - v6;
}

- (unint64_t)abs_to_nanos:(unint64_t)a3
{
  return dword_1001A1348 * a3 / *(unsigned int *)algn_1001A134C;
}

- (double)abs_to_seconds:(unint64_t)a3
{
  return (double)[(NRLocalPropertyMonitor *)self abs_to_nanos:a3] / 1000000000.0;
}

- (void)refreshPropertyCache
{
  CFNumberRef v3 = nr_daemon_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    double v5 = nr_daemon_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      double v7 = "-[NRLocalPropertyMonitor refreshPropertyCache]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: trace", (uint8_t *)&v6, 0xCu);
    }
  }
  [(NSMutableDictionary *)self->_propertyCache removeAllObjects];
  [(NRLocalPropertyMonitor *)self _pollPropertiesAllOfThem:1 dontSendChanges:0];
}

- (NSDictionary)properties
{
  [(NRLocalPropertyMonitor *)self _pollPropertiesAllOfThem:1 dontSendChanges:0];
  id v3 = [(NSMutableDictionary *)self->_propertyCache copy];

  return (NSDictionary *)v3;
}

- (void)setProperties:(id)a3
{
}

- (NSMutableDictionary)propertyCache
{
  return self->_propertyCache;
}

- (void)setPropertyCache:(id)a3
{
}

- (MGNotificationTokenStruct)MGToken
{
  return self->_MGToken;
}

- (void)setMGToken:(MGNotificationTokenStruct *)a3
{
  self->_MGToken = a3;
}

- (NSObject)localeToken
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localeToken);

  return WeakRetained;
}

- (void)setLocaleToken:(id)a3
{
}

- (NSObject)planToken
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_planToken);

  return WeakRetained;
}

- (void)setPlanToken:(id)a3
{
}

- (NSPointerArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (MCProfileConnection)mcConnection
{
  return self->_mcConnection;
}

- (void)setMcConnection:(id)a3
{
}

- (id)deviceCollectionObserver
{
  return self->_deviceCollectionObserver;
}

- (void)setDeviceCollectionObserver:(id)a3
{
}

- (BOOL)hasRegisteredForNotifications
{
  return self->_hasRegisteredForNotifications;
}

- (void)setHasRegisteredForNotifications:(BOOL)a3
{
  self->_hasRegisteredForNotifications = a3;
}

- (BOOL)logAllPropertyReads
{
  return self->_logAllPropertyReads;
}

- (void)setLogAllPropertyReads:(BOOL)a3
{
  self->_logAllPropertyReads = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceCollectionObserver, 0);
  objc_storeStrong((id *)&self->_mcConnection, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_planToken);
  objc_destroyWeak((id *)&self->_localeToken);
  objc_storeStrong((id *)&self->_propertyCache, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_propertiesToOverride, 0);

  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end