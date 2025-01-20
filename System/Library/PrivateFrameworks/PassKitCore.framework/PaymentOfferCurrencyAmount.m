@interface PaymentOfferCurrencyAmount
+ (id)_commonDictionaryForCurrencyAmount:(id)a3;
+ (id)_currencyAmountForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4 amountType:(unint64_t)a5 inDatabase:(id)a6;
+ (id)_currencyAmountsWithQuery:(id)a3;
+ (id)_predicateForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4;
+ (id)_predicateForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4 amountType:(unint64_t)a5;
+ (id)currencyAmountForInstallmentCriteriaPID:(int64_t)a3 type:(unint64_t)a4 inDatabase:(id)a5;
+ (id)currencyAmountForRewardsCriteriaPID:(int64_t)a3 type:(unint64_t)a4 inDatabase:(id)a5;
+ (id)databaseTable;
+ (void)_deletePaymentOfferCurrencyAmountForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4 inDatabase:(id)a5;
+ (void)_deletePaymentOfferCurrencyAmountForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4 type:(unint64_t)a5 inDatabase:(id)a6;
+ (void)_insertOrUpdateCurrencyAmounts:(id)a3 forCriteriaPID:(int64_t)a4 criteriaType:(unint64_t)a5 amountType:(unint64_t)a6 inDatabase:(id)a7;
+ (void)deletePaymentOfferCurrencyAmountForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePaymentOfferCurrencyAmountForRewardsCriteriaPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateCurrencyAmounts:(id)a3 forInstallmentCriteriaPID:(int64_t)a4 type:(unint64_t)a5 inDatabase:(id)a6;
+ (void)insertOrUpdateCurrencyAmounts:(id)a3 forRewardsCriteriaPID:(int64_t)a4 type:(unint64_t)a5 inDatabase:(id)a6;
@end

@implementation PaymentOfferCurrencyAmount

+ (id)databaseTable
{
  return @"pig";
}

+ (void)_insertOrUpdateCurrencyAmounts:(id)a3 forCriteriaPID:(int64_t)a4 criteriaType:(unint64_t)a5 amountType:(unint64_t)a6 inDatabase:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  int64_t v14 = a4;
  int64_t v15 = a4;
  unint64_t v16 = a5;
  unint64_t v17 = a5;
  unint64_t v18 = a6;
  id v28 = v13;
  objc_msgSend(a1, "_deletePaymentOfferCurrencyAmountForCriteriaPID:criteriaType:type:inDatabase:", v15, v17, a6);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v12;
  id v19 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v30;
    do
    {
      v22 = 0;
      do
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = [(id)objc_opt_class() _commonDictionaryForCurrencyAmount:*(void *)(*((void *)&v29 + 1) + 8 * (void)v22)];
        v24 = +[NSNumber numberWithLongLong:v14];
        [v23 safelySetObject:v24 forKey:@"i_pid"];

        v25 = +[NSNumber numberWithUnsignedInteger:v18];
        [v23 safelySetObject:v25 forKey:@"a"];

        v26 = +[NSNumber numberWithUnsignedInteger:v16];
        [v23 safelySetObject:v26 forKey:@"d"];

        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v20);
  }
}

+ (void)insertOrUpdateCurrencyAmounts:(id)a3 forInstallmentCriteriaPID:(int64_t)a4 type:(unint64_t)a5 inDatabase:(id)a6
{
}

+ (void)insertOrUpdateCurrencyAmounts:(id)a3 forRewardsCriteriaPID:(int64_t)a4 type:(unint64_t)a5 inDatabase:(id)a6
{
}

+ (void)_deletePaymentOfferCurrencyAmountForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = [a1 _predicateForCriteriaPID:a3 criteriaType:a4];
  id v10 = [a1 queryWithDatabase:v8 predicate:v9];

  [v10 deleteAllEntities];
}

+ (void)_deletePaymentOfferCurrencyAmountForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4 type:(unint64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  v11 = [a1 _predicateForCriteriaPID:a3 criteriaType:a4 amountType:a5];
  id v12 = [a1 queryWithDatabase:v10 predicate:v11];

  [v12 deleteAllEntities];
}

+ (void)deletePaymentOfferCurrencyAmountForInstallmentCriteriaPID:(int64_t)a3 inDatabase:(id)a4
{
}

+ (void)deletePaymentOfferCurrencyAmountForRewardsCriteriaPID:(int64_t)a3 inDatabase:(id)a4
{
}

+ (id)_currencyAmountForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4 amountType:(unint64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  v11 = [a1 _predicateForCriteriaPID:a3 criteriaType:a4 amountType:a5];
  id v12 = [a1 queryWithDatabase:v10 predicate:v11];

  id v13 = [a1 _currencyAmountsWithQuery:v12];

  return v13;
}

+ (id)currencyAmountForInstallmentCriteriaPID:(int64_t)a3 type:(unint64_t)a4 inDatabase:(id)a5
{
  return _[a1 _currencyAmountForCriteriaPID:a3 criteriaType:1 amountType:a4 inDatabase:a5];
}

+ (id)currencyAmountForRewardsCriteriaPID:(int64_t)a3 type:(unint64_t)a4 inDatabase:(id)a5
{
  return _[a1 _currencyAmountForCriteriaPID:a3 criteriaType:2 amountType:a4 inDatabase:a5];
}

+ (id)_currencyAmountsWithQuery:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  [v3 database];
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_1003B8FB8;
  id v12 = &unk_100730E38;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  id v14 = v5;
  id v6 = v13;
  [v3 enumeratePersistentIDsUsingBlock:&v9];

  if (objc_msgSend(v5, "count", v9, v10, v11, v12)) {
    id v7 = [v5 copy];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

+ (id)_predicateForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4
{
  id v5 = +[NSNumber numberWithLongLong:a3];
  id v6 = +[SQLiteComparisonPredicate predicateWithProperty:@"i_pid" equalToValue:v5];

  id v7 = +[NSNumber numberWithUnsignedInteger:a4];
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"d" equalToValue:v7];

  v12[0] = v6;
  v12[1] = v8;
  v9 = +[NSArray arrayWithObjects:v12 count:2];
  uint64_t v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  return v10;
}

+ (id)_predicateForCriteriaPID:(int64_t)a3 criteriaType:(unint64_t)a4 amountType:(unint64_t)a5
{
  id v7 = +[NSNumber numberWithLongLong:a3];
  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"i_pid" equalToValue:v7];

  v9 = +[NSNumber numberWithUnsignedInteger:a4];
  uint64_t v10 = +[SQLiteComparisonPredicate predicateWithProperty:@"d" equalToValue:v9];

  v11 = +[NSNumber numberWithUnsignedInteger:a5];
  id v12 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v11];

  v16[0] = v8;
  v16[1] = v10;
  v16[2] = v12;
  id v13 = +[NSArray arrayWithObjects:v16 count:3];
  id v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];

  return v14;
}

+ (id)_commonDictionaryForCurrencyAmount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 amount];
  id v6 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v6 forKey:@"b"];

  id v7 = [v3 currency];

  [v4 setObjectOrNull:v7 forKey:@"c"];
  return v4;
}

@end