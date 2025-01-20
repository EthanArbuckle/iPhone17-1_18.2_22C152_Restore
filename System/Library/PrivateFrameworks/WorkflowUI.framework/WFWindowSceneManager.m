@interface WFWindowSceneManager
+ (id)existingSceneSessionForEditingWorkflowReference:(id)a3;
+ (id)mainScene;
+ (id)userActivityForEditingWorkflow:(id)a3;
+ (id)workflowIdentifierFromUserActivity:(id)a3;
+ (void)activateSceneForWorkflowReference:(id)a3 sender:(id)a4;
+ (void)setupSession:(id)a3 forEditingWorkflow:(id)a4;
@end

@implementation WFWindowSceneManager

+ (id)mainScene
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = objc_msgSend(MEMORY[0x263F82438], "sharedApplication", 0);
  v3 = [v2 connectedScenes];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(id *)(*((void *)&v14 + 1) + 8 * v7);
      if (v8)
      {
        objc_opt_class();
        id v9 = (objc_opt_isKindOfClass() & 1) != 0 ? v8 : 0;
      }
      else
      {
        id v9 = 0;
      }
      id v10 = v9;

      v11 = [v10 delegate];
      NSClassFromString(&cfstr_Wfmainscenedel.isa);
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }

      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_14:
    id v10 = 0;
  }

  return v10;
}

+ (id)workflowIdentifierFromUserActivity:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 activityType];
  int v5 = [v4 isEqualToString:@"is.workflow.my.app.viewworkflow"];

  if (v5)
  {
    uint64_t v6 = [v3 userInfo];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"WorkflowID"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
  }
  uint64_t v7 = 0;
LABEL_5:

  return v7;
}

+ (id)userActivityForEditingWorkflow:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)MEMORY[0x263F018D0];
  id v4 = a3;
  int v5 = (void *)[[v3 alloc] initWithActivityType:@"is.workflow.my.app.viewworkflow"];
  [v5 setEligibleForHandoff:1];
  [v5 setEligibleForPrediction:1];
  id v9 = @"WorkflowID";
  uint64_t v6 = [v4 identifier];

  v10[0] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 setUserInfo:v7];

  return v5;
}

+ (id)existingSceneSessionForEditingWorkflowReference:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [MEMORY[0x263F82438] sharedApplication];
  int v5 = [v4 openSessions];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v11 = [v10 userInfo];
        v12 = [v11 objectForKey:@"WorkflowID"];
        v13 = [v3 identifier];
        char v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          id v15 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_11:

  return v15;
}

+ (void)setupSession:(id)a3 forEditingWorkflow:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 identifier];

  if (v7)
  {
    id v10 = @"WorkflowID";
    uint64_t v8 = [v6 identifier];
    v11[0] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v5 setUserInfo:v9];
  }
}

+ (void)activateSceneForWorkflowReference:(id)a3 sender:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [a1 userActivityForEditingWorkflow:v7];
  uint64_t v8 = [a1 existingSceneSessionForEditingWorkflowReference:v7];

  id v9 = objc_opt_new();
  [v9 setRequestingScene:v6];

  id v10 = [MEMORY[0x263F82438] sharedApplication];
  [v10 requestSceneSessionActivation:v8 userActivity:v11 options:v9 errorHandler:0];
}

@end