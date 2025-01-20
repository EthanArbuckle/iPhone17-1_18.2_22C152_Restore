@interface XBApplicationController
- (XBApplicationController)initWithMainDisplayConfiguration:(id)a3 applicationProvider:(id)a4 launchRequestProvider:(id)a5;
- (XBApplicationController)initWithMainDisplayConfiguration:(id)a3 applicationProvider:(id)a4 launchRequestProvider:(id)a5 configureVolumeMaintenance:(BOOL)a6;
- (XBApplicationProviding)applicationProvider;
- (id)_launchRequestsForApplication:(id)a3 withCompatibilityInfo:(id)a4;
- (id)findRecentlyUsedOfApplications:(id)a3;
- (void)_captureOrUpdateLaunchImagesForApplications:(id)a3 firstImageIsReady:(id)a4 completionWithCaptureInfo:(id)a5;
- (void)_captureOrUpdateLaunchImagesForApplications:(id)a3 firstImageIsReady:(id)a4 createCaptureInfo:(BOOL)a5 completionWithCaptureInfo:(id)a6;
- (void)_deleteLegacyCachesSnapshotPathsIfNeeded;
- (void)_removeAllGeneratedLaunchImagesAndSnapshots;
- (void)_removeLaunchImagesMatchingPredicate:(id)a3 forApplications:(id)a4 forgettingApps:(BOOL)a5;
- (void)_updateStatusBarOrientation;
- (void)captureOrUpdateLaunchImagesForApplications:(id)a3 firstImageIsReady:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)deleteAllSnapshotsIfScreenSizeChanged;
- (void)performPostMigrationLaunchImageGeneration;
- (void)removeCachedLaunchImagesForApplications:(id)a3 forgettingApps:(BOOL)a4;
@end

@implementation XBApplicationController

- (XBApplicationController)initWithMainDisplayConfiguration:(id)a3 applicationProvider:(id)a4 launchRequestProvider:(id)a5
{
  return [(XBApplicationController *)self initWithMainDisplayConfiguration:a3 applicationProvider:a4 launchRequestProvider:a5 configureVolumeMaintenance:1];
}

- (XBApplicationController)initWithMainDisplayConfiguration:(id)a3 applicationProvider:(id)a4 launchRequestProvider:(id)a5 configureVolumeMaintenance:(BOOL)a6
{
  BOOL v6 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v20.receiver = self;
  v20.super_class = (Class)XBApplicationController;
  v15 = [(XBApplicationController *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mainDisplayConfiguration, a3);
    if (![(FBSDisplayConfiguration *)v16->_mainDisplayConfiguration isMainDisplay]
      || [(FBSDisplayConfiguration *)v16->_mainDisplayConfiguration isExternal])
    {
      v19 = [MEMORY[0x263F08690] currentHandler];
      [v19 handleFailureInMethod:a2 object:v16 file:@"XBApplicationController.m" lineNumber:120 description:@"provided an invalid mainDisplay configuration"];
    }
    objc_storeStrong((id *)&v16->_applicationProvider, a4);
    objc_storeStrong((id *)&v16->_launchRequestProvider, a5);
    v16->_statusBarOrientation = 0;
    v17 = [MEMORY[0x263F08A00] defaultCenter];
    [v17 addObserver:v16 selector:sel__updateStatusBarOrientation name:*MEMORY[0x263F1D048] object:0];

    [(XBApplicationController *)v16 _updateStatusBarOrientation];
    [(XBApplicationController *)v16 _deleteLegacyCachesSnapshotPathsIfNeeded];
    if (v6) {
      +[XBVolumeMaintainer configure:v13];
    }
  }

  return v16;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)XBApplicationController;
  [(XBApplicationController *)&v4 dealloc];
}

