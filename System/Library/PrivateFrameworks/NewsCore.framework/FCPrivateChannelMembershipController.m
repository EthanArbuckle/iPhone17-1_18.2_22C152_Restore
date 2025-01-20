@interface FCPrivateChannelMembershipController
+ (BOOL)requiresBatchedSync;
+ (BOOL)requiresHighPriorityFirstSync;
+ (BOOL)requiresPushNotificationSupport;
+ (id)backingRecordIDs;
+ (id)backingRecordZoneIDs;
+ (id)commandStoreFileName;
+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4;
+ (id)desiredKeys;
+ (id)localStoreFilename;
+ (int64_t)commandQueueUrgency;
+ (unint64_t)localStoreVersion;
- (BOOL)hasMemberships;
- (BOOL)isAllowedToSeeDraftsForChannelID:(id)a3;
- (BOOL)isMemberOfChannelID:(id)a3;
- (FCPrivateChannelMembershipController)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5;
- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3;
- (id)feedDescriptorForDraftFeedForChannel:(id)a3;
- (id)membershipChannelIDs;
- (uint64_t)shouldShowAllDraftContent;
- (void)_fetchPrivateChannelMembershipsWithCompletion:(void *)a1;
- (void)_refreshPublicMembershipsWithCompletion:(void *)a1;
- (void)activityObservingApplicationWindowDidBecomeForeground;
- (void)addItem:(int)a3 toStore:;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4;
- (void)isAllowedToSeeArticleID:(id)a3 completionBlock:(id)a4;
- (void)isAllowedToSeeIssueID:(id)a3 completionBlock:(id)a4;
- (void)loadLocalCachesFromStore;
- (void)referenceToMembershipForMembershipID:(void *)a1;
- (void)removeItemWithItemID:(void *)a1;
- (void)removeObserver:(id)a3;
- (void)setMembershipsByChannelID:(uint64_t)a1;
@end

@implementation FCPrivateChannelMembershipController

- (void)setMembershipsByChannelID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

void __80__FCPrivateChannelMembershipController__refreshPublicMembershipsWithCompletion___block_invoke_59(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    v3 = *(void **)(v2 + 96);
  }
  else {
    v3 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v3);
  uint64_t v4 = a1[4];
  v5 = (void *)a1[5];
  -[FCPrivateChannelMembershipController setMembershipsByChannelID:](v4, v5);
}

void __80__FCPrivateChannelMembershipController__refreshPublicMembershipsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[13];
  }
  v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(a1 + 40);
        v9 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v7), "membershipID", (void)v10);
        [v8 addObject:v9];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

void __64__FCPrivateChannelMembershipController_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
}

- (void)activityObservingApplicationWindowDidBecomeForeground
{
  if (self) {
    -[FCPrivateChannelMembershipController _refreshPublicMembershipsWithCompletion:](self, 0);
  }
}

+ (unint64_t)localStoreVersion
{
  return 1;
}

+ (id)localStoreFilename
{
  return @"private-channel-membership-list";
}

+ (id)commandStoreFileName
{
  return @"private-channel-membership-commands";
}

+ (int64_t)commandQueueUrgency
{
  return 1;
}

