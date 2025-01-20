@interface NTKBundleComplicationManager
+ (id)sharedManager;
- (BOOL)bundleComplicationExistsForAppBundleIdentifier:(id)a3;
- (BOOL)bundleExistsWithIdentifier:(id)a3 appBundleIdentifier:(id)a4;
- (Class)_dataSourceClassForBundleIdentifier:(id)a3;
- (Class)dataSourceClassForBundleComplication:(id)a3;
- (Class)dataSourceClassForBundleComplication:(id)a3 withFamily:(int64_t)a4 andDevice:(id)a5 factorInMigration:(BOOL)a6;
- (NTKBundleComplicationDataSourceLoader)loader;
- (NTKBundleComplicationManager)init;
- (NTKCompanionBundleComplicationSyncCoordinator)syncCoordinator;
- (id)_buildDataSourceInfoLookup;
- (id)_infoByBundleIdentifierLookup;
- (id)_infoForBundleIdentifier:(id)a3;
- (id)allComplicationAppBundleIDs;
- (id)bundleComplicationsForBundleIdentifier:(id)a3;
- (id)groupIdentifierForBundleIdentifier:(id)a3;
- (id)localizedAppNameForBundleIdentifier:(id)a3;
- (id)localizedComplicationNameForBundleIdentifier:(id)a3;
- (id)sectionIdentifierForBundleIdentifier:(id)a3;
- (void)_enumerateBundleInfo:(id)a3;
- (void)enumerateBundlesForComplicationFamily:(int64_t)a3 device:(id)a4 withBlock:(id)a5;
@end

@implementation NTKBundleComplicationManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__NTKBundleComplicationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_2 != -1) {
    dispatch_once(&sharedManager_onceToken_2, block);
  }
  v2 = (void *)sharedManager_manager_1;
  return v2;
}

void __45__NTKBundleComplicationManager_sharedManager__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedManager_manager_1;
  sharedManager_manager_1 = (uint64_t)v0;
}

- (NTKBundleComplicationManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)NTKBundleComplicationManager;
  v2 = [(NTKBundleComplicationManager *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = NTKBundleComplicationDirectoryURLs();
    v5 = +[NTKBundleComplicationDataSourceLoader complicationDataSourceLoaderWithDirectories:v4];
    loader = v3->_loader;
    v3->_loader = v5;
    v7 = v5;

    uint64_t v8 = +[NTKCompanionBundleComplicationSyncCoordinator sharedInstance];
    syncCoordinator = v3->_syncCoordinator;
    v3->_syncCoordinator = (NTKCompanionBundleComplicationSyncCoordinator *)v8;
  }
  return v3;
}

- (BOOL)bundleComplicationExistsForAppBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  objc_super v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__NTKBundleComplicationManager_bundleComplicationExistsForAppBundleIdentifier___block_invoke;
  v7[3] = &unk_1E62C7068;
  id v5 = v4;
  id v8 = v5;
  v9 = &v10;
  [(NTKBundleComplicationManager *)self _enumerateBundleInfo:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __79__NTKBundleComplicationManager_bundleComplicationExistsForAppBundleIdentifier___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 appIdentifier];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (Class)dataSourceClassForBundleComplication:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  uint64_t v18 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 complication];
    int v6 = [v5 bundleIdentifier];
  }
  else
  {
    int v6 = 0;
  }
  uint64_t v7 = [v4 complicationType];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__NTKBundleComplicationManager_dataSourceClassForBundleComplication___block_invoke;
  v11[3] = &unk_1E62C7090;
  id v8 = v6;
  id v12 = v8;
  char v13 = &v15;
  uint64_t v14 = v7;
  [(NTKBundleComplicationManager *)self _enumerateBundleInfo:v11];
  id v9 = (id)v16[3];

  _Block_object_dispose(&v15, 8);
  return (Class)v9;
}

