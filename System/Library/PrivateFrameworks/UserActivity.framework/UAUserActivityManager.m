@interface UAUserActivityManager
+ (BOOL)shouldSupportActivityContinuation;
+ (BOOL)userActivityContinuationSupported;
+ (id)_determineMatchingApplicationBundleIdentfierWithOptionsForActivityType:(id)a3 dynamicType:(id)a4 kind:(unint64_t)a5 teamIdentifier:(id)a6;
+ (id)defaultManager;
- (BOOL)activityContinuationIsEnabled;
- (BOOL)allowedToConnect;
- (BOOL)currentUserActivityProxiesWithOptions:(id)a3 predicate:(id)a4 completionHandler:(id)a5;
- (BOOL)currentUserActivityUUIDWithOptions:(id)a3 completionHandler:(id)a4;
- (BOOL)determineIfUserActivityIsCurrent:(id)a3 completionHandler:(id)a4;
- (BOOL)hasUserActivityWithUUID:(id)a3;
- (BOOL)initialServerHandshake:(BOOL)a3;
- (BOOL)needToSendInitialMessage;
- (BOOL)registerAsProxyForApplication:(int)a3 options:(id)a4 completionBlock:(id)a5;
- (BOOL)registeredForAppResignationMessages;
- (BOOL)supportsActivityContinuation;
- (BOOL)userActivityIsActive:(id)a3;
- (NSMapTable)activeUserActivitiesByUUID;
- (NSMapTable)userActivitiesByUUID;
- (NSSet)userActivityUUIDsSendToServer;
- (NSUUID)activeUserActivityUUID;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)serialQueueForSendingActivitiesToServer;
- (OS_dispatch_queue)serverQ;
- (UAUserActivityManager)init;
- (UAUserActivityManager)initWithConnection:(id)a3;
- (id)activeActivitiesByPriority;
- (id)activities;
- (id)createByDecodingUserActivity:(id)a3;
- (id)encodeUserActivity:(id)a3;
- (id)encodeUserActivity:(id)a3 options:(id)a4;
- (id)fetchUUID:(id)a3 intervalToWaitForDocumentSynchonization:(double)a4 withCompletionHandler:(id)a5;
- (id)userActivityForUUID:(id)a3;
- (void)addDynamicUserActivity:(id)a3 matching:(id)a4;
- (void)addUserActivity:(id)a3;
- (void)askClientUserActivityToSave:(id)a3;
- (void)askClientUserActivityToSave:(id)a3 completionHandler:(id)a4;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)dealloc;
- (void)didReceiveInputStreamWithUUID:(id)a3 inputStream:(id)a4 outputStream:(id)a5;
- (void)makeActive:(id)a3;
- (void)makeInactive:(id)a3;
- (void)markUserActivityAsDirty:(id)a3 forceImmediate:(BOOL)a4;
- (void)pinUserActivity:(id)a3 withCompletionHandler:(id)a4;
- (void)registerForApplicationDeactivateIfNecessary;
- (void)removeDynamicUserActivity:(id)a3 matching:(id)a4;
- (void)removeUserActivity:(id)a3;
- (void)sendCurrentActivityToIndexer:(id)a3;
- (void)sendToIndexerIfAppropriate:(id)a3 force:(BOOL)a4;
- (void)sendUserActivityInfoToLSUserActivityd:(id)a3 makeCurrent:(BOOL)a4;
- (void)setActiveUserActivitiesByUUID:(id)a3;
- (void)setActiveUserActivityUUID:(id)a3;
- (void)setAllowedToConnect:(BOOL)a3;
- (void)setNeedToSendInitialMessage:(BOOL)a3;
- (void)setRegisteredForAppResignationMessages:(BOOL)a3;
- (void)setUserActivitiesByUUID:(id)a3;
- (void)tellClientDebuggingEnabled:(BOOL)a3 logFileHandle:(id)a4;
- (void)tellClientUserActivityItWasResumed:(id)a3;
- (void)tellDaemonAboutNewLSUserActivity:(id)a3;
- (void)unregisterForApplicationDeactivation;
@end

@implementation UAUserActivityManager

+ (id)defaultManager
{
  if (defaultManager_sOnce != -1) {
    dispatch_once(&defaultManager_sOnce, &__block_literal_global_6);
  }
  v2 = (void *)defaultManager_sManager;

  return v2;
}

- (void)registerForApplicationDeactivateIfNecessary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__UAUserActivityManager_registerForApplicationDeactivateIfNecessary__block_invoke;
  block[3] = &unk_1E60830C8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __68__UAUserActivityManager_registerForApplicationDeactivateIfNecessary__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if (([*(id *)(a1 + 32) registeredForAppResignationMessages] & 1) == 0)
  {
    v3 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_INFO, "registerForApplicationDeactivateIfNecessary()", v6, 2u);
    }

    [*(id *)(a1 + 32) setRegisteredForAppResignationMessages:1];
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:*(void *)(a1 + 32) selector:sel_sendCurrentActivityToIndexer_ name:@"UIApplicationWillResignActiveNotification" object:0];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:*(void *)(a1 + 32) selector:sel_sendCurrentActivityToIndexer_ name:@"UIApplicationWillTerminateNotification" object:0];
  }
  objc_sync_exit(v2);
}

- (BOOL)registeredForAppResignationMessages
{
  return self->_registeredForAppResignationMessages;
}

- (void)setRegisteredForAppResignationMessages:(BOOL)a3
{
  self->_registeredForAppResignationMessages = a3;
}

- (void)makeInactive:(id)a3
{
  id v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = [(UAUserActivityManager *)v4 activeUserActivityUUID];
  if (v12)
  {
    v6 = [(UAUserActivityManager *)v4 activeUserActivitiesByUUID];
    v7 = [v12 uniqueIdentifier];
    [v6 removeObjectForKey:v7];
  }
  v8 = [v12 uniqueIdentifier];
  int v9 = [v5 isEqual:v8];

  if (v9)
  {
    [(UAUserActivityManager *)v4 setActiveUserActivityUUID:0];
    v10 = [(UAUserActivityManager *)v4 activeActivitiesByPriority];
    v11 = [v10 firstObject];
    [(UAUserActivityManager *)v4 makeActive:v11];
  }
  objc_sync_exit(v4);
}

void __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke_35(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1B3EC6EB0]();
  uint64_t v3 = [*(id *)(a1 + 32) copyWithNewUUID:1];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    [*(id *)(a1 + 40) setCompletedUnitCount:1];
    v6 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) uniqueIdentifier];
      v8 = [v7 UUIDString];
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      int v15 = 138543619;
      v16 = v8;
      __int16 v17 = 2113;
      uint64_t v18 = v9;
      _os_log_impl(&dword_1B3DF6000, v6, OS_LOG_TYPE_DEBUG, "Calling completion handler with activity %{public}@/%{private}@", (uint8_t *)&v15, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v10 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [*(id *)(a1 + 48) UUIDString];
      uint64_t v12 = *(void *)(a1 + 32);
      int v15 = 138543619;
      v16 = v11;
      __int16 v17 = 2113;
      uint64_t v18 = v12;
      _os_log_impl(&dword_1B3DF6000, v10, OS_LOG_TYPE_ERROR, "Failed attempting to copy %{public}@/%{private}@, so calling completion handler with UAContinuityClientNoSuchActivity@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v13 = *(void *)(a1 + 56);
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"UAContinuityErrorDomain" code:-108 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);
  }
}

- (id)fetchUUID:(id)a3 intervalToWaitForDocumentSynchonization:(double)a4 withCompletionHandler:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = (void (**)(void, void, void))v9;
  if (v8)
  {
    v46[0] = 0;
    v46[1] = v46;
    v46[2] = 0x3032000000;
    v46[3] = __Block_byref_object_copy__2;
    v46[4] = __Block_byref_object_dispose__2;
    id v47 = 0;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x3032000000;
    v44[3] = __Block_byref_object_copy__2;
    v44[4] = __Block_byref_object_dispose__2;
    id v45 = 0;
    v11 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [v8 UUIDString];
      *(_DWORD *)buf = 138543362;
      id v49 = v12;
      _os_log_impl(&dword_1B3DF6000, v11, OS_LOG_TYPE_DEBUG, "uuid=%{public}@", buf, 0xCu);
    }
    uint64_t v13 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
    [v13 setCancellable:1];
    [v13 setPausable:0];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke;
    v42[3] = &unk_1E60830C8;
    id v14 = v8;
    id v43 = v14;
    [v13 setCancellationHandler:v42];
    int v15 = [(UAUserActivityManager *)self userActivityForUUID:v14];
    if (v15)
    {
      v16 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        __int16 v17 = [v14 UUIDString];
        *(_DWORD *)buf = 138412290;
        id v49 = v17;
        _os_log_impl(&dword_1B3DF6000, v16, OS_LOG_TYPE_INFO, "Found activity %@ local to this process, so doing an immediate copy.", buf, 0xCu);
      }
      [v13 setTotalUnitCount:1];
      uint64_t v18 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke_35;
      block[3] = &unk_1E6083648;
      v40 = v46;
      id v36 = v15;
      id v37 = v13;
      id v38 = v14;
      v41 = v44;
      v39 = v10;
      dispatch_async(v18, block);

      uint64_t v19 = &v36;
    }
    else
    {
      v21 = _uaGetLogForCategory(@"signposts");
      os_signpost_id_t v22 = os_signpost_id_generate(v21);

      v23 = _uaGetLogForCategory(@"signposts");
      v24 = v23;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_DWORD *)buf = 138543362;
        id v49 = v14;
        _os_signpost_emit_with_name_impl(&dword_1B3DF6000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "fetchUserActivity", "Fetching handoff payload:%{public}@", buf, 0xCu);
      }

      v25 = [(UAUserActivityManager *)self serverQ];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke_37;
      v27[3] = &unk_1E60836C0;
      double v33 = a4;
      v28[0] = v14;
      v28[1] = self;
      v31 = v44;
      id v29 = v13;
      v32 = v46;
      v30 = v10;
      os_signpost_id_t v34 = v22;
      dispatch_async(v25, v27);

      uint64_t v19 = (id *)v28;
    }

    _Block_object_dispose(v44, 8);
    _Block_object_dispose(v46, 8);
  }
  else
  {
    if (v9)
    {
      v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:0];
      ((void (**)(void, void, void *))v10)[2](v10, 0, v20);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)userActivityForUUID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(UAUserActivityManager *)v5 userActivitiesByUUID];
  v7 = [v6 objectForKey:v4];

  objc_sync_exit(v5);

  return v7;
}

