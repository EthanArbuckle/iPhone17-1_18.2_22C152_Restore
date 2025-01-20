@interface WRWorkflow
+ (WRWorkflow)workflowWithName:(id)a3;
+ (WRWorkflow)workflowWithPlist:(id)a3 checkForOverrides:(BOOL)a4 error:(id *)a5;
+ (id)allWorkflows;
+ (id)makeOverridePlistDirectoryWithError:(id *)a3;
+ (id)overridePlistDirectory;
+ (id)plistDirectory;
+ (uint64_t)diagnosticsEnabled;
+ (uint64_t)telemetryEnabled;
+ (void)allWorkflows;
+ (void)diagnosticsEnabled;
+ (void)plistDirectory;
- (BOOL)contextualTelemetryEnabled;
- (BOOL)hasChangesRelativeTo:(id)a3;
- (BOOL)hasMaximumEventDuration;
- (BOOL)hasOverallDiagnosticThresholdInterval;
- (BOOL)isEqual:(id)a3;
- (BOOL)workflowSupportsConcurrentEvents;
- (NSArray)allSignposts;
- (NSArray)endSignpostGroups;
- (NSArray)startSignposts;
- (NSArray)workflowDiagnostics;
- (NSString)contextualTelemetryRawValue;
- (NSString)name;
- (SignpostSupportSubsystemCategoryAllowlist)allowListForAllSignposts;
- (SignpostSupportSubsystemCategoryAllowlist)allowListForDiagnostics;
- (WRWorkflow)initWithEncodedDict:(id)a3 error:(id *)a4;
- (double)maximumEventDuration;
- (double)overallDiagnosticThresholdIntervalSeconds;
- (id)debugDescription;
- (id)encodedDict;
- (id)initWithPlist:(char)a3 telemetryEnabled:(char)a4 diagnosticsEnabled:(int)a5 checkForOverrides:(uint64_t *)a6 error:;
- (id)wrsignpostForSignpostObject:(void *)a1;
- (id)wrsignpostWithName:(void *)a1;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
@end

@implementation WRWorkflow

+ (uint64_t)diagnosticsEnabled
{
  self;
  id v8 = 0;
  v0 = WROverrideDiagnosticsEnablement(&v8);
  id v1 = v8;
  v2 = v1;
  if (v0)
  {
    uint64_t v3 = [v0 BOOLValue];
LABEL_10:
    uint64_t v6 = v3;
    goto LABEL_11;
  }
  if (v1)
  {
    int v4 = *__error();
    v5 = _wrlog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      +[WRWorkflow diagnosticsEnabled]();
    }

    *__error() = v4;
  }
  if ((WRIsSeedBuild() & 1) == 0)
  {
    uint64_t v3 = WRIsAppleInternal();
    goto LABEL_10;
  }
  uint64_t v6 = 1;
LABEL_11:

  return v6;
}

+ (uint64_t)telemetryEnabled
{
  self;
  id v7 = 0;
  v0 = WROverrideTelemetryEnablement(&v7);
  id v1 = v7;
  v2 = v1;
  if (v0)
  {
    uint64_t v3 = [v0 BOOLValue];
  }
  else
  {
    if (v1)
    {
      int v4 = *__error();
      v5 = _wrlog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        +[WRWorkflow diagnosticsEnabled]();
      }

      *__error() = v4;
    }
    uint64_t v3 = 1;
  }

  return v3;
}

+ (id)plistDirectory
{
  self;
  v0 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v1 = [v0 resourceURL];
  if (!v1)
  {
    int v2 = *__error();
    uint64_t v3 = _wrlog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      +[WRWorkflow plistDirectory]();
    }

    *__error() = v2;
  }
  int v4 = [NSURL fileURLWithPath:@"WorkflowPlists" relativeToURL:v1];

  return v4;
}

+ (id)overridePlistDirectory
{
  return (id)[NSURL fileURLWithPath:@"/private/var/db/WorkflowResponsiveness/OverridePlists" isDirectory:1];
}

+ (id)makeOverridePlistDirectoryWithError:(id *)a3
{
  if (geteuid())
  {
    if (a3)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:513 userInfo:0];
      id v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    uint64_t v6 = [a1 overridePlistDirectory];
    id v7 = [MEMORY[0x263F08850] defaultManager];
    int v8 = [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:a3];

    id v5 = 0;
    if (v8) {
      id v5 = v6;
    }
  }

  return v5;
}

+ (id)allWorkflows
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  char v2 = +[WRWorkflow telemetryEnabled]();
  char v3 = +[WRWorkflow diagnosticsEnabled]();
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v72[0] = MEMORY[0x263EF8330];
  v72[1] = 3221225472;
  v72[2] = __26__WRWorkflow_allWorkflows__block_invoke;
  v72[3] = &unk_2655897E0;
  id v6 = v5;
  id v73 = v6;
  char v56 = v3;
  char v57 = v2;
  char v75 = v2;
  char v76 = v3;
  id v53 = v4;
  id v74 = v53;
  id v7 = (void (**)(void, void))MEMORY[0x263E46C40](v72);
  int v8 = [MEMORY[0x263F08850] defaultManager];
  v9 = +[WRWorkflow overridePlistDirectory];
  v10 = [MEMORY[0x263EFF8C0] array];
  v11 = [v8 enumeratorAtURL:v9 includingPropertiesForKeys:v10 options:5 errorHandler:&__block_literal_global_2];

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v68 objects:v83 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v69 != v15) {
          objc_enumerationMutation(v12);
        }
        v7[2](v7, *(void *)(*((void *)&v68 + 1) + 8 * i));
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v68 objects:v83 count:16];
    }
    while (v14);
  }

  v17 = [MEMORY[0x263F08850] defaultManager];
  v18 = +[WRWorkflow plistDirectory]();
  v19 = [MEMORY[0x263EFF8C0] array];
  v20 = [v17 enumeratorAtURL:v18 includingPropertiesForKeys:v19 options:5 errorHandler:0];

  long long v67 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v64 = 0u;
  id v21 = v20;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v64 objects:v82 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v65;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v65 != v24) {
          objc_enumerationMutation(v21);
        }
        v7[2](v7, *(void *)(*((void *)&v64 + 1) + 8 * j));
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v64 objects:v82 count:16];
    }
    while (v23);
  }

  id v63 = 0;
  v26 = WROverrideNewWorkflows((uint64_t *)&v63);
  id v27 = v63;
  id v28 = v27;
  if (v26)
  {
    v51 = v26;
    id v52 = v6;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    obuint64_t j = v26;
    uint64_t v29 = [obj countByEnumeratingWithState:&v59 objects:v81 count:16];
    v30 = v53;
    if (!v29) {
      goto LABEL_37;
    }
    uint64_t v31 = v29;
    uint64_t v55 = *(void *)v60;
    while (1)
    {
      for (uint64_t k = 0; k != v31; ++k)
      {
        v33 = v28;
        if (*(void *)v60 != v55) {
          objc_enumerationMutation(obj);
        }
        v34 = *(void **)(*((void *)&v59 + 1) + 8 * k);
        v35 = objc_msgSend(v34, "objectForKeyedSubscript:", @"name", v51, v52);
        v36 = [WRWorkflow alloc];
        id v58 = v28;
        v37 = -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:](v36, v34, v57, v56, 1, (uint64_t *)&v58);
        id v28 = v58;

        if (!v37)
        {
          v41 = [v28 domain];
          if ([v41 isEqualToString:@"WorkflowResponsivenessError"])
          {
            uint64_t v42 = [v28 code];

            if (v42 == 3)
            {
              int v43 = *__error();
              v44 = _wrlog();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v78 = v35;
                _os_log_impl(&dword_261964000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@: New workflow disabled", buf, 0xCu);
              }
LABEL_34:

              *__error() = v43;
              goto LABEL_35;
            }
          }
          else
          {
          }
          int v43 = *__error();
          v44 = _wrlog();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543618;
            v78 = v35;
            __int16 v79 = 2114;
            id v80 = v28;
            _os_log_fault_impl(&dword_261964000, v44, OS_LOG_TYPE_FAULT, "%{public}@: Unable to create new workflow: %{public}@", buf, 0x16u);
          }
          goto LABEL_34;
        }
        if ([v30 containsObject:v37])
        {
          [v37 name];

          int v38 = *__error();
          v39 = _wrlog();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            v40 = [v37 name];
            *(_DWORD *)buf = 138543362;
            v78 = v40;
            _os_log_impl(&dword_261964000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: New workflow is duplicate of existing workflow (whose settings are already overridden)", buf, 0xCu);
          }
          *__error() = v38;
          v30 = v53;
        }
        else
        {
          [v30 addObject:v37];
        }
LABEL_35:
      }
      uint64_t v31 = [obj countByEnumeratingWithState:&v59 objects:v81 count:16];
      if (!v31)
      {
LABEL_37:

        v26 = v51;
        id v6 = v52;
        goto LABEL_42;
      }
    }
  }
  v30 = v53;
  if (v27)
  {
    int v45 = *__error();
    v46 = _wrlog();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
      +[WRWorkflow allWorkflows]();
    }

    *__error() = v45;
  }
LABEL_42:
  objc_msgSend(v30, "sortUsingSelector:", sel_compare_, v51, v52);
  if (![v30 count])
  {
    int v47 = *__error();
    v48 = _wrlog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
      +[WRWorkflow allWorkflows]();
    }

    *__error() = v47;
  }
  if ([v30 count]) {
    v49 = (void *)[v30 copy];
  }
  else {
    v49 = 0;
  }

  return v49;
}

