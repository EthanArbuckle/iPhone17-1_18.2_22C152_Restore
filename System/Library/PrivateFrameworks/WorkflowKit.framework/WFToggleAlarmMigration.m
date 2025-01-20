@interface WFToggleAlarmMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFToggleAlarmMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"900")) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.alarm.toggle", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = [(WFWorkflowMigration *)self actions];
  uint64_t v3 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v48;
    *(void *)&long long v4 = 136315906;
    long long v43 = v4;
    uint64_t v45 = *(void *)v48;
    do
    {
      uint64_t v7 = 0;
      uint64_t v44 = v5;
      do
      {
        if (*(void *)v48 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v47 + 1) + 8 * v7);
        v9 = [(WFWorkflowMigration *)self actionIdentifierKey];
        v10 = [v8 objectForKeyedSubscript:v9];
        int v11 = [v10 isEqualToString:@"is.workflow.actions.alarm.toggle"];

        if (v11)
        {
          v12 = [(WFWorkflowMigration *)self actionIdentifierKey];
          [v8 setObject:@"com.apple.mobiletimer-framework.MobileTimerIntents.MTToggleAlarmIntent" forKeyedSubscript:v12];

          v13 = [(WFWorkflowMigration *)self actionParametersKey];
          v14 = [v8 objectForKeyedSubscript:v13];

          v15 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
          v16 = [v14 objectForKeyedSubscript:@"WFEnabled"];

          if (v16)
          {
            v17 = [v14 objectForKeyedSubscript:@"WFEnabled"];
            [v15 setObject:v17 forKey:@"enabled"];
          }
          v18 = [v14 objectForKeyedSubscript:@"WFAlarm"];

          if (v18)
          {
            v19 = [v14 objectForKeyedSubscript:@"WFAlarm"];
            uint64_t v20 = objc_opt_class();
            id v21 = v19;
            if (v21 && (objc_opt_isKindOfClass() & 1) == 0)
            {
              v23 = getWFGeneralLogObject();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
              {
                v24 = objc_opt_class();
                *(_DWORD *)buf = v43;
                v55 = "WFEnforceClass";
                __int16 v56 = 2114;
                id v57 = v21;
                __int16 v58 = 2114;
                v59 = v24;
                __int16 v60 = 2114;
                uint64_t v61 = v20;
                id v25 = v24;
                _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
              }
              id v22 = 0;
            }
            else
            {
              id v22 = v21;
            }

            v26 = [MEMORY[0x1E4F1CA60] dictionary];
            v27 = [v22 objectForKeyedSubscript:@"WFAlarmHour"];
            if (v27)
            {

              goto LABEL_19;
            }
            v28 = [v22 objectForKeyedSubscript:@"WFAlarmMinute"];

            if (v28)
            {
LABEL_19:
              v51[0] = @"hour";
              uint64_t v29 = [v22 objectForKeyedSubscript:@"WFAlarmHour"];
              v30 = (void *)v29;
              if (v29) {
                v31 = (void *)v29;
              }
              else {
                v31 = &unk_1F2317238;
              }
              v51[1] = @"minute";
              v52[0] = v31;
              uint64_t v32 = [v22 objectForKeyedSubscript:@"WFAlarmMinute"];
              v33 = (void *)v32;
              if (v32) {
                v34 = (void *)v32;
              }
              else {
                v34 = &unk_1F2317238;
              }
              v52[1] = v34;
              v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
              [v26 setObject:v35 forKey:@"dateComponents"];
            }
            v36 = [v22 objectForKeyedSubscript:@"WFAlarmLabel"];

            if (v36)
            {
              v37 = [v22 objectForKeyedSubscript:@"WFAlarmLabel"];
              [v26 setObject:v37 forKey:@"displayString"];

              v38 = [v22 objectForKeyedSubscript:@"WFAlarmLabel"];
              [v26 setObject:v38 forKey:@"label"];
            }
            v39 = [v22 objectForKeyedSubscript:@"WFAlarmIdentifier"];

            if (v39)
            {
              v40 = [v22 objectForKeyedSubscript:@"WFAlarmIdentifier"];
              v41 = [v40 substringFromIndex:objc_msgSend(@"x-apple-clock:alarm?id=", "length")];
              [v26 setObject:v41 forKey:@"identifier"];
            }
            [v15 setObject:v26 forKey:@"alarm"];

            uint64_t v5 = v44;
          }
          if ([v15 count])
          {
            v42 = [(WFWorkflowMigration *)self actionParametersKey];
            [v8 setObject:v15 forKeyedSubscript:v42];
          }
          uint64_t v6 = v45;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v5);
  }

  [(WFWorkflowMigration *)self finish];
}

@end