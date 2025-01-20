@interface WBSTrialManager
+ (id)shared;
- (BOOL)getBoolFactor:(id)a3 forCF:(BOOL)a4 forDefault:(BOOL)a5;
- (BOOL)inExperiment;
- (BOOL)isCFEnabled;
- (BOOL)isReady;
- (BOOL)ready;
- (BOOL)runCFFlow;
- (NSDictionary)factors;
- (NSString)experimentId;
- (NSString)treatmentId;
- (OS_dispatch_queue)queue;
- (TRIClient)trialClient;
- (WBSTrialIdentifiers)identifiers;
- (WBSTrialManager)init;
- (double)CFSearchTimeoutForDefault:(double)a3;
- (double)getFloatFactor:(id)a3 forCF:(BOOL)a4 forDefault:(double)a5;
- (id)factorWithName:(id)a3;
- (id)getFactorValueAsString:(id)a3;
- (id)getRetrievalFactorName:(id)a3 forCF:(BOOL)a4;
- (id)numberFactorWithName:(id)a3;
- (id)prepareLogDictionary:(BOOL)a3 withExperimentId:(id)a4 withTreatmentId:(id)a5 isCounterFactualSearch:(BOOL)a6 withFactorData:(id)a7;
- (id)stringFactorWithName:(id)a3;
- (int64_t)getIntFactor:(id)a3 forCF:(BOOL)a4 forDefault:(int64_t)a5;
- (os_unfair_lock_s)lock;
- (unint64_t)_weightedRandomIdentifier;
- (unint64_t)trialABGroupIdentifier;
- (void)fetchFactorsInNamespace:(id)a3;
- (void)registerDiagnosticInfo:(id)a3;
- (void)setExperimentId:(id)a3;
- (void)setFactorWithName:(id)a3 value:(id)a4;
- (void)setFactors:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setQueue:(id)a3;
- (void)setReady:(BOOL)a3;
- (void)setTreatmentId:(id)a3;
- (void)setTrialClient:(id)a3;
@end

@implementation WBSTrialManager

void __25__WBSTrialManager_shared__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)shared_shared;
  shared_shared = (uint64_t)v0;
}

- (WBSTrialManager)init
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:@"WBSDisableTrial"];

  if ((v4 & 1) != 0
    || (v13.receiver = self,
        v13.super_class = (Class)WBSTrialManager,
        (self = [(WBSTrialManager *)&v13 init]) == 0))
  {
    v8 = 0;
  }
  else
  {
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SafariShared.WBSTrial", 0);
    queue = self->_queue;
    self->_queue = v5;

    self->_lock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, self);
    v7 = self->_queue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __23__WBSTrialManager_init__block_invoke;
    v10[3] = &unk_1E5C8E0B0;
    objc_copyWeak(&v11, &location);
    dispatch_async(v7, v10);
    self = self;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    v8 = self;
  }

  return v8;
}

- (void)fetchFactorsInNamespace:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  char v4 = [(WBSTrialManager *)self queue];
  dispatch_assert_queue_V2(v4);

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v29 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v6 = [(WBSTrialManager *)self trialClient];
  v7 = [v6 factorLevelsWithNamespaceName:@"SAFARI_SEARCH_RANKING"];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v12 hasFactor] && objc_msgSend(v12, "hasLevel"))
        {
          objc_super v13 = [v12 level];
          v14 = [v12 factor];
          v15 = [v14 name];
          [v5 setObject:v13 forKeyedSubscript:v15];

          v16 = [v12 level];
          v17 = [(WBSTrialManager *)self getFactorValueAsString:v16];

          if (v17)
          {
            v18 = [v12 factor];
            v19 = [v18 name];
            [v29 setObject:v17 forKeyedSubscript:v19];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v9);
  }

  v20 = [(WBSTrialManager *)self trialClient];
  v21 = [v20 experimentIdentifiersWithNamespaceName:@"SAFARI_SEARCH_RANKING"];

  if (v21)
  {
    os_unfair_lock_lock(&self->_lock);
    [(WBSTrialManager *)self setFactors:v5];
    v22 = [v21 experimentId];
    [(WBSTrialManager *)self setExperimentId:v22];

    v23 = [v21 treatmentId];
    [(WBSTrialManager *)self setTreatmentId:v23];

    [(WBSTrialManager *)self setReady:1];
    os_unfair_lock_unlock(&self->_lock);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__WBSTrialManager_fetchFactorsInNamespace___block_invoke;
    block[3] = &unk_1E5C8C880;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    v24 = [(WBSTrialManager *)self experimentId];
    v25 = [(WBSTrialManager *)self treatmentId];
    v26 = v29;
    v27 = [(WBSTrialManager *)self prepareLogDictionary:1 withExperimentId:v24 withTreatmentId:v25 isCounterFactualSearch:[(WBSTrialManager *)self isCFEnabled] withFactorData:v29];
    [(WBSTrialManager *)self registerDiagnosticInfo:v27];
  }
  else
  {
    v28 = [(WBSTrialManager *)self prepareLogDictionary:0 withExperimentId:0 withTreatmentId:0 isCounterFactualSearch:0 withFactorData:0];
    [(WBSTrialManager *)self registerDiagnosticInfo:v28];

    v26 = v29;
  }
}

