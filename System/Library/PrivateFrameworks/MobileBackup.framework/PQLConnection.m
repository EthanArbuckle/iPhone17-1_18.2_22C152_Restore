@interface PQLConnection
- (BOOL)_performSchemaUpgrade:(id)a3 fromDatabaseVersion:(unsigned int)a4 error:(id *)a5;
- (BOOL)_recordVerificationState:(unint64_t)a3 domainID:(unint64_t)a4 error:(id *)a5;
- (BOOL)executeStatements:(id)a3 error:(id *)a4;
- (BOOL)executeWithError:(id *)a3 sql:(id)a4;
- (BOOL)fetchObjectOfClass:(Class)a3 outObject:(id *)a4 error:(id *)a5 sql:(id)a6;
- (BOOL)groupInTransaction:(id)a3 error:(id *)a4;
- (BOOL)performSchemaUpgrades:(id)a3 isReadOnly:(BOOL)a4 error:(id *)a5;
- (id)_insertFailure:(id)a3 domainID:(unint64_t)a4 restoreType:(int)a5 inode:(id)a6 restorableID:(id)a7 error:(id *)a8;
- (id)fetchObjectOfClass:(Class)a3 error:(id *)a4 sql:(id)a5;
- (unint64_t)fetchCountWithError:(id *)a3 sql:(id)a4;
@end

@implementation PQLConnection

- (BOOL)executeWithError:(id *)a3 sql:(id)a4
{
  unsigned __int8 v6 = [(PQLConnection *)self execute:a4 args:&v9];
  BOOL v7 = v6;
  if (a3 && (v6 & 1) == 0)
  {
    *a3 = [(PQLConnection *)self lastError];
  }
  return v7;
}

- (BOOL)executeStatements:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!a4) {
    __assert_rtn("-[PQLConnection(MBAdditions) executeStatements:error:]", "PQLConnection+MBAdditions.m", 63, "error");
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
LABEL_4:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
      if (!-[PQLConnection executeRaw:](self, "executeRaw:", v12, (void)v18)) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v9) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
    v16 = [(PQLConnection *)self lastError];

    if (v16)
    {
      id v15 = v16;
      BOOL v14 = 0;
      *a4 = v15;
      goto LABEL_13;
    }
    BOOL v14 = 1;
  }
  else
  {
LABEL_10:
    BOOL v14 = 1;
    id v15 = v7;
LABEL_13:
  }
  return v14;
}

- (id)fetchObjectOfClass:(Class)a3 error:(id *)a4 sql:(id)a5
{
  id v7 = [(PQLConnection *)self fetchObjectOfClass:a3 sql:a5 args:&v12];
  id v8 = v7;
  if (a4 && !v7)
  {
    id v9 = [(PQLConnection *)self lastError];
    *a4 = [v9 excludingNotFound];
  }
  return v8;
}

- (BOOL)fetchObjectOfClass:(Class)a3 outObject:(id *)a4 error:(id *)a5 sql:(id)a6
{
  id v9 = [(PQLConnection *)self fetchObjectOfClass:a3 sql:a6 args:&v14];
  uint64_t v10 = [(PQLConnection *)self lastError];
  uint64_t v11 = [v10 excludingNotFound];

  if (!v11)
  {
    uint64_t v12 = v9;
    a5 = a4;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v12 = v11;
  if (a5) {
LABEL_3:
  }
    *a5 = v12;
LABEL_4:

  return v11 == 0;
}

- (unint64_t)fetchCountWithError:(id *)a3 sql:(id)a4
{
  id v5 = a4;
  id v6 = [(PQLConnection *)self fetchObjectOfClass:objc_opt_class() sql:v5 args:&v9];

  if (v6) {
    unint64_t v7 = (unint64_t)[v6 unsignedIntegerValue];
  }
  else {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (BOOL)performSchemaUpgrades:(id)a3 isReadOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  if (!v9) {
    __assert_rtn("-[PQLConnection(MBAdditions) performSchemaUpgrades:isReadOnly:error:]", "PQLConnection+MBAdditions.m", 119, "schemaUpgrades");
  }
  if (!a5) {
    __assert_rtn("-[PQLConnection(MBAdditions) performSchemaUpgrades:isReadOnly:error:]", "PQLConnection+MBAdditions.m", 120, "error");
  }
  uint64_t v10 = v9;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = [v9 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v11)
  {
    id v12 = v11;
    unsigned int v13 = 0;
    uint64_t v14 = *(void *)v33;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v16 version] <= v13)
        {
          v17 = +[NSAssertionHandler currentHandler];
          [v17 handleFailureInMethod:a2 object:self file:@"PQLConnection+MBAdditions.m" lineNumber:126 description:@"Database versions are not ordered correctly!"];
        }
        unsigned int v13 = [v16 version];
      }
      id v12 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v12);
  }
  else
  {
    unsigned int v13 = 0;
  }
  long long v18 = [(PQLConnection *)self userVersion];
  id v19 = [v18 unsignedIntValue];

  if (v19 >= v13)
  {
LABEL_26:
    BOOL v20 = 1;
    goto LABEL_28;
  }
  if (!v6)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v21 = v10;
    id v22 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v29;
      while (2)
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v21);
          }
          if (!-[PQLConnection _performSchemaUpgrade:fromDatabaseVersion:error:](self, "_performSchemaUpgrade:fromDatabaseVersion:error:", *(void *)(*((void *)&v28 + 1) + 8 * (void)j), v19, a5, (void)v28))
          {
            [(PQLConnection *)self close:0];

            BOOL v20 = 0;
            goto LABEL_28;
          }
          v26 = [(PQLConnection *)self userVersion];
          id v19 = [v26 unsignedIntValue];
        }
        id v23 = [v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }

    goto LABEL_26;
  }
  [(PQLConnection *)self close:0];
  +[MBError errorWithCode:1 format:@"Can't migrate RO database"];
  BOOL v20 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return v20;
}

