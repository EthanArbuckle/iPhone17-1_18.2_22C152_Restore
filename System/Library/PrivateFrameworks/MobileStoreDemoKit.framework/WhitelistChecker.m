@interface WhitelistChecker
- (BOOL)annotated:(id)a3;
- (BOOL)checkFile_WatchAndTV:(id)a3 withMetaData:(id)a4;
- (BOOL)checkFile_iOS:(id)a3 withMetaData:(id)a4;
- (BOOL)checkFile_macOS:(id)a3 withMetaData:(id)a4;
- (BOOL)file:(id)a3 blacklisted:(id)a4;
- (BOOL)file:(id)a3 whitelisted:(id)a4;
- (BOOL)handleSystemContainerFiles:(id)a3 withMetadata:(id)a4;
- (BOOL)load;
- (BOOL)loadFromFile:(id)a3;
- (BOOL)shouldRestoreSystemContainer_WatchAndTV:(id)a3 shared:(BOOL)a4;
- (BOOL)shouldRestoreSystemContainer_iOS:(id)a3 shared:(BOOL)a4;
- (NSDictionary)domains;
- (NSSet)blackListedPaths;
- (NSString)domainsPlistFilePath;
- (WhitelistChecker)init;
- (id)checkManifest:(id)a3;
- (id)createFullPathList:(id)a3 rootPath:(id)a4 isAllowList:(BOOL)a5;
- (id)getRealPathForFile:(id)a3 withMetaData:(id)a4;
- (void)load;
- (void)setBlackListedPaths:(id)a3;
- (void)setDomains:(id)a3;
- (void)setDomainsPlistFilePath:(id)a3;
@end

@implementation WhitelistChecker

- (WhitelistChecker)init
{
  v5.receiver = self;
  v5.super_class = (Class)WhitelistChecker;
  v2 = [(WhitelistChecker *)&v5 init];
  v3 = v2;
  if (v2) {
    [(WhitelistChecker *)v2 setDomainsPlistFilePath:@"/System/Library/PrivateFrameworks/MobileBackup.framework/Domains.plist"];
  }
  return v3;
}

- (BOOL)load
{
  v23[2] = *MEMORY[0x263EF8340];
  v3 = +[MSDPlatform sharedInstance];
  int v4 = [v3 macOS];

  if (v4)
  {
    objc_super v5 = (void *)MEMORY[0x263EFFA08];
    v6 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByStandardizingPath];
    v23[0] = v6;
    v23[1] = @"/Library/Apple";
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
    v8 = [v5 setWithArray:v7];
    [(WhitelistChecker *)self setBlackListedPaths:v8];

    return 1;
  }
  v9 = +[MSDPlatform sharedInstance];
  if ([v9 iOS])
  {
  }
  else
  {
    v10 = +[MSDPlatform sharedInstance];
    int v11 = [v10 rOS];

    if (!v11)
    {
      v18 = generateCustomDomainsPlistForSecurityRulesCheck();
      [(WhitelistChecker *)self setDomains:v18];

      v19 = [(WhitelistChecker *)self domains];

      if (v19) {
        return 1;
      }
      v22 = defaultLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[WhitelistChecker load](v22);
      }

      return 0;
    }
  }
  v12 = [(WhitelistChecker *)self domainsPlistFilePath];
  v13 = +[MSDDomainsPlistPatcher patchDomainsPlist:v12];
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v14 = NSDictionary;
    v15 = [v13 objectForKey:@"SystemDomains"];
    v16 = [v14 dictionaryWithDictionary:v15];
    [(WhitelistChecker *)self setDomains:v16];

    v17 = [(WhitelistChecker *)self domains];

    if (v17)
    {

      return 1;
    }
    v21 = defaultLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[WhitelistChecker load](v21);
    }
  }
  else
  {
    v21 = defaultLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      [(WhitelistChecker *)(uint64_t)v12 load];
    }
  }

  return 0;
}

- (BOOL)loadFromFile:(id)a3
{
  [(WhitelistChecker *)self setDomainsPlistFilePath:a3];
  return [(WhitelistChecker *)self load];
}

