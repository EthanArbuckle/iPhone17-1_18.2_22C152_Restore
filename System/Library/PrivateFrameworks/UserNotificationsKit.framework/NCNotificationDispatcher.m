@interface NCNotificationDispatcher
- (BOOL)_isRegisteredDestination:(id)a3;
- (BOOL)_shouldPostNotificationRequest:(id)a3;
- (NCAlertingController)alertingController;
- (NCLayoutLoopDetector)layoutDetector;
- (NCNotificationAlertQueue)alertQueue;
- (NCNotificationDestinationsRegistry)destinationsRegistry;
- (NCNotificationDispatcher)init;
- (NCNotificationDispatcher)initWithAlertingController:(id)a3;
- (NCNotificationDispatcherDelegate)delegate;
- (NCNotificationSystemSettings)notificationSystemSettings;
- (NSHashTable)sourceDelegates;
- (NSMutableDictionary)sectionSettings;
- (id)destination:(id)a3 notificationRequestForUUID:(id)a4;
- (id)notificationSectionSettingsForDestination:(id)a3;
- (id)notificationSectionSettingsForDestination:(id)a3 forSectionIdentifier:(id)a4;
- (void)_clearUnsafeNotification:(id)a3;
- (void)_didPostNotificationRequest:(id)a3;
- (void)_didRemoveNotificationRequest:(id)a3;
- (void)_notifyDidExecuteAction:(id)a3 forNotificationRequest:(id)a4;
- (void)_performOperationForRequestDestinations:(id)a3 block:(id)a4;
- (void)_registerAlertDestination:(id)a3;
- (void)_registerDestination:(id)a3;
- (void)_willPostNotificationRequest:(id)a3;
- (void)addDispatcherSourceDelegate:(id)a3;
- (void)destination:(id)a3 didDismissNotificationRequest:(id)a4;
- (void)destination:(id)a3 didPresentNotificationRequest:(id)a4;
- (void)destination:(id)a3 executeAction:(id)a4 forNotificationRequest:(id)a5 requestAuthentication:(BOOL)a6 withParameters:(id)a7 completion:(id)a8;
- (void)destination:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotificationRequest:(id)a5 withParameters:(id)a6 completion:(id)a7;
- (void)destination:(id)a3 requestsClearingNotificationRequests:(id)a4;
- (void)destination:(id)a3 requestsClearingNotificationRequests:(id)a4 fromDestinations:(id)a5;
- (void)destination:(id)a3 requestsClearingNotificationRequestsFromDate:(id)a4 toDate:(id)a5 inSections:(id)a6;
- (void)destination:(id)a3 requestsClearingNotificationRequestsInSections:(id)a4;
- (void)destination:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)destination:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)destination:(id)a3 setAllowsNotifications:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)destination:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)destination:(id)a3 setDeliverQuietly:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)destination:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7;
- (void)destination:(id)a3 setNotificationSystemSettings:(id)a4;
- (void)destination:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)destination:(id)a3 setSystemScheduledDeliveryEnabled:(BOOL)a4 scheduledDeliveryTimes:(id)a5;
- (void)destination:(id)a3 willPresentNotificationRequest:(id)a4;
- (void)destination:(id)a3 willPresentNotificationRequest:(id)a4 suppressAlerts:(BOOL)a5;
- (void)modifyNotificationWithRequest:(id)a3;
- (void)notificationsLoadedForSectionIdentifier:(id)a3;
- (void)postNotificationWithRequest:(id)a3;
- (void)registerDestination:(id)a3;
- (void)removeDispatcherSourceDelegate:(id)a3;
- (void)removeNotificationSectionWithIdentifier:(id)a3;
- (void)setAlertQueue:(id)a3;
- (void)setAlertingController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestination:(id)a3 enabled:(BOOL)a4;
- (void)setDestinationsRegistry:(id)a3;
- (void)setLayoutDetector:(id)a3;
- (void)setNotificationSystemSettings:(id)a3;
- (void)setSectionSettings:(id)a3;
- (void)setSourceDelegates:(id)a3;
- (void)unregisterDestination:(id)a3;
- (void)updateNotificationSectionSettings:(id)a3;
- (void)updateNotificationSystemSettings:(id)a3;
- (void)withdrawNotificationWithRequest:(id)a3;
@end

@implementation NCNotificationDispatcher

