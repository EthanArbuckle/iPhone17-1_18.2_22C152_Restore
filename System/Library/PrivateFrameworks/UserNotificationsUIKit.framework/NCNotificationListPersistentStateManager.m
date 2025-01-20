@interface NCNotificationListPersistentStateManager
+ (id)_dataDirectoryPath;
+ (id)_persistentStateFilePath;
- (BOOL)_containsNotificationRequest:(id)a3 inMutableRepresentationForGroup:(id)a4 shouldRemove:(BOOL)a5;
- (BOOL)_containsNotificationRequest:(id)a3 inMutableRepresentationForSection:(id)a4 shouldRemove:(BOOL)a5;
- (BOOL)_doesPersistentStateFileExist;
- (BOOL)_getSectionFromPersistentStateRepresentation:(id)a3 request:(id)a4 section:(unint64_t *)a5;
- (BOOL)_isListRepresentation:(id)a3 equalToListRepresentation:(id)a4;
- (BOOL)_isMigratedTimeSensitiveNotificationRequest:(id)a3;
- (BOOL)_isMutableListRepresentationEmpty:(id)a3;
- (BOOL)_isRepresentationForGroup:(id)a3 equalToRepresentationForGroup:(id)a4;
- (BOOL)_isRepresentationForGroupEmpty:(id)a3;
- (BOOL)_isRepresentationForGroups:(id)a3 equalToRepresentationForGroups:(id)a4;
- (BOOL)_isRepresentationForMigrationTimes:(id)a3 equalToRepresentationForMigrationTimes:(id)a4;
- (BOOL)_isRepresentationForSection:(id)a3 equalToRepresentationForSection:(id)a4;
- (BOOL)_isRepresentationForSectionEmpty:(id)a3;
- (BOOL)_isRepresentationForSections:(id)a3 equalToRepresentationForSections:(id)a4;
- (BOOL)hasLoadedStoredPersistentState;
- (BOOL)hasStoredCurrentDigestMigrationTimeExpired;
- (BOOL)isFileWritingThrottled;
- (NCNotificationListPersistentStateManager)initWithDelegate:(id)a3;
- (NCNotificationListPersistentStateManagerDelegate)delegate;
- (NCSummaryServiceGateway)gateway;
- (NSArray)lastSectionsSentToGateway;
- (NSDate)storedPersistentSummaryMigrationTime;
- (NSDateFormatter)dateFormatter;
- (NSDictionary)cachedListRepresentation;
- (NSDictionary)cachedListRepresentationForThrottledSendToVendor;
- (NSDictionary)cachedListRepresentationForThrottledWriteToFile;
- (NSDictionary)lastWrittenListRepresentation;
- (NSMutableDictionary)currentStateRepresentation;
- (NSMutableDictionary)storedPersistentMigratedTimeSensitiveNotificationRequests;
- (NSMutableDictionary)storedPersistentMigrationTimes;
- (NSMutableDictionary)storedPersistentStateRepresentation;
- (double)startTime;
- (id)_getStoredMigrationTimeAndClearNotificationRequest:(id)a3;
- (id)_listRepresentationForNotificationList:(id)a3 sections:(id)a4 listCache:(id)a5 migrationScheduler:(id)a6 listInfo:(id)a7 detailed:(BOOL)a8 hashIdentifiers:(BOOL)a9 includeHistory:(BOOL)a10 includeHidden:(BOOL)a11;
- (id)_mutableRepresentationForMigratedTimeSensitiveNotificationRequestsInRepresentationForList:(id)a3;
- (id)_mutableRepresentationForRepresentationForGroup:(id)a3;
- (id)_mutableRepresentationForRepresentationForMigratedTimeSensitiveNotificationRequests:(id)a3;
- (id)_mutableRepresentationForRepresentationForNotificationRequests:(id)a3;
- (id)_mutableRepresentationForRepresentationForRequestMigrationTimes:(id)a3;
- (id)_mutableRepresentationForRepresentationForSection:(id)a3;
- (id)_mutableRepresentationForRequestMigrationTimesInRepresentationForList:(id)a3;
- (id)_mutableRepresentationForStoredListRepresentation:(id)a3;
- (id)_representationForGroup:(id)a3 atIndex:(unint64_t)a4 detailed:(BOOL)a5 hashIdentifiers:(BOOL)a6;
- (id)_representationForGroupWithSectionIdentifier:(id)a3 threadIdentifier:(id)a4 inRepresentationForGroups:(id)a5;
- (id)_representationForGroups:(id)a3 detailed:(BOOL)a4 hashIdentifiers:(BOOL)a5;
- (id)_representationForListCache:(id)a3;
- (id)_representationForMigratedTimeSensitiveNotificationRequests:(id)a3;
- (id)_representationForMigrationScheduler:(id)a3;
- (id)_representationForNotificationRequest:(id)a3 hashIdentifiers:(BOOL)a4;
- (id)_representationForNotificationRequests:(id)a3 detailed:(BOOL)a4 hashIdentifiers:(BOOL)a5;
- (id)_representationForRequestMigrationTimes:(id)a3;
- (id)_representationForSection:(id)a3 detailed:(BOOL)a4 hashIdentifiers:(BOOL)a5 includeHidden:(BOOL)a6;
- (id)_representationForSections:(id)a3 detailed:(BOOL)a4 hashIdentifiers:(BOOL)a5 includeHidden:(BOOL)a6;
- (id)_sectionRepresentationOfSectionType:(id)a3 inRepresentationForSections:(id)a4;
- (id)_summaryMigrationTimeInRepresentationForList:(id)a3;
- (id)stateRepresentationForNotificationList:(id)a3 sectionLists:(id)a4 listCache:(id)a5 migrationScheduler:(id)a6 listInfo:(id)a7 detailed:(BOOL)a8;
- (int)_formatVersionForListRepresentation:(id)a3;
- (unint64_t)_getSectionTypeAndRemoveNotificationRequest:(id)a3 inMutableRepresentationForSections:(id)a4;
- (unint64_t)sectionForStoredNotificationRequest:(id)a3;
- (void)_clearStoredListRepresentationForSectionIdentifier:(id)a3;
- (void)_clearStoredMigratedTimeSensitiveNotificationRequestsForSectionIdentifier:(id)a3;
- (void)_clearStoredRequestMigrationTimesForSectionIdentifier:(id)a3;
- (void)_clearStoredSectionIdentifier:(id)a3 inMutableRepresentationForSection:(id)a4;
- (void)_ensureDataDirectoryExists;
- (void)_mergePendingNotificationListRepresentation:(id)a3 withMutableListRepresentation:(id)a4;
- (void)_mergePendingRequestMigrationTimesRepresentation:(id)a3 withMutableRepresentationForRequestMigrationTimes:(id)a4;
- (void)_mergeRepresentationForGroup:(id)a3 withMutableRepresentationForGroup:(id)a4;
- (void)_mergeRepresentationForNotificationRequests:(id)a3 withMutableRepresentationForNotificationRequests:(id)a4;
- (void)_mergeRepresentationForSection:(id)a3 withMutableRepresentationForSection:(id)a4;
- (void)_persistCachedRepresentations;
- (void)_publishOnReadForStoredPersistentStateRepresentation:(id)a3;
- (void)_readPersistentStateFromFile;
- (void)_readPersistentStateFromFileIfNecessaryWithCompletion:(id)a3;
- (void)_scheduleListRepresentationPersistence;
- (void)_sendPersistentStateToVendor:(id)a3;
- (void)_throttledWriteFileListRepresentation:(id)a3 vendorListRepresentation:(id)a4;
- (void)_writePersistentStateToFileWithRepresentation:(id)a3;
- (void)notificationsLoadedForSectionIdentifier:(id)a3;
- (void)setCachedListRepresentation:(id)a3;
- (void)setCachedListRepresentationForThrottledSendToVendor:(id)a3;
- (void)setCachedListRepresentationForThrottledWriteToFile:(id)a3;
- (void)setCurrentStateRepresentation:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFileWritingThrottled:(BOOL)a3;
- (void)setGateway:(id)a3;
- (void)setLastSectionsSentToGateway:(id)a3;
- (void)setLastWrittenListRepresentation:(id)a3;
- (void)setLoadedStoredPersistentState:(BOOL)a3;
- (void)setStartTime:(double)a3;
- (void)setStoredCurrentDigestMigrationTimeExpired:(BOOL)a3;
- (void)setStoredPersistentMigratedTimeSensitiveNotificationRequests:(id)a3;
- (void)setStoredPersistentMigrationTimes:(id)a3;
- (void)setStoredPersistentStateRepresentation:(id)a3;
- (void)setStoredPersistentSummaryMigrationTime:(id)a3;
- (void)updatePersistentStateForNotificationList:(id)a3 sectionLists:(id)a4 listCache:(id)a5 migrationScheduler:(id)a6 listInfo:(id)a7 detailed:(BOOL)a8;
@end

@implementation NCNotificationListPersistentStateManager

- (NCNotificationListPersistentStateManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NCNotificationListPersistentStateManager;
  id v5 = [(NCNotificationListPersistentStateManager *)&v20 init];
  if (v5)
  {
    NCRegisterUserNotificationsUILogging();
    objc_storeWeak((id *)v5 + 3, v4);
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.UserNotificationsUI.NCNotificationListPersistentStateManager", v6);
    v8 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v7;

    id v9 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    v10 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v9;

    v11 = (void *)*((void *)v5 + 9);
    v12 = [MEMORY[0x1E4F1CA20] currentLocale];
    [v11 setLocale:v12];

    [*((id *)v5 + 9) setDateStyle:1];
    [*((id *)v5 + 9) setTimeStyle:3];
    *((_WORD *)v5 + 8) = 0;
    *((unsigned char *)v5 + 18) = 0;
    v13 = *((void *)v5 + 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__NCNotificationListPersistentStateManager_initWithDelegate___block_invoke;
    block[3] = &unk_1E6A91BB0;
    id v14 = v5;
    id v19 = v14;
    dispatch_async(v13, block);
    if (UNCCatchMe())
    {
      v15 = objc_alloc_init(NCSummaryServiceGateway);
      v16 = (void *)*((void *)v14 + 14);
      *((void *)v14 + 14) = v15;
    }
    *((CFAbsoluteTime *)v14 + 16) = CFAbsoluteTimeGetCurrent();
  }
  return (NCNotificationListPersistentStateManager *)v5;
}

uint64_t __61__NCNotificationListPersistentStateManager_initWithDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _readPersistentStateFromFile];
}

