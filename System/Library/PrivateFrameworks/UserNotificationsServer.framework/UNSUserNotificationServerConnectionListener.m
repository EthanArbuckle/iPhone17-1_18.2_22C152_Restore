@interface UNSUserNotificationServerConnectionListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (UNSUserNotificationServerConnectionListener)initWithCategoryRepository:(id)a3 notificationSchedulingService:(id)a4 notificationAuthorizationService:(id)a5 notificationSettingsService:(id)a6 notificationRepository:(id)a7 remoteNotificationConnectionListener:(id)a8 remoteNotificationService:(id)a9 applicationLauncher:(id)a10 attachmentsService:(id)a11 locationMonitor:(id)a12 topicRepository:(id)a13 localizationService:(id)a14 communicationContextService:(id)a15;
- (id)_currentConnection;
- (id)_queue_delegateConnectionForBundleIdentifier:(id)a3;
- (id)_queue_notificationRequestsForNotificationRecords:(id)a3 bundleIdentifier:(id)a4;
- (id)_queue_notificationsForNotificationRecords:(id)a3 bundleIdentifier:(id)a4;
- (id)_queue_observerConnectionsForBundleIdentifier:(id)a3;
- (id)_serviceResolvedNotificationRequest:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5;
- (void)_queue_addConnection:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_removeConnection:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_removeConnectionForAllBundleIdentifiers:(id)a3;
- (void)_removeConnectionForAllBundleIdentifiers:(id)a3;
- (void)_saveNotificationRecord:(id)a3 shouldRepost:(BOOL)a4 forBundleIdentifier:(id)a5 withCompletionHandler:(id)a6;
- (void)_saveNotificationRequest:(id)a3 shouldRepost:(BOOL)a4 deliveredDate:(id)a5 forBundleIdentifier:(id)a6 withCompletionHandler:(id)a7;
- (void)addNotificationRequest:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)dealloc;
- (void)didReceiveDeviceToken:(id)a3 forBundleIdentifier:(id)a4;
- (void)getBadgeNumberForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getClearedInfoForDataProviderMigrationWithBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getDeliveredNotificationsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getNotificationCategoriesForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getNotificationSettingsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getNotificationSettingsForTopicsWithBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getNotificationTopicsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)getPendingNotificationRequestsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)isAccessToNotificationCenterAllowedForServiceExtensionWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeAllDeliveredNotificationsForBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeAllPendingNotificationRequestsForBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removePendingNotificationRequestsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)removeSimilarNotificationRequests:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)replaceContentForRequestWithIdentifier:(id)a3 bundleIdentifier:(id)a4 replacementContent:(id)a5 completionHandler:(id)a6;
- (void)requestAuthorizationWithOptions:(unint64_t)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)requestRemoveAuthorizationForBundleIdentifier:(id)a3 completionHandler:(id)a4;
- (void)resume;
- (void)setBadgeCount:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)setConnectionDetails:(id)a3;
- (void)setNotificationCategories:(id)a3 forBundleIdentifier:(id)a4;
- (void)setNotificationRequests:(id)a3 forBundleIdentifier:(id)a4;
- (void)setNotificationRequests:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setNotificationTopics:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)setObservingUserNotifications:(BOOL)a3 forBundleIdentifier:(id)a4;
@end

@implementation UNSUserNotificationServerConnectionListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F1DFC0] clientInterface];
  [v7 setRemoteObjectInterface:v8];

  v9 = [MEMORY[0x263F1DFC0] serverInterface];
  [v7 setExportedInterface:v9];

  [v7 setExportedObject:self];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__4;
  v14[4] = __Block_byref_object_dispose__4;
  id v10 = v7;
  id v15 = v10;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__UNSUserNotificationServerConnectionListener_listener_shouldAcceptNewConnection___block_invoke;
  v13[3] = &unk_26462F928;
  v13[4] = self;
  v13[5] = v14;
  [v10 setInterruptionHandler:v13];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__UNSUserNotificationServerConnectionListener_listener_shouldAcceptNewConnection___block_invoke_8;
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
  v8 = [(UNSUserNotificationServerConnectionListener *)self _queue_observerConnectionsForBundleIdentifier:v7];
  v9 = (void *)*MEMORY[0x263F1E010];
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
  block[2] = __89__UNSUserNotificationServerConnectionListener_didReceiveDeviceToken_forBundleIdentifier___block_invoke;
  block[3] = &unk_26462F678;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __93__UNSUserNotificationServerConnectionListener_setNotificationCategories_forBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 identifier];
  id v6 = [v4 identifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __114__UNSUserNotificationServerConnectionListener_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notificationCategoryForNotificationCategoryRecord:a2];
}

- (void)getBadgeNumberForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__4;
  long long v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  v8 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  id v9 = (os_log_t *)MEMORY[0x263F1E010];
  id v10 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v6;
    _os_log_impl(&dword_22289A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting badge number", buf, 0xCu);
  }
  if (objc_msgSend(v8, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __103__UNSUserNotificationServerConnectionListener_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_26462F950;
    uint64_t v14 = &v15;
    block[4] = self;
    id v13 = v6;
    dispatch_sync(queue, block);
  }
  else if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener getBadgeNumberForBundleIdentifier:withCompletionHandler:]();
  }
  if (v7) {
    v7[2](v7, v16[5]);
  }

  _Block_object_dispose(&v15, 8);
}

- (void)requestAuthorizationWithOptions:(unint64_t)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  id v10 = (os_log_t *)MEMORY[0x263F1E010];
  id v11 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    id v16 = v8;
    __int16 v17 = 2048;
    unint64_t v18 = a3;
    _os_log_impl(&dword_22289A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting authorization with options %ld", (uint8_t *)&v15, 0x16u);
  }
  id v12 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  if (objc_msgSend(v12, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v8))
  {
    id v13 = [MEMORY[0x263F84278] sourceDescriptionWithBundleIdentifier:v8];
    if (!v13)
    {
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      {
        -[UNSUserNotificationServerConnectionListener requestAuthorizationWithOptions:forBundleIdentifier:completionHandler:]();
        if (!v9) {
          goto LABEL_12;
        }
      }
      else if (!v9)
      {
        goto LABEL_12;
      }
      uint64_t v14 = objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNErrorCode:userInfo:", 1, 0);
      v9[2](v9, 0, v14);

      goto LABEL_12;
    }
    [(UNSNotificationAuthorizationService *)self->_notificationsAuthorizationService requestAuthorizationWithOptions:a3 forNotificationSourceDescription:v13 completionHandler:v9];
LABEL_12:

    goto LABEL_13;
  }
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener requestAuthorizationWithOptions:forBundleIdentifier:completionHandler:]();
    if (!v9) {
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  if (v9)
  {
LABEL_8:
    id v13 = objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNErrorCode:userInfo:", 1, 0);
    v9[2](v9, 0, v13);
    goto LABEL_12;
  }
LABEL_13:
}

