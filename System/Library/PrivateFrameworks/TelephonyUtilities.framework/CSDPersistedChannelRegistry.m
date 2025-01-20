@interface CSDPersistedChannelRegistry
+ (id)sharedInstance;
- (BOOL)_queue_tearDownPersistedChannelForApplicationIdentifier:(id)a3 teardownType:(int)a4;
- (BOOL)_queue_tearDownPersistedChannelForBundleIdentifier:(id)a3 teardownType:(int)a4;
- (BOOL)tearDownPersistedChannelForBundleIdentifier:(id)a3 teardownType:(int)a4;
- (BOOL)tearDownPersistedChannelForCall:(id)a3 teardownType:(int)a4;
- (CSDPersistedChannelRegistry)initWithUserDefaults:(id)a3;
- (CSDPersistedChannelRegistry)initWithUserDefaults:(id)a3 observerQueue:(id)a4;
- (NSHashTable)observers;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)ivarQueue;
- (OS_dispatch_queue)observerQueue;
- (id)_queue_activePersistedChannelIdentity;
- (id)activePersistedChannelIdentity;
- (id)persistedTornDownChannelUUIDForBundleIdentifier:(id)a3;
- (void)_queue_addPendingTeardownAcknowledgement:(id)a3;
- (void)_queue_clearPendingChannelTeardownAcknowledgementsForBundleIdentfier:(id)a3;
- (void)_queue_notePushToTalkChannelConnectedForCall:(id)a3;
- (void)addObserver:(id)a3;
- (void)clearPendingChannelTeardownAcknowledgementsForBundleIdentfier:(id)a3;
- (void)handleAppUninstall:(id)a3;
- (void)notePushToTalkChannelConnectedForCall:(id)a3;
- (void)removeObserver:(id)a3;
@end

@implementation CSDPersistedChannelRegistry

+ (id)sharedInstance
{
  if (qword_10058C288 != -1) {
    dispatch_once(&qword_10058C288, &stru_100505D70);
  }
  v2 = (void *)qword_10058C280;

  return v2;
}

- (CSDPersistedChannelRegistry)initWithUserDefaults:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.csd.persistedChannelRegistryObserver", 0);
  v6 = [(CSDPersistedChannelRegistry *)self initWithUserDefaults:v4 observerQueue:v5];

  return v6;
}

- (CSDPersistedChannelRegistry)initWithUserDefaults:(id)a3 observerQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CSDPersistedChannelRegistry;
  v9 = [(CSDPersistedChannelRegistry *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_defaults, a3);
    uint64_t v11 = +[NSHashTable weakObjectsHashTable];
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    objc_storeStrong((id *)&v10->_observerQueue, a4);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.csd.persistedChannelRegistryIvars", 0);
    ivarQueue = v10->_ivarQueue;
    v10->_ivarQueue = (OS_dispatch_queue *)v13;

    [(NSUserDefaults *)v10->_defaults setObject:0 forKey:@"CSDPersistedChannelUUIDString"];
    [(NSUserDefaults *)v10->_defaults setObject:0 forKey:@"CSDPersistedChannelBundleIdentifier"];
  }

  return v10;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000729E0;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)ivarQueue, v7);
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100072ACC;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)ivarQueue, v7);
}

- (void)notePushToTalkChannelConnectedForCall:(id)a3
{
  id v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100072BB8;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)ivarQueue, v7);
}

