@interface FCPushNotificationCenter
- (FCPushNotificationCenter)init;
- (id)serverChangeTokenKey;
- (void)addObserver:(void *)a3 forChangesToRecordZoneID:(void *)a4 usingBlock:;
- (void)disableSyncing;
- (void)enableSyncing;
- (void)handleRemoteNotification:(id)a3 completionHandler:(id)a4;
- (void)initWithPrivateDatabase:(void *)a3 storeDirectory:;
- (void)prepareForUse;
- (void)removeRecordZoneObserver:(uint64_t)a1;
@end

@implementation FCPushNotificationCenter

- (void)initWithPrivateDatabase:(void *)a3 storeDirectory:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "privateDatabase != nil");
      *(_DWORD *)buf = 136315906;
      v15 = "-[FCPushNotificationCenter initWithPrivateDatabase:storeDirectory:]";
      __int16 v16 = 2080;
      v17 = "FCPushNotificationCenter.m";
      __int16 v18 = 1024;
      int v19 = 66;
      __int16 v20 = 2114;
      v21 = v12;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v13.receiver = a1;
    v13.super_class = (Class)FCPushNotificationCenter;
    id v8 = objc_msgSendSuper2(&v13, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong((id *)v8 + 2, a2);
      v9 = [[FCMapTable alloc] initWithKeyOptions:5 valueOptions:0 capacity:0];
      v10 = (void *)a1[3];
      a1[3] = v9;
    }
  }

  return a1;
}

- (void)disableSyncing
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    *(unsigned char *)(a1 + 8) = 0;
    v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v3 = -[FCPushNotificationCenter serverChangeTokenKey]();
    [v2 removeObjectForKey:v3];

    if (*(unsigned char *)(a1 + 8))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v4 = (void *)[[NSString alloc] initWithFormat:@"syncing should be disabled"];
        int v5 = 136315906;
        id v6 = "-[FCPushNotificationCenter(Setup) disableSyncing]";
        __int16 v7 = 2080;
        id v8 = "FCPushNotificationCenter.m";
        __int16 v9 = 1024;
        int v10 = 260;
        __int16 v11 = 2114;
        v12 = v4;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v5, 0x26u);
      }
    }
  }
}

- (id)serverChangeTokenKey
{
  v0 = [NSString stringWithFormat:@"%@-%lu-%lu", @"server-change-token", 2, 4];
  return v0;
}

- (FCPushNotificationCenter)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCPushNotificationCenter init]";
    __int16 v9 = 2080;
    int v10 = "FCPushNotificationCenter.m";
    __int16 v11 = 1024;
    int v12 = 61;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  int v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPushNotificationCenter init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)addObserver:(void *)a3 forChangesToRecordZoneID:(void *)a4 usingBlock:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_13;
  }
  [MEMORY[0x1E4F29060] isMainThread];
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
    *(_DWORD *)buf = 136315906;
    __int16 v16 = "-[FCPushNotificationCenter addObserver:forChangesToRecordZoneID:usingBlock:]";
    __int16 v17 = 2080;
    __int16 v18 = "FCPushNotificationCenter.m";
    __int16 v19 = 1024;
    int v20 = 82;
    __int16 v21 = 2114;
    uint64_t v22 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (!v8)
    {
LABEL_5:
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        __int16 v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "recordZoneID != nil");
        *(_DWORD *)buf = 136315906;
        __int16 v16 = "-[FCPushNotificationCenter addObserver:forChangesToRecordZoneID:usingBlock:]";
        __int16 v17 = 2080;
        __int16 v18 = "FCPushNotificationCenter.m";
        __int16 v19 = 1024;
        int v20 = 83;
        __int16 v21 = 2114;
        uint64_t v22 = v13;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
    }
  }
  else if (!v8)
  {
    goto LABEL_5;
  }
  if (v9)
  {
    if (v7 && v8)
    {
      int v10 = (void *)[v9 copy];
      __int16 v11 = +[FCPair pairWithFirst:v8 second:v10];

      [*(id *)(a1 + 24) setObject:v11 forKey:v7];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "block != nil");
    *(_DWORD *)buf = 136315906;
    __int16 v16 = "-[FCPushNotificationCenter addObserver:forChangesToRecordZoneID:usingBlock:]";
    __int16 v17 = 2080;
    __int16 v18 = "FCPushNotificationCenter.m";
    __int16 v19 = 1024;
    int v20 = 84;
    __int16 v21 = 2114;
    uint64_t v22 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_13:
}

