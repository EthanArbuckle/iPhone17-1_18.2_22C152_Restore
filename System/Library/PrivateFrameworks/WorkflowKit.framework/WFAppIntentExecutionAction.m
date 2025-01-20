@interface WFAppIntentExecutionAction
- (BOOL)actionIsExecutedFromAnotherDevice;
- (BOOL)didRunOpensIntent;
- (BOOL)enumeration:(id)a3 shouldStripSenstitiveContentFromValue:(id)a4;
- (BOOL)enumerationShouldAlwaysReloadPossibleStates:(id)a3;
- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4;
- (BOOL)isApprovedForPublicShortcutsDrawer;
- (BOOL)isProgressIndeterminate;
- (BOOL)mightSuppressRunningProgress;
- (BOOL)populatesInputFromInputParameter;
- (BOOL)progressIsPersistentInSystemApertureForExecutor:(id)a3;
- (BOOL)requiresUnlock;
- (BOOL)shouldAskForValuesWhileProcessingParameterStates;
- (BOOL)shouldLoadDefaultStateAsynchronouslyForEnumeration:(id)a3;
- (BOOL)shouldLocalizeValueForSelector:(SEL)a3;
- (BOOL)shouldSkipLoadingDefaultValue;
- (BOOL)shouldStripSensitiveContentFromParameterSerialization;
- (BOOL)skipExecutingInSiri;
- (BOOL)valueShouldStripSensitiveContent:(id)a3;
- (BOOL)visibleForUse:(int64_t)a3;
- (Class)toolkitValueClassForParameter:(id)a3;
- (INAppIntentDescriptor)appIntentDescriptor;
- (LNActionConfigurationContext)actionConfigurationContext;
- (LNActionExecutorOptions)executorOptions;
- (LNActionMetadata)metadata;
- (LNAppIntentConnectionPolicy)connectionPolicy;
- (LNAttribution)attribution;
- (LNConnection)connection;
- (LNConnectionPolicySignals)connectionPolicySignals;
- (LNFullyQualifiedActionIdentifier)fullyQualifiedLinkActionIdentifier;
- (LNSystemContext)linkSystemContext;
- (LNUndoContext)undoContext;
- (NSMutableDictionary)dependentParameterIdentifiers;
- (NSMutableDictionary)parameterIdentifiersNeedingValues;
- (NSSet)fetchingDisplayRepresentationParameterKeys;
- (NSString)displayableAppBundleIdentifier;
- (NSString)preferredExtensionBundleIdentifier;
- (OS_dispatch_queue)processingParametersQueue;
- (WFAppIntentExecutionAction)initWithIdentifier:(id)a3 metadata:(id)a4 definition:(id)a5 serializedParameters:(id)a6 appIntentDescriptor:(id)a7 fullyQualifiedActionIdentifier:(id)a8;
- (id)alertForLinkActionConfirmationWithActionMetadata:(id)a3 dialogString:(id)a4 request:(id)a5;
- (id)alertForLinkConfirmationDialogRequest:(id)a3 preferredStyle:(int64_t)a4 handler:(id)a5;
- (id)backingActionIdentifiers;
- (id)bundleIdentifier;
- (id)copyForProcessing;
- (id)copyWithSerializedParameters:(id)a3;
- (id)createStateForParameter:(id)a3 fromSerializedRepresentation:(id)a4;
- (id)defaultSerializedRepresentationForEnumeration:(id)a3;
- (id)defaultSerializedRepresentationForEnumeration:(id)a3 result:(id)a4;
- (id)displayableAppDescriptor;
- (id)entityMetadataForIdentifier:(id)a3;
- (id)enumeration:(id)a3 accessoryImageForPossibleState:(id)a4;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)enumeration:(id)a3 localizedSubtitleLabelForPossibleState:(id)a4;
- (id)externalMetricsActionIdentifier;
- (id)externalMetricsBundleIdentifier;
- (id)linkActionWithParameters:(id)a3;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)outputDictionary;
- (id)parameterMetadataForIdentifier:(id)a3;
- (id)parametersNeedingDisplayRepresentation;
- (id)postProcessToolKitProcessedValue:(id)a3 forParameter:(id)a4;
- (id)sessionKitSessionInvocationType;
- (id)valueForParameterData:(id)a3 withParameterState:(id)a4;
- (int64_t)authenticationPolicy;
- (int64_t)runKind;
- (unsigned)runSource;
- (void)alertForLinkActionConfirmationWithParameterMetadata:(id)a3 dialogString:(id)a4 request:(id)a5 completionHandler:(id)a6;
- (void)askForParameterValueForParameterName:(id)a3 request:(id)a4 dialogString:(id)a5;
- (void)completeLoadingPossibleStatesForEnumerationParameter:(id)a3 result:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)configureParameter:(id)a3;
- (void)confirmActionWithRequest:(id)a3 dialogString:(id)a4;
- (void)confirmContinueInAppWithRequest:(id)a3 dialogString:(id)a4;
- (void)confirmParameterValueForParameterName:(id)a3 request:(id)a4 dialogString:(id)a5;
- (void)disambiguateParameterForParameterName:(id)a3 request:(id)a4 dialogString:(id)a5;
- (void)executor:(id)a3 environmentForViewSnippetWithCompletion:(id)a4;
- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsAppProtectionUnlockWithCompletionHandler:(id)a4;
- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4;
- (void)executor:(id)a3 needsContinueInAppWithRequest:(id)a4;
- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4;
- (void)executor:(id)a3 needsValueWithRequest:(id)a4;
- (void)executor:(id)a3 preferredContentSizeForViewSnippetWithCompletion:(id)a4;
- (void)executorWillLaunchApplicationInForeground:(id)a3;
- (void)fetchMissingDisplayRepresentationValuesWithCompletionHandler:(id)a3;
- (void)finishRunningWithError:(id)a3;
- (void)generateShortcutRepresentation:(id)a3;
- (void)generateStandaloneShortcutRepresentation:(id)a3;
- (void)getLinkActionForArchivingFallingBackToDefaultValue:(BOOL)a3 completionHandler:(id)a4;
- (void)getLinkActionForArchivingWithCompletionHandler:(id)a3;
- (void)getLinkActionWithProcessedParameters:(id)a3 completionHandler:(id)a4;
- (void)getLinkActionWithProcessedParameters:(id)a3 forFocusConfiguration:(BOOL)a4 completionHandler:(id)a5;
- (void)getLinkActionWithProcessedParameters:(id)a3 forFocusConfiguration:(BOOL)a4 fallingBackToDefaultValue:(BOOL)a5 completionHandler:(id)a6;
- (void)getValueForParameterData:(id)a3 ofProcessedParameters:(id)a4 completionHandler:(id)a5;
- (void)getValueForParameterData:(id)a3 ofProcessedParameters:(id)a4 fallingBackToDefaultValue:(BOOL)a5 completionHandler:(id)a6;
- (void)loadDefaultResultForEnumeration:(id)a3 completionHandler:(id)a4;
- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4;
- (void)loadDynamicResultForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
- (void)loadDynamicResultForEnumeration:(id)a3 searchTerm:(id)a4 optionsProviderReference:(id)a5 completionHandler:(id)a6;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 optionsProviderReference:(id)a5 completionHandler:(id)a6;
- (void)processEncodedValue:(id)a3 withToolKitInvocation:(id)a4 forParameter:(id)a5 completionHandler:(id)a6;
- (void)processValueForParameter:(id)a3 withToolKitInvocation:(id)a4 completionHandler:(id)a5;
- (void)setAttribution:(id)a3;
- (void)setAuthenticationPolicy:(int64_t)a3;
- (void)setDidRunOpensIntent:(BOOL)a3;
- (void)setFetchingDisplayRepresentationParameterKeys:(id)a3;
- (void)setLinkSystemContext:(id)a3;
- (void)setParameterIdentifiersNeedingValues:(id)a3;
- (void)setPreferredExtensionBundleIdentifier:(id)a3;
- (void)setUndoContext:(id)a3;
- (void)showChronoControlIfPossibleForIntent:(id)a3 completionHandler:(id)a4;
- (void)willBeginProcessingParameterStates;
@end

@implementation WFAppIntentExecutionAction

- (LNFullyQualifiedActionIdentifier)fullyQualifiedLinkActionIdentifier
{
  return self->_fullyQualifiedLinkActionIdentifier;
}

- (id)linkActionWithParameters:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_connectionLock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__WFAppIntentExecutionAction_linkActionWithParameters___block_invoke;
  aBlock[3] = &unk_1E6558B28;
  aBlock[4] = self;
  v5 = (void (**)(void))_Block_copy(aBlock);
  v6 = [(WFAppIntentExecutionAction *)self connectionPolicy];
  v7 = [v6 actionWithParameters:v4];

  v5[2](v5);
  return v7;
}

void __55__WFAppIntentExecutionAction_linkActionWithParameters___block_invoke(uint64_t a1)
{
}

- (id)parameterMetadataForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(WFAppIntentExecutionAction *)self metadata];
  v6 = [v5 parameters];
  v7 = objc_msgSend(v6, "if_firstObjectWithValue:forKey:", v4, @"name");

  return v7;
}

- (LNAppIntentConnectionPolicy)connectionPolicy
{
  os_unfair_lock_lock(&self->_policyLock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__WFAppIntentExecutionAction_connectionPolicy__block_invoke;
  aBlock[3] = &unk_1E6558B28;
  aBlock[4] = self;
  v3 = (void (**)(void))_Block_copy(aBlock);
  id v4 = [(WFAppIntentExecutionAction *)self metadata];
  v5 = [v4 effectiveBundleIdentifiers];
  v6 = &OBJC_IVAR___WFMediaItemDescriptor__playbackArchiveData;
  if ([v5 count] != 1) {
    goto LABEL_40;
  }
  v7 = [(WFAppIntentExecutionAction *)self metadata];
  v8 = [v7 effectiveBundleIdentifiers];
  v9 = [v8 firstObject];
  uint64_t v10 = [v9 type];

  v6 = &OBJC_IVAR___WFMediaItemDescriptor__playbackArchiveData;
  if (v10 != 3) {
    goto LABEL_41;
  }
  id v4 = [(WFAction *)self parameterValueForKey:@"app" ofClass:objc_opt_class()];
  if (!v4)
  {
    v11 = [(WFAction *)self parameterStateForKey:@"app"];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v12 = v11;
      }
      else {
        v12 = 0;
      }
    }
    else
    {
      v12 = 0;
    }
    id v13 = v12;

    v14 = [v13 value];
    id v4 = [v14 value];
  }
  v15 = [v4 value];
  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  id v17 = v16;

  v44 = [(WFAction *)self parameterValueForKey:@"processInstanceIdentifier" ofClass:objc_opt_class()];
  v18 = [v44 value];
  if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v19 = [(WFAction *)self parameterStateForKey:@"processInstanceIdentifier"];
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
    id v21 = v20;

    v22 = [v21 variableString];
    v18 = [v22 stringByRemovingVariables];
  }
  v23 = [(WFAppIntentExecutionAction *)self connectionPolicySignals];
  id v24 = [v23 preferredBundleIdentifier];
  id v25 = v17;
  v5 = v25;
  if (v24 == v25)
  {
  }
  else
  {
    id v26 = v25;
    v27 = v24;
    if (!v25 || (id v26 = v25, (v27 = v24) == 0))
    {
LABEL_36:

LABEL_37:
LABEL_38:
      connectionPolicy = self->_connectionPolicy;
      self->_connectionPolicy = 0;

      v32 = (LNConnectionPolicySignals *)objc_opt_new();
      connectionPolicySignals = self->_connectionPolicySignals;
      self->_connectionPolicySignals = v32;

      [(LNConnectionPolicySignals *)self->_connectionPolicySignals setPreferredBundleIdentifier:v5];
      [(LNConnectionPolicySignals *)self->_connectionPolicySignals setProcessInstanceIdentifier:v18];
      goto LABEL_39;
    }
    int v28 = [v24 isEqual:v25];

    if (!v28) {
      goto LABEL_37;
    }
  }
  v27 = [(WFAppIntentExecutionAction *)self connectionPolicySignals];
  id v26 = [v27 processInstanceIdentifier];
  id v29 = v18;
  v30 = v29;
  if (v26 != v29)
  {
    if (v29 && v26)
    {
      char v43 = [v26 isEqual:v29];

      if (v43) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }

    goto LABEL_36;
  }

LABEL_39:
  v6 = &OBJC_IVAR___WFMediaItemDescriptor__playbackArchiveData;
LABEL_40:

LABEL_41:
  uint64_t v34 = v6[191];
  v35 = *(Class *)((char *)&self->super.super.isa + v34);
  if (!v35)
  {
    v36 = (void *)MEMORY[0x1E4F72BC8];
    v37 = [(WFAppIntentExecutionAction *)self metadata];
    v38 = [(WFAppIntentExecutionAction *)self connectionPolicySignals];
    v39 = [v36 policyWithActionMetadata:v37 signals:v38];
    v40 = *(Class *)((char *)&self->super.super.isa + v34);
    *(Class *)((char *)&self->super.super.isa + v34) = v39;

    v35 = *(Class *)((char *)&self->super.super.isa + v34);
  }
  id v41 = v35;
  v3[2](v3);

  return (LNAppIntentConnectionPolicy *)v41;
}

- (LNActionMetadata)metadata
{
  return self->_metadata;
}

void __46__WFAppIntentExecutionAction_connectionPolicy__block_invoke(uint64_t a1)
{
}

- (LNActionConfigurationContext)actionConfigurationContext
{
  actionConfigurationContext = self->_actionConfigurationContext;
  if (!actionConfigurationContext)
  {
    id v4 = (LNActionConfigurationContext *)objc_opt_new();
    v5 = self->_actionConfigurationContext;
    self->_actionConfigurationContext = v4;

    actionConfigurationContext = self->_actionConfigurationContext;
  }
  return actionConfigurationContext;
}

