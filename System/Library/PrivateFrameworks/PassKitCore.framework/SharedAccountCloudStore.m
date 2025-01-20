@interface SharedAccountCloudStore
+ (id)_predicateForAccountPID:(int64_t)a3;
+ (id)_propertySettersForSharedAccountCloudStore;
+ (id)_sharedAccountCloudStoreForQuery:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateSharedAccountCloudStore:(id)a3 forAccount:(id)a4 inDatabase:(id)a5;
+ (id)sharedAccountCloudStoreByAccountIdentifierInDatabase:(id)a3;
+ (id)sharedAccountCloudStoreForAccount:(id)a3 inDatabase:(id)a4;
+ (void)addJoinClausesForProperty:(id)a3 toJoins:(id)a4;
+ (void)deleteEntitiesForAccountPID:(int64_t)a3 inDatabase:(id)a4;
- (BOOL)deleteFromDatabase;
- (SharedAccountCloudStore)initWithSharedAccountCloudStore:(id)a3 forAccount:(id)a4 inDatabase:(id)a5;
- (id)_commonDictionaryForSharedAccountCloudStore:(id)a3 accountPID:(int64_t)a4;
- (id)sharedAccountCloudStore;
- (void)updateWithSharedAccountCloudStore:(id)a3 forAccount:(id)a4;
@end

@implementation SharedAccountCloudStore

+ (id)databaseTable
{
  return @"peanuts";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"account_pid";
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
  if (v7 == @"pears.a"
    || v7 && (unsigned int v8 = [@"pears.a" isEqualToString:v7], v9, v8))
  {
    [v6 addObject:@"JOIN pears ON pears.pid = peanuts.account_pid"];
  }
}

+ (id)insertOrUpdateSharedAccountCloudStore:(id)a3 forAccount:(id)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_msgSend(a1, "_predicateForAccountPID:", objc_msgSend(v9, "persistentID"));
  id v12 = [a1 anyInDatabase:v10 predicate:v11];

  if (v12) {
    [v12 updateWithSharedAccountCloudStore:v8 forAccount:v9];
  }
  else {
    id v12 = [objc_alloc((Class)a1) initWithSharedAccountCloudStore:v8 forAccount:v9 inDatabase:v10];
  }

  return v12;
}

- (SharedAccountCloudStore)initWithSharedAccountCloudStore:(id)a3 forAccount:(id)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = -[SharedAccountCloudStore _commonDictionaryForSharedAccountCloudStore:accountPID:](self, "_commonDictionaryForSharedAccountCloudStore:accountPID:", v9, [a4 persistentID]);
  v11 = [(SQLiteEntity *)self initWithPropertyValues:v10 inDatabase:v8];
  id v12 = [(SQLiteEntity *)v11 persistentID];
  v13 = [v9 sharedAccountCloudStoreZones];

  id v14 = +[SharedAccountCloudStoreZone insertOrUpdateSharedAccountCloudStoreZones:v13 forSharedAccountCloudStorePID:v12 inDatabase:v8];
  return v11;
}

- (void)updateWithSharedAccountCloudStore:(id)a3 forAccount:(id)a4
{
  id v6 = a3;
  -[SharedAccountCloudStore _commonDictionaryForSharedAccountCloudStore:accountPID:](self, "_commonDictionaryForSharedAccountCloudStore:accountPID:", v6, [a4 persistentID]);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [(SQLiteEntity *)self setValuesWithDictionary:v12];
  v7 = [(SQLiteEntity *)self database];
  +[SharedAccountCloudStoreZone deleteEntitiesForSharedAccountCloudStore:self inDatabase:v7];

  id v8 = [v6 sharedAccountCloudStoreZones];

  int64_t v9 = [(SQLiteEntity *)self persistentID];
  id v10 = [(SQLiteEntity *)self database];
  id v11 = +[SharedAccountCloudStoreZone insertOrUpdateSharedAccountCloudStoreZones:v8 forSharedAccountCloudStorePID:v9 inDatabase:v10];
}

