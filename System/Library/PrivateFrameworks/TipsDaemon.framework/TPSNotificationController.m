@interface TPSNotificationController
+ (BOOL)alwaysDisplayCollectionIcon;
+ (BOOL)isValidNotificationInterval;
+ (BOOL)respectsOptOut;
+ (BOOL)supportsExtension;
+ (BOOL)supportsNotification;
+ (BOOL)supportsRemoteIcon;
+ (BOOL)supportsWelcomeNotification;
+ (double)standardNotificationInterval;
+ (id)cacheDirectoryCreateIfEmpty:(BOOL)a3;
+ (id)displayDarwinNotificationKey;
+ (int64_t)remainingCountOfNotificationsUntilOptOut;
+ (int64_t)softOptOutNotificationCount;
+ (void)removeAssetCacheDirectory;
+ (void)removeNotificationCache;
- (BOOL)canUpdateHintEligibilityForIdentifier:(id)a3;
- (BOOL)collectionEligibleForNotification:(id)a3;
- (BOOL)isDocumentHintDisplayedOnOtherDevices:(id)a3;
- (BOOL)isNotificationDeliveryInfoValid:(id)a3 identifier:(id)a4 overrideOptOutContentOnly:(BOOL)a5 ignoreSuppressContent:(BOOL)a6;
- (BOOL)isNotificationSettingValid;
- (BOOL)isSoftOptedOut;
- (BOOL)preconditionValidForIdentifier:(id)a3 documentDeliveryInfoMap:(id)a4 deliveryInfoMap:(id)a5 overrideOptOutContentOnly:(BOOL)a6 ignoreSuppressContent:(BOOL)a7;
- (BOOL)shouldDisplayCollectionIcon;
- (BOOL)updateHintEligibleForTip:(id)a3 isValid:(BOOL)a4;
- (NSBundle)frameworkBundle;
- (NSMutableDictionary)assetURLSessionMap;
- (NSMutableDictionary)registeredWakingEventMap;
- (OS_dispatch_queue)syncQueue;
- (TPSEventsProviderManager)eventsProviderManager;
- (TPSLocalNotificationController)localNotificationController;
- (TPSNotificationCache)notificationCache;
- (TPSNotificationController)init;
- (TPSNotificationControllerDelegate)delegate;
- (id)assetsConfigurationForDocument:(id)a3;
- (id)cacheAssetFileURLForDocument:(id)a3;
- (id)cacheFilePathForFile:(id)a3;
- (id)copyFileURL:(id)a3 cachePath:(id)a4;
- (id)documentToNotifyForCollection:(id)a3 collectionDeliveryInfoMap:(id)a4 deliveryInfoMap:(id)a5 overrideOptOutContentOnly:(BOOL)a6;
- (id)documentToNotifyForTipsInCollection:(id)a3 tipMap:(id)a4 tipDeliveryInfoMap:(id)a5 deliveryInfoMap:(id)a6 overrideOptOutContentOnly:(BOOL)a7;
- (id)notificationDeliveryInfoForIdentifier:(id)a3 documentDeliveryIdentifierMap:(id)a4 deliveryInfoMap:(id)a5;
- (id)tipDocumentToNotifyWithIdentifier:(id)a3 tipMap:(id)a4 tipDeliveryInfoMap:(id)a5 deliveryInfoMap:(id)a6 overrideOptOutContentOnly:(BOOL)a7;
- (id)updateNotificationCacheWithCollectionIdentifier:(id)a3 document:(id)a4 type:(unint64_t)a5 extensionPayload:(id)a6;
- (int64_t)notificationCount;
- (void)_registerWakingEvents;
- (void)_unregisterAllWakingEvents;
- (void)_updateNotificationCache;
- (void)_updateWakingEventMapCache;
- (void)clearNotificationCache;
- (void)clearNotificationCount;
- (void)dataProviderManager:(id)a3 didReceiveCallbackWithResult:(id)a4 type:(int64_t)a5;
- (void)fetchNotificationAssetIfNeededCompletionHandler:(id)a3;
- (void)increaseUserNotificationCount;
- (void)registerWakingEventsForDeliveryIdentifierMap:(id)a3 deliveryInfoMap:(id)a4;
- (void)removeAllNotifications;
- (void)removeNotificationWithIdentifier:(id)a3;
- (void)setAssetURLSessionMap:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEventsProviderManager:(id)a3;
- (void)setFrameworkBundle:(id)a3;
- (void)setLocalNotificationController:(id)a3;
- (void)setNotificationCache:(id)a3;
- (void)setNotificationCount:(int64_t)a3;
- (void)setRegisteredWakingEventMap:(id)a3;
- (void)setSyncQueue:(id)a3;
- (void)showNotificationWithCompletionHandler:(id)a3;
- (void)updateDocumentToNotifyWithPreferredIdentifiers:(id)a3 collectionOrder:(id)a4 collectionMap:(id)a5 collectionDeliveryIdentifierMap:(id)a6 tipMap:(id)a7 tipsDeliveryIdentifierMap:(id)a8 deliveryInfoMap:(id)a9 documentDictionaryMap:(id)a10 metadataDictionary:(id)a11 completionHandler:(id)a12;
- (void)updateLastNotificationDate;
- (void)updateNotificationCount;
- (void)updateNotificationRegistrationEventsWithCollectionDeliveryIdentifierMap:(id)a3 tipsDeliveryIdentifierMap:(id)a4 deliveryInfoMap:(id)a5 completionHandler:(id)a6;
@end

@implementation TPSNotificationController

- (BOOL)isNotificationSettingValid
{
  return [(TPSLocalNotificationController *)self->_localNotificationController isNotificationSettingValid];
}

+ (BOOL)supportsWelcomeNotification
{
  return 1;
}

- (void)clearNotificationCount
{
  [(TPSNotificationController *)self setNotificationCount:0];

  [(TPSNotificationController *)self updateNotificationCount];
}

- (void)setNotificationCount:(int64_t)a3
{
  self->_notificationCount = a3;
}

- (void)clearNotificationCache
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 notificationCache];
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "Clear notification cache %@", (uint8_t *)&v4, 0xCu);
}

- (TPSNotificationCache)notificationCache
{
  return self->_notificationCache;
}

+ (BOOL)supportsNotification
{
  return 1;
}

+ (BOOL)isValidNotificationInterval
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  +[TPSNotificationController standardNotificationInterval];
  if (v2 <= 0.0) {
    return 1;
  }
  double v3 = v2;
  int v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v5 = [v4 objectForKey:@"TPSLastNotificationDate"];

  [v5 timeIntervalSinceNow];
  double v7 = v6;
  BOOL v8 = fabs(v6) > v3 || v6 >= 0.0;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4FAF480] data];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218240;
      double v12 = v7;
      __int16 v13 = 2048;
      double v14 = v3;
      _os_log_impl(&dword_1E4492000, v9, OS_LOG_TYPE_DEFAULT, "Last notification interval: %f is less than expected interval %f", (uint8_t *)&v11, 0x16u);
    }
  }
  return v8;
}

- (void)updateNotificationCount
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v4 = [MEMORY[0x1E4FAF480] daemon];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    int64_t v8 = [(TPSNotificationController *)self notificationCount];
    _os_log_impl(&dword_1E4492000, v4, OS_LOG_TYPE_DEFAULT, "Consecutive notification ignore count %zd", (uint8_t *)&v7, 0xCu);
  }

  if ([(TPSNotificationController *)self isSoftOptedOut])
  {
    v5 = [MEMORY[0x1E4FAF480] daemon];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v6 = +[TPSNotificationController softOptOutNotificationCount];
      int v7 = 134217984;
      int64_t v8 = v6;
      _os_log_impl(&dword_1E4492000, v5, OS_LOG_TYPE_DEFAULT, "User hasn't launch the app after %ld notifications. Will only look for override opt-out notifications next time.", (uint8_t *)&v7, 0xCu);
    }
  }
  objc_msgSend(v3, "setInteger:forKey:", -[TPSNotificationController notificationCount](self, "notificationCount"), @"ConsecutiveNotificationsCount");
  [v3 synchronize];
}

