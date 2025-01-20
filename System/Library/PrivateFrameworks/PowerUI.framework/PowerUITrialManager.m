@interface PowerUITrialManager
- (BOOL)useTrialEnabledFeature:(id)a3;
- (NSMutableArray)updateHandlers;
- (NSString)defaultsDomain;
- (NSString)experimentID;
- (NSString)treatmentID;
- (NSString)trialNamespaceName;
- (OS_os_log)log;
- (PowerUITrialManager)initWithDefaultsDomain:(id)a3;
- (TRIClient)trialClient;
- (TRITrackingId)trialTrackingID;
- (double)doubleFactorForName:(id)a3;
- (double)loadTrialAdjustedHours;
- (double)loadTrialMinInputChargeDuration;
- (double)loadTrialThreshold;
- (id)loadModelFromPath:(id)a3 deleteExistingFiles:(BOOL)a4;
- (id)loadTrialDurationModelByDeletingExistingModel:(BOOL)a3;
- (id)loadTrialEngageModelByDeletingExistingModel:(BOOL)a3;
- (id)trialFactor:(id)a3;
- (int64_t)longFactorForName:(id)a3;
- (os_unfair_lock_s)lock;
- (void)addUpdateHandler:(id)a3;
- (void)loadTrialUpdates;
- (void)setDefaultsDomain:(id)a3;
- (void)setExperimentID:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setTreatmentID:(id)a3;
- (void)setTrialClient:(id)a3;
- (void)setTrialNamespaceName:(id)a3;
- (void)setTrialTrackingID:(id)a3;
- (void)setUpdateHandlers:(id)a3;
@end

@implementation PowerUITrialManager

- (PowerUITrialManager)initWithDefaultsDomain:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PowerUITrialManager;
  v6 = [(PowerUITrialManager *)&v38 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    os_log_t v8 = os_log_create("com.apple.powerui.smartcharging", "trialmanager");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"Beginning of TrialManager init"];
    objc_storeStrong((id *)&v7->_defaultsDomain, a3);
    uint64_t v10 = [MEMORY[0x263F80E18] clientWithIdentifier:220];
    trialClient = v7->_trialClient;
    v7->_trialClient = (TRIClient *)v10;

    v12 = v7->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v7->_trialClient;
      *(_DWORD *)buf = 138412290;
      v40 = v13;
      _os_log_impl(&dword_22135E000, v12, OS_LOG_TYPE_DEFAULT, "Trial Client %@", buf, 0xCu);
    }
    uint64_t v14 = [(TRIClient *)v7->_trialClient trackingId];
    trialTrackingID = v7->_trialTrackingID;
    v7->_trialTrackingID = (TRITrackingId *)v14;

    uint64_t v16 = [MEMORY[0x263F80EA8] namespaceNameFromId:251];
    trialNamespaceName = v7->_trialNamespaceName;
    v7->_trialNamespaceName = (NSString *)v16;

    v18 = v7->_trialClient;
    v19 = v7->_trialNamespaceName;
    id v36 = 0;
    id v37 = 0;
    char v20 = [(TRIClient *)v18 trialIdentifiersWithNamespaceName:v19 experimentId:&v37 deploymentId:0 treatmentId:&v36];
    v21 = (NSString *)v37;
    v22 = (NSString *)v36;
    if ((v20 & 1) == 0)
    {
      v23 = v7->_log;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, v23, OS_LOG_TYPE_DEFAULT, "Failed to load experiment/treatment IDs", buf, 2u);
      }
    }
    experimentID = v7->_experimentID;
    v7->_experimentID = v21;
    v25 = v21;

    treatmentID = v7->_treatmentID;
    v7->_treatmentID = v22;
    v27 = v22;

    uint64_t v28 = [MEMORY[0x263EFF980] array];
    updateHandlers = v7->_updateHandlers;
    v7->_updateHandlers = (NSMutableArray *)v28;

    v30 = v7->_trialClient;
    v31 = v7->_trialNamespaceName;
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __46__PowerUITrialManager_initWithDefaultsDomain___block_invoke;
    v34[3] = &unk_2645A5BE8;
    v35 = v7;
    id v32 = (id)[(TRIClient *)v30 addUpdateHandlerForNamespaceName:v31 usingBlock:v34];
    +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"End of TrialManager init"];
  }
  return v7;
}

