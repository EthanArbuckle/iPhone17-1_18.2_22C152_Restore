@interface PPSSubmissionUtilities
+ (BOOL)submit:(id)a3;
+ (id)taskingTables;
@end

@implementation PPSSubmissionUtilities

+ (BOOL)submit:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isValid])
  {
    v4 = [v3 issueCategory];
    v5 = [v3 issueDescription];
    v6 = [v3 fileType];
    v7 = [v3 filePath];
    v8 = [v7 path];
    v9 = [v3 targetContainer];
    v10 = [v3 recordType];
    [v3 contextDictionary];
    v21 = uint64_t v23 = 0;
    char v11 = DRSubmitLogToCKContainer();
    id v22 = 0;

    v12 = PLLogSubmission();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v14 = objc_msgSend(v3, "issueCategory", v10, @"asset", v21, &v23);
        *(_DWORD *)buf = 138412802;
        v25 = @"com.apple.perfpowerservices";
        __int16 v26 = 2112;
        v27 = v14;
        __int16 v28 = 2112;
        id v29 = v3;
        _os_log_impl(&dword_1BBD2F000, v13, OS_LOG_TYPE_INFO, "Submitted record for '%@:%@'  to DiagnosticPipeline: %@", buf, 0x20u);
      }
      if (![v3 isExpedited])
      {
        BOOL v18 = 1;
        v19 = v22;
LABEL_19:

        goto LABEL_20;
      }
      char v15 = _DRCTriggerCloudKitWork();
      v13 = 0;
      v16 = PLLogSubmission();
      v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBD2F000, v17, OS_LOG_TYPE_INFO, "Successfully triggered DiagnosticPipeline upload session", buf, 2u);
        }

        BOOL v18 = 1;
        goto LABEL_18;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[PPSSubmissionUtilities submit:](v13, v17);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      +[PPSSubmissionUtilities submit:](v3, v13);
    }
    BOOL v18 = 0;
LABEL_18:
    v19 = v22;

    goto LABEL_19;
  }
  BOOL v18 = 0;
LABEL_20:

  return v18;
}

+ (id)taskingTables
{
  if (!+[PLDefaults taskMode]) {
    goto LABEL_5;
  }
  if (taskingTables_onceToken != -1) {
    dispatch_once(&taskingTables_onceToken, &__block_literal_global_37);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    id v2 = 0;
  }
  else {
LABEL_5:
  }
    id v2 = (id)taskingTables_result;
  return v2;
}

void __39__PPSSubmissionUtilities_taskingTables__block_invoke()
{
  uint64_t v0 = +[PLDefaults objectForKey:@"PPSTaskingTables" ifNotSet:0];
  v1 = (void *)taskingTables_result;
  taskingTables_result = v0;

  if (+[PLDefaults debugEnabled])
  {
    id v2 = PLLogSubmission();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __39__PPSSubmissionUtilities_taskingTables__block_invoke_cold_1(v2);
    }
  }
}

+ (void)submit:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 localizedDescription];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "Failed to trigger DiagnosticPipeline upload session with error '%@'", (uint8_t *)&v4, 0xCu);
}

+ (void)submit:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = [a1 issueCategory];
  int v5 = 138412802;
  uint64_t v6 = @"com.apple.perfpowerservices";
  __int16 v7 = 2112;
  v8 = v4;
  __int16 v9 = 2112;
  v10 = a1;
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "Failed to submit record for '%@:%@' to DiagnosticPipeline: %@", (uint8_t *)&v5, 0x20u);
}

void __39__PPSSubmissionUtilities_taskingTables__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = taskingTables_result;
  _os_log_debug_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_DEBUG, "PPSTaskingTables=%@", (uint8_t *)&v1, 0xCu);
}

@end