@interface LocationIndex
+ (id)databaseTable;
+ (id)insertIndexedLocationWithLatitude:(id)a3 longitude:(id)a4 forLocation:(id)a5 database:(id)a6;
+ (id)locationsByPassUniqueIDWithBoundingBox:(id)a3 inDatabase:(id)a4;
+ (id)propertySettersForLocation;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
- (LocationIndex)initWithLatitude:(id)a3 longitude:(id)a4 forLocation:(id)a5 database:(id)a6;
@end

@implementation LocationIndex

+ (id)databaseTable
{
  return @"location_index";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [a1 propertySettersForLocation];
  if (([v10 isEqualToString:@"pass.unique_id"] & 1) != 0
    || ([v7 allKeys],
        v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 containsObject:v10],
        v8,
        v9))
  {
    [v6 addObject:@"JOIN location ON location_index.location_pid = location.pid"];
    [v6 addObject:@"JOIN location_source ON location.location_source_pid = location_source.pid"];
    [v6 addObject:@"LEFT JOIN pass_location_source ON pass_location_source.location_source_pid = location_source.pid"];
    [v6 addObject:@"JOIN pass ON pass_location_source.pass_pid = pass.pid"];
  }
}

- (LocationIndex)initWithLatitude:(id)a3 longitude:(id)a4 forLocation:(id)a5 database:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  [v14 setObject:v13 forKey:@"min_lat"];
  [v14 setObject:v13 forKey:@"max_lat"];

  [v14 setObject:v12 forKey:@"min_long"];
  [v14 setObject:v12 forKey:@"max_long"];

  id v15 = objc_alloc((Class)NSNumber);
  id v16 = [v11 persistentID];

  id v17 = [v15 initWithLongLong:v16];
  [v14 setObject:v17 forKey:@"location_pid"];

  v20.receiver = self;
  v20.super_class = (Class)LocationIndex;
  v18 = [(SQLiteEntity *)&v20 initWithPropertyValues:v14 inDatabase:v10];

  return v18;
}

+ (id)insertIndexedLocationWithLatitude:(id)a3 longitude:(id)a4 forLocation:(id)a5 database:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) initWithLatitude:v13 longitude:v12 forLocation:v11 database:v10];

  return v14;
}

+ (id)locationsByPassUniqueIDWithBoundingBox:(id)a3 inDatabase:(id)a4
{
  double var3 = a3.var3;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v9 = a4;
  id v10 = [objc_alloc((Class)NSNumber) initWithDouble:var0];
  id v11 = +[SQLiteComparisonPredicate predicateWithProperty:@"min_lat" greaterThanOrEqualToValue:v10];

  id v12 = [objc_alloc((Class)NSNumber) initWithDouble:var1];
  id v13 = +[SQLiteComparisonPredicate predicateWithProperty:@"max_lat" lessThanOrEqualToValue:v12];

  id v14 = [objc_alloc((Class)NSNumber) initWithDouble:var2];
  id v15 = +[SQLiteComparisonPredicate predicateWithProperty:@"min_long" greaterThanOrEqualToValue:v14];

  id v16 = [objc_alloc((Class)NSNumber) initWithDouble:var3];
  id v17 = +[SQLiteComparisonPredicate predicateWithProperty:@"max_long" lessThanOrEqualToValue:v16];

  v35[0] = v11;
  v35[1] = v13;
  v35[2] = v15;
  v35[3] = v17;
  v18 = +[NSArray arrayWithObjects:v35 count:4];
  v19 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v18];
  objc_super v20 = [a1 queryWithDatabase:v9 predicate:v19];

  v21 = objc_alloc_init(PDLocationMap);
  v22 = +[LocationIndex propertySettersForLocation];
  v23 = [v22 allKeys];
  id v24 = [v23 mutableCopy];

  [v24 addObject:@"pass.unique_id"];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100489BE4;
  v30[3] = &unk_1007542A0;
  id v33 = a1;
  id v34 = [v24 indexOfObject:@"pass.unique_id"];
  id v31 = v22;
  v25 = v21;
  v32 = v25;
  id v26 = v22;
  [v20 enumeratePersistentIDsAndProperties:v24 usingBlock:v30];
  v27 = v32;
  v28 = v25;

  return v28;
}

+ (id)propertySettersForLocation
{
  v4[0] = @"location.latitude";
  v4[1] = @"location.longitude";
  v5[0] = &stru_1007542C0;
  v5[1] = &stru_1007542E0;
  v4[2] = @"location.max_distance";
  v4[3] = @"location.altitude";
  v5[2] = &stru_100754300;
  v5[3] = &stru_100754320;
  v4[4] = @"location.name";
  v4[5] = @"location.relevant_text";
  v5[4] = &stru_100754340;
  v5[5] = &stru_100754360;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:6];
  return v2;
}

@end