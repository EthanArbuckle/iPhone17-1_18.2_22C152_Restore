@interface PDCloudStoreContainerDatabase
- (BOOL)didFinishInitialSyncForCloudStoreStore:(id)a3;
- (CKDatabase)database;
- (PDCloudStoreContainerDatabase)initWithDatabase:(id)a3 containerName:(id)a4 cacheDataSource:(id)a5 databaseContainerDataSource:(id)a6;
- (id)_cachedZoneSubscriptions;
- (id)_databaseSubscriptionThatNeedsToBeCreated;
- (id)allPossibleSubscriptionIdentifiers;
- (id)allPossibleZoneIDs;
- (id)changeTokenForCloudStoreStore:(id)a3;
- (id)cloudStoreZoneForSubscriptionIdentfiier:(id)a3;
- (id)cloudStoreZoneForZoneID:(id)a3;
- (id)cloudStoreZones;
- (id)cloudStoreZonesForItem:(id)a3 action:(unint64_t)a4;
- (id)cloudStoreZonesForItemType:(unint64_t)a3 action:(unint64_t)a4;
- (id)cloudStoreZonesForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5;
- (id)description;
- (id)fetchTimestampForCloudStoreStore:(id)a3;
- (id)identifier;
- (id)subscriptionIdentifiersForZoneIDs:(id)a3;
- (id)subscriptionsForZones:(id)a3;
- (id)subscriptionsThatNeedsToBeCreated;
- (id)zoneForZoneName:(id)a3;
- (id)zonesThatNeedToBeCreated;
- (int64_t)scope;
- (void)_shouldUpdatedCloudStoreZone:(id)a3 remove:(BOOL)a4;
- (void)_updateCacheCloudStoreZonesByName;
- (void)clearCacheForZoneName:(id)a3;
- (void)clearCacheInDatabase;
- (void)createContainerDatabaseInCacheIfNecessary;
- (void)didCreateSubscriptions:(id)a3;
- (void)didCreateZones:(id)a3;
- (void)didFinishInitialSync:(BOOL)a3 forZoneID:(id)a4;
- (void)didRemoveSubscriptionIdentifiers:(id)a3;
- (void)didRemoveZoneIDs:(id)a3;
- (void)didUpdateChangeToken:(id)a3 fetchTimestamp:(id)a4 forZoneID:(id)a5;
- (void)didUpdateShare:(id)a3 forZoneID:(id)a4;
@end

@implementation PDCloudStoreContainerDatabase

- (PDCloudStoreContainerDatabase)initWithDatabase:(id)a3 containerName:(id)a4 cacheDataSource:(id)a5 databaseContainerDataSource:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PDCloudStoreContainerDatabase;
  v15 = [(PDCloudStoreContainerDatabase *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_database, a3);
    objc_storeStrong((id *)&v16->_containerName, a4);
    objc_storeStrong((id *)&v16->_cacheDataSource, a5);
    objc_storeStrong((id *)&v16->_databaseContainerDataSource, a6);
    [(PDCloudStoreContainerDatabase *)v16 createContainerDatabaseInCacheIfNecessary];
    [(PDCloudStoreContainerDatabase *)v16 _updateCacheCloudStoreZonesByName];
  }

  return v16;
}

- (id)zoneForZoneName:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:v3 ownerName:CKCurrentUserDefaultName];

    id v5 = [objc_alloc((Class)CKRecordZone) initWithZoneID:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)identifier
{
  [(PDCloudStoreContainerDatabase *)self scope];
  return (id)CKDatabaseScopeString();
}

- (int64_t)scope
{
  return (int64_t)[(CKDatabase *)self->_database scope];
}

- (id)zonesThatNeedToBeCreated
{
  id v3 = [(PDCloudStoreContainerDatabaseDataSource *)self->_databaseContainerDataSource allPossibleZoneNamesForContainerDatabase:self];
  id v4 = [(NSDictionary *)self->_cloudStoreZonesByName allKeys];
  id v5 = +[NSSet setWithArray:v4];

  id v6 = [v3 mutableCopy];
  [v6 minusSet:v5];
  id v7 = objc_alloc_init((Class)NSMutableSet);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = -[PDCloudStoreContainerDatabase zoneForZoneName:](self, "zoneForZoneName:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        if (v13) {
          [v7 addObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v10);
  }

  id v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = self;
    __int16 v23 = 2114;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Zones that need to be created for database %@: %{public}@", buf, 0x16u);
  }

  id v15 = [v7 copy];
  return v15;
}

