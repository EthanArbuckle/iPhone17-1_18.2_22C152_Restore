@interface WFWorkflow
+ (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4;
+ (BOOL)checkClientVersion:(id)a3 currentVersion:(id)a4 error:(id *)a5;
+ (WFWorkflow)workflowWithReference:(id)a3 database:(id)a4 error:(id *)a5;
+ (WFWorkflow)workflowWithReference:(id)a3 database:(id)a4 migrateIfNecessary:(BOOL)a5 environment:(int64_t)a6 error:(id *)a7;
+ (id)defaultName;
+ (id)effectiveInputClassesFromInputClasses:(id)a3 workflowTypes:(id)a4;
+ (id)localizedSubtitleWithActionCount:(unint64_t)a3;
+ (id)supportedInputClassNames;
+ (id)supportedInputClasses;
- (BOOL)addWatchWorkflowTypeIfEligible;
- (BOOL)createReferenceIfNecessaryWithName:(id)a3 nameCollisionBehavior:(unint64_t)a4 error:(id *)a5;
- (BOOL)deletedFromDatabase;
- (BOOL)disabledOnLockScreen;
- (BOOL)hasActions;
- (BOOL)hasOutputFallback;
- (BOOL)hasShortcutInputVariables;
- (BOOL)hasStorageProvider;
- (BOOL)hiddenFromLibraryAndSync;
- (BOOL)ignoreModifications;
- (BOOL)isDeleted;
- (BOOL)isEligibleForWatch;
- (BOOL)isResidentCompatible;
- (BOOL)isSaving;
- (BOOL)isUntitled;
- (BOOL)queue_reloadReferenceFromStorage;
- (BOOL)record:(id)a3 isEquivalentToRecord:(id)a4;
- (BOOL)reloadReferenceFromStorage;
- (BOOL)renameWorkflowTo:(id)a3 error:(id *)a4;
- (BOOL)saveDisabled;
- (BOOL)serializeActionsWhenSaving;
- (BOOL)shouldAutoUpdateAssociatedAppBundleIdentifier;
- (BOOL)shouldShowInputAction;
- (BOOL)userProvidedName;
- (NSArray)actions;
- (NSArray)importQuestions;
- (NSArray)inputClasses;
- (NSArray)outputClasses;
- (NSArray)workflowTypes;
- (NSData)remoteQuarantineHash;
- (NSString)actionsDescription;
- (NSString)associatedAppBundleIdentifier;
- (NSString)attributionTitle;
- (NSString)description;
- (NSString)galleryIdentifier;
- (NSString)legacyName;
- (NSString)name;
- (NSString)resolvedAssociatedAppBundleIdentifier;
- (NSString)source;
- (NSString)workflowID;
- (NSString)workflowSubtitle;
- (WFActionGroupingCache)groupingCache;
- (WFDatabase)database;
- (WFDebouncer)saveDebouncer;
- (WFIcon)attributionIcon;
- (WFInputAction)inputAction;
- (WFVariableAvailability)variableAvailability;
- (WFWorkflow)init;
- (WFWorkflow)initWithActionDonation:(id)a3 error:(id *)a4;
- (WFWorkflow)initWithCreationOptions:(id)a3 database:(id)a4 error:(id *)a5;
- (WFWorkflow)initWithName:(id)a3 description:(id)a4 associatedAppBundleIdentifier:(id)a5 actions:(id)a6;
- (WFWorkflow)initWithRecord:(id)a3 reference:(id)a4 storageProvider:(id)a5 error:(id *)a6;
- (WFWorkflow)initWithRecord:(id)a3 reference:(id)a4 storageProvider:(id)a5 migrateIfNecessary:(BOOL)a6 environment:(int64_t)a7 error:(id *)a8;
- (WFWorkflow)initWithShortcut:(id)a3 error:(id *)a4;
- (WFWorkflow)retainedSelf;
- (WFWorkflowCreationOptions)creationOptions;
- (WFWorkflowEditingDelegate)editingDelegate;
- (WFWorkflowIcon)icon;
- (WFWorkflowNoInputBehavior)noInputBehavior;
- (WFWorkflowQuarantine)quarantine;
- (WFWorkflowRecord)record;
- (WFWorkflowReference)reference;
- (WFWorkflowStorage)storageProvider;
- (id)actionsGroupedWithAction:(id)a3;
- (id)additionalEffectiveInputClassesForTriggers:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createUserActivityForViewing;
- (id)effectiveInputClasses;
- (id)inferOutputTypesWithHasOutputFallback:(BOOL *)a3;
- (id)localizedActionsSummary;
- (id)localizedSubtitle;
- (id)prepareForSharingWithOptions:(id)a3;
- (id)validImportQuestions;
- (int64_t)environment;
- (int64_t)remoteQuarantineStatus;
- (unint64_t)storageState;
- (void)_insertAction:(id)a3 atIndex:(unint64_t)a4;
- (void)action:(id)a3 didChangeVariableName:(id)a4 to:(id)a5;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)action:(id)a3 supplementalParameterValueDidChangeForKey:(id)a4;
- (void)actionGroupingIdentifierDidChange:(id)a3;
- (void)actionGroupingIdentifierWillChange:(id)a3;
- (void)actionNameDidChange:(id)a3;
- (void)actionOutputDetailsDidChange:(id)a3;
- (void)addAction:(id)a3;
- (void)addWatchWorkflowType;
- (void)clearOutReference;
- (void)configureAsSingleStepShortcutIfNecessary:(id)a3;
- (void)configureWithStandaloneShortcutRepresentation:(id)a3 homeSummaryText:(id)a4;
- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6;
- (void)dealloc;
- (void)deleteReference;
- (void)fixControlFlowActionLayout;
- (void)generateShortcutRepresentation:(id)a3;
- (void)generateStandaloneShortcutRepresentation:(id)a3;
- (void)getHomeSummaryTextWithCompletion:(id)a3;
- (void)initializeAddedAction:(id)a3;
- (void)insertAction:(id)a3 atIndex:(unint64_t)a4;
- (void)insertActions:(id)a3 atIndexes:(id)a4;
- (void)loadFromRecord;
- (void)moveActionsAtIndexes:(id)a3 toIndexes:(id)a4;
- (void)performBatchOperation:(id)a3;
- (void)reloadFromRecord;
- (void)removeAction:(id)a3;
- (void)removeActions:(id)a3;
- (void)requestToRunScriptsOnDomain:(id)a3 withUserInterface:(id)a4 database:(id)a5 completionHandler:(id)a6;
- (void)save;
- (void)saveFromDebouncer:(id)a3;
- (void)saveWithCompletionBlock:(id)a3;
- (void)setAssociatedAppBundleIdentifier:(id)a3;
- (void)setDeletedFromDatabase:(BOOL)a3;
- (void)setDisabledOnLockScreen:(BOOL)a3;
- (void)setEditingDelegate:(id)a3;
- (void)setGroupingCache:(id)a3;
- (void)setHasOutputFallback:(BOOL)a3;
- (void)setHasShortcutInputVariables:(BOOL)a3;
- (void)setHiddenFromLibraryAndSync:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIgnoreModifications:(BOOL)a3;
- (void)setImportQuestions:(id)a3;
- (void)setInputAction:(id)a3;
- (void)setInputClasses:(id)a3;
- (void)setName:(id)a3;
- (void)setNoInputBehavior:(id)a3;
- (void)setOutputClasses:(id)a3;
- (void)setRemoteQuarantineHash:(id)a3;
- (void)setRemoteQuarantineStatus:(int64_t)a3;
- (void)setRetainedSelf:(id)a3;
- (void)setSaveDisabled:(BOOL)a3;
- (void)setSaving:(BOOL)a3;
- (void)setSerializeActionsWhenSaving:(BOOL)a3;
- (void)setShouldAutoUpdateAssociatedAppBundleIdentifier:(BOOL)a3;
- (void)setSource:(id)a3;
- (void)setStorageProvider:(id)a3;
- (void)setUserProvidedName:(BOOL)a3;
- (void)setVariableAvailability:(id)a3;
- (void)setWorkflowTypes:(id)a3;
- (void)updateInputAction;
- (void)updateMinimumClientVersion;
- (void)updateSuggestedNameIfPossible;
@end

@implementation WFWorkflow

+ (id)localizedSubtitleWithActionCount:(unint64_t)a3
{
  v4 = (void *)localizedSubtitleActionCountCache;
  if (!localizedSubtitleActionCountCache)
  {
    uint64_t v5 = objc_opt_new();
    v6 = (void *)localizedSubtitleActionCountCache;
    localizedSubtitleActionCountCache = v5;

    v4 = (void *)localizedSubtitleActionCountCache;
  }
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  v8 = [v4 objectForKey:v7];

  if (!v8)
  {
    if (a3)
    {
      v9 = NSString;
      v10 = WFLocalizedPluralString(@"%lu actions");
      v8 = objc_msgSend(v9, "localizedStringWithFormat:", v10, a3);
    }
    else
    {
      v8 = WFLocalizedString(@"No actions");
    }
    v11 = (void *)localizedSubtitleActionCountCache;
    v12 = [NSNumber numberWithUnsignedInteger:a3];
    [v11 setObject:v8 forKey:v12];
  }
  id v13 = v8;

  return v13;
}

- (void)generateShortcutRepresentation:(id)a3
{
  id v9 = a3;
  v4 = [(WFWorkflow *)self actions];
  if ([v4 count] == 1)
  {
    uint64_t v5 = [v4 firstObject];
    v6 = v5;
    if (v5)
    {
      if ([v5 conformsToProtocol:&unk_1F231C148]) {
        v7 = v6;
      }
      else {
        v7 = 0;
      }
    }
    else
    {
      v7 = 0;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    [v8 generateShortcutRepresentation:v9];
  }
  else {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (WFWorkflow)initWithShortcut:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFWorkflow+INShortcut.m", 26, @"Invalid parameter not satisfying: %@", @"shortcut" object file lineNumber description];
  }
  id v8 = [(WFWorkflow *)self init];
  if (!v8)
  {
    v12 = 0;
    goto LABEL_16;
  }
  id v9 = [v7 intent];
  v10 = [v9 suggestedInvocationPhrase];

  if (v10)
  {
    v11 = [v7 intent];
  }
  else
  {
    id v13 = [v7 userActivity];
    v14 = [v13 suggestedInvocationPhrase];

    if (!v14)
    {
      v16 = 0;
      goto LABEL_10;
    }
    v11 = [v7 userActivity];
  }
  v15 = v11;
  v16 = [v11 suggestedInvocationPhrase];

LABEL_10:
  if ([v16 length]) {
    [(WFWorkflow *)v8 setName:v16];
  }
  v17 = +[WFActionRegistry sharedRegistry];
  v18 = [v17 createActionWithShortcut:v7 error:a4];

  if (v18)
  {
    [(WFWorkflow *)v8 addAction:v18];
    v19 = [[WFStandaloneShortcutRepresentation alloc] initWithINShortcut:v7];
    [(WFWorkflow *)v8 configureWithStandaloneShortcutRepresentation:v19 homeSummaryText:0];
    v12 = v8;
  }
  else
  {
    v12 = 0;
  }

LABEL_16:
  return v12;
}

- (WFWorkflow)initWithActionDonation:(id)a3 error:(id *)a4
{
  v6 = [a3 shortcut];
  id v7 = [(WFWorkflow *)self initWithShortcut:v6 error:a4];

  return v7;
}

- (WFWorkflow)initWithName:(id)a3 description:(id)a4 associatedAppBundleIdentifier:(id)a5 actions:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(WFWorkflow *)self init];
  v15 = v14;
  if (v14)
  {
    if (v10)
    {
      [(WFWorkflow *)v14 setName:v10];
    }
    else
    {
      v16 = +[WFWorkflow defaultName];
      [(WFWorkflow *)v15 setName:v16];
    }
    v17 = [(WFWorkflow *)v15 record];
    [v17 setWorkflowSubtitle:v11];

    v18 = [(WFWorkflow *)v15 record];
    [v18 setAssociatedAppBundleIdentifier:v12];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __95__WFWorkflow_WFLCompatibility__initWithName_description_associatedAppBundleIdentifier_actions___block_invoke;
    v22[3] = &unk_1E6558938;
    id v23 = v13;
    v19 = v15;
    v24 = v19;
    [(WFWorkflow *)v19 performBatchOperation:v22];
    v20 = v19;
  }
  return v15;
}

void __95__WFWorkflow_WFLCompatibility__initWithName_description_associatedAppBundleIdentifier_actions___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "addAction:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)isEligibleForWatch
{
  id v2 = [(WFWorkflow *)self actions];
  uint64_t v3 = objc_msgSend(v2, "if_firstObjectPassingTest:", &__block_literal_global_18923);
  BOOL v4 = v3 == 0;

  return v4;
}

uint64_t __50__WFWorkflow_WatchEligibility__isEligibleForWatch__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 disabledOnPlatforms];
  uint64_t v3 = [v2 containsObject:@"Watch"];

  return v3;
}

- (BOOL)addWatchWorkflowTypeIfEligible
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F1CB18] databaseCoherenceEnabled] & 1) == 0)
  {
    BOOL v4 = getWFGeneralLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      long long v9 = "-[WFWorkflow(WatchEligibility) addWatchWorkflowTypeIfEligible]";
      __int16 v10 = 2112;
      id v11 = self;
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_INFO, "%s Adding watch workflow type to workflow %@", (uint8_t *)&v8, 0x16u);
    }

    uint64_t v5 = [(WFWorkflow *)self workflowTypes];
    char v6 = [v5 containsObject:*MEMORY[0x1E4FB4FC8]];

    if ((v6 & 1) == 0)
    {
      BOOL v3 = [(WFWorkflow *)self isEligibleForWatch];
      if (!v3) {
        return v3;
      }
      [(WFWorkflow *)self addWatchWorkflowType];
    }
    LOBYTE(v3) = 1;
    return v3;
  }
  LOBYTE(v3) = 0;
  return v3;
}

- (void)addWatchWorkflowType
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(WFWorkflow *)self workflowTypes];
  BOOL v4 = [v3 arrayByAddingObject:*MEMORY[0x1E4FB4FC8]];
  [(WFWorkflow *)self setWorkflowTypes:v4];

  uint64_t v5 = getWFGeneralLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    long long v7 = "-[WFWorkflow(WatchEligibility) addWatchWorkflowType]";
    __int16 v8 = 2112;
    long long v9 = self;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Added watch workflow type to workflow %@", (uint8_t *)&v6, 0x16u);
  }
}

- (WFIcon)attributionIcon
{
  if ([(WFWorkflow *)self hiddenFromLibraryAndSync])
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB4560]);
    BOOL v4 = (void *)[v3 initWithBundleIdentifier:*MEMORY[0x1E4FB4BE8]];
  }
  else
  {
    uint64_t v5 = [(WFWorkflow *)self associatedAppBundleIdentifier];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      id v7 = objc_alloc(MEMORY[0x1E4FB4560]);
      __int16 v8 = [(WFWorkflow *)self associatedAppBundleIdentifier];
      BOOL v4 = (void *)[v7 initWithBundleIdentifier:v8];
    }
    else
    {
      long long v9 = [(WFWorkflow *)self icon];
      BOOL v4 = [v9 icon];
    }
  }
  return (WFIcon *)v4;
}

