@interface WFCreateAlarmMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFCreateAlarmMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"900")) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.alarm.create", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  v2 = self;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id obj = [(WFWorkflowMigration *)self actions];
  uint64_t v3 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v58;
    *(void *)&long long v4 = 136315906;
    long long v43 = v4;
    uint64_t v44 = *(void *)v58;
    v45 = v2;
    do
    {
      uint64_t v7 = 0;
      uint64_t v50 = v5;
      do
      {
        if (*(void *)v58 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v52 = v7;
        v8 = *(void **)(*((void *)&v57 + 1) + 8 * v7);
        v9 = [(WFWorkflowMigration *)v2 actionIdentifierKey];
        v10 = [v8 objectForKeyedSubscript:v9];
        int v11 = [v10 isEqualToString:@"is.workflow.actions.alarm.create"];

        if (v11)
        {
          v12 = [(WFWorkflowMigration *)v2 actionIdentifierKey];
          [v8 setObject:@"com.apple.mobiletimer-framework.MobileTimerIntents.MTCreateAlarmIntent" forKeyedSubscript:v12];

          v13 = [(WFWorkflowMigration *)v2 actionParametersKey];
          v14 = [v8 objectForKeyedSubscript:v13];

          v15 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
          v16 = [v14 objectForKeyedSubscript:@"WFTime"];

          if (v16)
          {
            v17 = [v14 objectForKeyedSubscript:@"WFTime"];
            [v15 setObject:v17 forKey:@"dateComponents"];
          }
          v51 = v15;
          v18 = [v14 objectForKeyedSubscript:@"WFLabel"];

          if (v18)
          {
            v19 = [v14 objectForKeyedSubscript:@"WFLabel"];
            [v15 setObject:v19 forKey:@"label"];
          }
          v20 = [v14 objectForKeyedSubscript:@"WFFrequency"];

          uint64_t v5 = v50;
          if (v20)
          {
            v48 = v14;
            v49 = v8;
            v21 = [v14 objectForKeyedSubscript:@"WFFrequency"];
            uint64_t v22 = objc_opt_class();
            id v23 = v21;
            if (v23 && (objc_opt_isKindOfClass() & 1) == 0)
            {
              v25 = getWFGeneralLogObject();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
              {
                v26 = objc_opt_class();
                *(_DWORD *)buf = v43;
                v66 = "WFEnforceClass";
                __int16 v67 = 2114;
                id v68 = v23;
                __int16 v69 = 2114;
                v70 = v26;
                __int16 v71 = 2114;
                uint64_t v72 = v22;
                id v27 = v26;
                _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
              }
              id v24 = 0;
            }
            else
            {
              id v24 = v23;
            }

            v28 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v24, "count"));
            id v47 = objc_alloc_init(MEMORY[0x1E4F28C10]);
            v29 = [v47 weekdaySymbols];
            long long v53 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            id v30 = v24;
            uint64_t v31 = [v30 countByEnumeratingWithState:&v53 objects:v63 count:16];
            if (v31)
            {
              uint64_t v32 = v31;
              uint64_t v33 = *(void *)v54;
              do
              {
                uint64_t v34 = 0;
                do
                {
                  if (*(void *)v54 != v33) {
                    objc_enumerationMutation(v30);
                  }
                  int v35 = ((uint64_t (*)(void *))softLinkSAAlarmDayOfWeekForString)(*(void **)(*((void *)&v53 + 1) + 8 * v34));
                  uint64_t v36 = 0;
                  uint64_t v37 = 64;
                  switch(v35)
                  {
                    case 0:
                    case 1:
                      goto LABEL_32;
                    case 2:
                      goto LABEL_30;
                    case 3:
                      uint64_t v36 = 1;
                      uint64_t v37 = 1;
                      goto LABEL_30;
                    case 4:
                      uint64_t v36 = 2;
                      uint64_t v37 = 2;
                      goto LABEL_30;
                    case 5:
                      uint64_t v36 = 3;
                      uint64_t v37 = 4;
                      goto LABEL_30;
                    case 6:
                      uint64_t v36 = 4;
                      uint64_t v37 = 8;
                      goto LABEL_30;
                    case 7:
                      uint64_t v36 = 5;
                      uint64_t v37 = 16;
                      goto LABEL_30;
                    case 8:
                      uint64_t v36 = 6;
                      uint64_t v37 = 32;
LABEL_30:
                      v38 = [v29 objectAtIndexedSubscript:v36];
                      uint64_t v36 = v37;
                      break;
                    default:
                      v38 = 0;
                      break;
                  }
                  v61[0] = @"displayString";
                  v61[1] = @"value";
                  v62[0] = v38;
                  v39 = [NSNumber numberWithInteger:v36];
                  v62[1] = v39;
                  v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:2];
                  [v28 addObject:v40];

LABEL_32:
                  ++v34;
                }
                while (v32 != v34);
                uint64_t v41 = [v30 countByEnumeratingWithState:&v53 objects:v63 count:16];
                uint64_t v32 = v41;
              }
              while (v41);
            }

            [v51 setObject:v28 forKey:@"repeatSchedule"];
            uint64_t v6 = v44;
            v2 = v45;
            v8 = v49;
            uint64_t v5 = v50;
            v14 = v48;
          }
          if ([v51 count])
          {
            v42 = [(WFWorkflowMigration *)v2 actionParametersKey];
            [v8 setObject:v51 forKeyedSubscript:v42];
          }
        }
        uint64_t v7 = v52 + 1;
      }
      while (v52 + 1 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v57 objects:v64 count:16];
    }
    while (v5);
  }

  [(WFWorkflowMigration *)v2 finish];
}

@end