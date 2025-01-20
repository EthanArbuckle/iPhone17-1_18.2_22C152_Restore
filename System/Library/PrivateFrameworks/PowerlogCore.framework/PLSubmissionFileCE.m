@interface PLSubmissionFileCE
- (BOOL)copyAndPrepareLog;
- (BOOL)performCopyTablesToDB:(id)a3;
- (PLSubmissionFileCE)initWithConfig:(id)a3;
- (id)fileExtension;
- (id)fileType;
- (id)getCESQLFile;
- (id)tablesToMigrateForCE;
- (void)copyAndPrepareLog;
- (void)getCESQLFile;
- (void)submit;
@end

@implementation PLSubmissionFileCE

- (PLSubmissionFileCE)initWithConfig:(id)a3
{
  id v4 = a3;
  if ([v4 submitCE]
    && ((v8.receiver = self,
         v8.super_class = (Class)PLSubmissionFileCE,
         v5 = [(PLSubmissionFile *)&v8 initWithConfig:v4],
         (self = v5) == 0)
     || [(PLSubmissionFileCE *)v5 copyAndPrepareLog]))
  {
    self = self;
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)fileType
{
  return @"CleanEnergyLogs";
}

- (id)fileExtension
{
  return @".ce.anon";
}

- (BOOL)copyAndPrepareLog
{
  v49[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PLSubmissionFile *)self filePath];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@".ce.anon" withString:&stru_1F15208F0];

  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [v5 fileExistsAtPath:v4];

  if (!v6)
  {
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v47 = 0;
    int v10 = [v9 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v47];
    v7 = v47;

    if ((v10 & 1) == 0)
    {
      v12 = PLLogSubmission();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissionFileBG copyAndPrepareLog].cold.8();
      }
      BOOL v8 = 0;
      goto LABEL_36;
    }
    v11 = [(PLSubmissionFileCE *)self getCESQLFile];
    v12 = [v4 stringByAppendingPathComponent:v11];

    v13 = [v12 stringByAppendingFormat:@".gz"];
    v14 = +[PPSCoreStorage sharedSQLStorage];
    v15 = [v14 CESQLConnection];

    v45 = v15;
    if ([v15 copyDatabaseToPath:v12 fromDate:0 toDate:0 withTableFilters:0 vacuumDB:0])
    {
      if (_os_feature_enabled_impl()
        && ![(PLSubmissionFileCE *)self performCopyTablesToDB:v12])
      {
        v16 = PLLogSubmission();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[PLSubmissionFileCE copyAndPrepareLog].cold.6();
        }
      }
      if (!+[PLUtilities compressWithSource:v12 withDestination:v13 withLevel:4])
      {
        v17 = PLLogSubmission();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[PLSubmissionFileBG copyAndPrepareLog].cold.6();
        }
      }
      v18 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v18 removeItemAtPath:v12 error:0];

      v19 = [MEMORY[0x1E4F28CB8] defaultManager];
      v20 = [v12 stringByAppendingString:@"-wal"];
      [v19 removeItemAtPath:v20 error:0];

      v21 = [MEMORY[0x1E4F28CB8] defaultManager];
      v22 = [v12 stringByAppendingString:@"-shm"];
      [v21 removeItemAtPath:v22 error:0];
    }
    else
    {
      v21 = PLLogSubmission();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissionFileCE copyAndPrepareLog].cold.7();
      }
    }

    uint64_t v23 = [v4 stringByAppendingPathComponent:@"tag.json"];
    v24 = [MEMORY[0x1E4F1CA48] array];
    v25 = [v13 lastPathComponent];
    [v24 addObject:v25];

    v48 = @"LogFiles";
    v49[0] = v24;
    v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
    if (!-[PLSubmissionFile createTagFileWithPath:withInfo:](self, "createTagFileWithPath:withInfo:", v23))
    {
      v26 = PLLogSubmission();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissionFileBG copyAndPrepareLog].cold.5();
      }
    }
    v44 = (void *)v23;
    v27 = (void *)MEMORY[0x1E4F5F3C0];
    v28 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
    v29 = [v27 archiveDirectoryAt:v28 deleteOriginal:1];

    if (v29)
    {
      v41 = v24;
      v42 = v13;
      v30 = [MEMORY[0x1E4F28CB8] defaultManager];
      v31 = [v29 path];
      v32 = [(PLSubmissionFile *)self filePath];
      v46 = v7;
      int v33 = [v30 moveItemAtPath:v31 toPath:v32 error:&v46];
      v34 = v46;

      if (v33)
      {
        [(PLSubmissionFile *)self decorateFile];
        BOOL v8 = 1;
        v35 = v44;
        v7 = v34;
        v24 = v41;
        v13 = v42;
LABEL_35:

LABEL_36:
        goto LABEL_37;
      }
      v36 = PLLogSubmission();
      v7 = v34;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissionFileCE copyAndPrepareLog]();
      }

      v37 = [MEMORY[0x1E4F28CB8] defaultManager];
      v38 = [v29 path];
      [v37 removeItemAtPath:v38 error:0];

      v24 = v41;
      v13 = v42;
    }
    v39 = PLLogSubmission();
    v35 = v44;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[PLSubmissionFileCE copyAndPrepareLog](v39);
    }

    BOOL v8 = 0;
    goto LABEL_35;
  }
  v7 = PLLogSubmission();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[PLSubmissionFileBG copyAndPrepareLog]();
  }
  BOOL v8 = 0;
