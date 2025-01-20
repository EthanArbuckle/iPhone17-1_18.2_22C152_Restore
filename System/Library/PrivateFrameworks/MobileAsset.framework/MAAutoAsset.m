@interface MAAutoAsset
+ (BOOL)hasStartupActivatedCompletedOnce;
+ (BOOL)supportsSecureCoding;
+ (id)assetSelectorForAssetTargetOSVersion:(id)a3 forTargetBuildVersion:(id)a4;
+ (id)cancelActivityForSelectorSync:(id)a3;
+ (id)defaultDispatchQueue;
+ (id)determineIfAvailableSync:(id)a3 forAssetSelector:(id)a4 discoveredAttributes:(id *)a5 error:(id *)a6;
+ (id)eliminateAllForAssetTypeSync:(id)a3;
+ (id)eliminateAllForSelectorSync:(id)a3;
+ (id)eliminatePromotedNeverLockedForSelectorSync:(id)a3;
+ (id)endAllPreviousLocksOfReasonSync:(id)a3 forAssetSelector:(id)a4;
+ (id)endAllPreviousLocksOfReasonSync:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5;
+ (id)endAllPreviousLocksOfSelectorSync:(id)a3;
+ (id)endAllPreviousLocksOfSelectorSync:(id)a3 forClientName:(id)a4;
+ (id)endPreviousLocksOfReasonSync:(id)a3 forAssetSelector:(id)a4 removingLockCount:(int64_t)a5;
+ (id)endPreviousLocksOfReasonSync:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5 removingLockCount:(int64_t)a6;
+ (id)frameworkDispatchQueue;
+ (id)frameworkInstanceUUID;
+ (id)interestInContentSync:(id)a3 forAssetSelector:(id)a4;
+ (id)interestInContentSync:(id)a3 forAssetSelector:(id)a4 withInterestPolicy:(id)a5;
+ (id)stageCancelOperationSync;
+ (id)stageDetermineAllAvailableForUpdateSync:(id)a3 totalExpectedBytes:(unint64_t *)a4 error:(id *)a5;
+ (id)stageDetermineAllAvailableSync:(id)a3 forTargetBuildVersion:(id)a4 totalExpectedBytes:(unint64_t *)a5 error:(id *)a6;
+ (id)stageDetermineGroupsAvailableForUpdateSync:(id)a3 totalExpectedBytes:(id *)a4 error:(id *)a5;
+ (id)stageDownloadGroupsSync:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 byGroupAssetsStaged:(id *)a6 error:(id *)a7 reportingProgress:(id)a8;
+ (id)stageEraseAllSync;
+ (id)stagePurgeAllSync;
+ (int64_t)waitOnSemaphore:(id)a3 withDaemonTriggeredTimeout:(int64_t)a4;
+ (unint64_t)stageDownloadAllSync:(int64_t)a3 assetsSuccessfullyStaged:(int64_t *)a4 error:(id *)a5 reportingProgress:(id)a6;
+ (void)cancelActivityForSelector:(id)a3 completion:(id)a4;
+ (void)determineIfAvailable:(id)a3 forAssetSelector:(id)a4 completion:(id)a5;
+ (void)eliminateAllForAssetType:(id)a3 completion:(id)a4;
+ (void)eliminateAllForSelector:(id)a3 completion:(id)a4;
+ (void)eliminatePromotedNeverLockedForSelector:(id)a3 completion:(id)a4;
+ (void)endAllPreviousLocksOfReason:(id)a3 forAssetSelector:(id)a4 completion:(id)a5;
+ (void)endAllPreviousLocksOfReason:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5 completion:(id)a6;
+ (void)endAllPreviousLocksOfSelector:(id)a3 completion:(id)a4;
+ (void)endAllPreviousLocksOfSelector:(id)a3 forClientName:(id)a4 completion:(id)a5;
+ (void)endPreviousLocksOfReason:(id)a3 forAssetSelector:(id)a4 removingLockCount:(int64_t)a5 completion:(id)a6;
+ (void)endPreviousLocksOfReason:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5 removingLockCount:(int64_t)a6 completion:(id)a7;
+ (void)frameworkInstanceSetLogDomain;
+ (void)interestInContent:(id)a3 forAssetSelector:(id)a4 completion:(id)a5;
+ (void)interestInContent:(id)a3 forAssetSelector:(id)a4 withInterestPolicy:(id)a5 completion:(id)a6;
+ (void)logMAAutoAssetVersion;
+ (void)stageCancelOperation:(id)a3;
+ (void)stageDetermineAllAvailable:(id)a3 forTargetBuildVersion:(id)a4 completion:(id)a5;
+ (void)stageDetermineAllAvailableForUpdate:(id)a3 completion:(id)a4;
+ (void)stageDetermineGroupsAvailableForUpdate:(id)a3 completion:(id)a4;
+ (void)stageDownloadAll:(int64_t)a3 reportingProgress:(id)a4 completion:(id)a5;
+ (void)stageDownloadGroups:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7;
+ (void)stageEraseAll:(id)a3;
+ (void)stagePurgeAll:(id)a3;
- (MAAutoAsset)initWithCoder:(id)a3;
- (MAAutoAssetSelector)assetSelector;
- (MAAutoAssetSelector)contentLockedSelector;
- (NSDictionary)assetAttributes;
- (NSString)autoAssetClientName;
- (NSString)contentLockedReason;
- (NSString)description;
- (NSString)updateCategoryDesiredByClient;
- (NSURL)localContentURL;
- (OS_dispatch_queue)completionDispatchQueue;
- (id)_cancelActivityForSelectorSync;
- (id)_eliminateAllForAssetTypeSync;
- (id)_eliminateAllForSelectorSync;
- (id)_eliminatePromotedNeverLockedForSelectorSync;
- (id)_endAllPreviousLocksOfReasonSync:(id)a3;
- (id)_endPreviousLocksOfReasonSync:(id)a3 removingLockCount:(int64_t)a4;
- (id)_newProxyObjectForLockProgressBlock:(id)a3;
- (id)_newProxyObjectForStageProgressBlock:(id)a3;
- (id)_stageCancelOperationSync;
- (id)_stageDetermineAllAvailableForUpdateSync:(id)a3 totalExpectedBytes:(unint64_t *)a4 error:(id *)a5;
- (id)_stageDetermineAllAvailableSync:(id)a3 forTargetBuildVersion:(id)a4 totalExpectedBytes:(unint64_t *)a5 error:(id *)a6;
- (id)_stageDetermineGroupsAvailableForUpdateSync:(id)a3 totalExpectedBytes:(id *)a4 error:(id *)a5;
- (id)_stageDownloadGroupsSync:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 byGroupAssetsStaged:(id *)a6 error:(id *)a7 reportingProgress:(id)a8;
- (id)_stageEraseAllSync;
- (id)_stagePurgeAllSync;
- (id)assetAttribute:(id)a3;
- (id)checkForNewerSync:(id)a3 withTimeout:(int64_t)a4 discoveredAttributes:(id *)a5 error:(id *)a6;
- (id)checkForNewerSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 discoveredAttributes:(id *)a6 error:(id *)a7;
- (id)continueLockUsageSync:(id)a3;
- (id)continueLockUsageSync:(id)a3 withUsagePolicy:(id)a4;
- (id)currentStatusSync:(id *)a3;
- (id)determineIfAvailableSync:(id)a3 withTimeout:(int64_t)a4 discoveredAttributes:(id *)a5 error:(id *)a6;
- (id)endLockUsageSync:(id)a3;
- (id)initForClientName:(id)a3 selectingAsset:(id)a4 completingFromQueue:(id)a5 error:(id *)a6;
- (id)initForClientName:(id)a3 selectingAsset:(id)a4 error:(id *)a5;
- (id)initForClientName:(id)a3 selectingAsset:(id)a4 usingDesiredPolicyCategory:(id)a5 completingFromQueue:(id)a6 error:(id *)a7;
- (id)initForClientName:(id)a3 selectingAsset:(id)a4 usingDesiredPolicyCategory:(id)a5 error:(id *)a6;
- (id)interestInContentSync:(id)a3;
- (id)interestInContentSync:(id)a3 withInterestPolicy:(id)a4;
- (id)lockContentSync:(id)a3 withTimeout:(int64_t)a4 lockedAssetSelector:(id *)a5 newerInProgress:(id *)a6 error:(id *)a7;
- (id)lockContentSync:(id)a3 withTimeout:(int64_t)a4 lockedAssetSelector:(id *)a5 newerInProgress:(id *)a6 error:(id *)a7 reportingProgress:(id)a8;
- (id)lockContentSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 lockedAssetSelector:(id *)a6 newerInProgress:(id *)a7 error:(id *)a8;
- (id)lockContentSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 lockedAssetSelector:(id *)a6 newerInProgress:(id *)a7 error:(id *)a8 reportingProgress:(id)a9;
- (id)mapLockedContentSync:(id)a3 error:(id *)a4;
- (id)summary;
- (int)locksOfContent;
- (unint64_t)_stageDownloadAllSync:(int64_t)a3 assetsSuccessfullyStaged:(int64_t *)a4 error:(id *)a5 reportingProgress:(id)a6;
- (void)_cancelActivityForSelector:(id)a3;
- (void)_eliminateAllForAssetType:(id)a3;
- (void)_eliminateAllForSelector:(id)a3;
- (void)_eliminatePromotedNeverLockedForSelector:(id)a3;
- (void)_endAllPreviousLocksOfReason:(id)a3 completion:(id)a4;
- (void)_endPreviousLocksOfReason:(id)a3 removingLockCount:(int64_t)a4 completion:(id)a5;
- (void)_failedCancelActivity:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedCheckForNewer:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedContinueLockUsage:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedCurrentStatus:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedDetermineIfAvailable:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedEliminate:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedEndLockUsage:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedInterestInContent:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedLockContent:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedMapLockedContent:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedStageCancelOperation:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedStageDetermineAllAvailable:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedStageDetermineGroupsAvailableForUpdate:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedStageDownloadAll:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedStageDownloadGroups:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedStageEraseAll:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedStagePurgeAll:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_lockContentStatusProgress:(id)a3 lockForUseError:(id)a4 progressBlock:(id)a5;
- (void)_stageCancelOperation:(id)a3;
- (void)_stageDetermineAllAvailable:(id)a3 forTargetBuildVersion:(id)a4 completion:(id)a5;
- (void)_stageDetermineAllAvailableForUpdate:(id)a3 completion:(id)a4;
- (void)_stageDetermineGroupsAvailableForUpdate:(id)a3 completion:(id)a4;
- (void)_stageDownloadAll:(int64_t)a3 reportingProgress:(id)a4 completion:(id)a5;
- (void)_stageDownloadAllStatusProgress:(id)a3 stageProgressError:(id)a4 progressBlock:(id)a5;
- (void)_stageDownloadGroups:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7;
- (void)_stageEraseAll:(id)a3;
- (void)_stagePurgeAll:(id)a3;
- (void)_successCancelActivity:(id)a3;
- (void)_successCheckForNewer:(id)a3 completion:(id)a4;
- (void)_successContinueLockUsage:(id)a3 completion:(id)a4;
- (void)_successCurrentStatus:(id)a3 completion:(id)a4;
- (void)_successDetermineIfAvailable:(id)a3 completion:(id)a4;
- (void)_successEliminate:(id)a3;
- (void)_successEndLockUsage:(id)a3 completion:(id)a4;
- (void)_successInterestInContent:(id)a3 completion:(id)a4;
- (void)_successLockContent:(id)a3 dueToDesire:(id)a4 sandboxExtension:(id)a5 sandboxExtensionPath:(id)a6 completion:(id)a7;
- (void)_successMapLockedContent:(id)a3 dueToDesire:(id)a4 completion:(id)a5;
- (void)_successStageCancelOperation:(id)a3;
- (void)_successStageDetermineAllAvailable:(id)a3 completion:(id)a4;
- (void)_successStageDetermineGroupsAvailableForUpdate:(id)a3 completion:(id)a4;
- (void)_successStageDownloadAll:(id)a3 completion:(id)a4;
- (void)_successStageDownloadGroups:(id)a3 completion:(id)a4;
- (void)_successStageEraseAll:(id)a3;
- (void)_successStagePurgeAll:(id)a3;
- (void)checkForNewer:(id)a3 withTimeout:(int64_t)a4 completion:(id)a5;
- (void)checkForNewer:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6;
- (void)connectToServerFrameworkCompletion:(id)a3;
- (void)continueLockUsage:(id)a3 completion:(id)a4;
- (void)continueLockUsage:(id)a3 withUsagePolicy:(id)a4 completion:(id)a5;
- (void)currentStatus:(id)a3;
- (void)determineIfAvailable:(id)a3 withTimeout:(int64_t)a4 completion:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)endLockUsage:(id)a3 completion:(id)a4;
- (void)interestInContent:(id)a3 completion:(id)a4;
- (void)interestInContent:(id)a3 withInterestPolicy:(id)a4 completion:(id)a5;
- (void)lockContent:(id)a3 withTimeout:(int64_t)a4 completion:(id)a5;
- (void)lockContent:(id)a3 withTimeout:(int64_t)a4 reportingProgress:(id)a5 completion:(id)a6;
- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6;
- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7;
- (void)mapLockedContent:(id)a3 completion:(id)a4;
- (void)setAssetAttributes:(id)a3;
- (void)setContentLockedReason:(id)a3;
- (void)setContentLockedSelector:(id)a3;
- (void)setLocalContentURL:(id)a3;
- (void)setLocksOfContent:(int)a3;
@end

@implementation MAAutoAsset

- (id)initForClientName:(id)a3 selectingAsset:(id)a4 error:(id *)a5
{
  return [(MAAutoAsset *)self initForClientName:a3 selectingAsset:a4 usingDesiredPolicyCategory:0 completingFromQueue:0 error:a5];
}

- (id)initForClientName:(id)a3 selectingAsset:(id)a4 completingFromQueue:(id)a5 error:(id *)a6
{
  return [(MAAutoAsset *)self initForClientName:a3 selectingAsset:a4 usingDesiredPolicyCategory:0 completingFromQueue:a5 error:a6];
}

- (id)initForClientName:(id)a3 selectingAsset:(id)a4 usingDesiredPolicyCategory:(id)a5 error:(id *)a6
{
  return [(MAAutoAsset *)self initForClientName:a3 selectingAsset:a4 usingDesiredPolicyCategory:a5 completingFromQueue:0 error:a6];
}

- (id)initForClientName:(id)a3 selectingAsset:(id)a4 usingDesiredPolicyCategory:(id)a5 completingFromQueue:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v29 = a5;
  id v15 = a6;
  +[MAAutoAsset logMAAutoAssetVersion];
  v30.receiver = self;
  v30.super_class = (Class)MAAutoAsset;
  v16 = [(MAAutoAsset *)&v30 init];
  if (!v16)
  {
LABEL_10:
    v24 = v16;
    goto LABEL_23;
  }
  +[MAAutoAsset frameworkInstanceSetLogDomain];
  objc_storeStrong((id *)&v16->_autoAssetClientName, a3);
  p_assetSelector = &v16->_assetSelector;
  objc_storeStrong((id *)&v16->_assetSelector, a4);
  objc_storeStrong((id *)&v16->_updateCategoryDesiredByClient, a5);
  contentLockedSelector = v16->_contentLockedSelector;
  v16->_contentLockedSelector = 0;

  contentLockedReason = v16->_contentLockedReason;
  v16->_contentLockedReason = 0;

  localContentURL = v16->_localContentURL;
  v16->_localContentURL = 0;

  assetAttributes = v16->_assetAttributes;
  v16->_assetAttributes = 0;

  if (v15)
  {
    v22 = (OS_dispatch_queue *)v15;
  }
  else
  {
    v22 = +[MAAutoAsset defaultDispatchQueue];
  }
  completionDispatchQueue = v16->_completionDispatchQueue;
  v16->_completionDispatchQueue = v22;

  v16->_locksOfContent = 0;
  if (v16->_autoAssetClientName && *p_assetSelector)
  {
    if (v16->_completionDispatchQueue)
    {
      if (a7) {
        *a7 = 0;
      }
      goto LABEL_10;
    }
    if (a7)
    {
      v26 = [MEMORY[0x1E4F28E78] stringWithFormat:@"failed to initialize, missing:"];
      v27 = v26;
      if (!v16->_completionDispatchQueue) {
        [v26 appendString:@" completionDispatchQueue"];
      }
      *a7 = +[MAAutoAssetError buildError:6101 fromOperation:@"auto(defaultDispatchQueue)" underlyingError:0 withDescription:v27];
    }
LABEL_18:
    v24 = 0;
    goto LABEL_23;
  }
  if (!a7) {
    goto LABEL_18;
  }
  if (v16->_autoAssetClientName)
  {
    v25 = @"assetSelector is a required parameter that was not provided";
  }
  else if (*p_assetSelector)
  {
    v25 = @"autoAssetClientName is a required parameter that was not provided";
  }
  else
  {
    v25 = @"autoAssetClientName and assetSelector are required parameters yet neither was provided";
  }
  +[MAAutoAssetError buildError:6102 fromOperation:@"auto(initForClientName)" underlyingError:0 withDescription:v25];
  v24 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v24;
}

- (MAAutoAsset)initWithCoder:(id)a3
{
  v25[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MAAutoAsset;
  v5 = [(MAAutoAsset *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoAssetClientName"];
    autoAssetClientName = v5->_autoAssetClientName;
    v5->_autoAssetClientName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSelector"];
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateCategoryDesiredByClient"];
    updateCategoryDesiredByClient = v5->_updateCategoryDesiredByClient;
    v5->_updateCategoryDesiredByClient = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentLockedSelector"];
    contentLockedSelector = v5->_contentLockedSelector;
    v5->_contentLockedSelector = (MAAutoAssetSelector *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentLockedReason"];
    contentLockedReason = v5->_contentLockedReason;
    v5->_contentLockedReason = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localContentURL"];
    localContentURL = v5->_localContentURL;
    v5->_localContentURL = (NSURL *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v25[3] = objc_opt_class();
    v25[4] = objc_opt_class();
    v25[5] = objc_opt_class();
    v25[6] = objc_opt_class();
    v25[7] = objc_opt_class();
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:8];
    v20 = [v18 setWithArray:v19];

    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"assetAttributes"];
    assetAttributes = v5->_assetAttributes;
    v5->_assetAttributes = (NSDictionary *)v21;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MAAutoAsset *)self autoAssetClientName];
  [v4 encodeObject:v5 forKey:@"autoAssetClientName"];

  uint64_t v6 = [(MAAutoAsset *)self assetSelector];
  [v4 encodeObject:v6 forKey:@"assetSelector"];

  v7 = [(MAAutoAsset *)self updateCategoryDesiredByClient];
  [v4 encodeObject:v7 forKey:@"updateCategoryDesiredByClient"];

  uint64_t v8 = [(MAAutoAsset *)self contentLockedSelector];
  [v4 encodeObject:v8 forKey:@"contentLockedSelector"];

  v9 = [(MAAutoAsset *)self contentLockedReason];
  [v4 encodeObject:v9 forKey:@"contentLockedReason"];

  uint64_t v10 = [(MAAutoAsset *)self localContentURL];
  [v4 encodeObject:v10 forKey:@"localContentURL"];

  id v11 = [(MAAutoAsset *)self assetAttributes];
  [v4 encodeObject:v11 forKey:@"assetAttributes"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)interestInContent:(id)a3 completion:(id)a4
{
}

- (void)interestInContent:(id)a3 withInterestPolicy:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__MAAutoAsset_interestInContent_withInterestPolicy_completion___block_invoke;
    v13[3] = &unk_1E60041A8;
    v13[4] = self;
    id v14 = v9;
    id v15 = v8;
    id v16 = v10;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v13];
  }
  else
  {
    id v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset interestInContent:withInterestPolicy:completion:]();
    }
  }
}

void __63__MAAutoAsset_interestInContent_withInterestPolicy_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 56);
    [v3 _failedInterestInContent:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    v5 = [MAAutoAssetInfoInstance alloc];
    uint64_t v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) assetSelector];
    id v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    uint64_t v12 = [MAAutoAssetInfoDesire alloc];
    id v13 = [*(id *)(a1 + 32) updateCategoryDesiredByClient];
    id v14 = [(MAAutoAssetInfoDesire *)v12 initWithDesiredCategory:v13 forClientAssetPolicy:*(void *)(a1 + 40) reasonDesired:*(void *)(a1 + 48) withCheckWaitTimeout:-101 withLockWaitTimeout:-101 desiringProgress:0];

    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v16 = +[MAAutoAsset frameworkInstanceUUID];
    v17 = [v16 UUIDString];

    [v15 setSafeObject:v11 forKey:@"instance"];
    [v15 setSafeObject:v14 forKey:@"desire"];
    v18 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO:INTEREST_IN_CONTENT" clientID:v17 version:0 message:v15];
    v19 = (void *)__maAutoAssetSharedConnectionClient;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63__MAAutoAsset_interestInContent_withInterestPolicy_completion___block_invoke_2;
    v20[3] = &unk_1E6004158;
    v20[4] = *(void *)(a1 + 32);
    id v21 = *(id *)(a1 + 56);
    [v19 connectClientSendServerMessage:v18 proxyObject:0 withReply:v20];
  }
}

void __63__MAAutoAsset_interestInContent_withInterestPolicy_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v12 || v5)
  {
    if (v5)
    {
      uint64_t v8 = @"failure reported by server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 0;
      id v11 = v5;
    }
    else
    {
      uint64_t v8 = @"no response message from server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 6104;
      id v11 = 0;
    }
    [v9 _failedInterestInContent:v10 withResponseError:v11 description:v8 completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) assetSelector];
    [v6 _successInterestInContent:v7 completion:*(void *)(a1 + 40)];
  }
}

- (id)interestInContentSync:(id)a3
{
  return [(MAAutoAsset *)self interestInContentSync:a3 withInterestPolicy:0];
}

- (id)interestInContentSync:(id)a3 withInterestPolicy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__5;
  v30[4] = __Block_byref_object_dispose__5;
  id v31 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__5;
  v28 = __Block_byref_object_dispose__5;
  id v29 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__MAAutoAsset_interestInContentSync_withInterestPolicy___block_invoke;
  v14[3] = &unk_1E60053B0;
  id v16 = v20;
  v17 = v30;
  v18 = &v24;
  v19 = v22;
  id v9 = v8;
  id v15 = v9;
  [(MAAutoAsset *)self interestInContent:v6 withInterestPolicy:v7 completion:v14];
  if (+[MAAutoAsset waitOnSemaphore:v9 withDaemonTriggeredTimeout:-100])
  {
    uint64_t v10 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__MAAutoAsset_interestInContentSync_withInterestPolicy___block_invoke_3;
    block[3] = &unk_1E60053D8;
    block[4] = v22;
    block[5] = v20;
    block[6] = v30;
    block[7] = &v24;
    dispatch_sync(v10, block);
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(v30, 8);
  return v11;
}

void __56__MAAutoAsset_interestInContentSync_withInterestPolicy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __56__MAAutoAsset_interestInContentSync_withInterestPolicy___block_invoke_2;
  block[3] = &unk_1E60040E0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v17 = *(void *)(a1 + 64);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

intptr_t __56__MAAutoAsset_interestInContentSync_withInterestPolicy___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__56__MAAutoAsset_interestInContentSync_withInterestPolicy___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    *(void *)(*(void *)(v1[7] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(interestInContentSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for interest-in-content to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)checkForNewer:(id)a3 withTimeout:(int64_t)a4 completion:(id)a5
{
}

- (void)checkForNewer:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__MAAutoAsset_checkForNewer_withUsagePolicy_withTimeout_completion___block_invoke;
    v15[3] = &unk_1E6005400;
    v15[4] = self;
    id v16 = v11;
    id v17 = v10;
    int64_t v19 = a5;
    id v18 = v12;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v15];
  }
  else
  {
    id v13 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v14 = [v13 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset checkForNewer:withUsagePolicy:withTimeout:completion:]();
    }
  }
}

void __68__MAAutoAsset_checkForNewer_withUsagePolicy_withTimeout_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 56);
    [v3 _failedCheckForNewer:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) assetSelector];
    id v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = [MAAutoAssetInfoDesire alloc];
    id v13 = [*(id *)(a1 + 32) updateCategoryDesiredByClient];
    id v14 = [(MAAutoAssetInfoDesire *)v12 initWithDesiredCategory:v13 forClientAssetPolicy:*(void *)(a1 + 40) reasonDesired:*(void *)(a1 + 48) withCheckWaitTimeout:*(void *)(a1 + 64) withLockWaitTimeout:-101 desiringProgress:0];

    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v16 = +[MAAutoAsset frameworkInstanceUUID];
    id v17 = [v16 UUIDString];

    [v15 setSafeObject:v11 forKey:@"instance"];
    [v15 setSafeObject:v14 forKey:@"desire"];
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO:CHECK_FOR_NEWER" clientID:v17 version:0 message:v15];
    int64_t v19 = (void *)__maAutoAssetSharedConnectionClient;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68__MAAutoAsset_checkForNewer_withUsagePolicy_withTimeout_completion___block_invoke_2;
    void v20[3] = &unk_1E6004158;
    v20[4] = *(void *)(a1 + 32);
    id v21 = *(id *)(a1 + 56);
    [v19 connectClientSendServerMessage:v18 proxyObject:0 withReply:v20];
  }
}

void __68__MAAutoAsset_checkForNewer_withUsagePolicy_withTimeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (!v16 || v5)
  {
    if (v5)
    {
      id v13 = @"failure reported by server";
      uint64_t v14 = 0;
      id v15 = v5;
    }
    else
    {
      id v13 = @"no response message from server";
      uint64_t v14 = 6104;
      id v15 = 0;
    }
    [*(id *)(a1 + 32) _failedCheckForNewer:v14 withResponseError:v15 description:v13 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v16 message];
    uint64_t v7 = [v6 safeObjectForKey:@"found" ofClass:objc_opt_class()];

    if (v7)
    {
      uint64_t v8 = [v7 currentStatus];
      id v9 = [v8 newerVersionError];

      id v10 = *(void **)(a1 + 32);
      if (v9)
      {
        id v11 = [v7 currentStatus];
        id v12 = [v11 newerVersionError];
        [v10 _failedCheckForNewer:0 withResponseError:v12 description:@"found-information indicated error" completion:*(void *)(a1 + 40)];
      }
      else
      {
        [*(id *)(a1 + 32) _successCheckForNewer:v7 completion:*(void *)(a1 + 40)];
      }
    }
    else
    {
      [*(id *)(a1 + 32) _failedCheckForNewer:6104 withResponseError:0 description:@"no found-information provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

- (id)checkForNewerSync:(id)a3 withTimeout:(int64_t)a4 discoveredAttributes:(id *)a5 error:(id *)a6
{
  return [(MAAutoAsset *)self checkForNewerSync:a3 withUsagePolicy:0 withTimeout:a4 discoveredAttributes:a5 error:a6];
}

- (id)checkForNewerSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 discoveredAttributes:(id *)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__5;
  v51 = __Block_byref_object_dispose__5;
  id v52 = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__5;
  v45 = __Block_byref_object_dispose__5;
  id v46 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__5;
  v39 = __Block_byref_object_dispose__5;
  id v40 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 0;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __88__MAAutoAsset_checkForNewerSync_withUsagePolicy_withTimeout_discoveredAttributes_error___block_invoke;
  v21[3] = &unk_1E6005450;
  char v23 = v29;
  uint64_t v24 = &v47;
  v25 = v33;
  uint64_t v26 = &v41;
  v27 = &v35;
  v28 = v31;
  id v13 = v10;
  uint64_t v14 = v12;
  v22 = v14;
  [(MAAutoAsset *)self checkForNewer:v10 withUsagePolicy:v11 withTimeout:a5 completion:v21];
  if (+[MAAutoAsset waitOnSemaphore:v14 withDaemonTriggeredTimeout:a5])
  {
    id v15 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__MAAutoAsset_checkForNewerSync_withUsagePolicy_withTimeout_discoveredAttributes_error___block_invoke_3;
    block[3] = &unk_1E60053D8;
    void block[4] = v31;
    block[5] = v29;
    block[6] = &v41;
    block[7] = &v35;
    dispatch_sync(v15, block);
  }
  if (a6) {
    *a6 = (id) v42[5];
  }
  if (a7) {
    *a7 = (id) v36[5];
  }
  id v16 = (id)v48[5];

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v16;
}

void __88__MAAutoAsset_checkForNewerSync_withUsagePolicy_withTimeout_discoveredAttributes_error___block_invoke(uint64_t a1, void *a2, char a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  dispatch_semaphore_t v12 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v18 = *(_OWORD *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 64);
  long long v24 = *(_OWORD *)(a1 + 48);
  long long v25 = v13;
  block[2] = __88__MAAutoAsset_checkForNewerSync_withUsagePolicy_withTimeout_discoveredAttributes_error___block_invoke_2;
  block[3] = &unk_1E6005428;
  char v27 = a3;
  id v20 = v9;
  id v21 = v10;
  id v22 = v11;
  uint64_t v26 = *(void *)(a1 + 80);
  id v14 = (id)v18;
  long long v23 = v18;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  dispatch_sync(v12, block);
}

intptr_t __88__MAAutoAsset_checkForNewerSync_withUsagePolicy_withTimeout_discoveredAttributes_error___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 64) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 72) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = *(unsigned char *)(v1 + 112);
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 88) + 8) + 40), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 96) + 8) + 40), *(id *)(v1 + 48));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 104) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 56);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__88__MAAutoAsset_checkForNewerSync_withUsagePolicy_withTimeout_discoveredAttributes_error___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    *(void *)(*(void *)(v1[7] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(checkForNewerSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for check-for-newer to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)determineIfAvailable:(id)a3 withTimeout:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__MAAutoAsset_determineIfAvailable_withTimeout_completion___block_invoke;
    v12[3] = &unk_1E6005478;
    v12[4] = self;
    id v13 = v8;
    int64_t v15 = a4;
    id v14 = v9;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v12];
  }
  else
  {
    id v10 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset determineIfAvailable:withTimeout:completion:]();
    }
  }
}

