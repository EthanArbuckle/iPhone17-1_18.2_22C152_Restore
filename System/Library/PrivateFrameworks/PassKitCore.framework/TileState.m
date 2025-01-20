@interface TileState
+ (BOOL)insertStates:(id)a3 forDescriptor:(id)a4 inDatabase:(id)a5;
+ (id)_createStateForPID:(int64_t)a3 withProperties:(id)a4 values:(const void *)a5 propertySetters:(id)a6 indices:(id *)a7 inDatabase:(id)a8;
+ (id)_insertState:(id)a3 inDatabase:(id)a4 root:(BOOL)a5;
+ (id)_predicateForDescriptorPID:(int64_t)a3;
+ (id)_propertySettersWithProperties:(id)a3 effectiveProperties:(id *)a4 indices:(id *)a5;
+ (id)databaseTable;
+ (id)insertState:(id)a3 inDatabase:(id)a4;
+ (id)statesForDescriptorPID:(int64_t)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForDescriptor:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (TileState)initWithState:(id)a3 metadata:(id)a4 icon:(id)a5 actionState:(id)a6 inDatabase:(id)a7;
- (id)actionState;
- (id)icon;
- (id)metadata;
- (id)passTileState;
- (int64_t)type;
@end

@implementation TileState

+ (id)databaseTable
{
  return @"pass_tile_state";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v6 isEqualToString:@"tile_descriptor_tile_state_collection.descriptor_pid"] & 1) != 0|| objc_msgSend(v6, "isEqualToString:", @"tile_descriptor_tile_state_collection.state_identifier"))
  {
    [v5 addObject:@"JOIN tile_descriptor_tile_state_collection ON pass_tile_state.pid = tile_descriptor_tile_state_collection.state_pid"];
  }
}

- (TileState)initWithState:(id)a3 metadata:(id)a4 icon:(id)a5 actionState:(id)a6 inDatabase:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  [v17 setEntityPIDOrNull:v15 forKey:@"state_metadata_pid"];

  [v17 setEntityPIDOrNull:v14 forKey:@"image_pid"];
  [v17 setEntityPIDOrNull:v13 forKey:@"action_state_pid"];

  [v16 type];
  v18 = PKPassTileStateTypeToString();
  [v17 setObjectOrNull:v18 forKey:@"type"];

  objc_msgSend(v17, "setBool:forKey:", objc_msgSend(v16, "isEnabled"), @"enabled");
  objc_msgSend(v17, "setBool:forKey:", objc_msgSend(v16, "isSelected"), @"selected");
  v19 = [v16 actionDictionaries];

  if (v19)
  {
    v20 = +[NSJSONSerialization dataWithJSONObject:v19 options:0 error:0];
  }
  else
  {
    v20 = 0;
  }
  [v17 setObjectOrNull:v20 forKey:@"actions"];
  v21 = [(SQLiteEntity *)self initWithPropertyValues:v17 inDatabase:v12];

  return v21;
}

+ (BOOL)insertStates:(id)a3 forDescriptor:(id)a4 inDatabase:(id)a5
{
  return +[TileDescriptorTileStateCollection insertStates:a3 forDescriptor:a4 inDatabase:a5];
}

+ (id)insertState:(id)a3 inDatabase:(id)a4
{
  return [a1 _insertState:a3 inDatabase:a4 root:1];
}

+ (id)_insertState:(id)a3 inDatabase:(id)a4 root:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_100020E38;
  v24 = sub_100021210;
  id v25 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100487BBC;
  v14[3] = &unk_100754088;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  BOOL v19 = a5;
  id v17 = &v20;
  id v18 = a1;
  id v16 = v11;
  sub_10000817C((uint64_t)v11, v14);
  id v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v12;
}

+ (void)deleteEntitiesForDescriptor:(id)a3 inDatabase:(id)a4
{
}

- (BOOL)deleteFromDatabase
{
  unint64_t v3 = [(TileState *)self type];
  if (v3 <= 3) {
    [(__objc2_class *)*(&off_1007541D8)[v3] deleteEntitiesForBaseState:self inDatabase:self->super._database];
  }
  v4 = [(TileState *)self metadata];
  [v4 deleteFromDatabase];

  id v5 = [(TileState *)self icon];
  [v5 deleteFromDatabase];

  id v6 = [(TileState *)self actionState];
  [v6 deleteFromDatabase];

  v8.receiver = self;
  v8.super_class = (Class)TileState;
  return [(SQLiteEntity *)&v8 deleteFromDatabase];
}

+ (id)_predicateForDescriptorPID:(int64_t)a3
{
  unint64_t v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"tile_descriptor_tile_state_collection.descriptor_pid" equalToValue:v3];

  return v4;
}

+ (id)statesForDescriptorPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  id v33 = 0;
  CFStringRef v34 = @"tile_descriptor_tile_state_collection.state_identifier";
  v7 = +[NSArray arrayWithObjects:&v34 count:1];
  objc_super v8 = +[TileState _propertySettersWithProperties:v7 effectiveProperties:&v33 indices:&v31];

  id v9 = [v33 indexOfObject:@"tile_descriptor_tile_state_collection.state_identifier"];
  id v10 = +[TileState _predicateForDescriptorPID:a3];
  id v11 = +[SQLiteEntity queryWithDatabase:v6 predicate:v10];

  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_100020E38;
  v29 = sub_100021210;
  id v30 = 0;
  id v12 = v33;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100488194;
  v17[3] = &unk_1007540B0;
  id v21 = v9;
  id v22 = a1;
  id v13 = v8;
  id v18 = v13;
  long long v23 = v31;
  long long v24 = v32;
  id v14 = v6;
  id v19 = v14;
  uint64_t v20 = &v25;
  [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v17];
  id v15 = [(id)v26[5] copy];

  _Block_object_dispose(&v25, 8);
  return v15;
}

