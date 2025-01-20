@interface WFLinkContentItemFilterAction
- (BOOL)isApprovedForPublicShortcutsDrawer;
- (BOOL)isFetchingUniqueEntity;
- (BOOL)isInMemoryFindAction;
- (BOOL)visibleForUse:(int64_t)a3;
- (INAppIntentDescriptor)appIntentDescriptor;
- (LNEntityMetadata)entityMetadata;
- (LNFullyQualifiedActionIdentifier)fullyQualifiedLinkActionIdentifier;
- (LNPropertyQuery)propertyQuery;
- (LNQueryMetadata)queryMetadata;
- (WFLinkContentItemFilterAction)initWithIdentifier:(id)a3 queryMetadata:(id)a4 entityMetadata:(id)a5 definition:(id)a6 serializedParameters:(id)a7 appIntentDescriptor:(id)a8 fullyQualifiedActionIdentifier:(id)a9;
- (id)backingActionIdentifiers;
- (id)copyWithSerializedParameters:(id)a3;
- (id)displayableAppDescriptor;
- (id)entityMetadataForIdentifier:(id)a3;
- (id)linkValueTypes;
- (id)localizedCategoryWithContext:(id)a3;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)localizedDescriptionResultWithContext:(id)a3;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (id)localizedKeywordsWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)metadataProvider;
- (id)outputDictionary;
- (id)parameterDefinitions;
- (id)parameterSummary;
- (id)propertiesByPropertyIdentifier;
- (id)sortingOptionsWithRandomSortOrder:(BOOL *)a3;
- (void)configureParameter:(id)a3;
- (void)finishRunningWithError:(id)a3;
- (void)finishRunningWithOutput:(id)a3 randomSortOrder:(BOOL)a4 error:(id)a5;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)serializeAppIntentDescriptorIfNecessary;
- (void)showChronoControlIfPossibleWithCompletionHandler:(id)a3;
@end

@implementation WFLinkContentItemFilterAction

- (LNPropertyQuery)propertyQuery
{
  v2 = self;
  id v3 = WFLinkContentItemFilterAction.propertyQuery.getter();

  return (LNPropertyQuery *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIntentDescriptor, 0);
  objc_storeStrong((id *)&self->_fullyQualifiedLinkActionIdentifier, 0);
  objc_storeStrong((id *)&self->_entityMetadata, 0);
  objc_storeStrong((id *)&self->_queryMetadata, 0);
  objc_storeStrong((id *)&self->_propertiesByPropertyIdentifier, 0);
  objc_storeStrong((id *)&self->_metadataProvider, 0);
  objc_storeStrong((id *)&self->_outputDictionary, 0);
}

- (INAppIntentDescriptor)appIntentDescriptor
{
  return self->_appIntentDescriptor;
}

- (LNFullyQualifiedActionIdentifier)fullyQualifiedLinkActionIdentifier
{
  return self->_fullyQualifiedLinkActionIdentifier;
}

- (BOOL)isFetchingUniqueEntity
{
  return self->_fetchingUniqueEntity;
}

- (LNEntityMetadata)entityMetadata
{
  return self->_entityMetadata;
}

- (LNQueryMetadata)queryMetadata
{
  return self->_queryMetadata;
}

- (id)backingActionIdentifiers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(WFAction *)self identifier];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)entityMetadataForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[WFLinkActionProvider sharedProvider];
  v6 = [(WFLinkContentItemFilterAction *)self fullyQualifiedLinkActionIdentifier];
  v7 = [v6 bundleIdentifier];
  v8 = [v5 entityMetadataByAppBundleIdentifier:v7 entityIdentifier:v4];

  return v8;
}