void __59__MAAutoAsset_determineIfAvailable_withTimeout_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedDetermineIfAvailable:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) assetSelector];
    id v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    dispatch_semaphore_t v12 = [MAAutoAssetInfoDesire alloc];
    id v13 = [*(id *)(a1 + 32) updateCategoryDesiredByClient];
    id v14 = [(MAAutoAssetInfoDesire *)v12 initWithDesiredCategory:v13 forClientAssetPolicy:0 reasonDesired:*(void *)(a1 + 40) withCheckWaitTimeout:*(void *)(a1 + 56) withLockWaitTimeout:-101 desiringProgress:0];

    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v16 = +[MAAutoAsset frameworkInstanceUUID];
    id v17 = [v16 UUIDString];

    [v15 setSafeObject:v11 forKey:@"instance"];
    [v15 setSafeObject:v14 forKey:@"desire"];
    long long v18 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO:DETERMINE_IF_AVAILABLE" clientID:v17 version:0 message:v15];
    int64_t v19 = (void *)__maAutoAssetSharedConnectionClient;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __59__MAAutoAsset_determineIfAvailable_withTimeout_completion___block_invoke_2;
    void v20[3] = &unk_1E6004158;
    v20[4] = *(void *)(a1 + 32);
    id v21 = *(id *)(a1 + 48);
    [v19 connectClientSendServerMessage:v18 proxyObject:0 withReply:v20];
  }
}

void __59__MAAutoAsset_determineIfAvailable_withTimeout_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (!v16 || v5)
  {
    if (v5)
    {
      id v13 = @"failure reported by server";
      uint64_t v14 = 0;
      id v15 = v5;
    }
    else
    {
      id v13 = @"no response message from server";
      uint64_t v14 = 6104;
      id v15 = 0;
    }
    [*(id *)(a1 + 32) _failedDetermineIfAvailable:v14 withResponseError:v15 description:v13 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v16 message];
    uint64_t v7 = [v6 safeObjectForKey:@"found" ofClass:objc_opt_class()];

    if (v7)
    {
      uint64_t v8 = [v7 currentStatus];
      id v9 = [v8 newerVersionError];

      id v10 = *(void **)(a1 + 32);
      if (v9)
      {
        id v11 = [v7 currentStatus];
        dispatch_semaphore_t v12 = [v11 newerVersionError];
        [v10 _failedDetermineIfAvailable:0 withResponseError:v12 description:@"found-information indicated error" completion:*(void *)(a1 + 40)];
      }
      else
      {
        [*(id *)(a1 + 32) _successDetermineIfAvailable:v7 completion:*(void *)(a1 + 40)];
      }
    }
    else
    {
      [*(id *)(a1 + 32) _failedDetermineIfAvailable:6104 withResponseError:0 description:@"no found-information provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

- (id)determineIfAvailableSync:(id)a3 withTimeout:(int64_t)a4 discoveredAttributes:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3032000000;
  uint64_t v43 = __Block_byref_object_copy__5;
  v44 = __Block_byref_object_dispose__5;
  id v45 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__5;
  v38 = __Block_byref_object_dispose__5;
  id v39 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = __Block_byref_object_copy__5;
  char v32 = __Block_byref_object_dispose__5;
  id v33 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__MAAutoAsset_determineIfAvailableSync_withTimeout_discoveredAttributes_error___block_invoke;
  v17[3] = &unk_1E60054C8;
  int64_t v19 = v24;
  id v20 = &v40;
  id v21 = &v34;
  id v22 = &v28;
  long long v23 = v26;
  dispatch_semaphore_t v12 = v11;
  long long v18 = v12;
  [(MAAutoAsset *)self determineIfAvailable:v10 withTimeout:a4 completion:v17];
  if (+[MAAutoAsset waitOnSemaphore:v12 withDaemonTriggeredTimeout:a4])
  {
    id v13 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__MAAutoAsset_determineIfAvailableSync_withTimeout_discoveredAttributes_error___block_invoke_3;
    block[3] = &unk_1E60053D8;
    void block[4] = v26;
    block[5] = v24;
    block[6] = &v34;
    block[7] = &v28;
    dispatch_sync(v13, block);
  }
  if (a5) {
    *a5 = (id) v35[5];
  }
  if (a6) {
    *a6 = (id) v29[5];
  }
  id v14 = (id)v41[5];

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);

  return v14;
}

void __79__MAAutoAsset_determineIfAvailableSync_withTimeout_discoveredAttributes_error___block_invoke(_OWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v16 = a1[2];
  long long v11 = a1[4];
  long long v22 = a1[3];
  long long v23 = v11;
  block[2] = __79__MAAutoAsset_determineIfAvailableSync_withTimeout_discoveredAttributes_error___block_invoke_2;
  block[3] = &unk_1E60054A0;
  id v18 = v7;
  id v19 = v8;
  id v20 = v9;
  id v12 = (id)v16;
  long long v21 = v16;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  dispatch_sync(v10, block);
}

intptr_t __79__MAAutoAsset_determineIfAvailableSync_withTimeout_discoveredAttributes_error___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 64) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 72) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 80) + 8) + 40), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 88) + 8) + 40), *(id *)(v1 + 48));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 96) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 56);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__79__MAAutoAsset_determineIfAvailableSync_withTimeout_discoveredAttributes_error___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    *(void *)(*(void *)(v1[7] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(determineIfAvailableSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for determine-if-available to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (BOOL)hasStartupActivatedCompletedOnce
{
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v3 = [v2 fileExistsAtPath:@"/private/var/run/MobileAssetStartupActivation.doneThisBoot"];

  return v3;
}

- (void)currentStatus:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __29__MAAutoAsset_currentStatus___block_invoke;
    v8[3] = &unk_1E60054F0;
    v8[4] = self;
    id v9 = v4;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v8];
  }
  else
  {
    id v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset currentStatus:]();
    }
  }
}

void __29__MAAutoAsset_currentStatus___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    char v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _failedCurrentStatus:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) assetSelector];
    id v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = +[MAAutoAsset frameworkInstanceUUID];
    id v14 = [v13 UUIDString];

    [v12 setSafeObject:v11 forKey:@"instance"];
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO:CURRENT_STATUS" clientID:v14 version:0 message:v12];
    long long v16 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __29__MAAutoAsset_currentStatus___block_invoke_2;
    v18[3] = &unk_1E6004158;
    id v17 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v17;
    [v16 connectClientSendServerMessage:v15 proxyObject:0 withReply:v18];
  }
}

void __29__MAAutoAsset_currentStatus___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (!v15 || v5)
  {
    if (v5)
    {
      id v11 = @"failure reported by server";
      uint64_t v12 = 0;
      id v13 = v5;
    }
    else
    {
      id v11 = @"no response message from server";
      uint64_t v12 = 6104;
      id v13 = 0;
    }
    [*(id *)(a1 + 32) _failedCurrentStatus:v12 withResponseError:v13 description:v11 completion:*(void *)(a1 + 40)];
    goto LABEL_14;
  }
  id v6 = [v15 message];
  uint64_t v7 = [v6 safeObjectForKey:@"found" ofClass:objc_opt_class()];

  if (!v7)
  {
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    id v14 = @"no found-information provided by server";
LABEL_12:
    [v9 _failedCurrentStatus:6104 withResponseError:0 description:v14 completion:v10];
    goto LABEL_13;
  }
  uint64_t v8 = [v7 currentStatus];

  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  if (!v8)
  {
    id v14 = @"found-information yet no status provided";
    goto LABEL_12;
  }
  [v9 _successCurrentStatus:v7 completion:*(void *)(a1 + 40)];
LABEL_13:

LABEL_14:
}

- (id)currentStatusSync:(id *)a3
{
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__5;
  id v31 = __Block_byref_object_dispose__5;
  id v32 = 0;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__5;
  char v25 = __Block_byref_object_dispose__5;
  id v26 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __33__MAAutoAsset_currentStatusSync___block_invoke;
  v11[3] = &unk_1E6005518;
  id v13 = v17;
  id v14 = &v27;
  id v15 = &v21;
  long long v16 = v19;
  id v6 = v5;
  uint64_t v12 = v6;
  [(MAAutoAsset *)self currentStatus:v11];
  if (+[MAAutoAsset waitOnSemaphore:v6 withDaemonTriggeredTimeout:-100])
  {
    uint64_t v7 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__MAAutoAsset_currentStatusSync___block_invoke_3;
    block[3] = &unk_1E60053D8;
    void block[4] = v19;
    block[5] = v17;
    block[6] = &v27;
    block[7] = &v21;
    dispatch_sync(v7, block);
  }
  if (a3) {
    *a3 = (id) v22[5];
  }
  id v8 = (id)v28[5];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v8;
}

void __33__MAAutoAsset_currentStatusSync___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __33__MAAutoAsset_currentStatusSync___block_invoke_2;
  block[3] = &unk_1E60040E0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v17 = *(void *)(a1 + 64);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

intptr_t __33__MAAutoAsset_currentStatusSync___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__33__MAAutoAsset_currentStatusSync___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    char v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    *(void *)(*(void *)(v1[7] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(currentStatusSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for current-status to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)lockContent:(id)a3 withTimeout:(int64_t)a4 completion:(id)a5
{
}

- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6
{
}

- (void)lockContent:(id)a3 withTimeout:(int64_t)a4 reportingProgress:(id)a5 completion:(id)a6
{
}

- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __84__MAAutoAsset_lockContent_withUsagePolicy_withTimeout_reportingProgress_completion___block_invoke;
    v18[3] = &unk_1E6005568;
    int64_t v23 = a5;
    v18[4] = self;
    id v19 = v13;
    id v20 = v12;
    id v21 = v14;
    id v22 = v15;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v18];
  }
  else
  {
    long long v16 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v17 = [v16 oslog];

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:]();
    }
  }
}

void __84__MAAutoAsset_lockContent_withUsagePolicy_withTimeout_reportingProgress_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    char v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 64);
    [v3 _failedLockContent:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    if (*(void *)(a1 + 72)) {
      uint64_t v5 = -2;
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = [MAAutoAssetInfoInstance alloc];
    uint64_t v7 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v8 = __maAutoAssetSharedClientProcessName;
    uint64_t v9 = __maAutoAssetSharedClientProcessID;
    id v10 = [*(id *)(a1 + 32) assetSelector];
    long long v11 = +[MAAutoAsset frameworkInstanceUUID];
    id v12 = [(MAAutoAssetInfoInstance *)v6 initForClientName:v7 withProcessName:v8 withProcessID:v9 usingAssetSelector:v10 associatingFrameworkUUID:v11];

    id v13 = [MAAutoAssetInfoDesire alloc];
    id v14 = [*(id *)(a1 + 32) updateCategoryDesiredByClient];
    id v15 = [(MAAutoAssetInfoDesire *)v13 initWithDesiredCategory:v14 forClientAssetPolicy:*(void *)(a1 + 40) reasonDesired:*(void *)(a1 + 48) withCheckWaitTimeout:v5 withLockWaitTimeout:*(void *)(a1 + 72) desiringProgress:*(void *)(a1 + 56) != 0];

    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v17 = +[MAAutoAsset frameworkInstanceUUID];
    char v18 = [v17 UUIDString];

    [v16 setSafeObject:v12 forKey:@"instance"];
    [v16 setSafeObject:v15 forKey:@"desire"];
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO:LOCK_CONTENT" clientID:v18 version:0 message:v16];
    id v20 = (void *)[*(id *)(a1 + 32) _newProxyObjectForLockProgressBlock:*(void *)(a1 + 56)];
    id v21 = (void *)__maAutoAssetSharedConnectionClient;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __84__MAAutoAsset_lockContent_withUsagePolicy_withTimeout_reportingProgress_completion___block_invoke_2;
    void v24[3] = &unk_1E6005540;
    uint64_t v22 = *(void *)(a1 + 32);
    id v25 = v20;
    uint64_t v26 = v22;
    id v27 = *(id *)(a1 + 64);
    id v23 = v20;
    [v21 connectClientSendServerMessage:v19 proxyObject:v23 withReply:v24];
  }
}

void __84__MAAutoAsset_lockContent_withUsagePolicy_withTimeout_reportingProgress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  if (!v18 || v5)
  {
    if (v5)
    {
      id v15 = @"failure reported by server";
      uint64_t v16 = 0;
      id v17 = v5;
    }
    else
    {
      id v15 = @"no response message from server";
      uint64_t v16 = 6104;
      id v17 = 0;
    }
    [*(id *)(a1 + 40) _failedLockContent:v16 withResponseError:v17 description:v15 completion:*(void *)(a1 + 48)];
  }
  else
  {
    id v6 = [v18 message];
    uint64_t v7 = [v6 safeObjectForKey:@"found" ofClass:objc_opt_class()];

    uint64_t v8 = [v18 message];
    uint64_t v9 = [v8 safeObjectForKey:@"desire" ofClass:objc_opt_class()];

    id v10 = [v18 message];
    long long v11 = [v10 safeStringForKey:@"sandboxExtensionKey"];

    id v12 = [v18 message];
    id v13 = [v12 safeStringForKey:@"sandboxExtensionPathKey"];

    id v14 = *(void **)(a1 + 40);
    if (v7) {
      [v14 _successLockContent:v7 dueToDesire:v9 sandboxExtension:v11 sandboxExtensionPath:v13 completion:*(void *)(a1 + 48)];
    }
    else {
      [v14 _failedLockContent:6104 withResponseError:0 description:@"no found-information provided by server" completion:*(void *)(a1 + 48)];
    }
  }
}

- (id)lockContentSync:(id)a3 withTimeout:(int64_t)a4 lockedAssetSelector:(id *)a5 newerInProgress:(id *)a6 error:(id *)a7
{
  return [(MAAutoAsset *)self lockContentSync:a3 withUsagePolicy:0 withTimeout:a4 lockedAssetSelector:a5 newerInProgress:a6 error:a7 reportingProgress:0];
}

- (id)lockContentSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 lockedAssetSelector:(id *)a6 newerInProgress:(id *)a7 error:(id *)a8
{
  return [(MAAutoAsset *)self lockContentSync:a3 withUsagePolicy:a4 withTimeout:a5 lockedAssetSelector:a6 newerInProgress:a7 error:a8 reportingProgress:0];
}

- (id)lockContentSync:(id)a3 withTimeout:(int64_t)a4 lockedAssetSelector:(id *)a5 newerInProgress:(id *)a6 error:(id *)a7 reportingProgress:(id)a8
{
  return [(MAAutoAsset *)self lockContentSync:a3 withUsagePolicy:0 withTimeout:a4 lockedAssetSelector:a5 newerInProgress:a6 error:a7 reportingProgress:a8];
}

- (id)lockContentSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 lockedAssetSelector:(id *)a6 newerInProgress:(id *)a7 error:(id *)a8 reportingProgress:(id)a9
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a9;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__5;
  v61 = __Block_byref_object_dispose__5;
  id v62 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  char v56 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  id v52 = __Block_byref_object_copy__5;
  v53 = __Block_byref_object_dispose__5;
  id v54 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  id v46 = __Block_byref_object_copy__5;
  uint64_t v47 = __Block_byref_object_dispose__5;
  id v48 = 0;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__5;
  uint64_t v41 = __Block_byref_object_dispose__5;
  id v42 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  char v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 0;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __119__MAAutoAsset_lockContentSync_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error_reportingProgress___block_invoke;
  void v24[3] = &unk_1E60055B8;
  uint64_t v26 = v33;
  id v27 = &v57;
  uint64_t v28 = v55;
  uint64_t v29 = &v49;
  uint64_t v30 = &v43;
  id v31 = &v37;
  id v32 = v35;
  id v15 = v14;
  id v25 = v15;
  [(MAAutoAsset *)self lockContent:v11 withUsagePolicy:v12 withTimeout:a5 reportingProgress:v13 completion:v24];
  if (+[MAAutoAsset waitOnSemaphore:v15 withDaemonTriggeredTimeout:a5])
  {
    uint64_t v16 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __119__MAAutoAsset_lockContentSync_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error_reportingProgress___block_invoke_3;
    block[3] = &unk_1E60055E0;
    void block[4] = v35;
    block[5] = v33;
    block[6] = &v57;
    block[7] = v55;
    void block[8] = &v49;
    block[9] = &v43;
    block[10] = &v37;
    dispatch_sync(v16, block);
  }
  if (a6) {
    *a6 = (id) v58[5];
  }
  if (a7) {
    *a7 = (id) v44[5];
  }
  if (a8) {
    *a8 = (id) v38[5];
  }
  id v17 = (id)v50[5];

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(v55, 8);
  _Block_object_dispose(&v57, 8);

  return v17;
}

void __119__MAAutoAsset_lockContentSync_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error_reportingProgress___block_invoke(_OWORD *a1, void *a2, char a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v16 = a1[4];
  long long v17 = a1[5];
  long long v23 = a1[2];
  long long v30 = a1[3];
  long long v31 = v16;
  long long v32 = v17;
  block[2] = __119__MAAutoAsset_lockContentSync_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error_reportingProgress___block_invoke_2;
  block[3] = &unk_1E6005590;
  char v33 = a3;
  id v25 = v11;
  id v26 = v12;
  id v27 = v13;
  id v28 = v14;
  id v18 = (id)v23;
  long long v29 = v23;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  id v22 = v11;
  dispatch_sync(v15, block);
}

intptr_t __119__MAAutoAsset_lockContentSync_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error_reportingProgress___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 72) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 80) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 88) + 8) + 24) = *(unsigned char *)(v1 + 128);
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 96) + 8) + 40), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 104) + 8) + 40), *(id *)(v1 + 48));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 112) + 8) + 40), *(id *)(v1 + 56));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 120) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 64);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__119__MAAutoAsset_lockContentSync_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error_reportingProgress___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    char v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    *(unsigned char *)(*(void *)(v1[7] + 8) + 24) = 0;
    uint64_t v4 = *(void *)(v1[8] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    uint64_t v6 = *(void *)(v1[9] + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;

    *(void *)(*(void *)(v1[10] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(lockContentSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for lock-content to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)mapLockedContent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__MAAutoAsset_mapLockedContent_completion___block_invoke;
    v10[3] = &unk_1E60041F8;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v10];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset mapLockedContent:completion:]();
    }
  }
}

void __43__MAAutoAsset_mapLockedContent_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    char v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedMapLockedContent:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    uint64_t v9 = [*(id *)(a1 + 32) assetSelector];
    id v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = [MAAutoAssetInfoDesire alloc];
    id v13 = [*(id *)(a1 + 32) updateCategoryDesiredByClient];
    id v14 = [(MAAutoAssetInfoDesire *)v12 initWithDesiredCategory:v13 forClientAssetPolicy:0 reasonDesired:*(void *)(a1 + 40) withCheckWaitTimeout:0 withLockWaitTimeout:0 desiringProgress:0];

    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v16 = +[MAAutoAsset frameworkInstanceUUID];
    long long v17 = [v16 UUIDString];

    [v15 setSafeObject:v11 forKey:@"instance"];
    [v15 setSafeObject:v14 forKey:@"desire"];
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO:MAP_LOCKED_CONTENT_TO_EXCLAVE" clientID:v17 version:0 message:v15];
    id v19 = (void *)__maAutoAssetSharedConnectionClient;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __43__MAAutoAsset_mapLockedContent_completion___block_invoke_2;
    void v20[3] = &unk_1E6004158;
    v20[4] = *(void *)(a1 + 32);
    id v21 = *(id *)(a1 + 48);
    [v19 connectClientSendServerMessage:v18 proxyObject:0 withReply:v20];
  }
}

void __43__MAAutoAsset_mapLockedContent_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (!v14 || v5)
  {
    if (v5)
    {
      id v11 = @"failure reported by server";
      uint64_t v12 = 0;
      id v13 = v5;
    }
    else
    {
      id v11 = @"no response message from server";
      uint64_t v12 = 6104;
      id v13 = 0;
    }
    [*(id *)(a1 + 32) _failedMapLockedContent:v12 withResponseError:v13 description:v11 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v14 message];
    uint64_t v7 = [v6 safeObjectForKey:@"found" ofClass:objc_opt_class()];

    uint64_t v8 = [v14 message];
    uint64_t v9 = [v8 safeObjectForKey:@"desire" ofClass:objc_opt_class()];

    id v10 = *(void **)(a1 + 32);
    if (v7) {
      [v10 _successMapLockedContent:v7 dueToDesire:v9 completion:*(void *)(a1 + 40)];
    }
    else {
      [v10 _failedMapLockedContent:6104 withResponseError:0 description:@"no found-information provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

- (id)mapLockedContentSync:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  long long v32 = __Block_byref_object_copy__5;
  char v33 = __Block_byref_object_dispose__5;
  id v34 = 0;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__5;
  id v27 = __Block_byref_object_dispose__5;
  id v28 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __42__MAAutoAsset_mapLockedContentSync_error___block_invoke;
  v13[3] = &unk_1E60053B0;
  id v15 = v19;
  long long v16 = &v29;
  long long v17 = &v23;
  id v18 = v21;
  uint64_t v8 = v7;
  id v14 = v8;
  [(MAAutoAsset *)self mapLockedContent:v6 completion:v13];
  if (+[MAAutoAsset waitOnSemaphore:v8 withDaemonTriggeredTimeout:-100])
  {
    uint64_t v9 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__MAAutoAsset_mapLockedContentSync_error___block_invoke_3;
    block[3] = &unk_1E60053D8;
    void block[4] = v21;
    block[5] = v19;
    block[6] = &v29;
    block[7] = &v23;
    dispatch_sync(v9, block);
  }
  if (a4) {
    *a4 = (id) v24[5];
  }
  id v10 = (id)v30[5];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v10;
}

void __42__MAAutoAsset_mapLockedContentSync_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_semaphore_t v7 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __42__MAAutoAsset_mapLockedContentSync_error___block_invoke_2;
  block[3] = &unk_1E60040E0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v17 = *(void *)(a1 + 64);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

intptr_t __42__MAAutoAsset_mapLockedContentSync_error___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__42__MAAutoAsset_mapLockedContentSync_error___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    char v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    *(void *)(*(void *)(v1[7] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(mapLockedContentSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for map-locked-content to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)continueLockUsage:(id)a3 completion:(id)a4
{
}

- (void)continueLockUsage:(id)a3 withUsagePolicy:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__MAAutoAsset_continueLockUsage_withUsagePolicy_completion___block_invoke;
    v13[3] = &unk_1E60041A8;
    void v13[4] = self;
    id v14 = v9;
    id v15 = v8;
    id v16 = v10;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v13];
  }
  else
  {
    long long v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v12 = [v11 oslog];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset continueLockUsage:withUsagePolicy:completion:]();
    }
  }
}

void __60__MAAutoAsset_continueLockUsage_withUsagePolicy_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    char v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 56);
    [v3 _failedContinueLockUsage:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) contentLockedSelector];
    id v10 = *(void **)(a1 + 32);
    if (v9) {
      [v10 contentLockedSelector];
    }
    else {
    long long v11 = [v10 assetSelector];
    }
    uint64_t v12 = +[MAAutoAsset frameworkInstanceUUID];
    id v13 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v11 associatingFrameworkUUID:v12];

    id v14 = [MAAutoAssetInfoDesire alloc];
    id v15 = [*(id *)(a1 + 32) updateCategoryDesiredByClient];
    id v16 = [(MAAutoAssetInfoDesire *)v14 initWithDesiredCategory:v15 forClientAssetPolicy:*(void *)(a1 + 40) reasonDesired:*(void *)(a1 + 48) withCheckWaitTimeout:-101 withLockWaitTimeout:-101 desiringProgress:0];

    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v18 = +[MAAutoAsset frameworkInstanceUUID];
    id v19 = [v18 UUIDString];

    [v17 setSafeObject:v13 forKey:@"instance"];
    [v17 setSafeObject:v16 forKey:@"desire"];
    char v20 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO:CONTINUE_LOCK_USAGE" clientID:v19 version:0 message:v17];
    id v21 = (void *)__maAutoAssetSharedConnectionClient;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __60__MAAutoAsset_continueLockUsage_withUsagePolicy_completion___block_invoke_2;
    void v22[3] = &unk_1E6004158;
    v22[4] = *(void *)(a1 + 32);
    id v23 = *(id *)(a1 + 56);
    [v21 connectClientSendServerMessage:v20 proxyObject:0 withReply:v22];
  }
}

void __60__MAAutoAsset_continueLockUsage_withUsagePolicy_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v12 || v5)
  {
    if (v5)
    {
      uint64_t v8 = @"failure reported by server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 0;
      id v11 = v5;
    }
    else
    {
      uint64_t v8 = @"no response message from server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 6104;
      id v11 = 0;
    }
    [v9 _failedContinueLockUsage:v10 withResponseError:v11 description:v8 completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) assetSelector];
    [v6 _successContinueLockUsage:v7 completion:*(void *)(a1 + 40)];
  }
}

- (id)continueLockUsageSync:(id)a3
{
  return [(MAAutoAsset *)self continueLockUsageSync:a3 withUsagePolicy:0];
}

- (id)continueLockUsageSync:(id)a3 withUsagePolicy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__5;
  v30[4] = __Block_byref_object_dispose__5;
  id v31 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__5;
  id v28 = __Block_byref_object_dispose__5;
  id v29 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__MAAutoAsset_continueLockUsageSync_withUsagePolicy___block_invoke;
  v14[3] = &unk_1E60053B0;
  id v16 = v20;
  id v17 = v30;
  id v18 = &v24;
  id v19 = v22;
  id v9 = v8;
  id v15 = v9;
  [(MAAutoAsset *)self continueLockUsage:v6 withUsagePolicy:v7 completion:v14];
  if (+[MAAutoAsset waitOnSemaphore:v9 withDaemonTriggeredTimeout:-100])
  {
    uint64_t v10 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__MAAutoAsset_continueLockUsageSync_withUsagePolicy___block_invoke_3;
    block[3] = &unk_1E60053D8;
    void block[4] = v22;
    block[5] = v20;
    block[6] = v30;
    block[7] = &v24;
    dispatch_sync(v10, block);
  }
  id v11 = (id)v25[5];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(v30, 8);
  return v11;
}

