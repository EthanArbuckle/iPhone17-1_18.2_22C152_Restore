@interface SFContentBlockerExtensionWrapper
- (BOOL)allowedInPrivateBrowsing;
- (BOOL)canLoadWithErrorString:(id *)a3;
- (BOOL)isContentBlocker;
- (BOOL)isEnabled;
- (BOOL)isEnabledInAllNamedProfiles;
- (BOOL)isEnabledInProfile:(id)a3;
- (Class)settingsPermissionClass;
- (SFContentBlockerExtensionWrapper)initWithExtension:(id)a3 contentBlockerManager:(id)a4;
- (id)composedIdentifier;
- (id)containingAppDisplayName;
- (id)displayName;
- (id)enabledNamedProfiles;
- (id)enabledProfiles;
- (id)extension;
- (id)shortName;
- (void)disable;
- (void)enableWithPresentingViewController:(id)a3 completionHandler:(id)a4;
- (void)setAllowedInPrivateBrowsing:(BOOL)a3;
@end

@implementation SFContentBlockerExtensionWrapper

- (SFContentBlockerExtensionWrapper)initWithExtension:(id)a3 contentBlockerManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SFContentBlockerExtensionWrapper;
  v9 = [(SFContentBlockerExtensionWrapper *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extension, a3);
    objc_storeStrong((id *)&v10->_contentBlockerManager, a4);
    v11 = v10;
  }

  return v10;
}

- (id)containingAppDisplayName
{
  return (id)[(NSExtension *)self->_extension safari_localizedContainingAppDisplayName];
}

- (id)displayName
{
  return (id)[(SFContentBlockerManager *)self->_contentBlockerManager displayNameForExtension:self->_extension];
}

- (id)shortName
{
  return 0;
}

- (id)composedIdentifier
{
  v3 = [(SFContentBlockerManager *)self->_contentBlockerManager webExtensionsController];
  v4 = [v3 composedIdentifierForExtensionStateForExtension:self->_extension];

  return v4;
}

- (id)extension
{
  return self->_extension;
}

- (BOOL)isContentBlocker
{
  return 1;
}

- (BOOL)isEnabled
{
  return [(SFContentBlockerManager *)self->_contentBlockerManager extensionIsEnabled:self->_extension];
}

- (BOOL)canLoadWithErrorString:(id *)a3
{
  return 1;
}

- (void)enableWithPresentingViewController:(id)a3 completionHandler:(id)a4
{
  contentBlockerManager = self->_contentBlockerManager;
  extension = self->_extension;
  id v7 = (void (**)(void))a4;
  [(SFContentBlockerManager *)contentBlockerManager setExtension:extension isEnabled:1 byUserGesture:1];
  [(SFExtensionWrapper *)self _postNotificationsToUpdateExtensionState];
  v7[2]();
}

- (void)disable
{
  [(SFContentBlockerManager *)self->_contentBlockerManager setExtension:self->_extension isEnabled:0 byUserGesture:1];

  [(SFExtensionWrapper *)self _postNotificationsToUpdateExtensionState];
}

- (BOOL)allowedInPrivateBrowsing
{
  return [(SFContentBlockerManager *)self->_contentBlockerManager isContentBlockerAllowedInPrivateBrowsing:self->_extension];
}

- (void)setAllowedInPrivateBrowsing:(BOOL)a3
{
  [(SFContentBlockerManager *)self->_contentBlockerManager setExtension:self->_extension isEnabledInPrivateBrowsing:a3 updateUserContentController:1];

  [(SFExtensionWrapper *)self _postNotificationsToUpdateExtensionState];
}

- (id)enabledProfiles
{
  v3 = [(SFContentBlockerManager *)self->_contentBlockerManager webExtensionsController];
  v4 = [v3 tabGroupManager];
  v5 = [v4 profiles];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__SFContentBlockerExtensionWrapper_enabledProfiles__block_invoke;
  v8[3] = &unk_1E54ECCA0;
  v8[4] = self;
  v6 = objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v8);

  return v6;
}

id __51__SFContentBlockerExtensionWrapper_enabledProfiles__block_invoke(uint64_t a1, void *a2)
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
  id v3 = [(SFContentBlockerManager *)self->_contentBlockerManager webExtensionsController];
  id v4 = [v3 tabGroupManager];
  v5 = [v4 namedProfiles];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [(SFContentBlockerExtensionWrapper *)self enabledProfiles];
    id v8 = objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_50);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id __56__SFContentBlockerExtensionWrapper_enabledNamedProfiles__block_invoke(uint64_t a1, void *a2)
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
  id v3 = self;
  contentBlockerManager = self->_contentBlockerManager;
  id v5 = a3;
  uint64_t v6 = [(SFContentBlockerManager *)contentBlockerManager webExtensionsController];
  id v7 = [v5 identifierForExtensions];

  id v8 = [v6 contentBlockerManagerForProfileServerID:v7];

  LOBYTE(v3) = [v8 extensionIsEnabled:v3->_extension];
  return (char)v3;
}

- (BOOL)isEnabledInAllNamedProfiles
{
  id v3 = [(SFContentBlockerManager *)self->_contentBlockerManager webExtensionsController];
  id v4 = [(SFContentBlockerExtensionWrapper *)self enabledNamedProfiles];
  uint64_t v5 = [v4 count];
  uint64_t v6 = [v3 tabGroupManager];
  id v7 = [v6 namedProfiles];
  LOBYTE(v5) = v5 == [v7 count];

  return v5;
}

- (Class)settingsPermissionClass
{
  return NSClassFromString(&cfstr_Safaricontentb.isa);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentBlockerManager, 0);

  objc_storeStrong((id *)&self->_extension, 0);
}

@end