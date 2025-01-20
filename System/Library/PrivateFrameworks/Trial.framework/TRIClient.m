@interface TRIClient
+ (BOOL)_isFactorRecordFileType:(id)a3;
+ (BOOL)isPlatformBinary;
+ (BOOL)sysdiagnoseInfoToDir:(id)a3 error:(id *)a4;
+ (TRIClient)clientWithIdentifier:(int)a3;
+ (TRIClient)clientWithIdentifier:(int)a3 unit:(int)a4;
+ (TRIClient)clientWithProjectId:(int)a3 factorsState:(id)a4;
+ (id)_sysdiagnoseLogProviders;
+ (id)activeBMLTInformation:(id *)a3;
+ (id)activeExperimentInformation:(id *)a3;
+ (id)activeRolloutInformation:(id *)a3;
+ (id)getSandboxExtensionTokensForIdentifierQueryWithError:(id *)a3;
+ (id)printedBMLTInformation:(id *)a3;
+ (id)printedExperimentInformation:(id *)a3;
+ (id)printedNCVInformation;
+ (id)printedOnDemandReferenceCountsPerUserInformationWithError:(id *)a3;
+ (id)printedRolloutInformation:(id *)a3;
+ (id)sysdiagnoseInfoWithError:(id *)a3;
+ (void)logSystemCovariates;
+ (void)printCurrentSettings;
- (BOOL)_hasAppropriatePermissionsForNamespaceName:(id)a3;
- (BOOL)deregisterNamespaceName:(id)a3 error:(id *)a4;
- (BOOL)evaluateBMLTTargetingExpression:(id)a3 withParameters:(id)a4 error:(id *)a5;
- (BOOL)hasDownloadedNamespaceWithName:(id)a3;
- (BOOL)hasRegisteredNamespaceWithName:(id)a3;
- (BOOL)immediateDownloadForNamespaceNames:(id)a3 allowExpensiveNetworking:(BOOL)a4 error:(id *)a5;
- (BOOL)promoteFactorsForNamespace:(id)a3 error:(id *)a4;
- (BOOL)registerNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 defaultsFileURL:(id)a5 applicationGroup:(id)a6 cloudKitContainerId:(int)a7 error:(id *)a8;
- (BOOL)setFactorsProvisionalForNamespace:(id)a3 error:(id *)a4;
- (BOOL)setPurgeabilityLevelsForFactors:(id)a3 withNamespaceName:(id)a4;
- (BOOL)trialIdentifiersWithNamespaceName:(id)a3 experimentId:(id *)a4 deploymentId:(int *)a5 treatmentId:(id *)a6;
- (TRIClient)initWithClientIdentifier:(int)a3 paths:(id)a4 unit:(int)a5 factorsState:(id)a6 staleFactorsUsageGracePeriod:(double)a7 logger:(id)a8;
- (TRIClient)initWithClientIdentifier:(int)a3 paths:(id)a4 unit:(int)a5 staleFactorsUsageGracePeriod:(double)a6 logger:(id)a7;
- (TRIClient)initWithNonLoggingClientIdentifier:(int)a3 paths:(id)a4;
- (TRILogger)logger;
- (TRITrackingId)trackingId;
- (id)_bmltIdentifiersWithNamespaceName:(id)a3;
- (id)_rampIdForRolloutDeployment:(id)a3;
- (id)_refresh:(BOOL)a3;
- (id)addUpdateHandlerForNamespaceId:(unsigned int)a3 queue:(id)a4 usingBlock:(id)a5;
- (id)addUpdateHandlerForNamespaceId:(unsigned int)a3 usingBlock:(id)a4;
- (id)addUpdateHandlerForNamespaceName:(id)a3 queue:(id)a4 usingBlock:(id)a5;
- (id)addUpdateHandlerForNamespaceName:(id)a3 usingBlock:(id)a4;
- (id)backgroundMLTaskIdentifiersWithNamespaceName:(id)a3;
- (id)experimentIdWithNamespace:(unsigned int)a3;
- (id)experimentIdWithNamespaceName:(id)a3;
- (id)experimentIdentifiersWithNamespaceName:(id)a3;
- (id)factorLevelsWithNamespace:(unsigned int)a3;
- (id)factorLevelsWithNamespaceName:(id)a3;
- (id)levelForFactor:(id)a3 withNamespace:(unsigned int)a4;
- (id)levelForFactor:(id)a3 withNamespaceName:(id)a4;
- (id)newTrackingId;
- (id)newTrackingIdWithTreatmentRefresh:(BOOL)a3;
- (id)purgeabilityLevelsForFactorsWithNamespaceName:(id)a3;
- (id)rolloutIdWithNamespaceName:(id)a3;
- (id)rolloutIdentifiersWithNamespaceName:(id)a3;
- (id)sizesForFactors:(id)a3 withNamespaceName:(id)a4 forMetric:(unint64_t)a5 error:(id *)a6;
- (id)treatmentIdWithNamespace:(unsigned int)a3;
- (id)treatmentIdWithNamespaceName:(id)a3;
- (int64_t)_appContainerType:(id)a3;
- (unint64_t)statusOfDownloadForFactors:(id)a3 withNamespace:(id)a4 token:(id *)a5 queue:(id)a6 progress:(id)a7 completion:(id)a8;
- (unsigned)compatibilityVersionWithNamespaceName:(id)a3;
- (void)_checkEntitlements;
- (void)_invalidateFactors;
- (void)_lazyInit;
- (void)_logBMLTCustomTargetingWithResult:(BOOL)a3;
- (void)_registerUpdateHandlerForNamespaceName:(id)a3 notificationCallback:(id)a4 clientMethodNameForLogging:(const char *)a5 callingFunctionReturnAddressForLogging:(void *)a6;
- (void)_setupExcessiveStaleFactorsUsageTimerWithGuardedData:(id)a3 namespace:(id)a4 clientMethodNameForLogging:(const char *)a5 callingFunctionReturnAddressForLogging:(void *)a6;
- (void)cacheFactorLevelsWithNamespaceName:(id)a3;
- (void)dealloc;
- (void)downloadLevelsForFactors:(id)a3 withNamespace:(id)a4 queue:(id)a5 options:(id)a6 progress:(id)a7 completion:(id)a8;
- (void)downloadNamespaceWithName:(id)a3 options:(id)a4 completion:(id)a5;
- (void)downloadNamespaceWithName:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6;
- (void)refresh;
- (void)removeDownloadStatusHandlersWithToken:(id)a3;
- (void)removeLevelsForFactors:(id)a3 withNamespace:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)removeLevelsForFactorsImmediately:(id)a3 withNamespace:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)removeUpdateHandlerForToken:(id)a3;
- (void)setLogger:(id)a3;
@end

@implementation TRIClient

- (id)levelForFactor:(id)a3 withNamespaceName:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  [(TRIClient *)self _lazyInit];
  -[TRIClient _registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:](self, "_registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:", v7, 0, "-[TRIClient levelForFactor:withNamespaceName:]", v4);
  v9 = [(TRIDefaultFactorProvider *)self->_defaultFactorProvider levelForFactor:v8 withNamespaceName:v7];

  return v9;
}

- (void)_registerUpdateHandlerForNamespaceName:(id)a3 notificationCallback:(id)a4 clientMethodNameForLogging:(const char *)a5 callingFunctionReturnAddressForLogging:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __139__TRIClient__registerUpdateHandlerForNamespaceName_notificationCallback_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke;
  v15[3] = &unk_1E596B890;
  id v16 = v11;
  id v17 = v10;
  v18 = self;
  v19 = a5;
  v20 = a6;
  id v13 = v10;
  id v14 = v11;
  [(_PASLock *)lock runWithLockAcquired:v15];
}

- (void)_lazyInit
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __22__TRIClient__lazyInit__block_invoke;
  v3[3] = &unk_1E596B7A0;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

void __22__TRIClient__lazyInit__block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 40))
  {
    *(unsigned char *)(a2 + 40) = 1;
    [*(id *)(a1 + 32) refresh];
    [*(id *)(a1 + 32) _checkEntitlements];
    v3 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_19D909000, v3, OS_LOG_TYPE_DEFAULT, "Finished lazy initialization of TRIClient", v4, 2u);
    }
  }
}

- (void)refresh
{
  id v2 = [(TRIClient *)self _refresh:1];
}

- (id)_refresh:(BOOL)a3
{
  [(TRIClient *)self _lazyInit];
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__13;
  id v14 = __Block_byref_object_dispose__13;
  id v15 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __22__TRIClient__refresh___block_invoke;
  v8[3] = &unk_1E596B7C8;
  BOOL v9 = a3;
  v8[4] = self;
  v8[5] = &v10;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (void)_checkEntitlements
{
  v13[1] = *MEMORY[0x1E4F143B8];
  int v3 = [(id)objc_opt_class() requiresTrialDataVaultAccess];
  id v4 = [(TRIPaths *)self->_paths namespaceDescriptorsDir];
  v5 = (const char *)[v4 fileSystemRepresentation];

  *__error() = 0;
  if (v3 && access(v5, 4) && *__error() == 1)
  {
    if (self->_logger)
    {
      id v6 = [MEMORY[0x1E4FB05A8] metricWithName:@"triclient_missing_datavault"];
      logger = self->_logger;
      id v8 = [(TRIClient *)self trackingId];
      v13[0] = v6;
      BOOL v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      [(TRILogger *)logger logWithProjectNameAndTrackingId:v8 metrics:v9 dimensions:0 trialSystemTelemetry:0];
    }
    uint64_t v10 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      uint64_t v12 = v5;
      _os_log_error_impl(&dword_19D909000, v10, OS_LOG_TYPE_ERROR, "Cannot access \"%s\" - Please ensure you have set the entitlement <key>com.apple.trial.client</key> to the right value(s)", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (BOOL)_hasAppropriatePermissionsForNamespaceName:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4FB05B8] namespaceIdFromName:a3];
  v5 = [(TRIPaths *)self->_paths treatmentsDir];
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v4);
  id v7 = [v5 stringByAppendingPathComponent:v6];

  id v8 = [(TRIPaths *)self->_paths namespaceDescriptorsDir];
  id v9 = v7;
  if (access((const char *)[v9 fileSystemRepresentation], 4) && *__error() == 1)
  {
    uint64_t v10 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v9;
LABEL_12:
      _os_log_error_impl(&dword_19D909000, v10, OS_LOG_TYPE_ERROR, "Cannot access %@ - Please ensure you have set the entitlement \n<key>com.apple.trial.client</key> to the right value(s)", buf, 0xCu);
    }
  }
  else
  {
    id v11 = v8;
    if (!access((const char *)[v11 fileSystemRepresentation], 4) || *__error() != 1)
    {
      BOOL v12 = 1;
      goto LABEL_10;
    }
    uint64_t v10 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v11;
      goto LABEL_12;
    }
  }

  BOOL v12 = 0;
LABEL_10:

  return v12;
}

- (id)experimentIdentifiersWithNamespaceName:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  if (!v5)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIClient.m", 524, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  uint64_t v6 = [MEMORY[0x1E4FB05B8] namespaceIdFromName:v5];
  id v7 = [(TRIPaths *)self->_paths treatmentsDir];
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v6);
  id v9 = [v7 stringByAppendingPathComponent:v8];

  uint64_t v10 = [(TRIPaths *)self->_paths namespaceDescriptorsDir];
  id v11 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    v23 = v5;
    __int16 v24 = 1024;
    LODWORD(v25) = v6;
    _os_log_debug_impl(&dword_19D909000, v11, OS_LOG_TYPE_DEBUG, "Looking for experiment identifiers for namespace name: %{private}@ and namespace id: %d", buf, 0x12u);
  }

  BOOL v12 = v9;
  if (access((const char *)[v12 fileSystemRepresentation], 4) && *__error() == 1)
  {
    id v13 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v12;
LABEL_24:
      _os_log_error_impl(&dword_19D909000, v13, OS_LOG_TYPE_ERROR, "Cannot access %@ - Please ensure you have set the entitlement \n<key>com.apple.trial.client</key> to the right value(s)", buf, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  id v14 = v10;
  if (access((const char *)[v14 fileSystemRepresentation], 4) && *__error() == 1)
  {
    id v13 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v14;
      goto LABEL_24;
    }
LABEL_12:
    id v15 = 0;
    goto LABEL_20;
  }
  id v13 = [(TRIDefaultFactorProvider *)self->_defaultFactorProvider experimentDeploymentWithNamespaceName:v5];
  uint64_t v16 = [(TRIDefaultFactorProvider *)self->_defaultFactorProvider treatmentIdWithNamespaceName:v5];
  id v17 = (void *)v16;
  if (v13 && v16)
  {
    v18 = [TRIExperimentIdentifiers alloc];
    v19 = [v13 experimentId];
    id v15 = [(TRIExperimentIdentifiers *)v18 initWithExperimentId:v19 deploymentId:[v13 deploymentId] treatmentId:v17];
  }
  else
  {
    v19 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478083;
      v23 = v13;
      __int16 v24 = 2113;
      v25 = v17;
      _os_log_debug_impl(&dword_19D909000, v19, OS_LOG_TYPE_DEBUG, "Either of ExperimentDeployment %{private}@ or Treatment %{private}@ is nil", buf, 0x16u);
    }
    id v15 = 0;
  }

LABEL_20:
  return v15;
}

