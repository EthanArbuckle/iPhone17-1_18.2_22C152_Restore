@interface NPTOPreferencesAccessor
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)npto_appPhotosSyncingEnabled;
- (BOOL)npto_featuredPhotosSyncingEnabled;
- (BOOL)npto_isAlwaysUpdatingEnabledForAssetCollection:(id)a3;
- (BOOL)npto_memoriesSyncingEnabled;
- (NPTOPreferencesAccessor)initWithDevice:(id)a3;
- (NRDevice)device;
- (id)_notificationNameForKey:(uint64_t)a1;
- (id)_npto_defaultAlbum;
- (id)changeObserverForKey:(id)a3 queue:(id)a4 block:(id)a5;
- (id)npto_alwaysUpdatingEnabledForAllCollections;
- (id)npto_appLastOpenDate;
- (id)npto_fetchCountsForAllCollections;
- (id)npto_fetchSyncedAlbum;
- (id)npto_syncedAlbumIdentifier;
- (id)objectForKey:(id)a3;
- (unint64_t)npto_appResyncVersion;
- (unint64_t)npto_fetchCountForAssetCollection:(id)a3;
- (unint64_t)npto_syncedPhotosLimit;
- (void)npto_removeFetchCountForAssetCollection:(id)a3;
- (void)npto_setAlwaysUpdatingEnabled:(BOOL)a3 forAssetCollection:(id)a4;
- (void)npto_setAlwaysUpdatingEnabledForAllCollections:(id)a3;
- (void)npto_setFetchCount:(unint64_t)a3 forAssetCollection:(id)a4;
- (void)npto_setFetchCountsForAllCollections:(id)a3;
- (void)performBatchUpdates:(id)a3 synchronizeToRemoteDevice:(BOOL)a4;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation NPTOPreferencesAccessor

- (id)npto_fetchSyncedAlbum
{
  v26[1] = *MEMORY[0x263EF8340];
  v3 = [(NPTOPreferencesAccessor *)self objectForKey:@"SyncAlbum"];
  if ([v3 isEqualToString:@"none"])
  {
LABEL_2:
    v4 = 0;
    goto LABEL_25;
  }
  if (v3)
  {
    v5 = (void *)MEMORY[0x263F14D28];
    v26[0] = v3;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
    v4 = [v5 fetchAssetCollectionsWithLocalIdentifiers:v6 options:0];

    v7 = [(NPTOPreferencesAccessor *)self device];
    v8 = [v7 valueForProperty:*MEMORY[0x263F575B0]];
    int v9 = [v8 BOOLValue];

    if (v9)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v10 = v4;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if (objc_msgSend(v15, "assetCollectionType", (void)v19) == 1
              && [v15 assetCollectionSubtype] == 101)
            {
              v16 = nanophotos_log_NanoPhotosCore();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v24 = v15;
                _os_log_impl(&dword_21ECC3000, v16, OS_LOG_TYPE_DEFAULT, "Synced album is cloud shared: %@", buf, 0xCu);
              }

              [(NPTOPreferencesAccessor *)self setObject:@"none" forKey:@"SyncAlbum"];
              goto LABEL_2;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v25 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
    }
    if (objc_msgSend(v4, "count", (void)v19))
    {
      if (v4) {
        goto LABEL_25;
      }
    }
    else
    {
      v17 = nanophotos_log_NanoPhotosCore();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v3;
        _os_log_impl(&dword_21ECC3000, v17, OS_LOG_TYPE_DEFAULT, "Synced album is missing: %@", buf, 0xCu);
      }

      [(NPTOPreferencesAccessor *)self removeObjectForKey:@"SyncAlbum"];
    }
  }
  v4 = -[NPTOPreferencesAccessor _npto_defaultAlbum](self);
LABEL_25:

  return v4;
}

- (id)_npto_defaultAlbum
{
  if (a1)
  {
    v2 = a1;
    v3 = [a1 device];
    v4 = [v3 valueForProperty:*MEMORY[0x263F575B0]];
    char v5 = [v4 BOOLValue];

    if (v5)
    {
      a1 = 0;
    }
    else
    {
      v6 = [v2 objectForKey:@"TinkerGraduated"];
      int v7 = [v6 BOOLValue];

      if (v7) {
        uint64_t v8 = 206;
      }
      else {
        uint64_t v8 = 203;
      }
      a1 = [MEMORY[0x263F14D28] fetchAssetCollectionsWithType:2 subtype:v8 options:0];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)npto_syncedAlbumIdentifier
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(NPTOPreferencesAccessor *)self objectForKey:@"SyncAlbum"];
  if (!v3)
  {
    v4 = -[NPTOPreferencesAccessor _npto_defaultAlbum](self);
    char v5 = [v4 firstObject];
    uint64_t v6 = [v5 localIdentifier];
    int v7 = (void *)v6;
    uint64_t v8 = @"none";
    if (v6) {
      uint64_t v8 = (__CFString *)v6;
    }
    v3 = v8;

    int v9 = nanophotos_log_NanoPhotosCore();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(NPTOPreferencesAccessor *)self device];
      int v12 = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_21ECC3000, v9, OS_LOG_TYPE_DEFAULT, "No album identifier found for device: %@. Defaulting to %@.", (uint8_t *)&v12, 0x16u);
    }
  }
  return v3;
}

