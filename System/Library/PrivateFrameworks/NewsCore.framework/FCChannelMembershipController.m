@interface FCChannelMembershipController
- (FCChannelMembershipController)initWithChannelMembershipRecordSource:(id)a3;
- (FCChannelMembershipRecordSource)recordSource;
- (id)cachedChannelMembershipsForIDs:(id)a3;
- (id)channelMembershipsFromHeldRecords:(id)a3;
- (void)fetchChannelMembershipsForIDs:(id)a3 maximumCachedAge:(double)a4 callbackQueue:(id)a5 completionHandler:(id)a6;
@end

@implementation FCChannelMembershipController

- (void)fetchChannelMembershipsForIDs:(id)a3 maximumCachedAge:(double)a4 callbackQueue:(id)a5 completionHandler:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = a5;
  id v11 = a6;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "channelMembershipIDs != nil");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCChannelMembershipController fetchChannelMembershipsForIDs:maximumCachedAge:callbackQueue:completionHandler:]";
    __int16 v25 = 2080;
    v26 = "FCChannelMembershipController.m";
    __int16 v27 = 1024;
    int v28 = 50;
    __int16 v29 = 2114;
    v30 = v16;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10) {
      goto LABEL_6;
    }
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "callbackQueue != nil");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCChannelMembershipController fetchChannelMembershipsForIDs:maximumCachedAge:callbackQueue:completionHandler:]";
    __int16 v25 = 2080;
    v26 = "FCChannelMembershipController.m";
    __int16 v27 = 1024;
    int v28 = 51;
    __int16 v29 = 2114;
    v30 = v17;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (v11)
  {
    if (v9 && v10)
    {
      if ([v9 count])
      {
        v12 = [(FCChannelMembershipController *)self recordSource];
        v13 = [v12 fetchOperationForRecordsWithIDs:v9];

        [v13 setQualityOfService:9];
        [v13 setCachePolicy:1];
        [v13 setFetchCompletionQueue:v10];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __112__FCChannelMembershipController_fetchChannelMembershipsForIDs_maximumCachedAge_callbackQueue_completionHandler___block_invoke;
        v20[3] = &unk_1E5B4CD70;
        v20[4] = self;
        id v21 = v9;
        id v22 = v11;
        [v13 setFetchCompletionBlock:v20];
        v14 = objc_msgSend(MEMORY[0x1E4F28F08], "fc_sharedConcurrentQueue");
        [v14 addOperation:v13];
      }
      else
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __112__FCChannelMembershipController_fetchChannelMembershipsForIDs_maximumCachedAge_callbackQueue_completionHandler___block_invoke_2;
        block[3] = &unk_1E5B4CA88;
        id v19 = v11;
        dispatch_async(v10, block);
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completionHandler != nil");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCChannelMembershipController fetchChannelMembershipsForIDs:maximumCachedAge:callbackQueue:completionHandler:]";
    __int16 v25 = 2080;
    v26 = "FCChannelMembershipController.m";
    __int16 v27 = 1024;
    int v28 = 52;
    __int16 v29 = 2114;
    v30 = v15;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
}

- (id)cachedChannelMembershipsForIDs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [(FCChannelMembershipController *)self recordSource];
    v6 = [v5 cachedRecordsWithIDs:v4];

    v7 = [(FCChannelMembershipController *)self channelMembershipsFromHeldRecords:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __112__FCChannelMembershipController_fetchChannelMembershipsForIDs_maximumCachedAge_callbackQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (FCChannelMembershipController)initWithChannelMembershipRecordSource:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "recordSource");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCChannelMembershipController initWithChannelMembershipRecordSource:]";
    __int16 v13 = 2080;
    v14 = "FCChannelMembershipController.m";
    __int16 v15 = 1024;
    int v16 = 29;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v10.receiver = self;
  v10.super_class = (Class)FCChannelMembershipController;
  v6 = [(FCChannelMembershipController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_recordSource, a3);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

void __112__FCChannelMembershipController_fetchChannelMembershipsForIDs_maximumCachedAge_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status])
  {
    id v4 = [v3 error];

    if (v4)
    {
      id v4 = v4;
      id v9 = 0;
      id v5 = 0;
      v6 = v4;
    }
    else
    {
      v6 = objc_msgSend(MEMORY[0x1E4F28C58], "fc_notAvailableError");
      id v9 = 0;
      id v5 = 0;
    }
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    v8 = [v3 fetchedObject];

    id v9 = [v7 channelMembershipsFromHeldRecords:v8];

    id v5 = (void *)[*(id *)(a1 + 40) mutableCopy];
    id v4 = [v9 allKeys];
    [v5 removeObjectsInArray:v4];
    v6 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)channelMembershipsFromHeldRecords:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__FCChannelMembershipController_channelMembershipsFromHeldRecords___block_invoke;
  v8[3] = &unk_1E5B4DB40;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateRecordsAndInterestTokensWithBlock:v8];

  return v6;
}

void __67__FCChannelMembershipController_channelMembershipsFromHeldRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = [v13 base];
  char v7 = [v6 deletedFromCloud];

  if ((v7 & 1) == 0)
  {
    v8 = [[FCChannelMembership alloc] initWithRecord:v13 interestToken:v5];
    id v9 = [(FCChannelMembership *)v8 channelID];

    if (v9)
    {
      objc_super v10 = *(void **)(a1 + 32);
      id v11 = [v13 base];
      v12 = [v11 identifier];
      [v10 setObject:v8 forKey:v12];
    }
  }
}

- (FCChannelMembershipRecordSource)recordSource
{
  return self->_recordSource;
}

- (void).cxx_destruct
{
}

@end