- (id)checkManifest:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v4;
  uint64_t v25 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (!v25) {
    goto LABEL_20;
  }
  uint64_t v24 = *(void *)v27;
  unint64_t v8 = 0x2644FC000uLL;
  *(void *)&long long v7 = 136315394;
  long long v22 = v7;
  id v23 = v6;
  do
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      if (*(void *)v27 != v24) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
      int v11 = objc_msgSend(v6, "objectForKey:", v10, v22);
      v12 = [(WhitelistChecker *)self getRealPathForFile:v10 withMetaData:v11];
      v13 = [*(id *)(v8 + 848) sharedInstance];
      int v14 = [v13 macOS];

      if (v14)
      {
        if ([(WhitelistChecker *)self checkFile_macOS:v12 withMetaData:v11]) {
          goto LABEL_18;
        }
        goto LABEL_15;
      }
      v15 = [*(id *)(v8 + 848) sharedInstance];
      if ([v15 iOS])
      {

LABEL_12:
        BOOL v18 = [(WhitelistChecker *)self checkFile_iOS:v12 withMetaData:v11];
        goto LABEL_14;
      }
      v16 = [*(id *)(v8 + 848) sharedInstance];
      int v17 = [v16 rOS];

      if (v17) {
        goto LABEL_12;
      }
      BOOL v18 = [(WhitelistChecker *)self checkFile_WatchAndTV:v12 withMetaData:v11];
LABEL_14:
      id v6 = v23;
      unint64_t v8 = 0x2644FC000;
      if (v18) {
        goto LABEL_18;
      }
LABEL_15:
      v19 = defaultLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v22;
        v31 = "-[WhitelistChecker checkManifest:]";
        __int16 v32 = 2114;
        uint64_t v33 = v10;
        _os_log_impl(&dword_21EF08000, v19, OS_LOG_TYPE_DEFAULT, "%s:%{public}@ failed the check.", buf, 0x16u);
      }

      [v5 addObject:v10];
LABEL_18:
    }
    uint64_t v25 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
  }
  while (v25);
LABEL_20:

  if ([v5 count]) {
    v20 = (void *)[v5 copy];
  }
  else {
    v20 = 0;
  }

  return v20;
}

- (BOOL)checkFile_macOS:(id)a3 withMetaData:(id)a4
{
  id v5 = a3;
  id v6 = [(WhitelistChecker *)self blackListedPaths];
  char v7 = [v6 containsObject:v5];

  return v7 ^ 1;
}

