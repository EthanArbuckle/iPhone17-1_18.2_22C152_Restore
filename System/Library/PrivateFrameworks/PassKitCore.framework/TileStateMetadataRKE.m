@interface TileStateMetadataRKE
+ (id)_predicateForBaseMetadata:(id)a3;
+ (id)databaseTable;
+ (id)insertMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForBaseMetadata:(id)a3 inDatabase:(id)a4;
+ (void)inflateMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5;
- (TileStateMetadataRKE)initWithMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5;
@end

@implementation TileStateMetadataRKE

- (TileStateMetadataRKE)initWithMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  [v11 setEntityPIDOrNull:v9 forKey:@"state_metadata_pid"];

  v12 = [v10 vehicleFunctionStates];

  v13 = +[NSKeyedArchiver archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
  [v11 setObjectOrNull:v13 forKey:@"vehicle_function_states"];

  v14 = [(SQLiteEntity *)self initWithPropertyValues:v11 inDatabase:v8];
  return v14;
}

+ (id)insertMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100020D8C;
  v26 = sub_1000211B8;
  id v27 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10041DAE8;
  v16[3] = &unk_1007313E8;
  v20 = &v22;
  id v21 = a1;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  sub_10000817C((uint64_t)v13, v16);
  id v14 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v14;
}

+ (void)inflateMetadata:(id)a3 forBaseMetadata:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  if (v8)
  {
    id v9 = a5;
    id v10 = [a1 _predicateForBaseMetadata:a4];
    id v11 = +[SQLiteEntity queryWithDatabase:v9 predicate:v10 orderingProperties:0 orderingDirections:0 limit:1];

    CFStringRef v15 = @"vehicle_function_states";
    id v12 = +[NSArray arrayWithObjects:&v15 count:1];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10041DCA4;
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
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"state_metadata_pid" equalToValue:v3];

  return v4;
}

+ (id)databaseTable
{
  return @"pass_tile_state_metadata_rke";
}

@end