- (void)removeUserActivity:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueIdentifier];

  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    v7 = [(UAUserActivityManager *)v6 userActivitiesByUUID];
    id v8 = [v4 uniqueIdentifier];
    [v7 removeObjectForKey:v8];

    objc_sync_exit(v6);
  }
  if ([(UAUserActivityManager *)self userActivityIsActive:v4]) {
    [(UAUserActivityManager *)self makeInactive:v4];
  }
  if ([v4 activityHasBeenSentToServer])
  {
    id v9 = [v4 uniqueIdentifier];
    v10 = [(UAUserActivityManager *)self serverQ];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__UAUserActivityManager_removeUserActivity___block_invoke;
    v12[3] = &unk_1E6083420;
    v12[4] = self;
    id v13 = v9;
    id v11 = v9;
    dispatch_async(v10, v12);
  }
}

- (NSMapTable)userActivitiesByUUID
{
  return (NSMapTable *)objc_getProperty(self, a2, 32, 1);
}

- (void)makeActive:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  obj = v6;
  if (v5)
  {
    v7 = [(UAUserActivityManager *)v6 activeUserActivitiesByUUID];
    id v8 = [v5 uniqueIdentifier];
    [v7 setObject:v5 forKey:v8];
  }
  uint64_t v9 = [(UAUserActivityManager *)v6 activeUserActivityUUID];
  v10 = (void *)v9;
  v40 = (void *)v9;
  if ((v5 == 0) == (v9 != 0))
  {
    if (!v9) {
      goto LABEL_11;
    }
  }
  else
  {
    id v11 = [v5 uniqueIdentifier];
    int v12 = [v10 isEqual:v11];

    if (!v10 || ((v12 ^ 1) & 1) == 0)
    {
      if ((v12 & 1) == 0) {
        goto LABEL_11;
      }
LABEL_10:
      int v17 = 0;
      goto LABEL_35;
    }
  }
  id v13 = [(UAUserActivityManager *)obj userActivitiesByUUID];
  id v14 = [v13 objectForKey:v10];

  uint64_t v15 = [v5 priority];
  uint64_t v16 = [v14 priority];

  if (v15 > v16) {
    goto LABEL_10;
  }
LABEL_11:
  activeUserActivitiesByUUID = obj->_activeUserActivitiesByUUID;
  uint64_t v19 = [(UAUserActivityManager *)obj activeUserActivityUUID];
  v20 = [(NSMapTable *)activeUserActivitiesByUUID objectForKey:v19];

  if (v20)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v21 = +[UAUserActivity observers];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v49;
      do
      {
        uint64_t v24 = 0;
        uint64_t v3 = sel_userActivityWillBecomeCurrent_current_;
        do
        {
          if (*(void *)v49 != v23) {
            objc_enumerationMutation(v21);
          }
          v25 = *(void **)(*((void *)&v48 + 1) + 8 * v24);
          if (objc_opt_respondsToSelector())
          {
            v26 = [v20 parentUserActivity];
            [v25 userActivityWillBecomeCurrent:v26 current:0];
          }
          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v21 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v22);
    }
  }
  v27 = [v5 uniqueIdentifier];
  [(UAUserActivityManager *)obj setActiveUserActivityUUID:v27];

  uint64_t v39 = [v5 uniqueIdentifier];

  if (v5)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v28 = +[UAUserActivity observers];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v45;
      do
      {
        uint64_t v31 = 0;
        uint64_t v3 = sel_userActivityWillBecomeCurrent_current_;
        do
        {
          if (*(void *)v45 != v30) {
            objc_enumerationMutation(v28);
          }
          v32 = *(void **)(*((void *)&v44 + 1) + 8 * v31);
          if (objc_opt_respondsToSelector())
          {
            double v33 = [v5 parentUserActivity];
            [v32 userActivityWillBecomeCurrent:v33 current:1];
          }
          ++v31;
        }
        while (v29 != v31);
        uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v56 count:16];
      }
      while (v29);
    }
  }
  else
  {
    [(UAUserActivityManager *)obj unregisterForApplicationDeactivation];
  }

  int v17 = 1;
  v40 = (void *)v39;
LABEL_35:
  objc_sync_exit(obj);

  os_signpost_id_t v34 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    v35 = [v5 uniqueIdentifier];
    id v36 = [v35 UUIDString];
    id v37 = &stru_1F0CB4508;
    if (v40)
    {
      uint64_t v3 = [v5 uniqueIdentifier];
      if ([v3 isEqual:v40]) {
        id v37 = @" (already active)";
      }
    }
    *(_DWORD *)buf = 138543618;
    id v53 = v36;
    __int16 v54 = 2114;
    v55 = v37;
    _os_log_impl(&dword_1B3DF6000, v34, OS_LOG_TYPE_DEBUG, "makeActive, userActivity=%{public}@%{public}@", buf, 0x16u);
    if (v40) {
  }
    }
  if (v17)
  {
    [v5 setDirty:1];
    id v38 = [(UAUserActivityManager *)obj serverQ];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__UAUserActivityManager_makeActive___block_invoke;
    block[3] = &unk_1E6083420;
    void block[4] = obj;
    id v43 = v40;
    dispatch_async(v38, block);
  }
}

- (BOOL)userActivityIsActive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UAUserActivityManager *)self activeUserActivityUUID];
  v6 = (void *)v5;
  char v7 = 0;
  if (v4 && v5)
  {
    id v8 = [v4 uniqueIdentifier];
    char v7 = [v6 isEqual:v8];
  }
  return v7;
}

- (NSUUID)activeUserActivityUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (NSMapTable)activeUserActivitiesByUUID
{
  return (NSMapTable *)objc_getProperty(self, a2, 72, 1);
}

- (void)setActiveUserActivityUUID:(id)a3
{
}

- (void)tellDaemonAboutNewLSUserActivity:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [v4 uniqueIdentifier];
    char v7 = [v6 UUIDString];
    *(_DWORD *)buf = 138543619;
    uint64_t v16 = v7;
    __int16 v17 = 2113;
    id v18 = v4;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_DEBUG, "Sending initial activity uuid=%{public}@ %{private}@ information to server", buf, 0x16u);
  }
  if ([v4 isInvalidated])
  {
    id v8 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v4 uniqueIdentifier];
      v10 = [v9 UUIDString];
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v10;
      _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_INFO, "Skipping telling server about activity because it has been invalidated, uuid=%{public}@.", buf, 0xCu);
    }
  }
  else
  {
    [(UAUserActivityManager *)self addUserActivity:v4];
    id v11 = [(UAUserActivityManager *)self serverQ];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__UAUserActivityManager_tellDaemonAboutNewLSUserActivity___block_invoke;
    v12[3] = &unk_1E6083420;
    id v13 = v4;
    id v14 = self;
    dispatch_async(v11, v12);

    id v8 = v13;
  }
}

- (void)addUserActivity:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = [v4 uniqueIdentifier];
    char v7 = [v6 UUIDString];
    int v11 = 138543619;
    int v12 = v7;
    __int16 v13 = 2113;
    id v14 = v4;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_DEBUG, "(%{public}@, %{private}@)", (uint8_t *)&v11, 0x16u);
  }
  id v8 = self;
  objc_sync_enter(v8);
  userActivitiesByUUID = v8->_userActivitiesByUUID;
  v10 = [v4 uniqueIdentifier];
  [(NSMapTable *)userActivitiesByUUID setObject:v4 forKey:v10];

  objc_sync_exit(v8);
}

void __58__UAUserActivityManager_tellDaemonAboutNewLSUserActivity___block_invoke_60(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [*(id *)(a1 + 32) uuid];
      v6 = [v5 UUIDString];
      char v7 = [*(id *)(a1 + 32) activityType];
      *(_DWORD *)buf = 138543875;
      __int16 v13 = v6;
      __int16 v14 = 2113;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      id v17 = v3;
      _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_ERROR, "*** Unexpected error from doUpdateUserActivityInfo for activity %{public}@/%{private}@, error=%{public}@", buf, 0x20u);
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) serverQ];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__UAUserActivityManager_tellDaemonAboutNewLSUserActivity___block_invoke_61;
    v10[3] = &unk_1E6083420;
    uint64_t v9 = *(void **)(a1 + 48);
    v10[4] = *(void *)(a1 + 40);
    id v11 = v9;
    dispatch_async(v8, v10);
  }
}

void __36__UAUserActivityManager_makeActive___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = [v2 remoteObjectProxy];

  id v4 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [*(id *)(a1 + 40) UUIDString];
    int v6 = 138543362;
    char v7 = v5;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEBUG, "calling doUpdateUserActivityWithUUID:%{public}@ setActive: YES", (uint8_t *)&v6, 0xCu);
  }
  [v3 doUpdateUserActivityWithUUID:*(void *)(a1 + 40) setActive:1];
}

void __75__UAUserActivityManager_sendUserActivityInfoToLSUserActivityd_makeCurrent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = [v2 remoteObjectProxy];

  if (v3)
  {
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75__UAUserActivityManager_sendUserActivityInfoToLSUserActivityd_makeCurrent___block_invoke_2;
    v6[3] = &unk_1E6083780;
    id v7 = v4;
    [v3 doUpdateUserActivityInfo:v7 makeCurrent:v5 completionHandler:v6];
  }
}

