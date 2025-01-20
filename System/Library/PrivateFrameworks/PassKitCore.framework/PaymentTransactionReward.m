@interface PaymentTransactionReward
+ (id)_paymentTransactionRewardsInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_paymentTransactionRewardsWithQuery:(id)a3;
+ (id)_predicateExcludingPaymentTransactionRewardState:(unint64_t)a3;
+ (id)_predicateForAccountRewardsPID:(int64_t)a3;
+ (id)_predicateForCompletedRewards;
+ (id)_predicateForInProgressRewards;
+ (id)_predicateForInstallmentPlanPID:(id)a3;
+ (id)_predicateForPaymentTransaction:(id)a3;
+ (id)_predicateForPaymentTransactionIdentifier:(id)a3;
+ (id)_predicateForPaymentTransactionPID:(int64_t)a3;
+ (id)_predicateForPaymentTransactionPIDs:(id)a3;
+ (id)_predicateForPaymentTransactionRewardState:(unint64_t)a3;
+ (id)_predicateForRewardWithIdentifier:(id)a3;
+ (id)_propertySettersForPaymentTransactionRewardItem;
+ (id)_rewardsFromRewardsItems:(id)a3;
+ (id)_rewardsInProgressFromRewardsItems:(id)a3;
+ (id)_updateQueryGrouping:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)paymentTransactionRewardsInDatabase:(id)a3 forAccountRewardsPID:(int64_t)a4;
+ (id)paymentTransactionRewardsInDatabase:(id)a3 forPaymentTransaction:(id)a4;
+ (id)paymentTransactionRewardsInDatabase:(id)a3 forPaymentTransactionIdentifier:(id)a4;
+ (id)paymentTransactionRewardsInProgressInDatabase:(id)a3 forPaymentTransaction:(id)a4;
+ (id)paymentTransactionRewardsInProgressInDatabase:(id)a3 forPaymentTransactionIdentifier:(id)a4;
+ (id)rewardsInDatabase:(id)a3 forInstallmentPlanPID:(id)a4;
+ (void)_deleteCompletedRewardsForPaymentTransaction:(id)a3 inDatabase:(id)a4;
+ (void)_deleteEntitiesForPaymentTransaction:(id)a3 matchingPredicate:(id)a4 inDatabase:(id)a5;
+ (void)_deleteInProgressRewardsForPaymentTransaction:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)associateRewardsToPaymentTransactions:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForAccountRewardsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransaction:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updatePaymentTransactionRewards:(id)a3 forAccountRewardsPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)updatePaymentTransactionRewards:(id)a3 forPaymentTransaction:(id)a4 inDatabase:(id)a5;
+ (void)updatePaymentTransactionRewardsInProgress:(id)a3 forPaymentTransaction:(id)a4 inDatabase:(id)a5;
+ (void)updateRewards:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
- (PaymentTransactionReward)initWithPaymentTransactionRewardsItem:(id)a3 accountRewardsPID:(unint64_t)a4 inDatabase:(id)a5;
- (PaymentTransactionReward)initWithPaymentTransactionRewardsItem:(id)a3 paymentTransaction:(id)a4 inDatabase:(id)a5;
- (PaymentTransactionReward)initWithRewardsItem:(id)a3 installmentPlanPID:(id)a4 inDatabase:(id)a5;
- (void)updateWithPaymentTransactionRewardItem:(id)a3;
@end

@implementation PaymentTransactionReward