- (NSString)attributionTitle
{
  if ([(WFWorkflow *)self hiddenFromLibraryAndSync]) {
    WFLocalizedString(@"Shortcuts");
  }
  else {
  id v3 = [(WFWorkflow *)self name];
  }
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationOptions, 0);
  objc_storeStrong((id *)&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_saveDebouncer, 0);
  objc_storeStrong((id *)&self->_storageProvider, 0);
  objc_destroyWeak((id *)&self->_editingDelegate);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->_importQuestions, 0);
  objc_storeStrong((id *)&self->_inputAction, 0);
  objc_storeStrong((id *)&self->_outputClasses, 0);
  objc_storeStrong((id *)&self->_noInputBehavior, 0);
  objc_storeStrong((id *)&self->_inputClasses, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_groupingCache, 0);
  objc_storeStrong((id *)&self->_variableAvailability, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

- (unint64_t)storageState
{
  return self->_storageState;
}

- (void)setUserProvidedName:(BOOL)a3
{
  self->_userProvidedName = a3;
}

- (BOOL)userProvidedName
{
  return self->_userProvidedName;
}

- (WFWorkflowCreationOptions)creationOptions
{
  return self->_creationOptions;
}

- (void)setRetainedSelf:(id)a3
{
}

- (WFWorkflow)retainedSelf
{
  return self->_retainedSelf;
}

- (void)setDeletedFromDatabase:(BOOL)a3
{
  self->_deletedFromDatabase = a3;
}

- (BOOL)deletedFromDatabase
{
  return self->_deletedFromDatabase;
}

- (void)setSaving:(BOOL)a3
{
  self->_saving = a3;
}

- (BOOL)isSaving
{
  return self->_saving;
}

- (WFDebouncer)saveDebouncer
{
  return self->_saveDebouncer;
}

- (void)setSerializeActionsWhenSaving:(BOOL)a3
{
  self->_serializeActionsWhenSaving = a3;
}

- (BOOL)serializeActionsWhenSaving
{
  return self->_serializeActionsWhenSaving;
}

- (void)setSaveDisabled:(BOOL)a3
{
  self->_saveDisabled = a3;
}

- (BOOL)saveDisabled
{
  return self->_saveDisabled;
}

- (void)setStorageProvider:(id)a3
{
}

- (WFWorkflowStorage)storageProvider
{
  return self->_storageProvider;
}

- (void)setEditingDelegate:(id)a3
{
}

- (WFWorkflowEditingDelegate)editingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editingDelegate);
  return (WFWorkflowEditingDelegate *)WeakRetained;
}

- (void)setIgnoreModifications:(BOOL)a3
{
  self->_ignoreModifications = a3;
}

- (BOOL)ignoreModifications
{
  return self->_ignoreModifications;
}

- (int64_t)environment
{
  return self->_environment;
}

- (WFWorkflowRecord)record
{
  return self->_record;
}

- (WFWorkflowReference)reference
{
  return self->_reference;
}

- (NSArray)importQuestions
{
  return self->_importQuestions;
}

- (void)setInputAction:(id)a3
{
}

- (WFInputAction)inputAction
{
  return self->_inputAction;
}

- (NSArray)outputClasses
{
  return self->_outputClasses;
}

- (WFWorkflowNoInputBehavior)noInputBehavior
{
  return self->_noInputBehavior;
}

- (NSArray)inputClasses
{
  return self->_inputClasses;
}

- (void)setSource:(id)a3
{
}

- (void)setGroupingCache:(id)a3
{
}

- (void)setVariableAvailability:(id)a3
{
}

- (BOOL)record:(id)a3 isEquivalentToRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 name];
  __int16 v8 = [v6 name];
  id v9 = v7;
  id v10 = v8;
  id v11 = v10;
  if (v9 == v10)
  {

    goto LABEL_7;
  }
  LOBYTE(v12) = 0;
  id v13 = v10;
  id v14 = v9;
  if (!v9 || !v10) {
    goto LABEL_117;
  }
  int v15 = [v9 isEqualToString:v10];

  if (v15)
  {
LABEL_7:
    v16 = [v5 legacyName];
    v17 = [v6 legacyName];
    id v14 = v16;
    id v18 = v17;
    id v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_116;
      }
      int v21 = [v14 isEqualToString:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_117:

        goto LABEL_118;
      }
    }
    v22 = [v5 workflowSubtitle];
    id v23 = [v6 workflowSubtitle];
    id v20 = v22;
    id v24 = v23;
    v19 = v24;
    if (v20 == v24)
    {
      v130 = v13;
    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      id v26 = v20;
      if (!v20 || !v24) {
        goto LABEL_115;
      }
      v130 = v13;
      int v27 = [v20 isEqualToString:v24];

      if (!v27)
      {
        LOBYTE(v12) = 0;
        id v13 = v130;
LABEL_116:

        goto LABEL_117;
      }
    }
    v28 = [v5 actionsDescription];
    v29 = [v6 actionsDescription];
    id v26 = v28;
    id v30 = v29;
    v129 = v30;
    if (v26 != v30)
    {
      LOBYTE(v12) = 0;
      if (v26)
      {
        v31 = v30;
        v32 = v26;
        if (v30)
        {
          int v33 = [v26 isEqualToString:v30];

          if (!v33)
          {
            LOBYTE(v12) = 0;
LABEL_114:
            v25 = v129;
            id v13 = v130;
LABEL_115:

            goto LABEL_116;
          }
LABEL_25:
          id v128 = v26;
          v34 = [v5 associatedAppBundleIdentifier];
          v35 = [v6 associatedAppBundleIdentifier];
          id v36 = v34;
          id v37 = v35;
          v126 = v37;
          v127 = v36;
          if (v36 != v37)
          {
            LOBYTE(v12) = 0;
            if (v36)
            {
              v38 = v37;
              v39 = v36;
              id v26 = v128;
              if (v37)
              {
                int v40 = [v127 isEqualToString:v37];

                if (!v40)
                {
                  LOBYTE(v12) = 0;
                  id v26 = v128;
LABEL_112:
                  v31 = v126;
                  v32 = v127;
                  goto LABEL_113;
                }
LABEL_31:
                v41 = [v5 icon];
                v42 = [v6 icon];
                id v43 = v41;
                id v44 = v42;
                v124 = v44;
                v125 = v43;
                if (v43 != v44)
                {
                  LOBYTE(v12) = 0;
                  if (v43)
                  {
                    v45 = v44;
                    id v26 = v128;
                    if (v44)
                    {
                      int v46 = [v43 isEqual:v44];

                      if (!v46)
                      {
                        LOBYTE(v12) = 0;
                        id v26 = v128;
LABEL_110:
                        v38 = v124;
                        v39 = v125;
                        goto LABEL_111;
                      }
LABEL_38:
                      v47 = (void *)MEMORY[0x1E4F1CAD0];
                      uint64_t v121 = [v5 workflowTypes];
                      v48 = [v47 setWithArray:v121];
                      v49 = (void *)MEMORY[0x1E4F1CAD0];
                      v120 = [v6 workflowTypes];
                      v50 = objc_msgSend(v49, "setWithArray:");
                      id v51 = v48;
                      id v52 = v50;
                      v122 = v52;
                      v123 = v51;
                      if (v51 != v52)
                      {
                        LOBYTE(v12) = 0;
                        if (v51)
                        {
                          v53 = v52;
                          v54 = v51;
                          id v26 = v128;
                          if (v52)
                          {
                            int v55 = [v123 isEqual:v52];

                            if (!v55)
                            {
                              LOBYTE(v12) = 0;
                              id v26 = v128;
LABEL_108:

                              id v43 = (id)v121;
                              v45 = v123;
                              goto LABEL_109;
                            }
LABEL_45:
                            v56 = (void *)MEMORY[0x1E4F1CAD0];
                            uint64_t v117 = [v5 inputClasses];
                            v57 = [v56 setWithArray:v117];
                            v58 = (void *)MEMORY[0x1E4F1CAD0];
                            v116 = [v6 inputClasses];
                            v59 = objc_msgSend(v58, "setWithArray:");
                            id v60 = v57;
                            id v61 = v59;
                            v118 = v61;
                            v119 = v60;
                            if (v60 != v61)
                            {
                              LOBYTE(v12) = 0;
                              if (v60)
                              {
                                v62 = v61;
                                v63 = v60;
                                id v26 = v128;
                                if (v61)
                                {
                                  int v64 = [v119 isEqual:v61];

                                  if (!v64)
                                  {
                                    LOBYTE(v12) = 0;
                                    id v26 = v128;
LABEL_106:

                                    v54 = (void *)v117;
                                    v53 = v119;
                                    goto LABEL_107;
                                  }
LABEL_52:
                                  v65 = [v5 noInputBehavior];
                                  v66 = [v6 noInputBehavior];
                                  id v67 = v65;
                                  id v68 = v66;
                                  v114 = v68;
                                  v115 = v67;
                                  if (v67 != v68)
                                  {
                                    LOBYTE(v12) = 0;
                                    if (v67)
                                    {
                                      v69 = v68;
                                      id v26 = v128;
                                      if (v68)
                                      {
                                        int v70 = [v67 isEqualToDictionary:v68];

                                        if (!v70)
                                        {
                                          LOBYTE(v12) = 0;
                                          id v26 = v128;
LABEL_104:
                                          v62 = v114;
                                          v63 = v115;
                                          goto LABEL_105;
                                        }
LABEL_59:
                                        v71 = (void *)MEMORY[0x1E4F1CAD0];
                                        uint64_t v111 = [v5 outputClasses];
                                        v72 = objc_msgSend(v71, "setWithArray:");
                                        v73 = (void *)MEMORY[0x1E4F1CAD0];
                                        v110 = [v6 outputClasses];
                                        v74 = objc_msgSend(v73, "setWithArray:");
                                        id v75 = v72;
                                        id v76 = v74;
                                        v112 = v76;
                                        v113 = v75;
                                        if (v75 != v76)
                                        {
                                          LOBYTE(v12) = 0;
                                          if (v75)
                                          {
                                            v77 = v76;
                                            v78 = v75;
                                            id v26 = v128;
                                            if (v76)
                                            {
                                              int v79 = [v113 isEqual:v76];

                                              if (!v79)
                                              {
                                                LOBYTE(v12) = 0;
                                                id v26 = v128;
LABEL_102:

                                                v69 = v113;
                                                id v67 = (id)v111;
                                                goto LABEL_103;
                                              }
LABEL_66:
                                              v80 = [v5 actions];
                                              v81 = [v6 actions];
                                              id v82 = v80;
                                              id v83 = v81;
                                              v108 = v83;
                                              v109 = v82;
                                              if (v82 != v83)
                                              {
                                                LOBYTE(v12) = 0;
                                                if (v82)
                                                {
                                                  v84 = v83;
                                                  id v26 = v128;
                                                  if (v83)
                                                  {
                                                    int v85 = [v82 isEqualToArray:v83];

                                                    if (!v85)
                                                    {
                                                      LOBYTE(v12) = 0;
                                                      id v26 = v128;
LABEL_100:
                                                      v77 = v108;
                                                      v78 = v109;
                                                      goto LABEL_101;
                                                    }
LABEL_73:
                                                    v86 = [v5 importQuestions];
                                                    v87 = [v6 importQuestions];
                                                    id v82 = v86;
                                                    id v88 = v87;
                                                    v107 = v88;
                                                    if (v82 == v88)
                                                    {

                                                      id v104 = v82;
                                                    }
                                                    else
                                                    {
                                                      LOBYTE(v12) = 0;
                                                      if (!v82)
                                                      {
                                                        v89 = v88;
                                                        id v90 = 0;
                                                        id v26 = v128;
                                                        goto LABEL_97;
                                                      }
                                                      v89 = v88;
                                                      id v90 = v82;
                                                      id v26 = v128;
                                                      if (!v88)
                                                      {
LABEL_97:
                                                        v106 = v90;

                                                        goto LABEL_98;
                                                      }
                                                      v91 = v82;
                                                      int v92 = [v82 isEqualToArray:v88];

                                                      id v104 = v91;
                                                      if (!v92)
                                                      {
                                                        LOBYTE(v12) = 0;
                                                        id v26 = v128;
                                                        id v82 = v104;
LABEL_98:
                                                        v84 = v107;
                                                        goto LABEL_99;
                                                      }
                                                    }
                                                    v93 = [v5 quarantine];
                                                    v94 = [v6 quarantine];
                                                    id v95 = v93;
                                                    id v96 = v94;
                                                    uint64_t v12 = v96;
                                                    if (v95 == v96)
                                                    {
                                                      id v103 = v96;

LABEL_87:
                                                      int v98 = objc_msgSend(v5, "isDeleted", v103);
                                                      if (v98 == [v6 isDeleted])
                                                      {
                                                        id v105 = v95;
                                                        uint64_t v99 = [v5 remoteQuarantineStatus];
                                                        if (v99 == [v6 remoteQuarantineStatus]
                                                          && (int v100 = [v5 disabledOnLockScreen],
                                                              v100 == [v6 disabledOnLockScreen]))
                                                        {
                                                          int v101 = [v5 hiddenFromLibraryAndSync];
                                                          LODWORD(v12) = v101 ^ [v6 hiddenFromLibraryAndSync] ^ 1;
                                                        }
                                                        else
                                                        {
                                                          LOBYTE(v12) = 0;
                                                        }
                                                        id v26 = v128;
                                                        id v82 = v104;
                                                        id v90 = v105;
                                                        goto LABEL_96;
                                                      }
LABEL_88:
                                                      LOBYTE(v12) = 0;
                                                      id v90 = v95;
                                                      id v26 = v128;
                                                      id v82 = v104;
LABEL_96:
                                                      v89 = v103;
                                                      goto LABEL_97;
                                                    }
                                                    if (v95 && v96)
                                                    {
                                                      int v97 = [v95 isEqual:v96];
                                                      id v103 = v12;

                                                      if (!v97) {
                                                        goto LABEL_88;
                                                      }
                                                      goto LABEL_87;
                                                    }

                                                    v89 = v12;
                                                    LOBYTE(v12) = 0;
                                                    id v90 = v95;
                                                    id v26 = v128;
                                                    id v82 = v104;
                                                    goto LABEL_97;
                                                  }
                                                }
                                                else
                                                {
                                                  v84 = v83;
                                                  id v26 = v128;
                                                }
LABEL_99:

                                                goto LABEL_100;
                                              }

                                              goto LABEL_73;
                                            }
                                          }
                                          else
                                          {
                                            v77 = v76;
                                            v78 = 0;
                                            id v26 = v128;
                                          }
LABEL_101:

                                          goto LABEL_102;
                                        }

                                        goto LABEL_66;
                                      }
                                    }
                                    else
                                    {
                                      v69 = v68;
                                      id v26 = v128;
                                    }
LABEL_103:

                                    goto LABEL_104;
                                  }

                                  goto LABEL_59;
                                }
                              }
                              else
                              {
                                v62 = v61;
                                v63 = 0;
                                id v26 = v128;
                              }
LABEL_105:

                              goto LABEL_106;
                            }

                            goto LABEL_52;
                          }
                        }
                        else
                        {
                          v53 = v52;
                          v54 = 0;
                          id v26 = v128;
                        }
LABEL_107:

                        goto LABEL_108;
                      }

                      goto LABEL_45;
                    }
                  }
                  else
                  {
                    v45 = v44;
                    id v26 = v128;
                  }
LABEL_109:

                  goto LABEL_110;
                }

                goto LABEL_38;
              }
            }
            else
            {
              v38 = v37;
              v39 = 0;
              id v26 = v128;
            }
LABEL_111:

            goto LABEL_112;
          }

          goto LABEL_31;
        }
      }
      else
      {
        v31 = v30;
        v32 = 0;
      }
LABEL_113:

      goto LABEL_114;
    }

    goto LABEL_25;
  }
  LOBYTE(v12) = 0;
