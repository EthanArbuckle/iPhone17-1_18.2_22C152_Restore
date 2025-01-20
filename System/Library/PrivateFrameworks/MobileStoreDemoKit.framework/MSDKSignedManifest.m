@interface MSDKSignedManifest
+ (id)signedManifestAtPath:(id)a3;
+ (id)signedManifestAtPath:(id)a3 verifyManifest:(BOOL)a4;
- (BOOL)_addDependenciesForComponent:(id)a3 withLookupDict:(id)a4;
- (BOOL)_buildAppDepedencies;
- (BOOL)_checkManifestVersion;
- (BOOL)_parseInstallationOrder:(id)a3;
- (BOOL)_parseLocale;
- (BOOL)_parseManifestInfo:(id)a3;
- (NSArray)allFiles;
- (NSArray)appDataList;
- (NSArray)backupDataList;
- (NSArray)configurationProfiles;
- (NSArray)criticalComponents;
- (NSArray)extensionDataList;
- (NSArray)factoryBackupList;
- (NSArray)groupDataList;
- (NSArray)installationOrder;
- (NSArray)nonSystemAppList;
- (NSArray)products;
- (NSArray)provisioningProfiles;
- (NSArray)systemAppList;
- (NSArray)userDataList;
- (NSDate)dateCreated;
- (NSDate)validUntil;
- (NSNumber)networkTier;
- (NSNumber)revision;
- (NSString)bundleID;
- (NSString)bundleName;
- (NSString)contentCode;
- (NSString)filePath;
- (NSString)language;
- (NSString)languageCode;
- (NSString)localeCode;
- (NSString)minimumOSVersion;
- (NSString)partNumber;
- (NSString)regionCode;
- (id)_componentListForSection:(id)a3 fromPayload:(id)a4;
- (id)_manifestDataFromFile:(id)a3;
- (id)_parseAllFiles;
- (id)_parseFactoryBackupList;
- (id)_toComponentDictionary:(id)a3;
- (id)description;
- (id)initFromManifestAtPath:(id)a3 verifyManifest:(BOOL)a4;
- (int)version;
- (void)_parseLocale;
- (void)setCriticalComponents:(id)a3;
- (void)setFilePath:(id)a3;
- (void)setInstallationOrder:(id)a3;
@end

@implementation MSDKSignedManifest

+ (id)signedManifestAtPath:(id)a3
{
  return +[MSDKSignedManifest signedManifestAtPath:a3 verifyManifest:1];
}

+ (id)signedManifestAtPath:(id)a3 verifyManifest:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [[MSDKSignedManifest alloc] initFromManifestAtPath:v5 verifyManifest:v4];

  return v6;
}

