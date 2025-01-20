@interface SBDPlaybackPositionService
+ (id)serviceForXPCConnection:(id)a3;
- (NSXPCConnection)XPCConnection;
- (OS_dispatch_queue)queue;
- (SBCClientConfiguration)clientConfiguration;
- (SBCPlaybackPositionClientProtocol)clientProxy;
- (SBDDomainSyncServiceHandler)syncHandler;
- (SBDDomainValueServiceHandler)valueHandler;
- (SBDPlaybackPositionService)initWithXPCConnection:(id)a3;
- (id)_connectionClientIdentity;
- (void)_sendSyncHandlerMessageWithBlock:(id)a3;
- (void)_sendValueHandlerMessageWithBlock:(id)a3;
- (void)beginAccessingPlaybackPositionEntities;
- (void)deletePlaybackPositionEntities;
- (void)deletePlaybackPositionEntity:(id)a3;
- (void)endAccessingPlaybackPositionEntities;
- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 completionBlock:(id)a5;
- (void)pullLocalPlaybackPositionForEntityIdentifiers:(id)a3 completionBlock:(id)a4;
- (void)pullPlaybackPositionEntity:(id)a3 completionBlock:(id)a4;
- (void)pushPlaybackPositionEntity:(id)a3 completionBlock:(id)a4;
- (void)setClientConfiguration:(id)a3;
- (void)synchronizeImmediatelyWithCompletionHandler:(id)a3;
- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3;
@end

@implementation SBDPlaybackPositionService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientConfiguration, 0);
  objc_storeStrong((id *)&self->_valueHandler, 0);
  objc_storeStrong((id *)&self->_syncHandler, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_XPCConnection, 0);
}

- (SBCClientConfiguration)clientConfiguration
{
  return self->_clientConfiguration;
}

- (SBDDomainValueServiceHandler)valueHandler
{
  return self->_valueHandler;
}

- (SBDDomainSyncServiceHandler)syncHandler
{
  return self->_syncHandler;
}

- (SBCPlaybackPositionClientProtocol)clientProxy
{
  return self->_clientProxy;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (void)_sendValueHandlerMessageWithBlock:(id)a3
{
  id v4 = a3;
  valueHandler = self->_valueHandler;
  id v10 = v4;
  if (!valueHandler)
  {
    v6 = [SBDDomainValueServiceHandler alloc];
    v7 = [(SBCClientConfiguration *)self->_clientConfiguration playbackPositionDomain];
    v8 = [(SBDDomainValueServiceHandler *)v6 initWithDomain:v7];
    v9 = self->_valueHandler;
    self->_valueHandler = v8;

    id v4 = v10;
    valueHandler = self->_valueHandler;
  }
  (*((void (**)(id, SBDDomainValueServiceHandler *))v4 + 2))(v4, valueHandler);
}

- (void)_sendSyncHandlerMessageWithBlock:(id)a3
{
  id v4 = (void (**)(id, SBDDomainSyncServiceHandler *))a3;
  v5 = [(SBCClientConfiguration *)self->_clientConfiguration playbackPositionDomain];
  unsigned __int8 v6 = [v5 supportsSyncProtocol];

  if (v6)
  {
    syncHandler = self->_syncHandler;
    if (!syncHandler)
    {
      v8 = [SBDDomainSyncServiceHandler alloc];
      v9 = [(SBCClientConfiguration *)self->_clientConfiguration playbackPositionDomain];
      id v10 = [(SBDDomainSyncServiceHandler *)v8 initWithDomain:v9];
      v11 = self->_syncHandler;
      self->_syncHandler = v10;

      syncHandler = self->_syncHandler;
    }
    v4[2](v4, syncHandler);
  }
  else
  {
    v12 = os_log_create("com.apple.amp.storebookkeeperd", "XPC");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [(SBCClientConfiguration *)self->_clientConfiguration playbackPositionDomain];
      int v14 = 138412290;
      v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "attempt to use sync APIs on domain (%@) that does not support the sync protocol", (uint8_t *)&v14, 0xCu);
    }
    v4[2](v4, 0);
  }
}

- (id)_connectionClientIdentity
{
  XPCConnection = self->_XPCConnection;
  if (XPCConnection)
  {
    [(NSXPCConnection *)XPCConnection auditToken];
    id v4 = MSVTCCIdentityForAuditToken();
    if (v4) {
      goto LABEL_8;
    }
    v5 = os_log_create("com.apple.amp.storebookkeeperd", "XPC");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v6 = [(NSXPCConnection *)self->_XPCConnection description];
      *(_DWORD *)buf = 138412290;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Could not create client identity from XPCConnection=%@", buf, 0xCu);
    }
  }
  else
  {
    v5 = os_log_create("com.apple.amp.storebookkeeperd", "XPC");
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
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004598;
  v8[3] = &unk_100020770;
  id v9 = a3;
  id v10 = a4;
  id v6 = v9;
  id v7 = v10;
  [(SBDPlaybackPositionService *)self _sendValueHandlerMessageWithBlock:v8];
}

