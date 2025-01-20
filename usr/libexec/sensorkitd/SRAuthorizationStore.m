@interface SRAuthorizationStore
+ (SRAuthorizationStore)allSensorsStore;
+ (id)sharedAuthorizationStoreForSensors:(id)a3;
+ (void)initialize;
- (BOOL)checkAccessForService:(id)a3 auditToken:(id *)a4;
- (BOOL)sensorHasReaderAuthorization:(id)a3;
- (BOOL)sensorHasReaderAuthorization:(id)a3 forBundleId:(id)a4;
- (BOOL)sensorKitActive;
- (BOOL)setAuthorizationForBundleId:(id)a3 service:(id)a4 value:(BOOL)a5;
- (BOOL)setAuthorizationForBundleId:(id)a3 service:(id)a4 value:(BOOL)a5 setOverride:(BOOL)a6;
- (NSDictionary)readerAuthorizationGroups;
- (NSDictionary)readerAuthorizationValues;
- (NSDictionary)readerLastModifiedAuthorizationTimes;
- (NSDictionary)writerAuthorizationGroups;
- (NSDictionary)writerAuthorizationValues;
- (OS_dispatch_queue)updateQueue;
- (SRAuthorizationStore)initWithSensors:(id)a3;
- (id)readerAuthorizationBundleIdValues;
- (void)addReaderAuthorizationDelegate:(id)a3;
- (void)addWriterAuthorizationDelegate:(id)a3;
- (void)dealloc;
- (void)listenForAuthorizationUpdates:(BOOL)a3;
- (void)removeReaderAuthorizationDelegate:(id)a3;
- (void)removeWriterAuthorizationDelegate:(id)a3;
- (void)resetAllAuthorizations;
- (void)resetAllAuthorizationsForBundleId:(id)a3;
- (void)resetAuthorizationForService:(id)a3 bundleId:(id)a4;
- (void)setReaderAuthorizationGroups:(id)a3;
- (void)setReaderAuthorizationValues:(id)a3;
- (void)setReaderLastModifiedAuthorizationTimes:(id)a3;
- (void)setSensorKitActive:(BOOL)a3;
- (void)setUpdateQueue:(id)a3;
- (void)setWriterAuthorizationGroups:(id)a3;
- (void)setWriterAuthorizationValues:(id)a3;
@end

@implementation SRAuthorizationStore

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    qword_10006EB10 = (uint64_t)os_log_create("com.apple.SensorKit", "AuthorizationStore");
  }
}

- (SRAuthorizationStore)initWithSensors:(id)a3
{
  v5 = objc_alloc_init(SRTCCStorePassThrough);
  if (self)
  {
    v32.receiver = self;
    v32.super_class = (Class)SRAuthorizationStore;
    v6 = [(SRAuthorizationStore *)&v32 init];
    if (v6)
    {
      v7 = v6;
      v6->_tccStore = (SRTCCStore *)v5;
      v7->_sensors = (NSSet *)a3;
      v8 = +[NSHashTable weakObjectsHashTable];
      objc_setProperty_nonatomic(v7, v9, v8, 16);
      v10 = +[NSHashTable weakObjectsHashTable];
      objc_setProperty_nonatomic(v7, v11, v10, 24);
      v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7->_updateQueue = (OS_dispatch_queue *)dispatch_queue_create("SRAuthorizationStore.updateQueue", v12);
      id v13 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSSet count](v7->_sensors, "count")];
      id v31 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSSet count](v7->_sensors, "count")];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v30 = v7;
      sensors = v7->_sensors;
      id v15 = [(NSSet *)sensors countByEnumeratingWithState:&v33 objects:block count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v34;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v34 != v17) {
              objc_enumerationMutation(sensors);
            }
            uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            id v22 = +[SRSensorDescription sensorDescriptionForSensor:v20];
            if (v22)
            {
              v23 = v22;
              id v24 = [v22 authorizationService];
              id v25 = [v13 objectForKeyedSubscript:v24];
              if (!v25)
              {
                id v26 = objc_alloc_init((Class)NSMutableSet);
                [v13 setObject:v26 forKeyedSubscript:v24];

                id v25 = [v13 objectForKeyedSubscript:v24];
              }
              [v25 addObject:[v23 name]];
              id v27 = [v23 writerAuthorizationService];
              if (v27) {
                [v31 setObject:objc_msgSend(v23, "name") forKeyedSubscript:v27];
              }
            }
            else
            {
              v19 = qword_10006EB10;
              if (os_log_type_enabled((os_log_t)qword_10006EB10, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v38 = v20;
                _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "No sensor description found for %{public}@", buf, 0xCu);
              }
            }
          }
          id v16 = [(NSSet *)sensors countByEnumeratingWithState:&v33 objects:block count:16];
        }
        while (v16);
      }
      self = v30;
      [(SRAuthorizationStore *)v30 setReaderAuthorizationGroups:v13];

      [(SRAuthorizationStore *)v30 setWriterAuthorizationGroups:v31];
      [(SRAuthorizationStore *)v30 listenForAuthorizationUpdates:1];
      v28 = [(SRAuthorizationStore *)v30 updateQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100017E58;
      block[3] = &unk_10005CEB8;
      block[4] = v30;
      dispatch_sync(v28, block);
    }
    else
    {
      self = 0;
    }
  }

  return self;
}

