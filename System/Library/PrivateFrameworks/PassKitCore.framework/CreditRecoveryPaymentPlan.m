@interface CreditRecoveryPaymentPlan
+ (id)_insertPaymentPlan:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5;
+ (id)_predicateForAccountIdentifier:(id)a3;
+ (id)_propertySettersForCreditRecoveryPaymentPlan;
+ (id)creditRecoveryPaymentPlansForAccountIdentifier:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)propertyValuesForPaymentPlan:(id)a3 accountIdentifier:(id)a4;
+ (id)replaceCreditRecoveryPaymentPlans:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5;
+ (void)deleteCreditRecoveryPaymentPlansForAccountIdentifier:(id)a3 inDatabase:(id)a4;
- (id)creditRecoveryPaymentPlan;
- (void)_updateWithPaymentPlan:(id)a3 accountIdentifier:(id)a4;
@end

@implementation CreditRecoveryPaymentPlan

+ (id)databaseTable
{
  return @"credit_recovery_payment_plan";
}

+ (id)creditRecoveryPaymentPlansForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountIdentifier:a3];
  v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = objc_alloc_init((Class)NSMutableArray);
  CFStringRef v21 = @"ROWID";
  v10 = +[NSArray arrayWithObjects:&v21 count:1];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_10010C330;
  v18 = &unk_10072ED00;
  id v19 = v6;
  id v20 = v9;
  id v11 = v9;
  id v12 = v6;
  [v8 enumeratePersistentIDsAndProperties:v10 usingBlock:&v15];

  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

+ (void)deleteCreditRecoveryPaymentPlansForAccountIdentifier:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForAccountIdentifier:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  [v8 deleteAllEntities];
}

+ (id)replaceCreditRecoveryPaymentPlans:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v7 = a3;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  uint64_t v16 = sub_10010C560;
  v17 = &unk_100733638;
  id v18 = a4;
  id v19 = a5;
  id v20 = v7;
  id v21 = objc_alloc_init((Class)NSMutableArray);
  id v8 = v21;
  id v9 = v7;
  id v10 = v19;
  id v11 = v18;
  sub_10000817C((uint64_t)v10, &v14);
  id v12 = objc_msgSend(v8, "copy", v14, v15, v16, v17);

  return v12;
}

- (void)_updateWithPaymentPlan:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() propertyValuesForPaymentPlan:v7 accountIdentifier:v6];

  [(SQLiteEntity *)self setValuesWithDictionary:v8];
}

+ (id)_insertPaymentPlan:(id)a3 forAccountIdentifier:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  id v12 = [a1 propertyValuesForPaymentPlan:v10 accountIdentifier:v9];

  id v13 = [v11 initWithPropertyValues:v12 inDatabase:v8];
  return v13;
}

+ (id)propertyValuesForPaymentPlan:(id)a3 accountIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  [v7 setObjectOrNull:v5 forKey:@"account_identifier"];

  objc_msgSend(v7, "setBool:forKey:", objc_msgSend(v6, "enrolled"), @"enrolled");
  id v8 = [v6 identifier];
  [v7 setObjectOrNull:v8 forKey:@"identifier"];

  id v9 = [v6 displayName];
  [v7 setObjectOrNull:v9 forKey:@"display_name"];

  id v10 = [v6 enrollmentDate];

  id v11 = (void *)_SQLValueForDate();
  [v7 setObjectOrNull:v11 forKey:@"enrollment_date"];

  return v7;
}

+ (id)_predicateForAccountIdentifier:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"account_identifier" equalToValue:a3];
}

+ (id)_propertySettersForCreditRecoveryPaymentPlan
{
  v4[0] = @"enrolled";
  v4[1] = @"identifier";
  v5[0] = &stru_100737628;
  v5[1] = &stru_100737648;
  v4[2] = @"display_name";
  v4[3] = @"enrollment_date";
  v5[2] = &stru_100737668;
  v5[3] = &stru_100737688;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

- (id)creditRecoveryPaymentPlan
{
  id v3 = objc_alloc_init((Class)PKCreditRecoveryPaymentPlan);
  v4 = [(id)objc_opt_class() _propertySettersForCreditRecoveryPaymentPlan];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10010CB94;
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