- (void)pullPlaybackPositionEntity:(id)a3 completionBlock:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100004680;
  v8[3] = &unk_100020770;
  id v9 = a3;
  id v10 = a4;
  id v6 = v9;
  id v7 = v10;
  [(SBDPlaybackPositionService *)self _sendValueHandlerMessageWithBlock:v8];
}

- (void)pullLocalPlaybackPositionForEntityIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SBDPlaybackPositionService *)self _connectionClientIdentity];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000478C;
  v11[3] = &unk_100020748;
  v11[4] = self;
  id v12 = v6;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v7;
  id v8 = v13;
  id v9 = v6;
  id v10 = v7;
  [(SBDPlaybackPositionService *)self _sendSyncHandlerMessageWithBlock:v11];
}

- (void)updateForeignDatabaseWithValuesFromPlaybackPositionEntity:(id)a3
{
  id v4 = a3;
  [(SBDPlaybackPositionService *)self _connectionClientIdentity];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000487C;
  v7[3] = &unk_100020720;
  id v8 = v4;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v9;
  id v6 = v4;
  [(SBDPlaybackPositionService *)self _sendSyncHandlerMessageWithBlock:v7];
}

- (void)deletePlaybackPositionEntities
{
  [(SBDPlaybackPositionService *)self _connectionClientIdentity];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004920;
  v4[3] = &unk_1000208B0;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v5;
  [(SBDPlaybackPositionService *)self _sendSyncHandlerMessageWithBlock:v4];
}

- (void)deletePlaybackPositionEntity:(id)a3
{
  id v4 = a3;
  [(SBDPlaybackPositionService *)self _connectionClientIdentity];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000049EC;
  v7[3] = &unk_100020720;
  id v8 = v4;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v9;
  id v6 = v4;
  [(SBDPlaybackPositionService *)self _sendSyncHandlerMessageWithBlock:v7];
}

- (void)persistPlaybackPositionEntity:(id)a3 isCheckpoint:(BOOL)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [(SBDPlaybackPositionService *)self _connectionClientIdentity];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004AE4;
  v13[3] = &unk_1000206F8;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v9;
  BOOL v17 = a4;
  id v14 = v8;
  id v10 = v15;
  id v11 = v8;
  id v12 = v9;
  [(SBDPlaybackPositionService *)self _sendSyncHandlerMessageWithBlock:v13];
}

- (void)endAccessingPlaybackPositionEntities
{
}

- (void)beginAccessingPlaybackPositionEntities
{
}

- (void)synchronizeImmediatelyWithCompletionHandler:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004BC8;
  v5[3] = &unk_1000208D8;
  id v6 = a3;
  id v4 = v6;
  [(SBDPlaybackPositionService *)self _sendSyncHandlerMessageWithBlock:v5];
}

- (void)setClientConfiguration:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004C84;
  v7[3] = &unk_100020FB0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v7);
}

- (SBDPlaybackPositionService)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBDPlaybackPositionService;
  id v6 = [(SBDPlaybackPositionService *)&v19 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create(0, 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_XPCConnection, a3);
    [(NSXPCConnection *)v6->_XPCConnection setExportedObject:v6];
    id v9 = +[SBCPlaybackPositionServiceInterface serviceInterface];
    [(NSXPCConnection *)v6->_XPCConnection setExportedInterface:v9];

    id v10 = +[SBCPlaybackPositionServiceInterface serviceClientInterface];
    [(NSXPCConnection *)v6->_XPCConnection setRemoteObjectInterface:v10];

    objc_initWeak(&location, v6->_XPCConnection);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100004FAC;
    v16[3] = &unk_100020670;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v6->_XPCConnection setInvalidationHandler:v16];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100005068;
    v14[3] = &unk_100020670;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)v6->_XPCConnection setInterruptionHandler:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    uint64_t v11 = [(NSXPCConnection *)v6->_XPCConnection remoteObjectProxy];
    clientProxy = v6->_clientProxy;
    v6->_clientProxy = (SBCPlaybackPositionClientProtocol *)v11;
  }
  return v6;
}

+ (id)serviceForXPCConnection:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithXPCConnection:v4];

  return v5;
}

@end