void __58__UAUserActivityManager_tellDaemonAboutNewLSUserActivity___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isInvalidated])
  {
    id v2 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = [*(id *)(a1 + 32) uniqueIdentifier];
      id v4 = [v3 UUIDString];
      *(_DWORD *)buf = 138543362;
      v21 = v4;
      _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_INFO, "Skipping telling server about activity because it was invalidated, uuid=%{public}@.", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 40) userActivityUUIDsSendToServer];
    int v6 = [*(id *)(a1 + 32) uniqueIdentifier];
    char v7 = [v5 containsObject:v6];

    if (v7) {
      return;
    }
    uint64_t v8 = [*(id *)(a1 + 40) connection];
    id v2 = [v8 remoteObjectProxy];

    uint64_t v9 = [*(id *)(a1 + 32) userActivityInfoForSelfWithPayload:0 options:0];
    v10 = (void *)v9;
    if (v2 && v9)
    {
      id v11 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3DF6000, v11, OS_LOG_TYPE_DEBUG, "--- calling doUpdateUserActivityInfo on serverQ", buf, 2u);
      }

      int v12 = [*(id *)(a1 + 32) uniqueIdentifier];
      __int16 v13 = [*(id *)(a1 + 40) activeUserActivityUUID];
      uint64_t v14 = [v12 isEqual:v13];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __58__UAUserActivityManager_tellDaemonAboutNewLSUserActivity___block_invoke_60;
      v17[3] = &unk_1E6083758;
      id v18 = v10;
      int8x16_t v16 = *(int8x16_t *)(a1 + 32);
      id v15 = (id)v16.i64[0];
      int8x16_t v19 = vextq_s8(v16, v16, 8uLL);
      [v2 doUpdateUserActivityInfo:v18 makeCurrent:v14 completionHandler:v17];
    }
  }
}

void __64__UAUserActivityManager_markUserActivityAsDirty_forceImmediate___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) connection];
  id v3 = [v2 remoteObjectProxy];

  if (v3)
  {
    id v4 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = [*(id *)(a1 + 40) UUIDString];
      if (*(unsigned char *)(a1 + 64)) {
        int v6 = @"YES";
      }
      else {
        int v6 = @"NO";
      }
      char v7 = [*(id *)(a1 + 48) absoluteString];
      uint64_t v8 = @" webPageURL=<private>";
      uint64_t v9 = *(void *)(a1 + 56);
      int v10 = *(unsigned __int8 *)(a1 + 65);
      int v11 = *(unsigned __int8 *)(a1 + 66);
      if (!v7) {
        uint64_t v8 = &stru_1F0CB4508;
      }
      int v14 = 138544642;
      int v12 = "YES";
      id v15 = v5;
      id v17 = v6;
      if (v10) {
        __int16 v13 = "YES";
      }
      else {
        __int16 v13 = "NO";
      }
      __int16 v16 = 2114;
      if (!v11) {
        int v12 = "NO";
      }
      __int16 v18 = 2114;
      int8x16_t v19 = v8;
      __int16 v20 = 2114;
      uint64_t v21 = v9;
      __int16 v22 = 2082;
      uint64_t v23 = v13;
      __int16 v24 = 2082;
      v25 = v12;
      _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEBUG, "calling doMarkUserActivityAsDirty:%{public}@ forceImmediate:%{public}@ %{public}@ expiration=%{public}@ iCloud=%{public}s/%{public}s", (uint8_t *)&v14, 0x3Eu);
    }
    [v3 doMarkUserActivityAsDirty:*(void *)(a1 + 40) forceImmediate:*(unsigned __int8 *)(a1 + 64) webpageURL:*(void *)(a1 + 48) expiration:*(void *)(a1 + 56) hasiCloudDocument:*(unsigned __int8 *)(a1 + 65) hasUnsynchronizediCloudDoc:*(unsigned __int8 *)(a1 + 66)];
  }
}

- (void)markUserActivityAsDirty:(id)a3 forceImmediate:(BOOL)a4
{
  LODWORD(v4) = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v25 = [v6 uniqueIdentifier];
    uint64_t v8 = [v25 UUIDString];
    if (v4) {
      uint64_t v9 = @"YES";
    }
    else {
      uint64_t v9 = @"NO";
    }
    if ([v6 isInvalidated]) {
      int v10 = @" (invalidated)";
    }
    else {
      int v10 = &stru_1F0CB4508;
    }
    char v11 = (char)v4;
    id v4 = self;
    if ([v6 userInfoContainsFileURLs]) {
      int v12 = "YES";
    }
    else {
      int v12 = "NO";
    }
    *(_DWORD *)buf = 138544643;
    if ([v6 encodedContainsUnsynchronizedCloudDocument]) {
      __int16 v13 = "YES";
    }
    else {
      __int16 v13 = "NO";
    }
    os_signpost_id_t v34 = v8;
    __int16 v35 = 2113;
    id v36 = v6;
    __int16 v37 = 2114;
    id v38 = v9;
    __int16 v39 = 2114;
    v40 = v10;
    __int16 v41 = 2082;
    v42 = v12;
    self = v4;
    LOBYTE(v4) = v11;
    __int16 v43 = 2082;
    long long v44 = v13;
    _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_DEBUG, "userActivity=%{public}@/%{private}@ forceImmediate=%{public}@%{public}@ iCloud=%{public}s/%{public}s", buf, 0x3Eu);
  }
  if (v6 && ([v6 isInvalidated] & 1) == 0)
  {
    int v14 = [v6 uniqueIdentifier];
    id v15 = (void *)[v14 copy];

    __int16 v16 = [v6 webpageURL];
    id v17 = (void *)[v16 copy];

    __int16 v18 = [v6 expirationDate];
    int8x16_t v19 = (void *)[v18 copy];

    LOBYTE(v18) = [v6 userInfoContainsFileURLs];
    char v20 = [v6 encodedContainsUnsynchronizedCloudDocument];
    uint64_t v21 = [(UAUserActivityManager *)self serverQ];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__UAUserActivityManager_markUserActivityAsDirty_forceImmediate___block_invoke;
    block[3] = &unk_1E60837D0;
    void block[4] = self;
    id v27 = v15;
    char v30 = (char)v4;
    id v28 = v17;
    id v29 = v19;
    char v31 = (char)v18;
    char v32 = v20;
    id v22 = v19;
    id v23 = v17;
    id v24 = v15;
    dispatch_async(v21, block);
  }
}

void __39__UAUserActivityManager_defaultManager__block_invoke()
{
  v0 = objc_alloc_init(UAUserActivityManager);
  v1 = (void *)defaultManager_sManager;
  defaultManager_sManager = (uint64_t)v0;

  id v2 = [(id)defaultManager_sManager serverQ];
  os_state_add_handler();
}

- (NSXPCConnection)connection
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  if (v2->_allowedToConnect)
  {
    connection = v2->_connection;
    if (connection)
    {
      id v4 = connection;
    }
    else
    {
      id v6 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        char v7 = UActivityCreationXPCServiceName();
        *(_DWORD *)buf = 138543362;
        char v20 = v7;
        _os_log_impl(&dword_1B3DF6000, v6, OS_LOG_TYPE_DEBUG, "Creating NSXPCConnection to server %{public}@", buf, 0xCu);
      }
      uint64_t v8 = v2;
      id v9 = objc_alloc(MEMORY[0x1E4F29268]);
      int v10 = UActivityCreationXPCServiceName();
      uint64_t v11 = [v9 initWithMachServiceName:v10 options:0];
      int v12 = v2->_connection;
      v2->_connection = (NSXPCConnection *)v11;

      __int16 v13 = _LSGetUserActivityClientProtocolInterface();
      [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v13];

      [(NSXPCConnection *)v2->_connection setExportedObject:v8];
      int v14 = _LSGetUserActivityClientResponseProtocolInterface();
      [(NSXPCConnection *)v2->_connection setExportedInterface:v14];

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __35__UAUserActivityManager_connection__block_invoke;
      v18[3] = &unk_1E60830C8;
      v18[4] = v8;
      [(NSXPCConnection *)v2->_connection setInterruptionHandler:v18];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __35__UAUserActivityManager_connection__block_invoke_2;
      v17[3] = &unk_1E60830C8;
      void v17[4] = v8;
      [(NSXPCConnection *)v2->_connection setInvalidationHandler:v17];
      [(NSXPCConnection *)v2->_connection resume];
      id v4 = v2->_connection;
    }
  }
  else
  {
    uint64_t v5 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_DEBUG, "Not allowed to connect to useractivityd.", buf, 2u);
    }

    id v4 = 0;
  }
  objc_sync_exit(v2);

  if (v4 && ![(UAUserActivityManager *)v2 initialServerHandshake:0])
  {
    id v15 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3DF6000, v15, OS_LOG_TYPE_ERROR, "Failed sending initial message for connection to useractivityd.", buf, 2u);
    }

    id v4 = 0;
  }

  return v4;
}