- (void)showChronoControlIfPossibleWithCompletionHandler:(id)a3
{
  v7 = (void (**)(id, void))a3;
  id v4 = [(WFLinkContentItemFilterAction *)self entityMetadata];
  v5 = [v4 associatedControl];

  if (v5)
  {
    v6 = [(WFAction *)self userInterface];
    [v5 presentIfPossibleInUserInterface:v6 completionBlock:v7];
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (id)localizedCategoryWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(WFLinkContentItemFilterAction *)self queryMetadata];
  v6 = [v5 descriptionMetadata];
  v7 = [v6 categoryName];
  v8 = [v7 title];

  if (v8)
  {
    v9 = [v4 locale];

    v10 = [v9 localeIdentifier];
    v11 = [v8 localizedStringForLocaleIdentifier:v10];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFLinkContentItemFilterAction;
    v11 = [(WFAction *)&v13 localizedCategoryWithContext:v4];
  }
  return v11;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(WFLinkContentItemFilterAction *)self queryMetadata];
  v6 = [v5 descriptionMetadata];
  v7 = [v6 searchKeywords];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__WFLinkContentItemFilterAction_localizedKeywordsWithContext___block_invoke;
  v11[3] = &unk_1E6556818;
  id v12 = v4;
  id v8 = v4;
  v9 = objc_msgSend(v7, "if_map:", v11);

  return v9;
}

id __62__WFLinkContentItemFilterAction_localizedKeywordsWithContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 locale];
  v5 = [v4 localeIdentifier];
  v6 = [v3 localizedStringForLocaleIdentifier:v5];

  return v6;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(WFLinkContentItemFilterAction *)self queryMetadata];
  v6 = [v5 descriptionMetadata];
  v7 = [v6 descriptionText];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  v10 = [v4 locale];

  v11 = [v10 localeIdentifier];
  id v12 = [v9 localizedStringForLocaleIdentifier:v11];

  return v12;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(WFLinkContentItemFilterAction *)self queryMetadata];
  v6 = [v5 descriptionMetadata];

  v7 = [v6 resultValueName];

  if (v7)
  {
    id v8 = [v6 resultValueName];
    id v9 = [v4 locale];
    v10 = [v9 localeIdentifier];
    v11 = [v8 localizedStringForLocaleIdentifier:v10];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFLinkContentItemFilterAction;
    v11 = [(WFContentItemFilterAction *)&v13 localizedDefaultOutputNameWithContext:v4];
  }

  return v11;
}

- (id)localizedDescriptionResultWithContext:(id)a3
{
  id v4 = a3;
  if ([(WFLinkContentItemFilterAction *)self isFetchingUniqueEntity])
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WFLinkContentItemFilterAction;
    v5 = [(WFContentItemFilterAction *)&v7 localizedDescriptionResultWithContext:v4];
  }

  return v5;
}

- (id)outputDictionary
{
  v30[2] = *MEMORY[0x1E4F143B8];
  outputDictionary = self->_outputDictionary;
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (outputDictionary == v4)
  {
    v5 = 0;
  }
  else if (outputDictionary)
  {
    outputDictionary = outputDictionary;
    v5 = outputDictionary;
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)WFLinkContentItemFilterAction;
    v5 = [(WFAction *)&v27 outputDictionary];
    id v6 = objc_alloc(MEMORY[0x1E4F72C58]);
    objc_super v7 = [(WFLinkContentItemFilterAction *)self entityMetadata];
    id v8 = [v7 identifier];
    id v9 = (void *)[v6 initWithIdentifier:v8];

    if (!v9) {
      goto LABEL_7;
    }
    v10 = [v5 objectForKeyedSubscript:@"Types"];

    if (v10) {
      goto LABEL_7;
    }
    id v12 = [(WFLinkContentItemFilterAction *)self fullyQualifiedLinkActionIdentifier];
    objc_super v13 = [v12 bundleIdentifier];
    v14 = (objc_class *)objc_msgSend(v9, "wf_contentItemClassWithAppBundleIdentifier:", v13);

    if (v14)
    {
      v15 = (void *)[v5 mutableCopy];
      v16 = v15;
      if (v15) {
        id v17 = v15;
      }
      else {
        id v17 = (id)objc_opt_new();
      }
      v18 = v17;

      v29[0] = @"Multiple";
      v19 = NSNumber;
      if ([(WFLinkContentItemFilterAction *)self isFetchingUniqueEntity])
      {
        uint64_t v20 = 0;
      }
      else
      {
        objc_opt_class();
        uint64_t v20 = objc_opt_isKindOfClass() & 1;
      }
      v21 = [v19 numberWithInt:v20];
      v29[1] = @"Types";
      v30[0] = v21;
      v22 = NSStringFromClass(v14);
      v28 = v22;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
      v30[1] = v23;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
      [v18 addEntriesFromDictionary:v24];

      v25 = (void *)[v18 copy];
      if (v25)
      {
        v26 = v25;
      }
      else
      {
        v26 = [MEMORY[0x1E4F1CA98] null];
      }
      outputDictionary = self->_outputDictionary;
      self->_outputDictionary = v26;
      v5 = v25;
    }
    else
    {
LABEL_7:

      outputDictionary = 0;
    }
  }

  return v5;
}

