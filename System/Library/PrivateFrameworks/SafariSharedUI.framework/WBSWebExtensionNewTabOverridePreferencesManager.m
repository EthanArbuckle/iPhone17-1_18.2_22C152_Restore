@interface WBSWebExtensionNewTabOverridePreferencesManager
+ (void)migrateStorageToPerProfileFormatIfNecessaryWithDefaults:(id)a3;
- (BOOL)isNewTabPageOverriddenByAnEnabledExtensionInUserDefaults:(id)a3;
- (BOOL)shouldNewTabPageOverriddenByAnEnabledExtensionApplyInPrivateBrowsingWithUserDefaults:(id)a3;
- (WBSWebExtensionNewTabOverridePreferencesManager)initWithExtensionsController:(id)a3;
- (id)_webExtensionOverridingNewTabPageWithDefaults:(id)a3;
- (id)cloudExtensionStateForDefaults:(id)a3;
- (id)extensionComposedIdentifierForNewTabPreferenceInDefaults:(id)a3;
- (id)sortedComposedIdentifiersForExtensionsWithOverridePages;
- (void)clearNewTabBehaviorInDefaults:(id)a3;
- (void)clearNewTabBehaviorInDefaults:(id)a3 fromUserGesture:(BOOL)a4;
- (void)setNewTabBehaviorWithExtensionComposedIdentifier:(id)a3 inDefaults:(id)a4;
- (void)setNewTabBehaviorWithExtensionComposedIdentifier:(id)a3 inDefaults:(id)a4 fromUserGesture:(BOOL)a5;
@end

@implementation WBSWebExtensionNewTabOverridePreferencesManager

- (BOOL)shouldNewTabPageOverriddenByAnEnabledExtensionApplyInPrivateBrowsingWithUserDefaults:(id)a3
{
  p_webExtensionsController = &self->_webExtensionsController;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_webExtensionsController);
  v7 = [(WBSWebExtensionNewTabOverridePreferencesManager *)self _webExtensionOverridingNewTabPageWithDefaults:v5];

  if ([v7 allowedInPrivateBrowsing])
  {
    v8 = [v7 extension];
    char v9 = [WeakRetained extensionIsEnabled:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isNewTabPageOverriddenByAnEnabledExtensionInUserDefaults:(id)a3
{
  v4 = [(WBSWebExtensionNewTabOverridePreferencesManager *)self _webExtensionOverridingNewTabPageWithDefaults:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webExtensionsController);
  v6 = [v4 extension];
  char v7 = [WeakRetained extensionIsEnabled:v6];

  return v7;
}

- (id)_webExtensionOverridingNewTabPageWithDefaults:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webExtensionsController);
  v6 = [WeakRetained profileServerID];
  BOOL v7 = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:v6];

  if (v7)
  {
    v8 = [v4 dictionaryForKey:@"IdentifierOfExtensionWithOverridePageForNewTabs"];
    char v9 = [WeakRetained profileServerID];
    v10 = objc_msgSend(v8, "safari_stringForKey:", v9);
    v11 = [WeakRetained webExtensionForComposedIdentifier:v10];
  }
  else
  {
    v12 = [WeakRetained profile];
    v8 = [v12 settingForKey:*MEMORY[0x1E4F98680]];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 length])
    {
      v11 = [WeakRetained webExtensionForComposedIdentifier:v8];
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (WBSWebExtensionNewTabOverridePreferencesManager)initWithExtensionsController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WBSWebExtensionNewTabOverridePreferencesManager;
  id v5 = [(WBSWebExtensionNewTabOverridePreferencesManager *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webExtensionsController, v4);
    BOOL v7 = v6;
  }

  return v6;
}

+ (void)migrateStorageToPerProfileFormatIfNecessaryWithDefaults:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 stringForKey:@"IdentifierOfExtensionWithOverridePageForNewTabs"];
  id v5 = (void *)v4;
  if (v4)
  {
    uint64_t v7 = *MEMORY[0x1E4F984B8];
    v8[0] = v4;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v3 setValue:v6 forKey:@"IdentifierOfExtensionWithOverridePageForNewTabs"];
  }
}

