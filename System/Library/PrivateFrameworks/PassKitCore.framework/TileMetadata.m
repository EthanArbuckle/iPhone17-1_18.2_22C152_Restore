@interface TileMetadata
+ (id)_predicateForTileType:(int64_t)a3;
+ (id)databaseTable;
+ (id)insertMetadata:(id)a3 inDatabase:(id)a4;
+ (id)passUniqueIdentifiersInDatabase:(id)a3 withTileOfType:(int64_t)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
- (BOOL)deleteFromDatabase;
- (TileMetadata)initWithMetadata:(id)a3 inDatabase:(id)a4;
- (id)metadata;
- (int64_t)type;
@end

@implementation TileMetadata

+ (id)databaseTable
{
  return @"pass_tile_metadata";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"pass.unique_id"])
  {
    [v5 addObject:@"JOIN pass_tile_descriptor ON pass_tile_metadata.pid = pass_tile_descriptor.metadata_pid"];
    [v5 addObject:@"JOIN pass ON pass_tile_descriptor.pass_pid = pass.pid"];
  }
}

- (TileMetadata)initWithMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = [v7 identifier];
  [v8 setObjectOrNull:v9 forKey:@"identifier"];

  [v7 type];
  v10 = PKPassTileTypeToString();
  [v8 setObjectOrNull:v10 forKey:@"type"];

  [v7 preferredStyle];
  v11 = PKPassTileStyleToString();
  [v8 setObjectOrNull:v11 forKey:@"style"];

  objc_msgSend(v8, "setBool:forKey:", objc_msgSend(v7, "isSelectable"), @"selectable");
  objc_msgSend(v8, "setBool:forKey:", objc_msgSend(v7, "showInPrearm"), @"show_in_prearm");
  [v7 context];

  v12 = PKPassTileContextToString();
  [v8 setObjectOrNull:v12 forKey:@"context_identifier"];

  v13 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];
  return v13;
}

+ (id)insertMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_10002093C;
  v21 = sub_100020F90;
  id v22 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001A3418;
  v12[3] = &unk_1007325B8;
  id v16 = a1;
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  v15 = &v17;
  sub_10000817C((uint64_t)v9, v12);
  id v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (BOOL)deleteFromDatabase
{
  int64_t v3 = [(TileMetadata *)self type];
  if ((unint64_t)(v3 - 1) <= 2) {
    [(__objc2_class *)*off_10073C488[v3 - 1] deleteEntitiesForBaseMetadata:self inDatabase:self->super._database];
  }
  v5.receiver = self;
  v5.super_class = (Class)TileMetadata;
  return [(SQLiteEntity *)&v5 deleteFromDatabase];
}

- (int64_t)type
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"type"];
  PKPassTileTypeFromString();

  return 0;
}

+ (id)passUniqueIdentifiersInDatabase:(id)a3 withTileOfType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [a1 _predicateForTileType:a4];
  LOBYTE(v12) = 1;
  id v8 = +[SQLiteEntity queryWithDatabase:v6 predicate:v7 orderingProperties:0 orderingDirections:0 limit:0 groupingProperties:0 returnsDistinctEntities:v12];

  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_10002093C;
  v18 = sub_100020F90;
  id v19 = 0;
  CFStringRef v20 = @"pass.unique_id";
  id v9 = +[NSArray arrayWithObjects:&v20 count:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001A37B8;
  v13[3] = &unk_100731280;
  v13[4] = &v14;
  [v8 enumerateProperties:v9 usingBlock:v13];

  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

+ (id)_predicateForTileType:(int64_t)a3
{
  int64_t v3 = PKPassTileTypeToString();
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"type" equalToValue:v3];

  return v4;
}

- (id)metadata
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_10002093C;
  id v13 = sub_100020F90;
  id v14 = 0;
  v19[0] = @"type";
  v19[1] = @"identifier";
  v19[2] = @"context_identifier";
  v19[3] = @"style";
  v19[4] = @"selectable";
  v19[5] = @"show_in_prearm";
  int64_t v3 = +[NSArray arrayWithObjects:v19 count:6];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001A3B74;
  v8[3] = &unk_100734FF0;
  v8[4] = &v15;
  v8[5] = &v9;
  [(SQLiteEntity *)self getValuesForProperties:v3 withApplier:v8];

  uint64_t v4 = v16[3];
  switch(v4)
  {
    case 1:
      objc_super v5 = [(id)v10[5] metadataTypeVehicleFunction];
      +[TileMetadataRKE inflateMetadata:v5 forBaseMetadata:self inDatabase:self->super._database];
      break;
    case 2:
      objc_super v5 = [(id)v10[5] metadataTypeHorizontalFlowGroup];
      +[TileMetadataHorizontalFlowGroup inflateMetadata:v5 forBaseMetadata:self inDatabase:self->super._database];
      break;
    case 3:
      objc_super v5 = [(id)v10[5] metadataTypeVerticalFlowGroup];
      +[TileMetadataVerticalFlowGroup inflateMetadata:v5 forBaseMetadata:self inDatabase:self->super._database];
      break;
    default:
      goto LABEL_8;
  }

LABEL_8:
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

@end