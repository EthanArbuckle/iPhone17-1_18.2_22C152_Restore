@interface MSUBrainClientImpl
- (BOOL)calculateUpdateStorageRequirements:(int)a3 attributes:(id)a4 options:(id)a5 info:(id *)a6 error:(id *)a7;
- (BOOL)getUpdateInfo:(id)a3 options:(id)a4 info:(id *)a5 error:(id *)a6;
- (NSString)brainUUID;
- (NSString)brainVersion;
- (id)_remoteInterfaceWithErrorHandler:(id)a3;
- (id)buildVersion;
- (id)init:(id)a3 version:(id)a4 endpoint:(id)a5 delgate:(id)a6;
- (id)machoUUID;
- (id)timeDateStamp;
- (void)_connectToServerIfNecessary_nolock;
- (void)_invalidateConnection;
- (void)_invalidateConnection_nolock;
- (void)applyUpdate:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)cancelUpdate:(id)a3 purge:(BOOL)a4 completion:(id)a5;
- (void)commitUnlockOnceToken:(id)a3 progress:(id)a4 completion:(id)a5;
- (void)connectToServerIfNecessary;
- (void)dealloc;
- (void)handleConnectionError:(id)a3 method:(const char *)a4 handler:(id)a5;
- (void)noteConnectionDropped;
- (void)preflightUpdate:(int)a3 options:(id)a4 progress:(id)a5 completion:(id)a6;
- (void)prepareUpdate:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6;
@end

@implementation MSUBrainClientImpl

- (id)init:(id)a3 version:(id)a4 endpoint:(id)a5 delgate:(id)a6
{
  v10 = [(MSUBrainClientImpl *)self init];
  id result = 0;
  if (a5)
  {
    if (v10)
    {
      v10->_brainVersion = (NSString *)a4;
      v10->_brainUUID = (NSString *)a3;
      v10->_serverEndpoint = (NSXPCListenerEndpoint *)a5;
      v10->_delegate = (MSUBrainDelegateNSXPCInterface *)a6;
      id v12 = a3;
      v13 = v10->_brainVersion;
      v14 = v10->_serverEndpoint;
      return v10;
    }
  }
  return result;
}

- (void)dealloc
{
  [(MSUBrainClientImpl *)self _invalidateConnection];
  self->_delegate = 0;

  v3.receiver = self;
  v3.super_class = (Class)MSUBrainClientImpl;
  [(MSUBrainClientImpl *)&v3 dealloc];
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_serverConnection remoteObjectProxyWithErrorHandler:a3];
}

- (void)_invalidateConnection_nolock
{
  serverConnection = self->_serverConnection;
  if (serverConnection)
  {
    [(NSXPCConnection *)serverConnection setInvalidationHandler:0];
    [(NSXPCConnection *)self->_serverConnection setInterruptionHandler:0];
    [(NSXPCConnection *)self->_serverConnection invalidate];

    self->_serverConnection = 0;
    self->_connected = 0;
  }
}

- (void)_invalidateConnection
{
  objc_sync_enter(self);
  [(MSUBrainClientImpl *)self _invalidateConnection_nolock];
  objc_sync_exit(self);
}

