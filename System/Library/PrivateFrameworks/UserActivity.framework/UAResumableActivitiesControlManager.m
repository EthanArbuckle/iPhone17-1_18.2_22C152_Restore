@interface UAResumableActivitiesControlManager
+ (id)resumableActivitiesControlManager;
- (BOOL)getAdvertisedBytes:(id)a3 completionHandler:(id)a4;
- (NSXPCConnection)connection;
- (UAResumableActivitiesControlManager)init;
- (id)advertisedItemUUID;
- (id)allUUIDsOfType:(unint64_t)a3;
- (id)currentAdvertisedItemUUID;
- (id)debuggingInfo;
- (id)defaults:(BOOL)a3;
- (id)delegate;
- (id)dynamicUserActivities;
- (id)enabledUUIDs;
- (id)getSysdiagnoseStringsIncludingPrivateData:(BOOL)a3;
- (id)matchingUUIDForString:(id)a3;
- (id)recentActions:(BOOL)a3;
- (id)simulatorStatus;
- (id)status;
- (id)status:(id)a3 options:(id)a4;
- (int)recordingPath;
- (int)serverPID;
- (void)callWillSaveDelegate:(id)a3 completionHandler:(id)a4;
- (void)connectToRemote:(id)a3 port:(int64_t)a4;
- (void)fetchMoreAppSuggestions;
- (void)injectBTLEItem:(id)a3 type:(unint64_t)a4 identifier:(id)a5 title:(id)a6 activityPayload:(id)a7 webPageURL:(id)a8 remoteModel:(id)a9 duration:(double)a10 payloadDelay:(double)a11;
- (void)peerDevices:(id)a3 completionHandler:(id)a4;
- (void)rendevous:(id)a3 domain:(id)a4 active:(BOOL)a5;
- (void)replayCommands:(id)a3 completionHandler:(id)a4;
- (void)restartServer;
- (void)setConnection:(id)a3;
- (void)setDebugOption:(id)a3 value:(id)a4;
- (void)setDefault:(id)a3 value:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setLocalReflect:(BOOL)a3;
- (void)setRecordingPath:(int)a3;
- (void)synchronize;
- (void)terminateServer;
@end

@implementation UAResumableActivitiesControlManager

+ (id)resumableActivitiesControlManager
{
  v2 = objc_alloc_init(UAResumableActivitiesControlManager);

  return v2;
}

- (UAResumableActivitiesControlManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)UAResumableActivitiesControlManager;
  v2 = [(UAResumableActivitiesControlManager *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F29268]);
    v4 = UAResumableActivitiesManagerServiceName();
    uint64_t v5 = [v3 initWithMachServiceName:v4 options:0];
    connection = v2->connection;
    v2->connection = (NSXPCConnection *)v5;

    [(NSXPCConnection *)v2->connection setRemoteObjectInterface:0];
    [(NSXPCConnection *)v2->connection setExportedObject:v2];
    v7 = _LSGetResumableActivitiesAdministrativeProtocolInterface();
    [(NSXPCConnection *)v2->connection setRemoteObjectInterface:v7];

    [(NSXPCConnection *)v2->connection setInterruptionHandler:&__block_literal_global_2];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__UAResumableActivitiesControlManager_init__block_invoke_2;
    v9[3] = &unk_1E60830C8;
    v10 = v2;
    [(NSXPCConnection *)v2->connection setInvalidationHandler:v9];
    [(NSXPCConnection *)v2->connection resume];
  }
  return v2;
}

uint64_t __43__UAResumableActivitiesControlManager_init__block_invoke_2(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 8) = 0;
  return result;
}

- (int)serverPID
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  v2 = self;
  objc_sync_enter(v2);
  *((_DWORD *)v9 + 6) = v2->_pid;
  objc_sync_exit(v2);

  int v3 = *((_DWORD *)v9 + 6);
  if (!v3)
  {
    v4 = [(NSXPCConnection *)v2->connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_5];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__UAResumableActivitiesControlManager_serverPID__block_invoke_9;
    v7[3] = &unk_1E6083110;
    v7[4] = v2;
    v7[5] = &v8;
    [v4 doNOP:@"serverPID" withCompletionHandler:v7];

    uint64_t v5 = v2;
    objc_sync_enter(v5);
    v2->_pid = *((_DWORD *)v9 + 6);
    objc_sync_exit(v5);

    int v3 = *((_DWORD *)v9 + 6);
  }
  _Block_object_dispose(&v8, 8);
  return v3;
}

