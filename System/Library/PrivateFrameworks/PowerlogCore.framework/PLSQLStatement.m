@interface PLSQLStatement
- (BOOL)isDelete;
- (BOOL)isInsert;
- (OS_dispatch_semaphore)dbSem;
- (PLSQLStatement)initWithSQLQuery:(id)a3 forDatabase:(sqlite3 *)a4 withDBSem:(id)a5 result:(int *)a6;
- (id)perform;
- (int)bindValue:(id)a3 withFormater:(signed __int16)a4 atPosition:(int)a5;
- (sqlite3_stmt)statement;
- (void)dealloc;
- (void)finalize;
- (void)reset;
- (void)setDbSem:(id)a3;
- (void)setStatement:(sqlite3_stmt *)a3;
@end

@implementation PLSQLStatement

- (int)bindValue:(id)a3 withFormater:(signed __int16)a4 atPosition:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = a4;
  id v8 = a3;
  if (v6 == -32768
    || +[PLValueUtilties isFormater:v6 validForObject:v8])
  {
    v9 = [(PLSQLStatement *)self dbSem];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

    if (!v8
      || ([MEMORY[0x1E4F1CA98] null],
          id v10 = (id)objc_claimAutoreleasedReturnValue(),
          v10,
          v10 == v8))
    {
      int v13 = sqlite3_bind_null([(PLSQLStatement *)self statement], v5);
    }
    else
    {
      switch((int)v6)
      {
        case 0:
          v11 = [(PLSQLStatement *)self statement];
          int v12 = [v8 count] != 0;
          goto LABEL_23;
        case 1:
          v25 = (const char *)[v8 UTF8String];
          goto LABEL_20;
        case 2:
          v28 = [(PLSQLStatement *)self statement];
          [v8 timeIntervalSince1970];
          goto LABEL_26;
        case 3:
          v11 = [(PLSQLStatement *)self statement];
          int v12 = [v8 BOOLValue];
LABEL_23:
          int v13 = sqlite3_bind_int(v11, v5, v12);
          break;
        case 4:
          goto LABEL_29;
        case 5:
          int v13 = sqlite3_bind_int64(-[PLSQLStatement statement](self, "statement"), v5, [v8 longLongValue]);
          break;
        case 6:
          v28 = [(PLSQLStatement *)self statement];
          [v8 doubleValue];
LABEL_26:
          int v13 = sqlite3_bind_double(v28, v5, v29);
          break;
        case 7:
          if (![v8 length]) {
            goto LABEL_29;
          }
          v30 = [(PLSQLStatement *)self statement];
          id v31 = v8;
          int v13 = sqlite3_bind_blob(v30, v5, (const void *)[v31 bytes], objc_msgSend(v31, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          break;
        default:
          if (v6 != -32768)
          {
LABEL_29:
            v32 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid formatter=%i", v6);
            v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/DataTypes/PLSQLStatement.m"];
            v34 = [v33 lastPathComponent];
            v35 = [NSString stringWithUTF8String:"-[PLSQLStatement bindValue:withFormater:atPosition:]"];
            +[PLCoreStorage logMessage:v32 fromFile:v34 fromFunction:v35 fromLineNumber:75];

            v36 = PLLogCommon();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
              -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
            }

            int v14 = 0;
            goto LABEL_9;
          }
          id v24 = [v8 description];
          v25 = (const char *)[v24 UTF8String];

LABEL_20:
          v26 = [(PLSQLStatement *)self statement];
          int v27 = strlen(v25);
          int v13 = sqlite3_bind_text(v26, v5, v25, v27, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
          break;
      }
    }
    int v14 = v13;
LABEL_9:
    v15 = [(PLSQLStatement *)self dbSem];
    dispatch_semaphore_signal(v15);
  }
  else
  {
    if (!+[PLDefaults debugEnabled])
    {
      int v14 = 20;
      goto LABEL_11;
    }
    v17 = NSString;
    uint64_t v18 = objc_opt_class();
    v19 = [v8 description];
    v15 = [v17 stringWithFormat:@"*** formater does not match object type! ***\nposition=%d formater=%d class=%@ value=%@\n", v5, v6, v18, v19];

    v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/DataTypes/PLSQLStatement.m"];
    v21 = [v20 lastPathComponent];
    v22 = [NSString stringWithUTF8String:"-[PLSQLStatement bindValue:withFormater:atPosition:]"];
    +[PLCoreStorage logMessage:v15 fromFile:v21 fromFunction:v22 fromLineNumber:51];

    v23 = PLLogCommon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
    }

    int v14 = 20;
  }

LABEL_11:
  return v14;
}

- (OS_dispatch_semaphore)dbSem
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 24, 1);
}

- (sqlite3_stmt)statement
{
  return self->_statement;
}

