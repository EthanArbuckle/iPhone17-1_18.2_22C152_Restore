@interface PHAMetricReportingTask
- (BOOL)currentPlatformIsSupported;
- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)shouldRunWithGraphManager:(id)a3;
- (NSString)name;
- (double)period;
- (id)incrementalKey;
- (id)taskClassDependencies;
- (int)priority;
- (void)timeoutFatal:(BOOL)a3;
@end

@implementation PHAMetricReportingTask

- (void)timeoutFatal:(BOOL)a3
{
  if (a3) {
    __assert_rtn("-[PHAMetricReportingTask timeoutFatal:]", "PHAMetricReportingTask.m", 110, "NO");
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "PHAMetricReportingTask is stuck", v3, 2u);
  }
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v30 = a4;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  v7 = [v6 availableMetricEvents];
  uint64_t v8 = [v7 count];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
  if (v9)
  {
    double v10 = 1.0 / (double)(unint64_t)(v8 + 1);
    uint64_t v34 = *(void *)v45;
    double v11 = 0.0;
    while (2)
    {
      uint64_t v33 = v9;
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v45 != v34) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if ([v13 shouldReportMetrics])
        {
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __69__PHAMetricReportingTask_runWithGraphManager_progressReporter_error___block_invoke;
          v39[3] = &unk_1E6918A80;
          double v42 = v11;
          double v43 = v10;
          v41 = &v48;
          v32 = v30;
          v40 = v32;
          [v13 gatherMetricsWithProgressBlock:v39];
          if (*((unsigned char *)v49 + 24))
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v55 = 87;
              *(_WORD *)&v55[4] = 2080;
              *(void *)&v55[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnal"
                                   "ysis/Framework/Storytelling/Tasks/PHAMetricReportingTask.m";
              _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            if (a5 && !*a5)
            {
              *a5 = [MEMORY[0x1E4F71EB8] errorForCode:-4];
            }
            goto LABEL_43;
          }
          if ([v13 conformsToProtocol:&unk_1F2939FD8])
          {
            id v14 = v13;
            [v14 payloads];
          }
          else
          {
            id v14 = [v13 payload];
            id v53 = v14;
            [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
          v18 = };

          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v19 = v18;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v52 count:16];
          if (v20)
          {
            uint64_t v21 = *(void *)v36;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v36 != v21) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 8 * j);
                v24 = [v6 analytics];
                v25 = [v13 identifier];
                [v24 sendEvent:v25 withPayload:v23];
              }
              uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v52 count:16];
            }
            while (v20);
          }

          if (*((unsigned char *)v49 + 24))
          {
            *((unsigned char *)v49 + 24) = 1;
LABEL_37:
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v55 = 101;
              *(_WORD *)&v55[4] = 2080;
              *(void *)&v55[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnal"
                                   "ysis/Framework/Storytelling/Tasks/PHAMetricReportingTask.m";
              _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            if (a5 && !*a5)
            {
              *a5 = [MEMORY[0x1E4F71EB8] errorForCode:-4];
            }

LABEL_43:
            goto LABEL_44;
          }
          double v11 = v11 + 1.0;
          char v26 = [v32 isCancelledWithProgress:v10 * v11];
          *((unsigned char *)v49 + 24) = v26;
          if (v26) {
            goto LABEL_37;
          }

          v15 = v40;
        }
        else
        {
          v15 = MEMORY[0x1E4F14500];
          id v16 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v17 = [v13 identifier];
            *(_DWORD *)buf = 138412290;
            *(void *)v55 = v17;
            _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PHAMetricReportingTask] Skipping metrics reporting for event %@.", buf, 0xCu);

            v15 = MEMORY[0x1E4F14500];
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v44 objects:v56 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (*((unsigned char *)v49 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v55 = 104;
      *(_WORD *)&v55[4] = 2080;
      *(void *)&v55[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Fra"
                           "mework/Storytelling/Tasks/PHAMetricReportingTask.m";
      _os_log_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    if (!a5 || *a5)
    {
LABEL_44:
      BOOL v27 = 0;
    }
    else
    {
      [MEMORY[0x1E4F71EB8] errorForCode:-4];
      BOOL v27 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    BOOL v27 = 1;
  }

  _Block_object_dispose(&v48, 8);
  return v27;
}

uint64_t __69__PHAMetricReportingTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v5 + 24))
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [*(id *)(a1 + 32) isCancelledWithProgress:(*(double *)(a1 + 48) + a3) * *(double *)(a1 + 56)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v5 + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a2 = 1;
  }
  return result;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  return 1;
}

- (int)priority
{
  return 1;
}

- (id)taskClassDependencies
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)incrementalKey
{
  return 0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (double)period
{
  int HasInternalDiagnostics = PFOSVariantHasInternalDiagnostics();
  double result = 604800.0;
  if (HasInternalDiagnostics) {
    return 86400.0;
  }
  return result;
}

- (NSString)name
{
  return (NSString *)@"PHAMetricReportingTask";
}

@end