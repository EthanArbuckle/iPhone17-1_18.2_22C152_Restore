@interface PLSQLiteConnection
+ (double)periodicIntegrityCheckInterval;
+ (id)masterTableForTable:(id)a3 andType:(id)a4;
+ (id)sharedSQLiteConnection;
+ (id)tableHasTimestampColumn;
+ (id)tableHasTimestampColumnSem;
+ (id)versionForTable:(id)a3;
+ (void)removeAdditionalFiles:(id)a3;
+ (void)removeDBAtFilePath:(id)a3;
- (BOOL)attachDB:(id)a3 withName:(id)a4;
- (BOOL)checkEmptyMasterTable:(id)a3;
- (BOOL)commonInitProcessWithFilePath:(id)a3 withCacheSize:(int64_t)a4;
- (BOOL)copyDatabase:(id)a3;
- (BOOL)copyDatabaseToPath:(id)a3;
- (BOOL)copyDatabaseToPath:(id)a3 fromDate:(id)a4 toDate:(id)a5;
- (BOOL)copyDatabaseToPath:(id)a3 fromDate:(id)a4 toDate:(id)a5 withTableFilters:(id)a6 vacuumDB:(BOOL)a7;
- (BOOL)copyDatabaseToPath:(id)a3 fromDate:(id)a4 toDate:(id)a5 withTableFilters:(id)a6 vacuumDB:(BOOL)a7 withCacheSize:(int64_t)a8;
- (BOOL)copyTable:(id)a3 fromConnection:(id)a4 withDBName:(id)a5 withProperties:(id)a6 andAttach:(BOOL)a7;
- (BOOL)copyTable:(id)a3 fromDBName:(id)a4 withProperties:(id)a5;
- (BOOL)detachDB:(id)a3;
- (BOOL)isIncrementalVacuumEnabled;
- (BOOL)isTransactionInProgress;
- (BOOL)metadataStmtCreated;
- (BOOL)openCurrentFile;
- (BOOL)openCurrentFileWithCacheSize:(int64_t)a3;
- (BOOL)openCurrentFileWithCacheSize:(int64_t)a3 withFlags:(id)a4;
- (BOOL)passesIntegrityCheck;
- (BOOL)tableExistsForTableName:(id)a3;
- (BOOL)tableHasTimestampColumn:(id)a3;
- (BOOL)truncateDB;
- (NSMutableDictionary)preparedDynamicStatements;
- (NSMutableDictionary)preparedStatements;
- (NSMutableDictionary)preparedUpdateStatements;
- (NSString)cachedClassName;
- (NSString)filePath;
- (NSString)transactionLock;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_semaphore)dbSem;
- (PLSQLStatement)metadataStmt;
- (PLSQLiteConnection)init;
- (PLSQLiteConnection)initWithFilePath:(id)a3;
- (PLSQLiteConnection)initWithFilePath:(id)a3 withCacheSize:(int64_t)a4;
- (PLSQLiteConnection)initWithFilePath:(id)a3 withCacheSize:(int64_t)a4 withFlags:(id)a5;
- (PLSQLiteConnection)initWithFilePath:(id)a3 withFlags:(id)a4;
- (double)schemaVersionForTable:(id)a3;
- (id)cachedStatementForMetadataInsert;
- (id)entriesForKey:(id)a3 withProperties:(id)a4;
- (id)entriesForKey:(id)a3 withQuery:(id)a4;
- (id)getIntegrityCheckCriteria;
- (id)performQuery:(id)a3;
- (id)performQuery:(id)a3 returnValue:(int *)a4 returnResult:(BOOL)a5;
- (id)performStatement:(id)a3;
- (id)sortedSqlFormatedColumnNamesForTableInsert:(id)a3;
- (id)sqlFormatedColumnNamesForTableInsert:(id)a3;
- (id)sqlFormatedColumnNamesForTableSelect:(id)a3 withSystemOffset:(double)a4;
- (id)sqlPropertiesAsString:(id)a3;
- (id)tableInfo:(id)a3;
- (id)versionHashForTable:(id)a3;
- (int)bindEntry:(id)a3 toPreparedStatement:(id)a4 atBindPosition:(int)a5;
- (int)entryCacheStorageSize;
- (int)getCacheSpillValue;
- (int)rowCountForTable:(id)a3;
- (int)rowCountForTableName:(id)a3;
- (int)transactionInProgress;
- (int64_t)cacheSize;
- (int64_t)writeEntry:(id)a3;
- (sqlite3)dbConnection;
- (void)beginTransaction;
- (void)buildColumnInsert:(id *)a3 andValueInsert:(id *)a4 forEntry:(id)a5;
- (void)cachedStatementForMetadataInsert;
- (void)clearTableHasTimestampColumnCache;
- (void)closeConnection;
- (void)createCompositeIndexOnTable:(id)a3 forColumns:(id)a4;
- (void)createIndexOnTable:(id)a3 forColumn:(id)a4;
- (void)createTableName:(id)a3 withColumns:(id)a4;
- (void)dealloc;
- (void)deleteAllEntriesForKey:(id)a3 withFilters:(id)a4;
- (void)deleteArrayEntriesForKey:(id)a3 withRowID:(int64_t)a4;
- (void)deleteDynamicEntriesForKey:(id)a3 withRowID:(int64_t)a4;
- (void)deleteEntryForKey:(id)a3 withRowID:(int64_t)a4;
- (void)displaySchema:(id)a3;
- (void)dropTable:(id)a3;
- (void)dropTables:(id)a3;
- (void)endTransaction;
- (void)enumerateAllTablesWithBlock:(id)a3;
- (void)enumerateTablesWithBlock:(id)a3;
- (void)freeMetadataState;
- (void)fullVacuum;
- (void)hashEntryKeyKeys:(id)a3;
- (void)loadArrayValuesIntoEntry:(id)a3;
- (void)loadDynamicValuesIntoEntry:(id)a3;
- (void)mergeDataFromOtherDBFile:(id)a3;
- (void)moveDatabaseToPath:(id)a3;
- (void)printDBStatusString;
- (void)removeEmptyOldTables;
- (void)removeIDIndexes;
- (void)removeTableNameFromMergeDB:(id)a3;
- (void)runTrimQuery:(id)a3;
- (void)scheduleIntegrityCheck;
- (void)setAllNullValuesForEntryKey:(id)a3 forKey:(id)a4 toValue:(id)a5 withFilters:(id)a6;
- (void)setCacheSize:(int64_t)a3;
- (void)setCachedClassName:(id)a3;
- (void)setDbConnection:(sqlite3 *)a3;
- (void)setDbSem:(id)a3;
- (void)setEntryCacheStorageSize:(int)a3;
- (void)setFilePath:(id)a3;
- (void)setJournalMode:(signed __int16)a3;
- (void)setMetadataStmt:(id)a3;
- (void)setMetadataStmtCreated:(BOOL)a3;
- (void)setPreparedDynamicStatements:(id)a3;
- (void)setPreparedStatements:(id)a3;
- (void)setPreparedUpdateStatements:(id)a3;
- (void)setSchemaVersion:(double)a3 forTableName:(id)a4;
- (void)setTransactionInProgress:(int)a3;
- (void)setTransactionLock:(id)a3;
- (void)setVersionHash:(id)a3 forTableName:(id)a4;
- (void)trimAllTablesFromDate:(id)a3 toDate:(id)a4;
- (void)trimAllTablesFromDate:(id)a3 toDate:(id)a4 withTableFilters:(id)a5;
- (void)trimTable:(id)a3 fromDate:(id)a4 withFilter:(id)a5 withTrimLimit:(int64_t)a6;
- (void)updateEntry:(id)a3;
- (void)vacuum;
- (void)writeArrayEntries:(id)a3;
- (void)writeDynamicEntries:(id)a3;
- (void)writeDynamicEntriesToPPS:(id)a3;
- (void)writeMetadata:(id)a3 forFKID:(id)a4 build:(id)a5 name:(id)a6 version:(double)a7;
@end

@implementation PLSQLiteConnection

- (int64_t)writeEntry:(id)a3
{
  id v4 = a3;
  v5 = [v4 entryKey];
  BOOL v6 = +[PLEntryDefinition cacheSQLPrepareStatementForEntryKey:v5];

  if (!v6) {
    goto LABEL_3;
  }
  v7 = [(PLSQLiteConnection *)self preparedStatements];
  objc_sync_enter(v7);
  v8 = [(PLSQLiteConnection *)self preparedStatements];
  v9 = [v4 entryKey];
  v10 = [v8 objectForKeyedSubscript:v9];

  objc_sync_exit(v7);
  if (!v10)
  {
LABEL_3:
    v11 = objc_opt_new();
    v12 = [v4 entryKey];
    [v11 appendFormat:@"INSERT INTO \"%@\" ", v12];

    id v62 = 0;
    v63[0] = 0;
    [(PLSQLiteConnection *)self buildColumnInsert:v63 andValueInsert:&v62 forEntry:v4];
    id v13 = v63[0];
    id v14 = v62;
    [v11 appendFormat:@" (%@) VALUES (%@);", v13, v14];
    int v61 = 0;
    v15 = [PLSQLStatement alloc];
    v16 = [(PLSQLiteConnection *)self dbConnection];
    v17 = [(PLSQLiteConnection *)self dbSem];
    v10 = [(PLSQLStatement *)v15 initWithSQLQuery:v11 forDatabase:v16 withDBSem:v17 result:&v61];

    if (!v10 && +[PLDefaults debugEnabled])
    {
      v18 = [NSString stringWithFormat:@"Prepare statement fail: entry=%@", v4];
      v54 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      v19 = [v54 lastPathComponent];
      v20 = [NSString stringWithUTF8String:"-[PLSQLiteConnection writeEntry:]"];
      +[PLCoreStorage logMessage:v18 fromFile:v19 fromFunction:v20 fromLineNumber:1333];

      v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      v22 = NSString;
      v23 = [v4 entryKey];
      v24 = [v22 stringWithFormat:@"%@", v23];
      [(PLSQLiteConnection *)self displaySchema:v24];
    }
    if (v61 == 11) {
      +[PLUtilities exitWithReason:1001 connection:self];
    }
    if (v10) {
      BOOL v25 = v6;
    }
    else {
      BOOL v25 = 0;
    }
    if (v25)
    {
      v26 = [(PLSQLiteConnection *)self preparedStatements];
      objc_sync_enter(v26);
      v27 = [(PLSQLiteConnection *)self preparedStatements];
      v28 = [v4 entryKey];
      [v27 setObject:v10 forKeyedSubscript:v28];

      objc_sync_exit(v26);
    }
  }
  [(PLSQLiteConnection *)self bindEntry:v4 toPreparedStatement:v10 atBindPosition:1];
  v29 = [(PLSQLiteConnection *)self performStatement:v10];
  if (+[PLDefaults debugEnabled])
  {
    v30 = NSString;
    v31 = [v4 entryKey];
    v32 = [v30 stringWithFormat:@"writeEntry_%@", v31];

    uint64_t v33 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__PLSQLiteConnection_writeEntry___block_invoke;
    block[3] = &unk_1E6253EC0;
    v59 = @"writeEntry";
    uint64_t v60 = v33;
    if (writeEntry__defaultOnce_0 != -1) {
      dispatch_once(&writeEntry__defaultOnce_0, block);
    }
    int v34 = writeEntry__classDebugEnabled_0;

    if (v34) {
      goto LABEL_23;
    }
    uint64_t v35 = objc_opt_class();
    id v36 = v32;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __33__PLSQLiteConnection_writeEntry___block_invoke_2;
    v55[3] = &unk_1E6253EC0;
    id v56 = v36;
    uint64_t v57 = v35;
    if (writeEntry__defaultOnce_570 != -1) {
      dispatch_once(&writeEntry__defaultOnce_570, v55);
    }
    int v37 = writeEntry__classDebugEnabled_571;

    if (v37)
    {
LABEL_23:
      v38 = [NSString stringWithFormat:@"insert_rowid=%@\nentry=%@\nstatement=%@", v29, v4, v10];
      v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      v40 = [v39 lastPathComponent];
      v41 = [NSString stringWithUTF8String:"-[PLSQLiteConnection writeEntry:]"];
      +[PLCoreStorage logMessage:v38 fromFile:v40 fromFunction:v41 fromLineNumber:1353];

      v42 = PLLogCommon();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  if ([v29 count])
  {
    v43 = [v29 objectAtIndexedSubscript:0];
    v44 = [v43 objectForKeyedSubscript:@"insert_rowid"];
    int64_t v45 = [v44 longLongValue];

    if (v45 != [v4 entryID] && objc_msgSend(v4, "entryID") != 0x8000000000000000)
    {
      v46 = NSString;
      v47 = [v4 entryKey];
      v48 = [v46 stringWithFormat:@"future mismatch! entryKey=%@ entryID=%lld insertID=%lld entry_addr=%p entry=%@", v47, objc_msgSend(v4, "entryID"), v45, v4, v4];

      v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      v50 = [v49 lastPathComponent];
      v51 = [NSString stringWithUTF8String:"-[PLSQLiteConnection writeEntry:]"];
      +[PLCoreStorage logMessage:v48 fromFile:v50 fromFunction:v51 fromLineNumber:1359];

      v52 = PLLogCommon();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
    [v4 setEntryID:v45];
    if ([v4 hasDynamicKeys]) {
      [(PLSQLiteConnection *)self writeDynamicEntries:v4];
    }
    if ([v4 hasArrayKeys]) {
      [(PLSQLiteConnection *)self writeArrayEntries:v4];
    }
    [v4 setExistsInDB:1];
  }
  else
  {
    int64_t v45 = -1;
  }

  return v45;
}

- (NSMutableDictionary)preparedStatements
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (id)performStatement:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__16;
  v17 = __Block_byref_object_dispose__16;
  id v18 = (id)objc_opt_new();
  v5 = [(PLSQLiteConnection *)self workQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__PLSQLiteConnection_performStatement___block_invoke;
  v9[3] = &unk_1E6253D58;
  v12 = &v13;
  id v6 = v4;
  id v10 = v6;
  v11 = self;
  +[PLUtilities dispatchSyncIfNotCallerQueue:v5 withBlock:v9];

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (OS_dispatch_queue)workQueue
{
  v2 = [(PLSQLiteConnection *)self cachedClassName];
  v3 = +[PLUtilities workQueueForKey:v2];

  return (OS_dispatch_queue *)v3;
}

- (NSString)cachedClassName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (int)bindEntry:(id)a3 toPreparedStatement:(id)a4 atBindPosition:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = [v7 isPPSEnabled];
  id v10 = [v7 definedKeys];
  v11 = (void *)[v10 mutableCopy];
  int v83 = v9;
  if (v9)
  {
    v12 = [v7 arrayKeys];
    [v11 addObjectsFromArray:v12];

    uint64_t v13 = [v7 dynamicKeys];
    [v11 addObjectsFromArray:v13];
  }
  if ([v7 entryID] >= 1)
  {
    id v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "entryID"));
    [v8 bindValue:v14 withFormater:5 atPosition:v5];

    uint64_t v5 = (v5 + 1);
  }
  uint64_t v15 = [v7 entryDate];
  [v8 bindValue:v15 withFormater:2 atPosition:v5];

  uint64_t v16 = (v5 + 1);
  v17 = [v7 entryDefinition];
  LODWORD(v15) = +[PLEntryDefinition isAggregateForEntryDefinition:v17];

  if (v15)
  {
    id v18 = [v7 objectForKeyedSubscript:@"timeInterval"];
    [v8 bindValue:v18 withFormater:6 atPosition:(v5 + 1)];

    uint64_t v16 = (v5 + 2);
  }
  v19 = [v7 entryDefinition];
  BOOL v20 = +[PLEntryDefinition overridesEntryDateForEntryDefinition:v19];

  if (v20)
  {
    v21 = [v7 objectForKeyedSubscript:@"timestampLogged"];
    [v8 bindValue:v21 withFormater:2 atPosition:v16];

    uint64_t v22 = (v16 + 1);
  }
  else
  {
    uint64_t v22 = v16;
  }
  if (![v11 count]) {
    goto LABEL_63;
  }
  unint64_t v23 = 0;
  v84 = v8;
  id v82 = v7;
  v77 = v10;
  v78 = v11;
  do
  {
    v24 = [v11 objectAtIndexedSubscript:v23];
    BOOL v25 = [v7 objectForKeyedSubscript:v24];

    v26 = [v11 objectAtIndexedSubscript:v23];
    uint64_t v85 = [v7 formaterForKey:v26];

    v27 = [v7 entryKey];
    v28 = [v11 objectAtIndexedSubscript:v23];
    int v29 = +[PLUtilities logModeForEntryKey:v27 withKey:v28 andValue:v25];

    switch(v29)
    {
      case 0:
        goto LABEL_32;
      case 1:
        if (+[PLDefaults debugEnabled])
        {
          uint64_t v30 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __67__PLSQLiteConnection_bindEntry_toPreparedStatement_atBindPosition___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          void block[4] = v30;
          if (bindEntry_toPreparedStatement_atBindPosition__defaultOnce != -1) {
            dispatch_once(&bindEntry_toPreparedStatement_atBindPosition__defaultOnce, block);
          }
          if (bindEntry_toPreparedStatement_atBindPosition__classDebugEnabled)
          {
            int v79 = v22;
            v31 = NSString;
            v32 = [v7 entryKey];
            uint64_t v33 = [v11 objectAtIndexedSubscript:v23];
            int v34 = [v31 stringWithFormat:@"ALLOWLIST DENIED: entry = %@ key = %@ value = %@ withFormatter = %hd", v32, v33, v25, (int)v85];

            uint64_t v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
            id v36 = [v35 lastPathComponent];
            int v37 = [NSString stringWithUTF8String:"-[PLSQLiteConnection bindEntry:toPreparedStatement:atBindPosition:]"];
            +[PLCoreStorage logMessage:v34 fromFile:v36 fromFunction:v37 fromLineNumber:1295];

            v38 = PLLogCommon();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v88 = v34;
              _os_log_debug_impl(&dword_1BBD2F000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            id v8 = v84;
            LODWORD(v22) = v79;
          }
        }
        if (v85)
        {
          if (!v83) {
            goto LABEL_62;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_62;
          }
        }
        LODWORD(v39) = v22;
        v40 = [v11 objectAtIndexedSubscript:v23];
        int v41 = [v7 staticArraySizeForKey:v40];

        if (v41 < 1) {
          goto LABEL_54;
        }
        uint64_t v22 = [v11 objectAtIndexedSubscript:v23];
        int v42 = v39 + [v7 staticArraySizeForKey:v22] - 1;

        LODWORD(v22) = v42;
        id v8 = v84;
        goto LABEL_62;
      case 2:
        v43 = [NSString stringWithFormat:@"%@", v25];
        uint64_t v44 = +[PLUtilities hashString:v43];

        BOOL v25 = (void *)v44;
        goto LABEL_26;
      case 3:
        goto LABEL_28;
      case 4:
LABEL_26:
        if (v29 == 4)
        {
          uint64_t v45 = [NSString stringWithFormat:@"%@", v25];
          uint64_t v46 = +[PLUtilities hashBundleID:v45];

          BOOL v25 = (void *)v45;
LABEL_31:

          BOOL v25 = (void *)v46;
          goto LABEL_32;
        }
LABEL_28:
        if (v29 == 3)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v46 = [v25 lastPathComponent];
            goto LABEL_31;
          }
        }
LABEL_32:
        if (v85 && (!v83 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          || ([v11 objectAtIndexedSubscript:v23],
              v47 = objc_claimAutoreleasedReturnValue(),
              int v48 = [v7 staticArraySizeForKey:v47],
              v47,
              v48 < 1))
        {
          uint64_t v39 = v22;
          v65 = [v11 objectAtIndexedSubscript:v23];
          int v66 = [v10 containsObject:v65];

          if (v66)
          {
            id v8 = v84;
            LODWORD(v22) = v39;
            [v84 bindValue:v25 withFormater:v85 atPosition:v39];
          }
          else
          {
LABEL_54:
            id v8 = v84;
            LODWORD(v22) = v39;
          }
          goto LABEL_62;
        }
        v49 = [v11 objectAtIndexedSubscript:v23];
        uint64_t v50 = [v7 staticArraySizeForKey:v49];

        if ((v83 & 1) == 0)
        {
          if (!+[PLValueUtilties isFormater:v85 validForObject:v25])
          {
            if (+[PLDefaults debugEnabled])
            {
              uint64_t v67 = v22;
              v68 = NSString;
              uint64_t v69 = objc_opt_class();
              v70 = [v25 description];
              int v81 = v67;
              v71 = [v68 stringWithFormat:@"*** formater does not match object type! (Static Array) ***\nposition=%d formater=%d class=%@ value=%@\n", v67, v85, v69, v70];

              v72 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
              v73 = [v72 lastPathComponent];
              v74 = [NSString stringWithUTF8String:"-[PLSQLiteConnection bindEntry:toPreparedStatement:atBindPosition:]"];
              +[PLCoreStorage logMessage:v71 fromFile:v73 fromFunction:v74 fromLineNumber:1284];

              v75 = PLLogCommon();
              if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v88 = v71;
                _os_log_debug_impl(&dword_1BBD2F000, v75, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              id v8 = v84;
              LODWORD(v22) = v81;
            }
            LODWORD(v22) = v22 + v50 - 1;
            goto LABEL_61;
          }
          v51 = [v78 objectAtIndexedSubscript:v23];
          v52 = [v7 definitionForKey:v51];
          v53 = [v52 objectForKeyedSubscript:@"TypeArrayValue"];
          uint64_t v85 = [v53 shortValue];
        }
        if ((int)v50 < 1) {
          goto LABEL_55;
        }
        unint64_t v54 = 0;
        unsigned int v55 = v22;
        char v56 = 0;
        unsigned int v80 = v55;
        uint64_t v57 = v55;
        break;
      default:
        goto LABEL_62;
    }
    do
    {
      if ([v25 count] > v54)
      {
        v58 = [v25 objectAtIndexedSubscript:v54];
        [v8 bindValue:v58 withFormater:v85 atPosition:v57 + v54];
LABEL_43:

        goto LABEL_50;
      }
      if ((v56 & 1) == 0 && +[PLDefaults debugEnabled])
      {
        v59 = NSString;
        uint64_t v60 = [v7 entryKey];
        v58 = [v59 stringWithFormat:@"Provided array is too short! entryKey=%@ expectedSize=%d actualSize=%lu bindPosition=%d", v60, v50, objc_msgSend(v25, "count"), v57 + v54];

        int v61 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
        id v62 = [v61 lastPathComponent];
        v63 = [NSString stringWithUTF8String:"-[PLSQLiteConnection bindEntry:toPreparedStatement:atBindPosition:]"];
        +[PLCoreStorage logMessage:v58 fromFile:v62 fromFunction:v63 fromLineNumber:1275];

        v64 = PLLogCommon();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v88 = v58;
          _os_log_debug_impl(&dword_1BBD2F000, v64, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        char v56 = 1;
        id v7 = v82;
        id v8 = v84;
        goto LABEL_43;
      }
      char v56 = 1;
LABEL_50:
      ++v54;
    }
    while (v50 != v54);
    LODWORD(v22) = v80 + v54;
    id v10 = v77;
LABEL_55:
    LODWORD(v22) = v22 - 1;
LABEL_61:
    v11 = v78;
LABEL_62:

    ++v23;
    uint64_t v22 = (v22 + 1);
  }
  while ([v11 count] > v23);
LABEL_63:

  return v22;
}

void __39__PLSQLiteConnection_performStatement___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1C1869120]();
  v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v4 = [*(id *)(a1 + 32) perform];
  [v3 addObjectsFromArray:v4];

  if ([*(id *)(a1 + 32) isInsert])
  {
    uint64_t v5 = [*(id *)(a1 + 40) dbSem];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v15 = @"insert_rowid";
    id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_last_insert_rowid((sqlite3 *)objc_msgSend(*(id *)(a1 + 40), "dbConnection")));
    v16[0] = v6;
    id v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = (void **)v16;
    int v9 = &v15;
LABEL_5:
    v11 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:1];

    v12 = [*(id *)(a1 + 40) dbSem];
    dispatch_semaphore_signal(v12);

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v11];
    goto LABEL_6;
  }
  if ([*(id *)(a1 + 32) isDelete])
  {
    id v10 = [*(id *)(a1 + 40) dbSem];
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v13 = @"changes";
    id v6 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_changes((sqlite3 *)objc_msgSend(*(id *)(a1 + 40), "dbConnection")));
    id v14 = v6;
    id v7 = (void *)MEMORY[0x1E4F1C9E8];
    id v8 = &v14;
    int v9 = &v13;
    goto LABEL_5;
  }
