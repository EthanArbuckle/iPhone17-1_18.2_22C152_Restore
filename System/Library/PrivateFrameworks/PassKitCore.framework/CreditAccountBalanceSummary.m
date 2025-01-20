@interface CreditAccountBalanceSummary
+ (id)_predicateForCreditAccountSummaryPID:(int64_t)a3;
+ (id)_propertySettersForCreditAccountBalanceSummary;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)creditAccountBalanceSummaryForCreditAccountSummaryPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertAccountBalanceSummary:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteCreditAccountBalanceSummaryForCreditAccountSummaryPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateCreditAccountBalanceSummary:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5;
- (CreditAccountBalanceSummary)initWithCreditAccountBalanceSummary:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5;
- (id)creditAccountBalanceSummary;
- (void)updateWithCreditAccountBalanceSummary:(id)a3;
@end

@implementation CreditAccountBalanceSummary

+ (id)databaseTable
{
  return @"bananas";
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

- (CreditAccountBalanceSummary)initWithCreditAccountBalanceSummary:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSMutableDictionary dictionary];
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [v9 openingDate];
  v13 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v13 forKey:@"b"];

  v14 = [v9 closingDate];
  v15 = (void *)_SQLValueForDate();
  [v10 setObjectOrNull:v15 forKey:@"c"];

  v16 = [v9 purchases];
  v17 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v17 forKey:@"d"];

  v18 = [v9 pendingPurchases];
  v19 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v19 forKey:@"e"];

  v20 = [v9 balanceTransfers];
  v21 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v21 forKey:@"f"];

  v22 = [v9 interestCharged];
  v23 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v23 forKey:@"g"];

  v24 = [v9 feesCharged];
  v25 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v25 forKey:@"h"];

  v26 = [v9 paymentsAndCredits];
  v27 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v27 forKey:@"i"];

  v28 = [v9 rewardsEarned];
  v29 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v29 forKey:@"j"];

  v30 = [v9 rewardsRedeemed];
  v31 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v31 forKey:@"k"];

  v32 = [v9 payments];
  v33 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v33 forKey:@"l"];

  v34 = [v9 credits];

  v35 = PKCurrencyDecimalToStorageNumber();
  [v10 setObjectOrNull:v35 forKey:@"m"];

  v36 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v36;
}

+ (id)insertAccountBalanceSummary:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithCreditAccountBalanceSummary:v9 forCreditAccountSummaryPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteCreditAccountBalanceSummaryForCreditAccountSummaryPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForCreditAccountSummaryPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)creditAccountBalanceSummaryForCreditAccountSummaryPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForCreditAccountSummaryPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 creditAccountBalanceSummary];

  return v9;
}

+ (void)updateCreditAccountBalanceSummary:(id)a3 forCreditAccountSummaryPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [a1 _predicateForCreditAccountSummaryPID:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  if (v10) {
    [v10 updateWithCreditAccountBalanceSummary:v12];
  }
  else {
    id v11 = +[CreditAccountBalanceSummary insertAccountBalanceSummary:v12 forCreditAccountSummaryPID:a4 inDatabase:v8];
  }
}

- (void)updateWithCreditAccountBalanceSummary:(id)a3
{
  id v4 = a3;
  id v29 = +[NSMutableDictionary dictionary];
  v5 = [v4 openingDate];
  id v6 = (void *)_SQLValueForDate();
  [v29 setObjectOrNull:v6 forKey:@"b"];

  v7 = [v4 closingDate];
  id v8 = (void *)_SQLValueForDate();
  [v29 setObjectOrNull:v8 forKey:@"c"];

  id v9 = [v4 purchases];
  id v10 = PKCurrencyDecimalToStorageNumber();
  [v29 setObjectOrNull:v10 forKey:@"d"];

  id v11 = [v4 pendingPurchases];
  id v12 = PKCurrencyDecimalToStorageNumber();
  [v29 setObjectOrNull:v12 forKey:@"e"];

  v13 = [v4 balanceTransfers];
  v14 = PKCurrencyDecimalToStorageNumber();
  [v29 setObjectOrNull:v14 forKey:@"f"];

  v15 = [v4 interestCharged];
  v16 = PKCurrencyDecimalToStorageNumber();
  [v29 setObjectOrNull:v16 forKey:@"g"];

  v17 = [v4 feesCharged];
  v18 = PKCurrencyDecimalToStorageNumber();
  [v29 setObjectOrNull:v18 forKey:@"h"];

  v19 = [v4 paymentsAndCredits];
  v20 = PKCurrencyDecimalToStorageNumber();
  [v29 setObjectOrNull:v20 forKey:@"i"];

  v21 = [v4 rewardsEarned];
  v22 = PKCurrencyDecimalToStorageNumber();
  [v29 setObjectOrNull:v22 forKey:@"j"];

  v23 = [v4 rewardsRedeemed];
  v24 = PKCurrencyDecimalToStorageNumber();
  [v29 setObjectOrNull:v24 forKey:@"k"];

  v25 = [v4 payments];
  v26 = PKCurrencyDecimalToStorageNumber();
  [v29 setObjectOrNull:v26 forKey:@"l"];

  v27 = [v4 credits];

  v28 = PKCurrencyDecimalToStorageNumber();
  [v29 setObjectOrNull:v28 forKey:@"m"];

  [(SQLiteEntity *)self setValuesWithDictionary:v29];
}

+ (id)_predicateForCreditAccountSummaryPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForCreditAccountBalanceSummary
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100750BC0;
  v5[1] = &stru_100750BE0;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_100750C00;
  v5[3] = &stru_100750C20;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_100750C40;
  v5[5] = &stru_100750C60;
  v4[6] = @"h";
  v4[7] = @"i";
  v5[6] = &stru_100750C80;
  v5[7] = &stru_100750CA0;
  v4[8] = @"l";
  v4[9] = @"m";
  v5[8] = &stru_100750CC0;
  v5[9] = &stru_100750CE0;
  v4[10] = @"l";
  v4[11] = @"m";
  v5[10] = &stru_100750D00;
  v5[11] = &stru_100750D20;
  v4[12] = @"j";
  v4[13] = @"k";
  v5[12] = &stru_100750D40;
  v5[13] = &stru_100750D60;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:14];
  return v2;
}

- (id)creditAccountBalanceSummary
{
  id v3 = objc_alloc_init((Class)PKCreditAccountBalanceSummary);
  id v4 = [(id)objc_opt_class() _propertySettersForCreditAccountBalanceSummary];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10042E528;
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