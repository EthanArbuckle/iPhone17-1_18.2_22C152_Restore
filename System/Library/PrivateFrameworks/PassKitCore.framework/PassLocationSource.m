@interface PassLocationSource
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertPassLocationSourceWithPass:(id)a3 locationSource:(id)a4 inDatabase:(id)a5;
+ (id)locationSourcePIDPredicate:(id)a3;
+ (id)passPIDPredicate:(unint64_t)a3;
+ (id)queryWithDatabase:(id)a3 locationSourcePID:(unint64_t)a4;
+ (id)queryWithDatabase:(id)a3 passPID:(unint64_t)a4;
+ (id)queryWithDatabase:(id)a3 passPID:(unint64_t)a4 locationSourcePID:(unint64_t)a5;
- (BOOL)deleteFromDatabase;
- (PassLocationSource)initWithPassPID:(unint64_t)a3 locationSourcePID:(unint64_t)a4 inDatabase:(id)a5;
@end

@implementation PassLocationSource

+ (id)databaseTable
{
  return @"pass_location_source";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"pass_pid";
  }
  if ((Class)objc_opt_class() == a3) {
    return @"location_source_pid";
  }
  return 0;
}

- (PassLocationSource)initWithPassPID:(unint64_t)a3 locationSourcePID:(unint64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  v9 = +[NSMutableDictionary dictionary];
  v10 = +[NSNumber numberWithLongLong:a3];
  [v9 setObject:v10 forKey:@"pass_pid"];

  v11 = +[NSNumber numberWithLongLong:a4];
  [v9 setObject:v11 forKey:@"location_source_pid"];

  v14.receiver = self;
  v14.super_class = (Class)PassLocationSource;
  v12 = [(SQLiteEntity *)&v14 initWithPropertyValues:v9 inDatabase:v8];

  return v12;
}

+ (id)insertPassLocationSourceWithPass:(id)a3 locationSource:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  id v12 = [v10 persistentID];

  id v13 = [v9 persistentID];
  id v14 = [v11 initWithPassPID:v12 locationSourcePID:v13 inDatabase:v8];

  return v14;
}

+ (id)passPIDPredicate:(unint64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pass_pid" equalToValue:v3];

  return v4;
}

+ (id)locationSourcePIDPredicate:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"location_source_pid" equalToValue:a3];
}

+ (id)queryWithDatabase:(id)a3 passPID:(unint64_t)a4
{
  id v6 = a3;
  v7 = [a1 passPIDPredicate:a4];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  return v8;
}

+ (id)queryWithDatabase:(id)a3 locationSourcePID:(unint64_t)a4
{
  id v6 = a3;
  v7 = +[NSNumber numberWithLongLong:a4];
  id v8 = [a1 locationSourcePIDPredicate:v7];
  id v9 = [a1 queryWithDatabase:v6 predicate:v8];

  return v9;
}

+ (id)queryWithDatabase:(id)a3 passPID:(unint64_t)a4 locationSourcePID:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [a1 passPIDPredicate:a4];
  v16[0] = v9;
  id v10 = +[NSNumber numberWithLongLong:a5];
  id v11 = [a1 locationSourcePIDPredicate:v10];
  v16[1] = v11;
  id v12 = +[NSArray arrayWithObjects:v16 count:2];
  id v13 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v12];
  id v14 = [a1 queryWithDatabase:v8 predicate:v13];

  return v14;
}

- (BOOL)deleteFromDatabase
{
  v3 = [(SQLiteEntity *)self valueForProperty:@"location_source_pid"];
  v4 = objc_opt_class();
  v5 = [(SQLiteEntity *)self database];
  id v6 = [(id)objc_opt_class() locationSourcePIDPredicate:v3];
  v7 = [v4 queryWithDatabase:v5 predicate:v6];

  if ((uint64_t)[v7 countOfEntities] <= 1)
  {
    id v8 = [(SQLiteEntity *)self database];
    id v9 = +[LocationSource anyInDatabase:v8 withLocationSourcePID:v3];

    [v9 deleteFromDatabase];
  }
  v12.receiver = self;
  v12.super_class = (Class)PassLocationSource;
  BOOL v10 = [(SQLiteEntity *)&v12 deleteFromDatabase];

  return v10;
}

@end