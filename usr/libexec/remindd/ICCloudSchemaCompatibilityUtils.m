@interface ICCloudSchemaCompatibilityUtils
+ (BOOL)_isCloudSchemaCatchUpSyncNeededForExistingCloudObject:(id)a3 persistenceCloudSchemaVersion:(int64_t)a4 outIncompatiblePropertyKeys:(id *)a5;
+ (BOOL)cloudSchemaCatchUpSyncDidCompleteWithAccountIdentifier:(id)a3 context:(id)a4;
+ (BOOL)isCloudSchemaCatchUpSyncNeededForAccountIdentifier:(id)a3 context:(id)a4 outPersistenceCloudSchemaVersion:(int64_t *)a5;
+ (BOOL)isCloudSchemaCatchUpSyncNeededForExistingCloudObject:(id)a3 persistenceCloudSchemaVersion:(int64_t)a4;
+ (id)incompatiblePropertyKeysForCloudObject:(id)a3 persistenceCloudSchemaVersion:(int64_t)a4;
+ (int64_t)persistenceCloudSchemaVersionWithAccountIdentifier:(id)a3 context:(id)a4;
@end

@implementation ICCloudSchemaCompatibilityUtils

+ (BOOL)isCloudSchemaCatchUpSyncNeededForAccountIdentifier:(id)a3 context:(id)a4 outPersistenceCloudSchemaVersion:(int64_t *)a5
{
  id v8 = a3;
  int64_t v9 = (int64_t)[a1 persistenceCloudSchemaVersionWithAccountIdentifier:v8 context:a4];
  v10 = +[REMLog cloudkit];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543874;
    id v13 = v8;
    __int16 v14 = 2048;
    int64_t v15 = v9;
    __int16 v16 = 2048;
    uint64_t v17 = 20240715;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "ICCSCU: isCloudSchemaCatchUpSyncNeeded? {accountIdentifier: %{public}@, persistence: %lld, runtime: %lld}", (uint8_t *)&v12, 0x20u);
  }

  if (a5) {
    *a5 = v9;
  }

  return v9 < 20240715;
}

+ (BOOL)cloudSchemaCatchUpSyncDidCompleteWithAccountIdentifier:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (uint64_t)[a1 persistenceCloudSchemaVersionWithAccountIdentifier:v6 context:v7];
  int64_t v9 = +[REMLog cloudkit];
  v10 = v9;
  if (v8 >= 20240715)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100750528((uint64_t)v6, v8, v10);
    }

    BOOL v13 = 0;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2048;
      uint64_t v22 = 20240715;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ICCSCU: cloudSchemaCatchUpSyncDidComplete: Will update account.persistenceCloudSchemaVersion {accountIdentifier: %{public}@, persistence: %lld, runtime: %lld}", buf, 0x20u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v22) = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10004B208;
    v15[3] = &unk_1008ADFD0;
    id v11 = v6;
    id v16 = v11;
    id v17 = v7;
    v18 = buf;
    [v17 performBlockAndWait:v15];
    if (*(unsigned char *)(*(void *)&buf[8] + 24))
    {
      int v12 = +[REMLog cloudkit];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v19 = 138543362;
        id v20 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "ICCSCU: cloudSchemaCatchUpSyncDidComplete: ckAccount.persistenceCloudSchemaVersion updated SUCCESS {accountID: %{public}@}", v19, 0xCu);
      }
    }
    else
    {
      int v12 = +[REMLog cloudkit];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1007504B0((uint64_t)v11, v12);
      }
    }

    BOOL v13 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
  }

  return v13;
}

+ (BOOL)isCloudSchemaCatchUpSyncNeededForExistingCloudObject:(id)a3 persistenceCloudSchemaVersion:(int64_t)a4
{
  return [a1 _isCloudSchemaCatchUpSyncNeededForExistingCloudObject:a3 persistenceCloudSchemaVersion:a4 outIncompatiblePropertyKeys:0];
}

+ (id)incompatiblePropertyKeysForCloudObject:(id)a3 persistenceCloudSchemaVersion:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[NSArray array];
  id v10 = v7;
  [a1 _isCloudSchemaCatchUpSyncNeededForExistingCloudObject:v6 persistenceCloudSchemaVersion:a4 outIncompatiblePropertyKeys:&v10];

  id v8 = v10;

  return v8;
}

+ (BOOL)_isCloudSchemaCatchUpSyncNeededForExistingCloudObject:(id)a3 persistenceCloudSchemaVersion:(int64_t)a4 outIncompatiblePropertyKeys:(id *)a5
{
  id v8 = a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_10004B648;
  v30 = sub_10004B658;
  if (a5)
  {
    int64_t v9 = +[NSMutableArray array];
  }
  else
  {
    int64_t v9 = 0;
  }
  id v31 = v9;
  id v10 = [(id)objc_opt_class() cdEntityName];
  if (v10)
  {
    id v11 = cloudKitSchemaVersionIncompatibilityInfoMap();
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10004B660;
    v19[3] = &unk_1008AFAB8;
    int64_t v24 = a4;
    id v20 = v10;
    id v21 = v8;
    uint64_t v22 = &v32;
    BOOL v25 = a5 != 0;
    v23 = &v26;
    [v11 enumerateKeysAndObjectsUsingBlock:v19];
    if (a5)
    {
      *a5 = +[NSArray arrayWithArray:v27[5]];
    }
    int v12 = *((unsigned __int8 *)v33 + 24);
  }
  else
  {
    BOOL v13 = +[REMLog cloudkit];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int64_t v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      id v17 = NSStringFromSelector(a2);
      v18 = +[NSString stringWithFormat:@"%@.%@", v16, v17];
      *(_DWORD *)buf = 138543618;
      v37 = v18;
      __int16 v38 = 2080;
      v39 = "existingCloudObjectEntityName";
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "[%{public}@] Passing in nil '%s'", buf, 0x16u);
    }
    NSLog(@"'%s' is unexpectedly nil", "existingCloudObjectEntityName");
    int v12 = *((unsigned __int8 *)v33 + 24);
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v12 != 0;
}

+ (int64_t)persistenceCloudSchemaVersionWithAccountIdentifier:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10004B908;
  v11[3] = &unk_1008ADFD0;
  id v7 = v5;
  id v12 = v7;
  id v8 = v6;
  id v13 = v8;
  __int16 v14 = &v15;
  [v8 performBlockAndWait:v11];
  int64_t v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

@end