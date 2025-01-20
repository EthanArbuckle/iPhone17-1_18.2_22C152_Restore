@interface TransitAppletStateBalance
+ (id)_postProcessValue:(id)a3;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPassWithUniqueIdentifier:(id)a3;
+ (id)_predicateForPaymentPassPID:(int64_t)a3;
+ (id)_predicateForTransitAppletStatePID:(int64_t)a3;
+ (id)_propertySettersForBalanceItem;
+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4 forPassWithUniqueIdentifier:(id)a5 andTransitAppletStatePID:(int64_t)a6;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertTransitAppletBalance:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6;
+ (id)insertTransitAppletBalances:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6;
+ (id)transitAppletBalancesInDatabase:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5;
+ (id)transitAppletStateBalancesInDatabase:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPaymentPassPID:(int64_t)a3 andTransitAppletStatePID:(int64_t)a4 inDatabase:(id)a5;
+ (void)updateWithTransitAppletBalances:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6;
- (TransitAppletStateBalance)initWithTransitAppletBalance:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6;
- (id)_valuesDictionaryForTransitAppletBalance:(id)a3 paymentPassPID:(int64_t)a4 transitAppletStatePID:(int64_t)a5;
- (id)balance;
@end

@implementation TransitAppletStateBalance

- (TransitAppletStateBalance)initWithTransitAppletBalance:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  v11 = [(TransitAppletStateBalance *)self _valuesDictionaryForTransitAppletBalance:a3 paymentPassPID:a4 transitAppletStatePID:a5];
  v12 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v10];

  return v12;
}

+ (id)databaseTable
{
  return @"transit_applet_state_balance";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"pass_pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"transit_applet_state_pid";
  }
  return 0;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v6 isEqualToString:@"transit_applet_state.pid"] & 1) != 0
    || [v6 isEqualToString:@"transit_applet_state_pid"])
  {
    [v5 addObject:@"JOIN transit_applet_state ON transit_applet_state_balance.transit_applet_state_pid = transit_applet_state.pid"];
  }
  if (([v6 isEqualToString:@"pass.pid"] & 1) != 0
    || [v6 isEqualToString:@"pass.unique_id"])
  {
    [v5 addObject:@"JOIN pass ON pass.pid = transit_applet_state_balance.pass_pid"];
  }
}

+ (id)insertTransitAppletBalance:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v12 = [objc_alloc((Class)a1) initWithTransitAppletBalance:v11 withPaymentPassPID:a4 withTransitAppletStatePID:a5 inDatabase:v10];

  return v12;
}

+ (id)insertTransitAppletBalances:(id)a3 withPaymentPassPID:(int64_t)a4 withTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v18 = [TransitAppletStateBalance alloc];
        v19 = -[TransitAppletStateBalance initWithTransitAppletBalance:withPaymentPassPID:withTransitAppletStatePID:inDatabase:](v18, "initWithTransitAppletBalance:withPaymentPassPID:withTransitAppletStatePID:inDatabase:", v17, a4, a5, v10, (void)v22);
        [v11 safelyAddObject:v19];
      }
      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  id v20 = [v11 copy];
  return v20;
}

+ (void)updateWithTransitAppletBalances:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5 inDatabase:(id)a6
{
  id v11 = a3;
  id v9 = a6;
  if (v11 && [v11 count])
  {
    +[TransitAppletStateBalance deleteEntitiesForPaymentPassPID:a4 andTransitAppletStatePID:a5 inDatabase:v9];
    id v10 = +[TransitAppletStateBalance insertTransitAppletBalances:v11 withPaymentPassPID:a4 withTransitAppletStatePID:a5 inDatabase:v9];
  }
}

+ (void)deleteEntitiesForPaymentPassPID:(int64_t)a3 andTransitAppletStatePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [a1 _predicateForPaymentPassPID:a3];
  id v10 = [a1 _predicateForTransitAppletStatePID:a4];
  v14[0] = v9;
  v14[1] = v10;
  id v11 = +[NSArray arrayWithObjects:v14 count:2];
  id v12 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];

  id v13 = [a1 queryWithDatabase:v8 predicate:v12];

  [v13 deleteAllEntities];
}

+ (id)anyInDatabase:(id)a3 withIdentifier:(id)a4 forPassWithUniqueIdentifier:(id)a5 andTransitAppletStatePID:(int64_t)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = [a1 _predicateForIdentifier:a4];
  id v13 = [a1 _predicateForPassWithUniqueIdentifier:v10];

  id v14 = [a1 _predicateForTransitAppletStatePID:a6];
  v19[0] = v12;
  v19[1] = v13;
  v19[2] = v14;
  uint64_t v15 = +[NSArray arrayWithObjects:v19 count:3];
  v16 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v15];

  uint64_t v17 = [a1 anyInDatabase:v11 predicate:v16];

  return v17;
}

