@interface CreditAccountMergeSummaryAccountDetails
+ (BOOL)deleteMergeSummaryAccountDetailsForMergeSummaryPID:(id)a3 inDatabase:(id)a4;
+ (id)_accountDetailsWithQuery:(id)a3;
+ (id)_predicateForMergeSummaryPID:(id)a3;
+ (id)_propertySettersForMergeSummaryAccountDetails;
+ (id)_propertyValuesForMergeSummaryAccountDetails:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateMergeSummaryAccountDetails:(id)a3 forMergeSummaryPID:(id)a4 inDatabase:(id)a5;
+ (id)mergeSummaryAccountDetailsForMergeSummaryPID:(id)a3 inDatabase:(id)a4;
- (CreditAccountMergeSummaryAccountDetails)initWithMergeSummaryAccountDetails:(id)a3 forMergeSummaryPID:(id)a4 inDatabase:(id)a5;
- (void)updateWithMergeSummaryAccountDetails:(id)a3;
@end

@implementation CreditAccountMergeSummaryAccountDetails

+ (id)databaseTable
{
  return @"credit_account_merge_summary_account_details";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"credit_account_merge_summary_pid";
  }
  else {
    return 0;
  }
}

+ (id)insertOrUpdateMergeSummaryAccountDetails:(id)a3 forMergeSummaryPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableSet);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v18 = objc_alloc((Class)a1);
        id v19 = objc_msgSend(v18, "initWithMergeSummaryAccountDetails:forMergeSummaryPID:inDatabase:", v17, v9, v10, (void)v28);
        if (v19) {
          [v11 addObject:v19];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v14);
  }

  v20 = objc_msgSend(v12, "pk_setByApplyingBlock:", &stru_10073DD40);
  v21 = +[SQLiteContainsPredicate doesNotContainPredicateWithProperty:@"account_identifier" values:v20];
  v32[0] = v21;
  v22 = [a1 _predicateForMergeSummaryPID:v9];
  v32[1] = v22;
  v23 = +[NSArray arrayWithObjects:v32 count:2];
  v24 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v23];

  v25 = [a1 queryWithDatabase:v10 predicate:v24];
  [v25 deleteAllEntities];
  id v26 = [v11 copy];

  return v26;
}

- (CreditAccountMergeSummaryAccountDetails)initWithMergeSummaryAccountDetails:(id)a3 forMergeSummaryPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() _propertyValuesForMergeSummaryAccountDetails:v10];

  id v12 = [v11 mutableCopy];
  [v12 setObjectOrNull:v9 forKey:@"credit_account_merge_summary_pid"];

  id v13 = [(SQLiteEntity *)self initWithPropertyValues:v12 inDatabase:v8];
  return v13;
}

- (void)updateWithMergeSummaryAccountDetails:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForMergeSummaryAccountDetails:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)mergeSummaryAccountDetailsForMergeSummaryPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForMergeSummaryPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _accountDetailsWithQuery:v8];

  return v9;
}

+ (BOOL)deleteMergeSummaryAccountDetailsForMergeSummaryPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForMergeSummaryPID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  LOBYTE(v7) = [v8 deleteAllEntities];
  return (char)v7;
}

+ (id)_predicateForMergeSummaryPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"credit_account_merge_summary_pid" equalToValue:a3];
}

+ (id)_accountDetailsWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _propertySettersForMergeSummaryAccountDetails];
  id v6 = objc_alloc_init((Class)NSMutableSet);
  v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001CC024;
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

+ (id)_propertyValuesForMergeSummaryAccountDetails:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 accountIdentifier];
  [v4 setObjectOrNull:v5 forKey:@"account_identifier"];

  id v6 = [v3 ownerAltDSID];
  [v4 setObjectOrNull:v6 forKey:@"owner_alt_dsid"];

  v7 = [v3 statementBalance];
  id v8 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v8 forKey:@"statement_balance"];

  id v9 = [v3 currentBalance];

  id v10 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v10 forKey:@"current_balance"];

  id v11 = [v4 copy];
  return v11;
}

+ (id)_propertySettersForMergeSummaryAccountDetails
{
  v4[0] = @"account_identifier";
  v4[1] = @"owner_alt_dsid";
  v5[0] = &stru_10073DD80;
  v5[1] = &stru_10073DDA0;
  v4[2] = @"statement_balance";
  v4[3] = @"current_balance";
  v5[2] = &stru_10073DDC0;
  v5[3] = &stru_10073DDE0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

@end