void __53__MAAutoAsset_continueLockUsageSync_withUsagePolicy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __53__MAAutoAsset_continueLockUsageSync_withUsagePolicy___block_invoke_2;
  block[3] = &unk_1E60040E0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v17 = *(void *)(a1 + 64);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

intptr_t __53__MAAutoAsset_continueLockUsageSync_withUsagePolicy___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__53__MAAutoAsset_continueLockUsageSync_withUsagePolicy___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    char v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    *(void *)(*(void *)(v1[7] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(contniueLockUsageSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for continue-lock-usage to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)endLockUsage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__MAAutoAsset_endLockUsage_completion___block_invoke;
    v10[3] = &unk_1E60041F8;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v10];
  }
  else
  {
    id v8 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset endLockUsage:completion:]();
    }
  }
}

void __39__MAAutoAsset_endLockUsage_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    char v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedEndLockUsage:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) contentLockedSelector];
    id v10 = *(void **)(a1 + 32);
    if (v9) {
      [v10 contentLockedSelector];
    }
    else {
    id v11 = [v10 assetSelector];
    }
    id v12 = +[MAAutoAsset frameworkInstanceUUID];
    id v13 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v11 associatingFrameworkUUID:v12];

    id v14 = [[MAAutoAssetInfoEnd alloc] initWithLockReason:*(void *)(a1 + 40) endingLockCount:1];
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v16 = +[MAAutoAsset frameworkInstanceUUID];
    uint64_t v17 = [v16 UUIDString];

    [v15 setSafeObject:v13 forKey:@"instance"];
    [v15 setSafeObject:v14 forKey:@"end"];
    id v18 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO:END_LOCK_USAGE" clientID:v17 version:0 message:v15];
    id v19 = (void *)__maAutoAssetSharedConnectionClient;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __39__MAAutoAsset_endLockUsage_completion___block_invoke_2;
    void v20[3] = &unk_1E6004158;
    v20[4] = *(void *)(a1 + 32);
    id v21 = *(id *)(a1 + 48);
    [v19 connectClientSendServerMessage:v18 proxyObject:0 withReply:v20];
  }
}

void __39__MAAutoAsset_endLockUsage_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v12 || v5)
  {
    if (v5)
    {
      uint64_t v8 = @"failure reported by server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 0;
      id v11 = v5;
    }
    else
    {
      uint64_t v8 = @"no response message from server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 6104;
      id v11 = 0;
    }
    [v9 _failedEndLockUsage:v10 withResponseError:v11 description:v8 completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) assetSelector];
    [v6 _successEndLockUsage:v7 completion:*(void *)(a1 + 40)];
  }
}

- (id)endLockUsageSync:(id)a3
{
  id v4 = a3;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__5;
  v27[4] = __Block_byref_object_dispose__5;
  id v28 = 0;
  uint64_t v21 = 0;
  char v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__5;
  uint64_t v25 = __Block_byref_object_dispose__5;
  id v26 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__MAAutoAsset_endLockUsageSync___block_invoke;
  v11[3] = &unk_1E60053B0;
  id v13 = v17;
  id v14 = v27;
  id v15 = &v21;
  long long v16 = v19;
  id v6 = v5;
  id v12 = v6;
  [(MAAutoAsset *)self endLockUsage:v4 completion:v11];
  if (+[MAAutoAsset waitOnSemaphore:v6 withDaemonTriggeredTimeout:-100])
  {
    uint64_t v7 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__MAAutoAsset_endLockUsageSync___block_invoke_3;
    block[3] = &unk_1E60053D8;
    void block[4] = v19;
    block[5] = v17;
    block[6] = v27;
    block[7] = &v21;
    dispatch_sync(v7, block);
  }
  id v8 = (id)v22[5];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(v27, 8);
  return v8;
}

void __32__MAAutoAsset_endLockUsageSync___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 48);
  block[2] = __32__MAAutoAsset_endLockUsageSync___block_invoke_2;
  block[3] = &unk_1E60040E0;
  id v13 = v5;
  id v14 = v6;
  uint64_t v17 = *(void *)(a1 + 64);
  id v8 = (id)v11;
  long long v15 = v11;
  id v9 = v6;
  id v10 = v5;
  dispatch_sync(v7, block);
}

intptr_t __32__MAAutoAsset_endLockUsageSync___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__32__MAAutoAsset_endLockUsageSync___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    char v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    *(void *)(*(void *)(v1[7] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(endLockUsageSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for end-lock-usage to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

- (id)assetAttribute:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = [(MAAutoAsset *)self assetAttributes];
    id v6 = [v5 objectForKey:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  char v3 = NSString;
  id v4 = [(MAAutoAsset *)self summary];
  id v5 = [(MAAutoAsset *)self assetAttributes];
  id v6 = [v3 stringWithFormat:@"%@|attribs:%@", v4, v5];

  return (NSString *)v6;
}

- (id)summary
{
  char v3 = [(MAAutoAsset *)self updateCategoryDesiredByClient];

  if (v3)
  {
    id v4 = [NSString alloc];
    id v5 = [(MAAutoAsset *)self updateCategoryDesiredByClient];
    id v6 = (__CFString *)[v4 initWithFormat:@"desired:%@", v5];
  }
  else
  {
    id v6 = @"byPolicy";
  }
  uint64_t v7 = [(MAAutoAsset *)self contentLockedSelector];
  if (v7
    || ([(MAAutoAsset *)self contentLockedReason],
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_7:
    id v8 = [NSString alloc];
    id v9 = [(MAAutoAsset *)self contentLockedSelector];
    id v10 = [v9 summary];
    long long v11 = [(MAAutoAsset *)self contentLockedReason];
    id v12 = [(MAAutoAsset *)self localContentURL];
    id v13 = [v12 path];
    id v14 = (__CFString *)[v8 initWithFormat:@"locked:%@(%@)|URL:%@", v10, v11, v13];

    goto LABEL_8;
  }
  uint64_t v23 = [(MAAutoAsset *)self localContentURL];

  if (v23) {
    goto LABEL_7;
  }
  id v14 = @"unlocked";
LABEL_8:
  long long v15 = NSString;
  long long v16 = [(MAAutoAsset *)self autoAssetClientName];
  uint64_t v17 = [(MAAutoAsset *)self assetSelector];
  char v18 = [v17 summary];
  id v19 = [(MAAutoAsset *)self assetAttributes];
  char v20 = @"(w/attribs)";
  if (!v19) {
    char v20 = &stru_1F0A75970;
  }
  uint64_t v21 = [v15 stringWithFormat:@"%@(%@)|%@|%@%@", v16, v18, v6, v14, v20];

  return v21;
}

- (void)connectToServerFrameworkCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__5;
  id v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__MAAutoAsset_connectToServerFrameworkCompletion___block_invoke;
  v5[3] = &unk_1E6005608;
  v5[4] = self;
  v5[5] = &v6;
  if (__maAutoAssetSharedDispatchOnce != -1) {
    dispatch_once(&__maAutoAssetSharedDispatchOnce, v5);
  }
  v4[2](v4, v7[5]);
  _Block_object_dispose(&v6, 8);
}

void __50__MAAutoAsset_connectToServerFrameworkCompletion___block_invoke(uint64_t a1)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  intptr_t v1 = +[MAAutoAsset frameworkInstanceUUID];
  id v31 = [v1 UUIDString];

  id v29 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  id v12 = objc_msgSend(v29, "setWithObjects:", v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  uint64_t v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
  id v14 = (void *)__maAutoAssetSharedClientProcessName;
  __maAutoAssetSharedClientProcessName = v13;

  __maAutoAssetSharedClientProcessID = getpid();
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO:INTEREST_IN_CONTENT"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO:CHECK_FOR_NEWER"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO:DETERMINE_IF_AVAILABLE"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO:CURRENT_STATUS"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO:LOCK_CONTENT"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO:MAP_LOCKED_CONTENT_TO_EXCLAVE"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO:CONTINUE_LOCK_USAGE"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO:END_LOCK_USAGE"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO:END_PREVIOUS_LOCKS"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO:END_ALL_PREVIOUS_LOCKS"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO:CANCEL_ACTIVITY_FOR_SELECTOR"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO:ELIMINATE_ALL_FOR_SELECTOR"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO:ELIMINATE_ALL_FOR_ASSET_TYPE"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO:ELIMINATE_PROMOTED_NEVER_LOCKED_FOR_SELECTOR"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE:DETERMINE_GROUPS_AVAILABLE_FOR_UPDATE"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE_FOR_UPDATE"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE:DOWNLOAD_GROUPS"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE:DOWNLOAD_ALL"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE:CANCEL_OPERATION"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE:PURGE_ALL"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE:ERASE_ALL"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):INTEREST_IN_CONTENT"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):CHECK_FOR_NEWER"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):DETERMINE_IF_AVAILABLE"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):CURRENT_STATUS"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):LOCK_CONTENT"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):MAP_LOCKED_CONTENT_TO_EXCLAVE"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):CONTINUE_LOCK_USAGE"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):END_LOCK_USAGE"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):END_PREVIOUS_LOCKS"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):END_ALL_PREVIOUS_LOCKS"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):CANCEL_ACTIVITY_FOR_SELECTOR"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):ELIMINATE_ALL_FOR_SELECTOR"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):ELIMINATE_ALL_FOR_ASSET_TYPE"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):ELIMINATE_PROMOTED_NEVER_LOCKED_FOR_SELECTOR"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE(REPLY):DETERMINE_GROUPS_AVAILABLE_FOR_UPDATE"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE(REPLY):DETERMINE_ALL_AVAILABLE_FOR_UPDATE"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE(REPLY):DETERMINE_ALL_AVAILABLE"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE(REPLY):DOWNLOAD_GROUPS"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE(REPLY):DOWNLOAD_ALL"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE(REPLY):CANCEL_OPERATION"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE(REPLY):PURGE_ALL"];
  [MEMORY[0x1E4FA56A8] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE(REPLY):ERASE_ALL"];
  long long v15 = [MEMORY[0x1E4FA56C8] sharedLogger];
  long long v16 = [v15 oslog];

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B275B000, v16, OS_LOG_TYPE_DEFAULT, "MA-auto{connectToServerFrameworkCompletion} set all the allowlisted classes for the client policy for all delegate callbacks", buf, 2u);
  }

  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4FA56A8]) initForServiceName:@"com.apple.mobileasset.autoasset" delegate:*(void *)(a1 + 32) clientID:v31];
  char v18 = (void *)MEMORY[0x1E4F1CAD0];
  v33[0] = objc_opt_class();
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  char v20 = [v18 setWithArray:v19];
  [v17 setProxyObjectClasses:v20];

  uint64_t v21 = [objc_alloc(MEMORY[0x1E4FA56A0]) initWithClientPolicy:v17];
  char v22 = (void *)__maAutoAssetSharedConnectionClient;
  __maAutoAssetSharedConnectionClient = v21;

  if (__maAutoAssetSharedConnectionClient)
  {
    uint64_t v23 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v24 = [v23 oslog];

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B275B000, v24, OS_LOG_TYPE_DEFAULT, "MA-auto{connectToServerFrameworkCompletion} connection client initialized for server connection", buf, 2u);
    }
  }
  else
  {
    uint64_t v25 = +[MAAutoAssetError buildError:6104 fromOperation:@"auto(connectToServerFrameworkCompletion)" underlyingError:0 withDescription:@"unable to create shared SUCoreConnectClient for the client process"];
    uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8);
    id v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;

    id v28 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v24 = [v28 oslog];

    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __50__MAAutoAsset_connectToServerFrameworkCompletion___block_invoke_cold_1();
    }
  }
}

- (id)_newProxyObjectForLockProgressBlock:(id)a3
{
  id v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3042000000;
  v15[3] = __Block_byref_object_copy__634;
  v15[4] = __Block_byref_object_dispose__635;
  objc_initWeak(&v16, self);
  id v5 = objc_alloc(MEMORY[0x1E4FA56B0]);
  uint64_t v6 = +[MAAutoAsset frameworkInstanceUUID];
  uint64_t v7 = [v6 UUIDString];
  uint64_t v8 = +[MAAutoAsset frameworkDispatchQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke;
  v12[3] = &unk_1E6005630;
  id v14 = v15;
  id v9 = v4;
  id v13 = v9;
  uint64_t v10 = (void *)[v5 initWithClientID:v7 completionQueue:v8 genericBlock:v12];

  _Block_object_dispose(v15, 8);
  objc_destroyWeak(&v16);

  return v10;
}

void __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MAAutoAsset frameworkDispatchQueue];
  dispatch_assert_queue_V2(v4);

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  if (!WeakRetained)
  {
    uint64_t v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke_cold_1();
    }
    goto LABEL_11;
  }
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v7 = [v8 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke_cold_2();
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v7 = [v9 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke_cold_3();
    }
LABEL_11:

    goto LABEL_12;
  }
  [WeakRetained _lockContentStatusProgress:v3 lockForUseError:0 progressBlock:*(void *)(a1 + 32)];
LABEL_12:
}

- (id)_newProxyObjectForStageProgressBlock:(id)a3
{
  id v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3042000000;
  v15[3] = __Block_byref_object_copy__634;
  v15[4] = __Block_byref_object_dispose__635;
  objc_initWeak(&v16, self);
  id v5 = objc_alloc(MEMORY[0x1E4FA56B0]);
  uint64_t v6 = +[MAAutoAsset frameworkInstanceUUID];
  uint64_t v7 = [v6 UUIDString];
  uint64_t v8 = +[MAAutoAsset frameworkDispatchQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke;
  v12[3] = &unk_1E6005630;
  id v14 = v15;
  id v9 = v4;
  id v13 = v9;
  uint64_t v10 = (void *)[v5 initWithClientID:v7 completionQueue:v8 genericBlock:v12];

  _Block_object_dispose(v15, 8);
  objc_destroyWeak(&v16);

  return v10;
}

void __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[MAAutoAsset frameworkDispatchQueue];
  dispatch_assert_queue_V2(v4);

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  if (!WeakRetained)
  {
    uint64_t v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke_cold_1();
    }
    goto LABEL_11;
  }
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v7 = [v8 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke_cold_2();
    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v7 = [v9 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke_cold_3();
    }
LABEL_11:

    goto LABEL_12;
  }
  [WeakRetained _lockContentStatusProgress:v3 lockForUseError:0 progressBlock:*(void *)(a1 + 32)];
LABEL_12:
}

- (void)_successInterestInContent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [(MAAutoAsset *)self completionDispatchQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__MAAutoAsset__successInterestInContent_completion___block_invoke;
    v11[3] = &unk_1E6004240;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v8, v11);

    id v9 = v12;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v9 = [v10 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _successInterestInContent:completion:](v6);
    }
  }
}

uint64_t __52__MAAutoAsset__successInterestInContent_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) summary];
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto{_successInterestInContent} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_failedInterestInContent:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__MAAutoAsset__failedInterestInContent_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004E68;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }
  else
  {
    id v15 = [NSString alloc];
    if (v10)
    {
      id v16 = [v10 checkedSummary];
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }
    else
    {
      id v16 = +[MAAutoAssetError summaryForCode:a3 fromOperation:@"interestInContent"];
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }
    id v14 = (void *)v17;

    char v18 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedInterestInContent:withResponseError:description:completion:]();
    }
  }
}

void __81__MAAutoAsset__failedInterestInContent_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:v5 fromOperation:@"auto(interestInContent)" underlyingError:0 withDescription:*(void *)(a1 + 40)], (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __81__MAAutoAsset__failedInterestInContent_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    int v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v6 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedInterestInContent} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    id v2 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_successCheckForNewer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(MAAutoAsset *)self localContentURL];

  if (v8)
  {
    if (v7)
    {
LABEL_3:
      uint64_t v9 = [(MAAutoAsset *)self completionDispatchQueue];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __48__MAAutoAsset__successCheckForNewer_completion___block_invoke;
      v14[3] = &unk_1E6004240;
      id v15 = v6;
      id v16 = v7;
      dispatch_async(v9, v14);

      uint64_t v10 = v15;
      goto LABEL_7;
    }
  }
  else
  {
    id v11 = [v6 currentStatus];
    id v12 = [v11 newerVersionAttributes];
    [(MAAutoAsset *)self setAssetAttributes:v12];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v13 = [MEMORY[0x1E4FA56C8] sharedLogger];
  uint64_t v10 = [v13 oslog];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[MAAutoAsset _successCheckForNewer:completion:](v6);
  }
LABEL_7:
}

void __48__MAAutoAsset__successCheckForNewer_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) currentStatus];
  id v3 = [v2 newerVersionAttributes];

  id v4 = [MEMORY[0x1E4FA56C8] sharedLogger];
  uint64_t v5 = [v4 oslog];

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) summary];
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl(&dword_1B275B000, v5, OS_LOG_TYPE_DEFAULT, "MA-auto{_successCheckForNewer} | %{public}@ | SUCCESS", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = [*(id *)(a1 + 32) fullAssetSelector];
  uint64_t v9 = [*(id *)(a1 + 32) currentStatus];
  uint64_t v10 = [v9 newerVersionAttributes];
  (*(void (**)(uint64_t, void *, BOOL, void *, void))(v7 + 16))(v7, v8, v3 != 0, v10, 0);
}

- (void)_failedCheckForNewer:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    uint64_t v13 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__MAAutoAsset__failedCheckForNewer_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004268;
    void block[4] = self;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);
  }
  else
  {
    id v14 = [NSString alloc];
    if (v10)
    {
      id v15 = [v10 checkedSummary];
      uint64_t v16 = [v14 initWithFormat:@"%@ | error:%@", v11, v15];
    }
    else
    {
      id v15 = +[MAAutoAssetError summaryForCode:a3 fromOperation:@"checkForNewer"];
      uint64_t v16 = [v14 initWithFormat:@"%@ | result:%@", v11, v15];
    }
    uint64_t v17 = (void *)v16;

    char v18 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedCheckForNewer:withResponseError:description:completion:]();
    }
  }
}

void __77__MAAutoAsset__failedCheckForNewer_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) assetSelector];
  id v3 = *(id *)(a1 + 40);
  if (v3
    || (uint64_t v7 = *(void *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:v7 fromOperation:@"auto(checkForNewer)" underlyingError:0 withDescription:*(void *)(a1 + 48)], (id v3 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v5 = [v4 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __77__MAAutoAsset__failedCheckForNewer_withResponseError_description_completion___block_invoke_cold_1(a1, v3);
    }

    id v6 = v2;
    id v2 = 0;
  }
  else
  {
    int v8 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v6 = [v8 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1B275B000, v6, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedCheckForNewer} | %{public}@ | SUCCESS", (uint8_t *)&v10, 0xCu);
    }
    id v3 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_successDetermineIfAvailable:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(MAAutoAsset *)self localContentURL];

  if (v8)
  {
    if (v7)
    {
LABEL_3:
      uint64_t v9 = [(MAAutoAsset *)self completionDispatchQueue];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __55__MAAutoAsset__successDetermineIfAvailable_completion___block_invoke;
      v14[3] = &unk_1E6004240;
      id v15 = v6;
      id v16 = v7;
      dispatch_async(v9, v14);

      int v10 = v15;
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v11 = [v6 assetAttributes];
    [(MAAutoAsset *)self setAssetAttributes:v11];

    uint64_t v12 = [v6 localContentURL];
    [(MAAutoAsset *)self setLocalContentURL:v12];

    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = [MEMORY[0x1E4FA56C8] sharedLogger];
  int v10 = [v13 oslog];

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[MAAutoAsset _successDetermineIfAvailable:completion:](v6);
  }
LABEL_7:
}

void __55__MAAutoAsset__successDetermineIfAvailable_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) summary];
    int v8 = 138543362;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto{_successDetermineIfAvailable} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) fullAssetSelector];
  id v7 = [*(id *)(a1 + 32) assetAttributes];
  (*(void (**)(uint64_t, void *, void *, void))(v5 + 16))(v5, v6, v7, 0);
}

- (void)_failedDetermineIfAvailable:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    uint64_t v13 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__MAAutoAsset__failedDetermineIfAvailable_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004268;
    void block[4] = self;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);
  }
  else
  {
    id v14 = [NSString alloc];
    if (v10)
    {
      id v15 = [v10 checkedSummary];
      uint64_t v16 = [v14 initWithFormat:@"%@ | error:%@", v11, v15];
    }
    else
    {
      id v15 = +[MAAutoAssetError summaryForCode:a3 fromOperation:@"determineIfAvailable"];
      uint64_t v16 = [v14 initWithFormat:@"%@ | result:%@", v11, v15];
    }
    uint64_t v17 = (void *)v16;

    char v18 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedDetermineIfAvailable:withResponseError:description:completion:]();
    }
  }
}

void __84__MAAutoAsset__failedDetermineIfAvailable_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) assetSelector];
  id v3 = *(id *)(a1 + 40);
  if (v3
    || (uint64_t v7 = *(void *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:v7 fromOperation:@"auto(determineIfAvailable)" underlyingError:0 withDescription:*(void *)(a1 + 48)], (id v3 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v5 = [v4 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __84__MAAutoAsset__failedDetermineIfAvailable_withResponseError_description_completion___block_invoke_cold_1(a1, v3);
    }

    id v6 = v2;
    id v2 = 0;
  }
  else
  {
    int v8 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v6 = [v8 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1B275B000, v6, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedDetermineIfAvailable} | %{public}@ | SUCCESS", (uint8_t *)&v10, 0xCu);
    }
    id v3 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_successCurrentStatus:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = [(MAAutoAsset *)self completionDispatchQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__MAAutoAsset__successCurrentStatus_completion___block_invoke;
    v11[3] = &unk_1E60042B8;
    uint64_t v13 = v7;
    id v12 = v6;
    dispatch_async(v8, v11);

    uint64_t v9 = v13;
  }
  else
  {
    int v10 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v9 = [v10 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _successCurrentStatus:completion:](v6);
    }
  }
}

void __48__MAAutoAsset__successCurrentStatus_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) currentStatus];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)_failedCurrentStatus:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    uint64_t v13 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__MAAutoAsset__failedCurrentStatus_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004E68;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }
  else
  {
    id v15 = [NSString alloc];
    if (v10)
    {
      uint64_t v16 = [v10 checkedSummary];
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }
    else
    {
      uint64_t v16 = +[MAAutoAssetError summaryForCode:a3 fromOperation:@"currentStatus"];
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }
    id v14 = (void *)v17;

    char v18 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedCurrentStatus:withResponseError:description:completion:]();
    }
  }
}

void __77__MAAutoAsset__failedCurrentStatus_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:v5 fromOperation:@"auto(currentStatus)" underlyingError:0 withDescription:*(void *)(a1 + 40)], (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__MAAutoAsset__failedCurrentStatus_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v6 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedCurrentStatus} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    id v2 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_lockContentStatusProgress:(id)a3 lockForUseError:(id)a4 progressBlock:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = +[MAAutoAsset frameworkDispatchQueue];
  dispatch_assert_queue_V2(v9);

  if (v8)
  {
    uint64_t v10 = [(MAAutoAsset *)self completionDispatchQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__MAAutoAsset__lockContentStatusProgress_lockForUseError_progressBlock___block_invoke;
    v14[3] = &unk_1E60042B8;
    uint64_t v16 = v8;
    id v15 = v7;
    dispatch_async(v10, v14);

    id v11 = v16;
  }
  else
  {
    id v12 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v11 = [v12 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [v7 summary];
      *(_DWORD *)buf = 138543362;
      char v18 = v13;
      _os_log_impl(&dword_1B275B000, v11, OS_LOG_TYPE_DEFAULT, "MA-auto{_lockContentStatusProgress} | no client progress block | %{public}@", buf, 0xCu);
    }
  }
}

uint64_t __72__MAAutoAsset__lockContentStatusProgress_lockForUseError_progressBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_successLockContent:(id)a3 dueToDesire:(id)a4 sandboxExtension:(id)a5 sandboxExtensionPath:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v17 = +[MAAutoAsset frameworkDispatchQueue];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __96__MAAutoAsset__successLockContent_dueToDesire_sandboxExtension_sandboxExtensionPath_completion___block_invoke;
  v23[3] = &unk_1E6005658;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v16;
  id v21 = v13;
  id v22 = v12;
  dispatch_sync(v17, v23);
}

void __96__MAAutoAsset__successLockContent_dueToDesire_sandboxExtension_sandboxExtensionPath_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  id v3 = [*(id *)(a1 + 40) currentStatus];
  id v4 = [v3 newerVersionAttributes];
  [*(id *)(v2 - 8) setAssetAttributes:v4];

  uint64_t v5 = [*(id *)v2 fullAssetSelector];
  [*(id *)(v2 - 8) setContentLockedSelector:v5];

  id v6 = [*(id *)(v2 + 8) desireReason];
  [*(id *)(v2 - 8) setContentLockedReason:v6];

  id v7 = [*(id *)v2 localContentURL];
  [*(id *)(v2 - 8) setLocalContentURL:v7];

  objc_msgSend(*(id *)(v2 - 8), "setLocksOfContent:", objc_msgSend(*(id *)(v2 - 8), "locksOfContent") + 1);
  if (*(void *)(v2 + 32))
  {
    +[MAAutoAssetAuthorizationPolicy consumeSandboxExtension:*(void *)(a1 + 56) forPath:*(void *)(a1 + 64)];
    id v8 = [*(id *)(a1 + 32) completionDispatchQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __96__MAAutoAsset__successLockContent_dueToDesire_sandboxExtension_sandboxExtensionPath_completion___block_invoke_657;
    v11[3] = &unk_1E6004240;
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 72);
    dispatch_async(v8, v11);

    uint64_t v9 = v12;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v9 = [v10 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __96__MAAutoAsset__successLockContent_dueToDesire_sandboxExtension_sandboxExtensionPath_completion___block_invoke_cold_1((id *)v2);
    }
  }
}

void __96__MAAutoAsset__successLockContent_dueToDesire_sandboxExtension_sandboxExtensionPath_completion___block_invoke_657(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) summary];
    int v8 = 138543362;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto{_successLockContent} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) fullAssetSelector];
  id v7 = [*(id *)(a1 + 32) localContentURL];
  (*(void (**)(uint64_t, void *, uint64_t, void *, void, void))(v5 + 16))(v5, v6, 1, v7, 0, 0);
}

- (void)_failedLockContent:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__MAAutoAsset__failedLockContent_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6005680;
    id v21 = v10;
    int64_t v25 = a3;
    id v22 = v11;
    id v23 = self;
    id v24 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }
  else
  {
    id v15 = [NSString alloc];
    if (v10)
    {
      id v16 = [v10 checkedSummary];
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }
    else
    {
      id v16 = +[MAAutoAssetError summaryForCode:a3 fromOperation:@"lockContent"];
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }
    id v14 = (void *)v17;

    id v18 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedLockContent:withResponseError:description:completion:]();
    }
  }
}

void __75__MAAutoAsset__failedLockContent_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:v5 fromOperation:@"auto(lockContent)" underlyingError:0 withDescription:*(void *)(a1 + 40)], (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75__MAAutoAsset__failedLockContent_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v6 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138543362;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedLockContent} | %{public}@ | SUCCESS", (uint8_t *)&v10, 0xCu);
    }
    id v2 = 0;
  }

  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = [*(id *)(a1 + 48) assetSelector];
  (*(void (**)(uint64_t, void *, void, void, void, id))(v8 + 16))(v8, v9, 0, 0, 0, v2);
}

- (void)_successMapLockedContent:(id)a3 dueToDesire:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MAAutoAsset__successMapLockedContent_dueToDesire_completion___block_invoke;
  block[3] = &unk_1E60056A8;
  id v14 = self;
  id v15 = v8;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_sync(v9, block);
}

