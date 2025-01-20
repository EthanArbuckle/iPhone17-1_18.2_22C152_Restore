@interface PassRelevancyModel
+ (id)_predicateForPass:(id)a3;
+ (id)_predicateForPassUniqueID:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertForPass:(id)a3 inDatabase:(id)a4;
+ (id)passRelevancyModelInDatabase:(id)a3 forPass:(id)a4;
+ (id)passRelevancyModelInDatabase:(id)a3 forPassUniqueID:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (id)initForPass:(id)a3 inDatabase:(id)a4;
- (id)passRelevancyModel;
@end

@implementation PassRelevancyModel

+ (id)databaseTable
{
  return @"pass_relevancy_model";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a4;
  if ([a3 isEqualToString:@"pass.unique_id"]) {
    [v5 addObject:@"JOIN pass ON pass.pid = pass_relevancy_model.pass_pid"];
  }
}

+ (id)passRelevancyModelInDatabase:(id)a3 forPass:(id)a4
{
  id v6 = a3;
  id result = a4;
  if (result)
  {
    id v8 = result;
    v9 = [a1 _predicateForPass:result];
    v10 = +[SQLiteEntity anyInDatabase:v6 predicate:v9];

    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (id)_predicateForPass:(id)a3
{
  v3 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    v3 = @"pass_pid";
  }
  else {
    v3 = 0;
  }
  return v3;
}

+ (id)passRelevancyModelInDatabase:(id)a3 forPassUniqueID:(id)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPassUniqueID:a4];
  id v8 = +[SQLiteEntity anyInDatabase:v6 predicate:v7];

  return v8;
}

- (id)initForPass:(id)a3 inDatabase:(id)a4
{
  CFStringRef v11 = @"pass_pid";
  id v6 = a4;
  v7 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [a3 persistentID]);
  v12 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  v9 = [(SQLiteEntity *)[PassRelevancyModel alloc] initWithPropertyValues:v8 inDatabase:v6];
  return v9;
}

- (id)passRelevancyModel
{
  id v2 = [objc_alloc((Class)PKPassRelevancyModel) _init];
  [v2 setRelevancyActive:1];
  return v2;
}

+ (id)insertForPass:(id)a3 inDatabase:(id)a4
{
  id v5 = a3;
  id result = a4;
  if (v5)
  {
    id v7 = result;
    id v8 = [[PassRelevancyModel alloc] initForPass:v5 inDatabase:result];

    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

+ (void)deleteEntitiesForPass:(id)a3 inDatabase:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v8 = [a1 _predicateForPass:a3];
    id v7 = [a1 queryWithDatabase:v6 predicate:v8];

    [v7 deleteAllEntities];
  }
}

+ (id)_predicateForPassUniqueID:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pass.unique_id" equalToValue:a3];
}

- (BOOL)deleteFromDatabase
{
  v3.receiver = self;
  v3.super_class = (Class)PassRelevancyModel;
  return [(SQLiteEntity *)&v3 deleteFromDatabase];
}

@end