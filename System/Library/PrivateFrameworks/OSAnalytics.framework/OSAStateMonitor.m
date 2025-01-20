@interface OSAStateMonitor
+ (BOOL)processCALogEvent:(id)a3 eventPayload:(id)a4 into:(id *)a5;
+ (id)CALogStateToString:(int64_t)a3;
+ (id)dateForEvent:(id)a3;
+ (id)evaluateCALogStates:(id)a3;
+ (id)keyForEvent:(id)a3;
+ (void)checkAndReportCALogStates;
+ (void)checkCALogWrittenStatus;
+ (void)checkSubmissionStatus;
+ (void)evaluateState;
+ (void)postFailureWithReason:(id)a3;
+ (void)recordEvent:(id)a3;
+ (void)recordEvent:(id)a3 with:(id)a4;
@end

@implementation OSAStateMonitor

+ (void)evaluateState
{
  if (evaluateState_token != -1) {
    dispatch_once(&evaluateState_token, &__block_literal_global_6);
  }
  v2 = OSAStateMonitorLogDomain;
  if (os_log_type_enabled((os_log_t)OSAStateMonitorLogDomain, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A7C6D000, v2, OS_LOG_TYPE_DEFAULT, "Running the state monitor.", v3, 2u);
  }
  +[OSAStateMonitor checkCALogWrittenStatus];
  +[OSAStateMonitor checkSubmissionStatus];
  +[OSAStateMonitor checkAndReportCALogStates];
}

uint64_t __32__OSAStateMonitor_evaluateState__block_invoke()
{
  OSAStateMonitorLogDomain = (uint64_t)os_log_create("com.apple.osanalytics.monitors", "state-monitor");
  return MEMORY[0x1F41817F8]();
}

+ (void)recordEvent:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToString:@"log-submission"] & 1) != 0
    || [v5 isEqualToString:@"ca-log-written"])
  {
    v3 = [MEMORY[0x1E4F1C9C8] now];
    v4 = +[OSAStateMonitor keyForEvent:v5];
    +[OSADefaults setObject:v3 forKey:v4];
  }
  else
  {
    +[OSAStateMonitor recordEvent:v5 with:0];
  }
}

+ (void)recordEvent:(id)a3 with:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14 = @"eventName";
  id v15 = v5;
  v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v9 = (void *)[v8 mutableCopy];

  [v9 addEntriesFromDictionary:v7];
  v10 = NSString;
  v11 = [MEMORY[0x1E4F1C9C8] date];
  [v11 timeIntervalSince1970];
  v13 = objc_msgSend(v10, "stringWithFormat:", @"state-monitor.ca.event.%f", v12, v14, v15, v16);

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    +[OSAStateMonitor recordEvent:with:]();
  }
  +[OSADefaults setObject:v9 forKey:v13];
}

+ (void)checkCALogWrittenStatus
{
  v2 = +[OSAStateMonitor dateForEvent:@"ca-log-written"];
  [v2 timeIntervalSinceNow];
  double v4 = v3;

  if (v4 < -90000.0)
  {
    +[OSAStateMonitor postFailureWithReason:@"Missing CA log after rollover"];
  }
}

+ (void)checkSubmissionStatus
{
  if (!OSAIsRSDDisplay())
  {
    v2 = +[OSAStateMonitor dateForEvent:@"log-submission"];
    [v2 timeIntervalSinceNow];
    double v4 = v3;

    if (v4 < -129600.0)
    {
      +[OSAStateMonitor postFailureWithReason:@"Log submission is overdue"];
    }
  }
}

+ (void)postFailureWithReason:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v4 = OSAStateMonitorLogDomain;
  if (os_log_type_enabled((os_log_t)OSAStateMonitorLogDomain, OS_LOG_TYPE_ERROR)) {
    +[OSAStateMonitor postFailureWithReason:]((uint64_t)v3, v4);
  }
  uint64_t v10 = MEMORY[0x1E4F143A8];
  v11 = v3;
  id v5 = (__CFString *)v3;
  AnalyticsSendEventLazy();
  v12[0] = @"crk";
  v6 = +[OSASystemConfiguration sharedInstance];
  id v7 = [v6 crashReporterKey];
  v12[1] = @"reason";
  v13[0] = v7;
  v8 = @"<unknown>";
  if (v5) {
    v8 = v5;
  }
  v13[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  rtcsc_send(2006, 2006, v9);
}

