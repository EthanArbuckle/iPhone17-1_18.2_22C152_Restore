@interface VCVoiceShortcutManagerAccessWrapper
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (VCAccessSpecifier)accessSpecifier;
- (VCCKShortcutSyncCoordinator)syncCoordinator;
- (VCSyncDataEndpoint)syncDataEndpoint;
- (VCVoiceShortcutManager)voiceShortcutManager;
- (VCVoiceShortcutManagerAccessWrapper)initWithVoiceShortcutManager:(id)a3 triggerRegistrar:(id)a4 accessSpecifier:(id)a5 syncCoordinator:(id)a6 syncDataEndpoint:(id)a7 runCoordinator:(id)a8 auditToken:(id *)a9;
- (WFSandboxExtensionManager)sandboxExtensionManager;
- (WFShareSheetWorkflowProvider)shareSheetProvider;
- (WFTriggerRegistrar)triggerRegistrar;
- (WFWorkflowRunCoordinator)runCoordinator;
- (id)database;
- (id)linkActionWithStaccatoIdentifier:(id)a3;
- (id)unsupportedRequestErrorWithMessage:(id)a3;
- (void)addVoiceShortcut:(id)a3 phrase:(id)a4 completion:(id)a5;
- (void)approvalResultForContentAttributionSet:(id)a3 contentDestination:(id)a4 actionUUID:(id)a5 actionIdentifier:(id)a6 actionIndex:(unint64_t)a7 reference:(id)a8 allowedOnceStates:(id)a9 completion:(id)a10;
- (void)archiveAction:(id)a3 withActionMetadata:(id)a4 completion:(id)a5;
- (void)checkTriggerStateWithIdentifier:(id)a3 completion:(id)a4;
- (void)checkTriggerStateWithKeyPath:(id)a3 completion:(id)a4;
- (void)computeFinderResizedSizesForImages:(id)a3 inSizes:(id)a4 completion:(id)a5;
- (void)configuredStaccatoActionFromTemplate:(id)a3 valuesByParameterKey:(id)a4 completion:(id)a5;
- (void)createBookmarkWithBookmarkableString:(id)a3 path:(id)a4 workflowID:(id)a5 completion:(id)a6;
- (void)createBookmarkWithURL:(id)a3 workflowID:(id)a4 completion:(id)a5;
- (void)createShortcutWithRecordData:(id)a3 name:(id)a4 shortcutSource:(id)a5 completion:(id)a6;
- (void)createWorkflowWithWorkflowData:(id)a3 name:(id)a4 nameCollisionBehavior:(unint64_t)a5 completion:(id)a6;
- (void)currentDeletionAuthorizationStatusWithContentItemClassName:(id)a3 actionUUID:(id)a4 actionIdentifier:(id)a5 actionIndex:(unint64_t)a6 count:(unint64_t)a7 reference:(id)a8 completion:(id)a9;
- (void)defaultStaccatoActionWithCompletion:(id)a3;
- (void)deleteTriggerWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteVoiceShortcutWithIdentifier:(id)a3 name:(id)a4 completion:(id)a5;
- (void)describeSyncStateIncludingDeleted:(BOOL)a3 completion:(id)a4;
- (void)dismissToastedSessionKitSessionsWithReason:(id)a3 completion:(id)a4;
- (void)drawGlyphs:(id)a3 withBackgroundColorValues:(id)a4 padding:(double)a5 intoContext:(id)a6 completion:(id)a7;
- (void)drawGlyphs:(id)a3 withBackgroundColorValues:(id)a4 padding:(double)a5 rounded:(BOOL)a6 intoContext:(id)a7 completion:(id)a8;
- (void)fetchAllValueSectionsForStaccatoParameter:(id)a3 completion:(id)a4;
- (void)fetchAvailableStaccatoActions:(id)a3;
- (void)fetchURLForFPItem:(id)a3 completion:(id)a4;
- (void)fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)generateSingleUseTokenForWorkflowIdentifier:(id)a3 completion:(id)a4;
- (void)getCollectionWithIdentifier:(id)a3 completion:(id)a4;
- (void)getConfiguredTriggerDescriptionsWithCompletion:(id)a3;
- (void)getConfiguredTriggersForWorkflowID:(id)a3 completion:(id)a4;
- (void)getFavoriteContactsWithLimit:(int64_t)a3 completion:(id)a4;
- (void)getFirstUnsortedWorkflowWithCompletion:(id)a3;
- (void)getFolderForWorkflowReference:(id)a3 completion:(id)a4;
- (void)getIsReference:(id)a3 allowedToRunOnDomain:(id)a4 completion:(id)a5;
- (void)getLinkActionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 expandingParameterName:(id)a5 limit:(int64_t)a6 completion:(id)a7;
- (void)getLinkActionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 serializedParameterStates:(id)a5 completion:(id)a6;
- (void)getMigratedAppIntentWithINIntent:(id)a3 completion:(id)a4;
- (void)getNumberOfVoiceShortcutsWithCompletion:(id)a3;
- (void)getOnScreenContentWithOptions:(id)a3 completion:(id)a4;
- (void)getOnScreenContentWithOptions:(id)a3 completionHandler:(id)a4;
- (void)getRecentsCallWithTelephony:(BOOL)a3 limit:(int64_t)a4 completion:(id)a5;
- (void)getReferenceForWorkflowID:(id)a3 completion:(id)a4;
- (void)getResultsForQuery:(id)a3 resultClassName:(id)a4 completion:(id)a5;
- (void)getSerializedParametersForLinkAction:(id)a3 actionMetadata:(id)a4 completion:(id)a5;
- (void)getShareSheetWorkflowsForExtensionMatchingDictionaries:(id)a3 hostBundleIdentifier:(id)a4 completion:(id)a5;
- (void)getShortcutSuggestionsForAllAppsWithLimit:(unint64_t)a3 completion:(id)a4;
- (void)getShortcutSuggestionsForAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)getSiriAutoShortcutsEnablementForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)getSiriPodcastsDatabaseURLWithCompletion:(id)a3;
- (void)getSortedVisibleFoldersWithCompletion:(id)a3;
- (void)getSortedVisibleWorkflowsByNameWithCompletion:(id)a3;
- (void)getSortedVisibleWorkflowsInCollection:(id)a3 completion:(id)a4;
- (void)getSortedWorkflowsWithQuery:(id)a3 completion:(id)a4;
- (void)getStingWorkflowWithIdentifier:(id)a3 completion:(id)a4;
- (void)getStingWorkflowsWithCompletion:(id)a3;
- (void)getSuggestedShortcutsWithLimit:(int64_t)a3 completion:(id)a4;
- (void)getUniqueVisibleReferenceForWorkflowName:(id)a3 completion:(id)a4;
- (void)getUpcomingMediaForBundleIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5;
- (void)getValueForDescriptor:(id)a3 resultClassName:(id)a4 completion:(id)a5;
- (void)getVaultItemsAccessForBackgroundRunner:(id)a3;
- (void)getVoiceShortcutWithIdentifier:(id)a3 completion:(id)a4;
- (void)getVoiceShortcutWithPhrase:(id)a3 completion:(id)a4;
- (void)getVoiceShortcutsForAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)getVoiceShortcutsWithCompletion:(id)a3;
- (void)getWorkflowRecordDataForDescriptor:(id)a3 completion:(id)a4;
- (void)loadDataWithItemProviderRequestMetadata:(id)a3 type:(id)a4 completion:(id)a5;
- (void)loadFileURLWithItemProviderRequestMetadata:(id)a3 type:(id)a4 openInPlace:(BOOL)a5 completion:(id)a6;
- (void)logRunOfWorkflow:(id)a3 withSource:(id)a4 triggerID:(id)a5 completion:(id)a6;
- (void)obliterateShortcuts:(id)a3;
- (void)postNotificationAboutFailure:(id)a3 inWorkflow:(id)a4 dialogAttribution:(id)a5 runningContext:(id)a6;
- (void)postNotificationWithRequest:(id)a3 presentationMode:(unint64_t)a4 runningContext:(id)a5;
- (void)quarantineWorkflowWithReference:(id)a3;
- (void)refreshTriggerWithIdentifier:(id)a3 completion:(id)a4;
- (void)removeAllSerializedParametersForQueryName:(id)a3 completion:(id)a4;
- (void)requestDataMigration:(id)a3;
- (void)requestSandboxExtensionForAccessResources:(id)a3 completion:(id)a4;
- (void)requestSandboxExtensionForToolKitIndexingWithCompletion:(id)a3;
- (void)resetAutomationConfirmationStatusWithCompletion:(id)a3;
- (void)resolveBookmarkData:(id)a3 completion:(id)a4;
- (void)resolveCrossDeviceItemID:(id)a3 completion:(id)a4;
- (void)resolveFilePath:(id)a3 workflowID:(id)a4 completion:(id)a5;
- (void)saveOutputActionSmartPromtDataForWorkflowReference:(id)a3 completion:(id)a4;
- (void)saveSmartPromptStateData:(id)a3 actionUUID:(id)a4 reference:(id)a5 completion:(id)a6;
- (void)sendAceCommandDictionary:(id)a3 completion:(id)a4;
- (void)serializedParametersForAppEntityIdentifier:(id)a3 completion:(id)a4;
- (void)setAuditToken:(id *)a3;
- (void)setInteger:(int64_t)a3 forKey:(id)a4 inDomain:(id)a5 completionHandler:(id)a6;
- (void)setOutcome:(int64_t)a3 forRunEvent:(id)a4;
- (void)setPerWorkflowStateData:(id)a3 forSmartPromptWithActionUUID:(id)a4 reference:(id)a5 completion:(id)a6;
- (void)setShortcutSuggestions:(id)a3 forAppWithBundleIdentifier:(id)a4;
- (void)setSiriAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 completion:(id)a5;
- (void)setTrustedToRunScripts:(BOOL)a3 forReference:(id)a4 onDomain:(id)a5 completion:(id)a6;
- (void)showSingleStepCompletionForWebClip:(id)a3 completion:(id)a4;
- (void)storeQuarantineHashForWorkflowWithReference:(id)a3 quarantineHash:(id)a4;
- (void)storeSerializedParameters:(id)a3 forAppEntityIdentifier:(id)a4 queryName:(id)a5 badgeType:(unint64_t)a6 completion:(id)a7;
- (void)toastSessionKitSessionWithIdentifier:(id)a3 forDuration:(id)a4 completion:(id)a5;
- (void)triggerFullContextualActionReindexWithCompletion:(id)a3;
- (void)unarchiveActionFromData:(id)a3 withActionMetadata:(id)a4 completion:(id)a5;
- (void)unregisterTriggerWithIdentifier:(id)a3 triggerBacking:(int64_t)a4 completion:(id)a5;
- (void)updateAppDescriptor:(id)a3 atKey:(id)a4 actionUUID:(id)a5 actionIndex:(id)a6 actionIdentifier:(id)a7 workflowID:(id)a8;
- (void)updateAppShortcutsWithCompletion:(id)a3;
- (void)updateVoiceShortcutWithIdentifier:(id)a3 phrase:(id)a4 shortcut:(id)a5 completion:(id)a6;
- (void)userHasAutomationsWithCompletion:(id)a3;
@end

@implementation VCVoiceShortcutManagerAccessWrapper

id __92__VCVoiceShortcutManagerAccessWrapper_fetchAllValueSectionsForStaccatoParameter_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4FB4998];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithSection:v4 action:*(void *)(a1 + 32) parameter:*(void *)(a1 + 40)];

  return v5;
}

- (void)fetchAvailableStaccatoActions:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v17 = (void (**)(id, void *, void))a3;
  id v4 = WFSystemStaccatoActionIdentifiersBySection();
  v19 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    uint64_t v18 = *MEMORY[0x1E4FB4AB0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v10 isEqualToString:@"Camera"])
        {
          v11 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v18 allowPlaceholder:0 error:0];

          if (!v11) {
            continue;
          }
        }
        v12 = [v5 objectForKeyedSubscript:v10];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __69__VCVoiceShortcutManagerAccessWrapper_fetchAvailableStaccatoActions___block_invoke;
        v20[3] = &unk_1E6541228;
        v20[4] = self;
        v20[5] = v10;
        v13 = objc_msgSend(v12, "if_compactMap:", v20);
        [v19 setObject:v13 forKeyedSubscript:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v7);
  }

  v14 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v19 count];
    *(_DWORD *)buf = 136315394;
    v26 = "-[VCVoiceShortcutManagerAccessWrapper fetchAvailableStaccatoActions:]";
    __int16 v27 = 2048;
    uint64_t v28 = v15;
    _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_DEFAULT, "%s Returning %ld available staccato sections.", buf, 0x16u);
  }

  v16 = (void *)[v19 copy];
  v17[2](v17, v16, 0);
}