- (void)removeRecordZoneObserver:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    if (v3)
    {
      [*(id *)(a1 + 24) removeObjectForKey:v3];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer != nil");
      *(_DWORD *)buf = 136315906;
      id v6 = "-[FCPushNotificationCenter removeRecordZoneObserver:]";
      __int16 v7 = 2080;
      id v8 = "FCPushNotificationCenter.m";
      __int16 v9 = 1024;
      int v10 = 96;
      __int16 v11 = 2114;
      int v12 = v4;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
  }
}

- (void)handleRemoteNotification:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1E4F29060] isMainThread];
  id v8 = FCCloudKitLog;
  if (os_log_type_enabled((os_log_t)FCCloudKitLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "handling notification userInfo:%@", (uint8_t *)&buf, 0xCu);
  }
  __int16 v9 = [MEMORY[0x1E4F1A1D0] notificationFromRemoteNotificationDictionary:v6];
  int v10 = [v9 subscriptionID];
  if ([v9 notificationType] == 4
    && [v10 isEqualToString:@"private-db-sub"])
  {
    id v11 = v7;
    if (self)
    {
      int v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      uint64_t v13 = -[FCPushNotificationCenter serverChangeTokenKey]();
      uint64_t v14 = [v12 objectForKey:v13];

      uint64_t v15 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
      uint64_t v23 = (void *)v14;
      __int16 v16 = v11;
      if (v14)
      {
        __int16 v17 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v15 fromData:v14 error:0];
      }
      else
      {
        __int16 v17 = 0;
      }
      if (v17) {
        uint64_t v20 = 17;
      }
      else {
        uint64_t v20 = 25;
      }
      privateDatabase = self->_privateDatabase;
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v25 = __81__FCPushNotificationCenter__handlePrivateDatabaseNotification_completionHandler___block_invoke;
      v26 = &unk_1E5B51B20;
      v27 = self;
      id v28 = v16;
      uint64_t v22 = privateDatabase;
      id v11 = v16;
      [(FCCKPrivateDatabase *)v22 fetchAllDatabaseChangesWithServerChangeToken:v17 qualityOfService:v20 completionQueue:MEMORY[0x1E4F14428] completionHandler:&buf];
    }
  }
  else
  {
    uint64_t v18 = objc_opt_new();
    __int16 v19 = (void *)v18;
    if (v18) {
      *(unsigned char *)(v18 + 8) = 0;
    }
    if (v7) {
      (*((void (**)(id, uint64_t))v7 + 2))(v7, v18);
    }
  }
}