LABEL_6:
  [*(id *)(a1 + 32) reset];
}

- (OS_dispatch_semaphore)dbSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 40, 1);
}

- (sqlite3)dbConnection
{
  return self->_dbConnection;
}

- (id)entriesForKey:(id)a3 withProperties:(id)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  id v5 = a4;
  context = (void *)MEMORY[0x1C1869120]();
  id v67 = (id)objc_opt_new();
  id v6 = [MEMORY[0x1E4F28E78] stringWithFormat:@"SELECT * "];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"select"];
  if (v7)
  {
    id v8 = (void *)v7;
    int v9 = [v5 objectForKeyedSubscript:@"select"];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      [v6 appendString:@", "];
      v11 = [v5 objectForKeyedSubscript:@"select"];
      v12 = [v11 componentsJoinedByString:@", "];
      [v6 appendString:v12];
    }
  }
  uint64_t v13 = v63;
  [v6 appendFormat:@" FROM '%@' ", v63];
  uint64_t v14 = [v5 objectForKeyedSubscript:@"where"];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    uint64_t v16 = [v5 objectForKeyedSubscript:@"where"];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      id v18 = [v5 objectForKeyedSubscript:@"where"];
      v19 = [v18 componentsJoinedByString:@" AND "];
      [v6 appendFormat:@"WHERE %@ ", v19];
    }
  }
  uint64_t v20 = [v5 objectForKeyedSubscript:@"order by"];
  v65 = v6;
  if (v20)
  {
    v21 = (void *)v20;
    uint64_t v22 = [v5 objectForKeyedSubscript:@"order by"];
    unint64_t v23 = [MEMORY[0x1E4F1CA98] null];

    if (v22 != v23)
    {
      [v6 appendString:@"ORDER BY "];
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      v24 = [v5 objectForKeyedSubscript:@"order by"];
      BOOL v25 = [v24 allKeys];

      obuint64_t j = v25;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v78 objects:v83 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        char v28 = 1;
        uint64_t v29 = *(void *)v79;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v79 != v29) {
              objc_enumerationMutation(obj);
            }
            uint64_t v31 = *(void *)(*((void *)&v78 + 1) + 8 * i);
            if ((v28 & 1) == 0) {
              [v65 appendString:@", "];
            }
            v32 = [v5 objectForKeyedSubscript:@"order by"];
            uint64_t v33 = [v32 objectForKeyedSubscript:v31];
            int v34 = [v33 BOOLValue];
            uint64_t v35 = @"ASC";
            if (v34) {
              uint64_t v35 = @"DESC";
            }
            [v65 appendFormat:@"%@ %@", v31, v35, context];

            char v28 = 0;
          }
          uint64_t v27 = [obj countByEnumeratingWithState:&v78 objects:v83 count:16];
          char v28 = 0;
        }
        while (v27);
      }

      id v6 = v65;
      [v65 appendString:@" "];
      uint64_t v13 = v63;
    }
  }
  id v36 = [v5 objectForKeyedSubscript:@"limit"];

  if (v36)
  {
    int v37 = [v5 objectForKeyedSubscript:@"limit"];
    [v6 appendFormat:@"LIMIT %@ ", v37];
  }
  [v6 appendString:@";"];
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v38 = objc_opt_class();
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __51__PLSQLiteConnection_entriesForKey_withProperties___block_invoke;
    v75[3] = &unk_1E6253EC0;
    v76 = @"entryQuery";
    uint64_t v77 = v38;
    if (entriesForKey_withProperties__defaultOnce != -1) {
      dispatch_once(&entriesForKey_withProperties__defaultOnce, v75);
    }
    int v39 = entriesForKey_withProperties__classDebugEnabled;

    if (v39)
    {
      v40 = [NSString stringWithFormat:@"sqlQuery=%@", v6];
      int v41 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      int v42 = [v41 lastPathComponent];
      v43 = [NSString stringWithUTF8String:"-[PLSQLiteConnection entriesForKey:withProperties:]"];
      +[PLCoreStorage logMessage:v40 fromFile:v42 fromFunction:v43 fromLineNumber:1840];

      uint64_t v44 = PLLogCommon();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      id v6 = v65;
    }
  }
  uint64_t v45 = [(PLSQLiteConnection *)self performQuery:v6];
  uint64_t v46 = objc_opt_class();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PLSQLiteConnection_entriesForKey_withProperties___block_invoke_758;
  block[3] = &unk_1E6253EC0;
  v73 = @"entryQuery";
  uint64_t v74 = v46;
  if (entriesForKey_withProperties__defaultOnce_756 != -1) {
    dispatch_once(&entriesForKey_withProperties__defaultOnce_756, block);
  }
  int v47 = entriesForKey_withProperties__classDebugEnabled_757;

  if (v47)
  {
    int v48 = [NSString stringWithFormat:@"!!! sqlQuery=%@, results=%@", v6, v45];
    v49 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
    uint64_t v50 = [v49 lastPathComponent];
    v51 = [NSString stringWithUTF8String:"-[PLSQLiteConnection entriesForKey:withProperties:]"];
    +[PLCoreStorage logMessage:v48 fromFile:v50 fromFunction:v51 fromLineNumber:1843];

    v52 = PLLogCommon();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v53 = v45;
  uint64_t v54 = [v53 countByEnumeratingWithState:&v68 objects:v82 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v69;
    do
    {
      for (uint64_t j = 0; j != v55; ++j)
      {
        if (*(void *)v69 != v56) {
          objc_enumerationMutation(v53);
        }
        v58 = +[PLEntry entryWithEntryKey:v13 withData:*(void *)(*((void *)&v68 + 1) + 8 * j)];
        [v58 setExistsInDB:1];
        [v67 addObject:v58];
        if ([v58 hasDynamicKeys])
        {
          v59 = [v5 objectForKeyedSubscript:@"loadDynamic"];

          if (v59) {
            [(PLSQLiteConnection *)self loadDynamicValuesIntoEntry:v58];
          }
        }
        if ([v58 hasArrayKeys])
        {
          uint64_t v60 = [v5 objectForKeyedSubscript:@"loadDynamic"];

          if (v60) {
            [(PLSQLiteConnection *)self loadArrayValuesIntoEntry:v58];
          }
        }
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v68 objects:v82 count:16];
    }
    while (v55);
  }

  return v67;
}

- (void)buildColumnInsert:(id *)a3 andValueInsert:(id *)a4 forEntry:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a5;
  int v6 = [v5 isPPSEnabled];
  uint64_t v29 = [v5 definedKeys];
  uint64_t v7 = (void *)[v29 mutableCopy];
  int v32 = v6;
  if (v6)
  {
    id v8 = [v5 arrayKeys];
    [v7 addObjectsFromArray:v8];

    int v9 = [v5 dynamicKeys];
    [v7 addObjectsFromArray:v9];
  }
  uint64_t v10 = objc_opt_new();
  v11 = objc_opt_new();
  if ([v5 entryID] >= 1)
  {
    [v10 appendString:@"\"ID\", "];
    [v11 appendString:@"?, "];
  }
  [v10 appendString:@"\"timestamp\""];
  [v11 appendString:@"?"];
  v12 = [v5 entryDefinition];
  BOOL v13 = +[PLEntryDefinition isAggregateForEntryDefinition:v12];

  if (v13)
  {
    [v10 appendString:@", \"timeInterval\""];
    [v11 appendString:@", ?"];
  }
  uint64_t v14 = [v5 entryDefinition];
  BOOL v15 = +[PLEntryDefinition overridesEntryDateForEntryDefinition:v14];

  if (v15)
  {
    [v10 appendString:@", \"timestampLogged\""];
    [v11 appendString:@", ?"];
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = v7;
  uint64_t v16 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v30 = *(void *)v34;
    id v31 = v5;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v34 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        if ([v5 formaterForKey:v19]) {
          int v20 = v32;
        }
        else {
          int v20 = 1;
        }
        if (v20 == 1 && (int)[v5 staticArraySizeForKey:v19] >= 1)
        {
          int v21 = [v5 staticArraySizeForKey:v19];
          if (v21 >= 1)
          {
            int v22 = v21;
            uint64_t v23 = 0;
            do
            {
              if ([v10 length]) {
                [v10 appendString:@", "];
              }
              if ([v11 length]) {
                [v11 appendString:@", "];
              }
              [v10 appendFormat:@"\"%@_%d\"", v19, v23];
              [v11 appendFormat:@"?"];
              uint64_t v23 = (v23 + 1);
            }
            while (v22 != v23);
          }
        }
        else if ([v29 containsObject:v19])
        {
          if ([v10 length]) {
            [v10 appendString:@", "];
          }
          if ([v11 length]) {
            [v11 appendString:@", "];
          }
          [v10 appendFormat:@"\"%@\"", v19];
          [v11 appendFormat:@"?"];
        }
        id v5 = v31;
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v17);
  }

  id v24 = v10;
  *a3 = v24;
  id v25 = v11;
  *a4 = v25;
}

- (id)performQuery:(id)a3
{
  id v4 = a3;
  int v26 = 0;
  id v5 = [PLSQLStatement alloc];
  int v6 = [(PLSQLiteConnection *)self dbConnection];
  uint64_t v7 = [(PLSQLiteConnection *)self dbSem];
  id v8 = [(PLSQLStatement *)v5 initWithSQLQuery:v4 forDatabase:v6 withDBSem:v7 result:&v26];

  if (!v8 && +[PLDefaults debugEnabled])
  {
    int v9 = [NSString stringWithFormat:@"Prepare statement fail: query=%@", v4];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
    v11 = [v10 lastPathComponent];
    v12 = [NSString stringWithUTF8String:"-[PLSQLiteConnection performQuery:]"];
    +[PLCoreStorage logMessage:v9 fromFile:v11 fromFunction:v12 fromLineNumber:986];

    BOOL v13 = PLLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
  }
  if (v26 == 11) {
    +[PLUtilities exitWithReason:1001 connection:self];
  }
  uint64_t v14 = [(PLSQLiteConnection *)self performStatement:v8];
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__PLSQLiteConnection_performQuery___block_invoke;
    block[3] = &unk_1E6253EC0;
    id v24 = @"query";
    uint64_t v25 = v15;
    if (performQuery__defaultOnce != -1) {
      dispatch_once(&performQuery__defaultOnce, block);
    }
    int v16 = performQuery__classDebugEnabled;

    if (v16)
    {
      uint64_t v17 = [NSString stringWithFormat:@"query=%@\nresult=%@", v4, v14];
      id v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      uint64_t v19 = [v18 lastPathComponent];
      int v20 = [NSString stringWithUTF8String:"-[PLSQLiteConnection performQuery:]"];
      +[PLCoreStorage logMessage:v17 fromFile:v19 fromFunction:v20 fromLineNumber:993];

      int v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }

  return v14;
}

+ (id)sharedSQLiteConnection
{
  v2 = +[PowerlogCore sharedCore];
  v3 = [v2 storage];
  id v4 = [v3 connection];

  return v4;
}

- (void)writeArrayEntries:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 entryKey];
  v49 = +[PLEntryDefinition arrayKeyConfigsForEntryKey:v4];

  id v5 = [v3 arrayKeys];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0x1E6253000uLL;
    uint64_t v56 = *(void *)v62;
    v51 = v5;
    do
    {
      uint64_t v9 = 0;
      uint64_t v52 = v7;
      do
      {
        if (*(void *)v62 != v56) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v61 + 1) + 8 * v9);
        v11 = [v3 objectForKeyedSubscript:v10];
        v12 = *(void **)(v8 + 1288);
        BOOL v13 = [v3 entryKey];
        LODWORD(v12) = [v12 shouldLogForEntryKey:v13 withKey:v10 andValue:v11];

        if (v12)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([v11 count])
            {
              id v53 = v11;
              id v14 = v11;
              if ([v3 isPPSEnabled])
              {
                signed __int16 v15 = +[PLEntry dataFormatForMetric:v10 auxiliaryMetrics:v49];
                int v16 = v10;
              }
              else
              {
                uint64_t v17 = [v3 definitionForKey:v10];
                id v18 = [v17 objectForKeyedSubscript:@"TypeArrayValue"];
                signed __int16 v15 = [v18 shortValue];

                int v16 = @"value";
              }
              uint64_t v19 = (void *)MEMORY[0x1E4F28E78];
              int v20 = [v3 entryKey];
              uint64_t v54 = v16;
              int v21 = [v19 stringWithFormat:@"INSERT INTO \"%@_Array_%@\" (\"FK_ID\", \"%@\") VALUES ", v20, v10, v16];

              if ((v15 & 0xFFFE) != 0) {
                __int16 v22 = v15;
              }
              else {
                __int16 v22 = 1;
              }
              if ([v14 count])
              {
                unint64_t v23 = 0;
                do
                {
                  if (v23) {
                    [v21 appendString:@", "];
                  }
                  [v21 appendString:@"(?, ?)"];
                  ++v23;
                }
                while ([v14 count] > v23);
              }
              int v60 = 0;
              id v24 = [PLSQLStatement alloc];
              uint64_t v25 = [(PLSQLiteConnection *)self dbConnection];
              int v26 = [(PLSQLiteConnection *)self dbSem];
              uint64_t v27 = [(PLSQLStatement *)v24 initWithSQLQuery:v21 forDatabase:v25 withDBSem:v26 result:&v60];

              if (!v27 && +[PLDefaults debugEnabled])
              {
                char v28 = [NSString stringWithFormat:@"Prepare statement fail: entry=%@", v3];
                uint64_t v50 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
                uint64_t v29 = [v50 lastPathComponent];
                uint64_t v30 = [NSString stringWithUTF8String:"-[PLSQLiteConnection writeArrayEntries:]"];
                +[PLCoreStorage logMessage:v28 fromFile:v29 fromFunction:v30 fromLineNumber:1629];

                id v31 = PLLogCommon();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  int v66 = v28;
                  _os_log_debug_impl(&dword_1BBD2F000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                int v32 = NSString;
                long long v33 = [v3 entryKey];
                long long v34 = [v32 stringWithFormat:@"%@_Array_%@", v33, v10];
                [(PLSQLiteConnection *)self displaySchema:v34];
              }
              if (v60 == 11) {
                +[PLUtilities exitWithReason:1001 connection:self];
              }
              if ([v14 count])
              {
                unint64_t v35 = 0;
                uint64_t v36 = 1;
                do
                {
                  int v37 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "entryID"));
                  [(PLSQLStatement *)v27 bindValue:v37 withFormater:5 atPosition:v36];

                  uint64_t v38 = [v14 objectAtIndexedSubscript:v35];
                  [(PLSQLStatement *)v27 bindValue:v38 withFormater:v22 atPosition:(v36 + 1)];

                  ++v35;
                  uint64_t v36 = (v36 + 2);
                }
                while ([v14 count] > v35);
              }
              unint64_t v8 = 0x1E6253000;
              int v39 = v54;
              if (+[PLDefaults debugEnabled])
              {
                uint64_t v40 = objc_opt_class();
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                block[2] = __40__PLSQLiteConnection_writeArrayEntries___block_invoke;
                block[3] = &unk_1E6253EC0;
                v58 = @"writeArray";
                uint64_t v59 = v40;
                if (writeArrayEntries__defaultOnce != -1) {
                  dispatch_once(&writeArrayEntries__defaultOnce, block);
                }
                int v41 = writeArrayEntries__classDebugEnabled;

                if (v41)
                {
                  uint64_t v42 = [NSString stringWithFormat:@"sqlArrayInsert=%@", v21];
                  v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
                  uint64_t v44 = [v43 lastPathComponent];
                  uint64_t v45 = [NSString stringWithUTF8String:"-[PLSQLiteConnection writeArrayEntries:]"];
                  +[PLCoreStorage logMessage:v42 fromFile:v44 fromFunction:v45 fromLineNumber:1645];

                  uint64_t v46 = (void *)v42;
                  int v47 = PLLogCommon();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    int v66 = v46;
                    _os_log_debug_impl(&dword_1BBD2F000, v47, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  unint64_t v8 = 0x1E6253000;
                  int v39 = v54;
                }
              }
              id v48 = [(PLSQLiteConnection *)self performStatement:v27];

              id v5 = v51;
              uint64_t v7 = v52;
              v11 = v53;
            }
          }
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v61 objects:v67 count:16];
    }
    while (v7);
  }
}

- (void)writeDynamicEntries:(id)a3
{
  uint64_t v117 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 isPPSEnabled])
  {
    v94 = self;
    v97 = v4;
    id v5 = [v4 entryKey];
    uint64_t v6 = +[PLEntryDefinition dynamicKeyConfigsForEntryKey:v5];

    v100 = [v97 dynamicKeys];
    if (![v100 count])
    {

LABEL_74:
      id v4 = v97;
      goto LABEL_75;
    }
    uint64_t v7 = [(PLSQLiteConnection *)self preparedDynamicStatements];
    objc_sync_enter(v7);
    unint64_t v8 = [(PLSQLiteConnection *)self preparedDynamicStatements];
    uint64_t v9 = [v97 entryKey];
    uint64_t v10 = [v8 objectForKeyedSubscript:v9];

    objc_sync_exit(v7);
    if (v10)
    {
      v98 = (PLSQLStatement *)v10;
      v11 = [v6 objectForKeyedSubscript:@"key"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        BOOL v13 = [v6 objectForKeyedSubscript:@"key"];
        id v14 = [v13 allKeys];
        obuint64_t j = [v14 sortedArrayUsingSelector:sel_compare_];

        uint64_t v15 = [obj count] + 3;
      }
      else
      {
        obuint64_t j = 0;
        uint64_t v15 = 4;
      }
      char v28 = v97;
      if (!+[PLDefaults debugEnabled]) {
        goto LABEL_44;
      }
      uint64_t v29 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__PLSQLiteConnection_writeDynamicEntries___block_invoke_629;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v29;
      if (writeDynamicEntries__defaultOnce_627 != -1) {
        dispatch_once(&writeDynamicEntries__defaultOnce_627, block);
      }
      if (!writeDynamicEntries__classDebugEnabled_628) {
        goto LABEL_44;
      }
      uint64_t v30 = NSString;
      id v31 = [v97 entryKey];
      int v16 = [v30 stringWithFormat:@"Retrieving dynamic statement for %@, bindposition count = %u", v31, v15];

      int v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      long long v33 = [v32 lastPathComponent];
      long long v34 = [NSString stringWithUTF8String:"-[PLSQLiteConnection writeDynamicEntries:]"];
      +[PLCoreStorage logMessage:v16 fromFile:v33 fromFunction:v34 fromLineNumber:1534];

      id v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
LABEL_43:

      char v28 = v97;
LABEL_44:
      uint64_t v55 = [v28 entryKey];
      v99 = +[PLEntryDefinition dynamicKeyConfigsForEntryKey:v55];

      [(PLSQLiteConnection *)v94 beginTransaction];
      if ([v100 count])
      {
        unint64_t v56 = 0;
        do
        {
          uint64_t v57 = [v100 objectAtIndexedSubscript:v56];
          v95 = [v97 objectForKeyedSubscript:v57];

          v58 = [v97 entryKey];
          uint64_t v59 = [v100 objectAtIndexedSubscript:v56];
          BOOL v60 = +[PLUtilities shouldLogForEntryKey:v58 withKey:v59 andValue:v95];

          if (v60)
          {
            long long v61 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v97, "entryID"));
            [(PLSQLStatement *)v98 bindValue:v61 withFormater:5 atPosition:1];

            long long v62 = [v99 objectForKeyedSubscript:@"value"];
            long long v63 = [v62 objectForKeyedSubscript:@"Type"];
            -[PLSQLStatement bindValue:withFormater:atPosition:](v98, "bindValue:withFormater:atPosition:", v95, [v63 shortValue], 2);

            long long v64 = [v99 objectForKeyedSubscript:@"unit"];

            if (v64)
            {
              v65 = [v99 objectForKeyedSubscript:@"unit"];
              int v66 = [v65 objectForKeyedSubscript:@"Unit"];
              id v67 = [v99 objectForKeyedSubscript:@"unit"];
              uint64_t v68 = [v67 objectForKeyedSubscript:@"Type"];
              -[PLSQLStatement bindValue:withFormater:atPosition:](v98, "bindValue:withFormater:atPosition:", v66, [v68 shortValue], 3);

              uint64_t v69 = 4;
            }
            else
            {
              uint64_t v69 = 3;
            }
            long long v70 = [v99 objectForKeyedSubscript:@"key"];
            objc_opt_class();
            char v71 = objc_opt_isKindOfClass();

            if (v71)
            {
              long long v103 = 0u;
              long long v104 = 0u;
              long long v101 = 0u;
              long long v102 = 0u;
              id v72 = obj;
              uint64_t v73 = [v72 countByEnumeratingWithState:&v101 objects:v115 count:16];
              if (v73)
              {
                uint64_t v74 = *(void *)v102;
                do
                {
                  uint64_t v75 = 0;
                  uint64_t v76 = v69;
                  do
                  {
                    if (*(void *)v102 != v74) {
                      objc_enumerationMutation(v72);
                    }
                    uint64_t v77 = *(void *)(*((void *)&v101 + 1) + 8 * v75);
                    long long v78 = [v100 objectAtIndexedSubscript:v56];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      long long v79 = [v78 objectForKeyedSubscript:v77];

                      long long v80 = [v97 entryKey];
                      int v81 = +[PLUtilities logModeForEntryKey:v80 withKey:v77 andValue:v79];

                      if (v81 == 3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        long long v78 = [v79 lastPathComponent];
                      }
                      else
                      {
                        long long v78 = v79;
                      }
                    }
                    id v82 = [v99 objectForKeyedSubscript:@"key"];
                    int v83 = [v82 objectForKeyedSubscript:v77];
                    uint64_t v84 = [v83 objectForKeyedSubscript:@"Type"];
                    -[PLSQLStatement bindValue:withFormater:atPosition:](v98, "bindValue:withFormater:atPosition:", v78, [v84 shortValue], v76 + v75);

                    ++v75;
                  }
                  while (v73 != v75);
                  uint64_t v73 = [v72 countByEnumeratingWithState:&v101 objects:v115 count:16];
                  LODWORD(v69) = v76 + v75;
                }
                while (v73);
              }
            }
            else
            {
              id v72 = [v100 objectAtIndexedSubscript:v56];
              [(PLSQLStatement *)v98 bindValue:v72 withFormater:1 atPosition:v69];
            }

            uint64_t v85 = [(PLSQLiteConnection *)v94 performStatement:v98];
            v86 = v85;
            if ((!v85 || ![v85 count])
              && +[PLDefaults debugEnabled])
            {
              v87 = NSString;
              v88 = [v97 entryKey];
              uint64_t v89 = [v87 stringWithFormat:@"Empty insert ID: Error while inserting dynamic entry for %@", v88];

              v90 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
              v91 = [v90 lastPathComponent];
              v92 = [NSString stringWithUTF8String:"-[PLSQLiteConnection writeDynamicEntries:]"];
              +[PLCoreStorage logMessage:v89 fromFile:v91 fromFunction:v92 fromLineNumber:1579];

              v93 = PLLogCommon();
              if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v114 = v89;
                _os_log_debug_impl(&dword_1BBD2F000, v93, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }
            }
          }

          ++v56;
        }
        while ([v100 count] > v56);
      }
      [(PLSQLiteConnection *)v94 endTransaction];

      goto LABEL_74;
    }
    int v16 = objc_opt_new();
    uint64_t v17 = [v97 entryKey];
    objc_msgSend(v16, "appendFormat:", @"INSERT INTO \"%@_%@\" (\"FK_ID\", \"value\"), v17, CFSTR("Dynamic"");

    id v18 = objc_opt_new();
    -[NSObject appendString:](v18, "appendString:", @"(?, ?");
    uint64_t v19 = [v6 objectForKeyedSubscript:@"unit"];

    if (v19)
    {
      [v16 appendString:@", \"unit\""];
      [v18 appendString:@", ?"];
    }
    int v20 = [v6 objectForKeyedSubscript:@"key"];
    objc_opt_class();
    char v21 = objc_opt_isKindOfClass();

    if (v21)
    {
      __int16 v22 = [v6 objectForKeyedSubscript:@"key"];
      unint64_t v23 = [v22 allKeys];
      id v24 = [v23 sortedArrayUsingSelector:sel_compare_];

      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      obuint64_t j = v24;
      uint64_t v25 = [obj countByEnumeratingWithState:&v109 objects:v116 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v110;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v110 != v26) {
              objc_enumerationMutation(obj);
            }
            [v16 appendFormat:@", \"%@\"", *(void *)(*((void *)&v109 + 1) + 8 * i)];
            [v18 appendString:@", ?"];
          }
          uint64_t v25 = [obj countByEnumeratingWithState:&v109 objects:v116 count:16];
        }
        while (v25);
      }
    }
    else
    {
      [v16 appendString:@", \"key\""];
      [v18 appendString:@", ?"];
      obuint64_t j = 0;
    }
    [v18 appendString:@""]);
    [v16 appendString:@" VALUES "]);
    [v16 appendString:v18];
    [v16 appendString:@";"];
    *(_DWORD *)buf = 0;
    unint64_t v35 = [PLSQLStatement alloc];
    uint64_t v36 = [(PLSQLiteConnection *)v94 dbConnection];
    int v37 = [(PLSQLiteConnection *)v94 dbSem];
    v98 = [(PLSQLStatement *)v35 initWithSQLQuery:v16 forDatabase:v36 withDBSem:v37 result:buf];

    if (v98)
    {
      uint64_t v38 = [(PLSQLiteConnection *)v94 preparedDynamicStatements];
      objc_sync_enter(v38);
      int v39 = [(PLSQLiteConnection *)v94 preparedDynamicStatements];
      uint64_t v40 = [v97 entryKey];
      [v39 setObject:v98 forKeyedSubscript:v40];

      objc_sync_exit(v38);
    }
    else
    {
      if (!+[PLDefaults debugEnabled])
      {
LABEL_34:
        if (+[PLDefaults debugEnabled])
        {
          uint64_t v48 = objc_opt_class();
          v106[0] = MEMORY[0x1E4F143A8];
          v106[1] = 3221225472;
          v106[2] = __42__PLSQLiteConnection_writeDynamicEntries___block_invoke;
          v106[3] = &unk_1E6253EC0;
          v107 = @"writeDynamic";
          uint64_t v108 = v48;
          if (writeDynamicEntries__defaultOnce != -1) {
            dispatch_once(&writeDynamicEntries__defaultOnce, v106);
          }
          BOOL v49 = writeDynamicEntries__classDebugEnabled == 0;

          if (!v49)
          {
            uint64_t v50 = [NSString stringWithFormat:@"writeDynamic=%@", v16];
            v51 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
            uint64_t v52 = [v51 lastPathComponent];
            id v53 = [NSString stringWithUTF8String:"-[PLSQLiteConnection writeDynamicEntries:]"];
            +[PLCoreStorage logMessage:v50 fromFile:v52 fromFunction:v53 fromLineNumber:1523];

            uint64_t v54 = PLLogCommon();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
              -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
            }
          }
        }
        if (*(_DWORD *)buf == 11) {
          +[PLUtilities exitWithReason:1001 connection:v94];
        }
        goto LABEL_43;
      }
      int v41 = [NSString stringWithFormat:@"Prepare statement fail: entry=%@", v97];
      uint64_t v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      v43 = [v42 lastPathComponent];
      uint64_t v44 = [NSString stringWithUTF8String:"-[PLSQLiteConnection writeDynamicEntries:]"];
      +[PLCoreStorage logMessage:v41 fromFile:v43 fromFunction:v44 fromLineNumber:1515];

      uint64_t v45 = PLLogCommon();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      uint64_t v46 = NSString;
      uint64_t v38 = [v97 entryKey];
      int v47 = [v46 stringWithFormat:@"%@_%@", v38, @"Dynamic"];
      [(PLSQLiteConnection *)v94 displaySchema:v47];
    }
    goto LABEL_34;
  }
  [(PLSQLiteConnection *)self writeDynamicEntriesToPPS:v4];