- (void)setBadgeCount:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  if (v8) {
    uint64_t v12 = (int)[v8 intValue];
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = (os_log_t *)MEMORY[0x263F1E010];
  uint64_t v14 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    id v16 = v9;
    __int16 v17 = 2050;
    uint64_t v18 = v12;
    _os_log_impl(&dword_22289A000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting badge count to %{public}ld", (uint8_t *)&v15, 0x16u);
  }
  if (objc_msgSend(v11, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v9))
  {
    [(UNCNotificationRepository *)self->_notificationRepository setBadgeCount:v12 forBundleIdentifier:v9 withCompletionHandler:v10];
  }
  else if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener setBadgeCount:forBundleIdentifier:withCompletionHandler:]();
  }
}

- (void)setNotificationCategories:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  id v9 = (os_log_t *)MEMORY[0x263F1E010];
  id v10 = (void *)*MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    int v15 = 138543618;
    id v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = [v6 count];
    _os_log_impl(&dword_22289A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting %ld notification categories", (uint8_t *)&v15, 0x16u);
  }
  if (objc_msgSend(v8, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v7))
  {
    uint64_t v12 = [v6 allObjects];
    id v13 = [v12 sortedArrayUsingComparator:&__block_literal_global_9];

    uint64_t v14 = objc_msgSend(v13, "bs_map:", *MEMORY[0x263F84358]);
    [(UNSNotificationCategoryRepository *)self->_categoryRepository setCategories:v14 forBundleIdentifier:v7];
  }
  else if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener setNotificationCategories:forBundleIdentifier:]();
  }
}

- (void)setNotificationTopics:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  uint64_t v12 = (os_log_t *)MEMORY[0x263F1E010];
  id v13 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543618;
    id v17 = v9;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl(&dword_22289A000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting topics %{public}@", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v14 = [v8 allObjects];
  int v15 = objc_msgSend(v14, "bs_map:", *MEMORY[0x263F84368]);

  if (objc_msgSend(v11, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v9))
  {
    [(UNCNotificationTopicRepository *)self->_topicRepository setTopics:v15 forBundleIdentifier:v9 withCompletionHandler:v10];
  }
  else if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener setNotificationTopics:forBundleIdentifier:withCompletionHandler:]();
  }
}

- (void)getNotificationSettingsForTopicsWithBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = (os_log_t *)MEMORY[0x263F1E010];
  id v9 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_22289A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting notification settings for topics", (uint8_t *)&v12, 0xCu);
  }
  id v10 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  if (objc_msgSend(v10, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    id v11 = [(UNSNotificationSettingsService *)self->_notificationSettingsService notificationSettingsForTopicsWithBundleIdentifier:v6];
    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
    -[UNSUserNotificationServerConnectionListener getNotificationSettingsForTopicsWithBundleIdentifier:withCompletionHandler:]();
  }
  id v11 = 0;
  if (v7) {
LABEL_9:
  }
    v7[2](v7, v11);
LABEL_10:
}

- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  int v12 = (os_log_t *)MEMORY[0x263F1E010];
  id v13 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    id v15 = v9;
    __int16 v16 = 2114;
    id v17 = v8;
    _os_log_impl(&dword_22289A000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting badge number to %{public}@", (uint8_t *)&v14, 0x16u);
  }
  if (objc_msgSend(v11, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v9))
  {
    [(UNCNotificationRepository *)self->_notificationRepository setBadgeNumber:v8 forBundleIdentifier:v9 withCompletionHandler:v10];
  }
  else if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener setBadgeNumber:forBundleIdentifier:withCompletionHandler:]();
  }
}

- (void)setConnectionDetails:(id)a3
{
  id v4 = a3;
  v5 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  if (objc_msgSend(v5, "uns_isAllowedFromDaemon"))
  {
    objc_msgSend(v5, "uns_setConnectionDetails:", v4);
  }
  else
  {
    id v6 = *MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      -[UNSUserNotificationServerConnectionListener setConnectionDetails:](v6);
    }
  }
}

- (void)getNotificationSettingsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = (os_log_t *)MEMORY[0x263F1E010];
  id v9 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_22289A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting notification settings", (uint8_t *)&v12, 0xCu);
  }
  id v10 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  if (objc_msgSend(v10, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    id v11 = [(UNSNotificationSettingsService *)self->_notificationSettingsService notificationSettingsForBundleIdentifier:v6];
    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
    -[UNSUserNotificationServerConnectionListener getNotificationSettingsForBundleIdentifier:withCompletionHandler:]();
  }
  id v11 = 0;
  if (v7) {
LABEL_9:
  }
    v7[2](v7, v11);
LABEL_10:
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

uint64_t __89__UNSUserNotificationServerConnectionListener_didReceiveDeviceToken_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_didReceiveDeviceToken:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __103__UNSUserNotificationServerConnectionListener_getBadgeNumberForBundleIdentifier_withCompletionHandler___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 88) badgeNumberForBundleIdentifier:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __114__UNSUserNotificationServerConnectionListener_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) categoriesForBundleIdentifier:a1[5]];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1[4] + 48) bundleWithIdentifier:a1[5]];
    id v4 = (void *)[objc_alloc(MEMORY[0x263F84240]) initWithBundle:v3];
    v5 = [MEMORY[0x263EFFA08] setWithArray:v2];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __114__UNSUserNotificationServerConnectionListener_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke_2;
    v10[3] = &unk_264630078;
    id v11 = v4;
    id v6 = v4;
    uint64_t v7 = objc_msgSend(v5, "bs_map:", v10);
    uint64_t v8 = *(void *)(a1[6] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (void)getNotificationCategoriesForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__4;
  id v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  uint64_t v8 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  id v9 = (os_log_t *)MEMORY[0x263F1E010];
  id v10 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v6;
    _os_log_impl(&dword_22289A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting notification categories", buf, 0xCu);
  }
  if (objc_msgSend(v8, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __114__UNSUserNotificationServerConnectionListener_getNotificationCategoriesForBundleIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_2646300A0;
    block[4] = self;
    id v13 = v6;
    uint64_t v14 = &v15;
    dispatch_sync(queue, block);
  }
  else if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener getNotificationCategoriesForBundleIdentifier:withCompletionHandler:]();
  }
  if (v7) {
    v7[2](v7, v16[5]);
  }

  _Block_object_dispose(&v15, 8);
}