void __63__MAAutoAsset__successMapLockedContent_dueToDesire_completion___block_invoke(id *a1)
{
  if (a1[6])
  {
    id v2 = [a1[5] completionDispatchQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__MAAutoAsset__successMapLockedContent_dueToDesire_completion___block_invoke_661;
    v5[3] = &unk_1E6004240;
    id v6 = a1[4];
    id v7 = a1[6];
    dispatch_async(v2, v5);

    id v3 = v6;
  }
  else
  {
    id v4 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v3 = [v4 oslog];

    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __63__MAAutoAsset__successMapLockedContent_dueToDesire_completion___block_invoke_cold_1((uint64_t)a1);
    }
  }
}

void __63__MAAutoAsset__successMapLockedContent_dueToDesire_completion___block_invoke_661(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) summary];
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto{_successMapLockedContent} | %{public}@ | SUCCESS", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) fullAssetSelector];
  (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);
}

- (void)_failedMapLockedContent:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__MAAutoAsset__failedMapLockedContent_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004E68;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }
  else
  {
    id v15 = [NSString alloc];
    if (v10)
    {
      id v16 = [v10 checkedSummary];
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }
    else
    {
      id v16 = +[MAAutoAssetError summaryForCode:a3 fromOperation:@"mapLockedContent"];
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }
    id v14 = (void *)v17;

    id v18 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedMapLockedContent:withResponseError:description:completion:]();
    }
  }
}

void __80__MAAutoAsset__failedMapLockedContent_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:v5 fromOperation:@"auto(lockContent)" underlyingError:0 withDescription:*(void *)(a1 + 40)], (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__MAAutoAsset__failedMapLockedContent_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v6 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedMapLockedContent} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    id v2 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_successContinueLockUsage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = [(MAAutoAsset *)self completionDispatchQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__MAAutoAsset__successContinueLockUsage_completion___block_invoke;
    v11[3] = &unk_1E6004240;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v8, v11);

    uint64_t v9 = v12;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v9 = [v10 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _successContinueLockUsage:completion:](v6);
    }
  }
}

uint64_t __52__MAAutoAsset__successContinueLockUsage_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) summary];
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto{_successContinueLockUsage} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_failedContinueLockUsage:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__MAAutoAsset__failedContinueLockUsage_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6005680;
    id v21 = v10;
    int64_t v25 = a3;
    id v22 = v11;
    id v23 = self;
    id v24 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }
  else
  {
    id v15 = [NSString alloc];
    if (v10)
    {
      id v16 = [v10 checkedSummary];
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }
    else
    {
      id v16 = +[MAAutoAssetError summaryForCode:a3 fromOperation:@"continueLockUsage"];
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }
    id v14 = (void *)v17;

    id v18 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedContinueLockUsage:withResponseError:description:completion:]();
    }
  }
}

void __81__MAAutoAsset__failedContinueLockUsage_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:v5 fromOperation:@"auto(continueLockUsage)" underlyingError:0 withDescription:*(void *)(a1 + 40)], (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __81__MAAutoAsset__failedContinueLockUsage_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    int v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v6 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138543362;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedContinueLockUsage} | %{public}@ | SUCCESS", (uint8_t *)&v10, 0xCu);
    }
    id v2 = 0;
  }

  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = [*(id *)(a1 + 48) assetSelector];
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v2);
}

- (void)_successEndLockUsage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MAAutoAsset__successEndLockUsage_completion___block_invoke;
  block[3] = &unk_1E60056D0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __47__MAAutoAsset__successEndLockUsage_completion___block_invoke(id *a1)
{
  id v2 = a1 + 4;
  int v3 = [a1[4] locksOfContent];
  id v4 = *v2;
  int v5 = [*v2 locksOfContent];
  if (v3 < 1)
  {
    if (!v5) {
      goto LABEL_8;
    }
    uint64_t v8 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __47__MAAutoAsset__successEndLockUsage_completion___block_invoke_cold_2((uint64_t)a1, v2, v9);
    }

    id v7 = *v2;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = (v5 - 1);
    id v7 = v4;
  }
  [v7 setLocksOfContent:v6];
LABEL_8:
  if ((int)[*v2 locksOfContent] <= 0)
  {
    [*v2 setLocalContentURL:0];
    [*v2 setContentLockedSelector:0];
    [*v2 setContentLockedReason:0];
  }
  if (a1[6])
  {
    id v10 = [a1[4] completionDispatchQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__MAAutoAsset__successEndLockUsage_completion___block_invoke_665;
    v13[3] = &unk_1E6004240;
    id v14 = a1[5];
    id v15 = a1[6];
    dispatch_async(v10, v13);

    uint64_t v11 = v14;
  }
  else
  {
    id v12 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v11 = [v12 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __47__MAAutoAsset__successEndLockUsage_completion___block_invoke_cold_1((uint64_t)a1);
    }
  }
}

uint64_t __47__MAAutoAsset__successEndLockUsage_completion___block_invoke_665(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  int v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) summary];
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto{_successEndLockUsage} | %{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_failedEndLockUsage:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__MAAutoAsset__failedEndLockUsage_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6005680;
    id v21 = v10;
    int64_t v25 = a3;
    id v22 = v11;
    id v23 = self;
    id v24 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }
  else
  {
    id v15 = [NSString alloc];
    if (v10)
    {
      id v16 = [v10 checkedSummary];
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }
    else
    {
      id v16 = +[MAAutoAssetError summaryForCode:a3 fromOperation:@"endLockUsage"];
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }
    id v14 = (void *)v17;

    id v18 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedEndLockUsage:withResponseError:description:completion:]();
    }
  }
}

void __76__MAAutoAsset__failedEndLockUsage_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:v5 fromOperation:@"auto(endLockUsage)" underlyingError:0 withDescription:*(void *)(a1 + 40)], (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __76__MAAutoAsset__failedEndLockUsage_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    int v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v6 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138543362;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedEndLockUsage} | %{public}@ | SUCCESS", (uint8_t *)&v10, 0xCu);
    }
    id v2 = 0;
  }

  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = [*(id *)(a1 + 48) assetSelector];
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v2);
}

- (void)_successCancelActivity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MAAutoAsset frameworkDispatchQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MAAutoAsset__successCancelActivity___block_invoke;
  v7[3] = &unk_1E60042B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __38__MAAutoAsset__successCancelActivity___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) completionDispatchQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__MAAutoAsset__successCancelActivity___block_invoke_669;
    v6[3] = &unk_1E6004240;
    int v3 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = v3;
    dispatch_async(v2, v6);
  }
  else
  {
    id v4 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v5 = [v4 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __38__MAAutoAsset__successCancelActivity___block_invoke_cold_1(a1);
    }
  }
}

void __38__MAAutoAsset__successCancelActivity___block_invoke_669(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  int v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) assetSelector];
    uint64_t v5 = [v4 summary];
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto{_successCancelActivity} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) assetSelector];
  (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
}

- (void)_failedCancelActivity:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__MAAutoAsset__failedCancelActivity_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6005680;
    id v21 = v10;
    int64_t v25 = a3;
    id v22 = v11;
    id v23 = self;
    id v24 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }
  else
  {
    id v15 = [NSString alloc];
    if (v10)
    {
      id v16 = [v10 checkedSummary];
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }
    else
    {
      id v16 = +[MAAutoAssetError summaryForCode:a3 fromOperation:@"cancelActivity"];
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }
    id v14 = (void *)v17;

    id v18 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedCancelActivity:withResponseError:description:completion:]();
    }
  }
}

void __78__MAAutoAsset__failedCancelActivity_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:v5 fromOperation:@"auto(cancelActivity)" underlyingError:0 withDescription:*(void *)(a1 + 40)], (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __78__MAAutoAsset__failedCancelActivity_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v6 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138543362;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedCancelActivity} | %{public}@ | SUCCESS", (uint8_t *)&v10, 0xCu);
    }
    id v2 = 0;
  }

  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = [*(id *)(a1 + 48) assetSelector];
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v2);
}

- (void)_successEliminate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[MAAutoAsset frameworkDispatchQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__MAAutoAsset__successEliminate___block_invoke;
  v7[3] = &unk_1E60042B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __33__MAAutoAsset__successEliminate___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) completionDispatchQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __33__MAAutoAsset__successEliminate___block_invoke_676;
    v6[3] = &unk_1E6004240;
    int v3 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = v3;
    dispatch_async(v2, v6);
  }
  else
  {
    id v4 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v5 = [v4 oslog];

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __33__MAAutoAsset__successEliminate___block_invoke_cold_1(a1);
    }
  }
}

void __33__MAAutoAsset__successEliminate___block_invoke_676(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  int v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) assetSelector];
    uint64_t v5 = [v4 summary];
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto{_successEliminate} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) assetSelector];
  (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0);
}

- (void)_failedEliminate:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__MAAutoAsset__failedEliminate_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6005680;
    id v21 = v10;
    int64_t v25 = a3;
    id v22 = v11;
    id v23 = self;
    id v24 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }
  else
  {
    id v15 = [NSString alloc];
    if (v10)
    {
      id v16 = [v10 checkedSummary];
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }
    else
    {
      id v16 = +[MAAutoAssetError summaryForCode:a3 fromOperation:@"eliminateAll"];
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }
    id v14 = (void *)v17;

    id v18 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedEliminate:withResponseError:description:completion:]();
    }
  }
}

void __73__MAAutoAsset__failedEliminate_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:v5 fromOperation:@"auto(eliminateAll)" underlyingError:0 withDescription:*(void *)(a1 + 40)], (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __73__MAAutoAsset__failedEliminate_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v6 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138543362;
      uint64_t v11 = v7;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto{_failedEliminate} | %{public}@ | SUCCESS", (uint8_t *)&v10, 0xCu);
    }
    id v2 = 0;
  }

  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = [*(id *)(a1 + 48) assetSelector];
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v2);
}

- (void)_successStageDetermineGroupsAvailableForUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [(MAAutoAsset *)self completionDispatchQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__MAAutoAsset__successStageDetermineGroupsAvailableForUpdate_completion___block_invoke;
    v11[3] = &unk_1E6004240;
    uint64_t v12 = v6;
    id v13 = v7;
    dispatch_async(v8, v11);

    id v9 = v12;
  }
  else
  {
    int v10 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v9 = [v10 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _successStageDetermineGroupsAvailableForUpdate:completion:](v6);
    }
  }
}

void __73__MAAutoAsset__successStageDetermineGroupsAvailableForUpdate_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  int v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) summary];
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_successStageDetermineGroupsAvailableForUpdate} | staging:%{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) byGroupAvailableForStagingAttributes];
  id v7 = [*(id *)(a1 + 32) byGroupTotalExpectedBytes];
  (*(void (**)(uint64_t, void *, void *, void))(v5 + 16))(v5, v6, v7, 0);
}

- (void)_failedStageDetermineGroupsAvailableForUpdate:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__MAAutoAsset__failedStageDetermineGroupsAvailableForUpdate_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004E68;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }
  else
  {
    id v15 = [NSString alloc];
    if (v10)
    {
      id v16 = [v10 checkedSummary];
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }
    else
    {
      id v16 = +[MAAutoAssetError summaryForCode:a3 fromOperation:@"stageDetermineGroupsAvailableForStaging"];
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }
    id v14 = (void *)v17;

    id v18 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedStageDetermineGroupsAvailableForUpdate:withResponseError:description:completion:]();
    }
  }
}

void __102__MAAutoAsset__failedStageDetermineGroupsAvailableForUpdate_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:v5 fromOperation:@"auto(stageDetermineAllAvailable)" underlyingError:0 withDescription:*(void *)(a1 + 40)], (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __102__MAAutoAsset__failedStageDetermineGroupsAvailableForUpdate_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v6 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_failedStageDetermineGroupsAvailableForUpdate} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    id v2 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_successStageDetermineAllAvailable:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = [(MAAutoAsset *)self completionDispatchQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__MAAutoAsset__successStageDetermineAllAvailable_completion___block_invoke;
    v11[3] = &unk_1E6004240;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v8, v11);

    uint64_t v9 = v12;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v9 = [v10 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _successStageDetermineAllAvailable:completion:](v6);
    }
  }
}

void __61__MAAutoAsset__successStageDetermineAllAvailable_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  int v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) summary];
    int v7 = 138543362;
    int v8 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_successStageDetermineAllAvailable} | staging:%{public}@ | SUCCESS", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) allAvailableForStagingAttributes];
  (*(void (**)(uint64_t, void *, uint64_t, void))(v5 + 16))(v5, v6, [*(id *)(a1 + 32) totalExpectedBytes], 0);
}

- (void)_failedStageDetermineAllAvailable:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__MAAutoAsset__failedStageDetermineAllAvailable_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004E68;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }
  else
  {
    id v15 = [NSString alloc];
    if (v10)
    {
      id v16 = [v10 checkedSummary];
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }
    else
    {
      id v16 = +[MAAutoAssetError summaryForCode:a3 fromOperation:@"stageDetermineAllAvailable"];
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }
    id v14 = (void *)v17;

    id v18 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedStageDetermineAllAvailable:withResponseError:description:completion:]();
    }
  }
}

void __90__MAAutoAsset__failedStageDetermineAllAvailable_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:v5 fromOperation:@"auto(stageDetermineAllAvailable)" underlyingError:0 withDescription:*(void *)(a1 + 40)], (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __90__MAAutoAsset__failedStageDetermineAllAvailable_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v6 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_failedStageDetermineAllAvailable} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    id v2 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_stageDownloadAllStatusProgress:(id)a3 stageProgressError:(id)a4 progressBlock:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = +[MAAutoAsset frameworkDispatchQueue];
  dispatch_assert_queue_V2(v9);

  if (v8)
  {
    uint64_t v10 = [(MAAutoAsset *)self completionDispatchQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __80__MAAutoAsset__stageDownloadAllStatusProgress_stageProgressError_progressBlock___block_invoke;
    v14[3] = &unk_1E60042B8;
    id v16 = v8;
    id v15 = v7;
    dispatch_async(v10, v14);

    id v11 = v16;
  }
  else
  {
    id v12 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v11 = [v12 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v7 summary];
      *(_DWORD *)buf = 138543362;
      id v18 = v13;
      _os_log_impl(&dword_1B275B000, v11, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_stageDownloadAllStatusProgress} | no client progress block | %{public}@", buf, 0xCu);
    }
  }
}

uint64_t __80__MAAutoAsset__stageDownloadAllStatusProgress_stageProgressError_progressBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_successStageDownloadGroups:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(MAAutoAsset *)self completionDispatchQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__MAAutoAsset__successStageDownloadGroups_completion___block_invoke;
    v11[3] = &unk_1E6004240;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v8, v11);

    uint64_t v9 = v12;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v9 = [v10 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _successStageDownloadGroups:completion:](v6);
    }
  }
}

void __54__MAAutoAsset__successStageDownloadGroups_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  int v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) summary];
    int v8 = 138543362;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_successStageDownloadGroups} | staged:%{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) byGroupTotalStagedBytes];
  id v7 = [*(id *)(a1 + 32) byGroupAssetsSuccessfullyStaged];
  (*(void (**)(uint64_t, void *, void *, void))(v5 + 16))(v5, v6, v7, 0);
}

- (void)_failedStageDownloadGroups:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__MAAutoAsset__failedStageDownloadGroups_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004E68;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }
  else
  {
    id v15 = [NSString alloc];
    if (v10)
    {
      id v16 = [v10 checkedSummary];
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }
    else
    {
      id v16 = +[MAAutoAssetError summaryForCode:a3 fromOperation:@"stageDownloadGroups"];
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }
    id v14 = (void *)v17;

    id v18 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedStageDownloadGroups:withResponseError:description:completion:]();
    }
  }
}

void __83__MAAutoAsset__failedStageDownloadGroups_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:v5 fromOperation:@"auto(stageDownloadGroups)" underlyingError:0 withDescription:*(void *)(a1 + 40)], (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __83__MAAutoAsset__failedStageDownloadGroups_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    id v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v6 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_failedStageDownloadGroups} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    id v2 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_successStageDownloadAll:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    int v8 = [(MAAutoAsset *)self completionDispatchQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__MAAutoAsset__successStageDownloadAll_completion___block_invoke;
    v11[3] = &unk_1E6004240;
    id v12 = v6;
    id v13 = v7;
    dispatch_async(v8, v11);

    uint64_t v9 = v12;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v9 = [v10 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _successStageDownloadAll:completion:](v6);
    }
  }
}

uint64_t __51__MAAutoAsset__successStageDownloadAll_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  int v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) summary];
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_successStageDownloadAll} | staged:%{public}@ | SUCCESS", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [*(id *)(a1 + 32) totalStagedBytes], objc_msgSend(*(id *)(a1 + 32), "assetsSuccessfullyStaged"), 0);
}

- (void)_failedStageDownloadAll:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__MAAutoAsset__failedStageDownloadAll_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004E68;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }
  else
  {
    id v15 = [NSString alloc];
    if (v10)
    {
      id v16 = [v10 checkedSummary];
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }
    else
    {
      id v16 = +[MAAutoAssetError summaryForCode:a3 fromOperation:@"stageDownloadAll"];
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }
    id v14 = (void *)v17;

    id v18 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedStageDownloadAll:withResponseError:description:completion:]();
    }
  }
}

void __80__MAAutoAsset__failedStageDownloadAll_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:v5 fromOperation:@"auto(stageDownloadAll)" underlyingError:0 withDescription:*(void *)(a1 + 40)], (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__MAAutoAsset__failedStageDownloadAll_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    int v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v6 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_failedStageDownloadAll} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    id v2 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_successStageCancelOperation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__MAAutoAsset__successStageCancelOperation___block_invoke;
    block[3] = &unk_1E6004F30;
    uint64_t v9 = v4;
    dispatch_async(v5, block);

    int v6 = v9;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FA56C8] sharedLogger];
    int v6 = [v7 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _successStageCancelOperation:]();
    }
  }
}

uint64_t __44__MAAutoAsset__successStageCancelOperation___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  int v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_successStageCancelOperation} | SUCCESS", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_failedStageCancelOperation:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__MAAutoAsset__failedStageCancelOperation_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004E68;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }
  else
  {
    id v15 = [NSString alloc];
    if (v10)
    {
      id v16 = [v10 checkedSummary];
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }
    else
    {
      id v16 = +[MAAutoAssetError summaryForCode:a3 fromOperation:@"stageCancelOperation"];
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }
    id v14 = (void *)v17;

    id v18 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedStageCancelOperation:withResponseError:description:completion:]();
    }
  }
}

void __84__MAAutoAsset__failedStageCancelOperation_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:v5 fromOperation:@"auto(stageCancelOperation)" underlyingError:0 withDescription:*(void *)(a1 + 40)], (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __84__MAAutoAsset__failedStageCancelOperation_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    int v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v6 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_failedStageCancelOperation} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    id v2 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_successStagePurgeAll:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__MAAutoAsset__successStagePurgeAll___block_invoke;
    block[3] = &unk_1E6004F30;
    uint64_t v9 = v4;
    dispatch_async(v5, block);

    int v6 = v9;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FA56C8] sharedLogger];
    int v6 = [v7 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _successStagePurgeAll:]();
    }
  }
}

uint64_t __37__MAAutoAsset__successStagePurgeAll___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  int v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_successStagePurgeAll} | SUCCESS", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_failedStagePurgeAll:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__MAAutoAsset__failedStagePurgeAll_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004E68;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }
  else
  {
    id v15 = [NSString alloc];
    if (v10)
    {
      id v16 = [v10 checkedSummary];
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }
    else
    {
      id v16 = +[MAAutoAssetError summaryForCode:a3 fromOperation:@"stagePurgeAll"];
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }
    id v14 = (void *)v17;

    id v18 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedStagePurgeAll:withResponseError:description:completion:]();
    }
  }
}

void __77__MAAutoAsset__failedStagePurgeAll_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:v5 fromOperation:@"auto(stagePurgeAll)" underlyingError:0 withDescription:*(void *)(a1 + 40)], (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__MAAutoAsset__failedStagePurgeAll_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    int v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v6 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_failedStagePurgeAll} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    id v2 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_successStageEraseAll:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__MAAutoAsset__successStageEraseAll___block_invoke;
    block[3] = &unk_1E6004F30;
    uint64_t v9 = v4;
    dispatch_async(v5, block);

    int v6 = v9;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FA56C8] sharedLogger];
    int v6 = [v7 oslog];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _successStageEraseAll:]();
    }
  }
}

uint64_t __37__MAAutoAsset__successStageEraseAll___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  int v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_successStageEraseAll} | SUCCESS", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_failedStageEraseAll:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = [(MAAutoAsset *)self completionDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__MAAutoAsset__failedStageEraseAll_withResponseError_description_completion___block_invoke;
    block[3] = &unk_1E6004E68;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }
  else
  {
    id v15 = [NSString alloc];
    if (v10)
    {
      id v16 = [v10 checkedSummary];
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }
    else
    {
      id v16 = +[MAAutoAssetError summaryForCode:a3 fromOperation:@"stageEraseAll"];
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }
    id v14 = (void *)v17;

    id v18 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v19 = [v18 oslog];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedStageEraseAll:withResponseError:description:completion:]();
    }
  }
}

void __77__MAAutoAsset__failedStageEraseAll_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:v5 fromOperation:@"auto(stageEraseAll)" underlyingError:0 withDescription:*(void *)(a1 + 40)], (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v3 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__MAAutoAsset__failedStageEraseAll_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }
  else
  {
    int v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v4 = [v6 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&dword_1B275B000, v4, OS_LOG_TYPE_DEFAULT, "MA-auto(staging-client){_failedStageEraseAll} | %{public}@ | SUCCESS", (uint8_t *)&v8, 0xCu);
    }
    id v2 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (void)interestInContent:(id)a3 forAssetSelector:(id)a4 completion:(id)a5
{
}

+ (void)interestInContent:(id)a3 forAssetSelector:(id)a4 withInterestPolicy:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v24 = 0;
    id v13 = [[MAAutoAsset alloc] initForClientName:@"MA-auto{+interestInContent}" selectingAsset:v10 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v24];
    id v14 = v24;
    if (v14)
    {
      id v15 = +[MAAutoAsset defaultDispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__MAAutoAsset_interestInContent_forAssetSelector_withInterestPolicy_completion___block_invoke_2;
      block[3] = &unk_1E60056A8;
      id v16 = &v21;
      id v21 = v12;
      id v19 = v10;
      id v20 = v14;
      dispatch_async(v15, block);
    }
    else
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __80__MAAutoAsset_interestInContent_forAssetSelector_withInterestPolicy_completion___block_invoke;
      void v22[3] = &unk_1E60056F8;
      id v16 = &v23;
      id v23 = v12;
      [v13 interestInContent:v9 withInterestPolicy:v11 completion:v22];
    }
  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain];
    uint64_t v17 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v14 = [v17 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset interestInContent:forAssetSelector:withInterestPolicy:completion:]();
    }
  }
}

uint64_t __80__MAAutoAsset_interestInContent_forAssetSelector_withInterestPolicy_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__MAAutoAsset_interestInContent_forAssetSelector_withInterestPolicy_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)interestInContentSync:(id)a3 forAssetSelector:(id)a4
{
  return +[MAAutoAsset interestInContentSync:a3 forAssetSelector:a4 withInterestPolicy:0];
}

+ (id)interestInContentSync:(id)a3 forAssetSelector:(id)a4 withInterestPolicy:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v13 = 0;
  id v10 = [[MAAutoAsset alloc] initForClientName:@"MA-auto{+interestInContentSync}" selectingAsset:v9 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v13];

  id v11 = v13;
  if (!v11)
  {
    id v11 = [v10 interestInContentSync:v7 withInterestPolicy:v8];
  }

  return v11;
}

+ (void)determineIfAvailable:(id)a3 forAssetSelector:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v21 = 0;
    id v10 = [[MAAutoAsset alloc] initForClientName:@"MA-auto{+determineIfAvailable}" selectingAsset:v8 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v21];
    id v11 = v21;
    if (v11)
    {
      id v12 = +[MAAutoAsset defaultDispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__MAAutoAsset_determineIfAvailable_forAssetSelector_completion___block_invoke_2;
      block[3] = &unk_1E60056A8;
      id v13 = &v18;
      id v18 = v9;
      id v16 = v8;
      uint64_t v17 = v11;
      dispatch_async(v12, block);
    }
    else
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __64__MAAutoAsset_determineIfAvailable_forAssetSelector_completion___block_invoke;
      void v19[3] = &unk_1E6005720;
      id v13 = &v20;
      id v20 = v9;
      [v10 determineIfAvailable:v7 withTimeout:-2 completion:v19];
    }
  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain];
    id v14 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v11 = [v14 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset determineIfAvailable:forAssetSelector:completion:]();
    }
  }
}

uint64_t __64__MAAutoAsset_determineIfAvailable_forAssetSelector_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__MAAutoAsset_determineIfAvailable_forAssetSelector_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

+ (id)determineIfAvailableSync:(id)a3 forAssetSelector:(id)a4 discoveredAttributes:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v17 = 0;
  id v11 = [[MAAutoAsset alloc] initForClientName:@"MA-auto{+determineIfAvailableSync}" selectingAsset:v10 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v17];

  id v12 = v17;
  if (v12)
  {
    id v13 = v12;
    id v14 = 0;
    if (!a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v16 = 0;
  id v14 = [v11 determineIfAvailableSync:v9 withTimeout:-2 discoveredAttributes:a5 error:&v16];
  id v13 = v16;
  if (a6) {
LABEL_3:
  }
    *a6 = v13;
LABEL_4:

  return v14;
}

+ (void)endPreviousLocksOfReason:(id)a3 forAssetSelector:(id)a4 removingLockCount:(int64_t)a5 completion:(id)a6
{
}

+ (void)endPreviousLocksOfReason:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5 removingLockCount:(int64_t)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (v14)
  {
    id v26 = 0;
    id v15 = [[MAAutoAsset alloc] initForClientName:v12 selectingAsset:v13 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v26];
    id v16 = v26;
    if (v16)
    {
      id v17 = +[MAAutoAsset defaultDispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __100__MAAutoAsset_endPreviousLocksOfReason_forClientName_forAssetSelector_removingLockCount_completion___block_invoke_2;
      block[3] = &unk_1E60056A8;
      id v18 = &v23;
      id v23 = v14;
      id v21 = v13;
      id v22 = v16;
      dispatch_async(v17, block);
    }
    else
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __100__MAAutoAsset_endPreviousLocksOfReason_forClientName_forAssetSelector_removingLockCount_completion___block_invoke;
      void v24[3] = &unk_1E60056F8;
      id v18 = &v25;
      id v25 = v14;
      [v15 _endPreviousLocksOfReason:v11 removingLockCount:a6 completion:v24];
    }
  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain];
    id v19 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v16 = [v19 oslog];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset endPreviousLocksOfReason:forClientName:forAssetSelector:removingLockCount:completion:]();
    }
  }
}

uint64_t __100__MAAutoAsset_endPreviousLocksOfReason_forClientName_forAssetSelector_removingLockCount_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __100__MAAutoAsset_endPreviousLocksOfReason_forClientName_forAssetSelector_removingLockCount_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_endPreviousLocksOfReason:(id)a3 removingLockCount:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__MAAutoAsset__endPreviousLocksOfReason_removingLockCount_completion___block_invoke;
    v12[3] = &unk_1E6005478;
    void v12[4] = self;
    id v13 = v8;
    int64_t v15 = a4;
    id v14 = v9;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v12];
  }
  else
  {
    id v10 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _endPreviousLocksOfReason:removingLockCount:completion:]();
    }
  }
}

void __70__MAAutoAsset__endPreviousLocksOfReason_removingLockCount_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    int v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedEndLockUsage:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    uint64_t v5 = [MAAutoAssetInfoInstance alloc];
    int v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) assetSelector];
    id v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = [[MAAutoAssetInfoEnd alloc] initWithLockReason:*(void *)(a1 + 40) endingLockCount:*(void *)(a1 + 56)];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v14 = +[MAAutoAsset frameworkInstanceUUID];
    int64_t v15 = [v14 UUIDString];

    [v13 setSafeObject:v11 forKey:@"instance"];
    [v13 setSafeObject:v12 forKey:@"end"];
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO:END_PREVIOUS_LOCKS" clientID:v15 version:0 message:v13];
    id v17 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70__MAAutoAsset__endPreviousLocksOfReason_removingLockCount_completion___block_invoke_2;
    v18[3] = &unk_1E6004158;
    v18[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 48);
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v18];
  }
}

