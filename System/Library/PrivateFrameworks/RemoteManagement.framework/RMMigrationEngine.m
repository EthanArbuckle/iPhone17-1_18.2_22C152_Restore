@interface RMMigrationEngine
- (BOOL)_migrateWithActions:(id)a3 error:(id *)a4;
- (BOOL)_writeProcessedActions:(id)a3 error:(id *)a4;
- (BOOL)migrateOnStartupReturningError:(id *)a3;
- (BOOL)migrateWithCoreDataReturningError:(id *)a3;
- (id)_coreDataActions;
- (id)_fixFilePermissionsAndReadDataForURL:(id)a3;
- (id)_readMigrationStateReturningError:(id *)a3;
- (id)_readProcessedActionsReturningError:(id *)a3;
- (id)_startupActions;
@end

@implementation RMMigrationEngine

- (BOOL)migrateOnStartupReturningError:(id *)a3
{
  v5 = +[RMLog migrationEngine];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting to migrate on startup", v9, 2u);
  }

  v6 = [(RMMigrationEngine *)self _startupActions];
  BOOL v7 = [(RMMigrationEngine *)self _migrateWithActions:v6 error:a3];

  return v7;
}

- (BOOL)migrateWithCoreDataReturningError:(id *)a3
{
  v5 = +[RMLog migrationEngine];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting to migrate with CoreData", v9, 2u);
  }

  v6 = [(RMMigrationEngine *)self _coreDataActions];
  BOOL v7 = [(RMMigrationEngine *)self _migrateWithActions:v6 error:a3];

  return v7;
}

- (BOOL)_migrateWithActions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v56 = 0;
  v43 = self;
  BOOL v7 = [(RMMigrationEngine *)self _readProcessedActionsReturningError:&v56];
  id v8 = v56;
  id v9 = v8;
  if (v7)
  {
    v40 = a4;
    v10 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v7 count]);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v41 = v7;
    id v11 = v7;
    id v12 = [v11 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v53;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v53 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v52 + 1) + 8 * i) objectForKeyedSubscript:@"Identifier"];
          [v10 addObject:v16];
        }
        id v13 = [v11 countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v13);
    }

    v17 = &CC_SHA256_Final_ptr;
    v18 = +[RMLog migrationEngine];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100052134(v10);
    }

    v19 = +[RMLog migrationEngine];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_1000520A8(v6);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v42 = v6;
    v20 = v6;
    id v21 = [v20 countByEnumeratingWithState:&v48 objects:v61 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v45 = *(void *)v49;
      obj = v20;
      while (2)
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v49 != v45) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
          v25 = [v24 identifier];
          unsigned int v26 = [v10 containsObject:v25];
          v27 = v17;
          v28 = [v17[248] migrationEngine];
          v29 = v28;
          if (v26)
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v60 = v25;
              _os_log_debug_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Already processed migration action: %{public}@", buf, 0xCu);
            }
          }
          else
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v60 = v25;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Processing migration action: %{public}@", buf, 0xCu);
            }

            id v47 = v9;
            unsigned __int8 v30 = [v24 executeReturningError:&v47];
            id v31 = v47;

            v32 = [v27[248] migrationEngine];
            v33 = v32;
            if ((v30 & 1) == 0)
            {
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
                sub_100052024();
              }

              BOOL v7 = v41;
              id v6 = v42;
              v38 = v40;
              if (!v40 || !v31) {
                goto LABEL_44;
              }
LABEL_43:
              id v31 = v31;
              id *v38 = v31;
LABEL_44:

              BOOL v37 = 0;
              id v9 = v31;
              v36 = obj;
              goto LABEL_45;
            }
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v60 = v25;
              _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Processed migration action: %{public}@", buf, 0xCu);
            }

            v57[0] = @"Identifier";
            v57[1] = @"Timestamp";
            v58[0] = v25;
            uint64_t v34 = +[NSDate now];
            v58[1] = v34;
            v35 = +[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:2];
            [v11 addObject:v35];

            id v46 = v31;
            LOBYTE(v34) = [(RMMigrationEngine *)v43 _writeProcessedActions:v11 error:&v46];
            id v9 = v46;

            if ((v34 & 1) == 0)
            {
              v38 = v40;
              if (v40)
              {
                id v31 = v9;
                BOOL v7 = v41;
                id v6 = v42;
                if (v9) {
                  goto LABEL_43;
                }
              }
              else
              {
                id v31 = v9;
                BOOL v7 = v41;
                id v6 = v42;
              }
              goto LABEL_44;
            }
          }

          v17 = v27;
        }
        v20 = obj;
        id v22 = [obj countByEnumeratingWithState:&v48 objects:v61 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    v36 = [v17[248] migrationEngine];
    BOOL v37 = 1;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Finished migrating", buf, 2u);
    }
    BOOL v7 = v41;
    id v6 = v42;