- (UNSUserNotificationServerConnectionListener)initWithCategoryRepository:(id)a3 notificationSchedulingService:(id)a4 notificationAuthorizationService:(id)a5 notificationSettingsService:(id)a6 notificationRepository:(id)a7 remoteNotificationConnectionListener:(id)a8 remoteNotificationService:(id)a9 applicationLauncher:(id)a10 attachmentsService:(id)a11 locationMonitor:(id)a12 topicRepository:(id)a13 localizationService:(id)a14 communicationContextService:(id)a15
{
  id v47 = a3;
  id v46 = a4;
  id v45 = a5;
  id v44 = a6;
  id v43 = a7;
  id v42 = a8;
  id v41 = a9;
  id v40 = a10;
  id v39 = a11;
  id v38 = a12;
  id v37 = a13;
  id v36 = a14;
  id v35 = a15;
  v48.receiver = self;
  v48.super_class = (Class)UNSUserNotificationServerConnectionListener;
  id v20 = [(UNSUserNotificationServerConnectionListener *)&v48 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_categoryRepository, a3);
    objc_storeStrong((id *)&v21->_notificationSchedulingService, a4);
    objc_storeStrong((id *)&v21->_notificationsAuthorizationService, a5);
    objc_storeStrong((id *)&v21->_notificationSettingsService, a6);
    objc_storeStrong((id *)&v21->_notificationRepository, a7);
    objc_storeStrong((id *)&v21->_remoteNotificationConnectionListener, a8);
    objc_storeStrong((id *)&v21->_remoteNotificationService, a9);
    objc_storeStrong((id *)&v21->_applicationLauncher, a10);
    objc_storeStrong((id *)&v21->_attachmentsService, a11);
    objc_storeStrong((id *)&v21->_locationMonitor, a12);
    objc_storeStrong((id *)&v21->_topicRepository, a13);
    objc_storeStrong((id *)&v21->_localizationService, a14);
    objc_storeStrong((id *)&v21->_communicationContextService, a15);
    id v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    connectionsByBundleIdentifier = v21->_connectionsByBundleIdentifier;
    v21->_connectionsByBundleIdentifier = v22;

    uint64_t v24 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:512 valueOptions:0 capacity:0];
    bundleIdentifiersByConnection = v21->_bundleIdentifiersByConnection;
    v21->_bundleIdentifiersByConnection = (NSMapTable *)v24;

    uint64_t v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create("com.apple.usernotificationsserver.ConnectionListener", v26);
    queue = v21->_queue;
    v21->_queue = (OS_dispatch_queue *)v27;

    id v29 = objc_alloc(MEMORY[0x263F08D88]);
    uint64_t v30 = [v29 initWithMachServiceName:*MEMORY[0x263F1E0F8]];
    listener = v21->_listener;
    v21->_listener = (NSXPCListener *)v30;

    [(NSXPCListener *)v21->_listener setDelegate:v21];
  }

  return v21;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)UNSUserNotificationServerConnectionListener;
  [(UNSUserNotificationServerConnectionListener *)&v4 dealloc];
}

- (void)resume
{
}

uint64_t __82__UNSUserNotificationServerConnectionListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_22289A000, v2, OS_LOG_TYPE_DEFAULT, "connection interrupted", v4, 2u);
  }
  return [*(id *)(a1 + 32) _removeConnectionForAllBundleIdentifiers:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

uint64_t __82__UNSUserNotificationServerConnectionListener_listener_shouldAcceptNewConnection___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_22289A000, v2, OS_LOG_TYPE_DEFAULT, "connection invalidated", v4, 2u);
  }
  return [*(id *)(a1 + 32) _removeConnectionForAllBundleIdentifiers:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)setObservingUserNotifications:(BOOL)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  if (objc_msgSend(v7, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    queue = self->_queue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __97__UNSUserNotificationServerConnectionListener_setObservingUserNotifications_forBundleIdentifier___block_invoke;
    v9[3] = &unk_26462FAA8;
    BOOL v12 = a3;
    v9[4] = self;
    id v10 = v7;
    id v11 = v6;
    dispatch_async(queue, v9);
  }
}

uint64_t __97__UNSUserNotificationServerConnectionListener_setObservingUserNotifications_forBundleIdentifier___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  if (v2) {
    return objc_msgSend(v3, "_queue_addConnection:forBundleIdentifier:", v4, v5);
  }
  else {
    return objc_msgSend(v3, "_queue_removeConnection:forBundleIdentifier:", v4, v5);
  }
}

- (void)requestRemoveAuthorizationForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = (os_log_t *)MEMORY[0x263F1E010];
  id v9 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = v6;
    _os_log_impl(&dword_22289A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting remove authorization", (uint8_t *)&v13, 0xCu);
  }
  id v10 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  if (objc_msgSend(v10, "uns_isInternalUserNotificationsTool"))
  {
    id v11 = [MEMORY[0x263F84278] sourceDescriptionWithBundleIdentifier:v6];
    if (!v11)
    {
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        -[UNSUserNotificationServerConnectionListener requestRemoveAuthorizationForBundleIdentifier:completionHandler:]();
        if (!v7) {
          goto LABEL_12;
        }
      }
      else if (!v7)
      {
        goto LABEL_12;
      }
      BOOL v12 = objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNErrorCode:userInfo:", 1, 0);
      v7[2](v7, 0, v12);

      goto LABEL_12;
    }
    [(UNSNotificationAuthorizationService *)self->_notificationsAuthorizationService requestRemoveAuthorizationForNotificationSourceDescription:v11 completionHandler:v7];
LABEL_12:

    goto LABEL_13;
  }
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener requestRemoveAuthorizationForBundleIdentifier:completionHandler:]();
    if (!v7) {
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  if (v7)
  {
LABEL_8:
    id v11 = objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNErrorCode:userInfo:", 1, 0);
    v7[2](v7, 0, v11);
    goto LABEL_12;
  }
LABEL_13:
}