- (void)fetchAllValueSectionsForStaccatoParameter:(id)a3 completion:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 actionIdentifier];
  v9 = [(VCVoiceShortcutManagerAccessWrapper *)self linkActionWithStaccatoIdentifier:v8];

  v10 = [v6 key];
  v11 = [v9 parameterForKey:v10];

  id v12 = v11;
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v13 = v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __92__VCVoiceShortcutManagerAccessWrapper_fetchAllValueSectionsForStaccatoParameter_completion___block_invoke;
    aBlock[3] = &unk_1E6541278;
    id v16 = v9;
    id v33 = v16;
    id v27 = v13;
    id v34 = v27;
    id v17 = v6;
    id v35 = v17;
    id v18 = v7;
    id v36 = v18;
    v19 = _Block_copy(aBlock);
    v20 = getWFStaccatoLogObject();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v21)
      {
        *(_DWORD *)buf = 136315650;
        v38 = "-[VCVoiceShortcutManagerAccessWrapper fetchAllValueSectionsForStaccatoParameter:completion:]";
        __int16 v39 = 2112;
        id v40 = v17;
        __int16 v41 = 2112;
        id v42 = v16;
        _os_log_impl(&dword_1C7D7E000, v20, OS_LOG_TYPE_DEFAULT, "%s Fetching dynamic values for parameter: %@ in action: %@", buf, 0x20u);
      }

      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __92__VCVoiceShortcutManagerAccessWrapper_fetchAllValueSectionsForStaccatoParameter_completion___block_invoke_350;
      v28[3] = &unk_1E65412A0;
      id v29 = v15;
      id v30 = v18;
      id v31 = v19;
      [v29 loadPossibleStatesWithCompletionHandler:v28];

      id v22 = v29;
      long long v23 = v27;
    }
    else
    {
      if (v21)
      {
        *(_DWORD *)buf = 136315650;
        v38 = "-[VCVoiceShortcutManagerAccessWrapper fetchAllValueSectionsForStaccatoParameter:completion:]";
        __int16 v39 = 2112;
        id v40 = v17;
        __int16 v41 = 2112;
        id v42 = v16;
        _os_log_impl(&dword_1C7D7E000, v20, OS_LOG_TYPE_DEFAULT, "%s Fetching static values for parameter: %@ in action: %@", buf, 0x20u);
      }

      id v25 = objc_alloc(MEMORY[0x1E4F30570]);
      long long v23 = v27;
      v26 = [v27 possibleStates];
      id v22 = (id)[v25 initWithItems:v26];

      (*((void (**)(void *, id))v19 + 2))(v19, v22);
      id v15 = 0;
    }
  }
  else
  {

    long long v24 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v38 = "-[VCVoiceShortcutManagerAccessWrapper fetchAllValueSectionsForStaccatoParameter:completion:]";
      __int16 v39 = 2112;
      id v40 = v6;
      __int16 v41 = 2112;
      id v42 = v12;
      _os_log_impl(&dword_1C7D7E000, v24, OS_LOG_TYPE_ERROR, "%s Invalid parameter provided: %@ - %@.", buf, 0x20u);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x1E4F1CBF0], 0);
  }
}

id __69__VCVoiceShortcutManagerAccessWrapper_fetchAvailableStaccatoActions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) linkActionWithStaccatoIdentifier:v3];
  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB4980]) initWithIdentifier:v3 sectionIdentifier:*(void *)(a1 + 40) linkAction:v4];
    id v6 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      v9 = "-[VCVoiceShortcutManagerAccessWrapper fetchAvailableStaccatoActions:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v3;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_DEFAULT, "%s Found link action matching staccato identifier: %@ - %@", (uint8_t *)&v8, 0x20u);
    }
  }
  else
  {
    id v6 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      v9 = "-[VCVoiceShortcutManagerAccessWrapper fetchAvailableStaccatoActions:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_ERROR, "%s Link action for %@ not found.", (uint8_t *)&v8, 0x16u);
    }
    id v5 = 0;
  }

  return v5;
}

- (id)linkActionWithStaccatoIdentifier:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4FB70C8];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = (void *)[v5 initWithActionIdentifier:v4 serializedParameters:MEMORY[0x1E4F1CC08]];

  id v7 = [MEMORY[0x1E4FB7240] sharedProvider];
  v13[0] = v6;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [v7 createActionsForRequests:v8];

  v9 = [v6 result];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v10 = v9;
    }
    else {
      __int16 v10 = 0;
    }
  }
  else
  {
    __int16 v10 = 0;
  }
  id v11 = v10;

  return v11;
}

void __92__VCVoiceShortcutManagerAccessWrapper_fetchAllValueSectionsForStaccatoParameter_completion___block_invoke_350(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 136315394;
      v9 = "-[VCVoiceShortcutManagerAccessWrapper fetchAllValueSectionsForStaccatoParameter:completion:]_block_invoke";
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_ERROR, "%s Failed to load possible states for parameter: %@", (uint8_t *)&v8, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) possibleStatesCollection];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
}

void __92__VCVoiceShortcutManagerAccessWrapper_fetchAllValueSectionsForStaccatoParameter_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 sections];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__VCVoiceShortcutManagerAccessWrapper_fetchAllValueSectionsForStaccatoParameter_completion___block_invoke_2;
  v8[3] = &unk_1E6541250;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v4 = objc_msgSend(v3, "if_map:", v8);

  uint64_t v5 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    uint64_t v12 = "-[VCVoiceShortcutManagerAccessWrapper fetchAllValueSectionsForStaccatoParameter:completion:]_block_invoke";
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Returning: %@ values for parameter %@.", buf, 0x20u);
  }

  (*(void (**)(void, void *, void, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v4, 0, v7);
}

- (VCVoiceShortcutManagerAccessWrapper)initWithVoiceShortcutManager:(id)a3 triggerRegistrar:(id)a4 accessSpecifier:(id)a5 syncCoordinator:(id)a6 syncDataEndpoint:(id)a7 runCoordinator:(id)a8 auditToken:(id *)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id obj = a6;
  id v19 = a6;
  id v40 = a7;
  id v20 = a7;
  id v21 = a8;
  if (v16)
  {
    if (v18) {
      goto LABEL_3;
    }
LABEL_10:
    id v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"VCVoiceShortcutManagerAccessWrapper.m", 103, @"Invalid parameter not satisfying: %@", @"accessSpecifier" object file lineNumber description];

    if (v21) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  id v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"VCVoiceShortcutManagerAccessWrapper.m", 102, @"Invalid parameter not satisfying: %@", @"voiceShortcutManager" object file lineNumber description];

  if (!v18) {
    goto LABEL_10;
  }
LABEL_3:
  if (v21) {
    goto LABEL_4;
  }
LABEL_11:
  id v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, self, @"VCVoiceShortcutManagerAccessWrapper.m", 104, @"Invalid parameter not satisfying: %@", @"runCoordinator" object file lineNumber description];

LABEL_4:
  if (([v18 allowConnection] & 1) == 0)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2 object:self file:@"VCVoiceShortcutManagerAccessWrapper.m" lineNumber:105 description:@"Cannot build access wrapper exported object when connection is not allowed"];
  }
  v41.receiver = self;
  v41.super_class = (Class)VCVoiceShortcutManagerAccessWrapper;
  id v22 = [(VCVoiceShortcutManagerAccessWrapper *)&v41 init];
  if (v22)
  {
    uint64_t v23 = [v18 copy];
    long long v24 = (void *)*((void *)v22 + 1);
    *((void *)v22 + 1) = v23;

    objc_storeStrong((id *)v22 + 2, a3);
    objc_storeStrong((id *)v22 + 3, a4);
    objc_storeStrong((id *)v22 + 6, obj);
    objc_storeStrong((id *)v22 + 5, v40);
    objc_storeStrong((id *)v22 + 7, a8);
    id v25 = [WFShareSheetWorkflowProvider alloc];
    v26 = [v16 databaseProvider];
    uint64_t v27 = [(WFShareSheetWorkflowProvider *)v25 initWithDatabaseProvider:v26];
    uint64_t v28 = (void *)*((void *)v22 + 4);
    *((void *)v22 + 4) = v27;

    long long v29 = *(_OWORD *)a9->var0;
    *(_OWORD *)(v22 + 88) = *(_OWORD *)&a9->var0[4];
    *(_OWORD *)(v22 + 72) = v29;
    id v30 = objc_alloc_init(MEMORY[0x1E4FB4870]);
    id v31 = (void *)*((void *)v22 + 8);
    *((void *)v22 + 8) = v30;

    v32 = v22;
  }

  return (VCVoiceShortcutManagerAccessWrapper *)v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandboxExtensionManager, 0);
  objc_storeStrong((id *)&self->_runCoordinator, 0);
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_syncDataEndpoint, 0);
  objc_storeStrong((id *)&self->_shareSheetProvider, 0);
  objc_storeStrong((id *)&self->_triggerRegistrar, 0);
  objc_storeStrong((id *)&self->_voiceShortcutManager, 0);
  objc_storeStrong((id *)&self->_accessSpecifier, 0);
}

- (void)setAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = v3;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[2].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (WFSandboxExtensionManager)sandboxExtensionManager
{
  return self->_sandboxExtensionManager;
}

- (WFWorkflowRunCoordinator)runCoordinator
{
  return self->_runCoordinator;
}

- (VCCKShortcutSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

- (VCSyncDataEndpoint)syncDataEndpoint
{
  return self->_syncDataEndpoint;
}

- (WFShareSheetWorkflowProvider)shareSheetProvider
{
  return self->_shareSheetProvider;
}

- (WFTriggerRegistrar)triggerRegistrar
{
  return self->_triggerRegistrar;
}

- (VCVoiceShortcutManager)voiceShortcutManager
{
  return self->_voiceShortcutManager;
}

- (VCAccessSpecifier)accessSpecifier
{
  return self->_accessSpecifier;
}

- (void)defaultStaccatoActionWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v3 = (void (**)(id, void *, void))a3;
  id v4 = +[WFConfiguredSystemActionProvider sharedProvider];
  uint64_t v5 = [v4 defaultSystemActionForActionType:*MEMORY[0x1E4FB4DE0]];
  uint64_t v6 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[VCVoiceShortcutManagerAccessWrapper defaultStaccatoActionWithCompletion:]";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_DEFAULT, "%s Returning default action: %@", (uint8_t *)&v9, 0x16u);
  }

  if (v5)
  {
    v3[2](v3, v5, 0);
  }
  else
  {
    uint64_t v7 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      id v10 = "-[VCVoiceShortcutManagerAccessWrapper defaultStaccatoActionWithCompletion:]";
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_ERROR, "%s Unable to find default action for action button.", (uint8_t *)&v9, 0xCu);
    }

    int v8 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1002, @"Unable to construct the default action");
    ((void (**)(id, void *, void *))v3)[2](v3, 0, v8);
  }
}

- (void)configuredStaccatoActionFromTemplate:(id)a3 valuesByParameterKey:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = (void (**)(id, void *, void))a5;
  id v10 = +[WFConfiguredSystemActionProvider sharedProvider];
  id v15 = 0;
  __int16 v11 = [v10 configuredStaccatoActionFromTemplate:v7 valuesByParameterKey:v8 error:&v15];
  id v12 = v15;
  uint64_t v13 = getWFStaccatoLogObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    id v17 = "-[VCVoiceShortcutManagerAccessWrapper configuredStaccatoActionFromTemplate:valuesByParameterKey:completion:]";
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    uint64_t v23 = v11;
    _os_log_impl(&dword_1C7D7E000, v13, OS_LOG_TYPE_DEFAULT, "%s Configured action for template: %@ with parameters: %@ -> %@", buf, 0x2Au);
  }

  if (v11)
  {
    v9[2](v9, v11, 0);
  }
  else
  {
    uint64_t v14 = getWFStaccatoLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v17 = "-[VCVoiceShortcutManagerAccessWrapper configuredStaccatoActionFromTemplate:valuesByParameterKey:completion:]";
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_ERROR, "%s Failed to construct configured action with template: %@.", buf, 0x16u);
    }

    ((void (**)(id, void *, id))v9)[2](v9, 0, v12);
  }
}

- (id)unsupportedRequestErrorWithMessage:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  long long v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4FB4C38];
  uint64_t v10 = *MEMORY[0x1E4F28568];
  v11[0] = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
  id v6 = a3;
  id v7 = [v5 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [v3 errorWithDomain:v4 code:11006 userInfo:v7];

  return v8;
}

- (void)loadDataWithItemProviderRequestMetadata:(id)a3 type:(id)a4 completion:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v33 = "-[VCVoiceShortcutManagerAccessWrapper loadDataWithItemProviderRequestMetadata:type:completion:]";
    __int16 v34 = 2112;
    id v35 = v8;
    __int16 v36 = 2112;
    id v37 = v9;
    _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEFAULT, "%s Loading data representation with metadata: %@ type: %@", buf, 0x20u);
  }

  id v12 = v8;
  if (v12 && (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), v12, (isKindOfClass & 1) != 0))
  {
    id v14 = v12;
    id v15 = (void *)MEMORY[0x1E4F72BC0];
    id v16 = [v14 metadata];
    id v17 = [v15 policyWithEntityMetadata:v16];

    id v30 = 0;
    __int16 v18 = [v17 connectionWithError:&v30];
    id v19 = v30;
    if (v18)
    {
      v26 = (void *)[objc_alloc(MEMORY[0x1E4F72BE8]) initWithContentType:v9];
      __int16 v20 = (void *)[objc_alloc(MEMORY[0x1E4F72C80]) initWithContentType:v26 preferredExtractionType:1];
      id v21 = [v14 entity];
      id v31 = v21;
      [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      __int16 v22 = v27 = v19;
      [v14 metadata];
      v24 = uint64_t v23 = v17;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __95__VCVoiceShortcutManagerAccessWrapper_loadDataWithItemProviderRequestMetadata_type_completion___block_invoke;
      v28[3] = &unk_1E6541200;
      id v29 = v10;
      [v18 exportEntities:v22 metadata:v24 withConfiguration:v20 completionHandler:v28];

      id v17 = v23;
      id v19 = v27;
    }
    else
    {
      id v25 = getWFGeneralLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v33 = "-[VCVoiceShortcutManagerAccessWrapper loadDataWithItemProviderRequestMetadata:type:completion:]";
        __int16 v34 = 2112;
        id v35 = v19;
        _os_log_impl(&dword_1C7D7E000, v25, OS_LOG_TYPE_ERROR, "%s Unable to create connection: %@", buf, 0x16u);
      }

      (*((void (**)(id, void, id))v10 + 2))(v10, 0, v19);
    }
  }
  else
  {
    id v14 = [(VCVoiceShortcutManagerAccessWrapper *)self unsupportedRequestErrorWithMessage:@"Unsupported item provider load request."];
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v14);
  }
}

void __95__VCVoiceShortcutManagerAccessWrapper_loadDataWithItemProviderRequestMetadata_type_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v10 = [a2 value];
    long long v3 = [v10 firstObject];
    uint64_t v4 = [v3 exportedContent];

    uint64_t v5 = [v4 content];
    id v6 = objc_msgSend(v5, "wf_fileRepresentation");

    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [v6 data];
    (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
  }
  else
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v9();
  }
}