- (void)configureParameter:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFAppIntentExecutionAction;
  [(WFAction *)&v15 configureParameter:v4];
  id v5 = v4;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 key];
      v7 = [(WFAppIntentExecutionAction *)self parameterMetadataForIdentifier:v6];

      if (v7)
      {
        [v5 setAction:self];
        [v5 setDataSource:self];
        [v5 setParameterMetadata:v7];
        v8 = [v7 valueType];
        v9 = objc_msgSend(v8, "wf_parameterDefinitionWithParameterMetadata:dynamicOptionsSupport:", v7, 0);

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
        id v13 = v10;

        int v14 = [v13 isUniqueEntity];
        if (v14) {
          [v5 setHidden:1];
        }
      }
      else
      {
        v11 = getWFWorkflowExecutionLogObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          v12 = [v5 key];
          *(_DWORD *)buf = 136315394;
          id v17 = "-[WFAppIntentExecutionAction configureParameter:]";
          __int16 v18 = 2112;
          v19 = v12;
          _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_FAULT, "%s Could not get parameter metadata with key %@", buf, 0x16u);
        }
      }
    }
  }
}

- (id)valueForParameterData:(id)a3 withParameterState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    int v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFAppIntentExecutionAction.m", 643, @"Invalid parameter not satisfying: %@", @"parameterMetadata" object file lineNumber description];
  }
  v9 = [v7 valueType];
  uint64_t v10 = [(WFAction *)self identifier];
  v11 = objc_msgSend(v9, "wf_parameterDefinitionWithParameterMetadata:actionIdentifier:", v7, v10);
  v12 = [v11 linkValueFromParameterState:v8 action:self];

  return v12;
}

- (BOOL)shouldLoadDefaultStateAsynchronouslyForEnumeration:(id)a3
{
  id v4 = [a3 key];
  id v5 = [(WFAppIntentExecutionAction *)self parameterMetadataForIdentifier:v4];

  v6 = [v5 valueType];
  id v7 = objc_msgSend(v6, "wf_parameterDefinitionWithParameterMetadata:", v5);
  id v8 = [v5 typeSpecificMetadata];
  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F72A00]];
  uint64_t v10 = [v7 linkValueWithValue:v9];

  BOOL v12 = ([v5 capabilities] & 1) == 0 || v10 == 0;
  return v12;
}

- (WFAppIntentExecutionAction)initWithIdentifier:(id)a3 metadata:(id)a4 definition:(id)a5 serializedParameters:(id)a6 appIntentDescriptor:(id)a7 fullyQualifiedActionIdentifier:(id)a8
{
  id v29 = a4;
  id v15 = a7;
  id v16 = a8;
  id v17 = a5;
  id v18 = a3;
  v19 = (void *)[a6 mutableCopy];
  v30.receiver = self;
  v30.super_class = (Class)WFAppIntentExecutionAction;
  uint64_t v20 = [(WFAction *)&v30 initWithIdentifier:v18 definition:v17 serializedParameters:v19];

  if (v20)
  {
    objc_storeStrong((id *)&v20->_metadata, a4);
    objc_storeStrong((id *)&v20->_appIntentDescriptor, a7);
    id v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dependentParameterIdentifiers = v20->_dependentParameterIdentifiers;
    v20->_dependentParameterIdentifiers = v21;

    objc_storeStrong((id *)&v20->_fullyQualifiedLinkActionIdentifier, a8);
    v20->_connectionLock._os_unfair_lock_opaque = 0;
    v20->_policyLock._os_unfair_lock_opaque = 0;
    v20->_signalsLock._os_unfair_lock_opaque = 0;
    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v24 = dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.shortcuts.LinkAction.ProcessingParameterQueue", v24);
    processingParametersQueue = v20->_processingParametersQueue;
    v20->_processingParametersQueue = (OS_dispatch_queue *)v25;

    v27 = v20;
  }

  return v20;
}

- (id)createStateForParameter:(id)a3 fromSerializedRepresentation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v6;
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
  [v9 setDataSource:self];

  v12.receiver = self;
  v12.super_class = (Class)WFAppIntentExecutionAction;
  uint64_t v10 = [(WFAction *)&v12 createStateForParameter:v6 fromSerializedRepresentation:v7];

  return v10;
}

- (LNConnectionPolicySignals)connectionPolicySignals
{
  os_unfair_lock_lock(&self->_signalsLock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__WFAppIntentExecutionAction_connectionPolicySignals__block_invoke;
  aBlock[3] = &unk_1E6558B28;
  aBlock[4] = self;
  v3 = (void (**)(void))_Block_copy(aBlock);
  connectionPolicySignals = self->_connectionPolicySignals;
  if (!connectionPolicySignals)
  {
    id v5 = (LNConnectionPolicySignals *)objc_opt_new();
    id v6 = self->_connectionPolicySignals;
    self->_connectionPolicySignals = v5;

    id v7 = [(WFAppIntentExecutionAction *)self preferredExtensionBundleIdentifier];
    [(LNConnectionPolicySignals *)self->_connectionPolicySignals setPreferredBundleIdentifier:v7];

    connectionPolicySignals = self->_connectionPolicySignals;
  }
  id v8 = connectionPolicySignals;
  v3[2](v3);

  return v8;
}

void __53__WFAppIntentExecutionAction_connectionPolicySignals__block_invoke(uint64_t a1)
{
}

- (NSString)preferredExtensionBundleIdentifier
{
  return self->_preferredExtensionBundleIdentifier;
}

void __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke_2_350(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F30580];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [*(id *)(a1 + 32) title];
  id v7 = objc_msgSend(v6, "wf_localizedString");
  id v8 = [*(id *)(a1 + 32) subtitle];
  id v9 = objc_msgSend(v8, "wf_localizedString");
  uint64_t v10 = [*(id *)(a1 + 32) image];
  v11 = [v10 inImage];
  objc_super v12 = (void *)[v5 initWithTitle:v7 subtitle:v9 image:v11 items:v4];

  return v12;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__WFAppIntentExecutionAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v12[3] = &unk_1E6555F28;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(WFAppIntentExecutionAction *)self loadDynamicResultForEnumeration:v11 searchTerm:a4 completionHandler:v12];
}

- (void)loadDynamicResultForEnumeration:(id)a3 searchTerm:(id)a4 optionsProviderReference:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __116__WFAppIntentExecutionAction_loadDynamicResultForEnumeration_searchTerm_optionsProviderReference_completionHandler___block_invoke;
  v18[3] = &unk_1E6555F78;
  id v21 = v11;
  id v22 = v13;
  v18[4] = self;
  id v19 = v10;
  id v20 = v12;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  id v17 = v13;
  [(WFAppIntentExecutionAction *)self getLinkActionForArchivingWithCompletionHandler:v18];
}

- (void)loadDynamicResultForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v5 = a4;
  if ([v5 valueNeedsDisplayRepresentation])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__WFAppIntentExecutionAction_enumeration_localizedLabelForPossibleState___block_invoke;
    v8[3] = &unk_1E6556090;
    v8[4] = self;
    [(WFAppIntentExecutionAction *)self fetchMissingDisplayRepresentationValuesWithCompletionHandler:v8];
    id v6 = 0;
  }
  else
  {
    id v6 = [v5 localizedTitle];
  }

  return v6;
}

- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__WFAppIntentExecutionAction_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke;
  v10[3] = &unk_1E65560E0;
  id v11 = v6;
  id v12 = v7;
  v10[4] = self;
  id v8 = v6;
  id v9 = v7;
  [(WFAppIntentExecutionAction *)self loadDefaultResultForEnumeration:v8 completionHandler:v10];
}

- (void)loadDefaultResultForEnumeration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WFAppIntentExecutionAction *)self shouldSkipLoadingDefaultValue]
    || [(WFAction *)self isRunning])
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__WFAppIntentExecutionAction_loadDefaultResultForEnumeration_completionHandler___block_invoke;
    v8[3] = &unk_1E6556130;
    id v10 = v7;
    v8[4] = self;
    id v9 = v6;
    [(WFAppIntentExecutionAction *)self getLinkActionForArchivingWithCompletionHandler:v8];
  }
}

- (void)getLinkActionForArchivingWithCompletionHandler:(id)a3
{
}

- (void)getLinkActionForArchivingFallingBackToDefaultValue:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(WFAppIntentExecutionAction *)self processingParametersQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __99__WFAppIntentExecutionAction_getLinkActionForArchivingFallingBackToDefaultValue_completionHandler___block_invoke;
  v9[3] = &unk_1E6555C38;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(WFAction *)self processParametersWithoutAskingForValuesWithInput:0 workQueue:v7 fallingBackToDefaultValue:v4 completionHandler:v9];
}

- (OS_dispatch_queue)processingParametersQueue
{
  return self->_processingParametersQueue;
}

- (BOOL)shouldSkipLoadingDefaultValue
{
  return self->_shouldSkipLoadingDefaultValue;
}

- (id)enumeration:(id)a3 localizedSubtitleLabelForPossibleState:(id)a4
{
  return (id)objc_msgSend(a4, "localizedSubtitle", a3);
}

- (id)enumeration:(id)a3 accessoryImageForPossibleState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = [v6 image];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __80__WFAppIntentExecutionAction_loadDefaultResultForEnumeration_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke_348(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v8 = a2;
  id v9 = [v8 value];
  objc_msgSend(v8, "setContainsSensitiveContent:", objc_msgSend(v6, "valueShouldStripSensitiveContent:", v9));

  id v10 = objc_alloc((Class)[*(id *)(a1 + 40) singleStateClass]);
  id v17 = [v8 title];
  id v11 = objc_msgSend(v17, "wf_localizedString");
  id v12 = [v8 subtitle];
  id v13 = objc_msgSend(v12, "wf_localizedString");
  id v14 = [v8 image];
  id v15 = objc_msgSend(v14, "wf_image");
  id v16 = (void *)[v10 initWithValue:v8 localizedTitle:v11 localizedSubtitle:v13 image:v15];

  v7[2](v7, v16, 0);
}

void __133__WFAppIntentExecutionAction_getLinkActionWithProcessedParameters_forFocusConfiguration_fallingBackToDefaultValue_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 48);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __133__WFAppIntentExecutionAction_getLinkActionWithProcessedParameters_forFocusConfiguration_fallingBackToDefaultValue_completionHandler___block_invoke_2;
  v13[3] = &unk_1E6555B68;
  v13[4] = v8;
  id v14 = v6;
  char v16 = *(unsigned char *)(a1 + 49);
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  [v8 getValueForParameterData:v12 ofProcessedParameters:v9 fallingBackToDefaultValue:v10 completionHandler:v13];
}

- (void)getValueForParameterData:(id)a3 ofProcessedParameters:(id)a4 fallingBackToDefaultValue:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v22 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = v22;
  if (!v22)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFAppIntentExecutionAction.m", 666, @"Invalid parameter not satisfying: %@", @"parameterMetadata" object file lineNumber description];

    id v13 = 0;
  }
  id v14 = [v13 name];
  id v15 = [v11 objectForKeyedSubscript:v14];

  char v16 = [v22 valueType];
  id v17 = objc_msgSend(v16, "wf_parameterDefinitionWithParameterMetadata:", v22);

  if (v17)
  {
    id v18 = [v22 name];
    id v19 = [(WFAction *)self parameterStateForKey:v18 fallingBackToDefaultValue:v7];
    id v20 = [(WFAction *)self contentPermissionRequestor];
    objc_msgSend(v17, "getLinkValueFromProcessedParameterValue:parameterState:permissionRequestor:runningFromToolKit:completionHandler:", v15, v19, v20, -[WFAction runningInToolKit](self, "runningInToolKit"), v12);
  }
  else
  {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
  }
}

void __133__WFAppIntentExecutionAction_getLinkActionWithProcessedParameters_forFocusConfiguration_fallingBackToDefaultValue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    BOOL v7 = [v5 value];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = objc_msgSend(v7, "if_map:", &__block_literal_global_187);

      BOOL v7 = (void *)v8;
    }
    id v9 = objc_alloc(MEMORY[0x1E4F72E10]);
    uint64_t v10 = [v5 valueType];
    id v11 = [v5 displayRepresentation];
    id v26 = (id)[v9 initWithValue:v7 valueType:v10 displayRepresentation:v11];
  }
  else
  {
    id v26 = 0;
  }
  id v12 = [*(id *)(a1 + 32) parameterIdentifiersNeedingValues];
  id v13 = [*(id *)(a1 + 40) name];
  id v14 = [v12 objectForKeyedSubscript:v13];

  if (v14)
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F72CF8]);
    [v15 setForcesNeedsValue:1];

    id v16 = 0;
  }
  else
  {
    id v15 = 0;
    id v16 = v26;
  }
  id v27 = v16;
  if (*(unsigned char *)(a1 + 56))
  {
    if ([*(id *)(a1 + 32) valueShouldStripSensitiveContent:v16])
    {
      [v27 setDisplayRepresentation:0];
      id v17 = [v27 valueType];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v19 = [v27 value];
        if (v19)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v20 = v19;
          }
          else {
            id v20 = 0;
          }
        }
        else
        {
          id v20 = 0;
        }
        id v21 = v20;

        [v21 enumerateObjectsUsingBlock:&__block_literal_global_192_58491];
      }
    }
  }
  uint64_t v22 = *(void *)(a1 + 48);
  id v23 = objc_alloc(MEMORY[0x1E4F72CF0]);
  id v24 = [*(id *)(a1 + 40) name];
  dispatch_queue_t v25 = (void *)[v23 initWithIdentifier:v24 value:v27 configuration:v15];
  (*(void (**)(uint64_t, void *, id))(v22 + 16))(v22, v25, v6);
}

- (BOOL)valueShouldStripSensitiveContent:(id)a3
{
  id v4 = a3;
  if (-[WFAppIntentExecutionAction shouldStripSensitiveContentFromParameterSerialization](self, "shouldStripSensitiveContentFromParameterSerialization")&& ([v4 valueType], id v5 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "wf_entityValueType"), v6 = objc_claimAutoreleasedReturnValue(), v6, v5, v6))
  {
    BOOL v7 = [v4 valueType];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v19 = 0;
      id v20 = &v19;
      uint64_t v21 = 0x2020000000;
      char v22 = 0;
      id v9 = [v4 value];
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
      id v17 = v10;

      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __63__WFAppIntentExecutionAction_valueShouldStripSensitiveContent___block_invoke;
      v18[3] = &unk_1E65560B8;
      v18[4] = &v19;
      [v17 enumerateObjectsUsingBlock:v18];

      char v11 = *((unsigned char *)v20 + 24) != 0;
      _Block_object_dispose(&v19, 8);
    }
    else
    {
      id v13 = [v4 value];
      if (v13)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v14 = v13;
        }
        else {
          id v14 = 0;
        }
      }
      else
      {
        id v14 = 0;
      }
      id v15 = v14;

      char v16 = [v15 isTransient];
      char v11 = v16 ^ 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)shouldStripSensitiveContentFromParameterSerialization
{
  return 0;
}

