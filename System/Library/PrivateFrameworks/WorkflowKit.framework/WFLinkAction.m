@interface WFLinkAction
+ (Class)classForLinkActionWithIdentifier:(id)a3 metadata:(id)a4;
+ (id)inputParameterMetadataWithActionMetadata:(id)a3;
+ (id)linkActionClassOverrides;
+ (id)linkProtocolClassOverrides;
+ (id)providedActionWithIdentifier:(id)a3 serializedParameters:(id)a4;
- (BOOL)canOfferSuggestionsForParameterWithKey:(id)a3;
- (BOOL)isPlatformProvidedUnderstandingAction;
- (BOOL)openWhenRunParameterIsHidden;
- (BOOL)opensWhenRun;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (BOOL)shouldBeIncludedInAppsList;
- (BOOL)showWhenRunParameterIsHidden;
- (BOOL)showsWhenRun;
- (BOOL)updateParameterSummaryIfNeededWithLinkAction:(id)a3;
- (BOOL)usesCompactUnlockService;
- (LNActionSummary)actionSummary;
- (NSNumber)opensWhenRunIfApplicable;
- (NSNumber)showsWhenRunIfApplicable;
- (NSProgress)executorProgress;
- (NSString)developerSpecifiedTitle;
- (NSString)mangledTypeName;
- (WFActionParameterSummary)parameterSummary;
- (WFLinkAction)initWithIdentifier:(id)a3 metadata:(id)a4 definition:(id)a5 serializedParameters:(id)a6 appIntentDescriptor:(id)a7 fullyQualifiedActionIdentifier:(id)a8;
- (WFLinkAction)linkActionWithParameterStates:(id)a3;
- (WFLinkAction)linkActionWithSerializedParameters;
- (id)currentParameterStates;
- (id)generatedResourceNodes;
- (id)icon;
- (id)iconName;
- (id)inputDictionary;
- (id)localizedCategoryWithContext:(id)a3;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (id)localizedDiscontinuedDescriptionWithContext:(id)a3;
- (id)localizedKeywordsWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)outputMeasurementUnitType;
- (id)parameterDefinitions;
- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (id)supportedAppIdentifiers;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)dealloc;
- (void)deregisterExecutorProgressListeners;
- (void)documentsValueFromRepresentation:(id)a3 valueType:(id)a4 completionHandler:(id)a5;
- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5;
- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4;
- (void)executor:(id)a3 needsValueWithRequest:(id)a4;
- (void)fetchSuggestedEntititiesForParameterWithKey:(id)a3 completionHandler:(id)a4;
- (void)finishRunningWithResult:(id)a3 error:(id)a4;
- (void)forceUpdateParameterVisibility;
- (void)getAlertForLinkResult:(id)a3 handler:(id)a4 completionHandler:(id)a5;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)getDocumentsLinkValueFromParameterMetadata:(id)a3 processedParameters:(id)a4 parameterState:(id)a5 valueType:(id)a6 completionHandler:(id)a7;
- (void)initializeParameters;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performPresentationAction:(id)a3;
- (void)performPresentationActionWithResult:(id)a3;
- (void)requestUnlock:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)runAsynchronouslyWithLinkAction:(id)a3;
- (void)serializeAppIntentDescriptorIfNecessary;
- (void)setActionSummary:(id)a3;
- (void)setExecutorProgress:(id)a3;
- (void)setParameterSummary:(id)a3;
- (void)setUsesCompactUnlockService:(BOOL)a3;
- (void)showResultIfNeeded:(id)a3 completionHandler:(id)a4;
- (void)updateParameterSummaryIfNeeded:(id)a3;
- (void)updateParameterVisibility;
- (void)wasAddedToWorkflow:(id)a3;
@end

@implementation WFLinkAction

- (void)serializeAppIntentDescriptorIfNecessary
{
  v3 = [(WFAction *)self serializedParameters];
  v4 = [v3 objectForKey:@"AppIntentDescriptor"];

  if (v4) {
    return;
  }
  v5 = (void *)MEMORY[0x1E4F223F8];
  v6 = [(WFAppIntentExecutionAction *)self fullyQualifiedLinkActionIdentifier];
  v7 = [v6 bundleIdentifier];
  v8 = [v5 bundleRecordWithBundleIdentifier:v7 allowPlaceholder:0 error:0];

  id v15 = v8;
  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v15 containingBundleRecord];

      if (!v9) {
        goto LABEL_9;
      }
LABEL_7:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = objc_alloc(MEMORY[0x1E4F302C8]);
        v11 = [(WFAppIntentExecutionAction *)self metadata];
        v12 = [v11 identifier];
        v13 = (void *)[v10 initWithIntentIdentifier:v12 applicationRecord:v9];

        v14 = [v13 serializedRepresentation];
        [(WFAction *)self setSupplementalParameterValue:v14 forKey:@"AppIntentDescriptor"];
      }
      goto LABEL_9;
    }
  }

  id v9 = v15;
  if (v9) {
    goto LABEL_7;
  }
LABEL_9:
}

- (WFLinkAction)linkActionWithParameterStates:(id)a3
{
  id v4 = a3;
  v5 = [(WFAppIntentExecutionAction *)self metadata];
  v6 = [v5 parameters];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __46__WFLinkAction_linkActionWithParameterStates___block_invoke;
  v14 = &unk_1E6550DA0;
  id v15 = v4;
  v16 = self;
  id v7 = v4;
  v8 = objc_msgSend(v6, "if_map:", &v11);

  id v9 = -[WFAppIntentExecutionAction linkActionWithParameters:](self, "linkActionWithParameters:", v8, v11, v12, v13, v14);

  return (WFLinkAction *)v9;
}

- (WFLinkAction)initWithIdentifier:(id)a3 metadata:(id)a4 definition:(id)a5 serializedParameters:(id)a6 appIntentDescriptor:(id)a7 fullyQualifiedActionIdentifier:(id)a8
{
  id v14 = a4;
  v29.receiver = self;
  v29.super_class = (Class)WFLinkAction;
  id v15 = [(WFAppIntentExecutionAction *)&v29 initWithIdentifier:a3 metadata:v14 definition:a5 serializedParameters:a6 appIntentDescriptor:a7 fullyQualifiedActionIdentifier:a8];
  if (v15)
  {
    v16 = [v14 actionConfiguration];
    v17 = [(WFLinkAction *)v15 linkActionWithParameterStates:MEMORY[0x1E4F1CC08]];
    v18 = [(WFAppIntentExecutionAction *)v15 actionConfigurationContext];
    v19 = [v16 actionConfigurationByEvaluatingAction:v17 context:v18];

    if (v19)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v20 = v19;
      }
      else {
        v20 = 0;
      }
    }
    else
    {
      v20 = 0;
    }
    v21 = v20;

    actionSummary = v15->_actionSummary;
    v15->_actionSummary = v21;

    v23 = [(LNActionSummary *)v15->_actionSummary localizedFormatStringForLocaleIdentifier:0];
    if (v23)
    {
      v24 = [[WFActionParameterSummary alloc] initWithLocalizedString:v23];
      parameterSummary = v15->_parameterSummary;
      v15->_parameterSummary = v24;
    }
    v26 = [v14 shortcutsActionMetadata];
    v15->_isBuiltIn = v26 != 0;

    [(WFAction *)v15 addEventObserver:v15];
    v27 = v15;
  }
  return v15;
}

NSString *__31__WFLinkAction_inputDictionary__block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

BOOL __57__WFLinkAction_inputParameterMetadataWithActionMetadata___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 valueType];
  id v4 = objc_msgSend(v3, "wf_entityValueType");
  if (v4) {
    BOOL v5 = [v2 inputConnectionBehavior] != 1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

BOOL __57__WFLinkAction_inputParameterMetadataWithActionMetadata___block_invoke(uint64_t a1, void *a2)
{
  return [a2 inputConnectionBehavior] == 2;
}

id __46__WFLinkAction_linkActionWithParameterStates___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  BOOL v5 = [v4 name];
  v6 = [v3 objectForKeyedSubscript:v5];

  id v7 = [*(id *)(a1 + 40) valueForParameterData:v4 withParameterState:v6];
  id v8 = objc_alloc(MEMORY[0x1E4F72D20]);
  id v9 = [v4 name];

  id v10 = (void *)[v8 initWithIdentifier:v9 value:v7];
  return v10;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFAppIntentExecutionAction *)self metadata];
  v6 = [v5 title];
  id v7 = [v4 locale];

  id v8 = [v7 localeIdentifier];
  id v9 = [v6 localizedStringForLocaleIdentifier:v8];

  return v9;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFAppIntentExecutionAction *)self metadata];
  v6 = [v5 descriptionMetadata];
  id v7 = [v6 descriptionText];

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

  id v10 = [v4 locale];

  uint64_t v11 = [v10 localeIdentifier];
  uint64_t v12 = [v9 localizedStringForLocaleIdentifier:v11];

  return v12;
}

- (void)initializeParameters
{
  v3.receiver = self;
  v3.super_class = (Class)WFLinkAction;
  [(WFAction *)&v3 initializeParameters];
  [(WFLinkAction *)self serializeAppIntentDescriptorIfNecessary];
}

- (id)parameterDefinitions
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  parameterDefinitions = self->_parameterDefinitions;
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (parameterDefinitions == v4)
  {
    BOOL v5 = 0;
  }
  else if (parameterDefinitions)
  {
    parameterDefinitions = parameterDefinitions;
    BOOL v5 = parameterDefinitions;
  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)WFLinkAction;
    v6 = [(WFAction *)&v34 parameterDefinitions];
    if ([(NSArray *)v6 count])
    {
      parameterDefinitions = 0;
      BOOL v5 = v6;
    }
    else
    {
      id v7 = objc_opt_new();
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v8 = [(WFAppIntentExecutionAction *)self metadata];
      id v9 = objc_msgSend(v8, "wf_parameterDefinitions");

      uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v31 != v12) {
              objc_enumerationMutation(v9);
            }
            [v7 addObject:*(void *)(*((void *)&v30 + 1) + 8 * i)];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v39 count:16];
        }
        while (v11);
      }

      BOOL v14 = [(WFLinkAction *)self showWhenRunParameterIsHidden];
      uint64_t v15 = MEMORY[0x1E4F1CC38];
      if (!v14)
      {
        v16 = [WFParameterDefinition alloc];
        v38[0] = @"ShowWhenRun";
        v37[0] = @"Key";
        v37[1] = @"Class";
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        v38[1] = v18;
        v38[2] = v15;
        v37[2] = @"DefaultValue";
        v37[3] = @"Label";
        v19 = WFLocalizedString(@"Show When Run");
        v38[3] = v19;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:4];
        v21 = [(WFParameterDefinition *)v16 initWithDictionary:v20];

        uint64_t v15 = MEMORY[0x1E4F1CC38];
        [v7 addObject:v21];
      }
      if (![(WFLinkAction *)self openWhenRunParameterIsHidden])
      {
        v22 = [WFParameterDefinition alloc];
        v36[0] = @"OpenWhenRun";
        v35[0] = @"Key";
        v35[1] = @"Class";
        v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        v36[1] = v24;
        v36[2] = v15;
        v35[2] = @"DefaultValue";
        v35[3] = @"Label";
        v25 = WFLocalizedString(@"Open When Run");
        v36[3] = v25;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:4];
        v27 = [(WFParameterDefinition *)v22 initWithDictionary:v26];

        [v7 addObject:v27];
      }
      BOOL v5 = (NSArray *)[v7 copy];

      if (v5)
      {
        v28 = v5;
      }
      else
      {
        v28 = [MEMORY[0x1E4F1CA98] null];
      }
      parameterDefinitions = self->_parameterDefinitions;
      self->_parameterDefinitions = v28;
    }
  }

  return v5;
}