- (void)updateNotificationSectionSettings:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  v5 = [v4 sectionIdentifier];
  if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEBUG)) {
    -[NCNotificationDispatcher updateNotificationSectionSettings:]();
  }
  v6 = [(NCNotificationDispatcher *)self sectionSettings];
  v7 = [v6 objectForKey:v5];

  v8 = [(NCNotificationDispatcher *)self sectionSettings];
  [v8 setObject:v4 forKey:v5];

  v9 = [(NCNotificationDispatcher *)self destinationsRegistry];
  v10 = [v9 registeredDestinations];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = v10;
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
        v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v16, "updateNotificationSectionSettings:previousSectionSettings:", v4, v7, (void)v17);
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (NSMutableDictionary)sectionSettings
{
  return self->_sectionSettings;
}

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEBUG)) {
    -[NCNotificationDispatcher notificationsLoadedForSectionIdentifier:]();
  }
  v5 = [(NCNotificationDispatcher *)self destinationsRegistry];
  v6 = [v5 registeredDestinations];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "notificationsLoadedForSectionIdentifier:", v4, (void)v13);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (NCNotificationDestinationsRegistry)destinationsRegistry
{
  return self->_destinationsRegistry;
}

- (NCNotificationDispatcher)init
{
  return 0;
}

- (NCNotificationDispatcher)initWithAlertingController:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NCNotificationDispatcher;
  v6 = [(NCNotificationDispatcher *)&v19 init];
  if (v6)
  {
    NCRegisterUserNotificationsUILogging();
    id v7 = NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v6;
      _os_log_impl(&dword_22012C000, v7, OS_LOG_TYPE_DEFAULT, "Initializing notifications dispatcher %{public}@", buf, 0xCu);
    }
    uint64_t v8 = objc_opt_new();
    destinationsRegistry = v6->_destinationsRegistry;
    v6->_destinationsRegistry = (NCNotificationDestinationsRegistry *)v8;

    uint64_t v10 = objc_opt_new();
    sectionSettings = v6->_sectionSettings;
    v6->_sectionSettings = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    sourceDelegates = v6->_sourceDelegates;
    v6->_sourceDelegates = (NSHashTable *)v12;

    long long v14 = objc_alloc_init(NCLayoutLoopDetector);
    layoutDetector = v6->_layoutDetector;
    v6->_layoutDetector = v14;

    objc_storeStrong((id *)&v6->_alertingController, a3);
    long long v16 = objc_alloc_init(NCNotificationAlertQueue);
    alertQueue = v6->_alertQueue;
    v6->_alertQueue = v16;

    [(NCNotificationAlertQueue *)v6->_alertQueue setDelegate:v6];
  }

  return v6;
}

- (void)postNotificationWithRequest:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_22012C000, "post-notification", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  v6 = (id)NCUILogDispatch;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 loggingDescription];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_22012C000, v6, OS_LOG_TYPE_DEFAULT, "Posting notification %{public}@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v8 = [(NCNotificationDispatcher *)self destinationsRegistry];
  uint64_t v9 = [v4 requestDestinations];
  uint64_t v10 = [v8 destinationIdentifiersForRequestDestinations:v9];

  uint64_t v11 = [(NCNotificationDispatcher *)self alertingController];
  [v11 alertOnPostForNotificationRequest:v4 forRequestDestinations:v10];

  if ([(NCNotificationDispatcher *)self _shouldPostNotificationRequest:v4])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    [(NCNotificationDispatcher *)self _willPostNotificationRequest:v4];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __56__NCNotificationDispatcher_postNotificationWithRequest___block_invoke;
    v26[3] = &unk_26455A018;
    v26[4] = self;
    id v12 = v4;
    id v27 = v12;
    p_long long buf = &buf;
    [(NCNotificationDispatcher *)self _performOperationForRequestDestinations:v12 block:v26];
    [(NCNotificationDispatcher *)self _didPostNotificationRequest:v12];
    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      long long v13 = (id)NCUILogDispatch;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        long long v14 = [v12 notificationIdentifier];
        long long v15 = objc_msgSend(v14, "un_logDigest");
        *(_DWORD *)v30 = 138543362;
        v31 = v15;
        _os_log_impl(&dword_22012C000, v13, OS_LOG_TYPE_DEFAULT, "Not rolling banner for notification %{public}@; CoverSheet is active",
          v30,
          0xCu);
      }
    }
    else
    {
      objc_super v19 = [(NCNotificationDispatcher *)self destinationsRegistry];
      long long v20 = [v12 requestDestinations];
      long long v13 = [v19 destinationsForRequestDestinations:v20];

      v21 = [(NCNotificationDispatcher *)self alertQueue];
      LODWORD(v20) = [v13 containsObject:v21];

      if (v20)
      {
        uint64_t v22 = (id)NCUILogDispatch;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = [v12 notificationIdentifier];
          v24 = objc_msgSend(v23, "un_logDigest");
          *(_DWORD *)v30 = 138543362;
          v31 = v24;
          _os_log_impl(&dword_22012C000, v22, OS_LOG_TYPE_DEFAULT, "Rolling banner for notification %{public}@", v30, 0xCu);
        }
        v25 = [(NCNotificationDispatcher *)self alertQueue];
        [v25 postNotificationRequest:v12];
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    long long v16 = (id)NCUILogDispatch;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      long long v17 = [v4 notificationIdentifier];
      uint64_t v18 = objc_msgSend(v17, "un_logDigest");
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_22012C000, v16, OS_LOG_TYPE_DEFAULT, "Not posting notification %{public}@ because it was marked as unsafe", (uint8_t *)&buf, 0xCu);
    }
    [(NCNotificationDispatcher *)self _clearUnsafeNotification:v4];
  }

  os_activity_scope_leave(&state);
}