- (void)_connectToServerIfNecessary_nolock
{
  if (!self->_connected)
  {
    [(MSUBrainClientImpl *)self _invalidateConnection];
    if (self->_serverEndpoint) {
      self->_serverConnection = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:self->_serverEndpoint];
    }
    objc_super v3 = dispatch_queue_create((const char *)objc_msgSend(objc_msgSend(@"com.apple.MobileSoftwareUpdate.UpdateBrainService2", "stringByAppendingString:", @".connectionQueue"), "UTF8String"), (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    [(NSXPCConnection *)self->_serverConnection _setQueue:v3];
    dispatch_release(v3);
    v4 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSUBrainNSXPCInterface];
    v5 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSUBrainDelegateNSXPCInterface];
    v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MSURemoteableBlockNSXPCInterface];
    [(NSXPCInterface *)v4 setInterface:v6 forSelector:"_nsxpcPreflightUpdate:options:progress:completion:" argumentIndex:2 ofReply:0];
    [(NSXPCInterface *)v4 setInterface:v6 forSelector:"_nsxpcPrepareUpdate:options:progress:completion:" argumentIndex:2 ofReply:0];
    [(NSXPCInterface *)v4 setInterface:v6 forSelector:"_nsxpcCommitUnlockOnceToken:progress:completion:" argumentIndex:1 ofReply:0];
    [(NSXPCInterface *)v4 setInterface:v6 forSelector:"_nsxpcApplyUpdate:progress:completion:" argumentIndex:1 ofReply:0];
    [(NSXPCConnection *)self->_serverConnection setRemoteObjectInterface:v4];
    delegate = self->_delegate;
    if (delegate)
    {
      [(NSXPCConnection *)self->_serverConnection setExportedInterface:v5];
      [(NSXPCConnection *)self->_serverConnection setExportedObject:self->_delegate];
      delegate = self->_delegate;
    }
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3052000000;
    v11[3] = __Block_byref_object_copy__4;
    v11[4] = __Block_byref_object_dispose__4;
    v11[5] = self;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3052000000;
    v10[3] = __Block_byref_object_copy__4;
    v10[4] = __Block_byref_object_dispose__4;
    v10[5] = delegate;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __56__MSUBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke;
    v9[3] = &unk_100059E68;
    v9[4] = v11;
    v9[5] = v10;
    -[NSXPCConnection setInvalidationHandler:](self->_serverConnection, "setInvalidationHandler:", v9, _NSConcreteStackBlock, 3221225472, __56__MSUBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke_94, &unk_100059E68, v11, v10);
    [(NSXPCConnection *)self->_serverConnection setInterruptionHandler:&v8];
    [(NSXPCConnection *)self->_serverConnection resume];
    self->_connected = 1;
    _Block_object_dispose(v10, 8);
    _Block_object_dispose(v11, 8);
  }
}

uint64_t __56__MSUBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke(uint64_t a1)
{
  v2 = msuSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    CFStringRef v5 = @"com.apple.MobileSoftwareUpdate.UpdateBrainService2";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "connection to %@ invalidated", (uint8_t *)&v4, 0xCu);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) noteConnectionDropped];
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      return (uint64_t)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) connectionInvalidated];
    }
  }
  return result;
}

uint64_t __56__MSUBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke_94(uint64_t a1)
{
  v2 = msuSharedLogger();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __56__MSUBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke_94_cold_1(v2);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) noteConnectionDropped];
  uint64_t result = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result) {
      return (uint64_t)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) connectionInterrupted];
    }
  }
  return result;
}

- (void)connectToServerIfNecessary
{
  objc_sync_enter(self);
  [(MSUBrainClientImpl *)self _connectToServerIfNecessary_nolock];
  objc_sync_exit(self);
}

- (void)noteConnectionDropped
{
  objc_sync_enter(self);
  self->_connected = 0;
  objc_sync_exit(self);
}