void __48__UAResumableActivitiesControlManager_serverPID__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_ERROR, "Error from server, %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __48__UAResumableActivitiesControlManager_serverPID__block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [*(id *)(a1 + 32) connection];
    int v7 = [v6 processIdentifier];
    uint64_t v8 = [*(id *)(a1 + 32) connection];
    v10[0] = 67240706;
    v10[1] = v7;
    __int16 v11 = 2114;
    v12 = v8;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_INFO, "Connected to server, pid=%{public}d connection=%{public}@ error=%{public}@", (uint8_t *)v10, 0x1Cu);
  }
  v9 = [*(id *)(a1 + 32) connection];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v9 processIdentifier];
}

- (id)matchingUUIDForString:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
  uint64_t v6 = (void *)v14[5];
  v14[5] = v5;

  if (!v14[5])
  {
    int v7 = [(NSXPCConnection *)self->connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_13];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__UAResumableActivitiesControlManager_matchingUUIDForString___block_invoke_2;
    v12[3] = &unk_1E6083138;
    v12[4] = &v13;
    [v7 doFindMatchingUserActivityForString:v4 withCompletionHandler:v12];
  }
  uint64_t v8 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = v14[5];
    *(_DWORD *)buf = 138478083;
    id v20 = v4;
    __int16 v21 = 2114;
    uint64_t v22 = v9;
    _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_DEBUG, "(%{private}@), result = %{public}@", buf, 0x16u);
  }

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __61__UAResumableActivitiesControlManager_matchingUUIDForString___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)advertisedItemUUID
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  __int16 v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  id v2 = [(NSXPCConnection *)self->connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_16];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__UAResumableActivitiesControlManager_advertisedItemUUID__block_invoke_2;
  v7[3] = &unk_1E6083138;
  v7[4] = &v8;
  [v2 doCopyAdvertisedUUIDWithCompletionHandler:v7];

  uint64_t v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = v9[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v4;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEBUG, "result=%{public}@", buf, 0xCu);
  }

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __57__UAResumableActivitiesControlManager_advertisedItemUUID__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)allUUIDsOfType:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  id v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  id v5 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = suggestedActionTypeString(a3);
    *(_DWORD *)buf = 67109378;
    int v21 = a3;
    __int16 v22 = 2114;
    uint64_t v23 = v6;
    _os_log_impl(&dword_1B3DF6000, v5, OS_LOG_TYPE_DEBUG, "(%d/%{public}@)", buf, 0x12u);
  }
  int v7 = [(NSXPCConnection *)self->connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_18];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__UAResumableActivitiesControlManager_allUUIDsOfType___block_invoke_2;
  v13[3] = &unk_1E6083160;
  v13[4] = &v14;
  [v7 doCopyAllUUIDsOfType:a3 withCompletionHandler:v13];

  uint64_t v8 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = suggestedActionTypeString(a3);
    uint64_t v10 = v15[5];
    *(_DWORD *)buf = 67109634;
    int v21 = a3;
    __int16 v22 = 2114;
    uint64_t v23 = v9;
    __int16 v24 = 2114;
    uint64_t v25 = v10;
    _os_log_impl(&dword_1B3DF6000, v8, OS_LOG_TYPE_DEBUG, "(%d/%{public}@), result=%{public}@", buf, 0x1Cu);
  }
  __int16 v11 = (void *)[(id)v15[5] copy];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __54__UAResumableActivitiesControlManager_allUUIDsOfType___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)enabledUUIDs
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  id v2 = [(NSXPCConnection *)self->connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_21];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__UAResumableActivitiesControlManager_enabledUUIDs__block_invoke_2;
  v5[3] = &unk_1E6083160;
  v5[4] = &v6;
  [v2 doCopyEnabledUUIDsWithCompletionHandler:v5];

  uint64_t v3 = (void *)[(id)v7[5] copy];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __51__UAResumableActivitiesControlManager_enabledUUIDs__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)currentAdvertisedItemUUID
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  id v2 = [(NSXPCConnection *)self->connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_23];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__UAResumableActivitiesControlManager_currentAdvertisedItemUUID__block_invoke_2;
  v5[3] = &unk_1E6083138;
  v5[4] = &v6;
  [v2 doGetCurrentAdvertisedItemUUID:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __64__UAResumableActivitiesControlManager_currentAdvertisedItemUUID__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)debuggingInfo
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  id v2 = [(NSXPCConnection *)self->connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_25];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__UAResumableActivitiesControlManager_debuggingInfo__block_invoke_2;
  v5[3] = &unk_1E6083188;
  v5[4] = &v6;
  [v2 doCopyDebuggingInfo:0 completionHandler:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__UAResumableActivitiesControlManager_debuggingInfo__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)dynamicUserActivities
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  id v2 = [(NSXPCConnection *)self->connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_28];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__UAResumableActivitiesControlManager_dynamicUserActivities__block_invoke_2;
  v5[3] = &unk_1E60831B0;
  v5[4] = &v6;
  [v2 doCopyDynamicUserActivitiesString:0 completionHandler:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __60__UAResumableActivitiesControlManager_dynamicUserActivities__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)status
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  id v2 = [(NSXPCConnection *)self->connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_31];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__UAResumableActivitiesControlManager_status__block_invoke_2;
  v5[3] = &unk_1E60831B0;
  v5[4] = &v6;
  [v2 doCopyStatusString:@"status" options:0 completionHandler:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__UAResumableActivitiesControlManager_status__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)recentActions:(BOOL)a3
{
  BOOL v3 = a3;
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__0;
  uint64_t v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  uint64_t v4 = [(NSXPCConnection *)self->connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_36];
  if (v3) {
    uint64_t v5 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v5 = MEMORY[0x1E4F1CC28];
  }
  uint64_t v16 = @"clear";
  v17[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__UAResumableActivitiesControlManager_recentActions___block_invoke_2;
  v9[3] = &unk_1E6083160;
  void v9[4] = &v10;
  [v4 doCopyRecentActions:v6 completionHandler:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __53__UAResumableActivitiesControlManager_recentActions___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)simulatorStatus
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__0;
  uint64_t v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  id v2 = [(NSXPCConnection *)self->connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_42];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__UAResumableActivitiesControlManager_simulatorStatus__block_invoke_2;
  v5[3] = &unk_1E60831B0;
  v5[4] = &v6;
  [v2 doCopyStatusString:@"simulatorStatus" options:0 completionHandler:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__UAResumableActivitiesControlManager_simulatorStatus__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)status:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  uint64_t v8 = [(NSXPCConnection *)self->connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_47];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__UAResumableActivitiesControlManager_status_options___block_invoke_2;
  v11[3] = &unk_1E60831B0;
  v11[4] = &v12;
  [v8 doCopyStatusString:v6 options:v7 completionHandler:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __54__UAResumableActivitiesControlManager_status_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)fetchMoreAppSuggestions
{
  id v2 = [(NSXPCConnection *)self->connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_49];
  [v2 doFetchMoreAppSuggestions];
}

- (id)defaults:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__0;
  uint64_t v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  uint64_t v4 = [(NSXPCConnection *)self->connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_51];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__UAResumableActivitiesControlManager_defaults___block_invoke_2;
  v7[3] = &unk_1E60831D8;
  v7[4] = &v8;
  [v4 doCopyDefaults:v3 completionHandler:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __48__UAResumableActivitiesControlManager_defaults___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)setDefault:(id)a3 value:(id)a4
{
  connection = self->connection;
  id v6 = a4;
  id v7 = a3;
  id v9 = [(NSXPCConnection *)connection remoteObjectProxy];
  uint64_t v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];

  [v9 doSetDefaults:v7 archivedValue:v8];
}

- (void)restartServer
{
  [(UAResumableActivitiesControlManager *)self terminateServer];
  sleep(1u);
  id v3 = [(NSXPCConnection *)self->connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_55];
  [v3 doNOP:@"Hello, world!", &__block_literal_global_60 withCompletionHandler];
}

- (void)terminateServer
{
  id v3 = _uaGetLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3DF6000, v3, OS_LOG_TYPE_DEBUG, "Asking useractivityd server to exit.", buf, 2u);
  }

  uint64_t v4 = dispatch_group_create();
  id v5 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__UAResumableActivitiesControlManager_terminateServer__block_invoke;
  block[3] = &unk_1E60830C8;
  block[4] = self;
  dispatch_group_async(v4, v5, block);

  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  dispatch_group_wait(v4, v6);
}

