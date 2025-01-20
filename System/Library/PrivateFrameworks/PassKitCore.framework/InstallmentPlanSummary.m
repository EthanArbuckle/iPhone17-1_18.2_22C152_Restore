@interface InstallmentPlanSummary
+ (id)_predicateForInstallmentPlanPID:(id)a3;
+ (id)_propertySetters;
+ (id)_propertyValuesForInstallmentPlanSummary:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateSummary:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
+ (id)summaryForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
+ (void)deleteSummaryForInstallmentPlanPID:(id)a3 inDatabase:(id)a4;
- (InstallmentPlanSummary)initWithInstallmentPlanSummary:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5;
- (id)summary;
- (void)updateWithSummary:(id)a3;
@end

@implementation InstallmentPlanSummary

+ (id)databaseTable
{
  return @"gojiberry";
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

- (InstallmentPlanSummary)initWithInstallmentPlanSummary:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() _propertyValuesForInstallmentPlanSummary:v10];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  v13 = v12;
  [(SQLiteEntity *)v13 setValue:v9 forProperty:@"a"];

  return v13;
}

+ (void)deleteSummaryForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForInstallmentPlanPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

+ (id)insertOrUpdateSummary:(id)a3 forInstallmentPlanPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 _predicateForInstallmentPlanPID:v9];
  id v12 = [a1 anyInDatabase:v10 predicate:v11];

  if (v12) {
    [v12 updateWithSummary:v8];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithInstallmentPlanSummary:v8 forInstallmentPlanPID:v9 inDatabase:v10];
  }

  return v12;
}

- (void)updateWithSummary:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForInstallmentPlanSummary:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)summaryForInstallmentPlanPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForInstallmentPlanPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 summary];

  return v9;
}

- (id)summary
{
  id v3 = objc_alloc_init((Class)PKInstallmentPlanSummary);
  id v4 = [(id)objc_opt_class() _propertySetters];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002A5634;
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

+ (id)_predicateForInstallmentPlanPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_propertyValuesForInstallmentPlanSummary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 startDate];
  id v6 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v6 forKey:@"b"];

  id v7 = [v3 originalEndDate];
  id v8 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v8 forKey:@"c"];

  id v9 = [v3 currentEndDate];
  id v10 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v10 forKey:@"d"];

  v11 = [v3 currencyCode];
  [v4 setObjectOrNull:v11 forKey:@"e"];

  id v12 = [v3 minimumDue];
  id v13 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v13 forKey:@"f"];

  v14 = [v3 minimumDueDate];
  v15 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v15 forKey:@"g"];

  v16 = [v3 interestCharged];
  v17 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v17 forKey:@"h"];

  v18 = [v3 paymentsToDateAmount];

  v19 = PKCurrencyDecimalToStorageNumber();
  [v4 setObjectOrNull:v19 forKey:@"i"];

  id v20 = [v4 copy];
  return v20;
}

+ (id)_propertySetters
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100744D38;
  v5[1] = &stru_100744D58;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_100744D78;
  v5[3] = &stru_100744D98;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_100744DB8;
  v5[5] = &stru_100744DD8;
  v4[6] = @"h";
  v4[7] = @"i";
  v5[6] = &stru_100744DF8;
  v5[7] = &stru_100744E18;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:8];
  return v2;
}

@end