@interface PaymentOfferRewardsCriteria
+ (id)_commonDictionaryForRewardsCriteria:(id)a3;
+ (id)_predicateForCatalogPID:(int64_t)a3;
+ (id)_predicateForEligibleCriteriaWithPassTypeIdentifier:(id)a3 passSerialNumber:(id)a4;
+ (id)_predicateForIdentifier:(id)a3;
+ (id)_predicateForPassSerialNumber:(id)a3;
+ (id)_predicateForPassTypeIdentifier:(id)a3;
+ (id)_propertySetters;
+ (id)anyEligiblePaymentOfferRewardsCriteriaInDatabase:(id)a3 withPassTypeIdentifier:(id)a4 passSerialNumber:(id)a5;
+ (id)databaseTable;
+ (id)rewardsCriteriaForCatalogPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deletePaymentOfferRewardsCriteriaForCatalogPID:(int64_t)a3 criteria:(id)a4 inDatabase:(id)a5;
+ (void)deletePaymentOfferRewardsCriteriaForCatalogPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateRewardsCriteria:(id)a3 forCatalogPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
@end

@implementation PaymentOfferRewardsCriteria

+ (id)databaseTable
{
  return @"cowboy";
}

+ (void)insertOrUpdateRewardsCriteria:(id)a3 forCatalogPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  [a1 deletePaymentOfferRewardsCriteriaForCatalogPID:a4 criteria:v8 inDatabase:v9];
  v10 = [a1 _commonDictionaryForRewardsCriteria:v8];
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 safelySetObject:v11 forKey:@"c_pid"];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001B2ABC;
  v15[3] = &unk_100734FC8;
  id v16 = v10;
  id v17 = v9;
  id v18 = v8;
  id v19 = a1;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  sub_10000817C((uint64_t)v13, v15);
}

+ (void)deletePaymentOfferRewardsCriteriaForCatalogPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForCatalogPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (void)deletePaymentOfferRewardsCriteriaForCatalogPID:(int64_t)a3 criteria:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v19 = [v9 identifier];
  v10 = [a1 _predicateForIdentifier:v19];
  v20[0] = v10;
  v11 = [v9 passTypeIdentifier];
  id v12 = [a1 _predicateForPassTypeIdentifier:v11];
  v20[1] = v12;
  id v13 = [v9 passSerialNumber];

  id v14 = [a1 _predicateForPassSerialNumber:v13];
  v20[2] = v14;
  v15 = [a1 _predicateForCatalogPID:a3];
  v20[3] = v15;
  id v16 = +[NSArray arrayWithObjects:v20 count:4];
  id v17 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v16];
  id v18 = [a1 queryWithDatabase:v8 predicate:v17];

  [v18 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  v4 = [(SQLiteEntity *)v2 database];
  +[PaymentOfferCurrencyAmount deletePaymentOfferCurrencyAmountForRewardsCriteriaPID:v3 inDatabase:v4];
  v6.receiver = v2;
  v6.super_class = (Class)PaymentOfferRewardsCriteria;
  LOBYTE(v2) = [(SQLiteEntity *)&v6 deleteFromDatabase];

  return (char)v2;
}

+ (id)rewardsCriteriaForCatalogPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForCatalogPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _propertySetters];
  id v10 = objc_alloc_init((Class)NSMutableArray);
  v11 = [v9 allKeys];
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  id v19 = sub_1001B2F90;
  v20 = &unk_10072DE00;
  id v21 = v9;
  id v22 = v6;
  id v23 = v10;
  id v24 = a1;
  id v12 = v10;
  id v13 = v6;
  id v14 = v9;
  [v8 enumeratePersistentIDsAndProperties:v11 usingBlock:&v17];

  id v15 = objc_msgSend(v12, "copy", v17, v18, v19, v20);
  return v15;
}

+ (id)anyEligiblePaymentOfferRewardsCriteriaInDatabase:(id)a3 withPassTypeIdentifier:(id)a4 passSerialNumber:(id)a5
{
  id v8 = a3;
  id v9 = [a1 _predicateForEligibleCriteriaWithPassTypeIdentifier:a4 passSerialNumber:a5];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  if (v10)
  {
    v11 = [a1 _propertySetters];
    id v12 = objc_alloc_init((Class)PKPaymentOfferRewardsCriteria);
    id v13 = [v11 allKeys];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001B31EC;
    v19[3] = &unk_10073CBC0;
    id v22 = a1;
    id v20 = v11;
    id v14 = v12;
    id v21 = v14;
    id v15 = v11;
    [v10 getValuesForProperties:v13 withApplier:v19];

    id v16 = v21;
    id v17 = v14;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (id)_predicateForCatalogPID:(int64_t)a3
{
  int64_t v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"c_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_predicateForPassTypeIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"e" equalToValue:a3];
}

+ (id)_predicateForPassSerialNumber:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"d" equalToValue:a3];
}

+ (id)_predicateForEligibleCriteriaWithPassTypeIdentifier:(id)a3 passSerialNumber:(id)a4
{
  id v5 = a4;
  id v6 = +[SQLiteComparisonPredicate predicateWithProperty:@"e" equalToValue:a3];
  v7 = +[SQLiteComparisonPredicate predicateWithProperty:@"d" equalToValue:v5];

  id v8 = +[SQLiteComparisonPredicate predicateWithProperty:@"b" equalToValue:&off_10078AFC8];
  v12[0] = v6;
  v12[1] = v7;
  v12[2] = v8;
  id v9 = +[NSArray arrayWithObjects:v12 count:3];
  id v10 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v9];

  return v10;
}

+ (id)_propertySetters
{
  v4[0] = @"a";
  v4[1] = @"b";
  v5[0] = &stru_10073CC00;
  v5[1] = &stru_10073CC20;
  v4[2] = @"c";
  v4[3] = @"d";
  v5[2] = &stru_10073CC40;
  v5[3] = &stru_10073CC60;
  v4[4] = @"e";
  v4[5] = @"i";
  v5[4] = &stru_10073CC80;
  v5[5] = &stru_10073CCA0;
  v4[6] = @"h";
  v4[7] = @"f";
  v5[6] = &stru_10073CCC0;
  v5[7] = &stru_10073CCE0;
  v4[8] = @"ma";
  v4[9] = @"mb";
  v5[8] = &stru_10073CD00;
  v5[9] = &stru_10073CD20;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:10];
  return v2;
}

+ (id)_commonDictionaryForRewardsCriteria:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"a"];

  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 eligibility]);
  [v4 setObjectOrNull:v6 forKey:@"b"];

  v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 type]);
  [v4 setObjectOrNull:v7 forKey:@"c"];

  id v8 = [v3 passSerialNumber];
  [v4 setObjectOrNull:v8 forKey:@"d"];

  id v9 = [v3 passTypeIdentifier];
  [v4 setObjectOrNull:v9 forKey:@"e"];

  id v10 = [v3 fpanIdentifier];
  [v4 setObjectOrNull:v10 forKey:@"i"];

  v11 = [v3 redemptionTermsURL];
  id v12 = (void *)_SQLValueForURL();
  [v4 setObjectOrNull:v12 forKey:@"h"];

  id v13 = [v3 supportedCurrencyCodes];
  id v14 = [v13 allObjects];
  id v15 = [v14 componentsJoinedByString:@","];
  [v4 setObjectOrNull:v15 forKey:@"f"];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "supportedDeferredPayments"), @"ma");
  id v16 = [v3 supportedRecurringPayments];

  [v4 setBool:v16 forKey:@"mb"];
  return v4;
}

@end