@interface RTTDatabaseManager
+ (id)sharedManager;
- (BOOL)contactIDIsTTYContact:(id)a3;
- (BOOL)contactIsTTYContact:(id)a3;
- (BOOL)contactPathWasUsedForTTY:(id)a3;
- (BOOL)deleteConversationWithCallUID:(id)a3;
- (BOOL)deleteConversationsWithCallUIDs:(id)a3;
- (BOOL)saveConversation:(id)a3;
- (RTTDatabaseManager)init;
- (id)cloudKitContainer;
- (id)containerIdentifier;
- (id)conversationForCallUID:(id)a3;
- (id)managedObjectModelName;
- (void)_callHistoryDBDidChange:(id)a3;
- (void)callHistoryDBDidChange:(id)a3;
- (void)logMessage:(id)a3;
@end

@implementation RTTDatabaseManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedManager_Manager;

  return v2;
}

uint64_t __35__RTTDatabaseManager_sharedManager__block_invoke()
{
  sharedManager_Manager = objc_alloc_init(RTTDatabaseManager);

  return MEMORY[0x270F9A758]();
}

- (RTTDatabaseManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)RTTDatabaseManager;
  v2 = [(HCDatabaseManager *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_callHistoryDBDidChange_ name:*MEMORY[0x263F30638] object:0];

    v4 = (CHManager *)objc_alloc_init(MEMORY[0x263F30580]);
    callHistoryManager = v2->_callHistoryManager;
    v2->_callHistoryManager = v4;

    [(RTTDatabaseManager *)v2 callHistoryDBDidChange:0];
  }
  return v2;
}

- (id)managedObjectModelName
{
  return @"TTYDBModel";
}

- (id)cloudKitContainer
{
  return @"com.apple.RTTTranscripts";
}

- (id)containerIdentifier
{
  return @"com.apple.accessibility.RTTTranscripts";
}

- (void)logMessage:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = AXLogRTT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_21FEA9000, v4, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)callHistoryDBDidChange:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t __45__RTTDatabaseManager_callHistoryDBDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _callHistoryDBDidChange:*(void *)(a1 + 40)];
}

- (void)_callHistoryDBDidChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = AXLogRTT();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_21FEA9000, v5, OS_LOG_TYPE_INFO, "Call history changed: %@", (uint8_t *)&buf, 0xCu);
  }

  id v6 = (void *)MEMORY[0x223C60680]();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  uint64_t v7 = [(HCDatabaseManager *)self managedObjectContext];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __46__RTTDatabaseManager__callHistoryDBDidChange___block_invoke;
  v18[3] = &unk_2645408B8;
  v18[4] = self;
  v18[5] = &buf;
  [v7 performBlockAndWait:v18];

  v8 = [MEMORY[0x263EFF980] array];
  v9 = *(void **)(*((void *)&buf + 1) + 40);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __46__RTTDatabaseManager__callHistoryDBDidChange___block_invoke_2;
  v15 = &unk_2645408E0;
  v16 = self;
  id v10 = v8;
  id v17 = v10;
  [v9 enumerateObjectsUsingBlock:&v12];
  v11 = AXLogRTT();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v19 = 138412290;
    id v20 = v10;
    _os_log_impl(&dword_21FEA9000, v11, OS_LOG_TYPE_INFO, "Deleting %@", v19, 0xCu);
  }

  -[RTTDatabaseManager deleteConversationsWithCallUIDs:](self, "deleteConversationsWithCallUIDs:", v10, v12, v13, v14, v15, v16);
  _Block_object_dispose(&buf, 8);
}

