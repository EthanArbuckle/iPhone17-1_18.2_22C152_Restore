@interface PBFPosterExtensionStoreCoordinator
+ (id)providerInfoURLForContainerURL:(id)a3;
- (BOOL)commitStagedWithError:(id *)a3;
- (BOOL)providerInfoSetObject:(id)a3 forKey:(id)a4;
- (BOOL)providerInfoSetObject:(id)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)readonly;
- (BOOL)teardownConfigurationStoreCoordinatorForPosterUUID:(id)a3 error:(id *)a4;
- (BOOL)teardownConfigurationStoreCoordinatorForPosterUUID:(id)a3 version:(unint64_t)a4 error:(id *)a5;
- (BOOL)teardownDynamicDescriptorStoreCoordinatorForPosterUUID:(id)a3 error:(id *)a4;
- (BSBuildVersion)lastRefreshStashedBuildVersion;
- (NSDate)lastRefreshDescriptorDate;
- (NSString)description;
- (NSString)extensionIdentifier;
- (NSString)lastRefreshDescriptorReason;
- (NSURL)containerURL;
- (PBFPosterExtensionStoreCoordinator)init;
- (PBFPosterExtensionStoreCoordinator)initWithContainerURL:(id)a3 extensionIdentifier:(id)a4;
- (PBFPosterExtensionStoreCoordinator)initWithContainerURL:(id)a3 extensionIdentifier:(id)a4 readonly:(BOOL)a5;
- (id)_accessLock_createModelStoreCoordinator:(void *)a3 posterUUID:(void *)a4 descriptorIdentifier:(void *)a5 role:(void *)a6 error:;
- (id)_accessLock_deleteEnvironment;
- (id)_accessLock_lastRefreshDescriptorDate;
- (id)_accessLock_lastRefreshDescriptorReason;
- (id)_accessLock_lastRefreshStashedBuildVersion;
- (id)_accessLock_modelStoreCoordinatorForPosterUUID:(uint64_t)a3 type:;
- (id)_accessLock_modelStoreCoordinatorSetForType:(void *)a3 error:;
- (id)_accessLock_modelStoreCoordinatorsForType:(uint64_t)a1;
- (id)_accessLock_providerInfo;
- (id)_accessLock_setupEnvironmentIfNecessary;
- (id)_accessLock_stageNewConfigurationStoreCoordinatorForPosterUUID:(void *)a3 descriptorIdentifier:(void *)a4 role:(void *)a5 error:;
- (id)_accessLock_transientInternalInfo;
- (id)_containerURLForType:(id)a1;
- (id)_modelStoreCoordinatorSetForType:(void *)a3 error:;
- (id)_modelStoreCoordinatorsForType:(os_unfair_lock_s *)a1;
- (id)configurationStoreCoordinatorForPosterUUID:(id)a3;
- (id)configurationStoreCoordinatorsWithError:(id *)a3;
- (id)createConfigurationStoreCoordinatorForPosterUUID:(id)a3 descriptorIdentifier:(id)a4 role:(id)a5 error:(id *)a6;
- (id)createDynamicDescriptorStoreCoordinatorForIdentifier:(id)a3 role:(id)a4 error:(id *)a5;
- (id)createStaticDescriptorStoreCoordinatorForIdentifier:(id)a3 role:(id)a4 error:(id *)a5;
- (id)deleteEnvironment;
- (id)determineRefreshStateWithContext:(id)a3;
- (id)dynamicDescriptorStoreCoordinatorForIdentifier:(id)a3;
- (id)dynamicDescriptorStoreCoordinatorForIdentifier:(id)a3 role:(id)a4 createIfNil:(BOOL)a5 error:(id *)a6;
- (id)dynamicDescriptorStoreCoordinatorForPosterUUID:(id)a3;
- (id)dynamicDescriptorStoreCoordinatorsWithError:(id *)a3;
- (id)dynamicPosterDescriptorLatestVersionPaths;
- (id)ensureFileSystemIntegrity;
- (id)latestPosterConfigurationForUUID:(id)a3;
- (id)modelStoreCoordinatorForPosterUUID:(id)a3;
- (id)pbf_posterSnapshotCoordinatorForIdentity:(id)a3;
- (id)posterStaticDescriptorLatestVersionPaths;
- (id)providerInfoObjectForKey:(id)a3;
- (id)setupEnvironmentIfNecessary;
- (id)stageNewConfigurationStoreCoordinatorForPosterUUID:(id)a3 descriptorIdentifier:(id)a4 role:(id)a5 error:(id *)a6;
- (id)staticDescriptorStoreCoordinatorForIdentifier:(id)a3;
- (id)staticDescriptorStoreCoordinatorForPosterUUID:(id)a3;
- (id)staticDescriptorStoreCoordinatorsWithError:(id *)a3;
- (uint64_t)_accessLock_bumpLastRefreshBuildVersion;
- (uint64_t)_accessLock_deleteProviderInfo;
- (uint64_t)_accessLock_providerInfoSetObject:(void *)a3 forKey:(uint64_t)a4 error:;
- (uint64_t)_accessLock_teardownModelStoreCoordinator:(void *)a3 posterUUID:(uint64_t)a4 version:(void *)a5 error:;
- (uint64_t)_accessLock_teardownModelStoreCoordinator:(void *)a3 posterUUID:(void *)a4 error:;
- (uint64_t)_accessLock_writeTransientInternalInfo:(void *)a3 error:;
- (void)_accessLock_bumpLastRefreshDescriptorDate:(void *)a3 reason:;
- (void)_accessLock_enumerateModelStoreCoordinators:(void *)a1;
- (void)_accessLock_transientInternalInfo;
- (void)_correctPermissionsForInternalDirectories;
- (void)_invalidateAndDeleteStoreCoordinatorsForType:(uint64_t)a1;
- (void)abortStaged;
- (void)deleteProviderInfo;
- (void)enumerateConfigurationStoreCoordinators:(id)a3;
- (void)enumerateDescriptorStoreCoordinators:(id)a3;
- (void)enumerateDynamicDescriptorStoreCoordinators:(id)a3;
- (void)enumerateStaticDescriptorStoreCoordinators:(id)a3;
- (void)invalidate;
- (void)pbf_enumerateSnapshotCoordinators:(id)a3;
- (void)purgeSnapshotCache;
- (void)reapEverythingExceptLatestVersion;
- (void)reapSnapshotsMatchingURLs:(id)a3;
- (void)removeLastRefreshDescriptorDate;
- (void)teardownAllDynamicDescriptors;
- (void)teardownAllStaticDescriptorStoreCoordinators;
- (void)updateLastRefreshDescriptorDateWithReason:(id)a3;
@end

@implementation PBFPosterExtensionStoreCoordinator

- (PBFPosterExtensionStoreCoordinator)initWithContainerURL:(id)a3 extensionIdentifier:(id)a4
{
  return [(PBFPosterExtensionStoreCoordinator *)self initWithContainerURL:a3 extensionIdentifier:a4 readonly:0];
}

- (PBFPosterExtensionStoreCoordinator)initWithContainerURL:(id)a3 extensionIdentifier:(id)a4 readonly:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v9)
  {
    v41 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionStoreCoordinator initWithContainerURL:extensionIdentifier:readonly:]();
    }
LABEL_19:
    [v41 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3265F04);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v42 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionStoreCoordinator initWithContainerURL:extensionIdentifier:readonly:]();
    }
    [v42 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3265F68);
  }

  id v10 = v8;
  NSClassFromString(&cfstr_Nsurl.isa);
  if (!v10)
  {
    v43 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionStoreCoordinator initWithContainerURL:extensionIdentifier:readonly:]();
    }
    [v43 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3265FCCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v41 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSURLClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterExtensionStoreCoordinator initWithContainerURL:extensionIdentifier:readonly:]();
    }
    goto LABEL_19;
  }

  v44.receiver = self;
  v44.super_class = (Class)PBFPosterExtensionStoreCoordinator;
  v11 = [(PBFPosterExtensionStoreCoordinator *)&v44 init];
  if (v11)
  {
    uint64_t v12 = [v9 copy];
    extensionIdentifier = v11->_extensionIdentifier;
    v11->_extensionIdentifier = (NSString *)v12;

    v11->_readonly = a5;
    uint64_t v14 = [v10 URLByStandardizingPath];
    containerURL = v11->_containerURL;
    v11->_containerURL = (NSURL *)v14;

    uint64_t v16 = [(id)objc_opt_class() providerInfoURLForContainerURL:v11->_containerURL];
    providerInfoURL = v11->_providerInfoURL;
    v11->_providerInfoURL = (NSURL *)v16;

    v18 = (void *)MEMORY[0x1E4F1CB10];
    v19 = PFTemporaryDirectory();
    v20 = [v18 fileURLWithPath:v19 isDirectory:1];
    v21 = NSString;
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    v24 = objc_msgSend(v23, "pbf_sha256Hash");
    v25 = [(NSString *)v11->_extensionIdentifier pbf_sha256Hash];
    v26 = objc_msgSend(NSString, "pbf_bootInstanceIdentifier");
    v27 = [v21 stringWithFormat:@"TransientInfo-%@-%@-%@.plist", v24, v25, v26];
    uint64_t v28 = [v20 URLByAppendingPathComponent:v27];
    transientInternalInfoURL = v11->_transientInternalInfoURL;
    v11->_transientInternalInfoURL = (NSURL *)v28;

    uint64_t v30 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_posterPathTypeURLForProviderURL:type:", v11->_containerURL, 2);
    staticDescriptorsContainerURL = v11->_staticDescriptorsContainerURL;
    v11->_staticDescriptorsContainerURL = (NSURL *)v30;

    uint64_t v32 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_posterPathTypeURLForProviderURL:type:", v11->_containerURL, 1);
    descriptorsContainerURL = v11->_descriptorsContainerURL;
    v11->_descriptorsContainerURL = (NSURL *)v32;

    uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_posterPathTypeURLForProviderURL:type:", v11->_containerURL, 3);
    configurationContainerURL = v11->_configurationContainerURL;
    v11->_configurationContainerURL = (NSURL *)v34;

    uint64_t v36 = objc_opt_new();
    accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID = v11->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID;
    v11->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID = (NSMutableDictionary *)v36;

    v11->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v38 = objc_opt_new();
    fileManager = v11->_fileManager;
    v11->_fileManager = (NSFileManager *)v38;
  }
  return v11;
}

- (PBFPosterExtensionStoreCoordinator)init
{
  v4 = [NSString stringWithFormat:@"Please use initWithContainerURL:extensionIdentifier:readonly:"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = NSStringFromSelector(a2);
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = @"PBFPosterExtensionStoreCoordinator.m";
    __int16 v17 = 1024;
    int v18 = 88;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (PBFPosterExtensionStoreCoordinator *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_extensionIdentifier withName:@"extensionIdentifier"];
  v4 = [v3 build];

  return (NSString *)v4;
}

- (id)setupEnvironmentIfNecessary
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  v4 = -[PBFPosterExtensionStoreCoordinator _accessLock_setupEnvironmentIfNecessary]((uint64_t)self);
  os_unfair_lock_unlock(p_accessLock);
  return v4;
}

- (id)_accessLock_setupEnvironmentIfNecessary
{
  if (a1)
  {
    if ([*(id *)(a1 + 112) getFlag])
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      id v2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
    int v3 = *(unsigned __int8 *)(a1 + 124);
    id v4 = *(id *)(a1 + 32);
    id v5 = *(id *)(a1 + 8);
    id v6 = *(id *)(a1 + 24);
    id v7 = *(id *)(a1 + 16);
    id v8 = *(id *)(a1 + 104);
    char v9 = [v4 checkResourceIsReachableAndReturnError:0];
    if (!v3 && (v9 & 1) == 0)
    {
      id v10 = PFFileProtectionNoneAttributes();
      id v25 = 0;
      int v11 = [v8 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:v10 error:&v25];
      id v2 = v25;

      if (!v11) {
        goto LABEL_21;
      }
    }
    char v12 = [v5 checkResourceIsReachableAndReturnError:0];
    if (!v3 && (v12 & 1) == 0)
    {
      __int16 v13 = PFFileProtectionNoneAttributes();
      id v24 = 0;
      int v14 = [v8 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:v13 error:&v24];
      id v2 = v24;

      if (!v14) {
        goto LABEL_21;
      }
    }
    char v15 = [v7 checkResourceIsReachableAndReturnError:0];
    if (!v3 && (v15 & 1) == 0)
    {
      uint64_t v16 = PFFileProtectionNoneAttributes();
      id v23 = 0;
      int v17 = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:v16 error:&v23];
      id v2 = v23;

      if (!v17) {
        goto LABEL_21;
      }
    }
    char v18 = [v6 checkResourceIsReachableAndReturnError:0];
    if (v3 || (v18 & 1) != 0) {
      goto LABEL_20;
    }
    __int16 v19 = PFFileProtectionNoneAttributes();
    id v22 = 0;
    int v20 = [v8 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:v19 error:&v22];
    id v2 = v22;

    if (v20)
    {

LABEL_20:
      -[PBFPosterExtensionStoreCoordinator _correctPermissionsForInternalDirectories]((void *)a1);
      id v2 = 0;
    }
LABEL_21:

    goto LABEL_22;
  }
  id v2 = 0;
