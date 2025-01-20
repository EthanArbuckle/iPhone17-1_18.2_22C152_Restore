@interface CreditAccountMergeSummary
+ (BOOL)deleteCreditAccountMergeSummaryForCreditAccountSummaryPID:(id)a3 inDatabase:(id)a4;
+ (id)_predicateForAccountSummaryPID:(id)a3;
+ (id)_propertySettersForCreditAccountMergeSummary;
+ (id)_propertyValuesForCreditAccountMergeSummary:(id)a3;
+ (id)anyInDatabase:(id)a3 forCreditAccountSummaryPID:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)creditAccountMergeSummaryForCreditAccountSummaryPID:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)insertOrUpdateCreditAccountMergeSummary:(id)a3 forCreditAccountSummaryPID:(id)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (CreditAccountMergeSummary)initWithCreditAccountMergeSummary:(id)a3 forCreditAccountSummaryPID:(id)a4 inDatabase:(id)a5;
- (id)creditAccountMergeSummary;
- (void)updateWithCreditAccountMergeSummary:(id)a3;
@end

@implementation CreditAccountMergeSummary

+ (id)databaseTable
{
  return @"credit_account_merge_summary";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"credit_account_summary_pid";
  }
  else {
    return 0;
  }
}

+ (id)insertOrUpdateCreditAccountMergeSummary:(id)a3 forCreditAccountSummaryPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v11 = [a1 anyInDatabase:v10 forCreditAccountSummaryPID:v9];
    if (v11)
    {
      id v12 = v11;
      [v11 updateWithCreditAccountMergeSummary:v8];
    }
    else
    {
      id v12 = [objc_alloc((Class)a1) initWithCreditAccountMergeSummary:v8 forCreditAccountSummaryPID:v9 inDatabase:v10];
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (CreditAccountMergeSummary)initWithCreditAccountMergeSummary:(id)a3 forCreditAccountSummaryPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [(id)objc_opt_class() _propertyValuesForCreditAccountMergeSummary:v8];
  id v12 = [v11 mutableCopy];

  [v12 setObjectOrNull:v10 forKey:@"credit_account_summary_pid"];
  v13 = [(SQLiteEntity *)self initWithPropertyValues:v12 inDatabase:v9];
  v14 = v13;
  if (v13)
  {
    v15 = +[NSNumber numberWithLongLong:[(SQLiteEntity *)v13 persistentID]];
    v16 = [v8 accountDetails];
    id v17 = +[CreditAccountMergeSummaryAccountDetails insertOrUpdateMergeSummaryAccountDetails:v16 forMergeSummaryPID:v15 inDatabase:v9];
  }
  return v14;
}

- (void)updateWithCreditAccountMergeSummary:(id)a3
{
  id v4 = a3;
  id v9 = [(id)objc_opt_class() _propertyValuesForCreditAccountMergeSummary:v4];
  [(SQLiteEntity *)self setValuesWithDictionary:v9];
  v5 = +[NSNumber numberWithLongLong:[(SQLiteEntity *)self persistentID]];
  v6 = [(SQLiteEntity *)self database];
  v7 = [v4 accountDetails];

  id v8 = +[CreditAccountMergeSummaryAccountDetails insertOrUpdateMergeSummaryAccountDetails:v7 forMergeSummaryPID:v5 inDatabase:v6];
}

+ (id)anyInDatabase:(id)a3 forCreditAccountSummaryPID:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForAccountSummaryPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)creditAccountMergeSummaryForCreditAccountSummaryPID:(id)a3 inDatabase:(id)a4
{
  id v4 = [a1 anyInDatabase:a4 forCreditAccountSummaryPID:a3];
  v5 = [v4 creditAccountMergeSummary];

  return v5;
}

+ (BOOL)deleteCreditAccountMergeSummaryForCreditAccountSummaryPID:(id)a3 inDatabase:(id)a4
{
  id v4 = [a1 anyInDatabase:a4 forCreditAccountSummaryPID:a3];
  unsigned __int8 v5 = [v4 deleteFromDatabase];

  return v5;
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = +[NSNumber numberWithLongLong:[(SQLiteEntity *)self persistentID]];
  id v4 = [(SQLiteEntity *)v2 database];
  +[CreditAccountMergeSummaryAccountDetails deleteMergeSummaryAccountDetailsForMergeSummaryPID:v3 inDatabase:v4];
  v6.receiver = v2;
  v6.super_class = (Class)CreditAccountMergeSummary;
  LOBYTE(v2) = [(SQLiteEntity *)&v6 deleteFromDatabase];

  return (char)v2;
}

- (id)creditAccountMergeSummary
{
  id v3 = objc_alloc_init((Class)PKCreditAccountMergeSummary);
  id v4 = [(id)objc_opt_class() _propertySettersForCreditAccountMergeSummary];
  unsigned __int8 v5 = [v4 allKeys];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002326B0;
  v13[3] = &unk_10072DDD8;
  v13[4] = self;
  id v14 = v4;
  id v6 = v3;
  id v15 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v13];

  id v8 = +[NSNumber numberWithLongLong:[(SQLiteEntity *)self persistentID]];
  id v9 = [(SQLiteEntity *)self database];
  id v10 = +[CreditAccountMergeSummaryAccountDetails mergeSummaryAccountDetailsForMergeSummaryPID:v8 inDatabase:v9];
  [v6 setAccountDetails:v10];

  id v11 = v6;
  return v11;
}

+ (id)_predicateForAccountSummaryPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"credit_account_summary_pid" equalToValue:a3];
}

+ (id)_propertyValuesForCreditAccountMergeSummary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned __int8 v5 = [v3 mergeDate];
  id v6 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v6 forKey:@"merge_date"];

  id v7 = [v3 totalBalance];

  id v8 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v8 forKey:@"total_balance"];

  id v9 = [v4 copy];
  return v9;
}

+ (id)_propertySettersForCreditAccountMergeSummary
{
  v4[0] = @"merge_date";
  v4[1] = @"total_balance";
  v5[0] = &stru_100741B20;
  v5[1] = &stru_100741B40;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

@end