- (NSMutableDictionary)parameterIdentifiersNeedingValues
{
  return self->_parameterIdentifiersNeedingValues;
}

void __133__WFAppIntentExecutionAction_getLinkActionWithProcessedParameters_forFocusConfiguration_fallingBackToDefaultValue_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a3)
  {
    id v4 = *(void (**)(uint64_t, void))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 40);
    v4(v5, 0);
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) linkActionWithParameters:a2];
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v6, 0);
  }
}

void __80__WFAppIntentExecutionAction_loadDefaultResultForEnumeration_completionHandler___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!v5)
  {
    id v6 = (void (**)(id, void, void *))a1[6];
    BOOL v7 = [a1[4] localizedErrorWithLinkError:a3];
    v6[2](v6, 0, v7);
  }
  uint64_t v8 = [a1[4] connection];
  id v9 = [a1[4] metadata];
  uint64_t v10 = [a1[5] key];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__WFAppIntentExecutionAction_loadDefaultResultForEnumeration_completionHandler___block_invoke_2;
  v11[3] = &unk_1E6556108;
  id v12 = a1[6];
  [v8 fetchDefaultValueForAction:v5 actionMetadata:v9 parameterIdentifier:v10 completionHandler:v11];
}

- (LNConnection)connection
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock(&self->_connectionLock);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__WFAppIntentExecutionAction_connection__block_invoke;
  aBlock[3] = &unk_1E6558B28;
  aBlock[4] = self;
  uint64_t v3 = (void (**)(void))_Block_copy(aBlock);
  id v4 = [(WFAppIntentExecutionAction *)self connectionPolicy];
  id v9 = 0;
  id v5 = [v4 connectionWithError:&v9];
  id v6 = v9;

  if (!v5)
  {
    BOOL v7 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v12 = "-[WFAppIntentExecutionAction connection]";
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Failed to initialize LNConnection: %{public}@.", buf, 0x16u);
    }
  }
  v3[2](v3);

  return (LNConnection *)v5;
}

void __40__WFAppIntentExecutionAction_connection__block_invoke(uint64_t a1)
{
}

void __116__WFAppIntentExecutionAction_loadDynamicResultForEnumeration_searchTerm_optionsProviderReference_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  if (!v18)
  {
    uint64_t v6 = *(void *)(a1 + 64);
    BOOL v7 = [*(id *)(a1 + 32) localizedErrorWithLinkError:v5];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
  uint64_t v8 = [*(id *)(a1 + 32) connection];
  id v9 = [*(id *)(a1 + 32) metadata];
  id v10 = *(id *)(a1 + 40);
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v11 = v10;
    }
    else {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }
  id v12 = v11;

  __int16 v13 = [v12 parameterMetadata];
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 56);
  char v16 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v17 = [v16 localeIdentifier];
  [v8 fetchOptionsForAction:v18 actionMetadata:v9 parameterMetadata:v13 optionsProviderReference:v14 searchTerm:v15 localeIdentifier:v17 completionHandler:*(void *)(a1 + 64)];
}

void __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E6555FA0;
  id v8 = v6;
  id v21 = v8;
  id v9 = _Block_copy(aBlock);
  id v10 = [v8 options];

  if (v10)
  {
    char v11 = [v8 options];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke_348;
    v18[3] = &unk_1E6555FC8;
    id v12 = *(void **)(a1 + 40);
    v18[4] = *(void *)(a1 + 32);
    id v19 = v12;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke_2_350;
    v15[3] = &unk_1E6555FF0;
    id v16 = v9;
    id v17 = v7;
    objc_msgSend(v11, "if_mapAsynchronously:completionHandler:", v18, v15);
  }
  else
  {
    __int16 v13 = (*((void (**)(void *, void))v9 + 2))(v9, MEMORY[0x1E4F1CBF0]);
    uint64_t v14 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[WFAppIntentExecutionAction completeLoadingPossibleStatesForEnumerationParameter:result:error:completionHan"
            "dler:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_ERROR, "%s Result collection section does not contain any items.", buf, 0xCu);
    }

    (*((void (**)(id, void *, void))v7 + 2))(v7, v13, 0);
  }
}

- (BOOL)populatesInputFromInputParameter
{
  return 0;
}

uint64_t __99__WFAppIntentExecutionAction_getLinkActionForArchivingFallingBackToDefaultValue_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) getLinkActionWithProcessedParameters:a2 forFocusConfiguration:1 fallingBackToDefaultValue:0 completionHandler:*(void *)(a1 + 40)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)getLinkActionWithProcessedParameters:(id)a3 forFocusConfiguration:(BOOL)a4 fallingBackToDefaultValue:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(WFAppIntentExecutionAction *)self metadata];
  __int16 v13 = [v12 parameters];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __133__WFAppIntentExecutionAction_getLinkActionWithProcessedParameters_forFocusConfiguration_fallingBackToDefaultValue_completionHandler___block_invoke;
  v18[3] = &unk_1E6555B90;
  v18[4] = self;
  id v19 = v10;
  BOOL v20 = a5;
  BOOL v21 = a4;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __133__WFAppIntentExecutionAction_getLinkActionWithProcessedParameters_forFocusConfiguration_fallingBackToDefaultValue_completionHandler___block_invoke_5;
  v16[3] = &unk_1E6558040;
  v16[4] = self;
  id v17 = v11;
  id v14 = v11;
  id v15 = v10;
  objc_msgSend(v13, "if_mapAsynchronously:completionHandler:", v18, v16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterIdentifiersNeedingValues, 0);
  objc_storeStrong((id *)&self->_undoContext, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
  objc_storeStrong((id *)&self->_preferredExtensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_linkSystemContext, 0);
  objc_storeStrong((id *)&self->_dependentParameterIdentifiers, 0);
  objc_storeStrong((id *)&self->_fetchingDisplayRepresentationParameterKeys, 0);
  objc_storeStrong((id *)&self->_appIntentDescriptor, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_processingParametersQueue, 0);
  objc_storeStrong((id *)&self->_fullyQualifiedLinkActionIdentifier, 0);
  objc_storeStrong((id *)&self->_actionConfigurationContext, 0);
  objc_storeStrong((id *)&self->_connectionPolicySignals, 0);
  objc_storeStrong((id *)&self->_connectionPolicy, 0);
  objc_storeStrong((id *)&self->_outputDictionary, 0);
}

void __98__WFAppIntentExecutionAction_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a1[5];
  uint64_t v4 = a1[6];
  id v6 = (void *)a1[4];
  id v7 = a3;
  id v8 = [v6 defaultSerializedRepresentationForEnumeration:v5 result:a2];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v8, v7);
}

- (id)defaultSerializedRepresentationForEnumeration:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 value];
    id v10 = [v9 valueType];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v12 = [v8 value];
    __int16 v13 = v12;
    if (isKindOfClass)
    {
      id v14 = [v12 value];

      if (v14)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v15 = v14;
        }
        else {
          id v15 = 0;
        }
      }
      else
      {
        id v15 = 0;
      }
      id v19 = v15;

      BOOL v20 = (void *)MEMORY[0x1E4F1CBF0];
      if (v19) {
        BOOL v20 = v19;
      }
      id v21 = v20;

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __83__WFAppIntentExecutionAction_defaultSerializedRepresentationForEnumeration_result___block_invoke;
      v23[3] = &unk_1E6556158;
      id v24 = v6;
      id v17 = objc_msgSend(v21, "if_map:", v23);
    }
    else
    {
      objc_msgSend(v8, "setContainsSensitiveContent:", -[WFAppIntentExecutionAction valueShouldStripSensitiveContent:](self, "valueShouldStripSensitiveContent:", v12));

      id v17 = objc_msgSend((id)objc_msgSend(v6, "singleStateClass"), "serializedRepresentationFromValue:", v8);
    }
  }
  else
  {
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v16 = v6;
      }
      else {
        id v16 = 0;
      }
    }
    else
    {
      id v16 = 0;
    }
    id v18 = v16;
    id v17 = [v18 serializedDefaultParameterOption];

    if (v17)
    {
      id v17 = [v18 serializedDefaultParameterOption];
    }
  }
  return v17;
}

uint64_t __92__WFAppIntentExecutionAction_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) completeLoadingPossibleStatesForEnumerationParameter:*(void *)(a1 + 40) result:a2 error:a3 completionHandler:*(void *)(a1 + 48)];
}

- (void)completeLoadingPossibleStatesForEnumerationParameter:(id)a3 result:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  __int16 v13 = (void (**)(id, void, void *))a6;
  if (!v11)
  {
    id v24 = [(WFAction *)self localizedErrorWithLinkError:v12];
    v13[2](v13, 0, v24);
LABEL_10:

    goto LABEL_11;
  }
  id v14 = [v11 dependentParameterIdentifiers];
  id v15 = [(WFAppIntentExecutionAction *)self dependentParameterIdentifiers];
  id v16 = [v10 key];
  [v15 setObject:v14 forKeyedSubscript:v16];

  id v17 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v10 key];
    *(_DWORD *)buf = 136315650;
    uint64_t v34 = "-[WFAppIntentExecutionAction completeLoadingPossibleStatesForEnumerationParameter:result:error:completionHandler:]";
    __int16 v35 = 2112;
    v36 = v18;
    __int16 v37 = 2112;
    id v38 = v11;
    _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_DEFAULT, "%s Completing loading possible states for parameter: %@ with result: %@.", buf, 0x20u);
  }
  char v19 = [v11 usesIndexedCollation];
  BOOL v20 = [v11 promptLabel];
  id v21 = [v20 localizedStringForLocaleIdentifier:0];
  [v10 setLocalizedPrompt:v21];

  char v22 = [v11 sections];

  if (!v22)
  {
    dispatch_queue_t v25 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v34 = "-[WFAppIntentExecutionAction completeLoadingPossibleStatesForEnumerationParameter:result:error:completionHandler:]";
      _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_ERROR, "%s Result collection does not contain any sections.", buf, 0xCu);
    }

    id v26 = objc_alloc(MEMORY[0x1E4F30570]);
    id v24 = (void *)[v26 initWithItems:MEMORY[0x1E4F1CBF0]];
    ((void (**)(id, void *, void *))v13)[2](v13, v24, 0);
    goto LABEL_10;
  }
  id v23 = [v11 sections];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke;
  v31[3] = &unk_1E6556018;
  v31[4] = self;
  id v32 = v10;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke_3;
  v27[3] = &unk_1E6556040;
  char v30 = v19;
  id v28 = v32;
  id v29 = v13;
  objc_msgSend(v23, "if_mapAsynchronously:completionHandler:", v31, v27);

LABEL_11:
}

- (NSMutableDictionary)dependentParameterIdentifiers
{
  return self->_dependentParameterIdentifiers;
}

void __114__WFAppIntentExecutionAction_completeLoadingPossibleStatesForEnumerationParameter_result_error_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F30570];
  id v6 = a3;
  id v7 = a2;
  id v8 = (void *)[[v5 alloc] initWithSections:v7];

  [v8 setUsesIndexedCollation:*(unsigned __int8 *)(a1 + 48)];
  id v9 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [*(id *)(a1 + 32) key];
    int v11 = 136315650;
    id v12 = "-[WFAppIntentExecutionAction completeLoadingPossibleStatesForEnumerationParameter:result:error:completionHandl"
          "er:]_block_invoke_3";
    __int16 v13 = 2112;
    id v14 = v10;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s Completed loading possible states for parameter: %@ with result: %@.", (uint8_t *)&v11, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)setParameterIdentifiersNeedingValues:(id)a3
{
}

- (void)setUndoContext:(id)a3
{
}

- (LNUndoContext)undoContext
{
  return self->_undoContext;
}

- (void)setAttribution:(id)a3
{
}

- (LNAttribution)attribution
{
  return self->_attribution;
}

- (void)setDidRunOpensIntent:(BOOL)a3
{
  self->_didRunOpensIntent = a3;
}

- (BOOL)didRunOpensIntent
{
  return self->_didRunOpensIntent;
}

- (void)setAuthenticationPolicy:(int64_t)a3
{
  self->_authenticationPolicy = a3;
}

- (int64_t)authenticationPolicy
{
  return self->_authenticationPolicy;
}

- (void)setPreferredExtensionBundleIdentifier:(id)a3
{
}

- (void)setLinkSystemContext:(id)a3
{
}

- (LNSystemContext)linkSystemContext
{
  return self->_linkSystemContext;
}

- (void)setFetchingDisplayRepresentationParameterKeys:(id)a3
{
}

- (NSSet)fetchingDisplayRepresentationParameterKeys
{
  return self->_fetchingDisplayRepresentationParameterKeys;
}

- (INAppIntentDescriptor)appIntentDescriptor
{
  return self->_appIntentDescriptor;
}

id __83__WFAppIntentExecutionAction_defaultSerializedRepresentationForEnumeration_result___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = (void *)[v2 singleStateClass];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F72C08]) initWithValue:v3 indentationLevel:0];

  id v6 = [v4 serializedRepresentationFromValue:v5];

  return v6;
}

- (id)defaultSerializedRepresentationForEnumeration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 key];
  id v6 = [(WFAppIntentExecutionAction *)self parameterMetadataForIdentifier:v5];

  id v7 = [v6 valueType];
  id v8 = objc_msgSend(v7, "wf_parameterDefinitionWithParameterMetadata:", v6);
  id v9 = [v6 typeSpecificMetadata];
  id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F72A00]];
  int v11 = [v8 linkValueWithValue:v10];

  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F72C08]) initWithValue:v11 indentationLevel:0];
  __int16 v13 = [(WFAppIntentExecutionAction *)self defaultSerializedRepresentationForEnumeration:v4 result:v12];

  return v13;
}

void __63__WFAppIntentExecutionAction_valueShouldStripSensitiveContent___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 value];
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

  char v9 = [v8 isTransient];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v9 ^ 1;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (BOOL)enumeration:(id)a3 shouldStripSenstitiveContentFromValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = [v7 value];
    BOOL v9 = [(WFAppIntentExecutionAction *)self valueShouldStripSensitiveContent:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)enumerationShouldAlwaysReloadPossibleStates:(id)a3
{
  return 1;
}

