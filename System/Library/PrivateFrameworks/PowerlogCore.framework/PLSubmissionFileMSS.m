@interface PLSubmissionFileMSS
- (BOOL)collectMSS;
- (BOOL)copyAndPrepareLog;
- (BOOL)flushMicrostackshots;
- (BOOL)generateMSS;
- (BOOL)packageDirectory:(id)a3 to:(id)a4;
- (PLSubmissionFileMSS)initWithConfig:(id)a3;
- (id)fileExtension;
- (id)fileType;
- (id)getFileList;
- (id)mssTextFilePath;
- (void)collectMSS;
- (void)copyAndPrepareLog;
- (void)generateMSS;
- (void)submit;
@end

@implementation PLSubmissionFileMSS

- (PLSubmissionFileMSS)initWithConfig:(id)a3
{
  id v4 = a3;
  if ([v4 submitMSS]
    && ((v8.receiver = self,
         v8.super_class = (Class)PLSubmissionFileMSS,
         v5 = [(PLSubmissionFile *)&v8 initWithConfig:v4],
         (self = v5) == 0)
     || [(PLSubmissionFileMSS *)v5 copyAndPrepareLog]))
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
  return @"Microstackshots";
}

- (id)fileExtension
{
  return @".mss.anon";
}

- (id)mssTextFilePath
{
  v2 = [(PLSubmissionFile *)self filePath];
  v3 = [v2 stringByReplacingOccurrencesOfString:@".mss.anon" withString:@".msstext.anon"];

  return v3;
}

- (BOOL)copyAndPrepareLog
{
  BOOL v3 = [(PLSubmissionFileMSS *)self flushMicrostackshots];
  id v4 = PLLogSubmission();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      -[PLSubmissionFileMSS copyAndPrepareLog]();
    }
  }
  else if (v5)
  {
    -[PLSubmissionFileMSS copyAndPrepareLog].cold.4();
  }

  v6 = [(PLSubmissionFile *)self directory];

  if (v6)
  {
    v7 = [(PLSubmissionFile *)self directory];
    +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:v7];
  }
  BOOL v8 = [(PLSubmissionFileMSS *)self collectMSS];
  v9 = PLLogSubmission();
  v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PLSubmissionFileMSS copyAndPrepareLog]();
    }
    goto LABEL_18;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_DEFAULT, "Successfully collected binary MSS", buf, 2u);
  }

  if (_os_feature_enabled_impl())
  {
    v11 = [(PLSubmissionFile *)self taskingConfig];
    int v12 = [v11 submitReasonType];

    if (v12 != 2)
    {
      BOOL v13 = [(PLSubmissionFileMSS *)self generateMSS];
      v14 = PLLogSubmission();
      v10 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_DEFAULT, "Successfully generated text MSS", v16, 2u);
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[PLSubmissionFileMSS copyAndPrepareLog]();
      }
LABEL_18:
    }
  }
  return v8;
}