void __26__WRWorkflow_allWorkflows__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 lastPathComponent];
  id v5 = [v4 stringByDeletingPathExtension];

  if (v5)
  {
    if (([*(id *)(a1 + 32) containsObject:v5] & 1) == 0)
    {
      id v31 = 0;
      id v6 = [NSDictionary dictionaryWithContentsOfURL:v3 error:&v31];
      id v7 = v31;
      if (!v6)
      {
        BOOL v22 = WRIsDisabledWorkflow(v3);
        int v23 = *__error();
        uint64_t v24 = _wrlog();
        v25 = v24;
        if (v22)
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v33 = v5;
            _os_log_impl(&dword_261964000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: Workflow disabled", buf, 0xCu);
          }

          *__error() = v23;
          [*(id *)(a1 + 32) addObject:v5];
        }
        else
        {
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            v33 = v5;
            __int16 v34 = 2114;
            id v35 = v3;
            __int16 v36 = 2112;
            id v37 = v7;
            _os_log_error_impl(&dword_261964000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Unable to read in %{public}@: %@", buf, 0x20u);
          }

          *__error() = v23;
        }
        id v12 = v7;
        goto LABEL_32;
      }
      int v8 = [WRWorkflow alloc];
      char v9 = *(unsigned char *)(a1 + 48);
      char v10 = *(unsigned char *)(a1 + 49);
      id v30 = v7;
      v11 = -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:](v8, v6, v9, v10, 1, (uint64_t *)&v30);
      id v12 = v30;

      if (v11)
      {
        uint64_t v13 = [v11 name];
        char v14 = [v13 isEqual:v5];

        if (v14)
        {
          int v15 = [*(id *)(a1 + 40) containsObject:v11];
          [v11 name];

          int v16 = *__error();
          v17 = _wrlog();
          v18 = v17;
          if (v15)
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              v19 = [v11 name];
              *(_DWORD *)buf = 138543618;
              v33 = v19;
              __int16 v34 = 2114;
              id v35 = v3;
              _os_log_impl(&dword_261964000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring duplicate workflow from %{public}@", buf, 0x16u);
            }
            *__error() = v16;
          }
          else
          {
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              __26__WRWorkflow_allWorkflows__block_invoke_cold_3();
            }

            *__error() = v16;
            [*(id *)(a1 + 40) addObject:v11];
          }
          goto LABEL_31;
        }
        [v11 name];

        int v28 = *__error();
        uint64_t v29 = _wrlog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
          __26__WRWorkflow_allWorkflows__block_invoke_cold_4();
        }
LABEL_30:

        *__error() = v28;
LABEL_31:

LABEL_32:
        goto LABEL_33;
      }
      v26 = [v12 domain];
      if ([v26 isEqualToString:@"WorkflowResponsivenessError"])
      {
        uint64_t v27 = [v12 code];

        if (v27 == 3)
        {
          int v28 = *__error();
          uint64_t v29 = _wrlog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v33 = v5;
            _os_log_impl(&dword_261964000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@: Workflow disabled", buf, 0xCu);
          }
          goto LABEL_30;
        }
      }
      else
      {
      }
      int v28 = *__error();
      uint64_t v29 = _wrlog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        __26__WRWorkflow_allWorkflows__block_invoke_cold_2();
      }
      goto LABEL_30;
    }
  }
  else
  {
    int v20 = *__error();
    id v21 = _wrlog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      __26__WRWorkflow_allWorkflows__block_invoke_cold_1();
    }

    *__error() = v20;
  }
LABEL_33:
}

- (id)initWithPlist:(char)a3 telemetryEnabled:(char)a4 diagnosticsEnabled:(int)a5 checkForOverrides:(uint64_t *)a6 error:
{
  uint64_t v399 = *MEMORY[0x263EF8340];
  id v294 = a2;
  if (!a1)
  {
    v18 = 0;
    goto LABEL_180;
  }
  uint64_t v377 = 0;
  if (a6)
  {
    v293 = a6;
    *a6 = 0;
  }
  else
  {
    v293 = &v377;
  }
  v376.receiver = a1;
  v376.super_class = (Class)WRWorkflow;
  v295 = (id *)objc_msgSendSuper2(&v376, sel_init);

  if (!v295)
  {
    WRMakeError(2, @"Unable to init", v11, v12, v13, v14, v15, v16, v258);
    v18 = 0;
    uint64_t *v293 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
    goto LABEL_179;
  }
  WRCheckForBadWorkflowDict(v294);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t *v293 = (uint64_t)v17;
  if (!v17)
  {
    v290 = [v294 objectForKeyedSubscript:@"name"];
    if (!v290)
    {
      WRMakeError(7, @"No workflow name in workflow plist", v19, v20, v21, v22, v23, v24, v258);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    if (+[WRWorkflowEventTracker isReservedWorkflowName:]((uint64_t)WRWorkflowEventTracker, v290))
    {
      WRMakeError(8, @"Workflow name is reserved: %@", v25, v26, v27, v28, v29, v30, (uint64_t)v290);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v18 = 0;
      uint64_t *v293 = (uint64_t)v31;
LABEL_178:

      goto LABEL_179;
    }
    v32 = v290;
    if (a5)
    {
      id v375 = 0;
      v274 = WROverrideTelemetryEnablementForWorkflow(v290, &v375);
      id v33 = v375;
      if (v274)
      {
        v291 = v33;
        int v34 = [v274 BOOLValue];
        int v35 = *__error();
        __int16 v36 = _wrlog();
        BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
        if (!v34)
        {
          if (v37)
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v290;
            _os_log_impl(&dword_261964000, v36, OS_LOG_TYPE_INFO, "%{public}@: overridden telemetry (disabled)", (uint8_t *)&buf, 0xCu);
          }

          *__error() = v35;
          WRMakeError(3, @"Workflow disabled by override", v55, v56, v57, v58, v59, v60, v258);
          uint64_t *v293 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();

          v18 = 0;
          goto LABEL_177;
        }
        if (v37)
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v290;
          _os_log_impl(&dword_261964000, v36, OS_LOG_TYPE_INFO, "%{public}@: overridden telemetry (enabled)", (uint8_t *)&buf, 0xCu);
        }

        *__error() = v35;
        v32 = v290;
        goto LABEL_28;
      }
      if (v33)
      {
        int v38 = *__error();
        v39 = _wrlog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
          -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:].cold.7();
        }

        *__error() = v38;
      }
      v32 = v290;
    }
    else
    {
      id v33 = 0;
    }
    v291 = v33;
    if ((a3 & 1) == 0)
    {
      WRMakeError(3, @"Workflow disabled", v25, v26, v27, v28, v29, v30, v258);
      v18 = 0;
      uint64_t *v293 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
LABEL_177:

      goto LABEL_178;
    }
    v274 = 0;
