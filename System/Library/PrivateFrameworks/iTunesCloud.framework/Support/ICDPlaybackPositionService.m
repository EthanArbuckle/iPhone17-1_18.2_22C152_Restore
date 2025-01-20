@interface ICDPlaybackPositionService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ICDPlaybackPositionService)init;
- (id)_connectionClientIdentity;
- (void)_handleImportNotification:(id)a3;
- (void)_handleUserIdentityStoreDidChangeNotification;
- (void)_performNotificationSyncForLibraryWithUID:(id)a3;
- (void)_setupNotificationHandlers;
- (void)dealloc;
- (void)deletePlaybackPositionEntitiesFromLibraryWithIdentifier:(id)a3;
- (void)deletePlaybackPositionEntity:(id)a3;
- (void)getLocalPlaybackPositionForEntityIdentifiers:(id)a3 forDomain:(id)a4 fromLibraryWithIdentifier:(id)a5 completionBlock:(id)a6;
- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 completionBlock:(id)a5;
- (void)pullPlaybackPositionEntity:(id)a3 completionBlock:(id)a4;
- (void)pushPlaybackPositionEntity:(id)a3 completionBlock:(id)a4;
- (void)start;
- (void)synchronizePlaybackPositionsForLibraryWithIdentifier:(id)a3 forDomain:(id)a4 isCheckpoint:(BOOL)a5;
- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3;
@end

@implementation ICDPlaybackPositionService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestController, 0);

  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)_performNotificationSyncForLibraryWithUID:(id)a3
{
  id v4 = a3;
  v5 = [ICDPlaybackPositionRequestContext alloc];
  uint64_t v6 = ICPlaybackPositionServiceDomainDefault;
  v7 = MSVTCCIdentityForCurrentProcess();
  v8 = [(ICDPlaybackPositionRequestContext *)v5 initWithLibraryIdentifier:v4 domain:v6 clientIdentity:v7];

  [(ICDPlaybackPositionRequestController *)self->_requestController scheduleSyncWithContext:v8 isCheckpoint:0];
}

- (void)_handleUserIdentityStoreDidChangeNotification
{
  v3 = +[ML3MusicLibrary allLibraries];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100058CF8;
  v4[3] = &unk_1001BAE78;
  v4[4] = self;
  [v3 enumerateObjectsUsingBlock:v4];
}

- (void)_handleImportNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  if (v5
    && (uint64_t v6 = (void *)v5,
        [v4 object],
        v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = _NSIsNSString(),
        v7,
        v6,
        v8))
  {
    v9 = [v4 object];
    v10 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v4 name];
      int v13 = 138543875;
      v14 = self;
      __int16 v15 = 2114;
      v16 = v11;
      __int16 v17 = 2113;
      v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Received %{public}@ notification for library %{private}@. Performing sync.", (uint8_t *)&v13, 0x20u);
    }
    [(ICDPlaybackPositionService *)self _performNotificationSyncForLibraryWithUID:v9];
  }
  else
  {
    v9 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = [v4 name];
      int v13 = 138543618;
      v14 = self;
      __int16 v15 = 2114;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@ Received %{public}@ notification without libraryUID", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)_setupNotificationHandlers
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting up notifications handlers.", (uint8_t *)&v6, 0xCu);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_handleUserIdentityStoreDidChangeNotification" name:ICUserIdentityStoreDidChangeNotification object:0];

  uint64_t v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_handleImportNotification:" name:@"ICDPlaybackPositionImportRequiresSyncNotification" object:0];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (!self->_didStart)
  {
    v12 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v25 = self;
      __int16 v26 = 2114;
      v27 = v8;
      v18 = "%{public}@ Service has not started. Rejecting connection %{public}@";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v18, buf, 0x16u);
    }
LABEL_11:
    BOOL v13 = 0;
    goto LABEL_12;
  }
  v9 = [v7 valueForEntitlement:@"com.apple.itunescloudd.private"];

  if (!v9)
  {
    v12 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v25 = self;
      __int16 v26 = 2114;
      v27 = v8;
      v18 = "%{public}@ Connection missing private entitlement %{public}@";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  unsigned int v10 = [v8 processIdentifier];
  v11 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = self;
    __int16 v26 = 1024;
    LODWORD(v27) = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Got connection from pid %i", buf, 0x12u);
  }

  v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ICPlaybackPositionService];
  BOOL v13 = 1;
  [v12 setClass:objc_opt_class() forSelector:"persistPlaybackPositionEntity:isCheckpoint:completionBlock:" argumentIndex:1 ofReply:1];
  uint64_t v14 = objc_opt_class();
  __int16 v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, objc_opt_class(), 0);
  [v12 setClasses:v15 forSelector:"pushPlaybackPositionEntity:completionBlock:" argumentIndex:0 ofReply:0];

  [v12 setClass:objc_opt_class() forSelector:"pushPlaybackPositionEntity:completionBlock:" argumentIndex:1 ofReply:1];
  uint64_t v16 = objc_opt_class();
  __int16 v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, objc_opt_class(), 0);
  [v12 setClasses:v17 forSelector:"pushPlaybackPositionEntity:completionBlock:" argumentIndex:2 ofReply:1];

  [v8 setExportedInterface:v12];
  [v8 setExportedObject:self];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000594E4;
  v22[3] = &unk_1001BEE28;
  v22[4] = self;
  unsigned int v23 = v10;
  [v8 setInterruptionHandler:v22];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000595A8;
  v20[3] = &unk_1001BEE28;
  v20[4] = self;
  unsigned int v21 = v10;
  [v8 setInvalidationHandler:v20];
  [v8 resume];
