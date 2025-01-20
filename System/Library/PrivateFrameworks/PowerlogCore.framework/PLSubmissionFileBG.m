@interface PLSubmissionFileBG
- (BOOL)copyAndPrepareLog;
- (PLSubmissionFileBG)initWithConfig:(id)a3;
- (id)fileExtension;
- (id)fileType;
- (id)getBGSQLFile;
- (void)copyAndPrepareLog;
- (void)getBGSQLFile;
- (void)submit;
@end

@implementation PLSubmissionFileBG

- (PLSubmissionFileBG)initWithConfig:(id)a3
{
  id v4 = a3;
  if ([v4 submitBG]
    && ((v8.receiver = self,
         v8.super_class = (Class)PLSubmissionFileBG,
         v5 = [(PLSubmissionFile *)&v8 initWithConfig:v4],
         (self = v5) == 0)
     || [(PLSubmissionFileBG *)v5 copyAndPrepareLog]))
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
  return @"BackgroundProcessing";
}

- (id)fileExtension
{
  return @".bg.anon";
}

- (BOOL)copyAndPrepareLog
{
  v50[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PLSubmissionFile *)self filePath];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@".bg.anon" withString:&stru_1F15208F0];

  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [v5 fileExistsAtPath:v4];

  if (!v6)
  {
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v48 = 0;
    char v10 = [v9 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v48];
    v7 = v48;

    if ((v10 & 1) == 0)
    {
      v14 = PLLogSubmission();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissionFileBG copyAndPrepareLog].cold.8();
      }
      BOOL v8 = 0;
      goto LABEL_34;
    }
    v11 = +[PowerlogCore sharedCore];
    v12 = [v11 storage];
    [v12 blockingFlushCachesWithReason:@"BackgroundProcessing"];

    v13 = [(PLSubmissionFileBG *)self getBGSQLFile];
    v14 = [v4 stringByAppendingPathComponent:v13];

    v15 = [v14 stringByAppendingFormat:@".gz"];
    v16 = +[PPSCoreStorage sharedSQLStorage];
    v17 = [v16 BGSQLConnection];
    int v18 = [v17 copyDatabaseToPath:v14 fromDate:0 toDate:0 withTableFilters:0 vacuumDB:0];

    if (v18)
    {
      if (+[PLUtilities compressWithSource:v14 withDestination:v15 withLevel:4])
      {
        v19 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v19 removeItemAtPath:v14 error:0];

        v20 = [MEMORY[0x1E4F28CB8] defaultManager];
        v21 = [v14 stringByAppendingString:@"-wal"];
        [v20 removeItemAtPath:v21 error:0];

        v22 = [MEMORY[0x1E4F28CB8] defaultManager];
        v23 = [v14 stringByAppendingString:@"-shm"];
        [v22 removeItemAtPath:v23 error:0];

        v24 = [v4 stringByAppendingPathComponent:@"tag.json"];
        v25 = [MEMORY[0x1E4F1CA48] array];
        v26 = [v15 lastPathComponent];
        [v25 addObject:v26];

        v49 = @"LogFiles";
        v50[0] = v25;
        uint64_t v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
        if (!-[PLSubmissionFile createTagFileWithPath:withInfo:](self, "createTagFileWithPath:withInfo:", v24))
        {
          v27 = PLLogSubmission();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[PLSubmissionFileBG copyAndPrepareLog].cold.5();
          }
        }
        v28 = (void *)MEMORY[0x1E4F5F3C0];
        v29 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
        uint64_t v30 = [v28 archiveDirectoryAt:v29 deleteOriginal:1];

        v31 = (void *)v30;
        if (v30)
        {
          v43 = v15;
          v44 = v25;
          v32 = [MEMORY[0x1E4F28CB8] defaultManager];
          v42 = v31;
          v33 = [v31 path];
          v34 = [(PLSubmissionFile *)self filePath];
          v47 = v7;
          char v35 = [v32 moveItemAtPath:v33 toPath:v34 error:&v47];
          v45 = v47;

          if (v35)
          {
            [(PLSubmissionFile *)self decorateFile];
            v36 = PLLogSubmission();
            v25 = v44;
            v31 = v42;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
              -[PLSubmissionFileBG copyAndPrepareLog]();
            }

            v37 = [MEMORY[0x1E4F28CB8] defaultManager];
            v38 = [v42 path];
            [v37 removeItemAtPath:v38 error:0];

            BOOL v8 = 1;
            v15 = v43;
          }
          else
          {
            v37 = PLLogSubmission();
            v25 = v44;
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              -[PLSubmissionFileBG copyAndPrepareLog].cold.4(v37);
            }
            BOOL v8 = 0;
            v31 = v42;
            v15 = v43;
          }
          v40 = (void *)v46;
          v39 = v45;
        }
        else
        {
          v37 = PLLogSubmission();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            -[PLSubmissionFileBG copyAndPrepareLog](v37);
          }
          BOOL v8 = 0;
          v39 = v7;
          v40 = (void *)v46;
        }

        v7 = v39;
        goto LABEL_33;
      }
      v24 = PLLogSubmission();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissionFileBG copyAndPrepareLog].cold.6();
      }
    }
    else
    {
      v24 = PLLogSubmission();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissionFileBG copyAndPrepareLog].cold.7();
      }
    }
    BOOL v8 = 0;
LABEL_33:

LABEL_34:
    goto LABEL_35;
  }
  v7 = PLLogSubmission();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[PLSubmissionFileBG copyAndPrepareLog]();
  }
  BOOL v8 = 0;
LABEL_35:

  return v8;
}

- (id)getBGSQLFile
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
    char v10 = [(PLSubmissionFile *)self taskingConfig];
    uint64_t v11 = [v10 tagUUID];

    v9 = (void *)v11;
  }
  v12 = [NSString stringWithFormat:@"bgprocessing_%@.BGSQL", v9];
  v13 = PLLogSubmission();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[PLSubmissionFileBG getBGSQLFile]();
  }

  return v12;
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
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Directory %@ creation failed:%@");
}

- (void)getBGSQLFile
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_DEBUG, "Requested BackgroundProcessing DB file: %@", v1, 0xCu);
}

@end