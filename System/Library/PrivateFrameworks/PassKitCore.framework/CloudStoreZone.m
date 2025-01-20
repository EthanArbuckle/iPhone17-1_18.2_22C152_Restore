@interface CloudStoreZone
+ (BOOL)didFinishInitialSyncForCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5;
+ (id)_cloudStoreZoneWithName:(id)a3 containerDatabase:(id)a4 inDatabase:(id)a5;
+ (id)_cloudStoreZonesWithQuery:(id)a3;
+ (id)_predicateForDatabasePID:(int64_t)a3;
+ (id)_predicateForPID:(int64_t)a3;
+ (id)_predicateForZoneName:(id)a3;
+ (id)_predicateForZoneName:(id)a3 forContainerDatabase:(id)a4;
+ (id)_propertySettersForCloudStoreZone;
+ (id)anyInDatabase:(id)a3 forCloudStoreZone:(id)a4;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)cloudStoreZoneWithPID:(int64_t)a3 inDatabase:(id)a4;
+ (id)cloudStoreZonesForContainerDatabase:(id)a3 inDatabase:(id)a4;
+ (id)databaseTable;
+ (id)fetchTimestampForCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5;
+ (id)insertOrUpdateCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5;
+ (id)tokenDataForCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForCloudStoreDatabase:(id)a3 inDatabase:(id)a4;
+ (void)removeCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5;
+ (void)updateChangeToken:(id)a3 fetchTimestamp:(id)a4 forCloudStoreZone:(id)a5 inContainerDatabase:(id)a6 inDatabase:(id)a7;
+ (void)updateDidFinishInitialSync:(BOOL)a3 forCloudStoreZone:(id)a4 inContainerDatabase:(id)a5 inDatabase:(id)a6;
- (BOOL)deleteFromDatabase;
- (CloudStoreZone)initWithCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5;
- (id)_commonDictionaryForCloudStoreZone:(id)a3 forContainerDatabase:(id)a4;
- (id)cloudStoreZone;
- (id)zoneName;
- (void)updateWithCloudStoreZone:(id)a3 forContainerDatabase:(id)a4;
- (void)updateWithShareParticipants:(id)a3;
@end

@implementation CloudStoreZone

+ (id)databaseTable
{
  return @"cloud_store_zone";
}

+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (__CFString *)v5;
  v12 = v7;
  if (v7 == @"cloud_store_database.container_name"
    || v7
    && ((unsigned __int8 v8 = [@"cloud_store_database.container_name" isEqualToString:v7],
         v12,
         (v8 & 1) != 0)
     || (v9 = v12, v9 == @"cloud_store_database.scope")
     || (v10 = v9,
         unsigned int v11 = [@"cloud_store_database.scope" isEqualToString:v9],
         v10,
         v11)))
  {
    [v6 addObject:@"JOIN cloud_store_database ON cloud_store_database.pid = cloud_store_zone.container_database_pid"];
  }
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"container_database_pid";
  }
  else {
    return 0;
  }
}

+ (id)insertOrUpdateCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = [v8 zoneName];
  id v12 = [a1 _cloudStoreZoneWithName:v11 containerDatabase:v9 inDatabase:v10];

  if (v12) {
    [v12 updateWithCloudStoreZone:v8 forContainerDatabase:v9];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithCloudStoreZone:v8 forContainerDatabase:v9 inDatabase:v10];
  }

  return v12;
}

+ (void)updateChangeToken:(id)a3 fetchTimestamp:(id)a4 forCloudStoreZone:(id)a5 inContainerDatabase:(id)a6 inDatabase:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  v15 = [a5 zoneName];
  v16 = [a1 _cloudStoreZoneWithName:v15 containerDatabase:v14 inDatabase:v13];

  if (v16)
  {
    [v16 setValue:v18 forProperty:@"token_data"];
    v17 = (void *)_SQLValueForDate();
    [v16 setValue:v17 forProperty:@"fetch_timestamp"];
  }
}

+ (void)updateDidFinishInitialSync:(BOOL)a3 forCloudStoreZone:(id)a4 inContainerDatabase:(id)a5 inDatabase:(id)a6
{
  BOOL v8 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = [a4 zoneName];
  id v14 = [a1 _cloudStoreZoneWithName:v12 containerDatabase:v11 inDatabase:v10];

  if (v14)
  {
    id v13 = +[NSNumber numberWithBool:v8];
    [v14 setValue:v13 forProperty:@"did_finish_initial_sync"];
  }
}