- (void)deleteAllSnapshotsIfScreenSizeChanged
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  objc_super v4 = [v3 stringForKey:@"XBRecentScreenSize"];
  [(FBSDisplayConfiguration *)self->_mainDisplayConfiguration bounds];
  v14.width = v5;
  v14.height = v6;
  v7 = NSStringFromCGSize(v14);
  if (([v4 isEqualToString:v7] & 1) == 0)
  {
    if (v4)
    {
      v8 = XBLogFileManifest();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543618;
        v10 = v4;
        __int16 v11 = 2114;
        id v12 = v7;
        _os_log_impl(&dword_2232AB000, v8, OS_LOG_TYPE_DEFAULT, "Screen size changed from %{public}@ to %{public}@, purging all generated launch image and snapshots.", (uint8_t *)&v9, 0x16u);
      }

      [(XBApplicationController *)self _removeAllGeneratedLaunchImagesAndSnapshots];
    }
    [v3 setObject:v7 forKey:@"XBRecentScreenSize"];
    [v3 synchronize];
  }
}

- (void)performPostMigrationLaunchImageGeneration
{
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  if ([v3 BOOLForKey:@"XBCaptureLaunchImagesPostMigration"])
  {
    [v3 setObject:MEMORY[0x263EFFA80] forKey:@"XBCaptureLaunchImagesPostMigration"];
    objc_super v4 = XBLogFileManifest();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2232AB000, v4, OS_LOG_TYPE_DEFAULT, "performPostMigrationLaunchImageGeneration", buf, 2u);
    }

    SerialWithQoS = (void *)BSDispatchQueueCreateSerialWithQoS();
    CGFloat v6 = [(XBApplicationProviding *)self->_applicationProvider splashBoardSystemApplications];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__XBApplicationController_performPostMigrationLaunchImageGeneration__block_invoke;
    block[3] = &unk_2646A57C0;
    id v10 = v6;
    id v11 = SerialWithQoS;
    id v12 = self;
    v7 = SerialWithQoS;
    id v8 = v6;
    dispatch_async(v7, block);
  }
}

void __68__XBApplicationController_performPostMigrationLaunchImageGeneration__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v2 = +[XBApplicationSnapshotPredicate predicate];
  [v2 setContentTypeMask:6];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v16 = a1;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v9 = [v8 tags];
        char v10 = [v9 containsObject:@"hidden"];

        if ((v10 & 1) == 0)
        {
          id v11 = [[XBApplicationSnapshotManifest alloc] initWithApplicationInfo:v8];
          id v12 = [(XBApplicationSnapshotManifest *)v11 defaultGroupIdentifier];
          uint64_t v13 = [(XBApplicationSnapshotManifest *)v11 snapshotsForGroupID:v12 matchingPredicate:v2];

          if (![v13 count])
          {
            v15 = *(NSObject **)(v16 + 40);
            uint64_t v14 = *(void *)(v16 + 48);
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __68__XBApplicationController_performPostMigrationLaunchImageGeneration__block_invoke_2;
            block[3] = &unk_2646A57C0;
            void block[4] = v8;
            block[5] = v14;
            v18 = v11;
            dispatch_async(v15, block);
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
}

void __68__XBApplicationController_performPostMigrationLaunchImageGeneration__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = XBLogFileManifest();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) bundleIdentifier];
    *(_DWORD *)buf = 138543362;
    char v10 = v3;
    _os_log_impl(&dword_2232AB000, v2, OS_LOG_TYPE_DEFAULT, "Post-migration launch image capture for %{public}@", buf, 0xCu);
  }
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v8 count:1];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__XBApplicationController_performPostMigrationLaunchImageGeneration__block_invoke_82;
  v6[3] = &unk_2646A5938;
  id v7 = *(id *)(a1 + 48);
  [v4 captureOrUpdateLaunchImagesForApplications:v5 firstImageIsReady:0 completion:v6];
}

uint64_t __68__XBApplicationController_performPostMigrationLaunchImageGeneration__block_invoke_82(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSnapshotsAPFSPurgability:0];
}

