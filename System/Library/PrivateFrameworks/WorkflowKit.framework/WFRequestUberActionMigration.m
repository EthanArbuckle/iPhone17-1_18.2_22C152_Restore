@interface WFRequestUberActionMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFRequestUberActionMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"1050.8")) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"com.ubercab.UberClient.requestuber", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [(WFWorkflowMigration *)self actions];
  uint64_t v3 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = @"UberShowEstimate";
    uint64_t v6 = *(void *)v34;
    uint64_t v30 = *(void *)v34;
    do
    {
      uint64_t v7 = 0;
      uint64_t v31 = v4;
      do
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v33 + 1) + 8 * v7);
        v9 = [(WFWorkflowMigration *)self actionIdentifierKey];
        v10 = [v8 objectForKey:v9];

        if ([v10 isEqualToString:@"com.ubercab.UberClient.requestuber"])
        {
          v11 = [(WFWorkflowMigration *)self actionParametersKey];
          v12 = [v8 objectForKeyedSubscript:v11];

          v13 = [v12 objectForKeyedSubscript:v5];

          if (v13) {
            [v12 removeObjectForKey:v5];
          }
          v14 = v5;
          v15 = [v12 objectForKeyedSubscript:@"UberProductId"];

          if (v15) {
            [v12 removeObjectForKey:@"UberProductId"];
          }
          [v12 setObject:@"com.ubercab.UberClient" forKeyedSubscript:@"IntentAppIdentifier"];
          v16 = objc_msgSend(v12, "wf_popObjectForKey:", @"UberSeatCount");
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = v16;
            if (v17)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v18 = v17;
              }
              else {
                v18 = 0;
              }
            }
            else
            {
              v18 = 0;
            }
            id v19 = v18;

            v20 = NSNumber;
            unint64_t v21 = [v19 integerValue];

            if (v21 <= 1) {
              uint64_t v22 = 1;
            }
            else {
              uint64_t v22 = v21;
            }
            v23 = [v20 numberWithInteger:v22];
            [v12 setObject:v23 forKeyedSubscript:@"PartySize"];
          }
          else
          {
            [v12 setObject:v16 forKeyedSubscript:@"PartySize"];
          }
          v24 = objc_msgSend(v12, "wf_popObjectForKey:", @"UberPickupAt");
          if (v24)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v25 = v24;
            }
            else {
              v25 = 0;
            }
          }
          else
          {
            v25 = 0;
          }
          id v26 = v25;

          if ([v26 isEqualToString:@"Current Location"])
          {
            v27 = [[WFLocationValue alloc] initWithCurrentLocation];
            v28 = [(WFLocationValue *)v27 serializedRepresentation];
            [v12 setValue:v28 forKey:@"PickupLocation"];
          }
          else if ([v26 isEqualToString:@"Custom Location"])
          {
            [v12 removeObjectForKey:@"UberCustomLocation"];
          }
          v29 = [(WFWorkflowMigration *)self actionIdentifierKey];
          [v8 setObject:@"is.workflow.actions.ride.requestride" forKeyedSubscript:v29];

          id v5 = v14;
          uint64_t v6 = v30;
          uint64_t v4 = v31;
        }

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v4);
  }

  [(WFWorkflowMigration *)self finish];
}

@end