LABEL_118:

  return (char)v12;
}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a6;
  if ([(WFWorkflow *)self isSaving])
  {
    [(WFWorkflow *)self setSaving:0];
  }
  else if (![(WFWorkflow *)self ignoreModifications])
  {
    id v10 = [(WFWorkflow *)self reference];
    id v11 = [v10 identifier];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          if (![v17 objectType])
          {
            id v18 = [v17 identifier];
            int v19 = [v18 isEqualToString:v11];

            if (v19)
            {
              int v27 = v34;
              v34[0] = MEMORY[0x1E4F143A8];
              v34[1] = 3221225472;
              v28 = __58__WFWorkflow_databaseDidChange_modified_inserted_removed___block_invoke;
LABEL_25:
              v27[2] = v28;
              v27[3] = &unk_1E6558B28;
              v27[4] = self;
              dispatch_async(MEMORY[0x1E4F14428], v27);
              goto LABEL_26;
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v12 = v8;
    uint64_t v20 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v31;
      while (2)
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v12);
          }
          id v24 = *(void **)(*((void *)&v30 + 1) + 8 * j);
          if (![v24 objectType])
          {
            v25 = [v24 identifier];
            int v26 = [v25 isEqualToString:v11];

            if (v26)
            {
              int v27 = block;
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              v28 = __58__WFWorkflow_databaseDidChange_modified_inserted_removed___block_invoke_2;
              goto LABEL_25;
            }
          }
        }
        uint64_t v21 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
LABEL_26:
  }
}

uint64_t __58__WFWorkflow_databaseDidChange_modified_inserted_removed___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setStorageProvider:0];
  [*(id *)(a1 + 32) willChangeValueForKey:@"deleted"];
  [*(id *)(a1 + 32) setDeletedFromDatabase:1];
  id v2 = *(void **)(a1 + 32);
  return [v2 didChangeValueForKey:@"deleted"];
}

uint64_t __58__WFWorkflow_databaseDidChange_modified_inserted_removed___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) reloadReferenceFromStorage];
  id v2 = *(void **)(a1 + 32);
  return [v2 reloadFromRecord];
}

- (id)inferOutputTypesWithHasOutputFallback:(BOOL *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(WFWorkflow *)self actions];
  id v5 = objc_msgSend(v4, "if_compactMap:", &__block_literal_global_623);

  if ([v5 count])
  {
    id v23 = a3;
    id v6 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v24 = v5;
    obuint64_t j = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v31;
      char v10 = 1;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (v10) {
            char v10 = [*(id *)(*((void *)&v30 + 1) + 8 * i) hasOutputFallback];
          }
          else {
            char v10 = 0;
          }
          uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v14 = [v12 outputContentClasses];
          uint64_t v15 = [v13 setWithArray:v14];

          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v16 = v15;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v27 != v19) {
                  objc_enumerationMutation(v16);
                }
                [v6 addObject:*(void *)(*((void *)&v26 + 1) + 8 * j)];
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v18);
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v8);
    }
    else
    {
      char v10 = 1;
    }

    if (v23) {
      *id v23 = v10;
    }
    uint64_t v21 = (void *)[v6 copy];

    id v5 = v24;
  }
  else
  {
    uint64_t v21 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v21;
}

id __52__WFWorkflow_inferOutputTypesWithHasOutputFallback___block_invoke(uint64_t a1, void *a2)
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

- (void)updateInputAction
{
  BOOL v3 = [(WFWorkflow *)self shouldShowInputAction];
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [(WFWorkflow *)self workflowTypes];
  id v14 = [v4 setWithArray:v5];

  p_inputAction = (id *)&self->_inputAction;
  uint64_t v7 = [(WFInputAction *)self->_inputAction inputSurfaces];
  uint64_t v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_opt_new();
  }
  char v10 = v9;

  id v11 = *p_inputAction;
  if (v3)
  {
    if (!v11)
    {
      id v12 = 0;
LABEL_11:
      uint64_t v13 = +[WFInputAction inputActionForWorkflow:self];
      goto LABEL_13;
    }
  }
  else if (v11)
  {
    id v12 = v11;
    goto LABEL_12;
  }
  if ([v10 isEqualToSet:v14]) {
    goto LABEL_17;
  }
  id v12 = *p_inputAction;
  if (v3) {
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v13 = 0;
LABEL_13:
  [(WFWorkflow *)self willChangeValueForKey:@"inputAction"];
  objc_storeStrong((id *)&self->_inputAction, v13);
  [(WFWorkflow *)self didChangeValueForKey:@"inputAction"];
  if (v12 && !v13) {
    [v12 removedFromWorkflow];
  }

LABEL_17:
}

- (BOOL)shouldShowInputAction
{
  BOOL v3 = [(WFWorkflow *)self workflowTypes];
  if (WFWorkflowTypesContainsInputType(v3))
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(WFWorkflow *)self variableAvailability];
    char v4 = [v5 isShortcutInputVariableUsed];
  }
  return v4;
}

- (BOOL)isUntitled
{
  id v2 = [(WFWorkflow *)self name];
  BOOL v3 = +[WFWorkflow defaultName];
  char v4 = [v2 hasPrefix:v3];

  return v4;
}

- (void)setImportQuestions:(id)a3
{
  id v5 = a3;
  id v6 = [v5 objectsNotMatchingClass:objc_opt_class()];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"WFWorkflow.m", 1471, @"Invalid parameter not satisfying: %@", @"![[importQuestions objectsNotMatchingClass:[WFWorkflowImportQuestion class]] count]" object file lineNumber description];
  }
  importQuestions = self->_importQuestions;
  id v9 = (NSArray *)v5;
  char v10 = importQuestions;
  if (v10 == v9)
  {
  }
  else
  {
    id v11 = v10;
    if (v9 && v10)
    {
      BOOL v12 = [(NSArray *)v9 isEqualToArray:v10];

      if (v12) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    [(WFWorkflow *)self willChangeValueForKey:@"importQuestions"];
    uint64_t v13 = (NSArray *)[(NSArray *)v9 copy];
    id v14 = self->_importQuestions;
    self->_importQuestions = v13;

    uint64_t v15 = [(WFWorkflow *)self importQuestions];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __33__WFWorkflow_setImportQuestions___block_invoke;
    v21[3] = &unk_1E65529B8;
    v21[4] = self;
    uint64_t v16 = objc_msgSend(v15, "if_compactMap:", v21);
    uint64_t v17 = (void *)v16;
    if (v16) {
      uint64_t v18 = v16;
    }
    else {
      uint64_t v18 = MEMORY[0x1E4F1CBF0];
    }
    uint64_t v19 = [(WFWorkflow *)self record];
    [v19 setImportQuestions:v18];

    [(WFWorkflow *)self didChangeValueForKey:@"importQuestions"];
  }
LABEL_14:
}

id __33__WFWorkflow_setImportQuestions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  char v4 = [v2 actions];
  id v5 = [v3 serializedRepresentationWithWorkflowActions:v4];

  return v5;
}

- (id)localizedSubtitle
{
  id v2 = [(WFWorkflow *)self actions];
  id v3 = +[WFWorkflow localizedSubtitleWithActionCount:](WFWorkflow, "localizedSubtitleWithActionCount:", [v2 count]);

  return v3;
}

- (id)localizedActionsSummary
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFWorkflow *)self actions];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = [(WFWorkflow *)self actions];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        if (WFActionShouldBeIncludedInSummary(v11))
        {
          BOOL v12 = [v11 parameterSummaryString];
          if (v12 || ([v11 localizedName], (BOOL v12 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            [v5 addObject:v12];
          }
          if ((unint64_t)[v5 count] > 9) {
            break;
          }
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    if ([v5 count])
    {
      uint64_t v13 = objc_opt_new();
      id v14 = [v13 stringForObjectValue:v5];
    }
    else
    {
      id v14 = [(WFWorkflow *)self localizedSubtitle];
    }
  }
  else
  {
    id v14 = WFLocalizedString(@"No actions");
  }
  return v14;
}

- (id)additionalEffectiveInputClassesForTriggers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "trigger", (void)v13);
        uint64_t v11 = [v10 shortcutInputContentItemClass];

        if (v11) {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)effectiveInputClasses
{
  id v3 = [(WFWorkflow *)self inputClasses];
  uint64_t v4 = [(WFWorkflow *)self workflowTypes];
  id v5 = +[WFWorkflow effectiveInputClassesFromInputClasses:v3 workflowTypes:v4];
  uint64_t v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [(WFWorkflow *)self database];

  if (v7)
  {
    uint64_t v8 = [(WFWorkflow *)self database];
    uint64_t v9 = [(WFWorkflow *)self workflowID];
    uint64_t v10 = [v8 configuredTriggersForWorkflowID:v9];
    uint64_t v11 = [v10 descriptors];
  }
  else
  {
    uint64_t v8 = +[WFDatabaseProxy defaultDatabase];
    uint64_t v9 = [(WFWorkflow *)self workflowID];
    uint64_t v11 = [v8 configuredTriggersForWorkflowID:v9 error:0];
  }

  if ([v11 count])
  {
    BOOL v12 = [(WFWorkflow *)self additionalEffectiveInputClassesForTriggers:v11];
    long long v13 = [(WFWorkflow *)self workflowTypes];
    char v14 = WFWorkflowTypesContainsInputType(v13);

    if (v14)
    {
      id v15 = [v12 arrayByAddingObjectsFromArray:v6];
    }
    else
    {
      id v15 = v12;
    }
    id v16 = v15;
  }
  else
  {
    id v16 = v6;
  }

  return v16;
}

- (void)fixControlFlowActionLayout
{
  id v3 = [(WFWorkflow *)self groupingCache];
  uint64_t v4 = [v3 actionsByGroupingIdentifier];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__WFWorkflow_fixControlFlowActionLayout__block_invoke;
  v5[3] = &unk_1E6552990;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __40__WFWorkflow_fixControlFlowActionLayout__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v7 = (void *)[v6 mutableCopy];
    uint64_t v8 = [v7 firstObject];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    if ([v10 mode])
    {
      [*(id *)(a1 + 32) removeActions:v7];
LABEL_29:

      goto LABEL_30;
    }
    uint64_t v11 = [v7 lastObject];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if ([v11 mode] == 2) {
        goto LABEL_15;
      }
      BOOL v12 = [*(id *)(a1 + 32) actions];
      uint64_t v13 = [v12 indexOfObject:v11];

      uint64_t v14 = [v10 createAccompanyingActionWithMode:2];
      [v7 addObject:v14];
      [*(id *)(a1 + 32) insertAction:v14 atIndex:v13 + 1];
    }
    else
    {
      uint64_t v14 = 0;
    }

    uint64_t v11 = (void *)v14;
LABEL_15:
    id v15 = v10;
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = [v15 parameterStateForKey:@"WFMenuItems"];
        if (v16)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            long long v17 = v16;
          }
          else {
            long long v17 = 0;
          }
        }
        else
        {
          long long v17 = 0;
        }
        id v18 = v17;

        long long v32 = [v18 values];

        long long v19 = objc_msgSend(v6, "if_compactMap:", &__block_literal_global_452);
        v38[0] = 0;
        v38[1] = v38;
        v38[2] = 0x2020000000;
        uint64_t v39 = 0;
        uint64_t v20 = [v19 count];
        uint64_t v21 = [*(id *)(a1 + 32) actions];
        uint64_t v22 = v21;
        if (v20)
        {
          [v19 lastObject];
          id v23 = v30 = v19;
          uint64_t v24 = [v22 indexOfObject:v23];

          long long v19 = v30;
        }
        else
        {
          uint64_t v24 = [v21 indexOfObject:v15];
        }

        uint64_t v39 = v24;
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __40__WFWorkflow_fixControlFlowActionLayout__block_invoke_3;
        v33[3] = &unk_1E6552968;
        id v25 = v19;
        id v34 = v25;
        id v15 = v15;
        uint64_t v26 = *(void *)(a1 + 32);
        id v35 = v15;
        uint64_t v36 = v26;
        long long v37 = v38;
        [v32 enumerateObjectsUsingBlock:v33];
        unint64_t v27 = [v32 count];
        if (v27 < [v25 count])
        {
          long long v31 = *(void **)(a1 + 32);
          long long v28 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", objc_msgSend(v32, "count"), objc_msgSend(v25, "count") - objc_msgSend(v32, "count"));
          long long v29 = [v25 objectsAtIndexes:v28];
          [v31 removeActions:v29];
        }
        _Block_object_dispose(v38, 8);
      }
    }

    goto LABEL_29;
  }
LABEL_30:
}

void __40__WFWorkflow_fixControlFlowActionLayout__block_invoke_3(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  if ([v5 count] <= a3)
  {
    id v8 = [*(id *)(a1 + 40) createAccompanyingActionWithMode:1];
    objc_msgSend(*(id *)(a1 + 48), "insertAction:atIndex:");
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) objectAtIndex:a3];
  }
  uint64_t v7 = WFTitleForParameterValue(v6);

  [v8 setItemTitle:v7];
}

id __40__WFWorkflow_fixControlFlowActionLayout__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ([v2 mode] == 1) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
    uint64_t v4 = v2;
  }
  else
  {

    uint64_t v4 = 0;
    id v3 = 0;
  }
  id v5 = v3;

  return v5;
}

- (void)actionGroupingIdentifierDidChange:(id)a3
{
  id v4 = a3;
  id v6 = [(WFWorkflow *)self groupingCache];
  id v5 = [(WFWorkflow *)self actions];
  [v6 addAction:v4 sortingWithWorkflowActions:v5];
}

- (void)actionGroupingIdentifierWillChange:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWorkflow *)self groupingCache];
  [v5 removeAction:v4];
}

