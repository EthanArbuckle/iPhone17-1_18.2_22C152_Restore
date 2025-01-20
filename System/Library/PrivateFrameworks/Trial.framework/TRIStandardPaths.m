@interface TRIStandardPaths
+ (id)resolveHardCodedPath:(id)a3;
+ (id)schemaVersionFile;
+ (id)sharedSystemPaths;
+ (unsigned)currentSchemaVersion;
+ (unsigned)legacySchemaVersion;
+ (unsigned)resetStorageRequestSchemaVersion;
- (BOOL)validateWithError:(id *)a3;
- (TRIStandardPaths)initWithCurrentSchemaVersion;
- (TRIStandardPaths)initWithSchemaVersion:(unsigned int)a3;
- (TRIStandardPaths)initWithSchemaVersion:(unsigned int)a3 container:(id)a4 asClientProcess:(BOOL)a5;
- (id)_pathErrorWithDescription:(id)a3;
- (id)_realHomeDirectory;
- (id)_trialSystemRootDir;
- (id)_trialSystemRootDirWithError:(id *)a3;
- (id)_versionSpecificStorageDir;
- (id)_versionSpecificStorageDirUsingGlobal:(BOOL)a3;
- (id)_versionSpecificSystemStorageDir;
- (id)activeLowLevelFactorsFile;
- (id)allowedLowLevelDefaultLevelsDir;
- (id)assetStore;
- (id)assetStoreUsingGlobal:(BOOL)a3;
- (id)container;
- (id)containerDir;
- (id)databaseDir;
- (id)decryptionKeyDirForAppleInternal:(BOOL)a3;
- (id)deviceIdentifierFile;
- (id)experimentsDir;
- (id)externalParametersFile;
- (id)localTempDir;
- (id)logDir;
- (id)namespaceDescriptorsBMLTDir;
- (id)namespaceDescriptorsDefaultDir;
- (id)namespaceDescriptorsDevOverrideDir;
- (id)namespaceDescriptorsDir;
- (id)namespaceDescriptorsDirUsingGlobal:(BOOL)a3;
- (id)namespaceDescriptorsExperimentDir;
- (id)namespaceDescriptorsPathForLayer:(unint64_t)a3;
- (id)namespaceDescriptorsRolloutDir;
- (id)pathsForContainer:(id)a3 asClientProcess:(BOOL)a4;
- (id)subjectDataFile;
- (id)systemDataFile;
- (id)treatmentsDir;
- (id)treatmentsDirUsingGlobal:(BOOL)a3;
- (id)trialRootDir;
- (id)trialRootDirWithError:(id *)a3;
- (id)trialVolume;
- (id)volumeForDirectory:(id)a3;
@end

@implementation TRIStandardPaths

- (id)namespaceDescriptorsDefaultDir
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x19F3AD060]();
  v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v6 = [v5 stringForKey:@"com.apple.triald.namespacedescriptor.path"];

  if (v6)
  {
    v7 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_19D909000, v7, OS_LOG_TYPE_DEFAULT, "Overriding namespaceDescriptorsDefaultDir to %@", buf, 0xCu);
    }

    id v8 = v6;
  }
  else if (self->_container)
  {
    v9 = [(TRIStandardPaths *)self namespaceDescriptorsDir];
    id v8 = [v9 stringByAppendingPathComponent:@"default"];
  }
  else
  {
    v10 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
    v11 = [v10 firstObject];

    if (!v11)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"TRIPaths.m", 435, @"Invalid parameter not satisfying: %@", @"syslib" object file lineNumber description];
    }
    v12 = NSString;
    v16[0] = v11;
    v16[1] = @"Trial";
    v16[2] = @"NamespaceDescriptors";
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
    id v8 = [v12 pathWithComponents:v13];
  }
  return v8;
}

- (id)namespaceDescriptorsRolloutDir
{
  v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  v4 = [(TRIStandardPaths *)self namespaceDescriptorsDir];
  v5 = [v4 stringByAppendingPathComponent:@"rollout"];

  return v5;
}

- (id)namespaceDescriptorsExperimentDir
{
  v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  v4 = [(TRIStandardPaths *)self namespaceDescriptorsDir];
  v5 = [v4 stringByAppendingPathComponent:@"experiment"];

  return v5;
}