- (void)addNotificationRequest:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  uint64_t v12 = [v8 destinations];
  int v13 = (id)*MEMORY[0x263F1E010];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = self;
    uint64_t v25 = v11;
    id v26 = v9;
    id v14 = [v8 identifier];
    objc_msgSend(v14, "un_logDigest");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 == 15)
    {
      __int16 v16 = @"Default";
    }
    else
    {
      UNNotificationDestinationStrings();
      __int16 v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v17 = [v8 content];
    uint64_t v18 = [v17 date];
    id v19 = objc_msgSend(v18, "un_logString");
    *(_DWORD *)buf = 138544130;
    id v28 = v26;
    __int16 v29 = 2114;
    id v30 = v15;
    __int16 v31 = 2114;
    v32 = v16;
    __int16 v33 = 2114;
    v34 = v19;
    _os_log_impl(&dword_22289A000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding notification request %{public}@ to destinations: %{public}@, contentDate: %{public}@", buf, 0x2Au);

    if (v12 != 15) {
    id v11 = v25;
    }
    id v9 = v26;
    self = v24;
  }

  if (UNIsInternalInstall()
    && ([v8 content],
        id v20 = objc_claimAutoreleasedReturnValue(),
        [v20 userInfo],
        v21 = objc_claimAutoreleasedReturnValue(),
        int v22 = objc_msgSend(v11, "uns_requestContainsDisallowedPrivateUserInfo:", v21),
        v21,
        v20,
        v22))
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR))
    {
      -[UNSUserNotificationServerConnectionListener addNotificationRequest:forBundleIdentifier:withCompletionHandler:]();
      if (!v10) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else
  {
    if (objc_msgSend(v11, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v9))
    {
      [(UNSUserNotificationServerConnectionListener *)self _saveNotificationRequest:v8 shouldRepost:1 deliveredDate:0 forBundleIdentifier:v9 withCompletionHandler:v10];
      goto LABEL_18;
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR))
    {
      -[UNSUserNotificationServerConnectionListener addNotificationRequest:forBundleIdentifier:withCompletionHandler:]();
      if (!v10) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  if (v10)
  {
LABEL_17:
    uint64_t v23 = objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNErrorCode:userInfo:", 1, 0);
    v10[2](v10, v23);
  }
LABEL_18:
}

- (void)replaceContentForRequestWithIdentifier:(id)a3 bundleIdentifier:(id)a4 replacementContent:(id)a5 completionHandler:(id)a6
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void (**)(id, void))a6;
  id v14 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  id v15 = (os_log_t *)MEMORY[0x263F1E010];
  __int16 v16 = (void *)*MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = v16;
    uint64_t v18 = objc_msgSend(v10, "un_logDigest");
    [v12 date];
    id v19 = v13;
    id v20 = v14;
    id v21 = v12;
    uint64_t v23 = v22 = v10;
    uint64_t v24 = objc_msgSend(v23, "un_logString");
    *(_DWORD *)buf = 138543874;
    id v47 = v11;
    __int16 v48 = 2114;
    v49 = v18;
    __int16 v50 = 2114;
    v51 = v24;
    _os_log_impl(&dword_22289A000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Replacing notification content %{public}@, contentDate: %{public}@", buf, 0x20u);

    id v10 = v22;
    id v12 = v21;
    id v14 = v20;
    int v13 = v19;
    id v15 = (os_log_t *)MEMORY[0x263F1E010];
  }
  if (UNIsInternalInstall()
    && ([v12 userInfo],
        uint64_t v25 = objc_claimAutoreleasedReturnValue(),
        int v26 = objc_msgSend(v14, "uns_requestContainsDisallowedPrivateUserInfo:", v25),
        v25,
        v26))
  {
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
    {
      -[UNSUserNotificationServerConnectionListener addNotificationRequest:forBundleIdentifier:withCompletionHandler:]();
      if (!v13) {
        goto LABEL_20;
      }
      goto LABEL_14;
    }
  }
  else
  {
    if (objc_msgSend(v14, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v11))
    {
      uint64_t v27 = [(UNCNotificationRepository *)self->_notificationRepository notificationRecordForIdentifier:v10 bundleIdentifier:v11];
      id v28 = (void *)v27;
      if (v27)
      {
        uint64_t v45 = v27;
        __int16 v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
        id v30 = [(UNSUserNotificationServerConnectionListener *)self _queue_notificationsForNotificationRecords:v29 bundleIdentifier:v11];

        id v42 = v30;
        id v40 = [v30 firstObject];
        __int16 v31 = [v40 request];
        v32 = [(UNCNotificationSchedulingService *)self->_notificationSchedulingService undeliveredNotificationRecordsForBundleIdentifier:v11];
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __140__UNSUserNotificationServerConnectionListener_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke;
        v43[3] = &unk_2646300E8;
        id v33 = v10;
        id v44 = v33;
        id v41 = v10;
        if (objc_msgSend(v32, "bs_containsObjectPassingTest:", v43))
        {
          uint64_t v34 = [v31 trigger];
          uint64_t v35 = v31;
          id v36 = (void *)v34;
        }
        else
        {
          uint64_t v35 = v31;
          id v36 = 0;
        }
        id v39 = v35;
        id v37 = objc_msgSend(MEMORY[0x263F1DF48], "requestWithIdentifier:content:trigger:destinations:", v33, v12, v36, objc_msgSend(v35, "destinations"));
        id v38 = [v40 date];
        [(UNSUserNotificationServerConnectionListener *)self _saveNotificationRequest:v37 shouldRepost:0 deliveredDate:v38 forBundleIdentifier:v11 withCompletionHandler:v13];

        id v10 = v41;
      }
      else if (v13)
      {
        v13[2](v13, 0);
      }
      goto LABEL_19;
    }
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
    {
      -[UNSUserNotificationServerConnectionListener replaceContentForRequestWithIdentifier:bundleIdentifier:replacementContent:completionHandler:]();
      if (!v13) {
        goto LABEL_20;
      }
      goto LABEL_14;
    }
  }
  if (v13)
  {
LABEL_14:
    id v28 = objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNErrorCode:userInfo:", 1, 0);
    ((void (**)(id, void *))v13)[2](v13, v28);
LABEL_19:
  }
LABEL_20:
}

