@interface PBFPosterModelStoreCoordinator
+ (BOOL)requiresDescriptorIdentifier;
+ (BOOL)shouldBeExcludedFromBackup;
+ (NSDictionary)expectedURLResourceValuesForDirectories;
+ (NSDictionary)expectedURLResourceValuesForFiles;
+ (NSString)expectedFileProtection;
+ (id)createNewStoreCoordinatorWithPath:(id)a3 error:(id *)a4;
+ (id)expectedSnapshotURLResourceValues;
+ (int64_t)type;
- (BOOL)_accessQueue_configureFileSystemForNewContents:(id)a3 atPath:(id)a4 error:(id *)a5;
- (BOOL)commitStagedWithError:(id *)a3;
- (BOOL)hasKnownVersions;
- (BOOL)setProviderInfo:(id)a3 error:(id *)a4;
- (NSDictionary)providerInfo;
- (NSFileManager)fileManager;
- (NSSet)snapshotURLs;
- (NSString)descriptorIdentifier;
- (NSString)extensionIdentifier;
- (NSString)role;
- (NSURL)identifierURL;
- (NSUUID)posterUUID;
- (OS_dispatch_queue)accessQueue;
- (PBFPosterModelStoreCoordinator)initWithProvider:(id)a3 identifierURL:(id)a4 posterUUID:(id)a5;
- (PBFPosterModelStoreCoordinator)initWithProvider:(id)a3 identifierURL:(id)a4 posterUUID:(id)a5 readonly:(BOOL)a6;
- (id)_accessQueue_allPosterPaths;
- (id)_accessQueue_buildIdentityForVersion:(unint64_t)a3 supplement:(unint64_t)a4;
- (id)_accessQueue_checkEnvironmentConsistency;
- (id)_accessQueue_contentsOfURLWithinStore:(id)a3 resourceKeys:(id)a4 standardizeURLs:(BOOL)a5;
- (id)_accessQueue_fetchIdentityForVersion:(unint64_t)a3 supplement:(unint64_t)a4 error:(id *)a5;
- (id)_accessQueue_identityOfLatestVersion;
- (id)_accessQueue_posterPathForIdentity:(id)a3;
- (id)_accessQueue_posterSnapshotCoordinatorForIdentity:(id)a3;
- (id)_accessQueue_providerInfoWithError:(id *)a3;
- (id)_accessQueue_setupNewSupplementWithOptions:(unint64_t)a3 error:(id *)a4;
- (id)_accessQueue_setupNewVersionWithOptions:(unint64_t)a3 contents:(id)a4 error:(id *)a5;
- (id)_accessQueue_snapshotURLs;
- (id)_posterPathForIdentity:(id)a3;
- (id)addNewSupplementWithError:(id *)a3;
- (id)addNewVersionWithContents:(id)a3 error:(id *)a4;
- (id)allPosterPaths;
- (id)checkEnvironmentConsistency;
- (id)ensureFileSystemIntegrity;
- (id)identityForVersion:(unint64_t)a3 supplement:(unint64_t)a4;
- (id)identityOfLatestVersion;
- (id)objectForKeyedSubscript:(id)a3;
- (id)pathForIdentity:(id)a3;
- (id)pathForVersion:(unint64_t)a3 supplement:(unint64_t)a4;
- (id)pathOfLatestVersion;
- (id)pbf_posterSnapshotCoordinatorForIdentity:(id)a3;
- (id)reapSnapshotsMatchingURLs:(id)a3;
- (id)stageNewSupplementWithError:(id *)a3;
- (id)stageNewVersionWithContents:(id)a3 error:(id *)a4;
- (void)_accessQueue_applyResourceValuesForURLs:(id)a3 expectedResourceValues:(id)a4 synchronous:(BOOL)a5;
- (void)_accessQueue_checkEnvironmentConsistency;
- (void)_accessQueue_enumerateSnapshotCoordinators:(id)a3;
- (void)_accessQueue_fixupResourceValuesWithinURL:(id)a3 synchronous:(BOOL)a4;
- (void)_accessQueue_invalidate;
- (void)_accessQueue_purgeSnapshotCache;
- (void)_accessQueue_removeSupplement:(unint64_t)a3 forVersion:(unint64_t)a4 error:(id *)a5;
- (void)_accessQueue_writeProviderInfo:(id)a3 error:(id *)a4;
- (void)_correctPermissionsForInternalDirectories:(id *)a3;
- (void)abortStaged;
- (void)invalidate;
- (void)pbf_enumerateSnapshotCoordinators:(id)a3;
- (void)purgeSnapshotCache;
- (void)reapEverythingExceptLatestVersion;
- (void)reapSnapshots;
- (void)removeSupplement:(unint64_t)a3 forVersion:(unint64_t)a4 error:(id *)a5;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setProviderInfo:(id)a3;
@end

@implementation PBFPosterModelStoreCoordinator

+ (id)createNewStoreCoordinatorWithPath:(id)a3 error:(id *)a4
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 identity];
  v7 = [v6 provider];

  v8 = [v5 identity];
  v9 = [v8 posterUUID];

  v10 = [v5 descriptorIdentifier];
  v11 = [v5 identity];
  v12 = [v11 role];

  id v13 = v7;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v13)
  {
    v62 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:]();
    }
    [v62 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3214390);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v63 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:]();
    }
    [v63 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32143F4);
  }

  id v14 = v9;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v14)
  {
    v64 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:]();
    }
    [v64 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3214458);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v65 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:]();
    }
    [v65 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32144BCLL);
  }

  id v15 = v10;
  if (v15)
  {
    NSClassFromString(&cfstr_Nsstring.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v69 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:]1();
      }
      [v69 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D321464CLL);
    }
  }

  if (PFPosterRoleIsValid())
  {
    v16 = v12;
  }
  else
  {
    v16 = PRPosterRoleLookupForExtensionBundleIdentifier(v13, v15);

    v17 = PBFLogPosterContents();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v102 = "+[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:]";
      __int16 v103 = 2112;
      v104 = v16;
      _os_log_impl(&dword_1D31CE000, v17, OS_LOG_TYPE_DEFAULT, "[Invalid Role][%{public}s] role was invalid, recovered: %@", buf, 0x16u);
    }
  }
  id v18 = v16;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v18)
  {
    v66 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:]();
    }
    [v66 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3214520);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v67 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:]();
    }
    [v67 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D3214584);
  }

  if ((PFPosterRoleIsValid() & 1) == 0)
  {
    v68 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"PFPosterRoleIsValid(role)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.9();
    }
    [v68 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D32145E8);
  }
  v19 = (objc_class *)a1;
  v20 = objc_opt_new();
  v21 = [v5 identifierURL];
  v85 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_providerInfoFileURLForIdentifierURL:", v21);
  uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_versionsURLForIdentifierURL:", v21);
  v83 = v5;
  if (![v21 checkResourceIsReachableAndReturnError:0])
  {
    v82 = v18;
    v74 = v19;
    v78 = v15;
    id v79 = v14;
    id v77 = v13;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PBFPosterModelStoreCoordinator_createNewStoreCoordinatorWithPath_error___block_invoke;
    aBlock[3] = &unk_1E69808E8;
    v81 = v20;
    id v32 = v20;
    id v95 = v32;
    id v33 = v21;
    id v96 = v33;
    v80 = _Block_copy(aBlock);
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id v75 = v33;
    v76 = (void *)v22;
    v97[0] = v33;
    v97[1] = v22;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:2];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v90 objects:v98 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      id v26 = 0;
      uint64_t v37 = *(void *)v91;
      while (2)
      {
        uint64_t v38 = 0;
        v39 = v26;
        do
        {
          if (*(void *)v91 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v40 = *(void *)(*((void *)&v90 + 1) + 8 * v38);
          v41 = PFFileProtectionNoneAttributes();
          id v89 = v39;
          LOBYTE(v40) = [v32 createDirectoryAtURL:v40 withIntermediateDirectories:1 attributes:v41 error:&v89];
          id v26 = v89;

          if ((v40 & 1) == 0)
          {
            if (a4) {
              *a4 = v26;
            }
            v42 = v80;
            (*((void (**)(void *))v80 + 2))(v80);
            id v28 = 0;
            v31 = v83;
            id v13 = v77;
            v30 = v78;
            id v14 = v79;
            v29 = v76;
            goto LABEL_66;
          }
          ++v38;
          v39 = v26;
        }
        while (v36 != v38);
        uint64_t v36 = [v34 countByEnumeratingWithState:&v90 objects:v98 count:16];
        if (v36) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v26 = 0;
    }

    v30 = v78;
    if (v78)
    {
      v43 = (void *)MEMORY[0x1E4F1CB10];
      v31 = v83;
      v44 = [v83 identity];
      v34 = objc_msgSend(v43, "pbf_descriptorIdentifierURLForType:identifierURL:", objc_msgSend(v44, "type"), v75);

      id v14 = v79;
      v45 = a4;
      if (![v78 length])
      {
        v71 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[descriptorIdentifier length] > 0"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.8();
        }
        [v71 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1D321470CLL);
      }
      v46 = [v78 dataUsingEncoding:4];
      id v88 = v26;
      char v47 = [v46 writeToURL:v34 options:268435457 error:&v88];
      id v48 = v88;

      if ((v47 & 1) == 0)
      {
        id v26 = v48;
        if (a4) {
          *a4 = v48;
        }
        v42 = v80;
        (*((void (**)(void *))v80 + 2))(v80);

        id v28 = 0;
        v29 = v76;
        id v13 = v77;
        goto LABEL_66;
      }

      v49 = v48;
    }
    else
    {
      v49 = v26;
      v31 = v83;
      v45 = a4;
      id v14 = v79;
    }
    v50 = (void *)MEMORY[0x1E4F1CB10];
    v51 = [v31 identity];
    v34 = objc_msgSend(v50, "pbf_roleIdentifierURLForType:identifierURL:", objc_msgSend(v51, "type"), v75);

    v52 = [v82 dataUsingEncoding:4];
    if (![v52 length])
    {
      v70 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[roleIdentifierData length] > 0"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.4();
      }
      [v70 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D32146ACLL);
    }
    id v87 = v49;
    char v53 = [v52 writeToURL:v34 options:268435457 error:&v87];
    id v26 = v87;

    if (v53)
    {
      v54 = objc_msgSend(MEMORY[0x1E4F28DB0], "bs_secureDataFromObject:", MEMORY[0x1E4F1CC08]);
      id v86 = v26;
      char v55 = [v54 writeToURL:v85 options:268435457 error:&v86];
      id v73 = v86;

      v72 = v54;
      if (v55)
      {
        id v13 = v77;
        v56 = (void *)[[v74 alloc] initWithProvider:v77 identifierURL:v75 posterUUID:v14];
        v57 = v56;
        if (v56) {
          [v56 checkEnvironmentConsistency];
        }
        else {
          objc_msgSend(MEMORY[0x1E4F28C58], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3329, 0);
        }
        id v26 = (id)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          if (a4) {
            *a4 = v26;
          }
          v60 = PBFLogPosterContents();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
            +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.5();
          }

          (*((void (**)(void))v80 + 2))();
          id v28 = 0;
        }
        else
        {
          id v28 = v57;
        }

        id v14 = v79;
        v29 = v76;
      }
      else
      {
        if (v45) {
          id *v45 = v73;
        }
        v59 = PBFLogPosterContents();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
          +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.6();
        }

        (*((void (**)(void *))v80 + 2))(v80);
        id v28 = 0;
        v29 = v76;
        id v13 = v77;
        id v26 = v73;
      }
    }
    else
    {
      if (v45) {
        id *v45 = v26;
      }
      v58 = PBFLogPosterContents();
      id v13 = v77;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        +[PBFPosterModelStoreCoordinator createNewStoreCoordinatorWithPath:error:].cold.7();
      }

      (*((void (**)(void))v80 + 2))();
      id v28 = 0;
      v29 = v76;
    }

    v42 = v80;
LABEL_66:

    v27 = v95;
    goto LABEL_67;
  }
  id v23 = v15;
  v24 = (void *)v22;
  if (!a4)
  {
    id v28 = 0;
    v29 = (void *)v22;
    v30 = v23;
    v31 = v83;
    goto LABEL_68;
  }
  v81 = v20;
  v82 = v18;
  v25 = (void *)MEMORY[0x1E4F28C58];
  v99[0] = @"posterUUID";
  objc_msgSend(MEMORY[0x1E4F29128], "pf_nonnullUUIDStringOrSentinel:", v14);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  v99[1] = @"identifierURL";
  v100[0] = v26;
  v100[1] = v21;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:2];
  objc_msgSend(v25, "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3332, v27);
  id v28 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  v29 = v24;
  v30 = v23;
  v31 = v83;
LABEL_67:

  v20 = v81;
  id v18 = v82;
LABEL_68:

  return v28;
}

uint64_t __74__PBFPosterModelStoreCoordinator_createNewStoreCoordinatorWithPath_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeItemAtURL:*(void *)(a1 + 40) error:0];
}

+ (int64_t)type
{
  return 0;
}

+ (BOOL)shouldBeExcludedFromBackup
{
  return 0;
}

+ (BOOL)requiresDescriptorIdentifier
{
  return 1;
}

+ (NSString)expectedFileProtection
{
  return (NSString *)(id)*MEMORY[0x1E4F1C598];
}

- (PBFPosterModelStoreCoordinator)initWithProvider:(id)a3 identifierURL:(id)a4 posterUUID:(id)a5
{
  return [(PBFPosterModelStoreCoordinator *)self initWithProvider:a3 identifierURL:a4 posterUUID:a5 readonly:0];
}