LABEL_75:
}

- (NSMutableDictionary)preparedDynamicStatements
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)endTransaction
{
  id v3 = [(PLSQLiteConnection *)self transactionLock];
  objc_sync_enter(v3);
  if ([(PLSQLiteConnection *)self isTransactionInProgress])
  {
    [(PLSQLiteConnection *)self setTransactionInProgress:[(PLSQLiteConnection *)self transactionInProgress] - 1];
    if (![(PLSQLiteConnection *)self isTransactionInProgress]) {
      id v4 = [(PLSQLiteConnection *)self performQuery:@"END TRANSACTION;"];
    }
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__PLSQLiteConnection_endTransaction__block_invoke;
    block[3] = &unk_1E6253EC0;
    BOOL v13 = @"transactions";
    uint64_t v14 = v5;
    if (endTransaction_defaultOnce != -1) {
      dispatch_once(&endTransaction_defaultOnce, block);
    }
    int v6 = endTransaction_classDebugEnabled;

    if (v6)
    {
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"endTransaction counter=%d", -[PLSQLiteConnection transactionInProgress](self, "transactionInProgress"));
      unint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      uint64_t v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLSQLiteConnection endTransaction]"];
      +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:1141];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  objc_sync_exit(v3);
}

- (BOOL)isTransactionInProgress
{
  return [(PLSQLiteConnection *)self transactionInProgress] > 0;
}

- (int)transactionInProgress
{
  return self->_transactionInProgress;
}

- (void)beginTransaction
{
  id v3 = [(PLSQLiteConnection *)self transactionLock];
  objc_sync_enter(v3);
  if (![(PLSQLiteConnection *)self isTransactionInProgress]) {
    id v4 = [(PLSQLiteConnection *)self performQuery:@"BEGIN TRANSACTION;"];
  }
  [(PLSQLiteConnection *)self setTransactionInProgress:[(PLSQLiteConnection *)self transactionInProgress] + 1];
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__PLSQLiteConnection_beginTransaction__block_invoke;
    block[3] = &unk_1E6253EC0;
    BOOL v13 = @"transactions";
    uint64_t v14 = v5;
    if (beginTransaction_defaultOnce != -1) {
      dispatch_once(&beginTransaction_defaultOnce, block);
    }
    int v6 = beginTransaction_classDebugEnabled;

    if (v6)
    {
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"beginTransaction counter=%d", -[PLSQLiteConnection transactionInProgress](self, "transactionInProgress"));
      unint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      uint64_t v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLSQLiteConnection beginTransaction]"];
      +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:1126];

      v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  objc_sync_exit(v3);
}

- (NSString)transactionLock
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTransactionInProgress:(int)a3
{
  self->_transactionInProgress = a3;
}

- (void)updateEntry:(id)a3
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v87 = a3;
  id v3 = [v87 definedKeys];
  if ([v3 count])
  {
    id v4 = [v87 entryKey];
    BOOL v5 = +[PLEntryDefinition cacheSQLPrepareStatementForEntryKey:v4];

    BOOL v85 = v5;
    if (!v5) {
      goto LABEL_11;
    }
    int v6 = [(PLSQLiteConnection *)self preparedUpdateStatements];
    objc_sync_enter(v6);
    uint64_t v7 = [(PLSQLiteConnection *)self preparedUpdateStatements];
    unint64_t v8 = [v87 entryKey];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    objc_sync_exit(v6);
    if (v9)
    {
      if (!+[PLDefaults debugEnabled]) {
        goto LABEL_40;
      }
      uint64_t v10 = objc_opt_class();
      v90[0] = MEMORY[0x1E4F143A8];
      v90[1] = 3221225472;
      v90[2] = __34__PLSQLiteConnection_updateEntry___block_invoke_668;
      v90[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v90[4] = v10;
      if (updateEntry__defaultOnce_666 != -1) {
        dispatch_once(&updateEntry__defaultOnce_666, v90);
      }
      if (!updateEntry__classDebugEnabled_667) {
        goto LABEL_40;
      }
      v11 = NSString;
      v12 = [v87 entryKey];
      BOOL v13 = [v11 stringWithFormat:@"Reusing cached updated statement for %@", v12];

      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      uint64_t v15 = [v14 lastPathComponent];
      int v16 = [NSString stringWithUTF8String:"-[PLSQLiteConnection updateEntry:]"];
      +[PLCoreStorage logMessage:v13 fromFile:v15 fromFunction:v16 fromLineNumber:1708];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
    else
    {
LABEL_11:
      id v18 = (void *)MEMORY[0x1E4F28E78];
      uint64_t v19 = [v87 entryKey];
      BOOL v13 = [v18 stringWithFormat:@"UPDATE '%@' SET ", v19];

      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v20 = v3;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v92 objects:v98 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v93;
        char v23 = 1;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v93 != v22) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v92 + 1) + 8 * i);
            if ((v23 & 1) == 0) {
              [v13 appendString:@", "];
            }
            [v13 appendFormat:@"\"%@\"=?", v25];
            char v23 = 0;
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v92 objects:v98 count:16];
          char v23 = 0;
        }
        while (v21);

        [v13 appendString:@", "];
      }
      else
      {
      }
      [v13 appendString:@"\"timestamp\"=?"];
      [v13 appendString:@" WHERE \"ID\" == ?"];
      *(_DWORD *)buf = 0;
      uint64_t v26 = [PLSQLStatement alloc];
      uint64_t v27 = [(PLSQLiteConnection *)self dbConnection];
      char v28 = [(PLSQLiteConnection *)self dbSem];
      uint64_t v9 = [(PLSQLStatement *)v26 initWithSQLQuery:v13 forDatabase:v27 withDBSem:v28 result:buf];

      if (!v9 && +[PLDefaults debugEnabled])
      {
        uint64_t v29 = [NSString stringWithFormat:@"Prepare statement fail: entry=%@", v87];
        uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
        id v31 = [v30 lastPathComponent];
        int v32 = [NSString stringWithUTF8String:"-[PLSQLiteConnection updateEntry:]"];
        +[PLCoreStorage logMessage:v29 fromFile:v31 fromFunction:v32 fromLineNumber:1688];

        long long v33 = PLLogCommon();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }

        long long v34 = [v87 entryKey];
        [(PLSQLiteConnection *)self displaySchema:v34];
      }
      if (*(_DWORD *)buf == 11) {
        +[PLUtilities exitWithReason:1001 connection:self];
      }
      if (!v9)
      {
        long long v78 = NSString;
        long long v79 = [v87 entryKey];
        long long v80 = [v78 stringWithFormat:@"ERROR: prepared update statement failed for %@", v79];

        int v81 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
        id v82 = [v81 lastPathComponent];
        int v83 = [NSString stringWithUTF8String:"-[PLSQLiteConnection updateEntry:]"];
        +[PLCoreStorage logMessage:v80 fromFile:v82 fromFunction:v83 fromLineNumber:1704];

        uint64_t v84 = PLLogCommon();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }

        uint64_t v9 = 0;
LABEL_72:

        goto LABEL_73;
      }
      if (v85)
      {
        if (+[PLDefaults debugEnabled])
        {
          uint64_t v35 = objc_opt_class();
          v91[0] = MEMORY[0x1E4F143A8];
          v91[1] = 3221225472;
          v91[2] = __34__PLSQLiteConnection_updateEntry___block_invoke;
          v91[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v91[4] = v35;
          if (updateEntry__defaultOnce != -1) {
            dispatch_once(&updateEntry__defaultOnce, v91);
          }
          if (updateEntry__classDebugEnabled)
          {
            uint64_t v36 = NSString;
            int v37 = [v87 entryKey];
            uint64_t v38 = [v36 stringWithFormat:@"Caching update statement for %@", v37];

            int v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
            uint64_t v40 = [v39 lastPathComponent];
            int v41 = [NSString stringWithUTF8String:"-[PLSQLiteConnection updateEntry:]"];
            +[PLCoreStorage logMessage:v38 fromFile:v40 fromFunction:v41 fromLineNumber:1698];

            uint64_t v42 = PLLogCommon();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
              -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
            }
          }
        }
        v43 = [(PLSQLiteConnection *)self preparedUpdateStatements];
        objc_sync_enter(v43);
        uint64_t v44 = [(PLSQLiteConnection *)self preparedUpdateStatements];
        uint64_t v45 = [v87 entryKey];
        [v44 setObject:v9 forKeyedSubscript:v45];

        objc_sync_exit(v43);
      }
    }

LABEL_40:
    if ([v3 count])
    {
      uint64_t v46 = 0;
      while (1)
      {
        int v47 = [v3 objectAtIndexedSubscript:v46];
        uint64_t v48 = [v87 objectForKeyedSubscript:v47];

        BOOL v49 = [v3 objectAtIndexedSubscript:v46];
        uint64_t v50 = [v87 formaterForKey:v49];

        v51 = [v87 entryKey];
        uint64_t v52 = [v3 objectAtIndexedSubscript:v46];
        int v53 = +[PLUtilities logModeForEntryKey:v51 withKey:v52 andValue:v48];

        if (v53)
        {
          if (v53 == 1)
          {
            if (!+[PLDefaults debugEnabled]) {
              goto LABEL_62;
            }
            uint64_t v55 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __34__PLSQLiteConnection_updateEntry___block_invoke_674;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            void block[4] = v55;
            if (updateEntry__defaultOnce_672 != -1) {
              dispatch_once(&updateEntry__defaultOnce_672, block);
            }
            if (!updateEntry__classDebugEnabled_673) {
              goto LABEL_62;
            }
            unint64_t v56 = NSString;
            uint64_t v57 = [v87 entryKey];
            v58 = [v3 objectAtIndexedSubscript:v46];
            uint64_t v59 = [v56 stringWithFormat:@"Allowlist denied: entry = %@ key = %@ value = %@ withFormatter = %hd", v57, v58, v48, (int)v50];

            BOOL v60 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
            long long v61 = [v60 lastPathComponent];
            long long v62 = [NSString stringWithUTF8String:"-[PLSQLiteConnection updateEntry:]"];
            +[PLCoreStorage logMessage:v59 fromFile:v61 fromFunction:v62 fromLineNumber:1728];

            long long v63 = PLLogCommon();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v97 = v59;
              _os_log_debug_impl(&dword_1BBD2F000, v63, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
LABEL_61:

            goto LABEL_62;
          }
          if (v53 != 3)
          {
            if (!+[PLDefaults debugEnabled]) {
              goto LABEL_62;
            }
            uint64_t v64 = objc_opt_class();
            v88[0] = MEMORY[0x1E4F143A8];
            v88[1] = 3221225472;
            v88[2] = __34__PLSQLiteConnection_updateEntry___block_invoke_680;
            v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v88[4] = v64;
            if (updateEntry__defaultOnce_678 != -1) {
              dispatch_once(&updateEntry__defaultOnce_678, v88);
            }
            if (!updateEntry__classDebugEnabled_679) {
              goto LABEL_62;
            }
            v65 = NSString;
            int v66 = [v87 entryKey];
            id v67 = [v3 objectAtIndexedSubscript:v46];
            uint64_t v59 = [v65 stringWithFormat:@"Allowlist denied error case: entry = %@ key = %@ value = %@ withFormatter = %hd", v66, v67, v48, (int)v50];

            uint64_t v68 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
            uint64_t v69 = [v68 lastPathComponent];
            long long v70 = [NSString stringWithUTF8String:"-[PLSQLiteConnection updateEntry:]"];
            +[PLCoreStorage logMessage:v59 fromFile:v69 fromFunction:v70 fromLineNumber:1731];

            long long v63 = PLLogCommon();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v97 = v59;
              _os_log_debug_impl(&dword_1BBD2F000, v63, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
            goto LABEL_61;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v54 = [v48 lastPathComponent];

            uint64_t v48 = (void *)v54;
          }
        }
        [(PLSQLStatement *)v9 bindValue:v48 withFormater:v50 atPosition:(v46 + 1)];
LABEL_62:

        if ([v3 count] <= (unint64_t)++v46) {
          goto LABEL_65;
        }
      }
    }
    LODWORD(v46) = 0;
LABEL_65:
    char v71 = NSNumber;
    id v72 = [v87 entryDate];
    [v72 timeIntervalSince1970];
    uint64_t v73 = objc_msgSend(v71, "numberWithDouble:");
    [(PLSQLStatement *)v9 bindValue:v73 withFormater:6 atPosition:(v46 + 1)];

    uint64_t v74 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v87, "entryID"));
    [(PLSQLStatement *)v9 bindValue:v74 withFormater:5 atPosition:(v46 + 2)];

    id v75 = [(PLSQLiteConnection *)self performStatement:v9];
    if ([v87 hasArrayKeys])
    {
      uint64_t v76 = [v87 entryKey];
      -[PLSQLiteConnection deleteArrayEntriesForKey:withRowID:](self, "deleteArrayEntriesForKey:withRowID:", v76, [v87 entryID]);

      [(PLSQLiteConnection *)self writeArrayEntries:v87];
    }
    if ([v87 hasDynamicKeys])
    {
      uint64_t v77 = [v87 entryKey];
      -[PLSQLiteConnection deleteDynamicEntriesForKey:withRowID:](self, "deleteDynamicEntriesForKey:withRowID:", v77, [v87 entryID]);

      [(PLSQLiteConnection *)self writeDynamicEntries:v87];
    }
    goto LABEL_72;
  }
LABEL_73:
}

- (NSMutableDictionary)preparedUpdateStatements
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)deleteDynamicEntriesForKey:(id)a3 withRowID:(int64_t)a4
{
  objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM '%@_%@' WHERE FK_ID=%lld;",
    a3,
    @"Dynamic",
  BOOL v5 = a4);
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__PLSQLiteConnection_deleteDynamicEntriesForKey_withRowID___block_invoke;
    block[3] = &unk_1E6253EC0;
    uint64_t v15 = @"delete";
    uint64_t v16 = v6;
    if (deleteDynamicEntriesForKey_withRowID__defaultOnce != -1) {
      dispatch_once(&deleteDynamicEntriesForKey_withRowID__defaultOnce, block);
    }
    int v7 = deleteDynamicEntriesForKey_withRowID__classDebugEnabled;

    if (v7)
    {
      unint64_t v8 = [NSString stringWithFormat:@"sqlDelete=%@", v5];
      uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      uint64_t v10 = [v9 lastPathComponent];
      v11 = [NSString stringWithUTF8String:"-[PLSQLiteConnection deleteDynamicEntriesForKey:withRowID:]"];
      +[PLCoreStorage logMessage:v8 fromFile:v10 fromFunction:v11 fromLineNumber:1771];

      v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  id v13 = [(PLSQLiteConnection *)self performQuery:v5];
}

- (void)loadDynamicValuesIntoEntry:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 hasDynamicKeys])
  {
    BOOL v5 = NSString;
    uint64_t v6 = [v4 entryKey];
    uint64_t v7 = [v5 stringWithFormat:@"SELECT * FROM '%@_%@' WHERE \"FK_ID\"==\"%lld\", v6, @"Dynamic", objc_msgSend(v4, "entryID"")];

    uint64_t v27 = (void *)v7;
    unint64_t v8 = [(PLSQLiteConnection *)self performQuery:v7];
    uint64_t v9 = [v4 entryKey];
    uint64_t v10 = +[PLEntryDefinition dynamicKeyConfigsForEntryKey:v9];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obuint64_t j = v8;
    uint64_t v31 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v31)
    {
      uint64_t v11 = *(void *)v37;
      uint64_t v28 = *(void *)v37;
      uint64_t v29 = v10;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v37 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v14 = [v10 objectForKeyedSubscript:@"key"];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            uint64_t v16 = [v10 objectForKeyedSubscript:@"key"];
            uint64_t v17 = [v16 allKeys];
            id v18 = [v17 sortedArrayUsingSelector:sel_compare_];

            long long v34 = 0u;
            long long v35 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            id v19 = v18;
            uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v33;
              do
              {
                for (uint64_t j = 0; j != v21; ++j)
                {
                  if (*(void *)v33 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  id v24 = [v13 objectForKeyedSubscript:*(void *)(*((void *)&v32 + 1) + 8 * j)];
                  uint64_t v25 = [v13 objectForKeyedSubscript:@"value"];
                  [v4 setObject:v25 forKeyedSubscript:v24];
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
              }
              while (v21);
              uint64_t v26 = v19;
              uint64_t v11 = v28;
              uint64_t v10 = v29;
            }
            else
            {
              uint64_t v26 = v19;
            }
          }
          else
          {
            uint64_t v26 = [v13 objectForKeyedSubscript:@"Key"];
            id v19 = [v13 objectForKeyedSubscript:@"value"];
            [v4 setObject:v19 forKeyedSubscript:v26];
          }
        }
        uint64_t v31 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v31);
    }
  }
}

- (void)loadArrayValuesIntoEntry:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 hasArrayKeys])
  {
    [v3 arrayKeys];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v22)
    {
      uint64_t v19 = *(void *)v28;
      uint64_t v20 = v3;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void *)(*((void *)&v27 + 1) + 8 * v4);
          uint64_t v6 = NSString;
          uint64_t v7 = [v3 entryKey];
          unint64_t v8 = [v6 stringWithFormat:@"SELECT value FROM '%@_Array_%@' WHERE \"FK_ID\"==\"%lld\", v7, v5, objc_msgSend(v3, "entryID"")];

          uint64_t v9 = [(PLSQLiteConnection *)self performQuery:v8];
          uint64_t v10 = objc_opt_new();
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v11 = v9;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v24;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v24 != v14) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v16 = [*(id *)(*((void *)&v23 + 1) + 8 * v15) objectForKeyedSubscript:@"value"];
                [v10 addObject:v16];

                ++v15;
              }
              while (v13 != v15);
              uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v13);
          }

          if ([v10 count]) {
            uint64_t v17 = v10;
          }
          else {
            uint64_t v17 = 0;
          }
          id v3 = v20;
          [v20 setObject:v17 forKeyedSubscript:v5];

          ++v4;
        }
        while (v4 != v22);
        uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v22);
    }
  }
}

