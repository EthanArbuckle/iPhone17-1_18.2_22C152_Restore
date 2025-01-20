@interface PaymentRewardsRedemptionDetails
+ (id)_predicateForPaymentRewardsRedemptionPID:(int64_t)a3;
+ (id)_propertySettersForPaymentRewardsRedemptionDetails:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePaymentRewardsRedemptionDetails:(id)a3 forPaymentRewardsRedemptionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)paymentRewardsRedemptionDetailsForPKPaymentRewardsRedemptionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePaymentRewardsRedemptionDetailsForPKPaymentRewardsRedemptionPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)_intendedDetails;
- (id)_originalTransactionDetails;
- (id)_redeemedDetails;
- (id)paymentRewardsRedemptionDetails;
@end

@implementation PaymentRewardsRedemptionDetails

+ (id)databaseTable
{
  return @"granola_bar";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"rp";
  }
  else {
    return 0;
  }
}

+ (id)insertOrUpdatePaymentRewardsRedemptionDetails:(id)a3 forPaymentRewardsRedemptionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePaymentRewardsRedemptionDetailsForPKPaymentRewardsRedemptionPID:a4 inDatabase:v9];
  if (v8)
  {
    v10 = [(id)objc_opt_class() _propertySettersForPaymentRewardsRedemptionDetails:v8];
    v11 = +[NSNumber numberWithLongLong:a4];
    [v10 setObjectOrNull:v11 forKey:@"rp"];

    v12 = [(SQLiteEntity *)[PaymentRewardsRedemptionDetails alloc] initWithPropertyValues:v10 inDatabase:v9];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)paymentRewardsRedemptionDetailsForPKPaymentRewardsRedemptionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPaymentRewardsRedemptionPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 paymentRewardsRedemptionDetails];

  return v9;
}

+ (void)deletePaymentRewardsRedemptionDetailsForPKPaymentRewardsRedemptionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPaymentRewardsRedemptionPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)PaymentRewardsRedemptionDetails;
  return [(SQLiteEntity *)&v3 deleteFromDatabase];
}

- (id)paymentRewardsRedemptionDetails
{
  id v3 = objc_alloc_init((Class)PKPaymentRewardsRedemptionDetails);
  v4 = [(PaymentRewardsRedemptionDetails *)self _intendedDetails];
  [v3 setIntended:v4];

  v5 = [(PaymentRewardsRedemptionDetails *)self _redeemedDetails];
  [v3 setRedeemed:v5];

  id v6 = [(PaymentRewardsRedemptionDetails *)self _originalTransactionDetails];
  [v3 setOriginalTransaction:v6];

  return v3;
}

- (id)_intendedDetails
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"a"];
  [v3 integerValue];
  v4 = PKCurrencyStorageIntegerToCurrencyDecimal();

  v5 = [(SQLiteEntity *)self valueForProperty:@"b"];
  id v6 = PKCurrencyStorageNumberToCurrencyDecimal();

  v7 = [(SQLiteEntity *)self valueForProperty:@"c"];
  id v8 = [(SQLiteEntity *)self valueForProperty:@"it"];
  id v9 = [v8 integerValue];

  id v10 = 0;
  if (v6 && v7)
  {
    v11 = PKCurrencyAmountMake();
    id v10 = [objc_alloc((Class)PKPaymentRewardsRedemptionUnit) initWithType:v9 monetaryValue:v11 value:v4];
  }
  return v10;
}

- (id)_redeemedDetails
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"d"];
  [v3 integerValue];
  v4 = PKCurrencyStorageIntegerToCurrencyDecimal();

  v5 = [(SQLiteEntity *)self valueForProperty:@"e"];
  id v6 = PKCurrencyStorageNumberToCurrencyDecimal();

  v7 = [(SQLiteEntity *)self valueForProperty:@"f"];
  id v8 = [(SQLiteEntity *)self valueForProperty:@"rt"];
  id v9 = [v8 integerValue];

  id v10 = 0;
  if (v6 && v7)
  {
    v11 = PKCurrencyAmountMake();
    id v10 = [objc_alloc((Class)PKPaymentRewardsRedemptionUnit) initWithType:v9 monetaryValue:v11 value:v4];
  }
  return v10;
}

- (id)_originalTransactionDetails
{
  id v3 = [(SQLiteEntity *)self valueForProperty:@"g"];
  v4 = [(SQLiteEntity *)self valueForProperty:@"h"];
  v5 = (void *)_DateForSQLValue();

  id v6 = [(SQLiteEntity *)self valueForProperty:@"i"];
  v7 = [(SQLiteEntity *)self valueForProperty:@"j"];
  id v8 = PKCurrencyStorageNumberToCurrencyDecimal();

  id v9 = [(SQLiteEntity *)self valueForProperty:@"k"];
  id v10 = [(SQLiteEntity *)self valueForProperty:@"m"];
  uint64_t v11 = [(SQLiteEntity *)self valueForProperty:@"n"];
  v12 = (void *)v11;
  if (v3 || v6 || v11)
  {
    id v13 = objc_alloc_init((Class)PKPaymentRewardsRedemptionTransactionDetails);
    [v13 setIdentifier:v3];
    [v13 setTimestamp:v5];
    [v13 setDescriptionText:v6];
    if (v8 && v9)
    {
      v14 = PKCurrencyAmountMake();
      [v13 setMonetaryValue:v14];
    }
    [v13 setMerchantCategoryCode:v10];
    [v13 setMerchantRawName:v12];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)_predicateForPaymentRewardsRedemptionPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"rp" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForPaymentRewardsRedemptionDetails:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 intended];
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v5, "type"), @"it");
  id v6 = [v5 value];
  v7 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v7 forKey:@"a"];

  id v8 = [v5 monetaryValue];
  id v9 = [v8 amount];
  id v10 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v10 forKey:@"b"];

  uint64_t v11 = [v8 currency];
  [v4 setObjectOrNull:v11 forKey:@"c"];

  v12 = [v3 redeemed];
  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v12, "type"), @"rt");
  id v13 = [v12 value];
  v14 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v14 forKey:@"d"];

  v15 = [v12 monetaryValue];
  v16 = [v15 amount];
  v17 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v17 forKey:@"e"];

  v18 = [v15 currency];
  [v4 setObjectOrNull:v18 forKey:@"f"];

  v19 = [v3 originalTransaction];

  v20 = [v19 identifier];
  [v4 setObjectOrNull:v20 forKey:@"g"];

  v21 = [v19 timestamp];
  v22 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v22 forKey:@"h"];

  v23 = [v19 descriptionText];
  [v4 setObjectOrNull:v23 forKey:@"i"];

  v24 = [v19 monetaryValue];
  v25 = [v24 amount];
  v26 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v26 forKey:@"j"];

  v27 = [v24 currency];
  [v4 setObjectOrNull:v27 forKey:@"k"];

  v28 = [v19 merchantCategoryCode];
  [v4 setObjectOrNull:v28 forKey:@"m"];

  v29 = [v19 merchantRawName];
  [v4 setObjectOrNull:v29 forKey:@"n"];

  return v4;
}

@end