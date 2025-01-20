@interface PassRelevancyDates
+ (BOOL)hasRelevancyDatesForPassPID:(unint64_t)a3 inDatabase:(id)a4;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_propertyValuesForPassRelevancyDates:(id)a3 passPID:(int64_t)a4;
+ (id)_relevantDatesInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)relevancyDatesForPassPID:(unint64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertPassRelevancyDates:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation PassRelevancyDates

+ (id)_relevantDatesInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = +[SQLiteEntity queryWithDatabase:v6 predicate:v5];

  v17[0] = @"relevant_date";
  v17[1] = @"start_date";
  v17[2] = @"end_date";
  v9 = +[NSArray arrayWithObjects:v17 count:3];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000177DC;
  v15[3] = &unk_100731258;
  id v16 = v7;
  id v10 = v7;
  [v8 enumeratePersistentIDsAndProperties:v9 usingBlock:v15];

  v11 = [v10 sortedArrayUsingComparator:&stru_100737458];
  if ([v11 count]) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  return v13;
}

+ (id)databaseTable
{
  return @"relevant_pass_dates";
}

+ (id)relevancyDatesForPassPID:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPassPID:a3];
  v8 = [a1 _relevantDatesInDatabase:v6 matchingPredicate:v7];

  return v8;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"pass_pid";
  }
  else {
    return 0;
  }
}

+ (void)insertPassRelevancyDates:(id)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100108608;
  v8[3] = &unk_100737418;
  id v11 = a1;
  int64_t v12 = a4;
  id v9 = a3;
  id v10 = a5;
  id v6 = v10;
  id v7 = v9;
  sub_10000817C((uint64_t)v6, v8);
}

+ (BOOL)hasRelevancyDatesForPassPID:(unint64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPassPID:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8 != 0;
}

+ (void)deleteEntitiesForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPassPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)_propertyValuesForPassRelevancyDates:(id)a3 passPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[NSMutableDictionary dictionary];
  id v7 = [v5 effectiveStartDate];
  id v8 = (void *)_SQLValueForDate();
  [v6 setObjectOrNull:v8 forKey:@"start_date"];

  id v9 = [v5 effectiveEndDate];
  id v10 = (void *)_SQLValueForDate();
  [v6 setObjectOrNull:v10 forKey:@"end_date"];

  id v11 = [v5 date];

  int64_t v12 = (void *)_SQLValueForDate();
  [v6 setObjectOrNull:v12 forKey:@"relevant_date"];

  id v13 = +[NSNumber numberWithLongLong:a4];
  [v6 setObject:v13 forKey:@"pass_pid"];

  id v14 = [v6 copy];
  return v14;
}

@end