LABEL_12:

  return v13;
}

- (id)_connectionClientIdentity
{
  v2 = +[NSXPCConnection currentConnection];
  v3 = v2;
  if (v2)
  {
    [v2 auditToken];
    id v4 = MSVTCCIdentityForAuditToken();
    if (v4) {
      goto LABEL_8;
    }
    uint64_t v5 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [v3 description];
      *(_DWORD *)buf = 138412290;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Could not create client identity from XPCConnection=%@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v5 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Could not create client identity with nil connection", buf, 2u);
    }
  }

  id v4 = 0;
LABEL_8:

  return v4;
}

- (void)pushPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = +[NSXPCConnection currentConnection];
    unsigned int v10 = [v6 libraryIdentifier];
    *(_DWORD *)buf = 138543874;
    unsigned int v21 = self;
    __int16 v22 = 2114;
    unsigned int v23 = v9;
    __int16 v24 = 2114;
    v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@ pushPlaybackPositionEntity:completionBlock:] Received request from connection %{public}@. libraryUID=%{public}@", buf, 0x20u);
  }
  v11 = [ICDPlaybackPositionRequestContext alloc];
  v12 = [(ICDPlaybackPositionService *)self _connectionClientIdentity];
  BOOL v13 = [(ICDPlaybackPositionRequestContext *)v11 initWithEntity:v6 clientIdentity:v12];

  requestController = self->_requestController;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000599B0;
  v17[3] = &unk_1001BAE50;
  id v18 = v6;
  id v19 = v7;
  v17[4] = self;
  id v15 = v6;
  id v16 = v7;
  [(ICDPlaybackPositionRequestController *)requestController pushPlaybackPositionWithContext:v13 completionHandler:v17];
}

- (void)pullPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = +[NSXPCConnection currentConnection];
    unsigned int v10 = [v6 libraryIdentifier];
    *(_DWORD *)buf = 138543874;
    id v19 = self;
    __int16 v20 = 2114;
    unsigned int v21 = v9;
    __int16 v22 = 2114;
    unsigned int v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@ pullPlaybackPositionEntity:] Received request from connection %{public}@. libraryUID=%{public}@", buf, 0x20u);
  }
  v11 = [ICDPlaybackPositionRequestContext alloc];
  v12 = [(ICDPlaybackPositionService *)self _connectionClientIdentity];
  BOOL v13 = [(ICDPlaybackPositionRequestContext *)v11 initWithEntity:v6 clientIdentity:v12];

  requestController = self->_requestController;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100059CF8;
  v16[3] = &unk_1001BAE28;
  v16[4] = self;
  id v17 = v7;
  id v15 = v7;
  [(ICDPlaybackPositionRequestController *)requestController pullPlaybackPositionWithRequestContext:v13 completionBlock:v16];
}

- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSXPCConnection currentConnection];
    id v7 = [v4 libraryIdentifier];
    int v11 = 138543874;
    v12 = self;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@ updateForeignDatabaseWithValuesFromPlaybackPositionEntity:] Received request from connection %{public}@. libraryUID=%{public}@", (uint8_t *)&v11, 0x20u);
  }
  int v8 = [ICDPlaybackPositionRequestContext alloc];
  v9 = [(ICDPlaybackPositionService *)self _connectionClientIdentity];
  unsigned int v10 = [(ICDPlaybackPositionRequestContext *)v8 initWithEntity:v4 clientIdentity:v9];

  [(ICDPlaybackPositionRequestController *)self->_requestController updateForeignDatabaseWithRequestContext:v10];
}

- (void)getLocalPlaybackPositionForEntityIdentifiers:(id)a3 forDomain:(id)a4 fromLibraryWithIdentifier:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = +[NSXPCConnection currentConnection];
    *(_DWORD *)buf = 138544386;
    __int16 v24 = self;
    __int16 v25 = 2114;
    __int16 v26 = v15;
    __int16 v27 = 2114;
    id v28 = v11;
    __int16 v29 = 2114;
    id v30 = v12;
    __int16 v31 = 2114;
    id v32 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@ getLocalPlaybackPositionForEntityIdentifiers:] Received request from connection %{public}@ for domain %{public}@ with library (%{public}@). identifiers=%{public}@", buf, 0x34u);
  }
  requestController = self->_requestController;
  id v17 = [(ICDPlaybackPositionService *)self _connectionClientIdentity];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10005A1DC;
  v20[3] = &unk_1001BAE00;
  v20[4] = self;
  id v21 = v12;
  id v22 = v13;
  id v18 = v13;
  id v19 = v12;
  [(ICDPlaybackPositionRequestController *)requestController getLocalPlaybackPositionForEntityIdentifiers:v10 forDomain:v11 fromLibraryWithIdentifier:v19 clientIdentity:v17 completionBlock:v20];
}

- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = +[NSXPCConnection currentConnection];
    id v12 = [v8 libraryIdentifier];
    *(_DWORD *)buf = 138543874;
    id v21 = self;
    __int16 v22 = 2114;
    unsigned int v23 = v11;
    __int16 v24 = 2114;
    __int16 v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@ persistPlaybackPositionEntity:isCheckpoint:completionBlock:] Received request from connection %{public}@. libraryUID=%{public}@", buf, 0x20u);
  }
  id v13 = [ICDPlaybackPositionRequestContext alloc];
  uint64_t v14 = [(ICDPlaybackPositionService *)self _connectionClientIdentity];
  __int16 v15 = [(ICDPlaybackPositionRequestContext *)v13 initWithEntity:v8 clientIdentity:v14];

  requestController = self->_requestController;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10005A584;
  v18[3] = &unk_1001BBBC8;
  v18[4] = self;
  id v19 = v9;
  id v17 = v9;
  [(ICDPlaybackPositionRequestController *)requestController persistPlaybackPositionWithContext:v15 isCheckpoint:v6 completionHandler:v18];
}

- (void)deletePlaybackPositionEntity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = +[NSXPCConnection currentConnection];
    id v7 = [v4 libraryIdentifier];
    int v11 = 138543874;
    id v12 = self;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    __int16 v15 = 2114;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@ deletePlaybackPositionEntity:] Received request from connection %{public}@. libraryUID=%{public}@", (uint8_t *)&v11, 0x20u);
  }
  id v8 = [ICDPlaybackPositionRequestContext alloc];
  id v9 = [(ICDPlaybackPositionService *)self _connectionClientIdentity];
  id v10 = [(ICDPlaybackPositionRequestContext *)v8 initWithEntity:v4 clientIdentity:v9];

  [(ICDPlaybackPositionRequestController *)self->_requestController deletePlaybackPositionWithRequestContext:v10];
}

- (void)deletePlaybackPositionEntitiesFromLibraryWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = +[NSXPCConnection currentConnection];
    int v9 = 138543874;
    id v10 = self;
    __int16 v11 = 2114;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@ deletePlaybackPositionEntitiesFromLibraryWithIdentifier:] Received request from connection %{public}@ for library with identifier %{public}@.", (uint8_t *)&v9, 0x20u);
  }
  requestController = self->_requestController;
  id v8 = [(ICDPlaybackPositionService *)self _connectionClientIdentity];
  [(ICDPlaybackPositionRequestController *)requestController deletePlaybackPositionEntitiesFromLibraryWithIdentifier:v4 clientIdentity:v8];
}

- (void)synchronizePlaybackPositionsForLibraryWithIdentifier:(id)a3 forDomain:(id)a4 isCheckpoint:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "PlaybackPosition");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = +[NSXPCConnection currentConnection];
    int v15 = 138544130;
    id v16 = self;
    __int16 v17 = 2114;
    id v18 = v11;
    __int16 v19 = 2114;
    id v20 = v8;
    __int16 v21 = 1024;
    BOOL v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@ synchronizePlaybackPositionsForLibraryWithIdentifier:] Received request from connection %{public}@ for library with identifier %{public}@. checkpoint=%{BOOL}u", (uint8_t *)&v15, 0x26u);
  }
  id v12 = [ICDPlaybackPositionRequestContext alloc];
  __int16 v13 = [(ICDPlaybackPositionService *)self _connectionClientIdentity];
  id v14 = [(ICDPlaybackPositionRequestContext *)v12 initWithLibraryIdentifier:v8 domain:v9 clientIdentity:v13];

  [(ICDPlaybackPositionRequestController *)self->_requestController scheduleSyncWithContext:v14 isCheckpoint:v5];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICDPlaybackPositionService;
  [(ICDPlaybackPositionService *)&v4 dealloc];
}

- (void)start
{
  self->_didStart = 1;
}

- (ICDPlaybackPositionService)init
{
  v7.receiver = self;
  v7.super_class = (Class)ICDPlaybackPositionService;
  v2 = [(ICDPlaybackPositionService *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_didStart = 0;
    objc_super v4 = objc_alloc_init(ICDPlaybackPositionRequestController);
    requestController = v3->_requestController;
    v3->_requestController = v4;
  }
  return v3;
}

@end