- (void)loadLocalCachesFromStore
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(FCPrivateDataController *)self localStore];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v5 = [v4 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v47 objects:v60 count:16];
  v39 = v3;
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v48;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(char **)(*((void *)&v47 + 1) + 8 * v9);
        if (([(id)objc_opt_class() isLocalStoreKeyInternal:v10] & 1) == 0)
        {
          objc_opt_class();
          long long v11 = [v4 objectForKeyedSubscript:v10];
          if (v11)
          {
            if (objc_opt_isKindOfClass()) {
              long long v12 = v11;
            }
            else {
              long long v12 = 0;
            }
          }
          else
          {
            long long v12 = 0;
          }
          id v13 = v12;

          if (v13)
          {
            v14 = [[FCReferenceToMembership alloc] initWithIdentifier:v10 dictionaryRepresentation:v13];
            if (v14)
            {
              -[FCPrivateChannelMembershipController addItem:toStore:](self, v14, 0);
              uint64_t v15 = [(FCReferenceToMembership *)v14 membershipID];

              if (!v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "reference.membershipID");
                *(_DWORD *)buf = 136315906;
                v53 = "-[FCPrivateChannelMembershipController loadLocalCachesFromStore]";
                __int16 v54 = 2080;
                v55 = "FCPrivateChannelMembershipController.m";
                __int16 v56 = 1024;
                int v57 = 355;
                __int16 v58 = 2114;
                v59 = v22;
                _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
              }
              v16 = [(FCReferenceToMembership *)v14 membershipID];

              if (v16)
              {
                v17 = [(FCReferenceToMembership *)v14 membershipID];
                [v3 addObject:v17];
                goto LABEL_19;
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"invalid nil value for '%s'", "reference");
              *(_DWORD *)buf = 136315906;
              v53 = "-[FCPrivateChannelMembershipController loadLocalCachesFromStore]";
              __int16 v54 = 2080;
              v55 = "FCPrivateChannelMembershipController.m";
              __int16 v56 = 1024;
              int v57 = 350;
              __int16 v58 = 2114;
              v59 = v17;
              _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
LABEL_19:
            }
          }
          else
          {
            v18 = (void *)FCDefaultLog;
            if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
            {
              v19 = v18;
              v20 = (objc_class *)objc_opt_class();
              NSStringFromClass(v20);
              v21 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v53 = v21;
              __int16 v54 = 2114;
              v55 = v10;
              _os_log_error_impl(&dword_1A460D000, v19, OS_LOG_TYPE_ERROR, "ERROR: Object of type %{public}@ is not dictionary for key %{public}@", buf, 0x16u);

              v3 = v39;
            }
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v23 = [v5 countByEnumeratingWithState:&v47 objects:v60 count:16];
      uint64_t v7 = v23;
    }
    while (v23);
  }

  v24 = [(FCPrivateDataController *)self context];
  [v24 internalContentContext];
  v26 = v25 = v3;
  v27 = [v26 channelMembershipController];

  v28 = [v27 cachedChannelMembershipsForIDs:v25];
  v29 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v30 = v28;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v44 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = [v30 objectForKeyedSubscript:*(void *)(*((void *)&v43 + 1) + 8 * i)];
        v36 = [v35 channelID];
        [v29 setObject:v35 forKey:v36];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }
    while (v32);
  }

  if (self) {
    membershipsLock = self->_membershipsLock;
  }
  else {
    membershipsLock = 0;
  }
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __64__FCPrivateChannelMembershipController_loadLocalCachesFromStore__block_invoke;
  v41[3] = &unk_1E5B4BE70;
  v41[4] = self;
  id v42 = v29;
  id v38 = v29;
  [(FCMTWriterLock *)membershipsLock performWriteSync:v41];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __64__FCPrivateChannelMembershipController_loadLocalCachesFromStore__block_invoke_2;
  v40[3] = &unk_1E5B4C018;
  v40[4] = self;
  +[FCTaskScheduler scheduleLowPriorityBlockForMainThread:v40];
}

- (void)_refreshPublicMembershipsWithCompletion:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = (void *)a1[14];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __80__FCPrivateChannelMembershipController__refreshPublicMembershipsWithCompletion___block_invoke;
    v21[3] = &unk_1E5B4BE70;
    v21[4] = a1;
    id v22 = v4;
    id v6 = v4;
    [v5 performReadSync:v21];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __80__FCPrivateChannelMembershipController__refreshPublicMembershipsWithCompletion___block_invoke_2;
    v18 = &unk_1E5B4CD48;
    v19 = a1;
    id v20 = v3;
    uint64_t v7 = &v15;
    uint64_t v8 = (void *)MEMORY[0x1E4F14428];
    id v9 = MEMORY[0x1E4F14428];
    id v10 = v6;
    long long v11 = objc_msgSend(a1, "context", v15, v16, v17, v18, v19);
    long long v12 = [v11 internalContentContext];
    id v13 = [v12 channelMembershipController];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __86__FCPrivateChannelMembershipController_fetchMembershipsWithIDs_queue_completionBlock___block_invoke;
    v23[3] = &unk_1E5B4EBF8;
    v23[4] = a1;
    v14 = v7;
    v24 = v14;
    [v13 fetchChannelMembershipsForIDs:v10 maximumCachedAge:v8 callbackQueue:v23 completionHandler:1.0];
  }
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 0;
}

