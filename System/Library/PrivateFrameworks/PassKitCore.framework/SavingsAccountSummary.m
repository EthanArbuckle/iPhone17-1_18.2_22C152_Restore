@interface SavingsAccountSummary
+ (id)_commonDictionaryForSavingsAccountSummary:(id)a3;
+ (id)_predicateForSavingsAccountDetailsPID:(int64_t)a3;
+ (id)_propertySettersForSavingsAccountSummary;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertSavingsAccountSummary:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)savingsAccountSummaryForSavingsAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteSavingsAccountSummaryForSavingsAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateSavingsAccountSummary:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (SavingsAccountSummary)initWithSavingsAccountSummary:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (id)savingsAccountSummary;
- (void)updateWithSavingsAccountSummary:(id)a3;
@end

@implementation SavingsAccountSummary

+ (id)databaseTable
{
  return @"cranberry";
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

- (SavingsAccountSummary)initWithSavingsAccountSummary:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _commonDictionaryForSavingsAccountSummary:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  v13 = v12;

  return v13;
}

+ (id)insertSavingsAccountSummary:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithSavingsAccountSummary:v9 forSavingsAccountDetailsPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteSavingsAccountSummaryForSavingsAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForSavingsAccountDetailsPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

+ (id)savingsAccountSummaryForSavingsAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForSavingsAccountDetailsPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 savingsAccountSummary];

  return v9;
}

+ (void)updateSavingsAccountSummary:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [a1 _predicateForSavingsAccountDetailsPID:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  if (v10) {
    [v10 updateWithSavingsAccountSummary:v12];
  }
  else {
    id v11 = +[SavingsAccountSummary insertSavingsAccountSummary:v12 forSavingsAccountDetailsPID:a4 inDatabase:v8];
  }
}

- (void)updateWithSavingsAccountSummary:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _commonDictionaryForSavingsAccountSummary:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)_predicateForSavingsAccountDetailsPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForSavingsAccountSummary
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_10074E4F8;
  v5[1] = &stru_10074E518;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_10074E538;
  v5[3] = &stru_10074E558;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_10074E578;
  v5[5] = &stru_10074E598;
  v4[6] = @"i";
  v4[7] = @"j";
  v5[6] = &stru_10074E5B8;
  v5[7] = &stru_10074E5D8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:8];
  return v2;
}

- (id)savingsAccountSummary
{
  id v3 = objc_alloc_init((Class)PKSavingsAccountSummary);
  id v4 = [(id)objc_opt_class() _propertySettersForSavingsAccountSummary];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003BB93C;
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

+ (id)_commonDictionaryForSavingsAccountSummary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 currentBalance];
  id v6 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v6 forKey:@"b"];

  id v7 = [v3 availableBalance];
  id v8 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v8 forKey:@"c"];

  id v9 = [v3 pendingBalance];
  id v10 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v10 forKey:@"d"];

  id v11 = [v3 interestYTD];
  id v12 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v12 forKey:@"e"];

  id v13 = [v3 interestTotal];
  v14 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v14 forKey:@"f"];

  v15 = [v3 apy];
  v16 = +[NSNumber numberWithInteger:PKPercentageDecimalToStorageInteger()];
  [v4 setObjectOrNull:v16 forKey:@"g"];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "hasWithdrawalLimit"), @"i");
  id v17 = [v3 withdrawalsRemaining];

  [v4 setInteger:v17 forKey:@"j"];
  return v4;
}

@end