@interface _DPMLRuntimeSQL
- (BMSQLDatabase)database;
- (BOOL)checkSQLAccess:(id)a3 allowedTableNamesForRecipeIdentifier:(id)a4 withError:(id *)a5;
- (BOOL)convertSQLDataTypes:(id)a3 toGlobalDataTypesWithError:(id *)a4;
- (NSArray)privileges;
- (NSSet)accessedDataTypes;
- (_DPMLRuntimeSQL)initWithSQLAccessTable:(id)a3 forRecipeIdentifier:(id)a4 withError:(id *)a5;
- (id)runQuery:(id)a3 withError:(id *)a4;
- (void)setAccessedDataTypes:(id)a3;
- (void)setDatabase:(id)a3;
@end

@implementation _DPMLRuntimeSQL

- (_DPMLRuntimeSQL)initWithSQLAccessTable:(id)a3 forRecipeIdentifier:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v61.receiver = self;
  v61.super_class = (Class)_DPMLRuntimeSQL;
  v10 = [(_DPMLRuntimeSQL *)&v61 init];
  v11 = v10;
  if (!v10)
  {
LABEL_23:
    v38 = v11;
    goto LABEL_38;
  }
  if (![(_DPMLRuntimeSQL *)v10 checkSQLAccess:v8 allowedTableNamesForRecipeIdentifier:v9 withError:a5])goto LABEL_37; {
  id v12 = [&__NSArray0__struct mutableCopy];
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v13 = v8;
  id v14 = [v13 countByEnumeratingWithState:&v57 objects:v63 count:16];
  if (!v14) {
    goto LABEL_19;
  }
  uint64_t v15 = *(void *)v58;
  v16 = &BiomeLibrary_ptr;
  id v47 = v9;
  id v48 = v8;
  v49 = v12;
  v50 = v13;
  v46 = a5;
  uint64_t v44 = *(void *)v58;
  while (2)
  {
    v17 = 0;
    id v45 = v14;
    do
    {
      if (*(void *)v58 != v15) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void *)(*((void *)&v57 + 1) + 8 * (void)v17);
      v19 = v16;
      id v20 = objc_alloc((Class)v16[114]);
      v21 = [v13 objectForKeyedSubscript:v18];
      id v22 = [v20 initWithTable:v18 columns:v21];
      v23 = v13;
      v24 = v22;

      if (!v24)
      {
        id v9 = v47;
        id v8 = v48;
        if (!v46)
        {
LABEL_28:

          goto LABEL_37;
        }
        v25 = [v50 objectForKeyedSubscript:v18];
        v39 = [v25 componentsJoinedByString:@" "];
        v43 = +[NSString stringWithFormat:@"Could not create BMSQLColumnAccessSet for table name, %@ with columns, %@", v18, v39];
        id *v46 = +[_DPMLRuntimeError errorWithCode:400 description:v43];

LABEL_26:
LABEL_27:

        id v9 = v47;
        id v8 = v48;
        goto LABEL_28;
      }
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      v25 = [v23 objectForKeyedSubscript:v18];
      id v26 = [v25 countByEnumeratingWithState:&v53 objects:v62 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v54;
LABEL_11:
        uint64_t v29 = 0;
        while (1)
        {
          if (*(void *)v54 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v53 + 1) + 8 * v29);
          if (([v24 checkTable:v18 column:v30] & 1) == 0) {
            break;
          }
          if (v27 == (id)++v29)
          {
            id v27 = [v25 countByEnumeratingWithState:&v53 objects:v62 count:16];
            if (v27) {
              goto LABEL_11;
            }
            goto LABEL_17;
          }
        }
        if (!v46) {
          goto LABEL_27;
        }
        v39 = +[NSString stringWithFormat:@"The %@ cannot be accessed for table name %@", v30, v18];
        id *v46 = +[_DPMLRuntimeError errorWithCode:400 description:v39];
        goto LABEL_26;
      }
LABEL_17:

      id v12 = v49;
      [v49 addObject:v24];

      v17 = (char *)v17 + 1;
      uint64_t v15 = v44;
      v16 = v19;
      id v13 = v50;
    }
    while (v17 != v45);
    id v14 = [v50 countByEnumeratingWithState:&v57 objects:v63 count:16];
    id v9 = v47;
    id v8 = v48;
    a5 = v46;
    if (v14) {
      continue;
    }
    break;
  }