LABEL_22:
  return v2;
}

- (id)deleteEnvironment
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  id v4 = -[PBFPosterExtensionStoreCoordinator _accessLock_deleteEnvironment]((uint64_t)self);
  os_unfair_lock_unlock(p_accessLock);
  return v4;
}

- (id)_accessLock_deleteEnvironment
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    PBFDebug_os_unfair_lock_assert_owner(a1 + 120);
    if (*(unsigned char *)(a1 + 124))
    {
      uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1106, 0);
LABEL_6:
      id v3 = (id)v2;
      goto LABEL_7;
    }
    if ([*(id *)(a1 + 112) getFlag])
    {
      uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      goto LABEL_6;
    }
    if (*(unsigned char *)(a1 + 124))
    {
      id v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28588];
      __int16 v13 = @"Cannot delete environment; readonly extension store coordinator";
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      objc_msgSend(v5, "pbf_generalErrorWithCode:userInfo:", 1, v6);
      id v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PBFPosterExtensionStoreCoordinator _accessLock_enumerateModelStoreCoordinators:]((void *)a1, &__block_literal_global_123);
      id v7 = *(void **)(a1 + 104);
      uint64_t v8 = *(void *)(a1 + 32);
      id v11 = 0;
      [v7 removeItemAtURL:v8 error:&v11];
      id v3 = v11;
      char v9 = PBFLogReaper();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v15 = a1;
        __int16 v16 = 2114;
        uint64_t v17 = v10;
        _os_log_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleting environment %{public}@", buf, 0x16u);
      }

      [*(id *)(a1 + 80) removeAllObjects];
      [*(id *)(a1 + 72) removeAllObjects];
      [*(id *)(a1 + 88) removeAllObjects];
      [*(id *)(a1 + 96) removeAllObjects];
    }
  }
  else
  {
    id v3 = 0;
  }
LABEL_7:
  return v3;
}

- (void)invalidate
{
  if ([(BSAtomicFlag *)self->_invalidationFlag setFlag:1])
  {
    os_unfair_lock_lock(&self->_accessLock);
    -[PBFPosterExtensionStoreCoordinator _accessLock_enumerateModelStoreCoordinators:](self, &__block_literal_global_42);
    [(NSMutableDictionary *)self->_accessLock_posterDescriptorStoreCoordinatorsForUUID removeAllObjects];
    [(NSMutableDictionary *)self->_accessLock_staticPosterDescriptorStoreCoordinatorsForUUID removeAllObjects];
    [(NSMutableDictionary *)self->_accessLock_posterConfigurationStoreCoordinatorsForUUID removeAllObjects];
    [(NSMutableDictionary *)self->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID removeAllObjects];
    os_unfair_lock_unlock(&self->_accessLock);
  }
}

uint64_t __48__PBFPosterExtensionStoreCoordinator_invalidate__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (void)_accessLock_enumerateModelStoreCoordinators:(void *)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    PBFDebug_os_unfair_lock_assert_owner(a1 + 15);
    if (v3)
    {
      id v4 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorsForType:]((uint64_t)a1, 1);
      id v5 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorsForType:]((uint64_t)a1, 2);
      id v6 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorsForType:]((uint64_t)a1, 3);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v7 = MEMORY[0x1E4F1CC08];
      uint64_t v8 = a1[9];
      uint64_t v9 = a1[10];
      if (!v8) {
        uint64_t v8 = MEMORY[0x1E4F1CC08];
      }
      if (!v9) {
        uint64_t v9 = MEMORY[0x1E4F1CC08];
      }
      v33[0] = v8;
      v33[1] = v9;
      uint64_t v10 = a1[11];
      if (!v10) {
        uint64_t v10 = MEMORY[0x1E4F1CC08];
      }
      if (a1[12]) {
        uint64_t v7 = a1[12];
      }
      v33[2] = v10;
      v33[3] = v7;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v11);
            }
            __int16 v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            long long v24 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            uint64_t v17 = [v16 objectEnumerator];
            uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v25;
              while (2)
              {
                for (uint64_t j = 0; j != v19; ++j)
                {
                  if (*(void *)v25 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  uint64_t v22 = *(void *)(*((void *)&v24 + 1) + 8 * j);
                  char v23 = 0;
                  v3[2](v3, v22, &v23);
                  if (v23)
                  {

                    goto LABEL_28;
                  }
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
                if (v19) {
                  continue;
                }
                break;
              }
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
        }
        while (v13);
      }
LABEL_28:
    }
  }
}

- (void)reapEverythingExceptLatestVersion
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self->_readonly && ([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    os_unfair_lock_lock(&self->_accessLock);
    id v3 = PBFLogReaper();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D31CE000, v3, OS_LOG_TYPE_DEFAULT, "Reaping everything except latest version.", buf, 2u);
    }

    id v4 = objc_opt_new();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__PBFPosterExtensionStoreCoordinator_reapEverythingExceptLatestVersion__block_invoke;
    v19[3] = &unk_1E6983680;
    id v5 = v4;
    id v20 = v5;
    -[PBFPosterExtensionStoreCoordinator _accessLock_enumerateModelStoreCoordinators:](self, v19);
    id v6 = [(NSMutableDictionary *)self->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID objectEnumerator];
    uint64_t v7 = [v6 allObjects];
    [v5 addObjectsFromArray:v7];

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "posterUUID", (void)v15);
          uint64_t v14 = [(id)objc_opt_class() type];
          -[PBFPosterExtensionStoreCoordinator _accessLock_teardownModelStoreCoordinator:posterUUID:error:]((uint64_t)self, v14, v13, 0);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v22 count:16];
      }
      while (v10);
    }

    [(NSMutableDictionary *)self->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID removeAllObjects];
    os_unfair_lock_unlock(&self->_accessLock);
  }
}

void __71__PBFPosterExtensionStoreCoordinator_reapEverythingExceptLatestVersion__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 reapEverythingExceptLatestVersion];
  if (([v3 hasKnownVersions] & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (uint64_t)_accessLock_teardownModelStoreCoordinator:(void *)a3 posterUUID:(void *)a4 error:
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!a1) {
    goto LABEL_25;
  }
  PBFDebug_os_unfair_lock_assert_owner(a1 + 120);
  if ([*(id *)(a1 + 112) getFlag])
  {
    if (a4)
    {
      id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
LABEL_8:
      a1 = 0;
      *a4 = v8;
      goto LABEL_25;
    }
    goto LABEL_9;
  }
  if (*(unsigned char *)(a1 + 124))
  {
    if (a4)
    {
      id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1106, 0);
      goto LABEL_8;
    }
LABEL_9:
    a1 = 0;
    goto LABEL_25;
  }
  uint64_t v9 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorForPosterUUID:type:](a1, v7, a2);
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 invalidate];
    switch(a2)
    {
      case 0:
        if (!a4) {
          goto LABEL_17;
        }
        uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v23 = @"posterUUID";
        uint64_t v12 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v7);
        long long v24 = v12;
        uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v14 = &v24;
        long long v15 = &v23;
        break;
      case 1:
        long long v17 = (id *)(a1 + 72);
        goto LABEL_22;
      case 2:
        long long v17 = (id *)(a1 + 80);
        goto LABEL_22;
      case 3:
        long long v17 = (id *)(a1 + 88);
        long long v18 = [*(id *)(a1 + 88) objectForKey:v7];

        if (v18
          || (long long v17 = (id *)(a1 + 96),
              [*(id *)(a1 + 96) objectForKey:v7],
              uint64_t v19 = objc_claimAutoreleasedReturnValue(),
              v19,
              v19))
        {
LABEL_22:
          [*v17 removeObjectForKey:v7];
LABEL_23:
          id v20 = *(void **)(a1 + 104);
          v21 = [v10 identifierURL];
          a1 = [v20 removeItemAtURL:v21 error:a4];

          goto LABEL_24;
        }
        if (!a4) {
          goto LABEL_17;
        }
        uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
        long long v25 = @"posterUUID";
        uint64_t v12 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v7);
        long long v26 = v12;
        uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v14 = &v26;
        long long v15 = &v25;
        break;
      default:
        goto LABEL_23;
    }
  }
  else
  {
    if (!a4) {
      goto LABEL_17;
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
    long long v27 = @"posterUUID";
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v7);
    v28[0] = v12;
    uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v14 = (void **)v28;
    long long v15 = &v27;
  }
  long long v16 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:1];
  objc_msgSend(v11, "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1109, v16);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
  a1 = 0;
LABEL_24:

LABEL_25:
  return a1;
}

- (void)enumerateDescriptorStoreCoordinators:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, char *))a3;
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    p_accessLock = &self->_accessLock;
    os_unfair_lock_lock(&self->_accessLock);
    id v6 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorSetForType:error:]((uint64_t)self, 1, 0);
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [MEMORY[0x1E4F1CAD0] set];
    }
    uint64_t v9 = v8;

    uint64_t v10 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorSetForType:error:]((uint64_t)self, 2, 0);
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1CAD0] set];
    }
    uint64_t v13 = v12;

    os_unfair_lock_unlock(p_accessLock);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v38[0] = v13;
    v38[1] = v9;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v34;
      uint64_t v26 = *(void *)v34;
      long long v27 = v9;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          id v20 = v19;
          uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v30;
            while (2)
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v30 != v23) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v25 = *(void *)(*((void *)&v29 + 1) + 8 * j);
                char v28 = 0;
                v4[2](v4, v25, &v28);
                if (v28)
                {

                  uint64_t v9 = v27;
                  goto LABEL_25;
                }
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
              if (v22) {
                continue;
              }
              break;
            }
          }

          uint64_t v17 = v26;
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v39 count:16];
        uint64_t v9 = v27;
      }
      while (v16);
    }
LABEL_25:
  }
}

- (id)_accessLock_modelStoreCoordinatorSetForType:(void *)a3 error:
{
  if (a1)
  {
    PBFDebug_os_unfair_lock_assert_owner(a1 + 120);
    if (![*(id *)(a1 + 112) getFlag])
    {
      id v7 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorsForType:](a1, a2);
      id v8 = [v7 allValues];

      id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];

      goto LABEL_7;
    }
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      id v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  id v6 = 0;
LABEL_7:
  return v6;
}

- (void)enumerateConfigurationStoreCoordinators:(id)a3
{
  id v4 = a3;
  id v6 = [(PBFPosterExtensionStoreCoordinator *)self configurationStoreCoordinatorsWithError:0];
  id v5 = (void *)[v6 copy];
  [v5 enumerateObjectsUsingBlock:v4];
}

- (void)enumerateDynamicDescriptorStoreCoordinators:(id)a3
{
  id v4 = a3;
  id v6 = [(PBFPosterExtensionStoreCoordinator *)self dynamicDescriptorStoreCoordinatorsWithError:0];
  id v5 = (void *)[v6 copy];
  [v5 enumerateObjectsUsingBlock:v4];
}

- (void)enumerateStaticDescriptorStoreCoordinators:(id)a3
{
  id v4 = a3;
  id v6 = [(PBFPosterExtensionStoreCoordinator *)self staticDescriptorStoreCoordinatorsWithError:0];
  id v5 = (void *)[v6 copy];
  [v5 enumerateObjectsUsingBlock:v4];
}

- (void)reapSnapshotsMatchingURLs:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_readonly
    && [v4 count]
    && ([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    id v6 = (void *)[v5 mutableCopy];
    os_unfair_lock_lock(&self->_accessLock);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __64__PBFPosterExtensionStoreCoordinator_reapSnapshotsMatchingURLs___block_invoke;
    v8[3] = &unk_1E6983680;
    id v9 = v6;
    id v7 = v6;
    -[PBFPosterExtensionStoreCoordinator _accessLock_enumerateModelStoreCoordinators:](self, v8);
    os_unfair_lock_unlock(&self->_accessLock);
  }
}

uint64_t __64__PBFPosterExtensionStoreCoordinator_reapSnapshotsMatchingURLs___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = [a2 reapSnapshotsMatchingURLs:v5];
  [v5 minusSet:v6];

  uint64_t result = [*(id *)(a1 + 32) count];
  *a3 = result == 0;
  return result;
}