- (BOOL)initialServerHandshake:(BOOL)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v5 = [(UAUserActivityManager *)self serverQ];
  dispatch_assert_queue_V2(v5);

  id v6 = self;
  objc_sync_enter(v6);
  BOOL v7 = a3 || v6->_needToSendInitialMessage;
  v6->_needToSendInitialMessage = 0;
  BOOL allowedToConnect = v6->_allowedToConnect;
  id v9 = v6->_connection;
  objc_sync_exit(v6);

  if (v9) {
    BOOL v10 = allowedToConnect;
  }
  else {
    BOOL v10 = 0;
  }
  uint64_t v11 = v26;
  if (v10)
  {
    *((unsigned char *)v26 + 24) = 1;
    if (v7)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __57__UAUserActivityManager_Private__initialServerHandshake___block_invoke;
      v24[3] = &unk_1E6083908;
      v24[4] = v6;
      v24[5] = &v25;
      int v12 = [(NSXPCConnection *)v9 remoteObjectProxyWithErrorHandler:v24];
      if (v12)
      {
        __int16 v13 = [MEMORY[0x1E4F28B50] mainBundle];
        int v14 = [v13 bundleIdentifier];
        if (v14)
        {
          id v29 = @"CFBundleIdentifier";
          id v15 = [v13 bundleIdentifier];
          v30[0] = v15;
          __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
        }
        else
        {
          __int16 v16 = 0;
        }

        id v17 = _uaGetLogForCategory(0);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B3DF6000, v17, OS_LOG_TYPE_DEBUG, "calling doInitializeWithClientVersion: 1", buf, 2u);
        }

        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __57__UAUserActivityManager_Private__initialServerHandshake___block_invoke_265;
        v20[3] = &unk_1E6083930;
        v20[4] = v6;
        uint64_t v21 = v9;
        id v22 = &v25;
        [v12 doInitializeWithClientVersion:1 clientInfo:v16 completionHandler:v20];
      }
      uint64_t v11 = v26;
    }
  }
  BOOL v18 = *((unsigned char *)v11 + 24) != 0;

  _Block_object_dispose(&v25, 8);
  return v18;
}

- (OS_dispatch_queue)serverQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (UAUserActivityManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)UAUserActivityManager;
  id v2 = [(UAUserActivityManager *)&v17 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    userActivitiesByUUID = v2->_userActivitiesByUUID;
    v2->_userActivitiesByUUID = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    activeUserActivitiesByUUID = v2->_activeUserActivitiesByUUID;
    v2->_activeUserActivitiesByUUID = (NSMapTable *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA80] set];
    userActivityUUIDsSendToServer = v2->_userActivityUUIDsSendToServer;
    v2->_userActivityUUIDsSendToServer = (NSMutableSet *)v7;

    v2->_BOOL allowedToConnect = 1;
    char v9 = [(id)objc_opt_class() shouldSupportActivityContinuation];
    v2->_supportsActivityContinuation = v9;
    v2->_activityContinuationIsEnabled = v9;
    dispatch_queue_t v10 = dispatch_queue_create("userActivityQ", 0);
    serverQ = v2->_serverQ;
    v2->_serverQ = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("serialQueueForSendingActivitiesToServer", 0);
    serialQueueForSendingActivitiesToServer = v2->_serialQueueForSendingActivitiesToServer;
    v2->_serialQueueForSendingActivitiesToServer = (OS_dispatch_queue *)v12;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__UAUserActivityManager_init__block_invoke;
    block[3] = &unk_1E60830C8;
    __int16 v16 = v2;
    if (init_sRegisterForReconnectionMessageOnce_0 != -1) {
      dispatch_once(&init_sRegisterForReconnectionMessageOnce_0, block);
    }
  }
  return v2;
}

+ (BOOL)shouldSupportActivityContinuation
{
  int v2 = MGGetBoolAnswer();
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FB36F8] sharedManager];
    int v4 = [v3 isSharedIPad];

    if (v4)
    {
      uint64_t v5 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_INFO, "Disabling Handoff/UserActivity because the system is in multi-user mode", v7, 2u);
      }

      LOBYTE(v2) = 0;
    }
    else
    {
      LOBYTE(v2) = 1;
    }
  }
  return v2;
}

- (NSSet)userActivityUUIDsSendToServer
{
  int v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(NSMutableSet *)v2->_userActivityUUIDsSendToServer copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (OS_dispatch_queue)serialQueueForSendingActivitiesToServer
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)sendUserActivityInfoToLSUserActivityd:(id)a3 makeCurrent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [v6 uuid];
    uint64_t v9 = [v8 UUIDString];
    dispatch_queue_t v10 = (void *)v9;
    uint64_t v11 = @"NO";
    if (v4) {
      uint64_t v11 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    char v20 = v11;
    _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_DEBUG, "Sending updated activity %{public}@ information to server, makeCurrent=%{public}@", buf, 0x16u);
  }
  if (v6)
  {
    dispatch_queue_t v12 = [v6 uuid];

    if (v12)
    {
      __int16 v13 = [(UAUserActivityManager *)self serverQ];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75__UAUserActivityManager_sendUserActivityInfoToLSUserActivityd_makeCurrent___block_invoke;
      block[3] = &unk_1E60837A8;
      void block[4] = self;
      id v15 = v6;
      BOOL v16 = v4;
      dispatch_async(v13, block);
    }
  }
}

void __29__UAUserActivityManager_init__block_invoke(uint64_t a1)
{
  int v2 = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __29__UAUserActivityManager_init__block_invoke_2;
  handler[3] = &unk_1E60833F8;
  id v4 = *(id *)(a1 + 32);
  notify_register_dispatch("com.apple.coreservices.useractivity.reconnection", (int *)&init_sRegisterForReconnectionNotificationToken_0, v2, handler);
}

void __58__UAUserActivityManager_tellDaemonAboutNewLSUserActivity___block_invoke_61(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  int v2 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v3 = [*(id *)(a1 + 40) uniqueIdentifier];
  [v2 addObject:v3];

  objc_sync_exit(obj);
}

void __75__UAUserActivityManager_sendUserActivityInfoToLSUserActivityd_makeCurrent___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = [*(id *)(a1 + 32) uuid];
      id v6 = [v5 UUIDString];
      int v7 = 138543618;
      uint64_t v8 = v6;
      __int16 v9 = 2114;
      id v10 = v3;
      _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEBUG, "Got error, from doUpdateUserActivityInfo to server, for %{public}@, error: %{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
}

+ (BOOL)userActivityContinuationSupported
{
  int v2 = MGGetBoolAnswer();
  if (v2)
  {
    id v3 = [MEMORY[0x1E4FB36F8] sharedManager];
    int v4 = [v3 isSharedIPad];

    if (v4)
    {
      uint64_t v5 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v7 = 0;
        _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_INFO, "Disabling Handoff/UserActivity because the system is in multi-user mode", v7, 2u);
      }

      LOBYTE(v2) = 0;
    }
    else
    {
      LOBYTE(v2) = 1;
    }
  }
  return v2;
}

char *__39__UAUserActivityManager_defaultManager__block_invoke_2()
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28E78] string];
  long long v24 = 0u;
  long long v25 = 0u;
  *(_OWORD *)__s = 0u;
  long long v23 = 0u;
  strstr("@(#)PROGRAM:UserActivity  PROJECT:UserActivity-551\n", "PROJECT:");
  __strlcpy_chk();
  v1 = strrchr(__s, 10);
  if (v1) {
    char *v1 = 0;
  }
  if ([(id)defaultManager_sManager supportsActivityContinuation]) {
    int v2 = "YES";
  }
  else {
    int v2 = "NO";
  }
  if ([(id)defaultManager_sManager activityContinuationIsEnabled]) {
    id v3 = "YES";
  }
  else {
    id v3 = "NO";
  }
  objc_msgSend(v0, "appendFormat:", @"UAUserActivityManager supportsActivityContinuation=%s isEnabled=%s serverPid=%ld %s", v2, v3, *(int *)(defaultManager_sManager + 48), __s);
  int v4 = [(id)defaultManager_sManager activeUserActivityUUID];

  if (v4)
  {
    uint64_t v5 = [(id)defaultManager_sManager activeUserActivityUUID];
    id v6 = [v5 UUIDString];
    [v0 appendFormat:@" becomeCurrentUUID=%@", v6];
  }
  id v7 = (id)defaultManager_sManager;
  objc_sync_enter(v7);
  uint64_t v8 = [(id)defaultManager_sManager userActivitiesByUUID];
  BOOL v9 = (unint64_t)[v8 count] > 1;

  if (v9)
  {
    [v0 appendString:@" - otherUUIDs:["];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = [(id)defaultManager_sManager userActivitiesByUUID];
    uint64_t v11 = [v10 keyEnumerator];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          [v0 appendFormat:@"%@ ", *(void *)(*((void *)&v17 + 1) + 8 * v14++)];
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v0 appendString:@"\n"];
  }
  objc_sync_exit(v7);

  id v15 = serializedCFType(v0);
  return v15;
}

- (BOOL)allowedToConnect
{
  int v2 = self;
  objc_sync_enter(v2);
  BOOL allowedToConnect = v2->_allowedToConnect;
  objc_sync_exit(v2);

  return allowedToConnect;
}

- (void)setAllowedToConnect:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = self;
  objc_sync_enter(v4);
  if (v4->_allowedToConnect != v3)
  {
    connection = v4->_connection;
    if (connection)
    {
      [(NSXPCConnection *)connection invalidate];
      id v6 = v4->_connection;
      v4->_connection = 0;
    }
    if (v3)
    {
      id v7 = [(UAUserActivityManager *)v4 serverQ];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__UAUserActivityManager_setAllowedToConnect___block_invoke;
      block[3] = &unk_1E60830C8;
      void block[4] = v4;
      dispatch_async(v7, block);
    }
  }
  objc_sync_exit(v4);
}

void __45__UAUserActivityManager_setAllowedToConnect___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) connection];
}

void __29__UAUserActivityManager_init__block_invoke_2(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1B3EC6EB0]();
  BOOL v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEFAULT, "--- Received com.apple.coreservices.useractivity.reconnection notification, and we had an active user activity, so reconnecting to server.", buf, 2u);
  }

  int v4 = [*(id *)(a1 + 32) serverQ];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__UAUserActivityManager_init__block_invoke_28;
  block[3] = &unk_1E60830C8;
  id v6 = *(id *)(a1 + 32);
  dispatch_async(v4, block);
}

void __29__UAUserActivityManager_init__block_invoke_28(uint64_t a1)
{
  if ([*(id *)(a1 + 32) allowedToConnect])
  {
    [*(id *)(a1 + 32) setNeedToSendInitialMessage:1];
    int v2 = [*(id *)(a1 + 32) activeUserActivityUUID];

    if (v2)
    {
      BOOL v3 = *(void **)(a1 + 32);
      [v3 initialServerHandshake:0];
    }
  }
}