void __56__NCNotificationDispatcher_postNotificationWithRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) alertQueue];
  char v5 = [v3 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    v6 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 40);
      uint64_t v8 = v6;
      uint64_t v9 = [v7 notificationIdentifier];
      uint64_t v10 = objc_msgSend(v9, "un_logDigest");
      uint64_t v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      int v14 = 138543618;
      long long v15 = v10;
      __int16 v16 = 2114;
      long long v17 = v12;
      _os_log_impl(&dword_22012C000, v8, OS_LOG_TYPE_DEFAULT, "Posting notification %{public}@ to destination %{public}@", (uint8_t *)&v14, 0x16u);
    }
    [v3 postNotificationRequest:*(void *)(a1 + 40)];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      char v13 = 1;
    }
    else if (objc_opt_respondsToSelector())
    {
      char v13 = [v3 interceptsQueueRequest:*(void *)(a1 + 40)];
    }
    else
    {
      char v13 = 0;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v13;
  }
}

- (void)modifyNotificationWithRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  char v5 = _os_activity_create(&dword_22012C000, "modify-notification", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  v6 = (id)NCUILogDispatch;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 loggingDescription];
    *(_DWORD *)long long buf = 138543362;
    __int16 v16 = v7;
    _os_log_impl(&dword_22012C000, v6, OS_LOG_TYPE_DEFAULT, "Modify notification %{public}@", buf, 0xCu);
  }
  if ([(NCNotificationDispatcher *)self _shouldPostNotificationRequest:v4])
  {
    [(NCNotificationDispatcher *)self _willPostNotificationRequest:v4];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__NCNotificationDispatcher_modifyNotificationWithRequest___block_invoke;
    v12[3] = &unk_26455A040;
    id v8 = v4;
    id v13 = v8;
    [(NCNotificationDispatcher *)self _performOperationForRequestDestinations:v8 block:v12];
    [(NCNotificationDispatcher *)self _didPostNotificationRequest:v8];
  }
  else
  {
    uint64_t v9 = (id)NCUILogDispatch;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [v4 notificationIdentifier];
      uint64_t v11 = objc_msgSend(v10, "un_logDigest");
      *(_DWORD *)long long buf = 138543362;
      __int16 v16 = v11;
      _os_log_impl(&dword_22012C000, v9, OS_LOG_TYPE_DEFAULT, "Not modifying notification notification %{public}@ because it was marked as unsafe", buf, 0xCu);
    }
    [(NCNotificationDispatcher *)self _clearUnsafeNotification:v4];
  }
  os_activity_scope_leave(&state);
}

void __58__NCNotificationDispatcher_modifyNotificationWithRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)NCUILogDispatch;
  if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = *(void **)(a1 + 32);
    v6 = v4;
    id v7 = [v5 notificationIdentifier];
    id v8 = objc_msgSend(v7, "un_logDigest");
    uint64_t v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 2114;
    int v14 = v10;
    _os_log_impl(&dword_22012C000, v6, OS_LOG_TYPE_DEFAULT, "Modifying notification %{public}@ in destination %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [v3 modifyNotificationRequest:*(void *)(a1 + 32)];
}