uint64_t __140__UNSUserNotificationServerConnectionListener_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_saveNotificationRequest:(id)a3 shouldRepost:(BOOL)a4 deliveredDate:(id)a5 forBundleIdentifier:(id)a6 withCompletionHandler:(id)a7
{
  uint64_t v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  __int16 v16 = [v12 identifier];
  if ([v16 length])
  {
    id v26 = 0;
    uint64_t v17 = [(UNSUserNotificationServerConnectionListener *)self _serviceResolvedNotificationRequest:v12 forBundleIdentifier:v14 error:&v26];
    id v18 = v26;
    if (v17)
    {
      id v19 = (*(void (**)(void))(*MEMORY[0x263F84360] + 16))();
      [v19 setDate:v13];
      if (([v19 hasPendingTrigger] & 1) == 0)
      {
        unsigned int v22 = v10;
        id v20 = [v17 content];
        unsigned int v23 = objc_msgSend(v20, "uns_willNotifyUser");

        id v21 = [(UNSNotificationSettingsService *)self->_notificationSettingsService notificationSettingsForBundleIdentifier:v14];
        if (([v21 alertSetting] != 2 || !objc_msgSend(v21, "alertStyle"))
          && [v21 notificationCenterSetting] != 2)
        {
          objc_msgSend(v21, "lockScreenSetting", v23);
        }
        UNCPowerLogUserNotificationDefaultTriggerEvent();

        uint64_t v10 = v22;
      }
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __141__UNSUserNotificationServerConnectionListener__saveNotificationRequest_shouldRepost_deliveredDate_forBundleIdentifier_withCompletionHandler___block_invoke;
      v24[3] = &unk_26462F588;
      id v25 = v15;
      [(UNSUserNotificationServerConnectionListener *)self _saveNotificationRecord:v19 shouldRepost:v10 forBundleIdentifier:v14 withCompletionHandler:v24];
    }
    else if (v15)
    {
      (*((void (**)(id, id))v15 + 2))(v15, v18);
    }
  }
  else if (v15)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E040], OS_LOG_TYPE_ERROR)) {
      -[UNSUserNotificationServerConnectionListener _saveNotificationRequest:shouldRepost:deliveredDate:forBundleIdentifier:withCompletionHandler:]();
    }
    (*((void (**)(id, void))v15 + 2))(v15, 0);
  }
}

uint64_t __141__UNSUserNotificationServerConnectionListener__saveNotificationRequest_shouldRepost_deliveredDate_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (id)_serviceResolvedNotificationRequest:(id)a3 forBundleIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  id v11 = [(UNSAttachmentsService *)self->_attachmentsService resolveAttachmentsForRequest:v8 bundleIdentifier:v9 fromLocalClientConnection:v10 error:a5];
  id v12 = [(_UNNotificationCommunicationContextService *)self->_communicationContextService resolveCommunicationContextForRequest:v11 bundleIdentifier:v9];
  id v13 = (void *)*MEMORY[0x263F1E008];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E008], OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    id v21 = [v8 content];
    id v20 = [v21 communicationContext];
    id v14 = [v12 content];
    id v15 = [v14 communicationContext];
    __int16 v16 = [v12 content];
    uint64_t v17 = [v16 contentType];
    *(_DWORD *)buf = 138544386;
    id v23 = v9;
    __int16 v24 = 1026;
    BOOL v25 = v12 != v11;
    __int16 v26 = 1026;
    BOOL v27 = v20 != 0;
    __int16 v28 = 1026;
    BOOL v29 = v15 != 0;
    __int16 v30 = 2114;
    __int16 v31 = v17;
    _os_log_impl(&dword_22289A000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notification serviced by the communication context service: %{public}d. Has original context: %{public}d. Has serviced context: %{public}d. Type: %{public}@", buf, 0x28u);
  }
  return v12;
}

- (void)_saveNotificationRecord:(id)a3 shouldRepost:(BOOL)a4 forBundleIdentifier:(id)a5 withCompletionHandler:(id)a6
{
  BOOL v8 = a4;
  v25[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([v10 hasPendingTrigger])
  {
    notificationSchedulingService = self->_notificationSchedulingService;
    v25[0] = v10;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __126__UNSUserNotificationServerConnectionListener__saveNotificationRecord_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke;
    v23[3] = &unk_26462F588;
    id v15 = &v24;
    id v24 = v12;
    id v16 = v12;
    [(UNCNotificationSchedulingService *)notificationSchedulingService addPendingNotificationRecords:v14 forBundleIdentifier:v11 withCompletionHandler:v23];
  }
  else
  {
    uint64_t v17 = [v10 date];

    if (!v17)
    {
      id v18 = [MEMORY[0x263EFF910] date];
      [v10 setDate:v18];
    }
    notificationRepository = self->_notificationRepository;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __126__UNSUserNotificationServerConnectionListener__saveNotificationRecord_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke_2;
    v21[3] = &unk_26462FD60;
    id v15 = &v22;
    id v22 = v12;
    id v20 = v12;
    [(UNCNotificationRepository *)notificationRepository saveNotificationRecord:v10 shouldRepost:v8 forBundleIdentifier:v11 withCompletionHandler:v21];
  }
}

uint64_t __126__UNSUserNotificationServerConnectionListener__saveNotificationRecord_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __126__UNSUserNotificationServerConnectionListener__saveNotificationRecord_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setNotificationRequests:(id)a3 forBundleIdentifier:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  id v9 = (void *)*MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    *(_DWORD *)buf = 138543618;
    id v34 = v7;
    __int16 v35 = 2048;
    uint64_t v36 = [v6 count];
    _os_log_impl(&dword_22289A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting %ld notification requests", buf, 0x16u);
  }
  if (objc_msgSend(v8, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v7))
  {
    id v24 = v8;
    [(UNCNotificationRepository *)self->_notificationRepository removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:v7];
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v25 = v6;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          id v27 = 0;
          id v18 = [(UNSUserNotificationServerConnectionListener *)self _serviceResolvedNotificationRequest:v17 forBundleIdentifier:v7 error:&v27];
          id v19 = v27;
          if (v19) {
            BOOL v20 = 1;
          }
          else {
            BOOL v20 = v18 == 0;
          }
          if (v20)
          {
            id v21 = (void *)*MEMORY[0x263F1E010];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR))
            {
              id v22 = v21;
              __int16 v26 = [v19 localizedDescription];
              *(_DWORD *)buf = 138543618;
              id v34 = v7;
              __int16 v35 = 2114;
              uint64_t v36 = (uint64_t)v26;
              _os_log_error_impl(&dword_22289A000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot set notification requests because there are no validated requests. Error: %{public}@", buf, 0x16u);
            }
          }
          else
          {
            [v11 addObject:v18];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v14);
    }

    if ([v11 count])
    {
      id v23 = objc_msgSend(v11, "bs_map:", *MEMORY[0x263F84360]);
      [(UNCNotificationSchedulingService *)self->_notificationSchedulingService setPendingNotificationRecords:v23 forBundleIdentifier:v7];
    }
    BOOL v8 = v24;
    id v6 = v25;
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener setNotificationRequests:forBundleIdentifier:]();
  }
}

