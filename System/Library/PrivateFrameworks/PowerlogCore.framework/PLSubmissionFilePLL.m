@interface PLSubmissionFilePLL
- (BOOL)copyAndPrepareLog;
- (BOOL)copyArchiveAtPath:(id)a3 to:(id)a4;
- (BOOL)copyLastArchiveToPath:(id)a3;
- (BOOL)copyPowerlogToPath:(id)a3;
- (BOOL)copyUpgradePowerlogToPath:(id)a3;
- (BOOL)isEnergyTasking;
- (BOOL)prepareDatabaseAtPath:(id)a3;
- (PLSubmissionFilePLL)initWithConfig:(id)a3;
- (id)baseCADictionary;
- (id)fileExtension;
- (id)fileType;
- (id)updateSubmissionTagWithConnection:(id)a3;
- (void)emitCopyResult:(BOOL)a3;
- (void)emitDecompressionResult:(BOOL)a3;
- (void)emitFileExists:(BOOL)a3;
- (void)emitPreparationResult:(BOOL)a3;
- (void)flush;
- (void)generateSubmissionTagForCurrentLog;
- (void)logSubmissionSizeToAnalytics:(unint64_t)a3 withUncompressedSize:(unint64_t)a4;
- (void)setIsEnergyTasking:(BOOL)a3;
- (void)submit;
@end

@implementation PLSubmissionFilePLL

- (PLSubmissionFilePLL)initWithConfig:(id)a3
{
  id v4 = a3;
  if (([v4 submitPLL] & 1) == 0 && !objc_msgSend(v4, "submitPLLUpgrade")) {
    goto LABEL_9;
  }
  v8.receiver = self;
  v8.super_class = (Class)PLSubmissionFilePLL;
  self = [(PLSubmissionFile *)&v8 initWithConfig:v4];
  if (!self) {
    goto LABEL_8;
  }
  if ([v4 submitReasonType] == 5)
  {
    v5 = [v4 taskingType];
    -[PLSubmissionFilePLL setIsEnergyTasking:](self, "setIsEnergyTasking:", [v5 isEqualToString:@"Energy"]);
  }
  else
  {
    [(PLSubmissionFilePLL *)self setIsEnergyTasking:0];
  }
  if ([(PLSubmissionFilePLL *)self copyAndPrepareLog])
  {
LABEL_8:
    self = self;
    v6 = self;
  }
  else
  {
LABEL_9:
    v6 = 0;
  }

  return v6;
}

- (id)fileType
{
  v2 = [(PLSubmissionFile *)self taskingConfig];
  if ([v2 submittedFilesMask] == 1024) {
    v3 = @"UpgradePowerlog";
  }
  else {
    v3 = @"Powerlog";
  }
  id v4 = v3;

  return v4;
}

- (id)fileExtension
{
  v2 = [(PLSubmissionFile *)self taskingConfig];
  if ([v2 submittedFilesMask] == 1024) {
    v3 = @".PLSQL.pllupgrade.anon";
  }
  else {
    v3 = @".PLSQL.pll.anon";
  }
  id v4 = v3;

  return v4;
}

- (void)logSubmissionSizeToAnalytics:(unint64_t)a3 withUncompressedSize:(unint64_t)a4
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[PLSubmissionFilePLL logSubmissionSizeToAnalytics:withUncompressedSize:]();
  }
  AnalyticsSendEventLazy();
}

id __73__PLSubmissionFilePLL_logSubmissionSizeToAnalytics_withUncompressedSize___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"PowerlogCompressedSize";
  v2 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
  v6[1] = @"PowerlogUncompressedSize";
  v7[0] = v2;
  v3 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (BOOL)copyAndPrepareLog
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [(PLSubmissionFile *)self taskingConfig];
  id v4 = [v3 startDate];
  v5 = [(PLSubmissionFile *)self taskingConfig];
  v6 = [v5 endDate];
  +[PLEnhancedTaskingAgent logAggregatedDataFromSignpostWithStartDate:v4 withEndDate:v6];

  v7 = [(PLSubmissionFile *)self filePath];
  if (v7)
  {
    objc_super v8 = [(PLSubmissionFile *)self directory];

    if (v8)
    {
      v9 = [(PLSubmissionFile *)self directory];
      +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:v9];
    }
    if ([(PLSubmissionFilePLL *)self isEnergyTasking])
    {
      v10 = PLLogSubmission();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_DEFAULT, "Preparing most recent powerlog archive...", (uint8_t *)&v26, 2u);
      }

      BOOL v11 = [(PLSubmissionFilePLL *)self copyLastArchiveToPath:v7];
