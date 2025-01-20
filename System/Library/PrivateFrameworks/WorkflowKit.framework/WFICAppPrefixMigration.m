@interface WFICAppPrefixMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFICAppPrefixMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((unint64_t)(WFCompareBundleVersions(a4, @"128") - 1) >= 2)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v7 = objc_msgSend(v5, "objectForKey:", @"WFWorkflowActions", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) objectForKey:@"WFWorkflowActionIdentifier"];
          if (([v12 hasPrefix:@"com.tapbots.Tweetbot3"] & 1) != 0
            || ([v12 hasPrefix:@"com.tapbots.TweetbotPad"] & 1) != 0
            || ([v12 hasPrefix:@"com.flexibits.fantastical2.ipad"] & 1) != 0
            || ([v12 hasPrefix:@"com.flexibits.fantastical2.iphone"] & 1) != 0)
          {

            BOOL v6 = 1;
            goto LABEL_17;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        BOOL v6 = 0;
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
LABEL_17:
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)migrateWorkflow
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(WFWorkflowMigration *)self actions];
  uint64_t v18 = [obj countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = v2;
        v3 = *(void **)(*((void *)&v25 + 1) + 8 * v2);
        v4 = [(WFWorkflowMigration *)self actionIdentifierKey];
        id v5 = [v3 objectForKey:v4];

        v30[0] = @"com.tapbots.Tweetbot3";
        v30[1] = @"com.tapbots.TweetbotPad";
        v31[0] = @"com.tapbots.Tweetbot";
        v31[1] = @"com.tapbots.Tweetbot";
        v30[2] = @"com.flexibits.fantastical2.ipad";
        v30[3] = @"com.flexibits.fantastical2.iphone";
        v31[2] = @"com.flexibits.fantastical2";
        v31[3] = @"com.flexibits.fantastical2";
        BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:4];
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v7 = [v6 allKeys];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v22 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
              if ([v5 hasPrefix:v12])
              {
                v13 = [v6 objectForKey:v12];
                long long v14 = [v5 stringByReplacingOccurrencesOfString:v12 withString:v13];
                long long v15 = [(WFWorkflowMigration *)self actionIdentifierKey];
                [v3 setObject:v14 forKeyedSubscript:v15];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v9);
        }

        uint64_t v2 = v19 + 1;
      }
      while (v19 + 1 != v18);
      uint64_t v18 = [obj countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v18);
  }

  [(WFWorkflowMigration *)self finish];
}

@end