@interface BarcodeFetch
+ (BOOL)removeBarcodeFetchForPassPID:(int64_t)a3 inDatabase:(id)a4;
+ (BOOL)updateNextBackgroundFetchDate:(id)a3 withBackgroundFetchRetryLevel:(int64_t)a4 forPassPID:(int64_t)a5 inDatabase:(id)a6;
+ (id)_barcodeFetchesForQuery:(id)a3;
+ (id)_predicateForFutureNextBackgroundFetchDates;
+ (id)_predicateForNextBackgroundFetchDatesBeforeDate:(id)a3;
+ (id)_predicateForNotNullNextBackgroundFetchDates;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)anyInDatabase:(id)a3 withPassPID:(int64_t)a4;
+ (id)createIfNotExistInDatabase:(id)a3 withPassPID:(int64_t)a4;
+ (id)databaseTable;
+ (id)nextBackgroundFetchDateInDatabase:(id)a3;
+ (id)passPIDsWithNextbackgroundFetchDateBeforeDate:(id)a3 inDatabase:(id)a4;
+ (int64_t)backgroundFetchRetryLevelForPassPID:(int64_t)a3 inDatabase:(id)a4;
- (id)nextBackgroundFetchDate;
@end

@implementation BarcodeFetch

+ (id)databaseTable
{
  return @"barcode_fetch";
}

+ (id)anyInDatabase:(id)a3 withPassPID:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPassPID:a4];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)createIfNotExistInDatabase:(id)a3 withPassPID:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 anyInDatabase:v6 withPassPID:a4];
  if (!v7)
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    [v8 setLongLong:a4 forKey:@"pass_pid"];
    v9 = [BarcodeFetch alloc];
    id v10 = [v8 copy];
    v7 = [(SQLiteEntity *)v9 initWithPropertyValues:v10 inDatabase:v6];
  }
  return v7;
}

+ (int64_t)backgroundFetchRetryLevelForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  v4 = [a1 anyInDatabase:a4 withPassPID:a3];
  v5 = [v4 valueForProperty:@"background_fetch_retry_level"];
  id v6 = [v5 integerValue];

  return (int64_t)v6;
}

+ (BOOL)updateNextBackgroundFetchDate:(id)a3 withBackgroundFetchRetryLevel:(int64_t)a4 forPassPID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a3;
  v11 = [a1 createIfNotExistInDatabase:a6 withPassPID:a5];
  v12 = (void *)_SQLValueForDate();

  if ([v11 setValue:v12 forProperty:@"next_background_fetch_date"])
  {
    v13 = +[NSNumber numberWithInteger:a4];
    unsigned __int8 v14 = [v11 setValue:v13 forProperty:@"background_fetch_retry_level"];
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

+ (id)nextBackgroundFetchDateInDatabase:(id)a3
{
  id v4 = a3;
  v5 = [a1 _predicateForNotNullNextBackgroundFetchDates];
  v26[0] = v5;
  id v6 = [a1 _predicateForFutureNextBackgroundFetchDates];
  v26[1] = v6;
  v7 = +[NSArray arrayWithObjects:v26 count:2];
  id v8 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v7];

  CFStringRef v25 = @"next_background_fetch_date";
  v9 = +[NSArray arrayWithObjects:&v25 count:1];
  CFStringRef v24 = @"ASC";
  id v10 = +[NSArray arrayWithObjects:&v24 count:1];
  v11 = +[SQLiteEntity queryWithDatabase:v4 predicate:v8 orderingProperties:v9 orderingDirections:v10 limit:1];

  v12 = +[BarcodeFetch _barcodeFetchesForQuery:v11];
  v13 = [v12 firstObject];
  unsigned __int8 v14 = [v13 valueForProperty:@"next_background_fetch_date"];
  v15 = (void *)_DateForSQLValue();

  if (!v15)
  {
    v16 = [a1 _predicateForNotNullNextBackgroundFetchDates];
    v23[0] = v16;
    v17 = +[NSDate date];
    v18 = [a1 _predicateForNextBackgroundFetchDatesBeforeDate:v17];
    v23[1] = v18;
    v19 = +[NSArray arrayWithObjects:v23 count:2];
    v20 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v19];

    v21 = +[SQLiteEntity queryWithDatabase:v4 predicate:v20];

    if ((uint64_t)[v21 countOfEntities] < 1)
    {
      v15 = 0;
    }
    else
    {
      v15 = +[NSDate dateWithTimeIntervalSinceNow:600.0];
    }

    v11 = v21;
  }

  return v15;
}

+ (id)passPIDsWithNextbackgroundFetchDateBeforeDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _predicateForNotNullNextBackgroundFetchDates];
  v20[0] = v8;
  v9 = [a1 _predicateForNextBackgroundFetchDatesBeforeDate:v7];

  v20[1] = v9;
  id v10 = +[NSArray arrayWithObjects:v20 count:2];
  v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  CFStringRef v19 = @"next_background_fetch_date";
  v12 = +[NSArray arrayWithObjects:&v19 count:1];
  CFStringRef v18 = @"ASC";
  v13 = +[NSArray arrayWithObjects:&v18 count:1];
  unsigned __int8 v14 = +[SQLiteEntity queryWithDatabase:v6 predicate:v11 orderingProperties:v12 orderingDirections:v13];

  v15 = +[BarcodeFetch _barcodeFetchesForQuery:v14];
  v16 = objc_msgSend(v15, "pk_arrayByApplyingBlock:", &stru_10074BE18);

  return v16;
}

+ (BOOL)removeBarcodeFetchForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v4 = +[BarcodeFetch anyInDatabase:a4 withPassPID:a3];
  unsigned __int8 v5 = [v4 deleteFromDatabase];

  return v5;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForNotNullNextBackgroundFetchDates
{
  return +[SQLiteNullPredicate isNotNullPredicateWithProperty:@"next_background_fetch_date"];
}

+ (id)_predicateForFutureNextBackgroundFetchDates
{
  v2 = +[NSDate date];
  v3 = (void *)_SQLValueForDate();
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"next_background_fetch_date" greaterThanOrEqualToValue:v3];

  return v4;
}

+ (id)_predicateForNextBackgroundFetchDatesBeforeDate:(id)a3
{
  v3 = (void *)_SQLValueForDate();
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"next_background_fetch_date" lessThanValue:v3];

  return v4;
}

+ (id)_barcodeFetchesForQuery:(id)a3
{
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_100378D98;
  id v10 = &unk_100730E38;
  id v11 = a3;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  id v3 = v12;
  id v4 = v11;
  [v4 enumeratePersistentIDsUsingBlock:&v7];
  id v5 = objc_msgSend(v3, "copy", v7, v8, v9, v10);

  return v5;
}

- (id)nextBackgroundFetchDate
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"next_background_fetch_date"];
  id v3 = (void *)_DateForSQLValue();

  return v3;
}

@end