- (void)action:(id)a3 didChangeVariableName:(id)a4 to:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = [(WFWorkflow *)self variableAvailability];
    [v11 renameVariable:v9 to:v10 fromAction:v8];
    long long v28 = v11;
    id v30 = v8;
    unint64_t v27 = [v11 availableVariableNamesExcludingThoseProvidedByAction:v8];
    int v35 = [v27 containsObject:v9];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v29 = self;
    obuint64_t j = [(WFWorkflow *)self actions];
    uint64_t v33 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (!v33) {
      goto LABEL_23;
    }
    uint64_t v32 = *(void *)v41;
    while (1)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v41 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v12;
        uint64_t v13 = *(void **)(*((void *)&v40 + 1) + 8 * v12);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint64_t v14 = [v13 containedVariablesOfClass:objc_opt_class()];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v37 != v17) {
                objc_enumerationMutation(v14);
              }
              long long v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              uint64_t v20 = [v19 name];
              int v21 = [v20 isEqualToString:v9];

              if (!v21)
              {
                id v25 = [v19 name];
                int v26 = [v25 isEqualToString:v10];

                if (!v26) {
                  continue;
                }
                uint64_t v22 = v19;
                id v23 = v13;
                id v24 = v10;
                goto LABEL_17;
              }
              if (v35)
              {
                uint64_t v22 = v19;
                id v23 = v13;
                id v24 = v9;
LABEL_17:
                [v22 variableProvider:v23 variableWasMoved:v24];
                continue;
              }
              [v19 variableProvider:v13 variableNameDidChangeTo:v10];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v44 count:16];
          }
          while (v16);
        }

        uint64_t v12 = v34 + 1;
      }
      while (v34 + 1 != v33);
      uint64_t v33 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (!v33)
      {
LABEL_23:

        [(WFWorkflow *)v29 setSerializeActionsWhenSaving:1];
        [(WFWorkflow *)v29 save];

        id v8 = v30;
        break;
      }
    }
  }
}

- (WFVariableAvailability)variableAvailability
{
  variableAvailability = self->_variableAvailability;
  if (!variableAvailability)
  {
    id v4 = [[WFVariableAvailability alloc] initWithWorkflow:self];
    id v5 = self->_variableAvailability;
    self->_variableAvailability = v4;

    variableAvailability = self->_variableAvailability;
  }
  return variableAvailability;
}

- (void)actionOutputDetailsDidChange:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 UUID];
  if (v4)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    obuint64_t j = [(WFWorkflow *)self actions];
    uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v18)
    {
      uint64_t v17 = *(void *)v24;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v23 + 1) + 8 * v5);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          uint64_t v7 = [v6 containedVariables];
          uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v20;
            do
            {
              uint64_t v11 = 0;
              do
              {
                if (*(void *)v20 != v10) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v13 = [v12 outputUUID];
                  int v14 = [v13 isEqualToString:v4];

                  if (v14)
                  {
                    uint64_t v15 = [v12 variableProvider];
                    [v12 variableProviderDidInvalidateOutputDetails:v15];
                  }
                }
                ++v11;
              }
              while (v9 != v11);
              uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v9);
          }

          ++v5;
        }
        while (v5 != v18);
        uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v18);
    }
  }
}

- (void)actionNameDidChange:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 UUID];
  if (v5)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obuint64_t j = [(WFWorkflow *)self actions];
    uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v20)
    {
      uint64_t v19 = *(void *)v27;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = v6;
          uint64_t v7 = *(void **)(*((void *)&v26 + 1) + 8 * v6);
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v8 = [v7 containedVariables];
          uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v23;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v23 != v11) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  int v14 = [v13 outputUUID];
                  int v15 = [v14 isEqualToString:v5];

                  if (v15)
                  {
                    uint64_t v16 = [v13 variableProvider];
                    uint64_t v17 = [v4 outputName];
                    [v13 variableProvider:v16 variableNameDidChangeTo:v17];
                  }
                }
                ++v12;
              }
              while (v10 != v12);
              uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v10);
          }

          uint64_t v6 = v21 + 1;
        }
        while (v21 + 1 != v20);
        uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v20);
    }
  }
}

- (void)action:(id)a3 supplementalParameterValueDidChangeForKey:(id)a4
{
  -[WFWorkflow setSerializeActionsWhenSaving:](self, "setSerializeActionsWhenSaving:", 1, a4);
  [(WFWorkflow *)self save];
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5 = a3;
  id v6 = [(WFWorkflow *)self variableAvailability];
  [v6 invalidateContentClassCache];
  [v6 invalidateActionOutputProviderCache];
  [v6 updateShortcutInputVariableUsageForChangeInAction:v5 removed:0];

  [(WFWorkflow *)self setSerializeActionsWhenSaving:1];
  [(WFWorkflow *)self save];
  [(WFWorkflow *)self updateInputAction];
}

- (BOOL)hasActions
{
  id v2 = [(WFWorkflow *)self actions];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)actionsGroupedWithAction:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 groupingIdentifier];
  if (v5)
  {
    id v6 = [(WFWorkflow *)self groupingCache];
    uint64_t v7 = [v6 actionsForGroupingIdentifier:v5];
  }
  else
  {
    uint64_t v8 = [(WFWorkflow *)self actions];
    int v9 = [v8 containsObject:v4];

    if (v9)
    {
      v11[0] = v4;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (WFActionGroupingCache)groupingCache
{
  groupingCache = self->_groupingCache;
  if (!groupingCache)
  {
    id v4 = (WFActionGroupingCache *)objc_opt_new();
    id v5 = self->_groupingCache;
    self->_groupingCache = v4;

    groupingCache = self->_groupingCache;
  }
  return groupingCache;
}

- (void)moveActionsAtIndexes:(id)a3 toIndexes:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEqual:v7] & 1) == 0)
  {
    uint64_t v8 = getWFWorkflowLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      id v30 = "-[WFWorkflow moveActionsAtIndexes:toIndexes:]";
      __int16 v31 = 2114;
      id v32 = v6;
      __int16 v33 = 2114;
      id v34 = v7;
      __int16 v35 = 2114;
      long long v36 = self;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEFAULT, "%s Moving actions from indexes: %{public}@ to indexes: %{public}@ in workflow: %{public}@", buf, 0x2Au);
    }

    [(WFWorkflow *)self willChangeValueForKey:@"actions"];
    int v9 = [(WFWorkflow *)self actions];
    uint64_t v10 = (void *)[v9 mutableCopy];

    id v23 = v6;
    uint64_t v11 = [v10 objectsAtIndexes:v6];
    [v10 removeObjectsInArray:v11];
    id v22 = v7;
    [v10 insertObjects:v11 atIndexes:v7];
    objc_storeStrong((id *)&self->_actions, v10);
    [(WFWorkflow *)self didChangeValueForKey:@"actions"];
    [(WFWorkflow *)self setSerializeActionsWhenSaving:1];
    [(WFWorkflow *)self updateSuggestedNameIfPossible];
    [(WFWorkflow *)self save];
    uint64_t v12 = [(WFWorkflow *)self variableAvailability];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          [v12 actionDidChange:v18 moved:1 removed:0];
          uint64_t v19 = [(WFWorkflow *)self groupingCache];
          uint64_t v20 = [v18 groupingIdentifier];
          uint64_t v21 = [(WFWorkflow *)self actions];
          [v19 sortActionsForGroupingIdentifier:v20 withWorkflowActions:v21];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v15);
    }

    id v7 = v22;
    id v6 = v23;
  }
}

- (void)updateSuggestedNameIfPossible
{
  if ([(WFWorkflow *)self storageState] == 2
    && ![(WFWorkflow *)self userProvidedName])
  {
    BOOL v3 = [(WFWorkflow *)self actions];
    id v13 = [v3 lastObject];

    id v4 = [(WFWorkflow *)self actionsGroupedWithAction:v13];
    id v5 = [v4 firstObject];
    if (v13 && v4 && v5)
    {
      uint64_t v6 = [v5 localizedName];
    }
    else
    {
      uint64_t v6 = +[WFWorkflow defaultName];
    }
    id v7 = (void *)v6;
    uint64_t v8 = [(WFWorkflow *)self name];
    char v9 = [v8 containsString:v7];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [(WFWorkflow *)self database];

      if (v10)
      {
        uint64_t v11 = [(WFWorkflow *)self database];
        id v12 = [v11 suggestedWorkflowNameForName:v7];
      }
      else
      {
        id v12 = v7;
      }
      [(WFWorkflow *)self setName:v12];
    }
  }
}

- (void)insertActions:(id)a3 atIndexes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 count];
  if (v9 != [v8 count])
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFWorkflow.m", 1057, @"Invalid parameter not satisfying: %@", @"actions.count == indexes.count" object file lineNumber description];
  }
  [(WFWorkflow *)self willChangeValueForKey:@"actions"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __38__WFWorkflow_insertActions_atIndexes___block_invoke;
  v13[3] = &unk_1E65556E0;
  id v14 = v8;
  uint64_t v15 = self;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  [(WFWorkflow *)self performBatchOperation:v13];
  [(WFWorkflow *)self didChangeValueForKey:@"actions"];
}

void __38__WFWorkflow_insertActions_atIndexes___block_invoke(uint64_t a1)
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__WFWorkflow_insertActions_atIndexes___block_invoke_2;
  v4[3] = &unk_1E6552920;
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = *(void **)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  uint64_t v6 = v7;
  [v2 enumerateIndexesUsingBlock:v4];
  [*(id *)(a1 + 40) updateSuggestedNameIfPossible];

  _Block_object_dispose(v7, 8);
}

void __38__WFWorkflow_insertActions_atIndexes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  [v4 _insertAction:v5 atIndex:a2];

  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (void)_insertAction:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = getWFWorkflowLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315906;
    id v13 = "-[WFWorkflow _insertAction:atIndex:]";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2048;
    unint64_t v17 = a4;
    __int16 v18 = 2114;
    uint64_t v19 = self;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Inserting action: %{public}@ at index: %lu to workflow: %{public}@", (uint8_t *)&v12, 0x2Au);
  }

  id v8 = [(WFWorkflow *)self actions];
  uint64_t v9 = (NSArray *)[v8 mutableCopy];

  [(NSArray *)v9 insertObject:v6 atIndex:a4];
  actions = self->_actions;
  self->_actions = v9;

  [(WFWorkflow *)self setSerializeActionsWhenSaving:1];
  [(WFWorkflow *)self initializeAddedAction:v6];
  id v11 = [(WFWorkflow *)self variableAvailability];
  [v11 actionDidChange:v6 moved:1 removed:0];
}

- (void)insertAction:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [(WFWorkflow *)self willChangeValueForKey:@"actions"];
  [(WFWorkflow *)self _insertAction:v6 atIndex:a4];

  [(WFWorkflow *)self didChangeValueForKey:@"actions"];
  [(WFWorkflow *)self updateSuggestedNameIfPossible];
  [(WFWorkflow *)self save];
}

- (void)deleteReference
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(WFWorkflow *)self database];
  id v4 = [(WFWorkflow *)self reference];
  id v15 = 0;
  char v5 = [v3 deleteReference:v4 error:&v15];
  id v6 = v15;

  if (v5)
  {
    [(WFWorkflow *)self willChangeValueForKey:@"reference"];
    reference = self->_reference;
    self->_reference = 0;

    [(WFWorkflow *)self didChangeValueForKey:@"reference"];
    id v8 = [(WFWorkflow *)self database];
    uint64_t v9 = +[WFWorkflow defaultName];
    id v10 = [v8 suggestedWorkflowNameForName:v9];

    [(WFWorkflow *)self setName:v10];
    id v11 = objc_alloc_init(WFDeleteShortcutEvent);
    int v12 = [(WFWorkflow *)self associatedAppBundleIdentifier];
    [(WFDeleteShortcutEvent *)v11 setAddToSiriBundleIdentifier:v12];

    id v13 = [(WFWorkflow *)self galleryIdentifier];
    [(WFDeleteShortcutEvent *)v11 setGalleryIdentifier:v13];

    __int16 v14 = [(WFWorkflow *)self source];
    [(WFDeleteShortcutEvent *)v11 setShortcutSource:v14];

    [(WFEvent *)v11 track];
  }
  else
  {
    id v10 = getWFWorkflowLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v17 = "-[WFWorkflow deleteReference]";
      __int16 v18 = 2112;
      uint64_t v19 = self;
      _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEFAULT, "%s Database deletion failed for workflow: %@", buf, 0x16u);
    }
  }
}

- (void)removeActions:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = getWFWorkflowLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v59 = "-[WFWorkflow removeActions:]";
    __int16 v60 = 2114;
    id v61 = v4;
    __int16 v62 = 2114;
    v63 = self;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Removing actions: %{public}@ to workflow: %{public}@", buf, 0x20u);
  }

  [(WFWorkflow *)self willChangeValueForKey:@"actions"];
  long long v38 = objc_opt_new();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = v4;
  uint64_t v40 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v52;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v52 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = v6;
        id v7 = *(void **)(*((void *)&v51 + 1) + 8 * v6);
        [v7 removeEventObserver:self];
        id v8 = [(WFWorkflow *)self actions];
        uint64_t v9 = (void *)[v8 mutableCopy];

        [v9 removeObject:v7];
        long long v41 = v9;
        objc_storeStrong((id *)&self->_actions, v9);
        id v10 = [(WFWorkflow *)self groupingCache];
        [v10 removeAction:v7];

        [v7 wasRemovedFromWorkflow:self];
        id v11 = [v7 UUID];
        uint64_t v12 = [v11 length];

        if (v12)
        {
          id v13 = [v7 UUID];
          [v38 addObject:v13];
        }
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        __int16 v14 = [(WFWorkflow *)self importQuestions];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v48 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              uint64_t v20 = [v19 action];
              int v21 = [v20 isEqual:v7];

              if (v21)
              {
                [(WFWorkflow *)self willChangeValueForKey:@"importQuestions"];
                id v22 = [(WFWorkflow *)self importQuestions];
                id v23 = objc_msgSend(v22, "if_arrayByRemovingObject:", v19);
                [(WFWorkflow *)self setImportQuestions:v23];

                [(WFWorkflow *)self didChangeValueForKey:@"importQuestions"];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v47 objects:v56 count:16];
          }
          while (v16);
        }

        uint64_t v6 = v42 + 1;
      }
      while (v42 + 1 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v40);
  }

  [(WFWorkflow *)self didChangeValueForKey:@"actions"];
  [(WFWorkflow *)self setSerializeActionsWhenSaving:1];
  if ([(WFWorkflow *)self storageState] != 2
    || [(NSArray *)self->_actions count]
    || [(WFWorkflow *)self userProvidedName]
    || ([(WFWorkflow *)self inputAction],
        long long v24 = objc_claimAutoreleasedReturnValue(),
        v24,
        v24))
  {
    [(WFWorkflow *)self updateSuggestedNameIfPossible];
    [(WFWorkflow *)self save];
  }
  else
  {
    [(WFWorkflow *)self deleteReference];
  }
  if ([v38 count])
  {
    uint64_t v25 = [(WFWorkflow *)self database];
    if (v25)
    {
      long long v26 = (void *)v25;
      long long v27 = [(WFWorkflow *)self reference];

      if (v27)
      {
        long long v28 = [(WFWorkflow *)self database];
        long long v29 = [v38 allObjects];
        id v30 = [(WFWorkflow *)self reference];
        [v28 deleteSmartPromptStatesForDeletedActionUUIDs:v29 forReference:v30];
      }
    }
  }
  __int16 v31 = [(WFWorkflow *)self variableAvailability];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v32 = obj;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v34; ++j)
      {
        if (*(void *)v44 != v35) {
          objc_enumerationMutation(v32);
        }
        [v31 actionDidChange:*(void *)(*((void *)&v43 + 1) + 8 * j) moved:0 removed:1];
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v34);
  }
}

- (void)removeAction:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v7 count:1];

  -[WFWorkflow removeActions:](self, "removeActions:", v6, v7, v8);
}