- (id)membershipChannelIDs
{
  if (self) {
    membershipsLock = self->_membershipsLock;
  }
  else {
    membershipsLock = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__FCPrivateChannelMembershipController_membershipChannelIDs__block_invoke;
  v6[3] = &unk_1E5B4C840;
  v6[4] = self;
  id v3 = membershipsLock;
  uint64_t v4 = [(FCMTWriterLock *)v3 readObject:v6];

  return v4;
}

- (FCPrivateChannelMembershipController)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)FCPrivateChannelMembershipController;
  id v9 = [(FCPrivateDataController *)&v14 initWithContext:v8 pushNotificationCenter:a4 storeDirectory:a5];
  if (v9)
  {
    id v10 = objc_alloc_init(FCMTWriterLock);
    membershipsLock = v9->_membershipsLock;
    v9->_membershipsLock = v10;

    long long v12 = [v8 appActivityMonitor];
    [v12 addObserver:v9];
  }
  return v9;
}

void __86__FCPrivateChannelMembershipController_fetchMembershipsWithIDs_queue_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v26 = a2;
  id v7 = a3;
  id v27 = a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = -[FCPrivateChannelMembershipController referenceToMembershipForMembershipID:](*(void **)(a1 + 32), *(void **)(*((void *)&v32 + 1) + 8 * v11));
        if (v12)
        {
          id v13 = [FCRemoveReferenceToChannelMembershipCommand alloc];
          objc_super v14 = objc_msgSend(v12, "identifier", v26);
          uint64_t v15 = [(FCRemoveReferenceToChannelMembershipCommand *)v13 initWithReferenceToChannelMembershipID:v14];

          [*(id *)(a1 + 32) addCommandToCommandQueue:v15];
          uint64_t v16 = *(void **)(a1 + 32);
          v17 = [v12 identifier];
          -[FCPrivateChannelMembershipController removeItemWithItemID:](v16, v17);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v9);
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v19 = v26;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = objc_msgSend(v19, "objectForKeyedSubscript:", *(void *)(*((void *)&v28 + 1) + 8 * v23), v26);
        v25 = [v24 channelID];
        [v18 setObject:v24 forKey:v25];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v21);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __80__FCPrivateChannelMembershipController__refreshPublicMembershipsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__12;
    __int16 v54 = __Block_byref_object_dispose__12;
    id v55 = 0;
    uint64_t v42 = a1;
    id v7 = *(void **)(a1 + 32);
    if (v7) {
      id v7 = (void *)v7[14];
    }
    uint64_t v8 = v7;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __80__FCPrivateChannelMembershipController__refreshPublicMembershipsWithCompletion___block_invoke_59;
    v47[3] = &unk_1E5B4C230;
    uint64_t v9 = *(void *)(a1 + 32);
    long long v49 = &v50;
    v47[4] = v9;
    id v10 = v5;
    id v48 = v10;
    [v8 performWriteSync:v47];

    uint64_t v11 = *(void **)(v42 + 32);
    id v46 = (id)v51[5];
    id v41 = v10;
    long long v44 = v11;
    if (v11)
    {
      [MEMORY[0x1E4F29060] isMainThread];
      long long v12 = [MEMORY[0x1E4F1CA80] set];
      long long v43 = [MEMORY[0x1E4F1CA80] set];
      long long v45 = [MEMORY[0x1E4F1CA80] set];
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v13 = v41;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v64 objects:v70 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v65 != v15) {
              objc_enumerationMutation(v13);
            }
            uint64_t v17 = *(void *)(*((void *)&v64 + 1) + 8 * i);
            id v18 = [v46 objectForKeyedSubscript:v17];
            id v19 = [v13 objectForKeyedSubscript:v17];
            uint64_t v20 = v12;
            if (!v18 || (v21 = [v18 isEqual:v19], uint64_t v20 = v45, (v21 & 1) == 0)) {
              [v20 addObject:v19];
            }
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v64 objects:v70 count:16];
        }
        while (v14);
      }

      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v22 = v46;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v60 objects:v69 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v61;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v61 != v24) {
              objc_enumerationMutation(v22);
            }
            uint64_t v26 = *(void *)(*((void *)&v60 + 1) + 8 * j);
            id v27 = [v13 objectForKeyedSubscript:v26];
            long long v28 = [v22 objectForKeyedSubscript:v26];
            long long v29 = v28;
            if (v27)
            {
              if (([v28 isEqual:v27] & 1) == 0) {
                [v45 addObject:v27];
              }
            }
            else
            {
              [v43 addObject:v28];
            }
          }
          uint64_t v23 = [v22 countByEnumeratingWithState:&v60 objects:v69 count:16];
        }
        while (v23);
      }

      long long v30 = (void *)[v12 copy];
      long long v31 = (void *)[v45 copy];
      long long v32 = (void *)[v43 copy];
      if ([v32 count] || objc_msgSend(v31, "count") || objc_msgSend(v30, "count"))
      {
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v33 = [v44 observers];
        uint64_t v34 = [v33 countByEnumeratingWithState:&v56 objects:v68 count:16];
        id v40 = v5;
        if (v34)
        {
          uint64_t v35 = *(void *)v57;
          do
          {
            for (uint64_t k = 0; k != v34; ++k)
            {
              if (*(void *)v57 != v35) {
                objc_enumerationMutation(v33);
              }
              v37 = *(void **)(*((void *)&v56 + 1) + 8 * k);
              if (objc_opt_respondsToSelector()) {
                [v37 privateChannelMembershipController:v44 didAddMemberships:v30 changedMemberships:v31 removedMemberships:v32];
              }
            }
            uint64_t v34 = [v33 countByEnumeratingWithState:&v56 objects:v68 count:16];
          }
          while (v34);
        }

        id v6 = 0;
        id v5 = v40;
      }
    }
    _Block_object_dispose(&v50, 8);

    a1 = v42;
  }
  uint64_t v38 = *(void *)(a1 + 40);
  if (v38)
  {
    v39 = [v5 allValues];
    (*(void (**)(uint64_t, void *, id))(v38 + 16))(v38, v39, v6);
  }
}

