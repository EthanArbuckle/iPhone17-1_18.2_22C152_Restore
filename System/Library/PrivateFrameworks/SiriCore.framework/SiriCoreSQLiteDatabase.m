@interface SiriCoreSQLiteDatabase
- (BOOL)alterTableWithName:(id)a3 addColumn:(id)a4 error:(id *)a5;
- (BOOL)alterTableWithName:(id)a3 renameTo:(id)a4 error:(id *)a5;
- (BOOL)beginTransactionWithError:(id *)a3;
- (BOOL)checkpointWriteAheadLogWithError:(id *)a3;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)commitTransactionWithError:(id *)a3;
- (BOOL)createIndex:(id)a3 error:(id *)a4;
- (BOOL)createTable:(id)a3 error:(id *)a4;
- (BOOL)deleteFromTableWithName:(id)a3 indexedBy:(id)a4 criterion:(id)a5 error:(id *)a6;
- (BOOL)dropIndexWithName:(id)a3 error:(id *)a4;
- (BOOL)dropTableWithName:(id)a3 error:(id *)a4;
- (BOOL)executeQuery:(id)a3 error:(id *)a4;
- (BOOL)executeQueryString:(id)a3 error:(id *)a4;
- (BOOL)insertIntoTableWithName:(id)a3 record:(id)a4 error:(id *)a5;
- (BOOL)insertIntoTableWithName:(id)a3 valueMap:(id)a4 error:(id *)a5;
- (BOOL)openWithError:(id *)a3;
- (BOOL)performForeignKeyCheckWithError:(id *)a3;
- (BOOL)performIntegrityCheckWithError:(id *)a3;
- (BOOL)performQuickCheckWithError:(id *)a3;
- (BOOL)releaseSavepointWithName:(id)a3 error:(id *)a4;
- (BOOL)rollbackToSavepointWithName:(id)a3 error:(id *)a4;
- (BOOL)rollbackTransactionWithError:(id *)a3;
- (BOOL)savepointWithName:(id)a3 error:(id *)a4;
- (BOOL)updateTableWithName:(id)a3 columnName:(id)a4 columnValue:(id)a5 criterion:(id)a6 error:(id *)a7;
- (BOOL)updateTableWithName:(id)a3 valueMap:(id)a4 criterion:(id)a5 error:(id *)a6;
- (BOOL)vacuumWithError:(id *)a3;
- (NSString)path;
- (SiriCoreSQLiteDatabase)initWithPath:(id)a3 dataProtectionClass:(int64_t)a4 options:(int64_t)a5;
- (id)executeQuery:(id)a3;
- (id)fetchTableNamesWithError:(id *)a3;
- (id)fetchTableWithName:(id)a3 error:(id *)a4;
- (id)selectRecordsFromTableWithName:(id)a3 columnNames:(id)a4 behavior:(int64_t)a5 indexedBy:(id)a6 criterion:(id)a7 order:(id)a8 range:(id)a9 recordBuilder:(id)a10 error:(id *)a11;
- (id)selectValueMapsFromTableWithName:(id)a3 columnNames:(id)a4 behavior:(int64_t)a5 indexedBy:(id)a6 criterion:(id)a7 order:(id)a8 range:(id)a9 error:(id *)a10;
- (id)selectValueTuplesFromTableWithName:(id)a3 columnNames:(id)a4 behavior:(int64_t)a5 indexedBy:(id)a6 criterion:(id)a7 order:(id)a8 range:(id)a9 error:(id *)a10;
- (id)selectValuesFromTableWithName:(id)a3 columnName:(id)a4 behavior:(int64_t)a5 indexedBy:(id)a6 criterion:(id)a7 order:(id)a8 range:(id)a9 error:(id *)a10;
- (int64_t)dataProtectionClass;
- (int64_t)options;
- (unint64_t)countValuesInTableWithName:(id)a3 columnName:(id)a4 behavior:(int64_t)a5 indexedBy:(id)a6 criterion:(id)a7 range:(id)a8 error:(id *)a9;
@end

@implementation SiriCoreSQLiteDatabase

- (BOOL)beginTransactionWithError:(id *)a3
{
  return [(SiriCoreSQLiteDatabase *)self executeQueryString:@"BEGIN TRANSACTION" error:a3];
}

- (id)executeQuery:(id)a3
{
  uint64_t v169 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  ppStmt = 0;
  if (!self->_handle)
  {
    id v10 = objc_alloc(MEMORY[0x263F087E8]);
    path = self->_path;
    uint64_t v160 = *MEMORY[0x263F08068];
    v161 = path;
    v12 = [NSDictionary dictionaryWithObjects:&v161 forKeys:&v160 count:1];
    v13 = (void *)[v10 initWithDomain:@"SiriCoreSQLiteDatabaseErrorDomain" code:6 userInfo:v12];

    v14 = [[SiriCoreSQLiteQueryResult alloc] initWithQuery:v4 beginMachTime:v5 endMachTime:mach_absolute_time() statement:0 columnNameTuple:0 columnValueTuples:0 columnValuesMap:0 rowValueTuples:0 rowValueMaps:0 records:0 error:v13];
    if (!v13) {
      goto LABEL_197;
    }
    v15 = *MEMORY[0x263F28360];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28360], OS_LOG_TYPE_ERROR)) {
      goto LABEL_197;
    }
LABEL_14:
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[SiriCoreSQLiteDatabase executeQuery:]";
    __int16 v163 = 2112;
    v164 = v14;
    _os_log_error_impl(&dword_21CBF7000, v15, OS_LOG_TYPE_ERROR, "%s result = %@", buf, 0x16u);
    goto LABEL_197;
  }
  if (!v4)
  {
    id v16 = objc_alloc(MEMORY[0x263F087E8]);
    v17 = self->_path;
    uint64_t v158 = *MEMORY[0x263F08068];
    v159 = v17;
    v18 = [NSDictionary dictionaryWithObjects:&v159 forKeys:&v158 count:1];
    v13 = (void *)[v16 initWithDomain:@"SiriCoreSQLiteDatabaseErrorDomain" code:7 userInfo:v18];

    v14 = [[SiriCoreSQLiteQueryResult alloc] initWithQuery:0 beginMachTime:v5 endMachTime:mach_absolute_time() statement:0 columnNameTuple:0 columnValueTuples:0 columnValuesMap:0 rowValueTuples:0 rowValueMaps:0 records:0 error:v13];
    if (!v13) {
      goto LABEL_197;
    }
    v15 = *MEMORY[0x263F28360];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28360], OS_LOG_TYPE_ERROR)) {
      goto LABEL_197;
    }
    goto LABEL_14;
  }
  v6 = [v4 statement];
  v7 = v6;
  if (!v6)
  {
    v9 = 0;
    goto LABEL_16;
  }
  v8 = (sqlite3_stmt *)[v6 impl];
  ppStmt = v8;
  if (!v8) {
    goto LABEL_8;
  }
  v9 = v8;
  if (sqlite3_reset(v8) || sqlite3_clear_bindings(v9))
  {
    ppStmt = 0;
LABEL_8:

    v9 = 0;
    v7 = 0;
  }
LABEL_16:
  uint64_t v19 = [v4 options];
  v20 = 0;
  if (!v9 && (v19 & 0x10000) != 0)
  {
    uint64_t v21 = [v4 string];
    if (!v21)
    {
      id v25 = objc_alloc(MEMORY[0x263F087E8]);
      v26 = self->_path;
      v156[0] = *MEMORY[0x263F08068];
      v156[1] = @"query";
      v157[0] = v26;
      v157[1] = v4;
      v27 = [NSDictionary dictionaryWithObjects:v157 forKeys:v156 count:2];
      v13 = (void *)[v25 initWithDomain:@"SiriCoreSQLiteDatabaseErrorDomain" code:8 userInfo:v27];

      v14 = [[SiriCoreSQLiteQueryResult alloc] initWithQuery:v4 beginMachTime:v5 endMachTime:mach_absolute_time() statement:0 columnNameTuple:0 columnValueTuples:0 columnValuesMap:0 rowValueTuples:0 rowValueMaps:0 records:0 error:v13];
      if (v13)
      {
        v28 = *MEMORY[0x263F28360];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28360], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[SiriCoreSQLiteDatabase executeQuery:]";
          __int16 v163 = 2112;
          v164 = v14;
          _os_log_error_impl(&dword_21CBF7000, v28, OS_LOG_TYPE_ERROR, "%s result = %@", buf, 0x16u);
        }
      }
      id v29 = 0;
      goto LABEL_196;
    }
    v22 = (void *)v21;
    v23 = [(NSCache *)self->_cachedSQLiteStatementsByQueryString objectForKey:v21];
    v20 = v23;
    if (v23)
    {
      v24 = (sqlite3_stmt *)[v23 impl];
      ppStmt = v24;
      if (v24)
      {
        v9 = v24;
        if (!sqlite3_reset(v24) && !sqlite3_clear_bindings(v9)) {
          goto LABEL_30;
        }
        ppStmt = 0;
      }

      v9 = 0;
      v20 = 0;
    }
    else
    {
      v9 = 0;
    }