- (id)initFromManifestAtPath:(id)a3 verifyManifest:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)MSDKSignedManifest;
  v7 = [(MSDKSignedManifest *)&v47 init];
  if (!v7) {
    goto LABEL_35;
  }
  v8 = defaultLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v49 = v6;
    _os_log_impl(&dword_21EF08000, v8, OS_LOG_TYPE_DEFAULT, "Reading manifest at path %{public}@...", buf, 0xCu);
  }

  [(MSDKSignedManifest *)v7 setFilePath:v6];
  uint64_t v9 = [(MSDKSignedManifest *)v7 _manifestDataFromFile:v6];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = defaultLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EF08000, v11, OS_LOG_TYPE_DEFAULT, "Checking manifest version...", buf, 2u);
    }

    v12 = [v10 objectForKey:@"Version" ofType:objc_opt_class()];
    v13 = v12;
    if (v12)
    {
      v7->_version = [v12 intValue];
      if ([(MSDKSignedManifest *)v7 _checkManifestVersion])
      {
        v14 = defaultLogHandle();
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if (!v4)
        {
          if (v15)
          {
            *(_DWORD *)buf = 138543362;
            id v49 = v6;
            _os_log_impl(&dword_21EF08000, v14, OS_LOG_TYPE_DEFAULT, "Skipping verification for manifest at path %{public}@", buf, 0xCu);
          }
          v17 = 0;
          v19 = v10;
          goto LABEL_19;
        }
        if (v15)
        {
          *(_DWORD *)buf = 138543362;
          id v49 = v6;
          _os_log_impl(&dword_21EF08000, v14, OS_LOG_TYPE_DEFAULT, "Verifying manifest at path %{public}@...", buf, 0xCu);
        }

        uint64_t v16 = +[MSDDemoManifestCheck sharedInstance];
        if (v16)
        {
          v17 = (void *)v16;
          v18 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D092148];
          v19 = [v17 verifyFactoryManifestSignature:v10 forDataSectionKeys:v18];

          if (v19)
          {
            v14 = defaultLogHandle();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v49 = v6;
              _os_log_impl(&dword_21EF08000, v14, OS_LOG_TYPE_DEFAULT, "Manifest at path %{public}@ verified", buf, 0xCu);
            }
LABEL_19:

            if ([(MSDKSignedManifest *)v7 _parseManifestInfo:v19])
            {
              if ([(MSDKSignedManifest *)v7 _parseInstallationOrder:v19])
              {
                uint64_t v20 = [(MSDKSignedManifest *)v7 _componentListForSection:@"Apps" fromPayload:v19];
                nonSystemAppList = v7->_nonSystemAppList;
                v7->_nonSystemAppList = (NSArray *)v20;

                if (v7->_nonSystemAppList)
                {
                  uint64_t v22 = [(MSDKSignedManifest *)v7 _componentListForSection:@"SystemApps" fromPayload:v19];
                  systemAppList = v7->_systemAppList;
                  v7->_systemAppList = (NSArray *)v22;

                  if (v7->_systemAppList)
                  {
                    uint64_t v24 = [(MSDKSignedManifest *)v7 _componentListForSection:@"BackupData" fromPayload:v19];
                    backupDataList = v7->_backupDataList;
                    v7->_backupDataList = (NSArray *)v24;

                    if (v7->_backupDataList)
                    {
                      uint64_t v26 = [(MSDKSignedManifest *)v7 _componentListForSection:@"UserData" fromPayload:v19];
                      userDataList = v7->_userDataList;
                      v7->_userDataList = (NSArray *)v26;

                      if (v7->_userDataList)
                      {
                        uint64_t v28 = [(MSDKSignedManifest *)v7 _componentListForSection:@"AppData" fromPayload:v19];
                        appDataList = v7->_appDataList;
                        v7->_appDataList = (NSArray *)v28;

                        if (v7->_appDataList)
                        {
                          uint64_t v30 = [(MSDKSignedManifest *)v7 _componentListForSection:@"GroupData" fromPayload:v19];
                          groupDataList = v7->_groupDataList;
                          v7->_groupDataList = (NSArray *)v30;

                          if (v7->_groupDataList)
                          {
                            uint64_t v32 = [(MSDKSignedManifest *)v7 _componentListForSection:@"ExtensionData" fromPayload:v19];
                            extensionDataList = v7->_extensionDataList;
                            v7->_extensionDataList = (NSArray *)v32;

                            if (v7->_extensionDataList)
                            {
                              uint64_t v34 = [(MSDKSignedManifest *)v7 _componentListForSection:@"ProvisioningProfiles" fromPayload:v19];
                              provisioningProfiles = v7->_provisioningProfiles;
                              v7->_provisioningProfiles = (NSArray *)v34;

                              if (v7->_provisioningProfiles)
                              {
                                uint64_t v36 = [(MSDKSignedManifest *)v7 _componentListForSection:@"ConfigurationProfiles" fromPayload:v19];
                                configurationProfiles = v7->_configurationProfiles;
                                v7->_configurationProfiles = (NSArray *)v36;

                                if (v7->_configurationProfiles)
                                {
                                  uint64_t v38 = [(MSDKSignedManifest *)v7 _parseFactoryBackupList];
                                  factoryBackupList = v7->_factoryBackupList;
                                  v7->_factoryBackupList = (NSArray *)v38;

                                  if (v38)
                                  {
                                    uint64_t v40 = [(MSDKSignedManifest *)v7 _parseAllFiles];
                                    allFiles = v7->_allFiles;
                                    v7->_allFiles = (NSArray *)v40;

                                    if (v40)
                                    {
                                      if ([(MSDKSignedManifest *)v7 _parseLocale]
                                        && [(MSDKSignedManifest *)v7 _buildAppDepedencies])
                                      {

LABEL_35:
                                        v42 = defaultLogHandle();
                                        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                                        {
                                          *(_DWORD *)buf = 138543362;
                                          id v49 = v6;
                                          _os_log_impl(&dword_21EF08000, v42, OS_LOG_TYPE_DEFAULT, "Successfully parsed manifest at path %{public}@", buf, 0xCu);
                                        }

                                        v43 = v7;
                                        goto LABEL_38;
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
            v10 = v19;
            goto LABEL_40;
          }
          v10 = 0;
LABEL_40:

          goto LABEL_41;
        }
        v46 = defaultLogHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          -[MSDKSignedManifest initFromManifestAtPath:verifyManifest:](v46);
        }
      }
    }
    v17 = 0;
    goto LABEL_40;
  }
LABEL_41:
  v45 = defaultLogHandle();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
    -[MSDKSignedManifest initFromManifestAtPath:verifyManifest:]((uint64_t)v6, v45);
  }

  v43 = 0;
LABEL_38:

  return v43;
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: Name:%@>", v5, self->_bundleName];

  return v6;
}

- (id)_manifestDataFromFile:(id)a3
{
  id v3 = a3;
  BOOL v4 = [MEMORY[0x263F08850] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF950] inputStreamWithFileAtPath:v3];
    if (v6)
    {
      v7 = (void *)v6;
      v8 = [MEMORY[0x263EFF9F0] currentRunLoop];
      uint64_t v9 = *MEMORY[0x263EFF478];
      [v7 scheduleInRunLoop:v8 forMode:*MEMORY[0x263EFF478]];

      [v7 open];
      id v15 = 0;
      v10 = [MEMORY[0x263F08AC0] propertyListWithStream:v7 options:2 format:0 error:&v15];
      v11 = v15;
      [v7 close];
      v12 = [MEMORY[0x263EFF9F0] currentRunLoop];
      [v7 removeFromRunLoop:v12 forMode:v9];

      if (v10)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_5;
        }
        v14 = defaultLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[MSDKSignedManifest _manifestDataFromFile:]();
        }
      }
      else
      {
        v10 = defaultLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[MSDKSignedManifest _manifestDataFromFile:]();
        }
      }
    }
    else
    {
      v11 = defaultLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[MSDKSignedManifest _manifestDataFromFile:]();
      }
    }
  }
  else
  {
    v11 = defaultLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MSDKSignedManifest _manifestDataFromFile:].cold.4();
    }
  }
  v10 = 0;
