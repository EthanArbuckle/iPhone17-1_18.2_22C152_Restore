@interface BRCSharingFetchUserRecordIDOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCSharingFetchUserRecordIDOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4;
- (id)createActivity;
- (void)main;
@end

@implementation BRCSharingFetchUserRecordIDOperation

- (BRCSharingFetchUserRecordIDOperation)initWithSyncContext:(id)a3 sessionContext:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BRCSharingFetchUserRecordIDOperation;
  v4 = [(_BRCOperation *)&v8 initWithName:@"sharing.fetch-user-record-id" syncContext:a3 sessionContext:a4];
  v5 = v4;
  if (v4)
  {
    [(_BRCOperation *)v4 setNonDiscretionary:1];
    v6 = objc_msgSend(MEMORY[0x263EFD780], "br_sharingMisc");
    [(_BRCOperation *)v5 setGroup:v6];
  }
  return v5;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_23FA42000, "sharing.fetch-user-record-id", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return objc_msgSend(a3, "brc_isUserInitiatedRetriable");
}

- (void)main
{
  v3 = [MEMORY[0x263EFD6D8] fetchCurrentUserRecordOperation];
  [v3 setDesiredKeys:MEMORY[0x263EFFA68]];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__BRCSharingFetchUserRecordIDOperation_main__block_invoke;
  v4[3] = &unk_2650805D0;
  v4[4] = self;
  [v3 setFetchRecordsCompletionBlock:v4];
  [(_BRCOperation *)self addSubOperation:v3];
}

void __44__BRCSharingFetchUserRecordIDOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  if (!v6 && !v7)
  {
    objc_super v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __44__BRCSharingFetchUserRecordIDOperation_main__block_invoke_cold_1((uint64_t)v8, v9);
    }

    objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32430], 15, @"unreachable: no record and no error");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = *(void **)(a1 + 32);
  v11 = [v5 allKeys];
  v12 = [v11 firstObject];
  [v10 completedWithResult:v12 error:v6];
}

void __44__BRCSharingFetchUserRecordIDOperation_main__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: no record and no error%@", (uint8_t *)&v2, 0xCu);
}

@end