- (id)displayableAppDescriptor
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFAction *)self definition];
  id v4 = [v3 objectForKey:@"LinkActionDisableDisplayedAppDescriptor"];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  char v7 = [v6 BOOLValue];
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [(WFAction *)self definition];
    v10 = [v9 objectForKey:@"LinkActionDisplayedAppDescriptor"];

    if (v10)
    {
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F302A8]) initWithSerializedRepresentation:v10];
      id v8 = v11;
      if (v11)
      {
        id v12 = v11;
      }
      else
      {
        objc_super v13 = getWFAppIntentsLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          id v17 = "-[WFLinkContentItemFilterAction displayableAppDescriptor]";
          _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Found a serialized representation for displayedAppDescriptor, but failed to deserialize it.", buf, 0xCu);
        }
      }
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)WFLinkContentItemFilterAction;
      id v8 = [(WFAction *)&v15 displayableAppDescriptor];
    }
  }
  return v8;
}

- (id)parameterSummary
{
  if ([(WFLinkContentItemFilterAction *)self isFetchingUniqueEntity])
  {
    id v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WFLinkContentItemFilterAction;
    id v3 = [(WFContentItemFilterAction *)&v5 parameterSummary];
  }
  return v3;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  if ([(WFLinkContentItemFilterAction *)self isFetchingUniqueEntity]) {
    objc_super v5 = @"Get %@";
  }
  else {
    objc_super v5 = @"Find %@";
  }
  id v6 = WFLocalizedStringResourceWithKey(v5, v5);
  char v7 = [(WFLinkContentItemFilterAction *)self entityMetadata];
  id v8 = [v7 displayRepresentation];
  id v9 = [v8 name];
  v10 = [v4 locale];
  v11 = [v10 localeIdentifier];
  id v12 = [v9 localizedStringWithPluralizationNumber:&unk_1F2317208 forLocaleIdentifier:v11];

  objc_super v13 = NSString;
  v14 = [v4 localize:v6];

  objc_super v15 = objc_msgSend(v13, "localizedStringWithFormat:", v14, v12);

  return v15;
}

- (BOOL)isApprovedForPublicShortcutsDrawer
{
  id v3 = [(WFLinkContentItemFilterAction *)self entityMetadata];
  id v4 = [(WFLinkContentItemFilterAction *)self fullyQualifiedLinkActionIdentifier];
  objc_super v5 = [v4 bundleIdentifier];
  char v6 = WFISEligibleForSettingsUpdaterAction(v3, v5);

  if (v6) {
    return 0;
  }
  id v8 = [(WFLinkContentItemFilterAction *)self fullyQualifiedLinkActionIdentifier];
  BOOL v9 = +[WFLinkActionProvider approvedForPublicDrawerToDisplayActionIdentifier:v8];

  return v9;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)WFLinkContentItemFilterAction;
  unsigned int v5 = -[WFAction visibleForUse:](&v13, sel_visibleForUse_);
  if (v5)
  {
    if (a3
      || (VCIsInternalBuild() & 1) != 0
      || (unsigned int v5 = [(WFLinkContentItemFilterAction *)self isApprovedForPublicShortcutsDrawer]) != 0)
    {
      char v6 = [(WFLinkContentItemFilterAction *)self fullyQualifiedLinkActionIdentifier];
      char v7 = [(WFLinkContentItemFilterAction *)self queryMetadata];
      BOOL v8 = +[WFLinkActionProvider isFullyQualifiedActionIdentifier:v6 withMetadata:v7 visibleForUse:a3];

      BOOL v9 = [(WFLinkContentItemFilterAction *)self fullyQualifiedLinkActionIdentifier];
      v10 = [(WFLinkContentItemFilterAction *)self entityMetadata];
      BOOL v11 = +[WFLinkActionProvider isFullyQualifiedActionIdentifier:v9 withMetadata:v10 visibleForUse:a3];

      LOBYTE(v5) = v8 && v11;
    }
  }
  return v5;
}

