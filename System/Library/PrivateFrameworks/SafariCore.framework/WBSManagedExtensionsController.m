@interface WBSManagedExtensionsController
+ (NSURL)managedExtensionsConfigurationURL;
+ (id)sharedController;
- (BOOL)_domainIsManaged:(id)a3 byManagedDomainSet:(id)a4;
- (BOOL)allDomainsAreManagedForComposedIdentifier:(id)a3;
- (BOOL)anyDomainIsManagedForComposedIdentifier:(id)a3;
- (BOOL)domainIsDenied:(id)a3 forComposedIdentifier:(id)a4;
- (BOOL)domainIsManaged:(id)a3 forComposedIdentifier:(id)a4;
- (BOOL)hasAnyExtensionManagement;
- (WBSManagedExtensionsController)init;
- (id)allowedDomainsForComposedIdentifier:(id)a3;
- (id)deniedDomainsForComposedIdentifier:(id)a3;
- (int64_t)managedExtensionPrivateBrowsingStateForComposedIdentifier:(id)a3;
- (int64_t)managedExtensionStateForComposedIdentifier:(id)a3;
- (void)_managedExtensionConfigurationDidChange:(id)a3;
- (void)_readManagedExtensionsStateFromDisk;
@end

@implementation WBSManagedExtensionsController

- (void)_readManagedExtensionsStateFromDisk
{
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  v4 = [(id)objc_opt_class() managedExtensionsConfigurationURL];
  id v9 = [v3 dictionaryWithContentsOfURL:v4];

  v5 = objc_msgSend(v9, "safari_dictionaryForKey:", @"ExtensionSettings");
  v6 = objc_msgSend(v5, "safari_dictionaryForKey:", @"Payload");
  objc_msgSend(v6, "safari_dictionaryForKey:", @"ManagedExtensions");
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  managedExtensionsState = self->_managedExtensionsState;
  self->_managedExtensionsState = v7;
}

- (int64_t)managedExtensionStateForComposedIdentifier:(id)a3
{
  v4 = [(NSDictionary *)self->_managedExtensionsState safari_dictionaryForKey:a3];
  v5 = objc_msgSend(v4, "safari_stringForKey:", @"State");
  v6 = v5;
  if (v5)
  {
    int64_t v7 = managedExtensionStateFromString(v5);
  }
  else
  {
    v8 = [(NSDictionary *)self->_managedExtensionsState safari_dictionaryForKey:@"*"];
    id v9 = objc_msgSend(v8, "safari_stringForKey:", @"State");
    v10 = v9;
    if (v9) {
      int64_t v7 = managedExtensionStateFromString(v9);
    }
    else {
      int64_t v7 = 0;
    }
  }
  return v7;
}

+ (NSURL)managedExtensionsConfigurationURL
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = objc_msgSend(v2, "safari_mobileSafariContainerDirectoryURL");
  v4 = [v3 URLByAppendingPathComponent:@"Library/Safari"];

  v5 = [v4 URLByAppendingPathComponent:@"SafariExtensionsManagedConfiguration.plist"];

  return (NSURL *)v5;
}

void __50__WBSManagedExtensionsController_sharedController__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v0;
}

- (WBSManagedExtensionsController)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSManagedExtensionsController;
  v2 = [(WBSManagedExtensionsController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(WBSManagedExtensionsController *)v2 _readManagedExtensionsStateFromDisk];
    v4 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v4 addObserver:v3 selector:sel__managedExtensionConfigurationDidChange_ name:@"ManagedExtensionsConfigurationDidChange" object:0];

    v5 = v3;
  }

  return v3;
}

+ (id)sharedController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WBSManagedExtensionsController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_once != -1) {
    dispatch_once(&sharedController_once, block);
  }
  v2 = (void *)sharedController_sharedController;
  return v2;
}