- (void)loadFileURLWithItemProviderRequestMetadata:(id)a3 type:(id)a4 openInPlace:(BOOL)a5 completion:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v39 = "-[VCVoiceShortcutManagerAccessWrapper loadFileURLWithItemProviderRequestMetadata:type:openInPlace:completion:]";
    __int16 v40 = 2112;
    id v41 = v9;
    __int16 v42 = 2112;
    id v43 = v10;
    _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_DEFAULT, "%s Loading file url representation with metadata: %@ type: %@", buf, 0x20u);
  }

  id v13 = v9;
  if (v13 && (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), v13, (isKindOfClass & 1) != 0))
  {
    id v15 = v13;
    id v16 = (void *)MEMORY[0x1E4F72BC0];
    id v17 = [v15 metadata];
    __int16 v18 = [v16 policyWithEntityMetadata:v17];

    id v36 = 0;
    id v19 = [v18 connectionWithError:&v36];
    id v20 = v36;
    id v21 = v20;
    if (v19)
    {
      id v31 = v20;
      __int16 v22 = (void *)[objc_alloc(MEMORY[0x1E4F72BE8]) initWithContentType:v10];
      uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F72C80]) initWithContentType:v22 preferredExtractionType:0];
      uint64_t v24 = [MEMORY[0x1E4F28F80] processInfo];
      id v25 = v24;
      v32 = v18;
      if (v24) {
        objc_msgSend(v24, "if_auditToken");
      }
      else {
        memset(v35, 0, sizeof(v35));
      }
      id v27 = [v23 configurationWithAuditToken:v35];

      uint64_t v28 = [v15 entity];
      id v37 = v28;
      id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
      id v30 = [v15 metadata];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __110__VCVoiceShortcutManagerAccessWrapper_loadFileURLWithItemProviderRequestMetadata_type_openInPlace_completion___block_invoke;
      v33[3] = &unk_1E6541200;
      id v34 = v11;
      [v19 exportEntities:v29 metadata:v30 withConfiguration:v27 completionHandler:v33];

      id v21 = v31;
      __int16 v18 = v32;
    }
    else
    {
      v26 = getWFGeneralLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v39 = "-[VCVoiceShortcutManagerAccessWrapper loadFileURLWithItemProviderRequestMetadata:type:openInPlace:completion:]";
        __int16 v40 = 2112;
        id v41 = v21;
        _os_log_impl(&dword_1C7D7E000, v26, OS_LOG_TYPE_ERROR, "%s Unable to create connection: %@", buf, 0x16u);
      }

      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v21);
    }
  }
  else
  {
    id v15 = [(VCVoiceShortcutManagerAccessWrapper *)self unsupportedRequestErrorWithMessage:@"Unsupported item provider load request."];
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v15);
  }
}

void __110__VCVoiceShortcutManagerAccessWrapper_loadFileURLWithItemProviderRequestMetadata_type_openInPlace_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v10 = [a2 value];
    long long v3 = [v10 firstObject];
    uint64_t v4 = [v3 exportedContent];

    uint64_t v5 = [v4 content];
    id v6 = objc_msgSend(v5, "wf_fileRepresentation");

    uint64_t v7 = [v6 fileURL];
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v7 readonly:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v9();
  }
}

- (void)setOutcome:(int64_t)a3 forRunEvent:(id)a4
{
  id v10 = a4;
  id v6 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v6 allowReadAccessToShortcutsLibrary])
  {
  }
  else
  {
    uint64_t v7 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
    int v8 = [v7 isBackgroundShortcutRunner];

    if (!v8) {
      goto LABEL_5;
    }
  }
  id v9 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
  [v9 setOutcome:a3 forRunEvent:v10];

LABEL_5:
}

- (void)logRunOfWorkflow:(id)a3 withSource:(id)a4 triggerID:(id)a5 completion:(id)a6
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void *, void))a6;
  id v13 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v13 allowReadAccessToShortcutsLibrary])
  {

LABEL_4:
    id v16 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
    id v17 = [v16 logRunOfWorkflow:v18 withSource:v10 triggerID:v11];

    v12[2](v12, v17, 0);
    goto LABEL_6;
  }
  id v14 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v15 = [v14 isBackgroundShortcutRunner];

  if (v15) {
    goto LABEL_4;
  }
  id v17 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
  ((void (**)(id, void *, void *))v12)[2](v12, 0, v17);
LABEL_6:
}

- (void)storeQuarantineHashForWorkflowWithReference:(id)a3 quarantineHash:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v7 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v7 allowReadAccessToShortcutsLibrary])
  {
  }
  else
  {
    int v8 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
    int v9 = [v8 isBackgroundShortcutRunner];

    if (!v9) {
      goto LABEL_7;
    }
  }
  id v10 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
  id v11 = objc_opt_new();
  id v12 = [v10 recordWithDescriptor:v14 properties:v11 error:0];

  if (v12)
  {
    [v12 setRemoteQuarantineHash:v6];
    id v13 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
    [v13 saveRecord:v12 withDescriptor:v14 error:0];
  }
LABEL_7:
}

- (void)quarantineWorkflowWithReference:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v4 allowReadAccessToShortcutsLibrary])
  {
  }
  else
  {
    uint64_t v5 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
    int v6 = [v5 isBackgroundShortcutRunner];

    if (!v6) {
      goto LABEL_7;
    }
  }
  uint64_t v7 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
  int v8 = objc_opt_new();
  int v9 = [v7 recordWithDescriptor:v11 properties:v8 error:0];

  if (v9)
  {
    [v9 setRemoteQuarantineStatus:1];
    id v10 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
    [v10 saveRecord:v9 withDescriptor:v11 error:0];
  }
LABEL_7:
}

- (void)updateAppDescriptor:(id)a3 atKey:(id)a4 actionUUID:(id)a5 actionIndex:(id)a6 actionIdentifier:(id)a7 workflowID:(id)a8
{
  id v23 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v19 allowReadAccessToShortcutsLibrary])
  {
  }
  else
  {
    id v20 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
    int v21 = [v20 isBackgroundShortcutRunner];

    if (!v21) {
      goto LABEL_5;
    }
  }
  __int16 v22 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
  [v22 updateAppDescriptor:v23 atKey:v14 actionUUID:v15 actionIndex:v16 actionIdentifier:v17 workflowID:v18];

LABEL_5:
}

- (void)saveOutputActionSmartPromtDataForWorkflowReference:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  int v8 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v8 allowReadAccessToShortcutsLibrary])
  {
  }
  else
  {
    int v9 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
    char v10 = [v9 isBackgroundShortcutRunner];

    if ((v10 & 1) == 0)
    {
      id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
      v7[2](v7, v13);

      goto LABEL_6;
    }
  }
  id v11 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
  id v14 = 0;
  [v11 saveOutputActionSmartPromtDataForWorkflowReference:v6 error:&v14];
  id v12 = v14;

  v7[2](v7, v12);
LABEL_6:
}

- (void)saveSmartPromptStateData:(id)a3 actionUUID:(id)a4 reference:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v14 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v14 allowReadAccessToShortcutsLibrary])
  {
  }
  else
  {
    id v15 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
    char v16 = [v15 isBackgroundShortcutRunner];

    if ((v16 & 1) == 0)
    {
      id v20 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
      v13[2](v13, 0, v20);

      goto LABEL_6;
    }
  }
  id v17 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
  id v21 = 0;
  uint64_t v18 = [v17 saveSmartPromptStateData:v10 actionUUID:v11 reference:v12 error:&v21];
  id v19 = v21;

  v13[2](v13, v18, v19);
LABEL_6:
}

- (void)currentDeletionAuthorizationStatusWithContentItemClassName:(id)a3 actionUUID:(id)a4 actionIdentifier:(id)a5 actionIndex:(unint64_t)a6 count:(unint64_t)a7 reference:(id)a8 completion:(id)a9
{
  id v24 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  uint64_t v18 = (void (**)(id, void *, void))a9;
  id v19 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v19 allowReadAccessToShortcutsLibrary])
  {

LABEL_4:
    __int16 v22 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
    id v23 = [v22 currentDeletionAuthorizationStatusWithContentItemClassName:v24 actionUUID:v15 actionIdentifier:v16 actionIndex:a6 count:a7 reference:v17];

    v18[2](v18, v23, 0);
    goto LABEL_6;
  }
  id v20 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v21 = [v20 isBackgroundShortcutRunner];

  if (v21) {
    goto LABEL_4;
  }
  id v23 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
  ((void (**)(id, void *, void *))v18)[2](v18, 0, v23);
LABEL_6:
}

- (void)approvalResultForContentAttributionSet:(id)a3 contentDestination:(id)a4 actionUUID:(id)a5 actionIdentifier:(id)a6 actionIndex:(unint64_t)a7 reference:(id)a8 allowedOnceStates:(id)a9 completion:(id)a10
{
  id v33 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  char v21 = (void (**)(id, void *, void))a10;
  __int16 v22 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v22 allowReadAccessToShortcutsLibrary])
  {

LABEL_4:
    id v30 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
    id v31 = [v30 approvalResultForContentAttributionSet:v33 contentDestination:v16 actionUUID:v17 actionIdentifier:v18 actionIndex:a7 reference:v19 allowedOnceStates:v20];

    v21[2](v21, v31, 0);
    goto LABEL_6;
  }
  [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  id v32 = v20;
  id v23 = v19;
  id v24 = v18;
  id v25 = v17;
  id v26 = v16;
  v28 = unint64_t v27 = a7;
  char v29 = [v28 isBackgroundShortcutRunner];

  a7 = v27;
  id v16 = v26;
  id v17 = v25;
  id v18 = v24;
  id v19 = v23;
  id v20 = v32;

  if (v29) {
    goto LABEL_4;
  }
  id v31 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
  ((void (**)(id, void *, void *))v21)[2](v21, 0, v31);
LABEL_6:
}

- (void)setTrustedToRunScripts:(BOOL)a3 forReference:(id)a4 onDomain:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v17 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void))a6;
  id v12 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v12 allowReadAccessToShortcutsLibrary])
  {

LABEL_4:
    id v15 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
    [v15 setTrustedToRunScripts:v8 forReference:v17 onDomain:v10];

    v11[2](v11, 0);
    goto LABEL_6;
  }
  id v13 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v14 = [v13 isBackgroundShortcutRunner];

  if (v14) {
    goto LABEL_4;
  }
  id v16 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
  ((void (**)(id, void *))v11)[2](v11, v16);

LABEL_6:
}

- (void)getIsReference:(id)a3 allowedToRunOnDomain:(id)a4 completion:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  int v9 = (void (**)(id, void *, void))a5;
  id v10 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v10 allowReadAccessToShortcutsLibrary])
  {

LABEL_4:
    id v13 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
    uint64_t v14 = [v13 isReference:v16 allowedToRunOnDomain:v8];

    id v15 = [NSNumber numberWithBool:v14];
    v9[2](v9, v15, 0);
    goto LABEL_6;
  }
  id v11 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v12 = [v11 isBackgroundShortcutRunner];

  if (v12) {
    goto LABEL_4;
  }
  id v15 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
  ((void (**)(id, void *, void *))v9)[2](v9, 0, v15);
LABEL_6:
}

- (void)createWorkflowWithWorkflowData:(id)a3 name:(id)a4 nameCollisionBehavior:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  char v12 = (void (**)(id, void, void *))a6;
  id v13 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v13 allowReadAccessToShortcutsLibrary])
  {
  }
  else
  {
    uint64_t v14 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
    char v15 = [v14 isBackgroundShortcutRunner];

    if ((v15 & 1) == 0)
    {
      id v25 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
      v12[2](v12, 0, v25);

      goto LABEL_12;
    }
  }
  id v28 = 0;
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4FB73A0]) initWithFileData:v10 name:0 error:&v28];
  id v17 = v28;
  id v18 = v17;
  if (v16)
  {
    id v27 = v17;
    id v19 = [v16 recordRepresentationWithError:&v27];
    id v20 = v27;

    [v19 setName:v11];
    if (v19)
    {
      char v21 = (void *)[objc_alloc(MEMORY[0x1E4FB7398]) initWithRecord:v19];
      __int16 v22 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
      id v26 = v20;
      id v23 = [v22 createWorkflowWithOptions:v21 nameCollisionBehavior:a5 error:&v26];
      id v24 = v26;

      ((void (**)(id, void *, void *))v12)[2](v12, v23, v24);
      id v20 = v24;
    }
    else
    {
      v12[2](v12, 0, v20);
    }

    id v18 = v20;
  }
  else
  {
    v12[2](v12, 0, v17);
  }

LABEL_12:
}

- (void)getConfiguredTriggersForWorkflowID:(id)a3 completion:(id)a4
{
  id v14 = a3;
  id v6 = (void (**)(id, void *, void *))a4;
  uint64_t v7 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v7 allowReadAccessToShortcutsLibrary])
  {

LABEL_4:
    id v10 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
    id v11 = [v10 configuredTriggersForWorkflowID:v14];

    char v12 = [v11 descriptors];
    id v13 = [v11 fetchError];
    v6[2](v6, v12, v13);

    goto LABEL_6;
  }
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v9 = [v8 isBackgroundShortcutRunner];

  if (v9) {
    goto LABEL_4;
  }
  id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
  v6[2](v6, 0, v11);
LABEL_6:
}

- (void)getFolderForWorkflowReference:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  uint64_t v7 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v7 allowReadAccessToShortcutsLibrary])
  {

LABEL_4:
    id v10 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
    id v11 = [v10 folderForWorkflowReference:v12];

    v6[2](v6, v11, 0);
    goto LABEL_6;
  }
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v9 = [v8 isBackgroundShortcutRunner];

  if (v9) {
    goto LABEL_4;
  }
  id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
  ((void (**)(id, void *, void *))v6)[2](v6, 0, v11);
LABEL_6:
}

- (void)getCollectionWithIdentifier:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  uint64_t v7 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v7 allowReadAccessToShortcutsLibrary])
  {

LABEL_4:
    id v10 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
    id v11 = [v10 collectionWithIdentifier:v12];

    v6[2](v6, v11, 0);
    goto LABEL_6;
  }
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v9 = [v8 isBackgroundShortcutRunner];

  if (v9) {
    goto LABEL_4;
  }
  id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
  ((void (**)(id, void *, void *))v6)[2](v6, 0, v11);
LABEL_6:
}

- (void)getSortedVisibleFoldersWithCompletion:(id)a3
{
  id v11 = (void (**)(id, void *, void *))a3;
  uint64_t v4 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v4 allowReadAccessToShortcutsLibrary])
  {

LABEL_4:
    uint64_t v7 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
    id v8 = [v7 sortedVisibleFolders];

    char v9 = [v8 descriptors];
    id v10 = [v8 fetchError];
    v11[2](v11, v9, v10);

    goto LABEL_6;
  }
  uint64_t v5 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v6 = [v5 isBackgroundShortcutRunner];

  if (v6) {
    goto LABEL_4;
  }
  id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
  v11[2](v11, 0, v8);
