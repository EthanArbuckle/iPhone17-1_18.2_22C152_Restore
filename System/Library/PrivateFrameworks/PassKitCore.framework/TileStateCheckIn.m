@interface TileStateCheckIn
+ (id)_predicateForBaseState:(id)a3;
+ (id)_predicateForBaseStatePID:(int64_t)a3;
+ (id)databaseTable;
+ (id)insertState:(id)a3 forBaseState:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseState:(id)a3 inDatabase:(id)a4;
+ (void)inflateState:(id)a3 forBaseStatePID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (TileStateCheckIn)initWithState:(id)a3 forBaseState:(id)a4 forSecondaryAccessory:(id)a5 inDatabase:(id)a6;
- (id)secondaryAccessory;
@end

@implementation TileStateCheckIn

- (TileStateCheckIn)initWithState:(id)a3 forBaseState:(id)a4 forSecondaryAccessory:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  [v14 setEntityPIDOrNull:v12 forKey:@"state_pid"];

  v15 = [v13 availableFrom];
  v16 = [v15 date];
  v17 = (void *)_SQLValueForDate();
  [v14 setObjectOrNull:v17 forKey:@"available_from"];

  v18 = [v13 availableFrom];

  v19 = [v18 timeZone];

  if (v19)
  {
    v20 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(uint64_t)[v19 secondsFromGMT]);
    [v14 setObjectOrNull:v20 forKey:@"available_from_utc_offset"];
  }
  else
  {
    [v14 setObjectOrNull:0 forKey:@"available_from_utc_offset"];
  }
  [v14 setEntityPIDOrNull:v11 forKey:@"secondary_accessory_pid"];

  v21 = [(SQLiteEntity *)self initWithPropertyValues:v14 inDatabase:v10];
  return v21;
}

+ (id)insertState:(id)a3 forBaseState:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = 0;
  if (v8 && v9)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = sub_100020A4C;
    v23 = sub_100021018;
    id v24 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100228A7C;
    v13[3] = &unk_1007335E8;
    id v14 = v8;
    id v15 = v10;
    v17 = &v19;
    id v18 = a1;
    id v16 = v9;
    sub_10000817C((uint64_t)v15, v13);
    id v11 = (id)v20[5];

    _Block_object_dispose(&v19, 8);
  }

  return v11;
}

+ (void)inflateState:(id)a3 forBaseStatePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = [a1 _predicateForBaseStatePID:a4];
    id v11 = +[SQLiteEntity queryWithDatabase:v9 predicate:v10 orderingProperties:0 orderingDirections:0 limit:1];

    v16[0] = @"available_from";
    v16[1] = @"available_from_utc_offset";
    v16[2] = @"secondary_accessory_pid";
    id v12 = +[NSArray arrayWithObjects:v16 count:3];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100228CB4;
    v13[3] = &unk_10072ED00;
    id v14 = v8;
    id v15 = v9;
    [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v13];
  }
}

+ (void)deleteEntitiesForBaseState:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForBaseState:a3];
  v7 = +[SQLiteEntity queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = [(TileStateCheckIn *)self secondaryAccessory];
  [v3 deleteFromDatabase];

  v5.receiver = self;
  v5.super_class = (Class)TileStateCheckIn;
  return [(SQLiteEntity *)&v5 deleteFromDatabase];
}

+ (id)databaseTable
{
  return @"pass_tile_state_check_in";
}

+ (id)_predicateForBaseState:(id)a3
{
  if (a3) {
    objc_msgSend(a1, "_predicateForBaseStatePID:", objc_msgSend(a3, "persistentID"));
  }
  else {
  v3 = +[SQLiteComparisonPredicate predicateWithProperty:@"state_pid" equalToValue:0];
  }
  return v3;
}

+ (id)_predicateForBaseStatePID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"state_pid" equalToValue:v3];

  return v4;
}

- (id)secondaryAccessory
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"secondary_accessory_pid"];
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileAccessory alloc], "initWithPersistentID:inDatabase:", [v3 longLongValue], self->super._database);
  }
  else {
    v4 = 0;
  }

  return v4;
}

@end