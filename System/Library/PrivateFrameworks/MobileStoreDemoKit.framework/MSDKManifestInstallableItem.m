@interface MSDKManifestInstallableItem
- (BOOL)isContainerized;
- (BOOL)isSystemApp;
- (MSDKManifestInstallableItem)initWithIdentifier:(id)a3 andDictionary:(id)a4 forComponent:(id)a5;
- (NSData)fileHash;
- (NSDictionary)privacyPermissions;
- (NSNumber)appType;
- (NSNumber)realSize;
- (NSNumber)size;
- (NSString)bundleFilePath;
- (NSString)bundleShortVersionString;
- (NSString)identifier;
- (NSString)osVersion;
- (NSString)platformType;
- (NSString)uniqueID;
- (id)description;
@end

@implementation MSDKManifestInstallableItem

- (MSDKManifestInstallableItem)initWithIdentifier:(id)a3 andDictionary:(id)a4 forComponent:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v43.receiver = self;
  v43.super_class = (Class)MSDKManifestInstallableItem;
  v11 = [(MSDKManifestItem *)&v43 initWithIdentifier:v9 andDictionary:v10 forComponent:a5];
  v12 = v11;
  if (!v11) {
    goto LABEL_16;
  }
  objc_storeStrong((id *)&v11->_identifier, a3);
  uint64_t v13 = [v10 objectForKey:@"AppType" ofType:objc_opt_class()];
  appType = v12->_appType;
  v12->_appType = (NSNumber *)v13;

  if (!v12->_appType)
  {
    v16 = defaultLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:]();
    }
    goto LABEL_39;
  }
  v15 = [v10 objectForKey:@"IsContainerized" ofType:objc_opt_class()];
  if (!v15)
  {
    v16 = defaultLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:]();
    }
    goto LABEL_39;
  }
  v16 = v15;
  v12->_isContainerized = [v15 BOOLValue];
  uint64_t v17 = [v10 objectForKey:@"OSVersion" ofType:objc_opt_class()];
  osVersion = v12->_osVersion;
  v12->_osVersion = (NSString *)v17;

  if (!v12->_osVersion)
  {
    v42 = defaultLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:]();
    }
    goto LABEL_38;
  }
  uint64_t v19 = [v10 objectForKey:@"PlatformType" ofType:objc_opt_class()];
  platformType = v12->_platformType;
  v12->_platformType = (NSString *)v19;

  if (!v12->_platformType)
  {
    v42 = defaultLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:].cold.4();
    }
LABEL_38:

LABEL_39:
    v40 = 0;
    goto LABEL_17;
  }
  if (![(MSDKManifestInstallableItem *)v12 isSystemApp])
  {
    uint64_t v27 = [v10 objectForKey:@"Identifier" ofType:objc_opt_class()];
    uniqueID = v12->_uniqueID;
    v12->_uniqueID = (NSString *)v27;

    if (v12->_uniqueID)
    {
      uint64_t v29 = [v10 objectForKey:@"CFBundleShortVersionString" ofType:objc_opt_class()];
      bundleShortVersionString = v12->_bundleShortVersionString;
      v12->_bundleShortVersionString = (NSString *)v29;

      if (v12->_bundleShortVersionString)
      {
        uint64_t v31 = [v10 objectForKey:@"RealSize" ofType:objc_opt_class()];
        realSize = v12->_realSize;
        v12->_realSize = (NSNumber *)v31;

        if (v12->_realSize)
        {
          uint64_t v33 = [v10 objectForKey:@"Size" ofType:objc_opt_class()];
          size = v12->_size;
          v12->_size = (NSNumber *)v33;

          if (v12->_size)
          {
            uint64_t v35 = [v10 objectForKey:@"AppPrivacyPermissions" ofType:objc_opt_class()];
            privacyPermissions = v12->_privacyPermissions;
            v12->_privacyPermissions = (NSDictionary *)v35;

            if (v12->_privacyPermissions)
            {
              uint64_t v37 = [v10 objectForKey:@"Hash" ofType:objc_opt_class()];
              fileHash = v12->_fileHash;
              v12->_fileHash = (NSData *)v37;

              if (v12->_fileHash)
              {
                uint64_t v39 = +[MSDKCacheManager getBundleFilePathFromHash:](MSDKCacheManager, "getBundleFilePathFromHash:");
                bundleFilePath = v12->_bundleFilePath;
                v12->_bundleFilePath = (NSString *)v39;
                goto LABEL_15;
              }
              v42 = defaultLogHandle();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
                -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:]0();
              }
            }
            else
            {
              v42 = defaultLogHandle();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
                -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:].cold.9();
              }
            }
          }
          else
          {
            v42 = defaultLogHandle();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
              -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:].cold.8();
            }
          }
        }
        else
        {
          v42 = defaultLogHandle();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
            -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:].cold.7();
          }
        }
      }
      else
      {
        v42 = defaultLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:].cold.6();
        }
      }
    }
    else
    {
      v42 = defaultLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[MSDKManifestInstallableItem initWithIdentifier:andDictionary:forComponent:].cold.5();
      }
    }
    goto LABEL_38;
  }
  v21 = v12->_uniqueID;
  v12->_uniqueID = 0;

  v22 = v12->_bundleShortVersionString;
  v12->_bundleShortVersionString = 0;

  v23 = v12->_realSize;
  v12->_realSize = 0;

  v24 = v12->_size;
  v12->_size = 0;

  v25 = v12->_privacyPermissions;
  v12->_privacyPermissions = 0;

  bundleFilePath = v12->_bundleFilePath;
  v12->_bundleFilePath = 0;
LABEL_15:

LABEL_16:
  v40 = v12;
LABEL_17:

  return v40;
}

- (BOOL)isSystemApp
{
  v2 = [(MSDKManifestItem *)self component];
  char v3 = [v2 isOfType:0];

  return v3;
}

- (id)description
{
  char v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: ID:%@>", v5, self->_identifier];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSNumber)appType
{
  return self->_appType;
}

- (BOOL)isContainerized
{
  return self->_isContainerized;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)platformType
{
  return self->_platformType;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)bundleShortVersionString
{
  return self->_bundleShortVersionString;
}

- (NSNumber)realSize
{
  return self->_realSize;
}

- (NSNumber)size
{
  return self->_size;
}

- (NSDictionary)privacyPermissions
{
  return self->_privacyPermissions;
}

- (NSString)bundleFilePath
{
  return self->_bundleFilePath;
}

- (NSData)fileHash
{
  return self->_fileHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHash, 0);
  objc_storeStrong((id *)&self->_bundleFilePath, 0);
  objc_storeStrong((id *)&self->_privacyPermissions, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_realSize, 0);
  objc_storeStrong((id *)&self->_bundleShortVersionString, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_platformType, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_appType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21EF08000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21EF08000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21EF08000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21EF08000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21EF08000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21EF08000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21EF08000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21EF08000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.9()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21EF08000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithIdentifier:andDictionary:forComponent:.cold.10()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_21EF08000, v0, v1, "%s: Failed to parse %{public}@ from app item %{public}@", v2, v3, v4, v5, 2u);
}

@end