LABEL_30:
  }
  if (!v9)
  {
    v37 = [v4 string];
    if (v37)
    {
      handle = self->_handle;
      id v30 = v37;
      int v39 = sqlite3_prepare_v2(handle, (const char *)[v30 UTF8String], 0x80000000, &ppStmt, 0);
      if (!v39)
      {
        v129 = self;
        v77 = [SiriCoreSQLiteStatement alloc];
        uint64_t v78 = [(SiriCoreSQLiteStatement *)v77 initWithImpl:ppStmt finalizeWhenDone:1];

        id v30 = (id)v78;
        goto LABEL_33;
      }
      int v40 = v39;
      uint64_t v41 = sqlite3_extended_errcode(self->_handle);
      if (ppStmt)
      {
        sqlite3_finalize(ppStmt);
        ppStmt = 0;
      }
      id v42 = objc_alloc(MEMORY[0x263F087E8]);
      v43 = self->_path;
      v152[0] = *MEMORY[0x263F08068];
      v152[1] = @"query";
      v153[0] = v43;
      v153[1] = v4;
      v152[2] = *MEMORY[0x263F08608];
      v44 = SiriCoreSQLiteDatabaseCreateSQLiteAPIErrorFromResultCode(v40, v41);
      v153[2] = v44;
      v45 = [NSDictionary dictionaryWithObjects:v153 forKeys:v152 count:3];
      v13 = (void *)[v42 initWithDomain:@"SiriCoreSQLiteDatabaseErrorDomain" code:2 userInfo:v45];

      v14 = [[SiriCoreSQLiteQueryResult alloc] initWithQuery:v4 beginMachTime:v5 endMachTime:mach_absolute_time() statement:0 columnNameTuple:0 columnValueTuples:0 columnValuesMap:0 rowValueTuples:0 rowValueMaps:0 records:0 error:v13];
      if (v13)
      {
        v46 = *MEMORY[0x263F28360];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28360], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[SiriCoreSQLiteDatabase executeQuery:]";
          __int16 v163 = 2112;
          v164 = v14;
          _os_log_error_impl(&dword_21CBF7000, v46, OS_LOG_TYPE_ERROR, "%s result = %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v67 = objc_alloc(MEMORY[0x263F087E8]);
      v68 = self->_path;
      v154[0] = *MEMORY[0x263F08068];
      v154[1] = @"query";
      v155[0] = v68;
      v155[1] = v4;
      v69 = [NSDictionary dictionaryWithObjects:v155 forKeys:v154 count:2];
      v13 = (void *)[v67 initWithDomain:@"SiriCoreSQLiteDatabaseErrorDomain" code:8 userInfo:v69];

      v14 = [[SiriCoreSQLiteQueryResult alloc] initWithQuery:v4 beginMachTime:v5 endMachTime:mach_absolute_time() statement:0 columnNameTuple:0 columnValueTuples:0 columnValuesMap:0 rowValueTuples:0 rowValueMaps:0 records:0 error:v13];
      if (v13)
      {
        v70 = *MEMORY[0x263F28360];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28360], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&buf[4] = "-[SiriCoreSQLiteDatabase executeQuery:]";
          __int16 v163 = 2112;
          v164 = v14;
          _os_log_error_impl(&dword_21CBF7000, v70, OS_LOG_TYPE_ERROR, "%s result = %@", buf, 0x16u);
        }
      }
      id v30 = 0;
    }
    id v29 = 0;
    goto LABEL_195;
  }
  v129 = self;
  id v30 = 0;
