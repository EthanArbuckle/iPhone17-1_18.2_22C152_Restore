@interface PLRelationshipOrderKeyManager
+ (id)new;
+ (int64_t)compareOrderKeyObject:(id)a3 withObject:(id)a4;
- (BOOL)conflictDetected;
- (BOOL)hasStashedLocationValues;
- (BOOL)inWriteStashedLocationMode;
- (BOOL)writeStashedLocationValuesInContext:(id)a3 error:(id *)a4;
- (PLRelationshipOrderKeyManager)init;
- (PLRelationshipOrderKeyManager)initWithGenerateContextBlock:(id)a3;
- (id)_locked_enqueuedAlbumAssetsOrderValueUpdates;
- (id)_locked_enqueuedFolderAlbumsOrderValueUpdates;
- (id)_locked_locationsCache;
- (id)_locked_spiSafeContextGivenPassedInContext:(id)a3 andName:(const char *)a4;
- (id)_orderingStateForRelationship:(id)a3 onObjectWithID:(id)a4 invalidateCache:(BOOL)a5 usingSPISafeContext:(id)a6;
- (id)_orderingStateForRelationship:(id)a3 onObjectWithID:(id)a4 usingSPISafeContext:(id)a5;
- (id)albumsAndOrderValuesForAsset:(id)a3 inManagedObjectContext:(id)a4;
- (id)generateContextBlock;
- (id)migration_sortedOrderKeysForAssetsInAlbum:(id)a3 usingMap:(id)a4;
- (id)objectIDsAndOrderValuesForRelationship:(id)a3 onObjectWithID:(id)a4 invalidateCache:(BOOL)a5 inContext:(id)a6;
- (id)parentFolderOrderValueForAlbum:(id)a3 inManagedObjectContext:(id)a4;
- (unint64_t)findIndexForAlbumWithID:(id)a3 newOrderValue:(int64_t)a4 inFolderWithID:(id)a5 hasOrderValueConflictWithAlbumID:(id *)a6 inContext:(id)a7;
- (unint64_t)findIndexForAssetWithID:(id)a3 newOrderValue:(int64_t)a4 inAlbumWithID:(id)a5 hasOrderValueConflictWithAssetID:(id *)a6 inContext:(id)a7;
- (void)_getAndResetEnqueuedOrderValueUpdatesForFolders:(id *)a3 albums:(id *)a4 conflictDetected:(BOOL *)a5;
- (void)_migration_updateOrderKeysForAssetsInParentAlbum:(id)a3 childToOrderKeyMap:(id)a4;
- (void)_migration_updateOrderValuesForAssetsInAlbum:(id)a3 managedObjectContext:(id)a4;
- (void)_setConflictDetected:(BOOL)a3;
- (void)_stashLocationValue:(int64_t)a3 forOrderedObjectWithID:(id)a4 inSourceObjectID:(id)a5 relationship:(id)a6 atIndex:(unint64_t)a7 usingStashDictionary:(id)a8 usingSPISafeContext:(id)a9;
- (void)_updateOrderOfChildrenInParent:(id)a3 usingTransientOrders:(id)a4;
- (void)getConflictResolutionOrderValuesForRelationship:(id)a3 onObjectWithID:(id)a4 atIndex:(unint64_t)a5 intoLower:(int64_t *)a6 higher:(int64_t *)a7 inContext:(id)a8;
- (void)migration_ensureValidOrderKey:(id)a3 usingOrderValuePropertyKey:(id)a4;
- (void)migration_fixupOrderKeys:(id)a3 usingOrderValuePropertyKey:(id)a4 enforceSingletonAlbumReservedKeySpace:(BOOL)a5;
- (void)migration_updateLegacyChildCollectionOrderKeysInFolder:(id)a3;
- (void)migration_updateLegacyOrderValuesForAssetsInAlbums:(id)a3 managedObjectContext:(id)a4;
- (void)setGenerateContextBlock:(id)a3;
- (void)setInWriteStashedLocationMode:(BOOL)a3;
- (void)stashAlbumAssetsLocationValue:(int64_t)a3 forAssetWithID:(id)a4 inAlbumWithID:(id)a5 atIndex:(unint64_t)a6 usingContext:(id)a7;
- (void)stashFolderAlbumsLocationValue:(int64_t)a3 forAlbumWithID:(id)a4 inFolderWithID:(id)a5 atIndex:(unint64_t)a6 usingContext:(id)a7;
- (void)updateAlbumAssetsUsingTransientOrdersByAlbumOID:(id)a3 inLibrary:(id)a4;
@end

@implementation PLRelationshipOrderKeyManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_generateContextBlock, 0);
  objc_storeStrong((id *)&self->_cachedContext, 0);
  objc_storeStrong((id *)&self->_enqueuedAlbumAssetsOrderValueUpdates, 0);
  objc_storeStrong((id *)&self->_enqueuedFolderAlbumsOrderValueUpdates, 0);
  objc_storeStrong((id *)&self->_locationsCache, 0);
}

- (void)setGenerateContextBlock:(id)a3
{
}

- (id)generateContextBlock
{
  return self->_generateContextBlock;
}

- (void)setInWriteStashedLocationMode:(BOOL)a3
{
  self->_inWriteStashedLocationMode = a3;
}

- (BOOL)inWriteStashedLocationMode
{
  return self->_inWriteStashedLocationMode;
}

- (BOOL)conflictDetected
{
  return self->_conflictDetected;
}

- (BOOL)hasStashedLocationValues
{
  return self->_hasStashedLocationValues;
}

- (id)parentFolderOrderValueForAlbum:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__23346;
  v25 = __Block_byref_object_dispose__23347;
  id v26 = 0;
  v8 = (void *)MEMORY[0x19F38D3B0]();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v10 = -[PLRelationshipOrderKeyManager _locked_spiSafeContextGivenPassedInContext:andName:](self, "_locked_spiSafeContextGivenPassedInContext:andName:", v7, "-[PLRelationshipOrderKeyManager parentFolderOrderValueForAlbum:inManagedObjectContext:]");
  os_unfair_lock_unlock(p_lock);
  v11 = [v6 objectID];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __87__PLRelationshipOrderKeyManager_parentFolderOrderValueForAlbum_inManagedObjectContext___block_invoke;
  v17[3] = &unk_1E5875340;
  id v12 = v10;
  id v18 = v12;
  id v13 = v11;
  id v19 = v13;
  v20 = &v21;
  v14 = (void *)MEMORY[0x19F38D650](v17);
  [v12 performBlockAndWait:v14];

  id v15 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v15;
}

void __87__PLRelationshipOrderKeyManager_parentFolderOrderValueForAlbum_inManagedObjectContext___block_invoke(void *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = +[PLManagedObject entityInManagedObjectContext:a1[4]];
  v3 = [v2 relationshipsByName];
  v4 = +[PLManagedFolder childKeyForOrdering];
  v5 = [v3 objectForKey:v4];

  id v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  id v18 = 0;
  v8 = [v6 _allOrderKeysForDestination:v7 inRelationship:v5 error:&v18];
  id v9 = v18;
  if (v8)
  {
    if ([v8 count] == 2)
    {
      uint64_t v10 = [v8 objectAtIndex:1];
      uint64_t v11 = *(void *)(a1[6] + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      uint64_t v13 = [*(id *)(*(void *)(a1[6] + 8) + 40) copy];
      uint64_t v14 = *(void *)(a1[6] + 8);
      id v15 = *(NSObject **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
LABEL_7:
    }
  }
  else if (!*MEMORY[0x1E4F59AC0])
  {
    id v15 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = a1[5];
      v17 = [v5 name];
      *(_DWORD *)buf = 138412802;
      uint64_t v20 = v16;
      __int16 v21 = 2112;
      v22 = v17;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to fetch order keys for destination album %@ in %@: %@", buf, 0x20u);
    }
    goto LABEL_7;
  }
}

- (id)albumsAndOrderValuesForAsset:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__23346;
  uint64_t v25 = __Block_byref_object_dispose__23347;
  id v26 = 0;
  v8 = (void *)MEMORY[0x19F38D3B0]();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v10 = -[PLRelationshipOrderKeyManager _locked_spiSafeContextGivenPassedInContext:andName:](self, "_locked_spiSafeContextGivenPassedInContext:andName:", v7, "-[PLRelationshipOrderKeyManager albumsAndOrderValuesForAsset:inManagedObjectContext:]");

  os_unfair_lock_unlock(p_lock);
  uint64_t v11 = [v6 objectID];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__PLRelationshipOrderKeyManager_albumsAndOrderValuesForAsset_inManagedObjectContext___block_invoke;
  v17[3] = &unk_1E5875340;
  id v12 = v10;
  id v18 = v12;
  id v13 = v11;
  id v19 = v13;
  uint64_t v20 = &v21;
  uint64_t v14 = (void *)MEMORY[0x19F38D650](v17);
  [v12 performBlockAndWait:v14];

  id v15 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v15;
}

