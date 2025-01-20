@interface BRCCreateZoneAndSubscribeOperation
- (BOOL)optimisticSubscribe;
- (BOOL)shouldRetryForError:(id)a3;
- (BOOL)subscriptionOnly;
- (BRCCreateZoneAndSubscribeOperation)initWithServerZone:(id)a3 sessionContext:(id)a4;
- (BRCCreateZoneAndSubscribeOperation)initWithSession:(id)a3 zoneID:(id)a4;
- (CKRecordZone)createdZone;
- (id)createActivity;
- (id)createZoneAndSubscribeCompletionBlock;
- (void)_createZoneWithZoneID:(id)a3;
- (void)_registerSubscriptionForZoneID:(id)a3 isOptimisticSubscribe:(BOOL)a4;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)setCreateZoneAndSubscribeCompletionBlock:(id)a3;
- (void)setOptimisticSubscribe:(BOOL)a3;
- (void)setSubscriptionOnly:(BOOL)a3;
@end

@implementation BRCCreateZoneAndSubscribeOperation

- (BRCCreateZoneAndSubscribeOperation)initWithSession:(id)a3 zoneID:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v7 zoneName];
  v10 = [@"create-subscribe-zone/" stringByAppendingString:v9];
  v11 = [v8 syncContextProvider];
  v12 = [v11 defaultSyncContext];
  v15.receiver = self;
  v15.super_class = (Class)BRCCreateZoneAndSubscribeOperation;
  v13 = [(_BRCOperation *)&v15 initWithName:v10 syncContext:v12 sessionContext:v8];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_zoneID, a4);
    [(BRCCreateZoneAndSubscribeOperation *)v13 setQueuePriority:4];
  }

  return v13;
}

- (BRCCreateZoneAndSubscribeOperation)initWithServerZone:(id)a3 sessionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 zoneName];
  v9 = [@"create-subscribe-zone/" stringByAppendingString:v8];

  v10 = [v6 zoneID];
  zoneID = self->_zoneID;
  self->_zoneID = v10;

  v12 = [v6 metadataSyncContext];
  v17.receiver = self;
  v17.super_class = (Class)BRCCreateZoneAndSubscribeOperation;
  v13 = [(_BRCOperation *)&v17 initWithName:v9 syncContext:v12 sessionContext:v7];

  if (v13)
  {
    [(BRCCreateZoneAndSubscribeOperation *)v13 setQueuePriority:4];
    v14 = [v6 clientZone];
    int v15 = [v14 hasHighPriorityWatchers];

    if (v15) {
      [(_BRCOperation *)v13 setNonDiscretionary:1];
    }
  }

  return v13;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "create-zone", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)main
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !_optimisticSubscribe%@", v2, v3, v4, v5, v6);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  createZoneAndSubscribeCompletionBlock = (void (**)(id, id))self->_createZoneAndSubscribeCompletionBlock;
  if (createZoneAndSubscribeCompletionBlock) {
    createZoneAndSubscribeCompletionBlock[2](createZoneAndSubscribeCompletionBlock, v7);
  }
  v9.receiver = self;
  v9.super_class = (Class)BRCCreateZoneAndSubscribeOperation;
  [(_BRCOperation *)&v9 finishWithResult:v6 error:v7];
}

- (void)_createZoneWithZoneID:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263EFD7F8]) initWithZoneID:v4];
  id v6 = objc_alloc(MEMORY[0x263EFD740]);
  v18[0] = v5;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  id v8 = (void *)[v6 initWithRecordZonesToSave:v7 recordZoneIDsToDelete:0];

  objc_initWeak(&location, v8);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __60__BRCCreateZoneAndSubscribeOperation__createZoneWithZoneID___block_invoke;
  v13 = &unk_265083D50;
  objc_copyWeak(&v16, &location);
  id v9 = v4;
  id v14 = v9;
  int v15 = self;
  [v8 setModifyRecordZonesCompletionBlock:&v10];
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v8, v10, v11, v12, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __60__BRCCreateZoneAndSubscribeOperation__createZoneWithZoneID___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  memset(v22, 0, sizeof(v22));
  __brc_create_section(0, (uint64_t)"-[BRCCreateZoneAndSubscribeOperation _createZoneWithZoneID:]_block_invoke", 97, v22);
  uint64_t v11 = brc_bread_crumbs();
  v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = v22[0];
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = [WeakRetained operationID];
    v18 = (void *)v17;
    v19 = @"success";
    *(_DWORD *)buf = 134219010;
    if (v9) {
      v19 = v9;
    }
    uint64_t v24 = v15;
    __int16 v25 = 2112;
    uint64_t v26 = v16;
    __int16 v27 = 2112;
    uint64_t v28 = v17;
    __int16 v29 = 2112;
    v30 = v19;
    __int16 v31 = 2112;
    v32 = v11;
    _os_log_debug_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Handling result of creating %@ (operationID=%@): %@%@", buf, 0x34u);
  }
  if (v9)
  {
    [*(id *)(a1 + 40) completedWithResult:0 error:v9];
  }
  else
  {
    if ([v7 count] != 1)
    {
      v20 = brc_bread_crumbs();
      v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        __60__BRCCreateZoneAndSubscribeOperation__createZoneWithZoneID___block_invoke_cold_1();
      }
    }
    uint64_t v13 = [v7 count];
    if (v13)
    {
      id v14 = [v7 objectAtIndexedSubscript:0];
    }
    else
    {
      id v14 = 0;
    }
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 528), v14);
    if (v13) {

    }
    [*(id *)(a1 + 40) _registerSubscriptionForZoneID:*(void *)(a1 + 32) isOptimisticSubscribe:0];
  }
  __brc_leave_section(v22);
}