- (PBFPosterModelStoreCoordinator)initWithProvider:(id)a3 identifierURL:(id)a4 posterUUID:(id)a5 readonly:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PBFPosterModelStoreCoordinator;
  id v13 = [(PBFPosterModelStoreCoordinator *)&v25 init];
  if (!v13) {
    goto LABEL_3;
  }
  uint64_t v14 = [v10 copy];
  extensionIdentifier = v13->_extensionIdentifier;
  v13->_extensionIdentifier = (NSString *)v14;

  uint64_t v16 = [v12 copy];
  posterUUID = v13->_posterUUID;
  v13->_posterUUID = (NSUUID *)v16;

  id v18 = [v11 URLByDeletingLastPathComponent];
  uint64_t v19 = [v18 URLByDeletingLastPathComponent];
  providerURL = v13->_providerURL;
  v13->_providerURL = (NSURL *)v19;

  uint64_t v21 = [v11 copy];
  identifierURL = v13->_identifierURL;
  v13->_identifierURL = (NSURL *)v21;

  v13->_readonly = a6;
  [(PBFPosterModelStoreCoordinator *)v13 _correctPermissionsForInternalDirectories:0];
  id v23 = 0;
  if (PBFPosterModelStoreCoordinatorSharedInit(v13)) {
LABEL_3:
  }
    id v23 = v13;

  return v23;
}

- (id)checkEnvironmentConsistency
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__PBFPosterModelStoreCoordinator_checkEnvironmentConsistency__block_invoke;
  v5[3] = &unk_1E6980E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __61__PBFPosterModelStoreCoordinator_checkEnvironmentConsistency__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_accessQueue_checkEnvironmentConsistency");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)ensureFileSystemIntegrity
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PBFPosterModelStoreCoordinator_ensureFileSystemIntegrity__block_invoke;
  block[3] = &unk_1E69808C0;
  block[4] = self;
  dispatch_sync(accessQueue, block);
  return 0;
}

void __59__PBFPosterModelStoreCoordinator_ensureFileSystemIntegrity__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_accessQueue_fixupResourceValuesWithinURL:synchronous:", 0, 1);
  uint64_t v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_accessQueue_snapshotURLs");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v5 allObjects];
  v4 = [(id)objc_opt_class() expectedSnapshotURLResourceValues];
  objc_msgSend(v2, "_accessQueue_applyResourceValuesForURLs:expectedResourceValues:synchronous:", v3, v4, 1);
}

+ (NSDictionary)expectedURLResourceValuesForFiles
{
  v8[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)objc_opt_class() shouldBeExcludedFromBackup];
  uint64_t v3 = [(id)objc_opt_class() expectedFileProtection];
  v7[0] = *MEMORY[0x1E4F1C630];
  v4 = [NSNumber numberWithBool:v2];
  v7[1] = *MEMORY[0x1E4F1C590];
  v8[0] = v4;
  v8[1] = v3;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

+ (NSDictionary)expectedURLResourceValuesForDirectories
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)objc_opt_class() expectedFileProtection];
  uint64_t v5 = *MEMORY[0x1E4F1C590];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

+ (id)expectedSnapshotURLResourceValues
{
  v7[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1C590];
  v6[0] = *MEMORY[0x1E4F1C630];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1C598];
  v7[0] = MEMORY[0x1E4F1CC38];
  v7[1] = v3;
  void v6[2] = *MEMORY[0x1E4F1C660];
  void v7[2] = MEMORY[0x1E4F1CC38];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  return v4;
}

- (void)_correctPermissionsForInternalDirectories:(id *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (-[NSURL checkResourceIsReachableAndReturnError:](self->_identifierURL, "checkResourceIsReachableAndReturnError:"))
  {
    uint64_t v5 = [(id)objc_opt_class() type];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_roleIdentifierURLForType:identifierURL:", v5, self->_identifierURL);
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_descriptorIdentifierURLForType:identifierURL:", v5, self->_identifierURL);
    uint64_t v8 = [(id)objc_opt_class() expectedURLResourceValuesForFiles];
    v9 = [v8 objectForKey:*MEMORY[0x1E4F1C630]];

    uint64_t v35 = v9;
    if (v9) {
      unsigned int v39 = [v9 BOOLValue];
    }
    else {
      unsigned int v39 = 0;
    }
    id v10 = [(id)objc_opt_class() expectedURLResourceValuesForFiles];
    uint64_t v11 = [v10 objectForKey:*MEMORY[0x1E4F1C590]];

    id v12 = (void *)*MEMORY[0x1E4F1C598];
    v34 = (void *)v11;
    if (v11) {
      id v12 = (void *)v11;
    }
    id v13 = v12;
    uint64_t v14 = PBFLogPosterContents();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      identifierURL = self->_identifierURL;
      *(_DWORD *)buf = 138412290;
      *(void *)id v48 = identifierURL;
      _os_log_impl(&dword_1D31CE000, v14, OS_LOG_TYPE_DEFAULT, "-[PBFPosterModelStoreCoordinator _correctPermissionsForInternalDirectories]> securing file system permissions for URLs under: %@", buf, 0xCu);
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v49[0] = self->_identifierURL;
    v49[1] = v6;
    uint64_t v36 = (void *)v7;
    uint64_t v37 = (void *)v6;
    v49[2] = v7;
    id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
    uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v44 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          id v42 = 0;
          char v21 = objc_msgSend(v20, "pbf_setFileProtection:error:", v13, &v42, v34, v35);
          id v22 = v42;
          unint64_t v23 = (unint64_t)v22;
          if ((v21 & 1) == 0)
          {
            int v24 = objc_msgSend(v22, "pf_isFileNotFoundError");
            objc_super v25 = PBFLogPosterContents();
            id v26 = v25;
            if (v24)
            {
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)id v48 = v20;
                _os_log_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_DEFAULT, "-[PBFPosterModelStoreCoordinator _correctPermissionsForInternalDirectories]> skipping nonexistent file: %@", buf, 0xCu);
              }
              goto LABEL_39;
            }
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              *(void *)id v48 = v13;
              *(_WORD *)&v48[8] = 2112;
              *(void *)&v48[10] = v20;
              *(_WORD *)&v48[18] = 2114;
              *(void *)&v48[20] = v23;
              _os_log_error_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_ERROR, "-[PBFPosterModelStoreCoordinator _correctPermissionsForInternalDirectories]> failed to correct file protection (%{public}@) for file %@: %{public}@", buf, 0x20u);
            }
          }
          id v41 = 0;
          char v27 = objc_msgSend(v20, "pbf_setPurgable:error:", 0, &v41);
          id v26 = v41;
          if ((v27 & 1) == 0)
          {
            id v28 = PBFLogPosterContents();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)id v48 = v20;
              *(_WORD *)&v48[8] = 2114;
              *(void *)&v48[10] = v26;
              _os_log_error_impl(&dword_1D31CE000, v28, OS_LOG_TYPE_ERROR, "-[PBFPosterModelStoreCoordinator _correctPermissionsForInternalDirectories]> failed to correct file purgable for file %@: %{public}@", buf, 0x16u);
            }
          }
          id v40 = 0;
          char v29 = objc_msgSend(v20, "pbf_setExcludedFromBackup:error:", v39, &v40);
          unint64_t v30 = (unint64_t)v40;
          if ((v29 & 1) == 0)
          {
            v31 = PBFLogPosterContents();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)id v48 = v39;
              *(_WORD *)&v48[4] = 2112;
              *(void *)&v48[6] = v20;
              *(_WORD *)&v48[14] = 2114;
              *(void *)&v48[16] = v30;
              _os_log_error_impl(&dword_1D31CE000, v31, OS_LOG_TYPE_ERROR, "-[PBFPosterModelStoreCoordinator _correctPermissionsForInternalDirectories]> failed to correct exclude-from-backup (%{BOOL}u) for file %@: %{public}@", buf, 0x1Cu);
            }
          }
          if (a3 && (unint64_t)v26 | v30 | v23)
          {
            if (v30) {
              id v32 = (id)v30;
            }
            else {
              id v32 = (id)v23;
            }
            if (v26) {
              id v33 = v26;
            }
            else {
              id v33 = v32;
            }
            *a3 = v33;
          }

LABEL_39:
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
      }
      while (v17);
    }
  }
}

- (id)_accessQueue_contentsOfURLWithinStore:(id)a3 resourceKeys:(id)a4 standardizeURLs:(BOOL)a5
{
  BOOL v6 = a5;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v29 = a4;
  unint64_t v30 = v9;
  if ([v9 isEqual:self->_identifierURL]) {
    goto LABEL_26;
  }
  id v10 = [v9 URLByStandardizingPath];
  uint64_t v5 = [v10 path];
  uint64_t v11 = [(NSURL *)self->_identifierURL URLByStandardizingPath];
  id v12 = [v11 path];
  int v13 = [v5 hasPrefix:v12];

  if (v13)
  {
LABEL_26:
    if (objc_msgSend(v9, "pbf_isDirectory"))
    {
      uint64_t v37 = 0;
      uint64_t v38 = &v37;
      uint64_t v39 = 0x3032000000;
      id v40 = __Block_byref_object_copy__1;
      id v41 = __Block_byref_object_dispose__1;
      id v42 = 0;
      fileManager = self->_fileManager;
      id v15 = [v29 allObjects];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __101__PBFPosterModelStoreCoordinator__accessQueue_contentsOfURLWithinStore_resourceKeys_standardizeURLs___block_invoke;
      v35[3] = &unk_1E69821C8;
      v35[4] = &v37;
      BOOL v36 = v6;
      uint64_t v16 = [(NSFileManager *)fileManager enumeratorAtURL:v9 includingPropertiesForKeys:v15 options:16 errorHandler:v35];

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v43 count:16];
      if (!v18) {
        goto LABEL_18;
      }
      uint64_t v19 = *(void *)v32;
      while (1)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(v17);
          }
          char v21 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v22 = (void *)v38[5];
          if (!v22)
          {
            uint64_t v23 = objc_opt_new();
            int v24 = (void *)v38[5];
            v38[5] = v23;

            id v22 = (void *)v38[5];
            if (!v6) {
              goto LABEL_14;
            }
LABEL_13:
            uint64_t v5 = [v21 URLByStandardizingPath];
            char v21 = v5;
            goto LABEL_14;
          }
          if (v6) {
            goto LABEL_13;
          }
LABEL_14:
          [v22 addObject:v21];
          if (v6) {
        }
          }
        uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v43 count:16];
        if (!v18)
        {
LABEL_18:

          id v25 = (id)v38[5];
          _Block_object_dispose(&v37, 8);

          goto LABEL_21;
        }
      }
    }
    id v26 = [v29 allObjects];
    id v27 = (id)[v9 resourceValuesForKeys:v26 error:0];

    id v25 = [MEMORY[0x1E4F1CAA0] orderedSetWithObject:v9];
  }
  else
  {
    id v25 = 0;
  }
LABEL_21:

  return v25;
}

uint64_t __101__PBFPosterModelStoreCoordinator__accessQueue_contentsOfURLWithinStore_resourceKeys_standardizeURLs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v7)
  {
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v11 = [v5 URLByStandardizingPath];
    [v7 addObject:v11];
  }
  else
  {
    [v7 addObject:v5];
  }

  return 0;
}

- (void)invalidate
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PBFPosterModelStoreCoordinator_invalidate__block_invoke;
  block[3] = &unk_1E69808C0;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

uint64_t __44__PBFPosterModelStoreCoordinator_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessQueue_invalidate");
}

- (NSString)role
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (PFPosterRoleIsValid())
  {
    uint64_t v3 = self->_role;
  }
  else
  {
    PRPosterRoleLookupForExtensionBundleIdentifier(self->_extensionIdentifier, self->_descriptorIdentifier);
    uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    v4 = PBFLogPosterContents();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      role = self->_role;
      int v7 = 136315650;
      uint64_t v8 = "-[PBFPosterModelStoreCoordinator role]";
      __int16 v9 = 2112;
      id v10 = role;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1D31CE000, v4, OS_LOG_TYPE_DEFAULT, "%s> invalid role: %@ – returning: %@", (uint8_t *)&v7, 0x20u);
    }
  }
  return v3;
}

- (id)identityOfLatestVersion
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  __int16 v9 = __Block_byref_object_copy__1;
  id v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PBFPosterModelStoreCoordinator_identityOfLatestVersion__block_invoke;
  v5[3] = &unk_1E6980E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __57__PBFPosterModelStoreCoordinator_identityOfLatestVersion__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_accessQueue_identityOfLatestVersion");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)identityForVersion:(unint64_t)a3 supplement:(unint64_t)a4
{
  uint64_t v8 = 0;
  __int16 v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__1;
  id v12 = __Block_byref_object_dispose__1;
  id v13 = 0;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __64__PBFPosterModelStoreCoordinator_identityForVersion_supplement___block_invoke;
  v7[3] = &unk_1E69821F0;
  void v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_sync(accessQueue, v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __64__PBFPosterModelStoreCoordinator_identityForVersion_supplement___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 104);
  uint64_t v3 = [NSNumber numberWithUnsignedLongLong:a1[6]];
  v4 = [v2 objectForKey:v3];
  id v5 = [NSNumber numberWithUnsignedLongLong:a1[7]];
  uint64_t v6 = [v4 objectForKey:v5];
  uint64_t v7 = *(void *)(a1[5] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    __int16 v9 = *(void **)(a1[4] + 112);
    id v15 = [NSNumber numberWithUnsignedLongLong:a1[6]];
    uint64_t v10 = [v9 objectForKey:v15];
    id v11 = [NSNumber numberWithUnsignedLongLong:a1[7]];
    uint64_t v12 = [v10 objectForKey:v11];
    uint64_t v13 = *(void *)(a1[5] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

- (id)pathForVersion:(unint64_t)a3 supplement:(unint64_t)a4
{
  id v5 = [(PBFPosterModelStoreCoordinator *)self identityForVersion:a3 supplement:a4];
  if (v5)
  {
    uint64_t v6 = [(PBFPosterModelStoreCoordinator *)self pathForIdentity:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)pathForIdentity:(id)a3
{
  if (a3)
  {
    v4 = -[PBFPosterModelStoreCoordinator _posterPathForIdentity:](self, "_posterPathForIdentity:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)allPosterPaths
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  __int16 v9 = __Block_byref_object_copy__1;
  uint64_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PBFPosterModelStoreCoordinator_allPosterPaths__block_invoke;
  v5[3] = &unk_1E6980E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__PBFPosterModelStoreCoordinator_allPosterPaths__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_accessQueue_allPosterPaths");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSDictionary)providerInfo
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  __int16 v9 = __Block_byref_object_copy__1;
  uint64_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__PBFPosterModelStoreCoordinator_providerInfo__block_invoke;
  v5[3] = &unk_1E6980E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __46__PBFPosterModelStoreCoordinator_providerInfo__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_accessQueue_providerInfoWithError:", 0);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  id v5 = [(PBFPosterModelStoreCoordinator *)self providerInfo];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  __int16 v9 = v8;
  id v20 = v8;
  if (v8)
  {
    char v10 = [v8 conformsToProtocol:&unk_1F2AFF6B0];
    __int16 v9 = v20;
    if ((v10 & 1) == 0)
    {
      uint64_t v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(NSSecureCoding)]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterModelStoreCoordinator setObject:forKeyedSubscript:]();
      }
LABEL_22:
      [v18 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D32167E8);
    }
  }

  id v11 = v7;
  if (!v11)
  {
    uint64_t v18 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterModelStoreCoordinator setObject:forKeyedSubscript:]();
    }
    goto LABEL_22;
  }
  uint64_t v12 = v11;
  if (([v11 conformsToProtocol:&unk_1F2ADCC08] & 1) == 0)
  {
    uint64_t v19 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object conformsToProtocol:@protocol(NSCopying)]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterModelStoreCoordinator setObject:forKeyedSubscript:]();
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321684CLL);
  }

  uint64_t v13 = [(PBFPosterModelStoreCoordinator *)self providerInfo];
  uint64_t v14 = (void *)[v13 mutableCopy];
  id v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = (id)objc_opt_new();
  }
  id v17 = v16;

  if (v20) {
    [v17 setObject:v20 forKeyedSubscript:v12];
  }
  else {
    [v17 removeObjectForKey:v12];
  }
  [(PBFPosterModelStoreCoordinator *)self setProviderInfo:v17];
}