void __46__PowerUITrialManager_initWithDefaultsDomain___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  v2 = [*(id *)(a1 + 32) updateHandlers];
  v3 = (void *)[v2 copy];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [*(id *)(a1 + 32) loadTrialUpdates];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)loadTrialUpdates
{
  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"Beginning of loadTrialUpdates"];
  os_unfair_lock_lock(&self->_lock);
  v3 = (TRITrackingId *)[(TRIClient *)self->_trialClient newTrackingId];
  trialTrackingID = self->_trialTrackingID;
  self->_trialTrackingID = v3;

  uint64_t v5 = [MEMORY[0x263F80EA8] namespaceNameFromId:251];
  trialNamespaceName = self->_trialNamespaceName;
  self->_trialNamespaceName = v5;

  trialClient = self->_trialClient;
  uint64_t v8 = self->_trialNamespaceName;
  id v17 = 0;
  id v18 = 0;
  char v9 = [(TRIClient *)trialClient trialIdentifiersWithNamespaceName:v8 experimentId:&v18 deploymentId:0 treatmentId:&v17];
  long long v10 = (NSString *)v18;
  long long v11 = (NSString *)v17;
  if ((v9 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Failed to load experiment/treatment IDs", v16, 2u);
    }
  }
  experimentID = self->_experimentID;
  self->_experimentID = v10;
  uint64_t v14 = v10;

  treatmentID = self->_treatmentID;
  self->_treatmentID = v11;

  os_unfair_lock_unlock(&self->_lock);
  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"End of loadTrialUpdates"];
}

- (int64_t)longFactorForName:(id)a3
{
  v3 = [(PowerUITrialManager *)self trialFactor:a3];
  int64_t v4 = [v3 longValue];

  return v4;
}

- (double)doubleFactorForName:(id)a3
{
  v3 = [(PowerUITrialManager *)self trialFactor:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)addUpdateHandler:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  updateHandlers = self->_updateHandlers;
  uint64_t v7 = (void *)MEMORY[0x223C80C20](v5);

  [(NSMutableArray *)updateHandlers addObject:v7];
  os_unfair_lock_unlock(p_lock);
}

- (id)loadTrialEngageModelByDeletingExistingModel:(BOOL)a3
{
  BOOL v3 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v11 = 0;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Loading trial engagement model", v11, 2u);
  }
  uint64_t v6 = [(PowerUITrialManager *)self trialFactor:@"trialEngageModel"];
  uint64_t v7 = [v6 fileValue];
  uint64_t v8 = [v7 path];
  char v9 = [(PowerUITrialManager *)self loadModelFromPath:v8 deleteExistingFiles:v3];

  return v9;
}

- (id)loadTrialDurationModelByDeletingExistingModel:(BOOL)a3
{
  BOOL v3 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v11 = 0;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Loading trial duration model", v11, 2u);
  }
  uint64_t v6 = [(PowerUITrialManager *)self trialFactor:@"trialDurationModel"];
  uint64_t v7 = [v6 fileValue];
  uint64_t v8 = [v7 path];
  char v9 = [(PowerUITrialManager *)self loadModelFromPath:v8 deleteExistingFiles:v3];

  return v9;
}

