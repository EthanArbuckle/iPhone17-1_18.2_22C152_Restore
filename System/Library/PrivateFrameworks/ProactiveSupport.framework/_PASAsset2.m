@interface _PASAsset2
- (BOOL)_loadDefaultBundleVersionWithGuardedData:(id)a3;
- (BOOL)deregisterUpdateHandlerAsyncWithToken:(id)a3;
- (BOOL)deregisterUpdateHandlerWithToken:(id)a3;
- (BOOL)overrideDefaultBundleWithBundleAtPath:(id)a3;
- (BOOL)updateAssetMetadataUsingQueryResults:(id)a3;
- (NSString)assetType;
- (NSString)bundlePath;
- (_PASAsset2)initWithAssetTypeDescriptorPath:(id)a3 defaultBundlePath:(id)a4 matchingKeysAndValues:(id)a5 notificationQueue:(id)a6 logHandle:(id)a7;
- (_PASAsset2)initWithAssetTypeDescriptorPath:(id)a3 defaultBundlePath:(id)a4 matchingKeysAndValues:(id)a5 notificationQueue:(id)a6 logHandle:(id)a7 enableAssetUpdates:(BOOL)a8;
- (_PASAsset2)initWithAssetTypeDescriptorPath:(id)a3 defaultBundlePath:(id)a4 matchingKeysAndValues:(id)a5 notificationQueue:(id)a6 logHandle:(id)a7 enableAssetUpdates:(BOOL)a8 purgeObsoleteInstalledAssets:(BOOL)a9;
- (id)_assetDescription;
- (id)_defaultBundleFilesystemPathsForAssetDataRelativePaths:(id)a3 guardedData:(id)a4 assetVersion:(unint64_t *)a5;
- (id)_initWithAssetTypeIdentifier:(id)a3 defaultBundlePath:(id)a4 compatibilityVersion:(unint64_t)a5 matchingKeysAndValues:(id)a6 notificationQueue:(id)a7 logHandle:(id)a8 enableAssetUpdates:(BOOL)a9 purgeObsoleteInstalledAssets:(BOOL)a10;
- (id)_maFilesystemPathsForAssetDataRelativePaths:(id)a3 guardedData:(id)a4 isMissingData:(BOOL *)a5 assetVersion:(unint64_t *)a6;
- (id)filesystemPathForAssetDataRelativePath:(id)a3;
- (id)filesystemPathForAssetDataRelativePath:(id)a3 assetVersion:(unint64_t *)a4;
- (id)filesystemPathsForAssetDataRelativePaths:(id)a3;
- (id)filesystemPathsForAssetDataRelativePaths:(id)a3 assetVersion:(unint64_t *)a4;
- (id)registerUpdateHandler:(id)a3;
- (unint64_t)assetVersion;
- (unint64_t)bestAssetVersionObserved;
- (unint64_t)compatibilityVersion;
- (void)_issueUpdateNotificationsWithCallback:(id)a3;
- (void)_purgeObsoleteInstalledAssetsFromCandidates:(id)a3 guardedData:(id)a4;
- (void)_updateAssetMetadata;
- (void)addOverridePath:(id)a3 forResourceWithRelativePath:(id)a4;
- (void)callAssetUpdateHandlers;
- (void)clearOverrides;
- (void)dealloc;
- (void)downloadMetadataWithCompletion:(id)a3;
- (void)invokeWithBundleOverride:(id)a3 block:(id)a4;
@end

@implementation _PASAsset2

- (id)registerUpdateHandler:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_PASAsset2.m", 391, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  v6 = [(_PASNotificationTracker *)self->_updateNotificationTracker registerWithQueue:self->_notificationQueue handler:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_updateNotificationTracker, 0);
  objc_storeStrong((id *)&self->_logHandle, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_requiredMobileAssetProperties, 0);
  objc_storeStrong((id *)&self->_defaultBundlePathBackup, 0);

  objc_storeStrong((id *)&self->_assetTypeIdentifier, 0);
}

- (unint64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void)callAssetUpdateHandlers
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37___PASAsset2_callAssetUpdateHandlers__block_invoke;
  v5[3] = &unk_1E5AEBE98;
  dispatch_semaphore_t v6 = v3;
  v4 = v3;
  [(_PASAsset2 *)self _issueUpdateNotificationsWithCallback:v5];
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)clearOverrides
{
}

- (void)addOverridePath:(id)a3 forResourceWithRelativePath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_PASAsset2.m", 837, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_PASAsset2.m", 838, @"Invalid parameter not satisfying: %@", @"relativePath" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58___PASAsset2_addOverridePath_forResourceWithRelativePath___block_invoke;
  v15[3] = &unk_1E5AEBE50;
  id v16 = v9;
  id v17 = v7;
  id v11 = v7;
  id v12 = v9;
  [(_PASLock *)lock runWithLockAcquired:v15];
}

- (void)invokeWithBundleOverride:(id)a3 block:(id)a4
{
  id v8 = a3;
  dispatch_semaphore_t v6 = (void (**)(void))a4;
  id v7 = [(_PASAsset2 *)self bundlePath];
  [(_PASAsset2 *)self overrideDefaultBundleWithBundleAtPath:v8];
  dispatch_sync((dispatch_queue_t)self->_notificationQueue, &__block_literal_global_382);
  v6[2](v6);
  [(_PASAsset2 *)self overrideDefaultBundleWithBundleAtPath:v7];
  dispatch_sync((dispatch_queue_t)self->_notificationQueue, &__block_literal_global_384);
}

