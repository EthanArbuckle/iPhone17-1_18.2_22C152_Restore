@interface PRSPosterConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (NSUUID)expectedContainerIdentifier;
+ (id)decodeFromPersistableRepresentation:(id)a3 error:(id *)a4;
+ (id)decodeFromPersistableRepresentation:(id)a3 expectedContainerIdentifier:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPersistable:(id)a3;
- (NSString)description;
- (NSString)role;
- (NSURL)assetDirectory;
- (PFPosterPath)_path;
- (PRSPosterConfiguration)init;
- (PRSPosterConfiguration)initWithBSXPCCoder:(id)a3;
- (PRSPosterConfiguration)initWithCoder:(id)a3;
- (PRSPosterConfiguration)initWithConfigurationAttributes:(id)a3;
- (id)_initWithPath:(id)a3;
- (id)descriptorIdentifier;
- (id)loadUserInfoWithError:(id *)a3;
- (id)persistableRepresentationWithError:(id *)a3;
- (id)providerBundleIdentifier;
- (id)serverUUID;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRSPosterConfiguration

- (PRSPosterConfiguration)init
{
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v4 stringWithFormat:@"%@ is not allowed on %@", v5, v7];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = NSStringFromSelector(a2);
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138544642;
    v14 = v9;
    __int16 v15 = 2114;
    v16 = v11;
    __int16 v17 = 2048;
    v18 = self;
    __int16 v19 = 2114;
    v20 = @"PRSPosterConfiguration.m";
    __int16 v21 = 1024;
    int v22 = 30;
    __int16 v23 = 2114;
    v24 = v8;
    _os_log_error_impl(&dword_1A78AC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
  }
  [v8 UTF8String];
  result = (PRSPosterConfiguration *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_pathValidityExtension invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PRSPosterConfiguration;
  [(PRSPosterConfiguration *)&v3 dealloc];
}

- (PRSPosterConfiguration)initWithConfigurationAttributes:(id)a3
{
  v4 = [a3 path];
  v5 = [(PRSPosterConfiguration *)self _initWithPath:v4];

  return v5;
}

- (id)descriptorIdentifier
{
  v2 = [(PFPosterPath *)self->_path serverIdentity];
  objc_super v3 = [v2 descriptorIdentifier];

  return v3;
}

- (id)_initWithPath:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v17.receiver = self;
    v17.super_class = (Class)PRSPosterConfiguration;
    v8 = [(PRSPosterConfiguration *)&v17 init];
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_path, a3);
      path = v9->_path;
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      uint64_t v13 = [(PFPosterPath *)path extendValidityForReason:v12];
      pathValidityExtension = v9->_pathValidityExtension;
      v9->_pathValidityExtension = (BSInvalidatable *)v13;
    }
    return v9;
  }
  else
  {
    v16 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"path"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      [(PRSPosterConfiguration *)a2 _initWithPath:(uint64_t)v16];
    }
    [v16 UTF8String];
    id result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (NSString)role
{
  return (NSString *)[(PFPosterPath *)self->_path role];
}

- (NSURL)assetDirectory
{
  return (NSURL *)[(PFPosterPath *)self->_path contentsURL];
}

- (id)loadUserInfoWithError:(id *)a3
{
  return (id)[(PFPosterPath *)self->_path loadUserInfoWithError:a3];
}

- (id)serverUUID
{
  v2 = [(PFPosterPath *)self->_path serverIdentity];
  objc_super v3 = [v2 posterUUID];

  return v3;
}

- (id)providerBundleIdentifier
{
  v2 = [(PFPosterPath *)self->_path serverIdentity];
  objc_super v3 = [v2 provider];

  return v3;
}