- (int64_t)notificationCount
{
  return self->_notificationCount;
}

+ (double)standardNotificationInterval
{
  double v2 = [MEMORY[0x1E4FAF450] standardNotificationInterval];
  double v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 259200.0;
  }

  return v5;
}

+ (int64_t)softOptOutNotificationCount
{
  return 3;
}

+ (BOOL)alwaysDisplayCollectionIcon
{
  return 0;
}

+ (BOOL)respectsOptOut
{
  return 1;
}

+ (BOOL)supportsExtension
{
  return 1;
}

+ (BOOL)supportsRemoteIcon
{
  return 0;
}

+ (id)displayDarwinNotificationKey
{
  return @"com.apple.springboard.lockNotificationListEmptyAtScreenOn";
}

+ (int64_t)remainingCountOfNotificationsUntilOptOut
{
  if (!+[TPSNotificationController respectsOptOut]) {
    return -1;
  }
  double v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  double v3 = [v2 objectForKey:@"ConsecutiveNotificationsCount"];
  int v4 = [v3 intValue];

  return +[TPSNotificationController softOptOutNotificationCount]- v4;
}

+ (id)cacheDirectoryCreateIfEmpty:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  if (![v4 count])
  {
    int64_t v6 = 0;
    goto LABEL_11;
  }
  double v5 = [v4 firstObject];
  int64_t v6 = [v5 stringByAppendingPathComponent:@"com.apple.TipsDaemon"];

  if (!v6) {
    goto LABEL_11;
  }
  int v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v7 fileExistsAtPath:v6] & 1) == 0)
  {
    if (!v3)
    {

      goto LABEL_9;
    }
    id v11 = 0;
    [v7 createDirectoryAtPath:v6 withIntermediateDirectories:0 attributes:0 error:&v11];
    id v8 = v11;
    if (v8)
    {
      uint64_t v9 = v8;

LABEL_9:
      int64_t v6 = 0;
    }
  }

LABEL_11:

  return v6;
}

+ (void)removeAssetCacheDirectory
{
  double v2 = +[TPSNotificationController cacheDirectoryCreateIfEmpty:0];
  if (v2)
  {
    id v9 = v2;
    BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v4 = [v3 enumeratorAtPath:v9];
    uint64_t v5 = [v4 nextObject];
    if (v5)
    {
      int64_t v6 = (void *)v5;
      do
      {
        int v7 = [v9 stringByAppendingPathComponent:v6];
        if (v7) {
          [v3 removeItemAtPath:v7 error:0];
        }

        uint64_t v8 = [v4 nextObject];

        int64_t v6 = (void *)v8;
      }
      while (v8);
    }

    double v2 = v9;
  }
}

+ (void)removeNotificationCache
{
  [MEMORY[0x1E4FAF4B0] archivedDataWithRootObject:0 forKey:@"NotificationCache"];
  double v2 = (void *)MEMORY[0x1E4FAF4B0];

  [v2 archivedDataWithRootObject:0 forKey:@"RegisteredWakingEventMapKey"];
}

- (TPSNotificationController)init
{
  v27.receiver = self;
  v27.super_class = (Class)TPSNotificationController;
  double v2 = [(TPSNotificationController *)&v27 init];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v4 = [MEMORY[0x1E4FAF4B0] unarchivedObjectOfClass:objc_opt_class() forKey:@"NotificationCache"];
    notificationCache = v2->_notificationCache;
    v2->_notificationCache = (TPSNotificationCache *)v4;

    int64_t v6 = [v3 objectForKey:@"ConsecutiveNotificationsCount"];
    v2->_notificationCount = (int)[v6 intValue];

    int v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.tips.TPSNotificationController", v7);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    assetURLSessionMap = v2->_assetURLSessionMap;
    v2->_assetURLSessionMap = (NSMutableDictionary *)v10;

    double v12 = (TPSEventsProviderManager *)objc_alloc_init(MEMORY[0x1E4FAF468]);
    eventsProviderManager = v2->_eventsProviderManager;
    v2->_eventsProviderManager = v12;

    [(TPSEventsProviderManager *)v2->_eventsProviderManager setDelegate:v2];
    double v14 = [TPSUserNotificationController alloc];
    uint64_t v15 = [MEMORY[0x1E4FAF3F8] notificationBundleIdentifier];
    uint64_t v16 = [(TPSUserNotificationController *)v14 initWithBundleIdentifier:v15];
    localNotificationController = v2->_localNotificationController;
    v2->_localNotificationController = (TPSLocalNotificationController *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
    uint64_t v22 = [MEMORY[0x1E4FAF4B0] unarchivedObjectOfClasses:v21 forKey:@"RegisteredWakingEventMapKey"];
    registeredWakingEventMap = v2->_registeredWakingEventMap;
    v2->_registeredWakingEventMap = (NSMutableDictionary *)v22;

    if (v2->_registeredWakingEventMap)
    {
      [(TPSNotificationController *)v2 _registerWakingEvents];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
      v25 = v2->_registeredWakingEventMap;
      v2->_registeredWakingEventMap = (NSMutableDictionary *)v24;
    }
    if ([MEMORY[0x1E4FAF450] resetDaemonData]) {
      [(TPSNotificationController *)v2 clearNotificationCount];
    }
  }
  return v2;
}

- (NSBundle)frameworkBundle
{
  frameworkBundle = self->_frameworkBundle;
  if (!frameworkBundle)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v5 = self->_frameworkBundle;
    self->_frameworkBundle = v4;

    frameworkBundle = self->_frameworkBundle;
  }

  return frameworkBundle;
}

