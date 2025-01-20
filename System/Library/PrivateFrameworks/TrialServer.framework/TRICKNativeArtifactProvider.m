@interface TRICKNativeArtifactProvider
+ (BOOL)isActivityDeferralError:(id)a3;
+ (id)cloudkitIdentifierForContainer:(int)a3;
+ (id)containerForIdentifier:(id)a3 serverContext:(id)a4;
+ (id)fetchRetryDateFromErrorAndOptions:(id)a3 options:(id)a4;
+ (id)mockSQLiteContainerWithIdentifier:(id)a3 serverContext:(id)a4 failureInjectionDelegate:(id)a5;
+ (id)providerForContainer:(int)a3 teamId:(id)a4 bundleId:(id)a5 dateProvider:(id)a6 namespaceDescriptorProvider:(id)a7 serverContext:(id)a8;
+ (id)recordZoneForContainerIdentifier:(id)a3 teamId:(id)a4;
+ (int)containerFromCkContainer:(id)a3;
- (CKContainer)container;
- (CKRecordZoneID)zoneID;
- (NSString)bundleId;
- (NSString)teamId;
- (TRICKNativeArtifactProvider)initWithCloudKitContainer:(id)a3 zoneId:(id)a4 teamId:(id)a5 bundleId:(id)a6 dateProvider:(id)a7 namespaceDescriptorProvider:(id)a8;
- (TRICKQueryLog)queryLog;
- (TRIDateProviding)dateProvider;
- (TRINamespaceDescriptorProviding)namespaceDescriptorProvider;
- (id)configurationFromOptions:(id)a3;
- (id)fetchAssetsWithIndexes:(id)a3 fromTreatmentWithRecordId:(id)a4 options:(id)a5 progress:(id)a6 completion:(id)a7;
- (id)fetchAssetsWithRecordIds:(id)a3 options:(id)a4 perRecordProgress:(id)a5 perRecordCompletionBlockOnSuccess:(id)a6 perRecordCompletionBlockOnError:(id)a7 completion:(id)a8;
- (id)fetchDiffSourceRecordIdsWithTargetAssetIds:(id)a3 isAcceptableSourceAssetId:(id)a4 options:(id)a5 completion:(id)a6;
- (id)fetchDiffsWithRecordIds:(id)a3 options:(id)a4 perRecordProgress:(id)a5 perRecordCompletionBlockOnSuccess:(id)a6 perRecordCompletionBlockOnError:(id)a7 completion:(id)a8;
- (id)fetchRecordIdsForAssetsWithIds:(id)a3 options:(id)a4 completion:(id)a5;
- (id)fetchTreatmentWithId:(id)a3 options:(id)a4 completion:(id)a5;
- (id)queryOperationForRecordType:(id)a3 predicate:(id)a4 desiredKeys:(id)a5 options:(id)a6 recordMatchedBlock:(id)a7 queryCompletionBlock:(id)a8;
- (id)queryOperationForRecordType:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 desiredKeys:(id)a6 options:(id)a7 recordMatchedBlock:(id)a8 queryCompletionBlock:(id)a9;
- (id)queryOperationWithCursor:(id)a3 desiredKeys:(id)a4 options:(id)a5 recordMatchedBlock:(id)a6 queryCompletionBlock:(id)a7;
- (void)_fetchBMLTNotificationsWithCursor:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_fetchExperimentWithExperimentId:(id)a3 deploymentId:(id)a4 options:(id)a5 completion:(id)a6;
- (void)_fetchExperimentsWithCursor:(id)a3 withNamespaceNames:(id)a4 sinceDate:(id)a5 fetchRollbacksOnly:(BOOL)a6 options:(id)a7 resultsHandler:(id)a8;
- (void)_fetchNotificationsWithQueryType:(unint64_t)a3 withCursor:(id)a4 withNamespaceNames:(id)a5 sinceDate:(id)a6 options:(id)a7 resultsHandler:(id)a8;
- (void)_fetchRecordIdsForAssetsWithIds:(id)a3 options:(id)a4 cursor:(id)a5 cancelableOp:(id)a6 resultBuffer:(id)a7 completion:(id)a8;
- (void)_fetchRolloutNotificationWithRolloutId:(id)a3 deploymentId:(id)a4 options:(id)a5 completion:(id)a6;
- (void)_fetchRolloutNotificationsWithCursor:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_fetchRolloutNotificationsWithCursor:(id)a3 options:(id)a4 sinceDate:(id)a5 namespaceNames:(id)a6 resultsHandler:(id)a7;
- (void)fetchBMLTCatalogNotificationWithOptions:(id)a3 completion:(id)a4;
- (void)fetchBMLTNotificationWithDeployment:(id)a3 options:(id)a4 completion:(id)a5;
- (void)fetchBMLTNotificationsWithOptions:(id)a3 completion:(id)a4;
- (void)fetchExperimentNotificationsForLimitedCarryExperimentWithManager:(id)a3 options:(id)a4 rollbacksOnly:(BOOL)a5 completion:(id)a6;
- (void)fetchExperimentNotificationsWithNamespaceNames:(id)a3 rollbacksOnly:(BOOL)a4 lastFetchDateOverride:(id)a5 options:(id)a6 completion:(id)a7;
- (void)fetchExperimentWithExperimentDeployment:(id)a3 options:(id)a4 completion:(id)a5;
- (void)fetchExperimentWithLatestDeploymentForExperimentId:(id)a3 options:(id)a4 completion:(id)a5;
- (void)fetchFactorPackSetWithId:(id)a3 options:(id)a4 completion:(id)a5;
- (void)fetchRolloutNotificationWithDeployment:(id)a3 options:(id)a4 completion:(id)a5;
- (void)fetchRolloutNotificationWithLatestDeploymentForRolloutId:(id)a3 options:(id)a4 completion:(id)a5;
- (void)fetchRolloutNotificationsDateAscendingWithOptions:(id)a3 lastFetchDateOverride:(id)a4 namespaceNames:(id)a5 completion:(id)a6;
- (void)fetchRolloutNotificationsDateDescendingWithOptions:(id)a3 completion:(id)a4;
@end

@implementation TRICKNativeArtifactProvider

+ (BOOL)isActivityDeferralError:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    uint64_t v6 = *MEMORY[0x1E4F19C40];
    if (![v5 isEqualToString:*MEMORY[0x1E4F19C40]])
    {
      BOOL v10 = 0;
LABEL_10:

      goto LABEL_11;
    }
    uint64_t v7 = [v4 code];

    if (v7 == 20)
    {
      v8 = [v4 userInfo];
      v5 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

      v9 = [v5 domain];
      if ([v9 isEqualToString:v6]) {
        BOOL v10 = [v5 code] == 131;
      }
      else {
        BOOL v10 = 0;
      }

      goto LABEL_10;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

+ (id)fetchRetryDateFromErrorAndOptions:(id)a3 options:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = [NSString stringWithUTF8String:"+[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:options:]"];
    [v21 handleFailureInFunction:v22, @"TRICKNativeArtifactProvider.m", 257, @"Invalid parameter not satisfying: %@", @"options" file lineNumber description];

    if (v6) {
      goto LABEL_3;
    }
LABEL_15:
    id v19 = 0;
    goto LABEL_16;
  }
  if (!v6) {
    goto LABEL_15;
  }
LABEL_3:
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__17;
  v29 = __Block_byref_object_dispose__17;
  v8 = [v6 userInfo];
  id v30 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F19C60]];

  v9 = [v6 userInfo];
  uint64_t v10 = *MEMORY[0x1E4F19CD8];
  v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

  if (v11)
  {
    v12 = [v6 userInfo];
    v13 = [v12 objectForKeyedSubscript:v10];

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __73__TRICKNativeArtifactProvider_fetchRetryDateFromErrorAndOptions_options___block_invoke;
    v24[3] = &unk_1E6BBA2F0;
    v24[4] = &v25;
    [v13 enumerateKeysAndObjectsUsingBlock:v24];
  }
  BOOL hasRetryableErrorCode = _hasRetryableErrorCode(v6);
  uint64_t v15 = [v7 discretionaryBehavior];
  v16 = +[TRIFetchRetryUtils fetchRetryDateFromRetryAfterSeconds:isDeferral:isRetryable:isNonDiscretionary:](TRIFetchRetryUtils, "fetchRetryDateFromRetryAfterSeconds:isDeferral:isRetryable:isNonDiscretionary:", v26[5], [a1 isActivityDeferralError:v6], hasRetryableErrorCode, v15 == 0);
  v17 = v16;
  if (v16) {
    char v18 = 1;
  }
  else {
    char v18 = hasRetryableErrorCode;
  }
  if (v18)
  {
    id v19 = v16;
  }
  else
  {
    v20 = TRILogCategory_Server();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v32 = v6;
      _os_log_impl(&dword_1DA291000, v20, OS_LOG_TYPE_DEFAULT, "During download from CK, encountered non-retryable error %{public}@", buf, 0xCu);
    }

    id v19 = 0;
  }

  _Block_object_dispose(&v25, 8);
LABEL_16:

  return v19;
}

uint64_t __73__TRICKNativeArtifactProvider_fetchRetryDateFromErrorAndOptions_options___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = [a3 userInfo];
  id obj = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F19C60]];

  if (obj)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(void *)(v5 + 40))
    {
      if (objc_msgSend(obj, "compare:") != 1) {
        goto LABEL_6;
      }
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    }
    objc_storeStrong((id *)(v5 + 40), obj);
  }
LABEL_6:
  return MEMORY[0x1F41817F8]();
}

- (id)configurationFromOptions:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = [v4 downloadOptions];
  uint64_t v7 = [v6 discretionaryBehavior];
  if (!v7) {
    goto LABEL_9;
  }
  if (v7 == 2)
  {
    v8 = [v6 activity];

    if (v8)
    {
      v9 = [v6 activity];
      [v5 setXPCActivity:v9];

      goto LABEL_10;
    }
    uint64_t v10 = TRILogCategory_Server();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    LOWORD(v22) = 0;
    v11 = "discretionary specified, but xpc activity not present, defaulting to non-discretionary";
    goto LABEL_21;
  }
  uint64_t v10 = TRILogCategory_Server();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v22) = 0;
    v11 = "un-supported download option - defaulting to non-discretionary";
LABEL_21:
    _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v22, 2u);
  }
LABEL_8:

LABEL_9:
  objc_msgSend(v5, "setQualityOfService:", 17, v22);
LABEL_10:
  BOOL v12 = 1;
  [v5 setPreferAnonymousRequests:1];
  [v5 setAllowsCellularAccess:1];
  objc_msgSend(v5, "setAllowsExpensiveNetworkAccess:", objc_msgSend(v6, "allowsExpensiveNetworkAccess"));
  if ([v6 discretionaryBehavior] == 2)
  {
    v13 = [v6 activity];
    BOOL v12 = v13 == 0;
  }
  v14 = [(TRICKNativeArtifactProvider *)self zoneID];

  if (v14 && v12) {
    [v5 setTimeoutIntervalForRequest:300.0];
  }
  uint64_t v15 = [(TRICKNativeArtifactProvider *)self zoneID];

  if (v15)
  {
    v23 = @"X-Trial-ZoneID";
    v16 = [(TRICKNativeArtifactProvider *)self zoneID];
    v17 = [v16 zoneName];
    v24[0] = v17;
    char v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    [v5 setAdditionalRequestHTTPHeaders:v18];
  }
  [v5 setApplicationBundleIdentifierOverrideForContainerAccess:@"com.apple.triald"];
  id v19 = [(TRICKNativeArtifactProvider *)self bundleId];
  [v5 setApplicationBundleIdentifierOverrideForNetworkAttribution:v19];

  v20 = [v4 cacheDeleteAvailableSpaceClass];
  [v5 setCacheDeleteAvailableSpaceClass:v20];

  return v5;
}

- (id)queryOperationForRecordType:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 desiredKeys:(id)a6 options:(id)a7 recordMatchedBlock:(id)a8 queryCompletionBlock:(id)a9
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a7;
  id v17 = a9;
  id v18 = a8;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  uint64_t v22 = [(TRICKNativeArtifactProvider *)self queryLog];
  [v22 logQueryWithRecordType:v21 predicate:v15 sortDescriptors:v20];

  v23 = (void *)[objc_alloc(MEMORY[0x1E4F1A2A0]) initWithRecordType:v21 predicate:v15];
  [v23 setSortDescriptors:v20];

  v24 = (void *)[objc_alloc(MEMORY[0x1E4F1A2B8]) initWithQuery:v23];
  uint64_t v25 = [(TRICKNativeArtifactProvider *)self zoneID];
  [v24 setZoneID:v25];

  [v24 setDesiredKeys:v19];
  [v24 setRecordMatchedBlock:v18];

  [v24 setQueryCompletionBlock:v17];
  [v24 setFetchAllResults:1];
  v26 = [(TRICKNativeArtifactProvider *)self configurationFromOptions:v16];
  [v24 setConfiguration:v26];

  uint64_t v27 = TRILogCategory_Server();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = [(TRICKNativeArtifactProvider *)self zoneID];
    v29 = [v28 zoneName];
    int v33 = 138412546;
    id v34 = v15;
    __int16 v35 = 2114;
    v36 = v29;
    _os_log_impl(&dword_1DA291000, v27, OS_LOG_TYPE_DEFAULT, "created cloudkit query with predicate {%@} zoneID:%{public}@", (uint8_t *)&v33, 0x16u);
  }
  id v30 = [v16 downloadOptions];
  v31 = +[TRICKOperationGroupFactory groupForDownloadOptions:v30];
  [v24 setGroup:v31];

  return v24;
}

- (id)queryOperationForRecordType:(id)a3 predicate:(id)a4 desiredKeys:(id)a5 options:(id)a6 recordMatchedBlock:(id)a7 queryCompletionBlock:(id)a8
{
  return [(TRICKNativeArtifactProvider *)self queryOperationForRecordType:a3 predicate:a4 sortDescriptors:0 desiredKeys:a5 options:a6 recordMatchedBlock:a7 queryCompletionBlock:a8];
}

+ (id)providerForContainer:(int)a3 teamId:(id)a4 bundleId:(id)a5 dateProvider:(id)a6 namespaceDescriptorProvider:(id)a7 serverContext:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = +[TRICKNativeArtifactProvider cloudkitIdentifierForContainer:v12];
  id v19 = +[TRICKNativeArtifactProvider containerForIdentifier:v18 serverContext:v13];

  id v20 = +[TRICKNativeArtifactProvider recordZoneForContainerIdentifier:v18 teamId:v17];
  id v21 = [[TRICKNativeArtifactProvider alloc] initWithCloudKitContainer:v19 zoneId:v20 teamId:v17 bundleId:v16 dateProvider:v15 namespaceDescriptorProvider:v14];

  return v21;
}

- (TRICKNativeArtifactProvider)initWithCloudKitContainer:(id)a3 zoneId:(id)a4 teamId:(id)a5 bundleId:(id)a6 dateProvider:(id)a7 namespaceDescriptorProvider:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v29 = a5;
  id v16 = a6;
  id v17 = a7;
  id obj = a8;
  id v18 = a8;
  id v30 = v14;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"TRICKNativeArtifactProvider.m", 439, @"Invalid parameter not satisfying: %@", @"container" object file lineNumber description];

    if (v15)
    {
LABEL_3:
      if (v16) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"TRICKNativeArtifactProvider.m", 440, @"Invalid parameter not satisfying: %@", @"zoneId" object file lineNumber description];

  if (v16)
  {
LABEL_4:
    if (v17) {
      goto LABEL_5;
    }
LABEL_14:
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"TRICKNativeArtifactProvider.m", 442, @"Invalid parameter not satisfying: %@", @"dateProvider" object file lineNumber description];

    if (v18) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_13:
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"TRICKNativeArtifactProvider.m", 441, @"Invalid parameter not satisfying: %@", @"bundleId" object file lineNumber description];

  if (!v17) {
    goto LABEL_14;
  }
LABEL_5:
  if (v18) {
    goto LABEL_6;
  }
LABEL_15:
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"TRICKNativeArtifactProvider.m", 443, @"Invalid parameter not satisfying: %@", @"namespaceDescriptorProvider" object file lineNumber description];

LABEL_6:
  v32.receiver = self;
  v32.super_class = (Class)TRICKNativeArtifactProvider;
  id v19 = [(TRICKNativeArtifactProvider *)&v32 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_container, a3);
    objc_storeStrong((id *)&v20->_zoneID, a4);
    objc_storeStrong((id *)&v20->_teamId, a5);
    objc_storeStrong((id *)&v20->_bundleId, a6);
    objc_storeStrong((id *)&v20->_dateProvider, a7);
    objc_storeStrong((id *)&v20->_namespaceDescriptorProvider, obj);
    if (qword_1EA8D7FF0 != -1) {
      dispatch_once(&qword_1EA8D7FF0, &__block_literal_global_102);
    }
    objc_storeStrong((id *)&v20->_queryLog, (id)_MergedGlobals_36);
  }

  return v20;
}

