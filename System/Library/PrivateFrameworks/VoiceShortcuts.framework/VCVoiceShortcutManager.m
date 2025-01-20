@interface VCVoiceShortcutManager
- (BOOL)isPhraseUsable:(id)a3 inDatabase:(id)a4 error:(id *)a5;
- (BOOL)lsDatabaseChangedSinceLastCheck;
- (BOOL)phraseHasHomeKitConflict:(id)a3;
- (HMHomeManager)homeManager;
- (VCVoiceShortcutManager)initWithDatabaseProvider:(id)a3 eventHandler:(id)a4 appShortcutsUpdater:(id)a5 contextualActionSyncService:(id)a6;
- (WFContextualActionSpotlightSyncService)contextualActionSyncService;
- (WFDatabase)database;
- (WFDatabaseProvider)databaseProvider;
- (WFTopHitsAppShortcutsUpdater)appShortcutsUpdater;
- (id)actionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 serializedParameters:(id)a5;
- (id)actionWithSerializedParameters:(id)a3 actionMetadata:(id)a4;
- (void)addVoiceShortcut:(id)a3 phrase:(id)a4 accessSpecifier:(id)a5 completion:(id)a6;
- (void)applicationWasUnregistered:(id)a3;
- (void)archiveAction:(id)a3 withActionMetadata:(id)a4 completion:(id)a5;
- (void)badgeTypeForEntityIdentifier:(id)a3 error:(id *)a4;
- (void)createShortcutWithRecordData:(id)a3 name:(id)a4 shortcutSource:(id)a5 accessSpecifier:(id)a6 completion:(id)a7;
- (void)deleteStaleSuggestions;
- (void)deleteSuggestionsFromApps:(id)a3;
- (void)deleteVoiceShortcutWithIdentifier:(id)a3 name:(id)a4 accessSpecifier:(id)a5 completion:(id)a6;
- (void)drawGlyphs:(id)a3 withBackgroundColorValues:(id)a4 padding:(double)a5 rounded:(BOOL)a6 intoContext:(id)a7;
- (void)getInactiveAppsWithAccessSpecifier:(id)a3 completion:(id)a4;
- (void)getLinkActionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 expandingParameterName:(id)a5 limit:(int64_t)a6 completion:(id)a7;
- (void)getLinkActionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 serializedParameterStates:(id)a5 completion:(id)a6;
- (void)getMigratedAppIntentWithINIntent:(id)a3 completion:(id)a4;
- (void)getNumberOfVoiceShortcutsWithAccessSpecifier:(id)a3 completion:(id)a4;
- (void)getResultsForQuery:(id)a3 resultClass:(Class)a4 completion:(id)a5;
- (void)getSerializedParametersForLinkAction:(id)a3 actionMetadata:(id)a4 completion:(id)a5;
- (void)getShortcutSuggestionsForAllAppsWithLimit:(unint64_t)a3 accessSpecifier:(id)a4 completion:(id)a5;
- (void)getShortcutSuggestionsForAppWithBundleIdentifier:(id)a3 accessSpecifier:(id)a4 completion:(id)a5;
- (void)getSiriAutoShortcutsEnablementForBundleIdentifier:(id)a3 completion:(id)a4;
- (void)getValueForDescriptor:(id)a3 resultClass:(Class)a4 completion:(id)a5;
- (void)getVoiceShortcutWithIdentifier:(id)a3 accessSpecifier:(id)a4 completion:(id)a5;
- (void)getVoiceShortcutWithPhrase:(id)a3 accessSpecifier:(id)a4 completion:(id)a5;
- (void)getVoiceShortcutsForAppsWithBundleIdentifiers:(id)a3 accessSpecifier:(id)a4 completion:(id)a5;
- (void)getVoiceShortcutsWithAccessSpecifier:(id)a3 completion:(id)a4;
- (void)logHomescreenFastPathRunEventForShortcutWithWebClip:(id)a3;
- (void)removeAllSerializedParametersForQueryName:(id)a3 completion:(id)a4;
- (void)requestDataMigrationWithCompletion:(id)a3;
- (void)serializedParametersForAppEntityIdentifier:(id)a3 completion:(id)a4;
- (void)setAppShortcutsUpdater:(id)a3;
- (void)setContextualActionSyncService:(id)a3;
- (void)setPerWorkflowStateData:(id)a3 forSmartPromptWithActionUUID:(id)a4 reference:(id)a5;
- (void)setShortcutSuggestions:(id)a3 forAppWithBundleIdentifier:(id)a4 accessSpecifier:(id)a5;
- (void)setSiriAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 completion:(id)a5;
- (void)storeSerializedParameters:(id)a3 forAppEntityIdentifier:(id)a4 queryName:(id)a5 badgeType:(unint64_t)a6 completion:(id)a7;
- (void)triggerFullContextualActionReindexWithCompletion:(id)a3;
- (void)unarchiveActionFromData:(id)a3 withActionMetadata:(id)a4 completion:(id)a5;
- (void)updateAppShortcutsWithCompletion:(id)a3;
- (void)updateLSDatabaseAnchors;
- (void)updateVoiceShortcutWithIdentifier:(id)a3 phrase:(id)a4 shortcut:(id)a5 accessSpecifier:(id)a6 completion:(id)a7;
@end

@implementation VCVoiceShortcutManager

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualActionSyncService, 0);
  objc_storeStrong((id *)&self->_appShortcutsUpdater, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
}

- (void)setContextualActionSyncService:(id)a3
{
}

- (WFContextualActionSpotlightSyncService)contextualActionSyncService
{
  return self->_contextualActionSyncService;
}

- (void)setAppShortcutsUpdater:(id)a3
{
}

- (WFTopHitsAppShortcutsUpdater)appShortcutsUpdater
{
  return self->_appShortcutsUpdater;
}

- (void)triggerFullContextualActionReindexWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(VCVoiceShortcutManager *)self contextualActionSyncService];
  [v5 reindexAllSearchableItemsWithCompletion:v4];
}

- (void)getSerializedParametersForLinkAction:(id)a3 actionMetadata:(id)a4 completion:(id)a5
{
  id v6 = a5;
  WFLinkActionSerializedParametersForLNAction();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void))a5 + 2))(v6, v7, 0);
}

- (void)getMigratedAppIntentWithINIntent:(id)a3 completion:(id)a4
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, id, void))a4;
  id v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6[2](v6, v7, 0);
    v8 = v7;
  }
  else
  {

    v9 = [MEMORY[0x1E4FB7240] sharedProvider];
    v10 = [v7 launchId];
    v11 = [v7 _className];
    v12 = [v9 customIntentMigratedActionIdentifierWithLaunchId:v10 className:v11];

    if (v12)
    {
      id v13 = objc_alloc(MEMORY[0x1E4FB70C8]);
      v14 = (void *)[v13 initWithActionIdentifier:v12 serializedParameters:MEMORY[0x1E4F1CC08]];
      v38[0] = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
      [v9 createActionsForRequests:v15];

      v35 = v14;
      v16 = [v14 result];
      v36 = v12;
      v37 = v9;
      if (v16)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v17 = v16;
        }
        else {
          v17 = 0;
        }
      }
      else
      {
        v17 = 0;
      }
      id v22 = v17;

      v23 = [v22 serializedParametersForDonatedIntent:v7 allowDroppingUnconfigurableValues:1];
      v24 = (void *)[v22 copyWithSerializedParameters:v23];

      id v25 = objc_alloc(MEMORY[0x1E4F302B8]);
      v26 = [v24 fullyQualifiedLinkActionIdentifier];
      v27 = [v26 bundleIdentifier];
      v28 = [v24 fullyQualifiedLinkActionIdentifier];
      v29 = [v28 actionIdentifier];
      v8 = (void *)[v25 initWithAppBundleIdentifier:v27 appIntentIdentifier:v29 serializedParameters:v23];

      v30 = [v24 metadata];
      v31 = [v30 effectiveBundleIdentifiers];
      v32 = [v31 array];
      v33 = objc_msgSend(v32, "if_firstObjectPassingTest:", &__block_literal_global_382);
      v34 = [v33 bundleIdentifier];
      [v8 _setExtensionBundleId:v34];

      v6[2](v6, v8, 0);
      v12 = v36;
      v9 = v37;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E4F28C58];
      v19 = [v7 _className];
      v20 = [v7 launchId];
      v21 = objc_msgSend(v18, "vc_voiceShortcutErrorWithCode:reason:", 11000, @"Unable to find an app intent matching %@ for %@", v19, v20);

      ((void (**)(id, id, void *))v6)[2](v6, 0, v21);
      v8 = 0;
    }
  }
}

BOOL __70__VCVoiceShortcutManager_getMigratedAppIntentWithINIntent_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 1;
}

