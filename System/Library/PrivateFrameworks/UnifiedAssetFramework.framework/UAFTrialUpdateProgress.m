@interface UAFTrialUpdateProgress
+ (id)getSerialQueue;
- (BOOL)onDemandFactorsHaveStarted;
- (BOOL)outOfSpace;
- (NSMutableDictionary)factors;
- (NSMutableDictionary)statuses;
- (NSString)name;
- (UAFTrialUpdateProgress)initWithTrialFactors:(id)a3 detailedProgressWithStatus:(id)a4;
- (id)detailedProgressWithStatus;
- (id)getFactorProgressKey:(id)a3 factor:(id)a4;
- (unint64_t)completedWork;
- (unint64_t)reportedCompletedWork;
- (unint64_t)reportedStatus;
- (unint64_t)reportedTotalWork;
- (unint64_t)totalWork;
- (void)onDemandFactorsStarted;
- (void)outOfSpaceEncountered;
- (void)reportStatus:(unint64_t)a3;
- (void)setCompletedWork:(unint64_t)a3;
- (void)setDetailedProgressWithStatus:(id)a3;
- (void)setFactors:(id)a3;
- (void)setName:(id)a3;
- (void)setOnDemandFactorsHaveStarted:(BOOL)a3;
- (void)setOutOfSpace:(BOOL)a3;
- (void)setReportedCompletedWork:(unint64_t)a3;
- (void)setReportedStatus:(unint64_t)a3;
- (void)setReportedTotalWork:(unint64_t)a3;
- (void)setStatuses:(id)a3;
- (void)setTotalWork:(unint64_t)a3;
- (void)summarize;
- (void)trialFactorFinished:(id)a3 namespace:(id)a4;
- (void)trialFactorProgress:(id)a3 namespace:(id)a4 fractionCompleted:(double)a5 status:(unint64_t)a6;
- (void)trialFactorStarted:(id)a3 namespace:(id)a4 size:(unint64_t)a5 status:(unint64_t)a6;
- (void)updateFinished;
- (void)updateStarted;
@end

@implementation UAFTrialUpdateProgress

- (void).cxx_destruct
{
  objc_storeStrong(&self->_detailedProgressWithStatus, 0);
  objc_storeStrong((id *)&self->_factors, 0);
  objc_storeStrong((id *)&self->_statuses, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

uint64_t __39__UAFTrialUpdateProgress_updateStarted__block_invoke(uint64_t a1)
{
  v2 = [NSNumber numberWithUnsignedInteger:2];
  v3 = [*(id *)(a1 + 32) statuses];
  [v3 setObject:v2 forKeyedSubscript:@"TrialUpdate"];

  v4 = *(void **)(a1 + 32);

  return [v4 summarize];
}

uint64_t __40__UAFTrialUpdateProgress_updateFinished__block_invoke(uint64_t a1)
{
  v2 = [NSNumber numberWithUnsignedInteger:4];
  v3 = [*(id *)(a1 + 32) statuses];
  [v3 setObject:v2 forKeyedSubscript:@"TrialUpdate"];

  v4 = *(void **)(a1 + 32);

  return [v4 summarize];
}

- (NSMutableDictionary)statuses
{
  return self->_statuses;
}

uint64_t __48__UAFTrialUpdateProgress_onDemandFactorsStarted__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setOnDemandFactorsHaveStarted:1];
  v2 = *(void **)(a1 + 32);

  return [v2 summarize];
}

- (void)setOnDemandFactorsHaveStarted:(BOOL)a3
{
  self->_onDemandFactorsHaveStarted = a3;
}

