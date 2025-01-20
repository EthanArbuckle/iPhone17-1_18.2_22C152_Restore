@interface PLFeatureAvailabilityTransitionDelegate
- (PLFeatureAvailabilityTransitionDelegate)initWithLibraryServicesManager:(id)a3;
- (void)availability:(id)a3 feature:(id)a4 didTransition:(BOOL)a5;
- (void)memoriesCreationBecameAvailable:(id)a3;
- (void)searchUIFeatureBecameAvailable:(id)a3;
@end

@implementation PLFeatureAvailabilityTransitionDelegate

- (void).cxx_destruct
{
}

- (void)searchUIFeatureBecameAvailable:(id)a3
{
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  v5 = [WeakRetained databaseContext];
  v6 = (void *)[v5 newShortLivedLibraryWithName:"-[PLFeatureAvailabilityTransitionDelegate searchUIFeatureBecameAvailable:]"];
  v7 = [v6 globalValues];

  v8 = [v7 searchFeatureReadyDate];

  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1C9C8] now];
    [v7 setSearchFeatureReadyDate:v9];

    v10 = [v11 fractionForFeature:&unk_1EEBEE2F8];
    [v7 setSearchFeatureReadyFraction:v10];

    +[PLAnalysisCoordinator reportBGSTFeatureAvailable:3];
  }
}

- (void)memoriesCreationBecameAvailable:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  v4 = [WeakRetained databaseContext];
  v5 = (void *)[v4 newShortLivedLibraryWithName:"-[PLFeatureAvailabilityTransitionDelegate memoriesCreationBecameAvailable:]"];
  id v8 = [v5 globalValues];

  v6 = [v8 memoriesCreationPreviewAvailableDate];

  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1C9C8] now];
    [v8 setMemoriesCreationPreviewAvailableDate:v7];

    +[PLAnalysisCoordinator reportBGSTFeaturePreviewAvailable:1];
  }
}

- (void)availability:(id)a3 feature:(id)a4 didTransition:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [a4 unsignedIntegerValue];
  v10 = PLBackendGetLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v11) {
      goto LABEL_7;
    }
    int v13 = 67109120;
    int v14 = v9;
    v12 = "FeatureAvailability: %u became available";
  }
  else
  {
    if (!v11) {
      goto LABEL_7;
    }
    int v13 = 67109120;
    int v14 = v9;
    v12 = "FeatureAvailability: %u became unavailable";
  }
  _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 8u);
LABEL_7:

  if (v9 == 3)
  {
    if (v5) {
      [(PLFeatureAvailabilityTransitionDelegate *)self searchUIFeatureBecameAvailable:v8];
    }
  }
  else if (v9 == 1 && v5)
  {
    [(PLFeatureAvailabilityTransitionDelegate *)self memoriesCreationBecameAvailable:v8];
  }
}

- (PLFeatureAvailabilityTransitionDelegate)initWithLibraryServicesManager:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLFeatureAvailabilityTransitionDelegate;
  BOOL v5 = [(PLFeatureAvailabilityTransitionDelegate *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_lsm, v4);
    v7 = v6;
  }

  return v6;
}

@end