- (PaymentTransactionReward)initWithPaymentTransactionRewardsItem:(id)a3 accountRewardsPID:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSMutableDictionary dictionary];
  v11 = [v9 currencyAmount];
  v12 = [v11 amount];
  v13 = PKCurrencyDecimalToStorageNumber();

  v14 = [v9 eligibleValue];
  v15 = PKCurrencyDecimalToStorageNumber();

  v16 = [v9 identifier];
  [v10 setObjectOrNull:v16 forKey:@"a"];

  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "type"), @"c");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "state"), @"d");
  objc_msgSend(v10, "setInteger:forKey:", objc_msgSend(v9, "eligibleValueUnit"), @"h");
  [v10 setObjectOrNull:v15 forKey:@"g"];
  v17 = [v9 currencyAmount];
  v18 = [v17 currency];
  [v10 setObjectOrNull:v18 forKey:@"f"];

  [v10 setObjectOrNull:v13 forKey:@"e"];
  v19 = +[NSNumber numberWithLongLong:a4];
  [v10 setObject:v19 forKey:@"i"];

  v20 = [v9 promotionName];
  [v10 setObjectOrNull:v20 forKey:@"l"];

  v21 = [v9 promotionIdentifier];
  [v10 setObjectOrNull:v21 forKey:@"k"];

  v22 = [v9 programIdentifier];

  [v10 setObjectOrNull:v22 forKey:@"m"];
  v23 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];

  return v23;
}

- (PaymentTransactionReward)initWithPaymentTransactionRewardsItem:(id)a3 paymentTransaction:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[NSMutableDictionary dictionary];
  v12 = [v10 currencyAmount];
  v13 = [v12 amount];
  v14 = PKCurrencyDecimalToStorageNumber();

  v15 = [v10 eligibleValue];
  v16 = PKCurrencyDecimalToStorageNumber();

  v17 = [v10 identifier];
  [v11 setObjectOrNull:v17 forKey:@"a"];

  objc_msgSend(v11, "setInteger:forKey:", objc_msgSend(v10, "type"), @"c");
  objc_msgSend(v11, "setInteger:forKey:", objc_msgSend(v10, "state"), @"d");
  objc_msgSend(v11, "setInteger:forKey:", objc_msgSend(v10, "eligibleValueUnit"), @"h");
  [v11 setObjectOrNull:v16 forKey:@"g"];
  v18 = [v10 currencyAmount];
  v19 = [v18 currency];
  [v11 setObjectOrNull:v19 forKey:@"f"];

  [v11 setObjectOrNull:v14 forKey:@"e"];
  id v20 = [v9 persistentID];

  v21 = +[NSNumber numberWithLongLong:v20];
  [v11 setObject:v21 forKey:@"b"];

  v22 = [v10 promotionName];
  [v11 setObjectOrNull:v22 forKey:@"l"];

  v23 = [v10 promotionIdentifier];
  [v11 setObjectOrNull:v23 forKey:@"k"];

  v24 = [v10 programIdentifier];

  [v11 setObjectOrNull:v24 forKey:@"m"];
  v25 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];

  return v25;
}

- (PaymentTransactionReward)initWithRewardsItem:(id)a3 installmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  v12 = [v10 currencyAmount];
  v13 = [v12 amount];
  v14 = PKCurrencyDecimalToStorageNumber();

  v15 = [v10 eligibleValue];
  v16 = PKCurrencyDecimalToStorageNumber();

  v17 = [v10 identifier];
  [v11 setObjectOrNull:v17 forKey:@"a"];

  objc_msgSend(v11, "setInteger:forKey:", objc_msgSend(v10, "type"), @"c");
  objc_msgSend(v11, "setInteger:forKey:", objc_msgSend(v10, "state"), @"d");
  objc_msgSend(v11, "setInteger:forKey:", objc_msgSend(v10, "eligibleValueUnit"), @"h");
  [v11 setObjectOrNull:v16 forKey:@"g"];
  v18 = [v10 currencyAmount];
  v19 = [v18 currency];
  [v11 setObjectOrNull:v19 forKey:@"f"];

  [v11 setObjectOrNull:v14 forKey:@"e"];
  [v11 setObject:v9 forKey:@"j"];

  id v20 = [v10 promotionName];
  [v11 setObjectOrNull:v20 forKey:@"l"];

  v21 = [v10 promotionIdentifier];
  [v11 setObjectOrNull:v21 forKey:@"k"];

  v22 = [v10 programIdentifier];

  [v11 setObjectOrNull:v22 forKey:@"m"];
  v23 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];

  return v23;
}