- (NSString)bundlePath
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4120;
  v10 = __Block_byref_object_dispose__4121;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24___PASAsset2_bundlePath__block_invoke;
  v5[3] = &unk_1E5AEBC78;
  void v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (BOOL)overrideDefaultBundleWithBundleAtPath:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52___PASAsset2_overrideDefaultBundleWithBundleAtPath___block_invoke;
  v8[3] = &unk_1E5AEBDD8;
  id v6 = v4;
  id v9 = v6;
  v10 = self;
  id v11 = &v12;
  [(_PASLock *)lock runWithLockAcquired:v8];
  [(_PASAsset2 *)self _issueUpdateNotificationsWithCallback:0];
  LOBYTE(self) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

- (void)_issueUpdateNotificationsWithCallback:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __52___PASAsset2__issueUpdateNotificationsWithCallback___block_invoke;
  v9[3] = &unk_1E5AEBC78;
  v9[4] = &v10;
  [(_PASLock *)lock runWithLockAcquired:v9];
  id v6 = self->_logHandle;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v11[3];
    uint64_t v8 = [(_PASAsset2 *)self _assetDescription];
    *(_DWORD *)buf = 134218242;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_1A32C4000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "MAAsset version %lu for \"%@\" is now installed. Issuing notification.", buf, 0x16u);
  }
  [(_PASNotificationTracker *)self->_updateNotificationTracker issueNotificationAsyncWithContext:self callback:v4];
  _Block_object_dispose(&v10, 8);
}

- (void)_purgeObsoleteInstalledAssetsFromCandidates:(id)a3 guardedData:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = a4;
  if (v7[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __70___PASAsset2__purgeObsoleteInstalledAssetsFromCandidates_guardedData___block_invoke;
    v32[3] = &unk_1E5AEBE00;
    v32[4] = self;
    uint64_t v8 = (unsigned int (**)(void, void))MEMORY[0x1A6245320](v32);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v23 = v6;
    id obj = v6;
    uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = self;
      uint64_t v12 = *(void *)v29;
      v24 = v8;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v15 = (void *)MEMORY[0x1A62450A0]();
          __int16 v16 = [v14 attributes];
          id v17 = [v16 objectForKeyedSubscript:@"_ContentVersion"];

          if (v17
            && (unint64_t)[v17 unsignedIntegerValue] < v7[3]
            && ((unsigned int (**)(void, void *))v8)[2](v8, v14))
          {
            logHandle = v11->_logHandle;
            if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
            {
              v19 = logHandle;
              [(_PASAsset2 *)v11 _assetDescription];
              v20 = v7;
              v22 = v21 = v11;
              *(_DWORD *)buf = 138412546;
              v34 = v22;
              __int16 v35 = 2112;
              v36 = v17;
              _os_log_impl(&dword_1A32C4000, v19, OS_LOG_TYPE_DEFAULT, "Requesting purge of installed MAAsset \"%@\" with obsolete version %@.", buf, 0x16u);

              id v11 = v21;
              uint64_t v7 = v20;
              uint64_t v8 = v24;
            }
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __70___PASAsset2__purgeObsoleteInstalledAssetsFromCandidates_guardedData___block_invoke_379;
            v26[3] = &unk_1E5AEBE28;
            v26[4] = v11;
            id v27 = v17;
            [v14 purge:v26];
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v10);
    }

    id v6 = v23;
  }
}

- (BOOL)updateAssetMetadataUsingQueryResults:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_PASAsset2.m", 602, @"Invalid parameter not satisfying: %@", @"results" object file lineNumber description];
  }
  id v6 = (void *)MEMORY[0x1A62450A0]();
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke;
  v23[3] = &unk_1E5AEBD40;
  v23[4] = self;
  uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:v23];
  uint64_t v8 = [v5 filteredArrayUsingPredicate:v7];

  uint64_t v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_4123];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51___PASAsset2_updateAssetMetadataUsingQueryResults___block_invoke_2;
  v15[3] = &unk_1E5AEBDD8;
  id v11 = v9;
  id v16 = v11;
  id v17 = self;
  uint64_t v18 = &v19;
  [(_PASLock *)lock runWithLockAcquired:v15];
  if (*((unsigned char *)v20 + 24))
  {
    [(_PASAsset2 *)self _issueUpdateNotificationsWithCallback:0];
    BOOL v12 = *((unsigned char *)v20 + 24) != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (void)_updateAssetMetadata
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  logHandle = self->_logHandle;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    id v4 = logHandle;
    id v5 = [(_PASAsset2 *)self _assetDescription];
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = (uint64_t)v5;
    _os_log_impl(&dword_1A32C4000, v4, OS_LOG_TYPE_INFO, "Updating MobileAsset version information for \"%@\"", buf, 0xCu);
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F77FB8]) initWithType:self->_assetTypeIdentifier];
  [v6 returnTypes:2];
  [v6 setDoNotBlockOnNetworkStatus:1];
  requiredMobileAssetProperties = self->_requiredMobileAssetProperties;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __34___PASAsset2__updateAssetMetadata__block_invoke;
  v17[3] = &unk_1E5AEBCF0;
  id v8 = v6;
  id v18 = v8;
  [(NSDictionary *)requiredMobileAssetProperties enumerateKeysAndObjectsUsingBlock:v17];
  uint64_t v9 = [v8 queryMetaDataSync];
  uint64_t v10 = [v8 results];
  id v11 = self->_logHandle;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = v11;
    uint64_t v16 = [v10 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v20 = v9;
    __int16 v21 = 2048;
    uint64_t v22 = v16;
    _os_log_debug_impl(&dword_1A32C4000, v15, OS_LOG_TYPE_DEBUG, "MobileAsset query completed with status code %ld; number of results: %lu",
      buf,
      0x16u);
  }
  if ([v10 count])
  {
    BOOL v12 = [v8 results];
    [(_PASAsset2 *)self updateAssetMetadataUsingQueryResults:v12];
LABEL_7:

    goto LABEL_11;
  }
  if (!v9)
  {
    uint64_t v13 = self->_logHandle;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = v13;
      uint64_t v14 = [(_PASAsset2 *)self _assetDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = (uint64_t)v14;
      _os_log_impl(&dword_1A32C4000, v12, OS_LOG_TYPE_DEFAULT, "Warning: MobileAsset metadata query for %@ completed successfully, but nil or empty results returned.", buf, 0xCu);

      goto LABEL_7;
    }
  }
