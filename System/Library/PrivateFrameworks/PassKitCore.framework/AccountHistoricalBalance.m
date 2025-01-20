@interface AccountHistoricalBalance
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_predicateForEndDate:(id)a3;
+ (id)_predicateForStartDate:(id)a3;
+ (id)_predicateForType:(unint64_t)a3;
+ (id)_propertySettersForBalance;
+ (id)balancesForAccountPID:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 limit:(unint64_t)a7 inDatabase:(id)a8;
+ (id)databaseTable;
+ (id)insertBalance:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteBalancesForAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (AccountHistoricalBalance)initWithBalance:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation AccountHistoricalBalance

+ (id)databaseTable
{
  return @"account_historical_balance";
}

- (AccountHistoricalBalance)initWithBalance:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSMutableDictionary dictionary];
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"account_pid"];

  v12 = [v9 balance];
  v13 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v13 forKey:@"balance"];

  v14 = [v9 date];
  v15 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v15 forKey:@"date"];

  id v16 = [v9 type];
  v17 = +[NSNumber numberWithUnsignedInteger:v16];
  [v10 setObjectOrNull:v17 forKey:@"type"];

  v18 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v18;
}

+ (id)insertBalance:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithBalance:v9 forAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteBalancesForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)balancesForAccountPID:(int64_t)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 limit:(unint64_t)a7 inDatabase:(id)a8
{
  CFStringRef v43 = @"date";
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  v34 = +[NSArray arrayWithObjects:&v43 count:1];
  if (a7)
  {
    if (v16 && v15)
    {
      CFStringRef v42 = @"ASC";
      v17 = &v42;
    }
    else
    {
      CFStringRef v41 = @"DESC";
      v17 = &v41;
    }
  }
  else
  {
    CFStringRef v40 = @"ASC";
    v17 = &v40;
  }
  v18 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 1, a7);
  v19 = [a1 _predicateForAccountPID:a3];
  v39[0] = v19;
  v20 = [a1 _predicateForStartDate:v16];

  v39[1] = v20;
  v21 = [a1 _predicateForEndDate:v15];

  v39[2] = v21;
  v22 = [a1 _predicateForType:a6];
  v39[3] = v22;
  v23 = +[NSArray arrayWithObjects:v39 count:4];
  v24 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v23];
  v25 = [a1 queryWithDatabase:v14 predicate:v24 orderingProperties:v34 orderingDirections:v18 limit:v33];

  v26 = [a1 _propertySettersForBalance];
  id v27 = objc_alloc_init((Class)NSMutableArray);
  v28 = [v26 allKeys];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100483330;
  v35[3] = &unk_10072EAD8;
  id v38 = a1;
  id v36 = v26;
  id v29 = v27;
  id v37 = v29;
  id v30 = v26;
  [v25 enumeratePersistentIDsAndProperties:v28 usingBlock:v35];

  if ([v29 count]) {
    id v31 = [v29 copy];
  }
  else {
    id v31 = 0;
  }

  return v31;
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"account_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForType:(unint64_t)a3
{
  v3 = +[NSNumber numberWithUnsignedInteger:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"type" equalToValue:v3];

  return v4;
}

+ (id)_predicateForStartDate:(id)a3
{
  if (a3)
  {
    v3 = (void *)_SQLValueForDate();
    v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"date" greaterThanOrEqualToValue:v3];
  }
  else
  {
    v4 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v4;
}

+ (id)_predicateForEndDate:(id)a3
{
  if (a3)
  {
    v3 = (void *)_SQLValueForDate();
    v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"date" lessThanOrEqualToValue:v3];
  }
  else
  {
    v4 = +[SQLiteBooleanPredicate truePredicate];
  }
  return v4;
}

+ (id)_propertySettersForBalance
{
  v4[0] = @"balance";
  v4[1] = @"date";
  v5[0] = &stru_100753D98;
  v5[1] = &stru_100753DB8;
  v4[2] = @"type";
  v5[2] = &stru_100753DD8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

@end