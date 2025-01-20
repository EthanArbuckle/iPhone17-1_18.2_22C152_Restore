@interface UNSUserNotificationServerRemoteNotificationConnectionListener
- (BOOL)_allowsRemoteNotificationsForBundleIdentifier:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (UNSUserNotificationServerRemoteNotificationConnectionListener)initWithRemoteNotificationService:(id)a3;
- (id)_currentConnection;
- (id)_queue_observerConnectionsForBundleIdentifier:(id)a3;
- (void)_currentConnection;
- (void)_invalidateTokenForRemoteNotificationsForBundleIdentifier:(id)a3;
- (void)_queue_addConnection:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_removeConnection:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_removeConnectionForAllBundleIdentifiers:(id)a3;
- (void)_removeConnectionForAllBundleIdentifiers:(id)a3;
- (void)_requestTokenForRemoteNotificationsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)dealloc;
- (void)didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4;
- (void)getAllowsRemoteNotificationsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)invalidateTokenForRemoteNotificationsForBundleIdentifier:(id)a3;
- (void)requestTokenForRemoteNotificationsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)resume;
@end

@implementation UNSUserNotificationServerRemoteNotificationConnectionListener

- (void)_queue_removeConnection:(id)a3 forBundleIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(NSMutableDictionary *)self->_connectionsByBundleIdentifier objectForKey:v6];
  [v7 removeObject:v9];
  if (![v7 count]) {
    [(NSMutableDictionary *)self->_connectionsByBundleIdentifier removeObjectForKey:v6];
  }
  v8 = [(NSMapTable *)self->_bundleIdentifiersByConnection objectForKey:v9];
  [v8 removeObject:v6];
  if (![v8 count]) {
    [(NSMapTable *)self->_bundleIdentifiersByConnection removeObjectForKey:v9];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D52B2E0];
  [v7 setRemoteObjectInterface:v8];

  id v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D516630];
  [v7 setExportedInterface:v9];

  [v7 setExportedObject:self];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__1;
  v14[4] = __Block_byref_object_dispose__1;
  id v10 = v7;
  id v15 = v10;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __100__UNSUserNotificationServerRemoteNotificationConnectionListener_listener_shouldAcceptNewConnection___block_invoke;
  v13[3] = &unk_26462F928;
  v13[4] = self;
  v13[5] = v14;
  [v10 setInterruptionHandler:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __100__UNSUserNotificationServerRemoteNotificationConnectionListener_listener_shouldAcceptNewConnection___block_invoke_65;
  v12[3] = &unk_26462F928;
  v12[4] = self;
  v12[5] = v14;
  [v10 setInvalidationHandler:v12];
  [v10 resume];
  _Block_object_dispose(v14, 8);

  return 1;
}

- (void)_queue_didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(UNSUserNotificationServerRemoteNotificationConnectionListener *)self _queue_observerConnectionsForBundleIdentifier:v7];
  id v9 = (void *)*MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    *(_DWORD *)buf = 138543618;
    id v23 = v7;
    __int16 v24 = 2048;
    uint64_t v25 = [v8 count];
    _os_log_impl(&dword_22289A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending received device token to %ld connections", buf, 0x16u);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v15), "remoteObjectProxy", (void)v17);
        [v16 didReceiveDeviceToken:v6 forBundleIdentifier:v7];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (id)_queue_observerConnectionsForBundleIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_connectionsByBundleIdentifier objectForKey:a3];
}