id __60__FCPrivateChannelMembershipController_membershipChannelIDs__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v4 = *(void **)(v3 + 96);
  }
  else {
    uint64_t v4 = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__FCPrivateChannelMembershipController_membershipChannelIDs__block_invoke_2;
  v7[3] = &unk_1E5B4EBD0;
  id v5 = v2;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

uint64_t __64__FCPrivateChannelMembershipController_loadLocalCachesFromStore__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    -[FCPrivateChannelMembershipController _refreshPublicMembershipsWithCompletion:](v2, 0);
    uint64_t v2 = *(void **)(a1 + 32);
  }
  return [v2 forceSyncWithCompletion:0];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FCPrivateChannelMembershipController;
  [(FCPrivateDataController *)&v4 dealloc];
}

- (BOOL)isMemberOfChannelID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (-[FCPrivateChannelMembershipController shouldShowAllDraftContent]((uint64_t)self))
    {
      char v5 = 1;
    }
    else
    {
      if (self) {
        membershipsLocuint64_t k = self->_membershipsLock;
      }
      else {
        membershipsLocuint64_t k = 0;
      }
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __60__FCPrivateChannelMembershipController_isMemberOfChannelID___block_invoke_2;
      v9[3] = &unk_1E5B4C0B8;
      v9[4] = self;
      id v10 = v4;
      id v7 = membershipsLock;
      char v5 = [(FCMTWriterLock *)v7 readBool:v9];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (uint64_t)shouldShowAllDraftContent
{
  if (!a1 || !NFInternalBuild()) {
    return 0;
  }
  v1 = NewsCoreUserDefaults();
  uint64_t v2 = [v1 BOOLForKey:@"news.draft_content.show_drafts"];

  return v2;
}

BOOL __60__FCPrivateChannelMembershipController_isMemberOfChannelID___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[12];
  }
  uint64_t v2 = [v1 objectForKeyedSubscript:*(void *)(a1 + 40)];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isAllowedToSeeDraftsForChannelID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (-[FCPrivateChannelMembershipController shouldShowAllDraftContent]((uint64_t)self))
    {
      char v5 = 1;
    }
    else
    {
      if (self) {
        membershipsLocuint64_t k = self->_membershipsLock;
      }
      else {
        membershipsLocuint64_t k = 0;
      }
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __73__FCPrivateChannelMembershipController_isAllowedToSeeDraftsForChannelID___block_invoke_2;
      v9[3] = &unk_1E5B4C0B8;
      v9[4] = self;
      id v10 = v4;
      id v7 = membershipsLock;
      char v5 = [(FCMTWriterLock *)v7 readBool:v9];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

uint64_t __73__FCPrivateChannelMembershipController_isAllowedToSeeDraftsForChannelID___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[12];
  }
  uint64_t v2 = [v1 objectForKeyedSubscript:*(void *)(a1 + 40)];
  BOOL v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 isAllowedToSeeDrafts];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)feedDescriptorForDraftFeedForChannel:(id)a3
{
  id v4 = a3;
  char v5 = [v4 identifier];
  if ([(FCPrivateChannelMembershipController *)self isAllowedToSeeDraftsForChannelID:v5])
  {
    if (self) {
      membershipsLocuint64_t k = self->_membershipsLock;
    }
    else {
      membershipsLocuint64_t k = 0;
    }
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    char v21 = __77__FCPrivateChannelMembershipController_feedDescriptorForDraftFeedForChannel___block_invoke;
    id v22 = &unk_1E5B4E868;
    uint64_t v23 = self;
    id v7 = v5;
    id v24 = v7;
    id v8 = [(FCMTWriterLock *)membershipsLock readObject:&v19];
    if (-[FCPrivateChannelMembershipController shouldShowAllDraftContent]((uint64_t)self) && !v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F82A00]);
      objc_msgSend(v9, "setChannelID:", v7, v19, v20, v21, v22, v23);
      id v10 = [v7 substringFromIndex:1];
      uint64_t v11 = [@"LDT" stringByAppendingString:v10];
      [v9 setDraftArticleListID:v11];

      long long v12 = [v7 substringFromIndex:1];
      id v13 = [@"MD" stringByAppendingString:v12];
      [v9 setDraftIssueListID:v13];

      id v8 = [[FCChannelMembership alloc] initWithRecord:v9 interestToken:0];
    }
    uint64_t v14 = [FCDraftFeedDescriptor alloc];
    uint64_t v15 = [(FCChannelMembership *)v8 draftArticleListID];
    uint64_t v16 = [(FCChannelMembership *)v8 draftIssueListID];
    uint64_t v17 = [(FCDraftFeedDescriptor *)v14 initWithChannel:v4 articleListID:v15 issueListID:v16];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

