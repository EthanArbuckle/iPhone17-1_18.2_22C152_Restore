@interface TileStateGroup
+ (id)_predicateForBaseState:(id)a3;
+ (id)_predicateForBaseStatePID:(int64_t)a3;
+ (id)databaseTable;
+ (id)insertState:(id)a3 forBaseState:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseState:(id)a3 inDatabase:(id)a4;
+ (void)inflateState:(id)a3 forBaseStatePID:(int64_t)a4 inDatabase:(id)a5;
- (TileStateGroup)initWithState:(id)a3 forBaseState:(id)a4 inDatabase:(id)a5;
@end

@implementation TileStateGroup

- (TileStateGroup)initWithState:(id)a3 forBaseState:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  [v11 setEntityPIDOrNull:v9 forKey:@"state_pid"];

  v12 = [v10 header];
  [v11 setObjectOrNull:v12 forKey:@"header"];

  v13 = [v10 footer];

  [v11 setObjectOrNull:v13 forKey:@"footer"];
  v14 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];

  return v14;
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
    v22 = sub_100020C7C;
    v23 = sub_100021130;
    id v24 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10037B88C;
    v13[3] = &unk_1007313E8;
    v17 = &v19;
    id v18 = a1;
    id v14 = v8;
    id v15 = v9;
    id v16 = v10;
    sub_10000817C((uint64_t)v16, v13);
    id v11 = (id)v20[5];

    _Block_object_dispose(&v19, 8);
  }

  return v11;
}

+ (void)inflateState:(id)a3 forBaseStatePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  if (v8)
  {
    id v9 = a5;
    id v10 = [a1 _predicateForBaseStatePID:a4];
    id v11 = +[SQLiteEntity queryWithDatabase:v9 predicate:v10 orderingProperties:0 orderingDirections:0 limit:1];

    v15[0] = @"header";
    v15[1] = @"footer";
    v12 = +[NSArray arrayWithObjects:v15 count:2];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10037BA50;
    v13[3] = &unk_100731258;
    id v14 = v8;
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

+ (id)databaseTable
{
  return @"pass_tile_state_group";
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

@end