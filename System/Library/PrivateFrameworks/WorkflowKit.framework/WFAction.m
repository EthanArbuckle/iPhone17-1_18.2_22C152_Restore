@interface WFAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
+ (id)actionFromSerializedRepresentation:(id)a3 actionRegistry:(id)a4;
+ (id)actionsFromSerializedRepresentations:(id)a3 actionRegistry:(id)a4;
+ (id)colorForName:(id)a3;
+ (id)iconCache;
+ (id)tintedColorForName:(id)a3;
+ (id)userInterfaceProtocol;
+ (id)userInterfaceXPCInterface;
+ (void)showImplicitChooseFromListWithInput:(id)a3 userInterface:(id)a4 workQueue:(id)a5 cancelHandler:(id)a6 selectionHandler:(id)a7;
- (BOOL)allowSessionKitSessionsIfNeededWithConfiguration:(id)a3 error:(id *)a4;
- (BOOL)allowSessionKitSessionsIfNeededWithConfiguration:(id)a3 isManualInvocation:(BOOL)a4 error:(id *)a5;
- (BOOL)allowsAnyURLDestinationWhenAddedToWorkflowByUser;
- (BOOL)appResourceRequiresAppInstall;
- (BOOL)blocksSnapping;
- (BOOL)canHandleInputOfContentClasses:(id)a3 withSupportedClasses:(id)a4;
- (BOOL)canHandleInputOfContentClasses:(id)a3 withSupportedClasses:(id)a4 includingCoercedTypes:(BOOL)a5;
- (BOOL)canOfferSuggestionsForParameterWithKey:(id)a3;
- (BOOL)containsVariableOfType:(id)a3;
- (BOOL)deletesInput;
- (BOOL)descriptionInputIncludesSupportingItemClasses;
- (BOOL)didRunRemotely;
- (BOOL)displaysParameterSummary;
- (BOOL)getInputContentFromVariablesInParameterState:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (BOOL)hasAvailableActionOutputVariables;
- (BOOL)hasAvailableVariables;
- (BOOL)hasChildren;
- (BOOL)highRisk;
- (BOOL)ignoresOutputFromAction:(id)a3 inWorkflow:(id)a4;
- (BOOL)ignoresOutputFromPreviousActionInWorkflow:(id)a3;
- (BOOL)inputParameterUnlocked;
- (BOOL)inputPassthrough;
- (BOOL)inputRequired;
- (BOOL)inputTypeDeterminesOutputType;
- (BOOL)inputsMultipleItems;
- (BOOL)isApprovedForPublicShortcutsDrawer;
- (BOOL)isConstructorAction;
- (BOOL)isDeletable;
- (BOOL)isDisabledWhenRunOnDevice:(id)a3;
- (BOOL)isDiscontinued;
- (BOOL)isLastAction;
- (BOOL)isMissing;
- (BOOL)isOutputExpandedInEditor;
- (BOOL)isProgressIndeterminate;
- (BOOL)isResidentCompatible;
- (BOOL)isRunning;
- (BOOL)isRunningInSiriUserInterface;
- (BOOL)isSubclassThatOverridesSelector:(SEL)a3;
- (BOOL)isTesting;
- (BOOL)isVariableWithNameAvailable:(id)a3;
- (BOOL)isVariableWithOutputUUIDAvailable:(id)a3;
- (BOOL)legacyBehaviorIgnoresOutputFromAction:(id)a3 inWorkflow:(id)a4;
- (BOOL)locallyProcessesData;
- (BOOL)mightStartAudioRecording;
- (BOOL)mightSuppressRunningProgress;
- (BOOL)neverSuggested;
- (BOOL)outputIsRenamed;
- (BOOL)outputsMultipleItems;
- (BOOL)populatesInputFromInputParameter;
- (BOOL)prefersActionAttribution;
- (BOOL)requiresHandoffWhenRunWithUserInterfaceType:(id)a3;
- (BOOL)requiresPrivateOutputLogging;
- (BOOL)requiresRemoteExecution;
- (BOOL)requiresUnlock;
- (BOOL)requiresUserInteractionWhenRunWithInput:(id)a3;
- (BOOL)runningInStepWiseExecutor;
- (BOOL)runningInToolKit;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (BOOL)setParameterStateToVariable:(id)a3 forKey:(id)a4;
- (BOOL)shouldAskForValuesWhileProcessingParameterStates;
- (BOOL)shouldBeConnectedToPreviousActionInWorkflow:(id)a3 withOutputsConsumedByFollowingActions:(id)a4;
- (BOOL)shouldBeIncludedInAppsList;
- (BOOL)shouldDisableSmartPromptChecks;
- (BOOL)shouldInsertExpandingParameterForParameter:(id)a3;
- (BOOL)shouldLocalizeValueForSelector:(SEL)a3;
- (BOOL)showsConnectorToPreviousActionInWorkflow:(id)a3;
- (BOOL)showsImplicitChooseFromListWhenRunWithInput:(id)a3;
- (BOOL)skipsProcessingHiddenParameters;
- (BOOL)snappingPassthrough;
- (BOOL)supportsUserInterfaceType:(id)a3;
- (BOOL)synchronouslyHandleTestingEvent:(id)a3 error:(id *)a4;
- (BOOL)takeSessionKitAssertionIfNeededWithError:(id *)a3;
- (BOOL)usesCompactUnlockService;
- (BOOL)usesLegacyInputBehavior;
- (BOOL)visibleForUse:(int64_t)a3;
- (Class)contentItemClass;
- (Class)toolkitValueClassForParameter:(id)a3;
- (ICApp)app;
- (INAppDescriptor)appDescriptor;
- (NSArray)additionalParameterSummaries;
- (NSArray)availableOutputActions;
- (NSArray)availableVariableNames;
- (NSArray)currentGeneratedResourceNodes;
- (NSArray)currentUnevaluatedResourceNodes;
- (NSArray)disabledOnPlatforms;
- (NSArray)inputContentClasses;
- (NSArray)inputTypes;
- (NSArray)keyCommands;
- (NSArray)localizedKeywords;
- (NSArray)outputContentClasses;
- (NSArray)outputTypes;
- (NSArray)parameterDefinitions;
- (NSArray)parameters;
- (NSArray)remoteExecuteOnPlatforms;
- (NSArray)requiredResources;
- (NSArray)specifiedInputContentClasses;
- (NSArray)specifiedOutputContentClasses;
- (NSArray)supportedAppIdentifiers;
- (NSArray)userInterfaceTypes;
- (NSArray)workflowInputClasses;
- (NSAttributedString)attributedLocalizedName;
- (NSAttributedString)localizedFooter;
- (NSDictionary)appDefinition;
- (NSDictionary)displayableAppDefinition;
- (NSDictionary)inputDictionary;
- (NSDictionary)outputDictionary;
- (NSDictionary)parametersByKey;
- (NSDictionary)processedParameters;
- (NSDictionary)serializedRepresentation;
- (NSDictionary)sessionKitSessionConfigurationDefinition;
- (NSDictionary)sessionKitToastDurationsPerRunSourceDefinition;
- (NSDictionary)userInterfaceClasses;
- (NSHashTable)eventObservers;
- (NSMutableDictionary)cachedDefaultParameterStates;
- (NSMutableDictionary)decodedParameterStates;
- (NSMutableDictionary)encodedSerializedParameters;
- (NSMutableDictionary)expandingParameters;
- (NSProgress)progress;
- (NSSet)allowedOnceSmartPromptStates;
- (NSSet)ignoredParameterKeysForProcessing;
- (NSString)UUID;
- (NSString)appBundleIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)externalMetricsActionIdentifier;
- (NSString)externalMetricsBundleIdentifier;
- (NSString)fillingProvider;
- (NSString)groupingIdentifier;
- (NSString)iconBackgroundColorName;
- (NSString)iconName;
- (NSString)iconSymbolName;
- (NSString)identifier;
- (NSString)inputParameterKey;
- (NSString)localizedAttribution;
- (NSString)localizedCategory;
- (NSString)localizedDefaultDisambiguationPrompt;
- (NSString)localizedDefaultOutputName;
- (NSString)localizedDescriptionAttributionMarkdownString;
- (NSString)localizedDescriptionInput;
- (NSString)localizedDescriptionNote;
- (NSString)localizedDescriptionRequires;
- (NSString)localizedDescriptionResult;
- (NSString)localizedDescriptionSummary;
- (NSString)localizedDiscontinuedDescription;
- (NSString)localizedFocusFilterDescription;
- (NSString)localizedKeyParameterDisplayName;
- (NSString)localizedName;
- (NSString)outputMeasurementUnitType;
- (NSString)outputName;
- (NSString)parameterSummaryString;
- (NSString)sessionKitSessionInvocationType;
- (NSString)widgetSizeClass;
- (OS_dispatch_queue)effectiveWorkQueue;
- (OS_dispatch_queue)workQueue;
- (WFAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
- (WFActionAuxiliaryButton)auxiliaryButton;
- (WFActionDefinition)definition;
- (WFActionDescriptionDefinition)descriptionDefinition;
- (WFActionExtendedOperation)extendedOperation;
- (WFActionParameterSummary)parameterSummary;
- (WFActionRemoteUserInterface)actionUserInterface;
- (WFActionRunningDelegate)runningDelegate;
- (WFActionSessionKitSessionConfiguration)sessionKitSessionConfiguration;
- (WFAppInstalledResource)appResource;
- (WFColor)iconColor;
- (WFContactStore)contactStore;
- (WFContentAttributionTracker)contentAttributionTracker;
- (WFContentCollection)input;
- (WFContentCollection)output;
- (WFContentPermissionRequestor)contentPermissionRequestor;
- (WFIcon)icon;
- (WFLocalizationContext)defaultLocalizationContext;
- (WFParameter)inputParameter;
- (WFResourceManager)resourceManager;
- (WFSessionKitAssertion)sessionKitAssertion;
- (WFToolInvocation)toolInvocation;
- (WFUserInterfaceHost)userInterface;
- (WFVariableDataSource)variableSource;
- (WFWorkflow)workflow;
- (id)actionForAppIdentifier:(id)a3;
- (id)actionProvidingVariableWithOutputUUID:(id)a3;
- (id)actionsProvidingVariableName:(id)a3;
- (id)classesForTypeArray:(id)a3 includeAllOutputTypes:(BOOL)a4;
- (id)completionHandler;
- (id)containedVariables;
- (id)containedVariablesOfClass:(Class)a3;
- (id)contentDestinationWithError:(id *)a3;
- (id)contextualActionsForSurface:(unint64_t)a3;
- (id)copyForDuplicating;
- (id)copyForProcessing;
- (id)copyParameterStates;
- (id)copyParameterStatesWithFallingBackToDefaultValue:(BOOL)a3;
- (id)copyWithDefinition:(id)a3 serializedParameters:(id)a4;
- (id)copyWithSerializedParameters:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createAccompanyingActions;
- (id)createResourceManager;
- (id)createStateForParameter:(id)a3 fromSerializedRepresentation:(id)a4;
- (id)customOutputName;
- (id)defaultParameterStateForKey:(id)a3;
- (id)descriptionInput;
- (id)deviceLockedError;
- (id)generateOutputUUIDForAction:(id)a3;
- (id)generateUUIDIfNecessaryWithUUIDProvider:(id)a3;
- (id)generatedResourceNodes;
- (id)inheritedInputVariableInWorkflow:(id)a3;
- (id)inheritedInputVariableInWorkflow:(id)a3 ignoringInputTypes:(BOOL)a4;
- (id)inheritedOutputContentClassesInWorkflow:(id)a3;
- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4;
- (id)inputSourceInWorkflow:(id)a3;
- (id)itemsBeingDeleted;
- (id)localizedAttributionWithContext:(id)a3;
- (id)localizedCategoryWithContext:(id)a3;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)localizedDescriptionAttributionMarkdownStringWithContext:(id)a3;
- (id)localizedDescriptionInputWithContext:(id)a3;
- (id)localizedDescriptionNoteWithContext:(id)a3;
- (id)localizedDescriptionRequiresWithContext:(id)a3;
- (id)localizedDescriptionResultWithContext:(id)a3;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (id)localizedDiscontinuedDescriptionWithContext:(id)a3;
- (id)localizedErrorWithLinkError:(id)a3;
- (id)localizedFocusFilterDescriptionWithContext:(id)a3;
- (id)localizedKeywordsWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)minimumSupportedClientVersion;
- (id)missingAppError;
- (id)outputVariableWithVariableProvider:(id)a3 UUIDProvider:(id)a4;
- (id)parameterForKey:(id)a3;
- (id)parameterKeysIgnoredForParameterSummary;
- (id)parameterStateForKey:(id)a3;
- (id)parameterStateForKey:(id)a3 fallingBackToDefaultValue:(BOOL)a4;
- (id)parameterValueForKey:(id)a3 ofClass:(Class)a4;
- (id)parametersRequiringUserInputAlongsideParameter:(id)a3;
- (id)populatedInputWithProcessedParameterValues:(id)a3;
- (id)possibleContentClassesForVariableNamed:(id)a3 context:(id)a4;
- (id)previousAction;
- (id)prioritizedParameterKeysForRemoteExecution;
- (id)providedVariableNames;
- (id)serializedParameterStateForKey:(id)a3;
- (id)serializedParameters;
- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4;
- (id)smartPromptSubtitleWithPreviousContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (id)supplementalParameterValueForKey:(id)a3 ofClass:(Class)a4;
- (id)systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:(id)a3;
- (id)typeDescriptionWithTypes:(id)a3 explanationText:(id)a4 multiple:(BOOL)a5 optional:(BOOL)a6;
- (id)unevaluatedResourceNodes;
- (id)unevaluatedResourceObjectsOfClass:(Class)a3;
- (id)unevaluatedResourceObjectsOfClasses:(id)a3;
- (id)visibleParametersForParameterSummary;
- (id)visibleParametersWithProcessing:(BOOL)a3;
- (int64_t)initialSuggestionBehavior;
- (int64_t)rateLimitDelay;
- (int64_t)rateLimitThreshold;
- (int64_t)rateLimitTimeout;
- (os_unfair_lock_s)observersLock;
- (os_unfair_lock_s)parameterInitializationLock;
- (os_unfair_lock_s)parameterStateDeserializationLock;
- (os_unfair_lock_s)resourceManagerLock;
- (unint64_t)appearance;
- (unint64_t)outputDisclosureLevel;
- (unint64_t)parameterCollapsingBehavior;
- (void)_processParameterStates:(id)a3 withInput:(id)a4 skippingHiddenParameters:(BOOL)a5 askForValuesIfNecessary:(BOOL)a6 workQueue:(id)a7 completionHandler:(id)a8;
- (void)addEventObserver:(id)a3;
- (void)addVariableObserver:(id)a3;
- (void)appInstalledResource:(id)a3 didUpdateAppDescriptor:(id)a4;
- (void)askForValuesOfParameters:(id)a3 withDefaultStates:(id)a4 prompts:(id)a5 input:(id)a6 workQueue:(id)a7 completionHandler:(id)a8;
- (void)cancel;
- (void)checkUserInterfaceAndRun;
- (void)configureResourcesForParameter:(id)a3;
- (void)didChangeVariableName:(id)a3 to:(id)a4;
- (void)dismissPresentedContentWithCompletionHandler:(id)a3;
- (void)enumerateObservers:(id)a3;
- (void)fetchSuggestedEntititiesForParameterWithKey:(id)a3 completionHandler:(id)a4;
- (void)finishRunningWithError:(id)a3;
- (void)getContentDestinationWithCompletionHandler:(id)a3;
- (void)handleTestingEvent:(id)a3 completionHandler:(id)a4;
- (void)iconUpdated;
- (void)initializeParameters;
- (void)initializeParametersWithLock;
- (void)lockInputParameter;
- (void)logDataTransmissionForSmartPromptApprovalResult:(id)a3;
- (void)matchContextualAction:(id)a3 toContentCollection:(id)a4 completionHandler:(id)a5;
- (void)nameUpdated;
- (void)notifyEventObserversParameterStateDidChangeForKey:(id)a3;
- (void)outputDetailsUpdated;
- (void)parameterDefaultSerializedRepresentationDidChange:(id)a3;
- (void)parameterStateValidityCriteriaDidChange:(id)a3;
- (void)performDataAccessChecksWithUserInterface:(id)a3 contentItemCache:(id)a4 completionHandler:(id)a5;
- (void)performDataAndHardwareAccessChecksAndRun;
- (void)performDeletionAuthorizationChecksWithUserInterface:(id)a3 contentItemCache:(id)a4 completionHandler:(id)a5;
- (void)performSmartPromptChecksWithUserInterface:(id)a3 contentDestination:(id)a4 contentItemCache:(id)a5 isWebpageCoercion:(BOOL)a6 completionHandler:(id)a7;
- (void)preloadDefaultParameterStatesIfNecessaryWithCompletionHandler:(id)a3;
- (void)prepareToProcessWithCompletionHandler:(id)a3;
- (void)presentSmartPromptAuthorizationWithConfiguration:(id)a3 userInterface:(id)a4 databaseApprovalResult:(id)a5 contentDestination:(id)a6 completionHandler:(id)a7;
- (void)processEncodedValue:(id)a3 withToolKitInvocation:(id)a4 forParameter:(id)a5 completionHandler:(id)a6;
- (void)processParameterStates:(id)a3 withInput:(id)a4 skippingHiddenParameters:(BOOL)a5 askForValuesIfNecessary:(BOOL)a6 workQueue:(id)a7 completionHandler:(id)a8;
- (void)processParametersWithoutAskingForValuesWithInput:(id)a3 workQueue:(id)a4 completionHandler:(id)a5;
- (void)processParametersWithoutAskingForValuesWithInput:(id)a3 workQueue:(id)a4 fallingBackToDefaultValue:(BOOL)a5 completionHandler:(id)a6;
- (void)processValueForParameter:(id)a3 withToolKitInvocation:(id)a4 completionHandler:(id)a5;
- (void)promptForAudioRecordingPermissionIfNeededWithCompletionBlock:(id)a3;
- (void)recreateGeneratedResourcesIfNeeded;
- (void)recreateResourcesIfNeeded;
- (void)recreateUnevaluatedResourcesIfNeeded;
- (void)reloadAuxiliaryButton;
- (void)removeEventObserver:(id)a3;
- (void)removeVariableObserver:(id)a3;
- (void)requestInterfacePresentationWithCompletionHandler:(id)a3;
- (void)requestUnlock:(id)a3;
- (void)requestUnlockIfNeeded:(id)a3;
- (void)resetOutput;
- (void)resolveAppDescriptorIfNecessary:(id)a3;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4;
- (void)runWithInput:(id)a3 error:(id *)a4;
- (void)runWithInput:(id)a3 userInterface:(id)a4 runningDelegate:(id)a5 variableSource:(id)a6 workQueue:(id)a7 completionHandler:(id)a8;
- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4;
- (void)setActionUserInterface:(id)a3;
- (void)setAllowedOnceSmartPromptStates:(id)a3;
- (void)setAppDescriptor:(id)a3;
- (void)setAppResource:(id)a3;
- (void)setAuxiliaryButton:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setContentAttributionTracker:(id)a3;
- (void)setContentPermissionRequestor:(id)a3;
- (void)setCurrentGeneratedResourceNodes:(id)a3;
- (void)setCurrentUnevaluatedResourceNodes:(id)a3;
- (void)setDefaultCoercionOptionsOnContentCollection:(id)a3;
- (void)setDefaultCoercionOptionsOnInputs;
- (void)setDidRunRemotely:(BOOL)a3;
- (void)setEffectiveWorkQueue:(id)a3;
- (void)setExtendedOperation:(id)a3;
- (void)setGroupingIdentifier:(id)a3;
- (void)setIgnoredParameterKeysForProcessing:(id)a3;
- (void)setInputParameterUnlocked:(BOOL)a3;
- (void)setOutput:(id)a3;
- (void)setOutput:(id)a3 onVariableSource:(id)a4;
- (void)setOutputExpandedInEditor:(BOOL)a3;
- (void)setOutputName:(id)a3;
- (void)setProcessedParameters:(id)a3;
- (void)setProgress:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)setRunningDelegate:(id)a3;
- (void)setSessionKitAssertion:(id)a3;
- (void)setSupplementalParameterValue:(id)a3 forKey:(id)a4;
- (void)setToolInvocation:(id)a3;
- (void)setUUID:(id)a3;
- (void)setUserInterface:(id)a3;
- (void)setVariableSource:(id)a3;
- (void)setWidgetSizeClass:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)snapInputParameterIfNecessary;
- (void)unlockAppProtectionWithCompletionHandler:(id)a3;
- (void)unlockInputParameter;
- (void)updateAppDescriptorWithSelectedApp:(id)a3;
- (void)updateParameterSummaryIfNeeded:(id)a3;
- (void)visibleParametersUpdated;
- (void)wasAddedToWorkflow:(id)a3;
- (void)wasAddedToWorkflowByUser:(id)a3;
- (void)wasRemovedFromWorkflow:(id)a3;
- (void)willBeAddedToWorkflow:(id)a3;
@end

@implementation WFAction

- (void)setSupplementalParameterValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WFAction *)self encodedSerializedParameters];
  v9 = v8;
  if (v6) {
    [v8 setObject:v6 forKey:v7];
  }
  else {
    [v8 removeObjectForKey:v7];
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__WFAction_setSupplementalParameterValue_forKey___block_invoke;
  v11[3] = &unk_1E654E568;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [(WFAction *)self enumerateObservers:v11];
}

id __32__WFAction_initializeParameters__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[WFParameter parameterWithDefinition:v3];
  if (v4)
  {
    [*(id *)(a1 + 32) configureParameter:v4];
    v5 = [v4 key];
    id v6 = [*(id *)(a1 + 40) objectForKey:v5];

    if (v6)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v11 = *(void *)(a1 + 48);
      id v12 = *(void **)(a1 + 32);
      v13 = [v12 identifier];
      [v10 handleFailureInMethod:v11, v12, @"WFAction.m", 2173, @"Multiple parameters of %@ use key %@", v13, v5 object file lineNumber description];
    }
    [*(id *)(a1 + 40) setObject:v4 forKey:v5];
    [v4 addEventObserver:*(void *)(a1 + 32)];
    id v7 = v4;
  }
  else
  {
    v8 = getWFGeneralLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[WFAction initializeParameters]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Failed to initialize parameter with definition: %@", buf, 0x16u);
    }
  }
  return v4;
}

- (void)addEventObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  id v6 = [(WFAction *)self eventObservers];
  [v6 addObject:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (void)enumerateObservers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  id v6 = [(WFAction *)self eventObservers];
  id v7 = [v6 allObjects];

  os_unfair_lock_unlock(p_observersLock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (NSHashTable)eventObservers
{
  return self->_eventObservers;
}

void __49__WFAction_setSupplementalParameterValue_forKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 action:*(void *)(a1 + 32) supplementalParameterValueDidChangeForKey:*(void *)(a1 + 40)];
  }
}

- (id)defaultParameterStateForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAction *)self cachedDefaultParameterStates];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v7 = [(WFAction *)self parameterForKey:v4];
    id v8 = [v7 defaultSerializedRepresentation];
    if (v8)
    {
      id v6 = [(WFAction *)self createStateForParameter:v7 fromSerializedRepresentation:v8];
      if (v6)
      {
        uint64_t v9 = [(WFAction *)self cachedDefaultParameterStates];
        [v9 setObject:v6 forKey:v4];
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

- (id)serializedParameters
{
  id v3 = [(WFAction *)self encodedSerializedParameters];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(WFAction *)self decodedParameterStates];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __32__WFAction_serializedParameters__block_invoke;
  v10[3] = &unk_1E654E540;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  id v7 = v11;
  id v8 = v6;

  return v8;
}

- (id)parameterStateForKey:(id)a3 fallingBackToDefaultValue:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(WFAction *)self parameterForKey:v6];
  if (!v7)
  {
    uint64_t v10 = 0;
    goto LABEL_26;
  }
  os_unfair_lock_lock(&self->_parameterStateDeserializationLock);
  id v8 = [(WFAction *)self decodedParameterStates];
  uint64_t v9 = [v8 objectForKey:v6];

  if (v9)
  {
    os_unfair_lock_unlock(&self->_parameterStateDeserializationLock);
  }
  else
  {
    id v11 = [v7 keyForSerialization];
    id v12 = objc_alloc(MEMORY[0x1E4F1C978]);
    long long v13 = [v7 legacyKey];
    long long v14 = objc_msgSend(v12, "initWithObjects:", v11, v13, 0);

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v15 = v14;
    uint64_t v9 = (void *)[v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v9)
    {
      v25 = v11;
      BOOL v26 = v4;
      uint64_t v16 = *(void *)v28;
LABEL_7:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v15);
        }
        uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * v17);
        v19 = [(WFAction *)self encodedSerializedParameters];
        v20 = [v19 objectForKey:v18];

        if (v20) {
          break;
        }
        if (v9 == (void *)++v17)
        {
          uint64_t v9 = (void *)[v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v9) {
            goto LABEL_7;
          }
          v21 = v15;
          BOOL v4 = v26;
          id v11 = v25;
          goto LABEL_17;
        }
      }
      uint64_t v9 = [(WFAction *)self createStateForParameter:v7 fromSerializedRepresentation:v20];

      if (v9)
      {
        v22 = [(WFAction *)self decodedParameterStates];
        [v22 setObject:v9 forKey:v6];

        v21 = [(WFAction *)self encodedSerializedParameters];
        id v11 = v25;
        [v21 removeObjectForKey:v25];
        BOOL v4 = v26;
        goto LABEL_17;
      }
      BOOL v4 = v26;
      id v11 = v25;
    }
    else
    {
      v21 = v15;
LABEL_17:
    }
    os_unfair_lock_unlock(&self->_parameterStateDeserializationLock);
    if (!v9) {
      goto LABEL_22;
    }
  }
  if (([v7 parameterStateIsValid:v9] & 1) == 0)
  {

    uint64_t v9 = 0;
  }
LABEL_22:
  if (v4 && !v9)
  {
    id v23 = [(WFAction *)self defaultParameterStateForKey:v6];
  }
  else
  {
    id v23 = v9;
  }
  uint64_t v10 = v23;

LABEL_26:
  return v10;
}

- (NSMutableDictionary)encodedSerializedParameters
{
  return self->_encodedSerializedParameters;
}

- (NSMutableDictionary)decodedParameterStates
{
  return self->_decodedParameterStates;
}

- (id)parameterForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAction *)self parametersByKey];
  id v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v7 = [(WFAction *)self visibleParametersWithProcessing:0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __28__WFAction_parameterForKey___block_invoke;
    v9[3] = &unk_1E654F178;
    id v10 = v4;
    id v6 = objc_msgSend(v7, "if_firstObjectPassingTest:", v9);
  }
  return v6;
}

- (NSDictionary)parametersByKey
{
  parametersByKey = self->_parametersByKey;
  if (!parametersByKey)
  {
    [(WFAction *)self initializeParametersWithLock];
    parametersByKey = self->_parametersByKey;
  }
  return parametersByKey;
}

- (WFAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"WFAction.m", 149, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  uint64_t v12 = objc_opt_class();
  if (v12 == objc_opt_class())
  {
    uint64_t v18 = [v10 objectForKey:@"ActionClass"];
    v19 = NSClassFromString(v18);

    if ([(objc_class *)v19 isSubclassOfClass:objc_opt_class()])
    {
      v20 = (WFAction *)[[v19 alloc] initWithIdentifier:v9 definition:v10 serializedParameters:v11];
LABEL_12:
      v21 = v20;
      goto LABEL_13;
    }
  }
  else
  {
    v33.receiver = self;
    v33.super_class = (Class)WFAction;
    self = [(WFAction *)&v33 init];
    if (self)
    {
      long long v13 = (NSString *)[v9 copy];
      identifier = self->_identifier;
      self->_identifier = v13;

      objc_storeStrong((id *)&self->_definition, a4);
      id v15 = (void *)[v11 mutableCopy];
      uint64_t v16 = v15;
      if (v15) {
        uint64_t v17 = v15;
      }
      else {
        uint64_t v17 = (NSMutableDictionary *)objc_opt_new();
      }
      encodedSerializedParameters = self->_encodedSerializedParameters;
      self->_encodedSerializedParameters = v17;

      id v23 = (NSMutableDictionary *)objc_opt_new();
      cachedDefaultParameterStates = self->_cachedDefaultParameterStates;
      self->_cachedDefaultParameterStates = v23;

      v25 = (NSMutableDictionary *)objc_opt_new();
      decodedParameterStates = self->_decodedParameterStates;
      self->_decodedParameterStates = v25;

      long long v27 = (NSMutableDictionary *)objc_opt_new();
      expandingParameters = self->_expandingParameters;
      self->_expandingParameters = v27;

      long long v29 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      eventObservers = self->_eventObservers;
      self->_eventObservers = v29;

      HIBYTE(self->_parameterStateDeserializationLock._os_unfair_lock_opaque) = 0;
      *(void *)&self->_didRunRemotely = 0;
      objc_storeStrong((id *)&self->_widgetSizeClass, (id)*MEMORY[0x1E4F30098]);
      self->_observersLock._os_unfair_lock_opaque = 0;
      self->_resourceManagerLock._os_unfair_lock_opaque = 0;
      v20 = self;
      self = v20;
      goto LABEL_12;
    }
  }
  v21 = 0;
LABEL_13:

  return v21;
}

- (NSMutableDictionary)cachedDefaultParameterStates
{
  return self->_cachedDefaultParameterStates;
}

- (void)processParametersWithoutAskingForValuesWithInput:(id)a3 workQueue:(id)a4 fallingBackToDefaultValue:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(WFAction *)self copyParameterStatesWithFallingBackToDefaultValue:v6];
  [(WFAction *)self processParameterStates:v13 withInput:v12 skippingHiddenParameters:[(WFAction *)self skipsProcessingHiddenParameters] askForValuesIfNecessary:0 workQueue:v11 completionHandler:v10];
}

- (BOOL)skipsProcessingHiddenParameters
{
  return self->_skipsProcessingHiddenParameters;
}

- (void)processParameterStates:(id)a3 withInput:(id)a4 skippingHiddenParameters:(BOOL)a5 askForValuesIfNecessary:(BOOL)a6 workQueue:(id)a7 completionHandler:(id)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = a7;
  uint64_t v18 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v24 = "-[WFAction processParameterStates:withInput:skippingHiddenParameters:askForValuesIfNecessary:workQueue:completionHandler:]";
    __int16 v25 = 2114;
    BOOL v26 = self;
    __int16 v27 = 2112;
    id v28 = v14;
    __int16 v29 = 2112;
    id v30 = v15;
    _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_INFO, "%s Action %{public}@ started processing parameter states: %@, input: %@", buf, 0x2Au);
  }

  v19 = (void *)[v14 mutableCopy];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __122__WFAction_processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke;
  v21[3] = &unk_1E654E6F0;
  v21[4] = self;
  id v22 = v16;
  id v20 = v16;
  [(WFAction *)self _processParameterStates:v19 withInput:v15 skippingHiddenParameters:v11 askForValuesIfNecessary:v10 workQueue:v17 completionHandler:v21];
}

- (id)copyParameterStatesWithFallingBackToDefaultValue:(BOOL)a3
{
  id v5 = [(WFAction *)self parametersByKey];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__WFAction_copyParameterStatesWithFallingBackToDefaultValue___block_invoke;
  v8[3] = &unk_1E654E6C8;
  v8[4] = self;
  BOOL v9 = a3;
  BOOL v6 = objc_msgSend(v5, "if_compactMap:", v8);

  return v6;
}

- (BOOL)isRunning
{
  return self->_running;
}

void __61__WFAction_copyParameterStatesWithFallingBackToDefaultValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = [*(id *)(a1 + 32) parameterStateForKey:a2 fallingBackToDefaultValue:*(unsigned __int8 *)(a1 + 40)];
  *a5 = (id)[v6 copyWithZone:MEMORY[0x1C87C93A0]()];
}

- (BOOL)runningInToolKit
{
  id v3 = [(WFAction *)self runningDelegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(WFAction *)self runningDelegate];
  id v6 = [v5 currentRunningContextForAction:self];

  id v7 = [v6 runSource];
  char v8 = [v7 isEqualToString:*MEMORY[0x1E4FB4F50]];

  return v8;
}

- (WFActionRunningDelegate)runningDelegate
{
  return self->_runningDelegate;
}

- (WFContentPermissionRequestor)contentPermissionRequestor
{
  contentPermissionRequestor = self->_contentPermissionRequestor;
  if (!contentPermissionRequestor)
  {
    char v4 = [[WFActionContentPermissionRequestor alloc] initWithAction:self];
    id v5 = self->_contentPermissionRequestor;
    self->_contentPermissionRequestor = (WFContentPermissionRequestor *)v4;

    contentPermissionRequestor = self->_contentPermissionRequestor;
  }
  return contentPermissionRequestor;
}

- (WFUserInterfaceHost)userInterface
{
  return self->_userInterface;
}