- (id)subscriptionsThatNeedsToBeCreated
{
  id v3 = [(PDCloudStoreContainerDatabaseDataSource *)self->_databaseContainerDataSource allPossibleZoneSubscriptionsForContainerDatabase:self];
  id v4 = [(PDCloudStoreContainerDatabase *)self _cachedZoneSubscriptions];
  id v5 = [v3 mutableCopy];
  [v5 minusSet:v4];
  id v6 = [(PDCloudStoreContainerDatabase *)self _databaseSubscriptionThatNeedsToBeCreated];
  if (v6) {
    [v5 addObject:v6];
  }
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 valueForKey:@"subscriptionID"];
    int v11 = 138412546;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Subscriptions that needs to be created for database %@: %@", (uint8_t *)&v11, 0x16u);
  }
  id v9 = [v5 copy];

  return v9;
}

- (id)allPossibleZoneIDs
{
  id v3 = [(PDCloudStoreContainerDatabaseDataSource *)self->_databaseContainerDataSource allPossibleZoneNamesForContainerDatabase:self];
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = -[PDCloudStoreContainerDatabase zoneForZoneName:](self, "zoneForZoneName:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        int v11 = v10;
        if (v10)
        {
          id v12 = [v10 zoneID];
          [v4 addObject:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = [v4 copy];
  return v13;
}

- (id)allPossibleSubscriptionIdentifiers
{
  id v3 = [(PDCloudStoreContainerDatabaseDataSource *)self->_databaseContainerDataSource allPossibleZoneSubscriptionsForContainerDatabase:self];
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "subscriptionID", (void)v16);
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  int v11 = [(PDCloudStoreContainerDatabaseDataSource *)self->_databaseContainerDataSource possibleDatabaseSubscriptionForContainerDatabase:self];
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 subscriptionID];
    [v4 addObject:v13];
  }
  id v14 = objc_msgSend(v4, "copy", (void)v16);

  return v14;
}

- (id)subscriptionsForZones:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = -[PDCloudStoreContainerDatabaseDataSource subscriptionForZone:inContainerDatabase:](self->_databaseContainerDataSource, "subscriptionForZone:inContainerDatabase:", *(void *)(*((void *)&v14 + 1) + 8 * i), self, (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = [v5 copy];
  return v12;
}

- (id)subscriptionIdentifiersForZoneIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [objc_alloc((Class)CKRecordZone) initWithZoneID:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  id v12 = [(PDCloudStoreContainerDatabase *)self subscriptionsForZones:v5];
  id v13 = objc_alloc_init((Class)NSMutableSet);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v12;
  id v15 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)j), "subscriptionID", (void)v22);
        [v13 addObject:v19];
      }
      id v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  id v20 = [v13 copy];
  return v20;
}

- (id)cloudStoreZones
{
  v2 = [(NSDictionary *)self->_cloudStoreZonesByName allValues];
  id v3 = +[NSSet setWithArray:v2];

  return v3;
}

- (id)cloudStoreZonesForItem:(id)a3 action:(unint64_t)a4
{
  return [(PDCloudStoreContainerDatabaseDataSource *)self->_databaseContainerDataSource cloudStoreZonesForItem:a3 action:a4 inContainerDatabase:self];
}

- (id)cloudStoreZonesForItemType:(unint64_t)a3 action:(unint64_t)a4
{
  return [(PDCloudStoreContainerDatabaseDataSource *)self->_databaseContainerDataSource cloudStoreZonesForItemType:a3 configuration:0 action:a4 inContainerDatabase:self];
}

- (id)cloudStoreZonesForItemType:(unint64_t)a3 configuration:(id)a4 action:(unint64_t)a5
{
  return [(PDCloudStoreContainerDatabaseDataSource *)self->_databaseContainerDataSource cloudStoreZonesForItemType:a3 configuration:a4 action:a5 inContainerDatabase:self];
}

- (id)cloudStoreZoneForZoneID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100020E58;
  id v16 = sub_100021220;
  id v17 = 0;
  cloudStoreZonesByName = self->_cloudStoreZonesByName;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10049A03C;
  v9[3] = &unk_1007549E0;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [(NSDictionary *)cloudStoreZonesByName enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)changeTokenForCloudStoreStore:(id)a3
{
  id v3 = [(PDCloudStoreDataSource *)self->_cacheDataSource tokenDataForCloudStore:a3 containerDatabase:self];
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v3 error:0];
    if (v4)
    {
      id v5 = [v4 decodeTopLevelObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey error:0];
      [v4 finishDecoding];
    }
    else
    {
      id v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Could not initialize unarchiver with change token data.", v8, 2u);
      }

      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)didFinishInitialSyncForCloudStoreStore:(id)a3
{
  return [(PDCloudStoreDataSource *)self->_cacheDataSource didFinishInitialSyncForCloudStore:a3 containerDatabase:self];
}

