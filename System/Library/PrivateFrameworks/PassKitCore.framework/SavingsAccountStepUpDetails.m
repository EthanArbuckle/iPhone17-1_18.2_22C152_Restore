@interface SavingsAccountStepUpDetails
+ (id)_commonDictionaryForStepUpDetails:(id)a3;
+ (id)_predicateForSavingsAccountDetailsPID:(int64_t)a3;
+ (id)_propertySettersForSavingsStepUpDetails;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertSavingsAccountStepUpDetails:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
+ (id)savingsAccountStepUpDetailsForSavingsAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteSavingsAccountStepUpForSavingsAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateSavingsAccountStepUpDetails:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (SavingsAccountStepUpDetails)initWithSavingsAccountStepUpDetails:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5;
- (id)savingsAccountStepUpDetails;
- (void)updateWithSavingsAccountStepUpDetails:(id)a3;
@end

@implementation SavingsAccountStepUpDetails

+ (id)databaseTable
{
  return @"savings_account_step_up_details";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"details_pid";
  }
  else {
    return 0;
  }
}

- (SavingsAccountStepUpDetails)initWithSavingsAccountStepUpDetails:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _commonDictionaryForStepUpDetails:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"details_pid"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  v13 = v12;

  return v13;
}

+ (id)insertSavingsAccountStepUpDetails:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithSavingsAccountStepUpDetails:v9 forSavingsAccountDetailsPID:a4 inDatabase:v8];

  return v10;
}

+ (id)savingsAccountStepUpDetailsForSavingsAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForSavingsAccountDetailsPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 savingsAccountStepUpDetails];

  return v9;
}

+ (void)updateSavingsAccountStepUpDetails:(id)a3 forSavingsAccountDetailsPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [a1 _predicateForSavingsAccountDetailsPID:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  if (v10) {
    [v10 updateWithSavingsAccountStepUpDetails:v12];
  }
  else {
    id v11 = +[SavingsAccountStepUpDetails insertSavingsAccountStepUpDetails:v12 forSavingsAccountDetailsPID:a4 inDatabase:v8];
  }
}

- (void)updateWithSavingsAccountStepUpDetails:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _commonDictionaryForStepUpDetails:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (void)deleteSavingsAccountStepUpForSavingsAccountDetailsPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForSavingsAccountDetailsPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

- (id)savingsAccountStepUpDetails
{
  id v3 = objc_alloc_init((Class)PKSavingsAccountStepUpDetails);
  id v4 = [(id)objc_opt_class() _propertySettersForSavingsStepUpDetails];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10027B99C;
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

+ (id)_predicateForSavingsAccountDetailsPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"details_pid" equalToValue:v3];

  return v4;
}

+ (id)_commonDictionaryForStepUpDetails:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 thresholdExceeded]);
  [v4 setObjectOrNull:v5 forKey:@"threshold_exceeded"];

  id v6 = [v3 neededBy];

  id v7 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v7 forKey:@"needed_by"];

  return v4;
}

+ (id)_propertySettersForSavingsStepUpDetails
{
  v4[0] = @"threshold_exceeded";
  v4[1] = @"needed_by";
  v5[0] = &stru_100744070;
  v5[1] = &stru_100744090;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

@end