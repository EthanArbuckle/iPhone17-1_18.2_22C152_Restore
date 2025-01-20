@interface UNSUserNotificationServerSettingsConnectionListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (UNSUserNotificationServerSettingsConnectionListener)initWithNotificationSettingsService:(id)a3;
- (id)_currentConnection;
- (void)_handleClientConnectionInterrupted:(id)a3;
- (void)_handleClientConnectionInvalidated:(id)a3;
- (void)authorizationWithOptions:(unint64_t)a3 forNotificationSourceIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)dealloc;
- (void)getNotificationSource:(id)a3 withCompletionHandler:(id)a4;
- (void)getNotificationSources:(id)a3 withCompletionHandler:(id)a4;
- (void)getNotificationSourcesWithFilter:(id)a3 completionHandler:(id)a4;
- (void)getNotificationSystemSettingsWithCompletionHandler:(id)a3;
- (void)replaceNotificationSettings:(id)a3 forNotificationSourceIdentifier:(id)a4;
- (void)replaceNotificationTopicSettings:(id)a3 forNotificationSourceIdentifier:(id)a4 topicIdentifier:(id)a5;
- (void)resetScheduledDeliverySetting;
- (void)resume;
- (void)setNotificationSystemSettings:(id)a3;
- (void)settingsService:(id)a3 didUpdateNotificationSourcesForBundleIdentifiers:(id)a4;
- (void)settingsService:(id)a3 didUpdateNotificationSystemSettings:(id)a4;
@end

@implementation UNSUserNotificationServerSettingsConnectionListener

- (UNSUserNotificationServerSettingsConnectionListener)initWithNotificationSettingsService:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UNSUserNotificationServerSettingsConnectionListener;
  v6 = [(UNSUserNotificationServerSettingsConnectionListener *)&v13 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    connections = v6->_connections;
    v6->_connections = v7;

    objc_storeStrong((id *)&v6->_settingsService, a3);
    [(UNSNotificationSettingsService *)v6->_settingsService addObserver:v6];
    id v9 = objc_alloc(MEMORY[0x263F08D88]);
    uint64_t v10 = [v9 initWithMachServiceName:*MEMORY[0x263F845C8]];
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v10;

    [(NSXPCListener *)v6->_listener setDelegate:v6];
  }

  return v6;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  [(UNSNotificationSettingsService *)self->_settingsService removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)UNSUserNotificationServerSettingsConnectionListener;
  [(UNSUserNotificationServerSettingsConnectionListener *)&v3 dealloc];
}

- (void)resume
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F845B8] clientInterface];
  [v7 setRemoteObjectInterface:v8];

  id v9 = [MEMORY[0x263F845B8] serverInterface];
  [v7 setExportedInterface:v9];

  [v7 setExportedObject:self];
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __90__UNSUserNotificationServerSettingsConnectionListener_listener_shouldAcceptNewConnection___block_invoke;
  v14[3] = &unk_26462FD10;
  objc_copyWeak(v15, &location);
  v15[1] = v7;
  [v7 setInterruptionHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __90__UNSUserNotificationServerSettingsConnectionListener_listener_shouldAcceptNewConnection___block_invoke_2;
  v12[3] = &unk_26462FD10;
  objc_copyWeak(v13, &location);
  v13[1] = v7;
  [v7 setInvalidationHandler:v12];
  [v7 resume];
  uint64_t v10 = self->_connections;
  objc_sync_enter(v10);
  [(NSMutableArray *)self->_connections addObject:v7];
  objc_sync_exit(v10);

  objc_destroyWeak(v13);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  return 1;
}

void __90__UNSUserNotificationServerSettingsConnectionListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleClientConnectionInterrupted:*(void *)(a1 + 40)];
}

void __90__UNSUserNotificationServerSettingsConnectionListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleClientConnectionInvalidated:*(void *)(a1 + 40)];
}

- (void)getNotificationSource:(id)a3 withCompletionHandler:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = [(UNSUserNotificationServerSettingsConnectionListener *)self _currentConnection];
  if (!objc_msgSend(v7, "uns_isAllowedToReadSettings"))
  {
    v8 = 0;
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v8 = [(UNSNotificationSettingsService *)self->_settingsService notificationSourceForBundleIdentifier:v9];
  if (v6) {
LABEL_5:
  }
    v6[2](v6, v8);
LABEL_6:
}

- (void)getNotificationSources:(id)a3 withCompletionHandler:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = [(UNSUserNotificationServerSettingsConnectionListener *)self _currentConnection];
  if (!objc_msgSend(v7, "uns_isAllowedToReadSettings"))
  {
    v8 = 0;
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v8 = [(UNSNotificationSettingsService *)self->_settingsService notificationSourcesForBundleIdentifiers:v9];
  if (v6) {
LABEL_5:
  }
    v6[2](v6, v8);
LABEL_6:
}

