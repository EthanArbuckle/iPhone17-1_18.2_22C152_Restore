@interface SSTrialManager
+ (BOOL)didAllNamespacesLoadForClient:(id)a3;
+ (BOOL)isValidNamespace:(unsigned int)a3 forClient:(id)a4;
+ (id)currentTrialManagerForClient:(id)a3;
+ (id)getTTRLogsForClient:(id)a3;
+ (id)resolveMultipleSpotlightExperiments;
+ (id)sharedSpotlightKnowledgeTrialClient;
+ (id)sharedSpotlightKnowledgeTrialManager;
+ (id)sharedSpotlightMailTrialManager;
+ (id)sharedSpotlightModelTrialManager;
+ (id)sharedSpotlightPolicyTrialManager;
+ (id)sharedSpotlightRankingTrialManager;
+ (id)sharedSpotlightTrialClient;
+ (id)sharedSpotlightUITrialManager;
+ (void)resolveMultipleSpotlightExperiments;
+ (void)setTrialOverridePath;
+ (void)setTrialUpdateHandler:(id)a3;
- (BOOL)hasActiveExperiment;
- (BOOL)hasActiveRollout;
- (BOOL)hasOverride;
- (BOOL)wasLoadedSinceLaunch;
- (NSString)client;
- (NSString)experimentId;
- (NSString)namespaceId;
- (NSString)rolloutId;
- (NSString)treatmentId;
- (SSTrialManager)initWithNameSpace:(unsigned int)a3 forClient:(id)a4;
- (id)description;
- (id)getFactorDictionary;
- (id)getLevelForFactor:(id)a3;
- (int)experimentDeploymentId;
- (int)rolloutDeploymentId;
- (void)loadWithUpdateHandler:(id)a3;
- (void)refreshTrackingId;
- (void)setWasLoadedSinceLaunch:(BOOL)a3;
@end

@implementation SSTrialManager

+ (void)setTrialUpdateHandler:(id)a3
{
  sTrialUpdateHandler_0 = MEMORY[0x2611D4BE0](a3, a2);
  MEMORY[0x270F9A758]();
}

+ (void)setTrialOverridePath
{
  if (setTrialOverridePath_onceToken != -1) {
    dispatch_once(&setTrialOverridePath_onceToken, &__block_literal_global_1);
  }
}

void __38__SSTrialManager_setTrialOverridePath__block_invoke()
{
  v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v6 = [v0 stringForKey:@"com.apple.triald.namespacedescriptor.path"];

  v1 = NSString;
  if (v6)
  {
    uint64_t v2 = [NSString stringWithFormat:@"%@/devOverride/", v6];
    v3 = (void *)sTrialOverrideDirectoryPath;
    sTrialOverrideDirectoryPath = v2;
  }
  else
  {
    v3 = NSHomeDirectory();
    uint64_t v4 = [v1 stringWithFormat:@"%@/Library/Trial/NamespaceDescriptors/devOverride/", v3];
    v5 = (void *)sTrialOverrideDirectoryPath;
    sTrialOverrideDirectoryPath = v4;
  }
}

+ (id)sharedSpotlightTrialClient
{
  if (sharedSpotlightTrialClient_onceToken != -1) {
    dispatch_once(&sharedSpotlightTrialClient_onceToken, &__block_literal_global_25);
  }
  uint64_t v2 = (void *)sharedSpotlightTrialClient_trialClient;
  return v2;
}

