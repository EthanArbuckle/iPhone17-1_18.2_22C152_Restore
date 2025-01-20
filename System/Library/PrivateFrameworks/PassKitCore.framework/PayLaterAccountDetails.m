@interface PayLaterAccountDetails
+ (id)_commonDictionaryForPayLaterDetails:(id)a3;
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterAccountDetails;
+ (id)accountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAccountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterAccountDetails)initWithAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_amountPaid;
- (id)_currentBalance;
- (id)_nextDueAmount;
- (id)_totalFinanced;
- (id)accountDetails;
- (void)updateWitDetails:(id)a3;
@end

@implementation PayLaterAccountDetails

+ (id)databaseTable
{
  return @"persimmon";
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

- (PayLaterAccountDetails)initWithAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = [a3 payLaterDetails];
  v10 = [(id)objc_opt_class() _commonDictionaryForPayLaterDetails:v9];
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v12;
}

+ (id)insertOrUpdateAccountDetails:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [a1 _predicateForAccountPID:a4];
  id v11 = [a1 anyInDatabase:v8 predicate:v10];

  if (v11) {
    [v11 updateWitDetails:v9];
  }
  else {
    id v11 = [objc_alloc((Class)objc_opt_class()) initWithAccountDetails:v9 forAccountPID:a4 inDatabase:v8];
  }
  v12 = [v9 payLaterDetails];

  if (v12)
  {
    id v13 = [v11 persistentID];
    v14 = [v12 products];
    +[PayLaterAccountProduct insertOrUpdatePayLaterAccountProducts:v14 forPayLaterAccountDetailsPID:v13 inDatabase:v8];

    v15 = [v12 termsDetails];
    id v16 = +[PayLaterAccountTermsDetails insertOrUpdatePayLaterAccountTermsDetails:v15 forPayLaterAccountDetailsPID:v13 inDatabase:v8];

    v17 = [v12 userInfo];
    id v18 = +[PayLaterAccountUserInfo insertOrUpdatePayLaterAccountUserInfo:v17 forAccountDetailsPID:v13 inDatabase:v8];
  }
  return v11;
}

+ (void)deleteAccountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  v4 = [(SQLiteEntity *)v2 database];
  +[PayLaterAccountProduct deletePayLaterAccountProductForPayLaterAccountDetailsPID:v3 inDatabase:v4];
  +[PayLaterAccountTermsDetails deletePayLaterAccountTermsDetailsForPayLaterAccountDetailsPID:v3 inDatabase:v4];
  +[PayLaterAccountUserInfo deletePayLaterAccountUserInfoForAccountDetailsPID:v3 inDatabase:v4];
  v6.receiver = v2;
  v6.super_class = (Class)PayLaterAccountDetails;
  LOBYTE(v2) = [(SQLiteEntity *)&v6 deleteFromDatabase];

  return (char)v2;
}

+ (id)accountDetailsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 accountDetails];

  return v9;
}

- (void)updateWitDetails:(id)a3
{
  id v5 = [a3 payLaterDetails];
  v4 = [(id)objc_opt_class() _commonDictionaryForPayLaterDetails:v5];
  [(SQLiteEntity *)self setValuesWithDictionary:v4];
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForPayLaterAccountDetails
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100745A78;
  v5[1] = &stru_100745A98;
  v4[2] = @"j";
  v4[3] = @"m";
  v5[2] = &stru_100745AB8;
  v5[3] = &stru_100745AD8;
  v4[4] = @"n";
  v4[5] = @"o";
  v5[4] = &stru_100745AF8;
  v5[5] = &stru_100745B18;
  v4[6] = @"p";
  v4[7] = @"q";
  v5[6] = &stru_100745B38;
  v5[7] = &stru_100745B58;
  v4[8] = @"r";
  v4[9] = @"s";
  v5[8] = &stru_100745B78;
  v5[9] = &stru_100745B98;
  v4[10] = @"t";
  v4[11] = @"u";
  v5[10] = &stru_100745BB8;
  v5[11] = &stru_100745BD8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:12];
  return v2;
}