void __46__RTTDatabaseManager__callHistoryDBDidChange___block_invoke(uint64_t a1)
{
  id v6 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"TTYContactList"];
  [v6 setReturnsObjectsAsFaults:0];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = [v2 executeFetchRequest:v6 error:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __46__RTTDatabaseManager__callHistoryDBDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 24);
  int v5 = (void *)MEMORY[0x263F08A98];
  id v6 = [v3 callUID];
  uint64_t v7 = [v5 predicateWithFormat:@"uniqueId == %@", v6];
  v8 = [v4 recentCallsWithPredicate:v7];

  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__2;
  uint64_t v26 = __Block_byref_object_dispose__2;
  id v27 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __46__RTTDatabaseManager__callHistoryDBDidChange___block_invoke_3;
  v19[3] = &unk_2645408B8;
  v21 = &v22;
  id v9 = v3;
  id v20 = v9;
  +[RTTTelephonyUtilities performCallCenterTask:v19];
  id v10 = AXLogRTT();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = v23[5];
    *(_DWORD *)long long buf = 138412546;
    v29 = v8;
    __int16 v30 = 2112;
    uint64_t v31 = v11;
    _os_log_impl(&dword_21FEA9000, v10, OS_LOG_TYPE_INFO, "Recent calls: %@/TU Call %@", buf, 0x16u);
  }

  int v12 = [(id)v23[5] status];
  if (![v8 count])
  {
    uint64_t v13 = [v9 callUID];
    if ([v13 length]) {
      BOOL v14 = v12 == 1;
    }
    else {
      BOOL v14 = 1;
    }
    int v16 = !v14 && v12 != 2;

    if (v16)
    {
      id v17 = *(void **)(a1 + 40);
      v18 = [v9 callUID];
      [v17 addObject:v18];
    }
  }

  _Block_object_dispose(&v22, 8);
}

void __46__RTTDatabaseManager__callHistoryDBDidChange___block_invoke_3(uint64_t a1)
{
  id v6 = +[RTTTelephonyUtilities sharedCallCenter];
  v2 = [*(id *)(a1 + 32) callUID];
  uint64_t v3 = [v6 callWithCallUUID:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)conversationForCallUID:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  id v36 = 0;
  int v5 = (void *)MEMORY[0x223C60680]();
  *(void *)v41 = 0;
  *(void *)&v41[8] = v41;
  *(void *)&v41[16] = 0x3032000000;
  v42 = __Block_byref_object_copy__2;
  v43 = __Block_byref_object_dispose__2;
  id v44 = 0;
  id v6 = [(HCDatabaseManager *)self managedObjectContext];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __45__RTTDatabaseManager_conversationForCallUID___block_invoke;
  v26[3] = &unk_264540908;
  id v7 = v4;
  id v27 = v7;
  v28 = self;
  v29 = v41;
  __int16 v30 = &v31;
  [v6 performBlockAndWait:v26];

  v8 = AXLogRTT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(*(void *)&v41[8] + 40);
    uint64_t v10 = v32[5];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v38 = v9;
    __int16 v39 = 2112;
    uint64_t v40 = v10;
    _os_log_impl(&dword_21FEA9000, v8, OS_LOG_TYPE_INFO, "Conversation for call UID result: %@/%@", buf, 0x16u);
  }

  if (v32[5])
  {
    uint64_t v11 = AXLogRTT();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[RTTDatabaseManager conversationForCallUID:].cold.4();
    }
LABEL_16:
    v21 = 0;
    goto LABEL_17;
  }
  if ((unint64_t)[*(id *)(*(void *)&v41[8] + 40) count] >= 2)
  {
    int v12 = AXLogRTT();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[RTTDatabaseManager conversationForCallUID:]();
    }
  }
  uint64_t v11 = [*(id *)(*(void *)&v41[8] + 40) lastObject];
  uint64_t v13 = [v11 data];
  if (!v13) {
    goto LABEL_16;
  }
  BOOL v14 = [v11 version];
  int v15 = [v14 isEqualToNumber:&unk_26D1B3BF8];

  if (!v15) {
    goto LABEL_16;
  }
  id v16 = objc_alloc(MEMORY[0x263F08928]);
  id v17 = [v11 data];
  v18 = (id *)(v32 + 5);
  id obj = (id)v32[5];
  v19 = (void *)[v16 initForReadingFromData:v17 error:&obj];
  objc_storeStrong(v18, obj);

  if (v32[5])
  {
    id v20 = AXLogRTT();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[RTTDatabaseManager conversationForCallUID:]();
    }

    v21 = 0;
  }
  else
  {
    uint64_t v24 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    v21 = [v19 decodeObjectOfClasses:v24 forKey:*MEMORY[0x263F081D0]];
  }