- (void)updateDocumentToNotifyWithPreferredIdentifiers:(id)a3 collectionOrder:(id)a4 collectionMap:(id)a5 collectionDeliveryIdentifierMap:(id)a6 tipMap:(id)a7 tipsDeliveryIdentifierMap:(id)a8 deliveryInfoMap:(id)a9 documentDictionaryMap:(id)a10 metadataDictionary:(id)a11 completionHandler:(id)a12
{
  v118[1] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v59 = a5;
  id v52 = a6;
  id v58 = a7;
  id v53 = a8;
  uint64_t v19 = v18;
  id v54 = a9;
  id v55 = a10;
  id v56 = a11;
  v57 = (void (**)(id, TPSNotificationCache *))a12;
  uint64_t v20 = [MEMORY[0x1E4FAF480] data];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4492000, v20, OS_LOG_TYPE_DEFAULT, "Checking document to notify.", buf, 2u);
  }

  if ([v18 count] && objc_msgSend(v59, "count") || objc_msgSend(v58, "count"))
  {
    *(void *)buf = 0;
    v113 = buf;
    uint64_t v114 = 0x3032000000;
    v115 = __Block_byref_object_copy__10;
    v116 = __Block_byref_object_dispose__10;
    id v117 = 0;
    uint64_t v106 = 0;
    v107 = &v106;
    uint64_t v108 = 0x3032000000;
    v109 = __Block_byref_object_copy__10;
    v110 = __Block_byref_object_dispose__10;
    id v111 = 0;
    uint64_t v100 = 0;
    v101 = &v100;
    uint64_t v102 = 0x3032000000;
    v103 = __Block_byref_object_copy__10;
    v104 = __Block_byref_object_dispose__10;
    id v105 = 0;
    BOOL v51 = [(TPSNotificationController *)self isSoftOptedOut];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __246__TPSNotificationController_updateDocumentToNotifyWithPreferredIdentifiers_collectionOrder_collectionMap_collectionDeliveryIdentifierMap_tipMap_tipsDeliveryIdentifierMap_deliveryInfoMap_documentDictionaryMap_metadataDictionary_completionHandler___block_invoke;
    aBlock[3] = &unk_1E6E6C410;
    v97 = buf;
    v98 = &v106;
    v99 = &v100;
    id v94 = v55;
    id v95 = v56;
    id v17 = v17;
    id v96 = v17;
    v21 = _Block_copy(aBlock);
    uint64_t v22 = [MEMORY[0x1E4FAF450] notificationDocument];
    v50 = (void *)v22;
    if (v22)
    {
      v118[0] = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:1];
      uint64_t v24 = [v23 arrayByAddingObjectsFromArray:v17];

      id v17 = (id)v24;
    }
    uint64_t v89 = 0;
    v90 = &v89;
    uint64_t v91 = 0x2020000000;
    uint64_t v92 = 0;
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __246__TPSNotificationController_updateDocumentToNotifyWithPreferredIdentifiers_collectionOrder_collectionMap_collectionDeliveryIdentifierMap_tipMap_tipsDeliveryIdentifierMap_deliveryInfoMap_documentDictionaryMap_metadataDictionary_completionHandler___block_invoke_2;
    v77[3] = &unk_1E6E6C438;
    id v25 = v59;
    v85 = &v106;
    id v78 = v25;
    v79 = self;
    id v26 = v52;
    id v80 = v26;
    id v27 = v54;
    id v81 = v27;
    BOOL v88 = v51;
    id v28 = v58;
    id v82 = v28;
    id v29 = v53;
    id v83 = v29;
    id v30 = v21;
    id v84 = v30;
    v86 = buf;
    v87 = &v89;
    [v17 enumerateObjectsUsingBlock:v77];
    if (![v17 count])
    {
      v31 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v32 = [v31 objectForKey:@"LastNotifiedCollectionIdentifier"];
      v33 = (void *)*((void *)v113 + 5);
      *((void *)v113 + 5) = v32;

      if (!*((void *)v113 + 5)) {
        goto LABEL_12;
      }
      unint64_t v34 = objc_msgSend(v19, "indexOfObject:");
      uint64_t v35 = [v19 count];
      if (v34 >= v35 - 1) {
        goto LABEL_12;
      }
      unint64_t v36 = v34 + 1;
      v37 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v34 + 1, v35 - (v34 + 1));
      v49 = [v19 objectsAtIndexes:v37];

      v38 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v36);
      v39 = [v19 objectsAtIndexes:v38];

      v40 = [MEMORY[0x1E4F1CA48] arrayWithArray:v49];
      [v40 addObjectsFromArray:v39];

      if (!v40)
      {
LABEL_12:
        v40 = [MEMORY[0x1E4F1CA48] arrayWithArray:v19];
      }
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __246__TPSNotificationController_updateDocumentToNotifyWithPreferredIdentifiers_collectionOrder_collectionMap_collectionDeliveryIdentifierMap_tipMap_tipsDeliveryIdentifierMap_deliveryInfoMap_documentDictionaryMap_metadataDictionary_completionHandler___block_invoke_3;
      v69[3] = &unk_1E6E6C460;
      id v41 = v25;
      v74 = &v106;
      id v70 = v41;
      v71 = self;
      id v72 = v26;
      id v42 = v27;
      BOOL v76 = v51;
      id v73 = v42;
      v75 = buf;
      [v40 enumerateObjectsUsingBlock:v69];
      if (!v107[5])
      {
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __246__TPSNotificationController_updateDocumentToNotifyWithPreferredIdentifiers_collectionOrder_collectionMap_collectionDeliveryIdentifierMap_tipMap_tipsDeliveryIdentifierMap_deliveryInfoMap_documentDictionaryMap_metadataDictionary_completionHandler___block_invoke_4;
        v61[3] = &unk_1E6E6C488;
        id v62 = v41;
        v63 = self;
        id v64 = v28;
        id v65 = v29;
        id v66 = v42;
        BOOL v68 = v51;
        id v67 = v30;
        [v40 enumerateObjectsUsingBlock:v61];
      }
    }
    uint64_t v43 = *((void *)v113 + 5);
    uint64_t v44 = v107[5];
    uint64_t v45 = v90[3];
    v46 = (void *)[(id)v101[5] copy];
    id v47 = [(TPSNotificationController *)self updateNotificationCacheWithCollectionIdentifier:v43 document:v44 type:v45 extensionPayload:v46];

    v57[2](v57, self->_notificationCache);
    _Block_object_dispose(&v89, 8);

    _Block_object_dispose(&v100, 8);
    _Block_object_dispose(&v106, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v48 = [MEMORY[0x1E4FAF480] data];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4492000, v48, OS_LOG_TYPE_DEFAULT, "No collections or tips available.", buf, 2u);
    }

    [(TPSNotificationController *)self clearNotificationCache];
    v57[2](v57, self->_notificationCache);
  }
}

void __246__TPSNotificationController_updateDocumentToNotifyWithPreferredIdentifiers_collectionOrder_collectionMap_collectionDeliveryIdentifierMap_tipMap_tipsDeliveryIdentifierMap_deliveryInfoMap_documentDictionaryMap_metadataDictionary_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v25 = a2;
  id v7 = a3;
  dispatch_queue_t v8 = [v7 identifier];
  id v9 = v8;
  if (!v8)
  {
    BOOL v3 = [v25 collectionIdentifiers];
    id v9 = [v3 firstObject];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v9);
  if (!v8)
  {
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  if (([v25 isIntro] & 1) == 0 && (objc_msgSend(v25, "isOutro") & 1) == 0)
  {
    if (+[TPSNotificationController supportsExtension])
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
      uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
      double v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      __int16 v13 = *(void **)(a1 + 32);
      double v14 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) identifier];
      uint64_t v15 = [v13 objectForKeyedSubscript:v14];
      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v15 forKeyedSubscript:*MEMORY[0x1E4FAF550]];

      [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x1E4FAF570]];
      if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count] != 2)
      {
        uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
        id v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = 0;
      }
    }
  }
  if (([*(id *)(a1 + 48) containsObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)] & 1) != 0
    || +[TPSNotificationController alwaysDisplayCollectionIcon])
  {
    id v18 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) notification];
    uint64_t v19 = [v18 assets];

    if (!v19)
    {
      uint64_t v20 = [v7 tileAssets];
      v21 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) notification];
      [v21 setAssets:v20];

      if (+[TPSNotificationController supportsRemoteIcon])
      {
        uint64_t v22 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) assetFileInfoManager];
        v23 = [v7 assetFileInfoManager];
        uint64_t v24 = [v23 fileMap];
        [v22 addNewAssetInfoFromFileMap:v24];
      }
    }
  }
}