- (void)handleConnectionError:(id)a3 method:(const char *)a4 handler:(id)a5
{
  if (a3)
  {
    v9 = msuSharedLogger();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (a4)
    {
      if (v10) {
        -[MSUBrainClientImpl handleConnectionError:method:handler:]((uint64_t)a4, (uint64_t)a3, v9);
      }
    }
    else if (v10)
    {
      -[MSUBrainClientImpl handleConnectionError:method:handler:]((uint64_t)a3, v9);
    }
    [(MSUBrainClientImpl *)self _invalidateConnection];
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)preflightUpdate:(int)a3 options:(id)a4 progress:(id)a5 completion:(id)a6
{
  uint64_t v9 = *(void *)&a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __66__MSUBrainClientImpl_preflightUpdate_options_progress_completion___block_invoke;
  v15[3] = &unk_100059EB8;
  v15[5] = a6;
  v15[6] = "-[MSUBrainClientImpl preflightUpdate:options:progress:completion:]";
  v15[4] = self;
  id v10 = [(MSUBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __66__MSUBrainClientImpl_preflightUpdate_options_progress_completion___block_invoke_3;
  v14[3] = &unk_100059EE0;
  v14[4] = a5;
  v11 = [[MSURemoteableBlock alloc] initWithProgressBlock:v14];
  id v12 = v11;
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __66__MSUBrainClientImpl_preflightUpdate_options_progress_completion___block_invoke_4;
    v13[3] = &unk_100059F08;
    v13[4] = a6;
    [v10 _nsxpcPreflightUpdate:v9 options:a4 progress:v11 completion:v13];
  }
  else
  {
    NSErrorUserInfoKey v16 = NSDebugDescriptionErrorKey;
    CFStringRef v17 = @"no remote object connection";
    (*((void (**)(id, NSError *))a6 + 2))(a6, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MobileSoftwareUpdateErrorDomain", 1364, +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1]));
  }
}

id __66__MSUBrainClientImpl_preflightUpdate_options_progress_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[6];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __66__MSUBrainClientImpl_preflightUpdate_options_progress_completion___block_invoke_2;
  v6[3] = &unk_100059E90;
  objc_super v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[4] = a2;
  v6[5] = v4;
  return [v3 handleConnectionError:a2 method:v2 handler:v6];
}

uint64_t __66__MSUBrainClientImpl_preflightUpdate_options_progress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __66__MSUBrainClientImpl_preflightUpdate_options_progress_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__MSUBrainClientImpl_preflightUpdate_options_progress_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prepareUpdate:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = __64__MSUBrainClientImpl_prepareUpdate_options_progress_completion___block_invoke;
  v15[3] = &unk_100059EB8;
  v15[5] = a6;
  v15[6] = "-[MSUBrainClientImpl prepareUpdate:options:progress:completion:]";
  v15[4] = self;
  id v10 = [(MSUBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __64__MSUBrainClientImpl_prepareUpdate_options_progress_completion___block_invoke_3;
  v14[3] = &unk_100059EE0;
  v14[4] = a5;
  v11 = [[MSURemoteableBlock alloc] initWithProgressBlock:v14];
  id v12 = v11;
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __64__MSUBrainClientImpl_prepareUpdate_options_progress_completion___block_invoke_4;
    v13[3] = &unk_100059F08;
    v13[4] = a6;
    [v10 _nsxpcPrepareUpdate:a3 options:a4 progress:v11 completion:v13];
  }
  else
  {
    NSErrorUserInfoKey v16 = NSDebugDescriptionErrorKey;
    CFStringRef v17 = @"no remote object connection";
    (*((void (**)(id, NSError *))a6 + 2))(a6, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MobileSoftwareUpdateErrorDomain", 1364, +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1]));
  }
}

id __64__MSUBrainClientImpl_prepareUpdate_options_progress_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[6];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __64__MSUBrainClientImpl_prepareUpdate_options_progress_completion___block_invoke_2;
  v6[3] = &unk_100059E90;
  objc_super v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[4] = a2;
  v6[5] = v4;
  return [v3 handleConnectionError:a2 method:v2 handler:v6];
}

uint64_t __64__MSUBrainClientImpl_prepareUpdate_options_progress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __64__MSUBrainClientImpl_prepareUpdate_options_progress_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__MSUBrainClientImpl_prepareUpdate_options_progress_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)commitUnlockOnceToken:(id)a3 progress:(id)a4 completion:(id)a5
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __64__MSUBrainClientImpl_commitUnlockOnceToken_progress_completion___block_invoke;
  v13[3] = &unk_100059EB8;
  void v13[5] = a5;
  v13[6] = "-[MSUBrainClientImpl commitUnlockOnceToken:progress:completion:]";
  v13[4] = self;
  id v8 = [(MSUBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v13];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __64__MSUBrainClientImpl_commitUnlockOnceToken_progress_completion___block_invoke_3;
  v12[3] = &unk_100059EE0;
  v12[4] = a4;
  uint64_t v9 = [[MSURemoteableBlock alloc] initWithProgressBlock:v12];
  id v10 = v9;
  if (v8)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __64__MSUBrainClientImpl_commitUnlockOnceToken_progress_completion___block_invoke_4;
    v11[3] = &unk_100059F08;
    v11[4] = a5;
    [v8 _nsxpcCommitUnlockOnceToken:a3 progress:v9 completion:v11];
  }
  else
  {
    NSErrorUserInfoKey v14 = NSDebugDescriptionErrorKey;
    CFStringRef v15 = @"no remote object connection";
    (*((void (**)(id, NSError *))a5 + 2))(a5, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MobileSoftwareUpdateErrorDomain", 1364, +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1]));
  }
}

id __64__MSUBrainClientImpl_commitUnlockOnceToken_progress_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[6];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __64__MSUBrainClientImpl_commitUnlockOnceToken_progress_completion___block_invoke_2;
  v6[3] = &unk_100059E90;
  objc_super v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[4] = a2;
  v6[5] = v4;
  return [v3 handleConnectionError:a2 method:v2 handler:v6];
}