LABEL_5:

  return v10;
}

- (BOOL)_checkManifestVersion
{
  return self->_version == 7;
}

- (BOOL)_parseManifestInfo:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = defaultLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = @"Info";
    _os_log_impl(&dword_21EF08000, v5, OS_LOG_TYPE_DEFAULT, "Parsing %{public}@ section...", buf, 0xCu);
  }

  uint64_t v6 = [v4 objectForKey:@"Info" ofType:objc_opt_class()];

  if (!v6) {
    goto LABEL_17;
  }
  v7 = [v6 objectForKey:@"Product" ofType:objc_opt_class()];
  products = self->_products;
  self->_products = v7;

  uint64_t v9 = [v6 objectForKey:@"ContentCode" ofType:objc_opt_class()];
  contentCode = self->_contentCode;
  self->_contentCode = v9;

  v11 = [v6 objectForKey:@"BundleName" ofType:objc_opt_class()];
  bundleName = self->_bundleName;
  self->_bundleName = v11;

  v13 = [v6 objectForKey:@"CreateTime" ofType:objc_opt_class()];
  dateCreated = self->_dateCreated;
  self->_dateCreated = v13;

  id v15 = [v6 objectForKey:@"Language" ofType:objc_opt_class()];
  language = self->_language;
  self->_language = v15;

  v17 = [v6 objectForKey:@"MinimumOSVersion" ofType:objc_opt_class()];
  minimumOSVersion = self->_minimumOSVersion;
  self->_minimumOSVersion = v17;

  v19 = [v6 objectForKey:@"NetworkTier" ofType:objc_opt_class()];
  networkTier = self->_networkTier;
  self->_networkTier = v19;

  v21 = [v6 objectForKey:@"PartNumber" ofType:objc_opt_class()];
  partNumber = self->_partNumber;
  self->_partNumber = v21;

  v23 = [v6 objectForKey:@"Revision" ofType:objc_opt_class()];
  revision = self->_revision;
  self->_revision = v23;

  v25 = [v6 objectForKey:@"ValidUntil" ofType:objc_opt_class()];
  validUntil = self->_validUntil;
  self->_validUntil = v25;

  v27 = [NSString stringWithFormat:@"%@_%d", self->_partNumber, -[NSNumber intValue](self->_revision, "intValue")];
  bundleID = self->_bundleID;
  self->_bundleID = v27;

  if (!self->_products) {
    goto LABEL_17;
  }
  if (self->_contentCode
    && self->_bundleName
    && self->_dateCreated
    && self->_language
    && self->_minimumOSVersion
    && self->_networkTier
    && self->_partNumber
    && self->_revision
    && self->_validUntil
    && self->_bundleID)
  {
    BOOL v29 = 1;
  }
  else
  {
LABEL_17:
    BOOL v29 = 0;
  }

  return v29;
}