- (CloudStoreZone)initWithCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(CloudStoreZone *)self _commonDictionaryForCloudStoreZone:v8 forContainerDatabase:a4];
  id v11 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v9];

  id v12 = v11;
  if (v12)
  {
    id v13 = [v8 shareParticipants];
    [(CloudStoreZone *)v12 updateWithShareParticipants:v13];
  }
  return v12;
}

- (void)updateWithCloudStoreZone:(id)a3 forContainerDatabase:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 shareParticipants];
  [(CloudStoreZone *)self updateWithShareParticipants:v8];

  id v9 = [(CloudStoreZone *)self _commonDictionaryForCloudStoreZone:v7 forContainerDatabase:v6];

  [(SQLiteEntity *)self setValuesWithDictionary:v9];
}

- (void)updateWithShareParticipants:(id)a3
{
  id v4 = a3;
  id v5 = [(SQLiteEntity *)self database];
  +[CloudStoreZoneShareParticipant updateShareParticipants:v4 forCloudStoreZone:self inDatabase:v5];
}

+ (id)anyInDatabase:(id)a3 forCloudStoreZone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 containerName];
  id v9 = +[CloudStoreContainerDatabase anyInDatabase:withContainerName:scope:](CloudStoreContainerDatabase, "anyInDatabase:withContainerName:scope:", v7, v8, [v6 scope]);

  id v10 = [v6 zoneName];

  id v11 = [a1 _cloudStoreZoneWithName:v10 containerDatabase:v9 inDatabase:v7];

  return v11;
}

+ (id)cloudStoreZoneWithPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForPID:a3];
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  id v9 = [v8 cloudStoreZone];

  return v9;
}

+ (id)_cloudStoreZoneWithName:(id)a3 containerDatabase:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [a1 _predicateForZoneName:a3 forContainerDatabase:a4];
  id v10 = [a1 anyInDatabase:v8 predicate:v9];

  return v10;
}

+ (void)removeCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 zoneName];
  id v12 = [a1 _cloudStoreZoneWithName:v10 containerDatabase:v9 inDatabase:v8];

  id v11 = v12;
  if (v12)
  {
    [v12 deleteFromDatabase];
    id v11 = v12;
  }
}

- (BOOL)deleteFromDatabase
{
  v3 = [(SQLiteEntity *)self database];
  +[CloudStoreZoneShareParticipant deleteEntitiesForCloudStoreZone:self inDatabase:v3];

  int64_t v4 = [(SQLiteEntity *)self persistentID];
  id v5 = [(SQLiteEntity *)self database];
  +[PaymentTransactionArchiveLocation deleteArchiveLocationsForCloudStoreZonePID:v4 inDatabase:v5];

  int64_t v6 = [(SQLiteEntity *)self persistentID];
  id v7 = [(SQLiteEntity *)self database];
  +[CloudStoreRecord deleteEntitiesForCloudStoreZonePID:v6 inDatabase:v7];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  id v9 = [(SQLiteEntity *)self database];
  +[CloudStoreShareBackoff deleteEntriesWithCloudStoreZonePID:v8 inDatabase:v9];

  int64_t v10 = [(SQLiteEntity *)self persistentID];
  id v11 = [(SQLiteEntity *)self database];
  +[CloudStoreRecordFetchTask deleteAllEntriesForCloudStoreZonePID:v10 inDatabase:v11];

  v13.receiver = self;
  v13.super_class = (Class)CloudStoreZone;
  return [(SQLiteEntity *)&v13 deleteFromDatabase];
}

+ (void)deleteEntitiesForCloudStoreDatabase:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  objc_msgSend(a1, "_predicateForDatabasePID:", objc_msgSend(a3, "persistentID"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)_predicateForZoneName:(id)a3 forContainerDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [a1 _predicateForZoneName:a3];
  v13[0] = v7;
  id v8 = [v6 persistentID];

  id v9 = [a1 _predicateForDatabasePID:v8];
  v13[1] = v9;
  int64_t v10 = +[NSArray arrayWithObjects:v13 count:2];
  id v11 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v10];

  return v11;
}