LABEL_37:

  return v8;
}

- (id)getCESQLFile
{
  v3 = [(PLSubmissionFile *)self taskingConfig];
  id v4 = [v3 startDate];
  v5 = [v4 convertFromMonotonicToSystem];

  int v6 = [(PLSubmissionFile *)self taskingConfig];
  v7 = [v6 endDate];
  BOOL v8 = [v7 convertFromMonotonicToSystem];

  v9 = [MEMORY[0x1E4F1C9C8] filenameDateStringWithStartDate:v5 endDate:v8];
  if (![v9 length])
  {
    int v10 = [(PLSubmissionFile *)self taskingConfig];
    uint64_t v11 = [v10 tagUUID];

    v9 = (void *)v11;
  }
  v12 = [NSString stringWithFormat:@"cleanenergy_%@.CESQL", v9];
  v13 = PLLogSubmission();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[PLSubmissionFileCE getCESQLFile]();
  }

  return v12;
}

- (id)tablesToMigrateForCE
{
  return &unk_1F1585B20;
}

- (BOOL)performCopyTablesToDB:(id)a3
{
  id v4 = a3;
  v5 = [(PLSubmissionFileCE *)self tablesToMigrateForCE];
  int v6 = [[PLSQLiteConnection alloc] initWithFilePath:v4];

  v7 = +[PowerlogCore sharedCore];
  BOOL v8 = [v7 storage];
  v9 = [v8 connection];

  int v10 = [v9 filePath];
  uint64_t v11 = [v10 lastPathComponent];
  v12 = [v11 stringByDeletingPathExtension];

  v13 = [v9 filePath];
  BOOL v14 = [(PLSQLiteConnection *)v6 attachDB:v13 withName:v12];

  if (v14)
  {
    v15 = [MEMORY[0x1E4F29128] UUID];
    v16 = [v15 UUIDString];

    v17 = PLLogSubmission();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFileCE performCopyTablesToDB:]();
    }

    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __44__PLSubmissionFileCE_performCopyTablesToDB___block_invoke;
    v26 = &unk_1E6254948;
    v27 = self;
    v18 = v16;
    v28 = v18;
    v19 = v6;
    v29 = v19;
    id v30 = v9;
    [v5 enumerateObjectsUsingBlock:&v23];
    v20 = PLLogSubmission();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFileCE performCopyTablesToDB:]();
    }

    if (!-[PLSQLiteConnection detachDB:](v19, "detachDB:", v12, v23, v24, v25, v26, v27))
    {
      v21 = PLLogSubmission();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissionFileCE performCopyTablesToDB:]();
      }
    }
    [(PLSQLiteConnection *)v19 closeConnection];
  }
  else
  {
    v18 = PLLogSubmission();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      [(PLSubmissionFileCE *)v9 performCopyTablesToDB:v18];
    }
  }

  return v14;
}