LABEL_19:
      BOOL v17 = v11;
      goto LABEL_22;
    }
    v18 = [(PLSubmissionFile *)self taskingConfig];
    uint64_t v19 = [v18 submittedFilesMask];

    v20 = PLLogSubmission();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19 != 1024)
    {
      if (v21)
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1BBD2F000, v20, OS_LOG_TYPE_DEFAULT, "Preparing powerlog...", (uint8_t *)&v26, 2u);
      }

      BOOL v11 = [(PLSubmissionFilePLL *)self copyPowerlogToPath:v7];
      goto LABEL_19;
    }
    if (v21)
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_1BBD2F000, v20, OS_LOG_TYPE_DEFAULT, "Preparing upgrade powerlog...", (uint8_t *)&v26, 2u);
    }

    v22 = [(PLSubmissionFile *)self taskingConfig];
    v23 = [v22 startDate];
    if (v23) {
      BOOL v24 = [(PLSubmissionFilePLL *)self copyPowerlogToPath:v7];
    }
    else {
      BOOL v24 = [(PLSubmissionFilePLL *)self copyUpgradePowerlogToPath:v7];
    }
    BOOL v17 = v24;
  }
  else
  {
    v12 = [NSString stringWithFormat:@"Error no path provided!"];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFilePLL.m"];
    v14 = [v13 lastPathComponent];
    v15 = [NSString stringWithUTF8String:"-[PLSubmissionFilePLL copyAndPrepareLog]"];
    +[PLCoreStorage logMessage:v12 fromFile:v14 fromFunction:v15 fromLineNumber:102];

    v16 = PLLogCommon();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412290;
      v27 = v12;
      _os_log_impl(&dword_1BBD2F000, v16, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v26, 0xCu);
    }

    BOOL v17 = 0;
  }
LABEL_22:

  return v17;
}

- (void)flush
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_DEBUG, "Skipping flush", v1, 2u);
}

