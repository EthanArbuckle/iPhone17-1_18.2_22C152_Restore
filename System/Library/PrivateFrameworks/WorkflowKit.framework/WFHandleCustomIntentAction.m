@interface WFHandleCustomIntentAction
- (BOOL)enumerationAllowsMultipleValues:(id)a3;
- (BOOL)hasLocationParameter;
- (BOOL)intentDescriptorIsSyncedFromOtherDevices;
- (BOOL)isDiscontinued;
- (BOOL)populatesInputFromInputParameter;
- (BOOL)shouldInsertExpandingParameterForParameter:(id)a3;
- (INIntent)intent;
- (INSchema)schema;
- (NSString)appIdentifier;
- (WFHandleCustomIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 schema:(id)a6 intent:(id)a7 className:(id)a8 bundleIdentifier:(id)a9 stringLocalizer:(id)a10;
- (WFHandleCustomIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 schema:(id)a6 intent:(id)a7 resolvedIntentDescriptor:(id)a8 stringLocalizer:(id)a9;
- (WFHandleCustomIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 stringLocalizer:(id)a6;
- (WFHandleCustomIntentAction)initWithIdentifier:(id)a3 intent:(id)a4 className:(id)a5 bundleIdentifier:(id)a6;
- (WFIntentDynamicResolutionRequest)lastDynamicResolutionRequest;
- (WFIntentDynamicResolver)dynamicResolver;
- (id)actionForAppIdentifier:(id)a3;
- (id)codableDescription;
- (id)copyWithSerializedParameters:(id)a3;
- (id)createBundleAccessGrant;
- (id)createStateForParameter:(id)a3 fromSerializedRepresentation:(id)a4;
- (id)disabledOnPlatforms;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)generatedIntentWithIdentifier:(id)a3 input:(id)a4 processedParameters:(id)a5 error:(id *)a6;
- (id)generatedResourceNodes;
- (id)inputDictionary;
- (id)intentDescription;
- (id)intentDescriptor;
- (id)localizedConfigurationPromptDialogForPamameter:(id)a3;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (id)localizedKeyParameterDisplayName;
- (id)localizedNameWithContext:(id)a3;
- (id)outputDictionary;
- (id)parameterDefinitions;
- (id)parameterKeysIgnoredForParameterSummary;
- (id)parameterSummary;
- (id)parametersByIntentSlotName;
- (id)prettyErrorForIntentsExtensionError:(id)a3;
- (id)requiredResourcesForIntentAvailableResource;
- (id)resolver;
- (id)responseCodableDescription;
- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4;
- (id)slots;
- (id)titleForINShortcut:(id)a3;
- (int64_t)intentCategory;
- (void)configureResourcesForParameter:(id)a3;
- (void)dynamicResolveParameterDidEndResolutionSession:(id)a3;
- (void)generateSkeletonIntentForDynamicResolver:(id)a3 withCompletionBlock:(id)a4;
- (void)initializeParameters;
- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
- (void)localizedDisambiguationPromptForItems:(id)a3 intent:(id)a4 dynamicResolveParameter:(id)a5 completion:(id)a6;
- (void)parameterDefaultSerializedRepresentationDidChange:(id)a3;
- (void)resolveOptionsForUserInput:(id)a3 forDynamicResolveParameter:(id)a4 completion:(id)a5;
- (void)setIntentDescriptor:(id)a3;
- (void)setLastDynamicResolutionRequest:(id)a3;
- (void)setUpResolverIfNeededForParameter:(id)a3 withCompletionBlock:(id)a4;
- (void)setupParameter:(id)a3;
- (void)startExecutingIntent:(id)a3;
@end

@implementation WFHandleCustomIntentAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDynamicResolutionRequest, 0);
  objc_storeStrong((id *)&self->_dynamicResolver, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_intentDescriptor, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_outputDictionary, 0);
  objc_storeStrong((id *)&self->_inputDictionary, 0);
  objc_storeStrong((id *)&self->_parameterSummary, 0);
  objc_storeStrong((id *)&self->_parameterDefinitions, 0);
  objc_storeStrong((id *)&self->_localizedKeyParameterDisplayName, 0);
  objc_storeStrong((id *)&self->_responseCodableDescription, 0);
  objc_storeStrong((id *)&self->_codableDescription, 0);
}

- (void)setLastDynamicResolutionRequest:(id)a3
{
}

- (WFIntentDynamicResolutionRequest)lastDynamicResolutionRequest
{
  return self->_lastDynamicResolutionRequest;
}

- (WFIntentDynamicResolver)dynamicResolver
{
  return self->_dynamicResolver;
}

- (INIntent)intent
{
  return self->_intent;
}

- (INSchema)schema
{
  return self->_schema;
}

- (void)setIntentDescriptor:(id)a3
{
}

- (id)intentDescriptor
{
  return self->_intentDescriptor;
}

- (void)dynamicResolveParameterDidEndResolutionSession:(id)a3
{
  id v3 = [(WFHandleCustomIntentAction *)self dynamicResolver];
  [v3 endSession];
}

- (void)localizedDisambiguationPromptForItems:(id)a3 intent:(id)a4 dynamicResolveParameter:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [a5 codableAttribute];
  [(WFHandleIntentAction *)self localizedDisambiguationPromptForAttribute:v13 intent:v11 disambiguationItems:v12 completion:v10];
}

- (void)resolveOptionsForUserInput:(id)a3 forDynamicResolveParameter:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WFHandleCustomIntentAction *)self lastDynamicResolutionRequest];
  [v11 cancel];

  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__WFHandleCustomIntentAction_resolveOptionsForUserInput_forDynamicResolveParameter_completion___block_invoke;
  v14[3] = &unk_1E6551778;
  objc_copyWeak(&v17, &location);
  id v12 = v10;
  id v16 = v12;
  id v13 = v8;
  id v15 = v13;
  [(WFHandleCustomIntentAction *)self setUpResolverIfNeededForParameter:v9 withCompletionBlock:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __95__WFHandleCustomIntentAction_resolveOptionsForUserInput_forDynamicResolveParameter_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = [v8 resolveWithUserInput:*(void *)(a1 + 32) completionBlock:*(void *)(a1 + 40)];
    [WeakRetained setLastDynamicResolutionRequest:v7];
  }
}

- (void)generateSkeletonIntentForDynamicResolver:(id)a3 withCompletionBlock:(id)a4
{
  id v5 = a4;
  v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__WFHandleCustomIntentAction_generateSkeletonIntentForDynamicResolver_withCompletionBlock___block_invoke;
  v8[3] = &unk_1E6555C38;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(WFAction *)self processParametersWithoutAskingForValuesWithInput:0 workQueue:v6 completionHandler:v8];
}

uint64_t __91__WFHandleCustomIntentAction_generateSkeletonIntentForDynamicResolver_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) generatePopulatedIntentFromInput:0 processedParameters:a2 completion:*(void *)(a1 + 40)];
}

