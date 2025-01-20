@interface AccountPaymentFundingDetailsBankAccount
+ (BOOL)deleteFundingDetailsForAccountFundingSourcePID:(int64_t)a3 inDatabase:(id)a4;
+ (id)_predicateForAccountFundingSourcePID:(int64_t)a3;
+ (id)_predicateForPersistentID:(int64_t)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForFundingDetails:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)fundingDetailsForAccountFundingSourcePID:(int64_t)a3 inDatabase:(id)a4;
+ (id)insertOrUpdateFundingDetails:(id)a3 forAccountFundingSourcePID:(int64_t)a4 inDatabase:(id)a5;
- (AccountPaymentFundingDetailsBankAccount)initWithFundingDetails:(id)a3 forFundingSourcePID:(int64_t)a4 inDatabase:(id)a5;
- (id)_fundingDetails;
- (void)updateFundingDetails:(id)a3;
@end

@implementation AccountPaymentFundingDetailsBankAccount

+ (id)databaseTable
{
  return @"account_funding_details_bank_account";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"account_funding_source_pid";
  }
  else {
    return 0;
  }
}

+ (id)insertOrUpdateFundingDetails:(id)a3 forAccountFundingSourcePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v10 = [a1 _predicateForAccountFundingSourcePID:a4];
    id v11 = [a1 anyInDatabase:v9 predicate:v10];

    if (v11) {
      [v11 updateFundingDetails:v8];
    }
    else {
      id v11 = [objc_alloc((Class)objc_opt_class()) initWithFundingDetails:v8 forFundingSourcePID:a4 inDatabase:v9];
    }
    v12 = [v11 _fundingDetails];
  }
  else
  {
    [a1 deleteFundingDetailsForAccountFundingSourcePID:a4 inDatabase:v9];
    v12 = 0;
  }

  return v12;
}

- (AccountPaymentFundingDetailsBankAccount)initWithFundingDetails:(id)a3 forFundingSourcePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForFundingDetails:v9];
  id v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"account_funding_source_pid"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  v13 = [v9 verificationDetails];

  id v14 = +[AccountFundingSourceVerification insertOrUpdateVerification:v13 forAccountFundingDetailsPID:[(SQLiteEntity *)v12 persistentID] inDatabase:v8];
  return v12;
}

- (void)updateFundingDetails:(id)a3
{
  id v4 = a3;
  id v9 = [(id)objc_opt_class() _propertyValuesForFundingDetails:v4];
  [(SQLiteEntity *)self setValuesWithDictionary:v9];
  v5 = [v4 verificationDetails];

  int64_t v6 = [(SQLiteEntity *)self persistentID];
  v7 = [(SQLiteEntity *)self database];
  id v8 = +[AccountFundingSourceVerification insertOrUpdateVerification:v5 forAccountFundingDetailsPID:v6 inDatabase:v7];
}

+ (id)fundingDetailsForAccountFundingSourcePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountFundingSourcePID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 _fundingDetails];

  return v9;
}

+ (BOOL)deleteFundingDetailsForAccountFundingSourcePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountFundingSourcePID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  unsigned int v9 = +[AccountFundingSourceVerification deleteVerificationForAccountFundingDetailsPID:inDatabase:](AccountFundingSourceVerification, "deleteVerificationForAccountFundingDetailsPID:inDatabase:", [v8 persistentID], v6);
  if (v9) {
    LOBYTE(v9) = [v8 deleteFromDatabase];
  }

  return v9;
}

+ (id)_predicateForAccountFundingSourcePID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"account_funding_source_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPersistentID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:v3];

  return v4;
}

- (id)_fundingDetails
{
  id v3 = objc_alloc_init((Class)PKAccountPaymentFundingDetailsBankAccount);
  id v4 = [(id)objc_opt_class() _propertySetters];
  v5 = [v4 allKeys];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1003B56FC;
  v14[3] = &unk_10072DDD8;
  v14[4] = self;
  id v15 = v4;
  id v6 = v3;
  id v16 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v14];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  unsigned int v9 = [(SQLiteEntity *)self database];
  v10 = +[AccountFundingSourceVerification verificationForAccountFundingDetailsPID:v8 inDatabase:v9];
  [v6 setVerificationDetails:v10];

  id v11 = v16;
  id v12 = v6;

  return v12;
}

+ (id)_propertyValuesForFundingDetails:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 accountIdentifier];
  [v4 setObjectOrNull:v5 forKey:@"account_identifier"];

  id v6 = [v3 accountNumber];
  [v4 setObjectOrNull:v6 forKey:@"account_number"];

  id v7 = [v3 routingNumber];
  [v4 setObjectOrNull:v7 forKey:@"routing_number"];

  int64_t v8 = [v3 name];
  [v4 setObjectOrNull:v8 forKey:@"name"];

  id v9 = [v3 status];
  v10 = +[NSNumber numberWithUnsignedInteger:v9];
  [v4 setObjectOrNull:v10 forKey:@"status"];

  return v4;
}

+ (id)_propertySetters
{
  v4[0] = @"account_identifier";
  v4[1] = @"account_number";
  v5[0] = &stru_10074E148;
  v5[1] = &stru_10074E168;
  v4[2] = @"routing_number";
  v4[3] = @"name";
  v5[2] = &stru_10074E188;
  v5[3] = &stru_10074E1A8;
  v4[4] = @"status";
  v5[4] = &stru_10074E1C8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

@end