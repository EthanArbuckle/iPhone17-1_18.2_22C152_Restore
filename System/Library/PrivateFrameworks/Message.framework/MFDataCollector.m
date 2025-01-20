@interface MFDataCollector
@end

@implementation MFDataCollector

BOOL __24___MFDataCollector_done__block_invoke(void *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 preparedStatementForQueryString:@"SELECT 1 FROM messages WHERE ROWID = ?;"];
  id v4 = objc_claimAutoreleasedReturnValue();
  v5 = (sqlite3_stmt *)[v4 compiled];

  sqlite3_bind_int64(v5, 1, a1[7]);
  LODWORD(v4) = sqlite3_step(v5);
  sqlite3_reset(v5);
  [v3 checkForConnectionErrorWithMessage:@"testing for message existence"];
  if (v4 == 100)
  {
    unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
    [*(id *)(a1[4] + 8) messageDataExistsInDatabaseForMessageLibraryID:a1[7] part:*(void *)(a1[4] + 40) length:&v25];
    if (v25 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v6 = [(id)a1[5] length], v6 > v25))
    {
      uint64_t v7 = a1[4];
      v8 = *(void **)(v7 + 8);
      uint64_t v9 = [*(id *)(v7 + 16) libraryID];
      [*(id *)(a1[4] + 16) globalMessageID];
      uint64_t v10 = a1[4];
      uint64_t v11 = a1[5];
      v12 = *(void **)(v10 + 40);
      int v13 = *(unsigned __int8 *)(v10 + 48);
      int v14 = *(unsigned __int8 *)(v10 + 49);
      v15 = [*(id *)(v10 + 16) account];
      id v16 = v8;
      id v17 = v3;
      id v18 = v12;
      id v19 = v15;
      v20 = [MEMORY[0x1E4F734C8] dataHolderWithData:v11];
      LOBYTE(v9) = _writeDataHolderForMessageAndPart(v16, v17, v9, 0, v18, v20, v13 != 0, v14 != 0, v19);

      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v9;
    }
    else
    {
      v24 = MFPersistenceLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        __24___MFDataCollector_done__block_invoke_cold_2();
      }
    }
  }
  else
  {
    v21 = MFPersistenceLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v21, OS_LOG_TYPE_DEFAULT, "not saving message data for non-existent message", buf, 2u);
    }
  }
  BOOL v22 = *(unsigned char *)(*(void *)(a1[6] + 8) + 24) != 0;

  return v22;
}

uint64_t __24___MFDataCollector_done__block_invoke_2368(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(*(void *)(a1 + 32) + 40)) {
    v5 = @"DELETE FROM message_data WHERE message_id = ? AND part = ?";
  }
  else {
    v5 = @"DELETE FROM message_data WHERE message_id = ? AND part IS NULL";
  }
  id v6 = [v3 preparedStatementForQueryString:v5];
  uint64_t v7 = (sqlite3_stmt *)[v6 compiled];

  sqlite3_bind_int64(v7, 1, [*(id *)(*(void *)(a1 + 32) + 16) libraryID]);
  v8 = *(void **)(*(void *)(a1 + 32) + 40);
  if (v8) {
    sqlite3_bind_text(v7, 2, (const char *)[v8 UTF8String], -1, 0);
  }
  sqlite3_step(v7);
  sqlite3_reset(v7);
  [v4 checkForConnectionErrorWithMessage:@"deleting message data"];

  return 1;
}

void __24___MFDataCollector_done__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_9_0(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_3_4(&dword_1A7EFF000, "Exception occurred while message with ID %lld: %@", v3, v4);
}

void __24___MFDataCollector_done__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_1A7EFF000, v0, OS_LOG_TYPE_DEBUG, "writing out no data since existing data is equally long", v1, 2u);
}

@end