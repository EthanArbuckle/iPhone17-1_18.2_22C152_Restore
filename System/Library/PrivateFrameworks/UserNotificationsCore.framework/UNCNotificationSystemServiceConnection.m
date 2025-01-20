@interface UNCNotificationSystemServiceConnection
- (BOOL)isApplicationForeground:(id)a3;
- (BOOL)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4;
- (BOOL)setBadgeString:(id)a3 forBundleIdentifier:(id)a4;
- (UNCNotificationSystemServiceConnection)initWithConnection:(id)a3 connectionDelegate:(id)a4 delegate:(id)a5;
- (id)allBundleIdentifiersForCategories;
- (id)badgeNumberForBundleIdentifier:(id)a3;
- (id)categoriesForBundleIdentifier:(id)a3;
- (id)categoryForIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (void)categoryRepositoryDidChangeCategoriesForBundleIdentifier:(id)a3;
- (void)dealloc;
- (void)notificationRepositoryDidDiscoverContentOnFirstUnlockForBundleIdentifier:(id)a3;
- (void)notificationRepositoryDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4;
- (void)pendingNotificationRepositoryDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4;
- (void)removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4;
- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4;
- (void)topicRepositoryDidChangeTopicsForBundleIdentifier:(id)a3;
- (void)willPresentNotification:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation UNCNotificationSystemServiceConnection

- (UNCNotificationSystemServiceConnection)initWithConnection:(id)a3 connectionDelegate:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)UNCNotificationSystemServiceConnection;
  v12 = [(UNCNotificationSystemServiceConnection *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeWeak((id *)&v13->_connectionDelegate, v10);
    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_initWeak(&location, v13);
    connection = v13->_connection;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __89__UNCNotificationSystemServiceConnection_initWithConnection_connectionDelegate_delegate___block_invoke;
    v16[3] = &unk_265567BB0;
    v17 = v13;
    objc_copyWeak(&v18, &location);
    [(BSServiceConnectionHost *)connection configureConnection:v16];
    [(BSServiceConnectionHost *)v13->_connection activate];
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }

  return v13;
}

void __89__UNCNotificationSystemServiceConnection_initWithConnection_connectionDelegate_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x263F2B9F0] userInitiated];
  [v3 setServiceQuality:v4];

  v5 = +[UNCNotificationSystemService serviceInterface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __89__UNCNotificationSystemServiceConnection_initWithConnection_connectionDelegate_delegate___block_invoke_2;
  v8[3] = &unk_265567B88;
  a1 += 40;
  objc_copyWeak(&v9, (id *)a1);
  [v3 setInterruptionHandler:v8];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __89__UNCNotificationSystemServiceConnection_initWithConnection_connectionDelegate_delegate___block_invoke_2;
  v6[3] = &unk_265567B88;
  objc_copyWeak(&v7, (id *)a1);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
}

void __89__UNCNotificationSystemServiceConnection_initWithConnection_connectionDelegate_delegate___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2608DB000, v2, OS_LOG_TYPE_INFO, "System service connection is interrupted", v5, 2u);
    }
    id v3 = objc_loadWeakRetained(WeakRetained + 1);
    v4 = v3;
    if (v3) {
      [v3 systemServiceConnectionDidInvalidate:WeakRetained];
    }
  }
}

{
  id *WeakRetained;
  NSObject *v2;
  id v3;
  void *v4;
  uint8_t v5[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = *MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_2608DB000, v2, OS_LOG_TYPE_INFO, "System service connection is invalidated", v5, 2u);
    }
    id v3 = objc_loadWeakRetained(WeakRetained + 1);
    v4 = v3;
    if (v3) {
      [v3 systemServiceConnectionDidInvalidate:WeakRetained];
    }
  }
}

- (void)dealloc
{
  [(BSServiceConnectionHost *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)UNCNotificationSystemServiceConnection;
  [(UNCNotificationSystemServiceConnection *)&v3 dealloc];
}

- (id)badgeNumberForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained badgeNumberForBundleIdentifier:v4];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E080], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:]();
    }
    id v7 = 0;
  }

  return v7;
}