- (void)addAction:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFWorkflowLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    id v11 = "-[WFWorkflow addAction:]";
    __int16 v12 = 2114;
    id v13 = v4;
    __int16 v14 = 2114;
    uint64_t v15 = self;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Adding action: %{public}@ to workflow: %{public}@", (uint8_t *)&v10, 0x20u);
  }

  [(WFWorkflow *)self willChangeValueForKey:@"actions"];
  uint64_t v6 = [(WFWorkflow *)self actions];
  id v7 = [v6 arrayByAddingObject:v4];
  actions = self->_actions;
  self->_actions = v7;

  [(WFWorkflow *)self didChangeValueForKey:@"actions"];
  [(WFWorkflow *)self setSerializeActionsWhenSaving:1];
  [(WFWorkflow *)self initializeAddedAction:v4];
  uint64_t v9 = [(WFWorkflow *)self variableAvailability];
  [v9 actionDidChange:v4 moved:0 removed:0];

  [(WFWorkflow *)self updateSuggestedNameIfPossible];
  [(WFWorkflow *)self save];
}

- (NSArray)actions
{
  actions = self->_actions;
  if (!actions)
  {
    id v4 = (NSArray *)objc_opt_new();
    id v5 = self->_actions;
    self->_actions = v4;

    actions = self->_actions;
  }
  uint64_t v6 = (void *)[(NSArray *)actions copy];
  return (NSArray *)v6;
}

- (void)initializeAddedAction:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFWorkflowLogObject();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = getWFWorkflowLogObject();
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v9 = [v4 identifier];
    int v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    int v16 = 138412546;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "InitializeAddedAction", "identifier=%{signpost.description:attribute}@,class=%{signpost.description:attribute}@", (uint8_t *)&v16, 0x16u);
  }
  [v4 willBeAddedToWorkflow:self];
  __int16 v12 = [(WFWorkflow *)self groupingCache];
  id v13 = [(WFWorkflow *)self actions];
  [v12 addAction:v4 sortingWithWorkflowActions:v13];

  [v4 wasAddedToWorkflow:self];
  [v4 addEventObserver:self];
  __int16 v14 = getWFWorkflowLogObject();
  uint64_t v15 = v14;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v15, OS_SIGNPOST_INTERVAL_END, v6, "InitializeAddedAction", "", (uint8_t *)&v16, 2u);
  }
}

- (void)getHomeSummaryTextWithCompletion:(id)a3
{
  int v10 = (void (**)(id, void))a3;
  id v4 = [(WFWorkflow *)self actions];
  id v5 = [v4 firstObject];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      os_signpost_id_t v6 = v5;
    }
    else {
      os_signpost_id_t v6 = 0;
    }
  }
  else
  {
    os_signpost_id_t v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [(WFWorkflow *)self actions];
  uint64_t v9 = [v8 count];

  if (v9 == 1 && v7) {
    [v7 localizedParameterSummaryWithCompletion:v10];
  }
  else {
    v10[2](v10, 0);
  }
}

- (void)configureWithStandaloneShortcutRepresentation:(id)a3 homeSummaryText:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WFWorkflow *)self record];
  uint64_t v9 = getWFWorkflowLogObject();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315650;
      long long v41 = "-[WFWorkflow configureWithStandaloneShortcutRepresentation:homeSummaryText:]";
      __int16 v42 = 2114;
      long long v43 = self;
      __int16 v44 = 2114;
      id v45 = v6;
      id v11 = "%s Configuring workflow %{public}@ as single step shortcut with representation: %{public}@";
      __int16 v12 = v9;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_INFO, v11, buf, v13);
    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 136315394;
    long long v41 = "-[WFWorkflow configureWithStandaloneShortcutRepresentation:homeSummaryText:]";
    __int16 v42 = 2114;
    long long v43 = self;
    id v11 = "%s Updating subtitle and actions summary of workflow: %{public}@";
    __int16 v12 = v9;
    uint32_t v13 = 22;
    goto LABEL_6;
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__WFWorkflow_configureWithStandaloneShortcutRepresentation_homeSummaryText___block_invoke;
  aBlock[3] = &unk_1E65556E0;
  id v14 = v6;
  id v37 = v14;
  long long v38 = self;
  id v15 = v8;
  id v39 = v15;
  int v16 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v17 = [(WFWorkflow *)self resolvedAssociatedAppBundleIdentifier];
  if (v17
    || ([(WFWorkflow *)self associatedAppBundleIdentifier],
        (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v14 associatedAppBundleIdentifier], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    __int16 v18 = [MEMORY[0x1E4F304C8] sharedConnection];
    uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithObject:v17];
    objc_msgSend(v18, "wf_accessBundleContentForBundleIdentifiers:withBlock:", v19, v16);

    if (v7)
    {
LABEL_11:
      id v20 = v7;
      goto LABEL_14;
    }
  }
  else
  {
    v16[2](v16);
    if (v7) {
      goto LABEL_11;
    }
  }
  id v20 = [(WFWorkflow *)self localizedActionsSummary];
LABEL_14:
  int v21 = v20;
  uint64_t v22 = [v15 actionsDescription];
  if ((void *)v22 == v21)
  {
  }
  else
  {
    id v23 = (void *)v22;
    long long v24 = [v15 actionsDescription];
    char v25 = [v24 isEqualToString:v21];

    if ((v25 & 1) == 0)
    {
      [(WFWorkflow *)self willChangeValueForKey:@"actionsDescription"];
      [v15 setActionsDescription:v21];
      [(WFWorkflow *)self didChangeValueForKey:@"actionsDescription"];
    }
  }
  uint64_t v26 = [(WFWorkflow *)self resolvedAssociatedAppBundleIdentifier];
  id v27 = (id)v26;
  if (v6 && !v26)
  {
    long long v28 = [v14 associatedAppBundleIdentifier];
    long long v29 = v28;
    if (v28)
    {
      id v30 = v28;
    }
    else
    {
      __int16 v31 = [v14 launchIdForCurrentPlatform];
      id v32 = v31;
      if (v31)
      {
        id v33 = v31;
      }
      else
      {
        id v33 = [v14 activityBundleIdentifier];
      }
      id v30 = v33;
    }
    if (VCIsShortcutsAppBundleIdentifier()) {
      id v27 = 0;
    }
    else {
      id v27 = v30;
    }
  }
  if (!v27)
  {
    uint64_t v34 = self;
    id v35 = 0;
    goto LABEL_34;
  }
  if ([(WFWorkflow *)self shouldAutoUpdateAssociatedAppBundleIdentifier])
  {
    uint64_t v34 = self;
    id v35 = v27;
LABEL_34:
    [(WFWorkflow *)v34 setAssociatedAppBundleIdentifier:v35];
  }
}

void __76__WFWorkflow_configureWithStandaloneShortcutRepresentation_homeSummaryText___block_invoke(id *a1)
{
  id v2 = [a1[4] title];
  if (![v2 length]) {
    goto LABEL_8;
  }
  BOOL v3 = [a1[5] name];
  id v4 = [a1[4] title];
  id v5 = v3;
  id v6 = v4;
  if (v5 == v6)
  {

LABEL_8:
    goto LABEL_9;
  }
  id v7 = v6;
  if (v5 && v6)
  {
    char v8 = [v5 isEqualToString:v6];

    if ((v8 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v9 = [a1[5] localizedSubtitle];
    goto LABEL_12;
  }

LABEL_11:
  uint64_t v9 = [a1[4] title];
LABEL_12:
  BOOL v10 = (void *)v9;
  id v11 = [a1[6] workflowSubtitle];
  id v14 = v10;
  id v12 = v11;
  if (v14 == v12)
  {

    goto LABEL_20;
  }
  if (!v14 || !v12)
  {

    goto LABEL_19;
  }
  char v13 = [v14 isEqualToString:v12];

  if ((v13 & 1) == 0)
  {
LABEL_19:
    [a1[5] willChangeValueForKey:@"workflowSubtitle"];
    [a1[6] setWorkflowSubtitle:v14];
    [a1[5] didChangeValueForKey:@"workflowSubtitle"];
  }
LABEL_20:
}

- (void)configureAsSingleStepShortcutIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = getWFWorkflowLogObject();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  id v7 = getWFWorkflowLogObject();
  char v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "GenerateStandaloneRepresentation", "", buf, 2u);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__WFWorkflow_configureAsSingleStepShortcutIfNecessary___block_invoke;
  v10[3] = &unk_1E65528F8;
  id v11 = v4;
  os_signpost_id_t v12 = v6;
  v10[4] = self;
  id v9 = v4;
  [(WFWorkflow *)self generateStandaloneShortcutRepresentation:v10];
}

void __55__WFWorkflow_configureAsSingleStepShortcutIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = getWFWorkflowLogObject();
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v5, OS_SIGNPOST_INTERVAL_END, v6, "GenerateStandaloneRepresentation", "", buf, 2u);
  }

  id v7 = getWFWorkflowLogObject();
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = getWFWorkflowLogObject();
  BOOL v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "HomeSummaryText", "", buf, 2u);
  }

  id v11 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__WFWorkflow_configureAsSingleStepShortcutIfNecessary___block_invoke_431;
  v13[3] = &unk_1E65528D0;
  os_signpost_id_t v16 = v8;
  void v13[4] = v11;
  id v14 = v3;
  id v15 = *(id *)(a1 + 40);
  id v12 = v3;
  [v11 getHomeSummaryTextWithCompletion:v13];
}

uint64_t __55__WFWorkflow_configureAsSingleStepShortcutIfNecessary___block_invoke_431(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = getWFWorkflowLogObject();
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 56);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)os_signpost_id_t v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v5, OS_SIGNPOST_INTERVAL_END, v6, "HomeSummaryText", "", v8, 2u);
  }

  [*(id *)(a1 + 32) configureWithStandaloneShortcutRepresentation:*(void *)(a1 + 40) homeSummaryText:v3];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)generateStandaloneShortcutRepresentation:(id)a3
{
  os_signpost_id_t v8 = (void (**)(id, void))a3;
  id v4 = [(WFWorkflow *)self actions];
  if ([v4 count] == 1)
  {
    id v5 = [v4 firstObject];
    os_signpost_id_t v6 = v5;
    if (v5 && ([v5 conformsToProtocol:&unk_1F231C148] & 1) != 0)
    {
      id v7 = v6;

      [v7 generateStandaloneShortcutRepresentation:v8];
      goto LABEL_7;
    }
  }
  v8[2](v8, 0);
LABEL_7:
}

- (void)clearOutReference
{
  reference = self->_reference;
  self->_reference = 0;
}

- (BOOL)queue_reloadReferenceFromStorage
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFWorkflow *)self storageProvider];
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

  os_signpost_id_t v6 = [(WFWorkflow *)self reference];
  id v7 = [v6 identifier];

  if (v5) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8)
  {
    [(WFWorkflow *)self willChangeValueForKey:@"reference"];
    BOOL v10 = [v5 database];
    id v11 = [v10 referenceForWorkflowID:v7];
    reference = self->_reference;
    self->_reference = v11;

    [(WFWorkflow *)self didChangeValueForKey:@"reference"];
    goto LABEL_23;
  }
  if (v5)
  {
    if (v7) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }
  char v13 = getWFWorkflowLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 136315394;
    uint64_t v17 = "-[WFWorkflow queue_reloadReferenceFromStorage]";
    __int16 v18 = 2112;
    uint64_t v19 = self;
    _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_DEBUG, "%s Asked to reload reference from storage, but missing storage: %@", (uint8_t *)&v16, 0x16u);
  }

  if (!v7)
  {
LABEL_20:
    id v14 = getWFWorkflowLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 136315394;
      uint64_t v17 = "-[WFWorkflow queue_reloadReferenceFromStorage]";
      __int16 v18 = 2112;
      uint64_t v19 = self;
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_DEBUG, "%s Asked to reload reference from storage, but missing identifier: %@", (uint8_t *)&v16, 0x16u);
    }
  }
LABEL_23:

  return v9;
}

- (BOOL)reloadReferenceFromStorage
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    return [(WFWorkflow *)self queue_reloadReferenceFromStorage];
  }
  else
  {
    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x2020000000;
    char v9 = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __40__WFWorkflow_reloadReferenceFromStorage__block_invoke;
    v5[3] = &unk_1E6558960;
    v5[4] = self;
    void v5[5] = &v6;
    dispatch_sync(MEMORY[0x1E4F14428], v5);
    char v4 = *((unsigned char *)v7 + 24);
    _Block_object_dispose(&v6, 8);
    return v4;
  }
}

uint64_t __40__WFWorkflow_reloadReferenceFromStorage__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "queue_reloadReferenceFromStorage");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)updateMinimumClientVersion
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = @"900";
  char v4 = @"900";
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [(WFWorkflow *)self actions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      uint64_t v9 = 0;
      BOOL v10 = v3;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = [*(id *)(*((void *)&v20 + 1) + 8 * v9) minimumSupportedClientVersion];
        WFMaximumBundleVersion(v11, v10);
        id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v9;
        BOOL v10 = v3;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  id v12 = [(WFWorkflow *)self inputAction];

  if (v12)
  {
    char v13 = [(WFWorkflow *)self inputAction];
    id v14 = [v13 minimumSupportedClientVersion];
    uint64_t v15 = WFMaximumBundleVersion(v3, v14);

    id v3 = (__CFString *)v15;
  }
  int v16 = [(WFWorkflow *)self record];
  uint64_t v17 = [v16 minimumClientVersion];
  uint64_t v18 = WFCompareBundleVersions(v3, v17);

  if (v18 != 1)
  {
    uint64_t v19 = [(WFWorkflow *)self record];
    [v19 setMinimumClientVersion:v3];
  }
}

- (void)performBatchOperation:(id)a3
{
  char v4 = (void (**)(void))a3;
  [(WFWorkflow *)self setSaveDisabled:1];
  v4[2](v4);

  [(WFWorkflow *)self setSaveDisabled:0];
  [(WFWorkflow *)self save];
}