- (unint64_t)npto_syncedPhotosLimit
{
  uint64_t v2 = [(NPTOPreferencesAccessor *)self objectForKey:@"SyncCount"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = &unk_26D0535F8;
  }
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (BOOL)npto_appPhotosSyncingEnabled
{
  uint64_t v2 = [(NPTOPreferencesAccessor *)self objectForKey:@"AppPhotosSync"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = (void *)MEMORY[0x263EFFA88];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)npto_memoriesSyncingEnabled
{
  uint64_t v2 = [(NPTOPreferencesAccessor *)self objectForKey:@"Memories"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = (void *)MEMORY[0x263EFFA88];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)npto_featuredPhotosSyncingEnabled
{
  uint64_t v2 = [(NPTOPreferencesAccessor *)self objectForKey:@"FeaturedPhotos"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = (void *)MEMORY[0x263EFFA88];
  }
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)npto_appLastOpenDate
{
  return [(NPTOPreferencesAccessor *)self objectForKey:@"AppLastOpenDate"];
}

- (unint64_t)npto_appResyncVersion
{
  uint64_t v2 = [(NPTOPreferencesAccessor *)self objectForKey:@"AppResyncVersion"];
  if (v2) {
    v3 = (void *)v2;
  }
  else {
    v3 = &unk_26D053610;
  }
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unint64_t)npto_fetchCountForAssetCollection:(id)a3
{
  id v4 = a3;
  char v5 = [(NPTOPreferencesAccessor *)self objectForKey:@"WatchFaceAlbumFetchCounts"];
  uint64_t v6 = objc_msgSend(v4, "npto_uuid");

  int v7 = [v6 UUIDString];
  uint64_t v8 = [v5 objectForKeyedSubscript:v7];
  unint64_t v9 = [v8 unsignedIntegerValue];

  return v9;
}

- (void)npto_setFetchCount:(unint64_t)a3 forAssetCollection:(id)a4
{
  id v6 = a4;
  int v7 = [(NPTOPreferencesAccessor *)self objectForKey:@"WatchFaceAlbumFetchCounts"];
  uint64_t v8 = (void *)[v7 mutableCopy];

  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  }
  unint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
  id v10 = objc_msgSend(v6, "npto_uuid");

  uint64_t v11 = [v10 UUIDString];
  [v8 setObject:v9 forKeyedSubscript:v11];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __77__NPTOPreferencesAccessor_WatchFaces__npto_setFetchCount_forAssetCollection___block_invoke;
  v13[3] = &unk_2644EBF60;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [(NPTOPreferencesAccessor *)self performBatchUpdates:v13 synchronizeToRemoteDevice:1];
}

void __77__NPTOPreferencesAccessor_WatchFaces__npto_setFetchCount_forAssetCollection___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) copy];
  [v1 setObject:v2 forKey:@"WatchFaceAlbumFetchCounts"];
}

- (void)npto_removeFetchCountForAssetCollection:(id)a3
{
  id v4 = a3;
  char v5 = [(NPTOPreferencesAccessor *)self objectForKey:@"WatchFaceAlbumFetchCounts"];
  id v6 = (void *)[v5 mutableCopy];

  int v7 = objc_msgSend(v4, "npto_uuid");

  uint64_t v8 = [v7 UUIDString];
  [v6 removeObjectForKey:v8];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __79__NPTOPreferencesAccessor_WatchFaces__npto_removeFetchCountForAssetCollection___block_invoke;
  v10[3] = &unk_2644EBF60;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(NPTOPreferencesAccessor *)self performBatchUpdates:v10 synchronizeToRemoteDevice:1];
}

void __79__NPTOPreferencesAccessor_WatchFaces__npto_removeFetchCountForAssetCollection___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) copy];
  [v1 setObject:v2 forKey:@"WatchFaceAlbumFetchCounts"];
}

- (BOOL)npto_isAlwaysUpdatingEnabledForAssetCollection:(id)a3
{
  id v4 = a3;
  char v5 = [(NPTOPreferencesAccessor *)self objectForKey:@"WatchFaceAlwaysUpdatingAlbums"];
  id v6 = objc_msgSend(v4, "npto_uuid");

  int v7 = [v6 UUIDString];
  char v8 = [v5 containsObject:v7];

  return v8;
}

