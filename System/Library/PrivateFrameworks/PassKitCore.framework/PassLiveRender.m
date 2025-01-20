@interface PassLiveRender
+ (id)_commonDictionaryWithEnabled:(BOOL)a3;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_predicateForPassUniqueID:(id)a3;
+ (id)_propertySettersForPassLiveRender;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertEnabled:(BOOL)a3 forPass:(id)a4 inDatabase:(id)a5;
+ (id)passLiveRenderInDatabase:(id)a3 forPass:(id)a4;
+ (id)passLiveRenderInDatabase:(id)a3 forPassUniqueID:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (PassLiveRender)initWithEnabled:(BOOL)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5;
- (id)passLiveRender;
- (void)updateWithEnabled:(BOOL)a3;
@end

@implementation PassLiveRender

+ (id)databaseTable
{
  return @"pass_live_render";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"pass.unique_id"]) {
    [v5 addObject:@"JOIN pass ON pass.pid = pass_live_render.pass_pid"];
  }
}

+ (id)passLiveRenderInDatabase:(id)a3 forPass:(id)a4
{
  id v6 = a3;
  id result = a4;
  if (result)
  {
    id v8 = result;
    v9 = objc_msgSend(a1, "_predicateForPassPID:", objc_msgSend(result, "persistentID"));
    v10 = +[SQLiteEntity anyInDatabase:v6 predicate:v9];

    if (v10) {
      id v11 = v10;
    }

    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"pass_pid";
  }
  else {
    return 0;
  }
}

- (PassLiveRender)initWithEnabled:(BOOL)a3 forPassPID:(int64_t)a4 inDatabase:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v9 = [(id)objc_opt_class() _commonDictionaryWithEnabled:v6];
  v10 = +[NSNumber numberWithLongLong:a4];
  [v9 setObject:v10 forKey:@"pass_pid"];

  id v11 = [(SQLiteEntity *)[PassLiveRender alloc] initWithPropertyValues:v9 inDatabase:v8];
  return v11;
}

+ (id)insertEnabled:(BOOL)a3 forPass:(id)a4 inDatabase:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id result = a5;
  if (v7)
  {
    id v9 = result;
    v10 = -[PassLiveRender initWithEnabled:forPassPID:inDatabase:]([PassLiveRender alloc], "initWithEnabled:forPassPID:inDatabase:", v6, [v7 persistentID], result);

    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)updateWithEnabled:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  [(SQLiteEntity *)self setValue:v4 forProperty:@"enabled"];
}

+ (id)passLiveRenderInDatabase:(id)a3 forPassUniqueID:(id)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPassUniqueID:a4];
  id v8 = +[SQLiteEntity anyInDatabase:v6 predicate:v7];

  if (v8) {
    id v9 = v8;
  }

  return v8;
}

+ (id)_commonDictionaryWithEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setBool:v3 forKey:@"enabled"];
  return v4;
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    objc_msgSend(a1, "_predicateForPassPID:", objc_msgSend(a3, "persistentID"));
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [a1 queryWithDatabase:v6 predicate:v8];

    [v7 deleteAllEntities];
  }
}

- (id)passLiveRender
{
  id v3 = [objc_alloc((Class)PKPassLiveRender) _init];
  id v4 = +[PassLiveRender _propertySettersForPassLiveRender];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002E1A94;
  v11[3] = &unk_10072EDD0;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_predicateForPassUniqueID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:a3];
}

+ (id)_propertySettersForPassLiveRender
{
  CFStringRef v4 = @"enabled";
  id v5 = &stru_1007473B8;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  return v2;
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)PassLiveRender;
  return [(SQLiteEntity *)&v3 deleteFromDatabase];
}

@end