void __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([*(id *)(a1 + 32) count] && *(unsigned char *)(a1 + 96))
  {
    id v5 = [*(id *)(a1 + 48) runningDelegate];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 48) runningDelegate];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v8 = *(id *)(a1 + 32);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v62 objects:v68 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v63;
          while (2)
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v63 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v62 + 1) + 8 * i);
              id v14 = [*(id *)(a1 + 48) runningDelegate];
              LOBYTE(v13) = [v14 action:*(void *)(a1 + 48) canProvideInputForParameter:v13];

              if ((v13 & 1) == 0)
              {
                uint64_t v33 = *(void *)(a1 + 80);
                uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
                v35 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
                (*(void (**)(uint64_t, void, uint64_t, void *))(v33 + 16))(v33, 0, v34, v35);

                goto LABEL_44;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v62 objects:v68 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      id v15 = [*(id *)(a1 + 48) parameters];
      id v16 = *(void **)(a1 + 32);
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_6;
      v60[3] = &unk_1E654E790;
      id v17 = v15;
      id v61 = v17;
      [v16 sortUsingComparator:v60];
      if ([*(id *)(a1 + 48) requiresRemoteExecution])
      {
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        id v18 = *(id *)(a1 + 32);
        uint64_t v19 = [v18 countByEnumeratingWithState:&v56 objects:v67 count:16];
        id v47 = v17;
        id v48 = v4;
        if (v19)
        {
          uint64_t v20 = v19;
          id v21 = 0;
          uint64_t v22 = *(void *)v57;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v57 != v22) {
                objc_enumerationMutation(v18);
              }
              v24 = *(void **)(*((void *)&v56 + 1) + 8 * j);
              __int16 v25 = objc_opt_class();
              if ([v25 isSubclassOfClass:objc_opt_class()])
              {
                uint64_t v26 = objc_opt_class();
                if (v26 != objc_opt_class())
                {
                  __int16 v27 = [*(id *)(a1 + 48) ignoredParameterKeysForProcessing];
                  id v28 = (void *)[v27 mutableCopy];

                  __int16 v29 = [v24 key];
                  [v28 addObject:v29];

                  [*(id *)(a1 + 48) setIgnoredParameterKeysForProcessing:v28];
                  if (!v21) {
                    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  }
                  objc_msgSend(v21, "addObject:", v24, v47);
                }
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v56 objects:v67 count:16];
          }
          while (v20);
        }
        else
        {
          id v21 = 0;
        }

        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v36 = v21;
        uint64_t v37 = [v36 countByEnumeratingWithState:&v52 objects:v66 count:16];
        id v4 = v48;
        if (v37)
        {
          uint64_t v38 = v37;
          uint64_t v39 = *(void *)v53;
          do
          {
            for (uint64_t k = 0; k != v38; ++k)
            {
              if (*(void *)v53 != v39) {
                objc_enumerationMutation(v36);
              }
              objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(void *)(*((void *)&v52 + 1) + 8 * k), v47);
            }
            uint64_t v38 = [v36 countByEnumeratingWithState:&v52 objects:v66 count:16];
          }
          while (v38);
        }

        id v17 = v47;
      }
      if (objc_msgSend(*(id *)(a1 + 32), "count", v47))
      {
        v41 = *(void **)(a1 + 48);
        uint64_t v42 = *(void *)(a1 + 56);
        uint64_t v43 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
        uint64_t v44 = *(void *)(a1 + 64);
        uint64_t v45 = *(void *)(a1 + 72);
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_7;
        v49[3] = &unk_1E6555C38;
        uint64_t v46 = *(void *)(a1 + 32);
        id v50 = *(id *)(a1 + 40);
        id v51 = *(id *)(a1 + 80);
        [v41 askForValuesOfParameters:v46 withDefaultStates:v42 prompts:v44 input:v43 workQueue:v45 completionHandler:v49];
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
      }
    }
    else
    {
      uint64_t v30 = *(void *)(a1 + 80);
      uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
      uint64_t v32 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
      (*(void (**)(uint64_t, void, uint64_t, void *))(v30 + 16))(v30, 0, v31, v32);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
LABEL_44:
}

uint64_t __53__WFAction_Display__visibleParametersWithProcessing___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isHidden]) {
    goto LABEL_2;
  }
  id v5 = [v3 resourceManager];
  char v6 = [v5 resourcesAvailable];

  if (v6)
  {
LABEL_4:
    uint64_t v4 = 1;
    goto LABEL_5;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    id v8 = [*(id *)(a1 + 32) expandingParameters];
    uint64_t v9 = [v3 key];
    uint64_t v10 = [v8 objectForKey:v9];
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      id v12 = [v3 resourceManager];
      uint64_t v13 = [v12 unavailableResources];
      uint64_t v14 = [v13 count];

      if (v14 == 1) {
        goto LABEL_4;
      }
    }
    else
    {
    }
  }
LABEL_2:
  uint64_t v4 = 0;
LABEL_5:

  return v4;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  char v6 = [(WFAction *)self identifier];
  char v7 = [v3 stringWithFormat:@"<%@: %p, identifier: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (NSString)localizedName
{
  id v3 = [(WFAction *)self defaultLocalizationContext];
  uint64_t v4 = [(WFAction *)self localizedNameWithContext:v3];

  return (NSString *)v4;
}

- (NSString)localizedDescriptionSummary
{
  id v3 = [(WFAction *)self defaultLocalizationContext];
  uint64_t v4 = [(WFAction *)self localizedDescriptionSummaryWithContext:v3];

  return (NSString *)v4;
}

- (WFLocalizationContext)defaultLocalizationContext
{
  return (WFLocalizationContext *)[MEMORY[0x1E4FB47E8] defaultContext];
}

- (void)_processParameterStates:(id)a3 withInput:(id)a4 skippingHiddenParameters:(BOOL)a5 askForValuesIfNecessary:(BOOL)a6 workQueue:(id)a7 completionHandler:(id)a8
{
  id v54 = a3;
  id v12 = a4;
  id v58 = a7;
  id v56 = a8;
  long long v52 = objc_opt_new();
  id v51 = objc_opt_new();
  id v50 = objc_opt_new();
  uint64_t v13 = [(WFAction *)self processedParameters];
  uint64_t v14 = (void *)[v13 mutableCopy];
  id v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = (id)objc_opt_new();
  }
  v49 = v16;

  uint64_t v81 = 0;
  v82 = (id *)&v81;
  uint64_t v83 = 0x3032000000;
  v84 = __Block_byref_object_copy__8356;
  v85 = __Block_byref_object_dispose__8357;
  id v86 = 0;
  id v48 = [(WFAction *)self inputParameter];
  BOOL v47 = [(WFAction *)self populatesInputFromInputParameter];
  if (v12) {
    objc_storeStrong(v82 + 5, a4);
  }
  id v17 = [(WFAction *)self parameters];
  id v18 = [(WFAction *)self prioritizedParameterKeysForRemoteExecution];
  uint64_t v19 = [v18 count];

  id v45 = v12;
  if (v19)
  {
    uint64_t v20 = [(WFAction *)self parameters];
    id v21 = (void *)[v20 mutableCopy];

    for (unint64_t i = 0; ; ++i)
    {
      id v23 = [(WFAction *)self prioritizedParameterKeysForRemoteExecution];
      unint64_t v24 = [v23 count];

      if (i >= v24) {
        break;
      }
      __int16 v25 = [(WFAction *)self prioritizedParameterKeysForRemoteExecution];
      uint64_t v26 = [v25 objectAtIndex:i];

      for (unint64_t j = 0; ; ++j)
      {
        id v28 = [(WFAction *)self parameters];
        unint64_t v29 = [v28 count];

        if (j >= v29) {
          break;
        }
        uint64_t v30 = [(WFAction *)self parameters];
        uint64_t v31 = [v30 objectAtIndex:j];

        uint64_t v32 = [v31 key];
        char v33 = [v32 isEqualToString:v26];

        if (v33)
        {
          uint64_t v34 = [v21 objectAtIndex:j];
          [v21 removeObjectAtIndex:j];
          [v21 insertObject:v34 atIndex:i];

          break;
        }
      }
      id v35 = v21;

      id v17 = v35;
    }
  }
  id v36 = -[WFAction visibleParametersWithProcessing:](self, "visibleParametersWithProcessing:", 1, v45);
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke;
  v69[3] = &unk_1E654E768;
  id v37 = v36;
  BOOL v79 = a5;
  id v70 = v37;
  v71 = self;
  id v72 = v52;
  id v73 = v51;
  id v74 = v50;
  id v75 = v49;
  id v55 = v54;
  id v76 = v55;
  id v38 = v48;
  BOOL v80 = v47;
  id v77 = v38;
  v78 = &v81;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_5;
  v59[3] = &unk_1E654E7B8;
  id v39 = v72;
  id v60 = v39;
  BOOL v68 = a6;
  id v40 = v56;
  id v66 = v40;
  id v41 = v75;
  v67 = &v81;
  id v61 = v41;
  long long v62 = self;
  id v42 = v73;
  id v63 = v42;
  id v43 = v74;
  id v64 = v43;
  id v44 = v58;
  id v65 = v44;
  objc_msgSend(v17, "if_enumerateAsynchronouslyInSequenceOnQueue:block:completionHandler:", v44, v69, v59);

  _Block_object_dispose(&v81, 8);
}

- (NSArray)parameters
{
  parameters = self->_parameters;
  if (!parameters)
  {
    [(WFAction *)self initializeParametersWithLock];
    parameters = self->_parameters;
  }
  return parameters;
}

- (void)initializeParametersWithLock
{
  p_parameterInitializationLocuint64_t k = &self->_parameterInitializationLock;
  os_unfair_lock_lock(&self->_parameterInitializationLock);
  [(WFAction *)self initializeParameters];
  os_unfair_lock_unlock(p_parameterInitializationLock);
}

- (void)initializeParameters
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_parameterInitializationLock);
  if (!self->_parameters)
  {
    uint64_t v4 = getWFGeneralLogObject();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);

    char v6 = getWFGeneralLogObject();
    char v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      id v8 = [(WFAction *)self identifier];
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412546;
      id v37 = v8;
      __int16 v38 = 2112;
      id v39 = v10;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "InitializeActionParameters", "identifier=%{signpost.description:attribute}@,class=%{signpost.description:attribute}@", buf, 0x16u);
    }
    uint64_t v11 = [(WFAction *)self parameterDefinitions];
    id v12 = (void *)v11;
    uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
    if (v11) {
      uint64_t v13 = (void *)v11;
    }
    id v14 = v13;

    id v15 = objc_opt_new();
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __32__WFAction_initializeParameters__block_invoke;
    v32[3] = &unk_1E654E980;
    v32[4] = self;
    id v16 = v15;
    id v33 = v16;
    SEL v34 = a2;
    objc_msgSend(v14, "if_compactMap:", v32);
    id v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    parameters = self->_parameters;
    self->_parameters = v17;

    uint64_t v19 = (NSDictionary *)[v16 copy];
    parametersByKey = self->_parametersByKey;
    self->_parametersByKey = v19;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v21 = self->_parameters;
    uint64_t v22 = [(NSArray *)v21 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v21);
          }
          -[WFAction configureResourcesForParameter:](self, "configureResourcesForParameter:", *(void *)(*((void *)&v28 + 1) + 8 * i), (void)v28);
        }
        uint64_t v23 = [(NSArray *)v21 countByEnumeratingWithState:&v28 objects:v35 count:16];
      }
      while (v23);
    }

    uint64_t v26 = getWFGeneralLogObject();
    __int16 v27 = v26;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v27, OS_SIGNPOST_INTERVAL_END, v5, "InitializeActionParameters", "", buf, 2u);
    }
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)parameterDefinitions
{
  v2 = [(WFAction *)self definition];
  id v3 = [v2 objectForKey:@"Parameters"];
  uint64_t v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  os_signpost_id_t v5 = v3;

  return v5;
}

- (WFActionDefinition)definition
{
  return self->_definition;
}

- (void)configureResourcesForParameter:(id)a3
{
  id v4 = [a3 resourceManager];
  WFConfigureParameterRelationResources(v4, self);
}

void __122__WFAction_processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    if ([*(id *)(a1 + 32) populatesInputFromInputParameter])
    {
      id v8 = [*(id *)(a1 + 32) populatedInputWithProcessedParameterValues:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  uint64_t v10 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 136315650;
    uint64_t v13 = "-[WFAction processParameterStates:withInput:skippingHiddenParameters:askForValuesIfNecessary:workQueue:complet"
          "ionHandler:]_block_invoke";
    __int16 v14 = 2114;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%s Action %{public}@ finished processing parameter states. Values: %@", (uint8_t *)&v12, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)visibleParametersWithProcessing:(BOOL)a3
{
  os_signpost_id_t v5 = [(WFAction *)self parameters];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__WFAction_Display__visibleParametersWithProcessing___block_invoke;
  v11[3] = &unk_1E6556A08;
  v11[4] = self;
  char v6 = objc_msgSend(v5, "if_flatMap:", v11);

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__WFAction_Display__visibleParametersWithProcessing___block_invoke_2;
  v9[3] = &unk_1E654EA48;
  BOOL v10 = a3;
  void v9[4] = self;
  id v7 = objc_msgSend(v6, "if_objectsPassingTest:", v9);

  return v7;
}

- (NSDictionary)processedParameters
{
  return self->_processedParameters;
}

- (id)prioritizedParameterKeysForRemoteExecution
{
  return 0;
}

- (WFParameter)inputParameter
{
  id v3 = [(WFAction *)self inputParameterKey];
  if (v3)
  {
    id v4 = [(WFAction *)self parametersByKey];
    os_signpost_id_t v5 = [v4 objectForKey:v3];
  }
  else
  {
    os_signpost_id_t v5 = 0;
  }

  return (WFParameter *)v5;
}

- (NSString)inputParameterKey
{
  v2 = [(WFAction *)self inputDictionary];
  id v3 = [v2 objectForKey:@"ParameterKey"];

  return (NSString *)v3;
}

- (NSDictionary)inputDictionary
{
  v2 = [(WFAction *)self definition];
  id v3 = [v2 objectForKey:@"Input"];
  id v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  os_signpost_id_t v5 = v3;

  return v5;
}

id __53__WFAction_Display__visibleParametersWithProcessing___block_invoke(uint64_t a1, void *a2)
{
  v37[5] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (![*(id *)(a1 + 32) shouldInsertExpandingParameterForParameter:v3]) {
    goto LABEL_12;
  }
  id v4 = [*(id *)(a1 + 32) expandingParameters];
  os_signpost_id_t v5 = [v3 key];
  char v6 = [v4 objectForKey:v5];

  if (v6) {
    goto LABEL_11;
  }
  id v7 = NSString;
  id v8 = [v3 key];
  id v9 = [v7 stringWithFormat:@"Show-%@", v8];

  BOOL v10 = [WFParameterDefinition alloc];
  v37[0] = v9;
  v36[0] = @"Key";
  v36[1] = @"Label";
  uint64_t v11 = [v3 localizedLabel];
  int v12 = v11;
  if (!v11)
  {
    uint64_t v13 = [v3 localizedPlaceholder];
    int v12 = &stru_1F229A4D8;
    long long v31 = (void *)v13;
    if (v13) {
      int v12 = (__CFString *)v13;
    }
  }
  v37[1] = v12;
  v36[2] = @"MultipleValueParameterKey";
  __int16 v14 = [v3 key];
  v37[2] = v14;
  v36[3] = @"RequiredResources";
  uint64_t v15 = [v3 definition];
  uint64_t v16 = [v15 objectForKey:@"RequiredResources"];
  id v17 = (void *)v16;
  uint64_t v18 = MEMORY[0x1E4F1CBF0];
  if (v16) {
    uint64_t v18 = v16;
  }
  v36[4] = @"DefaultValue";
  uint64_t v19 = MEMORY[0x1E4F1CC38];
  v37[3] = v18;
  v37[4] = MEMORY[0x1E4F1CC38];
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:5];
  id v21 = [(WFParameterDefinition *)v10 initWithDictionary:v20];

  if (!v11) {
  char v6 = [[WFMultipleValueExpandingParameter alloc] initWithDefinition:v21];
  }
  v34[0] = @"WFParameterKey";
  v34[1] = @"WFParameterValue";
  v35[0] = v9;
  v35[1] = v19;
  v34[2] = @"WFResourceClass";
  uint64_t v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  v35[2] = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];

  __int16 v25 = [(WFResource *)[WFParameterRelationResource alloc] initWithDefinition:v24];
  [(WFParameterRelationResource *)v25 setupWithAction:*(void *)(a1 + 32) parameter:v6];
  uint64_t v26 = [v3 resourceManager];
  [v26 addResource:v25];

  [(WFParameter *)v6 addEventObserver:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) configureResourcesForParameter:v6];
  __int16 v27 = [*(id *)(a1 + 32) expandingParameters];
  long long v28 = [v3 key];
  [v27 setObject:v6 forKey:v28];

  if (v6)
  {
LABEL_11:
    v33[0] = v6;
    v33[1] = v3;
    long long v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  }
  else
  {
LABEL_12:
    id v32 = v3;
    long long v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  }

  return v29;
}

- (BOOL)shouldInsertExpandingParameterForParameter:(id)a3
{
  id v3 = a3;
  if ([v3 allowsMultipleValues]) {
    char v4 = [v3 displaysMultipleValueEditor];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extendedOperation, 0);
  objc_storeStrong((id *)&self->_allowedOnceSmartPromptStates, 0);
  objc_storeStrong((id *)&self->_widgetSizeClass, 0);
  objc_storeStrong((id *)&self->_appResource, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_runningDelegate, 0);
  objc_storeStrong((id *)&self->_processedParameters, 0);
  objc_destroyWeak((id *)&self->_workflow);
  objc_storeStrong((id *)&self->_effectiveWorkQueue, 0);
  objc_storeStrong((id *)&self->_sessionKitAssertion, 0);
  objc_storeStrong((id *)&self->_currentUnevaluatedResourceNodes, 0);
  objc_storeStrong((id *)&self->_currentGeneratedResourceNodes, 0);
  objc_storeStrong((id *)&self->_actionUserInterface, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_ignoredParameterKeysForProcessing, 0);
  objc_storeStrong((id *)&self->_expandingParameters, 0);
  objc_storeStrong((id *)&self->_decodedParameterStates, 0);
  objc_storeStrong((id *)&self->_cachedDefaultParameterStates, 0);
  objc_storeStrong((id *)&self->_encodedSerializedParameters, 0);
  objc_storeStrong((id *)&self->_eventObservers, 0);
  objc_storeStrong((id *)&self->_contentPermissionRequestor, 0);
  objc_storeStrong((id *)&self->_variableSource, 0);
  objc_storeStrong((id *)&self->_userInterface, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_toolInvocation, 0);
  objc_storeStrong((id *)&self->_auxiliaryButton, 0);
  objc_storeStrong((id *)&self->_appDescriptor, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contentAttributionTracker, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_outputContentClasses, 0);
  objc_storeStrong((id *)&self->_inputContentClasses, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_parametersByKey, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

void __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [v6 key];
  char v9 = [*(id *)(a1 + 32) containsObject:v6];
  if (!*(unsigned char *)(a1 + 104) || (v9 & 1) != 0)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_2;
    aBlock[3] = &unk_1E654E718;
    char v73 = v9;
    aBlock[4] = *(void *)(a1 + 40);
    id v10 = v6;
    id v67 = v10;
    id v68 = *(id *)(a1 + 48);
    id v69 = *(id *)(a1 + 56);
    id v11 = v8;
    id v70 = v11;
    id v71 = *(id *)(a1 + 64);
    id v12 = v7;
    id v72 = v12;
    uint64_t v13 = _Block_copy(aBlock);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_3;
    v62[3] = &unk_1E6556B68;
    id v63 = *(id *)(a1 + 72);
    id v14 = v11;
    id v64 = v14;
    id v55 = v12;
    id v65 = v55;
    uint64_t v15 = _Block_copy(v62);
    uint64_t v16 = [*(id *)(a1 + 40) toolInvocation];
    id v56 = v14;
    if (v16)
    {
      id v17 = (void *)v16;
      [*(id *)(a1 + 40) toolInvocation];
      id v52 = v6;
      uint64_t v18 = v8;
      id v19 = v7;
      v21 = uint64_t v20 = v13;
      [v10 key];
      id v22 = v10;
      v24 = uint64_t v23 = v15;
      int v25 = [v21 containsParameterValueForKey:v24];

      uint64_t v15 = v23;
      id v10 = v22;

      uint64_t v13 = v20;
      id v7 = v19;
      id v8 = v18;
      id v14 = v56;
      id v6 = v52;

      if (v25)
      {
        uint64_t v26 = *(void **)(a1 + 40);
        uint64_t v27 = [v26 toolInvocation];
        id v28 = v10;
        long long v29 = (void *)v27;
        [v26 processValueForParameter:v28 withToolKitInvocation:v27 completionHandler:v15];
LABEL_27:

        goto LABEL_28;
      }
    }
    long long v53 = v10;
    uint64_t v30 = [*(id *)(a1 + 80) objectForKeyedSubscript:v14];
    long long v29 = (void *)v30;
    if (!v30)
    {
LABEL_15:
      (*((void (**)(id, void))v55 + 2))(v55, 0);
      goto LABEL_27;
    }
    if (*(void **)(a1 + 88) == v53 && *(unsigned char *)(a1 + 105))
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40)) {
        goto LABEL_15;
      }
      id v48 = (void *)v30;
      v49 = v15;
      id v50 = v13;
      id v51 = v8;
      int v46 = 1;
      uint64_t v34 = 1;
    }
    else
    {
      id v31 = v53;
      id v50 = v13;
      id v51 = v8;
      id v48 = v29;
      v49 = v15;
      if (v31)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v32 = v31;
        }
        else {
          id v32 = 0;
        }
      }
      else
      {
        id v32 = 0;
      }
      id v33 = v32;

      int v46 = [v33 processesIntoContentItems];
      uint64_t v34 = 0;
    }
    id v35 = [WFParameterStateProcessingContext alloc];
    id v36 = [*(id *)(a1 + 40) variableSource];
    id v37 = [*(id *)(a1 + 40) workflow];
    uint64_t v38 = [v37 environment];
    id v39 = [*(id *)(a1 + 40) contentAttributionTracker];
    uint64_t v40 = [*(id *)(a1 + 40) widgetSizeClass];
    id v41 = [(WFParameterStateProcessingContext *)v35 initWithVariableSource:v36 parameter:v53 isInputParameter:v34 environment:v38 contentAttributionTracker:v39 widgetSizeClass:v40];

    uint64_t v13 = v50;
    id v8 = v51;
    long long v29 = v48;
    uint64_t v15 = v49;
    if (v46)
    {
      char v47 = v34;
      id v54 = v41;
      id v42 = [v48 containedVariables];
      id v43 = NSStringFromSelector(sel_type);
      id v44 = [v42 filteredArrayForKey:v43 value:@"Ask"];

      if (![v44 count])
      {
        id v45 = *(void **)(a1 + 40);
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_4;
        v57[3] = &unk_1E654E740;
        char v61 = v47;
        uint64_t v60 = *(void *)(a1 + 96);
        id v58 = v55;
        id v59 = v49;
        LOBYTE(v45) = [v45 getInputContentFromVariablesInParameterState:v48 context:v54 completionHandler:v57];

        if (v45)
        {
          id v41 = v54;
LABEL_26:

          goto LABEL_27;
        }
      }

      id v41 = v54;
    }
    id v44 = [*(id *)(a1 + 72) objectForKey:v56];
    if (v44) {
      (*((void (**)(id, void))v55 + 2))(v55, 0);
    }
    else {
      [v48 processWithContext:v41 userInputRequiredHandler:v50 valueHandler:v49];
    }
    goto LABEL_26;
  }
  (*((void (**)(id, void))v7 + 2))(v7, 0);
LABEL_28:
}

- (WFToolInvocation)toolInvocation
{
  return self->_toolInvocation;
}

- (void)parameterStateValidityCriteriaDidChange:(id)a3
{
  id v4 = [a3 key];
  [(WFAction *)self notifyEventObserversParameterStateDidChangeForKey:v4];
}

- (void)notifyEventObserversParameterStateDidChangeForKey:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_observersLock);
  os_signpost_id_t v5 = [(WFAction *)self eventObservers];
  id v6 = [v5 allObjects];
  id v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_8564];

  os_unfair_lock_unlock(&self->_observersLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v13, "action:parameterStateDidChangeForKey:", self, v4, (void)v14);
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (id)parameterStateForKey:(id)a3
{
  return [(WFAction *)self parameterStateForKey:a3 fallingBackToDefaultValue:1];
}

- (id)createStateForParameter:(id)a3 fromSerializedRepresentation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "stateClass")), "initWithSerializedRepresentation:variableProvider:parameter:", v6, self, v7);

  return v8;
}

- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4
{
  id v6 = _Block_copy(a4);
  id v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  id v8 = a3;
  uint64_t v9 = self;
  sub_1C82A95B4((uint64_t)&unk_1EA516710, (uint64_t)v7);
}

- (id)localizedErrorWithLinkError:(id)a3
{
  v85[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v16 = 0;
    goto LABEL_66;
  }
  os_signpost_id_t v5 = v4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = WFLocalizedString(@"There was a problem applying the Focus filter.");
  id v8 = [(WFAction *)self appDescriptor];
  uint64_t v9 = [v8 localizedName];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    uint64_t v11 = NSString;
    uint64_t v12 = WFLocalizedString(@"There was a problem communicating with the “%@” app.");
    uint64_t v13 = [(WFAction *)self appDescriptor];
    long long v14 = [v13 localizedName];
    long long v15 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v14);
  }
  else
  {
    long long v15 = WFLocalizedString(@"There was a problem communicating with the app.");
  }
  long long v17 = [v5 userInfo];
  uint64_t v18 = [v17 objectForKey:*MEMORY[0x1E4F72810]];

  if (v18)
  {
    id v19 = v18;

    os_signpost_id_t v5 = v19;
  }
  uint64_t v20 = [v5 domain];
  int v21 = [v20 isEqualToString:*MEMORY[0x1E4F72850]];

  if (!v21)
  {
    uint64_t v23 = [v5 domain];
    int v24 = [v23 isEqualToString:*MEMORY[0x1E4F728D0]];

    if (v24)
    {
      switch([v5 code])
      {
        case 2000:
          long long v62 = LNPerformActionErrorCodeAsString();
          id v63 = [NSString stringWithFormat:@"%@: ", v62];
          id v36 = [v5 localizedDescription];
          if (![v36 length]) {
            goto LABEL_87;
          }
          [v5 localizedDescription];
          id v64 = v81 = v62;
          int v65 = [v64 hasPrefix:v63];

          long long v62 = v81;
          if (!v65) {
            goto LABEL_88;
          }
          id v66 = [v5 localizedDescription];
          objc_msgSend(v66, "substringFromIndex:", objc_msgSend(v63, "length"));
          id v36 = (id)objc_claimAutoreleasedReturnValue();

          if ([v36 length])
          {

            goto LABEL_54;
          }
LABEL_87:

LABEL_88:
LABEL_89:
          if (isKindOfClass)
          {
LABEL_16:
            id v25 = v7;
            goto LABEL_53;
          }
          break;
        case 2001:
        case 2002:
        case 2003:
        case 2004:
        case 2006:
        case 2008:
        case 2011:
        case 2012:
        case 2013:
          if ((isKindOfClass & 1) == 0) {
            goto LABEL_22;
          }
          goto LABEL_16;
        case 2005:
          id v67 = [v5 userInfo];
          id v68 = [v67 objectForKeyedSubscript:*MEMORY[0x1E4F728D8]];

          id v69 = [(WFAction *)self parameterForKey:v68];
          id v70 = [v69 localizedLabel];

          if (isKindOfClass)
          {
            id v36 = v7;
          }
          else
          {
            id v74 = NSString;
            id v75 = WFLocalizedString(@"The action “%1$@” could not run because a value was not provided for the “%2$@” parameter.");
            uint64_t v76 = [(WFAction *)self localizedName];
            id v77 = (void *)v76;
            if (v70) {
              v78 = v70;
            }
            else {
              v78 = v68;
            }
            objc_msgSend(v74, "localizedStringWithFormat:", v75, v76, v78);
            id v36 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_54;
        case 2007:
          id v16 = [MEMORY[0x1E4F28C58] userCancelledError];
          id v36 = 0;
          goto LABEL_65;
        case 2009:
        case 2014:
          id v25 = [v5 localizedDescription];
          goto LABEL_53;
        case 2010:
          id v37 = NSString;
          uint64_t v38 = @"The action “%@” could not run because it was cancelled.";
          goto LABEL_23;
        default:
          goto LABEL_89;
      }
LABEL_90:
      id v37 = NSString;
      uint64_t v38 = @"The action “%@” could not run because an unknown error occurred.";
      goto LABEL_23;
    }
    uint64_t v26 = [v5 domain];
    int v27 = [v26 isEqualToString:*MEMORY[0x1E4F72858]];

    if (!v27)
    {
      id v36 = 0;
      goto LABEL_54;
    }
    id v28 = self;
    if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if ([v5 code] == 1)
      {
        long long v29 = NSString;
        uint64_t v30 = WFLocalizedString(@"Unable to load options due to the %@ parameter not being set.");
        BOOL v80 = [(WFAction *)v28 metadata];
        BOOL v79 = [v80 parameters];
        v82[0] = MEMORY[0x1E4F143A8];
        v82[1] = 3221225472;
        v82[2] = __61__WFAction_LinkLocalizedErrors__localizedErrorWithLinkError___block_invoke;
        v82[3] = &unk_1E6555E18;
        id v83 = v5;
        id v31 = objc_msgSend(v79, "if_firstObjectPassingTest:", v82);
        id v32 = [v31 title];
        id v33 = objc_msgSend(v32, "wf_localizedString");
        uint64_t v34 = v29;
        id v35 = (void *)v30;
        objc_msgSend(v34, "localizedStringWithFormat:", v30, v33);
        id v36 = (id)objc_claimAutoreleasedReturnValue();

LABEL_33:
        goto LABEL_54;
      }
    }
    else
    {

      id v28 = 0;
    }
    id v36 = 0;
    goto LABEL_33;
  }
  uint64_t v22 = [v5 code];
  if (v22 <= 1099)
  {
    switch(v22)
    {
      case 1001:
      case 1007:
      case 1008:
      case 1009:
      case 1010:
      case 1011:
      case 1012:
      case 1013:
        goto LABEL_11;
      case 1002:
        if (isKindOfClass) {
          goto LABEL_52;
        }
        id v37 = NSString;
        uint64_t v38 = @"The action “%@” was interrupted because it didn't finish executing in time.";
        goto LABEL_23;
      case 1003:
      case 1004:
      case 1005:
        if (isKindOfClass) {
          goto LABEL_52;
        }
        id v41 = NSString;
        id v43 = @"The action “%1$@” could not run because the “%2$@” app quit unexpectedly.";
        goto LABEL_81;
      case 1006:
        id v37 = NSString;
        uint64_t v38 = @"The action “%@” could not run because it is not supported on this platform.";
        goto LABEL_23;
      default:
        goto LABEL_51;
    }
  }
  if (v22 > 1399)
  {
    switch(v22)
    {
      case 1400:
        goto LABEL_11;
      case 1700:
        id v44 = [(WFAction *)self appDescriptor];
        id v45 = [v44 localizedName];
        uint64_t v46 = [v45 length];

        if (!v46)
        {
          if (isKindOfClass)
          {
            WFLocalizedString(@"Focus filter could not be applied. Open the app to continue.");
            id v25 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_53;
          }
          id v37 = NSString;
          uint64_t v38 = @"The action “%@” could not run. Open the app to continue.";
          goto LABEL_23;
        }
        id v41 = NSString;
        if (isKindOfClass)
        {
          id v42 = @"Focus filter could not be applied. Open %@ to continue.";
          goto LABEL_48;
        }
        id v43 = @"The action “%1$@” could not run. Open %2$@ to continue.";
        break;
      case 2400:
        id v41 = NSString;
        if (isKindOfClass)
        {
          id v42 = @"Focus filter could not be applied. %@ is locked.";
LABEL_48:
          char v47 = WFLocalizedString(v42);
          id v48 = [(WFAction *)self appDescriptor];
          v49 = [v48 localizedName];
          uint64_t v50 = objc_msgSend(v41, "localizedStringWithFormat:", v47, v49);

          id v36 = 0;
          long long v15 = (void *)v50;
          goto LABEL_54;
        }
        id v43 = @"The action “%1$@” could not run because %2$@ is locked.";
        break;
      default:
        goto LABEL_51;
    }
LABEL_81:
    id v39 = WFLocalizedString(v43);
    id v71 = [(WFAction *)self localizedName];
    id v72 = [(WFAction *)self appDescriptor];
    char v73 = [v72 localizedName];
    objc_msgSend(v41, "localizedStringWithFormat:", v39, v71, v73);
    id v36 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_24;
  }
  if (v22 != 1100 && v22 != 1200)
  {
    if (v22 != 1300)
    {
LABEL_51:
      if (isKindOfClass) {
        goto LABEL_52;
      }
      goto LABEL_90;
    }
LABEL_11:
    if ((isKindOfClass & 1) == 0)
    {
LABEL_22:
      id v37 = NSString;
      uint64_t v38 = @"The action “%@” could not run because an internal error occurred.";
LABEL_23:
      id v39 = WFLocalizedString(v38);
      uint64_t v40 = [(WFAction *)self localizedName];
      objc_msgSend(v37, "localizedStringWithFormat:", v39, v40);
      id v36 = (id)objc_claimAutoreleasedReturnValue();

LABEL_24:
      goto LABEL_54;
    }
    goto LABEL_52;
  }
  if ((isKindOfClass & 1) == 0)
  {
    id v37 = NSString;
    uint64_t v38 = @"The action “%@” could not run because Shortcuts couldn't communicate with the app.";
    goto LABEL_23;
  }
LABEL_52:
  id v25 = v15;
  long long v15 = v25;
LABEL_53:
  id v36 = v25;
LABEL_54:
  id v51 = objc_msgSend(v5, "ln_staticDeferredLocalizedString");
  id v52 = v51;
  if (v51)
  {
    [v51 localizedStringForLocaleIdentifier:0];
    long long v53 = v36;
    id v36 = (id)objc_claimAutoreleasedReturnValue();
LABEL_56:

    goto LABEL_57;
  }
  if (VCIsInternalBuild())
  {
    id v59 = [v5 userInfo];
    long long v53 = [v59 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];

    if (v53 && ([v36 isEqualToString:v53] & 1) == 0)
    {
      uint64_t v60 = [NSString stringWithFormat:@"%@ [Internal Only: %@]", v36, v53];

      id v36 = (id)v60;
    }
    goto LABEL_56;
  }
