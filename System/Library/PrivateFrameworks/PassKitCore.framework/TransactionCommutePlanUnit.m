@interface TransactionCommutePlanUnit
+ (id)_predicateForPaymentTransactionPID:(int64_t)a3;
+ (id)_predicateForPaymentTransactionPIDs:(id)a3;
+ (id)_propertySettersForCommutePlanUnit;
+ (id)anyInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertCommutePlanUnit:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)insertCommutePlanUnits:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)pk_transactionCommutePlanUnitsInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4;
+ (id)transactionCommutePlanUnitsInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPaymentTransactionPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateWithCommutePlanUnits:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
- (TransactionCommutePlanUnit)initWithCommutePlanUnit:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_valuesDictionaryForCommutePlanUnit:(id)a3 forPaymentTransactionPID:(int64_t)a4;
- (id)transactionCommutePlanUnit;
@end

@implementation TransactionCommutePlanUnit

- (TransactionCommutePlanUnit)initWithCommutePlanUnit:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = [(TransactionCommutePlanUnit *)self _valuesDictionaryForCommutePlanUnit:a3 forPaymentTransactionPID:a4];
  v10 = [(SQLiteEntity *)self initWithPropertyValues:v9 inDatabase:v8];

  return v10;
}

+ (id)databaseTable
{
  return @"ice_cream_banana";
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

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"payment_transaction.pid"]) {
    [v5 addObject:@"JOIN payment_transaction ON payment_transaction.pid = ice_cream_banana.a"];
  }
}

+ (id)insertCommutePlanUnit:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithCommutePlanUnit:v9 forPaymentTransactionPID:a4 inDatabase:v8];

  return v10;
}

+ (id)insertCommutePlanUnits:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
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
        v15 = +[TransactionCommutePlanUnit insertCommutePlanUnit:forPaymentTransactionPID:inDatabase:](TransactionCommutePlanUnit, "insertCommutePlanUnit:forPaymentTransactionPID:inDatabase:", *(void *)(*((void *)&v18 + 1) + 8 * i), a4, v8, (void)v18);
        [v9 safelyAddObject:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  id v16 = [v9 copy];
  return v16;
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

+ (id)transactionCommutePlanUnitsInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [a1 _predicateForPaymentTransactionPID:a4];
  id v9 = +[SQLiteEntity queryWithDatabase:v6 predicate:v8];
  v22[0] = @"a";
  v22[1] = @"payment_transaction.pid";
  id v10 = +[NSArray arrayWithObjects:v22 count:2];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_100186294;
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

+ (id)pk_transactionCommutePlanUnitsInDatabase:(id)a3 forPaymentTransactionPID:(int64_t)a4
{
  v4 = [a1 transactionCommutePlanUnitsInDatabase:a3 forPaymentTransactionPID:a4];
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
        id v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "transactionCommutePlanUnit", (void)v14);
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

+ (void)updateWithCommutePlanUnits:(id)a3 forPaymentTransactionPID:(int64_t)a4 inDatabase:(id)a5
{
  id v9 = a3;
  id v7 = a5;
  if (v9 && [v9 count])
  {
    +[TransactionCommutePlanUnit deleteEntitiesForPaymentTransactionPID:a4 inDatabase:v7];
    id v8 = +[TransactionCommutePlanUnit insertCommutePlanUnits:v9 forPaymentTransactionPID:a4 inDatabase:v7];
  }
}

- (id)transactionCommutePlanUnit
{
  v3 = objc_alloc_init(TransientUnit);
  v4 = +[TransactionCommutePlanUnit _propertySettersForCommutePlanUnit];
  id v5 = [v4 allKeys];
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_100186600;
  id v13 = &unk_10072EDD0;
  id v14 = v4;
  long long v15 = v3;
  id v6 = v3;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:&v10];

  id v8 = [(TransientUnit *)v6 commutePlanUnit];

  return v8;
}

- (id)_valuesDictionaryForCommutePlanUnit:(id)a3 forPaymentTransactionPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[NSMutableDictionary dictionary];
  id v7 = +[NSNumber numberWithLongLong:a4];
  [v6 setObjectOrNull:v7 forKey:@"a"];

  id v8 = [v5 valueCount];
  id v9 = [v8 currency];
  [v6 setObjectOrNull:v9 forKey:@"d"];

  id v10 = [v5 label];
  [v6 setObjectOrNull:v10 forKey:@"c"];

  uint64_t v11 = [v5 identifier];
  [v6 setObjectOrNull:v11 forKey:@"b"];

  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "planType"), @"f");
  id v12 = [v5 valueCount];

  id v13 = [v12 amount];
  id v14 = PKCurrencyDecimalToStorageNumber();
  [v6 setObjectOrNull:v14 forKey:@"e"];

  id v15 = [v6 copy];
  return v15;
}

+ (id)_predicateForPaymentTransactionPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPaymentTransactionPIDs:(id)a3
{
  return +[SQLiteContainsPredicate containsPredicateWithProperty:@"a" values:a3];
}

+ (id)_propertySettersForCommutePlanUnit
{
  v4[0] = @"b";
  v4[1] = @"d";
  v5[0] = &stru_10073B058;
  v5[1] = &stru_10073B078;
  v4[2] = @"c";
  v4[3] = @"e";
  v5[2] = &stru_10073B098;
  v5[3] = &stru_10073B0B8;
  v4[4] = @"f";
  v5[4] = &stru_10073B0D8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

@end