void __73__WFAppIntentExecutionAction_enumeration_localizedLabelForPossibleState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = getWFActionsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 allKeys];
    *(_DWORD *)buf = 136315650;
    __int16 v15 = "-[WFAppIntentExecutionAction enumeration:localizedLabelForPossibleState:]_block_invoke";
    __int16 v16 = 2114;
    uint64_t v17 = v8;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Fetched missing display representations for parameters: %{public}@, error: %@", buf, 0x20u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__WFAppIntentExecutionAction_enumeration_localizedLabelForPossibleState___block_invoke_352;
  v11[3] = &unk_1E6558938;
  uint64_t v9 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v9;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

uint64_t __73__WFAppIntentExecutionAction_enumeration_localizedLabelForPossibleState___block_invoke_352(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__WFAppIntentExecutionAction_enumeration_localizedLabelForPossibleState___block_invoke_2;
  v3[3] = &unk_1E6556068;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

void __73__WFAppIntentExecutionAction_enumeration_localizedLabelForPossibleState___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = 0;
  }
  else {
    id v6 = v7;
  }
  [*(id *)(a1 + 32) setParameterState:v6 forKey:v5];
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 optionsProviderReference:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __117__WFAppIntentExecutionAction_loadPossibleStatesForEnumeration_searchTerm_optionsProviderReference_completionHandler___block_invoke;
  v16[3] = &unk_1E6555F50;
  id v17 = v10;
  id v18 = v11;
  id v19 = self;
  id v20 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(WFAppIntentExecutionAction *)self loadDynamicResultForEnumeration:v15 searchTerm:v14 optionsProviderReference:a5 completionHandler:v16];
}

void __117__WFAppIntentExecutionAction_loadPossibleStatesForEnumeration_searchTerm_optionsProviderReference_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) key];
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 136315650;
    id v11 = "-[WFAppIntentExecutionAction loadPossibleStatesForEnumeration:searchTerm:optionsProviderReference:completionHa"
          "ndler:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v8;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Loading possible states for parameter: %@, search term: %@.", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(a1 + 48) completeLoadingPossibleStatesForEnumerationParameter:*(void *)(a1 + 32) result:v6 error:v5 completionHandler:*(void *)(a1 + 56)];
}

- (void)fetchMissingDisplayRepresentationValuesWithCompletionHandler:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WFAppIntentExecutionAction *)self parametersNeedingDisplayRepresentation];
  if ([v5 count])
  {
    v42 = v4;
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    id v7 = [v5 valueForKey:@"name"];
    id v8 = [v6 setWithArray:v7];
    [(WFAppIntentExecutionAction *)self setFetchingDisplayRepresentationParameterKeys:v8];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v54 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obj = v5;
    uint64_t v46 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
    if (v46)
    {
      uint64_t v44 = *(void *)v69;
      v45 = v5;
      unint64_t v10 = 0x1E4F1C000uLL;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v69 != v44) {
            objc_enumerationMutation(obj);
          }
          __int16 v12 = *(void **)(*((void *)&v68 + 1) + 8 * v11);
          id v13 = [v12 typeSpecificMetadata];
          v51 = [v13 objectForKey:@"LNValueTypeSpecificMetadataKeyLinkEntityMetadata"];

          v50 = v12;
          __int16 v14 = [v12 name];
          uint64_t v15 = [(WFAction *)self parameterStateForKey:v14 fallingBackToDefaultValue:0];

          objc_opt_class();
          v47 = v15;
          uint64_t v48 = v11;
          if (objc_opt_isKindOfClass())
          {
            uint64_t v16 = [v15 parameterStates];
            id v17 = objc_msgSend(v16, "if_compactMap:", &__block_literal_global_324);
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v75 = v15;
              id v17 = [*(id *)(v10 + 2424) arrayWithObjects:&v75 count:1];
            }
            else
            {
              id v17 = 0;
            }
          }
          long long v66 = 0u;
          long long v67 = 0u;
          long long v65 = 0u;
          long long v64 = 0u;
          id v49 = v17;
          uint64_t v53 = [v49 countByEnumeratingWithState:&v64 objects:v74 count:16];
          if (v53)
          {
            uint64_t v52 = *(void *)v65;
            do
            {
              for (uint64_t i = 0; i != v53; ++i)
              {
                if (*(void *)v65 != v52) {
                  objc_enumerationMutation(v49);
                }
                id v19 = [*(id *)(*((void *)&v64 + 1) + 8 * i) value];
                id v20 = [v19 value];
                id v21 = WFSerializedIdentifierFromLinkValue(v20);

                if (v21)
                {
                  id v22 = objc_alloc(MEMORY[0x1E4F72C30]);
                  id v23 = [v51 identifier];
                  id v24 = (void *)[v22 initWithTypeIdentifier:v23 instanceIdentifier:v21];

                  dispatch_queue_t v25 = self;
                  id v26 = [(WFAppIntentExecutionAction *)self connection];
                  id v27 = [v26 bundleIdentifier];
                  id v28 = [v51 mangledTypeNameForBundleIdentifier:v27];

                  id v29 = [v9 objectForKey:v28];
                  if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    char v30 = (void *)[v29 mutableCopy];
                    [v30 addObject:v24];
                    v31 = (void *)[v30 copy];

                    unint64_t v10 = 0x1E4F1C000;
                  }
                  else
                  {

                    v73 = v24;
                    v31 = [*(id *)(v10 + 2424) arrayWithObjects:&v73 count:1];
                  }
                  id v32 = v9;
                  [v9 setObject:v31 forKey:v28];
                  v33 = [v54 objectForKey:v24];
                  if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                  {
                    uint64_t v34 = (void *)[v33 mutableCopy];
                    __int16 v35 = [v50 name];
                    [v34 addObject:v35];

                    v36 = (void *)[v34 copy];
                  }
                  else
                  {

                    uint64_t v34 = [v50 name];
                    v72 = v34;
                    v36 = [*(id *)(v10 + 2424) arrayWithObjects:&v72 count:1];
                  }

                  [v54 setObject:v36 forKey:v24];
                  self = v25;
                  id v9 = v32;
                  unint64_t v10 = 0x1E4F1C000;
                }
              }
              uint64_t v53 = [v49 countByEnumeratingWithState:&v64 objects:v74 count:16];
            }
            while (v53);
          }

          uint64_t v11 = v48 + 1;
          id v5 = v45;
        }
        while (v48 + 1 != v46);
        uint64_t v46 = [obj countByEnumeratingWithState:&v68 objects:v76 count:16];
      }
      while (v46);
    }

    __int16 v37 = objc_opt_new();
    id v38 = [v9 allKeys];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_2;
    v59[3] = &unk_1E6555F00;
    id v60 = v9;
    v61 = self;
    id v62 = v54;
    id v63 = v37;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_3_341;
    v55[3] = &unk_1E6557D00;
    v57 = self;
    id v58 = v42;
    id v56 = v63;
    id v39 = v9;
    id v40 = v54;
    id v41 = v63;
    objc_msgSend(v38, "if_enumerateAsynchronouslyInSequence:completionHandler:", v59, v55);

    id v4 = v42;
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, MEMORY[0x1E4F1CC08], 0);
  }
}

void __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_2(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [a1[4] objectForKey:v6];
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
  id v10 = v9;

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F72D50]) initWithIdentifiers:v10 entityMangledTypeName:v6];
  __int16 v12 = [a1[5] connection];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_3;
  v18[3] = &unk_1E6555ED8;
  id v19 = v10;
  id v20 = v6;
  id v24 = v7;
  id v21 = a1[6];
  id v13 = a1[7];
  id v14 = a1[5];
  id v22 = v13;
  id v23 = v14;
  id v15 = v7;
  id v16 = v6;
  id v17 = v10;
  [v12 performQuery:v11 completionHandler:v18];
}

uint64_t __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_3_341(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = *(void **)(a1 + 40);
  return [v2 setFetchingDisplayRepresentationParameterKeys:0];
}

void __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  long long v70 = v4;
  if (v4 || !v5)
  {
    id v69 = v5;
    if (v4)
    {
      uint64_t v11 = [v4 value];
      __int16 v12 = [v11 value];

      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v13 = v12;
        }
        else {
          id v13 = 0;
        }
      }
      else
      {
        id v13 = 0;
      }
      id v16 = v13;

      id v68 = v16;
      if ([v16 count])
      {
        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        id obj = v16;
        uint64_t v17 = [obj countByEnumeratingWithState:&v88 objects:v96 count:16];
        uint64_t v18 = a1;
        if (v17)
        {
          uint64_t v19 = v17;
          uint64_t v20 = *(void *)v89;
          uint64_t v71 = *(void *)v89;
          do
          {
            uint64_t v21 = 0;
            uint64_t v72 = v19;
            do
            {
              if (*(void *)v89 != v20) {
                objc_enumerationMutation(obj);
              }
              id v22 = *(void **)(*((void *)&v88 + 1) + 8 * v21);
              id v23 = [v22 valueType];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {
                dispatch_queue_t v25 = [v22 value];
                if (v25)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    id v26 = v25;
                  }
                  else {
                    id v26 = 0;
                  }
                }
                else
                {
                  id v26 = 0;
                }
                id v27 = v26;

                id v29 = [v27 identifier];
                if (v29)
                {
                  char v30 = [*(id *)(a1 + 48) objectForKey:v29];
                  v74 = v27;
                  uint64_t v75 = v21;
                  v79 = v22;
                  v76 = v29;
                  if (v30)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      v31 = v30;
                    }
                    else {
                      v31 = 0;
                    }
                  }
                  else
                  {
                    v31 = 0;
                  }
                  id v33 = v31;

                  long long v87 = 0u;
                  long long v85 = 0u;
                  long long v86 = 0u;
                  long long v84 = 0u;
                  uint64_t v34 = v33;
                  uint64_t v35 = [v34 countByEnumeratingWithState:&v84 objects:v95 count:16];
                  uint64_t v18 = a1;
                  if (v35)
                  {
                    uint64_t v36 = v35;
                    uint64_t v37 = *(void *)v85;
                    v78 = v34;
                    do
                    {
                      uint64_t v38 = 0;
                      uint64_t v80 = v36;
                      do
                      {
                        if (*(void *)v85 != v37) {
                          objc_enumerationMutation(v34);
                        }
                        uint64_t v39 = *(void *)(*((void *)&v84 + 1) + 8 * v38);
                        id v40 = [*(id *)(v18 + 64) parameterForKey:v39];
                        id v41 = (objc_class *)[v40 singleStateClass];
                        if ([(objc_class *)v41 isSubclassOfClass:objc_opt_class()])
                        {
                          v42 = [*(id *)(v18 + 56) objectForKeyedSubscript:v39];
                          char v43 = v42;
                          if (v42)
                          {
                            id v44 = v42;
                          }
                          else
                          {
                            id v44 = [*(id *)(v18 + 64) parameterStateForKey:v39];
                          }
                          v45 = v44;

                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v46 = v45;
                            if (v46)
                            {
                              objc_opt_class();
                              if (objc_opt_isKindOfClass()) {
                                v47 = v46;
                              }
                              else {
                                v47 = 0;
                              }
                            }
                            else
                            {
                              v47 = 0;
                            }
                            id v50 = v47;

                            v51 = [v50 value];

                            id v52 = objc_alloc(MEMORY[0x1E4F72C08]);
                            if (v51) {
                              uint64_t v53 = [v51 indentationLevel];
                            }
                            else {
                              uint64_t v53 = 0;
                            }
                            id v54 = (void *)[v52 initWithValue:v79 indentationLevel:v53];
                            v55 = (void *)[[v41 alloc] initWithValue:v54];
                            [*(id *)(v18 + 56) setObject:v55 forKey:v39];

                            goto LABEL_62;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v48 = v45;
                            if (v48)
                            {
                              objc_opt_class();
                              if (objc_opt_isKindOfClass()) {
                                id v49 = v48;
                              }
                              else {
                                id v49 = 0;
                              }
                            }
                            else
                            {
                              id v49 = 0;
                            }
                            id v56 = v49;

                            v57 = [v56 parameterStates];
                            v82[0] = MEMORY[0x1E4F143A8];
                            v82[1] = 3221225472;
                            v82[2] = __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_335;
                            v82[3] = &unk_1E6555E88;
                            id v83 = v76;
                            id v58 = [v57 indexesOfObjectsPassingTest:v82];

                            v59 = [v56 parameterStates];
                            id v60 = [v59 objectsAtIndexes:v58];
                            v81[0] = MEMORY[0x1E4F143A8];
                            v81[1] = 3221225472;
                            v81[2] = __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_2_337;
                            v81[3] = &unk_1E6555EB0;
                            v81[4] = v79;
                            v81[5] = v41;
                            v61 = objc_msgSend(v60, "if_map:", v81);

                            id v62 = [v56 stateByReplacingValueAtIndexes:v58 withValues:v61];

                            [*(id *)(a1 + 56) setObject:v62 forKey:v39];
                            uint64_t v18 = a1;

                            v51 = v83;
LABEL_62:

                            uint64_t v34 = v78;
                          }

                          uint64_t v36 = v80;
                        }

                        ++v38;
                      }
                      while (v36 != v38);
                      uint64_t v36 = [v34 countByEnumeratingWithState:&v84 objects:v95 count:16];
                    }
                    while (v36);
                  }

                  id v32 = v34;
                  uint64_t v20 = v71;
                  uint64_t v19 = v72;
                  id v27 = v74;
                  uint64_t v21 = v75;
                  id v29 = v76;
                }
                else
                {
                  id v32 = getWFActionsLogObject();
                  uint64_t v18 = a1;
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v98 = "-[WFAppIntentExecutionAction fetchMissingDisplayRepresentationValuesWithCompletionHandler:]_block_invoke";
                    __int16 v99 = 2112;
                    v100 = v22;
                    _os_log_impl(&dword_1C7F0A000, v32, OS_LOG_TYPE_ERROR, "%s Unable to get entityIdentifier from value: %@", buf, 0x16u);
                  }
                }
              }
              else
              {
                id v27 = getWFActionsLogObject();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
                {
                  id v28 = [v22 valueType];
                  *(_DWORD *)buf = 136315394;
                  v98 = "-[WFAppIntentExecutionAction fetchMissingDisplayRepresentationValuesWithCompletionHandler:]_block_invoke";
                  __int16 v99 = 2112;
                  v100 = v28;
                  _os_log_impl(&dword_1C7F0A000, v27, OS_LOG_TYPE_FAULT, "%s Fetching display representations returned a value that wasn't an entity: expected LNEntityValueType, got %@", buf, 0x16u);
                }
                uint64_t v18 = a1;
              }

              ++v21;
            }
            while (v21 != v19);
            uint64_t v19 = [obj countByEnumeratingWithState:&v88 objects:v96 count:16];
          }
          while (v19);
        }

        (*(void (**)(void))(*(void *)(v18 + 72) + 16))();
      }
      else
      {
        id v63 = getWFActionsLogObject();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          long long v64 = *(void **)(a1 + 32);
          uint64_t v65 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 136315906;
          v98 = "-[WFAppIntentExecutionAction fetchMissingDisplayRepresentationValuesWithCompletionHandler:]_block_invoke_3";
          __int16 v99 = 2114;
          v100 = v64;
          __int16 v101 = 2112;
          uint64_t v102 = v65;
          __int16 v103 = 2112;
          id v104 = v16;
          _os_log_impl(&dword_1C7F0A000, v63, OS_LOG_TYPE_DEFAULT, "%s Fetching display representations for entity identifiers: %{public}@, mangledTypeName: %@ returned an invalid number of items: %@", buf, 0x2Au);
        }

        uint64_t v66 = *(void *)(a1 + 72);
        long long v67 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFActionErrorDomain" code:5 userInfo:MEMORY[0x1E4F1CC08]];
        (*(void (**)(uint64_t, void *))(v66 + 16))(v66, v67);
      }
      id v15 = v68;
    }
    else
    {
      id v14 = *(void **)(a1 + 32);
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_327;
      v92[3] = &unk_1E6555E60;
      id v93 = *(id *)(a1 + 48);
      id v94 = *(id *)(a1 + 56);
      [v14 enumerateObjectsUsingBlock:v92];
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();

      id v15 = v93;
    }

    id v10 = v69;
    goto LABEL_76;
  }
  id v6 = v5;
  id v7 = getWFActionsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    v98 = "-[WFAppIntentExecutionAction fetchMissingDisplayRepresentationValuesWithCompletionHandler:]_block_invoke_3";
    __int16 v99 = 2114;
    v100 = v8;
    __int16 v101 = 2112;
    uint64_t v102 = v9;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Failed to fetch display representation for entity identifiers: %{public}@, mangledTypeName: %@", buf, 0x20u);
  }

  id v10 = v6;
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
LABEL_76:
}