void __23__WBSTrialManager_init__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    char v4 = [WeakRetained trialClient];

    if (!v4)
    {
      id v5 = [MEMORY[0x1E4FB0098] clientWithIdentifier:231];
      [v3 setTrialClient:v5];
    }
    [v3 fetchFactorsInNamespace:@"SAFARI_SEARCH_RANKING"];
    v6 = [v3 trialClient];
    uint64_t v7 = v3[5];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __23__WBSTrialManager_init__block_invoke_2;
    v9[3] = &unk_1E5CA0720;
    objc_copyWeak(&v10, v1);
    id v8 = (id)[v6 addUpdateHandlerForNamespaceName:@"SAFARI_SEARCH_RANKING" queue:v7 usingBlock:v9];

    objc_destroyWeak(&v10);
  }
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
}

- (void)registerDiagnosticInfo:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F97E90];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__WBSTrialManager_registerDiagnosticInfo___block_invoke;
  v9[3] = &unk_1E5C8C398;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 registeredStateCollectorWithLogLabel:@"Trial experiment state" payloadProvider:v9];
  stateCollector = self->_stateCollector;
  self->_stateCollector = v7;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)prepareLogDictionary:(BOOL)a3 withExperimentId:(id)a4 withTreatmentId:(id)a5 isCounterFactualSearch:(BOOL)a6 withFactorData:(id)a7
{
  BOOL v8 = a6;
  BOOL v10 = a3;
  v23[4] = *MEMORY[0x1E4F143B8];
  id v11 = (__CFString *)a4;
  v12 = (__CFString *)a5;
  id v13 = a7;
  v14 = v13;
  if (v10)
  {
    if (v13)
    {
      v15 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v13 options:0 error:0];
      v16 = (__CFString *)[[NSString alloc] initWithData:v15 encoding:4];
    }
    else
    {
      v16 = @"No factor data available";
    }
    v18 = @"Unknown Experiment ID";
    if (v11) {
      v18 = v11;
    }
    v22[0] = @"Experiment ID";
    v22[1] = @"Treatment ID";
    v19 = @"Unknown Treatment ID";
    if (v12) {
      v19 = v12;
    }
    v23[0] = v18;
    v23[1] = v19;
    v20 = @"NO";
    if (v8) {
      v20 = @"YES";
    }
    v22[2] = @"Counterfactual experiment";
    v22[3] = @"Factors";
    v23[2] = v20;
    v23[3] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];
  }
  else
  {
    v17 = &unk_1EFC22428;
  }

  return v17;
}

+ (id)shared
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__WBSTrialManager_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, block);
  }
  v2 = (void *)shared_shared;
  return v2;
}

- (unint64_t)trialABGroupIdentifier
{
  v3 = [(WBSTrialManager *)self numberFactorWithName:@"enableStreamlinedCompletionList"];
  if ([v3 BOOLValue])
  {
    id v4 = [(WBSTrialManager *)self numberFactorWithName:@"enableLabelPreviousSearchesInCompletionList"];
    int v5 = [v4 BOOLValue];

    if (!v5) {
      return 21;
    }
  }
  else
  {
  }
  uint64_t v7 = [(WBSTrialManager *)self numberFactorWithName:@"enableStreamlinedCompletionList"];
  if ([v7 BOOLValue])
  {
  }
  else
  {
    BOOL v8 = [(WBSTrialManager *)self numberFactorWithName:@"enableLabelPreviousSearchesInCompletionList"];
    char v9 = [v8 BOOLValue];

    if (v9) {
      return 22;
    }
  }
  BOOL v10 = [(WBSTrialManager *)self numberFactorWithName:@"enableStreamlinedCompletionList"];
  if ([v10 BOOLValue])
  {
    id v11 = [(WBSTrialManager *)self numberFactorWithName:@"enableLabelPreviousSearchesInCompletionList"];
    char v12 = [v11 BOOLValue];

    if (v12) {
      return 23;
    }
  }
  else
  {
  }
  return [(WBSTrialManager *)self _weightedRandomIdentifier] + 20;
}