- (void)withdrawNotificationWithRequest:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  char v5 = _os_activity_create(&dword_22012C000, "withdraw-notification", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  v6 = (id)NCUILogDispatch;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 loggingDescription];
    *(_DWORD *)long long buf = 138543362;
    id v27 = v7;
    _os_log_impl(&dword_22012C000, v6, OS_LOG_TYPE_DEFAULT, "Withdraw notification %{public}@", buf, 0xCu);
  }
  id v8 = [MEMORY[0x263EFF9C0] set];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  v21 = __60__NCNotificationDispatcher_withdrawNotificationWithRequest___block_invoke;
  uint64_t v22 = &unk_26455A068;
  id v9 = v4;
  id v23 = v9;
  id v10 = v8;
  id v24 = v10;
  [(NCNotificationDispatcher *)self _performOperationForRequestDestinations:v9 block:&v19];
  int v11 = [(NCNotificationDispatcher *)self destinationsRegistry];
  id v12 = [v9 requestDestinations];
  __int16 v13 = [v11 destinationsForRequestDestinations:v12];

  if (![v10 count])
  {
    uint64_t v15 = [v9 requestDestinations];
    BOOL v16 = [v15 count] == 0;

    if (!v16)
    {
      int v14 = (id)NCUILogDispatch;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [v9 notificationIdentifier];
        uint64_t v18 = objc_msgSend(v17, "un_logDigest");
        -[NCNotificationDispatcher withdrawNotificationWithRequest:](v18, buf, v14, v17);
      }
      goto LABEL_9;
    }
  }
  if ([v10 isEqualToSet:v13])
  {
    int v14 = [(NCNotificationDispatcher *)self alertingController];
    [v14 killAlertsForNotificationRequest:v9];
LABEL_9:
  }
  [(NCNotificationDispatcher *)self _didRemoveNotificationRequest:v9];

  os_activity_scope_leave(&state);
}

void __60__NCNotificationDispatcher_withdrawNotificationWithRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)NCUILogDispatch;
  if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = *(void **)(a1 + 32);
    v6 = v4;
    id v7 = [v5 notificationIdentifier];
    id v8 = objc_msgSend(v7, "un_logDigest");
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 2114;
    int v14 = v10;
    _os_log_impl(&dword_22012C000, v6, OS_LOG_TYPE_DEFAULT, "Withdrawing notification %{public}@ from destination %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [v3 withdrawNotificationRequest:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) addObject:v3];
}

- (void)updateNotificationSystemSettings:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BSDispatchQueueAssertMain();
  char v5 = [(NCNotificationDispatcher *)self notificationSystemSettings];
  [(NCNotificationDispatcher *)self setNotificationSystemSettings:v4];
  v6 = NCUILogDispatch;
  if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v21 = v4;
    _os_log_impl(&dword_22012C000, v6, OS_LOG_TYPE_DEFAULT, "Posting updated system settings %@", buf, 0xCu);
  }
  id v7 = [(NCNotificationDispatcher *)self destinationsRegistry];
  id v8 = [v7 registeredDestinations];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v14, "updateNotificationSystemSettings:previousSystemSettings:", v4, v5, (void)v15);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)removeNotificationSectionWithIdentifier:(id)a3
{
  id v4 = a3;
  BSDispatchQueueAssertMain();
  if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEBUG)) {
    -[NCNotificationDispatcher removeNotificationSectionWithIdentifier:]();
  }
  char v5 = [(NCNotificationDispatcher *)self sectionSettings];
  [v5 removeObjectForKey:v4];
}

- (void)registerDestination:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(NCNotificationDispatcher *)self _isRegisteredDestination:v4]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    char v5 = [(NCNotificationDispatcher *)self sectionSettings];
    v6 = [v5 allValues];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [v4 updateNotificationSectionSettings:*(void *)(*((void *)&v11 + 1) + 8 * v10++) previousSectionSettings:0];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 isAlertDestination]) {
    [(NCNotificationDispatcher *)self _registerAlertDestination:v4];
  }
  else {
    [(NCNotificationDispatcher *)self _registerDestination:v4];
  }
}

- (void)unregisterDestination:(id)a3
{
  id v4 = a3;
  char v5 = [(NCNotificationDispatcher *)self alertQueue];
  [v5 unregisterDestination:v4];

  id v6 = [(NCNotificationDispatcher *)self destinationsRegistry];
  [v6 unregisterDestination:v4];
}

- (void)setDestination:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v8 isAlertDestination])
  {
    id v6 = [(NCNotificationDispatcher *)self alertQueue];
  }
  else
  {
    id v6 = [(NCNotificationDispatcher *)self destinationsRegistry];
  }
  uint64_t v7 = v6;
  [v6 setDestination:v8 enabled:v4];
}