- (void)getLinkActionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 expandingParameterName:(id)a5 limit:(int64_t)a6 completion:(id)a7
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v15 = [(VCVoiceShortcutManager *)self actionWithAppBundleIdentifier:v11 appIntentIdentifier:v12 serializedParameters:0];
  v16 = v15;
  if (v15)
  {
    v17 = [v15 linkActionWithSerializedParameters];
    if (v13)
    {
      v18 = [MEMORY[0x1E4FB7240] sharedProvider];
      v49 = [v18 actionMetadataByAppBundleIdentifier:v11 actionIdentifier:v12];
      v19 = [v49 parameters];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __123__VCVoiceShortcutManager_getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke;
      v57[3] = &unk_1E653FE90;
      id v20 = v13;
      id v58 = v20;
      v21 = objc_msgSend(v19, "if_firstObjectPassingTest:", v57);

      if (!v21)
      {
        v36 = getWFAppIntentsLogObject();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v60 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParameterName"
                ":limit:completion:]";
          _os_log_impl(&dword_1C7D7E000, v36, OS_LOG_TYPE_DEFAULT, "%s Request for Link Action but requested expanding parameter not found. Returning the generated link action", buf, 0xCu);
        }

        (*((void (**)(id, void *, void, void))v14 + 2))(v14, v17, 0, 0);
        goto LABEL_36;
      }
      id v46 = v13;
      v48 = v18;
      id v22 = [v21 valueType];
      uint64_t v23 = objc_msgSend(v22, "wf_enumValueType");

      v24 = v21;
      id v25 = [v21 valueType];
      uint64_t v26 = objc_msgSend(v25, "wf_entityValueType");

      v27 = (void *)v23;
      id v47 = (id)v26;
      if (!(v23 | v26))
      {
        v37 = getWFAppIntentsLogObject();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v60 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParameterName"
                ":limit:completion:]";
          _os_log_impl(&dword_1C7D7E000, v37, OS_LOG_TYPE_DEFAULT, "%s Request for Link Action but requested expanding parameter does not support expanding. Returning the generated link action", buf, 0xCu);
        }

        (*((void (**)(id, void *, void, void))v14 + 2))(v14, v17, 0, 0);
        v38 = (void *)v26;
        v18 = v48;
        v21 = v24;
        id v13 = v46;
        goto LABEL_35;
      }
      if (v23)
      {
        v28 = [(id)v23 enumerationIdentifier];
        uint64_t v29 = [v48 enumMetadataByAppBundleIdentifier:v11 enumIdentifier:v28];

        v30 = (void *)v29;
        v21 = v24;
        v44 = v30;
        if (v30)
        {
          v31 = objc_msgSend(v30, "cases", v30);
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __123__VCVoiceShortcutManager_getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke_368;
          v54[3] = &unk_1E653FEB8;
          v45 = (void *)v23;
          id v55 = (id)v23;
          id v56 = v20;
          v32 = objc_msgSend(v31, "if_map:", v54);

          v33 = getWFAppIntentsLogObject();
          id v13 = v46;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v60 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParameterNa"
                  "me:limit:completion:]";
            _os_log_impl(&dword_1C7D7E000, v33, OS_LOG_TYPE_DEFAULT, "%s Request for Link Action with expanded requested expanding parameter not found. Returning the generated link action", buf, 0xCu);
          }

          (*((void (**)(id, void *, void *, void))v14 + 2))(v14, v17, v32, 0);
          v27 = v45;
        }
        else
        {
          v42 = getWFAppIntentsLogObject();
          id v13 = v46;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v60 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParameterNa"
                  "me:limit:completion:]";
            _os_log_impl(&dword_1C7D7E000, v42, OS_LOG_TYPE_DEFAULT, "%s Request for Link Action but could not expand requested expanding parameter not found. Returning the generated link action", buf, 0xCu);
          }

          (*((void (**)(id, void *, void, void))v14 + 2))(v14, v17, 0, 0);
          v27 = (void *)v23;
        }
        v18 = v48;
      }
      else
      {
        v38 = (void *)v26;
        v18 = v48;
        v21 = v24;
        id v13 = v46;
        if (!v47)
        {
LABEL_35:

LABEL_36:
          goto LABEL_37;
        }
        v39 = [v47 identifier];
        v40 = [v48 entityMetadataByAppBundleIdentifier:v11 entityIdentifier:v39];

        if (v40)
        {
          v41 = [v16 parameterForKey:v20];
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __123__VCVoiceShortcutManager_getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke_372;
          v50[3] = &unk_1E653FF08;
          id v53 = v14;
          id v51 = v17;
          id v52 = v20;
          [v16 loadPossibleStatesForEnumeration:v41 searchTerm:0 completionHandler:v50];
        }
        else
        {
          v43 = getWFAppIntentsLogObject();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v60 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParameterNa"
                  "me:limit:completion:]";
            _os_log_impl(&dword_1C7D7E000, v43, OS_LOG_TYPE_DEFAULT, "%s Request for Link Action but could not expand requested expanding parameter not found. Returning the generated link action", buf, 0xCu);
          }

          (*((void (**)(id, void *, void, void))v14 + 2))(v14, v17, 0, 0);
        }
        v27 = 0;

        v18 = v48;
      }
      v38 = v47;
      goto LABEL_35;
    }
    v35 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v60 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParameterName:limit:completion:]";
      _os_log_impl(&dword_1C7D7E000, v35, OS_LOG_TYPE_DEFAULT, "%s Request for Link Action without expanding parameter succeed. Returning the generated link action", buf, 0xCu);
    }

    (*((void (**)(id, void *, void, void))v14 + 2))(v14, v17, 0, 0);
  }
  else
  {
    v34 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v60 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParameterName:limit:completion:]";
      _os_log_impl(&dword_1C7D7E000, v34, OS_LOG_TYPE_DEFAULT, "%s Failed to create a WFLinkAction", buf, 0xCu);
    }

    v17 = VCVoiceShortcutClientArchingError(@"Failed to create LinkAction", 0);
    (*((void (**)(id, void, void, void *))v14 + 2))(v14, 0, 0, v17);
  }
LABEL_37:
}

uint64_t __123__VCVoiceShortcutManager_getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id __123__VCVoiceShortcutManager_getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke_368(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F72E08];
  id v4 = a2;
  id v5 = [v3 alloc];
  id v6 = [v4 identifier];
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = [v4 displayRepresentation];

  v9 = (void *)[v5 initWithValue:v6 valueType:v7 displayRepresentation:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F72D28]) initWithIdentifier:*(void *)(a1 + 40) value:v9];

  return v10;
}

void __123__VCVoiceShortcutManager_getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke_372(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = [a2 allItems];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __123__VCVoiceShortcutManager_getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke_373;
    v7[3] = &unk_1E653FEE0;
    id v8 = *(id *)(a1 + 40);
    id v4 = objc_msgSend(v3, "if_map:", v7);

    id v5 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParameterName:lim"
            "it:completion:]_block_invoke_2";
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Request for Link Action with expanded requested expanding parameter not found. Returning the generated link action", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:expandingParameterName:lim"
            "it:completion:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_DEFAULT, "%s Request for Link Action but could not expand requested expanding parameter not found. Returning the generated link action", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

id __123__VCVoiceShortcutManager_getLinkActionWithAppBundleIdentifier_appIntentIdentifier_expandingParameterName_limit_completion___block_invoke_373(uint64_t a1, void *a2)
{
  v3 = [a2 value];
  id v4 = objc_alloc(MEMORY[0x1E4F72D28]);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [v3 value];
  uint64_t v7 = (void *)[v4 initWithIdentifier:v5 value:v6];

  return v7;
}

- (void)getLinkActionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 serializedParameterStates:(id)a5 completion:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *, void))a6;
  id v14 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315906;
    id v20 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:serializedParameterStates:completion:]";
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_INFO, "%s Creating an app intent representation for %@ (%@) from serialized parameters: %@", (uint8_t *)&v19, 0x2Au);
  }

  v15 = [(VCVoiceShortcutManager *)self actionWithAppBundleIdentifier:v10 appIntentIdentifier:v11 serializedParameters:v12];
  v16 = v15;
  if (v15)
  {
    v17 = [v15 linkActionWithSerializedParameters];
    v13[2](v13, v17, 0);
  }
  else
  {
    v18 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      id v20 = "-[VCVoiceShortcutManager getLinkActionWithAppBundleIdentifier:appIntentIdentifier:serializedParameterStates:completion:]";
      _os_log_impl(&dword_1C7D7E000, v18, OS_LOG_TYPE_DEFAULT, "%s Failed to create a LinkAction", (uint8_t *)&v19, 0xCu);
    }

    v17 = VCVoiceShortcutClientArchingError(@"Failed to create LinkAction", 0);
    ((void (**)(id, void *, void *))v13)[2](v13, 0, v17);
  }
}

- (id)actionWithAppBundleIdentifier:(id)a3 appIntentIdentifier:(id)a4 serializedParameters:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x1E4FB7240];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v7 sharedProvider];
  id v12 = [v10 stringByAppendingString:@"."];

  id v13 = [v12 stringByAppendingString:v9];

  id v14 = (void *)[objc_alloc(MEMORY[0x1E4FB70C8]) initWithActionIdentifier:v13 serializedParameters:v8];
  v20[0] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v11 createActionsForRequests:v15];

  v16 = [v14 result];
  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }
  id v18 = v17;

  [v18 initializeParametersIfNecessary];
  return v18;
}

- (id)actionWithSerializedParameters:(id)a3 actionMetadata:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 effectiveBundleIdentifiers];
  id v9 = [v8 array];
  id v10 = objc_msgSend(v9, "if_firstObjectPassingTest:", &__block_literal_global);

  id v11 = [v10 bundleIdentifier];
  if (v11) {
    goto LABEL_4;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F223A0]);
  id v13 = [v7 effectiveBundleIdentifiers];
  id v14 = [v13 firstObject];
  v15 = [v14 bundleIdentifier];
  id v25 = 0;
  v16 = (void *)[v12 initWithBundleIdentifier:v15 error:&v25];
  id v11 = v25;

  if (v16)
  {
    v17 = objc_msgSend(v16, "if_containingAppRecord");
    uint64_t v18 = [v17 bundleIdentifier];

    id v11 = (id)v18;
LABEL_4:
    int v19 = [v7 identifier];
    id v20 = [(VCVoiceShortcutManager *)self actionWithAppBundleIdentifier:v11 appIntentIdentifier:v19 serializedParameters:v6];
    goto LABEL_5;
  }
  int v19 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = [v7 effectiveBundleIdentifiers];
    __int16 v23 = [v22 firstObject];
    id v24 = [v23 bundleIdentifier];
    *(_DWORD *)buf = 136315394;
    uint64_t v27 = "-[VCVoiceShortcutManager actionWithSerializedParameters:actionMetadata:]";
    __int16 v28 = 2114;
    uint64_t v29 = v24;
    _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Unable to find the bundle record for %{public}@", buf, 0x16u);
  }
  id v20 = 0;
LABEL_5:

  return v20;
}

BOOL __72__VCVoiceShortcutManager_actionWithSerializedParameters_actionMetadata___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 0;
}

- (void)unarchiveActionFromData:(id)a3 withActionMetadata:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  id v10 = (objc_class *)MEMORY[0x1E4F1CA10];
  id v11 = a3;
  id v12 = (void *)[[v10 alloc] initWithData:v11];

  [v12 open];
  id v27 = 0;
  id v13 = [MEMORY[0x1E4F28F98] propertyListWithStream:v12 options:0 format:0 error:&v27];
  id v14 = v27;
  [v12 close];
  if (v13)
  {
    id v15 = v13;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    id v17 = v16;

    uint64_t v18 = [v17 objectForKey:@"SerializedParameters"];

    if (!v18)
    {
      int v19 = getWFAppIntentsLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v29 = "-[VCVoiceShortcutManager unarchiveActionFromData:withActionMetadata:completion:]";
        _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Unrecognized data format", buf, 0xCu);
      }

      id v20 = VCVoiceShortcutClientArchingError(@"Failed to unarchive App Intent", v14);
      v9[2](v9, 0, v20);
    }
    __int16 v21 = [(VCVoiceShortcutManager *)self actionWithSerializedParameters:v18 actionMetadata:v8];
    if (v21)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __80__VCVoiceShortcutManager_unarchiveActionFromData_withActionMetadata_completion___block_invoke;
      v25[3] = &unk_1E653FE48;
      id v26 = v9;
      [v21 getLinkActionForArchivingFallingBackToDefaultValue:0 completionHandler:v25];
      id v22 = v26;
    }
    else
    {
      id v24 = getWFAppIntentsLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v29 = "-[VCVoiceShortcutManager unarchiveActionFromData:withActionMetadata:completion:]";
        _os_log_impl(&dword_1C7D7E000, v24, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Fail to convert to LinkAction", buf, 0xCu);
      }

      id v22 = VCVoiceShortcutClientArchingError(@"Failed to unarchive App Intent", v14);
      v9[2](v9, 0, v22);
    }
  }
  else
  {
    __int16 v23 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v29 = "-[VCVoiceShortcutManager unarchiveActionFromData:withActionMetadata:completion:]";
      _os_log_impl(&dword_1C7D7E000, v23, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Fail to convert incoming data", buf, 0xCu);
    }

    v9[2](v9, 0, v14);
  }
}