- (void)_deleteLegacyCachesSnapshotPathsIfNeeded
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  BOOL v3 = XBLegacyCachesSnapshotPathForNonSandboxedSystemApplicationsExists();
  uint64_t v4 = XBLogFileManifest();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2232AB000, v4, OS_LOG_TYPE_DEFAULT, "Start purging legacy snapshots caches...", buf, 2u);
    }

    uint64_t v4 = [(XBApplicationProviding *)self->_applicationProvider allInstalledApplications];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v21;
      *(void *)&long long v7 = 138543362;
      long long v19 = v7;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v4);
          }
          uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v12 = objc_msgSend(v11, "dataContainerURL", v19);
          if (v12)
          {
            if (!XBDeleteLegacyCachesSnapshotPathForSandboxedApplicationIfNeeded(v11)) {
              goto LABEL_18;
            }
            uint64_t v13 = XBLogFileManifest();
            if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_17;
            }
            uint64_t v14 = [v11 bundleIdentifier];
            *(_DWORD *)buf = v19;
            v25 = v14;
            v15 = v13;
            uint64_t v16 = "Purging legacy caches of sandboxed app snapshots for: %{public}@";
            goto LABEL_16;
          }
          if (!XBDeleteLegacyCachesSnapshotPathForNonSandboxedApplicationIfNeeded(v11)) {
            goto LABEL_18;
          }
          uint64_t v13 = XBLogFileManifest();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v14 = [v11 bundleIdentifier];
            *(_DWORD *)buf = v19;
            v25 = v14;
            v15 = v13;
            uint64_t v16 = "Purging legacy caches of snapshots for non-sandboxed system app: %{public}@";
LABEL_16:
            _os_log_impl(&dword_2232AB000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
          }
LABEL_17:

          v17 = [[XBApplicationSnapshotManifest alloc] initWithApplicationInfo:v11];
          [(XBApplicationSnapshotManifest *)v17 deleteAllSnapshots];

LABEL_18:
        }
        uint64_t v8 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v8);
    }
    XBDeleteLegacyCachesSnapshotPathForNonSandboxedApplicationsIfNeeded();
    v18 = XBLogFileManifest();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2232AB000, v18, OS_LOG_TYPE_DEFAULT, "Finished purging", buf, 2u);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2232AB000, v4, OS_LOG_TYPE_DEFAULT, "No legacy snapshots caches to purge", buf, 2u);
  }
}

- (id)findRecentlyUsedOfApplications:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_2];
  BOOL v5 = [v3 objectsAtIndexes:v4];

  return v5;
}

uint64_t __58__XBApplicationController_findRecentlyUsedOfApplications___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 tags];
  char v4 = [v3 containsObject:@"hidden"];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = [[XBApplicationSnapshotManifest alloc] initWithApplicationInfo:v2];
    uint64_t v5 = [(XBApplicationSnapshotManifest *)v6 snapshotsConsideredUnpurgableByAPFS];
  }
  return v5;
}

- (void)removeCachedLaunchImagesForApplications:(id)a3 forgettingApps:(BOOL)a4
{
  id v6 = a3;
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __82__XBApplicationController_removeCachedLaunchImagesForApplications_forgettingApps___block_invoke;
  activity_block[3] = &unk_2646A5980;
  activity_void block[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  _os_activity_initiate(&dword_2232AB000, "XBInvalidate", OS_ACTIVITY_FLAG_IF_NONE_PRESENT, activity_block);
}

void __82__XBApplicationController_removeCachedLaunchImagesForApplications_forgettingApps___block_invoke(uint64_t a1)
{
  id v2 = +[XBApplicationSnapshotPredicate predicate];
  [v2 setContentTypeMask:2];
  [*(id *)(a1 + 32) _removeLaunchImagesMatchingPredicate:v2 forApplications:*(void *)(a1 + 40) forgettingApps:*(unsigned __int8 *)(a1 + 48)];
}

- (void)captureOrUpdateLaunchImagesForApplications:(id)a3 firstImageIsReady:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __99__XBApplicationController_captureOrUpdateLaunchImagesForApplications_firstImageIsReady_completion___block_invoke;
  v10[3] = &unk_2646A59A8;
  id v11 = v8;
  id v9 = v8;
  [(XBApplicationController *)self _captureOrUpdateLaunchImagesForApplications:a3 firstImageIsReady:a4 createCaptureInfo:0 completionWithCaptureInfo:v10];
}

uint64_t __99__XBApplicationController_captureOrUpdateLaunchImagesForApplications_firstImageIsReady_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_captureOrUpdateLaunchImagesForApplications:(id)a3 firstImageIsReady:(id)a4 completionWithCaptureInfo:(id)a5
{
}

