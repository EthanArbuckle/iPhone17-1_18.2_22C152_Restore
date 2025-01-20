@interface WorldRegionMapping
+ (id)_predicateForWorldRegionPID:(int64_t)a3;
+ (id)_predicateForWorldTransactionPID:(int64_t)a3;
+ (id)databaseTable;
+ (id)errorForTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)increaseFailureCountForTransactionPID:(int64_t)a3 error:(id)a4 inDatabase:(id)a5;
+ (void)insertMatchForWorldRegion:(id)a3 transactionPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation WorldRegionMapping

+ (id)databaseTable
{
  return @"world_region_mapping";
}

+ (void)insertMatchForWorldRegion:(id)a3 transactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v19 = [a1 _predicateForWorldTransactionPID:a4];
  v10 = objc_msgSend(a1, "queryWithDatabase:predicate:", v9);
  [v10 deleteAllEntities];

  id v20 = v8;
  if (v20)
  {
    v11 = v20;
    while (1)
    {
      id v12 = objc_alloc_init((Class)NSMutableDictionary);
      v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 persistentID]);
      [v12 setObjectOrNull:v13 forKey:@"world_region_pid"];

      v14 = +[NSNumber numberWithLongLong:a4];
      [v12 setObjectOrNull:v14 forKey:@"payment_transaction_pid"];

      [v12 setObjectOrNull:&off_10078B7A8 forKey:@"match_try_count"];
      v15 = +[NSDate date];
      v16 = (void *)_SQLValueForDate();
      [v12 setObjectOrNull:v16 forKey:@"last_modified_date"];

      v17 = [v11 valueForProperty:@"parent_pid"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      uint64_t v18 = +[WorldRegion anyInDatabase:v9 withPID:v17];

      v11 = (void *)v18;
      if (!v18) {
        goto LABEL_7;
      }
    }
  }
LABEL_7:
}

+ (void)increaseFailureCountForTransactionPID:(int64_t)a3 error:(id)a4 inDatabase:(id)a5
{
  id v20 = a4;
  id v8 = a5;
  id v9 = [a1 _predicateForWorldTransactionPID:a3];
  v10 = [a1 anyInDatabase:v8 predicate:v9];

  v11 = +[NSMutableDictionary dictionary];
  id v12 = +[NSDate date];
  v13 = (void *)_SQLValueForDate();
  [v11 setObjectOrNull:v13 forKey:@"last_modified_date"];

  if (v20)
  {
    v14 = [v20 domain];
    [v11 setObjectOrNull:v14 forKey:@"last_error_domain"];

    v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v20 code]);
    [v11 setObjectOrNull:v15 forKey:@"last_error_code"];

    if (v10)
    {
LABEL_3:
      v16 = [v10 valueForProperty:@"match_try_count"];
      v17 = (char *)[v16 integerValue];

      uint64_t v18 = +[NSNumber numberWithUnsignedInteger:v17 + 1];
      [v11 setObjectOrNull:v18 forKey:@"match_try_count"];

      [v10 setValuesWithDictionary:v11];
      goto LABEL_6;
    }
  }
  else
  {
    [v11 setObjectOrNull:0 forKey:@"last_error_domain"];
    [v11 setObjectOrNull:0 forKey:@"last_error_code"];
    if (v10) {
      goto LABEL_3;
    }
  }
  v19 = +[NSNumber numberWithLongLong:a3];
  [v11 setObjectOrNull:v19 forKey:@"payment_transaction_pid"];

  [v11 setObjectOrNull:&off_10078B7C0 forKey:@"match_try_count"];
LABEL_6:
}

+ (id)errorForTransactionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForWorldTransactionPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 valueForProperty:@"last_error_domain"];
  v10 = [v8 valueForProperty:@"last_error_code"];
  v11 = [v8 valueForProperty:@"last_modified_date"];
  id v12 = (void *)_DateForSQLValue();

  v13 = 0;
  if (v9 && v10 && v12)
  {
    id v14 = [v10 integerValue];
    CFStringRef v18 = @"lastModifiedDate";
    v15 = [v12 description];
    v19 = v15;
    v16 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v13 = +[NSError errorWithDomain:v9 code:v14 userInfo:v16];
  }
  return v13;
}

+ (id)_predicateForWorldRegionPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"world_region_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForWorldTransactionPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_transaction_pid" equalToValue:v3];

  return v4;
}

@end