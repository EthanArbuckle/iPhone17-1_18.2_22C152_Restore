@interface SFWebExtensionExtensionWrapper
- (BOOL)allowedInPrivateBrowsing;
- (BOOL)canLoadWithErrorString:(id *)a3;
- (BOOL)isContentBlocker;
- (BOOL)isEnabled;
- (BOOL)isEnabledInAllNamedProfiles;
- (BOOL)isEnabledInProfile:(id)a3;
- (Class)settingsPermissionClass;
- (SFWebExtensionExtensionWrapper)initWithWebExtensionData:(id)a3;
- (id)composedIdentifier;
- (id)containingAppDisplayName;
- (id)displayName;
- (id)enabledNamedProfiles;
- (id)enabledProfiles;
- (id)extension;
- (id)shortName;
- (void)_enableNewTabOverrideExtensionWithPresentingViewController:(id)a3 completionHandler:(id)a4;
- (void)disable;
- (void)enableWithPresentingViewController:(id)a3 completionHandler:(id)a4;
- (void)setAllowedInPrivateBrowsing:(BOOL)a3;
@end

@implementation SFWebExtensionExtensionWrapper

- (SFWebExtensionExtensionWrapper)initWithWebExtensionData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFWebExtensionExtensionWrapper;
  v6 = [(SFWebExtensionExtensionWrapper *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webExtension, a3);
    v8 = v7;
  }

  return v7;
}

- (id)containingAppDisplayName
{
  v2 = [(WBSWebExtensionData *)self->_webExtension extension];
  v3 = objc_msgSend(v2, "safari_localizedContainingAppDisplayName");

  return v3;
}

- (id)displayName
{
  return [(WBSWebExtensionData *)self->_webExtension displayName];
}

- (id)shortName
{
  return [(WBSWebExtensionData *)self->_webExtension displayShortName];
}

- (id)composedIdentifier
{
  return [(WBSWebExtensionData *)self->_webExtension composedIdentifier];
}

- (id)extension
{
  return [(WBSWebExtensionData *)self->_webExtension extension];
}

- (BOOL)isContentBlocker
{
  return 0;
}

- (BOOL)isEnabled
{
  v3 = [(WBSWebExtensionData *)self->_webExtension extensionsController];
  v4 = [(WBSWebExtensionData *)self->_webExtension extension];
  char v5 = [v3 extensionIsEnabled:v4];

  return v5;
}

- (BOOL)canLoadWithErrorString:(id *)a3
{
  return [(WBSWebExtensionData *)self->_webExtension canLoadWithErrorString:a3];
}

- (void)enableWithPresentingViewController:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(WBSWebExtensionData *)self->_webExtension extensionsController];
  webExtension = self->_webExtension;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__SFWebExtensionExtensionWrapper_enableWithPresentingViewController_completionHandler___block_invoke;
  v13[3] = &unk_1E54E9AD8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  [v10 reportCommandShortcutConflictsIfNecessaryForExtension:webExtension presentingViewController:v12 completionHandler:v13];
}

uint64_t __87__SFWebExtensionExtensionWrapper_enableWithPresentingViewController_completionHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) newTabOverridePageURL];

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 56);
    return [v3 _enableNewTabOverrideExtensionWithPresentingViewController:v4 completionHandler:v5];
  }
  else
  {
    id v7 = *(void **)(a1 + 48);
    v8 = [*(id *)(*(void *)(a1 + 32) + 8) extension];
    [v7 setExtension:v8 isEnabled:1];

    [*(id *)(a1 + 32) _postNotificationsToUpdateExtensionState];
    v9 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v9();
  }
}

- (void)_enableNewTabOverrideExtensionWithPresentingViewController:(id)a3 completionHandler:(id)a4
{
  id v29 = a4;
  webExtension = self->_webExtension;
  id v30 = a3;
  id v7 = [(WBSWebExtensionData *)webExtension extensionsController];
  v8 = [v7 profile];
  uint64_t v9 = [v8 kind];
  id v10 = (void *)MEMORY[0x1E4FB1418];
  id v11 = NSString;
  v28 = v8;
  if (v9)
  {
    id v12 = _WBSLocalizedString();
    v13 = [(WBSWebExtensionData *)self->_webExtension displayName];
    id v14 = [v8 title];
    id v15 = objc_msgSend(v11, "stringWithFormat:", v12, v13, v14, v8, v29);
    id v16 = _WBSLocalizedString();
    v17 = [v10 alertControllerWithTitle:v15 message:v16 preferredStyle:1];
  }
  else
  {
    id v12 = _WBSLocalizedString();
    v13 = [(WBSWebExtensionData *)self->_webExtension displayName];
    id v14 = objc_msgSend(v11, "stringWithFormat:", v12, v13);
    id v15 = _WBSLocalizedString();
    v17 = [v10 alertControllerWithTitle:v14 message:v15 preferredStyle:1];
  }

  v18 = (void *)MEMORY[0x1E4FB1410];
  v19 = _WBSLocalizedString();
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __111__SFWebExtensionExtensionWrapper__enableNewTabOverrideExtensionWithPresentingViewController_completionHandler___block_invoke;
  v35[3] = &unk_1E54ECCE8;
  id v20 = v7;
  id v36 = v20;
  v37 = self;
  id v21 = v29;
  id v38 = v21;
  v22 = [v18 actionWithTitle:v19 style:1 handler:v35];
  [v17 addAction:v22];

  v23 = (void *)MEMORY[0x1E4FB1410];
  v24 = _WBSLocalizedString();
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __111__SFWebExtensionExtensionWrapper__enableNewTabOverrideExtensionWithPresentingViewController_completionHandler___block_invoke_2;
  v31[3] = &unk_1E54ECCE8;
  id v32 = v20;
  v33 = self;
  id v34 = v21;
  id v25 = v21;
  id v26 = v20;
  v27 = [v23 actionWithTitle:v24 style:0 handler:v31];

  [v17 addAction:v27];
  [v17 setPreferredAction:v27];
  [v30 presentViewController:v17 animated:1 completion:0];
}

