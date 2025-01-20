@interface TileValueDate
+ (id)_predicateForBaseValue:(id)a3;
+ (id)databaseTable;
+ (id)insertValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseValue:(id)a3 inDatabase:(id)a4;
+ (void)inflateValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5;
- (TileValueDate)initWithValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5;
@end

@implementation TileValueDate

- (TileValueDate)initWithValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  [v10 setEntityPIDOrNull:v8 forKey:@"value_pid"];

  v11 = [v9 content];
  [v10 setObjectOrNull:v11 forKey:@"content"];

  [v9 dateStyle];
  v12 = _PKEnumValueToString();
  objc_msgSend(v10, "setObjectOrNull:forKey:", v12, @"date_style", 0, 0, 1, 1, 2, 2, 3, 3, 4, 4);

  [v9 timeStyle];
  v13 = _PKEnumValueToString();
  objc_msgSend(v10, "setObjectOrNull:forKey:", v13, @"time_style", 0, 0, 1, 1, 2, 2, 3, 3, 4, 4);

  objc_msgSend(v10, "setBool:forKey:", objc_msgSend(v9, "ignoresTimeZone"), @"ignores_time_zone");
  id v14 = [v9 isRelative];

  [v10 setBool:v14 forKey:@"is_relative"];
  v15 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v7];

  return v15;
}

+ (id)insertValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5
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
    v22 = sub_1000207FC;
    v23 = sub_100020EF0;
    id v24 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000AA0E8;
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

+ (void)inflateValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  if (v8)
  {
    id v9 = a5;
    id v10 = [a1 _predicateForBaseValue:a4];
    id v11 = +[SQLiteEntity queryWithDatabase:v9 predicate:v10 orderingProperties:0 orderingDirections:0 limit:1];

    v15[0] = @"content";
    v15[1] = @"date_style";
    v15[2] = @"time_style";
    v15[3] = @"ignores_time_zone";
    v15[4] = @"is_relative";
    v12 = +[NSArray arrayWithObjects:v15 count:5];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000AA2CC;
    v13[3] = &unk_100731258;
    id v14 = v8;
    [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v13];
  }
}

+ (void)deleteEntitiesForBaseValue:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForBaseValue:a3];
  id v7 = +[SQLiteEntity queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)_predicateForBaseValue:(id)a3
{
  v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"value_pid" equalToValue:v3];

  return v4;
}

+ (id)databaseTable
{
  return @"pass_tile_value_date";
}

@end