void __246__TPSNotificationController_updateDocumentToNotifyWithPreferredIdentifiers_collectionOrder_collectionMap_collectionDeliveryIdentifierMap_tipMap_tipsDeliveryIdentifierMap_deliveryInfoMap_documentDictionaryMap_metadataDictionary_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  int64_t v6 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  uint64_t v7 = [*(id *)(a1 + 40) documentToNotifyForCollection:v6 collectionDeliveryInfoMap:*(void *)(a1 + 48) deliveryInfoMap:*(void *)(a1 + 56) overrideOptOutContentOnly:*(unsigned __int8 *)(a1 + 112)];
  uint64_t v8 = *(void *)(*(void *)(a1 + 88) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
  {
    uint64_t v10 = [v6 identifier];
    uint64_t v11 = *(void *)(*(void *)(a1 + 96) + 8);
    double v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    double v12 = [*(id *)(a1 + 40) tipDocumentToNotifyWithIdentifier:v13 tipMap:*(void *)(a1 + 64) tipDeliveryInfoMap:*(void *)(a1 + 72) deliveryInfoMap:*(void *)(a1 + 56) overrideOptOutContentOnly:*(unsigned __int8 *)(a1 + 112)];
    if (v12) {
      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    }
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 2;
    *a4 = 1;
  }
}

void __246__TPSNotificationController_updateDocumentToNotifyWithPreferredIdentifiers_collectionOrder_collectionMap_collectionDeliveryIdentifierMap_tipMap_tipsDeliveryIdentifierMap_deliveryInfoMap_documentDictionaryMap_metadataDictionary_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 40), "documentToNotifyForCollection:collectionDeliveryInfoMap:deliveryInfoMap:overrideOptOutContentOnly:");
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v9 = [v12 identifier];
    uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

void __246__TPSNotificationController_updateDocumentToNotifyWithPreferredIdentifiers_collectionOrder_collectionMap_collectionDeliveryIdentifierMap_tipMap_tipsDeliveryIdentifierMap_deliveryInfoMap_documentDictionaryMap_metadataDictionary_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  uint64_t v6 = objc_msgSend(*(id *)(a1 + 40), "documentToNotifyForTipsInCollection:tipMap:tipDeliveryInfoMap:deliveryInfoMap:overrideOptOutContentOnly:");
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    *a4 = 1;
  }
}

- (void)updateNotificationRegistrationEventsWithCollectionDeliveryIdentifierMap:(id)a3 tipsDeliveryIdentifierMap:(id)a4 deliveryInfoMap:(id)a5 completionHandler:(id)a6
{
  id v12 = (void (**)(id, void))a6;
  id v10 = a5;
  id v11 = a4;
  [(TPSNotificationController *)self registerWakingEventsForDeliveryIdentifierMap:a3 deliveryInfoMap:v10];
  [(TPSNotificationController *)self registerWakingEventsForDeliveryIdentifierMap:v11 deliveryInfoMap:v10];

  v12[2](v12, 0);
}

- (void)registerWakingEventsForDeliveryIdentifierMap:(id)a3 deliveryInfoMap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 allKeys];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  id v10 = [MEMORY[0x1E4FAF3F8] sharedInstance];
  id v11 = [v10 tipStatusController];

  BOOL v12 = [(TPSNotificationController *)self isSoftOptedOut];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __90__TPSNotificationController_registerWakingEventsForDeliveryIdentifierMap_deliveryInfoMap___block_invoke;
  v21[3] = &unk_1E6E6C4B0;
  id v13 = v11;
  id v22 = v13;
  v23 = self;
  id v14 = v6;
  id v24 = v14;
  id v15 = v7;
  id v25 = v15;
  BOOL v27 = v12;
  id v16 = v9;
  id v26 = v16;
  [v8 enumerateObjectsUsingBlock:v21];
  if ([v16 count])
  {
    id v17 = [(TPSNotificationController *)self syncQueue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __90__TPSNotificationController_registerWakingEventsForDeliveryIdentifierMap_deliveryInfoMap___block_invoke_2;
    v18[3] = &unk_1E6E6BEF8;
    id v19 = v16;
    uint64_t v20 = self;
    dispatch_sync(v17, v18);
  }
}

void __90__TPSNotificationController_registerWakingEventsForDeliveryIdentifierMap_deliveryInfoMap___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isContentNeverVisibleForIdentifier:v3])
  {
    uint64_t v4 = [*(id *)(a1 + 40) notificationDeliveryInfoForIdentifier:v3 documentDeliveryIdentifierMap:*(void *)(a1 + 48) deliveryInfoMap:*(void *)(a1 + 56)];
    if (![v4 TPSSafeBoolForKey:@"immediate"]
      || *(unsigned char *)(a1 + 72) && ![v4 TPSSafeBoolForKey:@"overrideOptOut"])
    {
      goto LABEL_23;
    }
    uint64_t v5 = [v4 TPSSafeDictionaryForKey:@"preconditions"];
    if ([v5 count])
    {
      id v6 = [[TPSDeliveryPrecondition alloc] initWithDictionary:v5];
      id v7 = [(TPSDeliveryPrecondition *)v6 conditionsForType:1];
      if (![v7 count])
      {
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      BOOL v8 = +[TPSTargetingValidator validateConditions:v7 joinType:[(TPSDeliveryPrecondition *)v6 joinType] context:v3 cache:0 completionQueue:0 error:0];

      if (!v8)
      {
        uint64_t v9 = [(TPSDeliveryPrecondition *)v6 conditionsForType:2];
        if (![v9 count])
        {

LABEL_26:
          id v7 = [(TPSDeliveryPrecondition *)v6 registrableEvents];
LABEL_13:
          if ([v7 count])
          {
            long long v18 = 0u;
            long long v19 = 0u;
            long long v16 = 0u;
            long long v17 = 0u;
            id v11 = v7;
            uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
            if (v12)
            {
              uint64_t v13 = v12;
              uint64_t v14 = *(void *)v17;
              do
              {
                for (uint64_t i = 0; i != v13; ++i)
                {
                  if (*(void *)v17 != v14) {
                    objc_enumerationMutation(v11);
                  }
                  objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "addObserverIdentifier:", v3, (void)v16);
                }
                uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
              }
              while (v13);
            }

            [*(id *)(a1 + 64) addObjectsFromArray:v11];
          }
          goto LABEL_22;
        }
        BOOL v10 = +[TPSTargetingValidator validateConditions:v9 joinType:[(TPSDeliveryPrecondition *)v6 joinType] context:v3 cache:0 completionQueue:0 error:0];

        if (v10) {
          goto LABEL_26;
        }
      }
    }
    else
    {
      id v6 = 0;
    }
    id v7 = 0;
    goto LABEL_13;
  }
LABEL_24:
}

uint64_t __90__TPSNotificationController_registerWakingEventsForDeliveryIdentifierMap_deliveryInfoMap___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
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
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
        BOOL v8 = objc_msgSend(*(id *)(a1 + 40), "registeredWakingEventMap", (void)v11);
        uint64_t v9 = [v7 identifier];
        [v8 setObject:v7 forKeyedSubscript:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 40) _updateWakingEventMapCache];
  return [*(id *)(a1 + 40) _registerWakingEvents];
}

- (void)removeNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TPSNotificationController *)self localNotificationController];
  [v5 removeNotificationWithIdentifier:v4];

  uint64_t v6 = [(TPSNotificationController *)self notificationCache];
  id v7 = [v6 document];
  BOOL v8 = [v7 identifier];
  int v9 = [v8 isEqualToString:v4];

  if (v9)
  {
    [(TPSNotificationController *)self clearNotificationCache];
  }
}

- (void)removeAllNotifications
{
  uint64_t v3 = [(TPSNotificationController *)self localNotificationController];
  [v3 removeAllNotifications];

  [(TPSNotificationController *)self clearNotificationCache];

  [(TPSNotificationController *)self clearNotificationCount];
}

- (void)_registerWakingEvents
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1E4492000, a2, OS_LOG_TYPE_DEBUG, "Re-registering notification for waking events: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_unregisterAllWakingEvents
{
  id v2 = [(TPSNotificationController *)self eventsProviderManager];
  [v2 unregisterAllWakingEvents];
}

