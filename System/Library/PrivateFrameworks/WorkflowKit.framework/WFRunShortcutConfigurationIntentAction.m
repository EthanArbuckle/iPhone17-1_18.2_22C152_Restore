@interface WFRunShortcutConfigurationIntentAction
- (id)parameterOverrides;
- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4;
@end

@implementation WFRunShortcutConfigurationIntentAction

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 valueForKey:@"shortcut"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 identifier];
      v7 = +[WFDatabase defaultDatabase];
      v8 = v7;
      if (!v7)
      {
        v9 = getWFWidgetLogObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v23 = "-[WFRunShortcutConfigurationIntentAction serializedParametersForDonatedIntent:allowDroppingUnconfigurableValues:]";
          _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Failed to get database return empty serialized parameters for WFRunShortcutConfigurationIntentAction", buf, 0xCu);
        }
        v14 = 0;
        goto LABEL_25;
      }
      if (v6)
      {
        v9 = [v7 referenceForWorkflowID:v6 includingTombstones:0];
        if (v9)
        {
LABEL_6:
          v10 = [objc_alloc(MEMORY[0x1E4FB4620]) initWithWorkflow:v9 shortcutsMetadata:0];
          v11 = [v10 asLNValue];
          v12 = v11;
          if (v11)
          {
            v13 = [v11 wfSerializedRepresentation];
            v20 = @"shortcut";
            v21 = v13;
            v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
          }
          else
          {
            v13 = getWFWidgetLogObject();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v23 = "-[WFRunShortcutConfigurationIntentAction serializedParametersForDonatedIntent:allowDroppingUnconfigurableValues:]";
              _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Could not create value from system workflow action", buf, 0xCu);
            }
            v14 = 0;
          }

LABEL_24:
LABEL_25:

          goto LABEL_26;
        }
      }
      else
      {
        v15 = getWFWidgetLogObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v23 = "-[WFRunShortcutConfigurationIntentAction serializedParametersForDonatedIntent:allowDroppingUnconfigurableValues:]";
          _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_ERROR, "%s Shortcut object did not have an identifier using first unsorted workflow", buf, 0xCu);
        }

        v16 = (void *)[objc_alloc(MEMORY[0x1E4FB4A70]) initWithLocation:0];
        [v16 setResultsLimit:1];
        v17 = [v8 sortedWorkflowsWithQuery:v16];
        v18 = [v17 descriptors];
        v9 = [v18 firstObject];

        if (v9) {
          goto LABEL_6;
        }
      }
      v10 = getWFWidgetLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[WFRunShortcutConfigurationIntentAction serializedParametersForDonatedIntent:allowDroppingUnconfigurableValues:]";
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%s Unable to get workflow, nothing was returned by the query", buf, 0xCu);
      }
      v14 = 0;
      goto LABEL_24;
    }
  }

  v5 = getWFWidgetLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[WFRunShortcutConfigurationIntentAction serializedParametersForDonatedIntent:allowDroppingUnconfigurableValues:]";
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_ERROR, "%s Did not find shortcut object on WFRunShortcutConfigurationIntentAction: %@", buf, 0x16u);
  }
  v14 = 0;
LABEL_26:

  return v14;
}

- (id)parameterOverrides
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)WFRunShortcutConfigurationIntentAction;
  v2 = [(WFOverridableLinkAction *)&v8 parameterOverrides];
  v3 = (void *)[v2 mutableCopy];

  v9 = @"Class";
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  WFAddEntriesToDictionary(v3, @"shortcut", v6);

  return v3;
}

@end