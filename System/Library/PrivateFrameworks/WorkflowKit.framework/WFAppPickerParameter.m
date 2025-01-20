@interface WFAppPickerParameter
- (BOOL)enumerationShouldProvideValuesForParameterSummaryLocalization:(id)a3;
- (BOOL)preferParameterValuePicker;
- (BOOL)useLegacyIdentifiers;
- (Class)singleStateClass;
- (WFAppListProvider)appListProvider;
- (WFAppPickerParameter)initWithDefinition:(id)a3;
- (id)appEnumerator;
- (id)enumeration:(id)a3 accessoryIconForPossibleState:(id)a4;
- (id)enumeration:(id)a3 accessoryImageForPossibleState:(id)a4;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)stateForRecord:(id)a3;
- (int64_t)appSearchType;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
- (void)setAppListProvider:(id)a3;
@end

@implementation WFAppPickerParameter

- (void).cxx_destruct
{
}

- (void)setAppListProvider:(id)a3
{
}

- (WFAppListProvider)appListProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appListProvider);
  return (WFAppListProvider *)WeakRetained;
}

- (BOOL)useLegacyIdentifiers
{
  return self->_useLegacyIdentifiers;
}

- (int64_t)appSearchType
{
  return self->_appSearchType;
}

- (id)stateForRecord:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F302A8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithApplicationRecord:v5];

  if ([(WFAppPickerParameter *)self useLegacyIdentifiers])
  {
    v7 = [v6 bundleIdentifier];
    v8 = +[ICAppRegistry legacyAppIdentifierForBundleIdentifier:v7];

    id v9 = objc_alloc(MEMORY[0x1E4F302A8]);
    v10 = [v6 localizedName];
    v11 = [v6 extensionBundleIdentifier];
    v12 = [v6 counterpartIdentifiers];
    v13 = [v6 teamIdentifier];
    v14 = [v6 supportedIntents];
    v15 = [v6 bundleURL];
    v16 = [v6 documentTypes];
    uint64_t v17 = [v9 initWithLocalizedName:v10 bundleIdentifier:v8 extensionBundleIdentifier:v11 counterpartIdentifiers:v12 teamIdentifier:v13 supportedIntents:v14 bundleURL:v15 documentTypes:v16];

    v6 = (void *)v17;
  }
  v18 = [(WFVariableSubstitutableParameterState *)[WFAppDescriptorParameterState alloc] initWithValue:v6];

  return v18;
}

