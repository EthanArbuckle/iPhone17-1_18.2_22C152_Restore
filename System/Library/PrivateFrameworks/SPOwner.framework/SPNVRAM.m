@interface SPNVRAM
+ (BOOL)write:(id)a3;
+ (id)read;
+ (void)clear;
@end

@implementation SPNVRAM

+ (void)clear
{
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3 = [MEMORY[0x1E4F61A48] sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __16__SPNVRAM_clear__block_invoke;
  v6[3] = &unk_1E601B598;
  v7 = v2;
  v4 = v2;
  [v3 clearOfflineFindingInfoWithCompletion:v6];

  dispatch_time_t v5 = dispatch_time(0, 30000000000);
  dispatch_group_wait(v4, v5);
}

void __16__SPNVRAM_clear__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = LogCategory_NVRAM();
  dispatch_time_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __16__SPNVRAM_clear__block_invoke_cold_1();
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "NVRAM cleared.", v6, 2u);
    }
  }
}

+ (id)read
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  id v3 = LogCategory_NVRAM();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B2FD8000, v3, OS_LOG_TYPE_DEFAULT, "Beginning read of keys from NVRAM.", buf, 2u);
  }

  v4 = [MEMORY[0x1E4F61A48] sharedInstance];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __15__SPNVRAM_read__block_invoke;
  v16 = &unk_1E601B5C0;
  dispatch_time_t v5 = v2;
  v17 = v5;
  v18 = &v19;
  [v4 fetchOfflineFindingInfoWithCompletion:&v13];

  dispatch_time_t v6 = dispatch_time(0, 30000000000);
  dispatch_group_wait(v5, v6);
  v7 = LogCategory_NVRAM();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)v20[5];
    uint64_t v9 = objc_msgSend(v8, "length", v13, v14, v15, v16);
    v10 = @"(not-nil)";
    if (!v8) {
      v10 = @"(nil)";
    }
    *(_DWORD *)buf = 138543618;
    v26 = v10;
    __int16 v27 = 2048;
    uint64_t v28 = v9;
    _os_log_impl(&dword_1B2FD8000, v7, OS_LOG_TYPE_DEFAULT, "Done waiting to read keys from NVRAM returnValue %{public}@ %lu", buf, 0x16u);
  }

  id v11 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v11;
}

void __15__SPNVRAM_read__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = LogCategory_NVRAM();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __15__SPNVRAM_read__block_invoke_cold_2();
    }
  }
  else if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    uint64_t v9 = LogCategory_NVRAM();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      uint64_t v11 = [v6 length];
      _os_log_impl(&dword_1B2FD8000, v9, OS_LOG_TYPE_DEFAULT, "Read %lu bytes from NVRAM.", (uint8_t *)&v10, 0xCu);
    }

    v8 = LogCategory_NVRAM();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __15__SPNVRAM_read__block_invoke_cold_1(v6, v8);
    }
  }
  else
  {
    v8 = LogCategory_NVRAM();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1B2FD8000, v8, OS_LOG_TYPE_DEFAULT, "No key data received from NVRAM", (uint8_t *)&v10, 2u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (BOOL)write:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  dispatch_time_t v5 = LogCategory_NVRAM();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v3 length];
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = v6;
    _os_log_impl(&dword_1B2FD8000, v5, OS_LOG_TYPE_DEFAULT, "Writing %lu bytes to NVRAM.", buf, 0xCu);
  }

  id v7 = LogCategory_NVRAM();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = objc_msgSend(v3, "fm_hexString");
    +[SPNVRAM write:v7];
  }

  uint64_t v9 = [MEMORY[0x1E4F61A48] sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __17__SPNVRAM_write___block_invoke;
  v13[3] = &unk_1E601B5E8;
  v15 = &v16;
  int v10 = v4;
  uint64_t v14 = v10;
  [v9 storeOfflineFindingInfo:v3 completion:v13];

  dispatch_time_t v11 = dispatch_time(0, 30000000000);
  dispatch_group_wait(v10, v11);
  LOBYTE(v9) = *((unsigned char *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return (char)v9;
}

void __17__SPNVRAM_write___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v3)
  {
    *(unsigned char *)(v4 + 24) = 0;
    dispatch_time_t v5 = LogCategory_NVRAM();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __17__SPNVRAM_write___block_invoke_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(v4 + 24) = 1;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __16__SPNVRAM_clear__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FD8000, v0, v1, "clearOfflineFindingInfoWithCompletion error: %@", v2, v3, v4, v5, v6);
}

void __15__SPNVRAM_read__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a1, "fm_hexString");
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1B2FD8000, a2, OS_LOG_TYPE_DEBUG, "Read NVRAM data: %@", v4, 0xCu);
}

void __15__SPNVRAM_read__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FD8000, v0, v1, "fetchOfflineFindingInfoWithCompletion error: %@", v2, v3, v4, v5, v6);
}

+ (void)write:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1B2FD8000, log, OS_LOG_TYPE_DEBUG, "Writing NVRAM data: %@", buf, 0xCu);
}

void __17__SPNVRAM_write___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B2FD8000, v0, v1, "storeOfflineFindingInfo error: %@", v2, v3, v4, v5, v6);
}

@end