void __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_327(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKey:a2];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_2_328;
  v6[3] = &unk_1E65591A0;
  id v7 = *(id *)(a1 + 40);
  [v5 enumerateObjectsUsingBlock:v6];
}

uint64_t __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_335(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v4;
    }
    else {
      id v3 = 0;
    }
  }
  id v5 = [v3 value];
  id v6 = [v5 value];
  id v7 = [v6 value];

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

  id v10 = [v9 identifier];

  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = v10;
  id v13 = v11;
  id v14 = v13;
  if (v12 == v13)
  {
    uint64_t v15 = 1;
  }
  else
  {
    uint64_t v15 = 0;
    if (v12 && v13) {
      uint64_t v15 = [v12 isEqual:v13];
    }
  }

  return v15;
}

id __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_2_337(uint64_t a1, void *a2)
{
  id v3 = [a2 value];
  id v4 = objc_alloc(MEMORY[0x1E4F72C08]);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v3) {
    uint64_t v6 = [v3 indentationLevel];
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = (void *)[v4 initWithValue:v5 indentationLevel:v6];
  id v8 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithValue:v7];

  return v8;
}

void __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke_2_328(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)MEMORY[0x1E4F1CA98];
  id v4 = a2;
  id v5 = [v3 null];
  [v2 setObject:v5 forKey:v4];
}

id __91__WFAppIntentExecutionAction_fetchMissingDisplayRepresentationValuesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v2 = v3;
    }
    else {
      id v2 = 0;
    }
  }
  id v4 = v2;

  return v4;
}

- (id)parametersNeedingDisplayRepresentation
{
  id v3 = [(WFAppIntentExecutionAction *)self metadata];
  id v4 = [v3 parameters];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__WFAppIntentExecutionAction_parametersNeedingDisplayRepresentation__block_invoke;
  v7[3] = &unk_1E6555E18;
  v7[4] = self;
  id v5 = objc_msgSend(v4, "if_objectsPassingTest:", v7);

  return v5;
}

uint64_t __68__WFAppIntentExecutionAction_parametersNeedingDisplayRepresentation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) fetchingDisplayRepresentationParameterKeys];
  id v5 = [v3 name];
  char v6 = [v4 containsObject:v5];

  if ((v6 & 1) == 0)
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = [v3 name];
    id v10 = [v8 parameterStateForKey:v9];

    id v11 = v10;
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = 0;
        uint64_t v17 = &v16;
        uint64_t v18 = 0x2020000000;
        char v19 = 0;
        id v12 = [v11 value];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __68__WFAppIntentExecutionAction_parametersNeedingDisplayRepresentation__block_invoke_2;
        v15[3] = &unk_1E6555DF0;
        void v15[4] = &v16;
        [v12 enumerateObjectsUsingBlock:v15];

        uint64_t v7 = *((unsigned char *)v17 + 24) != 0;
        _Block_object_dispose(&v16, 8);

LABEL_9:
        goto LABEL_10;
      }

      id v13 = v11;
    }
    else
    {
      id v13 = 0;
    }
    uint64_t v7 = WFLinkActionParameterStateNeedingDisplayRepresentation(v13);
    goto LABEL_9;
  }
  uint64_t v7 = 0;
LABEL_10:

  return v7;
}

void __68__WFAppIntentExecutionAction_parametersNeedingDisplayRepresentation__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  char v6 = [a2 parameterState];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = WFLinkActionParameterStateNeedingDisplayRepresentation(v6);

  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (id)alertForLinkConfirmationDialogRequest:(id)a3 preferredStyle:(int64_t)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = (void *)MEMORY[0x1E4F5A768];
  id v9 = a3;
  id v10 = [v8 alertWithPreferredStyle:a4];
  id v11 = [v9 title];
  [v10 setTitle:v11];

  id v12 = (void *)MEMORY[0x1E4F5A770];
  id v13 = [v9 yesButton];
  id v14 = [v13 title];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __91__WFAppIntentExecutionAction_alertForLinkConfirmationDialogRequest_preferredStyle_handler___block_invoke;
  v28[3] = &unk_1E6558678;
  id v15 = v7;
  id v29 = v15;
  uint64_t v16 = [v12 buttonWithTitle:v14 style:0 handler:v28];

  uint64_t v17 = (void *)MEMORY[0x1E4F5A770];
  uint64_t v18 = [v9 noButton];

  char v19 = [v18 title];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  dispatch_queue_t v25 = __91__WFAppIntentExecutionAction_alertForLinkConfirmationDialogRequest_preferredStyle_handler___block_invoke_2;
  id v26 = &unk_1E6558678;
  id v27 = v15;
  id v20 = v15;
  uint64_t v21 = [v17 buttonWithTitle:v19 style:1 handler:&v23];

  objc_msgSend(v10, "addButton:", v16, v23, v24, v25, v26);
  [v10 addButton:v21];

  return v10;
}

uint64_t __91__WFAppIntentExecutionAction_alertForLinkConfirmationDialogRequest_preferredStyle_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __91__WFAppIntentExecutionAction_alertForLinkConfirmationDialogRequest_preferredStyle_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)alertForLinkActionConfirmationWithParameterMetadata:(id)a3 dialogString:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __121__WFAppIntentExecutionAction_alertForLinkActionConfirmationWithParameterMetadata_dialogString_request_completionHandler___block_invoke;
  block[3] = &unk_1E6555DC8;
  id v19 = v12;
  id v20 = self;
  id v21 = v10;
  id v22 = v11;
  id v23 = v13;
  id v14 = v13;
  id v15 = v11;
  id v16 = v10;
  id v17 = v12;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __121__WFAppIntentExecutionAction_alertForLinkActionConfirmationWithParameterMetadata_dialogString_request_completionHandler___block_invoke(id *a1)
{
  id v2 = [a1[4] value];
  id v3 = [v2 valueType];
  id v4 = [a1[4] value];
  id v5 = [a1[5] fullyQualifiedLinkActionIdentifier];
  char v6 = [v5 bundleIdentifier];
  id v7 = [a1[5] displayableAppBundleIdentifier];
  id v8 = objc_msgSend(v3, "wf_contentItemFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:", v4, v6, v7, 0);

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __121__WFAppIntentExecutionAction_alertForLinkActionConfirmationWithParameterMetadata_dialogString_request_completionHandler___block_invoke_2;
  v11[3] = &unk_1E6555DA0;
  id v12 = a1[6];
  id v13 = a1[7];
  int8x16_t v10 = *((int8x16_t *)a1 + 2);
  id v9 = (id)v10.i64[0];
  int8x16_t v14 = vextq_s8(v10, v10, 8uLL);
  id v15 = a1[8];
  [v8 encodedTypedValueWithCompletion:v11];
}

void __121__WFAppIntentExecutionAction_alertForLinkActionConfirmationWithParameterMetadata_dialogString_request_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4FB4828];
  id v4 = a2;
  id v5 = [v3 alloc];
  char v6 = [*(id *)(a1 + 32) name];
  id v7 = (void *)[v5 initWithParameterKey:v6 parameterValue:v4];

  id v8 = objc_alloc(MEMORY[0x1E4FB47C0]);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB46C0]) initWithTitle:0 icon:0];
  id v12 = (void *)[v8 initWithActionParameterMetadata:v9 dialogString:v10 viewSnippet:0 attribution:v11 parameterInfo:v7];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __121__WFAppIntentExecutionAction_alertForLinkActionConfirmationWithParameterMetadata_dialogString_request_completionHandler___block_invoke_3;
  v15[3] = &unk_1E6555D78;
  id v13 = *(void **)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  int8x16_t v14 = [v13 alertForLinkConfirmationDialogRequest:v12 preferredStyle:0 handler:v15];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

uint64_t __121__WFAppIntentExecutionAction_alertForLinkActionConfirmationWithParameterMetadata_dialogString_request_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithConfirmation:a2];
}

- (id)alertForLinkActionConfirmationWithActionMetadata:(id)a3 dialogString:(id)a4 request:(id)a5
{
  id v7 = a5;
  id v8 = (void *)MEMORY[0x1E4F1CA20];
  id v29 = a4;
  id v9 = a3;
  uint64_t v10 = [v8 currentLocale];
  uint64_t v11 = [v10 localeIdentifier];

  id v12 = [v7 result];
  id v13 = [v12 output];
  int8x16_t v14 = [v13 confirmationActionName];

  id v15 = objc_alloc(MEMORY[0x1E4FB47C0]);
  id v28 = [v7 result];
  id v16 = [v28 output];
  uint64_t v17 = [v16 shouldShowPrompt];
  v31 = v14;
  uint64_t v18 = [v14 acceptLabel];
  char v30 = (void *)v11;
  id v19 = [v18 localizedStringForLocaleIdentifier:v11];
  id v20 = [v14 denyLabel];
  id v21 = [v20 localizedStringForLocaleIdentifier:v11];
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4FB46C0]) initWithTitle:0 icon:0];
  LOBYTE(v27) = 0;
  id v23 = (void *)[v15 initWithActionMetadata:v9 showPrompt:v17 dialogString:v29 viewSnippet:0 yesText:v19 noText:v21 attribution:v22 parameterInfo:0 isContinueInAppRequest:v27 systemStyle:0];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __100__WFAppIntentExecutionAction_alertForLinkActionConfirmationWithActionMetadata_dialogString_request___block_invoke;
  v33[3] = &unk_1E6555D78;
  id v34 = v7;
  id v24 = v7;
  dispatch_queue_t v25 = [(WFAppIntentExecutionAction *)self alertForLinkConfirmationDialogRequest:v23 preferredStyle:0 handler:v33];

  return v25;
}

uint64_t __100__WFAppIntentExecutionAction_alertForLinkActionConfirmationWithActionMetadata_dialogString_request___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithConfirmation:a2];
}

- (BOOL)shouldLocalizeValueForSelector:(SEL)a3
{
  return 0;
}

- (void)confirmContinueInAppWithRequest:(id)a3 dialogString:(id)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F1CB10];
  id v8 = a4;
  id v9 = [v7 fileURLWithPath:@"/System/Library/Frameworks/AppIntents.framework"];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F72DA0]) initWithKey:@"Continue" table:0 bundleURL:v9];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F72DA0]) initWithKey:@"Cancel" table:0 bundleURL:v9];
  id v12 = objc_alloc(MEMORY[0x1E4F72BA0]);
  id v13 = (void *)[v12 initWithType:0 destructive:0 acceptLabel:v10 acceptAlternatives:MEMORY[0x1E4F1CBF0] denyLabel:v11 denyAlternatives:MEMORY[0x1E4F1CBF0]];
  int8x16_t v14 = [(WFAction *)self userInterface];
  id v15 = [(WFAppIntentExecutionAction *)self metadata];
  id v16 = [v6 dialog];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__WFAppIntentExecutionAction_confirmContinueInAppWithRequest_dialogString___block_invoke;
  v19[3] = &unk_1E6555C88;
  id v20 = v6;
  id v17 = v6;
  LOBYTE(v18) = 1;
  [v14 showLinkActionConfirmationWithActionMetadata:v15 showPrompt:1 dialog:v16 dialogString:v8 viewSnippet:0 confirmationActionName:v13 isContinueInAppRequest:v18 systemStyle:0 completionHandler:v19];
}

void __75__WFAppIntentExecutionAction_confirmContinueInAppWithRequest_dialogString___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2 || a2 == 2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [MEMORY[0x1E4F28C58] userCancelledError];
    [v3 respondWithError:v4];
  }
  else if (a2 == 1)
  {
    id v2 = *(void **)(a1 + 32);
    [v2 respondWithSuccess];
  }
}

- (BOOL)progressIsPersistentInSystemApertureForExecutor:(id)a3
{
  id v4 = [(WFAction *)self userInterface];

  if (!v4) {
    return 0;
  }
  id v5 = [(WFAction *)self userInterface];
  char v6 = [v5 progressIsPersistentInSystemAperture];

  return v6;
}