- (BOOL)showWhenRunParameterIsHidden
{
  id v2 = [(WFAppIntentExecutionAction *)self metadata];
  BOOL v3 = ([v2 outputFlags] & 6) == 0;

  return v3;
}

- (BOOL)openWhenRunParameterIsHidden
{
  id v2 = [(WFAppIntentExecutionAction *)self metadata];
  BOOL v3 = ([v2 outputFlags] & 1) == 0;

  return v3;
}

- (id)inputDictionary
{
  v28[3] = *MEMORY[0x1E4F143B8];
  inputDictionary = self->_inputDictionary;
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (inputDictionary == v4)
  {
    BOOL v5 = 0;
  }
  else if (inputDictionary)
  {
    inputDictionary = inputDictionary;
    BOOL v5 = inputDictionary;
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)WFLinkAction;
    v6 = [(WFAction *)&v26 inputDictionary];
    id v7 = objc_opt_class();
    id v8 = [(WFAppIntentExecutionAction *)self metadata];
    inputDictionary = [v7 inputParameterMetadataWithActionMetadata:v8];

    if (inputDictionary)
    {
      id v9 = [(NSDictionary *)inputDictionary valueType];
      uint64_t v10 = [(WFAppIntentExecutionAction *)self fullyQualifiedLinkActionIdentifier];
      BOOL v5 = [v10 bundleIdentifier];
      uint64_t v11 = objc_msgSend(v9, "wf_contentItemClassesWithAppBundleIdentifier:", v5);

      if (v11)
      {
        uint64_t v12 = (void *)[v6 mutableCopy];
        v13 = v12;
        v25 = v6;
        if (v12) {
          id v14 = v12;
        }
        else {
          id v14 = (id)objc_opt_new();
        }
        v16 = v14;

        v27[0] = @"Multiple";
        v17 = NSNumber;
        objc_opt_class();
        v18 = [v17 numberWithBool:objc_opt_isKindOfClass() & 1];
        v28[0] = v18;
        v27[1] = @"Types";
        objc_msgSend(v11, "if_map:", &__block_literal_global_234);
        v20 = v19 = v9;
        v28[1] = v20;
        v27[2] = @"ParameterKey";
        v21 = [(NSDictionary *)inputDictionary name];
        v28[2] = v21;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
        [v16 addEntriesFromDictionary:v22];

        id v9 = v19;
        BOOL v5 = (void *)[v16 copy];

        v6 = v25;
      }
      else
      {
        id v15 = v6;
      }

      if (v11)
      {
        if (v5)
        {
          v23 = v5;
        }
        else
        {
          v23 = [MEMORY[0x1E4F1CA98] null];
        }
        inputDictionary = self->_inputDictionary;
        self->_inputDictionary = v23;
        goto LABEL_19;
      }
      inputDictionary = 0;
    }
    BOOL v5 = v6;
  }
LABEL_19:

  return v5;
}

+ (id)inputParameterMetadataWithActionMetadata:(id)a3
{
  id v3 = a3;
  id v4 = [v3 parameters];
  BOOL v5 = objc_msgSend(v4, "if_firstObjectPassingTest:", &__block_literal_global_224);

  if (!v5)
  {
    v6 = [v3 parameters];
    id v7 = objc_msgSend(v6, "if_objectsPassingTest:", &__block_literal_global_226);

    if ([v7 count] == 1)
    {
      id v8 = [v7 firstObject];

      goto LABEL_6;
    }
  }
  id v8 = v5;
LABEL_6:

  return v8;
}

+ (Class)classForLinkActionWithIdentifier:(id)a3 metadata:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [a1 linkActionClassOverrides];
  uint64_t v10 = (void *)[v9 objectForKeyedSubscript:v7];

  if (v10)
  {
LABEL_14:
    if ([v10 isSubclassOfClass:objc_opt_class()]) {
      goto LABEL_15;
    }
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"WFLinkActionOverrides.m" lineNumber:1586 description:@"Link override class must be a WFAction"];
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v11 = [v8 systemProtocols];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      v20 = a2;
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v21 + 1) + 8 * v15) identifier];
          if (v16)
          {
            v17 = [a1 linkProtocolClassOverrides];
            uint64_t v10 = (void *)[v17 objectForKeyedSubscript:v16];

            if (v10)
            {

              a2 = v20;
              goto LABEL_14;
            }
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    uint64_t v10 = 0;
  }

LABEL_15:
  v18 = v10;

  return v18;
}

+ (id)linkActionClassOverrides
{
  if (linkActionClassOverrides_token != -1) {
    dispatch_once(&linkActionClassOverrides_token, &__block_literal_global_1089);
  }
  id v2 = (void *)linkActionClassOverrides_linkActionClassOverrides;
  return v2;
}

+ (id)linkProtocolClassOverrides
{
  if (linkProtocolClassOverrides_token != -1) {
    dispatch_once(&linkProtocolClassOverrides_token, &__block_literal_global_1170);
  }
  id v2 = (void *)linkProtocolClassOverrides_linkProtocolClassOverrides;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executorProgress, 0);
  objc_storeStrong((id *)&self->_mangledTypeName, 0);
  objc_storeStrong((id *)&self->_parameterSummary, 0);
  objc_storeStrong((id *)&self->_actionSummary, 0);
  objc_storeStrong((id *)&self->_outputMeasurementUnitType, 0);
  objc_storeStrong((id *)&self->_inputDictionary, 0);
  objc_storeStrong((id *)&self->_parameterDefinitions, 0);
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5 = [(WFLinkAction *)self linkActionWithSerializedParameters];
  [(WFLinkAction *)self updateParameterSummaryIfNeededWithLinkAction:v5];
}

- (BOOL)updateParameterSummaryIfNeededWithLinkAction:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAppIntentExecutionAction *)self metadata];
  v6 = [v5 actionConfiguration];
  id v7 = [(WFAppIntentExecutionAction *)self actionConfigurationContext];
  id v8 = [v6 actionConfigurationByEvaluatingAction:v4 context:v7];

  id v9 = v8;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  uint64_t v12 = [(WFLinkAction *)self actionSummary];
  if (!v12) {
    goto LABEL_10;
  }
  uint64_t v13 = (void *)v12;
  if (!v11)
  {
    BOOL v16 = 0;
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v14 = [(WFLinkAction *)self actionSummary];
  char v15 = [v14 isEqual:v11];

  if ((v15 & 1) == 0)
  {
LABEL_10:
    [(WFLinkAction *)self setActionSummary:v11];
    uint64_t v13 = [v11 localizedFormatStringForLocaleIdentifier:0];
    if (v13)
    {
      v17 = [[WFActionParameterSummary alloc] initWithLocalizedString:v13];
      [(WFLinkAction *)self setParameterSummary:v17];
    }
    [(WFLinkAction *)self updateParameterVisibility];
    BOOL v16 = 1;
    goto LABEL_14;
  }
  BOOL v16 = 0;
LABEL_15:

  return v16;
}

- (LNActionSummary)actionSummary
{
  return self->_actionSummary;
}

- (void)updateParameterVisibility
{
  id v2 = self;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFLinkAction *)self actionSummary];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 summaryString];
    v6 = [v5 parameterIdentifiers];
    if ([v6 count])
    {
    }
    else
    {
      id v7 = [v4 otherParameterIdentifiers];
      uint64_t v8 = [v7 count];

      if (!v8)
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        obuint64_t j = [(WFAction *)v2 parameters];
        uint64_t v29 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          uint64_t v31 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v40 != v31) {
                objc_enumerationMutation(obj);
              }
              [*(id *)(*((void *)&v39 + 1) + 8 * i) setHidden:0];
            }
            uint64_t v30 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
          }
          while (v30);
        }
        goto LABEL_17;
      }
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v9 = [(WFAppIntentExecutionAction *)v2 metadata];
    uint64_t v10 = [v9 parameters];

    obuint64_t j = v10;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v36;
      long long v33 = v2;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v36 != v13) {
            objc_enumerationMutation(obj);
          }
          char v15 = [*(id *)(*((void *)&v35 + 1) + 8 * j) name];
          BOOL v16 = [(WFAction *)v2 parameterForKey:v15];

          v17 = [v4 summaryString];
          v18 = [v17 parameterIdentifiers];
          v19 = [v16 key];
          if ([v18 containsObject:v19])
          {
            [v16 setHidden:0];
          }
          else
          {
            [v4 otherParameterIdentifiers];
            uint64_t v20 = v12;
            uint64_t v21 = v13;
            v23 = long long v22 = v4;
            long long v24 = [v16 key];
            objc_msgSend(v16, "setHidden:", objc_msgSend(v23, "containsObject:", v24) ^ 1);

            id v4 = v22;
            uint64_t v13 = v21;
            uint64_t v12 = v20;
            id v2 = v33;
          }

          if ([(WFAction *)v2 shouldInsertExpandingParameterForParameter:v16])
          {
            v25 = NSString;
            uint64_t v26 = [v16 key];
            v27 = [v25 stringWithFormat:@"Show-%@", v26];

            v28 = [(WFAction *)v2 parameterForKey:v27];
            objc_msgSend(v28, "setHidden:", objc_msgSend(v16, "isHidden"));
          }
          [v16 attributesDidChange];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v12);
    }
LABEL_17:
  }
}

- (void)setActionSummary:(id)a3
{
}

- (WFLinkAction)linkActionWithSerializedParameters
{
  id v3 = [(WFLinkAction *)self currentParameterStates];
  id v4 = [(WFLinkAction *)self linkActionWithParameterStates:v3];

  return (WFLinkAction *)v4;
}

- (id)currentParameterStates
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFAction *)self parameters];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "key", (void)v15);
        uint64_t v12 = [(WFAction *)self parameterStateForKey:v11];
        uint64_t v13 = [v10 key];
        objc_msgSend(v4, "if_setValueIfNonNil:forKey:", v12, v13);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isPlatformProvidedUnderstandingAction
{
  return 0;
}