LABEL_33:
  v136 = [v4 parameters];
  uint64_t v31 = [v136 count];
  int v32 = sqlite3_bind_parameter_count(ppStmt);
  if ((v32 & 0x80000000) == 0 && v32 != v31)
  {
    id v33 = objc_alloc(MEMORY[0x263F087E8]);
    v34 = v129->_path;
    v150[0] = *MEMORY[0x263F08068];
    v150[1] = @"query";
    v151[0] = v34;
    v151[1] = v4;
    v35 = [NSDictionary dictionaryWithObjects:v151 forKeys:v150 count:2];
    v13 = (void *)[v33 initWithDomain:@"SiriCoreSQLiteDatabaseErrorDomain" code:9 userInfo:v35];

    v14 = [[SiriCoreSQLiteQueryResult alloc] initWithQuery:v4 beginMachTime:v5 endMachTime:mach_absolute_time() statement:0 columnNameTuple:0 columnValueTuples:0 columnValuesMap:0 rowValueTuples:0 rowValueMaps:0 records:0 error:v13];
    if (v13)
    {
      v36 = *MEMORY[0x263F28360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28360], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[SiriCoreSQLiteDatabase executeQuery:]";
        __int16 v163 = 2112;
        v164 = v14;
        _os_log_error_impl(&dword_21CBF7000, v36, OS_LOG_TYPE_ERROR, "%s result = %@", buf, 0x16u);
      }
    }
    id v29 = 0;
    goto LABEL_194;
  }
  uint64_t v126 = v5;
  id v127 = v30;
  v124 = v7;
  v125 = v20;
  id v128 = v4;
  if (v31)
  {
    uint64_t v47 = 0;
    v48 = (os_log_t *)MEMORY[0x263F28360];
    do
    {
      v49 = [v136 objectAtIndex:v47];
      ++v47;
      v50 = ppStmt;
      v51 = v49;
      uint64_t v52 = [(SiriCoreSQLiteQueryResult *)v51 siriCoreSQLiteValue_type];
      switch(v52)
      {
        case 1:
          *(void *)buf = 0;
          v53 = (const void *)[(SiriCoreSQLiteQueryResult *)v51 siriCoreSQLiteValue_blobRepresentationWithLength:buf];
          int v54 = sqlite3_bind_blob64(v50, v47, v53, *(sqlite3_uint64 *)buf, 0);
          goto LABEL_56;
        case 2:
          [(SiriCoreSQLiteQueryResult *)v51 siriCoreSQLiteValue_doubleRepresentation];
          int v54 = sqlite3_bind_double(v50, v47, v59);
          goto LABEL_56;
        case 3:
          int v54 = sqlite3_bind_int64(v50, v47, [(SiriCoreSQLiteQueryResult *)v51 siriCoreSQLiteValue_integerRepresentation]);
          goto LABEL_56;
        case 4:
          int v54 = sqlite3_bind_null(v50, v47);
          goto LABEL_56;
        case 5:
          int v54 = sqlite3_bind_text(v50, v47, (const char *)[(SiriCoreSQLiteQueryResult *)v51 siriCoreSQLiteValue_textRepresentation], -1, 0);
LABEL_56:
          int v57 = v54;
          break;
        default:
          uint64_t v55 = v52;
          id v56 = [(SiriCoreSQLiteQueryResult *)v51 description];
          int v57 = sqlite3_bind_text(v50, v47, (const char *)[v56 UTF8String], -1, 0);

          v58 = *v48;
          if (os_log_type_enabled(*v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            *(void *)&buf[4] = "SiriCoreSQLiteDatabaseBindQueryParameterToSQLiteStatement";
            __int16 v163 = 2112;
            v164 = v51;
            __int16 v165 = 1024;
            int v166 = v47;
            __int16 v167 = 2048;
            uint64_t v168 = v55;
            _os_log_error_impl(&dword_21CBF7000, v58, OS_LOG_TYPE_ERROR, "%s %@ (sqlite_parameter_index = %d, valueType = %ld)", buf, 0x26u);
          }
          break;
      }

      if (v57)
      {
        uint64_t v71 = sqlite3_extended_errcode(v129->_handle);
        id v72 = objc_alloc(MEMORY[0x263F087E8]);
        v73 = v129->_path;
        v148[0] = *MEMORY[0x263F08068];
        v148[1] = @"query";
        v149[0] = v73;
        v149[1] = v4;
        v148[2] = *MEMORY[0x263F08608];
        v74 = SiriCoreSQLiteDatabaseCreateSQLiteAPIErrorFromResultCode(v57, v71);
        v149[2] = v74;
        v75 = [NSDictionary dictionaryWithObjects:v149 forKeys:v148 count:3];
        v13 = (void *)[v72 initWithDomain:@"SiriCoreSQLiteDatabaseErrorDomain" code:2 userInfo:v75];

        v14 = [[SiriCoreSQLiteQueryResult alloc] initWithQuery:v4 beginMachTime:v126 endMachTime:mach_absolute_time() statement:0 columnNameTuple:0 columnValueTuples:0 columnValuesMap:0 rowValueTuples:0 rowValueMaps:0 records:0 error:v13];
        if (v13)
        {
          v76 = *v48;
          if (os_log_type_enabled(*v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&buf[4] = "-[SiriCoreSQLiteDatabase executeQuery:]";
            __int16 v163 = 2112;
            v164 = v14;
            _os_log_error_impl(&dword_21CBF7000, v76, OS_LOG_TYPE_ERROR, "%s result = %@", buf, 0x16u);
          }
        }

        id v29 = 0;
        v7 = v124;
        v20 = v125;
        id v30 = v127;
        goto LABEL_194;
      }
    }
    while (v31 != v47);
  }
  v140 = [v4 recordBuilder];
  if ((v19 & 0x7E) == 0)
  {
    LODWORD(v61) = 0;
    if ((v19 & 0x6A) != 0)
    {
      v63 = (void *)MEMORY[0x263EFFA68];
      v20 = v125;
      uint64_t v62 = v126;
      goto LABEL_83;
    }
LABEL_80:
    v63 = 0;
    v66 = 0;
    v20 = v125;
    uint64_t v62 = v126;
    goto LABEL_86;
  }
  uint64_t v60 = sqlite3_column_count(ppStmt);
  uint64_t v61 = v60;
  if ((v19 & 0x6A) == 0) {
    goto LABEL_80;
  }
  v20 = v125;
  uint64_t v62 = v126;
  if ((int)v60 < 1)
  {
    v63 = (void *)MEMORY[0x263EFFA68];
LABEL_83:
    if ((v19 & 2) != 0) {
      v66 = (void *)[v63 copy];
    }
    else {
      v66 = 0;
    }
LABEL_86:
    v142 = v63;
    if ((v19 & 0x7C) == 0)
    {
      do
      {
        v82 = (void *)MEMORY[0x21D4B8FD0]();
        int v83 = sqlite3_step(ppStmt);
      }
      while (v83 == 100);
      id v130 = 0;
      id v131 = 0;
      id v132 = 0;
      v84 = 0;
      v85 = 0;
      goto LABEL_174;
    }
    v123 = v66;
    if ((v19 & 0xC) != 0)
    {
      if ((int)v61 < 1)
      {
        v79 = (void *)MEMORY[0x263EFFA68];
      }
      else
      {
        v79 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v61];
        int v80 = v61;
        do
        {
          id v81 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v79 addObject:v81];

          --v80;
        }
        while (v80);
      }
    }
    else
    {
      v79 = 0;
    }
    if ((v19 & 0x10) != 0)
    {
      id v132 = objc_alloc_init(MEMORY[0x263EFF980]);
      if ((v19 & 0x20) != 0) {
        goto LABEL_98;
      }
    }
    else
    {
      id v132 = 0;
      if ((v19 & 0x20) != 0)
      {
LABEL_98:
        id v131 = objc_alloc_init(MEMORY[0x263EFF980]);
LABEL_101:
        v141 = v79;
        if ((v19 & 0x40) != 0) {
          id v130 = objc_alloc_init(MEMORY[0x263EFF980]);
        }
        else {
          id v130 = 0;
        }
        uint64_t v86 = v61;
        uint64_t v135 = MEMORY[0x263EFFA68] & (v19 << 59 >> 63);
        uint64_t v134 = MEMORY[0x263EFFA78] & (v19 << 58 >> 63);
        int v133 = v61;
        while (1)
        {
          v87 = (void *)MEMORY[0x21D4B8FD0]();
          int v88 = sqlite3_step(ppStmt);
          if (v88 != 100)
          {
            int v83 = v88;
            if (v83 != 101)
            {
              v84 = 0;
              v85 = 0;
              v20 = v125;
              uint64_t v62 = v126;
              v66 = v123;
              goto LABEL_173;
            }
            v20 = v125;
            uint64_t v62 = v126;
            v66 = v123;
            if ((v19 & 4) == 0)
            {
              if ((v19 & 8) == 0)
              {
                v84 = 0;
                v85 = 0;
                goto LABEL_173;
              }
              v85 = 0;
              if ((int)v61 >= 1)
              {
LABEL_167:
                contexta = v85;
                v84 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v86];
                uint64_t v110 = 0;
                do
                {
                  v111 = [v142 objectAtIndex:v110];
                  v112 = [v141 objectAtIndex:v110];
                  [v84 setObject:v112 forKey:v111];

                  ++v110;
                }
                while (v86 != v110);
                v66 = v123;
                uint64_t v62 = v126;
                v85 = contexta;
LABEL_173:

                id v4 = v128;
LABEL_174:
                if (v83 == 101)
                {
                  contextb = v85;
                  if (v19)
                  {
                    v119 = v127;
                    if (v20) {
                      v119 = v20;
                    }
                    if (v124) {
                      v119 = v124;
                    }
                    id v29 = v119;
                  }
                  else
                  {
                    id v29 = 0;
                  }
                  if ((v19 & 0x10000) != 0 && v127)
                  {
                    cachedSQLiteStatementsByQueryString = v129->_cachedSQLiteStatementsByQueryString;
                    v121 = [v4 string];
                    [(NSCache *)cachedSQLiteStatementsByQueryString setObject:v127 forKey:v121];

                    id v4 = v128;
                  }
                  v14 = [[SiriCoreSQLiteQueryResult alloc] initWithQuery:v4 beginMachTime:v62 endMachTime:mach_absolute_time() statement:v29 columnNameTuple:v66 columnValueTuples:contextb columnValuesMap:v84 rowValueTuples:v132 rowValueMaps:v131 records:v130 error:0];

                  v13 = 0;
LABEL_192:
                  v7 = v124;
                  id v30 = v127;
                }
                else
                {

                  uint64_t v113 = sqlite3_extended_errcode(v129->_handle);
                  id v114 = objc_alloc(MEMORY[0x263F087E8]);
                  v115 = v129->_path;
                  v144[0] = *MEMORY[0x263F08068];
                  v144[1] = @"query";
                  v145[0] = v115;
                  v145[1] = v4;
                  v144[2] = *MEMORY[0x263F08608];
                  v116 = SiriCoreSQLiteDatabaseCreateSQLiteAPIErrorFromResultCode(v83, v113);
                  v145[2] = v116;
                  v117 = [NSDictionary dictionaryWithObjects:v145 forKeys:v144 count:3];
                  v13 = (void *)[v114 initWithDomain:@"SiriCoreSQLiteDatabaseErrorDomain" code:2 userInfo:v117];

                  v14 = [[SiriCoreSQLiteQueryResult alloc] initWithQuery:v4 beginMachTime:v62 endMachTime:mach_absolute_time() statement:0 columnNameTuple:0 columnValueTuples:0 columnValuesMap:0 rowValueTuples:0 rowValueMaps:0 records:0 error:v13];
                  if (!v13)
                  {
                    id v29 = 0;
                    v66 = v142;
                    goto LABEL_192;
                  }
                  v118 = *MEMORY[0x263F28360];
                  v7 = v124;
                  id v30 = v127;
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28360], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(void *)&buf[4] = "-[SiriCoreSQLiteDatabase executeQuery:]";
                    __int16 v163 = 2112;
                    v164 = v14;
                    _os_log_error_impl(&dword_21CBF7000, v118, OS_LOG_TYPE_ERROR, "%s result = %@", buf, 0x16u);
                  }
                  id v29 = 0;
                  v66 = v142;
                }
                goto LABEL_193;
              }
LABEL_172:
              v84 = (void *)MEMORY[0x263EFFA78];
              goto LABEL_173;
            }
            if ((int)v61 <= 0)
            {
              v85 = (void *)MEMORY[0x263EFFA68];
              if ((v19 & 8) != 0) {
                goto LABEL_172;
              }
            }
            else
            {
              v85 = (void *)[v141 copy];
              if ((v19 & 8) != 0) {
                goto LABEL_167;
              }
            }
            v84 = 0;
            goto LABEL_173;
          }
          context = v87;
          if ((v19 & 0x40) != 0) {
            [v140 reset];
          }
          v89 = (void *)v134;
          v90 = (void *)v135;
          if ((int)v61 >= 1) {
            break;
          }
LABEL_144:
          if ((v19 & 0x10) != 0)
          {
            [v132 addObject:v90];
            if ((v19 & 0x20) == 0)
            {
LABEL_146:
              if ((v19 & 0x40) == 0) {
                goto LABEL_153;
              }
              goto LABEL_150;
            }
          }
          else if ((v19 & 0x20) == 0)
          {
            goto LABEL_146;
          }
          [v131 addObject:v89];
          if ((v19 & 0x40) == 0) {
            goto LABEL_153;
          }
LABEL_150:
          v103 = [v140 build];
          if (v103) {
            [v130 addObject:v103];
          }

LABEL_153:
        }
        if ((v19 & 0x10) != 0)
        {
          v90 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v86];
          if ((v19 & 0x20) != 0) {
            goto LABEL_111;
          }
        }
        else
        {
          v90 = 0;
          if ((v19 & 0x20) != 0)
          {
LABEL_111:
            v89 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v86];
            goto LABEL_114;
          }
        }
        v89 = 0;
LABEL_114:
        uint64_t v91 = 0;
        while (2)
        {
          v92 = ppStmt;
          int v93 = sqlite3_column_type(ppStmt, v91);
          switch(v93)
          {
            case 1:
              uint64_t v94 = objc_msgSend(NSNumber, "numberWithLongLong:", sqlite3_column_int64(v92, v91));
              goto LABEL_128;
            case 2:
              uint64_t v94 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(v92, v91));
              goto LABEL_128;
            case 3:
              v98 = sqlite3_column_text(v92, v91);
              if (!v98) {
                goto LABEL_142;
              }
              uint64_t v94 = [[NSString alloc] initWithUTF8String:v98];
              goto LABEL_128;
            case 4:
              v99 = sqlite3_column_blob(v92, v91);
              int v100 = sqlite3_column_bytes(v92, v91);
              if (v100 < 1) {
                goto LABEL_142;
              }
              uint64_t v94 = [MEMORY[0x263EFF8F8] dataWithBytes:v99 length:v100];
LABEL_128:
              v96 = (SiriCoreSQLiteQueryResult *)v94;
              if (v94) {
                goto LABEL_129;
              }
              goto LABEL_142;
            case 5:
              uint64_t v94 = [MEMORY[0x263EFF9D0] null];
              goto LABEL_128;
            default:
              int v95 = v93;
              v96 = (SiriCoreSQLiteQueryResult *)sqlite3_column_text(v92, v91);
              if (v96) {
                v96 = (SiriCoreSQLiteQueryResult *)[[NSString alloc] initWithUTF8String:v96];
              }
              v97 = *MEMORY[0x263F28360];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28360], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                *(void *)&buf[4] = "SiriCoreSQLiteDatabaseGetColumnValueFromSQLiteStatement";
                __int16 v163 = 2112;
                v164 = v96;
                __int16 v165 = 1024;
                int v166 = v91;
                __int16 v167 = 1024;
                LODWORD(v168) = v95;
                _os_log_error_impl(&dword_21CBF7000, v97, OS_LOG_TYPE_ERROR, "%s %@ (sqlite_column_index = %d, sqlite_column_type = %d)", buf, 0x22u);
                if (v96)
                {
LABEL_129:
                  if ((v19 & 0xC) == 0) {
                    goto LABEL_131;
                  }
LABEL_130:
                  v101 = [v141 objectAtIndex:v91];
                  [v101 addObject:v96];

                  goto LABEL_131;
                }
              }
              else if (v96)
              {
                goto LABEL_129;
              }