void __121__TRICKNativeArtifactProvider_initWithCloudKitContainer_zoneId_teamId_bundleId_dateProvider_namespaceDescriptorProvider___block_invoke()
{
  v0 = (void *)MEMORY[0x1E016E7F0]();
  v1 = [TRICKQueryLog alloc];
  v2 = [MEMORY[0x1E4FB0240] sharedSystemPaths];
  uint64_t v3 = [(TRICKQueryLog *)v1 initWithPaths:v2];
  id v4 = (void *)_MergedGlobals_36;
  _MergedGlobals_36 = v3;
}

- (id)queryOperationWithCursor:(id)a3 desiredKeys:(id)a4 options:(id)a5 recordMatchedBlock:(id)a6 queryCompletionBlock:(id)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = (objc_class *)MEMORY[0x1E4F1A2B8];
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = (void *)[[v13 alloc] initWithCursor:v12];
  [v18 setDesiredKeys:v17];

  [v18 setRecordMatchedBlock:v15];
  [v18 setQueryCompletionBlock:v14];

  [v18 setFetchAllResults:1];
  id v19 = [(TRICKNativeArtifactProvider *)self configurationFromOptions:v16];
  [v18 setConfiguration:v19];

  id v20 = [v16 downloadOptions];

  id v21 = +[TRICKOperationGroupFactory groupForDownloadOptions:v20];
  [v18 setGroup:v21];

  uint64_t v22 = TRILogCategory_Server();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    id v25 = v12;
    _os_log_impl(&dword_1DA291000, v22, OS_LOG_TYPE_DEFAULT, "created cloudkit query with cursor {%@}", (uint8_t *)&v24, 0xCu);
  }

  return v18;
}

+ (id)containerForIdentifier:(id)a3 serverContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4FB0258] sharedInstance];
  int v9 = [v8 isInternalBuild];

  if (!v9)
  {
    uint64_t v13 = 1;
LABEL_13:
    v11 = [MEMORY[0x1E4F19EC8] containerIDForContainerIdentifier:v6 environment:v13];
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F19EC8]) initWithContainerID:v11];
    goto LABEL_14;
  }
  uint64_t v10 = [v7 failureInjectionDelegate];

  if (v10)
  {
    v11 = [v7 failureInjectionDelegate];
    uint64_t v12 = [a1 mockSQLiteContainerWithIdentifier:v6 serverContext:v7 failureInjectionDelegate:v11];
LABEL_14:
    id v16 = (void *)v12;
    goto LABEL_15;
  }
  v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v14 = [v11 valueForKey:*MEMORY[0x1E4FB04D0]];
  if (!v14) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v15 = [v14 unsignedIntegerValue];
  if (v15 == 2)
  {
LABEL_10:
    uint64_t v13 = 2;
LABEL_12:

    goto LABEL_13;
  }
  if (v15 != 5)
  {
    if (v15 == 4) {
      goto LABEL_10;
    }
LABEL_11:
    uint64_t v13 = 1;
    goto LABEL_12;
  }
  id v16 = [a1 mockSQLiteContainerWithIdentifier:v6 serverContext:v7 failureInjectionDelegate:0];

LABEL_15:
  return v16;
}

+ (id)mockSQLiteContainerWithIdentifier:(id)a3 serverContext:(id)a4 failureInjectionDelegate:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  int v9 = [a4 ensureFakeCKDatabase];
  [v9 setDelegate:v7];

  uint64_t v10 = +[TRISQLiteCKDatabase mockContainerWithIdentifier:v8 database:v9];

  return v10;
}

+ (id)recordZoneForContainerIdentifier:(id)a3 teamId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 isEqualToString:*MEMORY[0x1E4FB0288]])
  {
    if (!v8)
    {
      id v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, a1, @"TRICKNativeArtifactProvider.m", 517, @"team id required for container %@", v7 object file lineNumber description];
    }
    id v9 = objc_alloc(MEMORY[0x1E4F1A320]);
    uint64_t v10 = [@"Zone-" stringByAppendingString:v8];
    v11 = (void *)[v9 initWithZoneName:v10 ownerName:*MEMORY[0x1E4F19C08]];
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4FB0290]])
  {
    uint64_t v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v13 = [v12 objectForKey:@"com.apple.triald.testing.ck.zone"];
    id v14 = objc_alloc(MEMORY[0x1E4F1A320]);
    if (v13)
    {
      uint64_t v15 = *MEMORY[0x1E4F19C08];
      id v16 = v13;
    }
    else
    {
      id v16 = (void *)*MEMORY[0x1E4F19D88];
      uint64_t v15 = *MEMORY[0x1E4F19C08];
    }
    v11 = (void *)[v14 initWithZoneName:v16 ownerName:v15];
  }
  else
  {
    id v17 = objc_alloc(MEMORY[0x1E4F1A320]);
    v11 = (void *)[v17 initWithZoneName:*MEMORY[0x1E4F19D88] ownerName:*MEMORY[0x1E4F19C08]];
  }

  return v11;
}

- (void)_fetchExperimentWithExperimentId:(id)a3 deploymentId:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(TRICKNativeArtifactProvider *)self container];
  int v15 = +[TRICKNativeArtifactProvider containerFromCkContainer:v14];

  if (v15)
  {
    int v49 = v15;
    v53 = v12;
    v54 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K == %@", *MEMORY[0x1E4FB03D8], v10];
    uint64_t v16 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithValue:1];
    id v17 = (void *)v16;
    v52 = v13;
    v55 = v11;
    if (v11)
    {
      uint64_t v18 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K == %@", *MEMORY[0x1E4FB03B0], v11];
    }
    else
    {
      uint64_t v18 = v16;
    }
    id v20 = [MEMORY[0x1E4FB0258] sharedInstance];
    uint64_t v21 = [v20 populationType];

    uint64_t v22 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v23 = *MEMORY[0x1E4FB03C0];
    int v24 = [NSNumber numberWithInt:v21];
    v69 = v24;
    id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
    v48 = [v22 triLoggablePredicateWithFormat:@"ANY %K IN %@", v23, v25];

    uint64_t v26 = *MEMORY[0x1E4FB03F0];
    v47 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K != %@", *MEMORY[0x1E4FB03F0], &unk_1F347B7B0];
    v46 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K != %@", v26, &unk_1F347B7C8];
    uint64_t v27 = (void *)MEMORY[0x1E4F28BA0];
    v68[0] = v54;
    v68[1] = v18;
    v51 = (void *)v18;
    v68[2] = v47;
    v68[3] = v46;
    v68[4] = v48;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:5];
    id v29 = [v27 andPredicateWithSubpredicates:v28];

    id v30 = objc_opt_new();
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __96__TRICKNativeArtifactProvider__fetchExperimentWithExperimentId_deploymentId_options_completion___block_invoke;
    v64[3] = &unk_1E6BBA318;
    id v45 = v10;
    id v31 = v10;
    id v65 = v31;
    id v32 = v55;
    id v66 = v32;
    id v33 = v30;
    id v67 = v33;
    id v34 = (void *)MEMORY[0x1E016EA80](v64);
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __96__TRICKNativeArtifactProvider__fetchExperimentWithExperimentId_deploymentId_options_completion___block_invoke_136;
    v56[3] = &unk_1E6BBA368;
    id v35 = v31;
    id v57 = v35;
    id v58 = v32;
    id v36 = v53;
    id v59 = v36;
    id v13 = v52;
    v61 = self;
    id v62 = v52;
    id v60 = v33;
    int v63 = v49;
    id v50 = v33;
    uint64_t v37 = (void *)MEMORY[0x1E016EA80](v56);
    uint64_t v38 = *MEMORY[0x1E4FB0398];
    v39 = +[TRIClientExperimentArtifact allReferencedCKRecordKeys];
    v40 = [(TRICKNativeArtifactProvider *)self queryOperationForRecordType:v38 predicate:v29 desiredKeys:v39 options:v36 recordMatchedBlock:v34 queryCompletionBlock:v37];

    id v41 = v35;
    id v10 = v45;
    v42 = +[TRICKOperationGroupFactory groupForExperimentId:v41];
    [v40 setGroup:v42];

    v43 = [(TRICKNativeArtifactProvider *)self container];
    v44 = [v43 publicCloudDatabase];
    [v44 addOperation:v40];

    id v12 = v53;
    id v11 = v55;
  }
  else
  {
    id v19 = TRILogCategory_Server();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v71 = v10;
      _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "failed to fetch experiment %@ (unknown container)", buf, 0xCu);
    }

    (*((void (**)(id, void, void, void, void))v13 + 2))(v13, 0, 0, 0, 0);
  }
}

void __96__TRICKNativeArtifactProvider__fetchExperimentWithExperimentId_deploymentId_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = [v4 recordID];
      int v9 = 138412802;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "received experiment notification for deployment %@.%@ ckRecordID %@", (uint8_t *)&v9, 0x20u);
    }
    [*(id *)(a1 + 48) addObject:v4];
  }
}

void __96__TRICKNativeArtifactProvider__fetchExperimentWithExperimentId_deploymentId_options_completion___block_invoke_136(uint64_t a1, void *a2, void *a3)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  uint64_t v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v22 = v6;
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "finished fetchExperiment query for deployment %@.%@ error %@", buf, 0x20u);
  }

  if (v6)
  {
    uint64_t v10 = [*(id *)(a1 + 48) downloadOptions];
    __int16 v11 = +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:v6 options:v10];

    (*(void (**)(void, uint64_t, void, void *, uint64_t (*)(uint64_t, uint64_t)))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), 2 * (v11 != 0), 0, v11, v6);
  }
  else
  {
    uint64_t v12 = *(void **)(a1 + 56);
    __int16 v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"deploymentDate" ascending:0];
    v25[0] = v13;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    [v12 sortUsingDescriptors:v14];

    __int16 v11 = [*(id *)(a1 + 56) firstObject];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v22 = __Block_byref_object_copy__17;
    uint64_t v23 = __Block_byref_object_dispose__17;
    id v24 = 0;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 4;
    if (v11)
    {
      uint64_t v15 = [*(id *)(a1 + 64) namespaceDescriptorProvider];
      uint64_t v16 = *(unsigned int *)(a1 + 80);
      id v17 = [*(id *)(a1 + 64) teamId];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __96__TRICKNativeArtifactProvider__fetchExperimentWithExperimentId_deploymentId_options_completion___block_invoke_139;
      v19[3] = &unk_1E6BBA340;
      v19[4] = buf;
      v19[5] = v20;
      uint64_t v18 = +[TRIClientExperimentArtifact artifactFromCKRecordResult:v11 withNamespaceDescriptorProvider:v15 container:v16 teamId:v17 requireDeploymentId:0 completion:v19];
    }
    else
    {
      uint64_t v18 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    _Block_object_dispose(v20, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __96__TRICKNativeArtifactProvider__fetchExperimentWithExperimentId_deploymentId_options_completion___block_invoke_139(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (!a2)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)fetchExperimentWithExperimentDeployment:(id)a3 options:(id)a4 completion:(id)a5
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = v16;
  if (!v16)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"TRICKNativeArtifactProvider.m", 611, @"Invalid parameter not satisfying: %@", @"deployment" object file lineNumber description];

    __int16 v11 = 0;
  }
  if (([v11 hasDeploymentId] & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"TRICKNativeArtifactProvider.m", 612, @"Invalid parameter not satisfying: %@", @"deployment.hasDeploymentId" object file lineNumber description];
  }
  uint64_t v12 = [v16 experimentId];
  __int16 v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v16, "deploymentId"));
  [(TRICKNativeArtifactProvider *)self _fetchExperimentWithExperimentId:v12 deploymentId:v13 options:v9 completion:v10];
}

- (void)fetchExperimentWithLatestDeploymentForExperimentId:(id)a3 options:(id)a4 completion:(id)a5
{
  id v14 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v14;
  id v12 = v10;
  if (!v14)
  {
    __int16 v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRICKNativeArtifactProvider.m", 623, @"Invalid parameter not satisfying: %@", @"experimentId" object file lineNumber description];

    id v11 = 0;
  }
  [(TRICKNativeArtifactProvider *)self _fetchExperimentWithExperimentId:v11 deploymentId:0 options:v9 completion:v12];
}

- (void)_fetchExperimentsWithCursor:(id)a3 withNamespaceNames:(id)a4 sinceDate:(id)a5 fetchRollbacksOnly:(BOOL)a6 options:(id)a7 resultsHandler:(id)a8
{
  BOOL v10 = a6;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = objc_opt_new();
  if (v10)
  {
    [(TRICKNativeArtifactProvider *)self _fetchNotificationsWithQueryType:1 withCursor:0 withNamespaceNames:v13 sinceDate:v14 options:v15 resultsHandler:v16];
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __130__TRICKNativeArtifactProvider__fetchExperimentsWithCursor_withNamespaceNames_sinceDate_fetchRollbacksOnly_options_resultsHandler___block_invoke;
    v18[3] = &unk_1E6BBA3B8;
    id v24 = v16;
    id v19 = v17;
    id v20 = self;
    id v21 = v13;
    id v22 = v14;
    id v23 = v15;
    [(TRICKNativeArtifactProvider *)self _fetchNotificationsWithQueryType:0 withCursor:0 withNamespaceNames:v21 sinceDate:v22 options:v23 resultsHandler:v18];
  }
}

void __130__TRICKNativeArtifactProvider__fetchExperimentsWithCursor_withNamespaceNames_sinceDate_fetchRollbacksOnly_options_resultsHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  switch(a2)
  {
    case 0:
    case 2:
      id v12 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
      goto LABEL_6;
    case 1:
      id v13 = TRILogCategory_Server();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Unexpected code path for fetchExperimentsWithCursor. The operation is not cancellable.", buf, 2u);
      }

      id v12 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
LABEL_6:
      v12();
      break;
    case 3:
      [*(id *)(a1 + 32) addObjectsFromArray:v9];
      break;
    case 4:
      [*(id *)(a1 + 32) addObjectsFromArray:v9];
      id v14 = *(void **)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 56);
      uint64_t v17 = *(void *)(a1 + 64);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __130__TRICKNativeArtifactProvider__fetchExperimentsWithCursor_withNamespaceNames_sinceDate_fetchRollbacksOnly_options_resultsHandler___block_invoke_151;
      v18[3] = &unk_1E6BBA390;
      id v21 = *(id *)(a1 + 72);
      id v19 = v11;
      id v20 = *(id *)(a1 + 32);
      [v14 _fetchNotificationsWithQueryType:1 withCursor:0 withNamespaceNames:v15 sinceDate:v16 options:v17 resultsHandler:v18];

      break;
    default:
      break;
  }
}

void __130__TRICKNativeArtifactProvider__fetchExperimentsWithCursor_withNamespaceNames_sinceDate_fetchRollbacksOnly_options_resultsHandler___block_invoke_151(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  switch(a2)
  {
    case 0:
    case 2:
      id v12 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      goto LABEL_8;
    case 1:
      id v13 = TRILogCategory_Server();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "Unexpected code path for _fetchNotificationsWithQueryType. The operation is not cancellable.", v17, 2u);
      }

      id v12 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      goto LABEL_8;
    case 3:
      [*(id *)(a1 + 40) addObjectsFromArray:v9];
      break;
    case 4:
      [*(id *)(a1 + 40) addObjectsFromArray:v9];
      id v14 = *(void **)(a1 + 40);
      uint64_t v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4FB03A0] ascending:1];
      v18[0] = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      [v14 sortUsingDescriptors:v16];

      id v12 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_8:
      v12();
      break;
    default:
      break;
  }
}