- (void)setProviderInfo:(id)a3
{
}

- (BOOL)setProviderInfo:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_readonly)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__1;
    id v20 = __Block_byref_object_dispose__1;
    id v21 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PBFPosterModelStoreCoordinator_setProviderInfo_error___block_invoke;
    block[3] = &unk_1E6982218;
    block[4] = self;
    id v14 = v6;
    id v15 = &v16;
    dispatch_sync(accessQueue, block);
    char v10 = v17;
    if (a4)
    {
      id v11 = (void *)v17[5];
      if (v11)
      {
        *a4 = v11;
        char v10 = v17;
      }
    }
    BOOL v8 = v10[5] == 0;

    _Block_object_dispose(&v16, 8);
  }

  return v8;
}

void __56__PBFPosterModelStoreCoordinator_setProviderInfo_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = (id *)(*(void *)(a1[6] + 8) + 40);
  id obj = 0;
  objc_msgSend(v2, "_accessQueue_writeProviderInfo:error:", v1, &obj);
  objc_storeStrong(v3, obj);
}

- (id)_posterPathForIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PBFPosterModelStoreCoordinator__posterPathForIdentity___block_invoke;
  block[3] = &unk_1E6982240;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __57__PBFPosterModelStoreCoordinator__posterPathForIdentity___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_accessQueue_posterPathForIdentity:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_accessQueue_posterPathForIdentity:(id)a3
{
  id v4 = a3;
  id v5 = self->_providerURL;
  accessQueue_stagedPosterIdentityBySupplementByVersion = self->_accessQueue_stagedPosterIdentityBySupplementByVersion;
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "version"));
  BOOL v8 = [(NSMutableDictionary *)accessQueue_stagedPosterIdentityBySupplementByVersion objectForKey:v7];
  __int16 v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "supplement"));
  id v10 = [v8 objectForKey:v9];

  if (v10)
  {
    uint64_t v11 = __providerURLForOptions(1, self->_providerURL, v4);

    id v5 = (NSURL *)v11;
  }
  uint64_t v12 = [MEMORY[0x1E4F924D0] pathWithProviderURL:v5 identity:v4];

  return v12;
}

- (id)pathOfLatestVersion
{
  uint64_t v3 = [(PBFPosterModelStoreCoordinator *)self identityOfLatestVersion];
  id v4 = [(PBFPosterModelStoreCoordinator *)self pathForIdentity:v3];

  return v4;
}

- (BOOL)hasKnownVersions
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__PBFPosterModelStoreCoordinator_hasKnownVersions__block_invoke;
  v5[3] = &unk_1E6980E40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__PBFPosterModelStoreCoordinator_hasKnownVersions__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 104) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)reapEverythingExceptLatestVersion
{
  if (!self->_readonly)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__PBFPosterModelStoreCoordinator_reapEverythingExceptLatestVersion__block_invoke;
    block[3] = &unk_1E69808C0;
    block[4] = self;
    dispatch_async(accessQueue, block);
  }
}

void __67__PBFPosterModelStoreCoordinator_reapEverythingExceptLatestVersion__block_invoke(uint64_t a1)
{
  uint64_t v2 = __knownVersions(*(void **)(*(void *)(a1 + 32) + 104));
  char v3 = __knownVersions(*(void **)(*(void *)(a1 + 32) + 112));
  if ([v3 count]) {
    [v2 addIndexes:v3];
  }
  if ([v2 count])
  {
    uint64_t v4 = [v2 lastIndex];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __67__PBFPosterModelStoreCoordinator_reapEverythingExceptLatestVersion__block_invoke_2;
    v5[3] = &unk_1E6982290;
    v5[4] = *(void *)(a1 + 32);
    v5[5] = v4;
    [v2 enumerateIndexesUsingBlock:v5];
  }
}

void __67__PBFPosterModelStoreCoordinator_reapEverythingExceptLatestVersion__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 104);
  id v5 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v6 = [v4 objectForKey:v5];
  id v7 = __knownVersions(v6);

  [v7 count];
  if ([v7 count])
  {
    uint64_t v8 = [v7 lastIndex];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__PBFPosterModelStoreCoordinator_reapEverythingExceptLatestVersion__block_invoke_3;
    v10[3] = &unk_1E6982268;
    uint64_t v9 = *(void *)(a1 + 32);
    v10[6] = *(void *)(a1 + 40);
    v10[7] = v8;
    v10[4] = v9;
    v10[5] = a2;
    [v7 enumerateIndexesUsingBlock:v10];
  }
}

uint64_t __67__PBFPosterModelStoreCoordinator_reapEverythingExceptLatestVersion__block_invoke_3(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 40) != *(void *)(result + 48) || *(void *)(result + 56) != a2) {
    return objc_msgSend(*(id *)(result + 32), "_accessQueue_removeSupplement:forVersion:error:", a2);
  }
  return result;
}

- (void)reapSnapshots
{
  if (!self->_readonly)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PBFPosterModelStoreCoordinator_reapSnapshots__block_invoke;
    block[3] = &unk_1E69808C0;
    block[4] = self;
    dispatch_sync(accessQueue, block);
  }
}

void __47__PBFPosterModelStoreCoordinator_reapSnapshots__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_accessQueue_snapshotURLs");
  [*(id *)(*(void *)(a1 + 32) + 120) removeAllObjects];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = PBFLogReaper();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v16 = v8;
          _os_log_impl(&dword_1D31CE000, v9, OS_LOG_TYPE_INFO, "REAPING SNAPSHOT URL %{public}@", buf, 0xCu);
        }

        id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v10 removeItemAtURL:v8 error:0];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }
}

- (id)reapSnapshotsMatchingURLs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_readonly)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    long long v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__1;
    uint64_t v16 = __Block_byref_object_dispose__1;
    id v17 = (id)[v4 mutableCopy];
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PBFPosterModelStoreCoordinator_reapSnapshotsMatchingURLs___block_invoke;
    block[3] = &unk_1E69822E0;
    block[4] = self;
    long long v11 = &v12;
    id v10 = v5;
    dispatch_sync(accessQueue, block);
    id v6 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

void __60__PBFPosterModelStoreCoordinator_reapSnapshotsMatchingURLs___block_invoke(void *a1)
{
  uint64_t v2 = objc_opt_new();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __60__PBFPosterModelStoreCoordinator_reapSnapshotsMatchingURLs___block_invoke_2;
  void v6[3] = &unk_1E69822B8;
  id v4 = (void *)a1[4];
  id v3 = (void *)a1[5];
  uint64_t v9 = a1[6];
  id v7 = v3;
  id v8 = v2;
  id v5 = v2;
  objc_msgSend(v4, "_accessQueue_enumerateSnapshotCoordinators:", v6);
}

void __60__PBFPosterModelStoreCoordinator_reapSnapshotsMatchingURLs___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v4 = [v7 removeSnapshotsAtURLs:*(void *)(a1 + 32)];
  [v3 minusSet:v4];

  id v5 = [v7 snapshotURLs];
  uint64_t v6 = [v5 count];

  if (!v6) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

- (NSSet)snapshotURLs
{
  if (self->_readonly)
  {
    id v2 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    id v7 = &v6;
    uint64_t v8 = 0x3032000000;
    uint64_t v9 = __Block_byref_object_copy__1;
    id v10 = __Block_byref_object_dispose__1;
    id v11 = 0;
    accessQueue = self->_accessQueue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46__PBFPosterModelStoreCoordinator_snapshotURLs__block_invoke;
    v5[3] = &unk_1E6980E40;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(accessQueue, v5);
    id v2 = (id)v7[5];
    _Block_object_dispose(&v6, 8);
  }
  return (NSSet *)v2;
}

void __46__PBFPosterModelStoreCoordinator_snapshotURLs__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_accessQueue_snapshotURLs");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_accessQueue_snapshotURLs
{
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  fileManager = self->_fileManager;
  identifierURL = self->_identifierURL;
  uint64_t v6 = *MEMORY[0x1E4F1C5C0];
  v27[0] = *MEMORY[0x1E4F1C5C0];
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __59__PBFPosterModelStoreCoordinator__accessQueue_snapshotURLs__block_invoke;
  v25[3] = &unk_1E6982308;
  v25[4] = self;
  uint64_t v8 = [(NSFileManager *)fileManager enumeratorAtURL:identifierURL includingPropertiesForKeys:v7 options:20 errorHandler:v25];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    uint64_t v13 = *MEMORY[0x1E4F1C5D0];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v20 = 0;
        [v15 getResourceValue:&v20 forKey:v6 error:0];
        id v16 = v20;
        if ([v16 isEqualToString:v13]
          && objc_msgSend(v15, "pbf_isPosterSnapshot"))
        {
          id v17 = [v15 URLByStandardizingPath];
          [v3 addObject:v17];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v11);
  }

  uint64_t v18 = (void *)[v3 copy];
  return v18;
}

uint64_t __59__PBFPosterModelStoreCoordinator__accessQueue_snapshotURLs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = PBFLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __59__PBFPosterModelStoreCoordinator__accessQueue_snapshotURLs__block_invoke_cold_1(a1, (uint64_t)v4, v5);
  }

  return 1;
}

- (id)addNewVersionWithContents:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_readonly)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v23 = 0;
    long long v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy__1;
    id v27 = __Block_byref_object_dispose__1;
    id v28 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy__1;
    long long v21 = __Block_byref_object_dispose__1;
    id v22 = 0;
    accessQueue = self->_accessQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__PBFPosterModelStoreCoordinator_addNewVersionWithContents_error___block_invoke;
    v13[3] = &unk_1E6982330;
    id v15 = &v23;
    v13[4] = self;
    id v14 = v6;
    id v16 = &v17;
    dispatch_sync(accessQueue, v13);
    uint64_t v10 = (void *)v18[5];
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      uint64_t v11 = PBFLogPosterContents();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterModelStoreCoordinator addNewVersionWithContents:error:]();
      }
    }
    id v8 = (id)v24[5];

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }
  return v8;
}

void __66__PBFPosterModelStoreCoordinator_addNewVersionWithContents_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v4 = (id *)(*(void *)(a1[7] + 8) + 40);
  id obj = 0;
  uint64_t v5 = objc_msgSend(v2, "_accessQueue_setupNewVersionWithOptions:contents:error:", 0, v3, &obj);
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)addNewSupplementWithError:(id *)a3
{
  if (self->_readonly)
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__1;
    id v20 = __Block_byref_object_dispose__1;
    id v21 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy__1;
    id v14 = __Block_byref_object_dispose__1;
    id v15 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PBFPosterModelStoreCoordinator_addNewSupplementWithError___block_invoke;
    block[3] = &unk_1E6982358;
    block[4] = self;
    void block[5] = &v16;
    block[6] = &v10;
    dispatch_sync(accessQueue, block);
    uint64_t v6 = (void *)v11[5];
    if (v6)
    {
      if (a3) {
        *a3 = v6;
      }
      id v7 = PBFLogPosterContents();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterModelStoreCoordinator addNewSupplementWithError:]();
      }
    }
    id v3 = (id)v17[5];
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(&v16, 8);
  }
  return v3;
}

void __60__PBFPosterModelStoreCoordinator_addNewSupplementWithError___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = (id *)(*(void *)(a1[6] + 8) + 40);
  id obj = 0;
  uint64_t v4 = objc_msgSend(v2, "_accessQueue_setupNewSupplementWithOptions:error:", 0, &obj);
  objc_storeStrong(v3, obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)stageNewVersionWithContents:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_readonly)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v23 = 0;
    long long v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy__1;
    id v27 = __Block_byref_object_dispose__1;
    id v28 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy__1;
    id v21 = __Block_byref_object_dispose__1;
    id v22 = 0;
    accessQueue = self->_accessQueue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68__PBFPosterModelStoreCoordinator_stageNewVersionWithContents_error___block_invoke;
    v13[3] = &unk_1E6982330;
    id v15 = &v23;
    v13[4] = self;
    id v14 = v6;
    uint64_t v16 = &v17;
    dispatch_sync(accessQueue, v13);
    uint64_t v10 = (void *)v18[5];
    if (v10)
    {
      if (a4) {
        *a4 = v10;
      }
      uint64_t v11 = PBFLogPosterContents();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterModelStoreCoordinator stageNewVersionWithContents:error:]();
      }
    }
    id v8 = (id)v24[5];

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }
  return v8;
}

