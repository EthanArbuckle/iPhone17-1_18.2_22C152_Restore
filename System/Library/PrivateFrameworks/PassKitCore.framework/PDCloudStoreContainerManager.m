@interface PDCloudStoreContainerManager
- (BOOL)cloudStoreZoneExistsForZoneName:(id)a3;
- (BOOL)didFinishInitialSyncForCloudStoreZone:(id)a3;
- (CKContainer)container;
- (PDCloudStoreContainerManager)initWithContainer:(id)a3 validScopes:(id)a4 cacheDataSource:(id)a5 databaseContainerDataSource:(id)a6;
- (id)allPossibleSubscriptionIdentifiersByDatabaseIdentifier;
- (id)allPossibleZoneIDsByDatabaseIdentifier;
- (id)allPossibleZoneIDsInContainerDatabase:(id)a3;
- (id)changeTokenForCloudStoreStore:(id)a3;
- (id)cloudStoreZoneForZoneID:(id)a3 inContainerDatabase:(id)a4;
- (id)cloudStoreZoneForZoneName:(id)a3 inContainerDatabase:(id)a4;
- (id)cloudStoreZonesByDatabaseIdentifierForItem:(id)a3 action:(unint64_t)a4;
- (id)cloudStoreZonesByDatabaseIdentifierForItemType:(unint64_t)a3 action:(unint64_t)a4;
- (id)cloudStoreZonesByDatabaseIdentifierForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5;
- (id)cloudStoreZonesFromZoneNames:(id)a3 inContainerDatabase:(id)a4;
- (id)cloudStoreZonesInContainerDatabase:(id)a3;
- (id)containerName;
- (id)databaseForCloudStoreZone:(id)a3;
- (id)databaseForIdentifier:(id)a3;
- (id)databaseForScope:(int64_t)a3;
- (id)databaseIdentifierForScope:(int64_t)a3;
- (id)description;
- (id)fetchTimestampForCloudStoreStore:(id)a3;
- (id)subscriptionIdentifiersForDatabaseZoneIDs:(id)a3;
- (id)subscriptionsForDatabaseZones:(id)a3;
- (id)subscriptionsThatNeedToBeCreated;
- (id)validDatabaseIdentifiers;
- (id)validDatabases;
- (id)zonesThatNeedToBeCreated;
- (void)clearCacheInContainer;
- (void)clearCacheInContainerForZoneName:(id)a3;
- (void)containerDatabaseIdentifier:(id)a3 didCreateSubscriptions:(id)a4;
- (void)containerDatabaseIdentifier:(id)a3 didCreateZones:(id)a4;
- (void)containerDatabaseIdentifier:(id)a3 didFinishInitialSync:(BOOL)a4 forZoneID:(id)a5;
- (void)containerDatabaseIdentifier:(id)a3 didRemoveSubscriptionIdentifiers:(id)a4;
- (void)containerDatabaseIdentifier:(id)a3 didRemoveZoneIDs:(id)a4;
- (void)containerDatabaseIdentifier:(id)a3 didUpdateChangeToken:(id)a4 fetchTimestamp:(id)a5 forZoneID:(id)a6;
- (void)containerDatabaseIdentifier:(id)a3 didUpdateShare:(id)a4 forZoneID:(id)a5;
- (void)createContainerCacheIfNecessary;
- (void)setContainer:(id)a3;
@end

@implementation PDCloudStoreContainerManager