- (BOOL)prepareDatabaseAtPath:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PLSubmissionFile *)self taskingConfig];
  v6 = v5;
  if (!v5)
  {
    BOOL v12 = 0;
    goto LABEL_42;
  }
  v7 = [v5 cacheSize];
  uint64_t v57 = [v7 longLongValue];

  objc_super v8 = [v6 removeEntries];
  v9 = [v6 hashEntries];
  v10 = [v6 trimmingQueries];
  BOOL v11 = [[PLSQLiteConnection alloc] initWithFilePath:v4];
  BOOL v12 = v11 != 0;
  if (v11)
  {
    id v13 = [(PLSubmissionFilePLL *)self updateSubmissionTagWithConnection:v11];
    v14 = [v6 removeEntries];
    if (v14 || ([v6 hashEntries], (v14 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      v52 = [v6 trimmingQueries];

      if (!v52)
      {
LABEL_39:
        [(PLSQLiteConnection *)v11 closeConnection];
        goto LABEL_40;
      }
    }
    [(PLSQLiteConnection *)v11 dropTables:v8];
    [(PLSQLiteConnection *)v11 hashEntryKeyKeys:v9];
    v55 = v9;
    v56 = v8;
    if ([v6 submitReasonType] == 4)
    {
      v53 = v10;
      id v54 = v4;
      v15 = PLLogSubmission();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBD2F000, v15, OS_LOG_TYPE_INFO, "Dropping tables with > 24 hr retention for upgrade tasking", buf, 2u);
      }

      v16 = [MEMORY[0x1E4F1CA80] set];
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      BOOL v17 = +[PLCoreOperator registeredOperators];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v77 objects:v83 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v78;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v78 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = [*(id *)(*((void *)&v77 + 1) + 8 * i) entryKeys];
            v75[0] = MEMORY[0x1E4F143A8];
            v75[1] = 3221225472;
            v75[2] = __45__PLSubmissionFilePLL_prepareDatabaseAtPath___block_invoke;
            v75[3] = &unk_1E6255990;
            id v76 = v16;
            [v22 enumerateObjectsUsingBlock:v75];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v77 objects:v83 count:16];
        }
        while (v19);
      }

      v23 = +[PPSEntryKey allEntryKeys];
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __45__PLSubmissionFilePLL_prepareDatabaseAtPath___block_invoke_2;
      v73[3] = &unk_1E6255990;
      id v24 = v16;
      id v74 = v24;
      [v23 enumerateObjectsUsingBlock:v73];

      v25 = PLLogSubmission();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBD2F000, v25, OS_LOG_TYPE_INFO, "Deleting tables > 24 hours for upgrade tasking", buf, 2u);
      }

      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = __45__PLSubmissionFilePLL_prepareDatabaseAtPath___block_invoke_57;
      v71[3] = &unk_1E6254A60;
      int v26 = v11;
      v72 = v26;
      [v24 enumerateObjectsUsingBlock:v71];
      v27 = PLLogSubmission();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBD2F000, v27, OS_LOG_TYPE_INFO, "Dropping config data for upgrade tasking", buf, 2u);
      }

      uint64_t v28 = NSString;
      v29 = +[PLUtilities buildVersion];
      v30 = [v28 stringWithFormat:@"DELETE FROM %@ WHERE (%@ != %@)", @"PLConfigAgent_EventNone_Config", @"Build", v29];

      id v31 = [(PLSQLiteConnection *)v26 performQuery:v30];
      v32 = PLLogSubmission();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBD2F000, v32, OS_LOG_TYPE_INFO, "Removing config columns for upgrade tasking", buf, 2u);
      }

      v33 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F1586840];
      v34 = +[PLEntryDefinition allKeysForEntryKey:@"PLConfigAgent_EventNone_Config"];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __45__PLSubmissionFilePLL_prepareDatabaseAtPath___block_invoke_111;
      v68[3] = &unk_1E62559B8;
      id v69 = v33;
      v35 = v26;
      v70 = v35;
      id v36 = v33;
      [v34 enumerateObjectsUsingBlock:v68];

      v37 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F1586858];
      v38 = PLLogSubmission();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBD2F000, v38, OS_LOG_TYPE_INFO, "Applying config timestamp bucketization for upgrade tasking", buf, 2u);
      }

      v39 = [NSString stringWithFormat:@"WITH tmp AS (SELECT rowid, ROW_NUMBER() OVER (PARTITION BY %@, %@ ORDER BY timestamp) AS rn FROM %@ WHERE %@ != %@ OR %@ IS NULL)", @"LastBuild", @"Build", @"PLConfigAgent_EventNone_Config", @"LastBuild", @"Build", @"LastBuild"];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __45__PLSubmissionFilePLL_prepareDatabaseAtPath___block_invoke_125;
      v65[3] = &unk_1E62559E0;
      id v40 = v39;
      id v66 = v40;
      v41 = v35;
      v67 = v41;
      [v37 enumerateObjectsUsingBlock:v65];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __45__PLSubmissionFilePLL_prepareDatabaseAtPath___block_invoke_2_136;
      v62[3] = &unk_1E62559E0;
      id v63 = v40;
      v64 = v41;
      id v42 = v40;
      [v37 enumerateObjectsUsingBlock:v62];

      id v4 = v54;
      v10 = v53;
    }
    if (!+[PLUtilities SwitchToIncrementalVacuumEnabled]) {
      [(PLSQLiteConnection *)v11 vacuum];
    }
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v43 = v10;
    id v44 = v10;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v58 objects:v82 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v59;
