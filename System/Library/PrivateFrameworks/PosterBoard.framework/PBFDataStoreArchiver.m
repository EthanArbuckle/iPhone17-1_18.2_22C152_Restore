@interface PBFDataStoreArchiver
+ (BOOL)archiveDataStoreAtURL:(id)a3 toURL:(id)a4 options:(id)a5 error:(id *)a6;
+ (id)fileManager;
- (BOOL)archiveToFileAtURL:(id)a3 error:(id *)a4;
- (NSURL)dataStoreURL;
- (PBFDataStoreArchiver)initWithDataStoreAtURL:(id)a3;
- (PRSDataStoreArchiveConfiguration)options;
- (void)setOptions:(id)a3;
@end

@implementation PBFDataStoreArchiver

+ (id)fileManager
{
  if (fileManager_onceToken != -1) {
    dispatch_once(&fileManager_onceToken, &__block_literal_global_33);
  }
  v2 = (void *)fileManager_fileManager;
  return v2;
}

void __35__PBFDataStoreArchiver_fileManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)fileManager_fileManager;
  fileManager_fileManager = v0;
}

+ (BOOL)archiveDataStoreAtURL:(id)a3 toURL:(id)a4 options:(id)a5 error:(id *)a6
{
  v59[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v10;
  NSClassFromString(&cfstr_Nsurl.isa);
  if (!v13)
  {
    v44 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFDataStoreArchiver archiveDataStoreAtURL:toURL:options:error:]();
    }
    [v44 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D328D298);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v45 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSURLClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFDataStoreArchiver archiveDataStoreAtURL:toURL:options:error:]();
    }
    [v45 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D328D2FCLL);
  }

  id v14 = v11;
  NSClassFromString(&cfstr_Nsurl.isa);
  if (!v14)
  {
    v46 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFDataStoreArchiver archiveDataStoreAtURL:toURL:options:error:]();
    }
    [v46 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D328D360);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v47 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSURLClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[PBFDataStoreArchiver archiveDataStoreAtURL:toURL:options:error:]();
    }
    [v47 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D328D3C4);
  }

  if ([v13 checkResourceIsReachableAndReturnError:a6])
  {
    id v51 = 0;
    int v15 = [v13 getResourceValue:&v51 forKey:*MEMORY[0x1E4F1C628] error:a6];
    id v16 = v51;
    v17 = v16;
    if (v15 && ([v16 BOOLValue] & 1) == 0)
    {
      v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *MEMORY[0x1E4F289B0];
      v58[0] = *MEMORY[0x1E4F28588];
      v58[1] = v32;
      v59[0] = @"Data Store URLs are directories.";
      v59[1] = v13;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
      objc_msgSend(v31, "pbf_generalErrorWithCode:userInfo:", 1, v18);
      BOOL v28 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

      goto LABEL_26;
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v19 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [v18 setLocale:v19];

    v20 = [v13 lastPathComponent];
    v21 = [v18 numberFromString:v20];
    unint64_t v22 = [v21 unsignedIntegerValue];

    if (v22 <= 0x3A)
    {
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F289B0];
      v56[0] = *MEMORY[0x1E4F28588];
      v56[1] = v24;
      v57[0] = @"Data Store URLs are only valid from 59+";
      v57[1] = v13;
      v25 = (void *)MEMORY[0x1E4F1C9E8];
      v26 = v57;
      v27 = v56;
LABEL_13:
      v30 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:2];
      objc_msgSend(v23, "pbf_generalErrorWithCode:userInfo:", 1, v30);
      BOOL v28 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

      goto LABEL_25;
    }
    if ([v14 checkResourceIsReachableAndReturnError:0])
    {
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F289B0];
      v54[0] = *MEMORY[0x1E4F28588];
      v54[1] = v29;
      v55[0] = @"URL already exists. No going to overwrite.";
      v55[1] = v14;
      v25 = (void *)MEMORY[0x1E4F1C9E8];
      v26 = v55;
      v27 = v54;
      goto LABEL_13;
    }
    id v48 = v12;
    v50 = v17;
    v30 = [a1 fileManager];
    v33 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_temporaryDirectoryURL");
    v34 = [MEMORY[0x1E4F29128] UUID];
    v35 = [v34 UUIDString];
    uint64_t v36 = [v33 URLByAppendingPathComponent:v35];

    v49 = (void *)v36;
    v37 = objc_msgSend(MEMORY[0x1E4F1CB10], "pbf_dataStoreURLForBaseURL:version:", v36, v22);
    v38 = [v37 URLByDeletingLastPathComponent];
    LODWORD(v34) = [v30 createDirectoryAtURL:v38 withIntermediateDirectories:1 attributes:0 error:a6];

    if (v34)
    {
      v17 = v50;
      id v12 = v48;
      if ([v30 copyItemAtURL:v13 toURL:v37 error:a6]
        && +[PBFDataStoreArchivalUtilities transformDataStoreAtURL:v37 options:v48 error:a6])
      {
        if (PBFAppleArchiveCompressDirectory(v37, v14))
        {
          BOOL v28 = 1;
LABEL_23:

          goto LABEL_24;
        }
        v39 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v40 = *MEMORY[0x1E4F289B0];
        v52[0] = *MEMORY[0x1E4F28588];
        v52[1] = v40;
        v53[0] = @"Failed to archive!";
        v53[1] = v14;
        v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
        v42 = v39;
        v17 = v50;
        objc_msgSend(v42, "pbf_generalErrorWithCode:userInfo:", 1, v41);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      BOOL v28 = 0;
      goto LABEL_23;
    }
    BOOL v28 = 0;
    v17 = v50;
    id v12 = v48;
    goto LABEL_23;
  }
  BOOL v28 = 0;
LABEL_26:

  return v28;
}

- (PBFDataStoreArchiver)initWithDataStoreAtURL:(id)a3
{
  id v4 = a3;
  if ([v4 checkResourceIsReachableAndReturnError:0])
  {
    v12.receiver = self;
    v12.super_class = (Class)PBFDataStoreArchiver;
    v5 = [(PBFDataStoreArchiver *)&v12 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      dataStoreURL = v5->_dataStoreURL;
      v5->_dataStoreURL = (NSURL *)v6;

      uint64_t v8 = objc_opt_new();
      options = v5->_options;
      v5->_options = (PRSDataStoreArchiveConfiguration *)v8;
    }
    return v5;
  }
  else
  {
    id v11 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[dataStoreURL checkResourceIsReachableAndReturnError:nil]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[PBFDataStoreArchiver initWithDataStoreAtURL:]();
    }
    [v11 UTF8String];
    result = (PBFDataStoreArchiver *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)archiveToFileAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_class();
  dataStoreURL = self->_dataStoreURL;
  v9 = [(PBFDataStoreArchiver *)self options];
  LOBYTE(a4) = [v7 archiveDataStoreAtURL:dataStoreURL toURL:v6 options:v9 error:a4];

  return (char)a4;
}

- (NSURL)dataStoreURL
{
  return self->_dataStoreURL;
}

- (PRSDataStoreArchiveConfiguration)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_dataStoreURL, 0);
}

+ (void)archiveDataStoreAtURL:toURL:options:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

+ (void)archiveDataStoreAtURL:toURL:options:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDataStoreAtURL:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1D31CE000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end