- (void)updatePersistentStateForNotificationList:(id)a3 sectionLists:(id)a4 listCache:(id)a5 migrationScheduler:(id)a6 listInfo:(id)a7 detailed:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  BYTE2(v24) = 0;
  LOWORD(v24) = 1;
  id v19 = -[NCNotificationListPersistentStateManager _listRepresentationForNotificationList:sections:listCache:migrationScheduler:listInfo:detailed:hashIdentifiers:includeHistory:includeHidden:](self, "_listRepresentationForNotificationList:sections:listCache:migrationScheduler:listInfo:detailed:hashIdentifiers:includeHistory:includeHidden:", v14, v15, v16, v17, v18, v8, v24);
  if (UNCCatchMe())
  {
    BYTE2(v25) = 1;
    LOWORD(v25) = 256;
    objc_super v20 = -[NCNotificationListPersistentStateManager _listRepresentationForNotificationList:sections:listCache:migrationScheduler:listInfo:detailed:hashIdentifiers:includeHistory:includeHidden:](self, "_listRepresentationForNotificationList:sections:listCache:migrationScheduler:listInfo:detailed:hashIdentifiers:includeHistory:includeHidden:", v14, v15, v16, v17, v18, v8, v25);
  }
  else
  {
    objc_super v20 = 0;
  }
  [(NCNotificationListPersistentStateManager *)self setCurrentStateRepresentation:v19];
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __145__NCNotificationListPersistentStateManager_updatePersistentStateForNotificationList_sectionLists_listCache_migrationScheduler_listInfo_detailed___block_invoke;
  block[3] = &unk_1E6A93190;
  objc_copyWeak(&v29, &location);
  id v27 = v20;
  id v28 = v19;
  id v22 = v19;
  id v23 = v20;
  dispatch_async(queue, block);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __145__NCNotificationListPersistentStateManager_updatePersistentStateForNotificationList_sectionLists_listCache_migrationScheduler_listInfo_detailed___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __145__NCNotificationListPersistentStateManager_updatePersistentStateForNotificationList_sectionLists_listCache_migrationScheduler_listInfo_detailed___block_invoke_2;
  v3[3] = &unk_1E6A94A38;
  v3[4] = WeakRetained;
  id v4 = a1[4];
  id v5 = a1[5];
  [WeakRetained _readPersistentStateFromFileIfNecessaryWithCompletion:v3];
}

void __145__NCNotificationListPersistentStateManager_updatePersistentStateForNotificationList_sectionLists_listCache_migrationScheduler_listInfo_detailed___block_invoke_2(uint64_t a1, char a2)
{
  if (a2)
  {
    id v7 = [*(id *)(a1 + 32) cachedListRepresentation];
    int v3 = UNCCatchMe();
    uint64_t v4 = 48;
    if (v3) {
      uint64_t v4 = 40;
    }
    id v5 = *(id *)(a1 + v4);
    if (([*(id *)(a1 + 32) _isListRepresentation:v7 equalToListRepresentation:v5] & 1) == 0)
    {
      [*(id *)(a1 + 32) setCachedListRepresentation:v5];
      [*(id *)(a1 + 32) _throttledWriteFileListRepresentation:*(void *)(a1 + 48) vendorListRepresentation:*(void *)(a1 + 40)];
    }
  }
  else
  {
    v6 = *MEMORY[0x1E4FB3770];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3770], OS_LOG_TYPE_ERROR)) {
      __145__NCNotificationListPersistentStateManager_updatePersistentStateForNotificationList_sectionLists_listCache_migrationScheduler_listInfo_detailed___block_invoke_2_cold_1(v6);
    }
  }
}

- (id)stateRepresentationForNotificationList:(id)a3 sectionLists:(id)a4 listCache:(id)a5 migrationScheduler:(id)a6 listInfo:(id)a7 detailed:(BOOL)a8
{
  BYTE2(v9) = 0;
  LOWORD(v9) = 1;
  return -[NCNotificationListPersistentStateManager _listRepresentationForNotificationList:sections:listCache:migrationScheduler:listInfo:detailed:hashIdentifiers:includeHistory:includeHidden:](self, "_listRepresentationForNotificationList:sections:listCache:migrationScheduler:listInfo:detailed:hashIdentifiers:includeHistory:includeHidden:", a3, a4, a5, a6, a7, a8, v9);
}

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_storedPersistentStateRepresentation)
  {
    [(NCNotificationListPersistentStateManager *)self _clearStoredListRepresentationForSectionIdentifier:v4];
    id v4 = v5;
  }
  if (self->_storedPersistentMigrationTimes)
  {
    [(NCNotificationListPersistentStateManager *)self _clearStoredRequestMigrationTimesForSectionIdentifier:v5];
    id v4 = v5;
  }
  if (self->_storedPersistentMigratedTimeSensitiveNotificationRequests)
  {
    [(NCNotificationListPersistentStateManager *)self _clearStoredMigratedTimeSensitiveNotificationRequestsForSectionIdentifier:v5];
    id v4 = v5;
  }
}

- (BOOL)_getSectionFromPersistentStateRepresentation:(id)a3 request:(id)a4 section:(unint64_t *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (a3)
  {
    uint64_t v9 = [a3 objectForKey:@"3.list.sections"];
    unint64_t v10 = [(NCNotificationListPersistentStateManager *)self _getSectionTypeAndRemoveNotificationRequest:v8 inMutableRepresentationForSections:v9];
    *a5 = v10;
    if (v10 == 4
      && [(NCNotificationListPersistentStateManager *)self hasStoredCurrentDigestMigrationTimeExpired])
    {
      v11 = (void *)*MEMORY[0x1E4FB3770];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3770], OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        v13 = (objc_class *)objc_opt_class();
        id v14 = NSStringFromClass(v13);
        id v15 = [v8 notificationIdentifier];
        id v16 = objc_msgSend(v15, "un_logDigest");
        id v17 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:self->_storedPersistentSummaryMigrationTime];
        int v19 = 138543874;
        objc_super v20 = v14;
        __int16 v21 = 2114;
        id v22 = v16;
        __int16 v23 = 2112;
        uint64_t v24 = v17;
        _os_log_impl(&dword_1D7C04000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ moving request %{public}@ to read digest from current digest because the stored digest migration time [%@] has already expired!", (uint8_t *)&v19, 0x20u);
      }
      *a5 = 6;
    }
  }
  return a3 != 0;
}

- (unint64_t)sectionForStoredNotificationRequest:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(NCNotificationListPersistentStateManager *)self _getSectionFromPersistentStateRepresentation:self->_storedPersistentStateRepresentation request:v4 section:&v36])
  {
    BOOL v5 = v36 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v5 = 1;
  }
  if (v5) {
    [(NCNotificationListPersistentStateManager *)self _getSectionFromPersistentStateRepresentation:self->_currentStateRepresentation request:v4 section:&v36];
  }
  if (self->_storedPersistentMigrationTimes)
  {
    v6 = [(NCNotificationListPersistentStateManager *)self _getStoredMigrationTimeAndClearNotificationRequest:v4];
    id v7 = v6;
    if (v6 && (unint64_t)(v36 - 1) <= 1)
    {
      [v6 timeIntervalSinceNow];
      if (v8 <= 0.0)
      {
        if (v36 == 2)
        {
          id v16 = (void *)*MEMORY[0x1E4FB3770];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3770], OS_LOG_TYPE_DEFAULT))
          {
            id v17 = v16;
            id v18 = (objc_class *)objc_opt_class();
            int v19 = NSStringFromClass(v18);
            objc_super v20 = [v4 notificationIdentifier];
            __int16 v21 = objc_msgSend(v20, "un_logDigest");
            id v22 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v7];
            *(_DWORD *)buf = 138543874;
            v38 = v19;
            __int16 v39 = 2114;
            v40 = v21;
            __int16 v41 = 2112;
            v42 = v22;
            _os_log_impl(&dword_1D7C04000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ moving request %{public}@ to history from incoming because its stored migration time [%@] has already expired!", buf, 0x20u);
          }
          uint64_t v36 = 0;
        }
        else if (v36 == 1)
        {
          uint64_t v9 = (void *)*MEMORY[0x1E4FB3770];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3770], OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v10 = v9;
            v11 = (objc_class *)objc_opt_class();
            v12 = NSStringFromClass(v11);
            v13 = [v4 notificationIdentifier];
            id v14 = objc_msgSend(v13, "un_logDigest");
            id v15 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v7];
            *(_DWORD *)buf = 138543874;
            v38 = v12;
            __int16 v39 = 2114;
            v40 = v14;
            __int16 v41 = 2112;
            v42 = v15;
            _os_log_impl(&dword_1D7C04000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ moving request %{public}@ to incoming from prominent incoming because its stored migration time [%@] has already expired!", buf, 0x20u);
          }
          uint64_t v36 = 2;
        }
      }
      else
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __80__NCNotificationListPersistentStateManager_sectionForStoredNotificationRequest___block_invoke;
        block[3] = &unk_1E6A93A88;
        void block[4] = self;
        id v34 = v7;
        id v35 = v4;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
  }
  if (self->_storedPersistentMigratedTimeSensitiveNotificationRequests
    && [(NCNotificationListPersistentStateManager *)self _isMigratedTimeSensitiveNotificationRequest:v4])
  {
    __int16 v23 = (void *)*MEMORY[0x1E4FB3770];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3770], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = v23;
      uint64_t v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      id v27 = [v4 notificationIdentifier];
      id v28 = objc_msgSend(v27, "un_logDigest");
      *(_DWORD *)buf = 138543618;
      v38 = v26;
      __int16 v39 = 2112;
      v40 = v28;
      _os_log_impl(&dword_1D7C04000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ found migrated time sensitive notification request for record %@.", buf, 0x16u);
    }
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __80__NCNotificationListPersistentStateManager_sectionForStoredNotificationRequest___block_invoke_5;
    v31[3] = &unk_1E6A91A68;
    v31[4] = self;
    id v32 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v31);
  }
  unint64_t v29 = v36;

  return v29;
}

