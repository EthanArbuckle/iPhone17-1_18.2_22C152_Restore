@interface PaymentBalance
+ (id)_paymentBalancesInDatabase:(id)a3 passPredicate:(id)a4;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_predicateForPaymentPass:(id)a3;
+ (id)_predicateForPaymentPassWithPID:(unint64_t)a3;
+ (id)_propertySettersForPaymentBalanceWithEffectiveProperties:(id *)a3 indices:(id *)a4;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4 forPassWithUniqueIdentifier:(id)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPaymentBalance:(id)a3 withPaymentPass:(id)a4 inDatabase:(id)a5;
+ (id)paymentBalancesInDatabase:(id)a3 forPass:(id)a4;
+ (id)paymentBalancesInDatabase:(id)a3 forPassPID:(unint64_t)a4;
+ (id)paymentBalancesInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4;
+ (int64_t)countInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4;
+ (void)_updateBalance:(id)a3 value:(id)a4 currencyCode:(id)a5 exponent:(int64_t)a6;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
+ (void)truncateEntitiesForPass:(id)a3 inDatabase:(id)a4 toCount:(int64_t)a5;
- (BOOL)isPrimaryBalance;
- (PaymentBalance)initWithPaymentBalance:(id)a3 paymentPass:(id)a4 inDatabase:(id)a5;
- (id)identifier;
- (id)passUniqueIdentifier;
- (id)paymentBalance;
@end

@implementation PaymentBalance

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  CFStringRef v9 = @"pass.unique_id";
  id v6 = a3;
  v7 = +[NSArray arrayWithObjects:&v9 count:1];
  unsigned int v8 = objc_msgSend(v7, "containsObject:", v6, v9);

  if (v8) {
    [v5 addObject:@"JOIN pass ON pass.pid = payment_balance.pass_pid"];
  }
}

+ (id)databaseTable
{
  return @"payment_balance";
}

+ (id)paymentBalancesInDatabase:(id)a3 forPass:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPaymentPass:a4];
  unsigned int v8 = [a1 _paymentBalancesInDatabase:v6 passPredicate:v7];

  return v8;
}

+ (id)_predicateForPaymentPass:(id)a3
{
  v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)_paymentBalancesInDatabase:(id)a3 passPredicate:(id)a4
{
  CFStringRef v26 = @"last_updated_date";
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = +[NSArray arrayWithObjects:&v26 count:1];
  CFStringRef v25 = @"DESC";
  CFStringRef v9 = +[NSArray arrayWithObjects:&v25 count:1];
  v10 = [a1 queryWithDatabase:v7 predicate:v6 orderingProperties:v8 orderingDirections:v9];

  id v24 = 0;
  long long v22 = 0uLL;
  uint64_t v23 = 0;
  v11 = +[PaymentBalance _propertySettersForPaymentBalanceWithEffectiveProperties:&v24 indices:&v22];
  v12 = +[NSMutableSet set];
  id v13 = v24;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10034B4D0;
  v17[3] = &unk_10074A1C8;
  id v18 = v12;
  id v19 = a1;
  long long v20 = v22;
  uint64_t v21 = v23;
  v17[4] = v11;
  id v14 = v12;
  [v10 enumeratePersistentIDsAndProperties:v13 usingBlock:v17];
  id v15 = [v14 copy];

  return v15;
}

+ (id)_propertySettersForPaymentBalanceWithEffectiveProperties:(id *)a3 indices:(id *)a4
{
  v4 = 0;
  if (a3 && a4)
  {
    v12[0] = @"identifier";
    v12[1] = @"localized_title";
    v13[0] = &stru_10074A208;
    v13[1] = &stru_10074A228;
    v12[2] = @"localized_description";
    v12[3] = @"preformatted_string";
    v13[2] = &stru_10074A248;
    v13[3] = &stru_10074A268;
    v12[4] = @"last_updated_date";
    v12[5] = @"is_primary_balance";
    v13[4] = &stru_10074A288;
    v13[5] = &stru_10074A2A8;
    v12[6] = @"currency_code";
    v12[7] = @"exponent";
    v13[6] = &stru_10074A2C8;
    v13[7] = &stru_10074A2E8;
    v12[8] = @"value";
    v13[8] = &stru_10074A308;
    v4 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:9];
    id v7 = [v4 allKeys];
    id v8 = [v7 mutableCopy];

    a4->var1 = (int64_t)[v8 count];
    [v8 addObject:@"currency_code"];
    a4->var2 = (int64_t)[v8 count];
    [v8 addObject:@"exponent"];
    a4->var0 = (int64_t)[v8 count];
    [v8 addObject:@"value"];
    id v9 = [v8 copy];
    id v10 = *a3;
    *a3 = v9;
  }
  return v4;
}