- (id)linkValueTypes
{
  id v3 = [(WFLinkContentItemFilterAction *)self entityMetadata];
  id v4 = objc_opt_new();
  unsigned int v5 = [(WFAction *)self identifier];
  char v6 = @"is.workflow.actions.filter.notes";
  if (v5 == @"is.workflow.actions.filter.notes")
  {

    goto LABEL_6;
  }
  if (v5)
  {
    int v7 = [(__CFString *)v5 isEqualToString:@"is.workflow.actions.filter.notes"];

    if (!v7) {
      goto LABEL_8;
    }
LABEL_6:
    BOOL v8 = [v3 properties];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __47__WFLinkContentItemFilterAction_linkValueTypes__block_invoke;
    v21[3] = &unk_1E65567D8;
    BOOL v9 = &v22;
    v22 = v3;
    v10 = &v23;
    id v23 = v4;
    id v11 = v3;
    id v12 = v21;
    goto LABEL_9;
  }

LABEL_8:
  BOOL v8 = [v3 properties];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __47__WFLinkContentItemFilterAction_linkValueTypes__block_invoke_198;
  uint64_t v18 = &unk_1E65567D8;
  BOOL v9 = &v19;
  v19 = v3;
  v10 = &v20;
  id v20 = v4;
  id v13 = v3;
  id v12 = &v15;
LABEL_9:
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12, v15, v16, v17, v18);

  return v4;
}

void __47__WFLinkContentItemFilterAction_linkValueTypes__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  char v6 = [v5 title];
  int v7 = [v6 key];

  if (v7)
  {
    BOOL v8 = *(void **)(a1 + 40);
    BOOL v9 = [v5 valueType];
    [v8 setObject:v9 forKey:v7];
  }
  else
  {
    BOOL v9 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = [*(id *)(a1 + 32) identifier];
      id v11 = [*(id *)(a1 + 32) effectiveBundleIdentifiers];
      int v12 = 136316162;
      id v13 = "-[WFLinkContentItemFilterAction linkValueTypes]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2048;
      uint64_t v21 = a3;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_FAULT, "%s LNPropertyMetadata title has no key: entity %@ from bundles %@, property %@ at %ld", (uint8_t *)&v12, 0x34u);
    }
  }
}

void __47__WFLinkContentItemFilterAction_linkValueTypes__block_invoke_198(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  char v6 = [v5 identifier];
  if (v6)
  {
    int v7 = *(void **)(a1 + 40);
    BOOL v8 = [v5 valueType];
    [v7 setObject:v8 forKey:v6];
  }
  else
  {
    BOOL v9 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = [*(id *)(a1 + 32) identifier];
      id v11 = [*(id *)(a1 + 32) effectiveBundleIdentifiers];
      int v12 = 136316162;
      id v13 = "-[WFLinkContentItemFilterAction linkValueTypes]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2048;
      uint64_t v21 = a3;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_FAULT, "%s LNPropertyMetadata has no identifier: entity %@ from bundles %@, property %@ at %ld", (uint8_t *)&v12, 0x34u);
    }
  }
}

- (void)configureParameter:(id)a3
{
  id v4 = a3;
  if ([(WFLinkContentItemFilterAction *)self isFetchingUniqueEntity]) {
    [v4 setHidden:1];
  }
  id v6 = v4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(WFLinkContentItemFilterAction *)self linkValueTypes];
      [v6 setLinkValueTypes:v5];
    }
  }
}