- (BOOL)checkFile_iOS:(id)a3 withMetaData:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"/var/mobile/Media", @"/var/mobile/Library/Backup/SystemContainers/", @"/var/mobile/Library/IdentityServices/Persistence/DoNotBackup", @"/var/root/Library/Backup/SystemContainers/", @"/var/wireless/Library/Preferences/com.apple.awdd.persistent.plist", @"/var/wireless/Library/Preferences/com.apple.awdd.plist", @"/var/MobileSoftwareUpdate/.MAAMigrated.plist", @"/var/MobileAsset/PreinstalledAssetsV2/InstallWithOs", 0);
  if (![(WhitelistChecker *)self file:v6 whitelisted:v8]
    && ![(WhitelistChecker *)self annotated:v7])
  {
    v31 = v8;
    id v32 = v7;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = [(WhitelistChecker *)self domains];
    uint64_t v37 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (!v37)
    {
      v38 = 0;
      uint64_t v10 = 0;
      char v39 = 0;
      goto LABEL_33;
    }
    char v39 = 0;
    v38 = 0;
    uint64_t v10 = 0;
    uint64_t v36 = *(void *)v42;
    id v35 = v6;
    uint64_t v33 = self;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v41 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x223C3E480]();
        int v14 = [(WhitelistChecker *)self domains];
        v15 = [v14 objectForKey:v12];

        v16 = [v15 objectForKey:@"RootPath"];
        if (!v16)
        {
          long long v27 = defaultLogHandle();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v46 = v12;
            _os_log_error_impl(&dword_21EF08000, v27, OS_LOG_TYPE_ERROR, "No root path find in domain %{public}@", buf, 0xCu);
          }
          BOOL v18 = 0;
          char v26 = 0;
          goto LABEL_16;
        }
        v40 = v13;
        int v17 = [v15 objectForKey:@"RelativePathsToBackupAndRestore"];
        BOOL v18 = (void *)[v17 mutableCopy];

        v19 = [v15 objectForKey:@"RelativePathsToOnlyBackupEncrypted"];
        [v18 addObjectsFromArray:v19];

        v20 = [v15 objectForKey:@"RelativePathsToRestoreOnly"];
        [v18 addObjectsFromArray:v20];

        v21 = [v15 objectForKey:@"RelativePathsToBackupToDriveAndStandardAccount"];
        [v18 addObjectsFromArray:v21];

        uint64_t v22 = [(WhitelistChecker *)self createFullPathList:v18 rootPath:v16 isAllowList:1];

        if (!v22)
        {
          long long v27 = defaultLogHandle();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v46 = v12;
            _os_log_error_impl(&dword_21EF08000, v27, OS_LOG_TYPE_ERROR, "Cannot create allow list for domain %{public}@", buf, 0xCu);
          }
          char v26 = 0;
          uint64_t v10 = 0;
          v13 = v40;
          goto LABEL_16;
        }
        if ([(WhitelistChecker *)self file:v6 whitelisted:v22])
        {
          uint64_t v23 = [v15 objectForKey:@"RelativePathsNotToRestore"];

          uint64_t v24 = [(WhitelistChecker *)self createFullPathList:v23 rootPath:v16 isAllowList:0];

          if ([(WhitelistChecker *)self file:v6 blacklisted:v24])
          {
            uint64_t v25 = defaultLogHandle();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              id v46 = v6;
              __int16 v47 = 2114;
              v48 = v12;
              _os_log_impl(&dword_21EF08000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ is black listed in %{public}@", buf, 0x16u);
            }
            char v39 = 1;
            BOOL v18 = (void *)v23;
            char v26 = 1;
            v38 = (void *)v24;
            uint64_t v10 = (void *)v22;
            v13 = v40;
            long long v27 = v25;
            self = v33;
LABEL_16:

            int v28 = 0;
            goto LABEL_20;
          }
          int v28 = 0;
          char v39 = 1;
          BOOL v18 = (void *)v23;
          char v26 = 1;
          v38 = (void *)v24;
        }
        else
        {
          int v28 = 1;
          char v26 = v39;
        }
        uint64_t v10 = (void *)v22;
        v13 = v40;
LABEL_20:

        if (!v28)
        {
          char v39 = v26;
          id v6 = v35;
          goto LABEL_33;
        }
        ++v11;
        id v6 = v35;
      }
      while (v37 != v11);
      uint64_t v29 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
      uint64_t v37 = v29;
      if (!v29)
      {
LABEL_33:

        unint64_t v8 = v31;
        id v7 = v32;
        v9 = v38;
        goto LABEL_34;
      }
    }
  }
  v9 = 0;
  uint64_t v10 = 0;
  char v39 = 1;
LABEL_34:

  return v39 & 1;
}

- (BOOL)checkFile_WatchAndTV:(id)a3 withMetaData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (void *)MEMORY[0x263EFF980];
  v9 = [(WhitelistChecker *)self domains];
  uint64_t v10 = [v9 objectForKey:@"ContentRootDomain"];
  uint64_t v11 = [v8 arrayWithArray:v10];

  v12 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"/var/mobile/Media", @"/var/containers/", 0);
  [v11 addObject:@"/var/mobile/Library/"];
  BOOL v13 = [(WhitelistChecker *)self file:v6 whitelisted:v12]
     || [(WhitelistChecker *)self annotated:v7]
     || [(WhitelistChecker *)self file:v6 whitelisted:v11];

  return v13;
}

- (BOOL)annotated:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDPlatform sharedInstance];
  if ([v4 iOS])
  {

    id v5 = @"MBRestoreAnnotation";
    id v6 = &unk_26D0920B8;
  }
  else
  {
    id v7 = +[MSDPlatform sharedInstance];
    int v8 = [v7 rOS];

    if (v8) {
      id v6 = &unk_26D0920B8;
    }
    else {
      id v6 = &unk_26D0920D0;
    }
    if (v8) {
      id v5 = @"MBRestoreAnnotation";
    }
    else {
      id v5 = @"MSDAnnotation";
    }
  }
  v9 = [v3 objectForKey:@"MSDManifestFileExtendedAttributes"];

  BOOL v13 = 0;
  if (v9)
  {
    if ([v9 count])
    {
      uint64_t v10 = [v9 objectForKey:v5];
      uint64_t v11 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
      char v12 = [v6 containsObject:v11];

      if (v12) {
        BOOL v13 = 1;
      }
    }
  }

  return v13;
}