- (PDCloudStoreContainerManager)initWithContainer:(id)a3 validScopes:(id)a4 cacheDataSource:(id)a5 databaseContainerDataSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v43.receiver = self;
  v43.super_class = (Class)PDCloudStoreContainerManager;
  v15 = [(PDCloudStoreContainerManager *)&v43 init];
  v16 = v15;
  if (v15)
  {
    id v40 = v11;
    p_container = (id *)&v15->_container;
    objc_storeStrong((id *)&v15->_container, a3);
    v42 = [(CKContainer *)v16->_container containerIdentifier];
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    id v19 = objc_alloc_init((Class)NSMutableDictionary);
    if ([v12 containsObject:&off_10078BA30])
    {
      v20 = [PDCloudStoreContainerDatabase alloc];
      v21 = [*p_container privateCloudDatabase];
      v22 = [(PDCloudStoreContainerDatabase *)v20 initWithDatabase:v21 containerName:v42 cacheDataSource:v13 databaseContainerDataSource:v14];

      v23 = +[NSNumber numberWithInteger:[(PDCloudStoreContainerDatabase *)v22 scope]];
      [v18 setObject:v22 forKey:v23];

      [(PDCloudStoreContainerDatabase *)v22 scope];
      v24 = CKDatabaseScopeString();
      [v19 setObject:v22 forKey:v24];
    }
    if (objc_msgSend(v12, "containsObject:", &off_10078BA48, v40))
    {
      v25 = [PDCloudStoreContainerDatabase alloc];
      v26 = [*p_container sharedCloudDatabase];
      v27 = [(PDCloudStoreContainerDatabase *)v25 initWithDatabase:v26 containerName:v42 cacheDataSource:v13 databaseContainerDataSource:v14];

      v28 = +[NSNumber numberWithInteger:[(PDCloudStoreContainerDatabase *)v27 scope]];
      [v18 setObject:v27 forKey:v28];

      [(PDCloudStoreContainerDatabase *)v27 scope];
      v29 = CKDatabaseScopeString();
      [v19 setObject:v27 forKey:v29];
    }
    if ([v12 containsObject:&off_10078BA60])
    {
      v30 = [PDCloudStoreContainerDatabase alloc];
      v31 = [*p_container publicCloudDatabase];
      v32 = [(PDCloudStoreContainerDatabase *)v30 initWithDatabase:v31 containerName:v42 cacheDataSource:v13 databaseContainerDataSource:v14];

      v33 = +[NSNumber numberWithInteger:[(PDCloudStoreContainerDatabase *)v32 scope]];
      [v18 setObject:v32 forKey:v33];

      [(PDCloudStoreContainerDatabase *)v32 scope];
      v34 = CKDatabaseScopeString();
      [v19 setObject:v32 forKey:v34];
    }
    v35 = (NSDictionary *)[v18 copy];
    databaseByScope = v16->_databaseByScope;
    v16->_databaseByScope = v35;

    v37 = (NSDictionary *)[v19 copy];
    databaseByIdentifier = v16->_databaseByIdentifier;
    v16->_databaseByIdentifier = v37;

    id v11 = v41;
  }

  return v16;
}

- (id)containerName
{
  return [(CKContainer *)self->_container containerIdentifier];
}

- (id)databaseForScope:(int64_t)a3
{
  databaseByScope = self->_databaseByScope;
  v4 = +[NSNumber numberWithInteger:a3];
  v5 = [(NSDictionary *)databaseByScope objectForKey:v4];

  return v5;
}

- (id)databaseIdentifierForScope:(int64_t)a3
{
  v3 = [(PDCloudStoreContainerManager *)self databaseForScope:a3];
  v4 = [v3 identifier];

  return v4;
}

- (id)databaseForIdentifier:(id)a3
{
  return [(NSDictionary *)self->_databaseByIdentifier objectForKey:a3];
}

- (id)databaseForCloudStoreZone:(id)a3
{
  id v4 = [a3 scope];
  return [(PDCloudStoreContainerManager *)self databaseForScope:v4];
}

- (id)cloudStoreZonesByDatabaseIdentifierForItem:(id)a3 action:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  databaseByIdentifier = self->_databaseByIdentifier;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10049BF04;
  v13[3] = &unk_100754A30;
  id v15 = v7;
  unint64_t v16 = a4;
  id v14 = v6;
  id v9 = v7;
  id v10 = v6;
  [(NSDictionary *)databaseByIdentifier enumerateKeysAndObjectsUsingBlock:v13];
  id v11 = [v9 copy];

  return v11;
}

- (id)cloudStoreZonesByDatabaseIdentifierForItemType:(unint64_t)a3 action:(unint64_t)a4
{
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  databaseByIdentifier = self->_databaseByIdentifier;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10049C054;
  v12[3] = &unk_100754A58;
  unint64_t v14 = a3;
  unint64_t v15 = a4;
  id v13 = v7;
  id v9 = v7;
  [(NSDictionary *)databaseByIdentifier enumerateKeysAndObjectsUsingBlock:v12];
  id v10 = [v9 copy];

  return v10;
}