- (id)namespaceDescriptorsDevOverrideDir
{
  v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  v4 = [(TRIStandardPaths *)self namespaceDescriptorsDir];
  v5 = [v4 stringByAppendingPathComponent:@"devOverride"];

  return v5;
}

- (id)namespaceDescriptorsDir
{
  return [(TRIStandardPaths *)self namespaceDescriptorsDirUsingGlobal:0];
}

- (id)treatmentsDir
{
  return [(TRIStandardPaths *)self treatmentsDirUsingGlobal:0];
}

- (id)treatmentsDirUsingGlobal:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)MEMORY[0x19F3AD060](self, a2);
  v6 = [(TRIStandardPaths *)self trialRootDirUsingGlobal:v3];
  v7 = [v6 stringByAppendingPathComponent:@"Treatments"];

  return v7;
}

- (id)namespaceDescriptorsDirUsingGlobal:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)MEMORY[0x19F3AD060](self, a2);
  v6 = [(TRIStandardPaths *)self trialRootDirUsingGlobal:v3];
  v7 = [v6 stringByAppendingPathComponent:@"NamespaceDescriptors"];

  return v7;
}

- (id)trialRootDir
{
  id v10 = 0;
  v4 = [(TRIStandardPaths *)self trialRootDirWithError:&v10];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [v10 description];
    id v8 = (void *)v7;
    if (v7) {
      v9 = (__CFString *)v7;
    }
    else {
      v9 = @"could not find Trial root directory";
    }
    [v6 handleFailureInMethod:a2 object:self file:@"TRIPaths.m" lineNumber:232 description:v9];
  }
  return v4;
}

- (id)trialRootDirWithError:(id *)a3
{
  BOOL v3 = a3;
  v28[3] = *MEMORY[0x1E4F143B8];
  if (self->_container)
  {
    v5 = self->_containerPath;
    if (v5)
    {
      v6 = v5;
      uint64_t v7 = NSString;
      v28[0] = v5;
      v28[1] = @"Library";
      v28[2] = @"Trial";
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
      BOOL v3 = [v7 pathWithComponents:v8];
    }
    else if (v3)
    {
      v9 = NSString;
      id v10 = [(TRIAppContainer *)self->_container identifier];
      v11 = [v9 stringWithFormat:@"could not find path for container %@", v10];
      uint64_t v12 = [(TRIStandardPaths *)self _pathErrorWithDescription:v11];
      v13 = *v3;
      void *v3 = (void *)v12;

      BOOL v3 = 0;
    }
  }
  else
  {
    BOOL v3 = [(TRIStandardPaths *)self _trialSystemRootDirWithError:a3];
  }
  if ((atomic_exchange(&self->_loggedRootDir._Value, 1u) & 1) == 0)
  {
    v14 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      container = self->_container;
      if (container) {
        v18 = (__CFString *)[[NSString alloc] initWithFormat:@"(container %@)", self->_container];
      }
      else {
        v18 = @"(no container)";
      }
      *(_DWORD *)buf = 138413058;
      id v21 = v16;
      __int16 v22 = 2048;
      v23 = self;
      __int16 v24 = 2112;
      v25 = v18;
      __int16 v26 = 2112;
      v27 = v3;
      _os_log_impl(&dword_19D909000, v14, OS_LOG_TYPE_DEFAULT, "%@ %p %@: using Trial root dir %@", buf, 0x2Au);
      if (container) {
    }
      }
  }
  return v3;
}

- (id)_trialSystemRootDirWithError:(id *)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x19F3AD060](self, a2);
  if (!geteuid())
  {
    id v10 = @"/var/mobile/Library";
LABEL_11:
    v11 = NSString;
    v17[0] = @"/private";
    v17[1] = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v13 = [v11 pathWithComponents:v12];

    v14 = [v13 stringByAppendingPathComponent:@"Trial"];
LABEL_12:

    goto LABEL_13;
  }
  if (qword_1EB3B7890 != -1) {
    dispatch_once(&qword_1EB3B7890, &__block_literal_global_15);
  }
  if (_MergedGlobals_12)
  {
    uint64_t v6 = [(TRIStandardPaths *)self _realHomeDirectory];
    uint64_t v7 = (void *)v6;
    if (v6)
    {
      id v8 = NSString;
      v18[0] = v6;
      v18[1] = @"Library";
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
      id v10 = [v8 pathWithComponents:v9];
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    uint64_t v7 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    id v10 = [v7 firstObject];
  }

  if (v10) {
    goto LABEL_11;
  }
  if (a3)
  {
    id v16 = [(TRIStandardPaths *)self _pathErrorWithDescription:@"library path is nil"];
    v14 = 0;
    v13 = *a3;
    *a3 = v16;
    goto LABEL_12;
  }
  v14 = 0;
LABEL_13:
  return v14;
}