- (void)_updateWakingEventMapCache
{
  id v2 = (void *)MEMORY[0x1E4FAF4B0];
  id v3 = [(TPSNotificationController *)self registeredWakingEventMap];
  [v2 archivedDataWithRootObject:v3 forKey:@"RegisteredWakingEventMapKey"];
}

- (void)_updateNotificationCache
{
  id v2 = (void *)MEMORY[0x1E4FAF4B0];
  id v3 = [(TPSNotificationController *)self notificationCache];
  [v2 archivedDataWithRootObject:v3 forKey:@"NotificationCache"];
}

- (id)updateNotificationCacheWithCollectionIdentifier:(id)a3 document:(id)a4 type:(unint64_t)a5 extensionPayload:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  long long v13 = [MEMORY[0x1E4FAF480] daemon];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v27 = v11;
    __int16 v28 = 2112;
    id v29 = v10;
    __int16 v30 = 2048;
    unint64_t v31 = a5;
    _os_log_impl(&dword_1E4492000, v13, OS_LOG_TYPE_DEFAULT, "Update notification cache for document %@, collectionIdentifier %@, type %lu", buf, 0x20u);
  }

  if (!v10 || !v11)
  {
    [(TPSNotificationController *)self clearNotificationCache];
    goto LABEL_17;
  }
  long long v14 = [(TPSNotificationController *)self notificationCache];
  uint64_t v15 = [v14 type];

  if (v15 == 1)
  {
    if (a5 != 1)
    {
      uint64_t v16 = [MEMORY[0x1E4FAF480] daemon];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        long long v17 = "Cannot update notification document due to a welcome type in progress.";
LABEL_14:
        _os_log_impl(&dword_1E4492000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
  }
  else if (a5 != 2 && v15 == 2)
  {
    uint64_t v16 = [MEMORY[0x1E4FAF480] daemon];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v17 = "Cannot update notification document due to a immediate type in progress.";
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_17;
  }
  long long v18 = [(TPSNotificationController *)self syncQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __108__TPSNotificationController_updateNotificationCacheWithCollectionIdentifier_document_type_extensionPayload___block_invoke;
  block[3] = &unk_1E6E6C4D8;
  block[4] = self;
  id v22 = v10;
  id v23 = v11;
  unint64_t v25 = a5;
  id v24 = v12;
  dispatch_sync(v18, block);

LABEL_17:
  long long v19 = [(TPSNotificationController *)self notificationCache];

  return v19;
}

void __108__TPSNotificationController_updateNotificationCacheWithCollectionIdentifier_document_type_extensionPayload___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) notificationCache];
  id v3 = [v2 collectionIdentifier];
  if (([v3 isEqualToString:*(void *)(a1 + 40)] & 1) == 0)
  {

    int v9 = 0;
    goto LABEL_5;
  }
  uint64_t v4 = [*(id *)(a1 + 32) notificationCache];
  uint64_t v5 = [v4 document];
  uint64_t v6 = [v5 identifier];
  id v7 = [*(id *)(a1 + 48) identifier];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v2 = [*(id *)(a1 + 32) notificationCache];
    int v9 = [v2 attachmentURL];
LABEL_5:

    goto LABEL_7;
  }
  int v9 = 0;
LABEL_7:
  id v10 = +[TPSNotificationCache notificationCacheWithCollectionIdentifier:*(void *)(a1 + 40) document:*(void *)(a1 + 48) type:*(void *)(a1 + 64)];
  [*(id *)(a1 + 32) setNotificationCache:v10];

  uint64_t v11 = *(void *)(a1 + 56);
  id v12 = [*(id *)(a1 + 32) notificationCache];
  [v12 setExtensionPayload:v11];

  long long v13 = [*(id *)(a1 + 32) notificationCache];
  [v13 setAttachmentURL:v9];

  [*(id *)(a1 + 32) _updateNotificationCache];
  long long v14 = [*(id *)(a1 + 48) notification];
  uint64_t v15 = [MEMORY[0x1E4FAF480] daemon];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v14 debugDescription];
    int v17 = 138412290;
    long long v18 = v16;
    _os_log_impl(&dword_1E4492000, v15, OS_LOG_TYPE_DEFAULT, "Tip found to notify user about %@", (uint8_t *)&v17, 0xCu);
  }
}

- (id)notificationDeliveryInfoForIdentifier:(id)a3 documentDeliveryIdentifierMap:(id)a4 deliveryInfoMap:(id)a5
{
  id v7 = a5;
  int v8 = [a4 TPSSafeStringForKey:a3];
  int v9 = [v7 TPSSafeDictionaryForKey:v8];

  id v10 = [v9 objectForKeyedSubscript:@"notification"];

  return v10;
}

- (id)documentToNotifyForCollection:(id)a3 collectionDeliveryInfoMap:(id)a4 deliveryInfoMap:(id)a5 overrideOptOutContentOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    long long v13 = [v10 identifier];
    if ([(TPSNotificationController *)self collectionEligibleForNotification:v13])
    {
      long long v14 = [v10 notification];

      if (v14)
      {
        uint64_t v15 = [(TPSNotificationController *)self notificationDeliveryInfoForIdentifier:v13 documentDeliveryIdentifierMap:v11 deliveryInfoMap:v12];
        BOOL v16 = [(TPSNotificationController *)self isNotificationDeliveryInfoValid:v15 identifier:v13 overrideOptOutContentOnly:v6 ignoreSuppressContent:0];

        if (v16)
        {
          if (![(TPSNotificationController *)self isDocumentHintDisplayedOnOtherDevices:v10])
          {
LABEL_8:

            goto LABEL_9;
          }
          int v17 = [(TPSNotificationController *)self delegate];
          [v17 notificationController:self markIdentifier:v13 type:2 ineligibleWithReason:5];
        }
      }
    }

    id v10 = 0;
    goto LABEL_8;
  }
LABEL_9:

  return v10;
}

- (id)documentToNotifyForTipsInCollection:(id)a3 tipMap:(id)a4 tipDeliveryInfoMap:(id)a5 deliveryInfoMap:(id)a6 overrideOptOutContentOnly:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  unint64_t v31 = __Block_byref_object_copy__10;
  uint64_t v32 = __Block_byref_object_dispose__10;
  id v33 = 0;
  BOOL v16 = [v12 tipIdentifiers];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __133__TPSNotificationController_documentToNotifyForTipsInCollection_tipMap_tipDeliveryInfoMap_deliveryInfoMap_overrideOptOutContentOnly___block_invoke;
  v22[3] = &unk_1E6E6C500;
  id v26 = &v28;
  v22[4] = self;
  id v17 = v13;
  id v23 = v17;
  id v18 = v14;
  id v24 = v18;
  id v19 = v15;
  id v25 = v19;
  BOOL v27 = a7;
  [v16 enumerateObjectsUsingBlock:v22];

  id v20 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v20;
}

void __133__TPSNotificationController_documentToNotifyForTipsInCollection_tipMap_tipDeliveryInfoMap_deliveryInfoMap_overrideOptOutContentOnly___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) tipDocumentToNotifyWithIdentifier:a2 tipMap:*(void *)(a1 + 40) tipDeliveryInfoMap:*(void *)(a1 + 48) deliveryInfoMap:*(void *)(a1 + 56) overrideOptOutContentOnly:*(unsigned __int8 *)(a1 + 72)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  *a4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != 0;
}

