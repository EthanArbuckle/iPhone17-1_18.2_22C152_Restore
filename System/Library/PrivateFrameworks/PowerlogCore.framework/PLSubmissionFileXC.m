@interface PLSubmissionFileXC
- (BOOL)copyAndPrepareLog;
- (BOOL)copyDatabaseToPath:(id)a3;
- (PLSubmissionFileXC)initWithConfig:(id)a3;
- (double)randomizedBaseOffset;
- (double)xcodeVersionFromUserActions;
- (id)fileExtension;
- (id)fileType;
- (id)getXCSQLFile;
- (int)userActionCountForConnection:(id)a3;
- (void)copyAndPrepareLog;
- (void)getXCSQLFile;
- (void)obfuscateTimestampsForTable:(id)a3 connection:(id)a4 withOffset:(double)a5;
- (void)randomizedBaseOffset;
- (void)submit;
- (void)xcodeVersionFromUserActions;
@end

@implementation PLSubmissionFileXC

- (PLSubmissionFileXC)initWithConfig:(id)a3
{
  return 0;
}

- (id)fileType
{
  return @"XcodeOrganizer";
}

- (id)fileExtension
{
  return @".xc.anon";
}

- (BOOL)copyDatabaseToPath:(id)a3
{
  id v3 = a3;
  v4 = (void *)MEMORY[0x1C1869120]();
  v5 = +[PPSCoreStorage sharedSQLStorage];
  v6 = [v5 XCSQLConnection];
  int v7 = [v6 copyDatabaseToPath:v3];

  if (v7)
  {
    v8 = [[PLSQLiteConnection alloc] initWithFilePath:v3];
    [(PLSQLiteConnection *)v8 setJournalMode:9];
    [(PLSQLiteConnection *)v8 closeConnection];
  }

  return v7;
}