LABEL_142:
              v96 = [MEMORY[0x263EFF9D0] null];
              if ((v19 & 0xC) != 0) {
                goto LABEL_130;
              }
LABEL_131:
              if ((v19 & 0x10) != 0) {
                [v90 addObject:v96];
              }
              if ((v19 & 0x60) != 0)
              {
                v102 = [v142 objectAtIndex:v91];
                if ((v19 & 0x20) != 0) {
                  [v89 setObject:v96 forKey:v102];
                }
                if ((v19 & 0x40) != 0) {
                  [v140 setValue:v96 forColumnName:v102];
                }
              }
              if (v86 != ++v91) {
                continue;
              }
              LODWORD(v61) = v133;
              break;
          }
          goto LABEL_144;
        }
      }
    }
    id v131 = 0;
    goto LABEL_101;
  }
  v63 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v60];
  int v64 = 0;
  while (1)
  {
    v65 = sqlite3_column_name(ppStmt, v64);
    if (v65)
    {
      v66 = (void *)[[NSString alloc] initWithUTF8String:v65];
      if (!v63) {
        break;
      }
      goto LABEL_67;
    }
    v66 = 0;
    if (!v63) {
      break;
    }
LABEL_67:
    [v63 addObject:v66];

    if (v61 == ++v64) {
      goto LABEL_83;
    }
  }
  id v104 = objc_alloc(MEMORY[0x263F087E8]);
  uint64_t v105 = *MEMORY[0x263F08068];
  v147[0] = v129->_path;
  v146[0] = v105;
  v146[1] = @"columnCount";
  v106 = [NSNumber numberWithInt:v61];
  v147[1] = v106;
  v146[2] = @"columnIndex";
  v107 = [NSNumber numberWithInt:0];
  v146[3] = @"query";
  v147[2] = v107;
  v147[3] = v4;
  v108 = [NSDictionary dictionaryWithObjects:v147 forKeys:v146 count:4];
  v13 = (void *)[v104 initWithDomain:@"SiriCoreSQLiteDatabaseErrorDomain" code:10 userInfo:v108];

  v14 = [[SiriCoreSQLiteQueryResult alloc] initWithQuery:v4 beginMachTime:v126 endMachTime:mach_absolute_time() statement:0 columnNameTuple:0 columnValueTuples:0 columnValuesMap:0 rowValueTuples:0 rowValueMaps:0 records:0 error:v13];
  if (!v13)
  {
    id v29 = 0;
    goto LABEL_192;
  }
  v109 = *MEMORY[0x263F28360];
  v7 = v124;
  id v30 = v127;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28360], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[SiriCoreSQLiteDatabase executeQuery:]";
    __int16 v163 = 2112;
    v164 = v14;
    _os_log_error_impl(&dword_21CBF7000, v109, OS_LOG_TYPE_ERROR, "%s result = %@", buf, 0x16u);
  }
  id v29 = 0;
LABEL_193:

LABEL_194:
LABEL_195:

LABEL_196:
LABEL_197:

  return v14;
}

- (BOOL)executeQueryString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [[SiriCoreSQLiteQuery alloc] initWithString:v6 statement:0 parameters:0 recordBuilder:0 options:0];

  LOBYTE(a4) = [(SiriCoreSQLiteDatabase *)self executeQuery:v7 error:a4];
  return (char)a4;
}

void __71__SiriCoreSQLiteDatabase_Insert__insertIntoTableWithName_record_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  uint64_t v8 = objc_msgSend(a2, "siriCoreSQLiteValue_escapedString:", 1);
  v9 = (void *)v8;
  if (v5) {
    [v6 appendFormat:@", %@", v8];
  }
  else {
    [v6 appendString:v8];
  }

  [*(id *)(a1 + 40) addObject:v7];
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (BOOL)insertIntoTableWithName:(id)a3 record:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  v22 = __71__SiriCoreSQLiteDatabase_Insert__insertIntoTableWithName_record_error___block_invoke;
  v23 = &unk_26443ADF8;
  v26 = v27;
  id v12 = v10;
  id v24 = v12;
  id v13 = v11;
  id v25 = v13;
  objc_msgSend(v9, "siriCoreSQLiteRecord_enumerateColumnNamesAndValuesUsingBlock:", &v20);
  id v14 = [NSString alloc];
  v15 = objc_msgSend(v8, "siriCoreSQLiteValue_escapedString:", 1);
  id v16 = SiriCoreSQLiteQueryCreateParametrizedAndCommaSeparatedString([v13 count]);
  v17 = (void *)[v14 initWithFormat:@"INSERT INTO %@ (%@) VALUES (%@)", v15, v12, v16, v20, v21, v22, v23];

  v18 = [[SiriCoreSQLiteQuery alloc] initWithString:v17 statement:0 parameters:v13 recordBuilder:0 options:0];
  LOBYTE(a5) = [(SiriCoreSQLiteDatabase *)self executeQuery:v18 error:a5];

  _Block_object_dispose(v27, 8);
  return (char)a5;
}

- (BOOL)executeQuery:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  uint64_t v5 = [(SiriCoreSQLiteDatabase *)self executeQuery:a3];
  id v6 = [v5 error];
  id v7 = v6;
  if (a4 && v6) {
    *a4 = v6;
  }

  return v7 == 0;
}

- (BOOL)commitTransactionWithError:(id *)a3
{
  return [(SiriCoreSQLiteDatabase *)self executeQueryString:@"COMMIT TRANSACTION" error:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_cachedSQLiteStatementsByQueryString, 0);
}

- (int64_t)options
{
  return self->_options;
}

- (int64_t)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (NSString)path
{
  return self->_path;
}

- (BOOL)checkpointWriteAheadLogWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F28360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28360], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v21 = "-[SiriCoreSQLiteDatabase checkpointWriteAheadLogWithError:]";
    _os_log_impl(&dword_21CBF7000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  int v6 = sqlite3_wal_checkpoint_v2(self->_handle, 0, 1, 0, 0);
  int v7 = v6;
  if (a3 && v6)
  {
    uint64_t v8 = sqlite3_extended_errcode(self->_handle);
    id v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08068];
    v19[0] = self->_path;
    uint64_t v11 = *MEMORY[0x263F08608];
    uint64_t v17 = v10;
    uint64_t v18 = v11;
    id v12 = SiriCoreSQLiteDatabaseCreateSQLiteAPIErrorFromResultCode(v7, v8);
    v19[1] = v12;
    id v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v17 count:2];
    id v14 = objc_msgSend(v9, "errorWithDomain:code:userInfo:", @"SiriCoreSQLiteDatabaseErrorDomain", 2, v13, v17, v18, v19[0]);

    id v15 = v14;
    *a3 = v15;
  }
  return v7 == 0;
}

- (BOOL)closeWithError:(id *)a3
{
  v29[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = (NSObject **)MEMORY[0x263F28360];
  int v6 = *MEMORY[0x263F28360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28360], OS_LOG_TYPE_INFO))
  {
    int v22 = 136315138;
    v23 = "-[SiriCoreSQLiteDatabase closeWithError:]";
    _os_log_impl(&dword_21CBF7000, v6, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v22, 0xCu);
  }
  if (a3) {
    *a3 = 0;
  }
  handle = self->_handle;
  if (handle)
  {
    int v8 = sqlite3_close_v2(handle);
    BOOL v9 = v8 == 0;
    if (v8)
    {
      int v10 = v8;
      uint64_t v11 = sqlite3_extended_errcode(self->_handle);
      id v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = *MEMORY[0x263F08068];
      v29[0] = self->_path;
      uint64_t v14 = *MEMORY[0x263F08608];
      v28[0] = v13;
      v28[1] = v14;
      id v15 = SiriCoreSQLiteDatabaseCreateSQLiteAPIErrorFromResultCode(v10, v11);
      v29[1] = v15;
      id v16 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
      uint64_t v17 = [v12 errorWithDomain:@"SiriCoreSQLiteDatabaseErrorDomain" code:2 userInfo:v16];
    }
    else
    {
      uint64_t v17 = 0;
      self->_handle = 0;
    }
    [(NSCache *)self->_cachedSQLiteStatementsByQueryString removeAllObjects];
    if (a3) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v17 = 0;
    BOOL v9 = 1;
    if (a3) {
LABEL_12:
    }
      *a3 = v17;
  }
  if (v17) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = v9;
  }
  uint64_t v19 = *v5;
  uint64_t v20 = *v5;
  if (v18)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v22 = 136315138;
      v23 = "-[SiriCoreSQLiteDatabase closeWithError:]";
      _os_log_impl(&dword_21CBF7000, v19, OS_LOG_TYPE_INFO, "%s done", (uint8_t *)&v22, 0xCu);
    }
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    int v22 = 136315650;
    v23 = "-[SiriCoreSQLiteDatabase closeWithError:]";
    __int16 v24 = 1024;
    BOOL v25 = v9;
    __int16 v26 = 2112;
    v27 = v17;
    _os_log_error_impl(&dword_21CBF7000, v19, OS_LOG_TYPE_ERROR, "%s success = %d, error = %@", (uint8_t *)&v22, 0x1Cu);
  }

  return v9;
}