LABEL_28:
    uint64_t v40 = [v32 copy];
    id v41 = v295[2];
    v295[2] = (id)v40;

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v397 = 0x2020000000;
    char v398 = 0;
    uint64_t v371 = 0;
    v372 = &v371;
    uint64_t v373 = 0x2020000000;
    char v374 = 0;
    id v42 = objc_alloc_init(MEMORY[0x263F6C5B8]);
    id v43 = v295[7];
    v295[7] = v42;

    id v44 = objc_alloc_init(MEMORY[0x263F6C5B8]);
    id v45 = v295[8];
    v295[8] = v44;

    if (a5)
    {

      id v370 = 0;
      v46 = WROverrideForWorkflow(v290, &v370);
      id v47 = v370;
      v291 = v47;
      if (!v46 && v47)
      {
        int v48 = *__error();
        v49 = _wrlog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
          -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:].cold.6();
        }

        v46 = 0;
        *__error() = v48;
      }
    }
    else
    {
      v46 = 0;
    }
    v50 = [v46 objectForKeyedSubscript:@"maximum_duration"];
    v51 = v50;
    if (!v50)
    {
      v51 = [v294 objectForKeyedSubscript:@"maximum_duration"];
    }
    [v51 doubleValue];
    v269 = v46;
    v295[9] = v52;
    if (!v50) {

    }
    if (a5)
    {

      id v369 = 0;
      id v53 = WROverrideDiagnosticsEnablementForWorkflow(v290, &v369);
      id v54 = v369;
      v291 = v54;
      if (v53)
      {
        a4 = [v53 BOOLValue];
      }
      else if (v54)
      {
        int v61 = *__error();
        long long v62 = _wrlog();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT)) {
          -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:].cold.5();
        }

        *__error() = v61;
      }
    }
    uint64_t v63 = objc_opt_class();
    long long v64 = DictGetArrayOfClass(v294, @"diagnostics", v63, v293);
    v268 = v64;
    if (v64 || !*v293)
    {
      uint64_t v65 = +[WRDiagnostic diagnosticsForWorkflowName:signpostName:diagnosticDicts:diagnosticsEnabled:checkForOverrides:error:]((uint64_t)WRDiagnostic, v290, 0, v64, a4, a5, v293);
      id v66 = v295[6];
      v295[6] = (id)v65;

      if (v295[6])
      {
        *(unsigned char *)(*((void *)&buf + 1) + 24) = 1;
        long long v365 = 0u;
        long long v366 = 0u;
        long long v368 = 0u;
        long long v367 = 0u;
        id v67 = v295[6];
        uint64_t v68 = [v67 countByEnumeratingWithState:&v365 objects:v395 count:16];
        if (v68)
        {
          uint64_t v69 = *(void *)v366;
          while (2)
          {
            for (uint64_t i = 0; i != v68; ++i)
            {
              if (*(void *)v366 != v69) {
                objc_enumerationMutation(v67);
              }
              if ([*(id *)(*((void *)&v365 + 1) + 8 * i) reportOmittingNetworkBoundIntervals])
              {
                char v262 = 1;
                goto LABEL_65;
              }
            }
            uint64_t v68 = [v67 countByEnumeratingWithState:&v365 objects:v395 count:16];
            if (v68) {
              continue;
            }
            break;
          }
        }
        char v262 = 0;
LABEL_65:

        long long v71 = v293;
LABEL_66:
        uint64_t v72 = objc_opt_class();
        __int16 v79 = DictGetArrayOfClass(v294, @"signposts", v72, v71);
        v267 = v79;
        if (!v79)
        {
          if (!*v71)
          {
            v18 = 0;
LABEL_175:

            goto LABEL_176;
          }
          WRMakeError(7, @"No signposts in plist", v73, v74, v75, v76, v77, v78, v258);
          v18 = 0;
          uint64_t *v293 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
LABEL_174:
          __int16 v79 = v267;
          goto LABEL_175;
        }
        id v80 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v79, "count"));
        v81 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
        v82 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
        uint64_t v361 = 0;
        v362 = &v361;
        uint64_t v363 = 0x2020000000;
        char v364 = 0;
        uint64_t v357 = 0;
        v358 = &v357;
        uint64_t v359 = 0x2020000000;
        char v360 = 0;
        id v83 = objc_alloc_init(MEMORY[0x263EFF9C0]);
        v344[0] = MEMORY[0x263EF8330];
        v344[1] = 3221225472;
        v344[2] = __88__WRWorkflow_initWithPlist_telemetryEnabled_diagnosticsEnabled_checkForOverrides_error___block_invoke;
        v344[3] = &unk_265589830;
        v351 = &v361;
        char v355 = a4;
        char v356 = a5;
        id v272 = v290;
        id v345 = v272;
        p_long long buf = &buf;
        id v263 = v83;
        id v346 = v263;
        v353 = &v357;
        id v278 = v80;
        id v347 = v278;
        v270 = v295;
        v348 = v270;
        v354 = &v371;
        id v266 = v81;
        id v349 = v266;
        id v264 = v82;
        id v350 = v264;
        v279 = (void (**)(void, void, void))MEMORY[0x263E46C40](v344);
        long long v342 = 0u;
        long long v343 = 0u;
        long long v340 = 0u;
        long long v341 = 0u;
        id v84 = v79;
        uint64_t v85 = [v84 countByEnumeratingWithState:&v340 objects:v394 count:16];
        if (!v85) {
          goto LABEL_91;
        }
        uint64_t v285 = *(void *)v341;
        do
        {
          for (uint64_t j = 0; j != v85; ++j)
          {
            if (*(void *)v341 != v285) {
              objc_enumerationMutation(v84);
            }
            v87 = *(void **)(*((void *)&v340 + 1) + 8 * j);
            WRCheckForBadSignpostDict(v87);
            id v88 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t *v293 = (uint64_t)v88;
            if (v88) {
              goto LABEL_134;
            }
            v89 = [v87 objectForKeyedSubscript:@"name"];
            if (a5)
            {
              id v339 = 0;
              v90 = WROverrideForSignpost(v272, v89, &v339);
              id v91 = v339;
              v92 = v91;
              if (v90) {
                BOOL v93 = 1;
              }
              else {
                BOOL v93 = v91 == 0;
              }
              if (!v93)
              {
                int v94 = *__error();
                v95 = _wrlog();
                if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)v388 = 138543874;
                  id v389 = v272;
                  __int16 v390 = 2114;
                  v391 = v89;
                  __int16 v392 = 2112;
                  v393 = v92;
                  _os_log_fault_impl(&dword_261964000, v95, OS_LOG_TYPE_FAULT, "%{public}@: %{public}@: Invalid signpost override: %@", v388, 0x20u);
                }

                *__error() = v94;
              }
            }
            else
            {
              v90 = 0;
            }
            v96 = ((void (**)(void, void *, void *))v279)[2](v279, v90, v87);
            v97 = v96;
            if (v96)
            {
              v98 = [v96 domain];
              if (![v98 isEqualToString:@"WorkflowResponsivenessError"])
              {

LABEL_133:
                id v123 = v97;
                uint64_t *v293 = (uint64_t)v123;

LABEL_134:
LABEL_135:
                v18 = 0;
                goto LABEL_173;
              }
              BOOL v99 = [v97 code] == 3;

              if (!v99) {
                goto LABEL_133;
              }
              int v100 = *__error();
              v101 = _wrlog();
              if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v388 = 138543618;
                id v389 = v272;
                __int16 v390 = 2114;
                v391 = v89;
                _os_log_impl(&dword_261964000, v101, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: signpost disabled", v388, 0x16u);
              }

              *__error() = v100;
            }
          }
          uint64_t v85 = [v84 countByEnumeratingWithState:&v340 objects:v394 count:16];
        }
        while (v85);
LABEL_91:

        if (a5)
        {

          id v338 = 0;
          v102 = WROverrideNewSignpostsForWorkflow(v272, (uint64_t *)&v338);
          id v103 = v338;
          id v104 = v103;
          if (v102)
          {
            long long v336 = 0u;
            long long v337 = 0u;
            long long v334 = 0u;
            long long v335 = 0u;
            obuint64_t j = v102;
            uint64_t v105 = [obj countByEnumeratingWithState:&v334 objects:v387 count:16];
            v261 = v102;
            if (!v105) {
              goto LABEL_125;
            }
            id v281 = *(id *)v335;
            while (1)
            {
              uint64_t v286 = v105;
              for (uint64_t k = 0; k != v286; ++k)
              {
                if (*(id *)v335 != v281) {
                  objc_enumerationMutation(obj);
                }
                v107 = *(void **)(*((void *)&v334 + 1) + 8 * k);
                v108 = [v107 objectForKeyedSubscript:@"name"];
                v292 = v104;
                if (v108)
                {
                  long long v332 = 0u;
                  long long v333 = 0u;
                  long long v330 = 0u;
                  long long v331 = 0u;
                  id v109 = v278;
                  uint64_t v110 = [v109 countByEnumeratingWithState:&v330 objects:v386 count:16];
                  if (!v110)
                  {

LABEL_112:
                    v118 = ((void (**)(void, void *, void))v279)[2](v279, v107, 0);

                    if (!v118)
                    {
                      v292 = 0;
                      goto LABEL_123;
                    }
                    v119 = [v118 domain];
                    if ([v119 isEqualToString:@"WorkflowResponsivenessError"])
                    {
                      BOOL v120 = [v118 code] == 3;

                      if (v120)
                      {
                        int v121 = *__error();
                        v122 = _wrlog();
                        if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v388 = 138543618;
                          id v389 = v272;
                          __int16 v390 = 2114;
                          v391 = v108;
                          _os_log_impl(&dword_261964000, v122, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: new signpost disabled", v388, 0x16u);
                        }
LABEL_122:

                        *__error() = v121;
                        v292 = v118;
                        goto LABEL_123;
                      }
                    }
                    else
                    {
                    }
                    int v121 = *__error();
                    v122 = _wrlog();
                    if (os_log_type_enabled(v122, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)v388 = 138543618;
                      id v389 = v272;
                      __int16 v390 = 2112;
                      v391 = v118;
                      _os_log_fault_impl(&dword_261964000, v122, OS_LOG_TYPE_FAULT, "%{public}@: Invalid signpost override: %@", v388, 0x16u);
                    }
                    goto LABEL_122;
                  }
                  char v111 = 0;
                  uint64_t v112 = *(void *)v331;
                  do
                  {
                    for (uint64_t m = 0; m != v110; ++m)
                    {
                      if (*(void *)v331 != v112) {
                        objc_enumerationMutation(v109);
                      }
                      v114 = [*(id *)(*((void *)&v330 + 1) + 8 * m) name];
                      char v115 = [v114 isEqualToString:v108];

                      v111 |= v115;
                    }
                    uint64_t v110 = [v109 countByEnumeratingWithState:&v330 objects:v386 count:16];
                  }
                  while (v110);

                  if ((v111 & 1) == 0) {
                    goto LABEL_112;
                  }
                }
                else
                {
                  int v116 = *__error();
                  v117 = _wrlog();
                  if (os_log_type_enabled(v117, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)v388 = 138543618;
                    id v389 = v272;
                    __int16 v390 = 2112;
                    v391 = v107;
                    _os_log_fault_impl(&dword_261964000, v117, OS_LOG_TYPE_FAULT, "%{public}@: Invalid new signpost with no name: %@", v388, 0x16u);
                  }

                  *__error() = v116;
                }
LABEL_123:

                id v104 = v292;
              }
              uint64_t v105 = [obj countByEnumeratingWithState:&v334 objects:v387 count:16];
              if (!v105)
              {
LABEL_125:
                v291 = v104;

                v102 = v261;
                goto LABEL_141;
              }
            }
          }
          if (v103)
          {
            v291 = v103;
            int v124 = *__error();
            v125 = _wrlog();
            if (os_log_type_enabled(v125, OS_LOG_TYPE_FAULT)) {
              -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:].cold.4();
            }

            *__error() = v124;
          }
          else
          {
            v291 = 0;
          }
