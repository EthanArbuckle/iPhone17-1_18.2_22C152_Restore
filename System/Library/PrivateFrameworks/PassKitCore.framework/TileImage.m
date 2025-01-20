@interface TileImage
+ (id)_propertySetters;
+ (id)databaseTable;
+ (id)insertImage:(id)a3 inDatabase:(id)a4;
- (TileImage)initWithImage:(id)a3 inDatabase:(id)a4;
- (id)tileImage;
@end

@implementation TileImage

- (TileImage)initWithImage:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = [v7 symbolName];
  [v8 setObjectOrNull:v9 forKey:@"symbol"];

  v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 hasColorContent]);
  [v8 setObjectOrNull:v10 forKey:@"hasColorContent"];

  [v7 tintColor];
  v11 = PKSemanticColorToString();
  [v8 setObjectOrNull:v11 forKey:@"tint"];

  v12 = [v7 imageName];

  [v8 setObjectOrNull:v12 forKey:@"iconName"];
  v13 = [(SQLiteEntity *)self initWithPropertyValues:v8 inDatabase:v6];

  return v13;
}

+ (id)insertImage:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = sub_100020BBC;
    v19 = sub_1000210D0;
    id v20 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100355554;
    v10[3] = &unk_10073DB78;
    v13 = &v15;
    id v14 = a1;
    id v11 = v6;
    id v12 = v7;
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

- (id)tileImage
{
  v3 = +[TileImage _propertySetters];
  id v4 = [objc_alloc((Class)PKPassTileImage) _init];
  v5 = [v3 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1003556AC;
  v11[3] = &unk_10072EDD0;
  id v12 = v3;
  id v6 = v4;
  id v13 = v6;
  id v7 = v3;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)databaseTable
{
  return @"pass_tile_image";
}

+ (id)_propertySetters
{
  v4[0] = @"symbol";
  v4[1] = @"iconName";
  v5[0] = &stru_10074AC48;
  v5[1] = &stru_10074AC68;
  v4[2] = @"tint";
  v4[3] = @"hasColorContent";
  v5[2] = &stru_10074AC88;
  v5[3] = &stru_10074ACA8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

@end