LABEL_57:
  if (v36)
  {
    id v54 = [v5 userInfo];
    uint64_t v84 = *MEMORY[0x1E4F28568];
    v85[0] = v36;
    id v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:&v84 count:1];
    id v56 = objc_msgSend(v54, "if_dictionaryByAddingEntriesFromDictionary:", v55);

    long long v57 = (void *)MEMORY[0x1E4F28C58];
    id v58 = [v5 domain];
    objc_msgSend(v57, "errorWithDomain:code:userInfo:", v58, objc_msgSend(v5, "code"), v56);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v16 = v5;
  }

LABEL_65:
LABEL_66:
  return v16;
}

uint64_t __61__WFAction_LinkLocalizedErrors__localizedErrorWithLinkError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 name];
  id v4 = [*(id *)(a1 + 32) userInfo];
  os_signpost_id_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F72860]];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

- (void)setExtendedOperation:(id)a3
{
}

- (WFActionExtendedOperation)extendedOperation
{
  return self->_extendedOperation;
}

- (void)setDidRunRemotely:(BOOL)a3
{
  self->_didRunRemotely = a3;
}

- (BOOL)didRunRemotely
{
  return self->_didRunRemotely;
}

- (void)setAllowedOnceSmartPromptStates:(id)a3
{
}

- (NSSet)allowedOnceSmartPromptStates
{
  return self->_allowedOnceSmartPromptStates;
}

- (void)setWidgetSizeClass:(id)a3
{
}

- (NSString)widgetSizeClass
{
  return self->_widgetSizeClass;
}

- (void)setAppResource:(id)a3
{
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setProcessedParameters:(id)a3
{
}

- (WFWorkflow)workflow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  return (WFWorkflow *)WeakRetained;
}

- (void)setEffectiveWorkQueue:(id)a3
{
}

- (void)setSessionKitAssertion:(id)a3
{
}

- (WFSessionKitAssertion)sessionKitAssertion
{
  return self->_sessionKitAssertion;
}

- (os_unfair_lock_s)resourceManagerLock
{
  return self->_resourceManagerLock;
}

- (os_unfair_lock_s)observersLock
{
  return self->_observersLock;
}

- (void)setCurrentUnevaluatedResourceNodes:(id)a3
{
}

- (NSArray)currentUnevaluatedResourceNodes
{
  return self->_currentUnevaluatedResourceNodes;
}

- (NSArray)currentGeneratedResourceNodes
{
  return self->_currentGeneratedResourceNodes;
}

- (void)setActionUserInterface:(id)a3
{
}

- (WFActionRemoteUserInterface)actionUserInterface
{
  return self->_actionUserInterface;
}

- (os_unfair_lock_s)parameterStateDeserializationLock
{
  return self->_parameterStateDeserializationLock;
}

- (os_unfair_lock_s)parameterInitializationLock
{
  return self->_parameterInitializationLock;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setIgnoredParameterKeysForProcessing:(id)a3
{
}

- (NSMutableDictionary)expandingParameters
{
  return self->_expandingParameters;
}

- (void)setContentPermissionRequestor:(id)a3
{
}

- (void)setVariableSource:(id)a3
{
}

- (WFVariableDataSource)variableSource
{
  return self->_variableSource;
}

- (void)setUserInterface:(id)a3
{
}

- (void)setOutput:(id)a3
{
}

- (WFContentCollection)input
{
  return self->_input;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (void)setInputParameterUnlocked:(BOOL)a3
{
  self->_inputParameterUnlocked = a3;
}

- (BOOL)inputParameterUnlocked
{
  return self->_inputParameterUnlocked;
}

- (void)setToolInvocation:(id)a3
{
}

- (void)setAuxiliaryButton:(id)a3
{
}

- (WFActionAuxiliaryButton)auxiliaryButton
{
  return self->_auxiliaryButton;
}

- (void)setAppDescriptor:(id)a3
{
}

- (void)setContentAttributionTracker:(id)a3
{
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (BOOL)canOfferSuggestionsForParameterWithKey:(id)a3
{
  return 0;
}

- (void)fetchSuggestedEntititiesForParameterWithKey:(id)a3 completionHandler:(id)a4
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a4;
  os_signpost_id_t v5 = WFLocalizedString(@"Suggestions Not Found");
  uint64_t v6 = WFLocalizedString(@"The specified action has no suggestions available");
  id v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v11[0] = *MEMORY[0x1E4F28588];
  v11[1] = v8;
  v12[0] = v5;
  v12[1] = v6;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  uint64_t v10 = [v7 errorWithDomain:@"WFActionErrorDomain" code:5 userInfo:v9];

  v4[2](v4, 0, v10);
}

- (id)systemEntityCollectionIdentifierForDisambiguatingParameterWithKey:(id)a3
{
  id v3 = [(WFAction *)self parameterStateForKey:a3];
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
  uint64_t v6 = [v5 variable];

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

  uint64_t v9 = [v8 collectionFilter];

  uint64_t v10 = [v9 systemEntityCollectionIdentifier];

  return v10;
}

- (BOOL)synchronouslyHandleTestingEvent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(WFAction *)self isTesting])
  {
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    uint64_t v15 = 0;
    id v16 = &v15;
    uint64_t v17 = 0x3032000000;
    uint64_t v18 = __Block_byref_object_copy__8356;
    id v19 = __Block_byref_object_dispose__8357;
    id v20 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __50__WFAction_synchronouslyHandleTestingEvent_error___block_invoke;
    v11[3] = &unk_1E654E9F8;
    uint64_t v13 = &v21;
    long long v14 = &v15;
    id v8 = v7;
    uint64_t v12 = v8;
    [(WFAction *)self handleTestingEvent:v6 completionHandler:v11];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    if (a4) {
      *a4 = (id) v16[5];
    }
    BOOL v9 = *((unsigned char *)v22 + 24) != 0;

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

void __50__WFAction_synchronouslyHandleTestingEvent_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)handleTestingEvent:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  dispatch_semaphore_t v7 = [(WFAction *)self runningDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    BOOL v9 = [(WFAction *)self runningDelegate];
    [v9 action:self handleTestingEvent:v10 completionHandler:v6];
  }
  else
  {
    v6[2](v6, 1, 0);
  }
}

- (BOOL)isTesting
{
  id v3 = [(WFAction *)self runningDelegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(WFAction *)self runningDelegate];
  char v6 = [v5 isTesting];

  return v6;
}

- (BOOL)takeSessionKitAssertionIfNeededWithError:(id *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = getWFSessionKitLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    long long v14 = "-[WFAction takeSessionKitAssertionIfNeededWithError:]";
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEBUG, "%s Trying to see if we should take a session assertion...", (uint8_t *)&v13, 0xCu);
  }

  char v6 = [(WFAction *)self sessionKitSessionInvocationType];
  int v7 = [v6 isEqualToString:@"Manual"];

  if (v7)
  {
    char v8 = getWFSessionKitLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      long long v14 = "-[WFAction takeSessionKitAssertionIfNeededWithError:]";
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s Action says it's going to take assertion itself...", (uint8_t *)&v13, 0xCu);
    }
LABEL_13:
    BOOL v11 = 1;
    goto LABEL_14;
  }
  char v8 = [(WFAction *)self sessionKitSessionConfiguration];
  BOOL v9 = getWFSessionKitLogObject();
  id v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315138;
      long long v14 = "-[WFAction takeSessionKitAssertionIfNeededWithError:]";
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEBUG, "%s It doesn't look like we are dealing with a session here. See you later!", (uint8_t *)&v13, 0xCu);
    }

    char v8 = 0;
    goto LABEL_13;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    long long v14 = "-[WFAction takeSessionKitAssertionIfNeededWithError:]";
    _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%s Found a session configuration! Taking it...", (uint8_t *)&v13, 0xCu);
  }

  BOOL v11 = [(WFAction *)self allowSessionKitSessionsIfNeededWithConfiguration:v8 isManualInvocation:0 error:a3];
LABEL_14:

  return v11;
}

- (BOOL)allowSessionKitSessionsIfNeededWithConfiguration:(id)a3 error:(id *)a4
{
  return [(WFAction *)self allowSessionKitSessionsIfNeededWithConfiguration:a3 isManualInvocation:1 error:a4];
}

- (BOOL)allowSessionKitSessionsIfNeededWithConfiguration:(id)a3 isManualInvocation:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!v9)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WFAction.m", 2958, @"Invalid parameter not satisfying: %@", @"sessionConfiguration" object file lineNumber description];
  }
  id v10 = [(WFAction *)self sessionKitAssertion];

  if (v10)
  {
    char v11 = 1;
  }
  else
  {
    uint64_t v12 = [(WFAction *)self sessionKitSessionInvocationType];
    int v13 = v12;
    if (v12)
    {
      if (v6 && ([v12 isEqualToString:@"Manual"] & 1) == 0)
      {
        long long v14 = getWFSessionKitLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          id v32 = "-[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:]";
          _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_FAULT, "%s Tried to manually invoke a session, but the session invocation type is not manual?", buf, 0xCu);
        }
        char v11 = 0;
      }
      else
      {
        long long v14 = [v9 bundleIdentifier];
        uint64_t v15 = getWFSessionKitLogObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          id v32 = "-[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:]";
          __int16 v33 = 2112;
          uint64_t v34 = v14;
          _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_DEFAULT, "%s Attempting to take SessionKit assertion for %@...", buf, 0x16u);
        }

        id v16 = [[WFActionWillTakeSessionKitAssertionTestingEvent alloc] initWithAction:self sessionConfiguration:v9];
        if ([(WFAction *)self synchronouslyHandleTestingEvent:v16 error:a5])
        {
          uint64_t v17 = [[WFSessionKitAssertion alloc] initWithBundleIdentifier:v14];
          uint64_t v18 = [(WFAction *)self runningDelegate];
          objc_initWeak((id *)buf, self);
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __86__WFAction_allowSessionKitSessionsIfNeededWithConfiguration_isManualInvocation_error___block_invoke;
          v26[3] = &unk_1E654E9D0;
          objc_copyWeak(v30, (id *)buf);
          id v19 = v18;
          id v27 = v19;
          id v28 = v14;
          v30[1] = (id)a2;
          id v29 = v9;
          [(WFSessionKitAssertion *)v17 setResultHandler:v26];
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __86__WFAction_allowSessionKitSessionsIfNeededWithConfiguration_isManualInvocation_error___block_invoke_577;
          v23[3] = &unk_1E65510D0;
          objc_copyWeak(&v25, (id *)buf);
          id v20 = v19;
          id v24 = v20;
          [(WFSessionKitAssertion *)v17 setFailureHandler:v23];
          char v11 = [(WFSessionKitAssertion *)v17 takeWithError:a5];
          [(WFAction *)self setSessionKitAssertion:v17];
          [(WFAction *)self setExtendedOperation:v17];

          objc_destroyWeak(&v25);
          objc_destroyWeak(v30);
          objc_destroyWeak((id *)buf);
        }
        else
        {
          char v11 = 0;
        }
      }
    }
    else
    {
      char v11 = 1;
    }
  }
  return v11;
}

void __86__WFAction_allowSessionKitSessionsIfNeededWithConfiguration_isManualInvocation_error___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  char v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setSessionKitAssertion:0];
  [*(id *)(a1 + 32) action:WeakRetained didDecideRunningProgressIsAllowed:a3 ^ 1u];
  id v10 = getWFSessionKitLogObject();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((a3 & 1) == 0)
  {
    if (v11)
    {
      uint64_t v15 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      id v37 = "-[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:]_block_invoke";
      __int16 v38 = 2112;
      id v39 = v15;
      uint64_t v12 = "%s SessionKit assertion was granted, but %@ did not start a session. Bummer!";
      int v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 22;
LABEL_13:
      _os_log_impl(&dword_1C7F0A000, v13, v14, v12, buf, v16);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (v11)
  {
    *(_DWORD *)buf = 136315138;
    id v37 = "-[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%s SessionKit session started, have fun!", buf, 0xCu);
  }

  if (![v7 count])
  {
    id v10 = getWFSessionKitLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v37 = "-[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:]_block_invoke";
      uint64_t v12 = "%s Session started, but we don't have an identifier for it?";
      int v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_FAULT;
      goto LABEL_12;
    }
LABEL_14:

    v8[2](v8);
    goto LABEL_15;
  }
  if ((unint64_t)[v7 count] >= 2)
  {
    id v10 = getWFSessionKitLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v37 = "-[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:]_block_invoke";
      uint64_t v12 = "%s We allowed the app to start a session, but it started multiple. We don't know which one to toast!";
      int v13 = v10;
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
LABEL_12:
      uint32_t v16 = 12;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if ([v7 count] != 1)
  {
    __int16 v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:*(void *)(a1 + 64) object:WeakRetained file:@"WFAction.m" lineNumber:3015 description:@"Should have only one session identifier"];
  }
  uint64_t v17 = [v7 firstObject];
  id v18 = (id)*MEMORY[0x1E4FB4F90];
  id v19 = [WeakRetained runningDelegate];
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    uint64_t v21 = [WeakRetained runningDelegate];
    uint64_t v22 = [v21 currentRunningContextForAction:WeakRetained];

    uint64_t v23 = [v22 runSource];
    id v24 = v23;
    if (v23)
    {
      id v25 = v23;

      id v18 = v25;
    }
  }
  [*(id *)(a1 + 48) toastDurationForRunSource:v18];
  double v27 = v26;
  id v28 = getWFSessionKitLogObject();
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
  if (v27 == 0.0)
  {
    if (v29)
    {
      id v31 = [WeakRetained identifier];
      *(_DWORD *)buf = 136315650;
      id v37 = "-[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:]_block_invoke_2";
      __int16 v38 = 2112;
      id v39 = v17;
      __int16 v40 = 2114;
      id v41 = v31;
      _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_DEFAULT, "%s We'd toast the session %@, but the action is asking for no toasting (see SessionConfiguration#ToastDuration key in the action definition %{public}@)", buf, 0x20u);
    }
  }
  else
  {
    if (v29)
    {
      uint64_t v30 = [WeakRetained identifier];
      *(_DWORD *)buf = 136315650;
      id v37 = "-[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:]_block_invoke";
      __int16 v38 = 2112;
      id v39 = v17;
      __int16 v40 = 2114;
      id v41 = v30;
      _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_DEFAULT, "%s Asking the daemon to toast the session %@ for action %{public}@", buf, 0x20u);
    }
    if (v27 == -1.0)
    {
      id v28 = 0;
    }
    else
    {
      id v28 = [NSNumber numberWithDouble:v27];
    }
    id v32 = [MEMORY[0x1E4FB4540] standardClient];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __86__WFAction_allowSessionKitSessionsIfNeededWithConfiguration_isManualInvocation_error___block_invoke_574;
    void v34[3] = &unk_1E6554EC8;
    uint64_t v35 = v8;
    [v32 toastSessionKitSessionWithIdentifier:v17 forDuration:v28 completion:v34];
  }
LABEL_15:
}

void __86__WFAction_allowSessionKitSessionsIfNeededWithConfiguration_isManualInvocation_error___block_invoke_577(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setSessionKitAssertion:0];
  id v5 = getWFSessionKitLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[WFAction allowSessionKitSessionsIfNeededWithConfiguration:isManualInvocation:error:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Failed to start SessionKit session: %@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 32) action:WeakRetained didDecideRunningProgressIsAllowed:1];
  [WeakRetained finishRunningWithError:v3];
}

uint64_t __86__WFAction_allowSessionKitSessionsIfNeededWithConfiguration_isManualInvocation_error___block_invoke_574(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSString)externalMetricsActionIdentifier
{
  return 0;
}

- (NSString)externalMetricsBundleIdentifier
{
  return 0;
}

- (void)matchContextualAction:(id)a3 toContentCollection:(id)a4 completionHandler:(id)a5
{
}

- (id)contextualActionsForSurface:(unint64_t)a3
{
  return 0;
}

- (WFContactStore)contactStore
{
  v2 = [(WFAction *)self contentPermissionRequestor];
  id v3 = [v2 contactStore];

  return (WFContactStore *)v3;
}

- (void)setDefaultCoercionOptionsOnInputs
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(WFAction *)self setDefaultCoercionOptionsOnContentCollection:self->_input];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(WFAction *)self processedParameters];
  char v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(WFAction *)self setDefaultCoercionOptionsOnContentCollection:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setDefaultCoercionOptionsOnContentCollection:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  char v4 = (void *)MEMORY[0x1E4F5A7D8];
  uint64_t v9 = *MEMORY[0x1E4F5AAC8];
  id v5 = a3;
  uint64_t v6 = [(WFAction *)self contentPermissionRequestor];
  v10[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v8 = [v4 optionsWithDictionary:v7];

  [v5 setDefaultCoercionOptions:v8];
}

- (id)minimumSupportedClientVersion
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(WFAction *)self containedVariables];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    uint64_t v6 = @"411";
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      if ([*(id *)(*((void *)&v9 + 1) + 8 * v7) requiresModernVariableSupport]) {
        break;
      }
      if (v4 == ++v7)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        uint64_t v6 = @"0";
        break;
      }
    }
  }
  else
  {
    uint64_t v6 = @"0";
  }

  return v6;
}

- (BOOL)runningInStepWiseExecutor
{
  uint64_t v3 = [(WFAction *)self runningDelegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(WFAction *)self runningDelegate];
  uint64_t v6 = [v5 currentRunningContextForAction:self];

  LOBYTE(v5) = [v6 isStepwise];
  return (char)v5;
}

- (NSString)localizedDefaultDisambiguationPrompt
{
  return (NSString *)WFLocalizedString(@"Which one?");
}

- (BOOL)requiresUserInteractionWhenRunWithInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self resourceManager];
  BOOL v6 = ([v5 currentlyRequiresResourceOfClass:objc_opt_class()] & 1) != 0
    || ![v5 resourcesAvailable]
    || [(WFAction *)self showsImplicitChooseFromListWhenRunWithInput:v4];

  return v6;
}

- (BOOL)showsImplicitChooseFromListWhenRunWithInput:(id)a3
{
  if ([a3 numberOfItems] < 2 || -[WFAction inputsMultipleItems](self, "inputsMultipleItems")) {
    return 0;
  }
  uint64_t v5 = [(WFAction *)self inputContentClasses];
  BOOL v4 = [v5 count] != 0;

  return v4;
}

- (NSArray)supportedAppIdentifiers
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [(WFAction *)self appDescriptor];
  uint64_t v3 = [v2 bundleIdentifier];
  if (v3)
  {
    BOOL v4 = [v2 bundleIdentifier];
    v7[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSArray *)v5;
}

- (BOOL)allowsAnyURLDestinationWhenAddedToWorkflowByUser
{
  return 0;
}

- (void)unlockAppProtectionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self appDescriptor];
  BOOL v6 = [v5 bundleIdentifier];

  uint64_t v7 = [(WFAction *)self userInterface];
  int v8 = [v7 isRunningWithExternalUI];

  if (v8)
  {
    long long v9 = [(WFAction *)self userInterface];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__WFAction_unlockAppProtectionWithCompletionHandler___block_invoke;
    v15[3] = &unk_1E6557E58;
    v15[4] = self;
    id v16 = v4;
    id v10 = v4;
    [v9 handleAppProtectionRequestWithBundleIdentifier:v6 completionHandler:v15];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F4B7E0] applicationWithBundleIdentifier:v6];
    long long v11 = [MEMORY[0x1E4F4B7E8] sharedGuard];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__WFAction_unlockAppProtectionWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E6558110;
    id v14 = v4;
    id v12 = v4;
    [v11 authenticateForSubject:v10 completion:v13];
  }
}

uint64_t __53__WFAction_unlockAppProtectionWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

uint64_t __53__WFAction_unlockAppProtectionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)smartPromptSubtitleWithPreviousContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    int v8 = NSString;
    if (v7)
    {
      long long v9 = WFLocalizedString(@"Previously this shortcut was allowed to share %1$@ with “%2$@”.");
      objc_msgSend(v8, "localizedStringWithFormat:", v9, v6, v7);
    }
    else
    {
      long long v9 = WFLocalizedString(@"Previously this shortcut was allowed to share %1$@.");
      objc_msgSend(v8, "localizedStringWithFormat:", v9, v6, v12);
    id v10 = };
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = getWFSecurityLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    uint64_t v12 = [(WFAction *)self identifier];
    *(_DWORD *)buf = 136315394;
    uint64_t v21 = "-[WFAction smartPromptWithContentDescription:contentDestination:workflowName:]";
    __int16 v22 = 2114;
    uint64_t v23 = v12;
    _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_FAULT, "%s Action %{public}@ is presenting a smart prompt, but it does not have a custom smart prompt string.", buf, 0x16u);
  }
  if (v8)
  {
    long long v13 = NSString;
    id v14 = WFLocalizedString(@"Allow “%@” to share %@ with “%@”?");
    objc_msgSend(v13, "localizedStringWithFormat:", v14, v10, v8, v9);
  }
  else
  {
    uint64_t v15 = NSString;
    if (v9)
    {
      id v14 = WFLocalizedString(@"Allow “%@” to access “%@”?");
      objc_msgSend(v15, "localizedStringWithFormat:", v14, v10, v9, v19);
    }
    else
    {
      id v14 = WFLocalizedString(@"Allow “%@” to access another app?");
      objc_msgSend(v15, "localizedStringWithFormat:", v14, v10, v18, v19);
    }
  id v16 = };

  return v16;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v7 = 0;
  id v4 = (void (**)(id, void *, id))a3;
  uint64_t v5 = [(WFAction *)self contentDestinationWithError:&v7];
  id v6 = v7;
  v4[2](v4, v5, v6);
}

- (id)contentDestinationWithError:(id *)a3
{
  uint64_t v4 = [(WFAction *)self appDescriptor];
  if (!v4) {
    goto LABEL_3;
  }
  uint64_t v5 = (void *)v4;
  id v6 = [(WFAction *)self appDescriptor];
  id v7 = [v6 bundleIdentifier];
  WFMCIsAppAccountBasedSourceForOpenIn(v7);
  char v9 = v8;

  if ((v9 & 1) == 0)
  {
LABEL_3:
    id v10 = [(WFAction *)self appDescriptor];
    if (!v10) {
      goto LABEL_10;
    }
    BOOL v11 = [(WFAction *)self locallyProcessesData];

    if (!v11)
    {
      BOOL v12 = [(WFAction *)self highRisk];
      long long v13 = (void *)MEMORY[0x1E4F5A788];
      id v14 = [(WFAction *)self appDescriptor];
      if (v12) {
        [v13 locationWithAppDescriptor:v14 promptingBehaviour:1];
      }
      else {
      id v10 = [v13 locationWithAppDescriptor:v14];
      }

      goto LABEL_10;
    }
  }
  id v10 = 0;
LABEL_10:
  return v10;
}

- (id)actionForAppIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self displayableAppDescriptor];
  id v6 = [v5 bundleIdentifier];

  LODWORD(v5) = [v6 isEqualToString:v4];
  if (v5) {
    id v7 = self;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (void)snapInputParameterIfNecessary
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(WFAction *)self inputParameter];
  if (!v3 || ![(WFAction *)self inputParameterUnlocked]) {
    goto LABEL_18;
  }
  id v4 = [(WFAction *)self workflow];
  uint64_t v5 = [(WFAction *)self inheritedInputVariableInWorkflow:v4];

  id v6 = [v3 key];
  id v7 = [(WFAction *)self parameterStateForKey:v6 fallingBackToDefaultValue:0];

  if (!v5) {
    goto LABEL_14;
  }
  char v8 = getWFGeneralLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315650;
    uint64_t v17 = "-[WFAction snapInputParameterIfNecessary]";
    __int16 v18 = 2114;
    uint64_t v19 = v5;
    __int16 v20 = 2114;
    uint64_t v21 = self;
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s Found input variable: %{public}@, for action: %{public}@", (uint8_t *)&v16, 0x20u);
  }

  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    id v9 = v7;
    id v10 = [v9 variable];
    BOOL v11 = [v9 stateByReplacingVariable:v10 withVariable:v5];

    if (v11) {
      goto LABEL_15;
    }
  }
  BOOL v12 = (objc_class *)[v3 stateClass];
  if (![(objc_class *)v12 instancesRespondToSelector:sel_initWithVariable_])
  {
    long long v13 = getWFGeneralLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = NSStringFromClass(v12);
      int v16 = 136315394;
      uint64_t v17 = "-[WFAction snapInputParameterIfNecessary]";
      __int16 v18 = 2114;
      uint64_t v19 = v14;
      _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Unsupported parameter state type for input variable: %{public}@", (uint8_t *)&v16, 0x16u);
    }
LABEL_14:
    BOOL v11 = 0;
    goto LABEL_15;
  }
  BOOL v11 = (void *)[[v12 alloc] initWithVariable:v5];
LABEL_15:
  if (([v7 isEqual:v11] & 1) == 0)
  {
    uint64_t v15 = [v3 key];
    [(WFAction *)self setParameterState:v11 forKey:v15];

    [(WFAction *)self setInputParameterUnlocked:1];
  }

LABEL_18:
}

- (void)lockInputParameter
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(WFAction *)self inputParameterUnlocked])
  {
    uint64_t v3 = getWFGeneralLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315394;
      uint64_t v5 = "-[WFAction lockInputParameter]";
      __int16 v6 = 2114;
      id v7 = self;
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEFAULT, "%s Locking input parameter of action: %{public}@", (uint8_t *)&v4, 0x16u);
    }

    [(WFAction *)self setInputParameterUnlocked:0];
  }
}

- (void)unlockInputParameter
{
  if (![(WFAction *)self inputParameterUnlocked])
  {
    uint64_t v3 = [(WFAction *)self inputParameter];
    if (v3)
    {
      id v4 = v3;
      [(WFAction *)self setInputParameterUnlocked:1];
      uint64_t v3 = v4;
    }
  }
}

- (BOOL)isLastAction
{
  uint64_t v3 = [(WFAction *)self workflow];
  id v4 = [v3 actions];

  if (v4)
  {
    uint64_t v5 = [v4 indexOfObject:self];
    BOOL v6 = v5 == [v4 count] - 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isDisabledWhenRunOnDevice:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self resourceManager];
  BOOL v6 = [v5 resourceObjectsOfClass:objc_opt_class()];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        if (![*(id *)(*((void *)&v28 + 1) + 8 * i) isAvailable])
        {
          char v22 = 1;
          id v14 = v7;
          goto LABEL_26;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  BOOL v12 = [(WFAction *)self resourceManager];
  long long v13 = [v12 resourceObjectsOfClass:objc_opt_class()];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    while (2)
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "isAvailable", (void)v24))
        {
          char v22 = 1;
          uint64_t v19 = v14;
          goto LABEL_25;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  uint64_t v19 = [(WFAction *)self disabledOnPlatforms];
  if ([v19 count])
  {
    unint64_t v20 = [v4 idiom];
    if (v20 >= 6)
    {
      uint64_t v21 = 0;
      char v22 = 0;
    }
    else
    {
      uint64_t v21 = off_1E65521A8[v20];
      char v22 = [v19 containsObject:v21];
    }
  }
  else
  {
    char v22 = 0;
  }
LABEL_25:

LABEL_26:
  return v22;
}

- (BOOL)requiresHandoffWhenRunWithUserInterfaceType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self userInterface];
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = [(WFAction *)self userInterface];
    char v7 = [v6 shouldNotHandoff];

    if (v7) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v8 = [(WFAction *)self resourceManager];
  int v9 = [v8 currentlyRequiresResourceOfClass:objc_opt_class()];

  if (!v9)
  {
LABEL_8:
    LOBYTE(v11) = 0;
    goto LABEL_13;
  }
  uint64_t v10 = [(WFAction *)self userInterfaceTypes];
  if ([v10 count])
  {
    int v11 = [v10 containsObject:v4] ^ 1;
  }
  else if (v4)
  {
    LOBYTE(v11) = [v4 isEqualToString:*MEMORY[0x1E4F5ABF0]];
  }
  else
  {
    LOBYTE(v11) = 1;
  }

LABEL_13:
  return v11;
}

- (BOOL)supportsUserInterfaceType:(id)a3
{
  return ![(WFAction *)self requiresHandoffWhenRunWithUserInterfaceType:a3];
}

- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WFAction *)self inputTypePassthrough])
  {
    uint64_t v8 = [v6 actions];
    uint64_t v9 = [v8 indexOfObject:self];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v10 = v9;
      if (!v9)
      {
        int v11 = [(WFAction *)self workflow];
        uint64_t v12 = [v11 effectiveInputClasses];
LABEL_17:
        uint64_t v17 = (void *)v12;
LABEL_18:

        goto LABEL_19;
      }
      if (([v7 containsObject:self] & 1) == 0)
      {
        [v7 addObject:self];
        int v11 = [v8 objectAtIndex:v10 - 1];
        uint64_t v12 = [v11 inheritedOutputContentClassesInWorkflow:v6 context:v7];
        goto LABEL_17;
      }
      uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
    }
LABEL_19:

    goto LABEL_20;
  }
  if ([(WFAction *)self inputTypeDeterminesOutputType])
  {
    long long v13 = [(WFAction *)self inputParameter];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v15 = [(WFAction *)self inputParameter];
      uint64_t v16 = [v15 key];
      uint64_t v8 = [(WFAction *)self parameterStateForKey:v16];

      int v11 = [v8 variable];
      if (v11 && ([v7 containsObject:self] & 1) == 0)
      {
        [v7 addObject:self];
        uint64_t v19 = [v11 possibleAggrandizedContentClassesWithContext:v7];
        uint64_t v17 = [v19 array];
      }
      else
      {
        uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
      }
      goto LABEL_18;
    }
  }
  if ([v7 containsObject:self])
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    [v7 addObject:self];
    uint64_t v17 = [(WFAction *)self outputContentClasses];
  }
LABEL_20:

  return v17;
}

- (id)inheritedOutputContentClassesInWorkflow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = [(WFAction *)self inheritedOutputContentClassesInWorkflow:v4 context:v5];

  return v6;
}

- (id)inheritedInputVariableInWorkflow:(id)a3 ignoringInputTypes:(BOOL)a4
{
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F1CAA0]);
  id v7 = [v5 actions];
  uint64_t v8 = (void *)[v6 initWithArray:v7];

  uint64_t v9 = self;
  uint64_t v10 = objc_opt_new();
  id v32 = v9;
  __int16 v33 = objc_opt_new();
  while (1)
  {
    uint64_t v11 = [v8 indexOfObject:v9];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_21;
    }
    if (!v11)
    {
      uint64_t v19 = [v5 inputAction];
      if (!v19) {
        goto LABEL_21;
      }
      unint64_t v20 = (void *)v19;
      uint64_t v21 = [v5 effectiveInputClasses];
      char v22 = [(WFAction *)v9 inputContentClasses];
      BOOL v23 = [(WFAction *)v9 canHandleInputOfContentClasses:v21 withSupportedClasses:v22 includingCoercedTypes:1];

      if (v23) {
        long long v28 = [[WFShortcutInputVariable alloc] initWithVariableProvider:v32 aggrandizements:0];
      }
      else {
LABEL_21:
      }
        long long v28 = 0;
      long long v29 = v33;
      goto LABEL_35;
    }
    if ([v10 containsObject:v9]) {
      goto LABEL_21;
    }
    [v10 addObject:v9];
    uint64_t v12 = [(WFAction *)v9 inputSourceInWorkflow:v5];
    if (+[WFVariableAvailability actionIsEligibleForOutputVariable:v12])
    {
      BOOL v13 = 1;
    }
    else
    {
      id v14 = [(WFAction *)v12 providedVariableNames];
      BOOL v13 = [v14 count] != 0;
    }
    if ([(WFAction *)v12 snappingPassthrough]) {
      goto LABEL_17;
    }
    if ([(WFAction *)v12 blocksSnapping])
    {
      long long v28 = 0;
      long long v29 = v33;
      goto LABEL_34;
    }
    if (v13) {
      break;
    }
    uint64_t v15 = [(WFAction *)v12 containedVariables];
    if (![v15 count])
    {
      long long v28 = 0;
      long long v29 = v33;
      goto LABEL_33;
    }
    id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v17 = objc_msgSend(v15, "if_compactMap:", &__block_literal_global_495);
    __int16 v18 = (void *)[v16 initWithArray:v17];

    if ([v33 count])
    {
      if (![v33 intersectsSet:v18])
      {
        long long v28 = 0;
        long long v29 = v33;
        goto LABEL_32;
      }
    }
    else
    {
      [v33 unionSet:v18];
    }

LABEL_17:
    uint64_t v9 = v12;
  }
  uint64_t v15 = [(WFAction *)v12 outputVariableWithVariableProvider:v32 UUIDProvider:0];
  long long v29 = v33;
  if ([v33 count])
  {
    long long v24 = [v15 UUID];
    int v25 = [v33 containsObject:v24];

    if (!v25)
    {
      long long v28 = 0;
      goto LABEL_33;
    }
  }
  __int16 v18 = [(WFAction *)v12 inheritedOutputContentClassesInWorkflow:v5];
  if (a4
    || ([(WFAction *)v9 inputContentClasses],
        long long v26 = objc_claimAutoreleasedReturnValue(),
        BOOL v27 = [(WFAction *)v9 canHandleInputOfContentClasses:v18 withSupportedClasses:v26 includingCoercedTypes:1], v26, v27))
  {
    long long v28 = [(WFAction *)v12 outputVariableWithVariableProvider:v32 UUIDProvider:0];
  }
  else
  {
    long long v28 = 0;
  }
LABEL_32:

LABEL_33:
LABEL_34:

LABEL_35:
  return v28;
}