id __41__OSAStateMonitor_postFailureWithReason___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v1 = @"<unknown>";
  if (*(void *)(a1 + 32)) {
    v1 = *(__CFString **)(a1 + 32);
  }
  double v4 = @"reason";
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

+ (void)checkAndReportCALogStates
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A7C6D000, a2, OS_LOG_TYPE_DEBUG, "Will discard keys: %@", (uint8_t *)&v2, 0xCu);
}

+ (id)keyForEvent:(id)a3
{
  return (id)[NSString stringWithFormat:@"state-monitor.%@", a3];
}

+ (BOOL)processCALogEvent:(id)a3 eventPayload:(id)a4 into:(id *)a5
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (os_log_type_enabled((os_log_t)OSAStateMonitorLogDomain, OS_LOG_TYPE_DEBUG)) {
    +[OSAStateMonitor processCALogEvent:eventPayload:into:]();
  }
  v9 = [MEMORY[0x1E4F1C9C8] now];
  [v9 timeIntervalSinceDate:v7];
  double v11 = v10;

  if (v11 >= 300.0)
  {
    uint64_t v12 = [v8 objectForKeyedSubscript:@"eventName"];
    if (!*a5) {
      *a5 = (id)objc_opt_new();
    }
    if ([v12 isEqualToString:@"ca-2hr-heartbeat"])
    {
      v13 = [v8 objectForKeyedSubscript:@"startTimestamp"];
      v14 = [*a5 objectForKeyedSubscript:v13];
      if (!v14)
      {
        id v15 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
        [*a5 setObject:v15 forKeyedSubscript:v13];

        v14 = [*a5 objectForKeyedSubscript:v13];
      }
      uint64_t v16 = [v14 objectForKeyedSubscript:@"twoHrHeartbeat"];
      uint64_t v17 = [v16 unsignedIntValue];

      v18 = [NSNumber numberWithUnsignedInteger:v17 + 1];
      [v14 setObject:v18 forKeyedSubscript:@"twoHrHeartbeat"];

      v19 = &unk_1EFE25748;
LABEL_16:
      [v14 setObject:v19 forKeyedSubscript:@"lastSuccessfulLogState"];
      [*a5 setObject:v14 forKeyedSubscript:v13];
LABEL_17:

      goto LABEL_18;
    }
    if ([v12 isEqualToString:@"ca-log-written-new"])
    {
      v13 = [v8 objectForKeyedSubscript:@"startTimestamp"];
      v14 = [*a5 objectForKeyedSubscript:v13];
      if (!v14)
      {
        v21 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
        [*a5 setObject:v21 forKeyedSubscript:v13];

        v14 = [*a5 objectForKeyedSubscript:v13];
      }
      v22 = [v8 objectForKeyedSubscript:@"totalHeartbeats"];
      [v14 setObject:v22 forKeyedSubscript:@"totalHeartbeats"];

      v23 = [v8 objectForKeyedSubscript:@"endTimestamp"];
      [v14 setObject:v23 forKeyedSubscript:@"endTimestamp"];

      v24 = [v8 objectForKeyedSubscript:@"logPath"];
      [v14 setObject:v24 forKeyedSubscript:@"logPath"];

      v19 = &unk_1EFE25760;
      goto LABEL_16;
    }
    v69 = v8;
    if ([v12 isEqualToString:@"submission-started"])
    {
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      v13 = [*a5 allKeys];
      uint64_t v26 = [v13 countByEnumeratingWithState:&v90 objects:v100 count:16];
      if (!v26) {
        goto LABEL_18;
      }
      uint64_t v27 = v26;
      v66 = v12;
      uint64_t v28 = *(void *)v91;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v91 != v28) {
            objc_enumerationMutation(v13);
          }
          v30 = [*a5 objectForKeyedSubscript:*(void *)(*((void *)&v90 + 1) + 8 * i)];
          [v30 setObject:v7 forKeyedSubscript:@"lastSubmissionStartTimestamp"];
          [v30 setObject:&unk_1EFE25778 forKeyedSubscript:@"lastSuccessfulLogState"];
        }
        uint64_t v27 = [v13 countByEnumeratingWithState:&v90 objects:v100 count:16];
      }
      while (v27);
      goto LABEL_29;
    }
    if ([v12 isEqualToString:@"submission-found-logs"])
    {
      v13 = [v8 objectForKeyedSubscript:@"foundLogs"];
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      v14 = [*a5 allKeys];
      uint64_t v31 = [v14 countByEnumeratingWithState:&v86 objects:v99 count:16];
      if (!v31) {
        goto LABEL_17;
      }
      uint64_t v32 = v31;
      id v64 = v7;
      v67 = v12;
      uint64_t v33 = *(void *)v87;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v87 != v33) {
            objc_enumerationMutation(v14);
          }
          v35 = objc_msgSend(*a5, "objectForKeyedSubscript:", *(void *)(*((void *)&v86 + 1) + 8 * j), v64);
          v36 = [v35 objectForKeyedSubscript:@"logPath"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 containsObject:v36]) {
            [v35 setObject:&unk_1EFE25790 forKeyedSubscript:@"lastSuccessfulLogState"];
          }
        }
        uint64_t v32 = [v14 countByEnumeratingWithState:&v86 objects:v99 count:16];
      }
      while (v32);
    }
    else if ([v12 isEqualToString:@"submission-logs-added-to-archive"])
    {
      v13 = [v8 objectForKeyedSubscript:@"foundLogs"];
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      v14 = [*a5 allKeys];
      uint64_t v37 = [v14 countByEnumeratingWithState:&v82 objects:v98 count:16];
      if (!v37) {
        goto LABEL_17;
      }
      uint64_t v38 = v37;
      id v64 = v7;
      v67 = v12;
      uint64_t v39 = *(void *)v83;
      do
      {
        for (uint64_t k = 0; k != v38; ++k)
        {
          if (*(void *)v83 != v39) {
            objc_enumerationMutation(v14);
          }
          v41 = objc_msgSend(*a5, "objectForKeyedSubscript:", *(void *)(*((void *)&v82 + 1) + 8 * k), v64);
          v42 = [v41 objectForKeyedSubscript:@"logPath"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 containsObject:v42]) {
            [v41 setObject:&unk_1EFE257A8 forKeyedSubscript:@"lastSuccessfulLogState"];
          }
        }
        uint64_t v38 = [v14 countByEnumeratingWithState:&v82 objects:v98 count:16];
      }
      while (v38);
    }
    else
    {
      if (![v12 isEqualToString:@"submission-http-post-started"])
      {
        if ([v12 isEqualToString:@"ca-log-retired"])
        {
          long long v76 = 0u;
          long long v77 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          v13 = [*a5 allKeys];
          uint64_t v49 = [v13 countByEnumeratingWithState:&v74 objects:v96 count:16];
          if (!v49) {
            goto LABEL_18;
          }
          uint64_t v50 = v49;
          id v65 = v7;
          v66 = v12;
          uint64_t v68 = *(void *)v75;
          do
          {
            for (uint64_t m = 0; m != v50; ++m)
            {
              if (*(void *)v75 != v68) {
                objc_enumerationMutation(v13);
              }
              v52 = objc_msgSend(*a5, "objectForKeyedSubscript:", *(void *)(*((void *)&v74 + 1) + 8 * m), v65);
              v53 = [v52 objectForKeyedSubscript:@"logPath"];
              v54 = [v8 objectForKeyedSubscript:@"logPath"];
              int v55 = [v53 isEqualToString:v54];

              if (v55)
              {
                [v52 setObject:&unk_1EFE257D8 forKeyedSubscript:@"lastSuccessfulLogState"];
                v56 = [v69 objectForKeyedSubscript:@"retiredReason"];
                [v52 setObject:v56 forKeyedSubscript:@"retiredReason"];
              }
              id v8 = v69;
            }
            uint64_t v50 = [v13 countByEnumeratingWithState:&v74 objects:v96 count:16];
          }
          while (v50);
          id v7 = v65;
          goto LABEL_30;
        }
        if (![v12 hasPrefix:@"Error"]) {
          goto LABEL_19;
        }
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        v13 = [*a5 allKeys];
        uint64_t v57 = [v13 countByEnumeratingWithState:&v70 objects:v95 count:16];
        if (!v57)
        {
LABEL_18:

LABEL_19:
          goto LABEL_20;
        }
        uint64_t v58 = v57;
        v66 = v12;
        uint64_t v59 = *(void *)v71;
        do
        {
          for (uint64_t n = 0; n != v58; ++n)
          {
            if (*(void *)v71 != v59) {
              objc_enumerationMutation(v13);
            }
            v61 = [*a5 objectForKeyedSubscript:*(void *)(*((void *)&v70 + 1) + 8 * n)];
            [v61 setObject:v12 forKeyedSubscript:@"lastSubmissionError"];
            v62 = [v69 objectForKeyedSubscript:@"errorDesc"];

            if (v62)
            {
              v63 = [v69 objectForKeyedSubscript:@"errorDesc"];
              [v61 setObject:v63 forKeyedSubscript:@"errorDesc"];
            }
          }
          uint64_t v58 = [v13 countByEnumeratingWithState:&v70 objects:v95 count:16];
        }
        while (v58);
LABEL_29:
        id v8 = v69;
LABEL_30:
        uint64_t v12 = v66;
        goto LABEL_18;
      }
      v13 = [v8 objectForKeyedSubscript:@"foundLogs"];
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      v14 = [*a5 allKeys];
      uint64_t v43 = [v14 countByEnumeratingWithState:&v78 objects:v97 count:16];
      if (!v43) {
        goto LABEL_17;
      }
      uint64_t v44 = v43;
      id v64 = v7;
      v67 = v12;
      uint64_t v45 = *(void *)v79;
      do
      {
        for (iuint64_t i = 0; ii != v44; ++ii)
        {
          if (*(void *)v79 != v45) {
            objc_enumerationMutation(v14);
          }
          v47 = objc_msgSend(*a5, "objectForKeyedSubscript:", *(void *)(*((void *)&v78 + 1) + 8 * ii), v64);
          v48 = [v47 objectForKeyedSubscript:@"logPath"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 containsObject:v48]) {
            [v47 setObject:&unk_1EFE257C0 forKeyedSubscript:@"lastSuccessfulLogState"];
          }
        }
        uint64_t v44 = [v14 countByEnumeratingWithState:&v78 objects:v97 count:16];
      }
      while (v44);
    }
    id v7 = v64;
    uint64_t v12 = v67;
    id v8 = v69;
    goto LABEL_17;
  }
  v20 = OSAStateMonitorLogDomain;
  if (os_log_type_enabled((os_log_t)OSAStateMonitorLogDomain, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7C6D000, v20, OS_LOG_TYPE_DEFAULT, "Event within submission window. Ignoring, will pick up next run.", buf, 2u);
  }