- (unint64_t)_weightedRandomIdentifier
{
  unint64_t result = (unint64_t)((double)random() * 2.32830644e-10 * 100.0);
  if (result && result - 4 >= 3)
  {
    if (result - 7 >= 5)
    {
      if (result - 12 < 5) {
        return 8;
      }
      else {
        return 9;
      }
    }
    else
    {
      return 7;
    }
  }
  return result;
}

void __23__WBSTrialManager_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v5 namespaceName];
    [WeakRetained fetchFactorsInNamespace:v4];
  }
}

- (BOOL)isReady
{
  return self->_customFactorsDictionary || [(WBSTrialManager *)self ready];
}

- (BOOL)isCFEnabled
{
  v2 = [(WBSTrialManager *)self numberFactorWithName:@"CF_enabled"];
  v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)runCFFlow
{
  v2 = self;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (![(WBSTrialManager *)self isCFEnabled]) {
    return 0;
  }
  v3 = [(WBSTrialManager *)v2 factors];
  char v4 = [v3 allKeys];

  customFactorsDictionary = v2->_customFactorsDictionary;
  if (customFactorsDictionary)
  {
    uint64_t v6 = [(NSMutableDictionary *)customFactorsDictionary allKeys];

    char v4 = (void *)v6;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    id v11 = @"CFSearchTimeout";
    char v12 = @"_cf";
    id v23 = v7;
    BOOL v13 = 1;
LABEL_6:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v25 != v10) {
        objc_enumerationMutation(v7);
      }
      v15 = *(void **)(*((void *)&v24 + 1) + 8 * v14);
      if (([v15 isEqualToString:v11] & 1) == 0
        && ([v15 isEqualToString:@"CF_enabled"] & 1) == 0
        && ([v15 hasSuffix:v12] & 1) == 0)
      {
        v16 = [(WBSTrialManager *)v2 numberFactorWithName:v15];
        v17 = [(WBSTrialManager *)v2 getRetrievalFactorName:v15 forCF:1];
        [(WBSTrialManager *)v2 numberFactorWithName:v17];
        v18 = v12;
        v19 = v11;
        v21 = v20 = v2;

        LODWORD(v17) = [v16 isEqualToNumber:v21];
        v2 = v20;
        id v11 = v19;
        char v12 = v18;

        id v7 = v23;
        if (!v17) {
          break;
        }
      }
      if (v9 == ++v14)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v9) {
          goto LABEL_6;
        }
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    BOOL v13 = 0;
  }

  return v13;
}

- (double)CFSearchTimeoutForDefault:(double)a3
{
  char v4 = [(WBSTrialManager *)self numberFactorWithName:@"CFSearchTimeout"];
  id v5 = v4;
  if (v4)
  {
    [v4 floatValue];
    a3 = v6;
  }

  return a3;
}

- (BOOL)inExperiment
{
  if (![(WBSTrialManager *)self isReady]) {
    return 0;
  }
  v3 = [(WBSTrialManager *)self treatmentId];
  BOOL v4 = v3 != 0;

  return v4;
}

void __43__WBSTrialManager_fetchFactorsInNamespace___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:*MEMORY[0x1E4F981E8] object:*(void *)(a1 + 32)];
}

- (id)factorWithName:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  float v6 = [(WBSTrialManager *)self factors];
  id v7 = [v6 objectForKey:v5];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (WBSTrialIdentifiers)identifiers
{
  v3 = objc_alloc_init(WBSTrialIdentifiers);
  [(WBSTrialIdentifiers *)v3 setNamespaceName:@"SAFARI_SEARCH_RANKING"];
  os_unfair_lock_lock(&self->_lock);
  if (self->_treatmentId)
  {
    [(WBSTrialIdentifiers *)v3 setExperimentId:self->_experimentId];
    [(WBSTrialIdentifiers *)v3 setTreatmentId:self->_treatmentId];
  }
  os_unfair_lock_unlock(&self->_lock);
  if (self->_customFactorsDictionary) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (void)setFactorWithName:(id)a3 value:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  customFactorsDictionary = self->_customFactorsDictionary;
  if (!customFactorsDictionary)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v9 = self->_customFactorsDictionary;
    self->_customFactorsDictionary = v8;

    customFactorsDictionary = self->_customFactorsDictionary;
  }
  [(NSMutableDictionary *)customFactorsDictionary setObject:v6 forKeyedSubscript:v10];
}

