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
  v3 = +[MSDPlatform sharedInstance];
  unsigned int v4 = [v3 macOS];

  if (v4)
  {
    objc_super v5 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage" stringByStandardizingPath];
    v21[0] = v5;
    v21[1] = @"/Library/Apple";
    v6 = +[NSArray arrayWithObjects:v21 count:2];
    v7 = +[NSSet setWithArray:v6];
    [(WhitelistChecker *)self setBlackListedPaths:v7];

    return 1;
  }
  v8 = +[MSDPlatform sharedInstance];
  if ([v8 iOS])
  {
  }
  else
  {
    v9 = +[MSDPlatform sharedInstance];
    unsigned int v10 = [v9 rOS];

    if (!v10)
    {
      v16 = sub_100042470();
      [(WhitelistChecker *)self setDomains:v16];

      v17 = [(WhitelistChecker *)self domains];

      if (v17) {
        return 1;
      }
      v20 = sub_100068600();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000D4190(v20);
      }

      return 0;
    }
  }
  v11 = [(WhitelistChecker *)self domainsPlistFilePath];
  v12 = +[MSDDomainsPlistPatcher patchDomainsPlist:v11];
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v13 = [v12 objectForKey:@"SystemDomains"];
    v14 = +[NSDictionary dictionaryWithDictionary:v13];
    [(WhitelistChecker *)self setDomains:v14];

    v15 = [(WhitelistChecker *)self domains];

    if (v15)
    {

      return 1;
    }
    v19 = sub_100068600();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000D414C(v19);
    }
  }
  else
  {
    v19 = sub_100068600();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000D40D4((uint64_t)v11, v19);
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
  id v4 = a3;
  objc_super v5 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v4;
  id v25 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (!v25) {
    goto LABEL_20;
  }
  uint64_t v24 = *(void *)v27;
  p_vtable = MSDFileDownloadCredentials.vtable;
  *(void *)&long long v7 = 136315394;
  long long v22 = v7;
  id v23 = v6;
  do
  {
    for (i = 0; i != v25; i = (char *)i + 1)
    {
      if (*(void *)v27 != v24) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
      v11 = [v6 objectForKey:v10, v22];
      v12 = [(WhitelistChecker *)self getRealPathForFile:v10 withMetaData:v11];
      v13 = [p_vtable + 87 sharedInstance];
      unsigned int v14 = [v13 macOS];

      if (v14)
      {
        if ([(WhitelistChecker *)self checkFile_macOS:v12 withMetaData:v11]) {
          goto LABEL_18;
        }
        goto LABEL_15;
      }
      v15 = [p_vtable + 87 sharedInstance];
      if ([v15 iOS])
      {

LABEL_12:
        unsigned __int8 v18 = [(WhitelistChecker *)self checkFile_iOS:v12 withMetaData:v11];
        goto LABEL_14;
      }
      v16 = [p_vtable + 87 sharedInstance];
      unsigned int v17 = [v16 rOS];

      if (v17) {
        goto LABEL_12;
      }
      unsigned __int8 v18 = [(WhitelistChecker *)self checkFile_WatchAndTV:v12 withMetaData:v11];
LABEL_14:
      id v6 = v23;
      p_vtable = (void **)(MSDFileDownloadCredentials + 24);
      if (v18) {
        goto LABEL_18;
      }
LABEL_15:
      v19 = sub_100068600();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v22;
        v31 = "-[WhitelistChecker checkManifest:]";
        __int16 v32 = 2114;
        uint64_t v33 = v10;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s:%{public}@ failed the check.", buf, 0x16u);
      }

      [v5 addObject:v10];
LABEL_18:
    }
    id v25 = [v6 countByEnumeratingWithState:&v26 objects:v34 count:16];
  }
  while (v25);
LABEL_20:

  if ([v5 count]) {
    id v20 = [v5 copy];
  }
  else {
    id v20 = 0;
  }

  return v20;
}

- (BOOL)checkFile_macOS:(id)a3 withMetaData:(id)a4
{
  id v5 = a3;
  id v6 = [(WhitelistChecker *)self blackListedPaths];
  unsigned __int8 v7 = [v6 containsObject:v5];

  return v7 ^ 1;
}