void __85__PLRelationshipOrderKeyManager_albumsAndOrderValuesForAsset_inManagedObjectContext___block_invoke(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = +[PLManagedObject entityInManagedObjectContext:a1[4]];
  v3 = [v2 relationshipsByName];
  v4 = +[PLManagedAlbum childKeyForOrdering];
  v5 = [v3 objectForKey:v4];

  id v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  id v15 = 0;
  v8 = [v6 _allOrderKeysForDestination:v7 inRelationship:v5 error:&v15];
  id v9 = v15;
  if (v8)
  {
    uint64_t v10 = [v8 copy];
    uint64_t v11 = *(void *)(a1[6] + 8);
    id v12 = *(NSObject **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
LABEL_6:

    goto LABEL_7;
  }
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v12 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = a1[5];
      uint64_t v14 = [v5 name];
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v13;
      __int16 v18 = 2112;
      id v19 = v14;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch order keys for destination asset %@ in %@: %@", buf, 0x20u);
    }
    goto LABEL_6;
  }
LABEL_7:
}

- (BOOL)writeStashedLocationValuesInContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 1;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__23346;
  v32 = __Block_byref_object_dispose__23347;
  id v33 = 0;
  uint64_t v7 = (void *)MEMORY[0x19F38D3B0]();
  char v27 = 0;
  id v25 = 0;
  id v26 = 0;
  [(PLRelationshipOrderKeyManager *)self _getAndResetEnqueuedOrderValueUpdatesForFolders:&v26 albums:&v25 conflictDetected:&v27];
  id v8 = v26;
  id v9 = v25;
  os_unfair_lock_lock(&self->_lock);
  id v10 = v6;
  if (v27)
  {
    if (objc_msgSend(v6, "changeSource", v6) == 1) {
      id v10 = 0;
    }
    else {
      id v10 = v6;
    }
  }
  uint64_t v11 = -[PLRelationshipOrderKeyManager _locked_spiSafeContextGivenPassedInContext:andName:](self, "_locked_spiSafeContextGivenPassedInContext:andName:", v10, "-[PLRelationshipOrderKeyManager writeStashedLocationValuesInContext:error:]");
  os_unfair_lock_unlock(&self->_lock);
  if ([v8 count] || objc_msgSend(v9, "count"))
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    __int16 v18 = __75__PLRelationshipOrderKeyManager_writeStashedLocationValuesInContext_error___block_invoke;
    id v19 = &unk_1E586C518;
    uint64_t v23 = &v34;
    id v20 = v9;
    id v12 = v11;
    id v21 = v12;
    id v24 = &v28;
    id v22 = v8;
    uint64_t v13 = (void *)MEMORY[0x19F38D650](&v16);
    -[PLRelationshipOrderKeyManager setInWriteStashedLocationMode:](self, "setInWriteStashedLocationMode:", 1, v16, v17, v18, v19);
    [v12 performBlockAndWait:v13];
    [(PLRelationshipOrderKeyManager *)self setInWriteStashedLocationMode:0];
  }
  if (a4) {
    *a4 = (id) v29[5];
  }
  char v14 = *((unsigned char *)v35 + 24);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v14;
}

void __75__PLRelationshipOrderKeyManager_writeStashedLocationValuesInContext_error___block_invoke(uint64_t a1)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    obuint64_t j = *(id *)(a1 + 32);
    uint64_t v2 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
    v4 = (unsigned char *)MEMORY[0x1E4F59AC0];
    if (v2)
    {
      uint64_t v5 = v2;
      uint64_t v51 = *(void *)v62;
      id v6 = off_1E585E000;
      *(void *)&long long v3 = 138412802;
      long long v47 = v3;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v62 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v61 + 1) + 8 * i);
          id v9 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v8, v47);
          id v10 = [(__objc2_class *)v6[399] childKeyForOrdering];
          uint64_t v11 = [v9 objectForKey:v10];

          if (!*v4)
          {
            id v12 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              int v13 = [v11 count];
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)v67 = v13;
              *(_WORD *)&v67[4] = 2112;
              *(void *)&v67[6] = v8;
              *(_WORD *)&v67[14] = 2112;
              *(void *)&v67[16] = v11;
              _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "Writing %d asset order keys in album %@: %@", buf, 0x1Cu);
            }
          }
          char v14 = *(void **)(a1 + 40);
          id v15 = v6;
          uint64_t v16 = [(__objc2_class *)v6[399] childKeyForOrdering];
          uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
          id v60 = *(id *)(v17 + 40);
          LOBYTE(v14) = [v14 _updateLocationsOfObjectsToLocationByOrderKey:v11 inRelationshipWithName:v16 onObjectWithID:v8 error:&v60];
          objc_storeStrong((id *)(v17 + 40), v60);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)v14;

          if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
          {
            v4 = (unsigned char *)MEMORY[0x1E4F59AC0];
            if (!*MEMORY[0x1E4F59AC0])
            {
              uint64_t v23 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
                *(_DWORD *)buf = v47;
                *(void *)v67 = v11;
                *(_WORD *)&v67[8] = 2112;
                *(void *)&v67[10] = v8;
                *(_WORD *)&v67[18] = 2112;
                *(void *)&v67[20] = v24;
                _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Failed to update assets order keys %@ in album %@ -- %@", buf, 0x20u);
              }
            }
            goto LABEL_24;
          }
          __int16 v18 = *(void **)(a1 + 40);
          uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
          id v59 = *(id *)(v19 + 40);
          char v20 = [v18 save:&v59];
          objc_storeStrong((id *)(v19 + 40), v59);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v20;
          v4 = (unsigned char *)MEMORY[0x1E4F59AC0];
          id v6 = v15;
          if (!(*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) | *MEMORY[0x1E4F59AC0]))
          {
            id v21 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
              *(_DWORD *)buf = v47;
              *(void *)v67 = v11;
              *(_WORD *)&v67[8] = 2112;
              *(void *)&v67[10] = v8;
              *(_WORD *)&v67[18] = 2112;
              *(void *)&v67[20] = v22;
              _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to save changes to order keys %@ in album %@ -- %@", buf, 0x20u);
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v61 objects:v68 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_24:

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id obja = *(id *)(a1 + 48);
      uint64_t v25 = [obja countByEnumeratingWithState:&v55 objects:v65 count:16];
      if (v25)
      {
        uint64_t v27 = v25;
        uint64_t v52 = *(void *)v56;
        uint64_t v28 = off_1E585E000;
        *(void *)&long long v26 = 138412802;
        long long v48 = v26;
        while (2)
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v56 != v52) {
              objc_enumerationMutation(obja);
            }
            uint64_t v30 = *(void *)(*((void *)&v55 + 1) + 8 * j);
            v31 = objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v30, v48);
            v32 = [(__objc2_class *)v28[405] childKeyForOrdering];
            id v33 = [v31 objectForKey:v32];

            if (!*v4)
            {
              uint64_t v34 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                int v35 = [v33 count];
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)v67 = v35;
                *(_WORD *)&v67[4] = 2112;
                *(void *)&v67[6] = v30;
                *(_WORD *)&v67[14] = 2112;
                *(void *)&v67[16] = v33;
                _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_DEBUG, "Writing %d albums order keys in folder %@: %@", buf, 0x1Cu);
              }
            }
            uint64_t v36 = *(void **)(a1 + 40);
            char v37 = v28;
            v38 = [(__objc2_class *)v28[405] childKeyForOrdering];
            uint64_t v39 = *(void *)(*(void *)(a1 + 64) + 8);
            id v54 = *(id *)(v39 + 40);
            LOBYTE(v36) = [v36 _updateLocationsOfObjectsToLocationByOrderKey:v33 inRelationshipWithName:v38 onObjectWithID:v30 error:&v54];
            objc_storeStrong((id *)(v39 + 40), v54);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)v36;

            if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
            {
              if (!*MEMORY[0x1E4F59AC0])
              {
                v45 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v46 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
                  *(_DWORD *)buf = v48;
                  *(void *)v67 = v33;
                  *(_WORD *)&v67[8] = 2112;
                  *(void *)&v67[10] = v30;
                  *(_WORD *)&v67[18] = 2112;
                  *(void *)&v67[20] = v46;
                  _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_ERROR, "Failed to update albums order keys %@ in folder %@ -- %@", buf, 0x20u);
                }
              }
              goto LABEL_47;
            }
            v40 = *(void **)(a1 + 40);
            uint64_t v41 = *(void *)(*(void *)(a1 + 64) + 8);
            id v53 = *(id *)(v41 + 40);
            char v42 = [v40 save:&v53];
            objc_storeStrong((id *)(v41 + 40), v53);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v42;
            v4 = (unsigned char *)MEMORY[0x1E4F59AC0];
            uint64_t v28 = v37;
            if (!(*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) | *MEMORY[0x1E4F59AC0]))
            {
              v43 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                uint64_t v44 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
                *(_DWORD *)buf = v48;
                *(void *)v67 = v33;
                *(_WORD *)&v67[8] = 2112;
                *(void *)&v67[10] = v30;
                *(_WORD *)&v67[18] = 2112;
                *(void *)&v67[20] = v44;
                _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_ERROR, "Failed to save changes to order keys %@ in folder %@ -- %@", buf, 0x20u);
              }
            }
          }
          uint64_t v27 = [obja countByEnumeratingWithState:&v55 objects:v65 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }
LABEL_47:
    }
  }
}

- (void)_getAndResetEnqueuedOrderValueUpdatesForFolders:(id *)a3 albums:(id *)a4 conflictDetected:(BOOL *)a5
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a3)
  {
    id v16 = (id)[(NSMutableDictionary *)self->_enqueuedFolderAlbumsOrderValueUpdates copy];
    if (a4)
    {
LABEL_3:
      id v10 = (void *)[(NSMutableDictionary *)self->_enqueuedAlbumAssetsOrderValueUpdates copy];
      goto LABEL_6;
    }
  }
  else
  {
    id v16 = 0;
    if (a4) {
      goto LABEL_3;
    }
  }
  id v10 = 0;
LABEL_6:
  *a5 = self->_conflictDetected;
  uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  enqueuedFolderAlbumsOrderValueUpdates = self->_enqueuedFolderAlbumsOrderValueUpdates;
  self->_enqueuedFolderAlbumsOrderValueUpdates = v11;

  int v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  enqueuedAlbumAssetsOrderValueUpdates = self->_enqueuedAlbumAssetsOrderValueUpdates;
  self->_enqueuedAlbumAssetsOrderValueUpdates = v13;

  id v15 = [(PLRelationshipOrderKeyManager *)self _locked_locationsCache];
  [v15 removeAllObjects];

  self->_hasStashedLocationValues = 0;
  self->_conflictDetected = 0;
  os_unfair_lock_unlock(p_lock);
  if (a3) {
    *a3 = v16;
  }
  if (a4) {
    *a4 = v10;
  }
}

- (void)_setConflictDetected:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_conflictDetected = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)stashAlbumAssetsLocationValue:(int64_t)a3 forAssetWithID:(id)a4 inAlbumWithID:(id)a5 atIndex:(unint64_t)a6 usingContext:(id)a7
{
  id v18 = a4;
  id v12 = a5;
  id v13 = a7;
  char v14 = (void *)MEMORY[0x19F38D3B0]();
  os_unfair_lock_lock(&self->_lock);
  id v15 = -[PLRelationshipOrderKeyManager _locked_spiSafeContextGivenPassedInContext:andName:](self, "_locked_spiSafeContextGivenPassedInContext:andName:", v13, "-[PLRelationshipOrderKeyManager stashAlbumAssetsLocationValue:forAssetWithID:inAlbumWithID:atIndex:usingContext:]");
  id v16 = [(PLRelationshipOrderKeyManager *)self _locked_enqueuedAlbumAssetsOrderValueUpdates];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v17 = +[PLManagedAlbum childKeyForOrdering];
  [(PLRelationshipOrderKeyManager *)self _stashLocationValue:a3 forOrderedObjectWithID:v18 inSourceObjectID:v12 relationship:v17 atIndex:a6 usingStashDictionary:v16 usingSPISafeContext:v15];
}

- (void)stashFolderAlbumsLocationValue:(int64_t)a3 forAlbumWithID:(id)a4 inFolderWithID:(id)a5 atIndex:(unint64_t)a6 usingContext:(id)a7
{
  id v18 = a4;
  id v12 = a5;
  id v13 = a7;
  char v14 = (void *)MEMORY[0x19F38D3B0]();
  os_unfair_lock_lock(&self->_lock);
  id v15 = -[PLRelationshipOrderKeyManager _locked_spiSafeContextGivenPassedInContext:andName:](self, "_locked_spiSafeContextGivenPassedInContext:andName:", v13, "-[PLRelationshipOrderKeyManager stashFolderAlbumsLocationValue:forAlbumWithID:inFolderWithID:atIndex:usingContext:]");
  id v16 = [(PLRelationshipOrderKeyManager *)self _locked_enqueuedFolderAlbumsOrderValueUpdates];
  os_unfair_lock_unlock(&self->_lock);
  uint64_t v17 = +[PLManagedFolder childKeyForOrdering];
  [(PLRelationshipOrderKeyManager *)self _stashLocationValue:a3 forOrderedObjectWithID:v18 inSourceObjectID:v12 relationship:v17 atIndex:a6 usingStashDictionary:v16 usingSPISafeContext:v15];
}

- (void)_stashLocationValue:(int64_t)a3 forOrderedObjectWithID:(id)a4 inSourceObjectID:(id)a5 relationship:(id)a6 atIndex:(unint64_t)a7 usingStashDictionary:(id)a8 usingSPISafeContext:(id)a9
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  uint64_t v19 = [(PLRelationshipOrderKeyManager *)self _orderingStateForRelationship:v17 onObjectWithID:v16 usingSPISafeContext:a9];
  if (!*MEMORY[0x1E4F59AC0])
  {
    char v20 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      int64_t v28 = a3;
      __int16 v29 = 2112;
      id v30 = v15;
      __int16 v31 = 2112;
      id v32 = v17;
      __int16 v33 = 2112;
      id v34 = v16;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "Stash order value %lld for %@ in %@ on %@", buf, 0x2Au);
    }
  }
  if ([v19 setOrderValue:a3 forObjectID:v15 atIndex:a7])
  {
    id v21 = [v18 objectForKey:v16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = [v21 objectForKey:v17];
    }
    else
    {
      uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
      id v25 = v17;
      long long v26 = v23;
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      [v18 setObject:v22 forKey:v16];
    }
    if (a3 >= 1)
    {
      [v23 addObject:v15];
      uint64_t v24 = [NSNumber numberWithLongLong:a3];
      [v23 addObject:v24];

      self->_hasStashedLocationValues = 1;
    }
  }
}