uint64_t __64__MSUBrainClientImpl_commitUnlockOnceToken_progress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __64__MSUBrainClientImpl_commitUnlockOnceToken_progress_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__MSUBrainClientImpl_commitUnlockOnceToken_progress_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)applyUpdate:(id)a3 progress:(id)a4 completion:(id)a5
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __54__MSUBrainClientImpl_applyUpdate_progress_completion___block_invoke;
  v13[3] = &unk_100059EB8;
  void v13[5] = a5;
  v13[6] = "-[MSUBrainClientImpl applyUpdate:progress:completion:]";
  v13[4] = self;
  id v8 = [(MSUBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v13];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __54__MSUBrainClientImpl_applyUpdate_progress_completion___block_invoke_3;
  v12[3] = &unk_100059EE0;
  v12[4] = a4;
  uint64_t v9 = [[MSURemoteableBlock alloc] initWithProgressBlock:v12];
  id v10 = v9;
  if (v8)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __54__MSUBrainClientImpl_applyUpdate_progress_completion___block_invoke_4;
    v11[3] = &unk_100059F08;
    v11[4] = a5;
    [v8 _nsxpcApplyUpdate:a3 progress:v9 completion:v11];
  }
  else
  {
    NSErrorUserInfoKey v14 = NSDebugDescriptionErrorKey;
    CFStringRef v15 = @"no remote object connection";
    (*((void (**)(id, NSError *))a5 + 2))(a5, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MobileSoftwareUpdateErrorDomain", 1364, +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1]));
  }
}

id __54__MSUBrainClientImpl_applyUpdate_progress_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[6];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __54__MSUBrainClientImpl_applyUpdate_progress_completion___block_invoke_2;
  v6[3] = &unk_100059E90;
  objc_super v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[4] = a2;
  v6[5] = v4;
  return [v3 handleConnectionError:a2 method:v2 handler:v6];
}

uint64_t __54__MSUBrainClientImpl_applyUpdate_progress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __54__MSUBrainClientImpl_applyUpdate_progress_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__MSUBrainClientImpl_applyUpdate_progress_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelUpdate:(id)a3 purge:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __52__MSUBrainClientImpl_cancelUpdate_purge_completion___block_invoke;
  v10[3] = &unk_100059EB8;
  v10[5] = a5;
  void v10[6] = "-[MSUBrainClientImpl cancelUpdate:purge:completion:]";
  v10[4] = self;
  id v8 = [(MSUBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v10];
  if (v8)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __52__MSUBrainClientImpl_cancelUpdate_purge_completion___block_invoke_3;
    v9[3] = &unk_100059F08;
    v9[4] = a5;
    [v8 _nsxpcCancelUpdate:v6 options:a3 completion:v9];
  }
  else
  {
    NSErrorUserInfoKey v11 = NSDebugDescriptionErrorKey;
    CFStringRef v12 = @"no remote object connection";
    (*((void (**)(id, NSError *))a5 + 2))(a5, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MobileSoftwareUpdateErrorDomain", 1364, +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1]));
  }
}

id __52__MSUBrainClientImpl_cancelUpdate_purge_completion___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[6];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __52__MSUBrainClientImpl_cancelUpdate_purge_completion___block_invoke_2;
  v6[3] = &unk_100059E90;
  objc_super v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[4] = a2;
  v6[5] = v4;
  return [v3 handleConnectionError:a2 method:v2 handler:v6];
}

