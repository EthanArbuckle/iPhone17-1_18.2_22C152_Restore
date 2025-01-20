@interface WebService
+ (id)_insertionDictionaryWithPassType:(id)a3 serviceURL:(id)a4;
+ (id)_predicateForPassType:(id)a3;
+ (id)_predicateForPassType:(id)a3 serviceURL:(id)a4;
+ (id)_propertySettersForWebService;
+ (id)_updateDictionaryWithWebService:(id)a3;
+ (id)anyInDatabase:(id)a3 withPassType:(id)a4 serviceURL:(id)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertWebServiceWithPassType:(id)a3 serviceURL:(id)a4 inDatabase:(id)a5;
+ (id)webServicesInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)webServicesInDatabase:(id)a3 withPassType:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
- (WebService)initWithPassType:(id)a3 serviceURL:(id)a4 inDatabase:(id)a5;
- (id)lastDeletionDate;
- (id)lastUpdatedTag;
- (id)tagLastUpdateDate;
- (id)webService;
- (void)updateWithLastDeletionDate:(id)a3;
- (void)updateWithLastUpdatedTag:(id)a3;
- (void)updateWithWebService:(id)a3;
@end

@implementation WebService

+ (id)databaseTable
{
  return @"web_service";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"pass_type_pid";
  }
  return 0;
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v6 isEqualToString:@"pass_type.identifier"] & 1) != 0
    || [v6 isEqualToString:@"pass_type.team_identifier"])
  {
    [v5 addObject:@"JOIN pass_type ON pass_type.pid = web_service.pass_type_pid"];
  }
}

+ (id)_insertionDictionaryWithPassType:(id)a3 serviceURL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[NSMutableDictionary dictionary];
  id v8 = [v6 persistentID];

  [v7 setLongLong:v8 forKey:@"pass_type_pid"];
  v9 = [v5 absoluteString];

  [v7 setObjectOrNull:v9 forKey:@"service_url"];
  return v7;
}

+ (id)_updateDictionaryWithWebService:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableDictionary dictionary];
  id v5 = [v3 pushToken];
  [v4 setObjectOrNull:v5 forKey:@"push_token"];

  id v6 = [v3 deviceIdentifier];

  [v4 setObjectOrNull:v6 forKey:@"device_identifier"];
  return v4;
}

- (WebService)initWithPassType:(id)a3 serviceURL:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = +[WebService _insertionDictionaryWithPassType:a3 serviceURL:a4];
  v10 = [(SQLiteEntity *)self initWithPropertyValues:v9 inDatabase:v8];

  return v10;
}

+ (id)insertWebServiceWithPassType:(id)a3 serviceURL:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithPassType:v10 serviceURL:v9 inDatabase:v8];

  return v11;
}

- (void)updateWithWebService:(id)a3
{
  id v4 = +[WebService _updateDictionaryWithWebService:a3];
  [(SQLiteEntity *)self setValuesWithDictionary:v4];
}

- (void)updateWithLastDeletionDate:(id)a3
{
}

- (void)updateWithLastUpdatedTag:(id)a3
{
  [(SQLiteEntity *)self setValue:a3 forProperty:@"last_updated_tag"];
  id v4 = +[NSDate date];
  [(SQLiteEntity *)self setValue:v4 forProperty:@"tag_last_update_date"];
}

+ (id)webServicesInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSMutableSet set];
  id v9 = [a1 _propertySettersForWebService];
  id v10 = [a1 queryWithDatabase:v7 predicate:v6];

  id v11 = [v9 allKeys];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1002352C8;
  v17[3] = &unk_10072EAD8;
  id v20 = a1;
  id v18 = v9;
  id v12 = v8;
  id v19 = v12;
  id v13 = v9;
  [v10 enumeratePersistentIDsAndProperties:v11 usingBlock:v17];

  v14 = v19;
  id v15 = v12;

  return v15;
}

+ (id)webServicesInDatabase:(id)a3 withPassType:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPassType:a4];
  id v8 = [a1 webServicesInDatabase:v6 matchingPredicate:v7];

  return v8;
}

- (id)webService
{
  id v3 = +[WebService _propertySettersForWebService];
  id v4 = objc_alloc_init(PDWebService);
  id v5 = [v3 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002354CC;
  v11[3] = &unk_10072EDD0;
  id v12 = v3;
  id v6 = v4;
  id v13 = v6;
  id v7 = v3;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

- (id)lastDeletionDate
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"last_deletion_date"];
  id v3 = (void *)_DateForSQLValue();

  return v3;
}

- (id)lastUpdatedTag
{
  return [(SQLiteEntity *)self valueForProperty:@"last_updated_tag"];
}

- (id)tagLastUpdateDate
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"tag_last_update_date"];
  id v3 = (void *)_DateForSQLValue();

  return v3;
}

+ (id)_predicateForPassType:(id)a3
{
  id v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_type_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPassType:(id)a3 serviceURL:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPassType:a3];
  id v8 = [v6 absoluteString];

  id v9 = +[SQLiteComparisonPredicate predicateWithProperty:@"service_url" equalToValue:v8];
  id v10 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, v9, 0);

  id v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  return v11;
}

+ (id)anyInDatabase:(id)a3 withPassType:(id)a4 serviceURL:(id)a5
{
  id v8 = a3;
  id v9 = [a1 _predicateForPassType:a4 serviceURL:a5];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  return v10;
}

+ (id)_propertySettersForWebService
{
  v4[0] = @"pass_type.identifier";
  v4[1] = @"pass_type.team_identifier";
  v5[0] = &stru_100741BA0;
  v5[1] = &stru_100741BC0;
  v4[2] = @"service_url";
  v4[3] = @"push_token";
  v5[2] = &stru_100741BE0;
  v5[3] = &stru_100741C00;
  v4[4] = @"device_identifier";
  v5[4] = &stru_100741C20;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

@end