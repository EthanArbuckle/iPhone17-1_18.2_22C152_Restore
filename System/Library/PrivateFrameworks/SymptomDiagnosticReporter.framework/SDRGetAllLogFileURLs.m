@interface SDRGetAllLogFileURLs
@end

@implementation SDRGetAllLogFileURLs

void ___SDRGetAllLogFileURLs_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    *(_DWORD *)buf = 134217984;
    uint64_t v22 = [v3 count];
    _os_log_impl(&dword_210A0E000, v5, OS_LOG_TYPE_INFO, "SDRDiagnosticReporter - retrieved configuration dictionary with %ld contents", buf, 0xCu);
  }
  if (v3)
  {
    v6 = [v3 objectForKeyedSubscript:@"logArchivePath"];
  }
  else
  {
    v6 = 0;
  }
  if ([v6 length])
  {
    v7 = [NSURL fileURLWithPath:v6];
    if (v7)
    {
      v8 = [MEMORY[0x263F08850] defaultManager];
      uint64_t v20 = *MEMORY[0x263EFFFB8];
      v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
      id v19 = 0;
      uint64_t v10 = [v8 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:v9 options:0 error:&v19];
      id v11 = v19;
      id v12 = v19;
      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v10;

      v15 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        v17 = v15;
        uint64_t v18 = [v16 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v22 = v18;
        _os_log_impl(&dword_210A0E000, v17, OS_LOG_TYPE_INFO, "SDRDiagnosticReporter - finished enumeration with %ld entries", buf, 0xCu);
      }
      if (v12)
      {
        if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEBUG)) {
          ___SDRGetAllLogFileURLs_block_invoke_cold_1();
        }
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v11);
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void ___SDRGetAllLogFileURLs_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_210A0E000, v0, v1, "SDRDiagnosticReporter - encountered error: %@", v2, v3, v4, v5, v6);
}

@end