- (void)_registerDestination:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(NCNotificationDispatcher *)self destinationsRegistry];
  [v4 registerDestination:v5];

  [v5 setDelegate:self];
}

- (void)_registerAlertDestination:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationDispatcher *)self alertQueue];
  [v5 registerDestination:v4];

  id v9 = [v4 identifier];

  id v6 = [(NCNotificationDispatcher *)self destinationsRegistry];
  uint64_t v7 = [(NCNotificationDispatcher *)self alertQueue];
  [v6 registerDestination:v7 forIdentifier:v9];

  id v8 = [(NCNotificationDispatcher *)self destinationsRegistry];
  [v8 setDestinationWithIdentifier:v9 enabled:1];
}

- (BOOL)_isRegisteredDestination:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v4 isAlertDestination])
  {
    id v5 = [(NCNotificationDispatcher *)self alertQueue];
  }
  else
  {
    id v5 = [(NCNotificationDispatcher *)self destinationsRegistry];
  }
  id v6 = v5;
  char v7 = [v5 isRegisteredDestination:v4];

  return v7;
}

- (void)addDispatcherSourceDelegate:(id)a3
{
}

- (void)removeDispatcherSourceDelegate:(id)a3
{
}

- (void)destination:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotificationRequest:(id)a5 withParameters:(id)a6 completion:(id)a7
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  long long v15 = (__CFString *)a6;
  uint64_t v16 = (void (**)(id, uint64_t))a7;
  char v17 = [v13 isSiriAction];
  long long v18 = [(NCNotificationDispatcher *)self delegate];
  if (!v18 || (v17 & 1) != 0)
  {
    v16[2](v16, 1);
  }
  else
  {
    uint64_t v19 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      log = v19;
      id v24 = [v13 identifier];
      uint64_t v20 = [v14 notificationIdentifier];
      id v21 = objc_msgSend(v20, "un_logDigest");
      uint64_t v22 = [(__CFString *)v15 count];
      id v23 = @"{}";
      *(_DWORD *)long long buf = 138543875;
      id v27 = v24;
      if (v22) {
        id v23 = v15;
      }
      __int16 v28 = 2114;
      v29 = v21;
      __int16 v30 = 2113;
      v31 = v23;
      _os_log_impl(&dword_22012C000, log, OS_LOG_TYPE_DEFAULT, "Dispatcher will request permission to execute action %{public}@ for notification %{public}@ with parameters %{private}@", buf, 0x20u);
    }
    [v18 dispatcher:self requestPermissionToExecuteAction:v13 forDestination:v12 notificationRequest:v14 withParameters:v15 completionBlock:v16];
  }
}

- (void)destination:(id)a3 executeAction:(id)a4 forNotificationRequest:(id)a5 requestAuthentication:(BOOL)a6 withParameters:(id)a7 completion:(id)a8
{
  BOOL v10 = a6;
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  char v17 = (__CFString *)a7;
  id v18 = a8;
  uint64_t v19 = [(NCNotificationDispatcher *)self delegate];
  uint64_t v20 = (void *)v19;
  if (v19)
  {
    v44 = (void *)v19;
    v45 = v18;
    BOOL v46 = v10;
    id v21 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = v21;
      id v23 = [v15 identifier];
      [v16 notificationIdentifier];
      id v24 = v43 = v14;
      v25 = objc_msgSend(v24, "un_logDigest");
      uint64_t v26 = [(__CFString *)v17 count];
      id v27 = @"{}";
      *(_DWORD *)long long buf = 138543875;
      v55 = v23;
      if (v26) {
        id v27 = v17;
      }
      __int16 v56 = 2114;
      v57 = v25;
      __int16 v58 = 2113;
      v59 = v27;
      _os_log_impl(&dword_22012C000, v22, OS_LOG_TYPE_DEFAULT, "Dispatcher will execute action %{public}@ for notification %{public}@ with parameters %{private}@", buf, 0x20u);

      id v14 = v43;
    }
    __int16 v28 = self;
    v29 = v15;
    if ([v15 isSiriAction])
    {
      __int16 v30 = (void *)NCUILogDispatch;
      BOOL v46 = 0;
      if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        uint64_t v32 = [v29 identifier];
        [v16 notificationIdentifier];
        v34 = id v33 = v14;
        uint64_t v35 = objc_msgSend(v34, "un_logDigest");
        uint64_t v36 = [(__CFString *)v17 count];
        v37 = @"{}";
        *(_DWORD *)long long buf = 138543875;
        v55 = v32;
        if (v36) {
          v37 = v17;
        }
        __int16 v56 = 2114;
        v57 = v35;
        __int16 v58 = 2113;
        v59 = v37;
        _os_log_impl(&dword_22012C000, v31, OS_LOG_TYPE_DEFAULT, "Action can be run with Siri. Dispatcher is bypassing lockscreen authentication. Action %{public}@ for notification %{public}@ with parameters %{private}@", buf, 0x20u);

        id v14 = v33;
        BOOL v46 = 0;
      }
    }
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __125__NCNotificationDispatcher_destination_executeAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke;
    v47[3] = &unk_26455A108;
    id v48 = v14;
    id v38 = v29;
    v39 = v29;
    v40 = v16;
    id v41 = v38;
    id v49 = v38;
    v50 = v17;
    id v18 = v45;
    id v53 = v45;
    v51 = v28;
    id v52 = v40;
    uint64_t v20 = v44;
    id v42 = v41;
    id v16 = v40;
    [v44 dispatcher:v28 willExecuteAction:v42 forDestination:v48 notificationRequest:v52 requestAuthentication:v46 withParameters:v50 completionBlock:v47];

    id v15 = v39;
  }
}