void __80__NCNotificationListPersistentStateManager_sectionForStoredNotificationRequest___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 persistentStateManager:*(void *)(a1 + 32) didFetchMigrationTime:*(void *)(a1 + 40) forNotificationRequest:*(void *)(a1 + 48)];
}

void __80__NCNotificationListPersistentStateManager_sectionForStoredNotificationRequest___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 persistentStateManager:*(void *)(a1 + 32) didMigratedTimeSensitiveForNotificationRequest:*(void *)(a1 + 40)];
}

+ (id)_dataDirectoryPath
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  int v3 = [v2 bundleIdentifier];
  id v4 = v3;
  if (v3 && ([v3 isEqualToString:@"com.apple.springboard"] & 1) == 0)
  {
    v6 = [@"~/Library/UserNotificationsUI/" stringByExpandingTildeInPath];
    BOOL v5 = [v6 stringByAppendingPathComponent:v4];
  }
  else
  {
    BOOL v5 = [@"~/Library/UserNotificationsUI/" stringByExpandingTildeInPath];
  }

  return v5;
}

+ (id)_persistentStateFilePath
{
  id v2 = [a1 _dataDirectoryPath];
  int v3 = [v2 stringByAppendingPathComponent:@"NotificationListPersistentState.json"];

  return v3;
}

- (void)_ensureDataDirectoryExists
{
  id v3 = [(id)objc_opt_class() _dataDirectoryPath];
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (([v2 fileExistsAtPath:v3] & 1) == 0) {
    [v2 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];
  }
}

- (BOOL)_doesPersistentStateFileExist
{
  id v2 = [(id)objc_opt_class() _persistentStateFilePath];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v4 = [v3 fileExistsAtPath:v2];

  return v4;
}

- (void)_throttledWriteFileListRepresentation:(id)a3 vendorListRepresentation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __107__NCNotificationListPersistentStateManager__throttledWriteFileListRepresentation_vendorListRepresentation___block_invoke;
  block[3] = &unk_1E6A93A88;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __107__NCNotificationListPersistentStateManager__throttledWriteFileListRepresentation_vendorListRepresentation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCachedListRepresentationForThrottledWriteToFile:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCachedListRepresentationForThrottledSendToVendor:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 32);

  return [v2 _scheduleListRepresentationPersistence];
}

- (void)_scheduleListRepresentationPersistence
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(NCNotificationListPersistentStateManager *)self isFileWritingThrottled])
  {
    id v3 = *MEMORY[0x1E4FB3770];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3770], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7C04000, v3, OS_LOG_TYPE_DEFAULT, "Not scheduling file write. Currently throttled.", buf, 2u);
    }
  }
  else
  {
    [(NCNotificationListPersistentStateManager *)self setFileWritingThrottled:1];
    double v4 = 0.5;
    if (UNCCatchMe())
    {
      double v5 = self->_startTime + 10.0;
      double v6 = v5 - CFAbsoluteTimeGetCurrent();
      if (v6 <= 0.5 || v6 <= 0.0) {
        double v4 = 0.5;
      }
      else {
        double v4 = v6;
      }
    }
    double v8 = *MEMORY[0x1E4FB3770];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3770], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v14 = v4;
      _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "Scheduling file write after %1.2f sec", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__NCNotificationListPersistentStateManager__scheduleListRepresentationPersistence__block_invoke;
    block[3] = &unk_1E6A919A0;
    objc_copyWeak(&v12, (id *)buf);
    dispatch_after(v9, queue, block);
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

void __82__NCNotificationListPersistentStateManager__scheduleListRepresentationPersistence__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setFileWritingThrottled:0];
  [WeakRetained _persistCachedRepresentations];
}

- (void)_persistCachedRepresentations
{
  id v3 = *MEMORY[0x1E4FB3770];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3770], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v8 = 0;
    _os_log_impl(&dword_1D7C04000, v3, OS_LOG_TYPE_DEFAULT, "Persisting cached representations", v8, 2u);
  }
  double v4 = [(NCNotificationListPersistentStateManager *)self cachedListRepresentationForThrottledWriteToFile];

  if (v4)
  {
    double v5 = [(NCNotificationListPersistentStateManager *)self cachedListRepresentationForThrottledWriteToFile];
    [(NCNotificationListPersistentStateManager *)self _writePersistentStateToFileWithRepresentation:v5];
  }
  double v6 = [(NCNotificationListPersistentStateManager *)self cachedListRepresentationForThrottledSendToVendor];

  if (v6)
  {
    id v7 = [(NCNotificationListPersistentStateManager *)self cachedListRepresentationForThrottledSendToVendor];
    [(NCNotificationListPersistentStateManager *)self _sendPersistentStateToVendor:v7];
  }
}

- (void)_sendPersistentStateToVendor:(id)a3
{
  id v4 = a3;
  if (UNCCatchMe())
  {
    double v5 = (os_log_t *)MEMORY[0x1E4FB3770];
    double v6 = *MEMORY[0x1E4FB3770];
    id v7 = *MEMORY[0x1E4FB3770];
    if (v4)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D7C04000, v6, OS_LOG_TYPE_DEFAULT, "Sending persistent state to vendor", buf, 2u);
      }
      double v8 = (void *)[v4 mutableCopy];
      dispatch_time_t v9 = [v8 objectForKeyedSubscript:@"3.list.sections"];
      id v10 = (void *)[v9 mutableCopy];

      if ([v10 count])
      {
        uint64_t v11 = [v10 count];
        if (v11 - 1 >= 0)
        {
          uint64_t v12 = v11;
          do
          {
            id v13 = [v10 objectAtIndexedSubscript:--v12];
            double v14 = [v13 objectForKeyedSubscript:@"0.section.type"];
            uint64_t v15 = v14;
            if (v14 && (unint64_t)(NCNotificationListSectionTypeFromString(v14) - 4) <= 5) {
              [v10 removeObjectAtIndex:v12];
            }
          }
          while (v12 > 0);
        }
        [v8 setObject:v10 forKeyedSubscript:@"3.list.sections"];
      }
      if (v10
        && (id v16 = self->_lastSectionsSentToGateway) != 0
        && [(NSArray *)v16 isEqualToArray:v10])
      {
        id v17 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int16 v23 = 0;
          _os_log_impl(&dword_1D7C04000, v17, OS_LOG_TYPE_DEFAULT, "Sending persistent state to vendor failed: sections are the same", v23, 2u);
        }
      }
      else
      {
        gateway = self->_gateway;
        objc_super v20 = (void *)[v8 copy];
        [(NCSummaryServiceGateway *)gateway donateStateDump:v20];

        __int16 v21 = (NSArray *)[v10 copy];
        lastSectionsSentToGateway = self->_lastSectionsSentToGateway;
        self->_lastSectionsSentToGateway = v21;
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[NCNotificationListPersistentStateManager _sendPersistentStateToVendor:](v6);
    }
  }
  else
  {
    id v18 = *MEMORY[0x1E4FB3770];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3770], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_1D7C04000, v18, OS_LOG_TYPE_DEFAULT, "Sending persistent state to vendor failed: UNCCatchMe is disabled", v25, 2u);
    }
  }
}

- (void)_writePersistentStateToFileWithRepresentation:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  queue = self->_queue;
  id v4 = a3;
  dispatch_assert_queue_V2(queue);
  id v14 = 0;
  double v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v4 options:0 error:&v14];

  id v6 = v14;
  id v7 = [(id)objc_opt_class() _persistentStateFilePath];
  char v8 = [v5 writeToFile:v7 atomically:1];

  dispatch_time_t v9 = (void *)*MEMORY[0x1E4FB3770];
  id v10 = *MEMORY[0x1E4FB3770];
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[NCNotificationListPersistentStateManager _writePersistentStateToFileWithRepresentation:](v9);
    }
  }
  else if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v9;
      uint64_t v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543362;
      id v16 = v13;
      _os_log_impl(&dword_1D7C04000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully wrote notification list persistent state to file", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[NCNotificationListPersistentStateManager _writePersistentStateToFileWithRepresentation:](v9);
  }
}

- (void)_readPersistentStateFromFileIfNecessaryWithCompletion:(id)a3
{
  id v5 = a3;
  if (![(NCNotificationListPersistentStateManager *)self hasLoadedStoredPersistentState])[(NCNotificationListPersistentStateManager *)self _readPersistentStateFromFile]; {
  id v4 = v5;
  }
  if (v5)
  {
    (*((void (**)(id, BOOL))v5 + 2))(v5, [(NCNotificationListPersistentStateManager *)self hasLoadedStoredPersistentState]);
    id v4 = v5;
  }
}

- (void)_readPersistentStateFromFile
{
  id v1 = a1;
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_4(&dword_1D7C04000, v4, v5, "%{public}@ persistent state file does not exist! Nothing to read", v6, v7, v8, v9, v10);
}

uint64_t __72__NCNotificationListPersistentStateManager__readPersistentStateFromFile__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _publishOnReadForStoredPersistentStateRepresentation:*(void *)(a1 + 40)];
}