+ (id)databaseTable
{
  return @"apples";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"b";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"i";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"j";
  }
  return 0;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  id v8 = v7;
  if (v7 == @"payment_transaction.identifier") {
    goto LABEL_4;
  }
  if (v7)
  {
    unsigned int v9 = [@"payment_transaction.identifier" isEqualToString:v7];

    if (v9)
    {
LABEL_4:
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v10 = v6;
      id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v24;
LABEL_6:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          if ([*(id *)(*((void *)&v23 + 1) + 8 * v14) containsString:@"JOIN payment_transaction ON payment_transaction.pid = apples.b"])goto LABEL_20; {
          if (v12 == (id)++v14)
          }
          {
            id v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
            if (v12) {
              goto LABEL_6;
            }
            break;
          }
        }
      }

      CFStringRef v15 = @"JOIN payment_transaction ON payment_transaction.pid = apples.b";
      v16 = v10;
      goto LABEL_16;
    }
    v17 = v8;
    if (v17 == @"avocados.identifier"
      || (v18 = v17,
          unsigned int v19 = [@"avocados.identifier" isEqualToString:v17],
          v18,
          v19))
    {
      CFStringRef v15 = @"JOIN avocados ON avocados.pid = apples.i";
      v16 = v6;
LABEL_16:
      [v16 addObject:v15];
      goto LABEL_21;
    }
    id v20 = v18;
    if (v20 == @"MAX(mirabelle.b) NOT NULL AS has_enhanced_merchant_program_identifier"
      || (v21 = v20,
          unsigned int v22 = [@"MAX(mirabelle.b) NOT NULL AS has_enhanced_merchant_program_identifier" isEqualToString:v20], v21, v22))
    {
      [v6 removeObject:@"JOIN payment_transaction ON payment_transaction.pid = apples.b"];
      +[NSString stringWithFormat:@"%@ %@ %@ %@", @"JOIN payment_transaction ON payment_transaction.pid = apples.b", @"JOIN pears ON pears.a = payment_transaction.account_identifier", @"LEFT JOIN quince ON quince.a = pears.pid", @"LEFT JOIN mirabelle ON mirabelle.a = quince.pid AND mirabelle.b = apples.m"];
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      [v6 addObject:v10];
LABEL_20:
    }
  }
LABEL_21:
}

- (void)updateWithPaymentTransactionRewardItem:(id)a3
{
  id v4 = a3;
  id v15 = +[NSMutableDictionary dictionary];
  id v5 = [v4 currencyAmount];
  id v6 = [v5 amount];
  v7 = PKCurrencyDecimalToStorageNumber();

  id v8 = [v4 eligibleValue];
  unsigned int v9 = PKCurrencyDecimalToStorageNumber();

  objc_msgSend(v15, "setInteger:forKey:", objc_msgSend(v4, "type"), @"c");
  objc_msgSend(v15, "setInteger:forKey:", objc_msgSend(v4, "state"), @"d");
  objc_msgSend(v15, "setInteger:forKey:", objc_msgSend(v4, "eligibleValueUnit"), @"h");
  [v15 setObjectOrNull:v9 forKey:@"g"];
  id v10 = [v4 currencyAmount];
  id v11 = [v10 currency];
  [v15 setObjectOrNull:v11 forKey:@"f"];

  [v15 setObjectOrNull:v7 forKey:@"e"];
  id v12 = [v4 promotionName];
  [v15 setObjectOrNull:v12 forKey:@"l"];

  uint64_t v13 = [v4 promotionIdentifier];
  [v15 setObjectOrNull:v13 forKey:@"k"];

  uint64_t v14 = [v4 programIdentifier];

  [v15 setObjectOrNull:v14 forKey:@"m"];
  [(SQLiteEntity *)self setValuesWithDictionary:v15];
}