- (double)loadTrialThreshold
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = [(PowerUITrialManager *)self trialFactor:@"engagementThreshold"];
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = log;
      [v3 doubleValue];
      int v10 = 134217984;
      uint64_t v11 = v6;
      _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "Threshold value is %lf", (uint8_t *)&v10, 0xCu);
    }
    [v3 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (double)loadTrialAdjustedHours
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = [(PowerUITrialManager *)self trialFactor:@"adjustedHours"];
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = log;
      [v3 doubleValue];
      int v10 = 134217984;
      uint64_t v11 = v6;
      _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "Duration hours is %lf", (uint8_t *)&v10, 0xCu);
    }
    [v3 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (double)loadTrialMinInputChargeDuration
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = [(PowerUITrialManager *)self trialFactor:@"minInputChargeDuration"];
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = log;
      [v3 doubleValue];
      int v10 = 134217984;
      uint64_t v11 = v6;
      _os_log_impl(&dword_22135E000, v5, OS_LOG_TYPE_DEFAULT, "Minimum charge duration considered for model input is %lf", (uint8_t *)&v10, 0xCu);
    }
    [v3 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (BOOL)useTrialEnabledFeature:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [NSString stringWithFormat:@"trialOverride.%@", v4];
  uint64_t v6 = +[PowerUISmartChargeUtilities numberForPreferenceKey:v5 inDomain:self->_defaultsDomain];

  if (v6 && [v6 BOOLValue])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Feature '%@' enabled via defaults override", buf, 0xCu);
    }
    char v8 = 1;
  }
  else
  {
    char v9 = [(PowerUITrialManager *)self trialFactor:v4];
    int v10 = self->_log;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[PowerUITrialManager useTrialEnabledFeature:](v10, v9);
      }
      char v8 = [v9 BOOLeanValue];
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[PowerUITrialManager useTrialEnabledFeature:]();
      }
      char v8 = 0;
    }
  }
  return v8;
}

- (id)trialFactor:(id)a3
{
  return (id)[(TRIClient *)self->_trialClient levelForFactor:a3 withNamespaceName:self->_trialNamespaceName];
}

- (id)loadModelFromPath:(id)a3 deleteExistingFiles:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v133 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = (void *)os_transaction_create();
  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"Beginning of loadModelFromPath"];
  log = self->_log;
  if (v6)
  {
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:]3();
    }
    if (([v6 isAbsolutePath] & 1) == 0)
    {
      char v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v10 = [v9 pathForResource:v6 ofType:0];

      uint64_t v11 = self->_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v124 = v10;
        _os_log_impl(&dword_22135E000, v11, OS_LOG_TYPE_DEFAULT, "Not an absolute path, loading absolute path...Path is %@", buf, 0xCu);
      }
      if (v10)
      {
        id v12 = v10;

        id v6 = v12;
      }
    }
    id v13 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\.(\\d+?)\\." options:1 error:0];
    uint64_t v14 = objc_msgSend(v13, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
    v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 range];
      id v18 = objc_msgSend(v6, "substringWithRange:", v16, v17);
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
        -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:]2();
      }
    }
    else
    {
      char v20 = self->_log;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:]1(v20);
      }
      id v18 = 0;
    }
    v21 = [MEMORY[0x263F08850] defaultManager];
    char v120 = 0;
    if ([v21 fileExistsAtPath:@"/var/mobile/Library/PowerUI" isDirectory:&v120])
    {
      id v22 = 0;
    }
    else
    {
      id v119 = 0;
      char v23 = [v21 createDirectoryAtPath:@"/var/mobile/Library/PowerUI" withIntermediateDirectories:1 attributes:0 error:&v119];
      id v22 = v119;
      if ((v23 & 1) == 0)
      {
        v26 = self->_log;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:]0((uint64_t)v22, v26);
        }
        id v19 = 0;
        goto LABEL_101;
      }
    }
    if (v18)
    {
      BOOL v92 = v4;
      id v118 = v22;
      v101 = v21;
      v24 = [v21 contentsOfDirectoryAtPath:@"/var/mobile/Library/PowerUI" error:&v118];
      id v25 = v118;

      if (v25)
      {
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
          -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.9();
        }
        id v19 = 0;
        goto LABEL_100;
      }
      v96 = v7;
      v98 = v15;
      v94 = v13;
      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      id v27 = v24;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v114 objects:v132 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v115;
