@interface TileStateDefault
+ (id)_predicateForBaseState:(id)a3;
+ (id)_predicateForBaseStatePID:(int64_t)a3;
+ (id)databaseTable;
+ (id)insertState:(id)a3 forBaseState:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseState:(id)a3 inDatabase:(id)a4;
+ (void)inflateState:(id)a3 forBaseStatePID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (TileStateDefault)initWithState:(id)a3 forBaseState:(id)a4 forAccessory:(id)a5 forSecondaryAccessory:(id)a6 inDatabase:(id)a7;
- (id)accessory;
- (id)secondaryAccessory;
@end

@implementation TileStateDefault

- (TileStateDefault)initWithState:(id)a3 forBaseState:(id)a4 forAccessory:(id)a5 forSecondaryAccessory:(id)a6 inDatabase:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  [v17 setEntityPIDOrNull:v15 forKey:@"state_pid"];

  v18 = [v16 title];
  [v17 setObjectOrNull:v18 forKey:@"title"];

  v19 = [v16 body];

  [v17 setObjectOrNull:v19 forKey:@"body"];
  [v17 setEntityPIDOrNull:v14 forKey:@"accessory_pid"];

  [v17 setEntityPIDOrNull:v13 forKey:@"secondary_accessory_pid"];
  v20 = [(SQLiteEntity *)self initWithPropertyValues:v17 inDatabase:v12];

  return v20;
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
    v22 = sub_1000207EC;
    v23 = sub_100020EE8;
    id v24 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000A9688;
    v13[3] = &unk_1007335E8;
    id v14 = v8;
    id v15 = v10;
    id v17 = &v19;
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

    v16[0] = @"title";
    v16[1] = @"body";
    v16[2] = @"accessory_pid";
    v16[3] = @"secondary_accessory_pid";
    id v12 = +[NSArray arrayWithObjects:v16 count:4];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000A9918;
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
  v3 = [(TileStateDefault *)self accessory];
  [v3 deleteFromDatabase];

  v4 = [(TileStateDefault *)self secondaryAccessory];
  [v4 deleteFromDatabase];

  v6.receiver = self;
  v6.super_class = (Class)TileStateDefault;
  return [(SQLiteEntity *)&v6 deleteFromDatabase];
}

+ (id)databaseTable
{
  return @"pass_tile_state_default";
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

- (id)accessory
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"accessory_pid"];
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileAccessory alloc], "initWithPersistentID:inDatabase:", [v3 longLongValue], self->super._database);
  }
  else {
    v4 = 0;
  }

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