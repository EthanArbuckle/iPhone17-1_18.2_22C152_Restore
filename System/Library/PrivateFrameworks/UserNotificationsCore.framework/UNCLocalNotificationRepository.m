@interface UNCLocalNotificationRepository
- (BOOL)_queue_saveNotificationRecord:(id)a3 targetRevisionNumber:(id)a4 shouldRepost:(BOOL)a5 withOptions:(unint64_t)a6 forBundleIdentifier:(id)a7;
- (BOOL)_shouldPersistNotificationRecord:(id)a3 forBundleSettings:(id)a4 perTopicSettings:(id)a5;
- (UNCLocalNotificationRepository)initWithDataStoreRepository:(id)a3 observable:(id)a4 librarian:(id)a5 categoryRepository:(id)a6 badgeService:(id)a7;
- (UNCLocalNotificationRepository)initWithDirectory:(id)a3 librarian:(id)a4 repositoryProtectionStrategy:(id)a5 categoryRepository:(id)a6 badgeService:(id)a7;
- (UNCNotificationRepositoryDelegate)delegate;
- (UNCNotificationRepositorySettingsProvider)settingsProvider;
- (id)_badgeNumberForBundleIdentifier:(id)a3;
- (id)_notificationsForObjects:(id)a3;
- (id)_queue_notificationRecordForIdentifier:(id)a3 forBundleIdentifier:(id)a4;
- (id)_queue_notificationRecordsForBundleIdentifier:(id)a3;
- (id)allBundleIdentifiers;
- (id)notificationRecordForIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (id)notificationRecordsForBundleIdentifier:(id)a3;
- (int64_t)_maxObjectsPerKey;
- (void)_badge_queue_setBadgeValue:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)_logNotification:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_notifyObserversNotificationsDidAddNotifications:(id)a3 replaceNotifications:(id)a4 replacementNotifications:(id)a5 removedNotifications:(id)a6 shouldRepost:(BOOL)a7 shouldSync:(BOOL)a8 forBundleIdentifier:(id)a9;
- (void)_queue_notifyObserversWithReceipt:(id)a3 bundleIdentifier:(id)a4;
- (void)_queue_performMigration;
- (void)_queue_performMigrationForBundleIdentifier:(id)a3;
- (void)_queue_performMigrationForPushStore;
- (void)_queue_performMigrationForPushStoreAtPath:(id)a3;
- (void)_queue_performMigrationForUserNotificationsStore;
- (void)_queue_performValidation;
- (void)_queue_removeAllNotificationRecordsForBundleIdentifier:(id)a3;
- (void)_queue_removeInvalidNotificationRecordsForBundleIdentifier:(id)a3;
- (void)_queue_removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4;
- (void)_queue_removeNotificationRecordsPassingTest:(id)a3 forBundleIdentifier:(id)a4;
- (void)_queue_removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(id)a3;
- (void)_queue_removeSimilarNotificationRecords:(id)a3 bundleIdentifier:(id)a4;
- (void)_queue_triggerInvalidationForFirstUnlock;
- (void)_setBadgeCount:(int64_t)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)_setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)_setBadgeString:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)_setBadgeValue:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)contentProtectionStateChangedForFirstUnlock:(BOOL)a3;
- (void)notificationSourcesDidInstall:(id)a3;
- (void)notificationSourcesDidUninstall:(id)a3;
- (void)performMigration;
- (void)performValidation;
- (void)removeAllNotificationRecordsForBundleIdentifier:(id)a3;
- (void)removeAllNotificationRecordsForBundleIdentifierSync:(id)a3;
- (void)removeInvalidNotificationRecordsForBundleIdentifier:(id)a3;
- (void)removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4;
- (void)removeNotificationRecordsPassingTest:(id)a3 forBundleIdentifier:(id)a4;
- (void)removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(id)a3;
- (void)removeNotificationRepository;
- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)removeSimilarNotificationRecords:(id)a3 bundleIdentifier:(id)a4;
- (void)removeStoreForBundleIdentifier:(id)a3;
- (void)saveNotificationRecord:(id)a3 shouldRepost:(BOOL)a4 forBundleIdentifier:(id)a5 withCompletionHandler:(id)a6;
- (void)saveNotificationRecord:(id)a3 targetRevisionNumber:(id)a4 shouldRepost:(BOOL)a5 forBundleIdentifier:(id)a6 withCompletionHandler:(id)a7;
- (void)saveNotificationRequest:(id)a3 shouldRepost:(BOOL)a4 apsMessageTimestamp:(id)a5 forBundleIdentifier:(id)a6;
- (void)saveNotificationRequest:(id)a3 shouldRepost:(BOOL)a4 withMessage:(id)a5 forBundleIdentifier:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setSettingsProvider:(id)a3;
@end

@implementation UNCLocalNotificationRepository

- (id)_badgeNumberForBundleIdentifier:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_not_V2(queue);
  v6 = [(UNCBadgeService *)self->_badgeService badgeNumberForBundleIdentifier:v5];

  return v6;
}

- (void)_badge_queue_setBadgeValue:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  badgeServiceQueue = self->_badgeServiceQueue;
  id v11 = a3;
  dispatch_assert_queue_V2(badgeServiceQueue);
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  dispatch_assert_queue_not_V2(MEMORY[0x263EF83A0]);
  LODWORD(badgeServiceQueue) = [(UNCBadgeService *)self->_badgeService setBadgeValue:v11 forBundleIdentifier:v8];

  if (badgeServiceQueue)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __103__UNCLocalNotificationRepository__badge_queue_setBadgeValue_forBundleIdentifier_withCompletionHandler___block_invoke;
    block[3] = &unk_265567AE0;
    block[4] = self;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(queue, block);
  }
  else if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

- (void)_setBadgeCount:(int64_t)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = NSNumber;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 numberWithInteger:a3];
  [(UNCLocalNotificationRepository *)self _setBadgeValue:v11 forBundleIdentifier:v10 withCompletionHandler:v9];
}

- (void)_setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v11 isEqual:&unk_270CE12E0])
  {

    id v10 = 0;
  }
  else
  {
    id v10 = v11;
  }
  id v12 = v10;
  [(UNCLocalNotificationRepository *)self _setBadgeValue:v10 forBundleIdentifier:v8 withCompletionHandler:v9];
}

- (void)_setBadgeValue:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  badgeServiceQueue = self->_badgeServiceQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __91__UNCLocalNotificationRepository__setBadgeValue_forBundleIdentifier_withCompletionHandler___block_invoke;
  v15[3] = &unk_265567F50;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(badgeServiceQueue, v15);
}

uint64_t __91__UNCLocalNotificationRepository__setBadgeValue_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_badge_queue_setBadgeValue:forBundleIdentifier:withCompletionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (int64_t)_maxObjectsPerKey
{
  return 100;
}

