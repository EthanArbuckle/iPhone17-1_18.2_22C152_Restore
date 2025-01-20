@interface AccountEnhancedMerchantBehavior
+ (id)_anyInDatabase:(id)a3 withAccountPID:(int64_t)a4;
+ (id)_insertAccountEnhancedMerchantBehavior:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForAccountEnhancedMerchantBehavior;
+ (id)_propertyValuesForEnhancedMerchantBehavior:(id)a3 accountPID:(int64_t)a4;
+ (id)_queryForPredicate:(id)a3 database:(id)a4;
+ (id)accountEnhancedMerchantBehaviorForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (void)deleteAccountEnhancedMerchantBehaviorForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateAccountEnhancedMerchantBehavior:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5;
- (AccountEnhancedMerchantBehavior)initWithAccountEnhancedMerchantBehavior:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)accountEnhancedMerchantBehavior;
- (void)_updateWithAccountEnhancedMerchantBehavior:(id)a3 accountPID:(int64_t)a4;
@end

@implementation AccountEnhancedMerchantBehavior

+ (id)databaseTable
{
  return @"ume";
}

- (AccountEnhancedMerchantBehavior)initWithAccountEnhancedMerchantBehavior:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = +[AccountEnhancedMerchantBehavior _propertyValuesForEnhancedMerchantBehavior:a3 accountPID:a4];
  v10 = [(SQLiteEntity *)self initWithPropertyValues:v9 inDatabase:v8];

  return v10;
}

+ (id)accountEnhancedMerchantBehaviorForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  v4 = [a1 _anyInDatabase:a4 withAccountPID:a3];
  v5 = [v4 accountEnhancedMerchantBehavior];

  return v5;
}

+ (id)_anyInDatabase:(id)a3 withAccountPID:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForAccountPID:a4];
  if (v7)
  {
    id v8 = [a1 anyInDatabase:v6 predicate:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (void)insertOrUpdateAccountEnhancedMerchantBehavior:(id)a3 accountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  v9 = [a1 _anyInDatabase:v8 withAccountPID:a4];
  v10 = v9;
  if (v9) {
    [v9 _updateWithAccountEnhancedMerchantBehavior:v12 accountPID:a4];
  }
  else {
    id v11 = [a1 _insertAccountEnhancedMerchantBehavior:v12 forAccountPID:a4 inDatabase:v8];
  }
}

+ (id)_insertAccountEnhancedMerchantBehavior:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithAccountEnhancedMerchantBehavior:v9 forAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteAccountEnhancedMerchantBehaviorForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (void)_updateWithAccountEnhancedMerchantBehavior:(id)a3 accountPID:(int64_t)a4
{
  id v5 = +[AccountEnhancedMerchantBehavior _propertyValuesForEnhancedMerchantBehavior:a3 accountPID:a4];
  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_queryForPredicate:(id)a3 database:(id)a4
{
  return [a1 queryWithDatabase:a4 predicate:a3];
}

+ (id)_propertySettersForAccountEnhancedMerchantBehavior
{
  CFStringRef v4 = @"b";
  id v5 = &stru_100740C70;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

- (id)accountEnhancedMerchantBehavior
{
  id v3 = objc_alloc_init((Class)PKAccountEnhancedMerchantBehavior);
  CFStringRef v4 = [(id)objc_opt_class() _propertySettersForAccountEnhancedMerchantBehavior];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10021931C;
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

+ (id)_propertyValuesForEnhancedMerchantBehavior:(id)a3 accountPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[NSMutableDictionary dictionary];
  id v7 = +[NSNumber numberWithLongLong:a4];
  [v6 setObjectOrNull:v7 forKey:@"a"];

  [v5 minRefreshPeriod];
  double v9 = v8;

  [v6 setDouble:@"b" forKey:v9];
  id v10 = [v6 copy];

  return v10;
}

@end