- (id)objectIDsAndOrderValuesForRelationship:(id)a3 onObjectWithID:(id)a4 invalidateCache:(BOOL)a5 inContext:(id)a6
{
  BOOL v7 = a5;
  v22[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  context = (void *)MEMORY[0x19F38D3B0]();
  os_unfair_lock_lock(&self->_lock);
  id v13 = -[PLRelationshipOrderKeyManager _locked_spiSafeContextGivenPassedInContext:andName:](self, "_locked_spiSafeContextGivenPassedInContext:andName:", v12, "-[PLRelationshipOrderKeyManager objectIDsAndOrderValuesForRelationship:onObjectWithID:invalidateCache:inContext:]");
  os_unfair_lock_unlock(&self->_lock);
  char v14 = [(PLRelationshipOrderKeyManager *)self _orderingStateForRelationship:v10 onObjectWithID:v11 invalidateCache:v7 usingSPISafeContext:v13];
  id v15 = [v14 objectIDs];
  id v16 = (void *)[v15 copy];
  v22[0] = v16;
  id v17 = [v14 orderKeys];
  id v18 = (void *)[v17 copy];
  v22[1] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];

  return v19;
}

- (unint64_t)findIndexForAssetWithID:(id)a3 newOrderValue:(int64_t)a4 inAlbumWithID:(id)a5 hasOrderValueConflictWithAssetID:(id *)a6 inContext:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = (void *)MEMORY[0x19F38D3B0]();
  os_unfair_lock_lock(&self->_lock);
  id v16 = -[PLRelationshipOrderKeyManager _locked_spiSafeContextGivenPassedInContext:andName:](self, "_locked_spiSafeContextGivenPassedInContext:andName:", v14, "-[PLRelationshipOrderKeyManager findIndexForAssetWithID:newOrderValue:inAlbumWithID:hasOrderValueConflictWithAssetID:inContext:]");
  os_unfair_lock_unlock(&self->_lock);
  id v17 = +[PLManagedAlbum childKeyForOrdering];
  id v18 = [(PLRelationshipOrderKeyManager *)self _orderingStateForRelationship:v17 onObjectWithID:v13 usingSPISafeContext:v16];

  unint64_t v19 = [v18 findIndexForObjectID:v12 newOrderValue:a4 hasOrderValueConflictWithObjectID:a6];

  return v19;
}

- (unint64_t)findIndexForAlbumWithID:(id)a3 newOrderValue:(int64_t)a4 inFolderWithID:(id)a5 hasOrderValueConflictWithAlbumID:(id *)a6 inContext:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  id v15 = (void *)MEMORY[0x19F38D3B0]();
  os_unfair_lock_lock(&self->_lock);
  id v16 = -[PLRelationshipOrderKeyManager _locked_spiSafeContextGivenPassedInContext:andName:](self, "_locked_spiSafeContextGivenPassedInContext:andName:", v14, "-[PLRelationshipOrderKeyManager findIndexForAlbumWithID:newOrderValue:inFolderWithID:hasOrderValueConflictWithAlbumID:inContext:]");
  os_unfair_lock_unlock(&self->_lock);
  id v17 = +[PLManagedFolder childKeyForOrdering];
  id v18 = [(PLRelationshipOrderKeyManager *)self _orderingStateForRelationship:v17 onObjectWithID:v13 usingSPISafeContext:v16];

  unint64_t v19 = [v18 findIndexForObjectID:v12 newOrderValue:a4 hasOrderValueConflictWithObjectID:a6];

  return v19;
}

- (void)getConflictResolutionOrderValuesForRelationship:(id)a3 onObjectWithID:(id)a4 atIndex:(unint64_t)a5 intoLower:(int64_t *)a6 higher:(int64_t *)a7 inContext:(id)a8
{
  id v31 = a3;
  id v13 = a4;
  id v14 = a8;
  id v30 = (void *)MEMORY[0x19F38D3B0]();
  os_unfair_lock_lock(&self->_lock);
  id v15 = -[PLRelationshipOrderKeyManager _locked_spiSafeContextGivenPassedInContext:andName:](self, "_locked_spiSafeContextGivenPassedInContext:andName:", v14, "-[PLRelationshipOrderKeyManager getConflictResolutionOrderValuesForRelationship:onObjectWithID:atIndex:intoLower:higher:inContext:]");
  os_unfair_lock_unlock(&self->_lock);
  id v16 = [(PLRelationshipOrderKeyManager *)self _orderingStateForRelationship:v31 onObjectWithID:v13 usingSPISafeContext:v15];
  id v17 = [v16 orderKeys];
  id v18 = [v17 objectAtIndexedSubscript:a5];
  uint64_t v19 = [v18 longLongValue];

  if (a5)
  {
    char v20 = [v17 objectAtIndexedSubscript:a5 - 1];
    uint64_t v21 = [v20 longLongValue];
  }
  else
  {
    uint64_t v21 = 1024;
  }
  if ([v17 count] - 1 <= a5)
  {
    uint64_t v23 = 0x7FFFFFFFFFFFFBFFLL;
  }
  else
  {
    uint64_t v22 = [v17 objectAtIndexedSubscript:a5 + 1];
    uint64_t v23 = [v22 longLongValue];
  }
  uint64_t v24 = v19 - v21;
  if (v19 < v21) {
    ++v24;
  }
  int64_t v25 = v21 + (v24 >> 1);
  if (v19 - 1024 > v25) {
    int64_t v25 = v19 - 1024;
  }
  if (v19 <= v21) {
    int64_t v25 = 0;
  }
  *a6 = v25;
  uint64_t v26 = v23 - v19;
  if (v23 < v19) {
    ++v26;
  }
  uint64_t v27 = v19 + (v26 >> 1);
  if (v19 + 1024 >= v27 + 1) {
    int64_t v28 = v27 + 1;
  }
  else {
    int64_t v28 = v19 + 1024;
  }
  if (v23 <= v19) {
    int64_t v28 = 0;
  }
  *a7 = v28;
}

- (id)_orderingStateForRelationship:(id)a3 onObjectWithID:(id)a4 invalidateCache:(BOOL)a5 usingSPISafeContext:(id)a6
{
  BOOL v7 = a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v10 = (__CFString *)a3;
  id v11 = (__CFString *)a4;
  id v12 = a6;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v14 = [(PLRelationshipOrderKeyManager *)self _locked_locationsCache];
  id v15 = [v14 objectForKey:v11];

  if (!v15 || v7)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);

    id v17 = [(PLRelationshipOrderKeyManager *)self _locked_locationsCache];
    [v17 setObject:v16 forKey:v11];

    id v15 = v16;
  }
  id v18 = [v15 objectForKey:v10];
  if (!v18)
  {
    uint64_t v40 = 0;
    uint64_t v41 = &v40;
    uint64_t v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__23346;
    uint64_t v44 = __Block_byref_object_dispose__23347;
    id v45 = 0;
    uint64_t v19 = (unsigned char *)MEMORY[0x1E4F59AC0];
    if (!*MEMORY[0x1E4F59AC0])
    {
      char v20 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        long long v47 = v10;
        __int16 v48 = 2112;
        v49 = v11;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "Retrieving locations for relationship '%@' on '%@'", buf, 0x16u);
      }
    }
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    id v34 = __114__PLRelationshipOrderKeyManager__orderingStateForRelationship_onObjectWithID_invalidateCache_usingSPISafeContext___block_invoke;
    uint64_t v35 = &unk_1E5875368;
    uint64_t v39 = &v40;
    id v36 = v12;
    uint64_t v21 = v10;
    char v37 = v21;
    uint64_t v22 = v11;
    v38 = v22;
    [v36 performBlockAndWait:&v32];
    uint64_t v23 = (void *)v41[5];
    if (v23 && objc_msgSend(v23, "count", v32, v33, v34, v35, v36, v37) == 2)
    {
      uint64_t v24 = [PLRelationshipOrderingState alloc];
      int64_t v25 = [(id)v41[5] objectAtIndexedSubscript:0];
      uint64_t v26 = [(id)v41[5] objectAtIndexedSubscript:1];
      id v18 = [(PLRelationshipOrderingState *)v24 initWithObjectIDs:v25 orderValues:v26];
    }
    else
    {
      if (!*v19)
      {
        uint64_t v27 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          int64_t v28 = @"invalid";
          uint64_t v29 = v41[5];
          if (!v29) {
            int64_t v28 = @"nil";
          }
          *(_DWORD *)buf = 138413058;
          long long v47 = v28;
          __int16 v48 = 2112;
          v49 = v21;
          __int16 v50 = 2112;
          uint64_t v51 = v22;
          __int16 v52 = 2112;
          uint64_t v53 = v29;
          _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEBUG, "Ignoring %@ locations returned for relationship '%@' on '%@': %@", buf, 0x2Au);
        }
      }
      id v30 = [PLRelationshipOrderingState alloc];
      id v18 = [(PLRelationshipOrderingState *)v30 initWithObjectIDs:MEMORY[0x1E4F1CBF0] orderValues:MEMORY[0x1E4F1CBF0]];
    }
    objc_msgSend(v15, "setObject:forKey:", v18, v21, v32, v33, v34, v35);

    _Block_object_dispose(&v40, 8);
  }
  os_unfair_lock_unlock(p_lock);

  return v18;
}

