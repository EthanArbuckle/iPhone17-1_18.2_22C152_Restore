@interface TileStateDefaultV2
+ (id)_predicateForBaseState:(id)a3;
+ (id)_predicateForBaseStatePID:(int64_t)a3;
+ (id)databaseTable;
+ (id)insertState:(id)a3 forBaseState:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseState:(id)a3 inDatabase:(id)a4;
+ (void)inflateState:(id)a3 forBaseStatePID:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (TileStateDefaultV2)initWithState:(id)a3 forBaseState:(id)a4 forTitleValue:(id)a5 forBodyValue:(id)a6 forBodyImage:(id)a7 forFooterValue:(id)a8 forAccessory:(id)a9 forSecondaryAccessory:(id)a10 inDatabase:(id)a11;
- (id)accessory;
- (id)bodyImage;
- (id)bodyValue;
- (id)footerValue;
- (id)secondaryAccessory;
- (id)titleValue;
@end

@implementation TileStateDefaultV2

- (TileStateDefaultV2)initWithState:(id)a3 forBaseState:(id)a4 forTitleValue:(id)a5 forBodyValue:(id)a6 forBodyImage:(id)a7 forFooterValue:(id)a8 forAccessory:(id)a9 forSecondaryAccessory:(id)a10 inDatabase:(id)a11
{
  id v29 = a11;
  id v28 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  id v24 = objc_alloc_init((Class)NSMutableDictionary);
  [v24 setEntityPIDOrNull:v22 forKey:@"state_pid"];

  [v24 setEntityPIDOrNull:v21 forKey:@"title_value_pid"];
  [v24 setEntityPIDOrNull:v20 forKey:@"body_value_pid"];

  [v24 setEntityPIDOrNull:v19 forKey:@"body_image_pid"];
  [v24 setEntityPIDOrNull:v18 forKey:@"footer_value_pid"];

  [v23 preferredStyle];
  v25 = PKPassTileStateStyleToString();
  [v24 setObjectOrNull:v25 forKey:@"preferred_style"];

  [v24 setEntityPIDOrNull:v17 forKey:@"accessory_pid"];
  [v24 setEntityPIDOrNull:v28 forKey:@"secondary_accessory_pid"];

  v26 = [(SQLiteEntity *)self initWithPropertyValues:v24 inDatabase:v29];
  return v26;
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
    id v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = sub_100020C6C;
    id v23 = sub_100021128;
    id v24 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100374074;
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

    v16[0] = @"title_value_pid";
    v16[1] = @"body_value_pid";
    v16[2] = @"body_image_pid";
    v16[3] = @"footer_value_pid";
    v16[4] = @"preferred_style";
    v16[5] = @"accessory_pid";
    v16[6] = @"secondary_accessory_pid";
    v12 = +[NSArray arrayWithObjects:v16 count:7];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100374474;
    v13[3] = &unk_10072ED00;
    id v14 = v9;
    id v15 = v8;
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
  v3 = [(TileStateDefaultV2 *)self titleValue];
  [v3 deleteFromDatabase];

  v4 = [(TileStateDefaultV2 *)self bodyValue];
  [v4 deleteFromDatabase];

  v5 = [(TileStateDefaultV2 *)self bodyImage];
  [v5 deleteFromDatabase];

  id v6 = [(TileStateDefaultV2 *)self footerValue];
  [v6 deleteFromDatabase];

  v7 = [(TileStateDefaultV2 *)self accessory];
  [v7 deleteFromDatabase];

  id v8 = [(TileStateDefaultV2 *)self secondaryAccessory];
  [v8 deleteFromDatabase];

  v10.receiver = self;
  v10.super_class = (Class)TileStateDefaultV2;
  return [(SQLiteEntity *)&v10 deleteFromDatabase];
}

+ (id)databaseTable
{
  return @"pass_tile_state_default_v2";
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

- (id)titleValue
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"title_value_pid"];
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileValue alloc], "initWithPersistentID:inDatabase:", [v3 longLongValue], self->super._database);
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (id)bodyValue
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"body_value_pid"];
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileValue alloc], "initWithPersistentID:inDatabase:", [v3 longLongValue], self->super._database);
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (id)bodyImage
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"body_image_pid"];
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileImage alloc], "initWithPersistentID:inDatabase:", [v3 longLongValue], self->super._database);
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (id)footerValue
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"footer_value_pid"];
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileValue alloc], "initWithPersistentID:inDatabase:", [v3 longLongValue], self->super._database);
  }
  else {
    v4 = 0;
  }

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