LABEL_45:
  }
  else
  {
    BOOL v37 = 0;
    if (a4 && v8)
    {
      id v9 = v8;
      BOOL v37 = 0;
      *a4 = v9;
    }
  }

  return v37;
}

- (id)_startupActions
{
  v2 = objc_opt_new();
  v7[0] = v2;
  v3 = objc_opt_new();
  v7[1] = v3;
  v4 = objc_opt_new();
  v7[2] = v4;
  v5 = +[NSArray arrayWithObjects:v7 count:3];

  return v5;
}

- (id)_coreDataActions
{
  v2 = objc_opt_new();
  v6[0] = v2;
  v3 = objc_opt_new();
  v6[1] = v3;
  v4 = +[NSArray arrayWithObjects:v6 count:2];

  return v4;
}

- (id)_readProcessedActionsReturningError:(id *)a3
{
  id v14 = 0;
  v4 = [(RMMigrationEngine *)self _readMigrationStateReturningError:&v14];
  id v5 = v14;
  id v6 = v5;
  if (v4)
  {
    BOOL v7 = [v4 objectForKeyedSubscript:@"ProcessedActions"];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = +[RMLog migrationEngine];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_1000521B8();
        }

        if (a3)
        {
          id v11 = +[RMErrorUtilities createInternalError];
          id v12 = v11;
          if (v11) {
            *a3 = v11;
          }
        }
        id v9 = 0;
        goto LABEL_17;
      }
      id v8 = [v7 mutableCopy];
    }
    else
    {
      id v8 = (id)objc_opt_new();
    }
    id v9 = v8;
LABEL_17:

    goto LABEL_18;
  }
  id v9 = 0;
  if (a3 && v5)
  {
    id v9 = 0;
    *a3 = v5;
  }
LABEL_18:

  return v9;
}

- (id)_readMigrationStateReturningError:(id *)a3
{
  id v5 = +[RMLocations migrationStatusFileURLCreateIfNeeded:0];
  id v6 = +[NSFileManager defaultManager];
  BOOL v7 = [v5 path];
  unsigned int v8 = [v6 fileExistsAtPath:v7 isDirectory:0];

  if (v8)
  {
    id v19 = 0;
    id v9 = +[NSData dataWithContentsOfURL:v5 options:0 error:&v19];
    v10 = v19;
    id v11 = v10;
    if (v9
      || [v10 code] == (id)257
      && ([(RMMigrationEngine *)self _fixFilePermissionsAndReadDataForURL:v5],
          (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v18 = 0;
      id v12 = +[NSPropertyListSerialization propertyListWithData:v9 options:0 format:0 error:&v18];
      id v13 = v18;

      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        v16 = +[RMLog migrationEngine];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_100052288();
        }

        if (a3 && v13) {
          *a3 = v13;
        }
      }
    }
    else
    {
      v15 = +[RMLog migrationEngine];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100052220();
      }

      id v12 = 0;
      if (a3 && v11)
      {
        id v13 = v11;
        id v12 = 0;
        *a3 = v13;
      }
      else
      {
        id v13 = v11;
      }
    }
  }
  else
  {
    id v13 = +[RMLog migrationEngine];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1000522F0(v13);
    }
    id v12 = &__NSDictionary0__struct;
  }

  return v12;
}

- (BOOL)_writeProcessedActions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v18 = 0;
  BOOL v7 = [(RMMigrationEngine *)self _readMigrationStateReturningError:&v18];
  id v8 = v18;
  id v9 = v8;
  if (v7)
  {
    id v10 = [v7 mutableCopy];
    [v10 setObject:v6 forKeyedSubscript:@"ProcessedActions"];
    id v11 = +[RMLocations migrationStatusFileURLCreateIfNeeded:1];
    id v17 = v9;
    unsigned __int8 v12 = objc_msgSend(v10, "rm_atomicWriteToURL:error:", v11, &v17);
    id v13 = v17;

    id v14 = +[RMLog migrationEngine];
    v15 = v14;
    if (v12)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_100052334(v15);
      }
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100052378();
      }

      if (a4 && v13) {
        *a4 = v13;
      }
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
    if (a4 && v8)
    {
      id v13 = v8;
      unsigned __int8 v12 = 0;
      *a4 = v13;
    }
    else
    {
      id v13 = v8;
    }
  }

  return v12;
}

- (id)_fixFilePermissionsAndReadDataForURL:(id)a3
{
  id v3 = a3;
  if (+[RMLocations fixFilePermissionsForURL:v3])
  {
    id v8 = 0;
    v4 = +[NSData dataWithContentsOfURL:v3 options:0 error:&v8];
    id v5 = v8;
    if (!v4)
    {
      id v6 = +[RMLog migrationEngine];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000523E0();
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end