- (id)tipDocumentToNotifyWithIdentifier:(id)a3 tipMap:(id)a4 tipDeliveryInfoMap:(id)a5 deliveryInfoMap:(id)a6 overrideOptOutContentOnly:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (![(TPSNotificationController *)self canUpdateHintEligibilityForIdentifier:v12])goto LABEL_7; {
  BOOL v16 = [v13 objectForKeyedSubscript:v12];
  }
  id v17 = v16;
  if (!v16
    || ([v16 notification], id v18 = objc_claimAutoreleasedReturnValue(), v18, !v18)
    || ![(TPSNotificationController *)self preconditionValidForIdentifier:v12 documentDeliveryInfoMap:v14 deliveryInfoMap:v15 overrideOptOutContentOnly:v7 ignoreSuppressContent:0]|| ![(TPSNotificationController *)self updateHintEligibleForTip:v17 isValid:1])
  {

LABEL_7:
    id v17 = 0;
  }

  return v17;
}

- (BOOL)canUpdateHintEligibilityForIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4FAF3F8] sharedInstance];
  uint64_t v5 = [v4 tipStatusController];

  if ([v5 isContentNeverVisibleForIdentifier:v3]
    && ([v5 isHintInelgibileForIdentifier:v3] & 1) == 0)
  {
    if ([v5 displayTypeForIdentifier:v3] == 1)
    {
      int v8 = [v5 hintEligibleDateForIdentifier:v3];
      BOOL v6 = v8 != 0;
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)preconditionValidForIdentifier:(id)a3 documentDeliveryInfoMap:(id)a4 deliveryInfoMap:(id)a5 overrideOptOutContentOnly:(BOOL)a6 ignoreSuppressContent:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = [(TPSNotificationController *)self notificationDeliveryInfoForIdentifier:v12 documentDeliveryIdentifierMap:a4 deliveryInfoMap:a5];
  LOBYTE(v7) = [(TPSNotificationController *)self isNotificationDeliveryInfoValid:v13 identifier:v12 overrideOptOutContentOnly:v8 ignoreSuppressContent:v7];

  return v7;
}

- (BOOL)updateHintEligibleForTip:(id)a3 isValid:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [v6 identifier];
  BOOL v8 = [(TPSNotificationController *)self isDocumentHintDisplayedOnOtherDevices:v6];

  if (v8)
  {
    int v9 = [(TPSNotificationController *)self delegate];
    [v9 notificationController:self markIdentifier:v7 type:1 ineligibleWithReason:5];

    BOOL v4 = 0;
  }
  id v10 = [MEMORY[0x1E4FAF3F8] sharedInstance];
  id v11 = [v10 tipStatusController];

  if (v4 && ![v11 displayTypeForIdentifier:v7])
  {
    id v12 = [v11 hintEligibleDateForIdentifier:v7];

    if (!v12) {
      [v11 updateHintEligibleDateForIdentifier:v7 value:1];
    }
  }

  return v4;
}

- (BOOL)isNotificationDeliveryInfoValid:(id)a3 identifier:(id)a4 overrideOptOutContentOnly:(BOOL)a5 ignoreSuppressContent:(BOOL)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  if (!a6 && ([v9 TPSSafeBoolForKey:@"suppress"] & 1) != 0
    || v7 && ![v9 TPSSafeBoolForKey:@"overrideOptOut"])
  {
    BOOL v17 = 0;
  }
  else if ([v9 count])
  {
    id v11 = [v9 TPSSafeDictionaryForKey:@"preconditions"];
    if ([v11 count])
    {
      id v12 = [[TPSDeliveryPrecondition alloc] initWithDictionary:v11];
      id v13 = v12;
      if (v12)
      {
        id v14 = [(TPSDeliveryPrecondition *)v12 conditionsForType:2];
        uint64_t v19 = 0;
        BOOL v15 = +[TPSTargetingValidator validateConditions:v14 joinType:[(TPSDeliveryPrecondition *)v13 joinType] context:v10 cache:0 completionQueue:0 error:&v19];
        if (v19) {
          int v16 = 0;
        }
        else {
          int v16 = v15;
        }
      }
      else
      {
        int v16 = 0;
      }
    }
    else
    {
      int v16 = 1;
    }

    BOOL v17 = v16 != 0;
  }
  else
  {
    BOOL v17 = 1;
  }

  return v17;
}

- (void)showNotificationWithCompletionHandler:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void *, uint64_t, void *))a3;
  uint64_t v5 = [(TPSNotificationController *)self notificationCache];
  id v6 = [v5 document];

  if (v6)
  {
    BOOL v7 = [(TPSNotificationController *)self notificationCache];
    int v8 = [v7 hasLocaleChanged];

    int v9 = v8 ^ 1;
    if (v8) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    int v9 = 0;
    uint64_t v10 = 1;
  }
  id v11 = [v6 identifier];
  id v12 = [MEMORY[0x1E4FAF3F8] sharedInstance];
  id v13 = [v12 tipStatusController];

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = 1;
      if (([v13 isLockScreenHintDisplayEligibleForIdentifier:v11] & 1) == 0) {
        goto LABEL_21;
      }
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      objc_opt_class();
      char v16 = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) == 0 && (v16 & 1) == 0)
      {
        uint64_t v14 = 0;
LABEL_21:
        uint64_t v10 = 3;
LABEL_22:
        BOOL v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.TipsDaemon.notificationController" code:v10 userInfo:0];
        id v18 = [MEMORY[0x1E4FAF480] daemon];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 138412546;
          int64_t v27 = (int64_t)v11;
          __int16 v28 = 2112;
          id v29 = v17;
          _os_log_impl(&dword_1E4492000, v18, OS_LOG_TYPE_DEFAULT, "Notification for %@ is no longer eligible due to error %@.", (uint8_t *)&v26, 0x16u);
        }
        goto LABEL_27;
      }
      if (isKindOfClass) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = 3;
      }
      if (![(TPSNotificationController *)self collectionEligibleForNotification:v11])goto LABEL_21; {
    }
      }
  }
  else
  {
    uint64_t v14 = 0;
    if (v10) {
      goto LABEL_22;
    }
  }
  if ([(TPSNotificationController *)self isDocumentHintDisplayedOnOtherDevices:v6])
  {
    uint64_t v10 = 4;
    goto LABEL_22;
  }
  uint64_t v19 = [(TPSNotificationController *)self notificationCache];
  id v18 = [v19 attachmentURL];

  id v20 = [(TPSNotificationController *)self localNotificationController];
  uint64_t v21 = [(TPSNotificationController *)self notificationCache];
  [v20 showNotificationForNotificationCache:v21 attachmentURL:v18];

  [(TPSNotificationController *)self increaseUserNotificationCount];
  [(TPSNotificationController *)self updateLastNotificationDate];
  id v22 = [MEMORY[0x1E4FAF480] daemon];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 134217984;
    int64_t v27 = [(TPSNotificationController *)self notificationCount];
    _os_log_impl(&dword_1E4492000, v22, OS_LOG_TYPE_DEFAULT, "Consecutive notification count %ld", (uint8_t *)&v26, 0xCu);
  }

  BOOL v17 = 0;
LABEL_27:

  id v23 = [MEMORY[0x1E4FAF3F8] sharedInstance];
  id v24 = [(TPSNotificationController *)self notificationCache];
  id v25 = [v24 collectionIdentifier];
  [v23 notifiedCollection:v25];

  [(TPSNotificationController *)self clearNotificationCache];
  v4[2](v4, v6, v14, v17);
}

- (void)increaseUserNotificationCount
{
  [(TPSNotificationController *)self setNotificationCount:[(TPSNotificationController *)self notificationCount] + 1];

  [(TPSNotificationController *)self updateNotificationCount];
}