- (void)purgeSnapshotCache
{
  if (([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    os_unfair_lock_lock(&self->_accessLock);
    -[PBFPosterExtensionStoreCoordinator _accessLock_enumerateModelStoreCoordinators:](self, &__block_literal_global_45);
    os_unfair_lock_unlock(&self->_accessLock);
  }
}

uint64_t __56__PBFPosterExtensionStoreCoordinator_purgeSnapshotCache__block_invoke(uint64_t a1, void *a2)
{
  return [a2 purgeSnapshotCache];
}

- (id)ensureFileSystemIntegrity
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  -[PBFPosterExtensionStoreCoordinator _accessLock_enumerateModelStoreCoordinators:](self, &__block_literal_global_47);
  -[PBFPosterExtensionStoreCoordinator _correctPermissionsForInternalDirectories](self);
  os_unfair_lock_unlock(p_accessLock);
  return 0;
}

id __63__PBFPosterExtensionStoreCoordinator_ensureFileSystemIntegrity__block_invoke(uint64_t a1, void *a2)
{
  return (id)[a2 ensureFileSystemIntegrity];
}

- (void)_correctPermissionsForInternalDirectories
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = PBFLogPosterContents();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = (void *)a1[4];
      *(_DWORD *)buf = 138412290;
      long long v36 = v3;
      _os_log_impl(&dword_1D31CE000, v2, OS_LOG_TYPE_DEFAULT, "-[PBFPosterExtensionStoreCoordinator ensureFileSystemIntegrity]> Correcting filesystem permissions for URLs related to %@", buf, 0xCu);
    }

    uint64_t v5 = a1[5];
    uint64_t v4 = a1[6];
    uint64_t v6 = a1[3];
    v39[0] = a1[4];
    v39[1] = v4;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v39[2] = v5;
    v39[3] = v6;
    uint64_t v7 = a1[2];
    v39[4] = a1[1];
    v39[5] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:6];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v9)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(void *)v32;
      uint64_t v13 = *MEMORY[0x1E4F1C598];
      *(void *)&long long v10 = 138412546;
      long long v27 = v10;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void **)(*((void *)&v31 + 1) + 8 * v14);
          id v30 = 0;
          char v16 = objc_msgSend(v15, "pbf_setFileProtection:error:", v13, &v30, v27);
          uint64_t v17 = v30;
          long long v18 = v17;
          if ((v16 & 1) == 0)
          {
            int v19 = [v17 pf_isFileNotFoundError];
            id v20 = PBFLogPosterContents();
            uint64_t v21 = v20;
            if (v19)
            {
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                long long v36 = v15;
                _os_log_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_DEFAULT, "-[PBFPosterExtensionStoreCoordinator _correctPermissionsForInternalDirectories]> skipping nonexistent file %@", buf, 0xCu);
              }
              goto LABEL_25;
            }
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v27;
              long long v36 = v15;
              __int16 v37 = 2114;
              uint64_t v38 = v18;
              _os_log_error_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_ERROR, "-[PBFPosterExtensionStoreCoordinator _correctPermissionsForInternalDirectories]> failed to correct file protection for file %@: %{public}@", buf, 0x16u);
            }
          }
          id v29 = 0;
          char v22 = objc_msgSend(v15, "pbf_setPurgable:error:", 0, &v29);
          uint64_t v21 = v29;
          if ((v22 & 1) == 0)
          {
            uint64_t v23 = PBFLogPosterContents();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v27;
              long long v36 = v15;
              __int16 v37 = 2114;
              uint64_t v38 = v21;
              _os_log_error_impl(&dword_1D31CE000, v23, OS_LOG_TYPE_ERROR, "-[PBFPosterExtensionStoreCoordinator _correctPermissionsForInternalDirectories]> failed to correct purgability for file %@: %{public}@", buf, 0x16u);
            }
          }
          id v28 = 0;
          char v24 = objc_msgSend(v15, "pbf_setExcludedFromBackup:error:", 0, &v28);
          uint64_t v25 = v28;
          if ((v24 & 1) == 0)
          {
            uint64_t v26 = PBFLogPosterContents();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v27;
              long long v36 = v15;
              __int16 v37 = 2114;
              uint64_t v38 = v25;
              _os_log_error_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_ERROR, "-[PBFPosterExtensionStoreCoordinator _correctPermissionsForInternalDirectories]> failed to correct exclude from backup state for file %@: %{public}@", buf, 0x16u);
            }
          }
LABEL_25:

          ++v14;
        }
        while (v11 != v14);
        uint64_t v11 = [v8 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v11);
    }
  }
}

- (id)pbf_posterSnapshotCoordinatorForIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorsForType:]((os_unfair_lock_s *)self, [v4 type]);
  uint64_t v6 = [v4 posterUUID];
  uint64_t v7 = [v5 objectForKey:v6];
  id v8 = objc_msgSend(v7, "pbf_posterSnapshotCoordinatorForIdentity:", v4);

  return v8;
}

- (id)_modelStoreCoordinatorsForType:(os_unfair_lock_s *)a1
{
  if (a1)
  {
    id v4 = a1 + 30;
    os_unfair_lock_lock(a1 + 30);
    uint64_t v5 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorsForType:]((uint64_t)a1, a2);
    os_unfair_lock_unlock(v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)pbf_enumerateSnapshotCoordinators:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __72__PBFPosterExtensionStoreCoordinator_pbf_enumerateSnapshotCoordinators___block_invoke;
  uint64_t v13 = &unk_1E69836D0;
  id v5 = v4;
  id v14 = v5;
  uint64_t v15 = &v16;
  uint64_t v6 = _Block_copy(&v10);
  uint64_t v7 = -[PBFPosterExtensionStoreCoordinator dynamicDescriptorStoreCoordinatorsWithError:](self, "dynamicDescriptorStoreCoordinatorsWithError:", 0, v10, v11, v12, v13);
  [v7 enumerateObjectsUsingBlock:v6];

  if (!*((unsigned char *)v17 + 24))
  {
    id v8 = [(PBFPosterExtensionStoreCoordinator *)self staticDescriptorStoreCoordinatorsWithError:0];
    [v8 enumerateObjectsUsingBlock:v6];

    if (!*((unsigned char *)v17 + 24))
    {
      uint64_t v9 = [(PBFPosterExtensionStoreCoordinator *)self configurationStoreCoordinatorsWithError:0];
      [v9 enumerateObjectsUsingBlock:v6];
    }
  }

  _Block_object_dispose(&v16, 8);
}

void __72__PBFPosterExtensionStoreCoordinator_pbf_enumerateSnapshotCoordinators___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__PBFPosterExtensionStoreCoordinator_pbf_enumerateSnapshotCoordinators___block_invoke_2;
  v6[3] = &unk_1E69836A8;
  id v7 = *(id *)(a1 + 32);
  id v8 = &v9;
  objc_msgSend(v5, "pbf_enumerateSnapshotCoordinators:", v6);
  if (*((unsigned char *)v10 + 24))
  {
    *a3 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }

  _Block_object_dispose(&v9, 8);
}

uint64_t __72__PBFPosterExtensionStoreCoordinator_pbf_enumerateSnapshotCoordinators___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

- (id)modelStoreCoordinatorForPosterUUID:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_accessLock);
  id v5 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorForPosterUUID:type:]((uint64_t)self, v4, 1);
  if (!v5)
  {
    id v5 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorForPosterUUID:type:]((uint64_t)self, v4, 2);
    if (!v5)
    {
      id v5 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorForPosterUUID:type:]((uint64_t)self, v4, 3);
    }
  }
  os_unfair_lock_unlock(&self->_accessLock);

  return v5;
}

- (id)_accessLock_modelStoreCoordinatorForPosterUUID:(uint64_t)a3 type:
{
  if (a1)
  {
    uint64_t v5 = a1 + 120;
    id v6 = a2;
    PBFDebug_os_unfair_lock_assert_owner(v5);
    id v7 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorsForType:](a1, a3);
    id v8 = [v7 objectForKey:v6];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)latestPosterConfigurationForUUID:(id)a3
{
  id v3 = [(PBFPosterExtensionStoreCoordinator *)self configurationStoreCoordinatorForPosterUUID:a3];
  id v4 = [v3 pathOfLatestVersion];

  if (v4) {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F92638]) _initWithPath:v4];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)dynamicDescriptorStoreCoordinatorsWithError:(id *)a3
{
  return -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorSetForType:error:]((os_unfair_lock_s *)self, 1, a3);
}

- (id)_modelStoreCoordinatorSetForType:(void *)a3 error:
{
  if (a1)
  {
    id v6 = a1 + 30;
    os_unfair_lock_lock(a1 + 30);
    id v7 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorSetForType:error:]((uint64_t)a1, a2, a3);
    os_unfair_lock_unlock(v6);
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)dynamicDescriptorStoreCoordinatorForPosterUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorsForType:]((os_unfair_lock_s *)self, 1);
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)dynamicDescriptorStoreCoordinatorForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorsForType:]((os_unfair_lock_s *)self, 1);
  id v6 = [v5 allValues];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__PBFPosterExtensionStoreCoordinator_dynamicDescriptorStoreCoordinatorForIdentifier___block_invoke;
  v10[3] = &unk_1E69836F8;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __85__PBFPosterExtensionStoreCoordinator_dynamicDescriptorStoreCoordinatorForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 descriptorIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)dynamicPosterDescriptorLatestVersionPaths
{
  uint64_t v2 = -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorSetForType:error:]((os_unfair_lock_s *)self, 1, 0);
  id v3 = objc_msgSend(v2, "bs_map:", &__block_literal_global_53);

  return v3;
}

uint64_t __79__PBFPosterExtensionStoreCoordinator_dynamicPosterDescriptorLatestVersionPaths__block_invoke(uint64_t a1, void *a2)
{
  return [a2 pathOfLatestVersion];
}