LABEL_6:
}

- (void)getSortedWorkflowsWithQuery:(id)a3 completion:(id)a4
{
  id v15 = a3;
  char v6 = (void (**)(id, void *, void *))a4;
  uint64_t v7 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v7 allowReadAccessToShortcutsLibrary])
  {

LABEL_4:
    id v10 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
    id v11 = [v10 sortedWorkflowsWithQuery:v15];

    id v12 = [v11 descriptors];
    id v13 = (void *)[v12 copy];
    id v14 = [v11 fetchError];
    v6[2](v6, v13, v14);

    goto LABEL_6;
  }
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v9 = [v8 isBackgroundShortcutRunner];

  if (v9) {
    goto LABEL_4;
  }
  id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
  v6[2](v6, 0, v11);
LABEL_6:
}

- (void)getSortedVisibleWorkflowsInCollection:(id)a3 completion:(id)a4
{
  id v15 = a3;
  char v6 = (void (**)(id, void *, void *))a4;
  uint64_t v7 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v7 allowReadAccessToShortcutsLibrary])
  {

LABEL_4:
    id v10 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
    id v11 = [v10 sortedVisibleWorkflowsInCollection:v15];

    id v12 = [v11 descriptors];
    id v13 = (void *)[v12 copy];
    id v14 = [v11 fetchError];
    v6[2](v6, v13, v14);

    goto LABEL_6;
  }
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v9 = [v8 isBackgroundShortcutRunner];

  if (v9) {
    goto LABEL_4;
  }
  id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
  v6[2](v6, 0, v11);
LABEL_6:
}

- (void)getSortedVisibleWorkflowsByNameWithCompletion:(id)a3
{
  id v12 = (void (**)(id, void *, void *))a3;
  uint64_t v4 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v4 allowReadAccessToShortcutsLibrary])
  {

LABEL_4:
    uint64_t v7 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
    id v8 = [v7 sortedVisibleWorkflowsByName];

    char v9 = [v8 descriptors];
    id v10 = (void *)[v9 copy];
    id v11 = [v8 fetchError];
    v12[2](v12, v10, v11);

    goto LABEL_6;
  }
  uint64_t v5 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v6 = [v5 isBackgroundShortcutRunner];

  if (v6) {
    goto LABEL_4;
  }
  id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
  v12[2](v12, 0, v8);
LABEL_6:
}

- (void)getWorkflowRecordDataForDescriptor:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v8 allowReadAccessToShortcutsLibrary])
  {
  }
  else
  {
    char v9 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
    char v10 = [v9 isBackgroundShortcutRunner];

    if ((v10 & 1) == 0)
    {
      id v17 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
      v7[2](v7, 0, v17);

      goto LABEL_9;
    }
  }
  id v11 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
  id v19 = 0;
  id v12 = [v11 recordWithDescriptor:v6 error:&v19];
  id v13 = v19;

  if (v12)
  {
    id v14 = [v12 fileRepresentation];
    id v18 = v13;
    id v15 = [v14 fileDataWithError:&v18];
    id v16 = v18;

    id v13 = v16;
  }
  else
  {
    id v15 = 0;
  }
  ((void (**)(id, void *, void *))v7)[2](v7, v15, v13);

LABEL_9:
}

- (void)getUniqueVisibleReferenceForWorkflowName:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, void *))a4;
  uint64_t v7 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v7 allowReadAccessToShortcutsLibrary])
  {

LABEL_4:
    char v10 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
    id v11 = [v10 uniqueVisibleReferenceForWorkflowName:v12];

    v6[2](v6, v11);
    goto LABEL_6;
  }
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v9 = [v8 isBackgroundShortcutRunner];

  if (v9) {
    goto LABEL_4;
  }
  v6[2](v6, 0);
LABEL_6:
}

- (void)getReferenceForWorkflowID:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, void *))a4;
  uint64_t v7 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  if ([v7 allowReadAccessToShortcutsLibrary])
  {

LABEL_4:
    char v10 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
    id v11 = [v10 referenceForWorkflowID:v12];

    v6[2](v6, v11);
    goto LABEL_6;
  }
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v9 = [v8 isBackgroundShortcutRunner];

  if (v9) {
    goto LABEL_4;
  }
  v6[2](v6, 0);
LABEL_6:
}

- (id)database
{
  v2 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  long long v3 = [v2 database];

  return v3;
}

- (void)dismissToastedSessionKitSessionsWithReason:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  if (!v10)
  {
    char v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"VCVoiceShortcutManagerAccessWrapper.m", 1124, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self runCoordinator];
  [v8 dismissToastedSessionKitSessionsWithReason:v10 completion:v7];
}

- (void)toastSessionKitSessionWithIdentifier:(id)a3 forDuration:(id)a4 completion:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  char v9 = (void (**)(id, void))a5;
  id v10 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v11 = [v10 isBackgroundShortcutRunner];

  if (v11)
  {
    id v12 = [(VCVoiceShortcutManagerAccessWrapper *)self runCoordinator];
    [v12 toastSessionKitSessionWithIdentifier:v13 forDuration:v8 completion:v9];
  }
  else
  {
    v9[2](v9, 0);
  }
}

- (void)postNotificationAboutFailure:(id)a3 inWorkflow:(id)a4 dialogAttribution:(id)a5 runningContext:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  int v14 = [v13 isBackgroundShortcutRunner];

  if (v14)
  {
    id v15 = [(VCVoiceShortcutManagerAccessWrapper *)self runCoordinator];
    [v15 postNotificationAboutFailure:v16 inWorkflow:v10 dialogAttribution:v11 runningContext:v12];
  }
}

- (void)postNotificationWithRequest:(id)a3 presentationMode:(unint64_t)a4 runningContext:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  char v9 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  int v10 = [v9 isBackgroundShortcutRunner];

  if (v10)
  {
    id v11 = [(VCVoiceShortcutManagerAccessWrapper *)self runCoordinator];
    [v11 postNotificationWithRequest:v12 presentationMode:a4 runningContext:v8];
  }
}

- (void)requestSandboxExtensionForToolKitIndexingWithCompletion:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *, void *, void))a3;
  uint64_t v5 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v6 = [v5 isBackgroundShortcutRunner];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4FB4870] allAvailableExtensionResourceClassNames];
    id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self sandboxExtensionManager];
    [(VCVoiceShortcutManagerAccessWrapper *)self auditToken];
    id v18 = 0;
    char v9 = [v8 requestSandboxExtensionForResources:v7 destinationProcessAuditToken:v19 unauthorizedResources:&v18];
    id v10 = v18;

    if ([v10 count])
    {
      id v11 = getWFSecurityLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        char v21 = "-[VCVoiceShortcutManagerAccessWrapper requestSandboxExtensionForToolKitIndexingWithCompletion:]";
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEFAULT, "%s Failed to extend sandbox for access resources: %@", buf, 0x16u);
      }
    }
    id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:CPSharedResourcesDirectory() isDirectory:1];
    id v13 = [v12 URLByAppendingPathComponent:@"Library" isDirectory:1];
    int v14 = [v13 URLByAppendingPathComponent:@"Shortcuts" isDirectory:1];
    id v15 = [v14 URLByAppendingPathComponent:@"ToolKit" isDirectory:1];

    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v15];
    v4[2](v4, v9, v16, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(id, void *, void *, void), void, void))v4[2])(v4, 0, 0);
  }
}

- (void)requestSandboxExtensionForAccessResources:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id, void))a4;
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v9 = [v8 isBackgroundShortcutRunner];

  if (v9)
  {
    id v10 = [(VCVoiceShortcutManagerAccessWrapper *)self sandboxExtensionManager];
    [(VCVoiceShortcutManagerAccessWrapper *)self auditToken];
    id v13 = 0;
    id v11 = [v10 requestSandboxExtensionForResources:v6 destinationProcessAuditToken:v14 unauthorizedResources:&v13];
    id v12 = v13;

    v7[2](v7, v11, v12, 0);
  }
  else
  {
    id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    ((void (**)(id, void *, id, void *))v7)[2](v7, 0, 0, v11);
  }
}

- (void)getSerializedParametersForLinkAction:(id)a3 actionMetadata:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  [v11 getSerializedParametersForLinkAction:v10 actionMetadata:v9 completion:v8];
}

- (void)getMigratedAppIntentWithINIntent:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  [v8 getMigratedAppIntentWithINIntent:v7 completion:v6];
}

- (void)getLinkActionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 serializedParameterStates:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  [v14 getLinkActionWithAppBundleIdentifier:v13 appIntentIdentifier:v12 serializedParameterStates:v11 completion:v10];
}

- (void)unarchiveActionFromData:(id)a3 withActionMetadata:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  [v11 unarchiveActionFromData:v10 withActionMetadata:v9 completion:v8];
}

- (void)archiveAction:(id)a3 withActionMetadata:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  [v11 archiveAction:v10 withActionMetadata:v9 completion:v8];
}

- (void)removeAllSerializedParametersForQueryName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  [v8 removeAllSerializedParametersForQueryName:v7 completion:v6];
}

- (void)storeSerializedParameters:(id)a3 forAppEntityIdentifier:(id)a4 queryName:(id)a5 badgeType:(unint64_t)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  [v16 storeSerializedParameters:v15 forAppEntityIdentifier:v14 queryName:v13 badgeType:a6 completion:v12];
}

- (void)serializedParametersForAppEntityIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  [v8 serializedParametersForAppEntityIdentifier:v7 completion:v6];
}

- (void)updateAppShortcutsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  [v5 updateAppShortcutsWithCompletion:v4];
}

- (void)setSiriAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
}

- (void)getSiriAutoShortcutsEnablementForBundleIdentifier:(id)a3 completion:(id)a4
{
}

- (void)resetAutomationConfirmationStatusWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v6 = [v5 allowResettingAutomationConfirmationLevel];

  if (v6)
  {
    id v7 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
    id v8 = [v7 databaseProvider];
    id v23 = 0;
    id v9 = [v8 databaseWithError:&v23];
    id v10 = v23;

    if (v9)
    {
      id v11 = objc_opt_new();
      id v12 = [v9 allConfiguredTriggers];
      id v13 = [v12 descriptors];

      id v14 = (void *)[objc_alloc(MEMORY[0x1E4FB7360]) initWithDatabase:v9];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __87__VCVoiceShortcutManagerAccessWrapper_resetAutomationConfirmationStatusWithCompletion___block_invoke;
      v20[3] = &unk_1E65411D8;
      id v21 = v14;
      id v22 = v11;
      id v15 = v11;
      id v16 = v14;
      [v13 enumerateObjectsUsingBlock:v20];
      id v17 = [v15 firstObject];
      v4[2](v4, v17);
    }
    else
    {
      id v19 = getWFTriggerNotificationsLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v25 = "-[VCVoiceShortcutManagerAccessWrapper resetAutomationConfirmationStatusWithCompletion:]";
        __int16 v26 = 2112;
        id v27 = v10;
        _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_ERROR, "%s Couldn't access database when resetting automation confirmation status with error: %@!", buf, 0x16u);
      }

      id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1004, @"Unable to load database");
      v4[2](v4, v13);
    }
  }
  else
  {
    id v18 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    v4[2](v4, v18);
  }
}

void __87__VCVoiceShortcutManagerAccessWrapper_resetAutomationConfirmationStatusWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v8 = 0;
  char v5 = [v4 updateNotificationLevel:0 forConfiguredTrigger:v3 error:&v8];
  id v6 = v8;
  if ((v5 & 1) == 0)
  {
    [*(id *)(a1 + 40) addObject:v6];
    id v7 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v10 = "-[VCVoiceShortcutManagerAccessWrapper resetAutomationConfirmationStatusWithCompletion:]_block_invoke";
      __int16 v11 = 2114;
      id v12 = v3;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_ERROR, "%s Could not reset automation confirmation status for trigger: %{public}@ with error: %{public}@", buf, 0x20u);
    }
  }
}

- (void)userHasAutomationsWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, BOOL, void))a3;
  char v5 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v6 = [v5 allowResettingAutomationConfirmationLevel];

  if (v6)
  {
    id v7 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
    id v8 = [v7 databaseProvider];
    id v16 = 0;
    id v9 = [v8 databaseWithError:&v16];
    id v10 = v16;

    if (v9)
    {
      __int16 v11 = [v9 allConfiguredTriggers];
      BOOL v12 = [v11 count] != 0;

      v4[2](v4, v12, 0);
    }
    else
    {
      id v14 = getWFTriggerNotificationsLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v18 = "-[VCVoiceShortcutManagerAccessWrapper userHasAutomationsWithCompletion:]";
        __int16 v19 = 2112;
        id v20 = v10;
        _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_ERROR, "%s Couldn't access database when checking if user has automations with error: %@!", buf, 0x16u);
      }

      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1004, @"Unable to load database");
      ((void (**)(id, BOOL, void *))v4)[2](v4, 0, v15);
    }
  }
  else
  {
    __int16 v13 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    ((void (**)(id, BOOL, void *))v4)[2](v4, 0, v13);
  }
}

- (void)setPerWorkflowStateData:(id)a3 forSmartPromptWithActionUUID:(id)a4 reference:(id)a5 completion:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  BOOL v12 = (void (**)(id, void))a6;
  __int16 v13 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v14 = [v13 allowUnrestrictedAccess];

  if (v14)
  {
    uint64_t v15 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
    [v15 setPerWorkflowStateData:v17 forSmartPromptWithActionUUID:v10 reference:v11];

    v12[2](v12, 0);
  }
  else
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    v12[2](v12, v16);

    BOOL v12 = (void (**)(id, void))v16;
  }
}

- (void)fetchURLForFPItem:(id)a3 completion:(id)a4
{
  char v5 = (void *)MEMORY[0x1E4F25D38];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 defaultManager];
  [v8 fetchURLForItem:v7 completionHandler:v6];
}

- (void)createBookmarkWithBookmarkableString:(id)a3 path:(id)a4 workflowID:(id)a5 completion:(id)a6
{
  id v8 = a4;
  id v9 = a5;
  char v14 = v8;
  id v15 = a6;
  __int16 v13 = v9;
  id v10 = v8;
  id v11 = v9;
  id v12 = v15;
  FPDocumentURLFromBookmarkableString();
}