+ (void)updatePaymentTransactionRewards:(id)a3 forPaymentTransaction:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [a1 _deleteCompletedRewardsForPaymentTransaction:v9 inDatabase:v10];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = objc_msgSend(v8, "rewardsItems", 0);
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

+ (void)updatePaymentTransactionRewardsInProgress:(id)a3 forPaymentTransaction:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [a1 _deleteInProgressRewardsForPaymentTransaction:v9 inDatabase:v10];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = objc_msgSend(v8, "rewardsItems", 0);
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

+ (void)updatePaymentTransactionRewards:(id)a3 forAccountRewardsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deleteEntitiesForAccountRewardsPID:a4 inDatabase:v9];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = objc_msgSend(v8, "rewardsItems", 0);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }

        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

+ (void)updateRewards:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [a1 deleteEntitiesForInstallmentPlanPID:v9 inDatabase:v10];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = objc_msgSend(v8, "rewardsItems", 0);
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      long long v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }

        long long v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

+ (void)deleteEntitiesForPaymentTransaction:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPaymentTransaction:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPaymentTransactionPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)_deleteCompletedRewardsForPaymentTransaction:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _predicateForCompletedRewards];
  [a1 _deleteEntitiesForPaymentTransaction:v7 matchingPredicate:v8 inDatabase:v6];
}

+ (void)_deleteInProgressRewardsForPaymentTransaction:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _predicateForInProgressRewards];
  [a1 _deleteEntitiesForPaymentTransaction:v7 matchingPredicate:v8 inDatabase:v6];
}

+ (void)_deleteEntitiesForPaymentTransaction:(id)a3 matchingPredicate:(id)a4 inDatabase:(id)a5
{
  v14[0] = a4;
  id v8 = a5;
  id v9 = a4;
  id v10 = [a1 _predicateForPaymentTransaction:a3];
  v14[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v14 count:2];
  id v12 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];

  id v13 = [a1 queryWithDatabase:v8 predicate:v12];

  [v13 deleteAllEntities];
}

+ (void)deleteEntitiesForAccountRewardsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountRewardsPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteEntitiesForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForInstallmentPlanPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)paymentTransactionRewardsInDatabase:(id)a3 forPaymentTransaction:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPaymentTransaction:a4];
  v14[0] = v7;
  id v8 = [a1 _predicateForCompletedRewards];
  v14[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v14 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  id v11 = [a1 _paymentTransactionRewardsInDatabase:v6 matchingPredicate:v10];

  id v12 = [a1 _rewardsFromRewardsItems:v11];

  return v12;
}

+ (id)paymentTransactionRewardsInDatabase:(id)a3 forPaymentTransactionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPaymentTransactionIdentifier:a4];
  v14[0] = v7;
  id v8 = [a1 _predicateForCompletedRewards];
  v14[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v14 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  id v11 = [a1 _paymentTransactionRewardsInDatabase:v6 matchingPredicate:v10];

  id v12 = [a1 _rewardsFromRewardsItems:v11];

  return v12;
}

+ (id)paymentTransactionRewardsInProgressInDatabase:(id)a3 forPaymentTransaction:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPaymentTransaction:a4];
  v14[0] = v7;
  id v8 = [a1 _predicateForInProgressRewards];
  v14[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v14 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  id v11 = [a1 _paymentTransactionRewardsInDatabase:v6 matchingPredicate:v10];

  id v12 = [a1 _rewardsInProgressFromRewardsItems:v11];

  return v12;
}

+ (id)paymentTransactionRewardsInProgressInDatabase:(id)a3 forPaymentTransactionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPaymentTransactionIdentifier:a4];
  v14[0] = v7;
  id v8 = [a1 _predicateForInProgressRewards];
  v14[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v14 count:2];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  id v11 = [a1 _paymentTransactionRewardsInDatabase:v6 matchingPredicate:v10];

  id v12 = [a1 _rewardsInProgressFromRewardsItems:v11];

  return v12;
}

