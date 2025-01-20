@interface PayLaterFinancingPlanTermsDetails
+ (id)_predicateForFinancingPlanPID:(int64_t)a3;
+ (id)_propertySettersForPayLaterFinancingPlanTermsDetails;
+ (id)_propertyValuesForPayLaterTermsDetails:(id)a3;
+ (id)anyInDatabase:(id)a3 forFinancingPlanPID:(int64_t)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdatePayLaterFinancingPlanTermsDetails:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deletePayLaterFinancingPlanTermsDetailsForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PayLaterFinancingPlanTermsDetails)initWithPayLaterFinancingPlanTermsDetails:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5;
- (id)termsDetails;
- (void)updateWithPayLaterFinancingPlanTermsDetails:(id)a3;
@end

@implementation PayLaterFinancingPlanTermsDetails

+ (id)databaseTable
{
  return @"parsnip";
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

- (PayLaterFinancingPlanTermsDetails)initWithPayLaterFinancingPlanTermsDetails:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(id)objc_opt_class() _propertyValuesForPayLaterTermsDetails:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v12;
}

+ (id)insertOrUpdatePayLaterFinancingPlanTermsDetails:(id)a3 forFinancingPlanPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a1 _predicateForFinancingPlanPID:a4];
  id v11 = [a1 anyInDatabase:v9 predicate:v10];

  if (v11) {
    [v11 updateWithPayLaterFinancingPlanTermsDetails:v8];
  }
  else {
    id v11 = [objc_alloc((Class)a1) initWithPayLaterFinancingPlanTermsDetails:v8 forFinancingPlanPID:a4 inDatabase:v9];
  }

  return v11;
}

- (void)updateWithPayLaterFinancingPlanTermsDetails:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForPayLaterTermsDetails:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)anyInDatabase:(id)a3 forFinancingPlanPID:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForFinancingPlanPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (void)deletePayLaterFinancingPlanTermsDetailsForFinancingPlanPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForFinancingPlanPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)PayLaterFinancingPlanTermsDetails;
  return [(SQLiteEntity *)&v3 deleteFromDatabase];
}

- (id)termsDetails
{
  id v3 = objc_alloc_init((Class)PKPayLaterFinancingPlanTermsDetails);
  id v4 = [(id)objc_opt_class() _propertySettersForPayLaterFinancingPlanTermsDetails];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10045DDF0;
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

+ (id)_predicateForFinancingPlanPID:(int64_t)a3
{
  id v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertyValuesForPayLaterTermsDetails:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 installmentAgreementIdentifier];

  [v4 setObjectOrNull:v5 forKey:@"b"];
  return v4;
}

+ (id)_propertySettersForPayLaterFinancingPlanTermsDetails
{
  CFStringRef v4 = @"b";
  id v5 = &stru_100752D60;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

@end