void __80__VCVoiceShortcutManager_unarchiveActionFromData_withActionMetadata_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = a3;
    id v8 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      id v10 = "-[VCVoiceShortcutManager unarchiveActionFromData:withActionMetadata:completion:]_block_invoke";
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Fail to process LinkAction", (uint8_t *)&v9, 0xCu);
    }

    id v6 = VCVoiceShortcutClientArchingError(@"Failed to unarchive App Intent", v7);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)archiveAction:(id)a3 withActionMetadata:(id)a4 completion:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = (void (**)(id, void, void *))a5;
  id v10 = a4;
  uint64_t v11 = [v10 parameters];
  uint64_t v12 = [v11 valueForKey:@"name"];

  id v13 = (void *)MEMORY[0x1E4F1C9E8];
  id v14 = [v10 parameters];
  v35 = (void *)v12;
  id v15 = [v13 dictionaryWithObjects:v14 forKeys:v12];

  v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
  id v17 = [v8 parameters];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __70__VCVoiceShortcutManager_archiveAction_withActionMetadata_completion___block_invoke;
  v37[3] = &unk_1E653FE20;
  id v18 = v15;
  id v38 = v18;
  id v19 = v8;
  id v39 = v19;
  id v20 = v16;
  id v40 = v20;
  [v17 enumerateObjectsUsingBlock:v37];

  __int16 v21 = [(VCVoiceShortcutManager *)self actionWithSerializedParameters:v20 actionMetadata:v10];

  if (v21)
  {
    id v34 = v19;
    id v22 = (void *)MEMORY[0x1E4F1CA60];
    v41 = @"SerializedParameters";
    __int16 v23 = [v21 serializedParameters];
    v42 = v23;
    id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    id v25 = [v22 dictionaryWithDictionary:v24];

    id v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v27 = [v26 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D020]];
    if (v27) {
      [v25 setObject:v27 forKeyedSubscript:@"ClientVersion"];
    }
    __int16 v28 = [MEMORY[0x1E4F1CAA8] outputStreamToMemory];
    [v28 open];
    id v36 = 0;
    uint64_t v29 = [MEMORY[0x1E4F28F98] writePropertyList:v25 toStream:v28 format:200 options:0 error:&v36];
    id v30 = v36;
    [v28 close];
    if (v29 <= 0)
    {
      v33 = getWFAppIntentsLogObject();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v44 = "-[VCVoiceShortcutManager archiveAction:withActionMetadata:completion:]";
        _os_log_impl(&dword_1C7D7E000, v33, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Fail to convert action to data", buf, 0xCu);
      }

      v31 = VCVoiceShortcutClientArchingError(@"Failed to archive App Intent", v30);
      v9[2](v9, 0, v31);
    }
    else
    {
      v31 = [v28 propertyForKey:*MEMORY[0x1E4F1C4C0]];
      ((void (**)(id, void *, void *))v9)[2](v9, v31, 0);
    }

    id v19 = v34;
  }
  else
  {
    v32 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[VCVoiceShortcutManager archiveAction:withActionMetadata:completion:]";
      _os_log_impl(&dword_1C7D7E000, v32, OS_LOG_TYPE_DEFAULT, "%s AppIntent Archiving: Fail to convert to LinkAction", buf, 0xCu);
    }

    VCVoiceShortcutClientArchingError(@"Failed to archive App Intent", 0);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v30);
  }
}

void __70__VCVoiceShortcutManager_archiveAction_withActionMetadata_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v15 = v3;
  id v5 = [v3 identifier];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = [v6 valueType];
    id v8 = [*(id *)(a1 + 40) identifier];
    int v9 = objc_msgSend(v7, "wf_parameterDefinitionWithParameterMetadata:actionIdentifier:", v6, v8);

    id v10 = [v15 value];
    uint64_t v11 = [v9 parameterStateFromLinkValue:v10];
    uint64_t v12 = [v11 serializedRepresentation];

    id v13 = *(void **)(a1 + 48);
    id v14 = [v15 identifier];
    [v13 setObject:v12 forKeyedSubscript:v14];
  }
}

- (void)badgeTypeForEntityIdentifier:(id)a3 error:(id *)a4
{
  id v9 = a3;
  id v6 = [(VCVoiceShortcutManager *)self databaseProvider];
  id v7 = [v6 databaseWithError:a4];

  id v8 = (id)[v7 serializedParametersForIdentifier:v9 error:a4];
}

- (void)applicationWasUnregistered:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:@"isPlaceholder"];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    id v8 = getWFGeneralLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [v4 userInfo];
      int v14 = 136315394;
      id v15 = "-[VCVoiceShortcutManager applicationWasUnregistered:]";
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_DEBUG, "%s Ignoring placeholder uninstall event: (%@)", (uint8_t *)&v14, 0x16u);
LABEL_8:
    }
  }
  else
  {
    id v10 = [v4 userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"bundleIDs"];
    id v8 = VCInactiveAppsFromList();

    if (![v8 count])
    {
      id v9 = getWFGeneralLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = [v4 name];
        id v13 = [v4 userInfo];
        int v14 = 136315650;
        id v15 = "-[VCVoiceShortcutManager applicationWasUnregistered:]";
        __int16 v16 = 2112;
        id v17 = v12;
        __int16 v18 = 2112;
        id v19 = v13;
        _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_ERROR, "%s Received (%@) launch event, but no bundle identifiers were supplied. Exiting. UserInfo: (%@)", (uint8_t *)&v14, 0x20u);
      }
      goto LABEL_8;
    }
    [(VCVoiceShortcutManager *)self deleteSuggestionsFromApps:v8];
  }
}

- (void)removeAllSerializedParametersForQueryName:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  id v7 = a3;
  id v8 = [(VCVoiceShortcutManager *)self databaseProvider];
  id v13 = 0;
  id v9 = [v8 databaseWithError:&v13];
  id v10 = v13;

  id v12 = v10;
  [v9 removeAllSerializedParametersForQueryName:v7 error:&v12];

  id v11 = v12;
  v6[2](v6, v11);
}

- (void)storeSerializedParameters:(id)a3 forAppEntityIdentifier:(id)a4 queryName:(id)a5 badgeType:(unint64_t)a6 completion:(id)a7
{
  id v12 = (void (**)(id, id))a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  __int16 v16 = [(VCVoiceShortcutManager *)self databaseProvider];
  id v21 = 0;
  id v17 = [v16 databaseWithError:&v21];
  id v18 = v21;

  id v20 = v18;
  [v17 storeSerializedParameters:v15 forIdentifier:v14 queryName:v13 badgeType:a6 error:&v20];

  id v19 = v20;
  v12[2](v12, v19);
}

- (void)serializedParametersForAppEntityIdentifier:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  id v8 = [(VCVoiceShortcutManager *)self databaseProvider];
  id v14 = 0;
  id v9 = [v8 databaseWithError:&v14];
  id v10 = v14;

  id v13 = v10;
  id v11 = [v9 serializedParametersForIdentifier:v7 error:&v13];

  id v12 = v13;
  v6[2](v6, v11, v12);
}

- (void)updateAppShortcutsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(VCVoiceShortcutManager *)self appShortcutsUpdater];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__VCVoiceShortcutManager_updateAppShortcutsWithCompletion___block_invoke;
  v7[3] = &unk_1E6542188;
  id v8 = v4;
  id v6 = v4;
  [v5 updateWithCompletion:v7];
}

uint64_t __59__VCVoiceShortcutManager_updateAppShortcutsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSiriAutoShortcutsEnablement:(BOOL)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = (void (**)(id, id))a5;
  id v9 = a4;
  id v10 = [(VCVoiceShortcutManager *)self databaseProvider];
  id v15 = 0;
  id v11 = [v10 databaseWithError:&v15];
  id v12 = v15;

  id v14 = v12;
  [v11 setSiriAutoShortcutsEnablement:v6 forBundleIdentifier:v9 source:0 error:&v14];

  id v13 = v14;
  v8[2](v8, v13);
}

- (void)getSiriAutoShortcutsEnablementForBundleIdentifier:(id)a3 completion:(id)a4
{
  BOOL v6 = (void (**)(id, uint64_t, id))a4;
  id v7 = a3;
  id v8 = [(VCVoiceShortcutManager *)self databaseProvider];
  id v14 = 0;
  id v9 = [v8 databaseWithError:&v14];
  id v10 = v14;

  id v13 = v10;
  uint64_t v11 = [v9 isSiriEnabledForAutoShortcutsWithBundleIdentifier:v7 error:&v13];

  id v12 = v13;
  v6[2](v6, v11, v12);
}

- (void)setPerWorkflowStateData:(id)a3 forSmartPromptWithActionUUID:(id)a4 reference:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(VCVoiceShortcutManager *)self databaseProvider];
  id v16 = 0;
  id v12 = [v11 databaseWithError:&v16];
  id v13 = v16;

  id v15 = v13;
  [v12 saveSmartPromptStateData:v10 actionUUID:v9 reference:v8 error:&v15];

  id v14 = v15;
}

- (void)logHomescreenFastPathRunEventForShortcutWithWebClip:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    __int16 v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 844, @"Invalid parameter not satisfying: %@", @"metadata" object file lineNumber description];
  }
  BOOL v6 = [(VCVoiceShortcutManager *)self databaseProvider];
  id v28 = 0;
  id v7 = [v6 databaseWithError:&v28];
  id v8 = v28;

  if (v7)
  {
    id v9 = [v5 shortcutIdentifier];
    id v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"source", @"galleryIdentifier", 0);
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB4698]) initWithIdentifier:v9 objectType:0];
    id v27 = v8;
    id v12 = [v7 recordWithDescriptor:v11 properties:v10 error:&v27];
    id v13 = v27;

    if (v12)
    {
      id v24 = WFHomescreenFastPathRunShortcutEvent(v5, v12, @"RunShortcutStart");
      id v25 = WFHomescreenFastPathRunShortcutEvent(v5, v12, (void *)*MEMORY[0x1E4FB7410]);
      id v14 = WFHomescreenFastPathRunActionEvent(v5, v12, @"RunActionStart");
      WFHomescreenFastPathRunActionEvent(v5, v12, @"RunActionFinish");
      v15 = id v26 = v10;
      [v24 track];
      [v14 track];
      [v12 name];
      id v17 = v16 = v11;
      [v7 uniqueVisibleReferenceForWorkflowName:v17];
      id v18 = v9;
      id v20 = v19 = v13;
      id v21 = (id)[v7 logRunOfWorkflow:v20 withSource:*MEMORY[0x1E4FB4F20] triggerID:0];

      id v13 = v19;
      id v9 = v18;

      uint64_t v11 = v16;
      id v22 = v24;
      [v15 track];
      [v25 track];

      id v10 = v26;
    }
    else
    {
      id v22 = getWFGeneralLogObject();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        id v30 = "-[VCVoiceShortcutManager logHomescreenFastPathRunEventForShortcutWithWebClip:]";
        __int16 v31 = 2112;
        id v32 = v11;
        __int16 v33 = 2112;
        id v34 = v13;
        _os_log_impl(&dword_1C7D7E000, v22, OS_LOG_TYPE_ERROR, "%s Unable to log homescreen run event because there was no record that matched the descriptor: %@, error: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v9 = getWFGeneralLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v30 = "-[VCVoiceShortcutManager logHomescreenFastPathRunEventForShortcutWithWebClip:]";
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_ERROR, "%s Unable to log homescreen run event because database initialization failed: %@", buf, 0x16u);
    }
    id v13 = v8;
  }
}