- (id)createFullPathList:(id)a3 rootPath:(id)a4 isAllowList:(BOOL)a5
{
  BOOL v19 = a5;
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v21 = a4;
  id v22 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        char v12 = (void *)MEMORY[0x223C3E480]();
        BOOL v13 = [v11 componentsSeparatedByString:@"#"];
        int v14 = [v13 objectAtIndexedSubscript:0];
        v15 = [MEMORY[0x263F08708] whitespaceCharacterSet];
        v16 = [v14 stringByTrimmingCharactersInSet:v15];

        if ([v16 length])
        {
          int v17 = [v21 stringByAppendingPathComponent:v16];
          [v22 addObject:v17];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  if (v19 && ![v22 count]) {
    [v22 addObject:v21];
  }

  return v22;
}

- (BOOL)file:(id)a3 whitelisted:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (!objc_msgSend(v5, "rangeOfString:", v11, (void)v14) || !objc_msgSend(v11, "rangeOfString:", v5))
        {
          BOOL v12 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      BOOL v12 = 0;
      if (v8) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_13:

  return v12;
}

- (BOOL)file:(id)a3 blacklisted:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (!objc_msgSend(v5, "rangeOfString:", v11, (void)v20))
        {
          uint64_t v13 = v12;
          uint64_t v14 = [v5 length];
          if (v14 == [v11 length])
          {
            BOOL v16 = 1;
            goto LABEL_14;
          }
          unint64_t v15 = [v5 length];
          if (v15 > [v11 length])
          {
            BOOL v16 = 1;
            long long v17 = objc_msgSend(v5, "substringWithRange:", v13, 1);
            char v18 = [v17 isEqualToString:@"/"];

            if (v18) {
              goto LABEL_14;
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_14:

  return v16;
}

- (id)getRealPathForFile:(id)a3 withMetaData:(id)a4
{
  id v5 = a3;
  id v6 = [a4 valueForKey:@"MSDManifestFileAttributes"];
  uint64_t v7 = [v6 valueForKey:@"NSFileType"];
  if (([v7 isEqualToString:@"NSFileTypeRegular"] & 1) != 0
    || [v7 isEqualToString:@"NSFileTypeDirectory"])
  {
    id v8 = [v5 stringByStandardizingPath];
    if (([v5 isEqualToString:v8] & 1) == 0)
    {
      uint64_t v9 = defaultLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[WhitelistChecker getRealPathForFile:withMetaData:]((uint64_t)v5, (uint64_t)v8, v9);
      }
    }
  }
  else
  {
    id v8 = v5;
  }

  return v8;
}

- (BOOL)shouldRestoreSystemContainer_iOS:(id)a3 shared:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v18 = 0;
  char v17 = 0;
  id v4 = a3;
  [v4 cStringUsingEncoding:4];
  uint64_t v5 = container_create_or_lookup_path_for_current_user();
  id v6 = 0;
  id v7 = 0;
  id v8 = 0;
  uint64_t v9 = 0;
  if (v5) {
    BOOL v10 = v17 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    id v8 = objc_msgSend(NSString, "stringWithFormat:", @"file://%s", v5);
    uint64_t v9 = [NSURL fileURLWithString:v8];
    id v16 = 0;
    uint64_t v11 = *MEMORY[0x263EFF6B0];
    id v15 = 0;
    int v12 = [v9 getResourceValue:&v16 forKey:v11 error:&v15];
    id v6 = v16;
    id v7 = v15;
    if (v12)
    {
      if ([v6 BOOLValue])
      {
        uint64_t v13 = defaultLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          long long v20 = "-[WhitelistChecker shouldRestoreSystemContainer_iOS:shared:]";
          __int16 v21 = 2114;
          id v22 = v4;
          _os_log_impl(&dword_21EF08000, v13, OS_LOG_TYPE_DEFAULT, "%s:Container check failed for %{public}@. But still restoring.", buf, 0x16u);
        }
      }
    }
  }

  return 1;
}

