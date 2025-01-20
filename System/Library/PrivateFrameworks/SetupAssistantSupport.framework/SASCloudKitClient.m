@interface SASCloudKitClient
- (CKContainer)container;
- (CKDatabase)database;
- (OS_dispatch_queue)callbackQueue;
- (OS_xpc_object)xpcActivity;
- (SASCloudKitClient)initWithContainerIdentifier:(id)a3 callbackQueue:(id)a4;
- (SASCloudKitClient)initWithDatabase:(id)a3 inContainer:(id)a4 callbackQueue:(id)a5;
- (void)_scheduleDatabaseOperation:(id)a3;
- (void)fetchCurrentDeviceIDWithCompletion:(id)a3;
- (void)fetchRecordZone:(id)a3 group:(id)a4 completion:(id)a5;
- (void)fetchRecords:(id)a3 inZone:(id)a4 group:(id)a5 completion:(id)a6;
- (void)saveRecord:(id)a3 group:(id)a4 completion:(id)a5;
- (void)saveRecordZone:(id)a3 group:(id)a4 completion:(id)a5;
- (void)setCallbackQueue:(id)a3;
- (void)setContainer:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setXpcActivity:(id)a3;
@end

@implementation SASCloudKitClient

- (SASCloudKitClient)initWithContainerIdentifier:(id)a3 callbackQueue:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F19ED8];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithContainerIdentifier:v8 environment:1];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v9];
  v11 = [v10 privateCloudDatabase];
  v12 = [(SASCloudKitClient *)self initWithDatabase:v11 inContainer:v10 callbackQueue:v7];

  return v12;
}

- (SASCloudKitClient)initWithDatabase:(id)a3 inContainer:(id)a4 callbackQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SASCloudKitClient;
  v12 = [(SASCloudKitClient *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_container, a4);
    objc_storeStrong((id *)&v13->_database, a3);
    if (v11) {
      dispatch_queue_t v14 = (dispatch_queue_t)v11;
    }
    else {
      dispatch_queue_t v14 = dispatch_queue_create("Generic CloudKit Client Queue", 0);
    }
    callbackQueue = v13->_callbackQueue;
    v13->_callbackQueue = (OS_dispatch_queue *)v14;
  }
  return v13;
}

- (void)fetchCurrentDeviceIDWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(SASCloudKitClient *)self container];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__SASCloudKitClient_fetchCurrentDeviceIDWithCompletion___block_invoke;
  v7[3] = &unk_1E6CAB848;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchCurrentDeviceIDWithCompletionHandler:v7];
}

void __56__SASCloudKitClient_fetchCurrentDeviceIDWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__SASCloudKitClient_fetchCurrentDeviceIDWithCompletion___block_invoke_2;
  block[3] = &unk_1E6CAB820;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __56__SASCloudKitClient_fetchCurrentDeviceIDWithCompletion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchRecordZone:(id)a3 group:(id)a4 completion:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = (objc_class *)MEMORY[0x1E4F1A090];
  id v11 = a4;
  id v12 = [v10 alloc];
  v23[0] = v8;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v14 = (void *)[v12 initWithRecordZoneIDs:v13];

  [v14 setGroup:v11];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __54__SASCloudKitClient_fetchRecordZone_group_completion___block_invoke;
  v20 = &unk_1E6CAB870;
  id v21 = v8;
  id v22 = v9;
  id v15 = v8;
  id v16 = v9;
  [v14 setFetchRecordZonesCompletionBlock:&v17];
  -[SASCloudKitClient _scheduleDatabaseOperation:](self, "_scheduleDatabaseOperation:", v14, v17, v18, v19, v20);
}

void __54__SASCloudKitClient_fetchRecordZone_group_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = a3;
  id v9 = [a2 objectForKeyedSubscript:v6];
  id v8 = [MEMORY[0x1E4F1A280] itemErrorFromError:v7 forID:*(void *)(a1 + 32)];

  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v9, v8);
}

- (void)saveRecordZone:(id)a3 group:(id)a4 completion:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = (objc_class *)MEMORY[0x1E4F1A180];
  id v11 = a4;
  id v12 = [v10 alloc];
  v23[0] = v8;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v14 = (void *)[v12 initWithRecordZonesToSave:v13 recordZoneIDsToDelete:0];

  [v14 setGroup:v11];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __53__SASCloudKitClient_saveRecordZone_group_completion___block_invoke;
  v20 = &unk_1E6CAB898;
  id v21 = v8;
  id v22 = v9;
  id v15 = v8;
  id v16 = v9;
  [v14 setModifyRecordZonesCompletionBlock:&v17];
  -[SASCloudKitClient _scheduleDatabaseOperation:](self, "_scheduleDatabaseOperation:", v14, v17, v18, v19, v20);
}