- (void)executorWillLaunchApplicationInForeground:(id)a3
{
  id v4 = [(WFAction *)self userInterface];

  if (v4)
  {
    id v5 = [(WFAction *)self userInterface];
    [v5 applicationWillLaunchInForeground];
  }
}

- (void)executor:(id)a3 needsContinueInAppWithRequest:(id)a4
{
  id v5 = a4;
  char v6 = [v5 dialog];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__WFAppIntentExecutionAction_executor_needsContinueInAppWithRequest___block_invoke;
  v8[3] = &unk_1E6555D50;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 getResultWithCompletionHandler:v8];
}

void __69__WFAppIntentExecutionAction_executor_needsContinueInAppWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = [a2 captionPrint];
  id v4 = [v5 firstObject];
  [v2 confirmContinueInAppWithRequest:v3 dialogString:v4];
}

- (void)executor:(id)a3 needsAppProtectionUnlockWithCompletionHandler:(id)a4
{
}

- (void)executor:(id)a3 preferredContentSizeForViewSnippetWithCompletion:(id)a4
{
  id v8 = (void (**)(id, void))a4;
  id v5 = [(WFAction *)self userInterface];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WFAction *)self userInterface];
    [v7 getPreferredSizeForLinkViewSnippetWithCompletion:v8];
  }
  else
  {
    v8[2](v8, 0);
  }
}

- (void)executor:(id)a3 environmentForViewSnippetWithCompletion:(id)a4
{
  id v8 = (void (**)(id, void))a4;
  id v5 = [(WFAction *)self userInterface];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(WFAction *)self userInterface];
    [v7 getEnvironmentForLinkViewSnippetWithCompletion:v8];
  }
  else
  {
    v8[2](v8, 0);
  }
}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
  id v5 = a4;
  char v6 = [v5 result];
  id v7 = [v6 output];
  id v8 = [v7 dialog];

  if (v8)
  {
    id v9 = [v5 result];
    uint64_t v10 = [v9 output];
    uint64_t v11 = [v10 dialog];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__WFAppIntentExecutionAction_executor_needsActionConfirmationWithRequest___block_invoke;
    v12[3] = &unk_1E6555D50;
    v12[4] = self;
    id v13 = v5;
    [v11 getResultWithCompletionHandler:v12];
  }
  else
  {
    [(WFAppIntentExecutionAction *)self confirmActionWithRequest:v5 dialogString:0];
  }
}

void __74__WFAppIntentExecutionAction_executor_needsActionConfirmationWithRequest___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = [a2 captionPrint];
  id v4 = [v5 firstObject];
  [v2 confirmActionWithRequest:v3 dialogString:v4];
}

- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4
{
  return 0;
}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [MEMORY[0x1E4F1CA00] raise:@"Subclass must override" format:@"Subclasses must override executor:needsDisambiguationWithRequest:"];
  __break(1u);
}

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [MEMORY[0x1E4F1CA00] raise:@"Subclass must override" format:@"Subclasses must override executor:needsConfirmationWithRequest:"];
  __break(1u);
}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [MEMORY[0x1E4F1CA00] raise:@"Subclass must override" format:@"Subclasses must override executor:needsValueWithRequest:"];
  __break(1u);
}

- (void)confirmActionWithRequest:(id)a3 dialogString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WFAppIntentExecutionAction *)self actionIsExecutedFromAnotherDevice])
  {
    id v8 = [(WFAppIntentExecutionAction *)self metadata];
    id v9 = [(WFAppIntentExecutionAction *)self alertForLinkActionConfirmationWithActionMetadata:v8 dialogString:v7 request:v6];

    uint64_t v10 = [v6 result];
    uint64_t v11 = [v10 output];
    id v12 = [v11 dialog];
    [v9 setLinkDialog:v12];

    id v13 = [(WFAction *)self userInterface];
    [v13 presentAlert:v9];
  }
  else
  {
    int8x16_t v14 = [(WFAction *)self userInterface];
    id v15 = [(WFAppIntentExecutionAction *)self metadata];
    id v29 = [v6 result];
    id v28 = [v29 output];
    unsigned int v23 = [v28 shouldShowPrompt];
    uint64_t v27 = [v6 result];
    id v26 = [v27 output];
    id v22 = [v26 dialog];
    dispatch_queue_t v25 = [v6 result];
    id v24 = [v25 output];
    id v16 = [v24 viewSnippet];
    id v17 = [v6 result];
    uint64_t v18 = [v17 output];
    id v19 = [v18 confirmationActionName];
    id v20 = [v6 systemStyle];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __68__WFAppIntentExecutionAction_confirmActionWithRequest_dialogString___block_invoke;
    v30[3] = &unk_1E6555C88;
    id v31 = v6;
    LOBYTE(v21) = 0;
    [v14 showLinkActionConfirmationWithActionMetadata:v15 showPrompt:v23 dialog:v22 dialogString:v7 viewSnippet:v16 confirmationActionName:v19 isContinueInAppRequest:v21 systemStyle:v20 completionHandler:v30];
  }
}

void __68__WFAppIntentExecutionAction_confirmActionWithRequest_dialogString___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v2 = *(void **)(a1 + 32);
      uint64_t v3 = 0;
    }
    else
    {
      if (a2 != 1) {
        return;
      }
      id v2 = *(void **)(a1 + 32);
      uint64_t v3 = 1;
    }
    [v2 respondWithConfirmation:v3];
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [MEMORY[0x1E4F28C58] userCancelledError];
    [v4 respondWithError:v5];
  }
}

- (void)disambiguateParameterForParameterName:(id)a3 request:(id)a4 dialogString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = v8;
  }
  else
  {
    id v11 = [v9 parameterName];
  }
  id v12 = v11;
  id v13 = [(WFAppIntentExecutionAction *)self parameterMetadataForIdentifier:v11];
  if (v13)
  {
    int8x16_t v14 = [MEMORY[0x1E4F5A768] alertWithPreferredStyle:1];
    if ([v10 length])
    {
      [v14 setTitle:v10];
    }
    else
    {
      id v16 = [(WFAction *)self localizedDefaultDisambiguationPrompt];
      [v14 setTitle:v16];
    }
    id v17 = [v9 providedValues];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __89__WFAppIntentExecutionAction_disambiguateParameterForParameterName_request_dialogString___block_invoke;
    v35[3] = &unk_1E6555D00;
    id v36 = v13;
    uint64_t v37 = self;
    uint64_t v18 = objc_msgSend(v17, "if_compactMap:", v35);

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __89__WFAppIntentExecutionAction_disambiguateParameterForParameterName_request_dialogString___block_invoke_2;
    v32[3] = &unk_1E6555D28;
    id v33 = v14;
    id v19 = v9;
    id v34 = v19;
    id v20 = v14;
    [v18 enumerateObjectsUsingBlock:v32];
    uint64_t v21 = (void *)MEMORY[0x1E4F5A770];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    id v29 = __89__WFAppIntentExecutionAction_disambiguateParameterForParameterName_request_dialogString___block_invoke_4;
    char v30 = &unk_1E6558B28;
    id v22 = v19;
    id v31 = v22;
    unsigned int v23 = [v21 cancelButtonWithHandler:&v27];
    objc_msgSend(v20, "addButton:", v23, v27, v28, v29, v30);

    id v24 = (void *)[v12 copy];
    [v20 setAssociatedParameterKey:v24];

    dispatch_queue_t v25 = [v22 dialog];
    [v20 setLinkDialog:v25];

    id v26 = [(WFAction *)self userInterface];
    [v26 presentAlert:v20];
  }
  else
  {
    id v15 = WFLinkActionInvalidMetadataError();
    [(WFAppIntentExecutionAction *)self finishRunningWithError:v15];
  }
}

id __89__WFAppIntentExecutionAction_disambiguateParameterForParameterName_request_dialogString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 valueType];
  id v5 = objc_msgSend(v4, "wf_parameterDefinitionWithParameterMetadata:", *(void *)(a1 + 32));

  id v6 = [v5 valueType];
  id v7 = [*(id *)(a1 + 40) fullyQualifiedLinkActionIdentifier];
  id v8 = [v7 bundleIdentifier];
  id v9 = [*(id *)(a1 + 40) displayableAppBundleIdentifier];
  id v10 = objc_msgSend(v6, "wf_contentItemFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:", v3, v8, v9, 0);

  return v10;
}

void __89__WFAppIntentExecutionAction_disambiguateParameterForParameterName_request_dialogString___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x1E4F5A818];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __89__WFAppIntentExecutionAction_disambiguateParameterForParameterName_request_dialogString___block_invoke_3;
  id v11 = &unk_1E6557050;
  id v6 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = a3;
  id v7 = [v5 buttonWithContentItem:a2 selected:0 stickySelection:0 handler:&v8];
  objc_msgSend(v6, "addButton:", v7, v8, v9, v10, v11);
}

void __89__WFAppIntentExecutionAction_disambiguateParameterForParameterName_request_dialogString___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] userCancelledError];
  [v1 respondWithError:v2];
}

uint64_t __89__WFAppIntentExecutionAction_disambiguateParameterForParameterName_request_dialogString___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondWithSelectedIndex:*(void *)(a1 + 40)];
}

- (void)askForParameterValueForParameterName:(id)a3 request:(id)a4 dialogString:(id)a5
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = v8;
  }
  else
  {
    id v11 = [v9 parameterName];
  }
  id v12 = v11;
  uint64_t v13 = [(WFAppIntentExecutionAction *)self parameterMetadataForIdentifier:v11];
  if (v13)
  {
    int8x16_t v14 = [(WFAction *)self parameterForKey:v12];
    id v15 = [(WFAction *)self runningDelegate];
    char v16 = [v15 action:self canProvideInputForParameter:v14];

    if (v16)
    {
      id v17 = [v14 key];
      uint64_t v18 = [(WFAction *)self parameterStateForKey:v17];

      id v19 = [(WFAction *)self processedParameters];
      id v20 = (void *)[v19 mutableCopy];

      uint64_t v21 = [v14 key];
      [v20 setObject:0 forKeyedSubscript:v21];

      [(WFAction *)self setProcessedParameters:v20];
      uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithObject:v14];
      if (v18)
      {
        id v29 = [v14 key];
        v42 = v29;
        v43[0] = v18;
        id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
      }
      else
      {
        id v34 = (void *)MEMORY[0x1E4F1CC08];
      }
      id v36 = (void *)v18;
      id v33 = [v14 key];
      id v40 = v33;
      unsigned int v23 = [WFParameterPrompt alloc];
      uint64_t v24 = (uint64_t)v10;
      id v32 = v10;
      if (!v10)
      {
        uint64_t v24 = [v14 localizedPrompt];
      }
      [v9 dialog];
      v31 = char v30 = (void *)v24;
      dispatch_queue_t v25 = [(WFParameterPrompt *)v23 initWithPrompt:v24 linkDialog:v31];
      id v41 = v25;
      id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      uint64_t v27 = [(WFAction *)self input];
      uint64_t v28 = dispatch_get_global_queue(0, 0);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __88__WFAppIntentExecutionAction_askForParameterValueForParameterName_request_dialogString___block_invoke;
      v37[3] = &unk_1E6555CD8;
      v37[4] = self;
      id v38 = v13;
      id v39 = v9;
      [(WFAction *)self askForValuesOfParameters:v35 withDefaultStates:v34 prompts:v26 input:v27 workQueue:v28 completionHandler:v37];

      id v10 = v32;
      if (!v32) {

      }
      if (v36)
      {
      }
    }
    else
    {
      id v22 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
      [(WFAppIntentExecutionAction *)self finishRunningWithError:v22];
    }
  }
  else
  {
    int8x16_t v14 = WFLinkActionInvalidMetadataError();
    [(WFAppIntentExecutionAction *)self finishRunningWithError:v14];
  }
}

void __88__WFAppIntentExecutionAction_askForParameterValueForParameterName_request_dialogString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  if (a4)
  {
    [v7 finishRunningWithError:a4];
  }
  else
  {
    id v8 = [v7 processedParameters];
    id v9 = objc_msgSend(v8, "if_dictionaryByAddingEntriesFromDictionary:", v6);
    [*(id *)(a1 + 32) setProcessedParameters:v9];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__WFAppIntentExecutionAction_askForParameterValueForParameterName_request_dialogString___block_invoke_2;
    aBlock[3] = &unk_1E6558910;
    id v10 = *(void **)(a1 + 40);
    void aBlock[4] = *(void *)(a1 + 32);
    id v19 = v10;
    id v20 = v6;
    id v21 = *(id *)(a1 + 48);
    id v11 = (void (**)(void))_Block_copy(aBlock);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = *(void **)(a1 + 32);
      uint64_t v13 = [v12 userInterface];
      int8x16_t v14 = [*(id *)(a1 + 32) runningDelegate];
      id v15 = [v14 contentItemCache];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __88__WFAppIntentExecutionAction_askForParameterValueForParameterName_request_dialogString___block_invoke_4;
      v16[3] = &unk_1E6558AC8;
      void v16[4] = *(void *)(a1 + 32);
      id v17 = v11;
      [v12 performDeletionAuthorizationChecksWithUserInterface:v13 contentItemCache:v15 completionHandler:v16];
    }
    else
    {
      v11[2](v11);
    }
  }
}

void __88__WFAppIntentExecutionAction_askForParameterValueForParameterName_request_dialogString___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __88__WFAppIntentExecutionAction_askForParameterValueForParameterName_request_dialogString___block_invoke_3;
  v4[3] = &unk_1E6555CB0;
  v4[4] = v1;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  [v1 getValueForParameterData:v2 ofProcessedParameters:v3 completionHandler:v4];
}

void __88__WFAppIntentExecutionAction_askForParameterValueForParameterName_request_dialogString___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315394;
      id v6 = "-[WFAppIntentExecutionAction askForParameterValueForParameterName:request:dialogString:]_block_invoke_4";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_INFO, "%s Interrupting WFLinkDeleteEntityAction because of missing deletion authorization: %@", (uint8_t *)&v5, 0x16u);
    }

    [*(id *)(a1 + 32) finishRunningWithError:v3];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __88__WFAppIntentExecutionAction_askForParameterValueForParameterName_request_dialogString___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 40) respondWithValue:a2];
  }
  else {
    return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
  }
}