uint64_t __64__WFAction_inheritedInputVariableInWorkflow_ignoringInputTypes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (id)inheritedInputVariableInWorkflow:(id)a3
{
  return [(WFAction *)self inheritedInputVariableInWorkflow:a3 ignoringInputTypes:0];
}

- (id)inputSourceInWorkflow:(id)a3
{
  id v4 = [a3 actions];
  uint64_t v5 = [v4 indexOfObject:self];
  id v6 = 0;
  if (v5 && v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [v4 objectAtIndex:v5 - 1];
  }

  return v6;
}

- (id)outputVariableWithVariableProvider:(id)a3 UUIDProvider:(id)a4
{
  id v5 = a3;
  if (+[WFVariableAvailability actionIsEligibleForOutputVariable:self])
  {
    id v6 = [[WFActionOutputVariable alloc] initWithAction:self variableProvider:v5 aggrandizements:0];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)canHandleInputOfContentClasses:(id)a3 withSupportedClasses:(id)a4 includingCoercedTypes:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v8 = a4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v52;
    uint64_t v33 = *(void *)v52;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v52 != v11) {
          objc_enumerationMutation(v8);
        }
        BOOL v13 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v14 = v7;
        uint64_t v37 = [v14 countByEnumeratingWithState:&v47 objects:v57 count:16];
        if (!v37) {
          goto LABEL_41;
        }
        uint64_t v38 = *(void *)v48;
        uint64_t v34 = v10;
        while (2)
        {
          for (uint64_t j = 0; j != v37; ++j)
          {
            if (*(void *)v48 != v38) {
              objc_enumerationMutation(v14);
            }
            id v16 = *(void **)(*((void *)&v47 + 1) + 8 * j);
            if (([v16 isSubclassOfClass:v13] & 1) != 0 || v16 == objc_opt_class()) {
              goto LABEL_45;
            }
            if (v16 == objc_opt_class())
            {
              long long v45 = 0u;
              long long v46 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              uint64_t v19 = [v13 supportedTypes];
              uint64_t v20 = [v19 countByEnumeratingWithState:&v43 objects:v56 count:16];
              if (v20)
              {
                uint64_t v21 = v20;
                BOOL v32 = v5;
                id v35 = v8;
                id v36 = v7;
                uint64_t v22 = *(void *)v44;
LABEL_20:
                uint64_t v23 = 0;
                while (1)
                {
                  if (*(void *)v44 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  long long v24 = *(void **)(*((void *)&v43 + 1) + 8 * v23);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass() & 1) != 0 && ([v24 isDeclared]) {
                    goto LABEL_44;
                  }
                  if (v21 == ++v23)
                  {
                    uint64_t v21 = [v19 countByEnumeratingWithState:&v43 objects:v56 count:16];
                    if (v21) {
                      goto LABEL_20;
                    }
LABEL_37:
                    id v8 = v35;
                    id v7 = v36;
                    BOOL v5 = v32;
                    goto LABEL_38;
                  }
                }
              }
              goto LABEL_38;
            }
            if (v13 == objc_opt_class())
            {
              long long v41 = 0u;
              long long v42 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              uint64_t v19 = [v16 allSupportedTypes];
              uint64_t v25 = [v19 countByEnumeratingWithState:&v39 objects:v55 count:16];
              if (v25)
              {
                uint64_t v26 = v25;
                BOOL v32 = v5;
                id v35 = v8;
                id v36 = v7;
                uint64_t v27 = *(void *)v40;
LABEL_30:
                uint64_t v28 = 0;
                while (1)
                {
                  if (*(void *)v40 != v27) {
                    objc_enumerationMutation(v19);
                  }
                  long long v29 = *(void **)(*((void *)&v39 + 1) + 8 * v28);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass() & 1) != 0 && ([v29 isDeclared]) {
                    break;
                  }
                  if (v26 == ++v28)
                  {
                    uint64_t v26 = [v19 countByEnumeratingWithState:&v39 objects:v55 count:16];
                    if (v26) {
                      goto LABEL_30;
                    }
                    goto LABEL_37;
                  }
                }
LABEL_44:

                id v8 = v35;
                id v7 = v36;
LABEL_45:

                BOOL v30 = 1;
                goto LABEL_47;
              }
LABEL_38:

              continue;
            }
            if (v5)
            {
              uint64_t v17 = [v16 supportedItemClasses];
              char v18 = [v17 containsObject:v13];

              if (v18) {
                goto LABEL_45;
              }
            }
          }
          uint64_t v11 = v33;
          uint64_t v10 = v34;
          uint64_t v37 = [v14 countByEnumeratingWithState:&v47 objects:v57 count:16];
          if (v37) {
            continue;
          }
          break;
        }
LABEL_41:
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v51 objects:v58 count:16];
      BOOL v30 = 0;
      if (!v10) {
        goto LABEL_47;
      }
    }
  }
  BOOL v30 = 0;
LABEL_47:

  return v30;
}

- (BOOL)canHandleInputOfContentClasses:(id)a3 withSupportedClasses:(id)a4
{
  return [(WFAction *)self canHandleInputOfContentClasses:a3 withSupportedClasses:a4 includingCoercedTypes:0];
}

- (BOOL)shouldBeConnectedToPreviousActionInWorkflow:(id)a3 withOutputsConsumedByFollowingActions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 actions];
  uint64_t v9 = [v8 indexOfObject:self];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v10 = 0;
  }
  else if (v9 || ![(WFAction *)self containsVariableOfType:@"ExtensionInput"])
  {
    uint64_t v11 = [(WFAction *)self containedVariables];
    id v12 = objc_alloc(MEMORY[0x1E4F1CA80]);
    BOOL v13 = objc_msgSend(v11, "if_compactMap:", &__block_literal_global_491);
    id v14 = (void *)[v12 initWithArray:v13];

    if (v7) {
      [v7 intersectSet:v14];
    }
    else {
      id v7 = v14;
    }
    if ([v7 count])
    {
      uint64_t v15 = [(WFAction *)self inputSourceInWorkflow:v6];
      id v16 = v15;
      if (v15)
      {
        uint64_t v17 = [v15 outputVariableWithVariableProvider:self UUIDProvider:0];
        if (v17 && ([v16 snappingPassthrough] & 1) == 0)
        {
          char v18 = [v17 UUID];
          if (v18) {
            char v10 = [v14 containsObject:v18];
          }
          else {
            char v10 = 0;
          }
        }
        else
        {
          char v10 = [v16 shouldBeConnectedToPreviousActionInWorkflow:v6 withOutputsConsumedByFollowingActions:v7];
        }
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

uint64_t __94__WFAction_shouldBeConnectedToPreviousActionInWorkflow_withOutputsConsumedByFollowingActions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUID];
}

- (BOOL)legacyBehaviorIgnoresOutputFromAction:(id)a3 inWorkflow:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 actions];
  unint64_t v9 = [v8 indexOfObject:self];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    uint64_t v11 = [(WFAction *)self inputContentClasses];
    if ([(WFAction *)self containsVariableOfType:@"Input"]
      || !v9 && [(WFAction *)self containsVariableOfType:@"ExtensionInput"])
    {
      LOBYTE(v10) = 0;
    }
    else
    {
      uint64_t v25 = v11;
      uint64_t v26 = v7;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v12 = [(WFAction *)self containedVariablesOfClass:objc_opt_class()];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v28;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "outputUUID", v25);
            char v18 = [v6 UUID];
            char v19 = [v17 isEqualToString:v18];

            if (v19)
            {
              LOBYTE(v10) = 0;
              uint64_t v11 = v25;
              id v7 = v26;
              goto LABEL_18;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      if ([(WFAction *)self inputRequired])
      {
        LOBYTE(v10) = 0;
        uint64_t v11 = v25;
        id v7 = v26;
      }
      else
      {
        id v7 = v26;
        uint64_t v21 = [v26 actions];
        uint64_t v11 = v25;
        if (v9 >= [v21 count] - 1)
        {
          id v12 = 0;
        }
        else
        {
          uint64_t v22 = [v26 actions];
          id v12 = [v22 objectAtIndex:v9 + 1];
        }
        if ([(WFAction *)self inputPassthrough]
          && ![v12 legacyBehaviorIgnoresOutputFromAction:self inWorkflow:v26])
        {
          LOBYTE(v10) = 0;
        }
        else if (objc_msgSend(v25, "count", v25))
        {
          if (v9) {
            [v6 inheritedOutputContentClassesInWorkflow:v26];
          }
          else {
          uint64_t v23 = [v26 effectiveInputClasses];
          }
          long long v24 = [(WFAction *)self inputContentClasses];
          BOOL v10 = ![(WFAction *)self canHandleInputOfContentClasses:v23 withSupportedClasses:v24];
        }
        else
        {
          LOBYTE(v10) = 1;
        }
LABEL_18:
      }
    }
  }
  return v10;
}

- (BOOL)ignoresOutputFromAction:(id)a3 inWorkflow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFAction *)self inputParameter];
  if (v8)
  {
  }
  else
  {
    unint64_t v9 = [(WFAction *)self parameterSummary];

    if (!v9)
    {
      LOBYTE(self) = [(WFAction *)self legacyBehaviorIgnoresOutputFromAction:v6 inWorkflow:v7];
      goto LABEL_5;
    }
  }
  LODWORD(self) = ![(WFAction *)self shouldBeConnectedToPreviousActionInWorkflow:v7 withOutputsConsumedByFollowingActions:0];
LABEL_5:

  return (char)self;
}

- (BOOL)ignoresOutputFromPreviousActionInWorkflow:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 actions];
  uint64_t v6 = [v5 indexOfObject:self];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v7 = 1;
  }
  else if (v6)
  {
    id v8 = [v4 actions];
    unint64_t v9 = [v8 objectAtIndex:v6 - 1];
    BOOL v7 = [(WFAction *)self ignoresOutputFromAction:v9 inWorkflow:v4];
  }
  else
  {
    BOOL v7 = [(WFAction *)self ignoresOutputFromAction:0 inWorkflow:v4];
  }

  return v7;
}

- (BOOL)showsConnectorToPreviousActionInWorkflow:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 actions];
  uint64_t v6 = [v5 indexOfObject:self];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  if (!v6)
  {
    if ([(WFAction *)self containsVariableOfType:@"ExtensionInput"])
    {
      uint64_t v11 = [v4 inputAction];
      LOBYTE(v10) = v11 != 0;

      goto LABEL_9;
    }
LABEL_8:
    LOBYTE(v10) = 0;
    goto LABEL_9;
  }
  BOOL v7 = [v4 actions];
  id v8 = [v7 objectAtIndex:v6 - 1];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_8;
  }
  BOOL v10 = ![(WFAction *)self ignoresOutputFromPreviousActionInWorkflow:v4];
LABEL_9:

  return v10;
}

- (NSArray)outputContentClasses
{
  if ([(WFAction *)self inputPassthrough])
  {
    uint64_t v3 = [(WFAction *)self inputContentClasses];
  }
  else
  {
    outputContentClasses = self->_outputContentClasses;
    if (!outputContentClasses)
    {
      BOOL v5 = [(WFAction *)self outputTypes];
      uint64_t v6 = [(WFAction *)self classesForTypeArray:v5 includeAllOutputTypes:0];
      BOOL v7 = self->_outputContentClasses;
      self->_outputContentClasses = v6;

      outputContentClasses = self->_outputContentClasses;
    }
    uint64_t v3 = outputContentClasses;
  }
  return v3;
}

- (NSArray)inputContentClasses
{
  inputContentClasses = self->_inputContentClasses;
  if (!inputContentClasses)
  {
    id v4 = [(WFAction *)self inputTypes];
    BOOL v5 = [(WFAction *)self classesForTypeArray:v4 includeAllOutputTypes:1];
    uint64_t v6 = self->_inputContentClasses;
    self->_inputContentClasses = v5;

    inputContentClasses = self->_inputContentClasses;
  }
  return inputContentClasses;
}

- (NSArray)specifiedOutputContentClasses
{
  if ([(WFAction *)self inputPassthrough]) {
    [(WFAction *)self specifiedInputContentClasses];
  }
  else {
  uint64_t v3 = [(WFAction *)self outputContentClasses];
  }
  return (NSArray *)v3;
}

- (NSArray)specifiedInputContentClasses
{
  uint64_t v3 = [(WFAction *)self inputTypes];
  id v4 = [(WFAction *)self classesForTypeArray:v3 includeAllOutputTypes:0];

  return (NSArray *)v4;
}

- (id)classesForTypeArray:(id)a3 includeAllOutputTypes:(BOOL)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v32 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    unint64_t v9 = 0x1E4F5A000uLL;
    unint64_t v10 = 0x1E4F5A000uLL;
    unint64_t v11 = 0x1E4F5A000uLL;
    do
    {
      uint64_t v12 = 0;
      uint64_t v30 = v7;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(NSString **)(*((void *)&v33 + 1) + 8 * v12);
        Class v14 = NSClassFromString(v13);
        if (v14)
        {
          Class v15 = v14;
          if ([(objc_class *)v14 isSubclassOfClass:objc_opt_class()])
          {
            [v32 addObject:v15];
            goto LABEL_18;
          }
          uint64_t v16 = [MEMORY[0x1E4F5A9A8] typeWithClass:v15];
        }
        else
        {
          uint64_t v16 = [MEMORY[0x1E4FB4718] typeWithString:v13];
        }
        uint64_t v17 = (void *)v16;
        char v18 = [*(id *)(v9 + 2136) sharedRegistry];
        uint64_t v19 = [v18 contentItemClassForType:v17];

        if (v19 == objc_opt_class() || v19 == objc_opt_class() || !a4)
        {
          if (v19) {
            [v32 addObject:v19];
          }
        }
        else
        {
          uint64_t v20 = [*(id *)(v9 + 2136) sharedRegistry];
          uint64_t v21 = [v20 contentItemClassesSupportingType:v17];
          uint64_t v22 = v8;
          unint64_t v23 = v11;
          id v24 = v5;
          unint64_t v25 = v9;
          unint64_t v26 = v10;
          long long v27 = (void *)[v21 mutableCopy];

          [v27 removeObject:NSClassFromString(&cfstr_Wfworkflowcont.isa)];
          [v27 removeObject:objc_opt_class()];
          [v32 unionSet:v27];

          unint64_t v10 = v26;
          unint64_t v9 = v25;
          id v5 = v24;
          unint64_t v11 = v23;
          uint64_t v8 = v22;
          uint64_t v7 = v30;
        }

LABEL_18:
        ++v12;
      }
      while (v7 != v12);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v7);
  }

  long long v28 = [v32 array];

  return v28;
}

- (Class)contentItemClass
{
  v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"WFContentItemClass"];
  id v4 = NSClassFromString(v3);

  return (Class)v4;
}

- (void)wasRemovedFromWorkflow:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = objc_opt_new();
  id v5 = [(WFAction *)self resourceManager];
  uint64_t v6 = [v5 resourceObjectsConformingToProtocol:&unk_1F2324148];
  [v4 unionSet:v6];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [(WFAction *)self parameters];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v13 = [v12 resourceManager];
        Class v14 = [v13 resourceObjectsConformingToProtocol:&unk_1F2324148];
        [v4 unionSet:v14];

        [v12 setActionResources:0];
        [v12 wasRemovedFromWorkflow];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v4;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "setWorkflow:", 0, (void)v20);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }

  [(WFAction *)self resetOutput];
  objc_storeWeak((id *)&self->_workflow, 0);
}

- (void)wasAddedToWorkflow:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  if (!self->_parameters) {
    [(WFAction *)self initializeParametersWithLock];
  }
  id v4 = objc_opt_new();
  id v5 = [(WFAction *)self resourceManager];
  uint64_t v6 = [v5 resourceObjectsConformingToProtocol:&unk_1F2324148];
  [v4 unionSet:v6];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = [(WFAction *)self parameters];
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        unint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "resourceManager", v23);
        uint64_t v13 = [v12 resourceObjectsConformingToProtocol:&unk_1F2324148];
        [v4 unionSet:v13];

        [v11 wasAddedToWorkflow];
        Class v14 = [(WFAction *)self resourceManager];
        id v15 = [(id)objc_opt_class() referencedActionResourceClasses];
        uint64_t v16 = [v14 resourceObjectsOfClasses:v15];

        [v11 setActionResources:v16];
        if ([v11 conformsToProtocol:&unk_1F2324148]) {
          [v4 addObject:v11];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v8);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = v4;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
  uint64_t v19 = v23;
  if (v18)
  {
    uint64_t v20 = v18;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "setWorkflow:", v19, v23);
      }
      uint64_t v20 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v20);
  }
}

- (void)wasAddedToWorkflowByUser:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = getWFGeneralLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[WFAction wasAddedToWorkflowByUser:]";
    __int16 v9 = 2114;
    uint64_t v10 = self;
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEFAULT, "%s User added action %{public}@ to workflow", (uint8_t *)&v7, 0x16u);
  }

  id v5 = [(WFAction *)self inputParameterKey];
  if (v5)
  {
    uint64_t v6 = [(WFAction *)self parameterStateForKey:v5 fallingBackToDefaultValue:0];

    if (!v6) {
      [(WFAction *)self unlockInputParameter];
    }
  }
}

- (void)willBeAddedToWorkflow:(id)a3
{
}

- (void)setGroupingIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAction *)self groupingIdentifier];
  id v11 = v4;
  id v6 = v5;
  if (v6 == v11)
  {

    __int16 v9 = v11;
LABEL_9:

    uint64_t v8 = v11;
    goto LABEL_10;
  }
  if (!v11 || !v6)
  {

    goto LABEL_8;
  }
  char v7 = [v11 isEqualToString:v6];

  uint64_t v8 = v11;
  if ((v7 & 1) == 0)
  {
LABEL_8:
    uint64_t v10 = [(WFAction *)self workflow];
    [v10 actionGroupingIdentifierWillChange:self];

    [(WFAction *)self setSupplementalParameterValue:v11 forKey:@"GroupingIdentifier"];
    __int16 v9 = [(WFAction *)self workflow];
    [v9 actionGroupingIdentifierDidChange:self];
    goto LABEL_9;
  }
LABEL_10:
}

- (NSString)groupingIdentifier
{
  uint64_t v3 = objc_opt_class();
  return (NSString *)[(WFAction *)self supplementalParameterValueForKey:@"GroupingIdentifier" ofClass:v3];
}

- (BOOL)outputIsRenamed
{
  v2 = [(WFAction *)self customOutputName];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setOutputName:(id)a3
{
  [(WFAction *)self setSupplementalParameterValue:a3 forKey:@"CustomOutputName"];
  [(WFAction *)self nameUpdated];
}

- (NSString)outputName
{
  BOOL v3 = [(WFAction *)self customOutputName];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(WFAction *)self localizedDefaultOutputName];
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (id)customOutputName
{
  uint64_t v3 = objc_opt_class();
  return [(WFAction *)self supplementalParameterValueForKey:@"CustomOutputName" ofClass:v3];
}

- (id)generateUUIDIfNecessaryWithUUIDProvider:(id)a3
{
  id v4 = (WFAction *)a3;
  id v5 = [(WFAction *)self UUID];
  if (!v5)
  {
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = self;
    }
    char v7 = v6;
    id v5 = [(WFAction *)v7 generateOutputUUIDForAction:self];
    [(WFAction *)self setUUID:v5];
  }
  return v5;
}

- (void)setUUID:(id)a3
{
  id v4 = (id)[a3 copy];
  [(WFAction *)self setSupplementalParameterValue:v4 forKey:@"UUID"];
}

- (NSString)UUID
{
  uint64_t v3 = objc_opt_class();
  return (NSString *)[(WFAction *)self supplementalParameterValueForKey:@"UUID" ofClass:v3];
}

- (void)didChangeVariableName:(id)a3 to:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WFAction *)self workflow];
  [v8 action:self didChangeVariableName:v7 to:v6];
}

- (id)providedVariableNames
{
  return 0;
}

- (void)removeVariableObserver:(id)a3
{
  p_workflow = &self->_workflow;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_workflow);
  id v5 = [WeakRetained variableAvailability];
  [v5 removeVariableObserver:v4];
}

- (void)addVariableObserver:(id)a3
{
  p_workflow = &self->_workflow;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_workflow);
  id v5 = [WeakRetained variableAvailability];
  [v5 addVariableObserver:v4];
}

- (NSArray)workflowInputClasses
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  uint64_t v3 = [WeakRetained effectiveInputClasses];

  return (NSArray *)v3;
}

- (id)possibleContentClassesForVariableNamed:(id)a3 context:(id)a4
{
  p_workflow = &self->_workflow;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_workflow);
  uint64_t v10 = [WeakRetained variableAvailability];
  id v11 = objc_loadWeakRetained((id *)p_workflow);
  uint64_t v12 = [v11 actions];
  uint64_t v13 = objc_msgSend(v10, "possibleContentClassesForVariableNamed:atIndex:context:excludingAction:", v8, objc_msgSend(v12, "indexOfObject:", self), v7, 0);

  return v13;
}

- (id)actionsProvidingVariableName:(id)a3
{
  p_workflow = &self->_workflow;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_workflow);
  id v7 = [WeakRetained variableAvailability];
  id v8 = objc_loadWeakRetained((id *)p_workflow);
  __int16 v9 = [v8 actions];
  uint64_t v10 = objc_msgSend(v7, "actionsProvidingVariableName:atIndex:", v5, objc_msgSend(v9, "indexOfObject:", self));

  return v10;
}

- (id)actionProvidingVariableWithOutputUUID:(id)a3
{
  p_workflow = &self->_workflow;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_workflow);
  id v6 = [WeakRetained variableAvailability];
  id v7 = [v6 actionProvidingVariableWithOutputUUID:v4];

  return v7;
}

- (BOOL)isVariableWithOutputUUIDAvailable:(id)a3
{
  uint64_t v3 = self;
  p_workflow = &self->_workflow;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_workflow);
  id v7 = [WeakRetained variableAvailability];
  id v8 = objc_loadWeakRetained((id *)p_workflow);
  __int16 v9 = [v8 actions];
  LOBYTE(v3) = objc_msgSend(v7, "isVariableWithOutputUUIDAvailable:atIndex:", v5, objc_msgSend(v9, "indexOfObject:", v3));

  return (char)v3;
}

- (BOOL)isVariableWithNameAvailable:(id)a3
{
  uint64_t v3 = self;
  p_workflow = &self->_workflow;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_workflow);
  id v7 = [WeakRetained variableAvailability];
  id v8 = objc_loadWeakRetained((id *)p_workflow);
  __int16 v9 = [v8 actions];
  LOBYTE(v3) = objc_msgSend(v7, "isVariableWithName:availableAtIndex:", v5, objc_msgSend(v9, "indexOfObject:", v3));

  return (char)v3;
}

- (BOOL)hasAvailableActionOutputVariables
{
  v2 = self;
  p_workflow = &self->_workflow;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  id v5 = [WeakRetained variableAvailability];
  id v6 = objc_loadWeakRetained((id *)p_workflow);
  id v7 = [v6 actions];
  LOBYTE(v2) = objc_msgSend(v5, "areActionOutputVariablesAvailableAtIndex:", objc_msgSend(v7, "indexOfObject:", v2));

  return (char)v2;
}

- (BOOL)hasAvailableVariables
{
  v2 = self;
  p_workflow = &self->_workflow;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  id v5 = [WeakRetained variableAvailability];
  id v6 = objc_loadWeakRetained((id *)p_workflow);
  id v7 = [v6 actions];
  LOBYTE(v2) = objc_msgSend(v5, "areVariablesAvailableAtIndex:", objc_msgSend(v7, "indexOfObject:", v2));

  return (char)v2;
}

- (NSArray)availableOutputActions
{
  p_workflow = &self->_workflow;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  id v5 = [WeakRetained variableAvailability];
  id v6 = objc_loadWeakRetained((id *)p_workflow);
  id v7 = [v6 actions];
  id v8 = objc_msgSend(v5, "availableOutputActionsAtIndex:", objc_msgSend(v7, "indexOfObject:", self));

  return (NSArray *)v8;
}

- (NSArray)availableVariableNames
{
  p_workflow = &self->_workflow;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
  id v5 = [WeakRetained variableAvailability];
  id v6 = objc_loadWeakRetained((id *)p_workflow);
  id v7 = [v6 actions];
  id v8 = objc_msgSend(v5, "availableVariableNamesAtIndex:", objc_msgSend(v7, "indexOfObject:", self));

  return (NSArray *)v8;
}

- (id)generateOutputUUIDForAction:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F29128], "UUID", a3);
  id v4 = [v3 UUIDString];

  return v4;
}

- (id)createAccompanyingActions
{
  return 0;
}

- (void)iconUpdated
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __23__WFAction_iconUpdated__block_invoke;
  v2[3] = &unk_1E654E590;
  v2[4] = self;
  [(WFAction *)self enumerateObservers:v2];
}

void __23__WFAction_iconUpdated__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 actionIconDidChange:*(void *)(a1 + 32)];
  }
}

- (void)removeEventObserver:(id)a3
{
  p_observersLocuint64_t k = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  id v6 = [(WFAction *)self eventObservers];
  [v6 removeObject:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (void)visibleParametersUpdated
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __36__WFAction_visibleParametersUpdated__block_invoke;
  v2[3] = &unk_1E654E590;
  v2[4] = self;
  [(WFAction *)self enumerateObservers:v2];
}

void __36__WFAction_visibleParametersUpdated__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 actionVisibleParametersDidChange:*(void *)(a1 + 32)];
  }
}

- (void)reloadAuxiliaryButton
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __33__WFAction_reloadAuxiliaryButton__block_invoke;
  v2[3] = &unk_1E654E590;
  v2[4] = self;
  [(WFAction *)self enumerateObservers:v2];
}

void __33__WFAction_reloadAuxiliaryButton__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 actionReloadAuxiliaryButton:*(void *)(a1 + 32)];
  }
}

- (void)outputDetailsUpdated
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __32__WFAction_outputDetailsUpdated__block_invoke;
  v2[3] = &unk_1E654E590;
  v2[4] = self;
  [(WFAction *)self enumerateObservers:v2];
}

void __32__WFAction_outputDetailsUpdated__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 actionOutputDetailsDidChange:*(void *)(a1 + 32)];
  }
}

- (void)nameUpdated
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __23__WFAction_nameUpdated__block_invoke;
  v2[3] = &unk_1E654E590;
  v2[4] = self;
  [(WFAction *)self enumerateObservers:v2];
}

void __23__WFAction_nameUpdated__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 actionNameDidChange:*(void *)(a1 + 32)];
  }
}

- (NSArray)keyCommands
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (BOOL)prefersActionAttribution
{
  id v3 = [(WFAction *)self appDefinition];
  if (v3)
  {
    id v4 = [(WFAction *)self appDefinition];
    id v5 = [v4 objectForKey:*MEMORY[0x1E4FB4508]];
    int v6 = [v5 isEqualToString:*MEMORY[0x1E4FB4BE8]] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)requestInterfacePresentationWithCompletionHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(WFAction *)self userInterfaceClasses];
  if (![v5 count]) {
    goto LABEL_8;
  }
  int v6 = [(WFAction *)self userInterface];
  int v7 = [v6 isRunningWithSiriUI];

  if (!v7)
  {
    uint64_t v10 = [(WFAction *)self userInterface];
    int v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      uint64_t v12 = [(WFAction *)self userInterface];
      uint64_t v13 = (objc_class *)objc_opt_class();
      Class v14 = NSStringFromClass(v13);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __62__WFAction_requestInterfacePresentationWithCompletionHandler___block_invoke;
      v15[3] = &unk_1E654E958;
      v15[4] = self;
      id v16 = v4;
      [v12 requestActionInterfacePresentationForActionClassName:v14 classNamesByType:v5 completionHandler:v15];

      goto LABEL_9;
    }
LABEL_8:
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    goto LABEL_9;
  }
  id v8 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = "-[WFAction requestInterfacePresentationWithCompletionHandler:]";
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s Action running in Siri needs to display UI, punching to Shortcuts", buf, 0xCu);
  }

  __int16 v9 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
  (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);

LABEL_9:
}

void __62__WFAction_requestInterfacePresentationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) isRunning])
  {
    [*(id *)(a1 + 32) setActionUserInterface:v5];
    int v7 = [*(id *)(a1 + 32) workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__WFAction_requestInterfacePresentationWithCompletionHandler___block_invoke_462;
    block[3] = &unk_1E6557D28;
    id v12 = *(id *)(a1 + 40);
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v7, block);
  }
  else
  {
    id v8 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      Class v14 = "-[WFAction requestInterfacePresentationWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s Action is not running during the completion of a UI presentation request, returning", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __62__WFAction_requestInterfacePresentationWithCompletionHandler___block_invoke_462(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setOutput:(id)a3 onVariableSource:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if ([(WFAction *)self runningInStepWiseExecutor])
  {
    int v7 = [(WFAction *)self generateUUIDIfNecessaryWithUUIDProvider:0];
    [(WFAction *)self setUUID:v7];

    id v8 = [(WFAction *)self UUID];
    __int16 v9 = v8;
LABEL_6:
    uint64_t v13 = [v8 stringByAppendingString:@"-output"];
    [v6 setContent:v14 forVariableWithName:v13];

    goto LABEL_7;
  }
  __int16 v9 = [(WFAction *)self UUID];
  if (v9)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_workflow);
    id v11 = [WeakRetained variableAvailability];
    id v12 = [v11 actionProvidingVariableWithOutputUUID:v9];

    if (v12)
    {
      id v8 = v9;
      goto LABEL_6;
    }
  }
LABEL_7:
}

- (WFContentAttributionTracker)contentAttributionTracker
{
  contentAttributionTracker = self->_contentAttributionTracker;
  if (!contentAttributionTracker)
  {
    id v4 = objc_alloc_init(WFContentAttributionTracker);
    id v5 = self->_contentAttributionTracker;
    self->_contentAttributionTracker = v4;

    contentAttributionTracker = self->_contentAttributionTracker;
  }
  return contentAttributionTracker;
}

- (WFContentCollection)output
{
  output = self->_output;
  if (!output)
  {
    id v4 = (WFContentCollection *)objc_opt_new();
    id v5 = self->_output;
    self->_output = v4;

    output = self->_output;
  }
  return output;
}

- (void)resetOutput
{
  [(WFAction *)self setOutput:0];
  [(WFAction *)self setProgress:0];
}

- (void)cancel
{
  id v3 = [MEMORY[0x1E4F28C58] userCancelledError];
  [(WFAction *)self finishRunningWithError:v3];
}

- (void)dismissPresentedContentWithCompletionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  id v5 = getWFGeneralLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[WFAction dismissPresentedContentWithCompletionHandler:]";
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Dismissing presented content", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [(WFAction *)self userInterface];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(WFAction *)self userInterface];
    [v8 dismissPresentedContentWithCompletionHandler:v4];
  }
  else
  {
    v4[2](v4);
  }
}