- (BOOL)openWithError:(id *)a3
{
  v73[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = (os_log_t *)MEMORY[0x263F28360];
  int v6 = *MEMORY[0x263F28360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28360], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    double v59 = "-[SiriCoreSQLiteDatabase openWithError:]";
    _os_log_impl(&dword_21CBF7000, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (a3) {
    *a3 = 0;
  }
  p_handle = &self->_handle;
  if (self->_handle)
  {
    id v8 = 0;
    int v9 = 1;
    if (!a3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (!self->_path)
  {
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"SiriCoreSQLiteDatabaseErrorDomain" code:3 userInfo:0];
    goto LABEL_22;
  }
  char v57 = 0;
  uint64_t v14 = [MEMORY[0x263F08850] defaultManager];
  int v15 = [v14 fileExistsAtPath:self->_path isDirectory:&v57];

  if (v15)
  {
    if (v57)
    {
      id v16 = (void *)MEMORY[0x263F087E8];
      path = self->_path;
      uint64_t v72 = *MEMORY[0x263F08068];
      v73[0] = path;
      BOOL v18 = [NSDictionary dictionaryWithObjects:v73 forKeys:&v72 count:1];
      id v8 = [v16 errorWithDomain:@"SiriCoreSQLiteDatabaseErrorDomain" code:4 userInfo:v18];

LABEL_22:
      int v9 = 0;
      goto LABEL_46;
    }
    goto LABEL_26;
  }
  uint64_t v19 = [(NSString *)self->_path stringByDeletingLastPathComponent];
  uint64_t v20 = [MEMORY[0x263F08850] defaultManager];
  int v21 = [v20 fileExistsAtPath:v19 isDirectory:&v57];

  if (v21)
  {
    if (!v57)
    {
      int v39 = (void *)MEMORY[0x263F087E8];
      uint64_t v70 = *MEMORY[0x263F08068];
      uint64_t v71 = v19;
      int v40 = [NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      id v8 = [v39 errorWithDomain:@"SiriCoreSQLiteDatabaseErrorDomain" code:5 userInfo:v40];

      goto LABEL_22;
    }

LABEL_26:
    id v8 = 0;
    goto LABEL_28;
  }
  int v22 = [MEMORY[0x263F08850] defaultManager];
  id v56 = 0;
  int v23 = [v22 createDirectoryAtPath:v19 withIntermediateDirectories:1 attributes:0 error:&v56];
  id v8 = v56;

  if (!v23) {
    goto LABEL_22;
  }
LABEL_28:
  unint64_t v24 = self->_dataProtectionClass - 1;
  if (v24 >= 3) {
    int v25 = 1048582;
  }
  else {
    int v25 = (v24 << 20) + 2097158;
  }
  int v26 = sqlite3_open_v2([(NSString *)self->_path fileSystemRepresentation], &self->_handle, v25, 0);
  if (v26)
  {
    int v27 = v26;
    uint64_t v28 = sqlite3_extended_errcode(self->_handle);
    id v29 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08068];
    v69[0] = self->_path;
    uint64_t v31 = *MEMORY[0x263F08608];
    v68[0] = v30;
    v68[1] = v31;
    int v32 = SiriCoreSQLiteDatabaseCreateSQLiteAPIErrorFromResultCode(v27, v28);
    v69[1] = v32;
    id v33 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];
    uint64_t v34 = [v29 errorWithDomain:@"SiriCoreSQLiteDatabaseErrorDomain" code:2 userInfo:v33];

    int v9 = 0;
    self->_handle = 0;
    id v8 = (id)v34;
  }
  else
  {
    if ((self->_options & 2) != 0)
    {
      int v35 = sqlite3_exec(*p_handle, "PRAGMA journal_mode=WAL", 0, 0, 0);
      if (v35)
      {
        int v36 = v35;
        int v37 = sqlite3_extended_errcode(*p_handle);
        v38 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          double v59 = "-[SiriCoreSQLiteDatabase openWithError:]";
          __int16 v60 = 1024;
          int v61 = v36;
          __int16 v62 = 1024;
          LODWORD(v63) = v37;
          _os_log_error_impl(&dword_21CBF7000, v38, OS_LOG_TYPE_ERROR, "%s Failed to enable WAL journal_mode with errorCode: %d, extendedCode: %d", buf, 0x18u);
        }
      }
      else
      {
        uint64_t v41 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          double v59 = "-[SiriCoreSQLiteDatabase openWithError:]";
          _os_log_debug_impl(&dword_21CBF7000, v41, OS_LOG_TYPE_DEBUG, "%s WAL mode enabled succesfully.", buf, 0xCu);
        }
      }
    }
    id v42 = [NSURL fileURLWithPath:self->_path];
    v43 = [NSNumber numberWithInt:self->_options & 1];
    uint64_t v44 = *MEMORY[0x263EFF6B0];
    id v55 = v8;
    int v9 = [v42 setResourceValue:v43 forKey:v44 error:&v55];
    id v45 = v55;

    if ((v9 & 1) == 0)
    {
      v46 = (void *)MEMORY[0x263F087E8];
      if (v45)
      {
        uint64_t v47 = self->_path;
        uint64_t v48 = *MEMORY[0x263F08608];
        v66[0] = *MEMORY[0x263F08068];
        v66[1] = v48;
        v67[0] = v47;
        v67[1] = v45;
        v49 = NSDictionary;
        v50 = (NSString **)v67;
        v51 = v66;
        uint64_t v52 = 2;
      }
      else
      {
        uint64_t v64 = *MEMORY[0x263F08068];
        v65 = self->_path;
        v49 = NSDictionary;
        v50 = &v65;
        v51 = &v64;
        uint64_t v52 = 1;
      }
      v53 = [v49 dictionaryWithObjects:v50 forKeys:v51 count:v52];
      uint64_t v54 = [v46 errorWithDomain:@"SiriCoreSQLiteDatabaseErrorDomain" code:1 userInfo:v53];

      sqlite3_close_v2(*p_handle);
      *p_handle = 0;
      id v45 = (id)v54;
    }

    id v8 = v45;
  }
LABEL_46:
  [(NSCache *)self->_cachedSQLiteStatementsByQueryString removeAllObjects];
  if (a3) {
LABEL_7:
  }
    *a3 = v8;
LABEL_8:
  if (v8) {
    char v10 = 0;
  }
  else {
    char v10 = v9;
  }
  uint64_t v11 = *v5;
  id v12 = *v5;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      double v59 = "-[SiriCoreSQLiteDatabase openWithError:]";
      _os_log_impl(&dword_21CBF7000, v11, OS_LOG_TYPE_INFO, "%s done", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    double v59 = "-[SiriCoreSQLiteDatabase openWithError:]";
    __int16 v60 = 1024;
    int v61 = v9;
    __int16 v62 = 2112;
    id v63 = v8;
    _os_log_error_impl(&dword_21CBF7000, v11, OS_LOG_TYPE_ERROR, "%s success = %d, error = %@", buf, 0x1Cu);
  }

  return v9;
}

- (SiriCoreSQLiteDatabase)initWithPath:(id)a3 dataProtectionClass:(int64_t)a4 options:(int64_t)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SiriCoreSQLiteDatabase;
  int v9 = [(SiriCoreSQLiteDatabase *)&v16 init];
  if (v9)
  {
    char v10 = [v8 stringByStandardizingPath];
    uint64_t v11 = [v10 copy];
    path = v9->_path;
    v9->_path = (NSString *)v11;

    v9->_dataProtectionClass = a4;
    v9->_options = a5;
    uint64_t v13 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    cachedSQLiteStatementsByQueryString = v9->_cachedSQLiteStatementsByQueryString;
    v9->_cachedSQLiteStatementsByQueryString = v13;

    [(NSCache *)v9->_cachedSQLiteStatementsByQueryString setCountLimit:64];
  }

  return v9;
}

- (BOOL)updateTableWithName:(id)a3 columnName:(id)a4 columnValue:(id)a5 criterion:(id)a6 error:(id *)a7
{
  id v12 = (objc_class *)NSString;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v12 alloc];
  BOOL v18 = objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);

  uint64_t v19 = objc_msgSend(v15, "siriCoreSQLiteValue_escapedString:", 1);

  uint64_t v20 = objc_msgSend(v14, "siriCoreSQLiteValue_escapedString:", 1);

  int v21 = (void *)[v17 initWithFormat:@"UPDATE %@ SET %@ = %@", v18, v19, v20];
  int v22 = SiriCoreSQLiteQueryCreateCriterionExpression(v13);

  if (v22)
  {
    uint64_t v23 = [v21 stringByAppendingFormat:@" WHERE %@", v22];

    int v21 = (void *)v23;
  }
  unint64_t v24 = [[SiriCoreSQLiteQuery alloc] initWithString:v21 statement:0 parameters:0 recordBuilder:0 options:0];
  BOOL v25 = [(SiriCoreSQLiteDatabase *)self executeQuery:v24 error:a7];

  return v25;
}

- (BOOL)updateTableWithName:(id)a3 valueMap:(id)a4 criterion:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v11 count];
  id v14 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v13];
  id v15 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v13];
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  id v29 = __79__SiriCoreSQLiteDatabase_Update__updateTableWithName_valueMap_criterion_error___block_invoke;
  uint64_t v30 = &unk_26443ADD0;
  id v16 = v14;
  id v31 = v16;
  id v17 = v15;
  id v32 = v17;
  [v11 enumerateKeysAndObjectsUsingBlock:&v27];

  id v18 = [NSString alloc];
  uint64_t v19 = objc_msgSend(v12, "siriCoreSQLiteValue_escapedString:", 1);

  uint64_t v20 = [v16 componentsJoinedByString:@", "];
  int v21 = (void *)[v18 initWithFormat:@"UPDATE %@ SET %@", v19, v20, v27, v28, v29, v30];

  int v22 = SiriCoreSQLiteQueryCreateCriterionExpression(v10);

  if (v22)
  {
    uint64_t v23 = [v21 stringByAppendingFormat:@" WHERE %@", v22];

    int v21 = (void *)v23;
  }
  unint64_t v24 = [[SiriCoreSQLiteQuery alloc] initWithString:v21 statement:0 parameters:v17 recordBuilder:0 options:0];
  BOOL v25 = [(SiriCoreSQLiteDatabase *)self executeQuery:v24 error:a6];

  return v25;
}