void __114__PLRelationshipOrderKeyManager__orderingStateForRelationship_onObjectWithID_invalidateCache_usingSPISafeContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_orderKeysForRelationshipWithName__:onObjectWithID:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_orderingStateForRelationship:(id)a3 onObjectWithID:(id)a4 usingSPISafeContext:(id)a5
{
  return [(PLRelationshipOrderKeyManager *)self _orderingStateForRelationship:a3 onObjectWithID:a4 invalidateCache:0 usingSPISafeContext:a5];
}

- (void)updateAlbumAssetsUsingTransientOrdersByAlbumOID:(id)a3 inLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ((PLIsAssetsd() & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLRelationshipOrderKeyManager.m", 457, @"Invalid parameter not satisfying: %@", @"PLIsAssetsd()" object file lineNumber description];
  }
  if ([v7 count])
  {
    id v9 = [v8 managedObjectContext];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __91__PLRelationshipOrderKeyManager_updateAlbumAssetsUsingTransientOrdersByAlbumOID_inLibrary___block_invoke;
    v12[3] = &unk_1E5873A50;
    id v13 = v7;
    id v14 = v9;
    id v15 = self;
    id v10 = v9;
    [v8 performTransactionAndWait:v12];
  }
}

void __91__PLRelationshipOrderKeyManager_updateAlbumAssetsUsingTransientOrdersByAlbumOID_inLibrary___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = +[PLManagedAlbum entityName];
  v4 = [v2 fetchRequestWithEntityName:v3];

  uint64_t v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = [a1[4] allKeys];
  id v7 = [v5 predicateWithFormat:@"self IN %@", v6];
  [v4 setPredicate:v7];

  id v8 = [a1[5] executeFetchRequest:v4 error:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (([v13 isDeleted] & 1) == 0 && objc_msgSend(v13, "supportsAssetOrderKeys"))
        {
          id v14 = a1[4];
          id v15 = [v13 objectID];
          id v16 = [v14 objectForKey:v15];

          [a1[6] _updateOrderOfChildrenInParent:v13 usingTransientOrders:v16];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

- (void)_updateOrderOfChildrenInParent:(id)a3 usingTransientOrders:(id)a4
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v80 = a3;
  v108[0] = MEMORY[0x1E4F143A8];
  v108[1] = 3221225472;
  v108[2] = __85__PLRelationshipOrderKeyManager__updateOrderOfChildrenInParent_usingTransientOrders___block_invoke;
  v108[3] = &unk_1E586C990;
  v108[4] = self;
  id v6 = [a4 sortedArrayUsingComparator:v108];
  if (!*MEMORY[0x1E4F59AC0])
  {
    id v7 = __CPLAssetsdOSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v111 = v6;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEBUG, "Final orders array %@", buf, 0xCu);
    }
  }
  v85 = [v80 managedObjectContext];
  v89 = [v80 objectID];
  v86 = [v80 mutableAssets];
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v6, "count"));
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v104 objects:v121 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v105;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v105 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v104 + 1) + 8 * i) objectID];
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v104 objects:v121 count:16];
    }
    while (v11);
  }
  v82 = v8;

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  obuint64_t j = v9;
  id v15 = v85;
  id v16 = v86;
  uint64_t v88 = [obj countByEnumeratingWithState:&v100 objects:v120 count:16];
  if (v88)
  {
    uint64_t v87 = *(void *)v101;
    *(void *)&long long v17 = 138412802;
    long long v79 = v17;
    v81 = self;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v101 != v87) {
          objc_enumerationMutation(obj);
        }
        long long v19 = *(void **)(*((void *)&v100 + 1) + 8 * v18);
        long long v20 = objc_msgSend(v19, "objectID", v79);
        v92 = [v15 objectWithID:v20];
        uint64_t v91 = objc_msgSend(v16, "indexOfObject:");
        uint64_t v21 = [v19 orderValue];
        if (v21)
        {
          uint64_t v22 = v21;
          id v99 = 0;
          unint64_t v23 = [(PLRelationshipOrderKeyManager *)self findIndexForAssetWithID:v20 newOrderValue:v21 inAlbumWithID:v89 hasOrderValueConflictWithAssetID:&v99 inContext:v15];
          id v24 = v99;
          unint64_t v25 = [v16 count];
          uint64_t v26 = v23;
          unint64_t v90 = v23;
          if (v23 > v25)
          {
            if (!*MEMORY[0x1E4F59AC0])
            {
              uint64_t v27 = __CPLAssetsdOSLogDomain();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                int64_t v28 = [NSNumber numberWithUnsignedLongLong:v22];
                uint64_t v29 = [v86 count];
                *(_DWORD *)buf = 138413314;
                v111 = v28;
                __int16 v112 = 2112;
                v113 = v20;
                __int16 v114 = 2112;
                id v115 = v89;
                __int16 v116 = 2048;
                unint64_t v117 = v90;
                __int16 v118 = 2048;
                uint64_t v119 = v29;
                _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_DEFAULT, "Asset index based on order value is too large for mutableAssets: order value %@ for %@ on %@ target index = %ld, count = %ld", buf, 0x34u);

                id v16 = v86;
              }
            }
            uint64_t v26 = [v16 count] - (v91 != 0x7FFFFFFFFFFFFFFFLL);
            id v15 = v85;
          }
          if (!v24)
          {
            int v40 = 1;
            goto LABEL_104;
          }
          unint64_t v84 = v26;
          if ([v82 containsObject:v24])
          {
            long long v97 = 0u;
            long long v98 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
            id v30 = obj;
            uint64_t v31 = [v30 countByEnumeratingWithState:&v95 objects:v109 count:16];
            if (v31)
            {
              uint64_t v32 = v31;
              uint64_t v33 = *(void *)v96;
LABEL_28:
              uint64_t v34 = 0;
              while (1)
              {
                if (*(void *)v96 != v33) {
                  objc_enumerationMutation(v30);
                }
                uint64_t v35 = *(void **)(*((void *)&v95 + 1) + 8 * v34);
                id v36 = [v35 objectID];
                if ([v36 isEqual:v24])
                {
                  uint64_t v37 = [v35 orderValue];

                  if (v37 == v22)
                  {
                    id v15 = v85;
                    long long v61 = [v85 existingObjectWithID:v24 error:0];
                    self = v81;
                    [(PLRelationshipOrderKeyManager *)v81 _setConflictDetected:1];
                    if (!*MEMORY[0x1E4F59AC0])
                    {
                      long long v62 = __CPLAssetsdOSLogDomain();
                      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                      {
                        [NSNumber numberWithUnsignedLongLong:v22];
                        v64 = long long v63 = v61;
                        *(_DWORD *)buf = 138413058;
                        v111 = v64;
                        __int16 v112 = 2112;
                        v113 = v20;
                        __int16 v114 = 2112;
                        id v115 = v89;
                        __int16 v116 = 2112;
                        unint64_t v117 = (unint64_t)v24;
                        _os_log_impl(&dword_19B3C7000, v62, OS_LOG_TYPE_DEFAULT, "Asset album order value %@ for %@ on %@ conflicts with %@, adjusting, since it's conflicting with the incoming order", buf, 0x2Au);

                        long long v61 = v63;
                      }
                    }
                    id v16 = v86;
                    if (v61) {
                      goto LABEL_49;
                    }
LABEL_69:
                    int v40 = 1;
LABEL_103:
                    uint64_t v26 = v84;
LABEL_104:
                    if (v91 == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      [v16 insertObject:v92 atIndex:v26];
                      if (!v40) {
                        goto LABEL_110;
                      }
                    }
                    else if ((v40 & 1) == 0)
                    {
                      uint64_t v46 = v26;
LABEL_107:
                      v77 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", v91, v26);
                      [v16 moveObjectsAtIndexes:v77 toIndex:v46];

                      goto LABEL_110;
                    }
                    [(PLRelationshipOrderKeyManager *)self stashAlbumAssetsLocationValue:v22 forAssetWithID:v20 inAlbumWithID:v89 atIndex:v90 usingContext:v15];
                    goto LABEL_110;
                  }
                }
                else
                {
                }
                if (v32 == ++v34)
                {
                  uint64_t v32 = [v30 countByEnumeratingWithState:&v95 objects:v109 count:16];
                  if (v32) {
                    goto LABEL_28;
                  }
                  break;
                }
              }
            }

            if (*MEMORY[0x1E4F59AC0])
            {
              int v40 = 1;
              self = v81;
              id v15 = v85;
              id v16 = v86;
              goto LABEL_103;
            }
            v38 = __CPLAssetsdOSLogDomain();
            id v16 = v86;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v39 = [NSNumber numberWithUnsignedLongLong:v22];
              *(_DWORD *)buf = 138413058;
              v111 = v39;
              __int16 v112 = 2112;
              v113 = v20;
              __int16 v114 = 2112;
              id v115 = v89;
              __int16 v116 = 2112;
              unint64_t v117 = (unint64_t)v24;
              _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEFAULT, "Asset album order value %@ for %@ on %@ conflicts with %@, ignoring, since it will be reordered", buf, 0x2Au);
            }
            int v40 = 1;
            self = v81;
            id v15 = v85;