- (void)_publishOnReadForStoredPersistentStateRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NCNotificationListPersistentStateManager *)self delegate];
  uint64_t v6 = [(NCNotificationListPersistentStateManager *)self _summaryMigrationTimeInRepresentationForList:v4];
  storedPersistentSummaryMigrationTime = self->_storedPersistentSummaryMigrationTime;
  self->_storedPersistentSummaryMigrationTime = v6;

  if (self->_storedPersistentSummaryMigrationTime)
  {
    objc_msgSend(v5, "persistentStateManager:didFetchSummaryMigrationTime:", self);
    [(NSDate *)self->_storedPersistentSummaryMigrationTime timeIntervalSinceNow];
    self->_storedCurrentDigestMigrationTimeExpired = v8 < 0.0;
  }
  uint64_t v9 = [(NCNotificationListPersistentStateManager *)self storedPersistentStateRepresentation];
  uint8_t v10 = [v9 objectForKey:@"3.list.sections"];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __97__NCNotificationListPersistentStateManager__publishOnReadForStoredPersistentStateRepresentation___block_invoke;
  id v16 = &unk_1E6A94A60;
  id v11 = v5;
  id v17 = v11;
  id v18 = self;
  [v10 enumerateObjectsUsingBlock:&v13];
  uint64_t v12 = objc_msgSend(v4, "objectForKey:", @"7.list.infoStore", v13, v14, v15, v16);
  if (v12) {
    [v11 persistentStateManager:self didFetchStoredListInfo:v12];
  }
}

void __97__NCNotificationListPersistentStateManager__publishOnReadForStoredPersistentStateRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:@"0.section.type"];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) persistentStateManager:*(void *)(a1 + 40) hasStoredDataForSectionType:NCNotificationListSectionTypeFromString(v3)];
    id v3 = v4;
  }
}

- (id)_listRepresentationForNotificationList:(id)a3 sections:(id)a4 listCache:(id)a5 migrationScheduler:(id)a6 listInfo:(id)a7 detailed:(BOOL)a8 hashIdentifiers:(BOOL)a9 includeHistory:(BOOL)a10 includeHidden:(BOOL)a11
{
  BOOL v43 = a8;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v16 = a4;
  id v44 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = v16;
  objc_super v20 = v19;
  if (a10)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    __int16 v21 = [v45 notificationSections];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v50 count:16];
    objc_super v20 = v19;
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v47 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          if (![v26 sectionType])
          {
            objc_super v20 = [v19 arrayByAddingObject:v26];

            goto LABEL_12;
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (v23) {
          continue;
        }
        break;
      }
      objc_super v20 = v19;
    }
LABEL_12:
  }
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v27 setObject:&unk_1F2F84430 forKey:@"0.list.formatVersion"];
  dateFormatter = self->_dateFormatter;
  unint64_t v29 = [MEMORY[0x1E4F1C9C8] date];
  v30 = [(NSDateFormatter *)dateFormatter stringFromDate:v29];
  [v27 setObject:v30 forKey:@"0.list.stateTimestamp"];

  v31 = [(NCNotificationListPersistentStateManager *)self _representationForSections:v20 detailed:v43 hashIdentifiers:a9 includeHidden:a11];
  [v27 setObject:v31 forKey:@"3.list.sections"];

  id v32 = [(NCNotificationListPersistentStateManager *)self storedPersistentStateRepresentation];

  if (v32)
  {
    v33 = [(NCNotificationListPersistentStateManager *)self storedPersistentStateRepresentation];
    id v34 = [(NCNotificationListPersistentStateManager *)self _mutableRepresentationForStoredListRepresentation:v33];

    if (v34) {
      [v27 setObject:v34 forKey:@"5.list.pendingStore"];
    }
  }
  if (v17)
  {
    id v35 = [(NCNotificationListPersistentStateManager *)self _representationForMigrationScheduler:v17];
    uint64_t v36 = v35;
    if (v35 && [v35 count]) {
      [v27 setObject:v36 forKey:@"4.list.migrationTimes"];
    }
  }
  v37 = [(NCNotificationListPersistentStateManager *)self storedPersistentMigrationTimes];

  if (v37)
  {
    v38 = [(NCNotificationListPersistentStateManager *)self storedPersistentMigrationTimes];
    __int16 v39 = [(NCNotificationListPersistentStateManager *)self _mutableRepresentationForRepresentationForRequestMigrationTimes:v38];

    if (v39) {
      [v27 setObject:v39 forKey:@"6.list.pendingMigrationTimes"];
    }
  }
  if (v18 && [v18 count]) {
    [v27 setObject:v18 forKey:@"7.list.infoStore"];
  }
  if (v43)
  {
    v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v45, "totalNotificationCount"));
    [v27 setObject:v40 forKey:@"1.list.totalNotificationCount"];

    if (v44)
    {
      __int16 v41 = [(NCNotificationListPersistentStateManager *)self _representationForListCache:v44];
      [v27 setObject:v41 forKey:@"2.list.cacheState"];
    }
  }

  return v27;
}

- (BOOL)_isListRepresentation:(id)a3 equalToListRepresentation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 objectForKey:@"3.list.sections"];
  uint64_t v9 = [v7 objectForKey:@"3.list.sections"];
  if ([(NCNotificationListPersistentStateManager *)self _isRepresentationForSections:v8 equalToRepresentationForSections:v9])
  {
    uint8_t v10 = [v6 objectForKey:@"4.list.migrationTimes"];
    id v11 = [v7 objectForKey:@"4.list.migrationTimes"];
    BOOL v12 = [(NCNotificationListPersistentStateManager *)self _isRepresentationForMigrationTimes:v10 equalToRepresentationForMigrationTimes:v11];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (int)_formatVersionForListRepresentation:(id)a3
{
  id v3 = [a3 objectForKey:@"0.list.formatVersion"];
  id v4 = v3;
  if (v3) {
    int v5 = [v3 intValue];
  }
  else {
    int v5 = -1;
  }

  return v5;
}

- (id)_mutableRepresentationForStoredListRepresentation:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [v5 objectForKey:@"3.list.sections"];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __94__NCNotificationListPersistentStateManager__mutableRepresentationForStoredListRepresentation___block_invoke;
  id v17 = &unk_1E6A94A88;
  id v18 = self;
  id v19 = v8;
  id v9 = v8;
  [v7 enumerateObjectsUsingBlock:&v14];
  objc_msgSend(v6, "setObject:forKey:", v9, @"3.list.sections", v14, v15, v16, v17, v18);
  uint8_t v10 = [v5 objectForKey:@"5.list.pendingStore"];

  [(NCNotificationListPersistentStateManager *)self _mergePendingNotificationListRepresentation:v10 withMutableListRepresentation:v6];
  if ([v9 count]) {
    id v11 = v6;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  return v12;
}

void __94__NCNotificationListPersistentStateManager__mutableRepresentationForStoredListRepresentation___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _mutableRepresentationForRepresentationForSection:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

- (void)_mergePendingNotificationListRepresentation:(id)a3 withMutableListRepresentation:(id)a4
{
  id v6 = a4;
  id v7 = [a3 objectForKey:@"3.list.sections"];
  id v8 = [v6 objectForKey:@"3.list.sections"];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __118__NCNotificationListPersistentStateManager__mergePendingNotificationListRepresentation_withMutableListRepresentation___block_invoke;
  v10[3] = &unk_1E6A94A60;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [v7 enumerateObjectsUsingBlock:v10];
}

void __118__NCNotificationListPersistentStateManager__mergePendingNotificationListRepresentation_withMutableListRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 objectForKey:@"0.section.type"];
  id v4 = objc_msgSend(*(id *)(a1 + 32), "_sectionRepresentationOfSectionType:inRepresentationForSections:");
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [v5 _mergeRepresentationForSection:v3 withMutableRepresentationForSection:v4];
  }
  else
  {
    id v4 = [v5 _mutableRepresentationForRepresentationForSection:v3];

    [*(id *)(a1 + 40) addObject:v4];
  }
}

- (void)_clearStoredListRepresentationForSectionIdentifier:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (NSObject **)MEMORY[0x1E4FB3770];
  id v6 = (void *)*MEMORY[0x1E4FB3770];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3770], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = v9;
    __int16 v24 = 2114;
    id v25 = v4;
    _os_log_impl(&dword_1D7C04000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ clearing stored notifications for section %{public}@", buf, 0x16u);
  }
  uint8_t v10 = [(NSMutableDictionary *)self->_storedPersistentStateRepresentation objectForKey:@"3.list.sections"];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __95__NCNotificationListPersistentStateManager__clearStoredListRepresentationForSectionIdentifier___block_invoke;
  v19[3] = &unk_1E6A94AB0;
  v19[4] = self;
  id v12 = v4;
  id v20 = v12;
  id v13 = v11;
  id v21 = v13;
  [v10 enumerateObjectsUsingBlock:v19];
  [v10 removeObjectsInArray:v13];
  if (![v10 count])
  {
    uint64_t v14 = *v5;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v14;
      id v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138543362;
      uint64_t v23 = v17;
      _os_log_impl(&dword_1D7C04000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ has no more stored notifications. Clearing persistent store representation", buf, 0xCu);
    }
    storedPersistentStateRepresentation = self->_storedPersistentStateRepresentation;
    self->_storedPersistentStateRepresentation = 0;
  }
}

void __95__NCNotificationListPersistentStateManager__clearStoredListRepresentationForSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _clearStoredSectionIdentifier:*(void *)(a1 + 40) inMutableRepresentationForSection:v3];
  if ([*(id *)(a1 + 32) _isRepresentationForSectionEmpty:v3])
  {
    [*(id *)(a1 + 48) addObject:v3];
    id v4 = [v3 objectForKey:@"0.section.type"];
    id v5 = v4;
    if (v4)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __95__NCNotificationListPersistentStateManager__clearStoredListRepresentationForSectionIdentifier___block_invoke_2;
      v6[3] = &unk_1E6A91A68;
      v6[4] = *(void *)(a1 + 32);
      id v7 = v4;
      dispatch_async(MEMORY[0x1E4F14428], v6);
    }
  }
}