- (UNCLocalNotificationRepository)initWithDirectory:(id)a3 librarian:(id)a4 repositoryProtectionStrategy:(id)a5 categoryRepository:(id)a6 badgeService:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [[UNCKeyedDataStoreRepository alloc] initWithDirectory:v16 fileName:@"DeliveredNotifications" pathExtension:@"plist" librarian:v15 repositoryProtectionStrategy:v14 objectIdentifierKey:@"AppNotificationIdentifier" maxObjectsPerKey:[(UNCLocalNotificationRepository *)self _maxObjectsPerKey]];

  [(UNCKeyedDataStoreRepository *)v17 setRecordValidationTest:UNSNotificationRecordDictionaryValidation];
  id v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v19 = dispatch_queue_create("com.apple.NotificationRepository.observable", v18);

  v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v21 = dispatch_queue_create("com.apple.NotificationRepository.call-out", v20);

  v22 = [[UNCKeyedObservable alloc] initWithQueue:v19 callOutQueue:v21];
  v23 = [(UNCLocalNotificationRepository *)self initWithDataStoreRepository:v17 observable:v22 librarian:v15 categoryRepository:v13 badgeService:v12];

  return v23;
}

- (UNCLocalNotificationRepository)initWithDataStoreRepository:(id)a3 observable:(id)a4 librarian:(id)a5 categoryRepository:(id)a6 badgeService:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v32 = a7;
  v33.receiver = self;
  v33.super_class = (Class)UNCLocalNotificationRepository;
  id v17 = [(UNCLocalNotificationRepository *)&v33 init];
  if (v17)
  {
    id v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    unlimitedBodyBundleIdentifiers = v17->_unlimitedBodyBundleIdentifiers;
    v17->_unlimitedBodyBundleIdentifiers = v18;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id obj = a6;
    id v20 = v16;
    id v21 = v15;
    id v22 = v14;
    v24 = id v23 = v13;
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.usernotificationsserver.NotificationRepository", v24);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v25;

    v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v28 = dispatch_queue_create("com.apple.usernotificationsserver.NotificationRepositoryBadgeService", v27);
    badgeServiceQueue = v17->_badgeServiceQueue;
    v17->_badgeServiceQueue = (OS_dispatch_queue *)v28;

    id v13 = v23;
    id v14 = v22;
    id v15 = v21;
    id v16 = v20;
    objc_storeStrong((id *)&v17->_repository, a3);
    objc_storeStrong((id *)&v17->_observable, a4);
    objc_storeStrong((id *)&v17->_librarian, a5);
    objc_storeStrong((id *)&v17->_badgeService, a7);
    objc_storeStrong((id *)&v17->_categoryRepository, obj);
  }

  return v17;
}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__UNCLocalNotificationRepository_addObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __66__UNCLocalNotificationRepository_addObserver_forBundleIdentifier___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) addObserver:a1[5] forKey:a1[6]];
}

- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__UNCLocalNotificationRepository_removeObserver_forBundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __69__UNCLocalNotificationRepository_removeObserver_forBundleIdentifier___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) removeObserver:a1[5] forKey:a1[6]];
}

- (id)notificationRecordsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6;
  id v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__UNCLocalNotificationRepository_notificationRecordsForBundleIdentifier___block_invoke;
  block[3] = &unk_265567700;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __73__UNCLocalNotificationRepository_notificationRecordsForBundleIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_notificationRecordsForBundleIdentifier:", *(void *)(a1 + 40));

  return MEMORY[0x270F9A758]();
}

- (id)notificationRecordForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__6;
  id v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __83__UNCLocalNotificationRepository_notificationRecordForIdentifier_bundleIdentifier___block_invoke;
  v13[3] = &unk_265567EB0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

uint64_t __83__UNCLocalNotificationRepository_notificationRecordForIdentifier_bundleIdentifier___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_notificationRecordForIdentifier:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));

  return MEMORY[0x270F9A758]();
}

- (void)saveNotificationRecord:(id)a3 shouldRepost:(BOOL)a4 forBundleIdentifier:(id)a5 withCompletionHandler:(id)a6
{
}

- (void)saveNotificationRecord:(id)a3 targetRevisionNumber:(id)a4 shouldRepost:(BOOL)a5 forBundleIdentifier:(id)a6 withCompletionHandler:(id)a7
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = (void (**)(id, void, void *))a7;
  if (v12)
  {
    if (v14)
    {
      id v16 = [v12 date];

      if (!v16)
      {
        v24 = (void *)*MEMORY[0x263F1E030];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR))
        {
          -[UNCLocalNotificationRepository saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:withCompletionHandler:]((uint64_t)v14, v24, v12);
          if (!v15) {
            goto LABEL_19;
          }
        }
        else if (!v15)
        {
          goto LABEL_19;
        }
        dispatch_queue_t v25 = (void *)MEMORY[0x263F087E8];
        uint64_t v26 = 1400;
LABEL_18:
        v31 = objc_msgSend(v25, "un_errorWithUNErrorCode:userInfo:", v26, 0);
        v15[2](v15, 0, v31);

        goto LABEL_19;
      }
      if ([v12 willNotifyUser] & 1) != 0 || (objc_msgSend(v12, "hasBadge"))
      {
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __133__UNCLocalNotificationRepository_saveNotificationRecord_targetRevisionNumber_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke;
        aBlock[3] = &unk_265567ED8;
        aBlock[4] = self;
        id v17 = v12;
        id v37 = v17;
        id v38 = v13;
        BOOL v41 = a5;
        id v18 = v14;
        id v39 = v18;
        v40 = v15;
        uint64_t v19 = _Block_copy(aBlock);
        queue = self->_queue;
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __133__UNCLocalNotificationRepository_saveNotificationRecord_targetRevisionNumber_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke_2;
        v32[3] = &unk_265567F50;
        v32[4] = self;
        id v33 = v18;
        id v34 = v17;
        id v35 = v19;
        id v21 = v19;
        dispatch_async(queue, v32);

        goto LABEL_19;
      }
      v27 = (void *)*MEMORY[0x263F1E030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
      {
        dispatch_queue_t v28 = v27;
        v29 = [v12 identifier];
        v30 = objc_msgSend(v29, "un_logDigest");
        *(_DWORD *)buf = 138543618;
        id v43 = v14;
        __int16 v44 = 2114;
        v45 = v30;
        _os_log_impl(&dword_2608DB000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] Not delivering user visible notification %{public}@ because it has no alert, sound or badge", buf, 0x16u);
      }
      if (v15)
      {
        dispatch_queue_t v25 = (void *)MEMORY[0x263F087E8];
        uint64_t v26 = 1401;
        goto LABEL_18;
      }
    }
    else
    {
      id v23 = (void *)*MEMORY[0x263F1E030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR)) {
        -[UNCLocalNotificationRepository saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:withCompletionHandler:](v23, v12);
      }
    }
  }
  else
  {
    id v22 = *MEMORY[0x263F1E030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_ERROR)) {
      -[UNCLocalNotificationRepository saveNotificationRecord:targetRevisionNumber:shouldRepost:forBundleIdentifier:withCompletionHandler:](v22);
    }
  }
LABEL_19:
}

