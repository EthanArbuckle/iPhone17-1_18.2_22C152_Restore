@interface PaymentTransactionFee
+ (id)_feesFromFeeItems:(id)a3;
+ (id)_paymentTransactionFeesInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_paymentTransactionFeesWithQuery:(id)a3;
+ (id)_predicateForFeeWithIdentifier:(id)a3;
+ (id)_predicateForPaymentTransaction:(id)a3;
+ (id)_predicateForPaymentTransactionIdentifier:(id)a3;
+ (id)_predicateForPaymentTransactionPID:(int64_t)a3;
+ (id)_predicateForPaymentTransactionPIDs:(id)a3;
+ (id)_propertySettersForPaymentTransactionFeeItem;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)paymentTransactionFeesInDatabase:(id)a3 forPaymentTransaction:(id)a4;
+ (id)paymentTransactionFeesInDatabase:(id)a3 forPaymentTransactionIdentifier:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)associateFeesToPaymentTransactions:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransaction:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updatePaymentTransactionFees:(id)a3 forPaymentTransaction:(id)a4 inDatabase:(id)a5;
- (PaymentTransactionFee)initWithPaymentTransactionFeeItem:(id)a3 paymentTransaction:(id)a4 inDatabase:(id)a5;
- (id)feeItem;
- (void)updateWithPaymentTransactionFeeItem:(id)a3;
@end

@implementation PaymentTransactionFee

- (PaymentTransactionFee)initWithPaymentTransactionFeeItem:(id)a3 paymentTransaction:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[NSMutableDictionary dictionary];
  v12 = [v10 currencyAmount];
  v13 = [v12 amount];
  v14 = PKCurrencyDecimalToStorageNumber();

  v15 = [v10 identifier];
  [v11 setObjectOrNull:v15 forKey:@"identifier"];

  objc_msgSend(v11, "setInteger:forKey:", objc_msgSend(v10, "type"), @"type");
  v16 = [v10 currencyAmount];
  v17 = [v16 currency];
  [v11 setObjectOrNull:v17 forKey:@"currency"];

  [v11 setObjectOrNull:v14 forKey:@"amount"];
  v18 = [v10 localizedDisplayName];

  [v11 setObjectOrNull:v18 forKey:@"localized_display_name"];
  id v19 = [v9 persistentID];

  v20 = +[NSNumber numberWithLongLong:v19];
  [v11 setObject:v20 forKey:@"payment_transaction_pid"];

  v21 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v21;
}

+ (id)databaseTable
{
  return @"payment_transaction_fee";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"payment_transaction_pid";
  }
  else {
    return 0;
  }
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  CFStringRef v9 = @"payment_transaction.identifier";
  id v6 = a3;
  v7 = +[NSArray arrayWithObjects:&v9 count:1];
  unsigned int v8 = objc_msgSend(v7, "containsObject:", v6, v9);

  if (v8) {
    [v5 addObject:@"JOIN payment_transaction ON payment_transaction.pid = payment_transaction_fee.payment_transaction_pid"];
  }
}

- (void)updateWithPaymentTransactionFeeItem:(id)a3
{
  id v4 = a3;
  id v12 = +[NSMutableDictionary dictionary];
  id v5 = [v4 currencyAmount];
  id v6 = [v5 amount];
  v7 = PKCurrencyDecimalToStorageNumber();

  unsigned int v8 = [v4 currencyAmount];
  CFStringRef v9 = [v8 currency];
  [v12 setObjectOrNull:v9 forKey:@"currency"];

  id v10 = [v4 localizedDisplayName];
  [v12 setObjectOrNull:v10 forKey:@"localized_display_name"];

  [v12 setObjectOrNull:v7 forKey:@"amount"];
  id v11 = [v4 type];

  [v12 setInteger:v11 forKey:@"type"];
  [(SQLiteEntity *)self setValuesWithDictionary:v12];
}

