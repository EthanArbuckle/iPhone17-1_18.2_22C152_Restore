@interface PayLaterFinancingPlanFundingSource
+ (id)_predicateForPlanPID:(int64_t)a3;
+ (id)_propertySettersForFundingSource;
+ (id)_propertyValuesForFundingSource:(id)a3;
+ (id)anyInDatabase:(id)a3 forPlanPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (void)deleteFinancingPlanFundingSourceForPlanPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)insertOrUpdateFinancingPlanFundingSource:(id)a3 forPlanPID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (PayLaterFinancingPlanFundingSource)initWithFundingSource:(id)a3 forPlanPID:(int64_t)a4 inDatabase:(id)a5;
- (id)fundingSource;
- (void)updateWithFundingSource:(id)a3;
@end

@implementation PayLaterFinancingPlanFundingSource

+ (id)databaseTable
{
  return @"akebi";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"a";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"b";
  }
  return 0;
}

- (PayLaterFinancingPlanFundingSource)initWithFundingSource:(id)a3 forPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForFundingSource:v9];

  id v11 = [v10 mutableCopy];
  v12 = +[NSNumber numberWithLongLong:a4];
  [v11 setObjectOrNull:v12 forKey:@"a"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v13;
}

+ (void)insertOrUpdateFinancingPlanFundingSource:(id)a3 forPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v15 = a3;
  id v8 = a5;
  id v9 = [a1 _predicateForPlanPID:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  if (v10)
  {
    [v10 updateWithFundingSource:v15];
    id v11 = [v10 valueForProperty:@"b"];
    v12 = +[PayLaterFundingSourceDetails anyInDatabase:v8 forPID:v11];

    if (v12)
    {
      v13 = [v15 details];
      [v12 updateFundingSourceDetails:v13];
      goto LABEL_6;
    }
  }
  else
  {
    id v10 = [objc_alloc((Class)a1) initWithFundingSource:v15 forPlanPID:a4 inDatabase:v8];
  }
  v14 = [v15 details];
  v12 = +[PayLaterFundingSourceDetails insertFundingSourceDetails:v14 inDatabase:v8];

  v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 persistentID]);
  [v10 setValue:v13 forProperty:@"b"];
LABEL_6:
}

- (void)updateWithFundingSource:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForFundingSource:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)anyInDatabase:(id)a3 forPlanPID:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPlanPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (void)deleteFinancingPlanFundingSourceForPlanPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPlanPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = [(SQLiteEntity *)self database];
  id v4 = [(SQLiteEntity *)self valueForProperty:@"b"];
  id v5 = +[PayLaterFundingSourceDetails anyInDatabase:v3 forPID:v4];
  [v5 deleteFromDatabase];

  v7.receiver = self;
  v7.super_class = (Class)PayLaterFinancingPlanFundingSource;
  return [(SQLiteEntity *)&v7 deleteFromDatabase];
}

- (id)fundingSource
{
  id v3 = objc_alloc_init((Class)PKPayLaterFinancingPlanFundingSource);
  id v4 = [(id)objc_opt_class() _propertySettersForFundingSource];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10010B56C;
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

+ (id)_predicateForPlanPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertyValuesForFundingSource:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 identifier];
  [v4 setObjectOrNull:v5 forKey:@"c"];

  objc_msgSend(v4, "setInteger:forKey:", objc_msgSend(v3, "type"), @"d");
  id v6 = [v3 autoPayment];

  [v4 setBool:v6 forKey:@"e"];
  id v7 = [v4 copy];

  return v7;
}

+ (id)_propertySettersForFundingSource
{
  v4[0] = @"c";
  v4[1] = @"d";
  v5[0] = &stru_1007375A8;
  v5[1] = &stru_1007375C8;
  v4[2] = @"e";
  v5[2] = &stru_1007375E8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

@end