uint64_t __44__SSTrialManager_sharedSpotlightTrialClient__block_invoke()
{
  uint64_t result = trialFlagsForProcess();
  if ((result & 5) != 0)
  {
    sharedSpotlightTrialClient_trialClient = [MEMORY[0x263F80E18] clientWithIdentifier:232];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

+ (id)sharedSpotlightKnowledgeTrialClient
{
  if (sharedSpotlightKnowledgeTrialClient_onceToken != -1) {
    dispatch_once(&sharedSpotlightKnowledgeTrialClient_onceToken, &__block_literal_global_28);
  }
  uint64_t v2 = (void *)sharedSpotlightKnowledgeTrialClient_trialClient;
  return v2;
}

uint64_t __53__SSTrialManager_sharedSpotlightKnowledgeTrialClient__block_invoke()
{
  uint64_t result = trialFlagsForProcess();
  if ((result & 2) != 0)
  {
    sharedSpotlightKnowledgeTrialClient_trialClient = [MEMORY[0x263F80E18] clientWithIdentifier:268];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

+ (BOOL)isValidNamespace:(unsigned int)a3 forClient:(id)a4
{
  id v5 = a4;
  if ([v5 isEqualToString:@"Spotlight"])
  {
    BOOL v6 = (a3 & 0xFFFFFFFC) == 332;
    goto LABEL_5;
  }
  if ([v5 isEqualToString:@"SpotlightKnowledge"])
  {
    BOOL v6 = a3 == 336;
LABEL_5:
    BOOL v7 = v6;
    goto LABEL_11;
  }
  char v8 = [v5 isEqualToString:@"Mail"];
  if (a3 == 337) {
    BOOL v7 = v8;
  }
  else {
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (SSTrialManager)initWithNameSpace:(unsigned int)a3 forClient:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = a4;
  if (+[SSTrialManager isValidNamespace:v5 forClient:v7])
  {
    int v8 = [v7 isEqualToString:@"Spotlight"];
    char v9 = [v7 isEqualToString:@"SpotlightKnowledge"];
    int v10 = [v7 isEqualToString:@"Mail"];
    if ((v8 & 1) != 0 || (v9 & 1) != 0 || v10)
    {
      v49.receiver = self;
      v49.super_class = (Class)SSTrialManager;
      self = [(SSTrialManager *)&v49 init];
      if (self)
      {
        if (v9) {
          +[SSTrialManager sharedSpotlightKnowledgeTrialClient];
        }
        else {
        v13 = +[SSTrialManager sharedSpotlightTrialClient];
        }
        trialClient = self->_trialClient;
        self->_trialClient = v13;

        if (!self->_trialClient)
        {
          v34 = SRLogCategoryGeneral();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            -[SSTrialManager initWithNameSpace:forClient:]((uint64_t)v7, v34);
          }

          goto LABEL_5;
        }
        objc_storeStrong((id *)&self->_client, a4);
        objc_msgSend(NSString, "stringWithFormat:", @"%d", v5);
        v15 = (NSString *)objc_claimAutoreleasedReturnValue();
        namespaceId = self->_namespaceId;
        self->_namespaceId = v15;

        v17 = [MEMORY[0x263F80EA8] namespaceNameFromId:v5];
        namespaceName = self->_namespaceName;
        self->_namespaceName = v17;

        self->_wasLoadedSinceLaunch = 0;
        os_unfair_lock_lock((os_unfair_lock_t)&sTrialLock);
        v19 = (void *)sTrialManagerInstances;
        if (!sTrialManagerInstances)
        {
          uint64_t v20 = [MEMORY[0x263EFF9A0] dictionary];
          v21 = (void *)sTrialManagerInstances;
          sTrialManagerInstances = v20;

          v19 = (void *)sTrialManagerInstances;
        }
        v22 = [v19 objectForKeyedSubscript:v7];

        if (!v22)
        {
          v23 = [MEMORY[0x263EFF980] array];
          [(id)sTrialManagerInstances setObject:v23 forKeyedSubscript:v7];
        }
        v24 = [(id)sTrialManagerInstances objectForKeyedSubscript:v7];
        [v24 addObject:self];

        os_unfair_lock_unlock((os_unfair_lock_t)&sTrialLock);
        v25 = [(TRIClient *)self->_trialClient experimentIdentifiersWithNamespaceName:self->_namespaceName];
        v26 = v25;
        if (v25)
        {
          self->_hasActiveExperiment = 1;
          v27 = [v25 experimentId];
          experimentId = self->_experimentId;
          self->_experimentId = v27;

          v29 = [v26 treatmentId];
          treatmentId = self->_treatmentId;
          self->_treatmentId = v29;

          self->_experimentDeploymentId = [v26 deploymentId];
          if (v8)
          {
            os_unfair_lock_lock((os_unfair_lock_t)&sTrialLock);
            v31 = (void *)sCurrentActiveTrialManagers;
            if (!sCurrentActiveTrialManagers)
            {
              uint64_t v32 = [MEMORY[0x263EFF9A0] dictionary];
              v33 = (void *)sCurrentActiveTrialManagers;
              sCurrentActiveTrialManagers = v32;

              v31 = (void *)sCurrentActiveTrialManagers;
            }
            [v31 setObject:self forKey:self->_namespaceId];
            os_unfair_lock_unlock((os_unfair_lock_t)&sTrialLock);
          }
        }
        else
        {
          self->_hasActiveExperiment = 0;
          v35 = self->_experimentId;
          self->_experimentId = 0;

          v36 = self->_treatmentId;
          self->_treatmentId = 0;

          self->_experimentDeploymentId = -1;
        }
        v37 = [(TRIClient *)self->_trialClient rolloutIdentifiersWithNamespaceName:self->_namespaceName];
        v38 = v37;
        if (v37)
        {
          self->_hasRollout = 1;
          v39 = [v37 rolloutId];
          rolloutId = self->_rolloutId;
          self->_rolloutId = v39;

          int v41 = [v38 deploymentId];
        }
        else
        {
          self->_hasRollout = 0;
          v42 = self->_rolloutId;
          self->_rolloutId = 0;

          int v41 = -1;
        }
        self->_rolloutDeploymentId = v41;
        id location = 0;
        objc_initWeak(&location, self);
        v43 = self->_trialClient;
        v44 = self->_namespaceName;
        v46[0] = MEMORY[0x263EF8330];
        v46[1] = 3221225472;
        v46[2] = __46__SSTrialManager_initWithNameSpace_forClient___block_invoke;
        v46[3] = &unk_2655233A8;
        objc_copyWeak(&v47, &location);
        id v45 = (id)[(TRIClient *)v43 addUpdateHandlerForNamespaceName:v44 usingBlock:v46];
        objc_destroyWeak(&v47);
        objc_destroyWeak(&location);
      }
      self = self;
      v11 = self;
      goto LABEL_6;
    }
  }
LABEL_5:
  v11 = 0;
LABEL_6:

  return v11;
}

void __46__SSTrialManager_initWithNameSpace_forClient___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!sTrialUpdateHandler_0)
  {
    uint64_t v2 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __46__SSTrialManager_initWithNameSpace_forClient___block_invoke_cold_1(WeakRetained, v2);
    }
  }
  objc_msgSend(WeakRetained, "loadWithUpdateHandler:");
}

+ (id)sharedSpotlightModelTrialManager
{
  if (sharedSpotlightModelTrialManager_onceToken != -1) {
    dispatch_once(&sharedSpotlightModelTrialManager_onceToken, &__block_literal_global_47);
  }
  uint64_t v2 = (void *)sharedSpotlightModelTrialManager_trialModelManager;
  return v2;
}

uint64_t __50__SSTrialManager_sharedSpotlightModelTrialManager__block_invoke()
{
  uint64_t result = trialFlagsForProcess();
  if (result)
  {
    sharedSpotlightModelTrialManager_trialModelManager = [[SSTrialManager alloc] initWithNameSpace:332 forClient:@"Spotlight"];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

+ (id)sharedSpotlightUITrialManager
{
  if (sharedSpotlightUITrialManager_onceToken != -1) {
    dispatch_once(&sharedSpotlightUITrialManager_onceToken, &__block_literal_global_49);
  }
  uint64_t v2 = (void *)sharedSpotlightUITrialManager_trialUIManager;
  return v2;
}

uint64_t __47__SSTrialManager_sharedSpotlightUITrialManager__block_invoke()
{
  uint64_t result = trialFlagsForProcess();
  if (result)
  {
    sharedSpotlightUITrialManager_trialUIManager = [[SSTrialManager alloc] initWithNameSpace:333 forClient:@"Spotlight"];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

+ (id)sharedSpotlightRankingTrialManager
{
  if (sharedSpotlightRankingTrialManager_onceToken != -1) {
    dispatch_once(&sharedSpotlightRankingTrialManager_onceToken, &__block_literal_global_51);
  }
  uint64_t v2 = (void *)sharedSpotlightRankingTrialManager_trialRankingManager;
  return v2;
}

uint64_t __52__SSTrialManager_sharedSpotlightRankingTrialManager__block_invoke()
{
  uint64_t result = trialFlagsForProcess();
  if (result)
  {
    sharedSpotlightRankingTrialManager_trialRankingManager = [[SSTrialManager alloc] initWithNameSpace:334 forClient:@"Spotlight"];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

+ (id)sharedSpotlightPolicyTrialManager
{
  if (sharedSpotlightPolicyTrialManager_onceToken != -1) {
    dispatch_once(&sharedSpotlightPolicyTrialManager_onceToken, &__block_literal_global_53);
  }
  uint64_t v2 = (void *)sharedSpotlightPolicyTrialManager_trialPolicyManager;
  return v2;
}

uint64_t __51__SSTrialManager_sharedSpotlightPolicyTrialManager__block_invoke()
{
  uint64_t result = trialFlagsForProcess();
  if (result)
  {
    sharedSpotlightPolicyTrialManager_trialPolicyManager = [[SSTrialManager alloc] initWithNameSpace:335 forClient:@"Spotlight"];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

+ (id)sharedSpotlightKnowledgeTrialManager
{
  if (sharedSpotlightKnowledgeTrialManager_onceToken != -1) {
    dispatch_once(&sharedSpotlightKnowledgeTrialManager_onceToken, &__block_literal_global_55);
  }
  uint64_t v2 = (void *)sharedSpotlightKnowledgeTrialManager_trialKnowledgeManager;
  return v2;
}

uint64_t __54__SSTrialManager_sharedSpotlightKnowledgeTrialManager__block_invoke()
{
  uint64_t result = trialFlagsForProcess();
  if ((result & 2) != 0)
  {
    sharedSpotlightKnowledgeTrialManager_trialKnowledgeManager = [[SSTrialManager alloc] initWithNameSpace:336 forClient:@"SpotlightKnowledge"];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

+ (id)sharedSpotlightMailTrialManager
{
  if (sharedSpotlightMailTrialManager_onceToken != -1) {
    dispatch_once(&sharedSpotlightMailTrialManager_onceToken, &__block_literal_global_57);
  }
  uint64_t v2 = (void *)sharedSpotlightMailTrialManager_trialMailManager;
  return v2;
}

uint64_t __49__SSTrialManager_sharedSpotlightMailTrialManager__block_invoke()
{
  uint64_t result = trialFlagsForProcess();
  if ((result & 4) != 0)
  {
    sharedSpotlightMailTrialManager_trialMailManager = [[SSTrialManager alloc] initWithNameSpace:337 forClient:@"Mail"];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

+ (id)currentTrialManagerForClient:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Spotlight"])
  {
    uint64_t v4 = +[SSTrialManager resolveMultipleSpotlightExperiments];
  }
  else if ([v3 isEqualToString:@"Mail"])
  {
    uint64_t v4 = +[SSTrialManager sharedSpotlightMailTrialManager];
  }
  else
  {
    if (![v3 isEqualToString:@"SpotlightKnowledge"])
    {
      id v7 = SRLogCategoryGeneral();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[SSTrialManager currentTrialManagerForClient:](v7);
      }

      uint64_t v5 = 0;
      goto LABEL_14;
    }
    uint64_t v4 = +[SSTrialManager sharedSpotlightKnowledgeTrialManager];
  }
  uint64_t v5 = v4;
  if (!v4)
  {
LABEL_14:
    BOOL v6 = 0;
    goto LABEL_15;
  }
  if ([v4 hasActiveExperiment]) {
    BOOL v6 = v5;
  }
  else {
    BOOL v6 = 0;
  }
LABEL_15:
  id v8 = v6;

  return v8;
}

- (void)refreshTrackingId
{
}

- (BOOL)hasActiveExperiment
{
  return self->_hasActiveExperiment;
}

- (BOOL)hasActiveRollout
{
  return self->_hasRollout;
}

- (BOOL)hasOverride
{
  return self->_hasOverride;
}

- (id)getFactorDictionary
{
  pthread_rwlock_wrlock(&sTrialCacheLock);
  id v3 = (void *)[(NSDictionary *)self->_cachedValuesForFactor copy];
  pthread_rwlock_unlock(&sTrialCacheLock);
  return v3;
}

- (id)description
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:5];
  uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"client=%@", self->_client];
  [v3 addObject:v4];

  uint64_t v5 = (void *)[[NSString alloc] initWithFormat:@"namespace=%@", self->_namespaceId];
  [v3 addObject:v5];

  BOOL v6 = (void *)[[NSString alloc] initWithFormat:@"experiment id=%@", self->_experimentId];
  [v3 addObject:v6];

  id v7 = (void *)[[NSString alloc] initWithFormat:@"treatment id=%@", self->_treatmentId];
  [v3 addObject:v7];

  id v8 = (void *)[[NSString alloc] initWithFormat:@"rollout id=%@", self->_rolloutId];
  [v3 addObject:v8];

  id v9 = [NSString alloc];
  int v10 = [(SSTrialManager *)self getFactorDictionary];
  v11 = (void *)[v9 initWithFormat:@"factor dictionary=%@", v10];
  [v3 addObject:v11];

  id v12 = [NSString alloc];
  uint64_t v13 = objc_opt_class();
  v14 = [v3 componentsJoinedByString:@", "];
  v15 = (void *)[v12 initWithFormat:@"<%@:%p; %@>", v13, self, v14];

  return v15;
}

+ (id)getTTRLogsForClient:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&sTrialLock);
  if (sTrialManagerInstances)
  {
    uint64_t v4 = [(id)sTrialManagerInstances objectForKeyedSubscript:v3];

    if (v4)
    {
      uint64_t v5 = [(id)sTrialManagerInstances objectForKeyedSubscript:v3];
      uint64_t v4 = (void *)[v5 copy];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sTrialLock);
  if ([v4 count])
  {
    BOOL v6 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"\nTrial A/B info:\n"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) description];
          [v6 appendFormat:@"%@\n", v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)getLevelForFactor:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 isEqualToString:@"codepathIDs"])
  {
    uint64_t v5 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SSTrialManager getLevelForFactor:]();
    }
  }
  if (self->_hasActiveExperiment || self->_hasRollout || self->_hasOverride)
  {
    pthread_rwlock_rdlock(&sTrialCacheLock);
    BOOL v6 = [(NSDictionary *)self->_cachedValuesForFactor objectForKey:v4];
    pthread_rwlock_unlock(&sTrialCacheLock);
    if (v6) {
      goto LABEL_13;
    }
    id v7 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_25E378000, v7, OS_LOG_TYPE_INFO, "Invalid factor name input: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  BOOL v6 = 0;
LABEL_13:

  return v6;
}

- (void)loadWithUpdateHandler:(id)a3
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, NSString *, SSTrialManager *))a3;
  [(TRIClient *)self->_trialClient refresh];
  uint64_t v5 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SSTrialManager loadWithUpdateHandler:]();
  }

  BOOL v6 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SSTrialManager loadWithUpdateHandler:]((uint64_t)self, v6);
  }

  id v7 = [(TRIClient *)self->_trialClient experimentIdentifiersWithNamespaceName:self->_namespaceName];
  v60 = v7;
  if (v7)
  {
    uint64_t v8 = v7;
    self->_BOOL hasActiveExperiment = 1;
    int v9 = [v7 experimentId];
    experimentId = self->_experimentId;
    self->_experimentId = v9;

    uint64_t v11 = [v8 treatmentId];
    treatmentId = self->_treatmentId;
    self->_treatmentId = v11;

    self->_experimentDeploymentId = [v8 deploymentId];
    if (![(NSString *)self->_client isEqualToString:@"Spotlight"]) {
      goto LABEL_16;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&sTrialLock);
    uint64_t v13 = (void *)sCurrentActiveTrialManagers;
    if (!sCurrentActiveTrialManagers)
    {
      uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
      long long v15 = (void *)sCurrentActiveTrialManagers;
      sCurrentActiveTrialManagers = v14;

      uint64_t v13 = (void *)sCurrentActiveTrialManagers;
    }
    long long v16 = [v13 objectForKeyedSubscript:self->_namespaceId];

    if (!v16) {
      [(id)sCurrentActiveTrialManagers setObject:self forKey:self->_namespaceId];
    }
  }
  else
  {
    self->_BOOL hasActiveExperiment = 0;
    long long v17 = self->_experimentId;
    self->_experimentId = 0;

    v18 = self->_treatmentId;
    self->_treatmentId = 0;

    self->_experimentDeploymentId = -1;
    if (![(NSString *)self->_client isEqualToString:@"Spotlight"]) {
      goto LABEL_16;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&sTrialLock);
    if (sCurrentActiveTrialManagers)
    {
      uint64_t v19 = [(id)sCurrentActiveTrialManagers objectForKeyedSubscript:self->_namespaceId];

      if (v19) {
        [(id)sCurrentActiveTrialManagers removeObjectForKey:self->_namespaceId];
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sTrialLock);
LABEL_16:
  uint64_t v20 = [(TRIClient *)self->_trialClient factorLevelsWithNamespaceName:self->_namespaceName];
  v21 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v20, "count"));
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v22 = v20;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v66 objects:v79 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v67 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        v28 = [v27 factor];
        v29 = [v28 name];

        v30 = [v27 level];
        [v21 setObject:v30 forKey:v29];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v66 objects:v79 count:16];
    }
    while (v24);
  }

  pthread_rwlock_wrlock(&sTrialCacheLock);
  v31 = (NSDictionary *)[v21 copy];
  cachedValuesForFactor = self->_cachedValuesForFactor;
  self->_cachedValuesForFactor = v31;

  pthread_rwlock_unlock(&sTrialCacheLock);
  v33 = [(TRIClient *)self->_trialClient rolloutIdentifiersWithNamespaceName:self->_namespaceName];
  v34 = v33;
  if (v33)
  {
    self->_BOOL hasRollout = 1;
    v35 = [v33 rolloutId];
    rolloutId = self->_rolloutId;
    self->_rolloutId = v35;

    int v37 = [v34 deploymentId];
  }
  else
  {
    self->_BOOL hasRollout = 0;
    v38 = self->_rolloutId;
    self->_rolloutId = 0;

    int v37 = -1;
  }
  self->_rolloutDeploymentId = v37;
  v39 = [MEMORY[0x263F08850] defaultManager];
  id v65 = 0;
  v40 = [v39 contentsOfDirectoryAtPath:sTrialOverrideDirectoryPath error:&v65];
  id v41 = v65;

  if (!v41)
  {
    v58 = v40;
    v59 = v34;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v42 = v40;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v61 objects:v78 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v62;
      while (2)
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v62 != v45) {
            objc_enumerationMutation(v42);
          }
          id v47 = *(void **)(*((void *)&v61 + 1) + 8 * j);
          v48 = [NSString stringWithFormat:@"factor-%@.pb", self->_namespaceName];
          LODWORD(v47) = [v47 isEqualToString:v48];

          if (v47)
          {
            self->_BOOL hasOverride = 1;
            goto LABEL_37;
          }
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v61 objects:v78 count:16];
        if (v44) {
          continue;
        }
        break;
      }
    }
