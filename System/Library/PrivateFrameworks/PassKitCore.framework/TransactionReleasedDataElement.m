@interface TransactionReleasedDataElement
+ (id)_predicateForReleasedDataPID:(int64_t)a3;
+ (id)_propertySettersForReleasedData;
+ (id)_releasedDataElementsFromQuery:(id)a3;
+ (id)databaseTable;
+ (id)releasedDataElementsForPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertReleasedDataElements:(id)a3 forPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation TransactionReleasedDataElement

+ (id)databaseTable
{
  return @"water";
}

+ (void)insertReleasedDataElements:(id)a3 forPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deleteEntitiesForPID:a4 inDatabase:v9];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v13);
        id v15 = objc_alloc_init((Class)NSMutableDictionary);
        v16 = +[NSNumber numberWithLongLong:a4];
        [v15 setObject:v16 forKey:@"a"];

        v17 = [v14 elementNamespace];
        [v15 setObjectOrNull:v17 forKey:@"b"];

        v18 = [v14 identifier];
        [v15 setObjectOrNull:v18 forKey:@"c"];

        v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 retentionIntent]);
        [v15 setObjectOrNull:v19 forKey:@"d"];

        v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v14 retentionPeriod]);
        [v15 setObjectOrNull:v20 forKey:@"e"];

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }
}

+ (id)releasedDataElementsForPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForReleasedDataPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _releasedDataElementsFromQuery:v8];

  return v9;
}

+ (id)_releasedDataElementsFromQuery:(id)a3
{
  id v4 = a3;
  v5 = [a1 _propertySettersForReleasedData];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1003BD61C;
  v12[3] = &unk_10072EAD8;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if ([v8 count]) {
    id v10 = [v8 copy];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

+ (void)deleteEntitiesForPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForReleasedDataPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)_predicateForReleasedDataPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForReleasedData
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_10074E6D8;
  v5[1] = &stru_10074E6F8;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_10074E718;
  v5[3] = &stru_10074E738;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

@end