- (void)updateFinished
{
  v3 = +[UAFTrialUpdateProgress getSerialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__UAFTrialUpdateProgress_updateFinished__block_invoke;
  block[3] = &unk_264CEAB50;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)onDemandFactorsStarted
{
  v3 = +[UAFTrialUpdateProgress getSerialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__UAFTrialUpdateProgress_onDemandFactorsStarted__block_invoke;
  block[3] = &unk_264CEAB50;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)summarize
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  unint64_t v3 = +[UAFAssetSetManager coalesceDownloadStatus:self->_statuses];
  uint64_t v4 = v3;
  if (!self->_onDemandFactorsHaveStarted)
  {
    if (v3 != 4) {
      goto LABEL_25;
    }
    return;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v5 = self->_factors;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v6)
  {

    goto LABEL_21;
  }
  uint64_t v7 = v6;
  uint64_t v26 = v4;
  unint64_t v27 = 0;
  obj = v5;
  unint64_t v29 = 0;
  uint64_t v8 = *(void *)v31;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v31 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v30 + 1) + 8 * i);
      v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_factors, "objectForKeyedSubscript:", v10, v26);
      uint64_t v12 = [v11 objectForKeyedSubscript:@"TrialFactorSize"];
      if (!v12) {
        goto LABEL_11;
      }
      v13 = (void *)v12;
      v14 = [(NSMutableDictionary *)self->_factors objectForKeyedSubscript:v10];
      v15 = [v14 objectForKeyedSubscript:@"TrialFactorFractionCompleted"];

      if (v15)
      {
        v16 = [(NSMutableDictionary *)self->_factors objectForKeyedSubscript:v10];
        v17 = [v16 objectForKeyedSubscript:@"TrialFactorSize"];
        v29 += [v17 unsignedLongLongValue];

        v18 = [(NSMutableDictionary *)self->_factors objectForKeyedSubscript:v10];
        v19 = [v18 objectForKeyedSubscript:@"TrialFactorSize"];
        uint64_t v20 = [v19 unsignedIntegerValue];

        if (v20)
        {
          v11 = [(NSMutableDictionary *)self->_factors objectForKeyedSubscript:v10];
          v21 = [v11 objectForKeyedSubscript:@"TrialFactorSize"];
          double v22 = (double)(unint64_t)[v21 unsignedLongLongValue];
          v23 = [(NSMutableDictionary *)self->_factors objectForKeyedSubscript:v10];
          v24 = [v23 objectForKeyedSubscript:@"TrialFactorFractionCompleted"];
          [v24 doubleValue];
          v27 += (unint64_t)(v25 * v22);

LABEL_11:
          continue;
        }
      }
    }
    uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  }
  while (v7);

  uint64_t v4 = v26;
  if (v29 > self->_totalWork) {
    self->_totalWork = v29;
  }
  if (v27 > self->_completedWork) {
    self->_completedWork = v27;
  }
LABEL_21:
  if (v4 == 4)
  {
    self->_completedWork = self->_totalWork;
    if (self->_outOfSpace) {
      uint64_t v4 = 5;
    }
    else {
      uint64_t v4 = 4;
    }
  }
LABEL_25:
  [(UAFTrialUpdateProgress *)self reportStatus:v4];
}

- (void)reportStatus:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (*(_OWORD *)&self->_reportedTotalWork != *(_OWORD *)&self->_totalWork || self->_reportedStatus != a3)
  {
    v5 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t totalWork = self->_totalWork;
      unint64_t completedWork = self->_completedWork;
      name = self->_name;
      v9 = UAFSubscriptionDownloadStatusDescription(a3);
      int v12 = 136316162;
      v13 = "-[UAFTrialUpdateProgress reportStatus:]";
      __int16 v14 = 2114;
      v15 = name;
      __int16 v16 = 2048;
      unint64_t v17 = completedWork;
      __int16 v18 = 2048;
      unint64_t v19 = totalWork;
      __int16 v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_23797A000, v5, OS_LOG_TYPE_DEFAULT, "%s Progress for %{public}@: %llu / %llu. Status: %{public}@", (uint8_t *)&v12, 0x34u);
    }
    unint64_t v10 = self->_completedWork;
    self->_reportedTotalWork = self->_totalWork;
    self->_reportedCompletedWork = v10;
    self->_reportedStatus = a3;
    detailedProgressWithStatus = (void (**)(void))self->_detailedProgressWithStatus;
    if (detailedProgressWithStatus) {
      detailedProgressWithStatus[2]();
    }
  }
}