- (void)createShortcutWithRecordData:(id)a3 name:(id)a4 shortcutSource:(id)a5 accessSpecifier:(id)a6 completion:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_37:
    id v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 757, @"Invalid parameter not satisfying: %@", @"accessSpecifier" object file lineNumber description];

    if (v17) {
      goto LABEL_4;
    }
    goto LABEL_38;
  }
  __int16 v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 756, @"Invalid parameter not satisfying: %@", @"workflowRecordData" object file lineNumber description];

  if (!v16) {
    goto LABEL_37;
  }
LABEL_3:
  if (v17) {
    goto LABEL_4;
  }
LABEL_38:
  uint64_t v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 758, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  if ([v16 allowShortcutImport])
  {
    id v18 = [(VCVoiceShortcutManager *)self databaseProvider];
    id v42 = 0;
    id v19 = [v18 databaseWithError:&v42];
    id v20 = v42;

    if (v19)
    {
      id v39 = VCOSTransactionWithName(@"createShortcutWithRecord");
      id v21 = getWFGeneralLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v44 = "-[VCVoiceShortcutManager createShortcutWithRecordData:name:shortcutSource:accessSpecifier:completion:]";
        _os_log_impl(&dword_1C7D7E000, v21, OS_LOG_TYPE_DEBUG, "%s Deserializing workflow record from data", buf, 0xCu);
      }

      id v41 = 0;
      id v22 = (void *)[objc_alloc(MEMORY[0x1E4FB73A0]) initWithFileData:v13 name:v14 error:&v41];
      id v23 = v41;
      id v24 = v23;
      if (v22)
      {
        id v40 = v23;
        id v25 = [v22 recordRepresentationWithError:&v40];
        id v38 = v40;

        if (v25)
        {
          if (v15) {
            [v25 setSource:v15];
          }
          [v25 addWatchWorkflowTypeIfEligible];
          id v26 = getWFGeneralLogObject();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v44 = "-[VCVoiceShortcutManager createShortcutWithRecordData:name:shortcutSource:accessSpecifier:completion:]";
            __int16 v45 = 2112;
            id v46 = v25;
            _os_log_impl(&dword_1C7D7E000, v26, OS_LOG_TYPE_DEBUG, "%s Creating new shortcut from record (%@)", buf, 0x16u);
          }

          id v36 = (void *)[objc_alloc(MEMORY[0x1E4FB7398]) initWithRecord:v25];
          id v27 = objc_msgSend(v19, "createWorkflowWithOptions:nameCollisionBehavior:error:");
          id v37 = v20;

          id v28 = getWFGeneralLogObject();
          uint64_t v29 = v28;
          if (v27)
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v44 = "-[VCVoiceShortcutManager createShortcutWithRecordData:name:shortcutSource:accessSpecifier:completion:]";
              __int16 v45 = 2112;
              id v46 = v27;
              _os_log_impl(&dword_1C7D7E000, v29, OS_LOG_TYPE_DEBUG, "%s Successfully added shortcut: %@", buf, 0x16u);
            }

            VCVoiceShortcutFromWorkflow(v27, v19, 0, 1, v17);
            id v20 = v37;
          }
          else
          {
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v44 = "-[VCVoiceShortcutManager createShortcutWithRecordData:name:shortcutSource:accessSpecifier:completion:]";
              __int16 v45 = 2112;
              id v46 = v37;
              _os_log_impl(&dword_1C7D7E000, v29, OS_LOG_TYPE_ERROR, "%s Error adding VoiceShortcut: %@", buf, 0x16u);
            }

            id v20 = v37;
            (*((void (**)(id, void, id))v17 + 2))(v17, 0, v37);
          }

          id v24 = v38;
        }
        else
        {
          id v32 = getWFGeneralLogObject();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v44 = "-[VCVoiceShortcutManager createShortcutWithRecordData:name:shortcutSource:accessSpecifier:completion:]";
            __int16 v45 = 2112;
            id v46 = v38;
            _os_log_impl(&dword_1C7D7E000, v32, OS_LOG_TYPE_ERROR, "%s Error creating workflow record: %@", buf, 0x16u);
          }

          id v24 = v38;
          (*((void (**)(id, void, id))v17 + 2))(v17, 0, v38);
        }
      }
      else
      {
        __int16 v31 = getWFGeneralLogObject();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v44 = "-[VCVoiceShortcutManager createShortcutWithRecordData:name:shortcutSource:accessSpecifier:completion:]";
          __int16 v45 = 2112;
          id v46 = v24;
          _os_log_impl(&dword_1C7D7E000, v31, OS_LOG_TYPE_ERROR, "%s Error creating workflow file: %@", buf, 0x16u);
        }

        (*((void (**)(id, void, void *))v17 + 2))(v17, 0, v24);
      }
    }
    else
    {
      (*((void (**)(id, void, id))v17 + 2))(v17, 0, v20);
    }
  }
  else
  {
    id v30 = getWFGeneralLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[VCVoiceShortcutManager createShortcutWithRecordData:name:shortcutSource:accessSpecifier:completion:]";
      __int16 v45 = 2114;
      id v46 = v16;
      _os_log_impl(&dword_1C7D7E000, v30, OS_LOG_TYPE_ERROR, "%s Unauthorized add attempt for shared shortcut with record using accessSpecifier (%{public}@)", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Unauthorized add attempt for shared shortcut with recordusing accessSpecifier (%@)", v16);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v17 + 2))(v17, 0, v20);
  }
}

- (void)requestDataMigrationWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, uint64_t, void))a3;
  if (!v5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 723, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  BOOL v6 = getWFGeneralLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[VCVoiceShortcutManager requestDataMigrationWithCompletion:]";
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_DEFAULT, "%s Data migration requested", buf, 0xCu);
  }

  id v7 = VCOSTransactionWithName(@"voiceShortcutManager.sync.vocabulary");
  v5[2](v5, 1, 0);
  id v8 = [MEMORY[0x1E4F23838] defaultSearchableIndex];
  uint64_t v12 = *MEMORY[0x1E4FB4C00];
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  [v8 deleteSearchableItemsWithDomainIdentifiers:v9 completionHandler:0];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__VCVoiceShortcutManager_requestDataMigrationWithCompletion___block_invoke;
  v11[3] = &unk_1E653FDF8;
  v11[4] = self;
  [MEMORY[0x1E4FB7218] migrateWebClipsIfNeededWithDatabaseAccessor:v11];
  [(VCVoiceShortcutManager *)self requestShortcutsSpotlightFullReindex];
}

id __61__VCVoiceShortcutManager_requestDataMigrationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) databaseProvider];
  id v6 = 0;
  v2 = [v1 databaseWithError:&v6];
  id v3 = v6;

  if (!v2)
  {
    id v4 = getWFGeneralLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v8 = "-[VCVoiceShortcutManager requestDataMigrationWithCompletion:]_block_invoke";
      __int16 v9 = 2114;
      id v10 = v3;
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_ERROR, "%s Error opening database for web clip migration: %{public}@", buf, 0x16u);
    }
  }
  return v2;
}

- (void)getValueForDescriptor:(id)a3 resultClass:(Class)a4 completion:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  __int16 v9 = (void (**)(id, void, void *))a5;
  id v10 = [(VCVoiceShortcutManager *)self databaseProvider];
  id v21 = 0;
  uint64_t v11 = [v10 databaseWithError:&v21];
  id v12 = v21;

  if (v11)
  {
    if ([v8 objectType])
    {
      id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1001, 0);
      v9[2](v9, 0, v13);
    }
    else
    {
      id v14 = [v8 identifier];
      uint64_t v15 = [v11 referenceForWorkflowID:v14];

      if (v15)
      {
        v22[0] = v15;
        id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
        id v17 = [(VCVoiceShortcutManager *)self databaseProvider];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __71__VCVoiceShortcutManager_getValueForDescriptor_resultClass_completion___block_invoke;
        v19[3] = &unk_1E6540FE8;
        id v20 = v9;
        [(objc_class *)a4 getObjectsFromReferences:v16 databaseProvider:v17 completion:v19];

        id v18 = v20;
      }
      else
      {
        id v18 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1002, 0);
        v9[2](v9, 0, v18);
      }
    }
  }
  else
  {
    v9[2](v9, 0, v12);
  }
}

void __71__VCVoiceShortcutManager_getValueForDescriptor_resultClass_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v5 = [a2 firstObject];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
  else
  {
    id v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4);
  }
}

- (void)getResultsForQuery:(id)a3 resultClass:(Class)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(VCVoiceShortcutManager *)self databaseProvider];
  id v25 = 0;
  uint64_t v11 = [v10 databaseWithError:&v25];
  id v12 = v25;

  if (v11)
  {
    id v13 = VCOSTransactionWithName(@"com.apple.shortcuts.fetch");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [v11 sortedWorkflowsWithQuery:v8];
      uint64_t v15 = [v14 descriptors];
      id v16 = [(VCVoiceShortcutManager *)self databaseProvider];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __68__VCVoiceShortcutManager_getResultsForQuery_resultClass_completion___block_invoke;
      v21[3] = &unk_1E65418A0;
      id v24 = v9;
      id v22 = v14;
      id v23 = v13;
      id v17 = v14;
      [(objc_class *)a4 getObjectsFromReferences:v15 databaseProvider:v16 completion:v21];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = [v11 sortedVisibleFolders];
        id v19 = [v18 descriptors];
        id v20 = [v18 state];
        (*((void (**)(id, void *, void *, void))v9 + 2))(v9, v19, v20, 0);
      }
      else
      {
        (*((void (**)(id, void, void, void))v9 + 2))(v9, 0, 0, 0);
      }
    }
  }
  else
  {
    (*((void (**)(id, void, void, id))v9 + 2))(v9, 0, 0, v12);
  }
}

void __68__VCVoiceShortcutManager_getResultsForQuery_resultClass_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = v5;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) state];
    (*(void (**)(uint64_t, id, void *, void))(v6 + 16))(v6, v8, v7, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, void, uint64_t))(v6 + 16))(v6, 0, 0, a3);
  }
}

- (void)updateLSDatabaseAnchors
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v9 = 0;
  id v10 = 0;
  [v2 getKnowledgeUUID:&v10 andSequenceNumber:&v9];
  id v3 = v10;
  id v4 = v9;
  id v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v7 = getWFGeneralLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[VCVoiceShortcutManager updateLSDatabaseAnchors]";
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_ERROR, "%s Unable to fetch LS database state.", buf, 0xCu);
    }
  }
  else
  {
    id v7 = +[VCUserDefaults sharedUserDefaults];
    id v8 = [v3 UUIDString];
    [v7 setObject:v8 forKey:@"VCLSDatabaseUUIDKey"];

    [v7 setObject:v5 forKey:@"VCLSDataSequenceKey"];
  }
}