- (void)documentsValueFromRepresentation:(id)a3 valueType:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (a3)
  {
    uint64_t v10 = [MEMORY[0x1E4F5A848] itemWithFile:a3];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __88__WFLinkAction_Documents__documentsValueFromRepresentation_valueType_completionHandler___block_invoke;
    v11[3] = &unk_1E654F4C8;
    id v13 = v9;
    id v12 = v7;
    [v10 getObjectRepresentation:v11 forClass:objc_opt_class()];
  }
  else
  {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
}

void __88__WFLinkAction_Documents__documentsValueFromRepresentation_valueType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (objc_class *)MEMORY[0x1E4F72E10];
  id v5 = a2;
  id v6 = (id)[[v4 alloc] initWithValue:v5 valueType:*(void *)(a1 + 32)];

  (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v6, 0);
}

- (void)getDocumentsLinkValueFromParameterMetadata:(id)a3 processedParameters:(id)a4 parameterState:(id)a5 valueType:(id)a6 completionHandler:(id)a7
{
  id v11 = a6;
  id v12 = a7;
  id v13 = a4;
  uint64_t v14 = [a3 name];
  long long v15 = [v13 objectForKeyedSubscript:v14];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v11;
    id v17 = v15;
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        long long v18 = v17;
      }
      else {
        long long v18 = 0;
      }
    }
    else
    {
      long long v18 = 0;
    }
    id v21 = v18;

    if ([v21 count])
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __133__WFLinkAction_Documents__getDocumentsLinkValueFromParameterMetadata_processedParameters_parameterState_valueType_completionHandler___block_invoke;
      v26[3] = &unk_1E654F4A0;
      v26[4] = self;
      id v27 = v16;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __133__WFLinkAction_Documents__getDocumentsLinkValueFromParameterMetadata_processedParameters_parameterState_valueType_completionHandler___block_invoke_2;
      v23[3] = &unk_1E6558040;
      id v25 = v12;
      id v24 = v27;
      objc_msgSend(v21, "if_mapAsynchronously:completionHandler:", v26, v23);
    }
    else
    {
      (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
    }
  }
  else
  {
    id v19 = v15;
    if (v19)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0;
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
    id v22 = v20;

    [(WFLinkAction *)self documentsValueFromRepresentation:v22 valueType:v11 completionHandler:v12];
  }
}

void __133__WFLinkAction_Documents__getDocumentsLinkValueFromParameterMetadata_processedParameters_parameterState_valueType_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v11 = a2;
  id v6 = a4;
  id v7 = *(void **)(a1 + 32);
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v11;
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
  uint64_t v10 = [*(id *)(a1 + 40) memberValueType];
  [v7 documentsValueFromRepresentation:v9 valueType:v10 completionHandler:v6];
}

void __133__WFLinkAction_Documents__getDocumentsLinkValueFromParameterMetadata_processedParameters_parameterState_valueType_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = (objc_class *)MEMORY[0x1E4F72E10];
  id v7 = a3;
  id v8 = a2;
  id v9 = [v6 alloc];
  id v11 = [*(id *)(a1 + 32) memberValueType];
  uint64_t v10 = (void *)[v9 initWithValues:v8 memberValueType:v11];

  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v10, v7);
}

void __53__WFLinkAction_Overrides__linkProtocolClassOverrides__block_invoke()
{
  v13[10] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F72940];
  v0 = self;
  v13[0] = v0;
  v12[1] = *MEMORY[0x1E4F72960];
  v1 = self;
  v13[1] = v1;
  v12[2] = *MEMORY[0x1E4F72978];
  id v2 = self;
  v13[2] = v2;
  v12[3] = *MEMORY[0x1E4F72958];
  uint64_t v3 = self;
  v13[3] = v3;
  v12[4] = *MEMORY[0x1E4F72988];
  id v4 = self;
  v13[4] = v4;
  v12[5] = *MEMORY[0x1E4F72948];
  uint64_t v5 = self;
  v13[5] = v5;
  v12[6] = *MEMORY[0x1E4F72970];
  id v6 = self;
  v13[6] = v6;
  v12[7] = *MEMORY[0x1E4F72950];
  id v7 = self;
  v13[7] = v7;
  v12[8] = *MEMORY[0x1E4F72990];
  id v8 = self;
  v13[8] = v8;
  v12[9] = *MEMORY[0x1E4F72968];
  id v9 = self;
  v13[9] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:10];
  id v11 = (void *)linkProtocolClassOverrides_linkProtocolClassOverrides;
  linkProtocolClassOverrides_linkProtocolClassOverrides = v10;
}

void __51__WFLinkAction_Overrides__linkActionClassOverrides__block_invoke()
{
  v89[66] = *MEMORY[0x1E4F143B8];
  v88[0] = @"com.apple.mobilecal.Close";
  v79 = self;
  v89[0] = v79;
  v88[1] = @"com.apple.mobilecal.CreateCalendar";
  v78 = self;
  v89[1] = v78;
  v88[2] = @"com.apple.mobilecal.DeleteCalendar";
  v77 = self;
  v89[2] = v77;
  v88[3] = @"com.apple.mobilecal.OpenScreen";
  v76 = self;
  v89[3] = v76;
  v88[4] = @"com.apple.iBooks.BookReaderChangePageNavigationIntent";
  v75 = self;
  v89[4] = v75;
  v88[5] = @"com.apple.iBooks.BookReaderChangeThemeIntent";
  v74 = self;
  v89[5] = v74;
  v88[6] = @"com.apple.iBooks.BookReaderNavigatePagesIntent";
  v73 = self;
  v89[6] = v73;
  v88[7] = @"com.apple.iBooks.OpenAssetIntent";
  v72 = self;
  v89[7] = v72;
  v88[8] = @"com.apple.iBooks.OpenDefaultCollectionIntent";
  v71 = self;
  v89[8] = v71;
  v88[9] = @"com.apple.iBooks.OpenTabBarItemIntent";
  v70 = self;
  v89[9] = v70;
  v88[10] = @"com.apple.iBooks.PlayAudiobookIntent";
  v69 = self;
  v89[10] = v69;
  v88[11] = @"com.apple.iBooks.SearchBooksIntent";
  v68 = self;
  v89[11] = v68;
  v88[12] = @"com.apple.iBooks.BookAppEntity";
  v67 = self;
  v89[12] = v67;
  v88[13] = @"com.apple.mobilenotes.AddTagsToNotesLinkAction";
  v66 = self;
  v89[13] = v66;
  v88[14] = @"com.apple.mobilenotes.RemoveTagsFromNotesLinkAction";
  v65 = self;
  v89[14] = v65;
  v88[15] = @"com.apple.mobilenotes.MoveNotesToFolderLinkAction";
  v64 = self;
  v89[15] = v64;
  v88[16] = @"com.apple.mobilenotes.OpenAppLocationLinkAction";
  v63 = self;
  v89[16] = v63;
  v88[17] = @"com.apple.mobilenotes.PinNotesLinkAction";
  v62 = self;
  v89[17] = v62;
  v88[18] = @"com.apple.mobilenotes.CreateFolderLinkAction";
  v61 = self;
  v89[18] = v61;
  v88[19] = @"com.apple.mobilenotes.CreateTagLinkAction";
  v60 = self;
  v89[19] = v60;
  v88[20] = @"com.apple.mobilenotes.DeleteTagsLinkAction";
  v59 = self;
  v89[20] = v59;
  v88[21] = @"com.apple.mobilenotes.DeleteFoldersLinkAction";
  v58 = self;
  v89[21] = v58;
  v88[22] = @"com.apple.mobilenotes.OpenFolderLinkAction";
  v57 = self;
  v89[22] = v57;
  v88[23] = @"com.apple.mobilenotes.OpenTagLinkAction";
  v56 = self;
  v89[23] = v56;
  v88[24] = @"com.apple.mobilenotes.OpenAccountLinkAction";
  v55 = self;
  v89[24] = v55;
  v88[25] = @"com.apple.mobilenotes.ChangeSettingLinkAction";
  v54 = self;
  v89[25] = v54;
  v88[26] = @"is.workflow.actions.filter.notes";
  v53 = self;
  v89[26] = v53;
  v88[27] = @"com.apple.VoiceMemos.ChangeRecordingPlaybackSetting";
  v52 = self;
  v89[27] = v52;
  v88[28] = @"com.apple.VoiceMemos.PlaybackVoiceMemoIntent";
  v51 = self;
  v89[28] = v51;
  v88[29] = @"com.apple.VoiceMemos.SearchRecordings";
  v50 = self;
  v89[29] = v50;
  v88[30] = @"com.apple.VoiceMemos.CreateFolder";
  v49 = self;
  v89[30] = v49;
  v88[31] = @"com.apple.VoiceMemos.DeleteFolder";
  v48 = self;
  v89[31] = v48;
  v88[32] = @"com.apple.VoiceMemos.DeleteRecording";
  v47 = self;
  v89[32] = v47;
  v88[33] = @"com.apple.VoiceMemos.OpenFolder";
  v46 = self;
  v89[33] = v46;
  v88[34] = @"com.apple.VoiceMemos.SelectRecording";
  uint64_t v45 = self;
  v89[34] = v45;
  v88[35] = @"com.apple.reminders.TTRCreateListAppIntent";
  v44 = self;
  v89[35] = v44;
  v88[36] = @"com.apple.reminders.TTROpenSmartListAppIntent";
  v43 = self;
  v89[36] = v43;
  v88[37] = @"com.apple.mobilesafari.CreateNewTab";
  long long v42 = self;
  v89[37] = v42;
  v88[38] = @"com.apple.mobilesafari.CreateNewPrivateTab";
  long long v41 = self;
  v89[38] = v41;
  v88[39] = @"com.apple.mobilesafari.CloseTab";
  long long v40 = self;
  v89[39] = v40;
  v88[40] = @"com.apple.mobilesafari.CreateNewTabGroup";
  long long v39 = self;
  v89[40] = v39;
  v88[41] = @"com.apple.mobilesafari.OpenTabGroup";
  long long v38 = self;
  v89[41] = v38;
  v88[42] = @"com.apple.mobilesafari.OpenTab";
  long long v37 = self;
  v89[42] = v37;
  v88[43] = @"com.apple.mobilesafari.OpenBookmark";
  long long v36 = self;
  v89[43] = v36;
  v88[44] = @"com.apple.mobilesafari.OpenReadingListItem";
  long long v35 = self;
  v89[44] = v35;
  v88[45] = @"com.apple.mobilesafari.OpenView";
  objc_super v34 = self;
  v89[45] = v34;
  v88[46] = @"com.apple.mobilesafari.BookmarkEntity";
  long long v33 = self;
  v89[46] = v33;
  v88[47] = @"com.apple.mobilesafari.ReadingListItemEntity";
  long long v32 = self;
  v89[47] = v32;
  v88[48] = @"com.apple.mobilesafari.TabEntity";
  uint64_t v31 = self;
  v89[48] = v31;
  v88[49] = @"com.apple.mobilesafari.TabGroupEntity";
  uint64_t v30 = self;
  v89[49] = v30;
  v88[50] = @"com.apple.mobilesafari.ChangeReaderModeState";
  uint64_t v29 = self;
  v89[50] = v29;
  v88[51] = @"com.apple.musicrecognition.RecognizeMusicIntent";
  v28 = self;
  v89[51] = v28;
  v88[52] = @"com.apple.shortcuts.CreateWorkflowAction";
  id v27 = self;
  v89[52] = v27;
  v88[53] = @"com.apple.shortcuts.DeleteWorkflowAction";
  uint64_t v26 = self;
  v89[53] = v26;
  v88[54] = @"com.apple.shortcuts.SearchShortcutsAction";
  v0 = self;
  v89[54] = v0;
  v88[55] = @"com.apple.shortcuts.CreateShortcutiCloudLinkAction";
  v1 = self;
  v89[55] = v1;
  v88[56] = @"com.apple.shortcuts.RunShortcutIntent";
  v89[56] = objc_opt_class();
  v88[57] = @"com.apple.shortcuts.RunShortcutConfigurationIntent";
  v89[57] = objc_opt_class();
  v88[58] = @"com.apple.shortcuts.WFShortcutsSmallWidgetConfigurationIntent";
  v89[58] = objc_opt_class();
  v88[59] = @"com.apple.shortcuts.WFShortcutsWidgetConfigurationIntent";
  v89[59] = objc_opt_class();
  v88[60] = @"com.apple.shortcuts.SetDataRoamingAction";
  id v2 = self;
  v89[60] = v2;
  v88[61] = @"com.apple.shortcuts.SetDefaultCellularPlanAction";
  uint64_t v3 = self;
  v89[61] = v3;
  v88[62] = @"com.apple.shortcuts.ResetCellularDataStatisticsAction";
  id v4 = self;
  v89[62] = v4;
  v88[63] = @"com.apple.shortcuts.ToggleCellularPlanAction";
  uint64_t v5 = self;
  v89[63] = v5;
  v88[64] = *MEMORY[0x1E4FB4DC0];
  id v6 = self;
  v89[64] = v6;
  v88[65] = @"com.apple.ShortcutsActions.OpenCameraAction";
  id v7 = self;
  v89[65] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:66];
  id v9 = (void *)linkActionClassOverrides_linkActionClassOverrides;
  linkActionClassOverrides_linkActionClassOverrides = v8;

  if (NSClassFromString(&cfstr_Wfcreatenoteac.isa))
  {
    uint64_t v10 = (void *)linkActionClassOverrides_linkActionClassOverrides;
    v86[0] = @"com.apple.mobilenotes.SharingExtension";
    v87[0] = NSClassFromString(&cfstr_Wfcreatenoteac.isa);
    v86[1] = @"is.workflow.actions.appendnote";
    v87[1] = NSClassFromString(&cfstr_Wfappendtonote.isa);
    v86[2] = @"is.workflow.actions.shownote";
    v87[2] = NSClassFromString(&cfstr_Wfshownoteacti.isa);
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:v86 count:3];
    uint64_t v12 = objc_msgSend(v10, "if_dictionaryByAddingEntriesFromDictionary:", v11);
    id v13 = (void *)linkActionClassOverrides_linkActionClassOverrides;
    linkActionClassOverrides_linkActionClassOverrides = v12;
  }
  if (NSClassFromString(&cfstr_Wfstarttimerac.isa))
  {
    uint64_t v14 = (void *)linkActionClassOverrides_linkActionClassOverrides;
    v84[0] = @"is.workflow.actions.timer.start";
    v84[1] = @"com.apple.mobiletimer.INCreateTimerIntent";
    v85[0] = NSClassFromString(&cfstr_Wfstarttimerac.isa);
    v85[1] = NSClassFromString(&cfstr_Wfstarttimerac.isa);
    long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
    uint64_t v16 = objc_msgSend(v14, "if_dictionaryByAddingEntriesFromDictionary:", v15);
    id v17 = (void *)linkActionClassOverrides_linkActionClassOverrides;
    linkActionClassOverrides_linkActionClassOverrides = v16;
  }
  if (NSClassFromString(&cfstr_Wflinkclockcre.isa))
  {
    long long v18 = (void *)linkActionClassOverrides_linkActionClassOverrides;
    v82[0] = @"com.apple.mobiletimer-framework.MobileTimerIntents.MTCreateAlarmIntent";
    v82[1] = @"com.apple.mobiletimer.CreateAlarmIntent";
    v83[0] = NSClassFromString(&cfstr_Wflinkclockcre.isa);
    v83[1] = NSClassFromString(&cfstr_Wflinkclockcre.isa);
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];
    uint64_t v20 = objc_msgSend(v18, "if_dictionaryByAddingEntriesFromDictionary:", v19);
    id v21 = (void *)linkActionClassOverrides_linkActionClassOverrides;
    linkActionClassOverrides_linkActionClassOverrides = v20;
  }
  if (NSClassFromString(&cfstr_Wflinkclocktog.isa))
  {
    id v22 = (void *)linkActionClassOverrides_linkActionClassOverrides;
    v80[0] = @"com.apple.mobiletimer-framework.MobileTimerIntents.MTToggleAlarmIntent";
    v80[1] = @"com.apple.mobiletimer.ToggleAlarmIntent";
    v81[0] = NSClassFromString(&cfstr_Wflinkclocktog.isa);
    v81[1] = NSClassFromString(&cfstr_Wflinkclocktog.isa);
    long long v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v81 forKeys:v80 count:2];
    uint64_t v24 = objc_msgSend(v22, "if_dictionaryByAddingEntriesFromDictionary:", v23);
    id v25 = (void *)linkActionClassOverrides_linkActionClassOverrides;
    linkActionClassOverrides_linkActionClassOverrides = v24;
  }
}