LABEL_37:

    v34 = v59;
    id v41 = 0;
    v40 = v58;
  }
  objc_super v49 = SRLogCategoryLifeCycle();
  v50 = v49;
  unint64_t v51 = loadWithUpdateHandler__updateCount;
  os_signpost_id_t v52 = ++loadWithUpdateHandler__updateCount;
  if (v51 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
  {
    namespaceId = self->_namespaceId;
    if (namespaceId) {
      v54 = [(NSString *)namespaceId UTF8String];
    }
    else {
      v54 = "?";
    }
    BOOL hasActiveExperiment = self->_hasActiveExperiment;
    BOOL hasRollout = self->_hasRollout;
    BOOL hasOverride = self->_hasOverride;
    *(_DWORD *)buf = 136315906;
    v71 = v54;
    __int16 v72 = 1024;
    BOOL v73 = hasActiveExperiment;
    __int16 v74 = 1024;
    BOOL v75 = hasRollout;
    __int16 v76 = 1024;
    BOOL v77 = hasOverride;
    _os_signpost_emit_with_name_impl(&dword_25E378000, v50, OS_SIGNPOST_EVENT, v52, "SRResourcesTrialUpdate", "ns:%s, exp:%d, ro:%d, over:%d", buf, 0x1Eu);
  }

  if (v4) {
    v4[2](v4, self->_namespaceId, self);
  }
}