- (void)didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __107__UNSUserNotificationServerRemoteNotificationConnectionListener_didReceiveDeviceToken_forBundleIdentifier___block_invoke;
  block[3] = &unk_26462F678;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)invalidateTokenForRemoteNotificationsForBundleIdentifier:(id)a3
{
  v4 = [(UNSUserNotificationServerRemoteNotificationConnectionListener *)self _currentConnection];
  v5 = objc_msgSend(v4, "uns_clientBundleProxy");
  id v6 = objc_msgSend(v5, "un_applicationBundleIdentifier");

  if (objc_msgSend(v4, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    [(UNSUserNotificationServerRemoteNotificationConnectionListener *)self _invalidateTokenForRemoteNotificationsForBundleIdentifier:v6];
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __122__UNSUserNotificationServerRemoteNotificationConnectionListener_invalidateTokenForRemoteNotificationsForBundleIdentifier___block_invoke;
    block[3] = &unk_26462F678;
    block[4] = self;
    id v9 = v4;
    id v10 = v6;
    dispatch_async(queue, block);
  }
}

- (void)requestTokenForRemoteNotificationsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v6 = [(UNSUserNotificationServerRemoteNotificationConnectionListener *)self _currentConnection];
  id v7 = objc_msgSend(v6, "uns_clientBundleProxy");
  v8 = objc_msgSend(v7, "un_applicationBundleIdentifier");

  if (objc_msgSend(v6, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v8))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __141__UNSUserNotificationServerRemoteNotificationConnectionListener_requestTokenForRemoteNotificationsForBundleIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_26462F678;
    block[4] = self;
    id v12 = v6;
    id v10 = v8;
    id v13 = v10;
    dispatch_async(queue, block);
    [(UNSUserNotificationServerRemoteNotificationConnectionListener *)self _requestTokenForRemoteNotificationsForBundleIdentifier:v10 withCompletionHandler:v5];
  }
  else if (v5)
  {
    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
  }
}

- (id)_currentConnection
{
  v2 = [MEMORY[0x263F08D68] currentConnection];
  if (!v2)
  {
    v3 = *MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[UNSUserNotificationServerRemoteNotificationConnectionListener _currentConnection](v3);
    }
  }
  return v2;
}

- (void)_requestTokenForRemoteNotificationsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  v8 = [MEMORY[0x263F84278] sourceDescriptionWithBundleIdentifier:v6];
  id v9 = [v8 pushEnvironment];
  if (!v9)
  {
    id v10 = *MEMORY[0x263F1E060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_ERROR))
    {
      -[UNSUserNotificationServerRemoteNotificationConnectionListener _requestTokenForRemoteNotificationsForBundleIdentifier:withCompletionHandler:]((uint64_t)v6, v10);
      if (!v7) {
        goto LABEL_7;
      }
    }
    else if (!v7)
    {
      goto LABEL_7;
    }
    id v11 = UNSLocalizedFormatStringForKey(@"%@", @"REMOTE_NOTIFICATION_ENTITLEMENT_NSERROR_DESCRIPTION");
    id v12 = objc_msgSend(NSString, "stringWithFormat:", v11, @"aps-environment");
    id v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F07F70];
    uint64_t v17 = *MEMORY[0x263F08320];
    v18[0] = v12;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v16 = [v13 errorWithDomain:v14 code:3000 userInfo:v15];

    v7[2](v7, 0, v16);
    goto LABEL_7;
  }
  [(UNCRemoteNotificationServer *)self->_remoteNotificationService requestRemoteNotificationTokenWithEnvironment:v9 forBundleIdentifier:v6];
  if (v7) {
    v7[2](v7, 1, 0);
  }
LABEL_7:
}

- (void)_requestTokenForRemoteNotificationsForBundleIdentifier:(uint64_t)a1 withCompletionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 138543874;
  v3 = @"aps-environment";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = 0;
  _os_log_error_impl(&dword_22289A000, a2, OS_LOG_TYPE_ERROR, "No valid '%{public}@' entitlement string found for application '%{public}@': %{public}@.", (uint8_t *)&v2, 0x20u);
}

- (void)_invalidateTokenForRemoteNotificationsForBundleIdentifier:(id)a3
{
}

- (void)_queue_addConnection:(id)a3 forBundleIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(NSMutableDictionary *)self->_connectionsByBundleIdentifier objectForKey:v6];
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    [(NSMutableDictionary *)self->_connectionsByBundleIdentifier setObject:v7 forKey:v6];
  }
  [v7 addObject:v9];
  uint64_t v8 = [(NSMapTable *)self->_bundleIdentifiersByConnection objectForKey:v9];
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    [(NSMapTable *)self->_bundleIdentifiersByConnection setObject:v8 forKey:v9];
  }
  [v8 addObject:v6];
}