- (BOOL)lsDatabaseChangedSinceLastCheck
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v16 = 0;
  id v17 = 0;
  [v2 getKnowledgeUUID:&v17 andSequenceNumber:&v16];
  id v3 = v17;
  id v4 = v16;
  id v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    id v8 = getWFGeneralLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[VCVoiceShortcutManager lsDatabaseChangedSinceLastCheck]";
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_ERROR, "%s Unable to fetch LS database state.", buf, 0xCu);
    }
    char v7 = 1;
  }
  else
  {
    id v8 = +[VCUserDefaults sharedUserDefaults];
    id v9 = [v8 stringForKey:@"VCLSDatabaseUUIDKey"];
    uint64_t v10 = [v8 objectForKey:@"VCLSDataSequenceKey"];
    uint64_t v11 = (void *)v10;
    if (v9) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      char v13 = 0;
    }
    else
    {
      id v14 = [v3 UUIDString];
      if ([v9 isEqualToString:v14]) {
        char v13 = [v11 isEqualToNumber:v5];
      }
      else {
        char v13 = 0;
      }
    }
    char v7 = v13 ^ 1;
  }
  return v7;
}

- (void)deleteSuggestionsFromApps:(id)a3
{
  id v4 = a3;
  id v5 = [(VCVoiceShortcutManager *)self database];
  [v5 deleteShortcutSuggestionsFromApps:v4];

  [(VCVoiceShortcutManager *)self updateLSDatabaseAnchors];
}

- (void)deleteStaleSuggestions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(VCVoiceShortcutManager *)self lsDatabaseChangedSinceLastCheck];
  id v5 = getWFGeneralLogObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315138;
      char v13 = "-[VCVoiceShortcutManager deleteStaleSuggestions]";
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEBUG, "%s LS database has changed since last check. Checking for stale suggestions.", buf, 0xCu);
    }

    char v7 = NSStringFromSelector(a2);
    id v8 = VCOSTransactionWithName((uint64_t)v7);

    id v9 = [MEMORY[0x1E4FB4510] accessSpecifierUnrestricted];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__VCVoiceShortcutManager_deleteStaleSuggestions__block_invoke;
    v10[3] = &unk_1E653FDD0;
    v10[4] = self;
    id v11 = v8;
    id v5 = v8;
    [(VCVoiceShortcutManager *)self getInactiveAppsWithAccessSpecifier:v9 completion:v10];
  }
  else if (v6)
  {
    *(_DWORD *)buf = 136315138;
    char v13 = "-[VCVoiceShortcutManager deleteStaleSuggestions]";
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEBUG, "%s LS database has not changed since last check. No stale suggestions to delete.", buf, 0xCu);
  }
}

void __48__VCVoiceShortcutManager_deleteStaleSuggestions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (![v5 count])
  {
    char v7 = getWFGeneralLogObject();
    id v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v13 = 136315394;
        uint64_t v14 = "-[VCVoiceShortcutManager deleteStaleSuggestions]_block_invoke";
        __int16 v15 = 2114;
        id v16 = v6;
        id v9 = "%s Error deleting suggested shortcuts (%{public}@)";
        uint64_t v10 = v8;
        os_log_type_t v11 = OS_LOG_TYPE_ERROR;
        uint32_t v12 = 22;
LABEL_8:
        _os_log_impl(&dword_1C7D7E000, v10, v11, v9, (uint8_t *)&v13, v12);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      uint64_t v14 = "-[VCVoiceShortcutManager deleteStaleSuggestions]_block_invoke";
      id v9 = "%s No stale shortcut suggestions found.";
      uint64_t v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
      uint32_t v12 = 12;
      goto LABEL_8;
    }

    goto LABEL_10;
  }
  [*(id *)(a1 + 32) deleteSuggestionsFromApps:v5];
LABEL_10:
}

- (void)getShortcutSuggestionsForAllAppsWithLimit:(unint64_t)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  os_log_type_t v11 = (void (**)(void, void, void))v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 561, @"Invalid parameter not satisfying: %@", @"accessSpecifier" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 562, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  if ([v9 allowReadAccessToSuggestionsWithBundleIdentifier:0])
  {
    uint32_t v12 = [(VCVoiceShortcutManager *)self databaseProvider];
    id v21 = 0;
    int v13 = [v12 databaseWithError:&v21];
    id v14 = v21;

    if (v13)
    {
      id v20 = v14;
      __int16 v15 = [v13 shortcutSuggestionsForAllAppsWithLimit:a3 shortcutAvailability:0 error:&v20];
      id v16 = v20;

      ((void (**)(void, void *, id))v11)[2](v11, v15, v16);
      id v14 = v16;
    }
    else
    {
      ((void (**)(void, void, id))v11)[2](v11, 0, v14);
    }
  }
  else
  {
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    ((void (**)(void, void, void *))v11)[2](v11, 0, v17);
  }
}

- (void)getShortcutSuggestionsForAppWithBundleIdentifier:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  os_log_type_t v11 = (void (**)(id, void *, id))a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_12:
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 543, @"Invalid parameter not satisfying: %@", @"accessSpecifier" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_13;
  }
  id v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 542, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

  if (!v10) {
    goto LABEL_12;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_13:
  id v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 544, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  if ([v10 allowReadAccessToSuggestionsWithBundleIdentifier:v9])
  {
    uint32_t v12 = [(VCVoiceShortcutManager *)self databaseProvider];
    id v22 = 0;
    int v13 = [v12 databaseWithError:&v22];
    id v14 = v22;

    if (v13)
    {
      id v21 = v14;
      __int16 v15 = [v13 shortcutSuggestionsForAppWithBundleIdentifier:v9 shortcutAvailability:0 error:&v21];
      id v16 = v21;

      v11[2](v11, v15, v16);
      id v14 = v16;
    }
    else
    {
      v11[2](v11, 0, v14);
    }
  }
  else
  {
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Access was denied");
    v11[2](v11, 0, v17);
  }
}

- (void)setShortcutSuggestions:(id)a3 forAppWithBundleIdentifier:(id)a4 accessSpecifier:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_18:
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 515, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_19;
  }
  id v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 514, @"Invalid parameter not satisfying: %@", @"shortcutSuggestions" object file lineNumber description];

  if (!v10) {
    goto LABEL_18;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_19:
  id v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 516, @"Invalid parameter not satisfying: %@", @"accessSpecifier" object file lineNumber description];

LABEL_4:
  if ([v11 allowWriteAccessToSuggestionsWithBundleIdentifier:v10])
  {
    uint32_t v12 = [(VCVoiceShortcutManager *)self databaseProvider];
    id v23 = 0;
    int v13 = [v12 databaseWithError:&v23];
    id v14 = v23;

    if (v13)
    {
      __int16 v15 = VCOSTransactionWithName(@"setVoiceShortcutSuggestions");
      id v22 = v14;
      char v16 = [v13 setShortcutSuggestions:v9 forAppWithBundleIdentifier:v10 error:&v22];
      uint64_t v17 = v22;

      if ((v16 & 1) == 0)
      {
        id v18 = getWFGeneralLogObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          id v25 = "-[VCVoiceShortcutManager setShortcutSuggestions:forAppWithBundleIdentifier:accessSpecifier:]";
          __int16 v26 = 2112;
          id v27 = v17;
          _os_log_impl(&dword_1C7D7E000, v18, OS_LOG_TYPE_ERROR, "%s Unable to set shortcut suggestions. %@", buf, 0x16u);
        }
      }
    }
    else
    {
      __int16 v15 = getWFGeneralLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v25 = "-[VCVoiceShortcutManager setShortcutSuggestions:forAppWithBundleIdentifier:accessSpecifier:]";
        __int16 v26 = 2112;
        id v27 = v14;
        _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_ERROR, "%s Unable to get the database. %@", buf, 0x16u);
      }
      uint64_t v17 = v14;
    }
  }
  else
  {
    uint64_t v17 = getWFGeneralLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      id v25 = "-[VCVoiceShortcutManager setShortcutSuggestions:forAppWithBundleIdentifier:accessSpecifier:]";
      __int16 v26 = 2114;
      id v27 = v10;
      __int16 v28 = 2114;
      id v29 = v11;
      _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_ERROR, "%s Unauthorized write attempt for suggestions for bundleID (%{public}@) using accessSpecifier (%{public}@)", buf, 0x20u);
    }
  }
}

- (void)drawGlyphs:(id)a3 withBackgroundColorValues:(id)a4 padding:(double)a5 rounded:(BOOL)a6 intoContext:(id)a7
{
  id v13 = a4;
  id v14 = a7;
  id v15 = a3;
  uint64_t v16 = [v15 count];
  uint64_t v17 = [v13 count];
  if (v13 && v16 != v17)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 486, @"Background color values and glyph character arrays should be equal in size, or background color values should be nil." object file lineNumber description];
  }
  id v18 = objc_alloc_init(MEMORY[0x1E4FB4A60]);
  [v14 singleImageSize];
  float v19 = a5;
  v26[1] = 3221225472;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[2] = __91__VCVoiceShortcutManager_drawGlyphs_withBackgroundColorValues_padding_rounded_intoContext___block_invoke;
  v26[3] = &unk_1E653FDA8;
  id v27 = v13;
  id v28 = v18;
  BOOL v34 = a6;
  id v29 = v14;
  double v30 = floorf(v19);
  double v31 = v30;
  double v32 = v20 - v30 * 2.0;
  double v33 = v21 - v30 * 2.0;
  id v22 = v14;
  id v23 = v18;
  id v24 = v13;
  [v15 enumerateObjectsUsingBlock:v26];
}

void __91__VCVoiceShortcutManager_drawGlyphs_withBackgroundColorValues_padding_rounded_intoContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (void *)MEMORY[0x1C87C4C10]();
  unsigned __int16 v7 = [v5 integerValue];
  id v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = [v8 objectAtIndexedSubscript:a3];
    uint64_t v10 = [v9 integerValue];
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB4A50]) initWithBackgroundColorValue:v10 glyphCharacter:v7 customImageData:0];
  uint32_t v12 = (void *)[objc_alloc(MEMORY[0x1E4FB4A58]) initWithIcon:v11 drawerContext:*(void *)(a1 + 40)];
  [v12 setDrawBackground:v10 != 0];
  [v12 setRounded:*(unsigned __int8 *)(a1 + 88)];
  id v13 = *(void **)(a1 + 48);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__VCVoiceShortcutManager_drawGlyphs_withBackgroundColorValues_padding_rounded_intoContext___block_invoke_2;
  v16[3] = &unk_1E653FD80;
  id v17 = v13;
  id v18 = v12;
  long long v14 = *(_OWORD *)(a1 + 72);
  long long v19 = *(_OWORD *)(a1 + 56);
  long long v20 = v14;
  id v15 = v12;
  [v17 accessBitmapContextForImageAtIndex:a3 accessBlock:v16];
}