void __70__MAAutoAsset__endPreviousLocksOfReason_removingLockCount_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  int v6 = *(void **)(a1 + 32);
  if (!v12 || v5)
  {
    if (v5)
    {
      uint64_t v8 = @"failure reported by server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 0;
      id v11 = v5;
    }
    else
    {
      uint64_t v8 = @"no response message from server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 6104;
      id v11 = 0;
    }
    [v9 _failedEndLockUsage:v10 withResponseError:v11 description:v8 completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) assetSelector];
    [v6 _successEndLockUsage:v7 completion:*(void *)(a1 + 40)];
  }
}

+ (id)endPreviousLocksOfReasonSync:(id)a3 forAssetSelector:(id)a4 removingLockCount:(int64_t)a5
{
  return +[MAAutoAsset endPreviousLocksOfReasonSync:a3 forClientName:0 forAssetSelector:a4 removingLockCount:a5];
}

+ (id)endPreviousLocksOfReasonSync:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5 removingLockCount:(int64_t)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  id v15 = 0;
  id v12 = [[MAAutoAsset alloc] initForClientName:v11 selectingAsset:v10 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v15];

  id v13 = v15;
  if (!v13)
  {
    id v13 = [v12 _endPreviousLocksOfReasonSync:v9 removingLockCount:a6];
  }

  return v13;
}

- (id)_endPreviousLocksOfReasonSync:(id)a3 removingLockCount:(int64_t)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__5;
  id v26 = __Block_byref_object_dispose__5;
  id v27 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__MAAutoAsset__endPreviousLocksOfReasonSync_removingLockCount___block_invoke;
  v13[3] = &unk_1E6005770;
  id v15 = v18;
  id v16 = &v22;
  id v17 = v20;
  uint64_t v8 = v7;
  id v14 = v8;
  [(MAAutoAsset *)self _endPreviousLocksOfReason:v6 removingLockCount:a4 completion:v13];
  if (+[MAAutoAsset waitOnSemaphore:v8 withDaemonTriggeredTimeout:-100])
  {
    id v9 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__MAAutoAsset__endPreviousLocksOfReasonSync_removingLockCount___block_invoke_3;
    block[3] = &unk_1E6004130;
    void block[4] = v20;
    void block[5] = v18;
    block[6] = &v22;
    dispatch_sync(v9, block);
  }
  id v10 = (id)v23[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __63__MAAutoAsset__endPreviousLocksOfReasonSync_removingLockCount___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 48);
  block[2] = __63__MAAutoAsset__endPreviousLocksOfReasonSync_removingLockCount___block_invoke_2;
  block[3] = &unk_1E6005748;
  id v10 = v4;
  id v6 = (id)v8;
  long long v11 = v8;
  id v7 = v4;
  dispatch_sync(v5, block);
}

intptr_t __63__MAAutoAsset__endPreviousLocksOfReasonSync_removingLockCount___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
    id v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __63__MAAutoAsset__endPreviousLocksOfReasonSync_removingLockCount___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(endPreviousLocksOfReasonSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for end-previous-locks to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (void)endAllPreviousLocksOfReason:(id)a3 forAssetSelector:(id)a4 completion:(id)a5
{
}

+ (void)endAllPreviousLocksOfReason:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v24 = 0;
    id v13 = [[MAAutoAsset alloc] initForClientName:v10 selectingAsset:v11 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v24];
    id v14 = v24;
    if (v14)
    {
      id v15 = +[MAAutoAsset defaultDispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __85__MAAutoAsset_endAllPreviousLocksOfReason_forClientName_forAssetSelector_completion___block_invoke_2;
      block[3] = &unk_1E60056A8;
      id v16 = &v21;
      id v21 = v12;
      id v19 = v11;
      id v20 = v14;
      dispatch_async(v15, block);
    }
    else
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __85__MAAutoAsset_endAllPreviousLocksOfReason_forClientName_forAssetSelector_completion___block_invoke;
      void v22[3] = &unk_1E60056F8;
      id v16 = &v23;
      id v23 = v12;
      [v13 _endAllPreviousLocksOfReason:v9 completion:v22];
    }
  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain];
    id v17 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v14 = [v17 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset endAllPreviousLocksOfReason:forClientName:forAssetSelector:completion:]();
    }
  }
}

uint64_t __85__MAAutoAsset_endAllPreviousLocksOfReason_forClientName_forAssetSelector_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__MAAutoAsset_endAllPreviousLocksOfReason_forClientName_forAssetSelector_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_endAllPreviousLocksOfReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__MAAutoAsset__endAllPreviousLocksOfReason_completion___block_invoke;
    v10[3] = &unk_1E60041F8;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v10];
  }
  else
  {
    long long v8 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _endAllPreviousLocksOfReason:completion:]();
    }
  }
}

void __55__MAAutoAsset__endAllPreviousLocksOfReason_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    int v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedEndLockUsage:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) assetSelector];
    id v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = [[MAAutoAssetInfoEnd alloc] initWithLockReason:*(void *)(a1 + 40) endingLockCount:-1];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v14 = +[MAAutoAsset frameworkInstanceUUID];
    id v15 = [v14 UUIDString];

    [v13 setSafeObject:v11 forKey:@"instance"];
    [v13 setSafeObject:v12 forKey:@"end"];
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO:END_ALL_PREVIOUS_LOCKS" clientID:v15 version:0 message:v13];
    id v17 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__MAAutoAsset__endAllPreviousLocksOfReason_completion___block_invoke_2;
    void v18[3] = &unk_1E6004158;
    v18[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 48);
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v18];
  }
}

void __55__MAAutoAsset__endAllPreviousLocksOfReason_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v12 || v5)
  {
    if (v5)
    {
      uint64_t v8 = @"failure reported by server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 0;
      id v11 = v5;
    }
    else
    {
      uint64_t v8 = @"no response message from server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 6104;
      id v11 = 0;
    }
    [v9 _failedEndLockUsage:v10 withResponseError:v11 description:v8 completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) assetSelector];
    [v6 _successEndLockUsage:v7 completion:*(void *)(a1 + 40)];
  }
}

+ (id)endAllPreviousLocksOfReasonSync:(id)a3 forAssetSelector:(id)a4
{
  return +[MAAutoAsset endAllPreviousLocksOfReasonSync:a3 forClientName:0 forAssetSelector:a4];
}

+ (id)endAllPreviousLocksOfReasonSync:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v13 = 0;
  id v10 = [[MAAutoAsset alloc] initForClientName:v9 selectingAsset:v8 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v13];

  id v11 = v13;
  if (!v11)
  {
    id v11 = [v10 _endAllPreviousLocksOfReasonSync:v7];
  }

  return v11;
}

- (id)_endAllPreviousLocksOfReasonSync:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__5;
  id v24 = __Block_byref_object_dispose__5;
  id v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  char v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__MAAutoAsset__endAllPreviousLocksOfReasonSync___block_invoke;
  v11[3] = &unk_1E6005770;
  id v13 = v16;
  id v14 = &v20;
  id v15 = v18;
  id v6 = v5;
  id v12 = v6;
  [(MAAutoAsset *)self _endAllPreviousLocksOfReason:v4 completion:v11];
  if (+[MAAutoAsset waitOnSemaphore:v6 withDaemonTriggeredTimeout:-100])
  {
    id v7 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__MAAutoAsset__endAllPreviousLocksOfReasonSync___block_invoke_3;
    block[3] = &unk_1E6004130;
    void block[4] = v18;
    void block[5] = v16;
    block[6] = &v20;
    dispatch_sync(v7, block);
  }
  id v8 = (id)v21[5];

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void __48__MAAutoAsset__endAllPreviousLocksOfReasonSync___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  dispatch_semaphore_t v5 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 48);
  block[2] = __48__MAAutoAsset__endAllPreviousLocksOfReasonSync___block_invoke_2;
  block[3] = &unk_1E6005748;
  id v10 = v4;
  id v6 = (id)v8;
  long long v11 = v8;
  id v7 = v4;
  dispatch_sync(v5, block);
}

intptr_t __48__MAAutoAsset__endAllPreviousLocksOfReasonSync___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
    id v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __48__MAAutoAsset__endAllPreviousLocksOfReasonSync___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(endAllPreviousLocksOfReasonSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for end-all-previous-locks to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (void)endAllPreviousLocksOfSelector:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[MAAutoAsset defaultDispatchQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__MAAutoAsset_endAllPreviousLocksOfSelector_completion___block_invoke;
  v10[3] = &unk_1E60042B8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

void __56__MAAutoAsset_endAllPreviousLocksOfSelector_completion___block_invoke(uint64_t a1)
{
  id v2 = +[MAAutoAssetError buildError:6801 fromOperation:@"auto(endAllPreviousLocksOfSelector:completion:)" underlyingError:0 withDescription:@"method was never implemented [marked as deprecated] use endAllPreviousLocksOfSelector:forClientName:completion: instead"];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)endAllPreviousLocksOfSelector:(id)a3 forClientName:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v21 = 0;
    id v10 = [[MAAutoAsset alloc] initForClientName:v8 selectingAsset:v7 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v21];
    id v11 = v21;
    if (v11)
    {
      id v12 = +[MAAutoAsset defaultDispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__MAAutoAsset_endAllPreviousLocksOfSelector_forClientName_completion___block_invoke_2;
      block[3] = &unk_1E60056A8;
      id v13 = &v18;
      id v18 = v9;
      id v16 = v7;
      char v17 = v11;
      dispatch_async(v12, block);
    }
    else
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __70__MAAutoAsset_endAllPreviousLocksOfSelector_forClientName_completion___block_invoke;
      void v19[3] = &unk_1E60056F8;
      id v13 = &v20;
      id v20 = v9;
      [v10 _endAllPreviousLocksOfReason:0 completion:v19];
    }
  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain];
    id v14 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v11 = [v14 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset endAllPreviousLocksOfSelector:forClientName:completion:]();
    }
  }
}

uint64_t __70__MAAutoAsset_endAllPreviousLocksOfSelector_forClientName_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__MAAutoAsset_endAllPreviousLocksOfSelector_forClientName_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)endAllPreviousLocksOfSelectorSync:(id)a3
{
  return +[MAAutoAssetError buildError:6801 fromOperation:@"auto(endAllPreviousLocksOfSelectorSync)" underlyingError:0 withDescription:@"method was never implemented [marked as deprecated] use endAllPreviousLocksOfSelectorSync:forClientName: instead"];
}

+ (id)endAllPreviousLocksOfSelectorSync:(id)a3 forClientName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v10 = 0;
  id v7 = [[MAAutoAsset alloc] initForClientName:v5 selectingAsset:v6 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v10];

  id v8 = v10;
  if (!v8)
  {
    id v8 = [v7 _endAllPreviousLocksOfReasonSync:0];
  }

  return v8;
}

+ (void)cancelActivityForSelector:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v18 = 0;
    id v7 = [[MAAutoAsset alloc] initForClientName:@"MA-auto{+cancelActivityForSelector}" selectingAsset:v5 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v18];
    id v8 = v18;
    if (v8)
    {
      id v9 = +[MAAutoAsset defaultDispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __52__MAAutoAsset_cancelActivityForSelector_completion___block_invoke_2;
      block[3] = &unk_1E60056A8;
      id v10 = &v15;
      id v15 = v6;
      id v13 = v5;
      id v14 = v8;
      dispatch_async(v9, block);
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __52__MAAutoAsset_cancelActivityForSelector_completion___block_invoke;
      void v16[3] = &unk_1E60056F8;
      id v10 = &v17;
      id v17 = v6;
      [v7 _cancelActivityForSelector:v16];
    }
  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain];
    id v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v8 = [v11 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset cancelActivityForSelector:completion:]();
    }
  }
}

uint64_t __52__MAAutoAsset_cancelActivityForSelector_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __52__MAAutoAsset_cancelActivityForSelector_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_cancelActivityForSelector:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__MAAutoAsset__cancelActivityForSelector___block_invoke;
    v8[3] = &unk_1E60054F0;
    v8[4] = self;
    id v9 = v4;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v8];
  }
  else
  {
    id v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _cancelActivityForSelector:]();
    }
  }
}

void __42__MAAutoAsset__cancelActivityForSelector___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    int v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _failedCancelActivity:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) assetSelector];
    id v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = +[MAAutoAsset frameworkInstanceUUID];
    id v14 = [v13 UUIDString];

    [v12 setSafeObject:v11 forKey:@"instance"];
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO:CANCEL_ACTIVITY_FOR_SELECTOR" clientID:v14 version:0 message:v12];
    id v16 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __42__MAAutoAsset__cancelActivityForSelector___block_invoke_2;
    void v18[3] = &unk_1E6004158;
    id v17 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v17;
    [v16 connectClientSendServerMessage:v15 proxyObject:0 withReply:v18];
  }
}

void __42__MAAutoAsset__cancelActivityForSelector___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      uint64_t v7 = @"failure reported by server";
      uint64_t v8 = 0;
      id v9 = v5;
    }
    else
    {
      uint64_t v7 = @"no response message from server";
      uint64_t v8 = 6104;
      id v9 = 0;
    }
    [v6 _failedCancelActivity:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v6 _successCancelActivity:*(void *)(a1 + 40)];
  }
}

+ (id)cancelActivityForSelectorSync:(id)a3
{
  id v3 = a3;
  id v7 = 0;
  id v4 = [[MAAutoAsset alloc] initForClientName:@"MA-auto{+cancelActivityForSelectorSync}" selectingAsset:v3 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v7];

  id v5 = v7;
  if (!v5)
  {
    id v5 = [v4 _cancelActivityForSelectorSync];
  }

  return v5;
}

- (id)_cancelActivityForSelectorSync
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__5;
  uint64_t v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__MAAutoAsset__cancelActivityForSelectorSync__block_invoke;
  v9[3] = &unk_1E6005770;
  id v11 = v14;
  id v12 = &v18;
  id v13 = v16;
  id v4 = v3;
  id v10 = v4;
  [(MAAutoAsset *)self _cancelActivityForSelector:v9];
  if (+[MAAutoAsset waitOnSemaphore:v4 withDaemonTriggeredTimeout:-100])
  {
    id v5 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__MAAutoAsset__cancelActivityForSelectorSync__block_invoke_3;
    block[3] = &unk_1E6004130;
    void block[4] = v16;
    void block[5] = v14;
    block[6] = &v18;
    dispatch_sync(v5, block);
  }
  id v6 = (id)v19[5];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  return v6;
}

void __45__MAAutoAsset__cancelActivityForSelectorSync__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 48);
  block[2] = __45__MAAutoAsset__cancelActivityForSelectorSync__block_invoke_2;
  block[3] = &unk_1E6005748;
  id v10 = v4;
  id v6 = (id)v8;
  long long v11 = v8;
  id v7 = v4;
  dispatch_sync(v5, block);
}

intptr_t __45__MAAutoAsset__cancelActivityForSelectorSync__block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
    id v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __45__MAAutoAsset__cancelActivityForSelectorSync__block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(cancelActivityForSelectorSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for cancel-activity to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (void)eliminateAllForSelector:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v18 = 0;
    id v7 = [[MAAutoAsset alloc] initForClientName:@"MA-auto{+eliminateAllForSelector}" selectingAsset:v5 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v18];
    long long v8 = v18;
    if (v8)
    {
      id v9 = +[MAAutoAsset defaultDispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__MAAutoAsset_eliminateAllForSelector_completion___block_invoke_2;
      block[3] = &unk_1E60056A8;
      id v10 = &v15;
      id v15 = v6;
      id v13 = v5;
      id v14 = v8;
      dispatch_async(v9, block);
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __50__MAAutoAsset_eliminateAllForSelector_completion___block_invoke;
      void v16[3] = &unk_1E60056F8;
      id v10 = &v17;
      id v17 = v6;
      [v7 _eliminateAllForSelector:v16];
    }
  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain];
    long long v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    long long v8 = [v11 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset eliminateAllForSelector:completion:]();
    }
  }
}

uint64_t __50__MAAutoAsset_eliminateAllForSelector_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __50__MAAutoAsset_eliminateAllForSelector_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_eliminateAllForSelector:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__MAAutoAsset__eliminateAllForSelector___block_invoke;
    v8[3] = &unk_1E60054F0;
    v8[4] = self;
    id v9 = v4;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v8];
  }
  else
  {
    id v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _eliminateAllForSelector:]();
    }
  }
}

void __40__MAAutoAsset__eliminateAllForSelector___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    dispatch_semaphore_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _failedEliminate:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) assetSelector];
    id v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = +[MAAutoAsset frameworkInstanceUUID];
    id v14 = [v13 UUIDString];

    [v12 setSafeObject:v11 forKey:@"instance"];
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO:ELIMINATE_ALL_FOR_SELECTOR" clientID:v14 version:0 message:v12];
    id v16 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __40__MAAutoAsset__eliminateAllForSelector___block_invoke_2;
    void v18[3] = &unk_1E6004158;
    id v17 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v17;
    [v16 connectClientSendServerMessage:v15 proxyObject:0 withReply:v18];
  }
}

void __40__MAAutoAsset__eliminateAllForSelector___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      uint64_t v7 = @"failure reported by server";
      uint64_t v8 = 0;
      id v9 = v5;
    }
    else
    {
      uint64_t v7 = @"no response message from server";
      uint64_t v8 = 6104;
      id v9 = 0;
    }
    [v6 _failedEliminate:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v6 _successEliminate:*(void *)(a1 + 40)];
  }
}

+ (id)eliminateAllForSelectorSync:(id)a3
{
  id v3 = a3;
  id v7 = 0;
  id v4 = [[MAAutoAsset alloc] initForClientName:@"MA-auto{+eliminateAllForSelectorSync}" selectingAsset:v3 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v7];

  id v5 = v7;
  if (!v5)
  {
    id v5 = [v4 _eliminateAllForSelectorSync];
  }

  return v5;
}

- (id)_eliminateAllForSelectorSync
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__5;
  uint64_t v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__MAAutoAsset__eliminateAllForSelectorSync__block_invoke;
  v9[3] = &unk_1E6005770;
  id v11 = v14;
  id v12 = &v18;
  id v13 = v16;
  id v4 = v3;
  id v10 = v4;
  [(MAAutoAsset *)self _eliminateAllForSelector:v9];
  if (+[MAAutoAsset waitOnSemaphore:v4 withDaemonTriggeredTimeout:-100])
  {
    id v5 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__MAAutoAsset__eliminateAllForSelectorSync__block_invoke_3;
    block[3] = &unk_1E6004130;
    void block[4] = v16;
    void block[5] = v14;
    block[6] = &v18;
    dispatch_sync(v5, block);
  }
  id v6 = (id)v19[5];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  return v6;
}

void __43__MAAutoAsset__eliminateAllForSelectorSync__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 48);
  block[2] = __43__MAAutoAsset__eliminateAllForSelectorSync__block_invoke_2;
  block[3] = &unk_1E6005748;
  id v10 = v4;
  id v6 = (id)v8;
  long long v11 = v8;
  id v7 = v4;
  dispatch_sync(v5, block);
}

intptr_t __43__MAAutoAsset__eliminateAllForSelectorSync__block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
    id v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __43__MAAutoAsset__eliminateAllForSelectorSync__block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(eliminateAllForSelectorSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for elimination to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (void)eliminateAllForAssetType:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [[MAAutoAssetSelector alloc] initForAssetType:v5 withAssetSpecifier:@"MAAutoAsset-all-asset-specifiers"];
    id v19 = 0;
    id v8 = [[MAAutoAsset alloc] initForClientName:@"MA-auto{+eliminateAllForAssetType}" selectingAsset:v7 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v19];
    id v9 = v19;
    if (v9)
    {
      id v10 = +[MAAutoAsset defaultDispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__MAAutoAsset_eliminateAllForAssetType_completion___block_invoke_2;
      block[3] = &unk_1E60056A8;
      long long v11 = &v16;
      id v16 = v6;
      id v14 = v7;
      char v15 = v9;
      dispatch_async(v10, block);
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __51__MAAutoAsset_eliminateAllForAssetType_completion___block_invoke;
      void v17[3] = &unk_1E60056F8;
      long long v11 = &v18;
      id v18 = v6;
      [v8 _eliminateAllForAssetType:v17];
    }
  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain];
    long long v12 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v9 = [v12 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset eliminateAllForAssetType:completion:]();
    }
  }
}

uint64_t __51__MAAutoAsset_eliminateAllForAssetType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__MAAutoAsset_eliminateAllForAssetType_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_eliminateAllForAssetType:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __41__MAAutoAsset__eliminateAllForAssetType___block_invoke;
    v8[3] = &unk_1E60054F0;
    v8[4] = self;
    id v9 = v4;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v8];
  }
  else
  {
    id v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _eliminateAllForAssetType:]();
    }
  }
}

void __41__MAAutoAsset__eliminateAllForAssetType___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    dispatch_semaphore_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _failedEliminate:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) assetSelector];
    id v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = +[MAAutoAsset frameworkInstanceUUID];
    id v14 = [v13 UUIDString];

    [v12 setSafeObject:v11 forKey:@"instance"];
    char v15 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO:ELIMINATE_ALL_FOR_ASSET_TYPE" clientID:v14 version:0 message:v12];
    id v16 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __41__MAAutoAsset__eliminateAllForAssetType___block_invoke_2;
    void v18[3] = &unk_1E6004158;
    char v17 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v17;
    [v16 connectClientSendServerMessage:v15 proxyObject:0 withReply:v18];
  }
}

void __41__MAAutoAsset__eliminateAllForAssetType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      uint64_t v7 = @"failure reported by server";
      uint64_t v8 = 0;
      id v9 = v5;
    }
    else
    {
      uint64_t v7 = @"no response message from server";
      uint64_t v8 = 6104;
      id v9 = 0;
    }
    [v6 _failedEliminate:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v6 _successEliminate:*(void *)(a1 + 40)];
  }
}

+ (id)eliminateAllForAssetTypeSync:(id)a3
{
  id v3 = a3;
  id v4 = [[MAAutoAssetSelector alloc] initForAssetType:v3 withAssetSpecifier:@"MAAutoAsset-all-asset-specifiers"];

  id v8 = 0;
  id v5 = [[MAAutoAsset alloc] initForClientName:@"MA-auto{+eliminateAllForAssetTypeSync}" selectingAsset:v4 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v8];
  id v6 = v8;
  if (!v6)
  {
    id v6 = [v5 _eliminateAllForAssetTypeSync];
  }

  return v6;
}

- (id)_eliminateAllForAssetTypeSync
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__5;
  uint64_t v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__MAAutoAsset__eliminateAllForAssetTypeSync__block_invoke;
  v9[3] = &unk_1E6005770;
  id v11 = v14;
  id v12 = &v18;
  id v13 = v16;
  id v4 = v3;
  id v10 = v4;
  [(MAAutoAsset *)self _eliminateAllForAssetType:v9];
  if (+[MAAutoAsset waitOnSemaphore:v4 withDaemonTriggeredTimeout:-100])
  {
    id v5 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__MAAutoAsset__eliminateAllForAssetTypeSync__block_invoke_3;
    block[3] = &unk_1E6004130;
    void block[4] = v16;
    void block[5] = v14;
    block[6] = &v18;
    dispatch_sync(v5, block);
  }
  id v6 = (id)v19[5];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  return v6;
}

void __44__MAAutoAsset__eliminateAllForAssetTypeSync__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 48);
  block[2] = __44__MAAutoAsset__eliminateAllForAssetTypeSync__block_invoke_2;
  block[3] = &unk_1E6005748;
  id v10 = v4;
  id v6 = (id)v8;
  long long v11 = v8;
  id v7 = v4;
  dispatch_sync(v5, block);
}

intptr_t __44__MAAutoAsset__eliminateAllForAssetTypeSync__block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
    id v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __44__MAAutoAsset__eliminateAllForAssetTypeSync__block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(eliminateAllForAssetTypeSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for elimination to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (void)eliminatePromotedNeverLockedForSelector:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v18 = 0;
    id v7 = [[MAAutoAsset alloc] initForClientName:@"MA-auto{+eliminatePromotedNeverLockedForSelector}" selectingAsset:v5 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v18];
    long long v8 = v18;
    if (v8)
    {
      id v9 = +[MAAutoAsset defaultDispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__MAAutoAsset_eliminatePromotedNeverLockedForSelector_completion___block_invoke_2;
      block[3] = &unk_1E60056A8;
      id v10 = &v15;
      id v15 = v6;
      id v13 = v5;
      id v14 = v8;
      dispatch_async(v9, block);
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __66__MAAutoAsset_eliminatePromotedNeverLockedForSelector_completion___block_invoke;
      void v16[3] = &unk_1E60056F8;
      id v10 = &v17;
      id v17 = v6;
      [v7 _eliminatePromotedNeverLockedForSelector:v16];
    }
  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain];
    long long v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    long long v8 = [v11 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset eliminatePromotedNeverLockedForSelector:completion:]();
    }
  }
}

uint64_t __66__MAAutoAsset_eliminatePromotedNeverLockedForSelector_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__MAAutoAsset_eliminatePromotedNeverLockedForSelector_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_eliminatePromotedNeverLockedForSelector:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__MAAutoAsset__eliminatePromotedNeverLockedForSelector___block_invoke;
    v8[3] = &unk_1E60054F0;
    v8[4] = self;
    id v9 = v4;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v8];
  }
  else
  {
    id v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _eliminatePromotedNeverLockedForSelector:]();
    }
  }
}

void __56__MAAutoAsset__eliminatePromotedNeverLockedForSelector___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    dispatch_semaphore_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _failedEliminate:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) assetSelector];
    id v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = +[MAAutoAsset frameworkInstanceUUID];
    id v14 = [v13 UUIDString];

    [v12 setSafeObject:v11 forKey:@"instance"];
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO:ELIMINATE_PROMOTED_NEVER_LOCKED_FOR_SELECTOR" clientID:v14 version:0 message:v12];
    id v16 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__MAAutoAsset__eliminatePromotedNeverLockedForSelector___block_invoke_2;
    void v18[3] = &unk_1E6004158;
    id v17 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v17;
    [v16 connectClientSendServerMessage:v15 proxyObject:0 withReply:v18];
  }
}

void __56__MAAutoAsset__eliminatePromotedNeverLockedForSelector___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      uint64_t v7 = @"failure reported by server";
      uint64_t v8 = 0;
      id v9 = v5;
    }
    else
    {
      uint64_t v7 = @"no response message from server";
      uint64_t v8 = 6104;
      id v9 = 0;
    }
    [v6 _failedEliminate:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v6 _successEliminate:*(void *)(a1 + 40)];
  }
}

+ (id)eliminatePromotedNeverLockedForSelectorSync:(id)a3
{
  id v3 = a3;
  id v7 = 0;
  id v4 = [[MAAutoAsset alloc] initForClientName:@"MA-auto{+eliminatePromotedNeverLockedForSelectorSync}" selectingAsset:v3 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v7];

  id v5 = v7;
  if (!v5)
  {
    id v5 = [v4 _eliminatePromotedNeverLockedForSelectorSync];
  }

  return v5;
}

- (id)_eliminatePromotedNeverLockedForSelectorSync
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__5;
  uint64_t v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__MAAutoAsset__eliminatePromotedNeverLockedForSelectorSync__block_invoke;
  v9[3] = &unk_1E6005770;
  id v11 = v14;
  id v12 = &v18;
  id v13 = v16;
  id v4 = v3;
  id v10 = v4;
  [(MAAutoAsset *)self _eliminatePromotedNeverLockedForSelector:v9];
  if (+[MAAutoAsset waitOnSemaphore:v4 withDaemonTriggeredTimeout:-100])
  {
    id v5 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__MAAutoAsset__eliminatePromotedNeverLockedForSelectorSync__block_invoke_3;
    block[3] = &unk_1E6004130;
    void block[4] = v16;
    void block[5] = v14;
    block[6] = &v18;
    dispatch_sync(v5, block);
  }
  id v6 = (id)v19[5];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  return v6;
}

