@interface SharedAccountCloudStoreZone
+ (id)_predicateForSharedAccountCloudStorePID:(int64_t)a3;
+ (id)_predicateForSharedAccountCloudStoreZoneWithAccountIdentifier:(id)a3 zoneName:(id)a4 access:(unint64_t)a5 sharedAccountCloudStorePID:(int64_t)a6;
+ (id)_propertySettersForSharedAccountCloudStoreZone;
+ (id)_sharedAccountCloudStoreZoneWithAccountIdentifier:(id)a3 zoneName:(id)a4 access:(unint64_t)a5 sharedAccountCloudStorePID:(int64_t)a6 inDatabase:(id)a7;
+ (id)_sharedAccountCloudStoreZonesWithQuery:(id)a3;
+ (id)associationPropertyForEntityClass:(Class)a3;
+ (id)databaseTable;
+ (id)insertOrUpdateSharedAccountCloudStoreZones:(id)a3 forSharedAccountCloudStorePID:(int64_t)a4 inDatabase:(id)a5;
+ (id)sharedAccountCloudStoreZonesForSharedAccountCloudStorePID:(int64_t)a3 inDatabase:(id)a4;
+ (void)deleteEntitiesForSharedAccountCloudStore:(id)a3 inDatabase:(id)a4;
- (SharedAccountCloudStoreZone)initWithSharedAccountCloudStoreZone:(id)a3 forSharedAccountCloudStorePID:(int64_t)a4 inDatabase:(id)a5;
- (id)_commonDictionaryForSharedAccountCloudStoreZone:(id)a3 forSharedAccountCloudStorePID:(int64_t)a4;
- (id)sharedAccountCloudStoreZone;
- (void)updateSharedAccountCloudStoreZone:(id)a3 forSharedAccountCloudStorePID:(int64_t)a4;
@end

@implementation SharedAccountCloudStoreZone

+ (id)databaseTable
{
  return @"almonds";
}

+ (id)associationPropertyForEntityClass:(Class)a3
{
  if ((Class)objc_opt_class() == a3) {
    return @"peanuts_pid";
  }
  else {
    return 0;
  }
}

+ (id)insertOrUpdateSharedAccountCloudStoreZones:(id)a3 forSharedAccountCloudStorePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v21 = objc_alloc_init((Class)NSMutableArray);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v15 = [v14 accountIdentifier];
        v16 = [v14 zoneName];
        objc_msgSend(a1, "_sharedAccountCloudStoreZoneWithAccountIdentifier:zoneName:access:sharedAccountCloudStorePID:inDatabase:", v15, v16, objc_msgSend(v14, "access"), a4, v9);
        id v17 = (id)objc_claimAutoreleasedReturnValue();

        if (v17) {
          [v17 updateSharedAccountCloudStoreZone:v14 forSharedAccountCloudStorePID:a4];
        }
        else {
          id v17 = [objc_alloc((Class)a1) initWithSharedAccountCloudStoreZone:v14 forSharedAccountCloudStorePID:a4 inDatabase:v9];
        }
        [v21 addObject:v17];
      }
      id v11 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  id v18 = [v21 copy];
  return v18;
}

- (SharedAccountCloudStoreZone)initWithSharedAccountCloudStoreZone:(id)a3 forSharedAccountCloudStorePID:(int64_t)a4 inDatabase:(id)a5
{
  id v8 = a5;
  id v9 = [(SharedAccountCloudStoreZone *)self _commonDictionaryForSharedAccountCloudStoreZone:a3 forSharedAccountCloudStorePID:a4];
  id v10 = [(SQLiteEntity *)self initWithPropertyValues:v9 inDatabase:v8];

  return v10;
}

- (void)updateSharedAccountCloudStoreZone:(id)a3 forSharedAccountCloudStorePID:(int64_t)a4
{
  id v5 = [(SharedAccountCloudStoreZone *)self _commonDictionaryForSharedAccountCloudStoreZone:a3 forSharedAccountCloudStorePID:a4];
  [(SQLiteEntity *)self setValuesWithDictionary:v5];
}

+ (id)_predicateForSharedAccountCloudStoreZoneWithAccountIdentifier:(id)a3 zoneName:(id)a4 access:(unint64_t)a5 sharedAccountCloudStorePID:(int64_t)a6
{
  id v10 = a4;
  id v11 = +[SQLiteComparisonPredicate predicateWithProperty:@"account_identifier" equalToValue:a3];
  v19[0] = v11;
  uint64_t v12 = +[SQLiteComparisonPredicate predicateWithProperty:@"zone_name" equalToValue:v10];

  v19[1] = v12;
  v13 = +[NSNumber numberWithUnsignedInteger:a5];
  v14 = +[SQLiteComparisonPredicate predicateWithProperty:@"access" equalToValue:v13];
  v19[2] = v14;
  v15 = [a1 _predicateForSharedAccountCloudStorePID:a6];
  v19[3] = v15;
  v16 = +[NSArray arrayWithObjects:v19 count:4];
  id v17 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v16];

  return v17;
}