- (BOOL)isSoftOptedOut
{
  int64_t v2 = [(TPSNotificationController *)self notificationCount];
  if (v2 < +[TPSNotificationController softOptOutNotificationCount])return 0; {

  }
  return +[TPSNotificationController respectsOptOut];
}

- (void)updateLastNotificationDate
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  [v3 setObject:v2 forKey:@"TPSLastNotificationDate"];

  [v3 synchronize];
}

- (BOOL)collectionEligibleForNotification:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4FAF3F8];
  id v4 = a3;
  uint64_t v5 = [v3 sharedInstance];
  id v6 = [v5 collectionStatusForCollectionIdentifier:v4];

  if ([v6 canNotify])
  {
    BOOL v7 = [v6 firstViewedDate];
    BOOL v8 = v7 == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isDocumentHintDisplayedOnOtherDevices:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    id v6 = [v3 correlationID];
    objc_msgSend(v5, "na_safeAddObject:", v6);

    BOOL v7 = [v3 clonedFromID];
    objc_msgSend(v5, "na_safeAddObject:", v7);

    BOOL v8 = [v3 identifier];
    objc_msgSend(v5, "na_safeAddObject:", v8);

    int v9 = [MEMORY[0x1E4FAF3E0] sharedInstance];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__TPSNotificationController_isDocumentHintDisplayedOnOtherDevices___block_invoke;
    v16[3] = &unk_1E6E6C528;
    id v10 = v9;
    id v17 = v10;
    if (objc_msgSend(v5, "na_any:", v16))
    {
      if (![MEMORY[0x1E4FAF450] ignoreCloud])
      {
        BOOL v4 = 1;
        goto LABEL_10;
      }
      id v11 = [MEMORY[0x1E4FAF480] daemon];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v3 identifier];
        id v13 = [v3 correlationID];
        uint64_t v14 = [v3 clonedFromID];
        *(_DWORD *)buf = 138412802;
        uint64_t v19 = v12;
        __int16 v20 = 2112;
        uint64_t v21 = v13;
        __int16 v22 = 2112;
        id v23 = v14;
        _os_log_impl(&dword_1E4492000, v11, OS_LOG_TYPE_DEFAULT, "Overriding ineligibility due to content %@ already seen on other devices (correlationId: %@, cloneFromID: %@)", buf, 0x20u);
      }
    }
    BOOL v4 = 0;
LABEL_10:

    goto LABEL_11;
  }
  BOOL v4 = 0;
LABEL_11:

  return v4;
}

uint64_t __67__TPSNotificationController_isDocumentHintDisplayedOnOtherDevices___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isHintDisplayedForContentID:a2];
}

- (BOOL)shouldDisplayCollectionIcon
{
  if (+[TPSNotificationController alwaysDisplayCollectionIcon])
  {
    char isKindOfClass = 1;
  }
  else
  {
    BOOL v4 = [(TPSNotificationController *)self notificationCache];
    uint64_t v5 = [v4 document];

    id v6 = [(TPSNotificationController *)self notificationCache];
    if ([v6 type] == 2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      char isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  return isKindOfClass & 1;
}

- (void)fetchNotificationAssetIfNeededCompletionHandler:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(TPSNotificationController *)self notificationCache];
  id v6 = [v5 document];

  if (![(TPSNotificationController *)self shouldDisplayCollectionIcon]) {
    goto LABEL_22;
  }
  uint64_t v51 = 0;
  id v52 = &v51;
  uint64_t v53 = 0x3032000000;
  id v54 = __Block_byref_object_copy__10;
  id v55 = __Block_byref_object_dispose__10;
  BOOL v7 = [(TPSNotificationController *)self notificationCache];
  id v56 = [v7 attachmentURL];

  BOOL v8 = [(TPSNotificationController *)self cacheAssetFileURLForDocument:v6];
  int v9 = (void *)v52[5];
  if (v8)
  {
    if (([v9 isEqual:v8] & 1) == 0)
    {
      id v10 = [(TPSNotificationController *)self notificationCache];
      [v10 setAttachmentURL:v8];

      [(TPSNotificationController *)self _updateNotificationCache];
    }
    v4[2](v4, v8);
    goto LABEL_6;
  }
  v52[5] = 0;

  if (v52[5])
  {
    id v12 = [(TPSNotificationController *)self notificationCache];
    [v12 setAttachmentURL:0];

    [(TPSNotificationController *)self _updateNotificationCache];
    if (v52[5])
    {
LABEL_6:
      LOBYTE(v11) = 0;
      goto LABEL_21;
    }
  }
  id v13 = [v6 notification];
  uint64_t v14 = [v13 assets];

  uint64_t v11 = [v14 imageIdentifier];
  if (v11)
  {
    BOOL v15 = [v14 baseURL];
    BOOL v16 = v15 == 0;

    if (v16)
    {
      LOBYTE(v11) = 0;
    }
    else
    {
      unint64_t v31 = [(TPSNotificationController *)self assetsConfigurationForDocument:v6];
      id v17 = [v31 cacheIdentifierForType:0];
      uint64_t v45 = 0;
      v46 = &v45;
      uint64_t v47 = 0x3032000000;
      v48 = __Block_byref_object_copy__10;
      v49 = __Block_byref_object_dispose__10;
      id v50 = 0;
      id v18 = [(TPSNotificationController *)self syncQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __77__TPSNotificationController_fetchNotificationAssetIfNeededCompletionHandler___block_invoke;
      block[3] = &unk_1E6E6C550;
      uint64_t v44 = &v45;
      block[4] = self;
      id v19 = v17;
      id v43 = v19;
      dispatch_sync(v18, block);

      LOBYTE(v11) = 0;
      if (!v46[5] && v19)
      {
        __int16 v20 = [MEMORY[0x1E4FAF418] assetPathFromAssetConfiguration:v31 type:0];
        LOBYTE(v11) = v20 != 0;
        if (v20)
        {
          id v30 = v20;
          objc_initWeak(&location, self);
          uint64_t v21 = [MEMORY[0x1E4FAF480] daemon];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v22 = [v6 identifier];
            *(_DWORD *)buf = 138412802;
            id v58 = v22;
            __int16 v59 = 2112;
            id v60 = v19;
            __int16 v61 = 2112;
            id v62 = v30;
            _os_log_impl(&dword_1E4492000, v21, OS_LOG_TYPE_DEFAULT, "Attempt to cache asset for document id %@ with asset identifier %@ at %@", buf, 0x20u);
          }
          id v23 = [MEMORY[0x1E4FAF3B8] sharedInstance];
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = __77__TPSNotificationController_fetchNotificationAssetIfNeededCompletionHandler___block_invoke_69;
          v35[3] = &unk_1E6E6C578;
          objc_copyWeak(&v40, &location);
          int v24 = *MEMORY[0x1E4F28A00];
          v35[4] = self;
          id v25 = v19;
          id v36 = v25;
          v39 = &v51;
          id v37 = v6;
          v38 = v4;
          LODWORD(v26) = v24;
          uint64_t v27 = [v23 formattedDataForPath:v30 identifier:v25 attributionIdentifier:0 priority:v35 completionHandler:v26];
          __int16 v28 = (void *)v46[5];
          v46[5] = v27;

          id v29 = [(TPSNotificationController *)self syncQueue];
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __77__TPSNotificationController_fetchNotificationAssetIfNeededCompletionHandler___block_invoke_71;
          v32[3] = &unk_1E6E6C5A0;
          v32[4] = self;
          id v33 = v25;
          unint64_t v34 = &v45;
          dispatch_async(v29, v32);

          objc_destroyWeak(&v40);
          objc_destroyWeak(&location);
          __int16 v20 = v30;
        }
      }
      _Block_object_dispose(&v45, 8);
    }
  }

LABEL_21:
  _Block_object_dispose(&v51, 8);

  if (!((v8 != 0) | v11 & 1)) {
LABEL_22:
  }
    v4[2](v4, 0);
}