- (void)setUsesCompactUnlockService:(BOOL)a3
{
  self->_usesCompactUnlockService = a3;
}

- (BOOL)usesCompactUnlockService
{
  return self->_usesCompactUnlockService;
}

- (NSProgress)executorProgress
{
  return self->_executorProgress;
}

- (NSString)mangledTypeName
{
  return self->_mangledTypeName;
}

- (void)setParameterSummary:(id)a3
{
}

- (WFActionParameterSummary)parameterSummary
{
  return self->_parameterSummary;
}

- (void)dealloc
{
  [(WFLinkAction *)self deregisterExecutorProgressListeners];
  v3.receiver = self;
  v3.super_class = (Class)WFLinkAction;
  [(WFLinkAction *)&v3 dealloc];
}

- (void)getAlertForLinkResult:(id)a3 handler:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__WFLinkAction_getAlertForLinkResult_handler_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6550EB0;
  id v10 = v7;
  id v21 = v10;
  id v11 = _Block_copy(aBlock);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __64__WFLinkAction_getAlertForLinkResult_handler_completionHandler___block_invoke_3;
  v16[3] = &unk_1E6550ED8;
  id v17 = v10;
  id v18 = v8;
  id v19 = v9;
  uint64_t v12 = (void (*)(void *, void *))v11[2];
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  v12(v11, v16);
}

void __64__WFLinkAction_getAlertForLinkResult_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WFLocalizedString(@"Action completed successfully.");
  uint64_t v5 = [*(id *)(a1 + 32) output];
  id v6 = [v5 dialog];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) output];
    id v8 = [v7 dialog];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__WFLinkAction_getAlertForLinkResult_handler_completionHandler___block_invoke_2;
    v9[3] = &unk_1E65517E8;
    id v10 = v4;
    id v11 = v3;
    [v8 getResultWithCompletionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void *))v3 + 2))(v3, v4);
  }
}

void __64__WFLinkAction_getAlertForLinkResult_handler_completionHandler___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [WFLinkResultDialogRequest alloc];
  uint64_t v5 = a1[4];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB46C0]) initWithTitle:0 icon:0];
  uint64_t v12 = [(WFLinkResultDialogRequest *)v4 initWithSuccessResult:v5 attribution:v6];

  id v7 = [MEMORY[0x1E4F5A768] alertWithPreferredStyle:0];
  [v7 setMessage:v3];

  id v8 = (void *)MEMORY[0x1E4F5A770];
  id v9 = [(WFLinkResultDialogRequest *)v12 doneButton];
  id v10 = [v9 title];
  id v11 = [v8 buttonWithTitle:v10 style:0 handler:a1[5]];

  [v7 addButton:v11];
  (*(void (**)(void))(a1[6] + 16))();
}

void __64__WFLinkAction_getAlertForLinkResult_handler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 print];
  id v4 = [v3 firstObject];

  uint64_t v5 = [v4 length];
  id v6 = v4;
  if (!v5) {
    id v6 = *(void **)(a1 + 32);
  }
  id v7 = v6;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7 = a3;
  id v8 = NSString;
  id v9 = a5;
  id v10 = a4;
  if (v7)
  {
    id v11 = WFLocalizedString(@"Allow “%@” to share %@ with “%@”?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v7, v10);
  }
  else
  {
    id v11 = WFLocalizedString(@"Allow “%@” to run actions from “%@”?");
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  uint64_t v12 = };

  return v12;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAppIntentExecutionAction *)self appDescriptor];

  if (v5 && !self->_isBuiltIn)
  {
    id v6 = [(WFAppIntentExecutionAction *)self metadata];
    id v7 = [v6 systemProtocols];
    id v8 = [MEMORY[0x1E4F72DD8] requiresMDMChecksProtocol];
    char v9 = [v7 containsObject:v8];

    if (v9)
    {
      id v10 = [(WFAction *)self processedParameters];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __59__WFLinkAction_getContentDestinationWithCompletionHandler___block_invoke;
      v15[3] = &unk_1E6550E88;
      v15[4] = self;
      id v16 = v4;
      [(WFAppIntentExecutionAction *)self getLinkActionWithProcessedParameters:v10 completionHandler:v15];
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4F5A788];
      uint64_t v12 = [(WFAppIntentExecutionAction *)self displayableAppDescriptor];
      if (v12)
      {
        id v13 = [v11 locationWithAppDescriptor:v12];
      }
      else
      {
        uint64_t v14 = [(WFAppIntentExecutionAction *)self appDescriptor];
        id v13 = [v11 locationWithAppDescriptor:v14];
      }
      (*((void (**)(id, void *, void))v4 + 2))(v4, v13, 0);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

void __59__WFLinkAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) connection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__WFLinkAction_getContentDestinationWithCompletionHandler___block_invoke_340;
    v10[3] = &unk_1E65549A0;
    id v8 = *(id *)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = v8;
    [v7 fetchDestinationMDMAccountIdentifierForAction:v5 completionHandler:v10];
  }
  else
  {
    char v9 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[WFLinkAction getContentDestinationWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Failed to get LNAction for MDM accountIdentifier fetch.", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __59__WFLinkAction_getContentDestinationWithCompletionHandler___block_invoke_340(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = getWFAppIntentsLogObject();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
    {
      int v15 = 136315394;
      id v16 = "-[WFLinkAction getContentDestinationWithCompletionHandler:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEBUG, "%s MDM: Setting an account destination with identifier %@.", (uint8_t *)&v15, 0x16u);
    }

    char v9 = (void *)MEMORY[0x1E4F5A760];
    id v10 = [*(id *)(a1 + 32) appDescriptor];
    id v11 = [v9 locationWithAccountIdentifier:v5 appDescriptor:v10];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v8)
    {
      int v15 = 136315138;
      id v16 = "-[WFLinkAction getContentDestinationWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEBUG, "%s LNAction returned a nil accountIdentifier.", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v12 = (void *)MEMORY[0x1E4F5A788];
    uint64_t v13 = *(void *)(a1 + 40);
    id v11 = [*(id *)(a1 + 32) appDescriptor];
    uint64_t v14 = [v12 locationWithAppDescriptor:v11];
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, v14, v6);

    id v6 = (id)v14;
  }
}

- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__WFLinkAction_executor_didCompleteExecutionWithResult_error___block_invoke;
    v9[3] = &unk_1E65556E0;
    void v9[4] = self;
    id v10 = v7;
    id v11 = v8;
    [(WFLinkAction *)self showResultIfNeeded:v10 completionHandler:v9];
  }
  else
  {
    [(WFLinkAction *)self finishRunningWithResult:0 error:v8];
  }
}

uint64_t __62__WFLinkAction_executor_didCompleteExecutionWithResult_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRunningWithResult:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v5 = a4;
  id v6 = [v5 dialog];

  if (v6)
  {
    id v7 = [v5 dialog];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__WFLinkAction_executor_needsDisambiguationWithRequest___block_invoke;
    v9[3] = &unk_1E6555D50;
    void v9[4] = self;
    id v10 = v5;
    [v7 getResultWithCompletionHandler:v9];
  }
  else
  {
    id v8 = [v5 parameterName];
    [(WFAppIntentExecutionAction *)self disambiguateParameterForParameterName:v8 request:v5 dialogString:0];
  }
}

void __56__WFLinkAction_executor_needsDisambiguationWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v9 = [v4 parameterName];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [v5 captionPrint];

  id v8 = [v7 firstObject];
  [v3 disambiguateParameterForParameterName:v9 request:v6 dialogString:v8];
}

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 dialog];

  if (v6)
  {
    id v7 = [v5 dialog];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__WFLinkAction_executor_needsConfirmationWithRequest___block_invoke;
    v9[3] = &unk_1E6555D50;
    void v9[4] = self;
    id v10 = v5;
    [v7 getResultWithCompletionHandler:v9];
  }
  else
  {
    id v8 = [v5 parameterName];
    [(WFAppIntentExecutionAction *)self confirmParameterValueForParameterName:v8 request:v5 dialogString:0];
  }
}

void __54__WFLinkAction_executor_needsConfirmationWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v9 = [v4 parameterName];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [v5 captionPrint];

  id v8 = [v7 firstObject];
  [v3 confirmParameterValueForParameterName:v9 request:v6 dialogString:v8];
}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 dialog];

  if (v6)
  {
    id v7 = [v5 dialog];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__WFLinkAction_executor_needsValueWithRequest___block_invoke;
    v9[3] = &unk_1E6555D50;
    void v9[4] = self;
    id v10 = v5;
    [v7 getResultWithCompletionHandler:v9];
  }
  else
  {
    id v8 = [v5 parameterName];
    [(WFAppIntentExecutionAction *)self askForParameterValueForParameterName:v8 request:v5 dialogString:0];
  }
}

void __47__WFLinkAction_executor_needsValueWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v9 = [v4 parameterName];
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [v5 captionPrint];

  id v8 = [v7 firstObject];
  [v3 askForParameterValueForParameterName:v9 request:v6 dialogString:v8];
}

- (void)performPresentationAction:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(WFAppIntentExecutionAction *)self setDidRunOpensIntent:1];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v4 valueForKey:@"url"],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    uint64_t v6 = [(WFAppIntentExecutionAction *)self connection];
    id v7 = [(WFAppIntentExecutionAction *)self executorOptions];
    id v8 = [v6 executorForAction:v4 options:v7 delegate:self];

    [v8 perform];
  }
  else
  {
    id v9 = objc_opt_new();
    id v10 = [(WFAppIntentExecutionAction *)self fullyQualifiedLinkActionIdentifier];
    id v11 = [v10 bundleIdentifier];
    uint64_t v12 = [v4 identifier];
    id v25 = 0;
    uint64_t v13 = [v9 actionForBundleIdentifier:v11 andActionIdentifier:v12 error:&v25];
    id v14 = v25;

    if (v13)
    {
      os_unfair_lock_lock(&self->_connectionLock);
      int v15 = (void *)MEMORY[0x1E4F72BC8];
      id v16 = [(WFAppIntentExecutionAction *)self connectionPolicySignals];
      __int16 v17 = [v15 policyWithActionMetadata:v13 signals:v16];

      id v24 = v14;
      id v18 = [v17 connectionWithError:&v24];
      id v19 = v24;

      os_unfair_lock_unlock(&self->_connectionLock);
      if (v18)
      {
        uint64_t v20 = [v4 parameters];
        uint64_t v21 = [v17 actionWithParameters:v20];

        id v22 = [(WFAppIntentExecutionAction *)self executorOptions];
        long long v23 = [v18 executorForAction:v21 options:v22 delegate:self];

        [v23 perform];
        id v4 = (id)v21;
      }
      else
      {
        long long v23 = getWFAppIntentsLogObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v27 = "-[WFLinkAction performPresentationAction:]";
          __int16 v28 = 2114;
          id v29 = v19;
          _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_ERROR, "%s Failed to initialize LNConnection: %{public}@.", buf, 0x16u);
        }
      }
    }
    else
    {
      [(WFAppIntentExecutionAction *)self finishRunningWithError:v14];
      id v19 = v14;
    }
  }
}

- (void)performPresentationActionWithResult:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 output];
  uint64_t v6 = [v5 showOutputAction];

  if (v6)
  {
    id v7 = [(WFAction *)self userInterface];
    char v8 = [v7 isRunningWithExternalUI];

    if (v8)
    {
      id v9 = objc_opt_new();
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v10 = [v6 parameters];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v27 != v13) {
              objc_enumerationMutation(v10);
            }
            int v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            id v16 = [v15 value];

            if (v16)
            {
              __int16 v17 = [v15 value];
              id v18 = [v15 identifier];
              [v9 setObject:v17 forKey:v18];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v12);
      }

      id v19 = [(WFAppIntentExecutionAction *)self fullyQualifiedLinkActionIdentifier];
      uint64_t v20 = [v19 bundleIdentifier];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __52__WFLinkAction_performPresentationActionWithResult___block_invoke;
      v22[3] = &unk_1E6550E60;
      v22[4] = self;
      id v23 = v6;
      id v24 = v9;
      id v25 = v4;
      id v21 = v9;
      +[WFToolInvocation invocationFrom:v23 bundleIdentifier:v20 deviceIdentifier:0 completionHandler:v22];
    }
    else
    {
      [(WFLinkAction *)self performPresentationAction:v6];
    }
  }
}

void __52__WFLinkAction_performPresentationActionWithResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    id v16 = [*(id *)(a1 + 32) userInterface];
    char v8 = [*(id *)(a1 + 32) fullyQualifiedLinkActionIdentifier];
    id v9 = [v8 bundleIdentifier];
    id v10 = [*(id *)(a1 + 40) identifier];
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = [v5 encodeAndReturnError:0];
    uint64_t v13 = [*(id *)(a1 + 56) output];
    uint64_t v14 = [v13 showOutputActionOptions];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__WFLinkAction_performPresentationActionWithResult___block_invoke_2;
    v17[3] = &unk_1E6555928;
    int v15 = *(void **)(a1 + 40);
    v17[4] = *(void *)(a1 + 32);
    id v18 = v15;
    [v16 shouldRunFollowUpActionWithBundleIdentifier:v9 actionIdentifier:v10 parameterValues:v11 encodedToolInvocation:v12 showOutputActionOptions:v14 completionHandler:v17];
  }
  else
  {
    if (!v6)
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFActionErrorDomain" code:16 userInfo:0];
    }
    [*(id *)(a1 + 32) finishRunningWithError:v7];
  }
}

uint64_t __52__WFLinkAction_performPresentationActionWithResult___block_invoke_2(uint64_t a1, char a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 performPresentationAction:*(void *)(a1 + 40)];
  }
  else {
    return [v3 finishRunningWithError:0];
  }
}

- (void)showResultIfNeeded:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  char v8 = [v6 output];
  id v9 = [v8 showOutputAction];
  if (!v9) {
    goto LABEL_5;
  }
  if ([(WFLinkAction *)self opensWhenRun])
  {

    goto LABEL_8;
  }
  if ([(WFAppIntentExecutionAction *)self runKind] != 1)
  {
    id v10 = [v6 output];
    uint64_t v11 = [v10 showOutputActionHint];

    if (v11 == 1) {
      goto LABEL_9;
    }
  }
  else
  {
LABEL_5:
  }
  if (![(WFLinkAction *)self showsWhenRun])
  {
LABEL_9:
    v7[2](v7);
    goto LABEL_10;
  }
  char v8 = [(WFAction *)self userInterface];
  if ([v8 isRunningWithSiriUI])
  {
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v12 = [v6 output];
  uint64_t v13 = [v12 dialog];
  if (v13)
  {
  }
  else
  {
    uint64_t v14 = [v6 output];
    int v15 = [v14 viewSnippet];

    if (!v15) {
      goto LABEL_9;
    }
  }
  if ([(WFAppIntentExecutionAction *)self actionIsExecutedFromAnotherDevice])
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __53__WFLinkAction_showResultIfNeeded_completionHandler___block_invoke;
    v22[3] = &unk_1E6555C60;
    v22[4] = self;
    [(WFLinkAction *)self getAlertForLinkResult:v6 handler:v7 completionHandler:v22];
  }
  else
  {
    id v16 = [(WFAction *)self userInterface];
    __int16 v17 = [v6 output];
    id v18 = [v17 dialog];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __53__WFLinkAction_showResultIfNeeded_completionHandler___block_invoke_2;
    v19[3] = &unk_1E6550E38;
    v19[4] = self;
    id v20 = v6;
    id v21 = v7;
    [v16 showLinkResult:v20 dialog:v18 completionHandler:v19];
  }
LABEL_10:
}

void __53__WFLinkAction_showResultIfNeeded_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 userInterface];
  [v4 presentAlert:v3];
}