void __111__SFWebExtensionExtensionWrapper__enableNewTabOverrideExtensionWithPresentingViewController_completionHandler___block_invoke(uint64_t a1)
{
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v2 = [*(id *)(a1 + 32) tabOverridePreferencesManager];
  v3 = [v2 extensionComposedIdentifierForNewTabPreferenceInDefaults:v9];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 8) composedIdentifier];
  int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) tabOverridePreferencesManager];
    [v6 clearNewTabBehaviorInDefaults:v9];
  }
  id v7 = *(void **)(a1 + 32);
  v8 = [*(id *)(*(void *)(a1 + 40) + 8) extension];
  [v7 setExtension:v8 isEnabled:1];

  [*(id *)(a1 + 40) _postNotificationsToUpdateExtensionState];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __111__SFWebExtensionExtensionWrapper__enableNewTabOverrideExtensionWithPresentingViewController_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tabOverridePreferencesManager];
  v3 = [*(id *)(*(void *)(a1 + 40) + 8) composedIdentifier];
  uint64_t v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 setNewTabBehaviorWithExtensionComposedIdentifier:v3 inDefaults:v4];

  int v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(*(void *)(a1 + 40) + 8) extension];
  [v5 setExtension:v6 isEnabled:1];

  [*(id *)(a1 + 40) _postNotificationsToUpdateExtensionState];
  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v7();
}

- (void)disable
{
  v3 = [(WBSWebExtensionData *)self->_webExtension extensionsController];
  uint64_t v4 = [(WBSWebExtensionData *)self->_webExtension extension];
  [v3 setExtension:v4 isEnabled:0];

  [(SFExtensionWrapper *)self _postNotificationsToUpdateExtensionState];
}

- (BOOL)allowedInPrivateBrowsing
{
  return [(WBSWebExtensionData *)self->_webExtension allowedInPrivateBrowsing];
}

- (void)setAllowedInPrivateBrowsing:(BOOL)a3
{
  [(WBSWebExtensionData *)self->_webExtension setAllowedInPrivateBrowsing:a3];

  [(SFExtensionWrapper *)self _postNotificationsToUpdateExtensionState];
}

- (id)enabledProfiles
{
  v3 = [(WBSWebExtensionData *)self->_webExtension extensionsController];
  uint64_t v4 = [v3 tabGroupManager];
  int v5 = [v4 profiles];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__SFWebExtensionExtensionWrapper_enabledProfiles__block_invoke;
  v8[3] = &unk_1E54ECCA0;
  v8[4] = self;
  id v6 = objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v8);

  return v6;
}

id __49__SFWebExtensionExtensionWrapper_enabledProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isEnabledInProfile:v3]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)enabledNamedProfiles
{
  id v3 = [(WBSWebExtensionData *)self->_webExtension extensionsController];
  id v4 = [v3 tabGroupManager];
  int v5 = [v4 namedProfiles];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [(SFWebExtensionExtensionWrapper *)self enabledProfiles];
    v8 = objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_146);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __54__SFWebExtensionExtensionWrapper_enabledNamedProfiles__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 kind]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)isEnabledInProfile:(id)a3
{
  webExtension = self->_webExtension;
  id v5 = a3;
  uint64_t v6 = [(WBSWebExtensionData *)webExtension extensionsController];
  id v7 = [v5 identifierForExtensions];

  v8 = [v6 webExtensionsControllerForProfileServerID:v7];

  id v9 = [(WBSWebExtensionData *)self->_webExtension extension];
  LOBYTE(v7) = [v8 extensionIsEnabled:v9];

  return (char)v7;
}

- (BOOL)isEnabledInAllNamedProfiles
{
  id v3 = [(WBSWebExtensionData *)self->_webExtension extensionsController];
  id v4 = [(SFWebExtensionExtensionWrapper *)self enabledNamedProfiles];
  uint64_t v5 = [v4 count];
  uint64_t v6 = [v3 tabGroupManager];
  id v7 = [v6 namedProfiles];
  LOBYTE(v5) = v5 == [v7 count];

  return v5;
}

- (Class)settingsPermissionClass
{
  return NSClassFromString(&cfstr_Safariwebexten.isa);
}

- (void).cxx_destruct
{
}

@end