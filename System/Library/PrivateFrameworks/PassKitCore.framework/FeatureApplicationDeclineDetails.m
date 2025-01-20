@interface FeatureApplicationDeclineDetails
+ (id)_predicateForApplicationPID:(int64_t)a3;
+ (id)_propertySettersForFeatureApplicationDeclineDetails;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)featureApplicationDeclineDetailsForApplicationPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)insertFeatureApplicationDeclineDetails:(id)a3 forApplicationPID:(int64_t)a4 inDatabase:(id)a5;
+ (void)deleteFeatureApplicationDeclineDetailsForApplicationPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)updateFeatureApplicationDeclineDetails:(id)a3 forApplicationPID:(int64_t)a4 inDatabase:(id)a5;
- (FeatureApplicationDeclineDetails)initWithFeatureApplicationDeclineDetails:(id)a3 forApplicationPID:(int64_t)a4 inDatabase:(id)a5;
- (id)featureApplicationDeclineDetails;
- (void)updateWithFeatureApplicationDeclineDetails:(id)a3;
@end

@implementation FeatureApplicationDeclineDetails

+ (id)databaseTable
{
  return @"prune";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  return @"a";
}

- (FeatureApplicationDeclineDetails)initWithFeatureApplicationDeclineDetails:(id)a3 forApplicationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"a"];

  v12 = [v9 declinedTermsIdentifier];

  [v10 setObjectOrNull:v12 forKey:@"b"];
  v13 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];

  v14 = v13;
  return v14;
}

+ (id)insertFeatureApplicationDeclineDetails:(id)a3 forApplicationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [objc_alloc((Class)a1) initWithFeatureApplicationDeclineDetails:v9 forApplicationPID:a4 inDatabase:v8];

  return v10;
}

+ (void)deleteFeatureApplicationDeclineDetailsForApplicationPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForApplicationPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  [v8 deleteFromDatabase];
}

+ (id)featureApplicationDeclineDetailsForApplicationPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForApplicationPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 featureApplicationDeclineDetails];

  return v9;
}

+ (void)updateFeatureApplicationDeclineDetails:(id)a3 forApplicationPID:(int64_t)a4 inDatabase:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  id v9 = [a1 _predicateForApplicationPID:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  if (v10) {
    [v10 updateWithFeatureApplicationDeclineDetails:v12];
  }
  else {
    id v11 = +[FeatureApplicationDeclineDetails insertFeatureApplicationDeclineDetails:v12 forApplicationPID:a4 inDatabase:v8];
  }
}

- (void)updateWithFeatureApplicationDeclineDetails:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v4 declinedTermsIdentifier];

  [v6 setObjectOrNull:v5 forKey:@"b"];
  [(SQLiteEntity *)self setValuesWithDictionary:v6];
}

+ (id)_predicateForApplicationPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:v3];

  return v4;
}

+ (id)_propertySettersForFeatureApplicationDeclineDetails
{
  CFStringRef v4 = @"b";
  v5 = &stru_100754060;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

- (id)featureApplicationDeclineDetails
{
  id v3 = objc_alloc_init((Class)PKFeatureApplicationDeclineDetails);
  CFStringRef v4 = [(id)objc_opt_class() _propertySettersForFeatureApplicationDeclineDetails];
  v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100487798;
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