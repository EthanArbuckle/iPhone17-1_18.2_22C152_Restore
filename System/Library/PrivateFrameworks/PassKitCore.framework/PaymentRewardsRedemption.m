@interface PaymentRewardsRedemption
+ (BOOL)rewardsRedemptionExistForPaymentHash:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForOlderThanDate:(id)a3;
+ (id)_predicateForPaymentHash:(id)a3;
+ (id)_predicateForPaymentPass:(id)a3;
+ (id)_predicateForStatus:(unint64_t)a3;
+ (id)_propertySettersForRewardsRedemption;
+ (id)databaseTable;
+ (id)insertOrUpdateRewardsRedemption:(id)a3 withPass:(id)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateRewardsRedemption:(id)a3 withPassUniqueIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)rewardsRedemptionWithPaymentHash:(id)a3 inDatabase:(id)a4;
+ (id)rewardsRedemptionsForPass:(id)a3 limit:(int64_t)a4 inDatabase:(id)a5;
+ (id)rewardsRedemptionsForPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 inDatabase:(id)a5;
+ (id)rewardsRedemptionsForPassUniqueIdentifier:(id)a3 paymentHashes:(id)a4 inDatabase:(id)a5;
+ (void)deleteFailedRewardsRedemptionsOlderThan:(id)a3 inDatabase:(id)a4;
+ (void)deleteRewardsRedemptionsForPass:(id)a3 inDatabase:(id)a4;
+ (void)deleteRewardsRedemptionsForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4;
+ (void)deleteRewardsRedemptionsOlderThan:(id)a3 inDatabase:(id)a4;
+ (void)pruneRewardsRedemptionsInDatabase:(id)a3;
+ (void)pruneRewardsRedemptionsUsingReferenceDate:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PaymentRewardsRedemption)initWithPaymentRewardsRedemption:(id)a3 paymentPass:(id)a4 inDatabase:(id)a5;
- (id)paymentRewardsRedemption;
@end

@implementation PaymentRewardsRedemption

+ (id)databaseTable
{
  return @"dark_chocolate";
}

+ (id)insertOrUpdateRewardsRedemption:(id)a3 withPassUniqueIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = +[Pass anyInDatabase:v9 withUniqueID:a4];
  if (v10)
  {
    v11 = [a1 insertOrUpdateRewardsRedemption:v8 withPass:v10 inDatabase:v9];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)insertOrUpdateRewardsRedemption:(id)a3 withPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 paymentHash];
  if (v11)
  {
    v12 = [a1 rewardsRedemptionWithPaymentHash:v11 inDatabase:v10];
    v13 = v12;
    if (v12
      && [v12 hasOriginalTransactionDetails]
      && ([v8 hasOriginalTransactionDetails] & 1) == 0)
    {
      v14 = [v13 details];
      v15 = [v14 originalTransaction];
      [v8 setOriginalTransactionDetails:v15];
    }
    v16 = [v13 createdAt];
    if (v16) {
      [v8 setCreatedAt:v16];
    }
    v17 = [a1 _predicateForPaymentHash:v11];
    v18 = [a1 queryWithDatabase:v10 predicate:v17];

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1002225A0;
    v28[3] = &unk_100731020;
    id v19 = v10;
    id v29 = v19;
    [v18 enumeratePersistentIDsUsingBlock:v28];
    [v18 deleteAllEntities];
    id v20 = [objc_alloc((Class)a1) initWithPaymentRewardsRedemption:v8 paymentPass:v9 inDatabase:v19];
    v21 = v20;
    if (v20)
    {
      id v22 = [v20 persistentID];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1002225B8;
      v24[3] = &unk_10073DBA0;
      id v25 = v8;
      id v27 = v22;
      id v26 = v19;
      sub_10000817C((uint64_t)v26, v24);
    }
  }
  else
  {
    v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Can't store PaymentRewardsRedemption without paymentHash", buf, 2u);
    }
    v21 = 0;
  }

  return v21;
}

+ (BOOL)rewardsRedemptionExistForPaymentHash:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPaymentHash:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  LOBYTE(v7) = [v8 exists];
  return (char)v7;
}

+ (id)rewardsRedemptionWithPaymentHash:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPaymentHash:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 paymentRewardsRedemption];

  return v9;
}