LABEL_32:
        uint64_t v31 = 0;
        while (1)
        {
          if (*(void *)v115 != v30) {
            objc_enumerationMutation(v27);
          }
          id v32 = *(void **)(*((void *)&v114 + 1) + 8 * v31);
          if ([v32 containsString:v18]) {
            break;
          }
          if (v29 == ++v31)
          {
            uint64_t v29 = [v27 countByEnumeratingWithState:&v114 objects:v132 count:16];
            if (v29) {
              goto LABEL_32;
            }
            goto LABEL_38;
          }
        }
        v33 = NSURL;
        v131[0] = @"/var/mobile/Library/PowerUI";
        v131[1] = v32;
        v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v131 count:2];
        id v22 = [v33 fileURLWithPathComponents:v34];

        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
          -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.8();
        }

        id v13 = v94;
        double v7 = v96;
        v15 = v98;
        if (v22)
        {
          v24 = v22;
          v100 = v18;
          if (v92)
          {
            v35 = [v22 path];
            id v36 = self->_log;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v124 = v35;
              _os_log_impl(&dword_22135E000, v36, OS_LOG_TYPE_DEFAULT, "Removing existing files from %@", buf, 0xCu);
            }
            id v113 = 0;
            char v37 = [v101 removeItemAtPath:v35 error:&v113];
            id v22 = v113;
            if ((v37 & 1) == 0)
            {
              objc_super v38 = self->_log;
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v124 = v35;
                __int16 v125 = 2112;
                id v126 = v22;
                _os_log_impl(&dword_22135E000, v38, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);
              }
            }
          }
          else
          {
            id v22 = 0;
          }
          v21 = v101;
          goto LABEL_53;
        }
      }
      else
      {
LABEL_38:

        id v22 = 0;
        id v13 = v94;
        double v7 = v96;
        v15 = v98;
      }
      v21 = v101;
    }
    v39 = self->_log;
    v100 = v18;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v39, OS_LOG_TYPE_DEFAULT, "Could not find existing compiled model.", buf, 2u);
    }
    v24 = 0;
