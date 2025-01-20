@interface MLDIndexIntegrityFault
- (BOOL)attemptRecoveryUsingHandle:(sqlite3 *)a3 withError:(id *)a4;
- (MLDIndexIntegrityFault)initWithIndex:(id)a3;
- (NSString)indexName;
- (id)_createErrorWithDescription:(id)a3;
@end

@implementation MLDIndexIntegrityFault

- (void).cxx_destruct
{
}

- (NSString)indexName
{
  return self->_indexName;
}

- (id)_createErrorWithDescription:(id)a3
{
  id v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = v3;
  v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v7 = +[NSError errorWithDomain:v5 code:-1 userInfo:v6];

  return v7;
}

- (BOOL)attemptRecoveryUsingHandle:(sqlite3 *)a3 withError:(id *)a4
{
  v7 = os_log_create("com.apple.amp.medialibraryd", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    indexName = self->_indexName;
    *(_DWORD *)buf = 138543362;
    v27 = indexName;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[MLDDatabaseIntegrityFault] Attempting to repair index %{public}@", buf, 0xCu);
  }

  +[ML3MusicLibrary indexSchemaSQL];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (!v10) {
    goto LABEL_11;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)v23;
  while (2)
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v23 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      if ([v14 containsString:self->_indexName])
      {
        id v15 = v14;

        if (!v15) {
          goto LABEL_15;
        }
        id v16 = +[NSString stringWithFormat:@"DROP INDEX %@", self->_indexName];
        if (sqlite3_exec(a3, (const char *)[v16 UTF8String], 0, 0, 0))
        {
          CFStringRef v17 = @"failed to drop bad index";
        }
        else if (sqlite3_exec(a3, (const char *)[v15 UTF8String], 0, 0, 0))
        {
          CFStringRef v17 = @"failed to rebuild index";
        }
        else
        {
          if (!sqlite3_exec(a3, "ANALYZE", 0, 0, 0))
          {
            v18 = 0;
            goto LABEL_21;
          }
          CFStringRef v17 = @"failed to optimize newly created index";
        }
        v18 = [(MLDIndexIntegrityFault *)self _createErrorWithDescription:v17];
LABEL_21:

        goto LABEL_22;
      }
    }
    id v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v11) {
      continue;
    }
    break;
  }
LABEL_11:

LABEL_15:
  v18 = [(MLDIndexIntegrityFault *)self _createErrorWithDescription:@"could not find index SQL to rebuild"];
LABEL_22:

  if (v18)
  {
    v19 = os_log_create("com.apple.amp.medialibraryd", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = self->_indexName;
      *(_DWORD *)buf = 138543618;
      v27 = v20;
      __int16 v28 = 2114;
      v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "[MLDDatabaseIntegrityFault] Failed to repair index %{public}@: %{public}@", buf, 0x16u);
    }
  }
  if (a4) {
    *a4 = v18;
  }

  return v18 == 0;
}

- (MLDIndexIntegrityFault)initWithIndex:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLDIndexIntegrityFault;
  v5 = [(MLDIndexIntegrityFault *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    indexName = v5->_indexName;
    v5->_indexName = v6;
  }
  return v5;
}

@end