- (BOOL)copyAndPrepareLog
{
  v84[6] = *MEMORY[0x1E4F143B8];
  id v3 = [(PLSubmissionFile *)self taskingConfig];
  if ([v3 submitReasonType] == 1)
  {
    v4 = [(PLSubmissionFile *)self taskingConfig];
    int v5 = [v4 conditionCheckForXcodeUserActions];

    if (!v5) {
      return 0;
    }
  }
  else
  {
  }
  int v7 = [(PLSubmissionFile *)self filePath];
  v8 = [v7 stringByReplacingOccurrencesOfString:@".xc.anon" withString:&stru_1F15208F0];

  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v10 = [v9 fileExistsAtPath:v8];

  if (v10)
  {
    v11 = PLLogSubmission();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PLSubmissionFileBG copyAndPrepareLog]();
    }
    BOOL v6 = 0;
  }
  else
  {
    v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v80 = 0;
    char v13 = [v12 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v80];
    v11 = v80;

    if (v13)
    {
      v14 = [(PLSubmissionFile *)self taskingConfig];
      int v15 = [v14 submitReasonType];

      if (v15 != 1)
      {
        v16 = +[PowerlogCore sharedCore];
        v17 = [v16 storage];
        [v17 blockingFlushCachesWithReason:@"XcodeOrganizer"];
      }
      v18 = [(PLSubmissionFileXC *)self getXCSQLFile];
      v19 = [v8 stringByAppendingPathComponent:v18];

      v20 = [v19 stringByAppendingFormat:@".gz"];
      if ([(PLSubmissionFileXC *)self copyDatabaseToPath:v19])
      {
        v65 = v11;
        v21 = [[PLSQLiteConnection alloc] initWithFilePath:v19];
        [(PLSubmissionFileXC *)self randomizedBaseOffset];
        double v23 = v22;
        -[PLSubmissionFileXC obfuscateTimestampsForTable:connection:withOffset:](self, "obfuscateTimestampsForTable:connection:withOffset:", @"XcodeMetrics_TimeOffset_365_4", v21);
        [(PLSubmissionFileXC *)self obfuscateTimestampsForTable:@"XcodeMetrics_UserAction_365_4" connection:v21 withOffset:v23];
        [(PLSQLiteConnection *)v21 fullVacuum];
        uint64_t v24 = [(PLSubmissionFileXC *)self userActionCountForConnection:v21];
        v83[0] = @"has_user_actions";
        v76 = [NSNumber numberWithBool:(int)v24 > 0];
        v84[0] = v76;
        v84[1] = &unk_1F1584980;
        v83[1] = @"preparation_stage";
        v83[2] = @"user_action_row_count";
        unsigned int v64 = v24;
        v75 = [NSNumber numberWithInt:v24];
        v84[2] = v75;
        v83[3] = @"xcsql_size";
        v25 = NSNumber;
        v73 = +[PPSCoreStorage sharedSQLStorage];
        v72 = [v73 XCSQLConnection];
        v71 = [v72 filePath];
        v70 = objc_msgSend(v25, "numberWithLongLong:", +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v71));
        v84[3] = v70;
        v83[4] = @"shm_size";
        v26 = NSNumber;
        v77 = v19;
        v69 = +[PPSCoreStorage sharedSQLStorage];
        v68 = [v69 XCSQLConnection];
        v67 = [v68 filePath];
        v66 = [v67 stringByAppendingString:@"-shm"];
        v27 = objc_msgSend(v26, "numberWithLongLong:", +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v66));
        v84[4] = v27;
        v83[5] = @"wal_size";
        v28 = NSNumber;
        v78 = v20;
        v29 = +[PPSCoreStorage sharedSQLStorage];
        v30 = [v29 XCSQLConnection];
        v31 = [v30 filePath];
        v32 = [v31 stringByAppendingString:@"-wal"];
        v33 = objc_msgSend(v28, "numberWithLongLong:", +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v32));
        v84[5] = v33;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:6];
        AnalyticsSendEvent();

        v20 = v78;
        v19 = v77;

        [(PLSQLiteConnection *)v21 closeConnection];
        if (+[PLUtilities compressWithSource:v77 withDestination:v78 withLevel:4])
        {
          v35 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v35 removeItemAtPath:v77 error:0];

          v36 = [MEMORY[0x1E4F28CB8] defaultManager];
          v37 = [v77 stringByAppendingString:@"-wal"];
          [v36 removeItemAtPath:v37 error:0];

          v38 = [MEMORY[0x1E4F28CB8] defaultManager];
          v39 = [v77 stringByAppendingString:@"-shm"];
          [v38 removeItemAtPath:v39 error:0];

          v21 = [v8 stringByAppendingPathComponent:@"tag.json"];
          v40 = [MEMORY[0x1E4F1CA48] array];
          v41 = [v78 lastPathComponent];
          [v40 addObject:v41];

          v74 = v40;
          v82[0] = v40;
          v81[0] = @"LogFiles";
          v81[1] = @"XcodeVersion";
          v42 = NSNumber;
          [(PLSubmissionFileXC *)self xcodeVersionFromUserActions];
          v43 = objc_msgSend(v42, "numberWithDouble:");
          v82[1] = v43;
          v81[2] = @"UserActionCount_System";
          v44 = NSNumber;
          v45 = +[PPSCoreStorage sharedSQLStorage];
          v46 = [v45 XCSQLConnection];
          v47 = objc_msgSend(v44, "numberWithInt:", -[PLSubmissionFileXC userActionCountForConnection:](self, "userActionCountForConnection:", v46));
          v82[2] = v47;
          v81[3] = @"UserActionCount_Upload";
          v48 = [NSNumber numberWithInt:v64];
          v82[3] = v48;
          v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:4];

          if (![(PLSubmissionFile *)self createTagFileWithPath:v21 withInfo:v49])
          {
            v50 = PLLogSubmission();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
              -[PLSubmissionFileBG copyAndPrepareLog].cold.5();
            }
          }
          v51 = (void *)MEMORY[0x1E4F5F3C0];
          v52 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
          v53 = [v51 archiveDirectoryAt:v52 deleteOriginal:1];

          if (v53)
          {
            v54 = [MEMORY[0x1E4F28CB8] defaultManager];
            v55 = [v53 path];
            v56 = [(PLSubmissionFile *)self filePath];
            v79 = v65;
            char v57 = [v54 moveItemAtPath:v55 toPath:v56 error:&v79];
            v58 = v79;

            if (v57)
            {
              [(PLSubmissionFile *)self decorateFile];
              v59 = PLLogSubmission();
              v20 = v78;
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
                -[PLSubmissionFileXC copyAndPrepareLog]();
              }

              v60 = [MEMORY[0x1E4F28CB8] defaultManager];
              v61 = [v53 path];
              [v60 removeItemAtPath:v61 error:0];

              BOOL v6 = 1;
            }
            else
            {
              v60 = PLLogSubmission();
              v20 = v78;
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
                -[PLSubmissionFileXC copyAndPrepareLog].cold.4();
              }
              BOOL v6 = 0;
            }
            v19 = v77;
          }
          else
          {
            v60 = PLLogSubmission();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
              -[PLSubmissionFileXC copyAndPrepareLog]();
            }
            BOOL v6 = 0;
            v58 = v65;
            v20 = v78;
          }

          v11 = v58;
        }
        else
        {
          v62 = PLLogSubmission();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
            -[PLSubmissionFileBG copyAndPrepareLog].cold.6();
          }

          BOOL v6 = 0;
          v11 = v65;
        }
      }
      else
      {
        PLLogSubmission();
        v21 = (PLSQLiteConnection *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v21->super, OS_LOG_TYPE_ERROR)) {
          -[PLSubmissionFileXC copyAndPrepareLog].cold.7();
        }
        BOOL v6 = 0;
      }
    }
    else
    {
      v19 = PLLogSubmission();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[PLSubmissionFileBG copyAndPrepareLog].cold.8();
      }
      BOOL v6 = 0;
    }
  }
  return v6;
}