- (void)_fetchNotificationsWithQueryType:(unint64_t)a3 withCursor:(id)a4 withNamespaceNames:(id)a5 sinceDate:(id)a6 options:(id)a7 resultsHandler:(id)a8
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = (id)*MEMORY[0x1E4FB03A0];
  id v20 = objc_opt_new();
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __127__TRICKNativeArtifactProvider__fetchNotificationsWithQueryType_withCursor_withNamespaceNames_sinceDate_options_resultsHandler___block_invoke;
  v74[3] = &unk_1E6BBA3E0;
  id v21 = v20;
  id v75 = v21;
  id v22 = (void *)MEMORY[0x1E016EA80](v74);
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __127__TRICKNativeArtifactProvider__fetchNotificationsWithQueryType_withCursor_withNamespaceNames_sinceDate_options_resultsHandler___block_invoke_153;
  v65[3] = &unk_1E6BBA450;
  id v62 = v21;
  id v66 = v62;
  id v23 = v17;
  id v67 = v23;
  id v24 = v18;
  id v25 = v19;
  id v61 = v24;
  id v72 = v24;
  unint64_t v73 = a3;
  v68 = self;
  id v69 = v19;
  id v26 = v16;
  uint64_t v27 = v14;
  id v28 = v26;
  id v70 = v26;
  id v63 = v15;
  id v71 = v63;
  id v29 = (void *)MEMORY[0x1E016EA80](v65);
  id v30 = +[TRIClientExperimentArtifact allReferencedCKRecordKeys];
  if (v27)
  {
    v64 = v28;
    id v31 = [(TRICKNativeArtifactProvider *)self queryOperationWithCursor:v27 desiredKeys:v30 options:v23 recordMatchedBlock:v22 queryCompletionBlock:v29];
    id v32 = v23;
    goto LABEL_17;
  }
  id v59 = v23;
  id v60 = v22;
  if (v28)
  {
    id v33 = objc_opt_new();
LABEL_6:
    v39 = TRILogCategory_Server();
    v64 = v28;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = formatLoggingDate(v28);
      *(_DWORD *)buf = 138543362;
      v78 = v40;
      _os_log_impl(&dword_1DA291000, v39, OS_LOG_TYPE_DEFAULT, "CKNative checking for new experiments since %{public}@", buf, 0xCu);

      id v28 = v64;
    }

    id v41 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K > %@", v19, v28];
    [v33 addObject:v41];

    goto LABEL_9;
  }
  id v34 = [(TRICKNativeArtifactProvider *)self container];
  uint64_t v35 = +[TRICKNativeArtifactProvider containerFromCkContainer:v34];

  dateProvider = self->_dateProvider;
  uint64_t v37 = [(TRICKNativeArtifactProvider *)self teamId];
  uint64_t v38 = [(TRIDateProviding *)dateProvider lastFetchDateWithType:0 container:v35 teamId:v37];

  id v28 = (id)v38;
  id v33 = objc_opt_new();
  if (v38) {
    goto LABEL_6;
  }
  v64 = 0;
LABEL_9:
  v42 = [MEMORY[0x1E4FB0258] sharedInstance];
  uint64_t v43 = [v42 populationType];

  v44 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v45 = *MEMORY[0x1E4FB03C0];
  v46 = [NSNumber numberWithInt:v43];
  v76 = v46;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v76 count:1];
  v48 = [v44 triLoggablePredicateWithFormat:@"ANY %K IN %@", v45, v47];
  [v33 addObject:v48];

  if (a3)
  {
    int v49 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K == %@", *MEMORY[0x1E4FB03F0], &unk_1F347B7B0];
    [v33 addObject:v49];
    id v22 = v60;
    id v25 = v19;
  }
  else
  {
    int v49 = [v63 allObjects];
    id v22 = v60;
    if ([v49 count])
    {
      id v50 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"ANY %K IN %@", *MEMORY[0x1E4FB0408], v49];
      [v33 addObject:v50];
    }
    v51 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K IN %@", *MEMORY[0x1E4FB03F0], &unk_1F347B300];
    [v33 addObject:v51];

    id v25 = v19;
  }

  v52 = [(TRICKNativeArtifactProvider *)self container];
  v53 = [v52 containerIdentifier];
  char v54 = [v53 isEqualToString:*MEMORY[0x1E4FB0288]];

  if ((v54 & 1) == 0)
  {
    v55 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K IN %@", *MEMORY[0x1E4FB03A8], &unk_1F347B318];
    [v33 addObject:v55];
  }
  v56 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v33];
  id v32 = v59;
  id v31 = [(TRICKNativeArtifactProvider *)self queryOperationForRecordType:*MEMORY[0x1E4FB0398] predicate:v56 desiredKeys:v30 options:v59 recordMatchedBlock:v22 queryCompletionBlock:v29];

  uint64_t v27 = 0;
LABEL_17:
  id v57 = [(TRICKNativeArtifactProvider *)self container];
  id v58 = [v57 publicCloudDatabase];
  [v58 addOperation:v31];
}

void __127__TRICKNativeArtifactProvider__fetchNotificationsWithQueryType_withCursor_withNamespaceNames_sinceDate_options_resultsHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 recordID];
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "received experiment notification for ckRecordID %{public}@", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void __127__TRICKNativeArtifactProvider__fetchNotificationsWithQueryType_withCursor_withNamespaceNames_sinceDate_options_resultsHandler___block_invoke_153(uint64_t a1, void *a2, void *a3)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134218498;
    uint64_t v74 = v8;
    __int16 v75 = 2112;
    id v76 = v5;
    __int16 v77 = 2114;
    id v78 = v6;
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "finished fetchExperiment query with %tu results cursor %@ error %{public}@", buf, 0x20u);
  }

  if (v6)
  {
    uint64_t v9 = [*(id *)(a1 + 40) downloadOptions];
    id v10 = +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:v6 options:v9];

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    goto LABEL_58;
  }
  id v60 = v5;
  id v11 = *(void **)(a1 + 32);
  id v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"deploymentDate" ascending:0];
  id v72 = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
  [v11 sortUsingDescriptors:v13];

  id v14 = TRILogCategory_Server();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v74 = v15;
    _os_log_impl(&dword_1DA291000, v14, OS_LOG_TYPE_DEFAULT, "received %lu experiment records from CloudKit", buf, 0xCu);
  }

  id v16 = [*(id *)(a1 + 48) container];
  uint64_t v17 = +[TRICKNativeArtifactProvider containerFromCkContainer:v16];

  id v63 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  id v61 = objc_opt_new();
  id v62 = objc_opt_new();
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v18 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v68;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v68 != v20) {
          objc_enumerationMutation(obj);
        }
        id v22 = *(void **)(*((void *)&v67 + 1) + 8 * v21);
        id v23 = [*(id *)(a1 + 48) namespaceDescriptorProvider];
        id v24 = [*(id *)(a1 + 48) teamId];
        id v25 = +[TRIClientExperimentArtifact artifactFromCKRecordResult:v22 withNamespaceDescriptorProvider:v23 container:v17 teamId:v24 requireDeploymentId:*(void *)(a1 + 88) == 0 completion:&__block_literal_global_158];

        id v26 = [v22 objectForKeyedSubscript:*(void *)(a1 + 56)];
        uint64_t v27 = v26;
        if (!v26)
        {
          id v30 = TRILogCategory_Server();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            goto LABEL_30;
          }
          id v32 = [v25 experimentId];
          *(_DWORD *)buf = 138412290;
          uint64_t v74 = (uint64_t)v32;
          id v33 = v30;
          id v34 = "received CloudKit record without deployment date for experiment %@";
          uint32_t v35 = 12;
          goto LABEL_25;
        }
        if (*(void *)(a1 + 64) && objc_msgSend(v26, "compare:") == -1)
        {
          id v30 = TRILogCategory_Server();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            goto LABEL_30;
          }
          id v32 = [v25 experimentId];
          uint64_t v37 = *(void **)(a1 + 64);
          *(_DWORD *)buf = 138412802;
          uint64_t v74 = (uint64_t)v32;
          __int16 v75 = 2112;
          id v76 = v27;
          __int16 v77 = 2112;
          id v78 = v37;
          id v33 = v30;
          id v34 = "received CloudKit record with too old deployment date for experiment %@: %@ < %@";
          uint32_t v35 = 32;
LABEL_25:
          _os_log_error_impl(&dword_1DA291000, v33, OS_LOG_TYPE_ERROR, v34, buf, v35);
LABEL_26:

          goto LABEL_30;
        }
        if (!v25
          || ([v25 experimentId],
              id v28 = objc_claimAutoreleasedReturnValue(),
              v28,
              !v28))
        {
          id v30 = TRILogCategory_Server();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            goto LABEL_30;
          }
          id v32 = [v22 recordID];
          id v36 = [v25 experimentId];
          *(_DWORD *)buf = 138412546;
          uint64_t v74 = (uint64_t)v32;
          __int16 v75 = 2112;
          id v76 = v36;
          _os_log_error_impl(&dword_1DA291000, v30, OS_LOG_TYPE_ERROR, "unable to construct artifact from CKRecord %@ for experiment %@", buf, 0x16u);

          goto LABEL_26;
        }
        id v29 = [v25 experimentId];
        id v30 = [v63 objectForKeyedSubscript:v29];

        if ([v25 experimentType] == 5)
        {
          id v31 = v62;
LABEL_29:
          [v31 addObject:v25];
          goto LABEL_30;
        }
        if (*(void *)(a1 + 88) == 1)
        {
          id v31 = v61;
          goto LABEL_29;
        }
        if (!v30)
        {
          uint64_t v38 = [v25 experimentId];
          [v63 setObject:v25 forKeyedSubscript:v38];

          v39 = TRILogCategory_Server();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            v40 = [v25 experimentId];
            *(_DWORD *)buf = 138412290;
            uint64_t v74 = (uint64_t)v40;
            _os_log_debug_impl(&dword_1DA291000, v39, OS_LOG_TYPE_DEBUG, "generated artifact for experiment %@", buf, 0xCu);
          }
          id v30 = 0;
        }
LABEL_30:

        ++v21;
      }
      while (v19 != v21);
      uint64_t v41 = [obj countByEnumeratingWithState:&v67 objects:v71 count:16];
      uint64_t v19 = v41;
    }
    while (v41);
  }

  id v10 = v63;
  v42 = [v63 allValues];
  uint64_t v43 = [v62 allObjects];
  v44 = [v42 arrayByAddingObjectsFromArray:v43];

  uint64_t v45 = [v61 allObjects];
  v46 = [v44 arrayByAddingObjectsFromArray:v45];

  uint64_t v47 = *(void *)(a1 + 80);
  id v5 = v60;
  if (v60) {
    uint64_t v48 = 3;
  }
  else {
    uint64_t v48 = 4;
  }
  int v49 = (void *)[v46 copy];
  (*(void (**)(uint64_t, uint64_t, void *, void, void))(v47 + 16))(v47, v48, v49, 0, 0);

  id v50 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:604800.0];
  v51 = *(void **)(a1 + 32);
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __127__TRICKNativeArtifactProvider__fetchNotificationsWithQueryType_withCursor_withNamespaceNames_sinceDate_options_resultsHandler___block_invoke_160;
  v65[3] = &unk_1E6BBA428;
  void v65[4] = *(void *)(a1 + 56);
  id v52 = v50;
  id v66 = v52;
  uint64_t v53 = [v51 indexOfObjectPassingTest:v65];
  if (v53 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v54 = *(id *)(a1 + 64);
  }
  else
  {
    v55 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v53];
    id v54 = [v55 objectForKeyedSubscript:*(void *)(a1 + 56)];
  }
  if (!*(void *)(a1 + 88))
  {
    if (*(void *)(a1 + 64)) {
      BOOL v56 = objc_msgSend(v54, "compare:") != 1;
    }
    else {
      BOOL v56 = 0;
    }
    BOOL v57 = v17 == 2 && *(void *)(a1 + 72) != 0;
    if (!v54) {
      BOOL v56 = 1;
    }
    if (!v56 && !v57)
    {
      id v58 = [*(id *)(a1 + 48) dateProvider];
      id v59 = [*(id *)(a1 + 48) teamId];
      [v58 setLastFetchDate:v54 type:0 container:v17 teamId:v59];
    }
  }
  if (v60) {
    [*(id *)(a1 + 48) _fetchNotificationsWithQueryType:*(void *)(a1 + 88) withCursor:v60 withNamespaceNames:*(void *)(a1 + 72) sinceDate:v54 options:*(void *)(a1 + 40) resultsHandler:*(void *)(a1 + 80)];
  }

  id v6 = 0;
LABEL_58:
}

BOOL __127__TRICKNativeArtifactProvider__fetchNotificationsWithQueryType_withCursor_withNamespaceNames_sinceDate_options_resultsHandler___block_invoke_160(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v4 = v3;
  if (v3) {
    BOOL v5 = [v3 compare:*(void *)(a1 + 40)] == -1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)fetchExperimentNotificationsForLimitedCarryExperimentWithManager:(id)a3 options:(id)a4 rollbacksOnly:(BOOL)a5 completion:(id)a6
{
  BOOL v58 = a5;
  v91[1] = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  id v51 = a4;
  id v53 = a6;
  uint64_t v8 = TRILogCategory_Server();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "fetching limited carry experiments", buf, 2u);
  }

  uint64_t v9 = [MEMORY[0x1E4FB0258] sharedInstance];
  int v10 = [v9 populationType];

  if (v10 != 3)
  {
    v44 = TRILogCategory_Server();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v44, OS_LOG_TYPE_ERROR, "Unable to fetch limited carry experiments, user must be member of INTERNAL population", buf, 2u);
    }

    id v52 = [NSString stringWithFormat:@"Unable to fetch limited carry experiments, user must be member of INTERNAL population"];
    id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v90 = *MEMORY[0x1E4F28568];
    v91[0] = v52;
    v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:&v90 count:1];
    id v49 = (id)[v45 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v46];

    (*((void (**)(id, void, void, void, id))v53 + 2))(v53, 0, 0, 0, v49);
    goto LABEL_32;
  }
  id v11 = [(TRICKNativeArtifactProvider *)self container];
  int v12 = +[TRICKNativeArtifactProvider containerFromCkContainer:v11];

  id v52 = (id)*MEMORY[0x1E4FB03A0];
  id v13 = objc_opt_new();
  id v14 = objc_opt_new();
  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __129__TRICKNativeArtifactProvider_fetchExperimentNotificationsForLimitedCarryExperimentWithManager_options_rollbacksOnly_completion___block_invoke;
  v86[3] = &unk_1E6BBA3E0;
  id v15 = v14;
  id v87 = v15;
  id v63 = (void *)MEMORY[0x1E016EA80](v86);
  *(void *)buf = 0;
  v83 = buf;
  uint64_t v84 = 0x2020000000;
  uint64_t v85 = 0;
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __129__TRICKNativeArtifactProvider_fetchExperimentNotificationsForLimitedCarryExperimentWithManager_options_rollbacksOnly_completion___block_invoke_181;
  v73[3] = &unk_1E6BBA478;
  id v47 = v15;
  id v74 = v47;
  id v59 = v51;
  id v75 = v59;
  id v16 = v53;
  id v79 = v16;
  int v81 = v12;
  id v76 = self;
  id v77 = v52;
  id v49 = v13;
  id v78 = v49;
  v80 = buf;
  id v62 = (void *)MEMORY[0x1E016EA80](v73);
  uint64_t v48 = [v50 lcExperiments];
  if (![v48 count])
  {
    (*((void (**)(id, uint64_t, void, void, void))v16 + 2))(v16, 4, MEMORY[0x1E4F1CBF0], 0, 0);
    uint64_t v43 = v48;
    goto LABEL_31;
  }
  BOOL v57 = objc_opt_new();
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v17 = v48;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v69 objects:v89 count:16];
  if (!v18) {
    goto LABEL_19;
  }
  uint64_t v61 = *(void *)v70;
  uint64_t v60 = *MEMORY[0x1E4FB03C0];
  uint64_t v56 = *MEMORY[0x1E4FB03D8];
  uint64_t v54 = *MEMORY[0x1E4FB03B0];
  uint64_t v55 = *MEMORY[0x1E4FB03F0];
  do
  {
    uint64_t v19 = 0;
    do
    {
      if (*(void *)v70 != v61) {
        objc_enumerationMutation(v17);
      }
      uint64_t v20 = *(void *)(*((void *)&v69 + 1) + 8 * v19);
      uint64_t v21 = (void *)MEMORY[0x1E016E7F0]();
      id v22 = [v17 objectForKeyedSubscript:v20];
      id v23 = objc_opt_new();
      id v24 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"ANY %K IN %@", v60, &unk_1F347B330, v47];
      [v23 addObject:v24];

      id v25 = [v22 objectForKeyedSubscript:@"ExperimentID"];
      id v26 = [v22 objectForKeyedSubscript:@"DeploymentID"];
      uint64_t v27 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v26, "integerValue"));
      if (v25)
      {
        id v28 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K == %@", v56, v25];
        [v23 addObject:v28];

        if (v58)
        {
          id v29 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K == %@", v55, &unk_1F347B7B0];
          [v23 addObject:v29];
          goto LABEL_15;
        }
        if (v27)
        {
          id v29 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K == %@", v54, v27];
          [v23 addObject:v29];
LABEL_15:
        }
        id v30 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v23];
        [v57 addObject:v30];
      }
      ++v19;
    }
    while (v18 != v19);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v69 objects:v89 count:16];
  }
  while (v18);