- (void)_queue_notePushToTalkChannelConnectedForCall:(id)a3
{
  ivarQueue = self->_ivarQueue;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)ivarQueue);
  id v7 = [(CSDPersistedChannelRegistry *)self _queue_activePersistedChannelIdentity];
  id v8 = [CSDPersistedChannelIdentity alloc];
  v9 = [v6 providerIdentifier];
  v10 = [v6 provider];
  uint64_t v11 = [v10 bundleIdentifier];
  v12 = [v6 uniqueProxyIdentifierUUID];

  dispatch_queue_t v13 = [(CSDPersistedChannelIdentity *)v8 initWithApplicationIdentifier:v9 bundleIdentifier:v11 channelUUID:v12];
  if (v7)
  {
    if ([(CSDPersistedChannelIdentity *)v7 isEqualToPersistedChannelIdentity:v13])
    {
      v14 = sub_100008DCC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v7;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CXPersistedChannelRegistry newly connected channel matches persisted channel %@", buf, 0xCu);
      }
      goto LABEL_17;
    }
    v15 = [(CSDPersistedChannelIdentity *)v7 bundleIdentifier];
    objc_super v16 = [(CSDPersistedChannelIdentity *)v13 bundleIdentifier];
    unsigned int v17 = [v15 isEqualToString:v16];

    if (v17)
    {
      v18 = sub_100008DCC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v13;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "CXPersistedChannelRegistry has updated channel %@", buf, 0xCu);
      }
    }
    else
    {
      v19 = +[NSAssertionHandler currentHandler];
      v20 = [(CSDPersistedChannelIdentity *)v7 bundleIdentifier];
      v21 = [(CSDPersistedChannelIdentity *)v13 bundleIdentifier];
      [v19 handleFailureInMethod:a2, self, @"CSDPersistedChannelRegistry.m", 101, @"only one active channel application allowed at a time. persisted:%@ active:%@", v20, v21 object file lineNumber description];
    }
  }
  id v28 = 0;
  v22 = [(CSDPersistedChannelIdentity *)v13 archivedDataWithError:&v28];
  v23 = v28;
  v14 = v23;
  if (v22)
  {
    [(NSUserDefaults *)self->_defaults setObject:v22 forKey:@"CSDPersistedChannel"];
    observerQueue = self->_observerQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100072F1C;
    block[3] = &unk_100504F10;
    block[4] = self;
    v27 = v13;
    dispatch_async((dispatch_queue_t)observerQueue, block);
  }
  else if (v23)
  {
    v25 = sub_100008DCC();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1003A8A70();
    }
  }
LABEL_17:
}

- (BOOL)tearDownPersistedChannelForCall:(id)a3 teardownType:(int)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  ivarQueue = self->_ivarQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000730F0;
  v10[3] = &unk_100505D98;
  id v11 = v6;
  v12 = &v14;
  v10[4] = self;
  int v13 = a4;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)ivarQueue, v10);
  LOBYTE(self) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (BOOL)tearDownPersistedChannelForBundleIdentifier:(id)a3 teardownType:(int)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  if ([v6 length])
  {
    ivarQueue = self->_ivarQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10007325C;
    v10[3] = &unk_100505D98;
    v12 = &v14;
    v10[4] = self;
    id v11 = v6;
    int v13 = a4;
    dispatch_sync((dispatch_queue_t)ivarQueue, v10);
  }
  char v8 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (BOOL)_queue_tearDownPersistedChannelForApplicationIdentifier:(id)a3 teardownType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  ivarQueue = self->_ivarQueue;
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)ivarQueue);
  char v8 = [(CSDPersistedChannelRegistry *)self _queue_activePersistedChannelIdentity];
  v9 = [v8 applicationIdentifier];
  unsigned int v10 = [v9 isEqualToString:v7];

  if (v10)
  {
    id v11 = [v8 bundleIdentifier];
    BOOL v12 = [(CSDPersistedChannelRegistry *)self _queue_tearDownPersistedChannelForBundleIdentifier:v11 teardownType:v4];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_queue_tearDownPersistedChannelForBundleIdentifier:(id)a3 teardownType:(int)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
  id v7 = [(CSDPersistedChannelRegistry *)self _queue_activePersistedChannelIdentity];
  char v8 = [v7 bundleIdentifier];
  unsigned int v9 = [v8 isEqualToString:v6];

  if (v9)
  {
    [(NSUserDefaults *)self->_defaults setObject:0 forKey:@"CSDPersistedChannel"];
    char v18 = v9;
    if (a4 == 3) {
      [(CSDPersistedChannelRegistry *)self _queue_addPendingTeardownAcknowledgement:v7];
    }
    else {
      [(CSDPersistedChannelRegistry *)self _queue_clearPendingChannelTeardownAcknowledgementsForBundleIdentfier:v6];
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    unsigned int v10 = [(CSDPersistedChannelRegistry *)self observers];
    id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          observerQueue = self->_observerQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100073534;
          block[3] = &unk_100504EC0;
          block[4] = v15;
          dispatch_async((dispatch_queue_t)observerQueue, block);
        }
        id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    LOBYTE(v9) = v18;
  }

  return v9;
}