+ (id)sharedAuthorizationStoreForSensors:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001649C;
  block[3] = &unk_10005CEB8;
  block[4] = a3;
  if (qword_10006EB20 != -1) {
    dispatch_once(&qword_10006EB20, block);
  }
  return (id)qword_10006EB18;
}

+ (SRAuthorizationStore)allSensorsStore
{
  id v2 = objc_alloc_init((Class)NSMutableSet);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = (void *)sub_10001A21C();
  v5 = sub_10001A5B4(v4);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      SEL v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [v2 addObject:[(*(id *)(*((void *)&v12 + 1) + 8 * (void)v9)) name:v12]];
        SEL v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  v10 = [[SRAuthorizationStore alloc] initWithSensors:v2];

  return v10;
}

- (void)dealloc
{
  [(SRAuthorizationStore *)self setReaderAuthorizationValues:0];
  [(SRAuthorizationStore *)self setWriterAuthorizationValues:0];
  [(SRAuthorizationStore *)self setReaderLastModifiedAuthorizationTimes:0];
  [(SRAuthorizationStore *)self setUpdateQueue:0];
  objc_setProperty_nonatomic(self, v3, 0, 16);
  objc_setProperty_nonatomic(self, v4, 0, 24);
  [(SRAuthorizationStore *)self listenForAuthorizationUpdates:0];
  objc_setProperty_nonatomic(self, v5, 0, 32);
  [(SRAuthorizationStore *)self setReaderAuthorizationGroups:0];
  [(SRAuthorizationStore *)self setWriterAuthorizationGroups:0];
  v6.receiver = self;
  v6.super_class = (Class)SRAuthorizationStore;
  [(SRAuthorizationStore *)&v6 dealloc];
}

- (void)listenForAuthorizationUpdates:(BOOL)a3
{
  p_int notifyToken = &self->_notifyToken;
  int notifyToken = self->_notifyToken;
  id v7 = qword_10006EB10;
  BOOL v8 = os_log_type_enabled((os_log_t)qword_10006EB10, OS_LOG_TYPE_INFO);
  if (a3)
  {
    if (notifyToken)
    {
      if (!v8) {
        return;
      }
      LOWORD(buf[0]) = 0;
      SEL v9 = "Asked to listen for TCC updates but we're already listening";
LABEL_36:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)buf, 2u);
      return;
    }
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Registering for TCC updates", (uint8_t *)buf, 2u);
    }
    objc_initWeak(buf, self);
    v10 = [(SRAuthorizationStore *)self updateQueue];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100016B94;
    handler[3] = &unk_10005CEE0;
    objc_copyWeak(&v34, buf);
    uint32_t v11 = notify_register_dispatch("com.apple.tcc.access.changed", p_notifyToken, (dispatch_queue_t)v10, handler);
    if (v11)
    {
      long long v12 = qword_10006EB10;
      if (os_log_type_enabled((os_log_t)qword_10006EB10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)uint64_t v38 = 67240192;
        uint32_t v39 = v11;
        _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Failed to register for TCC notifications.  Got status %{public}d", v38, 8u);
      }
      [(SRAuthorizationStore *)self setReaderAuthorizationValues:+[NSDictionary dictionary]];
      [(SRAuthorizationStore *)self setReaderLastModifiedAuthorizationTimes:+[NSDictionary dictionary]];
      [(SRAuthorizationStore *)self setWriterAuthorizationValues:+[NSDictionary dictionary]];
      readerAuthorizationDelegates = self->_readerAuthorizationDelegates;
      objc_sync_enter(readerAuthorizationDelegates);
      id v14 = [(NSHashTable *)self->_readerAuthorizationDelegates copy];
      objc_sync_exit(readerAuthorizationDelegates);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v30;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v30 != v16) {
              objc_enumerationMutation(v14);
            }
            v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v18 authorizationStore:self didDetermineInitialAuthorizationValues:-[SRAuthorizationStore readerAuthorizationValues](self, "readerAuthorizationValues")];
            }
          }
          id v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v15);
      }

      writerAuthorizationDelegates = self->_writerAuthorizationDelegates;
      objc_sync_enter(writerAuthorizationDelegates);
      id v20 = [(NSHashTable *)self->_writerAuthorizationDelegates copy];
      objc_sync_exit(writerAuthorizationDelegates);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v21 = [v20 countByEnumeratingWithState:&v25 objects:v36 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v26;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v26 != v22) {
              objc_enumerationMutation(v20);
            }
            id v24 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
            if (objc_opt_respondsToSelector()) {
              [v24 authorizationStore:self didDetermineInitialAuthorizationValues:-[SRAuthorizationStore writerAuthorizationValues](self, "writerAuthorizationValues")];
            }
          }
          id v21 = [v20 countByEnumeratingWithState:&v25 objects:v36 count:16];
        }
        while (v21);
      }
    }
    objc_destroyWeak(&v34);
    objc_destroyWeak(buf);
  }
  else
  {
    if (!notifyToken)
    {
      if (!v8) {
        return;
      }
      LOWORD(buf[0]) = 0;
      SEL v9 = "Asked to stop listen for TCC updates but we are already not listening";
      goto LABEL_36;
    }
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Unregistering for TCC updates", (uint8_t *)buf, 2u);
      int notifyToken = *p_notifyToken;
    }
    notify_cancel(notifyToken);
    int *p_notifyToken = 0;
  }
}