- (void)confirmParameterValueForParameterName:(id)a3 request:(id)a4 dialogString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = v8;
  }
  else
  {
    id v11 = [v9 parameterName];
  }
  id v12 = v11;
  uint64_t v13 = [(WFAppIntentExecutionAction *)self parameterMetadataForIdentifier:v11];
  if (v13)
  {
    if ([(WFAppIntentExecutionAction *)self actionIsExecutedFromAnotherDevice])
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __89__WFAppIntentExecutionAction_confirmParameterValueForParameterName_request_dialogString___block_invoke;
      v29[3] = &unk_1E6555C60;
      v29[4] = self;
      [(WFAppIntentExecutionAction *)self alertForLinkActionConfirmationWithParameterMetadata:v13 dialogString:v10 request:v9 completionHandler:v29];
    }
    else
    {
      dispatch_queue_t v25 = [v9 value];
      id v15 = [v25 valueType];
      char v16 = [v9 value];
      id v17 = [(WFAppIntentExecutionAction *)self fullyQualifiedLinkActionIdentifier];
      [v17 bundleIdentifier];
      v18 = uint64_t v24 = v12;
      [(WFAppIntentExecutionAction *)self displayableAppBundleIdentifier];
      id v20 = v19 = v10;
      id v26 = objc_msgSend(v15, "wf_contentItemFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:", v16, v18, v20, 0);

      id v10 = v19;
      id v21 = [(WFAction *)self userInterface];
      id v22 = [v9 dialog];
      unsigned int v23 = [v9 viewSnippet];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __89__WFAppIntentExecutionAction_confirmParameterValueForParameterName_request_dialogString___block_invoke_2;
      v27[3] = &unk_1E6555C88;
      id v28 = v9;
      [v21 showLinkParameterConfirmationWithActionMetadata:v13 dialog:v22 dialogString:v19 viewSnippet:v23 parameterValue:v26 completionHandler:v27];

      id v12 = v24;
    }
  }
  else
  {
    int8x16_t v14 = WFLinkActionInvalidMetadataError();
    [(WFAppIntentExecutionAction *)self finishRunningWithError:v14];
  }
}

void __89__WFAppIntentExecutionAction_confirmParameterValueForParameterName_request_dialogString___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 userInterface];
  [v4 presentAlert:v3];
}

void __89__WFAppIntentExecutionAction_confirmParameterValueForParameterName_request_dialogString___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      uint64_t v2 = *(void **)(a1 + 32);
      uint64_t v3 = 0;
    }
    else
    {
      if (a2 != 1) {
        return;
      }
      uint64_t v2 = *(void **)(a1 + 32);
      uint64_t v3 = 1;
    }
    [v2 respondWithConfirmation:v3];
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [MEMORY[0x1E4F28C58] userCancelledError];
    [v4 respondWithError:v5];
  }
}

- (void)getValueForParameterData:(id)a3 ofProcessedParameters:(id)a4 completionHandler:(id)a5
{
}

- (unsigned)runSource
{
  uint64_t v3 = [(WFAction *)self runningDelegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 4;
  }
  id v5 = [(WFAction *)self runningDelegate];
  id v6 = [v5 currentRunningContextForAction:self];

  __int16 v7 = [v6 runSource];
  if (([v7 isEqualToString:*MEMORY[0x1E4FB4F68]] & 1) == 0
    && ([v7 isEqualToString:*MEMORY[0x1E4FB4F08]] & 1) == 0)
  {
    if ([v7 isEqualToString:*MEMORY[0x1E4FB4EF8]])
    {
      unsigned __int16 v8 = 6;
      goto LABEL_5;
    }
    if ([v7 isEqualToString:*MEMORY[0x1E4FB4F60]])
    {
      unsigned __int16 v8 = 8;
      goto LABEL_5;
    }
    char IsSpotlight = WFRunSourceIsSpotlight();

    if (IsSpotlight) {
      return 7;
    }
    return 4;
  }
  unsigned __int16 v8 = 3;
LABEL_5:

  return v8;
}

- (int64_t)runKind
{
  uint64_t v3 = [(WFAction *)self runningDelegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(WFAction *)self runningDelegate];
  id v6 = [v5 currentRunningContextForAction:self];

  __int16 v7 = [v6 runKind];
  if (([v7 isEqualToString:*MEMORY[0x1E4FB4EF0]] & 1) != 0
    || ([v7 isEqualToString:*MEMORY[0x1E4FB4EE8]] & 1) != 0)
  {
    int64_t v8 = 1;
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4FB4ED8]])
  {
    int64_t v8 = 2;
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (LNActionExecutorOptions)executorOptions
{
  uint64_t v3 = objc_opt_new();
  id v4 = objc_alloc(MEMORY[0x1E4F72C78]);
  id v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v6 = [v5 localeIdentifier];
  __int16 v7 = (void *)[v4 initWithLocaleIdentifier:v6];
  [v3 setEnvironment:v7];

  [v3 setClientLabel:@"Shortcuts"];
  objc_msgSend(v3, "setSource:", -[WFAppIntentExecutionAction runSource](self, "runSource"));
  objc_msgSend(v3, "setKind:", -[WFAppIntentExecutionAction runKind](self, "runKind"));
  [v3 setAllowsPrepareBeforePerform:1];
  int64_t v8 = [(WFAction *)self runningDelegate];
  id v9 = [v8 currentRunningContextForAction:self];

  id v10 = [v9 runSource];
  if ([v10 isEqualToString:*MEMORY[0x1E4FB4F50]])
  {
    id v11 = [(WFAppIntentExecutionAction *)self linkSystemContext];

    if (!v11)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F72DC8]);
      [(WFAppIntentExecutionAction *)self setLinkSystemContext:v12];
    }
    uint64_t v13 = [(WFAction *)self toolInvocation];
    int8x16_t v14 = [v13 options];

    id v15 = objc_alloc(MEMORY[0x1E4F72B10]);
    char v16 = [v9 identifier];
    id v17 = [v14 requestIdentifier];
    uint64_t v18 = [v14 locale];
    id v19 = (void *)[v15 initWithSessionIdentifier:v16 requestIdentifier:v17 locale:v18];
    id v20 = [(WFAppIntentExecutionAction *)self linkSystemContext];
    [v20 setAssistantContext:v19];

    objc_msgSend(v3, "setInteractionMode:", objc_msgSend(v14, "lnInteractionMode"));
    id v21 = [v14 lnInterfaceIdiom];
    id v22 = [(WFAppIntentExecutionAction *)self linkSystemContext];
    [v22 setInterfaceIdiom:v21];
  }
  unsigned int v23 = [(WFAppIntentExecutionAction *)self linkSystemContext];

  if (v23)
  {
    uint64_t v24 = [(WFAppIntentExecutionAction *)self linkSystemContext];
    [v3 setSystemContext:v24];
  }
  return (LNActionExecutorOptions *)v3;
}

- (Class)toolkitValueClassForParameter:(id)a3
{
  id v4 = a3;
  id v5 = [v4 key];
  id v6 = [(WFAppIntentExecutionAction *)self parameterMetadataForIdentifier:v5];

  __int16 v7 = [v6 valueType];
  int64_t v8 = objc_msgSend(v7, "wf_parameterDefinitionWithParameterMetadata:", v6);

  id v9 = v8;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [v9 memberParameterDefinition];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      id v12 = v9;
      if (isKindOfClass)
      {
        uint64_t v13 = [v9 memberParameterDefinition];
        int8x16_t v14 = [v13 valueType];
        objc_msgSend(v14, "wf_objectClass");
        id v15 = (id)objc_claimAutoreleasedReturnValue();

        id v12 = v9;
        goto LABEL_14;
      }
    }
    else
    {

      id v12 = 0;
    }
    id v17 = v9;
    objc_opt_class();
    char v18 = objc_opt_isKindOfClass();

    if (v18) {
      goto LABEL_12;
    }
    id v19 = v17;
    objc_opt_class();
    char v20 = objc_opt_isKindOfClass();

    if (v20) {
      goto LABEL_12;
    }
    id v21 = v19;
    objc_opt_class();
    char v22 = objc_opt_isKindOfClass();

    if ((v22 & 1) != 0
      || (v23 = v21, objc_opt_class(), char v24 = objc_opt_isKindOfClass(), v23, (v24 & 1) != 0))
    {
LABEL_12:
      uint64_t v16 = objc_opt_class();
      goto LABEL_13;
    }
    id v26 = v23;
    objc_opt_class();
    char v27 = objc_opt_isKindOfClass();

    if (v27)
    {
      id v28 = v26;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v29 = v28;
      }
      else {
        id v29 = 0;
      }
      id v30 = v29;

      id v31 = [v30 parameterMetadata];

      id v32 = [v31 valueType];
      id v33 = [MEMORY[0x1E4F72CB8] applicationValueType];
      int v34 = [v32 isEqual:v33];

      if (v34)
      {
        objc_opt_class();
        id v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v35 = [v31 valueType];
        id v36 = objc_msgSend(v35, "wf_enumValueType");

        if (v36)
        {
          id v15 = (id)objc_opt_class();
        }
        else
        {
          uint64_t v37 = [v31 valueType];
          id v15 = (id)[v37 objectClass];
        }
      }

      goto LABEL_14;
    }
  }
  else
  {
    id v12 = 0;
  }
  uint64_t v16 = [v4 toolkitValueClass];
LABEL_13:
  id v15 = (id)v16;
LABEL_14:

  return (Class)v15;
}

- (void)showChronoControlIfPossibleForIntent:(id)a3 completionHandler:(id)a4
{
  int64_t v8 = (void (**)(id, void))a4;
  id v6 = [a3 associatedControl];
  if (v6)
  {
    __int16 v7 = [(WFAction *)self userInterface];
    [v6 presentIfPossibleInUserInterface:v7 completionBlock:v8];
  }
  else
  {
    v8[2](v8, 0);
  }
}

- (void)finishRunningWithError:(id)a3
{
  id v4 = [(WFAction *)self localizedErrorWithLinkError:a3];
  connectionPolicy = self->_connectionPolicy;
  self->_connectionPolicy = 0;

  v6.receiver = self;
  v6.super_class = (Class)WFAppIntentExecutionAction;
  [(WFAction *)&v6 finishRunningWithError:v4];
}

- (BOOL)skipExecutingInSiri
{
  return 0;
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

- (BOOL)requiresUnlock
{
  uint64_t v3 = [(WFAction *)self userInterface];
  char v4 = [v3 isRunningWithToolKitClient];

  if (v4) {
    goto LABEL_6;
  }
  int64_t v5 = [(WFAppIntentExecutionAction *)self authenticationPolicy];
  if (v5 != 1)
  {
    if ([(WFAppIntentExecutionAction *)self authenticationPolicy] == 2)
    {
LABEL_6:
      LOBYTE(v5) = 0;
      return v5;
    }
    objc_super v6 = [(WFAppIntentExecutionAction *)self metadata];
    uint64_t v7 = [v6 authenticationPolicy];

    if (v7 == 2)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      if (!v7) {
        goto LABEL_6;
      }
      int64_t v8 = [(WFAction *)self userInterface];
      if (objc_opt_respondsToSelector())
      {
        id v9 = [(WFAction *)self userInterface];
        char v10 = [v9 requestedFromAnotherDevice];
      }
      else
      {
        char v10 = 0;
      }

      id v11 = [(WFAction *)self userInterface];
      if (objc_opt_respondsToSelector())
      {
        id v12 = [(WFAction *)self userInterface];
        char v13 = [v12 requestedInHomeResident];
      }
      else
      {
        char v13 = 0;
      }

      LOBYTE(v5) = (v10 | v13) ^ 1;
    }
  }
  return v5;
}

- (id)sessionKitSessionInvocationType
{
  uint64_t v3 = [(WFAppIntentExecutionAction *)self metadata];
  char v4 = [v3 systemProtocols];
  int64_t v5 = [MEMORY[0x1E4F72DD8] sessionStartingProtocol];
  if ([v4 containsObject:v5]) {
    goto LABEL_4;
  }
  objc_super v6 = [(WFAppIntentExecutionAction *)self metadata];
  uint64_t v7 = [v6 systemProtocols];
  int64_t v8 = [MEMORY[0x1E4F72DD8] audioStartingProtocol];
  if ([v7 containsObject:v8])
  {

LABEL_4:
LABEL_5:
    id v9 = @"Manual";
    char v10 = @"Manual";
    goto LABEL_6;
  }
  id v12 = [(WFAppIntentExecutionAction *)self metadata];
  char v13 = [v12 systemProtocols];
  int8x16_t v14 = [MEMORY[0x1E4F72DD8] audioRecordingProtocol];
  char v15 = [v13 containsObject:v14];

  if (v15) {
    goto LABEL_5;
  }
  v16.receiver = self;
  v16.super_class = (Class)WFAppIntentExecutionAction;
  id v9 = [(WFAction *)&v16 sessionKitSessionInvocationType];
LABEL_6:
  return v9;
}

- (BOOL)mightSuppressRunningProgress
{
  return 1;
}

- (id)bundleIdentifier
{
  uint64_t v2 = [(WFAppIntentExecutionAction *)self appDescriptor];
  uint64_t v3 = [v2 bundleIdentifier];

  return v3;
}

- (void)processValueForParameter:(id)a3 withToolKitInvocation:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__WFAppIntentExecutionAction_processValueForParameter_withToolKitInvocation_completionHandler___block_invoke;
  v13[3] = &unk_1E6555C08;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  v12.receiver = self;
  v12.super_class = (Class)WFAppIntentExecutionAction;
  id v10 = v9;
  id v11 = v8;
  [(WFAction *)&v12 processValueForParameter:v11 withToolKitInvocation:a4 completionHandler:v13];
}

void __95__WFAppIntentExecutionAction_processValueForParameter_withToolKitInvocation_completionHandler___block_invoke(void *a1, uint64_t a2, void *a3)
{
  int64_t v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  id v7 = a3;
  id v8 = [v5 postProcessToolKitProcessedValue:a2 forParameter:v6];
  (*(void (**)(void))(a1[6] + 16))();
}

- (void)processEncodedValue:(id)a3 withToolKitInvocation:(id)a4 forParameter:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __103__WFAppIntentExecutionAction_processEncodedValue_withToolKitInvocation_forParameter_completionHandler___block_invoke;
  v15[3] = &unk_1E6555C08;
  void v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  v14.receiver = self;
  v14.super_class = (Class)WFAppIntentExecutionAction;
  id v12 = v11;
  id v13 = v10;
  [(WFAction *)&v14 processEncodedValue:a3 withToolKitInvocation:a4 forParameter:v13 completionHandler:v15];
}

