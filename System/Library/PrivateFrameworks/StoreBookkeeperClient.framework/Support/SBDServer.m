@interface SBDServer
+ (id)allSyncingDomains;
+ (id)server;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSArray)serviceConnections;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)queue;
- (SBDPushNotificationController)pushNotificationController;
- (SBDServer)init;
- (id)_init;
- (id)_pushNotificationController;
- (void)_accountsDidChangeNotification:(id)a3;
- (void)_performOnDomainSyncServiceHandlerWithBookkeeperDomain:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)_updateForAccountChangeAfterReloadingAccounts:(BOOL)a3;
- (void)_updateForSharedLibraryImportFinished;
- (void)_updatePushNotificationRegistrations;
- (void)dealloc;
- (void)pushNotificationController:(id)a3 didReceiveUpdateRequestForAccount:(id)a4 withBookkeeperDomain:(id)a5 toDomainRevision:(id)a6;
- (void)start;
- (void)synchronizeForUpdateJobForAccount:(id)a3 withDomain:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation SBDServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnections, 0);
  objc_storeStrong((id *)&self->_pushNotificationController, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_systemSyncHandlers, 0);
  objc_storeStrong(&self->_SBKSBKSharedMusicLibraryImportFinishedObserver, 0);
  objc_storeStrong(&self->_SBKStoreAccountChangedNotificationObserver, 0);
}

- (NSArray)serviceConnections
{
  return self->_serviceConnections;
}

- (SBDPushNotificationController)pushNotificationController
{
  return self->_pushNotificationController;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_updatePushNotificationRegistrations
{
  v3 = +[NSMutableSet set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = self->_systemSyncHandlers;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v8), "domain", (void)v13);
        v10 = [v9 domainIdentifier];

        [v3 addObject:v10];
        v11 = [(SBDServer *)self _pushNotificationController];
        [v11 setDelegate:self forBookkeeperDomain:v10];

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  v12 = [(SBDServer *)self _pushNotificationController];
  [v12 setEnabledDomains:v3];
}

- (void)_performOnDomainSyncServiceHandlerWithBookkeeperDomain:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v37 = (void (**)(id, void *))a5;
  v9 = +[ICUserIdentityStore defaultIdentityStore];
  v10 = [v9 userIdentitiesForManageableAccountsWithError:0];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v10;
  id v11 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v45;
    uint64_t v31 = *(void *)v45;
    id v32 = v8;
    do
    {
      long long v14 = 0;
      id v34 = v12;
      do
      {
        if (*(void *)v45 != v13) {
          objc_enumerationMutation(obj);
        }
        long long v15 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v14);
        long long v16 = objc_msgSend(v15, "accountDSID", v31, v32);
        id v17 = [v16 integerValue];
        id v18 = [v8 integerValue];

        if (v17 == v18)
        {
          v36 = v14;
          v19 = +[ML3MusicLibrary musicLibraryForUserAccount:v15];
          v38 = [v19 databasePath];

          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          v39 = self->_systemSyncHandlers;
          id v20 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v41;
            do
            {
              for (i = 0; i != v21; i = (char *)i + 1)
              {
                if (*(void *)v41 != v22) {
                  objc_enumerationMutation(v39);
                }
                v24 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                v25 = [v24 domain];
                v26 = [v25 domainIdentifier];
                if ([v26 isEqualToString:v7])
                {
                  v27 = [v24 domain];
                  [v27 foreignDatabasePath];
                  v29 = id v28 = v7;
                  unsigned int v30 = [v29 isEqualToString:v38];

                  id v7 = v28;
                  if (v30) {
                    v37[2](v37, v24);
                  }
                }
                else
                {
                }
              }
              id v21 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v40 objects:v48 count:16];
            }
            while (v21);
          }

          uint64_t v13 = v31;
          id v8 = v32;
          id v12 = v34;
          long long v14 = v36;
        }
        long long v14 = (char *)v14 + 1;
      }
      while (v14 != v12);
      id v12 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v12);
  }
}

- (void)synchronizeForUpdateJobForAccount:(id)a3 withDomain:(id)a4 withCompletionHandler:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100005878;
  v9[3] = &unk_1000208D8;
  id v10 = a5;
  id v8 = v10;
  [(SBDServer *)self _performOnDomainSyncServiceHandlerWithBookkeeperDomain:a4 forAccountWithIdentifier:a3 completion:v9];
}

- (void)pushNotificationController:(id)a3 didReceiveUpdateRequestForAccount:(id)a4 withBookkeeperDomain:(id)a5 toDomainRevision:(id)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000059BC;
  v10[3] = &unk_1000208B0;
  id v11 = a6;
  id v9 = v11;
  [(SBDServer *)self _performOnDomainSyncServiceHandlerWithBookkeeperDomain:a5 forAccountWithIdentifier:a4 completion:v10];
}

- (void)_accountsDidChangeNotification:(id)a3
{
}

- (void)_updateForAccountChangeAfterReloadingAccounts:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005AD4;
  v3[3] = &unk_100020888;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)_updateForSharedLibraryImportFinished
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000061C8;
  block[3] = &unk_1000212C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_pushNotificationController
{
  pushNotificationController = self->_pushNotificationController;
  if (!pushNotificationController)
  {
    BOOL v4 = objc_alloc_init(SBDPushNotificationController);
    id v5 = self->_pushNotificationController;
    self->_pushNotificationController = v4;

    pushNotificationController = self->_pushNotificationController;
  }
  return pushNotificationController;
}