void __91__VCVoiceShortcutManager_drawGlyphs_withBackgroundColorValues_padding_rounded_intoContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc(MEMORY[0x1E4FB45B8]);
  [*(id *)(a1 + 32) scale];
  id v5 = (id)objc_msgSend(v4, "initWithCGContext:scale:", a2);
  objc_msgSend(*(id *)(a1 + 40), "drawInContext:inRect:", v5, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (HMHomeManager)homeManager
{
  homeManager = self->_homeManager;
  if (!homeManager)
  {
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getHMHomeManagerClass_softClass;
    uint64_t v13 = getHMHomeManagerClass_softClass;
    if (!getHMHomeManagerClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getHMHomeManagerClass_block_invoke;
      v9[3] = &unk_1E6541E40;
      v9[4] = &v10;
      __getHMHomeManagerClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    id v6 = (HMHomeManager *)[[v5 alloc] initWithOptions:0];
    unsigned __int16 v7 = self->_homeManager;
    self->_homeManager = v6;

    homeManager = self->_homeManager;
  }
  return homeManager;
}

- (BOOL)isPhraseUsable:(id)a3 inDatabase:(id)a4 error:(id *)a5
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v6 = [a4 visibleReferencesForWorkflowName:a3];
  unsigned __int16 v7 = [v6 firstObject];

  if (v7)
  {
    id v8 = getWFGeneralLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [v7 identifier];
      uint64_t v10 = [v7 name];
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[VCVoiceShortcutManager isPhraseUsable:inDatabase:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      id v25 = v10;
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_DEBUG, "%s Found a local voice shortcut (%@) with the same phrase (%@).", buf, 0x20u);
    }
    id v11 = [v7 identifier];
    uint64_t v12 = NSString;
    id v13 = v7;
    long long v14 = [v13 name];
    id v15 = [v12 stringWithFormat:@"Phrase (%@) is already associated with a voice shortcut.", v14];

    uint64_t v16 = *MEMORY[0x1E4FB4C20];
    *(void *)buf = v11;
    uint64_t v17 = *MEMORY[0x1E4FB4C28];
    v26[0] = v16;
    v26[1] = v17;
    id v18 = [v13 name];
    *(void *)&buf[8] = v18;
    v26[2] = *MEMORY[0x1E4FB4C18];
    long long v19 = [v13 associatedAppBundleIdentifier];

    long long v20 = (void *)*MEMORY[0x1E4FB4BE8];
    if (v19) {
      long long v20 = v19;
    }
    *(void *)&buf[16] = v20;
    double v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v26 count:3];

    id v22 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:extraUserInfo:reason:", 1008, v21, @"%@", v15);

    if (a5) {
      *a5 = v22;
    }
  }
  return v7 == 0;
}

- (BOOL)phraseHasHomeKitConflict:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(VCVoiceShortcutManager *)self homeManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__VCVoiceShortcutManager_phraseHasHomeKitConflict___block_invoke;
  v11[3] = &unk_1E653FD58;
  long long v14 = &v15;
  id v7 = v4;
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  [v6 checkName:v7 inHome:0 withValidationOptions:10 completionHandler:v11];

  dispatch_time_t v9 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v8, v9);
  LOBYTE(v6) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

void __51__VCVoiceShortcutManager_phraseHasHomeKitConflict___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  dispatch_time_t v9 = [v8 domain];
  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v10 = (id *)getHMErrorDomainSymbolLoc_ptr;
  uint64_t v23 = getHMErrorDomainSymbolLoc_ptr;
  if (!getHMErrorDomainSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getHMErrorDomainSymbolLoc_block_invoke;
    id v25 = &unk_1E6541E40;
    __int16 v26 = &v20;
    id v11 = HomeKitLibrary();
    id v12 = dlsym(v11, "HMErrorDomain");
    *(void *)(v26[1] + 24) = v12;
    getHMErrorDomainSymbolLoc_ptr = *(void *)(v26[1] + 24);
    uint64_t v10 = (id *)v21[3];
  }
  _Block_object_dispose(&v20, 8);
  if (!v10)
  {
    char v18 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v19 = [NSString stringWithUTF8String:"NSString *getHMErrorDomain(void)"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"VCVoiceShortcutManager.m", 53, @"%s", dlerror());

    __break(1u);
  }
  id v13 = *v10;
  if ([v9 isEqualToString:v13])
  {
    if ([v8 code] == 31)
    {

LABEL_13:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2 ^ 1;
      goto LABEL_17;
    }
    BOOL v14 = [v8 code] == 95;
  }
  else
  {
    BOOL v14 = 0;
  }

  if (v8) {
    char v15 = v14;
  }
  else {
    char v15 = 1;
  }
  if (v15) {
    goto LABEL_13;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  uint64_t v16 = getWFGeneralLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[VCVoiceShortcutManager phraseHasHomeKitConflict:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2112;
    id v25 = v8;
    _os_log_impl(&dword_1C7D7E000, v16, OS_LOG_TYPE_ERROR, "%s Encountered an error checking conflicting Home scene names for phrase (%@). Assuming no conflict. Error: (%@)", buf, 0x20u);
  }

LABEL_17:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)deleteVoiceShortcutWithIdentifier:(id)a3 name:(id)a4 accessSpecifier:(id)a5 completion:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  char v15 = (void (**)(void, void, void))v14;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 387, @"Invalid parameter not satisfying: %@", @"accessSpecifier" object file lineNumber description];

    if (v15) {
      goto LABEL_3;
    }
  }
  id v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 388, @"Invalid parameter not satisfying: %@", @"outerCompletionHandler" object file lineNumber description];

LABEL_3:
  uint64_t v16 = getWFGeneralLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v37 = "-[VCVoiceShortcutManager deleteVoiceShortcutWithIdentifier:name:accessSpecifier:completion:]";
    __int16 v38 = 2112;
    id v39 = v11;
    _os_log_impl(&dword_1C7D7E000, v16, OS_LOG_TYPE_DEBUG, "%s Deleting VoiceShortcut with id (%@)", buf, 0x16u);
  }

  if ([v13 allowWriteAccessToVoiceShortcuts])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __92__VCVoiceShortcutManager_deleteVoiceShortcutWithIdentifier_name_accessSpecifier_completion___block_invoke;
    aBlock[3] = &unk_1E653FD30;
    uint64_t v17 = (__CFString *)v11;
    double v33 = v17;
    char v18 = (__CFString *)v12;
    BOOL v34 = v18;
    uint64_t v35 = v15;
    long long v19 = (void (**)(void *, void, id))_Block_copy(aBlock);
    uint64_t v20 = [(VCVoiceShortcutManager *)self databaseProvider];
    id v31 = 0;
    double v21 = [v20 databaseWithError:&v31];
    id v22 = v31;

    if (!v21)
    {
      v19[2](v19, 0, v22);
LABEL_24:

      id v25 = v33;
      goto LABEL_25;
    }
    double v30 = VCOSTransactionWithName(@"deleteVoiceShortcut");
    if (v17)
    {
      uint64_t v23 = [v21 referenceForWorkflowID:v17];
    }
    else
    {
      if (!v18) {
        goto LABEL_17;
      }
      uint64_t v23 = [v21 uniqueVisibleReferenceForWorkflowName:v18];
    }
    __int16 v26 = (void *)v23;
    if (v23)
    {
      [v21 deleteReference:v23 error:0];
      v19[2](v19, 1, 0);
LABEL_23:

      goto LABEL_24;
    }
LABEL_17:
    if (v18) {
      uint64_t v27 = v18;
    }
    else {
      uint64_t v27 = v17;
    }
    if (!v27) {
      uint64_t v27 = @"unknown";
    }
    __int16 v26 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1002, @"Voice shortcut with identifier or name (%@) does not exist", v27, v30);
    v19[2](v19, 0, v26);
    goto LABEL_23;
  }
  id v24 = getWFGeneralLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v37 = "-[VCVoiceShortcutManager deleteVoiceShortcutWithIdentifier:name:accessSpecifier:completion:]";
    __int16 v38 = 2114;
    id v39 = v13;
    _os_log_impl(&dword_1C7D7E000, v24, OS_LOG_TYPE_ERROR, "%s Unauthorized delete attempt for voice shortcut using accessSpecifier (%{public}@)", buf, 0x16u);
  }

  id v25 = objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Unauthorized update attempt for voice shortcut using accessSpecifier (%@)", v13);
  ((void (**)(void, void, void *))v15)[2](v15, 0, v25);
LABEL_25:
}

void __92__VCVoiceShortcutManager_deleteVoiceShortcutWithIdentifier_name_accessSpecifier_completion___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = getWFGeneralLogObject();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      id v8 = (void *)a1[4];
      uint64_t v9 = a1[5];
      int v15 = 136315650;
      uint64_t v16 = "-[VCVoiceShortcutManager deleteVoiceShortcutWithIdentifier:name:accessSpecifier:completion:]_block_invoke";
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      uint64_t v10 = "%s Successfully deleted VoiceShortcut with identifier=%@, name=%@";
      id v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_1C7D7E000, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v15 = 136315394;
    uint64_t v16 = "-[VCVoiceShortcutManager deleteVoiceShortcutWithIdentifier:name:accessSpecifier:completion:]_block_invoke";
    __int16 v17 = 2112;
    id v18 = v5;
    uint64_t v10 = "%s Error deleting VoiceShortcut: %@";
    id v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 22;
    goto LABEL_6;
  }

  (*(void (**)(void, uint64_t, id, uint64_t))(a1[6] + 16))(a1[6], a2, v5, v14);
}

- (void)updateVoiceShortcutWithIdentifier:(id)a3 phrase:(id)a4 shortcut:(id)a5 accessSpecifier:(id)a6 completion:(id)a7
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  unint64_t v14 = (unint64_t)a4;
  unint64_t v15 = (unint64_t)a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    if (v16) {
      goto LABEL_3;
    }
LABEL_33:
    double v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 325, @"Invalid parameter not satisfying: %@", @"accessSpecifier" object file lineNumber description];

    if (v17) {
      goto LABEL_4;
    }
    goto LABEL_34;
  }
  id v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 324, @"Invalid parameter not satisfying: %@", @"voiceShortcutIdentifier" object file lineNumber description];

  if (!v16) {
    goto LABEL_33;
  }
LABEL_3:
  if (v17) {
    goto LABEL_4;
  }
LABEL_34:
  double v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 326, @"Invalid parameter not satisfying: %@", @"outerCompletionHandler" object file lineNumber description];