void __69__NTKBundleComplicationManager_dataSourceClassForBundleComplication___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  id v5 = (void *)MEMORY[0x1C1875BE0]();
  int v6 = (void *)a1[4];
  uint64_t v7 = [v9 bundleIdentifier];
  LODWORD(v6) = [v6 isEqualToString:v7];

  if (v6)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = [v9 dataSourceClass];
    *a3 = 1;
  }
  else
  {
    id v8 = [v9 legacyNTKComplicationType];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 unsignedIntegerValue] == a1[6])
    {
      *(void *)(*(void *)(a1[5] + 8) + 24) = [v9 dataSourceClass];
      *a3 = 1;
    }
  }
}

- (Class)dataSourceClassForBundleComplication:(id)a3 withFamily:(int64_t)a4 andDevice:(id)a5 factorInMigration:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  objc_super v11 = [(NTKBundleComplicationManager *)self dataSourceClassForBundleComplication:a3];
  if (!-[objc_class acceptsComplicationFamily:forDevice:](v11, "acceptsComplicationFamily:forDevice:", a4, v10)|| [v10 supportsWidgetMigration]&& v6&& (-[objc_class hasMigratedToWidgetForFamily:device:](v11, "hasMigratedToWidgetForFamily:device:", a4, v10) & 1) != 0)
  {
    id v12 = 0;
  }
  else
  {
    id v12 = v11;
  }

  return v12;
}

- (BOOL)bundleExistsWithIdentifier:(id)a3 appBundleIdentifier:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(NTKBundleComplicationManager *)self _infoForBundleIdentifier:a3];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 appIdentifier];
    char v10 = [v9 isEqualToString:v6];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)localizedAppNameForBundleIdentifier:(id)a3
{
  v3 = [(NTKBundleComplicationManager *)self _infoForBundleIdentifier:a3];
  id v4 = [v3 localizedAppName];

  return v4;
}

- (id)sectionIdentifierForBundleIdentifier:(id)a3
{
  v3 = [(NTKBundleComplicationManager *)self _infoForBundleIdentifier:a3];
  id v4 = [v3 sectionIdentifier];

  return v4;
}

- (id)groupIdentifierForBundleIdentifier:(id)a3
{
  v3 = [(NTKBundleComplicationManager *)self _infoForBundleIdentifier:a3];
  id v4 = [v3 appGroupIdentifier];

  return v4;
}

- (id)localizedComplicationNameForBundleIdentifier:(id)a3
{
  v3 = [(NTKBundleComplicationManager *)self _infoForBundleIdentifier:a3];
  id v4 = [v3 localizedComplicationName];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 localizedAppName];
  }
  uint64_t v7 = v6;

  return v7;
}

- (void)enumerateBundlesForComplicationFamily:(int64_t)a3 device:(id)a4 withBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  char v10 = [v8 supportsWidgetMigration];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  objc_super v11 = [(NTKBundleComplicationManager *)self loader];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__NTKBundleComplicationManager_enumerateBundlesForComplicationFamily_device_withBlock___block_invoke;
  v14[3] = &unk_1E62C70B8;
  uint64_t v17 = v20;
  int64_t v18 = a3;
  id v12 = v8;
  id v15 = v12;
  char v19 = v10;
  id v13 = v9;
  id v16 = v13;
  [v11 enumerateComplicationClassesWithBlock:v14];

  _Block_object_dispose(v20, 8);
}

void __87__NTKBundleComplicationManager_enumerateBundlesForComplicationFamily_device_withBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *a3 = 1;
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 56);
    while (![a2 acceptsComplicationFamily:v9 forDevice:*(void *)(a1 + 32)]
         || *(unsigned char *)(a1 + 64)
         && ([a2 hasMigratedToWidgetForFamily:v9 device:*(void *)(a1 + 32)] & 1) != 0)
    {
      if ((NTKFallbackComplicationFamilyForFamily(v9, &v9) & 1) == 0) {
        return;
      }
    }
    id v5 = (void *)MEMORY[0x1C1875BE0]();
    id v6 = [a2 bundleIdentifier];
    uint64_t v7 = [a2 appIdentifier];
    id v8 = [a2 legacyNTKComplicationType];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)allComplicationAppBundleIDs
{
  v3 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__NTKBundleComplicationManager_allComplicationAppBundleIDs__block_invoke;
  v6[3] = &unk_1E62C70E0;
  id v4 = v3;
  id v7 = v4;
  [(NTKBundleComplicationManager *)self _enumerateBundleInfo:v6];

  return v4;
}