- (BOOL)_parseInstallationOrder:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = defaultLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    v14 = @"InstallationOrder";
    _os_log_impl(&dword_21EF08000, v5, OS_LOG_TYPE_DEFAULT, "Parsing %{public}@...", (uint8_t *)&v13, 0xCu);
  }

  [(MSDKSignedManifest *)self setCriticalComponents:MEMORY[0x263EFFA68]];
  uint64_t v6 = objc_opt_new();
  v7 = [v4 objectForKey:@"InstallationOrder"];

  if (!v7)
  {
    v12 = defaultLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MSDKSignedManifest _parseInstallationOrder:](v12);
    }
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = defaultLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MSDKSignedManifest _parseInstallationOrder:]();
      }
LABEL_23:

      BOOL v10 = 0;
      goto LABEL_18;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v7 objectForKey:@"CriticalComponents"];
    uint64_t v9 = [v7 objectForKey:@"Components"];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 addObjectsFromArray:v8];
        [(MSDKSignedManifest *)self setCriticalComponents:v8];
      }
    }
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v6 addObjectsFromArray:v9];
      }
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = v6;
    uint64_t v6 = (void *)[v7 mutableCopy];
LABEL_16:
  }
  [(MSDKSignedManifest *)self setInstallationOrder:v6];
  BOOL v10 = 1;
LABEL_18:

  return v10;
}

- (id)_parseFactoryBackupList
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D092160];
  id v4 = objc_opt_new();
  char v5 = objc_opt_new();
  [v5 addObjectsFromArray:self->_backupDataList];
  [v5 addObjectsFromArray:self->_userDataList];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v19;
    *(void *)&long long v8 = 138543362;
    long long v17 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        int v13 = objc_msgSend(v12, "identifier", v17, (void)v18);
        int v14 = [v3 containsObject:v13];

        if (v14)
        {
          uint64_t v15 = defaultLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v23 = v12;
            _os_log_impl(&dword_21EF08000, v15, OS_LOG_TYPE_DEFAULT, "Removing %{public}@ from factory backup list", buf, 0xCu);
          }

          [v4 addObject:v12];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v9);
  }

  [v6 removeObjectsInArray:v4];
  return v6;
}