- (id)parameterDefinitions
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)WFLinkContentItemFilterAction;
  id v3 = [(WFContentItemFilterAction *)&v16 parameterDefinitions];
  if ([(WFLinkContentItemFilterAction *)self isFetchingUniqueEntity])
  {
    id v4 = (id)objc_opt_new();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "definitionByRemovingKey:", @"Description", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

- (id)sortingOptionsWithRandomSortOrder:(BOOL *)a3
{
  v44[5] = *MEMORY[0x1E4F143B8];
  id v5 = [(WFContentItemFilterAction *)self parameterStateForKey:@"WFContentItemSortProperty"];
  uint64_t v6 = [v5 value];

  if (v6)
  {
    uint64_t v7 = WFLocalizedContentPropertyPossibleValueMarker(@"Random");
    id v8 = v6;
    id v9 = v7;
    if (v8 == v9)
    {
    }
    else
    {
      v10 = v9;
      if (!v9)
      {

LABEL_10:
        long long v13 = WFLocalizedContentPropertyPossibleValueMarker(@"Z to A");
        v44[0] = v13;
        long long v14 = WFLocalizedContentPropertyPossibleValueMarker(@"Biggest First");
        v44[1] = v14;
        long long v15 = WFLocalizedContentPropertyPossibleValueMarker(@"Latest First");
        v44[2] = v15;
        objc_super v16 = WFLocalizedContentPropertyPossibleValueMarker(@"Longest First");
        v44[3] = v16;
        id v17 = WFLocalizedContentPropertyPossibleValueMarker(@"Descending");
        v44[4] = v17;
        uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:5];

        id v19 = [(WFAction *)self parameterValueForKey:@"WFContentItemSortOrder" ofClass:objc_opt_class()];
        unsigned int v20 = [v18 containsObject:v19];

        uint64_t v21 = [(objc_class *)[(WFAction *)self contentItemClass] allProperties];
        uint64_t v22 = [v21 objectMatchingKey:@"name" value:v8];

        id v23 = [v22 userInfo];
        if (v23)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v24 = v23;
          }
          else {
            v24 = 0;
          }
        }
        else
        {
          v24 = 0;
        }
        id v25 = v24;

        v26 = [v25 objectForKey:@"WFLinkEntityContentPropertyUserInfoPropertyIdentifier"];
        if (v26)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_super v27 = v26;
          }
          else {
            objc_super v27 = 0;
          }
        }
        else
        {
          objc_super v27 = 0;
        }
        id v28 = v27;

        uint64_t v39 = 0;
        v40 = &v39;
        uint64_t v41 = 0x2020000000;
        uint64_t v42 = 0;
        v29 = [(WFLinkContentItemFilterAction *)self queryMetadata];
        v30 = [v29 sortingOptions];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __67__WFLinkContentItemFilterAction_sortingOptionsWithRandomSortOrder___block_invoke;
        v36[3] = &unk_1E65567B0;
        id v31 = v28;
        id v37 = v31;
        v38 = &v39;
        [v30 enumerateObjectsUsingBlock:v36];

        id v32 = objc_alloc(MEMORY[0x1E4F72D48]);
        v33 = [NSNumber numberWithUnsignedInteger:v40[3]];
        v34 = (void *)[v32 initWithOrder:v20 sortParameterIndex:v33];
        v43 = v34;
        long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];

        _Block_object_dispose(&v39, 8);
        goto LABEL_21;
      }
      int v11 = [v8 isEqualToString:v9];

      if (!v11) {
        goto LABEL_10;
      }
    }
    *a3 = 1;
  }
  long long v12 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_21:

  return v12;
}

void __67__WFLinkContentItemFilterAction_sortingOptionsWithRandomSortOrder___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 propertyIdentifier];
  id v8 = *(void **)(a1 + 32);
  id v11 = v7;
  id v9 = v8;
  if (v11 == v9)
  {

    goto LABEL_7;
  }
  if (v11 && v9)
  {
    int v10 = [v11 isEqualToString:v9];

    if (!v10) {
      return;
    }
LABEL_7:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
    return;
  }
}