- (id)_realHomeDirectory
{
  return @"/var/mobile";
}

+ (id)resolveHardCodedPath:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)subjectDataFile
{
  id v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  v4 = [(TRIStandardPaths *)self namespaceDescriptorsDir];
  v5 = [v4 stringByAppendingPathComponent:@"subject.data"];

  return v5;
}

+ (id)sharedSystemPaths
{
  if (qword_1EB3B78A0 != -1) {
    dispatch_once(&qword_1EB3B78A0, &__block_literal_global_68);
  }
  v2 = (void *)qword_1EB3B7898;
  return v2;
}

void __37__TRIStandardPaths_sharedSystemPaths__block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  v1 = [[TRIStandardPaths alloc] initWithCurrentSchemaVersion];
  v2 = (void *)qword_1EB3B7898;
  qword_1EB3B7898 = (uint64_t)v1;
}

- (TRIStandardPaths)initWithSchemaVersion:(unsigned int)a3
{
  v4 = [(TRIStandardPaths *)self initWithSchemaVersion:*(void *)&a3 container:0 asClientProcess:0];
  if (!v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:0 file:@"TRIPaths.m" lineNumber:334 description:@"initWithSchemaVersion is expected to initialize to non-nil"];
  }
  return v4;
}

- (TRIStandardPaths)initWithSchemaVersion:(unsigned int)a3 container:(id)a4 asClientProcess:(BOOL)a5
{
  id v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TRIStandardPaths;
  id v10 = [(TRIStandardPaths *)&v17 init];
  v11 = v10;
  if (!v10) {
    goto LABEL_7;
  }
  v10->_schemaVersion = a3;
  objc_storeStrong((id *)&v10->_container, a4);
  v11->_isClient = a5;
  atomic_store(0, (unsigned __int8 *)&v11->_loggedRootDir);
  if (!v9) {
    goto LABEL_7;
  }
  if (a5) {
    [v9 containerURLAsOwner];
  }
  else {
  uint64_t v12 = [v9 containerURL];
  }
  uint64_t v13 = [v12 path];
  containerPath = v11->_containerPath;
  v11->_containerPath = (NSString *)v13;

  if (!v11->_containerPath) {
    v15 = 0;
  }
  else {
LABEL_7:
  }
    v15 = v11;

  return v15;
}

- (TRIStandardPaths)initWithCurrentSchemaVersion
{
  return [(TRIStandardPaths *)self initWithSchemaVersion:7];
}

void __49__TRIStandardPaths__trialSystemRootDirWithError___block_invoke()
{
  v0 = (void *)MEMORY[0x19F3AD060]();
  v1 = (void *)MEMORY[0x1E4F93B28];
  v2 = TRILogCategory_ClientFramework();
  if ([v1 hasTrueBooleanEntitlement:@"com.apple.private.security.storage.triald" logHandle:v2])
  {
    _MergedGlobals_12 = 1;
  }
  else
  {
    id v3 = +[TRIEntitlement objectForCurrentProcessEntitlement:@"com.apple.trial.client"];
    _MergedGlobals_12 = v3 != 0;
  }
}

- (id)_pathErrorWithDescription:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F281F8];
  uint64_t v12 = *MEMORY[0x1E4F28568];
  v5 = (void *)MEMORY[0x1E4F28B50];
  id v6 = a3;
  uint64_t v7 = [v5 mainBundle];
  id v8 = [v7 localizedStringForKey:v6 value:&stru_1EEFB6D68 table:0];

  v13[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = [v3 errorWithDomain:v4 code:4 userInfo:v9];

  return v10;
}