- (id)dynamicDescriptorStoreCoordinatorForIdentifier:(id)a3 role:(id)a4 createIfNil:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v38[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (__CFString *)a3;
  id v11 = (__CFString *)a4;
  if ([(__CFString *)v10 length])
  {
    if ((PFPosterRoleIsValid() & 1) == 0)
    {
      id v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PFPosterRoleIsValid(role)"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionStoreCoordinator dynamicDescriptorStoreCoordinatorForIdentifier:role:createIfNil:error:]();
      }
      [v28 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D3268544);
    }
    p_accessLock = &self->_accessLock;
    os_unfair_lock_lock(&self->_accessLock);
    id v32 = 0;
    uint64_t v13 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorSetForType:error:]((uint64_t)self, 1, &v32);
    uint64_t v14 = (uint64_t)v32;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __108__PBFPosterExtensionStoreCoordinator_dynamicDescriptorStoreCoordinatorForIdentifier_role_createIfNil_error___block_invoke;
    v30[3] = &unk_1E69836F8;
    uint64_t v15 = v10;
    long long v31 = v15;
    uint64_t v16 = objc_msgSend(v13, "bs_firstObjectPassingTest:", v30);

    if (v14) {
      goto LABEL_20;
    }
    if (v16)
    {
      uint64_t v17 = [(id)v16 role];
      char v18 = [v17 isEqual:v11];

      if ((v18 & 1) == 0)
      {

        char v19 = (void *)MEMORY[0x1E4F28C58];
        v35[0] = *MEMORY[0x1E4F28588];
        v35[1] = @"role";
        id v20 = @"(null role)";
        if (v11) {
          id v20 = v11;
        }
        v36[0] = @"Descriptor store coordinator exists but does not match the requested role";
        v36[1] = v20;
        uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
        uint64_t v14 = objc_msgSend(v19, "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1107, v21);
        uint64_t v16 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      if (v7)
      {
        uint64_t v21 = [MEMORY[0x1E4F29128] UUID];
        id v29 = 0;
        uint64_t v16 = -[PBFPosterExtensionStoreCoordinator _accessLock_createModelStoreCoordinator:posterUUID:descriptorIdentifier:role:error:]((uint64_t)self, 1, v21, v15, v11, &v29);
        uint64_t v14 = (uint64_t)v29;
LABEL_17:

LABEL_20:
        os_unfair_lock_unlock(p_accessLock);
        if (!(v16 | v14))
        {
          char v24 = (void *)MEMORY[0x1E4F28C58];
          v33[0] = *MEMORY[0x1E4F28588];
          v33[1] = @"role";
          uint64_t v25 = @"(null role)";
          if (v11) {
            uint64_t v25 = v11;
          }
          v34[0] = @"Descriptor store coordinator could not fulfill request for role";
          v34[1] = v25;
          uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
          uint64_t v14 = objc_msgSend(v24, "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1111, v26);
        }
        if (a6 && v14) {
          *a6 = (id) v14;
        }

        goto LABEL_28;
      }
      uint64_t v16 = 0;
    }
    uint64_t v14 = 0;
    goto LABEL_20;
  }
  if (!a6)
  {
    uint64_t v16 = 0;
    goto LABEL_29;
  }
  char v22 = (void *)MEMORY[0x1E4F28C58];
  if (v10) {
    uint64_t v23 = v10;
  }
  else {
    uint64_t v23 = @"(null descriptorIdentifier)";
  }
  __int16 v37 = @"descriptorIdentifier";
  v38[0] = v23;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  objc_msgSend(v22, "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1105, v14);
  uint64_t v16 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

LABEL_29:
  return (id)v16;
}

uint64_t __108__PBFPosterExtensionStoreCoordinator_dynamicDescriptorStoreCoordinatorForIdentifier_role_createIfNil_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 descriptorIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)_accessLock_createModelStoreCoordinator:(void *)a3 posterUUID:(void *)a4 descriptorIdentifier:(void *)a5 role:(void *)a6 error:
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!a1)
  {
LABEL_9:
    id v15 = 0;
    goto LABEL_48;
  }
  PBFDebug_os_unfair_lock_assert_owner(a1 + 120);
  if ([*(id *)(a1 + 112) getFlag])
  {
    if (a6)
    {
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
LABEL_8:
      id v15 = 0;
      *a6 = v14;
      goto LABEL_48;
    }
    goto LABEL_9;
  }
  if (*(unsigned char *)(a1 + 124))
  {
    if (a6)
    {
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1106, 0);
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  uint64_t v16 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorForPosterUUID:type:](a1, v11, a2);
  uint64_t v17 = v16;
  if (!v16)
  {
    if (PFPosterRoleIsValid())
    {
      uint64_t v18 = (uint64_t)v13;
    }
    else
    {
      uint64_t v18 = PRPosterRoleLookupForExtensionBundleIdentifier(*(void **)(a1 + 128), v12);

      char v19 = PBFLogPosterContents();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v57 = "-[PBFPosterExtensionStoreCoordinator _accessLock_createModelStoreCoordinator:posterUUID:descriptorIdentifier:role:error:]";
        __int16 v58 = 2112;
        uint64_t v59 = v18;
        _os_log_impl(&dword_1D31CE000, v19, OS_LOG_TYPE_DEFAULT, "[Invalid Role][%{public}s] role was invalid, recovered: %@", buf, 0x16u);
      }
    }
    id v20 = -[PBFPosterExtensionStoreCoordinator _containerURLForType:]((id)a1, a2);
    uint64_t v21 = [v11 UUIDString];
    char v22 = [v20 URLByAppendingPathComponent:v21 isDirectory:1];

    switch(a2)
    {
      case 0:
        if (a6)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1111, 0);
          id v15 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v15 = 0;
        }
        goto LABEL_46;
      case 1:
        uint64_t v26 = v22;
        uint64_t v48 = v18;
        uint64_t v25 = [MEMORY[0x1E4F924C8] descriptorIdentityWithProvider:*(void *)(a1 + 128) identifier:v12 role:v18 posterUUID:v11 version:0];
        [MEMORY[0x1E4F924D0] pathWithProviderURL:*(void *)(a1 + 32) identity:v25];
        uint64_t v49 = 0;
        v47 = long long v27 = (id *)&v49;
        +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:](PBFPosterDescriptorStoreCoordinator, "createNewStoreCoordinatorWithPath:error:");
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = 72;
        goto LABEL_24;
      case 2:
        uint64_t v26 = v22;
        uint64_t v48 = v18;
        uint64_t v25 = [MEMORY[0x1E4F924C8] staticDescriptorIdentityWithProvider:*(void *)(a1 + 128) identifier:v12 role:v18 posterUUID:v11 version:0];
        [MEMORY[0x1E4F924D0] pathWithProviderURL:*(void *)(a1 + 32) identity:v25];
        uint64_t v50 = 0;
        v47 = long long v27 = (id *)&v50;
        +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:](PBFStaticPosterDescriptorStoreCoordinator, "createNewStoreCoordinatorWithPath:error:");
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = 80;
        goto LABEL_24;
      case 3:
        uint64_t v26 = v22;
        uint64_t v48 = v18;
        uint64_t v25 = [MEMORY[0x1E4F924C8] configurationIdentityWithProvider:*(void *)(a1 + 128) identifier:v12 role:v18 posterUUID:v11 version:0 supplement:0];
        [MEMORY[0x1E4F924D0] pathWithProviderURL:*(void *)(a1 + 32) identity:v25];
        uint64_t v51 = 0;
        v47 = long long v27 = (id *)&v51;
        +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:](PBFPosterConfigurationStoreCoordinator, "createNewStoreCoordinatorWithPath:error:");
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = 88;
LABEL_24:
        id v29 = *v27;
        id v23 = *(id *)(a1 + v28);
        char v22 = v26;
        if (!v29) {
          goto LABEL_25;
        }
        goto LABEL_40;
      default:
        uint64_t v48 = v18;
        v47 = [MEMORY[0x1E4F924D0] pathWithProviderURL:*(void *)(a1 + 32) identity:0];
        id v23 = 0;
        id v24 = 0;
        uint64_t v25 = 0;
LABEL_25:
        id v30 = [v24 identifierURL];
        char v31 = [v30 isEqual:v22];

        if ((v31 & 1) == 0)
        {
          v45 = v25;
          id v32 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v33 = *MEMORY[0x1E4F28588];
          v55[0] = @"unexpected identifierURL for model store coordinator";
          uint64_t v34 = *MEMORY[0x1E4F289D0];
          v54[0] = v33;
          v54[1] = v34;
          uint64_t v35 = (uint64_t)v22;
          if (!v22)
          {
            uint64_t v35 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"file://null"];
          }
          v46 = v22;
          v55[1] = v35;
          v54[2] = *MEMORY[0x1E4F289B0];
          long long v36 = objc_msgSend(v24, "identifierURL", v35);
          __int16 v37 = v36;
          if (!v36)
          {
            __int16 v37 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"file://null"];
          }
          v55[2] = v37;
          uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];
          objc_msgSend(v32, "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1111, v38);
          id v29 = (id)objc_claimAutoreleasedReturnValue();

          if (!v36) {
          char v22 = v46;
          }
          if (!v46) {

          }
          uint64_t v25 = v45;
          if (v29) {
            goto LABEL_40;
          }
        }
        if (v23)
        {
          objc_msgSend(v23, "bs_setSafeObject:forKey:", v24, v11);
        }
        else
        {
          v39 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v52 = *MEMORY[0x1E4F28588];
          v53 = @"model store coordinator could not be created";
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
          v41 = uint64_t v40 = v22;
          objc_msgSend(v39, "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1111, v41);
          id v29 = (id)objc_claimAutoreleasedReturnValue();

          char v22 = v40;
          objc_msgSend(0, "bs_setSafeObject:forKey:", v24, v11);
          if (v29)
          {
            id v23 = 0;
LABEL_40:
            if (a6) {
              *a6 = v29;
            }
            v42 = PBFLogPosterContents();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              -[PBFPosterExtensionStoreCoordinator _accessLock_createModelStoreCoordinator:posterUUID:descriptorIdentifier:role:error:]();
            }

            id v15 = 0;
LABEL_45:

            uint64_t v18 = v48;
LABEL_46:

            id v13 = (id)v18;
            goto LABEL_47;
          }
        }
        id v24 = v24;
        id v15 = v24;
        goto LABEL_45;
    }
  }
  id v15 = v16;
LABEL_47:

LABEL_48:
  return v15;
}

- (id)createDynamicDescriptorStoreCoordinatorForIdentifier:(id)a3 role:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = (__CFString *)a3;
  id v9 = a4;
  if ([(__CFString *)v8 length])
  {
    os_unfair_lock_lock(&self->_accessLock);
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    -[PBFPosterExtensionStoreCoordinator _accessLock_createModelStoreCoordinator:posterUUID:descriptorIdentifier:role:error:]((uint64_t)self, 1, v10, v8, v9, a5);
    a5 = (id *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_accessLock);
  }
  else if (a5)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    if (v8) {
      id v12 = v8;
    }
    else {
      id v12 = @"(null descriptorIdentifier)";
    }
    id v15 = @"descriptorIdentifier";
    v16[0] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    objc_msgSend(v11, "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1105, v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return a5;
}

- (BOOL)teardownDynamicDescriptorStoreCoordinatorForPosterUUID:(id)a3 error:(id *)a4
{
  p_accessLock = &self->_accessLock;
  id v7 = a3;
  os_unfair_lock_lock(p_accessLock);
  LOBYTE(a4) = -[PBFPosterExtensionStoreCoordinator _accessLock_teardownModelStoreCoordinator:posterUUID:error:]((uint64_t)self, 1, v7, a4);

  os_unfair_lock_unlock(p_accessLock);
  return (char)a4;
}

- (void)teardownAllDynamicDescriptors
{
}

- (void)_invalidateAndDeleteStoreCoordinatorsForType:(uint64_t)a1
{
  if (a1 && ([*(id *)(a1 + 112) getFlag] & 1) == 0 && !*(unsigned char *)(a1 + 124))
  {
    id v4 = *(id *)(a1 + 104);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    uint64_t v5 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorsForType:](a1, a2);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__PBFPosterExtensionStoreCoordinator__invalidateAndDeleteStoreCoordinatorsForType___block_invoke;
    v9[3] = &unk_1E6983790;
    id v6 = v4;
    id v10 = v6;
    objc_msgSend(v5, "bs_each:", v9);

    id v7 = -[PBFPosterExtensionStoreCoordinator _containerURLForType:]((id)a1, a2);
    [v6 removeItemAtURL:v7 error:0];
    id v8 = PFFileProtectionNoneAttributes();
    [v6 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:v8 error:0];

    if ((unint64_t)(a2 - 1) <= 2) {
      [*(id *)(a1 + 8 * (a2 - 1) + 72) removeAllObjects];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (id)staticDescriptorStoreCoordinatorsWithError:(id *)a3
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  id v6 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorSetForType:error:]((uint64_t)self, 2, a3);
  os_unfair_lock_unlock(p_accessLock);
  return v6;
}

- (id)posterStaticDescriptorLatestVersionPaths
{
  uint64_t v2 = -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorSetForType:error:]((os_unfair_lock_s *)self, 2, 0);
  id v3 = objc_msgSend(v2, "bs_map:", &__block_literal_global_77);

  return v3;
}

uint64_t __78__PBFPosterExtensionStoreCoordinator_posterStaticDescriptorLatestVersionPaths__block_invoke(uint64_t a1, void *a2)
{
  return [a2 pathOfLatestVersion];
}

- (id)staticDescriptorStoreCoordinatorForPosterUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorsForType:]((os_unfair_lock_s *)self, 2);
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)staticDescriptorStoreCoordinatorForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorSetForType:error:]((os_unfair_lock_s *)self, 2, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__PBFPosterExtensionStoreCoordinator_staticDescriptorStoreCoordinatorForIdentifier___block_invoke;
  v9[3] = &unk_1E6983740;
  id v10 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __84__PBFPosterExtensionStoreCoordinator_staticDescriptorStoreCoordinatorForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 descriptorIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (id)createStaticDescriptorStoreCoordinatorForIdentifier:(id)a3 role:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = (__CFString *)a3;
  id v9 = a4;
  if ([(__CFString *)v8 length])
  {
    os_unfair_lock_lock(&self->_accessLock);
    id v10 = [MEMORY[0x1E4F29128] UUID];
    -[PBFPosterExtensionStoreCoordinator _accessLock_createModelStoreCoordinator:posterUUID:descriptorIdentifier:role:error:]((uint64_t)self, 2, v10, v8, v9, a5);
    a5 = (id *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_accessLock);
  }
  else if (a5)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    if (v8) {
      id v12 = v8;
    }
    else {
      id v12 = @"(null descriptorIdentifier)";
    }
    id v15 = @"descriptorIdentifier";
    v16[0] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    objc_msgSend(v11, "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1105, v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return a5;
}

- (void)teardownAllStaticDescriptorStoreCoordinators
{
}

- (id)configurationStoreCoordinatorsWithError:(id *)a3
{
  return -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorSetForType:error:]((os_unfair_lock_s *)self, 3, a3);
}

- (id)configurationStoreCoordinatorForPosterUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[PBFPosterExtensionStoreCoordinator _modelStoreCoordinatorsForType:]((os_unfair_lock_s *)self, 3);
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)createConfigurationStoreCoordinatorForPosterUUID:(id)a3 descriptorIdentifier:(id)a4 role:(id)a5 error:(id *)a6
{
  p_accessLock = &self->_accessLock;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  os_unfair_lock_lock(p_accessLock);
  uint64_t v14 = -[PBFPosterExtensionStoreCoordinator _accessLock_createModelStoreCoordinator:posterUUID:descriptorIdentifier:role:error:]((uint64_t)self, 3, v13, v12, v11, a6);

  os_unfair_lock_unlock(p_accessLock);
  return v14;
}

- (BOOL)teardownConfigurationStoreCoordinatorForPosterUUID:(id)a3 version:(unint64_t)a4 error:(id *)a5
{
  p_accessLock = &self->_accessLock;
  id v9 = a3;
  os_unfair_lock_lock(p_accessLock);
  LOBYTE(a5) = -[PBFPosterExtensionStoreCoordinator _accessLock_teardownModelStoreCoordinator:posterUUID:version:error:]((uint64_t)self, 3, v9, a4, a5);

  os_unfair_lock_unlock(p_accessLock);
  return (char)a5;
}

