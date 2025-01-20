@interface FeatureApplicationInvitationDetails
+ (id)_predicateForApplicationPID:(id)a3;
+ (id)_propertySettersForFeatureApplicationInvitationDetails;
+ (id)_propertyValuesForFeatureApplicationInvitationDetails:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)featureApplicationInvitationDetailsForApplicationPID:(id)a3 inDatabase:(id)a4;
+ (id)insertFeatureApplicationInvitationDetails:(id)a3 forApplicationPID:(id)a4 inDatabase:(id)a5;
+ (void)deleteFeatureApplicationInvitationDetailsForApplicationPID:(id)a3 inDatabase:(id)a4;
+ (void)updateFeatureApplicationInvitationDetails:(id)a3 forApplicationPID:(id)a4 inDatabase:(id)a5;
- (FeatureApplicationInvitationDetails)initWithFeatureApplicationInvitationDetails:(id)a3 forApplicationPID:(id)a4 inDatabase:(id)a5;
- (id)featureApplicationInvitationDetails;
- (void)updateWithFeatureApplicationInvitationDetails:(id)a3;
@end

@implementation FeatureApplicationInvitationDetails

+ (id)databaseTable
{
  return @"chestnut";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  return @"a";
}

- (FeatureApplicationInvitationDetails)initWithFeatureApplicationInvitationDetails:(id)a3 forApplicationPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(id)objc_opt_class() _propertyValuesForFeatureApplicationInvitationDetails:v10];

  id v12 = [v11 mutableCopy];
  [v12 setObjectOrNull:v9 forKey:@"a"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v12 inDatabase:v8];
  return v13;
}

+ (id)insertFeatureApplicationInvitationDetails:(id)a3 forApplicationPID:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithFeatureApplicationInvitationDetails:v10 forApplicationPID:v9 inDatabase:v8];

  return v11;
}

+ (void)deleteFeatureApplicationInvitationDetailsForApplicationPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForApplicationPID:a3];
  v7 = [a1 anyInDatabase:v6 predicate:v8];

  [v7 deleteFromDatabase];
}

+ (id)featureApplicationInvitationDetailsForApplicationPID:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForApplicationPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 featureApplicationInvitationDetails];

  return v9;
}

+ (void)updateFeatureApplicationInvitationDetails:(id)a3 forApplicationPID:(id)a4 inDatabase:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [a1 _predicateForApplicationPID:v8];
  id v11 = [a1 anyInDatabase:v9 predicate:v10];

  if (v11) {
    [v11 updateWithFeatureApplicationInvitationDetails:v13];
  }
  else {
    id v12 = [a1 insertFeatureApplicationInvitationDetails:v13 forApplicationPID:v8 inDatabase:v9];
  }
}

- (void)updateWithFeatureApplicationInvitationDetails:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForFeatureApplicationInvitationDetails:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)_predicateForApplicationPID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"a" equalToValue:a3];
}

+ (id)_propertyValuesForFeatureApplicationInvitationDetails:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 accountUserAltDSID];
  [v4 setObjectOrNull:v5 forKey:@"b"];

  id v6 = [v3 originatorAltDSID];
  [v4 setObjectOrNull:v6 forKey:@"c"];

  v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 accountUserAccessLevel]);
  [v4 setObjectOrNull:v7 forKey:@"d"];

  id v8 = [v3 originatorFirstName];
  [v4 setObjectOrNull:v8 forKey:@"e"];

  id v9 = [v3 originatorLastName];
  [v4 setObjectOrNull:v9 forKey:@"f"];

  id v10 = [v3 accountUserFirstName];
  [v4 setObjectOrNull:v10 forKey:@"g"];

  id v11 = [v3 accountUserLastName];

  [v4 setObjectOrNull:v11 forKey:@"h"];
  id v12 = [v4 copy];

  return v12;
}

+ (id)_propertySettersForFeatureApplicationInvitationDetails
{
  v4[0] = @"b";
  v4[1] = @"c";
  v5[0] = &stru_100733838;
  v5[1] = &stru_100733858;
  v4[2] = @"d";
  v4[3] = @"e";
  v5[2] = &stru_100733878;
  v5[3] = &stru_100733898;
  v4[4] = @"f";
  v4[5] = @"g";
  v5[4] = &stru_1007338B8;
  v5[5] = &stru_1007338D8;
  v4[6] = @"h";
  v5[6] = &stru_1007338F8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  return v2;
}

- (id)featureApplicationInvitationDetails
{
  id v3 = objc_alloc_init((Class)PKFeatureApplicationInvitationDetails);
  id v4 = [(id)objc_opt_class() _propertySettersForFeatureApplicationInvitationDetails];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000AE494;
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