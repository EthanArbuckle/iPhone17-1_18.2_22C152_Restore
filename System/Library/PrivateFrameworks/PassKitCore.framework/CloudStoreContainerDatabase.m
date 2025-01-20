@interface CloudStoreContainerDatabase
+ (id)_cloudStoreDatabaseWithContainerName:(id)a3 scope:(int64_t)a4 inDatabase:(id)a5;
+ (id)_predicateForContainerName:(id)a3;
+ (id)_predicateForContainerName:(id)a3 scope:(int64_t)a4;
+ (id)_predicateForPID:(int64_t)a3;
+ (id)_predicateForScope:(int64_t)a3;
+ (id)anyInDatabase:(id)a3 withContainerName:(id)a4 scope:(int64_t)a5;
+ (id)anyInDatabase:(id)a3 withPID:(int64_t)a4;
+ (id)databaseTable;
+ (id)insertOrUpdateCloudStoreDatabaseWithContainerName:(id)a3 scope:(int64_t)a4 inDatabase:(id)a5;
+ (void)removeCloudStoreDatabaseWithContainerName:(id)a3 scope:(int64_t)a4 inDatabase:(id)a5;
- (BOOL)deleteFromDatabase;
- (CloudStoreContainerDatabase)initWithCloudStoreDatabaseWithContainerName:(id)a3 scope:(int64_t)a4 inDatabase:(id)a5;
- (id)_commonDictionaryFoDatabaseWithScope:(int64_t)a3 containerName:(id)a4;
- (id)cloudStoreZones;
- (id)databaseSubscription;
- (void)updateWithContainerName:(id)a3 scope:(int64_t)a4;
- (void)updateWithDatabaseSubscription:(id)a3;
@end

@implementation CloudStoreContainerDatabase

+ (id)databaseTable
{
  return @"cloud_store_database";
}

+ (id)insertOrUpdateCloudStoreDatabaseWithContainerName:(id)a3 scope:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a1 _cloudStoreDatabaseWithContainerName:v8 scope:a4 inDatabase:v9];
  if (v10)
  {
    id v11 = v10;
    [v10 updateWithContainerName:v8 scope:a4];
  }
  else
  {
    id v11 = [objc_alloc((Class)a1) initWithCloudStoreDatabaseWithContainerName:v8 scope:a4 inDatabase:v9];
  }

  return v11;
}

- (CloudStoreContainerDatabase)initWithCloudStoreDatabaseWithContainerName:(id)a3 scope:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [(CloudStoreContainerDatabase *)self _commonDictionaryFoDatabaseWithScope:a4 containerName:a3];
  v10 = [(SQLiteEntity *)self initWithPropertyValues:v9 inDatabase:v8];

  return v10;
}

- (void)updateWithContainerName:(id)a3 scope:(int64_t)a4
{
  id v5 = [(CloudStoreContainerDatabase *)self _commonDictionaryFoDatabaseWithScope:a4 containerName:a3];
  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

- (void)updateWithDatabaseSubscription:(id)a3
{
  id v4 = [a3 subscriptionID];
  [(SQLiteEntity *)self setValue:v4 forProperty:@"subscription_id"];
}

+ (id)_cloudStoreDatabaseWithContainerName:(id)a3 scope:(int64_t)a4 inDatabase:(id)a5
{
  return [a1 anyInDatabase:a5 withContainerName:a3 scope:a4];
}

+ (void)removeCloudStoreDatabaseWithContainerName:(id)a3 scope:(int64_t)a4 inDatabase:(id)a5
{
  id v5 = [a1 _cloudStoreDatabaseWithContainerName:a3 scope:a4 inDatabase:a5];
  if (v5)
  {
    id v6 = v5;
    [v5 deleteFromDatabase];
    id v5 = v6;
  }
}

- (BOOL)deleteFromDatabase
{
  v3 = [(SQLiteEntity *)self database];
  +[CloudStoreZone deleteEntitiesForCloudStoreDatabase:self inDatabase:v3];

  v5.receiver = self;
  v5.super_class = (Class)CloudStoreContainerDatabase;
  return [(SQLiteEntity *)&v5 deleteFromDatabase];
}

+ (id)anyInDatabase:(id)a3 withContainerName:(id)a4 scope:(int64_t)a5
{
  id v8 = a3;
  id v9 = [a1 _predicateForContainerName:a4 scope:a5];
  v10 = [a1 anyInDatabase:v8 predicate:v9];

  return v10;
}

+ (id)anyInDatabase:(id)a3 withPID:(int64_t)a4
{
  id v6 = a3;
  v7 = [a1 _predicateForPID:a4];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  return v8;
}

+ (id)_predicateForContainerName:(id)a3 scope:(int64_t)a4
{
  id v6 = [a1 _predicateForContainerName:a3];
  v11[0] = v6;
  v7 = [a1 _predicateForScope:a4];
  v11[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:2];
  id v9 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

+ (id)_predicateForContainerName:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"container_name" equalToValue:a3];
}

+ (id)_predicateForScope:(int64_t)a3
{
  v3 = +[NSNumber numberWithInteger:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"scope" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:v3];

  return v4;
}

- (id)cloudStoreZones
{
  v3 = [(SQLiteEntity *)self database];
  id v4 = +[CloudStoreZone cloudStoreZonesForContainerDatabase:self inDatabase:v3];

  return v4;
}

- (id)databaseSubscription
{
  v2 = [(SQLiteEntity *)self valueForProperty:@"subscription_id"];
  if (v2) {
    id v3 = [objc_alloc((Class)CKDatabaseSubscription) initWithSubscriptionID:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)_commonDictionaryFoDatabaseWithScope:(int64_t)a3 containerName:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  [v6 setObjectOrNull:v5 forKey:@"container_name"];

  v7 = +[NSNumber numberWithInteger:a3];
  [v6 setObjectOrNull:v7 forKey:@"scope"];

  return v6;
}

@end