- (void)finishRunningWithOutput:(id)a3 randomSortOrder:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  v30[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = v9;
  if (!v8)
  {
    id v23 = self;
LABEL_6:
    [(WFLinkContentItemFilterAction *)v23 finishRunningWithError:v10];
    goto LABEL_7;
  }
  BOOL v24 = v6;
  id v25 = v9;
  id v11 = [v8 value];
  long long v12 = [v11 valueType];
  long long v13 = [v8 value];
  long long v14 = [(WFLinkContentItemFilterAction *)self fullyQualifiedLinkActionIdentifier];
  long long v15 = [v14 bundleIdentifier];
  objc_super v16 = [(WFLinkContentItemFilterAction *)self displayableAppDescriptor];
  id v17 = [v16 bundleIdentifier];
  uint64_t v18 = objc_msgSend(v12, "wf_contentCollectionFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:", v13, v15, v17);
  [(WFAction *)self setOutput:v18];

  if (!v24)
  {
    id v23 = self;
    int v10 = v25;
    goto LABEL_6;
  }
  objc_initWeak(&location, self);
  id v19 = [(WFAction *)self output];
  unsigned int v20 = [v19 items];
  uint64_t v21 = [MEMORY[0x1E4F5A890] randomSortDescriptor];
  v30[0] = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __79__WFLinkContentItemFilterAction_finishRunningWithOutput_randomSortOrder_error___block_invoke;
  v26[3] = &unk_1E6556780;
  objc_copyWeak(&v28, &location);
  id v27 = v25;
  [v20 sortedArrayUsingContentSortDescriptors:v22 completionHandler:v26];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
  int v10 = v25;
LABEL_7:
}

void __79__WFLinkContentItemFilterAction_finishRunningWithOutput_randomSortOrder_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [MEMORY[0x1E4F5A830] collectionWithItems:v4];

  [WeakRetained setOutput:v5];
  [WeakRetained finishRunningWithError:*(void *)(a1 + 32)];
}

- (id)metadataProvider
{
  metadataProvider = self->_metadataProvider;
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (metadataProvider == v4)
  {
    id v5 = 0;
  }
  else if (metadataProvider)
  {
    metadataProvider = metadataProvider;
    id v5 = metadataProvider;
  }
  else
  {
    BOOL v6 = (LNMetadataProvider *)[objc_alloc(MEMORY[0x1E4F72CD8]) initWithOptions:2];
    id v5 = v6;
    if (v6)
    {
      uint64_t v7 = v6;
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
    }
    metadataProvider = self->_metadataProvider;
    self->_metadataProvider = v7;
  }

  return v5;
}

- (BOOL)isInMemoryFindAction
{
  id v3 = WFForcedLinkEntityFindActionIdentifiers();
  id v4 = [(WFAction *)self identifier];
  if ([v3 containsObject:v4])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    BOOL v6 = [(WFLinkContentItemFilterAction *)self queryMetadata];
    BOOL v5 = [v6 capabilities] & 1;
  }
  return v5;
}

- (void)finishRunningWithError:(id)a3
{
  BOOL v5 = -[WFAction localizedErrorWithLinkError:](self, "localizedErrorWithLinkError:");
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)WFLinkContentItemFilterAction;
    [(WFAction *)&v6 finishRunningWithError:v5];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__WFLinkContentItemFilterAction_finishRunningWithError___block_invoke;
    v7[3] = &unk_1E6557668;
    v7[4] = self;
    [(WFLinkContentItemFilterAction *)self showChronoControlIfPossibleWithCompletionHandler:v7];
  }
}