- (id)numberFactorWithName:(id)a3
{
  customFactorsDictionary = self->_customFactorsDictionary;
  if (customFactorsDictionary)
  {
    id v5 = [(NSMutableDictionary *)customFactorsDictionary objectForKeyedSubscript:a3];
    goto LABEL_13;
  }
  id v6 = [(WBSTrialManager *)self factorWithName:a3];
  id v7 = v6;
  if (v6)
  {
    int v8 = [v6 levelOneOfCase];
    switch(v8)
    {
      case 15:
        id v10 = NSNumber;
        [v7 doubleValue];
        uint64_t v9 = objc_msgSend(v10, "numberWithDouble:");
        goto LABEL_11;
      case 13:
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v7, "longValue"));
        goto LABEL_11;
      case 10:
        uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "BOOLeanValue"));
LABEL_11:
        id v5 = (void *)v9;
        goto LABEL_12;
    }
  }
  id v5 = 0;
LABEL_12:

LABEL_13:
  return v5;
}

- (id)stringFactorWithName:(id)a3
{
  v3 = [(WBSTrialManager *)self factorWithName:a3];
  BOOL v4 = v3;
  if (v3 && [v3 levelOneOfCase] == 11)
  {
    id v5 = [v4 stringValue];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)getRetrievalFactorName:(id)a3 forCF:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = v5;
  if (v4)
  {
    id v7 = [v5 stringByAppendingString:@"_cf"];
  }
  else
  {
    id v7 = v5;
  }
  int v8 = v7;

  return v8;
}

- (BOOL)getBoolFactor:(id)a3 forCF:(BOOL)a4 forDefault:(BOOL)a5
{
  id v7 = [(WBSTrialManager *)self getRetrievalFactorName:a3 forCF:a4];
  int v8 = [(WBSTrialManager *)self numberFactorWithName:v7];

  if (v8) {
    a5 = [v8 BOOLValue];
  }

  return a5;
}

- (int64_t)getIntFactor:(id)a3 forCF:(BOOL)a4 forDefault:(int64_t)a5
{
  id v7 = [(WBSTrialManager *)self getRetrievalFactorName:a3 forCF:a4];
  int v8 = [(WBSTrialManager *)self numberFactorWithName:v7];

  if (v8) {
    a5 = [v8 integerValue];
  }

  return a5;
}

- (double)getFloatFactor:(id)a3 forCF:(BOOL)a4 forDefault:(double)a5
{
  id v7 = [(WBSTrialManager *)self getRetrievalFactorName:a3 forCF:a4];
  int v8 = [(WBSTrialManager *)self numberFactorWithName:v7];

  if (v8)
  {
    [v8 floatValue];
    a5 = v9;
  }

  return a5;
}

- (id)getFactorValueAsString:(id)a3
{
  id v3 = a3;
  BOOL v4 = @"Unsupported value parsing";
  switch([v3 levelOneOfCase])
  {
    case 0xAu:
      id v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "BOOLeanValue"));
      goto LABEL_6;
    case 0xBu:
      BOOL v4 = [v3 stringValue];
      break;
    case 0xDu:
      id v5 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v3, "longValue"));
      goto LABEL_6;
    case 0xFu:
      id v6 = NSNumber;
      [v3 doubleValue];
      id v5 = objc_msgSend(v6, "numberWithDouble:");
LABEL_6:
      id v7 = v5;
      BOOL v4 = [v5 stringValue];

      break;
    default:
      break;
  }

  return v4;
}

id __42__WBSTrialManager_registerDiagnosticInfo___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)setQueue:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSDictionary)factors
{
  return self->_factors;
}

- (void)setFactors:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
}

- (BOOL)ready
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_factors, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_stateCollector, 0);
  objc_storeStrong((id *)&self->_customFactorsDictionary, 0);
}

@end