- (id)rolloutIdentifiersWithNamespaceName:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"TRIClient.m", 560, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  uint64_t v6 = [MEMORY[0x1E4FB05B8] namespaceIdFromName:v5];
  id v7 = [(TRIPaths *)self->_paths treatmentsDir];
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v6);
  id v9 = [v7 stringByAppendingPathComponent:v8];

  uint64_t v10 = [(TRIPaths *)self->_paths namespaceDescriptorsDir];
  id v11 = v9;
  if (access((const char *)[v11 fileSystemRepresentation], 4) && *__error() == 1)
  {
    BOOL v12 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v11;
LABEL_19:
      _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, "Cannot access %@ - Please ensure you have set the entitlement \n<key>com.apple.trial.client</key> to the right value(s)", buf, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  id v13 = v10;
  if (access((const char *)[v13 fileSystemRepresentation], 4) && *__error() == 1)
  {
    BOOL v12 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v13;
      goto LABEL_19;
    }
LABEL_10:

    id v14 = 0;
    goto LABEL_15;
  }
  id v15 = [(TRIDefaultFactorProvider *)self->_defaultFactorProvider rolloutDeploymentWithNamespaceName:v5];
  uint64_t v16 = [(TRIDefaultFactorProvider *)self->_defaultFactorProvider factorPackIdForRolloutWithNamespaceName:v5];
  id v17 = (void *)v16;
  id v14 = 0;
  if (v15 && v16)
  {
    v18 = [(TRIClient *)self _rampIdForRolloutDeployment:v15];
    v19 = [TRIRolloutIdentifiers alloc];
    v20 = [v15 rolloutId];
    id v14 = -[TRIRolloutIdentifiers initWithRolloutId:deploymentId:factorPackId:rampId:](v19, "initWithRolloutId:deploymentId:factorPackId:rampId:", v20, [v15 deploymentId], v17, v18);
  }
LABEL_15:

  return v14;
}

+ (TRIClient)clientWithIdentifier:(int)a3
{
  return +[TRIClient clientWithIdentifier:*(void *)&a3 unit:2];
}

- (id)_rampIdForRolloutDeployment:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  paths = self->_paths;
  id v4 = a3;
  id v5 = [(TRIPaths *)paths namespaceDescriptorsDir];
  id v6 = [NSString alloc];
  id v7 = [v4 rolloutId];
  uint64_t v8 = [v4 deploymentId];

  id v9 = (void *)[v6 initWithFormat:@"v2/rolloutV2/%@/%d/%@", v7, v8, @"rampId"];
  uint64_t v10 = [v5 stringByAppendingPathComponent:v9];

  id v19 = 0;
  id v11 = [NSString stringWithContentsOfFile:v10 encoding:4 error:&v19];
  id v12 = v19;
  id v13 = v12;
  if (v11)
  {
    id v14 = TRIValidateRampId(v11);
    goto LABEL_12;
  }
  if (!v12) {
    goto LABEL_9;
  }
  id v15 = [v12 domain];
  if (([v15 isEqualToString:*MEMORY[0x1E4F281F8]] & 1) == 0)
  {

LABEL_9:
    id v17 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v21 = v10;
      __int16 v22 = 2114;
      v23 = v13;
      _os_log_error_impl(&dword_19D909000, v17, OS_LOG_TYPE_ERROR, "Unable to read ramp ID from file at path %{public}@: %{public}@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  uint64_t v16 = [v13 code];

  if (v16 != 260) {
    goto LABEL_9;
  }
  id v17 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v10;
    _os_log_debug_impl(&dword_19D909000, v17, OS_LOG_TYPE_DEBUG, "No ramp ID file found at path %{public}@", buf, 0xCu);
  }
LABEL_11:

  id v14 = 0;
LABEL_12:

  return v14;
}

void __22__TRIClient__refresh___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(unsigned int *)(v5 + 24);
  uint64_t v7 = *(void *)(v5 + 8);
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v8 = +[TRITrackingId trackingIdWithProjectId:*(unsigned int *)(v5 + 24) paths:*(void *)(v5 + 8)];
    id v9 = v4[1];
    v4[1] = (id)v8;

    [*(id *)(a1 + 32) _invalidateFactors];
  }
  else
  {
    uint64_t v10 = [v3[1] treatments];
    uint64_t v11 = +[TRITrackingId trackingIdWithProjectId:v6 paths:v7 treatments:v10];
    id v12 = v4[1];
    v4[1] = (id)v11;
  }
  id v13 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v14 = [v4[1] uuid];
    id v15 = [v4[1] subject];
    uint64_t v16 = [v15 deviceId];
    int v17 = 138412546;
    v18 = v14;
    __int16 v19 = 2112;
    v20 = v16;
    _os_log_debug_impl(&dword_19D909000, v13, OS_LOG_TYPE_DEBUG, "Generated new tracking id %@ for subject with device id %@", (uint8_t *)&v17, 0x16u);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4[1]);
}

- (void)_invalidateFactors
{
  [(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global_309];
  defaultFactorProvider = self->_defaultFactorProvider;
  [(TRIDefaultFactorProvider *)defaultFactorProvider invalidateAllFactorProviders];
}

void __139__TRIClient__registerUpdateHandlerForNamespaceName_notificationCallback_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v4 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [*(id *)(a1 + 32) id];
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      uint64_t v24 = v5;
      __int16 v25 = 2112;
      uint64_t v26 = v6;
      _os_log_impl(&dword_19D909000, v4, OS_LOG_TYPE_DEFAULT, "adding update handler %lu for namespace %@", buf, 0x16u);
    }

    uint64_t v7 = [v3[3] objectForKeyedSubscript:*(void *)(a1 + 40)];
    if (!v7)
    {
      uint64_t v7 = objc_opt_new();
      [v3[3] setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    [v7 addObject:*(void *)(a1 + 32)];
    uint64_t v8 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = [*(id *)(a1 + 32) id];
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v15 = [v7 count];
      *(_DWORD *)buf = 134218498;
      uint64_t v24 = v13;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      __int16 v27 = 2048;
      uint64_t v28 = v15;
      _os_log_debug_impl(&dword_19D909000, v8, OS_LOG_TYPE_DEBUG, "added update handler %lu for namespace %@ -- now %lu handlers for this namespace", buf, 0x20u);
    }
  }
  id v9 = [v3[2] objectForKey:*(void *)(a1 + 40)];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    objc_initWeak((id *)buf, *(id *)(a1 + 48));
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __139__TRIClient__registerUpdateHandlerForNamespaceName_notificationCallback_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke_216;
    __int16 v19 = &unk_1E596B8B8;
    id v20 = *(id *)(a1 + 40);
    objc_copyWeak(&v21, (id *)buf);
    long long v22 = *(_OWORD *)(a1 + 56);
    uint64_t v11 = (void *)MEMORY[0x19F3AD290](&v16);
    id v12 = +[TRINamespaceUpdateNotification registerUpdateForNamespaceName:queue:usingBlock:](TRINamespaceUpdateNotification, "registerUpdateForNamespaceName:queue:usingBlock:", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 48) + 48), v11, v16, v17, v18, v19);
    if (v12) {
      [v3[2] setObject:v12 forKeyedSubscript:*(void *)(a1 + 40)];
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
}

+ (TRIClient)clientWithIdentifier:(int)a3 unit:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = +[TRIStandardPaths sharedSystemPaths];
  uint64_t v8 = [[TRIClient alloc] initWithClientIdentifier:v5 paths:v7 unit:v4 staleFactorsUsageGracePeriod:0 logger:86400.0];
  if ([a1 requiresLogging])
  {
    id v9 = objc_opt_new();
    BOOL v10 = [TRILogger alloc];
    v14[0] = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v12 = [(TRILogger *)v10 initWithClient:v8 projectId:v5 logHandlers:v11];

    [(TRIClient *)v8 setLogger:v12];
  }

  return v8;
}

+ (BOOL)isPlatformBinary
{
  if (qword_1EB3B79F8 != -1) {
    dispatch_once(&qword_1EB3B79F8, &__block_literal_global_25);
  }
  return _MergedGlobals_20;
}

- (void)setLogger:(id)a3
{
}

- (TRIClient)initWithClientIdentifier:(int)a3 paths:(id)a4 unit:(int)a5 staleFactorsUsageGracePeriod:(double)a6 logger:(id)a7
{
  uint64_t v8 = [(TRIClient *)self initWithClientIdentifier:*(void *)&a3 paths:a4 unit:*(void *)&a5 factorsState:0 staleFactorsUsageGracePeriod:a7 logger:a6];
  if (!v8)
  {
    BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, 0, @"TRIClient.m", 205, @"Expression was unexpectedly nil/false: %@", @"[self initWithClientIdentifier:projectId paths:paths unit:unit factorsState:nil staleFactorsUsageGracePeriod:staleFactorsUsageGracePeriod logger:logger]" object file lineNumber description];
  }
  return v8;
}

- (TRIClient)initWithClientIdentifier:(int)a3 paths:(id)a4 unit:(int)a5 factorsState:(id)a6 staleFactorsUsageGracePeriod:(double)a7 logger:(id)a8
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  v33.receiver = self;
  v33.super_class = (Class)TRIClient;
  uint64_t v17 = [(TRIClient *)&v33 init];
  if (!v17) {
    goto LABEL_6;
  }
  v18 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = @"TrialXP-429.0.3.2";
    _os_log_impl(&dword_19D909000, v18, OS_LOG_TYPE_DEFAULT, "Initializing TRIClient. Trial version: %@", buf, 0xCu);
  }

  objc_storeStrong((id *)&v17->_paths, a4);
  __int16 v19 = [[TRIDefaultFactorProvider alloc] initWithPaths:v14 factorsState:v15];
  defaultFactorProvider = v17->_defaultFactorProvider;
  v17->_defaultFactorProvider = v19;

  if (v17->_defaultFactorProvider)
  {
    v17->_projectId = a3;
    objc_storeStrong((id *)&v17->_logger, a8);
    v17->_staleFactorsUsageGracePeriod = a7;
    uint64_t v21 = objc_opt_new();
    uint64_t v22 = objc_opt_new();
    v23 = *(void **)(v21 + 16);
    *(void *)(v21 + 16) = v22;

    uint64_t v24 = objc_opt_new();
    __int16 v25 = *(void **)(v21 + 24);
    *(void *)(v21 + 24) = v24;

    *(unsigned char *)(v21 + 40) = 0;
    uint64_t v26 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v21];
    lock = v17->_lock;
    v17->_lock = (_PASLock *)v26;

    uint64_t v28 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.Trial.notificationQueue" qosClass:17];
    notificationQueue = v17->_notificationQueue;
    v17->_notificationQueue = (OS_dispatch_queue *)v28;

    objc_storeStrong((id *)&v17->_factorsState, a6);
LABEL_6:
    v30 = v17;
    goto LABEL_10;
  }
  v31 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19D909000, v31, OS_LOG_TYPE_ERROR, "Initializing TRIClient with factor state failed. No default factor provider found", buf, 2u);
  }

  v30 = 0;
LABEL_10:

  return v30;
}

void __20__TRIClient_dealloc__block_invoke(uint64_t a1, void *a2)
{
  int v3 = (void *)a2[2];
  uint64_t v4 = a2;
  [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_189];
  id v5 = (id)a2[2];
  a2[2] = 0;
}

uint64_t __20__TRIClient_dealloc__block_invoke_2()
{
  return +[TRINamespaceUpdateNotification deregisterUpdateWithToken:](TRINamespaceUpdateNotification, "deregisterUpdateWithToken:");
}

- (void)dealloc
{
  [(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global_186];
  v3.receiver = self;
  v3.super_class = (Class)TRIClient;
  [(TRIClient *)&v3 dealloc];
}

- (id)addUpdateHandlerForNamespaceName:(id)a3 queue:(id)a4 usingBlock:(id)a5
{
  id v9 = a5;
  BOOL v10 = (OS_dispatch_queue *)a4;
  id v11 = a3;
  [(TRIClient *)self _lazyInit];
  id v12 = objc_opt_new();
  uint64_t v13 = v12;
  notificationQueue = v10;
  if (!v10) {
    notificationQueue = self->_notificationQueue;
  }
  [v12 setQueue:notificationQueue];

  [v13 setHandler:v9];
  -[TRIClient _registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:](self, "_registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:", v11, v13, "-[TRIClient addUpdateHandlerForNamespaceName:queue:usingBlock:]", v5);

  return v13;
}

- (id)addUpdateHandlerForNamespaceName:(id)a3 usingBlock:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  [(TRIClient *)self _lazyInit];
  id v9 = objc_opt_new();
  [v9 setQueue:self->_notificationQueue];
  [v9 setHandler:v7];

  -[TRIClient _registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:](self, "_registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:", v8, v9, "-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:]", v4);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_factorsState, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_defaultFactorProvider, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

void __31__TRIClient__invalidateFactors__block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (void *)a2[4];
  uint64_t v4 = a2;
  [v3 invalidate];
  id v5 = (id)a2[4];
  a2[4] = 0;
}

void __29__TRIClient_isPlatformBinary__block_invoke()
{
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    _MergedGlobals_20 = (SecTaskGetCodeSignStatus(v0) & 0xC000001) == 67108865;
    CFRelease(v1);
  }
}

- (BOOL)immediateDownloadForNamespaceNames:(id)a3 allowExpensiveNetworking:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v8;
  if (v8 && [v8 count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    BOOL v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v16 = (void *)MEMORY[0x19F3AD060]();
          LOBYTE(v15) = [(TRIClient *)self _hasAppropriatePermissionsForNamespaceName:v15];
          if ((v15 & 1) == 0)
          {
            if (a5)
            {
              id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v29 = *MEMORY[0x1E4F28568];
              v30 = @"Process is not entitled for immediate download.";
              uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
              *a5 = (id)[v20 initWithDomain:@"TRIGeneralErrorDomain" code:3 userInfo:v21];
            }
            char v18 = 0;
            goto LABEL_20;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v31 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    uint64_t v17 = objc_opt_new();
    id v23 = 0;
    char v18 = [v17 immediateDownloadForNamespaceNames:v10 allowExpensiveNetworking:v6 error:&v23];
    __int16 v19 = v23;
    BOOL v10 = v19;
    if (a5) {
      *a5 = v19;
    }
  }
  else
  {
    BOOL v10 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D909000, v10, OS_LOG_TYPE_DEFAULT, "Immediate download is not needed, namespace names are either nil or empty", buf, 2u);
    }
    char v18 = 1;
  }
LABEL_20:

  return v18;
}

