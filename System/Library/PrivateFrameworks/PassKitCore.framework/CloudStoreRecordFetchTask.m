@interface CloudStoreRecordFetchTask
+ (id)_commonDictionaryForTask:(id)a3;
+ (id)_predicateForCloudStoreZonePID:(int64_t)a3;
+ (id)_predicateForPID:(id)a3;
+ (id)_predicateForTransactionSourcePID:(int64_t)a3;
+ (id)_propertySettersForRecordFetchTask;
+ (id)_recordFetchTaskWithCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4;
+ (id)_recordFetchTaskWithTransactionSourcePID:(int64_t)a3 inDatabase:(id)a4;
+ (id)_tasksForQuery:(id)a3;
+ (id)allRecordFetchTasksInDatabase:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateRecordFetchTask:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteAllEntriesForCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteAllEntriesForTransactionSourcePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)removeRecordFetchTasks:(id)a3 inDatabase:(id)a4;
- (CloudStoreRecordFetchTask)initWithRecordFetchTaskWithTask:(id)a3 transactionSourcePID:(int64_t)a4 cloudStoreZonePID:(int64_t)a5 inDatabase:(id)a6;
- (void)updateRecordFetchTaskWithTask:(id)a3;
@end

@implementation CloudStoreRecordFetchTask

+ (id)databaseTable
{
  return @"cloud_store_record_fetch_task";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"transaction_source_pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"cloud_store_zone_pid";
  }
  return 0;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v9 = v7;
  if (v7 == @"transaction_source.identifier"
    || v7
    && (unsigned int v8 = [@"transaction_source.identifier" isEqualToString:v7],
        v9,
        v8))
  {
    [v6 addObject:@"JOIN transaction_source ON transaction_source.pid = cloud_store_record_fetch_task.transaction_source_pid"];
  }
}

+ (id)insertOrUpdateRecordFetchTask:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v14 = 0;
    goto LABEL_20;
  }
  unsigned int v8 = [v6 transactionSourceIdentifier];
  uint64_t v9 = [v6 cloudStoreZone];
  v10 = (void *)v9;
  if (v8)
  {
    v11 = +[TransactionSource anyInDatabase:v7 withIdentifier:v8];
    id v12 = [v11 persistentID];
    if (v12)
    {
      id v13 = v12;
      id v14 = [a1 _recordFetchTaskWithTransactionSourcePID:v12 inDatabase:v7];
      id v15 = 0;
      goto LABEL_9;
    }
    v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      v23 = v8;
      v18 = "Error tried to insert task %@ with a transactionSourceIdentifier %@ that doesnt exist in the database";
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v20, 0x16u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  if (!v9)
  {
    id v15 = 0;
    id v13 = 0;
    goto LABEL_14;
  }
  v11 = +[CloudStoreZone anyInDatabase:v7 forCloudStoreZone:v9];
  id v16 = [v11 persistentID];
  if (!v16)
  {
    v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      v23 = v10;
      v18 = "Error tried to insert task %@ with a cloudStoreZone %@ that doesnt exist in the database";
      goto LABEL_17;
    }
LABEL_18:

    id v14 = 0;
    goto LABEL_19;
  }
  id v15 = v16;
  id v14 = [a1 _recordFetchTaskWithCloudStoreZonePID:v16 inDatabase:v7];
  id v13 = 0;
LABEL_9:

  if (!v14)
  {
LABEL_14:
    id v14 = [objc_alloc((Class)a1) initWithRecordFetchTaskWithTask:v6 transactionSourcePID:v13 cloudStoreZonePID:v15 inDatabase:v7];
    goto LABEL_19;
  }
  [v14 updateRecordFetchTaskWithTask:v6];
LABEL_19:

LABEL_20:
  return v14;
}

- (CloudStoreRecordFetchTask)initWithRecordFetchTaskWithTask:(id)a3 transactionSourcePID:(int64_t)a4 cloudStoreZonePID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [(id)objc_opt_class() _commonDictionaryForTask:v11];

  if (a4)
  {
    id v13 = +[NSNumber numberWithLongLong:a4];
    [v12 setObjectOrNull:v13 forKey:@"transaction_source_pid"];
  }
  if (a5)
  {
    id v14 = +[NSNumber numberWithLongLong:a5];
    [v12 setObjectOrNull:v14 forKey:@"cloud_store_zone_pid"];
  }
  id v15 = [(SQLiteEntity *)self initWithPropertyValues:v12 inDatabase:v10];

  return v15;
}

- (void)updateRecordFetchTaskWithTask:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _commonDictionaryForTask:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)allRecordFetchTasksInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = +[SQLiteBooleanPredicate truePredicate];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];

  id v7 = [a1 _tasksForQuery:v6];

  return v7;
}

+ (id)_recordFetchTaskWithTransactionSourcePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForTransactionSourcePID:a3];
  unsigned int v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)_recordFetchTaskWithCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForCloudStoreZonePID:a3];
  unsigned int v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)_predicateForTransactionSourcePID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"transaction_source_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForCloudStoreZonePID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"cloud_store_zone_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:a3];
}