void __133__UNCLocalNotificationRepository_saveNotificationRecord_targetRevisionNumber_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  char v5 = objc_msgSend(*(id *)(a1 + 32), "_queue_saveNotificationRecord:targetRevisionNumber:shouldRepost:withOptions:forBundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), a2, *(void *)(a1 + 56));
  uint64_t v6 = *(void *)(a1 + 64);
  if (v6)
  {
    uint64_t v7 = (uint64_t)v8;
    if (v8) {
      char v5 = 1;
    }
    if ((v5 & 1) == 0)
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNPrivateErrorCode:userInfo:", 2000, 0);
      uint64_t v6 = *(void *)(a1 + 64);
    }
    id v8 = (id)v7;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
  }
}

void __133__UNCLocalNotificationRepository_saveNotificationRecord_targetRevisionNumber_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  int v3 = [WeakRetained isApplicationForeground:*(void *)(a1 + 40)];

  id v4 = *(void **)(a1 + 48);
  if (v3)
  {
    if ([v4 pipelineState])
    {
      uint64_t v5 = *(void *)(a1 + 56);
      uint64_t v6 = [*(id *)(a1 + 48) presentationOptions];
      uint64_t v7 = *(void (**)(uint64_t, uint64_t, void))(v5 + 16);
      v7(v5, v6, 0);
    }
    else
    {
      id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __133__UNCLocalNotificationRepository_saveNotificationRecord_targetRevisionNumber_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke_3;
      v17[3] = &unk_265567F28;
      v17[4] = *(void *)(a1 + 32);
      id v18 = *(id *)(a1 + 56);
      [v8 willPresentNotification:v9 forBundleIdentifier:v10 withCompletionHandler:v17];
    }
  }
  else
  {
    if ([v4 hasSound])
    {
      if (([*(id *)(a1 + 48) hasAlertContent] & 1) == 0)
      {
        id v11 = (void *)*MEMORY[0x263F1E030];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = *(void *)(a1 + 40);
          id v12 = *(void **)(a1 + 48);
          id v14 = v11;
          id v15 = [v12 identifier];
          id v16 = objc_msgSend(v15, "un_logDigest");
          *(_DWORD *)buf = 138543618;
          uint64_t v20 = v13;
          __int16 v21 = 2114;
          id v22 = v16;
          _os_log_impl(&dword_2608DB000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Suppressing sound on user visible notification %{public}@ because it has no alert and the app is in the background", buf, 0x16u);
        }
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __133__UNCLocalNotificationRepository_saveNotificationRecord_targetRevisionNumber_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __133__UNCLocalNotificationRepository_saveNotificationRecord_targetRevisionNumber_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke_4;
  block[3] = &unk_265567F00;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, block);
}

uint64_t __133__UNCLocalNotificationRepository_saveNotificationRecord_targetRevisionNumber_shouldRepost_forBundleIdentifier_withCompletionHandler___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)saveNotificationRequest:(id)a3 shouldRepost:(BOOL)a4 withMessage:(id)a5 forBundleIdentifier:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = [a5 timestamp];
  [(UNCLocalNotificationRepository *)self saveNotificationRequest:v11 shouldRepost:v7 apsMessageTimestamp:v12 forBundleIdentifier:v10];
}

- (void)saveNotificationRequest:(id)a3 shouldRepost:(BOOL)a4 apsMessageTimestamp:(id)a5 forBundleIdentifier:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  categoryRepository = self->_categoryRepository;
  id v13 = a5;
  id v14 = [v10 content];
  id v15 = [v14 categoryIdentifier];
  id v16 = [(UNSNotificationCategoryRepository *)categoryRepository categoryWithIdentifier:v15 bundleIdentifier:v11];

  id v17 = (void *)MEMORY[0x263F1DF08];
  id v18 = [v16 intentIdentifiers];
  uint64_t v19 = [v17 notificationWithRequest:v10 date:v13 sourceIdentifier:v11 intentIdentifiers:v18];

  uint64_t v20 = (*((void (**)(uint64_t, void *))UNNotificationToNotificationRecord + 2))((uint64_t)UNNotificationToNotificationRecord, v19);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __111__UNCLocalNotificationRepository_saveNotificationRequest_shouldRepost_apsMessageTimestamp_forBundleIdentifier___block_invoke;
  v23[3] = &unk_2655679D8;
  id v24 = v11;
  id v25 = v10;
  id v21 = v10;
  id v22 = v11;
  [(UNCLocalNotificationRepository *)self saveNotificationRecord:v20 shouldRepost:v8 forBundleIdentifier:v22 withCompletionHandler:v23];
}

void __111__UNCLocalNotificationRepository_saveNotificationRequest_shouldRepost_apsMessageTimestamp_forBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x263F1E060];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F1E060], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      BOOL v7 = *(void **)(a1 + 40);
      id v9 = v5;
      id v10 = [v7 identifier];
      id v11 = objc_msgSend(v10, "un_logDigest");
      int v17 = 138543874;
      uint64_t v18 = v8;
      __int16 v19 = 2114;
      uint64_t v20 = v11;
      __int16 v21 = 2114;
      id v22 = v4;
      id v12 = "[%{public}@] NOT delivering user visible push notification %{public}@ [ error=%{public}@ ]";
      id v13 = v9;
      uint32_t v14 = 32;
LABEL_6:
      _os_log_impl(&dword_2608DB000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
    }
  }
  else if (v6)
  {
    uint64_t v16 = *(void *)(a1 + 32);
    id v15 = *(void **)(a1 + 40);
    id v9 = v5;
    id v10 = [v15 identifier];
    id v11 = objc_msgSend(v10, "un_logDigest");
    int v17 = 138543618;
    uint64_t v18 = v16;
    __int16 v19 = 2114;
    uint64_t v20 = v11;
    id v12 = "[%{public}@] Delivered user visible push notification %{public}@";
    id v13 = v9;
    uint32_t v14 = 22;
    goto LABEL_6;
  }
}

- (void)removeAllNotificationRecordsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __82__UNCLocalNotificationRepository_removeAllNotificationRecordsForBundleIdentifier___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __82__UNCLocalNotificationRepository_removeAllNotificationRecordsForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllNotificationRecordsForBundleIdentifier:", *(void *)(a1 + 40));
}

- (void)removeAllNotificationRecordsForBundleIdentifierSync:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __86__UNCLocalNotificationRepository_removeAllNotificationRecordsForBundleIdentifierSync___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __86__UNCLocalNotificationRepository_removeAllNotificationRecordsForBundleIdentifierSync___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllNotificationRecordsForBundleIdentifier:", *(void *)(a1 + 40));
}

- (void)removeInvalidNotificationRecordsForBundleIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __86__UNCLocalNotificationRepository_removeInvalidNotificationRecordsForBundleIdentifier___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __86__UNCLocalNotificationRepository_removeInvalidNotificationRecordsForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeInvalidNotificationRecordsForBundleIdentifier:", *(void *)(a1 + 40));
}