void __59__NTKBundleComplicationManager_allComplicationAppBundleIDs__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 appIdentifier];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    v3 = v4;
  }
}

- (id)bundleComplicationsForBundleIdentifier:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NTKBundleComplicationManager *)self _dataSourceClassForBundleIdentifier:v4];
  if (v5)
  {
    id v6 = v5;
    id v7 = [(objc_class *)v5 appIdentifier];
    if ([(objc_class *)v6 useComplicationDescriptorsOnCompanion])
    {
      id v8 = (void *)MEMORY[0x1E4F1CAA0];
      uint64_t v9 = [(NTKCompanionBundleComplicationSyncCoordinator *)self->_syncCoordinator descriptorsForBundleIdentifier:v4];
      uint64_t v10 = [v8 orderedSetWithArray:v9];
    }
    else
    {
      uint64_t v9 = [(objc_class *)v6 complicationDescriptors];
      uint64_t v10 = [v9 copy];
    }
    id v12 = (void *)v10;

    id v13 = [MEMORY[0x1E4F1CA70] orderedSet];
    if (v12)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v22 != v17) {
              objc_enumerationMutation(v14);
            }
            char v19 = objc_msgSend(MEMORY[0x1E4F59148], "complicationWithBundleIdentifier:appBundleIdentifier:complicationDescriptor:", v4, v7, *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
            if (v19) {
              [v13 addObject:v19];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v16);
      }
    }
    else
    {
      id v14 = [MEMORY[0x1E4F59148] complicationWithBundleIdentifier:v4 appBundleIdentifier:v7 complicationDescriptor:0];
      if (v14) {
        [v13 addObject:v14];
      }
    }

    objc_super v11 = (void *)[v13 copy];
  }
  else
  {
    objc_super v11 = [MEMORY[0x1E4F1CAA0] orderedSet];
  }

  return v11;
}

- (Class)_dataSourceClassForBundleIdentifier:(id)a3
{
  v3 = [(NTKBundleComplicationManager *)self _infoForBundleIdentifier:a3];
  id v4 = [v3 dataSourceClass];

  return (Class)v4;
}

- (id)_infoForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKBundleComplicationManager *)self _infoByBundleIdentifierLookup];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)_enumerateBundleInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKBundleComplicationManager *)self _infoByBundleIdentifierLookup];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__NTKBundleComplicationManager__enumerateBundleInfo___block_invoke;
  v7[3] = &unk_1E62C7108;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __53__NTKBundleComplicationManager__enumerateBundleInfo___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_buildDataSourceInfoLookup
{
  v3 = objc_opt_new();
  id v4 = [(NTKBundleComplicationManager *)self loader];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__NTKBundleComplicationManager__buildDataSourceInfoLookup__block_invoke;
  v8[3] = &unk_1E62C7130;
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateComplicationClassesWithBlock:v8];

  id v6 = (void *)[v5 copy];
  return v6;
}

void __58__NTKBundleComplicationManager__buildDataSourceInfoLookup__block_invoke(uint64_t a1, void *a2)
{
  id v5 = [a2 bundleIdentifier];
  id v4 = [[NTKBundleComplicationDataSourceInfo alloc] initWithDataSourceClass:a2];
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v5];
}

- (id)_infoByBundleIdentifierLookup
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_infoByBundleIdentifierLookup = self->_lock_infoByBundleIdentifierLookup;
  if (!lock_infoByBundleIdentifierLookup)
  {
    id v5 = [(NTKBundleComplicationManager *)self _buildDataSourceInfoLookup];
    id v6 = self->_lock_infoByBundleIdentifierLookup;
    self->_lock_infoByBundleIdentifierLookup = v5;

    lock_infoByBundleIdentifierLookup = self->_lock_infoByBundleIdentifierLookup;
  }
  id v7 = (void *)[(NSDictionary *)lock_infoByBundleIdentifierLookup copy];
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (NTKBundleComplicationDataSourceLoader)loader
{
  return self->_loader;
}

- (NTKCompanionBundleComplicationSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_lock_infoByBundleIdentifierLookup, 0);
}

@end