- (void)npto_setAlwaysUpdatingEnabled:(BOOL)a3 forAssetCollection:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  int v7 = (void *)MEMORY[0x263EFF9C0];
  char v8 = [(NPTOPreferencesAccessor *)self objectForKey:@"WatchFaceAlwaysUpdatingAlbums"];
  id v9 = [v7 setWithArray:v8];

  if (v4)
  {
    if (!v9)
    {
      id v9 = [MEMORY[0x263EFF9C0] set];
    }
    id v10 = objc_msgSend(v6, "npto_uuid");
    id v11 = [v10 UUIDString];
    [v9 addObject:v11];
  }
  else
  {
    id v10 = objc_msgSend(v6, "npto_uuid");
    id v11 = [v10 UUIDString];
    [v9 removeObject:v11];
  }

  if (v9)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __88__NPTOPreferencesAccessor_WatchFaces__npto_setAlwaysUpdatingEnabled_forAssetCollection___block_invoke;
    v12[3] = &unk_2644EBF60;
    v12[4] = self;
    id v13 = v9;
    [(NPTOPreferencesAccessor *)self performBatchUpdates:v12 synchronizeToRemoteDevice:1];
  }
}

void __88__NPTOPreferencesAccessor_WatchFaces__npto_setAlwaysUpdatingEnabled_forAssetCollection___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) allObjects];
  [v1 setObject:v2 forKey:@"WatchFaceAlwaysUpdatingAlbums"];
}

- (id)npto_fetchCountsForAllCollections
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = [(NPTOPreferencesAccessor *)self objectForKey:@"WatchFaceAlbumFetchCounts"];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_msgSend(v4, "objectForKeyedSubscript:", v9, (void)v14);
        id v11 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v9];
        [v3 setObject:v10 forKey:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v12 = (void *)[v3 copy];
  return v12;
}

- (void)npto_setFetchCountsForAllCollections:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [v6 objectForKeyedSubscript:v11];
        id v13 = [v11 UUIDString];
        [v5 setObject:v12 forKey:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __76__NPTOPreferencesAccessor_WatchFaces__npto_setFetchCountsForAllCollections___block_invoke;
  v15[3] = &unk_2644EBF60;
  v15[4] = self;
  id v16 = v5;
  id v14 = v5;
  [(NPTOPreferencesAccessor *)self performBatchUpdates:v15 synchronizeToRemoteDevice:1];
}

void __76__NPTOPreferencesAccessor_WatchFaces__npto_setFetchCountsForAllCollections___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) copy];
  [v1 setObject:v2 forKey:@"WatchFaceAlbumFetchCounts"];
}

- (id)npto_alwaysUpdatingEnabledForAllCollections
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = [(NPTOPreferencesAccessor *)self objectForKey:@"WatchFaceAlwaysUpdatingAlbums"];
  v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_alloc(MEMORY[0x263F08C38]);
        id v11 = objc_msgSend(v10, "initWithUUIDString:", v9, (void)v14);
        [v3 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v12 = (void *)[v3 copy];
  return v12;
}

- (void)npto_setAlwaysUpdatingEnabledForAllCollections:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v15 + 1) + 8 * v10) UUIDString];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __86__NPTOPreferencesAccessor_WatchFaces__npto_setAlwaysUpdatingEnabledForAllCollections___block_invoke;
  v13[3] = &unk_2644EBF60;
  v13[4] = self;
  id v14 = v5;
  id v12 = v5;
  [(NPTOPreferencesAccessor *)self performBatchUpdates:v13 synchronizeToRemoteDevice:1];
}

void __86__NPTOPreferencesAccessor_WatchFaces__npto_setAlwaysUpdatingEnabledForAllCollections___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) copy];
  [v1 setObject:v2 forKey:@"WatchFaceAlwaysUpdatingAlbums"];
}

- (NPTOPreferencesAccessor)initWithDevice:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPTOPreferencesAccessor;
  id v6 = [(NPTOPreferencesAccessor *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.nanophotos" pairedDevice:v5];
    domainAccessor = v7->_domainAccessor;
    v7->_domainAccessor = (NPSDomainAccessor *)v8;

    uint64_t v10 = (NPTONotificationCenter *)-[NPTONotificationCenter initWithDevice:]([NPTONotificationCenter alloc], v5);
    notificationCenter = v7->_notificationCenter;
    v7->_notificationCenter = v10;
  }
  return v7;
}