void __79__SiriCoreSQLiteDatabase_Update__updateTableWithName_valueMap_criterion_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  int v6 = (objc_class *)NSString;
  id v11 = a3;
  id v7 = a2;
  id v8 = [v6 alloc];
  int v9 = objc_msgSend(v7, "siriCoreSQLiteValue_escapedString:", 1);

  id v10 = (void *)[v8 initWithFormat:@"%@ = ?", v9];
  [v5 addObject:v10];

  [*(id *)(a1 + 40) addObject:v11];
}

- (BOOL)rollbackTransactionWithError:(id *)a3
{
  return [(SiriCoreSQLiteDatabase *)self executeQueryString:@"ROLLBACK TRANSACTION" error:a3];
}

- (unint64_t)countValuesInTableWithName:(id)a3 columnName:(id)a4 behavior:(int64_t)a5 indexedBy:(id)a6 criterion:(id)a7 range:(id)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (a9) {
    *a9 = 0;
  }
  uint64_t v47 = v15;
  if (a5 == 2)
  {
    id v22 = [NSString alloc];
    if (v16)
    {
      objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
      int v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v21 = @"*";
    }
    unint64_t v24 = objc_msgSend(v15, "siriCoreSQLiteValue_escapedString:", 1);
    uint64_t v25 = [v22 initWithFormat:@"SELECT ALL COUNT(%@) FROM %@", v21, v24];
  }
  else if (a5 == 1)
  {
    id v20 = [NSString alloc];
    if (v16)
    {
      objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
      int v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v21 = @"*";
    }
    unint64_t v24 = objc_msgSend(v15, "siriCoreSQLiteValue_escapedString:", 1);
    uint64_t v25 = [v20 initWithFormat:@"SELECT DISTINCT COUNT(%@) FROM %@", v21, v24];
  }
  else
  {
    id v23 = [NSString alloc];
    if (v16)
    {
      objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
      int v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      int v21 = @"*";
    }
    unint64_t v24 = objc_msgSend(v15, "siriCoreSQLiteValue_escapedString:", 1);
    uint64_t v25 = [v23 initWithFormat:@"SELECT COUNT(%@) FROM %@", v21, v24];
  }
  int v26 = (void *)v25;

  if (v16) {
  uint64_t v27 = _SiriCoreSQLiteApplyIndexToQuery(v17, v26);
  }

  uint64_t v28 = SiriCoreSQLiteQueryCreateCriterionExpression(v18);
  id v45 = (void *)v28;
  if (v28)
  {
    uint64_t v29 = [v27 stringByAppendingFormat:@" WHERE %@", v28];

    uint64_t v27 = (void *)v29;
  }
  v46 = v19;
  uint64_t v30 = SiriCoreSQLiteQueryCreateRangeExpression(v19);
  id v31 = (void *)v30;
  if (v30)
  {
    uint64_t v32 = [v27 stringByAppendingFormat:@" %@", v30];

    uint64_t v27 = (void *)v32;
  }
  id v33 = [[SiriCoreSQLiteQuery alloc] initWithString:v27 statement:0 parameters:0 recordBuilder:0 options:4];
  uint64_t v34 = [(SiriCoreSQLiteDatabase *)self executeQuery:v33];
  int v35 = [v34 error];
  int v36 = v35;
  if (v35)
  {
    unint64_t v37 = 0;
    if (a9) {
      *a9 = v35;
    }
  }
  else
  {
    [v34 columnValueTuples];
    v38 = id v43 = v18;
    [v38 firstObject];
    int v39 = v44 = v17;
    [v39 firstObject];
    v41 = id v40 = v16;
    unint64_t v37 = [v41 unsignedIntegerValue];

    id v16 = v40;
    id v17 = v44;

    id v18 = v43;
  }

  return v37;
}

- (id)selectValuesFromTableWithName:(id)a3 columnName:(id)a4 behavior:(int64_t)a5 indexedBy:(id)a6 criterion:(id)a7 order:(id)a8 range:(id)a9 error:(id *)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v49 = a9;
  if (a10) {
    *a10 = 0;
  }
  uint64_t v48 = v15;
  if (a5 == 2)
  {
    id v24 = [NSString alloc];
    int v21 = objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
    id v22 = objc_msgSend(v15, "siriCoreSQLiteValue_escapedString:", 1);
    uint64_t v23 = [v24 initWithFormat:@"SELECT ALL %@ FROM %@", v21, v22];
  }
  else
  {
    id v20 = [NSString alloc];
    int v21 = objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
    objc_msgSend(v15, "siriCoreSQLiteValue_escapedString:", 1);
    if (a5 == 1) {
      id v22 = {;
    }
      uint64_t v23 = [v20 initWithFormat:@"SELECT DISTINCT %@ FROM %@", v21, v22];
    }
    else {
      id v22 = {;
    }
      uint64_t v23 = [v20 initWithFormat:@"SELECT %@ FROM %@", v21, v22];
    }
  }
  uint64_t v25 = (void *)v23;

  int v26 = _SiriCoreSQLiteApplyIndexToQuery(v17, v25);

  uint64_t v27 = SiriCoreSQLiteQueryCreateCriterionExpression(v18);
  uint64_t v28 = (void *)v27;
  if (v27)
  {
    uint64_t v29 = [v26 stringByAppendingFormat:@" WHERE %@", v27];

    int v26 = (void *)v29;
  }
  id v45 = v19;
  uint64_t v30 = SiriCoreSQLiteQueryCreateOrderExpression(v19);
  id v31 = (void *)v30;
  if (v30)
  {
    uint64_t v32 = [v26 stringByAppendingFormat:@" %@", v30];

    int v26 = (void *)v32;
  }
  uint64_t v33 = SiriCoreSQLiteQueryCreateRangeExpression(v49);
  uint64_t v34 = (void *)v33;
  v46 = v18;
  uint64_t v47 = v17;
  if (v33)
  {
    uint64_t v35 = [v26 stringByAppendingFormat:@" %@", v33];

    int v26 = (void *)v35;
  }
  int v36 = [[SiriCoreSQLiteQuery alloc] initWithString:v26 statement:0 parameters:0 recordBuilder:0 options:4];
  unint64_t v37 = [(SiriCoreSQLiteDatabase *)self executeQuery:v36];
  v38 = [v37 error];
  int v39 = v38;
  if (v38)
  {
    id v40 = 0;
    if (a10) {
      *a10 = v38;
    }
  }
  else
  {
    [v37 columnValueTuples];
    v42 = id v41 = v16;
    id v40 = [v42 firstObject];

    id v16 = v41;
  }

  return v40;
}

- (id)selectRecordsFromTableWithName:(id)a3 columnNames:(id)a4 behavior:(int64_t)a5 indexedBy:(id)a6 criterion:(id)a7 order:(id)a8 range:(id)a9 recordBuilder:(id)a10 error:(id *)a11
{
  id v47 = a3;
  id v17 = a4;
  id v18 = a6;
  id v49 = a8;
  id v48 = a9;
  if (a11) {
    *a11 = 0;
  }
  id v19 = a10;
  id v20 = a7;
  uint64_t v21 = [v17 count];
  id v45 = self;
  v46 = v17;
  if (a5 == 2)
  {
    id v24 = [NSString alloc];
    if (v21)
    {
      SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v17, 1);
      uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v23 = @"*";
    }
    int v26 = objc_msgSend(v47, "siriCoreSQLiteValue_escapedString:", 1);
    uint64_t v27 = [v24 initWithFormat:@"SELECT ALL %@ FROM %@", v23, v26];
  }
  else if (a5 == 1)
  {
    id v22 = [NSString alloc];
    if (v21)
    {
      SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v17, 1);
      uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v23 = @"*";
    }
    int v26 = objc_msgSend(v47, "siriCoreSQLiteValue_escapedString:", 1);
    uint64_t v27 = [v22 initWithFormat:@"SELECT DISTINCT %@ FROM %@", v23, v26];
  }
  else
  {
    id v25 = [NSString alloc];
    if (v21)
    {
      SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v17, 1);
      uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v23 = @"*";
    }
    int v26 = objc_msgSend(v47, "siriCoreSQLiteValue_escapedString:", 1);
    uint64_t v27 = [v25 initWithFormat:@"SELECT %@ FROM %@", v23, v26];
  }
  uint64_t v28 = (void *)v27;

  if (v21) {
  uint64_t v29 = _SiriCoreSQLiteApplyIndexToQuery(v18, v28);
  }

  uint64_t v30 = SiriCoreSQLiteQueryCreateCriterionExpression(v20);

  if (v30)
  {
    uint64_t v31 = [v29 stringByAppendingFormat:@" WHERE %@", v30];

    uint64_t v29 = (void *)v31;
  }
  uint64_t v32 = SiriCoreSQLiteQueryCreateOrderExpression(v49);
  uint64_t v33 = (void *)v32;
  if (v32)
  {
    uint64_t v34 = [v29 stringByAppendingFormat:@" %@", v32];

    uint64_t v29 = (void *)v34;
  }
  uint64_t v35 = SiriCoreSQLiteQueryCreateRangeExpression(v48);
  int v36 = (void *)v35;
  unint64_t v37 = v18;
  if (v35)
  {
    uint64_t v38 = [v29 stringByAppendingFormat:@" %@", v35];

    uint64_t v29 = (void *)v38;
  }
  int v39 = [[SiriCoreSQLiteQuery alloc] initWithString:v29 statement:0 parameters:0 recordBuilder:v19 options:64];

  id v40 = [(SiriCoreSQLiteDatabase *)v45 executeQuery:v39];
  id v41 = [v40 error];
  id v42 = v41;
  if (v41)
  {
    id v43 = 0;
    if (a11) {
      *a11 = v41;
    }
  }
  else
  {
    id v43 = [v40 records];
  }

  return v43;
}