void __125__NCNotificationDispatcher_destination_executeAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke(id *a1, int a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = [a1[4] identifier];
    id v4 = [a1[4] endpoint];
    id v5 = (id)NCUILogDispatch;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [a1[5] identifier];
      char v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      if ([a1[6] count]) {
        id v9 = (__CFString *)a1[6];
      }
      else {
        id v9 = @"{}";
      }
      *(_DWORD *)long long buf = 138543875;
      v29 = v6;
      __int16 v30 = 2114;
      v31 = v8;
      __int16 v32 = 2113;
      id v33 = v9;
      _os_log_impl(&dword_22012C000, v5, OS_LOG_TYPE_DEFAULT, "Dispatcher executing action %{public}@ from destination %{public}@ with parameters %{private}@", buf, 0x20u);
    }
    char v17 = [a1[5] actionRunner];

    if (v17)
    {
      id v18 = [a1[5] actionRunner];
      id v19 = a1[5];
      id v20 = a1[6];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __125__NCNotificationDispatcher_destination_executeAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke_75;
      v26[3] = &unk_26455A0B8;
      id v21 = &v27;
      id v27 = a1[9];
      [v18 executeAction:v19 fromOrigin:v3 endpoint:v4 withParameters:v20 completion:v26];
    }
    else
    {
      uint64_t v22 = (void *)NCUILogDispatch;
      if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_ERROR)) {
        __125__NCNotificationDispatcher_destination_executeAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke_cold_1(a1 + 5, v22);
      }
      id v23 = a1[9];
      if (!v23) {
        goto LABEL_18;
      }
      id v21 = &v25;
      id v25 = v23;
      BSDispatchMain();
    }

LABEL_18:
    [a1[7] _notifyDidExecuteAction:a1[5] forNotificationRequest:a1[8]];

    goto LABEL_19;
  }
  BOOL v10 = (void *)NCUILogDispatch;
  if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = a1[5];
    id v12 = v10;
    id v13 = [v11 identifier];
    id v14 = [a1[8] notificationIdentifier];
    id v15 = objc_msgSend(v14, "un_logDigest");
    *(_DWORD *)long long buf = 138543618;
    v29 = v13;
    __int16 v30 = 2114;
    v31 = v15;
    _os_log_impl(&dword_22012C000, v12, OS_LOG_TYPE_DEFAULT, "Dispatcher delegate prevented execution of action %{public}@ for notification %{public}@", buf, 0x16u);
  }
  id v16 = a1[9];
  if (v16)
  {
    id v24 = v16;
    BSDispatchMain();
    id v3 = v24;
LABEL_19:
  }
}

void __125__NCNotificationDispatcher_destination_executeAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke_75(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    id v2 = v1;
    BSDispatchMain();
  }
}

uint64_t __125__NCNotificationDispatcher_destination_executeAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __125__NCNotificationDispatcher_destination_executeAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke_78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __125__NCNotificationDispatcher_destination_executeAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke_79(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)notificationSectionSettingsForDestination:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [(NCNotificationDispatcher *)self sectionSettings];
  id v5 = [v4 allValues];
  id v6 = [v3 setWithArray:v5];
  char v7 = (void *)[v6 copy];

  return v7;
}

