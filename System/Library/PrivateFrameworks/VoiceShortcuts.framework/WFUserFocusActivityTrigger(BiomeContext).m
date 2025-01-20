@interface WFUserFocusActivityTrigger(BiomeContext)
- (id)publisherWithScheduler:()BiomeContext;
- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:;
@end

@implementation WFUserFocusActivityTrigger(BiomeContext)

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v7 = a5;
  v8 = [a3 eventBody];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = getWFTriggersLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = [v8 semanticModeIdentifier];
        v11 = [v8 mode];
        v12 = [v8 semanticModeIdentifier];
        int v25 = [v8 isStarting];
        v13 = [a1 activityUniqueIdentifier];
        v14 = [a1 activitySemanticIdentifier];
        *(_DWORD *)buf = 136317186;
        v27 = "-[WFUserFocusActivityTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
        __int16 v28 = 2114;
        v29 = v10;
        __int16 v30 = 2114;
        v31 = v11;
        __int16 v32 = 2114;
        v33 = v12;
        __int16 v34 = 1024;
        int v35 = v25;
        __int16 v36 = 2114;
        v37 = v13;
        __int16 v38 = 2114;
        v39 = v14;
        __int16 v40 = 1024;
        int v41 = [a1 onEnable];
        __int16 v42 = 1024;
        int v43 = [a1 onDisable];
        _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_DEFAULT, "%s Received change for Kettle mode (%{public}@) — incoming change (uuid: %{public}@, id: %{public}@, starting: %i), trigger (uuid: %{public}@, id: %{public}@, onEnable: %i, onDisable: %i)", buf, 0x50u);
      }
      v15 = [a1 activitySemanticIdentifier];

      if (v15)
      {
        v16 = [a1 activitySemanticIdentifier];
        v17 = [v8 semanticModeIdentifier];
        char v18 = [v16 isEqualToString:v17];

        if ((v18 & 1) == 0)
        {
          v19 = getWFTriggersLogObject();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v27 = "-[WFUserFocusActivityTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
            v20 = "%s Received Kettle mode change, but the semantic mode identifier didn't match the trigger's semantic m"
                  "ode identifier, not firing";
LABEL_18:
            _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
            goto LABEL_19;
          }
          goto LABEL_19;
        }
      }
      else
      {
        v21 = [a1 activityUniqueIdentifier];
        v22 = [v8 mode];
        char v23 = [v21 isEqualToString:v22];

        if ((v23 & 1) == 0)
        {
          v19 = getWFTriggersLogObject();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v27 = "-[WFUserFocusActivityTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
            v20 = "%s Received Kettle mode change and the trigger has no semantic mode identifier. The unique identifier "
                  "didn't match the trigger's unique identifier, not firing";
            goto LABEL_18;
          }
LABEL_19:

          v7[2](v7, 0);
LABEL_22:

          goto LABEL_23;
        }
      }
      if [v8 isStarting] && (objc_msgSend(a1, "onEnable"))
      {
        uint64_t v24 = 1;
      }
      else if ([v8 isStarting])
      {
        uint64_t v24 = 0;
      }
      else
      {
        uint64_t v24 = [a1 onDisable];
      }
      v7[2](v7, v24);
      goto LABEL_22;
    }
  }

  v7[2](v7, 0);
LABEL_23:
}

- (id)publisherWithScheduler:()BiomeContext
{
  v3 = (void *)MEMORY[0x1E4F504C8];
  id v4 = a3;
  v5 = [v3 userFocusComputedMode];
  v6 = [v5 publisher];
  v7 = [v6 subscribeOn:v4];

  return v7;
}

@end