- (UAUserActivityManager)initWithConnection:(id)a3
{
  id v5 = a3;
  id v6 = [(UAUserActivityManager *)self init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    uint64_t v8 = _LSGetUserActivityClientProtocolInterface();
    [(NSXPCConnection *)v7->_connection setRemoteObjectInterface:v8];

    [(NSXPCConnection *)v7->_connection setExportedObject:v7];
    BOOL v9 = _LSGetUserActivityClientResponseProtocolInterface();
    [(NSXPCConnection *)v7->_connection setExportedInterface:v9];

    [(NSXPCConnection *)v7->_connection resume];
  }

  return v7;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__2;
  uint64_t v11 = __Block_byref_object_dispose__2;
  uint64_t v12 = self->_serverQ;
  serverQ = self->_serverQ;
  self->_serverQ = 0;

  int v4 = v8[5];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__UAUserActivityManager_dealloc__block_invoke;
  block[3] = &unk_1E60833A8;
  void block[4] = &v7;
  dispatch_async(v4, block);
  _Block_object_dispose(&v7, 8);

  v5.receiver = self;
  v5.super_class = (Class)UAUserActivityManager;
  [(UAUserActivityManager *)&v5 dealloc];
}

void __32__UAUserActivityManager_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  int v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void __35__UAUserActivityManager_connection__block_invoke(uint64_t a1)
{
  int v2 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_DEBUG, "CONNECTION INTERRUPTED to useractivityd", buf, 2u);
  }

  BOOL v3 = [*(id *)(a1 + 32) serverQ];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__UAUserActivityManager_connection__block_invoke_33;
  block[3] = &unk_1E60830C8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v3, block);
}

uint64_t __35__UAUserActivityManager_connection__block_invoke_33(uint64_t a1)
{
  return [*(id *)(a1 + 32) connectionInterrupted];
}

void __35__UAUserActivityManager_connection__block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) serverQ];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__UAUserActivityManager_connection__block_invoke_3;
  block[3] = &unk_1E60830C8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

uint64_t __35__UAUserActivityManager_connection__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) connectionInvalidated];
}

- (void)connectionInterrupted
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEFAULT, "CONNECTION: connectionInterrupted, to useractivityd.", buf, 2u);
  }

  int v4 = self;
  objc_sync_enter(v4);
  v4->_needToSendInitialMessage = 1;
  [(NSMutableSet *)v4->_userActivityUUIDsSendToServer removeAllObjects];
  objc_sync_exit(v4);

  if ([(UAUserActivityManager *)v4 allowedToConnect])
  {
    objc_super v5 = [(UAUserActivityManager *)v4 activeUserActivityUUID];
    BOOL v6 = v5 == 0;

    if (!v6)
    {
      uint64_t v7 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v12 = 0x3FB999999999999ALL;
        _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_DEBUG, "CONNECTION reconnect; queueing up reconnection attempt in %{public}g seconds because our connection was interrupted.",
          buf,
          0xCu);
      }

      dispatch_time_t v8 = dispatch_time(0, 100000000);
      uint64_t v9 = [(UAUserActivityManager *)v4 serverQ];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__UAUserActivityManager_connectionInterrupted__block_invoke;
      block[3] = &unk_1E60830C8;
      void block[4] = v4;
      dispatch_after(v8, v9, block);
    }
  }
}

uint64_t __46__UAUserActivityManager_connectionInterrupted__block_invoke(uint64_t a1)
{
  int v2 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_INFO, "CONNECTION reconnect; sending initial message to useractivityd because we had an active activity at interruption-time.",
      v4,
      2u);
  }

  return [*(id *)(a1 + 32) initialServerHandshake:1];
}

- (void)connectionInvalidated
{
  BOOL v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_INFO, "CONNECTION INVALIDATED: to useractivityd; all future attempts to use it will fail.",
      v5,
      2u);
  }

  int v4 = self;
  objc_sync_enter(v4);
  v4->_BOOL allowedToConnect = 0;
  objc_sync_exit(v4);
}

- (BOOL)activityContinuationIsEnabled
{
  int v3 = [(id)objc_opt_class() shouldSupportActivityContinuation];
  if (v3) {
    LOBYTE(v3) = self->_activityContinuationIsEnabled;
  }
  return v3;
}

void __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = [*(id *)(a1 + 32) UUIDString];
    int v4 = 138543362;
    objc_super v5 = v3;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_INFO, "cancellationHandler for activity %{public}@ cancelled.", (uint8_t *)&v4, 0xCu);
  }
}

void __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke_37(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  int v2 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = [*(id *)(a1 + 32) UUIDString];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v3;
    _os_log_impl(&dword_1B3DF6000, v2, OS_LOG_TYPE_DEBUG, "on serverQ, preparing to call doFetchUserActivityInfoWithUUID to get latest info from server for %{public}@", buf, 0xCu);
  }
  kdebug_trace();
  dispatch_group_t v4 = dispatch_group_create();
  dispatch_group_t v5 = 0;
  if (*(double *)(a1 + 80) > 0.0) {
    dispatch_group_t v5 = dispatch_group_create();
  }
  uint64_t v6 = [*(id *)(a1 + 40) connection];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke_38;
  v46[3] = &unk_1E6083670;
  uint64_t v49 = *(void *)(a1 + 64);
  uint64_t v7 = v4;
  long long v47 = v7;
  dispatch_time_t v8 = v5;
  long long v48 = v8;
  uint64_t v9 = [v6 remoteObjectProxyWithErrorHandler:v46];

  if (!v9)
  {
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"UAContinuityErrorDomain" code:-107 userInfo:0];
    uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
    long long v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
    goto LABEL_19;
  }
  dispatch_group_enter(v7);
  if (v8) {
    dispatch_group_enter(v8);
  }
  id v10 = *(void **)(a1 + 32);
  uint64_t v36 = MEMORY[0x1E4F143A8];
  uint64_t v37 = 3221225472;
  id v38 = __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke_40;
  __int16 v39 = &unk_1E6083698;
  id v40 = v10;
  id v11 = *(id *)(a1 + 48);
  long long v45 = *(_OWORD *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 40);
  id v41 = v11;
  uint64_t v42 = v12;
  __int16 v43 = v7;
  uint64_t v13 = v8;
  long long v44 = v13;
  [v9 doFetchUserActivityInfoWithUUID:v40 completionHandler:&v36];
  double v14 = *(double *)(a1 + 80);
  if (v14 < 3.40282347e38)
  {
    dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    if (!v8) {
      goto LABEL_18;
    }
LABEL_13:
    long long v19 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void *)(a1 + 80);
      uint64_t v21 = objc_msgSend(*(id *)(a1 + 32), "UUIDString", v36, v37, v38, v39);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v21;
      _os_log_impl(&dword_1B3DF6000, v19, OS_LOG_TYPE_DEBUG, "-- before waiting up to %g seconds for documentSynchronization of uuid %{public}@", buf, 0x16u);
    }
    dispatch_group_wait(v13, v15);
    id v22 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = *(void *)(a1 + 80);
      long long v24 = [*(id *)(a1 + 32) UUIDString];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v24;
      _os_log_impl(&dword_1B3DF6000, v22, OS_LOG_TYPE_DEBUG, "-- done waiting up to %g seconds for documentSynchronization of uuid %{public}@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  dispatch_time_t v15 = -1;
  if (v8) {
    goto LABEL_13;
  }
LABEL_18:

  long long v18 = v40;
LABEL_19:

  if (*(void *)(a1 + 56)) {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  long long v25 = _uaGetLogForCategory(@"signposts");
  uint64_t v26 = v25;
  os_signpost_id_t v27 = *(void *)(a1 + 88);
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    uint64_t v28 = *(void *)(a1 + 32);
    BOOL v29 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != 0;
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v28;
    *(_WORD *)&buf[12] = 1026;
    *(_DWORD *)&buf[14] = v29;
    _os_signpost_emit_with_name_impl(&dword_1B3DF6000, v26, OS_SIGNPOST_INTERVAL_END, v27, "fetchUserActivity", "Fetching handoff payload:%{public}@ err=%{public}d", buf, 0x12u);
  }

  char v30 = _uaGetLogForCategory(@"signposts");
  char v31 = *(void **)(a1 + 32);
  if (v31)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = 0;
    [v31 getUUIDBytes:buf];
    uint64_t v32 = 0;
    os_signpost_id_t v33 = 0;
    do
    {
      os_signpost_id_t v33 = (buf[v32 + 1] ^ buf[v32]) | (v33 << 8);
      v32 += 2;
    }
    while (v32 != 16);
    if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      uint64_t v34 = *(void *)(a1 + 32);
      BOOL v35 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != 0;
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v34;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = v35;
      _os_signpost_emit_with_name_impl(&dword_1B3DF6000, v30, OS_SIGNPOST_INTERVAL_END, v33, "fetchUserActivityQueued", "Fetching handoff payload:%{public}@ err=%{public}d", buf, 0x12u);
    }
  }
}

void __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  dispatch_group_t v5 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_ERROR, "Error attempting to get user activity from server: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  uint64_t v6 = *(NSObject **)(a1 + 40);
  if (v6) {
    dispatch_group_leave(v6);
  }
}

