@interface AccountAdditionalPushTopics
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForAccountAdditionalPushTopics;
+ (id)accountAdditionalPushTopicsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertAccountAdditionalPushTopics:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteAccountAdditionalPushTopicsForAccountPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateAccountAdditionalPushTopics:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (AccountAdditionalPushTopics)initWithAccountAdditionalPushTopics:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5;
- (id)accountAdditionalPushTopics;
- (void)updateWithAccountAdditionalPushTopics:(id)a3;
@end

@implementation AccountAdditionalPushTopics

+ (id)databaseTable
{
  return @"plum";
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

+ (id)accountAdditionalPushTopicsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  v8 = [a1 anyInDatabase:v6 predicate:v7];

  v9 = [v8 accountAdditionalPushTopics];

  return v9;
}

- (AccountAdditionalPushTopics)initWithAccountAdditionalPushTopics:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSMutableDictionary dictionary];
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [v9 account];
  [v10 setObjectOrNull:v12 forKey:@"b"];

  v13 = [v9 extendedAccount];
  [v10 setObjectOrNull:v13 forKey:@"c"];

  v14 = [v9 payments];
  [v10 setObjectOrNull:v14 forKey:@"d"];

  v15 = [v9 users];
  [v10 setObjectOrNull:v15 forKey:@"e"];

  v16 = [v9 sharedAccountCloudStore];
  [v10 setObjectOrNull:v16 forKey:@"f"];

  v17 = [v9 applications];
  [v10 setObjectOrNull:v17 forKey:@"g"];

  v18 = [v9 financingPlans];
  [v10 setObjectOrNull:v18 forKey:@"pu"];

  v19 = [v9 physicalCards];
  [v10 setObjectOrNull:v19 forKey:@"physical_cards"];

  v20 = [v9 virtualCards];
  [v10 setObjectOrNull:v20 forKey:@"virtual_cards"];

  v21 = [v9 servicingToken];
  [v10 setObjectOrNull:v21 forKey:@"servicing_token"];

  v22 = [v9 fundingSources];
  [v10 setObjectOrNull:v22 forKey:@"funding_sources"];

  v23 = [v9 creditRecoveryPaymentPlans];

  [v10 setObjectOrNull:v23 forKey:@"recovery_payment_plans"];
  v24 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];

  return v24;
}

+ (id)insertAccountAdditionalPushTopics:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithAccountAdditionalPushTopics:v9 forAccountPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteAccountAdditionalPushTopicsForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

+ (void)updateAccountAdditionalPushTopics:(id)a3 forAccountPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [a1 _predicateForAccountPID:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  if (v10) {
    [v10 updateWithAccountAdditionalPushTopics:v12];
  }
  else {
    id v11 = +[AccountAdditionalPushTopics insertAccountAdditionalPushTopics:v12 forAccountPID:a4 inDatabase:v8];
  }
}

- (void)updateWithAccountAdditionalPushTopics:(id)a3
{
  id v4 = a3;
  id v17 = +[NSMutableDictionary dictionary];
  v5 = [v4 account];
  [v17 setObjectOrNull:v5 forKey:@"b"];

  id v6 = [v4 extendedAccount];
  [v17 setObjectOrNull:v6 forKey:@"c"];

  v7 = [v4 payments];
  [v17 setObjectOrNull:v7 forKey:@"d"];

  id v8 = [v4 users];
  [v17 setObjectOrNull:v8 forKey:@"e"];

  id v9 = [v4 sharedAccountCloudStore];
  [v17 setObjectOrNull:v9 forKey:@"f"];

  id v10 = [v4 applications];
  [v17 setObjectOrNull:v10 forKey:@"g"];

  id v11 = [v4 financingPlans];
  [v17 setObjectOrNull:v11 forKey:@"pu"];

  id v12 = [v4 physicalCards];
  [v17 setObjectOrNull:v12 forKey:@"physical_cards"];

  v13 = [v4 virtualCards];
  [v17 setObjectOrNull:v13 forKey:@"virtual_cards"];

  v14 = [v4 servicingToken];
  [v17 setObjectOrNull:v14 forKey:@"servicing_token"];

  v15 = [v4 fundingSources];
  [v17 setObjectOrNull:v15 forKey:@"funding_sources"];

  v16 = [v4 creditRecoveryPaymentPlans];

  [v17 setObjectOrNull:v16 forKey:@"recovery_payment_plans"];
  [(SQLiteEntity *)self setValuesWithDictionary:v17];
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForAccountAdditionalPushTopics
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100738560;
  v5[1] = &stru_100738580;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_1007385A0;
  v5[3] = &stru_1007385C0;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_1007385E0;
  v5[5] = &stru_100738600;
  v4[6] = @"pu";
  v4[7] = @"physical_cards";
  v5[6] = &stru_100738620;
  v5[7] = &stru_100738640;
  v4[8] = @"virtual_cards";
  v4[9] = @"servicing_token";
  v5[8] = &stru_100738660;
  v5[9] = &stru_100738680;
  v4[10] = @"funding_sources";
  v4[11] = @"recovery_payment_plans";
  v5[10] = &stru_1007386A0;
  v5[11] = &stru_1007386C0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:12];
  return v2;
}

- (id)accountAdditionalPushTopics
{
  id v3 = objc_alloc_init((Class)PKAccountAdditionalPushTopics);
  id v4 = [(id)objc_opt_class() _propertySettersForAccountAdditionalPushTopics];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10011A0E4;
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

@end