LABEL_102:

            goto LABEL_103;
          }
          long long v61 = [v15 existingObjectWithID:v24 error:0];
          [(PLRelationshipOrderKeyManager *)self _setConflictDetected:1];
          if (!v61) {
            goto LABEL_69;
          }
LABEL_49:
          if (!*MEMORY[0x1E4F59AC0])
          {
            long long v47 = __CPLAssetsdOSLogDomain();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v48 = [NSNumber numberWithUnsignedLongLong:v22];
              *(_DWORD *)buf = 138413058;
              v111 = v48;
              __int16 v112 = 2112;
              v113 = v20;
              __int16 v114 = 2112;
              id v115 = v89;
              __int16 v116 = 2112;
              unint64_t v117 = (unint64_t)v24;
              _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_DEFAULT, "Asset album order value %@ for %@ on %@ conflicts with %@, adjusting", buf, 0x2Au);
            }
          }
          v49 = v61;
          __int16 v50 = [v61 dateCreated];
          uint64_t v51 = [v92 dateCreated];
          uint64_t v52 = [v50 compare:v51];

          if (!v52)
          {
            uint64_t v53 = [v49 originalFilename];
            uint64_t v54 = [v92 originalFilename];
            uint64_t v52 = [v53 compare:v54];
          }
          uint64_t v93 = 0;
          uint64_t v94 = 0;
          long long v55 = +[PLManagedAlbum childKeyForOrdering];
          [(PLRelationshipOrderKeyManager *)self getConflictResolutionOrderValuesForRelationship:v55 onObjectWithID:v89 atIndex:v90 intoLower:&v94 higher:&v93 inContext:v15];

          v38 = v49;
          if (v52 == -1)
          {
            id v16 = v86;
            if (v94)
            {
              [(PLRelationshipOrderKeyManager *)self stashAlbumAssetsLocationValue:v94 forAssetWithID:v24 inAlbumWithID:v89 atIndex:v90 usingContext:v15];
              if (!*MEMORY[0x1E4F59AC0])
              {
                v65 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                {
                  v66 = [NSNumber numberWithUnsignedLongLong:v22];
                  v67 = [NSNumber numberWithLongLong:v94];
                  *(_DWORD *)buf = v79;
                  v111 = v66;
                  __int16 v112 = 2112;
                  v113 = v67;
                  __int16 v114 = 2112;
                  id v115 = v24;
                  v68 = v65;
                  uint64_t v69 = "Conflicting existing asset album order value (ascending) updated from %@ to %@ for %@";
                  goto LABEL_78;
                }
LABEL_79:
              }
LABEL_80:
              ++v90;
              int v40 = 1;
              goto LABEL_102;
            }
            if (v93)
            {
              if (*MEMORY[0x1E4F59AC0])
              {
                uint64_t v22 = v93;
              }
              else
              {
                long long v56 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  long long v57 = [NSNumber numberWithUnsignedLongLong:v22];
                  long long v58 = [NSNumber numberWithLongLong:v93];
                  *(_DWORD *)buf = v79;
                  v111 = v57;
                  __int16 v112 = 2112;
                  v113 = v58;
                  __int16 v114 = 2112;
                  id v115 = v20;
                  id v59 = v56;
                  id v60 = "Conflicting incoming asset album order value (ascending) updated from %@ to %@ for %@";
LABEL_60:
                  _os_log_impl(&dword_19B3C7000, v59, OS_LOG_TYPE_DEFAULT, v60, buf, 0x20u);

                  id v16 = v86;
                }
LABEL_61:

                uint64_t v22 = v93;
              }
              goto LABEL_62;
            }
            if (v91 != 0x7FFFFFFFFFFFFFFFLL)
            {
              if (!*MEMORY[0x1E4F59AC0])
              {
                v74 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                {
                  v75 = [NSNumber numberWithUnsignedInteger:v90];
                  *(_DWORD *)buf = v79;
                  v111 = v20;
                  __int16 v112 = 2112;
                  v113 = v75;
                  __int16 v114 = 2112;
                  id v115 = v89;
                  _os_log_impl(&dword_19B3C7000, v74, OS_LOG_TYPE_DEFAULT, "Conflicting asset album order value (ascending) could not be stashed, moving %@ to %@ for %@", buf, 0x20u);

                  id v16 = v86;
                }
              }
              v76 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v91];
              [v16 moveObjectsAtIndexes:v76 toIndex:v84];
            }
          }
          else
          {
            id v16 = v86;
            if (v93)
            {
              if (!*MEMORY[0x1E4F59AC0])
              {
                long long v56 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  long long v57 = [NSNumber numberWithUnsignedLongLong:v22];
                  long long v58 = [NSNumber numberWithLongLong:v93];
                  *(_DWORD *)buf = v79;
                  v111 = v57;
                  __int16 v112 = 2112;
                  v113 = v58;
                  __int16 v114 = 2112;
                  id v115 = v20;
                  id v59 = v56;
                  id v60 = "Conflicting incoming asset album order value (descending) updated from %@ to %@ for %@";
                  goto LABEL_60;
                }
                goto LABEL_61;
              }
              uint64_t v22 = v93;
LABEL_62:
              ++v90;
              int v40 = 1;
              goto LABEL_102;
            }
            if (v94)
            {
              [(PLRelationshipOrderKeyManager *)self stashAlbumAssetsLocationValue:v94 forAssetWithID:v24 inAlbumWithID:v89 atIndex:v90 usingContext:v15];
              if (!*MEMORY[0x1E4F59AC0])
              {
                v65 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                {
                  v66 = [NSNumber numberWithUnsignedLongLong:v22];
                  v67 = [NSNumber numberWithLongLong:v94];
                  *(_DWORD *)buf = v79;
                  v111 = v66;
                  __int16 v112 = 2112;
                  v113 = v67;
                  __int16 v114 = 2112;
                  id v115 = v24;
                  v68 = v65;
                  uint64_t v69 = "Conflicting existing asset album order value (descending) updated from %@ to %@ for %@";
LABEL_78:
                  _os_log_impl(&dword_19B3C7000, v68, OS_LOG_TYPE_DEFAULT, v69, buf, 0x20u);

                  v38 = v49;
                  id v16 = v86;
                }
                goto LABEL_79;
              }
              goto LABEL_80;
            }
            if (v91 != 0x7FFFFFFFFFFFFFFFLL)
            {
              if (!*MEMORY[0x1E4F59AC0])
              {
                v70 = __CPLAssetsdOSLogDomain();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                {
                  v71 = [NSNumber numberWithUnsignedInteger:v90 + 1];
                  *(_DWORD *)buf = v79;
                  v111 = v20;
                  __int16 v112 = 2112;
                  v113 = v71;
                  __int16 v114 = 2112;
                  id v115 = v89;
                  _os_log_impl(&dword_19B3C7000, v70, OS_LOG_TYPE_DEFAULT, "Conflicting asset album order value (ascending) could not be stashed, moving %@ to %@ for %@", buf, 0x20u);

                  id v16 = v86;
                }
              }
              if (v84 >= [v16 count]) {
                unint64_t v72 = v84;
              }
              else {
                unint64_t v72 = v84 + 1;
              }
              v73 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v91];
              [v86 moveObjectsAtIndexes:v73 toIndex:v72];

              id v16 = v86;
            }
          }
          int v40 = 0;
          goto LABEL_102;
        }
        if (!*MEMORY[0x1E4F59AC0])
        {
          uint64_t v41 = __CPLAssetsdOSLogDomain();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            uint64_t v42 = [v92 uuid];
            v43 = [v80 uuid];
            *(_DWORD *)buf = 138412546;
            v111 = v42;
            __int16 v112 = 2112;
            v113 = v43;
            _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_ERROR, "Ignoring unsupported order value (0), appending %@ to the end of %@", buf, 0x16u);

            id v16 = v86;
          }
        }
        BOOL v44 = v91 != 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v45 = [v16 count];
        uint64_t v26 = v45 - v44;
        if (v91 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v46 = v45 - v44;
          id v24 = 0;
          id v15 = v85;
          goto LABEL_107;
        }
        [v16 insertObject:v92 atIndex:v26];
        id v24 = 0;
        id v15 = v85;