+ (id)resolveMultipleSpotlightExperiments
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)&sTrialLock);
  if (sCurrentActiveTrialManagers)
  {
    if ((unint64_t)[(id)sCurrentActiveTrialManagers count] >= 2)
    {
      uint64_t v2 = SRLogCategoryGeneral();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        +[SSTrialManager resolveMultipleSpotlightExperiments](v2);
      }
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v3 = [&unk_270B1D610 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v20 != v5) {
            objc_enumerationMutation(&unk_270B1D610);
          }
          uint64_t v7 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v8 = [(id)sCurrentActiveTrialManagers objectForKeyedSubscript:v7];
          if (v8)
          {
            int v9 = (void *)v8;
            id v10 = SRLogCategoryGeneral();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
              +[SSTrialManager resolveMultipleSpotlightExperiments];
            }

            goto LABEL_18;
          }
        }
        uint64_t v4 = [&unk_270B1D610 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    int v9 = 0;
LABEL_18:
    os_unfair_lock_unlock((os_unfair_lock_t)&sTrialLock);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&sTrialLock);
    long long v17 = SRLogCategoryGeneral();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25E378000, v17, OS_LOG_TYPE_INFO, "No active Spotlight experiment on device", buf, 2u);
    }

    int v9 = 0;
  }
  return v9;
}