+ (void)removeAdditionalFiles:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  uint64_t v5 = [v3 defaultManager];
  uint64_t v6 = [v4 stringByAppendingString:@"-shm"];
  [v5 removeItemAtPath:v6 error:0];

  id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v7 = [v4 stringByAppendingString:@"-wal"];

  [v8 removeItemAtPath:v7 error:0];
}

+ (void)removeDBAtFilePath:(id)a3
{
  id v3 = a3;
  +[PLSQLiteConnection removeAdditionalFiles:v3];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v4 removeItemAtPath:v3 error:0];
}

+ (id)tableHasTimestampColumn
{
  if (tableHasTimestampColumn_onceToken != -1) {
    dispatch_once(&tableHasTimestampColumn_onceToken, &__block_literal_global_28_0);
  }
  v2 = (void *)tableHasTimestampColumn_tableHasTimestampColumn;
  return v2;
}

uint64_t __45__PLSQLiteConnection_tableHasTimestampColumn__block_invoke()
{
  tableHasTimestampColumn_tableHasTimestampColumn = [MEMORY[0x1E4F1CA60] dictionary];
  return MEMORY[0x1F41817F8]();
}

+ (id)tableHasTimestampColumnSem
{
  if (tableHasTimestampColumnSem_onceToken != -1) {
    dispatch_once(&tableHasTimestampColumnSem_onceToken, &__block_literal_global_31_0);
  }
  v2 = (void *)tableHasTimestampColumnSem_tableHasTimestampColumnSem;
  return v2;
}

uint64_t __48__PLSQLiteConnection_tableHasTimestampColumnSem__block_invoke()
{
  tableHasTimestampColumnSem_tableHasTimestampColumnSem = (uint64_t)dispatch_semaphore_create(1);
  return MEMORY[0x1F41817F8]();
}

- (PLSQLiteConnection)init
{
  id v3 = +[PLUtilities containerPath];
  id v4 = [v3 stringByAppendingString:@"/Library/BatteryLife/CurrentPowerlog.PLSQL"];
  uint64_t v5 = [(PLSQLiteConnection *)self initWithFilePath:v4];

  return v5;
}

- (PLSQLiteConnection)initWithFilePath:(id)a3
{
  return [(PLSQLiteConnection *)self initWithFilePath:a3 withCacheSize:50];
}

- (PLSQLiteConnection)initWithFilePath:(id)a3 withFlags:(id)a4
{
  return [(PLSQLiteConnection *)self initWithFilePath:a3 withCacheSize:50 withFlags:a4];
}

- (BOOL)commonInitProcessWithFilePath:(id)a3 withCacheSize:(int64_t)a4
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_filePath, a3);
  id v8 = (NSMutableDictionary *)objc_opt_new();
  preparedStatements = self->_preparedStatements;
  self->_preparedStatements = v8;

  uint64_t v10 = (NSMutableDictionary *)objc_opt_new();
  preparedUpdateStatements = self->_preparedUpdateStatements;
  self->_preparedUpdateStatements = v10;

  uint64_t v12 = (NSMutableDictionary *)objc_opt_new();
  preparedDynamicStatements = self->_preparedDynamicStatements;
  self->_preparedDynamicStatements = v12;

  self->_transactionInProgress = 0;
  transactionLock = self->_transactionLock;
  self->_transactionLock = (NSString *)@"_-transactionLock-_";

  uint64_t v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  uint64_t v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  cachedClassName = self->_cachedClassName;
  self->_cachedClassName = v16;

  self->_cacheSize = a4;
  id v18 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  dbSem = self->_dbSem;
  self->_dbSem = v18;

  int v20 = sqlite3_initialize();
  if (!v20)
  {
    uint64_t v21 = +[PLUtilities containerPath];
    uint64_t v22 = [v21 stringByAppendingString:@"/Library/BatteryLife/CurrentPowerlog.PLSQL"];
    if ([v7 isEqualToString:v22])
    {
      long long v23 = [MEMORY[0x1E4F28CB8] defaultManager];
      long long v24 = +[PLUtilities containerPath];
      long long v25 = [v24 stringByAppendingString:@"/Library/Logs/CurrentPowerlog.PLSQL"];
      int v26 = [v23 fileExistsAtPath:v25];

      if (!v26) {
        goto LABEL_7;
      }
      long long v27 = [MEMORY[0x1E4F28CB8] defaultManager];
      long long v28 = +[PLUtilities containerPath];
      long long v29 = [v28 stringByAppendingString:@"/Library/BatteryLife/CurrentPowerlog.PLSQL"];
      [v27 removeItemAtPath:v29 error:0];

      long long v30 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v31 = +[PLUtilities containerPath];
      long long v32 = [v31 stringByAppendingString:@"/Library/Logs/CurrentPowerlog.PLSQL"];
      uint64_t v33 = +[PLUtilities containerPath];
      long long v34 = [v33 stringByAppendingString:@"/Library/BatteryLife/CurrentPowerlog.PLSQL"];
      [v30 moveItemAtPath:v32 toPath:v34 error:0];

      long long v35 = [MEMORY[0x1E4F28CB8] defaultManager];
      long long v36 = +[PLUtilities containerPath];
      long long v37 = [v36 stringByAppendingString:@"/Library/BatteryLife/CurrentPowerlog.PLSQL-wal"];
      [v35 removeItemAtPath:v37 error:0];

      long long v38 = [MEMORY[0x1E4F28CB8] defaultManager];
      long long v39 = +[PLUtilities containerPath];
      uint64_t v40 = [v39 stringByAppendingString:@"/Library/Logs/CurrentPowerlog.PLSQL-wal"];
      int v41 = +[PLUtilities containerPath];
      uint64_t v42 = [v41 stringByAppendingString:@"/Library/BatteryLife/CurrentPowerlog.PLSQL-wal"];
      [v38 moveItemAtPath:v40 toPath:v42 error:0];

      v43 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v44 = +[PLUtilities containerPath];
      uint64_t v45 = [v44 stringByAppendingString:@"/Library/BatteryLife/CurrentPowerlog.PLSQL-shm"];
      [v43 removeItemAtPath:v45 error:0];

      uint64_t v21 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v22 = +[PLUtilities containerPath];
      uint64_t v46 = [v22 stringByAppendingString:@"/Library/Logs/CurrentPowerlog.PLSQL-shm"];
      int v47 = +[PLUtilities containerPath];
      uint64_t v48 = [v47 stringByAppendingString:@"/Library/BatteryLife/CurrentPowerlog.PLSQL-shm"];
      [v21 moveItemAtPath:v46 toPath:v48 error:0];
    }
    goto LABEL_7;
  }
  fprintf((FILE *)*MEMORY[0x1E4F143C8], "failed to initialize library: %d\n", v20);
LABEL_7:

  return v20 == 0;
}

- (PLSQLiteConnection)initWithFilePath:(id)a3 withCacheSize:(int64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLSQLiteConnection;
  id v7 = [(PLSQLiteConnection *)&v14 init];
  id v8 = v7;
  if (!v7)
  {
LABEL_13:
    uint64_t v12 = v8;
    goto LABEL_14;
  }
  if ([(PLSQLiteConnection *)v7 commonInitProcessWithFilePath:v6 withCacheSize:a4]&& [(PLSQLiteConnection *)v8 openCurrentFileWithCacheSize:a4])
  {
    uint64_t v9 = +[PLUtilities containerPath];
    uint64_t v10 = [v9 stringByAppendingString:@"/Library/BatteryLife/CurrentPowerlog.PLSQL"];
    if ([v6 isEqualToString:v10])
    {
      BOOL v11 = +[PLUtilities isPowerlogHelperd];

      if (!v11)
      {
        if (+[PLDefaults BOOLForKey:@"RunIntegrityCheck"]
          && ![(PLSQLiteConnection *)v8 passesIntegrityCheck])
        {
          +[PLUtilities exitWithReason:1001 connection:v8];
        }
        [(PLSQLiteConnection *)v8 scheduleIntegrityCheck];
      }
    }
    else
    {
    }
    [(PLSQLiteConnection *)v8 setJournalMode:+[PLDefaults BOOLForKey:@"DBModeWAL" ifNotSet:1] ^ 1];
    goto LABEL_13;
  }
  uint64_t v12 = 0;
LABEL_14:

  return v12;
}

- (PLSQLiteConnection)initWithFilePath:(id)a3 withCacheSize:(int64_t)a4 withFlags:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PLSQLiteConnection;
  uint64_t v10 = [(PLSQLiteConnection *)&v14 init];
  BOOL v11 = v10;
  if (!v10
    || [(PLSQLiteConnection *)v10 commonInitProcessWithFilePath:v8 withCacheSize:a4]&& [(PLSQLiteConnection *)v11 openCurrentFileWithCacheSize:a4 withFlags:v9])
  {
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)getIntegrityCheckCriteria
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  [(id)objc_opt_class() periodicIntegrityCheckInterval];
  id v3 = +[PLActivityCriterionTime timeCriterionWithInterval:](PLActivityCriterionTime, "timeCriterionWithInterval:");
  [v2 addObject:v3];

  if (!+[PLPlatform isDisplayClass:0xFFFFFFFFLL])
  {
    id v4 = +[PLActivityCriterionEntry displayOffCriterion];
    [v2 addObject:v4];
  }
  if (+[PLUtilities hasBattery])
  {
    uint64_t v5 = +[PLActivityCriterionEntry pluggedInCriterion];
    [v2 addObject:v5];
  }
  return v2;
}

- (void)scheduleIntegrityCheck
{
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  id v4 = dispatch_get_global_queue(-2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PLSQLiteConnection_scheduleIntegrityCheck__block_invoke;
  block[3] = &unk_1E62538C8;
  void block[4] = self;
  dispatch_after(v3, v4, block);
}

void __44__PLSQLiteConnection_scheduleIntegrityCheck__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) getIntegrityCheckCriteria];
  dispatch_time_t v3 = +[PLActivityScheduler sharedInstance];
  id v4 = +[PLActivityCriterionTime timeCriterionWithInterval:2592000.0];
  uint64_t v5 = dispatch_get_global_queue(-2, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PLSQLiteConnection_scheduleIntegrityCheck__block_invoke_2;
  v6[3] = &unk_1E62554D0;
  v6[4] = *(void *)(a1 + 32);
  [v3 scheduleActivityWithIdentifier:@"com.apple.powerlogd.integrity_check" withCriteria:v2 withMustRunCriterion:v4 withQueue:v5 withInterruptBlock:0 withActivityBlock:v6];
}

void __44__PLSQLiteConnection_scheduleIntegrityCheck__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PLSQLiteConnection_scheduleIntegrityCheck__block_invoke_3;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v7;
    if (kPLCacheSizeForBackupDatabaseConnection_block_invoke_defaultOnce != -1) {
      dispatch_once(&kPLCacheSizeForBackupDatabaseConnection_block_invoke_defaultOnce, block);
    }
    if (kPLCacheSizeForBackupDatabaseConnection_block_invoke_classDebugEnabled)
    {
      id v8 = [NSString stringWithFormat:@"Periodic integrity_check activity running"];
      id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      uint64_t v10 = [v9 lastPathComponent];
      BOOL v11 = [NSString stringWithUTF8String:"-[PLSQLiteConnection scheduleIntegrityCheck]_block_invoke_2"];
      +[PLCoreStorage logMessage:v8 fromFile:v10 fromFunction:v11 fromLineNumber:215];

      uint64_t v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  uint64_t v13 = (void *)os_transaction_create();
  objc_super v14 = (void *)MEMORY[0x1C1869120]();
  if (([*(id *)(a1 + 32) passesIntegrityCheck] & 1) == 0) {
    +[PLUtilities exitWithReason:1001 connection:*(void *)(a1 + 32)];
  }
  dispatch_time_t v15 = dispatch_time(0, 60000000000);
  uint64_t v16 = +[PLUtilities transactionWorkQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __44__PLSQLiteConnection_scheduleIntegrityCheck__block_invoke_77;
  v18[3] = &unk_1E62538C8;
  id v19 = v13;
  id v17 = v13;
  dispatch_after(v15, v16, v18);
}

BOOL __44__PLSQLiteConnection_scheduleIntegrityCheck__block_invoke_3(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  kPLCacheSizeForBackupDatabaseConnection_block_invoke_classDebugEnabled = result;
  return result;
}

+ (double)periodicIntegrityCheckInterval
{
  if (periodicIntegrityCheckInterval_onceToken != -1) {
    dispatch_once(&periodicIntegrityCheckInterval_onceToken, &__block_literal_global_80);
  }
  return *(double *)&periodicIntegrityCheckInterval_periodicIntegrityCheckInterval;
}

uint64_t __52__PLSQLiteConnection_periodicIntegrityCheckInterval__block_invoke()
{
  uint64_t result = +[PLDefaults doubleForKey:@"PLSQLiteConnection_periodicIntegrityCheckInterval" ifNotSet:604800.0];
  periodicIntegrityCheckInterval_periodicIntegrityCheckInterval = v1;
  return result;
}

- (BOOL)isIncrementalVacuumEnabled
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  dispatch_time_t v3 = [(PLSQLiteConnection *)self dbSem];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  sqlite3_exec_b();
  id v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *((unsigned __int8 *)v9 + 24);
    *(_DWORD *)buf = 67109120;
    int v13 = v5;
    _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "Incremental Vacuum is %d", buf, 8u);
  }

  id v6 = [(PLSQLiteConnection *)self dbSem];
  dispatch_semaphore_signal(v6);

  LOBYTE(v6) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v6;
}

uint64_t __48__PLSQLiteConnection_isIncrementalVacuumEnabled__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_column_int(a2, 0) == 2;
  return 0;
}

- (int)getCacheSpillValue
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  dispatch_time_t v3 = [(PLSQLiteConnection *)self dbSem];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  sqlite3_exec_b();
  id v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *((_DWORD *)v9 + 6);
    *(_DWORD *)buf = 67109120;
    int v13 = v5;
    _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "Cache spill is %d", buf, 8u);
  }

  id v6 = [(PLSQLiteConnection *)self dbSem];
  dispatch_semaphore_signal(v6);

  LODWORD(v6) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return (int)v6;
}

uint64_t __40__PLSQLiteConnection_getCacheSpillValue__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_column_int(a2, 0);
  return 0;
}

- (void)dealloc
{
  [(PLSQLiteConnection *)self closeConnection];
  v3.receiver = self;
  v3.super_class = (Class)PLSQLiteConnection;
  [(PLSQLiteConnection *)&v3 dealloc];
}

- (BOOL)openCurrentFile
{
  int64_t v3 = [(PLSQLiteConnection *)self cacheSize];
  return [(PLSQLiteConnection *)self openCurrentFileWithCacheSize:v3];
}

- (BOOL)openCurrentFileWithCacheSize:(int64_t)a3
{
  return [(PLSQLiteConnection *)self openCurrentFileWithCacheSize:a3 withFlags:0];
}

- (BOOL)openCurrentFileWithCacheSize:(int64_t)a3 withFlags:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PLSQLiteConnection openCurrentFileWithCacheSize:withFlags:](self);
  }

  if ([v6 count])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v48 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      int v11 = 0;
      uint64_t v12 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v38 != v12) {
            objc_enumerationMutation(v8);
          }
          v11 |= [*(id *)(*((void *)&v37 + 1) + 8 * i) intValue];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v48 count:16];
      }
      while (v10);
    }
    else
    {
      int v11 = 0;
    }
  }
  else
  {
    int v11 = 3145734;
  }
  uint64_t v14 = [(PLSQLiteConnection *)self dbSem];
  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

  id v15 = [(PLSQLiteConnection *)self filePath];
  int v16 = sqlite3_open_v2((const char *)[v15 UTF8String], &self->_dbConnection, v11, 0);
  int v41 = v16;

  id v17 = [(PLSQLiteConnection *)self dbSem];
  dispatch_semaphore_signal(v17);

  if (v16)
  {
    id v18 = PLLogCommon();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[PLSQLiteConnection openCurrentFileWithCacheSize:withFlags:]();
    }
    goto LABEL_18;
  }
  if (v11)
  {
    id v18 = PLLogCommon();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
LABEL_18:

      BOOL v19 = v16 == 0;
      goto LABEL_19;
    }
    *(_WORD *)buf = 0;
    long long v30 = "done initializing read-only connection";
    uint64_t v31 = v18;
    uint32_t v32 = 2;
LABEL_34:
    _os_log_impl(&dword_1BBD2F000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    goto LABEL_18;
  }
  uint64_t v21 = [(PLSQLiteConnection *)self filePath];
  +[PLUtilities setMobileOwnerForFile:v21];

  uint64_t v22 = PLLogCommon();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBD2F000, v22, OS_LOG_TYPE_DEFAULT, "Configure the page cache", buf, 2u);
  }

  long long v23 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA cache_size = %ld", a3);;
  id v24 = [(PLSQLiteConnection *)self performQuery:v23 returnValue:&v41 returnResult:0];

  BOOL v19 = 0;
  if (!v41)
  {
    long long v25 = PLLogCommon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v25, OS_LOG_TYPE_DEFAULT, "Configure the cache_spill", buf, 2u);
    }

    int v26 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA cache_spill = %ld", 640);;
    id v27 = [(PLSQLiteConnection *)self performQuery:v26 returnValue:&v41 returnResult:0];

    BOOL v19 = 0;
    if (!v41)
    {
      int v28 = [(PLSQLiteConnection *)self getCacheSpillValue];
      long long v29 = PLLogCommon();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        int v43 = v41;
        __int16 v44 = 2080;
        uint64_t v45 = 0;
        __int16 v46 = 1024;
        int v47 = v28;
        _os_log_impl(&dword_1BBD2F000, v29, OS_LOG_TYPE_DEFAULT, "Tuning cache spill for the db retun value %d and error %s val returned from query %d", buf, 0x18u);
      }

      if (!+[PLUtilities SwitchToIncrementalVacuumEnabled]|| [(PLSQLiteConnection *)self isIncrementalVacuumEnabled])
      {
        BOOL v19 = 1;
        goto LABEL_19;
      }
      uint64_t v33 = PLLogCommon();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBD2F000, v33, OS_LOG_TYPE_DEFAULT, "Configure auto_vacuum = 2", buf, 2u);
      }

      id v34 = objc_unsafeClaimAutoreleasedReturnValue(-[PLSQLiteConnection performQuery:returnValue:returnResult:](self, "performQuery:returnValue:returnResult:", @"PRAGMA auto_vacuum = 2;",
                &v41,
                0));
      BOOL v19 = 0;
      if (!v41)
      {
        long long v35 = PLLogCommon();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBD2F000, v35, OS_LOG_TYPE_DEFAULT, "Invoke VACUUM to ensure the transition to incremental_vacuum mode", buf, 2u);
        }

        id v36 = objc_unsafeClaimAutoreleasedReturnValue(-[PLSQLiteConnection performQuery:returnValue:returnResult:](self, "performQuery:returnValue:returnResult:", @"VACUUM;",
                  &v41,
                  0));
        BOOL v19 = 0;
        if (!v41)
        {
          id v18 = PLLogCommon();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_18;
          }
          *(_DWORD *)buf = 67109378;
          int v43 = v41;
          __int16 v44 = 2080;
          uint64_t v45 = 0;
          long long v30 = "Executed vacuum on db to switch to incremental vacuum - %d and %s ";
          uint64_t v31 = v18;
          uint32_t v32 = 18;
          goto LABEL_34;
        }
      }
    }
  }
LABEL_19:

  return v19;
}

- (void)printDBStatusString
{
  int pCur = 0;
  int pHiwtr = 0;
  sqlite3_db_status(self->_dbConnection, 0, &pCur, &pHiwtr, 0);
  NSLog(&cfstr_LookasideSlots.isa, pCur, pHiwtr);
  sqlite3_db_status(self->_dbConnection, 4, &pCur, &pHiwtr, 0);
  NSLog(&cfstr_SuccessfulLook.isa, pHiwtr);
  sqlite3_db_status(self->_dbConnection, 5, &pCur, &pHiwtr, 0);
  NSLog(&cfstr_LookasideSizeF.isa, pHiwtr);
  sqlite3_db_status(self->_dbConnection, 6, &pCur, &pHiwtr, 0);
  NSLog(&cfstr_LookasideOomFa.isa, pHiwtr);
  sqlite3_db_status(self->_dbConnection, 1, &pCur, &pHiwtr, 0);
  NSLog(&cfstr_PagerHeapUsage.isa, pCur);
  sqlite3_db_status(self->_dbConnection, 7, &pCur, &pHiwtr, 1);
  NSLog(&cfstr_PageCacheHitsD.isa, pCur);
  sqlite3_db_status(self->_dbConnection, 8, &pCur, &pHiwtr, 1);
  NSLog(&cfstr_PageCacheMisse.isa, pCur);
  sqlite3_db_status(self->_dbConnection, 9, &pCur, &pHiwtr, 1);
  NSLog(&cfstr_PageCacheWrite.isa, pCur);
  sqlite3_db_status(self->_dbConnection, 2, &pCur, &pHiwtr, 0);
  NSLog(&cfstr_SchemaHeapUsag.isa, pCur);
  sqlite3_db_status(self->_dbConnection, 3, &pCur, &pHiwtr, 0);
  NSLog(&cfstr_StatementHeapU.isa, pCur);
  sqlite3_status(0, &pCur, &pHiwtr, 0);
  NSLog(&cfstr_MemoryUsedByte.isa, pCur, pHiwtr);
  sqlite3_status(9, &pCur, &pHiwtr, 0);
  NSLog(&cfstr_OutstandingAll.isa, pCur, pHiwtr);
  sqlite3_status(2, &pCur, &pHiwtr, 0);
  NSLog(&cfstr_PcacheOverflow.isa, pCur, pHiwtr);
  sqlite3_status(4, &pCur, &pHiwtr, 0);
  NSLog(&cfstr_ScratchOverflo.isa, pCur, pHiwtr);
  sqlite3_status(5, &pCur, &pHiwtr, 0);
  NSLog(&cfstr_LargestAllocat.isa, pHiwtr);
  sqlite3_status(7, &pCur, &pHiwtr, 0);
  NSLog(&cfstr_LargestPcacheA.isa, pHiwtr);
  sqlite3_status(8, &pCur, &pHiwtr, 0);
  NSLog(&cfstr_LargestScratch.isa, pHiwtr);
}

- (BOOL)tableHasTimestampColumn:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(id)objc_opt_class() tableHasTimestampColumnSem];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  id v6 = [(id)objc_opt_class() tableHasTimestampColumn];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  id v8 = [(id)objc_opt_class() tableHasTimestampColumnSem];
  dispatch_semaphore_signal(v8);

  if (v7)
  {
    LOBYTE(v9) = [v7 BOOLValue];
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v10 = [(PLSQLiteConnection *)self tableInfo:v4];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v22 = v4;
      uint64_t v13 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [*(id *)(*((void *)&v23 + 1) + 8 * i) objectForKeyedSubscript:@"name"];
          char v16 = [v15 isEqualToString:@"timestamp"];

          if (v16)
          {
            uint64_t v9 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      uint64_t v9 = 0;
LABEL_13:
      id v4 = v22;
    }
    else
    {
      uint64_t v9 = 0;
    }

    id v17 = [(id)objc_opt_class() tableHasTimestampColumnSem];
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);

    id v18 = [NSNumber numberWithBool:v9];
    BOOL v19 = [(id)objc_opt_class() tableHasTimestampColumn];
    [v19 setObject:v18 forKeyedSubscript:v4];

    int v20 = [(id)objc_opt_class() tableHasTimestampColumnSem];
    dispatch_semaphore_signal(v20);
  }
  return v9;
}