+ (void)removeRecordFetchTasks:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v5;
  id v8 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v28;
    *(void *)&long long v9 = 138412546;
    long long v25 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "transactionSourceIdentifier", v25);
        uint64_t v15 = [v13 cloudStoreZone];
        id v16 = (void *)v15;
        if (v14)
        {
          v17 = +[TransactionSource anyInDatabase:v6 withIdentifier:v14];
          id v18 = [v17 persistentID];
          if (v18)
          {
            uint64_t v19 = [a1 _recordFetchTaskWithTransactionSourcePID:v18 inDatabase:v6];
LABEL_12:
            id v21 = (void *)v19;
            goto LABEL_19;
          }
          __int16 v22 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            v32 = v13;
            __int16 v33 = 2112;
            v34 = v14;
            v23 = v22;
            v24 = "Error tried to delete task %@ with a transactionSourceIdentifier %@ that doesnt exist in the database";
LABEL_17:
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0x16u);
          }
        }
        else
        {
          if (!v15) {
            goto LABEL_21;
          }
          v17 = +[CloudStoreZone anyInDatabase:v6 forCloudStoreZone:v15];
          id v20 = [v17 persistentID];
          if (v20)
          {
            uint64_t v19 = [a1 _recordFetchTaskWithCloudStoreZonePID:v20 inDatabase:v6];
            goto LABEL_12;
          }
          __int16 v22 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            v32 = v13;
            __int16 v33 = 2112;
            v34 = v16;
            v23 = v22;
            v24 = "Error tried to delete task %@ with a cloudStoreZone %@ that doesnt exist in the database";
            goto LABEL_17;
          }
        }

        id v21 = 0;
LABEL_19:

        if (v21)
        {
          [v21 deleteFromDatabase];
        }
LABEL_21:
      }
      id v10 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v10);
  }
}

+ (void)deleteAllEntriesForTransactionSourcePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForTransactionSourcePID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (void)deleteAllEntriesForCloudStoreZonePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForCloudStoreZonePID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (id)_tasksForQuery:(id)a3
{
  id v4 = a3;
  id v5 = [v4 database];
  id v30 = objc_alloc_init((Class)NSMutableArray);
  id v6 = objc_alloc_init((Class)NSMutableSet);
  id v7 = [(id)objc_opt_class() _propertySettersForRecordFetchTask];
  id v8 = [v7 allKeys];
  id v9 = [v8 mutableCopy];

  id v10 = (char *)[v9 count];
  [v9 addObject:@"last_error_domain"];
  [v9 addObject:@"last_error_code"];
  [v9 addObject:@"last_error_description"];
  [v9 addObject:@"cloud_store_zone_pid"];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10034F86C;
  v36[3] = &unk_10074A4E8;
  id v41 = a1;
  id v11 = v7;
  id v37 = v11;
  v42 = v10;
  v43 = v10 + 1;
  id v12 = v4;
  v44 = v10 + 2;
  v45 = v10 + 3;
  id v13 = v5;
  id v38 = v13;
  id v14 = v6;
  id v39 = v14;
  id v15 = v30;
  id v40 = v15;
  [v12 enumeratePersistentIDsAndProperties:v9 usingBlock:v36];
  if ([v14 count])
  {
    id v28 = v11;
    id v29 = v13;
    v31 = v12;
    id v16 = objc_alloc_init((Class)NSMutableArray);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v17 = v14;
    id v18 = [v17 countByEnumeratingWithState:&v32 objects:v46 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v17);
          }
          __int16 v22 = [a1 _predicateForPID:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          [v16 addObject:v22];
        }
        id v19 = [v17 countByEnumeratingWithState:&v32 objects:v46 count:16];
      }
      while (v19);
    }

    id v12 = v31;
    v23 = [v31 database];
    v24 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v16];
    long long v25 = [a1 queryWithDatabase:v23 predicate:v24];

    [v25 deleteAllEntities];
    id v11 = v28;
    id v13 = v29;
  }
  id v26 = [v15 copy];

  return v26;
}

+ (id)_commonDictionaryForTask:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 type]);
  [v4 setObjectOrNull:v5 forKey:@"type"];

  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 status]);
  [v4 setObjectOrNull:v6 forKey:@"status"];

  id v7 = [v3 startDate];
  id v8 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v8 forKey:@"start_date"];

  id v9 = [v3 endDate];
  id v10 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v10 forKey:@"end_date"];

  id v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 backoffLevel]);
  [v4 setObjectOrNull:v11 forKey:@"backoff_level"];

  id v12 = [v3 nextPossibleFetchDate];
  id v13 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v13 forKey:@"next_possible_fetch_date"];

  id v14 = [v3 lastError];

  id v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v14 code]);
  [v4 setObjectOrNull:v15 forKey:@"last_error_code"];

  id v16 = [v14 domain];
  [v4 setObjectOrNull:v16 forKey:@"last_error_domain"];

  id v17 = [v14 userInfo];
  id v18 = [v17 objectForKeyedSubscript:NSLocalizedDescriptionKey];
  [v4 setObjectOrNull:v18 forKey:@"last_error_description"];

  return v4;
}

+ (id)_propertySettersForRecordFetchTask
{
  v4[0] = @"type";
  v4[1] = @"status";
  v5[0] = &stru_10074A528;
  v5[1] = &stru_10074A548;
  v4[2] = @"start_date";
  v4[3] = @"end_date";
  v5[2] = &stru_10074A568;
  v5[3] = &stru_10074A588;
  v4[4] = @"backoff_level";
  v4[5] = @"next_possible_fetch_date";
  v5[4] = &stru_10074A5A8;
  v5[5] = &stru_10074A5C8;
  v4[6] = @"transaction_source.identifier";
  v5[6] = &stru_10074A5E8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  return v2;
}

@end