LABEL_4:
  if (!(v14 | v15))
  {
    BOOL v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2 object:self file:@"VCVoiceShortcutManager.m" lineNumber:327 description:@"Pass at least one parameter to update"];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__VCVoiceShortcutManager_updateVoiceShortcutWithIdentifier_phrase_shortcut_accessSpecifier_completion___block_invoke;
  aBlock[3] = &unk_1E65413F8;
  id v18 = v17;
  id v49 = v18;
  __int16 v19 = (void (**)(void *, void, id))_Block_copy(aBlock);
  uint64_t v20 = getWFGeneralLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v51 = "-[VCVoiceShortcutManager updateVoiceShortcutWithIdentifier:phrase:shortcut:accessSpecifier:completion:]";
    __int16 v52 = 2112;
    id v53 = v13;
    _os_log_impl(&dword_1C7D7E000, v20, OS_LOG_TYPE_DEBUG, "%s Updating VoiceShortcut with id (%@)", buf, 0x16u);
  }

  if ([v16 allowWriteAccessToVoiceShortcuts])
  {
    uint64_t v21 = [(VCVoiceShortcutManager *)self databaseProvider];
    id v47 = 0;
    id v22 = [v21 databaseWithError:&v47];
    id v23 = v47;

    if (!v22)
    {
      v19[2](v19, 0, v23);
LABEL_30:

      goto LABEL_31;
    }
    id v24 = VCOSTransactionWithName(@"updateVoiceShortcutWithIdentifier:phrase:");
    uint64_t v25 = [v22 referenceForWorkflowID:v13];
    uint64_t v40 = (void *)v25;
    if (!v25)
    {
      __int16 v26 = VCNotFoundError(v13);
      v19[2](v19, 0, v26);
LABEL_29:

      goto LABEL_30;
    }
    id v36 = self;
    id v39 = v24;
    id v46 = v23;
    __int16 v26 = [MEMORY[0x1E4FB7390] workflowWithReference:v25 database:v22 error:&v46];
    id v27 = v46;

    if (v26)
    {
      if (v14)
      {
        id v45 = v27;
        BOOL v37 = [(VCVoiceShortcutManager *)v36 isPhraseUsable:v14 inDatabase:v22 error:&v45];
        id v23 = v45;

        if (!v37)
        {
          v19[2](v19, 0, v23);
          goto LABEL_28;
        }
        [v26 setName:v14];
      }
      else
      {
        id v23 = v27;
      }
      id v24 = v39;
      if (!v15)
      {
LABEL_25:
        [v26 save];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __103__VCVoiceShortcutManager_updateVoiceShortcutWithIdentifier_phrase_shortcut_accessSpecifier_completion___block_invoke_251;
        v41[3] = &unk_1E653FD08;
        v43 = v19;
        id v42 = v24;
        VCVoiceShortcutFromWorkflow(v40, v22, 1, 0, v41);

        goto LABEL_29;
      }
      id v29 = [MEMORY[0x1E4FB70C0] sharedRegistry];
      id v44 = v23;
      uint64_t v35 = [v29 createActionWithShortcut:v15 error:&v44];
      id v38 = v44;

      if (v35)
      {
        double v30 = [v26 actions];
        [v26 removeActions:v30];

        [v26 addAction:v35];
        id v23 = v38;
        id v24 = v39;
        goto LABEL_25;
      }
      id v23 = v38;
      v19[2](v19, 0, v38);
    }
    else
    {
      v19[2](v19, 0, v27);
      id v23 = v27;
    }
LABEL_28:
    id v24 = v39;
    goto LABEL_29;
  }
  id v28 = getWFGeneralLogObject();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v51 = "-[VCVoiceShortcutManager updateVoiceShortcutWithIdentifier:phrase:shortcut:accessSpecifier:completion:]";
    __int16 v52 = 2114;
    id v53 = v16;
    _os_log_impl(&dword_1C7D7E000, v28, OS_LOG_TYPE_ERROR, "%s Unauthorized update attempt for voice shortcut using accessSpecifier (%{public}@)", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Unauthorized update attempt for voice shortcut using accessSpecifier (%@)", v16);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  v19[2](v19, 0, v23);
LABEL_31:
}

void __103__VCVoiceShortcutManager_updateVoiceShortcutWithIdentifier_phrase_shortcut_accessSpecifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = getWFGeneralLogObject();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315394;
      unint64_t v14 = "-[VCVoiceShortcutManager updateVoiceShortcutWithIdentifier:phrase:shortcut:accessSpecifier:completion:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v5;
      uint64_t v9 = "%s Successfully updated VoiceShortcut %@";
      uint64_t v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
LABEL_6:
      _os_log_impl(&dword_1C7D7E000, v10, v11, v9, (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136315394;
    unint64_t v14 = "-[VCVoiceShortcutManager updateVoiceShortcutWithIdentifier:phrase:shortcut:accessSpecifier:completion:]_block_invoke";
    __int16 v15 = 2112;
    id v16 = v6;
    uint64_t v9 = "%s Error updating VoiceShortcut: %@";
    uint64_t v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5, v6, v12);
}

uint64_t __103__VCVoiceShortcutManager_updateVoiceShortcutWithIdentifier_phrase_shortcut_accessSpecifier_completion___block_invoke_251(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)addVoiceShortcut:(id)a3 phrase:(id)a4 accessSpecifier:(id)a5 completion:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    id v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 271, @"Invalid parameter not satisfying: %@", @"shortcut" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  BOOL v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 272, @"Invalid parameter not satisfying: %@", @"accessSpecifier" object file lineNumber description];

LABEL_3:
  if ([v13 allowWriteAccessToVoiceShortcuts])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__VCVoiceShortcutManager_addVoiceShortcut_phrase_accessSpecifier_completion___block_invoke;
    aBlock[3] = &unk_1E65413F8;
    id v47 = v14;
    __int16 v15 = _Block_copy(aBlock);
    id v16 = [(VCVoiceShortcutManager *)self databaseProvider];
    id v45 = 0;
    uint64_t v17 = [v16 databaseWithError:&v45];
    id v18 = v45;

    if (v17)
    {
      __int16 v19 = VCOSTransactionWithName(@"addVoiceShortcut:phrase:");
      id v44 = 0;
      BOOL v20 = [(VCVoiceShortcutManager *)self isPhraseUsable:v12 inDatabase:v17 error:&v44];
      id v21 = v44;
      if (v20)
      {
        id v41 = v12;
        id v22 = [MEMORY[0x1E4FB70C0] sharedRegistry];
        id v43 = v18;
        id v23 = [v22 createActionWithShortcut:v11 error:&v43];
        id v40 = v43;

        if (v23)
        {
          id v38 = v21;
          id v39 = v19;
          id v24 = objc_alloc_init(MEMORY[0x1E4FB7390]);
          [v24 setWorkflowTypes:MEMORY[0x1E4F1CBF0]];
          uint64_t v25 = [v24 record];
          [v25 setName:v41];

          [v24 addAction:v23];
          __int16 v26 = [v24 record];
          [v26 addWatchWorkflowTypeIfEligible];

          id v27 = objc_alloc(MEMORY[0x1E4FB7398]);
          id v28 = [v24 record];
          id v29 = (void *)[v27 initWithRecord:v28];

          id v42 = v40;
          double v30 = [v17 createWorkflowWithOptions:v29 error:&v42];
          id v18 = v42;

          if (v30) {
            VCVoiceShortcutFromWorkflow(v30, v17, 1, 0, v15);
          }
          else {
            (*((void (**)(void *, void, id))v15 + 2))(v15, 0, v18);
          }

          id v21 = v38;
          __int16 v19 = v39;
        }
        else
        {
          id v18 = v40;
          (*((void (**)(void *, void, id))v15 + 2))(v15, 0, v40);
        }

        id v12 = v41;
      }
      else
      {
        (*((void (**)(void *, void, id))v15 + 2))(v15, 0, v21);
      }
    }
    else
    {
      (*((void (**)(void *, void, id))v15 + 2))(v15, 0, v18);
    }

    BOOL v34 = v47;
  }
  else
  {
    id v31 = getWFGeneralLogObject();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      double v32 = [v11 _associatedAppBundleIdentifier];
      *(_DWORD *)buf = 136315650;
      id v49 = "-[VCVoiceShortcutManager addVoiceShortcut:phrase:accessSpecifier:completion:]";
      __int16 v50 = 2114;
      id v51 = v32;
      __int16 v52 = 2114;
      id v53 = v13;
      _os_log_impl(&dword_1C7D7E000, v31, OS_LOG_TYPE_ERROR, "%s Unauthorized add attempt for voice shortcut with bundleID (%{public}@) using accessSpecifier (%{public}@)", buf, 0x20u);
    }
    double v33 = (void *)MEMORY[0x1E4F28C58];
    BOOL v34 = [v11 _associatedAppBundleIdentifier];
    uint64_t v35 = objc_msgSend(v33, "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Unauthorized add attempt for voice shortcut with bundleID (%@) using accessSpecifier (%@)", v34, v13);
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v35);
  }
}

void __77__VCVoiceShortcutManager_addVoiceShortcut_phrase_accessSpecifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = getWFGeneralLogObject();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315394;
      id v14 = "-[VCVoiceShortcutManager addVoiceShortcut:phrase:accessSpecifier:completion:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v5;
      uint64_t v9 = "%s Successfully created %@";
      uint64_t v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
LABEL_6:
      _os_log_impl(&dword_1C7D7E000, v10, v11, v9, (uint8_t *)&v13, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136315394;
    id v14 = "-[VCVoiceShortcutManager addVoiceShortcut:phrase:accessSpecifier:completion:]_block_invoke";
    __int16 v15 = 2112;
    id v16 = v6;
    uint64_t v9 = "%s Error creating VoiceShortcut: %@";
    uint64_t v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  (*(void (**)(void, id, id, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5, v6, v12);
}

- (void)getInactiveAppsWithAccessSpecifier:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 240, @"Invalid parameter not satisfying: %@", @"accessSpecifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 241, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  uint64_t v10 = getWFGeneralLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v37 = "-[VCVoiceShortcutManager getInactiveAppsWithAccessSpecifier:completion:]";
    _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEBUG, "%s Get inactive apps", buf, 0xCu);
  }

  if ([v7 allowUnrestrictedAccess])
  {
    os_log_type_t v11 = [(VCVoiceShortcutManager *)self databaseProvider];
    id v34 = 0;
    uint64_t v12 = [v11 databaseWithError:&v34];
    id v13 = v34;

    if (v12)
    {
      id v28 = VCOSTransactionWithName(@"getInactiveAppsWithAccessSpecifier");
      id v33 = v13;
      id v14 = VCWorkflowReferencesForAccessSpecifier(v12, v7, &v33);
      id v15 = v33;

      id v16 = objc_opt_new();
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v17 = v14;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v30;
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v30 != v20) {
              objc_enumerationMutation(v17);
            }
            id v22 = [*(id *)(*((void *)&v29 + 1) + 8 * v21) associatedAppBundleIdentifier];
            if (v22) {
              [v16 addObject:v22];
            }

            ++v21;
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v35 count:16];
        }
        while (v19);
      }

      id v23 = [v16 allObjects];
      id v24 = VCInactiveAppsFromList();
      ((void (**)(void, void *, id))v9)[2](v9, v24, v15);
    }
    else
    {
      ((void (**)(void, void, id))v9)[2](v9, 0, v13);
      id v15 = v13;
    }
  }
  else
  {
    uint64_t v25 = getWFGeneralLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v37 = "-[VCVoiceShortcutManager getInactiveAppsWithAccessSpecifier:completion:]";
      __int16 v38 = 2114;
      id v39 = v7;
      _os_log_impl(&dword_1C7D7E000, v25, OS_LOG_TYPE_ERROR, "%s Unauthorized attempt to access voice shortcut apps using accessSpecifier (%{public}@)", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1011, @"Unauthorized attempt to access voice shortcut enabled apps using accessSpecifier %@", v7);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, id))v9)[2](v9, 0, v15);
  }
}