void __97__UAUserActivityManager_fetchUUID_intervalToWaitForDocumentSynchonization_withCompletionHandler___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [*(id *)(a1 + 32) UUIDString];
    int v17 = 138543875;
    long long v18 = v8;
    __int16 v19 = 2113;
    id v20 = v5;
    __int16 v21 = 2114;
    id v22 = v6;
    _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_INFO, "fetchUUID: for uuid %{public}@, got %{private}@ from server, error=%{public}@", (uint8_t *)&v17, 0x20u);
  }
  kdebug_trace();
  [*(id *)(a1 + 40) setTotalUnitCount:1];
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a3);
    goto LABEL_10;
  }
  uint64_t v9 = [v5 error];

  if (v9)
  {
    uint64_t v10 = [v5 error];
LABEL_7:
    uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    goto LABEL_10;
  }
  if (!v5)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"UAContinuityErrorDomain" code:-108 userInfo:0];
    goto LABEL_7;
  }
  uint64_t v13 = [[UAUserActivity alloc] initWithManager:*(void *)(a1 + 48) userActivityInfo:v5];
  uint64_t v14 = *(void *)(*(void *)(a1 + 80) + 8);
  dispatch_time_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  [*(id *)(a1 + 40) setCompletedUnitCount:1];
LABEL_10:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  uint64_t v16 = *(NSObject **)(a1 + 64);
  if (v16) {
    dispatch_group_leave(v16);
  }
}

void __44__UAUserActivityManager_removeUserActivity___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) connection];
  int v3 = [v2 remoteObjectProxy];

  if (v3)
  {
    id v4 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v5 = [*(id *)(a1 + 40) UUIDString];
      int v6 = 138543362;
      int v7 = v5;
      _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEBUG, "calling doDeleteUserActivityWithUUID: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    [v3 doDeleteUserActivityWithUUID:*(void *)(a1 + 40)];
  }
}

- (void)addDynamicUserActivity:(id)a3 matching:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UAUserActivityManager *)self serverQ];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__UAUserActivityManager_addDynamicUserActivity_matching___block_invoke;
  block[3] = &unk_1E60836E8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __57__UAUserActivityManager_addDynamicUserActivity_matching___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) connection];
  int v3 = [v2 remoteObjectProxy];

  if (v3)
  {
    id v4 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      int v7 = 138478083;
      uint64_t v8 = v5;
      __int16 v9 = 2113;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEBUG, "calling doAddDynamicUserActivity: %{private}@ matching: %{private}@", (uint8_t *)&v7, 0x16u);
    }

    [v3 doAddDynamicUserActivity:*(void *)(a1 + 40) matching:*(void *)(a1 + 48)];
  }
}

- (void)removeDynamicUserActivity:(id)a3 matching:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UAUserActivityManager *)self serverQ];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__UAUserActivityManager_removeDynamicUserActivity_matching___block_invoke;
  block[3] = &unk_1E60836E8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __60__UAUserActivityManager_removeDynamicUserActivity_matching___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) connection];
  int v3 = [v2 remoteObjectProxy];

  if (v3)
  {
    id v4 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      int v7 = 138478083;
      uint64_t v8 = v5;
      __int16 v9 = 2113;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_DEBUG, "calling doRemoveDynamicUserActivity: %{private}@ matching: %{private}@", (uint8_t *)&v7, 0x16u);
    }

    [v3 doRemoveDynamicUserActivity:*(void *)(a1 + 40) matching:*(void *)(a1 + 48)];
  }
}

- (id)activeActivitiesByPriority
{
  int v2 = [(UAUserActivityManager *)self activeUserActivitiesByUUID];
  int v3 = [v2 objectEnumerator];
  id v4 = [v3 allObjects];
  uint64_t v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_53];

  return v5;
}

uint64_t __51__UAUserActivityManager_activeActivitiesByPriority__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "priority"));
  int v7 = NSNumber;
  uint64_t v8 = [v5 priority];

  __int16 v9 = [v7 numberWithInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

- (void)askClientUserActivityToSave:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v4 UUIDString];
    int v8 = 138543362;
    __int16 v9 = v6;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_DEBUG, "uuid=%{public}@", (uint8_t *)&v8, 0xCu);
  }
  int v7 = [(UAUserActivityManager *)self userActivityForUUID:v4];
  if (v7) {
    [v7 sendUserActivityInfoToLSUserActivityd:0 onAsyncQueue:0];
  }
}

- (void)askClientUserActivityToSave:(id)a3 completionHandler:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    __int16 v9 = [v6 UUIDString];
    *(_DWORD *)buf = 138543362;
    BOOL v35 = v9;
    _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_INFO, "askClientUserActivityToSave: uuid=%{public}@", buf, 0xCu);
  }
  uint64_t v10 = [(UAUserActivityManager *)self userActivityForUUID:v6];
  uint64_t v11 = v10;
  if (!v10)
  {
    int v17 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      long long v18 = [v6 UUIDString];
      *(_DWORD *)buf = 138543362;
      BOOL v35 = v18;
      _os_log_impl(&dword_1B3DF6000, v17, OS_LOG_TYPE_ERROR, "askClientUserActivityToSave:%{public}@ on activity, which does not seem to exist.", buf, 0xCu);
    }
    dispatch_time_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = -108;
    goto LABEL_11;
  }
  if ([v10 isInvalidated])
  {
    id v12 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [v6 UUIDString];
      uint64_t v14 = [v11 typeIdentifier];
      *(_DWORD *)buf = 138543618;
      BOOL v35 = v13;
      __int16 v36 = 2114;
      uint64_t v37 = v14;
      _os_log_impl(&dword_1B3DF6000, v12, OS_LOG_TYPE_ERROR, "askClientUserActivityToSave:%{public}@ %{public}@ on activity which has been invalidated.", buf, 0x16u);
    }
    dispatch_time_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = -130;
LABEL_11:
    __int16 v19 = [v15 errorWithDomain:@"UAContinuityErrorDomain" code:v16 userInfo:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v19);
    goto LABEL_17;
  }
  uint64_t v20 = [v11 parentUserActivity];
  if (v20
    && (__int16 v21 = (void *)v20,
        [v11 parentUserActivity],
        id v22 = objc_claimAutoreleasedReturnValue(),
        int v23 = [v22 _supportsSynchronizeActivityWithTimeout],
        v22,
        v21,
        v23))
  {
    long long v24 = [v11 manager];
    long long v25 = [v24 activeUserActivityUUID];
    if (v25)
    {
      uint64_t v26 = [v11 manager];
      os_signpost_id_t v27 = [v26 activeUserActivityUUID];
      uint64_t v28 = [v11 uniqueIdentifier];
      uint64_t v29 = [v27 isEqual:v28];
    }
    else
    {
      uint64_t v29 = 0;
    }

    char v30 = [v11 parentUserActivity];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __71__UAUserActivityManager_askClientUserActivityToSave_completionHandler___block_invoke;
    v31[3] = &unk_1E6083730;
    id v32 = v6;
    id v33 = v7;
    [v30 doSaveUserActivityWithTimeout:v29 isCurrent:v31 withCompletionHandler:3.0];

    __int16 v19 = v32;
  }
  else
  {
    __int16 v19 = [v11 callWillSaveDelegateIfDirtyAndPackageUpData:1 options:0 clearDirty:1];
    (*((void (**)(id, void *, void, void))v7 + 2))(v7, v19, [v11 dirty] ^ 1, 0);
  }
LABEL_17:
}

void __71__UAUserActivityManager_askClientUserActivityToSave_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = [*(id *)(a1 + 32) UUIDString];
      int v15 = 138543618;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_ERROR, "Failed asking parentUserActivity to doSaveUserActivityWithTimeout:, activity=%{public}@ error=%{public}@", (uint8_t *)&v15, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (v5)
  {
    __int16 v9 = [v5 _internalUserActivity];
    uint64_t v10 = [v9 userActivityInfoForSelfWithPayload:1 options:0];

    uint64_t v11 = *(void *)(a1 + 40);
    id v12 = [v5 _internalUserActivity];
    uint64_t v13 = [v12 dirty] ^ 1;
    if (v10)
    {
      (*(void (**)(uint64_t, void *, uint64_t, void))(v11 + 16))(v11, v10, v13, 0);
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UAContinuityErrorDomain" code:-136 userInfo:0];
      (*(void (**)(uint64_t, void, uint64_t, void *))(v11 + 16))(v11, 0, v13, v14);
    }
  }
}

- (void)tellClientUserActivityItWasResumed:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 UUIDString];
    int v9 = 138543362;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_DEBUG, "uuid=%{public}@", (uint8_t *)&v9, 0xCu);
  }
  id v7 = [(UAUserActivityManager *)self userActivityForUUID:v4];
  int v8 = v7;
  if (v7) {
    [v7 didSynchronizeUserActivity];
  }
}

- (void)tellClientDebuggingEnabled:(BOOL)a3 logFileHandle:(id)a4
{
  BOOL v4 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 67109635;
    v7[1] = v4;
    __int16 v8 = 2113;
    id v9 = v5;
    __int16 v10 = 1024;
    int v11 = [v5 fileDescriptor];
    _os_log_impl(&dword_1B3DF6000, v6, OS_LOG_TYPE_DEBUG, "Received debug update from server: %d %{private}@(%d)", (uint8_t *)v7, 0x18u);
  }
}

- (void)didReceiveInputStreamWithUUID:(id)a3 inputStream:(id)a4 outputStream:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [v8 UUIDString];
    int v15 = 138543362;
    uint64_t v16 = v12;
    _os_log_impl(&dword_1B3DF6000, v11, OS_LOG_TYPE_DEBUG, "uuid=%{public}@", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v13 = [(UAUserActivityManager *)self userActivityForUUID:v8];
  uint64_t v14 = v13;
  if (v13) {
    [v13 didReceiveInputStream:v9 outputStream:v10];
  }
}

