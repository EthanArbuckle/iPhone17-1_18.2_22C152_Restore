@interface AccountFundingSourceVerificationAttempt
+ (BOOL)deleteVerificationAttemptForPID:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForPersistentID:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForVerificationAttempt:(id)a3;
+ (id)_verificationActionsWithQuery:(id)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateVerificationAttempt:(id)a3 forPID:(id)a4 inDatabase:(id)a5;
+ (id)verificationAttemptForPID:(id)a3 inDatabase:(id)a4;
- (id)_verificationAttempt;
@end

@implementation AccountFundingSourceVerificationAttempt

+ (id)databaseTable
{
  return @"account_funding_source_verification_attempt";
}

+ (id)insertOrUpdateVerificationAttempt:(id)a3 forPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    v11 = [a1 _predicateForPersistentID:v9];
    id v12 = [a1 anyInDatabase:v10 predicate:v11];
  }
  else
  {
    id v12 = 0;
  }
  v13 = [a1 _propertyValuesForVerificationAttempt:v8];
  if (v12) {
    [v12 setValuesWithDictionary:v13];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithPropertyValues:v13 inDatabase:v10];
  }

  return v12;
}

+ (id)verificationAttemptForPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPersistentID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _verificationActionsWithQuery:v8];
  id v10 = [v9 firstObject];

  return v10;
}

+ (BOOL)deleteVerificationAttemptForPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForPersistentID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  LOBYTE(v7) = [v8 deleteAllEntities];
  return (char)v7;
}

+ (id)_predicateForPersistentID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:a3];
}

- (id)_verificationAttempt
{
  id v3 = objc_alloc_init((Class)PKAccountFundingSourceVerificationAttempt);
  v4 = [(id)objc_opt_class() _propertySetters];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100135A10;
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

+ (id)_verificationActionsWithQuery:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100135B74;
  v7[3] = &unk_1007396C8;
  id v10 = a1;
  id v8 = a3;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v9 = v3;
  id v4 = v8;
  [v4 enumeratePersistentIDsUsingBlock:v7];
  if ([v3 count]) {
    id v5 = [v3 copy];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

+ (id)_propertyValuesForVerificationAttempt:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 type]);
  [v4 setObjectOrNull:v5 forKey:@"type"];

  id v6 = [v3 sentDate];
  id v7 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v7 forKey:@"sent_date"];

  id v8 = [v3 expiryDate];
  id v9 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v9 forKey:@"expiry_date"];

  id v10 = [v3 failureReason];
  v11 = +[NSNumber numberWithUnsignedInteger:v10];
  [v4 setObjectOrNull:v11 forKey:@"failure_reason"];

  return v4;
}

+ (id)_propertySetters
{
  v4[0] = @"type";
  v4[1] = @"sent_date";
  v5[0] = &stru_100739708;
  v5[1] = &stru_100739728;
  v4[2] = @"expiry_date";
  v4[3] = @"failure_reason";
  v5[2] = &stru_100739748;
  v5[3] = &stru_100739768;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

@end