LABEL_29:
      uint64_t v48 = 0;
      while (1)
      {
        if (*(void *)v59 != v47) {
          objc_enumerationMutation(v44);
        }
        uint64_t v49 = *(void *)(*((void *)&v58 + 1) + 8 * v48);
        if (+[PLFileStats fileSizeAtPath:v4] <= v57) {
          break;
        }
        if (+[PLUtilities isValidString:v49])
        {
          id v50 = [(PLSQLiteConnection *)v11 performQuery:v49];
          if (!+[PLUtilities SwitchToIncrementalVacuumEnabled])[(PLSQLiteConnection *)v11 vacuum]; {
        }
          }
        if (v46 == ++v48)
        {
          uint64_t v46 = [v44 countByEnumeratingWithState:&v58 objects:v82 count:16];
          if (v46) {
            goto LABEL_29;
          }
          break;
        }
      }
    }

    BOOL v12 = v11 != 0;
    v9 = v55;
    v10 = v43;
    objc_super v8 = v56;
    goto LABEL_39;
  }
LABEL_40:

LABEL_42:
  return v12;
}

void __45__PLSubmissionFilePLL_prepareDatabaseAtPath___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0
    && ([v11 isEqualToString:@"PLConfigAgent_EventNone_Config"] & 1) == 0)
  {
    v3 = +[PLEntryDefinition configsForEntryKey:v11];
    id v4 = [v3 objectForKeyedSubscript:@"TaskModeTable"];
    char v5 = [v4 BOOLValue];

    if (v5) {
      goto LABEL_6;
    }
    uint64_t v6 = [v3 objectForKeyedSubscript:@"TrimConditionsTemplateArg"];
    if (v6)
    {
      v7 = (void *)v6;
      objc_super v8 = [v3 objectForKeyedSubscript:@"TrimConditionsTemplateArg"];
      [v8 doubleValue];
      double v10 = v9;

      if (v10 > 86400.0) {
LABEL_6:
      }
        [*(id *)(a1 + 32) addObject:v11];
    }
  }
}

uint64_t __45__PLSubmissionFilePLL_prepareDatabaseAtPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (([*(id *)(a1 + 32) containsObject:v7] & 1) == 0)
  {
    v3 = +[PPSEntryKey baseMetricsForEntryKey:v7];
    id v4 = [v3 allValues];
    char v5 = [v4 firstObject];

    if (v5
      && ([v5 mode] == 3
       || [v5 mode] == 7
       || [v5 timeToLive] >= 2))
    {
      [*(id *)(a1 + 32) addObject:v7];
    }
  }
  return MEMORY[0x1F4181820]();
}

void __45__PLSubmissionFilePLL_prepareDatabaseAtPath___block_invoke_57(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PLLogSubmission();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __45__PLSubmissionFilePLL_prepareDatabaseAtPath___block_invoke_57_cold_1();
  }

  [*(id *)(a1 + 32) dropTable:v3];
}

void __45__PLSubmissionFilePLL_prepareDatabaseAtPath___block_invoke_111(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    id v3 = [NSString stringWithFormat:@"ALTER TABLE %@ DROP COLUMN %@", @"PLConfigAgent_EventNone_Config", v5];
    id v4 = (id)[*(id *)(a1 + 40) performQuery:v3];
  }
}

void __45__PLSubmissionFilePLL_prepareDatabaseAtPath___block_invoke_125(uint64_t a1, uint64_t a2)
{
  [NSString stringWithFormat:@"UPDATE %@ SET %@ = (((cast(\"%@\" as int) + 60) + (60 / 2)) / 60) * 60", @"PLConfigAgent_EventNone_Config", a2, a2];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [NSString stringWithFormat:@"%@ %@ %@", *(void *)(a1 + 32), v5, @"WHERE rowid IN (SELECT rowid FROM tmp WHERE rn = 1)"];;
  id v4 = (id)[*(id *)(a1 + 40) performQuery:v3];
}

void __45__PLSubmissionFilePLL_prepareDatabaseAtPath___block_invoke_2_136(uint64_t a1, uint64_t a2)
{
  [NSString stringWithFormat:@"UPDATE %@ SET %@ = (((cast(\"%@\" as int) + 180) + (180 / 2)) / 180) * 180", @"PLConfigAgent_EventNone_Config", a2, a2];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [NSString stringWithFormat:@"%@ %@ %@", *(void *)(a1 + 32), v5, @"WHERE rowid IN (SELECT rowid FROM tmp WHERE rn > 1);"];
  id v4 = (id)[*(id *)(a1 + 40) performQuery:v3];
}