- (BOOL)_performSchemaUpgrade:(id)a3 fromDatabaseVersion:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (!a5) {
    __assert_rtn("-[PQLConnection(MBAdditions) _performSchemaUpgrade:fromDatabaseVersion:error:]", "PQLConnection+MBAdditions.m", 154, "error");
  }
  id v9 = v8;
  id v10 = [v8 version];
  id v11 = [v9 upgradeBlock];

  if (v11)
  {
    if (v10 > v6)
    {
      id v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v6;
        LOWORD(v36) = 1024;
        *(_DWORD *)((char *)&v36 + 2) = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "=pqldb= Migrating database from version %d to %d", buf, 0xEu);
        uint64_t v22 = v6;
        id v23 = v10;
        _MBLog();
      }

      *(void *)buf = 0;
      v36 = buf;
      uint64_t v37 = 0x3032000000;
      v38 = sub_100230058;
      v39 = sub_100230068;
      id v40 = 0;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100230070;
      v24[3] = &unk_100416C70;
      id v13 = v9;
      int v27 = v6;
      int v28 = (int)v10;
      id v25 = v13;
      v26 = buf;
      if ([(PQLConnection *)self performWithFlags:10 action:v24])
      {

        if (![v13 shouldVacuum])
        {
LABEL_12:
          -[PQLConnection setUserVersion:](self, "setUserVersion:", v10, v22, v23);
          BOOL v15 = 1;
LABEL_22:
          _Block_object_dispose(buf, 8);

          goto LABEL_23;
        }
        if ([(PQLConnection *)self execute:@"vacuum;"])
        {
          uint64_t v14 = MBGetDefaultLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long v29 = 67109376;
            int v30 = v6;
            __int16 v31 = 1024;
            int v32 = (int)v10;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "=pqldb= Vacuumed after migrating database from version %d to %d", v29, 0xEu);
            uint64_t v22 = v6;
            id v23 = v10;
            _MBLog();
          }

          goto LABEL_12;
        }
        BOOL v20 = [(PQLConnection *)self lastError];
        id v21 = MBGetDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long v29 = 67109634;
          int v30 = v6;
          __int16 v31 = 1024;
          int v32 = (int)v10;
          __int16 v33 = 2112;
          long long v34 = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "=pqldb= Vacuum after migration from version %d to %d failed: %@", v29, 0x18u);
          _MBLog();
        }

        id v18 = v20;
        *a5 = v18;
      }
      else
      {
        v17 = MBGetDefaultLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long v29 = 67109376;
          int v30 = v6;
          __int16 v31 = 1024;
          int v32 = (int)v10;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "=pqldb= Migration from version %d to %d failed", v29, 0xEu);
          _MBLog();
        }

        *a5 = *((id *)v36 + 5);
        id v18 = v25;
      }

      BOOL v15 = 0;
      goto LABEL_22;
    }
    goto LABEL_17;
  }
  if (v10 != v6)
  {
LABEL_17:
    BOOL v15 = 1;
    goto LABEL_23;
  }
  v16 = MBGetDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "=pqldb= Found invalid database version %d", buf, 8u);
    _MBLog();
  }

  +[MBError errorWithCode:1, @"Found invalid database version %d", v6 format];
  BOOL v15 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v15;
}