- (id)sortedComposedIdentifiersForExtensionsWithOverridePages
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webExtensionsController);
  id v3 = [WeakRetained extensions];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __106__WBSWebExtensionNewTabOverridePreferencesManager_sortedComposedIdentifiersForExtensionsWithOverridePages__block_invoke;
  v11[3] = &unk_1E5E46828;
  id v4 = WeakRetained;
  id v12 = v4;
  id v5 = [v3 sortedArrayUsingComparator:v11];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __106__WBSWebExtensionNewTabOverridePreferencesManager_sortedComposedIdentifiersForExtensionsWithOverridePages__block_invoke_2;
  v9[3] = &unk_1E5E46850;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v9);

  return v7;
}

uint64_t __106__WBSWebExtensionNewTabOverridePreferencesManager_sortedComposedIdentifiersForExtensionsWithOverridePages__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 webExtensionForExtension:a2];
  v8 = [v7 displayName];
  objc_super v9 = [*(id *)(a1 + 32) webExtensionForExtension:v6];

  id v10 = [v9 displayName];
  uint64_t v11 = [v8 localizedCompare:v10];

  return v11;
}

id __106__WBSWebExtensionNewTabOverridePreferencesManager_sortedComposedIdentifiersForExtensionsWithOverridePages__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) webExtensionForExtension:v3];
  id v5 = (void *)[v4 newTabOverridePageURL];
  if (v5 && [*(id *)(a1 + 32) extensionIsEnabled:v3])
  {
    id v6 = [v4 composedIdentifier];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)extensionComposedIdentifierForNewTabPreferenceInDefaults:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webExtensionsController);
  id v6 = [WeakRetained profileServerID];
  BOOL v7 = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:v6];

  if (v7)
  {
    v8 = [v4 dictionaryForKey:@"IdentifierOfExtensionWithOverridePageForNewTabs"];
    objc_super v9 = [WeakRetained profileServerID];
    id v10 = [v8 objectForKeyedSubscript:v9];
  }
  else
  {
    uint64_t v11 = [WeakRetained profile];
    v8 = [v11 settingForKey:*MEMORY[0x1E4F98680]];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v8;
    }
    else {
      id v12 = 0;
    }
    id v10 = v12;
  }

  return v10;
}

- (void)setNewTabBehaviorWithExtensionComposedIdentifier:(id)a3 inDefaults:(id)a4
{
}

- (void)setNewTabBehaviorWithExtensionComposedIdentifier:(id)a3 inDefaults:(id)a4 fromUserGesture:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webExtensionsController);
  uint64_t v11 = [WeakRetained profileServerID];
  if (+[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:v11])
  {
    id v12 = [v9 dictionaryForKey:@"IdentifierOfExtensionWithOverridePageForNewTabs"];
    v13 = (void *)[v12 mutableCopy];
    v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v20 = v15;

    [v20 setObject:v8 forKeyedSubscript:v11];
    [v9 setObject:v20 forKey:@"IdentifierOfExtensionWithOverridePageForNewTabs"];
    if ([v11 isEqualToString:*MEMORY[0x1E4F984B8]])
    {
      v21 = [MEMORY[0x1E4F1C9C8] now];
      objc_msgSend(v9, "safari_setDate:forKey:", v21, @"NewTabPageLastModified");

      [v9 setBool:v5 forKey:@"NewTabPageSetByUserGesture"];
      v22 = +[WBSCloudExtensionStateManager sharedManager];
      [v22 localExtensionStateDidChange];
    }
  }
  else
  {
    v16 = [WeakRetained tabGroupManager];
    v17 = [WeakRetained profile];
    v18 = [v17 identifier];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __127__WBSWebExtensionNewTabOverridePreferencesManager_setNewTabBehaviorWithExtensionComposedIdentifier_inDefaults_fromUserGesture___block_invoke;
    v23[3] = &unk_1E5E43FE8;
    id v24 = v8;
    id v19 = (id)[v16 updateProfileWithIdentifier:v18 persist:1 usingBlock:v23 completionHandler:0];
  }
}