void __54__UAResumableActivitiesControlManager_terminateServer__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  v1 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_62];
  [v1 doTerminateServer];
}

- (void)setDebugOption:(id)a3 value:(id)a4
{
  connection = self->connection;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v8 doSetDebugOption:v7 value:v6];
}

- (void)injectBTLEItem:(id)a3 type:(unint64_t)a4 identifier:(id)a5 title:(id)a6 activityPayload:(id)a7 webPageURL:(id)a8 remoteModel:(id)a9 duration:(double)a10 payloadDelay:(double)a11
{
  connection = self->connection;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a3;
  id v26 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&__block_literal_global_64];
  [v26 doInjectBTLEItem:v25 type:a4 identifier:v24 title:v23 activityPayload:v22 webPageURL:v21 remoteModel:a10 duration:a11 payloadDelay:v20];
}

- (void)callWillSaveDelegate:(id)a3 completionHandler:(id)a4
{
  connection = self->connection;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v8 doWillSaveDelegate:v7 completionHandler:v6];
}

- (void)connectToRemote:(id)a3 port:(int64_t)a4
{
  connection = self->connection;
  id v6 = a3;
  id v7 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v7 doSetupNetworkedPairs:v6 port:a4];
}

- (void)rendevous:(id)a3 domain:(id)a4 active:(BOOL)a5
{
  BOOL v5 = a5;
  connection = self->connection;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v10 doSetupRendevous:v9 domain:v8 activate:v5];
}

