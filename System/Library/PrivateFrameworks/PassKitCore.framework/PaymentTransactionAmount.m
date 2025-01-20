@interface PaymentTransactionAmount
+ (id)_postProcessValue:(id)a3;
+ (id)_predicateForPassUniqueIdentifier:(id)a3;
+ (id)_predicateForPaymentTransactionPID:(int64_t)a3;
+ (id)_predicateForPaymentTransactionPIDs:(id)a3;
+ (id)_predicateForPendingAmounts;
+ (id)_propertySettersForCurrencyAmount;
+ (id)anyInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPaymentAmount:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertPaymentAmounts:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)paymentAmountsInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4;
+ (id)paymentTransactionAmountsInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4;
+ (id)pendingTransactionAmountsInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateWithPaymentAmounts:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
- (PaymentTransactionAmount)initWithPaymentAmount:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_valuesDictionaryForPaymentAmount:(id)a3;
- (id)paymentTransaction;
- (id)transactionAmount;
- (void)updateWithPaymentAmount:(id)a3;
@end

@implementation PaymentTransactionAmount

- (PaymentTransactionAmount)initWithPaymentAmount:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = [(PaymentTransactionAmount *)self _valuesDictionaryForPaymentAmount:a3];
  id v10 = [v9 mutableCopy];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"payment_transaction_pid"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v12;
}

+ (id)databaseTable
{
  return @"payment_transaction_amount";
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
  id v7 = a3;
  id v5 = a4;
  if (([v7 isEqualToString:@"payment_transaction.pid"] & 1) != 0
    || ([v7 isEqualToString:@"payment_transaction_pid"] & 1) != 0)
  {
    CFStringRef v6 = @"JOIN payment_transaction ON payment_transaction.pid = payment_transaction_amount.payment_transaction_pid";
LABEL_11:
    [v5 addObject:v6];
    goto LABEL_12;
  }
  if (([v7 isEqualToString:@"payment_application.transaction_source_pid"] & 1) != 0
    || ([v7 isEqualToString:@"payment_transaction.source_pid"] & 1) != 0)
  {
    CFStringRef v6 = @"JOIN payment_application ON payment_application.transaction_source_pid = payment_transaction.source_pid";
    goto LABEL_11;
  }
  if (([v7 isEqualToString:@"payment_application.pass_pid"] & 1) != 0
    || ([v7 isEqualToString:@"pass.pid"] & 1) != 0
    || [v7 isEqualToString:@"pass.unique_id"])
  {
    CFStringRef v6 = @"JOIN pass on payment_application.pass_pid = pass.pid";
    goto LABEL_11;
  }
LABEL_12:
}

+ (id)insertPaymentAmount:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithPaymentAmount:v9 forPaymentTransactionPID:a4 inDatabase:v8];

  return v10;
}

+ (id)insertPaymentAmounts:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = +[PaymentTransactionAmount insertPaymentAmount:forPaymentTransactionPID:inDatabase:](PaymentTransactionAmount, "insertPaymentAmount:forPaymentTransactionPID:inDatabase:", *(void *)(*((void *)&v18 + 1) + 8 * i), a4, v8, (void)v18);
        [v9 safelyAddObject:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  id v16 = [v9 copy];
  return v16;
}

+ (void)updateWithPaymentAmounts:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v9 = a3;
  id v7 = a5;
  if (v9 && [v9 count])
  {
    +[PaymentTransactionAmount deleteEntitiesForPaymentTransactionPID:a4 inDatabase:v7];
    id v8 = +[PaymentTransactionAmount insertPaymentAmounts:v9 forPaymentTransactionPID:a4 inDatabase:v7];
  }
}

- (void)updateWithPaymentAmount:(id)a3
{
  id v4 = [(PaymentTransactionAmount *)self _valuesDictionaryForPaymentAmount:a3];
  [(SQLiteEntity *)self setValuesWithDictionary:v4];
}

+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPaymentTransactionPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)anyInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPaymentTransactionPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)paymentTransactionAmountsInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [a1 _predicateForPaymentTransactionPID:a4];
  id v9 = +[SQLiteEntity queryWithDatabase:v6 predicate:v8];
  v22[0] = @"payment_transaction_pid";
  v22[1] = @"payment_transaction.pid";
  id v10 = +[NSArray arrayWithObjects:v22 count:2];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_100372814;
  long long v18 = &unk_10072EAD8;
  id v20 = v7;
  id v21 = a1;
  id v19 = v6;
  id v11 = v7;
  id v12 = v6;
  [v9 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (id)pendingTransactionAmountsInDatabase:(id)a3 forPassWithUniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v9 = [a1 _predicateForPendingAmounts];
  id v10 = [a1 _predicateForPassUniqueIdentifier:v7];

  v24[0] = v9;
  v24[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v24 count:2];
  id v12 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];

  id v13 = +[SQLiteEntity queryWithDatabase:v6 predicate:v12];
  v23[0] = @"payment_transaction_pid";
  v23[1] = @"payment_transaction.pid";
  v23[2] = @"payment_transaction.source_pid";
  v23[3] = @"payment_application.transaction_source_pid";
  v23[4] = @"payment_application.pass_pid";
  v23[5] = @"pass.pid";
  v23[6] = @"pass.unique_id";
  v14 = +[NSArray arrayWithObjects:v23 count:7];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100372AA8;
  v19[3] = &unk_10072EAD8;
  id v21 = v8;
  id v22 = a1;
  id v20 = v6;
  id v15 = v8;
  id v16 = v6;
  [v13 enumeratePersistentIDsAndProperties:v14 usingBlock:v19];
  id v17 = [v15 copy];

  return v17;
}

