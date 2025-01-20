@interface PaymentTransactionTag
+ (id)_predicateForCurrentLocale;
+ (id)_predicateForPaymentTransactionPID:(int64_t)a3;
+ (id)_propertySettersForPaymentTransactionTag;
+ (id)_tagsFromQuery:(id)a3;
+ (id)allTagsWithTitlesInDatabase:(id)a3;
+ (id)compoundTagsInDatabase:(id)a3 tagType:(unint64_t)a4 limit:(unint64_t)a5;
+ (id)databaseTable;
+ (id)paymentTransactionTagsForPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteAllPaymentTransactionTagsInDatabase:(id)a3;
+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertPaymentTransactionTags:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
@end

@implementation PaymentTransactionTag

+ (id)databaseTable
{
  return @"payment_transaction_tag";
}

+ (void)insertPaymentTransactionTags:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000A6A1C;
  v30[3] = &unk_1007334D8;
  v10 = (objc_class *)a1;
  id v32 = a1;
  int64_t v33 = a4;
  int64_t v11 = a4;
  id v31 = v9;
  id v25 = v31;
  sub_10000817C((uint64_t)v31, v30);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v8;
  id v12 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v15);
        id v17 = objc_alloc_init((Class)NSMutableDictionary);
        v18 = +[NSNumber numberWithLongLong:v11];
        [v17 setObject:v18 forKey:@"payment_transaction_pid"];

        v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v16 type]);
        [v17 setObject:v19 forKey:@"type"];

        v20 = [v16 rank];
        v21 = PKCurrencyDecimalToStorageNumber();
        [v17 setObjectOrNull:v21 forKey:@"rank"];

        v22 = [v16 localizedTitle];
        [v17 setObjectOrNull:v22 forKey:@"localized_title"];

        v23 = [v16 localeIdentifier];
        [v17 setObjectOrNull:v23 forKey:@"locale_identifier"];

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v13);
  }
}

+ (id)paymentTransactionTagsForPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForCurrentLocale];
  v17[0] = v7;
  id v8 = +[SQLiteNullPredicate isNullPredicateWithProperty:@"locale_identifier"];
  v17[1] = v8;
  id v9 = +[NSArray arrayWithObjects:v17 count:2];
  v10 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v9];
  v18[0] = v10;
  int64_t v11 = [a1 _predicateForPaymentTransactionPID:a3];
  v18[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v18 count:2];
  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  uint64_t v14 = [a1 queryWithDatabase:v6 predicate:v13];

  v15 = [a1 _tagsFromQuery:v14];

  return v15;
}

+ (id)allTagsWithTitlesInDatabase:(id)a3
{
  id v4 = a3;
  v5 = [a1 _predicateForCurrentLocale];
  v10[0] = @"type";
  v10[1] = @"localized_title";
  id v6 = +[NSArray arrayWithObjects:v10 count:2];
  v7 = [a1 queryWithDatabase:v4 predicate:v5 orderingProperties:0 orderingDirections:0 limit:0 groupingProperties:v6];

  id v8 = [a1 _tagsFromQuery:v7];

  return v8;
}

+ (id)compoundTagsInDatabase:(id)a3 tagType:(unint64_t)a4 limit:(unint64_t)a5
{
  id v8 = a3;
  id v9 = +[NSNumber numberWithUnsignedInteger:a4];
  v10 = +[SQLiteComparisonPredicate predicateWithProperty:@"type" equalToValue:v9];
  v15[0] = @"type";
  v15[1] = @"localized_title";
  int64_t v11 = +[NSArray arrayWithObjects:v15 count:2];
  id v12 = [a1 queryWithDatabase:v8 predicate:v10 orderingProperties:0 orderingDirections:0 limit:a5 groupingProperties:v11];

  id v13 = [a1 _tagsFromQuery:v12];

  return v13;
}

+ (id)_tagsFromQuery:(id)a3
{
  id v4 = a3;
  v5 = [a1 _propertySettersForPaymentTransactionTag];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000A6F60;
  v12[3] = &unk_10072EAD8;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v14 = v8;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  if ([v8 count]) {
    id v10 = [v8 copy];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPaymentTransactionPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteAllPaymentTransactionTagsInDatabase:(id)a3
{
  id v4 = a3;
  v5 = +[SQLiteBooleanPredicate truePredicate];
  id v6 = [a1 queryWithDatabase:v4 predicate:v5];

  [v6 deleteAllEntities];
}

+ (id)_predicateForCurrentLocale
{
  v2 = +[NSLocale currentLocale];
  v3 = [v2 localeIdentifier];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"locale_identifier" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPaymentTransactionPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_transaction_pid" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForPaymentTransactionTag
{
  v4[0] = @"type";
  v4[1] = @"rank";
  v5[0] = &stru_100733518;
  v5[1] = &stru_100733538;
  v4[2] = @"localized_title";
  v4[3] = @"locale_identifier";
  v5[2] = &stru_100733558;
  v5[3] = &stru_100733578;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

@end