- (BOOL)checkFile_iOS:(id)a3 withMetaData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSArray arrayWithObjects:@"/var/mobile/Media", @"/var/mobile/Library/Backup/SystemContainers/", @"/var/mobile/Library/IdentityServices/Persistence/DoNotBackup", @"/var/root/Library/Backup/SystemContainers/", @"/var/wireless/Library/Preferences/com.apple.awdd.persistent.plist", @"/var/wireless/Library/Preferences/com.apple.awdd.plist", @"/var/MobileSoftwareUpdate/.MAAMigrated.plist", @"/var/MobileAsset/PreinstalledAssetsV2/InstallWithOs", 0];
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
    id v37 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
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
      v11 = 0;
      do
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v11);
        unsigned int v14 = [(WhitelistChecker *)self domains];
        v15 = [v14 objectForKey:v12];

        v16 = [v15 objectForKey:@"RootPath"];
        if (!v16)
        {
          long long v27 = sub_100068600();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v46 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "No root path find in domain %{public}@", buf, 0xCu);
          }
          id v18 = 0;
          char v26 = 0;
          goto LABEL_16;
        }
        v40 = v13;
        unsigned int v17 = [v15 objectForKey:@"RelativePathsToBackupAndRestore"];
        id v18 = [v17 mutableCopy];

        v19 = [v15 objectForKey:@"RelativePathsToOnlyBackupEncrypted"];
        [v18 addObjectsFromArray:v19];

        id v20 = [v15 objectForKey:@"RelativePathsToRestoreOnly"];
        [v18 addObjectsFromArray:v20];

        v21 = [v15 objectForKey:@"RelativePathsToBackupToDriveAndStandardAccount"];
        [v18 addObjectsFromArray:v21];

        uint64_t v22 = [(WhitelistChecker *)self createFullPathList:v18 rootPath:v16 isAllowList:1];

        if (!v22)
        {
          long long v27 = sub_100068600();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v46 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Cannot create allow list for domain %{public}@", buf, 0xCu);
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
            id v25 = sub_100068600();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              id v46 = v6;
              __int16 v47 = 2114;
              v48 = v12;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ is black listed in %{public}@", buf, 0x16u);
            }
            char v39 = 1;
            id v18 = (id)v23;
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
          id v18 = (id)v23;
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
        v11 = (char *)v11 + 1;
        id v6 = v35;
      }
      while (v37 != v11);
      id v29 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
      id v37 = v29;
      if (!v29)
      {
LABEL_33:

        v8 = v31;
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
  v8 = [(WhitelistChecker *)self domains];
  v9 = [v8 objectForKey:@"ContentRootDomain"];
  uint64_t v10 = +[NSMutableArray arrayWithArray:v9];

  v11 = +[NSArray arrayWithObjects:@"/var/mobile/Media", @"/var/containers/", 0];
  [v10 addObject:@"/var/mobile/Library/"];
  if ([(WhitelistChecker *)self file:v6 whitelisted:v11]
    || [(WhitelistChecker *)self annotated:v7])
  {
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = [(WhitelistChecker *)self file:v6 whitelisted:v10];
  }

  return v12;
}