- (BOOL)groupInTransaction:(id)a3 error:(id *)a4
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  BOOL v15 = sub_100230058;
  v16 = sub_100230068;
  id v17 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10023031C;
  v9[3] = &unk_100416C98;
  id v6 = a3;
  id v10 = v6;
  id v11 = &v12;
  unsigned __int8 v7 = [(PQLConnection *)self groupInTransaction:v9];
  if (a4) {
    *a4 = (id) v13[5];
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)_recordVerificationState:(unint64_t)a3 domainID:(unint64_t)a4 error:(id *)a5
{
  if (!a3) {
    __assert_rtn("-[PQLConnection(_MBPlanAdditions) _recordVerificationState:domainID:error:]", "MBRestorePlanDB.m", 2284, "state");
  }
  if (!a4) {
    __assert_rtn("-[PQLConnection(_MBPlanAdditions) _recordVerificationState:domainID:error:]", "MBRestorePlanDB.m", 2285, "domainID");
  }
  if (!a5) {
    __assert_rtn("-[PQLConnection(_MBPlanAdditions) _recordVerificationState:domainID:error:]", "MBRestorePlanDB.m", 2286, "error");
  }
  return [(PQLConnection *)self executeWithError:a5, @"\nUPDATE Domains\n    SET verificationStatus = %u\n WHERE domainID = %llu", a3, a4 sql];
}

- (id)_insertFailure:(id)a3 domainID:(unint64_t)a4 restoreType:(int)a5 inode:(id)a6 restorableID:(id)a7 error:(id *)a8
{
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v34 = a6;
  id v33 = a7;
  if (!v14) {
    __assert_rtn("-[PQLConnection(_MBPlanAdditions) _insertFailure:domainID:restoreType:inode:restorableID:error:]", "MBRestorePlanDB.m", 2301, "failure");
  }
  if (!a4) {
    __assert_rtn("-[PQLConnection(_MBPlanAdditions) _insertFailure:domainID:restoreType:inode:restorableID:error:]", "MBRestorePlanDB.m", 2302, "domainID");
  }
  if (!a8) {
    __assert_rtn("-[PQLConnection(_MBPlanAdditions) _insertFailure:domainID:restoreType:inode:restorableID:error:]", "MBRestorePlanDB.m", 2303, "error");
  }
  BOOL v15 = [v14 userInfo];
  v16 = [v15 objectForKeyedSubscript:@"kMBErrorDateKey"];
  id v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = +[NSDate now];
  }
  id v19 = v18;

  [v19 timeIntervalSinceReferenceDate];
  uint64_t v21 = v20;
  uint64_t v22 = [v14 domain];
  id v23 = [v14 code];
  uint64_t v24 = [v14 localizedDescription];
  id v25 = MBGetDefaultLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v37 = v22;
    __int16 v38 = 2048;
    id v39 = v23;
    __int16 v40 = 2112;
    v41 = v24;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "=plan= Inserting error %@ (%ld): %@", buf, 0x20u);
    _MBLog();
  }

  id v35 = 0;
  unsigned __int8 v26 = -[PQLConnection fetchObjectOfClass:outObject:error:sql:](self, "fetchObjectOfClass:outObject:error:sql:", objc_opt_class(), &v35, a8, @"\nINSERT INTO Errors (\ncount, \ntimestamp, \nerrorDomain, \nerrorCode, \ndescription, \ndomainID, \nrestoreType, \ninode, \nrestorableID\n) VALUES (\n1,\n%g,\n%@,\n%lld,\n%@,\n%lld,\n%u,\n%@,\n%@\n) RETURNING errorID;",
          v21,
          v22,
          v23,
          v24,
          a4,
          v11,
          v34,
          v33);
  id v27 = v35;
  int v28 = v27;
  if (v26)
  {
    id v29 = v27;
  }
  else
  {
    int v30 = MBGetDefaultLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = *a8;
      *(_DWORD *)buf = 138412546;
      uint64_t v37 = v24;
      __int16 v38 = 2112;
      id v39 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "=plan= Failed inserting error \"%@\": %@", buf, 0x16u);
      _MBLog();
    }

    id v29 = 0;
  }

  return v29;
}

@end