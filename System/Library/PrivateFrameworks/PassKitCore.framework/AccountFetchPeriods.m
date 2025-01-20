@interface AccountFetchPeriods
+ (id)_predicateForAccountPID:(id)a3;
+ (id)_propertyDictionaryForAccountFetchPeriods:(id)a3;
+ (id)_propertyValuesForAccountFetchPeriods;
+ (id)accountFetchPeriodsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)anyInDatabase:(id)a3 forAccountPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateAccountFetchPeriods:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAccountFetchPeriodsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (AccountFetchPeriods)initWithAccountFetchPeriods:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)accountFetchPeriods;
- (void)updateWithAccountFetchPeriods:(id)a3;
@end

@implementation AccountFetchPeriods

+ (id)databaseTable
{
  return @"account_fetch_periods";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"account_pid";
  }
  else {
    return 0;
  }
}

+ (id)insertOrUpdateAccountFetchPeriods:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a1 anyInDatabase:v9 forAccountPID:a4];
  if (v10)
  {
    id v11 = v10;
    [v10 updateWithAccountFetchPeriods:v8];
  }
  else
  {
    id v11 = [objc_alloc((Class)a1) initWithAccountFetchPeriods:v8 accountPID:a4 inDatabase:v9];
  }

  return v11;
}

- (AccountFetchPeriods)initWithAccountFetchPeriods:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyDictionaryForAccountFetchPeriods:v9];

  id v11 = [v10 mutableCopy];
  v12 = +[NSNumber numberWithLongLong:a4];
  [v11 setObjectOrNull:v12 forKey:@"account_pid"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v13;
}

- (void)updateWithAccountFetchPeriods:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyDictionaryForAccountFetchPeriods:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)anyInDatabase:(id)a3 forAccountPID:(int64_t)a4
{
  id v6 = a3;
  v7 = +[NSNumber numberWithLongLong:a4];
  id v8 = [a1 _predicateForAccountPID:v7];
  id v9 = [a1 anyInDatabase:v6 predicate:v8];

  return v9;
}

+ (id)accountFetchPeriodsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v4 = [a1 anyInDatabase:a4 forAccountPID:a3];
  id v5 = [v4 accountFetchPeriods];

  return v5;
}

- (id)accountFetchPeriods
{
  id v3 = objc_alloc_init((Class)PKAccountFetchPeriods);
  id v4 = [(id)objc_opt_class() _propertyValuesForAccountFetchPeriods];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100498A1C;
  v11[3] = &unk_10072DDD8;
  v11[4] = self;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (void)deleteAccountFetchPeriodsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v4 = [a1 anyInDatabase:a4 forAccountPID:a3];
  [v4 deleteFromDatabase];
}

+ (id)_predicateForAccountPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"account_pid" equalToValue:a3];
}

+ (id)_propertyDictionaryForAccountFetchPeriods:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 blockedEndpoints];
  id v6 = [v5 allObjects];
  id v7 = [v6 componentsJoinedByString:@","];
  [v4 setObjectOrNull:v7 forKey:@"blocked_endpoints"];

  [v3 accountFetchPeriod];
  [v4 setInteger:(uint64_t)v8 forKey:@"account_fetch_period"];
  [v3 extendedAccountFetchPeriod];
  [v4 setInteger:(uint64_t)v9 forKey:@"extended_account_fetch_period"];
  [v3 usersFetchPeriod];
  [v4 setInteger:(uint64_t)v10 forKey:@"a"];
  [v3 sharedCloudStoreModelFetchPeriod];
  [v4 setInteger:(uint64_t)v11 forKey:@"b"];
  [v3 financingPlansFetchPeriod];
  [v4 setInteger:(uint64_t)v12 forKey:@"c"];
  [v3 fundingSourcesFetchPeriod];
  [v4 setInteger:(uint64_t)v13 forKey:@"funding_sources_fetch_period"];
  [v3 recoveryPaymentPlansFetchPeriod];
  [v4 setInteger:(uint64_t)v14 forKey:@"recovery_payment_plans_fetch_period"];
  [v3 physicalCardsFetchPeriod];
  double v16 = v15;

  [v4 setInteger:(uint64_t)v16 forKey:@"physical_cards_fetch_period"];
  id v17 = [v4 copy];

  return v17;
}

+ (id)_propertyValuesForAccountFetchPeriods
{
  v4[0] = @"blocked_endpoints";
  v4[1] = @"account_fetch_period";
  v5[0] = &stru_100754898;
  v5[1] = &stru_1007548D8;
  v4[2] = @"extended_account_fetch_period";
  v4[3] = @"a";
  v5[2] = &stru_1007548F8;
  v5[3] = &stru_100754918;
  v4[4] = @"b";
  v4[5] = @"c";
  v5[4] = &stru_100754938;
  v5[5] = &stru_100754958;
  v4[6] = @"funding_sources_fetch_period";
  v4[7] = @"recovery_payment_plans_fetch_period";
  v5[6] = &stru_100754978;
  v5[7] = &stru_100754998;
  v4[8] = @"physical_cards_fetch_period";
  v5[8] = &stru_1007549B8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:9];
  return v2;
}

@end