LABEL_11:
}

- (id)filesystemPathForAssetDataRelativePath:(id)a3
{
  return [(_PASAsset2 *)self filesystemPathForAssetDataRelativePath:a3 assetVersion:0];
}

- (id)filesystemPathForAssetDataRelativePath:(id)a3 assetVersion:(unint64_t *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_PASAsset2.m", 557, @"Invalid parameter not satisfying: %@", @"relativePath" object file lineNumber description];
  }
  v13[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  uint64_t v9 = [(_PASAsset2 *)self filesystemPathsForAssetDataRelativePaths:v8 assetVersion:a4];

  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  return v10;
}

- (id)filesystemPathsForAssetDataRelativePaths:(id)a3
{
  return [(_PASAsset2 *)self filesystemPathsForAssetDataRelativePaths:a3 assetVersion:0];
}

- (id)filesystemPathsForAssetDataRelativePaths:(id)a3 assetVersion:(unint64_t *)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_PASAsset2.m", 498, @"Invalid parameter not satisfying: %@", @"relativePaths" object file lineNumber description];
  }
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  __int16 v21 = __Block_byref_object_copy__4120;
  uint64_t v22 = __Block_byref_object_dispose__4121;
  id v23 = 0;
  lock = self->_lock;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68___PASAsset2_filesystemPathsForAssetDataRelativePaths_assetVersion___block_invoke;
  v14[3] = &unk_1E5AEBCC8;
  uint64_t v16 = &v18;
  v14[4] = self;
  id v9 = v7;
  id v15 = v9;
  id v17 = a4;
  [(_PASLock *)lock runWithLockAcquired:v14];
  if ([v9 count])
  {
    uint64_t v10 = [(id)v19[5] count];
    if (a4)
    {
      if (!v10) {
        *a4 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v11;
}

- (id)_defaultBundleFilesystemPathsForAssetDataRelativePaths:(id)a3 guardedData:(id)a4 assetVersion:(unint64_t *)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (unint64_t *)a4;
  uint64_t v10 = v9;
  if (a5) {
    *a5 = v9[2];
  }
  id v11 = (void *)v9[1];
  if (v11)
  {
    id v27 = v10;
    v32 = [v11 stringByAppendingPathComponent:@"AssetData"];
    id v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v28 = v8;
    id obj = v8;
    uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v31 = *(void *)v36;
      uint64_t v14 = *MEMORY[0x1E4F1C668];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v36 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          id v17 = [v32 stringByAppendingPathComponent:v16];
          logHandle = self->_logHandle;
          if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v40 = v17;
            _os_log_debug_impl(&dword_1A32C4000, logHandle, OS_LOG_TYPE_DEBUG, "Checking for readable default bundle asset file at path: %@", buf, 0xCu);
          }
          uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v17];
          id v33 = 0;
          id v34 = 0;
          [v19 getResourceValue:&v34 forKey:v14 error:&v33];
          id v20 = v34;
          id v21 = v33;
          int v22 = [v20 BOOLValue];
          id v23 = self->_logHandle;
          if (v22)
          {
            if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v40 = v17;
              _os_log_debug_impl(&dword_1A32C4000, v23, OS_LOG_TYPE_DEBUG, "Verified that default bundle asset path was readable: %@", buf, 0xCu);
            }
            [v29 setObject:v17 forKeyedSubscript:v16];
          }
          else if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEFAULT))
          {
            v24 = v23;
            v25 = [(_PASAsset2 *)self _assetDescription];
            *(_DWORD *)buf = 138412802;
            v40 = v25;
            __int16 v41 = 2112;
            v42 = v17;
            __int16 v43 = 2112;
            id v44 = v21;
            _os_log_impl(&dword_1A32C4000, v24, OS_LOG_TYPE_DEFAULT, "Default bundle asset for \"%@\" has missing or unreadable file at path: %@. Error: %@", buf, 0x20u);
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v13);
    }

    uint64_t v10 = v27;
    id v8 = v28;
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