- (uint64_t)_accessLock_teardownModelStoreCoordinator:(void *)a3 posterUUID:(uint64_t)a4 version:(void *)a5 error:
{
  v41[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!a1) {
    goto LABEL_9;
  }
  PBFDebug_os_unfair_lock_assert_owner(a1 + 120);
  if (![*(id *)(a1 + 112) getFlag])
  {
    if (*(unsigned char *)(a1 + 124))
    {
      if (a5)
      {
        id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1106, 0);
        goto LABEL_8;
      }
LABEL_9:
      uint64_t v11 = 0;
      goto LABEL_29;
    }
    id v12 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorForPosterUUID:type:](a1, v9, a2);
    id v13 = v12;
    if (v12)
    {
      uint64_t v31 = a1;
      uint64_t v32 = a2;
      uint64_t v33 = a5;
      uint64_t v34 = v9;
      uint64_t v14 = [v12 allPosterPaths];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = 0;
        uint64_t v18 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v36 != v18) {
              objc_enumerationMutation(v14);
            }
            id v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            uint64_t v21 = [v20 identity];
            uint64_t v22 = [v21 version];

            if (v22 == a4)
            {
              id v23 = [v20 identity];
              uint64_t v24 = [v23 supplement];
              uint64_t v25 = [v20 identity];
              objc_msgSend(v13, "removeSupplement:forVersion:error:", v24, objc_msgSend(v25, "version"), 0);

              ++v17;
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v16);
      }
      else
      {
        uint64_t v17 = 0;
      }
      if ([v13 hasKnownVersions])
      {
        uint64_t v11 = v17 != 0;
        id v9 = v34;
      }
      else
      {
        id v9 = v34;
        uint64_t v11 = -[PBFPosterExtensionStoreCoordinator _accessLock_teardownModelStoreCoordinator:posterUUID:error:](v31, v32, v34, v33);
      }
    }
    else
    {
      if (!a5)
      {
        uint64_t v11 = 0;
        goto LABEL_28;
      }
      uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
      v40[0] = @"posterUUID";
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v9);
      v41[0] = v14;
      v40[1] = @"type";
      long long v27 = [NSNumber numberWithInteger:a2];
      v41[1] = v27;
      v40[2] = @"version";
      uint64_t v28 = [NSNumber numberWithUnsignedInteger:a4];
      v41[2] = v28;
      id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];
      objc_msgSend(v26, "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1108, v29);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v11 = 0;
    }

LABEL_28:
    goto LABEL_29;
  }
  if (!a5) {
    goto LABEL_9;
  }
  id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
LABEL_8:
  uint64_t v11 = 0;
  *a5 = v10;
LABEL_29:

  return v11;
}

- (BOOL)teardownConfigurationStoreCoordinatorForPosterUUID:(id)a3 error:(id *)a4
{
  p_accessLock = &self->_accessLock;
  id v7 = a3;
  os_unfair_lock_lock(p_accessLock);
  LOBYTE(a4) = -[PBFPosterExtensionStoreCoordinator _accessLock_teardownModelStoreCoordinator:posterUUID:error:]((uint64_t)self, 3, v7, a4);

  os_unfair_lock_unlock(p_accessLock);
  return (char)a4;
}

- (id)stageNewConfigurationStoreCoordinatorForPosterUUID:(id)a3 descriptorIdentifier:(id)a4 role:(id)a5 error:(id *)a6
{
  p_accessLock = &self->_accessLock;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  os_unfair_lock_lock(p_accessLock);
  uint64_t v14 = -[PBFPosterExtensionStoreCoordinator _accessLock_stageNewConfigurationStoreCoordinatorForPosterUUID:descriptorIdentifier:role:error:]((id *)&self->super.isa, v13, v12, v11, a6);

  os_unfair_lock_unlock(p_accessLock);
  return v14;
}

- (id)_accessLock_stageNewConfigurationStoreCoordinatorForPosterUUID:(void *)a3 descriptorIdentifier:(void *)a4 role:(void *)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    PBFDebug_os_unfair_lock_assert_owner(a1 + 15);
    if ([a1[14] getFlag])
    {
      if (a5)
      {
        id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
LABEL_8:
        a1 = 0;
        *a5 = v12;
        goto LABEL_23;
      }
LABEL_9:
      a1 = 0;
      goto LABEL_23;
    }
    if (*((unsigned char *)a1 + 124))
    {
      if (a5)
      {
        id v12 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1106, 0);
        goto LABEL_8;
      }
      goto LABEL_9;
    }
    id v13 = -[PBFPosterExtensionStoreCoordinator _accessLock_modelStoreCoordinatorForPosterUUID:type:]((uint64_t)a1, v9, 3);
    uint64_t v14 = v13;
    if (v13)
    {
      a1 = v13;
    }
    else
    {
      id v30 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v28 = PFTemporaryDirectory();
      uint64_t v15 = NSString;
      id v29 = [v9 UUIDString];
      uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
      [v16 timeIntervalSince1970];
      uint64_t v18 = [v15 stringWithFormat:@"STAGED_CSC_%@_%f", v29, v17];
      char v19 = [v28 stringByAppendingPathComponent:v18];
      uint64_t v20 = [v30 fileURLWithPath:v19 isDirectory:1];

      uint64_t v21 = [MEMORY[0x1E4F924C8] configurationIdentityWithProvider:a1[16] identifier:v10 role:v11 posterUUID:v9 version:0 supplement:0];
      uint64_t v31 = (void *)v20;
      uint64_t v22 = [MEMORY[0x1E4F924D0] pathWithProviderURL:v20 identity:v21];
      id v32 = 0;
      id v23 = +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:v22 error:&v32];
      id v24 = v32;
      uint64_t v25 = v24;
      if (v24)
      {
        if (a5) {
          *a5 = v24;
        }
        uint64_t v26 = PBFLogPosterContents();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[PBFPosterExtensionStoreCoordinator _accessLock_stageNewConfigurationStoreCoordinatorForPosterUUID:descriptorIdentifier:role:error:]();
        }

        a1 = 0;
      }
      else
      {
        if (v23) {
          [a1[12] setObject:v23 forKey:v9];
        }
        a1 = v23;
      }
    }
  }
LABEL_23:

  return a1;
}

- (void)abortStaged
{
  if (!self->_readonly && ([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0)
  {
    id v3 = self->_fileManager;
    os_unfair_lock_lock(&self->_accessLock);
    accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID = self->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__PBFPosterExtensionStoreCoordinator_abortStaged__block_invoke;
    v6[3] = &unk_1E6983768;
    id v7 = v3;
    uint64_t v5 = v3;
    [(NSMutableDictionary *)accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID enumerateKeysAndObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID removeAllObjects];
    os_unfair_lock_unlock(&self->_accessLock);
  }
}

void __49__PBFPosterExtensionStoreCoordinator_abortStaged__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 identifierURL];
  [v4 invalidate];

  [*(id *)(a1 + 32) removeItemAtURL:v5 error:0];
}

- (BOOL)commitStagedWithError:(id *)a3
{
  id v3 = a3;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (self->_readonly)
  {
    if (a3)
    {
      id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1106, 0);
LABEL_7:
      BOOL v6 = 0;
      id *v3 = v4;
      return v6;
    }
    return 0;
  }
  id v5 = self;
  if ([(BSAtomicFlag *)self->_invalidationFlag getFlag])
  {
    if (v3)
    {
      id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      goto LABEL_7;
    }
    return 0;
  }
  id v7 = v5->_fileManager;
  p_accessLock = &v5->_accessLock;
  os_unfair_lock_lock(&v5->_accessLock);
  v43 = objc_opt_new();
  uint64_t v49 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v9 = v5->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID;
  uint64_t v48 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v48)
  {
    obuint64_t j = v9;
    uint64_t v41 = &v5->_accessLock;
    v42 = v3;
    id v10 = 0;
    v46 = v5;
    uint64_t v47 = *(void *)v61;
    char v45 = 1;
LABEL_11:
    uint64_t v11 = 0;
    while (1)
    {
      id v12 = v10;
      if (*(void *)v61 != v47) {
        objc_enumerationMutation(obj);
      }
      id v13 = -[NSMutableDictionary objectForKey:](v5->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID, "objectForKey:", *(void *)(*((void *)&v60 + 1) + 8 * v11), v41, v42);
      uint64_t v14 = [v13 extensionIdentifier];
      [v13 posterUUID];
      uint64_t v16 = v15 = v5;
      [v13 invalidate];
      configurationContainerURL = v15->_configurationContainerURL;
      uint64_t v18 = [v16 UUIDString];
      char v19 = [(NSURL *)configurationContainerURL URLByAppendingPathComponent:v18 isDirectory:1];

      uint64_t v20 = [v13 identifierURL];
      id v59 = v12;
      BOOL v21 = [(NSFileManager *)v7 moveItemAtURL:v20 toURL:v19 error:&v59];
      id v22 = v59;

      [v49 addObject:v19];
      uint64_t v50 = (void *)v14;
      if (v21)
      {
        id v23 = [(PBFPosterModelStoreCoordinator *)[PBFPosterConfigurationStoreCoordinator alloc] initWithProvider:v14 identifierURL:v19 posterUUID:v16];
        id v24 = [(PBFPosterModelStoreCoordinator *)v23 checkEnvironmentConsistency];
        uint64_t v25 = v24;
        if (v24)
        {
          id v26 = v24;

          int v27 = 2;
          id v22 = v26;
        }
        else
        {
          [v43 setObject:v23 forKey:v16];
          int v27 = 0;
          char v45 = 1;
        }
      }
      else
      {
        char v45 = 0;
        int v27 = 2;
      }
      id v10 = v22;

      id v5 = v46;
      if (v27) {
        break;
      }
      if (v48 == ++v11)
      {
        uint64_t v48 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v60 objects:v66 count:16];
        if (v48) {
          goto LABEL_11;
        }
        break;
      }
    }

    if ((v45 & 1) == 0)
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      uint64_t v28 = [(NSMutableDictionary *)v46->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID keyEnumerator];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v55 objects:v65 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v56 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = [(NSMutableDictionary *)v46->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID objectForKey:*(void *)(*((void *)&v55 + 1) + 8 * i)];
            uint64_t v34 = [v33 identifierURL];
            [(NSFileManager *)v7 removeItemAtURL:v34 error:0];
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v55 objects:v65 count:16];
        }
        while (v30);
      }

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v35 = v49;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v51 objects:v64 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v52;
        do
        {
          for (uint64_t j = 0; j != v37; ++j)
          {
            if (*(void *)v52 != v38) {
              objc_enumerationMutation(v35);
            }
            [(NSFileManager *)v7 removeItemAtURL:*(void *)(*((void *)&v51 + 1) + 8 * j) error:0];
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v51 objects:v64 count:16];
        }
        while (v37);
      }

      BOOL v6 = 0;
      p_accessLock = v41;
      id v3 = v42;
      goto LABEL_42;
    }
    p_accessLock = v41;
    id v3 = v42;
  }
  else
  {

    id v10 = 0;
  }
  [(NSMutableDictionary *)v5->_accessLock_posterConfigurationStoreCoordinatorsForUUID addEntriesFromDictionary:v43];
  BOOL v6 = 1;
LABEL_42:
  [(NSMutableDictionary *)v5->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID removeAllObjects];
  os_unfair_lock_unlock(p_accessLock);
  if (v3 && v10) {
    id *v3 = v10;
  }

  return v6;
}

- (NSDate)lastRefreshDescriptorDate
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  id v4 = -[PBFPosterExtensionStoreCoordinator _accessLock_lastRefreshDescriptorDate]((id *)&self->super.isa);
  os_unfair_lock_unlock(p_accessLock);
  return (NSDate *)v4;
}

- (id)_accessLock_lastRefreshDescriptorDate
{
  if (a1 && ([a1[14] getFlag] & 1) == 0)
  {
    id v3 = -[PBFPosterExtensionStoreCoordinator _accessLock_transientInternalInfo](a1);
    id v4 = [v3 objectForKeyedSubscript:@"lastRefreshDescriptorDate"];
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    uint64_t v2 = v6;
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (BSBuildVersion)lastRefreshStashedBuildVersion
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  id v4 = -[PBFPosterExtensionStoreCoordinator _accessLock_lastRefreshStashedBuildVersion]((id *)&self->super.isa);
  os_unfair_lock_unlock(p_accessLock);
  return (BSBuildVersion *)v4;
}

- (id)_accessLock_lastRefreshStashedBuildVersion
{
  if (a1 && ([a1[14] getFlag] & 1) == 0)
  {
    id v3 = -[PBFPosterExtensionStoreCoordinator _accessLock_providerInfo](a1);
    id v4 = [v3 objectForKeyedSubscript:@"lastRefreshStashedBuildVersion"];
    if (v4) {
      uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F4F6C8]) initWithString:v4];
    }
    else {
      uint64_t v2 = 0;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

- (NSString)lastRefreshDescriptorReason
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  id v4 = -[PBFPosterExtensionStoreCoordinator _accessLock_lastRefreshDescriptorReason]((id *)&self->super.isa);
  os_unfair_lock_unlock(p_accessLock);
  return (NSString *)v4;
}