- (void)removeNotificationRecordsPassingTest:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__UNCLocalNotificationRepository_removeNotificationRecordsPassingTest_forBundleIdentifier___block_invoke;
  block[3] = &unk_265567F78;
  id v12 = v7;
  id v13 = v6;
  void block[4] = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __91__UNCLocalNotificationRepository_removeNotificationRecordsPassingTest_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeNotificationRecordsPassingTest:forBundleIdentifier:", *(void *)(a1 + 48), *(void *)(a1 + 40));
}

- (void)removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__UNCLocalNotificationRepository_removeNotificationRecordsForIdentifiers_bundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __91__UNCLocalNotificationRepository_removeNotificationRecordsForIdentifiers_bundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeNotificationRecordsForIdentifiers:bundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)removeSimilarNotificationRecords:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__UNCLocalNotificationRepository_removeSimilarNotificationRecords_bundleIdentifier___block_invoke;
  block[3] = &unk_2655676D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __84__UNCLocalNotificationRepository_removeSimilarNotificationRecords_bundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeSimilarNotificationRecords:bundleIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __97__UNCLocalNotificationRepository_removeNotificationRecordsWithNonPushTriggerForBundleIdentifier___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __97__UNCLocalNotificationRepository_removeNotificationRecordsWithNonPushTriggerForBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:", *(void *)(a1 + 40));
}

- (void)removeStoreForBundleIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__UNCLocalNotificationRepository_removeStoreForBundleIdentifier___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __65__UNCLocalNotificationRepository_removeStoreForBundleIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeStoreForKey:*(void *)(a1 + 40)];
}

- (void)removeNotificationRepository
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__UNCLocalNotificationRepository_removeNotificationRepository__block_invoke;
  block[3] = &unk_265567728;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __62__UNCLocalNotificationRepository_removeNotificationRepository__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeDataStoreRepository];
}

- (id)allBundleIdentifiers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__6;
  id v10 = __Block_byref_object_dispose__6;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __54__UNCLocalNotificationRepository_allBundleIdentifiers__block_invoke;
  v5[3] = &unk_265567600;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __54__UNCLocalNotificationRepository_allBundleIdentifiers__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) allKeys];

  return MEMORY[0x270F9A758]();
}

- (void)performMigration
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__UNCLocalNotificationRepository_performMigration__block_invoke;
  block[3] = &unk_265567728;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __50__UNCLocalNotificationRepository_performMigration__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_performMigration");
}

- (void)performValidation
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__UNCLocalNotificationRepository_performValidation__block_invoke;
  block[3] = &unk_265567728;
  void block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __51__UNCLocalNotificationRepository_performValidation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_performValidation");
}

- (void)contentProtectionStateChangedForFirstUnlock:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __78__UNCLocalNotificationRepository_contentProtectionStateChangedForFirstUnlock___block_invoke;
  v4[3] = &unk_265567FA0;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_sync(queue, v4);
}

uint64_t __78__UNCLocalNotificationRepository_contentProtectionStateChangedForFirstUnlock___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "_queue_performMigrationForUserNotificationsStore");
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) protectionStateChanged];
  if (*(unsigned char *)(a1 + 40))
  {
    id v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_queue_triggerInvalidationForFirstUnlock");
  }
  return result;
}

- (void)notificationSourcesDidInstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__UNCLocalNotificationRepository_notificationSourcesDidInstall___block_invoke;
  v7[3] = &unk_265567628;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __64__UNCLocalNotificationRepository_notificationSourcesDidInstall___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        int v8 = objc_msgSend(v7, "allowUnlimitedContentBody", (void)v11);
        id v9 = *(void **)(*(void *)(a1 + 40) + 24);
        id v10 = [v7 bundleIdentifier];
        if (v8) {
          [v9 addObject:v10];
        }
        else {
          [v9 removeObject:v10];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

- (void)notificationSourcesDidUninstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__UNCLocalNotificationRepository_notificationSourcesDidUninstall___block_invoke;
  v7[3] = &unk_265567628;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __66__UNCLocalNotificationRepository_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*(void *)(a1 + 40) + 24);
        id v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v6), "bundleIdentifier", (void)v9);
        [v7 removeObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (id)_notificationsForObjects:(id)a3
{
  return (id)objc_msgSend(a3, "bs_map:", UNSDictionaryToNotificationRecord);
}

- (id)_queue_notificationRecordsForBundleIdentifier:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  uint64_t v6 = [(UNCKeyedDataStoreRepository *)self->_repository objectsForKey:v5];

  uint64_t v7 = [(UNCLocalNotificationRepository *)self _notificationsForObjects:v6];
  if (v7) {
    id v8 = (void *)v7;
  }
  else {
    id v8 = (void *)MEMORY[0x263EFFA68];
  }

  return v8;
}

- (id)_queue_notificationRecordForIdentifier:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  queue = self->_queue;
  id v8 = a4;
  dispatch_assert_queue_V2(queue);
  repository = self->_repository;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __93__UNCLocalNotificationRepository__queue_notificationRecordForIdentifier_forBundleIdentifier___block_invoke;
  v16[3] = &unk_265567FC8;
  id v10 = v6;
  id v17 = v10;
  long long v11 = [(UNCKeyedDataStoreRepository *)repository objectsPassingTest:v16 forKey:v8];

  if ([v11 count])
  {
    long long v12 = (void (**)(uint64_t, void *))UNSDictionaryToNotificationRecord;
    long long v13 = [v11 firstObject];
    uint64_t v14 = v12[2]((uint64_t)v12, v13);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

uint64_t __93__UNCLocalNotificationRepository__queue_notificationRecordForIdentifier_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 objectForKey:@"AppNotificationIdentifier"];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (void)_queue_notifyObserversNotificationsDidAddNotifications:(id)a3 replaceNotifications:(id)a4 replacementNotifications:(id)a5 removedNotifications:(id)a6 shouldRepost:(BOOL)a7 shouldSync:(BOOL)a8 forBundleIdentifier:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v40 = a5;
  id v37 = a6;
  id v38 = a9;
  id v39 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v17 = [MEMORY[0x263EFF980] array];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v18 = v15;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v49 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = +[UNSNotificationRecordAddUpdate updateWithNotificationRecord:*(void *)(*((void *)&v48 + 1) + 8 * i) shouldSync:v9];
        [v17 addObject:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v20);
  }

  if ([v16 count])
  {
    unint64_t v24 = 0;
    do
    {
      id v25 = [v16 objectAtIndex:v24];
      uint64_t v26 = [v40 objectAtIndex:v24];
      v27 = +[UNSNotificationRecordReplaceUpdate updateWithNotificationRecord:v26 replacedNotificationRecord:v25 shouldRepost:v10];
      [v17 addObject:v27];

      ++v24;
    }
    while (v24 < [v16 count]);
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v28 = v37;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = +[UNSNotificationRecordRemoveUpdate updateWithNotificationRecord:*(void *)(*((void *)&v44 + 1) + 8 * j) shouldSync:v9];
        [v17 addObject:v33];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v30);
  }

  observable = v39->_observable;
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __200__UNCLocalNotificationRepository__queue_notifyObserversNotificationsDidAddNotifications_replaceNotifications_replacementNotifications_removedNotifications_shouldRepost_shouldSync_forBundleIdentifier___block_invoke;
  v41[3] = &unk_265567778;
  v41[4] = v39;
  id v42 = v17;
  id v43 = v38;
  id v35 = v38;
  id v36 = v17;
  [(UNCKeyedObservable *)observable notifyObserversKey:v35 usingBlock:v41];
}