void __68__PBFPosterModelStoreCoordinator_stageNewVersionWithContents_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = (id *)(*(void *)(a1[7] + 8) + 40);
  id obj = 0;
  uint64_t v5 = objc_msgSend(v2, "_accessQueue_setupNewVersionWithOptions:contents:error:", 1, v3, &obj);
  objc_storeStrong(v4, obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)stageNewSupplementWithError:(id *)a3
{
  if (self->_readonly)
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__1;
    id v20 = __Block_byref_object_dispose__1;
    id v21 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy__1;
    id v14 = __Block_byref_object_dispose__1;
    id v15 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__PBFPosterModelStoreCoordinator_stageNewSupplementWithError___block_invoke;
    block[3] = &unk_1E6982358;
    block[4] = self;
    void block[5] = &v16;
    block[6] = &v10;
    dispatch_sync(accessQueue, block);
    uint64_t v6 = (void *)v11[5];
    if (v6)
    {
      if (a3) {
        *a3 = v6;
      }
      id v7 = PBFLogPosterContents();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterModelStoreCoordinator stageNewSupplementWithError:]();
      }
    }
    id v3 = (id)v17[5];
    _Block_object_dispose(&v10, 8);

    _Block_object_dispose(&v16, 8);
  }
  return v3;
}

void __62__PBFPosterModelStoreCoordinator_stageNewSupplementWithError___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  id v3 = (id *)(*(void *)(a1[6] + 8) + 40);
  id obj = 0;
  uint64_t v4 = objc_msgSend(v2, "_accessQueue_setupNewSupplementWithOptions:error:", 1, &obj);
  objc_storeStrong(v3, obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)abortStaged
{
  if (!self->_readonly)
  {
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PBFPosterModelStoreCoordinator_abortStaged__block_invoke;
    block[3] = &unk_1E69808C0;
    block[4] = self;
    dispatch_sync(accessQueue, block);
  }
}

uint64_t __45__PBFPosterModelStoreCoordinator_abortStaged__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 112);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PBFPosterModelStoreCoordinator_abortStaged__block_invoke_2;
  v5[3] = &unk_1E6982380;
  v5[4] = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];
  return [*(id *)(*(void *)(a1 + 32) + 112) removeAllObjects];
}

void __45__PBFPosterModelStoreCoordinator_abortStaged__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = objc_msgSend(a3, "keyEnumerator", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(a1 + 32), "_accessQueue_removeSupplement:forVersion:error:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "unsignedLongLongValue"), objc_msgSend(v5, "unsignedLongLongValue"), 0);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)commitStagedWithError:(id *)a3
{
  if (self->_readonly) {
    return 0;
  }
  uint64_t v6 = self->_fileManager;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__1;
  uint64_t v19 = __Block_byref_object_dispose__1;
  id v20 = 0;
  accessQueue = self->_accessQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__PBFPosterModelStoreCoordinator_commitStagedWithError___block_invoke;
  v11[3] = &unk_1E69823D0;
  v11[4] = self;
  uint64_t v8 = v6;
  long long v12 = v8;
  long long v13 = &v15;
  long long v14 = &v21;
  dispatch_sync(accessQueue, v11);
  if (a3)
  {
    uint64_t v9 = (void *)v16[5];
    if (v9) {
      *a3 = v9;
    }
  }
  BOOL v3 = *((unsigned char *)v22 + 24) != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v3;
}

void __56__PBFPosterModelStoreCoordinator_commitStagedWithError___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  BOOL v3 = objc_opt_new();
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 112);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __56__PBFPosterModelStoreCoordinator_commitStagedWithError___block_invoke_2;
  v25[3] = &unk_1E69823A8;
  v25[4] = v4;
  id v6 = v2;
  id v26 = v6;
  id v7 = v3;
  id v27 = v7;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  id v28 = v8;
  uint64_t v29 = v9;
  [v5 enumerateKeysAndObjectsUsingBlock:v25];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v10 = v7;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    long long v12 = *(void **)(v11 + 112);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __56__PBFPosterModelStoreCoordinator_commitStagedWithError___block_invoke_3;
    v24[3] = &unk_1E6982380;
    v24[4] = v11;
    [v12 enumerateKeysAndObjectsUsingBlock:v24];
    id v10 = v6;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * v17);
        uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", (void)v20);
        [v19 removeItemAtURL:v18 error:0];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v15);
  }

  [*(id *)(*(void *)(a1 + 32) + 112) removeAllObjects];
}

void __56__PBFPosterModelStoreCoordinator_commitStagedWithError___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v29 = a3;
  id obj = [v29 keyEnumerator];
  uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(obj);
        }
        id v6 = [v29 objectForKey:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        id v7 = __providerURLForOptions(1, *(void **)(*(void *)(a1 + 32) + 48), v6);
        uint64_t v8 = __providerURLForOptions(0, *(void **)(*(void *)(a1 + 32) + 48), v6);
        uint64_t v9 = [MEMORY[0x1E4F924D0] pathWithProviderURL:v7 identity:v6];
        uint64_t v31 = (void *)v8;
        id v10 = [MEMORY[0x1E4F924D0] pathWithProviderURL:v8 identity:v6];
        uint64_t v11 = [v9 supplementURL];
        long long v32 = [v10 supplementURL];
        long long v12 = [v9 instanceURL];
        uint64_t v13 = [v10 instanceURL];
        [*(id *)(a1 + 40) addObject:v11];
        [*(id *)(a1 + 48) addObject:v11];
        [*(id *)(a1 + 40) addObject:v7];
        [*(id *)(a1 + 48) addObject:v7];
        [*(id *)(a1 + 40) addObject:v12];
        [*(id *)(a1 + 48) addObject:v12];
        unint64_t v30 = (void *)v13;
        LOBYTE(v13) = [(id)v13 checkResourceIsReachableAndReturnError:0];
        int v14 = [v12 checkResourceIsReachableAndReturnError:0];
        if ((v13 & 1) == 0)
        {
          if (v14)
          {
            [*(id *)(a1 + 48) addObject:v31];
            uint64_t v15 = *(void **)(a1 + 56);
            uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
            id v34 = *(id *)(v16 + 40);
            int v17 = [v15 moveItemAtURL:v12 toURL:v30 error:&v34];
            objc_storeStrong((id *)(v16 + 40), v34);
            if (!v17) {
              goto LABEL_21;
            }
          }
        }
        char v18 = [v32 checkResourceIsReachableAndReturnError:0];
        int v19 = [v11 checkResourceIsReachableAndReturnError:0];
        if ((v18 & 1) == 0)
        {
          if (v19)
          {
            [*(id *)(a1 + 48) addObject:v32];
            long long v20 = *(void **)(a1 + 56);
            uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
            id v33 = *(id *)(v21 + 40);
            int v22 = [v20 moveItemAtURL:v11 toURL:v32 error:&v33];
            objc_storeStrong((id *)(v21 + 40), v33);
            if (!v22)
            {
LABEL_21:
              *a4 = 1;

              goto LABEL_22;
            }
          }
        }
        long long v23 = [MEMORY[0x1E4F926B0] loadFocusConfigurationForPath:v9 error:0];
        if (v23) {
          [MEMORY[0x1E4F926B0] storeFocusConfigurationForPath:v10 focusConfiguration:v23 error:0];
        }
        else {
          [MEMORY[0x1E4F926B0] removeFocusConfigurationForPath:v10 error:0];
        }
        char v24 = [MEMORY[0x1E4F926B0] loadSuggestionMetadataForPath:v9 error:0];
        if (v24) {
          [MEMORY[0x1E4F926B0] storeSuggestionMetadataForPath:v10 suggestionMetadata:v24 error:0];
        }
        else {
          [MEMORY[0x1E4F926B0] removeSuggestionMetadataForPath:v10 error:0];
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v28) {
        continue;
      }
      break;
    }
  }
LABEL_22:
}

void __56__PBFPosterModelStoreCoordinator_commitStagedWithError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = *(void **)(*(void *)(a1 + 32) + 104);
  id v6 = a3;
  id v7 = [v5 objectForKey:v10];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 addEntriesFromDictionary:v6];
  }
  else
  {
    uint64_t v9 = [v6 mutableCopy];

    [*(id *)(*(void *)(a1 + 32) + 104) setObject:v9 forKeyedSubscript:v10];
    id v6 = (id)v9;
  }
}

- (void)removeSupplement:(unint64_t)a3 forVersion:(unint64_t)a4 error:(id *)a5
{
  if (!self->_readonly)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy__1;
    int v14 = __Block_byref_object_dispose__1;
    id v15 = 0;
    accessQueue = self->_accessQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__PBFPosterModelStoreCoordinator_removeSupplement_forVersion_error___block_invoke;
    v9[3] = &unk_1E69823F8;
    v9[6] = a3;
    v9[7] = a4;
    v9[4] = self;
    v9[5] = &v10;
    dispatch_sync(accessQueue, v9);
    id v7 = (void *)v11[5];
    if (v7)
    {
      if (a5) {
        *a5 = v7;
      }
      uint64_t v8 = PBFLogPosterContents();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterModelStoreCoordinator removeSupplement:forVersion:error:]();
      }
    }
    _Block_object_dispose(&v10, 8);
  }
}

void __68__PBFPosterModelStoreCoordinator_removeSupplement_forVersion_error___block_invoke(void *a1)
{
  uint64_t v1 = a1[6];
  uint64_t v2 = a1[7];
  BOOL v3 = (void *)a1[4];
  uint64_t v4 = (id *)(*(void *)(a1[5] + 8) + 40);
  id obj = 0;
  objc_msgSend(v3, "_accessQueue_removeSupplement:forVersion:error:", v1, v2, &obj);
  objc_storeStrong(v4, obj);
}

- (id)pbf_posterSnapshotCoordinatorForIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PBFPosterModelStoreCoordinator_pbf_posterSnapshotCoordinatorForIdentity___block_invoke;
  block[3] = &unk_1E6982240;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __75__PBFPosterModelStoreCoordinator_pbf_posterSnapshotCoordinatorForIdentity___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_accessQueue_posterSnapshotCoordinatorForIdentity:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)pbf_enumerateSnapshotCoordinators:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __68__PBFPosterModelStoreCoordinator_pbf_enumerateSnapshotCoordinators___block_invoke;
  v7[3] = &unk_1E6982420;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

uint64_t __68__PBFPosterModelStoreCoordinator_pbf_enumerateSnapshotCoordinators___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessQueue_enumerateSnapshotCoordinators:", *(void *)(a1 + 40));
}