- (id)_maFilesystemPathsForAssetDataRelativePaths:(id)a3 guardedData:(id)a4 isMissingData:(BOOL *)a5 assetVersion:(unint64_t *)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (unint64_t *)a4;
  uint64_t v12 = v11;
  long long v38 = a5;
  *a5 = 0;
  if (a6) {
    *a6 = v11[3];
  }
  uint64_t v13 = (void *)v11[5];
  if (v13)
  {
    uint64_t v14 = [v13 getLocalUrl];
    uint64_t v15 = [v14 path];

    logHandle = self->_logHandle;
    v42 = (void *)v15;
    if (v15)
    {
      long long v36 = v12;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        v32 = logHandle;
        id v33 = [(_PASAsset2 *)self _assetDescription];
        *(_DWORD *)buf = 138412546;
        v50 = v33;
        __int16 v51 = 2112;
        v52 = v42;
        _os_log_debug_impl(&dword_1A32C4000, v32, OS_LOG_TYPE_DEBUG, "Attempting to use installed MAAsset for \"%@\" at path: %@", buf, 0x16u);
      }
      id v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v10, "count"));
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v37 = v10;
      id obj = v10;
      uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v41 = *(void *)v46;
        uint64_t v19 = *MEMORY[0x1E4F1C668];
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v46 != v41) {
              objc_enumerationMutation(obj);
            }
            uint64_t v21 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            int v22 = objc_msgSend(v42, "stringByAppendingPathComponent:", v21, v36);
            id v23 = self->_logHandle;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v22;
              _os_log_debug_impl(&dword_1A32C4000, v23, OS_LOG_TYPE_DEBUG, "Checking for readable MAAsset file at path: %@", buf, 0xCu);
            }
            v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v22];
            id v43 = 0;
            id v44 = 0;
            [v24 getResourceValue:&v44 forKey:v19 error:&v43];
            id v25 = v44;
            id v26 = v43;
            int v27 = [v25 BOOLValue];
            id v28 = self->_logHandle;
            if (v27)
            {
              if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v50 = v22;
                _os_log_debug_impl(&dword_1A32C4000, v28, OS_LOG_TYPE_DEBUG, "Verified that MAAsset path was readable: %@", buf, 0xCu);
              }
              [v39 setObject:v22 forKeyedSubscript:v21];
            }
            else
            {
              if (os_log_type_enabled((os_log_t)self->_logHandle, OS_LOG_TYPE_DEFAULT))
              {
                id v29 = v28;
                long long v30 = [(_PASAsset2 *)self _assetDescription];
                *(_DWORD *)buf = 138412802;
                v50 = v30;
                __int16 v51 = 2112;
                v52 = v22;
                __int16 v53 = 2112;
                id v54 = v26;
                _os_log_impl(&dword_1A32C4000, v29, OS_LOG_TYPE_DEFAULT, "MAAsset for \"%@\" has missing or unreadable file at path: %@. Error: %@", buf, 0x20u);
              }
              *long long v38 = 1;
            }
          }
          uint64_t v18 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
        }
        while (v18);
      }

      uint64_t v12 = v36;
      id v10 = v37;
    }
    else
    {
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        id v34 = logHandle;
        long long v35 = [(_PASAsset2 *)self _assetDescription];
        *(_DWORD *)buf = 138412290;
        v50 = v35;
        _os_log_error_impl(&dword_1A32C4000, v34, OS_LOG_TYPE_ERROR, "MobileAsset reports asset available for \"%@\" but local URL is nil.", buf, 0xCu);
      }
      id v39 = 0;
    }
  }
  else
  {
    id v39 = 0;
  }

  return v39;
}

- (BOOL)deregisterUpdateHandlerAsyncWithToken:(id)a3
{
  return a3
      && -[_PASNotificationTracker deregisterHandlerAsyncWithToken:](self->_updateNotificationTracker, "deregisterHandlerAsyncWithToken:");
}

- (BOOL)deregisterUpdateHandlerWithToken:(id)a3
{
  return a3
      && -[_PASNotificationTracker deregisterHandlerWithToken:](self->_updateNotificationTracker, "deregisterHandlerWithToken:");
}