- (void)setNotificationRequests:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v9 = a5;
  [(UNSUserNotificationServerConnectionListener *)self setNotificationRequests:a3 forBundleIdentifier:a4];
  BOOL v8 = v9;
  if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
    BOOL v8 = v9;
  }
}

- (void)getPendingNotificationRequestsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__4;
  BOOL v20 = __Block_byref_object_dispose__4;
  id v21 = 0;
  BOOL v8 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  id v9 = (os_log_t *)MEMORY[0x263F1E010];
  id v10 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v6;
    _os_log_impl(&dword_22289A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting pending notification requests", buf, 0xCu);
  }
  if (objc_msgSend(v8, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __119__UNSUserNotificationServerConnectionListener_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_2646300A0;
    block[4] = self;
    id v14 = v6;
    uint64_t v15 = &v16;
    dispatch_sync(queue, block);
  }
  else if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener getPendingNotificationRequestsForBundleIdentifier:withCompletionHandler:]();
  }
  if (v7)
  {
    uint64_t v12 = v17[5];
    if (!v12)
    {
      v17[5] = MEMORY[0x263EFFA68];

      uint64_t v12 = v17[5];
    }
    v7[2](v7, v12);
  }

  _Block_object_dispose(&v16, 8);
}

void __119__UNSUserNotificationServerConnectionListener_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 64) pendingNotificationRecordsForBundleIdentifier:*(void *)(a1 + 40)];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_notificationRequestsForNotificationRecords:bundleIdentifier:", v5, *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removePendingNotificationRequestsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  id v11 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  uint64_t v12 = (os_log_t *)MEMORY[0x263F1E010];
  uint64_t v13 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    id v16 = v9;
    _os_log_impl(&dword_22289A000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing pending notification requests", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v14 = objc_msgSend(v11, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v9);
  if (v14)
  {
    [(UNCNotificationSchedulingService *)self->_notificationSchedulingService removePendingNotificationRecordsWithIdentifiers:v8 forBundleIdentifier:v9 withCompletionHandler:0];
    if (!v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener removePendingNotificationRequestsWithIdentifiers:forBundleIdentifier:completionHandler:]();
    if (!v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v10) {
LABEL_8:
  }
    v10[2](v10, v14, 0);
LABEL_9:
}

- (void)removeSimilarNotificationRequests:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  uint64_t v12 = (os_log_t *)MEMORY[0x263F1E010];
  uint64_t v13 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    id v16 = v9;
    _os_log_impl(&dword_22289A000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing similar notification requests", (uint8_t *)&v15, 0xCu);
  }
  if (!objc_msgSend(v11, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v9))
  {
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
    {
      -[UNSUserNotificationServerConnectionListener removeSimilarNotificationRequests:forBundleIdentifier:completionHandler:]();
      if (!v10) {
        goto LABEL_10;
      }
    }
    else if (!v10)
    {
      goto LABEL_10;
    }
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    goto LABEL_10;
  }
  uint64_t v14 = objc_msgSend(v8, "bs_map:", *MEMORY[0x263F84360]);
  [(UNCNotificationRepository *)self->_notificationRepository removeSimilarNotificationRecords:v14 bundleIdentifier:v9];
  [(UNCNotificationSchedulingService *)self->_notificationSchedulingService removeSimilarPendingNotificationRecords:v14 forBundleIdentifier:v9];
  if (v10) {
    (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1, 0);
  }

LABEL_10:
}

- (void)removeAllPendingNotificationRequestsForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  id v9 = (os_log_t *)MEMORY[0x263F1E010];
  id v10 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_22289A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all pending notification requests", (uint8_t *)&v12, 0xCu);
  }
  uint64_t v11 = objc_msgSend(v8, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6);
  if (v11)
  {
    [(UNCNotificationSchedulingService *)self->_notificationSchedulingService removeAllPendingNotificationRecordsForBundleIdentifier:v6 withCompletionHandler:0];
    if (!v7) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener removeAllPendingNotificationRequestsForBundleIdentifier:completionHandler:]();
    if (!v7) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v7) {
LABEL_8:
  }
    v7[2](v7, v11, 0);
LABEL_9:
}

- (void)getDeliveredNotificationsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__4;
  id v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  id v8 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  id v9 = (os_log_t *)MEMORY[0x263F1E010];
  id v10 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v6;
    _os_log_impl(&dword_22289A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting delivered notifications", buf, 0xCu);
  }
  if (objc_msgSend(v8, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __114__UNSUserNotificationServerConnectionListener_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_2646300A0;
    block[4] = self;
    id v13 = v6;
    uint64_t v14 = &v15;
    dispatch_sync(queue, block);
  }
  else if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener getDeliveredNotificationsForBundleIdentifier:withCompletionHandler:]();
  }
  if (v7) {
    v7[2](v7, v16[5]);
  }

  _Block_object_dispose(&v15, 8);
}

void __114__UNSUserNotificationServerConnectionListener_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 88) notificationRecordsForBundleIdentifier:*(void *)(a1 + 40)];
  uint64_t v2 = objc_msgSend(v6, "bs_filter:", &__block_literal_global_23);
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_queue_notificationsForNotificationRecords:bundleIdentifier:", v2, *(void *)(a1 + 40));
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __114__UNSUserNotificationServerConnectionListener_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 triggerType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F84380]] ^ 1;

  return v3;
}

- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  uint64_t v11 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  int v12 = (os_log_t *)MEMORY[0x263F1E010];
  id v13 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    id v18 = v9;
    _os_log_impl(&dword_22289A000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing delivered notifications", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v14 = objc_msgSend(v11, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v9);
  if (v14)
  {
    if (v8)
    {
      notificationRepository = self->_notificationRepository;
      id v16 = [MEMORY[0x263EFFA08] setWithArray:v8];
      [(UNCNotificationRepository *)notificationRepository removeNotificationRecordsForIdentifiers:v16 bundleIdentifier:v9];

      if (!v10) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener removeDeliveredNotificationsWithIdentifiers:forBundleIdentifier:completionHandler:]();
    if (!v10) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v10) {
LABEL_9:
  }
    v10[2](v10, v14, 0);
LABEL_10:
}

- (void)removeAllDeliveredNotificationsForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  id v8 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  id v9 = (os_log_t *)MEMORY[0x263F1E010];
  id v10 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v6;
    _os_log_impl(&dword_22289A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing all delivered notifications", (uint8_t *)&v12, 0xCu);
  }
  uint64_t v11 = objc_msgSend(v8, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6);
  if (v11)
  {
    [(UNCNotificationRepository *)self->_notificationRepository removeAllNotificationRecordsForBundleIdentifier:v6];
    if (!v7) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener removeAllDeliveredNotificationsForBundleIdentifier:completionHandler:]();
    if (!v7) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (v7) {
LABEL_8:
  }
    v7[2](v7, v11, 0);
LABEL_9:
}

- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  int v12 = (os_log_t *)MEMORY[0x263F1E010];
  id v13 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543618;
    id v15 = v9;
    __int16 v16 = 2114;
    id v17 = v8;
    _os_log_impl(&dword_22289A000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting badge string to %{public}@", (uint8_t *)&v14, 0x16u);
  }
  if (objc_msgSend(v11, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v9))
  {
    [(UNCNotificationRepository *)self->_notificationRepository setBadgeString:v8 forBundleIdentifier:v9 withCompletionHandler:v10];
  }
  else if (os_log_type_enabled(*v12, OS_LOG_TYPE_ERROR))
  {
    -[UNSUserNotificationServerConnectionListener setBadgeString:forBundleIdentifier:withCompletionHandler:]();
  }
}

- (void)getNotificationTopicsForBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v9 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  id v10 = (os_log_t *)MEMORY[0x263F1E010];
  uint64_t v11 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v6;
    _os_log_impl(&dword_22289A000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting topics", buf, 0xCu);
  }
  if (!objc_msgSend(v9, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      -[UNSUserNotificationServerConnectionListener getNotificationTopicsForBundleIdentifier:withCompletionHandler:]();
      if (!v7) {
        goto LABEL_16;
      }
    }
    else if (!v7)
    {
      goto LABEL_16;
    }
LABEL_15:
    id v20 = [MEMORY[0x263EFFA08] setWithArray:v8];
    v7[2](v7, v20);

    goto LABEL_16;
  }
  int v12 = [(UNCNotificationTopicRepository *)self->_topicRepository topicsForBundleIdentifier:v6];
  id v21 = [(UNCLocalizationService *)self->_localizationService bundleWithIdentifier:v6];
  id v13 = (void *)[objc_alloc(MEMORY[0x263F84298]) initWithBundle:v21];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = [v13 notificationTopicForNotificationTopicRecord:*(void *)(*((void *)&v22 + 1) + 8 * v18)];
        [v8 addObject:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  if (v7) {
    goto LABEL_15;
  }
LABEL_16:
}

- (void)isAccessToNotificationCenterAllowedForServiceExtensionWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  if (objc_msgSend(v7, "uns_isAllowedFromDaemon")) {
    uint64_t v8 = [MEMORY[0x263F84270] isAccessToNotificationCenterAllowedForServiceExtensionWithIdentifier:v9];
  }
  else {
    uint64_t v8 = 0;
  }
  v6[2](v6, v8, 0);
}

- (void)getClearedInfoForDataProviderMigrationWithBundleIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = (os_log_t *)MEMORY[0x263F1E010];
  id v9 = *MEMORY[0x263F1E010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_22289A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting cleared info", (uint8_t *)&v15, 0xCu);
  }
  id v10 = [(UNSUserNotificationServerConnectionListener *)self _currentConnection];
  if (objc_msgSend(v10, "uns_isAllowedToRequestUserNotificationsForBundleIdentifier:", v6))
  {
    uint64_t v11 = NSDictionary;
    int v12 = [@"~/Library/BulletinBoard/ClearedSections.plist" stringByExpandingTildeInPath];
    id v13 = [v11 dictionaryWithContentsOfFile:v12];

    id v14 = [v13 objectForKey:v6];

    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
    -[UNSUserNotificationServerConnectionListener getClearedInfoForDataProviderMigrationWithBundleIdentifier:withCompletionHandler:]();
  }
  id v14 = 0;
  if (v7) {
LABEL_9:
  }
    v7[2](v7, v14);
LABEL_10:
}

- (void)_removeConnectionForAllBundleIdentifiers:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __88__UNSUserNotificationServerConnectionListener__removeConnectionForAllBundleIdentifiers___block_invoke;
  v7[3] = &unk_26462F430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __88__UNSUserNotificationServerConnectionListener__removeConnectionForAllBundleIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeConnectionForAllBundleIdentifiers:", *(void *)(a1 + 40));
}

- (id)_queue_notificationsForNotificationRecords:(id)a3 bundleIdentifier:(id)a4
{
  localizationService = self->_localizationService;
  id v7 = a3;
  id v8 = [(UNCLocalizationService *)localizationService bundleWithIdentifier:a4];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F84258]) initWithBundle:v8 categoryRepository:self->_categoryRepository];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __107__UNSUserNotificationServerConnectionListener__queue_notificationsForNotificationRecords_bundleIdentifier___block_invoke;
  v13[3] = &unk_264630130;
  id v14 = v9;
  id v10 = v9;
  uint64_t v11 = objc_msgSend(v7, "bs_map:", v13);

  return v11;
}

uint64_t __107__UNSUserNotificationServerConnectionListener__queue_notificationsForNotificationRecords_bundleIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notificationForNotificationRecord:a2];
}

