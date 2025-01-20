@interface PaymentTransactionAmountModifier
+ (id)_postProcessedAmountForDecimalAmount:(id)a3 currency:(id)a4 exponent:(int64_t)a5;
+ (id)_predicateForPaymentTransactionPID:(int64_t)a3;
+ (id)_predicateForPaymentTransactionPIDs:(id)a3;
+ (id)_propertySettersForPaymentTransactionAmountModifier;
+ (id)databaseTable;
+ (id)insertPaymentTransactionAmountModifier:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertPaymentTransactionAmountModifiers:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)paymentTransactionAmountModifiersInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4;
+ (void)associateAmountModifiersToPaymentTransactions:(id)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateWithPaymentTransactionAmountModifiers:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
- (PaymentTransactionAmountModifier)initWithPaymentTransactionAmountModifier:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_valuesDictionaryForPaymentTransactionAmountModifier:(id)a3 forPaymentTransactionPID:(int64_t)a4;
@end

@implementation PaymentTransactionAmountModifier

+ (id)databaseTable
{
  return @"payment_transaction_amount_modifiers";
}

- (PaymentTransactionAmountModifier)initWithPaymentTransactionAmountModifier:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = [(PaymentTransactionAmountModifier *)self _valuesDictionaryForPaymentTransactionAmountModifier:a3 forPaymentTransactionPID:a4];
  v10 = [(SQLiteEntity *)self initWithPropertyValues:v9 inDatabase:v8];

  return v10;
}

+ (id)insertPaymentTransactionAmountModifier:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithPaymentTransactionAmountModifier:v9 forPaymentTransactionPID:a4 inDatabase:v8];

  return v10;
}

+ (id)insertPaymentTransactionAmountModifiers:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000ACE9C;
  v13[3] = &unk_100733718;
  id v15 = objc_alloc_init((Class)NSMutableArray);
  int64_t v16 = a4;
  id v14 = v7;
  id v9 = v15;
  id v10 = v7;
  [v8 enumerateObjectsUsingBlock:v13];

  id v11 = [v9 copy];
  return v11;
}

+ (void)updateWithPaymentTransactionAmountModifiers:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v9 = a3;
  id v7 = a5;
  if (v9 && [v9 count])
  {
    +[PaymentTransactionAmountModifier deleteEntitiesForPaymentTransactionPID:a4 inDatabase:v7];
    id v8 = +[PaymentTransactionAmountModifier insertPaymentTransactionAmountModifiers:v9 forPaymentTransactionPID:a4 inDatabase:v7];
  }
}

+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPaymentTransactionPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)paymentTransactionAmountModifiersInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPaymentTransactionPID:a4];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _propertySettersForPaymentTransactionAmountModifier];
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v11 = [v9 allKeys];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000AD224;
  v18[3] = &unk_10072EAD8;
  id v20 = v10;
  id v21 = a1;
  id v19 = v9;
  id v12 = v10;
  id v13 = v9;
  [v8 enumeratePersistentIDsAndProperties:v11 usingBlock:v18];

  id v14 = +[NSSortDescriptor sortDescriptorWithKey:@"order" ascending:1];
  v22 = v14;
  id v15 = +[NSArray arrayWithObjects:&v22 count:1];
  [v12 sortUsingDescriptors:v15];

  id v16 = [v12 copy];
  return v16;
}