- (id)enumeration:(id)a3 accessoryImageForPossibleState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v8 = +[ICAppRegistry sharedRegistry];
    id v9 = [v6 value];
    v10 = [v9 bundleIdentifier];
    v11 = [v8 appWithIdentifier:v10];
    v7 = [v11 icon];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)enumeration:(id)a3 accessoryIconForPossibleState:(id)a4
{
  if (a4)
  {
    v4 = (objc_class *)MEMORY[0x1E4FB4560];
    id v5 = a4;
    id v6 = [v4 alloc];
    v7 = [v5 value];

    v8 = [v7 bundleIdentifier];
    id v9 = (void *)[v6 initWithBundleIdentifier:v8];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  if (a4)
  {
    v4 = objc_msgSend(a4, "value", a3);
    id v5 = [v4 localizedName];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v6 = a5;
  v7 = dispatch_get_global_queue(25, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__WFAppPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v9[3] = &unk_1E65572A0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

void __86__WFAppPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v28 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v2 = [*(id *)(a1 + 32) appEnumerator];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v34;
    unint64_t v7 = 0x1E4F1C000uLL;
    id v8 = @"WFShowInternalAppsInOpenApp";
    *(void *)&long long v4 = 136315138;
    long long v26 = v4;
    do
    {
      uint64_t v9 = 0;
      uint64_t v27 = v5;
      do
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(v2);
        }
        id v10 = *(void **)(*((void *)&v33 + 1) + 8 * v9);
        v11 = objc_msgSend(*(id *)(v7 + 2840), "workflowUserDefaults", v26);
        int v12 = [v11 BOOLForKey:v8];

        if (v12)
        {
          v13 = getWFGeneralLogObject();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v26;
            v39 = "-[WFAppPickerParameter loadPossibleStatesForEnumeration:searchTerm:completionHandler:]_block_invoke";
            _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_DEFAULT, "%s Showing internal apps in WFAppPickerParameter because the Show Internal Apps in Open App default is on", buf, 0xCu);
          }

          uint64_t v14 = 2;
        }
        else
        {
          uint64_t v14 = 0;
        }
        if (objc_msgSend(v10, "wf_isAvailableInContext:", v14))
        {
          if ([*(id *)(a1 + 32) appSearchType] == 1)
          {
            v15 = v8;
            unint64_t v16 = v7;
            uint64_t v17 = v2;
            uint64_t v18 = a1;
            v19 = [v10 claimRecords];
            v20 = [v19 allObjects];
            v21 = objc_msgSend(v20, "if_flatMap:", &__block_literal_global_29074);

            if (![v21 count] || (objc_msgSend(v21, "isEqualToArray:", &unk_1F2317970) & 1) != 0)
            {

              a1 = v18;
              v2 = v17;
              unint64_t v7 = v16;
              id v8 = v15;
              uint64_t v5 = v27;
              goto LABEL_18;
            }

            a1 = v18;
            v2 = v17;
            unint64_t v7 = v16;
            id v8 = v15;
            uint64_t v5 = v27;
          }
          [v28 addObject:v10];
        }
LABEL_18:
        ++v9;
      }
      while (v5 != v9);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v5);
  }

  v22 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"localizedName" ascending:1 selector:sel_localizedStandardCompare_];
  v37 = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  [v28 sortUsingDescriptors:v23];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __86__WFAppPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2;
  v32[3] = &unk_1E6551628;
  v32[4] = *(void *)(a1 + 32);
  v24 = objc_msgSend(v28, "if_map:", v32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__WFAppPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3;
  block[3] = &unk_1E65572A0;
  id v30 = v24;
  id v31 = *(id *)(a1 + 40);
  id v25 = v24;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __86__WFAppPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) stateForRecord:a2];
}

void __86__WFAppPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F30570]) initWithItems:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __86__WFAppPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_170(uint64_t a1, void *a2)
{
  return [a2 typeIdentifiers];
}

- (id)appEnumerator
{
  id v2 = [(WFAppPickerParameter *)self appListProvider];
  uint64_t v3 = [v2 appEnumerator];

  if (!v3)
  {
    uint64_t v3 = WFInstalledAppsEnumerator();
  }
  return v3;
}

- (BOOL)preferParameterValuePicker
{
  return 1;
}

- (BOOL)enumerationShouldProvideValuesForParameterSummaryLocalization:(id)a3
{
  return 0;
}

- (WFAppPickerParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFAppPickerParameter;
  uint64_t v5 = [(WFEnumerationParameter *)&v15 initWithDefinition:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"AppSearchType"];
    uint64_t v7 = objc_opt_class();
    id v8 = WFEnforceClass(v6, v7);

    if ([v8 isEqualToString:@"OpenApp"])
    {
      uint64_t v9 = 0;
    }
    else
    {
      if (![v8 isEqualToString:@"OpenIn"])
      {
LABEL_7:
        id v10 = [v4 objectForKey:@"UseLegacyIdentifiers"];
        uint64_t v11 = objc_opt_class();
        int v12 = WFEnforceClass(v10, v11);
        v5->_useLegacyIdentifiers = [v12 BOOLValue];

        [(WFDynamicEnumerationParameter *)v5 setDataSource:v5];
        v13 = v5;

        goto LABEL_8;
      }
      uint64_t v9 = 1;
    }
    v5->_appSearchType = v9;
    goto LABEL_7;
  }
LABEL_8:

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end