- (void)addReaderAuthorizationDelegate:(id)a3
{
  if (self)
  {
    readerAuthorizationDelegates = self->_readerAuthorizationDelegates;
    objc_sync_enter(readerAuthorizationDelegates);
    objc_super v6 = self->_readerAuthorizationDelegates;
  }
  else
  {
    objc_sync_enter(0);
    readerAuthorizationDelegates = 0;
    objc_super v6 = 0;
  }
  [(NSHashTable *)v6 addObject:a3];
  if ([(SRAuthorizationStore *)self readerAuthorizationValues]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [a3 authorizationStore:self didDetermineInitialAuthorizationValues:-[SRAuthorizationStore readerAuthorizationValues](self, "readerAuthorizationValues")];
  }

  objc_sync_exit(readerAuthorizationDelegates);
}

- (void)removeReaderAuthorizationDelegate:(id)a3
{
  if (self)
  {
    readerAuthorizationDelegates = self->_readerAuthorizationDelegates;
    objc_sync_enter(readerAuthorizationDelegates);
    objc_super v6 = self->_readerAuthorizationDelegates;
  }
  else
  {
    objc_sync_enter(0);
    readerAuthorizationDelegates = 0;
    objc_super v6 = 0;
  }
  [(NSHashTable *)v6 removeObject:a3];

  objc_sync_exit(readerAuthorizationDelegates);
}

- (void)addWriterAuthorizationDelegate:(id)a3
{
  if (self)
  {
    writerAuthorizationDelegates = self->_writerAuthorizationDelegates;
    objc_sync_enter(writerAuthorizationDelegates);
    objc_super v6 = self->_writerAuthorizationDelegates;
  }
  else
  {
    objc_sync_enter(0);
    writerAuthorizationDelegates = 0;
    objc_super v6 = 0;
  }
  [(NSHashTable *)v6 addObject:a3];
  if ([(SRAuthorizationStore *)self writerAuthorizationValues]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [a3 authorizationStore:self didDetermineInitialAuthorizationValues:-[SRAuthorizationStore writerAuthorizationValues](self, "writerAuthorizationValues")];
  }

  objc_sync_exit(writerAuthorizationDelegates);
}

- (void)removeWriterAuthorizationDelegate:(id)a3
{
  if (self)
  {
    writerAuthorizationDelegates = self->_writerAuthorizationDelegates;
    objc_sync_enter(writerAuthorizationDelegates);
    objc_super v6 = self->_writerAuthorizationDelegates;
  }
  else
  {
    objc_sync_enter(0);
    writerAuthorizationDelegates = 0;
    objc_super v6 = 0;
  }
  [(NSHashTable *)v6 removeObject:a3];

  objc_sync_exit(writerAuthorizationDelegates);
}

- (BOOL)sensorHasReaderAuthorization:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(SRAuthorizationStore *)self readerAuthorizationBundleIdValues];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      SEL v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([(SRAuthorizationStore *)self sensorHasReaderAuthorization:a3 forBundleId:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9)])
        {
          LOBYTE(v6) = 1;
          return (char)v6;
        }
        SEL v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      id v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return (char)v6;
}

