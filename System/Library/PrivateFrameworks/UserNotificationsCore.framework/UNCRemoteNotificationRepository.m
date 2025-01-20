@interface UNCRemoteNotificationRepository
- (UNCRemoteNotificationRepository)initWithServiceClient:(id)a3;
- (id)_coreServiceClientOrNilWithWarningForSelector:(SEL)a3;
- (id)allBundleIdentifiers;
- (id)badgeNumberForBundleIdentifier:(id)a3;
- (id)notificationRecordForIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (id)notificationRecordsForBundleIdentifier:(id)a3;
- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)notifyDidDiscoverContentOnFirstUnlockForBundleIdentifier:(id)a3;
- (void)notifyDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4;
- (void)removeAllNotificationRecordsForBundleIdentifier:(id)a3;
- (void)removeInvalidNotificationRecordsForBundleIdentifier:(id)a3;
- (void)removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4;
- (void)removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(id)a3;
- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4;
- (void)removeSimilarNotificationRecords:(id)a3 bundleIdentifier:(id)a4;
- (void)removeStoreForBundleIdentifier:(id)a3;
- (void)saveNotificationRecord:(id)a3 shouldRepost:(BOOL)a4 forBundleIdentifier:(id)a5 withCompletionHandler:(id)a6;
- (void)saveNotificationRecord:(id)a3 targetRevisionNumber:(id)a4 shouldRepost:(BOOL)a5 forBundleIdentifier:(id)a6 withCompletionHandler:(id)a7;
- (void)saveNotificationRequest:(id)a3 shouldRepost:(BOOL)a4 apsMessageTimestamp:(id)a5 forBundleIdentifier:(id)a6;
- (void)saveNotificationRequest:(id)a3 shouldRepost:(BOOL)a4 withMessage:(id)a5 forBundleIdentifier:(id)a6;
- (void)setBadgeCount:(int64_t)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation UNCRemoteNotificationRepository

- (UNCRemoteNotificationRepository)initWithServiceClient:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UNCRemoteNotificationRepository;
  v6 = [(UNCRemoteNotificationRepository *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceClient, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.UserNotificationsCore.UNCRemoteNotificationRepository", v8);

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.UserNotificationsCore.UNCRemoteNotificationRepository.call-out", v10);

    v12 = [[UNCKeyedObservable alloc] initWithQueue:v9 callOutQueue:v11];
    observable = v7->_observable;
    v7->_observable = v12;
  }
  return v7;
}

- (void)notifyDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  observable = self->_observable;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__UNCRemoteNotificationRepository_notifyDidPerformUpdates_forBundleIdentifier___block_invoke;
  v11[3] = &unk_265567778;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(UNCKeyedObservable *)observable notifyObserversKey:v9 usingBlock:v11];
}

uint64_t __79__UNCRemoteNotificationRepository_notifyDidPerformUpdates_forBundleIdentifier___block_invoke(void *a1, void *a2)
{
  return [a2 notificationRepository:a1[4] didPerformUpdates:a1[5] forBundleIdentifier:a1[6]];
}

- (void)notifyDidDiscoverContentOnFirstUnlockForBundleIdentifier:(id)a3
{
  id v4 = a3;
  observable = self->_observable;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __92__UNCRemoteNotificationRepository_notifyDidDiscoverContentOnFirstUnlockForBundleIdentifier___block_invoke;
  v7[3] = &unk_2655677A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(UNCKeyedObservable *)observable notifyObserversKey:v6 usingBlock:v7];
}

void __92__UNCRemoteNotificationRepository_notifyDidDiscoverContentOnFirstUnlockForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 notificationRepository:*(void *)(a1 + 32) didDiscoverContentOnFirstUnlockForBundleIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
{
}

- (void)removeObserver:(id)a3 forBundleIdentifier:(id)a4
{
}

- (id)allBundleIdentifiers
{
  v2 = [(UNCRemoteNotificationRepository *)self _coreServiceClientOrNilWithWarningForSelector:a2];
  id v3 = [v2 allBundleIdentifiersForNotifications];

  return v3;
}

- (id)notificationRecordsForBundleIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [(UNCRemoteNotificationRepository *)self _coreServiceClientOrNilWithWarningForSelector:a2];
  id v7 = [v6 notificationRecordsForBundleIdentifier:v5];

  return v7;
}

- (id)notificationRecordForIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(UNCRemoteNotificationRepository *)self _coreServiceClientOrNilWithWarningForSelector:a2];
  id v10 = [v9 notificationRecordForIdentifier:v8 bundleIdentifier:v7];

  return v10;
}