void __59__MAAutoAsset__eliminatePromotedNeverLockedForSelectorSync__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 48);
  block[2] = __59__MAAutoAsset__eliminatePromotedNeverLockedForSelectorSync__block_invoke_2;
  block[3] = &unk_1E6005748;
  id v10 = v4;
  id v6 = (id)v8;
  long long v11 = v8;
  id v7 = v4;
  dispatch_sync(v5, block);
}

intptr_t __59__MAAutoAsset__eliminatePromotedNeverLockedForSelectorSync__block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
    id v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __59__MAAutoAsset__eliminatePromotedNeverLockedForSelectorSync__block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(eliminatePromotedNeverLockedForSelectorSync)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for elimination to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (void)stageDetermineGroupsAvailableForUpdate:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [v5 safeObjectForKey:@"OSVersion" ofClass:objc_opt_class()];
    long long v8 = [v5 safeObjectForKey:@"Build" ofClass:objc_opt_class()];
    id v9 = [v5 safeObjectForKey:@"TrainName" ofClass:objc_opt_class()];
    id v10 = [v5 safeObjectForKey:@"RestoreVersion" ofClass:objc_opt_class()];
    long long v11 = [v5 safeObjectForKey:@"GroupNames" ofClass:objc_opt_class()];
    if (v7 && v8 && v11 && v9 && v10)
    {
      uint64_t v22 = v9;
      long long v12 = [MAAutoAsset alloc];
      id v13 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
      id v14 = +[MAAutoAsset assetSelectorForAssetTargetOSVersion:v7 forTargetBuildVersion:v8];
      id v28 = 0;
      id v21 = [(MAAutoAsset *)v12 initForClientName:v13 selectingAsset:v14 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v28];
      char v15 = v28;

      if (v15)
      {
        id v16 = +[MAAutoAsset defaultDispatchQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke_2;
        block[3] = &unk_1E60042B8;
        char v17 = &v25;
        id v25 = v6;
        id v24 = v15;
        dispatch_async(v16, block);

        uint64_t v18 = v21;
        id v9 = v22;
      }
      else
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke_875;
        void v26[3] = &unk_1E60057C0;
        char v17 = &v27;
        id v27 = v6;
        uint64_t v18 = v21;
        [v21 _stageDetermineGroupsAvailableForUpdate:v5 completion:v26];
        id v9 = v22;
      }
    }
    else
    {
      uint64_t v20 = +[MAAutoAsset defaultDispatchQueue];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke;
      void v29[3] = &unk_1E6005798;
      long long v30 = v7;
      id v31 = v8;
      id v32 = v9;
      id v33 = v10;
      id v34 = v11;
      id v35 = v6;
      dispatch_async(v20, v29);

      char v15 = v30;
    }
  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain];
    id v19 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v7 = [v19 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stageDetermineGroupsAvailableForUpdate:completion:]();
    }
  }
}

void __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke(void *a1)
{
  id v2 = [NSString alloc];
  dispatch_semaphore_t v3 = @"MISSING";
  id v4 = (__CFString *)a1[4];
  id v5 = (__CFString *)a1[5];
  if (!v4) {
    id v4 = @"MISSING";
  }
  if (!v5) {
    id v5 = @"MISSING";
  }
  id v6 = (__CFString *)a1[6];
  id v7 = (__CFString *)a1[7];
  if (!v6) {
    id v6 = @"MISSING";
  }
  if (!v7) {
    id v7 = @"MISSING";
  }
  if (a1[8]) {
    dispatch_semaphore_t v3 = @"Y";
  }
  long long v8 = (void *)[v2 initWithFormat:@"pre-SU-staging by group with missing required updateAttributes | assetTargetOSVersion:%@ | assetTargetBuildVersion:%@ | assetTrainName:%@ | assetRestoreVersion:%@ | assetGroupNames:%@", v4, v5, v6, v7, v3];
  id v9 = +[MAAutoAssetError buildError:6102 fromOperation:@"auto(stageDetermineGroupsAvailableForUpdate)" underlyingError:0 withDescription:v8];
  id v10 = [MEMORY[0x1E4FA56C8] sharedLogger];
  long long v11 = [v10 oslog];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[9] + 16))();
}

uint64_t __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke_875(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (void)_stageDetermineGroupsAvailableForUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__MAAutoAsset__stageDetermineGroupsAvailableForUpdate_completion___block_invoke;
    v10[3] = &unk_1E60041F8;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v10];
  }
  else
  {
    long long v8 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _stageDetermineGroupsAvailableForUpdate:completion:]();
    }
  }
}

void __66__MAAutoAsset__stageDetermineGroupsAvailableForUpdate_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    dispatch_semaphore_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedStageDetermineGroupsAvailableForUpdate:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) assetSelector];
    id v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = [[MAAutoAssetInfoStaging alloc] initWithUpdateAttributes:*(void *)(a1 + 40) withByGroupAvailableForStaging:0 withByGroupTotalExpectedBytes:0];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v14 = +[MAAutoAsset frameworkInstanceUUID];
    char v15 = [v14 UUIDString];

    [v13 setSafeObject:v11 forKey:@"instance"];
    [v13 setSafeObject:v12 forKey:@"staging"];
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-STAGE:DETERMINE_GROUPS_AVAILABLE_FOR_UPDATE" clientID:v15 version:0 message:v13];
    char v17 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __66__MAAutoAsset__stageDetermineGroupsAvailableForUpdate_completion___block_invoke_2;
    void v18[3] = &unk_1E6004158;
    v18[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 48);
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v18];
  }
}

void __66__MAAutoAsset__stageDetermineGroupsAvailableForUpdate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0;
      id v11 = v5;
    }
    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104;
      id v11 = 0;
    }
    [*(id *)(a1 + 32) _failedStageDetermineGroupsAvailableForUpdate:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v12 message];
    uint64_t v7 = [v6 safeObjectForKey:@"staging" ofClass:objc_opt_class()];

    uint64_t v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successStageDetermineGroupsAvailableForUpdate:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedStageDetermineGroupsAvailableForUpdate:6104 withResponseError:0 description:@"no staging-information provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)stageDetermineGroupsAvailableForUpdateSync:(id)a3 totalExpectedBytes:(id *)a4 error:(id *)a5
{
  id v6 = a3;
  uint64_t v7 = [v6 safeObjectForKey:@"OSVersion" ofClass:objc_opt_class()];
  uint64_t v8 = [v6 safeObjectForKey:@"Build" ofClass:objc_opt_class()];
  uint64_t v9 = [v6 safeObjectForKey:@"TrainName" ofClass:objc_opt_class()];
  uint64_t v10 = [v6 safeObjectForKey:@"RestoreVersion" ofClass:objc_opt_class()];
  uint64_t v11 = [v6 safeObjectForKey:@"GroupNames" ofClass:objc_opt_class()];
  id v12 = (void *)v11;
  id v29 = (void *)v9;
  if (v7 && v8 && v11)
  {
    id v28 = a4;
    id v13 = [MAAutoAsset alloc];
    id v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
    char v15 = +[MAAutoAsset assetSelectorForAssetTargetOSVersion:v7 forTargetBuildVersion:v8];
    id v32 = 0;
    id v16 = [(MAAutoAsset *)v13 initForClientName:v14 selectingAsset:v15 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v32];
    id v17 = v32;

    if (!v17)
    {
      id v31 = 0;
      uint64_t v18 = [v16 _stageDetermineGroupsAvailableForUpdateSync:v6 totalExpectedBytes:v28 error:&v31];
      id v17 = v31;
      goto LABEL_24;
    }
  }
  else
  {
    id v19 = [NSString alloc];
    uint64_t v20 = @"MISSING";
    if (v7) {
      id v21 = v7;
    }
    else {
      id v21 = @"MISSING";
    }
    if (v8) {
      uint64_t v22 = v8;
    }
    else {
      uint64_t v22 = @"MISSING";
    }
    if (v9) {
      id v23 = (__CFString *)v9;
    }
    else {
      id v23 = @"MISSING";
    }
    if (v10) {
      id v24 = v10;
    }
    else {
      id v24 = @"MISSING";
    }
    if (v12) {
      uint64_t v20 = @"present";
    }
    id v16 = (id)[v19 initWithFormat:@"pre-SU-staging by group with missing required updateAttributes | assetTargetOSVersion:%@ | assetTargetBuildVersion:%@ | assetTrainName:%@ | assetRestoreVersion:%@ | assetGroupNames:%@", v21, v22, v23, v24, v20];
    id v17 = +[MAAutoAssetError buildError:6102 fromOperation:@"auto(stageDetermineGroupsAvailableForUpdateSync)" underlyingError:0 withDescription:v16];
    id v25 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v26 = [v25 oslog];

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stageDetermineGroupsAvailableForUpdateSync:totalExpectedBytes:error:]();
    }
  }
  uint64_t v18 = 0;
LABEL_24:

  if (a5) {
    *a5 = v17;
  }

  return v18;
}

- (id)_stageDetermineGroupsAvailableForUpdateSync:(id)a3 totalExpectedBytes:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = __Block_byref_object_copy__5;
  id v42 = __Block_byref_object_dispose__5;
  id v43 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__5;
  char v36 = __Block_byref_object_dispose__5;
  id v37 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__5;
  long long v30 = __Block_byref_object_dispose__5;
  id v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__MAAutoAsset__stageDetermineGroupsAvailableForUpdateSync_totalExpectedBytes_error___block_invoke;
  v15[3] = &unk_1E60057E8;
  id v17 = v22;
  uint64_t v18 = &v38;
  id v19 = &v32;
  uint64_t v20 = &v26;
  id v21 = v24;
  uint64_t v10 = v9;
  id v16 = v10;
  [(MAAutoAsset *)self _stageDetermineGroupsAvailableForUpdate:v8 completion:v15];
  if (+[MAAutoAsset waitOnSemaphore:v10 withDaemonTriggeredTimeout:-100])
  {
    uint64_t v11 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__MAAutoAsset__stageDetermineGroupsAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_3;
    block[3] = &unk_1E6005810;
    void block[4] = v24;
    void block[5] = v22;
    block[6] = &v38;
    void block[7] = &v32;
    void block[8] = &v26;
    dispatch_sync(v11, block);
  }
  if (a4) {
    *a4 = (id) v33[5];
  }
  if (a5) {
    *a5 = (id) v27[5];
  }
  id v12 = (id)v39[5];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v12;
}

void __84__MAAutoAsset__stageDetermineGroupsAvailableForUpdateSync_totalExpectedBytes_error___block_invoke(_OWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v16 = a1[2];
  long long v11 = a1[4];
  long long v22 = a1[3];
  long long v23 = v11;
  block[2] = __84__MAAutoAsset__stageDetermineGroupsAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_2;
  block[3] = &unk_1E60054A0;
  id v18 = v7;
  id v19 = v8;
  id v20 = v9;
  id v12 = (id)v16;
  long long v21 = v16;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  dispatch_sync(v10, block);
}

intptr_t __84__MAAutoAsset__stageDetermineGroupsAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 64) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 72) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 80) + 8) + 40), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 88) + 8) + 40), *(id *)(v1 + 48));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 96) + 8) + 24) = 1;
    id v2 = *(NSObject **)(v1 + 56);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__84__MAAutoAsset__stageDetermineGroupsAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    dispatch_semaphore_t v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    uint64_t v4 = *(void *)(v1[7] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    *(void *)(*(void *)(v1[8] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(stageDetermineGroupsAvailableForUpdate)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for stage-determine-groups-available-for-update to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (void)stageDetermineAllAvailableForUpdate:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [v5 safeObjectForKey:@"OSVersion" ofClass:objc_opt_class()];
    uint64_t v8 = [v5 safeObjectForKey:@"Build" ofClass:objc_opt_class()];
    if (!v7) {
      id v7 = @"STAGE_GENERAL";
    }
    if (v8) {
      id v9 = (__CFString *)v8;
    }
    else {
      id v9 = @"STAGE_GENERAL";
    }
    uint64_t v10 = [MAAutoAsset alloc];
    long long v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
    id v12 = +[MAAutoAsset assetSelectorForAssetTargetOSVersion:v7 forTargetBuildVersion:v9];
    id v23 = 0;
    id v13 = [(MAAutoAsset *)v10 initForClientName:v11 selectingAsset:v12 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v23];
    id v14 = v23;

    if (v14)
    {
      id v15 = +[MAAutoAsset defaultDispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__MAAutoAsset_stageDetermineAllAvailableForUpdate_completion___block_invoke_2;
      block[3] = &unk_1E60042B8;
      long long v16 = &v20;
      id v20 = v6;
      id v19 = v14;
      dispatch_async(v15, block);
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __62__MAAutoAsset_stageDetermineAllAvailableForUpdate_completion___block_invoke;
      void v21[3] = &unk_1E6005838;
      long long v16 = &v22;
      id v22 = v6;
      [v13 _stageDetermineAllAvailableForUpdate:v5 completion:v21];
    }
  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain];
    id v17 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v14 = [v17 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stageDetermineAllAvailableForUpdate:completion:]();
    }
  }
}

uint64_t __62__MAAutoAsset_stageDetermineAllAvailableForUpdate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__MAAutoAsset_stageDetermineAllAvailableForUpdate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (void)_stageDetermineAllAvailableForUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63__MAAutoAsset__stageDetermineAllAvailableForUpdate_completion___block_invoke;
    v10[3] = &unk_1E60041F8;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v10];
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _stageDetermineAllAvailableForUpdate:completion:]();
    }
  }
}

void __63__MAAutoAsset__stageDetermineAllAvailableForUpdate_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    dispatch_semaphore_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedStageDetermineAllAvailable:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) assetSelector];
    uint64_t v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = [[MAAutoAssetInfoStaging alloc] initWithAvailableForStaging:*(void *)(a1 + 40) withTotalExpectedBytes:0];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v14 = +[MAAutoAsset frameworkInstanceUUID];
    id v15 = [v14 UUIDString];

    [v13 setSafeObject:v11 forKey:@"instance"];
    [v13 setSafeObject:v12 forKey:@"staging"];
    long long v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE_FOR_UPDATE" clientID:v15 version:0 message:v13];
    id v17 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __63__MAAutoAsset__stageDetermineAllAvailableForUpdate_completion___block_invoke_2;
    void v18[3] = &unk_1E6004158;
    v18[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 48);
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v18];
  }
}

void __63__MAAutoAsset__stageDetermineAllAvailableForUpdate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0;
      id v11 = v5;
    }
    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104;
      id v11 = 0;
    }
    [*(id *)(a1 + 32) _failedStageDetermineAllAvailable:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v12 message];
    uint64_t v7 = [v6 safeObjectForKey:@"staging" ofClass:objc_opt_class()];

    uint64_t v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successStageDetermineAllAvailable:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedStageDetermineAllAvailable:6104 withResponseError:0 description:@"no staging-information provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)stageDetermineAllAvailableForUpdateSync:(id)a3 totalExpectedBytes:(unint64_t *)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = [v7 safeObjectForKey:@"OSVersion" ofClass:objc_opt_class()];
  uint64_t v9 = [v7 safeObjectForKey:@"Build" ofClass:objc_opt_class()];
  if (!v8) {
    uint64_t v8 = @"TargetOSVersion";
  }
  if (v9) {
    uint64_t v10 = (__CFString *)v9;
  }
  else {
    uint64_t v10 = @"TargetBuildVersion";
  }
  id v11 = [MAAutoAsset alloc];
  id v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
  id v13 = +[MAAutoAsset assetSelectorForAssetTargetOSVersion:v8 forTargetBuildVersion:v10];
  id v19 = 0;
  id v14 = [(MAAutoAsset *)v11 initForClientName:v12 selectingAsset:v13 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v19];
  id v15 = v19;

  if (v15)
  {
    long long v16 = 0;
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v18 = 0;
  long long v16 = [v14 _stageDetermineAllAvailableForUpdateSync:v7 totalExpectedBytes:a4 error:&v18];
  id v15 = v18;
  if (a5) {
LABEL_8:
  }
    *a5 = v15;
LABEL_9:

  return v16;
}

- (id)_stageDetermineAllAvailableForUpdateSync:(id)a3 totalExpectedBytes:(unint64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__5;
  uint64_t v40 = __Block_byref_object_dispose__5;
  id v41 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__5;
  long long v30 = __Block_byref_object_dispose__5;
  id v31 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__MAAutoAsset__stageDetermineAllAvailableForUpdateSync_totalExpectedBytes_error___block_invoke;
  v15[3] = &unk_1E6005888;
  id v17 = v22;
  id v18 = &v36;
  id v19 = &v32;
  id v20 = &v26;
  long long v21 = v24;
  uint64_t v10 = v9;
  long long v16 = v10;
  [(MAAutoAsset *)self _stageDetermineAllAvailableForUpdate:v8 completion:v15];
  if (+[MAAutoAsset waitOnSemaphore:v10 withDaemonTriggeredTimeout:-100])
  {
    id v11 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__MAAutoAsset__stageDetermineAllAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_3;
    block[3] = &unk_1E6005810;
    void block[4] = v24;
    void block[5] = v22;
    block[6] = &v36;
    void block[7] = &v32;
    void block[8] = &v26;
    dispatch_sync(v11, block);
  }
  if (a4) {
    *a4 = v33[3];
  }
  if (a5) {
    *a5 = (id) v27[5];
  }
  id v12 = (id)v37[5];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v12;
}

void __81__MAAutoAsset__stageDetermineAllAvailableForUpdateSync_totalExpectedBytes_error___block_invoke(_OWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  dispatch_semaphore_t v9 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v10 = a1[4];
  long long v14 = a1[2];
  long long v19 = a1[3];
  long long v20 = v10;
  block[2] = __81__MAAutoAsset__stageDetermineAllAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_2;
  block[3] = &unk_1E6005860;
  uint64_t v21 = a3;
  id v16 = v7;
  id v17 = v8;
  id v11 = (id)v14;
  long long v18 = v14;
  id v12 = v8;
  id v13 = v7;
  dispatch_sync(v9, block);
}

intptr_t __81__MAAutoAsset__stageDetermineAllAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    *(void *)(*(void *)(*(void *)(v1 + 72) + 8) + 24) = *(void *)(v1 + 96);
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 80) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 88) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__81__MAAutoAsset__stageDetermineAllAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    dispatch_semaphore_t v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    *(void *)(*(void *)(v1[7] + 8) + 24) = 0;
    *(void *)(*(void *)(v1[8] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(stageDetermineAllAvailableForUpdate)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for stage-determine-all-available to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (void)stageDetermineAllAvailable:(id)a3 forTargetBuildVersion:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    long long v10 = [MAAutoAsset alloc];
    id v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
    id v12 = +[MAAutoAsset assetSelectorForAssetTargetOSVersion:v7 forTargetBuildVersion:v8];
    id v23 = 0;
    id v13 = [(MAAutoAsset *)v10 initForClientName:v11 selectingAsset:v12 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v23];
    long long v14 = v23;

    if (v14)
    {
      id v15 = +[MAAutoAsset defaultDispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __75__MAAutoAsset_stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke_2;
      block[3] = &unk_1E60042B8;
      id v16 = &v20;
      id v20 = v9;
      long long v19 = v14;
      dispatch_async(v15, block);
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __75__MAAutoAsset_stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke;
      void v21[3] = &unk_1E6005838;
      id v16 = &v22;
      id v22 = v9;
      [v13 _stageDetermineAllAvailable:v7 forTargetBuildVersion:v8 completion:v21];
    }
  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain];
    id v17 = [MEMORY[0x1E4FA56C8] sharedLogger];
    long long v14 = [v17 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stageDetermineAllAvailable:forTargetBuildVersion:completion:]();
    }
  }
}

uint64_t __75__MAAutoAsset_stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__MAAutoAsset_stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (void)_stageDetermineAllAvailable:(id)a3 forTargetBuildVersion:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76__MAAutoAsset__stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke;
    v10[3] = &unk_1E60054F0;
    void v10[4] = self;
    id v11 = v6;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v10];
  }
  else
  {
    id v8 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v9 = [v8 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _stageDetermineAllAvailable:forTargetBuildVersion:completion:]();
    }
  }
}

void __76__MAAutoAsset__stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    dispatch_semaphore_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _failedStageDetermineAllAvailable:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) assetSelector];
    long long v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = +[MAAutoAsset frameworkInstanceUUID];
    long long v14 = [v13 UUIDString];

    [v12 setSafeObject:v11 forKey:@"instance"];
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE" clientID:v14 version:0 message:v12];
    id v16 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__MAAutoAsset__stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke_2;
    void v18[3] = &unk_1E6004158;
    id v17 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v17;
    [v16 connectClientSendServerMessage:v15 proxyObject:0 withReply:v18];
  }
}

void __76__MAAutoAsset__stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0;
      id v11 = v5;
    }
    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104;
      id v11 = 0;
    }
    [*(id *)(a1 + 32) _failedStageDetermineAllAvailable:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [v12 message];
    uint64_t v7 = [v6 safeObjectForKey:@"staging" ofClass:objc_opt_class()];

    uint64_t v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successStageDetermineAllAvailable:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedStageDetermineAllAvailable:6104 withResponseError:0 description:@"no staging-information provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)stageDetermineAllAvailableSync:(id)a3 forTargetBuildVersion:(id)a4 totalExpectedBytes:(unint64_t *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [MAAutoAsset alloc];
  id v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
  id v13 = +[MAAutoAsset assetSelectorForAssetTargetOSVersion:v9 forTargetBuildVersion:v10];
  id v19 = 0;
  id v14 = [(MAAutoAsset *)v11 initForClientName:v12 selectingAsset:v13 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v19];
  id v15 = v19;

  if (v15)
  {
    id v16 = 0;
    if (!a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v18 = 0;
  id v16 = [v14 _stageDetermineAllAvailableSync:v9 forTargetBuildVersion:v10 totalExpectedBytes:a5 error:&v18];
  id v15 = v18;
  if (a6) {
LABEL_3:
  }
    *a6 = v15;
LABEL_4:

  return v16;
}

- (id)_stageDetermineAllAvailableSync:(id)a3 forTargetBuildVersion:(id)a4 totalExpectedBytes:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  id v42 = __Block_byref_object_copy__5;
  id v43 = __Block_byref_object_dispose__5;
  id v44 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__5;
  id v33 = __Block_byref_object_dispose__5;
  id v34 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__MAAutoAsset__stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error___block_invoke;
  void v18[3] = &unk_1E6005888;
  id v20 = v25;
  uint64_t v21 = &v39;
  id v22 = &v35;
  id v23 = &v29;
  id v24 = v27;
  id v13 = v12;
  id v19 = v13;
  [(MAAutoAsset *)self _stageDetermineAllAvailable:v10 forTargetBuildVersion:v11 completion:v18];
  if (+[MAAutoAsset waitOnSemaphore:v13 withDaemonTriggeredTimeout:-100])
  {
    id v14 = +[MAAutoAsset frameworkDispatchQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __94__MAAutoAsset__stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error___block_invoke_3;
    void v17[3] = &unk_1E6005810;
    void v17[4] = v27;
    v17[5] = v25;
    v17[6] = &v39;
    v17[7] = &v35;
    v17[8] = &v29;
    dispatch_sync(v14, v17);
  }
  if (a5) {
    *a5 = v36[3];
  }
  if (a6) {
    *a6 = (id) v30[5];
  }
  id v15 = (id)v40[5];

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v15;
}

void __94__MAAutoAsset__stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error___block_invoke(_OWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v10 = a1[4];
  long long v14 = a1[2];
  long long v19 = a1[3];
  long long v20 = v10;
  block[2] = __94__MAAutoAsset__stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error___block_invoke_2;
  block[3] = &unk_1E6005860;
  uint64_t v21 = a3;
  id v16 = v7;
  id v17 = v8;
  id v11 = (id)v14;
  long long v18 = v14;
  id v12 = v8;
  id v13 = v7;
  dispatch_sync(v9, block);
}

intptr_t __94__MAAutoAsset__stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 56) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8) + 40), *(id *)(result + 32));
    *(void *)(*(void *)(*(void *)(v1 + 72) + 8) + 24) = *(void *)(v1 + 96);
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 80) + 8) + 40), *(id *)(v1 + 40));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 88) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 48);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__94__MAAutoAsset__stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    dispatch_semaphore_t v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    *(void *)(*(void *)(v1[7] + 8) + 24) = 0;
    *(void *)(*(void *)(v1[8] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(stageDetermineAllAvailable)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for stage-determine-all-available to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (void)stageDownloadGroups:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  if (v13)
  {
    BOOL v32 = v10;
    int64_t v33 = a5;
    long long v14 = [v11 safeObjectForKey:@"OSVersion" ofClass:objc_opt_class()];
    id v15 = [v11 safeObjectForKey:@"Build" ofClass:objc_opt_class()];
    uint64_t v16 = [v11 safeObjectForKey:@"TrainName" ofClass:objc_opt_class()];
    id v17 = [v11 safeObjectForKey:@"RestoreVersion" ofClass:objc_opt_class()];
    long long v18 = [v11 safeObjectForKey:@"GroupNames" ofClass:objc_opt_class()];
    if (v14 && v15 && v18 && v16 && v17)
    {
      id v30 = v12;
      uint64_t v31 = (void *)v16;
      long long v19 = [MAAutoAsset alloc];
      long long v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
      uint64_t v21 = +[MAAutoAsset assetSelectorForAssetTargetOSVersion:v14 forTargetBuildVersion:v15];
      id v39 = 0;
      id v29 = [(MAAutoAsset *)v19 initForClientName:v20 selectingAsset:v21 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v39];
      id v22 = v39;

      if (v22)
      {
        id v23 = +[MAAutoAsset defaultDispatchQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_2;
        block[3] = &unk_1E60042B8;
        id v24 = &v36;
        id v36 = v13;
        uint64_t v35 = v22;
        dispatch_async(v23, block);

        char v25 = v29;
        id v12 = v30;
      }
      else
      {
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_914;
        v37[3] = &unk_1E60057C0;
        id v24 = &v38;
        id v38 = v13;
        char v25 = v29;
        id v12 = v30;
        [v29 _stageDownloadGroups:v11 awaitingAllGroups:v32 withStagingTimeout:v33 reportingProgress:v30 completion:v37];
      }

      id v27 = v31;
    }
    else
    {
      +[MAAutoAsset defaultDispatchQueue];
      v28 = id v27 = (void *)v16;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke;
      v40[3] = &unk_1E6005798;
      uint64_t v41 = v14;
      id v42 = v15;
      id v43 = v27;
      id v44 = v17;
      id v45 = v18;
      id v46 = v13;
      dispatch_async(v28, v40);

      id v22 = v41;
    }
  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain];
    char v26 = [MEMORY[0x1E4FA56C8] sharedLogger];
    long long v14 = [v26 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:]();
    }
  }
}

void __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke(void *a1)
{
  id v2 = [NSString alloc];
  dispatch_semaphore_t v3 = @"MISSING";
  uint64_t v4 = (__CFString *)a1[4];
  id v5 = (__CFString *)a1[5];
  if (!v4) {
    uint64_t v4 = @"MISSING";
  }
  if (!v5) {
    id v5 = @"MISSING";
  }
  id v6 = (__CFString *)a1[6];
  id v7 = (__CFString *)a1[7];
  if (!v6) {
    id v6 = @"MISSING";
  }
  if (!v7) {
    id v7 = @"MISSING";
  }
  if (a1[8]) {
    dispatch_semaphore_t v3 = @"present";
  }
  id v8 = (void *)[v2 initWithFormat:@"pre-SU-staging by group with missing required updateAttributes | assetTargetOSVersion:%@ | assetTargetBuildVersion:%@ | assetTrainName:%@ | assetRestoreVersion:%@ | assetGroupNames:%@", v4, v5, v6, v7, v3];
  id v9 = +[MAAutoAssetError buildError:6102 fromOperation:@"auto(stageDownloadGroups)" underlyingError:0 withDescription:v8];
  BOOL v10 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v11 = [v10 oslog];

  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[9] + 16))();
}