LABEL_19:

  uint64_t v31 = [v57 count];
  *((void *)v83 + 3) += v31;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v32 = v57;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v65 objects:v88 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v66;
    uint64_t v35 = *MEMORY[0x1E4FB0398];
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v66 != v34) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v65 + 1) + 8 * v36);
        uint64_t v38 = (void *)MEMORY[0x1E016E7F0]();
        v39 = +[TRIClientExperimentArtifact allReferencedCKRecordKeys];
        v40 = [(TRICKNativeArtifactProvider *)self queryOperationForRecordType:v35 predicate:v37 desiredKeys:v39 options:v59 recordMatchedBlock:v63 queryCompletionBlock:v62];

        uint64_t v41 = [(TRICKNativeArtifactProvider *)self container];
        v42 = [v41 publicCloudDatabase];
        [v42 addOperation:v40];

        ++v36;
      }
      while (v33 != v36);
      uint64_t v33 = [v32 countByEnumeratingWithState:&v65 objects:v88 count:16];
    }
    while (v33);
  }

  uint64_t v43 = v48;
LABEL_31:

  _Block_object_dispose(buf, 8);
LABEL_32:
}

void __129__TRICKNativeArtifactProvider_fetchExperimentNotificationsForLimitedCarryExperimentWithManager_options_rollbacksOnly_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 recordID];
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "received experiment notification for limited carry ckRecordID %{public}@", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void __129__TRICKNativeArtifactProvider_fetchExperimentNotificationsForLimitedCarryExperimentWithManager_options_rollbacksOnly_completion___block_invoke_181(uint64_t a1, void *a2, void *a3)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134218498;
    uint64_t v49 = v8;
    __int16 v50 = 2112;
    id v51 = v5;
    __int16 v52 = 2114;
    id v53 = v6;
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "finished fetchExperiment query with %tu results cursor %@ error %{public}@", buf, 0x20u);
  }

  if (v6)
  {
    uint64_t v9 = [*(id *)(a1 + 40) downloadOptions];
    int v10 = +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:v6 options:v9];

    id v11 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    goto LABEL_5;
  }
  id v39 = v5;
  int v12 = *(void **)(a1 + 32);
  id v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"deploymentDate" ascending:0];
  id v47 = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  [v12 sortUsingDescriptors:v14];

  id v15 = TRILogCategory_Server();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v49 = v16;
    _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "received %lu experiment records from CloudKit", buf, 0xCu);
  }

  v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v17 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v43;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v43 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v42 + 1) + 8 * v20);
        id v22 = (void *)MEMORY[0x1E016E7F0]();
        id v23 = [*(id *)(a1 + 48) namespaceDescriptorProvider];
        uint64_t v24 = *(unsigned int *)(a1 + 88);
        id v25 = [*(id *)(a1 + 48) teamId];
        id v26 = +[TRIClientExperimentArtifact artifactFromCKRecordResult:v21 withNamespaceDescriptorProvider:v23 container:v24 teamId:v25 requireDeploymentId:1 completion:&__block_literal_global_184];

        uint64_t v27 = [v21 objectForKeyedSubscript:*(void *)(a1 + 56)];
        if (!v27)
        {
          id v30 = TRILogCategory_Server();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          uint64_t v33 = [v26 experimentId];
          *(_DWORD *)buf = 138412290;
          uint64_t v49 = (uint64_t)v33;
          _os_log_error_impl(&dword_1DA291000, v30, OS_LOG_TYPE_ERROR, "received CloudKit record without deployment date for experiment %@", buf, 0xCu);
          goto LABEL_26;
        }
        if (!v26
          || ([v26 experimentId],
              id v28 = objc_claimAutoreleasedReturnValue(),
              v28,
              !v28))
        {
          id v30 = TRILogCategory_Server();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          uint64_t v33 = [v21 recordID];
          uint64_t v34 = [v26 experimentId];
          *(_DWORD *)buf = 138412546;
          uint64_t v49 = (uint64_t)v33;
          __int16 v50 = 2112;
          id v51 = v34;
          _os_log_error_impl(&dword_1DA291000, v30, OS_LOG_TYPE_ERROR, "unable to construct artifact from CKRecord %@ for experiment %@", buf, 0x16u);

LABEL_26:
          goto LABEL_23;
        }
        id v29 = [v26 experimentId];
        id v30 = [v40 objectForKeyedSubscript:v29];

        if (!v30)
        {
          uint64_t v31 = [v26 experimentId];
          [v40 setObject:v26 forKeyedSubscript:v31];

          id v32 = TRILogCategory_Server();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v35 = [v26 experimentId];
            *(_DWORD *)buf = 138412290;
            uint64_t v49 = (uint64_t)v35;
            _os_log_debug_impl(&dword_1DA291000, v32, OS_LOG_TYPE_DEBUG, "generated artifact for experiment %@", buf, 0xCu);
          }
          id v30 = 0;
        }
LABEL_23:

        ++v20;
      }
      while (v18 != v20);
      uint64_t v36 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      uint64_t v18 = v36;
    }
    while (v36);
  }

  uint64_t v37 = *(void **)(a1 + 64);
  int v10 = v40;
  uint64_t v38 = [v40 allValues];
  [v37 addObjectsFromArray:v38];

  --*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  id v5 = v39;
  if (v39)
  {
    id v6 = 0;
    goto LABEL_31;
  }
  id v6 = 0;
  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
    goto LABEL_31;
  }
  id v11 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
LABEL_5:
  v11();
LABEL_31:
}

- (void)fetchExperimentNotificationsWithNamespaceNames:(id)a3 rollbacksOnly:(BOOL)a4 lastFetchDateOverride:(id)a5 options:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  id v20 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(TRICKNativeArtifactProvider *)self container];
  uint64_t v16 = +[TRICKNativeArtifactProvider containerFromCkContainer:v15];

  if (v12)
  {
    [(TRICKNativeArtifactProvider *)self _fetchExperimentsWithCursor:0 withNamespaceNames:v20 sinceDate:v12 fetchRollbacksOnly:v10 options:v13 resultsHandler:v14];
  }
  else
  {
    dateProvider = self->_dateProvider;
    uint64_t v18 = [(TRICKNativeArtifactProvider *)self teamId];
    uint64_t v19 = [(TRIDateProviding *)dateProvider lastFetchDateWithType:0 container:v16 teamId:v18];
    [(TRICKNativeArtifactProvider *)self _fetchExperimentsWithCursor:0 withNamespaceNames:v20 sinceDate:v19 fetchRollbacksOnly:v10 options:v13 resultsHandler:v14];
  }
}

+ (id)cloudkitIdentifierForContainer:(int)a3
{
  if (a3 == 2)
  {
    id v6 = (id *)MEMORY[0x1E4FB0288];
LABEL_7:
    id v7 = *v6;
    goto LABEL_9;
  }
  if (a3 == 1)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v4 = [v3 valueForKey:*MEMORY[0x1E4FB04D0]];
    uint64_t v5 = [v4 unsignedIntegerValue];

    id v6 = (id *)MEMORY[0x1E4FB0298];
    if (v5 == 4) {
      id v6 = (id *)MEMORY[0x1E4FB0290];
    }
    goto LABEL_7;
  }
  id v7 = 0;
LABEL_9:
  return v7;
}

+ (int)containerFromCkContainer:(id)a3
{
  id v3 = a3;
  id v4 = [v3 containerIdentifier];
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4FB0298]];

  if (v5)
  {
    int v6 = 1;
  }
  else
  {
    id v7 = [v3 containerIdentifier];
    char v8 = [v7 isEqualToString:*MEMORY[0x1E4FB0288]];

    if (v8)
    {
      int v6 = 2;
    }
    else
    {
      uint64_t v9 = [v3 containerIdentifier];
      int v6 = [v9 isEqualToString:*MEMORY[0x1E4FB0290]];
    }
  }

  return v6;
}

- (id)fetchTreatmentWithId:(id)a3 options:(id)a4 completion:(id)a5
{
  v50[4] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    id v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"TRICKNativeArtifactProvider.m", 1037, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  id v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"TRICKNativeArtifactProvider.m", 1036, @"Invalid parameter not satisfying: %@", @"treatmentId" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  id v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"TRICKNativeArtifactProvider.m", 1038, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_4:
  id v12 = [[TRICancelableCKOperation alloc] initWithOperation:0];
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__17;
  v48[4] = __Block_byref_object_dispose__17;
  id v49 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__17;
  v46[4] = __Block_byref_object_dispose__17;
  id v47 = 0;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = 0;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __71__TRICKNativeArtifactProvider_fetchTreatmentWithId_options_completion___block_invoke;
  v40[3] = &unk_1E6BBA4A0;
  long long v42 = v46;
  id v13 = v9;
  id v41 = v13;
  long long v43 = v48;
  long long v44 = v45;
  id v32 = (void *)MEMORY[0x1E016EA80](v40);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __71__TRICKNativeArtifactProvider_fetchTreatmentWithId_options_completion___block_invoke_202;
  v33[3] = &unk_1E6BBA4C8;
  id v14 = v12;
  uint64_t v34 = v14;
  id v31 = v11;
  id v36 = v31;
  uint64_t v37 = v45;
  id v15 = v10;
  id v35 = v15;
  uint64_t v38 = v48;
  id v39 = v46;
  uint64_t v16 = (void *)MEMORY[0x1E016EA80](v33);
  uint64_t v17 = (void *)MEMORY[0x1E016E7F0]();
  uint64_t v18 = *MEMORY[0x1E4FB04C0];
  uint64_t v19 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K == %@", *MEMORY[0x1E4FB04C0], v13];
  uint64_t v20 = *MEMORY[0x1E4FB04B0];
  v50[0] = v18;
  v50[1] = v20;
  uint64_t v21 = *MEMORY[0x1E4FB04A8];
  v50[2] = *MEMORY[0x1E4FB04B8];
  v50[3] = v21;
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];
  id v23 = [(TRICKNativeArtifactProvider *)self queryOperationForRecordType:*MEMORY[0x1E4FB0490] predicate:v19 desiredKeys:v22 options:v15 recordMatchedBlock:v32 queryCompletionBlock:v16];
  uint64_t v24 = [(TRICKNativeArtifactProvider *)self container];
  id v25 = [v24 publicCloudDatabase];
  [v25 addOperation:v23];

  [(TRICancelableCKOperation *)v14 addOperation:v23];
  id v26 = v14;

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v46, 8);

  _Block_object_dispose(v48, 8);
  return v26;
}

void __71__TRICKNativeArtifactProvider_fetchTreatmentWithId_options_completion___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    if (*(void *)(*(void *)(a1[5] + 8) + 40))
    {
      id v10 = TRILogCategory_Server();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = a1[4];
        id v12 = [*(id *)(*(void *)(a1[6] + 8) + 40) recordName];
        int v19 = 138543618;
        uint64_t v20 = v11;
        __int16 v21 = 2114;
        id v22 = v12;
        _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "Multiple records retrieved for treatmentId: %{public}@. Picking the first one (CKRecordId: %{public}@)", (uint8_t *)&v19, 0x16u);
      }
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4FB0548] treatmentFromCKRecord:v8 treatmentSize:*(void *)(a1[7] + 8) + 24];
      uint64_t v14 = *(void *)(a1[5] + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      if (*(void *)(*(void *)(a1[5] + 8) + 40))
      {
        uint64_t v16 = [v8 recordID];
        uint64_t v17 = *(void *)(a1[6] + 8);
        uint64_t v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = v16;
      }
    }
  }
}

void __71__TRICKNativeArtifactProvider_fetchTreatmentWithId_options_completion___block_invoke_202(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (_isUserCancellation(v7, *(void **)(a1 + 32)))
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (v7)
    {
      char v5 = [*(id *)(a1 + 40) downloadOptions];
      int v6 = +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:v7 options:v5];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_7;
    }
    id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v4();
LABEL_7:
}

- (id)fetchAssetsWithIndexes:(id)a3 fromTreatmentWithRecordId:(id)a4 options:(id)a5 progress:(id)a6 completion:(id)a7
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v40 = id v39 = v17;
    [v40 handleFailureInMethod:a2, self, @"TRICKNativeArtifactProvider.m", 1100, @"Invalid parameter not satisfying: %@", @"assetIndexes" object file lineNumber description];

    id v17 = v39;
    if (v14)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
LABEL_15:
      [MEMORY[0x1E4F28B00] currentHandler];
      v44 = id v43 = v17;
      [v44 handleFailureInMethod:a2, self, @"TRICKNativeArtifactProvider.m", 1102, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];

      id v17 = v43;
      if (v43) {
        goto LABEL_5;
      }
      goto LABEL_16;
    }
  }
  [MEMORY[0x1E4F28B00] currentHandler];
  v42 = id v41 = v17;
  [v42 handleFailureInMethod:a2, self, @"TRICKNativeArtifactProvider.m", 1101, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];

  id v17 = v41;
  if (!v15) {
    goto LABEL_15;
  }
LABEL_4:
  if (v17) {
    goto LABEL_5;
  }
LABEL_16:
  [MEMORY[0x1E4F28B00] currentHandler];
  v46 = id v45 = v17;
  [v46 handleFailureInMethod:a2, self, @"TRICKNativeArtifactProvider.m", 1103, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

  id v17 = v45;
LABEL_5:
  uint64_t v18 = [[TRICancelableCKOperation alloc] initWithOperation:0];
  if ([v13 count])
  {
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __108__TRICKNativeArtifactProvider_fetchAssetsWithIndexes_fromTreatmentWithRecordId_options_progress_completion___block_invoke;
    v59[3] = &unk_1E6BBA4F0;
    id v50 = v16;
    id v60 = v16;
    int v19 = (void *)MEMORY[0x1E016EA80](v59);
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __108__TRICKNativeArtifactProvider_fetchAssetsWithIndexes_fromTreatmentWithRecordId_options_progress_completion___block_invoke_2;
    v53[3] = &unk_1E6BBA518;
    uint64_t v20 = v18;
    uint64_t v54 = v20;
    id v48 = v17;
    id v58 = v17;
    id v51 = v15;
    id v21 = v15;
    id v55 = v21;
    id v52 = v14;
    id v22 = v14;
    id v56 = v22;
    id v49 = v13;
    id v23 = v13;
    id v57 = v23;
    uint64_t v24 = (void *)MEMORY[0x1E016EA80](v53);
    context = (void *)MEMORY[0x1E016E7F0]();
    id v25 = objc_alloc(MEMORY[0x1E4F1A0A8]);
    id v63 = v22;
    id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
    uint64_t v27 = (void *)[v25 initWithRecordIDs:v26];

    [v27 setPerRecordProgressBlock:v19];
    [v27 setFetchRecordsCompletionBlock:v24];
    id v28 = [(TRICKNativeArtifactProvider *)self configurationFromOptions:v21];
    [v27 setConfiguration:v28];

    id v29 = v23;
    id v30 = objc_opt_new();
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __108__TRICKNativeArtifactProvider_fetchAssetsWithIndexes_fromTreatmentWithRecordId_options_progress_completion___block_invoke_2_215;
    v61[3] = &unk_1E6BBA540;
    id v31 = v30;
    id v62 = v31;
    [v29 enumerateRangesUsingBlock:v61];

    id v32 = TRILogCategory_Server();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v65 = v31;
      _os_log_debug_impl(&dword_1DA291000, v32, OS_LOG_TYPE_DEBUG, "desiredKeysForAssetIndexes: %@", buf, 0xCu);
    }

    uint64_t v33 = [v31 arrayByAddingObject:*MEMORY[0x1E4FB04A8]];
    [v27 setDesiredKeys:v33];

    uint64_t v34 = [(TRICKNativeArtifactProvider *)self container];
    id v35 = [v34 publicCloudDatabase];
    [v35 addOperation:v27];

    [(TRICancelableCKOperation *)v20 addOperation:v27];
    id v36 = v20;

    id v15 = v51;
    id v14 = v52;
    id v16 = v50;
    id v17 = v48;
    id v13 = v49;
  }
  else
  {
    (*((void (**)(id, uint64_t, void, void, void))v17 + 2))(v17, 4, MEMORY[0x1E4F1CC08], 0, 0);
    uint64_t v37 = v18;
  }

  return v18;
}

uint64_t __108__TRICKNativeArtifactProvider_fetchAssetsWithIndexes_fromTreatmentWithRecordId_options_progress_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __108__TRICKNativeArtifactProvider_fetchAssetsWithIndexes_fromTreatmentWithRecordId_options_progress_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!_isUserCancellation(v6, *(void **)(a1 + 32)))
  {
    if (v6)
    {
      id v7 = [*(id *)(a1 + 40) downloadOptions];
      id v8 = +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:v6 options:v7];

      id v9 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    else
    {
      id v8 = [v5 objectForKeyedSubscript:*(void *)(a1 + 48)];
      if (v8)
      {
        id v10 = [MEMORY[0x1E4FB0548] assetURLsFromCKRecord:v8 assetIndexes:*(void *)(a1 + 56)];
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

        goto LABEL_8;
      }
      uint64_t v11 = TRILogCategory_Server();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(a1 + 48);
        int v13 = 138412290;
        uint64_t v14 = v12;
        _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "CKFetchRecordsOperation did not return a record with recordId %@.", (uint8_t *)&v13, 0xCu);
      }

      id v9 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    v9();
