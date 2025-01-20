@interface _RWPlanDB
- (BOOL)_recordFailure:(id)a3 domainID:(unint64_t)a4 restoreType:(int)a5 inode:(id)a6 restorableID:(id)a7 error:(id *)a8;
- (BOOL)_recordFatalFailure:(id)a3 into:(id)a4 parentErrorID:(id)a5 domainID:(unint64_t)a6 restoreType:(int)a7 inode:(id)a8 restorableID:(id)a9 error:(id *)a10;
- (BOOL)_recordRetryableFailure:(id)a3 domainID:(unint64_t)a4 restoreType:(int)a5 inode:(id)a6 restorableID:(id)a7 error:(id *)a8;
@end

@implementation _RWPlanDB

- (BOOL)_recordRetryableFailure:(id)a3 domainID:(unint64_t)a4 restoreType:(int)a5 inode:(id)a6 restorableID:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  if (!v14) {
    __assert_rtn("-[_RWPlanDB _recordRetryableFailure:domainID:restoreType:inode:restorableID:error:]", "MBRestorePlanDB.m", 2524, "failure");
  }
  if (!a4) {
    __assert_rtn("-[_RWPlanDB _recordRetryableFailure:domainID:restoreType:inode:restorableID:error:]", "MBRestorePlanDB.m", 2525, "domainID");
  }
  if (!a8) {
    __assert_rtn("-[_RWPlanDB _recordRetryableFailure:domainID:restoreType:inode:restorableID:error:]", "MBRestorePlanDB.m", 2526, "error");
  }
  v17 = v16;
  v18 = [v14 domain];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1002BB298;
  v25[3] = &unk_100418500;
  id v30 = [v14 code];
  unint64_t v31 = a4;
  int v32 = a5;
  id v26 = v18;
  id v27 = v15;
  id v28 = v17;
  id v29 = v14;
  id v19 = v14;
  id v20 = v17;
  id v21 = v15;
  id v22 = v18;
  BOOL v23 = [(MBSQLiteDB *)self groupInTransaction:v25 error:a8];

  return v23;
}

- (BOOL)_recordFatalFailure:(id)a3 into:(id)a4 parentErrorID:(id)a5 domainID:(unint64_t)a6 restoreType:(int)a7 inode:(id)a8 restorableID:(id)a9 error:(id *)a10
{
  uint64_t v11 = *(void *)&a7;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = v16;
  id v37 = v18;
  id v39 = a8;
  id v38 = a9;
  if (!v16) {
    __assert_rtn("-[_RWPlanDB _recordFatalFailure:into:parentErrorID:domainID:restoreType:inode:restorableID:error:]", "MBRestorePlanDB.m", 2565, "failure");
  }
  if (!v17) {
    __assert_rtn("-[_RWPlanDB _recordFatalFailure:into:parentErrorID:domainID:restoreType:inode:restorableID:error:]", "MBRestorePlanDB.m", 2566, "pdb");
  }
  if (!a6) {
    __assert_rtn("-[_RWPlanDB _recordFatalFailure:into:parentErrorID:domainID:restoreType:inode:restorableID:error:]", "MBRestorePlanDB.m", 2567, "domainID");
  }
  if (!a10) {
    __assert_rtn("-[_RWPlanDB _recordFatalFailure:into:parentErrorID:domainID:restoreType:inode:restorableID:error:]", "MBRestorePlanDB.m", 2568, "error");
  }
  uint64_t v20 = [v17 _insertFailure:v16 domainID:a6 restoreType:v11 inode:v39 restorableID:v38 error:a10];
  id v21 = (void *)v20;
  if (v20)
  {
    id v22 = v37;
    if ((objc_msgSend(v17, "executeWithError:sql:", a10, @"\nINSERT INTO FatalErrorRelationships (\nerrorID, parentErrorID\n) VALUES (%@, %@);",
                          v20,
                          v37) & 1) != 0)
    {
      v36 = v16;
      BOOL v23 = [v16 userInfo];
      v24 = [v23 objectForKeyedSubscript:@"kMBUnderlyingErrorsKey"];

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v25 = v24;
      id v26 = [v25 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v26)
      {
        id v27 = v26;
        uint64_t v28 = *(void *)v41;
        while (2)
        {
          id v29 = v25;
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(void *)v41 != v28) {
              objc_enumerationMutation(v29);
            }
            if (![(_RWPlanDB *)self _recordFatalFailure:*(void *)(*((void *)&v40 + 1) + 8 * i) into:v17 parentErrorID:v21 domainID:a6 restoreType:v11 inode:v39 restorableID:v38 error:a10])
            {
              BOOL v33 = 0;
              v25 = v29;
              int v32 = v29;
              id v19 = v36;
              goto LABEL_23;
            }
          }
          v25 = v29;
          id v27 = [v29 countByEnumeratingWithState:&v40 objects:v44 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }

      id v19 = v36;
      unint64_t v31 = [v36 userInfo];
      int v32 = [v31 objectForKeyedSubscript:NSUnderlyingErrorKey];

      BOOL v33 = !v32
         || [(_RWPlanDB *)self _recordFatalFailure:v32 into:v17 parentErrorID:v21 domainID:a6 restoreType:v11 inode:v39 restorableID:v38 error:a10];
LABEL_23:

      id v22 = v37;
    }
    else
    {
      v25 = MBGetDefaultLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v34 = *a10;
        *(_DWORD *)buf = 138412290;
        id v46 = v34;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "=plan= Failed inserting into fatal relations table: %@", buf, 0xCu);
        _MBLog();
      }
      BOOL v33 = 0;
    }
  }
  else
  {
    BOOL v33 = 0;
    id v22 = v37;
  }

  return v33;
}

- (BOOL)_recordFailure:(id)a3 domainID:(unint64_t)a4 restoreType:(int)a5 inode:(id)a6 restorableID:(id)a7 error:(id *)a8
{
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  if (!v14) {
    __assert_rtn("-[_RWPlanDB _recordFailure:domainID:restoreType:inode:restorableID:error:]", "MBRestorePlanDB.m", 2613, "failure");
  }
  if (!a4) {
    __assert_rtn("-[_RWPlanDB _recordFailure:domainID:restoreType:inode:restorableID:error:]", "MBRestorePlanDB.m", 2614, "domainID");
  }
  if (!a8) {
    __assert_rtn("-[_RWPlanDB _recordFailure:domainID:restoreType:inode:restorableID:error:]", "MBRestorePlanDB.m", 2615, "error");
  }
  id v17 = v16;
  if (+[MBError isRetryableRestoreError:v14])
  {
    BOOL v18 = [(_RWPlanDB *)self _recordRetryableFailure:v14 domainID:a4 restoreType:v11 inode:v15 restorableID:v17 error:a8];
  }
  else
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1002BB89C;
    v20[3] = &unk_100418528;
    v20[4] = self;
    id v21 = v14;
    unint64_t v24 = a4;
    int v25 = v11;
    id v22 = v15;
    id v23 = v17;
    BOOL v18 = [(MBSQLiteDB *)self groupInTransaction:v20 error:a8];
  }
  return v18;
}

@end