void __95__NCNotificationListPersistentStateManager__clearStoredListRepresentationForSectionIdentifier___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 persistentStateManager:*(void *)(a1 + 32) finishedLoadingDataForSectionType:NCNotificationListSectionTypeFromString(*(void **)(a1 + 40))];
}

- (BOOL)_isMutableListRepresentationEmpty:(id)a3
{
  id v3 = [a3 objectForKey:@"3.list.sections"];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (id)_representationForListCache:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "activeNotificationCellCount"));
  [v5 setObject:v6 forKey:@"0.cache.activeViews"];

  id v7 = NSNumber;
  uint64_t v8 = [v4 currentCacheSizeCount];

  id v9 = [v7 numberWithUnsignedInteger:v8];
  [v5 setObject:v9 forKey:@"1.cache.availableViews"];

  return v5;
}

- (id)_representationForMigrationScheduler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [v4 upcomingScheduledMigrationDate];
  if (v6)
  {
    id v7 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v6];
    [v5 setObject:v7 forKey:@"0.migrationTime.upcoming"];
  }
  uint64_t v8 = [v4 migrationDateForNotificationDigest];
  if (v8)
  {
    id v9 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v8];
    [v5 setObject:v9 forKey:@"1.migrationTime.summary"];
  }
  uint8_t v10 = [v4 migrationDatesForNotificationRequests];
  if ([v10 count])
  {
    id v11 = [(NCNotificationListPersistentStateManager *)self _representationForRequestMigrationTimes:v10];
    [v5 setObject:v11 forKey:@"2.migrationTime.requests"];
  }
  id v12 = [v4 migratedTimeSensitiveNotificationRequests];
  if ([v12 count])
  {
    id v13 = [(NCNotificationListPersistentStateManager *)self _representationForMigratedTimeSensitiveNotificationRequests:v12];
    [v5 setObject:v13 forKey:@"3.migrationTime.migratedTimeSensitiveNotificationRequests"];
  }

  return v5;
}

- (id)_summaryMigrationTimeInRepresentationForList:(id)a3
{
  id v4 = [a3 objectForKey:@"4.list.migrationTimes"];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKey:@"1.migrationTime.summary"];
    if (v6)
    {
      id v7 = [(NSDateFormatter *)self->_dateFormatter dateFromString:v6];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)_isRepresentationForMigrationTimes:(id)a3 equalToRepresentationForMigrationTimes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v6;
  id v9 = [v7 objectForKey:@"0.migrationTime.upcoming"];
  uint8_t v10 = [v8 objectForKey:@"0.migrationTime.upcoming"];
  if (![v9 isEqualToString:v10]) {
    goto LABEL_5;
  }
  id v11 = [v7 objectForKey:@"1.migrationTime.summary"];
  id v12 = [v8 objectForKey:@"1.migrationTime.summary"];
  int v13 = [v11 isEqualToString:v12];

  if (!v13) {
    goto LABEL_5;
  }
  uint64_t v14 = [v7 objectForKey:@"2.migrationTime.requests"];
  uint64_t v15 = [v8 objectForKey:@"2.migrationTime.requests"];
  int v16 = [v14 isEqualToDictionary:v15];

  if (v16)
  {
    id v17 = [v7 objectForKey:@"3.migrationTime.migratedTimeSensitiveNotificationRequests"];
    id v18 = [v8 objectForKey:@"3.migrationTime.migratedTimeSensitiveNotificationRequests"];
    char v19 = [v17 isEqualToDictionary:v18];
  }
  else
  {
LABEL_5:
    char v19 = 0;
  }

  return v19;
}

- (id)_representationForRequestMigrationTimes:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__NCNotificationListPersistentStateManager__representationForRequestMigrationTimes___block_invoke;
  v10[3] = &unk_1E6A93CB8;
  id v7 = v6;
  id v11 = v7;
  id v12 = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  id v8 = v7;
  return v8;
}

void __84__NCNotificationListPersistentStateManager__representationForRequestMigrationTimes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  id v5 = a2;
  id v6 = [v5 sectionIdentifier];
  id v7 = [*(id *)(a1 + 32) objectForKey:v6];
  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [*(id *)(a1 + 32) setObject:v7 forKey:v6];
  }
  id v8 = [*(id *)(*(void *)(a1 + 40) + 72) stringFromDate:v11];
  id v9 = [v5 notificationIdentifier];

  uint8_t v10 = objc_msgSend(v9, "un_logDigest");
  [v7 setObject:v8 forKey:v10];
}

- (id)_mutableRepresentationForRequestMigrationTimesInRepresentationForList:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = v4;
  id v7 = [v6 objectForKey:@"4.list.migrationTimes"];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 objectForKey:@"2.migrationTime.requests"];
    if (v9)
    {
      uint64_t v10 = [(NCNotificationListPersistentStateManager *)self _mutableRepresentationForRepresentationForRequestMigrationTimes:v9];

      id v5 = (id)v10;
    }
  }
  id v11 = [v6 objectForKey:@"6.list.pendingMigrationTimes"];
  if (v11) {
    [(NCNotificationListPersistentStateManager *)self _mergePendingRequestMigrationTimesRepresentation:v11 withMutableRepresentationForRequestMigrationTimes:v5];
  }
  if ([v5 count]) {
    id v12 = v5;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (id)_mutableRepresentationForRepresentationForRequestMigrationTimes:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __108__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForRequestMigrationTimes___block_invoke;
  v7[3] = &unk_1E6A94B00;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __108__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForRequestMigrationTimes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __108__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForRequestMigrationTimes___block_invoke_2;
    v11[3] = &unk_1E6A94AD8;
    id v12 = v7;
    id v8 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v11];
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = (void *)[v5 copy];
    [v9 setObject:v8 forKey:v10];
  }
}

void __108__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForRequestMigrationTimes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v7 = (id)[a3 copy];
  id v6 = (void *)[v5 copy];

  [v4 setObject:v7 forKey:v6];
}

- (void)_mergePendingRequestMigrationTimesRepresentation:(id)a3 withMutableRepresentationForRequestMigrationTimes:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __143__NCNotificationListPersistentStateManager__mergePendingRequestMigrationTimesRepresentation_withMutableRepresentationForRequestMigrationTimes___block_invoke;
  v7[3] = &unk_1E6A94B00;
  id v8 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __143__NCNotificationListPersistentStateManager__mergePendingRequestMigrationTimesRepresentation_withMutableRepresentationForRequestMigrationTimes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKey:v8];
  if (v6)
  {
    id v7 = v6;
    [v6 addEntriesFromDictionary:v5];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v7 addEntriesFromDictionary:v5];
    [*(id *)(a1 + 32) setObject:v7 forKey:v8];
  }
}

- (void)_clearStoredRequestMigrationTimesForSectionIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(NSMutableDictionary *)self->_storedPersistentMigrationTimes removeObjectForKey:a3];
  if (![(NSMutableDictionary *)self->_storedPersistentMigrationTimes count])
  {
    id v4 = (void *)*MEMORY[0x1E4FB3770];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3770], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v9 = 138543362;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ has no more stored migration times. Clearing persistent representation.", (uint8_t *)&v9, 0xCu);
    }
    storedPersistentMigrationTimes = self->_storedPersistentMigrationTimes;
    self->_storedPersistentMigrationTimes = 0;
  }
}

- (id)_getStoredMigrationTimeAndClearNotificationRequest:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 sectionIdentifier];
  id v6 = [(NSMutableDictionary *)self->_storedPersistentMigrationTimes objectForKey:v5];
  if (v6)
  {
    id v7 = [v4 notificationIdentifier];
    id v8 = objc_msgSend(v7, "un_logDigest");

    int v9 = [v6 objectForKey:v8];
    if (v9)
    {
      uint64_t v10 = [(NSDateFormatter *)self->_dateFormatter dateFromString:v9];
      [v6 removeObjectForKey:v8];
    }
    else
    {
      uint64_t v10 = 0;
    }
    if (![v6 count])
    {
      [(NSMutableDictionary *)self->_storedPersistentMigrationTimes removeObjectForKey:v5];
      if (![(NSMutableDictionary *)self->_storedPersistentMigrationTimes count])
      {
        uint64_t v11 = (void *)*MEMORY[0x1E4FB3770];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3770], OS_LOG_TYPE_DEFAULT))
        {
          id v12 = v11;
          id v13 = (objc_class *)objc_opt_class();
          uint64_t v14 = NSStringFromClass(v13);
          int v17 = 138543362;
          id v18 = v14;
          _os_log_impl(&dword_1D7C04000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ has no more stored migration times. Clearing persistent representation.", (uint8_t *)&v17, 0xCu);
        }
        storedPersistentMigrationTimes = self->_storedPersistentMigrationTimes;
        self->_storedPersistentMigrationTimes = 0;
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_representationForMigratedTimeSensitiveNotificationRequests:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __104__NCNotificationListPersistentStateManager__representationForMigratedTimeSensitiveNotificationRequests___block_invoke;
  v8[3] = &unk_1E6A92E30;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __104__NCNotificationListPersistentStateManager__representationForMigratedTimeSensitiveNotificationRequests___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 sectionIdentifier];
  id v4 = [*(id *)(a1 + 32) objectForKey:v3];
  if (!v4)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(a1 + 32) setObject:v4 forKey:v3];
  }
  id v5 = [v7 notificationIdentifier];
  id v6 = objc_msgSend(v5, "un_logDigest");
  [v4 addObject:v6];
}