- (void)loadFromRecord
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFWorkflow *)self record];
  char v4 = getWFWorkflowLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v40 = "-[WFWorkflow loadFromRecord]";
    __int16 v41 = 2114;
    __int16 v42 = v3;
    _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_DEFAULT, "%s Loading workflow from record: %{public}@", buf, 0x16u);
  }

  id v5 = getWFWorkflowLogObject();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);

  uint64_t v7 = getWFWorkflowLogObject();
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LoadFromRecord", "", buf, 2u);
  }

  [(WFWorkflow *)self willChangeValueForKey:@"inputClasses"];
  uint64_t v9 = [v3 inputClasses];
  objc_msgSend(v9, "if_compactMap:", &__block_literal_global_417);
  BOOL v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
  inputClasses = self->_inputClasses;
  self->_inputClasses = v10;

  [(WFWorkflow *)self didChangeValueForKey:@"inputClasses"];
  [(WFWorkflow *)self willChangeValueForKey:@"noInputBehavior"];
  id v12 = [v3 noInputBehavior];
  WFWorkflowNoInputBehaviorFromSerializedRepresentation(v12);
  char v13 = (WFWorkflowNoInputBehavior *)objc_claimAutoreleasedReturnValue();
  noInputBehavior = self->_noInputBehavior;
  self->_noInputBehavior = v13;

  [(WFWorkflow *)self didChangeValueForKey:@"noInputBehavior"];
  [(WFWorkflow *)self willChangeValueForKey:@"outputClasses"];
  uint64_t v15 = [v3 outputClasses];
  objc_msgSend(v15, "if_compactMap:", &__block_literal_global_419);
  int v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  outputClasses = self->_outputClasses;
  self->_outputClasses = v16;

  [(WFWorkflow *)self didChangeValueForKey:@"outputClasses"];
  uint64_t v18 = [v3 actions];
  uint64_t v19 = +[WFActionRegistry sharedRegistry];
  long long v20 = +[WFAction actionsFromSerializedRepresentations:v18 actionRegistry:v19];

  [(WFWorkflow *)self willChangeValueForKey:@"actions"];
  long long v21 = (NSArray *)[v20 copy];
  actions = self->_actions;
  self->_actions = v21;

  [(WFWorkflow *)self didChangeValueForKey:@"actions"];
  [(WFWorkflow *)self willChangeValueForKey:@"importQuestions"];
  long long v23 = [v3 importQuestions];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __28__WFWorkflow_loadFromRecord__block_invoke_3;
  v37[3] = &unk_1E65528A8;
  v37[4] = self;
  objc_msgSend(v23, "if_compactMap:", v37);
  long long v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
  importQuestions = self->_importQuestions;
  self->_importQuestions = v24;

  [(WFWorkflow *)self didChangeValueForKey:@"importQuestions"];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v26 = v20;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v34 != v29) {
          objc_enumerationMutation(v26);
        }
        -[WFWorkflow initializeAddedAction:](self, "initializeAddedAction:", *(void *)(*((void *)&v33 + 1) + 8 * i), (void)v33);
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v28);
  }

  [(WFWorkflow *)self updateInputAction];
  [(WFWorkflow *)self fixControlFlowActionLayout];
  __int16 v31 = getWFWorkflowLogObject();
  id v32 = v31;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v32, OS_SIGNPOST_INTERVAL_END, v6, "LoadFromRecord", "", buf, 2u);
  }
}

WFWorkflowImportQuestion *__28__WFWorkflow_loadFromRecord__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [[WFWorkflowImportQuestion alloc] initWithSerializedRepresentation:v3 workflowActions:*(void *)(*(void *)(a1 + 32) + 16)];

  return v4;
}

Class __28__WFWorkflow_loadFromRecord__block_invoke_2(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

Class __28__WFWorkflow_loadFromRecord__block_invoke(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

- (void)reloadFromRecord
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(WFWorkflow *)self storageProvider];
  if (v3)
  {
    id v35 = (id)v3;
    uint64_t v4 = [(WFWorkflow *)self reference];
    if (v4)
    {
      id v5 = (void *)v4;
      BOOL v6 = [(WFWorkflow *)self serializeActionsWhenSaving];

      if (!v6)
      {
        uint64_t v7 = getWFWorkflowLogObject();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = [(WFWorkflow *)self storageProvider];
          *(_DWORD *)buf = 136315650;
          long long v54 = "-[WFWorkflow reloadFromRecord]";
          __int16 v55 = 2114;
          v56 = self;
          __int16 v57 = 2114;
          v58 = v8;
          _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_DEFAULT, "%s Reloading workflow: %{public}@ from storage provider: %{public}@", buf, 0x20u);
        }
        v52[0] = @"name";
        v52[1] = @"legacyName";
        v52[2] = @"icon";
        v52[3] = @"workflowTypes";
        v52[4] = @"workflowSubtitle";
        v52[5] = @"actionsDescription";
        v52[6] = @"associatedAppBundleIdentifier";
        v52[7] = @"quarantine";
        v52[8] = @"remoteQuarantineStatus";
        v52[9] = @"deleted";
        [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:10];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = [v9 countByEnumeratingWithState:&v45 objects:v51 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v46 != v12) {
                objc_enumerationMutation(v9);
              }
              [(WFWorkflow *)self willChangeValueForKey:*(void *)(*((void *)&v45 + 1) + 8 * i)];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v45 objects:v51 count:16];
          }
          while (v11);
        }

        id v14 = [(WFWorkflow *)self record];
        uint64_t v15 = (void *)[v14 copy];

        int v16 = [(WFWorkflow *)self storageProvider];
        uint64_t v17 = [(WFWorkflow *)self record];
        uint64_t v18 = [(WFWorkflow *)self reference];
        id v44 = 0;
        char v19 = [v16 reloadRecord:v17 withReference:v18 error:&v44];
        long long v20 = (WFWorkflow *)v44;

        if ((v19 & 1) == 0)
        {
          long long v21 = getWFGeneralLogObject();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            long long v54 = "-[WFWorkflow reloadFromRecord]";
            __int16 v55 = 2114;
            v56 = v20;
            _os_log_impl(&dword_1C7F0A000, v21, OS_LOG_TYPE_ERROR, "%s Failed to reload workflow from record. Error: %{public}@", buf, 0x16u);
          }
        }
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v22 = v9;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v41;
          do
          {
            for (uint64_t j = 0; j != v24; ++j)
            {
              if (*(void *)v41 != v25) {
                objc_enumerationMutation(v22);
              }
              [(WFWorkflow *)self didChangeValueForKey:*(void *)(*((void *)&v40 + 1) + 8 * j)];
            }
            uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v50 count:16];
          }
          while (v24);
        }

        uint64_t v27 = [(WFWorkflow *)self record];
        BOOL v28 = [(WFWorkflow *)self record:v27 isEquivalentToRecord:v15];

        if (!v28)
        {
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v29 = self->_actions;
          uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:&v36 objects:v49 count:16];
          if (v30)
          {
            uint64_t v31 = v30;
            uint64_t v32 = *(void *)v37;
            do
            {
              for (uint64_t k = 0; k != v31; ++k)
              {
                if (*(void *)v37 != v32) {
                  objc_enumerationMutation(v29);
                }
                long long v34 = *(void **)(*((void *)&v36 + 1) + 8 * k);
                [v34 removeEventObserver:self];
                [v34 wasRemovedFromWorkflow:self];
              }
              uint64_t v31 = [(NSArray *)v29 countByEnumeratingWithState:&v36 objects:v49 count:16];
            }
            while (v31);
          }

          [(WFWorkflow *)self setGroupingCache:0];
          [(WFWorkflow *)self setVariableAvailability:0];
          [(WFWorkflow *)self loadFromRecord];
        }
      }
    }
    else
    {
    }
  }
}

- (void)saveFromDebouncer:(id)a3
{
  if (!a3)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"WFWorkflow.m", 666, @"Invalid parameter not satisfying: %@", @"debouncer" object file lineNumber description];
  }
  [(WFWorkflow *)self saveWithCompletionBlock:0];
}

- (void)saveWithCompletionBlock:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFWorkflowLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v30 = "-[WFWorkflow saveWithCompletionBlock:]";
    __int16 v31 = 2112;
    uint64_t v32 = self;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s Saving workflow: %@", buf, 0x16u);
  }

  BOOL v6 = getWFWorkflowLogObject();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  uint64_t v8 = getWFWorkflowLogObject();
  id v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Save", "", buf, 2u);
  }

  if ([(WFWorkflow *)self serializeActionsWhenSaving])
  {
    uint64_t v10 = getWFWorkflowLogObject();
    os_signpost_id_t v11 = os_signpost_id_generate(v10);

    uint64_t v12 = getWFWorkflowLogObject();
    char v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "SerializeActions", "", buf, 2u);
    }

    id v14 = [(WFWorkflow *)self actions];
    uint64_t v15 = objc_msgSend(v14, "if_map:", &__block_literal_global_394);

    int v16 = [(WFWorkflow *)self record];
    uint64_t v17 = [v16 actions];
    char v18 = [v17 isEqualToArray:v15];

    if ((v18 & 1) == 0)
    {
      char v19 = [(WFWorkflow *)self record];
      [v19 setActions:v15];
    }
    [(WFWorkflow *)self setSerializeActionsWhenSaving:0];
    long long v20 = getWFWorkflowLogObject();
    long long v21 = v20;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v21, OS_SIGNPOST_INTERVAL_END, v11, "SerializeActions", "", buf, 2u);
    }
  }
  buf[0] = 0;
  id v22 = [(WFWorkflow *)self inferOutputTypesWithHasOutputFallback:buf];
  uint64_t v23 = [v22 allObjects];
  [(WFWorkflow *)self setOutputClasses:v23];

  uint64_t v24 = [(WFWorkflow *)self variableAvailability];
  -[WFWorkflow setHasShortcutInputVariables:](self, "setHasShortcutInputVariables:", [v24 isShortcutInputVariableUsed]);

  [(WFWorkflow *)self setHasOutputFallback:buf[0]];
  [(WFWorkflow *)self updateMinimumClientVersion];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __38__WFWorkflow_saveWithCompletionBlock___block_invoke_395;
  v26[3] = &unk_1E6552860;
  v26[4] = self;
  id v27 = v4;
  os_signpost_id_t v28 = v7;
  id v25 = v4;
  [(WFWorkflow *)self configureAsSingleStepShortcutIfNecessary:v26];
}

void __38__WFWorkflow_saveWithCompletionBlock___block_invoke_395(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) storageProvider];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) reference];

    if (v3)
    {
      [*(id *)(a1 + 32) setSaving:1];
      id v4 = getWFWorkflowLogObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        id v5 = [*(id *)(a1 + 32) record];
        BOOL v6 = [*(id *)(a1 + 32) storageProvider];
        *(_DWORD *)buf = 136315650;
        char v18 = "-[WFWorkflow saveWithCompletionBlock:]_block_invoke";
        __int16 v19 = 2114;
        id v20 = v5;
        __int16 v21 = 2114;
        id v22 = v6;
        _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_INFO, "%s Saving workflow record: %{public}@ to storage provider: %{public}@", buf, 0x20u);
      }
      os_signpost_id_t v7 = [*(id *)(a1 + 32) storageProvider];
      uint64_t v8 = [*(id *)(a1 + 32) record];
      id v9 = [*(id *)(a1 + 32) reference];
      id v16 = 0;
      char v10 = [v7 saveRecord:v8 withReference:v9 error:&v16];
      id v2 = v16;

      if ((v10 & 1) == 0)
      {
        os_signpost_id_t v11 = getWFGeneralLogObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          char v18 = "-[WFWorkflow saveWithCompletionBlock:]_block_invoke";
          __int16 v19 = 2114;
          id v20 = v2;
          _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, "%s Failed to save workflow. Error: %{public}@", buf, 0x16u);
        }
      }
      [*(id *)(a1 + 32) reloadReferenceFromStorage];
      [*(id *)(a1 + 32) setRetainedSelf:0];
    }
    else
    {
      id v2 = 0;
    }
  }
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v2);
  }
  char v13 = getWFWorkflowLogObject();
  id v14 = v13;
  os_signpost_id_t v15 = *(void *)(a1 + 48);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v14, OS_SIGNPOST_INTERVAL_END, v15, "Save", "", buf, 2u);
  }
}

uint64_t __38__WFWorkflow_saveWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 serializedRepresentation];
}

- (BOOL)createReferenceIfNecessaryWithName:(id)a3 nameCollisionBehavior:(unint64_t)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(WFWorkflow *)self reference];
  if (v9)
  {

LABEL_13:
    BOOL v17 = 1;
    goto LABEL_14;
  }
  if ([(WFWorkflow *)self storageState] != 2) {
    goto LABEL_13;
  }
  char v10 = getWFWorkflowLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 136315394;
    __int16 v21 = "-[WFWorkflow createReferenceIfNecessaryWithName:nameCollisionBehavior:error:]";
    __int16 v22 = 2112;
    uint64_t v23 = self;
    _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEBUG, "%s Creating database reference for workflow: %@", (uint8_t *)&v20, 0x16u);
  }

  os_signpost_id_t v11 = [(WFWorkflow *)self record];
  uint64_t v12 = (void *)[v11 copy];

  if (v8) {
    [v12 setName:v8];
  }
  char v13 = [[WFWorkflowCreationOptions alloc] initWithRecord:v12];
  id v14 = [(WFWorkflowCreationOptions *)self->_creationOptions collectionIdentifier];
  [(WFWorkflowCreationOptions *)v13 setCollectionIdentifier:v14];

  os_signpost_id_t v15 = [(WFWorkflow *)self database];
  id v16 = [v15 createWorkflowWithOptions:v13 nameCollisionBehavior:a4 error:a5];

  BOOL v17 = v16 != 0;
  if (v16)
  {
    [(WFWorkflow *)self willChangeValueForKey:@"reference"];
    objc_storeStrong((id *)&self->_reference, v16);
    [(WFWorkflow *)self didChangeValueForKey:@"reference"];
    if (v8)
    {
      char v18 = [v16 name];
      [(WFWorkflow *)self setName:v18];
    }
    [(WFWorkflow *)self saveWithCompletionBlock:0];
  }

LABEL_14:
  return v17;
}

- (void)save
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (![(WFWorkflow *)self saveDisabled]
    && ![(WFWorkflow *)self ignoreModifications])
  {
    uint64_t v3 = [(WFWorkflow *)self database];

    if (v3)
    {
      id v4 = getWFWorkflowLogObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v6 = 136315394;
        os_signpost_id_t v7 = "-[WFWorkflow save]";
        __int16 v8 = 2112;
        id v9 = self;
        _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_INFO, "%s Poking the save debouncer for workflow: %@", (uint8_t *)&v6, 0x16u);
      }

      [(WFWorkflow *)self createReferenceIfNecessaryWithName:0 nameCollisionBehavior:0 error:0];
      [(WFWorkflow *)self setRetainedSelf:self];
      id v5 = [(WFWorkflow *)self saveDebouncer];
      [v5 poke];
    }
    else
    {
      [(WFWorkflow *)self saveWithCompletionBlock:0];
    }
  }
}

- (WFDatabase)database
{
  id v2 = [(WFWorkflow *)self storageProvider];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  id v5 = [v4 database];

  return (WFDatabase *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[WFWorkflow allocWithZone:a3];
  id v5 = [(WFWorkflow *)self record];
  int v6 = (void *)[v5 copy];
  os_signpost_id_t v7 = [(WFWorkflow *)self reference];
  __int16 v8 = [(WFWorkflow *)self storageProvider];
  id v9 = [(WFWorkflow *)v4 initWithRecord:v6 reference:v7 storageProvider:v8 error:0];

  return v9;
}

- (id)prepareForSharingWithOptions:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[(WFWorkflow *)self copy];
  [v5 setStorageProvider:0];
  if ([v4 clearsImportQuestionData])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    int v6 = objc_msgSend(v5, "importQuestions", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          os_signpost_id_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v12 = [v11 action];
          char v13 = [v11 defaultState];
          id v14 = [v11 parameter];
          os_signpost_id_t v15 = [v14 key];
          [v12 setParameterState:v13 forKey:v15];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }
  }
  id v16 = [v5 record];
  BOOL v17 = [v4 quickActionSurfaces];
  if ([v17 count])
  {
    char v18 = [v17 allObjects];
    [v16 setQuickActionSurfacesForSharing:v18];
  }
  return v16;
}

- (id)validImportQuestions
{
  uint64_t v3 = [(WFWorkflow *)self importQuestions];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__WFWorkflow_validImportQuestions__block_invoke;
  v6[3] = &unk_1E6552818;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "if_objectsPassingTest:", v6);

  return v4;
}