- (BOOL)collectMSS
{
  BOOL v3 = [(PLSubmissionFile *)self filePath];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@".mss.anon" withString:&stru_1F15208F0];

  BOOL v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [v5 fileExistsAtPath:v4];

  if (!v6)
  {
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v40 = 0;
    char v10 = [v9 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v40];
    v7 = v40;

    if (v10)
    {
      v11 = [(PLSubmissionFileMSS *)self getFileList];
      int v12 = [v11 mutableCopy];

      if (v12 && [v12 count])
      {
        *(void *)v36 = 0;
        v37 = v36;
        uint64_t v38 = 0x2020000000;
        char v39 = 0;
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __33__PLSubmissionFileMSS_collectMSS__block_invoke;
        v33[3] = &unk_1E6255D08;
        id v13 = v4;
        id v34 = v13;
        v35 = v36;
        [v12 enumerateObjectsUsingBlock:v33];
        if (v37[24])
        {
          v14 = PLLogSubmission();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFileMSS collectMSS].cold.5();
          }

          id v15 = objc_alloc(MEMORY[0x1E4F1CB10]);
          v16 = [NSString stringWithFormat:@"%@/microstackshots", v13];
          v17 = [v15 initFileURLWithPath:v16];

          id v18 = [v17 path];
          int v19 = open((const char *)[v18 UTF8String], 3585, 432);

          if (v19 != -1)
          {
            v20 = [(PLSubmissionFile *)self taskingConfig];
            v21 = [v20 startDate];
            v22 = [v21 convertFromMonotonicToSystem];

            xpc_object_t empty = xpc_dictionary_create_empty();
            [v22 timeIntervalSince1970];
            xpc_dictionary_set_uint64(empty, "time", (unint64_t)v24);
            if (!systemstats_copy_microstackshots_to_file())
            {
              v25 = [v17 lastPathComponent];
              [v12 addObject:v25];
            }
            close(v19);
          }
          v26 = [MEMORY[0x1E4F1CA60] dictionary];
          [v26 setObject:v12 forKeyedSubscript:@"LogFiles"];
          [v26 setObject:MEMORY[0x1E4F1CBF0] forKeyedSubscript:@"DscsymFiles"];
          v27 = [NSString stringWithFormat:@"%@/%@", v13, @"tag.json"];
          if ([(PLSubmissionFile *)self createTagFileWithPath:v27 withInfo:v26])
          {
            v28 = [(PLSubmissionFile *)self filePath];
            BOOL v8 = [(PLSubmissionFileMSS *)self packageDirectory:v13 to:v28];
            if (v8)
            {
              v29 = PLLogSubmission();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BBD2F000, v29, OS_LOG_TYPE_DEFAULT, "Packaged binary MSS", buf, 2u);
              }
            }
            else
            {
              v29 = PLLogSubmission();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
                -[PLSubmissionFileMSS collectMSS]();
              }
            }
          }
          else
          {
            v28 = PLLogSubmission();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
              -[PLSubmissionFileMSS collectMSS].cold.4();
            }
            BOOL v8 = 0;
          }
        }
        else
        {
          v17 = PLLogSubmission();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFileMSS collectMSS]();
          }
          BOOL v8 = 0;
        }

        _Block_object_dispose(v36, 8);
        goto LABEL_25;
      }
      v30 = PLLogSubmission();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v36 = 0;
        _os_log_impl(&dword_1BBD2F000, v30, OS_LOG_TYPE_INFO, "No MSS files found", v36, 2u);
      }
    }
    else
    {
      int v12 = PLLogSubmission();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissionFileMSS collectMSS].cold.6();
      }
    }
    BOOL v8 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v7 = PLLogSubmission();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PLSubmissionFileMSS collectMSS]();
  }
  BOOL v8 = 0;
LABEL_26:

  return v8;
}

void __33__PLSubmissionFileMSS_collectMSS__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = NSString;
  id v4 = a2;
  id v8 = [v3 stringWithFormat:@"%@/%@", @"/var/db/systemstats", v4];
  BOOL v5 = [NSString stringWithFormat:@"%@/%@", *(void *)(a1 + 32), v4];

  int v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v7 = [v6 copyItemAtPath:v8 toPath:v5 error:0];

  if (v7) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)generateMSS
{
  BOOL v3 = [(PLSubmissionFile *)self filePath];
  id v4 = [v3 stringByReplacingOccurrencesOfString:@".mss.anon" withString:@"-text"];

  BOOL v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    int v7 = PLLogSubmission();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFileMSS collectMSS]();
    }
    BOOL v8 = 0;
  }
  else
  {
    v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v46 = 0;
    char v10 = [v9 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v46];
    int v7 = v46;

    if (v10)
    {
      v11 = [v4 stringByAppendingPathComponent:@"text-microstackshots.txt"];
      int v12 = [(PLSubmissionFile *)self taskingConfig];
      id v13 = [v12 startDate];
      v14 = [v13 convertFromMonotonicToSystem];

      id v15 = [(PLSubmissionFile *)self taskingConfig];
      v16 = [v15 endDate];
      v17 = [v16 convertFromMonotonicToSystem];

      id v18 = PLLogSubmission();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFileMSS generateMSS].cold.5();
      }

      int v19 = objc_alloc_init(SignpostReaderHelper);
      v20 = [(SignpostReaderHelper *)v19 generateTaskingMSSWithStartDate:v14 endDate:v17 atPath:v11];
      v21 = v20;
      if (v20)
      {
        uint64_t v38 = v17;
        char v39 = v14;
        uint64_t v41 = MEMORY[0x1E4F143A8];
        uint64_t v42 = 3221225472;
        v43 = __34__PLSubmissionFileMSS_generateMSS__block_invoke;
        v44 = &unk_1E6254470;
        v45 = v20;
        AnalyticsSendEventLazy();
        v22 = [MEMORY[0x1E4F1CA60] dictionary];
        v23 = NSNumber;
        +[PLUtilities getLastSystemTimeOffset];
        double v24 = objc_msgSend(v23, "numberWithDouble:");
        [v22 setObject:v24 forKeyedSubscript:@"LastSystemOffset"];

        v25 = [NSString stringWithFormat:@"%@/%@", v4, @"tag.json"];
        if ([(PLSubmissionFile *)self createTagFileWithPath:v25 withInfo:v22])
        {
          v26 = [(PLSubmissionFileMSS *)self mssTextFilePath];
          BOOL v8 = [(PLSubmissionFileMSS *)self packageDirectory:v4 to:v26];
          v27 = PLLogSubmission();
          v28 = v27;
          if (v8)
          {
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BBD2F000, v28, OS_LOG_TYPE_DEFAULT, "Packaged text MSS", buf, 2u);
            }
          }
          else if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            -[PLSubmissionFileMSS generateMSS]();
          }
        }
        else
        {
          v26 = PLLogSubmission();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            -[PLSubmissionFileMSS collectMSS].cold.4();
          }
          BOOL v8 = 0;
        }

        v29 = v45;
        v17 = v38;
        v14 = v39;
      }
      else
      {
        v29 = PLLogSubmission();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          [(PLSubmissionFileMSS *)v29 generateMSS];
        }
        BOOL v8 = 0;
      }
    }
    else
    {
      v11 = PLLogSubmission();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissionFileMSS collectMSS].cold.6();
      }
      BOOL v8 = 0;
    }
  }
  return v8;
}