- (void)setUpResolverIfNeededForParameter:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __84__WFHandleCustomIntentAction_setUpResolverIfNeededForParameter_withCompletionBlock___block_invoke;
  v27 = &unk_1E65572A0;
  v28 = self;
  id v8 = v7;
  id v29 = v8;
  id v9 = (void (**)(void))_Block_copy(&v24);
  uint64_t v10 = [(WFHandleCustomIntentAction *)self dynamicResolver];
  if (!v10) {
    goto LABEL_5;
  }
  id v11 = (void *)v10;
  id v12 = [(WFHandleCustomIntentAction *)self dynamicResolver];
  id v13 = [v12 intentKeyPathToResolve];
  v14 = [v6 key];
  char v15 = [v13 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
LABEL_5:
    v19 = [(WFHandleCustomIntentAction *)self dynamicResolver];
    [v19 endSession];

    v20 = [WFIntentDynamicResolver alloc];
    v21 = [v6 key];
    v22 = [(WFIntentDynamicResolver *)v20 initWithIntentKeyPathToResolve:v21 dataSource:self];
    dynamicResolver = self->_dynamicResolver;
    self->_dynamicResolver = v22;

    goto LABEL_6;
  }
  id v16 = [(WFHandleCustomIntentAction *)self dynamicResolver];
  uint64_t v17 = [v16 state];

  if (v17 != 1)
  {
LABEL_6:
    v9[2](v9);
    goto LABEL_7;
  }
  v18 = [(WFHandleCustomIntentAction *)self dynamicResolver];
  (*((void (**)(id, void *, void))v8 + 2))(v8, v18, 0);

LABEL_7:
}

void __84__WFHandleCustomIntentAction_setUpResolverIfNeededForParameter_withCompletionBlock___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) dynamicResolver];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __84__WFHandleCustomIntentAction_setUpResolverIfNeededForParameter_withCompletionBlock___block_invoke_2;
  v3[3] = &unk_1E6551750;
  objc_copyWeak(&v5, &location);
  id v4 = *(id *)(a1 + 40);
  [v2 beginSessionWithCompletionBlock:v3];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __84__WFHandleCustomIntentAction_setUpResolverIfNeededForParameter_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [WeakRetained dynamicResolver];
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v6, v4);
}

- (id)prettyErrorForIntentsExtensionError:(id)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 domain];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F30898]];

  id v7 = (void *)MEMORY[0x1E4F28A50];
  if (!v6)
  {
    id v9 = [v4 domain];
    if (![v9 isEqualToString:@"WFIntentExecutorErrorDomain"])
    {

      goto LABEL_14;
    }
    uint64_t v10 = [v4 code];

    if (v10 != 100)
    {
LABEL_14:
      v22 = WFLocalizedString(@"An unknown error occurred.");
      goto LABEL_15;
    }
    id v11 = [v4 userInfo];
    id v12 = [v11 objectForKey:*v7];

    id v13 = [v12 domain];
    if ([v13 isEqualToString:*MEMORY[0x1E4F300C0]])
    {
      uint64_t v14 = [v12 code];

      if (v14 != 3006)
      {
        v22 = 0;
        goto LABEL_24;
      }
      char v15 = [(WFHandleIntentAction *)self appDescriptor];
      id v16 = [v15 localizedName];
      uint64_t v17 = [v16 length];

      v18 = NSString;
      if (v17)
      {
        id v13 = WFLocalizedString(@"The action “%1$@” could not run. Open %2$@ to continue.");
        v19 = [(WFAction *)self localizedName];
        v20 = [(WFHandleIntentAction *)self appDescriptor];
        v21 = [v20 localizedName];
        v22 = objc_msgSend(v18, "localizedStringWithFormat:", v13, v19, v21);
      }
      else
      {
        id v13 = WFLocalizedString(@"The action “%@” could not run. Open the app to continue.");
        v19 = [(WFAction *)self localizedName];
        v22 = objc_msgSend(v18, "localizedStringWithFormat:", v13, v19);
      }
    }
    else
    {
      v22 = 0;
    }
LABEL_23:

LABEL_24:
    if (v22) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  switch([v4 code])
  {
    case 1000:
    case 1001:
      id v8 = @"The options provided were not valid.";
      break;
    case 1002:
      id v8 = @"No options were provided for this parameter";
      break;
    case 1003:
      id v8 = @"No default value was provided for this parameter";
      break;
    case 1004:
      id v12 = [v4 userInfo];
      id v13 = [v12 objectForKey:*v7];
      v22 = [v13 localizedDescription];
      goto LABEL_23;
    default:
      goto LABEL_14;
  }
  v22 = WFLocalizedString(v8);
  if (!v22) {
    goto LABEL_14;
  }
LABEL_15:
  v23 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v24 = *v7;
  v28[0] = *MEMORY[0x1E4F28568];
  v28[1] = v24;
  v29[0] = v22;
  v29[1] = v4;
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
  v26 = [v23 errorWithDomain:@"WFIntentExecutorErrorDomain" code:100 userInfo:v25];

  return v26;
}

- (BOOL)enumerationAllowsMultipleValues:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = WFEnforceClass(v3, v4);

  int v6 = [v5 codableAttribute];

  if (v6) {
    BOOL v7 = [v6 modifier] == 0;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  id v9 = WFEnforceClass(v7, v8);

  uint64_t v10 = [v9 codableAttribute];

  id v11 = [v10 metadata];
  id v12 = [v6 value];
  objc_msgSend(v11, "wf_updateWithParameterValue:", v12);

  id v13 = [v6 value];

  uint64_t v14 = [(WFHandleIntentAction *)self stringLocalizer];
  char v15 = [v10 metadata];
  id v16 = objc_msgSend(v13, "_intents_readableTitleWithLocalizer:metadata:", v14, v15);

  return v16;
}

- (id)localizedConfigurationPromptDialogForPamameter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFHandleIntentAction *)self generatedIntentWithInput:0 processedParameters:0 error:0];
  id v6 = [v4 codableAttribute];

  id v7 = [v6 promptDialogWithType:6];
  uint64_t v8 = [(WFHandleIntentAction *)self stringLocalizer];
  id v9 = [v7 localizedDialogWithIntent:v5 tokens:0 localizer:v8];

  return v9;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(0, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__WFHandleCustomIntentAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v15[3] = &unk_1E6551728;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  [(WFAction *)self processParametersWithoutAskingForValuesWithInput:0 workQueue:v11 completionHandler:v15];
}

void __92__WFHandleCustomIntentAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    id v6 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __92__WFHandleCustomIntentAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2;
    v10[3] = &unk_1E6551700;
    id v14 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    id v12 = v7;
    uint64_t v13 = v8;
    [v6 generatePopulatedIntentFromInput:a3 processedParameters:a2 completion:v10];
  }
  else
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v9();
  }
}

void __92__WFHandleCustomIntentAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!v5 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) definition];
    id v7 = [v6 objectForKey:@"IntentSlotName"];
    uint64_t v8 = objc_opt_class();
    id v9 = WFEnforceClass(v7, v8);

    id v10 = [v5 _codableDescription];
    id v11 = [v10 attributeByName:v9];

    id v12 = [[WFIntentExecutor alloc] initWithIntent:v5 donateInteraction:0 groupIdentifier:0];
    uint64_t v13 = *(void *)(a1 + 40);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __92__WFHandleCustomIntentAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3;
    v16[3] = &unk_1E6552438;
    id v14 = *(id *)(a1 + 56);
    id v17 = v11;
    id v18 = v14;
    v16[4] = *(void *)(a1 + 48);
    id v15 = v11;
    [(WFIntentExecutor *)v12 getDynamicOptionsForParameterNamed:v9 searchTerm:v13 completionHandler:v16];
  }
}

void __92__WFHandleCustomIntentAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "prettyErrorForIntentsExtensionError:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, v9);
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __92__WFHandleCustomIntentAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_4;
    v10[3] = &unk_1E65516D8;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    id v11 = v6;
    uint64_t v12 = v7;
    uint64_t v8 = objc_msgSend(a2, "wf_mapObjectsUsingBlock:", v10);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