void __103__VCVoiceShortcutManagerAccessWrapper_createBookmarkWithBookmarkableString_path_workflowID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v4 = a2;
    int v5 = [v4 startAccessingSecurityScopedResource];
    id v19 = 0;
    id v6 = [v4 bookmarkDataWithOptions:0 includingResourceValuesForKeys:0 relativeToURL:0 error:&v19];
    id v7 = v19;
    if (v6)
    {
      if (v5) {
        [v4 stopAccessingSecurityScopedResource];
      }
      id v8 = [MEMORY[0x1E4FB71A8] defaultDatabase];
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = [*(id *)(a1 + 40) stringByStandardizingPath];
      id v18 = v7;
      id v11 = [v8 createBookmarkWithWorkflowID:v9 path:v10 bookmarkData:v6 error:&v18];
      id v12 = v18;

      __int16 v13 = getWFFilesLogObject();
      char v14 = v13;
      if (v11)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v21 = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithBookmarkableString:path:workflowID:completion:]_block_invoke";
          _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_DEBUG, "%s Created local bookmark", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v21 = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithBookmarkableString:path:workflowID:completion:]_block_invoke";
        __int16 v22 = 2112;
        id v23 = v12;
        _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_ERROR, "%s Failed to create local bookmark with error: %@", buf, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      id v7 = v12;
    }
    else
    {
      id v17 = getWFFilesLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v21 = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithBookmarkableString:path:workflowID:completion:]_block_invoke";
        __int16 v22 = 2112;
        id v23 = v7;
        _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_ERROR, "%s Could not create bookmark data with error: %@", buf, 0x16u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    uint64_t v16 = getWFFilesLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v21 = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithBookmarkableString:path:workflowID:completion:]_block_invoke";
      __int16 v22 = 2112;
      id v23 = a3;
      _os_log_impl(&dword_1C7D7E000, v16, OS_LOG_TYPE_ERROR, "%s Could not create document url from bookmarkable string with error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)createBookmarkWithURL:(id)a3 workflowID:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (uint64_t (*)(uint64_t, uint64_t))a4;
  id v9 = a5;
  id v10 = getWFFilesLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithURL:workflowID:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    id v27 = v8;
    _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEFAULT, "%s Attempting to create local bookmark with URL: %@ workflowID: %@", buf, 0x20u);
  }

  id v11 = [v7 url];
  char v12 = [v11 startAccessingSecurityScopedResource];

  __int16 v13 = objc_opt_new();
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v27 = __Block_byref_object_copy__5165;
  uint64_t v28 = __Block_byref_object_dispose__5166;
  id v29 = 0;
  char v14 = [v7 url];
  id v15 = (id *)(*(void *)&buf[8] + 40);
  id obj = *(id *)(*(void *)&buf[8] + 40);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __83__VCVoiceShortcutManagerAccessWrapper_createBookmarkWithURL_workflowID_completion___block_invoke;
  v19[3] = &unk_1E6541188;
  id v16 = v7;
  id v20 = v16;
  id v17 = v9;
  id v22 = v17;
  id v23 = buf;
  char v24 = v12;
  id v18 = v8;
  uint64_t v21 = v18;
  [v13 coordinateReadingItemAtURL:v14 options:0 error:&obj byAccessor:v19];
  objc_storeStrong(v15, obj);

  _Block_object_dispose(buf, 8);
}

void __83__VCVoiceShortcutManagerAccessWrapper_createBookmarkWithURL_workflowID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((objc_msgSend(v3, "wf_fileIsReadable") & 1) == 0)
  {
    id v16 = getWFFilesLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = [*(id *)(a1 + 32) url];
      *(_DWORD *)buf = 136315650;
      id v25 = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithURL:workflowID:completion:]_block_invoke";
      __int16 v26 = 2112;
      id v27 = v3;
      __int16 v28 = 2112;
      id v29 = v17;
      _os_log_impl(&dword_1C7D7E000, v16, OS_LOG_TYPE_ERROR, "%s Do not have access to new url: %@ original url: %@ during coordinated read", buf, 0x20u);
    }
    int v5 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 10002, @"Could not create bookmark for file.");
    id v15 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_16;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  int v5 = [v3 bookmarkDataWithOptions:0 includingResourceValuesForKeys:0 relativeToURL:0 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (*(unsigned char *)(a1 + 64))
  {
    id v6 = [*(id *)(a1 + 32) url];
    [v6 stopAccessingSecurityScopedResource];
  }
  if (v5)
  {
    if (!*(void *)(a1 + 40))
    {
LABEL_10:
      char v14 = getWFFilesLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v25 = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithURL:workflowID:completion:]_block_invoke";
        _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_INFO, "%s Created local bookmark", buf, 0xCu);
      }

      id v15 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_16:
      v15();
      goto LABEL_23;
    }
    id v7 = getWFFilesLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v25 = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithURL:workflowID:completion:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_INFO, "%s Workflow identifier present persisting to database", buf, 0xCu);
    }

    id v8 = [MEMORY[0x1E4FB71A8] defaultDatabase];
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [v3 path];
    id v11 = [v10 stringByStandardizingPath];
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v22 = *(id *)(v12 + 40);
    __int16 v13 = [v8 createBookmarkWithWorkflowID:v9 path:v11 bookmarkData:v5 error:&v22];
    objc_storeStrong((id *)(v12 + 40), v22);

    if (v13)
    {

      goto LABEL_10;
    }
    id v20 = getWFFilesLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 136315394;
      id v25 = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithURL:workflowID:completion:]_block_invoke";
      __int16 v26 = 2112;
      id v27 = v21;
      _os_log_impl(&dword_1C7D7E000, v20, OS_LOG_TYPE_ERROR, "%s Failed to save local bookmark with error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v18 = getWFFilesLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 136315394;
      id v25 = "-[VCVoiceShortcutManagerAccessWrapper createBookmarkWithURL:workflowID:completion:]_block_invoke";
      __int16 v26 = 2112;
      id v27 = v19;
      _os_log_impl(&dword_1C7D7E000, v18, OS_LOG_TYPE_ERROR, "%s Could not create bookmark data with error: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    int v5 = 0;
  }
LABEL_23:
}

- (void)resolveCrossDeviceItemID:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = getWFFilesLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[VCVoiceShortcutManagerAccessWrapper resolveCrossDeviceItemID:completion:]";
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEBUG, "%s Resolving itemID: %@", buf, 0x16u);
  }

  if (v5)
  {
    id v8 = v6;
    FPItemURLForCrossDeviceItemID();
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

uint64_t __75__VCVoiceShortcutManagerAccessWrapper_resolveCrossDeviceItemID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = getWFFilesLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315650;
    uint64_t v9 = "-[VCVoiceShortcutManagerAccessWrapper resolveCrossDeviceItemID:completion:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = a2;
    __int16 v12 = 2112;
    uint64_t v13 = a3;
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_DEBUG, "%s Resolved to url: %@ with error: %@", (uint8_t *)&v8, 0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resolveBookmarkData:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32[0] = 0;
  uint64_t v25 = 0;
  __int16 v26 = &v25;
  uint64_t v27 = 0x3032000000;
  __int16 v28 = __Block_byref_object_copy__5165;
  id v29 = __Block_byref_object_dispose__5166;
  id v30 = 0;
  id obj = 0;
  id v7 = [MEMORY[0x1E4F1CB10] URLByResolvingBookmarkData:v5 options:0 relativeToURL:0 bookmarkDataIsStale:v32 error:&obj];
  objc_storeStrong(&v30, obj);
  if (!v7)
  {
    uint64_t v11 = [(id)v26[5] domain];
    uint64_t v12 = *MEMORY[0x1E4F281F8];
    if ([v11 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v13 = [(id)v26[5] code];

      if (v13 != 259)
      {
LABEL_7:
        (*((void (**)(id, void, void, uint64_t))v6 + 2))(v6, 0, 0, v26[5]);
        goto LABEL_8;
      }
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = [(id)v26[5] userInfo];
      uint64_t v15 = [v14 errorWithDomain:v12 code:4 userInfo:v11];
      id v16 = (void *)v26[5];
      v26[5] = v15;
    }
    goto LABEL_7;
  }
  char v8 = [v7 startAccessingSecurityScopedResource];
  uint64_t v9 = objc_opt_new();
  __int16 v10 = (id *)(v26 + 5);
  id v23 = (id)v26[5];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__VCVoiceShortcutManagerAccessWrapper_resolveBookmarkData_completion___block_invoke;
  v17[3] = &unk_1E6541138;
  id v20 = &v25;
  id v18 = v7;
  uint64_t v21 = v31;
  char v22 = v8;
  id v19 = v6;
  [v9 coordinateReadingItemAtURL:v18 options:0 error:&v23 byAccessor:v17];
  objc_storeStrong(v10, v23);

LABEL_8:
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(v31, 8);
}

void __70__VCVoiceShortcutManagerAccessWrapper_resolveBookmarkData_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = objc_msgSend(v3, "wf_fileIsWritable");
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v5 + 40);
  id v6 = [MEMORY[0x1E4F25D78] wrapperWithURL:v3 readonly:v4 ^ 1u error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  id v7 = getWFFilesLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    char v8 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[VCVoiceShortcutManagerAccessWrapper resolveBookmarkData:completion:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEBUG, "%s Created bookmark url: %@ from bookmark data", buf, 0x16u);
  }

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v12 = 0;
    uint64_t v9 = [v3 bookmarkDataWithOptions:0 includingResourceValuesForKeys:0 relativeToURL:0 error:&v12];
    id v10 = v12;
    if (!v9)
    {
      uint64_t v11 = getWFFilesLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v15 = "-[VCVoiceShortcutManagerAccessWrapper resolveBookmarkData:completion:]_block_invoke";
        __int16 v16 = 2114;
        id v17 = v10;
        _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_ERROR, "%s Could not create bookmark data from resolved url with error: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resolveFilePath:(id)a3 workflowID:(id)a4 completion:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v41 = 0;
  __int16 v42 = &v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = __Block_byref_object_copy__5165;
  v45 = __Block_byref_object_dispose__5166;
  id v46 = 0;
  id v10 = [v7 stringByStandardizingPath];
  uint64_t v11 = [MEMORY[0x1E4FB71A8] defaultDatabase];
  id v12 = (id *)(v42 + 5);
  id obj = (id)v42[5];
  uint64_t v13 = [v11 bookmarkDataForWorkflowID:v8 path:v10 error:&obj];
  objc_storeStrong(v12, obj);
  if (v13)
  {
    char v39 = 0;
    uint64_t v14 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v15 = [v13 bookmarkData];
    __int16 v16 = (id *)(v42 + 5);
    id v38 = (id)v42[5];
    id v17 = [v14 URLByResolvingBookmarkData:v15 options:0 relativeToURL:0 bookmarkDataIsStale:&v39 error:&v38];
    objc_storeStrong(v16, v38);

    if (v17)
    {
      char v18 = [v17 startAccessingSecurityScopedResource];
      id v19 = objc_opt_new();
      id v20 = (id *)(v42 + 5);
      id v37 = (id)v42[5];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __77__VCVoiceShortcutManagerAccessWrapper_resolveFilePath_workflowID_completion___block_invoke;
      v32[3] = &unk_1E6541110;
      id v33 = v17;
      id v35 = &v41;
      char v36 = v18;
      id v34 = v9;
      [v19 coordinateReadingItemAtURL:v33 options:0 error:&v37 byAccessor:v32];
      objc_storeStrong(v20, v37);
    }
    else
    {
      id v23 = getWFFilesLogObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        char v24 = (void *)v42[5];
        *(_DWORD *)buf = 136315650;
        v48 = "-[VCVoiceShortcutManagerAccessWrapper resolveFilePath:workflowID:completion:]";
        __int16 v49 = 2112;
        v50 = v13;
        __int16 v51 = 2112;
        id v52 = v24;
        _os_log_impl(&dword_1C7D7E000, v23, OS_LOG_TYPE_ERROR, "%s Failed to create bookmark from %@ with error %@", buf, 0x20u);
      }

      uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
      __int16 v26 = [(id)v42[5] localizedFailureReason];
      uint64_t v27 = objc_msgSend(v25, "vc_voiceShortcutErrorWithCode:reason:", 10003, @"%@", v26);
      __int16 v28 = (void *)v42[5];
      v42[5] = v27;

      (*((void (**)(id, void, uint64_t))v9 + 2))(v9, 0, v42[5]);
    }
  }
  else
  {
    if (v42[5])
    {
      uint64_t v21 = getWFFilesLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = v42[5];
        *(_DWORD *)buf = 136315906;
        v48 = "-[VCVoiceShortcutManagerAccessWrapper resolveFilePath:workflowID:completion:]";
        __int16 v49 = 2112;
        v50 = v10;
        __int16 v51 = 2112;
        id v52 = v8;
        __int16 v53 = 2112;
        uint64_t v54 = v22;
        _os_log_impl(&dword_1C7D7E000, v21, OS_LOG_TYPE_ERROR, "%s Failed to look up bookmark for path %@ workflowID %@, with error %@", buf, 0x2Au);
      }
    }
    else
    {
      id v29 = getWFFilesLogObject();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v48 = "-[VCVoiceShortcutManagerAccessWrapper resolveFilePath:workflowID:completion:]";
        __int16 v49 = 2112;
        v50 = v10;
        __int16 v51 = 2112;
        id v52 = v8;
        _os_log_impl(&dword_1C7D7E000, v29, OS_LOG_TYPE_ERROR, "%s No bookmark found for path %@ workflowID %@", buf, 0x20u);
      }

      uint64_t v21 = WFLocalizedString(@"No bookmark found for file.");
      uint64_t v30 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 10001, @"%@", v21);
      id v31 = (void *)v42[5];
      v42[5] = v30;
    }
    (*((void (**)(id, void, uint64_t))v9 + 2))(v9, 0, v42[5]);
  }

  _Block_object_dispose(&v41, 8);
}