- (void)finishRunningWithError:(id)a3
{
  v75[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(WFAction *)self isRunning])
  {
    id v5 = [v4 domain];
    id v6 = (__CFString *)*MEMORY[0x1E4F5ABE8];
    if ([v5 isEqualToString:*MEMORY[0x1E4F5ABE8]])
    {
      uint64_t v7 = [v4 code];

      if (!v7)
      {
        id v8 = objc_opt_new();
        int v9 = WFLocalizedString(@"This action could not be run with the current user interface.");
        [v8 setObject:v9 forKey:*MEMORY[0x1E4F28568]];

        id v10 = [(WFAction *)self input];
        [v8 setValue:v10 forKey:@"ActionInput"];

        uint64_t v11 = [(WFAction *)self processedParameters];
        [v8 setValue:v11 forKey:@"ActionProcessedParameters"];

        id v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v13 = v6;
        uint64_t v14 = 0;
LABEL_13:
        uint64_t v30 = [v12 errorWithDomain:v13 code:v14 userInfo:v8];
LABEL_14:
        uint64_t v24 = v30;
LABEL_15:

        id v4 = (id)v24;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
    }
    if (objc_msgSend(v4, "wf_isUnsupportedOnPlatformError"))
    {
      uint64_t v15 = [v4 userInfo];
      id v8 = (void *)[v15 mutableCopy];

      uint64_t v16 = *MEMORY[0x1E4F28568];
      id v17 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];

      if (!v17)
      {
        uint64_t v18 = [(WFAction *)self localizedName];
        uint64_t v19 = objc_msgSend(v4, "wf_localizedErrorStringWithActionName:", v18);
        [v8 setValue:v19 forKey:v16];

        uint64_t v20 = [(WFAction *)self input];
        [v8 setValue:v20 forKey:@"ActionInput"];

        uint64_t v21 = [(WFAction *)self processedParameters];
        [v8 setValue:v21 forKey:@"ActionProcessedParameters"];
      }
      long long v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = [v4 domain];
      uint64_t v24 = objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, objc_msgSend(v4, "code"), v8);

      id v4 = (id)v23;
      goto LABEL_15;
    }
    long long v25 = [v4 domain];
    if ([v25 isEqualToString:@"WFActionErrorDomain"])
    {
      uint64_t v26 = [v4 code];

      if (v26 == 2)
      {
        id v8 = objc_opt_new();
        long long v27 = WFLocalizedString(@"This action cannot be run in the current environment.");
        [v8 setObject:v27 forKey:*MEMORY[0x1E4F28568]];

        long long v28 = [(WFAction *)self input];
        [v8 setValue:v28 forKey:@"ActionInput"];

        long long v29 = [(WFAction *)self processedParameters];
        [v8 setValue:v29 forKey:@"ActionProcessedParameters"];

        id v12 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v13 = @"WFActionErrorDomain";
        uint64_t v14 = 2;
        goto LABEL_13;
      }
    }
    else
    {
    }
    id v8 = [v4 domain];
    if (![v8 isEqual:*MEMORY[0x1E4F5AB08]]) {
      goto LABEL_16;
    }
    uint64_t v55 = [v4 code];

    if (v55)
    {
LABEL_17:
      [(WFAction *)self setRunning:0];
      [(WFAction *)self setActionUserInterface:0];
      effectiveWorkQueue = self->_effectiveWorkQueue;
      self->_effectiveWorkQueue = 0;

      long long v32 = [(WFAction *)self sessionKitAssertion];

      if (v32)
      {
        long long v33 = getWFSessionKitLogObject();
        BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
        if (v4)
        {
          if (v34)
          {
            *(_DWORD *)buf = 136315138;
            id v71 = "-[WFAction finishRunningWithError:]";
            _os_log_impl(&dword_1C7F0A000, v33, OS_LOG_TYPE_DEFAULT, "%s We finished with an error, and we were holding a SessionKit assertion. Letting it go.", buf, 0xCu);
          }

          [(WFAction *)self setSessionKitAssertion:0];
        }
        else
        {
          if (v34)
          {
            *(_DWORD *)buf = 136315138;
            id v71 = "-[WFAction finishRunningWithError:]";
            _os_log_impl(&dword_1C7F0A000, v33, OS_LOG_TYPE_DEFAULT, "%s Action finished running, and we seem to be holding a SessionKit assertion. Starting a timeout to invalidate it if we're still waiting on the app...", buf, 0xCu);
          }

          uint64_t v35 = [(WFAction *)self sessionKitAssertion];
          [v35 startTimeoutTimer];
        }
      }
      if (([(id)objc_opt_class() outputIsExemptFromTaintTrackingInheritance] & 1) != 0
        || [(WFAction *)self inputPassthrough])
      {
        goto LABEL_40;
      }
      long long v36 = [(WFAction *)self contentAttributionTracker];
      uint64_t v37 = [v36 trackedAttributionSet];

      uint64_t v38 = [(WFAction *)self appDescriptor];

      if (v38)
      {
        long long v39 = [(WFAction *)self appDescriptor];
        long long v40 = [v39 bundleIdentifier];
        WFMCIsAppAccountBasedSourceForOpenIn(v40);
        char v42 = v41;

        if ((v42 & 1) == 0)
        {
          long long v43 = (void *)MEMORY[0x1E4F5A828];
          v75[0] = v37;
          long long v44 = (void *)MEMORY[0x1E4F5A820];
          unint64_t v45 = [(WFAction *)self outputDisclosureLevel];
          long long v46 = (void *)MEMORY[0x1E4F5A788];
          long long v47 = [(WFAction *)self appDescriptor];
          int v65 = [v46 locationWithAppDescriptor:v47];
          long long v48 = (void *)MEMORY[0x1E4F1CAA0];
          id v67 = [(WFAction *)self output];
          id v66 = [v67 items];
          id v64 = objc_msgSend(v66, "if_map:", &__block_literal_global_454);
          long long v49 = [v48 orderedSetWithArray:v64];
          long long v50 = [v44 attributionWithDisclosureLevel:v45 origin:v65 originalItemIdentifiers:v49];
          id v74 = v50;
          long long v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
          long long v52 = [v43 attributionSetWithAttributions:v51];
          v75[1] = v52;
          long long v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
          uint64_t v54 = [v43 attributionSetByMergingAttributionSets:v53];

          uint64_t v37 = (void *)v54;
LABEL_38:
        }
      }
      else
      {
        long long v47 = [(WFAction *)self output];
        if (![v47 numberOfItems]) {
          goto LABEL_38;
        }
        unint64_t v57 = [(WFAction *)self outputDisclosureLevel];

        if (v57 == 1)
        {
          long long v47 = getWFWorkflowExecutionLogObject();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
          {
            id v58 = [(WFAction *)self identifier];
            *(_DWORD *)buf = 136315394;
            id v71 = "-[WFAction finishRunningWithError:]";
            __int16 v72 = 2112;
            char v73 = v58;
            _os_log_impl(&dword_1C7F0A000, v47, OS_LOG_TYPE_FAULT, "%s Action %@ produces private output and is not exempt from taint tracking, but is missing an appIdentifier", buf, 0x16u);
          }
          goto LABEL_38;
        }
      }
      uint64_t v59 = [(WFAction *)self output];
      uint64_t v60 = [v59 collectionByMergingAttributionSet:v37];
      [(WFAction *)self setOutput:v60];

LABEL_40:
      char v61 = [(WFAction *)self output];
      [(WFAction *)self setDefaultCoercionOptionsOnContentCollection:v61];

      long long v62 = [(WFAction *)self output];
      id v63 = [(WFAction *)self variableSource];
      [(WFAction *)self setOutput:v62 onVariableSource:v63];

      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __35__WFAction_finishRunningWithError___block_invoke_455;
      v68[3] = &unk_1E6558938;
      v68[4] = self;
      id v4 = v4;
      id v69 = v4;
      [(WFAction *)self dismissPresentedContentWithCompletionHandler:v68];

      goto LABEL_41;
    }
    id v56 = (void *)MEMORY[0x1E4F5A848];
    id v8 = [(WFAction *)self localizedName];
    uint64_t v30 = [v56 populateBadCoercionError:v4 withResponsibleComponent:v8];
    goto LABEL_14;
  }
LABEL_41:
}

void __35__WFAction_finishRunningWithError___block_invoke_455(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__WFAction_finishRunningWithError___block_invoke_2;
  block[3] = &unk_1E6558938;
  id v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v6 = v3;
  dispatch_async(v2, block);

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__WFAction_finishRunningWithError___block_invoke_3;
  v4[3] = &unk_1E6558B28;
  v4[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __35__WFAction_finishRunningWithError___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[27];
  if (v3)
  {
    id v4 = [v2 output];
    (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, *(void *)(a1 + 40));

    v2 = *(void **)(a1 + 32);
    id v5 = (void *)v2[27];
  }
  else
  {
    id v5 = 0;
  }
  v2[27] = 0;
}

uint64_t __35__WFAction_finishRunningWithError___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__WFAction_finishRunningWithError___block_invoke_4;
  v3[3] = &unk_1E654E590;
  v3[4] = v1;
  return [v1 enumerateObservers:v3];
}

void __35__WFAction_finishRunningWithError___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 actionRunningStateDidChange:*(void *)(a1 + 32)];
  }
}

uint64_t __35__WFAction_finishRunningWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cachingIdentifier];
}

- (id)parameterValueForKey:(id)a3 ofClass:(Class)a4
{
  id v6 = a3;
  uint64_t v7 = [(WFAction *)self processedParameters];
  id v8 = [v7 objectForKey:v6];

  int v9 = WFEnforceClass(v8, (uint64_t)a4);

  return v9;
}

- (void)prepareToProcessWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__WFAction_prepareToProcessWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E6558AC8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(WFAction *)self resolveAppDescriptorIfNecessary:v6];
}

uint64_t __50__WFAction_prepareToProcessWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    return [*(id *)(a1 + 32) preloadDefaultParameterStatesIfNecessaryWithCompletionHandler:*(void *)(a1 + 40)];
  }
}

- (BOOL)isProgressIndeterminate
{
  return 1;
}

- (BOOL)hasChildren
{
  return 0;
}

- (BOOL)isDeletable
{
  return 1;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
}

- (void)checkUserInterfaceAndRun
{
  if ([(WFAction *)self isRunning])
  {
    id v3 = [(WFAction *)self effectiveWorkQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__WFAction_checkUserInterfaceAndRun__block_invoke;
    block[3] = &unk_1E6558B28;
    void block[4] = self;
    dispatch_async(v3, block);
  }
}

void __36__WFAction_checkUserInterfaceAndRun__block_invoke(uint64_t a1)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isRunning])
  {
    v2 = [*(id *)(a1 + 32) app];
    int v3 = [v2 isRestricted];

    id v4 = *(void **)(a1 + 32);
    if (v3)
    {
      id v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28568];
      id v6 = NSString;
      id v7 = WFLocalizedString(@"This action could not be run because “%@” is restricted.");
      id v8 = [*(id *)(a1 + 32) appDescriptor];
      int v9 = [v8 localizedName];
      id v10 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v9);
      v25[0] = v10;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
      id v12 = [v5 errorWithDomain:@"WFActionErrorDomain" code:7 userInfo:v11];
      [v4 finishRunningWithError:v12];

LABEL_4:
      return;
    }
    if (![*(id *)(a1 + 32) highRisk]
      || +[WFShortcutsSecuritySettings areScriptingActionsEnabled](WFShortcutsSecuritySettings, "areScriptingActionsEnabled")|| ([*(id *)(a1 + 32) requiresRemoteExecution] & 1) != 0)
    {
      int v13 = [*(id *)(a1 + 32) requiresRemoteExecution];
      uint64_t v14 = *(void **)(a1 + 32);
      if (!v13)
      {
        uint64_t v15 = [*(id *)(a1 + 32) userInterface];
        id v7 = [v15 userInterfaceType];

        if ([*(id *)(a1 + 32) requiresHandoffWhenRunWithUserInterfaceType:v7])
        {
          uint64_t v16 = *(void **)(a1 + 32);
          id v17 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
          [v16 finishRunningWithError:v17];
        }
        else
        {
          uint64_t v18 = *(void **)(a1 + 32);
          uint64_t v19 = [v18 effectiveWorkQueue];
          v23[0] = MEMORY[0x1E4F143A8];
          v23[1] = 3221225472;
          v23[2] = __36__WFAction_checkUserInterfaceAndRun__block_invoke_2;
          v23[3] = &unk_1E6558B28;
          void v23[4] = *(void *)(a1 + 32);
          +[WFActionRateLimiter performAction:v18 onQueue:v19 withBlock:v23];
        }
        goto LABEL_4;
      }
      id v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFActionErrorDomain" code:2 userInfo:0];
      objc_msgSend(v14, "finishRunningWithError:");
    }
    else
    {
      uint64_t v20 = *(void **)(a1 + 32);
      id v22 = [v20 localizedName];
      uint64_t v21 = +[WFShortcutsSecuritySettings scripingActionDisabledErrorWithActionName:](WFShortcutsSecuritySettings, "scripingActionDisabledErrorWithActionName:");
      [v20 finishRunningWithError:v21];
    }
  }
}

uint64_t __36__WFAction_checkUserInterfaceAndRun__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__WFAction_checkUserInterfaceAndRun__block_invoke_3;
  v3[3] = &unk_1E654FAB8;
  v3[4] = v1;
  return [v1 requestUnlockIfNeeded:v3];
}

void __36__WFAction_checkUserInterfaceAndRun__block_invoke_3(uint64_t a1, char a2)
{
  int v3 = *(void **)(a1 + 32);
  if (a2)
  {
    id v4 = [v3 runningDelegate];
    if (([*(id *)(a1 + 32) mightSuppressRunningProgress] & 1) == 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v4 action:*(void *)(a1 + 32) didDecideRunningProgressIsAllowed:1];
    }
    id v5 = *(void **)(a1 + 32);
    id v9 = 0;
    char v6 = [v5 takeSessionKitAssertionIfNeededWithError:&v9];
    id v7 = v9;
    id v8 = *(void **)(a1 + 32);
    if (v6) {
      [v8 runAsynchronouslyWithInput:v8[16]];
    }
    else {
      [v8 finishRunningWithError:v7];
    }
  }
  else
  {
    objc_msgSend(v3, "finishRunningWithError:");
  }
}

- (void)performDataAndHardwareAccessChecksAndRun
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__WFAction_performDataAndHardwareAccessChecksAndRun__block_invoke;
  v2[3] = &unk_1E6555D78;
  v2[4] = self;
  [(WFAction *)self promptForAudioRecordingPermissionIfNeededWithCompletionBlock:v2];
}

void __52__WFAction_performDataAndHardwareAccessChecksAndRun__block_invoke(uint64_t a1, char a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v4 = [*(id *)(a1 + 32) userInterface];
    id v5 = [*(id *)(a1 + 32) runningDelegate];
    char v6 = [v5 contentItemCache];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__WFAction_performDataAndHardwareAccessChecksAndRun__block_invoke_2;
    v8[3] = &unk_1E6557668;
    v8[4] = *(void *)(a1 + 32);
    [v2 performDataAccessChecksWithUserInterface:v4 contentItemCache:v6 completionHandler:v8];
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28C58] userCancelledError];
    [v2 finishRunningWithError:v7];
  }
}

void __52__WFAction_performDataAndHardwareAccessChecksAndRun__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3)
  {
    if ([v3 code] == 3) {
      id v4 = 0;
    }
    else {
      id v4 = v5;
    }
    [*(id *)(a1 + 32) finishRunningWithError:v4];
  }
  else
  {
    [*(id *)(a1 + 32) setDefaultCoercionOptionsOnInputs];
    [*(id *)(a1 + 32) checkUserInterfaceAndRun];
  }
}

- (void)promptForAudioRecordingPermissionIfNeededWithCompletionBlock:(id)a3
{
  id v4 = a3;
  if ([(WFAction *)self mightStartAudioRecording])
  {
    id v5 = [(WFAction *)self runningDelegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(WFAction *)self runningDelegate];
      id v8 = [v7 currentRunningContextForAction:self];

      if (v8)
      {
        id v9 = [(WFAction *)self userInterface];

        if (v9)
        {
          id v10 = [v8 automationType];

          if (v10)
          {
            uint64_t v11 = [MEMORY[0x1E4F5A768] alertWithPreferredStyle:0];
            id v12 = [(WFAction *)self localizedName];
            [v11 setTitle:v12];

            int v13 = NSString;
            uint64_t v14 = WFLocalizedString(@"Allow “%@” to start an audio recording?");
            uint64_t v15 = [(WFAction *)self localizedName];
            uint64_t v16 = objc_msgSend(v13, "localizedStringWithFormat:", v14, v15);
            [v11 setMessage:v16];

            id v17 = (void *)MEMORY[0x1E4F5A770];
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __73__WFAction_promptForAudioRecordingPermissionIfNeededWithCompletionBlock___block_invoke;
            v26[3] = &unk_1E6558678;
            id v18 = v4;
            id v27 = v18;
            uint64_t v19 = [v17 cancelButtonWithHandler:v26];
            [v11 addButton:v19];

            uint64_t v20 = (void *)MEMORY[0x1E4F5A770];
            uint64_t v21 = WFLocalizedString(@"Allow");
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __73__WFAction_promptForAudioRecordingPermissionIfNeededWithCompletionBlock___block_invoke_2;
            v24[3] = &unk_1E6558678;
            id v25 = v18;
            id v22 = [v20 buttonWithTitle:v21 style:0 preferred:1 handler:v24];
            [v11 addButton:v22];

            uint64_t v23 = [(WFAction *)self userInterface];
            [v23 presentAlert:v11];
          }
          else
          {
            (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
      id v8 = 0;
    }
    (*((void (**)(id, void))v4 + 2))(v4, 0);
LABEL_10:

    goto LABEL_11;
  }
  (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
LABEL_11:
}

uint64_t __73__WFAction_promptForAudioRecordingPermissionIfNeededWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__WFAction_promptForAudioRecordingPermissionIfNeededWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performDeletionAuthorizationChecksWithUserInterface:(id)a3 contentItemCache:(id)a4 completionHandler:(id)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (void (**)(id, void))a5;
  if (![(WFAction *)self shouldDisableSmartPromptChecks])
  {
    if (![(WFAction *)self deletesInput]) {
      goto LABEL_12;
    }
    if ([(WFAction *)self deletesInput] && ![(WFAction *)self contentItemClass])
    {
      id v9 = getWFSecurityLogObject();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        goto LABEL_5;
      }
      *(_DWORD *)buf = 136315138;
      id v66 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]";
      id v10 = "%s deletesInput was set to YES, but no contentItemClass was specified";
      uint64_t v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_FAULT;
      goto LABEL_4;
    }
    int v13 = [(WFAction *)self itemsBeingDeleted];
    uint64_t v14 = [v13 numberOfItems];
    if (!v14)
    {
      v8[2](v8, 0);
LABEL_53:

      goto LABEL_54;
    }
    uint64_t v15 = v14;
    id v59 = v7;
    uint64_t v60 = v13;
    uint64_t v16 = [(WFAction *)self workflow];
    id v17 = [v16 reference];
    if (v17)
    {
      id v18 = [(WFAction *)self workflow];
      uint64_t v19 = [v18 reference];
    }
    else
    {
      id v18 = +[WFDatabaseProxy defaultDatabase];
      uint64_t v20 = [(WFAction *)self workflow];
      uint64_t v21 = [v20 workflowID];
      uint64_t v19 = [v18 referenceForWorkflowID:v21];
    }
    id v22 = +[WFDatabaseProxy defaultDatabase];
    uint64_t v23 = NSStringFromClass([(WFAction *)self contentItemClass]);
    uint64_t v24 = [(WFAction *)self UUID];
    id v25 = [(WFAction *)self identifier];
    uint64_t v26 = [(WFAction *)self workflow];
    id v27 = [v26 actions];
    id v64 = 0;
    char v61 = (void *)v19;
    long long v28 = objc_msgSend(v22, "currentDeletionAuthorizationStatusWithContentItemClassName:actionUUID:actionIdentifier:actionIndex:count:reference:error:", v23, v24, v25, objc_msgSend(v27, "indexOfObject:", self), v15, v19, &v64);
    id v58 = v64;

    long long v29 = [v28 actionUUID];
    [(WFAction *)self setUUID:v29];

    uint64_t v30 = [v28 status];
    LODWORD(v25) = [v30 isEqualToString:@"Restricted"];

    if (v25)
    {
      long long v31 = getWFSecurityLogObject();
      id v7 = v59;
      int v13 = v60;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v66 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]";
        _os_log_impl(&dword_1C7F0A000, v31, OS_LOG_TYPE_INFO, "%s Stopping action because exfiltration is restricted", buf, 0xCu);
      }

      uint64_t v32 = [v28 localizedExfiltrationRestrictedError];
LABEL_28:
      long long v40 = (void *)v32;
      v8[2](v8, v32);

      long long v36 = v61;
LABEL_52:

      goto LABEL_53;
    }
    id v7 = v59;
    int v13 = v60;
    if (+[WFShortcutsSecuritySettings allowsDeletingWithoutConfirmation])
    {
      long long v33 = [v28 status];
      int v34 = [v33 isEqualToString:@"Allow"];

      if (v34)
      {
        uint64_t v35 = getWFSecurityLogObject();
        long long v36 = v61;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          id v66 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]";
          _os_log_impl(&dword_1C7F0A000, v35, OS_LOG_TYPE_DEBUG, "%s Executing action because flag in Preferences is on and deletion authorization was previously approved", buf, 0xCu);
        }

        v8[2](v8, 0);
        goto LABEL_52;
      }
    }
    uint64_t v37 = [v28 status];
    int v38 = [v37 isEqualToString:@"Disallow"];

    if (v38)
    {
      long long v39 = getWFSecurityLogObject();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v66 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]";
        _os_log_impl(&dword_1C7F0A000, v39, OS_LOG_TYPE_INFO, "%s Stopping action because deletion authorization was previously denied", buf, 0xCu);
      }

      uint64_t v32 = [v28 deniedPermissionsError];
      goto LABEL_28;
    }
    char v41 = @"Shortcut";
    char v42 = @"Shortcut";
    long long v36 = v61;
    if ([(WFAction *)self isRunningInSiriUserInterface])
    {
      long long v43 = getWFSecurityLogObject();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        id v66 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]";
        _os_log_impl(&dword_1C7F0A000, v43, OS_LOG_TYPE_DEBUG, "%s Deletion authorization prompt is being presented in Siri", buf, 0xCu);
      }

      char v41 = @"Siri";
      long long v44 = @"Siri";
    }
    unint64_t v45 = [[WFSmartPromptConfiguration alloc] initWithDeletionAuthorizationState:v28 contentCollection:v60 action:self reference:v61 source:v41];
    if (!v45)
    {
      long long v52 = getWFWorkflowExecutionLogObject();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v66 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]";
        _os_log_impl(&dword_1C7F0A000, v52, OS_LOG_TYPE_ERROR, "%s Failed to init WFSmartPromptConfiguration for deletion authorization", buf, 0xCu);
      }

      long long v53 = [(WFAction *)self workflow];
      uint64_t v54 = [v53 name];
      uint64_t v55 = WFRunnerFailureErrorMessage(v54);
      ((void (**)(id, void *))v8)[2](v8, v55);

      int v13 = v60;
      goto LABEL_50;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v56 = getWFSecurityLogObject();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v66 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]";
        _os_log_impl(&dword_1C7F0A000, v56, OS_LOG_TYPE_ERROR, "%s Current UI does not support setting deletion authorizations", buf, 0xCu);
      }

      unint64_t v57 = +[WFSmartPromptState localizedUnsupportedEnvironmentError];
      ((void (**)(id, void *))v8)[2](v8, v57);

      goto LABEL_51;
    }
    long long v46 = [(WFAction *)self userInterface];
    if (objc_opt_respondsToSelector())
    {
      long long v47 = [(WFAction *)self userInterface];
      int v48 = [v47 requestedFromAnotherDevice];

      if (v48)
      {
        long long v49 = [(WFAction *)self userInterface];
        char v50 = objc_opt_respondsToSelector();

        if (v50)
        {
          long long v51 = [(WFAction *)self userInterface];
          v63[0] = MEMORY[0x1E4F143A8];
          v63[1] = 3221225472;
          v63[2] = __99__WFAction_performDeletionAuthorizationChecksWithUserInterface_contentItemCache_completionHandler___block_invoke;
          v63[3] = &unk_1E654E910;
          v63[4] = self;
          v63[5] = v8;
          [v51 presentAlertWithSmartPromptConfiguration:v45 completionHandler:v63];
LABEL_49:

LABEL_50:
          long long v36 = v61;
LABEL_51:

          goto LABEL_52;
        }
      }
    }
    else
    {
    }
    long long v51 = [(WFAction *)self userInterface];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __99__WFAction_performDeletionAuthorizationChecksWithUserInterface_contentItemCache_completionHandler___block_invoke_411;
    v62[3] = &unk_1E654E910;
    void v62[4] = self;
    v62[5] = v8;
    [v51 requestAuthorizationWithConfiguration:v45 completionHandler:v62];
    goto LABEL_49;
  }
  id v9 = getWFSecurityLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v66 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]";
    uint64_t v11 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
LABEL_4:
    _os_log_impl(&dword_1C7F0A000, v11, v12, v10, buf, 0xCu);
  }
LABEL_5:

LABEL_12:
  v8[2](v8, 0);
LABEL_54:
}

void __99__WFAction_performDeletionAuthorizationChecksWithUserInterface_contentItemCache_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2 == 5)
  {
    id v3 = getWFSecurityLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEFAULT, "%s User selected Don't Delete at deletion authorization", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = +[WFDeletionAuthorizationState dontDeleteErrorForContentItemClass:](WFDeletionAuthorizationState, "dontDeleteErrorForContentItemClass:", [*(id *)(a1 + 32) contentItemClass]);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    char v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

void __99__WFAction_performDeletionAuthorizationChecksWithUserInterface_contentItemCache_completionHandler___block_invoke_411(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2 == 5)
  {
    id v3 = getWFSecurityLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[WFAction performDeletionAuthorizationChecksWithUserInterface:contentItemCache:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEFAULT, "%s User selected Don't Delete at deletion authorization", (uint8_t *)&v7, 0xCu);
    }

    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = +[WFDeletionAuthorizationState dontDeleteErrorForContentItemClass:](WFDeletionAuthorizationState, "dontDeleteErrorForContentItemClass:", [*(id *)(a1 + 32) contentItemClass]);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    char v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
}

- (id)itemsBeingDeleted
{
  if ([(WFAction *)self deletesInput])
  {
    id v3 = [(WFAction *)self input];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (BOOL)isRunningInSiriUserInterface
{
  v2 = [(WFAction *)self userInterface];
  char v3 = [v2 isRunningWithSiriUI];

  return v3;
}

- (void)logDataTransmissionForSmartPromptApprovalResult:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = [a3 allowedStates];
  id v5 = objc_msgSend(v4, "if_compactMap:", &__block_literal_global_404);
  id v6 = [v3 setWithArray:v5];

  [v6 enumerateObjectsUsingBlock:&__block_literal_global_407];
}

uint64_t __60__WFAction_logDataTransmissionForSmartPromptApprovalResult___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F5A928] log:a2];
}

id __60__WFAction_logDataTransmissionForSmartPromptApprovalResult___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 contentDestination];
  if (WFActionGreenTeaContentDestinationMayLeaveDevice_onceToken != -1) {
    dispatch_once(&WFActionGreenTeaContentDestinationMayLeaveDevice_onceToken, &__block_literal_global_1136);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v11 = WFActionGreenTeaContentDestinationMayLeaveDevice_dataLeavingContentDestination;
      os_log_type_t v12 = [v3 identifier];
      LOBYTE(v11) = [(id)v11 containsObject:v12];

      if (v11) {
        goto LABEL_15;
      }
LABEL_12:
      id v13 = 0;
      goto LABEL_32;
    }
LABEL_14:

    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_14;
  }
  id v4 = v3;
  id v5 = [v4 app];
  id v6 = [v5 bundleIdentifier];
  char v7 = [v6 hasPrefix:@"com.apple."];

  if ((v7 & 1) == 0)
  {

    goto LABEL_14;
  }
  if (WFActionGreenTeaContentDestinationMayLeaveDevice_onceToken_1141 != -1) {
    dispatch_once(&WFActionGreenTeaContentDestinationMayLeaveDevice_onceToken_1141, &__block_literal_global_1143);
  }
  uint64_t v8 = WFActionGreenTeaContentDestinationMayLeaveDevice_exfiltratingAppBundleIdentifier;
  uint64_t v9 = [v4 app];
  id v10 = [v9 bundleIdentifier];
  LOBYTE(v8) = [(id)v8 containsObject:v10];

  if ((v8 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_15:
  uint64_t v14 = [v2 sourceContentAttribution];
  id v15 = [v14 origin];
  uint64_t v16 = [v15 identifier];

  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = [v15 app];
      id v18 = [v17 bundleIdentifier];
    }
    else
    {
      id v18 = [v15 identifier];
    }
    if ([v18 isEqualToString:*MEMORY[0x1E4FB4B38]])
    {
      uint64_t v19 = (id *)MEMORY[0x1E4F5AB60];
    }
    else if ([v18 isEqualToString:*MEMORY[0x1E4FB4AB8]])
    {
      uint64_t v19 = (id *)MEMORY[0x1E4F5AB58];
    }
    else
    {
      if (([v18 isEqualToString:*MEMORY[0x1E4FB4BD0]] & 1) == 0
        && ([v18 isEqualToString:@"com.apple.shortcuts.microphoneDestination"] & 1) == 0
        && ([v18 isEqualToString:*MEMORY[0x1E4FB4B18]] & 1) == 0
        && ![v18 isEqualToString:*MEMORY[0x1E4FB4B20]])
      {
        id v13 = 0;
        goto LABEL_30;
      }
      uint64_t v19 = (id *)MEMORY[0x1E4F5AB50];
    }
    id v13 = *v19;
LABEL_30:

    goto LABEL_31;
  }
  id v13 = 0;
LABEL_31:

LABEL_32:
  return v13;
}

- (void)presentSmartPromptAuthorizationWithConfiguration:(id)a3 userInterface:(id)a4 databaseApprovalResult:(id)a5 contentDestination:(id)a6 completionHandler:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, void *))a7;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v13 requestedFromAnotherDevice]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __135__WFAction_presentSmartPromptAuthorizationWithConfiguration_userInterface_databaseApprovalResult_contentDestination_completionHandler___block_invoke;
    v25[3] = &unk_1E654E8A8;
    long long v29 = v16;
    id v26 = v15;
    id v27 = self;
    id v28 = v14;
    [v13 presentAlertWithSmartPromptConfiguration:v12 completionHandler:v25];

    id v17 = v26;
LABEL_7:

    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector())
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __135__WFAction_presentSmartPromptAuthorizationWithConfiguration_userInterface_databaseApprovalResult_contentDestination_completionHandler___block_invoke_401;
    v20[3] = &unk_1E654E8A8;
    uint64_t v24 = v16;
    id v21 = v15;
    id v22 = self;
    id v23 = v14;
    [v13 requestAuthorizationWithConfiguration:v12 completionHandler:v20];

    id v17 = v21;
    goto LABEL_7;
  }
  id v18 = getWFSecurityLogObject();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    long long v31 = "-[WFAction presentSmartPromptAuthorizationWithConfiguration:userInterface:databaseApprovalResult:contentDestin"
          "ation:completionHandler:]";
    _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_ERROR, "%s Current UI does not support setting smart prompts", buf, 0xCu);
  }

  uint64_t v19 = +[WFSmartPromptState localizedUnsupportedEnvironmentError];
  v16[2](v16, v19);

LABEL_11:
}