- (void)clearTableHasTimestampColumnCache
{
  v2 = [(id)objc_opt_class() tableHasTimestampColumnSem];
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  int64_t v3 = [(id)objc_opt_class() tableHasTimestampColumn];
  [v3 removeAllObjects];

  id v4 = [(id)objc_opt_class() tableHasTimestampColumnSem];
  dispatch_semaphore_signal(v4);
}

- (int)rowCountForTable:(id)a3
{
  id v4 = a3;
  int v5 = @"FK_ID";
  if (([v4 containsString:@"_Dynamic"] & 1) == 0
    && ![v4 containsString:@"_Array_"])
  {
    int v5 = @"ID";
  }
  if ([v4 rangeOfString:@"'"] == 0x7FFFFFFFFFFFFFFFLL) {
    id v6 = @"SELECT count(%@) AS count FROM '%@';";
  }
  else {
    id v6 = @"SELECT count(%@) AS count FROM %@;";
  }
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", v6, v5, v4);
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    id v22 = __39__PLSQLiteConnection_rowCountForTable___block_invoke;
    long long v23 = &unk_1E6253EC0;
    long long v24 = @"mergeDBCount";
    uint64_t v25 = v8;
    if (rowCountForTable__defaultOnce != -1) {
      dispatch_once(&rowCountForTable__defaultOnce, &block);
    }
    int v9 = rowCountForTable__classDebugEnabled;

    if (v9)
    {
      uint64_t v10 = [NSString stringWithFormat:@"Counting %@ (%@)", v4, v7, block, v21, v22, v23];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      uint64_t v12 = [v11 lastPathComponent];
      uint64_t v13 = [NSString stringWithUTF8String:"-[PLSQLiteConnection rowCountForTable:]"];
      +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:438];

      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  id v15 = [(PLSQLiteConnection *)self performQuery:v7];
  if ([v15 count] == 1)
  {
    char v16 = [v15 objectAtIndexedSubscript:0];
    id v17 = [v16 objectForKeyedSubscript:@"count"];
    int v18 = [v17 intValue];
  }
  else
  {
    int v18 = 0;
  }

  return v18;
}

BOOL __39__PLSQLiteConnection_rowCountForTable___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  rowCountForTable__classDebugEnabled = result;
  return result;
}

- (id)sortedSqlFormatedColumnNamesForTableInsert:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = [NSString stringWithFormat:@"SELECT name FROM pragma_table_info('%@')", a3];
  int v5 = [(PLSQLiteConnection *)self performQuery:v4];

  id v6 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v27 + 1) + 8 * i) objectForKeyedSubscript:@"name"];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [v6 sortedArrayUsingSelector:sel_compare_];
  if (v13)
  {
    uint64_t v14 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v22 = v13;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          int v20 = *(void **)(*((void *)&v23 + 1) + 8 * j);
          if (([v20 isEqualToString:@"ID"] & 1) == 0
            && ([v20 isEqualToString:@"FK_ID"] & 1) == 0)
          {
            if ([v14 length]) {
              [v14 appendString:@", "];
            }
            [v14 appendFormat:@"%c%@%c", 39, v20, 39];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v17);
    }

    [v14 appendString:@""]);
    uint64_t v13 = v22;
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)sqlFormatedColumnNamesForTableInsert:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PLSQLiteConnection *)self tableInfo:a3];
  id v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [v9 objectForKeyedSubscript:@"name"];
        char v11 = [v10 isEqualToString:@"ID"];

        if ((v11 & 1) == 0)
        {
          if ([v4 length]) {
            [v4 appendString:@", "];
          }
          uint64_t v12 = [v9 objectForKeyedSubscript:@"name"];
          [v4 appendFormat:@"%c%@%c", 39, v12, 39];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)sqlFormatedColumnNamesForTableSelect:(id)a3 withSystemOffset:(double)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PLSQLiteConnection *)self tableInfo:a3];
  uint64_t v6 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        char v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v12 = [v11 objectForKeyedSubscript:@"name"];
        char v13 = [v12 isEqualToString:@"ID"];

        if ((v13 & 1) == 0)
        {
          if ([v6 length]) {
            [v6 appendString:@", "];
          }
          uint64_t v14 = [v11 objectForKeyedSubscript:@"name"];
          int v15 = [v14 isEqualToString:@"timestamp"];

          uint64_t v16 = [v11 objectForKeyedSubscript:@"name"];
          long long v17 = (void *)v16;
          if (v15) {
            [v6 appendFormat:@"%c%@%c - %f", 96, v16, 96, *(void *)&a4];
          }
          else {
            [v6 appendFormat:@"%c%@%c", 96, v16, 96, v19];
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  return v6;
}

- (void)removeTableNameFromMergeDB:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  uint64_t v6 = [v4 stringWithFormat:@"DROP TABLE mergeDB.'%@'", v5];
  id v7 = [(PLSQLiteConnection *)self performQuery:v6];

  objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM mergeDB.'PLCoreStorage_schemaVersions' WHERE tableName='%@';",
    v5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = [(PLSQLiteConnection *)self performQuery:v9];
}

- (void)enumerateAllTablesWithBlock:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v22 = (void (**)(id, void *, void *))a3;
  [NSString stringWithFormat:@"SELECT name FROM sqlite_master WHERE type=\"table\" AND name LIKE \"PL%%\" AND name NOT LIKE \"PLCoreStorage%%\";"];
  uint64_t v19 = v21 = self;
  -[PLSQLiteConnection performQuery:](self, "performQuery:");
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v31;
    uint64_t v20 = *(void *)v31;
    do
    {
      uint64_t v7 = 0;
      uint64_t v23 = v5;
      do
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v30 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x1C1869120]();
        uint64_t v10 = [v8 objectForKeyedSubscript:@"name"];
        if (([v10 containsStringInArray:&unk_1F1585BF8] & 1) == 0)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"SELECT name FROM sqlite_master WHERE type=\"table\" AND name LIKE \"%@%%\" AND (name LIKE \"%%_Array_%%\" OR name LIKE \"%%_Dynamic\") AND name != \"%@\";",
            v10,
          long long v25 = v10);
          char v11 = -[PLSQLiteConnection performQuery:](v21, "performQuery:");
          uint64_t v12 = objc_opt_new();
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v13 = v11;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v27;
            do
            {
              uint64_t v17 = 0;
              do
              {
                if (*(void *)v27 != v16) {
                  objc_enumerationMutation(v13);
                }
                long long v18 = [*(id *)(*((void *)&v26 + 1) + 8 * v17) objectForKeyedSubscript:@"name"];
                [v12 addObject:v18];

                ++v17;
              }
              while (v15 != v17);
              uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v15);
          }

          v22[2](v22, v10, v12);
          uint64_t v6 = v20;
          uint64_t v5 = v23;
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v5);
  }
}

- (int)rowCountForTableName:(id)a3
{
  id v4 = a3;
  if ([v4 rangeOfString:@"'"] == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v5 = @"SELECT count(ID) AS count FROM '%@';";
  }
  else {
    uint64_t v5 = @"SELECT count(ID) AS count FROM %@;";
  }
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", v5, v4);

  uint64_t v7 = [(PLSQLiteConnection *)self performQuery:v6];
  if ([v7 count] == 1)
  {
    id v8 = [v7 objectAtIndexedSubscript:0];
    id v9 = [v8 objectForKeyedSubscript:@"count"];
    int v10 = [v9 intValue];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (void)enumerateTablesWithBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [NSString stringWithFormat:@"SELECT name FROM sqlite_master WHERE type=\"table\" AND name NOT LIKE \"PLCoreStorage%%\" AND name NOT LIKE \"sqlite%%\""];;
  [(PLSQLiteConnection *)self performQuery:v5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        uint64_t v12 = (void *)MEMORY[0x1C1869120](v7);
        id v13 = objc_msgSend(v11, "objectForKeyedSubscript:", @"name", (void)v14);
        v4[2](v4, v13);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v8 = v7;
    }
    while (v7);
  }
}

- (void)mergeDataFromOtherDBFile:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = PLLogSQLiteConnection();
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 134349056;
      int64_t v29 = +[PLFileStats fileSizeAtPath:v4];
      _os_signpost_emit_with_name_impl(&dword_1BBD2F000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MergeDB", " preUnlockDBSize=%{public, signpost.telemetry:number1}lld enableTelemetry=YES ", buf, 0xCu);
    }

    *(_DWORD *)buf = 0;
    id v6 = [NSString stringWithFormat:@"ATTACH DATABASE '%@' AS mergeDB;", v4];
    id v7 = [(PLSQLiteConnection *)self performQuery:v6 returnValue:buf returnResult:0];
    int v8 = *(_DWORD *)buf;
    uint64_t v9 = PLLogCommon();
    uint64_t v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[PLSQLiteConnection mergeDataFromOtherDBFile:]();
      }
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v27 = 0;
        _os_log_impl(&dword_1BBD2F000, v10, OS_LOG_TYPE_INFO, "MERGE begins", v27, 2u);
      }

      [(PLSQLiteConnection *)self beginTransaction];
      +[PLUtilities getLastSystemTimeOffset];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_247;
      v26[3] = &unk_1E62558D0;
      v26[4] = self;
      v26[5] = v18;
      [(PLSQLiteConnection *)self enumerateTablesWithBlock:v26];
      [(PLSQLiteConnection *)self endTransaction];
      *(_DWORD *)buf = 0;
      id v19 = objc_unsafeClaimAutoreleasedReturnValue(-[PLSQLiteConnection performQuery:returnValue:returnResult:](self, "performQuery:returnValue:returnResult:", @"DETACH DATABASE mergeDB;",
                buf,
                0));
      int v20 = *(_DWORD *)buf;
      long long v21 = PLLogCommon();
      long long v22 = v21;
      if (v20)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[PLSQLiteConnection mergeDataFromOtherDBFile:]((int *)buf, v22);
        }
      }
      else if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v27 = 0;
        _os_log_impl(&dword_1BBD2F000, v22, OS_LOG_TYPE_INFO, "MERGE Complete", v27, 2u);
      }
    }
    AnalyticsSendEventLazy();
    uint64_t v23 = PLLogCommon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v27 = 0;
      _os_log_impl(&dword_1BBD2F000, v23, OS_LOG_TYPE_INFO, "MERGE Deleting pre unlock DB", v27, 2u);
    }

    +[PLSQLiteConnection removeDBAtFilePath:v4];
    long long v24 = PLLogSQLiteConnection();
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)long long v27 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBD2F000, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MergeDB", (const char *)&unk_1BBE53A31, v27, 2u);
    }

    long long v25 = PLLogCommon();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v27 = 0;
      _os_log_impl(&dword_1BBD2F000, v25, OS_LOG_TYPE_INFO, "MERGE Deleted the pre unlock db", v27, 2u);
    }
  }
  else
  {
    id v6 = PLLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PLSQLiteConnection mergeDataFromOtherDBFile:](v6, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

void *__47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke()
{
  return &unk_1F15873B8;
}

void __47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_247(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [NSString stringWithFormat:@"mergeDB.'%@'", v3];
  int v6 = [v4 rowCountForTableName:v5];

  if (v6 < 1)
  {
    long long v28 = *(void **)(a1 + 32);
    int64_t v29 = [NSString stringWithFormat:@"DROP TABLE mergeDB.'%@'", v3];
    id v30 = (id)[v28 performQuery:v29 returnValue:0 returnResult:0];
  }
  else
  {
    id v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)long long v32 = v3;
      *(_WORD *)&v32[8] = 1024;
      v33[0] = v6;
      _os_log_impl(&dword_1BBD2F000, v7, OS_LOG_TYPE_INFO, "MERGE : ****** copying %@ (%d)", buf, 0x12u);
    }

    int v8 = [*(id *)(a1 + 32) rowCountForTableName:v3];
    uint64_t v9 = [*(id *)(a1 + 32) sqlFormatedColumnNamesForTableInsert:v3];
    uint64_t v10 = [*(id *)(a1 + 32) sqlFormatedColumnNamesForTableSelect:v3 withSystemOffset:*(double *)(a1 + 40)];
    objc_msgSend(NSString, "stringWithFormat:", @"INSERT INTO '%@'(%@) SELECT %@ FROM mergeDB.'%@';",
      v3,
      v9,
      v10,
    uint64_t v11 = v3);
    uint64_t v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_247_cold_3();
    }

    id v13 = (id)[*(id *)(a1 + 32) performQuery:v11 returnValue:0 returnResult:0];
    int v14 = [*(id *)(a1 + 32) rowCountForTableName:v3];
    uint64_t v15 = PLLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)long long v32 = v8;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v14;
      LOWORD(v33[0]) = 1024;
      *(_DWORD *)((char *)v33 + 2) = v6;
      _os_log_impl(&dword_1BBD2F000, v15, OS_LOG_TYPE_INFO, "MERGE : startCount=%d endCount=%d rowCount=%d", buf, 0x14u);
    }

    if (v8 + v6 != v14)
    {
      uint64_t v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_247_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);
      }
    }
    long long v24 = *(void **)(a1 + 32);
    long long v25 = [NSString stringWithFormat:@"DROP TABLE mergeDB.'%@'", v3];
    id v26 = (id)[v24 performQuery:v25 returnValue:0 returnResult:0];

    long long v27 = PLLogCommon();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      __47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_247_cold_1();
    }
  }
}

void *__47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_258()
{
  return &unk_1F15873E0;
}

void *__47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_268()
{
  return &unk_1F1587408;
}

- (void)trimAllTablesFromDate:(id)a3 toDate:(id)a4
{
}

- (void)trimAllTablesFromDate:(id)a3 toDate:(id)a4 withTableFilters:(id)a5
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v63 = a4;
  id v67 = a5;
  unint64_t v9 = 0x1E6253000uLL;
  id v71 = v8;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __68__PLSQLiteConnection_trimAllTablesFromDate_toDate_withTableFilters___block_invoke;
    v94[3] = &unk_1E6253EC0;
    uint64_t v96 = v10;
    long long v95 = @"trimming";
    if (trimAllTablesFromDate_toDate_withTableFilters__defaultOnce != -1) {
      dispatch_once(&trimAllTablesFromDate_toDate_withTableFilters__defaultOnce, v94);
    }
    int v11 = trimAllTablesFromDate_toDate_withTableFilters__classDebugEnabled;

    if (v11)
    {
      uint64_t v12 = [NSString stringWithFormat:@"trimming from %@ to %@", v8, v63];
      id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      int v14 = [v13 lastPathComponent];
      uint64_t v15 = [NSString stringWithUTF8String:"-[PLSQLiteConnection trimAllTablesFromDate:toDate:withTableFilters:]"];
      +[PLCoreStorage logMessage:v12 fromFile:v14 fromFunction:v15 fromLineNumber:652];

      uint64_t v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      id v8 = v71;
    }
  }
  if (v8 || v63 || v67)
  {
    int64_t v17 = +[PLDefaults longForKey:@"trimLimit" ifNotSet:1000];
    long long v61 = [NSString stringWithFormat:@"SELECT name FROM sqlite_master WHERE type=\"table\" AND name NOT LIKE \"PLCoreStorage%%\" AND name NOT LIKE \"sqlite%%\""];;
    -[PLSQLiteConnection performQuery:](self, "performQuery:");
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [obj countByEnumeratingWithState:&v90 objects:v101 count:16];
    if (!v18) {
      goto LABEL_71;
    }
    uint64_t v19 = v18;
    uint64_t v66 = *(void *)v91;
    id v72 = self;
    int64_t v73 = v17;
    while (1)
    {
      uint64_t v20 = 0;
      uint64_t v62 = v19;
      do
      {
        if (*(void *)v91 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v70 = v20;
        uint64_t v21 = *(void **)(*((void *)&v90 + 1) + 8 * v20);
        context = (void *)MEMORY[0x1C1869120]();
        if ([*(id *)(v9 + 936) debugEnabled])
        {
          uint64_t v22 = objc_opt_class();
          v87[0] = MEMORY[0x1E4F143A8];
          v87[1] = 3221225472;
          v87[2] = __68__PLSQLiteConnection_trimAllTablesFromDate_toDate_withTableFilters___block_invoke_289;
          v87[3] = &unk_1E6253EC0;
          v88 = @"trimming";
          uint64_t v89 = v22;
          if (trimAllTablesFromDate_toDate_withTableFilters__defaultOnce_287 != -1) {
            dispatch_once(&trimAllTablesFromDate_toDate_withTableFilters__defaultOnce_287, v87);
          }
          int v23 = trimAllTablesFromDate_toDate_withTableFilters__classDebugEnabled_288;

          if (v23)
          {
            long long v24 = [NSString stringWithFormat:@"trimming table %@", v21];
            long long v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
            id v26 = [v25 lastPathComponent];
            long long v27 = [NSString stringWithUTF8String:"-[PLSQLiteConnection trimAllTablesFromDate:toDate:withTableFilters:]"];
            +[PLCoreStorage logMessage:v24 fromFile:v26 fromFunction:v27 fromLineNumber:665];

            long long v28 = PLLogCommon();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v100 = v24;
              _os_log_debug_impl(&dword_1BBD2F000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            self = v72;
            unint64_t v9 = 0x1E6253000uLL;
          }
        }
        int64_t v29 = [v21 objectForKeyedSubscript:@"name"];
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        uint64_t v30 = [&unk_1F1585C10 countByEnumeratingWithState:&v83 objects:v98 count:16];
        if (!v30)
        {
          uint64_t v68 = 0;
LABEL_40:
          long long v38 = [MEMORY[0x1E4F1CA48] array];
          if (v67)
          {
            long long v39 = [v67 objectForKeyedSubscript:v29];

            if (v39)
            {
              long long v40 = [v67 objectForKeyedSubscript:v29];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              uint64_t v42 = [v67 objectForKeyedSubscript:v29];
              if (isKindOfClass)
              {
                [v38 addObjectsFromArray:v42];
                goto LABEL_46;
              }
              objc_opt_class();
              char v43 = objc_opt_isKindOfClass();

              if (v43)
              {
                uint64_t v42 = [v67 objectForKeyedSubscript:v29];
                [v38 addObject:v42];
LABEL_46:
              }
            }
          }
          if (![v38 count])
          {
            __int16 v44 = [MEMORY[0x1E4F1CA98] null];
            [v38 addObject:v44];
          }
          if ([(PLSQLiteConnection *)self tableHasTimestampColumn:v29])
          {
            if (v63 && ([v29 isEqualToString:@"PLApplicationAgent_EventNone_AllApps"] & 1) == 0)
            {
              uint64_t v45 = NSString;
              [v63 timeIntervalSince1970];
              objc_msgSend(v45, "stringWithFormat:", @"DELETE FROM '%@' WHERE ID IN (SELECT ID FROM '%@' WHERE timestamp>%f limit %ld);",
                v29,
                v29,
                v46,
              int v47 = v17);
              [(PLSQLiteConnection *)self runTrimQuery:v47];
            }
            id v75 = v29;
            long long v81 = 0u;
            long long v82 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            v65 = v38;
            id v74 = v38;
            uint64_t v48 = [v74 countByEnumeratingWithState:&v79 objects:v97 count:16];
            if (v48)
            {
              uint64_t v49 = v48;
              uint64_t v50 = *(void *)v80;
              do
              {
                uint64_t v51 = 0;
                do
                {
                  if (*(void *)v80 != v50) {
                    objc_enumerationMutation(v74);
                  }
                  uint64_t v52 = *(void *)(*((void *)&v79 + 1) + 8 * v51);
                  int v53 = (void *)MEMORY[0x1C1869120]();
                  if ([*(id *)(v9 + 936) debugEnabled])
                  {
                    uint64_t v54 = objc_opt_class();
                    block[0] = MEMORY[0x1E4F143A8];
                    block[1] = 3221225472;
                    block[2] = __68__PLSQLiteConnection_trimAllTablesFromDate_toDate_withTableFilters___block_invoke_309;
                    block[3] = &unk_1E6253EC0;
                    uint64_t v77 = @"trimming";
                    uint64_t v78 = v54;
                    if (trimAllTablesFromDate_toDate_withTableFilters__defaultOnce_307 != -1) {
                      dispatch_once(&trimAllTablesFromDate_toDate_withTableFilters__defaultOnce_307, block);
                    }
                    int v55 = trimAllTablesFromDate_toDate_withTableFilters__classDebugEnabled_308;

                    if (v55)
                    {
                      unint64_t v56 = [NSString stringWithFormat:@"trimming filter %@", v52];
                      uint64_t v57 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
                      v58 = [v57 lastPathComponent];
                      uint64_t v59 = [NSString stringWithUTF8String:"-[PLSQLiteConnection trimAllTablesFromDate:toDate:withTableFilters:]"];
                      +[PLCoreStorage logMessage:v56 fromFile:v58 fromFunction:v59 fromLineNumber:729];

                      BOOL v60 = PLLogCommon();
                      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v100 = v56;
                        _os_log_debug_impl(&dword_1BBD2F000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                      }

                      id v8 = v71;
                      self = v72;
                      unint64_t v9 = 0x1E6253000;
                      int64_t v17 = v73;
                    }
                  }
                  [(PLSQLiteConnection *)self trimTable:v75 fromDate:v8 withFilter:v52 withTrimLimit:v17];
                  ++v51;
                }
                while (v49 != v51);
                uint64_t v49 = [v74 countByEnumeratingWithState:&v79 objects:v97 count:16];
              }
              while (v49);
            }

            uint64_t v19 = v62;
            int64_t v29 = v75;
            long long v38 = v65;
          }

          goto LABEL_69;
        }
        uint64_t v31 = v30;
        long long v32 = v29;
        long long v33 = 0;
        uint64_t v34 = *(void *)v84;
        while (2)
        {
          uint64_t v35 = 0;
          uint64_t v36 = v33;
          do
          {
            if (*(void *)v84 != v34) {
              objc_enumerationMutation(&unk_1F1585C10);
            }
            long long v33 = [(id)objc_opt_class() masterTableForTable:v32 andType:*(void *)(*((void *)&v83 + 1) + 8 * v35)];

            if (v33 && [v33 length]) {
              goto LABEL_33;
            }
            ++v35;
            uint64_t v36 = v33;
          }
          while (v31 != v35);
          uint64_t v31 = [&unk_1F1585C10 countByEnumeratingWithState:&v83 objects:v98 count:16];
          if (v31) {
            continue;
          }
          break;
        }
        if (!v33)
        {
          uint64_t v68 = 0;
LABEL_39:
          int64_t v17 = v73;
          int64_t v29 = v32;
          goto LABEL_40;
        }
LABEL_33:
        uint64_t v68 = v33;
        if (![v33 length]) {
          goto LABEL_39;
        }
        int64_t v17 = v73;
        int64_t v29 = v32;
        if ([(PLSQLiteConnection *)self checkEmptyMasterTable:v33])
        {
          [(PLSQLiteConnection *)self dropTable:v32];
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM '%@' WHERE FK_ID < (SELECT MIN(ID) FROM '%@') OR FK_ID > (SELECT MAX(ID) FROM '%@');",
            v32,
            v33,
          long long v37 = v33);
          [(PLSQLiteConnection *)self runTrimQuery:v37];
        }
LABEL_69:

        uint64_t v20 = v70 + 1;
      }
      while (v70 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v90 objects:v101 count:16];
      if (!v19)
      {
LABEL_71:

        break;
      }
    }
  }
}

BOOL __68__PLSQLiteConnection_trimAllTablesFromDate_toDate_withTableFilters___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  trimAllTablesFromDate_toDate_withTableFilters__classDebugEnabled = result;
  return result;
}