void __77__VCVoiceShortcutManagerAccessWrapper_resolveFilePath_workflowID_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "wf_fileIsWritable") ^ 1;
  uint64_t v5 = getWFFilesLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[VCVoiceShortcutManagerAccessWrapper resolveFilePath:workflowID:completion:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEBUG, "%s Created URL %@ from bookmark", buf, 0x16u);
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = [MEMORY[0x1E4F25D78] wrapperWithURL:v3 readonly:v4 error:&obj];

  objc_storeStrong((id *)(v7 + 40), obj);
  if (*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getLinkActionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 expandingParameterName:(id)a5 limit:(int64_t)a6 completion:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v15 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v16 = [v15 allowFullRuntimeAccess];

  if (v16)
  {
    id v17 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
    [v17 getLinkActionWithAppBundleIdentifier:v18 appIntentIdentifier:v12 expandingParameterName:v13 limit:a6 completion:v14];
  }
  else
  {
    id v17 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    (*((void (**)(id, void, void, void *))v14 + 2))(v14, 0, 0, v17);
  }
}

- (void)getUpcomingMediaForBundleIdentifier:(id)a3 limit:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void, void *))a5;
  id v10 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v11 = [v10 allowFullRuntimeAccess];

  if ((v11 & 1) == 0)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    id v23 = @"Access was denied";
    uint64_t v24 = 1011;
LABEL_10:
    id v13 = objc_msgSend(v22, "vc_voiceShortcutErrorWithCode:reason:", v24, v23);
    v9[2](v9, 0, v13);
    goto LABEL_11;
  }
  if (!getMRMediaSuggestionRequestClass())
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    id v23 = @"Cannot fetch upcoming media query";
    uint64_t v24 = 0;
    goto LABEL_10;
  }
  id v12 = objc_alloc((Class)getMRMediaSuggestionRequestClass());
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __92__VCVoiceShortcutManagerAccessWrapper_getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke;
  v30[3] = &__block_descriptor_40_e72_v16__0__MRMediaSuggestionRequest_MRMediaSuggestionRequestConfigurable__8l;
  v30[4] = a4;
  id v13 = (void *)[v12 initWithBlock:v30];
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2050000000;
  id v14 = (void *)getMRMediaSuggestionRequestOptionsClass_softClass;
  uint64_t v39 = getMRMediaSuggestionRequestOptionsClass_softClass;
  if (!getMRMediaSuggestionRequestOptionsClass_softClass)
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    id v33 = __getMRMediaSuggestionRequestOptionsClass_block_invoke;
    id v34 = &unk_1E6541E40;
    id v35 = &v36;
    __getMRMediaSuggestionRequestOptionsClass_block_invoke((uint64_t)&v31);
    id v14 = (void *)v37[3];
  }
  uint64_t v15 = v14;
  _Block_object_dispose(&v36, 8);
  id v16 = [v15 alloc];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __92__VCVoiceShortcutManagerAccessWrapper_getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke_2;
  v28[3] = &unk_1E65410C0;
  id v17 = v8;
  id v29 = v17;
  id v18 = (void *)[v16 initWithBlock:v28];
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2050000000;
  id v19 = (void *)getMRMediaSuggestionPreferencesClass_softClass;
  uint64_t v39 = getMRMediaSuggestionPreferencesClass_softClass;
  if (!getMRMediaSuggestionPreferencesClass_softClass)
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    id v33 = __getMRMediaSuggestionPreferencesClass_block_invoke;
    id v34 = &unk_1E6541E40;
    id v35 = &v36;
    __getMRMediaSuggestionPreferencesClass_block_invoke((uint64_t)&v31);
    id v19 = (void *)v37[3];
  }
  id v20 = v19;
  _Block_object_dispose(&v36, 8);
  uint64_t v21 = objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __92__VCVoiceShortcutManagerAccessWrapper_getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke_3;
  v25[3] = &unk_1E6540F80;
  uint64_t v27 = v9;
  id v26 = v17;
  [v13 performWithPreferences:v21 options:v18 completion:v25];

LABEL_11:
}

void __92__VCVoiceShortcutManagerAccessWrapper_getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 setMaxResults:v2];
  [v3 setIncludeArtwork:1];
}

void __92__VCVoiceShortcutManagerAccessWrapper_getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  uint64_t v4 = [v2 arrayWithObjects:&v5 count:1];
  objc_msgSend(v3, "setBundleIdentifiers:", v4, v5, v6);
}

void __92__VCVoiceShortcutManagerAccessWrapper_getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v11 = *(void *)(a1 + 40);
    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 0, @"Failed to fetch upcoming media query");
    (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v9);
LABEL_9:

    return;
  }
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v7 = (void *)getMRSuggestionContextHomeScreenSymbolLoc_ptr;
  uint64_t v24 = getMRSuggestionContextHomeScreenSymbolLoc_ptr;
  if (!getMRSuggestionContextHomeScreenSymbolLoc_ptr)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __getMRSuggestionContextHomeScreenSymbolLoc_block_invoke;
    id v19 = &unk_1E6541E40;
    id v20 = &v21;
    id v8 = MediaRemoteLibrary();
    v22[3] = (uint64_t)dlsym(v8, "MRSuggestionContextHomeScreen");
    getMRSuggestionContextHomeScreenSymbolLoc_ptr = *(void *)(v20[1] + 24);
    uint64_t v7 = (void *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (v7)
  {
    id v9 = [v5 objectForKeyedSubscript:*v7];
    if (v9)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __92__VCVoiceShortcutManagerAccessWrapper_getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke_4;
      v14[3] = &unk_1E65410E8;
      id v15 = *(id *)(a1 + 32);
      id v10 = objc_msgSend(v9, "if_compactMap:", v14);
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      (*(void (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), MEMORY[0x1E4F1CBF0], 0);
    }
    goto LABEL_9;
  }
  id v12 = [MEMORY[0x1E4F28B00] currentHandler];
  id v13 = [NSString stringWithUTF8String:"MRSuggestionContext getMRSuggestionContextHomeScreen(void)"];
  objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"VCVoiceShortcutManagerAccessWrapper.m", 68, @"%s", dlerror());

  __break(1u);
}

id __92__VCVoiceShortcutManagerAccessWrapper_getUpcomingMediaForBundleIdentifier_limit_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 valueForKey:@"intent"];
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4FB4B18]]
    || [*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4FB4B40]])
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB4680]);
    id v6 = [v3 artwork];
    uint64_t v7 = [v6 imageData];
    id v8 = (void *)[v5 initWithPlayMediaIntent:v4 artwork:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)getFavoriteContactsWithLimit:(int64_t)a3 completion:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void, void *))a4;
  id v6 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v7 = [v6 allowFullRuntimeAccess];

  if ((v7 & 1) == 0)
  {
    v48 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    v5[2](v5, 0, v48);

    goto LABEL_28;
  }
  id v52 = v5;
  id v8 = [MEMORY[0x1E4F1B9E8] sharedInstance];
  id v9 = objc_opt_new();
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  __int16 v51 = v8;
  id obj = [v8 entries];
  uint64_t v63 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
  if (!v63) {
    goto LABEL_24;
  }
  uint64_t v62 = *(void *)v70;
  v61 = (void *)*MEMORY[0x1E4F5AAD8];
  uint64_t v60 = *MEMORY[0x1E4F1AD10];
  uint64_t v59 = *MEMORY[0x1E4F1AD00];
  uint64_t v55 = *MEMORY[0x1E4F1AD20];
  uint64_t v54 = *MEMORY[0x1E4F1AD78];
  __int16 v53 = (void *)*MEMORY[0x1E4F5AAE0];
  v57 = (void *)*MEMORY[0x1E4F5AAD0];
  v58 = v9;
  while (2)
  {
    for (uint64_t i = 0; i != v63; ++i)
    {
      if (*(void *)v70 != v62) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void **)(*((void *)&v69 + 1) + 8 * i);
      id v12 = (void *)MEMORY[0x1C87C4C10]();
      if ([v9 count] == a3)
      {
        goto LABEL_24;
      }
      id v13 = v61;
      id v14 = [v11 bundleIdentifier];
      char v15 = [v14 isEqualToString:v60];

      if (v15)
      {
        v68 = v12;
        uint64_t v16 = v57;
        uint64_t v17 = @"Audio";
        uint64_t v18 = 1;
LABEL_17:
        uint64_t v67 = v18;
        id v65 = v16;

        uint64_t v25 = (void *)MEMORY[0x1E4F5A7B8];
        id v26 = [v11 contactProperty];
        uint64_t v27 = [v26 contact];
        uint64_t v22 = [v25 contactWithCNContact:v27];

        v66 = (void *)[objc_alloc(MEMORY[0x1E4F5A800]) initWithContact:v22];
        id v28 = objc_alloc(MEMORY[0x1E4FB7290]);
        id v29 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v30 = (void *)[v28 initWithIdentity:v29 parameterState:v66];

        id v31 = objc_alloc(MEMORY[0x1E4FB7198]);
        v73 = v30;
        uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
        id v33 = (void *)[v31 initWithValue:v32];

        id v34 = objc_alloc(MEMORY[0x1E4F5A7E8]);
        id v35 = [v11 bundleIdentifier];
        uint64_t v36 = (void *)[v34 initWithBundleIdentifier:v35 type:v65];
        [v33 setCommunicationMethod:v36];

        id v37 = (void *)[objc_alloc(MEMORY[0x1E4FB7338]) initWithValue:v17];
        id v38 = objc_alloc(MEMORY[0x1E4F305B0]);
        uint64_t v39 = [v11 contactProperty];
        __int16 v40 = [v39 contact];
        uint64_t v41 = [v11 value];
        __int16 v42 = (void *)[v38 initWithContact:v40 handle:v41];

        id v43 = objc_alloc(MEMORY[0x1E4FB4678]);
        uint64_t v44 = [v11 value];
        v45 = [v37 serializedRepresentation];
        id v46 = [v33 serializedRepresentation];
        v47 = (void *)[v43 initWithHandle:v44 callType:v67 person:v42 callTypeSerializedRepresentation:v45 personSerializedRepresentation:v46];

        id v9 = v58;
        [v58 addObject:v47];

        id v13 = v65;
        id v12 = v68;
        goto LABEL_18;
      }
      id v19 = [v11 bundleIdentifier];
      if ([v19 isEqualToString:v59])
      {
        id v20 = [v11 actionType];
        char v21 = [v20 isEqualToString:v55];

        if (v21)
        {
          v68 = v12;
          uint64_t v16 = v57;
          uint64_t v17 = @"Audio";
          uint64_t v18 = 3;
          goto LABEL_17;
        }
      }
      else
      {
      }
      uint64_t v22 = [v11 bundleIdentifier];
      if ([v22 isEqualToString:v59])
      {
        uint64_t v23 = [v11 actionType];
        int v24 = [v23 isEqualToString:v54];

        if (!v24) {
          goto LABEL_19;
        }
        v68 = v12;
        uint64_t v16 = v53;
        uint64_t v17 = @"Video";
        uint64_t v18 = 2;
        goto LABEL_17;
      }
LABEL_18:

LABEL_19:
    }
    uint64_t v63 = [obj countByEnumeratingWithState:&v69 objects:v74 count:16];
    if (v63) {
      continue;
    }
    break;
  }
LABEL_24:

  if (v9) {
    __int16 v49 = v9;
  }
  else {
    __int16 v49 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v50 = v9;
  id v5 = v52;
  ((void (**)(id, void *, void *))v52)[2](v52, v49, 0);

LABEL_28:
}

- (void)getRecentsCallWithTelephony:(BOOL)a3 limit:(int64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  v50[2] = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, void, void *))a5;
  id v9 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v10 = [v9 allowFullRuntimeAccess];

  if ((v10 & 1) == 0)
  {
    __int16 v42 = (void *)MEMORY[0x1E4F28C58];
    id v43 = @"Access was denied";
LABEL_12:
    id v13 = objc_msgSend(v42, "vc_voiceShortcutErrorWithCode:reason:", 1011, v43);
    v8[2](v8, 0, v13);
    goto LABEL_15;
  }
  if ([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] != 3)
  {
    __int16 v42 = (void *)MEMORY[0x1E4F28C58];
    id v43 = @"Contact Access was denied";
    goto LABEL_12;
  }
  uint64_t v11 = [NSNumber numberWithUnsignedInt:*MEMORY[0x1E4F57CD8]];
  v50[0] = v11;
  id v12 = [NSNumber numberWithUnsignedInt:*MEMORY[0x1E4F57CD0]];
  v50[1] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];

  if (v6)
  {
    id v14 = [NSNumber numberWithUnsignedInt:*MEMORY[0x1E4F57CE0]];
    uint64_t v15 = [v13 arrayByAddingObject:v14];

    id v13 = (void *)v15;
  }
  uint64_t v16 = objc_opt_new();
  v45 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"callType IN %@", v13];
  uint64_t v17 = objc_msgSend(v16, "recentCallsWithPredicate:");
  unint64_t v18 = [v17 count];
  if (v18 >= a4) {
    int64_t v19 = a4;
  }
  else {
    int64_t v19 = v18;
  }
  id v20 = objc_msgSend(v17, "subarrayWithRange:", 0, v19);

  char v21 = objc_msgSend(v20, "if_flatMap:", &__block_literal_global_256);
  id v22 = objc_alloc(MEMORY[0x1E4F1B908]);
  uint64_t v23 = [MEMORY[0x1E4F305B0] expectedCNContactKeys];
  uint64_t v24 = *MEMORY[0x1E4F1AE28];
  v49[0] = *MEMORY[0x1E4F1AE20];
  v49[1] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  id v26 = [v23 arrayByAddingObjectsFromArray:v25];
  uint64_t v27 = (void *)[v22 initWithKeysToFetch:v26];

  id v28 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingHandleStrings:v21];
  [v27 setPredicate:v28];

  id v29 = objc_opt_new();
  id v48 = 0;
  uint64_t v30 = [v29 executeFetchRequest:v27 error:&v48];
  id v31 = v48;
  uint64_t v32 = [v30 value];

  if (v32)
  {
    id v33 = [v30 value];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __84__VCVoiceShortcutManagerAccessWrapper_getRecentsCallWithTelephony_limit_completion___block_invoke_3;
    v46[3] = &unk_1E6541078;
    id v47 = v33;
    id v44 = v33;
    objc_msgSend(v20, "if_compactMap:", v46);
    id v34 = v29;
    id v35 = v27;
    id v36 = v31;
    id v37 = v20;
    id v38 = v13;
    uint64_t v39 = v21;
    v41 = __int16 v40 = v16;
    ((void (**)(id, void *, void *))v8)[2](v8, v41, 0);

    uint64_t v16 = v40;
    char v21 = v39;
    id v13 = v38;
    id v20 = v37;
    id v31 = v36;
    uint64_t v27 = v35;
    id v29 = v34;
  }
  else
  {
    v8[2](v8, 0, v31);
  }