LABEL_141:
        }
        if (![v278 count])
        {
          WRMakeError(7, @"No signposts in plist", v126, v127, v128, v129, v130, v131, v258);
          id v147 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_172;
        }
        if (![v266 count])
        {
          WRMakeError(7, @"No start signpost in plist", v132, v133, v134, v135, v136, v137, v258);
          id v147 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_172;
        }
        if (![v264 count])
        {
          WRMakeError(7, @"No end signpost in plist", v138, v139, v140, v141, v142, v143, v258);
          id v147 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_172;
        }
        uint64_t v144 = _WRGetString(v269, v294, @"contextual_telemetry");
        id v145 = v270[10];
        v270[10] = (id)v144;

        id v146 = v270[10];
        if (v146)
        {
          if ([v146 isEqualToString:@"YES"])
          {
            *((unsigned char *)v270 + 9) = 1;
            goto LABEL_156;
          }
          if ([v270[10] isEqualToString:@"NO"])
          {
LABEL_155:
            *((unsigned char *)v270 + 9) = 0;
LABEL_156:
            if (!*((unsigned char *)v358 + 24))
            {
              if ((unint64_t)[v278 count] < 2)
              {
                if ([v270 hasMaximumEventDuration])
                {
                  v172 = [v278 firstObject];
                  [v172 name];

                  int v173 = *__error();
                  v174 = _wrlog();
                  if (os_log_type_enabled(v174, OS_LOG_TYPE_DEBUG))
                  {
                    v175 = [v172 name];
                    -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:]((uint64_t)v272, v175, v388, v174);
                  }

                  *__error() = v173;
                  -[WRSignpostTracker setIsMiddleOfInterval:]((uint64_t)v172, 1);
                  *((unsigned char *)v270 + 8) = 1;

                  goto LABEL_192;
                }
                int v162 = *__error();
                v163 = _wrlog();
                if (os_log_type_enabled(v163, OS_LOG_TYPE_DEBUG)) {
                  -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:]();
                }
              }
              else
              {
                int v162 = *__error();
                v163 = _wrlog();
                if (os_log_type_enabled(v163, OS_LOG_TYPE_DEBUG)) {
                  -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:]();
                }
              }

              *__error() = v162;
              goto LABEL_192;
            }
            if ([v270 hasMaximumEventDuration])
            {
              long long v328 = 0u;
              long long v329 = 0u;
              long long v326 = 0u;
              long long v327 = 0u;
              id v155 = v266;
              uint64_t v156 = [v155 countByEnumeratingWithState:&v326 objects:v385 count:16];
              if (v156)
              {
                uint64_t v157 = *(void *)v327;
                while (2)
                {
                  for (uint64_t n = 0; n != v156; ++n)
                  {
                    if (*(void *)v327 != v157) {
                      objc_enumerationMutation(v155);
                    }
                    v159 = *(void **)(*((void *)&v326 + 1) + 8 * n);
                    v160 = [v159 eventIdentifierFieldName];
                    BOOL v161 = v160 == 0;

                    if (v161)
                    {
                      v165 = [v159 name];
                      WRMakeError(7, @"Workflow supports concurrent events, but start signpost %@ has no event identifier field name", v166, v167, v168, v169, v170, v171, (uint64_t)v165);
                      uint64_t *v293 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();

                      goto LABEL_135;
                    }
                  }
                  uint64_t v156 = [v155 countByEnumeratingWithState:&v326 objects:v385 count:16];
                  if (v156) {
                    continue;
                  }
                  break;
                }
              }

              *((unsigned char *)v270 + 8) = 1;
LABEL_192:
              [v278 sortUsingSelector:sel_compare_];
              uint64_t v176 = [v278 copy];
              id v177 = v270[5];
              v270[5] = (id)v176;

              [v266 sortUsingSelector:sel_compare_];
              uint64_t v178 = [v266 copy];
              id v179 = v270[3];
              v270[3] = (id)v178;

              id v180 = objc_alloc_init(MEMORY[0x263EFF980]);
              v324[0] = MEMORY[0x263EF8330];
              v324[1] = 3221225472;
              v324[2] = __88__WRWorkflow_initWithPlist_telemetryEnabled_diagnosticsEnabled_checkForOverrides_error___block_invoke_99;
              v324[3] = &unk_265589858;
              id v181 = v180;
              id v325 = v181;
              [v264 enumerateKeysAndObjectsUsingBlock:v324];
              [v181 sortUsingComparator:&__block_literal_global_103];
              uint64_t v182 = [v181 copy];
              v280 = v181;
              id v183 = v270[4];
              v270[4] = (id)v182;

              long long v322 = 0u;
              long long v323 = 0u;
              long long v320 = 0u;
              long long v321 = 0u;
              id v282 = v263;
              uint64_t v184 = [v282 countByEnumeratingWithState:&v320 objects:v384 count:16];
              if (v184)
              {
                uint64_t v287 = *(void *)v321;
                do
                {
                  uint64_t v185 = v184;
                  for (iuint64_t i = 0; ii != v185; ++ii)
                  {
                    if (*(void *)v321 != v287) {
                      objc_enumerationMutation(v282);
                    }
                    uint64_t v187 = *(void *)(*((void *)&v320 + 1) + 8 * ii);
                    long long v318 = 0u;
                    long long v319 = 0u;
                    long long v316 = 0u;
                    long long v317 = 0u;
                    id v188 = v270[5];
                    uint64_t v189 = [v188 countByEnumeratingWithState:&v316 objects:v383 count:16];
                    if (v189)
                    {
                      uint64_t v190 = *(void *)v317;
                      do
                      {
                        for (juint64_t j = 0; jj != v189; ++jj)
                        {
                          if (*(void *)v317 != v190) {
                            objc_enumerationMutation(v188);
                          }
                          v192 = *(void **)(*((void *)&v316 + 1) + 8 * jj);
                          v193 = [v192 individuationFieldName];
                          int v194 = [v193 isEqualToString:v187];

                          if (v194)
                          {
                            id v195 = v295[8];
                            v196 = [v192 subsystem];
                            v197 = [v192 category];
                            [v195 addSubsystem:v196 category:v197];
                          }
                        }
                        uint64_t v189 = [v188 countByEnumeratingWithState:&v316 objects:v383 count:16];
                      }
                      while (v189);
                    }
                  }
                  uint64_t v184 = [v282 countByEnumeratingWithState:&v320 objects:v384 count:16];
                }
                while (v184);
              }

              v198 = v295;
              if (v262)
              {
LABEL_209:
                id v199 = v295[7];
                goto LABEL_216;
              }
              if (*(unsigned char *)(*((void *)&buf + 1) + 24))
              {
                if (!*((unsigned char *)v372 + 24)) {
                  goto LABEL_209;
                }
              }
              else
              {
                id v199 = 0;
LABEL_216:
                id v206 = v295[8];
                v295[8] = v199;

                v198 = v295;
              }
              long long v314 = 0u;
              long long v315 = 0u;
              long long v312 = 0u;
              long long v313 = 0u;
              id v283 = v198[6];
              uint64_t v207 = [v283 countByEnumeratingWithState:&v312 objects:v382 count:16];
              if (v207)
              {
                uint64_t v288 = *(void *)v313;
LABEL_219:
                uint64_t v208 = 0;
                while (1)
                {
                  if (*(void *)v313 != v288) {
                    objc_enumerationMutation(v283);
                  }
                  v209 = *(void **)(*((void *)&v312 + 1) + 8 * v208);
                  if ([v209 triggerEventTimeout]
                    && ([v270 hasMaximumEventDuration] & 1) == 0)
                  {
                    v230 = [v209 name];
                    WRMakeError(8, @"Workflow diagnostic %@ has event timeout threshold, but workflow has no maximum duration", v245, v246, v247, v248, v249, v250, (uint64_t)v230);
                    id v251 = (id)objc_claimAutoreleasedReturnValue();
                    goto LABEL_271;
                  }
                  if ([v209 reportOmittingNetworkBoundIntervals] && !*((unsigned char *)v362 + 24)) {
                    break;
                  }
                  v210 = [v209 reportOtherSignpostWithName];

                  if (v210)
                  {
                    long long v310 = 0u;
                    long long v311 = 0u;
                    long long v308 = 0u;
                    long long v309 = 0u;
                    id v211 = v270[5];
                    uint64_t v212 = [v211 countByEnumeratingWithState:&v308 objects:v381 count:16];
                    if (v212)
                    {
                      uint64_t v213 = *(void *)v309;
                      while (2)
                      {
                        for (kuint64_t k = 0; kk != v212; ++kk)
                        {
                          if (*(void *)v309 != v213) {
                            objc_enumerationMutation(v211);
                          }
                          v215 = [*(id *)(*((void *)&v308 + 1) + 8 * kk) name];
                          v216 = [v209 reportOtherSignpostWithName];
                          char v217 = [v215 isEqualToString:v216];

                          if (v217)
                          {

                            goto LABEL_237;
                          }
                        }
                        uint64_t v212 = [v211 countByEnumeratingWithState:&v308 objects:v381 count:16];
                        if (v212) {
                          continue;
                        }
                        break;
                      }
                    }

                    v230 = [v209 name];
                    v259 = [v209 reportOtherSignpostWithName];
                    WRMakeError(8, @"Workflow diagnostic %@ reports signpost %@, but no such signpost exists", v231, v232, v233, v234, v235, v236, (uint64_t)v230);
                    uint64_t *v293 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();

                    goto LABEL_272;
                  }
LABEL_237:
                  if (++v208 == v207)
                  {
                    uint64_t v207 = [v283 countByEnumeratingWithState:&v312 objects:v382 count:16];
                    if (v207) {
                      goto LABEL_219;
                    }
                    goto LABEL_239;
                  }
                }
                v230 = [v209 name];
                WRMakeError(8, @"Workflow diagnostic %@ omits network-bound work, but no network-bound signposts", v252, v253, v254, v255, v256, v257, (uint64_t)v230);
                id v251 = (id)objc_claimAutoreleasedReturnValue();
LABEL_271:
                uint64_t *v293 = (uint64_t)v251;
LABEL_272:

LABEL_273:
                v18 = 0;
                goto LABEL_274;
              }
LABEL_239:

              long long v306 = 0u;
              long long v307 = 0u;
              long long v304 = 0u;
              long long v305 = 0u;
              id obja = v270[5];
              uint64_t v265 = [obja countByEnumeratingWithState:&v304 objects:v380 count:16];
              if (v265)
              {
                *(void *)v273 = *(void *)v305;
                do
                {
                  for (muint64_t m = 0; mm != v265; ++mm)
                  {
                    if (*(void *)v305 != *(void *)v273) {
                      objc_enumerationMutation(obja);
                    }
                    v218 = *(void **)(*((void *)&v304 + 1) + 8 * mm);
                    long long v300 = 0u;
                    long long v301 = 0u;
                    long long v302 = 0u;
                    long long v303 = 0u;
                    v271 = v218;
                    id v284 = [v218 diagnostics];
                    uint64_t v219 = [v284 countByEnumeratingWithState:&v300 objects:v379 count:16];
                    if (v219)
                    {
                      uint64_t v289 = *(void *)v301;
                      while (2)
                      {
                        for (nuint64_t n = 0; nn != v219; ++nn)
                        {
                          if (*(void *)v301 != v289) {
                            objc_enumerationMutation(v284);
                          }
                          v221 = *(void **)(*((void *)&v300 + 1) + 8 * nn);
                          v222 = [v221 reportOtherSignpostWithName];

                          if (v222)
                          {
                            long long v298 = 0u;
                            long long v299 = 0u;
                            long long v296 = 0u;
                            long long v297 = 0u;
                            id v223 = v270[5];
                            uint64_t v224 = [v223 countByEnumeratingWithState:&v296 objects:v378 count:16];
                            if (v224)
                            {
                              uint64_t v225 = *(void *)v297;
                              while (2)
                              {
                                for (uint64_t i1 = 0; i1 != v224; ++i1)
                                {
                                  if (*(void *)v297 != v225) {
                                    objc_enumerationMutation(v223);
                                  }
                                  v227 = [*(id *)(*((void *)&v296 + 1) + 8 * i1) name];
                                  v228 = [v221 reportOtherSignpostWithName];
                                  char v229 = [v227 isEqualToString:v228];

                                  if (v229)
                                  {

                                    goto LABEL_260;
                                  }
                                }
                                uint64_t v224 = [v223 countByEnumeratingWithState:&v296 objects:v378 count:16];
                                if (v224) {
                                  continue;
                                }
                                break;
                              }
                            }

                            v237 = [v271 name];
                            v238 = [v221 name];
                            v260 = [v221 reportOtherSignpostWithName];
                            WRMakeError(8, @"Signpost %@ diagnostic %@ reports other signpost %@, but no such signpost exists", v239, v240, v241, v242, v243, v244, (uint64_t)v237);
                            uint64_t *v293 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();

                            goto LABEL_273;
                          }
LABEL_260:
                          ;
                        }
                        uint64_t v219 = [v284 countByEnumeratingWithState:&v300 objects:v379 count:16];
                        if (v219) {
                          continue;
                        }
                        break;
                      }
                    }
                  }
                  uint64_t v265 = [obja countByEnumeratingWithState:&v304 objects:v380 count:16];
                }
                while (v265);
              }

              v18 = v270;
LABEL_274:

LABEL_173:
              _Block_object_dispose(&v357, 8);
              _Block_object_dispose(&v361, 8);

              goto LABEL_174;
            }
            WRMakeError(7, @"Workflow supports concurrent events, but has no maximum_duration (required by concurrent events)", v149, v150, v151, v152, v153, v154, v258);
            id v147 = (id)objc_claimAutoreleasedReturnValue();
