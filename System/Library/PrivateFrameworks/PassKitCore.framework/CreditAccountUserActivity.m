@interface CreditAccountUserActivity
+ (BOOL)deleteCreditAccountUserActivityForCreditAccountSummaryPID:(id)a3 inDatabase:(id)a4;
+ (id)_accountUserActivityWithQuery:(id)a3;
+ (id)_predicateForAccountSummaryPID:(id)a3;
+ (id)_predicateForAccountUserAltDSID:(id)a3;
+ (id)_propertySettersForAccountUserActivity;
+ (id)_propertyValuesForAccountUserActivity:(id)a3;
+ (id)anyInDatabase:(id)a3 withCreditAccountSummaryPID:(id)a4 accountUserAltDSID:(id)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)creditAccountUserActivityForCreditAccountSummaryPID:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertOrUpdateCreditAccountUserActivity:(id)a3 forCreditAccountSummaryPID:(id)a4 inDatabase:(id)a5;
- (CreditAccountUserActivity)initWithAccountUserActivity:(id)a3 forCreditAccountSummaryPID:(id)a4 inDatabase:(id)a5;
- (id)accountUserActivity;
- (void)updateWithAccountUserAcitivty:(id)a3;
@end

@implementation CreditAccountUserActivity

+ (id)databaseTable
{
  return @"breadfruit";
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

+ (id)insertOrUpdateCreditAccountUserActivity:(id)a3 forCreditAccountSummaryPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v8;
  id v12 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v17 = [v16 accountUserAltDSID];
        id v18 = [a1 anyInDatabase:v10 withCreditAccountSummaryPID:v9 accountUserAltDSID:v17];

        if (v18)
        {
          [v18 updateWithAccountUserAcitivty:v16];
        }
        else
        {
          id v18 = [objc_alloc((Class)a1) initWithAccountUserActivity:v16 forCreditAccountSummaryPID:v9 inDatabase:v10];
          if (!v18) {
            continue;
          }
        }
        v19 = [v18 accountUserActivity];
        [v11 addObject:v19];
      }
      id v13 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v13);
  }

  v20 = objc_msgSend(v11, "pk_setByApplyingBlock:", &stru_100744B58);
  v21 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"b" values:v20];
  v33[0] = v21;
  v22 = [a1 _predicateForAccountSummaryPID:v9];
  v33[1] = v22;
  v23 = +[NSArray arrayWithObjects:v33 count:2];
  v24 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v23];

  v25 = [a1 queryWithDatabase:v10 predicate:v24];
  [v25 deleteAllEntities];
  id v26 = [v11 copy];

  return v26;
}

- (CreditAccountUserActivity)initWithAccountUserActivity:(id)a3 forCreditAccountSummaryPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() _propertyValuesForAccountUserActivity:v10];

  id v12 = [v11 mutableCopy];
  [v12 setObjectOrNull:v9 forKey:@"a"];

  id v13 = [(SQLiteEntity *)self initWithPropertyValues:v12 inDatabase:v8];
  return v13;
}

- (void)updateWithAccountUserAcitivty:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForAccountUserActivity:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)creditAccountUserActivityForCreditAccountSummaryPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountSummaryPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _accountUserActivityWithQuery:v8];

  return v9;
}

+ (id)anyInDatabase:(id)a3 withCreditAccountSummaryPID:(id)a4 accountUserAltDSID:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 _predicateForAccountSummaryPID:a4];
  v16[0] = v10;
  id v11 = [a1 _predicateForAccountUserAltDSID:v8];

  v16[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v16 count:2];
  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];

  uint64_t v14 = [a1 anyInDatabase:v9 predicate:v13];

  return v14;
}

- (id)accountUserActivity
{
  id v3 = objc_alloc_init((Class)PKCreditAccountUserActivity);
  id v4 = [(id)objc_opt_class() _propertySettersForAccountUserActivity];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002A2FEC;
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

+ (BOOL)deleteCreditAccountUserActivityForCreditAccountSummaryPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForAccountSummaryPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  LOBYTE(v7) = [v8 deleteAllEntities];
  return (char)v7;
}

+ (id)_predicateForAccountSummaryPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_predicateForAccountUserAltDSID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:a3];
}

+ (id)_accountUserActivityWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _propertySettersForAccountUserActivity];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  id v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002A3238;
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

+ (id)_propertyValuesForAccountUserActivity:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 accountUserAltDSID];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  id v6 = [v3 purchases];
  id v7 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v7 forKey:@"c"];

  id v8 = [v3 pendingPurchases];
  id v9 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v9 forKey:@"d"];

  id v10 = [v3 rewardsBalance];
  id v11 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v11 forKey:@"e"];

  id v12 = [v3 rewardsEarned];
  id v13 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v13 forKey:@"f"];

  id v14 = [v3 rewardsRedeemed];
  id v15 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v15 forKey:@"g"];

  v16 = [v3 adjustedPurchases];

  v17 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v17 forKey:@"h"];

  id v18 = [v4 copy];
  return v18;
}

+ (id)_propertySettersForAccountUserActivity
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100744B98;
  v5[1] = &stru_100744BB8;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_100744BD8;
  v5[3] = &stru_100744BF8;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_100744C18;
  v5[5] = &stru_100744C38;
  v4[6] = @"h";
  v5[6] = &stru_100744C58;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  return v2;
}

@end