uint64_t __200__UNCLocalNotificationRepository__queue_notifyObserversNotificationsDidAddNotifications_replaceNotifications_replacementNotifications_removedNotifications_shouldRepost_shouldSync_forBundleIdentifier___block_invoke(void *a1, void *a2)
{
  return [a2 notificationRepository:a1[4] didPerformUpdates:a1[5] forBundleIdentifier:a1[6]];
}

- (BOOL)_queue_saveNotificationRecord:(id)a3 targetRevisionNumber:(id)a4 shouldRepost:(BOOL)a5 withOptions:(unint64_t)a6 forBundleIdentifier:(id)a7
{
  BOOL v71 = a5;
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [v11 setShouldBadgeApplicationIcon:a6 & 1];
  [v11 setShouldPlaySound:(a6 >> 1) & 1];
  [v11 setShouldPresentAlert:(a6 & 0x1C) != 0];
  [v11 setPresentationOptions:a6];
  uint64_t v14 = [v11 pipelineState];
  if (!v14) {
    [(UNCLocalNotificationRepository *)self _logNotification:v11 forBundleIdentifier:v13];
  }
  uint64_t v15 = [v11 badge];
  int v16 = [v11 shouldBadgeApplicationIcon];
  int v17 = v16;
  v75 = (void *)v15;
  if (v15) {
    int v18 = v16;
  }
  else {
    int v18 = 0;
  }
  uint64_t v19 = (void *)*MEMORY[0x263F1E030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = v19;
    uint64_t v21 = [v11 identifier];
    id v22 = objc_msgSend(v21, "un_logDigest");
    *(_DWORD *)buf = 138544386;
    id v78 = v13;
    __int16 v79 = 2114;
    v80 = v22;
    __int16 v81 = 1024;
    *(_DWORD *)v82 = v18;
    *(_WORD *)&v82[4] = 1024;
    *(_DWORD *)&v82[6] = v17;
    *(_WORD *)v83 = 2114;
    *(void *)&v83[2] = v75;
    _os_log_impl(&dword_2608DB000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Badge can be set for notification %{public}@: %d [ canBadge: %d badgeNumber: %{public}@ ]", buf, 0x2Cu);
  }
  if (v18)
  {
    uint64_t v23 = [v11 badge];
    [(UNCLocalNotificationRepository *)self _setBadgeNumber:v23 forBundleIdentifier:v13 withCompletionHandler:0];
  }
  if ([v11 hasAlertContent]) {
    int v24 = [v11 shouldPresentAlert];
  }
  else {
    int v24 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsProvider);
  uint64_t v26 = [WeakRetained notificationSettingsForBundleIdentifier:v13];

  id v27 = objc_loadWeakRetained((id *)&self->_settingsProvider);
  id v76 = v13;
  [v27 notificationSettingsForTopicsWithBundleIdentifier:v13];
  v29 = id v28 = self;

  v74 = v28;
  BOOL v30 = [(UNCLocalNotificationRepository *)v28 _shouldPersistNotificationRecord:v11 forBundleSettings:v26 perTopicSettings:v29];
  int v31 = v24 & v30;
  id v32 = (void *)*MEMORY[0x263F1E030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
  {
    log = v32;
    id v33 = [v11 identifier];
    objc_msgSend(v33, "un_logDigest");
    id v34 = v72 = v12;
    id v35 = v29;
    id v36 = v26;
    int v37 = [v11 hasAlertContent];
    int v38 = [v11 shouldPresentAlert];
    id v39 = UNSStringFromPipelineState(v14);
    *(_DWORD *)buf = 138544898;
    id v78 = v76;
    __int16 v79 = 2114;
    v80 = v34;
    __int16 v81 = 1024;
    *(_DWORD *)v82 = v31;
    *(_WORD *)&v82[4] = 1024;
    *(_DWORD *)&v82[6] = v37;
    uint64_t v26 = v36;
    uint64_t v29 = v35;
    *(_WORD *)v83 = 1024;
    *(_DWORD *)&v83[2] = v38;
    *(_WORD *)&v83[6] = 1024;
    *(_DWORD *)&v83[8] = v30;
    __int16 v84 = 2114;
    v85 = v39;
    _os_log_impl(&dword_2608DB000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@] Saving notification %{public}@: %{BOOL}d [ hasAlertContent: %{BOOL}d, shouldPresentAlert: %{BOOL}d settingsShouldSave: %{BOOL}d pipelineState: %{public}@]", buf, 0x38u);

    id v12 = v72;
  }
  if (v31)
  {
    id v40 = [v11 identifier];
    BOOL v41 = v76;
    id v42 = [(UNCLocalNotificationRepository *)v74 _queue_notificationRecordForIdentifier:v40 forBundleIdentifier:v76];

    if (v42)
    {
      if (!v12 || (uint64_t v43 = [v42 revisionNumber], v43 == objc_msgSend(v12, "integerValue")))
      {
        id v73 = v12;
        uint64_t v44 = [v42 revisionNumber] + 1;
LABEL_33:
        [v11 setRevisionNumber:v44];
        v57 = objc_msgSend(v11, "dictionaryRepresentationWithTruncation:", -[NSMutableSet containsObject:](v74->_unlimitedBodyBundleIdentifiers, "containsObject:", v76) ^ 1);
        repository = v74->_repository;
        if (v71) {
          [(UNCKeyedDataStoreRepository *)repository addObject:v57 forKey:v76];
        }
        else {
        v59 = [(UNCKeyedDataStoreRepository *)repository replaceObject:v57 forKey:v76];
        }
        if ([v59 hasChanges])
        {
          v60 = [v59 addedObjects];
          v68 = [(UNCLocalNotificationRepository *)v74 _notificationsForObjects:v60];

          v61 = [v59 replacedObjects];
          v62 = [(UNCLocalNotificationRepository *)v74 _notificationsForObjects:v61];

          v63 = [v59 replacementObjects];
          [(UNCLocalNotificationRepository *)v74 _notificationsForObjects:v63];
          v64 = os_log_t loga = v26;

          v65 = [v59 removedObjects];
          v66 = [(UNCLocalNotificationRepository *)v74 _notificationsForObjects:v65];

          [(UNCLocalNotificationRepository *)v74 _queue_notifyObserversNotificationsDidAddNotifications:v68 replaceNotifications:v62 replacementNotifications:v64 removedNotifications:v66 shouldRepost:v71 shouldSync:1 forBundleIdentifier:v76];
          uint64_t v26 = loga;
        }
        BOOL v45 = 1;
        id v12 = v73;
        BOOL v41 = v76;
        goto LABEL_39;
      }
      uint64_t v54 = (void *)*MEMORY[0x263F1E030];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      long long v47 = v54;
      long long v48 = [v11 identifier];
      objc_msgSend(v48, "un_logDigest");
      v50 = long long v49 = v26;
      uint64_t v55 = [v42 revisionNumber];
      uint64_t v56 = [v12 integerValue];
      *(_DWORD *)buf = 138544130;
      id v78 = v76;
      __int16 v79 = 2114;
      v80 = v50;
      __int16 v81 = 2050;
      *(void *)v82 = v55;
      *(_WORD *)&v82[8] = 2050;
      *(void *)v83 = v56;
      long long v51 = "[%{public}@] Could not save notification %{public}@: Revision number (%{public}ld) is different from the exp"
            "ected value (%{public}ld)";
      v52 = v47;
      uint32_t v53 = 42;
    }
    else
    {
      if (!v12)
      {
        id v73 = 0;
        uint64_t v44 = 0;
        goto LABEL_33;
      }
      long long v46 = (void *)*MEMORY[0x263F1E030];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      long long v47 = v46;
      long long v48 = [v11 identifier];
      objc_msgSend(v48, "un_logDigest");
      v50 = long long v49 = v26;
      *(_DWORD *)buf = 138543618;
      id v78 = v76;
      __int16 v79 = 2114;
      v80 = v50;
      long long v51 = "[%{public}@] Could not save notification %{public}@: Already removed!";
      v52 = v47;
      uint32_t v53 = 22;
    }
    _os_log_impl(&dword_2608DB000, v52, OS_LOG_TYPE_DEFAULT, v51, buf, v53);

    uint64_t v26 = v49;
LABEL_31:
    BOOL v45 = 0;
    goto LABEL_39;
  }
  BOOL v41 = v76;
  if (([v11 hasAlertContent] & 1) != 0
    || [v11 hasSound] && objc_msgSend(v11, "shouldPlaySound"))
  {
    id v42 = [MEMORY[0x263EFF8C0] arrayWithObject:v11];
    [(UNCLocalNotificationRepository *)v74 _queue_notifyObserversNotificationsDidAddNotifications:v42 replaceNotifications:0 replacementNotifications:0 removedNotifications:0 shouldRepost:0 shouldSync:0 forBundleIdentifier:v76];
    BOOL v45 = 1;
LABEL_39:

    goto LABEL_40;
  }
  BOOL v45 = 1;
LABEL_40:

  return v45;
}

- (void)_queue_removeAllNotificationRecordsForBundleIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = *MEMORY[0x263F1E030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_2608DB000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remove all delivered notifications", (uint8_t *)&v6, 0xCu);
  }
  [(UNCLocalNotificationRepository *)self _queue_removeNotificationRecordsPassingTest:&__block_literal_global_12 forBundleIdentifier:v4];
}

uint64_t __89__UNCLocalNotificationRepository__queue_removeAllNotificationRecordsForBundleIdentifier___block_invoke()
{
  return 1;
}

- (void)_queue_removeInvalidNotificationRecordsForBundleIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = *MEMORY[0x263F1E030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v4;
    _os_log_impl(&dword_2608DB000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Remove all delivered notifications that are no longer valid", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsProvider);
  id v7 = [WeakRetained notificationSettingsForBundleIdentifier:v4];

  id v8 = objc_loadWeakRetained((id *)&self->_settingsProvider);
  BOOL v9 = [v8 notificationSettingsForTopicsWithBundleIdentifier:v4];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __93__UNCLocalNotificationRepository__queue_removeInvalidNotificationRecordsForBundleIdentifier___block_invoke;
  v13[3] = &unk_265568010;
  v13[4] = self;
  id v14 = v7;
  id v15 = v9;
  id v16 = v4;
  id v10 = v4;
  id v11 = v9;
  id v12 = v7;
  [(UNCLocalNotificationRepository *)self _queue_removeNotificationRecordsPassingTest:v13 forBundleIdentifier:v10];
}

uint64_t __93__UNCLocalNotificationRepository__queue_removeInvalidNotificationRecordsForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) _shouldPersistNotificationRecord:v3 forBundleSettings:*(void *)(a1 + 40) perTopicSettings:*(void *)(a1 + 48)];
  if ((v4 & 1) == 0)
  {
    id v5 = (void *)*MEMORY[0x263F1E030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 56);
      id v7 = v5;
      id v8 = [v3 identifier];
      BOOL v9 = objc_msgSend(v8, "un_logDigest");
      int v11 = 138543618;
      uint64_t v12 = v6;
      __int16 v13 = 2114;
      id v14 = v9;
      _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Removing notification %{public}@ because applicable settings no longer require its persistence", (uint8_t *)&v11, 0x16u);
    }
  }

  return v4 ^ 1u;
}