- (void)_captureOrUpdateLaunchImagesForApplications:(id)a3 firstImageIsReady:(id)a4 createCaptureInfo:(BOOL)a5 completionWithCaptureInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke;
  activity_block[3] = &unk_2646A5A20;
  BOOL v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v17 = v10;
  v18 = self;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  _os_activity_initiate(&dword_2232AB000, "XBCapture", OS_ACTIVITY_FLAG_IF_NONE_PRESENT, activity_block);
}

void __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy_;
  v57 = __Block_byref_object_dispose_;
  id v58 = 0;
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    id v3 = (void *)v54[5];
    v54[5] = v2;
  }
  if (*(void *)(a1 + 48))
  {
    char v4 = objc_msgSend(MEMORY[0x263F3F640], "sentinelWithQueue:signalCount:completion:", 0, 1);
  }
  else
  {
    char v4 = 0;
  }
  uint64_t v5 = (void *)MEMORY[0x263F3F640];
  uint64_t v6 = [*(id *)(a1 + 32) count] + 1;
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke_88;
  v49[3] = &unk_2646A59D0;
  id v32 = v4;
  id v50 = v32;
  id v51 = *(id *)(a1 + 56);
  v52 = &v53;
  uint64_t v7 = [v5 sentinelWithQueue:0 signalCount:v6 completion:v49];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v34 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v8 = [obj countByEnumeratingWithState:&v45 objects:v63 count:16];
  v37 = (void *)v7;
  if (v8)
  {
    uint64_t v36 = *(void *)v46;
    *(void *)&long long v9 = 138543362;
    long long v31 = v9;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v46 != v36) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v45 + 1) + 8 * v10);
        id v12 = objc_msgSend(v11, "bundleIdentifier", v31);
        id v13 = [v11 bundleURL];
        id v14 = [v13 path];

        char v44 = 0;
        if (v14)
        {
          id v15 = [MEMORY[0x263F08850] defaultManager];
          if ([v15 fileExistsAtPath:v14 isDirectory:&v44])
          {
            BOOL v16 = v44 == 0;

            if (!v16)
            {
              id v17 = +[XBApplicationDataStore sharedInstance];
              [v17 beginAccessBlockForBundleIdentifier:v12];
              [v17 _clearCompatibilityInfoForBundleIdentifier:v12];
              v18 = +[XBApplicationLaunchCompatibilityInfo compatibilityInfoForAppInfo:v11];
              if ([v18 allowsSavingLaunchImages])
              {
                id v19 = [[XBApplicationSnapshotManifest alloc] initWithApplicationInfo:v11];
                id v20 = [(XBApplicationSnapshotManifest *)v19 defaultGroupIdentifier];
                [v18 setDefaultGroupIdentifier:v20];

                BOOL v21 = *(void **)(v34 + 40);
                long long v22 = (void *)v21[3];
                long long v23 = [v21 _launchRequestsForApplication:v11 withCompatibilityInfo:v18];
                uint64_t v24 = [v22 launchRequestsForApplication:v11 withCompatibilityInfo:v18 defaultLaunchRequests:v23];

                if (v19 && [v24 count])
                {
                  v25 = +[XBLaunchImageProvider sharedInstance];
                  unsigned int v33 = *(unsigned __int8 *)(v34 + 64);
                  v42[0] = MEMORY[0x263EF8330];
                  v42[1] = 3221225472;
                  v42[2] = __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke_2;
                  v42[3] = &unk_2646A5938;
                  id v43 = v32;
                  v38[0] = MEMORY[0x263EF8330];
                  v38[1] = 3221225472;
                  v38[2] = __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke_3;
                  v38[3] = &unk_2646A59F8;
                  v41 = &v53;
                  v38[4] = v11;
                  v26 = v19;
                  v39 = v26;
                  id v40 = v37;
                  [v25 captureLaunchImageForManifest:v26 withCompatibilityInfo:v18 launchRequests:v24 createCaptureInfo:v33 firstImageIsReady:v42 withCompletionHandler:v38];
                }
                else
                {
                  v29 = XBLogCapture();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = v31;
                    v60 = v12;
                    _os_log_error_impl(&dword_2232AB000, v29, OS_LOG_TYPE_ERROR, "Failed to capture launch image snapshot due to missing manifest or launchRequests for %{public}@", buf, 0xCu);
                  }

                  [v37 signal];
                }
              }
              else
              {
                v28 = XBLogCapture();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v31;
                  v60 = v12;
                  _os_log_error_impl(&dword_2232AB000, v28, OS_LOG_TYPE_ERROR, "Unable to generate launch image for %{public}@ because the app has no valid launch interfaces.", buf, 0xCu);
                }

                [v37 signal];
              }
              [v17 endAccessBlockForBundleIdentifier:v12];

              goto LABEL_22;
            }
          }
          else
          {
          }
        }
        uint64_t v27 = XBLogCapture();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v60 = v12;
          __int16 v61 = 2114;
          v62 = v14;
          _os_log_error_impl(&dword_2232AB000, v27, OS_LOG_TYPE_ERROR, "Unable to generate launch image for %{public}@ because the provided bundle path does not exist: %{public}@", buf, 0x16u);
        }

        [v37 signal];