LABEL_172:
            v18 = 0;
            uint64_t *v293 = (uint64_t)v147;
            goto LABEL_173;
          }
          if ([v270[10] isEqualToString:@"seed"])
          {
            if (WRIsSeedBuild())
            {
              char v148 = 1;
              goto LABEL_153;
            }
          }
          else if (![v270[10] isEqualToString:@"internal"])
          {
            WRMakeError(8, @"Workflow contextual telemetry value is invalid: %@", v200, v201, v202, v203, v204, v205, (uint64_t)v270[10]);
            id v147 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_172;
          }
        }
        else if ([v278 count] == 1)
        {
          goto LABEL_155;
        }
        char v148 = WRIsAppleInternal();
LABEL_153:
        *((unsigned char *)v270 + 9) = v148;
        goto LABEL_156;
      }
      long long v71 = v293;
      if (!*v293)
      {
        char v262 = 0;
        goto LABEL_66;
      }
    }
    v18 = 0;
LABEL_176:

    _Block_object_dispose(&v371, 8);
    _Block_object_dispose(&buf, 8);

    goto LABEL_177;
  }
  v18 = 0;
LABEL_179:

LABEL_180:
  return v18;
}

uint64_t __26__WRWorkflow_allWorkflows__block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = *__error();
  id v7 = _wrlog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __26__WRWorkflow_allWorkflows__block_invoke_13_cold_1();
  }

  *__error() = v6;
  return 1;
}

+ (WRWorkflow)workflowWithName:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v3 = a3;
  char v4 = +[WRWorkflow telemetryEnabled]();
  char v5 = +[WRWorkflow diagnosticsEnabled]();
  uint64_t v64 = 0;
  uint64_t v65 = &v64;
  uint64_t v66 = 0x2020000000;
  char v67 = 0;
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __31__WRWorkflow_workflowWithName___block_invoke;
  v59[3] = &unk_265589808;
  id v44 = v3;
  id v60 = v44;
  int v61 = &v64;
  char v42 = v5;
  char v43 = v4;
  char v62 = v4;
  char v63 = v5;
  int v6 = (void (**)(void, void))MEMORY[0x263E46C40](v59);
  id v7 = [MEMORY[0x263F08850] defaultManager];
  int v8 = +[WRWorkflow overridePlistDirectory];
  char v9 = [MEMORY[0x263EFF8C0] array];
  char v10 = [v7 enumeratorAtURL:v8 includingPropertiesForKeys:v9 options:5 errorHandler:0];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v55 objects:v72 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v56 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = v6[2](v6, *(void *)(*((void *)&v55 + 1) + 8 * i));
        if (v15 || *((unsigned char *)v65 + 24))
        {
          id v20 = v11;
          goto LABEL_31;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v55 objects:v72 count:16];
    }
    while (v12);
  }

  uint64_t v16 = [MEMORY[0x263F08850] defaultManager];
  id v17 = +[WRWorkflow plistDirectory]();
  v18 = [MEMORY[0x263EFF8C0] array];
  uint64_t v19 = [v16 enumeratorAtURL:v17 includingPropertiesForKeys:v18 options:5 errorHandler:0];

  long long v54 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v51 = 0u;
  id v20 = v19;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v51 objects:v71 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v52 != v22) {
          objc_enumerationMutation(v20);
        }
        uint64_t v15 = v6[2](v6, *(void *)(*((void *)&v51 + 1) + 8 * j));
        if (v15 || *((unsigned char *)v65 + 24))
        {

          goto LABEL_31;
        }
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v51 objects:v71 count:16];
    }
    while (v21);
  }

  id v50 = 0;
  WROverrideNewWorkflows((uint64_t *)&v50);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v24 = v50;
  id v20 = v24;
  if (v11)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v11 = v11;
    uint64_t v25 = [v11 countByEnumeratingWithState:&v46 objects:v70 count:16];
    if (!v25) {
      goto LABEL_28;
    }
    uint64_t v26 = *(void *)v47;
LABEL_22:
    uint64_t v27 = 0;
    while (1)
    {
      if (*(void *)v47 != v26) {
        objc_enumerationMutation(v11);
      }
      uint64_t v28 = *(void **)(*((void *)&v46 + 1) + 8 * v27);
      uint64_t v29 = [v28 objectForKeyedSubscript:@"name"];
      int v30 = [v29 isEqualToString:v44];

      if (v30) {
        break;
      }
      if (v25 == ++v27)
      {
        uint64_t v25 = [v11 countByEnumeratingWithState:&v46 objects:v70 count:16];
        if (v25) {
          goto LABEL_22;
        }
LABEL_28:

        uint64_t v15 = 0;
LABEL_31:

        goto LABEL_32;
      }
    }
    id v45 = v20;
    uint64_t v15 = -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:]([WRWorkflow alloc], v28, v43, v42, 1, (uint64_t *)&v45);
    id v32 = v45;

    if (v15)
    {
      id v33 = v15;
LABEL_51:

      id v20 = v32;
      goto LABEL_31;
    }
    __int16 v36 = [v32 domain];
    if ([v36 isEqualToString:@"WorkflowResponsivenessError"])
    {
      BOOL v37 = [v32 code] == 3;

      if (v37)
      {
        int v38 = *__error();
        v39 = _wrlog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138543362;
          id v69 = v44;
          _os_log_impl(&dword_261964000, v39, OS_LOG_TYPE_INFO, "%{public}@: New workflow disabled", buf, 0xCu);
        }

        *__error() = v38;
        goto LABEL_51;
      }
    }
    else
    {
    }
    int v40 = *__error();
    id v41 = _wrlog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
      +[WRWorkflow workflowWithName:]();
    }

    *__error() = v40;
    goto LABEL_51;
  }
  if (v24)
  {
    int v34 = *__error();
    int v35 = _wrlog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
      +[WRWorkflow allWorkflows]();
    }

    uint64_t v15 = 0;
    *__error() = v34;
    goto LABEL_31;
  }
  uint64_t v15 = 0;
LABEL_32:

  _Block_object_dispose(&v64, 8);

  return (WRWorkflow *)v15;
}

id *__31__WRWorkflow_workflowWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = [v3 lastPathComponent];
  char v5 = [v4 stringByDeletingPathExtension];

  if (v5)
  {
    if (![v5 isEqual:*(void *)(a1 + 32)])
    {
      v18 = 0;
      goto LABEL_33;
    }
    id v31 = 0;
    int v6 = [NSDictionary dictionaryWithContentsOfURL:v3 error:&v31];
    id v7 = v31;
    if (!v6)
    {
      BOOL v21 = WRIsDisabledWorkflow(v3);
      int v22 = *__error();
      uint64_t v23 = _wrlog();
      id v24 = v23;
      if (v21)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = *(void **)(a1 + 32);
          *(_DWORD *)long long buf = 138543362;
          id v33 = v25;
          _os_log_impl(&dword_261964000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Workflow disabled", buf, 0xCu);
        }

        v18 = 0;
        *__error() = v22;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
      else
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          uint64_t v29 = *(void **)(a1 + 32);
          *(_DWORD *)long long buf = 138543874;
          id v33 = v29;
          __int16 v34 = 2114;
          id v35 = v3;
          __int16 v36 = 2114;
          id v37 = v7;
          _os_log_fault_impl(&dword_261964000, v24, OS_LOG_TYPE_FAULT, "%{public}@: Unable to read in %{public}@: %{public}@", buf, 0x20u);
        }

        v18 = 0;
        *__error() = v22;
      }
      id v12 = v7;
      goto LABEL_32;
    }
    int v8 = [WRWorkflow alloc];
    char v9 = *(unsigned char *)(a1 + 48);
    char v10 = *(unsigned char *)(a1 + 49);
    id v30 = v7;
    id v11 = -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:](v8, v6, v9, v10, 1, (uint64_t *)&v30);
    id v12 = v30;

    if (v11)
    {
      uint64_t v13 = [v11 name];
      char v14 = [v13 isEqual:v5];

      [v11 name];
      int v15 = *__error();
      uint64_t v16 = _wrlog();
      id v17 = v16;
      if (v14)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          __31__WRWorkflow_workflowWithName___block_invoke_cold_3();
        }

        *__error() = v15;
        v18 = v11;
        goto LABEL_31;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        __26__WRWorkflow_allWorkflows__block_invoke_cold_4();
      }