- (void)_queue_removeNotificationRecordsPassingTest:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  queue = self->_queue;
  id v8 = a4;
  dispatch_assert_queue_V2(queue);
  repository = self->_repository;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __98__UNCLocalNotificationRepository__queue_removeNotificationRecordsPassingTest_forBundleIdentifier___block_invoke;
  v12[3] = &unk_265568038;
  id v13 = v6;
  id v10 = v6;
  int v11 = [(UNCKeyedDataStoreRepository *)repository removeObjectsPassingTest:v12 forKey:v8];
  [(UNCLocalNotificationRepository *)self _queue_notifyObserversWithReceipt:v11 bundleIdentifier:v8];
}

uint64_t __98__UNCLocalNotificationRepository__queue_removeNotificationRecordsPassingTest_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (*((void (**)(uint64_t, void *))UNSDictionaryToNotificationRecord + 2))((uint64_t)UNSDictionaryToNotificationRecord, a2);
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v4;
}

- (void)_queue_removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  queue = self->_queue;
  id v8 = a4;
  dispatch_assert_queue_V2(queue);
  repository = self->_repository;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __98__UNCLocalNotificationRepository__queue_removeNotificationRecordsForIdentifiers_bundleIdentifier___block_invoke;
  v12[3] = &unk_265567FC8;
  id v13 = v6;
  id v10 = v6;
  int v11 = [(UNCKeyedDataStoreRepository *)repository removeObjectsPassingTest:v12 forKey:v8];
  [(UNCLocalNotificationRepository *)self _queue_notifyObserversWithReceipt:v11 bundleIdentifier:v8];
}

uint64_t __98__UNCLocalNotificationRepository__queue_removeNotificationRecordsForIdentifiers_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (*((void (**)(uint64_t, void *))UNSDictionaryToNotificationRecord + 2))((uint64_t)UNSDictionaryToNotificationRecord, a2);
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v3 identifier];
  uint64_t v6 = [v4 containsObject:v5];

  return v6;
}

