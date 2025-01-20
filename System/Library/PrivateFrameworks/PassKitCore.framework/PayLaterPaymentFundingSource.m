@interface PayLaterPaymentFundingSource
+ (id)_paymentFundingSourcesWithPredicate:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForInstallmentPaymentPID:(int64_t)a3;
+ (id)_propertySettersForFundingSource;
+ (id)_propertyValuesForFundingSource:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)paymentFundingSourcesForPaymentPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteInstallmentPaymentFundingSourcesForInstallmentPaymentPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateInstallmentPaymentFundingSources:(id)a3 forInstallmentPaymentPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (PayLaterPaymentFundingSource)initWithFundingSource:(id)a3 forInstallmentPaymentPID:(int64_t)a4 inDatabase:(id)a5;
- (id)fundingSource;
- (id)refundAmount;
- (void)updateWithFundingSource:(id)a3;
@end

@implementation PayLaterPaymentFundingSource

+ (id)databaseTable
{
  return @"tamarillo";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"a";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"b";
  }
  return 0;
}

- (PayLaterPaymentFundingSource)initWithFundingSource:(id)a3 forInstallmentPaymentPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForFundingSource:v9];

  id v11 = [v10 mutableCopy];
  v12 = +[NSNumber numberWithLongLong:a4];
  [v11 setObjectOrNull:v12 forKey:@"a"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v13;
}

+ (void)insertOrUpdateInstallmentPaymentFundingSources:(id)a3 forInstallmentPaymentPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  +[PayLaterPaymentFundingSource deleteInstallmentPaymentFundingSourcesForInstallmentPaymentPID:a4 inDatabase:v9];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v14);
        id v16 = objc_alloc((Class)a1);
        id v17 = objc_msgSend(v16, "initWithFundingSource:forInstallmentPaymentPID:inDatabase:", v15, a4, v9, (void)v21);
        if (v17)
        {
          v18 = [v15 details];
          v19 = +[PayLaterFundingSourceDetails insertFundingSourceDetails:v18 inDatabase:v9];

          v20 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v19 persistentID]);
          [v17 setValue:v20 forProperty:@"b"];
        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }
}

- (void)updateWithFundingSource:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForFundingSource:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)paymentFundingSourcesForPaymentPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForInstallmentPaymentPID:a3];
  id v8 = [a1 _paymentFundingSourcesWithPredicate:v7 inDatabase:v6];

  return v8;
}

+ (void)deleteInstallmentPaymentFundingSourcesForInstallmentPaymentPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForInstallmentPaymentPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = [(SQLiteEntity *)self database];
  id v4 = [(SQLiteEntity *)self valueForProperty:@"b"];
  id v5 = +[PayLaterFundingSourceDetails anyInDatabase:v3 forPID:v4];
  [v5 deleteFromDatabase];

  v7.receiver = self;
  v7.super_class = (Class)PayLaterPaymentFundingSource;
  return [(SQLiteEntity *)&v7 deleteFromDatabase];
}

+ (id)_paymentFundingSourcesWithPredicate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a1 queryWithDatabase:v6 predicate:a3];
  id v8 = [a1 _propertySettersForFundingSource];
  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v10 = [v8 allKeys];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_100412528;
  v18 = &unk_10072ED00;
  id v19 = v6;
  id v11 = v9;
  id v20 = v11;
  id v12 = v6;
  [v7 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  if (objc_msgSend(v11, "count", v15, v16, v17, v18)) {
    id v13 = [v11 copy];
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (id)fundingSource
{
  id v3 = objc_alloc_init((Class)PKPayLaterPaymentFundingSource);
  id v4 = [(id)objc_opt_class() _propertySettersForFundingSource];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10041269C;
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

- (id)refundAmount
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"e"];
  id v4 = PKCurrencyStorageNumberToCurrencyDecimal();

  uint64_t v5 = [(SQLiteEntity *)self valueForProperty:@"ec"];
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

+ (id)_predicateForInstallmentPaymentPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertyValuesForFundingSource:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"c"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "type"), @"d");
  id v6 = [v3 refundAmount];
  BOOL v7 = [v6 amount];
  id v8 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v8 forKey:@"e"];

  id v9 = [v3 refundAmount];

  id v10 = [v9 currency];
  [v4 setObjectOrNull:v10 forKey:@"ec"];

  id v11 = [v4 copy];
  return v11;
}

+ (id)_propertySettersForFundingSource
{
  v4[0] = @"c";
  v4[1] = @"d";
  v5[0] = &stru_10074FC88;
  v5[1] = &stru_10074FCA8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

@end