@interface TileDescriptorState
+ (id)_createStateForPID:(int64_t)a3 withProperties:(id)a4 values:(const void *)a5 propertySetters:(id)a6 indices:(id)a7 inDatabase:(id)a8;
+ (id)_propertySettersWithProperties:(id)a3 effectiveProperties:(id *)a4 indices:(id *)a5;
+ (id)databaseTable;
+ (id)insertState:(id)a3 inDatabase:(id)a4;
+ (id)statesInDatabase:(id)a3 forPassPID:(unint64_t)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
- (BOOL)deleteFromDatabase;
- (TileDescriptorState)initWithState:(id)a3 tileStateOverride:(id)a4 inDatabase:(id)a5;
- (id)passTileDescriptorState;
- (id)stateOverride;
@end

@implementation TileDescriptorState

+ (id)databaseTable
{
  return @"pass_tile_descriptor_state";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v6 isEqualToString:@"pass_tile_descriptor.pid"] & 1) != 0
    || [v6 isEqualToString:@"pass_tile_descriptor.pass_pid"])
  {
    [v5 addObject:@"JOIN pass_tile_descriptor ON pass_tile_descriptor_state.pid = pass_tile_descriptor.state_pid"];
  }
  if (([v6 isEqualToString:@"pass_tile_metadata.identifier"] & 1) != 0
    || [v6 isEqualToString:@"pass_tile_metadata.type"])
  {
    [v5 addObject:@"JOIN pass_tile_metadata ON pass_tile_descriptor.metadata_pid = pass_tile_metadata.pid"];
  }
}

- (TileDescriptorState)initWithState:(id)a3 tileStateOverride:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v11, "setBool:forKey:", objc_msgSend(v10, "isSupported"), @"supported");
  v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 isEnabled]);
  [v11 setObjectOrNull:v12 forKey:@"enabled"];

  v13 = [v10 stateIdentifier];
  [v11 setObjectOrNull:v13 forKey:@"state_identifier"];

  [v11 setEntityPIDOrNull:v9 forKey:@"state_override_pid"];
  id v14 = [v10 isInProgress];

  [v11 setBool:v14 forKey:@"in_progress"];
  v15 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];

  return v15;
}

+ (id)insertState:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100020A1C;
  v21 = sub_100021000;
  id v22 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10021A1FC;
  v12[3] = &unk_1007325B8;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  v15 = &v17;
  id v16 = a1;
  sub_10000817C((uint64_t)v9, v12);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (BOOL)deleteFromDatabase
{
  v3 = [(TileDescriptorState *)self stateOverride];
  [v3 deleteFromDatabase];

  v5.receiver = self;
  v5.super_class = (Class)TileDescriptorState;
  return [(SQLiteEntity *)&v5 deleteFromDatabase];
}

+ (id)statesInDatabase:(id)a3 forPassPID:(unint64_t)a4
{
  id v5 = a3;
  id v30 = 0;
  long long v29 = 0uLL;
  CFStringRef v31 = @"pass_tile_metadata.identifier";
  id v6 = +[NSArray arrayWithObjects:&v31 count:1];
  id v7 = +[TileDescriptorState _propertySettersWithProperties:v6 effectiveProperties:&v30 indices:&v29];

  id v8 = [v30 indexOfObject:@"pass_tile_metadata.identifier"];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_100020A1C;
  v27 = sub_100021000;
  id v28 = 0;
  id v9 = +[NSNumber numberWithUnsignedLongLong:a4];
  id v10 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_tile_descriptor.pass_pid" equalToValue:v9];
  id v11 = +[SQLiteEntity queryWithDatabase:v5 predicate:v10];

  id v12 = v30;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10021A57C;
  v17[3] = &unk_100740CD8;
  v20 = &v23;
  id v21 = v8;
  id v13 = v7;
  id v18 = v13;
  long long v22 = v29;
  id v14 = v5;
  id v19 = v14;
  [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v17];
  id v15 = [(id)v24[5] copy];

  _Block_object_dispose(&v23, 8);
  return v15;
}

- (id)passTileDescriptorState
{
  id v19 = 0;
  long long v18 = 0uLL;
  v3 = +[TileDescriptorState _propertySettersWithProperties:0 effectiveProperties:&v19 indices:&v18];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100020A1C;
  id v16 = sub_100021000;
  id v17 = 0;
  id v4 = v19;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10021A7C4;
  v8[3] = &unk_100740D00;
  id v10 = &v12;
  v8[4] = self;
  id v5 = v3;
  id v9 = v5;
  long long v11 = v18;
  [(SQLiteEntity *)self getValuesForProperties:v4 withApplier:v8];
  id v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

- (id)stateOverride
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"state_override_pid"];
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
  id v8 = 0;
  if (a4 && a5)
  {
    v25[0] = @"supported";
    v25[1] = @"enabled";
    v26[0] = &stru_100740D40;
    v26[1] = &stru_100740D60;
    v25[2] = @"state_identifier";
    v25[3] = @"in_progress";
    v26[2] = &stru_100740D80;
    v26[3] = &stru_100740DA0;
    id v8 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
    id v9 = [v8 allKeys];
    id v10 = [v9 mutableCopy];

    a5->var0 = (unint64_t)[v10 count];
    [v10 addObject:@"pass_tile_metadata.type"];
    a5->var1 = (unint64_t)[v10 count];
    [v10 addObject:@"state_override_pid"];
    [v10 addObject:@"pass_tile_descriptor.pid"];
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

+ (id)_createStateForPID:(int64_t)a3 withProperties:(id)a4 values:(const void *)a5 propertySetters:(id)a6 indices:(id)a7 inDatabase:(id)a8
{
  unint64_t var1 = a7.var1;
  unint64_t var0 = a7.var0;
  id v13 = a8;
  id v14 = a6;
  id v15 = a4;
  uint64_t v16 = [v15 objectAtIndexedSubscript:var0];
  id v17 = objc_msgSend(objc_alloc((Class)PKMutablePassTileDescriptorState), "initForType:", objc_msgSend(v16, "integerValue"));
  +[SQLiteEntity applyPropertySetters:v14 toObject:v17 withProperties:v15 values:a5];

  id v18 = (id)a5[var1];
  if (v18)
  {
    id v19 = +[NSNull null];

    if (v18 != v19)
    {
      long long v20 = -[SQLiteEntity initWithPersistentID:inDatabase:]([TileState alloc], "initWithPersistentID:inDatabase:", [v18 longLongValue], v13);
      long long v21 = [(TileState *)v20 passTileState];
      [v17 setStateOverride:v21];
    }
  }
  id v22 = [v17 copy];

  return v22;
}

@end