- (void)_accessQueue_enumerateSnapshotCoordinators:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  unsigned __int8 v16 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(PBFPosterModelStoreCoordinator *)self _accessQueue_allPosterPaths];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) identity];
      uint64_t v11 = [(PBFPosterModelStoreCoordinator *)self _accessQueue_posterSnapshotCoordinatorForIdentity:v10];
      v4[2](v4, v11, v10, &v16);

      LODWORD(v11) = v16;
      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)_accessQueue_posterSnapshotCoordinatorForIdentity:(id)a3
{
  id v4 = a3;
  accessQueue_identityToPosterSnapshotCoordinator = self->_accessQueue_identityToPosterSnapshotCoordinator;
  if (!accessQueue_identityToPosterSnapshotCoordinator)
  {
    uint64_t v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    uint64_t v7 = self->_accessQueue_identityToPosterSnapshotCoordinator;
    self->_accessQueue_identityToPosterSnapshotCoordinator = v6;

    accessQueue_identityToPosterSnapshotCoordinator = self->_accessQueue_identityToPosterSnapshotCoordinator;
  }
  uint64_t v8 = [(NSMapTable *)accessQueue_identityToPosterSnapshotCoordinator objectForKey:v4];
  if (v8)
  {
    uint64_t v9 = v8;
  }
  else
  {
    id v10 = [(PBFPosterModelStoreCoordinator *)self _accessQueue_posterPathForIdentity:v4];
    if (v10)
    {
      uint64_t v11 = [[PBFPosterSnapshotCoordinator alloc] initWithPath:v10];
      [(NSMapTable *)self->_accessQueue_identityToPosterSnapshotCoordinator setObject:v11 forKey:v4];
      uint64_t v9 = v11;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  return v9;
}

- (id)_accessQueue_checkEnvironmentConsistency
{
  uint64_t v184 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PBFLogPosterContents();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  id v5 = PBFLogPosterContents();
  uint64_t v6 = v5;
  unint64_t v128 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    extensionIdentifier = self->_extensionIdentifier;
    uint64_t v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    uint64_t v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v169 = (const char *)extensionIdentifier;
    __int16 v170 = 2114;
    v171 = v9;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "checkEnvironmentConsistency", "extension: %{public}@; class: %{public}@",
      buf,
      0x16u);
  }
  os_signpost_id_t spid = v4;

  id v10 = self->_providerInfoURL;
  uint64_t v11 = self->_containerVersionsURL;
  long long v12 = self;
  long long v13 = self->_identifierURL;
  long long v14 = self->_providerURL;
  long long v15 = self->_posterUUID;
  unsigned __int8 v16 = v12->_extensionIdentifier;
  v147 = v12;
  v145 = v12->_fileManager;
  id v17 = v14;
  NSClassFromString(&cfstr_Nsurl.isa);
  if (!v17)
  {
    v112 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency]();
    }
    [v112 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321A61CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v113 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSURLClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency]();
    }
    [v113 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321A680);
  }
  v127 = v17;

  uint64_t v18 = v10;
  NSClassFromString(&cfstr_Nsurl.isa);
  if (!v18)
  {
    v114 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency]();
    }
    [v114 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321A6E4);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v115 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSURLClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency]();
    }
    [v115 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321A748);
  }
  v129 = v18;

  int v19 = v11;
  NSClassFromString(&cfstr_Nsurl.isa);
  if (!v19)
  {
    v116 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency]();
    }
    [v116 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321A7ACLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v117 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSURLClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency]();
    }
    [v117 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321A810);
  }
  v130 = v19;

  long long v20 = v13;
  NSClassFromString(&cfstr_Nsurl.isa);
  if (!v20)
  {
    v118 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.4();
    }
    [v118 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321A874);
  }
  uint64_t v21 = v147;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v119 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSURLClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.4();
    }
    [v119 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321A8D8);
  }
  v131 = v20;

  int v22 = v15;
  NSClassFromString(&cfstr_Nsuuid.isa);
  if (!v22)
  {
    v120 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.5();
    }
    [v120 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321A93CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v121 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSUUIDClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.5();
    }
    [v121 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321A9A0);
  }
  v142 = v22;

  long long v23 = v16;
  NSClassFromString(&cfstr_Nsstring.isa);
  if (!v23)
  {
    v122 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.6();
    }
    [v122 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321AA04);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v123 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.6();
    }
    [v123 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D321AA68);
  }
  v141 = v23;

  id v167 = 0;
  BOOL v24 = [(NSURL *)v131 checkResourceIsReachableAndReturnError:&v167];
  uint64_t v25 = (NSUUID *)v167;
  id v26 = v25;
  if (!v24)
  {
    long long v37 = PBFLogPosterContents();
    long long v38 = v37;
    if (v128 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      uint64_t v39 = (const char *)v147->_extensionIdentifier;
      uint64_t v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      id v41 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v169 = v39;
      __int16 v170 = 2114;
      v171 = v41;
      __int16 v172 = 2114;
      v173 = v26;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v38, OS_SIGNPOST_INTERVAL_END, spid, "checkEnvironmentConsistency", "extension: %{public}@; class: %{public}@; failed? %{public}@",
        buf,
        0x20u);
    }
    id v42 = v26;
    goto LABEL_35;
  }
  v166 = v25;
  BOOL v27 = [(NSURL *)v130 checkResourceIsReachableAndReturnError:&v166];
  uint64_t v28 = v166;

  if (!v27)
  {
    long long v43 = PBFLogPosterContents();
    uint64_t v44 = v43;
    if (v128 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      long long v45 = (const char *)v147->_extensionIdentifier;
      long long v46 = (objc_class *)objc_opt_class();
      NSStringFromClass(v46);
      char v47 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v169 = v45;
      __int16 v170 = 2114;
      v171 = v47;
      __int16 v172 = 2114;
      v173 = v28;
      _os_signpost_emit_with_name_impl(&dword_1D31CE000, v44, OS_SIGNPOST_INTERVAL_END, spid, "checkEnvironmentConsistency", "extension: %{public}@; class: %{public}@; failed? %{public}@",
        buf,
        0x20u);
    }
    id v42 = v28;
LABEL_35:
    id v48 = v42;
    v49 = v42;
    goto LABEL_103;
  }
  if ([(NSURL *)v129 checkResourceIsReachableAndReturnError:0])
  {
    id v165 = 0;
    id v29 = [(PBFPosterModelStoreCoordinator *)v147 _accessQueue_providerInfoWithError:&v165];
    unint64_t v30 = (NSUUID *)v165;
    if (v30)
    {
      uint64_t v31 = PBFLogPosterContents();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency].cold.7();
      }

      long long v32 = PBFLogPosterContents();
      id v33 = v32;
      if (v128 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        id v34 = (const char *)v147->_extensionIdentifier;
        long long v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        long long v36 = (NSString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v169 = v34;
        __int16 v170 = 2114;
        v171 = v36;
        __int16 v172 = 2114;
        v173 = v30;
        _os_signpost_emit_with_name_impl(&dword_1D31CE000, v33, OS_SIGNPOST_INTERVAL_END, spid, "checkEnvironmentConsistency", "extension: %{public}@; class: %{public}@; failed? %{public}@",
          buf,
          0x20u);
      }
    }
  }
  else
  {
    [(PBFPosterModelStoreCoordinator *)v147 _accessQueue_writeProviderInfo:MEMORY[0x1E4F1CC08] error:0];
  }
  v164 = v28;
  v125 = [(NSFileManager *)v145 contentsOfDirectoryAtURL:v130 includingPropertiesForKeys:0 options:1 error:&v164];
  v50 = v164;

  v124 = v50;
  if (!v50)
  {
    if (_accessQueue_checkEnvironmentConsistency___once != -1) {
      dispatch_once(&_accessQueue_checkEnvironmentConsistency___once, &__block_literal_global_4);
    }
    v132 = [MEMORY[0x1E4F28E60] indexSet];
    long long v160 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    id obj = v125;
    uint64_t v56 = [obj countByEnumeratingWithState:&v160 objects:v183 count:16];
    if (!v56)
    {
LABEL_98:

      uint64_t v105 = __knownVersions(v21->_accessQueue_posterIdentityBySupplementByVersion);
      [v105 removeIndexes:v132];
      v148[0] = MEMORY[0x1E4F143A8];
      v148[1] = 3221225472;
      v148[2] = __74__PBFPosterModelStoreCoordinator__accessQueue_checkEnvironmentConsistency__block_invoke_96;
      v148[3] = &unk_1E6982468;
      v148[4] = v21;
      [v105 enumerateIndexesUsingBlock:v148];
      [(NSMutableDictionary *)v21->_accessQueue_stagedPosterIdentityBySupplementByVersion removeAllObjects];
      v106 = PBFLogPosterContents();
      v107 = v106;
      if (v128 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v106))
      {
        v108 = (const char *)v21->_extensionIdentifier;
        v109 = (objc_class *)objc_opt_class();
        NSStringFromClass(v109);
        v110 = (NSString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v169 = v108;
        __int16 v170 = 2114;
        v171 = v110;
        __int16 v172 = 2114;
        v173 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D31CE000, v107, OS_SIGNPOST_INTERVAL_END, spid, "checkEnvironmentConsistency", "extension: %{public}@; class: %{public}@; failed? %{public}@",
          buf,
          0x20u);
      }
      v49 = 0;
      id v48 = 0;
      goto LABEL_102;
    }
    uint64_t v57 = v56;
    uint64_t v140 = *(void *)v161;
    while (1)
    {
      uint64_t v58 = 0;
      uint64_t v133 = v57;
      do
      {
        if (*(void *)v161 != v140) {
          objc_enumerationMutation(obj);
        }
        v59 = *(void **)(*((void *)&v160 + 1) + 8 * v58);
        v60 = [v59 lastPathComponent];
        v61 = [(id)_accessQueue_checkEnvironmentConsistency_numberFormatter numberFromString:v60];
        uint64_t v62 = [v61 unsignedLongLongValue];

        v63 = (void *)_accessQueue_checkEnvironmentConsistency_numberFormatter;
        v64 = [NSNumber numberWithUnsignedLongLong:v62];
        v65 = [v63 stringFromNumber:v64];
        int v66 = [v60 isEqualToString:v65];

        if (!v66) {
          goto LABEL_156;
        }
        v67 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_posterPathSupplementContainerURLForInstanceURL:", v59);
        if (([v67 checkResourceIsReachableAndReturnError:0] & 1) == 0)
        {
          v68 = PBFLogPosterContents();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v169 = "-[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency]";
            __int16 v170 = 2112;
            v171 = v141;
            __int16 v172 = 2112;
            v173 = v142;
            __int16 v174 = 2048;
            uint64_t v175 = v62;
            _os_log_impl(&dword_1D31CE000, v68, OS_LOG_TYPE_DEFAULT, "%s> creating migration supplement for provider=%@ uuid=%@ version=%llu", buf, 0x2Au);
          }

          v69 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_posterPathSupplementURLForInstanceURL:supplement:", v59, 0);
          v70 = PFFileProtectionNoneAttributes();
          id v159 = 0;
          [(NSFileManager *)v145 createDirectoryAtURL:v69 withIntermediateDirectories:1 attributes:v70 error:&v159];
          v71 = (NSString *)v159;

          if (v71)
          {
            v72 = PBFLogPosterContents();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v169 = "-[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency]";
              __int16 v170 = 2112;
              v171 = v71;
              _os_log_error_impl(&dword_1D31CE000, v72, OS_LOG_TYPE_ERROR, "%s> error creating migration supplement: %@", buf, 0x16u);
            }
          }
        }
        v138 = v60;
        id v158 = 0;
        id v73 = [(NSFileManager *)v145 contentsOfDirectoryAtURL:v67 includingPropertiesForKeys:0 options:1 error:&v158];
        v74 = (NSString *)v158;
        if (v74)
        {
          id v75 = PBFLogPosterContents();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v169 = "-[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency]";
            __int16 v170 = 2112;
            v171 = v74;
            _os_log_error_impl(&dword_1D31CE000, v75, OS_LOG_TYPE_ERROR, "%s> error fetching supplements from filesystem: %@", buf, 0x16u);
          }
        }
        v135 = v74;
        v136 = v67;
        uint64_t v146 = v62;
        v137 = v59;
        uint64_t v139 = v58;
        v144 = [MEMORY[0x1E4F28E60] indexSet];
        long long v154 = 0u;
        long long v155 = 0u;
        long long v156 = 0u;
        long long v157 = 0u;
        id v76 = v73;
        uint64_t v77 = [v76 countByEnumeratingWithState:&v154 objects:v182 count:16];
        if (v77)
        {
          uint64_t v78 = v77;
          uint64_t v79 = *(void *)v155;
          do
          {
            for (uint64_t i = 0; i != v78; ++i)
            {
              if (*(void *)v155 != v79) {
                objc_enumerationMutation(v76);
              }
              v81 = *(void **)(*((void *)&v154 + 1) + 8 * i);
              v82 = [v81 lastPathComponent];
              v83 = [(id)_accessQueue_checkEnvironmentConsistency_numberFormatter numberFromString:v82];
              uint64_t v84 = [v83 unsignedLongLongValue];

              v85 = (void *)_accessQueue_checkEnvironmentConsistency_numberFormatter;
              id v86 = [NSNumber numberWithUnsignedLongLong:v84];
              id v87 = [v85 stringFromNumber:v86];
              int v88 = [v82 isEqualToString:v87];

              if (v88)
              {
                id v153 = 0;
                uint64_t v21 = v147;
                id v89 = [(PBFPosterModelStoreCoordinator *)v147 _accessQueue_fetchIdentityForVersion:v146 supplement:v84 error:&v153];
                id v90 = v153;
                if (v89) {
                  BOOL v91 = v90 == 0;
                }
                else {
                  BOOL v91 = 0;
                }
                if (v91)
                {
                  [v144 addIndex:v84];
                  goto LABEL_83;
                }
                long long v92 = v90;
                long long v93 = PBFLogPosterContents();
                if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                {
                  [(id)objc_opt_class() type];
                  v143 = NSStringFromPFServerPosterType();
                  *(_DWORD *)buf = 136316674;
                  v169 = "-[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency]";
                  __int16 v170 = 2112;
                  v171 = v141;
                  __int16 v172 = 2112;
                  v173 = v142;
                  __int16 v174 = 2112;
                  uint64_t v175 = (uint64_t)v143;
                  __int16 v176 = 2048;
                  uint64_t v177 = v146;
                  __int16 v178 = 2048;
                  uint64_t v179 = v84;
                  __int16 v180 = 2112;
                  v181 = v92;
                  _os_log_error_impl(&dword_1D31CE000, v93, OS_LOG_TYPE_ERROR, "%s> error loading supplement from filesystem: provider=%@ uuid=%@ type=%@ version=%llu supplement=%llu : error=%@", buf, 0x48u);
                }
              }
              uint64_t v21 = v147;
              if (v147->_readonly) {
                goto LABEL_84;
              }
              v94 = PBFLogReaper();
              if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v169 = (const char *)v81;
                _os_log_impl(&dword_1D31CE000, v94, OS_LOG_TYPE_DEFAULT, "REAPING %{public}@", buf, 0xCu);
              }

              id v152 = 0;
              [(NSFileManager *)v145 removeItemAtURL:v81 error:&v152];
              id v89 = v152;
              if (v89)
              {
                id v95 = PBFLogPosterContents();
                if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v169 = "-[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency]";
                  __int16 v170 = 2112;
                  v171 = (NSString *)v89;
                  _os_log_error_impl(&dword_1D31CE000, v95, OS_LOG_TYPE_ERROR, "%s> error removing invalid supplement: %@", buf, 0x16u);
                }
              }
LABEL_83:

LABEL_84:
            }
            uint64_t v78 = [v76 countByEnumeratingWithState:&v154 objects:v182 count:16];
          }
          while (v78);
        }

        uint64_t v96 = [v144 count];
        accessQueue_posterIdentityBySupplementByVersion = v21->_accessQueue_posterIdentityBySupplementByVersion;
        v98 = [NSNumber numberWithUnsignedLongLong:v146];
        v99 = [(NSMutableDictionary *)accessQueue_posterIdentityBySupplementByVersion objectForKey:v98];

        v100 = __knownVersions(v99);
        [v100 removeIndexes:v144];
        v150[0] = MEMORY[0x1E4F143A8];
        v150[1] = 3221225472;
        v150[2] = __74__PBFPosterModelStoreCoordinator__accessQueue_checkEnvironmentConsistency__block_invoke_95;
        v150[3] = &unk_1E6982468;
        id v151 = v99;
        id v101 = v99;
        [v100 enumerateIndexesUsingBlock:v150];

        uint64_t v57 = v133;
        v60 = v138;
        uint64_t v58 = v139;
        v59 = v137;
        if (v96)
        {
          [v132 addIndex:v146];
        }
        else
        {
LABEL_156:
          if (!v21->_readonly)
          {
            v102 = PBFLogReaper();
            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v169 = (const char *)v59;
              _os_log_impl(&dword_1D31CE000, v102, OS_LOG_TYPE_DEFAULT, "REAPING instance %{public}@", buf, 0xCu);
            }

            id v149 = 0;
            [(NSFileManager *)v145 removeItemAtURL:v59 error:&v149];
            __int16 v103 = (NSString *)v149;
            if (v103)
            {
              v104 = PBFLogPosterContents();
              if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                v169 = "-[PBFPosterModelStoreCoordinator _accessQueue_checkEnvironmentConsistency]";
                __int16 v170 = 2112;
                v171 = v103;
                _os_log_error_impl(&dword_1D31CE000, v104, OS_LOG_TYPE_ERROR, "%s> error removing invalid version: %@", buf, 0x16u);
              }
            }
          }
        }

        ++v58;
      }
      while (v58 != v57);
      uint64_t v57 = [obj countByEnumeratingWithState:&v160 objects:v183 count:16];
      if (!v57) {
        goto LABEL_98;
      }
    }
  }
  uint64_t v51 = PBFLogPosterContents();
  v52 = v51;
  if (v128 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
  {
    char v53 = (const char *)v147->_extensionIdentifier;
    v54 = (objc_class *)objc_opt_class();
    NSStringFromClass(v54);
    char v55 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v169 = v53;
    __int16 v170 = 2114;
    v171 = v55;
    __int16 v172 = 2114;
    v173 = v124;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v52, OS_SIGNPOST_INTERVAL_END, spid, "checkEnvironmentConsistency", "extension: %{public}@; class: %{public}@; failed? %{public}@",
      buf,
      0x20u);
  }
  id v48 = v124;
  v49 = v124;