- (void)_queue_removeSimilarNotificationRecords:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  queue = self->_queue;
  id v8 = a4;
  dispatch_assert_queue_V2(queue);
  repository = self->_repository;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __91__UNCLocalNotificationRepository__queue_removeSimilarNotificationRecords_bundleIdentifier___block_invoke;
  v12[3] = &unk_265567FC8;
  id v13 = v6;
  id v10 = v6;
  int v11 = [(UNCKeyedDataStoreRepository *)repository removeObjectsPassingTest:v12 forKey:v8];
  [(UNCLocalNotificationRepository *)self _queue_notifyObserversWithReceipt:v11 bundleIdentifier:v8];
}

uint64_t __91__UNCLocalNotificationRepository__queue_removeSimilarNotificationRecords_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = (*((void (**)(uint64_t, void *))UNSDictionaryToNotificationRecord + 2))((uint64_t)UNSDictionaryToNotificationRecord, a2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "isSimilar:", v3, (void)v9))
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)_queue_removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  id v6 = [(UNCKeyedDataStoreRepository *)self->_repository removeObjectsPassingTest:&__block_literal_global_23 forKey:v5];
  [(UNCLocalNotificationRepository *)self _queue_notifyObserversWithReceipt:v6 bundleIdentifier:v5];
}

uint64_t __104__UNCLocalNotificationRepository__queue_removeNotificationRecordsWithNonPushTriggerForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (*((void (**)(uint64_t, void *))UNSDictionaryToNotificationRecord + 2))((uint64_t)UNSDictionaryToNotificationRecord, a2);
  id v3 = [v2 triggerType];
  id v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 isEqualToString:@"Push"] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)_queue_notifyObserversWithReceipt:(id)a3 bundleIdentifier:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v15 hasChanges])
  {
    id v7 = [v15 addedObjects];
    id v8 = [(UNCLocalNotificationRepository *)self _notificationsForObjects:v7];

    long long v9 = [v15 replacedObjects];
    long long v10 = [(UNCLocalNotificationRepository *)self _notificationsForObjects:v9];

    long long v11 = [v15 replacementObjects];
    long long v12 = [(UNCLocalNotificationRepository *)self _notificationsForObjects:v11];

    id v13 = [v15 removedObjects];
    uint64_t v14 = [(UNCLocalNotificationRepository *)self _notificationsForObjects:v13];

    [(UNCLocalNotificationRepository *)self _queue_notifyObserversNotificationsDidAddNotifications:v8 replaceNotifications:v10 replacementNotifications:v12 removedNotifications:v14 shouldRepost:1 shouldSync:1 forBundleIdentifier:v6];
  }
}

- (void)_setBadgeString:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v11 isEqual:&stru_270CB9250])
  {

    id v10 = 0;
  }
  else
  {
    id v10 = v11;
  }
  id v12 = v10;
  [(UNCLocalNotificationRepository *)self _setBadgeValue:v10 forBundleIdentifier:v8 withCompletionHandler:v9];
}

uint64_t __103__UNCLocalNotificationRepository__badge_queue_setBadgeValue_forBundleIdentifier_withCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllNotificationRecordsForBundleIdentifier:", *(void *)(a1 + 40));
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_logNotification:(id)a3 forBundleIdentifier:(id)a4
{
  id v7 = a3;
  uint64_t v5 = (__CFString *)a4;
  if ([v7 shouldBadgeApplicationIcon]) {
    unsigned int v6 = [v7 hasBadge];
  }
  else {
    unsigned int v6 = 0;
  }
  if ([v7 shouldPlaySound] && objc_msgSend(v7, "hasSound")) {
    v6 |= 2u;
  }
  if ([v7 shouldPresentAlert] && objc_msgSend(v7, "hasAlertContent")) {
    v6 |= 4u;
  }
  UNCPowerLogUserNotificationRequestEvent(v5, v6);
}

- (void)_queue_performMigration
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(UNCLocalNotificationRepository *)self _queue_performMigrationForUserNotificationsStore];

  [(UNCLocalNotificationRepository *)self _queue_performMigrationForPushStore];
}

- (void)_queue_performMigrationForUserNotificationsStore
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = (void *)MEMORY[0x261221EF0]();
  id v4 = [(UNCKeyedDataStoreRepository *)self->_repository allKeys];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        id v11 = (void *)MEMORY[0x261221EF0](v6);
        -[UNCLocalNotificationRepository _queue_performMigrationForBundleIdentifier:](self, "_queue_performMigrationForBundleIdentifier:", v10, (void)v12);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v7 = v6;
    }
    while (v6);
  }
}

- (void)_queue_triggerInvalidationForFirstUnlock
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = (void *)MEMORY[0x261221EF0]();
  id v4 = [(UNCKeyedDataStoreRepository *)self->_repository allKeys];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[UNCKeyedObservable notifyObserversKey:usingBlock:](self->_observable, "notifyObserversKey:usingBlock:", MEMORY[0x263EF8330], 3221225472, __74__UNCLocalNotificationRepository__queue_triggerInvalidationForFirstUnlock__block_invoke, &unk_2655677A0, self, *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void __74__UNCLocalNotificationRepository__queue_triggerInvalidationForFirstUnlock__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 notificationRepository:*(void *)(a1 + 32) didDiscoverContentOnFirstUnlockForBundleIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)_queue_performMigrationForPushStore
{
  v25[3] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  uint64_t v4 = [v3 objectAtIndex:0];

  uint64_t v19 = (void *)v4;
  v25[0] = v4;
  v25[1] = @"SpringBoard";
  v25[2] = @"PushStore";
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
  id v5 = objc_msgSend(NSString, "pathWithComponents:");
  uint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v7 = [v6 contentsOfDirectoryAtPath:v5 error:0];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v14 = [v13 pathExtension];
        int v15 = [v14 isEqualToString:@"pushstore"];

        if (v15)
        {
          id v16 = (void *)MEMORY[0x261221EF0]();
          uint64_t v17 = [v5 stringByAppendingPathComponent:v13];
          [(UNCLocalNotificationRepository *)self _queue_performMigrationForPushStoreAtPath:v17];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
}

- (void)_queue_performMigrationForPushStoreAtPath:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [v4 lastPathComponent];
  uint64_t v6 = [v5 stringByDeletingPathExtension];

  if ([v6 length])
  {
    uint64_t v7 = *MEMORY[0x263F1E048];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E048], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migrating notification repository", (uint8_t *)&v8, 0xCu);
    }
    [(UNCKeyedDataStoreRepository *)self->_repository migrateStoreAtPath:v4 forKey:v6];
  }
  [(UNCLocalNotificationRepository *)self _queue_performMigrationForBundleIdentifier:v6];
}

- (void)_queue_performMigrationForBundleIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = [(UNCKeyedDataStoreRepository *)self->_repository objectsForKey:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = objc_msgSend(v5, "unc_map:usingLibrarian:", UNSNotificationRecordDictionaryMigration, self->_librarian);
    if (([v6 isEqualToArray:v7] & 1) == 0)
    {
      int v8 = (void *)*MEMORY[0x263F1E048];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E048], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = v8;
        int v10 = 138543618;
        id v11 = v4;
        __int16 v12 = 2048;
        uint64_t v13 = [v6 count];
        _os_log_impl(&dword_2608DB000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migrating notification repository (%ld)", (uint8_t *)&v10, 0x16u);
      }
      [(UNCKeyedDataStoreRepository *)self->_repository setObjects:v7 forKey:v4];
    }
  }
}