- (unint64_t)hash
{
  objc_super v3 = [(PFPosterPath *)self->_path serverIdentity];
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 hash];
  }
  else
  {
    id v6 = [(PFPosterPath *)self->_path contentsURL];
    unint64_t v5 = [v6 hash];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PRSPosterConfiguration *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = [(PFPosterPath *)self->_path serverIdentity];
      if (v7)
      {
        v8 = [(PFPosterPath *)v4->_path serverIdentity];
        char v6 = BSEqualObjects();
      }
      else
      {
        char v6 = [(PFPosterPath *)self->_path isEqual:v4->_path];
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  char v6 = [v3 stringWithFormat:@"<%@:%p path=%@>", v5, self, self->_path];

  return (NSString *)v6;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
}

- (PRSPosterConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"p"];

  char v6 = [(PRSPosterConfiguration *)self _initWithPath:v5];
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PRSPosterConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"p"];

  if (v5)
  {
    self = (PRSPosterConfiguration *)[(PRSPosterConfiguration *)self _initWithPath:v5];
    char v6 = self;
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)persistableRepresentationWithError:(id *)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ([(PFPosterPath *)self->_path isServerPosterPath]
    && [(PFPosterPath *)self->_path isPersistable])
  {
    uint64_t v5 = [(PRSPosterConfiguration *)self bs_secureEncoded];
  }
  else
  {
    if (a3)
    {
      char v6 = (void *)MEMORY[0x1E4F28C58];
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      uint64_t v11 = *MEMORY[0x1E4F28588];
      v12[0] = @"configuration is not persistable";
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      *a3 = [v6 errorWithDomain:v8 code:1 userInfo:v9];
    }
    uint64_t v5 = 0;
  }
  return v5;
}

+ (id)decodeFromPersistableRepresentation:(id)a3 expectedContainerIdentifier:(id)a4 error:(id *)a5
{
  v68[3] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v67[0] = @"PRSPosterPath";
  id v8 = a3;
  v68[0] = objc_opt_class();
  v67[1] = @"PRSServerPosterPath";
  v68[1] = objc_opt_class();
  v67[2] = @"PRSServerPosterIdentity";
  v68[2] = objc_opt_class();
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:3];
  v10 = +[PRSPosterConfiguration pf_secureDecodedFromData:v8 classReplacementMap:v9];

  if (v10)
  {
    uint64_t v11 = [v10 _path];
    v12 = [v11 containerURL];
    uint64_t v13 = [v12 standardizedURL];

    v14 = +[PRSBehaviorAggregator dataStoreContainerDirectoryPath];
    __int16 v15 = PRSLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v60 = v13;
      __int16 v61 = 2112;
      v62 = v14;
      __int16 v63 = 2112;
      id v64 = v7;
      _os_log_impl(&dword_1A78AC000, v15, OS_LOG_TYPE_DEFAULT, "[decodeFromPersistableRepresentation] Attempting to fix up path for configuration. Persisted configuration container URL: %@ kContainerDirectory: %@, targetContainerIdentifier: %@>", buf, 0x20u);
    }

    v16 = [v13 path];
    uint64_t v17 = [v16 rangeOfString:v14];
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      __int16 v19 = PRSLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A78AC000, v19, OS_LOG_TYPE_DEFAULT, "[decodeFromPersistableRepresentation] unable to find container uuid; checking if this is a valid file system location...",
          buf,
          2u);
      }

      if ([v13 checkResourceIsReachableAndReturnError:a5])
      {
        id v20 = v10;
      }
      else
      {
        v28 = PRSLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          +[PRSPosterConfiguration decodeFromPersistableRepresentation:expectedContainerIdentifier:error:]((uint64_t)v13, v28, v29, v30, v31, v32, v33, v34);
        }

        id v20 = 0;
      }
    }
    else
    {
      uint64_t v23 = v17;
      uint64_t v24 = v18;
      v25 = [v7 UUIDString];
      if ([v25 length] == 36)
      {
        uint64_t v26 = v23 + v24;
        v27 = objc_msgSend(v16, "substringWithRange:", v23 + v24, 36);
        if ([v27 isEqualToString:v25])
        {
          id v20 = v10;
        }
        else
        {
          v58 = v27;
          v36 = (void *)[v16 mutableCopy];
          objc_msgSend(v36, "replaceCharactersInRange:withString:", v26, 36, v25);
          v37 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v36 isDirectory:1];
          v38 = PRSLogCommon();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v60 = v58;
            __int16 v61 = 2112;
            v62 = v25;
            _os_log_impl(&dword_1A78AC000, v38, OS_LOG_TYPE_DEFAULT, "[decodeFromPersistableRepresentation] Replacing container %@ with %@...", buf, 0x16u);
          }

          if ([v37 checkResourceIsReachableAndReturnError:a5])
          {
            v39 = (void *)MEMORY[0x1E4F924D0];
            v40 = [v10 _path];
            [v40 serverIdentity];
            v41 = v57 = v36;
            v42 = [v39 pathWithContainerURL:v37 identity:v41];

            v36 = v57;
            id v20 = [[PRSPosterConfiguration alloc] _initWithPath:v42];
          }
          else
          {
            v42 = PRSLogCommon();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              +[PRSPosterConfiguration decodeFromPersistableRepresentation:expectedContainerIdentifier:error:]((uint64_t)v37, v42, v50, v51, v52, v53, v54, v55);
            }
            id v20 = 0;
          }

          v27 = v58;
        }
      }
      else
      {
        v35 = PRSLogCommon();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A78AC000, v35, OS_LOG_TYPE_DEFAULT, "[decodeFromPersistableRepresentation] container UUID was wrong length; checking if this configuration's file"
            " system URL is reachable...",
            buf,
            2u);
        }

        if ([v13 checkResourceIsReachableAndReturnError:a5])
        {
          id v20 = v10;
        }
        else
        {
          v43 = PRSLogCommon();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            +[PRSPosterConfiguration decodeFromPersistableRepresentation:expectedContainerIdentifier:error:]((uint64_t)v13, v43, v44, v45, v46, v47, v48, v49);
          }

          id v20 = 0;
        }
      }
    }
  }
  else
  {
    if (!a5)
    {
      id v20 = 0;
      goto LABEL_37;
    }
    __int16 v21 = (void *)MEMORY[0x1E4F28C58];
    int v22 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v22);
    uint64_t v65 = *MEMORY[0x1E4F28588];
    v66 = @"failed to decode configuration from data";
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    [v21 errorWithDomain:v13 code:2 userInfo:v14];
    id v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_37:
  return v20;
}