id __56__WFLinkContentItemFilterAction_finishRunningWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)WFLinkContentItemFilterAction;
  return objc_msgSendSuper2(&v3, sel_finishRunningWithError_, a2);
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(WFContentItemFilterAction *)self mode] == 1)
  {
    v35.receiver = self;
    v35.super_class = (Class)WFLinkContentItemFilterAction;
    [(WFContentItemFilterAction *)&v35 runAsynchronouslyWithInput:v4];
  }
  else
  {
    if ([(WFLinkContentItemFilterAction *)self isInMemoryFindAction])
    {
      BOOL v5 = (void *)MEMORY[0x1E4F72BC8];
      objc_super v6 = [(WFLinkContentItemFilterAction *)self entityMetadata];
      uint64_t v7 = [v5 policyWithEntityMetadata:v6];

      id v34 = 0;
      id v8 = [v7 connectionWithError:&v34];
      id v9 = v34;
      if (v8)
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __60__WFLinkContentItemFilterAction_runAsynchronouslyWithInput___block_invoke;
        aBlock[3] = &unk_1E6556730;
        aBlock[4] = self;
        int v10 = _Block_copy(aBlock);
        id v11 = [(WFLinkContentItemFilterAction *)self queryMetadata];
        char v12 = [v11 capabilities];

        long long v13 = [v7 appEntityMangledTypeName];
        if (v12) {
          [v8 performAllEntitiesQueryWithEntityMangledTypeName:v13 completionHandler:v10];
        }
        else {
          [v8 performSuggestedEntitiesQueryWithEntityMangledTypeName:v13 completionHandler:v10];
        }
      }
      else
      {
        id v28 = getWFGeneralLogObject();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v37 = "-[WFLinkContentItemFilterAction runAsynchronouslyWithInput:]";
          __int16 v38 = 2112;
          id v39 = v9;
          _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_ERROR, "%s Unable to create connection: %@", buf, 0x16u);
        }

        [(WFLinkContentItemFilterAction *)self finishRunningWithError:v9];
      }
    }
    else
    {
      [(WFContentItemFilterAction *)self slice];
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v7 = 0;
      }
      else
      {
        long long v15 = NSNumber;
        [(WFContentItemFilterAction *)self slice];
        if (v16 <= 1) {
          uint64_t v17 = 1;
        }
        else {
          uint64_t v17 = v16;
        }
        uint64_t v7 = [v15 numberWithUnsignedInteger:v17];
      }
      uint64_t v18 = (void *)MEMORY[0x1E4F72BC8];
      id v19 = [(WFLinkContentItemFilterAction *)self queryMetadata];
      unsigned int v20 = [v18 policyWithEntityQueryMetadata:v19];

      id v32 = 0;
      uint64_t v21 = [v20 connectionWithError:&v32];
      id v22 = v32;
      if (v21)
      {
        buf[0] = 0;
        id v23 = [(WFLinkContentItemFilterAction *)self sortingOptionsWithRandomSortOrder:buf];
        id v24 = objc_alloc(MEMORY[0x1E4F72D50]);
        id v25 = [(WFLinkContentItemFilterAction *)self propertyQuery];
        v26 = [v20 entityQueryMangledTypeName];
        id v27 = (void *)[v24 initWithPropertyQuery:v25 maximumResultCount:v7 queryMangledTypeName:v26 sortingOptions:v23];

        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        void v30[2] = __60__WFLinkContentItemFilterAction_runAsynchronouslyWithInput___block_invoke_178;
        void v30[3] = &unk_1E6556758;
        v30[4] = self;
        uint8_t v31 = buf[0];
        [v21 performQuery:v27 completionHandler:v30];
      }
      else
      {
        v29 = getWFGeneralLogObject();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v37 = "-[WFLinkContentItemFilterAction runAsynchronouslyWithInput:]";
          __int16 v38 = 2112;
          id v39 = v22;
          _os_log_impl(&dword_1C7F0A000, v29, OS_LOG_TYPE_ERROR, "%s Unable to create connection: %@", buf, 0x16u);
        }

        [(WFLinkContentItemFilterAction *)self finishRunningWithError:v22];
      }
    }
  }
}

void __60__WFLinkContentItemFilterAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!v5) {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
  objc_super v6 = [v5 value];
  uint64_t v7 = [v6 valueType];
  id v8 = [v5 value];
  id v9 = [*(id *)(a1 + 32) fullyQualifiedLinkActionIdentifier];
  int v10 = [v9 bundleIdentifier];
  id v11 = [*(id *)(a1 + 32) displayableAppDescriptor];
  char v12 = [v11 bundleIdentifier];
  long long v13 = objc_msgSend(v7, "wf_contentCollectionFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:", v8, v10, v12);

  uint64_t v14 = *(void **)(a1 + 32);
  long long v15 = [v14 query];
  v16.receiver = v14;
  v16.super_class = (Class)WFLinkContentItemFilterAction;
  objc_msgSendSuper2(&v16, sel_runFilterWithInput_query_, v13, v15);
}

uint64_t __60__WFLinkContentItemFilterAction_runAsynchronouslyWithInput___block_invoke_178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishRunningWithOutput:a2 randomSortOrder:*(unsigned __int8 *)(a1 + 40) error:a3];
}