- (BOOL)sensorHasReaderAuthorization:(id)a3 forBundleId:(id)a4
{
  id v4 = [[-[NSDictionary objectForKeyedSubscript:](-[SRAuthorizationStore readerAuthorizationValues](self, "readerAuthorizationValues"), "objectForKeyedSubscript:", a4) objectForKeyedSubscript:a3];

  return [v4 BOOLValue];
}

- (void)resetAllAuthorizationsForBundleId:(id)a3
{
  id v3 = a3;
  id v4 = self;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [(NSDictionary *)[(SRAuthorizationStore *)self readerAuthorizationValues] objectForKeyedSubscript:a3];
  id v5 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v38;
    p_cache = SRSensorsCache.cache;
    p_cb = &OBJC_PROTOCOL___CBPeripheralDelegate.cb;
    uint64_t v27 = *(void *)v38;
    long long v28 = v4;
    do
    {
      v10 = 0;
      id v29 = v6;
      do
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v37 + 1) + 8 * (void)v10);
        id v12 = [[objc_msgSend(p_cache + 188, "sensorDescriptionForSensor:", v11) authorizationService];
        long long v13 = *((void *)p_cb + 354);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v52 = v3;
          __int16 v53 = 2112;
          id v54 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "reset reader authorization for bundle %@ service %@", buf, 0x16u);
        }
        [(SRTCCStore *)v4->_tccStore resetService:v12 forBundleId:v3];
        if (v4)
        {
          id v14 = v12;
          if (v12)
          {
            id v15 = [(SRAuthorizationStore *)v4 readerAuthorizationBundleIdValues];
            id v16 = [p_cache + 188 sensorDescriptionsForAuthorizationService:v14];
            long long v45 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v17 = [v15 countByEnumeratingWithState:&v45 objects:buf count:16];
            if (!v17) {
              goto LABEL_5;
            }
            id v31 = v14;
            long long v32 = v10;
            char v34 = 0;
            uint64_t v18 = *(void *)v46;
            id v19 = v17;
            uint64_t v35 = *(void *)v46;
            do
            {
              id v20 = 0;
              id v36 = v19;
              do
              {
                if (*(void *)v46 != v18) {
                  objc_enumerationMutation(v15);
                }
                id v21 = *(void **)(*((void *)&v45 + 1) + 8 * (void)v20);
                if (([v21 isEqualToString:v3] & 1) == 0)
                {
                  long long v43 = 0u;
                  long long v44 = 0u;
                  long long v41 = 0u;
                  long long v42 = 0u;
                  id v22 = [v16 countByEnumeratingWithState:&v41 objects:v50 count:16];
                  if (v22)
                  {
                    id v23 = v22;
                    id v24 = v3;
                    uint64_t v25 = *(void *)v42;
                    do
                    {
                      for (i = 0; i != v23; i = (char *)i + 1)
                      {
                        if (*(void *)v42 != v25) {
                          objc_enumerationMutation(v16);
                        }
                        if (objc_msgSend(objc_msgSend(objc_msgSend(v15, "objectForKeyedSubscript:", v21), "objectForKeyedSubscript:", objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * i), "name")), "BOOLValue"))
                        {
                          char v34 = 1;
                          goto LABEL_18;
                        }
                      }
                      id v23 = [v16 countByEnumeratingWithState:&v41 objects:v50 count:16];
                    }
                    while (v23);
LABEL_18:
                    id v3 = v24;
                    uint64_t v18 = v35;
                    id v19 = v36;
                  }
                }
                id v20 = (char *)v20 + 1;
              }
              while (v20 != v19);
              id v19 = [v15 countByEnumeratingWithState:&v45 objects:buf count:16];
            }
            while (v19);
            uint64_t v7 = v27;
            id v4 = v28;
            id v6 = v29;
            p_cache = (void **)(SRSensorsCache + 16);
            p_cb = (_DWORD *)(&OBJC_PROTOCOL___CBPeripheralDelegate + 64);
            id v14 = v31;
            v10 = v32;
            if ((v34 & 1) == 0) {
LABEL_5:
            }
              [(SRTCCStore *)v4->_tccStore setOverride:0 forService:v14];
          }
        }
        v10 = (char *)v10 + 1;
      }
      while (v10 != v6);
      id v6 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v6);
  }
}