LABEL_17:

  _Block_object_dispose(v41, 8);
  uint64_t v22 = AXLogRTT();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v41 = 138412546;
    *(void *)&v41[4] = v7;
    *(_WORD *)&v41[12] = 2112;
    *(void *)&v41[14] = v21;
    _os_log_impl(&dword_21FEA9000, v22, OS_LOG_TYPE_INFO, "Found conversation for id [%@] - %@", v41, 0x16u);
  }

  _Block_object_dispose(&v31, 8);

  return v21;
}

void __45__RTTDatabaseManager_conversationForCallUID___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"TTYHistory"];
  uint64_t v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"callUID = %@", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  [v2 setReturnsObjectsAsFaults:0];
  id v4 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v4 executeFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (BOOL)saveConversation:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(HCDatabaseManager *)self managedObjectContext];

  if (v5)
  {
    uint64_t v44 = 0;
    uint64_t v45 = &v44;
    uint64_t v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__2;
    v48 = __Block_byref_object_dispose__2;
    id v49 = 0;
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
    [v6 encodeObject:v4 forKey:*MEMORY[0x263F081D0]];
    [v6 finishEncoding];
    uint64_t v7 = [v6 encodedData];
    if ([v7 length])
    {
      uint64_t v38 = 0;
      __int16 v39 = &v38;
      uint64_t v40 = 0x3032000000;
      v41 = __Block_byref_object_copy__2;
      v42 = __Block_byref_object_dispose__2;
      id v43 = 0;
      v8 = [(HCDatabaseManager *)self managedObjectContext];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __39__RTTDatabaseManager_saveConversation___block_invoke;
      v33[3] = &unk_264540908;
      id v9 = v4;
      id v34 = v9;
      v35 = self;
      id v36 = &v38;
      v37 = &v44;
      [v8 performBlockAndWait:v33];

      uint64_t v10 = [(id)v39[5] lastObject];
      uint64_t v11 = (void *)v10;
      if (v10 && !v45[5])
      {
        BOOL v14 = (void *)v10;
      }
      else
      {
        int v12 = (void *)MEMORY[0x263EFF240];
        uint64_t v13 = [(HCDatabaseManager *)self managedObjectContext];
        BOOL v14 = [v12 insertNewObjectForEntityForName:@"TTYHistory" inManagedObjectContext:v13];

        int v15 = [v9 callIdentifier];
        [v14 setCallUID:v15];
      }
      [v14 setVersion:&unk_26D1B3BF8];
      [v14 setData:v7];
      [v14 setNeedsCloudKitUpload:MEMORY[0x263EFFA88]];

      _Block_object_dispose(&v38, 8);
      uint64_t v38 = 0;
      __int16 v39 = &v38;
      uint64_t v40 = 0x3032000000;
      v41 = __Block_byref_object_copy__2;
      v42 = __Block_byref_object_dispose__2;
      id v43 = 0;
      id v17 = [(HCDatabaseManager *)self managedObjectContext];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __39__RTTDatabaseManager_saveConversation___block_invoke_42;
      v29[3] = &unk_264540930;
      id v18 = v9;
      uint64_t v31 = self;
      uint64_t v32 = &v38;
      id v30 = v18;
      [v17 performBlockAndWait:v29];

      v19 = [(id)v39[5] lastObject];
      if (!v19)
      {
        id v20 = [v18 otherContactPath];
        BOOL v21 = [v20 length] == 0;

        if (!v21)
        {
          uint64_t v22 = (void *)MEMORY[0x263EFF240];
          v23 = [(HCDatabaseManager *)self managedObjectContext];
          uint64_t v24 = [v22 insertNewObjectForEntityForName:@"TTYContactList" inManagedObjectContext:v23];

          id v25 = [v18 callIdentifier];
          [v24 setCallUID:v25];

          uint64_t v26 = [v18 otherContactPath];
          [v24 setContactID:v26];
        }
      }
      LODWORD(self) = [(HCDatabaseManager *)self saveIfPossible];
      id v27 = AXLogRTT();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109378;
        int v51 = (int)self;
        __int16 v52 = 2112;
        id v53 = v18;
        _os_log_impl(&dword_21FEA9000, v27, OS_LOG_TYPE_INFO, "Saved to database[%d]: %@", buf, 0x12u);
      }

      _Block_object_dispose(&v38, 8);
    }
    else
    {
      AXLogRTT();
      self = (RTTDatabaseManager *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&self->super.super, OS_LOG_TYPE_ERROR)) {
        -[RTTDatabaseManager saveConversation:]();
      }

      LOBYTE(self) = 0;
    }

    _Block_object_dispose(&v44, 8);
  }
  else
  {
    id v16 = AXLogRTT();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[RTTDatabaseManager saveConversation:]();
    }

    LOBYTE(self) = 0;
  }

  return (char)self;
}