- (BOOL)_parseLocale
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v3 = self->_backupDataList;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v26 != v6) {
        objc_enumerationMutation(v3);
      }
      long long v8 = *(void **)(*((void *)&v25 + 1) + 8 * v7);
      uint64_t v9 = [v8 identifier];
      int v10 = [v9 isEqualToString:@"locale"];

      if (v10) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_15;
      }
    }
    v11 = [v8 data];
    v12 = [v11 firstObject];

    if (v12)
    {
      int v13 = [v12 data];

      if (v13)
      {
        int v14 = [v12 data];
        uint64_t v15 = [v14 objectForKey:@"language"];
        languageCode = self->_languageCode;
        self->_languageCode = v15;

        if (self->_languageCode)
        {
          long long v17 = [v12 data];
          long long v18 = [v17 objectForKey:@"region"];
          regionCode = self->_regionCode;
          self->_regionCode = v18;

          long long v20 = self->_regionCode;
          if (v20)
          {
            long long v21 = [NSString stringWithFormat:@"%@_%@", self->_languageCode, v20, (void)v25];
            localeCode = self->_localeCode;
            self->_localeCode = v21;

            goto LABEL_15;
          }
          uint64_t v24 = defaultLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[MSDKSignedManifest _parseLocale].cold.5(v24);
          }
        }
        else
        {
          uint64_t v24 = defaultLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[MSDKSignedManifest _parseLocale].cold.4(v24);
          }
        }
      }
      else
      {
        uint64_t v24 = defaultLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[MSDKSignedManifest _parseLocale]();
        }
      }
    }
    else
    {
      uint64_t v24 = defaultLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[MSDKSignedManifest _parseLocale]();
      }
    }
  }
  else
  {
LABEL_15:

    if (self->_localeCode) {
      return 1;
    }
    defaultLogHandle();
    id v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v3->super, OS_LOG_TYPE_ERROR)) {
      -[MSDKSignedManifest _parseLocale]();
    }
  }

  return 0;
}

- (id)_componentListForSection:(id)a3 fromPayload:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = defaultLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v33 = v5;
    _os_log_impl(&dword_21EF08000, v7, OS_LOG_TYPE_DEFAULT, "Parsing %{public}@ section...", buf, 0xCu);
  }

  long long v8 = objc_opt_new();
  uint64_t v9 = [v6 objectForKey:v5 ofType:objc_opt_class()];
  if (!v9)
  {
    id v22 = 0;
    goto LABEL_23;
  }
  uint64_t v10 = [&unk_26D0923A0 objectForKey:v5];
  if (!v10)
  {
    v11 = defaultLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MSDKSignedManifest _componentListForSection:fromPayload:]();
    }
LABEL_21:
    id v22 = 0;
    goto LABEL_22;
  }
  v11 = v10;
  id v25 = v6;
  id v26 = v5;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v13) {
    goto LABEL_14;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v28;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v28 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
      uint64_t v18 = [v12 objectForKey:v17 ofType:objc_opt_class()];
      if (!v18)
      {
        long long v19 = defaultLogHandle();
        id v5 = v26;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[MSDKSignedManifest _componentListForSection:fromPayload:]();
        }
        goto LABEL_20;
      }
      long long v19 = v18;
      long long v20 = [[MSDKManifestComponent alloc] initWithIdentifier:v17 componentType:(int)[v11 intValue] andDictionary:v18];
      if (!v20)
      {
        v23 = defaultLogHandle();
        id v5 = v26;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[MSDKSignedManifest _componentListForSection:fromPayload:]();
        }

LABEL_20:
        id v6 = v25;

        goto LABEL_21;
      }
      long long v21 = v20;
      [v8 addObject:v20];
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v14) {
      continue;
    }
    break;
  }