- (id)factorLevelsWithNamespaceName:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TRIClient.m", 351, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  [(TRIClient *)self _lazyInit];
  -[TRIClient _registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:](self, "_registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:", v6, 0, "-[TRIClient factorLevelsWithNamespaceName:]", v3);
  id v7 = [(TRIDefaultFactorProvider *)self->_defaultFactorProvider factorLevelsWithNamespaceName:v6];

  return v7;
}

+ (TRIClient)clientWithProjectId:(int)a3 factorsState:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = +[TRIStandardPaths sharedSystemPaths];
  id v8 = [[TRIClient alloc] initWithClientIdentifier:v4 paths:v7 unit:2 factorsState:v6 staleFactorsUsageGracePeriod:0 logger:86400.0];

  if ([a1 requiresLogging])
  {
    id v9 = objc_opt_new();
    BOOL v10 = [TRILogger alloc];
    v14[0] = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    uint64_t v12 = [(TRILogger *)v10 initWithClient:v8 projectId:v4 logHandlers:v11];

    [(TRIClient *)v8 setLogger:v12];
  }

  return v8;
}

- (TRIClient)initWithNonLoggingClientIdentifier:(int)a3 paths:(id)a4
{
  return [(TRIClient *)self initWithClientIdentifier:*(void *)&a3 paths:a4 unit:2 staleFactorsUsageGracePeriod:0 logger:86400.0];
}

- (TRITrackingId)trackingId
{
  [(TRIClient *)self _lazyInit];
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__13;
  uint64_t v13 = __Block_byref_object_dispose__13;
  id v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __23__TRIClient_trackingId__block_invoke;
  v8[3] = &unk_1E596B7F0;
  v8[4] = &v9;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"TRIClient.m" lineNumber:329 description:@"trackingId unexpectedly not assigned"];
  }
  return (TRITrackingId *)v5;
}

void __23__TRIClient_trackingId__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)newTrackingId
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newTrackingIdWithTreatmentRefresh:(BOOL)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)cacheFactorLevelsWithNamespaceName:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIClient.m", 362, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  [(TRIClient *)self _lazyInit];
  -[TRIClient _registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:](self, "_registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:", v7, 0, "-[TRIClient cacheFactorLevelsWithNamespaceName:]", v3);
  [(TRIDefaultFactorProvider *)self->_defaultFactorProvider cacheFactorLevelsWithNamespaceName:v7];
}

- (void)removeUpdateHandlerForToken:(id)a3
{
  id v4 = a3;
  [(TRIClient *)self _lazyInit];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (v5)
    {
      lock = self->_lock;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __41__TRIClient_removeUpdateHandlerForToken___block_invoke;
      v7[3] = &unk_1E596B7A0;
      id v8 = v5;
      [(_PASLock *)lock runWithLockAcquired:v7];
    }
  }
}

void __41__TRIClient_removeUpdateHandlerForToken___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a2 + 24);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__TRIClient_removeUpdateHandlerForToken___block_invoke_2;
  v3[3] = &unk_1E596B818;
  id v4 = *(id *)(a1 + 32);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __41__TRIClient_removeUpdateHandlerForToken___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [v6 count];
  [v6 removeObject:*(void *)(a1 + 32)];
  unint64_t v8 = [v6 count];

  if (v8 < v7)
  {
    uint64_t v9 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [*(id *)(a1 + 32) id];
      int v11 = 134218242;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_19D909000, v9, OS_LOG_TYPE_DEFAULT, "removed update handler %lu for namespace %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)_setupExcessiveStaleFactorsUsageTimerWithGuardedData:(id)a3 namespace:(id)a4 clientMethodNameForLogging:(const char *)a5 callingFunctionReturnAddressForLogging:(void *)a6
{
  uint64_t v10 = a3;
  id v11 = a4;
  if (!v10[4])
  {
    objc_initWeak(&location, self);
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    char v18 = __142__TRIClient__setupExcessiveStaleFactorsUsageTimerWithGuardedData_namespace_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke;
    __int16 v19 = &unk_1E596B868;
    objc_copyWeak(v20, &location);
    v20[1] = a6;
    v20[2] = (id)a5;
    uint64_t v12 = (void *)MEMORY[0x19F3AD290](&v16);
    __int16 v13 = [TRIExcessiveStaleFactorsUsageTimer alloc];
    uint64_t v14 = -[TRIExcessiveStaleFactorsUsageTimer initWithNamespaceName:delayTimeInSeconds:block:](v13, "initWithNamespaceName:delayTimeInSeconds:block:", v11, v12, self->_staleFactorsUsageGracePeriod, v16, v17, v18, v19);
    uint64_t v15 = (void *)v10[4];
    v10[4] = v14;

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
}

void __142__TRIClient__setupExcessiveStaleFactorsUsageTimerWithGuardedData_namespace_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 5);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __142__TRIClient__setupExcessiveStaleFactorsUsageTimerWithGuardedData_namespace_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke_2;
    v9[3] = &unk_1E596B840;
    uint64_t v11 = *(void *)(a1 + 40);
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 48);
    id v10 = v7;
    uint64_t v12 = v8;
    [v6 runWithLockAcquired:v9];
  }
}

void __142__TRIClient__setupExcessiveStaleFactorsUsageTimerWithGuardedData_namespace_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke_2(void *a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1[5])
  {
    +[TRIMisc bestEffortSymbolicateAddress:](TRIMisc, "bestEffortSymbolicateAddress:");
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"(not recorded)";
  }
  id v5 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[6];
    int v8 = 138413058;
    uint64_t v9 = v6;
    __int16 v10 = 1024;
    int v11 = 24;
    __int16 v12 = 2080;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_error_impl(&dword_19D909000, v5, OS_LOG_TYPE_ERROR, "TRIClient MISUSE: Factor levels for namespace %@ have been stale for %u hours.\n    Factor levels were pinned by TRIClient method call: %s\n    Calling function: %@\nPinning stale factor levels increases disk space requirements.  Use -[TRIClient addUpdateHandlerForNamespaceName:usingBlock:] to detect factor level updates and respond to them (e.g. with -[TRIClient refresh]).", (uint8_t *)&v8, 0x26u);
  }
}

void __139__TRIClient__registerUpdateHandlerForNamespaceName_notificationCallback_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke_216(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v5;
    _os_log_impl(&dword_19D909000, v4, OS_LOG_TYPE_DEFAULT, "handling namespace update for %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    int v8 = (void *)*((void *)WeakRetained + 5);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __139__TRIClient__registerUpdateHandlerForNamespaceName_notificationCallback_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke_217;
    v9[3] = &unk_1E596B890;
    void v9[4] = WeakRetained;
    id v10 = *(id *)(a1 + 32);
    long long v12 = *(_OWORD *)(a1 + 48);
    id v11 = v3;
    [v8 runWithLockAcquired:v9];
  }
}

void __139__TRIClient__registerUpdateHandlerForNamespaceName_notificationCallback_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke_217(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) _setupExcessiveStaleFactorsUsageTimerWithGuardedData:v3 namespace:*(void *)(a1 + 40) clientMethodNameForLogging:*(void *)(a1 + 56) callingFunctionReturnAddressForLogging:*(void *)(a1 + 64)];
  id v4 = [v3[3] objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v5 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v25 = [v4 count];
    _os_log_impl(&dword_19D909000, v5, OS_LOG_TYPE_DEFAULT, "dispatching updates to %tu callbacks", buf, 0xCu);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
        long long v12 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v14 = [v11 id];
          uint64_t v15 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 134218242;
          uint64_t v25 = v14;
          __int16 v26 = 2112;
          uint64_t v27 = v15;
          _os_log_debug_impl(&dword_19D909000, v12, OS_LOG_TYPE_DEBUG, "calling update handler %lu for namespace %@", buf, 0x16u);
        }

        uint64_t v13 = [v11 queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __139__TRIClient__registerUpdateHandlerForNamespaceName_notificationCallback_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke_218;
        block[3] = &unk_1E596A260;
        block[4] = v11;
        id v19 = *(id *)(a1 + 48);
        dispatch_async(v13, block);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v8);
  }

  uint64_t v16 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v25 = v17;
    _os_log_impl(&dword_19D909000, v16, OS_LOG_TYPE_DEFAULT, "handled namespace update for %@", buf, 0xCu);
  }
}

void __139__TRIClient__registerUpdateHandlerForNamespaceName_notificationCallback_clientMethodNameForLogging_callingFunctionReturnAddressForLogging___block_invoke_218(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handler];
  v2[2](v2, *(void *)(a1 + 40));
}

- (id)rolloutIdWithNamespaceName:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TRIClient.m", 504, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  [(TRIClient *)self _lazyInit];
  -[TRIClient _registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:](self, "_registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:", v6, 0, "-[TRIClient rolloutIdWithNamespaceName:]", v3);
  uint64_t v7 = [(TRIDefaultFactorProvider *)self->_defaultFactorProvider factorPackIdForRolloutWithNamespaceName:v6];

  return v7;
}

- (id)treatmentIdWithNamespaceName:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TRIClient.m", 514, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  [(TRIClient *)self _lazyInit];
  -[TRIClient _registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:](self, "_registerUpdateHandlerForNamespaceName:notificationCallback:clientMethodNameForLogging:callingFunctionReturnAddressForLogging:", v6, 0, "-[TRIClient treatmentIdWithNamespaceName:]", v3);
  uint64_t v7 = [(TRIDefaultFactorProvider *)self->_defaultFactorProvider treatmentIdWithNamespaceName:v6];

  return v7;
}

- (BOOL)trialIdentifiersWithNamespaceName:(id)a3 experimentId:(id *)a4 deploymentId:(int *)a5 treatmentId:(id *)a6
{
  id v10 = a3;
  if ([(TRIClient *)self _hasAppropriatePermissionsForNamespaceName:v10])
  {
    if (a4) {
      *a4 = 0;
    }
    if (a5) {
      *a5 = -1;
    }
    if (a6) {
      *a6 = 0;
    }
    id v11 = [(TRIClient *)self treatmentIdWithNamespaceName:v10];
    long long v12 = v11;
    if (v11)
    {
      if (a6) {
        *a6 = v11;
      }
      uint64_t v13 = [(TRIDefaultFactorProvider *)self->_defaultFactorProvider experimentDeploymentWithNamespaceName:v10];
      uint64_t v14 = v13;
      BOOL v15 = v13 != 0;
      if (v13)
      {
        if (a4)
        {
          *a4 = [v13 experimentId];
        }
        if (a5) {
          *a5 = [v14 deploymentId];
        }
      }
    }
    else
    {
      BOOL v15 = 1;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)backgroundMLTaskIdentifiersWithNamespaceName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TRIClient *)self _bmltIdentifiersWithNamespaceName:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = v5;
  }
  else
  {
    uint64_t v8 = [(TRIClient *)self experimentIdentifiersWithNamespaceName:v4];
    if (v8)
    {
      uint64_t v9 = [TRIBackgroundMLTaskIdentifiers alloc];
      id v10 = [v8 experimentId];
      uint64_t v11 = [v8 deploymentId];
      long long v12 = [v8 treatmentId];
      uint64_t v7 = [(TRIBackgroundMLTaskIdentifiers *)v9 initWithBMLTTaskId:v10 deploymentId:v11 treatmentId:v12];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  return v7;
}

- (id)_bmltIdentifiersWithNamespaceName:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    long long v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"TRIClient.m", 661, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  uint64_t v6 = [MEMORY[0x1E4FB05B8] namespaceIdFromName:v5];
  uint64_t v7 = [(TRIPaths *)self->_paths treatmentsDir];
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v6);
  uint64_t v9 = [v7 stringByAppendingPathComponent:v8];

  id v10 = [(TRIPaths *)self->_paths namespaceDescriptorsDir];
  id v11 = v9;
  if (access((const char *)[v11 fileSystemRepresentation], 4) && *__error() == 1)
  {
    long long v12 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v11;
LABEL_19:
      _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, "Cannot access %@ - Please ensure you have set the entitlement \n<key>com.apple.trial.client</key> to the right value(s)", buf, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  id v13 = v10;
  if (access((const char *)[v13 fileSystemRepresentation], 4) && *__error() == 1)
  {
    long long v12 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v13;
      goto LABEL_19;
    }
LABEL_10:

    uint64_t v14 = 0;
    goto LABEL_15;
  }
  BOOL v15 = [(TRIDefaultFactorProvider *)self->_defaultFactorProvider bmltDeploymentWithNamespaceName:v5];
  uint64_t v16 = [(TRIDefaultFactorProvider *)self->_defaultFactorProvider factorPackIdForBmltWithNamespaceName:v5];
  uint64_t v17 = (void *)v16;
  uint64_t v14 = 0;
  if (v15 && v16)
  {
    char v18 = [TRIBackgroundMLTaskIdentifiers alloc];
    id v19 = [v15 backgroundMLTaskId];
    uint64_t v14 = -[TRIBackgroundMLTaskIdentifiers initWithBMLTaskId:deploymentId:factorPackId:](v18, "initWithBMLTaskId:deploymentId:factorPackId:", v19, [v15 deploymentId], v17);
  }
LABEL_15:

  return v14;
}

- (id)experimentIdWithNamespaceName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIClient.m", 696, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  id v12 = 0;
  BOOL v6 = [(TRIClient *)self trialIdentifiersWithNamespaceName:v5 experimentId:&v12 deploymentId:0 treatmentId:0];
  id v7 = v12;
  uint64_t v8 = v7;
  if (!v6) {
    id v7 = 0;
  }
  id v9 = v7;

  return v9;
}

- (int64_t)_appContainerType:(id)a3
{
  id v3 = a3;
  if (v3
    && (id v4 = (void *)MEMORY[0x1E4F93B28],
        TRILogCategory_ClientFramework(),
        id v5 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v4) = [v4 hasTrueBooleanEntitlement:@"application-identifier" logHandle:v5],
        v5,
        v4))
  {
    BOOL v6 = [MEMORY[0x1E4F28B50] mainBundle];
    id v7 = [v6 bundleIdentifier];

    if (v7)
    {
      if ([v3 isEqualToString:v7]) {
        int64_t v8 = 2;
      }
      else {
        int64_t v8 = 3;
      }
    }
    else
    {
      int64_t v8 = 2;
    }
  }
  else
  {
    int64_t v8 = 2;
  }

  return v8;
}