- (void)start
{
  if (!self->_xpcListener)
  {
    v3 = (NSXPCListener *)+[SBCPlaybackPositionService newListener];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v3;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    id v5 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting service 'SBCPlaybackPositionService'", v6, 2u);
    }

    [(NSXPCListener *)self->_xpcListener resume];
    notify_post("com.apple.storebookkeeperd.launched");
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = +[SBDPlaybackPositionService serviceForXPCConnection:a4];
  if (v5)
  {
    id v6 = [(NSArray *)self->_serviceConnections arrayByAddingObject:v5];
    serviceConnections = self->_serviceConnections;
    self->_serviceConnections = v6;

    id v8 = [v5 XPCConnection];
    [v8 resume];
  }
  return v5 != 0;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:ACDAccountStoreDidChangeNotification object:0];

  BOOL v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self->_SBKStoreAccountChangedNotificationObserver];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self->_SBKSBKSharedMusicLibraryImportFinishedObserver];

  id v6 = [(NSArray *)self->_serviceConnections valueForKey:@"XPCConnection"];
  [v6 makeObjectsPerformSelector:"invalidate"];

  [(NSXPCListener *)self->_xpcListener invalidate];
  [(NSXPCListener *)self->_xpcListener suspend];
  [(NSXPCListener *)self->_xpcListener setDelegate:0];
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  v8.receiver = self;
  v8.super_class = (Class)SBDServer;
  [(SBDServer *)&v8 dealloc];
}

- (id)_init
{
  v31.receiver = self;
  v31.super_class = (Class)SBDServer;
  v2 = [(SBDServer *)&v31 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.storebookkeeperd.SBDServer", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    serviceConnections = v2->_serviceConnections;
    v2->_serviceConnections = (NSArray *)&__NSArray0__struct;

    uint64_t v6 = +[NSMutableArray array];
    systemSyncHandlers = v2->_systemSyncHandlers;
    v2->_systemSyncHandlers = (NSMutableArray *)v6;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    objc_super v8 = [(id)objc_opt_class() allSyncingDomains];
    id v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v28;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = [[SBDDomainSyncServiceHandler alloc] initWithDomain:*(void *)(*((void *)&v27 + 1) + 8 * (void)v11)];
          [(NSMutableArray *)v2->_systemSyncHandlers addObject:v12];

          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }

    uint64_t v13 = +[SSURLSessionManager sharedManager];
    [v13 setHttpArchiveBufferSize:0];

    [(SBDServer *)v2 _updatePushNotificationRegistrations];
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = sub_1000068DC;
    v25[4] = sub_1000068EC;
    long long v14 = v2;
    v26 = v14;
    long long v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v14 selector:"_accountsDidChangeNotification:" name:ACDAccountStoreDidChangeNotification object:0];

    long long v16 = +[NSNotificationCenter defaultCenter];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000068F4;
    v24[3] = &unk_1000207B8;
    v24[4] = v25;
    uint64_t v17 = [v16 addObserverForName:ICActiveUserIdentityDidChangeNotification object:0 queue:0 usingBlock:v24];
    id SBKStoreAccountChangedNotificationObserver = v14->_SBKStoreAccountChangedNotificationObserver;
    v14->_id SBKStoreAccountChangedNotificationObserver = (id)v17;

    v19 = +[NSNotificationCenter defaultCenter];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100006908;
    v23[3] = &unk_1000207B8;
    v23[4] = v25;
    uint64_t v20 = [v19 addObserverForName:ML3MusicLibraryImportDidFinishNotification object:0 queue:0 usingBlock:v23];
    id SBKSBKSharedMusicLibraryImportFinishedObserver = v14->_SBKSBKSharedMusicLibraryImportFinishedObserver;
    v14->_id SBKSBKSharedMusicLibraryImportFinishedObserver = (id)v20;

    +[SBDJobScheduler initializeBackgroundTaskAgentWithJobRunner:&stru_1000207F8];
    _Block_object_dispose(v25, 8);
  }
  return v2;
}

- (SBDServer)init
{
  BOOL v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDServer.m" lineNumber:53 description:@"Use +sharedInstance instead"];

  return 0;
}

+ (id)allSyncingDomains
{
  v2 = +[ICUserIdentityStore defaultIdentityStore];
  id v20 = 0;
  dispatch_queue_t v3 = [v2 userIdentitiesForManageableAccountsWithError:&v20];
  id v4 = v20;

  if (v4)
  {
    id v5 = os_log_create("com.apple.amp.storebookkeeperd", "Server");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "SBCPlaybackPositionDomain: Error fetching user identities. err=%@", buf, 0xCu);
    }
    id v6 = &__NSArray0__struct;
  }
  else
  {
    id v5 = +[NSMutableArray array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = +[ML3MusicLibrary musicLibraryForUserAccount:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          uint64_t v13 = [v12 databasePath];
          long long v14 = +[SBCPlaybackPositionDomain domainForSyncingMusicLibraryWithLibraryPath:v13];
          [v5 addObject:v14];
        }
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v9);
    }

    id v6 = [v5 copy];
    id v4 = 0;
  }

  return v6;
}

+ (id)server
{
  if (qword_100027860 != -1) {
    dispatch_once(&qword_100027860, &stru_100020790);
  }
  v2 = (void *)qword_100027858;
  return v2;
}

@end