- (void)generateSubmissionTagForCurrentLog
{
  id v3 = +[PLOperator entryKeyForType:@"EventForward" andName:@"SubmissionTag"];
  id v4 = +[PowerlogCore sharedCore];
  id v5 = [v4 storage];
  uint64_t v6 = [v5 lastEntryForKey:v3];

  if (v6)
  {
    id v7 = +[PowerlogCore sharedCore];
    objc_super v8 = [v7 storage];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __57__PLSubmissionFilePLL_generateSubmissionTagForCurrentLog__block_invoke;
    v26[3] = &unk_1E62539B8;
    double v9 = v6;
    v27 = v9;
    uint64_t v28 = self;
    [v8 updateEntry:v9 withBlock:v26];

    double v10 = v27;
LABEL_3:

    goto LABEL_11;
  }
  double v9 = [[PLEntry alloc] initWithEntryKey:v3];
  id v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
  [(PLEntry *)v9 setEntryDate:v11];

  BOOL v12 = [MEMORY[0x1E4F29128] UUID];
  id v13 = [v12 UUIDString];
  [(PLEntry *)v9 setObject:v13 forKeyedSubscript:@"UUIDTag"];

  v14 = +[PowerlogCore sharedCore];
  v15 = [v14 storage];
  [v15 writeEntry:v9 withCompletionBlock:&__block_literal_global_44];

  if (+[PLDefaults debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __57__PLSubmissionFilePLL_generateSubmissionTagForCurrentLog__block_invoke_2_155;
    id v24 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v25 = v16;
    if (generateSubmissionTagForCurrentLog_defaultOnce != -1) {
      dispatch_once(&generateSubmissionTagForCurrentLog_defaultOnce, &block);
    }
    if (generateSubmissionTagForCurrentLog_classDebugEnabled)
    {
      double v10 = [NSString stringWithFormat:@"generateSubmissionTag CREATE (%@)\n", v9, block, v22, v23, v24, v25];
      BOOL v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFilePLL.m"];
      uint64_t v18 = [v17 lastPathComponent];
      uint64_t v19 = [NSString stringWithUTF8String:"-[PLSubmissionFilePLL generateSubmissionTagForCurrentLog]"];
      +[PLCoreStorage logMessage:v10 fromFile:v18 fromFunction:v19 fromLineNumber:353];

      uint64_t v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      goto LABEL_3;
    }
  }
LABEL_11:
}

void __57__PLSubmissionFilePLL_generateSubmissionTagForCurrentLog__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F29128] UUID];
  id v3 = [v2 UUIDString];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:@"UUIDTag"];

  if (+[PLDefaults debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    BOOL v12 = __57__PLSubmissionFilePLL_generateSubmissionTagForCurrentLog__block_invoke_2;
    id v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v14 = v4;
    if (ArrayReserved_block_invoke_defaultOnce_0 != -1) {
      dispatch_once(&ArrayReserved_block_invoke_defaultOnce_0, &block);
    }
    if (ArrayReserved_block_invoke_classDebugEnabled_0)
    {
      id v5 = [NSString stringWithFormat:@"generateSubmissionTag UPDATE (%@)\n", *(void *)(a1 + 32), block, v11, v12, v13, v14];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLSubmissionsClasses/PLSubmissionFilePLL.m"];
      id v7 = [v6 lastPathComponent];
      objc_super v8 = [NSString stringWithUTF8String:"-[PLSubmissionFilePLL generateSubmissionTagForCurrentLog]_block_invoke"];
      +[PLCoreStorage logMessage:v5 fromFile:v7 fromFunction:v8 fromLineNumber:346];

      double v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

BOOL __57__PLSubmissionFilePLL_generateSubmissionTagForCurrentLog__block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  ArrayReserved_block_invoke_classDebugEnabled_0 = result;
  return result;
}

BOOL __57__PLSubmissionFilePLL_generateSubmissionTagForCurrentLog__block_invoke_2_155(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  generateSubmissionTagForCurrentLog_classDebugEnabled = result;
  return result;
}

- (id)updateSubmissionTagWithConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(PLSubmissionFile *)self taskingConfig];
  uint64_t v6 = [v5 getSubmitReasonTypeToReasonLog];
  id v7 = PLLogSubmission();
  objc_super v8 = v7;
  if (v4 && v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFilePLL updateSubmissionTagWithConnection:]();
    }

    double v9 = [v5 tagUUID];
    objc_super v8 = +[PLOperator entryKeyForType:@"EventForward" andName:@"SubmissionTag"];
    double v10 = [NSString stringWithFormat:@"UPDATE %@ SET %@ = '%@', %@ = '%@'", v8, @"Reason", v6, @"UUIDTag", v9];
    id v11 = (id)[v4 performQuery:v10];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PLSubmissionFilePLL updateSubmissionTagWithConnection:]();
    }
    double v9 = 0;
  }

  return v9;
}