LABEL_30:

      v18 = 0;
      *__error() = v15;
LABEL_31:

LABEL_32:
      goto LABEL_33;
    }
    uint64_t v26 = [v12 domain];
    if ([v26 isEqualToString:@"WorkflowResponsivenessError"])
    {
      uint64_t v27 = [v12 code];

      if (v27 == 3)
      {
        int v15 = *__error();
        id v17 = _wrlog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138543362;
          id v33 = v5;
          _os_log_impl(&dword_261964000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Workflow disabled", buf, 0xCu);
        }
        goto LABEL_30;
      }
    }
    else
    {
    }
    int v15 = *__error();
    id v17 = _wrlog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __26__WRWorkflow_allWorkflows__block_invoke_cold_2();
    }
    goto LABEL_30;
  }
  int v19 = *__error();
  id v20 = _wrlog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    __26__WRWorkflow_allWorkflows__block_invoke_cold_1();
  }

  v18 = 0;
  *__error() = v19;
LABEL_33:

  return v18;
}

+ (WRWorkflow)workflowWithPlist:(id)a3 checkForOverrides:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  char v9 = [v8 lastPathComponent];
  char v10 = [v9 stringByDeletingPathExtension];

  id v11 = objc_alloc(NSDictionary);
  id v12 = [NSURL fileURLWithPath:v8];

  uint64_t v13 = (void *)[v11 initWithContentsOfURL:v12 error:a5];
  if (!v13)
  {
    int v15 = 0;
    goto LABEL_8;
  }
  char v14 = -[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:](objc_alloc((Class)a1), v13, 1, 1, v6, (uint64_t *)a5);
  int v15 = v14;
  if (!v14)
  {
LABEL_8:
    a5 = 0;
    goto LABEL_9;
  }
  uint64_t v16 = [v14 name];
  char v17 = [v16 isEqual:v10];

  if (v17)
  {
    int v15 = v15;
    a5 = v15;
    goto LABEL_9;
  }
  if (a5)
  {
    uint64_t v25 = [v15 name];
    WRMakeError(8, @"Filename \"%@\" doesn't match workflow name \"%@\"", v18, v19, v20, v21, v22, v23, (uint64_t)v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
LABEL_9:

  return (WRWorkflow *)a5;
}

id __88__WRWorkflow_initWithPlist_telemetryEnabled_diagnosticsEnabled_checkForOverrides_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v122 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:0x270D972C8];
  if (v7)
  {
    id v8 = v7;
    int v9 = [v7 BOOLValue];

    if (v9)
    {
LABEL_3:
      uint64_t v16 = WRMakeError(3, @"Signpost disabled", v10, v11, v12, v13, v14, v15, v101);
      goto LABEL_81;
    }
  }
  else
  {
    char v17 = [v6 objectForKeyedSubscript:0x270D972C8];
    char v18 = [v17 BOOLValue];

    if (v18) {
      goto LABEL_3;
    }
  }
  uint64_t v25 = _WRGetString(v5, v6, @"name");
  if (!v25)
  {
    WRMakeError(7, @"No name for signpost", v19, v20, v21, v22, v23, v24, v101);
    goto LABEL_9;
  }
  if (!+[WRWorkflowEventTracker isReservedSignpostName:]((uint64_t)WRWorkflowEventTracker, v25))
  {
    uint64_t v38 = _WRGetString(v5, v6, @"subsystem");
    if (!v38)
    {
      uint64_t v16 = WRMakeError(7, @"No subsystem for signpost %@", v32, v33, v34, v35, v36, v37, (uint64_t)v25);
LABEL_79:

      goto LABEL_80;
    }
    id v45 = _WRGetString(v5, v6, @"category");
    if (!v45)
    {
      uint64_t v16 = WRMakeError(7, @"No category for signpost %@", v39, v40, v41, v42, v43, v44, (uint64_t)v25);
LABEL_78:

      goto LABEL_79;
    }
    long long v46 = [v5 objectForKeyedSubscript:@"start"];
    long long v47 = v46;
    if (v46)
    {
      int v113 = [v46 BOOLValue];
    }
    else
    {
      long long v48 = [v6 objectForKeyedSubscript:@"start"];
      int v113 = [v48 BOOLValue];
    }
    _WRGetString(v5, v6, @"end_group");
    long long v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      int v112 = 1;
    }
    else
    {
      id v50 = [v5 objectForKeyedSubscript:@"end"];
      long long v51 = v50;
      if (v50)
      {
        int v112 = [v50 BOOLValue];
      }
      else
      {
        long long v52 = [v6 objectForKeyedSubscript:@"end"];
        int v112 = [v52 BOOLValue];
      }
    }
    long long v53 = [v5 objectForKeyedSubscript:@"network_bound"];
    if (v53)
    {
      long long v54 = v53;
      int v55 = [v53 BOOLValue];

      if (v55)
      {
LABEL_25:
        char v56 = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
LABEL_28:
        uint64_t v59 = objc_opt_class();
        id v120 = 0;
        id v60 = DictGetArrayOfClass(v6, @"diagnostics", v59, &v120);
        id v61 = v120;
        char v62 = v61;
        if (!v60 && v61)
        {
          id v63 = v61;
          uint64_t v16 = v63;
LABEL_77:

          goto LABEL_78;
        }
        uint64_t v110 = v49;
        char v111 = v45;
        uint64_t v64 = *(void **)(a1 + 32);
        char v65 = *(unsigned char *)(a1 + 112);
        int v66 = *(unsigned __int8 *)(a1 + 113);
        id v119 = v61;
        uint64_t v67 = +[WRDiagnostic diagnosticsForWorkflowName:signpostName:diagnosticDicts:diagnosticsEnabled:checkForOverrides:error:]((uint64_t)WRDiagnostic, v64, v25, v60, v65, v66, (uint64_t *)&v119);
        id v68 = v119;

        id v108 = v68;
        id v109 = (void *)v67;
        if (v67)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
        }
        else if (v68)
        {
          id v63 = v68;
          uint64_t v16 = v63;
          long long v49 = v110;
          id v45 = v111;
          goto LABEL_77;
        }
        id v69 = [v5 objectForKeyedSubscript:@"environment_field_names"];
        long long v70 = v69;
        if (!v69)
        {
          long long v70 = [v6 objectForKeyedSubscript:@"environment_field_names"];
        }
        v107 = [v70 sortedArrayUsingSelector:sel_compare_];
        if (!v69) {

        }
        uint64_t v71 = _WRGetString(v5, v6, @"individuation_field_name");
        uint64_t v78 = (void *)v71;
        long long v49 = v110;
        if (!v71 || ((v113 ^ 1) & 1) != 0)
        {
          if (v71 && ((v112 ^ 1) & 1) == 0) {
            [*(id *)(a1 + 40) addObject:v71];
          }
          v102 = v60;
          uint64_t v80 = _WRGetString(v5, v6, @"event_identifier_field_name");
          if (v80) {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
          }
          LOBYTE(v101) = v56;
          id v103 = v38;
          id v104 = (void *)v80;
          uint64_t v105 = v78;
          v106 = [[WRSignpost alloc] initWithSubsystem:v38 category:v111 name:v25 eventIdentifierFieldName:v80 individuationFieldName:v78 environmentFieldNames:v107 networkBound:v101 diagnostics:v109];
          long long v115 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          id v81 = *(id *)(a1 + 48);
          uint64_t v82 = [v81 countByEnumeratingWithState:&v115 objects:v121 count:16];
          if (v82)
          {
            uint64_t v83 = v82;
            uint64_t v84 = *(void *)v116;
            obuint64_t j = v81;
            while (2)
            {
              for (uint64_t i = 0; i != v83; ++i)
              {
                if (*(void *)v116 != v84) {
                  objc_enumerationMutation(obj);
                }
                v86 = *(void **)(*((void *)&v115 + 1) + 8 * i);
                v87 = [v86 name];
                int v88 = [v87 isEqualToString:v25];

                if (v88)
                {
                  v89 = v106;
                  if ([v86 isEqual:v106]) {
                    v97 = @"Duplicate signpost dictionary for signpost %@";
                  }
                  else {
                    v97 = @"Multiple signposts with name %@";
                  }
                  uint64_t v16 = WRMakeError(8, v97, v91, v92, v93, v94, v95, v96, (uint64_t)v25);
                  id v60 = v102;
                  uint64_t v38 = v103;
                  long long v49 = v110;
                  id v45 = v111;
                  id v63 = v108;
                  goto LABEL_74;
                }
              }
              id v81 = obj;
              uint64_t v83 = [obj countByEnumeratingWithState:&v115 objects:v121 count:16];
              if (v83) {
                continue;
              }
              break;
            }
          }

          v89 = v106;
          [*(id *)(a1 + 48) addObject:v106];
          uint64_t v38 = v103;
          id v45 = v111;
          [*(id *)(*(void *)(a1 + 56) + 56) addSubsystem:v103 category:v111];
          int v90 = v112;
          if (v109) {
            int v90 = 1;
          }
          if ((v113 | v90) == 1) {
            [*(id *)(*(void *)(a1 + 56) + 64) addSubsystem:v103 category:v111];
          }
          else {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;
          }
          long long v49 = v110;
          id v60 = v102;
          id v63 = v108;
          if (v113) {
            [*(id *)(a1 + 64) addObject:v106];
          }
          if (v112)
          {
            if (!v110) {
              long long v49 = @"NOGROUP";
            }
            v98 = [*(id *)(a1 + 72) objectForKeyedSubscript:v49];
            obuint64_t j = v98;
            if (v98)
            {
              [v98 addObject:v106];
            }
            else
            {
              BOOL v99 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v106, 0);
              [*(id *)(a1 + 72) setObject:v99 forKeyedSubscript:v49];

              v89 = v106;
            }
            uint64_t v16 = 0;
LABEL_74:
          }
          else
          {
            uint64_t v16 = 0;
          }

          __int16 v79 = v105;
        }
        else
        {
          uint64_t v16 = WRMakeError(8, @"Start signposts cannot be individuated (%@) for signpost %@", v72, v73, v74, v75, v76, v77, v71);
          __int16 v79 = v78;
          id v45 = v111;
          id v63 = v108;
        }

        goto LABEL_77;
      }
    }
    else
    {
      long long v57 = [v6 objectForKeyedSubscript:@"network_bound"];
      char v58 = [v57 BOOLValue];

      if (v58) {
        goto LABEL_25;
      }
    }
    char v56 = 0;
    goto LABEL_28;
  }
  WRMakeError(8, @"Signpost name is reserved: %@", v26, v27, v28, v29, v30, v31, (uint64_t)v25);
  uint64_t v16 = LABEL_9:;