- (BOOL)BOOLForKey:(id)a3
{
  return [(NPSDomainAccessor *)self->_domainAccessor BOOLForKey:a3];
}

- (id)objectForKey:(id)a3
{
  return (id)[(NPSDomainAccessor *)self->_domainAccessor objectForKey:a3];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(NPSDomainAccessor *)self->_domainAccessor objectForKey:v6];
  if (v7 != v12 && ([v12 isEqual:v7] & 1) == 0)
  {
    [(NPSDomainAccessor *)self->_domainAccessor setObject:v12 forKey:v6];
    uint64_t v8 = [(NSMutableArray *)self->_batchUpdatesKeyStack lastObject];
    [v8 addObject:v6];

    if (![(NSMutableArray *)self->_batchUpdatesKeyStack count])
    {
      id v9 = (id)[(NPSDomainAccessor *)self->_domainAccessor synchronize];
      notificationCenter = self->_notificationCenter;
      id v11 = -[NPTOPreferencesAccessor _notificationNameForKey:]((uint64_t)self, v6);
      -[NPTONotificationCenter postNotificationName:]((uint64_t)notificationCenter, v11);
    }
  }
}

- (id)_notificationNameForKey:(uint64_t)a1
{
  if (a1)
  {
    id v2 = NSString;
    v3 = *(void **)(a1 + 8);
    id v4 = a2;
    id v5 = [v3 domain];
    id v6 = [v2 stringWithFormat:@"%@.prefs.%@-changed", v5, v4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)removeObjectForKey:(id)a3
{
  id v9 = a3;
  id v4 = -[NPSDomainAccessor objectForKey:](self->_domainAccessor, "objectForKey:");
  if (v4)
  {
    [(NPSDomainAccessor *)self->_domainAccessor removeObjectForKey:v9];
    id v5 = [(NSMutableArray *)self->_batchUpdatesKeyStack lastObject];
    [v5 addObject:v9];

    if (![(NSMutableArray *)self->_batchUpdatesKeyStack count])
    {
      id v6 = (id)[(NPSDomainAccessor *)self->_domainAccessor synchronize];
      notificationCenter = self->_notificationCenter;
      uint64_t v8 = -[NPTOPreferencesAccessor _notificationNameForKey:]((uint64_t)self, v9);
      -[NPTONotificationCenter postNotificationName:]((uint64_t)notificationCenter, v8);
    }
  }
}

- (void)performBatchUpdates:(id)a3 synchronizeToRemoteDevice:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(void))a3;
  batchUpdatesKeyStack = self->_batchUpdatesKeyStack;
  if (!batchUpdatesKeyStack)
  {
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    id v9 = self->_batchUpdatesKeyStack;
    self->_batchUpdatesKeyStack = v8;

    batchUpdatesKeyStack = self->_batchUpdatesKeyStack;
  }
  uint64_t v10 = [MEMORY[0x263EFF9B0] orderedSet];
  [(NSMutableArray *)batchUpdatesKeyStack addObject:v10];

  v6[2](v6);
  id v11 = [(NSMutableArray *)self->_batchUpdatesKeyStack lastObject];
  [(NSMutableArray *)self->_batchUpdatesKeyStack removeLastObject];
  id v12 = (id)[(NPSDomainAccessor *)self->_domainAccessor synchronize];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        notificationCenter = self->_notificationCenter;
        uint64_t v19 = -[NPTOPreferencesAccessor _notificationNameForKey:]((uint64_t)self, *(void **)(*((void *)&v22 + 1) + 8 * v17));
        -[NPTONotificationCenter postNotificationName:]((uint64_t)notificationCenter, v19);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }

  if (v4)
  {
    id v20 = objc_alloc_init(MEMORY[0x263F57528]);
    long long v21 = objc_msgSend(v13, "set", (void)v22);
    [v20 synchronizeNanoDomain:@"com.apple.nanophotos" keys:v21];
  }
}

- (id)changeObserverForKey:(id)a3 queue:(id)a4 block:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  notificationCenter = self->_notificationCenter;
  id v12 = -[NPTOPreferencesAccessor _notificationNameForKey:]((uint64_t)self, v8);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __60__NPTOPreferencesAccessor_changeObserverForKey_queue_block___block_invoke;
  v16[3] = &unk_2644EC000;
  objc_copyWeak(&v18, &location);
  id v13 = v10;
  id v17 = v13;
  uint64_t v14 = -[NPTONotificationCenter observerForName:queue:block:]((NPTODarwinNotificationObserver *)notificationCenter, v12, v9, v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v14;
}

void __60__NPTOPreferencesAccessor_changeObserverForKey_queue_block___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    id v2 = (id)[WeakRetained[1] synchronize];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NRDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_batchUpdatesKeyStack, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
}

@end