- (void)submit
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_3();
  _os_log_debug_impl(&dword_1BBD2F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Compressed size %llu Uncompressed size %llu bytes", v0, 0x16u);
}

id __29__PLSubmissionFilePLL_submit__block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = @"reasonType";
  uint64_t v1 = NSNumber;
  v2 = [*(id *)(a1 + 32) taskingConfig];
  id v3 = objc_msgSend(v1, "numberWithShort:", objc_msgSend(v2, "submitReasonType"));
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (BOOL)copyPowerlogToPath:(id)a3
{
  id v4 = a3;
  [(PLSubmissionFilePLL *)self generateSubmissionTagForCurrentLog];
  [(PLSubmissionFilePLL *)self flush];
  id v5 = [(PLSubmissionFile *)self taskingConfig];
  uint64_t v6 = [v5 startDate];

  id v7 = [(PLSubmissionFile *)self taskingConfig];
  int v8 = [v7 submitReasonType];

  if (v8 == 4)
  {
    double v9 = [(PLSubmissionFile *)self taskingConfig];
    double v10 = [v9 endDate];
  }
  else
  {
    double v10 = 0;
  }
  id v11 = [(PLSubmissionFile *)self taskingConfig];
  BOOL v12 = [v11 cacheSize];

  if (v12)
  {
    id v13 = [(PLSubmissionFile *)self taskingConfig];
    uint64_t v14 = [v13 cacheSize];
    uint64_t v15 = [v14 integerValue];

    uint64_t v16 = +[PLSQLiteConnection sharedSQLiteConnection];
    BOOL v17 = +[PLCoreStorage allOperatorTablesToTrimConditionsForTrimDate:v6];
    LOBYTE(v15) = [v16 copyDatabaseToPath:v4 fromDate:v6 toDate:v10 withTableFilters:v17 vacuumDB:0 withCacheSize:v15];

    if (v15)
    {
LABEL_6:
      [(PLSubmissionFilePLL *)self prepareDatabaseAtPath:v4];
      [(PLSubmissionFile *)self decorateFile];
      uint64_t v18 = +[PLSQLiteConnection sharedSQLiteConnection];
      [v18 clearTableHasTimestampColumnCache];

      BOOL v19 = 1;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v20 = +[PLUtilities SwitchToIncrementalVacuumEnabled] ^ 1;
    BOOL v21 = +[PLSQLiteConnection sharedSQLiteConnection];
    uint64_t v22 = +[PLCoreStorage allOperatorTablesToTrimConditionsForTrimDate:v6];
    LOBYTE(v20) = [v21 copyDatabaseToPath:v4 fromDate:v6 toDate:v10 withTableFilters:v22 vacuumDB:v20];

    if (v20) {
      goto LABEL_6;
    }
  }
  v23 = PLLogSubmission();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    -[PLSubmissionFilePLL copyPowerlogToPath:](v23);
  }

  BOOL v19 = 0;
LABEL_11:

  return v19;
}