- (void)resetAllAuthorizations
{
  id v3 = +[NSMutableSet set];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  id v16 = sub_100018F88;
  id v17 = &unk_10005CF08;
  id v18 = v3;
  sub_100018F88((uint64_t)v15, [(SRAuthorizationStore *)self readerAuthorizationBundleIdValues], (uint64_t)&stru_10005CF48);
  id v4 = [(SRAuthorizationStore *)self writerAuthorizationValues];
  v16((uint64_t)v15, v4, (uint64_t)&stru_10005CF68);
  id v5 = qword_10006EB10;
  if (os_log_type_enabled((os_log_t)qword_10006EB10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "reset authorization for services %@", buf, 0xCu);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        [(SRTCCStore *)self->_tccStore resetService:v10];
        [(SRTCCStore *)self->_tccStore setOverride:0 forService:v10];
      }
      id v7 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)resetAuthorizationForService:(id)a3 bundleId:(id)a4
{
  id v7 = qword_10006EB10;
  if (os_log_type_enabled((os_log_t)qword_10006EB10, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = a3;
    __int16 v10 = 2114;
    id v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reset authorization for service %@ and bundle id: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [(SRTCCStore *)self->_tccStore resetService:a3 forBundleId:a4];
  sub_100018798(self, (uint64_t)a3, 0, (uint64_t)a4);
}

- (BOOL)setAuthorizationForBundleId:(id)a3 service:(id)a4 value:(BOOL)a5
{
  return [(SRAuthorizationStore *)self setAuthorizationForBundleId:a3 service:a4 value:a5 setOverride:1];
}

- (BOOL)setAuthorizationForBundleId:(id)a3 service:(id)a4 value:(BOOL)a5 setOverride:(BOOL)a6
{
  BOOL v7 = a5;
  id v11 = [a3 length];
  if (v11)
  {
    id v11 = [a4 length];
    if (v11)
    {
      if ([a3 isEqualToString:@"com.apple.private.SensorKit._compositeBundle"])
      {
        long long v12 = qword_10006EB10;
        LODWORD(v11) = os_log_type_enabled((os_log_t)qword_10006EB10, OS_LOG_TYPE_FAULT);
        if (v11)
        {
          int v15 = 138543362;
          CFStringRef v16 = @"com.apple.private.SensorKit._compositeBundle";
          _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Setting authorization for %{public}@ is not allowed", (uint8_t *)&v15, 0xCu);
          LOBYTE(v11) = 0;
        }
      }
      else
      {
        unsigned int v13 = [(SRTCCStore *)self->_tccStore setValue:v7 forService:a4 bundleId:a3];
        LOBYTE(v11) = !a6 & v13;
        if (a6 && v13)
        {
          LOBYTE(v11) = sub_100018798(self, (uint64_t)a4, v7, (uint64_t)a3);
        }
      }
    }
  }
  return (char)v11;
}

- (id)readerAuthorizationBundleIdValues
{
  id v2 = [(SRAuthorizationStore *)self readerAuthorizationValues];
  id v3 = +[NSMutableDictionary dictionaryWithCapacity:[(NSDictionary *)v2 count]];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(NSDictionary *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 == v6)
        {
          int v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if ([v8 isEqualToString:@"com.apple.sensorkit.dummy-bundle-id"]) {
            continue;
          }
        }
        else
        {
          objc_enumerationMutation(v2);
          int v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if ([v8 isEqualToString:@"com.apple.sensorkit.dummy-bundle-id"]) {
            continue;
          }
        }
        [(NSMutableDictionary *)v3 setObject:[(NSDictionary *)v2 objectForKeyedSubscript:v8] forKeyedSubscript:v8];
      }
      id v5 = [(NSDictionary *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  return +[NSDictionary dictionaryWithDictionary:v3];
}

- (BOOL)checkAccessForService:(id)a3 auditToken:(id *)a4
{
  tccStore = self->_tccStore;
  long long v5 = *(_OWORD *)&a4->var0[4];
  v7[0] = *(_OWORD *)a4->var0;
  v7[1] = v5;
  return [(SRTCCStore *)tccStore checkAccessForService:a3 auditToken:v7];
}

- (NSDictionary)readerAuthorizationValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReaderAuthorizationValues:(id)a3
{
}

- (NSDictionary)readerLastModifiedAuthorizationTimes
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setReaderLastModifiedAuthorizationTimes:(id)a3
{
}

- (NSDictionary)writerAuthorizationValues
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setWriterAuthorizationValues:(id)a3
{
}

- (BOOL)sensorKitActive
{
  return self->_sensorKitActive;
}

- (void)setSensorKitActive:(BOOL)a3
{
  self->_sensorKitActive = a3;
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
}

- (NSDictionary)readerAuthorizationGroups
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setReaderAuthorizationGroups:(id)a3
{
}

- (NSDictionary)writerAuthorizationGroups
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setWriterAuthorizationGroups:(id)a3
{
}

@end