+ (id)paymentTransactionRewardsInDatabase:(id)a3 forAccountRewardsPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForAccountRewardsPID:a4];
  id v8 = [a1 _paymentTransactionRewardsInDatabase:v6 matchingPredicate:v7];

  id v9 = [a1 _rewardsFromRewardsItems:v8];

  return v9;
}

+ (id)rewardsInDatabase:(id)a3 forInstallmentPlanPID:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForInstallmentPlanPID:a4];
  id v8 = [a1 _paymentTransactionRewardsInDatabase:v6 matchingPredicate:v7];

  id v9 = [a1 _rewardsFromRewardsItems:v8];

  return v9;
}

+ (void)associateRewardsToPaymentTransactions:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v43 = v6;
  id v8 = [v6 allKeys];
  id v9 = [a1 _predicateForPaymentTransactionPIDs:v8];
  v41 = v7;
  id v10 = +[SQLiteEntity queryWithDatabase:v7 predicate:v9];

  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  id v13 = [a1 _propertySettersForPaymentTransactionRewardItem];
  if (sub_10049F590(v10))
  {
    id v14 = [v13 mutableCopy];
    [v14 removeObjectForKey:@"MAX(mirabelle.b) NOT NULL AS has_enhanced_merchant_program_identifier"];
    id v15 = [v14 copy];

    id v13 = v15;
  }
  long long v16 = [v13 objectForKey:@"MAX(mirabelle.b) NOT NULL AS has_enhanced_merchant_program_identifier"];

  if (v16)
  {
    uint64_t v17 = [a1 _updateQueryGrouping:v10];

    id v10 = (void *)v17;
  }
  long long v18 = [v13 allKeys];
  long long v19 = [v18 arrayByAddingObject:@"b"];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_10049F5DC;
  v48[3] = &unk_10072DE00;
  id v52 = a1;
  id v39 = v13;
  id v49 = v39;
  id v20 = v12;
  id v50 = v20;
  id v21 = v11;
  id v51 = v21;
  v40 = v10;
  [v10 enumeratePersistentIDsAndProperties:v19 usingBlock:v48];

  unsigned int v22 = [v20 allKeys];
  long long v23 = +[NSSet setWithArray:v22];

  long long v24 = [v21 allKeys];
  long long v25 = +[NSSet setWithArray:v24];

  v38 = v23;
  [v23 setByAddingObjectsFromSet:v25];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v26 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v45;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v45 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        v31 = [v43 objectForKey:v30];
        id v32 = objc_alloc((Class)PKPaymentTransactionRewards);
        v33 = [v21 objectForKey:v30];
        id v34 = [v32 initWithRewardsItems:v33];
        [v31 setRewards:v34];

        id v35 = objc_alloc((Class)PKPaymentTransactionRewards);
        v36 = [v20 objectForKey:v30];
        id v37 = [v35 initWithRewardsItems:v36];
        [v31 setRewardsInProgress:v37];
      }
      id v27 = [obj countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v27);
  }
}

+ (id)_paymentTransactionRewardsInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v5 = +[SQLiteEntity queryWithDatabase:a3 predicate:a4];
  id v6 = [a1 _paymentTransactionRewardsWithQuery:v5];

  return v6;
}

+ (id)_paymentTransactionRewardsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _propertySettersForPaymentTransactionRewardItem];
  if (sub_10049F590(v4))
  {
    id v6 = [v5 mutableCopy];
    [v6 removeObjectForKey:@"MAX(mirabelle.b) NOT NULL AS has_enhanced_merchant_program_identifier"];
    id v7 = [v6 copy];

    id v5 = v7;
  }
  id v8 = [v5 objectForKey:@"MAX(mirabelle.b) NOT NULL AS has_enhanced_merchant_program_identifier"];

  if (v8)
  {
    uint64_t v9 = [a1 _updateQueryGrouping:v4];

    id v4 = (id)v9;
  }
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v11 = [v5 allKeys];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10049F97C;
  v16[3] = &unk_10072EAD8;
  id v18 = v10;
  id v19 = a1;
  id v17 = v5;
  id v12 = v10;
  id v13 = v5;
  [v4 enumeratePersistentIDsAndProperties:v11 usingBlock:v16];

  id v14 = [v12 copy];
  return v14;
}