+ (BOOL)didAllNamespacesLoadForClient:(id)a3
{
  id v3 = a3;
  if (![v3 isEqualToString:@"Spotlight"])
  {
    if ([v3 isEqualToString:@"SpotlightKnowledge"])
    {
      if ((trialFlagsForProcess() & 2) == 0) {
        goto LABEL_19;
      }
      uint64_t v12 = +[SSTrialManager sharedSpotlightKnowledgeTrialManager];
    }
    else
    {
      if (![v3 isEqualToString:@"Mail"] || (trialFlagsForProcess() & 4) == 0) {
        goto LABEL_19;
      }
      uint64_t v12 = +[SSTrialManager sharedSpotlightMailTrialManager];
    }
    uint64_t v8 = v12;
    char v11 = [v12 wasLoadedSinceLaunch];
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v4 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[SSTrialManager didAllNamespacesLoadForClient:].cold.4();
  }

  uint64_t v5 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[SSTrialManager didAllNamespacesLoadForClient:]();
  }

  BOOL v6 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[SSTrialManager didAllNamespacesLoadForClient:]();
  }

  uint64_t v7 = SRLogCategoryGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[SSTrialManager didAllNamespacesLoadForClient:]();
  }

  if (trialFlagsForProcess())
  {
    uint64_t v8 = +[SSTrialManager sharedSpotlightModelTrialManager];
    if ([v8 wasLoadedSinceLaunch])
    {
      int v9 = +[SSTrialManager sharedSpotlightUITrialManager];
      if ([v9 wasLoadedSinceLaunch])
      {
        id v10 = +[SSTrialManager sharedSpotlightRankingTrialManager];
        char v11 = [v10 wasLoadedSinceLaunch];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
    goto LABEL_25;
  }
LABEL_19:
  char v11 = 0;
LABEL_26:

  return v11;
}

- (BOOL)wasLoadedSinceLaunch
{
  return self->_wasLoadedSinceLaunch;
}

- (void)setWasLoadedSinceLaunch:(BOOL)a3
{
  self->_wasLoadedSinceLaunch = a3;
}

- (NSString)client
{
  return self->_client;
}

- (NSString)namespaceId
{
  return self->_namespaceId;
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (NSString)rolloutId
{
  return self->_rolloutId;
}

- (int)experimentDeploymentId
{
  return self->_experimentDeploymentId;
}

- (int)rolloutDeploymentId
{
  return self->_rolloutDeploymentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rolloutId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_namespaceId, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_cachedValuesForFactor, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

- (void)initWithNameSpace:(uint64_t)a1 forClient:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25E378000, a2, OS_LOG_TYPE_ERROR, "Process not on whitelist for client %@", (uint8_t *)&v2, 0xCu);
}

void __46__SSTrialManager_initWithNameSpace_forClient___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 namespaceId];
  uint64_t v5 = [a1 client];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  int v9 = v5;
  _os_log_error_impl(&dword_25E378000, a2, OS_LOG_TYPE_ERROR, "Trial update handler is not set when initializing Trial manager for namespace %@ and client %@", (uint8_t *)&v6, 0x16u);
}