void __39__RTTDatabaseManager_saveConversation___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"TTYHistory"];
  uint64_t v3 = (void *)MEMORY[0x263F08A98];
  id v4 = [*(id *)(a1 + 32) callIdentifier];
  uint64_t v5 = [v3 predicateWithFormat:@"callUID = %@", v4];
  [v2 setPredicate:v5];

  [v2 setReturnsObjectsAsFaults:0];
  uint64_t v6 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v6 executeFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __39__RTTDatabaseManager_saveConversation___block_invoke_42(uint64_t a1)
{
  id v9 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"TTYContactList"];
  v2 = (void *)MEMORY[0x263F08A98];
  uint64_t v3 = [*(id *)(a1 + 32) callIdentifier];
  id v4 = [v2 predicateWithFormat:@"callUID = %@", v3];
  [v9 setPredicate:v4];

  [v9 setReturnsObjectsAsFaults:0];
  uint64_t v5 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v6 = [v5 executeFetchRequest:v9 error:0];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (BOOL)deleteConversationsWithCallUIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HCDatabaseManager *)self managedObjectContext];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __54__RTTDatabaseManager_deleteConversationsWithCallUIDs___block_invoke;
  uint64_t v11 = &unk_2645400C0;
  id v12 = v4;
  uint64_t v13 = self;
  id v6 = v4;
  [v5 performBlockAndWait:&v8];

  LOBYTE(self) = [(HCDatabaseManager *)self saveIfPossible];
  return (char)self;
}

void __54__RTTDatabaseManager_deleteConversationsWithCallUIDs___block_invoke(uint64_t a1)
{
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x3032000000;
  v3[3] = __Block_byref_object_copy__2;
  v3[4] = __Block_byref_object_dispose__2;
  id v4 = 0;
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __54__RTTDatabaseManager_deleteConversationsWithCallUIDs___block_invoke_2;
  v2[3] = &unk_264540958;
  v1 = *(void **)(a1 + 32);
  v2[4] = *(void *)(a1 + 40);
  v2[5] = v3;
  [v1 enumerateObjectsUsingBlock:v2];
  _Block_object_dispose(v3, 8);
}

void __54__RTTDatabaseManager_deleteConversationsWithCallUIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"TTYHistory"];
  uint64_t v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"callUID = %@", v3];
  [v4 setPredicate:v5];

  [v4 setReturnsObjectsAsFaults:0];
  id v6 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v6 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);

  uint64_t v9 = [v8 lastObject];
  if (v9)
  {
    uint64_t v10 = [*(id *)(a1 + 32) managedObjectContext];
    [v10 deleteObject:v9];
  }
  uint64_t v11 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"TTYContactList"];

  id v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"callUID = %@", v3];
  [v11 setPredicate:v12];

  [v11 setReturnsObjectsAsFaults:0];
  uint64_t v13 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
  id v18 = *(id *)(v14 + 40);
  int v15 = [v13 executeFetchRequest:v11 error:&v18];
  objc_storeStrong((id *)(v14 + 40), v18);

  id v16 = [v15 lastObject];
  if (v16)
  {
    id v17 = [*(id *)(a1 + 32) managedObjectContext];
    [v17 deleteObject:v16];
  }
}