+ (id)transitAppletStateBalancesInDatabase:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5
{
  id v8 = a3;
  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v10 = [a1 _predicateForPaymentPassPID:a4];
  id v11 = [a1 _predicateForTransitAppletStatePID:a5];
  v28[0] = v10;
  v28[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v28 count:2];
  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  id v14 = +[SQLiteEntity queryWithDatabase:v8 predicate:v13];
  v27[0] = @"transit_applet_state.pid";
  v27[1] = @"pass.pid";
  uint64_t v15 = +[NSArray arrayWithObjects:v27 count:2];
  id v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  long long v22 = sub_1003D2838;
  long long v23 = &unk_10072EAD8;
  id v25 = v9;
  id v26 = a1;
  id v24 = v8;
  id v16 = v9;
  id v17 = v8;
  [v14 enumeratePersistentIDsAndProperties:v15 usingBlock:&v20];

  id v18 = objc_msgSend(v16, "copy", v20, v21, v22, v23);
  return v18;
}

+ (id)transitAppletBalancesInDatabase:(id)a3 forPaymentPassPID:(int64_t)a4 andTransitAppletStatePID:(int64_t)a5
{
  id v5 = [a1 transitAppletStateBalancesInDatabase:a3 forPaymentPassPID:a4 andTransitAppletStatePID:a5];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "balance", (void)v15);
        [v6 addObject:v12];
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v13 = [v6 copy];
  return v13;
}

- (id)balance
{
  id v3 = objc_alloc_init((Class)PKTransitAppletBalance);
  v4 = +[TransitAppletStateBalance _propertySettersForBalanceItem];
  id v5 = [v4 allKeys];
  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_1003D2AFC;
  id v13 = &unk_10072EDD0;
  id v14 = v4;
  id v15 = v3;
  id v6 = v3;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:&v10];

  id v8 = +[TransitAppletStateBalance _postProcessValue:](TransitAppletStateBalance, "_postProcessValue:", v6, v10, v11, v12, v13);

  return v8;
}

- (id)_valuesDictionaryForTransitAppletBalance:(id)a3 paymentPassPID:(int64_t)a4 transitAppletStatePID:(int64_t)a5
{
  id v7 = a3;
  id v8 = +[NSMutableDictionary dictionary];
  id v9 = [v7 exponent];
  uint64_t v10 = [v7 balance];
  if ([v7 isCurrency])
  {
    uint64_t v11 = PKCurrencyDecimalToStorageNumber();
LABEL_6:
    id v12 = (void *)v11;
    goto LABEL_8;
  }
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v10 decimalNumberByMultiplyingByPowerOf10:(__int16)v9];
      goto LABEL_6;
    }
  }
  id v12 = 0;
LABEL_8:
  id v13 = +[NSNumber numberWithLongLong:a5];
  [v8 setObject:v13 forKey:@"transit_applet_state_pid"];

  id v14 = +[NSNumber numberWithLongLong:a4];
  [v8 setObject:v14 forKey:@"pass_pid"];

  id v15 = [v7 identifier];
  [v8 setObjectOrNull:v15 forKey:@"identifier"];

  long long v16 = [v7 currency];
  [v8 setObjectOrNull:v16 forKey:@"currency"];

  [v8 setInteger:v9 forKey:@"exponent"];
  [v8 setObjectOrNull:v12 forKey:@"balance"];
  long long v17 = [v7 expirationDate];
  long long v18 = (void *)_SQLValueForDate();
  [v8 setObjectOrNull:v18 forKey:@"expiration_date"];

  id v19 = [v8 copy];
  return v19;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"identifier" equalToValue:a3];
}

+ (id)_predicateForPaymentPassPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForTransitAppletStatePID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"transit_applet_state_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPassWithUniqueIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:a3];
}

+ (id)_propertySettersForBalanceItem
{
  v4[0] = @"identifier";
  v4[1] = @"currency";
  v5[0] = &stru_10074F0C8;
  v5[1] = &stru_10074F0E8;
  v4[2] = @"exponent";
  v4[3] = @"balance";
  v5[2] = &stru_10074F108;
  v5[3] = &stru_10074F128;
  v4[4] = @"expiration_date";
  v5[4] = &stru_10074F148;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

+ (id)_postProcessValue:(id)a3
{
  id v3 = a3;
  if ([v3 isCurrency])
  {
    id v4 = [v3 balance];
    PKCurrencyStorageNumberToCurrencyDecimal();
  }
  else
  {
    id v5 = objc_alloc((Class)NSDecimalNumber);
    id v6 = [v3 balance];
    id v4 = objc_msgSend(v5, "initWithLongLong:", objc_msgSend(v6, "longLongValue"));

    objc_msgSend(v4, "decimalNumberByMultiplyingByPowerOf10:", (__int16)-(uint64_t)objc_msgSend(v3, "exponent"));
  id v7 = };
  [v3 setBalance:v7];

  return v3;
}

@end