- (id)encodeUserActivity:(id)a3 options:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(UAUserActivityInfo);
  id v8 = [v6 uniqueIdentifier];
  [(UAUserActivityInfo *)v7 setUuid:v8];

  id v9 = [MEMORY[0x1E4F1C9C8] date];
  [(UAUserActivityInfo *)v7 setWhen:v9];

  -[UAUserActivityInfo setType:](v7, "setType:", [v6 suggestedActionType]);
  id v10 = [v6 options];
  [(UAUserActivityInfo *)v7 setOptions:v10];

  int v11 = [v6 title];
  [(UAUserActivityInfo *)v7 setTitle:v11];

  uint64_t v12 = [v6 typeIdentifier];
  [(UAUserActivityInfo *)v7 setActivityType:v12];

  uint64_t v13 = [v6 dynamicIdentifier];
  [(UAUserActivityInfo *)v7 setDynamicActivityType:v13];

  uint64_t v14 = [v6 webpageURL];
  [(UAUserActivityInfo *)v7 setWebpageURL:v14];

  int v15 = [v6 referrerURL];
  [(UAUserActivityInfo *)v7 setReferrerURL:v15];

  uint64_t v16 = [v6 userInfo];
  uint64_t v17 = [v6 encodeUserInfo:v16 options:v5 error:0];

  [(UAUserActivityInfo *)v7 setPayload:v17 identifier:@"UAUserActivityUserInfoPayload"];
  id v18 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];

  return v18;
}

- (id)encodeUserActivity:(id)a3
{
  return [(UAUserActivityManager *)self encodeUserActivity:a3 options:0];
}

- (id)createByDecodingUserActivity:(id)a3
{
  int v3 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initForReadingFromData:v4 error:0];

  id v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
  [v5 finishDecoding];

  return v6;
}

- (BOOL)currentUserActivityUUIDWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    if (v7)
    {
      id v4 = [v7 description];
      stringRemovingNewlines(v4);
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = @"-";
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1B3DF6000, v9, OS_LOG_TYPE_DEBUG, "options=%{public}@ ", buf, 0xCu);
    if (v7)
    {
    }
  }

  int v11 = [(UAUserActivityManager *)self serverQ];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__UAUserActivityManager_currentUserActivityUUIDWithOptions_completionHandler___block_invoke;
  v14[3] = &unk_1E6083820;
  v14[4] = self;
  id v15 = v8;
  id v12 = v8;
  dispatch_async(v11, v14);

  return 1;
}

void __78__UAUserActivityManager_currentUserActivityUUIDWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__UAUserActivityManager_currentUserActivityUUIDWithOptions_completionHandler___block_invoke_2;
  v10[3] = &unk_1E6083220;
  id v11 = *(id *)(a1 + 40);
  int v3 = [v2 remoteObjectProxyWithErrorHandler:v10];

  if (v3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__UAUserActivityManager_currentUserActivityUUIDWithOptions_completionHandler___block_invoke_77;
    v8[3] = &unk_1E60837F8;
    id v9 = *(id *)(a1 + 40);
    [v3 doGetCurrentUserActivityInfo:v8];
    id v4 = v9;
  }
  else
  {
    id v5 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_DEBUG, "proxy == nil", v7, 2u);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UAContinuityErrorDomain" code:-113 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, void, void *))(v6 + 16))(v6, 0, 0, 0, 0, v4);
  }
}

void __78__UAUserActivityManager_currentUserActivityUUIDWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_ERROR, "XPC Error for Pin Activity Info: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__UAUserActivityManager_currentUserActivityUUIDWithOptions_completionHandler___block_invoke_77(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  uint64_t v13 = a5;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = @"-";
    uint64_t v21 = a1;
    if (v12)
    {
      uint64_t v19 = [v12 UUIDString];
    }
    else
    {
      uint64_t v19 = @"-";
    }
    if (v13) {
      uint64_t v20 = v13;
    }
    else {
      uint64_t v20 = @"-";
    }
    if (v14)
    {
      id v6 = [v14 description];
      stringRemovingNewlines(v6);
      uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138543875;
    int v23 = v19;
    __int16 v24 = 2113;
    long long v25 = v20;
    __int16 v26 = 2114;
    os_signpost_id_t v27 = v18;
    _os_log_impl(&dword_1B3DF6000, v17, OS_LOG_TYPE_DEBUG, "activityUUID=%{public}@ bundleID=%{private}@ error=%{public}@", buf, 0x20u);
    if (v14)
    {
    }
    a1 = v21;
    if (v12) {
  }
    }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)currentUserActivityProxiesWithOptions:(id)a3 predicate:(id)a4 completionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (v9)
    {
      int v5 = [v9 description];
      stringRemovingNewlines(v5);
      uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v13 = @"-";
    }
    *(_DWORD *)buf = 138543618;
    id v22 = v13;
    __int16 v23 = 2114;
    id v24 = v10;
    _os_log_impl(&dword_1B3DF6000, v12, OS_LOG_TYPE_DEBUG, "options=%{public}@ predicate=%{public}@", buf, 0x16u);
    if (v9)
    {
    }
  }

  id v14 = [(UAUserActivityManager *)self serverQ];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__UAUserActivityManager_currentUserActivityProxiesWithOptions_predicate_completionHandler___block_invoke;
  block[3] = &unk_1E6083870;
  id v19 = v9;
  id v20 = v11;
  void block[4] = self;
  id v15 = v9;
  id v16 = v11;
  dispatch_async(v14, block);

  return 1;
}

void __91__UAUserActivityManager_currentUserActivityProxiesWithOptions_predicate_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __91__UAUserActivityManager_currentUserActivityProxiesWithOptions_predicate_completionHandler___block_invoke_2;
  v11[3] = &unk_1E6083220;
  id v12 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v11];

  if (v3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __91__UAUserActivityManager_currentUserActivityProxiesWithOptions_predicate_completionHandler___block_invoke_79;
    v9[3] = &unk_1E6083848;
    uint64_t v4 = *(void *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    [v3 doGetUserActivityProxiesWithOptions:v4 completionHandler:v9];
    int v5 = v10;
  }
  else
  {
    id v6 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1B3DF6000, v6, OS_LOG_TYPE_DEBUG, "proxy == nil", v8, 2u);
    }

    uint64_t v7 = *(void *)(a1 + 48);
    int v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UAContinuityErrorDomain" code:-113 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v5);
  }
}

void __91__UAUserActivityManager_currentUserActivityProxiesWithOptions_predicate_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_ERROR, "XPC Error for currentUserActivityProxiesWithOptions: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__UAUserActivityManager_currentUserActivityProxiesWithOptions_predicate_completionHandler___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = [v5 description];
    id v9 = stringRemovingNewlines(v8);
    int v10 = 138543618;
    id v11 = v9;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_DEBUG, "proxies=%{public}@ error=%{public}@", (uint8_t *)&v10, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)determineIfUserActivityIsCurrent:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v9 = [v6 UUIDString];
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v9;
    _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_DEBUG, "uuid=%@", buf, 0xCu);
  }
  int v10 = [(UAUserActivityManager *)self serverQ];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__UAUserActivityManager_determineIfUserActivityIsCurrent_completionHandler___block_invoke;
  block[3] = &unk_1E6083870;
  id v15 = v6;
  id v16 = v7;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v10, block);

  return 1;
}

void __76__UAUserActivityManager_determineIfUserActivityIsCurrent_completionHandler___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__UAUserActivityManager_determineIfUserActivityIsCurrent_completionHandler___block_invoke_2;
  v11[3] = &unk_1E6083220;
  id v12 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v11];

  if (v3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__UAUserActivityManager_determineIfUserActivityIsCurrent_completionHandler___block_invoke_81;
    v9[3] = &unk_1E6083898;
    uint64_t v4 = *(void *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    [v3 doDetermineIfUserActivityIsCurrent:v4 completionHandler:v9];
    id v5 = v10;
  }
  else
  {
    id v6 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1B3DF6000, v6, OS_LOG_TYPE_DEBUG, "proxy == nil", v8, 2u);
    }

    uint64_t v7 = *(void *)(a1 + 48);
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UAContinuityErrorDomain" code:-113 userInfo:0];
    (*(void (**)(uint64_t, void, void, void, void, void *))(v7 + 16))(v7, 0, 0, 0, 0, v5);
  }
}

void __76__UAUserActivityManager_determineIfUserActivityIsCurrent_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_ERROR, "XPC Error for Pin Activity Info: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__UAUserActivityManager_determineIfUserActivityIsCurrent_completionHandler___block_invoke_81(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)pinUserActivity:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UAUserActivityManager *)self serverQ];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__UAUserActivityManager_pinUserActivity_withCompletionHandler___block_invoke;
  block[3] = &unk_1E6083870;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __63__UAUserActivityManager_pinUserActivity_withCompletionHandler___block_invoke(id *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v2 = [a1[4] connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__UAUserActivityManager_pinUserActivity_withCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E6083220;
  id v11 = a1[6];
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v10];

  uint64_t v4 = [a1[5] callWillSaveDelegateIfDirtyAndPackageUpData:1 options:0 clearDirty:1];
  int v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    id v7 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = [v5 uuid];
      id v9 = [v8 UUIDString];
      *(_DWORD *)buf = 138543619;
      id v13 = v9;
      __int16 v14 = 2113;
      id v15 = v5;
      _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_DEBUG, "Sending Info to pin: %{public}@/%{private}@", buf, 0x16u);
    }
    [v3 doPinUserActivityInfo:v5 completionHandler:a1[6]];
  }
}

void __63__UAUserActivityManager_pinUserActivity_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_ERROR, "XPC Error for Pin Activity Info: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasUserActivityWithUUID:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  int v5 = [(UAUserActivityManager *)self userActivitiesByUUID];
  id v6 = [v5 objectForKey:v4];

  BOOL v7 = v6 != 0;
  return v7;
}

- (id)activities
{
  int v2 = [(UAUserActivityManager *)self userActivitiesByUUID];
  id v3 = [v2 objectEnumerator];
  id v4 = [v3 allObjects];

  return v4;
}