LABEL_19:

  objc_storeStrong((id *)&v11->_privileges, v12);
  id v31 = [objc_alloc((Class)BMSQLDatabase) initWithPrivileges:v12 isColumnAccessLoggingEnabled:1];
  if ([v31 registerFunctionWithName:@"sha1" numArgs:1 function:&stru_100030570 error:a5])
  {
    v32 = +[NSCharacterSet characterSetWithCharactersInString:@"01"];
    v33 = [v32 invertedSet];

    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_1000037FC;
    v51[3] = &unk_100030598;
    id v34 = v33;
    id v52 = v34;
    if ([v31 registerFunctionWithName:@"bit_string_to_int" numArgs:1 function:v51 error:a5])
    {
      if (v31)
      {
        [v31 resetColumnAccessLog];
        database = v11->_database;
        v11->_database = (BMSQLDatabase *)v31;
        id v36 = v31;

        accessedDataTypes = v11->_accessedDataTypes;
        v11->_accessedDataTypes = 0;

        goto LABEL_23;
      }
      if (a5)
      {
        v41 = +[NSString stringWithFormat:@"Could not create the BIOME database"];
        *a5 = +[_DPMLRuntimeError errorWithCode:400 description:v41];
        goto LABEL_34;
      }
    }
    else
    {
      v41 = +[_PFLLog extension];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_10001F4D8(v41);
      }
LABEL_34:
    }
  }
  else
  {
    v40 = +[_PFLLog extension];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_10001F51C(v40);
    }
  }
LABEL_37:
  v38 = 0;
LABEL_38:

  return v38;
}

- (id)runQuery:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  v6 = [(_DPMLRuntimeSQL *)self database];
  [v6 resetColumnAccessLog];

  id v41 = v5;
  v10 = v9 = id v8 = v7 = [v5 copy];

  v40 = self;
  v11 = [(_DPMLRuntimeSQL *)self database];
  id v12 = [v11 executeQuery:@"%@", v10];

  v43 = +[FedStatsDataSampler samplerWithCount:20];
  if ([v12 next])
  {
    do
    {
      id v13 = [v12 columns];
      id v14 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v13 count]);

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      uint64_t v15 = [v12 columns];
      id v16 = [v15 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v50;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v50 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v49 + 1) + 8 * i);
            v21 = +[NSNull null];
            [v14 setObject:v21 forKey:v20];
          }
          id v17 = [v15 countByEnumeratingWithState:&v49 objects:v54 count:16];
        }
        while (v17);
      }

      id v22 = [v12 row];
      [v14 addEntriesFromDictionary:v22];

      [v43 addItem:v14];
    }
    while (([v12 next] & 1) != 0);
  }
  v23 = [v12 error];

  if (v23)
  {
    if (a4)
    {
      v24 = [v12 error];
      *a4 = +[_DPMLRuntimeError errorWithCode:400 underlyingError:v24 description:@"Query execution failed"];
    }
    v25 = +[_PFLLog extension];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10001F560(v12, v25);
    }
    id v26 = 0;
    uint64_t v28 = (void *)v10;
    id v27 = v41;
  }
  else
  {
    v25 = [v43 getResults];
    if (![v25 count])
    {
      uint64_t v29 = +[_PFLLog extension];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "The returned SQL query result from BIOME is empty", buf, 2u);
      }
    }
    id v30 = objc_alloc_init((Class)NSMutableSet);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v31 = [(_DPMLRuntimeSQL *)v40 database];
    v32 = [v31 accessedColumns];

    id v33 = [v32 countByEnumeratingWithState:&v44 objects:v53 count:16];
    uint64_t v28 = (void *)v10;
    id v27 = v41;
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v45;
      do
      {
        for (j = 0; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v45 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [*(id *)(*((void *)&v44 + 1) + 8 * (void)j) columns];
          [v30 unionSet:v37];
        }
        id v34 = [v32 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v34);
    }

    if (![v30 count])
    {
      v38 = +[_PFLLog extension];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "The returned SQL accessed columns from BIOME is empty", buf, 2u);
      }
    }
    if ([(_DPMLRuntimeSQL *)v40 convertSQLDataTypes:v30 toGlobalDataTypesWithError:a4])
    {
      id v26 = v25;
    }
    else
    {
      id v26 = 0;
    }
  }
  return v26;
}

- (BOOL)convertSQLDataTypes:(id)a3 toGlobalDataTypesWithError:(id *)a4
{
  return 1;
}

- (BOOL)checkSQLAccess:(id)a3 allowedTableNamesForRecipeIdentifier:(id)a4 withError:(id *)a5
{
  return 1;
}

- (NSArray)privileges
{
  return self->_privileges;
}

- (BMSQLDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (NSSet)accessedDataTypes
{
  return self->_accessedDataTypes;
}

- (void)setAccessedDataTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessedDataTypes, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_privileges, 0);
}

@end