- (BOOL)hasAnyExtensionManagement
{
  v2 = [(NSDictionary *)self->_managedExtensionsState allKeys];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (int64_t)managedExtensionPrivateBrowsingStateForComposedIdentifier:(id)a3
{
  v4 = [(NSDictionary *)self->_managedExtensionsState safari_dictionaryForKey:a3];
  v5 = objc_msgSend(v4, "safari_stringForKey:", @"PrivateBrowsing");
  v6 = v5;
  if (v5)
  {
    int64_t v7 = managedExtensionStateFromString(v5);
  }
  else
  {
    v8 = [(NSDictionary *)self->_managedExtensionsState safari_dictionaryForKey:@"*"];
    id v9 = objc_msgSend(v8, "safari_stringForKey:", @"PrivateBrowsing");
    v10 = v9;
    if (v9) {
      int64_t v7 = managedExtensionStateFromString(v9);
    }
    else {
      int64_t v7 = 0;
    }
  }
  return v7;
}

- (id)allowedDomainsForComposedIdentifier:(id)a3
{
  BOOL v3 = [(NSDictionary *)self->_managedExtensionsState safari_dictionaryForKey:a3];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = objc_msgSend(v3, "safari_arrayForKey:", @"AllowedDomains");
  v6 = [v4 setWithArray:v5];

  return v6;
}

- (id)deniedDomainsForComposedIdentifier:(id)a3
{
  BOOL v3 = [(NSDictionary *)self->_managedExtensionsState safari_dictionaryForKey:a3];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = objc_msgSend(v3, "safari_arrayForKey:", @"DeniedDomains");
  v6 = [v4 setWithArray:v5];

  return v6;
}

- (BOOL)_domainIsManaged:(id)a3 byManagedDomainSet:(id)a4
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__WBSManagedExtensionsController__domainIsManaged_byManagedDomainSet___block_invoke;
  v8[3] = &unk_1E615A800;
  id v9 = v5;
  id v6 = v5;
  LOBYTE(a4) = objc_msgSend(a4, "safari_containsObjectPassingTest:", v8);

  return (char)a4;
}

uint64_t __70__WBSManagedExtensionsController__domainIsManaged_byManagedDomainSet___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isEqualToString:@"*"] & 1) != 0
    || ([v3 isEqualToString:*(void *)(a1 + 32)] & 1) != 0)
  {
    uint64_t v4 = 1;
  }
  else if ([v3 hasPrefix:@"*"])
  {
    uint64_t v4 = 1;
    id v6 = [v3 substringFromIndex:1];
    if (([*(id *)(a1 + 32) isEqualToString:v6] & 1) == 0)
    {
      int64_t v7 = *(void **)(a1 + 32);
      v8 = [NSString stringWithFormat:@".%@", v6];
      uint64_t v4 = [v7 hasSuffix:v8];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)domainIsManaged:(id)a3 forComposedIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WBSManagedExtensionsController *)self allowedDomainsForComposedIdentifier:v6];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CAD0] set];
  }
  v11 = v10;

  v12 = [(WBSManagedExtensionsController *)self deniedDomainsForComposedIdentifier:v6];

  v13 = v12;
  if (!v12)
  {
    v13 = [MEMORY[0x1E4F1CAD0] set];
  }
  v14 = [v11 setByAddingObjectsFromSet:v13];

  if (!v12) {
  BOOL v15 = [(WBSManagedExtensionsController *)self _domainIsManaged:v7 byManagedDomainSet:v14];
  }

  return v15;
}

- (BOOL)domainIsDenied:(id)a3 forComposedIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [(WBSManagedExtensionsController *)self deniedDomainsForComposedIdentifier:a4];
  LOBYTE(self) = [(WBSManagedExtensionsController *)self _domainIsManaged:v6 byManagedDomainSet:v7];

  return (char)self;
}

- (BOOL)anyDomainIsManagedForComposedIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSManagedExtensionsController *)self allowedDomainsForComposedIdentifier:v4];
  if ([v5 count])
  {
    BOOL v6 = 1;
  }
  else
  {
    id v7 = [(WBSManagedExtensionsController *)self deniedDomainsForComposedIdentifier:v4];
    BOOL v6 = [v7 count] != 0;
  }
  return v6;
}

- (BOOL)allDomainsAreManagedForComposedIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSManagedExtensionsController *)self allowedDomainsForComposedIdentifier:v4];
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CAD0] set];
  }
  v8 = v7;

  id v9 = [(WBSManagedExtensionsController *)self deniedDomainsForComposedIdentifier:v4];

  id v10 = v9;
  if (!v9)
  {
    id v10 = [MEMORY[0x1E4F1CAD0] set];
  }
  v11 = [v8 setByAddingObjectsFromSet:v10];

  if (!v9) {
  char v12 = objc_msgSend(v11, "safari_containsObjectPassingTest:", &__block_literal_global_16);
  }

  return v12;
}

uint64_t __76__WBSManagedExtensionsController_allDomainsAreManagedForComposedIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:@"*"];
}

- (void)_managedExtensionConfigurationDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__WBSManagedExtensionsController__managedExtensionConfigurationDidChange___block_invoke;
  block[3] = &unk_1E615A768;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__WBSManagedExtensionsController__managedExtensionConfigurationDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _readManagedExtensionsStateFromDisk];
  id v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"ManagedExtensionsStateDidChange" object:0];
}

- (void).cxx_destruct
{
}

@end