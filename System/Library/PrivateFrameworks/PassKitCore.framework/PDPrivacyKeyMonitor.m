@interface PDPrivacyKeyMonitor
- (BOOL)isMonitoring;
- (PDPrivacyKeyMonitor)init;
- (PDPrivacyKeyMonitor)initWithNotificationStreamManager:(id)a3;
- (id)_keysForEntry:(id)a3;
- (id)createCurrentNotificationRegistrationState;
- (void)_checkEntriesForNewKeys;
- (void)_entryDidTimeout:(id)a3;
- (void)_updateNotificationMonitoring;
- (void)_waitForKeyWithGroupIdentifier:(id)a3 keyIdentifier:(id)a4 timeout:(double)a5 newKey:(BOOL)a6 completion:(id)a7;
- (void)dealloc;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
- (void)waitForKeyWithGroupIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5;
- (void)waitForKeyWithKeyIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5;
- (void)waitForNewKeyWithGroupIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5;
- (void)waitForNewKeyWithKeyIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5;
@end

@implementation PDPrivacyKeyMonitor

- (PDPrivacyKeyMonitor)init
{
  return 0;
}

- (PDPrivacyKeyMonitor)initWithNotificationStreamManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDPrivacyKeyMonitor;
  v6 = [(PDPrivacyKeyMonitor *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_notificationStreamManager, a3);
    v8 = (PKDAManager *)objc_alloc_init((Class)PKDAManager);
    daManager = v7->_daManager;
    v7->_daManager = v8;

    v7->_lock._os_unfair_lock_opaque = 0;
    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    entries = v7->_entries;
    v7->_entries = v10;
  }
  return v7;
}

- (void)dealloc
{
  if (self->_isRegisteredForNotifications) {
    [(PDNotificationStreamManager *)self->_notificationStreamManager unregisterConsumer:self];
  }
  v3.receiver = self;
  v3.super_class = (Class)PDPrivacyKeyMonitor;
  [(PDPrivacyKeyMonitor *)&v3 dealloc];
}

- (BOOL)isMonitoring
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(NSMutableArray *)v2->_entries count] != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)waitForNewKeyWithGroupIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5
{
}

- (void)waitForNewKeyWithKeyIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5
{
}

- (void)waitForKeyWithGroupIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5
{
}

- (void)waitForKeyWithKeyIdentifier:(id)a3 timeout:(double)a4 completion:(id)a5
{
}

- (void)_waitForKeyWithGroupIdentifier:(id)a3 keyIdentifier:(id)a4 timeout:(double)a5 newKey:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  v14 = (void (**)(id, uint64_t))a7;
  v15 = objc_alloc_init(PDPrivacyKeyMonitorEntry);
  [(PDPrivacyKeyMonitorEntry *)v15 setGroupIdentifier:v12];
  [(PDPrivacyKeyMonitorEntry *)v15 setPublicKeyIdentifier:v13];
  [(PDPrivacyKeyMonitorEntry *)v15 setTimeout:a5];
  [(PDPrivacyKeyMonitorEntry *)v15 setCompletion:v14];
  v16 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PDPrivacyKeyMonitor: Begining monitoring for %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  v17 = [(PDPrivacyKeyMonitor *)self _keysForEntry:v15];
  v18 = v17;
  if (a6 || ![v17 count])
  {
    [(PDPrivacyKeyMonitorEntry *)v15 setExistingKeys:v18];
    [(NSMutableArray *)self->_entries addObject:v15];
    os_unfair_lock_unlock(&self->_lock);
    objc_initWeak((id *)buf, self);
    dispatch_time_t v19 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    v20 = PDDefaultQueue();
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_100423144;
    v24 = &unk_10072E288;
    objc_copyWeak(&v26, (id *)buf);
    v25 = v15;
    dispatch_after(v19, v20, &v21);

    [(PDPrivacyKeyMonitor *)self _updateNotificationMonitoring];
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v14[2](v14, 1);
  }
}

- (void)_updateNotificationMonitoring
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSMutableArray *)self->_entries count])
  {
    if (!self->_isRegisteredForNotifications)
    {
      self->_isRegisteredForNotifications = 1;
      os_unfair_lock_unlock(p_lock);
      notificationStreamManager = self->_notificationStreamManager;
      [(PDNotificationStreamManager *)notificationStreamManager registerConsumer:self];
      return;
    }
    goto LABEL_10;
  }
  if (!self->_isRegisteredForNotifications)
  {
LABEL_10:
    os_unfair_lock_unlock(p_lock);
    return;
  }
  self->_isRegisteredForNotifications = 0;
  os_unfair_lock_unlock(p_lock);
  id v5 = self->_notificationStreamManager;
  [(PDNotificationStreamManager *)v5 unregisterConsumer:self];
}

- (id)_keysForEntry:(id)a3
{
  daManager = self->_daManager;
  id v4 = a3;
  id v5 = [v4 groupIdentifier];
  v6 = [v4 publicKeyIdentifier];

  v7 = [(PKDAManager *)daManager privacyKeysForGroupIdentifier:v5 privacyKeyIdentifier:v6 outError:0];

  return v7;
}

- (void)_checkEntriesForNewKeys
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableArray *)self->_entries copy];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v10 = -[PDPrivacyKeyMonitor _keysForEntry:](self, "_keysForEntry:", v9, lock);
        id v11 = [v10 count];
        id v12 = [v9 existingKeys];
        id v13 = [v12 count];

        if (v11 > v13)
        {
          [(NSMutableArray *)self->_entries removeObjectIdenticalTo:v9];
          [v3 addObject:v9];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v3;
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        dispatch_time_t v19 = *(void **)(*((void *)&v24 + 1) + 8 * (void)j);
        v20 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v19;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "PDPrivacyKeyMonitor: Receive new key for %@", buf, 0xCu);
        }

        v21 = [v19 completion];
        v21[2](v21, 1);
      }
      id v16 = [v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v16);
  }

  [(PDPrivacyKeyMonitor *)self _updateNotificationMonitoring];
}

- (void)_entryDidTimeout:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDPrivacyKeyMonitor: did timeout for %@", (uint8_t *)&v8, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSMutableArray *)self->_entries indexOfObjectIdenticalTo:v4];
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    [(NSMutableArray *)self->_entries removeObjectAtIndex:v6];
    os_unfair_lock_unlock(&self->_lock);
    uint64_t v7 = [v4 completion];
    v7[2](v7, 0);
  }
  [(PDPrivacyKeyMonitor *)self _updateNotificationMonitoring];
}

- (id)createCurrentNotificationRegistrationState
{
  v2 = objc_alloc_init(PDNotificationStreamRegistrationState);
  id v3 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"com.apple.private.seserviced.sesprivacykey", 0);
  [(PDNotificationStreamRegistrationState *)v2 setNotificationNames:v3 forStream:0];

  return v2;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
  if (PKEqualObjects())
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PDPrivacyKeyMonitor: did receiver key update notification", v7, 2u);
    }

    [(PDPrivacyKeyMonitor *)self _checkEntriesForNewKeys];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_daManager, 0);
  objc_storeStrong((id *)&self->_notificationStreamManager, 0);
}

@end