@interface TileAccessory
+ (id)databaseTable;
+ (id)insertAccessory:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (TileAccessory)initWithAccessory:(id)a3 inDatabase:(id)a4;
- (id)passTileAccessory;
- (int64_t)type;
@end

@implementation TileAccessory

- (TileAccessory)initWithAccessory:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  [v7 type];

  v9 = PKPassTileAccessoryTypeToString();
  [v8 setObjectOrNull:v9 forKey:@"type"];

  v10 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];
  return v10;
}

+ (id)insertAccessory:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = sub_10002080C;
    v19 = sub_100020EF8;
    id v20 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000ACA10;
    v10[3] = &unk_1007325B8;
    id v14 = a1;
    id v11 = v6;
    id v12 = v7;
    v13 = &v15;
    sub_10000817C((uint64_t)v12, v10);
    id v8 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)deleteFromDatabase
{
  unint64_t v3 = [(TileAccessory *)self type];
  if (v3 <= 2) {
    [(__objc2_class *)*off_1007336F8[v3] deleteEntitiesForBaseAccessory:self inDatabase:self->super._database];
  }
  v5.receiver = self;
  v5.super_class = (Class)TileAccessory;
  return [(SQLiteEntity *)&v5 deleteFromDatabase];
}

- (int64_t)type
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"type"];
  PKPassTileAccessoryTypeFromString();

  return 0;
}

- (id)passTileAccessory
{
  int64_t v3 = [(TileAccessory *)self type];
  id v4 = +[PKPassTileAccessory _createForType:v3 resolved:0];
  objc_super v5 = v4;
  if (v3 == 2)
  {
    id v6 = TileAccessoryImage;
    uint64_t v7 = [v4 accessoryTypeImage];
  }
  else if (v3 == 1)
  {
    id v6 = TileAccessorySpinner;
    uint64_t v7 = [v4 accessoryTypeSpinner];
  }
  else
  {
    if (v3) {
      goto LABEL_8;
    }
    id v6 = TileAccessoryButton;
    uint64_t v7 = [v4 accessoryTypeButton];
  }
  id v8 = (void *)v7;
  [(__objc2_class *)v6 inflateAccessory:v7 forBaseAccessory:self inDatabase:self->super._database];

LABEL_8:
  return v5;
}

+ (id)databaseTable
{
  return @"pass_tile_accessory";
}

@end