- (BOOL)deleteConversationWithCallUID:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length])
  {
    v8[0] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    BOOL v6 = [(RTTDatabaseManager *)self deleteConversationsWithCallUIDs:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)contactIDIsTTYContact:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v5 = +[RTTTelephonyUtilities sharedUtilityProvider];
  BOOL v6 = [v5 contactStore];
  uint64_t v7 = (void *)MEMORY[0x263EFE9F8];
  v19[0] = v4;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  uint64_t v9 = [v7 predicateForContactsWithIdentifiers:v8];
  uint64_t v18 = *MEMORY[0x263EFE070];
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
  uint64_t v11 = [v6 unifiedContactsMatchingPredicate:v9 keysToFetch:v10 error:0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__RTTDatabaseManager_contactIDIsTTYContact___block_invoke;
  v13[3] = &unk_2645409A8;
  v13[4] = self;
  v13[5] = &v14;
  [v11 enumerateObjectsUsingBlock:v13];

  LOBYTE(v5) = *((unsigned char *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);

  return (char)v5;
}

void __44__RTTDatabaseManager_contactIDIsTTYContact___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  BOOL v6 = [a2 phoneNumbers];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__RTTDatabaseManager_contactIDIsTTYContact___block_invoke_2;
  v7[3] = &unk_264540980;
  long long v8 = *(_OWORD *)(a1 + 32);
  uint64_t v9 = a4;
  [v6 enumerateObjectsUsingBlock:v7];
}

void __44__RTTDatabaseManager_contactIDIsTTYContact___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  BOOL v6 = (void *)a1[4];
  uint64_t v7 = [a2 value];
  long long v8 = [v7 stringValue];
  LODWORD(v6) = [v6 contactPathWasUsedForTTY:v8];

  if (v6)
  {
    uint64_t v9 = (unsigned char *)a1[6];
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    *a4 = 1;
    unsigned char *v9 = 1;
  }
}

- (BOOL)contactIsTTYContact:(id)a3
{
  id v4 = [a3 identifier];
  LOBYTE(self) = [(RTTDatabaseManager *)self contactIDIsTTYContact:v4];

  return (char)self;
}

- (BOOL)contactPathWasUsedForTTY:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__2;
  id v27 = __Block_byref_object_dispose__2;
  id v28 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__2;
  BOOL v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  uint64_t v5 = [(HCDatabaseManager *)self managedObjectContext];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __47__RTTDatabaseManager_contactPathWasUsedForTTY___block_invoke;
  id v12 = &unk_264540908;
  id v6 = v4;
  id v13 = v6;
  uint64_t v14 = self;
  int v15 = &v17;
  uint64_t v16 = &v23;
  [v5 performBlockAndWait:&v9];

  if (objc_msgSend((id)v18[5], "count", v9, v10, v11, v12)) {
    BOOL v7 = v24[5] == 0;
  }
  else {
    BOOL v7 = 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v7;
}

void __47__RTTDatabaseManager_contactPathWasUsedForTTY___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263EFF260] fetchRequestWithEntityName:@"TTYContactList"];
  id v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"contactID = %@", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  id v4 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v5 = *(void *)(a1 + 56);
  a1 += 56;
  uint64_t v6 = *(void *)(v5 + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v4 executeFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(*(void *)(a1 - 8) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (*(void *)(*(void *)(*(void *)a1 + 8) + 40))
  {
    uint64_t v10 = AXLogRTT();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __47__RTTDatabaseManager_contactPathWasUsedForTTY___block_invoke_cold_1();
    }
  }
}

- (void).cxx_destruct
{
}

- (void)conversationForCallUID:.cold.2()
{
  OUTLINED_FUNCTION_1_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_21FEA9000, v0, v1, "Failed to create unarchiver with error %@", v2, v3, v4, v5, v6);
}

- (void)conversationForCallUID:.cold.3()
{
  OUTLINED_FUNCTION_1_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_21FEA9000, v0, OS_LOG_TYPE_FAULT, "We had two callUID results, %@", v1, 0xCu);
}

- (void)conversationForCallUID:.cold.4()
{
  OUTLINED_FUNCTION_1_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_21FEA9000, v0, v1, "Failed TTYHistory fetch %@", v2, v3, v4, v5, v6);
}

- (void)saveConversation:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_21FEA9000, v1, OS_LOG_TYPE_ERROR, "Not saving convo because no object: %@, %@", v2, 0x16u);
}

- (void)saveConversation:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FEA9000, v0, v1, "Not saving conversation because dataBlock was empty: %@", v2, v3, v4, v5, v6);
}

- (void)saveConversation:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FEA9000, v0, v1, "Exception encoding data: %@", v2, v3, v4, v5, v6);
}

void __47__RTTDatabaseManager_contactPathWasUsedForTTY___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_21FEA9000, v0, v1, "Contact path TTY error: %@", v2, v3, v4, v5, v6);
}

@end