void __135__WFAction_presentSmartPromptAuthorizationWithConfiguration_userInterface_databaseApprovalResult_contentDestination_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2 == 3)
  {
    uint64_t v10 = *(void *)(a1 + 56);
    id v12 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
    (*(void (**)(uint64_t))(v10 + 16))(v10);
  }
  else if (a2 == 2)
  {
    id v6 = getWFSecurityLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[WFAction presentSmartPromptAuthorizationWithConfiguration:userInterface:databaseApprovalResult:contentDest"
            "ination:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_DEFAULT, "%s User selected Allow Once at smart prompt", buf, 0xCu);
    }

    char v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = [*(id *)(a1 + 48) undefinedStates];
    uint64_t v9 = [v7 setWithArray:v8];
    [*(id *)(a1 + 40) setAllowedOnceSmartPromptStates:v9];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else if (a2)
  {
    uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v11();
  }
  else
  {
    id v3 = getWFSecurityLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[WFAction presentSmartPromptAuthorizationWithConfiguration:userInterface:databaseApprovalResult:contentDest"
            "ination:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEFAULT, "%s User selected Deny at smart prompt", buf, 0xCu);
    }

    uint64_t v4 = *(void *)(a1 + 56);
    id v5 = +[WFSmartPromptState localizedDeniedPermissionsErrorWithContentDestination:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

void __135__WFAction_presentSmartPromptAuthorizationWithConfiguration_userInterface_databaseApprovalResult_contentDestination_completionHandler___block_invoke_401(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a2 == 3)
  {
    uint64_t v10 = *(void *)(a1 + 56);
    id v12 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
    (*(void (**)(uint64_t))(v10 + 16))(v10);
  }
  else if (a2 == 2)
  {
    id v6 = getWFSecurityLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[WFAction presentSmartPromptAuthorizationWithConfiguration:userInterface:databaseApprovalResult:contentDest"
            "ination:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_DEFAULT, "%s User selected Allow Once at smart prompt", buf, 0xCu);
    }

    char v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = [*(id *)(a1 + 48) undefinedStates];
    uint64_t v9 = [v7 setWithArray:v8];
    [*(id *)(a1 + 40) setAllowedOnceSmartPromptStates:v9];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else if (a2)
  {
    uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v11();
  }
  else
  {
    id v3 = getWFSecurityLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[WFAction presentSmartPromptAuthorizationWithConfiguration:userInterface:databaseApprovalResult:contentDest"
            "ination:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEFAULT, "%s User selected Deny at smart prompt", buf, 0xCu);
    }

    uint64_t v4 = *(void *)(a1 + 56);
    id v5 = +[WFSmartPromptState localizedDeniedPermissionsErrorWithContentDestination:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (void)performSmartPromptChecksWithUserInterface:(id)a3 contentDestination:(id)a4 contentItemCache:(id)a5 isWebpageCoercion:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = (void (**)(id, void))a7;
  uint64_t v16 = +[WFDatabaseProxy defaultDatabase];

  if (!v16)
  {
    id v17 = getWFSecurityLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v122 = "-[WFAction performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebpageCoercion:"
             "completionHandler:]";
      id v18 = "%s Not performing smart prompt checks because database access is not available.";
      uint64_t v19 = v17;
      os_log_type_t v20 = OS_LOG_TYPE_FAULT;
LABEL_11:
      _os_log_impl(&dword_1C7F0A000, v19, v20, v18, buf, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if ([(WFAction *)self shouldDisableSmartPromptChecks])
  {
    id v17 = getWFSecurityLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v122 = "-[WFAction performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebpageCoercion:"
             "completionHandler:]";
LABEL_10:
      uint64_t v19 = v17;
      os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (![(WFAction *)self requiresRemoteExecution])
  {
    BOOL v95 = a6;
    v100 = (void (**)(void, id))v15;
    v101 = v12;
    id v102 = v14;
    v103 = v13;
    id v21 = [(WFAction *)self workflow];
    id v22 = [v21 actions];
    obuint64_t j = (id)[v22 indexOfObject:self];

    id v23 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v24 = [(WFAction *)self contentAttributionTracker];
    id v25 = [v24 trackedAttributionSet];
    objc_msgSend(v23, "if_addObjectIfNonNil:", v25);

    id v26 = [(WFAction *)self runningDelegate];
    id v27 = [v26 flowTracker];
    id v28 = [v27 attributionSetForCurrentScope];
    objc_msgSend(v23, "if_addObjectIfNonNil:", v28);

    v98 = v23;
    uint64_t v29 = [MEMORY[0x1E4F5A828] attributionSetByMergingAttributionSets:v23];
    uint64_t v30 = [(WFAction *)self runningDelegate];
    long long v31 = [v30 exfiltrationLogger];
    uint64_t v32 = [(WFAction *)self UUID];
    v97 = (void *)v29;
    uint64_t v33 = [v31 attributionSetByRewritingSetWithLoggedCounts:v29 forExfiltratingActionUUID:v32];

    int v34 = +[WFDatabaseProxy defaultDatabase];
    uint64_t v35 = [(WFAction *)self UUID];
    long long v36 = [(WFAction *)self identifier];
    uint64_t v37 = [(WFAction *)self workflow];
    int v38 = [v37 reference];
    v108 = self;
    long long v39 = [(WFAction *)self allowedOnceSmartPromptStates];
    long long v40 = v39;
    if (!v39)
    {
      long long v40 = [MEMORY[0x1E4F1CAD0] set];
    }
    id v120 = 0;
    char v41 = [v34 approvalResultForContentAttributionSet:v33 contentDestination:v103 actionUUID:v35 actionIdentifier:v36 actionIndex:obj reference:v38 allowedOnceStates:v40 error:&v120];
    id v99 = v120;
    if (!v39) {

    }
    v96 = (void *)v33;
    [(WFAction *)v108 setAllowedOnceSmartPromptStates:0];
    char v42 = [v41 actionUUID];
    [(WFAction *)v108 setUUID:v42];

    long long v43 = v99;
    if (v99)
    {
      uint64_t v15 = (void (**)(id, void))v100;
      v100[2](v100, v99);
      id v14 = v102;
      id v13 = v103;
      id v12 = v101;
    }
    else
    {
      long long v44 = [v41 restrictedStates];
      uint64_t v45 = [v44 count];

      id v14 = v102;
      id v13 = v103;
      uint64_t v15 = (void (**)(id, void))v100;
      id v12 = v101;
      if (v45)
      {
        long long v46 = [v41 restrictedStates];
        long long v47 = [v46 firstObject];
        uint64_t v48 = [v47 localizedExfiltrationRestrictedError];
      }
      else
      {
        long long v49 = [v41 deniedStates];
        uint64_t v50 = [v49 count];

        if (!v50)
        {
          long long v119 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          long long v116 = 0u;
          v94 = v41;
          id obja = [v41 allowedStates];
          uint64_t v52 = [obja countByEnumeratingWithState:&v116 objects:v129 count:16];
          if (v52)
          {
            uint64_t v53 = v52;
            uint64_t v54 = *(void *)v117;
            do
            {
              for (uint64_t i = 0; i != v53; ++i)
              {
                if (*(void *)v117 != v54) {
                  objc_enumerationMutation(obja);
                }
                id v56 = *(void **)(*((void *)&v116 + 1) + 8 * i);
                unint64_t v57 = getWFSecurityLogObject();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                {
                  id v58 = [v56 sourceContentAttribution];
                  uint64_t v59 = [v58 count];
                  uint64_t v60 = [v56 sourceContentAttribution];
                  char v61 = [v60 origin];
                  long long v62 = [(WFAction *)v108 UUID];
                  *(_DWORD *)buf = 136315906;
                  v122 = "-[WFAction performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebp"
                         "ageCoercion:completionHandler:]";
                  __int16 v123 = 2048;
                  uint64_t v124 = v59;
                  __int16 v125 = 2112;
                  v126 = v61;
                  __int16 v127 = 2112;
                  v128 = v62;
                  _os_log_impl(&dword_1C7F0A000, v57, OS_LOG_TYPE_DEBUG, "%s Logging allowed exfiltration of %lu items from %@ by action %@", buf, 0x2Au);
                }
                id v63 = [(WFAction *)v108 runningDelegate];
                id v64 = [v63 exfiltrationLogger];
                int v65 = [v56 sourceContentAttribution];
                uint64_t v66 = [v65 count];
                uint64_t v67 = [(WFAction *)v108 UUID];
                id v68 = [v56 sourceContentAttribution];
                id v69 = [v68 origin];
                [v64 logExfiltratedItemsCount:v66 actionUUID:v67 contentOrigin:v69];
              }
              uint64_t v53 = [obja countByEnumeratingWithState:&v116 objects:v129 count:16];
            }
            while (v53);
          }

          char v41 = v94;
          id v70 = [v94 undefinedStates];
          uint64_t v71 = [v70 count];

          if (v71)
          {
            __int16 v72 = @"Shortcut";
            char v73 = @"Shortcut";
            id v12 = v101;
            if ([(WFAction *)v108 isRunningInSiriUserInterface])
            {
              id v74 = getWFSecurityLogObject();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315138;
                v122 = "-[WFAction performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebpag"
                       "eCoercion:completionHandler:]";
                _os_log_impl(&dword_1C7F0A000, v74, OS_LOG_TYPE_DEBUG, "%s Smart prompt is being presented in Siri", buf, 0xCu);
              }

              __int16 v72 = @"Siri";
              id v75 = @"Siri";
            }
            v93 = [WFSmartPromptConfiguration alloc];
            uint64_t v76 = [v94 undefinedStates];
            v104 = [(WFAction *)v108 contentAttributionTracker];
            id v77 = [v104 trackedAttributionSet];
            v78 = [v94 previousAttributions];
            BOOL v79 = [(WFAction *)v108 workflow];
            BOOL v80 = [v79 reference];
            uint64_t v81 = [(WFAction *)v108 workflow];
            v82 = [v81 name];
            LOBYTE(v92) = v95;
            objb = v72;
            id v83 = [(WFSmartPromptConfiguration *)v93 initWithSmartPromptStates:v76 attributionSet:v77 previousAttributions:v78 contentItemCache:v102 action:v108 contentDestination:v103 reference:v80 workflowName:v82 source:v72 isWebpageCoercion:v92];

            uint64_t v84 = v83;
            if (v83)
            {
              long long v43 = 0;
              uint64_t v15 = (void (**)(id, void))v100;
              if ([(WFAction *)v108 isRunningInSiriUserInterface]
                || ![(WFSmartPromptConfiguration *)v83 containsPrivatePreviews])
              {
                char v41 = v94;
                id v13 = v103;
                [(WFAction *)v108 presentSmartPromptAuthorizationWithConfiguration:v83 userInterface:v101 databaseApprovalResult:v94 contentDestination:v103 completionHandler:v100];
                id v14 = v102;
              }
              else
              {
                v85 = getWFSecurityLogObject();
                id v14 = v102;
                id v13 = v103;
                char v41 = v94;
                if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315138;
                  v122 = "-[WFAction performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebp"
                         "ageCoercion:completionHandler:]";
                  _os_log_impl(&dword_1C7F0A000, v85, OS_LOG_TYPE_DEBUG, "%s Requiring device unlock before presenting sensitive smart prompt previews", buf, 0xCu);
                }

                id v86 = objc_alloc_init(WFCompactUnlockService);
                v109[0] = MEMORY[0x1E4F143A8];
                v109[1] = 3221225472;
                v109[2] = __126__WFAction_performSmartPromptChecksWithUserInterface_contentDestination_contentItemCache_isWebpageCoercion_completionHandler___block_invoke;
                v109[3] = &unk_1E654E880;
                v109[4] = v108;
                v110 = v84;
                id v111 = v101;
                id v112 = v94;
                v114 = v86;
                v115 = v100;
                id v113 = v103;
                v87 = v86;
                [(WFCompactUnlockService *)v87 requestUnlockIfNeeded:v109];
              }
            }
            else
            {
              v88 = getWFWorkflowExecutionLogObject();
              long long v43 = 0;
              uint64_t v15 = (void (**)(id, void))v100;
              if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v122 = "-[WFAction performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebpag"
                       "eCoercion:completionHandler:]";
                _os_log_impl(&dword_1C7F0A000, v88, OS_LOG_TYPE_ERROR, "%s Failed to init WFSmartPromptConfiguration for smart prompt.", buf, 0xCu);
              }

              v89 = [(WFAction *)v108 workflow];
              v90 = [v89 name];
              v91 = WFRunnerFailureErrorMessage(v90);
              v100[2](v100, v91);

              id v14 = v102;
              id v13 = v103;
              char v41 = v94;
            }
          }
          else
          {
            [(WFAction *)v108 logDataTransmissionForSmartPromptApprovalResult:v94];
            uint64_t v15 = (void (**)(id, void))v100;
            v100[2](v100, 0);
            id v12 = v101;
            id v14 = v102;
            id v13 = v103;
            long long v43 = 0;
          }
          goto LABEL_25;
        }
        long long v46 = [v41 deniedStates];
        long long v47 = [v46 firstObject];
        uint64_t v48 = [v47 localizedDeniedPermissionsError];
      }
      long long v51 = (void *)v48;

      v100[2](v100, v51);
    }
LABEL_25:

    goto LABEL_13;
  }
  id v17 = getWFSecurityLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v122 = "-[WFAction performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebpageCoercion:co"
           "mpletionHandler:]";
    id v18 = "%s Not performing smart prompt checks because action is executed remotely.";
    goto LABEL_10;
  }
LABEL_12:

  v15[2](v15, 0);
LABEL_13:
}

void __126__WFAction_performSmartPromptChecksWithUserInterface_contentDestination_contentItemCache_isWebpageCoercion_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = getWFSecurityLogObject();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[WFAction performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebpageCoercion:co"
           "mpletionHandler:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEBUG, "%s Device unlocked successfully", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1 + 32) presentSmartPromptAuthorizationWithConfiguration:*(void *)(a1 + 40) userInterface:*(void *)(a1 + 48) databaseApprovalResult:*(void *)(a1 + 56) contentDestination:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 80)];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[WFAction performSmartPromptChecksWithUserInterface:contentDestination:contentItemCache:isWebpageCoercion:co"
           "mpletionHandler:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_INFO, "%s Did not succeed unlocking the device, interrupting execution.", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v6 = *(void *)(a1 + 80);
    char v7 = +[WFSmartPromptState localizedUnlockedDeviceRequiredError];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

- (void)performDataAccessChecksWithUserInterface:(id)a3 contentItemCache:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __88__WFAction_performDataAccessChecksWithUserInterface_contentItemCache_completionHandler___block_invoke;
  v14[3] = &unk_1E654E858;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  [(WFAction *)self getContentDestinationWithCompletionHandler:v14];
}

void __88__WFAction_performDataAccessChecksWithUserInterface_contentItemCache_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    char v7 = getWFSecurityLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 136315650;
      os_log_type_t v20 = "-[WFAction performDataAccessChecksWithUserInterface:contentItemCache:completionHandler:]_block_invoke";
      __int16 v21 = 2114;
      id v22 = v8;
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Failed to get content destination for action %{public}@: %{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __88__WFAction_performDataAccessChecksWithUserInterface_contentItemCache_completionHandler___block_invoke_384;
    void v12[3] = &unk_1E654E830;
    id v13 = 0;
    id v9 = *(id *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(a1 + 40);
    id v18 = v9;
    uint64_t v14 = v10;
    id v15 = v11;
    id v16 = *(id *)(a1 + 48);
    id v17 = v5;
    +[WFScreenTimeHelper isContentDestinationAllowedByScreenTimeSettings:v17 completionHandler:v12];
  }
}

void __88__WFAction_performDataAccessChecksWithUserInterface_contentItemCache_completionHandler___block_invoke_384(uint64_t a1, char a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    id v12 = getWFSecurityLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "-[WFAction performDataAccessChecksWithUserInterface:contentItemCache:completionHandler:]_block_invoke";
      __int16 v22 = 2112;
      uint64_t v23 = v13;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_ERROR, "%s WFScreenTimeHelper will block execution with error %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __88__WFAction_performDataAccessChecksWithUserInterface_contentItemCache_completionHandler___block_invoke_385;
    v14[3] = &unk_1E654FD98;
    id v19 = *(id *)(a1 + 72);
    id v9 = *(id *)(a1 + 64);
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = *(void **)(a1 + 48);
    id v15 = v9;
    uint64_t v16 = v10;
    id v17 = v11;
    id v18 = *(id *)(a1 + 56);
    [v6 performDeletionAuthorizationChecksWithUserInterface:v7 contentItemCache:v8 completionHandler:v14];
  }
}

void __88__WFAction_performDataAccessChecksWithUserInterface_contentItemCache_completionHandler___block_invoke_385(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
LABEL_3:
    v4();
    goto LABEL_10;
  }
  if (!*(void *)(a1 + 32))
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    goto LABEL_3;
  }
  id v5 = [[WFMDMVerifier alloc] initWithAction:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = 0;
  BOOL v7 = [(WFMDMVerifier *)v5 canSendDataToContentDestination:v6 error:&v9];
  id v8 = v9;
  if (v7) {
    [*(id *)(a1 + 40) performSmartPromptChecksWithUserInterface:*(void *)(a1 + 48) contentDestination:*(void *)(a1 + 32) contentItemCache:*(void *)(a1 + 56) isWebpageCoercion:0 completionHandler:*(void *)(a1 + 64)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }

LABEL_10:
}

- (BOOL)isSubclassThatOverridesSelector:(SEL)a3
{
  id v5 = objc_opt_class();
  uint64_t v6 = [(WFAction *)self methodForSelector:a3];
  return v6 != [v5 instanceMethodForSelector:a3];
}

- (BOOL)shouldDisableSmartPromptChecks
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFAction *)self runningDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    return 0;
  }
  uint64_t v4 = [(WFAction *)self runningDelegate];
  int v5 = [v4 shouldDisablePrivacyPrompts];

  if (!v5) {
    return 0;
  }
  uint64_t v6 = getWFSecurityLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315138;
    id v9 = "-[WFAction shouldDisableSmartPromptChecks]";
    _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_DEBUG, "%s Exempting action from smart prompts due to workflow controller flag.", (uint8_t *)&v8, 0xCu);
  }

  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  if ([(WFAction *)self isSubclassThatOverridesSelector:sel_runWithInput_completionHandler_])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __39__WFAction_runAsynchronouslyWithInput___block_invoke;
    v11[3] = &unk_1E6557668;
    void v11[4] = self;
    [(WFAction *)self runWithInput:v4 completionHandler:v11];
  }
  else
  {
    int v5 = [(WFAction *)self userInterfaceClasses];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __39__WFAction_runAsynchronouslyWithInput___block_invoke_3;
      v9[3] = &unk_1E654E808;
      void v9[4] = self;
      id v10 = v4;
      [(WFAction *)self requestInterfacePresentationWithCompletionHandler:v9];
    }
    else
    {
      id v8 = 0;
      [(WFAction *)self runWithInput:v4 error:&v8];
      id v7 = v8;
      [(WFAction *)self finishRunningWithError:v7];
    }
  }
}

void __39__WFAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) effectiveWorkQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__WFAction_runAsynchronouslyWithInput___block_invoke_2;
  v6[3] = &unk_1E6558938;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __39__WFAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 runWithRemoteUserInterface:a2 input:*(void *)(a1 + 40)];
  }
  else {
    return objc_msgSend(v3, "finishRunningWithError:");
  }
}

uint64_t __39__WFAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishRunningWithError:*(void *)(a1 + 40)];
}

- (void)runWithInput:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    id v7 = NSString;
    id v8 = WFLocalizedString(@"The action being run (%@) is missing an implementation.");
    id v9 = [(WFAction *)self localizedName];
    id v10 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v9, v12);
    v13[0] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a4 = [v6 errorWithDomain:@"WFActionErrorDomain" code:3 userInfo:v11];
  }
}

- (OS_dispatch_queue)effectiveWorkQueue
{
  void v10[2] = *MEMORY[0x1E4F143B8];
  effectiveWorkQueue = self->_effectiveWorkQueue;
  if (!effectiveWorkQueue)
  {
    id v4 = [(WFAction *)self resourceManager];
    v10[0] = objc_opt_class();
    v10[1] = objc_opt_class();
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    [v4 refreshAvailabilityOfRequiredResourcesOfClasses:v5];
    if ([v4 currentlyRequiresResourceOfClasses:v5])
    {
      uint64_t v6 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v7 = MEMORY[0x1E4F14428];
    }
    else
    {
      uint64_t v6 = [(WFAction *)self workQueue];
    }
    id v8 = self->_effectiveWorkQueue;
    self->_effectiveWorkQueue = v6;

    effectiveWorkQueue = self->_effectiveWorkQueue;
  }
  return effectiveWorkQueue;
}

- (NSSet)ignoredParameterKeysForProcessing
{
  ignoredParameterKeysForProcessing = self->_ignoredParameterKeysForProcessing;
  if (!ignoredParameterKeysForProcessing)
  {
    id v4 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    id v5 = self->_ignoredParameterKeysForProcessing;
    self->_ignoredParameterKeysForProcessing = v4;

    ignoredParameterKeysForProcessing = self->_ignoredParameterKeysForProcessing;
  }
  return ignoredParameterKeysForProcessing;
}

- (void)setRunningDelegate:(id)a3
{
}

- (id)parametersRequiringUserInputAlongsideParameter:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v22 = (id)objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = [(WFAction *)self parameters];
  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    uint64_t v23 = *(void *)v31;
    do
    {
      uint64_t v8 = 0;
      uint64_t v24 = v6;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(id *)(*((void *)&v30 + 1) + 8 * v8);
        if (v9 != v4)
        {
          id v10 = [*(id *)(*((void *)&v30 + 1) + 8 * v8) resourceManager];
          char v11 = [v10 resourcesRequiredForDisplayAvailable];

          if ((v11 & 1) == 0)
          {
            long long v28 = 0u;
            long long v29 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            uint64_t v12 = [v9 resourceManager];
            uint64_t v13 = [v12 resourceObjectsOfClass:objc_opt_class()];

            uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v27;
              while (2)
              {
                for (uint64_t i = 0; i != v15; ++i)
                {
                  if (*(void *)v27 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  id v18 = [*(id *)(*((void *)&v26 + 1) + 8 * i) parameterKey];
                  id v19 = [v4 key];
                  int v20 = [v18 isEqualToString:v19];

                  if (v20)
                  {
                    [v22 addObject:v9];
                    goto LABEL_18;
                  }
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
                if (v15) {
                  continue;
                }
                break;
              }
            }
LABEL_18:

            uint64_t v7 = v23;
            uint64_t v6 = v24;
          }
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }

  return v22;
}

- (void)askForValuesOfParameters:(id)a3 withDefaultStates:(id)a4 prompts:(id)a5 input:(id)a6 workQueue:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = a5;
  id v19 = a4;
  int v20 = [(WFAction *)self inputParameter];
  LODWORD(a4) = [v14 containsObject:v20];

  if (a4)
  {

    id v15 = 0;
  }
  __int16 v21 = [(WFAction *)self runningDelegate];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __97__WFAction_askForValuesOfParameters_withDefaultStates_prompts_input_workQueue_completionHandler___block_invoke;
  v25[3] = &unk_1E654E7E0;
  void v25[4] = self;
  id v26 = v15;
  id v27 = v16;
  id v28 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v17;
  [v21 action:self provideInputForParameters:v14 withDefaultStates:v19 prompts:v18 completionHandler:v25];
}

void __97__WFAction_askForValuesOfParameters_withDefaultStates_prompts_input_workQueue_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __97__WFAction_askForValuesOfParameters_withDefaultStates_prompts_input_workQueue_completionHandler___block_invoke_2;
    v8[3] = &unk_1E6555C38;
    v8[4] = v5;
    uint64_t v7 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    [v5 processParameterStates:a2 withInput:v6 skippingHiddenParameters:0 askForValuesIfNecessary:1 workQueue:v7 completionHandler:v8];
  }
}

void __97__WFAction_askForValuesOfParameters_withDefaultStates_prompts_input_workQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, id obj, void *a4)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), obj);
  id v8 = obj;
  id v9 = a4;
  id v10 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (Class)toolkitValueClassForParameter:(id)a3
{
  return (Class)[a3 toolkitValueClass];
}

- (void)processValueForParameter:(id)a3 withToolKitInvocation:(id)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [(WFAction *)self toolkitValueClassForParameter:v11];
  if (!v12)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"WFAction.m" lineNumber:1127 description:@"The parameter state doesn't define a processing value classes"];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFAction.m", 1128, @"Invalid parameter not satisfying: %@", @"toolInvocation" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v13 = [(WFAction *)self variableSource];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __77__WFAction_processValueForParameter_withToolKitInvocation_completionHandler___block_invoke;
  v17[3] = &unk_1E6550860;
  id v18 = v9;
  id v14 = v9;
  [v10 valueForParameter:v11 ofClass:v12 variableSource:v13 completionHandler:v17];
}

void __77__WFAction_processValueForParameter_withToolKitInvocation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 domain];
  uint64_t v7 = +[WFToolInvocation errorDomain];
  if ([v6 isEqualToString:v7])
  {
    uint64_t v8 = [v5 code];

    if (v8 == 1)
    {
      id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_6:
  v9();
}

- (void)processEncodedValue:(id)a3 withToolKitInvocation:(id)a4 forParameter:(id)a5 completionHandler:(id)a6
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(WFAction *)self toolkitValueClassForParameter:v12];
  if (v15)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"WFAction.m" lineNumber:1111 description:@"The parameter state doesn't define a processing value classes"];

    if (v13) {
      goto LABEL_3;
    }
  }
  id v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"WFAction.m", 1112, @"Invalid parameter not satisfying: %@", @"toolInvocation" object file lineNumber description];

LABEL_3:
  id v18 = [(WFAction *)self variableSource];
  [v13 processedValueFromEncodedValue:v14 forParameter:v12 ofClass:v15 variableSource:v18 completionHandler:v11];
}

uint64_t __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSNumber;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  id v9 = NSNumber;
  uint64_t v10 = [*(id *)(a1 + 32) indexOfObject:v7];

  id v11 = [v9 numberWithUnsignedInteger:v10];
  uint64_t v12 = [v8 compare:v11];

  return v12;
}

void __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  [v7 addEntriesFromDictionary:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v6 = [*(id *)(a1 + 32) ignoredParameterKeysForProcessing];
    id v7 = [*(id *)(a1 + 40) key];
    char v8 = [v6 containsObject:v7];

    if ((v8 & 1) == 0)
    {
      [*(id *)(a1 + 48) addObject:*(void *)(a1 + 40)];
      id v9 = *(void **)(a1 + 48);
      uint64_t v10 = [*(id *)(a1 + 32) parametersRequiringUserInputAlongsideParameter:*(void *)(a1 + 40)];
      id v11 = [v10 allObjects];
      [v9 addObjectsFromArray:v11];

      [*(id *)(a1 + 56) setValue:v5 forKey:*(void *)(a1 + 64)];
      uint64_t v12 = *(void **)(a1 + 72);
      id v13 = [[WFParameterPrompt alloc] initWithPrompt:v14 linkDialog:0];
      [v12 setValue:v13 forKey:*(void *)(a1 + 64)];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
}

void __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_3(void *a1, uint64_t a2, void *a3)
{
  id v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  id v7 = a3;
  [v5 setValue:a2 forKey:v6];
  (*(void (**)(void))(a1[6] + 16))();
}

void __123__WFAction__processParameterStates_withInput_skippingHiddenParameters_askForValuesIfNecessary_workQueue_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    id v6 = a3;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void, id, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7, a3);
  }
}

- (BOOL)usesLegacyInputBehavior
{
  id v3 = [(WFAction *)self inputTypes];
  if ([v3 count] || -[WFAction inputPassthrough](self, "inputPassthrough"))
  {
    id v4 = [(WFAction *)self inputParameter];
    BOOL v5 = v4 == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)processParametersWithoutAskingForValuesWithInput:(id)a3 workQueue:(id)a4 completionHandler:(id)a5
{
}

- (id)copyParameterStates
{
  return [(WFAction *)self copyParameterStatesWithFallingBackToDefaultValue:1];
}

- (id)populatedInputWithProcessedParameterValues:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(WFAction *)self inputParameterKey];
  id v6 = objc_msgSend(v4, "wf_popObjectForKey:", v5);

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v6;
      }
      else
      {
        v12[0] = v6;
        id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
      }
      id v9 = v8;
      uint64_t v10 = objc_msgSend(v8, "if_compactMap:", &__block_literal_global_345_8534);
      id v7 = [MEMORY[0x1E4F5A830] collectionWithItems:v10];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id __55__WFAction_populatedInputWithProcessedParameterValues___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [MEMORY[0x1E4F5A848] itemWithFile:v2];
  }
  else {
  id v3 = [MEMORY[0x1E4F5A848] itemWithObject:v2];
  }

  return v3;
}

- (BOOL)populatesInputFromInputParameter
{
  return 1;
}

- (BOOL)shouldAskForValuesWhileProcessingParameterStates
{
  return 1;
}

- (BOOL)getInputContentFromVariablesInParameterState:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v8 variableString];
    uint64_t v12 = [v9 parameter];
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
    id v19 = v13;

    int v20 = [v19 processesIntoContentItems];
    if (v20)
    {
      __int16 v21 = (void *)MEMORY[0x1E4F5A7D8];
      uint64_t v33 = *MEMORY[0x1E4F5AAC8];
      id v22 = [[WFActionContentPermissionRequestor alloc] initWithAction:self];
      v34[0] = v22;
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      id v24 = [v21 optionsWithDictionary:v23];

      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __83__WFAction_getInputContentFromVariablesInParameterState_context_completionHandler___block_invoke;
      v31[3] = &unk_1E6556D78;
      id v32 = v10;
      [v11 processIntoStringsAndAttachmentsWithContext:v9 options:v24 completionHandler:v31];
    }
    else
    {
      if (![v11 representsSingleContentVariable])
      {
        BOOL v16 = 0;
        goto LABEL_23;
      }
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __83__WFAction_getInputContentFromVariablesInParameterState_context_completionHandler___block_invoke_2;
      v29[3] = &unk_1E6556D78;
      id v30 = v10;
      [v11 processIntoContentItemsWithContext:v9 completionHandler:v29];
      id v24 = v30;
    }

    BOOL v16 = 1;
LABEL_23:

    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v8;
    id v14 = [v11 variable];

    if (v14)
    {
      id v15 = [v11 variable];
      [v15 getContentWithContext:v9 completionHandler:v10];
      BOOL v16 = 1;
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v25 = [v11 parameterStates];
    uint64_t v26 = [v25 count];

    if (v26 == 1)
    {
      id v15 = [v11 parameterStates];
      id v27 = [v15 firstObject];
      BOOL v16 = [(WFAction *)self getInputContentFromVariablesInParameterState:v27 context:v9 completionHandler:v10];

      goto LABEL_22;
    }

LABEL_25:
    BOOL v16 = 0;
    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_25;
    }
  }
  id v17 = [v8 containedVariables];
  id v18 = [v17 firstObject];

  if (!v18) {
    goto LABEL_25;
  }
  [v18 getContentWithContext:v9 completionHandler:v10];

  BOOL v16 = 1;
LABEL_26:

  return v16;
}

uint64_t __83__WFAction_getInputContentFromVariablesInParameterState_context_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __83__WFAction_getInputContentFromVariablesInParameterState_context_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)previousAction
{
  id v3 = [(WFAction *)self workflow];
  id v4 = [v3 actions];

  uint64_t v5 = [v4 indexOfObject:self];
  id v6 = 0;
  if (v5 && v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [v4 objectAtIndex:v5 - 1];
  }

  return v6;
}

- (BOOL)requiresPrivateOutputLogging
{
  return 0;
}

- (void)runWithInput:(id)a3 userInterface:(id)a4 runningDelegate:(id)a5 variableSource:(id)a6 workQueue:(id)a7 completionHandler:(id)a8
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = (void (**)(id, void, void *))a8;
  if (self->_running)
  {
    id v19 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F28798], 37, 0, v31);
    v18[2](v18, 0, v19);
  }
  else
  {
    int v20 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = [(WFAction *)self description];
      *(_DWORD *)buf = 136315394;
      long long v40 = "-[WFAction runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:]";
      __int16 v41 = 2114;
      char v42 = v21;
      _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_DEFAULT, "%s Action %{public}@ started running", buf, 0x16u);
    }
    id v22 = getWFRunningLifecycleLogObject();
    id v23 = (char *)os_signpost_id_generate(v22);

    id v24 = getWFRunningLifecycleLogObject();
    uint64_t v25 = v24;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      uint64_t v26 = [(WFAction *)self identifier];
      *(_DWORD *)buf = 138543362;
      long long v40 = v26;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v25, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v23, "RunAction", " enableTelemetry=YES actionID=%{signpost.telemetry:string1,public}@", buf, 0xCu);
    }
    [(WFAction *)self setRunning:1];
    [(WFAction *)self setUserInterface:v14];
    [(WFAction *)self setRunningDelegate:v15];
    [(WFAction *)self setVariableSource:v16];
    [(WFAction *)self setWorkQueue:v17];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke;
    block[3] = &unk_1E6558B28;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_initWeak((id *)buf, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_3;
    aBlock[3] = &unk_1E654E5B8;
    objc_copyWeak(v37, (id *)buf);
    v37[1] = v23;
    uint64_t v36 = v18;
    id v27 = _Block_copy(aBlock);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = v27;

    long long v29 = [MEMORY[0x1E4FB46B8] currentDevice];
    if ([(WFAction *)self isDisabledWhenRunOnDevice:v29])
    {
      id v30 = objc_msgSend(MEMORY[0x1E4F28C58], "wf_unsupportedActionErrorWithType:platformIdiom:", @"NotAvailableOnSpecifiedPlatform", objc_msgSend(v29, "idiom"));
      [(WFAction *)self finishRunningWithError:v30];
    }
    else
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_318;
      v32[3] = &unk_1E654E680;
      v32[4] = self;
      id v33 = v31;
      id v34 = v17;
      [(WFAction *)self prepareToProcessWithCompletionHandler:v32];
    }
    objc_destroyWeak(v37);
    objc_destroyWeak((id *)buf);
  }
}

uint64_t __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_2;
  v3[3] = &unk_1E654E590;
  v3[4] = v1;
  return [v1 enumerateObservers:v3];
}

void __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (!v6)
  {
    int v11 = [WeakRetained requiresPrivateOutputLogging];
    id v9 = getWFWorkflowExecutionLogObject();
    BOOL v12 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (!v12) {
        goto LABEL_10;
      }
      uint64_t v13 = [v5 numberOfItems];
      id v14 = [v5 items];
      id v15 = [v14 firstObject];
      int v23 = 136315907;
      id v24 = "-[WFAction runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:]_block_invoke";
      __int16 v25 = 2114;
      uint64_t v26 = v8;
      __int16 v27 = 2048;
      uint64_t v28 = v13;
      __int16 v29 = 2113;
      uint64_t v30 = (uint64_t)v15;
      id v16 = "%s Action %{public}@ finished with output of %ld items and first item: %{private}@";
    }
    else
    {
      if (!v12) {
        goto LABEL_10;
      }
      uint64_t v17 = [v5 numberOfItems];
      id v14 = [v5 items];
      id v15 = [v14 firstObject];
      int v23 = 136315906;
      id v24 = "-[WFAction runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:]_block_invoke";
      __int16 v25 = 2114;
      uint64_t v26 = v8;
      __int16 v27 = 2048;
      uint64_t v28 = v17;
      __int16 v29 = 2112;
      uint64_t v30 = (uint64_t)v15;
      id v16 = "%s Action %{public}@ finished with output of %ld items and first item: %@";
    }
    _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v23, 0x2Au);

    goto LABEL_10;
  }
  id v9 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = [v6 domain];
    int v23 = 136316162;
    id v24 = "-[WFAction runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:]_block_invoke_3";
    __int16 v25 = 2114;
    uint64_t v26 = v8;
    __int16 v27 = 2114;
    uint64_t v28 = (uint64_t)v10;
    __int16 v29 = 2048;
    uint64_t v30 = [v6 code];
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Action %{public}@ finished with error {domain: %{public}@, code: %ld}. %@", (uint8_t *)&v23, 0x34u);
  }
LABEL_10:

  id v18 = getWFRunningLifecycleLogObject();
  id v19 = v18;
  os_signpost_id_t v20 = *(void *)(a1 + 48);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(v23) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v19, OS_SIGNPOST_INTERVAL_END, v20, "RunAction", " enableTelemetry=YES ", (uint8_t *)&v23, 2u);
  }

  [v8 setUserInterface:0];
  [v8 setProcessedParameters:0];
  [v8 setIgnoredParameterKeysForProcessing:0];
  [v8 setRunningDelegate:0];
  [v8 setVariableSource:0];
  [v8 setContentAttributionTracker:0];
  [v8 setContentPermissionRequestor:0];
  __int16 v21 = (void *)v8[16];
  v8[16] = 0;

  uint64_t v22 = *(void *)(a1 + 32);
  if (v22) {
    (*(void (**)(uint64_t, id, id))(v22 + 16))(v22, v5, v6);
  }
}

void __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_318(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 finishRunningWithError:a2];
  }
  else
  {
    id v4 = [v3 resourceManager];
    id v5 = [*(id *)(a1 + 32) userInterface];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_2_319;
    v7[3] = &unk_1E654E658;
    id v6 = *(void **)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    id v8 = v6;
    id v9 = *(id *)(a1 + 48);
    [v4 makeAccessResourcesAvailableWithUserInterface:v5 completionHandler:v7];
  }
}