- (PaymentBalance)initWithPaymentBalance:(id)a3 paymentPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 identifiers];
  v12 = [v11 anyObject];
  if ((unint64_t)[v11 count] > 1 || objc_msgSend(v8, "isComposed"))
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v11;
    }
    id v14 = 0;
  }
  else
  {
    id v13 = objc_alloc_init((Class)NSMutableDictionary);
    id v15 = [v8 exponent];
    id v27 = v15;
    if ([v8 isCurrency])
    {
      v16 = [v8 value];
      CFStringRef v26 = PKCurrencyDecimalToStorageNumber();
    }
    else
    {
      v16 = [v8 value];
      v17 = [v16 decimalNumberByMultiplyingByPowerOf10:(__int16)v15];
      CFStringRef v26 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v17 longLongValue]);
    }
    id v18 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v9 persistentID]);
    [v13 setObjectOrNull:v18 forKey:@"pass_pid"];

    id v19 = [v8 preformattedString];
    [v13 setObjectOrNull:v19 forKey:@"preformatted_string"];

    [v13 setObjectOrNull:v12 forKey:@"identifier"];
    -[NSObject setBool:forKey:](v13, "setBool:forKey:", [v8 isPrimary], @"is_primary_balance");
    [v13 setObjectOrNull:v26 forKey:@"value"];
    long long v20 = [v8 currencyCode];
    [v13 setObjectOrNull:v20 forKey:@"currency_code"];

    [v13 setInteger:v27 forKey:@"exponent"];
    uint64_t v21 = [v8 lastUpdateDate];
    long long v22 = (void *)_SQLValueForDate();
    [v13 setObjectOrNull:v22 forKey:@"last_updated_date"];

    uint64_t v23 = [v8 localizedTitle];
    [v13 setObjectOrNull:v23 forKey:@"localized_title"];

    id v24 = [v8 localizedDescription];
    [v13 setObjectOrNull:v24 forKey:@"localized_description"];

    v28.receiver = self;
    v28.super_class = (Class)PaymentBalance;
    self = [(SQLiteEntity *)&v28 initWithPropertyValues:v13 inDatabase:v10];

    id v14 = self;
  }

  return v14;
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

+ (id)insertPaymentBalance:(id)a3 withPaymentPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithPaymentBalance:v10 paymentPass:v9 inDatabase:v8];

  return v11;
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPaymentPass:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)truncateEntitiesForPass:(id)a3 inDatabase:(id)a4 toCount:(int64_t)a5
{
  id v8 = a4;
  id v9 = [a1 _predicateForPaymentPass:a3];
  CFStringRef v18 = @"last_updated_date";
  id v10 = +[NSArray arrayWithObjects:&v18 count:1];
  CFStringRef v17 = @"DESC";
  id v11 = +[NSArray arrayWithObjects:&v17 count:1];
  v12 = [a1 queryWithDatabase:v8 predicate:v9 orderingProperties:v10 orderingDirections:v11];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10034B19C;
  v14[3] = &unk_100748F08;
  id v15 = v8;
  int64_t v16 = a5;
  id v13 = v8;
  [v12 enumeratePersistentIDsUsingBlock:v14];
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4 forPassWithUniqueIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [a1 _predicateForPassWithUniqueIdentifier:a5];
  id v11 = [a1 _predicateForIdentifier:v8];

  v16[0] = v10;
  v16[1] = v11;
  v12 = +[NSArray arrayWithObjects:v16 count:2];
  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  id v14 = [a1 anyInDatabase:v9 predicate:v13];

  return v14;
}

+ (int64_t)countInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPassWithUniqueIdentifier:a4];
  id v8 = [a1 countInDatabase:v6 predicate:v7];

  return (int64_t)v8;
}

+ (id)paymentBalancesInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPassWithUniqueIdentifier:a4];
  id v8 = [a1 _paymentBalancesInDatabase:v6 passPredicate:v7];

  return v8;
}

+ (id)paymentBalancesInDatabase:(id)a3 forPassPID:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPaymentPassWithPID:a4];
  id v8 = [a1 _paymentBalancesInDatabase:v6 passPredicate:v7];

  id v9 = [v8 allObjects];

  return v9;
}

- (id)paymentBalance
{
  id v3 = objc_alloc_init((Class)PKPaymentBalance);
  uint64_t v15 = 0;
  id v16 = 0;
  long long v14 = 0uLL;
  v4 = +[PaymentBalance _propertySettersForPaymentBalanceWithEffectiveProperties:&v16 indices:&v14];
  id v5 = v16;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10034B6A4;
  v10[3] = &unk_100744220;
  v10[4] = v4;
  id v6 = v3;
  id v11 = v6;
  long long v12 = v14;
  uint64_t v13 = v15;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v10];
  id v7 = v11;
  id v8 = v6;

  return v8;
}

- (BOOL)isPrimaryBalance
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"is_primary_balance"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (id)identifier
{
  return [(SQLiteEntity *)self valueForProperty:@"identifier"];
}

- (id)passUniqueIdentifier
{
  return [(SQLiteEntity *)self valueForProperty:@"pass.unique_id"];
}

+ (id)_predicateForPaymentPassWithPID:(unint64_t)a3
{
  unsigned __int8 v3 = +[NSNumber numberWithUnsignedLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:a3];
}

+ (void)_updateBalance:(id)a3 value:(id)a4 currencyCode:(id)a5 exponent:(int64_t)a6
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  [v13 setCurrencyCode:v10];
  [v13 setExponent:a6];
  if (v9)
  {
    if (v10 && ![v10 isEqualToString:PKNoCurrencyCode])
    {
      long long v12 = PKCurrencyStorageNumberToCurrencyDecimal();
    }
    else
    {
      id v11 = objc_msgSend(objc_alloc((Class)NSDecimalNumber), "initWithLongLong:", objc_msgSend(v9, "longLongValue"));
      long long v12 = [v11 decimalNumberByMultiplyingByPowerOf10:(__int16)-(__int16)a6];
    }
    [v13 setValue:v12];
  }
}

@end