- (void)handleAppUninstall:(id)a3
{
  id v4 = a3;
  ivarQueue = self->_ivarQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000735D8;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)ivarQueue, v7);
}

- (id)_queue_activePersistedChannelIdentity
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
  v3 = [(NSUserDefaults *)self->_defaults objectForKey:@"CSDPersistedChannel"];
  if ([v3 length])
  {
    id v10 = 0;
    id v4 = +[CSDPersistedChannelIdentity unarchivedObjectFromData:v3 error:&v10];
    id v5 = v10;
    id v6 = v5;
    if (v4) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v5 == 0;
    }
    if (!v7)
    {
      id v8 = sub_100008DCC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1003A8AD8();
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)activePersistedChannelIdentity
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ivarQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000737F4;
  id v11 = sub_100073804;
  id v12 = 0;
  ivarQueue = self->_ivarQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007380C;
  v6[3] = &unk_100505008;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)ivarQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)_queue_addPendingTeardownAcknowledgement:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"CSDPersistedChannelRegistry.m" lineNumber:230 description:@"identity is nil"];
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
  id v6 = [(NSUserDefaults *)self->_defaults dictionaryForKey:@"CSDPersistedTornDownChannelIdentities"];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 mutableCopy];
  }
  else
  {
    id v8 = +[NSMutableDictionary dictionary];
  }
  uint64_t v9 = v8;
  id v15 = 0;
  id v10 = [v5 archivedDataWithError:&v15];
  id v11 = v15;
  id v12 = v11;
  if (v10)
  {
    uint64_t v13 = [v5 bundleIdentifier];
    [v9 setObject:v10 forKey:v13];
LABEL_11:

    goto LABEL_12;
  }
  if (v11)
  {
    uint64_t v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1003A8B40();
    }
    goto LABEL_11;
  }
LABEL_12:
  [(NSUserDefaults *)self->_defaults setObject:v9 forKey:@"CSDPersistedTornDownChannelIdentities"];
}

- (id)persistedTornDownChannelUUIDForBundleIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"CSDPersistedChannelRegistry.m" lineNumber:251 description:@"bundleIdentifier is nil"];
  }
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = sub_1000737F4;
  char v18 = sub_100073804;
  id v19 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ivarQueue);
  ivarQueue = self->_ivarQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100073B4C;
  block[3] = &unk_100505DC0;
  block[4] = self;
  id v12 = v5;
  uint64_t v13 = &v14;
  id v7 = v5;
  dispatch_sync((dispatch_queue_t)ivarQueue, block);
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

- (void)_queue_clearPendingChannelTeardownAcknowledgementsForBundleIdentfier:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_ivarQueue);
  if (!v9)
  {
    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"CSDPersistedChannelRegistry.m" lineNumber:280 description:@"bundleIdentifier is nil"];
  }
  id v5 = [(NSUserDefaults *)self->_defaults dictionaryForKey:@"CSDPersistedTornDownChannelIdentities"];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 mutableCopy];
    [v7 removeObjectForKey:v9];
    [(NSUserDefaults *)self->_defaults setObject:v7 forKey:@"CSDPersistedTornDownChannelIdentities"];
  }
}

- (void)clearPendingChannelTeardownAcknowledgementsForBundleIdentfier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_ivarQueue);
  ivarQueue = self->_ivarQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100073E1C;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)ivarQueue, v7);
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (OS_dispatch_queue)ivarQueue
{
  return self->_ivarQueue;
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);

  objc_storeStrong((id *)&self->_defaults, 0);
}

@end