- (id)_mutableRepresentationForMigratedTimeSensitiveNotificationRequestsInRepresentationForList:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [v4 objectForKey:@"4.list.migrationTimes"];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKey:@"3.migrationTime.migratedTimeSensitiveNotificationRequests"];
    if (v8)
    {
      uint64_t v9 = [(NCNotificationListPersistentStateManager *)self _mutableRepresentationForRepresentationForMigratedTimeSensitiveNotificationRequests:v8];

      id v5 = (id)v9;
    }
  }

  return v5;
}

- (id)_mutableRepresentationForRepresentationForMigratedTimeSensitiveNotificationRequests:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __128__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForMigratedTimeSensitiveNotificationRequests___block_invoke;
  v7[3] = &unk_1E6A94B50;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __128__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForMigratedTimeSensitiveNotificationRequests___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __128__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForMigratedTimeSensitiveNotificationRequests___block_invoke_2;
    v11[3] = &unk_1E6A94B28;
    id v12 = v7;
    id v8 = v7;
    [v6 enumerateObjectsUsingBlock:v11];
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = (void *)[v5 copy];
    [v9 setObject:v8 forKey:v10];
  }
}

void __128__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForMigratedTimeSensitiveNotificationRequests___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (id)[a2 copy];
  [v2 addObject:v3];
}

- (void)_clearStoredMigratedTimeSensitiveNotificationRequestsForSectionIdentifier:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(NSMutableDictionary *)self->_storedPersistentMigratedTimeSensitiveNotificationRequests removeObjectForKey:a3];
  if (![(NSMutableDictionary *)self->_storedPersistentMigratedTimeSensitiveNotificationRequests count])
  {
    id v4 = (void *)*MEMORY[0x1E4FB3770];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3770], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = v4;
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v9 = 138543362;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ has no more stored migrated time sensitive notifications. Clearing persistent representation.", (uint8_t *)&v9, 0xCu);
    }
    storedPersistentMigratedTimeSensitiveNotificationRequests = self->_storedPersistentMigratedTimeSensitiveNotificationRequests;
    self->_storedPersistentMigratedTimeSensitiveNotificationRequests = 0;
  }
}

- (BOOL)_isMigratedTimeSensitiveNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sectionIdentifier];
  id v6 = [(NSMutableDictionary *)self->_storedPersistentMigratedTimeSensitiveNotificationRequests objectForKey:v5];
  if (v6)
  {
    id v7 = [v4 notificationIdentifier];
    id v8 = objc_msgSend(v7, "un_logDigest");

    char v9 = [v6 containsObject:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)_representationForSections:(id)a3 detailed:(BOOL)a4 hashIdentifiers:(BOOL)a5 includeHidden:(BOOL)a6
{
  uint64_t v10 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v11 = a3;
  id v12 = objc_alloc_init(v10);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __110__NCNotificationListPersistentStateManager__representationForSections_detailed_hashIdentifiers_includeHidden___block_invoke;
  v17[3] = &unk_1E6A94B78;
  BOOL v19 = a6;
  v17[4] = self;
  BOOL v20 = a4;
  BOOL v21 = a5;
  id v13 = v12;
  id v18 = v13;
  [v11 enumerateObjectsUsingBlock:v17];

  uint64_t v14 = v18;
  id v15 = v13;

  return v15;
}

void __110__NCNotificationListPersistentStateManager__representationForSections_detailed_hashIdentifiers_includeHidden___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v4 = [v3 notificationCountIncludingHidden];
  }
  else {
    uint64_t v4 = [v3 notificationCount];
  }
  id v5 = v7;
  if (v4)
  {
    id v6 = [*(id *)(a1 + 32) _representationForSection:v7 detailed:*(unsigned __int8 *)(a1 + 49) hashIdentifiers:*(unsigned __int8 *)(a1 + 50) includeHidden:*(unsigned __int8 *)(a1 + 48)];
    [*(id *)(a1 + 40) addObject:v6];

    id v5 = v7;
  }
}

- (id)_representationForSection:(id)a3 detailed:(BOOL)a4 hashIdentifiers:(BOOL)a5 includeHidden:(BOOL)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = NCNotificationListSectionTypeString([v10 sectionType]);
  [v11 setObject:v12 forKey:@"0.section.type"];

  if (a6) {
    [v10 allNotificationGroupsIncludingHidden];
  }
  else {
  id v13 = [v10 allNotificationGroups];
  }
  if ([v13 count])
  {
    uint64_t v14 = [(NCNotificationListPersistentStateManager *)self _representationForGroups:v13 detailed:v8 hashIdentifiers:v7];
    [v11 setObject:v14 forKey:@"3.section.groups"];
  }
  if (v8)
  {
    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "notificationCount"));
    [v11 setObject:v15 forKey:@"1.section.notificationCount"];

    int v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    [v11 setObject:v16 forKey:@"2.section.groupCount"];
  }

  return v11;
}

- (BOOL)_isRepresentationForSections:(id)a3 equalToRepresentationForSections:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  uint64_t v10 = [v8 count];
  if (v10 == [v9 count])
  {
    uint64_t v11 = [v8 count];
    if (v11)
    {
      unint64_t v12 = v11;
      uint64_t v13 = 0;
      BOOL v14 = 0;
      do
      {
        id v15 = [v8 objectAtIndex:v13];
        int v16 = [v9 objectAtIndex:v13];
        BOOL v17 = [(NCNotificationListPersistentStateManager *)self _isRepresentationForSection:v15 equalToRepresentationForSection:v16];

        if (!v17) {
          break;
        }
        BOOL v14 = v12 <= ++v13;
      }
      while (v12 != v13);
    }
    else
    {
      BOOL v14 = 1;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_isRepresentationForSection:(id)a3 equalToRepresentationForSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKey:@"0.section.type"];
  id v9 = [v7 objectForKey:@"0.section.type"];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    uint64_t v11 = [v6 objectForKey:@"3.section.groups"];
    unint64_t v12 = [v7 objectForKey:@"3.section.groups"];
    BOOL v13 = [(NCNotificationListPersistentStateManager *)self _isRepresentationForGroups:v11 equalToRepresentationForGroups:v12];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (unint64_t)_getSectionTypeAndRemoveNotificationRequest:(id)a3 inMutableRepresentationForSections:(id)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  id v7 = a4;
  uint64_t v16 = 0;
  BOOL v17 = &v16;
  uint64_t v18 = 0x3032000000;
  BOOL v19 = __Block_byref_object_copy__14;
  BOOL v20 = __Block_byref_object_dispose__14;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __123__NCNotificationListPersistentStateManager__getSectionTypeAndRemoveNotificationRequest_inMutableRepresentationForSections___block_invoke;
  v12[3] = &unk_1E6A94BA0;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  BOOL v14 = &v22;
  id v15 = &v16;
  [v7 enumerateObjectsUsingBlock:v12];
  if (v17[5]
    && -[NCNotificationListPersistentStateManager _isRepresentationForSectionEmpty:](self, "_isRepresentationForSectionEmpty:"))
  {
    [v7 removeObject:v17[5]];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __123__NCNotificationListPersistentStateManager__getSectionTypeAndRemoveNotificationRequest_inMutableRepresentationForSections___block_invoke_2;
    v11[3] = &unk_1E6A94BC8;
    void v11[4] = self;
    v11[5] = &v22;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
  unint64_t v9 = v23[3];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __123__NCNotificationListPersistentStateManager__getSectionTypeAndRemoveNotificationRequest_inMutableRepresentationForSections___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 objectForKey:@"0.section.type"];
  uint64_t v8 = NCNotificationListSectionTypeFromString(v7);

  if (v8 == 10
    && [*(id *)(a1 + 32) _containsNotificationRequest:*(void *)(a1 + 40) inMutableRepresentationForSection:v9 shouldRemove:0])
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 10;
  }
  else
  {
    if (![*(id *)(a1 + 32) _containsNotificationRequest:*(void *)(a1 + 40) inMutableRepresentationForSection:v9 shouldRemove:1])goto LABEL_7; {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  *a4 = 1;
LABEL_7:
}

void __123__NCNotificationListPersistentStateManager__getSectionTypeAndRemoveNotificationRequest_inMutableRepresentationForSections___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 persistentStateManager:*(void *)(a1 + 32) finishedLoadingDataForSectionType:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
}

- (BOOL)_containsNotificationRequest:(id)a3 inMutableRepresentationForSection:(id)a4 shouldRemove:(BOOL)a5
{
  id v8 = a3;
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  id v9 = a4;
  int v10 = [v9 objectForKey:@"3.section.groups"];
  uint64_t v19 = 0;
  BOOL v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__14;
  uint64_t v23 = __Block_byref_object_dispose__14;
  id v24 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __120__NCNotificationListPersistentStateManager__containsNotificationRequest_inMutableRepresentationForSection_shouldRemove___block_invoke;
  v14[3] = &unk_1E6A94BF0;
  uint64_t v16 = &v25;
  v14[4] = self;
  id v11 = v8;
  BOOL v18 = a5;
  id v15 = v11;
  BOOL v17 = &v19;
  [v10 enumerateObjectsUsingBlock:v14];
  if (*((unsigned char *)v26 + 24)
    && [(NCNotificationListPersistentStateManager *)self _isRepresentationForGroupEmpty:v20[5]])
  {
    [v10 removeObject:v20[5]];
  }
  char v12 = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

void __120__NCNotificationListPersistentStateManager__containsNotificationRequest_inMutableRepresentationForSection_shouldRemove___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _containsNotificationRequest:*(void *)(a1 + 40) inMutableRepresentationForGroup:v6 shouldRemove:*(unsigned __int8 *)(a1 + 64)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
  id v9 = v6;

  LOBYTE(a1) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  *a4 = a1;
}