- (id)cloudStoreZonesByDatabaseIdentifierForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5
{
  id v8 = a4;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  databaseByIdentifier = self->_databaseByIdentifier;
  unint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_10049C1BC;
  id v18 = &unk_100754A80;
  unint64_t v21 = a3;
  unint64_t v22 = a5;
  id v19 = v8;
  id v20 = v9;
  id v11 = v9;
  id v12 = v8;
  [(NSDictionary *)databaseByIdentifier enumerateKeysAndObjectsUsingBlock:&v15];
  id v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);

  return v13;
}

- (id)cloudStoreZonesFromZoneNames:(id)a3 inContainerDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableSet);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        unint64_t v14 = objc_msgSend(v7, "zoneForZoneName:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        unint64_t v15 = [v14 zoneID];

        uint64_t v16 = [(PDCloudStoreContainerManager *)self cloudStoreZoneForZoneID:v15 inContainerDatabase:v7];
        if (v16) {
          [v8 addObject:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  id v17 = [v8 copy];
  return v17;
}

- (BOOL)cloudStoreZoneExistsForZoneName:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  databaseByIdentifier = self->_databaseByIdentifier;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10049C4BC;
  v8[3] = &unk_100754AA8;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [(NSDictionary *)databaseByIdentifier enumerateKeysAndObjectsUsingBlock:v8];
  LOBYTE(databaseByIdentifier) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)databaseByIdentifier;
}

- (id)cloudStoreZonesInContainerDatabase:(id)a3
{
  return [a3 cloudStoreZones];
}

- (id)validDatabaseIdentifiers
{
  v2 = [(NSDictionary *)self->_databaseByIdentifier allKeys];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

- (id)validDatabases
{
  v2 = [(NSDictionary *)self->_databaseByIdentifier allValues];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

- (id)zonesThatNeedToBeCreated
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  databaseByIdentifier = self->_databaseByIdentifier;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10049C6A4;
  v8[3] = &unk_100754AD0;
  id v9 = v3;
  id v5 = v3;
  [(NSDictionary *)databaseByIdentifier enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = [v5 copy];

  return v6;
}

- (id)subscriptionsThatNeedToBeCreated
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  databaseByIdentifier = self->_databaseByIdentifier;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10049C7D8;
  v8[3] = &unk_100754AD0;
  id v9 = v3;
  id v5 = v3;
  [(NSDictionary *)databaseByIdentifier enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = [v5 copy];

  return v6;
}

- (id)allPossibleZoneIDsByDatabaseIdentifier
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  databaseByIdentifier = self->_databaseByIdentifier;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10049C90C;
  v8[3] = &unk_100754AD0;
  id v9 = v3;
  id v5 = v3;
  [(NSDictionary *)databaseByIdentifier enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = [v5 copy];

  return v6;
}

- (id)allPossibleSubscriptionIdentifiersByDatabaseIdentifier
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  databaseByIdentifier = self->_databaseByIdentifier;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10049CA40;
  v8[3] = &unk_100754AD0;
  id v9 = v3;
  id v5 = v3;
  [(NSDictionary *)databaseByIdentifier enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = [v5 copy];

  return v6;
}

- (id)subscriptionsForDatabaseZones:(id)a3
{
  id v4 = a3;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_10049CB88;
  uint64_t v11 = &unk_100734400;
  uint64_t v12 = self;
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = v13;
  [v4 enumerateKeysAndObjectsUsingBlock:&v8];

  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return v6;
}

- (id)subscriptionIdentifiersForDatabaseZoneIDs:(id)a3
{
  id v4 = a3;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  id v10 = sub_10049CD04;
  uint64_t v11 = &unk_100734400;
  uint64_t v12 = self;
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = v13;
  [v4 enumerateKeysAndObjectsUsingBlock:&v8];

  id v6 = objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);
  return v6;
}

- (id)cloudStoreZoneForZoneID:(id)a3 inContainerDatabase:(id)a4
{
  return [a4 cloudStoreZoneForZoneID:a3];
}

- (id)cloudStoreZoneForZoneName:(id)a3 inContainerDatabase:(id)a4
{
  id v6 = a4;
  id v7 = [v6 zoneForZoneName:a3];
  id v8 = [v7 zoneID];
  uint64_t v9 = [(PDCloudStoreContainerManager *)self cloudStoreZoneForZoneID:v8 inContainerDatabase:v6];

  return v9;
}

- (id)allPossibleZoneIDsInContainerDatabase:(id)a3
{
  return [a3 allPossibleZoneIDs];
}

- (id)changeTokenForCloudStoreStore:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(PDCloudStoreContainerManager *)self databaseForCloudStoreZone:v4];
    id v6 = [v5 changeTokenForCloudStoreStore:v4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (BOOL)didFinishInitialSyncForCloudStoreZone:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(PDCloudStoreContainerManager *)self databaseForCloudStoreZone:v4];
  unsigned __int8 v6 = [v5 didFinishInitialSyncForCloudStoreStore:v4];

  return v6;
}

