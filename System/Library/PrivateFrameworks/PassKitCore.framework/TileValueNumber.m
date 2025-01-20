@interface TileValueNumber
+ (id)_predicateForBaseValue:(id)a3;
+ (id)databaseTable;
+ (id)insertValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseValue:(id)a3 inDatabase:(id)a4;
+ (void)inflateValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5;
- (TileValueNumber)initWithValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5;
@end

@implementation TileValueNumber

- (TileValueNumber)initWithValue:(id)a3 forBaseValue:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  [v11 setEntityPIDOrNull:v10 forKey:@"value_pid"];

  v12 = [v8 content];
  v13 = [v8 currencyCode];
  if (v12)
  {
    [v12 decimalValue];
  }
  else
  {
    v19[0] = 0;
    v19[1] = 0;
    int v20 = 0;
  }
  v14 = +[NSDecimalNumber decimalNumberWithDecimal:v19];
  if (!v13 || ([v13 isEqualToString:PKNoCurrencyCode] & 1) != 0)
  {
    [v11 setObject:v14 forKey:@"decimal_content"];
LABEL_9:
    [v8 numberStyle];
    v17 = _PKEnumValueToString();
    objc_msgSend(v11, "setObjectOrNull:forKey:", v17, @"number_style", 1, 1, 3, 3, 4, 4, 5, 5);

    self = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v9];
    v15 = self;
    goto LABEL_10;
  }
  PKFormattedCurrencyStringFromNumber();
  v15 = (TileValueNumber *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = PKCurrencyDecimalToStorageNumber();
    [v11 setObject:v16 forKey:@"currency_content"];
    [v11 setObject:v13 forKey:@"currency_code"];

    goto LABEL_9;
  }
LABEL_10:

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
    int v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = sub_10002092C;
    v23 = sub_100020F88;
    id v24 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10019A910;
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

    v15[0] = @"currency_content";
    v15[1] = @"decimal_content";
    v15[2] = @"number_style";
    v15[3] = @"currency_code";
    v12 = +[NSArray arrayWithObjects:v15 count:4];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10019AAE8;
    v13[3] = &unk_100731258;
    id v14 = v8;
    [v11 enumeratePersistentIDsAndProperties:v12 usingBlock:v13];
  }
}

+ (void)deleteEntitiesForBaseValue:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForBaseValue:a3];
  v7 = +[SQLiteEntity queryWithDatabase:v6 predicate:v8];

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
  return @"pass_tile_value_number";
}

@end