+ (id)sharedAccountCloudStoreForAccount:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = objc_msgSend(a1, "_predicateForAccountPID:", objc_msgSend(a3, "persistentID"));
  id v8 = [a1 anyInDatabase:v6 predicate:v7];

  int64_t v9 = [v8 sharedAccountCloudStore];

  return v9;
}

+ (id)sharedAccountCloudStoreByAccountIdentifierInDatabase:(id)a3
{
  id v4 = a3;
  id v5 = +[Account databaseTable];
  id v6 = [a1 databaseTable];
  v7 = +[Account databaseTable];
  id v8 = [a1 databaseTable];
  int64_t v9 = +[Account databaseTable];
  id v10 = +[NSString stringWithFormat:@"SELECT DISTINCT %@.pid, %@ FROM %@, %@ WHERE %@.%@ = %@.pid", v5, @"pears.a", v6, v7, v8, @"account_pid", v9];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10045C40C;
  v15[3] = &unk_10073AA38;
  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  id v18 = a1;
  id v16 = v4;
  id v11 = v17;
  id v12 = v4;
  sub_100012DC8((uint64_t)v12, v10, v15);
  id v13 = [v11 copy];

  return v13;
}

+ (void)deleteEntitiesForAccountPID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  id v8 = [a1 _predicateForAccountPID:a3];
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

- (BOOL)deleteFromDatabase
{
  v3 = [(SQLiteEntity *)self database];
  +[SharedAccountCloudStoreZone deleteEntitiesForSharedAccountCloudStore:self inDatabase:v3];

  v5.receiver = self;
  v5.super_class = (Class)SharedAccountCloudStore;
  return [(SQLiteEntity *)&v5 deleteFromDatabase];
}

+ (id)_predicateForAccountPID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  id v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"account_pid" equalToValue:v3];

  return v4;
}

- (id)sharedAccountCloudStore
{
  id v3 = objc_alloc_init((Class)PKSharedAccountCloudStore);
  id v4 = +[SharedAccountCloudStore _propertySettersForSharedAccountCloudStore];
  objc_super v5 = [v4 allKeys];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10045C7B4;
  v13[3] = &unk_10072DDD8;
  v13[4] = self;
  id v14 = v4;
  id v6 = v3;
  id v15 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v13];

  int64_t v8 = [(SQLiteEntity *)self persistentID];
  int64_t v9 = [(SQLiteEntity *)self database];
  id v10 = +[SharedAccountCloudStoreZone sharedAccountCloudStoreZonesForSharedAccountCloudStorePID:v8 inDatabase:v9];

  [v6 setSharedAccountCloudStoreZones:v10];
  id v11 = v6;

  return v11;
}

+ (id)_sharedAccountCloudStoreForQuery:(id)a3
{
  id v4 = a3;
  objc_super v5 = [a1 _propertySettersForSharedAccountCloudStore];
  id v6 = objc_alloc_init((Class)PKSharedAccountCloudStore);
  id v7 = [v5 allKeys];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10045C940;
  v14[3] = &unk_10072DE00;
  id v18 = a1;
  id v15 = v5;
  id v8 = v6;
  id v16 = v8;
  id v17 = v4;
  id v9 = v4;
  id v10 = v5;
  [v9 enumeratePersistentIDsAndProperties:v7 usingBlock:v14];

  id v11 = v17;
  id v12 = v8;

  return v12;
}

- (id)_commonDictionaryForSharedAccountCloudStore:(id)a3 accountPID:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[NSMutableDictionary dictionary];
  id v7 = +[NSNumber numberWithLongLong:a4];
  [v6 setObjectOrNull:v7 forKey:@"account_pid"];

  id v8 = [v5 lastUpdated];
  id v9 = (void *)_SQLValueForDate();
  [v6 setObjectOrNull:v9 forKey:@"last_updated_date"];

  id v10 = [v5 isDirty];
  [v6 setBool:v10 forKey:@"dirty"];
  return v6;
}

+ (id)_propertySettersForSharedAccountCloudStore
{
  v4[0] = @"dirty";
  v4[1] = @"last_updated_date";
  v5[0] = &stru_100752CA0;
  v5[1] = &stru_100752CC0;
  v4[2] = @"pears.a";
  v5[2] = &stru_100752CE0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  return v2;
}

@end