LABEL_102:

LABEL_103:
  return v49;
}

void __74__PBFPosterModelStoreCoordinator__accessQueue_checkEnvironmentConsistency__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  uint64_t v1 = (void *)_accessQueue_checkEnvironmentConsistency_numberFormatter;
  _accessQueue_checkEnvironmentConsistency_numberFormatter = (uint64_t)v0;

  uint64_t v2 = (void *)_accessQueue_checkEnvironmentConsistency_numberFormatter;
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];
}

void __74__PBFPosterModelStoreCoordinator__accessQueue_checkEnvironmentConsistency__block_invoke_95(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  [v2 removeObjectForKey:v3];
}

void __74__PBFPosterModelStoreCoordinator__accessQueue_checkEnvironmentConsistency__block_invoke_96(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 104);
  id v3 = [NSNumber numberWithUnsignedInteger:a2];
  [v2 removeObjectForKey:v3];
}

- (id)_accessQueue_providerInfoWithError:(id *)a3
{
  v13[7] = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:self->_providerInfoURL options:1 error:a3];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    v13[4] = objc_opt_class();
    void v13[5] = objc_opt_class();
    v13[6] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:7];
    uint64_t v8 = [v6 setWithArray:v7];
    id v12 = 0;
    uint64_t v9 = [v5 unarchivedObjectOfClasses:v8 fromData:v4 error:&v12];
    id v10 = v12;

    if (a3 && v10)
    {
      id v10 = v10;
      *a3 = v10;
    }
  }
  else
  {
    id v10 = 0;
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_accessQueue_writeProviderInfo:(id)a3 error:(id *)a4
{
  if (!self->_readonly)
  {
    uint64_t v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:a4];
    if (v6)
    {
      id v7 = v6;
      [v6 writeToURL:self->_providerInfoURL options:268435457 error:a4];
      uint64_t v6 = v7;
    }
  }
}

- (void)_accessQueue_invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(NSMapTable *)self->_accessQueue_identityToPosterSnapshotCoordinator objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) removeAllSnapshots];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMapTable *)self->_accessQueue_identityToPosterSnapshotCoordinator removeAllObjects];
  accessQueue_identityToPosterSnapshotCoordinator = self->_accessQueue_identityToPosterSnapshotCoordinator;
  self->_accessQueue_identityToPosterSnapshotCoordinator = 0;
}

- (id)_accessQueue_allPosterPaths
{
  id v3 = objc_opt_new();
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  long long v10 = __61__PBFPosterModelStoreCoordinator__accessQueue_allPosterPaths__block_invoke;
  long long v11 = &unk_1E69824B8;
  id v4 = v3;
  id v12 = v4;
  long long v13 = self;
  uint64_t v5 = _Block_copy(&v8);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_accessQueue_posterIdentityBySupplementByVersion, "enumerateKeysAndObjectsUsingBlock:", v5, v8, v9, v10, v11);
  [(NSMutableDictionary *)self->_accessQueue_stagedPosterIdentityBySupplementByVersion enumerateKeysAndObjectsUsingBlock:v5];
  id v6 = v4;

  return v6;
}

void __61__PBFPosterModelStoreCoordinator__accessQueue_allPosterPaths__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __61__PBFPosterModelStoreCoordinator__accessQueue_allPosterPaths__block_invoke_2;
  v7[3] = &unk_1E6982490;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __61__PBFPosterModelStoreCoordinator__accessQueue_allPosterPaths__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_accessQueue_posterPathForIdentity:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bs_safeAddObject:", v2);
}

- (id)_accessQueue_identityOfLatestVersion
{
  id v3 = __knownVersions(self->_accessQueue_posterIdentityBySupplementByVersion);
  id v4 = v3;
  if (v3)
  {
    accessQueue_posterIdentityBySupplementByVersion = self->_accessQueue_posterIdentityBySupplementByVersion;
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "lastIndex"));
    uint64_t v7 = [(NSMutableDictionary *)accessQueue_posterIdentityBySupplementByVersion objectForKey:v6];

    id v8 = __knownVersions(v7);
    uint64_t v9 = v8;
    if (v8)
    {
      long long v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "lastIndex"));
      long long v11 = [v7 objectForKey:v10];
    }
    else
    {
      long long v11 = 0;
    }
  }
  else
  {
    long long v11 = 0;
  }
  id v12 = __knownVersions(self->_accessQueue_stagedPosterIdentityBySupplementByVersion);

  if (v12)
  {
    accessQueue_stagedPosterIdentityBySupplementByVersion = self->_accessQueue_stagedPosterIdentityBySupplementByVersion;
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "lastIndex"));
    long long v15 = [(NSMutableDictionary *)accessQueue_stagedPosterIdentityBySupplementByVersion objectForKey:v14];

    unsigned __int8 v16 = __knownVersions(v15);
    id v17 = v16;
    if (v16)
    {
      uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "lastIndex"));
      uint64_t v19 = [v15 objectForKey:v18];

      long long v11 = (void *)v19;
    }
  }
  return v11;
}

- (id)_accessQueue_setupNewVersionWithOptions:(unint64_t)a3 contents:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = [(PBFPosterModelStoreCoordinator *)self _accessQueue_identityOfLatestVersion];
  long long v10 = v9;
  if (v9)
  {
    long long v11 = -[PBFPosterModelStoreCoordinator _accessQueue_buildIdentityForVersion:supplement:](self, "_accessQueue_buildIdentityForVersion:supplement:", [v9 version] + 1, 0);
    if (([v11 isNewerVersionOfIdentity:v10] & 1) == 0)
    {
      id v12 = [NSString stringWithFormat:@"nextIdentity=%@ must be a newer form of latestIdentity=%@", v11, v10];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterModelStoreCoordinator _accessQueue_setupNewVersionWithOptions:contents:error:]();
      }
      [v12 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D321B35CLL);
    }
  }
  else
  {
    long long v11 = [(PBFPosterModelStoreCoordinator *)self _accessQueue_buildIdentityForVersion:0 supplement:0];
  }
  long long v13 = __providerURLForOptions(a3, self->_providerURL, v11);
  uint64_t v14 = [MEMORY[0x1E4F924D0] pathWithProviderURL:v13 identity:v11];
  id v27 = 0;
  BOOL v15 = [(PBFPosterModelStoreCoordinator *)self _accessQueue_configureFileSystemForNewContents:v8 atPath:v14 error:&v27];
  id v16 = v27;
  id v17 = v16;
  if (v15)
  {
    if (a3 == 1)
    {
      accessQueue_stagedPosterIdentityBySupplementByVersion = self->_accessQueue_stagedPosterIdentityBySupplementByVersion;
    }
    else
    {
      if (a3)
      {
LABEL_18:
        id v21 = v11;
        goto LABEL_19;
      }
      accessQueue_stagedPosterIdentityBySupplementByVersion = self->_accessQueue_posterIdentityBySupplementByVersion;
    }
    int v22 = (void *)MEMORY[0x1E4F1CA60];
    long long v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "supplement"));
    BOOL v24 = [v22 dictionaryWithObject:v11 forKey:v23];
    uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v11, "version"));
    [(NSMutableDictionary *)accessQueue_stagedPosterIdentityBySupplementByVersion setObject:v24 forKey:v25];

    goto LABEL_18;
  }
  if (a5) {
    *a5 = v16;
  }
  uint64_t v19 = [v14 instanceURL];
  long long v20 = PBFLogReaper();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = v19;
    _os_log_impl(&dword_1D31CE000, v20, OS_LOG_TYPE_DEFAULT, "REAPING failed contents %{public}@", buf, 0xCu);
  }

  [(NSFileManager *)self->_fileManager removeItemAtURL:v19 error:0];
  id v21 = 0;
LABEL_19:

  return v21;
}

- (BOOL)_accessQueue_configureFileSystemForNewContents:(id)a3 atPath:(id)a4 error:(id *)a5
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  id v71 = a3;
  id v75 = a4;
  context = (void *)MEMORY[0x1D9433EF0]();
  uint64_t v7 = (void *)MEMORY[0x1E4F924B8];
  id v8 = [(PBFPosterModelStoreCoordinator *)self role];
  id v76 = [v7 temporaryPathForRole:v8];

  id v73 = [v75 identity];
  uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
  long long v10 = [v76 contentsURL];
  v74 = objc_msgSend(v9, "pf_posterPathInstanceURLForVersionsURL:version:", v10, objc_msgSend(v73, "version"));

  fileManager = self->_fileManager;
  id v12 = PFFileProtectionNoneAttributes();
  id v96 = 0;
  LODWORD(fileManager) = [(NSFileManager *)fileManager createDirectoryAtURL:v74 withIntermediateDirectories:1 attributes:v12 error:&v96];
  id v72 = v96;

  if (!fileManager)
  {
    if (v72)
    {
      uint64_t v103 = *MEMORY[0x1E4F28A50];
      id v104 = v72;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
    }
    else
    {
      id v13 = 0;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v13);
    id v30 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_42;
  }
  objc_msgSend(MEMORY[0x1E4F1CB10], "pf_posterPathContentsURLForInstanceURL:", v74);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = self->_fileManager;
  if (!v71)
  {
    uint64_t v31 = PFFileProtectionNoneAttributes();
    id v81 = 0;
    BOOL v32 = [(NSFileManager *)v14 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:v31 error:&v81];
    id v68 = v81;

    if (v32)
    {
      id v30 = 0;
      int v33 = 1;
      goto LABEL_38;
    }
    if (v68)
    {
      uint64_t v107 = *MEMORY[0x1E4F28A50];
      id v108 = v68;
      uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
    }
    else
    {
      uint64_t v35 = 0;
    }
    uint64_t v37 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v35);
    goto LABEL_33;
  }
  id v95 = 0;
  BOOL v15 = [(NSFileManager *)v14 copyItemAtURL:v71 toURL:v13 error:&v95];
  id v16 = v95;
  id v68 = v16;
  if (!v15)
  {
    if (v16)
    {
      uint64_t v109 = *MEMORY[0x1E4F28A50];
      id v110 = v16;
      uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
    }
    else
    {
      uint64_t v34 = 0;
    }
    uint64_t v37 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v34, v68);
LABEL_33:
    id v30 = (id)v37;
    goto LABEL_36;
  }
  id v17 = self->_fileManager;
  uint64_t v18 = PFFileProtectionNoneAttributes();
  uint64_t v19 = [v13 path];
  id v94 = 0;
  LODWORD(v17) = [(NSFileManager *)v17 setAttributes:v18 ofItemAtPath:v19 error:&v94];
  id v67 = v94;

  if (v17)
  {
    uint64_t v88 = 0;
    id v89 = &v88;
    uint64_t v90 = 0x3032000000;
    BOOL v91 = __Block_byref_object_copy__1;
    long long v92 = __Block_byref_object_dispose__1;
    id v93 = 0;
    long long v20 = self->_fileManager;
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __94__PBFPosterModelStoreCoordinator__accessQueue_configureFileSystemForNewContents_atPath_error___block_invoke;
    v87[3] = &unk_1E69824E0;
    v87[4] = &v88;
    [(NSFileManager *)v20 enumeratorAtURL:v13 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:0 errorHandler:v87];
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [v21 countByEnumeratingWithState:&v83 objects:v113 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v84;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v84 != v23) {
            objc_enumerationMutation(v21);
          }
          uint64_t v25 = *(void **)(*((void *)&v83 + 1) + 8 * i);
          id v26 = self->_fileManager;
          id v27 = PFFileProtectionNoneAttributes();
          uint64_t v28 = [v25 path];
          id v82 = 0;
          LOBYTE(v25) = [(NSFileManager *)v26 setAttributes:v27 ofItemAtPath:v28 error:&v82];
          id v29 = v82;

          if ((v25 & 1) == 0)
          {
            uint64_t v38 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, 0);
            uint64_t v39 = (void *)v89[5];
            v89[5] = v38;

            goto LABEL_29;
          }
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v83 objects:v113 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }
LABEL_29:

    id v30 = (id)v89[5];
    if (v30)
    {
      id v40 = v30;
      int v33 = 0;
    }
    else
    {
      int v33 = 1;
    }

    _Block_object_dispose(&v88, 8);
    goto LABEL_37;
  }
  if (v67)
  {
    uint64_t v111 = *MEMORY[0x1E4F28A50];
    id v112 = v67;
    long long v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
  }
  else
  {
    long long v36 = 0;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v36, v67, v68);
  id v30 = (id)objc_claimAutoreleasedReturnValue();

LABEL_36:
  int v33 = 0;
LABEL_37:

LABEL_38:
  if (!v33)
  {
LABEL_42:
    int v47 = 0;
LABEL_43:

    goto LABEL_44;
  }
  id v41 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_posterPathSupplementURLForInstanceURL:supplement:", v74, objc_msgSend(v73, "supplement"));
  id v42 = self->_fileManager;
  long long v43 = PFFileProtectionNoneAttributes();
  id v80 = 0;
  BOOL v44 = [(NSFileManager *)v42 createDirectoryAtURL:v41 withIntermediateDirectories:1 attributes:v43 error:&v80];
  id v45 = v80;

  if (!v44)
  {
    if (v45)
    {
      uint64_t v105 = *MEMORY[0x1E4F28A50];
      id v106 = v45;
      long long v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
    }
    else
    {
      long long v46 = 0;
    }
    uint64_t v56 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v46, v67);

    id v30 = (id)v56;
  }

  if (v44)
  {
    uint64_t v57 = self->_fileManager;
    uint64_t v58 = [v75 versionsURL];
    v59 = PFFileProtectionNoneAttributes();
    id v79 = 0;
    BOOL v60 = [(NSFileManager *)v57 createDirectoryAtURL:v58 withIntermediateDirectories:1 attributes:v59 error:&v79];
    id v13 = v79;

    if (v60)
    {
      v61 = self->_fileManager;
      uint64_t v62 = [v75 instanceURL];
      id v78 = 0;
      BOOL v63 = [(NSFileManager *)v61 moveItemAtURL:v74 toURL:v62 error:&v78];
      id v64 = v78;

      if (v63)
      {
        int v47 = 1;
LABEL_73:

        goto LABEL_43;
      }
      if (v64)
      {
        uint64_t v101 = *MEMORY[0x1E4F28A50];
        id v102 = v64;
        v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
      }
      else
      {
        v65 = 0;
      }
      uint64_t v66 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v65, v67);

      id v30 = (id)v66;
    }
    else
    {
      if (v13)
      {
        uint64_t v99 = *MEMORY[0x1E4F28A50];
        id v100 = v13;
        id v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
      }
      else
      {
        id v64 = 0;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v64, v67);
      v65 = v30;
      id v30 = (id)objc_claimAutoreleasedReturnValue();
    }

    int v47 = 0;
    goto LABEL_73;
  }
  int v47 = 0;