- (id)fetchTimestampForCloudStoreStore:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(PDCloudStoreContainerManager *)self databaseForCloudStoreZone:v4];
    unsigned __int8 v6 = [v5 fetchTimestampForCloudStoreStore:v4];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }
  return v6;
}

- (void)containerDatabaseIdentifier:(id)a3 didCreateSubscriptions:(id)a4
{
  id v6 = a4;
  id v7 = [(PDCloudStoreContainerManager *)self databaseForIdentifier:a3];
  [v7 didCreateSubscriptions:v6];
}

- (void)containerDatabaseIdentifier:(id)a3 didCreateZones:(id)a4
{
  id v6 = a4;
  id v7 = [(PDCloudStoreContainerManager *)self databaseForIdentifier:a3];
  [v7 didCreateZones:v6];
}

- (void)containerDatabaseIdentifier:(id)a3 didRemoveZoneIDs:(id)a4
{
  id v6 = a4;
  id v7 = [(PDCloudStoreContainerManager *)self databaseForIdentifier:a3];
  [v7 didRemoveZoneIDs:v6];
}

- (void)containerDatabaseIdentifier:(id)a3 didRemoveSubscriptionIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = [(PDCloudStoreContainerManager *)self databaseForIdentifier:a3];
  [v7 didRemoveSubscriptionIdentifiers:v6];
}

- (void)containerDatabaseIdentifier:(id)a3 didUpdateChangeToken:(id)a4 fetchTimestamp:(id)a5 forZoneID:(id)a6
{
  id v15 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(PDCloudStoreContainerManager *)self databaseForIdentifier:a3];
  id v13 = v15;
  char v14 = v12;
  if (!v15)
  {
    [v12 didFinishInitialSync:0 forZoneID:v11];
    id v13 = 0;
  }
  [v14 didUpdateChangeToken:v13 fetchTimestamp:v10 forZoneID:v11];
}

- (void)containerDatabaseIdentifier:(id)a3 didFinishInitialSync:(BOOL)a4 forZoneID:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = [(PDCloudStoreContainerManager *)self databaseForIdentifier:a3];
  [v9 didFinishInitialSync:v5 forZoneID:v8];
}

- (void)containerDatabaseIdentifier:(id)a3 didUpdateShare:(id)a4 forZoneID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(PDCloudStoreContainerManager *)self databaseForIdentifier:a3];
  [v10 didUpdateShare:v9 forZoneID:v8];
}

- (void)clearCacheInContainer
{
}

- (void)clearCacheInContainerForZoneName:(id)a3
{
  id v4 = a3;
  databaseByIdentifier = self->_databaseByIdentifier;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10049D3C8;
  v7[3] = &unk_100754AD0;
  id v8 = v4;
  id v6 = v4;
  [(NSDictionary *)databaseByIdentifier enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)createContainerCacheIfNecessary
{
}

- (id)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  id v3 = self);
  id v4 = [(PDCloudStoreContainerManager *)self containerName];
  [v3 appendFormat:@"containerName: '%@'; ", v4];

  [v3 appendFormat:@">"];
  return v3;
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_databaseByIdentifier, 0);
  objc_storeStrong((id *)&self->_databaseByScope, 0);
}

@end