LABEL_53:
    v40 = [v24 path];
    uint64_t v41 = v21;
    int v42 = [v21 fileExistsAtPath:v40 isDirectory:&v120];

    if (v42)
    {
      id v112 = v22;
      v43 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v24 error:&v112];
      id v25 = v112;

      v44 = self->_log;
      if (v25)
      {
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:]();
        }
        id v19 = 0;
      }
      else
      {
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22135E000, v44, OS_LOG_TYPE_DEFAULT, "Load existing compiled model.", buf, 2u);
        }
        id v19 = v43;
      }

      v21 = v41;
      id v18 = v100;
      goto LABEL_100;
    }
    v93 = v24;
    v95 = v13;
    v97 = v7;
    v99 = v15;
    v45 = NSString;
    v46 = [v41 temporaryDirectory];
    v47 = [v46 path];
    v130[0] = v47;
    v48 = [MEMORY[0x263F08C38] UUID];
    v49 = [v48 UUIDString];
    v130[1] = v49;
    v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v130 count:2];
    uint64_t v51 = [v45 pathWithComponents:v50];

    v52 = (void *)v51;
    id v111 = v22;
    LOBYTE(v51) = [v41 createDirectoryAtPath:v51 withIntermediateDirectories:1 attributes:0 error:&v111];
    id v25 = v111;

    v91 = v52;
    if ((v51 & 1) == 0)
    {
      v15 = v99;
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.7();
      }
      id v19 = 0;
      id v13 = v95;
      double v7 = v97;
      v21 = v41;
      id v18 = v100;
      v24 = v93;
      goto LABEL_99;
    }
    v53 = NSURL;
    v129[0] = v52;
    uint64_t v54 = [v6 lastPathComponent];
    v129[1] = v54;
    v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v129 count:2];
    v56 = [v53 fileURLWithPathComponents:v55];

    v90 = v56;
    v57 = [v56 path];
    id v110 = v25;
    v102 = v41;
    LOBYTE(v54) = [v41 copyItemAtPath:v6 toPath:v57 error:&v110];
    id v58 = v110;

    v15 = v99;
    if ((v54 & 1) == 0)
    {
      v65 = self->_log;
      id v13 = v95;
      double v7 = v97;
      id v18 = v100;
      v24 = v93;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v124 = v6;
        __int16 v125 = 2112;
        id v126 = v90;
        __int16 v127 = 2112;
        id v128 = v58;
        _os_log_error_impl(&dword_22135E000, v65, OS_LOG_TYPE_ERROR, "Failed to copy model from %@ to %@ -- %@", buf, 0x20u);
      }
      id v19 = 0;
      v21 = v102;
      goto LABEL_98;
    }
    v59 = NSURL;
    v122 = @"/var/mobile/Library/PowerUI";
    v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v122 count:1];
    uint64_t v61 = [v59 fileURLWithPathComponents:v60];

    id v18 = v100;
    v24 = v93;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
      -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.6();
    }
    v62 = (void *)MEMORY[0x263F00D28];
    v63 = [MEMORY[0x263F00D30] defaultOptions];
    id v109 = 0;
    v87 = (void *)v61;
    v64 = [v62 compileSpecificationAtURL:v90 toURL:v61 options:v63 error:&v109];
    id v58 = v109;

    id v13 = v95;
    double v7 = v97;
    v86 = v64;
    if (v58)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.5();
      }
    }
    else
    {
      long long v107 = 0u;
      long long v108 = 0u;
      long long v105 = 0u;
      long long v106 = 0u;
      id obj = [v64 outputFiles];
      uint64_t v66 = [obj countByEnumeratingWithState:&v105 objects:v121 count:16];
      if (v66)
      {
        uint64_t v67 = v66;
        uint64_t v68 = *(void *)v106;
LABEL_79:
        uint64_t v69 = 0;
        while (1)
        {
          if (*(void *)v106 != v68) {
            objc_enumerationMutation(obj);
          }
          v70 = *(void **)(*((void *)&v105 + 1) + 8 * v69);
          v71 = [v70 pathComponents];
          v72 = [v71 lastObject];
          char v73 = [@"coremldata.bin" isEqualToString:v72];

          if (v73) {
            break;
          }
          if (v67 == ++v69)
          {
            uint64_t v67 = [obj countByEnumeratingWithState:&v105 objects:v121 count:16];
            if (v67) {
              goto LABEL_79;
            }
            goto LABEL_85;
          }
        }
        v74 = NSURL;
        v75 = [v70 pathComponents];
        v76 = [v70 pathComponents];
        v77 = objc_msgSend(v75, "subarrayWithRange:", 0, objc_msgSend(v76, "count") - 1);
        v78 = [v74 fileURLWithPathComponents:v77];

        if (!v78) {
          goto LABEL_93;
        }
        id v13 = v95;
        double v7 = v97;
        v15 = v99;
        v24 = v93;
        if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
          -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:].cold.4();
        }
        id v104 = 0;
        id obja = [MEMORY[0x263F00D80] modelWithContentsOfURL:v78 error:&v104];
        id v79 = v104;
        if (v79)
        {
          id v58 = v79;
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
            -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:]();
          }
          id v19 = 0;
          v80 = obja;
        }
        else
        {
          id v103 = 0;
          char v83 = [v102 removeItemAtPath:v91 error:&v103];
          id v58 = v103;
          if ((v83 & 1) == 0)
          {
            v84 = self->_log;
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v124 = v91;
              __int16 v125 = 2112;
              id v126 = v58;
              _os_log_impl(&dword_22135E000, v84, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);
            }
          }
          v85 = self->_log;
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22135E000, v85, OS_LOG_TYPE_DEFAULT, "Successfully compiled trial model", buf, 2u);
          }
          +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"End of loadModelFromPath"];
          v80 = obja;
          id v19 = obja;
        }

        goto LABEL_97;
      }
LABEL_85:

LABEL_93:
      v81 = self->_log;
      id v13 = v95;
      double v7 = v97;
      v15 = v99;
      v24 = v93;
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
        -[PowerUITrialManager loadModelFromPath:deleteExistingFiles:](v81);
      }
      id v58 = 0;
    }
    id v19 = 0;