- (id)selectValueMapsFromTableWithName:(id)a3 columnNames:(id)a4 behavior:(int64_t)a5 indexedBy:(id)a6 criterion:(id)a7 order:(id)a8 range:(id)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  id v47 = a9;
  if (a10) {
    *a10 = 0;
  }
  id v20 = a7;
  uint64_t v21 = [v17 count];
  if (a5 == 2)
  {
    id v24 = [NSString alloc];
    if (v21)
    {
      SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v17, 1);
      uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v23 = @"*";
    }
    int v26 = objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
    uint64_t v27 = [v24 initWithFormat:@"SELECT ALL %@ FROM %@", v23, v26];
  }
  else if (a5 == 1)
  {
    id v22 = [NSString alloc];
    if (v21)
    {
      SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v17, 1);
      uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v23 = @"*";
    }
    int v26 = objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
    uint64_t v27 = [v22 initWithFormat:@"SELECT DISTINCT %@ FROM %@", v23, v26];
  }
  else
  {
    id v25 = [NSString alloc];
    if (v21)
    {
      SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v17, 1);
      uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v23 = @"*";
    }
    int v26 = objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
    uint64_t v27 = [v25 initWithFormat:@"SELECT %@ FROM %@", v23, v26];
  }
  uint64_t v28 = (void *)v27;

  if (v21) {
  uint64_t v29 = _SiriCoreSQLiteApplyIndexToQuery(v18, v28);
  }

  uint64_t v30 = SiriCoreSQLiteQueryCreateCriterionExpression(v20);

  if (v30)
  {
    uint64_t v31 = [v29 stringByAppendingFormat:@" WHERE %@", v30];

    uint64_t v29 = (void *)v31;
  }
  uint64_t v32 = SiriCoreSQLiteQueryCreateOrderExpression(v19);
  uint64_t v33 = (void *)v32;
  v46 = v16;
  if (v32)
  {
    uint64_t v34 = [v29 stringByAppendingFormat:@" %@", v32];

    uint64_t v29 = (void *)v34;
  }
  id v45 = v19;
  uint64_t v35 = SiriCoreSQLiteQueryCreateRangeExpression(v47);
  int v36 = (void *)v35;
  unint64_t v37 = v18;
  if (v35)
  {
    uint64_t v38 = [v29 stringByAppendingFormat:@" %@", v35];

    uint64_t v29 = (void *)v38;
  }
  int v39 = [[SiriCoreSQLiteQuery alloc] initWithString:v29 statement:0 parameters:0 recordBuilder:0 options:32];
  id v40 = [(SiriCoreSQLiteDatabase *)self executeQuery:v39];
  id v41 = [v40 error];
  id v42 = v41;
  if (v41)
  {
    id v43 = 0;
    if (a10) {
      *a10 = v41;
    }
  }
  else
  {
    id v43 = [v40 rowValueMaps];
  }

  return v43;
}

- (id)selectValueTuplesFromTableWithName:(id)a3 columnNames:(id)a4 behavior:(int64_t)a5 indexedBy:(id)a6 criterion:(id)a7 order:(id)a8 range:(id)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a8;
  id v47 = a9;
  if (a10) {
    *a10 = 0;
  }
  id v20 = a7;
  uint64_t v21 = [v17 count];
  if (a5 == 2)
  {
    id v24 = [NSString alloc];
    if (v21)
    {
      SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v17, 1);
      uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v23 = @"*";
    }
    int v26 = objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
    uint64_t v27 = [v24 initWithFormat:@"SELECT ALL %@ FROM %@", v23, v26];
  }
  else if (a5 == 1)
  {
    id v22 = [NSString alloc];
    if (v21)
    {
      SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v17, 1);
      uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v23 = @"*";
    }
    int v26 = objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
    uint64_t v27 = [v22 initWithFormat:@"SELECT DISTINCT %@ FROM %@", v23, v26];
  }
  else
  {
    id v25 = [NSString alloc];
    if (v21)
    {
      SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v17, 1);
      uint64_t v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v23 = @"*";
    }
    int v26 = objc_msgSend(v16, "siriCoreSQLiteValue_escapedString:", 1);
    uint64_t v27 = [v25 initWithFormat:@"SELECT %@ FROM %@", v23, v26];
  }
  uint64_t v28 = (void *)v27;

  if (v21) {
  uint64_t v29 = _SiriCoreSQLiteApplyIndexToQuery(v18, v28);
  }

  uint64_t v30 = SiriCoreSQLiteQueryCreateCriterionExpression(v20);

  if (v30)
  {
    uint64_t v31 = [v29 stringByAppendingFormat:@" WHERE %@", v30];

    uint64_t v29 = (void *)v31;
  }
  uint64_t v32 = SiriCoreSQLiteQueryCreateOrderExpression(v19);
  uint64_t v33 = (void *)v32;
  v46 = v16;
  if (v32)
  {
    uint64_t v34 = [v29 stringByAppendingFormat:@" %@", v32];

    uint64_t v29 = (void *)v34;
  }
  id v45 = v19;
  uint64_t v35 = SiriCoreSQLiteQueryCreateRangeExpression(v47);
  int v36 = (void *)v35;
  unint64_t v37 = v18;
  if (v35)
  {
    uint64_t v38 = [v29 stringByAppendingFormat:@" %@", v35];

    uint64_t v29 = (void *)v38;
  }
  int v39 = [[SiriCoreSQLiteQuery alloc] initWithString:v29 statement:0 parameters:0 recordBuilder:0 options:16];
  id v40 = [(SiriCoreSQLiteDatabase *)self executeQuery:v39];
  id v41 = [v40 error];
  id v42 = v41;
  if (v41)
  {
    id v43 = 0;
    if (a10) {
      *a10 = v41;
    }
  }
  else
  {
    id v43 = [v40 rowValueTuples];
  }

  return v43;
}

- (BOOL)dropIndexWithName:(id)a3 error:(id *)a4
{
  int v6 = (objc_class *)NSString;
  id v7 = a3;
  id v8 = [v6 alloc];
  int v9 = objc_msgSend(v7, "siriCoreSQLiteValue_escapedString:", 1);

  id v10 = (void *)[v8 initWithFormat:@"DROP INDEX IF EXISTS %@", v9];
  LOBYTE(a4) = [(SiriCoreSQLiteDatabase *)self executeQueryString:v10 error:a4];

  return (char)a4;
}

- (BOOL)createIndex:(id)a3 error:(id *)a4
{
  int v6 = (objc_class *)NSString;
  id v7 = a3;
  id v8 = [v6 alloc];
  if ([v7 options]) {
    int v9 = @" UNIQUE ";
  }
  else {
    int v9 = @" ";
  }
  id v10 = [v7 name];
  id v11 = objc_msgSend(v10, "siriCoreSQLiteValue_escapedString:", 0);
  id v12 = [v7 tableName];
  uint64_t v13 = objc_msgSend(v12, "siriCoreSQLiteValue_escapedString:", 1);
  id v14 = [v7 columnNames];

  id v15 = SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v14, 1);
  id v16 = (void *)[v8 initWithFormat:@"CREATE%@INDEX IF NOT EXISTS %@ ON %@ (%@)", v9, v11, v13, v15];

  BOOL v17 = [(SiriCoreSQLiteDatabase *)self executeQueryString:v16 error:a4];
  return v17;
}

- (BOOL)alterTableWithName:(id)a3 addColumn:(id)a4 error:(id *)a5
{
  id v8 = (objc_class *)NSString;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 alloc];
  id v12 = objc_msgSend(v10, "siriCoreSQLiteValue_escapedString:", 1);

  uint64_t v13 = SiriCoreSQLiteQueryCreateColumnDefinition(v9);

  id v14 = (void *)[v11 initWithFormat:@"ALTER TABLE %@ ADD COLUMN %@", v12, v13];
  LOBYTE(a5) = [(SiriCoreSQLiteDatabase *)self executeQueryString:v14 error:a5];

  return (char)a5;
}

- (BOOL)alterTableWithName:(id)a3 renameTo:(id)a4 error:(id *)a5
{
  id v8 = (objc_class *)NSString;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 alloc];
  id v12 = objc_msgSend(v10, "siriCoreSQLiteValue_escapedString:", 1);

  uint64_t v13 = objc_msgSend(v9, "siriCoreSQLiteValue_escapedString:", 0);

  id v14 = (void *)[v11 initWithFormat:@"ALTER TABLE %@ RENAME TO %@", v12, v13];
  LOBYTE(a5) = [(SiriCoreSQLiteDatabase *)self executeQueryString:v14 error:a5];

  return (char)a5;
}

- (BOOL)dropTableWithName:(id)a3 error:(id *)a4
{
  int v6 = (objc_class *)NSString;
  id v7 = a3;
  id v8 = [v6 alloc];
  id v9 = objc_msgSend(v7, "siriCoreSQLiteValue_escapedString:", 1);

  id v10 = (void *)[v8 initWithFormat:@"DROP TABLE IF EXISTS %@", v9];
  LOBYTE(a4) = [(SiriCoreSQLiteDatabase *)self executeQueryString:v10 error:a4];

  return (char)a4;
}