uint64_t __53__WFLinkAction_showResultIfNeeded_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 == 1) {
    [*(id *)(a1 + 32) performPresentationActionWithResult:*(void *)(a1 + 40)];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (void)finishRunningWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v6 output];
  id v9 = [v8 value];

  if (v9)
  {
    id v10 = [v9 valueType];
    uint64_t v11 = [(WFAppIntentExecutionAction *)self fullyQualifiedLinkActionIdentifier];
    uint64_t v12 = [v11 bundleIdentifier];
    uint64_t v13 = [(WFAppIntentExecutionAction *)self displayableAppBundleIdentifier];
    uint64_t v14 = objc_msgSend(v10, "wf_contentCollectionFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:", v9, v12, v13);
    [(WFAction *)self setOutput:v14];
  }
  int v15 = [v6 output];
  id v16 = [v15 undoContext];
  [(WFAppIntentExecutionAction *)self setUndoContext:v16];

  __int16 v17 = [v6 output];
  id v18 = [v17 attribution];
  [(WFAppIntentExecutionAction *)self setAttribution:v18];

  id v19 = [v6 output];
  id v20 = [v19 showOutputAction];

  if (v20)
  {
    BOOL v21 = [(WFLinkAction *)self opensWhenRun];
    if ([(WFAppIntentExecutionAction *)self runKind] == 1)
    {
      if (v21)
      {
LABEL_6:
        [(WFLinkAction *)self performPresentationActionWithResult:v6];
        goto LABEL_12;
      }
    }
    else
    {
      id v22 = [v6 output];
      uint64_t v23 = [v22 showOutputActionHint];

      if (v23)
      {
        id v24 = [v6 output];
        uint64_t v25 = [v24 showOutputActionHint];

        if (v25 == 1) {
          goto LABEL_6;
        }
      }
      else if (v21)
      {
        goto LABEL_6;
      }
    }
  }
  if (v7)
  {
    [(WFAppIntentExecutionAction *)self finishRunningWithError:v7];
  }
  else
  {
    long long v26 = [(WFAppIntentExecutionAction *)self metadata];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __46__WFLinkAction_finishRunningWithResult_error___block_invoke;
    void v27[3] = &unk_1E6557668;
    v27[4] = self;
    [(WFAppIntentExecutionAction *)self showChronoControlIfPossibleForIntent:v26 completionHandler:v27];
  }
LABEL_12:
}

uint64_t __46__WFLinkAction_finishRunningWithResult_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

- (void)forceUpdateParameterVisibility
{
  id v3 = [(WFLinkAction *)self linkActionWithSerializedParameters];
  BOOL v4 = [(WFLinkAction *)self updateParameterSummaryIfNeededWithLinkAction:v3];

  if (!v4)
  {
    [(WFLinkAction *)self updateParameterVisibility];
  }
}

- (id)generatedResourceNodes
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)WFLinkAction;
  id v3 = [(WFAction *)&v26 generatedResourceNodes];
  id v21 = (id)[v3 mutableCopy];

  BOOL v4 = [(WFLinkAction *)self parameterDefinitions];
  id v5 = objc_msgSend(v4, "if_compactMap:", &__block_literal_global_315);

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v30[0] = @"WFResourceClass";
        uint64_t v11 = (objc_class *)objc_opt_class();
        uint64_t v12 = NSStringFromClass(v11);
        v30[1] = @"RequiredResources";
        v31[0] = v12;
        v27[0] = @"WFResourceClass";
        uint64_t v13 = (objc_class *)objc_opt_class();
        uint64_t v14 = NSStringFromClass(v13);
        v28[0] = v14;
        v28[1] = v10;
        v27[1] = @"WFParameterKey";
        v27[2] = @"WFParameterValue";
        v28[2] = &unk_1F2317DF0;
        int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
        long long v29 = v15;
        id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
        v31[1] = v16;
        __int16 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

        id v18 = [[WFResourceNode alloc] initWithDefinition:v17];
        [v21 addObject:v18];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v7);
  }

  return v21;
}

id __38__WFLinkAction_generatedResourceNodes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 objectForKey:@"Class"];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v4 = v3;
    }
    else {
      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  id v5 = v4;

  Class v6 = NSClassFromString(v5);
  if (v6 == (Class)objc_opt_class())
  {
    uint64_t v8 = [v2 objectForKey:@"Key"];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
    }
    else
    {
      id v9 = 0;
    }
    id v7 = v9;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)opensWhenRun
{
  id v2 = [(WFLinkAction *)self opensWhenRunIfApplicable];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSNumber)opensWhenRunIfApplicable
{
  char v3 = [(WFAction *)self parameterForKey:@"OpenWhenRun"];
  BOOL v4 = v3;
  if (v3
    && ([v3 isHidden] & 1) == 0
    && ([v4 resourceManager],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 resourcesRequiredForDisplayAvailable],
        v5,
        v6))
  {
    id v7 = [(WFAction *)self parameterValueForKey:@"OpenWhenRun" ofClass:objc_opt_class()];
  }
  else
  {
    id v7 = 0;
  }

  return (NSNumber *)v7;
}

- (BOOL)showsWhenRun
{
  id v2 = [(WFLinkAction *)self showsWhenRunIfApplicable];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSNumber)showsWhenRunIfApplicable
{
  char v3 = [(WFAction *)self parameterForKey:@"ShowWhenRun"];
  BOOL v4 = v3;
  if (v3
    && ([v3 isHidden] & 1) == 0
    && ([v4 resourceManager],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 resourcesRequiredForDisplayAvailable],
        v5,
        v6))
  {
    id v7 = [(WFAction *)self parameterValueForKey:@"ShowWhenRun" ofClass:objc_opt_class()];
  }
  else
  {
    id v7 = 0;
  }

  return (NSNumber *)v7;
}

- (id)outputMeasurementUnitType
{
  outputMeasurementUnitType = self->_outputMeasurementUnitType;
  BOOL v4 = [MEMORY[0x1E4F1CA98] null];

  if (outputMeasurementUnitType != v4)
  {
    if (outputMeasurementUnitType)
    {
      outputMeasurementUnitType = outputMeasurementUnitType;
      id v5 = outputMeasurementUnitType;
      goto LABEL_10;
    }
    int v6 = [(WFAppIntentExecutionAction *)self metadata];
    id v7 = [v6 outputType];
    uint64_t v8 = objc_msgSend(v7, "wf_objectValueType");

    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = objc_msgSend(MEMORY[0x1E4FB47F0], "unitTypeFromLinkMeasurementUnitType:", objc_msgSend(v8, "unitType"));

        if (v5)
        {
          id v9 = v5;
        }
        else
        {
          id v9 = [MEMORY[0x1E4F1CA98] null];
        }
        outputMeasurementUnitType = self->_outputMeasurementUnitType;
        self->_outputMeasurementUnitType = v9;
        goto LABEL_10;
      }
    }

    outputMeasurementUnitType = 0;
  }
  id v5 = 0;
LABEL_10:

  return v5;
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(WFAppIntentExecutionAction *)self metadata];
  uint64_t v8 = [v7 customIntentClassName];
  id v9 = [v6 _className];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    uint64_t v11 = [(WFAction *)self parametersByKey];
    uint64_t v12 = [MEMORY[0x1E4F30788] localizerForLanguage:0];
    uint64_t v13 = WFSerializedParametersForDonatedIntent(v6, 1, a4, v11, v12);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WFAction *)self parameterStateForKey:v7];
  char v9 = [v8 isEqual:v6];

  v32.receiver = self;
  v32.super_class = (Class)WFLinkAction;
  unsigned __int8 v10 = [(WFAction *)&v32 setParameterState:v6 forKey:v7];
  BOOL v11 = v10;
  if (!v6 || (v9 & 1) == 0)
  {
    unsigned __int8 v23 = v10;
    uint64_t v12 = [(WFAppIntentExecutionAction *)self dependentParameterIdentifiers];
    uint64_t v13 = [v12 objectForKeyedSubscript:v7];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = v13;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          id v20 = [(WFAction *)self parameterForKey:v19];
          if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __41__WFLinkAction_setParameterState_forKey___block_invoke;
            v24[3] = &unk_1E6550DF0;
            v24[4] = self;
            id v25 = v20;
            uint64_t v26 = v19;
            id v27 = v25;
            [(WFAppIntentExecutionAction *)self loadDefaultSerializedRepresentationForEnumeration:v25 completionHandler:v24];
          }
          else
          {
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v16);
    }

    id v21 = [(WFAppIntentExecutionAction *)self dependentParameterIdentifiers];
    [v21 removeAllObjects];

    BOOL v11 = v23;
  }

  return v11;
}

void __41__WFLinkAction_setParameterState_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  char v3 = [*(id *)(a1 + 32) createStateForParameter:*(void *)(a1 + 40) fromSerializedRepresentation:a2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__WFLinkAction_setParameterState_forKey___block_invoke_2;
  v6[3] = &unk_1E6558910;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  BOOL v4 = *(void **)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __41__WFLinkAction_setParameterState_forKey___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setParameterState:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 56);
  return [v2 attributesDidChange];
}

- (void)updateParameterSummaryIfNeeded:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__WFLinkAction_updateParameterSummaryIfNeeded___block_invoke;
  aBlock[3] = &unk_1E6550E88;
  void aBlock[4] = self;
  id v5 = v4;
  id v14 = v5;
  id v6 = _Block_copy(aBlock);
  id v7 = [(WFAction *)self toolInvocation];

  if (v7)
  {
    uint64_t v8 = [(WFAction *)self input];
    id v9 = dispatch_get_global_queue(0, 0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__WFLinkAction_updateParameterSummaryIfNeeded___block_invoke_2;
    v11[3] = &unk_1E6555C38;
    void v11[4] = self;
    id v12 = v6;
    [(WFAction *)self processParametersWithoutAskingForValuesWithInput:v8 workQueue:v9 completionHandler:v11];

    unsigned __int8 v10 = v12;
  }
  else
  {
    unsigned __int8 v10 = [(WFLinkAction *)self linkActionWithSerializedParameters];
    (*((void (**)(void *, void *, void))v6 + 2))(v6, v10, 0);
  }
}

void __47__WFLinkAction_updateParameterSummaryIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    [*(id *)(a1 + 32) updateParameterSummaryIfNeededWithLinkAction:v5];
    uint64_t v8 = *(void *)(a1 + 40);
    v9.receiver = *(id *)(a1 + 32);
    v9.super_class = (Class)WFLinkAction;
    objc_msgSendSuper2(&v9, sel_updateParameterSummaryIfNeeded_, v8);
  }
  else
  {
    if (!v6)
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFActionErrorDomain" code:16 userInfo:MEMORY[0x1E4F1CC08]];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __47__WFLinkAction_updateParameterSummaryIfNeeded___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__WFLinkAction_updateParameterSummaryIfNeeded___block_invoke_3;
    v7[3] = &unk_1E6550DC8;
    id v6 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v6 getLinkActionWithProcessedParameters:a2 completionHandler:v7];
  }
}