- (id)passTileState
{
  id v21 = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  unint64_t v3 = +[TileState _propertySettersWithProperties:0 effectiveProperties:&v21 indices:&v19];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_100020E38;
  id v17 = sub_100021210;
  id v18 = 0;
  id v4 = v21;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1004883D8;
  v8[3] = &unk_1007540D8;
  id v10 = &v13;
  v8[4] = self;
  id v5 = v3;
  id v9 = v5;
  long long v11 = v19;
  long long v12 = v20;
  [(SQLiteEntity *)self getValuesForProperties:v4 withApplier:v8];
  id v6 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v6;
}

- (int64_t)type
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"type"];
  PKPassTileStateTypeFromString();

  return 0;
}

- (id)metadata
{
  unint64_t v3 = [(SQLiteEntity *)self valueForProperty:@"state_metadata_pid"];
  if (v3) {
    id v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileStateMetadata alloc], "initWithPersistentID:inDatabase:", [v3 longLongValue], self->super._database);
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)icon
{
  unint64_t v3 = [(SQLiteEntity *)self valueForProperty:@"image_pid"];
  if (v3) {
    id v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileImage alloc], "initWithPersistentID:inDatabase:", [v3 longLongValue], self->super._database);
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)actionState
{
  unint64_t v3 = [(SQLiteEntity *)self valueForProperty:@"action_state_pid"];
  if (v3) {
    id v4 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileState alloc], "initWithPersistentID:inDatabase:", [v3 longLongValue], self->super._database);
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)_propertySettersWithProperties:(id)a3 effectiveProperties:(id *)a4 indices:(id *)a5
{
  id v7 = a3;
  objc_super v8 = 0;
  if (a4 && a5)
  {
    v25[0] = @"enabled";
    v25[1] = @"selected";
    v26[0] = &stru_100754118;
    v26[1] = &stru_100754138;
    v25[2] = @"action";
    v25[3] = @"actions";
    v26[2] = &stru_100754158;
    v26[3] = &stru_100754178;
    objc_super v8 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
    id v9 = [v8 allKeys];
    id v10 = [v9 mutableCopy];

    a5->var0 = (int64_t)[v10 count];
    [v10 addObject:@"type"];
    a5->var1 = (int64_t)[v10 count];
    [v10 addObject:@"state_metadata_pid"];
    a5->var2 = (int64_t)[v10 count];
    [v10 addObject:@"image_pid"];
    a5->var3 = (int64_t)[v10 count];
    [v10 addObject:@"action_state_pid"];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v7;
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v10, "indexOfObject:", v16, (void)v20) == (id)0x7FFFFFFFFFFFFFFFLL) {
            [v10 addObject:v16];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    id v17 = [v10 copy];
    id v18 = *a4;
    *a4 = v17;
  }
  return v8;
}

+ (id)_createStateForPID:(int64_t)a3 withProperties:(id)a4 values:(const void *)a5 propertySetters:(id)a6 indices:(id *)a7 inDatabase:(id)a8
{
  id v13 = a8;
  id v14 = a6;
  id v15 = a4;
  uint64_t v16 = +[NSNull null];
  id v17 = (id)a5[a7->var0];
  if (v17 == v16)
  {

    id v17 = 0;
  }
  PKPassTileStateTypeFromString();

  id v18 = +[PKPassTileState _createWithType:0];
  +[SQLiteEntity applyPropertySetters:v14 toObject:v18 withProperties:v15 values:a5];

  long long v19 = (id)a5[a7->var1];
  long long v20 = v19;
  if (v19) {
    BOOL v21 = v19 == v16;
  }
  else {
    BOOL v21 = 1;
  }
  if (!v21)
  {
    long long v22 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileStateMetadata alloc], "initWithPersistentID:inDatabase:", [v19 longLongValue], v13);
    long long v23 = [(TileStateMetadata *)v22 stateMetadata];
    [v18 setMetadata:v23];
  }
  long long v24 = (id)a5[a7->var2];
  uint64_t v25 = v24;
  if (v24 && v24 != v16)
  {
    v26 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileImage alloc], "initWithPersistentID:inDatabase:", [v24 longLongValue], v13);
    [(TileImage *)v26 tileImage];
    v28 = int64_t v27 = a3;
    [v18 setIcon:v28];

    a3 = v27;
  }
  v29 = (id)a5[a7->var3];
  id v30 = v29;
  if (v29 && v29 != v16)
  {
    long long v31 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileState alloc], "initWithPersistentID:inDatabase:", [v29 longLongValue], v13);
    long long v32 = [(TileState *)v31 passTileState];
    [v18 setActionState:v32];
  }
  id v33 = [v18 stateTypeDefault];
  +[TileStateDefault inflateState:v33 forBaseStatePID:a3 inDatabase:v13];

  return v18;
}

@end