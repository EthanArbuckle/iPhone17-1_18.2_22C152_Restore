@interface AppleBalanceAccountSummary
+ (id)_commonDictionaryForAppleBalanceAccountSummary:(id)a3;
+ (id)_predicateForAppleBalanceAccountDetailsPID:(int64_t)a3;
+ (id)_propertySettersForAppleBalanceAccountSummary;
+ (id)appleBalanceAccountSummaryForAppleBalanceAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertAppleBalanceAccountSummary:(id)a3 forAppleBalanceAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAppleBalanceAccountSummaryForAppleBalanceAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateAppleBalanceAccountSummary:(id)a3 forAppleBalanceAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (AppleBalanceAccountSummary)initWithAppleBalanceAccountSummary:(id)a3 forAppleBalanceAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (id)appleBalanceAccountSummary;
- (void)updateWithAppleBalanceAccountSummary:(id)a3;
@end

@implementation AppleBalanceAccountSummary

+ (id)databaseTable
{
  return @"celery";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"pid";
  }
  else {
    return 0;
  }
}

- (AppleBalanceAccountSummary)initWithAppleBalanceAccountSummary:(id)a3 forAppleBalanceAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _commonDictionaryForAppleBalanceAccountSummary:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  v13 = v12;

  return v13;
}

+ (id)insertAppleBalanceAccountSummary:(id)a3 forAppleBalanceAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithAppleBalanceAccountSummary:v9 forAppleBalanceAccountDetailsPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteAppleBalanceAccountSummaryForAppleBalanceAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAppleBalanceAccountDetailsPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

+ (id)appleBalanceAccountSummaryForAppleBalanceAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAppleBalanceAccountDetailsPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 appleBalanceAccountSummary];

  return v9;
}

+ (void)updateAppleBalanceAccountSummary:(id)a3 forAppleBalanceAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [a1 _predicateForAppleBalanceAccountDetailsPID:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  if (v10) {
    [v10 updateWithAppleBalanceAccountSummary:v12];
  }
  else {
    id v11 = +[AppleBalanceAccountSummary insertAppleBalanceAccountSummary:v12 forAppleBalanceAccountDetailsPID:a4 inDatabase:v8];
  }
}

- (void)updateWithAppleBalanceAccountSummary:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _commonDictionaryForAppleBalanceAccountSummary:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)_predicateForAppleBalanceAccountDetailsPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForAppleBalanceAccountSummary
{
  CFStringRef v4 = @"b";
  id v5 = &stru_100741A40;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

- (id)appleBalanceAccountSummary
{
  id v3 = objc_alloc_init((Class)PKAppleBalanceAccountSummary);
  CFStringRef v4 = [(id)objc_opt_class() _propertySettersForAppleBalanceAccountSummary];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10022866C;
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

+ (id)_commonDictionaryForAppleBalanceAccountSummary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 currentBalance];

  id v6 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v6 forKey:@"b"];

  return v4;
}

@end