- (BOOL)hasRegisteredNamespaceWithName:(id)a3
{
  return [(TRIDefaultFactorProvider *)self->_defaultFactorProvider hasRegisteredNamespaceWithName:a3];
}

- (unsigned)compatibilityVersionWithNamespaceName:(id)a3
{
  return [(TRIDefaultFactorProvider *)self->_defaultFactorProvider compatibilityVersionWithNamespaceName:a3];
}

- (BOOL)registerNamespaceName:(id)a3 compatibilityVersion:(unsigned int)a4 defaultsFileURL:(id)a5 applicationGroup:(id)a6 cloudKitContainerId:(int)a7 error:(id *)a8
{
  uint64_t v9 = *(void *)&a7;
  uint64_t v12 = *(void *)&a4;
  v36[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  unint64_t v16 = (unint64_t)a6;
  [(TRIClient *)self _lazyInit];
  if (v12)
  {
    if (![(TRIClient *)self hasRegisteredNamespaceWithName:v14])
    {
      id v23 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v17 = [v23 bundleIdentifier];

      if (v16 | v17)
      {
        uint64_t v24 = objc_opt_new();
        int v18 = [v24 registerNamespaceWithNamespaceName:v14 compatibilityVersion:v12 defaultsFileURL:v15 applicationGroup:v16 cloudKitContainerId:v9 error:a8];
        if (v18)
        {
          if (v16) {
            uint64_t v25 = (void *)v16;
          }
          else {
            uint64_t v25 = (void *)v17;
          }
          if (v16) {
            uint64_t v26 = 3;
          }
          else {
            uint64_t v26 = 2;
          }
          id v27 = v25;
          uint64_t v28 = +[TRIAppContainer containerWithIdentifier:v27 type:v26];
          [(TRIDefaultFactorProvider *)self->_defaultFactorProvider setContainer:v28 forNamespaceName:v14];
          [(TRIClient *)self _invalidateFactors];
        }
      }
      else
      {
        uint64_t v29 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v31) = 0;
          _os_log_error_impl(&dword_19D909000, v29, OS_LOG_TYPE_ERROR, "No application group provided and application bundle identifier could not be identified.", (uint8_t *)&v31, 2u);
        }

        uint64_t v17 = 0;
        LOBYTE(v18) = 0;
      }
      goto LABEL_26;
    }
    if ([(TRIClient *)self compatibilityVersionWithNamespaceName:v14] == v12)
    {
      uint64_t v17 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEBUG))
      {
        int v31 = 138412290;
        id v32 = v14;
        _os_log_debug_impl(&dword_19D909000, (os_log_t)v17, OS_LOG_TYPE_DEBUG, "Namespace %@ is already registered", (uint8_t *)&v31, 0xCu);
      }
      LOBYTE(v18) = 1;
      goto LABEL_26;
    }
    if (a8)
    {
      id v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      v34 = @"Namespace is already registered with different compatibility version";
      long long v20 = (void *)MEMORY[0x1E4F1C9E8];
      long long v21 = &v34;
      long long v22 = &v33;
      goto LABEL_21;
    }
  }
  else if (a8)
  {
    id v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v36[0] = @"compatibility version must be greater than 0";
    long long v20 = (void *)MEMORY[0x1E4F1C9E8];
    long long v21 = (__CFString **)v36;
    long long v22 = &v35;
LABEL_21:
    uint64_t v17 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:1];
    [v19 errorWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v17];
    LOBYTE(v18) = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

    goto LABEL_27;
  }
  LOBYTE(v18) = 0;
LABEL_27:

  return v18;
}

- (BOOL)deregisterNamespaceName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(TRIClient *)self _lazyInit];
  id v7 = objc_opt_new();
  int v8 = [v7 deregisterNamespaceWithNamespaceName:v6 error:a4];
  if (v8) {
    [(TRIDefaultFactorProvider *)self->_defaultFactorProvider setContainer:0 forNamespaceName:v6];
  }

  return v8;
}

- (BOOL)hasDownloadedNamespaceWithName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3AD060]();
  if (_os_feature_enabled_impl()) {
    uint64_t v6 = 54;
  }
  else {
    uint64_t v6 = 22;
  }
  if ([(TRIDefaultFactorProvider *)self->_defaultFactorProvider hasTreatmentInAnyOfLayers:v6 withNamespaceName:v4])
  {
    char v7 = 1;
  }
  else
  {
    int v8 = [[TRINamespaceStatusProvider alloc] initWithPaths:self->_paths];
    uint64_t v9 = [(TRINamespaceStatusProvider *)v8 statusForNamespaceWithName:v4];
    unsigned int v10 = [(TRIClient *)self compatibilityVersionWithNamespaceName:v4];
    if (v9 && [v9 compatibilityVersion] == v10)
    {
      id v11 = [v9 lastFetchAttempt];
      if (v11) {
        char v7 = [v9 lastFetchWasSuccess];
      }
      else {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (void)downloadNamespaceWithName:(id)a3 options:(id)a4 progress:(id)a5 completion:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t, void))a6;
  [(TRIClient *)self _lazyInit];
  if ([(TRIClient *)self hasRegisteredNamespaceWithName:v10])
  {
    if ([(TRIClient *)self hasDownloadedNamespaceWithName:v10])
    {
      id v14 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v47 = v10;
        _os_log_debug_impl(&dword_19D909000, v14, OS_LOG_TYPE_DEBUG, "namespace %@ already has downloaded treatment", buf, 0xCu);
      }

      if (v13) {
        v13[2](v13, 1, 0);
      }
    }
    else
    {
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __67__TRIClient_downloadNamespaceWithName_options_progress_completion___block_invoke;
      v41[3] = &unk_1E596B8E0;
      id v20 = v10;
      id v42 = v20;
      long long v21 = v13;
      id v43 = v21;
      int v31 = (void *)MEMORY[0x19F3AD290](v41);
      long long v22 = -[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](self, "addUpdateHandlerForNamespaceName:usingBlock:", v20);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __67__TRIClient_downloadNamespaceWithName_options_progress_completion___block_invoke_252;
      v35[3] = &unk_1E596B908;
      id v23 = v20;
      id v36 = v23;
      id v39 = v12;
      uint64_t v24 = v21;
      id v40 = v24;
      v37 = self;
      id v33 = v22;
      id v38 = v33;
      v30 = (void *)MEMORY[0x19F3AD290](v35);
      id v32 = +[TRIDownloadNotification registerDownloadNotificationForKey:queue:usingBlock:](TRIDownloadNotification, "registerDownloadNotificationForKey:queue:usingBlock:", v23, 0);
      uint64_t v25 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v47 = v23;
        _os_log_debug_impl(&dword_19D909000, v25, OS_LOG_TYPE_DEBUG, "requesting treatment download for namespace %@", buf, 0xCu);
      }

      uint64_t v26 = objc_opt_new();
      id v34 = 0;
      char v27 = [v26 startNamespaceDownloadWithName:v23 options:v11 error:&v34];
      id v28 = v34;
      if ((v27 & 1) == 0)
      {
        uint64_t v29 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v47 = v23;
          _os_log_debug_impl(&dword_19D909000, v29, OS_LOG_TYPE_DEBUG, "failed to request treatment download for namespace %@", buf, 0xCu);
        }

        if (v32) {
          +[TRIDownloadNotification deregisterNotificationWithToken:](TRIDownloadNotification, "deregisterNotificationWithToken:");
        }
        [(TRIClient *)self removeUpdateHandlerForToken:v33];
        if (v24) {
          ((void (**)(id, uint64_t, id))v24)[2](v24, 0, v28);
        }
      }
    }
  }
  else
  {
    id v15 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v47 = v10;
      _os_log_debug_impl(&dword_19D909000, v15, OS_LOG_TYPE_DEBUG, "cannot download treatment because namespace %@ is not registered", buf, 0xCu);
    }

    if (v13)
    {
      unint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      uint64_t v17 = [NSString stringWithFormat:@"namespace is not registered: %@", v10];
      v45 = v17;
      int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      id v19 = [v16 errorWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v18];

      ((void (**)(id, uint64_t, void *))v13)[2](v13, 0, v19);
    }
  }
}

void __67__TRIClient_downloadNamespaceWithName_options_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_debug_impl(&dword_19D909000, v4, OS_LOG_TYPE_DEBUG, "received downloaded treatment activated notification for namespace %@", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v5 = [v3 token];

  +[TRINamespaceUpdateNotification deregisterUpdateWithToken:v5];
}

void __67__TRIClient_downloadNamespaceWithName_options_progress_completion___block_invoke_252(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  switch([v6 type])
  {
    case 0:
    case 3:
      int v7 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v14 = [v6 progress];
        uint64_t v15 = *(void *)(a1 + 32);
        int v19 = 67109378;
        *(_DWORD *)id v20 = v14;
        *(_WORD *)&v20[4] = 2112;
        *(void *)&v20[6] = v15;
        _os_log_debug_impl(&dword_19D909000, v7, OS_LOG_TYPE_DEBUG, "received download progress %u for namespace %@", (uint8_t *)&v19, 0x12u);
      }

      uint64_t v8 = *(void *)(a1 + 56);
      if (v8) {
        (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, [v6 progress]);
      }
      break;
    case 1:
      uint64_t v9 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        int v19 = 138412290;
        *(void *)id v20 = v16;
        _os_log_debug_impl(&dword_19D909000, v9, OS_LOG_TYPE_DEBUG, "received download completed notification for namespace %@", (uint8_t *)&v19, 0xCu);
      }

      uint64_t v10 = *(void *)(a1 + 56);
      if (v10) {
        (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, [v6 progressMaxValue]);
      }
      +[TRIDownloadNotification deregisterNotificationWithToken:v5];
      break;
    case 2:
      id v11 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        int v18 = [v6 error];
        int v19 = 138412546;
        *(void *)id v20 = v17;
        *(_WORD *)&v20[8] = 2112;
        *(void *)&v20[10] = v18;
        _os_log_debug_impl(&dword_19D909000, v11, OS_LOG_TYPE_DEBUG, "received download failed notification for namespace %@, error: %@", (uint8_t *)&v19, 0x16u);
      }
      uint64_t v12 = *(void *)(a1 + 64);
      if (v12)
      {
        id v13 = [v6 error];
        (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
      }
      +[TRIDownloadNotification deregisterNotificationWithToken:v5];
      [*(id *)(a1 + 40) removeUpdateHandlerForToken:*(void *)(a1 + 48)];
      break;
    default:
      break;
  }
}