- (id)_mutableRepresentationForRepresentationForSection:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = v4;
  uint64_t v7 = [v6 objectForKey:@"0.section.type"];
  id v8 = v7;
  if (v7)
  {
    id v9 = (void *)[v7 copy];
    [v5 setObject:v9 forKey:@"0.section.type"];
  }
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = [v6 objectForKey:@"3.section.groups"];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __94__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForSection___block_invoke;
  BOOL v17 = &unk_1E6A94A88;
  BOOL v18 = self;
  id v12 = v10;
  id v19 = v12;
  [v11 enumerateObjectsUsingBlock:&v14];
  if (objc_msgSend(v12, "count", v14, v15, v16, v17, v18)) {
    [v5 setObject:v12 forKey:@"3.section.groups"];
  }

  return v5;
}

void __94__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForSection___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _mutableRepresentationForRepresentationForGroup:a2];
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)_sectionRepresentationOfSectionType:(id)a3 inRepresentationForSections:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __108__NCNotificationListPersistentStateManager__sectionRepresentationOfSectionType_inRepresentationForSections___block_invoke;
  v11[3] = &unk_1E6A94C18;
  id v7 = v5;
  id v12 = v7;
  uint64_t v8 = [v6 indexOfObjectPassingTest:v11];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [v6 objectAtIndex:v8];
  }

  return v9;
}

uint64_t __108__NCNotificationListPersistentStateManager__sectionRepresentationOfSectionType_inRepresentationForSections___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:@"0.section.type"];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_mergeRepresentationForSection:(id)a3 withMutableRepresentationForSection:(id)a4
{
  id v6 = a3;
  id v7 = [a4 objectForKey:@"3.section.groups"];
  uint64_t v8 = [v6 objectForKey:@"3.section.groups"];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __111__NCNotificationListPersistentStateManager__mergeRepresentationForSection_withMutableRepresentationForSection___block_invoke;
  v10[3] = &unk_1E6A94A60;
  void v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 enumerateObjectsUsingBlock:v10];
}

void __111__NCNotificationListPersistentStateManager__mergeRepresentationForSection_withMutableRepresentationForSection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 objectForKey:@"1.group.sectionIdentifier"];
  uint64_t v4 = [v3 objectForKey:@"2.group.threadIdentifier"];
  id v5 = [*(id *)(a1 + 32) _representationForGroupWithSectionIdentifier:v7 threadIdentifier:v4 inRepresentationForGroups:*(void *)(a1 + 40)];
  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    [v6 _mergeRepresentationForGroup:v3 withMutableRepresentationForGroup:v5];
  }
  else
  {
    id v5 = [v6 _mutableRepresentationForRepresentationForGroup:v3];

    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (void)_clearStoredSectionIdentifier:(id)a3 inMutableRepresentationForSection:(id)a4
{
  id v5 = a3;
  id v6 = [a4 objectForKey:@"3.section.groups"];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __108__NCNotificationListPersistentStateManager__clearStoredSectionIdentifier_inMutableRepresentationForSection___block_invoke;
  id v13 = &unk_1E6A94A60;
  id v14 = v5;
  id v15 = v7;
  id v8 = v5;
  id v9 = v7;
  [v6 enumerateObjectsUsingBlock:&v10];
  objc_msgSend(v6, "removeObjectsInArray:", v9, v10, v11, v12, v13);
}

void __108__NCNotificationListPersistentStateManager__clearStoredSectionIdentifier_inMutableRepresentationForSection___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [v4 objectForKey:@"1.group.sectionIdentifier"];
  if ([*(id *)(a1 + 32) isEqualToString:v3]) {
    [*(id *)(a1 + 40) addObject:v4];
  }
}

- (BOOL)_isRepresentationForSectionEmpty:(id)a3
{
  id v3 = [a3 objectForKey:@"3.section.groups"];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (id)_representationForGroups:(id)a3 detailed:(BOOL)a4 hashIdentifiers:(BOOL)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v9 = a3;
  id v10 = objc_alloc_init(v8);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __94__NCNotificationListPersistentStateManager__representationForGroups_detailed_hashIdentifiers___block_invoke;
  v15[3] = &unk_1E6A94C40;
  v15[4] = self;
  BOOL v17 = a4;
  BOOL v18 = a5;
  id v11 = v10;
  id v16 = v11;
  [v9 enumerateObjectsUsingBlock:v15];

  id v12 = v16;
  id v13 = v11;

  return v13;
}

void __94__NCNotificationListPersistentStateManager__representationForGroups_detailed_hashIdentifiers___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = [*(id *)(a1 + 32) _representationForGroup:a2 atIndex:a3 detailed:*(unsigned __int8 *)(a1 + 48) hashIdentifiers:*(unsigned __int8 *)(a1 + 49)];
  [*(id *)(a1 + 40) addObject:v4];
}

- (id)_representationForGroup:(id)a3 atIndex:(unint64_t)a4 detailed:(BOOL)a5 hashIdentifiers:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v12 = [v10 sectionIdentifier];
  id v13 = (void *)[v12 copy];
  [v11 setObject:v13 forKey:@"1.group.sectionIdentifier"];

  if (v6)
  {
    id v14 = [v10 threadIdentifier];
    id v15 = objc_msgSend(v14, "un_logDigest");
    [v11 setObject:v15 forKey:@"2.group.threadIdentifier"];

LABEL_5:
    goto LABEL_6;
  }
  id v16 = [v10 leadingNotificationRequest];
  int v17 = [v16 isUniqueThreadIdentifier];

  if (v17)
  {
    id v14 = [v10 threadIdentifier];
    [v11 setObject:v14 forKey:@"2.group.threadIdentifier"];
    goto LABEL_5;
  }
LABEL_6:
  BOOL v18 = [v10 allNotificationRequests];
  id v19 = [(NCNotificationListPersistentStateManager *)self _representationForNotificationRequests:v18 detailed:v7 hashIdentifiers:v6];
  [v11 setObject:v19 forKey:@"5.group.notificationRequests"];

  if (v7)
  {
    BOOL v20 = [NSNumber numberWithUnsignedInteger:a4];
    [v11 setObject:v20 forKey:@"0.group.index"];

    uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    [v11 setObject:v21 forKey:@"4.group.notificationCount"];

    uint64_t v22 = [v10 leadingNotificationRequest];

    if (v22)
    {
      uint64_t v23 = [v10 leadingNotificationRequest];
      id v24 = [v23 timestamp];

      if (v24)
      {
        uint64_t v25 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v24];
        [v11 setObject:v25 forKey:@"3.group.timestamp"];
      }
    }
  }

  return v11;
}

- (BOOL)_isRepresentationForGroups:(id)a3 equalToRepresentationForGroups:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v7;
  uint64_t v10 = [v8 count];
  if (v10 == [v9 count])
  {
    uint64_t v11 = [v8 count];
    if (v11)
    {
      unint64_t v12 = v11;
      uint64_t v13 = 0;
      BOOL v14 = 0;
      do
      {
        id v15 = [v8 objectAtIndex:v13];
        id v16 = [v9 objectAtIndex:v13];
        BOOL v17 = [(NCNotificationListPersistentStateManager *)self _isRepresentationForGroup:v15 equalToRepresentationForGroup:v16];

        if (!v17) {
          break;
        }
        BOOL v14 = v12 <= ++v13;
      }
      while (v12 != v13);
    }
    else
    {
      BOOL v14 = 1;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_isRepresentationForGroup:(id)a3 equalToRepresentationForGroup:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v6;
  id v9 = [v7 objectForKey:@"1.group.sectionIdentifier"];
  uint64_t v10 = [v8 objectForKey:@"1.group.sectionIdentifier"];
  int v11 = [v9 isEqualToString:v10];

  if (v11
    && ([v7 objectForKey:@"2.group.threadIdentifier"],
        unint64_t v12 = objc_claimAutoreleasedReturnValue(),
        [v8 objectForKey:@"2.group.threadIdentifier"],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v12 isEqualToString:v13],
        v13,
        v12,
        v14))
  {
    id v15 = [v7 objectForKey:@"5.group.notificationRequests"];
    id v16 = [v8 objectForKey:@"5.group.notificationRequests"];
    char v17 = [v15 isEqualToArray:v16];
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (BOOL)_containsNotificationRequest:(id)a3 inMutableRepresentationForGroup:(id)a4 shouldRemove:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 objectForKey:@"1.group.sectionIdentifier"];
  int v11 = [v9 objectForKey:@"2.group.threadIdentifier"];
  unint64_t v12 = [v9 objectForKey:@"5.group.notificationRequests"];

  uint64_t v13 = [(NCNotificationListPersistentStateManager *)self _representationForNotificationRequest:v8 hashIdentifiers:1];
  int v14 = [v8 sectionIdentifier];
  if (([v10 isEqualToString:v14] & 1) == 0)
  {

    LOBYTE(v17) = 0;
    goto LABEL_16;
  }
  id v15 = [v8 threadIdentifier];
  char v16 = [v11 isEqualToString:v15];
  BOOL v23 = v5;
  if ((v16 & 1) == 0)
  {
    BOOL v18 = [v8 threadIdentifier];
    uint64_t v22 = objc_msgSend(v18, "un_logDigest");
    if ((objc_msgSend(v11, "isEqualToString:") & 1) == 0)
    {
      int v17 = 0;
      goto LABEL_12;
    }
    if ([v12 containsObject:v13])
    {
      int v17 = 1;
      goto LABEL_12;
    }
    uint64_t v21 = v18;
LABEL_11:
    id v19 = [v8 notificationIdentifier];
    int v17 = [v12 containsObject:v19];

    BOOL v18 = v21;
    if (v16) {
      goto LABEL_13;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (([v12 containsObject:v13] & 1) == 0) {
    goto LABEL_11;
  }
  int v17 = 1;
LABEL_13:

  if (v17 && v23)
  {
    [v12 removeObject:v13];
    LOBYTE(v17) = 1;
  }
LABEL_16:

  return v17;
}

- (id)_mutableRepresentationForRepresentationForGroup:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [v4 objectForKey:@"1.group.sectionIdentifier"];
  id v7 = v6;
  if (v6)
  {
    id v8 = (void *)[v6 copy];
    [v5 setObject:v8 forKey:@"1.group.sectionIdentifier"];
  }
  id v9 = [v4 objectForKey:@"2.group.threadIdentifier"];
  uint64_t v10 = v9;
  if (v9)
  {
    int v11 = (void *)[v9 copy];
    [v5 setObject:v11 forKey:@"2.group.threadIdentifier"];
  }
  unint64_t v12 = [v4 objectForKey:@"5.group.notificationRequests"];
  if (v12)
  {
    uint64_t v13 = [(NCNotificationListPersistentStateManager *)self _mutableRepresentationForRepresentationForNotificationRequests:v12];
    [v5 setObject:v13 forKey:@"5.group.notificationRequests"];
  }

  return v5;
}

- (id)_representationForGroupWithSectionIdentifier:(id)a3 threadIdentifier:(id)a4 inRepresentationForGroups:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  int v17 = __132__NCNotificationListPersistentStateManager__representationForGroupWithSectionIdentifier_threadIdentifier_inRepresentationForGroups___block_invoke;
  BOOL v18 = &unk_1E6A94C68;
  id v19 = v7;
  id v20 = v8;
  id v10 = v7;
  id v11 = v8;
  uint64_t v12 = [v9 indexOfObjectPassingTest:&v15];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = objc_msgSend(v9, "objectAtIndex:", v12, v15, v16, v17, v18, v19, v20);
  }

  return v13;
}