uint64_t __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_914(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (void)_stageDownloadGroups:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (v14)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __102__MAAutoAsset__stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke;
    void v17[3] = &unk_1E60058B0;
    BOOL v22 = a4;
    void v17[4] = self;
    int64_t v21 = a5;
    id v19 = v13;
    id v18 = v12;
    id v20 = v14;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v17];
  }
  else
  {
    id v15 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v16 = [v15 oslog];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:]();
    }
  }
}

void __102__MAAutoAsset__stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    dispatch_semaphore_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 56);
    [v3 _failedStageDownloadGroups:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) assetSelector];
    BOOL v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = [MAAutoAssetInfoDesire alloc];
    if (*(unsigned char *)(a1 + 72)) {
      uint64_t v13 = -1;
    }
    else {
      uint64_t v13 = -2;
    }
    id v14 = [(MAAutoAssetInfoDesire *)v12 initWithDesiredCategory:0 forClientAssetPolicy:0 reasonDesired:0 withCheckWaitTimeout:v13 withLockWaitTimeout:*(void *)(a1 + 64) desiringProgress:*(void *)(a1 + 48) != 0];
    id v15 = [[MAAutoAssetInfoStaging alloc] initWithUpdateAttributes:*(void *)(a1 + 40) withByGroupAvailableForStaging:0 withByGroupTotalExpectedBytes:0];
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v17 = +[MAAutoAsset frameworkInstanceUUID];
    id v18 = [v17 UUIDString];

    [v16 setSafeObject:v11 forKey:@"instance"];
    [v16 setSafeObject:v14 forKey:@"desire"];
    [v16 setSafeObject:v15 forKey:@"staging"];
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-STAGE:DOWNLOAD_GROUPS" clientID:v18 version:0 message:v16];
    id v20 = (void *)[*(id *)(a1 + 32) _newProxyObjectForStageProgressBlock:*(void *)(a1 + 48)];
    int64_t v21 = (void *)__maAutoAssetSharedConnectionClient;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __102__MAAutoAsset__stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_2;
    void v24[3] = &unk_1E6005540;
    uint64_t v22 = *(void *)(a1 + 32);
    id v25 = v20;
    uint64_t v26 = v22;
    id v27 = *(id *)(a1 + 56);
    id v23 = v20;
    [v21 connectClientSendServerMessage:v19 proxyObject:v23 withReply:v24];
  }
}

void __102__MAAutoAsset__stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0;
      id v11 = v5;
    }
    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104;
      id v11 = 0;
    }
    [*(id *)(a1 + 40) _failedStageDownloadGroups:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 48)];
  }
  else
  {
    id v6 = [v12 message];
    uint64_t v7 = [v6 safeObjectForKey:@"staged" ofClass:objc_opt_class()];

    uint64_t v8 = *(void **)(a1 + 40);
    if (v7) {
      [v8 _successStageDownloadGroups:v7 completion:*(void *)(a1 + 48)];
    }
    else {
      [v8 _failedStageDownloadGroups:6104 withResponseError:0 description:@"no staged-information provided by server" completion:*(void *)(a1 + 48)];
    }
  }
}

+ (id)stageDownloadGroupsSync:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 byGroupAssetsStaged:(id *)a6 error:(id *)a7 reportingProgress:(id)a8
{
  BOOL v37 = a4;
  id v11 = a3;
  id v12 = a8;
  uint64_t v13 = [v11 safeObjectForKey:@"OSVersion" ofClass:objc_opt_class()];
  id v14 = [v11 safeObjectForKey:@"Build" ofClass:objc_opt_class()];
  uint64_t v15 = [v11 safeObjectForKey:@"TrainName" ofClass:objc_opt_class()];
  id v16 = [v11 safeObjectForKey:@"RestoreVersion" ofClass:objc_opt_class()];
  uint64_t v17 = [v11 safeObjectForKey:@"GroupNames" ofClass:objc_opt_class()];
  id v18 = (void *)v17;
  id v38 = (void *)v15;
  if (v13 && v14 && v17)
  {
    int64_t v34 = a5;
    uint64_t v35 = a6;
    id v36 = v12;
    id v19 = [MAAutoAsset alloc];
    id v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
    int64_t v21 = +[MAAutoAsset assetSelectorForAssetTargetOSVersion:v13 forTargetBuildVersion:v14];
    id v41 = 0;
    id v22 = [(MAAutoAsset *)v19 initForClientName:v20 selectingAsset:v21 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v41];
    id v23 = v41;

    if (v23)
    {
      id v24 = 0;
      id v12 = v36;
    }
    else
    {
      id v40 = 0;
      id v12 = v36;
      id v24 = [v22 _stageDownloadGroupsSync:v11 awaitingAllGroups:v37 withStagingTimeout:v34 byGroupAssetsStaged:v35 error:&v40 reportingProgress:v36];
      id v23 = v40;
    }
  }
  else
  {
    id v25 = [NSString alloc];
    uint64_t v26 = @"MISSING";
    if (v13) {
      id v27 = v13;
    }
    else {
      id v27 = @"MISSING";
    }
    if (v14) {
      char v28 = v14;
    }
    else {
      char v28 = @"MISSING";
    }
    if (v15) {
      id v29 = (__CFString *)v15;
    }
    else {
      id v29 = @"MISSING";
    }
    if (v16) {
      id v30 = v16;
    }
    else {
      id v30 = @"MISSING";
    }
    if (v18) {
      uint64_t v26 = @"present";
    }
    id v22 = (id)[v25 initWithFormat:@"pre-SU-staging by group with missing required updateAttributes | assetTargetOSVersion:%@ | assetTargetBuildVersion:%@ | assetTrainName:%@ | assetRestoreVersion:%@ | assetGroupNames:%@", v27, v28, v29, v30, v26];
    id v23 = +[MAAutoAssetError buildError:6102 fromOperation:@"auto(stageDownloadGroupsSync)" underlyingError:0 withDescription:v22];
    uint64_t v31 = [MEMORY[0x1E4FA56C8] sharedLogger];
    BOOL v32 = [v31 oslog];

    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stageDownloadGroupsSync:awaitingAllGroups:withStagingTimeout:byGroupAssetsStaged:error:reportingProgress:]();
    }

    id v24 = 0;
  }

  if (a7) {
    *a7 = v23;
  }

  return v24;
}

- (id)_stageDownloadGroupsSync:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 byGroupAssetsStaged:(id *)a6 error:(id *)a7 reportingProgress:(id)a8
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a8;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x3032000000;
  uint64_t v49 = __Block_byref_object_copy__5;
  v50 = __Block_byref_object_dispose__5;
  id v51 = 0;
  uint64_t v40 = 0;
  id v41 = &v40;
  uint64_t v42 = 0x3032000000;
  id v43 = __Block_byref_object_copy__5;
  id v44 = __Block_byref_object_dispose__5;
  id v45 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  BOOL v37 = __Block_byref_object_copy__5;
  id v38 = __Block_byref_object_dispose__5;
  id v39 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  char v31 = 0;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __121__MAAutoAsset__stageDownloadGroupsSync_awaitingAllGroups_withStagingTimeout_byGroupAssetsStaged_error_reportingProgress___block_invoke;
  v23[3] = &unk_1E60057E8;
  id v25 = v30;
  uint64_t v26 = &v46;
  id v27 = &v40;
  char v28 = &v34;
  id v29 = v32;
  uint64_t v15 = v12;
  id v16 = v14;
  id v24 = v16;
  [(MAAutoAsset *)self _stageDownloadGroups:v12 awaitingAllGroups:v10 withStagingTimeout:a5 reportingProgress:v13 completion:v23];
  if (+[MAAutoAsset waitOnSemaphore:v16 withDaemonTriggeredTimeout:a5])
  {
    uint64_t v17 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__MAAutoAsset__stageDownloadGroupsSync_awaitingAllGroups_withStagingTimeout_byGroupAssetsStaged_error_reportingProgress___block_invoke_3;
    block[3] = &unk_1E6005810;
    void block[4] = v32;
    void block[5] = v30;
    block[6] = &v46;
    void block[7] = &v40;
    void block[8] = &v34;
    dispatch_sync(v17, block);
  }
  if (a6) {
    *a6 = (id) v41[5];
  }
  if (a7) {
    *a7 = (id) v35[5];
  }
  id v18 = (id)v47[5];

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v18;
}

void __121__MAAutoAsset__stageDownloadGroupsSync_awaitingAllGroups_withStagingTimeout_byGroupAssetsStaged_error_reportingProgress___block_invoke(_OWORD *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v16 = a1[2];
  long long v11 = a1[4];
  long long v22 = a1[3];
  long long v23 = v11;
  block[2] = __121__MAAutoAsset__stageDownloadGroupsSync_awaitingAllGroups_withStagingTimeout_byGroupAssetsStaged_error_reportingProgress___block_invoke_2;
  block[3] = &unk_1E60054A0;
  id v18 = v7;
  id v19 = v8;
  id v20 = v9;
  id v12 = (id)v16;
  long long v21 = v16;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  dispatch_sync(v10, block);
}

intptr_t __121__MAAutoAsset__stageDownloadGroupsSync_awaitingAllGroups_withStagingTimeout_byGroupAssetsStaged_error_reportingProgress___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 64) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 72) + 8) + 40), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 80) + 8) + 40), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 88) + 8) + 40), *(id *)(v1 + 48));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 96) + 8) + 24) = 1;
    id v2 = *(NSObject **)(v1 + 56);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

void *__121__MAAutoAsset__stageDownloadGroupsSync_awaitingAllGroups_withStagingTimeout_byGroupAssetsStaged_error_reportingProgress___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    uint64_t v2 = *(void *)(result[6] + 8);
    dispatch_semaphore_t v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    uint64_t v4 = *(void *)(v1[7] + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;

    *(void *)(*(void *)(v1[8] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(stageDownloadGroups)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for stage-download-groups to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (void)stageDownloadAll:(int64_t)a3 reportingProgress:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    id v9 = [MAAutoAsset alloc];
    BOOL v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
    long long v11 = +[MAAutoAsset assetSelectorForAssetTargetOSVersion:0 forTargetBuildVersion:0];
    id v22 = 0;
    id v12 = [(MAAutoAsset *)v9 initForClientName:v10 selectingAsset:v11 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v22];
    id v13 = v22;

    if (v13)
    {
      id v14 = +[MAAutoAsset defaultDispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__MAAutoAsset_stageDownloadAll_reportingProgress_completion___block_invoke_2;
      block[3] = &unk_1E60042B8;
      id v15 = &v19;
      id v19 = v8;
      id v18 = v13;
      dispatch_async(v14, block);
    }
    else
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __61__MAAutoAsset_stageDownloadAll_reportingProgress_completion___block_invoke;
      void v20[3] = &unk_1E60058D8;
      id v15 = &v21;
      id v21 = v8;
      [v12 _stageDownloadAll:a3 reportingProgress:v7 completion:v20];
    }
  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain];
    long long v16 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v13 = [v16 oslog];

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stageDownloadAll:reportingProgress:completion:]();
    }
  }
}

uint64_t __61__MAAutoAsset_stageDownloadAll_reportingProgress_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__MAAutoAsset_stageDownloadAll_reportingProgress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32));
}

- (void)_stageDownloadAll:(int64_t)a3 reportingProgress:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__MAAutoAsset__stageDownloadAll_reportingProgress_completion___block_invoke;
    v12[3] = &unk_1E6005900;
    void v12[4] = self;
    int64_t v15 = a3;
    id v13 = v8;
    id v14 = v9;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v12];
  }
  else
  {
    BOOL v10 = [MEMORY[0x1E4FA56C8] sharedLogger];
    long long v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _stageDownloadAll:reportingProgress:completion:]();
    }
  }
}

void __62__MAAutoAsset__stageDownloadAll_reportingProgress_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    dispatch_semaphore_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    [v3 _failedStageDownloadAll:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) assetSelector];
    BOOL v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = [[MAAutoAssetInfoDesire alloc] initWithDesiredCategory:0 forClientAssetPolicy:0 reasonDesired:0 withCheckWaitTimeout:-2 withLockWaitTimeout:*(void *)(a1 + 56) desiringProgress:*(void *)(a1 + 40) != 0];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v14 = +[MAAutoAsset frameworkInstanceUUID];
    int64_t v15 = [v14 UUIDString];

    [v13 setSafeObject:v11 forKey:@"instance"];
    [v13 setSafeObject:v12 forKey:@"desire"];
    long long v16 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-STAGE:DOWNLOAD_ALL" clientID:v15 version:0 message:v13];
    uint64_t v17 = (void *)[*(id *)(a1 + 32) _newProxyObjectForStageProgressBlock:*(void *)(a1 + 40)];
    id v18 = (void *)__maAutoAssetSharedConnectionClient;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __62__MAAutoAsset__stageDownloadAll_reportingProgress_completion___block_invoke_2;
    void v21[3] = &unk_1E6005540;
    uint64_t v19 = *(void *)(a1 + 32);
    id v22 = v17;
    uint64_t v23 = v19;
    id v24 = *(id *)(a1 + 48);
    id v20 = v17;
    [v18 connectClientSendServerMessage:v16 proxyObject:v20 withReply:v21];
  }
}

void __62__MAAutoAsset__stageDownloadAll_reportingProgress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0;
      id v11 = v5;
    }
    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104;
      id v11 = 0;
    }
    [*(id *)(a1 + 40) _failedStageDownloadAll:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 48)];
  }
  else
  {
    id v6 = [v12 message];
    uint64_t v7 = [v6 safeObjectForKey:@"staged" ofClass:objc_opt_class()];

    uint64_t v8 = *(void **)(a1 + 40);
    if (v7) {
      [v8 _successStageDownloadAll:v7 completion:*(void *)(a1 + 48)];
    }
    else {
      [v8 _failedStageDownloadAll:6104 withResponseError:0 description:@"no staged-information provided by server" completion:*(void *)(a1 + 48)];
    }
  }
}

+ (unint64_t)stageDownloadAllSync:(int64_t)a3 assetsSuccessfullyStaged:(int64_t *)a4 error:(id *)a5 reportingProgress:(id)a6
{
  id v9 = a6;
  uint64_t v10 = [MAAutoAsset alloc];
  id v11 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
  id v12 = +[MAAutoAsset assetSelectorForAssetTargetOSVersion:0 forTargetBuildVersion:0];
  id v18 = 0;
  id v13 = [(MAAutoAsset *)v10 initForClientName:v11 selectingAsset:v12 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v18];
  id v14 = v18;

  if (!v14)
  {
    id v17 = 0;
    unint64_t v15 = [v13 _stageDownloadAllSync:a3 assetsSuccessfullyStaged:a4 error:&v17 reportingProgress:v9];
    id v14 = v17;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  unint64_t v15 = 0;
  if (a5) {
LABEL_3:
  }
    *a5 = v14;
LABEL_4:

  return v15;
}

- (unint64_t)_stageDownloadAllSync:(int64_t)a3 assetsSuccessfullyStaged:(int64_t *)a4 error:(id *)a5 reportingProgress:(id)a6
{
  id v10 = a6;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  char v31 = __Block_byref_object_copy__5;
  BOOL v32 = __Block_byref_object_dispose__5;
  id v33 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  char v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __86__MAAutoAsset__stageDownloadAllSync_assetsSuccessfullyStaged_error_reportingProgress___block_invoke;
  void v17[3] = &unk_1E6005950;
  uint64_t v19 = v24;
  id v20 = &v38;
  id v21 = &v34;
  id v22 = &v28;
  uint64_t v23 = v26;
  id v12 = v11;
  id v18 = v12;
  [(MAAutoAsset *)self _stageDownloadAll:a3 reportingProgress:v10 completion:v17];
  if (+[MAAutoAsset waitOnSemaphore:v12 withDaemonTriggeredTimeout:a3])
  {
    id v13 = +[MAAutoAsset frameworkDispatchQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __86__MAAutoAsset__stageDownloadAllSync_assetsSuccessfullyStaged_error_reportingProgress___block_invoke_3;
    void v16[3] = &unk_1E6005810;
    void v16[4] = v26;
    v16[5] = v24;
    v16[6] = &v38;
    v16[7] = &v34;
    v16[8] = &v28;
    dispatch_sync(v13, v16);
  }
  if (a4) {
    *a4 = v35[3];
  }
  if (a5) {
    *a5 = (id) v29[5];
  }
  unint64_t v14 = v39[3];

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  return v14;
}

void __86__MAAutoAsset__stageDownloadAllSync_assetsSuccessfullyStaged_error_reportingProgress___block_invoke(_OWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v12 = a1[2];
  long long v9 = a1[4];
  long long v16 = a1[3];
  long long v17 = v9;
  block[2] = __86__MAAutoAsset__stageDownloadAllSync_assetsSuccessfullyStaged_error_reportingProgress___block_invoke_2;
  block[3] = &unk_1E6005928;
  uint64_t v18 = a2;
  uint64_t v19 = a3;
  id v14 = v7;
  id v10 = (id)v12;
  long long v15 = v12;
  id v11 = v7;
  dispatch_sync(v8, block);
}

intptr_t __86__MAAutoAsset__stageDownloadAllSync_assetsSuccessfullyStaged_error_reportingProgress___block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    uint64_t v2 = *(void *)(result + 96);
    *(void *)(*(void *)(*(void *)(result + 56) + 8) + 24) = *(void *)(result + 88);
    *(void *)(*(void *)(*(void *)(result + 64) + 8) + 24) = v2;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 72) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 80) + 8) + 24) = 1;
    dispatch_semaphore_t v3 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v3);
  }
  return result;
}

void *__86__MAAutoAsset__stageDownloadAllSync_assetsSuccessfullyStaged_error_reportingProgress___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[4] + 8) + 24))
  {
    intptr_t v1 = result;
    *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 1;
    *(void *)(*(void *)(result[6] + 8) + 24) = 0;
    *(void *)(*(void *)(result[7] + 8) + 24) = 0;
    *(void *)(*(void *)(v1[8] + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(stageDownloadAll)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for stage-download-all to complete"];
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (void)stageCancelOperation:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = [MAAutoAsset alloc];
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
    id v6 = +[MAAutoAsset assetSelectorForAssetTargetOSVersion:0 forTargetBuildVersion:0];
    id v17 = 0;
    id v7 = [(MAAutoAsset *)v4 initForClientName:v5 selectingAsset:v6 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v17];
    uint64_t v8 = v17;

    if (v8)
    {
      long long v9 = +[MAAutoAsset defaultDispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__MAAutoAsset_stageCancelOperation___block_invoke_2;
      block[3] = &unk_1E60042B8;
      id v10 = &v14;
      id v14 = v3;
      id v13 = v8;
      dispatch_async(v9, block);
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __36__MAAutoAsset_stageCancelOperation___block_invoke;
      v15[3] = &unk_1E6005978;
      id v10 = &v16;
      id v16 = v3;
      [v7 _stageCancelOperation:v15];
    }
  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain];
    id v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    uint64_t v8 = [v11 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stageCancelOperation:]();
    }
  }
}

uint64_t __36__MAAutoAsset_stageCancelOperation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __36__MAAutoAsset_stageCancelOperation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_stageCancelOperation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37__MAAutoAsset__stageCancelOperation___block_invoke;
    v8[3] = &unk_1E60054F0;
    v8[4] = self;
    id v9 = v4;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v8];
  }
  else
  {
    id v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _stageCancelOperation:]();
    }
  }
}

void __37__MAAutoAsset__stageCancelOperation___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _failedStageCancelOperation:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) assetSelector];
    id v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = +[MAAutoAsset frameworkInstanceUUID];
    id v14 = [v13 UUIDString];

    [v12 setSafeObject:v11 forKey:@"instance"];
    long long v15 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-STAGE:CANCEL_OPERATION" clientID:v14 version:0 message:v12];
    id v16 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __37__MAAutoAsset__stageCancelOperation___block_invoke_2;
    void v18[3] = &unk_1E6004158;
    id v17 = *(void **)(a1 + 40);
    void v18[4] = *(void *)(a1 + 32);
    id v19 = v17;
    [v16 connectClientSendServerMessage:v15 proxyObject:0 withReply:v18];
  }
}

void __37__MAAutoAsset__stageCancelOperation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      uint64_t v7 = @"failure reported by server";
      uint64_t v8 = 0;
      id v9 = v5;
    }
    else
    {
      uint64_t v7 = @"no response message from server";
      uint64_t v8 = 6104;
      id v9 = 0;
    }
    [v6 _failedStageCancelOperation:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v6 _successStageCancelOperation:*(void *)(a1 + 40)];
  }
}

+ (id)stageCancelOperationSync
{
  uint64_t v2 = [MAAutoAsset alloc];
  id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
  uint64_t v4 = +[MAAutoAsset assetSelectorForAssetTargetOSVersion:0 forTargetBuildVersion:0];
  id v8 = 0;
  id v5 = [(MAAutoAsset *)v2 initForClientName:v3 selectingAsset:v4 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v8];
  id v6 = v8;

  if (!v6)
  {
    id v6 = [v5 _stageCancelOperationSync];
  }

  return v6;
}

- (id)_stageCancelOperationSync
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__5;
  id v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__MAAutoAsset__stageCancelOperationSync__block_invoke;
  v9[3] = &unk_1E60059A0;
  id v11 = v14;
  id v12 = &v18;
  id v13 = v16;
  uint64_t v4 = v3;
  id v10 = v4;
  [(MAAutoAsset *)self _stageCancelOperation:v9];
  if (+[MAAutoAsset waitOnSemaphore:v4 withDaemonTriggeredTimeout:-100])
  {
    id v5 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__MAAutoAsset__stageCancelOperationSync__block_invoke_3;
    block[3] = &unk_1E6004130;
    void block[4] = v16;
    void block[5] = v14;
    block[6] = &v18;
    dispatch_sync(v5, block);
  }
  id v6 = (id)v19[5];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  return v6;
}

void __40__MAAutoAsset__stageCancelOperationSync__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v7 = *(_OWORD *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 48);
  block[2] = __40__MAAutoAsset__stageCancelOperationSync__block_invoke_2;
  block[3] = &unk_1E6005748;
  id v9 = v3;
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_sync(v4, block);
}

intptr_t __40__MAAutoAsset__stageCancelOperationSync__block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __40__MAAutoAsset__stageCancelOperationSync__block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(stageCancelOperation)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for stage-cancel-operation to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (void)stagePurgeAll:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = [MAAutoAsset alloc];
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
    id v6 = +[MAAutoAsset assetSelectorForAssetTargetOSVersion:0 forTargetBuildVersion:0];
    id v17 = 0;
    id v7 = [(MAAutoAsset *)v4 initForClientName:v5 selectingAsset:v6 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v17];
    id v8 = v17;

    if (v8)
    {
      id v9 = +[MAAutoAsset defaultDispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __29__MAAutoAsset_stagePurgeAll___block_invoke_2;
      block[3] = &unk_1E60042B8;
      long long v10 = &v14;
      id v14 = v3;
      id v13 = v8;
      dispatch_async(v9, block);
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __29__MAAutoAsset_stagePurgeAll___block_invoke;
      v15[3] = &unk_1E6005978;
      long long v10 = &v16;
      id v16 = v3;
      [v7 _stagePurgeAll:v15];
    }
  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain];
    long long v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v8 = [v11 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stagePurgeAll:]();
    }
  }
}

uint64_t __29__MAAutoAsset_stagePurgeAll___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __29__MAAutoAsset_stagePurgeAll___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_stagePurgeAll:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __30__MAAutoAsset__stagePurgeAll___block_invoke;
    v8[3] = &unk_1E60054F0;
    v8[4] = self;
    id v9 = v4;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v8];
  }
  else
  {
    id v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _stagePurgeAll:]();
    }
  }
}

void __30__MAAutoAsset__stagePurgeAll___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _failedStagePurgeAll:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) assetSelector];
    long long v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = +[MAAutoAsset frameworkInstanceUUID];
    id v14 = [v13 UUIDString];

    [v12 setSafeObject:v11 forKey:@"instance"];
    char v15 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-STAGE:PURGE_ALL" clientID:v14 version:0 message:v12];
    id v16 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __30__MAAutoAsset__stagePurgeAll___block_invoke_2;
    void v18[3] = &unk_1E6004158;
    id v17 = *(void **)(a1 + 40);
    void v18[4] = *(void *)(a1 + 32);
    id v19 = v17;
    [v16 connectClientSendServerMessage:v15 proxyObject:0 withReply:v18];
  }
}

void __30__MAAutoAsset__stagePurgeAll___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      uint64_t v7 = @"failure reported by server";
      uint64_t v8 = 0;
      id v9 = v5;
    }
    else
    {
      uint64_t v7 = @"no response message from server";
      uint64_t v8 = 6104;
      id v9 = 0;
    }
    [v6 _failedStagePurgeAll:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }
  else
  {
    [v6 _successStagePurgeAll:*(void *)(a1 + 40)];
  }
}

+ (id)stagePurgeAllSync
{
  uint64_t v2 = [MAAutoAsset alloc];
  id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
  uint64_t v4 = +[MAAutoAsset assetSelectorForAssetTargetOSVersion:0 forTargetBuildVersion:0];
  id v8 = 0;
  id v5 = [(MAAutoAsset *)v2 initForClientName:v3 selectingAsset:v4 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v8];
  id v6 = v8;

  if (!v6)
  {
    id v6 = [v5 _stagePurgeAllSync];
  }

  return v6;
}

- (id)_stagePurgeAllSync
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__5;
  id v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__MAAutoAsset__stagePurgeAllSync__block_invoke;
  v9[3] = &unk_1E60059A0;
  id v11 = v14;
  id v12 = &v18;
  id v13 = v16;
  uint64_t v4 = v3;
  id v10 = v4;
  [(MAAutoAsset *)self _stagePurgeAll:v9];
  if (+[MAAutoAsset waitOnSemaphore:v4 withDaemonTriggeredTimeout:-100])
  {
    id v5 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__MAAutoAsset__stagePurgeAllSync__block_invoke_3;
    block[3] = &unk_1E6004130;
    void block[4] = v16;
    void block[5] = v14;
    block[6] = &v18;
    dispatch_sync(v5, block);
  }
  id v6 = (id)v19[5];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  return v6;
}

void __33__MAAutoAsset__stagePurgeAllSync__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v7 = *(_OWORD *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 48);
  block[2] = __33__MAAutoAsset__stagePurgeAllSync__block_invoke_2;
  block[3] = &unk_1E6005748;
  id v9 = v3;
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_sync(v4, block);
}

intptr_t __33__MAAutoAsset__stagePurgeAllSync__block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __33__MAAutoAsset__stagePurgeAllSync__block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(stagePurgeAll)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for stage-purge-all to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (void)stageEraseAll:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = [MAAutoAsset alloc];
    id v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
    id v6 = +[MAAutoAsset assetSelectorForAssetTargetOSVersion:0 forTargetBuildVersion:0];
    id v17 = 0;
    id v7 = [(MAAutoAsset *)v4 initForClientName:v5 selectingAsset:v6 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v17];
    id v8 = v17;

    if (v8)
    {
      id v9 = +[MAAutoAsset defaultDispatchQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __29__MAAutoAsset_stageEraseAll___block_invoke_2;
      block[3] = &unk_1E60042B8;
      long long v10 = &v14;
      id v14 = v3;
      id v13 = v8;
      dispatch_async(v9, block);
    }
    else
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __29__MAAutoAsset_stageEraseAll___block_invoke;
      v15[3] = &unk_1E6005978;
      long long v10 = &v16;
      id v16 = v3;
      [v7 _stageEraseAll:v15];
    }
  }
  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain];
    long long v11 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v8 = [v11 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stageEraseAll:]();
    }
  }
}