- (id)sizesForFactors:(id)a3 withNamespaceName:(id)a4 forMetric:(unint64_t)a5 error:(id *)a6
{
  v92[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = v12;
  if (!v11)
  {
    v52 = [MEMORY[0x1E4F28B00] currentHandler];
    [v52 handleFailureInMethod:a2, self, @"TRIClient.m", 932, @"Invalid parameter not satisfying: %@", @"factors" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
LABEL_55:
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2, self, @"TRIClient.m", 933, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v12) {
    goto LABEL_55;
  }
LABEL_3:
  if (qword_1EB3B7A00 != -1) {
    dispatch_once(&qword_1EB3B7A00, &__block_literal_global_265);
  }
  int v14 = byte_1EB3B79E9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__TRIClient_sizesForFactors_withNamespaceName_forMetric_error___block_invoke_2;
  block[3] = &unk_1E596B950;
  id v73 = &__block_literal_global_260;
  v58 = v13;
  if (qword_1EB3B7A08 != -1) {
    dispatch_once(&qword_1EB3B7A08, block);
  }
  int v15 = byte_1EB3B79EA;

  if (!(v15 | v14))
  {
    id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v91 = *MEMORY[0x1E4F28568];
    v92[0] = @"Process is not entitled for on-demand factor download, please see logs for details.";
    id v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:&v91 count:1];
    id v43 = (void *)[v41 initWithDomain:@"TRIGeneralErrorDomain" code:3 userInfo:v42];

    uint64_t v16 = v58;
    if (a6) {
      *a6 = v43;
    }

    id v44 = 0;
    goto LABEL_50;
  }
  id v70 = 0;
  id v71 = 0;
  id v69 = 0;
  [(TRIClient *)self _lazyInit];
  uint64_t v16 = v58;
  if (!+[TRIFactorDownloadValidator validateDownloadForFactors:v11 withNamespace:v58 paths:self->_paths container:0 factorsState:self->_factorsState assetIndexesByTreatment:&v70 experimentIds:0 assetIdsByFactorPack:&v69 rolloutFactorNames:0 rolloutDeployments:0 error:&v71])
  {
    v45 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v86 = v11;
      __int16 v87 = 2112;
      v88 = v58;
      __int16 v89 = 2112;
      id v90 = v71;
      _os_log_impl(&dword_19D909000, v45, OS_LOG_TYPE_INFO, "Download not allowed for factors:%@, namespace:%@. Error: %@", buf, 0x20u);
    }

    id v44 = 0;
    if (a6) {
      *a6 = v71;
    }
    goto LABEL_49;
  }
  uint64_t v17 = objc_opt_new();
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v18 = v11;
  uint64_t v63 = [v18 countByEnumeratingWithState:&v65 objects:v84 count:16];
  if (!v63)
  {

LABEL_47:
    id v44 = v17;
    id v50 = 0;
    goto LABEL_48;
  }
  unint64_t v56 = a5;
  v57 = v17;
  v54 = a6;
  id v55 = v11;
  id v64 = 0;
  uint64_t v62 = *(void *)v66;
  uint64_t v59 = *MEMORY[0x1E4F28568];
  v60 = self;
  v61 = v18;
  do
  {
    uint64_t v19 = 0;
    do
    {
      if (*(void *)v66 != v62) {
        objc_enumerationMutation(v18);
      }
      uint64_t v20 = *(void *)(*((void *)&v65 + 1) + 8 * v19);
      uint64_t v21 = (void *)MEMORY[0x19F3AD060]();
      if (![(TRIClient *)self hasDownloadedNamespaceWithName:v16])
      {
        v46 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v82 = v59;
        id v47 = [NSString stringWithFormat:@"No active rollout or experiment found for factor %@", v20];
        v83 = v47;
        uint64_t v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
        uint64_t v49 = [v46 errorWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v48];

        id v64 = (id)v49;
        goto LABEL_44;
      }
      long long v22 = +[TRINamespaceFactorProviderChain factorProviderWithPaths:self->_paths namespaceName:v16 excludingTreatmentLayers:1];
      id v23 = [v22 levelForFactor:v20];
      uint64_t v24 = v23;
      if (v23)
      {
        uint64_t v25 = [v23 fileOrDirectoryLevelWithIsDir:0];
        if (!v25)
        {
          int v31 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v78 = v59;
          char v27 = [NSString stringWithFormat:@"Factor %@ is not file / directory typed", v20];
          v79 = v27;
          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
          uint64_t v32 = [v31 errorWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v30];

          uint64_t v26 = 0;
          int v28 = 6;
          id v64 = (id)v32;
          goto LABEL_26;
        }
        uint64_t v26 = v25;
        if (([v25 hasAsset] & 1) == 0)
        {
          id v33 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v76 = v59;
          char v27 = [NSString stringWithFormat:@"No asset metadata found for factor %@", v20];
          v77 = v27;
          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
          uint64_t v34 = [v33 errorWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v30];

LABEL_25:
          int v28 = 6;
          id v64 = (id)v34;
          uint64_t v16 = v58;
          goto LABEL_26;
        }
        char v27 = [v26 asset];
        if (([v27 hasSize] & 1) == 0)
        {
          uint64_t v35 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v74 = v59;
          v30 = [NSString stringWithFormat:@"No size found for asset of factor %@", v20];
          v75 = v30;
          id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
          uint64_t v34 = [v35 errorWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v36];

          goto LABEL_25;
        }
        if (v56)
        {
          int v28 = 0;
          goto LABEL_27;
        }
        v37 = NSNumber;
        uint64_t v38 = [v27 size];
        id v39 = v37;
        uint64_t v16 = v58;
        v30 = [v39 numberWithUnsignedLongLong:v38];
        [v57 setObject:v30 forKeyedSubscript:v20];
        int v28 = 0;
      }
      else
      {
        uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v80 = v59;
        uint64_t v26 = [NSString stringWithFormat:@"No level found for factor %@", v20];
        v81 = v26;
        char v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
        [v29 errorWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v27];
        v30 = v64;
        int v28 = 6;
        id v64 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_26:

      self = v60;
LABEL_27:

      if (v28)
      {
        id v18 = v61;
        goto LABEL_44;
      }
      ++v19;
      id v18 = v61;
    }
    while (v63 != v19);
    uint64_t v40 = [v61 countByEnumeratingWithState:&v65 objects:v84 count:16];
    uint64_t v63 = v40;
  }
  while (v40);
LABEL_44:

  id v11 = v55;
  uint64_t v17 = v57;
  id v50 = v64;
  if (!v64) {
    goto LABEL_47;
  }
  if (v54)
  {
    id v50 = v64;
    id v44 = 0;
    id *v54 = v50;
  }
  else
  {
    id v44 = 0;
  }
LABEL_48:

LABEL_49:
LABEL_50:

  return v44;
}

uint64_t __63__TRIClient_sizesForFactors_withNamespaceName_forMetric_error___block_invoke()
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v0 = +[TRIEntitlement objectForCurrentProcessEntitlement:@"com.apple.trial.client"];
  if (!v0)
  {
    v1 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = @"com.apple.trial.client";
      _os_log_error_impl(&dword_19D909000, v1, OS_LOG_TYPE_ERROR, "Process is missing entitlement required for on-demand factor download: <key>%@</key><array>    <string>...</string></array>", buf, 0xCu);
    }
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_15:
    v1 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [MEMORY[0x1E4F28F80] processInfo];
      uint64_t v9 = [v8 processName];
      uint64_t v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      uint64_t v19 = @"com.apple.trial.client";
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_error_impl(&dword_19D909000, v1, OS_LOG_TYPE_ERROR, "Process \"%@\" has incorrectly-typed entitlement \"%@\" (expected array of string, decoded %@)", buf, 0x20u);
    }
LABEL_17:
    uint64_t v6 = 0;
    goto LABEL_18;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v1 = v0;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v12 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          goto LABEL_15;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v12 objects:v22 count:16];
      uint64_t v6 = 1;
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v6 = 1;
  }
LABEL_18:

  return v6;
}

void __63__TRIClient_sizesForFactors_withNamespaceName_forMetric_error___block_invoke_263()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  v1 = (void *)MEMORY[0x1E4F93B28];
  uint64_t v2 = TRILogCategory_ClientFramework();
  byte_1EB3B79E9 = [v1 hasTrueBooleanEntitlement:@"com.apple.private.security.storage.triald" logHandle:v2];
}

void __63__TRIClient_sizesForFactors_withNamespaceName_forMetric_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x19F3AD060]();
  byte_1EB3B79EA = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)downloadLevelsForFactors:(id)a3 withNamespace:(id)a4 queue:(id)a5 options:(id)a6 progress:(id)a7 completion:(id)a8
{
  v39[1] = *MEMORY[0x1E4F143B8];
  long long v15 = (__CFString *)a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  __int16 v20 = (void (**)(id, void, id))a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    char v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"TRIClient.m", 1077, @"Invalid parameter not satisfying: %@", @"factors" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  int v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"TRIClient.m", 1078, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_3:
  if (qword_1EB3B7A10 != -1) {
    dispatch_once(&qword_1EB3B7A10, &__block_literal_global_289);
  }
  if (dword_1EB3B79EC)
  {
    id v30 = 0;
    id v31 = 0;
    id v29 = 0;
    [(TRIClient *)self _lazyInit];
    if (+[TRIFactorDownloadValidator validateDownloadForFactors:v15 withNamespace:v16 paths:self->_paths container:0 factorsState:self->_factorsState assetIndexesByTreatment:&v30 experimentIds:0 assetIdsByFactorPack:&v29 rolloutFactorNames:0 rolloutDeployments:0 error:&v31])
    {
      uint64_t v21 = objc_opt_new();
      [v21 downloadLevelsForFactors:v15 withNamespace:v16 queue:v17 factorsState:self->_factorsState options:v18 progress:v19 completion:v20];
    }
    else
    {
      uint64_t v26 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v33 = v15;
        __int16 v34 = 2112;
        id v35 = v16;
        __int16 v36 = 2112;
        id v37 = v31;
        _os_log_impl(&dword_19D909000, v26, OS_LOG_TYPE_DEFAULT, "Download not allowed for factors:%@, namespace:%@. Error: %@", buf, 0x20u);
      }

      if (v20) {
        v20[2](v20, 0, v31);
      }
    }
  }
  else
  {
    long long v22 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = @"com.apple.trial.client";
      _os_log_error_impl(&dword_19D909000, v22, OS_LOG_TYPE_ERROR, "Process is missing entitlement required for on-demand factor download: <key>%@</key><array>...</array>", buf, 0xCu);
    }

    id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v38 = *MEMORY[0x1E4F28568];
    v39[0] = @"Process is not entitled for on-demand factor download.";
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
    uint64_t v25 = (void *)[v23 initWithDomain:@"TRIGeneralErrorDomain" code:3 userInfo:v24];

    if (v20) {
      v20[2](v20, 0, v25);
    }
  }
}

void __86__TRIClient_downloadLevelsForFactors_withNamespace_queue_options_progress_completion___block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  v1 = (void *)MEMORY[0x1E4F93B28];
  uint64_t v2 = TRILogCategory_ClientFramework();
  if ([v1 hasTrueBooleanEntitlement:@"com.apple.private.security.storage.triald" logHandle:v2])
  {
    dword_1EB3B79EC = 1;
  }
  else
  {
    uint64_t v3 = +[TRIEntitlement objectForCurrentProcessEntitlement:@"com.apple.trial.client"];
    dword_1EB3B79EC = v3 != 0;
  }
}

- (void)removeLevelsForFactors:(id)a3 withNamespace:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  long long v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_10:
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"TRIClient.m", 1140, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  id v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"TRIClient.m", 1139, @"Invalid parameter not satisfying: %@", @"factors" object file lineNumber description];

  if (!v12) {
    goto LABEL_10;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_11:
  uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"TRIClient.m", 1141, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_4:
  [(TRIClient *)self _lazyInit];
  long long v15 = objc_opt_new();
  factorsState = self->_factorsState;
  id v26 = 0;
  uint64_t v17 = [v15 removeLevelsForFactors:v11 withNamespace:v12 factorsState:factorsState removeImmediately:0 error:&v26];
  id v18 = v26;
  if (v14)
  {
    if (v13)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__TRIClient_removeLevelsForFactors_withNamespace_queue_completion___block_invoke;
      block[3] = &unk_1E596B978;
      id v24 = v14;
      char v25 = v17;
      id v23 = v18;
      dispatch_async(v13, block);
    }
    else
    {
      (*((void (**)(id, uint64_t, id))v14 + 2))(v14, v17, v18);
    }
  }
}

uint64_t __67__TRIClient_removeLevelsForFactors_withNamespace_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)removeLevelsForFactorsImmediately:(id)a3 withNamespace:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  long long v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_10:
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"TRIClient.m", 1171, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  id v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"TRIClient.m", 1170, @"Invalid parameter not satisfying: %@", @"factors" object file lineNumber description];

  if (!v12) {
    goto LABEL_10;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_11:
  uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"TRIClient.m", 1172, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_4:
  [(TRIClient *)self _lazyInit];
  long long v15 = objc_opt_new();
  factorsState = self->_factorsState;
  id v26 = 0;
  uint64_t v17 = [v15 removeLevelsForFactors:v11 withNamespace:v12 factorsState:factorsState removeImmediately:1 error:&v26];
  id v18 = v26;
  if (v14)
  {
    if (v13)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78__TRIClient_removeLevelsForFactorsImmediately_withNamespace_queue_completion___block_invoke;
      block[3] = &unk_1E596B978;
      id v24 = v14;
      char v25 = v17;
      id v23 = v18;
      dispatch_async(v13, block);
    }
    else
    {
      (*((void (**)(id, uint64_t, id))v14 + 2))(v14, v17, v18);
    }
  }
}

uint64_t __78__TRIClient_removeLevelsForFactorsImmediately_withNamespace_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (BOOL)setPurgeabilityLevelsForFactors:(id)a3 withNamespaceName:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"TRIClient.m", 1199, @"Invalid parameter not satisfying: %@", @"factorsWithPurgeabilityLevels" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"TRIClient.m", 1200, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_3:
  if ([(TRIClient *)self _hasAppropriatePermissionsForNamespaceName:v9])
  {
    uint64_t v10 = objc_opt_new();
    id v17 = 0;
    char v11 = [v10 setPurgeabilityLevelsForFactors:v7 forNamespaceName:v9 error:&v17];
    id v12 = v17;
    if ((v11 & 1) == 0)
    {
      long long v13 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v19 = v9;
        __int16 v20 = 2112;
        id v21 = v12;
        _os_log_error_impl(&dword_19D909000, v13, OS_LOG_TYPE_ERROR, "Failed to save purgeability levels for namespace %@ : %@", buf, 0x16u);
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)purgeabilityLevelsForFactorsWithNamespaceName:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"TRIClient.m", 1223, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(TRIClient *)self _hasAppropriatePermissionsForNamespaceName:v5])
  {
    id v7 = objc_opt_new();
    id v19 = 0;
    id v8 = [v7 loadNamespaceMetadataForNamespaceName:v5 error:&v19];
    id v9 = v19;
    if (!v8)
    {
      uint64_t v10 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v5;
        __int16 v22 = 2112;
        id v23 = v9;
        _os_log_error_impl(&dword_19D909000, v10, OS_LOG_TYPE_ERROR, "Failed to save purgeability levels for namespace %@ : %@", buf, 0x16u);
      }
    }
    char v11 = [v8 factorNamePurgeabilityLevels];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__TRIClient_purgeabilityLevelsForFactorsWithNamespaceName___block_invoke;
    v17[3] = &unk_1E596B9A0;
    id v12 = v6;
    id v18 = v12;
    [v11 enumerateKeysAndEnumsUsingBlock:v17];

    long long v13 = v18;
    id v14 = v12;
  }
  return v6;
}

void __59__TRIClient_purgeabilityLevelsForFactorsWithNamespaceName___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithInt:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (BOOL)setFactorsProvisionalForNamespace:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"TRIClient.m", 1253, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  [(TRIClient *)self _lazyInit];
  id v8 = [(TRIDefaultFactorProvider *)self->_defaultFactorProvider promotableFactorPackIdForNamespaceName:v7];
  if (!v8)
  {
    id v11 = 0;
    char v10 = 1;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v9 = objc_opt_new();
  id v14 = 0;
  char v10 = [v9 setProvisionalFactorPackId:v8 forNamespaceName:v7 error:&v14];
  id v11 = v14;

  if (a4) {
LABEL_5:
  }
    *a4 = v11;
LABEL_6:

  return v10;
}

- (BOOL)promoteFactorsForNamespace:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIClient.m", 1273, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];
  }
  [(TRIClient *)self _lazyInit];
  id v8 = [(TRIDefaultFactorProvider *)self->_defaultFactorProvider promotableFactorPackIdForNamespaceName:v7];
  if (!v8)
  {
    id v13 = 0;
    char v14 = 1;
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v9 = [(TRIClient *)self rolloutIdentifiersWithNamespaceName:v7];
  char v10 = v9;
  if (v9)
  {
    id v11 = [v9 rolloutId];
    id v12 = +[TRIRolloutDeployment deploymentWithRolloutId:deploymentId:](TRIRolloutDeployment, "deploymentWithRolloutId:deploymentId:", v11, [v10 deploymentId]);
  }
  else
  {
    id v12 = 0;
  }
  long long v15 = objc_opt_new();
  id v18 = 0;
  char v14 = [v15 promoteFactorPackId:v8 forNamespaceName:v7 rolloutDeployment:v12 error:&v18];
  id v13 = v18;

  if (a4) {
LABEL_10:
  }
    *a4 = v13;
LABEL_11:

  return v14;
}

