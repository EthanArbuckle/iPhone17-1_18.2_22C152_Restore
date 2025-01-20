@interface CreditAccountRates
+ (id)_predicateForCreditAccountDetailsPID:(int64_t)a3;
+ (id)_predicateForCreditTermsUpdatePID:(int64_t)a3;
+ (id)_propertySettersForCreditAccountRates;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)creditAccountRatesForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)creditAccountRatesForCreditTermsUpdatePID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertAccountRates:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertAccountRates:(id)a3 forCreditTermsUpdatePID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteCreditAccountRatesForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteCreditAccountRatesForCreditTermsUpdatePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateCreditAccountRates:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (CreditAccountRates)initWithCreditAccountRates:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (CreditAccountRates)initWithCreditAccountRates:(id)a3 forCreditTermsUpdatePID:(int64_t)a4 inDatabase:(id)a5;
- (id)creditAccountRates;
- (void)updateWithCreditAccountRates:(id)a3;
@end

@implementation CreditAccountRates

+ (id)databaseTable
{
  return @"cucumbers";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"a";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"c";
  }
  return 0;
}

- (CreditAccountRates)initWithCreditAccountRates:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSMutableDictionary dictionary];
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [v9 aprForPurchases];

  v13 = +[NSNumber numberWithInteger:PKPercentageDecimalToStorageInteger()];
  [v10 setObjectOrNull:v13 forKey:@"b"];

  v14 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v14;
}

- (CreditAccountRates)initWithCreditAccountRates:(id)a3 forCreditTermsUpdatePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSMutableDictionary dictionary];
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"c"];

  v12 = [v9 aprForPurchases];

  v13 = +[NSNumber numberWithInteger:PKPercentageDecimalToStorageInteger()];
  [v10 setObjectOrNull:v13 forKey:@"b"];

  v14 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v14;
}

+ (id)insertAccountRates:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithCreditAccountRates:v9 forCreditAccountDetailsPID:a4 inDatabase:v8];

  return v10;
}

+ (id)insertAccountRates:(id)a3 forCreditTermsUpdatePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithCreditAccountRates:v9 forCreditTermsUpdatePID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteCreditAccountRatesForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForCreditAccountDetailsPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteCreditAccountRatesForCreditTermsUpdatePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForCreditTermsUpdatePID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)creditAccountRatesForCreditAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForCreditAccountDetailsPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 creditAccountRates];

  return v9;
}

+ (id)creditAccountRatesForCreditTermsUpdatePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForCreditTermsUpdatePID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 creditAccountRates];

  return v9;
}

+ (void)updateCreditAccountRates:(id)a3 forCreditAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [a1 _predicateForCreditAccountDetailsPID:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  if (v10) {
    [v10 updateWithCreditAccountRates:v12];
  }
  else {
    id v11 = +[CreditAccountRates insertAccountRates:v12 forCreditAccountDetailsPID:a4 inDatabase:v8];
  }
}

- (void)updateWithCreditAccountRates:(id)a3
{
  id v4 = a3;
  id v7 = +[NSMutableDictionary dictionary];
  v5 = [v4 aprForPurchases];

  id v6 = +[NSNumber numberWithInteger:PKPercentageDecimalToStorageInteger()];
  [v7 setObjectOrNull:v6 forKey:@"b"];

  [(SQLiteEntity *)self setValuesWithDictionary:v7];
}

+ (id)_predicateForCreditAccountDetailsPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForCreditTermsUpdatePID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"c" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForCreditAccountRates
{
  CFStringRef v4 = @"b";
  v5 = &stru_100740CB0;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

- (id)creditAccountRates
{
  id v3 = objc_alloc_init((Class)PKCreditAccountRates);
  CFStringRef v4 = [(id)objc_opt_class() _propertySettersForCreditAccountRates];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100219E2C;
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

@end