- (BOOL)copyArchiveAtPath:(id)a3 to:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 stringByAppendingString:@".gz"];
  double v9 = PLLogSubmission();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v6;
    __int16 v27 = 2112;
    uint64_t v28 = v8;
    _os_log_impl(&dword_1BBD2F000, v9, OS_LOG_TYPE_DEFAULT, "Copying archive at '%@' to '%@'...", buf, 0x16u);
  }

  double v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v24 = 0;
  uint64_t v11 = [v10 copyItemAtPath:v6 toPath:v8 error:&v24];
  id v12 = v24;

  [(PLSubmissionFilePLL *)self emitCopyResult:v11];
  id v13 = PLLogSubmission();
  uint64_t v14 = v13;
  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PLSubmissionFilePLL copyArchiveAtPath:to:].cold.5();
    }
    goto LABEL_17;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[PLSubmissionFilePLL copyArchiveAtPath:to:].cold.4();
  }

  BOOL v15 = +[PLUtilities decompressWithSource:v8 withDestination:v7 withRemoveSrc:1];
  [(PLSubmissionFilePLL *)self emitDecompressionResult:v15];
  if (!v15)
  {
    uint64_t v22 = PLLogSubmission();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[PLSubmissionFilePLL copyArchiveAtPath:to:]();
    }

    goto LABEL_21;
  }
  uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v17 = [v16 fileExistsAtPath:v7];

  [(PLSubmissionFilePLL *)self emitFileExists:v17];
  uint64_t v18 = PLLogSubmission();
  uint64_t v14 = v18;
  if ((v17 & 1) == 0)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[PLSubmissionFilePLL copyArchiveAtPath:to:]((uint64_t)v7, v14);
    }
LABEL_17:

LABEL_21:
    BOOL v21 = 0;
    goto LABEL_22;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v7;
    _os_log_impl(&dword_1BBD2F000, v14, OS_LOG_TYPE_DEFAULT, "Successfully copied archived powerlog to %@!", buf, 0xCu);
  }

  BOOL v19 = [(PLSubmissionFilePLL *)self prepareDatabaseAtPath:v7];
  [(PLSubmissionFilePLL *)self emitPreparationResult:v19];
  if (!v19)
  {
    uint64_t v20 = PLLogSubmission();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[PLSubmissionFilePLL copyArchiveAtPath:to:]();
    }
  }
  [(PLSubmissionFile *)self decorateFile];
  BOOL v21 = 1;
LABEL_22:

  return v21;
}

- (BOOL)copyLastArchiveToPath:(id)a3
{
  id v4 = a3;
  id v5 = +[PLArchiveManager lastArchivePath];
  LOBYTE(self) = [(PLSubmissionFilePLL *)self copyArchiveAtPath:v5 to:v4];

  return (char)self;
}

- (BOOL)copyUpgradePowerlogToPath:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  +[PLDefaults doubleForKey:@"LastUpgradeTimestamp" ifNotSet:-1.0];
  id v6 = objc_msgSend(v5, "dateWithTimeIntervalSince1970:");
  id v7 = +[PLArchiveManager archiveForDate:v6];
  int v8 = v7;
  if (v7)
  {
    double v9 = [v7 startDate];
    double v10 = [(PLSubmissionFile *)self taskingConfig];
    [v10 setStartDate:v9];

    uint64_t v11 = [v8 endDate];
    id v12 = [(PLSubmissionFile *)self taskingConfig];
    [v12 setEndDate:v11];

    id v13 = PLLogSubmission();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [v8 compressedPath];
      BOOL v15 = [v14 lastPathComponent];
      int v19 = 138412546;
      uint64_t v20 = v6;
      __int16 v21 = 2112;
      uint64_t v22 = v15;
      _os_log_impl(&dword_1BBD2F000, v13, OS_LOG_TYPE_INFO, "Choosing archived powerlog for upgrade date '%@': %@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v16 = [v8 compressedPath];
    BOOL v17 = [(PLSubmissionFilePLL *)self copyArchiveAtPath:v16 to:v4];
  }
  else
  {
    uint64_t v16 = PLLogSubmission();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      uint64_t v20 = v6;
      _os_log_impl(&dword_1BBD2F000, v16, OS_LOG_TYPE_INFO, "No archived upgrade powerlog for upgrade date '%@'", (uint8_t *)&v19, 0xCu);
    }
    BOOL v17 = 0;
  }

  return v17;
}