uint64_t __47__WFLinkAction_updateParameterSummaryIfNeeded___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v10;
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ((void *)WFProgressLocalizedDescriptionContext == a6)
      {
        id v14 = [v12 localizedDescription];
        uint64_t v15 = [(WFAction *)self progress];
        [v15 setLocalizedDescription:v14];
      }
      else
      {
        uint64_t v13 = v12;
        if ((void *)WFProgressLocalizedAdditionalDescriptionContext != a6) {
          goto LABEL_11;
        }
        id v14 = [v12 localizedAdditionalDescription];
        uint64_t v15 = [(WFAction *)self progress];
        [v15 setLocalizedAdditionalDescription:v14];
      }

      uint64_t v13 = v12;
    }
    else
    {
      uint64_t v13 = 0;
      id v14 = v12;
    }
  }
  else
  {
    id v14 = 0;
    uint64_t v13 = 0;
  }

LABEL_11:
}

- (void)deregisterExecutorProgressListeners
{
  char v3 = [(WFLinkAction *)self executorProgress];
  [v3 removeObserver:self forKeyPath:@"localizedDescription" context:WFProgressLocalizedDescriptionContext];

  id v4 = [(WFLinkAction *)self executorProgress];
  [v4 removeObserver:self forKeyPath:@"localizedAdditionalDescription" context:WFProgressLocalizedAdditionalDescriptionContext];
}

- (void)setExecutorProgress:(id)a3
{
  id v4 = (NSProgress *)a3;
  [(WFLinkAction *)self deregisterExecutorProgressListeners];
  executorProgress = self->_executorProgress;
  self->_executorProgress = v4;
  id v6 = v4;

  id v7 = [(WFLinkAction *)self executorProgress];
  [v7 addObserver:self forKeyPath:@"localizedDescription" options:5 context:WFProgressLocalizedDescriptionContext];

  id v8 = [(WFLinkAction *)self executorProgress];
  [v8 addObserver:self forKeyPath:@"localizedAdditionalDescription" options:5 context:WFProgressLocalizedAdditionalDescriptionContext];
}

- (void)runAsynchronouslyWithLinkAction:(id)a3
{
  v60[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(WFAppIntentExecutionAction *)self actionIsExecutedFromAnotherDevice])
  {
    if ([(WFLinkAction *)self opensWhenRun]
      || ([(WFAction *)self disabledOnPlatforms],
          id v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v6 containsObject:@"Watch"],
          v6,
          v7))
    {
      id v8 = WFLocalizedString(@"Sorry, you can’t do that here. Try it on your iPhone instead.");
      objc_super v9 = (void *)MEMORY[0x1E4F28C58];
      v59[0] = *MEMORY[0x1E4F28588];
      id v10 = NSString;
      id v11 = WFLocalizedString(@"Could Not Run “%@”");
      id v12 = [(WFAction *)self localizedName];
      uint64_t v13 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v12);
      v59[1] = *MEMORY[0x1E4F28568];
      v60[0] = v13;
      v60[1] = v8;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
      uint64_t v15 = [v9 errorWithDomain:@"WFActionErrorDomain" code:15 userInfo:v14];

      [(WFAppIntentExecutionAction *)self finishRunningWithError:v15];
LABEL_29:

      goto LABEL_30;
    }
  }
  id v16 = [(WFAction *)self userInterface];
  if (![v16 isRunningWithSiriUI])
  {

    goto LABEL_10;
  }
  BOOL v17 = [(WFAppIntentExecutionAction *)self skipExecutingInSiri];

  if (v17) {
    goto LABEL_10;
  }
  id v18 = objc_alloc(MEMORY[0x1E4FB48F0]);
  uint64_t v19 = [(WFAppIntentExecutionAction *)self appDescriptor];
  uint64_t v20 = [v19 bundleIdentifier];
  id v21 = [(WFAction *)self localizedName];
  long long v22 = objc_msgSend(v18, "initWithAction:bundleIdentifier:nameOverride:showWhenRun:", v5, v20, v21, -[WFLinkAction showsWhenRun](self, "showsWhenRun"));

  unsigned __int8 v23 = [(WFAction *)self userInterface];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __48__WFLinkAction_runAsynchronouslyWithLinkAction___block_invoke;
  v57[3] = &unk_1E6550D78;
  v57[4] = self;
  id v58 = v5;
  LOBYTE(v20) = [v23 performSiriRequest:v22 completionHandler:v57];

  if ((v20 & 1) == 0)
  {
LABEL_10:
    id v8 = [(WFAppIntentExecutionAction *)self connection];
    long long v24 = [MEMORY[0x1E4FB46B8] currentDevice];
    char v25 = [v24 hasSystemAperture];

    uint64_t v26 = [(WFLinkAction *)self showsWhenRunIfApplicable];
    int v27 = [v26 BOOLValue];

    if (v27 && (v25 & 1) == 0)
    {
      long long v28 = [(WFAction *)self runningDelegate];
      [v28 action:self didDecideRunningProgressIsAllowed:0];
    }
    long long v29 = [(WFAppIntentExecutionAction *)self sessionKitSessionInvocationType];

    if (!v29)
    {
      uint64_t v15 = [(WFAction *)self runningDelegate];
      [v15 action:self didDecideRunningProgressIsAllowed:1];
      goto LABEL_24;
    }
    long long v30 = [(WFAppIntentExecutionAction *)self metadata];
    long long v31 = [v30 systemProtocols];
    objc_super v32 = [MEMORY[0x1E4F72DD8] sessionStartingProtocol];
    int v33 = [v31 containsObject:v32];

    if (v33)
    {
      id v34 = [v8 bundleIdentifier];
    }
    else
    {
      long long v35 = [(WFAppIntentExecutionAction *)self metadata];
      long long v36 = [v35 systemProtocols];
      long long v37 = [MEMORY[0x1E4F72DD8] audioStartingProtocol];
      if ([v36 containsObject:v37])
      {
      }
      else
      {
        long long v38 = [(WFAppIntentExecutionAction *)self metadata];
        [v38 systemProtocols];
        id v55 = v5;
        long long v40 = v39 = a2;
        long long v41 = [MEMORY[0x1E4F72DD8] audioRecordingProtocol];
        int v42 = [v40 containsObject:v41];

        a2 = v39;
        id v5 = v55;

        if (!v42)
        {
          v52 = [(WFAction *)self sessionKitSessionConfiguration];

          if (v52)
          {
            v53 = [(WFAction *)self sessionKitSessionConfiguration];
            uint64_t v15 = [v53 bundleIdentifier];

            if (v15) {
              goto LABEL_22;
            }
          }
          goto LABEL_33;
        }
      }
      id v34 = (id)*MEMORY[0x1E4FB4AF8];
    }
    uint64_t v15 = v34;
    if (v34)
    {
LABEL_22:
      v43 = [(WFAction *)self sessionKitToastDurationsPerRunSourceDefinition];
      v44 = [[WFActionSessionKitSessionConfiguration alloc] initWithBundleIdentifier:v15 toastDurationPerRunSource:v43];
      id v56 = 0;
      BOOL v45 = [(WFAction *)self allowSessionKitSessionsIfNeededWithConfiguration:v44 error:&v56];
      id v46 = v56;
      v47 = v46;
      if (!v45)
      {
        [(WFAppIntentExecutionAction *)self finishRunningWithError:v46];

        goto LABEL_28;
      }

LABEL_24:
      v48 = [(WFAppIntentExecutionAction *)self executorOptions];
      uint64_t v15 = [v8 executorForAction:v5 options:v48 delegate:self];

      if (v15)
      {
        v49 = [v15 progress];
        [(WFLinkAction *)self setExecutorProgress:v49];

        v50 = [(WFAction *)self progress];
        v51 = [(WFLinkAction *)self executorProgress];
        [v50 addChild:v51 withPendingUnitCount:1];

        [v15 perform];
        goto LABEL_29;
      }
      v43 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFActionErrorDomain" code:16 userInfo:0];
      [(WFAppIntentExecutionAction *)self finishRunningWithError:v43];
LABEL_28:

      goto LABEL_29;
    }
LABEL_33:
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    [v54 handleFailureInMethod:a2, self, @"WFLinkAction.m", 389, @"Intent is expected to start live activity, but we couldn't figure out what process will" object file lineNumber description];

    uint64_t v15 = 0;
    goto LABEL_22;
  }
LABEL_30:
}

void __48__WFLinkAction_runAsynchronouslyWithLinkAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [v3 actionOutput];
    if (v4)
    {
    }
    else
    {
      objc_super v9 = [v3 error];
      int v10 = objc_msgSend(v9, "wf_isRequiresShortcutsJrError");

      if (v10)
      {
        id v11 = *(void **)(a1 + 32);
        id v12 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
        [v11 finishRunningWithError:v12];

        id v8 = v3;
        goto LABEL_14;
      }
    }
    uint64_t v13 = [v3 actionOutput];
    if (v13)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F72DB0]);
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = [v3 actionOutput];
      BOOL v17 = (void *)[v14 initWithAction:v15 output:v16 actionAppContext:0 predictions:MEMORY[0x1E4F1CBF0]];
    }
    else
    {
      BOOL v17 = 0;
    }

    id v18 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __48__WFLinkAction_runAsynchronouslyWithLinkAction___block_invoke_269;
    v20[3] = &unk_1E65556E0;
    v20[4] = v18;
    id v21 = v17;
    id v22 = v3;
    id v8 = v3;
    id v19 = v17;
    [v18 showResultIfNeeded:v19 completionHandler:v20];
  }
  else
  {

    id v5 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v24 = "-[WFLinkAction runAsynchronouslyWithLinkAction:]_block_invoke";
      __int16 v25 = 2112;
      id v26 = (id)objc_opt_class();
      id v6 = v26;
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_FAULT, "%s Received unexpected interaction response of type %@", buf, 0x16u);
    }
    int v7 = *(void **)(a1 + 32);
    id v8 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
    [v7 finishRunningWithError:v8];
  }
LABEL_14:
}

void __48__WFLinkAction_runAsynchronouslyWithLinkAction___block_invoke_269(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) error];
  [v1 finishRunningWithResult:v2 error:v3];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = [(WFAction *)self processedParameters];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__WFLinkAction_runAsynchronouslyWithInput___block_invoke;
  v5[3] = &unk_1E6554938;
  v5[4] = self;
  [(WFAppIntentExecutionAction *)self getLinkActionWithProcessedParameters:v4 completionHandler:v5];
}

void __43__WFLinkAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = [[WFActionWillRunLNActionTestingEvent alloc] initWithAction:*(void *)(a1 + 32) lnAction:v5];
    int v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__WFLinkAction_runAsynchronouslyWithInput___block_invoke_2;
    v8[3] = &unk_1E6555AC8;
    v8[4] = v7;
    id v9 = v5;
    [v7 handleTestingEvent:v6 completionHandler:v8];
  }
  else
  {
    [*(id *)(a1 + 32) finishRunningWithError:a3];
  }
}