LABEL_20:

  return v11 >= 300.0;
}

+ (id)evaluateCALogStates:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v69 = (id)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v71 = v3;
  obuint64_t j = [v3 allKeys];
  uint64_t v72 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
  if (v72)
  {
    uint64_t v70 = *(void *)v78;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v78 != v70) {
          objc_enumerationMutation(obj);
        }
        uint64_t v73 = v4;
        uint64_t v5 = *(void *)(*((void *)&v77 + 1) + 8 * v4);
        v6 = [v71 objectForKeyedSubscript:v5];
        id v7 = [v6 objectForKeyedSubscript:@"totalHeartbeats"];
        int v8 = [v7 unsignedIntValue];
        v9 = [v6 objectForKeyedSubscript:@"twoHrHeartbeat"];
        int v10 = [v9 unsignedIntValue];

        uint64_t v74 = v5;
        if (v8 != v10)
        {
          double v11 = OSAStateMonitorLogDomain;
          if (os_log_type_enabled((os_log_t)OSAStateMonitorLogDomain, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A7C6D000, v11, OS_LOG_TYPE_DEFAULT, "Identified heartbeat mismatch. Reporting to RTC now.", buf, 2u);
          }
          uint64_t v12 = [v6 objectForKeyedSubscript:@"endTimestamp"];
          v83[0] = @"crk";
          v13 = +[OSASystemConfiguration sharedInstance];
          v14 = [v13 crashReporterKey];
          v84[0] = v14;
          v84[1] = v5;
          v83[1] = @"CA_startTimestamp";
          v83[2] = @"CA_endTimestamp";
          id v15 = &stru_1EFE17BD0;
          if (v12) {
            id v15 = v12;
          }
          v84[2] = v15;
          v83[3] = @"expectedCAHeartbeats";
          uint64_t v16 = [v6 objectForKeyedSubscript:@"twoHrHeartbeat"];
          uint64_t v17 = (void *)v16;
          if (v16) {
            v18 = (void *)v16;
          }
          else {
            v18 = &unk_1EFE257F0;
          }
          v84[3] = v18;
          v83[4] = @"actualCAHeartbeats";
          uint64_t v19 = [v6 objectForKeyedSubscript:@"totalHeartbeats"];
          v20 = (void *)v19;
          if (v19) {
            v21 = (void *)v19;
          }
          else {
            v21 = &unk_1EFE257F0;
          }
          v84[4] = v21;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:5];

          rtcsc_send(2008, 2008, v22);
        }
        v23 = (void *)MEMORY[0x1E4F1C978];
        v24 = [v6 objectForKeyedSubscript:@"lastSubmissionError"];
        v25 = [v6 objectForKeyedSubscript:@"errorDesc"];
        uint64_t v26 = objc_msgSend(v23, "arrayWithObjects:", v24, v25, 0);
        uint64_t v27 = [v26 componentsJoinedByString:@":"];

        long long v75 = [v6 objectForKeyedSubscript:@"endTimestamp"];
        uint64_t v28 = [v6 objectForKeyedSubscript:@"lastSuccessfulLogState"];
        LODWORD(v25) = [v28 isEqualToNumber:&unk_1EFE25778];

        if (v25)
        {
          v29 = [v6 objectForKeyedSubscript:@"logPath"];
          v30 = [MEMORY[0x1E4F28CB8] defaultManager];
          char v31 = [v30 fileExistsAtPath:v29];

          uint64_t v32 = @"ErrorFileNotFound";
          if ((v31 & 1) != 0
            || (objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", @"ErrorFileNotFound"),
                uint64_t v33 = objc_claimAutoreleasedReturnValue(),
                int v34 = [v33 isReadableFileAtPath:v29],
                v33,
                uint64_t v32 = @"ErrorFileNotReadable",
                v34))
          {
            v35 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v32, v27, 0);
            uint64_t v36 = [v35 componentsJoinedByString:@":"];

            uint64_t v27 = (__CFString *)v36;
          }
        }
        uint64_t v37 = [v6 objectForKeyedSubscript:@"lastSuccessfulLogState"];
        int v38 = [v37 isEqualToNumber:&unk_1EFE25790];

        if (v38)
        {
          uint64_t v39 = [v6 objectForKeyedSubscript:@"logPath"];
          v40 = [MEMORY[0x1E4F28CB8] defaultManager];
          char v41 = [v40 fileExistsAtPath:v39];

          v42 = @"ErrorFileNotFound";
          if ((v41 & 1) != 0
            || ([MEMORY[0x1E4F28CB8] defaultManager],
                uint64_t v43 = objc_claimAutoreleasedReturnValue(),
                int v44 = [v43 isReadableFileAtPath:v39],
                v43,
                v42 = @"ErrorFileNotReadable",
                v44))
          {

            uint64_t v27 = v42;
          }
        }
        uint64_t v45 = [v6 objectForKeyedSubscript:@"lastSuccessfulLogState"];
        int v46 = [v45 isEqualToNumber:&unk_1EFE257D8];

        if (v46)
        {
          v47 = [v6 objectForKeyedSubscript:@"retiredReason"];
          char v48 = [v47 isEqualToString:@"submitted"];

          if ((v48 & 1) == 0)
          {
            uint64_t v49 = [v6 objectForKeyedSubscript:@"retiredReason"];

            uint64_t v27 = (__CFString *)v49;
          }
        }
        v81[0] = @"crk";
        uint64_t v50 = +[OSASystemConfiguration sharedInstance];
        v51 = [v50 crashReporterKey];
        v82[0] = v51;
        v82[1] = v5;
        v81[1] = @"CA_startTimestamp";
        v81[2] = @"CA_endTimestamp";
        if (v75) {
          v52 = v75;
        }
        else {
          v52 = &stru_1EFE17BD0;
        }
        v82[2] = v52;
        v81[3] = @"submissionStartTimestamp";
        uint64_t v53 = [v6 objectForKeyedSubscript:@"lastSubmissionStartTimestamp"];
        v54 = (void *)v53;
        int v55 = @"<unknown>";
        if (v53) {
          int v55 = (__CFString *)v53;
        }
        v82[3] = v55;
        v81[4] = @"lastSuccessfulState";
        v56 = [v6 objectForKeyedSubscript:@"lastSuccessfulLogState"];
        uint64_t v57 = +[OSAStateMonitor CALogStateToString:](OSAStateMonitor, "CALogStateToString:", (int)[v56 intValue]);
        uint64_t v58 = (void *)v57;
        v81[5] = @"errorMessage";
        if (v27) {
          uint64_t v59 = v27;
        }
        else {
          uint64_t v59 = &stru_1EFE17BD0;
        }
        v82[4] = v57;
        v82[5] = v59;
        v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v81 count:6];

        rtcsc_send(2007, 2007, v60);
        v61 = objc_opt_new();
        [v61 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
        v62 = [v61 dateFromString:v74];
        if (!v62
          || (([MEMORY[0x1E4F1C9C8] now],
               v63 = objc_claimAutoreleasedReturnValue(),
               [v63 timeIntervalSinceDate:v62],
               double v65 = v64,
               v63,
               v65 > 259200.0)
            ? (int v66 = 1)
            : (int v66 = v46),
              v66 == 1))
        {
          [v69 addObject:v74];
        }

        uint64_t v4 = v73 + 1;
      }
      while (v72 != v73 + 1);
      uint64_t v72 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
    }
    while (v72);
  }

  return v69;
}

+ (id)CALogStateToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 4) {
    return @"Invalid";
  }
  else {
    return off_1E5D201E8[a3 - 2];
  }
}

+ (id)dateForEvent:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[OSAStateMonitor keyForEvent:v3];
  uint64_t v5 = +[OSADefaults objectForKey:v4];

  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      id v9 = v3;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Initializing event date for %{public}@", (uint8_t *)&v8, 0xCu);
    }
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] now];
    v6 = +[OSAStateMonitor keyForEvent:v3];
    +[OSADefaults setObject:v5 forKey:v6];
  }
  return v5;
}

+ (void)recordEvent:with:.cold.1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)v0, 0x16u);
}

+ (void)postFailureWithReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7C6D000, a2, OS_LOG_TYPE_ERROR, "State monitor observed a failure: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)processCALogEvent:eventPayload:into:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(&dword_1A7C6D000, v0, OS_LOG_TYPE_DEBUG, "%{public}s %@", (uint8_t *)v1, 0x16u);
}

@end