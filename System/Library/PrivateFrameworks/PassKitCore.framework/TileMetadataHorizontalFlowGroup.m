@interface TileMetadataHorizontalFlowGroup
+ (id)_predicateForBaseMetadata:(id)a3;
+ (id)databaseTable;
+ (id)insertMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseMetadata:(id)a3 inDatabase:(id)a4;
+ (void)inflateMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5;
- (TileMetadataHorizontalFlowGroup)initWithMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5;
@end

@implementation TileMetadataHorizontalFlowGroup

- (TileMetadataHorizontalFlowGroup)initWithMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  id v12 = [v9 persistentID];

  v13 = +[NSNumber numberWithLongLong:v12];
  [v11 setObjectOrNull:v13 forKey:@"metadata_pid"];

  v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 columns]);
  [v11 setObjectOrNull:v14 forKey:@"columns"];

  v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 maximumRows]);
  [v11 setObjectOrNull:v15 forKey:@"maximumRows"];

  [v10 widthClass];
  v16 = PKPassTileWidthClassHorizontalFlowToString();
  [v11 setObjectOrNull:v16 forKey:@"width_class"];

  [v10 heightClass];
  v17 = PKPassTileHeightClassToString();
  [v11 setObjectOrNull:v17 forKey:@"height_class"];

  [v10 groupStyle];
  v18 = PKPassTileGroupStyleToString();
  [v11 setObjectOrNull:v18 forKey:@"group_style"];

  v19 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v19;
}

+ (id)insertMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5
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
    v22 = sub_100020CCC;
    v23 = sub_100021158;
    id v24 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100395768;
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

+ (void)inflateMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  if (v8)
  {
    id v9 = a5;
    id v10 = [a1 _predicateForBaseMetadata:a4];
    id v11 = +[SQLiteEntity queryWithDatabase:v9 predicate:v10 orderingProperties:0 orderingDirections:0 limit:1];

    v15[0] = @"columns";
    v15[1] = @"maximumRows";
    v15[2] = @"width_class";
    v15[3] = @"height_class";
    v15[4] = @"group_style";
    id v12 = +[NSArray arrayWithObjects:v15 count:5];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10039594C;
    v13[3] = &unk_100731258;
    id v14 = v8;
    [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v13];
  }
}

+ (void)deleteEntitiesForBaseMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForBaseMetadata:a3];
  v7 = +[SQLiteEntity queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)_predicateForBaseMetadata:(id)a3
{
  v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"metadata_pid" equalToValue:v3];

  return v4;
}

+ (id)databaseTable
{
  return @"pass_tile_metadata_horizontal_flow_group";
}

@end