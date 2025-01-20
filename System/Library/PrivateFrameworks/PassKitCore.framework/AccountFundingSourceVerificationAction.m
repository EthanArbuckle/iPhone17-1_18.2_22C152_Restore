@interface AccountFundingSourceVerificationAction
+ (BOOL)deleteVerificationActionsForAccountFundingSourceVerificationPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)_predicateForFundingSourceVerificationPID:(int64_t)a3;
+ (id)_predicateForPersistentID:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForVerificationAction:(id)a3;
+ (id)_verificationActionsWithQuery:(id)a3;
+ (id)_verificationOptionsFromString:(id)a3;
+ (id)_verificationOptionsToString:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateVerificationActions:(id)a3 forAccountFundingSourceVerificationPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)verificationActionsForFundingSourceVerificationPID:(int64_t)a3 inDatabase:(id)a4;
- (AccountFundingSourceVerificationAction)initWithVerificationAction:(id)a3 forAccountFundingSourceVerificationPID:(int64_t)a4 inDatabase:(id)a5;
- (id)_verificationAction;
@end

@implementation AccountFundingSourceVerificationAction

+ (id)databaseTable
{
  return @"account_funding_source_verification_action";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"account_funding_source_verification_pid";
  }
  else {
    return 0;
  }
}

+ (id)insertOrUpdateVerificationActions:(id)a3 forAccountFundingSourceVerificationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a1 _predicateForFundingSourceVerificationPID:a4];
  v11 = [a1 queryWithDatabase:v9 predicate:v10];

  v22 = v11;
  [v11 deleteAllEntities];
  id v12 = objc_alloc_init((Class)NSMutableArray);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v8;
  id v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = [objc_alloc((Class)a1) initWithVerificationAction:*(void *)(*((void *)&v23 + 1) + 8 * i) forAccountFundingSourceVerificationPID:a4 inDatabase:v9];
        v19 = [v18 _verificationAction];
        [v12 safelyAddObject:v19];
      }
      id v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  if ([v12 count]) {
    id v20 = [v12 copy];
  }
  else {
    id v20 = 0;
  }

  return v20;
}

- (AccountFundingSourceVerificationAction)initWithVerificationAction:(id)a3 forAccountFundingSourceVerificationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForVerificationAction:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"account_funding_source_verification_pid"];

  id v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v12;
}

+ (id)verificationActionsForFundingSourceVerificationPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForFundingSourceVerificationPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _verificationActionsWithQuery:v8];

  return v9;
}

+ (BOOL)deleteVerificationActionsForAccountFundingSourceVerificationPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForFundingSourceVerificationPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  LOBYTE(v7) = [v8 deleteAllEntities];
  return (char)v7;
}

+ (id)_predicateForFundingSourceVerificationPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"account_funding_source_verification_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPersistentID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:a3];
}

- (id)_verificationAction
{
  id v3 = objc_alloc_init((Class)PKAccountFundingSourceVerificationAction);
  v4 = [(id)objc_opt_class() _propertySetters];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002B6B04;
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
  v7[2] = sub_1002B6C68;
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

+ (id)_propertyValuesForVerificationAction:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 type]);
  [v5 setObjectOrNull:v6 forKey:@"type"];

  id v7 = [v4 verificationOptions];

  id v8 = [a1 _verificationOptionsToString:v7];
  [v5 setObjectOrNull:v8 forKey:@"verification_options"];

  return v5;
}

+ (id)_verificationOptionsToString:(id)a3
{
  id v3 = objc_msgSend(a3, "pk_arrayByApplyingBlock:", &stru_100745BF8);
  id v4 = [v3 componentsJoinedByString:@","];

  return v4;
}

+ (id)_verificationOptionsFromString:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@","];
  id v4 = objc_msgSend(v3, "pk_arrayByApplyingBlock:", &stru_100745C18);

  return v4;
}

+ (id)_propertySetters
{
  v7[0] = &stru_100745C58;
  v6[0] = @"type";
  v6[1] = @"verification_options";
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002B7080;
  v5[3] = &unk_100745C78;
  v5[4] = a1;
  v2 = objc_retainBlock(v5);
  v7[1] = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v3;
}

@end