void __53__SASCloudKitClient_saveRecordZone_group_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a4;
  id v11 = [a2 firstObject];
  id v8 = (void *)MEMORY[0x1E4F1A280];
  id v9 = [*(id *)(a1 + 32) zoneID];
  id v10 = [v8 itemErrorFromError:v7 forID:v9];

  (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v11, v10);
}

- (void)fetchRecords:(id)a3 inZone:(id)a4 group:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_opt_new();
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F1A2B8]) initWithQuery:v13];

  [v15 setGroup:v11];
  id v16 = [v12 zoneID];

  [v15 setZoneID:v16];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __58__SASCloudKitClient_fetchRecords_inZone_group_completion___block_invoke;
  v23[3] = &unk_1E6CAB8C0;
  id v17 = v14;
  id v24 = v17;
  [v15 setRecordMatchedBlock:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __58__SASCloudKitClient_fetchRecords_inZone_group_completion___block_invoke_14;
  v20[3] = &unk_1E6CAB8E8;
  id v21 = v17;
  id v22 = v10;
  id v18 = v17;
  id v19 = v10;
  [v15 setQueryCompletionBlock:v20];
  [(SASCloudKitClient *)self _scheduleDatabaseOperation:v15];
}

void __58__SASCloudKitClient_fetchRecords_inZone_group_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  unint64_t v7 = a2;
  id v8 = a3;
  unint64_t v9 = a4;
  id v10 = (void *)v9;
  if (v8)
  {
    [*(id *)(a1 + 32) addObject:v8];
  }
  else if (v7 | v9)
  {
    id v11 = +[SASLogging facility];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __58__SASCloudKitClient_fetchRecords_inZone_group_completion___block_invoke_cold_1((void *)v7, (uint64_t)v10, v11);
    }
  }
}

uint64_t __58__SASCloudKitClient_fetchRecords_inZone_group_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)saveRecord:(id)a3 group:(id)a4 completion:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = (objc_class *)MEMORY[0x1E4F1A198];
  id v11 = a4;
  id v12 = [v10 alloc];
  v23[0] = v8;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v14 = (void *)[v12 initWithRecordsToSave:v13 recordIDsToDelete:0];

  [v14 setGroup:v11];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  id v19 = __49__SASCloudKitClient_saveRecord_group_completion___block_invoke;
  v20 = &unk_1E6CAB898;
  id v21 = v8;
  id v22 = v9;
  id v15 = v8;
  id v16 = v9;
  [v14 setModifyRecordsCompletionBlock:&v17];
  -[SASCloudKitClient _scheduleDatabaseOperation:](self, "_scheduleDatabaseOperation:", v14, v17, v18, v19, v20);
}

void __49__SASCloudKitClient_saveRecord_group_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = a4;
  id v11 = [a2 firstObject];
  id v8 = (void *)MEMORY[0x1E4F1A280];
  id v9 = [*(id *)(a1 + 32) recordID];
  id v10 = [v8 itemErrorFromError:v7 forID:v9];

  (*(void (**)(uint64_t, BOOL, void *))(v6 + 16))(v6, v11 != 0, v10);
}

- (void)_scheduleDatabaseOperation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SASCloudKitClient *)self callbackQueue];
  [v4 setCallbackQueue:v5];

  uint64_t v6 = [(SASCloudKitClient *)self xpcActivity];
  id v7 = [v4 configuration];
  [v7 setXpcActivity:v6];

  id v8 = [(SASCloudKitClient *)self database];
  [v8 addOperation:v4];
}

- (OS_xpc_object)xpcActivity
{
  return self->_xpcActivity;
}

- (void)setXpcActivity:(id)a3
{
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_xpcActivity, 0);
}

void __58__SASCloudKitClient_fetchRecords_inZone_group_completion___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 recordName];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1DCC71000, a3, OS_LOG_TYPE_ERROR, "Failed to match record:%@ error:%@", (uint8_t *)&v6, 0x16u);
}

@end