LABEL_8:

    goto LABEL_9;
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_9:
}

void __108__TRICKNativeArtifactProvider_fetchAssetsWithIndexes_fromTreatmentWithRecordId_options_progress_completion___block_invoke_2_215(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = objc_msgSend(MEMORY[0x1E4F1A2D8], "keyForListField:withIndexRange:", *MEMORY[0x1E4FB04A0], a2, a3);
  [v6 addObject:v7];

  id v8 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F1A2D8], "keyForListField:withIndexRange:", *MEMORY[0x1E4FB0498], a2, a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v8 addObject:v9];
}

- (void)fetchRolloutNotificationsDateAscendingWithOptions:(id)a3 lastFetchDateOverride:(id)a4 namespaceNames:(id)a5 completion:(id)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  int v13 = [(TRICKNativeArtifactProvider *)self container];
  uint64_t v14 = +[TRICKNativeArtifactProvider containerFromCkContainer:v13];

  if (v10)
  {
    [(TRICKNativeArtifactProvider *)self _fetchRolloutNotificationsWithCursor:0 options:v18 sinceDate:v10 namespaceNames:v11 resultsHandler:v12];
  }
  else
  {
    dateProvider = self->_dateProvider;
    id v16 = [(TRICKNativeArtifactProvider *)self teamId];
    id v17 = [(TRIDateProviding *)dateProvider lastFetchDateWithType:1 container:v14 teamId:v16];
    [(TRICKNativeArtifactProvider *)self _fetchRolloutNotificationsWithCursor:0 options:v18 sinceDate:v17 namespaceNames:v11 resultsHandler:v12];
  }
}

- (void)_fetchRolloutNotificationsWithCursor:(id)a3 options:(id)a4 sinceDate:(id)a5 namespaceNames:(id)a6 resultsHandler:(id)a7
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = __Block_byref_object_copy__17;
  v62[4] = __Block_byref_object_dispose__17;
  id v63 = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  v61[3] = 0;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __116__TRICKNativeArtifactProvider__fetchRolloutNotificationsWithCursor_options_sinceDate_namespaceNames_resultsHandler___block_invoke;
  v56[3] = &unk_1E6BBA568;
  void v56[4] = self;
  id v16 = v13;
  id v57 = v16;
  id v59 = v62;
  id v17 = v15;
  id v58 = v17;
  id v60 = v61;
  id v45 = (void *)MEMORY[0x1E016EA80](v56);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __116__TRICKNativeArtifactProvider__fetchRolloutNotificationsWithCursor_options_sinceDate_namespaceNames_resultsHandler___block_invoke_220;
  v48[3] = &unk_1E6BBA590;
  uint64_t v54 = v61;
  id v18 = v12;
  id v49 = v18;
  id v44 = v17;
  id v53 = v44;
  id v50 = self;
  id v19 = v16;
  id v51 = v19;
  id v55 = v62;
  id v20 = v14;
  id v52 = v20;
  id v47 = (void *)MEMORY[0x1E016EA80](v48);
  id v21 = +[TRIClientRolloutArtifact allReferencedCKRecordKeys];
  if (v46)
  {
    id v22 = [(TRICKNativeArtifactProvider *)self queryOperationWithCursor:v46 desiredKeys:v21 options:v18 recordMatchedBlock:v45 queryCompletionBlock:v47];
  }
  else
  {
    if (!v19)
    {
      id v23 = [(TRICKNativeArtifactProvider *)self container];
      uint64_t v24 = +[TRICKNativeArtifactProvider containerFromCkContainer:v23];

      dateProvider = self->_dateProvider;
      id v26 = [(TRICKNativeArtifactProvider *)self teamId];
      id v19 = [(TRIDateProviding *)dateProvider lastFetchDateWithType:1 container:v24 teamId:v26];
    }
    id v43 = objc_opt_new();
    if (v19)
    {
      uint64_t v27 = TRILogCategory_Server();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = formatLoggingDate(v19);
        *(_DWORD *)buf = 138543362;
        long long v67 = v28;
        _os_log_impl(&dword_1DA291000, v27, OS_LOG_TYPE_DEFAULT, "CKNative checking for new rollouts since %{public}@", buf, 0xCu);
      }
      id v29 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K > %@", *MEMORY[0x1E4FB0450], v19];
      [v43 addObject:v29];
    }
    id v30 = [MEMORY[0x1E4FB0258] sharedInstance];
    uint64_t v31 = [v30 populationType];

    id v32 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v33 = [NSNumber numberWithInt:v31];
    id v65 = v33;
    uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
    id v35 = [v32 triLoggablePredicateWithFormat:@"ANY %K IN %@", *MEMORY[0x1E4FB0468], v34];
    [v43 addObject:v35];

    id v36 = [v20 allObjects];
    if ([v20 count])
    {
      uint64_t v37 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"ANY %K IN %@", *MEMORY[0x1E4FB0460], v36];
      [v43 addObject:v37];
    }
    uint64_t v38 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v43];
    id v39 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"modificationDate" ascending:1];
    v64 = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
    id v22 = [(TRICKNativeArtifactProvider *)self queryOperationForRecordType:*MEMORY[0x1E4FB0448] predicate:v38 sortDescriptors:v40 desiredKeys:v21 options:v18 recordMatchedBlock:v45 queryCompletionBlock:v47];
  }
  id v41 = [(TRICKNativeArtifactProvider *)self container];
  long long v42 = [v41 publicCloudDatabase];
  [v42 addOperation:v22];

  _Block_object_dispose(v61, 8);
  _Block_object_dispose(v62, 8);
}

void __116__TRICKNativeArtifactProvider__fetchRolloutNotificationsWithCursor_options_sinceDate_namespaceNames_resultsHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v8 recordID];
      int v31 = 138543362;
      id v32 = v11;
      _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "Received RolloutNotification with CKRecordID %{public}@", (uint8_t *)&v31, 0xCu);
    }
    id v12 = (void *)MEMORY[0x1E016E7F0]();
    id v13 = [*(id *)(a1 + 32) namespaceDescriptorProvider];
    id v14 = +[TRIClientRolloutArtifact artifactFromCKRecord:v8 namespaceDescriptorProvider:v13 error:0];

    if (!v14) {
      goto LABEL_9;
    }
    id v15 = [v14 deploymentDate];
    id v16 = objc_opt_new();
    uint64_t v17 = [v15 compare:v16];

    if (v17 == 1)
    {
      id v18 = TRILogCategory_Server();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v28 = [v14 deployment];
        id v29 = [v28 shortDesc];
        id v30 = [v14 deploymentDate];
        int v31 = 138543618;
        id v32 = v29;
        __int16 v33 = 2112;
        uint64_t v34 = v30;
        _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Received record with future deployment date for rollout %{public}@: %@", (uint8_t *)&v31, 0x16u);
      }
LABEL_8:

LABEL_9:
      goto LABEL_18;
    }
    if (*(void *)(a1 + 40))
    {
      id v19 = [v14 deploymentDate];
      uint64_t v20 = [v19 compare:*(void *)(a1 + 40)];

      if (v20 == -1)
      {
        id v18 = TRILogCategory_Server();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = [v14 deployment];
          id v25 = [v24 shortDesc];
          id v26 = [v14 deploymentDate];
          uint64_t v27 = *(void *)(a1 + 40);
          int v31 = 138543874;
          id v32 = v25;
          __int16 v33 = 2112;
          uint64_t v34 = v26;
          __int16 v35 = 2112;
          uint64_t v36 = v27;
          _os_log_error_impl(&dword_1DA291000, v18, OS_LOG_TYPE_ERROR, "Received CloudKit record with too old deployment date for rollout %{public}@: %@ < %@", (uint8_t *)&v31, 0x20u);
        }
        goto LABEL_8;
      }
    }
    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      id v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:604800.0];
      id v22 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB0450]];
      id v23 = v22;
      if (v22 && [v22 compare:v21] == -1) {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v23);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
LABEL_18:
}

void __116__TRICKNativeArtifactProvider__fetchRolloutNotificationsWithCursor_options_sinceDate_namespaceNames_resultsHandler___block_invoke_220(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    int v18 = 134218498;
    uint64_t v19 = v8;
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Finished fetchRolloutNotifications query with %tu results cursor %@ error %{public}@", (uint8_t *)&v18, 0x20u);
  }

  if (v6)
  {
    id v9 = [*(id *)(a1 + 32) downloadOptions];
    id v10 = +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:v6 options:v9];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v11 = [*(id *)(a1 + 40) container];
    uint64_t v12 = +[TRICKNativeArtifactProvider containerFromCkContainer:v11];

    id v13 = (void *)MEMORY[0x1E016E7F0]();
    if (v5) {
      uint64_t v14 = 3;
    }
    else {
      uint64_t v14 = 4;
    }
    (*(void (**)(void, uint64_t, void, void, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v14, 0, 0, 0);
    if (!*(void *)(a1 + 48) || objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), "compare:") == 1)
    {
      if (*(void *)(a1 + 56))
      {
        id v15 = TRILogCategory_Server();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "Not setting lastFetchDate since we're only fetching a subset of the namespaces.", (uint8_t *)&v18, 2u);
        }
      }
      else
      {
        id v15 = [*(id *)(a1 + 40) dateProvider];
        uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        uint64_t v17 = [*(id *)(a1 + 40) teamId];
        [v15 setLastFetchDate:v16 type:1 container:v12 teamId:v17];
      }
    }
    if (v5) {
      [*(id *)(a1 + 40) _fetchRolloutNotificationsWithCursor:v5 options:*(void *)(a1 + 32) sinceDate:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) namespaceNames:*(void *)(a1 + 56) resultsHandler:*(void *)(a1 + 64)];
    }
  }
}

- (void)fetchRolloutNotificationsDateDescendingWithOptions:(id)a3 completion:(id)a4
{
}

- (void)_fetchRolloutNotificationsWithCursor:(id)a3 options:(id)a4 completion:(id)a5
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v8 = a4;
  id v9 = a5;
  context = (void *)MEMORY[0x1E016E7F0]();
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  char v42 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __87__TRICKNativeArtifactProvider__fetchRolloutNotificationsWithCursor_options_completion___block_invoke;
  v37[3] = &unk_1E6BBA5B8;
  v37[4] = self;
  id v10 = v9;
  id v38 = v10;
  id v39 = v41;
  v40 = v43;
  id v11 = (void *)MEMORY[0x1E016EA80](v37);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __87__TRICKNativeArtifactProvider__fetchRolloutNotificationsWithCursor_options_completion___block_invoke_221;
  v31[3] = &unk_1E6BBA5E0;
  __int16 v35 = v43;
  id v12 = v8;
  id v32 = v12;
  id v13 = v10;
  uint64_t v36 = v41;
  __int16 v33 = self;
  id v34 = v13;
  uint64_t v14 = (void *)MEMORY[0x1E016EA80](v31);
  id v15 = +[TRIClientRolloutArtifact allReferencedCKRecordKeys];
  if (v30)
  {
    uint64_t v16 = [(TRICKNativeArtifactProvider *)self queryOperationWithCursor:v30 desiredKeys:v15 options:v12 recordMatchedBlock:v11 queryCompletionBlock:v14];
  }
  else
  {
    id v28 = objc_opt_new();
    uint64_t v17 = [MEMORY[0x1E4FB0258] sharedInstance];
    uint64_t v18 = [v17 populationType];

    uint64_t v19 = (void *)MEMORY[0x1E4F28F60];
    __int16 v20 = [NSNumber numberWithInt:v18];
    v45[0] = v20;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
    __int16 v22 = [v19 triLoggablePredicateWithFormat:@"ANY %K IN %@", *MEMORY[0x1E4FB0468], v21];
    [v28 addObject:v22];

    id v23 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v28];
    uint64_t v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"deploymentDate" ascending:0];
    id v44 = v24;
    id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
    uint64_t v16 = [(TRICKNativeArtifactProvider *)self queryOperationForRecordType:*MEMORY[0x1E4FB0448] predicate:v23 sortDescriptors:v25 desiredKeys:v15 options:v12 recordMatchedBlock:v11 queryCompletionBlock:v14];
  }
  id v26 = [(TRICKNativeArtifactProvider *)self container];
  uint64_t v27 = [v26 publicCloudDatabase];
  [v27 addOperation:v16];

  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v43, 8);
}

void __87__TRICKNativeArtifactProvider__fetchRolloutNotificationsWithCursor_options_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = TRILogCategory_Server();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v8 recordID];
      int v15 = 138543362;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1DA291000, v10, OS_LOG_TYPE_DEFAULT, "Received RolloutNotification with CKRecordID %{public}@", (uint8_t *)&v15, 0xCu);
    }
    id v12 = (void *)MEMORY[0x1E016E7F0]();
    id v13 = [*(id *)(a1 + 32) namespaceDescriptorProvider];
    uint64_t v14 = +[TRIClientRolloutArtifact artifactFromCKRecord:v8 namespaceDescriptorProvider:v13 error:0];

    if (v14)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

      ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    }
    else
    {
    }
  }
}

void __87__TRICKNativeArtifactProvider__fetchRolloutNotificationsWithCursor_options_completion___block_invoke_221(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    int v13 = 134218498;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Finished fetchRolloutNotifications query with %tu results cursor %@ error %{public}@", (uint8_t *)&v13, 0x20u);
  }

  if (v6)
  {
    id v9 = [*(id *)(a1 + 32) downloadOptions];
    id v10 = +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:v6 options:v9];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E016E7F0]();
    if (v5) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 4;
    }
    (*(void (**)(void, uint64_t, void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v12, 0, 0, 0, 0);
    if (v5 && !*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      [*(id *)(a1 + 40) _fetchRolloutNotificationsWithCursor:v5 options:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
    }
  }
}

- (void)fetchRolloutNotificationWithDeployment:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v14 = [v10 rolloutId];
  id v11 = NSNumber;
  uint64_t v12 = [v10 deploymentId];

  int v13 = [v11 numberWithInt:v12];
  [(TRICKNativeArtifactProvider *)self _fetchRolloutNotificationWithRolloutId:v14 deploymentId:v13 options:v9 completion:v8];
}

- (void)fetchRolloutNotificationWithLatestDeploymentForRolloutId:(id)a3 options:(id)a4 completion:(id)a5
{
}

- (void)_fetchRolloutNotificationWithRolloutId:(id)a3 deploymentId:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v47 = a5;
  id v48 = a6;
  uint64_t v12 = [(TRICKNativeArtifactProvider *)self container];
  LODWORD(a6) = +[TRICKNativeArtifactProvider containerFromCkContainer:v12];

  if (a6)
  {
    id v43 = self;
    uint64_t v13 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K == %@", *MEMORY[0x1E4FB0488], v10];
    if (v11) {
      [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K == %@", *MEMORY[0x1E4FB0458], v11];
    }
    else {
    uint64_t v15 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithValue:1];
    }
    id v16 = [MEMORY[0x1E4FB0258] sharedInstance];
    uint64_t v17 = [v16 populationType];

    id v18 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v19 = *MEMORY[0x1E4FB0468];
    __int16 v20 = [NSNumber numberWithInt:v17];
    id v62 = v20;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
    id v41 = [v18 triLoggablePredicateWithFormat:@"ANY %K IN %@", v19, v21];

    __int16 v22 = (void *)MEMORY[0x1E4F28BA0];
    id v39 = (void *)v13;
    v61[0] = v13;
    v61[1] = v15;
    char v42 = (void *)v15;
    v61[2] = v41;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:3];
    id v46 = [v22 andPredicateWithSubpredicates:v23];

    uint64_t v24 = objc_opt_new();
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __102__TRICKNativeArtifactProvider__fetchRolloutNotificationWithRolloutId_deploymentId_options_completion___block_invoke;
    v56[3] = &unk_1E6BBA318;
    id v25 = v10;
    id v57 = v25;
    id v26 = v11;
    id v58 = v26;
    id v44 = v10;
    id v27 = v24;
    id v59 = v27;
    id v45 = (void *)MEMORY[0x1E016EA80](v56);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __102__TRICKNativeArtifactProvider__fetchRolloutNotificationWithRolloutId_deploymentId_options_completion___block_invoke_222;
    v49[3] = &unk_1E6BBA630;
    id v28 = v25;
    id v50 = v28;
    id v51 = v26;
    id v29 = v47;
    id v52 = v29;
    id v53 = v27;
    uint64_t v54 = v43;
    id v55 = v48;
    id v40 = v27;
    id v30 = (void *)MEMORY[0x1E016EA80](v49);
    uint64_t v31 = *MEMORY[0x1E4FB0448];
    id v32 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"deploymentDate" ascending:0];
    id v60 = v32;
    __int16 v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
    id v34 = +[TRIClientRolloutArtifact allReferencedCKRecordKeys];
    __int16 v35 = [(TRICKNativeArtifactProvider *)v43 queryOperationForRecordType:v31 predicate:v46 sortDescriptors:v33 desiredKeys:v34 options:v29 recordMatchedBlock:v45 queryCompletionBlock:v30];

    uint64_t v36 = +[TRICKOperationGroupFactory groupForRolloutId:v28];
    [v35 setGroup:v36];

    uint64_t v37 = [(TRICKNativeArtifactProvider *)v43 container];
    id v38 = [v37 publicCloudDatabase];
    [v38 addOperation:v35];

    id v10 = v44;
  }
  else
  {
    id v14 = TRILogCategory_Server();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v64 = v10;
      __int16 v65 = 2112;
      id v66 = v11;
      _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "failed to fetch rollout %{public}@.%@ (unknown container)", buf, 0x16u);
    }

    (*((void (**)(id, void, void, void, void))v48 + 2))(v48, 0, 0, 0, 0);
  }
}