WFCodableAttributeBackedSubstitutableState *__92__WFHandleCustomIntentAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [WFCodableAttributeBackedSubstitutableState alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) stringLocalizer];
  uint64_t v7 = [(WFCodableAttributeBackedSubstitutableState *)v4 initWithValue:v3 codableAttribute:v5 stringLocalizer:v6];

  return v7;
}

- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, id))a4;
  id v22 = 0;
  uint64_t v8 = [(WFHandleIntentAction *)self generatedIntentWithInput:0 processedParameters:0 error:&v22];
  id v9 = v22;
  id v10 = v9;
  if (!v8 || v9)
  {
    v7[2](v7, 0, v9);
  }
  else
  {
    id v11 = [v6 definition];
    uint64_t v12 = [v11 objectForKey:@"IntentSlotName"];
    uint64_t v13 = objc_opt_class();
    id v14 = WFEnforceClass(v12, v13);

    id v15 = [v8 _codableDescription];
    id v16 = [v15 attributeByName:v14];

    id v17 = [[WFIntentExecutor alloc] initWithIntent:v8 donateInteraction:0 groupIdentifier:0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __98__WFHandleCustomIntentAction_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke;
    v19[3] = &unk_1E6555C08;
    id v20 = v16;
    v21 = v7;
    v19[4] = self;
    id v18 = v16;
    [(WFIntentExecutor *)v17 getDefaultValueForParameterNamed:v14 completionHandler:v19];
  }
}

void __98__WFHandleCustomIntentAction_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
LABEL_4:
    if (v16)
    {
      id v9 = [WFCodableAttributeBackedSubstitutableState alloc];
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = [*(id *)(a1 + 32) stringLocalizer];
      uint64_t v12 = [(WFCodableAttributeBackedSubstitutableState *)v9 initWithValue:v16 codableAttribute:v10 stringLocalizer:v11];
    }
    else
    {
      uint64_t v12 = 0;
    }
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = [(WFCodableAttributeBackedSubstitutableState *)v12 serializedRepresentation];
    (*(void (**)(uint64_t, void *, void))(v14 + 16))(v14, v15, 0);

    goto LABEL_10;
  }
  uint64_t v7 = [v5 domain];
  if ([v7 isEqualToString:*MEMORY[0x1E4F30898]])
  {
    uint64_t v8 = [v6 code];

    if (v8 == 1003) {
      goto LABEL_4;
    }
  }
  else
  {
  }
  uint64_t v13 = *(void *)(a1 + 48);
  uint64_t v12 = [*(id *)(a1 + 32) prettyErrorForIntentsExtensionError:v6];
  (*(void (**)(uint64_t, void, WFCodableAttributeBackedSubstitutableState *))(v13 + 16))(v13, 0, v12);
LABEL_10:
}

- (id)disabledOnPlatforms
{
  v4.receiver = self;
  v4.super_class = (Class)WFHandleCustomIntentAction;
  v2 = [(WFHandleIntentAction *)&v4 disabledOnPlatforms];
  return v2;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(WFHandleCustomIntentAction *)self responseCodableDescription];
  id v6 = [v5 outputAttribute];
  if (v6)
  {
    uint64_t v7 = [v4 stringLocalizer];

    uint64_t v8 = objc_msgSend(v6, "wf_outputDisplayNameWithLocalizer:", v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFHandleCustomIntentAction;
    uint64_t v8 = [(WFAction *)&v10 localizedDefaultOutputNameWithContext:v4];
  }
  return v8;
}

- (id)outputDictionary
{
  v23[2] = *MEMORY[0x1E4F143B8];
  outputDictionary = self->_outputDictionary;
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (outputDictionary == v4)
  {
    id v5 = 0;
  }
  else if (outputDictionary)
  {
    outputDictionary = outputDictionary;
    id v5 = outputDictionary;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)WFHandleCustomIntentAction;
    id v5 = [(WFAction *)&v20 outputDictionary];
    id v6 = [(WFHandleCustomIntentAction *)self responseCodableDescription];
    uint64_t v7 = [v6 outputAttribute];
    if (v7
      && ([v5 objectForKeyedSubscript:@"Types"],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          !v8)
      && (uint64_t v10 = objc_msgSend(v7, "wf_contentItemClass")) != 0)
    {
      id v11 = (objc_class *)v10;
      uint64_t v12 = (void *)[v5 mutableCopy];
      uint64_t v13 = v12;
      if (v12) {
        id v14 = v12;
      }
      else {
        id v14 = (id)objc_opt_new();
      }
      id v15 = v14;

      v22[1] = @"Types";
      v23[0] = MEMORY[0x1E4F1CC28];
      v22[0] = @"Multiple";
      id v16 = NSStringFromClass(v11);
      v21 = v16;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
      v23[1] = v17;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
      [v15 addEntriesFromDictionary:v18];

      if (v15)
      {
        v19 = v15;
      }
      else
      {
        v19 = [MEMORY[0x1E4F1CA98] null];
      }
      outputDictionary = self->_outputDictionary;
      self->_outputDictionary = v19;
      id v5 = v15;
    }
    else
    {

      outputDictionary = 0;
    }
  }

  return v5;
}

- (id)inputDictionary
{
  v30[4] = *MEMORY[0x1E4F143B8];
  inputDictionary = self->_inputDictionary;
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (inputDictionary == v4)
  {
    id v5 = 0;
  }
  else if (inputDictionary)
  {
    inputDictionary = inputDictionary;
    id v5 = inputDictionary;
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)WFHandleCustomIntentAction;
    id v6 = [(WFAction *)&v27 inputDictionary];
    if ([v6 count])
    {
      inputDictionary = 0;
      id v5 = v6;
    }
    else
    {
      uint64_t v7 = [(WFHandleCustomIntentAction *)self codableDescription];
      uint64_t v8 = [v7 inputAttribute];
      id v9 = v8;
      if (v8 && (uint64_t v10 = objc_msgSend(v8, "wf_contentItemClass")) != 0)
      {
        uint64_t v25 = (objc_class *)v10;
        uint64_t v23 = [v9 modifier];
        id v11 = [(WFAction *)self definition];
        uint64_t v12 = [v11 objectForKey:@"ParameterOverrides"];

        uint64_t v13 = [v9 propertyName];
        v26 = v12;
        id v14 = [v12 objectForKeyedSubscript:v13];
        id v15 = [v14 objectForKey:@"Key"];
        id v16 = v15;
        if (v15)
        {
          id v17 = v15;
        }
        else
        {
          id v17 = [v9 propertyName];
        }
        uint64_t v24 = v17;

        v29[0] = @"Multiple";
        id v18 = [NSNumber numberWithBool:v23 == 0];
        v30[0] = v18;
        v30[1] = MEMORY[0x1E4F1CC38];
        v29[1] = @"Required";
        v29[2] = @"ParameterKey";
        v30[2] = v24;
        void v29[3] = @"Types";
        v19 = NSStringFromClass(v25);
        v28 = v19;
        objc_super v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
        v30[3] = v20;
        id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:4];

        if (v5)
        {
          v21 = v5;
        }
        else
        {
          v21 = [MEMORY[0x1E4F1CA98] null];
        }
        inputDictionary = self->_inputDictionary;
        self->_inputDictionary = v21;
      }
      else
      {

        inputDictionary = 0;
        id v5 = (void *)MEMORY[0x1E4F1CC08];
      }
    }
  }

  return v5;
}

