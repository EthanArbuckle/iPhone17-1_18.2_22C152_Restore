@interface SBWipeSnapshotManifestTestRecipe
- (id)title;
- (void)handleVolumeIncrease;
@end

@implementation SBWipeSnapshotManifestTestRecipe

- (id)title
{
  return @"Wipe Snapshot Manifest (most recent app)";
}

- (void)handleVolumeIncrease
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v3 = SBWorkspaceApplicationSceneHandlesInLockedOrUnlockedEnvironmentLayoutState();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [*(id *)(*((void *)&v35 + 1) + 8 * i) application];
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v5);
  }
  if (![v2 count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v9 = +[SBMainSwitcherControllerCoordinator sharedInstance];
    v10 = [v9 recentAppLayouts];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __56__SBWipeSnapshotManifestTestRecipe_handleVolumeIncrease__block_invoke;
          v29[3] = &unk_1E6AF9EF0;
          id v30 = v2;
          [v15 enumerate:v29];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v42 count:16];
      }
      while (v12);
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v2;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v25 + 1) + 8 * k);
        v22 = SBLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = [v21 bundleIdentifier];
          *(_DWORD *)buf = 138543362;
          v40 = v23;
          _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_INFO, "[%{public}@] Wiping snapshot manifest...", buf, 0xCu);
        }
        v24 = [v21 _snapshotManifest];
        [v24 deleteAllSnapshots];

        [v21 _reingestStaticDefaultImagesInSnapshotManifest];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v18);
  }
}

void __56__SBWipeSnapshotManifestTestRecipe_handleVolumeIncrease__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v10 = a3;
  if (![v10 type])
  {
    uint64_t v6 = *(void **)(a1 + 32);
    v7 = +[SBApplicationController sharedInstance];
    v8 = [v10 bundleIdentifier];
    v9 = [v7 applicationWithBundleIdentifier:v8];
    [v6 addObject:v9];

    *a4 = 1;
  }
}

@end