- (BOOL)createTable:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 columns];
  id v40 = v4;
  int v6 = [v4 constraints];
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count") + objc_msgSend(v5, "count"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v46;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = SiriCoreSQLiteQueryCreateColumnDefinition(*(void **)(*((void *)&v45 + 1) + 8 * v12));
        if (v13) {
          [v7 addObject:v13];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v10);
  }
  unint64_t v37 = v8;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v14 = v6;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v42;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v41 + 1) + 8 * v18);
        id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v21 = [v19 name];
        if (v21)
        {
          [v20 addObject:@"CONSTRAINT"];
          id v22 = objc_msgSend(v21, "siriCoreSQLiteValue_escapedString:", 0);
          [v20 addObject:v22];
        }
        uint64_t v23 = [v19 type];
        if (v23 == 2)
        {
          id v24 = v20;
          id v25 = @"UNIQUE";
        }
        else
        {
          if (v23 != 1) {
            goto LABEL_22;
          }
          id v24 = v20;
          id v25 = @"PRIMARY KEY";
        }
        [v24 addObject:v25];
        id v26 = [NSString alloc];
        uint64_t v27 = [v19 columnNames];
        uint64_t v28 = SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v27, 0);
        uint64_t v29 = (void *)[v26 initWithFormat:@"(%@)", v28];
        [v20 addObject:v29];

LABEL_22:
        if ([v20 count])
        {
          uint64_t v30 = [v20 componentsJoinedByString:@" "];
          [v7 addObject:v30];
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v16);
  }

  id v31 = [NSString alloc];
  uint64_t v32 = [v40 name];
  uint64_t v33 = objc_msgSend(v32, "siriCoreSQLiteValue_escapedString:", 0);
  uint64_t v34 = [v7 componentsJoinedByString:@", "];
  uint64_t v35 = (void *)[v31 initWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@)", v33, v34];

  LOBYTE(v31) = [(SiriCoreSQLiteDatabase *)self executeQueryString:v35 error:a4];
  return (char)v31;
}

- (id)fetchTableWithName:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  id v7 = [NSString alloc];
  id v8 = objc_msgSend(v6, "siriCoreSQLiteValue_escapedString:", 1);
  uint64_t v9 = (void *)[v7 initWithFormat:@"pragma table_info(%@)", v8];

  uint64_t v10 = [[SiriCoreSQLiteQuery alloc] initWithString:v9 statement:0 parameters:0 recordBuilder:0 options:32];
  uint64_t v11 = [(SiriCoreSQLiteDatabase *)self executeQuery:v10];
  uint64_t v12 = [v11 error];
  uint64_t v13 = v12;
  if (v12)
  {
    if (a4)
    {
      id v14 = 0;
      *a4 = v12;
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  uint64_t v15 = [v11 rowValueMaps];
  uint64_t v16 = [v15 count];

  if (!v16)
  {
LABEL_15:
    id v14 = 0;
    goto LABEL_16;
  }
  uint64_t v34 = v10;
  uint64_t v35 = v9;
  id v36 = v6;
  uint64_t v38 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v16];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v33 = v11;
  id obj = [v11 rowValueMaps];
  uint64_t v17 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v22 = [v21 objectForKey:@"cid"];
        uint64_t v23 = [v22 integerValue];

        id v24 = [v21 objectForKey:@"name"];
        id v25 = [v21 objectForKey:@"type"];
        id v26 = [v21 objectForKey:@"pk"];
        uint64_t v27 = [v26 BOOLValue];

        uint64_t v28 = [v21 objectForKey:@"notnull"];
        uint64_t v29 = [v28 BOOLValue];

        uint64_t v30 = [v21 objectForKey:@"dflt_value"];
        id v31 = [[_SiriCoreSQLiteColumnInfo alloc] initWithIdentifier:v23 name:v24 type:v25 isPrimaryKey:v27 isNotNull:v29 defaultValue:v30];
        [v38 addObject:v31];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v18);
  }

  id v6 = v36;
  id v14 = [[_SiriCoreSQLiteTableInfo alloc] initWithName:v36 columns:v38];

  uint64_t v10 = v34;
  uint64_t v9 = v35;
  uint64_t v13 = 0;
  uint64_t v11 = v33;
LABEL_16:

  return v14;
}

- (id)fetchTableNamesWithError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  uint64_t v5 = (void *)[[NSString alloc] initWithFormat:@"SELECT \"name\" FROM \"sqlite_master\" WHERE (\"type\" == 'table')"];
  id v6 = [[SiriCoreSQLiteQuery alloc] initWithString:v5 statement:0 parameters:0 recordBuilder:0 options:4];
  id v7 = [(SiriCoreSQLiteDatabase *)self executeQuery:v6];
  id v8 = [v7 error];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = 0;
    if (a3) {
      *a3 = v8;
    }
  }
  else
  {
    uint64_t v11 = [v7 columnValueTuples];
    uint64_t v10 = [v11 firstObject];
  }

  return v10;
}

- (BOOL)rollbackToSavepointWithName:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v8 = [v6 alloc];
  uint64_t v9 = objc_msgSend(v7, "siriCoreSQLiteValue_escapedString:", 0);

  uint64_t v10 = (void *)[v8 initWithFormat:@"ROLLBACK TO SAVEPOINT %@", v9];
  LOBYTE(a4) = [(SiriCoreSQLiteDatabase *)self executeQueryString:v10 error:a4];

  return (char)a4;
}

- (BOOL)releaseSavepointWithName:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v8 = [v6 alloc];
  uint64_t v9 = objc_msgSend(v7, "siriCoreSQLiteValue_escapedString:", 0);

  uint64_t v10 = (void *)[v8 initWithFormat:@"RELEASE SAVEPOINT %@", v9];
  LOBYTE(a4) = [(SiriCoreSQLiteDatabase *)self executeQueryString:v10 error:a4];

  return (char)a4;
}

- (BOOL)savepointWithName:(id)a3 error:(id *)a4
{
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v8 = [v6 alloc];
  uint64_t v9 = objc_msgSend(v7, "siriCoreSQLiteValue_escapedString:", 0);

  uint64_t v10 = (void *)[v8 initWithFormat:@"SAVEPOINT %@", v9];
  LOBYTE(a4) = [(SiriCoreSQLiteDatabase *)self executeQueryString:v10 error:a4];

  return (char)a4;
}

- (BOOL)performQuickCheckWithError:(id *)a3
{
  return [(SiriCoreSQLiteDatabase *)self executeQueryString:@"PRAGMA quick_check" error:a3];
}

- (BOOL)performIntegrityCheckWithError:(id *)a3
{
  return [(SiriCoreSQLiteDatabase *)self executeQueryString:@"PRAGMA integrity_check" error:a3];
}

- (BOOL)performForeignKeyCheckWithError:(id *)a3
{
  return [(SiriCoreSQLiteDatabase *)self executeQueryString:@"PRAGMA foreign_key_check" error:a3];
}

- (BOOL)vacuumWithError:(id *)a3
{
  return [(SiriCoreSQLiteDatabase *)self executeQueryString:@"VACUUM" error:a3];
}

- (BOOL)insertIntoTableWithName:(id)a3 valueMap:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v8 count];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v10];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v10];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __73__SiriCoreSQLiteDatabase_Insert__insertIntoTableWithName_valueMap_error___block_invoke;
  v22[3] = &unk_26443ADD0;
  id v23 = v11;
  id v24 = v12;
  id v13 = v12;
  id v14 = v11;
  [v8 enumerateKeysAndObjectsUsingBlock:v22];

  id v15 = [NSString alloc];
  uint64_t v16 = objc_msgSend(v9, "siriCoreSQLiteValue_escapedString:", 1);

  uint64_t v17 = SiriCoreSQLiteQueryCreateEscapedAndCommaSeparatedString(v14, 1);
  uint64_t v18 = SiriCoreSQLiteQueryCreateParametrizedAndCommaSeparatedString([v14 count]);
  uint64_t v19 = (void *)[v15 initWithFormat:@"INSERT INTO %@ (%@) VALUES (%@)", v16, v17, v18];

  id v20 = [[SiriCoreSQLiteQuery alloc] initWithString:v19 statement:0 parameters:v13 recordBuilder:0 options:0];
  LOBYTE(a5) = [(SiriCoreSQLiteDatabase *)self executeQuery:v20 error:a5];

  return (char)a5;
}

void __73__SiriCoreSQLiteDatabase_Insert__insertIntoTableWithName_valueMap_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 addObject:a2];
  [*(id *)(a1 + 40) addObject:v6];
}

- (BOOL)deleteFromTableWithName:(id)a3 indexedBy:(id)a4 criterion:(id)a5 error:(id *)a6
{
  id v10 = a4;
  uint64_t v11 = (objc_class *)NSString;
  id v12 = a5;
  id v13 = a3;
  id v14 = [v11 alloc];
  id v15 = objc_msgSend(v13, "siriCoreSQLiteValue_escapedString:", 1);

  uint64_t v16 = (void *)[v14 initWithFormat:@"DELETE FROM %@", v15];
  id v17 = _SiriCoreSQLiteApplyIndexToQuery(v10, v16);
  uint64_t v18 = SiriCoreSQLiteQueryCreateCriterionExpression(v12);

  if (v18)
  {
    uint64_t v19 = [v16 stringByAppendingFormat:@" WHERE %@", v18];

    uint64_t v16 = (void *)v19;
  }
  BOOL v20 = [(SiriCoreSQLiteDatabase *)self executeQueryString:v16 error:a6];

  return v20;
}

@end