- (id)parameterSummary
{
  parameterSummary = self->_parameterSummary;
  id v5 = [MEMORY[0x1E4F1CA98] null];

  if (parameterSummary != v5)
  {
    if (parameterSummary)
    {
      parameterSummary = parameterSummary;
      v2 = parameterSummary;
      goto LABEL_20;
    }
    v20.receiver = self;
    v20.super_class = (Class)WFHandleCustomIntentAction;
    uint64_t v6 = [(WFAction *)&v20 parameterSummary];
    if (v6)
    {
      v2 = (WFActionParameterSummary *)v6;
      parameterSummary = 0;
      goto LABEL_20;
    }
    uint64_t v7 = [(WFHandleCustomIntentAction *)self codableDescription];
    uint64_t v8 = [(WFAction *)self definition];
    id v9 = [v8 objectForKey:@"ParameterOverrides"];

    uint64_t v10 = [(WFHandleCustomIntentAction *)self schema];

    if (v10)
    {
      v2 = [(WFHandleCustomIntentAction *)self schema];
      id v11 = [v7 className];
      uint64_t v12 = [(WFActionParameterSummary *)v2 _configurableParameterCombinationsForClassName:v11];
    }
    else
    {
      uint64_t v12 = [(WFHandleCustomIntentAction *)self intent];

      if (!v12)
      {
LABEL_11:
        if ([v12 count])
        {
          v2 = (WFActionParameterSummary *)objc_opt_new();
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __46__WFHandleCustomIntentAction_parameterSummary__block_invoke;
          v17[3] = &unk_1E65516B0;
          v17[4] = self;
          id v18 = v9;
          uint64_t v13 = v2;
          v19 = v13;
          [v12 enumerateKeysAndObjectsUsingBlock:v17];
          if ([(WFActionParameterSummary *)v13 count])
          {
            v2 = [[WFActionParameterSummary alloc] initWithValues:v13];
            int v14 = 0;
          }
          else
          {
            int v14 = 1;
          }
        }
        else
        {
          int v14 = 1;
        }

        if (!v14)
        {
          if (v2)
          {
            id v16 = v2;
          }
          else
          {
            id v16 = [MEMORY[0x1E4F1CA98] null];
          }
          parameterSummary = self->_parameterSummary;
          self->_parameterSummary = v16;
          goto LABEL_20;
        }
        parameterSummary = 0;
        goto LABEL_19;
      }
      v2 = [(WFHandleCustomIntentAction *)self intent];
      uint64_t v12 = [(WFActionParameterSummary *)v2 _parameterCombinations];
    }

    goto LABEL_11;
  }
LABEL_19:
  v2 = 0;
LABEL_20:

  return v2;
}

void __46__WFHandleCustomIntentAction_parameterSummary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = a1;
  id v9 = [*(id *)(a1 + 32) stringLocalizer];
  uint64_t v10 = [v6 localizedTitleFormatStringWithLocalizer:v9];
  id v11 = (void *)[v10 mutableCopy];

  if (v11)
  {
    uint64_t v12 = v7;
    id v25 = v6;
    id v26 = v5;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v5;
    uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          id v18 = [*(id *)(v8 + 40) objectForKeyedSubscript:v17];
          v19 = [v18 objectForKey:@"Key"];

          if (v19)
          {
            objc_super v20 = [NSString stringWithFormat:@"${%@}", v17];
            v21 = [NSString stringWithFormat:@"${%@}", v19];
            objc_msgSend(v11, "replaceOccurrencesOfString:withString:options:range:", v20, v21, 0, 0, objc_msgSend(v11, "length"));
            [v12 addObject:v19];
          }
          else
          {
            [v12 addObject:v17];
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v14);
    }

    uint64_t v7 = v12;
    id v22 = [v12 componentsJoinedByString:@","];
    uint64_t v23 = *(void **)(v8 + 48);
    uint64_t v24 = [[WFActionParameterSummaryValue alloc] initWithKey:v22 localizedSummaryString:v11];
    [v23 addObject:v24];

    id v6 = v25;
    id v5 = v26;
  }
}

- (id)parameterDefinitions
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  parameterDefinitions = self->_parameterDefinitions;
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (parameterDefinitions == v4)
  {
    id v5 = 0;
  }
  else if (parameterDefinitions)
  {
    parameterDefinitions = parameterDefinitions;
    id v5 = parameterDefinitions;
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)WFHandleCustomIntentAction;
    id v6 = [(WFAction *)&v30 parameterDefinitions];
    if ([v6 count])
    {
      parameterDefinitions = 0;
      id v5 = v6;
    }
    else
    {
      uint64_t v7 = [(WFAction *)self definition];
      uint64_t v8 = [v7 objectForKey:@"ParameterOverrides"];

      id v9 = [(WFHandleCustomIntentAction *)self createBundleAccessGrant];
      [v9 acquire];
      uint64_t v10 = [(WFHandleCustomIntentAction *)self codableDescription];
      id v5 = objc_opt_new();
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v24 = v10;
      id v25 = (void *)v8;
      id v11 = objc_msgSend(v10, "wf_actionParameterDefinitionsWithOverrides:", v8);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v33 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v11);
            }
            [v5 addObject:*(void *)(*((void *)&v26 + 1) + 8 * i)];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v33 count:16];
        }
        while (v13);
      }

      if ([(WFHandleCustomIntentAction *)self intentCategory] != 4)
      {
        id v16 = [WFParameterDefinition alloc];
        v32[0] = @"ShowWhenRun";
        v31[0] = @"Key";
        v31[1] = @"Class";
        uint64_t v17 = (objc_class *)objc_opt_class();
        id v18 = NSStringFromClass(v17);
        v32[1] = v18;
        v32[2] = MEMORY[0x1E4F1CC38];
        v31[2] = @"DefaultValue";
        v31[3] = @"Label";
        v19 = WFLocalizedStringResourceWithKey(@"Show When Run", @"Show When Run");
        v32[3] = v19;
        objc_super v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];
        v21 = [(WFParameterDefinition *)v16 initWithDictionary:v20];

        [v5 addObject:v21];
      }
      [v9 relinquish];

      if (v5)
      {
        id v22 = v5;
      }
      else
      {
        id v22 = [MEMORY[0x1E4F1CA98] null];
      }
      parameterDefinitions = self->_parameterDefinitions;
      self->_parameterDefinitions = v22;
    }
  }

  return v5;
}