- (BOOL)_loadDefaultBundleVersionWithGuardedData:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v4[2] = 0x7FFFFFFFFFFFFFFFLL;
  id v5 = (void *)v4[1];
  if (!v5) {
    goto LABEL_23;
  }
  id v6 = [v5 stringByAppendingPathComponent:@"Info.plist"];
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfFile:v6];
  if (!v7)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_FAULT))
    {
      uint64_t v28 = v4[1];
      *(_DWORD *)buf = 138412546;
      long long v47 = @"Info.plist";
      __int16 v48 = 2112;
      uint64_t v49 = v28;
      _os_log_fault_impl(&dword_1A32C4000, logHandle, OS_LOG_TYPE_FAULT, "Unable to load %@ for default bundle at \"%@\".", buf, 0x16u);
    }
    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {

      goto LABEL_28;
    }
    goto LABEL_55;
  }
  id v8 = v7;
  id v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F1CFF8]];
  if (!v9
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || ![(NSString *)self->_assetTypeIdentifier isEqualToString:v9])
  {
    uint64_t v21 = self->_logHandle;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      id v26 = (__CFString *)v4[1];
      assetTypeIdentifier = self->_assetTypeIdentifier;
      *(_DWORD *)buf = 138412802;
      long long v47 = v26;
      __int16 v48 = 2112;
      uint64_t v49 = (uint64_t)assetTypeIdentifier;
      __int16 v50 = 2112;
      unint64_t v51 = (unint64_t)v9;
      _os_log_fault_impl(&dword_1A32C4000, v21, OS_LOG_TYPE_FAULT, "Default bundle at \"%@\" has incorrect bundle identifier (expected %@, actual %@)", buf, 0x20u);
    }
    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {
      int v16 = 1;
      goto LABEL_22;
    }
    goto LABEL_55;
  }
  id v10 = [v8 objectForKeyedSubscript:@"MobileAssetProperties"];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = [v10 objectForKeyedSubscript:@"_ContentVersion"];
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (([v11 intValue] & 0x80000000) == 0)
        {
          uint64_t v12 = [v10 objectForKeyedSubscript:@"_CompatibilityVersion"];
          if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            if ([v12 unsignedIntegerValue] == self->_compatibilityVersion)
            {
              uint64_t v13 = [(id)v4[1] stringByAppendingPathComponent:@"AssetData"];
              unsigned __int8 v45 = 0;
              uint64_t v14 = [MEMORY[0x1E4F28CB8] defaultManager];
              id v44 = (void *)v13;
              LODWORD(v13) = [v14 fileExistsAtPath:v13 isDirectory:&v45];
              int v43 = v45;

              if (v13 && v43)
              {
                v4[2] = [v11 unsignedIntegerValue];
                uint64_t v15 = self->_logHandle;
                int v16 = 0;
                if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v17 = v15;
                  uint64_t v18 = [(_PASAsset2 *)self _assetDescription];
                  unint64_t v20 = v4[1];
                  uint64_t v19 = v4[2];
                  *(_DWORD *)buf = 138412802;
                  long long v47 = v18;
                  __int16 v48 = 2048;
                  uint64_t v49 = v19;
                  __int16 v50 = 2112;
                  unint64_t v51 = v20;
                  _os_log_impl(&dword_1A32C4000, v17, OS_LOG_TYPE_DEFAULT, "Loaded default bundle for \"%@\" with version %tu from path: %@", buf, 0x20u);

                  int v16 = 0;
                }
                goto LABEL_54;
              }
              v40 = self->_logHandle;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
              {
                v42 = (__CFString *)v4[1];
                *(_DWORD *)buf = 138412290;
                long long v47 = v42;
                _os_log_fault_impl(&dword_1A32C4000, v40, OS_LOG_TYPE_FAULT, "Default bundle at \"%@\" is missing the AssetData subdirectory.", buf, 0xCu);
              }
              if (!_PASEvaluateLogFaultAndProbCrashCriteria())
              {
                int v16 = 1;
LABEL_54:

                goto LABEL_43;
              }
LABEL_55:
              abort();
            }
            long long v35 = self->_logHandle;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
            {
              long long v36 = (__CFString *)v4[1];
              id v37 = v35;
              uint64_t v38 = [v12 unsignedIntegerValue];
              unint64_t compatibilityVersion = self->_compatibilityVersion;
              *(_DWORD *)buf = 138412802;
              long long v47 = v36;
              __int16 v48 = 2048;
              uint64_t v49 = v38;
              __int16 v50 = 2048;
              unint64_t v51 = compatibilityVersion;
              _os_log_fault_impl(&dword_1A32C4000, v37, OS_LOG_TYPE_FAULT, "Default bundle at \"%@\" declares unexpected compatibility version %lu (expected %lu)", buf, 0x20u);
            }
          }
          else
          {
            long long v30 = self->_logHandle;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
            {
              uint64_t v41 = (__CFString *)v4[1];
              *(_DWORD *)buf = 138412290;
              long long v47 = v41;
              _os_log_fault_impl(&dword_1A32C4000, v30, OS_LOG_TYPE_FAULT, "Default bundle at \"%@\" has missing or ill-formatted _CompatibilityVersion property.", buf, 0xCu);
            }
          }
          if (!_PASEvaluateLogFaultAndProbCrashCriteria())
          {
            int v16 = 1;
LABEL_43:

            goto LABEL_37;
          }
          goto LABEL_55;
        }
        id v29 = self->_logHandle;
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
LABEL_35:
          if (!_PASEvaluateLogFaultAndProbCrashCriteria())
          {
            int v16 = 1;
LABEL_37:

            goto LABEL_38;
          }
          goto LABEL_55;
        }
        v32 = (__CFString *)v4[1];
        *(_DWORD *)buf = 138412290;
        long long v47 = v32;
        id v33 = "Default bundle at \"%@\" has invalid _ContentVersion property.";
      }
      else
      {
        id v29 = self->_logHandle;
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
          goto LABEL_35;
        }
        id v34 = (__CFString *)v4[1];
        *(_DWORD *)buf = 138412290;
        long long v47 = v34;
        id v33 = "Default bundle at \"%@\" has missing or ill-formatted _ContentVersion property.";
      }
      _os_log_fault_impl(&dword_1A32C4000, v29, OS_LOG_TYPE_FAULT, v33, buf, 0xCu);
      goto LABEL_35;
    }
  }
  id v25 = self->_logHandle;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    uint64_t v31 = (__CFString *)v4[1];
    *(_DWORD *)buf = 138412290;
    long long v47 = v31;
    _os_log_fault_impl(&dword_1A32C4000, v25, OS_LOG_TYPE_FAULT, "Default bundle at \"%@\" has missing or ill-formatted MobileAssetProperties property.", buf, 0xCu);
  }
  if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
    goto LABEL_55;
  }
  int v16 = 1;
LABEL_38:

LABEL_22:
  if (v16)
  {
LABEL_28:
    BOOL v22 = 0;
    goto LABEL_29;
  }
LABEL_23:
  BOOL v22 = 1;
LABEL_29:

  return v22;
}