- (void)saveNotificationRecord:(id)a3 shouldRepost:(BOOL)a4 forBundleIdentifier:(id)a5 withCompletionHandler:(id)a6
{
  BOOL v7 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [(UNCRemoteNotificationRepository *)self _coreServiceClientOrNilWithWarningForSelector:a2];
  [v14 saveNotificationRecord:v13 targetRevisionNumber:0 shouldRepost:v7 forBundleIdentifier:v12 completionHandler:v11];
}

- (void)saveNotificationRecord:(id)a3 targetRevisionNumber:(id)a4 shouldRepost:(BOOL)a5 forBundleIdentifier:(id)a6 withCompletionHandler:(id)a7
{
  BOOL v8 = a5;
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(UNCRemoteNotificationRepository *)self _coreServiceClientOrNilWithWarningForSelector:a2];
  [v17 saveNotificationRecord:v16 targetRevisionNumber:v15 shouldRepost:v8 forBundleIdentifier:v14 completionHandler:v13];
}

- (void)saveNotificationRequest:(id)a3 shouldRepost:(BOOL)a4 withMessage:(id)a5 forBundleIdentifier:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = [a5 timestamp];
  [(UNCRemoteNotificationRepository *)self saveNotificationRequest:v11 shouldRepost:v7 apsMessageTimestamp:v12 forBundleIdentifier:v10];
}

- (void)saveNotificationRequest:(id)a3 shouldRepost:(BOOL)a4 apsMessageTimestamp:(id)a5 forBundleIdentifier:(id)a6
{
  BOOL v7 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [(UNCRemoteNotificationRepository *)self _coreServiceClientOrNilWithWarningForSelector:a2];
  [v14 saveNotificationRequest:v13 shouldRepost:v7 apsMessageTimestamp:v12 forBundleIdentifier:v11];
}

- (void)removeNotificationRecordsForIdentifiers:(id)a3 bundleIdentifier:(id)a4
{
  serviceClient = self->_serviceClient;
  id v6 = a4;
  id v7 = [a3 allObjects];
  [(UNCNotificationCommonServiceServerProtocol *)serviceClient removeNotificationRecordsForIdentifiers:v7 bundleIdentifier:v6];
}

- (void)removeSimilarNotificationRecords:(id)a3 bundleIdentifier:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(UNCRemoteNotificationRepository *)self _coreServiceClientOrNilWithWarningForSelector:a2];
  [v9 removeSimilarNotificationRecords:v8 forBundleIdentifier:v7];
}

- (void)removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [(UNCRemoteNotificationRepository *)self _coreServiceClientOrNilWithWarningForSelector:a2];
  [v6 removeNotificationRecordsWithNonPushTriggerForBundleIdentifier:v5];
}

- (void)removeInvalidNotificationRecordsForBundleIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [(UNCRemoteNotificationRepository *)self _coreServiceClientOrNilWithWarningForSelector:a2];
  [v6 removeInvalidNotificationRecordsForBundleIdentifier:v5];
}

- (void)removeAllNotificationRecordsForBundleIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [(UNCRemoteNotificationRepository *)self _coreServiceClientOrNilWithWarningForSelector:a2];
  [v6 removeAllNotificationRecordsForBundleIdentifier:v5];
}

- (void)removeStoreForBundleIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [(UNCRemoteNotificationRepository *)self _coreServiceClientOrNilWithWarningForSelector:a2];
  [v6 removeStoreForBundleIdentifier:v5];
}

- (id)badgeNumberForBundleIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = [(UNCRemoteNotificationRepository *)self _coreServiceClientOrNilWithWarningForSelector:a2];
  id v7 = [v6 badgeNumberForBundleIdentifier:v5];

  return v7;
}

- (void)setBadgeNumber:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(UNCRemoteNotificationRepository *)self _coreServiceClientOrNilWithWarningForSelector:a2];
  [v12 setBadgeNumber:v11 forBundleIdentifier:v10 completionHandler:v9];
}

- (void)setBadgeCount:(int64_t)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = [(UNCRemoteNotificationRepository *)self _coreServiceClientOrNilWithWarningForSelector:a2];
  [v11 setBadgeCount:a3 forBundleIdentifier:v10 completionHandler:v9];
}

- (void)setBadgeString:(id)a3 forBundleIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(UNCRemoteNotificationRepository *)self _coreServiceClientOrNilWithWarningForSelector:a2];
  [v12 setBadgeString:v11 forBundleIdentifier:v10 completionHandler:v9];
}

- (id)_coreServiceClientOrNilWithWarningForSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector())
  {
    id v5 = self->_serviceClient;
  }
  else
  {
    id v7 = NSStringFromSelector(a3);
    UNLogToDeveloper();

    id v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observable, 0);

  objc_storeStrong((id *)&self->_serviceClient, 0);
}

@end