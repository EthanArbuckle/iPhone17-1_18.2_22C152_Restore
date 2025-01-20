@interface MLDDatabaseIntegrityCheckOperation
- (MLDDatabaseIntegrityCheck)check;
- (MLDDatabaseIntegrityCheckOperation)initWithDatabasePath:(id)a3 repairFaults:(BOOL)a4;
- (NSError)error;
- (NSString)databasePath;
- (id)_createSQLiteErrorWithCode:(int)a3 description:(id)a4;
- (void)main;
@end

@implementation MLDDatabaseIntegrityCheckOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_check, 0);

  objc_storeStrong((id *)&self->_databasePath, 0);
}

- (NSError)error
{
  return self->_error;
}

- (MLDDatabaseIntegrityCheck)check
{
  return self->_check;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (id)_createSQLiteErrorWithCode:(int)a3 description:(id)a4
{
  uint64_t v4 = a3;
  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = a4;
  id v5 = a4;
  v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v7 = +[NSError errorWithDomain:@"NSSQLiteErrorDomain" code:v4 userInfo:v6];

  return v7;
}

- (void)main
{
  v2 = self;
  ppDb = 0;
  uint64_t v3 = sqlite3_open_v2([(NSString *)self->_databasePath fileSystemRepresentation], &ppDb, 16777218, 0);
  if (v3)
  {
    uint64_t v4 = [(MLDDatabaseIntegrityCheckOperation *)v2 _createSQLiteErrorWithCode:v3 description:@"failed to open DB file"];
  }
  else
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v6 = sqlite3_exec(ppDb, "pragma integrity_check", (int (__cdecl *)(void *, int, char **, char **))sub_10001B604, v5, 0);
    if (v6)
    {
      uint64_t v4 = [(MLDDatabaseIntegrityCheckOperation *)v2 _createSQLiteErrorWithCode:v6 description:@"failed to collect integrity check results"];
    }
    else
    {
      v41 = v2;
      id v42 = objc_alloc_init((Class)NSMutableArray);
      v7 = +[NSRegularExpression regularExpressionWithPattern:@"index (\\w+)" options:0 error:0];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v40 = v5;
      id v8 = v5;
      id v9 = [v8 countByEnumeratingWithState:&v48 objects:v58 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v49;
        v12 = &selRef_getLanguageResourcesWithCompletion_;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v49 != v11) {
              objc_enumerationMutation(v8);
            }
            v14 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            if (([v14 isEqualToString:@"ok"] & 1) == 0)
            {
              v15 = objc_msgSend(v7, "firstMatchInString:options:range:", v14, 0, 0, objc_msgSend(v14, "length"));
              v16 = v15;
              if (v15 && (unint64_t)[v15 numberOfRanges] >= 2)
              {
                id v17 = v8;
                v18 = v12;
                v19 = v7;
                id v20 = [v16 rangeAtIndex:1];
                objc_msgSend(v14, "substringWithRange:", v20, v21);
                v22 = (MLDIndexIntegrityFault *)objc_claimAutoreleasedReturnValue();
                v23 = [[MLDIndexIntegrityFault alloc] initWithIndex:v22];
                v24 = os_log_create("com.apple.amp.medialibraryd", "Default");
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v54 = v23;
                  _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[DatabaseIntegrityCheck] Encountered index fault: %{public}@", buf, 0xCu);
                }

                [v42 addObject:v23];
                v7 = v19;
                v12 = v18;
                id v8 = v17;
              }
              else
              {
                v22 = (MLDIndexIntegrityFault *)[objc_alloc((Class)(v12 + 257)) initWithFaultString:v14];
                v25 = os_log_create("com.apple.amp.medialibraryd", "Default");
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v54 = v22;
                  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[DatabaseIntegrityCheck] Encountered unknown fault: %{public}@", buf, 0xCu);
                }

                [v42 addObject:v22];
              }
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v48 objects:v58 count:16];
        }
        while (v10);
      }

      v26 = os_log_create("com.apple.amp.medialibraryd", "Default");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (MLDIndexIntegrityFault *)[v42 count];
        *(_DWORD *)buf = 134217984;
        v54 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Integrity check found %lu faults with database file", buf, 0xCu);
      }

      v2 = v41;
      if (v41->_repairFaults)
      {
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        v28 = v42;
        id v29 = [v28 countByEnumeratingWithState:&v44 objects:v57 count:16];
        if (v29)
        {
          id v30 = v29;
          uint64_t v4 = 0;
          uint64_t v31 = *(void *)v45;
          while (2)
          {
            v32 = 0;
            v33 = v4;
            do
            {
              if (*(void *)v45 != v31) {
                objc_enumerationMutation(v28);
              }
              v34 = *(MLDIndexIntegrityFault **)(*((void *)&v44 + 1) + 8 * (void)v32);
              v43 = v33;
              unsigned __int8 v35 = [(MLDIndexIntegrityFault *)v34 attemptRecoveryUsingHandle:ppDb withError:&v43];
              uint64_t v4 = v43;

              if ((v35 & 1) == 0)
              {
                v36 = os_log_create("com.apple.amp.medialibraryd", "Default");
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v54 = v34;
                  __int16 v55 = 2114;
                  v56 = v4;
                  _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Failed to repair integrity fault %{public}@. err=%{public}@", buf, 0x16u);
                }

                goto LABEL_40;
              }
              v32 = (char *)v32 + 1;
              v33 = v4;
            }
            while (v30 != v32);
            id v30 = [v28 countByEnumeratingWithState:&v44 objects:v57 count:16];
            if (v30) {
              continue;
            }
            break;
          }

          v28 = sub_10000B210();
          id v5 = v40;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Successfully repaired integrity faults", buf, 2u);
          }
        }
        else
        {
          uint64_t v4 = 0;
LABEL_40:
          id v5 = v40;
        }
      }
      else
      {
        uint64_t v4 = 0;
        id v5 = v40;
      }
      v37 = objc_alloc_init(MLDDatabaseIntegrityCheck);
      check = v41->_check;
      v41->_check = v37;

      [(MLDDatabaseIntegrityCheck *)v41->_check setDatabasePath:v41->_databasePath];
      [(MLDDatabaseIntegrityCheck *)v41->_check setFaults:v42];
    }
  }
  if (ppDb)
  {
    sqlite3_close_v2(ppDb);
    ppDb = 0;
  }
  error = v2->_error;
  v2->_error = v4;
}

- (MLDDatabaseIntegrityCheckOperation)initWithDatabasePath:(id)a3 repairFaults:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLDDatabaseIntegrityCheckOperation;
  v7 = [(MLDDatabaseIntegrityCheckOperation *)&v11 init];
  if (v7)
  {
    id v8 = (NSString *)[v6 copy];
    databasePath = v7->_databasePath;
    v7->_databasePath = v8;

    v7->_repairFaults = a4;
  }

  return v7;
}

@end