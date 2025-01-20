@interface PayLaterFinancingOption
+ (id)_commonDictionaryForFinancingOption:(id)a3;
+ (id)_predicateForEligibleSpendPID:(int64_t)a3;
+ (id)_predicateForEligibleSpendPID:(int64_t)a3 identifier:(id)a4;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_propertySettersForFinancingOption;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterFinancingOption:(id)a3 forEligibleSpendPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertOrUpdatePayLaterFinancingOptions:(id)a3 forEligibleSpendPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)payLaterPayLaterFinancingOptionsForEligibleSpendPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePayLaterPayLaterFinancingOptionsForEligibleSpendPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterFinancingOption)initWithPayLaterFinancingOption:(id)a3 forEligibleSpendPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_installmentAmount;
- (id)_installmentFees;
- (id)_totalAmount;
- (id)_totalFees;
- (id)_totalInterest;
- (id)_totalPrincipal;
- (void)updateWithFinancingOption:(id)a3;
@end

@implementation PayLaterFinancingOption

+ (id)databaseTable
{
  return @"wasabi";
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

- (PayLaterFinancingOption)initWithPayLaterFinancingOption:(id)a3 forEligibleSpendPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _commonDictionaryForFinancingOption:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  v13 = v12;

  return v13;
}

+ (id)insertOrUpdatePayLaterFinancingOption:(id)a3 forEligibleSpendPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [v9 identifier];
  v11 = [a1 _predicateForEligibleSpendPID:a4 identifier:v10];
  id v12 = [a1 anyInDatabase:v8 predicate:v11];

  if (v12) {
    [v12 updateWithFinancingOption:v9];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithPayLaterFinancingOption:v9 forEligibleSpendPID:a4 inDatabase:v8];
  }
  v13 = [v9 installments];

  id v14 = +[PayLaterFinancingOptionInstallment insertOrUpdatePayLaterFinancingOptionInstallments:forFinancingOptionPID:inDatabase:](PayLaterFinancingOptionInstallment, "insertOrUpdatePayLaterFinancingOptionInstallments:forFinancingOptionPID:inDatabase:", v13, [v12 persistentID], v8);
  return v12;
}

+ (id)insertOrUpdatePayLaterFinancingOptions:(id)a3 forEligibleSpendPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePayLaterPayLaterFinancingOptionsForEligibleSpendPID:a4 inDatabase:v9];
  id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = objc_msgSend(a1, "insertOrUpdatePayLaterFinancingOption:forEligibleSpendPID:inDatabase:", *(void *)(*((void *)&v19 + 1) + 8 * i), a4, v9, (void)v19);
        if (v16) {
          [v10 addObject:v16];
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  id v17 = [v10 copy];
  return v17;
}

+ (void)deletePayLaterPayLaterFinancingOptionsForEligibleSpendPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForEligibleSpendPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  v4 = [(SQLiteEntity *)self database];
  +[PayLaterFinancingOptionInstallment deletePayLaterFinancingOptionInstallmentsForFinancingOptionPID:v3 inDatabase:v4];

  v6.receiver = self;
  v6.super_class = (Class)PayLaterFinancingOption;
  return [(SQLiteEntity *)&v6 deleteFromDatabase];
}

+ (id)payLaterPayLaterFinancingOptionsForEligibleSpendPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForEligibleSpendPID:a3];
  CFStringRef v26 = @"h";
  id v8 = +[NSArray arrayWithObjects:&v26 count:1];
  id v9 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8];

  id v10 = [a1 _propertySettersForFinancingOption];
  id v11 = objc_alloc_init((Class)NSMutableArray);
  id v12 = [v10 allKeys];
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  long long v20 = sub_10044E9CC;
  long long v21 = &unk_10072DE00;
  id v22 = v6;
  id v23 = v10;
  id v24 = v11;
  id v25 = a1;
  id v13 = v11;
  id v14 = v10;
  id v15 = v6;
  [v9 enumeratePersistentIDsAndProperties:v12 usingBlock:&v18];

  id v16 = objc_msgSend(v13, "copy", v18, v19, v20, v21);
  return v16;
}

- (void)updateWithFinancingOption:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _commonDictionaryForFinancingOption:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)_predicateForEligibleSpendPID:(int64_t)a3 identifier:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForEligibleSpendPID:a3];
  id v8 = [a1 _predicateForIdentifier:v6];

  v12[0] = v7;
  v12[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v12 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  return v10;
}

+ (id)_predicateForEligibleSpendPID:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_propertySettersForFinancingOption
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100752140;
  v5[1] = &stru_100752160;
  v4[2] = @"e";
  v4[3] = @"g";
  v5[2] = &stru_100752180;
  v5[3] = &stru_1007521A0;
  v4[4] = @"h";
  v5[4] = &stru_1007521C0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