uint64_t __77__FCPrivateChannelMembershipController_feedDescriptorForDraftFeedForChannel___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[12];
  }
  return [v1 objectForKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)isAllowedToSeeArticleID:(id)a3 completionBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "articleID != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v16 = "-[FCPrivateChannelMembershipController isAllowedToSeeArticleID:completionBlock:]";
    __int16 v17 = 2080;
    id v18 = "FCPrivateChannelMembershipController.m";
    __int16 v19 = 1024;
    int v20 = 172;
    __int16 v21 = 2114;
    id v22 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completion != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v16 = "-[FCPrivateChannelMembershipController isAllowedToSeeArticleID:completionBlock:]";
    __int16 v17 = 2080;
    id v18 = "FCPrivateChannelMembershipController.m";
    __int16 v19 = 1024;
    int v20 = 173;
    __int16 v21 = 2114;
    id v22 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__FCPrivateChannelMembershipController_isAllowedToSeeArticleID_completionBlock___block_invoke;
  v12[3] = &unk_1E5B4EBA8;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v8 = v6;
  id v9 = v7;
  -[FCPrivateChannelMembershipController _fetchPrivateChannelMembershipsWithCompletion:](self, v12);
}

void __80__FCPrivateChannelMembershipController_isAllowedToSeeArticleID_completionBlock___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = (void (*)(void))*((void *)a1[6] + 2);
    v4();
  }
  else
  {
    char v5 = a1[4];
    if (v5) {
      id v6 = (void *)v5[14];
    }
    else {
      id v6 = 0;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__FCPrivateChannelMembershipController_isAllowedToSeeArticleID_completionBlock___block_invoke_2;
    v15[3] = &unk_1E5B4C840;
    v15[4] = v5;
    id v7 = [v6 readObject:v15];
    id v8 = objc_opt_new();
    id v9 = [a1[4] context];
    [v8 setContext:v9];

    [v8 setChannelMemberships:v7];
    id v10 = [MEMORY[0x1E4F1CAD0] setWithObject:a1[5]];
    [v8 setArticleIDs:v10];

    [v8 setQualityOfService:17];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __80__FCPrivateChannelMembershipController_isAllowedToSeeArticleID_completionBlock___block_invoke_3;
    v12[3] = &unk_1E5B4CD48;
    id v13 = a1[5];
    id v14 = a1[6];
    [v8 setCheckAccessCompletion:v12];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
    [v11 addOperation:v8];
  }
}