uint64_t __52__MSUBrainClientImpl_cancelUpdate_purge_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __52__MSUBrainClientImpl_cancelUpdate_purge_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)calculateUpdateStorageRequirements:(int)a3 attributes:(id)a4 options:(id)a5 info:(id *)a6 error:(id *)a7
{
  uint64_t v11 = *(void *)&a3;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  char v54 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3052000000;
  v40 = __Block_byref_object_copy__4;
  v41 = __Block_byref_object_dispose__4;
  uint64_t v42 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3052000000;
  v34 = __Block_byref_object_copy__4;
  v35 = __Block_byref_object_dispose__4;
  uint64_t v36 = 0;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke;
  v30[3] = &unk_100059F58;
  v30[7] = &v47;
  v30[8] = "-[MSUBrainClientImpl calculateUpdateStorageRequirements:attributes:options:info:error:]";
  v30[4] = self;
  v30[5] = &v43;
  v30[6] = &v37;
  id v12 = [(MSUBrainClientImpl *)self _remoteInterfaceWithErrorHandler:v30];
  if (!v12)
  {
    NSErrorUserInfoKey v58 = NSDebugDescriptionErrorKey;
    __rqtp.tv_sec = (__darwin_time_t)@"no remote object connection";
    v19 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MobileSoftwareUpdateErrorDomain", 1364, +[NSDictionary dictionaryWithObjects:&__rqtp forKeys:&v58 count:1]);
    goto LABEL_10;
  }
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke_99;
  v29[3] = &unk_100059F80;
  v29[4] = &v43;
  v29[5] = &v51;
  v29[6] = &v31;
  v29[7] = &v37;
  v29[8] = &v47;
  v29[9] = "-[MSUBrainClientImpl calculateUpdateStorageRequirements:attributes:options:info:error:]";
  [v12 _nsxpcCalculateUpdateStorageRequirements:v11 attributes:a4 options:a5 completion:v29];
  v26 = __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke_101;
  v27 = &unk_100059FA8;
  v28 = &v47;
  NSErrorUserInfoKey v14 = +[NSDate date];
  do
  {
    CFStringRef v15 = +[NSDate date];
    [+[NSRunLoop currentRunLoop] runUntilDate:[(NSDate *)v15 dateByAddingTimeInterval:0.02]];
    [+[NSDate date] timeIntervalSinceDate:v15];
    if (v16 < 0.02)
    {
      double v17 = 0.02 - v16;
      __rqtp.tv_sec = (uint64_t)v17;
      __rqtp.tv_nsec = (uint64_t)((v17 - (double)(uint64_t)v17) * 1000000000.0);
      nanosleep(&__rqtp, 0);
    }
    if (v26((uint64_t)&v25)) {
      break;
    }
    [+[NSDate date] timeIntervalSinceDate:v14];
  }
  while (v18 < 10.0);
  if (!*((unsigned char *)v48 + 24))
  {
    *((unsigned char *)v44 + 24) = 1;
    NSErrorUserInfoKey v55 = NSDebugDescriptionErrorKey;
    CFStringRef v56 = @"timeout waiting for SPI completion";
    v19 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MobileSoftwareUpdateErrorDomain", 1360, +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1]);
LABEL_10:
    id v20 = [(NSError *)v19 copy];
    v38[5] = (uint64_t)v20;
  }
  if (a6) {
    *a6 = (id)v32[5];
  }
  if (a7) {
    *a7 = (id)v38[5];
  }
  id v21 = (id)v32[5];
  id v22 = (id)v38[5];
  char v23 = *((unsigned char *)v52 + 24);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  return v23;
}

id __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  CFStringRef v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  v7 = __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke_2;
  id v8 = &unk_100059F30;
  long long v10 = *(_OWORD *)(a1 + 40);
  uint64_t v9 = a2;
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = v3;
  return objc_msgSend(v2, "handleConnectionError:method:handler:", a2);
}

void __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v2 = msuSharedLogger();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke_2_cold_1(a1, v2);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) copy];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke_99(void *a1, void *a2, void *a3)
{
  if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    uint64_t v6 = msuSharedLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = a1[9];
      int v10 = 136315650;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      v13 = a2;
      __int16 v14 = 2112;
      CFStringRef v15 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: method call already abandoned. info=%@ error=%@", (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    if (a3)
    {
      id v8 = [a3 copy];
      uint64_t v9 = a1[7];
    }
    else
    {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      id v8 = [a2 copy];
      uint64_t v9 = a1[6];
    }
    *(void *)(*(void *)(v9 + 8) + 40) = v8;
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
  }
}

uint64_t __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke_101(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (BOOL)getUpdateInfo:(id)a3 options:(id)a4 info:(id *)a5 error:(id *)a6
{
  return 0;
}

- (id)buildVersion
{
  return 0;
}

- (id)machoUUID
{
  return 0;
}

- (id)timeDateStamp
{
  return 0;
}

- (NSString)brainVersion
{
  return self->_brainVersion;
}

- (NSString)brainUUID
{
  return self->_brainUUID;
}

void __56__MSUBrainClientImpl__connectToServerIfNecessary_nolock__block_invoke_94_cold_1(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"com.apple.MobileSoftwareUpdate.UpdateBrainService2";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "connection to %@ interrupted", (uint8_t *)&v1, 0xCu);
}

- (void)handleConnectionError:(uint64_t)a1 method:(NSObject *)a2 handler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "connection error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)handleConnectionError:(uint64_t)a1 method:(uint64_t)a2 handler:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s - connection error: %@", (uint8_t *)&v3, 0x16u);
}

void __87__MSUBrainClientImpl_calculateUpdateStorageRequirements_attributes_options_info_error___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315394;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: method call already abandoned. error=%@", (uint8_t *)&v4, 0x16u);
}

@end