uint64_t __29__MAAutoAsset_stageEraseAll___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __29__MAAutoAsset_stageEraseAll___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_stageEraseAll:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __30__MAAutoAsset__stageEraseAll___block_invoke;
    v8[3] = &unk_1E60054F0;
    v8[4] = self;
    id v9 = v4;
    [(MAAutoAsset *)self connectToServerFrameworkCompletion:v8];
  }
  else
  {
    id v6 = [MEMORY[0x1E4FA56C8] sharedLogger];
    id v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _stageEraseAll:]();
    }
  }
}

void __30__MAAutoAsset__stageEraseAll___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 _failedStageEraseAll:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:v4];
  }
  else
  {
    id v5 = [MAAutoAssetInfoInstance alloc];
    id v6 = [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v7 = __maAutoAssetSharedClientProcessName;
    uint64_t v8 = __maAutoAssetSharedClientProcessID;
    id v9 = [*(id *)(a1 + 32) assetSelector];
    long long v10 = +[MAAutoAsset frameworkInstanceUUID];
    id v11 = [(MAAutoAssetInfoInstance *)v5 initForClientName:v6 withProcessName:v7 withProcessID:v8 usingAssetSelector:v9 associatingFrameworkUUID:v10];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v13 = +[MAAutoAsset frameworkInstanceUUID];
    id v14 = [v13 UUIDString];

    [v12 setSafeObject:v11 forKey:@"instance"];
    char v15 = (void *)[objc_alloc(MEMORY[0x1E4FA56B8]) initWithType:1 messageName:@"MA-AUTO-STAGE:ERASE_ALL" clientID:v14 version:0 message:v12];
    id v16 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __30__MAAutoAsset__stageEraseAll___block_invoke_2;
    void v18[3] = &unk_1E6004158;
    id v17 = *(void **)(a1 + 40);
    void v18[4] = *(void *)(a1 + 32);
    id v19 = v17;
    [v16 connectClientSendServerMessage:v15 proxyObject:0 withReply:v18];
  }
}

void __30__MAAutoAsset__stageEraseAll___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  if (!v8 || v5)
  {
    if (v5) {
      [v6 _failedStageEraseAll:0 withResponseError:v5 description:@"failure reported by server" completion:v7];
    }
    else {
      [v6 _failedStagePurgeAll:6104 withResponseError:0 description:@"no response message from server" completion:v7];
    }
  }
  else
  {
    [v6 _successStageEraseAll:*(void *)(a1 + 40)];
  }
}

+ (id)stageEraseAllSync
{
  uint64_t v2 = [MAAutoAsset alloc];
  id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", getprogname());
  uint64_t v4 = +[MAAutoAsset assetSelectorForAssetTargetOSVersion:0 forTargetBuildVersion:0];
  id v8 = 0;
  id v5 = [(MAAutoAsset *)v2 initForClientName:v3 selectingAsset:v4 usingDesiredPolicyCategory:0 completingFromQueue:0 error:&v8];
  id v6 = v8;

  if (!v6)
  {
    id v6 = [v5 _stageEraseAllSync];
  }

  return v6;
}

- (id)_stageEraseAllSync
{
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__5;
  id v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  char v15 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__MAAutoAsset__stageEraseAllSync__block_invoke;
  v9[3] = &unk_1E60059A0;
  id v11 = v14;
  id v12 = &v18;
  id v13 = v16;
  uint64_t v4 = v3;
  long long v10 = v4;
  [(MAAutoAsset *)self _stageEraseAll:v9];
  if (+[MAAutoAsset waitOnSemaphore:v4 withDaemonTriggeredTimeout:-100])
  {
    id v5 = +[MAAutoAsset frameworkDispatchQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__MAAutoAsset__stageEraseAllSync__block_invoke_3;
    block[3] = &unk_1E6004130;
    void block[4] = v16;
    void block[5] = v14;
    block[6] = &v18;
    dispatch_sync(v5, block);
  }
  id v6 = (id)v19[5];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  return v6;
}

void __33__MAAutoAsset__stageEraseAllSync__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MAAutoAsset frameworkDispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v7 = *(_OWORD *)(a1 + 32);
  long long v11 = *(_OWORD *)(a1 + 48);
  block[2] = __33__MAAutoAsset__stageEraseAllSync__block_invoke_2;
  block[3] = &unk_1E6005748;
  id v9 = v3;
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_sync(v4, block);
}

intptr_t __33__MAAutoAsset__stageEraseAllSync__block_invoke_2(intptr_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    intptr_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8) + 40), *(id *)(result + 32));
    *(unsigned char *)(*(void *)(*(void *)(v1 + 64) + 8) + 24) = 1;
    uint64_t v2 = *(NSObject **)(v1 + 40);
    return dispatch_semaphore_signal(v2);
  }
  return result;
}

uint64_t __33__MAAutoAsset__stageEraseAllSync__block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    uint64_t v1 = result;
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(v1 + 48) + 8) + 40) = +[MAAutoAssetError buildError:6105 fromOperation:@"auto(stageEraseAll)" underlyingError:0 withDescription:@"timeout (at framework layer) while waiting for stage-erase-all to complete"];
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

+ (id)assetSelectorForAssetTargetOSVersion:(id)a3 forTargetBuildVersion:(id)a4
{
  id v5 = (__CFString *)a3;
  id v6 = (__CFString *)a4;
  if (v5) {
    long long v7 = v5;
  }
  else {
    long long v7 = @"MAAutoAssetStage-target-os-version-specifier";
  }
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = @"MAAutoAssetControl-target-build-version-version";
  }
  id v9 = [[MAAutoAssetSelector alloc] initForAssetType:@"MAAutoAssetStage-target-all-asset-types" withAssetSpecifier:v7 matchingAssetVersion:v8];

  return v9;
}

+ (void)frameworkInstanceSetLogDomain
{
  if (frameworkInstanceSetLogDomain_frameworkLogDomainOnce_0 != -1) {
    dispatch_once(&frameworkInstanceSetLogDomain_frameworkLogDomainOnce_0, &__block_literal_global_9);
  }
}

void __44__MAAutoAsset_frameworkInstanceSetLogDomain__block_invoke()
{
  id v1 = (id)[[NSString alloc] initWithFormat:@"%@.%s", @"com.apple.MAAutoClient", getprogname()];
  v0 = [MEMORY[0x1E4FA56C0] sharedCore];
  [v0 useDomain:v1];
}

+ (id)defaultDispatchQueue
{
  if (defaultDispatchQueue_defaultQueueOnce_1 != -1) {
    dispatch_once(&defaultDispatchQueue_defaultQueueOnce_1, &__block_literal_global_969_0);
  }
  uint64_t v2 = (void *)defaultDispatchQueue_defaultQueue_1;
  return v2;
}

void __35__MAAutoAsset_defaultDispatchQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.MobileAsset.autoasset.client" UTF8String];
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  uint64_t v2 = (void *)defaultDispatchQueue_defaultQueue_1;
  defaultDispatchQueue_defaultQueue_1 = (uint64_t)v1;
}

+ (id)frameworkDispatchQueue
{
  if (frameworkDispatchQueue_frameworkQueueOnce_0 != -1) {
    dispatch_once(&frameworkDispatchQueue_frameworkQueueOnce_0, &__block_literal_global_971);
  }
  uint64_t v2 = (void *)frameworkDispatchQueue_frameworkQueue_0;
  return v2;
}

void __37__MAAutoAsset_frameworkDispatchQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.MobileAsset.autoasset.framework" UTF8String];
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  uint64_t v2 = (void *)frameworkDispatchQueue_frameworkQueue_0;
  frameworkDispatchQueue_frameworkQueue_0 = (uint64_t)v1;
}

+ (id)frameworkInstanceUUID
{
  if (frameworkInstanceUUID_frameworkUUIDOnce_0 != -1) {
    dispatch_once(&frameworkInstanceUUID_frameworkUUIDOnce_0, &__block_literal_global_973);
  }
  uint64_t v2 = (void *)frameworkInstanceUUID_frameworkUUID_0;
  return v2;
}

uint64_t __36__MAAutoAsset_frameworkInstanceUUID__block_invoke()
{
  frameworkInstanceUUID_frameworkUUID_0 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F29128]);
  return MEMORY[0x1F41817F8]();
}

+ (int64_t)waitOnSemaphore:(id)a3 withDaemonTriggeredTimeout:(int64_t)a4
{
  return dispatch_semaphore_wait((dispatch_semaphore_t)a3, 0xFFFFFFFFFFFFFFFFLL);
}

+ (void)logMAAutoAssetVersion
{
  if (__maAutoAssetLogVersionDispatchOnce != -1) {
    dispatch_once(&__maAutoAssetLogVersionDispatchOnce, &__block_literal_global_976);
  }
}

void __36__MAAutoAsset_logMAAutoAssetVersion__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F0A75970];
  [v0 appendString:@"|TARGET_OS_MAC"];
  [v0 appendString:@"|TARGET_OS_IPHONE"];
  if ([MEMORY[0x1E4FA56C0] stringIsEqual:v0 to:&stru_1F0A75970])
  {
    uint64_t v1 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"(NO_TARGETS_DEFINED)"];

    v0 = (void *)v1;
  }
  else
  {
    [v0 appendString:@"|"];
  }
  uint64_t v2 = [MEMORY[0x1E4FA56C8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543618;
    id v5 = @"2.1.2";
    __int16 v6 = 2114;
    long long v7 = v0;
    _os_log_impl(&dword_1B275B000, v3, OS_LOG_TYPE_DEFAULT, "MA-auto(FRAMEWORK_VERSION:%{public}@) | build environment:%{public}@", (uint8_t *)&v4, 0x16u);
  }
}

- (NSString)autoAssetClientName
{
  return self->_autoAssetClientName;
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (NSString)updateCategoryDesiredByClient
{
  return self->_updateCategoryDesiredByClient;
}

- (MAAutoAssetSelector)contentLockedSelector
{
  return self->_contentLockedSelector;
}

- (void)setContentLockedSelector:(id)a3
{
}

- (NSString)contentLockedReason
{
  return self->_contentLockedReason;
}

- (void)setContentLockedReason:(id)a3
{
}

- (NSURL)localContentURL
{
  return self->_localContentURL;
}

- (void)setLocalContentURL:(id)a3
{
}

- (NSDictionary)assetAttributes
{
  return self->_assetAttributes;
}

- (void)setAssetAttributes:(id)a3
{
}

- (OS_dispatch_queue)completionDispatchQueue
{
  return self->_completionDispatchQueue;
}

- (int)locksOfContent
{
  return self->_locksOfContent;
}

- (void)setLocksOfContent:(int)a3
{
  self->_locksOfContent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_assetAttributes, 0);
  objc_storeStrong((id *)&self->_localContentURL, 0);
  objc_storeStrong((id *)&self->_contentLockedReason, 0);
  objc_storeStrong((id *)&self->_contentLockedSelector, 0);
  objc_storeStrong((id *)&self->_updateCategoryDesiredByClient, 0);
  objc_storeStrong((id *)&self->_assetSelector, 0);
  objc_storeStrong((id *)&self->_autoAssetClientName, 0);
}

- (void)interestInContent:withInterestPolicy:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"interestInContent"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{interestInContent} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)checkForNewer:withUsagePolicy:withTimeout:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"checkForNewer"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{checkForNewer} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)determineIfAvailable:withTimeout:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"determineIfAvailable"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{determineIfAvailable} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)currentStatus:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"currentStatus"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{currentStatus} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"lockContent"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{lockContent} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)mapLockedContent:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"mapLockedContent"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{mapLockedContent} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)continueLockUsage:withUsagePolicy:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"continueLockUsage"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{continueLockUsage} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)endLockUsage:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"endLockUsage"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{endLockUsage} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

void __50__MAAutoAsset_connectToServerFrameworkCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0(&dword_1B275B000, v0, v1, "MA-auto{connectToServerFrameworkCompletion} unable to create shared SUCoreConnectClient for the client process", v2, v3, v4, v5, v6);
}

void __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0(&dword_1B275B000, v0, v1, "MA-auto{_newProxyObjectForLockProgressBlock} | Unable to capture retained strong self reference", v2, v3, v4, v5, v6);
}

void __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0(&dword_1B275B000, v0, v1, "MA-auto{_newProxyObjectForLockProgressBlock} | no progress provided | no progress reported to client at this time", v2, v3, v4, v5, v6);
}

void __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0(&dword_1B275B000, v0, v1, "MA-auto{_newProxyObjectForLockProgressBlock} | no progress provided | unexpected type for statusWithProgress", v2, v3, v4, v5, v6);
}

void __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0(&dword_1B275B000, v0, v1, "MA-auto(staging-client){_newProxyObjectForStageProgressBlock} | Unable to capture retained strong self reference", v2, v3, v4, v5, v6);
}

void __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0(&dword_1B275B000, v0, v1, "MA-auto(staging-client){_newProxyObjectForStageProgressBlock} | no progress provided | no progress reported to staging-client at this time", v2, v3, v4, v5, v6);
}

void __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0(&dword_1B275B000, v0, v1, "MA-auto(staging-client){_newProxyObjectForStageProgressBlock} | no progress provided | unexpected type for statusWithProgress", v2, v3, v4, v5, v6);
}

- (void)_successInterestInContent:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 summary];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v2, v3, "MA-auto{_successInterestInContent} | no client completion block | %{public}@", v4, v5, v6, v7, v8);
}

- (void)_failedInterestInContent:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto{_failedInterestInContent} | no client completion block | %{public}@", v2);
}

void __81__MAAutoAsset__failedInterestInContent_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto{_failedInterestInContent} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successCheckForNewer:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 summary];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v2, v3, "MA-auto{_successCheckForNewer} | no client completion block | %{public}@", v4, v5, v6, v7, v8);
}

- (void)_failedCheckForNewer:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto{_failedCheckForNewer} | no client completion block | %{public}@", v2);
}

void __77__MAAutoAsset__failedCheckForNewer_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 checkedSummary];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto{_failedCheckForNewer} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successDetermineIfAvailable:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 summary];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v2, v3, "MA-auto{_successDetermineIfAvailable} | no client completion block | %{public}@", v4, v5, v6, v7, v8);
}

- (void)_failedDetermineIfAvailable:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto{_failedDetermineIfAvailable} | no client completion block | %{public}@", v2);
}

void __84__MAAutoAsset__failedDetermineIfAvailable_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 checkedSummary];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto{_failedDetermineIfAvailable} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successCurrentStatus:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 summary];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v2, v3, "MA-auto{_successCurrentStatus} | no client completion block | %{public}@", v4, v5, v6, v7, v8);
}

- (void)_failedCurrentStatus:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto{_failedCurrentStatus} | no client completion block | %{public}@", v2);
}

void __77__MAAutoAsset__failedCurrentStatus_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto{_failedCurrentStatus} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

void __96__MAAutoAsset__successLockContent_dueToDesire_sandboxExtension_sandboxExtensionPath_completion___block_invoke_cold_1(id *a1)
{
  uint64_t v1 = [*a1 summary];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v2, v3, "MA-auto{_successLockContent} | no client completion block | %{public}@", v4, v5, v6, v7, v8);
}

- (void)_failedLockContent:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto{_failedLockContent} | no client completion block | %{public}@", v2);
}

void __75__MAAutoAsset__failedLockContent_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto{_failedLockContent} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

void __63__MAAutoAsset__successMapLockedContent_dueToDesire_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) summary];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v2, v3, "MA-auto{_successMapLockedContent} | no client completion block | %{public}@", v4, v5, v6, v7, v8);
}

- (void)_failedMapLockedContent:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto{_failedMapLockedContent} | no client completion block | %{public}@", v2);
}

void __80__MAAutoAsset__failedMapLockedContent_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto{_failedMapLockedContent} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successContinueLockUsage:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 summary];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v2, v3, "MA-auto{_successContinueLockUsage} | no client completion block | %{public}@", v4, v5, v6, v7, v8);
}

- (void)_failedContinueLockUsage:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto{_failedContinueLockUsage} | no client completion block | %{public}@", v2);
}

void __81__MAAutoAsset__failedContinueLockUsage_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto{_failedContinueLockUsage} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

void __47__MAAutoAsset__successEndLockUsage_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 40) summary];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v2, v3, "MA-auto{_successEndLockUsage} | no client completion block | %{public}@", v4, v5, v6, v7, v8);
}

void __47__MAAutoAsset__successEndLockUsage_completion___block_invoke_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 40) summary];
  int v6 = [*a2 locksOfContent];
  int v7 = 138543618;
  uint8_t v8 = v5;
  __int16 v9 = 1024;
  int v10 = v6;
  _os_log_error_impl(&dword_1B275B000, a3, OS_LOG_TYPE_ERROR, "MA-auto{_successEndLockUsage} | %{public}@ | end lock when locksOfContent=%d | cleared locksOfContent", (uint8_t *)&v7, 0x12u);
}

- (void)_failedEndLockUsage:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto{_failedEndLockUsage} | no client completion block | %{public}@", v2);
}

void __76__MAAutoAsset__failedEndLockUsage_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto{_failedEndLockUsage} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

void __38__MAAutoAsset__successCancelActivity___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) assetSelector];
  uint64_t v2 = [v1 summary];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v3, v4, "MA-auto{_successCancelActivity} | no client completion block | %{public}@", v5, v6, v7, v8, v9);
}

- (void)_failedCancelActivity:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto{_failedCancelActivity} | no client completion block | %{public}@", v2);
}

void __78__MAAutoAsset__failedCancelActivity_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto{_failedCancelActivity} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

void __33__MAAutoAsset__successEliminate___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) assetSelector];
  uint64_t v2 = [v1 summary];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v3, v4, "MA-auto{_successEliminate} | no client completion block | %{public}@", v5, v6, v7, v8, v9);
}

- (void)_failedEliminate:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto{_failedEliminate} | no client completion block | %{public}@", v2);
}

void __73__MAAutoAsset__failedEliminate_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto{_failedEliminate} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successStageDetermineGroupsAvailableForUpdate:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 summary];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v2, v3, "MA-auto(staging-client){_successStageDetermineGroupsAvailableForUpdate} | no client completion block | staging:%{public}@", v4, v5, v6, v7, v8);
}

- (void)_failedStageDetermineGroupsAvailableForUpdate:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto(staging-client){_failedStageDetermineGroupsAvailableForUpdate} | no client completion block | %{public}@", v2);
}

void __102__MAAutoAsset__failedStageDetermineGroupsAvailableForUpdate_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto(staging-client){_failedStageDetermineGroupsAvailableForUpdate} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successStageDetermineAllAvailable:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 summary];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v2, v3, "MA-auto(staging-client){_successStageDetermineAllAvailable} | no client completion block | staging:%{public}@", v4, v5, v6, v7, v8);
}

- (void)_failedStageDetermineAllAvailable:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto(staging-client){_failedStageDetermineAllAvailable} | no client completion block | %{public}@", v2);
}

void __90__MAAutoAsset__failedStageDetermineAllAvailable_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto(staging-client){_failedStageDetermineAllAvailable} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successStageDownloadGroups:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 summary];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v2, v3, "MA-auto(staging-client){_successStageDownloadGroups} | no client completion block | staged:%{public}@", v4, v5, v6, v7, v8);
}

- (void)_failedStageDownloadGroups:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto(staging-client){_failedStageDownloadGroups} | no client completion block | %{public}@", v2);
}

void __83__MAAutoAsset__failedStageDownloadGroups_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto(staging-client){_failedStageDownloadGroups} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successStageDownloadAll:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = [a1 summary];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v2, v3, "MA-auto(staging-client){_successStageDownloadAll} | no client completion block | staged:%{public}@", v4, v5, v6, v7, v8);
}

- (void)_failedStageDownloadAll:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto(staging-client){_failedStageDownloadAll} | no client completion block | %{public}@", v2);
}

void __80__MAAutoAsset__failedStageDownloadAll_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto(staging-client){_failedStageDownloadAll} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successStageCancelOperation:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0(&dword_1B275B000, v0, v1, "MA-auto(staging-client){_successStageCancelOperation} | no client completion block", v2, v3, v4, v5, v6);
}

- (void)_failedStageCancelOperation:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto(staging-client){_failedStageCancelOperation} | no client completion block | %{public}@", v2);
}

void __84__MAAutoAsset__failedStageCancelOperation_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto(staging-client){_failedStageCancelOperation} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successStagePurgeAll:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0(&dword_1B275B000, v0, v1, "MA-auto(staging-client){_successStagePurgeAll} | no client completion block", v2, v3, v4, v5, v6);
}

- (void)_failedStagePurgeAll:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto(staging-client){_failedStagePurgeAll} | no client completion block | %{public}@", v2);
}

void __77__MAAutoAsset__failedStagePurgeAll_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto(staging-client){_failedStagePurgeAll} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

- (void)_successStageEraseAll:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_0(&dword_1B275B000, v0, v1, "MA-auto(staging-client){_successStageEraseAll} | no client completion block", v2, v3, v4, v5, v6);
}

- (void)_failedStageEraseAll:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1B275B000, v0, v1, "MA-auto(staging-client){_failedStageEraseEraseAll} | no client completion block | %{public}@", v2);
}

void __77__MAAutoAsset__failedStageEraseAll_withResponseError_description_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_6_0(a1, a2), "checkedSummary");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto(staging-client){_failedStageEraseAll} | %{public}@ | error:%{public}@", v5, v6, v7, v8, v9);
}

+ (void)interestInContent:forAssetSelector:withInterestPolicy:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+interestInContent"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{+interestInContent} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

+ (void)determineIfAvailable:forAssetSelector:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+determineIfAvailable"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{+determineIfAvailable} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

+ (void)endPreviousLocksOfReason:forClientName:forAssetSelector:removingLockCount:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+endPreviousLocksOfReason"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{+endPreviousLocksOfReason} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_endPreviousLocksOfReason:removingLockCount:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"_endPreviousLocksOfReason"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{_endPreviousLocksOfReason} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

+ (void)endAllPreviousLocksOfReason:forClientName:forAssetSelector:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+endAllPreviousLocksOfReason"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{+endAllPreviousLocksOfReason} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_endAllPreviousLocksOfReason:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"_endAllPreviousLocksOfReason"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{_endAllPreviousLocksOfReason} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

+ (void)endAllPreviousLocksOfSelector:forClientName:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+endAllPreviousLocksOfSelector"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{+endAllPreviousLocksOfSelector} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

+ (void)cancelActivityForSelector:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+cancelActivityForSelector"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{+cancelActivityForSelector} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_cancelActivityForSelector:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"_cancelActivityForSelector"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{_cancelActivityForSelector} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

+ (void)eliminateAllForSelector:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+eliminateAllForSelector"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{+eliminateAllForSelector} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_eliminateAllForSelector:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"_eliminateAllForSelector"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{_eliminateAllForSelector} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

+ (void)eliminateAllForAssetType:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+eliminateAllForAssetType"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{+eliminateAllForAssetType} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_eliminateAllForAssetType:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"_eliminateAllForAssetType"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{_eliminateAllForAssetType} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

+ (void)eliminatePromotedNeverLockedForSelector:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+eliminatePromotedNeverLockedForSelector"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{+eliminatePromotedNeverLockedForSelector} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_eliminatePromotedNeverLockedForSelector:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"_eliminatePromotedNeverLockedForSelector"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto{_eliminatePromotedNeverLockedForSelector} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

+ (void)stageDetermineGroupsAvailableForUpdate:completion:.cold.1()
{
  v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+stageDetermineGroupsAvailableForUpdate"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto(staging-client){+stageDetermineGroupsAvailableForUpdate} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

void __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_10(v0, v1), "checkedDescription");
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto(staging-client){stageDetermineGroupsAvailableForUpdate} | MISSING required information | failureReason:%{public}@ | returnedError:%{public}@", v5, v6, v7, v8, 2u);
}

- (void)_stageDetermineGroupsAvailableForUpdate:completion:.cold.1()
{
  uint64_t v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"stageDetermineGroupsAvailableForUpdate"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto(staging-client){stageDetermineGroupsAvailableForUpdate} | no staging-client completion block | %{public}@", v3, v4, v5, v6, v7);
}

+ (void)stageDetermineGroupsAvailableForUpdateSync:totalExpectedBytes:error:.cold.1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_10(v0, v1), "checkedDescription");
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto(staging-client){stageDetermineGroupsAvailableForUpdateSync} | MISSING required information | failureReason:%{public}@ | returnedError:%{public}@", v5, v6, v7, v8, 2u);
}

+ (void)stageDetermineAllAvailableForUpdate:completion:.cold.1()
{
  uint64_t v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+stageDetermineAllAvailableForUpdate"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto(staging-client){+stageDetermineAllAvailableForUpdate} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_stageDetermineAllAvailableForUpdate:completion:.cold.1()
{
  uint64_t v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"stageDetermineAllAvailable"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto(staging-client){stageDetermineAllAvailable} | no staging-client completion block | %{public}@", v3, v4, v5, v6, v7);
}

+ (void)stageDetermineAllAvailable:forTargetBuildVersion:completion:.cold.1()
{
  uint64_t v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+stageDetermineAllAvailable"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto(staging-client){+stageDetermineAllAvailable} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_stageDetermineAllAvailable:forTargetBuildVersion:completion:.cold.1()
{
  uint64_t v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"stageDetermineAllAvailable"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto(staging-client){stageDetermineAllAvailable} | no staging-client completion block | %{public}@", v3, v4, v5, v6, v7);
}

+ (void)stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:.cold.1()
{
  uint64_t v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+stageDownloadGroups"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto(staging-client){+stageDownloadGroups} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

void __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_10(v0, v1), "checkedDescription");
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto(staging-client){stageDownloadGroups} | MISSING required information | failureReason:%{public}@ | returnedError:%{public}@", v5, v6, v7, v8, 2u);
}

- (void)_stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:.cold.1()
{
  uint64_t v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"stageDownloadGroups"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto(staging-client){stageDownloadGroups} | no staging-client completion block | %{public}@", v3, v4, v5, v6, v7);
}

+ (void)stageDownloadGroupsSync:awaitingAllGroups:withStagingTimeout:byGroupAssetsStaged:error:reportingProgress:.cold.1()
{
  OUTLINED_FUNCTION_9();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_10(v0, v1), "checkedDescription");
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3(&dword_1B275B000, v3, v4, "MA-auto(staging-client){stageDownloadGroupsSync} | MISSING required information | failureReason:%{public}@ | returnedError:%{public}@", v5, v6, v7, v8, 2u);
}

+ (void)stageDownloadAll:reportingProgress:completion:.cold.1()
{
  uint64_t v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+stageDownloadAll"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto(staging-client){+stageDownloadAll} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_stageDownloadAll:reportingProgress:completion:.cold.1()
{
  uint64_t v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"stageDownloadAll"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto(staging-client){stageDownloadAll} | no staging-client completion block | %{public}@", v3, v4, v5, v6, v7);
}

+ (void)stageCancelOperation:.cold.1()
{
  uint64_t v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+stageCancelOperation"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto(staging-client){+stageCancelOperation} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_stageCancelOperation:.cold.1()
{
  uint64_t v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"stageCancelOperation"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto(staging-client){stageCancelOperation} | no staging-client completion block | %{public}@", v3, v4, v5, v6, v7);
}

+ (void)stagePurgeAll:.cold.1()
{
  uint64_t v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+stagePurgeAll"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto(staging-client){+stagePurgeAll} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_stagePurgeAll:.cold.1()
{
  uint64_t v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"stagePurgeAll"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto(staging-client){stagePurgeAll} | no staging-client completion block | %{public}@", v3, v4, v5, v6, v7);
}

+ (void)stageEraseAll:.cold.1()
{
  uint64_t v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"+stageEraseAll"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto(staging-client){+stageEraseAll} | no client completion block | %{public}@", v3, v4, v5, v6, v7);
}

- (void)_stageEraseAll:.cold.1()
{
  uint64_t v0 = +[MAAutoAssetError summaryForCode:6102 fromOperation:@"stageEraseAll"];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1B275B000, v1, v2, "MA-auto(staging-client){stageEraseAll} | no staging-client completion block | %{public}@", v3, v4, v5, v6, v7);
}

@end