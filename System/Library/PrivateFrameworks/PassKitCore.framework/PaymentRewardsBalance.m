@interface PaymentRewardsBalance
+ (id)_monetaryValueUsingProperties:(id)a3 values:(const void *)a4;
+ (id)_predicateForBalanceIdentifier:(id)a3;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_predicateForPaymentPass:(id)a3;
+ (id)_propertySetters;
+ (id)databaseTable;
+ (id)insertOrUpdateRewardsBalances:(id)a3 withPass:(id)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateRewardsBalances:(id)a3 withPassUniqueIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)rewardsBalancesForPass:(id)a3 inDatabase:(id)a4;
+ (id)rewardsBalancesForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)rewardsBalancesWithIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteRewardsBalanceForPass:(id)a3 inDatabase:(id)a4;
+ (void)deleteRewardsBalanceForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4;
- (PaymentRewardsBalance)initWithPaymentRewardsBalance:(id)a3 paymentPass:(id)a4 orderIndex:(unint64_t)a5 inDatabase:(id)a6;
- (id)paymentRewardsBalance;
@end

@implementation PaymentRewardsBalance

+ (id)databaseTable
{
  return @"coffeebeans";
}

+ (id)insertOrUpdateRewardsBalances:(id)a3 withPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [a1 deleteRewardsBalanceForPass:v9 inDatabase:v10];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1004542F0;
  v17[3] = &unk_1007361E8;
  id v21 = objc_alloc_init((Class)NSMutableArray);
  id v22 = a1;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v11 = v21;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  sub_10000817C((uint64_t)v12, v17);
  id v15 = [v11 copy];

  return v15;
}

+ (id)insertOrUpdateRewardsBalances:(id)a3 withPassUniqueIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[Pass anyInDatabase:v9 withUniqueID:a4];
  if (v10)
  {
    id v11 = [a1 insertOrUpdateRewardsBalances:v8 withPass:v10 inDatabase:v9];
  }
  else
  {
    id v11 = &__NSArray0__struct;
  }

  return v11;
}

+ (id)rewardsBalancesWithIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForBalanceIdentifier:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 paymentRewardsBalance];

  return v9;
}

+ (id)rewardsBalancesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPaymentPass:a3];
  CFStringRef v26 = @"order_index";
  id v8 = +[NSArray arrayWithObjects:&v26 count:1];
  CFStringRef v25 = @"ASC";
  id v9 = +[NSArray arrayWithObjects:&v25 count:1];
  id v10 = [a1 queryWithDatabase:v6 predicate:v7 orderingProperties:v8 orderingDirections:v9];

  id v11 = [a1 _propertySetters];
  id v12 = objc_alloc_init((Class)NSMutableArray);
  id v13 = [v11 allKeys];
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  id v20 = sub_100454748;
  id v21 = &unk_10072EAD8;
  id v23 = v12;
  id v24 = a1;
  id v22 = v11;
  id v14 = v12;
  id v15 = v11;
  [v10 enumeratePersistentIDsAndProperties:v13 usingBlock:&v18];

  id v16 = objc_msgSend(v14, "copy", v18, v19, v20, v21);
  return v16;
}

+ (id)_monetaryValueUsingProperties:(id)a3 values:(const void *)a4
{
  id v5 = a3;
  id v6 = +[NSNull null];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    id v10 = 0;
    uint64_t v11 = 0;
    id v12 = 0;
    uint64_t v13 = *(void *)v26;
    id v23 = a4;
LABEL_3:
    uint64_t v14 = 0;
    uint64_t v24 = v11;
    id v15 = &a4[v11];
    while (1)
    {
      if (*(void *)v26 != v13) {
        objc_enumerationMutation(v7);
      }
      id v16 = *(void **)(*((void *)&v25 + 1) + 8 * v14);
      if (objc_msgSend(v16, "isEqualToString:", @"d", v23))
      {
        v17 = (void *)v15[v14];
        if (v17 == v6) {
          v17 = 0;
        }
        id v18 = v12;
        id v12 = v17;
      }
      else
      {
        if (![v16 isEqualToString:@"e"]) {
          goto LABEL_15;
        }
        v17 = (void *)v15[v14];
        if (v17 == v6) {
          v17 = 0;
        }
        id v18 = v10;
        id v10 = v17;
      }
      id v19 = v17;

LABEL_15:
      if (v12 && v10)
      {

        id v20 = PKCurrencyStorageNumberToCurrencyDecimal();
        id v21 = PKCurrencyAmountMake();
        goto LABEL_23;
      }
      if (v9 == (id)++v14)
      {
        id v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
        a4 = v23;
        uint64_t v11 = v24 + v14;
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_22;
      }
    }
  }
  id v12 = 0;
  id v10 = 0;