LABEL_22:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v30 = [obj countByEnumeratingWithState:&v45 objects:v63 count:16];
      uint64_t v8 = v30;
    }
    while (v30);
  }

  [v37 signal];
  _Block_object_dispose(&v53, 8);
}

uint64_t __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke_88(uint64_t a1)
{
  [*(id *)(a1 + 32) signal];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

void __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  char v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 bundleIdentifier];
  [v3 setObject:v5 forKeyedSubscript:v6];

  uint64_t v7 = [*(id *)(a1 + 40) manifestImpl];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke_4;
  v8[3] = &unk_2646A5938;
  id v9 = *(id *)(a1 + 48);
  [v7 _synchronizeDataStoreWithCompletion:v8];
}

uint64_t __133__XBApplicationController__captureOrUpdateLaunchImagesForApplications_firstImageIsReady_createCaptureInfo_completionWithCaptureInfo___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

- (id)_launchRequestsForApplication:(id)a3 withCompatibilityInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x263F1CB50] sharedInstance];
  uint64_t v10 = [v9 currentStyle];

  uint64_t v37 = objc_msgSend(v7, "xb_userInterfaceStyleForRequestedUserInterfaceStyle:", v10);
  int64_t statusBarOrientation = self->_statusBarOrientation;
  uint64_t v11 = [v7 bundleIdentifier];
  id v12 = [MEMORY[0x263EFF980] array];
  id v13 = self->_mainDisplayConfiguration;
  if (!v13)
  {
    unsigned int v33 = [MEMORY[0x263F08690] currentHandler];
    [v33 handleFailureInMethod:a2 object:self file:@"XBApplicationController.m" lineNumber:377 description:@"no displayConfiguration found"];
  }
  [(FBSDisplayConfiguration *)v13 bounds];
  double v15 = v14;
  double v17 = v16;
  uint64_t v34 = (void *)v11;
  v35 = v8;
  if ([(FBSDisplayConfiguration *)v13 isMainDisplay])
  {
    v39 = [v8 defaultGroupIdentifier];
  }
  else
  {
    v39 = 0;
  }
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  do
  {
    uint64_t v20 = _launchRequestsForApplication_withCompatibilityInfo__orientations[v18];
    uint64_t v21 = XBInterfaceOrientationMaskForInterfaceOrientationPair(v20);
    if ([v7 supportsInterfaceOrientation:v20]) {
      BOOL v22 = (v21 & v19) == 0;
    }
    else {
      BOOL v22 = 0;
    }
    if (v22)
    {
      uint64_t v36 = v19;
      long long v23 = v13;
      int v24 = [v7 statusBarHiddenForInterfaceOrientation:v20 onDisplay:v13];
      uint64_t v25 = 0;
      uint64_t v26 = v24 ^ 1u;
      char v27 = 1;
      do
      {
        char v28 = v27;
        uint64_t v29 = _launchRequestsForApplication_withCompatibilityInfo__allUserInterfaceStyles[v25];
        if (objc_msgSend(v7, "xb_supportsUserInterfaceStyle:", v29, v34, v35))
        {
          uint64_t v30 = objc_alloc_init(XBLaunchStateRequest);
          [(XBLaunchStateRequest *)v30 setDisplayConfiguration:v23];
          [(XBLaunchStateRequest *)v30 setGroupID:v39];
          -[XBLaunchStateRequest setReferenceSize:](v30, "setReferenceSize:", v15, v17);
          [(XBLaunchStateRequest *)v30 setStatusBarState:v26];
          [(XBLaunchStateRequest *)v30 setInterfaceOrientation:v20];
          [(XBLaunchStateRequest *)v30 setUserInterfaceStyle:v29];
          if (v20 == statusBarOrientation && v29 == v37) {
            [v12 insertObject:v30 atIndex:0];
          }
          else {
            [v12 addObject:v30];
          }
        }
        char v27 = 0;
        uint64_t v25 = 1;
      }
      while ((v28 & 1) != 0);
      uint64_t v19 = XBInterfaceOrientationMaskForInterfaceOrientation(v20) | v36;
      id v13 = v23;
    }
    ++v18;
  }
  while (v18 != 4);
  if (![v12 count])
  {
    long long v31 = XBLogCapture();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[XBApplicationController _launchRequestsForApplication:withCompatibilityInfo:]((uint64_t)v34, v31);
    }
  }
  return v12;
}