void __44__PLSubmissionFileCE_performCopyTablesToDB___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  context = (void *)MEMORY[0x1C1869120]();
  id v4 = +[PLEntryDefinition configsForEntryKey:v3];
  v5 = [*(id *)(a1 + 32) taskingConfig];
  int v6 = [v5 startDate];

  v7 = [*(id *)(a1 + 32) taskingConfig];
  BOOL v8 = [v7 endDate];

  v9 = [v4 objectForKeyedSubscript:@"TrimConditionsTemplate"];
  int v10 = [v9 isEqual:&unk_1F1580930];

  if (v10)
  {
    uint64_t v11 = [v4 objectForKeyedSubscript:@"TrimConditionsTemplateArg"];
    [v11 doubleValue];
    double v13 = v12;

    BOOL v14 = [v8 dateByAddingTimeInterval:-v13];

    v15 = PLLogSubmission();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v31 = v3;
      __int16 v32 = 2048;
      double v33 = v13;
      __int16 v34 = 2112;
      v35 = v14;
      __int16 v36 = 2112;
      v37 = v8;
      _os_log_impl(&dword_1BBD2F000, v15, OS_LOG_TYPE_INFO, "'%@' has %f seconds to live, modified range: [%@, %@]", buf, 0x2Au);
    }
  }
  else
  {
    BOOL v14 = v6;
  }
  v16 = [MEMORY[0x1E4F1CA60] dictionary];
  v17 = NSString;
  [v14 timeIntervalSince1970];
  uint64_t v19 = v18;
  [v8 timeIntervalSince1970];
  v21 = objc_msgSend(v17, "stringWithFormat:", @"timestamp BETWEEN %f AND %f", v19, v20);
  v29 = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
  [v16 setObject:v22 forKeyedSubscript:@"WHERE"];

  if (+[PLDefaults BOOLForKey:@"PLDebugService_Enabled" ifNotSet:0])
  {
    [v16 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"uuid"];
  }
  uint64_t v24 = *(void **)(a1 + 48);
  uint64_t v23 = *(void **)(a1 + 56);
  v25 = [v23 filePath];
  v26 = [v25 lastPathComponent];
  v27 = [v26 stringByDeletingPathExtension];
  [v24 copyTable:v3 fromConnection:v23 withDBName:v27 withProperties:v16 andAttach:0];
}

- (void)submit
{
  if ([(PLSubmissionFile *)self iCloudUploadEnabled])
  {
    [(PLSubmissionFile *)self submitLogToiCloudWithCompress:0];
  }
}

- (void)copyAndPrepareLog
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "Failed to copy bdc epsql file to %@", v2, v3, v4, v5, v6);
}

- (void)getCESQLFile
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "Requested CleanEnergy DB file: %@", v2, v3, v4, v5, v6);
}

- (void)performCopyTablesToDB:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "Failed to detach DB at '%@'", v2, v3, v4, v5, v6);
}

- (void)performCopyTablesToDB:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "ending 'copyTables' with UUID %@", v2, v3, v4, v5, v6);
}

- (void)performCopyTablesToDB:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "starting 'copyTables' with UUID %@", v2, v3, v4, v5, v6);
}

- (void)performCopyTablesToDB:(NSObject *)a3 .cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 filePath];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1BBD2F000, a3, OS_LOG_TYPE_ERROR, "Failed to attach DB at '%@' as '%@'", (uint8_t *)&v6, 0x16u);
}

@end