LABEL_80:

LABEL_81:

  return v16;
}

void __88__WRWorkflow_initWithPlist_telemetryEnabled_diagnosticsEnabled_checkForOverrides_error___block_invoke_99(uint64_t a1, __CFString *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (a2 == @"NOGROUP")
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v6);
          }
          uint64_t v13 = *(void **)(a1 + 32);
          uint64_t v19 = *(void *)(*((void *)&v15 + 1) + 8 * v12);
          uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
          [v13 addObject:v14];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v5 sortedArrayUsingSelector:sel_compare_];
    [v7 addObject:v8];
  }
}

uint64_t __88__WRWorkflow_initWithPlist_telemetryEnabled_diagnosticsEnabled_checkForOverrides_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 count];
  if (v6 >= [v5 count])
  {
    unint64_t v8 = [v4 count];
    if (v8 <= [v5 count])
    {
      if ([v4 count])
      {
        uint64_t v9 = 0;
        while (1)
        {
          uint64_t v10 = [v4 objectAtIndexedSubscript:v9];
          uint64_t v11 = [v5 objectAtIndexedSubscript:v9];
          uint64_t v7 = [v10 compare:v11];

          if (v7) {
            break;
          }
          if (++v9 >= (unint64_t)[v4 count]) {
            goto LABEL_9;
          }
        }
      }
      else
      {
LABEL_9:
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (WRWorkflow)initWithEncodedDict:(id)a3 error:(id *)a4
{
  return (WRWorkflow *)-[WRWorkflow initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:](self, a3, 1, 1, 0, (uint64_t *)a4);
}

- (id)encodedDict
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v4 = [(WRWorkflow *)self name];
  id v5 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"name", 0);

  if ([(WRWorkflow *)self hasMaximumEventDuration])
  {
    unint64_t v6 = NSNumber;
    [(WRWorkflow *)self maximumEventDuration];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
    [v5 setObject:v7 forKeyedSubscript:@"maximum_duration"];
  }
  unint64_t v8 = [(WRWorkflow *)self contextualTelemetryRawValue];
  long long v57 = v5;
  [v5 setObject:v8 forKeyedSubscript:0x270D97188];

  id v9 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v10 = [(WRWorkflow *)self allSignposts];
  id v61 = objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count"));

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  obuint64_t j = [(WRWorkflow *)self allSignposts];
  uint64_t v62 = [obj countByEnumeratingWithState:&v76 objects:v83 count:16];
  if (v62)
  {
    uint64_t v59 = *(void *)v77;
    id v60 = self;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v77 != v59) {
          objc_enumerationMutation(obj);
        }
        uint64_t v63 = v11;
        uint64_t v12 = *(void **)(*((void *)&v76 + 1) + 8 * v11);
        id v13 = objc_alloc(MEMORY[0x263EFF9A0]);
        uint64_t v14 = [v12 name];
        long long v15 = [v12 subsystem];
        long long v16 = [v12 category];
        long long v17 = objc_msgSend(v13, "initWithObjectsAndKeys:", v14, @"name", v15, @"subsystem", v16, @"category", 0);

        long long v18 = [(WRWorkflow *)self startSignposts];
        uint64_t v19 = [v18 indexOfObjectIdenticalTo:v12];

        if (v19 != 0x7FFFFFFFFFFFFFFFLL) {
          [v17 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"start"];
        }
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        uint64_t v20 = [(WRWorkflow *)self endSignpostGroups];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v72 objects:v82 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          LODWORD(v23) = 0;
          uint64_t v24 = *(void *)v73;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v73 != v24) {
                objc_enumerationMutation(v20);
              }
              uint64_t v26 = *(void **)(*((void *)&v72 + 1) + 8 * i);
              if ([v26 indexOfObjectIdenticalTo:v12] != 0x7FFFFFFFFFFFFFFFLL)
              {
                if ((unint64_t)[v26 count] < 2)
                {
                  [v17 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"end"];
                }
                else
                {
                  uint64_t v23 = (v23 + 1);
                  uint64_t v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"group%d", v23);
                  [v17 setObject:v27 forKeyedSubscript:@"end_group"];
                }
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v72 objects:v82 count:16];
          }
          while (v22);
        }

        uint64_t v28 = [v12 individuationFieldName];
        [v17 setObject:v28 forKeyedSubscript:@"individuation_field_name"];

        uint64_t v29 = [v12 environmentFieldNames];
        [v17 setObject:v29 forKeyedSubscript:@"environment_field_names"];

        if ([v12 networkBound]) {
          [v17 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"network_bound"];
        }
        uint64_t v30 = [v12 diagnostics];
        uint64_t v31 = [v30 count];

        if (v31)
        {
          id v32 = objc_alloc(MEMORY[0x263EFF980]);
          uint64_t v33 = [v12 diagnostics];
          uint64_t v34 = objc_msgSend(v32, "initWithCapacity:", objc_msgSend(v33, "count"));

          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          uint64_t v35 = [v12 diagnostics];
          uint64_t v36 = [v35 countByEnumeratingWithState:&v68 objects:v81 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v69;
            do
            {
              for (uint64_t j = 0; j != v37; ++j)
              {
                if (*(void *)v69 != v38) {
                  objc_enumerationMutation(v35);
                }
                uint64_t v40 = [*(id *)(*((void *)&v68 + 1) + 8 * j) encodedDict];
                [v34 addObject:v40];
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v68 objects:v81 count:16];
            }
            while (v37);
          }

          uint64_t v41 = (void *)[v34 copy];
          [v17 setObject:v41 forKeyedSubscript:@"diagnostics"];
        }
        [v61 addObject:v17];

        uint64_t v11 = v63 + 1;
        self = v60;
      }
      while (v63 + 1 != v62);
      uint64_t v62 = [obj countByEnumeratingWithState:&v76 objects:v83 count:16];
    }
    while (v62);
  }

  uint64_t v42 = (void *)[v61 copy];
  [v57 setObject:v42 forKeyedSubscript:@"signposts"];

  uint64_t v43 = [(WRWorkflow *)self workflowDiagnostics];
  uint64_t v44 = [v43 count];

  if (v44)
  {
    id v45 = objc_alloc(MEMORY[0x263EFF980]);
    long long v46 = [(WRWorkflow *)self workflowDiagnostics];
    long long v47 = objc_msgSend(v45, "initWithCapacity:", objc_msgSend(v46, "count"));

    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v48 = [(WRWorkflow *)self workflowDiagnostics];
    uint64_t v49 = [v48 countByEnumeratingWithState:&v64 objects:v80 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v65;
      do
      {
        for (uint64_t k = 0; k != v50; ++k)
        {
          if (*(void *)v65 != v51) {
            objc_enumerationMutation(v48);
          }
          long long v53 = [*(id *)(*((void *)&v64 + 1) + 8 * k) encodedDict];
          [v47 addObject:v53];
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v64 objects:v80 count:16];
      }
      while (v50);
    }

    long long v54 = (void *)[v47 copy];
    [v57 setObject:v54 forKeyedSubscript:@"diagnostics"];
  }
  int v55 = (void *)[v57 copy];

  return v55;
}