uint64_t __80__FCPrivateChannelMembershipController_isAllowedToSeeArticleID_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 96);
  }
  else {
    uint64_t v2 = 0;
  }
  return [v2 allValues];
}

uint64_t __80__FCPrivateChannelMembershipController_isAllowedToSeeArticleID_completionBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    id v4 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
    [v4 BOOLValue];
  }
  char v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v5();
}

- (void)_fetchPrivateChannelMembershipsWithCompletion:(void *)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      char v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completion != nil");
      *(_DWORD *)buf = 136315906;
      id v9 = "-[FCPrivateChannelMembershipController _fetchPrivateChannelMembershipsWithCompletion:]";
      __int16 v10 = 2080;
      uint64_t v11 = "FCPrivateChannelMembershipController.m";
      __int16 v12 = 1024;
      int v13 = 696;
      __int16 v14 = 2114;
      uint64_t v15 = v5;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __86__FCPrivateChannelMembershipController__fetchPrivateChannelMembershipsWithCompletion___block_invoke;
    v6[3] = &unk_1E5B4EC68;
    v6[4] = a1;
    id v7 = v4;
    [a1 syncWithCompletion:v6];
  }
}

- (void)isAllowedToSeeIssueID:(id)a3 completionBlock:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "issueID != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v16 = "-[FCPrivateChannelMembershipController isAllowedToSeeIssueID:completionBlock:]";
    __int16 v17 = 2080;
    id v18 = "FCPrivateChannelMembershipController.m";
    __int16 v19 = 1024;
    int v20 = 210;
    __int16 v21 = 2114;
    id v22 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7) {
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completion != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v16 = "-[FCPrivateChannelMembershipController isAllowedToSeeIssueID:completionBlock:]";
    __int16 v17 = 2080;
    id v18 = "FCPrivateChannelMembershipController.m";
    __int16 v19 = 1024;
    int v20 = 211;
    __int16 v21 = 2114;
    id v22 = v11;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__FCPrivateChannelMembershipController_isAllowedToSeeIssueID_completionBlock___block_invoke;
  v12[3] = &unk_1E5B4EBA8;
  id v13 = v6;
  id v14 = v7;
  void v12[4] = self;
  id v8 = v6;
  id v9 = v7;
  -[FCPrivateChannelMembershipController _fetchPrivateChannelMembershipsWithCompletion:](self, v12);
}

void __78__FCPrivateChannelMembershipController_isAllowedToSeeIssueID_completionBlock___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = (void (*)(void))*((void *)a1[6] + 2);
    v4();
  }
  else
  {
    char v5 = a1[4];
    if (v5) {
      id v6 = (void *)v5[14];
    }
    else {
      id v6 = 0;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__FCPrivateChannelMembershipController_isAllowedToSeeIssueID_completionBlock___block_invoke_2;
    v15[3] = &unk_1E5B4C840;
    v15[4] = v5;
    id v7 = [v6 readObject:v15];
    id v8 = objc_opt_new();
    id v9 = [a1[4] context];
    [v8 setContext:v9];

    [v8 setChannelMemberships:v7];
    __int16 v10 = [MEMORY[0x1E4F1CAD0] setWithObject:a1[5]];
    [v8 setIssueIDs:v10];

    [v8 setQualityOfService:17];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__FCPrivateChannelMembershipController_isAllowedToSeeIssueID_completionBlock___block_invoke_3;
    v12[3] = &unk_1E5B4CD48;
    id v13 = a1[5];
    id v14 = a1[6];
    [v8 setCheckAccessCompletion:v12];
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
    [v11 addOperation:v8];
  }
}

uint64_t __78__FCPrivateChannelMembershipController_isAllowedToSeeIssueID_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 96);
  }
  else {
    uint64_t v2 = 0;
  }
  return [v2 allValues];
}

uint64_t __78__FCPrivateChannelMembershipController_isAllowedToSeeIssueID_completionBlock___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    id v4 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
    [v4 BOOLValue];
  }
  char v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v5();
}

- (BOOL)hasMemberships
{
  [MEMORY[0x1E4F29060] isMainThread];
  if (self) {
    membershipsLocuint64_t k = self->_membershipsLock;
  }
  else {
    membershipsLocuint64_t k = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__FCPrivateChannelMembershipController_hasMemberships__block_invoke;
  v7[3] = &unk_1E5B4C090;
  void v7[4] = self;
  id v4 = membershipsLock;
  BOOL v5 = [(FCMTWriterLock *)v4 readBool:v7];

  return v5;
}

BOOL __54__FCPrivateChannelMembershipController_hasMemberships__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 104);
  }
  else {
    uint64_t v2 = 0;
  }
  return [v2 count] != 0;
}

