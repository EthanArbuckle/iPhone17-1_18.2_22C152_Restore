@interface LocationSource
+ (id)anyInDatabase:(id)a3 withLocationSourcePID:(id)a4;
+ (id)anyInDatabase:(id)a3 withURL:(id)a4;
+ (id)databaseTable;
+ (id)foreignKeyColumnForTable:(id)a3;
+ (id)insertLocationSourceWithURL:(id)a3 forPass:(id)a4 type:(int)a5 inDatabase:(id)a6;
+ (id)locationSourcePIDPredicate:(id)a3;
+ (id)urlPredicate:(id)a3;
- (BOOL)deleteFromDatabase;
- (LocationSource)initWithLocationURL:(id)a3 type:(int)a4 inDatabase:(id)a5;
@end

@implementation LocationSource

+ (id)databaseTable
{
  return @"location_source";
}

+ (id)foreignKeyColumnForTable:(id)a3
{
  if ([a3 isEqualToString:@"location"]) {
    return @"location_source_pid";
  }
  else {
    return 0;
  }
}

- (LocationSource)initWithLocationURL:(id)a3 type:(int)a4 inDatabase:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSMutableDictionary dictionary];
  v11 = [v9 absoluteString];

  [v10 setObject:v11 forKey:@"url"];
  v12 = +[NSNumber numberWithInt:v5];
  [v10 setObject:v12 forKey:@"type"];

  v15.receiver = self;
  v15.super_class = (Class)LocationSource;
  v13 = [(SQLiteEntity *)&v15 initWithPropertyValues:v10 inDatabase:v8];

  return v13;
}

+ (id)insertLocationSourceWithURL:(id)a3 forPass:(id)a4 type:(int)a5 inDatabase:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = a6;
  id v12 = a3;
  id v13 = [objc_alloc((Class)a1) initWithLocationURL:v12 type:v7 inDatabase:v11];

  id v14 = +[PassLocationSource insertPassLocationSourceWithPass:v10 locationSource:v13 inDatabase:v11];
  return v13;
}

+ (id)anyInDatabase:(id)a3 withLocationSourcePID:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 locationSourcePIDPredicate:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)anyInDatabase:(id)a3 withURL:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    uint64_t v7 = [a1 urlPredicate:a4];
    id v8 = [a1 anyInDatabase:v6 predicate:v7];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

+ (id)locationSourcePIDPredicate:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:a3];
}

+ (id)urlPredicate:(id)a3
{
  v3 = [a3 absoluteString];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"url" equalToValue:v3];

  return v4;
}

- (BOOL)deleteFromDatabase
{
  v2 = self;
  v3 = [(SQLiteEntity *)self valueForProperty:@"pid"];
  v4 = [(SQLiteEntity *)v2 database];
  uint64_t v5 = +[Location queryWithDatabase:locationSourcePID:](Location, "queryWithDatabase:locationSourcePID:", v4, [v3 longLongValue]);

  [v5 deleteAllEntities];
  v7.receiver = v2;
  v7.super_class = (Class)LocationSource;
  LOBYTE(v2) = [(SQLiteEntity *)&v7 deleteFromDatabase];

  return (char)v2;
}

@end