- (unint64_t)statusOfDownloadForFactors:(id)a3 withNamespace:(id)a4 token:(id *)a5 queue:(id)a6 progress:(id)a7 completion:(id)a8
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (a5) {
    *a5 = 0;
  }
  if (v15)
  {
    if (v16) {
      goto LABEL_5;
    }
  }
  else
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2, self, @"TRIClient.m", 1306, @"Invalid parameter not satisfying: %@", @"factors" object file lineNumber description];

    if (v16) {
      goto LABEL_5;
    }
  }
  v46 = [MEMORY[0x1E4F28B00] currentHandler];
  [v46 handleFailureInMethod:a2, self, @"TRIClient.m", 1307, @"Invalid parameter not satisfying: %@", @"namespaceName" object file lineNumber description];

LABEL_5:
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __86__TRIClient_statusOfDownloadForFactors_withNamespace_token_queue_progress_completion___block_invoke;
  v61[3] = &unk_1E596B9C8;
  id v20 = v19;
  id v63 = v20;
  id v21 = v17;
  id v62 = v21;
  __int16 v22 = (void (**)(void, void, void))MEMORY[0x19F3AD290](v61);
  if (qword_1EB3B7A18 != -1) {
    dispatch_once(&qword_1EB3B7A18, &__block_literal_global_303);
  }
  if (dword_1EB3B79F0)
  {
    id v59 = 0;
    id v60 = 0;
    id v58 = 0;
    [(TRIClient *)self _lazyInit];
    if (+[TRIFactorDownloadValidator validateDownloadForFactors:v15 withNamespace:v16 paths:self->_paths container:0 factorsState:self->_factorsState assetIndexesByTreatment:&v59 experimentIds:0 assetIdsByFactorPack:&v58 rolloutFactorNames:0 rolloutDeployments:0 error:&v60])
    {
      id v49 = v18;
      if ([v59 count] || objc_msgSend(v58, "count"))
      {
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __86__TRIClient_statusOfDownloadForFactors_withNamespace_token_queue_progress_completion___block_invoke_307;
        v51[3] = &unk_1E596A038;
        id v52 = v18;
        id v23 = v20;
        id v53 = v20;
        uint64_t v24 = (void *)MEMORY[0x19F3AD290](v51);
        *(void *)buf = 0;
        id v50 = 0;
        char v25 = objc_opt_new();
        uint64_t v26 = [v25 statusOfDownloadForFactors:v15 withNamespace:v16 factorsState:self->_factorsState notificationKey:buf error:&v50];
        unint64_t v27 = v26;
        if ((unint64_t)(v26 - 2) < 2)
        {
          if (*(void *)buf)
          {
            id v33 = +[TRIDownloadNotification registerDownloadNotificationForKey:*(void *)buf queue:v21 usingBlock:v24];
            __int16 v34 = v33;
            if (a5) {
              *a5 = v33;
            }
          }
        }
        else if (v26)
        {
          if (v26 == 1) {
            v22[2](v22, 0, 0);
          }
        }
        else
        {
          ((void (**)(void, void, id))v22)[2](v22, 0, v50);
        }

        id v18 = v49;
        id v20 = v23;
      }
      else
      {
        id v47 = v20;
        id v48 = v21;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v36 = v15;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v54 objects:v64 count:16];
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v55;
          while (2)
          {
            for (uint64_t i = 0; i != v38; ++i)
            {
              if (*(void *)v55 != v39) {
                objc_enumerationMutation(v36);
              }
              id v41 = [(TRIDefaultFactorProvider *)self->_defaultFactorProvider levelForFactor:*(void *)(*((void *)&v54 + 1) + 8 * i) withNamespaceName:v16];
              if (v41)
              {
                id v42 = v41;
                id v43 = [v41 fileOrDirectoryLevelWithIsDir:0];
                id v44 = v43;
                if (v43 && ![v43 hasAsset])
                {
                  v22[2](v22, 0, 0);

                  unint64_t v27 = 1;
                  goto LABEL_42;
                }
              }
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v54 objects:v64 count:16];
            if (v38) {
              continue;
            }
            break;
          }
        }

        v22[2](v22, 1, 0);
        unint64_t v27 = 4;
LABEL_42:
        id v21 = v48;
        id v18 = v49;
        id v20 = v47;
      }
    }
    else
    {
      uint64_t v32 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v15;
        __int16 v66 = 2112;
        id v67 = v16;
        __int16 v68 = 2112;
        id v69 = v60;
        _os_log_impl(&dword_19D909000, v32, OS_LOG_TYPE_INFO, "Download not allowed for factors:%@, namespace:%@. Error: %@", buf, 0x20u);
      }

      ((void (**)(void, void, id))v22)[2](v22, 0, v60);
      unint64_t v27 = 0;
    }
  }
  else
  {
    int v28 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"com.apple.trial.client";
      _os_log_error_impl(&dword_19D909000, v28, OS_LOG_TYPE_ERROR, "Process is missing entitlement required for on-demand factor status: <key>%@</key><array>...</array>", buf, 0xCu);
    }

    id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v70 = *MEMORY[0x1E4F28568];
    v71[0] = @"Process is not entitled for on-demand factor status.";
    id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:&v70 count:1];
    id v31 = (void *)[v29 initWithDomain:@"TRIGeneralErrorDomain" code:3 userInfo:v30];

    ((void (**)(void, void, void *))v22)[2](v22, 0, v31);
    unint64_t v27 = 0;
  }

  return v27;
}

void __86__TRIClient_statusOfDownloadForFactors_withNamespace_token_queue_progress_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void (***)(void, void, void))(a1 + 40);
  if (v6)
  {
    id v7 = *(NSObject **)(a1 + 32);
    if (v7)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __86__TRIClient_statusOfDownloadForFactors_withNamespace_token_queue_progress_completion___block_invoke_2;
      block[3] = &unk_1E596B978;
      char v10 = v6;
      char v11 = a2;
      id v9 = v5;
      dispatch_async(v7, block);
    }
    else
    {
      ((void (**)(void, uint64_t, id))v6)[2](v6, a2, v5);
    }
  }
}

uint64_t __86__TRIClient_statusOfDownloadForFactors_withNamespace_token_queue_progress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __86__TRIClient_statusOfDownloadForFactors_withNamespace_token_queue_progress_completion___block_invoke_3()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  v1 = (void *)MEMORY[0x1E4F93B28];
  uint64_t v2 = TRILogCategory_ClientFramework();
  if ([v1 hasTrueBooleanEntitlement:@"com.apple.private.security.storage.triald" logHandle:v2])
  {
    dword_1EB3B79F0 = 1;
  }
  else
  {
    uint64_t v3 = +[TRIEntitlement objectForCurrentProcessEntitlement:@"com.apple.trial.client"];
    dword_1EB3B79F0 = v3 != 0;
  }
}

void __86__TRIClient_statusOfDownloadForFactors_withNamespace_token_queue_progress_completion___block_invoke_307(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  switch([v5 type])
  {
    case 0:
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6)
      {
        v7.n128_f64[0] = (double)(unint64_t)[v5 progress] / 100.0;
        (*(void (**)(uint64_t, uint64_t, __n128))(v6 + 16))(v6, 2, v7);
      }
      break;
    case 1:
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8) {
        (*(void (**)(uint64_t, uint64_t, double))(v8 + 16))(v8, 4, 1.0);
      }
      uint64_t v9 = *(void *)(a1 + 40);
      if (v9) {
        (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, 1, 0);
      }
      goto LABEL_12;
    case 2:
      uint64_t v10 = *(void *)(a1 + 32);
      if (v10) {
        (*(void (**)(uint64_t, uint64_t, double))(v10 + 16))(v10, 1, (double)(unint64_t)[v5 progress] / 100.0);
      }
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11)
      {
        id v12 = [v5 error];
        (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
      }
LABEL_12:
      +[TRIDownloadNotification deregisterNotificationWithToken:v15];
      break;
    case 3:
      uint64_t v13 = *(void *)(a1 + 32);
      if (v13)
      {
        v14.n128_f64[0] = (double)(unint64_t)[v5 progress] / 100.0;
        (*(void (**)(uint64_t, uint64_t, __n128))(v13 + 16))(v13, 3, v14);
      }
      break;
    default:
      break;
  }
}

- (void)removeDownloadStatusHandlersWithToken:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(TRIClient *)self _lazyInit];
    +[TRIDownloadNotification deregisterNotificationWithToken:v4];
  }
}

- (id)levelForFactor:(id)a3 withNamespace:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  [(TRIClient *)self _lazyInit];
  __n128 v7 = [MEMORY[0x1E4FB05B8] namespaceNameFromId:v4];
  uint64_t v8 = [(TRIClient *)self levelForFactor:v6 withNamespaceName:v7];

  return v8;
}

- (id)factorLevelsWithNamespace:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(TRIClient *)self _lazyInit];
  id v5 = [MEMORY[0x1E4FB05B8] namespaceNameFromId:v3];
  id v6 = [(TRIClient *)self factorLevelsWithNamespaceName:v5];

  return v6;
}

- (id)addUpdateHandlerForNamespaceId:(unsigned int)a3 usingBlock:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = (void *)MEMORY[0x1E4FB05B8];
  id v7 = a4;
  uint64_t v8 = [v6 namespaceNameFromId:v4];
  uint64_t v9 = [(TRIClient *)self addUpdateHandlerForNamespaceName:v8 queue:0 usingBlock:v7];

  return v9;
}

- (id)addUpdateHandlerForNamespaceId:(unsigned int)a3 queue:(id)a4 usingBlock:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v8 = (void *)MEMORY[0x1E4FB05B8];
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [v8 namespaceNameFromId:v6];
  id v12 = [(TRIClient *)self addUpdateHandlerForNamespaceName:v11 queue:v10 usingBlock:v9];

  return v12;
}

- (id)treatmentIdWithNamespace:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(TRIClient *)self _lazyInit];
  id v5 = [MEMORY[0x1E4FB05B8] namespaceNameFromId:v3];
  uint64_t v6 = [(TRIClient *)self treatmentIdWithNamespaceName:v5];

  return v6;
}

- (id)experimentIdWithNamespace:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(TRIClient *)self _lazyInit];
  id v5 = [MEMORY[0x1E4FB05B8] namespaceNameFromId:v3];
  uint64_t v6 = [(TRIClient *)self experimentIdWithNamespaceName:v5];

  return v6;
}

- (void)downloadNamespaceWithName:(id)a3 options:(id)a4 completion:(id)a5
{
}

+ (id)activeRolloutInformation:(id *)a3
{
  uint64_t v4 = objc_opt_new();
  id v5 = [v4 activeRolloutInformation:a3];

  return v5;
}