- (id)_queue_notificationRequestsForNotificationRecords:(id)a3 bundleIdentifier:(id)a4
{
  localizationService = self->_localizationService;
  id v7 = a3;
  id v8 = [(UNCLocalizationService *)localizationService bundleWithIdentifier:a4];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F84258]) initWithBundle:v8 categoryRepository:self->_categoryRepository];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __114__UNSUserNotificationServerConnectionListener__queue_notificationRequestsForNotificationRecords_bundleIdentifier___block_invoke;
  v13[3] = &unk_264630130;
  id v14 = v9;
  id v10 = v9;
  uint64_t v11 = objc_msgSend(v7, "bs_map:", v13);

  return v11;
}

uint64_t __114__UNSUserNotificationServerConnectionListener__queue_notificationRequestsForNotificationRecords_bundleIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notificationRequestForNotificationRecord:a2];
}

- (void)_queue_addConnection:(id)a3 forBundleIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_connectionsByBundleIdentifier objectForKey:v6];
  if (!v7)
  {
    id v7 = [MEMORY[0x263EFF9C0] set];
    [(NSMutableDictionary *)self->_connectionsByBundleIdentifier setObject:v7 forKey:v6];
  }
  [v7 addObject:v9];
  id v8 = [(NSMapTable *)self->_bundleIdentifiersByConnection objectForKey:v9];
  if (!v8)
  {
    id v8 = [MEMORY[0x263EFF9C0] set];
    [(NSMapTable *)self->_bundleIdentifiersByConnection setObject:v8 forKey:v9];
  }
  [v8 addObject:v6];
}

- (void)_queue_removeConnection:(id)a3 forBundleIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_connectionsByBundleIdentifier objectForKey:v6];
  [v7 removeObject:v9];
  if (![v7 count]) {
    [(NSMutableDictionary *)self->_connectionsByBundleIdentifier removeObjectForKey:v6];
  }
  id v8 = [(NSMapTable *)self->_bundleIdentifiersByConnection objectForKey:v9];
  [v8 removeObject:v6];
  if (![v8 count]) {
    [(NSMapTable *)self->_bundleIdentifiersByConnection removeObjectForKey:v9];
  }
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
        -[UNSUserNotificationServerConnectionListener _queue_removeConnection:forBundleIdentifier:](self, "_queue_removeConnection:forBundleIdentifier:", v4, *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)_queue_delegateConnectionForBundleIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSMutableDictionary *)self->_connectionsByBundleIdentifier objectForKey:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "processIdentifier", (void)v12);
        uint64_t v10 = BSBundleIDForPID();
        if ([v4 isEqualToString:v10])
        {
          id v6 = v9;

          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communicationContextService, 0);
  objc_storeStrong((id *)&self->_locationMonitor, 0);
  objc_storeStrong((id *)&self->_attachmentsService, 0);
  objc_storeStrong((id *)&self->_remoteNotificationService, 0);
  objc_storeStrong((id *)&self->_remoteNotificationConnectionListener, 0);
  objc_storeStrong((id *)&self->_topicRepository, 0);
  objc_storeStrong((id *)&self->_notificationRepository, 0);
  objc_storeStrong((id *)&self->_notificationSettingsService, 0);
  objc_storeStrong((id *)&self->_notificationsAuthorizationService, 0);
  objc_storeStrong((id *)&self->_notificationSchedulingService, 0);
  objc_storeStrong((id *)&self->_categoryRepository, 0);
  objc_storeStrong((id *)&self->_localizationService, 0);
  objc_storeStrong((id *)&self->_applicationLauncher, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersByConnection, 0);
  objc_storeStrong((id *)&self->_connectionsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)requestAuthorizationWithOptions:forBundleIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Requesting authorization failed because bundle identifier does not match a known application or bundle", v2, v3, v4, v5, v6);
}

- (void)requestAuthorizationWithOptions:forBundleIdentifier:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Requesting authorization failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)requestRemoveAuthorizationForBundleIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Requesting remove authorization failed because bundle identifier does not match a known application or bundle", v2, v3, v4, v5, v6);
}

- (void)requestRemoveAuthorizationForBundleIdentifier:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Requesting remove authorization failed because client is not internal user notifications tool", v2, v3, v4, v5, v6);
}

- (void)getNotificationSettingsForBundleIdentifier:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Getting notification settings failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)getNotificationCategoriesForBundleIdentifier:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Getting notification categories failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)setNotificationCategories:forBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Setting notification categories failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)addNotificationRequest:forBundleIdentifier:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Adding notification request failed because of disallowed userInfo", v2, v3, v4, v5, v6);
}

- (void)addNotificationRequest:forBundleIdentifier:withCompletionHandler:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Adding notification request failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)replaceContentForRequestWithIdentifier:bundleIdentifier:replacementContent:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Replacing notification content failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)_saveNotificationRequest:shouldRepost:deliveredDate:forBundleIdentifier:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "Attempted to add notification request with invalid identifier for bundle '%{public}@'", v2, v3, v4, v5, v6);
}

- (void)setNotificationRequests:forBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Setting notification requests failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)getPendingNotificationRequestsForBundleIdentifier:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Getting pending notification requests failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)removePendingNotificationRequestsWithIdentifiers:forBundleIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Removing pending notification requests failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)removeSimilarNotificationRequests:forBundleIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Removing similar notification requests failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)removeAllPendingNotificationRequestsForBundleIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Removing all pending notification requests failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)getDeliveredNotificationsForBundleIdentifier:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Getting delivered notifications failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)removeDeliveredNotificationsWithIdentifiers:forBundleIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Removing delivered notifications failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)removeAllDeliveredNotificationsForBundleIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Removing all delivered notifications failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)getBadgeNumberForBundleIdentifier:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Getting badge number failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)setBadgeNumber:forBundleIdentifier:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Setting badge number failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)setBadgeCount:forBundleIdentifier:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Setting badge count failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)setBadgeString:forBundleIdentifier:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Setting badge string failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)setNotificationTopics:forBundleIdentifier:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Setting topics failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)getNotificationTopicsForBundleIdentifier:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Getting notification topics failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)getNotificationSettingsForTopicsWithBundleIdentifier:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Getting notification settings for topics failed because of missing entitlement", v2, v3, v4, v5, v6);
}

- (void)setConnectionDetails:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22289A000, log, OS_LOG_TYPE_ERROR, "Failed to set connection details", v1, 2u);
}

- (void)getClearedInfoForDataProviderMigrationWithBundleIdentifier:withCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_22289A000, v0, v1, "[%{public}@] Getting cleared info for topic failed because of missing entitlement", v2, v3, v4, v5, v6);
}

@end