void __103__WFAppIntentExecutionAction_processEncodedValue_withToolKitInvocation_forParameter_completionHandler___block_invoke(void *a1, uint64_t a2, void *a3)
{
  int64_t v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  id v7 = a3;
  id v8 = [v5 postProcessToolKitProcessedValue:a2 forParameter:v6];
  (*(void (**)(void))(a1[6] + 16))();
}

- (id)postProcessToolKitProcessedValue:(id)a3 forParameter:(id)a4
{
  id v6 = a3;
  id v7 = [a4 key];
  id v8 = [(WFAppIntentExecutionAction *)self parameterMetadataForIdentifier:v7];

  id v9 = [v8 valueType];
  id v10 = objc_msgSend(v9, "wf_parameterDefinitionWithParameterMetadata:", v8);

  id v11 = v10;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v12 = [v11 memberParameterDefinition];
    int v13 = 1;
    objc_super v14 = v11;
  }
  else
  {
    int v13 = 0;
    objc_super v14 = 0;
    id v12 = v11;
  }

  id v15 = v12;
  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }
    unint64_t v17 = v16;

    id v18 = v15;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v18;
    }
    else {
      id v19 = 0;
    }
  }
  else
  {
    unint64_t v17 = 0;
    id v19 = 0;
  }
  unint64_t v20 = v19;

  if (!(v17 | v20))
  {
    id v29 = v6;
    goto LABEL_24;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__WFAppIntentExecutionAction_postProcessToolKitProcessedValue_forParameter___block_invoke;
  aBlock[3] = &unk_1E6555BB8;
  id v36 = (id)v20;
  id v21 = (void (**)(void *, id, id))_Block_copy(aBlock);
  id v22 = v6;
  id v31 = v14;
  if (!v22)
  {
    id v25 = 0;
LABEL_22:
    objc_msgSend(v15, "valueType", v31);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    v21[2](v21, v22, v28);
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = v25;
    goto LABEL_23;
  }
  objc_opt_class();
  int v23 = objc_opt_isKindOfClass() & 1;
  if (v23) {
    char v24 = v22;
  }
  else {
    char v24 = 0;
  }
  id v25 = v24;

  if ((v23 & v13) != 1) {
    goto LABEL_22;
  }
  id v26 = [v8 valueType];
  char v27 = objc_msgSend(v26, "wf_objectValueType");

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __76__WFAppIntentExecutionAction_postProcessToolKitProcessedValue_forParameter___block_invoke_3;
  v32[3] = &unk_1E6555BE0;
  id v33 = v27;
  int v34 = v21;
  id v28 = v27;
  objc_msgSend(v25, "if_map:", v32);
  id v29 = (id)objc_claimAutoreleasedReturnValue();

LABEL_23:
  objc_super v14 = v31;
LABEL_24:

  return v29;
}

id __76__WFAppIntentExecutionAction_postProcessToolKitProcessedValue_forParameter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      id v8 = v5;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
    id v10 = v5;
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();
    if (v11) {
      id v12 = v10;
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;

    if (v11)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F72E10]);
      id v15 = [v10 bundleIdentifier];
      id v16 = [MEMORY[0x1E4F72CB8] applicationValueType];
      unint64_t v17 = (void *)[v14 initWithValue:v15 valueType:v16];
    }
    else if (isKindOfClass)
    {
      id v18 = [*(id *)(a1 + 32) enumMetadata];
      id v19 = [v18 cases];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __76__WFAppIntentExecutionAction_postProcessToolKitProcessedValue_forParameter___block_invoke_2;
      v25[3] = &unk_1E65581D0;
      id v20 = v10;
      id v26 = v20;
      id v21 = objc_msgSend(v19, "if_firstObjectPassingTest:", v25);

      if (v21)
      {
        unint64_t v17 = [v21 identifier];
      }
      else
      {
        id v22 = objc_alloc(MEMORY[0x1E4F72E10]);
        int v23 = [v20 identifier];
        unint64_t v17 = (void *)[v22 initWithValue:v23 valueType:v6];
      }
    }
    else
    {
      unint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F72E10]) initWithValue:v10 valueType:v6];
    }
  }
  else
  {
    unint64_t v17 = 0;
  }

  return v17;
}

uint64_t __76__WFAppIntentExecutionAction_postProcessToolKitProcessedValue_forParameter___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

uint64_t __76__WFAppIntentExecutionAction_postProcessToolKitProcessedValue_forParameter___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  char v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)willBeginProcessingParameterStates
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(WFAppIntentExecutionAction *)self setParameterIdentifiersNeedingValues:v3];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(WFAction *)self parameters];
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v9 = [v8 key];
        id v10 = [(WFAction *)self parameterStateForKey:v9];

        char v11 = [v10 containedVariables];
        id v12 = NSStringFromSelector(sel_type);
        id v13 = [v11 filteredArrayForKey:v12 value:@"Ask"];

        id v14 = [v8 key];
        BOOL v15 = [(WFAction *)self canOfferSuggestionsForParameterWithKey:v14];

        if ([v13 count] && !v15)
        {
          id v16 = [v8 key];
          [(WFAction *)self setParameterState:0 forKey:v16];

          unint64_t v17 = [(WFAppIntentExecutionAction *)self parameterIdentifiersNeedingValues];
          id v18 = [v8 key];
          [v17 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v18];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
}

- (BOOL)shouldAskForValuesWhileProcessingParameterStates
{
  return 0;
}

- (BOOL)isApprovedForPublicShortcutsDrawer
{
  uint64_t v2 = [(WFAppIntentExecutionAction *)self fullyQualifiedLinkActionIdentifier];
  BOOL v3 = +[WFLinkActionProvider approvedForPublicDrawerToDisplayActionIdentifier:v2];

  return v3;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WFAppIntentExecutionAction;
  if (!-[WFAction visibleForUse:](&v9, sel_visibleForUse_)) {
    return 0;
  }
  uint64_t v5 = [(WFAppIntentExecutionAction *)self fullyQualifiedLinkActionIdentifier];
  uint64_t v6 = [(WFAppIntentExecutionAction *)self metadata];
  BOOL v7 = +[WFLinkActionProvider isFullyQualifiedActionIdentifier:v5 withMetadata:v6 visibleForUse:a3];

  return v7;
}

- (NSString)displayableAppBundleIdentifier
{
  uint64_t v2 = [(WFAppIntentExecutionAction *)self displayableAppDescriptor];
  BOOL v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (id)displayableAppDescriptor
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(WFAction *)self definition];
  uint64_t v4 = [v3 objectForKey:@"LinkActionDisableDisplayedAppDescriptor"];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  char v7 = [v6 BOOLValue];
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    objc_super v9 = [(WFAction *)self definition];
    id v10 = [v9 objectForKey:@"LinkActionDisplayedAppDescriptor"];

    if (v10)
    {
      char v11 = (void *)[objc_alloc(MEMORY[0x1E4F302A8]) initWithSerializedRepresentation:v10];
      id v8 = v11;
      if (v11)
      {
        id v12 = v11;
      }
      else
      {
        id v13 = getWFAppIntentsLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          unint64_t v17 = "-[WFAppIntentExecutionAction displayableAppDescriptor]";
          _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Found a serialized representation for displayedAppDescriptor, but failed to deserialize it.", buf, 0xCu);
        }
      }
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)WFAppIntentExecutionAction;
      id v8 = [(WFAction *)&v15 displayableAppDescriptor];
    }
  }
  return v8;
}

- (BOOL)actionIsExecutedFromAnotherDevice
{
  BOOL v3 = [(WFAction *)self userInterface];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = [(WFAction *)self userInterface];
    char v5 = [v4 requestedFromAnotherDevice];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)externalMetricsActionIdentifier
{
  return (id)[(LNFullyQualifiedActionIdentifier *)self->_fullyQualifiedLinkActionIdentifier actionIdentifier];
}

- (id)externalMetricsBundleIdentifier
{
  return (id)[(LNFullyQualifiedActionIdentifier *)self->_fullyQualifiedLinkActionIdentifier bundleIdentifier];
}

- (id)entityMetadataForIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = +[WFLinkActionProvider sharedProvider];
  id v6 = [(WFAppIntentExecutionAction *)self fullyQualifiedLinkActionIdentifier];
  char v7 = [v6 bundleIdentifier];
  id v8 = [v5 entityMetadataByAppBundleIdentifier:v7 entityIdentifier:v4];

  return v8;
}

- (id)backingActionIdentifiers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(WFAction *)self identifier];
  v5[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

uint64_t __133__WFAppIntentExecutionAction_getLinkActionWithProcessedParameters_forFocusConfiguration_fallingBackToDefaultValue_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setDisplayRepresentation:0];
}

id __133__WFAppIntentExecutionAction_getLinkActionWithProcessedParameters_forFocusConfiguration_fallingBackToDefaultValue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F72E10];
  id v3 = a2;
  id v4 = [v2 alloc];
  char v5 = [v3 value];
  id v6 = [v3 valueType];
  char v7 = [v3 displayRepresentation];

  id v8 = (void *)[v4 initWithValue:v5 valueType:v6 displayRepresentation:v7];
  return v8;
}

- (void)getLinkActionWithProcessedParameters:(id)a3 forFocusConfiguration:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)getLinkActionWithProcessedParameters:(id)a3 completionHandler:(id)a4
{
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4 = a3;
  char v5 = [(WFAppIntentExecutionAction *)self metadata];
  id v6 = [v5 descriptionMetadata];

  char v7 = [v6 resultValueName];

  if (v7)
  {
    id v8 = [v6 resultValueName];
    objc_super v9 = [v4 locale];
    id v10 = [v9 localeIdentifier];
    char v11 = [v8 localizedStringForLocaleIdentifier:v10];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFAppIntentExecutionAction;
    char v11 = [(WFAction *)&v13 localizedDefaultOutputNameWithContext:v4];
  }

  return v11;
}

- (id)outputDictionary
{
  v25[2] = *MEMORY[0x1E4F143B8];
  outputDictionary = self->_outputDictionary;
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (outputDictionary == v4)
  {
    char v5 = 0;
  }
  else if (outputDictionary)
  {
    outputDictionary = outputDictionary;
    char v5 = outputDictionary;
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)WFAppIntentExecutionAction;
    char v5 = [(WFAction *)&v23 outputDictionary];
    id v6 = [(WFAppIntentExecutionAction *)self metadata];
    char v7 = [v6 outputType];

    if (!v7) {
      goto LABEL_7;
    }
    id v8 = [v5 objectForKeyedSubscript:@"Types"];

    if (v8) {
      goto LABEL_7;
    }
    id v10 = [(WFAppIntentExecutionAction *)self fullyQualifiedLinkActionIdentifier];
    char v11 = [v10 bundleIdentifier];
    id v12 = objc_msgSend(v7, "wf_contentItemClassesWithAppBundleIdentifier:", v11);

    if (v12)
    {
      objc_super v13 = (void *)[v5 mutableCopy];
      id v14 = v13;
      if (v13) {
        id v15 = v13;
      }
      else {
        id v15 = (id)objc_opt_new();
      }
      id v16 = v15;

      v24[0] = @"Multiple";
      unint64_t v17 = NSNumber;
      objc_opt_class();
      uint64_t v18 = [v17 numberWithBool:objc_opt_isKindOfClass() & 1];
      v24[1] = @"Types";
      v25[0] = v18;
      id v19 = objc_msgSend(v12, "if_compactMap:", &__block_literal_global_58497);
      v25[1] = v19;
      long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
      [v16 addEntriesFromDictionary:v20];

      long long v21 = (void *)[v16 copy];
      if (v21)
      {
        long long v22 = v21;
      }
      else
      {
        long long v22 = [MEMORY[0x1E4F1CA98] null];
      }
      outputDictionary = self->_outputDictionary;
      self->_outputDictionary = v22;
      char v5 = v21;
    }
    else
    {
LABEL_7:

      outputDictionary = 0;
    }
  }

  return v5;
}

NSString *__46__WFAppIntentExecutionAction_outputDictionary__block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

- (id)copyForProcessing
{
  v3.receiver = self;
  v3.super_class = (Class)WFAppIntentExecutionAction;
  id result = [(WFAction *)&v3 copyForProcessing];
  if (result) {
    *((unsigned char *)result + 353) = 1;
  }
  return result;
}

- (id)copyWithSerializedParameters:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(WFAction *)self identifier];
  char v7 = [(WFAppIntentExecutionAction *)self metadata];
  id v8 = [(WFAction *)self definition];
  objc_super v9 = [(WFAppIntentExecutionAction *)self appIntentDescriptor];
  id v10 = [(WFAppIntentExecutionAction *)self fullyQualifiedLinkActionIdentifier];
  char v11 = (void *)[v5 initWithIdentifier:v6 metadata:v7 definition:v8 serializedParameters:v4 appIntentDescriptor:v9 fullyQualifiedActionIdentifier:v10];

  return v11;
}

- (void)generateShortcutRepresentation:(id)a3
{
  id v4 = NSString;
  uint64_t v5 = *MEMORY[0x1E4F30890];
  id v6 = a3;
  char v7 = [(WFAction *)self identifier];
  id v12 = [v4 stringWithFormat:@"%@%@", v5, v7];

  id v8 = [WFHandleCustomIntentAction alloc];
  objc_super v9 = [(WFAction *)self definition];
  id v10 = [(WFAction *)self serializedParameters];
  char v11 = [(WFHandleIntentAction *)v8 initWithIdentifier:v12 definition:v9 serializedParameters:v10];

  if (v11) {
    [(WFHandleIntentAction *)v11 generateShortcutRepresentation:v6];
  }
  else {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)generateStandaloneShortcutRepresentation:(id)a3
{
  id v6 = (void (**)(id, WFStandaloneShortcutRepresentation *))a3;
  id v4 = [(WFAppIntentExecutionAction *)self associatedAppBundleIdentifier];
  if (v4)
  {
    uint64_t v5 = [[WFStandaloneShortcutRepresentation alloc] initWithBundleIdentifier:v4];
    v6[2](v6, v5);
  }
  else
  {
    v6[2](v6, 0);
  }
}

@end