uint64_t __141__UNSUserNotificationServerRemoteNotificationConnectionListener_requestTokenForRemoteNotificationsForBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addConnection:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t __107__UNSUserNotificationServerRemoteNotificationConnectionListener_didReceiveDeviceToken_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didReceiveDeviceToken:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t __122__UNSUserNotificationServerRemoteNotificationConnectionListener_invalidateTokenForRemoteNotificationsForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeConnection:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (UNSUserNotificationServerRemoteNotificationConnectionListener)initWithRemoteNotificationService:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UNSUserNotificationServerRemoteNotificationConnectionListener;
  id v6 = [(UNSUserNotificationServerRemoteNotificationConnectionListener *)&v18 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteNotificationService, a3);
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    connectionsByBundleIdentifier = v7->_connectionsByBundleIdentifier;
    v7->_connectionsByBundleIdentifier = v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:512 valueOptions:0 capacity:0];
    bundleIdentifiersByConnection = v7->_bundleIdentifiersByConnection;
    v7->_bundleIdentifiersByConnection = (NSMapTable *)v10;

    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.usernotificationsserver.ConnectionListener", v12);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.usernotifications.remotenotificationservice"];
    listener = v7->_listener;
    v7->_listener = (NSXPCListener *)v15;

    [(NSXPCListener *)v7->_listener setDelegate:v7];
  }

  return v7;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)UNSUserNotificationServerRemoteNotificationConnectionListener;
  [(UNSUserNotificationServerRemoteNotificationConnectionListener *)&v4 dealloc];
}

- (void)resume
{
}

uint64_t __100__UNSUserNotificationServerRemoteNotificationConnectionListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  int v2 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_22289A000, v2, OS_LOG_TYPE_DEFAULT, "connection interrupted", v4, 2u);
  }
  return [*(id *)(a1 + 32) _removeConnectionForAllBundleIdentifiers:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

uint64_t __100__UNSUserNotificationServerRemoteNotificationConnectionListener_listener_shouldAcceptNewConnection___block_invoke_65(uint64_t a1)
{
  int v2 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_22289A000, v2, OS_LOG_TYPE_DEFAULT, "connection invalidated", v4, 2u);
  }
  return [*(id *)(a1 + 32) _removeConnectionForAllBundleIdentifiers:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)getAllowsRemoteNotificationsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v8 = [(UNSUserNotificationServerRemoteNotificationConnectionListener *)self _currentConnection];
  id v9 = objc_msgSend(v8, "uns_clientBundleProxy");
  uint64_t v10 = objc_msgSend(v9, "un_applicationBundleIdentifier");

  if (objc_msgSend(v8, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v10))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __135__UNSUserNotificationServerRemoteNotificationConnectionListener_getAllowsRemoteNotificationsForBundleIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_26462F950;
    uint64_t v14 = &v15;
    block[4] = self;
    id v13 = v10;
    dispatch_sync(queue, block);
  }
  if (v7) {
    v7[2](v7, *((unsigned __int8 *)v16 + 24));
  }

  _Block_object_dispose(&v15, 8);
}

uint64_t __135__UNSUserNotificationServerRemoteNotificationConnectionListener_getAllowsRemoteNotificationsForBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _allowsRemoteNotificationsForBundleIdentifier:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_allowsRemoteNotificationsForBundleIdentifier:(id)a3
{
  return [(UNCRemoteNotificationServer *)self->_remoteNotificationService allowsRemoteNotificationsForBundleIdentifier:a3];
}

- (void)_removeConnectionForAllBundleIdentifiers:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __106__UNSUserNotificationServerRemoteNotificationConnectionListener__removeConnectionForAllBundleIdentifiers___block_invoke;
  v7[3] = &unk_26462F430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __106__UNSUserNotificationServerRemoteNotificationConnectionListener__removeConnectionForAllBundleIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeConnectionForAllBundleIdentifiers:", *(void *)(a1 + 40));
}

- (void)_queue_removeConnectionForAllBundleIdentifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NSMapTable *)self->_bundleIdentifiersByConnection objectForKey:v4];
  id v6 = (void *)[v5 copy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[UNSUserNotificationServerRemoteNotificationConnectionListener _queue_removeConnection:forBundleIdentifier:](self, "_queue_removeConnection:forBundleIdentifier:", v4, *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteNotificationService, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersByConnection, 0);
  objc_storeStrong((id *)&self->_connectionsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_currentConnection
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22289A000, log, OS_LOG_TYPE_ERROR, "XPC current connection is unexpectedly nil", v1, 2u);
}

@end