- (BOOL)shouldRestoreSystemContainer_WatchAndTV:(id)a3 shared:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(WhitelistChecker *)self domains];
  id v7 = [v6 objectForKey:@"SystemContainerDomain"];

  LOBYTE(v6) = [v7 containsObject:v5];
  return (char)v6;
}

- (BOOL)handleSystemContainerFiles:(id)a3 withMetadata:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[MSDPlatform sharedInstance];
  int v8 = [v7 iOS];

  BOOL v9 = v8 == 0;
  if (v8) {
    BOOL v10 = &unk_26D0920E8;
  }
  else {
    BOOL v10 = &unk_26D092118;
  }
  if (v8) {
    uint64_t v11 = &unk_26D092100;
  }
  else {
    uint64_t v11 = &unk_26D092130;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  if (v9) {
    uint64_t v12 = 6;
  }
  else {
    uint64_t v12 = 8;
  }
  uint64_t v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v45, 16, self);
  uint64_t v35 = v12;
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        if ([v5 rangeOfString:v17] != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v18 = v6;
          uint64_t v19 = [v5 stringByReplacingOccurrencesOfString:v17 withString:&stru_26D08A1B8];
          int v20 = 1;
          goto LABEL_20;
        }
      }
      uint64_t v14 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  uint64_t v18 = v6;
  uint64_t v19 = 0;
  int v20 = 0;
LABEL_20:
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v21 = [v11 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v37;
    while (2)
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(v11);
        }
        uint64_t v25 = *(void *)(*((void *)&v36 + 1) + 8 * j);
        if ([v5 rangeOfString:v25] != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v28 = [v5 stringByReplacingOccurrencesOfString:v25 withString:&stru_26D08A1B8];

          BOOL v26 = 0;
          uint64_t v19 = (void *)v28;
          goto LABEL_31;
        }
      }
      uint64_t v22 = [v11 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }
  BOOL v26 = 1;
  if (!v20)
  {
    long long v27 = 0;
    goto LABEL_36;
  }
LABEL_31:
  long long v27 = [v5 componentsSeparatedByString:@"/"];
  if ([v27 count] != v35 || (objc_msgSend(v34, "annotated:", v18) & 1) != 0)
  {
LABEL_35:
    LOBYTE(v26) = 1;
    goto LABEL_36;
  }
  uint64_t v29 = +[MSDPlatform sharedInstance];
  int v30 = [v29 iOS];

  if (v30)
  {
    if (objc_msgSend(v34, "shouldRestoreSystemContainer_iOS:shared:", v19, v26)) {
      goto LABEL_35;
    }
  }
  else if (objc_msgSend(v34, "shouldRestoreSystemContainer_WatchAndTV:shared:", v19, v26))
  {
    goto LABEL_35;
  }
  id v32 = defaultLogHandle();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    -[WhitelistChecker handleSystemContainerFiles:withMetadata:]((uint64_t)v5, v32);
  }

  LOBYTE(v26) = 0;
LABEL_36:

  return v26;
}

- (NSSet)blackListedPaths
{
  return self->_blackListedPaths;
}

- (void)setBlackListedPaths:(id)a3
{
}

- (NSDictionary)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
}

- (NSString)domainsPlistFilePath
{
  return self->_domainsPlistFilePath;
}

- (void)setDomainsPlistFilePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainsPlistFilePath, 0);
  objc_storeStrong((id *)&self->_domains, 0);
  objc_storeStrong((id *)&self->_blackListedPaths, 0);
}

- (void)load
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21EF08000, log, OS_LOG_TYPE_ERROR, "Cannot generate custom domains.", v1, 2u);
}

- (void)getRealPathForFile:(os_log_t)log withMetaData:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_21EF08000, log, OS_LOG_TYPE_DEBUG, "Manifest file path %{public}@ is not same as real path: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)handleSystemContainerFiles:(uint64_t)a1 withMetadata:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  int v3 = "-[WhitelistChecker handleSystemContainerFiles:withMetadata:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_21EF08000, a2, OS_LOG_TYPE_ERROR, "%s:Container check failed for %{public}@", (uint8_t *)&v2, 0x16u);
}

@end