- (id)localizedKeyParameterDisplayName
{
  localizedKeyParameterDisplayName = self->_localizedKeyParameterDisplayName;
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (localizedKeyParameterDisplayName == v4)
  {
    id v5 = 0;
  }
  else if (localizedKeyParameterDisplayName)
  {
    localizedKeyParameterDisplayName = localizedKeyParameterDisplayName;
    id v5 = localizedKeyParameterDisplayName;
  }
  else
  {
    id v6 = [(WFHandleCustomIntentAction *)self createBundleAccessGrant];
    [v6 acquire];
    uint64_t v7 = [(WFHandleCustomIntentAction *)self codableDescription];
    uint64_t v8 = [v7 keyAttribute];
    id v9 = [(WFHandleIntentAction *)self stringLocalizer];
    id v5 = [v8 localizedDisplayNameWithLocalizer:v9];

    [v6 relinquish];
    if (v5)
    {
      uint64_t v10 = v5;
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
    }
    localizedKeyParameterDisplayName = self->_localizedKeyParameterDisplayName;
    self->_localizedKeyParameterDisplayName = v10;
  }

  return v5;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFHandleCustomIntentAction;
  id v5 = [(WFAction *)&v13 localizedDescriptionSummaryWithContext:v4];
  if (!v5)
  {
    id v6 = [(WFHandleCustomIntentAction *)self createBundleAccessGrant];
    [v6 acquire];
    uint64_t v7 = [(WFHandleCustomIntentAction *)self codableDescription];
    uint64_t v8 = [v4 stringLocalizer];
    uint64_t v9 = [v7 localizedDescriptiveTextWithLocalizer:v8];
    uint64_t v10 = (void *)v9;
    id v11 = &stru_1F229A4D8;
    if (v9) {
      id v11 = (__CFString *)v9;
    }
    id v5 = v11;

    [v6 relinquish];
  }

  return v5;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAction *)self definition];
  id v6 = [v5 name];

  if (v6)
  {
    uint64_t v7 = [v4 localize:v6];
  }
  else
  {
    uint64_t v8 = [(WFHandleCustomIntentAction *)self createBundleAccessGrant];
    [v8 acquire];
    uint64_t v9 = [(WFHandleCustomIntentAction *)self codableDescription];
    uint64_t v10 = [v4 stringLocalizer];
    id v11 = [v9 localizedTitleWithLocalizer:v10];

    [v8 relinquish];
    if (v11)
    {
      id v12 = v11;
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)WFHandleCustomIntentAction;
      id v12 = [(WFHandleIntentAction *)&v14 localizedNameWithContext:v4];
    }
    uint64_t v7 = v12;
  }
  return v7;
}

- (BOOL)isDiscontinued
{
  v2 = [(WFHandleCustomIntentAction *)self codableDescription];
  char v3 = [v2 isDeprecated];

  return v3;
}

- (id)responseCodableDescription
{
  responseCodableDescription = self->_responseCodableDescription;
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (responseCodableDescription == v4)
  {
    id v5 = 0;
  }
  else if (responseCodableDescription)
  {
    responseCodableDescription = responseCodableDescription;
    id v5 = responseCodableDescription;
  }
  else
  {
    id v6 = [(WFHandleCustomIntentAction *)self schema];
    uint64_t v7 = [(WFHandleCustomIntentAction *)self intentDescriptor];
    uint64_t v8 = [v7 intentClassName];
    id v5 = [v6 intentResponseCodableDescriptionWithIntentClassName:v8];

    if (v5)
    {
      uint64_t v9 = v5;
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
    }
    responseCodableDescription = self->_responseCodableDescription;
    self->_responseCodableDescription = v9;
  }

  return v5;
}

- (id)codableDescription
{
  char v3 = [(WFHandleCustomIntentAction *)self schema];

  if (v3)
  {
    codableDescription = self->_codableDescription;
    id v5 = [MEMORY[0x1E4F1CA98] null];

    if (codableDescription == v5)
    {
      uint64_t v7 = 0;
      goto LABEL_13;
    }
    if (!codableDescription)
    {
      uint64_t v8 = [(WFHandleCustomIntentAction *)self schema];
      uint64_t v9 = [(WFHandleCustomIntentAction *)self intentDescriptor];
      uint64_t v10 = [v9 intentClassName];
      uint64_t v7 = [v8 intentCodableDescriptionWithIntentClassName:v10];

      if (v7)
      {
        id v11 = v7;
      }
      else
      {
        id v11 = [MEMORY[0x1E4F1CA98] null];
      }
      codableDescription = self->_codableDescription;
      self->_codableDescription = v11;
      goto LABEL_13;
    }
    id v6 = codableDescription;
    codableDescription = v6;
  }
  else
  {
    uint64_t v7 = [(WFHandleCustomIntentAction *)self intent];

    if (!v7) {
      goto LABEL_14;
    }
    codableDescription = [(WFHandleCustomIntentAction *)self intent];
    id v6 = [(INIntentCodableDescription *)codableDescription _codableDescription];
  }
  uint64_t v7 = v6;
LABEL_13:

LABEL_14:
  return v7;
}

- (id)createBundleAccessGrant
{
  char v3 = [(WFHandleCustomIntentAction *)self intentDescriptor];
  uint64_t v4 = [v3 bundleIdentifier];
  if (v4)
  {
    id v5 = (void *)v4;

LABEL_4:
    uint64_t v7 = [MEMORY[0x1E4F30300] sharedManager];
    uint64_t v8 = [v7 grantForBundleIdentifier:v5 error:0];

    goto LABEL_5;
  }
  id v6 = [(WFHandleCustomIntentAction *)self intentDescriptor];
  id v5 = [v6 extensionBundleIdentifier];

  if (v5) {
    goto LABEL_4;
  }
  uint64_t v8 = 0;
LABEL_5:
  return v8;
}

- (id)titleForINShortcut:(id)a3
{
  id v4 = a3;
  id v5 = [(WFHandleIntentAction *)self appDescriptor];
  id v6 = [v5 bundleIdentifier];
  int v7 = [v6 isEqualToString:@"com.apple.Bridge"];

  if (v7)
  {
    uint64_t v8 = [(WFAction *)self localizedName];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFHandleCustomIntentAction;
    uint64_t v8 = [(WFHandleIntentAction *)&v11 titleForINShortcut:v4];
  }
  uint64_t v9 = (void *)v8;

  return v9;
}

- (void)startExecutingIntent:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [v4 _codableDescription];
  id v6 = [v5 attributes];
  int v7 = [v6 allValues];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_super v13 = [v12 metadata];
        objc_super v14 = [v12 propertyName];
        uint64_t v15 = [(WFAction *)self parameterStateForKey:v14];
        objc_msgSend(v13, "wf_updateWithParameterState:", v15);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  v16.receiver = self;
  v16.super_class = (Class)WFHandleCustomIntentAction;
  [(WFHandleIntentAction *)&v16 startExecutingIntent:v4];
}

- (id)generatedIntentWithIdentifier:(id)a3 input:(id)a4 processedParameters:(id)a5 error:(id *)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(WFHandleCustomIntentAction *)self schema];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F304D0]);
    objc_super v11 = [(WFHandleCustomIntentAction *)self schema];
    id v12 = [(WFHandleCustomIntentAction *)self intentDescriptor];
    objc_super v13 = [v12 intentClassName];
    objc_super v14 = (void *)[v10 _initWithIdentifier:v8 schema:v11 name:v13 data:0];
  }
  else
  {
    objc_super v14 = [(WFHandleCustomIntentAction *)self intent];
  }
  uint64_t v15 = [(WFHandleCustomIntentAction *)self intentDescriptor];
  objc_super v16 = [v15 bundleIdentifier];
  [v14 _setLaunchId:v16];

  long long v17 = [(WFHandleCustomIntentAction *)self intentDescriptor];
  long long v18 = [v17 extensionBundleIdentifier];
  [v14 _setExtensionBundleId:v18];

  if (a6 && !v14)
  {
    long long v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28A50];
    long long v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFActionErrorDomain" code:11 userInfo:0];
    v24[0] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    *a6 = [v19 errorWithDomain:@"WFActionErrorDomain" code:1 userInfo:v21];
  }
  return v14;
}

- (int64_t)intentCategory
{
  v2 = [(WFHandleCustomIntentAction *)self codableDescription];
  int64_t v3 = [v2 intentCategory];

  return v3;
}