void __102__TRICKNativeArtifactProvider__fetchRolloutNotificationWithRolloutId_deploymentId_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = [v4 recordID];
      int v9 = 138543874;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Received rollout notification for deployment %{public}@.%@ ckRecordID %@", (uint8_t *)&v9, 0x20u);
    }
    [*(id *)(a1 + 48) addObject:v4];
  }
}

void __102__TRICKNativeArtifactProvider__fetchRolloutNotificationWithRolloutId_deploymentId_options_completion___block_invoke_222(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TRILogCategory_Server();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v6;
    __int16 v22 = 2112;
    uint64_t v23 = v7;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Finished fetchRolloutNotification query for deployment %{public}@.%@ error %@", buf, 0x20u);
  }

  if (v4)
  {
    id v8 = [*(id *)(a1 + 48) downloadOptions];
    int v9 = +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:v4 options:v8];

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    int v9 = [*(id *)(a1 + 56) firstObject];
    id v17 = 0;
    if (v9)
    {
      uint64_t v10 = +[TRIClientRolloutArtifact artifactFromCKRecord:v9 namespaceDescriptorProvider:*(void *)(*(void *)(a1 + 64) + 40) error:&v17];
      id v11 = v17;
    }
    else
    {
      uint64_t v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v21 = v13;
        _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "Unable to find rollout ID %{public}@. Please verify rollout id is valid.", buf, 0xCu);
      }

      id v14 = [NSString stringWithFormat:@"Unable to find rollout"];
      id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v18 = *MEMORY[0x1E4F28568];
      uint64_t v19 = v14;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v11 = (id)[v15 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v16];
      id v17 = v11;

      uint64_t v10 = 0;
    }
    (*(void (**)(void, uint64_t, void *, void, id))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), 4 * (v11 == 0), v10, 0, v11);
  }
}

- (void)fetchFactorPackSetWithId:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = objc_opt_new();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __75__TRICKNativeArtifactProvider_fetchFactorPackSetWithId_options_completion___block_invoke;
  v33[3] = &unk_1E6BBA3E0;
  id v13 = v12;
  id v34 = v13;
  id v14 = (void *)MEMORY[0x1E016EA80](v33);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __75__TRICKNativeArtifactProvider_fetchFactorPackSetWithId_options_completion___block_invoke_226;
  v25[3] = &unk_1E6BBA608;
  id v15 = v9;
  id v26 = v15;
  id v16 = v13;
  id v27 = v16;
  id v17 = v10;
  id v28 = v17;
  id v18 = v11;
  uint64_t v31 = v35;
  SEL v32 = a2;
  id v29 = self;
  id v30 = v18;
  uint64_t v19 = (void *)MEMORY[0x1E016EA80](v25);
  __int16 v20 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K == %@", *MEMORY[0x1E4FB0438], v15];
  uint64_t v21 = +[TRIFactorPackSet allReferencedCKRecordKeys];
  __int16 v22 = [(TRICKNativeArtifactProvider *)self queryOperationForRecordType:*MEMORY[0x1E4FB0420] predicate:v20 desiredKeys:v21 options:v17 recordMatchedBlock:v14 queryCompletionBlock:v19];

  uint64_t v23 = [(TRICKNativeArtifactProvider *)self container];
  __int16 v24 = [v23 publicCloudDatabase];
  [v24 addOperation:v22];

  _Block_object_dispose(v35, 8);
}

void __75__TRICKNativeArtifactProvider_fetchFactorPackSetWithId_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v4 recordID];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Received FactorPackSet with CKRecordID %{public}@", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void __75__TRICKNativeArtifactProvider_fetchFactorPackSetWithId_options_completion___block_invoke_226(uint64_t a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 138544130;
    uint64_t v35 = v8;
    __int16 v36 = 2048;
    uint64_t v37 = v9;
    __int16 v38 = 2112;
    id v39 = v5;
    __int16 v40 = 2114;
    id v41 = v6;
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Finished fetchFactorPackSetId %{public}@ with %tu results cursor %@ error %{public}@", buf, 0x2Au);
  }

  if (v6)
  {
    id v10 = [*(id *)(a1 + 48) downloadOptions];
    id v11 = +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:v6 options:v10];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v12 = *(void **)(a1 + 40);
  id v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"modificationDate" ascending:1];
  __int16 v33 = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  [v12 sortUsingDescriptors:v14];

  if ([*(id *)(a1 + 40) count])
  {
    if ((unint64_t)[*(id *)(a1 + 40) count] >= 2)
    {
      id v15 = TRILogCategory_Server();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v35 = v25;
        _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Unexpectedly matched multiple records with FactorPackSetId %{public}@ (selecting most recent).", buf, 0xCu);
      }
    }
    id v11 = [*(id *)(a1 + 40) lastObject];
    if (!v11)
    {
      id v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 56), @"TRICKNativeArtifactProvider.m", 1512, @"Invalid parameter not satisfying: %@", @"mostRecentlyModifiedRecord" object file lineNumber description];
    }
    id v16 = +[TRIFactorPackSet artifactFromCKRecord:v11];
    id v17 = [v11 values];
    if (!v17)
    {
      id v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 56), @"TRICKNativeArtifactProvider.m", 1516, @"Expression was unexpectedly nil/false: %@", @"mostRecentlyModifiedRecord.values" object file lineNumber description];
    }
    id v18 = [v17 triArrayValueForField:*MEMORY[0x1E4FB0430] isNestedValue:0];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += [*(id *)(*((void *)&v28 + 1) + 8 * i) length];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v20);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

    goto LABEL_22;
  }
  uint64_t v23 = TRILogCategory_Server();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    uint64_t v24 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v35 = v24;
    _os_log_error_impl(&dword_1DA291000, v23, OS_LOG_TYPE_ERROR, "No records found matching FactorPackSetId %{public}@.", buf, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_23:
}

- (id)fetchRecordIdsForAssetsWithIds:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v11 = a5;
  uint64_t v12 = objc_msgSend([v10 alloc], "initWithCapacity:", objc_msgSend(v8, "count"));
  id v13 = [[TRICancelableCKOperation alloc] initWithOperation:0];
  if ([v8 count]) {
    [(TRICKNativeArtifactProvider *)self _fetchRecordIdsForAssetsWithIds:v8 options:v9 cursor:0 cancelableOp:v13 resultBuffer:v12 completion:v11];
  }
  else {
    (*((void (**)(id, uint64_t, void *, void, void))v11 + 2))(v11, 4, v12, 0, 0);
  }

  return v13;
}

- (void)_fetchRecordIdsForAssetsWithIds:(id)a3 options:(id)a4 cursor:(id)a5 cancelableOp:(id)a6 resultBuffer:(id)a7 completion:(id)a8
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __115__TRICKNativeArtifactProvider__fetchRecordIdsForAssetsWithIds_options_cursor_cancelableOp_resultBuffer_completion___block_invoke;
  v48[3] = &unk_1E6BBA3E0;
  id v20 = v18;
  id v49 = v20;
  uint64_t v39 = MEMORY[0x1E016EA80](v48);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __115__TRICKNativeArtifactProvider__fetchRecordIdsForAssetsWithIds_options_cursor_cancelableOp_resultBuffer_completion___block_invoke_237;
  void v41[3] = &unk_1E6BBA630;
  id v21 = v20;
  id v42 = v21;
  id v40 = v17;
  id v43 = v40;
  id v38 = v19;
  id v47 = v38;
  id v22 = v15;
  id v44 = v22;
  id v45 = self;
  id v23 = v14;
  id v46 = v23;
  uint64_t v24 = (void *)MEMORY[0x1E016EA80](v41);
  uint64_t v25 = *MEMORY[0x1E4FB02F8];
  v51[0] = *MEMORY[0x1E4FB02F8];
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
  id v27 = v16;
  uint64_t v37 = v23;
  if (v16)
  {
    id v28 = v16;
    long long v29 = (void *)v39;
    long long v30 = [(TRICKNativeArtifactProvider *)self queryOperationWithCursor:v28 desiredKeys:v26 options:v22 recordMatchedBlock:v39 queryCompletionBlock:v24];
    uint64_t v50 = v25;
    long long v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
    [v30 setDesiredKeys:v31];

    [v40 addOperation:v30];
    SEL v32 = [(TRICKNativeArtifactProvider *)self container];
    __int16 v33 = [v32 publicCloudDatabase];
    [v33 addOperation:v30];
  }
  else
  {
    id v34 = [v23 allObjects];
    long long v30 = [v34 sortedArrayUsingSelector:sel_compare_];

    SEL v32 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K IN %@", v25, v30];
    __int16 v33 = [(TRICKNativeArtifactProvider *)self queryOperationForRecordType:*MEMORY[0x1E4FB02B0] predicate:v32 desiredKeys:v26 options:v22 recordMatchedBlock:v39 queryCompletionBlock:v24];
    [v40 addOperation:v33];
    uint64_t v35 = [(TRICKNativeArtifactProvider *)self container];
    __int16 v36 = [v35 publicCloudDatabase];
    [v36 addOperation:v33];

    long long v29 = (void *)v39;
  }
}

void __115__TRICKNativeArtifactProvider__fetchRecordIdsForAssetsWithIds_options_cursor_cancelableOp_resultBuffer_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 recordID];
      int v11 = 138543362;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Received partial Asset record with CKRecordID %{public}@", (uint8_t *)&v11, 0xCu);
    }
    int v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB02F8]];
    if (v7)
    {
      id v8 = TRIValidateAssetId();
      if (v8)
      {
        id v9 = [v4 recordID];
        [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v8];
      }
    }
    else
    {
      id v8 = TRILogCategory_Server();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v10 = [v4 recordID];
        int v11 = 138543362;
        uint64_t v12 = v10;
        _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "No assetId found in CKRecord %{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
}

void __115__TRICKNativeArtifactProvider__fetchRecordIdsForAssetsWithIds_options_cursor_cancelableOp_resultBuffer_completion___block_invoke_237(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = v8;
    __int16 v29 = 2112;
    uint64_t v30 = (uint64_t)v5;
    __int16 v31 = 2114;
    id v32 = v6;
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Finished Asset record fetch with %tu results cursor %@ error %{public}@", buf, 0x20u);
  }

  if (_isUserCancellation(v6, *(void **)(a1 + 40)))
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
LABEL_5:
    v9();
    goto LABEL_25;
  }
  if (v6)
  {
    id v10 = [*(id *)(a1 + 48) downloadOptions];
    int v11 = +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:v6 options:v10];

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    goto LABEL_25;
  }
  if (v5)
  {
    [*(id *)(a1 + 56) _fetchRecordIdsForAssetsWithIds:*(void *)(a1 + 64) options:*(void *)(a1 + 48) cursor:v5 cancelableOp:*(void *)(a1 + 40) resultBuffer:*(void *)(a1 + 32) completion:*(void *)(a1 + 72)];
    goto LABEL_25;
  }
  uint64_t v12 = [*(id *)(a1 + 32) count];
  if (v12 == [*(id *)(a1 + 64) count])
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    goto LABEL_5;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = *(id *)(a1 + 64);
  id v14 = (id)[v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v18 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v17, (void)v22);

        if (!v18)
        {
          id v14 = v17;
          goto LABEL_22;
        }
      }
      id v14 = (id)[v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_22:

  id v19 = TRILogCategory_Server();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = [*(id *)(a1 + 64) count];
    uint64_t v21 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134218498;
    uint64_t v28 = v20;
    __int16 v29 = 2048;
    uint64_t v30 = v21;
    __int16 v31 = 2114;
    id v32 = v14;
    _os_log_error_impl(&dword_1DA291000, v19, OS_LOG_TYPE_ERROR, "Unable to find Asset record in CloudKit for all requested assetIds (requested: %tu, found: %tu). Example missing assetId: %{public}@", buf, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_25:
}

- (id)fetchAssetsWithRecordIds:(id)a3 options:(id)a4 perRecordProgress:(id)a5 perRecordCompletionBlockOnSuccess:(id)a6 perRecordCompletionBlockOnError:(id)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = [[TRICancelableCKOperation alloc] initWithOperation:0];
  if ([v13 count])
  {
    uint64_t v65 = 0;
    id v66 = &v65;
    uint64_t v67 = 0x3032000000;
    uint64_t v68 = __Block_byref_object_copy__240;
    long long v69 = __Block_byref_object_dispose__241;
    id v70 = 0;
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke;
    v62[3] = &unk_1E6BBA658;
    id v40 = v17;
    id v63 = v17;
    id v41 = v16;
    id v64 = v16;
    uint64_t v20 = (void *)MEMORY[0x1E016EA80](v62);
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x3032000000;
    v60[3] = __Block_byref_object_copy__17;
    v60[4] = __Block_byref_object_dispose__17;
    id v61 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v13, "count"));
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_243;
    v54[3] = &unk_1E6BBA6D0;
    id v58 = &v65;
    id v57 = v18;
    id v38 = v19;
    uint64_t v21 = v19;
    id v55 = v21;
    id v39 = v14;
    id v22 = v14;
    id v56 = v22;
    id v59 = v60;
    long long v23 = (void *)MEMORY[0x1E016EA80](v54);
    long long v24 = (void *)MEMORY[0x1E016E7F0]();
    long long v25 = [TRIPeekEnumerator alloc];
    id v26 = [v13 keyEnumerator];
    id v27 = [(TRIPeekEnumerator *)v25 initWithEnumerator:v26];

    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_2_249;
    v44[3] = &unk_1E6BBA6F8;
    uint64_t v28 = v27;
    SEL v53 = a2;
    id v45 = v28;
    id v46 = self;
    id v47 = v13;
    id v48 = v22;
    id v50 = v15;
    id v29 = v20;
    id v51 = v29;
    id v30 = v23;
    id v52 = v30;
    __int16 v31 = v21;
    id v49 = v31;
    uint64_t v32 = MEMORY[0x1E016EA80](v44);
    uint64_t v33 = (void *)v66[5];
    v66[5] = v32;

    if ((*(unsigned __int8 (**)(void))(v66[5] + 16))())
    {
      uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:a2 object:self file:@"TRICKNativeArtifactProvider.m" lineNumber:1775 description:@"initial asset batch was unexpectedly empty"];
    }
    id v34 = v49;
    uint64_t v35 = v31;

    _Block_object_dispose(v60, 8);
    _Block_object_dispose(&v65, 8);

    id v14 = v39;
    id v17 = v40;
    id v16 = v41;
    id v19 = v38;
  }
  else
  {
    (*((void (**)(id, uint64_t, void, void, void))v18 + 2))(v18, 4, MEMORY[0x1E4F1CC08], 0, 0);
  }

  return v19;
}

void __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = TRILogCategory_Server();
  int v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543618;
      id v16 = v8;
      __int16 v17 = 2114;
      id v18 = v9;
      _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Error receiving Asset record with CKRecord %{public}@: %{public}@", (uint8_t *)&v15, 0x16u);
    }

    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(uint64_t, id, id, id))(v12 + 16))(v12, v7, v8, v9);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB02F8]];
      int v15 = 138543618;
      id v16 = v8;
      __int16 v17 = 2114;
      id v18 = v13;
      _os_log_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEFAULT, "Received Asset record with CKRecordID %{public}@, assetId %{public}@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 40);
    if (v14) {
      (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v7, v8);
    }
  }
}