LABEL_14:

  id v22 = v8;
  id v6 = v25;
  id v5 = v26;
LABEL_22:

LABEL_23:
  return v22;
}

- (id)_parseAllFiles
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  factoryBackupList = self->_factoryBackupList;
  appDataList = self->_appDataList;
  v42[0] = self->_nonSystemAppList;
  v42[1] = appDataList;
  groupDataList = self->_groupDataList;
  v42[2] = factoryBackupList;
  v42[3] = groupDataList;
  long long v43 = *(_OWORD *)&self->_extensionDataList;
  configurationProfiles = self->_configurationProfiles;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v42 count:7];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v36;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v36 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v7;
        long long v8 = *(void **)(*((void *)&v35 + 1) + 8 * v7);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v24 = v8;
        uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v26)
        {
          uint64_t v25 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v32 != v25) {
                objc_enumerationMutation(v24);
              }
              uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              long long v27 = 0u;
              long long v28 = 0u;
              long long v29 = 0u;
              long long v30 = 0u;
              v11 = [v10 data];
              uint64_t v12 = [v11 countByEnumeratingWithState:&v27 objects:v39 count:16];
              if (v12)
              {
                uint64_t v13 = v12;
                uint64_t v14 = *(void *)v28;
                do
                {
                  for (uint64_t j = 0; j != v13; ++j)
                  {
                    if (*(void *)v28 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * j);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        continue;
                      }
                    }
                    uint64_t v17 = [v16 fileHash];

                    if (v17) {
                      [v3 addObject:v16];
                    }
                  }
                  uint64_t v13 = [v11 countByEnumeratingWithState:&v27 objects:v39 count:16];
                }
                while (v13);
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v31 objects:v40 count:16];
          }
          while (v26);
        }

        uint64_t v7 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v22);
  }

  uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return v18;
}

- (BOOL)_buildAppDepedencies
{
  v30[9] = *MEMORY[0x263EF8340];
  id v3 = defaultLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21EF08000, v3, OS_LOG_TYPE_DEFAULT, "Building app component dependencies...", buf, 2u);
  }

  v29[0] = @"Apps";
  uint64_t v22 = [(MSDKSignedManifest *)self _toComponentDictionary:self->_nonSystemAppList];
  v30[0] = v22;
  v29[1] = @"SystemApps";
  uint64_t v4 = [(MSDKSignedManifest *)self _toComponentDictionary:self->_systemAppList];
  v30[1] = v4;
  v29[2] = @"AppData";
  id v5 = [(MSDKSignedManifest *)self _toComponentDictionary:self->_appDataList];
  v30[2] = v5;
  v29[3] = @"BackupData";
  id v6 = [(MSDKSignedManifest *)self _toComponentDictionary:self->_backupDataList];
  v30[3] = v6;
  v29[4] = @"UserData";
  uint64_t v7 = [(MSDKSignedManifest *)self _toComponentDictionary:self->_userDataList];
  v30[4] = v7;
  v29[5] = @"GroupData";
  long long v8 = [(MSDKSignedManifest *)self _toComponentDictionary:self->_groupDataList];
  v30[5] = v8;
  v29[6] = @"ExtensionData";
  uint64_t v9 = [(MSDKSignedManifest *)self _toComponentDictionary:self->_extensionDataList];
  v30[6] = v9;
  v29[7] = @"ProvisioningProfiles";
  uint64_t v10 = [(MSDKSignedManifest *)self _toComponentDictionary:self->_provisioningProfiles];
  v30[7] = v10;
  v29[8] = @"ConfigurationProfiles";
  v11 = [(MSDKSignedManifest *)self _toComponentDictionary:self->_configurationProfiles];
  v30[8] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:9];

  uint64_t v13 = objc_opt_new();
  [v13 addObjectsFromArray:self->_nonSystemAppList];
  [v13 addObjectsFromArray:self->_systemAppList];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v20 = [v19 getRawDependency];

        if (v20) {
          [(MSDKSignedManifest *)self _addDependenciesForComponent:v19 withLookupDict:v12];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v16);
  }

  return 1;
}

