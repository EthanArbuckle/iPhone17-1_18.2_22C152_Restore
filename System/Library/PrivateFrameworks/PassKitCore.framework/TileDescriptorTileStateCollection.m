@interface TileDescriptorTileStateCollection
+ (BOOL)insertStates:(id)a3 forDescriptor:(id)a4 inDatabase:(id)a5;
+ (id)_predicateForDescriptorPID:(int64_t)a3;
+ (id)databaseTable;
+ (void)deleteEntitiesForDescriptor:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (TileDescriptorTileStateCollection)initWithState:(id)a3 identifier:(id)a4 forDescriptor:(id)a5 inDatabase:(id)a6;
- (id)tileState;
@end

@implementation TileDescriptorTileStateCollection

- (TileDescriptorTileStateCollection)initWithState:(id)a3 identifier:(id)a4 forDescriptor:(id)a5 inDatabase:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  [v14 setEntityPIDOrNull:v11 forKey:@"descriptor_pid"];

  [v14 setEntityPIDOrNull:v13 forKey:@"state_pid"];
  [v14 setObjectOrNull:v12 forKey:@"state_identifier"];

  v15 = [(SQLiteEntity *)self initWithPropertyValues:v14 inDatabase:v10];
  return v15;
}

+ (BOOL)insertStates:(id)a3 forDescriptor:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    if (v9)
    {
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 1;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000263D8;
      v13[3] = &unk_10072E090;
      id v14 = v8;
      id v15 = v10;
      id v18 = a1;
      id v16 = v9;
      v17 = &v19;
      sub_10000817C((uint64_t)v15, v13);
      BOOL v11 = *((unsigned char *)v20 + 24) != 0;

      _Block_object_dispose(&v19, 8);
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

+ (void)deleteEntitiesForDescriptor:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  objc_msgSend(a1, "_predicateForDescriptorPID:", objc_msgSend(a3, "persistentID"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = +[SQLiteEntity queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = [(TileDescriptorTileStateCollection *)self tileState];
  [v3 deleteFromDatabase];

  v5.receiver = self;
  v5.super_class = (Class)TileDescriptorTileStateCollection;
  return [(SQLiteEntity *)&v5 deleteFromDatabase];
}

+ (id)_predicateForDescriptorPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"descriptor_pid" equalToValue:v3];

  return v4;
}

- (id)tileState
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"state_pid"];
  if (v3) {
    v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileState alloc], "initWithPersistentID:inDatabase:", [v3 longLongValue], self->super._database);
  }
  else {
    v4 = 0;
  }

  return v4;
}

+ (id)databaseTable
{
  return @"tile_descriptor_tile_state_collection";
}

@end