- (BOOL)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    char v10 = [WeakRetained setBadgeNumber:v6 forBundleIdentifier:v7];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E080], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:]();
    }
    char v10 = 0;
  }

  return v10;
}

- (BOOL)setBadgeString:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    char v10 = [WeakRetained setBadgeString:v6 forBundleIdentifier:v7];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E080], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:]();
    }
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isApplicationForeground:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    char v7 = [WeakRetained isApplicationForeground:v4];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E080], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:]();
    }
    char v7 = 0;
  }

  return v7;
}

- (void)willPresentNotification:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __104__UNCNotificationSystemServiceConnection_willPresentNotification_forBundleIdentifier_completionHandler___block_invoke;
    v13[3] = &unk_265567BD8;
    id v14 = v10;
    [WeakRetained willPresentNotification:v8 forBundleIdentifier:v9 withCompletionHandler:v13];
    v12 = v14;
LABEL_6:

    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E080], OS_LOG_TYPE_ERROR))
  {
    -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:]();
    if (!v10) {
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (v10)
  {
LABEL_5:
    _UNCNilDelegateError((uint64_t)"-[UNCNotificationSystemServiceConnection willPresentNotification:forBundleIdentifier:c"
    v12 = "ompletionHandler:]");
    (*((void (**)(id, void *, void *))v10 + 2))(v10, &unk_270CE12C8, v12);
    goto LABEL_6;
  }
LABEL_7:
}

void __104__UNCNotificationSystemServiceConnection_willPresentNotification_forBundleIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    v5 = NSNumber;
    id v6 = a3;
    id v7 = [v5 numberWithInteger:a2];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);
  }
}

- (void)notificationRepositoryDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained notificationRepositoryDidPerformUpdates:v6 forBundleIdentifier:v7];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E080], OS_LOG_TYPE_ERROR))
  {
    -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:]();
  }
}

- (void)notificationRepositoryDidDiscoverContentOnFirstUnlockForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained notificationRepositoryDidDiscoverContentOnFirstUnlockForBundleIdentifier:v4];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E080], OS_LOG_TYPE_ERROR))
  {
    -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:]();
  }
}

- (void)pendingNotificationRepositoryDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained pendingNotificationRepositoryDidPerformUpdates:v6 forBundleIdentifier:v7];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E080], OS_LOG_TYPE_ERROR))
  {
    -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:]();
  }
}

- (void)categoryRepositoryDidChangeCategoriesForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained categoryRepositoryDidChangeCategoriesForBundleIdentifier:v4];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E080], OS_LOG_TYPE_ERROR))
  {
    -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:]();
  }
}

- (void)topicRepositoryDidChangeTopicsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained topicRepositoryDidChangeTopicsForBundleIdentifier:v4];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E080], OS_LOG_TYPE_ERROR))
  {
    -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:]();
  }
}

- (void)removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained removeNotificationRecordsForIdentifiers:v6 bundleIdentifier:v7];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E080], OS_LOG_TYPE_ERROR))
  {
    -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:]();
  }
}

- (id)allBundleIdentifiersForCategories
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained allBundleIdentifiersForCategories];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E080], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:]();
    }
    id v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

- (id)categoryForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = [WeakRetained categoryForIdentifier:v6 bundleIdentifier:v7];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E080], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:]();
    }
    id v10 = 0;
  }

  return v10;
}

- (id)categoriesForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained categoriesForBundleIdentifier:v4];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E080], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:]();
    }
    id v7 = (void *)MEMORY[0x263EFFA68];
  }

  return v7;
}

- (void)setCategories:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setCategories:v6 forBundleIdentifier:v7];
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E080], OS_LOG_TYPE_ERROR))
  {
    -[UNCNotificationSystemServiceConnection badgeNumberForBundleIdentifier:]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_connectionDelegate);
}

- (void)badgeNumberForBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2608DB000, v0, v1, "Delegate is nil", v2, v3, v4, v5, v6);
}

@end