void __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_2_319(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v47;
    uint64_t v7 = *MEMORY[0x1E4F5ABE8];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v47 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        id v10 = [v9 domain];
        if ([v10 isEqualToString:v7])
        {
          uint64_t v11 = [v9 code];

          if (!v11)
          {
            [*(id *)(a1 + 32) finishRunningWithError:v9];
            id v24 = v3;
            goto LABEL_30;
          }
        }
        else
        {
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v5);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  BOOL v12 = [*(id *)(a1 + 32) resourceManager];
  id v24 = [v12 unavailableResources];

  uint64_t v13 = [v24 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (!v13) {
    goto LABEL_20;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v43;
  while (2)
  {
    for (uint64_t j = 0; j != v14; ++j)
    {
      if (*(void *)v43 != v15) {
        objc_enumerationMutation(v24);
      }
      uint64_t v17 = *(void **)(*((void *)&v42 + 1) + 8 * j);
      id v18 = [v17 availabilityError];

      if (v18)
      {
        __int16 v25 = [v17 availabilityError];
        int v26 = objc_msgSend(v25, "wf_isUnsupportedOnPlatformError");

        if (v26)
        {
          __int16 v27 = *(void **)(a1 + 32);
          uint64_t v28 = [v17 availabilityError];
          [v27 finishRunningWithError:v28];
LABEL_29:

          goto LABEL_30;
        }
        uint64_t v28 = [v17 availabilityError];
        __int16 v29 = objc_opt_new();
        uint64_t v30 = NSString;
        __int16 v31 = WFLocalizedString(@"Could not run “%@”");
        id v32 = [*(id *)(a1 + 32) localizedName];
        uint64_t v33 = objc_msgSend(v30, "localizedStringWithFormat:", v31, v32);
        [v29 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F28588]];

        id v34 = [v28 localizedFailureReason];

        if (v34)
        {
          uint64_t v35 = [v28 localizedFailureReason];
        }
        else
        {
          uint64_t v36 = [v28 localizedDescription];

          if (!v36)
          {
LABEL_28:
            int v38 = *(void **)(a1 + 32);
            long long v39 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFActionErrorDomain" code:1 userInfo:v29];
            [v38 finishRunningWithError:v39];

            goto LABEL_29;
          }
          uint64_t v35 = [v28 localizedDescription];
        }
        uint64_t v37 = (void *)v35;
        [v29 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F28568]];

        goto LABEL_28;
      }
    }
    uint64_t v14 = [v24 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v14) {
      continue;
    }
    break;
  }
LABEL_20:

  [*(id *)(a1 + 32) willBeginProcessingParameterStates];
  id v24 = (void *)[*(id *)(a1 + 32) copyParameterStates];
  id v19 = *(void **)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 40);
  uint64_t v21 = [v19 skipsProcessingHiddenParameters];
  uint64_t v22 = [*(id *)(a1 + 32) shouldAskForValuesWhileProcessingParameterStates];
  int v23 = *(void **)(a1 + 48);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_3_326;
  v40[3] = &unk_1E654E630;
  v40[4] = *(void *)(a1 + 32);
  id v41 = v23;
  [v19 processParameterStates:v24 withInput:v20 skippingHiddenParameters:v21 askForValuesIfNecessary:v22 workQueue:v41 completionHandler:v40];

LABEL_30:
}

void __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_3_326(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    [*(id *)(a1 + 32) finishRunningWithError:v9];
  }
  else
  {
    id v10 = v8;
    if (!v8) {
      id v10 = objc_opt_new();
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), v10);
    if (!v8) {

    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_4;
    v19[3] = &unk_1E654E5E0;
    v19[4] = *(void *)(a1 + 32);
    uint64_t v11 = objc_msgSend(v7, "if_compactMap:", v19);
    [*(id *)(a1 + 32) setProcessedParameters:v11];

    BOOL v12 = [WFActionDidProcessParametersTestingEvent alloc];
    uint64_t v13 = *(void **)(a1 + 32);
    uint64_t v14 = [v13 processedParameters];
    uint64_t v15 = [(WFActionDidProcessParametersTestingEvent *)v12 initWithAction:v13 processedParameters:v14];

    id v16 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_5;
    v17[3] = &unk_1E6555AC8;
    void v17[4] = v16;
    id v18 = *(id *)(a1 + 40);
    [v16 handleTestingEvent:v15 completionHandler:v17];
  }
}

void __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v11 = a3;
  id v8 = [*(id *)(a1 + 32) parameterForKey:a2];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v8)
  {
    id v9 = [*(id *)(a1 + 32) contentAttributionTracker];
    id v10 = [v9 attributionSetForParameter:v8];

    *a5 = [v11 collectionByMergingAttributionSet:v10];
  }
}

void __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_5(uint64_t a1, char a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    int v4 = [v3 inputPassthrough];
    uint64_t v5 = *(void **)(a1 + 32);
    if (v4 && !v5[17])
    {
      uint64_t v6 = [v5 input];
      uint64_t v7 = [v6 copy];
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(void **)(v8 + 136);
      *(void *)(v8 + 136) = v7;

      uint64_t v5 = *(void **)(a1 + 32);
    }
    id v10 = [v5 inputParameterKey];

    if (!v10)
    {
      id v11 = [*(id *)(a1 + 32) previousAction];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      BOOL v12 = [*(id *)(a1 + 32) containedVariablesOfClass:objc_opt_class()];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v34 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = [*(id *)(*((void *)&v33 + 1) + 8 * i) outputUUID];
            id v18 = [v11 UUID];
            char v19 = [v17 isEqualToString:v18];

            if (v19)
            {
              char v20 = 0;
              goto LABEL_19;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
      char v20 = 1;
LABEL_19:

      char v21 = [*(id *)(a1 + 32) inputRequired];
      if ((v20 & 1) == 0 && (v21 & 1) == 0)
      {
        uint64_t v22 = objc_opt_new();
        uint64_t v23 = *(void *)(a1 + 32);
        id v24 = *(void **)(v23 + 128);
        *(void *)(v23 + 128) = v22;
      }
    }
    if ([*(id *)(a1 + 32) showsImplicitChooseFromListWhenRunWithInput:*(void *)(*(void *)(a1 + 32) + 128)])
    {
      __int16 v25 = objc_opt_class();
      int v26 = *(void **)(a1 + 32);
      uint64_t v27 = v26[16];
      uint64_t v28 = [v26 userInterface];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_6;
      v31[3] = &unk_1E6558B28;
      uint64_t v29 = *(void *)(a1 + 40);
      uint64_t v32 = *(void *)(a1 + 32);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      id v30[2] = __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_7;
      v30[3] = &unk_1E654E608;
      v30[4] = v32;
      [v25 showImplicitChooseFromListWithInput:v27 userInterface:v28 workQueue:v29 cancelHandler:v31 selectionHandler:v30];
    }
    else
    {
      [*(id *)(a1 + 32) performDataAndHardwareAccessChecksAndRun];
    }
  }
  else
  {
    objc_msgSend(v3, "finishRunningWithError:");
  }
}

uint64_t __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), a2);
  id v7 = a2;
  int v4 = [*(id *)(a1 + 32) contentAttributionTracker];
  uint64_t v5 = [v7 attributionSet];
  uint64_t v6 = [*(id *)(a1 + 32) inputParameter];
  [v4 replaceAttributionSet:v5 forParameter:v6];

  [*(id *)(a1 + 32) performDataAndHardwareAccessChecksAndRun];
}

void __98__WFAction_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 actionRunningStateDidChange:*(void *)(a1 + 32)];
  }
}

- (id)generatedResourceNodes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v4 = [(WFAction *)self appResource];

  if (v4)
  {
    uint64_t v5 = [(WFAction *)self appResource];
    [v5 setDelegate:self];

    uint64_t v6 = [WFResourceNode alloc];
    id v7 = [(WFAction *)self appResource];
    uint64_t v8 = [(WFResourceNode *)v6 initWithResource:v7];

    [v3 addObject:v8];
  }
  id v9 = [(WFAction *)self displayableAppDescriptor];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 bundleIdentifier];
    if (!v11) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v15 = [(WFAction *)self appDescriptor];
  id v11 = [v15 bundleIdentifier];

  if (v11)
  {
LABEL_5:
    BOOL v12 = [[WFAppProtectionAccessResource alloc] initWithAssociatedAppBundleIdentifier:v11];
    uint64_t v13 = [[WFResourceNode alloc] initWithResource:v12];
    [v3 addObject:v13];
  }
LABEL_6:

  return v3;
}

- (void)recreateGeneratedResourcesIfNeeded
{
  id v3 = [(WFAction *)self generatedResourceNodes];
  [(WFAction *)self setCurrentGeneratedResourceNodes:v3];
}

- (void)recreateUnevaluatedResourcesIfNeeded
{
  id v3 = [(WFAction *)self requiredResources];
  id v6 = +[WFResourceNode nodesWithDefinitions:v3];

  int v4 = [(WFAction *)self currentGeneratedResourceNodes];
  uint64_t v5 = [v6 arrayByAddingObjectsFromArray:v4];
  [(WFAction *)self setCurrentUnevaluatedResourceNodes:v5];
}

- (void)recreateResourcesIfNeeded
{
  [(WFAction *)self recreateGeneratedResourcesIfNeeded];
  [(WFAction *)self recreateUnevaluatedResourcesIfNeeded];
}

- (id)unevaluatedResourceNodes
{
  currentUnevaluatedResourceNodes = self->_currentUnevaluatedResourceNodes;
  if (!currentUnevaluatedResourceNodes)
  {
    [(WFAction *)self recreateUnevaluatedResourcesIfNeeded];
    currentUnevaluatedResourceNodes = self->_currentUnevaluatedResourceNodes;
  }
  return currentUnevaluatedResourceNodes;
}

- (id)unevaluatedResourceObjectsOfClasses:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  id v6 = [(WFAction *)self unevaluatedResourceNodes];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) addResourceObjectsOfClassesOrProtocols:v4 toSet:v5];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)unevaluatedResourceObjectsOfClass:(Class)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  uint64_t v5 = [(WFAction *)self unevaluatedResourceObjectsOfClasses:v4];

  return v5;
}

- (void)setCurrentGeneratedResourceNodes:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = self->_resourceManager;
  uint64_t v7 = v6;
  p_currentGeneratedResourceNodes = &self->_currentGeneratedResourceNodes;
  uint64_t v30 = v6;
  if (self->_currentGeneratedResourceNodes)
  {
    id v29 = v5;
    -[WFResourceManager removeResourceNodes:](v6, "removeResourceNodes:");
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v9 = *p_currentGeneratedResourceNodes;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = [*(id *)(*((void *)&v35 + 1) + 8 * i) resource];
          long long v15 = v14;
          if (v14)
          {
            if ([v14 conformsToProtocol:&unk_1F2324148]) {
              id v16 = v15;
            }
            else {
              id v16 = 0;
            }
          }
          else
          {
            id v16 = 0;
          }
          id v17 = v16;

          [v17 setWorkflow:0];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v11);
    }

    id v5 = v29;
    uint64_t v7 = v30;
  }
  objc_storeStrong((id *)&self->_currentGeneratedResourceNodes, a3);
  if (*p_currentGeneratedResourceNodes)
  {
    -[WFResourceManager addResourceNodes:](v7, "addResourceNodes:");
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = *p_currentGeneratedResourceNodes;
    uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          id v24 = [(WFAction *)self workflow];
          __int16 v25 = [v23 resource];
          int v26 = v25;
          if (v25)
          {
            if ([v25 conformsToProtocol:&unk_1F2324148]) {
              uint64_t v27 = v26;
            }
            else {
              uint64_t v27 = 0;
            }
          }
          else
          {
            uint64_t v27 = 0;
          }
          id v28 = v27;

          [v28 setWorkflow:v24];
        }
        uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v20);
    }

    uint64_t v7 = v30;
  }
}

- (id)createResourceManager
{
  id v3 = [WFResourceManager alloc];
  id v4 = [(WFAction *)self requiredResources];
  id v5 = [(WFResourceManager *)v3 initWithDefinitions:v4];

  return v5;
}

- (WFResourceManager)resourceManager
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_resourceManagerLocuint64_t k = &self->_resourceManagerLock;
  os_unfair_lock_lock(&self->_resourceManagerLock);
  if (!self->_resourceManager)
  {
    id v4 = getWFGeneralLogObject();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);

    id v6 = getWFGeneralLogObject();
    uint64_t v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      uint64_t v8 = [(WFAction *)self identifier];
      uint64_t v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      int v17 = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "CreateResourceManager", "identifier=%{signpost.description:attribute}@,class=%{signpost.description:attribute}@", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v11 = [(WFAction *)self createResourceManager];
    resourceManager = self->_resourceManager;
    self->_resourceManager = v11;

    [(WFAction *)self recreateResourcesIfNeeded];
    WFConfigureParameterRelationResources(self->_resourceManager, self);
    long long v13 = getWFGeneralLogObject();
    long long v14 = v13;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v14, OS_SIGNPOST_INTERVAL_END, v5, "CreateResourceManager", "", (uint8_t *)&v17, 2u);
    }
  }
  os_unfair_lock_unlock(p_resourceManagerLock);
  long long v15 = self->_resourceManager;
  return v15;
}

- (void)parameterDefaultSerializedRepresentationDidChange:(id)a3
{
  id v9 = a3;
  id v4 = [(WFAction *)self cachedDefaultParameterStates];
  os_signpost_id_t v5 = [v9 key];
  [v4 removeObjectForKey:v5];

  id v6 = [v9 key];
  uint64_t v7 = [(WFAction *)self parameterStateForKey:v6 fallingBackToDefaultValue:0];

  if (!v7 || ([v9 parameterStateIsValid:v7] & 1) == 0)
  {
    uint64_t v8 = [v9 key];
    [(WFAction *)self notifyEventObserversParameterStateDidChangeForKey:v8];
  }
}

- (void)updateParameterSummaryIfNeeded:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  os_signpost_id_t v5 = [(WFAction *)self parameterSummary];

  if (v5)
  {
    id v6 = [(WFAction *)self parameterSummary];
    v4[2](v4, v6, 0);
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFActionErrorDomain" code:16 userInfo:0];
    ((void (**)(id, id, id))v4)[2](v4, 0, v6);
  }
}

uint64_t __62__WFAction_notifyEventObserversParameterStateDidChangeForKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  os_signpost_id_t v5 = __62__WFAction_notifyEventObserversParameterStateDidChangeForKey___block_invoke_2(a3);
  id v6 = __62__WFAction_notifyEventObserversParameterStateDidChangeForKey___block_invoke_2(v4);

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

id __62__WFAction_notifyEventObserversParameterStateDidChangeForKey___block_invoke_2(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    id v3 = &unk_1F2316638;
  }
  else {
    id v3 = &unk_1F2316650;
  }
  return v3;
}

- (id)supplementalParameterValueForKey:(id)a3 ofClass:(Class)a4
{
  id v6 = a3;
  uint64_t v7 = [(WFAction *)self encodedSerializedParameters];
  uint64_t v8 = [v7 objectForKey:v6];

  id v9 = WFEnforceClass(v8, (uint64_t)a4);

  return v9;
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  return 0;
}

void __32__WFAction_serializedParameters__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  os_signpost_id_t v5 = [*(id *)(a1 + 32) parameterForKey:a2];
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = [v12 serializedRepresentation];
  uint64_t v8 = [v5 keyForSerialization];
  [v6 setValue:v7 forKey:v8];

  if (objc_opt_respondsToSelector())
  {
    id v9 = [v5 legacyKey];
    if (v9)
    {
      uint64_t v10 = *(void **)(a1 + 40);
      uint64_t v11 = [v12 legacySerializedRepresentation];
      [v10 setValue:v11 forKey:v9];
    }
  }
}

- (id)parameterKeysIgnoredForParameterSummary
{
  return 0;
}

- (BOOL)setParameterStateToVariable:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFAction.m", 444, @"Invalid parameter not satisfying: %@", @"variable" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_9:
    int v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFAction.m", 445, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v10 = [(WFAction *)self parameterForKey:v9];
  uint64_t v11 = v10;
  if (v10
    && (id v12 = (objc_class *)[v10 stateClass],
        [(objc_class *)v12 instancesRespondToSelector:sel_initWithVariable_]))
  {
    long long v13 = (void *)[[v12 alloc] initWithVariable:v7];
    BOOL v14 = [(WFAction *)self setParameterState:v13 forKey:v9];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = getWFGeneralLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    int v25 = 136316162;
    int v26 = "-[WFAction setParameterState:forKey:]";
    __int16 v27 = 2114;
    id v28 = self;
    __int16 v29 = 2114;
    uint64_t v30 = v10;
    __int16 v31 = 2114;
    id v32 = v7;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s Action: %{public}@ setting parameter state: %{public}@, key:%{public}@, value:%@", (uint8_t *)&v25, 0x34u);
  }
  uint64_t v11 = [(WFAction *)self parameterForKey:v7];
  id v12 = [(WFAction *)self inputParameterKey];
  int v13 = [v7 isEqualToString:v12];

  if (v13) {
    [(WFAction *)self lockInputParameter];
  }
  if (v11)
  {
    [v11 stateClass];
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v6 && (isKindOfClass & 1) == 0) {
      goto LABEL_8;
    }
LABEL_12:
    uint64_t v23 = [(WFAction *)self decodedParameterStates];
    [v23 setValue:v6 forKey:v7];

    [(WFAction *)self notifyEventObserversParameterStateDidChangeForKey:v7];
    BOOL v22 = 1;
    goto LABEL_13;
  }
  if (!v6) {
    goto LABEL_12;
  }
LABEL_8:
  long long v15 = getWFGeneralLogObject();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    id v16 = (WFAction *)objc_opt_class();
    int v17 = v16;
    id v18 = objc_opt_class();
    id v19 = v18;
    uint64_t v20 = (void *)[v11 stateClass];
    int v25 = 136315906;
    int v26 = "-[WFAction setParameterState:forKey:]";
    __int16 v27 = 2112;
    id v28 = v16;
    __int16 v29 = 2112;
    uint64_t v30 = v18;
    __int16 v31 = 2112;
    id v32 = v20;
    id v21 = v20;
    _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_FAULT, "%s Warning: Attempted to set a parameter state of class %@ when %@ requires %@", (uint8_t *)&v25, 0x2Au);
  }
  BOOL v22 = 0;
LABEL_13:

  return v22;
}

- (id)serializedParameterStateForKey:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = [(WFAction *)self decodedParameterStates];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = [v6 serializedRepresentation];
  }
  else
  {
    id v8 = [(WFAction *)self encodedSerializedParameters];
    id v7 = [v8 objectForKey:v4];
  }
  return v7;
}

uint64_t __28__WFAction_parameterForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 key];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)preloadDefaultParameterStatesIfNecessaryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self parameters];
  if (v5
    && (id v6 = (void *)v5, v7 = [(WFAction *)self requiresRemoteExecution],
                         v6,
                         !v7))
  {
    id v8 = [(WFAction *)self parameters];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __74__WFAction_preloadDefaultParameterStatesIfNecessaryWithCompletionHandler___block_invoke;
    v11[3] = &unk_1E654E518;
    void v11[4] = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__WFAction_preloadDefaultParameterStatesIfNecessaryWithCompletionHandler___block_invoke_3;
    v9[3] = &unk_1E654FCF0;
    id v10 = v4;
    objc_msgSend(v8, "if_enumerateAsynchronously:completionHandler:", v11, v9);
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __74__WFAction_preloadDefaultParameterStatesIfNecessaryWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  BOOL v7 = a4;
  id v8 = v6;
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v9 = 0;
LABEL_7:
    v7[2](v7, 0);
    goto LABEL_8;
  }
  id v9 = v8;
  if (![v8 loadsDefaultStateAsynchronously]) {
    goto LABEL_7;
  }
  id v10 = [*(id *)(a1 + 32) serializedParameters];
  uint64_t v11 = [v8 key];
  id v12 = [v10 objectForKeyedSubscript:v11];

  id v9 = v8;
  if (v12) {
    goto LABEL_7;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __74__WFAction_preloadDefaultParameterStatesIfNecessaryWithCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E6550860;
  BOOL v14 = v7;
  [v8 loadDefaultSerializedRepresentationWithCompletionHandler:v13];

  id v9 = v8;
LABEL_8:
}

uint64_t __74__WFAction_preloadDefaultParameterStatesIfNecessaryWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __74__WFAction_preloadDefaultParameterStatesIfNecessaryWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyForDuplicating
{
  id v3 = [(WFAction *)self serializedParameters];
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeObjectForKey:@"UUID"];
  [v4 removeObjectForKey:@"GroupingIdentifier"];
  id v5 = [(WFAction *)self copyWithSerializedParameters:v4];

  return v5;
}

- (id)copyForProcessing
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[(WFAction *)self copy];
  id v4 = [(WFAction *)self runningDelegate];
  [v3 setRunningDelegate:v4];

  id v5 = [(WFAction *)self variableSource];
  [v3 setVariableSource:v5];

  id v6 = [(WFAction *)self toolInvocation];
  [v3 setToolInvocation:v6];

  if ([(WFAction *)self requiresRemoteExecution])
  {
    BOOL v7 = [(WFAction *)self parameters];
    id v8 = [v7 objectsMatchingClass:objc_opt_class()];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (!v10) {
      goto LABEL_36;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v31 + 1) + 8 * i);
        if (!v14)
        {
          id v19 = 0;
          goto LABEL_34;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          long long v15 = v14;
        }
        else {
          long long v15 = 0;
        }
        id v16 = v15;

        id v14 = v14;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v17 = v14;
        }
        else {
          int v17 = 0;
        }
        id v18 = v17;

        if (v16)
        {
          id v19 = v14;
          if ([v16 possibleStatesLoadingState] == 3)
          {
            uint64_t v20 = [v16 key];
            id v21 = [v3 parameterForKey:v20];

            if (v21)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                BOOL v22 = v21;
              }
              else {
                BOOL v22 = 0;
              }
            }
            else
            {
              BOOL v22 = 0;
            }
            id v28 = v22;

            __int16 v29 = [v16 possibleStates];
            [v28 setPossibleStatesFromRemoteSource:v29];
            id v19 = v14;
            id v14 = v18;
            goto LABEL_33;
          }
        }
        else
        {
          id v19 = 0;
        }
        if (!v18)
        {
          id v14 = 0;
          goto LABEL_34;
        }
        uint64_t v23 = [v18 possibleStates];
        uint64_t v24 = [v23 count];

        if (!v24) {
          goto LABEL_34;
        }
        int v25 = [v18 key];
        int v26 = [v3 parameterForKey:v25];

        if (v26)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            __int16 v27 = v26;
          }
          else {
            __int16 v27 = 0;
          }
        }
        else
        {
          __int16 v27 = 0;
        }
        id v28 = v27;

        __int16 v29 = [v18 possibleStates];
        [v28 setPossibleStatesFromRemoteSource:v29];
LABEL_33:

LABEL_34:
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (!v11)
      {
LABEL_36:

        return v3;
      }
    }
  }
  return v3;
}

- (id)copyWithDefinition:(id)a3 serializedParameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)objc_opt_class());
  id v9 = [(WFAction *)self identifier];
  uint64_t v10 = (void *)[v8 initWithIdentifier:v9 definition:v7 serializedParameters:v6];

  return v10;
}

- (id)copyWithSerializedParameters:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(WFAction *)self identifier];
  id v7 = [(WFAction *)self definition];
  id v8 = (void *)[v5 initWithIdentifier:v6 definition:v7 serializedParameters:v4];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(WFAction *)self serializedParameters];
  id v5 = [(WFAction *)self copyWithSerializedParameters:v4];

  return v5;
}

- (void)appInstalledResource:(id)a3 didUpdateAppDescriptor:(id)a4
{
}

- (WFAppInstalledResource)appResource
{
  id v3 = [(WFAction *)self appDescriptor];

  if (v3)
  {
    appResource = self->_appResource;
    if (!appResource)
    {
      id v5 = [WFAppInstalledResource alloc];
      id v6 = [(WFAction *)self appDescriptor];
      id v7 = [(WFAppInstalledResource *)v5 initWithAppDescriptor:v6 requiresAppToBeInstalled:[(WFAction *)self appResourceRequiresAppInstall]];
      id v8 = self->_appResource;
      self->_appResource = v7;

      [(WFAppInstalledResource *)self->_appResource setDelegate:self];
      appResource = self->_appResource;
    }
    id v9 = appResource;
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (BOOL)appResourceRequiresAppInstall
{
  id v2 = [(WFAction *)self appDefinition];
  id v3 = [v2 objectForKey:@"ActionRequiresAppInstallation"];

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

  char v6 = [v5 BOOLValue];
  return v6;
}

- (id)missingAppError
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28C58];
  v8[0] = *MEMORY[0x1E4F28578];
  id v3 = WFLocalizedString(@"Missing App");
  v9[0] = v3;
  v8[1] = *MEMORY[0x1E4F28568];
  id v4 = WFLocalizedString(@"This action requires an app that may not be installed.");
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  char v6 = [v2 errorWithDomain:@"WFActionErrorDomain" code:10 userInfo:v5];

  return v6;
}

- (void)resolveAppDescriptorIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAction *)self appDescriptor];
  char v6 = [v5 requiresUserConfirmation];

  if (v6)
  {
    uint64_t v7 = [(WFAction *)self userInterface];
    if (v7
      && (id v8 = (void *)v7,
          [(WFAction *)self userInterface],
          id v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = objc_opt_respondsToSelector(),
          v9,
          v8,
          (v10 & 1) != 0))
    {
      uint64_t v11 = [(WFAction *)self userInterface];
      uint64_t v12 = [(WFAction *)self appDescriptor];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __44__WFAction_resolveAppDescriptorIfNecessary___block_invoke;
      v14[3] = &unk_1E654E4F0;
      void v14[4] = self;
      id v15 = v4;
      [v11 resolveDescriptor:v12 completionHandler:v14];
    }
    else
    {
      int v13 = [(WFAction *)self missingAppError];
      (*((void (**)(id, void *))v4 + 2))(v4, v13);
    }
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __44__WFAction_resolveAppDescriptorIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    [*(id *)(a1 + 32) updateAppDescriptorInDatabaseWithSelectedApp:v3];
    [*(id *)(a1 + 32) updateAppDescriptorWithSelectedApp:v6];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) missingAppError];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
}

- (void)updateAppDescriptorWithSelectedApp:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(WFAction *)self setAppDescriptor:a3];
  [(WFAction *)self setAppResource:0];
  [(WFAction *)self recreateResourcesIfNeeded];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [(WFAction *)self resourceManager];
  id v5 = [v4 resourceObjectsOfClass:objc_opt_class()];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) refreshAvailabilityWithNotification];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (INAppDescriptor)appDescriptor
{
  id v3 = [(WFAction *)self appDefinition];
  if (v3)
  {
    appDescriptor = self->_appDescriptor;
    if (!appDescriptor)
    {
      id v5 = (void *)[objc_alloc(MEMORY[0x1E4F302A8]) initWithSerializedRepresentation:v3];
      uint64_t v6 = [MEMORY[0x1E4F302D0] sharedResolver];
      uint64_t v7 = [v6 resolvedAppMatchingDescriptor:v5];
      uint64_t v8 = self->_appDescriptor;
      self->_appDescriptor = v7;

      appDescriptor = self->_appDescriptor;
    }
    uint64_t v9 = appDescriptor;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (NSString)debugDescription
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WFAction *)self identifier];
  uint64_t v7 = [(WFAction *)self inputParameter];
  uint64_t v8 = [(WFAction *)self parameters];
  uint64_t v9 = [(WFAction *)self definition];
  long long v10 = [v3 stringWithFormat:@"<%@: %p, identifier: %@, inputParameter: %@, parameters: %@, definition: %@>", v5, self, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (NSString)localizedKeyParameterDisplayName
{
  return 0;
}

+ (void)showImplicitChooseFromListWithInput:(id)a3 userInterface:(id)a4 workQueue:(id)a5 cancelHandler:(id)a6 selectionHandler:(id)a7
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v35 = @"WFChooseFromListActionPrompt";
  id v18 = WFLocalizedString(@"Choose an Item");
  v36[0] = v18;
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];

  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  long long v32 = __Block_byref_object_copy__8356;
  long long v33 = __Block_byref_object_dispose__8357;
  uint64_t v20 = +[WFActionRegistry sharedRegistry];
  id v34 = [v20 createActionWithIdentifier:@"is.workflow.actions.choosefromlist" serializedParameters:v19];

  id v21 = (void *)v30[5];
  if (!v21)
  {
    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:a1 file:@"WFAction.m" lineNumber:2846 description:@"Choose from list action expected to load from registry"];

    id v21 = (void *)v30[5];
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __103__WFAction_showImplicitChooseFromListWithInput_userInterface_workQueue_cancelHandler_selectionHandler___block_invoke;
  v25[3] = &unk_1E654E9A8;
  id v22 = v16;
  id v26 = v22;
  id v23 = v17;
  id v27 = v23;
  id v28 = &v29;
  [v21 runWithInput:v13 userInterface:v14 runningDelegate:0 variableSource:0 workQueue:v15 completionHandler:v25];

  _Block_object_dispose(&v29, 8);
}

void __103__WFAction_showImplicitChooseFromListWithInput_userInterface_workQueue_cancelHandler_selectionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v7 = a2;
  if (objc_msgSend(a3, "wf_isUserCancelledError"))
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
    uint64_t v5 = *(void *)(a1[6] + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
}

+ (id)userInterfaceXPCInterface
{
  id v2 = [a1 userInterfaceProtocol];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)userInterfaceProtocol
{
  return 0;
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 0;
}

- (void)setOutputExpandedInEditor:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = [NSNumber numberWithBool:v3];
    [(WFAction *)self setSupplementalParameterValue:v5 forKey:@"OutputExpandedInEditor"];
  }
}

- (BOOL)isOutputExpandedInEditor
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    uint64_t v4 = [(WFAction *)self supplementalParameterValueForKey:@"OutputExpandedInEditor" ofClass:objc_opt_class()];
    char v5 = [v4 BOOLValue];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)visibleParametersForParameterSummary
{
  return [(WFAction *)self visibleParametersWithProcessing:0];
}

- (BOOL)containsVariableOfType:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  char v5 = [(WFAction *)self parameters];
  uint64_t v21 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v6 = *(void *)v27;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v5);
        }
        uint64_t v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v9 = objc_msgSend(v8, "key", v20);
        long long v10 = [(WFAction *)self parameterStateForKey:v9];
        long long v11 = [v10 containedVariables];

        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v23 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = [*(id *)(*((void *)&v22 + 1) + 8 * j) type];
              char v17 = [v16 isEqualToString:v4];

              if (v17)
              {

                BOOL v18 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v20;
      }
      BOOL v18 = 0;
      uint64_t v21 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_19:

  return v18;
}

- (id)containedVariablesOfClass:(Class)a3
{
  id v4 = [(WFAction *)self containedVariables];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __51__WFAction_Convenience__containedVariablesOfClass___block_invoke;
  v7[3] = &__block_descriptor_40_e35___WFVariable_24__0__WFVariable_8Q16lu32l8;
  v7[4] = a3;
  char v5 = objc_msgSend(v4, "if_compactMap:", v7);

  return v5;
}

id __51__WFAction_Convenience__containedVariablesOfClass___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_isKindOfClass()) {
    int v3 = v2;
  }
  else {
    int v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)containedVariables
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(WFAction *)self parameters];
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
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) key];
        long long v10 = [(WFAction *)self parameterStateForKey:v9 fallingBackToDefaultValue:0];
        long long v11 = [v10 containedVariables];
        [v3 addObjectsFromArray:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSString)sessionKitSessionInvocationType
{
  int v3 = [(WFAction *)self sessionKitSessionConfiguration];

  if (v3)
  {
    id v4 = @"Automatic";
    uint64_t v5 = @"Automatic";
  }
  else
  {
    uint64_t v6 = [(WFAction *)self sessionKitSessionConfigurationDefinition];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"InvocationType"];
    uint64_t v8 = objc_opt_class();
    WFEnforceClass(v7, v8);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (WFActionSessionKitSessionConfiguration)sessionKitSessionConfiguration
{
  int v3 = [(WFAction *)self sessionKitSessionConfigurationDefinition];
  id v4 = [v3 objectForKeyedSubscript:@"BundleIdentifier"];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(WFAction *)self appDescriptor];
    id v6 = [v7 bundleIdentifier];
  }
  uint64_t v8 = 0;
  if (v3 && v6)
  {
    uint64_t v9 = [(WFAction *)self sessionKitToastDurationsPerRunSourceDefinition];
    uint64_t v8 = [[WFActionSessionKitSessionConfiguration alloc] initWithBundleIdentifier:v6 toastDurationPerRunSource:v9];
  }
  return v8;
}

- (NSDictionary)sessionKitToastDurationsPerRunSourceDefinition
{
  id v2 = [(WFAction *)self sessionKitSessionConfigurationDefinition];
  int v3 = [v2 objectForKeyedSubscript:@"ToastDuration"];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = WFEnforceClass(v3, v4);

  return (NSDictionary *)v5;
}

- (NSDictionary)sessionKitSessionConfigurationDefinition
{
  id v2 = [(WFAction *)self definition];
  int v3 = [v2 objectForKey:@"SessionConfiguration"];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = WFEnforceClass(v3, v4);

  return (NSDictionary *)v5;
}