LABEL_97:
    v21 = v102;

LABEL_98:
    id v25 = v58;
LABEL_99:

LABEL_100:
    id v22 = v25;
LABEL_101:

    goto LABEL_102;
  }
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Failed to load model from null path", buf, 2u);
  }
  id v19 = 0;
LABEL_102:

  return v19;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
}

- (NSString)treatmentID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTreatmentID:(id)a3
{
}

- (NSString)experimentID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExperimentID:(id)a3
{
}

- (NSString)trialNamespaceName
{
  return self->_trialNamespaceName;
}

- (void)setTrialNamespaceName:(id)a3
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

- (TRITrackingId)trialTrackingID
{
  return (TRITrackingId *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTrialTrackingID:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSMutableArray)updateHandlers
{
  return self->_updateHandlers;
}

- (void)setUpdateHandlers:(id)a3
{
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void)setDefaultsDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_updateHandlers, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_trialTrackingID, 0);
  objc_storeStrong((id *)&self->_trialNamespaceName, 0);
  objc_storeStrong((id *)&self->_experimentID, 0);
  objc_storeStrong((id *)&self->_treatmentID, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
}

- (void)useTrialEnabledFeature:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_22135E000, v0, OS_LOG_TYPE_ERROR, "No feature factor found for feature: %@", v1, 0xCu);
}

- (void)useTrialEnabledFeature:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  BOOL v3 = a1;
  v4[0] = 67109120;
  v4[1] = [a2 BOOLeanValue];
  _os_log_debug_impl(&dword_22135E000, v3, OS_LOG_TYPE_DEBUG, "Use sleep based predictor: %d", (uint8_t *)v4, 8u);
}

- (void)loadModelFromPath:deleteExistingFiles:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22135E000, v0, v1, "Failed to load model: %@ -- %@");
}

- (void)loadModelFromPath:(os_log_t)log deleteExistingFiles:.cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_22135E000, log, OS_LOG_TYPE_ERROR, "Failed to retrieve path of compiled model.", v1, 2u);
}

- (void)loadModelFromPath:deleteExistingFiles:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_22135E000, v0, v1, "properPath set to: %@", v2, v3, v4, v5, v6);
}

- (void)loadModelFromPath:deleteExistingFiles:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22135E000, v0, v1, "Failed to compile model: %@ -- %@");
}

- (void)loadModelFromPath:deleteExistingFiles:.cold.6()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_22135E000, v0, OS_LOG_TYPE_DEBUG, "modelUrl: %@ -- workingDirURL: %@", v1, 0x16u);
}

- (void)loadModelFromPath:deleteExistingFiles:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22135E000, v0, v1, "Failed to create directory at path %@ -- %@");
}

- (void)loadModelFromPath:deleteExistingFiles:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_22135E000, v0, v1, "Compiled model URL: %@", v2, v3, v4, v5, v6);
}

- (void)loadModelFromPath:deleteExistingFiles:.cold.9()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_22135E000, v0, OS_LOG_TYPE_ERROR, "Failed get files in PowerUI directory: %@", v1, 0xCu);
}

- (void)loadModelFromPath:(uint64_t)a1 deleteExistingFiles:(NSObject *)a2 .cold.10(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = @"/var/mobile/Library/PowerUI";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_22135E000, a2, OS_LOG_TYPE_ERROR, "Failed to create directory at path %@ -- %@", (uint8_t *)&v2, 0x16u);
}

- (void)loadModelFromPath:(os_log_t)log deleteExistingFiles:.cold.11(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22135E000, log, OS_LOG_TYPE_ERROR, "Could not identify asset ID", v1, 2u);
}

- (void)loadModelFromPath:deleteExistingFiles:.cold.12()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_22135E000, v0, v1, "Identified asset ID as: %@", v2, v3, v4, v5, v6);
}

- (void)loadModelFromPath:deleteExistingFiles:.cold.13()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_22135E000, v1, OS_LOG_TYPE_DEBUG, "Request to load model from path: %@ - asked to delete: %d", v2, 0x12u);
}

@end