- (void)_registerSubscriptionForZoneID:(id)a3 isOptimisticSubscribe:(BOOL)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(BRCSyncContext *)self->super._syncContext isShared])
  {
    uint64_t v17 = brc_bread_crumbs();
    v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCCreateZoneAndSubscribeOperation _registerSubscriptionForZoneID:isOptimisticSubscribe:]();
    }
  }
  id v7 = [v6 zoneName];
  id v8 = [@"subscription/" stringByAppendingString:v7];

  id v9 = (void *)[objc_alloc(MEMORY[0x263EFD818]) initWithZoneID:v6 subscriptionID:v8];
  id v10 = objc_alloc_init(MEMORY[0x263EFD768]);
  [v10 setShouldSendContentAvailable:1];
  [v9 setNotificationInfo:v10];
  id v11 = objc_alloc(MEMORY[0x263EFD750]);
  v27[0] = v9;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  uint64_t v13 = (void *)[v11 initWithSubscriptionsToSave:v12 subscriptionIDsToDelete:0];

  objc_initWeak(&location, v13);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __91__BRCCreateZoneAndSubscribeOperation__registerSubscriptionForZoneID_isOptimisticSubscribe___block_invoke;
  v19[3] = &unk_265083D78;
  id v14 = v8;
  id v20 = v14;
  objc_copyWeak(&v24, &location);
  id v15 = v9;
  BOOL v25 = a4;
  id v21 = v15;
  v22 = self;
  id v16 = v6;
  id v23 = v16;
  [v13 setModifySubscriptionsCompletionBlock:v19];
  [(_BRCOperation *)self addSubOperation:v13];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __91__BRCCreateZoneAndSubscribeOperation__registerSubscriptionForZoneID_isOptimisticSubscribe___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_msgSend(v9, "brc_cloudKitErrorForSubscriptionID:", *(void *)(a1 + 32));
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ([(__CFString *)v10 brc_containsCloudKitInternalErrorCode:2032])
  {

    id v10 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  memset(v21, 0, sizeof(v21));
  __brc_create_section(0, (uint64_t)"-[BRCCreateZoneAndSubscribeOperation _registerSubscriptionForZoneID:isOptimisticSubscribe:]_block_invoke", 137, v21);
  v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = v21[0];
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v17 = [WeakRetained operationID];
    v18 = (void *)v17;
    v19 = @"success";
    *(_DWORD *)buf = 134219010;
    if (v10) {
      v19 = v10;
    }
    uint64_t v23 = v16;
    __int16 v24 = 2112;
    uint64_t v25 = v20;
    __int16 v26 = 2112;
    uint64_t v27 = v17;
    __int16 v28 = 2112;
    __int16 v29 = v19;
    __int16 v30 = 2112;
    __int16 v31 = v12;
    _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Handling result of creating %@ (operationID=%@): %@%@", buf, 0x34u);
  }
  if (*(unsigned char *)(a1 + 72)
    && (([(__CFString *)v10 brc_isCloudKitErrorImplyingZoneNeedsCreation] & 1) != 0
     || [(__CFString *)v10 brc_containsCloudKitErrorCode:11]))
  {
    id v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __91__BRCCreateZoneAndSubscribeOperation__registerSubscriptionForZoneID_isOptimisticSubscribe___block_invoke_cold_1();
    }

    [*(id *)(a1 + 48) _createZoneWithZoneID:*(void *)(a1 + 56)];
  }
  else
  {
    [*(id *)(a1 + 48) completedWithResult:0 error:v10];
  }
  __brc_leave_section(v21);
}

- (BOOL)optimisticSubscribe
{
  return self->_optimisticSubscribe;
}

- (void)setOptimisticSubscribe:(BOOL)a3
{
  self->_optimisticSubscribe = a3;
}

- (BOOL)subscriptionOnly
{
  return self->_subscriptionOnly;
}

- (void)setSubscriptionOnly:(BOOL)a3
{
  self->_subscriptionOnly = a3;
}

- (id)createZoneAndSubscribeCompletionBlock
{
  return self->_createZoneAndSubscribeCompletionBlock;
}

- (void)setCreateZoneAndSubscribeCompletionBlock:(id)a3
{
}

- (CKRecordZone)createdZone
{
  return self->_createdZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdZone, 0);
  objc_storeStrong(&self->_createZoneAndSubscribeCompletionBlock, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
}

void __60__BRCCreateZoneAndSubscribeOperation__createZoneWithZoneID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: savedZones.count == 1%@", v2, v3, v4, v5, v6);
}

- (void)_registerSubscriptionForZoneID:isOptimisticSubscribe:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: !self->_syncContext.isShared%@", v2, v3, v4, v5, v6);
}

void __91__BRCCreateZoneAndSubscribeOperation__registerSubscriptionForZoneID_isOptimisticSubscribe___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_23FA42000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] optimistic subscribe failed with Zone Not Found, try to create the zone first%@", v1, 0xCu);
}

@end