BOOL __68__PLSQLiteConnection_trimAllTablesFromDate_toDate_withTableFilters___block_invoke_289(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  trimAllTablesFromDate_toDate_withTableFilters__classDebugEnabled_288 = result;
  return result;
}

BOOL __68__PLSQLiteConnection_trimAllTablesFromDate_toDate_withTableFilters___block_invoke_309(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  trimAllTablesFromDate_toDate_withTableFilters__classDebugEnabled_308 = result;
  return result;
}

- (void)runTrimQuery:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x1C1869120]();
  int v57 = 0;
  uint64_t v5 = [PLSQLStatement alloc];
  int v6 = [(PLSQLiteConnection *)self dbConnection];
  id v7 = [(PLSQLiteConnection *)self dbSem];
  id v8 = [(PLSQLStatement *)v5 initWithSQLQuery:v4 forDatabase:v6 withDBSem:v7 result:&v57];

  unint64_t v9 = 0x1E6253000uLL;
  int v47 = v8;
  if (!v8 && +[PLDefaults debugEnabled])
  {
    uint64_t v10 = [NSString stringWithFormat:@"Prepare statement fail: query=%@", v4];
    int v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
    uint64_t v12 = [v11 lastPathComponent];
    id v13 = [NSString stringWithUTF8String:"-[PLSQLiteConnection runTrimQuery:]"];
    +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:742];

    int v14 = PLLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }

    id v8 = 0;
    unint64_t v9 = 0x1E6253000uLL;
  }
  if (v57 == 11) {
    +[PLUtilities exitWithReason:1001 connection:self];
  }
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __35__PLSQLiteConnection_runTrimQuery___block_invoke;
    v54[3] = &unk_1E6253EC0;
    int v55 = @"trimming";
    uint64_t v56 = v15;
    if (runTrimQuery__defaultOnce != -1) {
      dispatch_once(&runTrimQuery__defaultOnce, v54);
    }
    int v16 = runTrimQuery__classDebugEnabled;

    if (v16)
    {
      int64_t v17 = [NSString stringWithFormat:@"trimming query: %@", v4];
      uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      uint64_t v19 = [v18 lastPathComponent];
      uint64_t v20 = [NSString stringWithUTF8String:"-[PLSQLiteConnection runTrimQuery:]"];
      +[PLCoreStorage logMessage:v17 fromFile:v19 fromFunction:v20 fromLineNumber:747];

      uint64_t v21 = PLLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      id v8 = v47;
      unint64_t v9 = 0x1E6253000uLL;
    }
  }
  uint64_t v45 = v4;
  uint64_t v22 = 0;
  if (v8)
  {
    int v23 = @"changes";
    uint64_t v46 = self;
    do
    {
      long long v24 = (void *)MEMORY[0x1C1869120]();
      long long v25 = [(PLSQLiteConnection *)self performStatement:v8];
      id v26 = [v25 objectAtIndexedSubscript:0];
      long long v27 = [v26 objectForKeyedSubscript:v23];
      uint64_t v28 = [v27 intValue];

      uint64_t v22 = (v22 + 1);
      if ([*(id *)(v9 + 936) debugEnabled])
      {
        uint64_t v29 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __35__PLSQLiteConnection_runTrimQuery___block_invoke_325;
        block[3] = &unk_1E6253EC0;
        uint64_t v52 = @"trimming";
        uint64_t v53 = v29;
        if (runTrimQuery__defaultOnce_323 != -1) {
          dispatch_once(&runTrimQuery__defaultOnce_323, block);
        }
        int v30 = runTrimQuery__classDebugEnabled_324;

        if (v30)
        {
          uint64_t v31 = v23;
          long long v32 = objc_msgSend(NSString, "stringWithFormat:", @"run %d changes=%d", v22, v28);
          long long v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
          uint64_t v34 = [v33 lastPathComponent];
          uint64_t v35 = [NSString stringWithUTF8String:"-[PLSQLiteConnection runTrimQuery:]"];
          +[PLCoreStorage logMessage:v32 fromFile:v34 fromFunction:v35 fromLineNumber:756];

          uint64_t v36 = PLLogCommon();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v59 = v32;
            _os_log_debug_impl(&dword_1BBD2F000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          unint64_t v9 = 0x1E6253000;
          int v23 = v31;
          self = v46;
          id v8 = v47;
        }
      }
    }
    while (v28);
  }
  if ([*(id *)(v9 + 936) debugEnabled])
  {
    uint64_t v37 = objc_opt_class();
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __35__PLSQLiteConnection_runTrimQuery___block_invoke_331;
    v48[3] = &unk_1E6253EC0;
    uint64_t v49 = @"trimming";
    uint64_t v50 = v37;
    if (runTrimQuery__defaultOnce_329 != -1) {
      dispatch_once(&runTrimQuery__defaultOnce_329, v48);
    }
    int v38 = runTrimQuery__classDebugEnabled_330;

    if (v38)
    {
      long long v39 = objc_msgSend(NSString, "stringWithFormat:", @"runs=%d", v22);
      long long v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      int v41 = [v40 lastPathComponent];
      uint64_t v42 = [NSString stringWithUTF8String:"-[PLSQLiteConnection runTrimQuery:]"];
      +[PLCoreStorage logMessage:v39 fromFile:v41 fromFunction:v42 fromLineNumber:759];

      char v43 = PLLogCommon();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }

      id v8 = v47;
    }
  }
}

BOOL __35__PLSQLiteConnection_runTrimQuery___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  runTrimQuery__classDebugEnabled = result;
  return result;
}

BOOL __35__PLSQLiteConnection_runTrimQuery___block_invoke_325(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  runTrimQuery__classDebugEnabled_324 = result;
  return result;
}

BOOL __35__PLSQLiteConnection_runTrimQuery___block_invoke_331(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  runTrimQuery__classDebugEnabled_330 = result;
  return result;
}

- (void)trimTable:(id)a3 fromDate:(id)a4 withFilter:(id)a5 withTrimLimit:(int64_t)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11
    || ([MEMORY[0x1E4F1CA98] null],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        v12,
        v12 == v11))
  {
    id v13 = NSString;
    if (v10) {
      [v10 timeIntervalSince1970];
    }
    else {
      uint64_t v14 = 0;
    }
    objc_msgSend(v13, "stringWithFormat:", @"DELETE FROM '%@' WHERE ID IN (SELECT ID FROM '%@' WHERE (timestamp is NULL OR timestamp<%f) limit %ld);",
      v16,
      v16,
      v14,
      a6);
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"DELETE FROM '%@' WHERE ID IN (SELECT ID FROM '%@' WHERE (%@) limit %ld);",
      v16,
      v16,
      v11,
      a6);
  uint64_t v15 = };
  [(PLSQLiteConnection *)self runTrimQuery:v15];
}

- (BOOL)checkEmptyMasterTable:(id)a3
{
  id v4 = a3;
  if ([v4 rangeOfString:@"PLOLD_"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v5 = 0;
  }
  else if ([(PLSQLiteConnection *)self tableExistsForTableName:v4]) {
    int v6 = {;
  }
    id v7 = [(PLSQLiteConnection *)self performQuery:v6];
    if ([v7 count] == 1)
    {
      id v8 = [v7 objectAtIndexedSubscript:0];
      unint64_t v9 = [v8 objectForKeyedSubscript:@"rowCount"];
      BOOL v5 = [v9 intValue] == 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

+ (id)masterTableForTable:(id)a3 andType:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 rangeOfString:a4];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = v6;
    unint64_t v9 = [(id)objc_opt_class() versionForTable:v5];
    id v10 = v9;
    if (v9 && [v9 length])
    {
      id v11 = [NSString stringWithFormat:@"_%@", v10];
    }
    else
    {
      id v11 = &stru_1F15208F0;
    }
    id v12 = NSString;
    id v13 = [v5 substringToIndex:v8];
    id v7 = [v12 stringWithFormat:@"%@%@", v13, v11];
  }
  return v7;
}

+ (id)versionForTable:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"PLOLD_"])
  {
    id v4 = [v3 tokenizedByString:@"_"];
    id v5 = [v4 lastObject];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)removeIDIndexes
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int v21 = 0;
  id v3 = [PLSQLStatement alloc];
  id v4 = [(PLSQLiteConnection *)self dbConnection];
  id v5 = [(PLSQLiteConnection *)self dbSem];
  uint64_t v6 = -[PLSQLStatement initWithSQLQuery:forDatabase:withDBSem:result:](v3, "initWithSQLQuery:forDatabase:withDBSem:result:", @"select name from sqlite_master where type='index' and name like 'Index_PL%_ID';",
         v4,
         v5,
         &v21);

  if (!v21)
  {
    id v16 = v6;
    id v7 = [(PLSQLStatement *)v6 perform];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = NSString;
          id v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) objectForKeyedSubscript:@"name"];
          uint64_t v14 = [v12 stringWithFormat:@"DROP INDEX IF EXISTS '%@';", v13];
          id v15 = [(PLSQLiteConnection *)self performQuery:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v9);
    }

    uint64_t v6 = v16;
  }
}

- (void)removeEmptyOldTables
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F29000uLL;
  uint64_t v34 = [NSString stringWithFormat:@"SELECT name FROM sqlite_master WHERE type='table' AND name LIKE \"PLOLD_%%\" AND name NOT LIKE \"PLCoreStorage%%\""];;
  -[PLSQLiteConnection performQuery:](self, "performQuery:");
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v37 = *(void *)v43;
    do
    {
      uint64_t v6 = 0;
      uint64_t v35 = v5;
      do
      {
        if (*(void *)v43 != v37) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v42 + 1) + 8 * v6);
        uint64_t v8 = *(void **)(v3 + 24);
        uint64_t v10 = v9 = [v7 objectForKeyedSubscript:@"name"];

        id v11 = [(PLSQLiteConnection *)self performQuery:v10];
        if ([v11 count] == 1)
        {
          id v12 = [v11 objectAtIndexedSubscript:0];
          id v13 = [v12 objectForKeyedSubscript:@"rowCount"];
          int v14 = [v13 intValue];

          if (!v14)
          {
            id v15 = [v7 objectForKeyedSubscript:@"name"];
            [(PLSQLiteConnection *)self dropTable:v15];
          }
          if (+[PLDefaults debugEnabled])
          {
            uint64_t v16 = objc_opt_class();
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __42__PLSQLiteConnection_removeEmptyOldTables__block_invoke;
            block[3] = &unk_1E6253EC0;
            long long v40 = @"removeEmptyOldTables";
            uint64_t v41 = v16;
            if (removeEmptyOldTables_defaultOnce != -1) {
              dispatch_once(&removeEmptyOldTables_defaultOnce, block);
            }
            int v17 = removeEmptyOldTables_classDebugEnabled;

            if (v17)
            {
              long long v18 = *(void **)(v3 + 24);
              long long v19 = [v7 objectForKeyedSubscript:@"name"];
              long long v20 = [v11 objectAtIndexedSubscript:0];
              [v20 objectForKeyedSubscript:@"rowCount"];
              uint64_t v22 = v21 = v3;
              uint64_t v23 = [v18 stringWithFormat:@"oldTable=%@ rowCount=%@", v19, v22];

              long long v24 = [*(id *)(v21 + 24) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
              long long v25 = [v24 lastPathComponent];
              id v26 = [*(id *)(v21 + 24) stringWithUTF8String:"-[PLSQLiteConnection removeEmptyOldTables]"];
              +[PLCoreStorage logMessage:v23 fromFile:v25 fromFunction:v26 fromLineNumber:853];

              long long v27 = PLLogCommon();
              if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
LABEL_20:
                unint64_t v3 = 0x1E4F29000;
                uint64_t v5 = v35;

                goto LABEL_21;
              }
LABEL_23:
              *(_DWORD *)buf = 138412290;
              int v47 = v23;
              _os_log_debug_impl(&dword_1BBD2F000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              goto LABEL_20;
            }
          }
        }
        else if (+[PLDefaults debugEnabled])
        {
          uint64_t v28 = objc_opt_class();
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __42__PLSQLiteConnection_removeEmptyOldTables__block_invoke_379;
          v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v38[4] = v28;
          if (removeEmptyOldTables_defaultOnce_377 != -1) {
            dispatch_once(&removeEmptyOldTables_defaultOnce_377, v38);
          }
          if (removeEmptyOldTables_classDebugEnabled_378)
          {
            uint64_t v23 = [*(id *)(v3 + 24) stringWithFormat:@"ERROR! wrong results for countQuery: %@ results=%@", v10, v11];
            [*(id *)(v3 + 24) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
            v30 = unint64_t v29 = v3;
            uint64_t v31 = [v30 lastPathComponent];
            long long v32 = [*(id *)(v29 + 24) stringWithUTF8String:"-[PLSQLiteConnection removeEmptyOldTables]"];
            +[PLCoreStorage logMessage:v23 fromFile:v31 fromFunction:v32 fromLineNumber:855];

            long long v27 = PLLogCommon();
            if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_20;
            }
            goto LABEL_23;
          }
        }
LABEL_21:

        ++v6;
      }
      while (v5 != v6);
      uint64_t v33 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
      uint64_t v5 = v33;
    }
    while (v33);
  }
}

BOOL __42__PLSQLiteConnection_removeEmptyOldTables__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  removeEmptyOldTables_classDebugEnabled = result;
  return result;
}

BOOL __42__PLSQLiteConnection_removeEmptyOldTables__block_invoke_379(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  removeEmptyOldTables_classDebugEnabled_378 = result;
  return result;
}

- (void)dropTable:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__PLSQLiteConnection_dropTable___block_invoke;
    block[3] = &unk_1E6253EC0;
    int v38 = @"dropTable";
    uint64_t v39 = v5;
    if (dropTable__defaultOnce != -1) {
      dispatch_once(&dropTable__defaultOnce, block);
    }
    int v6 = dropTable__classDebugEnabled;

    if (v6)
    {
      id v7 = [NSString stringWithFormat:@"%@ %lu", v4, objc_msgSend(v4, "rangeOfString:", @"%"];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      uint64_t v9 = [v8 lastPathComponent];
      uint64_t v10 = [NSString stringWithUTF8String:"-[PLSQLiteConnection dropTable:]"];
      +[PLCoreStorage logMessage:v7 fromFile:v9 fromFunction:v10 fromLineNumber:864];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  if ([v4 rangeOfString:@"%"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v41 = v4;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  }
  else
  {
    id v28 = v4;
    objc_msgSend(NSString, "stringWithFormat:", @"SELECT name FROM sqlite_master WHERE type='table' AND name LIKE \"%@\" AND name NOT LIKE \"PLCoreStorage%%\";",
    id v13 = v4);
    int v14 = [(PLSQLiteConnection *)self performQuery:v13];
    id v12 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = [*(id *)(*((void *)&v33 + 1) + 8 * i) objectForKeyedSubscript:@"name"];
          [v12 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v17);
    }

    id v4 = v28;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v21 = v12;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v40 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        objc_msgSend(NSString, "stringWithFormat:", @"DROP TABLE '%@';",
        id v26 = *(void *)(*((void *)&v29 + 1) + 8 * j));
        id v27 = [(PLSQLiteConnection *)self performQuery:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v40 count:16];
    }
    while (v23);
  }
}

BOOL __32__PLSQLiteConnection_dropTable___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  dropTable__classDebugEnabled = result;
  return result;
}

- (void)dropTables:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(PLSQLiteConnection *)self dropTable:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)hashEntryKeyKeys:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__PLSQLiteConnection_hashEntryKeyKeys___block_invoke;
  v3[3] = &unk_1E62558F8;
  v3[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v3];
}

void __39__PLSQLiteConnection_hashEntryKeyKeys___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28E78] stringWithFormat:@"UPDATE '%@' SET ", a2];
  if ([v5 count])
  {
    unint64_t v7 = 0;
    do
    {
      if (v7) {
        [v6 appendString:@", "];
      }
      uint64_t v8 = [v5 objectAtIndexedSubscript:v7];
      [v6 appendFormat:@"%@=''", v8];

      ++v7;
    }
    while ([v5 count] > v7);
  }
  [v6 appendString:@";"];
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PLSQLiteConnection_hashEntryKeyKeys___block_invoke_2;
    block[3] = &unk_1E6253EC0;
    uint64_t v18 = @"HashEntryKeys";
    uint64_t v19 = v9;
    if (kPLCacheSizeForBackupDatabaseConnection_block_invoke_2_defaultOnce != -1) {
      dispatch_once(&kPLCacheSizeForBackupDatabaseConnection_block_invoke_2_defaultOnce, block);
    }
    int v10 = kPLCacheSizeForBackupDatabaseConnection_block_invoke_2_classDebugEnabled;

    if (v10)
    {
      long long v11 = [NSString stringWithFormat:@"hashUpdateQuery=%@", v6];
      long long v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      id v13 = [v12 lastPathComponent];
      uint64_t v14 = [NSString stringWithUTF8String:"-[PLSQLiteConnection hashEntryKeyKeys:]_block_invoke"];
      +[PLCoreStorage logMessage:v11 fromFile:v13 fromFunction:v14 fromLineNumber:901];

      id v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  id v16 = (id)[*(id *)(a1 + 32) performQuery:v6];
}

BOOL __39__PLSQLiteConnection_hashEntryKeyKeys___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  kPLCacheSizeForBackupDatabaseConnection_block_invoke_2_classDebugEnabled = result;
  return result;
}

- (void)displaySchema:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  [v5 appendFormat:@"pragma table_info('%@')", v4];

  uint64_t v6 = [(PLSQLiteConnection *)self performQuery:v5];
  BOOL v7 = +[PLDefaults debugEnabled];
  if (v6)
  {
    if (v7)
    {
      uint64_t v8 = [NSString stringWithFormat:@"Table info: %@", v6];
      uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      int v10 = [v9 lastPathComponent];
      long long v11 = [NSString stringWithUTF8String:"-[PLSQLiteConnection displaySchema:]"];
      +[PLCoreStorage logMessage:v8 fromFile:v10 fromFunction:v11 fromLineNumber:979];

      long long v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_7;
      }
      goto LABEL_8;
    }
  }
  else if (v7)
  {
    uint64_t v8 = [NSString stringWithFormat:@"Fail no query table info query=%@", v5];;
    id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
    uint64_t v14 = [v13 lastPathComponent];
    id v15 = [NSString stringWithUTF8String:"-[PLSQLiteConnection displaySchema:]"];
    +[PLCoreStorage logMessage:v8 fromFile:v14 fromFunction:v15 fromLineNumber:978];

    long long v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
LABEL_7:
    }
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
LABEL_8:
  }
}

BOOL __35__PLSQLiteConnection_performQuery___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  performQuery__classDebugEnabled = result;
  return result;
}

- (id)performQuery:(id)a3 returnValue:(int *)a4 returnResult:(BOOL)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a5)
  {
    uint64_t v9 = [(PLSQLiteConnection *)self performQuery:v8];
  }
  else
  {
    errmsg = 0;
    int v10 = [(PLSQLiteConnection *)self dbSem];
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

    dbConnection = self->_dbConnection;
    id v12 = v8;
    int v13 = sqlite3_exec(dbConnection, (const char *)[v12 UTF8String], 0, 0, &errmsg);
    int v14 = v13;
    if (a4) {
      *a4 = v13;
    }
    if (v13)
    {
      id v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v20 = v12;
        __int16 v21 = 1024;
        int v22 = v14;
        __int16 v23 = 2080;
        uint64_t v24 = errmsg;
        _os_log_error_impl(&dword_1BBD2F000, v15, OS_LOG_TYPE_ERROR, "Failed to execute query %@ - %d and %s", buf, 0x1Cu);
      }

      sqlite3_free(errmsg);
    }
    id v16 = [(PLSQLiteConnection *)self dbSem];
    dispatch_semaphore_signal(v16);

    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)tableExistsForTableName:(id)a3
{
  unint64_t v3 = [(PLSQLiteConnection *)self tableInfo:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)tableInfo:(id)a3
{
  BOOL v4 = [NSString stringWithFormat:@"pragma 'main'.table_info('%@')", a3];
  id v5 = [(PLSQLiteConnection *)self performQuery:v4];

  return v5;
}

- (void)setSchemaVersion:(double)a3 forTableName:(id)a4
{
  uint64_t v6 = NSString;
  id v7 = a4;
  id v8 = [v6 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@=\"%@\", @"schemaVersion", @"PLCoreStorage_schemaVersions", @"tableName"", v7];
  id v11 = [(PLSQLiteConnection *)self performQuery:v8];

  if ([v11 count]) {
      @"PLCoreStorage_schemaVersions",
  }
      @"schemaVersion",
      *(void *)&a3,
      @"tableName",
      v7);
  else {
  uint64_t v9 = [NSString stringWithFormat:@"INSERT INTO %@ ('%@', '%@') VALUES ('%@', '%f')", @"PLCoreStorage_schemaVersions", @"tableName", @"schemaVersion", v7, *(void *)&a3];
  }

  id v10 = [(PLSQLiteConnection *)self performQuery:v9];
}

- (double)schemaVersionForTable:(id)a3
{
  BOOL v4 = [NSString stringWithFormat:@"SELECT %@ FROM %@ WHERE %@=\"%@\", @"schemaVersion", @"PLCoreStorage_schemaVersions", @"tableName"", a3];
  id v5 = [(PLSQLiteConnection *)self performQuery:v4];

  if ([v5 count])
  {
    uint64_t v6 = [v5 objectAtIndexedSubscript:0];
    id v7 = [v6 objectForKey:@"schemaVersion"];
    [v7 doubleValue];
    double v9 = v8;
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (void)setVersionHash:(id)a3 forTableName:(id)a4
{
  uint64_t v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  double v9 = [v6 stringWithFormat:@"SELECT %@ FROM %@ WHERE %@=\"%@\", @"schemaVersion", @"PLCoreStorage_schemaVersions", @"tableName"", v7];
  id v12 = [(PLSQLiteConnection *)self performQuery:v9];

  if ([v12 count]) {
      @"PLCoreStorage_schemaVersions",
  }
      @"schemaVersion",
      v8,
      @"tableName",
      v7);
  else {
  id v10 = [NSString stringWithFormat:@"INSERT INTO %@ ('%@', '%@') VALUES ('%@', '%@')", @"PLCoreStorage_schemaVersions", @"tableName", @"schemaVersion", v7, v8];
  }

  id v11 = [(PLSQLiteConnection *)self performQuery:v10];
}

- (id)versionHashForTable:(id)a3
{
  BOOL v4 = [NSString stringWithFormat:@"SELECT %@ FROM %@ WHERE %@=\"%@\", @"schemaVersion", @"PLCoreStorage_schemaVersions", @"tableName"", a3];
  id v5 = [(PLSQLiteConnection *)self performQuery:v4];

  if ([v5 count])
  {
    uint64_t v6 = [v5 objectAtIndexedSubscript:0];
    id v7 = [v6 objectForKey:@"schemaVersion"];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)createTableName:(id)a3 withColumns:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__PLSQLiteConnection_createTableName_withColumns___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v8;
    if (createTableName_withColumns__defaultOnce != -1) {
      dispatch_once(&createTableName_withColumns__defaultOnce, block);
    }
    if (createTableName_withColumns__classDebugEnabled)
    {
      double v9 = [NSString stringWithFormat:@"Creating table: %@", v6];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      id v11 = [v10 lastPathComponent];
      id v12 = [NSString stringWithUTF8String:"-[PLSQLiteConnection createTableName:withColumns:]"];
      +[PLCoreStorage logMessage:v9 fromFile:v11 fromFunction:v12 fromLineNumber:1080];

      int v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  int v14 = objc_opt_new();
  long long v31 = v6;
  objc_msgSend(v14, "appendFormat:", @"CREATE TABLE IF NOT EXISTS '%@' ("), v6;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v7;
  uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    char v17 = 1;
    uint64_t v18 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if ((v17 & 1) == 0) {
          [v14 appendString:@", "];
        }
        __int16 v21 = [v20 objectForKey:@"column-name"];
        int v22 = [v20 objectForKey:@"type"];
        [v14 appendFormat:@"'%@' %@", v21, v22];

        char v17 = 0;
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      char v17 = 0;
    }
    while (v16);
  }

  [v14 appendString:@";"]);
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v23 = objc_opt_class();
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    _DWORD v33[2] = __50__PLSQLiteConnection_createTableName_withColumns___block_invoke_474;
    v33[3] = &unk_1E6253EC0;
    long long v34 = @"sqlCreate";
    uint64_t v35 = v23;
    if (createTableName_withColumns__defaultOnce_472 != -1) {
      dispatch_once(&createTableName_withColumns__defaultOnce_472, v33);
    }
    int v24 = createTableName_withColumns__classDebugEnabled_473;

    if (v24)
    {
      uint64_t v25 = [NSString stringWithFormat:@"sqlCreate=%@", v14];
      id v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      id v27 = [v26 lastPathComponent];
      id v28 = [NSString stringWithUTF8String:"-[PLSQLiteConnection createTableName:withColumns:]"];
      +[PLCoreStorage logMessage:v25 fromFile:v27 fromFunction:v28 fromLineNumber:1091];

      long long v29 = PLLogCommon();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  id v30 = [(PLSQLiteConnection *)self performQuery:v14];
}