LABEL_44:
  objc_msgSend(v76, "invalidate", v67);

  if (v47)
  {
    id v48 = [v75 instanceURL];
    id v77 = 0;
    int v49 = [v48 checkResourceIsReachableAndReturnError:&v77];
    id v50 = v77;

    if (v49)
    {
      uint64_t v51 = [v75 instanceURL];
      [(PBFPosterModelStoreCoordinator *)self _accessQueue_fixupResourceValuesWithinURL:v51 synchronous:1];

      BOOL v52 = 1;
      goto LABEL_54;
    }
    if (v50)
    {
      uint64_t v97 = *MEMORY[0x1E4F28A50];
      id v98 = v50;
      char v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
    }
    else
    {
      char v53 = 0;
    }
    uint64_t v54 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v53);

    id v30 = (id)v54;
  }
  if (a5)
  {
    id v30 = v30;
    BOOL v52 = 0;
    *a5 = v30;
  }
  else
  {
    BOOL v52 = 0;
  }
LABEL_54:

  return v52;
}

uint64_t __94__PBFPosterModelStoreCoordinator__accessQueue_configureFileSystemForNewContents_atPath_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v11 = *MEMORY[0x1E4F28A50];
    v12[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v6);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return 0;
}

- (id)_accessQueue_setupNewSupplementWithOptions:(unint64_t)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(PBFPosterModelStoreCoordinator *)self _accessQueue_identityOfLatestVersion];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = -[PBFPosterModelStoreCoordinator _accessQueue_buildIdentityForVersion:supplement:](self, "_accessQueue_buildIdentityForVersion:supplement:", [v7 version], objc_msgSend(v7, "supplement") + 1);
    if (([v9 isNewerVersionOfIdentity:v8] & 1) == 0)
    {
      id v30 = [NSString stringWithFormat:@"nextIdentity=%@ must be a newer form of latestIdentity=%@", v9, v8];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PBFPosterModelStoreCoordinator _accessQueue_setupNewSupplementWithOptions:error:]();
      }
      [v30 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D321C43CLL);
    }
    BOOL v32 = __providerURLForOptions(a3, self->_providerURL, v9);
    long long v10 = objc_msgSend(MEMORY[0x1E4F924D0], "pathWithProviderURL:identity:");
    uint64_t v11 = 112;
    if (!a3) {
      uint64_t v11 = 104;
    }
    id v12 = *(id *)((char *)&self->super.isa + v11);
    fileManager = self->_fileManager;
    uint64_t v14 = [v10 supplementURL];
    BOOL v15 = PFFileProtectionNoneAttributes();
    id v33 = 0;
    BOOL v16 = [(NSFileManager *)fileManager createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:v15 error:&v33];
    id v17 = v33;

    if (v16)
    {
      uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "version"));
      uint64_t v19 = [v12 objectForKey:v18];

      if (!v19)
      {
        uint64_t v19 = objc_opt_new();
        long long v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "version"));
        [v12 setObject:v19 forKey:v20];
      }
      id v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "supplement"));
      [v19 setObject:v9 forKey:v21];

      uint64_t v22 = [v10 supplementURL];
      [(PBFPosterModelStoreCoordinator *)self _accessQueue_fixupResourceValuesWithinURL:v22 synchronous:1];

      if (!v19)
      {
        uint64_t v31 = [NSString stringWithFormat:@"posterIdentityBySupplement should be guaranteed nonnull here : identity=%@ _posterIdentityBySupplementByVersion=%@", v9, v12];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[PBFPosterModelStoreCoordinator _accessQueue_setupNewSupplementWithOptions:error:]();
        }
        [v31 UTF8String];
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1D321C498);
      }
      id v23 = v9;
    }
    else
    {
      if (a4)
      {
        if (v17)
        {
          uint64_t v36 = *MEMORY[0x1E4F28A50];
          id v37 = v17;
          uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        }
        else
        {
          uint64_t v25 = 0;
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3328, v25);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v19 = [v10 supplementURL];
      id v26 = PBFLogReaper();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v35 = v19;
        _os_log_impl(&dword_1D31CE000, v26, OS_LOG_TYPE_DEFAULT, "REAPING supplementURL %{public}@", buf, 0xCu);
      }

      id v27 = self->_fileManager;
      uint64_t v28 = [v10 supplementURL];
      [(NSFileManager *)v27 removeItemAtURL:v28 error:0];

      id v23 = 0;
    }
  }
  else
  {
    if (!a4)
    {
      id v23 = 0;
      goto LABEL_23;
    }
    uint64_t v38 = *MEMORY[0x1E4F28568];
    BOOL v24 = [NSString stringWithFormat:@"failed to find latest identity of %@", self->_posterUUID];
    v39[0] = v24;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];

    objc_msgSend(MEMORY[0x1E4F28C58], "pbf_descriptorStoreCoordinatorErrorWithCode:userInfo:", -3329, v9);
    id v23 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_23:
  return v23;
}

- (void)_accessQueue_removeSupplement:(unint64_t)a3 forVersion:(unint64_t)a4 error:(id *)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [(PBFPosterModelStoreCoordinator *)self _accessQueue_buildIdentityForVersion:a4 supplement:a3];
  uint64_t v9 = [(NSMapTable *)self->_accessQueue_identityToPosterSnapshotCoordinator objectForKey:v8];
  [v9 removeAllSnapshots];

  char v53 = (void *)v8;
  [(NSMapTable *)self->_accessQueue_identityToPosterSnapshotCoordinator removeObjectForKey:v8];
  uint64_t v56 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_posterPathInstanceURLForProviderURL:type:posterUUID:version:", self->_providerURL, objc_msgSend((id)objc_opt_class(), "type"), self->_posterUUID, a4);
  accessQueue_posterIdentityBySupplementByVersion = self->_accessQueue_posterIdentityBySupplementByVersion;
  uint64_t v11 = [NSNumber numberWithUnsignedLongLong:a4];
  id v12 = [(NSMutableDictionary *)accessQueue_posterIdentityBySupplementByVersion objectForKey:v11];

  id v13 = [NSNumber numberWithUnsignedLongLong:a3];
  uint64_t v14 = [v12 objectForKey:v13];

  if (v14)
  {
    if ((unint64_t)[v12 count] >= 2)
    {
      BOOL v15 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_posterPathSupplementURLForInstanceURL:supplement:", v56, a3);
      BOOL v16 = PBFLogReaper();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v62 = v15;
        _os_log_impl(&dword_1D31CE000, v16, OS_LOG_TYPE_DEFAULT, "REAPING supplementURL %{public}@", buf, 0xCu);
      }

      fileManager = self->_fileManager;
      id v60 = 0;
      [(NSFileManager *)fileManager removeItemAtURL:v15 error:&v60];
      id v18 = v60;
      uint64_t v19 = v18;
      if (v18)
      {
        if (a5) {
          *a5 = v18;
        }
        long long v20 = PBFLogPosterContents();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[PBFPosterModelStoreCoordinator _accessQueue_removeSupplement:forVersion:error:]();
        }
      }
    }
    id v21 = [NSNumber numberWithUnsignedLongLong:a3];
    [v12 removeObjectForKey:v21];
  }
  uint64_t v22 = (void *)MEMORY[0x1E4F1CB10];
  id v23 = [(PBFPosterModelStoreCoordinator *)self _accessQueue_buildIdentityForVersion:a4 supplement:a3];
  BOOL v24 = __stagedProviderURLForIdentity(v23);
  char v55 = objc_msgSend(v22, "pf_posterPathInstanceURLForProviderURL:type:posterUUID:version:", v24, objc_msgSend((id)objc_opt_class(), "type"), self->_posterUUID, a4);

  accessQueue_stagedPosterIdentityBySupplementByVersion = self->_accessQueue_stagedPosterIdentityBySupplementByVersion;
  id v26 = [NSNumber numberWithUnsignedLongLong:a4];
  id v27 = [(NSMutableDictionary *)accessQueue_stagedPosterIdentityBySupplementByVersion objectForKey:v26];

  uint64_t v28 = [NSNumber numberWithUnsignedLongLong:a3];
  id v29 = [v27 objectForKey:v28];

  if (v29)
  {
    if ((unint64_t)[v12 count] >= 2)
    {
      id v30 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_posterPathSupplementURLForInstanceURL:supplement:", v55, a3);
      uint64_t v31 = PBFLogReaper();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v62 = v30;
        _os_log_impl(&dword_1D31CE000, v31, OS_LOG_TYPE_DEFAULT, "REAPING supplementURL %{public}@", buf, 0xCu);
      }

      BOOL v32 = self->_fileManager;
      id v59 = 0;
      [(NSFileManager *)v32 removeItemAtURL:v30 error:&v59];
      id v33 = v59;
      uint64_t v34 = v33;
      if (v33)
      {
        if (a5) {
          *a5 = v33;
        }
        uint64_t v35 = PBFLogPosterContents();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          -[PBFPosterModelStoreCoordinator _accessQueue_removeSupplement:forVersion:error:]();
        }
      }
    }
    uint64_t v36 = [NSNumber numberWithUnsignedLongLong:a3];
    [v12 removeObjectForKey:v36];
  }
  uint64_t v37 = [v12 count];
  if (v14 && !v37)
  {
    uint64_t v38 = PBFLogReaper();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v62 = v56;
      _os_log_impl(&dword_1D31CE000, v38, OS_LOG_TYPE_DEFAULT, "REAPING instanceURL %{public}@", buf, 0xCu);
    }

    uint64_t v39 = self->_fileManager;
    id v58 = 0;
    [(NSFileManager *)v39 removeItemAtURL:v56 error:&v58];
    id v40 = v58;
    id v41 = v40;
    if (v40)
    {
      if (a5) {
        *a5 = v40;
      }
      id v42 = PBFLogPosterContents();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterModelStoreCoordinator _accessQueue_removeSupplement:forVersion:error:]();
      }
    }
    long long v43 = self->_accessQueue_posterIdentityBySupplementByVersion;
    BOOL v44 = [NSNumber numberWithUnsignedLongLong:a4];
    [(NSMutableDictionary *)v43 removeObjectForKey:v44];
  }
  uint64_t v45 = [v27 count];
  if (v29 && !v45)
  {
    long long v46 = PBFLogReaper();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v62 = v55;
      _os_log_impl(&dword_1D31CE000, v46, OS_LOG_TYPE_DEFAULT, "REAPING stagedInstanceURL %{public}@", buf, 0xCu);
    }

    int v47 = self->_fileManager;
    id v57 = 0;
    [(NSFileManager *)v47 removeItemAtURL:v55 error:&v57];
    id v48 = v57;
    int v49 = v48;
    if (v48)
    {
      if (a5) {
        *a5 = v48;
      }
      id v50 = PBFLogPosterContents();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        -[PBFPosterModelStoreCoordinator _accessQueue_removeSupplement:forVersion:error:]();
      }
    }
    uint64_t v51 = self->_accessQueue_stagedPosterIdentityBySupplementByVersion;
    BOOL v52 = [NSNumber numberWithUnsignedLongLong:a4];
    [(NSMutableDictionary *)v51 removeObjectForKey:v52];
  }
}

- (id)_accessQueue_buildIdentityForVersion:(unint64_t)a3 supplement:(unint64_t)a4
{
  uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Please implement in your subclass.", a4);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v11 = 138544642;
    id v12 = v7;
    __int16 v13 = 2114;
    uint64_t v14 = v9;
    __int16 v15 = 2048;
    BOOL v16 = self;
    __int16 v17 = 2114;
    id v18 = @"PBFPosterModelStoreCoordinator.m";
    __int16 v19 = 1024;
    int v20 = 1431;
    __int16 v21 = 2114;
    uint64_t v22 = v6;
    _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);
  }
  [v6 UTF8String];
  id result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)_accessQueue_purgeSnapshotCache
{
}

uint64_t __65__PBFPosterModelStoreCoordinator__accessQueue_purgeSnapshotCache__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

- (void)purgeSnapshotCache
{
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PBFPosterModelStoreCoordinator_purgeSnapshotCache__block_invoke;
  block[3] = &unk_1E69808C0;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

uint64_t __52__PBFPosterModelStoreCoordinator_purgeSnapshotCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessQueue_purgeSnapshotCache");
}

