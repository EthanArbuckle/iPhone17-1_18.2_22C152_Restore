@interface WFShortcutFolderWidgetConfigurationIntent
- (id)parameterOverrides;
- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4;
@end

@implementation WFShortcutFolderWidgetConfigurationIntent

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(WFAppIntentExecutionAction *)self metadata];
  v7 = [v6 customIntentClassName];
  v8 = [v5 _className];
  int v9 = [v7 isEqualToString:v8];

  if (!v9)
  {
    v10 = getWFWidgetLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v15 = [v5 _className];
      *(_DWORD *)buf = 136315394;
      v52 = "-[WFShortcutFolderWidgetConfigurationIntent serializedParametersForDonatedIntent:allowDroppingUnconfigurableValues:]";
      __int16 v53 = 2114;
      id v54 = v15;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Attempted to migrate WFShortcutFolderWidgetConfigurationIntent to App Intent but the intent was of the wrong class type: %{public}@", buf, 0x16u);
    }
    goto LABEL_10;
  }
  v10 = [v5 valueForKey:@"folder"];
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v10 = getWFWidgetLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[WFShortcutFolderWidgetConfigurationIntent serializedParametersForDonatedIntent:allowDroppingUnconfigurableValues:]";
      __int16 v53 = 2112;
      id v54 = v5;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Did not find folder object on WFShortcutFolderWidgetConfigurationIntent: %@", buf, 0x16u);
    }
LABEL_10:
    v16 = 0;
    goto LABEL_11;
  }
  v11 = [v10 identifier];

  if (v11)
  {
    v12 = NSString;
    v13 = [v10 identifier];
    v14 = [v12 stringWithFormat:@"shortcuts://widget/folder/%@", v13];
  }
  else
  {
    v14 = @"shortcuts://widget/folder/all-shortcuts";
  }
  v18 = [v10 displayString];
  v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    WFLocalizedAllShortcutsString();
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v47 = v20;

  id v45 = objc_alloc(MEMORY[0x1E4F72C28]);
  uint64_t v21 = [objc_alloc(MEMORY[0x1E4F72C30]) initWithTypeIdentifier:@"ConfiguredCollection" instanceIdentifier:v14];
  id v22 = objc_alloc(MEMORY[0x1E4F72D20]);
  id v23 = objc_alloc(MEMORY[0x1E4F72E10]);
  v46 = v14;
  v44 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
  v43 = [MEMORY[0x1E4F72D18] URLValueType];
  v24 = (void *)[v23 initWithValue:v44 valueType:v43];
  v25 = (void *)[v22 initWithIdentifier:@"identifierURL" value:v24];
  v50[0] = v25;
  id v26 = objc_alloc(MEMORY[0x1E4F72D20]);
  id v27 = objc_alloc(MEMORY[0x1E4F72E10]);
  v28 = [MEMORY[0x1E4F72D18] stringValueType];
  v29 = (void *)[v27 initWithValue:v47 valueType:v28];
  v30 = (void *)[v26 initWithIdentifier:@"name" value:v29];
  v50[1] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  v32 = (void *)v21;
  v33 = (void *)[v45 initWithTransient:1 identifier:v21 properties:v31 managedAccountIdentifier:0];

  id v34 = objc_alloc(MEMORY[0x1E4F72E10]);
  v35 = (void *)[objc_alloc(MEMORY[0x1E4F72C58]) initWithIdentifier:@"ConfiguredCollection"];
  id v36 = objc_alloc(MEMORY[0x1E4F72C00]);
  v37 = (void *)[objc_alloc(MEMORY[0x1E4F72DA0]) initWithKey:v47 table:0 bundleURL:0];
  v38 = (void *)[v36 initWithTitle:v37 subtitle:0 image:0];
  v39 = (void *)[v34 initWithValue:v33 valueType:v35 displayRepresentation:v38];

  uint64_t v40 = [v39 wfSerializedRepresentation];
  v41 = (void *)v40;
  if (v40)
  {
    v48 = @"folder";
    uint64_t v49 = v40;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  }
  else
  {
    v42 = getWFWidgetLogObject();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[WFShortcutFolderWidgetConfigurationIntent serializedParametersForDonatedIntent:allowDroppingUnconfigurableValues:]";
      __int16 v53 = 2112;
      id v54 = v39;
      _os_log_impl(&dword_1C7F0A000, v42, OS_LOG_TYPE_ERROR, "%s Failed to create serialized representation from entity value: %@", buf, 0x16u);
    }

    v16 = 0;
  }

LABEL_11:
  return v16;
}

- (id)parameterOverrides
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F727E0];
  v3 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 16, 1);
  v20[0] = v3;
  v19[1] = *MEMORY[0x1E4F727E8];
  v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 8, 1);
  v20[1] = v4;
  v19[2] = *MEMORY[0x1E4F727F0];
  id v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 4, 1);
  v20[2] = v5;
  v19[3] = *MEMORY[0x1E4F727F8];
  v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", 2, 1);
  v20[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];

  v16.receiver = self;
  v16.super_class = (Class)WFShortcutFolderWidgetConfigurationIntent;
  v8 = [(WFOverridableLinkAction *)&v16 parameterOverrides];
  int v9 = (void *)[v8 mutableCopy];

  v17[0] = @"Class";
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v18[0] = v11;
  v17[1] = @"Label";
  v12 = WFLocalizedString(@"Shortcut");
  v18[1] = v12;
  v18[2] = MEMORY[0x1E4F1CC38];
  v17[2] = @"AllowsMultipleValues";
  v17[3] = @"RangedSizeArray";
  v18[3] = MEMORY[0x1E4F1CC38];
  v18[4] = MEMORY[0x1E4F1CBF0];
  v17[4] = @"DefaultValue";
  v17[5] = @"Placeholder";
  v13 = WFLocalizedString(@"Shortcut");
  v17[6] = @"ArraySizeRangesForWidgetFamily";
  v18[5] = v13;
  v18[6] = v7;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:7];
  WFAddEntriesToDictionary(v9, @"shortcut", v14);

  return v9;
}

@end