BOOL __50__PLSQLiteConnection_createTableName_withColumns___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  createTableName_withColumns__classDebugEnabled = result;
  return result;
}

BOOL __50__PLSQLiteConnection_createTableName_withColumns___block_invoke_474(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  createTableName_withColumns__classDebugEnabled_473 = result;
  return result;
}

- (void)createIndexOnTable:(id)a3 forColumn:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PLSQLiteConnection_createIndexOnTable_forColumn___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v8;
    if (createIndexOnTable_forColumn__defaultOnce != -1) {
      dispatch_once(&createIndexOnTable_forColumn__defaultOnce, block);
    }
    if (createIndexOnTable_forColumn__classDebugEnabled)
    {
      double v9 = [NSString stringWithFormat:@"Creating Index On: %@.%@", v6, v7];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      id v11 = [v10 lastPathComponent];
      id v12 = [NSString stringWithUTF8String:"-[PLSQLiteConnection createIndexOnTable:forColumn:]"];
      +[PLCoreStorage logMessage:v9 fromFile:v11 fromFunction:v12 fromLineNumber:1096];

      int v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  objc_msgSend(NSString, "stringWithFormat:", @"CREATE INDEX IF NOT EXISTS \"Index_%@_%@\" ON \"%@\" (\"%@\");",
    v6,
    v7,
    v6,
  int v14 = v7);
  id v15 = [(PLSQLiteConnection *)self performQuery:v14];
}

BOOL __51__PLSQLiteConnection_createIndexOnTable_forColumn___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  createIndexOnTable_forColumn__classDebugEnabled = result;
  return result;
}

- (void)createCompositeIndexOnTable:(id)a3 forColumns:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PLSQLiteConnection_createCompositeIndexOnTable_forColumns___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v8;
    if (createCompositeIndexOnTable_forColumns__defaultOnce != -1) {
      dispatch_once(&createCompositeIndexOnTable_forColumns__defaultOnce, block);
    }
    if (createCompositeIndexOnTable_forColumns__classDebugEnabled)
    {
      double v9 = [NSString stringWithFormat:@"Creating Index On: %@.%@", v6, v7];
      id v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      id v11 = [v10 lastPathComponent];
      id v12 = [NSString stringWithUTF8String:"-[PLSQLiteConnection createCompositeIndexOnTable:forColumns:]"];
      +[PLCoreStorage logMessage:v9 fromFile:v11 fromFunction:v12 fromLineNumber:1103];

      int v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  int v14 = [MEMORY[0x1E4F28E78] stringWithFormat:@"Index_%@_", v6];
  id v15 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v16 = v7;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        [v14 appendString:v21];
        [v15 appendFormat:@",%@", v21];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v18);
  }

  int v22 = NSString;
  uint64_t v23 = [v15 substringFromIndex:1];
  int v24 = [v22 stringWithFormat:@"CREATE INDEX IF NOT EXISTS %@ ON %@ (%@);", v14, v6, v23];

  id v25 = [(PLSQLiteConnection *)self performQuery:v24];
}

BOOL __61__PLSQLiteConnection_createCompositeIndexOnTable_forColumns___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  createCompositeIndexOnTable_forColumns__classDebugEnabled = result;
  return result;
}

BOOL __38__PLSQLiteConnection_beginTransaction__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  beginTransaction_classDebugEnabled = result;
  return result;
}

BOOL __36__PLSQLiteConnection_endTransaction__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  endTransaction_classDebugEnabled = result;
  return result;
}

BOOL __67__PLSQLiteConnection_bindEntry_toPreparedStatement_atBindPosition___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  bindEntry_toPreparedStatement_atBindPosition__classDebugEnabled = result;
  return result;
}

BOOL __33__PLSQLiteConnection_writeEntry___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  writeEntry__classDebugEnabled_0 = result;
  return result;
}

BOOL __33__PLSQLiteConnection_writeEntry___block_invoke_2(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  writeEntry__classDebugEnabled_571 = result;
  return result;
}

- (void)writeDynamicEntriesToPPS:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 entryKey];
  id v6 = +[PLEntryDefinition dynamicKeyConfigsForEntryKey:v5];

  id v7 = [v4 dynamicKeys];
  uint64_t v8 = [v7 sortedArrayUsingSelector:sel_compare_];

  v65 = v8;
  if ([v8 count])
  {
    double v9 = NSString;
    id v10 = [v4 entryKey];
    id v11 = [v9 stringWithFormat:@"%@_Dynamic", v10];

    long long v61 = [(PLSQLiteConnection *)self sortedSqlFormatedColumnNamesForTableInsert:v11];
    id v12 = objc_opt_new();
    int v13 = [v6 allKeys];
    uint64_t v14 = [v13 count];

    uint64_t v66 = v12;
    if (v14)
    {
      unint64_t v15 = 0;
      do
      {
        if (v15) {
          [v12 appendString:@", "];
        }
        [v12 appendString:@"?"];
        ++v15;
        id v16 = [v6 allKeys];
        unint64_t v17 = [v16 count];

        id v12 = v66;
      }
      while (v17 > v15);
    }
    [v12 appendString:@""]);
    uint64_t v18 = objc_opt_new();
    objc_msgSend(v18, "appendFormat:", @"INSERT INTO \"%@\" ('FK_ID',"), v11;
    [v18 appendString:v61];
    [v18 appendString:@" VALUES "];
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"(?, %@"), v12;
    id v20 = [v4 objectForKeyedSubscript:@"__PPSKVPairs__"];
    uint64_t v21 = PLLogCommon();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[PLSQLiteConnection writeDynamicEntriesToPPS:].cold.5();
    }

    int v22 = PLLogCommon();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[PLSQLiteConnection writeDynamicEntriesToPPS:].cold.4(v20);
    }

    if ([v20 count])
    {
      unint64_t v23 = 0;
      do
      {
        if (v23) {
          [v18 appendString:@", "];
        }
        [v18 appendString:v19];
        ++v23;
      }
      while ([v20 count] > v23);
    }
    v58 = (void *)v19;
    [v18 appendString:@";"];
    int v24 = PLLogCommon();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[PLSQLiteConnection writeDynamicEntriesToPPS:]();
    }

    int v72 = 0;
    id v25 = [PLSQLStatement alloc];
    long long v26 = v18;
    long long v27 = [(PLSQLiteConnection *)self dbConnection];
    long long v28 = [(PLSQLiteConnection *)self dbSem];
    uint64_t v59 = v26;
    uint64_t v29 = [(PLSQLStatement *)v25 initWithSQLQuery:v26 forDatabase:v27 withDBSem:v28 result:&v72];

    id v67 = (void *)v29;
    if (v29)
    {
      int v57 = v11;
      uint64_t v60 = self;
      id v30 = v6;
      if (v72 == 11) {
        +[PLUtilities exitWithReason:1001 connection:self];
      }
      [(PLSQLiteConnection *)self beginTransaction];
      id v63 = v4;
      if ([v20 count])
      {
        unint64_t v31 = 0;
        uint64_t v32 = 1;
        uint64_t v62 = v20;
        do
        {
          long long v33 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "entryID"));
          [v67 bindValue:v33 withFormater:5 atPosition:v32];

          uint64_t v32 = (v32 + 1);
          long long v34 = [v20 objectAtIndexedSubscript:v31];
          id v35 = v65;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          uint64_t v36 = [v35 countByEnumeratingWithState:&v68 objects:v73 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            unint64_t v64 = v31;
            uint64_t v38 = *(void *)v69;
            do
            {
              uint64_t v39 = 0;
              int v40 = v32;
              do
              {
                if (*(void *)v69 != v38) {
                  objc_enumerationMutation(v35);
                }
                uint64_t v41 = *(void *)(*((void *)&v68 + 1) + 8 * v39);
                uint64_t v42 = [v34 objectForKeyedSubscript:v41];
                objc_msgSend(v67, "bindValue:withFormater:atPosition:", v42, +[PLEntry dataFormatForMetric:auxiliaryMetrics:](PLEntry, "dataFormatForMetric:auxiliaryMetrics:", v41, v30), v32 + v39);

                ++v39;
              }
              while (v37 != v39);
              uint64_t v37 = [v35 countByEnumeratingWithState:&v68 objects:v73 count:16];
              LODWORD(v32) = v32 + v39;
            }
            while (v37);
            uint64_t v32 = (v40 + v39);
            id v20 = v62;
            id v4 = v63;
            unint64_t v31 = v64;
          }

          ++v31;
        }
        while ([v20 count] > v31);
      }
      uint64_t v43 = [(PLSQLiteConnection *)v60 performStatement:v67];
      long long v44 = v43;
      id v6 = v30;
      id v11 = v57;
      if ((!v43 || ![v43 count]) && +[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        long long v45 = NSString;
        uint64_t v46 = [v4 entryKey];
        int v47 = [v45 stringWithFormat:@"Empty insert ID: Error while inserting dynamic entry for %@", v46];

        uint64_t v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
        uint64_t v49 = [v48 lastPathComponent];
        uint64_t v50 = [NSString stringWithUTF8String:"-[PLSQLiteConnection writeDynamicEntriesToPPS:]"];
        +[PLCoreStorage logMessage:v47 fromFile:v49 fromFunction:v50 fromLineNumber:1455];

        uint64_t v51 = PLLogCommon();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }

        id v4 = v63;
      }
      [(PLSQLiteConnection *)v60 endTransaction];
      uint64_t v52 = v66;
      uint64_t v53 = v58;
      long long v26 = v59;
    }
    else
    {
      uint64_t v54 = PLLogCommon();
      uint64_t v53 = v58;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        -[PLSQLiteConnection writeDynamicEntriesToPPS:]();
      }

      int v55 = NSString;
      long long v44 = [v4 entryKey];
      uint64_t v56 = [v55 stringWithFormat:@"%@_%@", v44, @"Dynamic"];
      [(PLSQLiteConnection *)self displaySchema:v56];

      uint64_t v52 = v66;
    }
  }
}

BOOL __42__PLSQLiteConnection_writeDynamicEntries___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  writeDynamicEntries__classDebugEnabled = result;
  return result;
}

BOOL __42__PLSQLiteConnection_writeDynamicEntries___block_invoke_629(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  writeDynamicEntries__classDebugEnabled_628 = result;
  return result;
}

BOOL __40__PLSQLiteConnection_writeArrayEntries___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  writeArrayEntries__classDebugEnabled = result;
  return result;
}

BOOL __34__PLSQLiteConnection_updateEntry___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  updateEntry__classDebugEnabled = result;
  return result;
}

BOOL __34__PLSQLiteConnection_updateEntry___block_invoke_668(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  updateEntry__classDebugEnabled_667 = result;
  return result;
}

BOOL __34__PLSQLiteConnection_updateEntry___block_invoke_674(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  updateEntry__classDebugEnabled_673 = result;
  return result;
}

BOOL __34__PLSQLiteConnection_updateEntry___block_invoke_680(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 32)];
  updateEntry__classDebugEnabled_679 = result;
  return result;
}

- (void)deleteEntryForKey:(id)a3 withRowID:(int64_t)a4
{
  id v6 = a3;
  id v7 = [NSString stringWithFormat:@"DELETE FROM '%@' WHERE ID=%lld", v6, a4];;
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__PLSQLiteConnection_deleteEntryForKey_withRowID___block_invoke;
    block[3] = &unk_1E6253EC0;
    uint64_t v18 = @"delete";
    uint64_t v19 = v8;
    if (deleteEntryForKey_withRowID__defaultOnce != -1) {
      dispatch_once(&deleteEntryForKey_withRowID__defaultOnce, block);
    }
    int v9 = deleteEntryForKey_withRowID__classDebugEnabled;

    if (v9)
    {
      id v10 = [NSString stringWithFormat:@"sqlDelete=%@", v7];
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      id v12 = [v11 lastPathComponent];
      int v13 = [NSString stringWithUTF8String:"-[PLSQLiteConnection deleteEntryForKey:withRowID:]"];
      +[PLCoreStorage logMessage:v10 fromFile:v12 fromFunction:v13 fromLineNumber:1755];

      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  id v15 = [(PLSQLiteConnection *)self performQuery:v7];
  id v16 = +[PLEntryDefinition definitionForEntryKey:v6];
  if (+[PLEntryDefinition hasArrayKeysForEntryDefinition:v16])
  {
    [(PLSQLiteConnection *)self deleteArrayEntriesForKey:v6 withRowID:a4];
  }
  if (+[PLEntryDefinition hasDynamicKeysForEntryDefinition:v16])
  {
    [(PLSQLiteConnection *)self deleteDynamicEntriesForKey:v6 withRowID:a4];
  }
}

BOOL __50__PLSQLiteConnection_deleteEntryForKey_withRowID___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  deleteEntryForKey_withRowID__classDebugEnabled = result;
  return result;
}

BOOL __59__PLSQLiteConnection_deleteDynamicEntriesForKey_withRowID___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  deleteDynamicEntriesForKey_withRowID__classDebugEnabled = result;
  return result;
}

- (void)deleteArrayEntriesForKey:(id)a3 withRowID:(int64_t)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = +[PLEntryDefinition definitionForEntryKey:v6];
  uint64_t v8 = +[PLEntryDefinition arrayKeysForEntryDefinition:v7];

  obuint64_t j = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0x1E4F29000uLL;
    uint64_t v12 = *(void *)v34;
    uint64_t v27 = *(void *)v34;
    long long v28 = self;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(obj);
        }
        objc_msgSend(*(id *)(v11 + 24), "stringWithFormat:", @"DELETE FROM '%@_Array_%@' WHERE FK_ID=%lld;",
          v6,
          *(void *)(*((void *)&v33 + 1) + 8 * v13),
        uint64_t v14 = a4);
        if (+[PLDefaults debugEnabled])
        {
          uint64_t v15 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __57__PLSQLiteConnection_deleteArrayEntriesForKey_withRowID___block_invoke;
          block[3] = &unk_1E6253EC0;
          unint64_t v31 = @"delete";
          uint64_t v32 = v15;
          if (deleteArrayEntriesForKey_withRowID__defaultOnce != -1) {
            dispatch_once(&deleteArrayEntriesForKey_withRowID__defaultOnce, block);
          }
          int v16 = deleteArrayEntriesForKey_withRowID__classDebugEnabled;

          if (v16)
          {
            uint64_t v17 = v10;
            id v18 = v6;
            int64_t v19 = a4;
            [*(id *)(v11 + 24) stringWithFormat:@"sqlDelete=%@", v14];
            v21 = unint64_t v20 = v11;
            int v22 = [*(id *)(v20 + 24) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
            unint64_t v23 = [v22 lastPathComponent];
            int v24 = [*(id *)(v20 + 24) stringWithUTF8String:"-[PLSQLiteConnection deleteArrayEntriesForKey:withRowID:]"];
            +[PLCoreStorage logMessage:v21 fromFile:v23 fromFunction:v24 fromLineNumber:1779];

            id v25 = PLLogCommon();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v38 = v21;
              _os_log_debug_impl(&dword_1BBD2F000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            a4 = v19;
            id v6 = v18;
            uint64_t v10 = v17;
            uint64_t v12 = v27;
            self = v28;
            unint64_t v11 = 0x1E4F29000;
          }
        }
        id v26 = [(PLSQLiteConnection *)self performQuery:v14];

        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v10);
  }
}

BOOL __57__PLSQLiteConnection_deleteArrayEntriesForKey_withRowID___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  deleteArrayEntriesForKey_withRowID__classDebugEnabled = result;
  return result;
}

- (void)deleteAllEntriesForKey:(id)a3 withFilters:(id)a4
{
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28E78] stringWithFormat:@"DELETE FROM '%@'", a3];
  if (v6)
  {
    uint64_t v8 = [v6 componentsJoinedByString:@" AND "];
    [v7 appendFormat:@"WHERE %@ ", v8];
  }
  [v7 appendString:@";"];
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PLSQLiteConnection_deleteAllEntriesForKey_withFilters___block_invoke;
    block[3] = &unk_1E6253EC0;
    id v18 = @"delete";
    uint64_t v19 = v9;
    if (deleteAllEntriesForKey_withFilters__defaultOnce != -1) {
      dispatch_once(&deleteAllEntriesForKey_withFilters__defaultOnce, block);
    }
    int v10 = deleteAllEntriesForKey_withFilters__classDebugEnabled;

    if (v10)
    {
      unint64_t v11 = [NSString stringWithFormat:@"sqlDelete=%@", v7];
      uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      uint64_t v13 = [v12 lastPathComponent];
      uint64_t v14 = [NSString stringWithUTF8String:"-[PLSQLiteConnection deleteAllEntriesForKey:withFilters:]"];
      +[PLCoreStorage logMessage:v11 fromFile:v13 fromFunction:v14 fromLineNumber:1791];

      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
  id v16 = [(PLSQLiteConnection *)self performQuery:v7];
}

BOOL __57__PLSQLiteConnection_deleteAllEntriesForKey_withFilters___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  deleteAllEntriesForKey_withFilters__classDebugEnabled = result;
  return result;
}

- (void)setAllNullValuesForEntryKey:(id)a3 forKey:(id)a4 toValue:(id)a5 withFilters:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  unint64_t v11 = [MEMORY[0x1E4F28E78] stringWithFormat:@"UPDATE %@ SET \"%@\" = %@ WHERE \"%@\" IS NULL", a3, a4, a5, a4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        [v11 appendFormat:@" AND %@", *(void *)(*((void *)&v18 + 1) + 8 * v16++)];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v14);
  }

  id v17 = [(PLSQLiteConnection *)self performQuery:v11];
}

BOOL __51__PLSQLiteConnection_entriesForKey_withProperties___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  entriesForKey_withProperties__classDebugEnabled = result;
  return result;
}

BOOL __51__PLSQLiteConnection_entriesForKey_withProperties___block_invoke_758(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  entriesForKey_withProperties__classDebugEnabled_757 = result;
  return result;
}

- (id)entriesForKey:(id)a3 withQuery:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  context = (void *)MEMORY[0x1C1869120]();
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [(PLSQLiteConnection *)self performQuery:v7];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = +[PLEntry entryWithEntryKey:v6 withData:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        [v14 setExistsInDB:1];
        [v8 addObject:v14];
        if ([v14 hasDynamicKeys]) {
          [(PLSQLiteConnection *)self loadDynamicValuesIntoEntry:v14];
        }
        if ([v14 hasArrayKeys]) {
          [(PLSQLiteConnection *)self loadArrayValuesIntoEntry:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v8;
}

- (void)moveDatabaseToPath:(id)a3
{
  id v4 = a3;
  if (!+[PLUtilities isPowerlogHelperd])
  {
    id v5 = [(PLSQLiteConnection *)self dbSem];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

    if ([(PLSQLiteConnection *)self dbConnection])
    {
      [(PLSQLiteConnection *)self copyDatabase:v4];
      if (_sqlite3_db_truncate())
      {
        id v6 = PLLogCommon();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
          -[PLSQLiteConnection moveDatabaseToPath:]();
        }
      }
    }
    id v7 = [(PLSQLiteConnection *)self dbSem];
    dispatch_semaphore_signal(v7);
  }
}

- (BOOL)truncateDB
{
  if (+[PLUtilities isPowerlogHelperd]) {
    return 0;
  }
  unint64_t v3 = [(PLSQLiteConnection *)self dbSem];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  if (![(PLSQLiteConnection *)self dbConnection])
  {
    uint64_t v8 = [(PLSQLiteConnection *)self dbSem];
    dispatch_semaphore_signal(v8);

    return 0;
  }
  int v4 = _sqlite3_db_truncate();
  BOOL v5 = v4 == 0;
  if (v4)
  {
    id v6 = PLLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[PLSQLiteConnection moveDatabaseToPath:]();
    }
  }
  id v7 = [(PLSQLiteConnection *)self dbSem];
  dispatch_semaphore_signal(v7);

  return v5;
}

- (void)closeConnection
{
  unint64_t v3 = [(PLSQLiteConnection *)self dbSem];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  if ([(PLSQLiteConnection *)self dbConnection])
  {
    int v4 = PLLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBD2F000, v4, OS_LOG_TYPE_DEFAULT, "Closing dbConnection!", buf, 2u);
    }

    sqlite3_close([(PLSQLiteConnection *)self dbConnection]);
    [(PLSQLiteConnection *)self setDbConnection:0];
    BOOL v5 = [(PLSQLiteConnection *)self dbSem];
    dispatch_semaphore_signal(v5);
  }
  else
  {
    id v6 = [(PLSQLiteConnection *)self dbSem];
    dispatch_semaphore_signal(v6);
  }
}

- (void)vacuum
{
  if (+[PLDefaults BOOLForKey:@"Vacuum" ifNotSet:1])
  {
    unint64_t v3 = [(PLSQLiteConnection *)self transactionLock];
    objc_sync_enter(v3);
    if (+[PLDefaults debugEnabled])
    {
      uint64_t v4 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __28__PLSQLiteConnection_vacuum__block_invoke;
      block[3] = &unk_1E6253EC0;
      uint64_t v16 = @"Vacuum";
      uint64_t v17 = v4;
      if (vacuum_defaultOnce != -1) {
        dispatch_once(&vacuum_defaultOnce, block);
      }
      int v5 = vacuum_classDebugEnabled;

      if (v5)
      {
        id v6 = [NSString stringWithFormat:@"Vacuum!"];
        id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
        uint64_t v8 = [v7 lastPathComponent];
        uint64_t v9 = [NSString stringWithUTF8String:"-[PLSQLiteConnection vacuum]"];
        +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:1981];

        uint64_t v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    if ([(PLSQLiteConnection *)self isTransactionInProgress])
    {
      uint64_t v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_1BBD2F000, v11, OS_LOG_TYPE_DEFAULT, "Vacuuming whilst in a critical data section!", v14, 2u);
      }
    }
    if ([(PLSQLiteConnection *)self isIncrementalVacuumEnabled]) {
      uint64_t v12 = @"PRAGMA incremental_vacuum;";
    }
    else {
      uint64_t v12 = @"VACUUM;";
    }
    id v13 = [(PLSQLiteConnection *)self performQuery:v12];
    objc_sync_exit(v3);
  }
}