- (id)slots
{
  v2 = [(WFHandleCustomIntentAction *)self codableDescription];
  int64_t v3 = [v2 displayOrderedAttributes];
  id v4 = [v3 array];

  return v4;
}

- (id)intentDescription
{
  int64_t v3 = [(WFHandleCustomIntentAction *)self schema];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F304D0]);
    id v5 = [MEMORY[0x1E4F29128] UUID];
    id v6 = [v5 UUIDString];
    int v7 = [(WFHandleCustomIntentAction *)self schema];
    id v8 = [(WFHandleCustomIntentAction *)self intentDescriptor];
    uint64_t v9 = [v8 intentClassName];
    id v10 = (void *)[v4 _initWithIdentifier:v6 schema:v7 name:v9 data:0];
    objc_super v11 = [v10 _intentInstanceDescription];

LABEL_5:
    goto LABEL_6;
  }
  id v12 = [(WFHandleCustomIntentAction *)self intent];

  if (v12)
  {
    id v5 = [(WFHandleCustomIntentAction *)self intent];
    objc_super v11 = [v5 _intentInstanceDescription];
    goto LABEL_5;
  }
  objc_super v11 = 0;
LABEL_6:
  return v11;
}

- (void)configureResourcesForParameter:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 key];
  int v6 = [v5 isEqualToString:@"ShowWhenRun"];

  if (v6)
  {
    int v7 = [(WFHandleCustomIntentAction *)self responseCodableDescription];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = [v7 responseCodes];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v12 isSuccess])
          {
            objc_super v13 = [v12 conciseFormatString];
            if ([v13 length])
            {

LABEL_14:
              uint64_t v9 = 1;
              goto LABEL_15;
            }
            objc_super v14 = [v12 formatString];
            uint64_t v15 = [v14 length];

            if (v15) {
              goto LABEL_14;
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    objc_super v16 = [WFIntentResultUIAvailableResource alloc];
    long long v17 = [(WFHandleCustomIntentAction *)self intentDescriptor];
    long long v18 = [(WFIntentResultUIAvailableResource *)v16 initWithDefinition:MEMORY[0x1E4F1CC08] resolvedIntentDescriptor:v17 hasSuccessResponseWithDialog:v9];

    long long v19 = [v4 resourceManager];
    [v19 addResource:v18];
  }
  v20.receiver = self;
  v20.super_class = (Class)WFHandleCustomIntentAction;
  [(WFAction *)&v20 configureResourcesForParameter:v4];
}

- (BOOL)hasLocationParameter
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(WFHandleCustomIntentAction *)self codableDescription];
  int64_t v3 = [v2 attributes];
  id v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = [*(id *)(*((void *)&v11 + 1) + 8 * i) metadata];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)generatedResourceNodes
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)WFHandleCustomIntentAction;
  int64_t v3 = [(WFAction *)&v31 generatedResourceNodes];
  id v4 = (void *)[v3 mutableCopy];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (!v6)
  {
    id v8 = 0;
    uint64_t v15 = v5;
    goto LABEL_13;
  }
  uint64_t v7 = v6;
  id v8 = 0;
  uint64_t v9 = *(void *)v28;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v28 != v9) {
        objc_enumerationMutation(v5);
      }
      long long v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      long long v12 = objc_msgSend(v11, "resource", (void)v27);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v14 = v11;

        id v8 = v14;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v34 count:16];
  }
  while (v7);

  if (v8)
  {
    uint64_t v15 = [(WFHandleCustomIntentAction *)self requiredResourcesForIntentAvailableResource];
    uint64_t v16 = objc_msgSend(v15, "if_map:", &__block_literal_global_269);
    long long v17 = [WFResourceNode alloc];
    long long v18 = [v8 resource];
    long long v19 = [(WFResourceNode *)v17 initWithResource:v18 subnodes:v16];

    [v5 removeObject:v8];
    [v5 addObject:v19];

LABEL_13:
  }
  if ([(WFHandleCustomIntentAction *)self hasLocationParameter])
  {
    objc_super v20 = [WFLocationAccessResource alloc];
    v32 = @"WFResourceClass";
    long long v21 = (objc_class *)objc_opt_class();
    long long v22 = NSStringFromClass(v21);
    uint64_t v33 = v22;
    long long v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    long long v24 = [(WFAccessResource *)v20 initWithDefinition:v23];

    id v25 = [[WFResourceNode alloc] initWithResource:v24];
    [v5 addObject:v25];
  }
  return v5;
}

WFResourceNode *__52__WFHandleCustomIntentAction_generatedResourceNodes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int64_t v3 = [[WFResourceNode alloc] initWithResource:v2];

  return v3;
}

- (BOOL)intentDescriptorIsSyncedFromOtherDevices
{
  id v2 = [(WFHandleCustomIntentAction *)self schema];
  char v3 = [v2 isSyncedFromOtherDevice];

  return v3;
}

- (NSString)appIdentifier
{
  if (self->_appIdentifier)
  {
    if (VCIsShortcutsAppBundleIdentifier())
    {
      char v3 = 0;
      goto LABEL_7;
    }
    appIdentifier = self->_appIdentifier;
  }
  else
  {
    appIdentifier = 0;
  }
  char v3 = appIdentifier;
LABEL_7:
  return v3;
}

- (id)parameterKeysIgnoredForParameterSummary
{
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"ShowWhenRun", 0);
  return v2;
}

- (BOOL)populatesInputFromInputParameter
{
  return 0;
}

- (void)parameterDefaultSerializedRepresentationDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 key];
  uint64_t v6 = [(WFAction *)self parameterStateForKey:v5 fallingBackToDefaultValue:0];

  if (v6) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v7 = [v4 defaultSerializedRepresentation];
  if (!v7
    || ([(WFHandleCustomIntentAction *)self createStateForParameter:v4 fromSerializedRepresentation:v7], (uint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_7:
    v11.receiver = self;
    v11.super_class = (Class)WFHandleCustomIntentAction;
    [(WFAction *)&v11 parameterDefaultSerializedRepresentationDidChange:v4];
    goto LABEL_8;
  }
  uint64_t v9 = (void *)v8;
  uint64_t v10 = [v4 key];
  [(WFAction *)self setParameterState:v9 forKey:v10];

LABEL_8:
}

- (BOOL)shouldInsertExpandingParameterForParameter:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 definition];
    uint64_t v6 = [v5 objectForKey:@"IntentSlotName"];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = WFEnforceClass(v6, v7);

    uint64_t v9 = [(WFHandleCustomIntentAction *)self codableDescription];
    uint64_t v10 = [v9 attributeByName:v8];

    if ([v4 allowsMultipleValues])
    {
      if ([v10 supportsSearch]) {
        unsigned __int8 v11 = 1;
      }
      else {
        unsigned __int8 v11 = [v4 isRangedSizeArray];
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFHandleCustomIntentAction;
    unsigned __int8 v11 = [(WFAction *)&v13 shouldInsertExpandingParameterForParameter:v4];
  }

  return v11;
}

- (id)actionForAppIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WFHandleCustomIntentAction *)self intentDescriptor];
  uint64_t v6 = [v5 bundleIdentifier];

  if (v6 && (VCIsShortcutsAppBundleIdentifier() & 1) != 0)
  {
    uint64_t v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFHandleCustomIntentAction;
    uint64_t v7 = [(WFAction *)&v9 actionForAppIdentifier:v4];
  }

  return v7;
}

