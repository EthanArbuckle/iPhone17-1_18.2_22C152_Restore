@interface TileStateMetadata
+ (id)databaseTable;
+ (id)insertMetadata:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (TileStateMetadata)initWithMetadata:(id)a3 inDatabase:(id)a4;
- (id)stateMetadata;
- (int64_t)type;
@end

@implementation TileStateMetadata

- (TileStateMetadata)initWithMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  [v7 type];

  v9 = PKPassTileTypeToString();
  [v8 setObjectOrNull:v9 forKey:@"type"];

  v10 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];
  return v10;
}

+ (id)insertMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100020A8C;
  v21 = sub_100021038;
  id v22 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002A3A18;
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
  if ((id)[(TileStateMetadata *)self type] == (id)1) {
    +[TileStateMetadataRKE deleteEntitiesForBaseMetadata:self inDatabase:self->super._database];
  }
  v4.receiver = self;
  v4.super_class = (Class)TileStateMetadata;
  return [(SQLiteEntity *)&v4 deleteFromDatabase];
}

- (int64_t)type
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"type"];
  PKPassTileTypeFromString();

  return 0;
}

- (id)stateMetadata
{
  int64_t v3 = [(TileStateMetadata *)self type];
  id v4 = +[PKPassTileStateMetadata _createWithType:v3];
  v5 = v4;
  if (v3 == 1)
  {
    id v6 = [v4 metadataTypeVehicleFunction];
    +[TileStateMetadataRKE inflateMetadata:v6 forBaseMetadata:self inDatabase:self->super._database];
  }
  return v5;
}

+ (id)databaseTable
{
  return @"pass_tile_state_metadata";
}

@end