LABEL_15:
}

id __84__VCVoiceShortcutManagerAccessWrapper_getRecentsCallWithTelephony_limit_completion___block_invoke_3(uint64_t a1, void *a2)
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__5165;
  id v46 = __Block_byref_object_dispose__5166;
  id v47 = 0;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__5165;
  __int16 v40 = __Block_byref_object_dispose__5166;
  id v41 = 0;
  uint64_t v4 = [v3 remoteParticipantHandles];
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  id v31 = __84__VCVoiceShortcutManagerAccessWrapper_getRecentsCallWithTelephony_limit_completion___block_invoke_263;
  uint64_t v32 = &unk_1E6541050;
  id v34 = &v42;
  id v33 = *(id *)(a1 + 32);
  id v35 = &v36;
  [v4 enumerateObjectsUsingBlock:&v29];

  if (v43[5])
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F5A7B8], "contactWithCNContact:");
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F5A800]) initWithContact:v5];
    id v28 = (void *)v5;
    id v7 = objc_alloc(MEMORY[0x1E4FB7290]);
    id v8 = [MEMORY[0x1E4F29128] UUID];
    id v9 = (void *)[v7 initWithIdentity:v8 parameterState:v6];
    uint64_t v27 = (void *)v6;

    id v10 = objc_alloc(MEMORY[0x1E4FB7198]);
    v48[0] = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
    id v12 = (void *)[v10 initWithValue:v11];

    id v13 = objc_alloc(MEMORY[0x1E4F305B0]);
    uint64_t v14 = v43[5];
    uint64_t v15 = [(id)v37[5] value];
    uint64_t v16 = (void *)[v13 initWithContact:v14 handle:v15];

    uint64_t v17 = [v3 serviceProvider];
    LOBYTE(v15) = [v17 isEqualToString:@"com.apple.Telephony"];

    if (v15)
    {
      unint64_t v18 = @"Audio";
      uint64_t v19 = 1;
    }
    else if (objc_msgSend(v3, "mediaType", v27, v28, v29, v30, v31, v32) == 1)
    {
      unint64_t v18 = @"Audio";
      uint64_t v19 = 3;
    }
    else
    {
      if ([v3 mediaType] == 2) {
        unint64_t v18 = @"Video";
      }
      else {
        unint64_t v18 = 0;
      }
      uint64_t v19 = 2;
    }
    char v21 = (void *)[objc_alloc(MEMORY[0x1E4FB7338]) initWithValue:v18];
    id v22 = objc_alloc(MEMORY[0x1E4FB4678]);
    uint64_t v23 = [(id)v37[5] value];
    uint64_t v24 = [v21 serializedRepresentation];
    uint64_t v25 = [v12 serializedRepresentation];
    id v20 = (void *)[v22 initWithHandle:v23 callType:v19 person:v16 callTypeSerializedRepresentation:v24 personSerializedRepresentation:v25];
  }
  else
  {
    id v20 = 0;
  }

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v20;
}

void __84__VCVoiceShortcutManagerAccessWrapper_getRecentsCallWithTelephony_limit_completion___block_invoke_263(void *a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  id v7 = (void *)a1[4];
  id v13 = v6;
  id v8 = [v6 value];
  id v9 = [v7 objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 firstObject];
  uint64_t v11 = *(void *)(a1[5] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    *a3 = 1;
  }
}

id __84__VCVoiceShortcutManagerAccessWrapper_getRecentsCallWithTelephony_limit_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 remoteParticipantHandles];
  id v3 = [v2 allObjects];
  uint64_t v4 = objc_msgSend(v3, "if_map:", &__block_literal_global_259);
  uint64_t v5 = v4;
  if (!v4) {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v4;

  return v6;
}

uint64_t __84__VCVoiceShortcutManagerAccessWrapper_getRecentsCallWithTelephony_limit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (void)getSuggestedShortcutsWithLimit:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v8 = [v7 allowFullRuntimeAccess];

  if (v8)
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB4A70]) initWithLocation:0];
    [v9 setResultsLimit:a3];
    uint64_t v10 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
    uint64_t v11 = [v10 sortedWorkflowsWithQuery:v9];

    id v12 = [v11 descriptors];

    if (v12)
    {
      id v13 = (void *)MEMORY[0x1E4FB4A48];
      uint64_t v14 = [v11 descriptors];
      uint64_t v15 = [(VCVoiceShortcutManagerAccessWrapper *)self database];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __81__VCVoiceShortcutManagerAccessWrapper_getSuggestedShortcutsWithLimit_completion___block_invoke;
      v17[3] = &unk_1E6540FE8;
      id v18 = v6;
      [v13 getObjectsFromReferences:v14 databaseProvider:v15 completion:v17];
    }
    else
    {
      uint64_t v16 = [v11 fetchError];
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v16);
    }
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v9);
  }
}

void __81__VCVoiceShortcutManagerAccessWrapper_getSuggestedShortcutsWithLimit_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    objc_msgSend(a2, "if_compactMap:", &__block_literal_global_240);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

id __81__VCVoiceShortcutManagerAccessWrapper_getSuggestedShortcutsWithLimit_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;
  id v5 = objc_alloc(MEMORY[0x1E4FB73B0]);
  id v6 = [v4 name];
  id v7 = [v4 identifier];
  char v8 = (void *)[v5 initWithWorkflowName:v6 workflowIdentifier:v7 isSelf:0];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB73A8]) initWithValue:v8];
  id v10 = objc_alloc(MEMORY[0x1E4FB4688]);
  uint64_t v11 = [v9 serializedRepresentation];
  id v12 = (void *)[v10 initWithDescriptor:v4 serializedRepresentation:v11];

  return v12;
}

- (void)computeFinderResizedSizesForImages:(id)a3 inSizes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, id))a5;
  uint64_t v11 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v12 = [v11 allowFullRuntimeAccess];

  if (v12)
  {
    id v16 = 0;
    id v13 = [MEMORY[0x1E4FB4820] computeFinderResizedSizesForImages:v8 inSizes:v9 error:&v16];
    id v14 = v16;
    v10[2](v10, v13, v14);
  }
  else
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    v10[2](v10, 0, v15);
  }
}

- (void)showSingleStepCompletionForWebClip:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v9 = [v8 isSpringBoard];

  if (v9)
  {
    id v10 = [(VCVoiceShortcutManagerAccessWrapper *)self runCoordinator];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __85__VCVoiceShortcutManagerAccessWrapper_showSingleStepCompletionForWebClip_completion___block_invoke;
    v13[3] = &unk_1E65417D8;
    id v14 = v7;
    [v10 showSingleStepCompletionWithWebClipMetadata:v6 completion:v13];

    uint64_t v11 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
    [v11 logHomescreenFastPathRunEventForShortcutWithWebClip:v6];
  }
  else
  {
    char v12 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied (must be SpringBoard)");
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

uint64_t __85__VCVoiceShortcutManagerAccessWrapper_showSingleStepCompletionForWebClip_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getStingWorkflowWithIdentifier:(id)a3 completion:(id)a4
{
  id v19 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v8 = [v7 allowReadAccessToShortcutsLibrary];

  if (v8)
  {
    char v9 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
    id v10 = [v9 database];

    if (v10)
    {
      uint64_t v11 = [v10 referenceForWorkflowID:v19];
      if (v11)
      {
        id v12 = objc_alloc(MEMORY[0x1E4FB49B8]);
        id v13 = [v11 identifier];
        id v14 = [v11 name];
        uint64_t v15 = [v11 color];
        uint64_t v16 = [v11 glyphCharacter];
        uint64_t v17 = [v11 associatedAppBundleIdentifier];
        id v18 = (void *)[v12 initWithIdentifier:v13 name:v14 color:v15 glyphCharacter:v16 associatedAppBundleIdentifier:v17];

        v6[2](v6, v18, 0);
      }
      else
      {
        v6[2](v6, 0, 0);
      }
    }
    else
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1004, @"Unable to load database");
      ((void (**)(id, void *, void *))v6)[2](v6, 0, v11);
    }
  }
  else
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v10);
  }
}

- (void)getStingWorkflowsWithCompletion:(id)a3
{
  uint64_t v11 = (void (**)(id, void *, void))a3;
  id v4 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v5 = [v4 allowReadAccessToShortcutsLibrary];

  if (v5)
  {
    id v6 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
    id v7 = [v6 database];

    if (v7)
    {
      char v8 = [v7 sortedVisibleWorkflowsWithType:*MEMORY[0x1E4FB4FC8]];
      char v9 = [v8 descriptors];

      id v10 = objc_msgSend(v9, "if_map:", &__block_literal_global_5238);
      v11[2](v11, v10, 0);
    }
    else
    {
      char v9 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1004, @"Unable to load database");
      ((void (**)(id, void *, void *))v11)[2](v11, 0, v9);
    }
  }
  else
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    ((void (**)(id, void *, void *))v11)[2](v11, 0, v7);
  }
}

id __71__VCVoiceShortcutManagerAccessWrapper_getStingWorkflowsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4FB49B8];
  id v3 = a2;
  id v4 = [v2 alloc];
  char v5 = [v3 identifier];
  id v6 = [v3 name];
  uint64_t v7 = [v3 color];
  uint64_t v8 = [v3 glyphCharacter];
  char v9 = [v3 associatedAppBundleIdentifier];

  id v10 = (void *)[v4 initWithIdentifier:v5 name:v6 color:v7 glyphCharacter:v8 associatedAppBundleIdentifier:v9];
  return v10;
}

- (void)getFirstUnsortedWorkflowWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void *, void))a3;
  char v5 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v6 = [v5 allowReadAccessToShortcutsLibrary];

  if (v6)
  {
    uint64_t v7 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
    uint64_t v8 = [v7 database];

    if (v8)
    {
      char v9 = (void *)[objc_alloc(MEMORY[0x1E4FB4A70]) initWithLocation:0];
      [v9 setResultsLimit:1];
      id v10 = [v8 sortedWorkflowsWithQuery:v9];
      uint64_t v11 = [v10 descriptors];
      id v12 = [v11 firstObject];

      if (v12)
      {
        id v13 = objc_alloc(MEMORY[0x1E4FB4A48]);
        id v14 = [v12 identifier];
        uint64_t v15 = [v12 name];
        uint64_t v16 = [v12 color];
        uint64_t v17 = [v12 glyphCharacter];
        id v18 = [v12 associatedAppBundleIdentifier];
        id v19 = (void *)[v13 initWithIdentifier:v14 name:v15 color:v16 glyphCharacter:v17 associatedAppBundleIdentifier:v18];

        id v20 = NSNumber;
        char v21 = [v12 icon];
        id v22 = objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "backgroundColorValue"));

        v4[2](v4, v19, v22, 0);
      }
      else
      {
        uint64_t v23 = getWFWidgetLogObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 136315138;
          uint64_t v25 = "-[VCVoiceShortcutManagerAccessWrapper getFirstUnsortedWorkflowWithCompletion:]";
          _os_log_impl(&dword_1C7D7E000, v23, OS_LOG_TYPE_DEFAULT, "%s Unable to get first unsorted workflow, nothing was returned by the query", (uint8_t *)&v24, 0xCu);
        }

        v4[2](v4, 0, 0, 0);
      }
    }
    else
    {
      char v9 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1004, @"Unable to load database");
      ((void (**)(id, void *, void *, void *))v4)[2](v4, 0, 0, v9);
    }
  }
  else
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    ((void (**)(id, void *, void *, void *))v4)[2](v4, 0, 0, v8);
  }
}

- (void)drawGlyphs:(id)a3 withBackgroundColorValues:(id)a4 padding:(double)a5 rounded:(BOOL)a6 intoContext:(id)a7 completion:(id)a8
{
  BOOL v9 = a6;
  id v18 = (void (**)(void))a8;
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  [v17 drawGlyphs:v16 withBackgroundColorValues:v15 padding:v9 rounded:v14 intoContext:a5];

  v18[2]();
}

- (void)drawGlyphs:(id)a3 withBackgroundColorValues:(id)a4 padding:(double)a5 intoContext:(id)a6 completion:(id)a7
{
}

- (void)sendAceCommandDictionary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v9 = [v8 allowIntentsExtensionDiscovery];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4FB72C0] sharedCoordinator];
    if ([v10 hasPairedDevice])
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __75__VCVoiceShortcutManagerAccessWrapper_sendAceCommandDictionary_completion___block_invoke;
      v12[3] = &unk_1E6540F80;
      id v14 = v7;
      id v13 = v10;
      [v13 sendAceCommandDictionary:v6 completion:v12];
    }
    else
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 9001, @"No paired device");
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
    }
  }
  else
  {
    id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

uint64_t __75__VCVoiceShortcutManagerAccessWrapper_sendAceCommandDictionary_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)createShortcutWithRecordData:(id)a3 name:(id)a4 shortcutSource:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v15 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  id v14 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  [v15 createShortcutWithRecordData:v13 name:v12 shortcutSource:v11 accessSpecifier:v14 completion:v10];
}

- (void)obliterateShortcuts:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  char v5 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v6 = [v5 isRemovalService];

  if (v6)
  {
    id v7 = [(VCVoiceShortcutManagerAccessWrapper *)self syncDataEndpoint];
    uint64_t v8 = [v7 syncDataHandlers];
    char v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = (id)objc_opt_new();
    }
    id v11 = v10;

    id v12 = [VCShortcutsObliterator alloc];
    id v13 = [(VCVoiceShortcutManagerAccessWrapper *)self triggerRegistrar];
    id v14 = [(VCShortcutsObliterator *)v12 initWithTriggerRegistrar:v13 syncDataHandlers:v11];

    id v17 = 0;
    [(VCShortcutsObliterator *)v14 obliterate:&v17];
    id v15 = v17;
    v4[2](v4, v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied (must be called from ShortcutsRemovalService)");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v16);
  }
}