- (id)_trialSystemRootDir
{
  uint64_t v4 = [(TRIStandardPaths *)self _trialSystemRootDirWithError:0];
  if (!v4)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"TRIPaths.m" lineNumber:139 description:@"Trial system root dir is nil"];
  }
  return v4;
}

- (BOOL)validateWithError:(id *)a3
{
  id v3 = [(TRIStandardPaths *)self trialRootDirWithError:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)trialVolume
{
  id v3 = [(TRIStandardPaths *)self trialRootDir];
  BOOL v4 = [(TRIStandardPaths *)self volumeForDirectory:v3];

  return v4;
}

- (id)volumeForDirectory:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(&v11, 0, 512);
  id v3 = a3;
  if (statfs((const char *)[v3 UTF8String], &v11))
  {
    BOOL v4 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_error_impl(&dword_19D909000, v4, OS_LOG_TYPE_ERROR, "Could not resolve the volume for directory: %@", (uint8_t *)&v7, 0xCu);
    }
    v5 = 0;
  }
  else
  {
    v5 = [NSString stringWithUTF8String:v11.f_mntonname];
    BOOL v4 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      id v8 = v5;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_19D909000, v4, OS_LOG_TYPE_INFO, "Found the following volume: %@ for the given directory: %@", (uint8_t *)&v7, 0x16u);
    }
  }

  return v5;
}

- (id)container
{
  return self->_container;
}

- (id)containerDir
{
  if (self->_container) {
    v2 = self->_containerPath;
  }
  else {
    v2 = @"/";
  }
  return v2;
}

+ (unsigned)currentSchemaVersion
{
  return 7;
}

+ (unsigned)legacySchemaVersion
{
  return 0;
}

+ (unsigned)resetStorageRequestSchemaVersion
{
  return -1;
}

+ (id)schemaVersionFile
{
  v2 = (void *)MEMORY[0x19F3AD060](a1, a2);
  id v3 = [[TRIStandardPaths alloc] initWithCurrentSchemaVersion];
  BOOL v4 = [(TRIStandardPaths *)v3 _trialSystemRootDir];
  v5 = [v4 stringByAppendingPathComponent:@"schemaVersion.txt"];

  return v5;
}

- (id)pathsForContainer:(id)a3 asClientProcess:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (TRIAppContainer *)a3;
  if (self->_isClient == v4
    && ((container = self->_container, container == v6)
     || [(TRIAppContainer *)container isEqualToContainer:v6]))
  {
    id v8 = self;
  }
  else
  {
    id v8 = [[TRIStandardPaths alloc] initWithSchemaVersion:self->_schemaVersion container:v6 asClientProcess:v4];
  }
  __int16 v9 = v8;

  return v9;
}

- (id)_versionSpecificSystemStorageDir
{
  id v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  unsigned int schemaVersion = self->_schemaVersion;
  unsigned int v5 = +[TRIStandardPaths legacySchemaVersion];
  id v6 = [(TRIStandardPaths *)self _trialSystemRootDir];
  if (schemaVersion != v5)
  {
    int v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"v%u", self->_schemaVersion);
    uint64_t v8 = [v6 stringByAppendingPathComponent:v7];

    id v6 = (void *)v8;
  }
  return v6;
}

- (id)_versionSpecificStorageDir
{
  id v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  BOOL v4 = [(TRIStandardPaths *)self trialRootDir];
  unsigned int v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"v%u", self->_schemaVersion);
  id v6 = [v4 stringByAppendingPathComponent:v5];

  return v6;
}

- (id)_versionSpecificStorageDirUsingGlobal:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = (void *)MEMORY[0x19F3AD060](self, a2);
  id v6 = [(TRIStandardPaths *)self trialRootDirUsingGlobal:v3];
  int v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"v%u", self->_schemaVersion);
  uint64_t v8 = [v6 stringByAppendingPathComponent:v7];

  return v8;
}

- (id)logDir
{
  v2 = (void *)MEMORY[0x19F3AD060](self, a2);
  BOOL v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  BOOL v4 = [v3 objectAtIndexedSubscript:0];

  unsigned int v5 = [v4 stringByAppendingPathComponent:@"Logs"];
  id v6 = [v5 stringByAppendingPathComponent:@"Trial"];

  return v6;
}