+ (id)rewardsRedemptionsForPassUniqueIdentifier:(id)a3 paymentHashes:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    v11 = +[Pass anyInDatabase:v10 withUniqueID:v8];
    if (v11)
    {
      id v12 = [v9 mutableCopy];
      v13 = objc_msgSend(v9, "pk_setBySafelyApplyingBlock:", &stru_100741448);
      [v12 unionSet:v13];

      v14 = objc_msgSend(v9, "pk_setBySafelyApplyingBlock:", &stru_100741468);
      [v12 unionSet:v14];

      v15 = [a1 _predicateForPaymentPass:v11];
      v27[0] = v15;
      v16 = +[SQLiteContainsPredicate containsPredicateWithProperty:@"f" values:v12];
      v27[1] = v16;
      v17 = +[NSArray arrayWithObjects:v27 count:2];

      v18 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v17];
      id v19 = [a1 queryWithDatabase:v10 predicate:v18];
      id v20 = objc_alloc_init((Class)NSMutableArray);
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1002229BC;
      v24[3] = &unk_100730E38;
      id v25 = v10;
      id v26 = v20;
      id v21 = v20;
      [v19 enumeratePersistentIDsUsingBlock:v24];
      id v22 = [v21 copy];
    }
    else
    {
      id v22 = &__NSArray0__struct;
    }
  }
  else
  {
    id v22 = &__NSArray0__struct;
  }

  return v22;
}

+ (id)rewardsRedemptionsForPass:(id)a3 limit:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [a1 pruneRewardsRedemptionsInDatabase:v8];
  id v10 = [a1 _predicateForPaymentPass:v9];

  v25[0] = @"h";
  v25[1] = @"g";
  v11 = +[NSArray arrayWithObjects:v25 count:2];
  CFStringRef v24 = @"DESC";
  id v12 = +[NSArray arrayWithObjects:&v24 count:1];
  v13 = [a1 queryWithDatabase:v8 predicate:v10 orderingProperties:v11 orderingDirections:v12 limit:a4];

  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  id v20 = sub_100222C0C;
  id v21 = &unk_100730E38;
  id v22 = v8;
  id v23 = objc_alloc_init((Class)NSMutableArray);
  id v14 = v23;
  id v15 = v8;
  [v13 enumeratePersistentIDsUsingBlock:&v18];
  id v16 = objc_msgSend(v14, "copy", v18, v19, v20, v21);

  return v16;
}

+ (id)rewardsRedemptionsForPassUniqueIdentifier:(id)a3 limit:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = +[Pass anyInDatabase:v8 withUniqueID:a3];
  if (v9)
  {
    id v10 = [a1 rewardsRedemptionsForPass:v9 limit:a4 inDatabase:v8];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (void)pruneRewardsRedemptionsInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate now];
  [a1 pruneRewardsRedemptionsUsingReferenceDate:v5 inDatabase:v4];
}

+ (void)pruneRewardsRedemptionsUsingReferenceDate:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = +[NSCalendar currentCalendar];
  id v8 = objc_alloc_init((Class)NSDateComponents);
  [v8 setDay:-1];
  id v9 = [v12 dateByAddingComponents:v8 toDate:v7 options:0];
  [a1 deleteFailedRewardsRedemptionsOlderThan:v9 inDatabase:v6];
  id v10 = objc_alloc_init((Class)NSDateComponents);
  [v10 setMonth:-1];
  v11 = [v12 dateByAddingComponents:v10 toDate:v7 options:0];

  [a1 deleteRewardsRedemptionsOlderThan:v11 inDatabase:v6];
}

+ (void)deleteRewardsRedemptionsForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPaymentPass:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (void)deleteRewardsRedemptionsForPassUniqueIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v5 = +[Pass anyInDatabase:withUniqueID:](Pass, "anyInDatabase:withUniqueID:");
  if (v5) {
    [a1 deleteRewardsRedemptionsForPass:v5 inDatabase:v6];
  }
}