- (void)getVoiceShortcutsForAppsWithBundleIdentifiers:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_14:
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 213, @"Invalid parameter not satisfying: %@", @"accessSpecifier" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 212, @"Invalid parameter not satisfying: %@", @"bundleIdentifiers" object file lineNumber description];

  if (!v10) {
    goto LABEL_14;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_15:
  uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 214, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  uint64_t v12 = getWFGeneralLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v28 = "-[VCVoiceShortcutManager getVoiceShortcutsForAppsWithBundleIdentifiers:accessSpecifier:completion:]";
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_DEBUG, "%s Get VoiceShortcuts for apps with bundle IDs = %@", buf, 0x16u);
  }

  if ([v9 count])
  {
    id v13 = [(VCVoiceShortcutManager *)self databaseProvider];
    id v26 = 0;
    id v14 = [v13 databaseWithError:&v26];
    id v15 = v26;

    if (v14)
    {
      id v16 = VCOSTransactionWithName(@"getVoiceShortcutsForAppsWithBundleIdentifiers");
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __99__VCVoiceShortcutManager_getVoiceShortcutsForAppsWithBundleIdentifiers_accessSpecifier_completion___block_invoke;
      v24[3] = &unk_1E653FCE0;
      id v25 = v14;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __99__VCVoiceShortcutManager_getVoiceShortcutsForAppsWithBundleIdentifiers_accessSpecifier_completion___block_invoke_3;
      v21[3] = &unk_1E6540A20;
      id v22 = v16;
      id v23 = v11;
      id v17 = v16;
      objc_msgSend(v9, "if_flatMapAsynchronously:completionHandler:", v24, v21);
    }
    else
    {
      (*((void (**)(id, void, id))v11 + 2))(v11, 0, v15);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "vc_voiceShortcutErrorWithCode:reason:", 1007, @"bundleIdentifiers are needed");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v15);
  }
}

void __99__VCVoiceShortcutManager_getVoiceShortcutsForAppsWithBundleIdentifiers_accessSpecifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = [*(id *)(a1 + 32) sortedVisibleWorkflowsWithAssociatedAppBundleIdentifier:a2];
  id v8 = [v7 descriptors];
  id v9 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __99__VCVoiceShortcutManager_getVoiceShortcutsForAppsWithBundleIdentifiers_accessSpecifier_completion___block_invoke_2;
  v11[3] = &unk_1E6540FE8;
  id v12 = v6;
  id v10 = v6;
  VCVoiceShortcutsFromWorkflows(v8, v9, 0, (uint64_t)v11);
}

uint64_t __99__VCVoiceShortcutManager_getVoiceShortcutsForAppsWithBundleIdentifiers_accessSpecifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __99__VCVoiceShortcutManager_getVoiceShortcutsForAppsWithBundleIdentifiers_accessSpecifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getVoiceShortcutsWithAccessSpecifier:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 187, @"Invalid parameter not satisfying: %@", @"accessSpecifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 188, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  id v10 = getWFGeneralLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v26 = "-[VCVoiceShortcutManager getVoiceShortcutsWithAccessSpecifier:completion:]";
    _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEBUG, "%s Get all VoiceShortcuts", buf, 0xCu);
  }

  id v11 = [(VCVoiceShortcutManager *)self databaseProvider];
  id v24 = 0;
  id v12 = [v11 databaseWithError:&v24];
  id v13 = v24;

  if (v12)
  {
    id v14 = VCOSTransactionWithName(@"getVoiceShortcutsWithAccessSpecifier");
    char v15 = [v7 allowUnrestrictedAccess];
    id v23 = v13;
    id v16 = VCWorkflowReferencesForAccessSpecifier(v12, v7, &v23);
    id v17 = v23;

    if (v17)
    {
      ((void (**)(void, void, id))v9)[2](v9, 0, v17);
    }
    else
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      void v20[2] = __74__VCVoiceShortcutManager_getVoiceShortcutsWithAccessSpecifier_completion___block_invoke;
      v20[3] = &unk_1E6540A20;
      id v22 = v9;
      id v21 = v14;
      VCVoiceShortcutsFromWorkflows(v16, v12, v15 ^ 1, (uint64_t)v20);
    }
  }
  else
  {
    ((void (**)(void, void, id))v9)[2](v9, 0, v13);
    id v17 = v13;
  }
}

uint64_t __74__VCVoiceShortcutManager_getVoiceShortcutsWithAccessSpecifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getVoiceShortcutWithPhrase:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_14:
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 160, @"Invalid parameter not satisfying: %@", @"accessSpecifier" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 159, @"Invalid parameter not satisfying: %@", @"phrase" object file lineNumber description];

  if (!v10) {
    goto LABEL_14;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_15:
  id v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 161, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  id v12 = getWFGeneralLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v29 = "-[VCVoiceShortcutManager getVoiceShortcutWithPhrase:accessSpecifier:completion:]";
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_DEBUG, "%s Get VoiceShortcut with phrase (%@)", buf, 0x16u);
  }

  id v13 = [(VCVoiceShortcutManager *)self databaseProvider];
  id v27 = 0;
  id v14 = [v13 databaseWithError:&v27];
  id v15 = v27;

  if (v14)
  {
    id v16 = VCOSTransactionWithName(@"getVoiceShortcutWithPhrase");
    id v17 = [v14 uniqueVisibleReferenceForWorkflowName:v9];
    if (v17)
    {
      char v18 = [v10 allowReadAccessToShortcutsLibrary];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __80__VCVoiceShortcutManager_getVoiceShortcutWithPhrase_accessSpecifier_completion___block_invoke;
      v23[3] = &unk_1E653FCB8;
      id v26 = v11;
      id v24 = v9;
      id v25 = v16;
      VCVoiceShortcutFromWorkflow(v17, v14, 1, v18, v23);

      uint64_t v19 = v26;
    }
    else
    {
      uint64_t v19 = VCNotFoundByPhraseError(v9);
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v19);
    }
  }
  else
  {
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v15);
  }
}

void __80__VCVoiceShortcutManager_getVoiceShortcutWithPhrase_accessSpecifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (a3)
  {
    VCNotFoundByPhraseError(*(void **)(a1 + 32));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v6);
  }
  else
  {
    id v4 = *(void (**)(uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 48);
    v4(v5);
  }
}

- (void)getVoiceShortcutWithIdentifier:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_14:
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 127, @"Invalid parameter not satisfying: %@", @"accessSpecifier" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 126, @"Invalid parameter not satisfying: %@", @"voiceShortcutIdentifier" object file lineNumber description];

  if (!v10) {
    goto LABEL_14;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_15:
  id v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 128, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_4:
  id v12 = getWFGeneralLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v29 = "-[VCVoiceShortcutManager getVoiceShortcutWithIdentifier:accessSpecifier:completion:]";
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_DEBUG, "%s Get VoiceShortcut with id (%@)", buf, 0x16u);
  }

  id v13 = [(VCVoiceShortcutManager *)self databaseProvider];
  id v27 = 0;
  id v14 = [v13 databaseWithError:&v27];
  id v15 = v27;

  if (v14)
  {
    id v16 = VCOSTransactionWithName(@"getVoiceShortcutsWithIdentifier");
    id v17 = [v14 referenceForWorkflowID:v9];
    if (v17)
    {
      char v18 = [v10 allowReadAccessToShortcutsLibrary];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __84__VCVoiceShortcutManager_getVoiceShortcutWithIdentifier_accessSpecifier_completion___block_invoke;
      v23[3] = &unk_1E653FCB8;
      id v26 = v11;
      id v24 = v9;
      id v25 = v16;
      VCVoiceShortcutFromWorkflow(v17, v14, 1, v18, v23);

      uint64_t v19 = v26;
    }
    else
    {
      uint64_t v19 = VCNotFoundError(v9);
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v19);
    }
  }
  else
  {
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v15);
  }
}

void __84__VCVoiceShortcutManager_getVoiceShortcutWithIdentifier_accessSpecifier_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (a3)
  {
    VCNotFoundError(*(void **)(a1 + 32));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v6);
  }
  else
  {
    id v4 = *(void (**)(uint64_t))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 48);
    v4(v5);
  }
}

- (void)getNumberOfVoiceShortcutsWithAccessSpecifier:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    char v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 100, @"Invalid parameter not satisfying: %@", @"accessSpecifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 101, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  id v10 = getWFGeneralLogObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = "-[VCVoiceShortcutManager getNumberOfVoiceShortcutsWithAccessSpecifier:completion:]";
    _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEBUG, "%s Get number of voice shortcuts", buf, 0xCu);
  }

  id v11 = [(VCVoiceShortcutManager *)self databaseProvider];
  id v20 = 0;
  id v12 = [v11 databaseWithError:&v20];
  id v13 = v20;

  if (v12)
  {
    if ([v7 allowUnrestrictedAccess])
    {
      id v14 = [v12 sortedVisibleWorkflowsByName];
    }
    else
    {
      id v15 = [v7 associatedAppBundleIdentifier];
      id v14 = [v12 sortedVisibleWorkflowsWithAssociatedAppBundleIdentifier:v15];
    }
    uint64_t v16 = [v14 count];
    id v17 = [v14 fetchError];
    ((void (**)(void, uint64_t, void *))v9)[2](v9, v16, v17);
  }
  else
  {
    ((void (**)(void, void, id))v9)[2](v9, 0, v13);
  }
}

- (WFDatabase)database
{
  uint64_t v2 = [(VCVoiceShortcutManager *)self databaseProvider];
  uint64_t v3 = [v2 databaseWithError:0];

  return (WFDatabase *)v3;
}

- (VCVoiceShortcutManager)initWithDatabaseProvider:(id)a3 eventHandler:(id)a4 appShortcutsUpdater:(id)a5 contextualActionSyncService:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v12)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"VCVoiceShortcutManager.m", 79, @"Invalid parameter not satisfying: %@", @"databaseProvider" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)VCVoiceShortcutManager;
  uint64_t v16 = [(VCVoiceShortcutManager *)&v21 init];
  id v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_databaseProvider, a3);
    objc_storeStrong((id *)&v17->_appShortcutsUpdater, a5);
    objc_storeStrong((id *)&v17->_contextualActionSyncService, a6);
    [v13 addObserver:v17 selector:sel_applicationWasUnregistered_ name:@"ApplicationUnregistered"];
    char v18 = v17;
  }

  return v17;
}

@end