id __34__PLSubmissionFileMSS_generateMSS__block_invoke(uint64_t a1)
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"sample_count"];
  BOOL v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"time_printing"];
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"time_processing"];
  uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"time_reading"];
  int v6 = (void *)v5;
  int v7 = &unk_1F1584A58;
  if (v4) {
    BOOL v8 = v4;
  }
  else {
    BOOL v8 = &unk_1F1584A58;
  }
  v13[0] = @"ProcessingTime";
  v13[1] = @"PrintingTime";
  if (v3) {
    v9 = v3;
  }
  else {
    v9 = &unk_1F1584A58;
  }
  v14[0] = v8;
  v14[1] = v9;
  v13[2] = @"ReadingTime";
  v13[3] = @"SampleCount";
  if (v5) {
    char v10 = (void *)v5;
  }
  else {
    char v10 = &unk_1F1584A58;
  }
  if (v2) {
    int v7 = v2;
  }
  v14[2] = v10;
  v14[3] = v7;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

- (BOOL)packageDirectory:(id)a3 to:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = PLLogSubmission();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412290;
    id v20 = v6;
    _os_log_impl(&dword_1BBD2F000, v8, OS_LOG_TYPE_INFO, "Packaging directory %@", (uint8_t *)&v19, 0xCu);
  }

  v9 = (void *)MEMORY[0x1E4F5F3C0];
  char v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
  v11 = [v9 archiveDirectoryAt:v10 deleteOriginal:1];

  if (!v11) {
    goto LABEL_7;
  }
  int v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = [v11 path];
  int v14 = [v12 moveItemAtPath:v13 toPath:v7 error:0];

  if (!v14)
  {
    v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    v17 = [v11 path];
    [v16 removeItemAtPath:v17 error:0];

LABEL_7:
    BOOL v15 = 0;
    goto LABEL_8;
  }
  [(PLSubmissionFile *)self decorateFile];
  BOOL v15 = 1;
LABEL_8:

  return v15;
}

- (BOOL)flushMicrostackshots
{
  v2 = dispatch_semaphore_create(0);
  BOOL v4 = 0;
  if (systemstats_microstackshot_checkpoint_async())
  {
    dispatch_time_t v3 = dispatch_time(0, 10000000000);
    if (!dispatch_semaphore_wait(v2, v3)) {
      BOOL v4 = 1;
    }
  }

  return v4;
}