uint64_t __132__NCNotificationListPersistentStateManager__representationForGroupWithSectionIdentifier_threadIdentifier_inRepresentationForGroups___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKey:@"1.group.sectionIdentifier"];
  id v5 = [v3 objectForKey:@"2.group.threadIdentifier"];

  if ([*(id *)(a1 + 32) isEqualToString:v4])
  {
    id v6 = objc_msgSend(*(id *)(a1 + 40), "un_logDigest");
    uint64_t v7 = [v6 isEqualToString:v5];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_mergeRepresentationForGroup:(id)a3 withMutableRepresentationForGroup:(id)a4
{
  id v6 = a4;
  id v8 = [a3 objectForKey:@"5.group.notificationRequests"];
  uint64_t v7 = [v6 objectForKey:@"5.group.notificationRequests"];

  [(NCNotificationListPersistentStateManager *)self _mergeRepresentationForNotificationRequests:v8 withMutableRepresentationForNotificationRequests:v7];
}

- (BOOL)_isRepresentationForGroupEmpty:(id)a3
{
  id v3 = [a3 objectForKey:@"5.group.notificationRequests"];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (id)_representationForNotificationRequests:(id)a3 detailed:(BOOL)a4 hashIdentifiers:(BOOL)a5
{
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA70];
  id v8 = a3;
  id v9 = [v7 orderedSet];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __108__NCNotificationListPersistentStateManager__representationForNotificationRequests_detailed_hashIdentifiers___block_invoke;
  v14[3] = &unk_1E6A94C90;
  BOOL v16 = a5;
  v14[4] = self;
  id v15 = v9;
  id v10 = v9;
  [v8 enumerateObjectsUsingBlock:v14];

  id v11 = [v10 array];
  uint64_t v12 = (void *)[v11 mutableCopy];

  return v12;
}

void __108__NCNotificationListPersistentStateManager__representationForNotificationRequests_detailed_hashIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _representationForNotificationRequest:a2 hashIdentifiers:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 40) addObject:v3];
}

- (id)_representationForNotificationRequest:(id)a3 hashIdentifiers:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [a3 notificationIdentifier];
  id v6 = v5;
  if (v4)
  {
    uint64_t v7 = objc_msgSend(v5, "un_logDigest");

    id v6 = (void *)v7;
  }

  return v6;
}

- (id)_mutableRepresentationForRepresentationForNotificationRequests:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __107__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForNotificationRequests___block_invoke;
  v7[3] = &unk_1E6A94B28;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateObjectsUsingBlock:v7];

  return v5;
}

uint64_t __107__NCNotificationListPersistentStateManager__mutableRepresentationForRepresentationForNotificationRequests___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)_mergeRepresentationForNotificationRequests:(id)a3 withMutableRepresentationForNotificationRequests:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __137__NCNotificationListPersistentStateManager__mergeRepresentationForNotificationRequests_withMutableRepresentationForNotificationRequests___block_invoke;
  v7[3] = &unk_1E6A94B28;
  id v8 = v5;
  id v6 = v5;
  [a3 enumerateObjectsUsingBlock:v7];
}

void __137__NCNotificationListPersistentStateManager__mergeRepresentationForNotificationRequests_withMutableRepresentationForNotificationRequests___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (NCNotificationListPersistentStateManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationListPersistentStateManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)storedPersistentStateRepresentation
{
  return self->_storedPersistentStateRepresentation;
}

- (void)setStoredPersistentStateRepresentation:(id)a3
{
}

- (NSMutableDictionary)currentStateRepresentation
{
  return self->_currentStateRepresentation;
}

- (void)setCurrentStateRepresentation:(id)a3
{
}

- (NSDate)storedPersistentSummaryMigrationTime
{
  return self->_storedPersistentSummaryMigrationTime;
}

- (void)setStoredPersistentSummaryMigrationTime:(id)a3
{
}

- (NSMutableDictionary)storedPersistentMigrationTimes
{
  return self->_storedPersistentMigrationTimes;
}

- (void)setStoredPersistentMigrationTimes:(id)a3
{
}

- (NSMutableDictionary)storedPersistentMigratedTimeSensitiveNotificationRequests
{
  return self->_storedPersistentMigratedTimeSensitiveNotificationRequests;
}

- (void)setStoredPersistentMigratedTimeSensitiveNotificationRequests:(id)a3
{
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (NSDictionary)cachedListRepresentation
{
  return self->_cachedListRepresentation;
}

- (void)setCachedListRepresentation:(id)a3
{
}

- (NSDictionary)cachedListRepresentationForThrottledWriteToFile
{
  return self->_cachedListRepresentationForThrottledWriteToFile;
}

- (void)setCachedListRepresentationForThrottledWriteToFile:(id)a3
{
}

- (NSDictionary)cachedListRepresentationForThrottledSendToVendor
{
  return self->_cachedListRepresentationForThrottledSendToVendor;
}

- (void)setCachedListRepresentationForThrottledSendToVendor:(id)a3
{
}

- (NSDictionary)lastWrittenListRepresentation
{
  return self->_lastWrittenListRepresentation;
}

- (void)setLastWrittenListRepresentation:(id)a3
{
}

- (NCSummaryServiceGateway)gateway
{
  return self->_gateway;
}

- (void)setGateway:(id)a3
{
}

- (NSArray)lastSectionsSentToGateway
{
  return self->_lastSectionsSentToGateway;
}

- (void)setLastSectionsSentToGateway:(id)a3
{
}

- (BOOL)hasLoadedStoredPersistentState
{
  return self->_loadedStoredPersistentState;
}

- (void)setLoadedStoredPersistentState:(BOOL)a3
{
  self->_loadedStoredPersistentState = a3;
}

- (BOOL)isFileWritingThrottled
{
  return self->_fileWritingThrottled;
}

- (void)setFileWritingThrottled:(BOOL)a3
{
  self->_fileWritingThrottled = a3;
}

- (BOOL)hasStoredCurrentDigestMigrationTimeExpired
{
  return self->_storedCurrentDigestMigrationTimeExpired;
}

- (void)setStoredCurrentDigestMigrationTimeExpired:(BOOL)a3
{
  self->_storedCurrentDigestMigrationTimeExpired = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSectionsSentToGateway, 0);
  objc_storeStrong((id *)&self->_gateway, 0);
  objc_storeStrong((id *)&self->_lastWrittenListRepresentation, 0);
  objc_storeStrong((id *)&self->_cachedListRepresentationForThrottledSendToVendor, 0);
  objc_storeStrong((id *)&self->_cachedListRepresentationForThrottledWriteToFile, 0);
  objc_storeStrong((id *)&self->_cachedListRepresentation, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_storedPersistentMigratedTimeSensitiveNotificationRequests, 0);
  objc_storeStrong((id *)&self->_storedPersistentMigrationTimes, 0);
  objc_storeStrong((id *)&self->_storedPersistentSummaryMigrationTime, 0);
  objc_storeStrong((id *)&self->_currentStateRepresentation, 0);
  objc_storeStrong((id *)&self->_storedPersistentStateRepresentation, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __145__NCNotificationListPersistentStateManager_updatePersistentStateForNotificationList_sectionLists_listCache_migrationScheduler_listInfo_detailed___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1D7C04000, log, OS_LOG_TYPE_ERROR, "Could not read persistent state file", v1, 2u);
}

- (void)_sendPersistentStateToVendor:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1D7C04000, log, OS_LOG_TYPE_ERROR, "Sending persistent state to vendor failed: representation is nil", v1, 2u);
}

- (void)_writePersistentStateToFileWithRepresentation:(void *)a1 .cold.1(void *a1)
{
  id v1 = a1;
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_4(&dword_1D7C04000, v4, v5, "%{public}@ encountered error writing notification list persistent state to file!", v6, v7, v8, v9, v10);
}

- (void)_writePersistentStateToFileWithRepresentation:(void *)a1 .cold.2(void *a1)
{
  id v2 = a1;
  id v3 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1D7C04000, v5, v6, "%{public}@ encountered error converting notification list persistent state to JSON! [err=%@]", v7, v8, v9, v10, v11);
}

@end