- (void)setupParameter:(id)a3
{
  id v4 = a3;
  id v19 = v4;
  if (v4)
  {
    if ([v4 conformsToProtocol:&unk_1F234F128])
    {
      id v5 = [v19 definition];
      uint64_t v6 = [v5 objectForKey:@"IntentSlotName"];
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = WFEnforceClass(v6, v7);

      objc_super v9 = [(WFHandleCustomIntentAction *)self codableDescription];
      uint64_t v10 = [v9 attributeByName:v8];

      [v19 setCodableAttribute:v10];
      unsigned __int8 v11 = [(WFHandleIntentAction *)self stringLocalizer];
      [v19 setStringLocalizer:v11];

      long long v12 = v19;
    }
    else
    {
      long long v12 = 0;
      uint64_t v8 = v19;
    }

    id v14 = v19;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    id v16 = v15;

    [v16 setDataSource:self];
    id v17 = v14;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v13 = v17;
    }
    else {
      objc_super v13 = 0;
    }
  }
  else
  {
    [0 setDataSource:self];
    long long v12 = 0;
    objc_super v13 = 0;
  }
  id v18 = v13;

  [v18 setDataSource:self];
}

- (void)initializeParameters
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)WFHandleCustomIntentAction;
  [(WFHandleIntentAction *)&v12 initializeParameters];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  char v3 = [(WFAction *)self parameters];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(WFHandleCustomIntentAction *)self setupParameter:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)createStateForParameter:(id)a3 fromSerializedRepresentation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(WFHandleCustomIntentAction *)self setupParameter:v7];
  v10.receiver = self;
  v10.super_class = (Class)WFHandleCustomIntentAction;
  long long v8 = [(WFAction *)&v10 createStateForParameter:v7 fromSerializedRepresentation:v6];

  return v8;
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(WFHandleCustomIntentAction *)self parametersByIntentSlotName];
  long long v8 = [(WFHandleIntentAction *)self stringLocalizer];
  long long v9 = WFSerializedParametersForDonatedIntent(v6, 0, a4, v7, v8);

  return v9;
}

- (id)parametersByIntentSlotName
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(WFAction *)self parameters];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_super v10 = [v9 intentSlotName];

        if (v10)
        {
          long long v11 = [v9 intentSlotName];
          [v3 setObject:v9 forKey:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)resolver
{
  if (resolver_onceToken != -1) {
    dispatch_once(&resolver_onceToken, &__block_literal_global_29402);
  }
  id v2 = (void *)resolver_resolver;
  return v2;
}

void __38__WFHandleCustomIntentAction_resolver__block_invoke()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F302D0] sharedResolver];
  v1 = (void *)resolver_resolver;
  resolver_resolver = v0;

  id v2 = (void *)MEMORY[0x1E4F302D8];
  uint64_t v5 = *MEMORY[0x1E4F30060];
  v6[0] = MEMORY[0x1E4F1CC38];
  char v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v4 = [v2 optionsWithDictionary:v3];

  [(id)resolver_resolver setOptions:v4];
}

- (id)requiredResourcesForIntentAvailableResource
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)copyWithSerializedParameters:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t v6 = [(WFAction *)self identifier];
  uint64_t v7 = [(WFAction *)self definition];
  long long v8 = [(WFHandleCustomIntentAction *)self schema];
  long long v9 = [(WFHandleCustomIntentAction *)self intent];
  objc_super v10 = [(WFHandleCustomIntentAction *)self intentDescriptor];
  long long v11 = [(WFHandleIntentAction *)self stringLocalizer];
  objc_super v12 = (void *)[v5 initWithIdentifier:v6 definition:v7 serializedParameters:v4 schema:v8 intent:v9 resolvedIntentDescriptor:v10 stringLocalizer:v11];

  return v12;
}

- (WFHandleCustomIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 schema:(id)a6 intent:(id)a7 resolvedIntentDescriptor:(id)a8 stringLocalizer:(id)a9
{
  v85[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  long long v15 = (WFActionDefinition *)a4;
  id v16 = a5;
  id obj = a6;
  id v79 = a6;
  id v72 = a7;
  id v78 = a7;
  id v17 = a8;
  id v18 = a9;
  if (!v15)
  {
    id v19 = [WFActionDefinition alloc];
    long long v15 = [(WFActionDefinition *)v19 initWithDictionary:MEMORY[0x1E4F1CC08]];
  }
  uint64_t v70 = *MEMORY[0x1E4F30890];
  objc_super v20 = [(id)*MEMORY[0x1E4F30890] stringByAppendingString:v14];
  v77 = +[WFIntentActionProvider disabledPlatformsForIntentWithTypeName:v20];
  long long v21 = WFInjectDisabledPlatformsInActionDefinition(v77, v15);

  long long v22 = objc_opt_new();
  long long v23 = [v17 displayableBundleIdentifier];
  long long v24 = v23;
  if (v23)
  {
    id v80 = v23;
  }
  else
  {
    id v25 = [v17 bundleIdentifier];
    uint64_t v26 = v25;
    if (v25)
    {
      id v27 = v25;
    }
    else
    {
      id v27 = [v17 extensionBundleIdentifier];
    }
    id v80 = v27;
  }
  long long v28 = [v17 displayableApplicationRecord];
  v73 = v22;
  v74 = v28;
  uint64_t v29 = 1;
  if (v28 && (objc_msgSend(v28, "wf_isAvailableInContext:", 1) & 1) == 0)
  {
    long long v30 = [v21 objectForKey:@"RequiredResources"];
    if (v30)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_super v31 = v30;
      }
      else {
        objc_super v31 = 0;
      }
    }
    else
    {
      objc_super v31 = 0;
    }
    id v32 = v18;
    id v33 = v31;

    uint64_t v34 = (void *)[v33 mutableCopy];
    id v35 = v14;
    if (v34) {
      id v36 = v34;
    }
    else {
      id v36 = (id)objc_opt_new();
    }
    v37 = v36;

    v38 = (objc_class *)objc_opt_class();
    v39 = NSStringFromClass(v38);
    [v37 addObject:v39];

    v84 = @"RequiredResources";
    v40 = (void *)[v37 copy];
    v85[0] = v40;
    v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:&v84 count:1];
    uint64_t v42 = [v21 definitionByAddingEntriesInDictionary:v41];

    uint64_t v29 = 0;
    long long v21 = (void *)v42;
    id v14 = v35;
    id v18 = v32;
    long long v22 = v73;
  }
  v43 = [v21 objectForKey:@"Discoverable"];

  if (!v43)
  {
    v44 = [NSNumber numberWithInt:v29];
    [v22 setObject:v44 forKeyedSubscript:@"Discoverable"];
  }
  if (v80)
  {
    v45 = [v21 objectForKey:@"AppDefinition"];

    if (!v45)
    {
      uint64_t v82 = *MEMORY[0x1E4FB4508];
      id v83 = v80;
      v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
      [v22 setObject:v46 forKeyedSubscript:@"AppDefinition"];
    }
  }
  v47 = [v21 objectForKey:@"IntentName"];

  if (!v47)
  {
    v48 = [v17 intentClassName];
    [v22 setObject:v48 forKeyedSubscript:@"IntentName"];
  }
  v49 = [v17 extensionBundleIdentifier];
  if (v49 || ([v17 bundleIdentifier], (v49 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v50 = [v21 objectForKey:@"IntentIdentifier"];

    if (!v50)
    {
      v51 = [v17 intentClassName];
      v52 = [NSString stringWithFormat:@"%@%@.%@", v70, v49, v51];
      [v22 setObject:v52 forKeyedSubscript:@"IntentIdentifier"];
    }
  }
  v53 = [v21 definitionByAddingEntriesInDictionary:v22];

  v81.receiver = self;
  v81.super_class = (Class)WFHandleCustomIntentAction;
  v54 = [(WFHandleIntentAction *)&v81 initWithIdentifier:v14 definition:v53 serializedParameters:v16 stringLocalizer:v18];
  v55 = v54;
  if (v54)
  {
    v76 = v20;
    id v56 = v18;
    id v57 = v14;
    objc_storeStrong((id *)&v54->_schema, obj);
    objc_storeStrong((id *)&v55->_intent, v72);
    uint64_t v58 = [v80 copy];
    appIdentifier = v55->_appIdentifier;
    v55->_appIdentifier = (NSString *)v58;

    v60 = [v16 objectForKey:@"IntentAppDefinition"];
    uint64_t v61 = objc_opt_class();
    v62 = WFEnforceClass(v60, v61);

    if (v62) {
      id v63 = (id)[objc_alloc(MEMORY[0x1E4F304E0]) initWithSerializedRepresentation:v62];
    }
    else {
      id v63 = v17;
    }
    v64 = v63;
    v65 = [(WFHandleCustomIntentAction *)v55 resolver];
    uint64_t v66 = [v65 resolvedIntentMatchingDescriptor:v64];
    intentDescriptor = v55->_intentDescriptor;
    v55->_intentDescriptor = (INIntentDescriptor *)v66;

    v68 = v55;
    id v14 = v57;
    id v18 = v56;
    objc_super v20 = v76;
    long long v22 = v73;
  }

  return v55;
}

- (WFHandleCustomIntentAction)initWithIdentifier:(id)a3 intent:(id)a4 className:(id)a5 bundleIdentifier:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [WFActionDefinition alloc];
  long long v15 = [(WFActionDefinition *)v14 initWithDictionary:MEMORY[0x1E4F1CC08]];
  id v16 = [MEMORY[0x1E4F30788] localizerForLanguage:0];
  id v17 = [(WFHandleCustomIntentAction *)self initWithIdentifier:v13 definition:v15 serializedParameters:0 schema:0 intent:v12 className:v11 bundleIdentifier:v10 stringLocalizer:v16];

  return v17;
}