+ (id)_determineMatchingApplicationBundleIdentfierWithOptionsForActivityType:(id)a3 dynamicType:(id)a4 kind:(unint64_t)a5 teamIdentifier:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    id v47 = v9;
    __int16 v48 = 2114;
    id v49 = v10;
    __int16 v50 = 2048;
    unint64_t v51 = a5;
    __int16 v52 = 2114;
    id v53 = v11;
    _os_log_impl(&dword_1B3DF6000, v12, OS_LOG_TYPE_INFO, "determineMatchingApplicationBundleIdentfierWithOptionsForActivityType:%{public}@/%{public}@ %ld %{public}@", buf, 0x2Au);
  }

  if ([v9 isEqual:*MEMORY[0x1E4F28AC0]])
  {
    id v13 = applicationProxyForWebBrowserSupportingContinuation();
    id v14 = v13;
    if (!v13) {
      goto LABEL_7;
    }
    id v15 = [v13 appState];
    int v16 = [v15 isInstalled];

    if (!v16) {
      goto LABEL_7;
    }
    uint64_t v17 = [v14 appState];
    char v18 = [v17 isRestricted];

    if ((v18 & 1) == 0)
    {
      uint64_t v19 = [v14 bundleIdentifier];
    }
    else
    {
LABEL_7:
      uint64_t v19 = 0;
    }
  }
  else
  {
    id v20 = (void *)_LSCopyAdvertisementStringForTeamIdentifierAndActivityType();
    uint64_t v21 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v21 applicationsForUserActivityType:v20];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v38 = v21;
      __int16 v39 = v20;
      id v40 = v10;
      id v14 = 0;
      uint64_t v19 = 0;
      uint64_t v25 = *(void *)v42;
      while (2)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          os_signpost_id_t v27 = v14;
          if (*(void *)v42 != v25) {
            objc_enumerationMutation(v22);
          }
          id v14 = *(id *)(*((void *)&v41 + 1) + 8 * i);

          uint64_t v28 = [v14 appState];
          int v29 = [v28 isPlaceholder];

          if (v29)
          {
            uint64_t v30 = [v14 bundleIdentifier];

            uint64_t v19 = (void *)v30;
          }
          else if (v14)
          {
            char v31 = [v14 appState];
            int v32 = [v31 isInstalled];

            if (v32)
            {
              id v33 = [v14 appState];
              char v34 = [v33 isRestricted];

              if ((v34 & 1) == 0)
              {
                uint64_t v36 = [v14 bundleIdentifier];
                BOOL v35 = v19;
                uint64_t v19 = (void *)v36;
                goto LABEL_22;
              }
            }
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v24) {
          continue;
        }
        break;
      }
      BOOL v35 = v14;
      id v14 = 0;
LABEL_22:

      id v20 = v39;
      id v10 = v40;
      uint64_t v21 = v38;
    }
    else
    {
      id v14 = 0;
      uint64_t v19 = 0;
    }
  }

  return v19;
}

- (void)sendToIndexerIfAppropriate:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [v6 UUIDString];
    id v9 = (void *)v8;
    id v10 = "NO";
    if (v4) {
      id v10 = "YES";
    }
    int v13 = 138543618;
    uint64_t v14 = v8;
    __int16 v15 = 2080;
    int v16 = v10;
    _os_log_impl(&dword_1B3DF6000, v7, OS_LOG_TYPE_DEBUG, "sendToIndexerIfAppropriate(%{public}@,%s)", (uint8_t *)&v13, 0x16u);
  }
  id v11 = [(UAUserActivityManager *)self userActivityForUUID:v6];
  id v12 = v11;
  if (v11
    && [v11 forwardToCoreSpotlightIndexer]
    && [(UAUserActivityManager *)self userActivityIsActive:v12])
  {
    [v12 indexActivity:1 forceIndexing:0.0];
  }
}

- (void)sendCurrentActivityToIndexer:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(UAUserActivityManager *)self activeUserActivityUUID];
  int v5 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543618;
    BOOL v7 = @"UIApplicationWillResignActiveNotification";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_INFO, "sendCurrentActivityToIndexer, got %{public}@ notification activeUUID=%{public}@", (uint8_t *)&v6, 0x16u);
  }

  if (v4) {
    [(UAUserActivityManager *)self sendToIndexerIfAppropriate:v4 force:1];
  }
}

- (void)unregisterForApplicationDeactivation
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__UAUserActivityManager_unregisterForApplicationDeactivation__block_invoke;
  block[3] = &unk_1E60830C8;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __61__UAUserActivityManager_unregisterForApplicationDeactivation__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if ([*(id *)(a1 + 32) registeredForAppResignationMessages])
  {
    id v3 = _uaGetLogForCategory(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_INFO, "unregisterForApplicationDeactivation", v6, 2u);
    }

    [*(id *)(a1 + 32) setRegisteredForAppResignationMessages:0];
    BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:*(void *)(a1 + 32) name:@"UIApplicationWillResignActiveNotification" object:0];

    int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:*(void *)(a1 + 32) name:@"UIApplicationWillTerminateNotification" object:0];
  }
  objc_sync_exit(v2);
}

- (BOOL)registerAsProxyForApplication:(int)a3 options:(id)a4 completionBlock:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240192;
    int v21 = a3;
    _os_log_impl(&dword_1B3DF6000, v10, OS_LOG_TYPE_INFO, "doRegisterAsProxyApplicationForPid:%{public}d", buf, 8u);
  }

  id v11 = [(UAUserActivityManager *)self serverQ];
  dispatch_assert_queue_not_V2(v11);

  id v12 = [(UAUserActivityManager *)self serverQ];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__UAUserActivityManager_registerAsProxyForApplication_options_completionBlock___block_invoke;
  v16[3] = &unk_1E60838E0;
  id v17 = v8;
  id v18 = v9;
  int v19 = a3;
  v16[4] = self;
  id v13 = v8;
  id v14 = v9;
  dispatch_sync(v12, v16);

  return 1;
}

void __79__UAUserActivityManager_registerAsProxyForApplication_options_completionBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  BOOL v7 = __79__UAUserActivityManager_registerAsProxyForApplication_options_completionBlock___block_invoke_2;
  id v8 = &unk_1E6083220;
  id v9 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:&v5];

  if (v3)
  {
    LODWORD(v4) = *(_DWORD *)(a1 + 56);
    objc_msgSend(v3, "doRegisterAsProxyApplicationForPid:options:completionHandler:", MEMORY[0x1E4F143A8], 3221225472, __79__UAUserActivityManager_registerAsProxyForApplication_options_completionBlock___block_invoke_95, &__block_descriptor_36_e17_v16__0__NSError_8l, v4, v5, v6, v7, v8);
  }
}

void __79__UAUserActivityManager_registerAsProxyForApplication_options_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_ERROR, "Error attempting to registerAsProxyForApplication from server: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__UAUserActivityManager_registerAsProxyForApplication_options_completionBlock___block_invoke_95(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = *(_DWORD *)(a1 + 32);
    v6[0] = 67240450;
    v6[1] = v5;
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_INFO, "doRegisterAsProxyApplicationForPid:%{public}d finished, error=%{public}@", (uint8_t *)v6, 0x12u);
  }
}

- (BOOL)supportsActivityContinuation
{
  return self->_supportsActivityContinuation;
}

- (void)setUserActivitiesByUUID:(id)a3
{
}

- (void)setActiveUserActivitiesByUUID:(id)a3
{
}

- (BOOL)needToSendInitialMessage
{
  return self->_needToSendInitialMessage;
}

- (void)setNeedToSendInitialMessage:(BOOL)a3
{
  self->_needToSendInitialMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeUserActivitiesByUUID, 0);
  objc_storeStrong((id *)&self->_serialQueueForSendingActivitiesToServer, 0);
  objc_storeStrong((id *)&self->_activeUserActivityUUID, 0);
  objc_storeStrong((id *)&self->_userActivityUUIDsSendToServer, 0);
  objc_storeStrong((id *)&self->_userActivitiesByUUID, 0);
  objc_storeStrong((id *)&self->_serverQ, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __57__UAUserActivityManager_Private__initialServerHandshake___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1B3DF6000, v4, OS_LOG_TYPE_ERROR, "*** Error on connection to useractivityd, err=%{public}@ (possibly useractivityd crashed?)", (uint8_t *)&v6, 0xCu);
  }

  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  *(unsigned char *)(*(void *)(a1 + 32) + 53) = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  objc_sync_exit(v5);
}

void __57__UAUserActivityManager_Private__initialServerHandshake___block_invoke_265(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = [v7 description];
    id v11 = stringRemovingNewlines(v10);
    int v18 = 134218499;
    int v19 = a2;
    __int16 v20 = 2113;
    int v21 = v11;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl(&dword_1B3DF6000, v9, OS_LOG_TYPE_DEBUG, " -- Server response to initialMessage, version=%ld info=%{private}@ error=%{public}@", (uint8_t *)&v18, 0x20u);
  }
  id v12 = *(id *)(a1 + 32);
  objc_sync_enter(v12);
  if (v8)
  {
    [*(id *)(a1 + 32) setAllowedToConnect:0];
    objc_sync_exit(v12);
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 48) = [*(id *)(a1 + 40) processIdentifier];
    objc_sync_exit(v12);

    id v13 = [*(id *)(a1 + 32) userActivitiesByUUID];
    id v14 = [*(id *)(a1 + 32) activeUserActivityUUID];
    id v12 = [v13 objectForKey:v14];

    if (v12)
    {
      __int16 v15 = _uaGetLogForCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v16 = [v12 uniqueIdentifier];
        id v17 = [v16 UUIDString];
        int v18 = 138543362;
        int v19 = v17;
        _os_log_impl(&dword_1B3DF6000, v15, OS_LOG_TYPE_DEBUG, " -- We had an active user activity, uuid=%{public}@, so sending that to server.", (uint8_t *)&v18, 0xCu);
      }
      [*(id *)(a1 + 32) tellDaemonAboutNewLSUserActivity:v12];
      [*(id *)(a1 + 32) markUserActivityAsDirty:v12 forceImmediate:0];
      [*(id *)(a1 + 32) makeActive:v12];
      [v12 sendUserActivityInfoToLSUserActivityd:0 onAsyncQueue:0];
    }
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
}

@end