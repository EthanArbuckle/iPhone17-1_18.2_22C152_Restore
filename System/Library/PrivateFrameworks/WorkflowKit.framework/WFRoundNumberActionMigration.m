@interface WFRoundNumberActionMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFRoundNumberActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"900")) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.round", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  v2 = self;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = [(WFWorkflowMigration *)self actions];
  uint64_t v3 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = @"is.workflow.actions.round";
    uint64_t v6 = *(void *)v43;
    v38 = v2;
    uint64_t v39 = *(void *)v43;
    do
    {
      uint64_t v7 = 0;
      uint64_t v40 = v4;
      do
      {
        if (*(void *)v43 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v42 + 1) + 8 * v7);
        v9 = [(WFWorkflowMigration *)v2 actionIdentifierKey];
        v10 = [v8 objectForKey:v9];

        if ([v10 isEqualToString:v5])
        {
          v11 = [(WFWorkflowMigration *)v2 actionParametersKey];
          v12 = [v8 objectForKeyedSubscript:v11];

          v13 = [v12 objectForKeyedSubscript:@"WFRoundType"];
          int v14 = [v13 isEqualToString:@"Left of Decimal"];
          int v15 = v14;
          v46[0] = &unk_1F2316A58;
          v46[1] = &unk_1F2316A70;
          v16 = @"Tenths";
          if (v14) {
            v16 = @"Tens Place";
          }
          v47[0] = @"Ones Place";
          v47[1] = v16;
          v17 = @"Hundredths";
          if (v14) {
            v17 = @"Hundreds Place";
          }
          v46[2] = &unk_1F2316A88;
          v46[3] = &unk_1F2316AA0;
          v18 = @"Thousandths";
          if (v14) {
            v18 = @"Thousands";
          }
          v47[2] = v17;
          v47[3] = v18;
          v19 = @"Ten Thousandths";
          if (v14) {
            v19 = @"Ten Thousands";
          }
          v46[4] = &unk_1F2316AB8;
          v46[5] = &unk_1F2316AD0;
          v20 = @"Hundred Thousandths";
          if (v14) {
            v20 = @"Hundred Thousands";
          }
          v47[4] = v19;
          v47[5] = v20;
          v21 = @"Millionths";
          if (v14) {
            v21 = @"Millions";
          }
          v46[6] = &unk_1F2316AE8;
          v46[7] = &unk_1F2316B00;
          v22 = @"Ten Millionths";
          if (v14) {
            v22 = @"10 ^";
          }
          v47[6] = v21;
          v47[7] = v22;
          v23 = @"Hundred Millionths";
          if (v14) {
            v23 = @"10 ^";
          }
          v46[8] = &unk_1F2316B18;
          v46[9] = &unk_1F2316B30;
          v24 = @"Billionths";
          if (v14) {
            v24 = @"10 ^";
          }
          v47[8] = v23;
          v47[9] = v24;
          v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:10];
          v26 = [v12 objectForKey:@"WFRoundType"];

          if (v26)
          {
LABEL_28:
            v28 = [v12 objectForKey:@"WFRoundDecimalPlaces"];
            if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              [v12 setObject:v28 forKey:@"WFRoundTo"];
            }
            else
            {
              v29 = v5;

              v30 = [v12 objectForKey:@"WFRoundDecimalPlaces"];
              uint64_t v31 = [v30 integerValue];
              if (v31 >= 0) {
                uint64_t v32 = v31;
              }
              else {
                uint64_t v32 = -v31;
              }

              v33 = [NSNumber numberWithInteger:v32];
              v28 = [v25 objectForKey:v33];

              if (v28 && ([v28 isEqualToString:@"10 ^"] & 1) == 0)
              {
                [v12 setObject:v28 forKey:@"WFRoundTo"];
              }
              else
              {
                [v12 setObject:@"10 ^" forKey:@"WFRoundTo"];
                if (v15) {
                  uint64_t v34 = v32;
                }
                else {
                  uint64_t v34 = -v32;
                }
                v35 = [NSNumber numberWithInteger:v34];
                [v12 setObject:v35 forKey:@"TenToThePowerOf"];
              }
              id v5 = v29;
              v2 = v38;
            }

            v36 = [v12 objectForKey:@"WFRoundType"];

            if (v36) {
              [v12 removeObjectForKey:@"WFRoundType"];
            }
            v37 = [v12 objectForKey:@"WFRoundDecimalPlaces"];

            if (v37) {
              [v12 removeObjectForKey:@"WFRoundDecimalPlaces"];
            }
          }
          else
          {
            v27 = [v12 objectForKey:@"WFRoundDecimalPlaces"];

            if (v27)
            {
              int v15 = 1;
              goto LABEL_28;
            }
          }

          uint64_t v6 = v39;
          uint64_t v4 = v40;
        }

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v4);
  }

  [(WFWorkflowMigration *)v2 finish];
}

@end