+ (void)deleteFailedRewardsRedemptionsOlderThan:(id)a3 inDatabase:(id)a4
{
  id v16 = a4;
  id v6 = a3;
  id v7 = [a1 _predicateForStatus:4];
  v17[0] = v7;
  id v8 = [a1 _predicateForStatus:5];
  v17[1] = v8;
  id v9 = [a1 _predicateForStatus:0];
  v17[2] = v9;
  id v10 = +[NSArray arrayWithObjects:v17 count:3];
  v11 = +[SQLiteCompoundPredicate predicateMatchingAnyPredicates:v10];
  v18[0] = v11;
  id v12 = [a1 _predicateForOlderThanDate:v6];

  v18[1] = v12;
  v13 = +[NSArray arrayWithObjects:v18 count:2];
  id v14 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v13];

  id v15 = [a1 queryWithDatabase:v16 predicate:v14];

  [v15 deleteAllEntities];
}

+ (void)deleteRewardsRedemptionsOlderThan:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForOlderThanDate:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  id v4 = [(SQLiteEntity *)self database];
  +[PaymentRewardsRedemptionDetails deletePaymentRewardsRedemptionDetailsForPKPaymentRewardsRedemptionPID:v3 inDatabase:v4];

  v6.receiver = self;
  v6.super_class = (Class)PaymentRewardsRedemption;
  return [(SQLiteEntity *)&v6 deleteFromDatabase];
}

- (id)paymentRewardsRedemption
{
  id v3 = objc_alloc_init((Class)PKPaymentRewardsRedemption);
  id v4 = [(id)objc_opt_class() _propertySettersForRewardsRedemption];
  id v5 = [v4 allKeys];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002233B8;
  v13[3] = &unk_10072DDD8;
  v13[4] = self;
  id v14 = v4;
  id v6 = v3;
  id v15 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v13];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  id v9 = [(SQLiteEntity *)self database];
  id v10 = +[PaymentRewardsRedemptionDetails paymentRewardsRedemptionDetailsForPKPaymentRewardsRedemptionPID:v8 inDatabase:v9];

  [v6 setDetails:v10];
  id v11 = v6;

  return v11;
}

+ (id)_predicateForPaymentPass:(id)a3
{
  id v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPaymentHash:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"f" value:a3 comparisonType:1 collatingStrategy:1];
}

+ (id)_predicateForStatus:(unint64_t)a3
{
  id v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"d" equalToValue:v3];

  return v4;
}

+ (id)_predicateForOlderThanDate:(id)a3
{
  id v3 = (void *)_SQLValueForDate();
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"g" lessThanOrEqualToValue:v3];

  return v4;
}

+ (id)_propertySettersForRewardsRedemption
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_1007414A8;
  v5[1] = &stru_1007414C8;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_1007414E8;
  v5[3] = &stru_100741508;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_100741528;
  v5[5] = &stru_100741548;
  v4[6] = @"h";
  v5[6] = &stru_100741568;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  return v2;
}

- (PaymentRewardsRedemption)initWithPaymentRewardsRedemption:(id)a3 paymentPass:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  id v12 = [v9 persistentID];

  v13 = +[NSNumber numberWithLongLong:v12];
  [v11 setObjectOrNull:v13 forKey:@"pass_pid"];

  id v14 = [v10 identifier];
  [v11 setObjectOrNull:v14 forKey:@"b"];

  id v15 = [v10 balanceIdentifier];
  [v11 setObjectOrNull:v15 forKey:@"c"];

  objc_msgSend(v11, "setInteger:forKey:", objc_msgSend(v10, "status"), @"d");
  id v16 = [v10 statusLink];
  v17 = (void *)_SQLValueForURL();
  [v11 setObjectOrNull:v17 forKey:@"e"];

  v18 = [v10 paymentHash];
  [v11 setObjectOrNull:v18 forKey:@"f"];

  uint64_t v19 = [v10 updatedAt];
  id v20 = (void *)_SQLValueForDate();
  [v11 setObjectOrNull:v20 forKey:@"g"];

  id v21 = [v10 createdAt];

  id v22 = (void *)_SQLValueForDate();
  [v11 setObjectOrNull:v22 forKey:@"h"];

  v25.receiver = self;
  v25.super_class = (Class)PaymentRewardsRedemption;
  id v23 = [(SQLiteEntity *)&v25 initWithPropertyValues:v11 inDatabase:v8];

  return v23;
}

@end