- (id)_accessLock_lastRefreshDescriptorReason
{
  v1 = a1;
  if (a1)
  {
    if ([a1[14] getFlag])
    {
      v1 = 0;
    }
    else
    {
      uint64_t v2 = -[PBFPosterExtensionStoreCoordinator _accessLock_transientInternalInfo](v1);
      uint64_t v3 = [v2 objectForKeyedSubscript:@"lastRefreshDescriptorReason"];
      id v4 = (void *)v3;
      id v5 = @"(null)";
      if (v3) {
        id v5 = (__CFString *)v3;
      }
      v1 = v5;
    }
  }
  return v1;
}

- (void)updateLastRefreshDescriptorDateWithReason:(id)a3
{
  if (!self->_readonly)
  {
    id v4 = (void *)MEMORY[0x1E4F1C9C8];
    id v5 = a3;
    id v6 = [v4 date];
    os_unfair_lock_lock(&self->_accessLock);
    -[PBFPosterExtensionStoreCoordinator _accessLock_bumpLastRefreshDescriptorDate:reason:]((uint64_t)self, v6, v5);

    os_unfair_lock_unlock(&self->_accessLock);
  }
}

- (void)_accessLock_bumpLastRefreshDescriptorDate:(void *)a3 reason:
{
  id v15 = a2;
  id v5 = a3;
  if (a1 && !*(unsigned char *)(a1 + 124) && ([*(id *)(a1 + 112) getFlag] & 1) == 0)
  {
    -[PBFPosterExtensionStoreCoordinator _accessLock_bumpLastRefreshBuildVersion](a1);
    id v6 = -[PBFPosterExtensionStoreCoordinator _accessLock_transientInternalInfo]((id *)a1);
    id v7 = (void *)[v6 mutableCopy];
    id v8 = v7;
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = (id)objc_opt_new();
    }
    id v10 = v9;

    if (v15)
    {
      [v10 setObject:v15 forKeyedSubscript:@"lastRefreshDescriptorDate"];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
      [v10 setObject:v11 forKeyedSubscript:@"lastRefreshDescriptorDate"];
    }
    uint64_t v12 = [v5 copy];
    id v13 = (void *)v12;
    if (v12) {
      uint64_t v14 = (__CFString *)v12;
    }
    else {
      uint64_t v14 = @"No reason!";
    }
    [v10 setObject:v14 forKeyedSubscript:@"lastRefreshDescriptorReason"];

    -[PBFPosterExtensionStoreCoordinator _accessLock_writeTransientInternalInfo:error:](a1, v10, 0);
  }
}

- (void)removeLastRefreshDescriptorDate
{
  if (!self->_readonly)
  {
    p_accessLock = &self->_accessLock;
    os_unfair_lock_lock(&self->_accessLock);
    id v4 = [MEMORY[0x1E4F1C9C8] distantPast];
    -[PBFPosterExtensionStoreCoordinator _accessLock_bumpLastRefreshDescriptorDate:reason:]((uint64_t)self, v4, @"removeLastRefreshDescriptorDate");

    os_unfair_lock_unlock(p_accessLock);
  }
}

- (id)providerInfoObjectForKey:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  id v6 = -[PBFPosterExtensionStoreCoordinator _accessLock_providerInfo]((id *)&self->super.isa);
  os_unfair_lock_unlock(p_accessLock);
  id v7 = [v6 objectForKeyedSubscript:v5];

  return v7;
}

- (id)_accessLock_providerInfo
{
  if (a1)
  {
    uint64_t v2 = a1;
    if ([a1[14] getFlag])
    {
      a1 = 0;
    }
    else
    {
      id v3 = v2[7];
      if (!v3)
      {
        objc_msgSend(v2[6], "pbf_setFileProtection:error:", *MEMORY[0x1E4F1C598], 0);
        id v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2[6]];
        if (v4)
        {
          id v5 = (void *)MEMORY[0x1E4F28DC0];
          id v6 = extensionStoreCoordinatorSupportedArchivableClassesForInfoFiles();
          id v7 = [v5 unarchivedObjectOfClasses:v6 fromData:v4 error:0];
        }
        else
        {
          id v7 = 0;
        }
        id v8 = self;
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          id v10 = v7;
        }
        else {
          id v10 = (id)objc_opt_new();
        }
        id v11 = v2[7];
        v2[7] = v10;

        id v3 = v2[7];
      }
      a1 = (id *)[v3 copy];
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)providerInfoSetObject:(id)a3 forKey:(id)a4
{
  return [(PBFPosterExtensionStoreCoordinator *)self providerInfoSetObject:a3 forKey:a4 error:0];
}

- (BOOL)providerInfoSetObject:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!self->_readonly)
  {
    id v12 = v9;
    NSClassFromString(&cfstr_Nsstring.isa);
    if (v12)
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[PBFPosterExtensionStoreCoordinator providerInfoSetObject:forKey:error:]();
        }
        [v18 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1D326AAD0);
      }

      id v13 = v8;
      uint64_t v14 = v13;
      if (!v13 || ([v13 conformsToProtocol:&unk_1F2AFF6B0] & 1) != 0)
      {

        p_accessLock = &self->_accessLock;
        os_unfair_lock_lock(&self->_accessLock);
        char v11 = -[PBFPosterExtensionStoreCoordinator _accessLock_providerInfoSetObject:forKey:error:]((uint64_t)self, v14, v12, (uint64_t)a5);
        os_unfair_lock_unlock(p_accessLock);
        goto LABEL_8;
      }
      uint64_t v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(NSSecureCoding)]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionStoreCoordinator providerInfoSetObject:forKey:error:]();
      }
    }
    else
    {
      uint64_t v17 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterExtensionStoreCoordinator providerInfoSetObject:forKey:error:]();
      }
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D326AA6CLL);
  }
  char v11 = 0;
LABEL_8:

  return v11;
}

- (uint64_t)_accessLock_providerInfoSetObject:(void *)a3 forKey:(uint64_t)a4 error:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a1 && !*(unsigned char *)(a1 + 124))
  {
    uint64_t v9 = 0;
    if (([*(id *)(a1 + 112) getFlag] & 1) == 0 && v8)
    {
      id v10 = -[PBFPosterExtensionStoreCoordinator _accessLock_providerInfo]((id *)a1);
      char v11 = (void *)[v10 mutableCopy];
      id v12 = v11;
      if (v11) {
        id v13 = v11;
      }
      else {
        id v13 = (id)objc_opt_new();
      }
      uint64_t v14 = v13;

      if (v7) {
        [v14 setObject:v7 forKey:v8];
      }
      else {
        [v14 removeObjectForKey:v8];
      }
      id v15 = (void *)[v14 copy];
      uint64_t v16 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v15 requiringSecureCoding:1 error:a4];
      if (v16)
      {
        uint64_t v17 = (NSObject **)(a1 + 56);
        objc_storeStrong((id *)(a1 + 56), v15);
        uint64_t v18 = *(void *)(a1 + 48);
        id v25 = 0;
        uint64_t v9 = [v16 writeToURL:v18 options:268435457 error:&v25];
        id v19 = v25;
        uint64_t v20 = PBFLogPosterContents();
        BOOL v21 = v20;
        if (v9)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v22 = *(void *)(a1 + 128);
            *(_DWORD *)buf = 136315650;
            int v27 = "-[PBFPosterExtensionStoreCoordinator _accessLock_providerInfoSetObject:forKey:error:]";
            __int16 v28 = 2114;
            uint64_t v29 = v22;
            __int16 v30 = 2114;
            id v31 = v8;
            _os_log_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_DEFAULT, "%s> Updated provider info for '%{public}@' for key: %{public}@", buf, 0x20u);
          }

          id v23 = v15;
          BOOL v21 = *v17;
          *uint64_t v17 = v23;
        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          -[PBFPosterExtensionStoreCoordinator _accessLock_providerInfoSetObject:forKey:error:](a1, (uint64_t)v19, v21);
        }
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)deleteProviderInfo
{
  if (!self->_readonly)
  {
    p_accessLock = &self->_accessLock;
    os_unfair_lock_lock(&self->_accessLock);
    -[PBFPosterExtensionStoreCoordinator _accessLock_deleteProviderInfo]((uint64_t)self);
    os_unfair_lock_unlock(p_accessLock);
  }
}

- (uint64_t)_accessLock_deleteProviderInfo
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = [*(id *)(result + 112) getFlag];
    if ((result & 1) == 0 && !*(unsigned char *)(v1 + 124))
    {
      uint64_t v2 = *(void **)(v1 + 56);
      *(void *)(v1 + 56) = MEMORY[0x1E4F1CC08];

      id v3 = *(void **)(v1 + 104);
      uint64_t v4 = *(void *)(v1 + 48);
      return [v3 removeItemAtURL:v4 error:0];
    }
  }
  return result;
}

- (id)_accessLock_transientInternalInfo
{
  uint64_t v1 = a1;
  if (a1)
  {
    if ([a1[14] getFlag])
    {
      uint64_t v1 = 0;
      goto LABEL_12;
    }
    id v2 = v1[8];
    if (!v2)
    {
      if ([v1[5] checkResourceIsReachableAndReturnError:0])
      {
        objc_msgSend(v1[5], "pbf_setFileProtection:error:", *MEMORY[0x1E4F1C598], 0);
        id v3 = v1[5];
        id v16 = 0;
        uint64_t v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3 options:2 error:&v16];
        id v5 = v16;
        if (v5)
        {
          id v6 = PBFLogPosterContents();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            -[PBFPosterExtensionStoreCoordinator _accessLock_transientInternalInfo]();
          }

          id v7 = v1[8];
          v1[8] = (id)MEMORY[0x1E4F1CC08];
        }
        else
        {
          if (![v4 length])
          {
LABEL_22:
            uint64_t v1 = (id *)v1[8];

            goto LABEL_12;
          }
          id v10 = (void *)MEMORY[0x1E4F28DC0];
          char v11 = extensionStoreCoordinatorSupportedArchivableClassesForInfoFiles();
          id v15 = 0;
          uint64_t v12 = [v10 unarchivedObjectOfClasses:v11 fromData:v4 error:&v15];
          id v7 = v15;

          if (v7)
          {
            id v13 = PBFLogPosterContents();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
              -[PBFPosterExtensionStoreCoordinator _accessLock_transientInternalInfo]();
            }
          }
          id v14 = v1[8];
          v1[8] = (id)v12;
        }
        goto LABEL_22;
      }
      id v8 = v1[8];
      v1[8] = (id)MEMORY[0x1E4F1CC08];

      id v2 = v1[8];
    }
    uint64_t v1 = (id *)v2;
  }
LABEL_12:
  return v1;
}

- (uint64_t)_accessLock_bumpLastRefreshBuildVersion
{
  if (!a1 || *(unsigned char *)(a1 + 124) || ([*(id *)(a1 + 112) getFlag] & 1) != 0) {
    return 0;
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F6C8]);
  uint64_t v4 = [v3 stringRepresentation];
  uint64_t v5 = -[PBFPosterExtensionStoreCoordinator _accessLock_providerInfoSetObject:forKey:error:](a1, v4, @"lastRefreshStashedBuildVersion", 0);

  return v5;
}

- (uint64_t)_accessLock_writeTransientInternalInfo:(void *)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 124))
    {
      if (a3)
      {
        id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_extensionStoreCoordinatorErrorWithCode:userInfo:", -1106, 0);
LABEL_8:
        a1 = 0;
        *a3 = v6;
        goto LABEL_18;
      }
      goto LABEL_9;
    }
    if ([*(id *)(a1 + 112) getFlag])
    {
      if (a3)
      {
        id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_generalErrorWithCode:userInfo:", 3, 0);
        goto LABEL_8;
      }
LABEL_9:
      a1 = 0;
      goto LABEL_18;
    }
    id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:a3];
    id v8 = v7;
    if (v7 && [v7 writeToURL:*(void *)(a1 + 40) options:268435457 error:a3])
    {
      uint64_t v9 = [v5 copy];
      id v10 = (void *)v9;
      if (v9) {
        char v11 = (void *)v9;
      }
      else {
        char v11 = (void *)MEMORY[0x1E4F1CC08];
      }
      objc_storeStrong((id *)(a1 + 64), v11);

      a1 = 1;
    }
    else
    {
      a1 = 0;
    }
  }
LABEL_18:

  return a1;
}

+ (id)providerInfoURLForContainerURL:(id)a3
{
  id v3 = [a3 URLByAppendingPathComponent:@"ProviderInfo"];
  uint64_t v4 = [v3 URLByAppendingPathExtension:@"plist"];

  return v4;
}