- (id)baseCADictionary
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(PLSubmissionFile *)self taskingConfig];
  id v5 = [v4 request];
  [v3 setObject:v5 forKeyedSubscript:@"TaskingRequest"];

  id v6 = [(PLSubmissionFile *)self taskingConfig];
  id v7 = [v6 taskingType];
  [v3 setObject:v7 forKeyedSubscript:@"TaskingType"];

  int v8 = [(PLSubmissionFile *)self taskingConfig];
  double v9 = [v8 configUUID];
  double v10 = [v9 UUIDString];
  [v3 setObject:v10 forKeyedSubscript:@"TaskingUUID"];

  return v3;
}

- (void)emitCopyResult:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PLSubmissionFilePLL *)self baseCADictionary];
  id v5 = [NSNumber numberWithBool:v3];
  [v4 setObject:v5 forKeyedSubscript:@"CopyResult"];

  id v6 = v4;
  AnalyticsSendEventLazy();
}

id __38__PLSubmissionFilePLL_emitCopyResult___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)emitDecompressionResult:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PLSubmissionFilePLL *)self baseCADictionary];
  id v5 = [NSNumber numberWithBool:v3];
  [v4 setObject:v5 forKeyedSubscript:@"DecompressionResult"];

  id v6 = v4;
  AnalyticsSendEventLazy();
}

id __47__PLSubmissionFilePLL_emitDecompressionResult___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)emitPreparationResult:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PLSubmissionFilePLL *)self baseCADictionary];
  id v5 = [NSNumber numberWithBool:v3];
  [v4 setObject:v5 forKeyedSubscript:@"PreparationResult"];

  id v6 = v4;
  AnalyticsSendEventLazy();
}

id __45__PLSubmissionFilePLL_emitPreparationResult___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)emitFileExists:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PLSubmissionFilePLL *)self baseCADictionary];
  id v5 = [NSNumber numberWithBool:v3];
  [v4 setObject:v5 forKeyedSubscript:@"FileExists"];

  id v6 = v4;
  AnalyticsSendEventLazy();
}

id __38__PLSubmissionFilePLL_emitFileExists___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)isEnergyTasking
{
  return self->_isEnergyTasking;
}

- (void)setIsEnergyTasking:(BOOL)a3
{
  self->_isEnergyTasking = a3;
}

- (void)logSubmissionSizeToAnalytics:withUncompressedSize:.cold.1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_3();
  _os_log_debug_impl(&dword_1BBD2F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Compressed size %llu Uncompressed size %llu in MB", v0, 0x16u);
}

void __45__PLSubmissionFilePLL_prepareDatabaseAtPath___block_invoke_57_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "Dropping table '%@' which is retained > 24 hr", v2, v3, v4, v5, v6);
}

- (void)updateSubmissionTagWithConnection:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "Update submit reason to %@", v2, v3, v4, v5, v6);
}

- (void)updateSubmissionTagWithConnection:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Cannot update submit reason to %@, connection = %@");
}

- (void)copyPowerlogToPath:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1BBD2F000, log, OS_LOG_TYPE_ERROR, "Failed to copy powerlog during PLL creation", v1, 2u);
}

- (void)copyArchiveAtPath:to:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1BBD2F000, v0, OS_LOG_TYPE_ERROR, "Failed to prepare PLL file %@", v1, 0xCu);
}

- (void)copyArchiveAtPath:(uint64_t)a1 to:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = [v4 fileExistsAtPath:a1];
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "Expected file %@ not found after decompression! fileExists = %d", (uint8_t *)&v5, 0x12u);
}

- (void)copyArchiveAtPath:to:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Failed to decompress %@ with error %@");
}

- (void)copyArchiveAtPath:to:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "Decompressing archive %@...", v2, v3, v4, v5, v6);
}

- (void)copyArchiveAtPath:to:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Failed to copy archived powerlog to %@ with error %@");
}

@end