- (id)databaseDir
{
  BOOL v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  BOOL v4 = [(TRIStandardPaths *)self _versionSpecificSystemStorageDir];
  unsigned int v5 = [v4 stringByAppendingPathComponent:@"Database"];

  return v5;
}

- (id)namespaceDescriptorsPathForLayer:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      BOOL v3 = [(TRIStandardPaths *)self namespaceDescriptorsDefaultDir];
      goto LABEL_9;
    case 2uLL:
      BOOL v3 = [(TRIStandardPaths *)self namespaceDescriptorsRolloutDir];
      goto LABEL_9;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_10;
    case 4uLL:
      goto LABEL_5;
    case 8uLL:
      BOOL v3 = [(TRIStandardPaths *)self namespaceDescriptorsDevOverrideDir];
      goto LABEL_9;
    default:
      if (a3 == 16)
      {
        BOOL v3 = [(TRIStandardPaths *)self namespaceDescriptorsBMLTDir];
      }
      else
      {
        if (a3 != 32) {
          goto LABEL_10;
        }
LABEL_5:
        BOOL v3 = [(TRIStandardPaths *)self namespaceDescriptorsExperimentDir];
      }
LABEL_9:
      a2 = v3;
LABEL_10:
      return (id)(id)a2;
  }
}

- (id)namespaceDescriptorsBMLTDir
{
  BOOL v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  BOOL v4 = [(TRIStandardPaths *)self namespaceDescriptorsDir];
  unsigned int v5 = [v4 stringByAppendingPathComponent:@"bmlt"];

  return v5;
}

- (id)systemDataFile
{
  BOOL v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  BOOL v4 = [(TRIStandardPaths *)self namespaceDescriptorsDir];
  unsigned int v5 = [v4 stringByAppendingPathComponent:@"system.data"];

  return v5;
}

- (id)deviceIdentifierFile
{
  BOOL v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  BOOL v4 = [(TRIStandardPaths *)self namespaceDescriptorsDir];
  unsigned int v5 = [v4 stringByAppendingPathComponent:@"identifier"];

  return v5;
}

- (id)experimentsDir
{
  BOOL v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  BOOL v4 = [(TRIStandardPaths *)self trialRootDir];
  unsigned int v5 = [v4 stringByAppendingPathComponent:@"Experiments"];

  return v5;
}

- (id)localTempDir
{
  BOOL v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  BOOL v4 = [(TRIStandardPaths *)self _versionSpecificStorageDir];
  unsigned int v5 = [v4 stringByAppendingPathComponent:@"tmp"];

  return v5;
}

- (id)assetStore
{
  return [(TRIStandardPaths *)self assetStoreUsingGlobal:1];
}

- (id)assetStoreUsingGlobal:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = (void *)MEMORY[0x19F3AD060](self, a2);
  id v6 = [(TRIStandardPaths *)self _versionSpecificStorageDirUsingGlobal:v3];
  int v7 = [v6 stringByAppendingPathComponent:@"AssetStore"];

  return v7;
}

- (id)decryptionKeyDirForAppleInternal:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = (void *)MEMORY[0x19F3AD060](self, a2);
  if (v3) {
    unsigned int v5 = @"/AppleInternal/Library/Trial/NamespaceKeys";
  }
  else {
    unsigned int v5 = @"/System/Library/Trial/NamespaceKeys";
  }
  id v6 = +[TRIStandardPaths resolveHardCodedPath:v5];
  return v6;
}

- (id)allowedLowLevelDefaultLevelsDir
{
  v2 = (void *)MEMORY[0x19F3AD060](self, a2);
  BOOL v3 = +[TRIStandardPaths resolveHardCodedPath:@"/System/Library/Trial/AllowedDefaultLevels"];
  return v3;
}

- (id)activeLowLevelFactorsFile
{
  BOOL v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  BOOL v4 = [(TRIStandardPaths *)self namespaceDescriptorsDir];
  unsigned int v5 = [v4 stringByAppendingPathComponent:@"v2/activeLowLevelFactors.plist"];

  return v5;
}

- (id)externalParametersFile
{
  BOOL v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  BOOL v4 = [(TRIStandardPaths *)self namespaceDescriptorsDir];
  unsigned int v5 = [v4 stringByAppendingPathComponent:@"ExternalParameters.plist"];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerPath, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end