- (id)fetchTimestampForCloudStoreStore:(id)a3
{
  return [(PDCloudStoreDataSource *)self->_cacheDataSource fetchTimestampForCloudStore:a3 containerDatabase:self];
}

- (id)cloudStoreZoneForSubscriptionIdentfiier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100020E58;
  id v16 = sub_100021220;
  id v17 = 0;
  cloudStoreZonesByName = self->_cloudStoreZonesByName;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10049A398;
  v9[3] = &unk_1007549E0;
  id v6 = v4;
  id v10 = v6;
  id v11 = &v12;
  [(NSDictionary *)cloudStoreZonesByName enumerateKeysAndObjectsUsingBlock:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)didCreateSubscriptions:(id)a3
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (!v5) {
    goto LABEL_27;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v27;
  id v8 = &dispatch_get_global_queue_ptr;
  uint64_t v9 = &dispatch_get_global_queue_ptr;
  while (2)
  {
    id v10 = 0;
    id v25 = v6;
    do
    {
      if (*(void *)v27 != v7) {
        objc_enumerationMutation(v4);
      }
      id v11 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v10);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [(PDCloudStoreContainerDatabaseDataSource *)self->_databaseContainerDataSource possibleDatabaseSubscriptionForContainerDatabase:self];
        if (PKEqualObjects())
        {
          [(PDCloudStoreDataSource *)self->_cacheDataSource updateDatabaseSubscription:v12 containerDatabase:self];
        }
        else
        {
          long long v22 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v31 = v11;
            __int16 v32 = 2112;
            v33 = self;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Error: an unknown suscription was created %@ in database %@", buf, 0x16u);
          }
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_21;
        }
        id v13 = [(PDCloudStoreContainerDatabaseDataSource *)self->_databaseContainerDataSource zoneIDForSubscription:v11 inContainerDatabase:self];
        if (!v13)
        {
          long long v24 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v31 = v11;
            __int16 v32 = 2112;
            v33 = self;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No zoneID for subscription %@ in database %@", buf, 0x16u);
          }

          goto LABEL_27;
        }
        uint64_t v12 = v13;
        uint64_t v14 = v7;
        id v15 = v8;
        id v16 = v4;
        id v17 = v9;
        cloudStoreZonesByName = self->_cloudStoreZonesByName;
        long long v19 = [(PDCloudStoreContainerDatabase *)v13 zoneName];
        id v20 = [(NSDictionary *)cloudStoreZonesByName objectForKey:v19];

        if (v20)
        {
          v21 = [v11 subscriptionID];
          [v20 setZoneSubscriptionIdentifier:v21];

          [(PDCloudStoreContainerDatabase *)self _shouldUpdatedCloudStoreZone:v20 remove:0];
        }
        else
        {
          long long v23 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v31 = v11;
            __int16 v32 = 2112;
            v33 = v12;
            __int16 v34 = 2112;
            v35 = self;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Error: a new subscription \"%@\" was added but there is no cloud store zone defined for zoneID %@ in database %@", buf, 0x20u);
          }
        }
        uint64_t v9 = v17;
        id v4 = v16;
        id v8 = v15;
        uint64_t v7 = v14;
        id v6 = v25;
      }

LABEL_21:
      id v10 = (char *)v10 + 1;
    }
    while (v6 != v10);
    id v6 = [v4 countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_27:
}

- (void)didCreateZones:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v21;
    *(void *)&long long v6 = 138412290;
    long long v19 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "zoneID", v19);
        id v11 = [v10 zoneName];
        if (v11 == CKRecordZoneDefaultName)
        {

          id v14 = CKRecordZoneDefaultName;
          goto LABEL_20;
        }
        uint64_t v12 = v11;
        if (v11) {
          BOOL v13 = CKRecordZoneDefaultName == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (v13)
        {

LABEL_15:
          id v14 = [(PDCloudStoreContainerDatabase *)self cloudStoreZoneForZoneID:v10];
          if (!v14)
          {
            id v16 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v19;
              id v25 = v10;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "A new zone was added but there is no cloud store zone defined for zoneID %@", buf, 0xCu);
            }

            id v14 = [objc_alloc((Class)PKCloudStoreZone) initWithZoneID:v10 containerDatabase:self];
          }
          id v17 = [v10 zoneName];
          [v14 setZoneName:v17];

          long long v18 = [v10 ownerName];
          [v14 setOwnerName:v18];

          [(PDCloudStoreContainerDatabase *)self _shouldUpdatedCloudStoreZone:v14 remove:0];