+ (void)updatePaymentTransactionFees:(id)a3 forPaymentTransaction:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v36 = a5;
  v35 = +[NSMutableSet set];
  v32 = v9;
  v34 = [a1 _predicateForPaymentTransaction:v9];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v31 = v8;
  id obj = [v8 fees];
  id v10 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v38;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v15 = [v14 identifier];
        v16 = [a1 _predicateForFeeWithIdentifier:v15];
        v44[0] = v16;
        v44[1] = v34;
        v17 = +[NSArray arrayWithObjects:v44 count:2];
        v18 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v17];
        id v19 = [a1 anyInDatabase:v36 predicate:v18];

        v20 = PKLogFacilityTypeGetObject();
        BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        if (v19)
        {
          if (v21)
          {
            v22 = [v14 identifier];
            *(_DWORD *)buf = 138412290;
            v43 = v22;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Updating payment transaction fee with identifier: %@", buf, 0xCu);
          }
          [v19 updateWithPaymentTransactionFeeItem:v14];
        }
        else
        {
          if (v21)
          {
            v23 = [v14 identifier];
            *(_DWORD *)buf = 138412290;
            v43 = v23;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Inserting payment transaction fee with identifier: %@", buf, 0xCu);
          }
          id v19 = [objc_alloc((Class)a1) initWithPaymentTransactionFeeItem:v14 paymentTransaction:v32 inDatabase:v36];
        }
        v24 = [v14 identifier];
        [v35 addObject:v24];
      }
      id v11 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v11);
  }

  v25 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"identifier" values:v35];
  v41[0] = v25;
  v41[1] = v34;
  v26 = +[NSArray arrayWithObjects:v41 count:2];
  v27 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v26];

  v28 = [a1 queryWithDatabase:v36 predicate:v27];
  if (([v28 deleteAllEntities] & 1) == 0)
  {
    v29 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = [v32 identifier];
      *(_DWORD *)buf = 138412290;
      v43 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Failed to delete obsolete payment transaction fees for %@", buf, 0xCu);
    }
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

+ (id)paymentTransactionFeesInDatabase:(id)a3 forPaymentTransaction:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPaymentTransaction:a4];
  id v8 = [a1 _paymentTransactionFeesInDatabase:v6 matchingPredicate:v7];

  id v9 = [a1 _feesFromFeeItems:v8];

  return v9;
}

+ (id)paymentTransactionFeesInDatabase:(id)a3 forPaymentTransactionIdentifier:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPaymentTransactionIdentifier:a4];
  id v8 = [a1 _paymentTransactionFeesInDatabase:v6 matchingPredicate:v7];

  id v9 = [a1 _feesFromFeeItems:v8];

  return v9;
}

+ (void)associateFeesToPaymentTransactions:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30 = v6;
  id v8 = [v6 allKeys];
  id v9 = [a1 _predicateForPaymentTransactionPIDs:v8];
  v29 = v7;
  id v10 = +[SQLiteEntity queryWithDatabase:v7 predicate:v9];

  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v12 = [a1 _propertySettersForPaymentTransactionFeeItem];
  v13 = [v12 allKeys];
  v14 = [v13 arrayByAddingObject:@"payment_transaction_pid"];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10043ECF8;
  v35[3] = &unk_10072EAD8;
  id v38 = a1;
  id v27 = v12;
  id v36 = v27;
  id v15 = v11;
  id v37 = v15;
  v28 = v10;
  [v10 enumeratePersistentIDsAndProperties:v14 usingBlock:v35];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        v22 = objc_msgSend(v30, "objectForKey:", v21, v27);
        id v23 = objc_alloc((Class)PKPaymentTransactionFees);
        v24 = [v16 objectForKey:v21];
        v25 = +[NSSet setWithArray:v24];
        id v26 = [v23 initWithFeeItems:v25];
        [v22 setFees:v26];
      }
      id v18 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v18);
  }
}

- (id)feeItem
{
  id v3 = objc_alloc_init((Class)PKPaymentTransactionFeeItem);
  id v4 = +[PaymentTransactionFee _propertySettersForPaymentTransactionFeeItem];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10043EF80;
  v11[3] = &unk_10072EDD0;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_paymentTransactionFeesInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v5 = +[SQLiteEntity queryWithDatabase:a3 predicate:a4];
  id v6 = [a1 _paymentTransactionFeesWithQuery:v5];

  return v6;
}

+ (id)_paymentTransactionFeesWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _propertySettersForPaymentTransactionFeeItem];
  id v6 = +[NSMutableSet set];
  id v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10043F228;
  v12[3] = &unk_10072EAD8;
  id v14 = v6;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  id v10 = [v8 copy];
  return v10;
}

+ (id)_predicateForFeeWithIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)_predicateForPaymentTransactionPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_transaction_pid" equalToValue:v3];

  return v4;
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

+ (id)_feesFromFeeItems:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    id v4 = [objc_alloc((Class)PKPaymentTransactionFees) initWithFeeItems:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)_predicateForPaymentTransactionPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:@"payment_transaction_pid" values:a3];
}

+ (id)_propertySettersForPaymentTransactionFeeItem
{
  v4[0] = @"identifier";
  v4[1] = @"type";
  v5[0] = &stru_1007514C0;
  v5[1] = &stru_1007514E0;
  v4[2] = @"localized_display_name";
  v4[3] = @"currency";
  v5[2] = &stru_100751500;
  v5[3] = &stru_100751520;
  v4[4] = @"amount";
  v5[4] = &stru_100751540;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

@end