- (void)peerDevices:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  connection = self->connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__UAResumableActivitiesControlManager_peerDevices_completionHandler___block_invoke;
  v11[3] = &unk_1E6083220;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  [v10 doGetPairedDevices:v9 completionHandler:v8];
}

void __69__UAResumableActivitiesControlManager_peerDevices_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-1 userInfo:0];
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

- (id)getSysdiagnoseStringsIncludingPrivateData:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  BOOL v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  id v6 = objc_alloc(MEMORY[0x1E4F29268]);
  id v7 = UAResumableActivitiesManagerServiceName();
  id v8 = (void *)[v6 initWithMachServiceName:v7 options:0];

  [v8 setRemoteObjectInterface:0];
  [v8 setExportedObject:self];
  id v9 = _LSGetResumableActivitiesSysdiagnoseSupportProtocolInterface();
  [v8 setRemoteObjectInterface:v9];

  [v8 setInterruptionHandler:&__block_literal_global_67];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __81__UAResumableActivitiesControlManager_getSysdiagnoseStringsIncludingPrivateData___block_invoke_2;
  v22[3] = &unk_1E60830C8;
  v22[4] = self;
  [v8 setInvalidationHandler:v22];
  [v8 resume];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __81__UAResumableActivitiesControlManager_getSysdiagnoseStringsIncludingPrivateData___block_invoke_3;
  v19[3] = &unk_1E6083248;
  id v21 = &v23;
  id v10 = v5;
  id v20 = v10;
  id v11 = [v8 remoteObjectProxyWithErrorHandler:v19];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__UAResumableActivitiesControlManager_getSysdiagnoseStringsIncludingPrivateData___block_invoke_4;
  v16[3] = &unk_1E6083270;
  id v18 = &v23;
  id v12 = v10;
  id v17 = v12;
  [v11 doGetSysdiagnoseStringsIncludingPrivateData:v3 completionHandler:v16];

  if (dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL)) {
    id v13 = 0;
  }
  else {
    id v13 = (void *)v24[5];
  }
  id v14 = v13;

  _Block_object_dispose(&v23, 8);

  return v14;
}

uint64_t __81__UAResumableActivitiesControlManager_getSysdiagnoseStringsIncludingPrivateData___block_invoke_2(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 8) = 0;
  return result;
}

void __81__UAResumableActivitiesControlManager_getSysdiagnoseStringsIncludingPrivateData___block_invoke_3(uint64_t a1, void *a2)
{
  BOOL v3 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v4 = [a2 description];
  uint64_t v5 = [v3 arrayWithObject:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  id v8 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v8);
}

void __81__UAResumableActivitiesControlManager_getSysdiagnoseStringsIncludingPrivateData___block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)replayCommands:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  connection = self->connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__UAResumableActivitiesControlManager_replayCommands_completionHandler___block_invoke;
  v11[3] = &unk_1E6083220;
  id v12 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  [v10 doReplayCommands:v9 completionHandler:v8];
}

uint64_t __72__UAResumableActivitiesControlManager_replayCommands_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)synchronize
{
  id v2 = [(NSXPCConnection *)self->connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_70];
  [v2 doNOP:@"synchronize" withCompletionHandler:&__block_literal_global_75];
}

- (void)setLocalReflect:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NSXPCConnection *)self->connection remoteObjectProxyWithErrorHandler:&__block_literal_global_77];
  [v4 doSetLocalPasteboardReflection:v3];
}

void __55__UAResumableActivitiesControlManager_setLocalReflect___block_invoke(uint64_t a1, uint64_t a2)
{
}

- (BOOL)getAdvertisedBytes:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  connection = self->connection;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__UAResumableActivitiesControlManager_getAdvertisedBytes_completionHandler___block_invoke;
  v12[3] = &unk_1E6083220;
  id v13 = v6;
  id v8 = v6;
  id v9 = a3;
  id v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v12];
  [v10 doGetSFActivityAdvertisement:v9 completionHandler:v8];

  return 1;
}

uint64_t __76__UAResumableActivitiesControlManager_getAdvertisedBytes_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (int)recordingPath
{
  return self->_recordingPath;
}

- (void)setRecordingPath:(int)a3
{
  self->_recordingPath = a3;
}

- (void).cxx_destruct
{
}

@end