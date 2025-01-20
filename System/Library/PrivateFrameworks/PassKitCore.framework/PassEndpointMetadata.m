@interface PassEndpointMetadata
+ (id)_predicateForPassPID:(int64_t)a3;
+ (id)_predicateForPassPID:(int64_t)a3 type:(unint64_t)a4;
+ (id)_predicateForType:(unint64_t)a3;
+ (id)_propertySettersForEndpointMetadata;
+ (id)_propertyValuesForEndpointMetadata:(id)a3;
+ (id)anyInDatabase:(id)a3 passUniqueID:(id)a4 type:(unint64_t)a5;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateWithEndpointMetadata:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEndpointMetadataForPassUniqueID:(id)a3 type:(unint64_t)a4 inDatabase:(id)a5;
+ (void)deleteEntitiesForPassPID:(int64_t)a3 inDatabase:(id)a4;
- (PassEndpointMetadata)initWithEndpointMetadata:(id)a3 passPID:(int64_t)a4 inDatabase:(id)a5;
- (id)endpointMetadata;
- (void)updateWithEndpointMetadata:(id)a3;
@end

@implementation PassEndpointMetadata

+ (id)databaseTable
{
  return @"pass_endpoint_metadata";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"pass_pid";
  }
  else {
    return 0;
  }
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v9 = v7;
  if (v7 == @"pass.unique_id"
    || v7
    && (unsigned int v8 = [(__CFString *)v7 isEqualToString:@"pass.unique_id"],
        v9,
        v8))
  {
    [v6 addObject:@"JOIN pass ON pass.pid = pass_endpoint_metadata.pass_pid"];
  }
}

+ (id)insertOrUpdateWithEndpointMetadata:(id)a3 inDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 passUniqueID];
  v9 = +[Pass anyInDatabase:v7 withUniqueID:v8];

  if (v9)
  {
    id v10 = [v9 persistentID];
    v11 = [v6 passUniqueID];
    objc_msgSend(a1, "anyInDatabase:passUniqueID:type:", v7, v11, objc_msgSend(v6, "type"));
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12) {
      [v12 updateWithEndpointMetadata:v6];
    }
    else {
      id v12 = [objc_alloc((Class)a1) initWithEndpointMetadata:v6 passPID:v10 inDatabase:v7];
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (PassEndpointMetadata)initWithEndpointMetadata:(id)a3 passPID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() _propertyValuesForEndpointMetadata:v9];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v10 setObjectOrNull:v11 forKey:@"pass_pid"];

  id v12 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  return v12;
}

- (void)updateWithEndpointMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _propertyValuesForEndpointMetadata:v4];

  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)anyInDatabase:(id)a3 passUniqueID:(id)a4 type:(unint64_t)a5
{
  id v8 = a3;
  id v9 = +[Pass anyInDatabase:v8 withUniqueID:a4];
  id v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(a1, "_predicateForPassPID:type:", objc_msgSend(v9, "persistentID"), a5);
    id v12 = [a1 anyInDatabase:v8 predicate:v11];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (void)deleteEndpointMetadataForPassUniqueID:(id)a3 type:(unint64_t)a4 inDatabase:(id)a5
{
  id v5 = [a1 anyInDatabase:a5 passUniqueID:a3 type:a4];
  [v5 deleteFromDatabase];
}

+ (void)deleteEntitiesForPassPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForPassPID:a3];
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)_predicateForPassPID:(int64_t)a3 type:(unint64_t)a4
{
  id v6 = [a1 _predicateForPassPID:a3];
  v11[0] = v6;
  id v7 = [a1 _predicateForType:a4];
  v11[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:2];
  id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

+ (id)_predicateForPassPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForType:(unint64_t)a3
{
  v3 = +[NSNumber numberWithUnsignedInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"type" equalToValue:v3];

  return v4;
}

- (id)endpointMetadata
{
  v3 = objc_alloc_init(PDPassEndpointMetadata);
  id v4 = [(id)objc_opt_class() _propertySettersForEndpointMetadata];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_10008994C;
  v11[3] = &unk_10072DDD8;
  v11[4] = self;
  id v12 = v4;
  id v6 = v3;
  v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_propertyValuesForEndpointMetadata:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 lastUpdated];
  id v6 = (void *)_SQLValueForDate();
  [v4 setObjectOrNull:v6 forKey:@"last_updated"];

  objc_msgSend(v4, "setBool:forKey:", objc_msgSend(v3, "isDirty"), @"is_dirty");
  id v7 = [v3 type];

  [v4 setInteger:v7 forKey:@"type"];
  return v4;
}

+ (id)_propertySettersForEndpointMetadata
{
  v4[0] = @"last_updated";
  v4[1] = @"is_dirty";
  v5[0] = &stru_100732938;
  v5[1] = &stru_100732958;
  v4[2] = @"type";
  v4[3] = @"pass.unique_id";
  v5[2] = &stru_100732978;
  v5[3] = &stru_100732998;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

@end