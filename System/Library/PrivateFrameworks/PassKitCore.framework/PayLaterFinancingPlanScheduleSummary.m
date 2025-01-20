@interface PayLaterFinancingPlanScheduleSummary
+ (id)_predicateForFinancingPlanPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterFinancingPlanScheduleSummary;
+ (id)_propertyValuesForPayLaterScheduleSummary:(id)a3;
+ (id)anyInDatabase:(id)a3 forFinancingPlanPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterFinancingPlanScheduleSummary:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deletePayLaterFinancingPlanScheduleSummaryForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterFinancingPlanScheduleSummary)initWithPayLaterFinancingPlanScheduleSummary:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
- (id)scheduleSummary;
- (void)updateWithPayLaterFinancingPlanScheduleSummary:(id)a3;
@end

@implementation PayLaterFinancingPlanScheduleSummary

+ (id)databaseTable
{
  return @"asparagus";
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

- (PayLaterFinancingPlanScheduleSummary)initWithPayLaterFinancingPlanScheduleSummary:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForPayLaterScheduleSummary:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v12;
}

+ (id)insertOrUpdatePayLaterFinancingPlanScheduleSummary:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a1 _predicateForFinancingPlanPID:a4];
  id v11 = [a1 anyInDatabase:v9 predicate:v10];

  if (v11) {
    [v11 updateWithPayLaterFinancingPlanScheduleSummary:v8];
  }
  else {
    id v11 = [objc_alloc((Class)a1) initWithPayLaterFinancingPlanScheduleSummary:v8 forFinancingPlanPID:a4 inDatabase:v9];
  }
  v12 = [v8 payments];
  id v13 = +[PayLaterPayment insertOrUpdatePayLaterPayments:forScheduleSummaryPID:inDatabase:](PayLaterPayment, "insertOrUpdatePayLaterPayments:forScheduleSummaryPID:inDatabase:", v12, [v11 persistentID], v9);

  v14 = [v8 installments];
  id v15 = +[PayLaterInstallment insertOrUpdatePayLaterInstallments:forScheduleSummaryPID:inDatabase:](PayLaterInstallment, "insertOrUpdatePayLaterInstallments:forScheduleSummaryPID:inDatabase:", v14, [v11 persistentID], v9);

  return v11;
}

- (void)updateWithPayLaterFinancingPlanScheduleSummary:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForPayLaterScheduleSummary:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)anyInDatabase:(id)a3 forFinancingPlanPID:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForFinancingPlanPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (void)deletePayLaterFinancingPlanScheduleSummaryForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForFinancingPlanPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(SQLiteEntity *)self persistentID];
  id v4 = [(SQLiteEntity *)self database];
  +[PayLaterInstallment deletePayLaterInstallmentsForScheduleSummaryPID:v3 inDatabase:v4];

  int64_t v5 = [(SQLiteEntity *)self persistentID];
  id v6 = [(SQLiteEntity *)self database];
  +[PayLaterPayment deletePayLaterPaymentsForScheduleSummaryPID:v5 inDatabase:v6];

  v8.receiver = self;
  v8.super_class = (Class)PayLaterFinancingPlanScheduleSummary;
  return [(SQLiteEntity *)&v8 deleteFromDatabase];
}

- (id)scheduleSummary
{
  id v3 = objc_alloc_init((Class)PKPayLaterFinancingPlanScheduleSummary);
  id v4 = [(id)objc_opt_class() _propertySettersForPayLaterFinancingPlanScheduleSummary];
  int64_t v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008B57C;
  v11[3] = &unk_10072DDD8;
  v11[4] = self;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  objc_super v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_predicateForFinancingPlanPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertyValuesForPayLaterScheduleSummary:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 scheduleSummaryReason];

  [v4 setInteger:v5 forKey:@"b"];
  return v4;
}

+ (id)_propertySettersForPayLaterFinancingPlanScheduleSummary
{
  CFStringRef v4 = @"b";
  id v5 = &stru_100732B00;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

@end