void __60__FCPrivateChannelMembershipController_membershipChannelIDs__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 isAllowedToSeeDrafts]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 0;
}

+ (id)backingRecordZoneIDs
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1A320]);
  id v3 = (void *)[v2 initWithZoneName:@"ChannelMemberships" ownerName:*MEMORY[0x1E4F19C08]];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  return 0;
}

- (void)addItem:(int)a3 toStore:
{
  id v5 = a2;
  if (a1)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    if (v5)
    {
      id v6 = (void *)a1[14];
      uint64_t v11 = MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      id v13 = __56__FCPrivateChannelMembershipController_addItem_toStore___block_invoke;
      id v14 = &unk_1E5B4BE70;
      uint64_t v15 = a1;
      id v7 = v5;
      id v16 = v7;
      [v6 performWriteSync:&v11];
      if (a3)
      {
        id v8 = objc_msgSend(v7, "dictionaryRepresentation", v11, v12, v13, v14, v15);
        id v9 = [a1 localStore];
        __int16 v10 = [v7 identifier];
        [v9 setObject:v8 forKeyedSubscript:v10];
      }
    }
  }
}

+ (id)desiredKeys
{
  if (qword_1EB5D0E28 != -1) {
    dispatch_once(&qword_1EB5D0E28, &__block_literal_global_56_0);
  }
  id v2 = (void *)_MergedGlobals_7;
  return v2;
}

uint64_t __51__FCPrivateChannelMembershipController_desiredKeys__block_invoke_2()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"membershipID", 0);
  uint64_t v1 = _MergedGlobals_7;
  _MergedGlobals_7 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __56__FCPrivateChannelMembershipController_addItem_toStore___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(void *)(v2 + 104)) {
    goto LABEL_6;
  }
  id v3 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    objc_storeStrong((id *)(v4 + 104), v3);
  }

  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
LABEL_6:
  }
    id v5 = *(void **)(v2 + 104);
  else {
    id v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  return [v5 addObject:v6];
}

- (void)removeItemWithItemID:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    [MEMORY[0x1E4F29060] isMainThread];
    uint64_t v4 = (void *)a1[14];
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __61__FCPrivateChannelMembershipController_removeItemWithItemID___block_invoke;
    __int16 v10 = &unk_1E5B4BE70;
    uint64_t v11 = a1;
    id v5 = v3;
    id v12 = v5;
    [v4 performWriteSync:&v7];
    uint64_t v6 = objc_msgSend(a1, "localStore", v7, v8, v9, v10, v11);
    [v6 removeObjectForKey:v5];
  }
}

void __61__FCPrivateChannelMembershipController_removeItemWithItemID___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[13];
  }
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
LABEL_5:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
      id v9 = objc_msgSend(v8, "identifier", (void)v14);
      char v10 = [v9 isEqualToString:*(void *)(a1 + 40)];

      if (v10) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v11 = v8;

    if (!v11) {
      return;
    }
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      id v13 = *(void **)(v12 + 104);
    }
    else {
      id v13 = 0;
    }
    [v13 removeObject:v11];
  }
  else
  {
LABEL_11:
    id v11 = v3;
  }
}