LABEL_110:

        ++v18;
      }
      while (v18 != v88);
      uint64_t v78 = [obj countByEnumeratingWithState:&v100 objects:v120 count:16];
      uint64_t v88 = v78;
    }
    while (v78);
  }
}

uint64_t __85__PLRelationshipOrderKeyManager__updateOrderOfChildrenInParent_usingTransientOrders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [(id)objc_opt_class() compareOrderKeyObject:v5 withObject:v4];

  return v6;
}

- (id)_locked_spiSafeContextGivenPassedInContext:(id)a3 andName:(const char *)a4
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v20 = 0;
  uint64_t v21 = (id *)&v20;
  uint64_t v22 = 0x3032000000;
  unint64_t v23 = __Block_byref_object_copy__23346;
  id v24 = __Block_byref_object_dispose__23347;
  id v25 = 0;
  if (v6 && ([v6 hasChanges] & 1) == 0)
  {
    objc_storeStrong(v21 + 5, a3);
  }
  else
  {
    cachedContext = self->_cachedContext;
    if (cachedContext)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __84__PLRelationshipOrderKeyManager__locked_spiSafeContextGivenPassedInContext_andName___block_invoke;
      v19[3] = &unk_1E5875E68;
      v19[4] = self;
      v19[5] = &v20;
      [(NSManagedObjectContext *)cachedContext performBlockAndWait:v19];
    }
  }
  id v8 = v21[5];
  if (!v8)
  {
    if (self->_generateContextBlock)
    {
      id v9 = PLBackendGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "PLRelationshipOrderKeyManager: manufacturing new context...", v18, 2u);
      }

      uint64_t v10 = (*((void (**)(void))self->_generateContextBlock + 2))();
      id v11 = v21[5];
      v21[5] = (id)v10;

      id v12 = v21[5];
      if (v12)
      {
        id v13 = (NSManagedObjectContext *)v12;
        p_super = &self->_cachedContext->super;
        self->_cachedContext = v13;
LABEL_17:

        id v8 = v21[5];
        goto LABEL_18;
      }
      p_super = PLBackendGetLog();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_WORD *)uint64_t v18 = 0;
      id v15 = "PLRelationshipOrderKeyManager: generateContextBlock returned nil.";
    }
    else
    {
      p_super = PLBackendGetLog();
      if (!os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_WORD *)uint64_t v18 = 0;
      id v15 = "PLRelationshipOrderKeyManager: Incorrectly configured, no _generateContextBlock set.";
    }
    _os_log_impl(&dword_19B3C7000, p_super, OS_LOG_TYPE_ERROR, v15, v18, 2u);
    goto LABEL_17;
  }
LABEL_18:
  id v16 = v8;
  _Block_object_dispose(&v20, 8);

  return v16;
}

void __84__PLRelationshipOrderKeyManager__locked_spiSafeContextGivenPassedInContext_andName___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 48) hasChanges] & 1) == 0)
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v3 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    objc_storeStrong(v3, v2);
  }
}

- (id)_locked_enqueuedAlbumAssetsOrderValueUpdates
{
  os_unfair_lock_assert_owner(&self->_lock);
  enqueuedAlbumAssetsOrderValueUpdates = self->_enqueuedAlbumAssetsOrderValueUpdates;
  if (!enqueuedAlbumAssetsOrderValueUpdates)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = self->_enqueuedAlbumAssetsOrderValueUpdates;
    self->_enqueuedAlbumAssetsOrderValueUpdates = v4;

    enqueuedAlbumAssetsOrderValueUpdates = self->_enqueuedAlbumAssetsOrderValueUpdates;
  }
  return enqueuedAlbumAssetsOrderValueUpdates;
}

- (id)_locked_enqueuedFolderAlbumsOrderValueUpdates
{
  os_unfair_lock_assert_owner(&self->_lock);
  enqueuedFolderAlbumsOrderValueUpdates = self->_enqueuedFolderAlbumsOrderValueUpdates;
  if (!enqueuedFolderAlbumsOrderValueUpdates)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = self->_enqueuedFolderAlbumsOrderValueUpdates;
    self->_enqueuedFolderAlbumsOrderValueUpdates = v4;

    enqueuedFolderAlbumsOrderValueUpdates = self->_enqueuedFolderAlbumsOrderValueUpdates;
  }
  return enqueuedFolderAlbumsOrderValueUpdates;
}

- (id)_locked_locationsCache
{
  os_unfair_lock_assert_owner(&self->_lock);
  locationsCache = self->_locationsCache;
  if (!locationsCache)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v5 = self->_locationsCache;
    self->_locationsCache = v4;

    locationsCache = self->_locationsCache;
  }
  return locationsCache;
}

- (PLRelationshipOrderKeyManager)initWithGenerateContextBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLRelationshipOrderKeyManager.m", 221, @"Invalid parameter not satisfying: %@", @"generateContextBlock" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)PLRelationshipOrderKeyManager;
  id v6 = [(PLRelationshipOrderKeyManager *)&v12 init];
  id v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_inWriteStashedLocationMode = 0;
    uint64_t v8 = MEMORY[0x19F38D650](v5);
    id generateContextBlock = v7->_generateContextBlock;
    v7->_id generateContextBlock = (id)v8;
  }
  return v7;
}