void __77__TPSNotificationController_fetchNotificationAssetIfNeededCompletionHandler___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) assetURLSessionMap];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __77__TPSNotificationController_fetchNotificationAssetIfNeededCompletionHandler___block_invoke_69(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (id *)(a1 + 72);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  BOOL v7 = [*(id *)(a1 + 32) cacheFilePathForFile:*(void *)(a1 + 40)];
  uint64_t v8 = [WeakRetained copyFileURL:v5 cachePath:v7];

  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = [WeakRetained syncQueue];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  double v26 = __77__TPSNotificationController_fetchNotificationAssetIfNeededCompletionHandler___block_invoke_2;
  uint64_t v27 = &unk_1E6E6BEF8;
  id v28 = WeakRetained;
  id v29 = *(id *)(a1 + 40);
  dispatch_async(v11, &v24);

  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v13 = objc_msgSend(MEMORY[0x1E4FAF480], "daemon", v24, v25, v26, v27, v28);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      BOOL v15 = [*(id *)(a1 + 48) identifier];
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      unint64_t v31 = v15;
      __int16 v32 = 2112;
      uint64_t v33 = v16;
      __int16 v34 = 2112;
      uint64_t v35 = v17;
      id v18 = "Asset cached for document id %@ with asset identifier %@ to %@";
      id v19 = v13;
      uint32_t v20 = 32;
LABEL_6:
      _os_log_impl(&dword_1E4492000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    }
  }
  else if (v14)
  {
    BOOL v15 = [*(id *)(a1 + 48) identifier];
    uint64_t v21 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    unint64_t v31 = v15;
    __int16 v32 = 2112;
    uint64_t v33 = v21;
    id v18 = "Unable to cache asset for document id %@ with asset identifier %@";
    id v19 = v13;
    uint32_t v20 = 22;
    goto LABEL_6;
  }

  uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v23 = [WeakRetained notificationCache];
  [v23 setAttachmentURL:v22];

  [WeakRetained _updateNotificationCache];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __77__TPSNotificationController_fetchNotificationAssetIfNeededCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) assetURLSessionMap];
  [v2 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __77__TPSNotificationController_fetchNotificationAssetIfNeededCompletionHandler___block_invoke_71(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v3 = [*(id *)(a1 + 32) assetURLSessionMap];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)assetsConfigurationForDocument:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 notification];
  id v5 = [v4 assets];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4FB33D0]);
    BOOL v7 = [v6 userInterfaceStyle] == 2;
    id v8 = objc_alloc(MEMORY[0x1E4FAF3C0]);
    uint64_t v9 = [v3 language];
    id v10 = [v3 assetFileInfoManager];
    uint64_t v11 = (void *)[v8 initWithAssets:v5 language:v9 userInterfaceStyle:v7 assetFileInfoManager:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)cacheFilePathForFile:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[TPSNotificationController cacheDirectoryCreateIfEmpty:1];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 stringByAppendingPathComponent:v3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)cacheAssetFileURLForDocument:(id)a3
{
  BOOL v4 = [(TPSNotificationController *)self assetsConfigurationForDocument:a3];
  id v5 = [v4 cacheIdentifierForType:0];
  uint64_t v6 = [(TPSNotificationController *)self cacheFilePathForFile:v5];
  BOOL v7 = (void *)v6;
  if (!v5)
  {
    id v9 = 0;
    goto LABEL_12;
  }
  if (!v6)
  {
LABEL_8:
    id v10 = [(TPSNotificationController *)self frameworkBundle];
    uint64_t v11 = [v10 URLForResource:v5 withExtension:&stru_1F4017D10];

    if (v11) {
      id v9 = [(TPSNotificationController *)self copyFileURL:v11 cachePath:v7];
    }
    else {
      id v9 = 0;
    }

    goto LABEL_12;
  }
  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v8 fileExistsAtPath:v7] & 1) == 0)
  {

    goto LABEL_8;
  }
  id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:0];

  if (!v9) {
    goto LABEL_8;
  }
LABEL_12:

  return v9;
}

- (id)copyFileURL:(id)a3 cachePath:(id)a4
{
  id v5 = a3;
  uint64_t v6 = 0;
  if (v5 && a4)
  {
    BOOL v7 = (void *)MEMORY[0x1E4F28CB8];
    id v8 = a4;
    id v9 = [v7 defaultManager];
    uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:0];
    char v10 = [v9 fileExistsAtPath:v8];

    if ((v10 & 1) == 0)
    {
      if (v6)
      {
        id v15 = 0;
        int v11 = [v9 copyItemAtURL:v5 toURL:v6 error:&v15];
        id v12 = v15;
        id v13 = v12;
        if (v11 && !v12) {
          goto LABEL_10;
        }
      }
      else
      {
        id v13 = 0;
      }

      uint64_t v6 = 0;
    }
LABEL_10:
  }
  return v6;
}

- (void)dataProviderManager:(id)a3 didReceiveCallbackWithResult:(id)a4 type:(int64_t)a5
{
  id v6 = a4;
  BOOL v7 = [(TPSNotificationController *)self syncQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__TPSNotificationController_dataProviderManager_didReceiveCallbackWithResult_type___block_invoke;
  v9[3] = &unk_1E6E6BEF8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, v9);
}

void __83__TPSNotificationController_dataProviderManager_didReceiveCallbackWithResult_type___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) registeredWakingEventMap];
  id v3 = [*(id *)(a1 + 40) identifier];
  id v10 = [v2 objectForKeyedSubscript:v3];

  if (v10)
  {
    BOOL v4 = [*(id *)(a1 + 32) delegate];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [v10 observerIdentifiers];
    BOOL v7 = [v6 anyObject];
    [v4 notificationController:v5 registrableEventReceivedForDocumentIdentifier:v7];

    id v8 = [*(id *)(a1 + 32) registeredWakingEventMap];
    id v9 = [*(id *)(a1 + 40) identifier];
    [v8 setObject:0 forKeyedSubscript:v9];

    [*(id *)(a1 + 32) _updateWakingEventMapCache];
  }
}

- (TPSNotificationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TPSNotificationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setNotificationCache:(id)a3
{
}

- (NSMutableDictionary)assetURLSessionMap
{
  return self->_assetURLSessionMap;
}

- (void)setAssetURLSessionMap:(id)a3
{
}

- (TPSEventsProviderManager)eventsProviderManager
{
  return self->_eventsProviderManager;
}

- (void)setEventsProviderManager:(id)a3
{
}

- (void)setFrameworkBundle:(id)a3
{
}

- (TPSLocalNotificationController)localNotificationController
{
  return self->_localNotificationController;
}

- (void)setLocalNotificationController:(id)a3
{
}

- (NSMutableDictionary)registeredWakingEventMap
{
  return self->_registeredWakingEventMap;
}

- (void)setRegisteredWakingEventMap:(id)a3
{
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_registeredWakingEventMap, 0);
  objc_storeStrong((id *)&self->_localNotificationController, 0);
  objc_storeStrong((id *)&self->_frameworkBundle, 0);
  objc_storeStrong((id *)&self->_eventsProviderManager, 0);
  objc_storeStrong((id *)&self->_assetURLSessionMap, 0);
  objc_storeStrong((id *)&self->_notificationCache, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end