@interface PayLaterAccountProductDetails
+ (id)_commonDictionaryForProductDetails:(id)a3;
+ (id)_predicateForProductPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterAccountProductDetails;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterProductDetails:(id)a3 forPayLaterAccountProductPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterProductDetailsForProductPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterProductDetailsForPayLaterProductPID:(int64_t)a3 inDatabase:(id)a4;
- (PayLaterAccountProductDetails)initWithAccountProductDetails:(id)a3 forPayLaterAccountProductPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_amountPaid;
- (id)_currentBalance;
- (id)_maximumSinglePurchaseAmount;
- (id)_minimumSinglePurchaseAmount;
- (id)_totalFinanced;
- (id)productDetails;
- (void)updateWitProductDetails:(id)a3;
@end

@implementation PayLaterAccountProductDetails

+ (id)databaseTable
{
  return @"lucuma";
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

- (PayLaterAccountProductDetails)initWithAccountProductDetails:(id)a3 forPayLaterAccountProductPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _commonDictionaryForProductDetails:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  v13 = v12;

  return v13;
}

+ (id)insertOrUpdatePayLaterProductDetails:(id)a3 forPayLaterAccountProductPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v10 = [a1 _predicateForProductPID:a4];
    id v11 = [a1 anyInDatabase:v9 predicate:v10];

    if (v11) {
      [v11 updateWitProductDetails:v8];
    }
    else {
      id v11 = [objc_alloc((Class)objc_opt_class()) initWithAccountProductDetails:v8 forPayLaterAccountProductPID:a4 inDatabase:v9];
    }
  }
  else
  {
    [a1 deletePayLaterProductDetailsForPayLaterProductPID:a4 inDatabase:v9];
    id v11 = 0;
  }

  return v11;
}

+ (void)deletePayLaterProductDetailsForPayLaterProductPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForProductPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

+ (id)payLaterProductDetailsForProductPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForProductPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 productDetails];

  return v9;
}

- (void)updateWitProductDetails:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _commonDictionaryForProductDetails:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)_predicateForProductPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForPayLaterAccountProductDetails
{
  CFStringRef v4 = @"d";
  id v5 = &stru_100740C30;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

- (id)productDetails
{
  id v3 = objc_alloc_init((Class)PKPayLaterAccountProductDetails);
  CFStringRef v4 = [(id)objc_opt_class() _propertySettersForPayLaterAccountProductDetails];
  id v5 = [v4 allKeys];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10021837C;
  v16[3] = &unk_10072DDD8;
  v16[4] = self;
  id v17 = v4;
  id v6 = v3;
  id v18 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v16];

  id v8 = [(PayLaterAccountProductDetails *)self _minimumSinglePurchaseAmount];
  [v6 setMinimumSinglePurchaseAmount:v8];

  id v9 = [(PayLaterAccountProductDetails *)self _maximumSinglePurchaseAmount];
  [v6 setMaximumSinglePurchaseAmount:v9];

  v10 = [(PayLaterAccountProductDetails *)self _currentBalance];
  [v6 setCurrentBalance:v10];

  id v11 = [(PayLaterAccountProductDetails *)self _totalFinanced];
  [v6 setTotalFinanced:v11];

  v12 = [(PayLaterAccountProductDetails *)self _amountPaid];
  [v6 setAmountPaid:v12];

  v13 = v18;
  id v14 = v6;

  return v14;
}

- (id)_minimumSinglePurchaseAmount
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"f"];
  CFStringRef v4 = PKCurrencyStorageNumberToCurrencyDecimal();

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
    id v8 = 0;
  }
  else
  {
    id v8 = PKCurrencyAmountMake();
  }

  return v8;
}

- (id)_maximumSinglePurchaseAmount
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"r"];
  CFStringRef v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"s"];
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

- (id)_currentBalance
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"l"];
  CFStringRef v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"m"];
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

- (id)_totalFinanced
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"n"];
  CFStringRef v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"o"];
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

- (id)_amountPaid
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"p"];
  CFStringRef v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"q"];
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

+ (id)_commonDictionaryForProductDetails:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = [v3 productTimeZone];
  id v6 = [v5 name];
  [v4 setObjectOrNull:v6 forKey:@"d"];

  BOOL v7 = [v3 minimumSinglePurchaseAmount];
  id v8 = [v7 amount];
  id v9 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v9 forKey:@"f"];

  v10 = [v3 minimumSinglePurchaseAmount];
  id v11 = [v10 currency];
  [v4 setObjectOrNull:v11 forKey:@"g"];

  v12 = [v3 maximumSinglePurchaseAmount];
  v13 = [v12 amount];
  id v14 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v14 forKey:@"r"];

  v15 = [v3 maximumSinglePurchaseAmount];
  v16 = [v15 currency];
  [v4 setObjectOrNull:v16 forKey:@"s"];

  id v17 = [v3 currentBalance];
  id v18 = [v17 amount];
  v19 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v19 forKey:@"l"];

  v20 = [v3 currentBalance];
  v21 = [v20 currency];
  [v4 setObjectOrNull:v21 forKey:@"m"];

  v22 = [v3 totalFinanced];
  v23 = [v22 amount];
  v24 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v24 forKey:@"n"];

  v25 = [v3 totalFinanced];
  v26 = [v25 currency];
  [v4 setObjectOrNull:v26 forKey:@"o"];

  v27 = [v3 amountPaid];
  v28 = [v27 amount];
  v29 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v29 forKey:@"p"];

  v30 = [v3 amountPaid];

  v31 = [v30 currency];
  [v4 setObjectOrNull:v31 forKey:@"q"];

  return v4;
}

@end