void __81__FCPushNotificationCenter__handlePrivateDatabaseNotification_completionHandler___block_invoke(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  __int16 v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = FCCloudKitLog;
  BOOL v13 = os_log_type_enabled((os_log_t)FCCloudKitLog, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v13)
    {
      *(_DWORD *)long long buf = 138412546;
      v63 = v9;
      __int16 v64 = 2112;
      id v65 = v10;
      _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "fetched database changes changedRecordZoneIDs: %@ deletedRecordZoneIDs: %@", buf, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 32);
    v50 = v9;
    uint64_t v15 = v9;
    id v51 = v11;
    id v52 = v10;
    if (v14)
    {
      __int16 v16 = FCCloudKitLog;
      if (os_log_type_enabled((os_log_t)FCCloudKitLog, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        v63 = v15;
        _os_log_debug_impl(&dword_1A460D000, v16, OS_LOG_TYPE_DEBUG, "Zones changed: %@", buf, 0xCu);
      }
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v17 = *(id *)(v14 + 24);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v57 objects:buf count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v58 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = [*(id *)(v14 + 24) objectForKey:*(void *)(*((void *)&v57 + 1) + 8 * i)];
            uint64_t v23 = [v22 first];
            if ([v15 containsObject:v23])
            {
              v24 = [v22 second];
              v24[2]();
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v57 objects:buf count:16];
        }
        while (v19);
      }

      id v11 = v51;
      id v10 = v52;
    }

    uint64_t v25 = *(void *)(a1 + 32);
    v26 = v10;
    if (v25)
    {
      v27 = FCCloudKitLog;
      if (os_log_type_enabled((os_log_t)FCCloudKitLog, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        v63 = v26;
        _os_log_debug_impl(&dword_1A460D000, v27, OS_LOG_TYPE_DEBUG, "Zones deleted: %@", buf, 0xCu);
      }
    }

    uint64_t v28 = *(void *)(a1 + 32);
    uint64_t v29 = v11;
    if (v28)
    {
      v30 = FCCloudKitLog;
      if (os_log_type_enabled((os_log_t)FCCloudKitLog, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        v63 = v29;
        _os_log_debug_impl(&dword_1A460D000, v30, OS_LOG_TYPE_DEBUG, "Database change token updated: %@", buf, 0xCu);
      }
      v31 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v29 requiringSecureCoding:1 error:0];
      v32 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v33 = -[FCPushNotificationCenter serverChangeTokenKey]();
      [v32 setObject:v31 forKey:v33];
    }
    v34 = (unsigned char *)objc_opt_new();
    if ([v15 count])
    {
      v35 = [MEMORY[0x1E4F1CA80] set];
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      v36 = *(void **)(a1 + 32);
      if (v36) {
        v36 = (void *)v36[3];
      }
      v37 = v36;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v53 objects:v61 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v54;
        do
        {
          uint64_t v41 = 0;
          do
          {
            if (*(void *)v54 != v40) {
              objc_enumerationMutation(v37);
            }
            uint64_t v42 = *(void *)(a1 + 32);
            if (v42) {
              v43 = *(void **)(v42 + 24);
            }
            else {
              v43 = 0;
            }
            v44 = [v43 objectForKey:*(void *)(*((void *)&v53 + 1) + 8 * v41)];
            v45 = [v44 first];
            if ([v15 containsObject:v45]) {
              [v35 addObject:v45];
            }

            ++v41;
          }
          while (v39 != v41);
          uint64_t v46 = [v37 countByEnumeratingWithState:&v53 objects:v61 count:16];
          uint64_t v39 = v46;
        }
        while (v46);
      }

      if (v34) {
        v34[8] = 1;
      }
      v47 = (void *)[v35 copy];
      -[FCHandlePushNotificationResult setRecordZoneIDs:]((uint64_t)v34, v47);

      id v11 = v51;
      id v10 = v52;
    }
    v48 = FCCloudKitLog;
    __int16 v9 = v50;
    if (os_log_type_enabled((os_log_t)FCCloudKitLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      v63 = v34;
      _os_log_impl(&dword_1A460D000, v48, OS_LOG_TYPE_DEFAULT, "fetched database changes will return pushNotificationResult: %@", buf, 0xCu);
    }
    uint64_t v49 = *(void *)(a1 + 40);
    if (v49) {
      (*(void (**)(uint64_t, unsigned char *))(v49 + 16))(v49, v34);
    }
  }
  else if (v13)
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A460D000, v12, OS_LOG_TYPE_DEFAULT, "failed to fetch database changes", buf, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordZoneObservers, 0);
  objc_storeStrong((id *)&self->_privateDatabase, 0);
}

- (void)enableSyncing
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    a1[8] = 1;
    [a1 prepareForUse];
    if (!a1[8] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v2 = (void *)[[NSString alloc] initWithFormat:@"syncing should be enabled"];
      int v3 = 136315906;
      uint64_t v4 = "-[FCPushNotificationCenter(Setup) enableSyncing]";
      __int16 v5 = 2080;
      id v6 = "FCPushNotificationCenter.m";
      __int16 v7 = 1024;
      int v8 = 250;
      __int16 v9 = 2114;
      id v10 = v2;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v3, 0x26u);
    }
  }
}

- (void)prepareForUse
{
  int v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"record-zone-subs-deleted"];

  if ((v4 & 1) == 0)
  {
    __int16 v5 = objc_alloc_init(FCCKPrivateDeleteAllZoneSubscriptionsOperation);
    [(FCOperation *)v5 setQualityOfService:17];
    [(FCOperation *)v5 setRelativePriority:0];
    if (self) {
      privateDatabase = self->_privateDatabase;
    }
    else {
      privateDatabase = 0;
    }
    -[FCCKPrivateDatabase addOperation:]((uint64_t)privateDatabase, v5);
    __int16 v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v7 setBool:1 forKey:@"record-zone-subs-deleted"];
  }
  id v10 = objc_alloc_init(FCCKPrivateSaveDatabaseSubscriptionOperation);
  [(FCOperation *)v10 setQualityOfService:17];
  [(FCOperation *)v10 setRelativePriority:0];
  [(FCCKPrivateSaveDatabaseSubscriptionOperation *)v10 setSubscriptionID:@"private-db-sub"];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1A1E0]);
  [v8 setShouldSendContentAvailable:1];
  [(FCCKPrivateSaveDatabaseSubscriptionOperation *)v10 setNotificationInfo:v8];
  if (self) {
    __int16 v9 = self->_privateDatabase;
  }
  else {
    __int16 v9 = 0;
  }
  -[FCCKPrivateDatabase addOperation:]((uint64_t)v9, v10);
}

@end