LABEL_20:

          goto LABEL_21;
        }
        unsigned __int8 v15 = [(NSString *)v11 isEqualToString:CKRecordZoneDefaultName];

        if ((v15 & 1) == 0) {
          goto LABEL_15;
        }
LABEL_21:
      }
      id v7 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v7);
  }
}

- (void)didRemoveZoneIDs:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v16;
    *(void *)&long long v6 = 138412290;
    long long v14 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = -[PDCloudStoreContainerDatabase cloudStoreZoneForZoneID:](self, "cloudStoreZoneForZoneID:", v10, v14);
        if (!v11)
        {
          uint64_t v12 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            long long v20 = v10;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "A zoneID was removed but there was no cloud store zone defined %@", buf, 0xCu);
          }
        }
        BOOL v13 = [v10 zoneName];
        [v11 setZoneName:v13];

        [(PDCloudStoreContainerDatabase *)self _shouldUpdatedCloudStoreZone:v11 remove:1];
      }
      id v7 = [v4 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }
}

- (void)didRemoveSubscriptionIdentifiers:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = -[PDCloudStoreContainerDatabase cloudStoreZoneForSubscriptionIdentfiier:](self, "cloudStoreZoneForSubscriptionIdentfiier:", *(void *)(*((void *)&v11 + 1) + 8 * v8), (void)v11);
      if (!v9) {
        break;
      }
      id v10 = v9;
      [v9 setZoneSubscriptionIdentifier:0];
      [(PDCloudStoreContainerDatabase *)self _shouldUpdatedCloudStoreZone:v10 remove:0];

      if (v6 == (id)++v8)
      {
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)didUpdateChangeToken:(id)a3 fetchTimestamp:(id)a4 forZoneID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(PDCloudStoreContainerDatabase *)self cloudStoreZoneForZoneID:v10];
  if (v11)
  {
    [(PDCloudStoreDataSource *)self->_cacheDataSource updateChangeToken:v8 fetchTimestamp:v9 forCloudStoreZone:v11 inContainerDatabase:self];
  }
  else
  {
    long long v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "A change token and fetch timestamp was updated but there was no cloud store zone defined for %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)didFinishInitialSync:(BOOL)a3 forZoneID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(PDCloudStoreContainerDatabase *)self cloudStoreZoneForZoneID:v6];
  if (v7)
  {
    [(PDCloudStoreDataSource *)self->_cacheDataSource updateDidFinishInitialSync:v4 forCloudStoreZone:v7 inContainerDatabase:self];
  }
  else
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "A change token and fetch timestamp was updated but there was no cloud store zone defined for %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)didUpdateShare:(id)a3 forZoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDCloudStoreContainerDatabase *)self cloudStoreZoneForZoneID:v7];
  if (v8)
  {
    int v9 = objc_alloc_init((Class)NSMutableSet);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v17 = v6;
    id v10 = [v6 participants];
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (([v15 isCurrentUser] & 1) == 0)
          {
            id v16 = [objc_alloc((Class)PKCloudStoreZoneShareParticipant) initWithParticipant:v15];
            [v9 addObject:v16];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    [v8 setShareParticipants:v9];
    [(PDCloudStoreContainerDatabase *)self _shouldUpdatedCloudStoreZone:v8 remove:0];
    id v6 = v17;
  }
  else
  {
    int v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "A share was updated but there was no cloud store zone defined for %@", buf, 0xCu);
    }
  }
}

- (void)clearCacheInDatabase
{
  id v3 = [(NSDictionary *)self->_cloudStoreZonesByName copy];
  BOOL v4 = [(PDCloudStoreDataSource *)self->_cacheDataSource databaseSubscriptionForContainerDatabase:self];
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clearing cache for cloud store zones %@", (uint8_t *)&v6, 0xCu);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clearing cache for database subscription %@", (uint8_t *)&v6, 0xCu);
  }

  [(PDCloudStoreDataSource *)self->_cacheDataSource removeContainerDatabaseForContainerDatabase:self];
  [(PDCloudStoreContainerDatabase *)self _updateCacheCloudStoreZonesByName];
}