+ (id)_updateQueryGrouping:(id)a3
{
  id v3 = a3;
  id v4 = [v3 queryDescriptor];
  id v5 = [v4 groupingProperties];
  id v6 = +[NSArray arrayWithObject:@"pid"];
  id v17 = v6;
  if ([v5 count])
  {
    id v7 = [v6 arrayByAddingObjectsFromArray:v5];
  }
  else
  {
    id v7 = v6;
  }
  id v8 = v7;
  uint64_t v9 = [v3 database];
  id v10 = [v4 predicate];
  id v11 = [v4 orderingProperties];
  id v12 = [v4 orderingDirections];
  id v13 = [v4 limitCount];
  LOBYTE(v16) = [v4 returnsDistinctEntities];
  id v14 = +[SQLiteEntity queryWithDatabase:v9 predicate:v10 orderingProperties:v11 orderingDirections:v12 limit:v13 groupingProperties:v8 returnsDistinctEntities:v16];

  return v14;
}

+ (id)_predicateForRewardWithIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_predicateForPaymentTransactionPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPaymentTransactionPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:@"b" values:a3];
}

+ (id)_predicateForPaymentTransactionIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"payment_transaction.identifier" equalToValue:a3];
}

+ (id)_predicateForPaymentTransaction:(id)a3
{
  id v4 = [a3 persistentID];
  return [a1 _predicateForPaymentTransactionPID:v4];
}

+ (id)_predicateForCompletedRewards
{
  return _[a1 _predicateExcludingPaymentTransactionRewardState:4];
}

+ (id)_predicateForInProgressRewards
{
  return _[a1 _predicateForPaymentTransactionRewardState:4];
}

+ (id)_predicateForPaymentTransactionRewardState:(unint64_t)a3
{
  id v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"d" equalToValue:v3];

  return v4;
}

+ (id)_predicateExcludingPaymentTransactionRewardState:(unint64_t)a3
{
  id v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"d" notEqualToValue:v3];

  return v4;
}

+ (id)_predicateForAccountRewardsPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"i" equalToValue:v3];

  return v4;
}

+ (id)_predicateForInstallmentPlanPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"j" equalToValue:a3];
}

+ (id)_rewardsFromRewardsItems:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    id v4 = [objc_alloc((Class)PKPaymentTransactionRewards) initWithRewardsItems:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)_rewardsInProgressFromRewardsItems:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    id v4 = [objc_alloc((Class)PKPaymentTransactionRewards) initWithRewardsItems:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)_propertySettersForPaymentTransactionRewardItem
{
  v4[0] = @"a";
  v4[1] = @"c";
  v5[0] = &stru_100754B90;
  v5[1] = &stru_100754BB0;
  v4[2] = @"d";
  v4[3] = @"g";
  v5[2] = &stru_100754BD0;
  v5[3] = &stru_100754BF0;
  v4[4] = @"h";
  v4[5] = @"k";
  v5[4] = &stru_100754C10;
  v5[5] = &stru_100754C30;
  v4[6] = @"l";
  v4[7] = @"m";
  v5[6] = &stru_100754C50;
  v5[7] = &stru_100754C70;
  v4[8] = @"MAX(mirabelle.b) NOT NULL AS has_enhanced_merchant_program_identifier";
  v4[9] = @"e";
  v5[8] = &stru_100754C90;
  v5[9] = &stru_100754CB0;
  v4[10] = @"f";
  v5[10] = &stru_100754CD0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:11];
  return v2;
}

@end