- (void)_removeAllGeneratedLaunchImagesAndSnapshots
{
  id v4 = +[XBApplicationSnapshotPredicate predicate];
  [v4 setContentTypeMask:3];
  id v3 = [(XBApplicationProviding *)self->_applicationProvider allInstalledApplications];
  [(XBApplicationController *)self _removeLaunchImagesMatchingPredicate:v4 forApplications:v3 forgettingApps:0];
}

- (void)_removeLaunchImagesMatchingPredicate:(id)a3 forApplications:(id)a4 forgettingApps:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = XBLogFileManifest();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v7 descriptionWithMultilinePrefix:@"\t"];
    *(_DWORD *)buf = 67109378;
    BOOL v15 = v5;
    __int16 v16 = 2114;
    double v17 = v10;
    _os_log_impl(&dword_2232AB000, v9, OS_LOG_TYPE_DEFAULT, "_removeLaunchImagesMatchingPredicate:forApplications:forgettingApps: called\nforgettingApps: %d\npredicate:\n%{public}@", buf, 0x12u);
  }
  id v13 = v7;
  id v11 = v7;
  id v12 = v8;
  BSDispatchMain();
}

void __95__XBApplicationController__removeLaunchImagesMatchingPredicate_forApplications_forgettingApps___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[XBApplicationDataStore sharedInstance];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [XBApplicationSnapshotManifest alloc];
        uint64_t v10 = -[XBApplicationSnapshotManifest initWithApplicationInfo:](v9, "initWithApplicationInfo:", v8, (void)v12);
        [(XBApplicationSnapshotManifest *)v10 endTrackingImageDeletions];
        [(XBApplicationSnapshotManifest *)v10 deleteSnapshotsMatchingPredicate:*(void *)(a1 + 40)];
        id v11 = [v8 bundleIdentifier];
        if (*(unsigned char *)(a1 + 48)) {
          [v2 _clearCompatibilityInfoForBundleIdentifier:v11];
        }
        else {
          [v2 _removeBundleIdentifierFromLaunchInterfaceDenyList:v11];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)_updateStatusBarOrientation
{
}

void __54__XBApplicationController__updateStatusBarOrientation__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v3 = [v2 statusBarOrientation];

  *(void *)(*(void *)(a1 + 32) + 8) = v3;
}

- (XBApplicationProviding)applicationProvider
{
  return self->_applicationProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationProvider, 0);
  objc_storeStrong((id *)&self->_launchRequestProvider, 0);
  objc_storeStrong((id *)&self->_mainDisplayConfiguration, 0);
}

- (void)_launchRequestsForApplication:(uint64_t)a1 withCompatibilityInfo:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2232AB000, a2, OS_LOG_TYPE_ERROR, "We can't generate launch image requests for: %{public}@ since it doesn't support any valid orientations.", (uint8_t *)&v2, 0xCu);
}

@end