uint64_t __34__WFWorkflow_validImportQuestions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 action];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) actions];
    int v6 = [v3 action];
    uint64_t v7 = [v5 containsObject:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)isDeleted
{
  id v3 = [(WFWorkflow *)self record];
  BOOL v4 = ([v3 isDeleted] & 1) != 0 || -[WFWorkflow deletedFromDatabase](self, "deletedFromDatabase");

  return v4;
}

- (void)setRemoteQuarantineHash:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWorkflow *)self remoteQuarantineHash];
  id v6 = v4;
  id v9 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(WFWorkflow *)self willChangeValueForKey:@"remoteQuarantineStatus"];
    uint64_t v8 = [(WFWorkflow *)self record];
    [v8 setRemoteQuarantineHash:v9];

    [(WFWorkflow *)self didChangeValueForKey:@"remoteQuarantineStatus"];
  }
LABEL_9:
}

- (NSData)remoteQuarantineHash
{
  id v2 = [(WFWorkflow *)self record];
  id v3 = [v2 remoteQuarantineHash];

  return (NSData *)v3;
}

- (void)setRemoteQuarantineStatus:(int64_t)a3
{
  id v5 = [(WFWorkflow *)self record];
  uint64_t v6 = [v5 remoteQuarantineStatus];

  if (v6 != a3)
  {
    [(WFWorkflow *)self willChangeValueForKey:@"remoteQuarantineStatus"];
    char v7 = [(WFWorkflow *)self record];
    [v7 setRemoteQuarantineStatus:a3];

    [(WFWorkflow *)self didChangeValueForKey:@"remoteQuarantineStatus"];
  }
}

- (int64_t)remoteQuarantineStatus
{
  id v2 = [(WFWorkflow *)self record];
  int64_t v3 = [v2 remoteQuarantineStatus];

  return v3;
}

- (WFWorkflowQuarantine)quarantine
{
  id v2 = [(WFWorkflow *)self record];
  int64_t v3 = [v2 quarantine];

  return (WFWorkflowQuarantine *)v3;
}

- (void)setHasOutputFallback:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WFWorkflow *)self record];
  int v6 = [v5 hasOutputFallback];

  if (v6 != v3)
  {
    [(WFWorkflow *)self willChangeValueForKey:@"hasOutputFallback"];
    char v7 = [(WFWorkflow *)self record];
    [v7 setHasOutputFallback:v3];

    [(WFWorkflow *)self didChangeValueForKey:@"hasOutputFallback"];
  }
}

- (BOOL)hasOutputFallback
{
  id v2 = [(WFWorkflow *)self record];
  char v3 = [v2 hasOutputFallback];

  return v3;
}

- (void)setHasShortcutInputVariables:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WFWorkflow *)self record];
  int v6 = [v5 hasShortcutInputVariables];

  if (v6 != v3)
  {
    [(WFWorkflow *)self willChangeValueForKey:@"hasShortcutInputVariables"];
    char v7 = [(WFWorkflow *)self record];
    [v7 setHasShortcutInputVariables:v3];

    [(WFWorkflow *)self didChangeValueForKey:@"hasShortcutInputVariables"];
  }
}

- (BOOL)hasShortcutInputVariables
{
  id v2 = [(WFWorkflow *)self record];
  char v3 = [v2 hasShortcutInputVariables];

  return v3;
}

- (void)setOutputClasses:(id)a3
{
  id v4 = a3;
  outputClasses = self->_outputClasses;
  char v13 = (NSArray *)v4;
  int v6 = outputClasses;
  if (v6 == v13)
  {

    goto LABEL_9;
  }
  if (!v13 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSArray *)v13 isEqualToArray:v6];

  if (!v7)
  {
LABEL_8:
    [(WFWorkflow *)self willChangeValueForKey:@"outputClasses"];
    uint64_t v8 = (NSArray *)[(NSArray *)v13 copy];
    id v9 = self->_outputClasses;
    self->_outputClasses = v8;

    uint64_t v10 = [(WFWorkflow *)self outputClasses];
    os_signpost_id_t v11 = objc_msgSend(v10, "if_map:", &__block_literal_global_377);
    uint64_t v12 = [(WFWorkflow *)self record];
    [v12 setOutputClasses:v11];

    [(WFWorkflow *)self didChangeValueForKey:@"outputClasses"];
  }
LABEL_9:
}

NSString *__31__WFWorkflow_setOutputClasses___block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

- (void)setNoInputBehavior:(id)a3
{
  id v4 = (WFWorkflowNoInputBehavior *)a3;
  [(WFWorkflow *)self willChangeValueForKey:@"noInputBehavior"];
  noInputBehavior = self->_noInputBehavior;
  self->_noInputBehavior = v4;
  int v6 = v4;

  BOOL v7 = [(WFWorkflowNoInputBehavior *)v6 serializedRepresentation];

  uint64_t v8 = [(WFWorkflow *)self record];
  [v8 setNoInputBehavior:v7];

  [(WFWorkflow *)self didChangeValueForKey:@"noInputBehavior"];
}

- (void)setInputClasses:(id)a3
{
  id v4 = a3;
  inputClasses = self->_inputClasses;
  char v13 = (NSArray *)v4;
  int v6 = inputClasses;
  if (v6 == v13)
  {

    goto LABEL_9;
  }
  if (!v13 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSArray *)v13 isEqualToArray:v6];

  if (!v7)
  {
LABEL_8:
    [(WFWorkflow *)self willChangeValueForKey:@"inputClasses"];
    uint64_t v8 = (NSArray *)[(NSArray *)v13 copy];
    id v9 = self->_inputClasses;
    self->_inputClasses = v8;

    uint64_t v10 = [(WFWorkflow *)self inputClasses];
    os_signpost_id_t v11 = objc_msgSend(v10, "if_map:", &__block_literal_global_369);
    uint64_t v12 = [(WFWorkflow *)self record];
    [v12 setInputClasses:v11];

    [(WFWorkflow *)self didChangeValueForKey:@"inputClasses"];
  }
LABEL_9:
}

NSString *__30__WFWorkflow_setInputClasses___block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

- (void)setDisabledOnLockScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WFWorkflow *)self record];
  int v6 = [v5 disabledOnLockScreen];

  if (v6 != v3)
  {
    [(WFWorkflow *)self willChangeValueForKey:@"disabledOnLockScreen"];
    BOOL v7 = [(WFWorkflow *)self record];
    [v7 setDisabledOnLockScreen:v3];

    [(WFWorkflow *)self didChangeValueForKey:@"disabledOnLockScreen"];
  }
}

- (BOOL)disabledOnLockScreen
{
  id v2 = [(WFWorkflow *)self record];
  char v3 = [v2 disabledOnLockScreen];

  return v3;
}

- (void)setHiddenFromLibraryAndSync:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WFWorkflow *)self record];
  int v6 = [v5 hiddenFromLibraryAndSync];

  if (v6 != v3)
  {
    [(WFWorkflow *)self willChangeValueForKey:@"hiddenFromLibraryAndSync"];
    BOOL v7 = [(WFWorkflow *)self record];
    [v7 setHiddenFromLibraryAndSync:v3];

    [(WFWorkflow *)self didChangeValueForKey:@"hiddenFromLibraryAndSync"];
  }
}

- (BOOL)hiddenFromLibraryAndSync
{
  id v2 = [(WFWorkflow *)self record];
  char v3 = [v2 hiddenFromLibraryAndSync];

  return v3;
}

- (void)setWorkflowTypes:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWorkflow *)self workflowTypes];
  id v9 = v4;
  id v6 = v5;
  if (v6 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v6)
  {

    goto LABEL_8;
  }
  char v7 = [v9 isEqualToArray:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    [(WFWorkflow *)self willChangeValueForKey:@"workflowTypes"];
    uint64_t v8 = [(WFWorkflow *)self record];
    [v8 setWorkflowTypes:v9];

    [(WFWorkflow *)self didChangeValueForKey:@"workflowTypes"];
    [(WFWorkflow *)self updateInputAction];
  }
LABEL_9:
}

- (NSArray)workflowTypes
{
  id v2 = [(WFWorkflow *)self record];
  char v3 = [v2 workflowTypes];

  return (NSArray *)v3;
}

- (NSString)source
{
  source = self->_source;
  if (source)
  {
    char v3 = source;
  }
  else
  {
    id v5 = [(WFWorkflow *)self record];
    id v6 = [v5 source];
    char v7 = v6;
    if (v6)
    {
      char v3 = v6;
    }
    else
    {
      uint64_t v8 = [(WFWorkflow *)self reference];
      char v3 = [v8 source];
    }
  }
  return v3;
}

- (NSString)galleryIdentifier
{
  id v2 = [(WFWorkflow *)self record];
  char v3 = [v2 galleryIdentifier];

  return (NSString *)v3;
}

- (NSString)resolvedAssociatedAppBundleIdentifier
{
  id v2 = (void *)MEMORY[0x1E4F1CAA0];
  char v3 = [(WFWorkflow *)self actions];
  id v4 = objc_msgSend(v3, "if_compactMap:", &__block_literal_global_344);
  id v5 = [v2 orderedSetWithArray:v4];

  if ([v5 count] == 1)
  {
    id v6 = [v5 firstObject];
  }
  else
  {
    id v6 = 0;
  }

  return (NSString *)v6;
}

id __51__WFWorkflow_resolvedAssociatedAppBundleIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = v2;
  if (v2)
  {
    if ([v2 conformsToProtocol:&unk_1F231C148]) {
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
  uint64_t v6 = [v5 associatedAppBundleIdentifier];
  if (v6)
  {
    id v7 = (id)v6;
  }
  else
  {
    uint64_t v8 = [v3 displayableAppDescriptor];
    id v7 = [v8 bundleIdentifier];

    if (!v7)
    {
LABEL_10:
      id v9 = 0;
      goto LABEL_12;
    }
  }
  if (VCIsShortcutsAppBundleIdentifier()) {
    goto LABEL_10;
  }
  id v7 = v7;
  id v9 = v7;
LABEL_12:

  return v9;
}

- (void)setShouldAutoUpdateAssociatedAppBundleIdentifier:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WFWorkflow *)self record];
  [v4 setShouldAutoUpdateAssociatedAppBundleIdentifier:v3];
}

- (BOOL)shouldAutoUpdateAssociatedAppBundleIdentifier
{
  id v2 = [(WFWorkflow *)self record];
  char v3 = [v2 shouldAutoUpdateAssociatedAppBundleIdentifier];

  return v3;
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(WFWorkflow *)self willChangeValueForKey:@"associatedAppBundleIdentifier"];
  uint64_t v5 = [(WFWorkflow *)self resolvedAssociatedAppBundleIdentifier];
  uint64_t v6 = (void *)v5;
  if (v4)
  {
    if (([v4 isEqualToString:v5] & 1) == 0)
    {
      id v7 = getWFWorkflowLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136315650;
        uint64_t v12 = "-[WFWorkflow setAssociatedAppBundleIdentifier:]";
        __int16 v13 = 2112;
        id v14 = v4;
        __int16 v15 = 2112;
        id v16 = v6;
        _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Mismatch associated app bundle identifier %@ with resolved associated app bundle identifier %@", (uint8_t *)&v11, 0x20u);
      }
    }
    uint64_t v8 = self;
    uint64_t v9 = 1;
    goto LABEL_9;
  }
  if (v5)
  {
    uint64_t v8 = self;
    uint64_t v9 = 0;
LABEL_9:
    [(WFWorkflow *)v8 setShouldAutoUpdateAssociatedAppBundleIdentifier:v9];
  }
  uint64_t v10 = [(WFWorkflow *)self record];
  [v10 setAssociatedAppBundleIdentifier:v4];

  [(WFWorkflow *)self didChangeValueForKey:@"associatedAppBundleIdentifier"];
}

- (NSString)associatedAppBundleIdentifier
{
  id v2 = [(WFWorkflow *)self record];
  char v3 = [v2 associatedAppBundleIdentifier];

  return (NSString *)v3;
}

- (NSString)actionsDescription
{
  char v3 = [(WFWorkflow *)self record];
  id v4 = [v3 actionsDescription];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(WFWorkflow *)self localizedActionsSummary];
  }
  id v7 = v6;

  return (NSString *)v7;
}

- (NSString)workflowSubtitle
{
  char v3 = [(WFWorkflow *)self record];
  uint64_t v4 = [v3 actionCount];
  uint64_t v5 = [(WFWorkflow *)self record];
  id v6 = [v5 workflowSubtitle];
  id v7 = +[WFWorkflowRecord workflowSubtitleForActionCount:v4 savedSubtitle:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(WFWorkflow *)self localizedSubtitle];
  }
  uint64_t v10 = v9;

  return (NSString *)v10;
}

- (void)setIcon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFWorkflow *)self record];
  id v6 = [v5 icon];
  id v10 = v4;
  id v7 = v6;
  if (v7 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v7)
  {

    goto LABEL_8;
  }
  char v8 = [v10 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    [(WFWorkflow *)self willChangeValueForKey:@"icon"];
    id v9 = [(WFWorkflow *)self record];
    [v9 setIcon:v10];

    [(WFWorkflow *)self didChangeValueForKey:@"icon"];
  }
LABEL_9:
}

- (WFWorkflowIcon)icon
{
  id v2 = [(WFWorkflow *)self record];
  char v3 = [v2 icon];

  return (WFWorkflowIcon *)v3;
}

- (NSString)legacyName
{
  id v2 = [(WFWorkflow *)self record];
  char v3 = [v2 legacyName];

  return (NSString *)v3;
}

- (BOOL)renameWorkflowTo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(WFWorkflow *)self name];
  char v8 = [v6 isEqualToString:v7];

  if (v8)
  {
LABEL_12:
    BOOL v10 = 1;
    goto LABEL_13;
  }
  if ([(WFWorkflow *)self storageState] == 2) {
    [(WFWorkflow *)self setUserProvidedName:1];
  }
  id v9 = [(WFWorkflow *)self reference];
  if (v9)
  {

    goto LABEL_8;
  }
  if ([(WFWorkflow *)self storageState] != 2)
  {
LABEL_8:
    uint64_t v11 = [(WFWorkflow *)self reference];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      __int16 v13 = [(WFWorkflow *)self database];

      if (v13)
      {
        id v14 = [(WFWorkflow *)self database];
        __int16 v15 = [(WFWorkflow *)self reference];
        id v16 = [v14 renameReference:v15 to:v6 error:a4];

        if (!v16)
        {
          BOOL v10 = 0;
          goto LABEL_13;
        }
      }
    }
    [(WFWorkflow *)self setName:v6];
    [(WFWorkflow *)self save];
    goto LABEL_12;
  }
  BOOL v10 = [(WFWorkflow *)self createReferenceIfNecessaryWithName:v6 nameCollisionBehavior:2 error:a4];
LABEL_13:

  return v10;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFWorkflow *)self record];
  id v6 = [v5 name];
  id v10 = v4;
  id v7 = v6;
  if (v7 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v7)
  {

    goto LABEL_8;
  }
  char v8 = [v10 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    [(WFWorkflow *)self willChangeValueForKey:@"name"];
    id v9 = [(WFWorkflow *)self record];
    [v9 setName:v10];

    [(WFWorkflow *)self didChangeValueForKey:@"name"];
  }