uint64_t __43__WFLinkAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, char a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 runAsynchronouslyWithLinkAction:*(void *)(a1 + 40)];
  }
  else {
    return objc_msgSend(v3, "finishRunningWithError:");
  }
}

- (id)localizedDiscontinuedDescriptionWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAppIntentExecutionAction *)self metadata];
  id v6 = [v5 deprecationMetadata];

  if (v6)
  {
    int v7 = [v6 messageText];
    id v8 = [v4 locale];
    id v9 = [v8 localeIdentifier];
    int v10 = [v7 localizedStringForLocaleIdentifier:v9];

    id v11 = [(WFAction *)self definition];
    id v12 = [v11 objectForKey:@"DiscontinuedReplacementTitle"];

    if (v12)
    {
      uint64_t v13 = NSString;
      id v14 = WFLocalizedStringResourceWithKey(@"Please use “%@” instead.", @"Please use “%@” instead.");
      uint64_t v15 = [v4 localize:v14];
      [v4 locale];
      v17 = id v16 = v10;
      id v18 = [v17 localeIdentifier];
      id v19 = [v12 localizedStringForLocaleIdentifier:v18];
      uint64_t v20 = objc_msgSend(v13, "localizedStringWithFormat:", v15, v19);

      int v10 = v16;
      id v21 = [NSString localizedStringWithFormat:@"%@ %@", v16, v20];
    }
    else
    {
      id v21 = v10;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (id)localizedCategoryWithContext:(id)a3
{
  id v4 = a3;
  if (self->_isBuiltIn)
  {
    v14.receiver = self;
    v14.super_class = (Class)WFLinkAction;
    id v5 = [(WFAction *)&v14 localizedCategoryWithContext:v4];
  }
  else
  {
    id v6 = [(WFAppIntentExecutionAction *)self metadata];
    int v7 = [v6 descriptionMetadata];
    id v8 = [v7 categoryName];
    id v9 = [v8 title];

    if (v9)
    {
      int v10 = [v4 locale];
      id v11 = [v10 localeIdentifier];
      id v5 = [v9 localizedStringForLocaleIdentifier:v11];
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)WFLinkAction;
      id v5 = [(WFAction *)&v13 localizedCategoryWithContext:v4];
    }
  }
  return v5;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAppIntentExecutionAction *)self metadata];
  id v6 = [v5 descriptionMetadata];
  int v7 = [v6 searchKeywords];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__WFLinkAction_localizedKeywordsWithContext___block_invoke;
  v11[3] = &unk_1E6556818;
  id v12 = v4;
  id v8 = v4;
  id v9 = objc_msgSend(v7, "if_map:", v11);

  return v9;
}

id __45__WFLinkAction_localizedKeywordsWithContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 locale];
  id v5 = [v4 localeIdentifier];
  id v6 = [v3 localizedStringForLocaleIdentifier:v5];

  return v6;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAppIntentExecutionAction *)self metadata];
  id v6 = [v5 descriptionMetadata];
  int v7 = [v6 resultValueName];

  if (v7)
  {
    id v8 = [v4 locale];

    id v9 = [v8 localeIdentifier];
    int v10 = [v7 localizedStringForLocaleIdentifier:v9];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)WFLinkAction;
    int v10 = [(WFAppIntentExecutionAction *)&v12 localizedDefaultOutputNameWithContext:v4];
  }
  return v10;
}

- (NSString)developerSpecifiedTitle
{
  uint64_t v2 = [(WFAppIntentExecutionAction *)self metadata];
  id v3 = [v2 title];
  id v4 = [v3 localizedStringForLocaleIdentifier:0];

  return (NSString *)v4;
}

- (id)supportedAppIdentifiers
{
  v7.receiver = self;
  v7.super_class = (Class)WFLinkAction;
  id v3 = [(WFAction *)&v7 supportedAppIdentifiers];
  id v4 = v3;
  if (self->_isBuiltIn || ([v3 containsObject:*MEMORY[0x1E4FB4B90]] & 1) != 0) {
    id v5 = 0;
  }
  else {
    id v5 = v4;
  }

  return v5;
}

- (BOOL)shouldBeIncludedInAppsList
{
  return !self->_isBuiltIn;
}

- (id)iconName
{
  if (self->_isBuiltIn)
  {
    uint64_t v2 = 0;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)WFLinkAction;
    uint64_t v2 = [(WFAction *)&v4 iconName];
  }
  return v2;
}

- (id)icon
{
  id v3 = [(WFAppIntentExecutionAction *)self metadata];
  objc_super v4 = [v3 descriptionMetadata];
  id v5 = [v4 icon];

  if (!v5)
  {
    id v9 = 0;
LABEL_8:

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = v5;
    id v5 = 0;
    goto LABEL_8;
  }
  id v6 = [v5 bundleURL];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28B50]);
    id v8 = [v5 bundleURL];
    id v9 = (void *)[v7 _initUniqueWithURL:v8];

    int v10 = (void *)MEMORY[0x1E4FB4770];
    id v11 = [v5 name];
    objc_super v12 = [v10 imageNamed:v11 inBundle:v9];

    if (v12)
    {
      objc_super v13 = (void *)[objc_alloc(MEMORY[0x1E4FB4778]) initWithImage:v12];

      goto LABEL_10;
    }
    goto LABEL_8;
  }
LABEL_9:
  v15.receiver = self;
  v15.super_class = (Class)WFLinkAction;
  objc_super v13 = [(WFAction *)&v15 icon];
LABEL_10:

  return v13;
}

- (void)wasAddedToWorkflow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFLinkAction;
  [(WFAction *)&v4 wasAddedToWorkflow:a3];
  [(WFLinkAction *)self forceUpdateParameterVisibility];
  [(WFAction *)self preloadDefaultParameterStatesIfNecessaryWithCompletionHandler:&__block_literal_global_26123];
}

void __35__WFLinkAction_wasAddedToWorkflow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[WFLinkAction wasAddedToWorkflow:]_block_invoke";
    __int16 v6 = 2114;
    id v7 = v2;
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_ERROR, "%s Failed to preload default parameter states: %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

+ (id)providedActionWithIdentifier:(id)a3 serializedParameters:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  id v7 = +[WFLinkActionProvider sharedProvider];
  uint64_t v8 = [[WFActionRequest alloc] initWithActionIdentifier:v6 serializedParameters:v5];

  v14[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v7 createActionsForRequests:v9];

  int v10 = [(WFActionRequest *)v8 result];
  id v11 = v10;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v10 = v11;
    }
    else {
      int v10 = 0;
    }
  }
  id v12 = v10;

  return v12;
}

- (void)requestUnlock:(id)a3
{
  id v4 = a3;
  if ([(WFLinkAction *)self usesCompactUnlockService])
  {
    id v5 = objc_alloc_init(WFCompactUnlockService);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__WFLinkAction_RequestUnlock__requestUnlock___block_invoke;
    v7[3] = &unk_1E65568C8;
    uint64_t v8 = v5;
    id v9 = v4;
    id v6 = v5;
    [(WFCompactUnlockService *)v6 requestUnlockIfNeeded:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFLinkAction;
    [(WFAction *)&v10 requestUnlock:v4];
  }
}

void __45__WFLinkAction_RequestUnlock__requestUnlock___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    id v3 = *(void (**)(uint64_t, uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4, 1, 0);
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] userCancelledError];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
  }
}

- (void)fetchSuggestedEntititiesForParameterWithKey:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFAction *)self parameterForKey:v6];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = [(WFAction *)self parameterStateForKey:v6];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_super v10 = v9;
      }
      else {
        objc_super v10 = 0;
      }
    }
    else
    {
      objc_super v10 = 0;
    }
    id v11 = v10;
    id v12 = [v11 variable];

    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_super v13 = v12;
      }
      else {
        objc_super v13 = 0;
      }
    }
    else
    {
      objc_super v13 = 0;
    }
    id v14 = v13;

    objc_super v15 = [v14 collectionFilter];

    id v16 = [v15 namedQueryReference];

    if (v16)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __92__WFLinkAction_NamedQueries__fetchSuggestedEntititiesForParameterWithKey_completionHandler___block_invoke;
      v17[3] = &unk_1E6556648;
      id v19 = v7;
      id v18 = v8;
      [(WFAppIntentExecutionAction *)self loadPossibleStatesForEnumeration:v18 searchTerm:0 optionsProviderReference:v16 completionHandler:v17];
    }
    else
    {
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }
  }
  else
  {

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __92__WFLinkAction_NamedQueries__fetchSuggestedEntititiesForParameterWithKey_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 allItems];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __92__WFLinkAction_NamedQueries__fetchSuggestedEntititiesForParameterWithKey_completionHandler___block_invoke_2;
    v6[3] = &unk_1E6556620;
    id v7 = *(id *)(a1 + 32);
    uint64_t v4 = objc_msgSend(v3, "if_compactMap:", v6);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

id __92__WFLinkAction_NamedQueries__fetchSuggestedEntititiesForParameterWithKey_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = v4;
  id v6 = [*(id *)(a1 + 32) accessoryImageForPossibleState:v5];
  id v7 = v6;
  id v8 = 0;
  if (v5 && v6)
  {
    if ([v6 representationType] == 4)
    {
      id v9 = objc_alloc(MEMORY[0x1E4FB49C8]);
      objc_super v10 = [v7 symbolName];
      id v11 = objc_alloc(MEMORY[0x1E4FB4760]);
      id v12 = [MEMORY[0x1E4FB45E0] clearColor];
      objc_super v13 = (void *)[v11 initWithColor:v12];
      id v14 = (void *)[v9 initWithSymbolName:v10 background:v13];
    }
    else
    {
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4FB4778]) initWithImage:v7];
    }
    id v15 = objc_alloc(MEMORY[0x1E4FB45E8]);
    id v16 = [v5 value];
    BOOL v17 = [v16 value];
    id v18 = WFSerializedIdentifierFromLinkValue(v17);
    id v19 = [*(id *)(a1 + 32) localizedLabelForPossibleState:v5];
    uint64_t v20 = [v5 serializedRepresentation];
    id v8 = (void *)[v15 initWithIdentifier:v18 name:v19 entryIcon:v14 accessoryIcon:0 serializedParameterState:v20];
  }
  return v8;
}

- (BOOL)canOfferSuggestionsForParameterWithKey:(id)a3
{
  id v3 = [(WFAction *)self parameterStateForKey:a3];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = v4;
  id v6 = [v5 variable];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = [v8 collectionFilter];

  objc_super v10 = [v9 namedQueryReference];
  LOBYTE(v8) = v10 != 0;

  return (char)v8;
}

@end