- (id)propertiesByPropertyIdentifier
{
  objc_super v3 = self->_propertiesByPropertyIdentifier;
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (v3 == v4)
  {
    id v5 = 0;
  }
  else
  {
    if (!v3)
    {
      objc_super v6 = objc_opt_new();
      uint64_t v7 = [(WFLinkContentItemFilterAction *)self entityMetadata];
      id v8 = [v7 properties];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __63__WFLinkContentItemFilterAction_propertiesByPropertyIdentifier__block_invoke;
      v13[3] = &unk_1E6556708;
      id v14 = v6;
      id v9 = v6;
      [v8 enumerateObjectsUsingBlock:v13];

      id v5 = (NSDictionary *)[v9 copy];
      if (v5)
      {
        int v10 = v5;
      }
      else
      {
        int v10 = [MEMORY[0x1E4F1CA98] null];
      }
      propertiesByPropertyIdentifier = self->_propertiesByPropertyIdentifier;
      self->_propertiesByPropertyIdentifier = v10;

      goto LABEL_10;
    }
    id v5 = v3;
  }

LABEL_10:
  return v5;
}

void __63__WFLinkContentItemFilterAction_propertiesByPropertyIdentifier__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 identifier];

  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    objc_super v6 = [v3 identifier];
    [v5 setObject:v3 forKey:v6];
  }
  else
  {
    uint64_t v7 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v3 title];
      id v9 = [v8 key];
      int v10 = 136315394;
      id v11 = "-[WFLinkContentItemFilterAction propertiesByPropertyIdentifier]_block_invoke";
      __int16 v12 = 2112;
      long long v13 = v9;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s No property identifier found for propertyMetadata metadata: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)serializeAppIntentDescriptorIfNecessary
{
  id v3 = [(WFAction *)self appDefinition];
  if (v3)
  {
    id v4 = v3;
    [(WFAction *)self setSupplementalParameterValue:v3 forKey:@"AppIntentDescriptor"];
    id v3 = v4;
  }
}

- (void)initializeParameters
{
  v3.receiver = self;
  v3.super_class = (Class)WFLinkContentItemFilterAction;
  [(WFContentItemFilterAction *)&v3 initializeParameters];
  [(WFLinkContentItemFilterAction *)self serializeAppIntentDescriptorIfNecessary];
}

- (id)copyWithSerializedParameters:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  objc_super v6 = [(WFAction *)self identifier];
  uint64_t v7 = [(WFLinkContentItemFilterAction *)self queryMetadata];
  id v8 = [(WFLinkContentItemFilterAction *)self entityMetadata];
  id v9 = [(WFAction *)self definition];
  int v10 = [(WFLinkContentItemFilterAction *)self appIntentDescriptor];
  id v11 = [(WFLinkContentItemFilterAction *)self fullyQualifiedLinkActionIdentifier];
  __int16 v12 = (void *)[v5 initWithIdentifier:v6 queryMetadata:v7 entityMetadata:v8 definition:v9 serializedParameters:v4 appIntentDescriptor:v10 fullyQualifiedActionIdentifier:v11];

  return v12;
}

- (WFLinkContentItemFilterAction)initWithIdentifier:(id)a3 queryMetadata:(id)a4 entityMetadata:(id)a5 definition:(id)a6 serializedParameters:(id)a7 appIntentDescriptor:(id)a8 fullyQualifiedActionIdentifier:(id)a9
{
  id v26 = a4;
  id v25 = a5;
  id v16 = a8;
  id v17 = a9;
  v27.receiver = self;
  v27.super_class = (Class)WFLinkContentItemFilterAction;
  uint64_t v18 = [(WFContentItemAction *)&v27 initWithIdentifier:a3 definition:a6 serializedParameters:a7];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queryMetadata, a4);
    objc_storeStrong((id *)&v19->_entityMetadata, a5);
    objc_storeStrong((id *)&v19->_appIntentDescriptor, a8);
    objc_storeStrong((id *)&v19->_fullyQualifiedLinkActionIdentifier, a9);
    unsigned int v20 = [(WFLinkContentItemFilterAction *)v19 entityMetadata];
    uint64_t v21 = [v20 systemProtocolMetadata];
    id v22 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F72930]];
    v19->_fetchingUniqueEntity = v22 != 0;

    id v23 = v19;
  }

  return v19;
}

@end