- (id)_toComponentDictionary:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "identifier", (void)v13);
        [v4 setObject:v10 forKey:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_addDependenciesForComponent:(id)a3 withLookupDict:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v27 = a4;
  [v5 getRawDependency];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [v6 countByEnumeratingWithState:&v32 objects:v43 count:16];
  if (!v24)
  {
    BOOL v19 = 1;
    goto LABEL_24;
  }
  long long v25 = v6;
  uint64_t v26 = *(void *)v33;
  while (2)
  {
    for (uint64_t i = 0; i != v24; ++i)
    {
      if (*(void *)v33 != v26) {
        objc_enumerationMutation(v6);
      }
      uint64_t v8 = *(void *)(*((void *)&v32 + 1) + 8 * i);
      uint64_t v9 = [v27 objectForKey:v8];
      if (!v9)
      {
        uint64_t v21 = defaultLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[MSDKSignedManifest _addDependenciesForComponent:withLookupDict:]();
        }
LABEL_29:
        v11 = v9;
LABEL_22:

        BOOL v19 = 0;
        goto LABEL_24;
      }
      uint64_t v10 = [v6 objectForKey:v8 ofType:objc_opt_class()];
      if (!v10)
      {
        uint64_t v21 = defaultLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[MSDKSignedManifest _addDependenciesForComponent:withLookupDict:]();
        }
        goto LABEL_29;
      }
      uint64_t v23 = v8;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v42 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v29;
        while (2)
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * j);
            uint64_t v17 = [v9 objectForKey:v16 ofType:objc_opt_class()];
            if (!v17)
            {
              long long v20 = defaultLogHandle();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                long long v37 = "-[MSDKSignedManifest _addDependenciesForComponent:withLookupDict:]";
                __int16 v38 = 2114;
                uint64_t v39 = v16;
                __int16 v40 = 2114;
                uint64_t v41 = v23;
                _os_log_error_impl(&dword_21EF08000, v20, OS_LOG_TYPE_ERROR, "%s: Failed to lookup component with identifier %{public}@ in section %{public}@", buf, 0x20u);
              }

              uint64_t v21 = v9;
              id v6 = v25;
              goto LABEL_22;
            }
            uint64_t v18 = (void *)v17;
            [v5 addDependency:v17];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v42 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      id v6 = v25;
    }
    BOOL v19 = 1;
    uint64_t v24 = [v25 countByEnumeratingWithState:&v32 objects:v43 count:16];
    if (v24) {
      continue;
    }
    break;
  }
LABEL_24:

  return v19;
}

- (NSString)bundleName
{
  return self->_bundleName;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)regionCode
{
  return self->_regionCode;
}

- (NSString)localeCode
{
  return self->_localeCode;
}

- (NSString)contentCode
{
  return self->_contentCode;
}

- (int)version
{
  return self->_version;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSDate)validUntil
{
  return self->_validUntil;
}

- (NSString)minimumOSVersion
{
  return self->_minimumOSVersion;
}

- (NSString)language
{
  return self->_language;
}

- (NSNumber)networkTier
{
  return self->_networkTier;
}

- (NSString)partNumber
{
  return self->_partNumber;
}

- (NSNumber)revision
{
  return self->_revision;
}

- (NSArray)products
{
  return self->_products;
}

- (NSArray)nonSystemAppList
{
  return self->_nonSystemAppList;
}

- (NSArray)systemAppList
{
  return self->_systemAppList;
}

- (NSArray)backupDataList
{
  return self->_backupDataList;
}

- (NSArray)userDataList
{
  return self->_userDataList;
}

- (NSArray)factoryBackupList
{
  return self->_factoryBackupList;
}

- (NSArray)appDataList
{
  return self->_appDataList;
}

- (NSArray)groupDataList
{
  return self->_groupDataList;
}