- (id)getXCSQLFile
{
  id v3 = [(PLSubmissionFile *)self taskingConfig];
  v4 = [v3 startDate];
  int v5 = [v4 convertFromMonotonicToSystem];

  BOOL v6 = [(PLSubmissionFile *)self taskingConfig];
  int v7 = [v6 endDate];
  v8 = [v7 convertFromMonotonicToSystem];

  v9 = [MEMORY[0x1E4F1C9C8] filenameDateStringWithStartDate:v5 endDate:v8];
  if (![v9 length])
  {
    int v10 = [(PLSubmissionFile *)self taskingConfig];
    uint64_t v11 = [v10 tagUUID];

    v9 = (void *)v11;
  }
  v12 = [NSString stringWithFormat:@"xcode_%@.XCSQL", v9];
  char v13 = PLLogSubmission();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[PLSubmissionFileXC getXCSQLFile]();
  }

  return v12;
}

- (void)obfuscateTimestampsForTable:(id)a3 connection:(id)a4 withOffset:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = PLLogSubmission();
  int v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFileXC obfuscateTimestampsForTable:connection:withOffset:]((uint64_t)v7, v10, a5);
    }

    objc_msgSend(NSString, "stringWithFormat:", @"UPDATE %@ SET timestamp = timestamp - %f;",
      v7,
    int v10 = *(void *)&a5);
    [v8 beginTransaction];
    id v11 = (id)[v8 performQuery:v10];
    [v8 endTransaction];
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[PLSubmissionFileXC obfuscateTimestampsForTable:connection:withOffset:]();
  }
}

- (double)randomizedBaseOffset
{
  double v2 = (double)arc4random() / 4294967300.0 * 86400.0 + 86400.0;
  id v3 = PLLogSubmission();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    [(PLSubmissionFileXC *)v3 randomizedBaseOffset];
  }

  return v2;
}

- (int)userActionCountForConnection:(id)a3
{
  return [a3 rowCountForTableName:@"XcodeMetrics_UserAction_365_4"];
}

- (double)xcodeVersionFromUserActions
{
  double v2 = [NSString stringWithFormat:@"SELECT DISTINCT %@ FROM %@ ORDER BY timestamp DESC limit 1", @"XcodeVersion", @"XcodeMetrics_UserAction_365_4"];
  id v3 = +[PPSCoreStorage sharedSQLStorage];
  v4 = [v3 XCSQLConnection];
  int v5 = [v4 entriesForKey:@"XcodeMetrics_UserAction_365_4" withQuery:v2];

  if ([v5 count])
  {
    BOOL v6 = [v5 firstObject];
    id v7 = [v6 objectForKeyedSubscript:@"XcodeVersion"];
    [v7 doubleValue];
    double v9 = v8;

    int v10 = PLLogSubmission();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      [(PLSubmissionFileXC *)v10 xcodeVersionFromUserActions];
    }
  }
  else
  {
    int v10 = PLLogSubmission();
    double v9 = -1.0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFileXC xcodeVersionFromUserActions]();
    }
  }

  return v9;
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
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "Failed to copy xcsql file to %@", v2, v3, v4, v5, v6);
}

- (void)getXCSQLFile
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_DEBUG, "Requested Xcode DB file: %@", v1, 0xCu);
}

- (void)obfuscateTimestampsForTable:connection:withOffset:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1BBD2F000, v0, v1, "Failed to connect to copied XCSQL for timestamp obfuscation", v2, v3, v4, v5, v6);
}

- (void)obfuscateTimestampsForTable:(uint64_t)a1 connection:(NSObject *)a2 withOffset:(double)a3 .cold.2(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_DEBUG, "Performing timestamp obfuscation for %@ with base timestamp '%f'", (uint8_t *)&v3, 0x16u);
}

- (void)randomizedBaseOffset
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 134218496;
  double v3 = a2;
  __int16 v4 = 2048;
  uint64_t v5 = 0x40F5180000000000;
  __int16 v6 = 2048;
  uint64_t v7 = 0x4105180000000000;
  _os_log_debug_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_DEBUG, "Computed randomized offset '%f' with randomization interval ['%f', '%f']", (uint8_t *)&v2, 0x20u);
}

- (void)xcodeVersionFromUserActions
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_DEBUG, "Xcode Version = %f", (uint8_t *)&v2, 0xCu);
}

@end