- (unint64_t)bestAssetVersionObserved
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38___PASAsset2_bestAssetVersionObserved__block_invoke;
  v5[3] = &unk_1E5AEBC78;
  void v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_assetDescription
{
  if (self->_requiredMobileAssetProperties)
  {
    unint64_t v3 = (void *)MEMORY[0x1A62450A0]();
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSDictionary count](self->_requiredMobileAssetProperties, "count"));
    requiredMobileAssetProperties = self->_requiredMobileAssetProperties;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __31___PASAsset2__assetDescription__block_invoke;
    v10[3] = &unk_1E5AEBCA0;
    id v11 = v4;
    id v6 = v4;
    [(NSDictionary *)requiredMobileAssetProperties enumerateKeysAndObjectsUsingBlock:v10];
    id v7 = objc_msgSend(v6, "_pas_componentsJoinedByString:", @"-");
    uint64_t v8 = [NSString stringWithFormat:@"%@[%@]", self->_assetTypeIdentifier, v7];
  }
  else
  {
    uint64_t v8 = self->_assetTypeIdentifier;
  }

  return v8;
}

- (NSString)assetType
{
  if ([(NSString *)self->_assetTypeIdentifier isEqualToString:@"com.apple.MobileAsset.ProactiveSupport.BrokenAssetTypeDescriptor"])
  {
    assetTypeIdentifier = 0;
  }
  else
  {
    assetTypeIdentifier = self->_assetTypeIdentifier;
  }

  return assetTypeIdentifier;
}

- (unint64_t)assetVersion
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26___PASAsset2_assetVersion__block_invoke;
  v5[3] = &unk_1E5AEBC78;
  void v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)downloadMetadataWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = [(_PASAsset2 *)self assetType];
  uint64_t v6 = v5;
  if (!v5)
  {
    logHandle = self->_logHandle;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      __int16 v9 = 0;
      _os_log_error_impl(&dword_1A32C4000, logHandle, OS_LOG_TYPE_ERROR, "Unable to download catalog because asset type descriptor is unknown.", (uint8_t *)&v9, 2u);
      if (!v4) {
        goto LABEL_6;
      }
    }
    else if (!v4)
    {
      goto LABEL_6;
    }
    v4[2](v4, 0);
    goto LABEL_6;
  }
  id v7 = (void *)MEMORY[0x1E4F77FB0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45___PASAsset2_downloadMetadataWithCompletion___block_invoke;
  v10[3] = &unk_1E5AEBC50;
  void v10[4] = self;
  id v11 = v5;
  uint64_t v12 = v4;
  [v7 startCatalogDownload:v11 then:v10];

LABEL_6:
}

- (void)dealloc
{
  int metadataNotificationToken = self->_metadataNotificationToken;
  if ((metadataNotificationToken & 0x80000000) == 0) {
    notify_cancel(metadataNotificationToken);
  }
  int installNotificationToken = self->_installNotificationToken;
  if ((installNotificationToken & 0x80000000) == 0) {
    notify_cancel(installNotificationToken);
  }
  v5.receiver = self;
  v5.super_class = (Class)_PASAsset2;
  [(_PASAsset2 *)&v5 dealloc];
}