+ (id)printedRolloutInformation:(id *)a3
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = +[TRIClient activeRolloutInformation:a3];
  uint64_t v6 = v5;
  if (v5)
  {
    if ([v5 count])
    {
      [v4 addObject:@"rollouts:"];
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v60 = v6;
      id obj = v6;
      uint64_t v63 = [obj countByEnumeratingWithState:&v83 objects:v89 count:16];
      if (!v63) {
        goto LABEL_32;
      }
      uint64_t v62 = *(void *)v84;
      while (1)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v84 != v62) {
            objc_enumerationMutation(obj);
          }
          uint64_t v65 = v7;
          uint64_t v8 = *(void **)(*((void *)&v83 + 1) + 8 * v7);
          id v9 = [v8 objectForKey:@"deploymentId"];
          id v10 = [NSString alloc];
          uint64_t v11 = [v8 objectForKey:@"rolloutId"];
          id v64 = v9;
          unsigned int v12 = [v9 intValue];
          if (v12) {
            uint64_t v13 = v12;
          }
          else {
            uint64_t v13 = 0xFFFFFFFFLL;
          }
          __n128 v14 = (void *)[v10 initWithFormat:@"    - rollout: %@.%d", v11, v13];
          [v4 addObject:v14];

          id v15 = [NSString alloc];
          id v16 = [v8 objectForKey:@"rampId"];
          id v17 = (void *)[v15 initWithFormat:@"      rampId: %@", v16];
          [v4 addObject:v17];

          id v18 = [NSString alloc];
          id v19 = [v8 objectForKey:@"status"];
          id v20 = (void *)[v18 initWithFormat:@"      status: %@", v19];
          [v4 addObject:v20];

          id v21 = [NSString alloc];
          __int16 v22 = [v8 objectForKey:@"activeFactorPackSetId"];
          id v23 = (void *)[v21 initWithFormat:@"      activeFactorPackSetid: %@", v22];
          [v4 addObject:v23];

          [v4 addObject:@"      namespaces:"];
          uint64_t v24 = [v8 objectForKey:@"namespaces"];
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          id v66 = v24;
          uint64_t v68 = [v66 countByEnumeratingWithState:&v79 objects:v88 count:16];
          if (v68)
          {
            uint64_t v67 = *(void *)v80;
            do
            {
              uint64_t v25 = 0;
              do
              {
                if (*(void *)v80 != v67) {
                  objc_enumerationMutation(v66);
                }
                uint64_t v71 = v25;
                uint64_t v26 = *(void **)(*((void *)&v79 + 1) + 8 * v25);
                context = (void *)MEMORY[0x19F3AD060]();
                id v69 = [v26 objectForKey:@"name"];
                unint64_t v27 = (void *)[[NSString alloc] initWithFormat:@"       - namespace: %@", v69];
                [v4 addObject:v27];

                id v28 = [NSString alloc];
                id v29 = [v26 objectForKey:@"ncvs"];
                id v30 = [v29 componentsJoinedByString:@", "];
                id v31 = (void *)[v28 initWithFormat:@"         NCVs: [%@]", v30];
                [v4 addObject:v31];

                id v32 = [NSString alloc];
                id v33 = [v26 objectForKey:@"factorPackId"];
                __int16 v34 = (void *)[v32 initWithFormat:@"         factorPackId: %@", v33];
                [v4 addObject:v34];

                [v4 addObject:@"         factors:"];
                id v35 = [v26 objectForKey:@"factors"];
                long long v75 = 0u;
                long long v76 = 0u;
                long long v77 = 0u;
                long long v78 = 0u;
                id v36 = v35;
                uint64_t v37 = [v36 countByEnumeratingWithState:&v75 objects:v87 count:16];
                if (v37)
                {
                  uint64_t v38 = v37;
                  uint64_t v39 = *(void *)v76;
                  do
                  {
                    for (uint64_t i = 0; i != v38; ++i)
                    {
                      if (*(void *)v76 != v39) {
                        objc_enumerationMutation(v36);
                      }
                      id v41 = *(void **)(*((void *)&v75 + 1) + 8 * i);
                      id v42 = (void *)MEMORY[0x19F3AD060]();
                      id v43 = [NSString alloc];
                      id v44 = [v41 objectForKey:@"name"];
                      v45 = (void *)[v43 initWithFormat:@"          - factor: %@", v44];
                      [v4 addObject:v45];

                      id v46 = [NSString alloc];
                      id v47 = [v41 objectForKey:@"type"];
                      id v48 = (void *)[v46 initWithFormat:@"            type: %@", v47];
                      [v4 addObject:v48];

                      LODWORD(v47) = [a1 _isFactorRecordFileType:v41];
                      id v49 = [NSString alloc];
                      if (v47)
                      {
                        id v50 = [v41 objectForKey:@"assetReference"];
                        v51 = (void *)[v49 initWithFormat:@"            assetReference: %@", v50];
                        [v4 addObject:v51];

                        id v52 = [NSString alloc];
                        id v53 = [v41 objectForKey:@"path"];
                        long long v54 = (void *)[v52 initWithFormat:@"            path: %@", v53];
                        [v4 addObject:v54];

                        [v4 addObject:@"            metadata:"];
                        long long v55 = [v41 objectForKey:@"metadata"];
                        if (!v55) {
                          goto LABEL_26;
                        }
                        v73[0] = MEMORY[0x1E4F143A8];
                        v73[1] = 3221225472;
                        v73[2] = __39__TRIClient_printedRolloutInformation___block_invoke;
                        v73[3] = &unk_1E596B1C0;
                        id v74 = v4;
                        [v55 enumerateKeysAndObjectsUsingBlock:v73];
                        long long v56 = v74;
                      }
                      else
                      {
                        long long v55 = [v41 objectForKey:@"levelValue"];
                        long long v56 = (void *)[v49 initWithFormat:@"            levelValue: %@", v55];
                        [v4 addObject:v56];
                      }

LABEL_26:
                    }
                    uint64_t v38 = [v36 countByEnumeratingWithState:&v75 objects:v87 count:16];
                  }
                  while (v38);
                }

                uint64_t v25 = v71 + 1;
              }
              while (v71 + 1 != v68);
              uint64_t v68 = [v66 countByEnumeratingWithState:&v79 objects:v88 count:16];
            }
            while (v68);
          }

          uint64_t v7 = v65 + 1;
        }
        while (v65 + 1 != v63);
        uint64_t v63 = [obj countByEnumeratingWithState:&v83 objects:v89 count:16];
        if (!v63)
        {
LABEL_32:

          id v57 = v4;
          uint64_t v6 = v60;
          goto LABEL_36;
        }
      }
    }
    uint64_t v58 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"no rollouts", 0);
  }
  else
  {
    uint64_t v58 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"unable to get rollout info", 0);
  }
  id v57 = (id)v58;
LABEL_36:

  return v57;
}

void __39__TRIClient_printedRolloutInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initWithFormat:@"              %@: %@", v7, v6];

  [v4 addObject:v8];
}

+ (id)activeExperimentInformation:(id *)a3
{
  return +[TRIAllocationStatus activeExperimentInformationWithError:a3];
}

+ (id)printedExperimentInformation:(id *)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 activeExperimentInformation:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 count])
    {
      id v5 = objc_opt_new();
      [v5 addObject:@"experiments:"];
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v48 = v4;
      id obj = v4;
      uint64_t v51 = [obj countByEnumeratingWithState:&v71 objects:v77 count:16];
      if (!v51) {
        goto LABEL_35;
      }
      uint64_t v50 = *(void *)v72;
      while (1)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v72 != v50) {
            objc_enumerationMutation(obj);
          }
          uint64_t v53 = v6;
          id v7 = *(void **)(*((void *)&v71 + 1) + 8 * v6);
          id v8 = [v7 objectForKey:@"deploymentId"];
          id v9 = [NSString alloc];
          id v10 = [v7 objectForKey:@"experiment"];
          id v52 = v8;
          unsigned int v11 = [v8 intValue];
          if (v11) {
            uint64_t v12 = v11;
          }
          else {
            uint64_t v12 = 0xFFFFFFFFLL;
          }
          uint64_t v13 = (void *)[v9 initWithFormat:@"    - experiment: %@.%d", v10, v12];
          [v5 addObject:v13];

          id v14 = [NSString alloc];
          id v15 = [v7 objectForKey:@"treatmentId"];
          id v16 = (void *)[v14 initWithFormat:@"      treatment : %@", v15];
          [v5 addObject:v16];

          [v5 addObject:@"      namespaces:"];
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          id v54 = [v7 objectForKey:@"namespaces"];
          uint64_t v56 = [v54 countByEnumeratingWithState:&v67 objects:v76 count:16];
          if (v56)
          {
            uint64_t v55 = *(void *)v68;
            do
            {
              uint64_t v17 = 0;
              do
              {
                if (*(void *)v68 != v55) {
                  objc_enumerationMutation(v54);
                }
                uint64_t v59 = v17;
                id v18 = *(void **)(*((void *)&v67 + 1) + 8 * v17);
                context = (void *)MEMORY[0x19F3AD060]();
                id v19 = [v18 objectForKey:@"compatibility"];
                id v20 = [NSString alloc];
                id v21 = [v18 objectForKey:@"name"];
                id v57 = v19;
                unsigned int v22 = [v19 intValue];
                if (v22) {
                  uint64_t v23 = v22;
                }
                else {
                  uint64_t v23 = 0xFFFFFFFFLL;
                }
                uint64_t v24 = (void *)[v20 initWithFormat:@"       - namespace: %@.%d", v21, v23];
                [v5 addObject:v24];

                [v5 addObject:@"         factors:"];
                long long v65 = 0u;
                long long v66 = 0u;
                long long v63 = 0u;
                long long v64 = 0u;
                uint64_t v25 = [v18 objectForKey:@"factors"];
                uint64_t v26 = [v25 countByEnumeratingWithState:&v63 objects:v75 count:16];
                if (v26)
                {
                  uint64_t v27 = v26;
                  uint64_t v28 = *(void *)v64;
                  do
                  {
                    for (uint64_t i = 0; i != v27; ++i)
                    {
                      if (*(void *)v64 != v28) {
                        objc_enumerationMutation(v25);
                      }
                      id v30 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                      id v31 = (void *)MEMORY[0x19F3AD060]();
                      id v32 = [NSString alloc];
                      id v33 = [v30 objectForKey:@"name"];
                      __int16 v34 = (void *)[v32 initWithFormat:@"          - factor: %@", v33];
                      [v5 addObject:v34];

                      id v35 = [NSString alloc];
                      id v36 = [v30 objectForKey:@"type"];
                      uint64_t v37 = (void *)[v35 initWithFormat:@"            type: %@", v36];
                      [v5 addObject:v37];

                      LODWORD(v37) = [a1 _isFactorRecordFileType:v30];
                      id v38 = [NSString alloc];
                      if (v37)
                      {
                        uint64_t v39 = [v30 objectForKey:@"assetReference"];
                        uint64_t v40 = (void *)[v38 initWithFormat:@"            assetReference: %@", v39];
                        [v5 addObject:v40];

                        id v41 = [NSString alloc];
                        id v42 = [v30 objectForKey:@"path"];
                        id v43 = (void *)[v41 initWithFormat:@"            path: %@", v42];
                        [v5 addObject:v43];

                        [v5 addObject:@"            metadata:"];
                        id v44 = [v30 objectForKey:@"metadata"];
                        if (!v44) {
                          goto LABEL_29;
                        }
                        v61[0] = MEMORY[0x1E4F143A8];
                        v61[1] = 3221225472;
                        v61[2] = __42__TRIClient_printedExperimentInformation___block_invoke;
                        v61[3] = &unk_1E596B1C0;
                        id v62 = v5;
                        [v44 enumerateKeysAndObjectsUsingBlock:v61];
                        v45 = v62;
                      }
                      else
                      {
                        id v44 = [v30 objectForKey:@"levelValue"];
                        v45 = (void *)[v38 initWithFormat:@"            levelValue: %@", v44];
                        [v5 addObject:v45];
                      }

LABEL_29:
                    }
                    uint64_t v27 = [v25 countByEnumeratingWithState:&v63 objects:v75 count:16];
                  }
                  while (v27);
                }

                uint64_t v17 = v59 + 1;
              }
              while (v59 + 1 != v56);
              uint64_t v56 = [v54 countByEnumeratingWithState:&v67 objects:v76 count:16];
            }
            while (v56);
          }

          uint64_t v6 = v53 + 1;
        }
        while (v53 + 1 != v51);
        uint64_t v51 = [obj countByEnumeratingWithState:&v71 objects:v77 count:16];
        if (!v51)
        {
LABEL_35:

          uint64_t v4 = v48;
          goto LABEL_39;
        }
      }
    }
    uint64_t v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"no experiments", 0);
  }
  else
  {
    uint64_t v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"unable to get experiment info", 0);
  }
  id v5 = (void *)v46;
LABEL_39:

  return v5;
}

void __42__TRIClient_printedExperimentInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initWithFormat:@"              %@: %@", v7, v6];

  [v4 addObject:v8];
}

+ (BOOL)_isFactorRecordFileType:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKey:@"assetReference"];
  if (v4)
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [v3 objectForKey:@"path"];
    if (v6)
    {
      char v5 = 1;
    }
    else
    {
      id v7 = [v3 objectForKey:@"type"];
      char v5 = [@"file" isEqual:v7];
    }
  }

  return v5;
}

+ (id)activeBMLTInformation:(id *)a3
{
  return +[TRIAllocationStatus activeBMLTInformationWithError:a3];
}

+ (id)printedBMLTInformation:(id *)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 activeBMLTInformation:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 count])
    {
      char v5 = objc_opt_new();
      [v5 addObject:@"BMLTs:"];
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id obj = v4;
      uint64_t v55 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
      if (!v55) {
        goto LABEL_34;
      }
      uint64_t v54 = *(void *)v76;
      while (1)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v76 != v54) {
            objc_enumerationMutation(obj);
          }
          uint64_t v57 = v6;
          id v7 = *(void **)(*((void *)&v75 + 1) + 8 * v6);
          id v8 = [v7 objectForKey:@"deploymentId"];
          id v9 = [NSString alloc];
          id v10 = [v7 objectForKey:@"bmltId"];
          uint64_t v56 = v8;
          unsigned int v11 = [v8 intValue];
          if (v11) {
            uint64_t v12 = v11;
          }
          else {
            uint64_t v12 = 0xFFFFFFFFLL;
          }
          uint64_t v13 = (void *)[v9 initWithFormat:@"    - bmlt: %@.%d", v10, v12];
          [v5 addObject:v13];

          id v14 = [NSString alloc];
          id v15 = [v7 objectForKey:@"status"];
          id v16 = (void *)[v14 initWithFormat:@"      status: %@", v15];
          [v5 addObject:v16];

          id v17 = [NSString alloc];
          id v18 = [v7 objectForKey:@"activeFactorPackSetId"];
          id v19 = (void *)[v17 initWithFormat:@"      activeFactorPackSetid: %@", v18];
          [v5 addObject:v19];

          [v5 addObject:@"      namespaces:"];
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v58 = [v7 objectForKey:@"namespaces"];
          uint64_t v60 = [v58 countByEnumeratingWithState:&v71 objects:v80 count:16];
          if (v60)
          {
            uint64_t v59 = *(void *)v72;
            do
            {
              uint64_t v20 = 0;
              do
              {
                if (*(void *)v72 != v59) {
                  objc_enumerationMutation(v58);
                }
                uint64_t v62 = v20;
                id v21 = *(void **)(*((void *)&v71 + 1) + 8 * v20);
                context = (void *)MEMORY[0x19F3AD060]();
                id v22 = [NSString alloc];
                uint64_t v23 = [v21 objectForKey:@"name"];
                uint64_t v24 = (void *)[v22 initWithFormat:@"       - namespace: %@", v23];
                [v5 addObject:v24];

                id v25 = [NSString alloc];
                uint64_t v26 = [v21 objectForKey:@"ncvs"];
                uint64_t v27 = [v26 componentsJoinedByString:@", "];
                uint64_t v28 = (void *)[v25 initWithFormat:@"         NCVs: [%@]", v27];
                [v5 addObject:v28];

                [v5 addObject:@"         factors:"];
                long long v69 = 0u;
                long long v70 = 0u;
                long long v67 = 0u;
                long long v68 = 0u;
                id v63 = [v21 objectForKey:@"factors"];
                uint64_t v29 = [v63 countByEnumeratingWithState:&v67 objects:v79 count:16];
                if (v29)
                {
                  uint64_t v30 = v29;
                  uint64_t v31 = *(void *)v68;
                  do
                  {
                    for (uint64_t i = 0; i != v30; ++i)
                    {
                      if (*(void *)v68 != v31) {
                        objc_enumerationMutation(v63);
                      }
                      id v33 = *(void **)(*((void *)&v67 + 1) + 8 * i);
                      __int16 v34 = (void *)MEMORY[0x19F3AD060]();
                      id v35 = [NSString alloc];
                      id v36 = [v33 objectForKey:@"name"];
                      uint64_t v37 = (void *)[v35 initWithFormat:@"          - factor: %@", v36];
                      [v5 addObject:v37];

                      id v38 = [NSString alloc];
                      uint64_t v39 = [v33 objectForKey:@"type"];
                      uint64_t v40 = (void *)[v38 initWithFormat:@"            type: %@", v39];
                      [v5 addObject:v40];

                      if (![a1 _isFactorRecordFileType:v33])
                      {
                        id v49 = [v33 objectForKey:@"name"];

                        if (!v49) {
                          goto LABEL_28;
                        }
                        id v50 = [NSString alloc];
                        id v47 = [v33 objectForKey:@"levelValue"];
                        id v48 = (void *)[v50 initWithFormat:@"            levelValue: %@", v47];
                        [v5 addObject:v48];
                        goto LABEL_26;
                      }
                      id v41 = [NSString alloc];
                      id v42 = [v33 objectForKey:@"assetReference"];
                      id v43 = (void *)[v41 initWithFormat:@"            assetReference: %@", v42];
                      [v5 addObject:v43];

                      id v44 = [NSString alloc];
                      v45 = [v33 objectForKey:@"path"];
                      uint64_t v46 = (void *)[v44 initWithFormat:@"            path: %@", v45];
                      [v5 addObject:v46];

                      [v5 addObject:@"            metadata:"];
                      id v47 = [v33 objectForKey:@"metadata"];
                      if (v47)
                      {
                        v65[0] = MEMORY[0x1E4F143A8];
                        v65[1] = 3221225472;
                        v65[2] = __36__TRIClient_printedBMLTInformation___block_invoke;
                        v65[3] = &unk_1E596B1C0;
                        id v66 = v5;
                        [v47 enumerateKeysAndObjectsUsingBlock:v65];
                        id v48 = v66;
LABEL_26:
                      }
LABEL_28:
                    }
                    uint64_t v30 = [v63 countByEnumeratingWithState:&v67 objects:v79 count:16];
                  }
                  while (v30);
                }

                uint64_t v20 = v62 + 1;
              }
              while (v62 + 1 != v60);
              uint64_t v60 = [v58 countByEnumeratingWithState:&v71 objects:v80 count:16];
            }
            while (v60);
          }

          uint64_t v6 = v57 + 1;
        }
        while (v57 + 1 != v55);
        uint64_t v55 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
        if (!v55)
        {
LABEL_34:

          goto LABEL_38;
        }
      }
    }
    uint64_t v51 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"no BMLTs", 0);
  }
  else
  {
    uint64_t v51 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"unable to get BMLT info", 0);
  }
  char v5 = (void *)v51;
