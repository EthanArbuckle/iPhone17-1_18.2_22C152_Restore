@interface PayLaterAccountProductEligibleSpend
+ (id)_commonDictionaryForProductEligibleSpend:(id)a3;
+ (id)_predicateForProductPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterAccountProductEligibleSpend;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterProductEligibleSpend:(id)a3 forPayLaterAccountProductPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterProductEligibleSpendForProductPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterProductEligibleSpendForPayLaterProductPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterAccountProductEligibleSpend)initWithAccountProductEligibleSpend:(id)a3 forPayLaterAccountProductPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_availableToSpend;
- (id)eligbleSpend;
- (void)updateWitProductEligibleSpend:(id)a3;
@end

@implementation PayLaterAccountProductEligibleSpend

+ (id)databaseTable
{
  return @"quinoa";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"a";
  }
  else {
    return 0;
  }
}

- (PayLaterAccountProductEligibleSpend)initWithAccountProductEligibleSpend:(id)a3 forPayLaterAccountProductPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _commonDictionaryForProductEligibleSpend:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  v13 = v12;

  return v13;
}

+ (id)insertOrUpdatePayLaterProductEligibleSpend:(id)a3 forPayLaterAccountProductPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v10 = [a1 _predicateForProductPID:a4];
    id v11 = [a1 anyInDatabase:v9 predicate:v10];

    if (v11) {
      [v11 updateWitProductEligibleSpend:v8];
    }
    else {
      id v11 = [objc_alloc((Class)objc_opt_class()) initWithAccountProductEligibleSpend:v8 forPayLaterAccountProductPID:a4 inDatabase:v9];
    }
    id v12 = [v11 persistentID];
    v13 = [v8 financingOptions];
    id v14 = +[PayLaterFinancingOption insertOrUpdatePayLaterFinancingOptions:v13 forEligibleSpendPID:v12 inDatabase:v9];
  }
  else
  {
    [a1 deletePayLaterProductEligibleSpendForPayLaterProductPID:a4 inDatabase:v9];
    id v11 = 0;
  }

  return v11;
}

+ (void)deletePayLaterProductEligibleSpendForPayLaterProductPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForProductPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

+ (id)payLaterProductEligibleSpendForProductPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForProductPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 eligbleSpend];

  return v9;
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = [(SQLiteEntity *)self database];
  +[PayLaterFinancingOption deletePayLaterPayLaterFinancingOptionsForEligibleSpendPID:[(SQLiteEntity *)v2 persistentID] inDatabase:v3];
  v5.receiver = v2;
  v5.super_class = (Class)PayLaterAccountProductEligibleSpend;
  LOBYTE(v2) = [(SQLiteEntity *)&v5 deleteFromDatabase];

  return (char)v2;
}

- (void)updateWitProductEligibleSpend:(id)a3
{
  id v4 = a3;
  id v9 = [(id)objc_opt_class() _commonDictionaryForProductEligibleSpend:v4];
  [(SQLiteEntity *)self setValuesWithDictionary:v9];
  objc_super v5 = [v4 financingOptions];

  int64_t v6 = [(SQLiteEntity *)self persistentID];
  v7 = [(SQLiteEntity *)self database];
  id v8 = +[PayLaterFinancingOption insertOrUpdatePayLaterFinancingOptions:v5 forEligibleSpendPID:v6 inDatabase:v7];
}

+ (id)_predicateForProductPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForPayLaterAccountProductEligibleSpend
{
  CFStringRef v4 = @"b";
  objc_super v5 = &stru_1007327E0;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

- (id)eligbleSpend
{
  id v3 = objc_alloc_init((Class)PKPayLaterAccountProductEligibleSpend);
  CFStringRef v4 = [(id)objc_opt_class() _propertySettersForPayLaterAccountProductEligibleSpend];
  objc_super v5 = [v4 allKeys];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000876F0;
  v14[3] = &unk_10072DDD8;
  v14[4] = self;
  id v15 = v4;
  id v6 = v3;
  id v16 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v14];

  id v8 = [(PayLaterAccountProductEligibleSpend *)self _availableToSpend];
  [v6 setAvailableToSpend:v8];

  int64_t v9 = [(SQLiteEntity *)self persistentID];
  v10 = [(SQLiteEntity *)self database];
  id v11 = +[PayLaterFinancingOption payLaterPayLaterFinancingOptionsForEligibleSpendPID:v9 inDatabase:v10];

  [v6 setFinancingOptions:v11];
  id v12 = v6;

  return v12;
}

- (id)_availableToSpend
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"c"];
  CFStringRef v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"d"];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = PKCurrencyAmountMake();
  }

  return v8;
}

+ (id)_commonDictionaryForProductEligibleSpend:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = [v3 expirationDate];
  id v6 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v6 forKey:@"b"];

  BOOL v7 = [v3 availableToSpend];
  id v8 = [v7 amount];
  int64_t v9 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v9 forKey:@"c"];

  v10 = [v3 availableToSpend];

  id v11 = [v10 currency];
  [v4 setObjectOrNull:v11 forKey:@"d"];

  return v4;
}

@end