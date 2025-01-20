@interface TileValue
+ (id)databaseTable;
+ (id)insertValue:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (TileValue)initWithValue:(id)a3 inDatabase:(id)a4;
- (id)passTileValue;
- (int64_t)type;
@end

@implementation TileValue

- (TileValue)initWithValue:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  [v7 type];

  v9 = PKPassTileValueTypeToString();
  [v8 setObjectOrNull:v9 forKey:@"type"];

  v10 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];
  return v10;
}

+ (id)insertValue:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = sub_1000208EC;
    v19 = sub_100020F68;
    id v20 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100135284;
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
  int64_t v3 = [(TileValue *)self type];
  if ((unint64_t)(v3 - 1) <= 2) {
    [(__objc2_class *)*off_1007396A8[v3 - 1] deleteEntitiesForBaseValue:self inDatabase:self->super._database];
  }
  v5.receiver = self;
  v5.super_class = (Class)TileValue;
  return [(SQLiteEntity *)&v5 deleteFromDatabase];
}

- (int64_t)type
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"type"];
  int64_t v3 = PKPassTileValueTypeFromString();

  return v3;
}

- (id)passTileValue
{
  int64_t v3 = [(TileValue *)self type];
  id v4 = +[PKPassTileValue _createForType:v3 resolved:0];
  objc_super v5 = v4;
  switch(v3)
  {
    case 0:
      id v6 = TileValueText;
      uint64_t v7 = [v4 valueTypeText];
      goto LABEL_6;
    case 1:
      id v6 = TileValueDate;
      uint64_t v7 = [v4 valueTypeDate];
      goto LABEL_6;
    case 2:
      id v6 = TileValueNumber;
      uint64_t v7 = [v4 valueTypeNumber];
      goto LABEL_6;
    case 3:
      id v6 = TileValueForeignReference;
      uint64_t v7 = [v4 valueTypeForeignReference];
LABEL_6:
      id v8 = (void *)v7;
      [(__objc2_class *)v6 inflateValue:v7 forBaseValue:self inDatabase:self->super._database];

      break;
    default:
      break;
  }
  return v5;
}

+ (id)databaseTable
{
  return @"pass_tile_value";
}

@end