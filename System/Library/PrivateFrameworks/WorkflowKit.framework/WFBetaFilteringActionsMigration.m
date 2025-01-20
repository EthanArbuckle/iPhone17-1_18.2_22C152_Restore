@interface WFBetaFilteringActionsMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
+ (id)actionIdentifierMapping;
- (void)migrateWorkflow;
@end

@implementation WFBetaFilteringActionsMigration

+ (id)actionIdentifierMapping
{
  return &unk_1F2317F80;
}

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v4 = a4;
  unint64_t v5 = WFCompareBundleVersions(v4, @"121") - 1;
  uint64_t v6 = WFCompareBundleVersions(v4, @"123");

  return v5 < 2 && v6 == 3;
}

- (void)migrateWorkflow
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v19 = [(id)objc_opt_class() actionIdentifierMapping];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(WFWorkflowMigration *)self actions];
  uint64_t v18 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v3;
        id v4 = *(void **)(*((void *)&v25 + 1) + 8 * v3);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        unint64_t v5 = [v19 allKeys];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v22;
          while (2)
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v22 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
              v11 = [(WFWorkflowMigration *)self actionIdentifierKey];
              v12 = [v4 objectForKeyedSubscript:v11];
              int v13 = [v12 isEqualToString:v10];

              if (v13)
              {
                v14 = [v19 objectForKeyedSubscript:v10];
                v15 = [(WFWorkflowMigration *)self actionIdentifierKey];
                [v4 setObject:v14 forKeyedSubscript:v15];

                goto LABEL_16;
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v7) {
              continue;
            }
            break;
          }
        }
LABEL_16:

        uint64_t v3 = v20 + 1;
      }
      while (v20 + 1 != v18);
      uint64_t v18 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v18);
  }

  [(WFWorkflowMigration *)self finish];
}

@end