void __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_243(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_2;
  v19[3] = &unk_1E6BBA680;
  long long v16 = *(_OWORD *)(a1 + 48);
  id v7 = (id)v16;
  long long v20 = v16;
  id v8 = (void (**)(void, void, void, void, void))MEMORY[0x1E016EA80](v19);
  if (_isUserCancellation(v6, *(void **)(a1 + 32)))
  {
    ((void (**)(void, uint64_t, void, void, id))v8)[2](v8, 1, 0, 0, v6);
  }
  else
  {
    if (!v6)
    {
      if (v5)
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_245;
        v17[3] = &unk_1E6BBA6A8;
        v17[4] = *(void *)(a1 + 64);
        [v5 enumerateKeysAndObjectsUsingBlock:v17];
        if ((*(unsigned __int8 (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) + 16))() != 1) {
          goto LABEL_12;
        }
        uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        uint64_t v12 = v8[2];
        id v13 = v8;
        uint64_t v14 = 4;
      }
      else
      {
        int v15 = TRILogCategory_Server();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Unexpected nil recordsByRecordId for fetchAssetsWithRecordIds", buf, 2u);
        }

        uint64_t v12 = v8[2];
        id v13 = v8;
        uint64_t v14 = 0;
        uint64_t v11 = 0;
      }
      v12(v13, v14, v11, 0, 0);
      goto LABEL_12;
    }
    id v9 = [*(id *)(a1 + 40) downloadOptions];
    id v10 = +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:v6 options:v9];

    ((void (**)(void, uint64_t, void, void *, id))v8)[2](v8, 2 * (v10 != 0), 0, v10, v6);
  }
LABEL_12:
}

void __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_245(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v11 = 0;
  id v6 = +[TRISignedAssetURL assetURLFromCKRecord:a3 assetId:&v11];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 url];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v8 forKeyedSubscript:v11];
  }
  else
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;

    *a4 = 1;
  }
}

uint64_t __159__TRICKNativeArtifactProvider_fetchAssetsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_2_249(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E016E7F0]();
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:100];
  id v4 = TRILogCategory_Server();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA291000, v4, OS_LOG_TYPE_DEFAULT, "Creating new batch of assets for next query.", buf, 2u);
  }

  id v5 = 0;
  unint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = [*(id *)(a1 + 32) nextObject];
    if (!v7) {
      break;
    }
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:v7];
    if (!v9)
    {
      uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:*(void *)(a1 + 96), *(void *)(a1 + 40), @"TRICKNativeArtifactProvider.m", 1747, @"Expression was unexpectedly nil/false: %@", @"recordIdsForAssetIds[assetId]" object file lineNumber description];
    }
    v6 += [v9 downloadSize];
    id v10 = [v9 recordId];
    [v3 addObject:v10];

    uint64_t v11 = [*(id *)(a1 + 32) peekNextObject];

    if ((unint64_t)[v3 count] <= 0x63 && v11)
    {
      id v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:v11];
      if (!v12)
      {
        int v15 = [MEMORY[0x1E4F28B00] currentHandler];
        [v15 handleFailureInMethod:*(void *)(a1 + 96), *(void *)(a1 + 40), @"TRICKNativeArtifactProvider.m", 1755, @"Expression was unexpectedly nil/false: %@", @"recordIdsForAssetIds[peek]" object file lineNumber description];
      }
      unint64_t v13 = [v12 downloadSize] + v6;

      id v5 = (void *)v11;
      if (v13 < 0x5F5E101) {
        continue;
      }
    }
    long long v16 = TRILogCategory_Server();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v3 count];
      *(_DWORD *)buf = 134218240;
      uint64_t v26 = v17;
      __int16 v27 = 2048;
      double v28 = (double)v6 / 1000000.0;
      _os_log_impl(&dword_1DA291000, v16, OS_LOG_TYPE_DEFAULT, "Asset batch: %tu assets of cumulative size %.2f MB", buf, 0x16u);
    }

    id v18 = (void *)[objc_alloc(MEMORY[0x1E4F1A0A8]) initWithRecordIDs:v3];
    uint64_t v19 = +[TRISignedAssetURL allReferencedCKRecordKeys];
    [v18 setDesiredKeys:v19];

    long long v20 = [*(id *)(a1 + 40) configurationFromOptions:*(void *)(a1 + 56)];
    [v18 setConfiguration:v20];

    [v18 setPerRecordProgressBlock:*(void *)(a1 + 72)];
    [v18 setPerRecordCompletionBlock:*(void *)(a1 + 80)];
    [v18 setFetchRecordsCompletionBlock:*(void *)(a1 + 88)];
    uint64_t v21 = [*(id *)(a1 + 40) container];
    id v22 = [v21 publicCloudDatabase];
    [v22 addOperation:v18];

    [*(id *)(a1 + 64) addOperation:v18];
    uint64_t v23 = 0;
    id v5 = (void *)v11;
    goto LABEL_15;
  }
  if ([v3 count])
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:*(void *)(a1 + 96) object:*(void *)(a1 + 40) file:@"TRICKNativeArtifactProvider.m" lineNumber:1743 description:@"terminating with nonempty batch which will not be processed"];
    uint64_t v23 = 1;
LABEL_15:

    goto LABEL_18;
  }
  uint64_t v23 = 1;
LABEL_18:

  return v23;
}

- (id)fetchDiffSourceRecordIdsWithTargetAssetIds:(id)a3 isAcceptableSourceAssetId:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v44 = a4;
  id v43 = a5;
  id v10 = a6;
  id v45 = [[TRICancelableCKOperation alloc] initWithOperation:0];
  __int16 v36 = v9;
  if ([v9 count])
  {
    uint64_t v35 = v10;
    uint64_t v11 = objc_opt_new();
    uint64_t v12 = objc_opt_new();
    unint64_t v13 = (void *)v11[1];
    v11[1] = v12;

    id v42 = (void *)[objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v11];
    group = dispatch_group_create();
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = v9;
    uint64_t v46 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
    if (v46)
    {
      uint64_t v41 = *(void *)v65;
      uint64_t v39 = *MEMORY[0x1E4FB02E0];
      uint64_t v40 = *MEMORY[0x1E4FB02D8];
      uint64_t v14 = *MEMORY[0x1E4FB02D0];
      uint64_t v38 = *MEMORY[0x1E4FB02B8];
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v65 != v41) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v64 + 1) + 8 * i);
          uint64_t v17 = (void *)MEMORY[0x1E016E7F0]();
          dispatch_group_enter(group);
          v62[0] = 0;
          v62[1] = v62;
          v62[2] = 0x3032000000;
          v62[3] = __Block_byref_object_copy__17;
          void v62[4] = __Block_byref_object_dispose__17;
          id v63 = 0;
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __119__TRICKNativeArtifactProvider_fetchDiffSourceRecordIdsWithTargetAssetIds_isAcceptableSourceAssetId_options_completion___block_invoke;
          v59[3] = &unk_1E6BBA830;
          id v61 = v62;
          id v18 = v44;
          void v59[4] = v16;
          id v60 = v18;
          uint64_t v19 = (void *)MEMORY[0x1E016EA80](v59);
          v53[0] = MEMORY[0x1E4F143A8];
          v53[1] = 3221225472;
          v53[2] = __119__TRICKNativeArtifactProvider_fetchDiffSourceRecordIdsWithTargetAssetIds_isAcceptableSourceAssetId_options_completion___block_invoke_265;
          v53[3] = &unk_1E6BBA748;
          id v54 = v42;
          id v20 = v43;
          id v55 = v20;
          uint64_t v56 = v16;
          id v58 = v62;
          id v57 = group;
          uint64_t v21 = (void *)MEMORY[0x1E016EA80](v53);
          id v22 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K == %@", v40, v16];
          v69[0] = v39;
          v69[1] = v14;
          uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
          long long v24 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v14 ascending:1];
          uint64_t v68 = v24;
          long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
          uint64_t v26 = [(TRICKNativeArtifactProvider *)self queryOperationForRecordType:v38 predicate:v22 sortDescriptors:v25 desiredKeys:v23 options:v20 recordMatchedBlock:v19 queryCompletionBlock:v21];

          __int16 v27 = [(TRICKNativeArtifactProvider *)self container];
          double v28 = [v27 publicCloudDatabase];
          [v28 addOperation:v26];

          [(TRICancelableCKOperation *)v45 addOperation:v26];
          _Block_object_dispose(v62, 8);
        }
        uint64_t v46 = [obj countByEnumeratingWithState:&v64 objects:v70 count:16];
      }
      while (v46);
    }

    uint64_t v29 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __119__TRICKNativeArtifactProvider_fetchDiffSourceRecordIdsWithTargetAssetIds_isAcceptableSourceAssetId_options_completion___block_invoke_267;
    block[3] = &unk_1E6BBA770;
    id v50 = v42;
    id v30 = v45;
    id v51 = v30;
    id v52 = v35;
    id v31 = v42;
    dispatch_group_notify(group, v29, block);

    uint64_t v32 = v52;
    uint64_t v33 = v30;

    id v10 = v35;
  }
  else
  {
    (*((void (**)(id, uint64_t, void, void, void))v10 + 2))(v10, 4, MEMORY[0x1E4F1CC08], 0, 0);
  }

  return v45;
}

void __119__TRICKNativeArtifactProvider_fetchDiffSourceRecordIdsWithTargetAssetIds_isAcceptableSourceAssetId_options_completion___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8 && !*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id v10 = *MEMORY[0x1E4FB02E0];
    uint64_t v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB02E0]];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v12 = *MEMORY[0x1E4FB02D0];
      unint64_t v13 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB02D0]];
      if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v14 = TRIValidateAssetId();
        if (v14 && (*(unsigned int (**)(void))(a1[5] + 16))())
        {
          int v15 = TRILogCategory_Server();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = (void *)a1[4];
            int v24 = 138543618;
            long long v25 = v16;
            __int16 v26 = 2114;
            __int16 v27 = v14;
            _os_log_impl(&dword_1DA291000, v15, OS_LOG_TYPE_DEFAULT, "Asset %{public}@ can be constructed by patching asset %{public}@, which is already on disk.", (uint8_t *)&v24, 0x16u);
          }

          uint64_t v17 = [TRISizedCKRecordID alloc];
          id v18 = [v8 recordID];
          uint64_t v19 = [(TRISizedCKRecordID *)v17 initWithRecordId:v18 downloadSize:[v13 unsignedLongLongValue]];
          uint64_t v20 = *(void *)(a1[6] + 8);
          uint64_t v21 = *(void **)(v20 + 40);
          *(void *)(v20 + 40) = v19;
        }
      }
      else
      {
        uint64_t v14 = TRILogCategory_Server();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = [v8 recordID];
          int v24 = 138412546;
          long long v25 = v23;
          __int16 v26 = 2112;
          __int16 v27 = v12;
          _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "CKRecord %@ is missing key %@.", (uint8_t *)&v24, 0x16u);
        }
      }
    }
    else
    {
      unint64_t v13 = TRILogCategory_Server();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v22 = [v8 recordID];
        int v24 = 138412546;
        long long v25 = v22;
        __int16 v26 = 2112;
        __int16 v27 = v10;
        _os_log_error_impl(&dword_1DA291000, v13, OS_LOG_TYPE_ERROR, "CKRecord %@ is missing key %@.", (uint8_t *)&v24, 0x16u);
      }
    }
  }
}

void __119__TRICKNativeArtifactProvider_fetchDiffSourceRecordIdsWithTargetAssetIds_isAcceptableSourceAssetId_options_completion___block_invoke_265(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __119__TRICKNativeArtifactProvider_fetchDiffSourceRecordIdsWithTargetAssetIds_isAcceptableSourceAssetId_options_completion___block_invoke_2;
  v9[3] = &unk_1E6BBA720;
  id v10 = v4;
  id v5 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  id v11 = v6;
  uint64_t v12 = v7;
  uint64_t v13 = *(void *)(a1 + 64);
  id v8 = v4;
  [v5 runWithLockAcquired:v9];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __119__TRICKNativeArtifactProvider_fetchDiffSourceRecordIdsWithTargetAssetIds_isAcceptableSourceAssetId_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) downloadOptions];
    uint64_t v7 = +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:v5 options:v6];

    id v8 = (void *)*((void *)v4 + 1);
    *((void *)v4 + 1) = 0;

    id v9 = TRILogCategory_Server();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138543618;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      uint64_t v16 = v12;
      _os_log_error_impl(&dword_1DA291000, v9, OS_LOG_TYPE_ERROR, "Failed to fetch diff source for asset ID %{public}@: %{public}@", (uint8_t *)&v13, 0x16u);
    }

    if (!v7 || !*((void *)v4 + 3))
    {
      objc_storeStrong((id *)v4 + 2, v7);
      objc_storeStrong((id *)v4 + 3, *(id *)(a1 + 32));
    }
  }
  else if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v10 = (void *)v3[1];
    if (v10) {
      objc_msgSend(v10, "setObject:forKeyedSubscript:");
    }
  }
}

void __119__TRICKNativeArtifactProvider_fetchDiffSourceRecordIdsWithTargetAssetIds_isAcceptableSourceAssetId_options_completion___block_invoke_267(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) unsafeGuardedData];
  if (_isUserCancellation(*((void **)v3 + 3), *(void **)(a1 + 40)))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else if (*((void *)v3 + 2))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else if (*((void *)v3 + 3) || !*((void *)v3 + 1))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v2();
}

- (id)fetchDiffsWithRecordIds:(id)a3 options:(id)a4 perRecordProgress:(id)a5 perRecordCompletionBlockOnSuccess:(id)a6 perRecordCompletionBlockOnError:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v43 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = [[TRICancelableCKOperation alloc] initWithOperation:0];
  if ([v14 count])
  {
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __158__TRICKNativeArtifactProvider_fetchDiffsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke;
    v49[3] = &unk_1E6BBA658;
    id v50 = v17;
    id v51 = v16;
    uint64_t v20 = MEMORY[0x1E016EA80](v49);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __158__TRICKNativeArtifactProvider_fetchDiffsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_268;
    v44[3] = &unk_1E6BBA7C0;
    uint64_t v21 = v19;
    id v45 = v21;
    id v48 = v18;
    id v22 = v43;
    id v46 = v22;
    id v41 = v16;
    id v23 = v14;
    id v47 = v23;
    id v40 = v18;
    uint64_t v37 = (void *)MEMORY[0x1E016EA80](v44);
    context = (void *)MEMORY[0x1E016E7F0]();
    [v23 allValues];
    id v42 = v14;
    long long v25 = v24 = v15;
    __int16 v26 = objc_msgSend(v25, "_pas_mappedArrayWithTransform:", &__block_literal_global_274);

    __int16 v27 = (void *)[objc_alloc(MEMORY[0x1E4F1A0A8]) initWithRecordIDs:v26];
    +[TRIAssetDiffArtifact allReferencedCKRecordKeys];
    uint64_t v29 = v28 = v17;
    [v27 setDesiredKeys:v29];

    id v30 = [(TRICKNativeArtifactProvider *)self configurationFromOptions:v22];
    [v27 setConfiguration:v30];

    [v27 setPerRecordProgressBlock:v24];
    uint64_t v39 = v19;
    id v31 = (void *)v20;
    [v27 setPerRecordCompletionBlock:v20];
    [v27 setFetchRecordsCompletionBlock:v37];
    uint64_t v32 = [(TRICKNativeArtifactProvider *)self container];
    uint64_t v33 = [v32 publicCloudDatabase];
    [v33 addOperation:v27];

    id v17 = v28;
    [(TRICancelableCKOperation *)v21 addOperation:v27];
    id v34 = v21;

    id v15 = v24;
    id v14 = v42;

    id v16 = v41;

    id v18 = v40;
    uint64_t v19 = v39;
  }
  else
  {
    (*((void (**)(id, uint64_t, void, void, void))v18 + 2))(v18, 4, MEMORY[0x1E4F1CC08], 0, 0);
    uint64_t v35 = v19;
  }

  return v19;
}

void __158__TRICKNativeArtifactProvider_fetchDiffsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = TRILogCategory_Server();
  uint64_t v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138543618;
      id v16 = v8;
      __int16 v17 = 2114;
      id v18 = v9;
      _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Error receiving diffable asset record with CKRecord %{public}@: %{public}@", (uint8_t *)&v15, 0x16u);
    }

    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(uint64_t, id, id, id))(v12 + 16))(v12, v7, v8, v9);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB02F8]];
      int v15 = 138543618;
      id v16 = v8;
      __int16 v17 = 2114;
      id v18 = v13;
      _os_log_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEFAULT, "Received diffable asset record with CKRecordID %{public}@, assetId %{public}@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v14 = *(void *)(a1 + 40);
    if (v14) {
      (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v7, v8);
    }
  }
}