- (void)referenceToMembershipForMembershipID:(void *)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v5 = (void *)a1[14];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__FCPrivateChannelMembershipController_referenceToMembershipForMembershipID___block_invoke;
    v8[3] = &unk_1E5B4E868;
    v8[4] = a1;
    id v9 = v3;
    id v6 = v5;
    a1 = [v6 readObject:v8];
  }
  return a1;
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v23 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [[FCReferenceToMembership alloc] initWithRecord:*(void *)(*((void *)&v28 + 1) + 8 * v10)];
        uint64_t v12 = [(FCReferenceToMembership *)v11 membershipID];

        if (v12)
        {
          id v13 = [(FCReferenceToMembership *)v11 membershipID];
          -[FCPrivateChannelMembershipController referenceToMembershipForMembershipID:](self, v13);
          long long v14 = (FCRemoveReferenceToChannelMembershipCommand *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            long long v15 = [(FCRemoveReferenceToChannelMembershipCommand *)v14 identifier];
            -[FCPrivateChannelMembershipController removeItemWithItemID:](self, v15);
          }
          -[FCPrivateChannelMembershipController addItem:toStore:](self, v11, 1);
        }
        else
        {
          long long v16 = [FCRemoveReferenceToChannelMembershipCommand alloc];
          long long v17 = [(FCReferenceToMembership *)v11 identifier];
          long long v14 = [(FCRemoveReferenceToChannelMembershipCommand *)v16 initWithReferenceToChannelMembershipID:v17];

          [(FCPrivateDataController *)self addCommandToCommandQueue:v14];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v8);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = v23;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        -[FCPrivateChannelMembershipController removeItemWithItemID:](self, *(void **)(*((void *)&v24 + 1) + 8 * v22++));
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v20);
  }

  if (self) {
    -[FCPrivateChannelMembershipController _refreshPublicMembershipsWithCompletion:](self, 0);
  }
}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3);
  if (self) {
    membershipsLocuint64_t k = self->_membershipsLock;
  }
  else {
    membershipsLocuint64_t k = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__FCPrivateChannelMembershipController_allKnownRecordNamesWithinRecordZoneWithID___block_invoke;
  v8[3] = &unk_1E5B4C840;
  v8[4] = self;
  uint64_t v5 = membershipsLock;
  id v6 = [(FCMTWriterLock *)v5 readObject:v8];

  return v6;
}

uint64_t __82__FCPrivateChannelMembershipController_allKnownRecordNamesWithinRecordZoneWithID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 104);
  }
  else {
    uint64_t v2 = 0;
  }
  return objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_62_0);
}

uint64_t __82__FCPrivateChannelMembershipController_allKnownRecordNamesWithinRecordZoneWithID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

id __77__FCPrivateChannelMembershipController_referenceToMembershipForMembershipID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void **)(v1 + 104);
  }
  else {
    uint64_t v2 = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __77__FCPrivateChannelMembershipController_referenceToMembershipForMembershipID___block_invoke_2;
  v6[3] = &unk_1E5B4EC40;
  id v7 = *(id *)(a1 + 40);
  id v3 = v2;
  uint64_t v4 = objc_msgSend(v3, "fc_firstObjectPassingTest:", v6);

  return v4;
}

uint64_t __77__FCPrivateChannelMembershipController_referenceToMembershipForMembershipID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 membershipID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)addObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    uint64_t v5 = [(FCPrivateDataController *)self observers];
    int v6 = [v5 containsObject:v4];

    if (v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"%p is already a state observer", v4);
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = "-[FCPrivateChannelMembershipController addObserver:]";
      __int16 v11 = 2080;
      uint64_t v12 = "FCPrivateChannelMembershipController.m";
      __int16 v13 = 1024;
      int v14 = 599;
      __int16 v15 = 2114;
      long long v16 = v8;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    id v7 = [(FCPrivateDataController *)self observers];
    [v7 addObject:v4];
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    id v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "stateObserver != nil");
    *(_DWORD *)buf = 136315906;
    uint64_t v10 = "-[FCPrivateChannelMembershipController addObserver:]";
    __int16 v11 = 2080;
    uint64_t v12 = "FCPrivateChannelMembershipController.m";
    __int16 v13 = 1024;
    int v14 = 595;
    __int16 v15 = 2114;
    long long v16 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_8:
}

- (void)removeObserver:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [MEMORY[0x1E4F29060] isMainThread];
  if (v4)
  {
    uint64_t v5 = [(FCPrivateDataController *)self observers];
    [v5 removeObject:v4];
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    uint64_t v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "stateObserver != nil");
    *(_DWORD *)buf = 136315906;
    id v7 = "-[FCPrivateChannelMembershipController removeObserver:]";
    __int16 v8 = 2080;
    uint64_t v9 = "FCPrivateChannelMembershipController.m";
    __int16 v10 = 1024;
    int v11 = 608;
    __int16 v12 = 2114;
    __int16 v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_5:
}

void __86__FCPrivateChannelMembershipController__fetchPrivateChannelMembershipsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    -[FCPrivateChannelMembershipController _refreshPublicMembershipsWithCompletion:](*(void **)(a1 + 32), *(void **)(a1 + 40));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_membershipsLock, 0);
  objc_storeStrong((id *)&self->_membershipReferences, 0);
  objc_storeStrong((id *)&self->_membershipsByChannelID, 0);
}

@end