+ (void)currentTrialManagerForClient:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25E378000, log, OS_LOG_TYPE_ERROR, "Invalid client name for currentTrialManagerForClient", v1, 2u);
}

- (void)getLevelForFactor:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_25E378000, v0, v1, "Fetching codepathIDs from namespace %@", v2, v3, v4, v5, v6);
}

- (void)loadWithUpdateHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = @"YES";
  if (*(unsigned char *)(a1 + 32)) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  int v5 = *(unsigned __int8 *)(a1 + 34);
  if (*(unsigned char *)(a1 + 33)) {
    uint8_t v6 = @"YES";
  }
  else {
    uint8_t v6 = @"NO";
  }
  int v7 = 138413058;
  if (!v5) {
    uint64_t v3 = @"NO";
  }
  uint64_t v8 = v2;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  __int16 v13 = 2112;
  uint64_t v14 = v3;
  _os_log_debug_impl(&dword_25E378000, a2, OS_LOG_TYPE_DEBUG, "Before loading namespace %@: _BOOL hasActiveExperiment = %@, _hasRollout = %@, _hasOverride = %@", (uint8_t *)&v7, 0x2Au);
}

- (void)loadWithUpdateHandler:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_25E378000, v0, v1, "Loading Trial namespace %@", v2, v3, v4, v5, v6);
}