- (void)clearCacheForZoneName:(id)a3
{
  cloudStoreZonesByName = self->_cloudStoreZonesByName;
  id v5 = a3;
  id v6 = [(NSDictionary *)cloudStoreZonesByName copy];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [v7 zoneName];
      int v10 = 138543618;
      id v11 = v9;
      __int16 v12 = 2112;
      uint64_t v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Clearing cache for cloud store zone %{public}@ in database %@", (uint8_t *)&v10, 0x16u);
    }
    [(PDCloudStoreDataSource *)self->_cacheDataSource removeCloudStoreZone:v7 containerDatabase:self];
    [(PDCloudStoreContainerDatabase *)self _updateCacheCloudStoreZonesByName];
  }
}

- (id)_cachedZoneSubscriptions
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  cloudStoreZonesByName = self->_cloudStoreZonesByName;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10049B424;
  v8[3] = &unk_100754A08;
  id v9 = v3;
  id v5 = v3;
  [(NSDictionary *)cloudStoreZonesByName enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = [v5 copy];

  return v6;
}

- (id)_databaseSubscriptionThatNeedsToBeCreated
{
  id v3 = [(PDCloudStoreDataSource *)self->_cacheDataSource databaseSubscriptionForContainerDatabase:self];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = [(PDCloudStoreContainerDatabaseDataSource *)self->_databaseContainerDataSource possibleDatabaseSubscriptionForContainerDatabase:self];
  }

  return v4;
}

- (void)_shouldUpdatedCloudStoreZone:(id)a3 remove:(BOOL)a4
{
  cacheDataSource = self->_cacheDataSource;
  if (a4) {
    [(PDCloudStoreDataSource *)cacheDataSource removeCloudStoreZone:a3 containerDatabase:self];
  }
  else {
    [(PDCloudStoreDataSource *)cacheDataSource insertOrUpdateCloudStoreZone:a3 containerDatabase:self];
  }
  [(PDCloudStoreContainerDatabase *)self _updateCacheCloudStoreZonesByName];
}

- (void)_updateCacheCloudStoreZonesByName
{
  id v3 = [(PDCloudStoreDataSource *)self->_cacheDataSource cloudStoreZonesForContainerDatabase:self];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v20 = self;
  int64_t v5 = [(PDCloudStoreContainerDatabase *)self scope];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (v5 != 3) {
          goto LABEL_19;
        }
        __int16 v12 = [*(id *)(*((void *)&v22 + 1) + 8 * i) ownerName];
        if (v12 == CKCurrentUserDefaultName)
        {
        }
        else
        {
          uint64_t v13 = v12;
          if (v12) {
            BOOL v14 = CKCurrentUserDefaultName == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (v14)
          {

LABEL_19:
            id v17 = [v11 zoneName];
            [v4 setObject:v11 forKey:v17];

            continue;
          }
          unsigned int v15 = [(NSString *)v12 isEqualToString:CKCurrentUserDefaultName];

          if (!v15) {
            goto LABEL_19;
          }
        }
        id v16 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Error: we detected a default owner name for a shared zone. This zone is in a bad state so we will remove it from the the cache.", buf, 2u);
        }

        -[PDCloudStoreDataSource removeCloudStoreZone:containerDatabase:](v20->_cacheDataSource, "removeCloudStoreZone:containerDatabase:", v11);
      }
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  long long v18 = (NSDictionary *)[v4 copy];
  cloudStoreZonesByName = v20->_cloudStoreZonesByName;
  v20->_cloudStoreZonesByName = v18;
}

- (void)createContainerDatabaseInCacheIfNecessary
{
  if (([(PDCloudStoreDataSource *)self->_cacheDataSource containerDatabaseExistsForContainerDatabase:self] & 1) == 0)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      int64_t v5 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "A cloud store database did not exist before. Creating it now %@", (uint8_t *)&v4, 0xCu);
    }

    [(PDCloudStoreDataSource *)self->_cacheDataSource insertContainerDatabaseForContainerDatabase:self];
  }
}

- (id)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  id v3 = self);
  int v4 = [(CKDatabase *)self->_database container];
  int64_t v5 = [v4 containerIdentifier];
  [v3 appendFormat:@"containerIdentifier: '%@'; ", v5];

  [(CKDatabase *)self->_database scope];
  id v6 = CKDatabaseScopeString();
  [v3 appendFormat:@"scope: '%@'; ", v6];

  id v7 = [(NSDictionary *)self->_cloudStoreZonesByName allValues];
  id v8 = [v7 valueForKey:@"zoneName"];
  [v3 appendFormat:@"cached zones: '%@'; ", v8];

  [v3 appendFormat:@">"];
  return v3;
}

- (CKDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_cloudStoreZonesByName, 0);
  objc_storeStrong((id *)&self->_databaseContainerDataSource, 0);
  objc_storeStrong((id *)&self->_cacheDataSource, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
}

@end