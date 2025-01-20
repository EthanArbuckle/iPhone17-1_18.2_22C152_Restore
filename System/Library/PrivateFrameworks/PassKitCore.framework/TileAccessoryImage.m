@interface TileAccessoryImage
+ (id)_predicateForBaseAccessory:(id)a3;
+ (id)databaseTable;
+ (id)insertAccessory:(id)a3 forBaseAccessory:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseAccessory:(id)a3 inDatabase:(id)a4;
+ (void)inflateAccessory:(id)a3 forBaseAccessory:(id)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (TileAccessoryImage)initWithAccessory:(id)a3 forBaseAccessory:(id)a4 forImage:(id)a5 inDatabase:(id)a6;
- (id)image;
@end

@implementation TileAccessoryImage

- (TileAccessoryImage)initWithAccessory:(id)a3 forBaseAccessory:(id)a4 forImage:(id)a5 inDatabase:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  [v12 setEntityPIDOrNull:v11 forKey:@"accessory_pid"];

  [v12 setEntityPIDOrNull:v10 forKey:@"image_pid"];
  v13 = [(SQLiteEntity *)self initWithPropertyValues:v12 inDatabase:v9];

  return v13;
}

+ (id)insertAccessory:(id)a3 forBaseAccessory:(id)a4 inDatabase:(id)a5
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
    v22 = sub_100020C5C;
    v23 = sub_100021120;
    id v24 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10037382C;
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

+ (void)inflateAccessory:(id)a3 forBaseAccessory:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = [a1 _predicateForBaseAccessory:a4];
    id v11 = +[SQLiteEntity queryWithDatabase:v9 predicate:v10 orderingProperties:0 orderingDirections:0 limit:1];

    CFStringRef v16 = @"image_pid";
    id v12 = +[NSArray arrayWithObjects:&v16 count:1];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100373A40;
    v13[3] = &unk_10072ED00;
    id v14 = v9;
    id v15 = v8;
    [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v13];
  }
}

+ (void)deleteEntitiesForBaseAccessory:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForBaseAccessory:a3];
  v7 = +[SQLiteEntity queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = [(TileAccessoryImage *)self image];
  [v3 deleteFromDatabase];

  v5.receiver = self;
  v5.super_class = (Class)TileAccessoryImage;
  return [(SQLiteEntity *)&v5 deleteFromDatabase];
}

+ (id)databaseTable
{
  return @"pass_tile_accessory_image";
}

+ (id)_predicateForBaseAccessory:(id)a3
{
  v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"accessory_pid" equalToValue:v3];

  return v4;
}

- (id)image
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"image_pid"];
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileImage alloc], "initWithPersistentID:inDatabase:", [v3 longLongValue], self->super._database);
  }
  else {
    v4 = 0;
  }

  return v4;
}

@end