- (BOOL)mightStartAudioRecording
{
  id v2 = [(WFAction *)self definition];
  int v3 = [v2 objectForKey:@"MightStartAudioRecording"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)mightSuppressRunningProgress
{
  int v3 = [(WFAction *)self sessionKitSessionConfiguration];

  if (v3) {
    return 1;
  }
  uint64_t v5 = [(WFAction *)self definition];
  id v6 = [v5 objectForKey:@"MightSuppressRunningProgress"];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (BOOL)shouldLocalizeValueForSelector:(SEL)a3
{
  return 1;
}

- (unint64_t)appearance
{
  id v2 = [(WFAction *)self definition];
  int v3 = [v2 objectForKey:@"Appearance"];

  if (v3 && ([v3 isEqualToString:@"Normal"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"Comment"]) {
      unint64_t v4 = 2;
    }
    else {
      unint64_t v4 = [v3 isEqualToString:@"Input"];
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)deletesInput
{
  id v2 = [(WFAction *)self definition];
  int v3 = [v2 objectForKey:@"DeletesInput"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)locallyProcessesData
{
  id v2 = [(WFAction *)self definition];
  int v3 = [v2 objectForKey:@"LocallyProcessesData"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)requiresUnlock
{
  id v2 = [(WFAction *)self definition];
  int v3 = [v2 objectForKey:@"RequiresUnlock"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (unint64_t)parameterCollapsingBehavior
{
  uint64_t v3 = [(WFAction *)self parameterSummary];
  if (!v3) {
    return 2;
  }
  char v4 = (void *)v3;
  BOOL v5 = [(WFAction *)self displaysParameterSummary];

  if (!v5) {
    return 2;
  }
  id v6 = [(WFAction *)self definition];
  char v7 = [v6 objectForKey:@"ParameterCollapsingBehavior"];

  if ([v7 isEqualToString:@"DefaultBeginExpanded"])
  {
    unint64_t v8 = 1;
  }
  else if ([v7 isEqualToString:@"Never"])
  {
    unint64_t v8 = 2;
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)displaysParameterSummary
{
  return 1;
}

- (NSString)parameterSummaryString
{
  return 0;
}

- (NSArray)additionalParameterSummaries
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"AdditionalParameterSummaries"];
  char v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  BOOL v5 = v3;

  return v5;
}

- (WFActionParameterSummary)parameterSummary
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"ParameterSummary"];

  return (WFActionParameterSummary *)v3;
}

- (int64_t)rateLimitDelay
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"RateLimit"];
  char v4 = [v3 objectForKey:@"Delay"];
  uint64_t v5 = objc_opt_class();
  id v6 = WFEnforceClass(v4, v5);
  int64_t v7 = [v6 integerValue];

  return v7;
}

- (int64_t)rateLimitTimeout
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"RateLimit"];
  char v4 = [v3 objectForKey:@"Timeout"];
  uint64_t v5 = objc_opt_class();
  id v6 = WFEnforceClass(v4, v5);
  int64_t v7 = [v6 integerValue];

  return v7;
}

- (int64_t)rateLimitThreshold
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"RateLimit"];
  char v4 = [v3 objectForKey:@"Threshold"];
  uint64_t v5 = objc_opt_class();
  id v6 = WFEnforceClass(v4, v5);
  int64_t v7 = [v6 integerValue];

  return v7;
}

- (int64_t)initialSuggestionBehavior
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"SuggestedAsInitialAction"];

  if (v3)
  {
    if ([v3 BOOLValue]) {
      int64_t v4 = 1;
    }
    else {
      int64_t v4 = 2;
    }
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)neverSuggested
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"SuggestedNever"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)highRisk
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"HighRisk"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (unint64_t)outputDisclosureLevel
{
  id v2 = [(WFAction *)self outputDictionary];
  uint64_t v3 = [v2 objectForKey:@"DisclosureLevel"];

  unint64_t v4 = [v3 isEqualToString:@"Public"] ^ 1;
  return v4;
}

- (BOOL)outputsMultipleItems
{
  if ([(WFAction *)self inputPassthrough])
  {
    return [(WFAction *)self inputsMultipleItems];
  }
  else
  {
    unint64_t v4 = [(WFAction *)self outputDictionary];
    uint64_t v5 = [v4 objectForKey:@"Multiple"];
    char v6 = [v5 BOOLValue];

    return v6;
  }
}

- (BOOL)inputsMultipleItems
{
  id v2 = [(WFAction *)self inputDictionary];
  uint64_t v3 = [v2 objectForKey:@"Multiple"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSString)outputMeasurementUnitType
{
  return 0;
}

- (NSArray)outputTypes
{
  id v2 = [(WFAction *)self outputDictionary];
  uint64_t v3 = [v2 objectForKey:@"Types"];
  char v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = v3;

  return v5;
}

- (NSArray)inputTypes
{
  id v2 = [(WFAction *)self inputDictionary];
  uint64_t v3 = [v2 objectForKey:@"Types"];
  char v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = v3;

  return v5;
}

- (BOOL)inputTypeDeterminesOutputType
{
  id v2 = [(WFAction *)self inputDictionary];
  uint64_t v3 = [v2 objectForKey:@"InputTypeDeterminesOutputType"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)snappingPassthrough
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"SnappingPassthrough"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)blocksSnapping
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"BlocksSnapping"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)inputPassthrough
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"InputPassthrough"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)inputRequired
{
  id v2 = [(WFAction *)self inputDictionary];
  uint64_t v3 = [v2 objectForKey:@"Required"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)shouldBeIncludedInAppsList
{
  uint64_t v3 = [(WFAction *)self app];
  if ([v3 isInstalled]) {
    BOOL v4 = ![(WFAction *)self isDiscontinued];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)localizedCategoryWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self definition];
  char v6 = [v5 objectForKey:@"Category"];

  if (v6)
  {
    int64_t v7 = [v4 localize:v6];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (NSString)localizedCategory
{
  uint64_t v3 = [(WFAction *)self defaultLocalizationContext];
  id v4 = [(WFAction *)self localizedCategoryWithContext:v3];

  return (NSString *)v4;
}

- (ICApp)app
{
  id v2 = [(WFAction *)self appDescriptor];
  uint64_t v3 = [v2 bundleIdentifier];

  if (v3)
  {
    id v4 = +[ICAppRegistry sharedRegistry];
    uint64_t v5 = [v4 appWithIdentifier:v3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (ICApp *)v5;
}

- (NSString)fillingProvider
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"FillingProvider"];

  return (NSString *)v3;
}

- (NSDictionary)userInterfaceClasses
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"UserInterfaceClasses"];
  id v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  uint64_t v5 = v3;

  return v5;
}

- (NSArray)requiredResources
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"RequiredResources"];
  id v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = v3;

  return v5;
}

- (NSArray)userInterfaceTypes
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"UserInterfaces"];
  id v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = v3;

  return v5;
}

- (BOOL)requiresRemoteExecution
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(WFAction *)self remoteExecuteOnPlatforms];
  if (v3)
  {
    id v4 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315650;
      uint64_t v12 = "-[WFAction(Definition) requiresRemoteExecution]";
      __int16 v13 = 2114;
      long long v14 = self;
      __int16 v15 = 2114;
      long long v16 = v3;
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEFAULT, "%s %{public}@ definition requires remote execution on platforms: %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
  if ([(__CFString *)v3 count])
  {
    uint64_t v5 = [MEMORY[0x1E4FB46B8] currentDevice];
    unint64_t v6 = [v5 idiom];
    if (v6 >= 6)
    {
      uint64_t v9 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136315394;
        uint64_t v12 = "-[WFAction(Definition) requiresRemoteExecution]";
        __int16 v13 = 2114;
        long long v14 = (WFAction *)v5;
        _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Current platform is unspecified for device: %{public}@", (uint8_t *)&v11, 0x16u);
      }
      char v8 = 0;
    }
    else
    {
      int64_t v7 = off_1E65521A8[v6];
      char v8 = [(__CFString *)v3 containsObject:v7];
      uint64_t v9 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315650;
        uint64_t v12 = "-[WFAction(Definition) requiresRemoteExecution]";
        __int16 v13 = 2114;
        long long v14 = self;
        __int16 v15 = 2114;
        long long v16 = v7;
        _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@ definition requires remote execution for current platform (%{public}@)", (uint8_t *)&v11, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v5 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      uint64_t v12 = "-[WFAction(Definition) requiresRemoteExecution]";
      __int16 v13 = 2114;
      long long v14 = self;
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@ definition doesn't require remote execution", (uint8_t *)&v11, 0x16u);
    }
    char v8 = 0;
  }

  return v8;
}

- (NSArray)remoteExecuteOnPlatforms
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"RemoteExecuteOnPlatforms"];
  id v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = v3;

  return v5;
}

- (BOOL)isConstructorAction
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"Constructor"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isResidentCompatible
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"ResidentCompatible"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isApprovedForPublicShortcutsDrawer
{
  return 1;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  if ([(WFAction *)self isDiscontinued]) {
    return 0;
  }
  uint64_t v5 = [(WFAction *)self definition];
  unint64_t v6 = [v5 objectForKey:@"Discoverable"];

  if (v6) {
    char v4 = [v6 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)isMissing
{
  return 0;
}

- (id)localizedDiscontinuedDescriptionWithContext:(id)a3
{
  id v4 = a3;
  if ([(WFAction *)self isDiscontinued])
  {
    uint64_t v5 = [(WFAction *)self displayableAppDescriptor];
    unint64_t v6 = [v5 localizedName];
    int64_t v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      long long v10 = WFLocalizedStringResourceWithKey(@"Shortcuts", @"Shortcuts");
      id v8 = [v4 localize:v10];
    }
    int v11 = NSString;
    uint64_t v12 = WFLocalizedStringResourceWithKey(@"This action won’t be supported in future versions of %@.", @"This action won’t be supported in future versions of %@.");
    __int16 v13 = [v4 localize:v12];
    uint64_t v9 = objc_msgSend(v11, "localizedStringWithFormat:", v13, v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (NSString)localizedDiscontinuedDescription
{
  uint64_t v3 = [(WFAction *)self defaultLocalizationContext];
  id v4 = [(WFAction *)self localizedDiscontinuedDescriptionWithContext:v3];

  return (NSString *)v4;
}

- (BOOL)isDiscontinued
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"Discontinued"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSArray)disabledOnPlatforms
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"DisabledOnPlatforms"];
  char v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v5 = v3;

  return v5;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self definition];
  unint64_t v6 = [v5 objectForKey:@"ActionKeywords"];

  if (v6)
  {
    int64_t v7 = [v4 localize:v6];
    id v8 = [v7 componentsSeparatedByString:@"|"];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (NSArray)localizedKeywords
{
  uint64_t v3 = [(WFAction *)self defaultLocalizationContext];
  id v4 = [(WFAction *)self localizedKeywordsWithContext:v3];

  return (NSArray *)v4;
}

- (id)localizedDescriptionAttributionMarkdownStringWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self descriptionDefinition];
  unint64_t v6 = [v5 objectForKey:@"DescriptionAttribution"];

  if (v6)
  {
    int64_t v7 = [v4 localize:v6];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (NSString)localizedDescriptionAttributionMarkdownString
{
  uint64_t v3 = [(WFAction *)self defaultLocalizationContext];
  id v4 = [(WFAction *)self localizedDescriptionAttributionMarkdownStringWithContext:v3];

  return (NSString *)v4;
}

- (id)localizedDescriptionRequiresWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self descriptionDefinition];
  unint64_t v6 = [v5 objectForKey:@"DescriptionRequires"];

  if (v6)
  {
    int64_t v7 = [v4 localize:v6];
  }
  else
  {
    id v8 = [(WFAction *)self unevaluatedResourceObjectsOfClass:objc_opt_class()];
    uint64_t v9 = [v8 allObjects];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __64__WFAction_Definition__localizedDescriptionRequiresWithContext___block_invoke;
    uint64_t v21 = &unk_1E6552058;
    id v10 = v4;
    id v22 = v10;
    int v11 = objc_msgSend(v9, "if_compactMap:", &v18);

    if ([v11 count])
    {
      uint64_t v12 = [v11 sortedArrayUsingSelector:sel_localizedStandardCompare_];
      __int16 v13 = [v12 componentsJoinedByString:@", "];
      long long v14 = NSString;
      __int16 v15 = WFLocalizedStringResourceWithKey(@"Access to %@", @"Access to %@");
      long long v16 = [v10 localize:v15];
      int64_t v7 = objc_msgSend(v14, "localizedStringWithFormat:", v16, v13, v18, v19, v20, v21);
    }
    else
    {
      int64_t v7 = 0;
    }
  }
  return v7;
}

uint64_t __64__WFAction_Definition__localizedDescriptionRequiresWithContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 localizedProtectedResourceDescriptionWithContext:*(void *)(a1 + 32)];
}

- (NSString)localizedDescriptionRequires
{
  uint64_t v3 = [(WFAction *)self defaultLocalizationContext];
  id v4 = [(WFAction *)self localizedDescriptionRequiresWithContext:v3];

  return (NSString *)v4;
}

- (id)localizedFocusFilterDescriptionWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self descriptionDefinition];
  unint64_t v6 = [v5 objectForKey:@"FocusFilterDescription"];

  if (v6)
  {
    int64_t v7 = [v4 localize:v6];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (NSString)localizedFocusFilterDescription
{
  uint64_t v3 = [(WFAction *)self defaultLocalizationContext];
  id v4 = [(WFAction *)self localizedFocusFilterDescriptionWithContext:v3];

  return (NSString *)v4;
}

- (id)localizedDescriptionNoteWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self descriptionDefinition];
  unint64_t v6 = [v5 objectForKey:@"DescriptionNote"];

  if (v6)
  {
    int64_t v7 = [v4 localize:v6];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (NSString)localizedDescriptionNote
{
  uint64_t v3 = [(WFAction *)self defaultLocalizationContext];
  id v4 = [(WFAction *)self localizedDescriptionNoteWithContext:v3];

  return (NSString *)v4;
}

- (id)localizedDescriptionResultWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self descriptionDefinition];
  unint64_t v6 = [v5 objectForKey:@"DescriptionResult"];

  if (v6)
  {
    int64_t v7 = [v4 localize:v6];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (NSString)localizedDescriptionResult
{
  uint64_t v3 = [(WFAction *)self defaultLocalizationContext];
  id v4 = [(WFAction *)self localizedDescriptionResultWithContext:v3];

  if ([(WFAction *)self descriptionInputIncludesSupportingItemClasses]) {
    [(WFAction *)self outputContentClasses];
  }
  else {
  uint64_t v5 = [(WFAction *)self specifiedOutputContentClasses];
  }
  if ([(WFAction *)self inputPassthrough] && !v4)
  {
    if ([v5 count])
    {
      id v4 = WFLocalizedString(@"The input");
    }
    else
    {
      id v4 = 0;
    }
  }
  unint64_t v6 = [(WFAction *)self typeDescriptionWithTypes:v5 explanationText:v4 multiple:[(WFAction *)self outputsMultipleItems] optional:0];

  return (NSString *)v6;
}

- (id)localizedDescriptionInputWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self descriptionDefinition];
  unint64_t v6 = [v5 objectForKey:@"DescriptionInput"];

  if (v6)
  {
    int64_t v7 = [v4 localize:v6];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (NSString)localizedDescriptionInput
{
  uint64_t v3 = [(WFAction *)self defaultLocalizationContext];
  id v4 = [(WFAction *)self localizedDescriptionInputWithContext:v3];

  if ([(WFAction *)self descriptionInputIncludesSupportingItemClasses]) {
    [(WFAction *)self inputContentClasses];
  }
  else {
  uint64_t v5 = [(WFAction *)self specifiedInputContentClasses];
  }
  unint64_t v6 = [(WFAction *)self typeDescriptionWithTypes:v5 explanationText:v4 multiple:[(WFAction *)self inputsMultipleItems] optional:[(WFAction *)self inputRequired] ^ 1];

  return (NSString *)v6;
}

- (id)descriptionInput
{
  id v2 = [(WFAction *)self descriptionDefinition];
  uint64_t v3 = [v2 objectForKey:@"DescriptionInput"];

  return v3;
}

- (id)typeDescriptionWithTypes:(id)a3 explanationText:(id)a4 multiple:(BOOL)a5 optional:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (a5) {
          [v17 localizedPluralTypeDescription];
        }
        else {
        uint64_t v18 = [v17 localizedTypeDescription];
        }
        if (v18) {
          [v11 addObject:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v14);
  }

  uint64_t v19 = WFLocalizedString(@", ");
  uint64_t v20 = [v11 componentsJoinedByString:v19];

  if (!v6)
  {
    BOOL v21 = 0;
    if (!v10) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  BOOL v21 = [v20 length] != 0;
  if (v10)
  {
LABEL_17:
    id v22 = NSString;
    long long v23 = WFLocalizedString(@"(%@) %@");
    uint64_t v24 = objc_msgSend(v22, "localizedStringWithFormat:", v23, v20, v10, (void)v28);

    uint64_t v20 = (void *)v24;
  }
LABEL_18:
  if (v21)
  {
    long long v25 = WFLocalizedString(@" (optional)");
    uint64_t v26 = [v20 stringByAppendingString:v25];

    uint64_t v20 = (void *)v26;
  }

  return v20;
}

- (BOOL)descriptionInputIncludesSupportingItemClasses
{
  id v2 = [(WFAction *)self descriptionDefinition];
  uint64_t v3 = [v2 objectForKey:@"InputIncludesSupportingItemClassesKey"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self descriptionDefinition];
  BOOL v6 = [v5 objectForKey:@"DescriptionSummary"];

  if (v6)
  {
    int64_t v7 = [v4 localize:v6];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (NSDictionary)outputDictionary
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"Output"];
  id v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  uint64_t v5 = v3;

  return v5;
}

- (WFActionDescriptionDefinition)descriptionDefinition
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 descriptionDefinition];

  return (WFActionDescriptionDefinition *)v3;
}

- (WFColor)iconColor
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"IconSymbolColor"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = +[WFAction colorForName:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (WFColor *)v4;
}

- (WFIcon)icon
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(WFAction *)self iconName];
  if (!v3)
  {
    BOOL v6 = [(WFAction *)self iconSymbolName];
    id v8 = [(WFAction *)self iconBackgroundColorName];
    id v9 = [(WFAction *)self definition];
    id v10 = [v9 objectForKey:@"IconSymbolColor"];

    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v11 = v10;
      }
      else {
        int v11 = 0;
      }
    }
    else
    {
      int v11 = 0;
    }
    id v13 = v11;

    if (!v6 || !v8)
    {
      uint64_t v14 = [(WFAction *)self displayableAppDescriptor];
      uint64_t v15 = [v14 bundleIdentifier];

      if (v15) {
        int64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB4560]) initWithBundleIdentifier:v15];
      }
      else {
        int64_t v7 = 0;
      }
      goto LABEL_33;
    }
    if ([v13 length]) {
      +[WFAction colorForName:v13];
    }
    else {
    uint64_t v15 = [MEMORY[0x1E4FB45E0] whiteColor];
    }
    if (v15)
    {
      if ([v8 isEqualToString:@"Tint"]) {
        +[WFAction tintedColorForName:v13];
      }
      else {
      long long v16 = +[WFAction colorForName:v8];
      }
      if (v16)
      {
        uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4FB4760]) initWithColor:v16];
        int64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB49C8]) initWithSymbolName:v6 symbolColor:v15 background:v17];

LABEL_32:
LABEL_33:

        goto LABEL_34;
      }
      uint64_t v18 = getWFGeneralLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136315394;
        BOOL v21 = "-[WFAction(Definition) icon]";
        __int16 v22 = 2112;
        long long v23 = v8;
        _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_ERROR, "%s A custom icon color was specified (%@) but we could not find the color in the assets", (uint8_t *)&v20, 0x16u);
      }

      long long v16 = 0;
    }
    else
    {
      long long v16 = getWFGeneralLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136315394;
        BOOL v21 = "-[WFAction(Definition) icon]";
        __int16 v22 = 2112;
        long long v23 = v8;
        _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_ERROR, "%s A custom icon symbol color was specified (%@) but we could not find the color in the assets", (uint8_t *)&v20, 0x16u);
      }
    }
    int64_t v7 = 0;
    goto LABEL_32;
  }
  id v4 = (void *)MEMORY[0x1E4FB4770];
  uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v6 = [v4 imageNamed:v3 inBundle:v5];

  if (v6)
  {
    int64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB4778]) initWithImage:v6];
  }
  else
  {
    id v12 = getWFGeneralLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136315394;
      BOOL v21 = "-[WFAction(Definition) icon]";
      __int16 v22 = 2112;
      long long v23 = v3;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_ERROR, "%s A custom icon was specified (%@) but we could not find the icon in our image assets", (uint8_t *)&v20, 0x16u);
    }

    BOOL v6 = 0;
    int64_t v7 = 0;
  }
LABEL_34:

  return (WFIcon *)v7;
}

- (NSString)iconBackgroundColorName
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"IconColor"];

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
  uint64_t v5 = v4;

  return v5;
}

- (NSString)iconSymbolName
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"IconSymbol"];

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
  uint64_t v5 = v4;

  return v5;
}

- (NSString)iconName
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"IconName"];

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
  uint64_t v5 = v4;

  return v5;
}

- (NSDictionary)displayableAppDefinition
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"DisplayableAppDefinition"];

  return (NSDictionary *)v3;
}

- (NSDictionary)appDefinition
{
  id v2 = [(WFAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"AppDefinition"];

  return (NSDictionary *)v3;
}

- (NSAttributedString)localizedFooter
{
  return 0;
}

- (id)localizedAttributionWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self definition];
  BOOL v6 = [v5 objectForKey:@"Attribution"];

  if (v6)
  {
    uint64_t v7 = [v4 localize:v6];
LABEL_5:
    id v8 = (id)v7;
    goto LABEL_6;
  }
  if ([(WFAction *)self isConstructorAction])
  {
    uint64_t v7 = [(WFAction *)self localizedNameWithContext:v4];
    goto LABEL_5;
  }
  id v10 = [(WFAction *)self appDescriptor];
  int v11 = [v10 localizedName];

  if (![v11 length])
  {
    id v12 = [(WFAction *)self resourceManager];
    id v13 = [v12 resourceObjectsOfClass:objc_opt_class()];
    uint64_t v14 = [v13 anyObject];

    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v15 = [v14 descriptor];
      long long v16 = [v15 localizedName];
      uint64_t v17 = [v16 length];

      if (v17)
      {
        uint64_t v18 = [v14 descriptor];
        id v8 = [v18 localizedName];

LABEL_17:
        goto LABEL_18;
      }
      uint64_t v19 = [v14 appName];
      uint64_t v20 = [v19 length];

      if (v20)
      {
        id v8 = [v14 appName];
        goto LABEL_17;
      }
    }
    else
    {

      uint64_t v14 = 0;
    }
    id v8 = 0;
    goto LABEL_17;
  }
  id v8 = v11;
LABEL_18:

LABEL_6:
  return v8;
}

- (NSString)localizedAttribution
{
  uint64_t v3 = [(WFAction *)self defaultLocalizationContext];
  id v4 = [(WFAction *)self localizedAttributionWithContext:v3];

  return (NSString *)v4;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self outputDictionary];
  BOOL v6 = [v5 objectForKey:@"OutputName"];

  if (v6)
  {
    uint64_t v7 = [v4 localize:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSString)localizedDefaultOutputName
{
  uint64_t v3 = [(WFAction *)self defaultLocalizationContext];
  id v4 = [(WFAction *)self localizedDefaultOutputNameWithContext:v3];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(WFAction *)self localizedName];
  }
  uint64_t v7 = v6;

  return (NSString *)v7;
}

- (NSAttributedString)attributedLocalizedName
{
  id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v4 = [(WFAction *)self localizedName];
  uint64_t v5 = (void *)[v3 initWithString:v4];

  return (NSAttributedString *)v5;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAction *)self definition];
  id v6 = [v5 name];

  if (v6)
  {
    uint64_t v7 = [v4 localize:v6];
  }
  else
  {
    id v8 = WFLocalizedStringResourceWithKey(@"Unknown Action", @"Unknown Action");
    uint64_t v7 = [v4 localize:v8];
  }
  return v7;
}

+ (id)tintedColorForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Red"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB45E0];
    id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = @"systemRedTint";
LABEL_7:
    uint64_t v8 = [v5 colorNamed:v7 inBundle:v6];
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"Green"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB45E0];
    id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = @"systemGreenTint";
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"Blue"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB45E0];
    id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = @"systemBlueTint";
    goto LABEL_7;
  }
  id v6 = [a1 colorForName:v4];
  uint64_t v8 = [v6 colorWithAlphaComponent:0.1];
LABEL_8:
  id v9 = (void *)v8;

  return v9;
}

+ (id)colorForName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Black"])
  {
    uint64_t v4 = [MEMORY[0x1E4FB45E0] blackColor];
LABEL_36:
    uint64_t v7 = (void *)v4;
    goto LABEL_37;
  }
  if ([v3 isEqualToString:@"White"])
  {
    uint64_t v4 = [MEMORY[0x1E4FB45E0] whiteColor];
    goto LABEL_36;
  }
  if ([v3 isEqualToString:@"Label"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB45E0];
    uint64_t v6 = 1;
LABEL_35:
    uint64_t v4 = [v5 colorWithSystemColor:v6];
    goto LABEL_36;
  }
  if ([v3 isEqualToString:@"Red"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB45E0];
    uint64_t v6 = 2;
    goto LABEL_35;
  }
  if ([v3 isEqualToString:@"Green"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB45E0];
    uint64_t v6 = 3;
    goto LABEL_35;
  }
  if ([v3 isEqualToString:@"Blue"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB45E0];
    uint64_t v6 = 4;
    goto LABEL_35;
  }
  if ([v3 isEqualToString:@"Orange"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB45E0];
    uint64_t v6 = 5;
    goto LABEL_35;
  }
  if ([v3 isEqualToString:@"Yellow"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB45E0];
    uint64_t v6 = 6;
    goto LABEL_35;
  }
  if ([v3 isEqualToString:@"Yellow_Accessibility"])
  {
    uint64_t v4 = [MEMORY[0x1E4FB45E0] colorWithRed:1.0 green:0.764999986 blue:0.0 alpha:1.0];
    goto LABEL_36;
  }
  if ([v3 isEqualToString:@"Pink"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB45E0];
    uint64_t v6 = 7;
    goto LABEL_35;
  }
  if ([v3 isEqualToString:@"Purple"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB45E0];
    uint64_t v6 = 8;
    goto LABEL_35;
  }
  if ([v3 isEqualToString:@"Teal"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB45E0];
    uint64_t v6 = 9;
    goto LABEL_35;
  }
  if ([v3 isEqualToString:@"Indigo"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB45E0];
    uint64_t v6 = 10;
    goto LABEL_35;
  }
  if ([v3 isEqualToString:@"Brown"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB45E0];
    uint64_t v6 = 11;
    goto LABEL_35;
  }
  if ([v3 isEqualToString:@"Mint"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB45E0];
    uint64_t v6 = 12;
    goto LABEL_35;
  }
  if ([v3 isEqualToString:@"Cyan"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB45E0];
    uint64_t v6 = 13;
    goto LABEL_35;
  }
  if ([v3 isEqualToString:@"Gray"])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4FB45E0];
    uint64_t v6 = 14;
    goto LABEL_35;
  }
  if ([v3 isEqualToString:@"Clear"])
  {
    uint64_t v4 = [MEMORY[0x1E4FB45E0] clearColor];
    goto LABEL_36;
  }
  uint64_t v7 = 0;
LABEL_37:

  return v7;
}

+ (id)iconCache
{
  if (iconCache_onceToken != -1) {
    dispatch_once(&iconCache_onceToken, &__block_literal_global_35882);
  }
  id v2 = (void *)iconCache_iconCache;
  return v2;
}

void __33__WFAction_Definition__iconCache__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  id v1 = (void *)iconCache_iconCache;
  iconCache_iconCache = v0;
}

- (NSString)appBundleIdentifier
{
  id v2 = [(WFAction *)self app];
  id v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (id)deviceLockedError
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  v17[0] = *MEMORY[0x1E4F28568];
  uint64_t v4 = [MEMORY[0x1E4FB46B8] currentDevice];
  uint64_t v5 = [v4 idiom];

  switch(v5)
  {
    case 0:
      uint64_t v6 = @"DEVICE_LOCKED_ERROR_PHONE";
      uint64_t v7 = @"This shortcut requires your iPhone to be unlocked.";
      break;
    case 1:
      uint64_t v6 = @"DEVICE_LOCKED_ERROR_PAD";
      uint64_t v7 = @"This shortcut requires your iPad to be unlocked.";
      break;
    case 2:
      uint64_t v6 = @"DEVICE_LOCKED_ERROR_MAC";
      uint64_t v7 = @"This shortcut requires your Mac to be unlocked.";
      break;
    case 3:
      uint64_t v6 = @"DEVICE_LOCKED_ERROR_WATCH";
      uint64_t v7 = @"This shortcut requires your Apple Watch to be unlocked.";
      break;
    case 4:
      uint64_t v6 = @"DEVICE_LOCKED_ERROR_POD";
      uint64_t v7 = @"This shortcut requires your iPod to be unlocked.";
      break;
    default:
      uint64_t v6 = @"DEVICE_LOCKED_ERROR_UNSPECIFIED";
      uint64_t v7 = @"This shortcut requires your device to be unlocked.";
      break;
  }
  uint64_t v8 = WFLocalizedStringWithKey(v6, v7);
  v18[0] = v8;
  v17[1] = *MEMORY[0x1E4F28588];
  id v9 = NSString;
  id v10 = WFLocalizedString(@"Couldn’t run “%@”");
  int v11 = [(WFAction *)self workflow];
  id v12 = [v11 name];
  id v13 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v12);
  v18[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  uint64_t v15 = [v3 errorWithDomain:@"WFActionErrorDomain" code:17 userInfo:v14];

  return v15;
}

- (void)requestUnlock:(id)a3
{
  id v4 = a3;
  if (VCIsDeviceLocked())
  {
    uint64_t v5 = objc_opt_new();
    [v5 setPreferredStyle:1];
    uint64_t v6 = [(WFAction *)self localizedName];
    [v5 setTitle:v6];

    uint64_t v7 = +[WFDatabaseProxy defaultDatabase];
    uint64_t v8 = [(WFAction *)self workflow];
    id v9 = [v8 workflowID];
    id v10 = [v7 configuredTriggersForWorkflowID:v9 error:0];

    int v11 = [v10 firstObject];
    id v12 = v11;
    if (v11)
    {
      id v13 = [v11 trigger];
      uint64_t v14 = [v13 localizedDescriptionWithConfigurationSummary];
      [v5 setTitle:v14];

      uint64_t v15 = [MEMORY[0x1E4FB46C0] attributionWithAppBundleIdentifier:*MEMORY[0x1E4FB4BE8]];
      [v5 setAttribution:v15];
    }
    else
    {
      uint64_t v15 = [(WFAction *)self workflow];
      id v16 = objc_alloc(MEMORY[0x1E4FB46C0]);
      uint64_t v17 = [v15 attributionTitle];
      uint64_t v18 = [v15 attributionIcon];
      uint64_t v19 = [v15 icon];
      uint64_t v20 = (void *)[v16 initWithTitle:v17 icon:v18 workflowIcon:v19];
      [v5 setAttribution:v20];
    }
    BOOL v21 = NSString;
    __int16 v22 = WFLocalizedStringWithKey(@"TapToRunAction", @"Tap to run “%@”");
    long long v23 = [(WFAction *)self localizedName];
    uint64_t v24 = objc_msgSend(v21, "stringWithFormat:", v22, v23);
    [v5 setMessage:v24];

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __41__WFAction_RequestUnlock__requestUnlock___block_invoke;
    v32[3] = &unk_1E6558678;
    id v25 = v4;
    id v33 = v25;
    [v5 setCancellationHandler:v32];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    id v30[2] = __41__WFAction_RequestUnlock__requestUnlock___block_invoke_2;
    v30[3] = &unk_1E6558678;
    id v26 = v25;
    id v31 = v26;
    [v5 setSuccessHandler:v30];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __41__WFAction_RequestUnlock__requestUnlock___block_invoke_3;
    v28[3] = &unk_1E65572A0;
    v28[4] = self;
    id v29 = v26;
    [v5 setFailureHandler:v28];
    long long v27 = [(WFAction *)self userInterface];
    [v27 presentAlert:v5];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

void __41__WFAction_RequestUnlock__requestUnlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] userCancelledError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __41__WFAction_RequestUnlock__requestUnlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __41__WFAction_RequestUnlock__requestUnlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) deviceLockedError];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)requestUnlockIfNeeded:(id)a3
{
  id v4 = a3;
  if ([(WFAction *)self requiresUnlock])
  {
    if ([(WFAction *)self usesCompactUnlockService])
    {
      uint64_t v5 = objc_alloc_init(WFCompactUnlockService);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      void v7[2] = __49__WFAction_RequestUnlock__requestUnlockIfNeeded___block_invoke;
      v7[3] = &unk_1E65568C8;
      uint64_t v8 = v5;
      id v9 = v4;
      uint64_t v6 = v5;
      [(WFCompactUnlockService *)v6 requestUnlockIfNeeded:v7];
    }
    else
    {
      [(WFAction *)self requestUnlock:v4];
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

void __49__WFAction_RequestUnlock__requestUnlockIfNeeded___block_invoke(uint64_t a1, int a2)
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

- (BOOL)usesCompactUnlockService
{
  id v3 = [(WFAction *)self runningDelegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(WFAction *)self runningDelegate];
  uint64_t v6 = [v5 currentRunningContextForAction:self];

  uint64_t v7 = [v6 runSource];
  char v8 = [v7 isEqualToString:*MEMORY[0x1E4FB4F30]];

  if (v8)
  {
    char v9 = 1;
  }
  else
  {
    id v10 = [v6 runSource];
    char v9 = [v10 isEqualToString:*MEMORY[0x1E4FB4EF8]];
  }
  return v9;
}

- (NSDictionary)serializedRepresentation
{
  void v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"WFWorkflowActionIdentifier";
  id v3 = [(WFAction *)self identifier];
  v7[1] = @"WFWorkflowActionParameters";
  v8[0] = v3;
  char v4 = [(WFAction *)self serializedParameters];
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

+ (id)actionsFromSerializedRepresentations:(id)a3 actionRegistry:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 valueForKey:@"WFWorkflowActionIdentifier"];
  char v8 = objc_msgSend(v6, "if_map:", &__block_literal_global_67392);

  char v9 = [v5 createActionsWithIdentifiers:v7 serializedParameterArray:v8];

  return v9;
}

id __79__WFAction_Serialization__actionsFromSerializedRepresentations_actionRegistry___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 objectForKey:@"WFWorkflowActionParameters"];
  id v3 = v2;
  if (!v2) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v4 = v2;

  return v4;
}

+ (id)actionFromSerializedRepresentation:(id)a3 actionRegistry:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  char v9 = [v6 arrayWithObjects:&v13 count:1];

  id v10 = objc_msgSend(a1, "actionsFromSerializedRepresentations:actionRegistry:", v9, v7, v13, v14);

  int v11 = [v10 firstObject];

  return v11;
}

@end