- (id)_accessLock_modelStoreCoordinatorsForType:(uint64_t)a1
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
LABEL_4:
    id v4 = 0;
    goto LABEL_80;
  }
  PBFDebug_os_unfair_lock_assert_owner(a1 + 120);
  switch(a2)
  {
    case 0:
      id v4 = (id)MEMORY[0x1E4F1CC08];
      goto LABEL_80;
    case 1:
      id v5 = *(void **)(a1 + 72);
      if (!v5)
      {
        id v6 = [*(id *)(a1 + 104) contentsOfDirectoryAtURL:*(void *)(a1 + 8) includingPropertiesForKeys:0 options:5 error:0];
        uint64_t v7 = objc_opt_new();
        id v8 = *(void **)(a1 + 72);
        *(void *)(a1 + 72) = v7;

        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        obuint64_t j = v6;
        uint64_t v9 = [obj countByEnumeratingWithState:&v86 objects:v98 count:16];
        if (v9)
        {
          uint64_t v11 = v9;
          uint64_t v12 = *(void *)v87;
          unint64_t v13 = 0x1E4F29000uLL;
          *(void *)&long long v10 = 138543874;
          long long v69 = v10;
          do
          {
            uint64_t v14 = 0;
            uint64_t v72 = v11;
            do
            {
              if (*(void *)v87 != v12) {
                objc_enumerationMutation(obj);
              }
              id v15 = *(void **)(*((void *)&v86 + 1) + 8 * v14);
              id v16 = objc_msgSend(v15, "lastPathComponent", v69);
              uint64_t v17 = (void *)[objc_alloc(*(Class *)(v13 + 296)) initWithUUIDString:v16];
              if (v17)
              {
                uint64_t v18 = [(PBFPosterModelStoreCoordinator *)[PBFPosterDescriptorStoreCoordinator alloc] initWithProvider:*(void *)(a1 + 128) identifierURL:v15 posterUUID:v17 readonly:*(unsigned __int8 *)(a1 + 124)];
                uint64_t v19 = [(PBFPosterModelStoreCoordinator *)v18 checkEnvironmentConsistency];
                uint64_t v20 = (void *)v19;
                if (v18) {
                  BOOL v21 = v19 == 0;
                }
                else {
                  BOOL v21 = 0;
                }
                if (v21)
                {
                  [*(id *)(a1 + 72) setObject:v18 forKey:v17];
                }
                else
                {
                  uint64_t v22 = v12;
                  int v23 = *(unsigned __int8 *)(a1 + 124);
                  id v24 = PBFLogReaper();
                  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
                  if (v23)
                  {
                    if (v25)
                    {
                      *(_DWORD *)buf = v69;
                      v93 = v18;
                      __int16 v94 = 2114;
                      v95 = v20;
                      __int16 v96 = 2114;
                      v97 = v15;
                      _os_log_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_DEFAULT, "Consistency error for descriptor store coordinator '%{public}@': %{public}@... readonly... skipping... %{public}@", buf, 0x20u);
                    }
                  }
                  else
                  {
                    if (v25)
                    {
                      *(_DWORD *)buf = v69;
                      v93 = v18;
                      __int16 v94 = 2114;
                      v95 = v20;
                      __int16 v96 = 2114;
                      v97 = v15;
                      _os_log_impl(&dword_1D31CE000, v24, OS_LOG_TYPE_DEFAULT, "Consistency error for descriptor store coordinator '%{public}@': %{public}@... deleting %{public}@", buf, 0x20u);
                    }

                    [*(id *)(a1 + 104) removeItemAtURL:v15 error:0];
                  }
                  uint64_t v12 = v22;
                  unint64_t v13 = 0x1E4F29000;
                  uint64_t v11 = v72;
                }
              }
              ++v14;
            }
            while (v11 != v14);
            uint64_t v11 = [obj countByEnumeratingWithState:&v86 objects:v98 count:16];
          }
          while (v11);
        }

        id v5 = *(void **)(a1 + 72);
      }
      goto LABEL_79;
    case 2:
      id v5 = *(void **)(a1 + 80);
      if (!v5)
      {
        id v26 = [*(id *)(a1 + 104) contentsOfDirectoryAtURL:*(void *)(a1 + 16) includingPropertiesForKeys:0 options:5 error:0];
        uint64_t v27 = objc_opt_new();
        __int16 v28 = *(void **)(a1 + 80);
        *(void *)(a1 + 80) = v27;

        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id obja = v26;
        uint64_t v29 = [obja countByEnumeratingWithState:&v82 objects:v91 count:16];
        if (v29)
        {
          uint64_t v31 = v29;
          uint64_t v32 = *(void *)v83;
          unint64_t v33 = 0x1E4F29000uLL;
          *(void *)&long long v30 = 138543874;
          long long v70 = v30;
          do
          {
            uint64_t v34 = 0;
            uint64_t v73 = v31;
            do
            {
              if (*(void *)v83 != v32) {
                objc_enumerationMutation(obja);
              }
              id v35 = *(void **)(*((void *)&v82 + 1) + 8 * v34);
              uint64_t v36 = objc_msgSend(v35, "lastPathComponent", v70);
              uint64_t v37 = (void *)[objc_alloc(*(Class *)(v33 + 296)) initWithUUIDString:v36];
              if (v37)
              {
                uint64_t v38 = [(PBFPosterModelStoreCoordinator *)[PBFStaticPosterDescriptorStoreCoordinator alloc] initWithProvider:*(void *)(a1 + 128) identifierURL:v35 posterUUID:v37 readonly:*(unsigned __int8 *)(a1 + 124)];
                uint64_t v39 = [(PBFPosterModelStoreCoordinator *)v38 checkEnvironmentConsistency];
                uint64_t v40 = (void *)v39;
                if (v38) {
                  BOOL v41 = v39 == 0;
                }
                else {
                  BOOL v41 = 0;
                }
                if (v41)
                {
                  [*(id *)(a1 + 80) setObject:v38 forKey:v37];
                }
                else
                {
                  uint64_t v42 = v32;
                  int v43 = *(unsigned __int8 *)(a1 + 124);
                  objc_super v44 = PBFLogReaper();
                  BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
                  if (v43)
                  {
                    if (v45)
                    {
                      *(_DWORD *)buf = v70;
                      v93 = v38;
                      __int16 v94 = 2114;
                      v95 = v40;
                      __int16 v96 = 2114;
                      v97 = v35;
                      _os_log_impl(&dword_1D31CE000, v44, OS_LOG_TYPE_DEFAULT, "Consistency error for static descriptor store coordinator '%{public}@': %{public}@... readonly... skipping... %{public}@", buf, 0x20u);
                    }
                  }
                  else
                  {
                    if (v45)
                    {
                      *(_DWORD *)buf = v70;
                      v93 = v38;
                      __int16 v94 = 2114;
                      v95 = v40;
                      __int16 v96 = 2114;
                      v97 = v35;
                      _os_log_impl(&dword_1D31CE000, v44, OS_LOG_TYPE_DEFAULT, "Consistency error for static descriptor store coordinator '%{public}@': %{public}@... deleting %{public}@", buf, 0x20u);
                    }

                    [*(id *)(a1 + 104) removeItemAtURL:v35 error:0];
                  }
                  uint64_t v32 = v42;
                  unint64_t v33 = 0x1E4F29000;
                  uint64_t v31 = v73;
                }
              }
              ++v34;
            }
            while (v31 != v34);
            uint64_t v31 = [obja countByEnumeratingWithState:&v82 objects:v91 count:16];
          }
          while (v31);
        }

        id v5 = *(void **)(a1 + 80);
      }
      goto LABEL_79;
    case 3:
      if (*(void *)(a1 + 88)) {
        goto LABEL_76;
      }
      v46 = [*(id *)(a1 + 104) contentsOfDirectoryAtURL:*(void *)(a1 + 24) includingPropertiesForKeys:0 options:5 error:0];
      uint64_t v47 = objc_opt_new();
      uint64_t v48 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v47;

      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id objb = v46;
      uint64_t v49 = [objb countByEnumeratingWithState:&v78 objects:v90 count:16];
      if (!v49) {
        goto LABEL_75;
      }
      uint64_t v51 = v49;
      uint64_t v52 = *(void *)v79;
      unint64_t v53 = 0x1E4F29000uLL;
      *(void *)&long long v50 = 138543874;
      long long v71 = v50;
      break;
    default:
      goto LABEL_4;
  }
  do
  {
    uint64_t v54 = 0;
    uint64_t v74 = v51;
    do
    {
      if (*(void *)v79 != v52) {
        objc_enumerationMutation(objb);
      }
      long long v55 = *(void **)(*((void *)&v78 + 1) + 8 * v54);
      long long v56 = objc_msgSend(v55, "lastPathComponent", v71);
      long long v57 = (void *)[objc_alloc(*(Class *)(v53 + 296)) initWithUUIDString:v56];
      if (v57)
      {
        long long v58 = [(PBFPosterModelStoreCoordinator *)[PBFPosterConfigurationStoreCoordinator alloc] initWithProvider:*(void *)(a1 + 128) identifierURL:v55 posterUUID:v57 readonly:*(unsigned __int8 *)(a1 + 124)];
        uint64_t v59 = [(PBFPosterModelStoreCoordinator *)v58 checkEnvironmentConsistency];
        long long v60 = (void *)v59;
        if (v58) {
          BOOL v61 = v59 == 0;
        }
        else {
          BOOL v61 = 0;
        }
        if (v61)
        {
          [*(id *)(a1 + 88) setObject:v58 forKey:v57];
        }
        else
        {
          uint64_t v62 = v52;
          int v63 = *(unsigned __int8 *)(a1 + 124);
          v64 = PBFLogReaper();
          BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
          if (v63)
          {
            if (v65)
            {
              *(_DWORD *)buf = v71;
              v93 = v58;
              __int16 v94 = 2114;
              v95 = v60;
              __int16 v96 = 2114;
              v97 = v55;
              v66 = v64;
              uint64_t v67 = "Consistency error for configuration store coordinator '%{public}@': %{public}@... readonly... skippi"
                    "ng... %{public}@";
              goto LABEL_70;
            }
          }
          else if (v65)
          {
            *(_DWORD *)buf = v71;
            v93 = v58;
            __int16 v94 = 2114;
            v95 = v60;
            __int16 v96 = 2114;
            v97 = v55;
            v66 = v64;
            uint64_t v67 = "Consistency error for configuration store coordinator '%{public}@': %{public}@... deleting %{public}@";
LABEL_70:
            _os_log_impl(&dword_1D31CE000, v66, OS_LOG_TYPE_DEFAULT, v67, buf, 0x20u);
          }

          uint64_t v52 = v62;
          unint64_t v53 = 0x1E4F29000;
          uint64_t v51 = v74;
        }
      }
      ++v54;
    }
    while (v51 != v54);
    uint64_t v51 = [objb countByEnumeratingWithState:&v78 objects:v90 count:16];
  }
  while (v51);
LABEL_75:

LABEL_76:
  if ([*(id *)(a1 + 96) count])
  {
    id v4 = (id)[*(id *)(a1 + 96) mutableCopy];
    [v4 addEntriesFromDictionary:*(void *)(a1 + 88)];
  }
  else
  {
    id v5 = *(void **)(a1 + 88);
LABEL_79:
    id v4 = v5;
  }
LABEL_80:
  return v4;
}

void __83__PBFPosterExtensionStoreCoordinator__invalidateAndDeleteStoreCoordinatorsForType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 invalidate];
  id v5 = *(void **)(a1 + 32);
  id v6 = [v4 identifierURL];

  [v5 removeItemAtURL:v6 error:0];
}

- (id)_containerURLForType:(id)a1
{
  if (!a1)
  {
LABEL_4:
    return a1;
  }
  if ((unint64_t)(a2 - 1) <= 2)
  {
    a1 = *((id *)a1 + a2);
    goto LABEL_4;
  }
  a1 = 0;
  return a1;
}

uint64_t __67__PBFPosterExtensionStoreCoordinator__accessLock_deleteEnvironment__block_invoke(uint64_t a1, void *a2)
{
  return [a2 invalidate];
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (BOOL)readonly
{
  return self->_readonly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_accessLock_stagedPosterConfigurationStoreCoordinatorsForUUID, 0);
  objc_storeStrong((id *)&self->_accessLock_posterConfigurationStoreCoordinatorsForUUID, 0);
  objc_storeStrong((id *)&self->_accessLock_staticPosterDescriptorStoreCoordinatorsForUUID, 0);
  objc_storeStrong((id *)&self->_accessLock_posterDescriptorStoreCoordinatorsForUUID, 0);
  objc_storeStrong((id *)&self->_accessLock_transientInfo, 0);
  objc_storeStrong((id *)&self->_accessLock_providerInfo, 0);
  objc_storeStrong((id *)&self->_providerInfoURL, 0);
  objc_storeStrong((id *)&self->_transientInternalInfoURL, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_configurationContainerURL, 0);
  objc_storeStrong((id *)&self->_staticDescriptorsContainerURL, 0);
  objc_storeStrong((id *)&self->_descriptorsContainerURL, 0);
}