void __127__WBSWebExtensionNewTabOverridePreferencesManager_setNewTabBehaviorWithExtensionComposedIdentifier_inDefaults_fromUserGesture___block_invoke(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  id v6 = a2;
  id v4 = [v3 numberWithInteger:6];
  [v6 setSetting:v4 forKey:*MEMORY[0x1E4F98688]];

  if (*(void *)(a1 + 32)) {
    BOOL v5 = *(__CFString **)(a1 + 32);
  }
  else {
    BOOL v5 = &stru_1F031A860;
  }
  [v6 setSetting:v5 forKey:*MEMORY[0x1E4F98680]];
}

- (void)clearNewTabBehaviorInDefaults:(id)a3
{
}

- (void)clearNewTabBehaviorInDefaults:(id)a3 fromUserGesture:(BOOL)a4
{
  BOOL v4 = a4;
  id v17 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webExtensionsController);
  BOOL v7 = [WeakRetained profileServerID];
  if (+[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:v7])
  {
    id v8 = [v17 dictionaryForKey:@"IdentifierOfExtensionWithOverridePageForNewTabs"];
    id v9 = (void *)[v8 mutableCopy];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    id v12 = v11;

    [v12 removeObjectForKey:v7];
    [v17 setValue:v12 forKey:@"IdentifierOfExtensionWithOverridePageForNewTabs"];
    if (![v7 isEqualToString:*MEMORY[0x1E4F984B8]]) {
      goto LABEL_9;
    }
    v16 = [MEMORY[0x1E4F1C9C8] now];
    objc_msgSend(v17, "safari_setDate:forKey:", v16, @"NewTabPageLastModified");

    [v17 setBool:v4 forKey:@"NewTabPageSetByUserGesture"];
    v13 = +[WBSCloudExtensionStateManager sharedManager];
    [v13 localExtensionStateDidChange];
  }
  else
  {
    id v12 = [WeakRetained tabGroupManager];
    v13 = [WeakRetained profile];
    v14 = [v13 identifier];
    id v15 = (id)[v12 updateProfileWithIdentifier:v14 persist:1 usingBlock:&__block_literal_global_64 completionHandler:0];
  }
LABEL_9:
}

uint64_t __97__WBSWebExtensionNewTabOverridePreferencesManager_clearNewTabBehaviorInDefaults_fromUserGesture___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSetting:&stru_1F031A860 forKey:*MEMORY[0x1E4F98680]];
}

- (id)cloudExtensionStateForDefaults:(id)a3
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webExtensionsController);
  id v6 = [WeakRetained profileServerID];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F984B8]];

  if (v7)
  {
    if ([(WBSWebExtensionNewTabOverridePreferencesManager *)self isNewTabPageOverriddenByAnEnabledExtensionInUserDefaults:v4])
    {
      id v8 = [(WBSWebExtensionNewTabOverridePreferencesManager *)self extensionComposedIdentifierForNewTabPreferenceInDefaults:v4];
    }
    else
    {
      id v8 = &stru_1F031A860;
    }
    id v10 = objc_msgSend(v4, "safari_dateForKey:", @"NewTabPageLastModified");
    if (!v10)
    {
      id v10 = [MEMORY[0x1E4F1C9C8] now];
      objc_msgSend(v4, "safari_setDate:forKey:", v10, @"NewTabPageLastModified");
    }
    uint64_t v11 = *MEMORY[0x1E4F987D8];
    v14[0] = *MEMORY[0x1E4F987D0];
    v14[1] = v11;
    v15[0] = v8;
    v15[1] = v10;
    v14[2] = *MEMORY[0x1E4F987E0];
    id v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "BOOLForKey:", @"NewTabPageSetByUserGesture"));
    v15[2] = v12;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v9;
}

- (void).cxx_destruct
{
}

@end