- (void)_accessQueue_fixupResourceValuesWithinURL:(id)a3 synchronous:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (NSURL *)a3;
  if (!self->_readonly)
  {
    uint64_t v7 = [(id)objc_opt_class() expectedURLResourceValuesForFiles];
    uint64_t v8 = [(id)objc_opt_class() expectedURLResourceValuesForDirectories];
    if ([v7 count] || objc_msgSend(v8, "count"))
    {
      BOOL v45 = v4;
      if (!v6) {
        uint64_t v6 = self->_identifierURL;
      }
      [(id)objc_opt_class() type];
      uint64_t v9 = NSStringFromPFServerPosterType();
      long long v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      id v12 = self->_posterUUID;
      __int16 v13 = self->_extensionIdentifier;
      uint64_t v14 = PBFLogPosterContents();
      os_signpost_id_t v15 = os_signpost_id_generate(v14);

      BOOL v16 = PBFLogPosterContents();
      __int16 v17 = v16;
      os_signpost_id_t spid = v15;
      unint64_t v40 = v15 - 1;
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_DWORD *)buf = 138544386;
        id v57 = v13;
        __int16 v58 = 2114;
        uint64_t v59 = v11;
        __int16 v60 = 2114;
        v61 = v12;
        __int16 v62 = 2114;
        uint64_t v63 = v9;
        __int16 v64 = 2114;
        v65 = v6;
        _os_signpost_emit_with_name_impl(&dword_1D31CE000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "gather resources for fixupResourceValues", "extension: %{public}@; class: %{public}@; posterUUID %{public}@; type %{public}@; URL: %{public}@",
          buf,
          0x34u);
      }
      id v42 = v12;
      long long v43 = (void *)v11;
      BOOL v44 = (void *)v9;

      id v18 = [MEMORY[0x1E4F1CA80] setWithObject:*MEMORY[0x1E4F1C5C0]];
      __int16 v19 = [v7 allKeys];
      [v18 addObjectsFromArray:v19];

      int v20 = [v8 allKeys];
      [v18 addObjectsFromArray:v20];

      __int16 v21 = (void *)MEMORY[0x1E4F28F60];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __88__PBFPosterModelStoreCoordinator__accessQueue_fixupResourceValuesWithinURL_synchronous___block_invoke;
      v52[3] = &unk_1E6982528;
      long long v46 = v8;
      id v38 = v8;
      id v53 = v38;
      int v47 = v7;
      id v37 = v7;
      id v54 = v37;
      uint64_t v22 = [v21 predicateWithBlock:v52];
      id v41 = v18;
      id v23 = [(PBFPosterModelStoreCoordinator *)self _accessQueue_contentsOfURLWithinStore:v6 resourceKeys:v18 standardizeURLs:0];
      uint64_t v39 = (void *)v22;
      BOOL v24 = [v23 filteredOrderedSetUsingPredicate:v22];

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v25 = v24;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v48 objects:v55 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = 0;
        id v29 = 0;
        uint64_t v30 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v49 != v30) {
              objc_enumerationMutation(v25);
            }
            BOOL v32 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            if (objc_msgSend(v32, "pbf_isDirectory"))
            {
              if (v29)
              {
                id v33 = v29;
              }
              else
              {
                id v33 = objc_opt_new();
                id v29 = v33;
              }
            }
            else if (v28)
            {
              id v33 = v28;
            }
            else
            {
              id v33 = objc_opt_new();
              uint64_t v28 = v33;
            }
            [v33 addObject:v32];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v48 objects:v55 count:16];
        }
        while (v27);
      }
      else
      {
        uint64_t v28 = 0;
        id v29 = 0;
      }

      uint64_t v34 = PBFLogPosterContents();
      uint64_t v35 = v34;
      if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        *(_DWORD *)buf = 138544386;
        id v57 = v13;
        __int16 v58 = 2114;
        uint64_t v59 = (uint64_t)v43;
        __int16 v60 = 2114;
        v61 = v42;
        __int16 v62 = 2114;
        uint64_t v63 = (uint64_t)v44;
        __int16 v64 = 2114;
        v65 = v6;
        _os_signpost_emit_with_name_impl(&dword_1D31CE000, v35, OS_SIGNPOST_INTERVAL_END, spid, "gather resources for fixupResourceValues", "extension: %{public}@; class: %{public}@; posterUUID %{public}@; type %{public}@; URL: %{public}@",
          buf,
          0x34u);
      }

      [(PBFPosterModelStoreCoordinator *)self _accessQueue_applyResourceValuesForURLs:v28 expectedResourceValues:v37 synchronous:v45];
      [(PBFPosterModelStoreCoordinator *)self _accessQueue_applyResourceValuesForURLs:v29 expectedResourceValues:v38 synchronous:v45];

      uint64_t v8 = v46;
      uint64_t v7 = v47;
    }
  }
}

uint64_t __88__PBFPosterModelStoreCoordinator__accessQueue_fixupResourceValuesWithinURL_synchronous___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(v3, "pbf_isPosterSnapshot"))
  {
    uint64_t v4 = 1;
  }
  else
  {
    int v5 = objc_msgSend(v3, "pbf_isDirectory");
    uint64_t v6 = 40;
    if (v5) {
      uint64_t v6 = 32;
    }
    uint64_t v4 = objc_msgSend(v3, "pbf_URLConformsToExpectedResourceValues:error:", *(void *)(a1 + v6), 0) ^ 1;
  }

  return v4;
}

- (void)_accessQueue_applyResourceValuesForURLs:(id)a3 expectedResourceValues:(id)a4 synchronous:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    [(id)objc_opt_class() type];
    long long v10 = NSStringFromPFServerPosterType();
    uint64_t v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    __int16 v13 = self->_posterUUID;
    uint64_t v14 = self->_extensionIdentifier;
    os_signpost_id_t v15 = PBFLogPosterContents();
    os_signpost_id_t v16 = os_signpost_id_generate(v15);

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __109__PBFPosterModelStoreCoordinator__accessQueue_applyResourceValuesForURLs_expectedResourceValues_synchronous___block_invoke;
    aBlock[3] = &unk_1E6982550;
    os_signpost_id_t v30 = v16;
    BOOL v24 = v14;
    id v25 = v12;
    uint64_t v26 = v13;
    id v27 = v10;
    id v28 = v8;
    id v29 = v9;
    id v17 = v10;
    id v18 = v13;
    id v19 = v12;
    int v20 = v14;
    __int16 v21 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v22 = v21;
    if (v5) {
      v21[2](v21);
    }
    else {
      PBFDispatchAsyncWithString(@"FixupResourceValues", QOS_CLASS_BACKGROUND, v21);
    }
  }
}

void __109__PBFPosterModelStoreCoordinator__accessQueue_applyResourceValuesForURLs_expectedResourceValues_synchronous___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v2 = PBFLogPosterContents();
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 80);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    BOOL v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138544386;
    id v38 = v5;
    __int16 v39 = 2114;
    id v40 = v6;
    __int16 v41 = 2114;
    uint64_t v42 = v7;
    __int16 v43 = 2114;
    uint64_t v44 = v8;
    __int16 v45 = 2114;
    uint64_t v46 = v9;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "fixupResourceValues", "extension: %{public}@; class: %{public}@; posterUUID %{public}@; type %{public}@; URLs: %{public}@",
      buf,
      0x34u);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v10 = *(id *)(a1 + 64);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v33;
    *(void *)&long long v12 = 138412546;
    long long v30 = v12;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v10);
        }
        os_signpost_id_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * v15);
        uint64_t v17 = *(void *)(a1 + 72);
        id v31 = 0;
        int v18 = objc_msgSend(v16, "setResourceValues:error:", v17, &v31, v30);
        id v19 = v31;
        int v20 = PBFLogPosterContents();
        __int16 v21 = v20;
        if (v18)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            id v38 = v16;
            _os_log_debug_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_DEBUG, "Corrected resource values for %@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v30;
          id v38 = v16;
          __int16 v39 = 2114;
          id v40 = v19;
          _os_log_error_impl(&dword_1D31CE000, v21, OS_LOG_TYPE_ERROR, "Failed to correct resource values for %@: %{public}@", buf, 0x16u);
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v13);
  }

  uint64_t v22 = PBFLogPosterContents();
  id v23 = v22;
  os_signpost_id_t v24 = *(void *)(a1 + 80);
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    id v25 = *(void **)(a1 + 32);
    uint64_t v26 = *(void **)(a1 + 40);
    uint64_t v27 = *(void *)(a1 + 48);
    uint64_t v28 = *(void *)(a1 + 56);
    uint64_t v29 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138544386;
    id v38 = v25;
    __int16 v39 = 2114;
    id v40 = v26;
    __int16 v41 = 2114;
    uint64_t v42 = v27;
    __int16 v43 = 2114;
    uint64_t v44 = v28;
    __int16 v45 = 2114;
    uint64_t v46 = v29;
    _os_signpost_emit_with_name_impl(&dword_1D31CE000, v23, OS_SIGNPOST_INTERVAL_END, v24, "fixupResourceValues", "extension: %{public}@; class: %{public}@; posterUUID %{public}@; type %{public}@; URLs: %{public}@",
      buf,
      0x34u);
  }
}

- (id)_accessQueue_fetchIdentityForVersion:(unint64_t)a3 supplement:(unint64_t)a4 error:(id *)a5
{
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_posterPathInstanceURLForProviderURL:type:posterUUID:version:", self->_providerURL, objc_msgSend((id)objc_opt_class(), "type"), self->_posterUUID, a3);
  id v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_posterPathContentsURLForInstanceURL:", v9);
  if ([v10 checkResourceIsReachableAndReturnError:a5])
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_posterPathSupplementURLForInstanceURL:supplement:", v9, a4);
    if ([v11 checkResourceIsReachableAndReturnError:a5])
    {
      accessQueue_posterIdentityBySupplementByVersion = self->_accessQueue_posterIdentityBySupplementByVersion;
      uint64_t v13 = [NSNumber numberWithUnsignedLongLong:a3];
      uint64_t v14 = [(NSMutableDictionary *)accessQueue_posterIdentityBySupplementByVersion objectForKey:v13];

      if (!v14)
      {
        uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
        uint64_t v15 = self->_accessQueue_posterIdentityBySupplementByVersion;
        os_signpost_id_t v16 = [NSNumber numberWithUnsignedLongLong:a3];
        [(NSMutableDictionary *)v15 setObject:v14 forKey:v16];
      }
      uint64_t v17 = [NSNumber numberWithUnsignedLongLong:a4];
      int v18 = [v14 objectForKey:v17];

      if (!v18)
      {
        int v18 = [(PBFPosterModelStoreCoordinator *)self _accessQueue_buildIdentityForVersion:a3 supplement:a4];
        id v19 = [NSNumber numberWithUnsignedLongLong:a4];
        [v14 setObject:v18 forKey:v19];
      }
    }
    else
    {
      int v18 = 0;
    }
  }
  else
  {
    int v18 = 0;
  }

  return v18;
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (NSURL)identifierURL
{
  return self->_identifierURL;
}

- (NSUUID)posterUUID
{
  return self->_posterUUID;
}

- (NSString)descriptorIdentifier
{
  return self->_descriptorIdentifier;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue_identityToPosterSnapshotCoordinator, 0);
  objc_storeStrong((id *)&self->_accessQueue_stagedPosterIdentityBySupplementByVersion, 0);
  objc_storeStrong((id *)&self->_accessQueue_posterIdentityBySupplementByVersion, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_posterUUID, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_transientInternalInfoURL, 0);
  objc_storeStrong((id *)&self->_providerURL, 0);
  objc_storeStrong((id *)&self->_identifierURL, 0);
  objc_storeStrong((id *)&self->_containerVersionsURL, 0);
  objc_storeStrong((id *)&self->_providerInfoURL, 0);
  objc_storeStrong((id *)&self->_descriptorIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
}

+ (void)createNewStoreCoordinatorWithPath:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)createNewStoreCoordinatorWithPath:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)createNewStoreCoordinatorWithPath:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)createNewStoreCoordinatorWithPath:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)createNewStoreCoordinatorWithPath:error:.cold.5()
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9_0(&dword_1D31CE000, v0, v1, "storeCoordinator %s> error: %@", v2, v3, v4, v5, 2u);
}

+ (void)createNewStoreCoordinatorWithPath:error:.cold.6()
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9_0(&dword_1D31CE000, v0, v1, "writeToProvider %s> error: %@", v2, v3, v4, v5, 2u);
}

+ (void)createNewStoreCoordinatorWithPath:error:.cold.7()
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9_0(&dword_1D31CE000, v0, v1, "%s> error: %@", v2, v3, v4, v5, 2u);
}

+ (void)createNewStoreCoordinatorWithPath:error:.cold.8()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)createNewStoreCoordinatorWithPath:error:.cold.9()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)createNewStoreCoordinatorWithPath:error:.cold.11()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setObject:forKeyedSubscript:.cold.1()
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

- (void)setObject:forKeyedSubscript:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

void __59__PBFPosterModelStoreCoordinator__accessQueue_snapshotURLs__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1D31CE000, log, OS_LOG_TYPE_ERROR, "_accessQueue_snapshotURLs %{public}@ encountered an error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)addNewVersionWithContents:error:.cold.1()
{
  OUTLINED_FUNCTION_14_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9_0(&dword_1D31CE000, v0, v1, "%s> error: %@", v2, v3, v4, v5, 2u);
}

- (void)addNewSupplementWithError:.cold.1()
{
  OUTLINED_FUNCTION_14_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9_0(&dword_1D31CE000, v0, v1, "%s> error: %@", v2, v3, v4, v5, 2u);
}

- (void)stageNewVersionWithContents:error:.cold.1()
{
  OUTLINED_FUNCTION_14_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9_0(&dword_1D31CE000, v0, v1, "%s> error: %@", v2, v3, v4, v5, 2u);
}

- (void)stageNewSupplementWithError:.cold.1()
{
  OUTLINED_FUNCTION_14_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9_0(&dword_1D31CE000, v0, v1, "%s> error: %@", v2, v3, v4, v5, 2u);
}

- (void)removeSupplement:forVersion:error:.cold.1()
{
  OUTLINED_FUNCTION_14_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_9_0(&dword_1D31CE000, v0, v1, "%s> error: %@", v2, v3, v4, v5, 2u);
}

- (void)_accessQueue_checkEnvironmentConsistency
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9_0(&dword_1D31CE000, v0, v1, "%s> error unarchiving provider info: %@", v2, v3, v4, v5, 2u);
}

- (void)_accessQueue_setupNewVersionWithOptions:contents:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_accessQueue_setupNewSupplementWithOptions:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_accessQueue_setupNewSupplementWithOptions:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)_accessQueue_removeSupplement:forVersion:error:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_13_0(&dword_1D31CE000, v0, v1, "%s> error removing version %llu: %@", v2);
}

- (void)_accessQueue_removeSupplement:forVersion:error:.cold.3()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_13_0(&dword_1D31CE000, v0, v1, "%s> error removing supplement=%llu : %@", v2);
}

@end