- (id)notificationSectionSettingsForDestination:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(NCNotificationDispatcher *)self sectionSettings];
  char v7 = [v6 objectForKey:v5];

  return v7;
}

- (void)destination:(id)a3 requestsClearingNotificationRequests:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_sourceDelegates;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "dispatcher:requestsClearingNotificationRequests:", self, v5, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)destination:(id)a3 requestsClearingNotificationRequests:(id)a4 fromDestinations:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = self->_sourceDelegates;
  uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "dispatcher:requestsClearingNotificationRequests:fromDestinations:", self, v7, v8, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)destination:(id)a3 requestsClearingNotificationRequestsInSections:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_sourceDelegates;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "dispatcher:requestsClearingNotificationRequestsInSections:", self, v5, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)destination:(id)a3 requestsClearingNotificationRequestsFromDate:(id)a4 toDate:(id)a5 inSections:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = self->_sourceDelegates;
  uint64_t v13 = [(NSHashTable *)v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "dispatcher:requestsClearingNotificationRequestsFromDate:toDate:inSections:", self, v9, v10, v11, (void)v17);
      }
      while (v14 != v16);
      uint64_t v14 = [(NSHashTable *)v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (void)destination:(id)a3 setAllowsNotifications:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a5;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_sourceDelegates;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "dispatcher:setAllowsNotifications:forSectionIdentifier:", self, v5, v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)destination:(id)a3 setDeliverQuietly:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a5;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_sourceDelegates;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "dispatcher:setDeliverQuietly:forSectionIdentifier:", self, v5, v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)destination:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  BOOL v9 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v14 = self->_sourceDelegates;
  uint64_t v15 = [(NSHashTable *)v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v20;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "dispatcher:setMuted:untilDate:forSectionIdentifier:threadIdentifier:", self, v9, v11, v12, v13, (void)v19);
      }
      while (v16 != v18);
      uint64_t v16 = [(NSHashTable *)v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v16);
  }
}

- (void)destination:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a5;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_sourceDelegates;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "dispatcher:setAllowsCriticalAlerts:forSectionIdentifier:", self, v5, v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)destination:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a5;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_sourceDelegates;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "dispatcher:setAllowsTimeSensitive:forSectionIdentifier:", self, v5, v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)destination:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a5;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_sourceDelegates;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "dispatcher:setAllowsDirectMessages:forSectionIdentifier:", self, v5, v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)destination:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a5;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_sourceDelegates;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "dispatcher:setScheduledDelivery:forSectionIdentifier:", self, v5, v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)destination:(id)a3 setSystemScheduledDeliveryEnabled:(BOOL)a4 scheduledDeliveryTimes:(id)a5
{
  BOOL v5 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a5;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_sourceDelegates;
  uint64_t v9 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "dispatcher:setSystemScheduledDeliveryEnabled:scheduledDeliveryTimes:", self, v5, v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(NSHashTable *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (id)destination:(id)a3 notificationRequestForUUID:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_sourceDelegates;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      uint64_t v12 = v9;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "dispatcher:notificationRequestForUUID:", self, v5, (void)v14);

        ++v11;
        uint64_t v12 = v9;
      }
      while (v8 != v11);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)destination:(id)a3 setNotificationSystemSettings:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = self->_sourceDelegates;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "dispatcher:setNotificationSystemSettings:", self, v5, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)destination:(id)a3 willPresentNotificationRequest:(id)a4
{
}

- (void)destination:(id)a3 willPresentNotificationRequest:(id)a4 suppressAlerts:(BOOL)a5
{
  if (!a5)
  {
    id v8 = a4;
    id v9 = a3;
    id v11 = [(NCNotificationDispatcher *)self alertingController];
    uint64_t v10 = [v9 identifier];

    [v11 alertOnPresentationForNotificationRequest:v8 presentingDestination:v10];
  }
}

- (void)destination:(id)a3 didPresentNotificationRequest:(id)a4
{
  id v5 = a4;
  id v6 = [(NCNotificationDispatcher *)self alertingController];
  [v6 resetAutomaticLockStateForNotificationRequest:v5];
}

- (void)destination:(id)a3 didDismissNotificationRequest:(id)a4
{
  id v5 = a4;
  id v6 = [(NCNotificationDispatcher *)self alertingController];
  [v6 killAlertsForNotificationRequest:v5];

  id v7 = [(NCNotificationDispatcher *)self alertingController];
  [v7 resetAutomaticLockStateForNotificationRequest:v5];
}