LABEL_9:
}

- (NSString)name
{
  id v2 = [(WFWorkflow *)self record];
  char v3 = [v2 name];

  return (NSString *)v3;
}

- (NSString)workflowID
{
  id v2 = [(WFWorkflow *)self reference];
  char v3 = [v2 identifier];

  return (NSString *)v3;
}

- (BOOL)hasStorageProvider
{
  id v2 = [(WFWorkflow *)self storageProvider];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSString)description
{
  BOOL v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(WFWorkflow *)self name];
  id v7 = [(WFWorkflow *)self actions];
  char v8 = [v3 stringWithFormat:@"<%@: %p, name: %@, actions: %lu>", v5, self, v6, objc_msgSend(v7, "count")];

  return (NSString *)v8;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = self->_actions;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v8 removeEventObserver:self];
        [v8 wasRemovedFromWorkflow:self];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  id v9 = [(WFWorkflow *)self database];
  id v10 = v9;
  if (v9) {
    [v9 removeObjectObserver:self];
  }

  v11.receiver = self;
  v11.super_class = (Class)WFWorkflow;
  [(WFWorkflow *)&v11 dealloc];
}

- (WFWorkflow)initWithRecord:(id)a3 reference:(id)a4 storageProvider:(id)a5 migrateIfNecessary:(BOOL)a6 environment:(int64_t)a7 error:(id *)a8
{
  BOOL v9 = a6;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v50 = a4;
  id v49 = a5;
  if (!v14)
  {
    long long v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"WFWorkflow.m", 156, @"Invalid parameter not satisfying: %@", @"record" object file lineNumber description];
  }
  long long v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v16 = [v15 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D020]];
  uint64_t v17 = [v14 minimumClientVersion];
  BOOL v18 = +[WFWorkflow checkClientVersion:v17 currentVersion:v16 error:a8];

  if (v18)
  {
    __int16 v19 = [v14 lastMigratedClientVersion];
    char v20 = WFCompareBundleVersions(v16, v19);
    uint64_t v21 = WFCompareBundleVersions(@"985", v19);
    if (!v19 || v21 == 2 || (BOOL v22 = (v20 & 1) == 0, [v19 isEqualToString:@"0"]))
    {
      [v14 setLastMigratedClientVersion:@"899"];
      BOOL v22 = 1;
    }
    if (v9 && v22)
    {
      long long v23 = getWFGeneralLogObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [v14 lastMigratedClientVersion];
        *(_DWORD *)buf = 136315650;
        long long v53 = "-[WFWorkflow initWithRecord:reference:storageProvider:migrateIfNecessary:environment:error:]";
        __int16 v54 = 2114;
        __int16 v55 = v24;
        __int16 v56 = 2114;
        __int16 v57 = v16;
        _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_DEFAULT, "%s Migrating workflow before opening, since it's last migrated version is %{public}@ and the current version is %{public}@", buf, 0x20u);
      }
      uint64_t v25 = getWFWorkflowLogObject();
      os_signpost_id_t v26 = os_signpost_id_generate(v25);

      id v27 = getWFWorkflowLogObject();
      os_signpost_id_t v28 = v27;
      os_signpost_id_t spid = v26;
      unint64_t v29 = v26 - 1;
      if (v29 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        uint64_t v30 = [v14 actions];
        uint64_t v31 = [v30 count];
        *(_DWORD *)buf = 134349056;
        long long v53 = (const char *)v31;
        _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v28, OS_SIGNPOST_INTERVAL_BEGIN, spid, "WorkflowMigration", " enableTelemetry=YES actionCount=%{public,signpost.telemetry:number1}lu", buf, 0xCu);
      }
      uint64_t v32 = [v14 fileRepresentation];
      if ([v32 migrateRootObject]) {
        [v14 loadFromStorage:v32];
      }
      uint64_t v33 = getWFWorkflowLogObject();
      long long v34 = v33;
      if (v29 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C7F0A000, v34, OS_SIGNPOST_INTERVAL_END, spid, "WorkflowMigration", " enableTelemetry=YES ", buf, 2u);
      }
    }
    v51.receiver = self;
    v51.super_class = (Class)WFWorkflow;
    self = [(WFWorkflow *)&v51 init];
    id v35 = v49;
    if (self)
    {
      long long v36 = (WFWorkflowRecord *)[v14 copy];
      record = self->_record;
      self->_record = v36;

      objc_storeStrong((id *)&self->_reference, a4);
      objc_storeStrong((id *)&self->_storageProvider, a5);
      self->_environment = a7;
      long long v38 = [WFDebouncer alloc];
      long long v39 = [(WFDebouncer *)v38 initWithDelay:MEMORY[0x1E4F14428] maximumDelay:0.5 queue:2.0];
      saveDebouncer = self->_saveDebouncer;
      self->_saveDebouncer = v39;

      [(WFDebouncer *)self->_saveDebouncer addTarget:self action:sel_saveFromDebouncer_];
      self->_userProvidedName = 0;
      self->_storageState = v49 == 0;
      [(WFWorkflow *)self loadFromRecord];
      long long v41 = [(WFWorkflow *)self database];
      long long v42 = v41;
      if (v41) {
        [v41 addObjectObserver:self];
      }
      long long v43 = self;
    }
    id v44 = self;
  }
  else
  {
    id v44 = 0;
    id v35 = v49;
  }

  return v44;
}

- (WFWorkflow)initWithRecord:(id)a3 reference:(id)a4 storageProvider:(id)a5 error:(id *)a6
{
  return [(WFWorkflow *)self initWithRecord:a3 reference:a4 storageProvider:a5 migrateIfNecessary:1 environment:0 error:a6];
}

- (WFWorkflow)initWithCreationOptions:(id)a3 database:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  objc_super v11 = [[WFDatabaseWorkflowStorage alloc] initWithDatabase:v10];
  long long v12 = objc_alloc_init(WFWorkflowRecord);
  long long v13 = [(WFWorkflow *)self initWithRecord:v12 reference:0 storageProvider:v11 error:a5];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_creationOptions, a3);
    v13->_storageState = 2;
    id v14 = +[WFWorkflow defaultName];
    long long v15 = [v10 suggestedWorkflowNameForName:v14];
    id v16 = [(WFWorkflow *)v13 record];
    [v16 setName:v15];

    uint64_t v17 = v13;
  }

  return v13;
}

- (WFWorkflow)init
{
  BOOL v3 = objc_alloc_init(WFWorkflowRecord);
  uint64_t v4 = [(WFWorkflow *)self initWithRecord:v3 reference:0 storageProvider:0 error:0];

  return v4;
}

+ (BOOL)checkClientVersion:(id)a3 currentVersion:(id)a4 error:(id *)a5
{
  v18[4] = *MEMORY[0x1E4F143B8];
  char v7 = WFCompareBundleVersions(a3, a4);
  char v8 = v7;
  if (a5 && (v7 & 1) == 0)
  {
    v17[0] = *MEMORY[0x1E4F28588];
    id v9 = WFLocalizedString(@"Shortcut Format Too New");
    v18[0] = v9;
    v17[1] = *MEMORY[0x1E4F28568];
    id v10 = WFLocalizedString(@"This shortcut cannot be opened because it was created on a newer version of the Shortcuts app.");
    v18[1] = v10;
    v17[2] = *MEMORY[0x1E4F28590];
    objc_super v11 = WFLocalizedString(@"Update Shortcuts");
    v16[0] = v11;
    long long v12 = WFLocalizedString(@"OK");
    v16[1] = v12;
    long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    v17[3] = *MEMORY[0x1E4F288B8];
    v18[2] = v13;
    v18[3] = a1;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFWorkflowErrorDomain" code:2 userInfo:v14];
  }
  return v8 & 1;
}

+ (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  if (!a4)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F5A7A0], "sharedContext", a3);
    uint64_t v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=SOFTWARE_UPDATE_LINK"];
    [v4 openURL:v5 withBundleIdentifier:@"com.apple.Preferences" userInterface:0 completionHandler:0];
  }
  return 1;
}

+ (id)effectiveInputClassesFromInputClasses:(id)a3 workflowTypes:(id)a4
{
  id v5 = a3;
  char v6 = WFWorkflowTypesContainsInputType(a4);
  char v7 = v5;
  if ((v6 & 1) == 0)
  {
    char v8 = +[WFWorkflow supportedInputClasses];
    char v7 = [v8 array];
  }
  id v9 = (void *)[v7 mutableCopy];
  if ([v9 containsObject:objc_opt_class()])
  {
    uint64_t v10 = objc_opt_class();
    objc_msgSend(v9, "insertObject:atIndex:", v10, objc_msgSend(v9, "indexOfObject:", objc_opt_class()));
  }
  if ([v9 containsObject:objc_opt_class()])
  {
    uint64_t v11 = objc_opt_class();
    objc_msgSend(v9, "insertObject:atIndex:", v11, objc_msgSend(v9, "indexOfObject:", objc_opt_class()));
  }

  return v9;
}

+ (id)defaultName
{
  return WFLocalizedString(@"New Shortcut");
}

+ (id)supportedInputClassNames
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithObjects:", @"WFAppContentItem", @"WFAppStoreAppContentItem", @"WFArticleContentItem", @"WFContactContentItem", @"WFDateContentItem", @"WFEmailAddressContentItem", @"WFFolderContentItem", @"WFGenericFileContentItem", @"WFImageContentItem", @"WFiTunesProductContentItem", @"WFLocationContentItem", @"WFDCMapsLinkContentItem", @"WFAVAssetContentItem", @"WFPDFContentItem", @"WFPhoneNumberContentItem", @"WFRichTextContentItem", @"WFSafariWebPageContentItem",
               @"WFStringContentItem",
               @"WFURLContentItem",
               0);
}

+ (id)supportedInputClasses
{
  id v2 = [a1 supportedInputClassNames];
  BOOL v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_268);

  return v3;
}

Class __35__WFWorkflow_supportedInputClasses__block_invoke(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

+ (WFWorkflow)workflowWithReference:(id)a3 database:(id)a4 migrateIfNecessary:(BOOL)a5 environment:(int64_t)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  long long v13 = [v12 recordWithDescriptor:v11 error:a7];
  uint64_t v14 = objc_opt_class();
  id v15 = v13;
  if (v15 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v17 = getWFGeneralLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      int v22 = 136315906;
      long long v23 = "WFEnforceClass";
      __int16 v24 = 2114;
      id v25 = v15;
      __int16 v26 = 2114;
      id v27 = (id)objc_opt_class();
      __int16 v28 = 2114;
      uint64_t v29 = v14;
      id v18 = v27;
      _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v22, 0x2Au);
    }
    id v16 = 0;
  }
  else
  {
    id v16 = v15;
  }

  if (v16)
  {
    __int16 v19 = [[WFDatabaseWorkflowStorage alloc] initWithDatabase:v12];
    char v20 = [[WFWorkflow alloc] initWithRecord:v16 reference:v11 storageProvider:v19 migrateIfNecessary:v9 environment:a6 error:a7];
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

+ (WFWorkflow)workflowWithReference:(id)a3 database:(id)a4 error:(id *)a5
{
  return (WFWorkflow *)[a1 workflowWithReference:a3 database:a4 migrateIfNecessary:1 environment:0 error:a5];
}

- (id)createUserActivityForViewing
{
  BOOL v3 = objc_opt_new();
  uint64_t v4 = [(WFWorkflow *)self workflowID];
  [v3 setObject:v4 forKeyedSubscript:@"workflowID"];

  id v5 = [(WFWorkflow *)self name];
  [v3 setObject:v5 forKeyedSubscript:@"workflowName"];

  char v6 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"is.workflow.my.app.viewworkflow"];
  char v7 = [(WFWorkflow *)self name];
  [v6 setTitle:v7];

  [v6 setUserInfo:v3];
  char v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"workflowID", @"workflowName", 0);
  [v6 setRequiredUserInfoKeys:v8];

  [v6 setEligibleForHandoff:0];
  [v6 setEligibleForSearch:0];

  return v6;
}

- (BOOL)isResidentCompatible
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(WFWorkflow *)self actions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        char v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (![v7 isResidentCompatible]
          || ([v7 containsVariableOfType:@"Ask"] & 1) != 0)
        {
          BOOL v8 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      BOOL v8 = 1;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v8 = 1;
  }
LABEL_13:

  return v8;
}

- (void)requestToRunScriptsOnDomain:(id)a3 withUserInterface:(id)a4 database:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (void (**)(id, uint64_t))a6;
  if (!v14)
  {
    uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"WFWorkflow+TrustedDomains.m", 18, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  uint64_t v15 = [(WFWorkflow *)self reference];
  if (v15)
  {
    if ([v13 isReference:v15 allowedToRunOnDomain:v11])
    {
      v14[2](v14, 1);
    }
    else
    {
      id v16 = [MEMORY[0x1E4F5A768] alertWithPreferredStyle:0];
      uint64_t v17 = [(WFWorkflow *)self name];
      id v18 = [v11 lowercaseString];
      uint64_t v32 = v12;
      __int16 v19 = NSString;
      char v20 = WFLocalizedString(@"Do you want to give “%1$@” access to “%2$@”?");
      uint64_t v21 = objc_msgSend(v19, "localizedStringWithFormat:", v20, v17, v18);
      [v16 setTitle:v21];

      int v22 = NSString;
      long long v23 = WFLocalizedString(@"Whenever you run this shortcut, “%1$@” will be able to interact with the current web page, including reading sensitive information such as passwords, phone numbers, and credit cards.");
      __int16 v24 = objc_msgSend(v22, "localizedStringWithFormat:", v23, v17, v18);
      [v16 setMessage:v24];

      id v25 = (void *)MEMORY[0x1E4F5A770];
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __103__WFWorkflow_TrustedDomains__requestToRunScriptsOnDomain_withUserInterface_database_completionHandler___block_invoke;
      void v38[3] = &unk_1E6558678;
      __int16 v26 = v14;
      long long v39 = v26;
      id v27 = [v25 cancelButtonWithHandler:v38];
      [v16 addButton:v27];

      __int16 v28 = (void *)MEMORY[0x1E4F5A770];
      uint64_t v29 = WFLocalizedString(@"Allow");
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __103__WFWorkflow_TrustedDomains__requestToRunScriptsOnDomain_withUserInterface_database_completionHandler___block_invoke_2;
      v33[3] = &unk_1E65586A0;
      id v34 = v13;
      id v35 = v15;
      id v36 = v11;
      long long v37 = v26;
      uint64_t v30 = [v28 buttonWithTitle:v29 style:0 preferred:1 handler:v33];
      [v16 addButton:v30];

      id v12 = v32;
      [v32 presentAlert:v16];
    }
  }
  else
  {
    v14[2](v14, 0);
  }
}

uint64_t __103__WFWorkflow_TrustedDomains__requestToRunScriptsOnDomain_withUserInterface_database_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __103__WFWorkflow_TrustedDomains__requestToRunScriptsOnDomain_withUserInterface_database_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setTrustedToRunScripts:1 forReference:*(void *)(a1 + 40) onDomain:*(void *)(a1 + 48)];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v2();
}

@end