- (void)updateStarted
{
  unint64_t v3 = +[UAFTrialUpdateProgress getSerialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__UAFTrialUpdateProgress_updateStarted__block_invoke;
  block[3] = &unk_264CEAB50;
  block[4] = self;
  dispatch_async(v3, block);
}

+ (id)getSerialQueue
{
  if (_MergedGlobals_11 != -1) {
    dispatch_once(&_MergedGlobals_11, &__block_literal_global_12);
  }
  v2 = (void *)qword_26AF0BA88;

  return v2;
}

- (UAFTrialUpdateProgress)initWithTrialFactors:(id)a3 detailedProgressWithStatus:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)UAFTrialUpdateProgress;
  uint64_t v8 = [(UAFTrialUpdateProgress *)&v33 init];
  if (v8)
  {
    v9 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [v10 objectForKeyedSubscript:*(void *)(*((void *)&v29 + 1) + 8 * v14)];
          __int16 v16 = [v15 allKeys];
          [v9 addObjectsFromArray:v16];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v12);
    }

    unint64_t v17 = NSString;
    __int16 v18 = [v9 allObjects];
    uint64_t v19 = [v17 stringWithFormat:@"%@", v18];
    __int16 v20 = (void *)*((void *)v8 + 2);
    *((void *)v8 + 2) = v19;

    *((void *)v8 + 7) = 0;
    *(_OWORD *)(v8 + 40) = 0u;
    *(_OWORD *)(v8 + 24) = 0u;
    uint64_t v21 = objc_opt_new();
    uint64_t v22 = (void *)*((void *)v8 + 8);
    *((void *)v8 + 8) = v21;

    uint64_t v23 = objc_opt_new();
    v24 = (void *)*((void *)v8 + 9);
    *((void *)v8 + 9) = v23;

    *((_WORD *)v8 + 4) = 0;
    uint64_t v25 = MEMORY[0x237E26D50](v7);
    uint64_t v26 = (void *)*((void *)v8 + 10);
    *((void *)v8 + 10) = v25;

    unint64_t v27 = v8;
  }

  return (UAFTrialUpdateProgress *)v8;
}

void __40__UAFTrialUpdateProgress_getSerialQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("UAFAutoAssetProgress.Serial", 0);
  v1 = (void *)qword_26AF0BA88;
  qword_26AF0BA88 = (uint64_t)v0;
}

- (void)outOfSpaceEncountered
{
  unint64_t v3 = +[UAFTrialUpdateProgress getSerialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__UAFTrialUpdateProgress_outOfSpaceEncountered__block_invoke;
  block[3] = &unk_264CEAB50;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __47__UAFTrialUpdateProgress_outOfSpaceEncountered__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setOutOfSpace:1];
  v2 = *(void **)(a1 + 32);

  return [v2 summarize];
}

- (id)getFactorProgressKey:(id)a3 factor:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@:%@", a3, a4];
}

- (void)trialFactorStarted:(id)a3 namespace:(id)a4 size:(unint64_t)a5 status:(unint64_t)a6
{
  v9 = [(UAFTrialUpdateProgress *)self getFactorProgressKey:a4 factor:a3];
  id v10 = +[UAFTrialUpdateProgress getSerialQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67__UAFTrialUpdateProgress_trialFactorStarted_namespace_size_status___block_invoke;
  v12[3] = &unk_264CEBB08;
  v12[4] = self;
  id v13 = v9;
  unint64_t v14 = a6;
  unint64_t v15 = a5;
  id v11 = v9;
  dispatch_async(v10, v12);
}

uint64_t __67__UAFTrialUpdateProgress_trialFactorStarted_namespace_size_status___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  unint64_t v3 = [NSNumber numberWithUnsignedInteger:v2];
  uint64_t v4 = [*(id *)(a1 + 32) statuses];
  [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];

  v5 = [*(id *)(a1 + 32) factors];
  id v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v6)
  {
    id v7 = objc_opt_new();
    uint64_t v8 = [*(id *)(a1 + 32) factors];
    [v8 setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  if (v2 == 4) {
    double v9 = 1.0;
  }
  else {
    double v9 = 0.0;
  }
  id v10 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  id v11 = [*(id *)(a1 + 32) factors];
  uint64_t v12 = [v11 objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v12 setObject:v10 forKeyedSubscript:@"TrialFactorSize"];

  id v13 = [NSNumber numberWithDouble:v9];
  unint64_t v14 = [*(id *)(a1 + 32) factors];
  unint64_t v15 = [v14 objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v15 setObject:v13 forKeyedSubscript:@"TrialFactorFractionCompleted"];

  __int16 v16 = *(void **)(a1 + 32);

  return [v16 summarize];
}

- (void)trialFactorProgress:(id)a3 namespace:(id)a4 fractionCompleted:(double)a5 status:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(UAFTrialUpdateProgress *)self getFactorProgressKey:v11 factor:v10];
  id v13 = +[UAFTrialUpdateProgress getSerialQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __81__UAFTrialUpdateProgress_trialFactorProgress_namespace_fractionCompleted_status___block_invoke;
  v17[3] = &unk_264CEBB30;
  v17[4] = self;
  id v18 = v12;
  id v19 = v10;
  id v20 = v11;
  double v21 = a5;
  unint64_t v22 = a6;
  id v14 = v11;
  id v15 = v10;
  id v16 = v12;
  dispatch_async(v13, v17);
}