- (id)_initWithAssetTypeIdentifier:(id)a3 defaultBundlePath:(id)a4 compatibilityVersion:(unint64_t)a5 matchingKeysAndValues:(id)a6 notificationQueue:(id)a7 logHandle:(id)a8 enableAssetUpdates:(BOOL)a9 purgeObsoleteInstalledAssets:(BOOL)a10
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v59 = a4;
  id v60 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v17)
  {
    id v50 = v19;
    id v51 = v18;
    uint64_t v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2, self, @"_PASAsset2.m", 185, @"Invalid parameter not satisfying: %@", @"assetTypeIdentifier" object file lineNumber description];

    id v18 = v51;
    id v19 = v50;
  }
  v57 = v18;
  if (!v18)
  {
    id v53 = v19;
    id v54 = [MEMORY[0x1E4F28B00] currentHandler];
    [v54 handleFailureInMethod:a2, self, @"_PASAsset2.m", 186, @"Invalid parameter not satisfying: %@", @"notificationQueue" object file lineNumber description];

    id v19 = v53;
  }
  v58 = v19;
  if (!v19)
  {
    v55 = [MEMORY[0x1E4F28B00] currentHandler];
    [v55 handleFailureInMethod:a2, self, @"_PASAsset2.m", 187, @"Invalid parameter not satisfying: %@", @"logHandle" object file lineNumber description];
  }
  v68.receiver = self;
  v68.super_class = (Class)_PASAsset2;
  unint64_t v20 = [(_PASAsset2 *)&v68 init];
  if (v20)
  {
    uint64_t v21 = objc_opt_new();
    uint64_t v22 = [v59 copy];
    id v23 = *(void **)(v21 + 8);
    *(void *)(v21 + 8) = v22;

    *(unsigned char *)(v21 + 48) = a10;
    objc_storeStrong((id *)&v20->_defaultBundlePathBackup, *(id *)(v21 + 8));
    uint64_t v24 = [v17 copy];
    assetTypeIdentifier = v20->_assetTypeIdentifier;
    v20->_assetTypeIdentifier = (NSString *)v24;

    v20->_unint64_t compatibilityVersion = a5;
    if (v60)
    {
      uint64_t v26 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v60 copyItems:1];
      requiredMobileAssetProperties = v20->_requiredMobileAssetProperties;
      v20->_requiredMobileAssetProperties = (NSDictionary *)v26;
    }
    else
    {
      requiredMobileAssetProperties = v20->_requiredMobileAssetProperties;
      v20->_requiredMobileAssetProperties = 0;
    }

    p_notificationQueue = (NSObject **)&v20->_notificationQueue;
    objc_storeStrong((id *)&v20->_notificationQueue, a7);
    p_logHandle = (os_log_t *)&v20->_logHandle;
    objc_storeStrong((id *)&v20->_logHandle, a8);
    uint64_t v30 = objc_opt_new();
    updateNotificationTracker = v20->_updateNotificationTracker;
    v20->_updateNotificationTracker = (_PASNotificationTracker *)v30;

    v32 = [[_PASLock alloc] initWithGuardedData:v21];
    lock = v20->_lock;
    v20->_lock = v32;

    id v34 = v20->_lock;
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __180___PASAsset2__initWithAssetTypeIdentifier_defaultBundlePath_compatibilityVersion_matchingKeysAndValues_notificationQueue_logHandle_enableAssetUpdates_purgeObsoleteInstalledAssets___block_invoke;
    v66[3] = &unk_1E5AEBC00;
    long long v35 = v20;
    v67 = v35;
    [(_PASLock *)v34 runWithLockAcquired:v66];
    if (a9)
    {
      long long v36 = [(NSString *)v20->_assetTypeIdentifier stringByAppendingString:@".ma.new-asset-installed"];
      objc_initWeak(&location, v35);
      id v56 = v36;
      id v37 = (const char *)[v56 UTF8String];
      uint64_t v38 = *p_notificationQueue;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __180___PASAsset2__initWithAssetTypeIdentifier_defaultBundlePath_compatibilityVersion_matchingKeysAndValues_notificationQueue_logHandle_enableAssetUpdates_purgeObsoleteInstalledAssets___block_invoke_2;
      handler[3] = &unk_1E5AEBC28;
      objc_copyWeak(&v64, &location);
      uint32_t v39 = notify_register_dispatch(v37, v35 + 12, v38, handler);
      if (v39)
      {
        v35[12] = -1;
        v40 = *p_logHandle;
        if (os_log_type_enabled(*p_logHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v70 = v39;
          _os_log_error_impl(&dword_1A32C4000, v40, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", buf, 0xCu);
        }
      }
      id v41 = [(NSString *)v20->_assetTypeIdentifier stringByAppendingString:@".ma.cached-metadata-updated"];
      v42 = (const char *)[v41 UTF8String];
      int v43 = *p_notificationQueue;
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __180___PASAsset2__initWithAssetTypeIdentifier_defaultBundlePath_compatibilityVersion_matchingKeysAndValues_notificationQueue_logHandle_enableAssetUpdates_purgeObsoleteInstalledAssets___block_invoke_339;
      v61[3] = &unk_1E5AEBC28;
      objc_copyWeak(&v62, &location);
      uint32_t v44 = notify_register_dispatch(v42, v35 + 13, v43, v61);
      if (v44)
      {
        v35[13] = -1;
        unsigned __int8 v45 = *p_logHandle;
        if (os_log_type_enabled(*p_logHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v70 = v44;
          _os_log_error_impl(&dword_1A32C4000, v45, OS_LOG_TYPE_ERROR, "notify_register_dispatch error: %lu", buf, 0xCu);
        }
      }
      [v35 _updateAssetMetadata];
      objc_destroyWeak(&v62);

      objc_destroyWeak(&v64);
      objc_destroyWeak(&location);
    }
    else
    {
      os_log_t v46 = *p_logHandle;
      if (os_log_type_enabled(*p_logHandle, OS_LOG_TYPE_DEFAULT))
      {
        long long v47 = v46;
        __int16 v48 = [v35 _assetDescription];
        *(_DWORD *)buf = 138412290;
        unint64_t v70 = (unint64_t)v48;
        _os_log_impl(&dword_1A32C4000, v47, OS_LOG_TYPE_DEFAULT, "Via unit testing override, MobileAsset asset loading has been disabled: %@", buf, 0xCu);
      }
    }
  }
  return v20;
}

- (_PASAsset2)initWithAssetTypeDescriptorPath:(id)a3 defaultBundlePath:(id)a4 matchingKeysAndValues:(id)a5 notificationQueue:(id)a6 logHandle:(id)a7 enableAssetUpdates:(BOOL)a8 purgeObsoleteInstalledAssets:(BOOL)a9
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  int v16 = (__CFString *)a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  if (v16)
  {
    if (v19) {
      goto LABEL_3;
    }
  }
  else
  {
    uint32_t v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"_PASAsset2.m", 107, @"Invalid parameter not satisfying: %@", @"assetTypeDescriptorPath" object file lineNumber description];

    if (v19) {
      goto LABEL_3;
    }
  }
  v40 = [MEMORY[0x1E4F28B00] currentHandler];
  [v40 handleFailureInMethod:a2, self, @"_PASAsset2.m", 108, @"Invalid parameter not satisfying: %@", @"notificationQueue" object file lineNumber description];