- (void)_queue_performValidation
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = (void *)MEMORY[0x261221EF0]();
  id v4 = [(UNCKeyedDataStoreRepository *)self->_repository allKeys];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v21;
    *(void *)&long long v7 = 138543362;
    long long v19 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        __int16 v12 = -[UNCKeyedDataStoreRepository objectsForKey:](self->_repository, "objectsForKey:", v11, v19);
        uint64_t v13 = v12;
        if (v12)
        {
          uint64_t v14 = objc_msgSend(v12, "bs_filter:", UNSNotificationRecordDictionaryValidation);
          if (([v13 isEqualToArray:v14] & 1) == 0)
          {
            int v15 = (void *)*MEMORY[0x263F1E048];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E048], OS_LOG_TYPE_DEFAULT))
            {
              id v16 = v15;
              uint64_t v17 = [v14 count];
              *(_DWORD *)buf = 138543618;
              uint64_t v25 = v11;
              __int16 v26 = 2048;
              uint64_t v27 = v17;
              _os_log_impl(&dword_2608DB000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Filtering notification repository (%ld)", buf, 0x16u);
            }
            [(UNCKeyedDataStoreRepository *)self->_repository setObjects:v14 forKey:v11];
          }
        }
        else
        {
          id v18 = *MEMORY[0x263F1E048];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E048], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            uint64_t v25 = v11;
            _os_log_error_impl(&dword_2608DB000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Error reading notification repository. Deleting file.", buf, 0xCu);
          }
          [(UNCKeyedDataStoreRepository *)self->_repository removeStoreForKey:v11];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v8);
  }
}

- (BOOL)_shouldPersistNotificationRecord:(id)a3 forBundleSettings:(id)a4 perTopicSettings:(id)a5
{
  v53[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 authorizationStatus])
  {
    if ([v8 authorizationStatus] == 2 || objc_msgSend(v8, "authorizationStatus") == 3)
    {
      int v10 = [v7 topicIdentifiers];
      uint64_t v11 = [v10 allObjects];

      id v40 = v11;
      if ([v11 count])
      {
        __int16 v12 = [v7 topicIdentifiers];
        uint64_t v13 = [v12 allObjects];
        uint64_t v14 = [MEMORY[0x263F1DF60] emptySettings];
        int v15 = [v9 objectsForKeys:v13 notFoundMarker:v14];
      }
      else if (v8)
      {
        v53[0] = v8;
        int v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:1];
      }
      else
      {
        int v15 = 0;
      }
      id v41 = v9;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v24 = v15;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v52 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        LOBYTE(v20) = 0;
        uint64_t v27 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v43 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            BOOL v30 = [v29 authorizationStatus] == 2 || objc_msgSend(v8, "authorizationStatus") == 3;
            uint64_t v31 = [v29 notificationCenterSetting];
            uint64_t v32 = [v29 lockScreenSetting];
            LODWORD(v20) = (v20 & 1) != 0 || (v31 == 2 || v32 == 2) && v30;
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v42 objects:v52 count:16];
        }
        while (v26);
      }
      else
      {
        LODWORD(v20) = 0;
      }

      id v34 = (void *)*MEMORY[0x263F1E030];
      id v9 = v41;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
      {
        id v35 = v34;
        id v36 = [v7 identifier];
        int v37 = objc_msgSend(v36, "un_logDigest");
        uint64_t v38 = [v24 count];
        *(_DWORD *)buf = 138543874;
        long long v47 = v37;
        __int16 v48 = 1024;
        int v49 = v20;
        __int16 v50 = 2048;
        uint64_t v51 = v38;
        _os_log_impl(&dword_2608DB000, v35, OS_LOG_TYPE_DEFAULT, "[Persisting notification %{public}@: %d [applicableSettings: %lu]", buf, 0x1Cu);
      }
    }
    else
    {
      long long v21 = (void *)*MEMORY[0x263F1E030];
      LOBYTE(v20) = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
      {
        long long v22 = v21;
        uint64_t v20 = [v7 identifier];
        long long v23 = objc_msgSend((id)v20, "un_logDigest");
        *(_DWORD *)buf = 138543362;
        long long v47 = v23;
        _os_log_impl(&dword_2608DB000, v22, OS_LOG_TYPE_DEFAULT, "[Not persisting notification %{public}@ because bundle is not authorized", buf, 0xCu);

        LOBYTE(v20) = 0;
      }
    }
  }
  else
  {
    id v16 = (void *)*MEMORY[0x263F1E030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E030], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v16;
      id v18 = [v7 identifier];
      long long v19 = objc_msgSend(v18, "un_logDigest");
      *(_DWORD *)buf = 138543362;
      long long v47 = v19;
      _os_log_impl(&dword_2608DB000, v17, OS_LOG_TYPE_DEFAULT, "[Provisionally allowing persisting notification %{public}@ because bundle settings are not available", buf, 0xCu);
    }
    LOBYTE(v20) = 1;
  }

  return v20;
}

- (UNCNotificationRepositoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UNCNotificationRepositoryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UNCNotificationRepositorySettingsProvider)settingsProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_settingsProvider);

  return (UNCNotificationRepositorySettingsProvider *)WeakRetained;
}

- (void)setSettingsProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_settingsProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_categoryRepository, 0);
  objc_storeStrong((id *)&self->_badgeService, 0);
  objc_storeStrong((id *)&self->_librarian, 0);
  objc_storeStrong((id *)&self->_badgeServiceQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_unlimitedBodyBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_observable, 0);

  objc_storeStrong((id *)&self->_repository, 0);
}

- (void)saveNotificationRecord:(os_log_t)log targetRevisionNumber:shouldRepost:forBundleIdentifier:withCompletionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2608DB000, log, OS_LOG_TYPE_ERROR, "Not delivering user visible notification because notification is nil", v1, 2u);
}

- (void)saveNotificationRecord:(void *)a1 targetRevisionNumber:(void *)a2 shouldRepost:forBundleIdentifier:withCompletionHandler:.cold.2(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = [a2 identifier];
  id v5 = objc_msgSend(v4, "un_logDigest");
  int v6 = 138543362;
  id v7 = v5;
  _os_log_error_impl(&dword_2608DB000, v3, OS_LOG_TYPE_ERROR, "Not delivering user visible notification %{public}@ because bundleID is nil", (uint8_t *)&v6, 0xCu);
}

- (void)saveNotificationRecord:(void *)a3 targetRevisionNumber:shouldRepost:forBundleIdentifier:withCompletionHandler:.cold.3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  int v6 = [a3 identifier];
  id v7 = objc_msgSend(v6, "un_logDigest");
  int v8 = 138543618;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_2608DB000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Not delivering user visible notification %{public}@ because date is nil", (uint8_t *)&v8, 0x16u);
}

@end