intptr_t __43__PLSubmissionFileMSS_flushMicrostackshots__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getFileList
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v2 = [(PLSubmissionFile *)self taskingConfig];
  dispatch_time_t v3 = [v2 startDate];
  uint64_t v36 = [v3 convertFromMonotonicToSystem];

  BOOL v4 = [v2 endDate];
  v37 = [v4 convertFromMonotonicToSystem];

  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [v5 contentsOfDirectoryAtPath:@"/var/db/systemstats" error:0];

  if ([v6 count])
  {
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v56 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v30 = v6;
      uint64_t v31 = v2;
      uint64_t v33 = 0;
      uint64_t v35 = 0;
      id obj = v7;
      uint64_t v39 = *(void *)v41;
      uint64_t v10 = *MEMORY[0x1E4F28310];
      char v34 = 1;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v41 != v39) {
            objc_enumerationMutation(obj);
          }
          int v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          id v13 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", @"/var/db/systemstats", v12];
          int v14 = [MEMORY[0x1E4F28CB8] defaultManager];
          BOOL v15 = [v14 attributesOfItemAtPath:v13 error:0];

          v16 = [v15 objectForKey:v10];
          v17 = [v12 componentsSeparatedByString:@"."];
          if ([v17 count] == 4)
          {
            id v18 = [v17 objectAtIndexedSubscript:1];
            int v19 = [v18 isEqualToString:@"microstackshots"];

            if (v19)
            {
              if ([v36 compare:v16] != -1 || objc_msgSend(v37, "compare:", v16) == -1)
              {
                if ([v37 compare:v16] == -1 && (!v35 || objc_msgSend(v35, "compare:", v16) == 1))
                {
                  id v20 = v16;

                  id v21 = v12;
                  uint64_t v33 = v21;
                  uint64_t v35 = v20;
                }
              }
              else
              {
                [v32 addObject:v12];
                v34 &= [v37 compare:v16] != 0;
              }
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v56 count:16];
      }
      while (v9);

      v22 = v33;
      if ((v34 & (v33 != 0)) == 1) {
        [v32 addObject:v33];
      }
      id v6 = v30;
      v2 = v31;
      v23 = v35;
    }
    else
    {

      v23 = 0;
      v22 = 0;
    }
    v25 = PLLogSubmission();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v27 = [v2 startDate];
      v28 = [v2 endDate];
      int v29 = [v32 count];
      *(_DWORD *)buf = 138413570;
      v45 = v36;
      __int16 v46 = 2112;
      v47 = v27;
      __int16 v48 = 2112;
      v49 = v37;
      __int16 v50 = 2112;
      v51 = v28;
      __int16 v52 = 1024;
      int v53 = v29;
      __int16 v54 = 2112;
      id v55 = v32;
      _os_log_debug_impl(&dword_1BBD2F000, v25, OS_LOG_TYPE_DEBUG, "Microstackshots files from %@(%@) to %@(%@): %d files found (%@)\n", buf, 0x3Au);
    }
    id v24 = v32;
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (void)submit
{
  if ([(PLSubmissionFile *)self iCloudUploadEnabled])
  {
    dispatch_time_t v3 = [(PLSubmissionFile *)self filePath];
    [(PLSubmissionFile *)self submitLogToiCloud:v3 WithCompress:0];

    if (_os_feature_enabled_impl())
    {
      BOOL v4 = [(PLSubmissionFile *)self taskingConfig];
      int v5 = [v4 submitReasonType];

      if (v5 != 2)
      {
        id v6 = [(PLSubmissionFileMSS *)self mssTextFilePath];
        [(PLSubmissionFile *)self submitLogToiCloud:v6 WithCompress:0];
      }
    }
  }
  id v7 = [(PLSubmissionFile *)self taskingConfig];
  char v8 = [v7 isDRTasking];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [(PLSubmissionFile *)self submitLogToDAWithBugType:@"220"];
    [(PLSubmissionFile *)self logSubmissionResultToCAWithErrorType:v9 withFileType:@"microstackshot" withOverrideKeys:0];
  }
}

- (void)copyAndPrepareLog
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1BBD2F000, v0, v1, "Flushing microstackshots timed out.", v2, v3, v4, v5, v6);
}

- (void)collectMSS
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Directory %@ creation failed: %@");
}

- (void)generateMSS
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_DEBUG, "Generating MSS with start date %@ and end date %@", v1, 0x16u);
}

@end