LABEL_3:
  uint64_t v21 = (void *)MEMORY[0x1E4F14500];
  if (v20) {
    uint64_t v21 = v20;
  }
  id v22 = v21;

  id v55 = 0;
  id v23 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v16 options:0 error:&v55];
  uint64_t v24 = (__CFString *)v55;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __162___PASAsset2_initWithAssetTypeDescriptorPath_defaultBundlePath_matchingKeysAndValues_notificationQueue_logHandle_enableAssetUpdates_purgeObsoleteInstalledAssets___block_invoke;
  v48[3] = &unk_1E5AEBBD8;
  id v25 = self;
  uint64_t v49 = v25;
  id v45 = v17;
  id v50 = v45;
  id v26 = v18;
  id v51 = v26;
  id v27 = v19;
  id v52 = v27;
  uint64_t v28 = v22;
  id v53 = v28;
  BOOL v54 = a9;
  id v29 = (void (**)(void))MEMORY[0x1A6245320](v48);
  os_log_t v46 = v25;
  if (!v23)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      v57 = v16;
      __int16 v58 = 2112;
      id v59 = v24;
      _os_log_fault_impl(&dword_1A32C4000, v28, OS_LOG_TYPE_FAULT, "Could not read asset type descriptor \"%@\": %@", buf, 0x16u);
    }
    if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    {
      v29[2](v29);
      id v37 = (_PASAsset2 *)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = v24;
      goto LABEL_28;
    }
    goto LABEL_40;
  }
  BOOL v44 = a8;
  id v47 = 0;
  uint64_t v30 = [MEMORY[0x1E4F28F98] propertyListWithData:v23 options:0 format:0 error:&v47];
  uint64_t v31 = (__CFString *)v47;

  if (!v31)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = [v30 objectForKeyedSubscript:@"Asset Type"];
      if (v32)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v32 length])
          {
            uint64_t v33 = [v30 objectForKeyedSubscript:@"Supported Compatibility Version"];
            int v43 = (void *)v33;
            if (v33
              && (id v34 = (void *)v33, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
              && ([v34 integerValue] & 0x8000000000000000) == 0)
            {
              v42 = v30;
              long long v35 = [v30 objectForKeyedSubscript:@"Uniquely Identifying Keys"];
              uint64_t v36 = [v35 count];

              if ([v26 count] && !v36 && os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v57 = v16;
                _os_log_impl(&dword_1A32C4000, v28, OS_LOG_TYPE_DEFAULT, "Warning: asset type descriptor %@ has no Uniquely Identifying Keys, but usage suggests that it should.", buf, 0xCu);
              }
              BYTE1(v41) = a9;
              LOBYTE(v41) = v44;
              id v37 = (_PASAsset2 *)-[_PASAsset2 _initWithAssetTypeIdentifier:defaultBundlePath:compatibilityVersion:matchingKeysAndValues:notificationQueue:logHandle:enableAssetUpdates:purgeObsoleteInstalledAssets:](v46, "_initWithAssetTypeIdentifier:defaultBundlePath:compatibilityVersion:matchingKeysAndValues:notificationQueue:logHandle:enableAssetUpdates:purgeObsoleteInstalledAssets:", v32, v45, [v43 unsignedIntegerValue], v26, v27, v28, v41);
              os_log_t v46 = v37;
              uint64_t v30 = v42;
            }
            else
            {
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v57 = @"Supported Compatibility Version";
                __int16 v58 = 2112;
                id v59 = v16;
                _os_log_error_impl(&dword_1A32C4000, v28, OS_LOG_TYPE_ERROR, "Missing or ill-formatted property \"%@\" in asset type descriptor %@", buf, 0x16u);
              }
              v29[2](v29);
              id v37 = (_PASAsset2 *)objc_claimAutoreleasedReturnValue();
            }

            goto LABEL_33;
          }
        }
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        v57 = @"Asset Type";
        __int16 v58 = 2112;
        id v59 = v16;
        _os_log_fault_impl(&dword_1A32C4000, v28, OS_LOG_TYPE_FAULT, "Missing or ill-formatted property \"%@\" in asset type descriptor %@", buf, 0x16u);
      }
      if (!_PASEvaluateLogFaultAndProbCrashCriteria())
      {
        v29[2](v29);
        id v37 = (_PASAsset2 *)objc_claimAutoreleasedReturnValue();
LABEL_33:

        goto LABEL_23;
      }
LABEL_40:
      abort();
    }
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412546;
    v57 = v16;
    __int16 v58 = 2112;
    id v59 = v31;
    _os_log_fault_impl(&dword_1A32C4000, v28, OS_LOG_TYPE_FAULT, "Could not decode asset type descriptor at %@: %@", buf, 0x16u);
  }
  if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
    goto LABEL_40;
  }
  v29[2](v29);
  id v37 = (_PASAsset2 *)objc_claimAutoreleasedReturnValue();
LABEL_23:

LABEL_28:
  return v37;
}

- (_PASAsset2)initWithAssetTypeDescriptorPath:(id)a3 defaultBundlePath:(id)a4 matchingKeysAndValues:(id)a5 notificationQueue:(id)a6 logHandle:(id)a7 enableAssetUpdates:(BOOL)a8
{
  LOBYTE(v9) = 0;
  return [(_PASAsset2 *)self initWithAssetTypeDescriptorPath:a3 defaultBundlePath:a4 matchingKeysAndValues:a5 notificationQueue:a6 logHandle:a7 enableAssetUpdates:a8 purgeObsoleteInstalledAssets:v9];
}

- (_PASAsset2)initWithAssetTypeDescriptorPath:(id)a3 defaultBundlePath:(id)a4 matchingKeysAndValues:(id)a5 notificationQueue:(id)a6 logHandle:(id)a7
{
  return [(_PASAsset2 *)self initWithAssetTypeDescriptorPath:a3 defaultBundlePath:a4 matchingKeysAndValues:a5 notificationQueue:a6 logHandle:a7 enableAssetUpdates:1];
}

@end