- (NSArray)extensionDataList
{
  return self->_extensionDataList;
}

- (NSArray)provisioningProfiles
{
  return self->_provisioningProfiles;
}

- (NSArray)configurationProfiles
{
  return self->_configurationProfiles;
}

- (NSArray)allFiles
{
  return self->_allFiles;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (NSArray)criticalComponents
{
  return self->_criticalComponents;
}

- (void)setCriticalComponents:(id)a3
{
}

- (NSArray)installationOrder
{
  return self->_installationOrder;
}

- (void)setInstallationOrder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installationOrder, 0);
  objc_storeStrong((id *)&self->_criticalComponents, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_allFiles, 0);
  objc_storeStrong((id *)&self->_configurationProfiles, 0);
  objc_storeStrong((id *)&self->_provisioningProfiles, 0);
  objc_storeStrong((id *)&self->_extensionDataList, 0);
  objc_storeStrong((id *)&self->_groupDataList, 0);
  objc_storeStrong((id *)&self->_appDataList, 0);
  objc_storeStrong((id *)&self->_factoryBackupList, 0);
  objc_storeStrong((id *)&self->_userDataList, 0);
  objc_storeStrong((id *)&self->_backupDataList, 0);
  objc_storeStrong((id *)&self->_systemAppList, 0);
  objc_storeStrong((id *)&self->_nonSystemAppList, 0);
  objc_storeStrong((id *)&self->_products, 0);
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_partNumber, 0);
  objc_storeStrong((id *)&self->_networkTier, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_minimumOSVersion, 0);
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_contentCode, 0);
  objc_storeStrong((id *)&self->_localeCode, 0);
  objc_storeStrong((id *)&self->_regionCode, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
}

- (void)initFromManifestAtPath:(uint64_t)a1 verifyManifest:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21EF08000, a2, OS_LOG_TYPE_ERROR, "Failed to parse manifest at path %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)initFromManifestAtPath:(os_log_t)log verifyManifest:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "Could not initialize manifestVerifier", v1, 2u);
}

- (void)_manifestDataFromFile:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: Failed to read manifest file: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_manifestDataFromFile:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: Failed to convert manifest file to property list. Error: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_manifestDataFromFile:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: Manifest file at path %{public}@ is not of format NSDictionary", v2, v3, v4, v5, 2u);
}

- (void)_manifestDataFromFile:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: Manifest file does not exist: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_parseInstallationOrder:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  uint64_t v2 = @"InstallationOrder";
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "Manifest does not contain %{public}@ key", (uint8_t *)&v1, 0xCu);
}

- (void)_parseInstallationOrder:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: %{public}@ section in wrong format.", v2, v3, v4, v5, 2u);
}

- (void)_parseLocale
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v1 = 136315650;
  uint64_t v2 = "-[MSDKSignedManifest _parseLocale]";
  __int16 v3 = 2114;
  uint64_t v4 = @"locale";
  __int16 v5 = 2114;
  id v6 = @"region";
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "%s: component %{public}@ does not have %{public}@ key", (uint8_t *)&v1, 0x20u);
}

- (void)_componentListForSection:fromPayload:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: cannot determine component type for section %{public}@", v2, v3, v4, v5, 2u);
}

- (void)_componentListForSection:fromPayload:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21EF08000, v0, v1, "%s: component %{public}@ in section %{public}@ is of wrong format", v2);
}

- (void)_componentListForSection:fromPayload:.cold.3()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21EF08000, v0, v1, "%s: failed to parse component %{public}@ in section %{public}@", v2);
}

- (void)_addDependenciesForComponent:withLookupDict:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21EF08000, v0, v1, "%s: Section %{public}@ not found in section to component dictionary", v2, v3, v4, v5, 2u);
}

- (void)_addDependenciesForComponent:withLookupDict:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_21EF08000, v0, v1, "%s: Failed to parse %{public}@ dependency list for component %{public}@", v2);
}

@end