- (void)reset
{
  v3 = [(PLSQLStatement *)self dbSem];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  sqlite3_clear_bindings([(PLSQLStatement *)self statement]);
  sqlite3_reset([(PLSQLStatement *)self statement]);
  v4 = [(PLSQLStatement *)self dbSem];
  dispatch_semaphore_signal(v4);
}

- (id)perform
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  uint64_t v5 = [(PLSQLStatement *)self dbSem];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  uint64_t v6 = [(PLSQLStatement *)self statement];
  unint64_t v7 = 0x1E6253000uLL;
  if (v6)
  {
    id v8 = v6;
    v54 = self;
    int v9 = sqlite3_column_count(v6);
    int v10 = 0;
    uint64_t v56 = v9;
    uint64_t v57 = v9;
    unint64_t v11 = 0x1E4F29000uLL;
    v55 = v3;
    while (1)
    {
      while (1)
      {
        uint64_t v12 = sqlite3_step(v8);
        if (v12 == 5) {
          break;
        }
        uint64_t v13 = v12;
        if (v12 == 100)
        {
          v19 = [MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v20 = v56;
          if ((int)v57 >= 1)
          {
            uint64_t v21 = 0;
            do
            {
              if ([v4 count] == v57)
              {
                v22 = [v4 objectAtIndex:v21];
              }
              else
              {
                v22 = objc_msgSend(*(id *)(v11 + 24), "stringWithUTF8String:", sqlite3_column_name(v8, v21));
                [v4 addObject:v22];
              }
              uint64_t v23 = sqlite3_column_type(v8, v21);
              switch((int)v23)
              {
                case 1:
                  uint64_t v24 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(v8, v21));
                  goto LABEL_31;
                case 2:
                  uint64_t v24 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(v8, v21));
                  goto LABEL_31;
                case 3:
                  v33 = sqlite3_column_text(v8, v21);
                  if (!v33) {
                    goto LABEL_29;
                  }
                  v34 = [*(id *)(v11 + 24) stringWithUTF8String:v33];
                  v35 = v34;
                  if (v34)
                  {
                    id v36 = v34;
                  }
                  else
                  {
                    id v36 = [MEMORY[0x1E4F1CA98] null];
                  }
                  v38 = v36;

                  break;
                case 4:
                  v37 = sqlite3_column_blob(v8, v21);
                  uint64_t v24 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v37, sqlite3_column_bytes(v8, v21));
                  goto LABEL_31;
                case 5:
                  goto LABEL_29;
                default:
                  uint64_t v25 = v23;
                  if ([*(id *)(v7 + 936) debugEnabled])
                  {
                    v26 = objc_msgSend(*(id *)(v11 + 24), "stringWithFormat:", @"[SQLITE] UNKNOWN DATATYPE colType=%d", v25);
                    int v27 = [*(id *)(v11 + 24) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/DataTypes/PLSQLStatement.m"];
                    uint64_t v28 = [v27 lastPathComponent];
                    unint64_t v29 = v11;
                    v30 = (void *)v28;
                    id v31 = [*(id *)(v29 + 24) stringWithUTF8String:"-[PLSQLStatement perform]"];
                    +[PLCoreStorage logMessage:v26 fromFile:v30 fromFunction:v31 fromLineNumber:138];

                    v32 = PLLogCommon();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v59 = v26;
                      _os_log_debug_impl(&dword_1BBD2F000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                    unint64_t v11 = 0x1E4F29000;
                    unint64_t v7 = 0x1E6253000;
                    uint64_t v20 = v56;
                  }
LABEL_29:
                  uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
LABEL_31:
                  v38 = (void *)v24;
                  break;
              }
              [v19 setObject:v38 forKey:v22];

              ++v21;
            }
            while (v20 != v21);
          }
          v3 = v55;
          [v55 addObject:v19];

          int v10 = 0;
          LODWORD(v13) = 100;
        }
        else
        {
          if (v12 == 101) {
            goto LABEL_45;
          }
          if ([*(id *)(v7 + 936) debugEnabled])
          {
            int v14 = objc_msgSend(*(id *)(v11 + 24), "stringWithFormat:", @"ERROR: sqlite3_step error=%d", v13);
            v15 = [*(id *)(v11 + 24) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/DataTypes/PLSQLStatement.m"];
            v16 = [v15 lastPathComponent];
            v17 = [*(id *)(v11 + 24) stringWithUTF8String:"-[PLSQLStatement perform]"];
            +[PLCoreStorage logMessage:v14 fromFile:v16 fromFunction:v17 fromLineNumber:153];

            uint64_t v18 = PLLogCommon();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v59 = v14;
              _os_log_debug_impl(&dword_1BBD2F000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            unint64_t v11 = 0x1E4F29000;
            unint64_t v7 = 0x1E6253000;
          }
          if (v13 == 11)
          {
            v46 = +[PLSQLiteConnection sharedSQLiteConnection];
            +[PLUtilities exitWithReason:1001 connection:v46];

            goto LABEL_45;
          }
        }
        if (v13 != 100) {
          goto LABEL_45;
        }
      }
      if (v10 >= 5) {
        break;
      }
      sqlite3_sleep(10);
      ++v10;
    }
    ++v10;
LABEL_45:
    v47 = [(PLSQLStatement *)v54 dbSem];
    dispatch_semaphore_signal(v47);

    if (v10 > 5 && [*(id *)(v7 + 936) debugEnabled])
    {
      v48 = [*(id *)(v11 + 24) stringWithFormat:@"WARNING: SQLITE_BUSY for too long"];
      v49 = [*(id *)(v11 + 24) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/DataTypes/PLSQLStatement.m"];
      v50 = [v49 lastPathComponent];
      v51 = [*(id *)(v11 + 24) stringWithUTF8String:"-[PLSQLStatement perform]"];
      +[PLCoreStorage logMessage:v48 fromFile:v50 fromFunction:v51 fromLineNumber:163];

      v52 = PLLogCommon();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
    id v45 = v3;
  }
  else
  {
    if (+[PLDefaults debugEnabled])
    {
      v39 = [NSString stringWithFormat:@"*** invalid statement ***"];
      v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/DataTypes/PLSQLStatement.m"];
      v41 = [v40 lastPathComponent];
      v42 = [NSString stringWithUTF8String:"-[PLSQLStatement perform]"];
      +[PLCoreStorage logMessage:v39 fromFile:v41 fromFunction:v42 fromLineNumber:93];

      v43 = PLLogCommon();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
      }
    }
    v44 = [(PLSQLStatement *)self dbSem];
    dispatch_semaphore_signal(v44);

    id v45 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v45;
}

- (BOOL)isInsert
{
  return self->_isInsert;
}

- (BOOL)isDelete
{
  return self->_isDelete;
}

- (void).cxx_destruct
{
}

- (PLSQLStatement)initWithSQLQuery:(id)a3 forDatabase:(sqlite3 *)a4 withDBSem:(id)a5 result:(int *)a6
{
  id v10 = a3;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PLSQLStatement;
  uint64_t v12 = [(PLSQLStatement *)&v27 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dbSem, a5);
    v13->_isInsert = [v10 hasPrefix:@"INSERT INTO "];
    v13->_isDelete = [v10 hasPrefix:@"DELETE FROM "];
    int v14 = [(PLSQLStatement *)v13 dbSem];
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

    if (a4)
    {
      int v15 = 5;
      do
      {
        id v16 = v10;
        int v17 = sqlite3_prepare_v2(a4, (const char *)[v16 UTF8String], -1, &v13->_statement, 0);
        *a6 = v17;
        if (!v17)
        {
          uint64_t v25 = [(PLSQLStatement *)v13 dbSem];
          dispatch_semaphore_signal(v25);

          goto LABEL_12;
        }
        --v15;
      }
      while (v15);
      if (+[PLDefaults debugEnabled])
      {
        uint64_t v18 = [NSString stringWithFormat:@"unable to prepare statement (error=%d, msg=%s) %@", *a6, sqlite3_errmsg(a4), v16];
        v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/DataTypes/PLSQLStatement.m"];
        uint64_t v20 = [v19 lastPathComponent];
        uint64_t v21 = [NSString stringWithUTF8String:"-[PLSQLStatement initWithSQLQuery:forDatabase:withDBSem:result:]"];
        +[PLCoreStorage logMessage:v18 fromFile:v20 fromFunction:v21 fromLineNumber:38];

        v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:]();
        }
      }
    }
    uint64_t v23 = [(PLSQLStatement *)v13 dbSem];
    dispatch_semaphore_signal(v23);

    uint64_t v24 = 0;
  }
  else
  {
LABEL_12:
    uint64_t v24 = v13;
  }

  return v24;
}

- (void)dealloc
{
  [(PLSQLStatement *)self finalize];
  v3.receiver = self;
  v3.super_class = (Class)PLSQLStatement;
  [(PLSQLStatement *)&v3 dealloc];
}

- (void)finalize
{
  objc_super v3 = [(PLSQLStatement *)self dbSem];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  sqlite3_clear_bindings([(PLSQLStatement *)self statement]);
  sqlite3_reset([(PLSQLStatement *)self statement]);
  sqlite3_finalize([(PLSQLStatement *)self statement]);
  v4 = [(PLSQLStatement *)self dbSem];
  dispatch_semaphore_signal(v4);
}

- (void)setStatement:(sqlite3_stmt *)a3
{
  self->_statement = a3;
}

- (void)setDbSem:(id)a3
{
}

@end