+ (void)associateAmountModifiersToPaymentTransactions:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 allKeys];
  uint64_t v9 = [a1 _predicateForPaymentTransactionPIDs:v8];

  v30 = (void *)v9;
  v31 = v7;
  id v10 = [a1 queryWithDatabase:v7 predicate:v9];
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  id v12 = [a1 _propertySettersForPaymentTransactionAmountModifier];
  id v13 = [v12 allKeys];
  id v14 = [v13 arrayByAddingObject:@"payment_transaction_pid"];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000AD618;
  v36[3] = &unk_10072EAD8;
  id v39 = a1;
  id v28 = v12;
  id v37 = v28;
  id v15 = v11;
  id v38 = v15;
  v29 = v10;
  [v10 enumeratePersistentIDsAndProperties:v14 usingBlock:v36];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        v22 = objc_msgSend(v6, "objectForKey:", v21, v28);
        uint64_t v23 = [v16 objectForKey:v21];
        if (v23)
        {
          v24 = (void *)v23;
          v25 = +[NSSortDescriptor sortDescriptorWithKey:@"order" ascending:1];
          v40 = v25;
          v26 = +[NSArray arrayWithObjects:&v40 count:1];
          v27 = [v24 sortedArrayUsingDescriptors:v26];

          [v22 setAmountModifiers:v27];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v18);
  }
}

+ (id)_predicateForPaymentTransactionPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_transaction_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPaymentTransactionPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:@"payment_transaction_pid" values:a3];
}

- (id)_valuesDictionaryForPaymentTransactionAmountModifier:(id)a3 forPaymentTransactionPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[NSMutableDictionary dictionary];
  id v7 = [v5 amount];
  id v8 = [v7 amount];
  id v9 = [v8 exponent];

  uint64_t v10 = [v7 amount];
  id v11 = [(id)v10 currency];

  LOBYTE(v10) = [v11 isEqualToString:PKNoCurrencyCode];
  id v12 = [v7 amount];
  id v13 = [v12 amount];
  id v14 = v13;
  if (v10)
  {
    id v15 = [v13 decimalNumberByMultiplyingByPowerOf10:(__int16)v9];
    id v16 = [v15 longLongValue];
  }
  else
  {
    id v16 = (id)PKCurrencyDecimalToStorageInteger();
  }

  id v17 = +[NSNumber numberWithLongLong:a4];
  [v6 setObjectOrNull:v17 forKey:@"payment_transaction_pid"];

  id v18 = [v5 typeString];
  [v6 setObjectOrNull:v18 forKey:@"modifier_type"];

  uint64_t v19 = [v5 modifierDescription];
  [v6 setObjectOrNull:v19 forKey:@"modifier_description"];

  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "order"), @"modifier_order");
  [v6 setObjectOrNull:v11 forKey:@"currency"];
  [v6 setInteger:v9 forKey:@"exponent"];
  id v20 = +[NSNumber numberWithUnsignedLongLong:v16];
  [v6 setObjectOrNull:v20 forKey:@"amount"];

  id v21 = [v6 copy];
  return v21;
}

+ (id)_postProcessedAmountForDecimalAmount:(id)a3 currency:(id)a4 exponent:(int64_t)a5
{
  id v7 = a3;
  id v8 = 0;
  if (v7 && a4)
  {
    uint64_t v9 = PKNoCurrencyCode;
    id v10 = a4;
    if ([v10 isEqualToString:v9])
    {
      id v11 = objc_msgSend(objc_alloc((Class)NSDecimalNumber), "initWithLongLong:", objc_msgSend(v7, "longLongValue"));
      id v12 = [v11 decimalNumberByMultiplyingByPowerOf10:(__int16)-(__int16)a5];
    }
    else
    {
      id v12 = PKCurrencyStorageNumberToCurrencyDecimal();
    }
    id v13 = [objc_alloc((Class)PKCurrencyAmount) initWithAmount:v12 currency:v10 exponent:a5];

    if (v13)
    {
      id v8 = [objc_alloc((Class)PKTransactionAmount) initWithCurrencyAmount:v13];
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

+ (id)_propertySettersForPaymentTransactionAmountModifier
{
  v4[0] = @"modifier_type";
  v4[1] = @"modifier_description";
  v5[0] = &stru_100733758;
  v5[1] = &stru_100733778;
  v4[2] = @"modifier_order";
  v4[3] = @"amount";
  v5[2] = &stru_100733798;
  v5[3] = &stru_1007337B8;
  v4[4] = @"currency";
  v4[5] = @"exponent";
  v5[4] = &stru_1007337D8;
  v5[5] = &stru_1007337F8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:6];
  return v2;
}

@end