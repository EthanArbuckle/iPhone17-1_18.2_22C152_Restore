@interface PHANotificationCoreDuetHelper
+ (BOOL)userIsActivelyUsingAppWithName:(id)a3 error:(id *)a4;
@end

@implementation PHANotificationCoreDuetHelper

+ (BOOL)userIsActivelyUsingAppWithName:(id)a3 error:(id *)a4
{
  v60[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [MEMORY[0x1E4F5B5F8] appInFocusStream];
  v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v8 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v43 = [v7 dateByAddingUnit:16 value:-21 toDate:v8 options:0];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F5B5D0], "predicateForEventsWithStartInDateRangeFrom:to:");
  uint64_t v10 = [MEMORY[0x1E4F5B5D0] predicateForEventsWithStringValue:v5];
  v11 = (void *)MEMORY[0x1E4F28BA0];
  v42 = (void *)v9;
  v60[0] = v9;
  v60[1] = v10;
  v45 = (void *)v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
  uint64_t v13 = [v11 andPredicateWithSubpredicates:v12];

  id v14 = objc_alloc_init(MEMORY[0x1E4F5B518]);
  v59 = v6;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
  [v14 setEventStreams:v15];

  v44 = (void *)v13;
  [v14 setPredicate:v13];
  v16 = [MEMORY[0x1E4F5B560] knowledgeStore];
  id v51 = 0;
  v17 = [v16 executeQuery:v14 error:&v51];
  id v18 = v51;
  v19 = v18;
  v46 = v17;
  if (!v18)
  {
    if ((unint64_t)[v17 count] > 2)
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v27 = v17;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        v39 = v7;
        v40 = v6;
        id v41 = v5;
        uint64_t v30 = *(void *)v48;
        double v31 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v48 != v30) {
              objc_enumerationMutation(v27);
            }
            v33 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            v34 = objc_msgSend(v33, "endDate", v39, v40, v41);
            v35 = [v33 startDate];
            [v34 timeIntervalSinceDate:v35];
            double v31 = v31 + v36;
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v47 objects:v52 count:16];
        }
        while (v29);

        v6 = v40;
        id v5 = v41;
        v7 = v39;
        if (v31 >= 60.0)
        {
          BOOL v23 = 1;
          v21 = v42;
          v20 = (void *)v43;
          goto LABEL_29;
        }
      }
      else
      {

        double v31 = 0.0;
      }
      v21 = v42;
      v20 = (void *)v43;
      if (__PXLoggraph_workerOnceToken != -1) {
        dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_13);
      }
      v37 = __PXLoggraph_workerOSLog;
      if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v54 = v5;
        __int16 v55 = 2048;
        double v56 = v31;
        __int16 v57 = 2048;
        uint64_t v58 = 0x404E000000000000;
        _os_log_impl(&dword_1D21F2000, v37, OS_LOG_TYPE_INFO, "%@ Not used long enough: %.0f < %.0f", buf, 0x20u);
      }
    }
    else
    {
      if (__PXLoggraph_workerOnceToken != -1) {
        dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_10);
      }
      v21 = v42;
      v20 = (void *)v43;
      v24 = (void *)__PXLoggraph_workerOSLog;
      if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
      {
        v25 = v24;
        uint64_t v26 = [v46 count];
        *(_DWORD *)buf = 138412802;
        id v54 = v5;
        __int16 v55 = 2048;
        double v56 = *(double *)&v26;
        __int16 v57 = 2048;
        uint64_t v58 = 3;
        _os_log_impl(&dword_1D21F2000, v25, OS_LOG_TYPE_INFO, "%@ Not launched enough times: %lu < %lu", buf, 0x20u);
      }
    }
    BOOL v23 = 0;
    goto LABEL_29;
  }
  if (a4) {
    *a4 = v18;
  }
  v21 = v42;
  v20 = (void *)v43;
  if (__PXLoggraph_workerOnceToken != -1) {
    dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_6493);
  }
  v22 = __PXLoggraph_workerOSLog;
  if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v54 = v19;
    __int16 v55 = 2112;
    double v56 = *(double *)&v5;
    _os_log_error_impl(&dword_1D21F2000, v22, OS_LOG_TYPE_ERROR, "Error: %@, assuming the user is using the app %@", buf, 0x16u);
  }
  BOOL v23 = 1;
LABEL_29:

  return v23;
}

uint64_t __70__PHANotificationCoreDuetHelper_userIsActivelyUsingAppWithName_error___block_invoke_11()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

uint64_t __70__PHANotificationCoreDuetHelper_userIsActivelyUsingAppWithName_error___block_invoke_8()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

uint64_t __70__PHANotificationCoreDuetHelper_userIsActivelyUsingAppWithName_error___block_invoke()
{
  __PXLoggraph_workerOSLog = (uint64_t)os_log_create("com.apple.photoanalysisd.graph", "worker");

  return MEMORY[0x1F41817F8]();
}

@end