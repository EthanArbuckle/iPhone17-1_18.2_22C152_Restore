@interface CDServiceListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CDServiceListener)init;
- (CDServiceListenerDelegate)delegate;
- (OS_dispatch_queue)dispatchQueue;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_activated;
- (void)_connectionInvalidated:(id)a3;
- (void)_invalidated;
- (void)_languageNotificationEnsureStarted;
- (void)_languageNotificationEnsureStopped;
- (void)activate;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation CDServiceListener

- (CDServiceListener)init
{
  v5.receiver = self;
  v5.super_class = (Class)CDServiceListener;
  v2 = [(CDServiceListener *)&v5 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_activateCalledAtomic = 0;
    v3->_languageNotificationToken = -1;
  }
  return v3;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void)activate
{
  v3 = cps_service_listener_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100022300(v3);
  }

  atomic_store(1u, (unsigned __int8 *)&self->_activateCalledAtomic);
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000165A4;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)invalidate
{
  v3 = cps_service_listener_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100022344(v3);
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001665C;
  block[3] = &unk_1000347D8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_activated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = cps_service_listener_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "activated", v6, 2u);
  }

  [(CDServiceListener *)self _languageNotificationEnsureStarted];
  v4 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.companiond.xpc"];
  listener = self->_listener;
  self->_listener = v4;

  [(NSXPCListener *)self->_listener _setQueue:self->_dispatchQueue];
  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener resume];
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    v3 = cps_service_listener_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "invalidated", v5, 2u);
    }

    [(CDServiceListener *)self _languageNotificationEnsureStopped];
    [(NSXPCListener *)self->_listener invalidate];
    listener = self->_listener;
    self->_listener = 0;

    objc_storeWeak((id *)&self->_delegate, 0);
    self->_invalidateDone = 1;
  }
}

- (void)_connectionInvalidated:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)dispatchQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained serviceListener:self connectionInvalidated:v5];
}

- (void)_languageNotificationEnsureStarted
{
  if (self->_languageNotificationToken == -1) {
    notify_register_dispatch("AppleLanguagePreferencesChangedNotification", &self->_languageNotificationToken, (dispatch_queue_t)self->_dispatchQueue, &stru_100034F88);
  }
}

- (void)_languageNotificationEnsureStopped
{
  int languageNotificationToken = self->_languageNotificationToken;
  if (languageNotificationToken != -1)
  {
    notify_cancel(languageNotificationToken);
    self->_int languageNotificationToken = -1;
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  +[BSDescriptionBuilder builderWithObject:self];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000169E4;
  v8[3] = &unk_100034800;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v5;
  v10 = self;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];

  id v6 = v5;
  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CDServiceListener *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:self];
}

- (id)succinctDescription
{
  v2 = [(CDServiceListener *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  dispatchQueue = self->_dispatchQueue;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)dispatchQueue);
  v7 = [[CDServiceConnection alloc] initWithConnection:v6];
  [v6 _setQueue:self->_dispatchQueue];
  v8 = +[CPSAuthenticationServiceInterface daemonInterface];
  [v6 setExportedInterface:v8];

  id v9 = +[CPSAuthenticationServiceInterface clientInterface];
  [v6 setRemoteObjectInterface:v9];

  [v6 setExportedObject:v7];
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_100016C14;
  v16 = &unk_100034800;
  v17 = self;
  v18 = v7;
  v10 = v7;
  [v6 setInvalidationHandler:&v13];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained serviceListener:self willAcceptConnection:v10 v13, v14, v15, v16, v17];

  [v6 resume];
  return 1;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (CDServiceListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CDServiceListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end