+ (id)paymentAmountsInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4
{
  id v4 = [a1 paymentTransactionAmountsInDatabase:a3 forPaymentTransactionPID:a4];
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "transactionAmount", (void)v14);
        [v5 safelyAddObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    id v12 = [v5 copy];
  }
  else {
    id v12 = 0;
  }

  return v12;
}

- (id)transactionAmount
{
  v3 = objc_alloc_init(TransientCurrencyAmount);
  id v4 = +[PaymentTransactionAmount _propertySettersForCurrencyAmount];
  id v5 = [v4 allKeys];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  long long v14 = sub_100372D9C;
  long long v15 = &unk_10072EDD0;
  id v16 = v4;
  long long v17 = v3;
  id v6 = v3;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:&v12];

  id v8 = objc_alloc((Class)PKTransactionAmount);
  id v9 = objc_msgSend(v8, "initWithTransientCurrencyAmount:", v6, v12, v13, v14, v15);
  id v10 = +[PaymentTransactionAmount _postProcessValue:v9];

  return v10;
}

- (id)paymentTransaction
{
  v3 = objc_alloc_init(TransientCurrencyAmount);
  id v4 = +[PaymentTransactionAmount _propertySettersForCurrencyAmount];
  id v5 = [v4 allKeys];
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  long long v14 = sub_100372F00;
  long long v15 = &unk_10072EDD0;
  id v16 = v4;
  long long v17 = v3;
  id v6 = v3;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:&v12];

  id v8 = [PaymentTransaction alloc];
  id v9 = [(TransientCurrencyAmount *)v6 transactionPID];
  id v10 = -[SQLiteEntity initWithPersistentID:inDatabase:](v8, "initWithPersistentID:inDatabase:", [v9 longLongValue], self->super._database);

  return v10;
}

- (id)_valuesDictionaryForPaymentAmount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 amount];
  id v6 = [v5 exponent];
  id v7 = [v5 currency];
  uint64_t v21 = PKNoCurrencyCode;
  id v22 = v7;
  if (objc_msgSend(v7, "isEqualToString:"))
  {
    id v8 = [v5 amount];
    id v9 = objc_msgSend(objc_alloc((Class)NSDecimalNumber), "initWithLongLong:", objc_msgSend(v8, "longLongValue"));
    [v9 decimalNumberByMultiplyingByPowerOf10:(__int16)v6];
  }
  else
  {
    id v8 = [v3 amount];
    id v9 = [v8 amount];
    PKCurrencyDecimalToStorageNumber();
  id v10 = };

  id v11 = [v3 isPending];
  id v12 = [v3 label];
  uint64_t v13 = [v5 preformattedString];
  long long v14 = [v3 amount];
  long long v15 = [v14 currency];
  [v4 setObjectOrNull:v15 forKey:@"currency"];

  [v4 setInteger:v6 forKey:@"exponent"];
  [v4 setObjectOrNull:v10 forKey:@"amount"];
  [v4 setBool:v11 forKey:@"pending"];
  [v4 setObjectOrNull:v12 forKey:@"label"];
  id v16 = [v3 unitIdentifier];
  [v4 setObjectOrNull:v16 forKey:@"unit_identifier"];

  [v4 setObjectOrNull:v13 forKey:@"preformatted_string"];
  if ([v22 isEqual:v21])
  {
    long long v17 = [v5 absoluteValue];
    long long v18 = [v17 formattedStringValue];
    [v4 setObjectOrNull:v18 forKey:@"preformatted_string"];
  }
  else
  {
    [v4 setObjectOrNull:0 forKey:@"preformatted_string"];
  }
  id v19 = [v4 copy];

  return v19;
}

+ (id)_predicateForPendingAmounts
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pending" equalToValue:&__kCFBooleanTrue];
}

+ (id)_predicateForPassUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:a3];
}

+ (id)_predicateForPaymentTransactionPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"payment_transaction_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPaymentTransactionPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:@"payment_transaction_pid" values:a3];
}

+ (id)_propertySettersForCurrencyAmount
{
  v4[0] = @"currency";
  v4[1] = @"exponent";
  v5[0] = &stru_10074BA18;
  v5[1] = &stru_10074BA38;
  v4[2] = @"label";
  v4[3] = @"pending";
  v5[2] = &stru_10074BA58;
  v5[3] = &stru_10074BA78;
  v4[4] = @"unit_identifier";
  v4[5] = @"amount";
  v5[4] = &stru_10074BA98;
  v5[5] = &stru_10074BAB8;
  v4[6] = @"preformatted_string";
  v4[7] = @"payment_transaction_pid";
  v5[6] = &stru_10074BAD8;
  v5[7] = &stru_10074BAF8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:8];
  return v2;
}

+ (id)_postProcessValue:(id)a3
{
  id v3 = a3;
  id v4 = [v3 amount];
  id v5 = [v4 currency];
  if ([v5 isEqualToString:PKNoCurrencyCode])
  {
    id v6 = objc_alloc((Class)NSDecimalNumber);
    id v7 = [v4 amount];
    id v8 = objc_msgSend(v6, "initWithLongLong:", objc_msgSend(v7, "longLongValue"));

    objc_msgSend(v8, "decimalNumberByMultiplyingByPowerOf10:", (__int16)-(uint64_t)objc_msgSend(v4, "exponent"));
  }
  else
  {
    id v8 = [v4 amount];
    PKCurrencyStorageNumberToCurrencyDecimal();
  id v9 = };
  [v4 setAmount:v9];

  [v3 setAmount:v4];
  return v3;
}

@end