- (BOOL)hasChangesRelativeTo:(id)a3
{
  id v4 = a3;
  [(WRWorkflow *)self maximumEventDuration];
  double v6 = v5;
  [v4 maximumEventDuration];
  if (v6 != v7) {
    goto LABEL_36;
  }
  unint64_t v8 = [(WRWorkflow *)self contextualTelemetryRawValue];
  id v9 = [v4 contextualTelemetryRawValue];
  if ((v8 == 0) == (v9 != 0)) {
    goto LABEL_35;
  }
  uint64_t v10 = [(WRWorkflow *)self contextualTelemetryRawValue];
  if (!v10) {
    goto LABEL_8;
  }
  uint64_t v11 = (void *)v10;
  uint64_t v12 = [v4 contextualTelemetryRawValue];
  if (!v12)
  {

LABEL_8:
    goto LABEL_9;
  }
  id v13 = (void *)v12;
  uint64_t v14 = [(WRWorkflow *)self contextualTelemetryRawValue];
  long long v15 = [v4 contextualTelemetryRawValue];
  char v16 = [v14 isEqualToString:v15];

  if ((v16 & 1) == 0) {
    goto LABEL_36;
  }
LABEL_9:
  long long v17 = [(WRWorkflow *)self workflowDiagnostics];
  uint64_t v18 = [v17 count];
  uint64_t v19 = [v4 workflowDiagnostics];
  uint64_t v20 = [v19 count];

  if (v18 == v20)
  {
    uint64_t v21 = [(WRWorkflow *)self workflowDiagnostics];
    uint64_t v22 = [v21 count];

    if (v22)
    {
      unint64_t v23 = 0;
      do
      {
        uint64_t v24 = [(WRWorkflow *)self workflowDiagnostics];
        uint64_t v25 = [v24 objectAtIndexedSubscript:v23];

        uint64_t v26 = [v4 workflowDiagnostics];
        uint64_t v27 = [(id)v26 objectAtIndexedSubscript:v23];

        LOBYTE(v26) = [v25 isEqual:v27];
        if ((v26 & 1) == 0) {
          goto LABEL_36;
        }
        ++v23;
        uint64_t v28 = [(WRWorkflow *)self workflowDiagnostics];
        unint64_t v29 = [v28 count];
      }
      while (v23 < v29);
    }
    uint64_t v30 = [(WRWorkflow *)self allSignposts];
    uint64_t v31 = [v30 count];
    id v32 = [v4 allSignposts];
    uint64_t v33 = [v32 count];

    if (v31 == v33)
    {
      uint64_t v34 = [(WRWorkflow *)self allSignposts];
      uint64_t v35 = [v34 count];

      if (v35)
      {
        unint64_t v36 = 0;
        while (1)
        {
          uint64_t v37 = [(WRWorkflow *)self allSignposts];
          unint64_t v8 = [v37 objectAtIndexedSubscript:v36];

          uint64_t v38 = [v4 allSignposts];
          id v9 = [v38 objectAtIndexedSubscript:v36];

          if (![v8 isEqual:v9] || (-[WRSignpost hasChangesRelativeTo:](v8, v9) & 1) != 0) {
            break;
          }

          ++v36;
          uint64_t v39 = [(WRWorkflow *)self allSignposts];
          unint64_t v40 = [v39 count];

          if (v36 >= v40) {
            goto LABEL_20;
          }
        }
LABEL_35:

        goto LABEL_36;
      }
LABEL_20:
      uint64_t v41 = [(WRWorkflow *)self startSignposts];
      uint64_t v42 = [v41 count];
      uint64_t v43 = [v4 startSignposts];
      uint64_t v44 = [v43 count];

      if (v42 == v44)
      {
        id v45 = [(WRWorkflow *)self startSignposts];
        uint64_t v46 = [v45 count];

        if (v46)
        {
          unint64_t v47 = 0;
          do
          {
            long long v48 = [(WRWorkflow *)self startSignposts];
            uint64_t v49 = [v48 objectAtIndexedSubscript:v47];

            uint64_t v50 = [v4 startSignposts];
            uint64_t v51 = [(id)v50 objectAtIndexedSubscript:v47];

            LOBYTE(v50) = [v49 isEqual:v51];
            if ((v50 & 1) == 0) {
              goto LABEL_36;
            }
            ++v47;
            long long v52 = [(WRWorkflow *)self startSignposts];
            unint64_t v53 = [v52 count];
          }
          while (v47 < v53);
        }
        long long v54 = [(WRWorkflow *)self endSignpostGroups];
        uint64_t v55 = [v54 count];
        char v56 = [v4 endSignpostGroups];
        uint64_t v57 = [v56 count];

        if (v55 == v57)
        {
          char v58 = [(WRWorkflow *)self endSignpostGroups];
          uint64_t v59 = [v58 count];

          if (!v59)
          {
            BOOL v70 = 0;
            goto LABEL_37;
          }
          unint64_t v60 = 0;
          while (1)
          {
            id v61 = [(WRWorkflow *)self endSignpostGroups];
            unint64_t v8 = [v61 objectAtIndexedSubscript:v60];

            uint64_t v62 = [v4 endSignpostGroups];
            id v9 = [v62 objectAtIndexedSubscript:v60];

            uint64_t v63 = [v8 count];
            if (v63 != [v9 count]) {
              goto LABEL_35;
            }
            if ([v8 count])
            {
              uint64_t v64 = 0;
              do
              {
                long long v65 = [v8 objectAtIndexedSubscript:v64];
                long long v66 = [v9 objectAtIndexedSubscript:v64];
                char v67 = [v65 isEqual:v66];

                if ((v67 & 1) == 0) {
                  goto LABEL_35;
                }
              }
              while (++v64 < (unint64_t)[v8 count]);
            }

            ++v60;
            long long v68 = [(WRWorkflow *)self endSignpostGroups];
            unint64_t v69 = [v68 count];

            BOOL v70 = 0;
            if (v60 >= v69) {
              goto LABEL_37;
            }
          }
        }
      }
    }
  }
LABEL_36:
  BOOL v70 = 1;
LABEL_37:

  return v70;
}

- (id)wrsignpostWithName:(void *)a1
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = objc_msgSend(a1, "allSignposts", 0);
    id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v4);
          }
          unint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          id v9 = [v8 name];
          char v10 = [v9 isEqualToString:v3];

          if (v10)
          {
            id v5 = v8;
            goto LABEL_12;
          }
        }
        id v5 = (id)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)wrsignpostForSignpostObject:(void *)a1
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = objc_msgSend(a1, "allSignposts", 0);
    id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          unint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if (-[WRSignpost matchesSignpost:](v8, v3))
          {
            id v5 = v8;
            goto LABEL_12;
          }
        }
        id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WRWorkflow *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(WRWorkflow *)self name];
      double v7 = [(WRWorkflow *)v5 name];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  char v2 = [(WRWorkflow *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = [(WRWorkflow *)self name];
  uint64_t v6 = [v4 name];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)hasMaximumEventDuration
{
  [(WRWorkflow *)self maximumEventDuration];
  return v2 != 0.0;
}

- (id)debugDescription
{
  double v2 = (void *)[[NSString alloc] initWithFormat:@"%@ (%lu signposts)", self->_name, -[NSArray count](self->_allSignposts, "count")];

  return v2;
}

- (double)overallDiagnosticThresholdIntervalSeconds
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v2 = [(WRWorkflow *)self workflowDiagnostics];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  double v4 = 0.0;
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        char v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 hasTriggerThresholdDurationSingle])
        {
          [v8 triggerThresholdDurationSingle];
          double v4 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)hasOverallDiagnosticThresholdInterval
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v2 = [(WRWorkflow *)self workflowDiagnostics];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) hasTriggerThresholdDurationSingle])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)startSignposts
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)endSignpostGroups
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)allSignposts
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)workflowDiagnostics
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (SignpostSupportSubsystemCategoryAllowlist)allowListForAllSignposts
{
  return (SignpostSupportSubsystemCategoryAllowlist *)objc_getProperty(self, a2, 56, 1);
}

- (SignpostSupportSubsystemCategoryAllowlist)allowListForDiagnostics
{
  return (SignpostSupportSubsystemCategoryAllowlist *)objc_getProperty(self, a2, 64, 1);
}

- (double)maximumEventDuration
{
  return self->_maximumEventDuration;
}

- (BOOL)workflowSupportsConcurrentEvents
{
  return self->_workflowSupportsConcurrentEvents;
}

- (BOOL)contextualTelemetryEnabled
{
  return self->_contextualTelemetryEnabled;
}

- (NSString)contextualTelemetryRawValue
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualTelemetryRawValue, 0);
  objc_storeStrong((id *)&self->_allowListForDiagnostics, 0);
  objc_storeStrong((id *)&self->_allowListForAllSignposts, 0);
  objc_storeStrong((id *)&self->_workflowDiagnostics, 0);
  objc_storeStrong((id *)&self->_allSignposts, 0);
  objc_storeStrong((id *)&self->_endSignpostGroups, 0);
  objc_storeStrong((id *)&self->_startSignposts, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)diagnosticsEnabled
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_261964000, v0, v1, "Error getting diagnotic enablement override: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)plistDirectory
{
  OUTLINED_FUNCTION_7_0();
  _os_log_fault_impl(&dword_261964000, v0, OS_LOG_TYPE_FAULT, "Unable to get resources directory for workflow plists", v1, 2u);
}

+ (void)allWorkflows
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_261964000, v0, v1, "Bad override for new workflows: %{public}@", v2, v3, v4, v5, v6);
}

void __26__WRWorkflow_allWorkflows__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_261964000, v0, v1, "Unable to determine filename for %{public}@", v2, v3, v4, v5, v6);
}

void __26__WRWorkflow_allWorkflows__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_6_0(&dword_261964000, v0, v1, "%{public}@: Unable to create workflow: %{public}@");
}

void __26__WRWorkflow_allWorkflows__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5();
  os_log_t v1 = [v0 name];
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_32(&dword_261964000, v2, v3, "%{public}@: Adding workflow from %{public}@", v4, v5, v6, v7, v8);
}

void __26__WRWorkflow_allWorkflows__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_5();
  os_log_t v1 = [v0 name];
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_2(&dword_261964000, v2, v3, "%{public}@: workflow name doesn't match plist filename %{public}@", v4, v5, v6, v7, v8);
}

- (void)initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_261964000, v0, OS_LOG_TYPE_DEBUG, "%{public}@: Inferring no support of concurrent events due to having multiple signposts", v1, 0xCu);
}

- (void)initWithPlist:(uint8_t *)buf telemetryEnabled:(os_log_t)log diagnosticsEnabled:checkForOverrides:error:.cold.2(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_261964000, log, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@: Inferring support of concurrent events", buf, 0x16u);
}

- (void)initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_261964000, v0, OS_LOG_TYPE_DEBUG, "%{public}@: Inferring no support of concurrent events due to having no maximum duration", v1, 0xCu);
}

- (void)initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:.cold.4()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_1(&dword_261964000, v0, v1, "%{public}@: Invalid new signposts: %@");
}

- (void)initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:.cold.5()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_261964000, v0, v1, "%{public}@: Bad override for diagnostics enablement: %{public}@");
}

- (void)initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:.cold.6()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_261964000, v0, v1, "%{public}@: Bad override workflow: %{public}@");
}

- (void)initWithPlist:telemetryEnabled:diagnosticsEnabled:checkForOverrides:error:.cold.7()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_261964000, v0, v1, "%{public}@: Bad override for telemetry enablement: %{public}@");
}

void __26__WRWorkflow_allWorkflows__block_invoke_13_cold_1()
{
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_6_0(&dword_261964000, v0, v1, "Error with plist file %{public}@: %@");
}

+ (void)workflowWithName:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_261964000, v0, v1, "%{public}@: Unable to create new workflow: %{public}@");
}

void __31__WRWorkflow_workflowWithName___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5();
  os_log_t v1 = [v0 name];
  OUTLINED_FUNCTION_32(&dword_261964000, v2, v3, "%{public}@: Found workflow from %@", v4, v5, v6, v7, 2u);
}

@end