- (void)getNotificationSourcesWithFilter:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = [(UNSUserNotificationServerSettingsConnectionListener *)self _currentConnection];
  if (!objc_msgSend(v7, "uns_isAllowedToReadSettings"))
  {
    v8 = 0;
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v8 = [(UNSNotificationSettingsService *)self->_settingsService notificationSourcesWithFilter:v9];
  if (v6) {
LABEL_5:
  }
    v6[2](v6, v8);
LABEL_6:
}

- (void)authorizationWithOptions:(unint64_t)a3 forNotificationSourceIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v11 = a4;
  v8 = (void (**)(id, void, void *))a5;
  id v9 = [(UNSUserNotificationServerSettingsConnectionListener *)self _currentConnection];
  if (objc_msgSend(v9, "uns_isAllowedToWriteSettings"))
  {
    [(UNSNotificationSettingsService *)self->_settingsService authorizationWithOptions:a3 forNotificationSourceIdentifier:v11 withCompletionHandler:v8];
  }
  else if (v8)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNErrorCode:userInfo:", 1, 0);
    v8[2](v8, 0, v10);
  }
}

- (void)replaceNotificationSettings:(id)a3 forNotificationSourceIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(UNSUserNotificationServerSettingsConnectionListener *)self _currentConnection];
  if (objc_msgSend(v7, "uns_isAllowedToWriteSettings")) {
    [(UNSNotificationSettingsService *)self->_settingsService replaceNotificationSettings:v8 forNotificationSourceIdentifier:v6];
  }
}

- (void)replaceNotificationTopicSettings:(id)a3 forNotificationSourceIdentifier:(id)a4 topicIdentifier:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(UNSUserNotificationServerSettingsConnectionListener *)self _currentConnection];
  if (objc_msgSend(v10, "uns_isAllowedToWriteSettings")) {
    [(UNSNotificationSettingsService *)self->_settingsService replaceNotificationTopicSettings:v11 forNotificationSourceIdentifier:v8 topicIdentifier:v9];
  }
}

- (void)getNotificationSystemSettingsWithCompletionHandler:(id)a3
{
  id v6 = (void (**)(id, void *))a3;
  v4 = [(UNSUserNotificationServerSettingsConnectionListener *)self _currentConnection];
  if (objc_msgSend(v4, "uns_isAllowedToReadSettings"))
  {
    id v5 = [(UNSNotificationSettingsService *)self->_settingsService notificationSystemSettings];
  }
  else
  {
    id v5 = 0;
  }
  if (v6) {
    v6[2](v6, v5);
  }
}

- (void)setNotificationSystemSettings:(id)a3
{
  id v5 = a3;
  v4 = [(UNSUserNotificationServerSettingsConnectionListener *)self _currentConnection];
  if (objc_msgSend(v4, "uns_isAllowedToWriteSettings")) {
    [(UNSNotificationSettingsService *)self->_settingsService setNotificationSystemSettings:v5];
  }
}

- (void)resetScheduledDeliverySetting
{
  id v3 = [(UNSUserNotificationServerSettingsConnectionListener *)self _currentConnection];
  if (objc_msgSend(v3, "uns_isAllowedToWriteSettings")) {
    [(UNSNotificationSettingsService *)self->_settingsService resetScheduledDeliverySetting];
  }
}

- (id)_currentConnection
{
  v2 = [MEMORY[0x263F08D68] currentConnection];
  if (!v2)
  {
    id v3 = *MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[UNSUserNotificationServerRemoteNotificationConnectionListener _currentConnection](v3);
    }
  }
  return v2;
}

- (void)_handleClientConnectionInterrupted:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_22289A000, v4, OS_LOG_TYPE_DEFAULT, "Client XPC connection was interrupted: connection=%{public}@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_handleClientConnectionInvalidated:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_22289A000, v5, OS_LOG_TYPE_DEFAULT, "Client XPC connection was invalidated: connection=%{public}@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = self->_connections;
  objc_sync_enter(v6);
  [(NSMutableArray *)self->_connections removeObject:v4];
  objc_sync_exit(v6);
}

- (void)settingsService:(id)a3 didUpdateNotificationSourcesForBundleIdentifiers:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_connections;
  objc_sync_enter(v8);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = self->_connections;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_super v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "remoteObjectProxy", (void)v14);
        [v13 updateNotificationSourcesWithBundleIdentifiers:v7];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)settingsService:(id)a3 didUpdateNotificationSystemSettings:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_connections;
  objc_sync_enter(v8);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = self->_connections;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_super v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "remoteObjectProxy", (void)v14);
        [v13 updateNotificationSystemSettings:v7];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsService, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

@end