- (id)accountDetails
{
  id v3 = objc_alloc_init((Class)PKPayLaterAccountDetails);
  v4 = [(id)objc_opt_class() _propertySettersForPayLaterAccountDetails];
  id v5 = [v4 allKeys];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1002B5DDC;
  v19[3] = &unk_10072DDD8;
  v19[4] = self;
  id v20 = v4;
  id v21 = v3;
  id v6 = v3;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v19];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  id v9 = [(SQLiteEntity *)self database];
  v10 = +[PayLaterAccountProduct payLaterProductsForPayLaterAccountDetailsPID:v8 inDatabase:v9];
  [v6 setProducts:v10];

  id v11 = +[PayLaterAccountTermsDetails payLaterAccountTermsDetailsForAccountDetailsPID:v8 inDatabase:v9];
  [v6 setTermsDetails:v11];

  v12 = +[PayLaterAccountUserInfo payLaterAccountUserInfoForAccountDetailsPID:v8 inDatabase:v9];
  [v6 setUserInfo:v12];

  id v13 = [(PayLaterAccountDetails *)self _currentBalance];
  [v6 setCurrentBalance:v13];

  v14 = [(PayLaterAccountDetails *)self _amountPaid];
  [v6 setAmountPaid:v14];

  v15 = [(PayLaterAccountDetails *)self _totalFinanced];
  [v6 setTotalFinanced:v15];

  id v16 = [(PayLaterAccountDetails *)self _nextDueAmount];
  [v6 setNextDueAmount:v16];

  id v17 = [objc_alloc((Class)PKAccountDetails) initWithPayLaterDetails:v6];
  return v17;
}

- (id)_currentBalance
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"d"];
  v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"e"];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    int64_t v8 = 0;
  }
  else
  {
    int64_t v8 = PKCurrencyAmountMake();
  }

  return v8;
}

- (id)_amountPaid
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"f"];
  v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"g"];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    int64_t v8 = 0;
  }
  else
  {
    int64_t v8 = PKCurrencyAmountMake();
  }

  return v8;
}

- (id)_totalFinanced
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"h"];
  v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"i"];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    int64_t v8 = 0;
  }
  else
  {
    int64_t v8 = PKCurrencyAmountMake();
  }

  return v8;
}

- (id)_nextDueAmount
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"k"];
  v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"l"];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    int64_t v8 = 0;
  }
  else
  {
    int64_t v8 = PKCurrencyAmountMake();
  }

  return v8;
}

+ (id)_commonDictionaryForPayLaterDetails:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = [v3 createdDate];
  id v6 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v6 forKey:@"c"];

  BOOL v7 = [v3 lastUpdatedDate];
  int64_t v8 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v8 forKey:@"b"];

  id v9 = [v3 currentBalance];
  v10 = [v9 amount];
  id v11 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v11 forKey:@"d"];

  v12 = [v3 currentBalance];
  id v13 = [v12 currency];
  [v4 setObjectOrNull:v13 forKey:@"e"];

  v14 = [v3 amountPaid];
  v15 = [v14 amount];
  id v16 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v16 forKey:@"f"];

  id v17 = [v3 amountPaid];
  id v18 = [v17 currency];
  [v4 setObjectOrNull:v18 forKey:@"g"];

  v19 = [v3 totalFinanced];
  id v20 = [v19 amount];
  id v21 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v21 forKey:@"h"];

  v22 = [v3 totalFinanced];
  v23 = [v22 currency];
  [v4 setObjectOrNull:v23 forKey:@"i"];

  v24 = [v3 nextDueDate];
  v25 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v25 forKey:@"j"];

  v26 = [v3 nextDueAmount];
  v27 = [v26 amount];
  v28 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v28 forKey:@"k"];

  v29 = [v3 nextDueAmount];
  v30 = [v29 currency];
  [v4 setObjectOrNull:v30 forKey:@"l"];

  v31 = [v3 countryCode];
  [v4 setObjectOrNull:v31 forKey:@"m"];

  v32 = [v3 associatedPassURL];
  v33 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v33 forKey:@"n"];

  v34 = [v3 associatedPassSerialNumber];
  [v4 setObjectOrNull:v34 forKey:@"o"];

  v35 = [v3 associatedPassTypeIdentifier];
  [v4 setObjectOrNull:v35 forKey:@"p"];

  v36 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 cardNetwork]);
  [v4 setObjectOrNull:v36 forKey:@"q"];

  v37 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 paymentType]);
  [v4 setObjectOrNull:v37 forKey:@"t"];

  v38 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 financingPlanFetchLimit]);
  [v4 setObjectOrNull:v38 forKey:@"u"];

  v39 = [v3 availableLanguages];
  v40 = [v39 componentsJoinedByString:@","];
  [v4 setObjectOrNull:v40 forKey:@"r"];

  id v41 = [v3 requiresGenericMessaging];
  [v4 setBool:v41 forKey:@"s"];
  return v4;
}

@end