- (BOOL)annotated:(id)a3
{
  id v3 = a3;
  id v4 = +[MSDPlatform sharedInstance];
  if ([v4 iOS])
  {

    CFStringRef v5 = @"MBRestoreAnnotation";
    id v6 = &off_100162DD0;
  }
  else
  {
    id v7 = +[MSDPlatform sharedInstance];
    unsigned int v8 = [v7 rOS];

    if (v8) {
      id v6 = &off_100162DD0;
    }
    else {
      id v6 = &off_100162DE8;
    }
    if (v8) {
      CFStringRef v5 = @"MBRestoreAnnotation";
    }
    else {
      CFStringRef v5 = @"MSDAnnotation";
    }
  }
  v9 = [v3 objectForKey:@"MSDManifestFileExtendedAttributes"];

  BOOL v13 = 0;
  if (v9)
  {
    if ([v9 count])
    {
      uint64_t v10 = [v9 objectForKey:v5];
      id v11 = [objc_alloc((Class)NSString) initWithData:v10 encoding:4];
      unsigned __int8 v12 = [v6 containsObject:v11];

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
  id v6 = a3;
  id v21 = a4;
  id v22 = +[NSMutableArray arrayWithCapacity:0];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        BOOL v13 = [v11 componentsSeparatedByString:@"#"];
        unsigned int v14 = [v13 objectAtIndexedSubscript:0];
        v15 = +[NSCharacterSet whitespaceCharacterSet];
        v16 = [v14 stringByTrimmingCharactersInSet:v15];

        if ([v16 length])
        {
          unsigned int v17 = [v21 stringByAppendingPathComponent:v16];
          [v22 addObject:v17];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
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
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (!objc_msgSend(v5, "rangeOfString:", v11, (void)v14) || !objc_msgSend(v11, "rangeOfString:", v5))
        {
          BOOL v12 = 1;
          goto LABEL_13;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
  id v5 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (!objc_msgSend(v5, "rangeOfString:", v11, (void)v20))
        {
          uint64_t v13 = v12;
          id v14 = [v5 length];
          if (v14 == [v11 length])
          {
            BOOL v16 = 1;
            goto LABEL_14;
          }
          id v15 = [v5 length];
          if (v15 > [v11 length])
          {
            BOOL v16 = 1;
            long long v17 = [v5 substringWithRange:v13];
            unsigned __int8 v18 = [v17 isEqualToString:@"/"];

            if (v18) {
              goto LABEL_14;
            }
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
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
  id v7 = [v6 valueForKey:@"NSFileType"];
  if (([v7 isEqualToString:@"NSFileTypeRegular"] & 1) != 0
    || [v7 isEqualToString:@"NSFileTypeDirectory"])
  {
    id v8 = [v5 stringByStandardizingPath];
    if (([v5 isEqualToString:v8] & 1) == 0)
    {
      uint64_t v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_1000D41D4((uint64_t)v5, (uint64_t)v8, v9);
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
  uint64_t v17 = 0;
  char v16 = 0;
  id v4 = a3;
  [v4 cStringUsingEncoding:4];
  uint64_t v5 = container_create_or_lookup_path_for_current_user();
  id v6 = 0;
  id v7 = 0;
  id v8 = 0;
  uint64_t v9 = 0;
  if (v5) {
    BOOL v10 = v16 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    id v8 = +[NSString stringWithFormat:@"file://%s", v5];
    uint64_t v9 = +[NSURL fileURLWithString:v8];
    id v15 = 0;
    id v14 = 0;
    unsigned int v11 = [v9 getResourceValue:&v15 forKey:NSURLIsExcludedFromBackupKey error:&v14];
    id v6 = v15;
    id v7 = v14;
    if (v11)
    {
      if ([v6 BOOLValue])
      {
        uint64_t v12 = sub_100068600();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          BOOL v19 = "-[WhitelistChecker shouldRestoreSystemContainer_iOS:shared:]";
          __int16 v20 = 2114;
          id v21 = v4;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s:Container check failed for %{public}@. But still restoring.", buf, 0x16u);
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
  id v5 = a3;
  id v6 = a4;
  id v7 = +[MSDPlatform sharedInstance];
  unsigned int v8 = [v7 iOS];

  BOOL v9 = v8 == 0;
  if (v8) {
    BOOL v10 = &off_100162E00;
  }
  else {
    BOOL v10 = &off_100162E30;
  }
  if (v8) {
    unsigned int v11 = &off_100162E18;
  }
  else {
    unsigned int v11 = &off_100162E48;
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
  [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
  id v35 = (id)v12;
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v41;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v10);
        }
        uint64_t v17 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        if ([v5 rangeOfString:v17] != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          unsigned __int8 v18 = v6;
          BOOL v19 = [v5 stringByReplacingOccurrencesOfString:v17 withString:&stru_100155450];
          int v20 = 1;
          goto LABEL_20;
        }
      }
      id v14 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  unsigned __int8 v18 = v6;
  BOOL v19 = 0;
  int v20 = 0;
LABEL_20:
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v21 = [v11 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v37;
    while (2)
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(v11);
        }
        uint64_t v25 = *(void *)(*((void *)&v36 + 1) + 8 * (void)j);
        if ([v5 rangeOfString:v25] != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v28 = [v5 stringByReplacingOccurrencesOfString:v25 withString:&stru_100155450];

          BOOL v26 = 0;
          BOOL v19 = (void *)v28;
          goto LABEL_31;
        }
      }
      id v22 = [v11 countByEnumeratingWithState:&v36 objects:v44 count:16];
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
  id v29 = +[MSDPlatform sharedInstance];
  unsigned int v30 = [v29 iOS];

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
  id v32 = sub_100068600();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    sub_1000D425C((uint64_t)v5, v32);
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

@end