+ (id)_predicateForSharedAccountCloudStorePID:(int64_t)a3
{
  v3 = +[NSNumber numberWithLongLong:a3];
  v4 = +[SQLiteComparisonPredicate predicateWithProperty:@"peanuts_pid" equalToValue:v3];
  id v8 = v4;
  id v5 = +[NSArray arrayWithObjects:&v8 count:1];
  v6 = +[SQLiteCompoundPredicate predicateMatchingAllPredicates:v5];

  return v6;
}

+ (void)deleteEntitiesForSharedAccountCloudStore:(id)a3 inDatabase:(id)a4
{
  id v6 = a4;
  objc_msgSend(a1, "_predicateForSharedAccountCloudStorePID:", objc_msgSend(a3, "persistentID"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = [a1 queryWithDatabase:v6 predicate:v8];

  [v7 deleteAllEntities];
}

+ (id)sharedAccountCloudStoreZonesForSharedAccountCloudStorePID:(int64_t)a3 inDatabase:(id)a4
{
  id v6 = a4;
  v7 = [a1 _predicateForSharedAccountCloudStorePID:a3];
  id v8 = [a1 queryWithDatabase:v6 predicate:v7];

  id v9 = [a1 _sharedAccountCloudStoreZonesWithQuery:v8];

  return v9;
}

+ (id)_sharedAccountCloudStoreZoneWithAccountIdentifier:(id)a3 zoneName:(id)a4 access:(unint64_t)a5 sharedAccountCloudStorePID:(int64_t)a6 inDatabase:(id)a7
{
  id v12 = a7;
  v13 = [a1 _predicateForSharedAccountCloudStoreZoneWithAccountIdentifier:a3 zoneName:a4 access:a5 sharedAccountCloudStorePID:a6];
  v14 = [a1 anyInDatabase:v12 predicate:v13];

  return v14;
}

- (id)sharedAccountCloudStoreZone
{
  id v3 = objc_alloc_init((Class)PKSharedAccountCloudStoreZone);
  v4 = [(id)objc_opt_class() _propertySettersForSharedAccountCloudStoreZone];
  id v5 = [v4 allKeys];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000DA47C;
  v11[3] = &unk_10072DDD8;
  v11[4] = self;
  id v12 = v4;
  id v6 = v3;
  id v13 = v6;
  id v7 = v4;
  [(SQLiteEntity *)self getValuesForProperties:v5 withApplier:v11];

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (id)_sharedAccountCloudStoreZonesWithQuery:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _propertySettersForSharedAccountCloudStoreZone];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [v5 allKeys];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000DA604;
  v12[3] = &unk_10072EAD8;
  id v14 = v6;
  id v15 = a1;
  id v13 = v5;
  id v8 = v6;
  id v9 = v5;
  [v4 enumeratePersistentIDsAndProperties:v7 usingBlock:v12];

  id v10 = [v8 copy];
  return v10;
}

- (id)_commonDictionaryForSharedAccountCloudStoreZone:(id)a3 forSharedAccountCloudStorePID:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[NSMutableDictionary dictionary];
  id v7 = +[NSNumber numberWithLongLong:a4];
  [v6 setObjectOrNull:v7 forKey:@"peanuts_pid"];

  id v8 = [v5 zoneName];
  [v6 setObjectOrNull:v8 forKey:@"zone_name"];

  id v9 = [v5 accountIdentifier];
  [v6 setObjectOrNull:v9 forKey:@"account_identifier"];

  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "accountType"), @"account_type");
  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "access"), @"access");
  objc_msgSend(v6, "setInteger:forKey:", objc_msgSend(v5, "mode"), @"mode");
  id v10 = [v5 originatorAltDSID];
  [v6 setObjectOrNull:v10 forKey:@"a"];

  id v11 = [v5 sharedUsersAltDSIDs];

  id v12 = [v11 allObjects];
  id v13 = [v12 componentsJoinedByString:@","];
  [v6 setObjectOrNull:v13 forKey:@"b"];

  return v6;
}

+ (id)_propertySettersForSharedAccountCloudStoreZone
{
  v4[0] = @"zone_name";
  v4[1] = @"account_identifier";
  v5[0] = &stru_100734CD0;
  v5[1] = &stru_100734CF0;
  v4[2] = @"account_type";
  v4[3] = @"access";
  v5[2] = &stru_100734D10;
  v5[3] = &stru_100734D30;
  v4[4] = @"mode";
  v4[5] = @"a";
  v5[4] = &stru_100734D50;
  v5[5] = &stru_100734D70;
  v4[6] = @"b";
  v5[6] = &stru_100734D90;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];
  return v2;
}

@end