@interface _PUIDXPCClientControllerTarget
+ (_PUIDXPCClientControllerTarget)currentTarget;
- (BSServiceConnection)connection;
- (PSPointerDefaultServiceClientToServerInterface)proxyInterface;
- (_PUIDXPCClientControllerTarget)initWithConnection:(id)a3 proxyInterface:(id)a4;
- (void)_performBlock:(id)a3;
- (void)autohidePointerForReason:(id)a3;
- (void)createContentMatchMoveSourcesForDisplay:(id)a3 countValue:(id)a4 completion:(id)a5;
- (void)createPointerPortalSourceCollectionForDisplay:(id)a3 completion:(id)a4;
- (void)invalidateContentMatchMoveSources:(id)a3 completion:(id)a4;
- (void)invalidatePointerPortalSourceCollection:(id)a3 completion:(id)a4;
- (void)setActiveHoverRegion:(id)a3 transitionCompletion:(id)a4;
- (void)setOverridesHoverRegions:(id)a3 display:(id)a4;
- (void)setPointerPersistentlyHiddenForReasons:(id)a3;
- (void)setPointerPersistentlyVisibleForReasons:(id)a3;
- (void)setProxyInterface:(id)a3;
- (void)setSystemPointerInteractionContextID:(id)a3 display:(id)a4;
- (void)setWantsServiceKeepAlive:(id)a3;
@end

@implementation _PUIDXPCClientControllerTarget

- (_PUIDXPCClientControllerTarget)initWithConnection:(id)a3 proxyInterface:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_PUIDXPCClientControllerTarget;
  v8 = [(_PUIDXPCClientControllerTarget *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    objc_storeWeak((id *)&v9->_proxyInterface, v7);
  }

  return v9;
}

- (void)createPointerPortalSourceCollectionForDisplay:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000154BC;
  v7[3] = &unk_1000451B8;
  v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(_PUIDXPCClientControllerTarget *)v8 _performBlock:v7];
}

- (void)invalidatePointerPortalSourceCollection:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000155D0;
  v7[3] = &unk_1000451B8;
  v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(_PUIDXPCClientControllerTarget *)v8 _performBlock:v7];
}

- (void)createContentMatchMoveSourcesForDisplay:(id)a3 countValue:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100015704;
  v10[3] = &unk_100045118;
  objc_super v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  [(_PUIDXPCClientControllerTarget *)v11 _performBlock:v10];
}

- (void)invalidateContentMatchMoveSources:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001581C;
  v7[3] = &unk_1000451B8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(_PUIDXPCClientControllerTarget *)v8 _performBlock:v7];
}

- (void)setActiveHoverRegion:(id)a3 transitionCompletion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015930;
  v7[3] = &unk_1000451B8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(_PUIDXPCClientControllerTarget *)v8 _performBlock:v7];
}

- (void)autohidePointerForReason:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015A18;
  v4[3] = &unk_100044C88;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(_PUIDXPCClientControllerTarget *)v5 _performBlock:v4];
}

- (void)setPointerPersistentlyHiddenForReasons:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015B00;
  v4[3] = &unk_100044C88;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(_PUIDXPCClientControllerTarget *)v5 _performBlock:v4];
}

- (void)setPointerPersistentlyVisibleForReasons:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015BE8;
  v4[3] = &unk_100044C88;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(_PUIDXPCClientControllerTarget *)v5 _performBlock:v4];
}

- (void)setSystemPointerInteractionContextID:(id)a3 display:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015CFC;
  v7[3] = &unk_100045168;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(_PUIDXPCClientControllerTarget *)v8 _performBlock:v7];
}

- (void)setOverridesHoverRegions:(id)a3 display:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015E10;
  v7[3] = &unk_100045168;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(_PUIDXPCClientControllerTarget *)v8 _performBlock:v7];
}

- (void)setWantsServiceKeepAlive:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015EF8;
  v4[3] = &unk_100044C88;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(_PUIDXPCClientControllerTarget *)v5 _performBlock:v4];
}

+ (_PUIDXPCClientControllerTarget)currentTarget
{
  if (qword_100056030 != -1) {
    dispatch_once(&qword_100056030, &stru_1000451D8);
  }
  pthread_key_t v2 = qword_100056028;
  return (_PUIDXPCClientControllerTarget *)pthread_getspecific(v2);
}

- (void)_performBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  if (qword_100056030 != -1) {
    dispatch_once(&qword_100056030, &stru_1000451D8);
  }
  pthread_setspecific(qword_100056028, self);
  v4[2]();
  if (qword_100056030 != -1) {
    dispatch_once(&qword_100056030, &stru_1000451D8);
  }
  pthread_setspecific(qword_100056028, 0);
}

- (BSServiceConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (BSServiceConnection *)WeakRetained;
}

- (PSPointerDefaultServiceClientToServerInterface)proxyInterface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyInterface);
  return (PSPointerDefaultServiceClientToServerInterface *)WeakRetained;
}

- (void)setProxyInterface:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxyInterface);
  objc_destroyWeak((id *)&self->_connection);
}

@end