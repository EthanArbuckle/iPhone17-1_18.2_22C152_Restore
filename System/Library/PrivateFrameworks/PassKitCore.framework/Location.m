@interface Location
+ (BOOL)hasLocationsInDatabase:(id)a3 forPassPID:(unint64_t)a4;
+ (id)_locationsInDatabase:(id)a3 matchingPredicate:(id)a4;
+ (id)_predicateForLocationSource:(id)a3;
+ (id)_predicateForLocationSourcePID:(int64_t)a3;
+ (id)_predicateForPass:(id)a3;
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_predicateForSourceType:(int)a3;
+ (id)_propertySettersForLocation;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)foreignDatabaseTablesToDelete;
+ (id)foreignKeyColumnForTable:(id)a3;
+ (id)locationsInDatabase:(id)a3 forPassPID:(unint64_t)a4;
+ (id)locationsInDatabase:(id)a3 forPassPID:(unint64_t)a4 withSourceType:(int)a5;
+ (id)queryWithDatabase:(id)a3 locationSourcePID:(unint64_t)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
+ (void)insertLocations:(id)a3 forSource:(id)a4 inDatabase:(id)a5;
- (Location)initWithLocation:(id)a3 source:(id)a4 inDatabase:(id)a5;
@end

@implementation Location

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v6 isEqualToString:@"pass.pid"] & 1) != 0
    || [v6 isEqualToString:@"location_source.type"])
  {
    [v5 addObject:@"JOIN location_source ON location.location_source_pid = location_source.pid"];
    [v5 addObject:@"LEFT JOIN pass_location_source ON pass_location_source.location_source_pid = location_source.pid"];
    [v5 addObject:@"JOIN pass ON pass_location_source.pass_pid = pass.pid"];
  }
  if ([v6 isEqualToString:@"pass_location_source.pass_pid"])
  {
    [v5 addObject:@"JOIN location_source ON location.location_source_pid = location_source.pid"];
    [v5 addObject:@"LEFT JOIN pass_location_source ON pass_location_source.location_source_pid = location_source.pid"];
  }
}

+ (id)databaseTable
{
  return @"location";
}

+ (id)locationsInDatabase:(id)a3 forPassPID:(unint64_t)a4 withSourceType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  v9 = [a1 _predicateForPassPID:a4];
  v15[0] = v9;
  v10 = [a1 _predicateForSourceType:v5];
  v15[1] = v10;
  v11 = +[NSArray arrayWithObjects:v15 count:2];
  v12 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v11];
  v13 = [a1 _locationsInDatabase:v8 matchingPredicate:v12];

  return v13;
}

+ (id)_predicateForSourceType:(int)a3
{
  v3 = +[NSNumber numberWithInt:*(void *)&a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"location_source.type" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass.pid" equalToValue:v3];

  return v4;
}

+ (id)_locationsInDatabase:(id)a3 matchingPredicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = [a1 _propertySettersForLocation];
  v10 = +[SQLiteEntity queryWithDatabase:v7 predicate:v6];

  v11 = [v9 allKeys];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000173FC;
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

+ (id)_propertySettersForLocation
{
  v4[0] = @"latitude";
  v4[1] = @"longitude";
  v5[0] = &stru_100738700;
  v5[1] = &stru_100738720;
  v4[2] = @"max_distance";
  v4[3] = @"altitude";
  v5[2] = &stru_100738740;
  v5[3] = &stru_100738760;
  v4[4] = @"name";
  v4[5] = @"relevant_text";
  v5[4] = &stru_100738780;
  v5[5] = &stru_1007387A0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:6];
  return v2;
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"location_source_pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"pass_location_source.pass_pid";
  }
  return 0;
}

+ (id)foreignDatabaseTablesToDelete
{
  return +[NSSet setWithObject:@"location_index"];
}

+ (id)foreignKeyColumnForTable:(id)a3
{
  if ([a3 isEqualToString:@"location_index"]) {
    return @"location_pid";
  }
  else {
    return 0;
  }
}

- (Location)initWithLocation:(id)a3 source:(id)a4 inDatabase:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  id v11 = objc_alloc((Class)NSNumber);
  [v7 latitude];
  id v12 = objc_msgSend(v11, "initWithDouble:");
  id v13 = objc_alloc((Class)NSNumber);
  [v7 longitude];
  id v14 = objc_msgSend(v13, "initWithDouble:");
  [v10 setObject:v12 forKey:@"latitude"];
  [v10 setObject:v14 forKey:@"longitude"];
  [v7 maxDistance];
  if (v15 > 0.0)
  {
    v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v10 setObject:v16 forKey:@"max_distance"];
  }
  if ([v7 hasAltitude])
  {
    id v17 = objc_alloc((Class)NSNumber);
    [v7 altitude];
    id v18 = objc_msgSend(v17, "initWithDouble:");
    [v10 setObject:v18 forKey:@"altitude"];
  }
  id v19 = [v7 name];
  if (v19) {
    [v10 setObject:v19 forKey:@"name"];
  }
  id v20 = [v7 relevantText];
  if (v20) {
    [v10 setObject:v20 forKey:@"relevant_text"];
  }
  id v21 = objc_alloc((Class)NSNumber);
  id v22 = [v9 persistentID];

  id v23 = [v21 initWithLongLong:v22];
  [v10 setObject:v23 forKey:@"location_source_pid"];
  v28.receiver = self;
  v28.super_class = (Class)Location;
  v24 = [(SQLiteEntity *)&v28 initWithPropertyValues:v10 inDatabase:v8];
  id v25 = +[LocationIndex insertIndexedLocationWithLatitude:v12 longitude:v14 forLocation:v24 database:v8];

  return v24;
}

+ (void)insertLocations:(id)a3 forSource:(id)a4 inDatabase:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10011A544;
  v11[3] = &unk_100734FC8;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a1;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  sub_10000817C((uint64_t)v8, v11);
}

+ (id)_predicateForPass:(id)a3
{
  id v4 = [a3 persistentID];
  return [a1 _predicateForPassPID:v4];
}

+ (BOOL)hasLocationsInDatabase:(id)a3 forPassPID:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPassPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8 != 0;
}

+ (id)locationsInDatabase:(id)a3 forPassPID:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForPassPID:a4];
  id v8 = [a1 _locationsInDatabase:v6 matchingPredicate:v7];

  return v8;
}

+ (id)_predicateForLocationSourcePID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"location_source_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForLocationSource:(id)a3
{
  id v4 = [a3 persistentID];
  return [a1 _predicateForLocationSourcePID:v4];
}

+ (id)queryWithDatabase:(id)a3 locationSourcePID:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForLocationSourcePID:a4];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  return v8;
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPass:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

@end