BOOL __28__PLSQLiteConnection_vacuum__block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  vacuum_classDebugEnabled = result;
  return result;
}

- (void)fullVacuum
{
  obuint64_t j = [(PLSQLiteConnection *)self transactionLock];
  objc_sync_enter(obj);
  id v3 = [(PLSQLiteConnection *)self performQuery:@"VACUUM;"];
  objc_sync_exit(obj);
}

- (BOOL)passesIntegrityCheck
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [(PLSQLiteConnection *)self dbSem];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  id v4 = [(PLSQLiteConnection *)self filePath];
  [v4 UTF8String];
  int v5 = _sqlite3_integrity_check();

  id v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v5;
    _os_log_impl(&dword_1BBD2F000, v6, OS_LOG_TYPE_DEFAULT, "Integrity check result: %d", (uint8_t *)v9, 8u);
  }

  id v7 = [(PLSQLiteConnection *)self dbSem];
  dispatch_semaphore_signal(v7);

  return v5 == 0;
}

- (void)setJournalMode:(signed __int16)a3
{
  uint64_t v3 = a3;
  if (a3 == 1)
  {
    id v4 = @"PRAGMA journal_mode = DELETE;";
    goto LABEL_5;
  }
  if (!a3)
  {
    id v4 = @"PRAGMA journal_mode = WAL;";
LABEL_5:
    int v5 = [(PLSQLiteConnection *)self performQuery:v4];
    goto LABEL_11;
  }
  if (+[PLDefaults debugEnabled])
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"*** ERROR *** invalid journalMode=%d", v3);
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
    uint64_t v8 = [v7 lastPathComponent];
    uint64_t v9 = [NSString stringWithUTF8String:"-[PLSQLiteConnection setJournalMode:]"];
    +[PLCoreStorage logMessage:v6 fromFile:v8 fromFunction:v9 fromLineNumber:2017];

    uint64_t v10 = PLLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }
  }
  int v5 = 0;
LABEL_11:
  if (+[PLDefaults debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    long long v20 = __37__PLSQLiteConnection_setJournalMode___block_invoke;
    long long v21 = &unk_1E6253EC0;
    uint64_t v22 = @"journalMode";
    uint64_t v23 = v11;
    if (setJournalMode__defaultOnce != -1) {
      dispatch_once(&setJournalMode__defaultOnce, &block);
    }
    int v12 = setJournalMode__classDebugEnabled;

    if (v12)
    {
      id v13 = [NSString stringWithFormat:@"journalMode=%d result=%@", v3, v5, block, v19, v20, v21];
      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLSQLiteConnection.m"];
      uint64_t v15 = [v14 lastPathComponent];
      uint64_t v16 = [NSString stringWithUTF8String:"-[PLSQLiteConnection setJournalMode:]"];
      +[PLCoreStorage logMessage:v13 fromFile:v15 fromFunction:v16 fromLineNumber:2020];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
  }
}

BOOL __37__PLSQLiteConnection_setJournalMode___block_invoke(uint64_t a1)
{
  BOOL result = +[PLDefaults isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  setJournalMode__classDebugEnabled = result;
  return result;
}

- (BOOL)copyDatabase:(id)a3
{
  [a3 UTF8String];
  int v3 = _sqlite3_db_copy();
  if (v3)
  {
    id v4 = PLLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[PLSQLiteConnection copyDatabase:]();
    }
  }
  return v3 == 0;
}

- (BOOL)copyDatabaseToPath:(id)a3
{
  id v4 = a3;
  int v5 = [(PLSQLiteConnection *)self dbSem];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  LOBYTE(v5) = [(PLSQLiteConnection *)self copyDatabase:v4];
  id v6 = [(PLSQLiteConnection *)self dbSem];
  dispatch_semaphore_signal(v6);

  return (char)v5;
}

- (BOOL)copyDatabaseToPath:(id)a3 fromDate:(id)a4 toDate:(id)a5
{
  return [(PLSQLiteConnection *)self copyDatabaseToPath:a3 fromDate:a4 toDate:a5 withTableFilters:0 vacuumDB:1];
}

- (BOOL)copyDatabaseToPath:(id)a3 fromDate:(id)a4 toDate:(id)a5 withTableFilters:(id)a6 vacuumDB:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  LOBYTE(v7) = [(PLSQLiteConnection *)self copyDatabaseToPath:v15 fromDate:v14 toDate:v13 withTableFilters:v12 vacuumDB:v7 withCacheSize:[(PLSQLiteConnection *)self cacheSize]];

  return v7;
}

- (BOOL)copyDatabaseToPath:(id)a3 fromDate:(id)a4 toDate:(id)a5 withTableFilters:(id)a6 vacuumDB:(BOOL)a7 withCacheSize:(int64_t)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  unint64_t v15 = (unint64_t)a4;
  unint64_t v16 = (unint64_t)a5;
  id v17 = a6;
  long long v18 = (void *)MEMORY[0x1C1869120]();
  BOOL v19 = [(PLSQLiteConnection *)self copyDatabaseToPath:v14];
  if (v19)
  {
    long long v20 = [[PLSQLiteConnection alloc] initWithFilePath:v14 withCacheSize:a8];
    long long v21 = v20;
    if (v15 | v16) {
      [(PLSQLiteConnection *)v20 trimAllTablesFromDate:v15 toDate:v16 withTableFilters:v17];
    }
    if (v9) {
      [(PLSQLiteConnection *)v21 vacuum];
    }
    [(PLSQLiteConnection *)v21 closeConnection];
  }

  return v19;
}

- (id)cachedStatementForMetadataInsert
{
  if (!self->_metadataStmtCreated)
  {
    int v19 = 0;
    int v3 = [PLSQLStatement alloc];
    id v4 = [(PLSQLiteConnection *)self dbConnection];
    int v5 = [(PLSQLiteConnection *)self dbSem];
    id v6 = [(PLSQLStatement *)v3 initWithSQLQuery:@"INSERT INTO PLCoreStorage_Metadata_Dynamic (FK_ID, build, name, version, metadata) VALUES (?, ?, ?, ?, ?)" forDatabase:v4 withDBSem:v5 result:&v19];
    metadataStmt = self->_metadataStmt;
    self->_metadataStmt = v6;

    if (v19)
    {
      uint64_t v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(PLSQLiteConnection *)v8 cachedStatementForMetadataInsert];
      }

      unint64_t v16 = self->_metadataStmt;
      self->_metadataStmt = 0;
    }
    self->_metadataStmtCreated = 1;
  }
  id v17 = self->_metadataStmt;
  return v17;
}

- (void)writeMetadata:(id)a3 forFKID:(id)a4 build:(id)a5 name:(id)a6 version:(double)a7
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [(PLSQLiteConnection *)self cachedStatementForMetadataInsert];
  unint64_t v16 = v15;
  if (v15)
  {
    [v15 bindValue:v12 withFormater:5 atPosition:1];
    [v16 bindValue:v13 withFormater:1 atPosition:2];
    [v16 bindValue:v14 withFormater:1 atPosition:3];
    id v17 = [NSNumber numberWithDouble:a7];
    [v16 bindValue:v17 withFormater:6 atPosition:4];

    [v16 bindValue:v19 withFormater:7 atPosition:5];
    id v18 = [(PLSQLiteConnection *)self performStatement:v16];
  }
}

- (void)freeMetadataState
{
  metadataStmt = self->_metadataStmt;
  self->_metadataStmt = 0;

  self->_metadataStmtCreated = 0;
}

- (BOOL)attachDB:(id)a3 withName:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v12 = 0;
  BOOL v7 = [NSString stringWithFormat:@"ATTACH DATABASE '%@' AS '%@';", a3, v6];
  id v8 = [(PLSQLiteConnection *)self performQuery:v7 returnValue:&v12 returnResult:0];

  uint64_t v9 = sqlConnectionHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v6;
    __int16 v15 = 1024;
    int v16 = v12;
    _os_log_impl(&dword_1BBD2F000, v9, OS_LOG_TYPE_DEFAULT, "attach DB ('%@') return value '%d'", buf, 0x12u);
  }

  BOOL v10 = v12 == 0;
  return v10;
}

- (BOOL)detachDB:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v10 = 0;
  int v5 = [NSString stringWithFormat:@"DETACH DATABASE '%@';", v4];
  id v6 = [(PLSQLiteConnection *)self performQuery:v5 returnValue:&v10 returnResult:0];

  BOOL v7 = sqlConnectionHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v4;
    __int16 v13 = 1024;
    int v14 = v10;
    _os_log_impl(&dword_1BBD2F000, v7, OS_LOG_TYPE_DEFAULT, "detach DB ('%@') return value '%d'", buf, 0x12u);
  }

  BOOL v8 = v10 == 0;
  return v8;
}

- (BOOL)copyTable:(id)a3 fromConnection:(id)a4 withDBName:(id)a5 withProperties:(id)a6 andAttach:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if ([(PLSQLiteConnection *)self tableExistsForTableName:v12])
  {
    int v16 = sqlConnectionHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v12;
      _os_log_impl(&dword_1BBD2F000, v16, OS_LOG_TYPE_INFO, "table (%@) already exists", (uint8_t *)&v22, 0xCu);
    }
LABEL_20:
    BOOL v19 = 0;
LABEL_21:

    goto LABEL_22;
  }
  if (([v13 tableExistsForTableName:v12] & 1) == 0)
  {
    int v16 = sqlConnectionHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v20 = [v13 filePath];
      int v22 = 138412546;
      id v23 = v12;
      __int16 v24 = 2112;
      id v25 = v20;
      _os_log_impl(&dword_1BBD2F000, v16, OS_LOG_TYPE_INFO, "table ('%@') does not exist in source database (%@)", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_20;
  }
  if (!v7)
  {
    if ([(PLSQLiteConnection *)self copyTable:v12 fromDBName:v14 withProperties:v15])
    {
      goto LABEL_15;
    }
LABEL_16:
    int v16 = sqlConnectionHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PLSQLiteConnection copyTable:fromConnection:withDBName:withProperties:andAttach:]();
    }
    goto LABEL_20;
  }
  uint64_t v17 = [v13 filePath];
  BOOL v18 = [(PLSQLiteConnection *)self attachDB:v17 withName:v14];

  if (!v18)
  {
    int v16 = sqlConnectionHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PLSQLiteConnection copyTable:fromConnection:withDBName:withProperties:andAttach:](v13);
    }
    goto LABEL_20;
  }
  if (![(PLSQLiteConnection *)self copyTable:v12 fromDBName:v14 withProperties:v15])goto LABEL_16; {
  if (![(PLSQLiteConnection *)self detachDB:v14])
  }
  {
    int v16 = sqlConnectionHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PLSQLiteConnection copyTable:fromConnection:withDBName:withProperties:andAttach:]((uint64_t)v14, v13);
    }
    BOOL v19 = 1;
    goto LABEL_21;
  }
LABEL_15:
  BOOL v19 = 1;
LABEL_22:

  return v19;
}

- (BOOL)copyTable:(id)a3 fromDBName:(id)a4 withProperties:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  BOOL v8 = a3;
  id v9 = a4;
  int v10 = a5;
  [(PLSQLiteConnection *)self beginTransaction];
  uint64_t v11 = [NSString stringWithFormat:@"SELECT * FROM '%@'.sqlite_schema WHERE name = '%@'", v9, v8];
  id v12 = [(PLSQLiteConnection *)self performQuery:v11];

  if (v12)
  {
    id v13 = [v12 firstObject];
    id v14 = [v13 objectForKeyedSubscript:@"sql"];

    id v15 = sqlConnectionHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v54 = v8;
      __int16 v55 = 2112;
      uint64_t v56 = v14;
      _os_log_impl(&dword_1BBD2F000, v15, OS_LOG_TYPE_DEFAULT, "creating table \"%@\" with schema query '%@'", buf, 0x16u);
    }

    int v52 = 0;
    id v16 = [(PLSQLiteConnection *)self performQuery:v14 returnValue:&v52 returnResult:0];
    int v17 = v52;
    BOOL v18 = sqlConnectionHandle();
    BOOL v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[PLSQLiteConnection copyTable:fromDBName:withProperties:].cold.6();
      }
      BOOL v20 = 0;
      goto LABEL_29;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v54 = v8;
      __int16 v55 = 2112;
      uint64_t v56 = v10;
      _os_log_impl(&dword_1BBD2F000, v19, OS_LOG_TYPE_INFO, "copying entries to \"%@\" with properties %@", buf, 0x16u);
    }

    BOOL v19 = [(PLSQLiteConnection *)self sqlFormatedColumnNamesForTableInsert:v8];
    uint64_t v21 = [(PLSQLiteConnection *)self sqlFormatedColumnNamesForTableSelect:v8 withSystemOffset:0.0];
    int v22 = NSString;
    uint64_t v51 = v10;
    id v23 = [(PLSQLiteConnection *)self sqlPropertiesAsString:v10];
    uint64_t v50 = (void *)v21;
    __int16 v24 = [v22 stringWithFormat:@"SELECT %@ FROM '%@'.'%@' %@", v21, v9, v8, v23];

    id v25 = [NSString stringWithFormat:@"INSERT INTO '%@' (%@) %@", v8, v19, v24];
    uint64_t v26 = sqlConnectionHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[PLSQLiteConnection copyTable:fromDBName:withProperties:].cold.5();
    }

    id v27 = [(PLSQLiteConnection *)self performQuery:v25 returnValue:&v52 returnResult:0];
    if (v52)
    {
      long long v28 = sqlConnectionHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[PLSQLiteConnection copyTable:fromDBName:withProperties:].cold.4();
      }

      [(PLSQLiteConnection *)self endTransaction];
LABEL_19:
      BOOL v20 = 0;
LABEL_28:

      int v10 = v51;
LABEL_29:

      goto LABEL_30;
    }
    uint64_t v29 = [v51 objectForKeyedSubscript:@"uuid"];

    if (v29)
    {
      id v30 = NSString;
      unint64_t v31 = [(PLSQLiteConnection *)self sqlPropertiesAsString:v51];
      uint64_t v32 = [v30 stringWithFormat:@"SELECT IFNULL(MIN(ID), -1) as startID, IFNULL(MAX(ID), -1) as endID FROM '%@'.'%@' %@", v9, v8, v31];

      long long v33 = (void *)v32;
      long long v34 = sqlConnectionHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        -[PLSQLiteConnection copyTable:fromDBName:withProperties:]();
      }

      long long v35 = [(PLSQLiteConnection *)self performQuery:v33];
      if (!v35)
      {
        uint64_t v43 = sqlConnectionHandle();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          -[PLSQLiteConnection copyTable:fromDBName:withProperties:]();
        }

        goto LABEL_19;
      }
      int v47 = v24;
      uint64_t v49 = v33;
      long long v36 = v35;
      uint64_t v37 = [v35 firstObject];
      uint64_t v38 = [v37 objectForKeyedSubscript:@"startID"];
      int v46 = [v38 intValue];

      uint64_t v48 = v36;
      uint64_t v39 = [v36 firstObject];
      uint64_t v40 = [v39 objectForKeyedSubscript:@"endID"];
      int v45 = [v40 intValue];

      uint64_t v41 = PLLogSubmission();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        long long v44 = [v51 objectForKeyedSubscript:@"uuid"];
        *(_DWORD *)buf = 138413058;
        uint64_t v54 = v44;
        __int16 v55 = 2112;
        uint64_t v56 = v8;
        __int16 v57 = 1024;
        int v58 = v46;
        __int16 v59 = 1024;
        int v60 = v45;
        _os_log_debug_impl(&dword_1BBD2F000, v41, OS_LOG_TYPE_DEBUG, "Copy Session UUID = %@, table = '%@', startID = %d, endID = %d", buf, 0x22u);
      }
      __int16 v24 = v47;
    }
    [(PLSQLiteConnection *)self endTransaction];
    BOOL v20 = 1;
    goto LABEL_28;
  }
  id v14 = sqlConnectionHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[PLSQLiteConnection copyTable:fromDBName:withProperties:]();
  }
  BOOL v20 = 0;
LABEL_30:

  return v20;
}

- (id)sqlPropertiesAsString:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28E78] string];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"WHERE"];
  if (v5)
  {
    id v6 = (void *)v5;
    BOOL v7 = [v3 objectForKeyedSubscript:@"WHERE"];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      id v9 = [v3 objectForKeyedSubscript:@"WHERE"];
      int v10 = [v9 componentsJoinedByString:@" AND "];
      [v4 appendFormat:@"%@ %@ ", @"WHERE", v10];
    }
  }
  uint64_t v11 = [v3 objectForKeyedSubscript:@"ORDER BY"];
  if (v11)
  {
    id v12 = (void *)v11;
    id v13 = [v3 objectForKeyedSubscript:@"ORDER BY"];
    id v14 = [MEMORY[0x1E4F1CA98] null];

    if (v13 != v14)
    {
      [v4 appendFormat:@"%@ ", @"ORDER BY"];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v15 = v3;
      id v16 = [v3 objectForKeyedSubscript:@"ORDER BY"];
      int v17 = [v16 allKeys];

      obuint64_t j = v17;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        char v20 = 1;
        uint64_t v21 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(obj);
            }
            uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8 * i);
            if ((v20 & 1) == 0) {
              [v4 appendString:@", "];
            }
            __int16 v24 = [v15 objectForKeyedSubscript:@"ORDER BY"];
            id v25 = [v24 objectForKeyedSubscript:v23];
            int v26 = [v25 BOOLValue];
            id v27 = @"ASC";
            if (v26) {
              id v27 = @"DESC";
            }
            [v4 appendFormat:@"%@ %@", v23, v27];

            char v20 = 0;
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
          char v20 = 0;
        }
        while (v19);
      }

      [v4 appendString:@" "];
      id v3 = v15;
    }
  }
  long long v28 = [v3 objectForKeyedSubscript:@"LIMIT"];

  if (v28)
  {
    uint64_t v29 = [v3 objectForKeyedSubscript:@"LIMIT"];
    [v4 appendFormat:@"%@ %@ ", @"LIMIT", v29];
  }
  return v4;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (void)setDbConnection:(sqlite3 *)a3
{
  self->_dbConnection = a3;
}

- (void)setDbSem:(id)a3
{
}

- (void)setPreparedStatements:(id)a3
{
}

- (void)setPreparedUpdateStatements:(id)a3
{
}

- (void)setPreparedDynamicStatements:(id)a3
{
}

- (void)setTransactionLock:(id)a3
{
}

- (void)setCachedClassName:(id)a3
{
}

- (int)entryCacheStorageSize
{
  return self->_entryCacheStorageSize;
}

- (void)setEntryCacheStorageSize:(int)a3
{
  self->_entryCacheStorageSize = a3;
}

- (int64_t)cacheSize
{
  return self->_cacheSize;
}

- (void)setCacheSize:(int64_t)a3
{
  self->_cacheSize = a3;
}

- (BOOL)metadataStmtCreated
{
  return self->_metadataStmtCreated;
}

- (void)setMetadataStmtCreated:(BOOL)a3
{
  self->_metadataStmtCreated = a3;
}

- (PLSQLStatement)metadataStmt
{
  return (PLSQLStatement *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMetadataStmt:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataStmt, 0);
  objc_storeStrong((id *)&self->_cachedClassName, 0);
  objc_storeStrong((id *)&self->_transactionLock, 0);
  objc_storeStrong((id *)&self->_preparedDynamicStatements, 0);
  objc_storeStrong((id *)&self->_preparedUpdateStatements, 0);
  objc_storeStrong((id *)&self->_preparedStatements, 0);
  objc_storeStrong((id *)&self->_dbSem, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

- (void)openCurrentFileWithCacheSize:withFlags:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_8_0(v0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_1BBD2F000, v1, v2, "failed to open conn(%d): %s", v3, v4, v5, v6, v7);
}

- (void)openCurrentFileWithCacheSize:(void *)a1 withFlags:.cold.2(void *a1)
{
  uint64_t v1 = [a1 filePath];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_13(&dword_1BBD2F000, v2, v3, "DB Cache size %ld %@", v4, v5, v6, v7, v8);
}

- (void)mergeDataFromOtherDBFile:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)mergeDataFromOtherDBFile:(int *)a1 .cold.2(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "MERGE Detaching failed %d", (uint8_t *)v3, 8u);
}

- (void)mergeDataFromOtherDBFile:.cold.3()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_2(&dword_1BBD2F000, v0, v1, "MERGE Attaching %@ as mergeDB failed %d");
}

void __47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_247_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "MERGE : Done merging table %@", v2, v3, v4, v5, v6);
}

void __47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_247_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __47__PLSQLiteConnection_mergeDataFromOtherDBFile___block_invoke_247_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "SQL query to be executed is %@", v2, v3, v4, v5, v6);
}

- (void)writeDynamicEntriesToPPS:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "Prepare statement fail: entry=%@", v2, v3, v4, v5, v6);
}

- (void)writeDynamicEntriesToPPS:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "writeDynamic=%@", v2, v3, v4, v5, v6);
}

- (void)writeDynamicEntriesToPPS:(void *)a1 .cold.4(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_13(&dword_1BBD2F000, v1, v2, "DynamicArray=%@ and count %lu", v3, v4, v5, v6, 2u);
}

- (void)writeDynamicEntriesToPPS:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "DynamicEntry %@", v2, v3, v4, v5, v6);
}

- (void)moveDatabaseToPath:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_8_0(v0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_12(&dword_1BBD2F000, v1, v2, "Failed to truncate db %d : %s", v3, v4, v5, v6, v7);
}

- (void)copyDatabase:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_8_0(v0);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_1BBD2F000, v1, v2, "Failed to copy db %d : %s", v3, v4, v5, v6, v7);
}

- (void)cachedStatementForMetadataInsert
{
}

- (void)copyTable:(uint64_t)a1 fromConnection:(void *)a2 withDBName:withProperties:andAttach:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 filePath];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_11(&dword_1BBD2F000, v3, v4, "failed to detach DB '%@' (%@)", v5, v6, v7, v8, v9);
}

- (void)copyTable:fromConnection:withDBName:withProperties:andAttach:.cold.2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_2();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1BBD2F000, v1, OS_LOG_TYPE_ERROR, "failed to copy table '%@' from '%@'", v2, 0x16u);
}

- (void)copyTable:(void *)a1 fromConnection:withDBName:withProperties:andAttach:.cold.3(void *a1)
{
  os_log_t v1 = [a1 filePath];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_11(&dword_1BBD2F000, v2, v3, "failed to attach DB at '%@' as '%@'", v4, v5, v6, v7, v8);
}

- (void)copyTable:fromDBName:withProperties:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "skipping, cannot find table schema (%@)", v2, v3, v4, v5, v6);
}

- (void)copyTable:fromDBName:withProperties:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1BBD2F000, v0, v1, "skipping, cannot determine range with query (%@)", v2, v3, v4, v5, v6);
}

- (void)copyTable:fromDBName:withProperties:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "performing debug query '%@'", v2, v3, v4, v5, v6);
}

- (void)copyTable:fromDBName:withProperties:.cold.4()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_2(&dword_1BBD2F000, v0, v1, "failed to perform insert query '%@' with return value %d");
}

- (void)copyTable:fromDBName:withProperties:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BBD2F000, v0, v1, "performing '%@'", v2, v3, v4, v5, v6);
}

- (void)copyTable:fromDBName:withProperties:.cold.6()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_4_2(&dword_1BBD2F000, v0, v1, "failed to perform schema query '%@' with return value %d");
}

@end