- (PLRelationshipOrderKeyManager)init
{
  uint64_t v2 = self;
  PLMethodNotImplementedException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (int64_t)compareOrderKeyObject:(id)a3 withObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 orderValue];
  uint64_t v8 = [v6 orderValue];
  if (v7 >= v8)
  {
    if (v8 >= v7)
    {
      uint64_t v10 = [v5 secondaryOrderSortKey];
      id v11 = [v6 secondaryOrderSortKey];
      int64_t v9 = [v10 compare:v11];
    }
    else
    {
      int64_t v9 = 1;
    }
  }
  else
  {
    int64_t v9 = -1;
  }

  return v9;
}

+ (id)new
{
  id v2 = a1;
  PLMethodNotImplementedException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (void)migration_updateLegacyChildCollectionOrderKeysInFolder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 valueForKey:@"childCollections"];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [(PLRelationshipOrderKeyManager *)self migration_ensureValidOrderKey:*(void *)(*((void *)&v10 + 1) + 8 * v8++) usingOrderValuePropertyKey:@"albumToFolderOrderKey"];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  int64_t v9 = [v4 array];
  [(PLRelationshipOrderKeyManager *)self migration_fixupOrderKeys:v9 usingOrderValuePropertyKey:@"albumToFolderOrderKey" enforceSingletonAlbumReservedKeySpace:1];
}

- (void)migration_updateLegacyOrderValuesForAssetsInAlbums:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v6);
        }
        [(PLRelationshipOrderKeyManager *)self _migration_updateOrderValuesForAssetsInAlbum:*(void *)(*((void *)&v12 + 1) + 8 * v11++) managedObjectContext:v7];
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_migration_updateOrderValuesForAssetsInAlbum:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 isDeleted] & 1) == 0)
  {
    uint64_t v22 = self;
    uint64_t v8 = [v6 valueForKey:@"assets"];
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v24 = id v23 = v6;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v10 = [v6 valueForKey:@"assetOrders"];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v16 = [v15 valueForKey:@"asset"];
          if (v16 && [v8 containsObject:v16]) {
            [v24 setObject:v15 forKey:v16];
          }
          else {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v12);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v17 = v9;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          [v7 deleteObject:*(void *)(*((void *)&v25 + 1) + 8 * j)];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v19);
    }

    id v6 = v23;
    [(PLRelationshipOrderKeyManager *)v22 _migration_updateOrderKeysForAssetsInParentAlbum:v23 childToOrderKeyMap:v24];
  }
}

- (void)_migration_updateOrderKeysForAssetsInParentAlbum:(id)a3 childToOrderKeyMap:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PLRelationshipOrderKeyManager *)self migration_sortedOrderKeysForAssetsInAlbum:a3 usingMap:a4];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PLRelationshipOrderKeyManager *)self migration_ensureValidOrderKey:*(void *)(*((void *)&v10 + 1) + 8 * v9++) usingOrderValuePropertyKey:@"orderValue"];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  [(PLRelationshipOrderKeyManager *)self migration_fixupOrderKeys:v5 usingOrderValuePropertyKey:@"orderValue" enforceSingletonAlbumReservedKeySpace:0];
}

- (id)migration_sortedOrderKeysForAssetsInAlbum:(id)a3 usingMap:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 valueForKey:@"assets"];
  uint64_t v8 = [v5 managedObjectContext];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v16 = objc_msgSend(v6, "objectForKey:", v15, (void)v19);
        if (!v16)
        {
          id v17 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext(@"AssetToAlbumOrder", (uint64_t)v8, 0);
          if (!v17) {
            goto LABEL_11;
          }
          id v16 = v17;
          [v17 setValue:v15 forKey:@"asset"];
          [v16 setValue:v5 forKey:@"album"];
          [v6 setObject:v16 forKey:v15];
        }
        [v9 addObject:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
LABEL_11:

  return v9;
}

- (void)migration_fixupOrderKeys:(id)a3 usingOrderValuePropertyKey:(id)a4 enforceSingletonAlbumReservedKeySpace:(BOOL)a5
{
  BOOL v5 = a5;
  id v35 = a3;
  id v7 = a4;
  uint64_t v8 = [v35 count];
  if (v8)
  {
    unint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    BOOL v33 = v5;
    unint64_t v32 = v8;
    do
    {
      uint64_t v13 = [v35 objectAtIndex:v12];
      long long v14 = [v13 valueForKey:v7];
      uint64_t v15 = [v14 longLongValue];

      if (v5)
      {
        if (!v11) {
          uint64_t v11 = 1023;
        }
        id v16 = v13;
        id v17 = [v13 valueForKey:@"kind"];
        uint64_t v18 = [v17 shortValue];

        if (+[PLManagedAlbumList albumKindHasFixedOrder:v18])
        {
          unint64_t v19 = +[PLManagedAlbumList priorityForAlbumKind:v18];
          if (v19 == -1)
          {
            uint64_t v15 = v11;
            uint64_t v13 = v16;
            goto LABEL_31;
          }
          uint64_t v13 = v16;
          if (v15 != v19)
          {
            long long v20 = [NSNumber numberWithLongLong:v19];
            [v16 setValue:v20 forKey:v7];
            goto LABEL_29;
          }
          goto LABEL_30;
        }
        uint64_t v13 = v16;
        if (v15 <= 1023) {
          [v16 setValue:&unk_1EEBEE340 forKey:v7];
        }
      }
      if (v11 >= v15)
      {
        uint64_t v34 = v13;
        unint64_t v21 = v12 + 1;
        long long v22 = v35;
        if (v12 + 1 >= v9) {
          goto LABEL_34;
        }
        long long v20 = 0;
        while (1)
        {
          id v23 = v20;
          long long v20 = [v22 objectAtIndex:v21];

          uint64_t v24 = [v20 valueForKey:v7];
          uint64_t v25 = [v24 longLongValue];

          unint64_t v26 = v25 - v11;
          if (v25 > v11 && v26 >= v10 + v21 + 1) {
            break;
          }
          ++v21;
          long long v22 = v35;
          if (v9 == v21)
          {
            unint64_t v21 = v9;
            break;
          }
        }
        if (!v20)
        {
LABEL_34:
          long long v31 = [NSNumber numberWithLongLong:v11 + 1024];
          [v34 setValue:v31 forKey:v7];

          break;
        }
        if (v21 == v9) {
          unint64_t v27 = 1024;
        }
        else {
          unint64_t v27 = v26 / (v10 + 1 + v21);
        }
        if (v12 >= v21)
        {
          unint64_t v12 = v21;
          uint64_t v11 = v25;
          BOOL v5 = v33;
        }
        else
        {
          unint64_t v28 = v11 + v27 + v27 * (v10 + v12);
          do
          {
            long long v29 = [v35 objectAtIndex:v12];
            long long v30 = [NSNumber numberWithLongLong:v28];
            [v29 setValue:v30 forKey:v7];

            ++v12;
            v28 += v27;
          }
          while (v21 != v12);
          unint64_t v12 = v21;
          uint64_t v11 = v25;
          BOOL v5 = v33;
          unint64_t v9 = v32;
        }
        uint64_t v13 = v34;
LABEL_29:

LABEL_30:
        uint64_t v15 = v11;
      }
LABEL_31:

      uint64_t v10 = ~v12;
      uint64_t v11 = v15;
      ++v12;
    }
    while (v12 < v9);
  }
}

- (void)migration_ensureValidOrderKey:(id)a3 usingOrderValuePropertyKey:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = [v8 valueForKey:v5];
  uint64_t v7 = [v6 longLongValue];

  if (v7 < 0) {
    [v8 setValue:&unk_1EEBEE328 forKey:v5];
  }
}

@end