+ (id)decodeFromPersistableRepresentation:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28B50] mainBundle];
  id v8 = [v7 bundleIdentifier];
  int v9 = [v8 isEqualToString:@"com.apple.springboard"];

  if (v9)
  {
    v10 = [a1 expectedContainerIdentifier];
  }
  else
  {
    v10 = 0;
  }
  uint64_t v11 = [a1 decodeFromPersistableRepresentation:v6 expectedContainerIdentifier:v10 error:a4];

  return v11;
}

+ (NSUUID)expectedContainerIdentifier
{
  if (+[PRSBehaviorAggregator shouldUseSharedDataStore])
  {
    v2 = +[PRSBehaviorAggregator sharedInstance];
    [v2 sharedDirectoryURL];
  }
  else
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.PosterBoard" allowPlaceholder:0 error:0];
    [v2 dataContainerURL];
  objc_super v3 = };

  id v4 = [v3 lastPathComponent];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];

  return (NSUUID *)v5;
}

- (BOOL)isEqualToPersistable:(id)a3
{
  id v4 = a3;
  if (self->_pathValidityExtension)
  {
LABEL_2:
    char v5 = 0;
    goto LABEL_3;
  }
  int v7 = [(PFPosterPath *)self->_path isServerPosterPath];
  char v5 = 0;
  if (v4 && v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && !*((void *)v4 + 1)
      && [*((id *)v4 + 2) isServerPosterPath])
    {
      char v5 = [(PFPosterPath *)self->_path isEqualToPersistable:*((void *)v4 + 2)];
      goto LABEL_3;
    }
    goto LABEL_2;
  }
LABEL_3:

  return v5;
}

- (PFPosterPath)_path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_pathValidityExtension, 0);
}

- (void)_initWithPath:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = NSStringFromSelector(a1);
  char v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_0();
  int v9 = @"PRSPosterConfiguration.m";
  __int16 v10 = 1024;
  int v11 = 54;
  __int16 v12 = v7;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_1A78AC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v8, 0x3Au);
}

+ (void)decodeFromPersistableRepresentation:(uint64_t)a3 expectedContainerIdentifier:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

+ (void)decodeFromPersistableRepresentation:(uint64_t)a3 expectedContainerIdentifier:(uint64_t)a4 error:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)decodeFromPersistableRepresentation:(uint64_t)a3 expectedContainerIdentifier:(uint64_t)a4 error:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end