LABEL_38:

  return v5;
}

void __36__TRIClient_printedBMLTInformation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  char v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initWithFormat:@"              %@: %@", v7, v6];

  [v4 addObject:v8];
}

+ (id)printedNCVInformation
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v2 addObject:@"NCVs:"];
  id v3 = +[TRIStandardPaths sharedSystemPaths];
  uint64_t v4 = [v3 namespaceDescriptorsDefaultDir];
  char v5 = +[TRINamespaceDescriptor descriptorsForDirectory:v4 filterBlock:0];

  id v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_463];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        unsigned int v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x19F3AD060]();
        id v13 = [NSString alloc];
        id v14 = [v11 namespaceName];
        id v15 = (void *)[v13 initWithFormat:@"    - %@", v14];
        [v2 addObject:v15];

        id v16 = objc_msgSend([NSString alloc], "initWithFormat:", @"       downloadNCV: %u", objc_msgSend(v11, "downloadNCV"));
        [v2 addObject:v16];

        id v17 = [v11 upgradeNCVs];

        if (v17)
        {
          id v18 = [NSString alloc];
          id v19 = [v11 upgradeNCVs];
          uint64_t v20 = [v19 allObjects];
          id v21 = [v20 componentsJoinedByString:@", "];
          id v22 = (void *)[v18 initWithFormat:@"       upgradeNCVs: [%@]", v21];
          [v2 addObject:v22];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  return v2;
}

uint64_t __34__TRIClient_printedNCVInformation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  char v5 = [a2 namespaceName];
  id v6 = [v4 namespaceName];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (id)printedOnDemandReferenceCountsPerUserInformationWithError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v5 = objc_opt_new();
  id v6 = +[TRIStandardPaths sharedSystemPaths];
  uint64_t v7 = [v6 treatmentsDirUsingGlobal:1];
  uint64_t v8 = [v5 getOnDemandReferenceCountsPerUserAtGlobalPath:v7 error:a3];

  if (*a3)
  {
    uint64_t v9 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v14 = [*a3 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v18 = v14;
      _os_log_error_impl(&dword_19D909000, v9, OS_LOG_TYPE_ERROR, "Could not get the on-demand references: %@", buf, 0xCu);
    }
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"unable to get on-demand reference counts per user", 0);
    goto LABEL_5;
  }
  if (![v8 count])
  {
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"no on-demand references", 0);
LABEL_5:
    id v11 = (id)v10;
    goto LABEL_8;
  }
  [v4 addObject:@"on-demand reference per user:"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__TRIClient_printedOnDemandReferenceCountsPerUserInformationWithError___block_invoke;
  v15[3] = &unk_1E596BA38;
  id v12 = v4;
  id v16 = v12;
  [v8 enumerateKeysAndObjectsUsingBlock:v15];
  id v11 = v12;

LABEL_8:
  return v11;
}

void __71__TRIClient_printedOnDemandReferenceCountsPerUserInformationWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  char v5 = *(void **)(a1 + 32);
  id v6 = (objc_class *)NSString;
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = (void *)[[v6 alloc] initWithFormat:@"    - %@", v8];

  [v5 addObject:v9];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__TRIClient_printedOnDemandReferenceCountsPerUserInformationWithError___block_invoke_2;
  v10[3] = &unk_1E596BA38;
  id v11 = *(id *)(a1 + 32);
  [v7 enumerateKeysAndObjectsUsingBlock:v10];
}

void __71__TRIClient_printedOnDemandReferenceCountsPerUserInformationWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = (objc_class *)NSString;
  id v8 = a2;
  uint64_t v9 = (void *)[[v7 alloc] initWithFormat:@"       factorPackId: %@", v8];

  [v6 addObject:v9];
  if ([v5 count])
  {
    [*(id *)(a1 + 32) addObject:@"       factors:"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__TRIClient_printedOnDemandReferenceCountsPerUserInformationWithError___block_invoke_3;
    v10[3] = &unk_1E596BA10;
    id v11 = *(id *)(a1 + 32);
    [v5 enumerateKeysAndObjectsUsingBlock:v10];
  }
}

void __71__TRIClient_printedOnDemandReferenceCountsPerUserInformationWithError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 alloc];
  id v10 = [v6 componentsJoinedByString:@", "];

  uint64_t v9 = (void *)[v8 initWithFormat:@"       - %@: [%@]", v7, v10];
  [v4 addObject:v9];
}

+ (id)sysdiagnoseInfoWithError:(id *)a3
{
  id v4 = [a1 printedNCVInformation];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = +[TRIClient printedRolloutInformation:a3];
  if (v6) {
    [v5 addObjectsFromArray:v6];
  }
  id v7 = +[TRIClient printedExperimentInformation:a3];
  if (v7) {
    [v5 addObjectsFromArray:v7];
  }
  id v8 = +[TRIClient printedBMLTInformation:a3];
  if (v8) {
    [v5 addObjectsFromArray:v8];
  }
  +[TRIClient logSystemCovariates];
  +[TRIClient printCurrentSettings];
  uint64_t v9 = [v5 componentsJoinedByString:@"\n"];

  return v9;
}

+ (id)_sysdiagnoseLogProviders
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  id v2 = [[TRIBlockBasedSysdiagnoseInfoProvider alloc] initWithOutputFilename:@"trial-namespace-compatibility-versions.log" block:&__block_literal_global_502];
  v13[0] = v2;
  id v3 = objc_opt_new();
  v13[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = [[TRIBlockBasedSysdiagnoseInfoProvider alloc] initWithOutputFilename:@"trial-rollout-info.log" block:&__block_literal_global_508];
  id v7 = [[TRIBlockBasedSysdiagnoseInfoProvider alloc] initWithOutputFilename:@"trial-experiment-info.log", &__block_literal_global_513, v6 block];
  v12[1] = v7;
  id v8 = +[TRIExperimentHistorySysdiagnoseProvider defaultProvider];
  v12[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];

  [v5 addObjectsFromArray:v9];
  id v10 = (void *)[v5 copy];

  return v10;
}

id __37__TRIClient__sysdiagnoseLogProviders__block_invoke()
{
  return +[TRIClient printedNCVInformation];
}

id __37__TRIClient__sysdiagnoseLogProviders__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[TRIClient printedRolloutInformation:a2];
}

id __37__TRIClient__sysdiagnoseLogProviders__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[TRIClient printedExperimentInformation:a2];
}

+ (BOOL)sysdiagnoseInfoToDir:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 _sysdiagnoseLogProviders];
  id v8 = [[TRISysdiagnoseLogWriter alloc] initWithDirectory:v6];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        id v15 = (void *)MEMORY[0x19F3AD060]();
        id v20 = 0;
        BOOL v16 = [(TRISysdiagnoseLogWriter *)v8 writeSysdiagnoseInfoForProvider:v14 error:&v20];
        id v17 = v20;
        if (!v16)
        {
          if (a4) {
            *a4 = v17;
          }

          BOOL v18 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  +[TRIClient logSystemCovariates];
  +[TRIClient printCurrentSettings];
  BOOL v18 = 1;
LABEL_13:

  return v18;
}

+ (void)printCurrentSettings
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = +[TRISystemConfiguration sharedInstance];
  uint64_t v3 = [v2 populationType];

  id v4 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = off_1E596BA78[(int)v3];
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v5;
    _os_log_impl(&dword_19D909000, v4, OS_LOG_TYPE_DEFAULT, "Current population is %@", buf, 0xCu);
  }
  int64_t v6 = +[TRICEnvironmentManager currentEnv];
  id v7 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = +[TRICEnvironmentManager envToString:v6];
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_19D909000, v7, OS_LOG_TYPE_DEFAULT, "Current CloudKit environment is %@", buf, 0xCu);
  }
}

- (BOOL)evaluateBMLTTargetingExpression:(id)a3 withParameters:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 nsexpressionLanguage];
  if ([v9 hasAssignmentExpression])
  {
    uint64_t v10 = [v7 nsexpressionLanguage];
    uint64_t v11 = [v10 assignmentExpression];
    uint64_t v12 = [v11 length];

    if (v12)
    {
      id v13 = [v7 nsexpressionLanguage];
      uint64_t v14 = [v13 assignmentExpression];

      id v15 = (void *)MEMORY[0x19F3AD060]();
      BOOL v16 = [MEMORY[0x1E4F28C68] expressionWithFormat:v14];
      id v17 = (void *)MEMORY[0x19F3AD060]();
      BOOL v18 = [v16 expressionValueWithObject:v8 context:0];
      uint64_t v19 = [v18 isEqualToString:@"enroll"];
      if (v19)
      {
        id v20 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v25 = v14;
          long long v21 = "successfully parsed BMLT assignment string %@ to ENROLL";
LABEL_13:
          _os_log_impl(&dword_19D909000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
        }
      }
      else
      {
        if (![v18 isEqualToString:@"ignore"])
        {
LABEL_15:

          [(TRIClient *)self _logBMLTCustomTargetingWithResult:v19];
          goto LABEL_16;
        }
        id v20 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v25 = v14;
          long long v21 = "successfully parsed BMLT assignment string %@ to IGNORE";
          goto LABEL_13;
        }
      }

      goto LABEL_15;
    }
  }
  else
  {
  }
  long long v22 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D909000, v22, OS_LOG_TYPE_DEFAULT, "assignment string is missing or empty", buf, 2u);
  }

  [(TRIClient *)self _logBMLTCustomTargetingWithResult:0];
  LOBYTE(v19) = 0;
LABEL_16:

  return v19;
}

- (void)_logBMLTCustomTargetingWithResult:(BOOL)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (self->_logger)
  {
    id v4 = [MEMORY[0x1E4FB05A8] metricWithName:@"bmlt_custom_targeting" integerValue:a3];
    id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v10[0] = v4;
    int64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v7 = (void *)[v5 initWithArray:v6];

    logger = self->_logger;
    id v9 = [(TRIClient *)self trackingId];
    [(TRILogger *)logger logWithTrackingId:v9 metrics:v7 dimensions:0 trialSystemTelemetry:0];
  }
}

+ (void)logSystemCovariates
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = 0;
  id v2 = objc_opt_new();
  [v2 logSystemCovariatesWithError:&v4];
  if (v4)
  {
    uint64_t v3 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v6 = v4;
      _os_log_impl(&dword_19D909000, v3, OS_LOG_TYPE_DEFAULT, "Could not log covariates -- %@", buf, 0xCu);
    }
  }
}

+ (id)getSandboxExtensionTokensForIdentifierQueryWithError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (+[TRIProcessInfo hostingProcessIsCoreAnalytics])
  {
    id v4 = objc_opt_new();
    id v5 = [v4 getSandboxExtensionTokensForIdentifierQueryWithError:a3];
  }
  else
  {
    id v6 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = @"Process is not allowlisted to access getSandboxExtensionTokensForIdentifierQueryWithError, please contact Trial team to request access if necessary.";
      _os_log_error_impl(&dword_19D909000, v6, OS_LOG_TYPE_ERROR, "Error generating sandbox tokens: %@", buf, 0xCu);
    }

    if (a3)
    {
      id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v10 = *MEMORY[0x1E4F28568];
      uint64_t v11 = @"Process is not allowlisted to access getSandboxExtensionTokensForIdentifierQueryWithError, please contact Trial team to request access if necessary.";
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      *a3 = (id)[v7 initWithDomain:@"TRIGeneralErrorDomain" code:16 userInfo:v8];
    }
    id v5 = objc_opt_new();
  }
  return v5;
}

- (TRILogger)logger
{
  return self->_logger;
}

@end