- (void)_performOperationForRequestDestinations:(id)a3 block:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = objc_opt_new();
  id v9 = [(NCNotificationDispatcher *)self destinationsRegistry];
  uint64_t v10 = [v6 requestDestinations];
  id v11 = [v9 destinationsForRequestDestinations:v10];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * v16);
        if (v17
          && (objc_msgSend(v8, "containsObject:", *(void *)(*((void *)&v21 + 1) + 8 * v16), (void)v21) & 1) == 0)
        {
          v7[2](v7, v17);
          [v8 addObject:v17];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }

  if (![v8 count])
  {
    uint64_t v18 = [v6 requestDestinations];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      long long v20 = (void *)NCUILogDispatch;
      if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_ERROR)) {
        -[NCNotificationDispatcher _performOperationForRequestDestinations:block:](v20, v6);
      }
    }
  }
}

- (BOOL)_shouldPostNotificationRequest:(id)a3
{
  return ![(NCLayoutLoopDetector *)self->_layoutDetector layoutInProgressContainsNotificationRequest:a3];
}

- (void)_willPostNotificationRequest:(id)a3
{
}

- (void)_didPostNotificationRequest:(id)a3
{
}

- (void)_didRemoveNotificationRequest:(id)a3
{
}

- (void)_clearUnsafeNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_sourceDelegates;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", v4, (void)v12);
        [v10 dispatcher:self requestsClearingNotificationRequests:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_notifyDidExecuteAction:(id)a3 forNotificationRequest:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NCNotificationDispatcher *)self delegate];
  [v8 dispatcher:self didExecuteAction:v6 forNotificationRequest:v7];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v9 = self->_sourceDelegates;
  uint64_t v10 = [(NSHashTable *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "dispatcher:didExecuteAction:forNotificationRequest:", self, v6, v7, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [(NSHashTable *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (NCNotificationDispatcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationDispatcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setDestinationsRegistry:(id)a3
{
}

- (NCNotificationAlertQueue)alertQueue
{
  return self->_alertQueue;
}

- (void)setAlertQueue:(id)a3
{
}

- (void)setSectionSettings:(id)a3
{
}

- (NSHashTable)sourceDelegates
{
  return self->_sourceDelegates;
}

- (void)setSourceDelegates:(id)a3
{
}

- (NCLayoutLoopDetector)layoutDetector
{
  return self->_layoutDetector;
}

- (void)setLayoutDetector:(id)a3
{
}

- (NCNotificationSystemSettings)notificationSystemSettings
{
  return self->_notificationSystemSettings;
}

- (void)setNotificationSystemSettings:(id)a3
{
}

- (NCAlertingController)alertingController
{
  return self->_alertingController;
}

- (void)setAlertingController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertingController, 0);
  objc_storeStrong((id *)&self->_notificationSystemSettings, 0);
  objc_storeStrong((id *)&self->_layoutDetector, 0);
  objc_storeStrong((id *)&self->_sourceDelegates, 0);
  objc_storeStrong((id *)&self->_sectionSettings, 0);
  objc_storeStrong((id *)&self->_alertQueue, 0);
  objc_storeStrong((id *)&self->_destinationsRegistry, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)withdrawNotificationWithRequest:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)long long buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_22012C000, log, OS_LOG_TYPE_ERROR, "No destination withdraws performed for notification %{public}@", buf, 0xCu);
}

- (void)updateNotificationSectionSettings:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_22012C000, v0, v1, "Posting section settings %{public}@", v2, v3, v4, v5, v6);
}

- (void)removeNotificationSectionWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_22012C000, v0, v1, "Removing section settings %{public}@", v2, v3, v4, v5, v6);
}

- (void)notificationsLoadedForSectionIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_22012C000, v0, v1, "Notifications loaded for %{public}@", v2, v3, v4, v5, v6);
}

void __125__NCNotificationDispatcher_destination_executeAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke_cold_1(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  id v3 = a2;
  uint64_t v4 = [v2 identifier];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2(&dword_22012C000, v5, v6, "Action %{public}@ can't be executed because it has no runner", v7, v8, v9, v10, v11);
}

- (void)_performOperationForRequestDestinations:(void *)a1 block:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 requestDestinations];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2(&dword_22012C000, v5, v6, "No active destinations for request destinations: %{public}@", v7, v8, v9, v10, v11);
}

@end