- (void)getOnScreenContentWithOptions:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  char v6 = (void (**)(id, void, WFOnScreenContentManager *))a4;
  id v7 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v8 = [v7 allowReadingOnScreenContent];

  if (v8)
  {
    char v9 = objc_alloc_init(WFOnScreenContentManager);
    [(WFOnScreenContentManager *)v9 getOnScreenContentWithOptions:v10 completionHandler:v6];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    char v9 = (WFOnScreenContentManager *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v9);
  }
}

- (void)getOnScreenContentWithOptions:(id)a3 completion:(id)a4
{
  id v10 = a3;
  char v6 = (void (**)(id, void, WFOnScreenContentManager *))a4;
  id v7 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v8 = [v7 allowReadingOnScreenContent];

  if (v8)
  {
    char v9 = objc_alloc_init(WFOnScreenContentManager);
    [(WFOnScreenContentManager *)v9 getOnScreenContentWithOptions:v10 completion:v6];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    char v9 = (WFOnScreenContentManager *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v9);
  }
}

- (void)getVaultItemsAccessForBackgroundRunner:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  char v5 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v6 = [v5 isBackgroundShortcutRunner];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28FF8]);
    char v8 = WFAssetsDirectory();
    id v17 = (id)[v7 initWithURL:v8 readonly:1];

    char v9 = objc_msgSend(MEMORY[0x1E4F1CB10], "wf_shortcutsDirectoryURL");
    id v10 = [v9 URLByAppendingPathComponent:@"ssh" isDirectory:1];

    id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v12 = [v10 path];
    char v13 = [v11 fileExistsAtPath:v12 isDirectory:0];

    if ((v13 & 1) == 0)
    {
      id v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v14 createDirectoryAtURL:v10 withIntermediateDirectories:0 attributes:0 error:0];
    }
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v10 readonly:0];
    id v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v17, v15, 0, 0);
    v4[2](v4, v16);
  }
  else
  {
    id v17 = (id)objc_opt_new();
    ((void (*)(void (**)(id, void *)))v4[2])(v4);
    id v10 = v4;
  }
}

- (void)deleteTriggerWithIdentifier:(id)a3 completion:(id)a4
{
  id v10 = a3;
  char v6 = (void (**)(id, void, void *))a4;
  id v7 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v8 = [v7 allowWriteAccessForTriggers];

  if (v8)
  {
    char v9 = [(VCVoiceShortcutManagerAccessWrapper *)self triggerRegistrar];
    [v9 deleteTriggerWithIdentifier:v10 completion:v6];
  }
  else
  {
    char v9 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied (no write access to triggers)");
    v6[2](v6, 0, v9);
  }
}

- (void)checkTriggerStateWithKeyPath:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v8 = [v7 allowReadAccessForTriggers];

  if (v8)
  {
    char v9 = [(VCVoiceShortcutManagerAccessWrapper *)self triggerRegistrar];
    id v10 = [v9 coreDuetListener];
    [v10 checkTriggerStateWithKeyPath:v11 completion:v6];

    id v6 = v10;
  }
  else
  {
    char v9 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied (no read access to triggers)");
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v9);
  }
}

- (void)checkTriggerStateWithIdentifier:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v8 = [v7 allowReadAccessForTriggers];

  if (v8)
  {
    char v9 = [(VCVoiceShortcutManagerAccessWrapper *)self triggerRegistrar];
    id v10 = [v9 coreDuetListener];
    [v10 checkTriggerStateWithIdentifier:v11 completion:v6];

    id v6 = v10;
  }
  else
  {
    char v9 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied (no read access to triggers)");
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v9);
  }
}

- (void)fireTriggerWithIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v11 = [v10 allowReadAccessForTriggers];

  if (v11)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __82__VCVoiceShortcutManagerAccessWrapper_fireTriggerWithIdentifier_force_completion___block_invoke;
    v13[3] = &unk_1E6540F58;
    void v13[4] = self;
    id v14 = v8;
    BOOL v16 = a4;
    id v15 = v9;
    dispatch_async(MEMORY[0x1E4F14428], v13);
  }
  else
  {
    id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied (no read access to triggers)");
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v12);
  }
}

void __82__VCVoiceShortcutManagerAccessWrapper_fireTriggerWithIdentifier_force_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) triggerRegistrar];
  [v2 fireTriggerWithIdentifier:*(void *)(a1 + 40) force:*(unsigned __int8 *)(a1 + 56) eventInfo:MEMORY[0x1E4F1CC08] completion:*(void *)(a1 + 48)];
}

- (void)getConfiguredTriggerDescriptionsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  char v5 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v6 = [v5 allowReadAccessForTriggers];

  if (v6)
  {
    id v7 = [(VCVoiceShortcutManagerAccessWrapper *)self triggerRegistrar];
    [v7 getConfiguredTriggerDescriptionsWithCompletion:v4];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied (no read access to triggers)");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0);
  }
}

- (void)unregisterTriggerWithIdentifier:(id)a3 triggerBacking:(int64_t)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t, void))a5;
  id v10 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v11 = [v10 allowWriteAccessForTriggers];

  if (v11)
  {
    id v12 = [(VCVoiceShortcutManagerAccessWrapper *)self triggerRegistrar];
    [v12 unregisterTriggerWithIdentifier:v8 triggerBacking:a4];

    v9[2](v9, 1, 0);
  }
  else
  {
    char v13 = getWFTriggersLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
      int v16 = 136315394;
      id v17 = "-[VCVoiceShortcutManagerAccessWrapper unregisterTriggerWithIdentifier:triggerBacking:completion:]";
      __int16 v18 = 2112;
      id v19 = v14;
      _os_log_impl(&dword_1C7D7E000, v13, OS_LOG_TYPE_ERROR, "%s Denying access to trigger writes for accessSpecifier (%@)", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied (no write access to triggers)");
    v9[2](v9, 0, v15);

    id v9 = (void (**)(id, uint64_t, void))v15;
  }
}

- (void)refreshTriggerWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v9 = [v8 allowWriteAccessForTriggers];

  if (v9)
  {
    id v10 = [(VCVoiceShortcutManagerAccessWrapper *)self triggerRegistrar];
    char v11 = v10;
    if (v6) {
      [v10 registerTriggerWithIdentifier:v6 completion:v7];
    }
    else {
      [v10 registerAllTriggersWithCompletion:v7];
    }
  }
  else
  {
    id v12 = getWFTriggersLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      char v13 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
      int v14 = 136315394;
      uint64_t v15 = "-[VCVoiceShortcutManagerAccessWrapper refreshTriggerWithIdentifier:completion:]";
      __int16 v16 = 2112;
      id v17 = v13;
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_ERROR, "%s Denying access to trigger writes for accessSpecifier (%@)", (uint8_t *)&v14, 0x16u);
    }
    char v11 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied (no write access to triggers)");
    v7[2](v7, 0, v11);
  }
}

- (void)getSiriPodcastsDatabaseURLWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  char v5 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v6 = [v5 allowReadAccessToPodcastsDatabase];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F223C8]);
    uint64_t v8 = *MEMORY[0x1E4FB4B40];
    id v15 = 0;
    char v9 = (void *)[v7 initWithBundleIdentifier:v8 allowPlaceholder:0 error:&v15];
    id v10 = v15;
    if (v9)
    {
      char v11 = [v9 dataContainerURL];
      id v12 = [v11 URLByAppendingPathComponent:@"Documents/PodcastsDB.plist"];

      char v13 = (void *)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v12 readonly:1];
      v4[2](v4, v13, 0);
    }
    else
    {
      id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:underlyingError:", 1001, v10);
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v12);
    }
  }
  else
  {
    int v14 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied (no read access to podcasts database)");
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v14);
  }
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4 inDomain:(id)a5 completionHandler:(id)a6
{
  id v10 = (void (**)(id, BOOL, id))a6;
  id v11 = a5;
  id v12 = a4;
  char v13 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  id v16 = 0;
  BOOL v14 = +[VCGuardedPreferencesManager setInteger:a3 forKey:v12 inDomain:v11 withAccessSpecifier:v13 error:&v16];

  id v15 = v16;
  v10[2](v10, v14, v15);
}

- (void)triggerFullContextualActionReindexWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  [v5 triggerFullContextualActionReindexWithCompletion:v4];
}

- (void)generateSingleUseTokenForWorkflowIdentifier:(id)a3 completion:(id)a4
{
  id v11 = a3;
  char v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v8 = [v7 allowReadAccessToShortcutsLibrary];

  if (v8)
  {
    char v9 = [(VCVoiceShortcutManagerAccessWrapper *)self shareSheetProvider];
    uint64_t v10 = [v9 generateSingleUseTokenForWorkflowIdentifier:v11];
    v6[2](v6, v10, 0);

    char v6 = (void (**)(id, uint64_t, void))v10;
  }
  else
  {
    char v9 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    ((void (**)(id, uint64_t, void *))v6)[2](v6, 0, v9);
  }
}

- (void)getValueForDescriptor:(id)a3 resultClassName:(id)a4 completion:(id)a5
{
  id v13 = a3;
  char v8 = (NSString *)a4;
  char v9 = (void (**)(id, void, void *))a5;
  uint64_t v10 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v11 = [v10 allowReadAccessToShortcutsLibrary];

  if (v11)
  {
    id v12 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
    [v12 getValueForDescriptor:v13 resultClass:NSClassFromString(v8) completion:v9];
  }
  else
  {
    id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    v9[2](v9, 0, v12);
  }
}

- (void)getResultsForQuery:(id)a3 resultClassName:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  char v9 = (NSString *)a4;
  id v10 = a5;
  char v11 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v12 = [v11 allowReadAccessToShortcutsLibrary];

  id v13 = v8;
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v14 = [v13 workflowType];
    if ([v14 isEqualToString:*MEMORY[0x1E4FB4FC0]])
    {
      id v15 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
      char v16 = [v15 allowReadAccessForSleepWorkflows];

      v12 |= v16;
    }

    id v17 = v13;
    if ((v12 & 1) == 0) {
      goto LABEL_6;
    }
  }
  else
  {

    id v17 = 0;
    if ((v12 & 1) == 0)
    {
LABEL_6:
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
      (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0, 0, v18);
      goto LABEL_11;
    }
  }
  id v19 = getWFGeneralLogObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
    char v21 = [v20 bundleIdentifier];
    int v22 = 136315650;
    uint64_t v23 = "-[VCVoiceShortcutManagerAccessWrapper getResultsForQuery:resultClassName:completion:]";
    __int16 v24 = 2112;
    id v25 = v13;
    __int16 v26 = 2112;
    uint64_t v27 = v21;
    _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_INFO, "%s Running query: %@ for client: %@", (uint8_t *)&v22, 0x20u);
  }
  uint64_t v18 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  [v18 getResultsForQuery:v13 resultClass:NSClassFromString(v9) completion:v10];
LABEL_11:
}

- (void)getShareSheetWorkflowsForExtensionMatchingDictionaries:(id)a3 hostBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, id))a5;
  char v11 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v12 = [v11 allowReadAccessToShortcutsLibrary];

  if (v12)
  {
    id v13 = [(VCVoiceShortcutManagerAccessWrapper *)self shareSheetProvider];
    id v17 = 0;
    BOOL v14 = [v13 shareSheetWorkflowsForExtensionMatchingDictionaries:v8 hostBundleIdentifier:v9 error:&v17];
    id v15 = v17;

    v10[2](v10, v14, v15);
  }
  else
  {
    char v16 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    v10[2](v10, 0, v16);
  }
}

- (void)requestDataMigration:(id)a3
{
  id v4 = a3;
  id v5 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  [v5 requestDataMigrationWithCompletion:v4];
}

- (void)describeSyncStateIncludingDeleted:(BOOL)a3 completion:(id)a4
{
  id v8 = a4;
  id v5 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  char v6 = [v5 allowUnrestrictedAccess];

  if (v6)
  {
    (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
  }
  else
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v7);
  }
}

- (void)getShortcutSuggestionsForAllAppsWithLimit:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  id v7 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  [v8 getShortcutSuggestionsForAllAppsWithLimit:a3 accessSpecifier:v7 completion:v6];
}

- (void)getShortcutSuggestionsForAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  [v9 getShortcutSuggestionsForAppWithBundleIdentifier:v7 accessSpecifier:v8 completion:v6];
}

- (void)setShortcutSuggestions:(id)a3 forAppWithBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  [v9 setShortcutSuggestions:v7 forAppWithBundleIdentifier:v6 accessSpecifier:v8];
}

- (void)deleteVoiceShortcutWithIdentifier:(id)a3 name:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  char v11 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  [v12 deleteVoiceShortcutWithIdentifier:v10 name:v9 accessSpecifier:v11 completion:v8];
}

- (void)updateVoiceShortcutWithIdentifier:(id)a3 phrase:(id)a4 shortcut:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v15 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  BOOL v14 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  [v15 updateVoiceShortcutWithIdentifier:v13 phrase:v12 shortcut:v11 accessSpecifier:v14 completion:v10];
}

- (void)addVoiceShortcut:(id)a3 phrase:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  id v11 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  [v12 addVoiceShortcut:v10 phrase:v9 accessSpecifier:v11 completion:v8];
}

- (void)getVoiceShortcutsForAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  v11[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  id v10 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  [v8 getVoiceShortcutsForAppsWithBundleIdentifiers:v9 accessSpecifier:v10 completion:v6];
}

- (void)getVoiceShortcutsWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  id v5 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  [v6 getVoiceShortcutsWithAccessSpecifier:v5 completion:v4];
}

- (void)getVoiceShortcutWithPhrase:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  [v9 getVoiceShortcutWithPhrase:v7 accessSpecifier:v8 completion:v6];
}

- (void)getVoiceShortcutWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  id v8 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  [v9 getVoiceShortcutWithIdentifier:v7 accessSpecifier:v8 completion:v6];
}

- (void)getNumberOfVoiceShortcutsWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(VCVoiceShortcutManagerAccessWrapper *)self voiceShortcutManager];
  id v5 = [(VCVoiceShortcutManagerAccessWrapper *)self accessSpecifier];
  [v6 getNumberOfVoiceShortcutsWithAccessSpecifier:v5 completion:v4];
}

@end