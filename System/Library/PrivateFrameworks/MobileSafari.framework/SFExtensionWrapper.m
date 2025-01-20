@interface SFExtensionWrapper
+ (id)extensionWrapperForContentBlockerWithComposedIdentifier:(id)a3 contentBlockerManager:(id)a4;
+ (id)extensionWrapperForWebExtensionWithComposedIdentifier:(id)a3 webExtensionsController:(id)a4;
- (BOOL)allowedInPrivateBrowsing;
- (BOOL)canEnable;
- (BOOL)canLoadWithErrorString:(id *)a3;
- (BOOL)contentBlockerHasSameNameAsWebExtensionFromSameApp:(id)a3;
- (BOOL)isContentBlocker;
- (BOOL)isEnabled;
- (BOOL)isEnabledInAllNamedProfiles;
- (BOOL)isEnabledInAnyNamedProfile;
- (BOOL)isEnabledInAnyProfile;
- (BOOL)isEnabledInProfile:(id)a3;
- (Class)settingsPermissionClass;
- (NSArray)enabledNamedProfiles;
- (NSArray)enabledProfiles;
- (NSExtension)extension;
- (NSString)composedIdentifier;
- (NSString)containingAppDisplayName;
- (NSString)debugDescription;
- (NSString)displayName;
- (NSString)shortName;
- (int64_t)localizedCompare:(id)a3;
- (void)_postNotificationsToUpdateExtensionState;
@end

@implementation SFExtensionWrapper

+ (id)extensionWrapperForWebExtensionWithComposedIdentifier:(id)a3 webExtensionsController:(id)a4
{
  v4 = [a4 webExtensionForComposedIdentifier:a3];
  if (v4) {
    v5 = [[SFWebExtensionExtensionWrapper alloc] initWithWebExtensionData:v4];
  }
  else {
    v5 = 0;
  }

  return v5;
}

+ (id)extensionWrapperForContentBlockerWithComposedIdentifier:(id)a3 contentBlockerManager:(id)a4
{
  id v5 = a4;
  v6 = [v5 _contentBlockerWithComposedIdentifier:a3];
  if (v6) {
    v7 = [[SFContentBlockerExtensionWrapper alloc] initWithExtension:v6 contentBlockerManager:v5];
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (int64_t)localizedCompare:(id)a3
{
  id v4 = a3;
  id v5 = [(SFExtensionWrapper *)self containingAppDisplayName];
  v6 = [v4 containingAppDisplayName];
  int64_t v7 = [v5 localizedCompare:v6];

  if (!v7)
  {
    v8 = [(SFExtensionWrapper *)self displayName];
    v9 = [v4 displayName];
    int64_t v7 = [v8 localizedCompare:v9];
  }
  return v7;
}

- (BOOL)contentBlockerHasSameNameAsWebExtensionFromSameApp:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(SFExtensionWrapper *)self isContentBlocker])
  {
    id v5 = [(SFExtensionWrapper *)self extension];
    v6 = [v5 _plugIn];
    v23 = [v6 containingUrl];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v22 = v4;
      uint64_t v10 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(SFExtensionWrapper **)(*((void *)&v24 + 1) + 8 * i);
          if (v12 != self)
          {
            v13 = [*(id *)(*((void *)&v24 + 1) + 8 * i) extension];
            v14 = [v13 _plugIn];
            v15 = [v14 containingUrl];
            int v16 = [v23 isEqual:v15];

            if (v16)
            {
              v17 = [(SFExtensionWrapper *)self displayName];
              v18 = [(SFExtensionWrapper *)v12 displayName];
              char v19 = [v17 isEqualToString:v18];

              if (v19)
              {
                BOOL v20 = 1;
                goto LABEL_15;
              }
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      BOOL v20 = 0;
LABEL_15:
      id v4 = v22;
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (NSString)containingAppDisplayName
{
  return 0;
}

- (NSString)displayName
{
  return 0;
}

- (NSString)shortName
{
  return 0;
}

- (NSString)composedIdentifier
{
  return 0;
}

- (NSExtension)extension
{
  return 0;
}

- (BOOL)isContentBlocker
{
  return 0;
}

- (BOOL)isEnabled
{
  return 0;
}

- (BOOL)canEnable
{
  return [(SFExtensionWrapper *)self canLoadWithErrorString:0];
}

- (BOOL)canLoadWithErrorString:(id *)a3
{
  return 0;
}

- (BOOL)allowedInPrivateBrowsing
{
  return 0;
}

- (NSArray)enabledProfiles
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)enabledNamedProfiles
{
  return 0;
}

- (BOOL)isEnabledInProfile:(id)a3
{
  return 0;
}

- (BOOL)isEnabledInAnyProfile
{
  v2 = [(SFExtensionWrapper *)self enabledProfiles];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isEnabledInAnyNamedProfile
{
  v2 = [(SFExtensionWrapper *)self enabledNamedProfiles];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isEnabledInAllNamedProfiles
{
  return 0;
}

- (Class)settingsPermissionClass
{
  return 0;
}

- (NSString)debugDescription
{
  BOOL v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(SFExtensionWrapper *)self extension];
  id v7 = [v3 stringWithFormat:@"<%@: %p extension = %@>", v5, self, v6];;

  return (NSString *)v7;
}

- (void)_postNotificationsToUpdateExtensionState
{
  BOOL v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 postNotificationName:*MEMORY[0x1E4F997F0] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:*MEMORY[0x1E4F99758] object:self];
}

@end