void __158__TRICKNativeArtifactProvider_fetchDiffsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_268(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (_isUserCancellation(v6, *(void **)(a1 + 32)))
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else if (v6)
  {
    id v7 = [*(id *)(a1 + 40) downloadOptions];
    id v8 = +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:v6 options:v7];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__17;
    __int16 v17 = __Block_byref_object_dispose__17;
    id v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    id v9 = *(void **)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __158__TRICKNativeArtifactProvider_fetchDiffsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_2;
    v10[3] = &unk_1E6BBA798;
    id v11 = v5;
    uint64_t v12 = &v13;
    [v9 enumerateKeysAndObjectsUsingBlock:v10];
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), 4, v14[5], 0);

    _Block_object_dispose(&v13, 8);
  }
}

void __158__TRICKNativeArtifactProvider_fetchDiffsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = *(void **)(a1 + 32);
  id v10 = [v8 recordId];
  id v11 = [v9 objectForKeyedSubscript:v10];

  if (v11)
  {
    uint64_t v12 = +[TRIAssetDiffArtifact artifactFromCKRecord:v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    if (v12)
    {
      [v14 setObject:v12 forKeyedSubscript:v7];
    }
    else
    {
      *(void *)(v13 + 40) = 0;

      *a4 = 1;
    }
  }
  else
  {
    uint64_t v15 = TRILogCategory_Server();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v18 = [v8 recordId];
      int v19 = 138412546;
      uint64_t v20 = v18;
      __int16 v21 = 2114;
      id v22 = v7;
      _os_log_error_impl(&dword_1DA291000, v15, OS_LOG_TYPE_ERROR, "Failed to fetch CKRecordID %@ for asset diff with target assetId %{public}@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    __int16 v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;

    *a4 = 1;
  }
}

uint64_t __158__TRICKNativeArtifactProvider_fetchDiffsWithRecordIds_options_perRecordProgress_perRecordCompletionBlockOnSuccess_perRecordCompletionBlockOnError_completion___block_invoke_271(uint64_t a1, void *a2)
{
  return [a2 recordId];
}

- (void)fetchBMLTCatalogNotificationWithOptions:(id)a3 completion:(id)a4
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TRICKNativeArtifactProvider *)self container];
  int v9 = +[TRICKNativeArtifactProvider containerFromCkContainer:v8];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4FB0258] sharedInstance];
    uint64_t v11 = [v10 populationType];

    uint64_t v12 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v13 = *MEMORY[0x1E4FB0328];
    uint64_t v14 = [NSNumber numberWithInt:v11];
    id v34 = [v12 triLoggablePredicateWithFormat:@"%K == %@", v13, v14];

    uint64_t v33 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K == %@", *MEMORY[0x1E4FB0380], &unk_1F347B7E0];
    uint64_t v15 = (void *)MEMORY[0x1E4F28BA0];
    v42[0] = v34;
    v42[1] = v33;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    __int16 v17 = [v15 andPredicateWithSubpredicates:v16];

    id v18 = objc_opt_new();
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __82__TRICKNativeArtifactProvider_fetchBMLTCatalogNotificationWithOptions_completion___block_invoke;
    v39[3] = &unk_1E6BBA3E0;
    id v19 = v18;
    id v40 = v19;
    uint64_t v20 = (void *)MEMORY[0x1E016EA80](v39);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __82__TRICKNativeArtifactProvider_fetchBMLTCatalogNotificationWithOptions_completion___block_invoke_275;
    v35[3] = &unk_1E6BBA808;
    id v21 = v6;
    id v36 = v21;
    id v37 = v19;
    id v38 = v7;
    id v22 = v19;
    id v23 = v6;
    id v24 = (void *)MEMORY[0x1E016EA80](v35);
    uint64_t v25 = *MEMORY[0x1E4FB0310];
    __int16 v26 = +[TRIClientBMLTCatalogArtifact allReferencedCKRecordKeys];
    __int16 v27 = [(TRICKNativeArtifactProvider *)self queryOperationForRecordType:v25 predicate:v17 sortDescriptors:0 desiredKeys:v26 options:v21 recordMatchedBlock:v20 queryCompletionBlock:v24];

    id v28 = [v21 downloadOptions];
    uint64_t v29 = +[TRICKOperationGroupFactory groupForDownloadOptions:v28];
    [v27 setGroup:v29];

    id v30 = [(TRICKNativeArtifactProvider *)self container];
    id v31 = [v30 publicCloudDatabase];
    [v31 addOperation:v27];

    id v6 = v23;
  }
  else
  {
    uint64_t v32 = TRILogCategory_Server();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v32, OS_LOG_TYPE_ERROR, "failed to fetch BMLT catalog (unknown container)", buf, 2u);
    }

    (*((void (**)(id, void, void, void, void))v7 + 2))(v7, 0, 0, 0, 0);
  }
}

void __82__TRICKNativeArtifactProvider_fetchBMLTCatalogNotificationWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 recordID];
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Received BMLT catalog notification ckRecordID %@", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) addObject:v4];
  }
}

void __82__TRICKNativeArtifactProvider_fetchBMLTCatalogNotificationWithOptions_completion___block_invoke_275(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TRILogCategory_Server();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v4;
    _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Finished fetchBMLTCatalogNotification query error %@", buf, 0xCu);
  }

  if (v4)
  {
    id v6 = [*(id *)(a1 + 32) downloadOptions];
    int v7 = +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:v4 options:v6];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    int v7 = [*(id *)(a1 + 40) firstObject];
    *(void *)buf = 0;
    if (v7)
    {
      id v8 = +[TRIClientBMLTCatalogArtifact artifactFromCKRecord:v7 error:buf];
      uint64_t v9 = *(void *)buf;
    }
    else
    {
      id v10 = TRILogCategory_Server();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_error_impl(&dword_1DA291000, v10, OS_LOG_TYPE_ERROR, "Unable to fetch BMLT catalog notification", v14, 2u);
      }

      uint64_t v11 = [NSString stringWithFormat:@"Unable to fetch BMLT catalog notification"];
      id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v15 = *MEMORY[0x1E4F28568];
      uint64_t v16 = v11;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      uint64_t v9 = [v12 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v13];
      *(void *)buf = v9;

      id v8 = 0;
    }
    (*(void (**)(void, uint64_t, void *, void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 4 * (v9 == 0), v8, 0, v9);
  }
}

- (void)fetchBMLTNotificationsWithOptions:(id)a3 completion:(id)a4
{
}

- (void)fetchBMLTNotificationWithDeployment:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v50 = a4;
  id v9 = a5;
  id v10 = [(TRICKNativeArtifactProvider *)self container];
  LODWORD(a5) = +[TRICKNativeArtifactProvider containerFromCkContainer:v10];

  uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "deploymentId"));
  if (a5)
  {
    id v12 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v13 = *MEMORY[0x1E4FB0348];
    id v49 = v8;
    uint64_t v14 = [v8 backgroundMLTaskId];
    uint64_t v15 = [v12 triLoggablePredicateWithFormat:@"%K == %@", v13, v14];

    id v48 = v11;
    if (v11) {
      [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K == %@", *MEMORY[0x1E4FB0358], v11];
    }
    else {
    uint64_t v17 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithValue:1];
    }
    uint64_t v18 = [MEMORY[0x1E4FB0258] sharedInstance];
    uint64_t v19 = [v18 populationType];

    uint64_t v20 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v21 = *MEMORY[0x1E4FB0370];
    id v22 = [NSNumber numberWithInt:v19];
    id v63 = v22;
    id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
    id v45 = [v20 triLoggablePredicateWithFormat:@"ANY %K IN %@", v21, v23];

    id v44 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K == %@", *MEMORY[0x1E4FB0380], &unk_1F347B7E0];
    id v24 = (void *)MEMORY[0x1E4F28BA0];
    id v46 = (void *)v17;
    id v47 = (void *)v15;
    v62[0] = v15;
    v62[1] = v17;
    v62[2] = v45;
    v62[3] = v44;
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:4];
    __int16 v26 = [v24 andPredicateWithSubpredicates:v25];

    __int16 v27 = objc_opt_new();
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __86__TRICKNativeArtifactProvider_fetchBMLTNotificationWithDeployment_options_completion___block_invoke;
    v58[3] = &unk_1E6BBA318;
    id v28 = v49;
    id v59 = v28;
    id v29 = v11;
    id v60 = v29;
    id v30 = v27;
    id v61 = v30;
    id v31 = (void *)MEMORY[0x1E016EA80](v58);
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __86__TRICKNativeArtifactProvider_fetchBMLTNotificationWithDeployment_options_completion___block_invoke_280;
    void v51[3] = &unk_1E6BBA630;
    id v32 = v28;
    id v52 = v32;
    id v53 = v29;
    id v33 = v50;
    id v54 = v33;
    uint64_t v56 = self;
    id v57 = v9;
    id v55 = v30;
    id v43 = v30;
    id v34 = (void *)MEMORY[0x1E016EA80](v51);
    uint64_t v35 = *MEMORY[0x1E4FB0340];
    id v36 = +[TRIClientBMLTArtifact allReferencedCKRecordKeys];
    id v37 = [(TRICKNativeArtifactProvider *)self queryOperationForRecordType:v35 predicate:v26 sortDescriptors:MEMORY[0x1E4F1CBF0] desiredKeys:v36 options:v33 recordMatchedBlock:v31 queryCompletionBlock:v34];

    id v38 = [v32 backgroundMLTaskId];
    uint64_t v39 = +[TRICKOperationGroupFactory groupForBMLTId:v38];
    [v37 setGroup:v39];

    id v40 = [(TRICKNativeArtifactProvider *)self container];
    id v41 = [v40 publicCloudDatabase];
    [v41 addOperation:v37];

    uint64_t v11 = v48;
    id v8 = v49;
  }
  else
  {
    uint64_t v16 = TRILogCategory_Server();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v42 = [v8 backgroundMLTaskId];
      *(_DWORD *)buf = 138543618;
      long long v65 = v42;
      __int16 v66 = 2112;
      long long v67 = v11;
      _os_log_error_impl(&dword_1DA291000, v16, OS_LOG_TYPE_ERROR, "failed to fetch BMLT %{public}@.%@ (unknown container)", buf, 0x16u);
    }
    (*((void (**)(id, void, void, void, void))v9 + 2))(v9, 0, 0, 0, 0);
  }
}

void __86__TRICKNativeArtifactProvider_fetchBMLTNotificationWithDeployment_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 32) backgroundMLTaskId];
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = [v4 recordID];
      int v9 = 138543874;
      id v10 = v6;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Received BMLT notification for deployment %{public}@.%@ ckRecordID %@", (uint8_t *)&v9, 0x20u);
    }
    [*(id *)(a1 + 48) addObject:v4];
  }
}

void __86__TRICKNativeArtifactProvider_fetchBMLTNotificationWithDeployment_options_completion___block_invoke_280(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TRILogCategory_Server();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) backgroundMLTaskId];
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v6;
    __int16 v22 = 2112;
    uint64_t v23 = v7;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Finished fetchBMLTNotification query for deployment %{public}@.%@ error %@", buf, 0x20u);
  }
  if (v4)
  {
    id v8 = [*(id *)(a1 + 48) downloadOptions];
    int v9 = +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:v4 options:v8];

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    int v9 = [*(id *)(a1 + 56) firstObject];
    id v17 = 0;
    if (v9)
    {
      id v10 = +[TRIClientBMLTArtifact artifactFromCKRecord:v9 namespaceDescriptorProvider:*(void *)(*(void *)(a1 + 64) + 40) error:&v17];
      id v11 = v17;
    }
    else
    {
      uint64_t v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v13 = [*(id *)(a1 + 32) backgroundMLTaskId];
        *(_DWORD *)buf = 138543362;
        uint64_t v21 = v13;
        _os_log_impl(&dword_1DA291000, v12, OS_LOG_TYPE_DEFAULT, "Unable to find BMLT ID %{public}@. Please verify BMLT id is valid.", buf, 0xCu);
      }
      uint64_t v14 = [NSString stringWithFormat:@"Unable to find BMLT"];
      id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v18 = *MEMORY[0x1E4F28568];
      uint64_t v19 = v14;
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v11 = (id)[v15 initWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v16];
      id v17 = v11;

      id v10 = 0;
    }
    (*(void (**)(void, uint64_t, void *, void, id))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), 4 * (v11 == 0), v10, 0, v11);
  }
}

- (void)_fetchBMLTNotificationsWithCursor:(id)a3 options:(id)a4 completion:(id)a5
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v8 = a4;
  id v9 = a5;
  context = (void *)MEMORY[0x1E016E7F0]();
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __84__TRICKNativeArtifactProvider__fetchBMLTNotificationsWithCursor_options_completion___block_invoke;
  v35[3] = &unk_1E6BBA830;
  void v35[4] = self;
  id v10 = v9;
  id v36 = v10;
  id v37 = v38;
  id v11 = (void *)MEMORY[0x1E016EA80](v35);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __84__TRICKNativeArtifactProvider__fetchBMLTNotificationsWithCursor_options_completion___block_invoke_285;
  v30[3] = &unk_1E6BBA858;
  id v34 = v38;
  id v12 = v8;
  id v31 = v12;
  id v13 = v10;
  id v32 = self;
  id v33 = v13;
  uint64_t v14 = (void *)MEMORY[0x1E016EA80](v30);
  id v15 = +[TRIClientBMLTArtifact allReferencedCKRecordKeys];
  if (v29)
  {
    uint64_t v16 = [(TRICKNativeArtifactProvider *)self queryOperationWithCursor:v29 desiredKeys:v15 options:v12 recordMatchedBlock:v11 queryCompletionBlock:v14];
  }
  else
  {
    id v17 = objc_opt_new();
    uint64_t v18 = [MEMORY[0x1E4FB0258] sharedInstance];
    uint64_t v19 = [v18 populationType];

    uint64_t v20 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v21 = [NSNumber numberWithInt:v19];
    v39[0] = v21;
    __int16 v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    uint64_t v23 = [v20 triLoggablePredicateWithFormat:@"ANY %K IN %@", *MEMORY[0x1E4FB0370], v22, context];
    [v17 addObject:v23];

    __int16 v24 = [MEMORY[0x1E4F28F60] triLoggablePredicateWithFormat:@"%K == %@", *MEMORY[0x1E4FB0380], &unk_1F347B7E0];
    [v17 addObject:v24];

    id v25 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v17];
    uint64_t v16 = [(TRICKNativeArtifactProvider *)self queryOperationForRecordType:*MEMORY[0x1E4FB0340] predicate:v25 sortDescriptors:MEMORY[0x1E4F1CBF0] desiredKeys:v15 options:v12 recordMatchedBlock:v11 queryCompletionBlock:v14];
  }
  uint64_t v26 = [(TRICKNativeArtifactProvider *)self container];
  __int16 v27 = [v26 publicCloudDatabase];
  [v27 addOperation:v16];

  _Block_object_dispose(v38, 8);
}

void __84__TRICKNativeArtifactProvider__fetchBMLTNotificationsWithCursor_options_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = TRILogCategory_Server();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 recordID];
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_1DA291000, v5, OS_LOG_TYPE_DEFAULT, "Received BMLTNotification with CKRecordID %{public}@", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v7 = [*(id *)(a1 + 32) namespaceDescriptorProvider];
    id v8 = +[TRIClientBMLTArtifact artifactFromCKRecord:v4 namespaceDescriptorProvider:v7 error:0];

    if (v8)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
  }
}

void __84__TRICKNativeArtifactProvider__fetchBMLTNotificationsWithCursor_options_completion___block_invoke_285(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = TRILogCategory_Server();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    int v13 = 134218498;
    uint64_t v14 = v8;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl(&dword_1DA291000, v7, OS_LOG_TYPE_DEFAULT, "Finished fetchBMLTNotifications query with %tu results cursor %@ error %{public}@", (uint8_t *)&v13, 0x20u);
  }

  if (v6)
  {
    int v9 = [*(id *)(a1 + 32) downloadOptions];
    id v10 = +[TRICKNativeArtifactProvider fetchRetryDateFromErrorAndOptions:v6 options:v9];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E016E7F0]();
    if (v5) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 4;
    }
    (*(void (**)(void, uint64_t, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v12, 0, 0, 0);
    if (v5) {
      [*(id *)(a1 + 40) _fetchBMLTNotificationsWithCursor:v5 options:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
    }
  }
}

- (CKContainer)container
{
  return self->_container;
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (NSString)teamId
{
  return self->_teamId;
}

- (TRIDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (TRINamespaceDescriptorProviding)namespaceDescriptorProvider
{
  return self->_namespaceDescriptorProvider;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (TRICKQueryLog)queryLog
{
  return self->_queryLog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryLog, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_namespaceDescriptorProvider, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_teamId, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end