- (id)determineRefreshStateWithContext:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 component];
  id v6 = [v4 userInfo];
  uint64_t v7 = [v6 objectForKey:@"extension"];

  *(double *)&uint64_t v68 = [v7 posterExtensionBundleIdentifier];
  id v8 = [v4 userInfo];
  uint64_t v9 = [v8 objectForKey:@"refreshStrategy"];
  if (v9)
  {
    long long v10 = [v4 userInfo];
    uint64_t v11 = [v10 objectForKey:@"refreshStrategy"];
    uint64_t v12 = [v11 unsignedIntegerValue];
  }
  else
  {
    uint64_t v12 = 2;
  }

  unint64_t v13 = [v7 posterExtensionInfoPlist];
  uint64_t v14 = objc_msgSend(v13, "pbf_refreshDescriptorsFrequency");

  id v15 = [v7 posterExtensionInfoPlist];
  if (objc_msgSend(v15, "pbf_supportsDynamicDescriptors")) {
    char v16 = objc_msgSend(v7, "pbf_supportsGalleryOrUserDefaultsHasItOverriddenToSupportGallery:", 0);
  }
  else {
    char v16 = 0;
  }

  if ([v5 isEqualToString:@"PBFDataComponentStaticDescriptors"])
  {
    uint64_t v17 = [v7 posterExtensionInfoPlist];
    uint64_t v18 = objc_msgSend(v17, "pbf_staticDescriptorIdentifiers");
    uint64_t v19 = [v18 count];

    if (!v19)
    {
      uint64_t v34 = [(PBFPosterExtensionStoreCoordinator *)self staticDescriptorStoreCoordinatorsWithError:0];
      uint64_t v35 = [v34 count];

      if (v35)
      {
        uint64_t v29 = [[PBFDataRefreshState alloc] initWithNeedsRefresh:1 reason:@"data store mismatch w/ number of identifiers; an update is needed!"];
        BOOL v21 = (void *)v68;
LABEL_34:

        return v29;
      }
    }
    double v20 = [(PBFPosterExtensionStoreCoordinator *)self providerInfoObjectForKey:@"StaticPersistentIdentifier"];
    BOOL v21 = (void *)v68;
    if (v20 == 0.0)
    {
      uint64_t v29 = [[PBFDataRefreshState alloc] initWithNeedsRefresh:1 reason:@"No persistent identifier; an update is needed!"];
LABEL_30:

      goto LABEL_34;
    }
    uint64_t v22 = [v7 persistentIdentifier];
    uint64_t v23 = _LSPersistentIdentifierCompare();
    id v24 = [PBFDataRefreshState alloc];
    if (!v23)
    {
      _LSPersistentIdentifierGetDebugDescription();
      double v25 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      uint64_t v36 = _LSPersistentIdentifierGetDebugDescription();
      uint64_t v29 = -[PBFDataRefreshState initWithNeedsRefresh:reason:](v24, "initWithNeedsRefresh:reason:", 1, @"Static descriptors are not up to date; persistent identifier was different -- an updated is needed! (old %@ vs new %@)",
              *(void *)&v25,
              v36);

      goto LABEL_29;
    }
    _LSPersistentIdentifierGetDebugDescription();
    double v25 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    double v58 = v25;
    id v26 = @"Static descriptors are up to date (%@)";
    uint64_t v27 = v24;
    goto LABEL_12;
  }
  if ([v5 isEqualToString:@"PBFDataComponentDynamicDescriptors"])
  {
    uint64_t v17 = [(PBFPosterExtensionStoreCoordinator *)self dynamicDescriptorStoreCoordinatorsWithError:0];
    *(double *)&uint64_t v30 = COERCE_DOUBLE([v17 count]);
    if (v16)
    {
      if (v12)
      {
        if (v14)
        {
          if (v12 == 3)
          {
            uint64_t v31 = [PBFDataRefreshState alloc];
            BOOL v21 = (void *)v68;
            uint64_t v59 = v68;
            uint64_t v32 = @"(%@) refreshStrategy is PBFDescriptorRefreshStrategyRefreshAlways; so that's what we'll do.";
LABEL_22:
            uint64_t v33 = 1;
LABEL_33:
            uint64_t v29 = -[PBFDataRefreshState initWithNeedsRefresh:reason:](v31, "initWithNeedsRefresh:reason:", v33, v32, v59, *(void *)&v60);
            goto LABEL_34;
          }
          double v20 = COERCE_DOUBLE(objc_alloc_init(MEMORY[0x1E4F4F6C8]));
          uint64_t v22 = [(PBFPosterExtensionStoreCoordinator *)self lastRefreshStashedBuildVersion];
          if (v22)
          {
            if ([*(id *)&v20 isEqual:v22])
            {
              double v67 = v20;
              uint64_t v38 = [(PBFPosterExtensionStoreCoordinator *)self lastRefreshDescriptorDate];
              uint64_t v39 = v38;
              if (v38)
              {
                id v40 = v38;
              }
              else
              {
                id v40 = [MEMORY[0x1E4F1C9C8] distantPast];
              }
              id v42 = v40;

              int v43 = [v4 now];
              [v43 timeIntervalSinceDate:v42];
              double v45 = v44;

              double v25 = *(double *)&v42;
              if (v12 == 1)
              {
                double v20 = v67;
                BOOL v21 = (void *)v68;
                if (v45 > 28800.0)
                {
                  if (*(double *)&v30 != 0.0)
                  {
                    v46 = [MEMORY[0x1E4F1C9C8] distantPast];
                    double v47 = v25;
                    int v48 = [*(id *)&v25 isEqual:v46];

                    if (v48)
                    {
                      double v63 = v47;
                      long long v71 = 0u;
                      long long v72 = 0u;
                      long long v69 = 0u;
                      long long v70 = 0u;
                      obuint64_t j = v17;
                      double v20 = v67;
                      uint64_t v66 = [obj countByEnumeratingWithState:&v69 objects:v73 count:16];
                      if (v66)
                      {
                        uint64_t v65 = *(void *)v70;
                        while (2)
                        {
                          for (uint64_t i = 0; i != v66; ++i)
                          {
                            if (*(void *)v70 != v65) {
                              objc_enumerationMutation(obj);
                            }
                            uint64_t v50 = [*(id *)(*((void *)&v69 + 1) + 8 * i) pathOfLatestVersion];
                            if (v50)
                            {
                              uint64_t v51 = (void *)v50;
                              uint64_t v52 = (void *)[objc_alloc(MEMORY[0x1E4F92650]) _initWithPath:v50];
                              int v53 = objc_msgSend(v52, "pbf_isInitialPosterDescriptor");

                              if (v53) {
                                continue;
                              }
                            }

                            BOOL v21 = (void *)v68;
                            double v47 = v63;
                            goto LABEL_66;
                          }
                          double v20 = v67;
                          BOOL v21 = (void *)v68;
                          uint64_t v66 = [obj countByEnumeratingWithState:&v69 objects:v73 count:16];
                          if (v66) {
                            continue;
                          }
                          break;
                        }
                      }

                      uint64_t v29 = -[PBFDataRefreshState initWithNeedsRefresh:reason:]([PBFDataRefreshState alloc], "initWithNeedsRefresh:reason:", 1, @"(%@) refreshStrategy is PBFDescriptorRefreshStrategyRefreshIfEmpty; There are no descriptors && no attempt to refresh descriptors has occured within the last 8 hours, so an update is needed!",
                              v21);
                      double v25 = v63;
                    }
                    else
                    {
LABEL_66:
                      uint64_t v29 = -[PBFDataRefreshState initWithNeedsRefresh:reason:]([PBFDataRefreshState alloc], "initWithNeedsRefresh:reason:", 0, @"(%@) refreshStrategy is PBFDescriptorRefreshStrategyRefreshIfEmpty; extension hosts %lu dynamic descriptors & last refresh date was %@; next sync needed in %f",
                              v21,
                              v30,
                              *(void *)&v47,
                              v45 + -28800.0);
                      double v25 = v47;
                      double v20 = v67;
                    }
                    goto LABEL_29;
                  }
                  uint64_t v27 = [PBFDataRefreshState alloc];
                  double v58 = *(double *)&v68;
                  id v26 = @"(%@) refreshStrategy is PBFDescriptorRefreshStrategyRefreshIfEmpty; There are no descriptors && no attempt to refresh descriptors has occured within the last 8 hours, so an update is needed!";
                  goto LABEL_44;
                }
                uint64_t v27 = [PBFDataRefreshState alloc];
                double v62 = v45 + -28800.0;
                double v60 = *(double *)&v30;
                double v61 = v25;
                double v58 = *(double *)&v68;
                id v26 = @"(%@) refreshStrategy is PBFDescriptorRefreshStrategyRefreshIfEmpty; extension hosts %lu dynamic descriptors & last refresh date was %@; next sync needed in %f";
LABEL_12:
                uint64_t v28 = 0;
LABEL_13:
                uint64_t v29 = -[PBFDataRefreshState initWithNeedsRefresh:reason:](v27, "initWithNeedsRefresh:reason:", v28, v26, *(void *)&v58, *(void *)&v60, *(void *)&v61, *(void *)&v62);
LABEL_29:

                goto LABEL_30;
              }
              uint64_t v54 = [v4 component];
              PBFDefaultUpdateIntervalForDataComponent(v54);
              double v56 = v55;

              uint64_t v27 = [PBFDataRefreshState alloc];
              double v20 = v67;
              BOOL v21 = (void *)v68;
              if (v45 <= v56)
              {
                double v58 = v56 - v45;
                id v26 = @"Dynamic descriptors are up to date, update needed in %f seconds";
                goto LABEL_12;
              }
              double v58 = v56;
              double v60 = v45 - v56;
              id v26 = @"Dynamic descriptors have exceeded expiration interval '%f' by %f seconds; needs update";
LABEL_44:
              uint64_t v28 = 1;
              goto LABEL_13;
            }
            BOOL v41 = [PBFDataRefreshState alloc];
            PBFDescriptorRefreshStrategyToString(v12);
            double v25 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            double v61 = *(double *)&v22;
            double v62 = v20;
            BOOL v21 = (void *)v68;
            double v58 = *(double *)&v68;
            double v60 = v25;
            id v26 = @"(%@) refreshStrategy is %@; stashed build version (%@) does not match current build version (%@)";
          }
          else
          {
            BOOL v41 = [PBFDataRefreshState alloc];
            PBFDescriptorRefreshStrategyToString(v12);
            double v25 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            double v60 = v25;
            double v61 = v20;
            BOOL v21 = (void *)v68;
            double v58 = *(double *)&v68;
            id v26 = @"(%@) refreshStrategy is %@; however there is no stashedBuildVersion, so we should proceed (%@)";
          }
          uint64_t v27 = v41;
          goto LABEL_44;
        }
        uint64_t v31 = [PBFDataRefreshState alloc];
        BOOL v21 = (void *)v68;
        uint64_t v59 = v68;
        uint64_t v32 = @"(%@) Extension requested no automatic updates ever";
      }
      else
      {
        uint64_t v31 = [PBFDataRefreshState alloc];
        BOOL v21 = (void *)v68;
        uint64_t v59 = v68;
        uint64_t v32 = @"(%@) Refresh Strategy was PBFDescriptorRefreshStrategyRefreshNo; skipping all refresh checks.";
      }
    }
    else
    {
      uint64_t v31 = [PBFDataRefreshState alloc];
      if (*(double *)&v30 != 0.0)
      {
        BOOL v21 = (void *)v68;
        uint64_t v59 = v68;
        double v60 = *(double *)&v30;
        uint64_t v32 = @"(%@) Dynamic descriptors are not supported, but the data store has %lu; an updated is needed!";
        goto LABEL_22;
      }
      BOOL v21 = (void *)v68;
      uint64_t v59 = v68;
      double v60 = 0.0;
      uint64_t v32 = @"(%@) Dynamic descriptors are not supported, but the data store has %lu - no update is needed.";
    }
    uint64_t v33 = 0;
    goto LABEL_33;
  }
  long long v57 = [NSString stringWithFormat:@"unhandled component: %@", v5];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[PBFPosterExtensionStoreCoordinator(PBFDataFreshnessStateAdditions) determineRefreshStateWithContext:]();
  }
  [v57 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)initWithContainerURL:extensionIdentifier:readonly:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithContainerURL:extensionIdentifier:readonly:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)dynamicDescriptorStoreCoordinatorForIdentifier:role:createIfNil:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_accessLock_createModelStoreCoordinator:posterUUID:descriptorIdentifier:role:error:.cold.1()
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9_0(&dword_1D31CE000, v0, v1, "%s> error: %@", v2, v3, v4, v5, 2u);
}

- (void)_accessLock_stageNewConfigurationStoreCoordinatorForPosterUUID:descriptorIdentifier:role:error:.cold.1()
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9_0(&dword_1D31CE000, v0, v1, "%s> error: %@", v2, v3, v4, v5, 2u);
}

- (void)providerInfoSetObject:forKey:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)providerInfoSetObject:forKey:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_accessLock_providerInfoSetObject:(uint64_t)a1 forKey:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 128);
  int v4 = 136315650;
  uint64_t v5 = "-[PBFPosterExtensionStoreCoordinator _accessLock_providerInfoSetObject:forKey:error:]";
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1D31CE000, log, OS_LOG_TYPE_ERROR, "%s> error archiving provider info: data could not be written for extension '%{public}@': %{public}@", (uint8_t *)&v4, 0x20u);
}

- (void)_accessLock_transientInternalInfo
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9_0(&dword_1D31CE000, v0, v1, "%s> error reading transient info: %@", v2, v3, v4, v5, 2u);
}

@end