void __81__UAFTrialUpdateProgress_trialFactorProgress_namespace_fractionCompleted_status___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) factors];
  unint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
    v5 = [*(id *)(a1 + 32) statuses];
    [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

    id v6 = [NSNumber numberWithDouble:*(double *)(a1 + 64)];
    id v7 = [*(id *)(a1 + 32) factors];
    uint64_t v8 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];
    [v8 setObject:v6 forKeyedSubscript:@"TrialFactorFractionCompleted"];

    double v9 = *(void **)(a1 + 32);
    [v9 summarize];
  }
  else
  {
    id v10 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = *(void *)(a1 + 64);
      id v14 = UAFSubscriptionDownloadStatusDescription(*(void *)(a1 + 72));
      int v15 = 136316162;
      id v16 = "-[UAFTrialUpdateProgress trialFactorProgress:namespace:fractionCompleted:status:]_block_invoke";
      __int16 v17 = 2114;
      uint64_t v18 = v11;
      __int16 v19 = 2114;
      uint64_t v20 = v12;
      __int16 v21 = 2048;
      uint64_t v22 = v13;
      __int16 v23 = 2114;
      v24 = v14;
      _os_log_error_impl(&dword_23797A000, v10, OS_LOG_TYPE_ERROR, "%s Received progress for unknown factor %{public}@ in namespace %{public}@ with fraction completed %f and status %{public}@", (uint8_t *)&v15, 0x34u);
    }
  }
}

- (void)trialFactorFinished:(id)a3 namespace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UAFTrialUpdateProgress *)self getFactorProgressKey:v7 factor:v6];
  double v9 = +[UAFTrialUpdateProgress getSerialQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__UAFTrialUpdateProgress_trialFactorFinished_namespace___block_invoke;
  v13[3] = &unk_264CEBB58;
  v13[4] = self;
  id v14 = v8;
  id v15 = v6;
  id v16 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(v9, v13);
}

void __56__UAFTrialUpdateProgress_trialFactorFinished_namespace___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) statuses];
  unint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = [NSNumber numberWithUnsignedInteger:4];
    v5 = [*(id *)(a1 + 32) statuses];
    [v5 setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];

    id v6 = *(void **)(a1 + 32);
    [v6 summarize];
  }
  else
  {
    id v7 = UAFGetLogCategory((void **)&UAFLogContextClient);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      int v10 = 136315650;
      id v11 = "-[UAFTrialUpdateProgress trialFactorFinished:namespace:]_block_invoke";
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s Received finished status for unknown factor %{public}@ in namespace %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)totalWork
{
  return self->_totalWork;
}

- (void)setTotalWork:(unint64_t)a3
{
  self->_unint64_t totalWork = a3;
}

- (unint64_t)completedWork
{
  return self->_completedWork;
}

- (void)setCompletedWork:(unint64_t)a3
{
  self->_unint64_t completedWork = a3;
}

- (unint64_t)reportedTotalWork
{
  return self->_reportedTotalWork;
}

- (void)setReportedTotalWork:(unint64_t)a3
{
  self->_reportedTotalWork = a3;
}

- (unint64_t)reportedCompletedWork
{
  return self->_reportedCompletedWork;
}

- (void)setReportedCompletedWork:(unint64_t)a3
{
  self->_reportedCompletedWork = a3;
}

- (unint64_t)reportedStatus
{
  return self->_reportedStatus;
}

- (void)setReportedStatus:(unint64_t)a3
{
  self->_reportedStatus = a3;
}

- (void)setStatuses:(id)a3
{
}

- (NSMutableDictionary)factors
{
  return self->_factors;
}

- (void)setFactors:(id)a3
{
}

- (BOOL)onDemandFactorsHaveStarted
{
  return self->_onDemandFactorsHaveStarted;
}

- (BOOL)outOfSpace
{
  return self->_outOfSpace;
}

- (void)setOutOfSpace:(BOOL)a3
{
  self->_outOfSpace = a3;
}

- (id)detailedProgressWithStatus
{
  return self->_detailedProgressWithStatus;
}

- (void)setDetailedProgressWithStatus:(id)a3
{
}

@end