- (id)_totalAmount
{
  int64_t v3 = [(SQLiteEntity *)self valueForProperty:@"i"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"j"];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v9 = 0;
  }
  else
  {
    id v8 = PKCurrencyAmountMake();
    id v9 = [objc_alloc((Class)PKPayLaterFinancingAmount) initWithCurrencyAmount:v8];
  }
  return v9;
}

- (id)_totalInterest
{
  int64_t v3 = [(SQLiteEntity *)self valueForProperty:@"k"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

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
    id v9 = 0;
  }
  else
  {
    id v8 = PKCurrencyAmountMake();
    id v9 = [objc_alloc((Class)PKPayLaterFinancingAmount) initWithCurrencyAmount:v8];
  }
  return v9;
}

- (id)_totalPrincipal
{
  int64_t v3 = [(SQLiteEntity *)self valueForProperty:@"m"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"n"];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v9 = 0;
  }
  else
  {
    id v8 = PKCurrencyAmountMake();
    id v9 = [objc_alloc((Class)PKPayLaterFinancingAmount) initWithCurrencyAmount:v8];
  }
  return v9;
}

- (id)_totalFees
{
  int64_t v3 = [(SQLiteEntity *)self valueForProperty:@"o"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"p"];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v9 = 0;
  }
  else
  {
    id v8 = PKCurrencyAmountMake();
    id v9 = [objc_alloc((Class)PKPayLaterFinancingAmount) initWithCurrencyAmount:v8];
  }
  return v9;
}

- (id)_installmentAmount
{
  int64_t v3 = [(SQLiteEntity *)self valueForProperty:@"q"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"r"];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v9 = 0;
  }
  else
  {
    id v8 = PKCurrencyAmountMake();
    id v9 = [objc_alloc((Class)PKPayLaterFinancingAmount) initWithCurrencyAmount:v8];
  }
  return v9;
}

- (id)_installmentFees
{
  int64_t v3 = [(SQLiteEntity *)self valueForProperty:@"s"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"t"];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v9 = 0;
  }
  else
  {
    id v8 = PKCurrencyAmountMake();
    id v9 = [objc_alloc((Class)PKPayLaterFinancingAmount) initWithCurrencyAmount:v8];
  }
  return v9;
}

+ (id)_commonDictionaryForFinancingOption:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "productType"), @"c");
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "installmentCount"), @"e");
  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "hasAPR"), @"g");
  id v6 = [v3 apr];
  [v4 setInteger:PKPercentageDecimalToStorageInteger() forKey:@"h"];

  BOOL v7 = [v3 totalAmount];
  id v8 = [v7 currencyAmount];
  id v9 = [v8 amount];
  [v4 setInteger:PKPercentageDecimalToStorageInteger() forKey:@"i"];

  id v10 = [v3 totalAmount];
  id v11 = [v10 currencyAmount];
  id v12 = [v11 currency];
  [v4 setObjectOrNull:v12 forKey:@"j"];

  id v13 = [v3 totalInterest];
  id v14 = [v13 currencyAmount];
  id v15 = [v14 amount];
  [v4 setInteger:PKPercentageDecimalToStorageInteger() forKey:@"k"];

  id v16 = [v3 totalInterest];
  id v17 = [v16 currencyAmount];
  v18 = [v17 currency];
  [v4 setObjectOrNull:v18 forKey:@"l"];

  uint64_t v19 = [v3 totalPrincipal];
  long long v20 = [v19 currencyAmount];
  long long v21 = [v20 amount];
  [v4 setInteger:PKPercentageDecimalToStorageInteger() forKey:@"m"];

  id v22 = [v3 totalPrincipal];
  id v23 = [v22 currencyAmount];
  id v24 = [v23 currency];
  [v4 setObjectOrNull:v24 forKey:@"n"];

  id v25 = [v3 totalFees];
  CFStringRef v26 = [v25 currencyAmount];
  v27 = [v26 amount];
  [v4 setInteger:PKPercentageDecimalToStorageInteger() forKey:@"o"];

  v28 = [v3 totalFees];
  v29 = [v28 currencyAmount];
  v30 = [v29 currency];
  [v4 setObjectOrNull:v30 forKey:@"p"];

  v31 = [v3 installmentAmount];
  v32 = [v31 currencyAmount];
  v33 = [v32 amount];
  [v4 setInteger:PKPercentageDecimalToStorageInteger() forKey:@"q"];

  v34 = [v3 installmentAmount];
  v35 = [v34 currencyAmount];
  v36 = [v35 currency];
  [v4 setObjectOrNull:v36 forKey:@"r"];

  v37 = [v3 installmentFees];
  v38 = [v37 currencyAmount];
  v39 = [v38 amount];
  [v4 setInteger:PKPercentageDecimalToStorageInteger() forKey:@"s"];

  v40 = [v3 installmentFees];

  v41 = [v40 currencyAmount];
  v42 = [v41 currency];
  [v4 setObjectOrNull:v42 forKey:@"t"];

  return v4;
}

@end