+ (id)_predicateForZoneName:(id)a3
{
  return +[SQLiteComparisonPredicate predicateWithProperty:@"zone_name" equalToValue:a3];
}

+ (id)_predicateForDatabasePID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  int64_t v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"container_database_pid" equalToValue:v3];

  return v4;
}

+ (id)_predicateForPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  int64_t v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"pid" equalToValue:v3];

  return v4;
}

+ (id)tokenDataForCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  int64_t v10 = [a3 zoneName];
  id v11 = [a1 _cloudStoreZoneWithName:v10 containerDatabase:v9 inDatabase:v8];

  if (v11)
  {
    id v12 = [v11 valueForProperty:@"token_data"];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (BOOL)didFinishInitialSyncForCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  int64_t v10 = [a3 zoneName];
  id v11 = [a1 _cloudStoreZoneWithName:v10 containerDatabase:v9 inDatabase:v8];

  if (v11)
  {
    id v12 = [v11 valueForProperty:@"did_finish_initial_sync"];
    unsigned __int8 v13 = [v12 BOOLValue];
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

+ (id)fetchTimestampForCloudStoreZone:(id)a3 forContainerDatabase:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  int64_t v10 = [a3 zoneName];
  id v11 = [a1 _cloudStoreZoneWithName:v10 containerDatabase:v9 inDatabase:v8];

  if (v11)
  {
    id v12 = [v11 valueForProperty:@"fetch_timestamp"];
    unsigned __int8 v13 = (void *)_DateForSQLValue();
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

+ (id)cloudStoreZonesForContainerDatabase:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(a1, "_predicateForDatabasePID:", objc_msgSend(a3, "persistentID"));
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _cloudStoreZonesWithQuery:v8];

  return v9;
}

+ (id)_cloudStoreZonesWithQuery:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableSet);
  CFStringRef v16 = @"pid";
  id v5 = +[NSArray arrayWithObjects:&v16 count:1];
  int64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_1003A2450;
  unsigned __int8 v13 = &unk_10072ED00;
  id v14 = v3;
  id v15 = v4;
  id v6 = v4;
  id v7 = v3;
  [v7 enumeratePersistentIDsAndProperties:v5 usingBlock:&v10];

  id v8 = objc_msgSend(v6, "copy", v10, v11, v12, v13);
  return v8;
}

- (id)cloudStoreZone
{
  id v3 = objc_alloc_init((Class)PKCloudStoreZone);
  id v4 = +[CloudStoreZone _propertySettersForCloudStoreZone];
  id v5 = [v4 allKeys];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  void v13[2] = sub_1003A2644;
  v13[3] = &unk_10072DDD8;
  v13[4] = self;
  id v14 = v4;
  id v6 = v3;
  id v15 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v13];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  id v9 = [(SQLiteEntity *)self database];
  int64_t v10 = +[CloudStoreZoneShareParticipant shareParticipantsForCloudStoreZonePID:v8 inDatabase:v9];

  [v6 setShareParticipants:v10];
  id v11 = v6;

  return v11;
}

- (id)zoneName
{
  return [(SQLiteEntity *)self valueForProperty:@"zone_name"];
}

- (id)_commonDictionaryForCloudStoreZone:(id)a3 forContainerDatabase:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSMutableDictionary dictionary];
  id v8 = [v5 persistentID];

  id v9 = +[NSNumber numberWithLongLong:v8];
  [v7 setObjectOrNull:v9 forKey:@"container_database_pid"];

  int64_t v10 = [v6 zoneName];
  [v7 setObjectOrNull:v10 forKey:@"zone_name"];

  id v11 = [v6 ownerName];
  [v7 setObjectOrNull:v11 forKey:@"zone_owner"];

  id v12 = [v6 zoneSubscriptionIdentifier];

  [v7 setObjectOrNull:v12 forKey:@"subscription_id"];
  return v7;
}

+ (id)_propertySettersForCloudStoreZone
{
  v4[0] = @"zone_name";
  v4[1] = @"zone_owner";
  v5[0] = &stru_10074D878;
  v5[1] = &stru_10074D898;
  v4[2] = @"cloud_store_database.container_name";
  v4[3] = @"subscription_id";
  v5[2] = &stru_10074D8B8;
  v5[3] = &stru_10074D8D8;
  v4[4] = @"cloud_store_database.scope";
  v5[4] = &stru_10074D8F8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

@end