LABEL_22:
  id v21 = 0;
  id v20 = v7;
LABEL_23:

  return v21;
}

+ (id)rewardsBalancesForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = +[Pass anyInDatabase:v6 withUniqueID:a3];
  if (v7)
  {
    id v8 = [a1 rewardsBalancesForPass:v7 inDatabase:v6];
  }
  else
  {
    id v8 = &__NSArray0__struct;
  }

  return v8;
}

+ (void)deleteRewardsBalanceForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPaymentPass:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteRewardsBalanceForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v5 = +[Pass anyInDatabase:withUniqueID:](Pass, "anyInDatabase:withUniqueID:");
  if (v5) {
    [a1 deleteRewardsBalanceForPass:v5 inDatabase:v6];
  }
}

- (id)paymentRewardsBalance
{
  id v3 = objc_alloc_init((Class)PKPaymentRewardsBalance);
  v4 = [(id)objc_opt_class() _propertySetters];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100454C8C;
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

+ (id)_predicateForBalanceIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_predicateForPaymentPass:(id)a3
{
  id v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:a3];
}

+ (id)_propertySetters
{
  v4[0] = @"a";
  v4[1] = @"b";
  v5[0] = &stru_1007525E8;
  v5[1] = &stru_100752608;
  v4[2] = @"c";
  v4[3] = @"d";
  v5[2] = &stru_100752628;
  v5[3] = &stru_100752648;
  v4[4] = @"e";
  v4[5] = @"f";
  v5[4] = &stru_100752668;
  v5[5] = &stru_100752688;
  v4[6] = @"g";
  v4[7] = @"h";
  v5[6] = &stru_1007526A8;
  v5[7] = &stru_1007526C8;
  v4[8] = @"i";
  v4[9] = @"j";
  v5[8] = &stru_1007526E8;
  v5[9] = &stru_100752708;
  v4[10] = @"k";
  v5[10] = &stru_100752728;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:11];
  return v2;
}

- (PaymentRewardsBalance)initWithPaymentRewardsBalance:(id)a3 paymentPass:(id)a4 orderIndex:(unint64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  id v14 = [v11 persistentID];

  id v15 = +[NSNumber numberWithLongLong:v14];
  [v13 setObjectOrNull:v15 forKey:@"pass_pid"];

  id v16 = [v12 identifier];
  [v13 setObjectOrNull:v16 forKey:@"a"];

  objc_msgSend(v13, "setInteger:forKey:", objc_msgSend(v12, "type"), @"b");
  v17 = [v12 value];
  id v18 = PKCurrencyDecimalToStorageNumber();
  [v13 setObjectOrNull:v18 forKey:@"c"];

  id v19 = [v12 monetaryValue];
  id v20 = [v19 amount];
  id v21 = PKCurrencyDecimalToStorageNumber();
  [v13 setObjectOrNull:v21 forKey:@"d"];

  id v22 = [v19 currency];
  [v13 setObjectOrNull:v22 forKey:@"e"];

  id v23 = [v12 conversionRate];
  uint64_t v24 = PKCurrencyDecimalToStorageNumber();
  [v13 setObjectOrNull:v24 forKey:@"f"];

  objc_msgSend(v13, "setInteger:forKey:", objc_msgSend(v12, "roundingStrategy"), @"g");
  objc_msgSend(v13, "setInteger:forKey:", objc_msgSend(v12, "eligibility"), @"h");
  long long v25 = [v12 programName];
  [v13 setObjectOrNull:v25 forKey:@"i"];

  long long v26 = [v12 programURL];
  long long v27 = (void *)_SQLValueForURL();
  [v13 setObjectOrNull:v27 forKey:@"j"];

  long long v28 = [v12 lastFetchedAt];

  v29 = (void *)_SQLValueForDate();
  [v13 setObjectOrNull:v29 forKey:@"k"];

  [v13 setInteger:a5 forKey:@"order_index"];
  v32.receiver = self;
  v32.super_class = (Class)PaymentRewardsBalance;
  v30 = [(SQLiteEntity *)&v32 initWithPropertyValues:v13 inDatabase:v10];

  return v30;
}

@end