+ (void)resolveMultipleSpotlightExperiments
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_25E378000, log, OS_LOG_TYPE_ERROR, "More than one active Spotlight experiment on device, resolving", v1, 2u);
}

+ (void)didAllNamespacesLoadForClient:.cold.1()
{
  v0 = +[SSTrialManager sharedSpotlightPolicyTrialManager];
  [v0 wasLoadedSinceLaunch];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_25E378000, v1, v2, "SPOLIGHT_RANKING_POLICY = %@", v3, v4, v5, v6, v7);
}

+ (void)didAllNamespacesLoadForClient:.cold.2()
{
  v0 = +[SSTrialManager sharedSpotlightRankingTrialManager];
  [v0 wasLoadedSinceLaunch];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_25E378000, v1, v2, "SPOLIGHT_RANKING_RULES = %@", v3, v4, v5, v6, v7);
}

+ (void)didAllNamespacesLoadForClient:.cold.3()
{
  v0 = +[SSTrialManager sharedSpotlightUITrialManager];
  [v0 wasLoadedSinceLaunch];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_25E378000, v1, v2, "SPOLIGHT_UI = %@", v3, v4, v5, v6, v7);
}

+ (void)didAllNamespacesLoadForClient:.cold.4()
{
  v0 = +[SSTrialManager sharedSpotlightModelTrialManager];
  [v0 wasLoadedSinceLaunch];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_25E378000, v1, v2, "SPOLIGHT_BLENDING_MODEL = %@", v3, v4, v5, v6, v7);
}

@end