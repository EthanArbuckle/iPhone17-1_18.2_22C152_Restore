@interface NSURL
@end

@implementation NSURL

void __79__NSURL_Sharing__coordinateReadingWithSaveToTempDir_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    if (*(unsigned char *)(a1 + 48))
    {
      v6 = [MEMORY[0x1E4F28CB8] defaultManager];
      v7 = [v4 lastPathComponent];
      v8 = [v6 temporaryDirectory];
      id v17 = 0;
      v9 = [v6 URLForDirectory:99 inDomain:1 appropriateForURL:v8 create:1 error:&v17];
      id v10 = v17;

      if (!v9)
      {
        v11 = utilities_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          __79__NSURL_Sharing__coordinateReadingWithSaveToTempDir_options_completionHandler___block_invoke_cold_2((uint64_t)v10, v11);
        }

        v9 = [v6 temporaryDirectory];
      }
      v12 = [v9 URLByAppendingPathComponent:v7];
      id v16 = v10;
      int v13 = [v6 copyItemAtURL:v4 toURL:v12 error:&v16];
      id v14 = v16;

      if (v13)
      {
        v5 = v12;
        v15 = v4;
      }
      else
      {
        v15 = utilities_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __79__NSURL_Sharing__coordinateReadingWithSaveToTempDir_options_completionHandler___block_invoke_cold_1((uint64_t)v4, (uint64_t)v14, v15);
        }
        v5 = v4;
      }
    }
  }
  else
  {
    v5 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __79__NSURL_Sharing__coordinateReadingWithSaveToTempDir_options_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A5389000, log, OS_LOG_TYPE_ERROR, "Failed to copy file %@ to temporary directory with error %@", (uint8_t *)&v3, 0x16u);
}

void __79__NSURL_Sharing__coordinateReadingWithSaveToTempDir_options_completionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "Failed to create a temporary directory with error: %@", (uint8_t *)&v2, 0xCu);
}

@end