- (WFHandleCustomIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 schema:(id)a6 intent:(id)a7 className:(id)a8 bundleIdentifier:(id)a9 stringLocalizer:(id)a10
{
  id v17 = (objc_class *)MEMORY[0x1E4F304E0];
  id v30 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  id v25 = (void *)[[v17 alloc] initWithIntentClassName:v19 launchableAppBundleId:v18];

  uint64_t v26 = [(WFHandleCustomIntentAction *)self resolver];
  id v27 = [v26 resolvedIntentMatchingDescriptor:v25];

  long long v28 = [(WFHandleCustomIntentAction *)self initWithIdentifier:v24 definition:v23 serializedParameters:v22 schema:v21 intent:v20 resolvedIntentDescriptor:v27 stringLocalizer:v30];
  return v28;
}

- (WFHandleCustomIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 stringLocalizer:(id)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  id v9 = a4;
  id v47 = a5;
  id v48 = a6;
  id v10 = getWFGeneralLogObject();
  os_signpost_id_t spid = os_signpost_id_generate(v10);

  id v11 = getWFGeneralLogObject();
  id v12 = v11;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v50;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CustomIntentActionInitialization", "identifier=%{signpost.description:attribute}@", buf, 0xCu);
  }

  id v13 = [v9 objectForKey:@"IntentIdentifier"];
  uint64_t v14 = objc_opt_class();
  WFEnforceClass(v13, v14);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  if (![v15 length])
  {
    id v16 = [v9 objectForKey:@"AppDefinition"];
    uint64_t v17 = objc_opt_class();
    id v18 = WFEnforceClass(v16, v17);

    id v19 = [v18 objectForKey:*MEMORY[0x1E4FB4508]];
    uint64_t v20 = objc_opt_class();
    id v21 = WFEnforceClass(v19, v20);

    id v22 = [v9 objectForKey:@"IntentName"];
    uint64_t v23 = objc_opt_class();
    id v24 = WFEnforceClass(v22, v23);

    if ([v21 length])
    {
      id v25 = +[ICAppRegistry sharedRegistry];
      uint64_t v26 = [v25 appWithIdentifier:v21];
      id v27 = [v26 bundleIdentifier];

      if ([v27 length] && objc_msgSend(v24, "length"))
      {
        uint64_t v28 = [NSString stringWithFormat:@"%@%@.%@", *MEMORY[0x1E4F30890], v27, v24];

        id v15 = (id)v28;
      }
    }
  }
  if (!v15) {
    id v15 = v50;
  }
  uint64_t v61 = 0;
  uint64_t v62 = 0;
  uint64_t v29 = INSchemaWithTypeName();
  id v30 = 0;
  id v31 = 0;
  if (v31 && v30)
  {
    id v32 = [objc_alloc(MEMORY[0x1E4F304E0]) initWithIntentClassName:v30 launchableAppBundleId:v31];
    id v33 = [(WFHandleCustomIntentAction *)self resolver];
    uint64_t v34 = [v33 resolvedIntentMatchingDescriptor:v32];

    id v35 = [v34 bundleIdentifier];
    id v36 = v35;
    if (v35)
    {
      id v37 = v35;
    }
    else
    {
      id v37 = [v34 extensionBundleIdentifier];
    }
    v39 = v37;

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v64 = __Block_byref_object_copy__29419;
    v65 = __Block_byref_object_dispose__29420;
    id v66 = 0;
    v40 = [MEMORY[0x1E4F304C8] sharedConnection];
    v41 = [MEMORY[0x1E4F1CAD0] setWithObject:v39];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __97__WFHandleCustomIntentAction_initWithIdentifier_definition_serializedParameters_stringLocalizer___block_invoke;
    v52[3] = &unk_1E6551668;
    v60 = buf;
    v53 = self;
    id v54 = v50;
    id v55 = v9;
    id v56 = v47;
    id v57 = v29;
    id v42 = v34;
    id v58 = v42;
    id v59 = v48;
    objc_msgSend(v40, "wf_accessBundleContentForBundleIdentifiers:withBlock:", v41, v52);

    v43 = getWFGeneralLogObject();
    v44 = v43;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      *(_WORD *)v51 = 0;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v44, OS_SIGNPOST_INTERVAL_END, spid, "CustomIntentActionInitialization", "", v51, 2u);
    }

    v38 = (WFHandleCustomIntentAction *)*(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v32 = getWFGeneralLogObject();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WFHandleCustomIntentAction initWithIdentifier:definition:serializedParameters:stringLocalizer:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v15;
      _os_log_impl(&dword_1C7F0A000, v32, OS_LOG_TYPE_ERROR, "%s Bundle identifier for type name %{public}@ was nil.", buf, 0x16u);
    }
    v38 = 0;
  }

  return v38;
}

void __97__WFHandleCustomIntentAction_initWithIdentifier_definition_serializedParameters_stringLocalizer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) initWithIdentifier:*(void *)(a1 + 40) definition:*(void *)(a1 + 48) serializedParameters:*(void *)(a1 + 56) schema:*(void *)(a1 + 64) intent:0 resolvedIntentDescriptor:*(void *)(a1 + 72) stringLocalizer:*(void *)(a1 + 80)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 88) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end