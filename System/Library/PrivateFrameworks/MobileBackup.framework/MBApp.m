@interface MBApp
+ (BOOL)_unzipPlaceholderDomainZipFile:(id)a3 intoDirectory:(id)a4 error:(id *)a5;
+ (BOOL)unzipPlaceholderDomainZipFile:(id)a3 intoDirectory:(id)a4 error:(id *)a5;
+ (id)appWithBundleID:(id)a3;
+ (id)appWithPropertyList:(id)a3;
+ (id)safeHarborWithPath:(id)a3;
+ (void)_addContainer:(id)a3 toArray:(id)a4 visited:(id)a5;
- (BOOL)isAppUpdating;
- (BOOL)isPlaceholder;
- (BOOL)isSystemApp;
- (NSArray)containers;
- (NSArray)groups;
- (NSArray)plugins;
- (NSArray)uniqueContainers;
- (NSDictionary)entitlements;
- (NSString)bundleDir;
- (NSString)bundleVersion;
- (NSString)entitlementsRelativePath;
- (id)_placeholderDomainRootedInDirectory:(id)a3;
- (id)_placeholderRelativePathsToBackupAndRestoreWithCache:(id)a3;
- (id)_resourceRelativePathsToBackupAndRestoreForRootDir:(id)a3 relativePath:(id)a4;
- (id)_visitContainerDependenciesAndFilterDuplicates:(BOOL)a3;
- (id)archivePlaceholderDomainWithPersonaIdentifier:(id)a3 intoDirectory:(id)a4 error:(id *)a5;
- (id)domain;
- (id)placeholderDomainWithCache:(id)a3 error:(id *)a4;
- (void)setBundleDir:(id)a3;
@end

@implementation MBApp

- (id)_placeholderRelativePathsToBackupAndRestoreWithCache:(id)a3
{
  id v5 = a3;
  v6 = +[NSMutableSet set];
  v45 = self;
  v7 = [(MBApp *)self bundleDir];
  v8 = [v7 stringByStandardizingPath];

  if (!v8)
  {
    v34 = +[NSAssertionHandler currentHandler];
    v35 = [(MBApp *)self bundleID];
    [v34 handleFailureInMethod:a2, self, @"MBApp+Archiving.m", 38, @"No bundle path set for app: %@", v35 object file lineNumber description];
  }
  v9 = [v8 stringByDeletingLastPathComponent];
  v10 = [v8 lastPathComponent];
  [v6 addObject:@"iTunesMetadata.plist"];
  v11 = [v10 stringByAppendingPathComponent:@"Info.plist"];
  [v6 addObject:v11];

  [v6 addObject:@"NewsstandArtwork"];
  memset(&v50, 0, sizeof(v50));
  id v12 = v8;
  if (stat((const char *)[v12 fileSystemRepresentation], &v50))
  {
    v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = *__error();
      *(_DWORD *)buf = 138543618;
      id v52 = v12;
      __int16 v53 = 1024;
      LODWORD(v54) = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "stat failed at %{public}@: %{errno}d", buf, 0x12u);
      __error();
      _MBLog();
    }
  }
  else
  {
    __darwin_time_t tv_sec = v50.st_mtimespec.tv_sec;
    v16 = [(MBApp *)v45 bundleID];
    v13 = [v5 relativePathsOfPlaceholderResourcesWithBundleID:v16 lastModified:tv_sec];

    if (![v13 count])
    {
      v38 = v13;
      __darwin_time_t v39 = tv_sec;
      id v40 = v12;
      v42 = v5;
      v43 = v6;
      v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = [(MBApp *)v45 bundleID];
        *(_DWORD *)buf = 138412290;
        id v52 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Caching resource paths: %@", buf, 0xCu);

        v36 = [(MBApp *)v45 bundleID];
        _MBLog();
      }
      v41 = v10;
      v13 = [(MBApp *)v45 _resourceRelativePathsToBackupAndRestoreForRootDir:v9 relativePath:v10];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id obj = [(MBApp *)v45 plugins];
      id v19 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v47;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v47 != v21) {
              objc_enumerationMutation(obj);
            }
            v23 = objc_msgSend(*(id *)(*((void *)&v46 + 1) + 8 * i), "bundleDir", v36);
            v24 = [v23 stringByStandardizingPath];

            v25 = objc_msgSend(v24, "substringFromIndex:", (char *)objc_msgSend(v9, "length") + 1);
            v26 = [(MBApp *)v45 _resourceRelativePathsToBackupAndRestoreForRootDir:v9 relativePath:v25];
            v27 = [v25 stringByAppendingPathComponent:@"Info.plist"];
            [v26 addObject:v27];

            [v13 unionSet:v26];
          }
          id v20 = [obj countByEnumeratingWithState:&v46 objects:v55 count:16];
        }
        while (v20);
      }

      v28 = [(MBApp *)v45 bundleID];
      id v5 = v42;
      [v42 setPlaceholderResourceRelativePaths:v13 lastModified:v39 forBundleID:v28];

      v6 = v43;
      id v12 = v40;
      v10 = v41;
    }
    objc_msgSend(v6, "unionSet:", v13, v36);
  }

  v29 = MBGetDefaultLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    v30 = [(MBApp *)v45 bundleID];
    v31 = MBStringWithSet();
    *(_DWORD *)buf = 138412546;
    id v52 = v30;
    __int16 v53 = 2112;
    v54 = v31;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%@ placeholder relative paths to backup and restore: %@", buf, 0x16u);

    v32 = [(MBApp *)v45 bundleID];
    v37 = MBStringWithSet();
    _MBLog();
  }
  return v6;
}

- (id)placeholderDomainWithCache:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MBApp *)self bundleDir];
  v8 = [v7 stringByDeletingLastPathComponent];

  id v19 = 0;
  v9 = +[MBFileSystemManager volumeMountPointForFile:v8 error:&v19];
  id v10 = v19;
  v11 = v10;
  if (v9)
  {
    id v12 = [(MBApp *)self bundleID];
    v13 = +[MBDomain appPlaceholderDomainWithIdentifier:v12 volumeMountPoint:v9 rootPath:v8];

    int v14 = [(MBApp *)self _placeholderRelativePathsToBackupAndRestoreWithCache:v6];
    [v13 setRelativePathsToBackupAndRestore:v14];

    [v13 setShouldDigest:0];
  }
  else
  {
    if (a4) {
      *a4 = v10;
    }
    v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [(MBApp *)self bundleID];
      *(_DWORD *)buf = 138412802;
      uint64_t v21 = v8;
      __int16 v22 = 2112;
      v23 = v16;
      __int16 v24 = 2112;
      v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to fetch volume mount point for %@ (%@) when creating legacy placeholder %@", buf, 0x20u);

      v18 = [(MBApp *)self bundleID];
      _MBLog();
    }
    v13 = 0;
  }

  return v13;
}

- (id)_resourceRelativePathsToBackupAndRestoreForRootDir:(id)a3 relativePath:(id)a4
{
  id v5 = a3;
  id v53 = a4;
  uint64_t v6 = objc_msgSend(v5, "stringByAppendingPathComponent:");
  id v55 = +[NSMutableSet set];
  v8 = +[NSFileManager defaultManager];
  id v64 = 0;
  v54 = (void *)v6;
  v9 = [v8 contentsOfDirectoryAtPath:v6 error:&v64];
  id v10 = v64;

  if (v9)
  {
    long long v49 = v9;
    id v51 = v10;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v12)
    {
      id v13 = v12;
      v45 = v7;
      int v14 = v5;
      uint64_t v15 = *(void *)v61;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v61 != v15) {
            objc_enumerationMutation(v11);
          }
          v17 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          if ([v17 hasSuffix:@".lproj"])
          {
            v18 = [v53 stringByAppendingPathComponent:v17];
            id v19 = [v18 stringByAppendingPathComponent:@"InfoPlist.strings"];

            id v20 = [v14 stringByAppendingPathComponent:v19];
            uint64_t v21 = +[NSFileManager defaultManager];
            unsigned int v22 = [v21 fileExistsAtPath:v20];

            if (v22) {
              [v55 addObject:v19];
            }
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v60 objects:v70 count:16];
      }
      while (v13);
      id v5 = v14;
      v7 = v45;
      v9 = v49;
      id v10 = v51;
    }
  }
  else
  {
    v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v23 = +[MBError descriptionForError:v10];
      *(_DWORD *)buf = 138412546;
      v67 = v54;
      __int16 v68 = 2112;
      v69 = v23;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Getting contents of bundle directory failed: %@: %@", buf, 0x16u);

      +[MBError descriptionForError:v10];
      v43 = v42 = v54;
      _MBLog();
    }
  }

  CFURLRef v24 = +[NSURL fileURLWithPath:v54];
  CFBundleRef v25 = CFBundleCreate(0, v24);

  if (v25)
  {
    v26 = LICopyIconPathsFromBundle();
    v27 = v26;
    if (v26)
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      v44 = v26;
      v28 = v26;
      id v29 = [v28 countByEnumeratingWithState:&v56 objects:v65 count:16];
      if (v29)
      {
        id v30 = v29;
        stat v50 = v9;
        id v52 = v10;
        long long v46 = v7;
        uint64_t v31 = *(void *)v57;
        do
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            if (*(void *)v57 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v56 + 1) + 8 * (void)j);
            if ((objc_msgSend(v33, "isFileURL", v42, v43) & 1) == 0)
            {
              v38 = +[NSAssertionHandler currentHandler];
              v42 = v33;
              [v38 handleFailureInMethod:a2 object:self file:@"MBApp+Archiving.m" lineNumber:128 description:@"Not a file URL: %@"];
            }
            v34 = [v33 path];
            v35 = [v34 stringByResolvingSymlinksInPath];
            v36 = [v35 stringByStandardizingPath];

            if (([v36 hasPrefix:v54] & 1) == 0)
            {
              __darwin_time_t v39 = +[NSAssertionHandler currentHandler];
              v42 = v36;
              [v39 handleFailureInMethod:a2 object:self file:@"MBApp+Archiving.m" lineNumber:131 description:@"Icon path not relative to bundle path: %@"];
            }
            v37 = objc_msgSend(v36, "substringFromIndex:", (char *)objc_msgSend(v5, "length") + 1);
            if ((MBIsValidRelativePathIgnoreTilde() & 1) == 0)
            {
              id v40 = +[NSAssertionHandler currentHandler];
              v42 = v37;
              [v40 handleFailureInMethod:a2 object:self file:@"MBApp+Archiving.m" lineNumber:134 description:@"Invalid icon relative path: %@"];
            }
            [v55 addObject:v37];
          }
          id v30 = [v28 countByEnumeratingWithState:&v56 objects:v65 count:16];
        }
        while (v30);
        v7 = v46;
        v9 = v50;
        id v10 = v52;
      }
      v27 = v44;
    }
    else
    {
      v28 = MBGetDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v54;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "No icon URLs returned for bundle: %@", buf, 0xCu);
        _MBLog();
      }
    }

    _CFBundleFlushBundleCaches();
    CFRelease(v25);
  }
  else
  {
    v27 = MBGetDefaultLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v54;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Opening bundle failed: %@", buf, 0xCu);
      _MBLog();
    }
  }

  return v55;
}

+ (BOOL)unzipPlaceholderDomainZipFile:(id)a3 intoDirectory:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!a5) {
    __assert_rtn("+[MBApp(Archiving) unzipPlaceholderDomainZipFile:intoDirectory:error:]", "MBApp+Archiving.m", 158, "outError");
  }
  id v10 = v9;
  v11 = +[NSFileManager defaultManager];
  id v12 = [v10 lastPathComponent];
  id v13 = [v12 stringByAppendingPathExtension:@"unzipping"];

  int v14 = [v10 stringByDeletingLastPathComponent];
  uint64_t v15 = [v14 stringByAppendingPathComponent:v13];

  v16 = MBGetDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v34 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Placeholder: temporary placeholder extraction directory: %@", buf, 0xCu);
    v32 = v15;
    _MBLog();
  }

  if ([v11 fileExistsAtPath:v15]
    && ([v11 removeItemAtPath:v15 error:a5] & 1) == 0)
  {
    v26 = MBGetDefaultLog();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    id v28 = *a5;
    *(_DWORD *)buf = 138412546;
    id v34 = v15;
    __int16 v35 = 2112;
    id v36 = v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Placeholder: Unable to remove existing temporary placeholder extraction directory: %@: %@", buf, 0x16u);
    goto LABEL_23;
  }
  if ((objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, 0, a5, v32) & 1) == 0)
  {
    v26 = MBGetDefaultLog();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    id v27 = *a5;
    *(_DWORD *)buf = 138412546;
    id v34 = v15;
    __int16 v35 = 2112;
    id v36 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Placeholder: Unable to create temporary placeholder extraction directory: %@: %@", buf, 0x16u);
LABEL_23:
    _MBLog();
    goto LABEL_24;
  }
  if (([a1 _unzipPlaceholderDomainZipFile:v8 intoDirectory:v15 error:a5] & 1) == 0)
  {
    v26 = MBGetDefaultLog();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    id v29 = *a5;
    *(_DWORD *)buf = 138412546;
    id v34 = v15;
    __int16 v35 = 2112;
    id v36 = v29;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Placeholder: Unable to unzip placeholder: %@: %@", buf, 0x16u);
    goto LABEL_23;
  }
  if ([v11 fileExistsAtPath:v10]
    && ([v11 removeItemAtPath:v10 error:a5] & 1) == 0)
  {
    v26 = MBGetDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v30 = *a5;
      *(_DWORD *)buf = 138412546;
      id v34 = v10;
      __int16 v35 = 2112;
      id v36 = v30;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Placeholder: Unable to remove existing placeholder directory: %@: %@", buf, 0x16u);
      goto LABEL_23;
    }
LABEL_24:

    BOOL v25 = 0;
    goto LABEL_25;
  }
  id v17 = v15;
  v18 = (const std::__fs::filesystem::path *)[v17 fileSystemRepresentation];
  id v19 = v10;
  id v20 = (const std::__fs::filesystem::path *)[v19 fileSystemRepresentation];
  rename(v18, v20, v21);
  if (v22)
  {
    v23 = MBGetDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v24 = *__error();
      *(_DWORD *)buf = 138412802;
      id v34 = v17;
      __int16 v35 = 2112;
      id v36 = v19;
      __int16 v37 = 1024;
      int v38 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Placeholder: unable to rename %@ -> %@: %{errno}d", buf, 0x1Cu);
      __error();
      _MBLog();
    }

    +[MBError posixErrorWithCode:*__error(), v19, @"%@ -> %@", v17, v19 path format];
    BOOL v25 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v25 = 1;
  }
LABEL_25:

  return v25;
}

+ (BOOL)_unzipPlaceholderDomainZipFile:(id)a3 intoDirectory:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v38 = a4;
  if (!a5) {
    __assert_rtn("+[MBApp(Archiving) _unzipPlaceholderDomainZipFile:intoDirectory:error:]", "MBApp+Archiving.m", 204, "outError");
  }
  id v9 = a1;
  objc_sync_enter(v9);
  id v39 = v8;
  int v40 = open((const char *)[v39 fileSystemRepresentation], 0);
  if (v40 < 0)
  {
    +[MBError posixErrorWithCode:*__error() path:v39 format:@"Unable to open zip file"];
    BOOL v23 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  uint64_t v52 = 0;
  id v53 = &v52;
  uint64_t v54 = 0x3032000000;
  id v55 = sub_1001F5048;
  long long v56 = sub_1001F5058;
  id v57 = 0;
  dispatch_semaphore_t v37 = dispatch_semaphore_create(0);
  id v10 = objc_alloc((Class)SZExtractor);
  uint64_t v63 = SZExtractorOptionsDenyInvalidSymlinks;
  id v64 = &__kCFBooleanTrue;
  v11 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  id v12 = [v10 initWithPath:v38 options:v11];

  if (!v12)
  {
    uint64_t v30 = +[MBError errorWithDomain:@"MBErrorDomain" code:0 path:v38 format:@"Unable to init SZExtractor"];
    uint64_t v31 = (void *)v53[5];
    v53[5] = v30;

    v32 = MBGetDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = v53[5];
      LODWORD(v60) = 138412290;
      *(void *)((char *)&v60 + 4) = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Placeholder: %@", (uint8_t *)&v60, 0xCu);
      _MBLog();
    }
LABEL_31:

    id v35 = +[NSNull null];
    objc_exception_throw(v35);
  }
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1001F5060;
  v49[3] = &unk_1004163D8;
  id v51 = &v52;
  id v13 = v37;
  stat v50 = v13;
  [v12 prepareForExtraction:v49];
  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  if (v53[5])
  {
    v32 = MBGetDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = v53[5];
      LODWORD(v60) = 138412290;
      *(void *)((char *)&v60 + 4) = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Placeholder: Unable to prepare SZExtractor: %@", (uint8_t *)&v60, 0xCu);
      _MBLog();
    }
    goto LABEL_31;
  }
  id v14 = [objc_alloc((Class)NSMutableData) initWithCapacity:0x4000];
  [v14 setLength:0x4000];
  id v15 = v14;
  id v16 = [v15 mutableBytes];
  do
  {
    *(void *)&long long v60 = 0;
    *((void *)&v60 + 1) = &v60;
    uint64_t v61 = 0x2020000000;
    char v62 = 0;
    ssize_t v18 = read(v40, v16, 0x4000uLL);
    if (v18)
    {
      if (v18 == -1)
      {
        uint64_t v25 = +[MBError errorWithDomain:@"MBErrorDomain" code:0 path:v39 format:@"Unable to read bytes from zip file"];
        v26 = (void *)v53[5];
        v53[5] = v25;

        id v27 = MBGetDefaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = v53[5];
          *(_DWORD *)buf = 138412290;
          uint64_t v59 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Placeholder: %@", buf, 0xCu);
          uint64_t v36 = v53[5];
          _MBLog();
        }

LABEL_26:
        id v29 = +[NSNull null];
        objc_exception_throw(v29);
      }
      [v15 setLength:v18];
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1001F50C4;
      v45[3] = &unk_100416400;
      long long v47 = &v52;
      long long v48 = &v60;
      id v19 = v13;
      long long v46 = v19;
      [v12 supplyBytes:v15 withCompletionBlock:v45];
      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
      [v15 setLength:0x4000];
      if (v53[5]) {
        goto LABEL_26;
      }

      char v20 = 1;
    }
    else
    {
      char v20 = 0;
    }
    _Block_object_dispose(&v60, 8);
  }
  while ((v20 & 1) != 0);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1001F51D0;
  v41[3] = &unk_100416428;
  id v42 = v39;
  v44 = &v52;
  uint64_t v21 = v13;
  v43 = v21;
  [v12 finishStreamWithCompletionBlock:v41];
  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);

  close(v40);
  if (v37) {

  }
  if (v15) {
  int v22 = (void *)v53[5];
  }
  if (v22)
  {
    *a5 = v22;
    BOOL v23 = v53[5] == 0;
  }
  else
  {
    BOOL v23 = 1;
  }
  _Block_object_dispose(&v52, 8);

LABEL_21:
  objc_sync_exit(v9);

  return v23;
}

- (id)_placeholderDomainRootedInDirectory:(id)a3
{
  id v4 = a3;
  id v5 = [(MBApp *)self bundleID];
  uint64_t v6 = [v5 stringByAppendingPathExtension:@"ipa"];

  v7 = [(MBApp *)self bundleID];
  id v8 = [(MBContainer *)self volumeMountPoint];
  id v9 = +[MBDomain appPlaceholderDomainWithIdentifier:v7 volumeMountPoint:v8 rootPath:v4];

  id v10 = +[NSSet setWithObject:v6];
  [v9 setRelativePathsToBackupAndRestore:v10];

  [v9 setShouldDigest:0];
  return v9;
}

- (id)archivePlaceholderDomainWithPersonaIdentifier:(id)a3 intoDirectory:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!a5) {
    __assert_rtn("-[MBApp(Archiving) archivePlaceholderDomainWithPersonaIdentifier:intoDirectory:error:]", "MBApp+Archiving.m", 310, "outError");
  }
  id v10 = v9;
  uint64_t v11 = [(MBApp *)self bundleID];
  if (!v11) {
    __assert_rtn("-[MBApp(Archiving) archivePlaceholderDomainWithPersonaIdentifier:intoDirectory:error:]", "MBApp+Archiving.m", 313, "bundleID");
  }
  id v12 = (void *)v11;
  id v13 = [(MBApp *)self bundleDir];
  if (!v13) {
    __assert_rtn("-[MBApp(Archiving) archivePlaceholderDomainWithPersonaIdentifier:intoDirectory:error:]", "MBApp+Archiving.m", 315, "bundleDir");
  }
  id v14 = v13;
  id v15 = [v13 stringByStandardizingPath];
  id v16 = v10;
  if (!mkdir((const char *)[v16 fileSystemRepresentation], 0x1C0u) || *__error() == 17)
  {
    id v51 = a5;
    memset(&v62, 0, sizeof(v62));
    if (stat((const char *)[v15 fileSystemRepresentation], &v62)) {
      __darwin_time_t tv_sec = 0;
    }
    else {
      __darwin_time_t tv_sec = v62.st_mtimespec.tv_sec;
    }
    ssize_t v18 = [v16 stringByAppendingPathComponent:v12];
    id v19 = [v18 stringByAppendingPathExtension:@"ipa"];
    int v20 = stat((const char *)[v19 fileSystemRepresentation], &v62);
    __darwin_time_t v21 = v62.st_mtimespec.tv_sec;
    if (v20) {
      __darwin_time_t v21 = 0;
    }
    uint64_t v52 = v18;
    if (!tv_sec || v21 == tv_sec)
    {
      uint64_t v31 = MBGetDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.tv_sec) = 138412290;
        *(__darwin_time_t *)((char *)&buf.tv_sec + 4) = (__darwin_time_t)v12;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Placeholder: %@ does not need updating", (uint8_t *)&buf, 0xCu);
        _MBLog();
      }

      v32 = [(MBApp *)self _placeholderDomainRootedInDirectory:v16];
      goto LABEL_43;
    }
    uint64_t v22 = +[NSFileManager defaultManager];
    BOOL v23 = v18;
    int v24 = (void *)v22;
    uint64_t v25 = [v23 stringByAppendingPathExtension:@"zip"];
    long long v49 = (void *)v25;
    stat v50 = v24;
    if ([v24 fileExistsAtPath:v25])
    {
      long long v46 = v15;
      id v26 = v8;
      id v54 = 0;
      unsigned __int8 v27 = [v24 removeItemAtPath:v25 error:&v54];
      id v28 = v54;
      id v29 = MBGetDefaultLog();
      uint64_t v30 = v29;
      if ((v27 & 1) == 0)
      {
        id v8 = v26;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.tv_sec) = 138412290;
          *(__darwin_time_t *)((char *)&buf.tv_sec + 4) = (__darwin_time_t)v28;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Placeholder: Failed to remove existing legacy zip placeholder: %@", (uint8_t *)&buf, 0xCu);
          _MBLog();
        }

        id v38 = v28;
        v32 = 0;
        *id v51 = v38;
        id v15 = v46;
        goto LABEL_42;
      }
      id v8 = v26;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf.tv_sec) = 138412290;
        *(__darwin_time_t *)((char *)&buf.tv_sec + 4) = (__darwin_time_t)v49;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Placeholder: Removed legacy zip placeholder %@", (uint8_t *)&buf, 0xCu);
        v44 = v49;
        _MBLog();
      }

      id v15 = v46;
      int v24 = v50;
    }
    else
    {
      id v28 = 0;
    }
    id v48 = v8;
    if (objc_msgSend(v24, "fileExistsAtPath:", v19, v44))
    {
      id v53 = v28;
      unsigned __int8 v35 = [v24 removeItemAtPath:v19 error:&v53];
      id v36 = v53;

      if ((v35 & 1) == 0)
      {
        id v42 = MBGetDefaultLog();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.tv_sec) = 138412290;
          *(__darwin_time_t *)((char *)&buf.tv_sec + 4) = (__darwin_time_t)v36;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Placeholder: failed to remove existing stale placeholder: %@", (uint8_t *)&buf, 0xCu);
          _MBLog();
        }

        id v38 = v36;
        v32 = 0;
        *id v51 = v38;
        id v8 = v48;
        goto LABEL_42;
      }
      id v28 = v36;
    }
    v45 = +[NSURL fileURLWithPath:v19 isDirectory:0];
    char v37 = MICreateSerializedPlaceholderForInstalledApplication();
    id v38 = v28;

    if (v37)
    {
      long long v47 = v15;
      buf.__darwin_time_t tv_sec = tv_sec;
      buf.tv_usec = 0;
      __darwin_time_t v60 = tv_sec;
      int v61 = 0;
      id v39 = v19;
      utimes((const char *)[v39 fileSystemRepresentation], &buf);
      int v40 = MBGetDefaultLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v55 = 138412546;
        long long v56 = v12;
        __int16 v57 = 2112;
        id v58 = v39;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Placeholder: Successfully archived %@ -> %@", v55, 0x16u);
        _MBLog();
      }

      v32 = [(MBApp *)self _placeholderDomainRootedInDirectory:v16];
      id v15 = v47;
      id v8 = v48;
    }
    else
    {
      v41 = MBGetDefaultLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.tv_sec) = 138543362;
        *(__darwin_time_t *)((char *)&buf.tv_sec + 4) = (__darwin_time_t)v12;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Placeholder: Unable to create placeholder for %{public}@", (uint8_t *)&buf, 0xCu);
        _MBLog();
      }

      v32 = 0;
      *id v51 = v38;
      id v8 = v48;
    }

LABEL_42:
LABEL_43:

    goto LABEL_44;
  }
  uint64_t v33 = *__error();
  uint64_t v34 = MBGetDefaultLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    v62.st_dev = 138543618;
    *(void *)&v62.st_mode = v16;
    WORD2(v62.st_ino) = 1024;
    *(_DWORD *)((char *)&v62.st_ino + 6) = v33;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Placeholder: mkdir failed at %{public}@: %{errno}d", (uint8_t *)&v62, 0x12u);
    _MBLog();
  }

  +[MBError errorWithErrno:v33 path:v16 format:@"Placeholder: mkdir failed"];
  v32 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

  return v32;
}

+ (id)appWithBundleID:(id)a3
{
  v7[0] = kCFBundleIdentifierKey;
  v7[1] = @"ContainerContentClass";
  v8[0] = a3;
  v8[1] = @"Data/Application";
  id v3 = a3;
  id v4 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  id v5 = +[MBApp appWithPropertyList:v4];

  return v5;
}

+ (id)appWithPropertyList:(id)a3
{
  id v3 = a3;
  id v4 = [(MBContainer *)[MBApp alloc] initWithPropertyList:v3 volumeMountPoint:0];

  return v4;
}

+ (id)safeHarborWithPath:(id)a3
{
  id v3 = [a3 stringByAppendingPathComponent:kMBSafeHarborInfoDirName];
  id v4 = [v3 stringByAppendingPathComponent:kMBSafeHarborInfoPlistFilename];

  id v5 = +[NSDictionary dictionaryWithContentsOfFile:v4];
  if (v5)
  {
    uint64_t v6 = +[MBApp appWithPropertyList:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (NSString)bundleVersion
{
  return (NSString *)[(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:kCFBundleVersionKey];
}

- (NSString)bundleDir
{
  return (NSString *)[(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:@"Path"];
}

- (void)setBundleDir:(id)a3
{
}

- (NSDictionary)entitlements
{
  return (NSDictionary *)[(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:@"Entitlements"];
}

- (NSString)entitlementsRelativePath
{
  v2 = [(MBApp *)self bundleDir];
  id v3 = sub_1002AA7CC(v2);

  return (NSString *)v3;
}

- (NSArray)groups
{
  id v3 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:@"GroupContainers", 0];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [MBAppGroup alloc];
        uint64_t v11 = [(MBContainer *)self volumeMountPoint];
        id v12 = [(MBContainer *)v10 initWithPropertyList:v9 volumeMountPoint:v11];
        [v3 addObject:v12];
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)plugins
{
  id v3 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:@"Plugins", 0];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [MBAppPlugin alloc];
        uint64_t v11 = [(MBContainer *)self volumeMountPoint];
        id v12 = [(MBContainer *)v10 initWithPropertyList:v9 volumeMountPoint:v11];
        [v3 addObject:v12];
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)uniqueContainers
{
  return (NSArray *)[(MBApp *)self _visitContainerDependenciesAndFilterDuplicates:1];
}

- (NSArray)containers
{
  return (NSArray *)[(MBApp *)self _visitContainerDependenciesAndFilterDuplicates:0];
}

+ (void)_addContainer:(id)a3 toArray:(id)a4 visited:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v10 identifier];
  if (([v8 containsObject:v9] & 1) == 0)
  {
    [v7 addObject:v10];
    [v8 addObject:v9];
  }
}

- (id)_visitContainerDependenciesAndFilterDuplicates:(BOOL)a3
{
  if (a3) {
    id v4 = objc_opt_new();
  }
  else {
    id v4 = 0;
  }
  id v5 = +[NSMutableArray array];
  [v5 addObject:self];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = [(MBApp *)self groups];
  id v7 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        [(id)objc_opt_class() _addContainer:*(void *)(*((void *)&v31 + 1) + 8 * i) toArray:v5 visited:v4];
      }
      id v8 = [v6 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v8);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(MBApp *)self plugins];
  id v11 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
        [(id)objc_opt_class() _addContainer:v14 toArray:v5 visited:v4];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v15 = [v14 groups];
        id v16 = [v15 countByEnumeratingWithState:&v23 objects:v35 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v24;
          do
          {
            for (k = 0; k != v17; k = (char *)k + 1)
            {
              if (*(void *)v24 != v18) {
                objc_enumerationMutation(v15);
              }
              [(id)objc_opt_class() _addContainer:*(void *)(*((void *)&v23 + 1) + 8 * (void)k) toArray:v5 visited:v4];
            }
            id v17 = [v15 countByEnumeratingWithState:&v23 objects:v35 count:16];
          }
          while (v17);
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isAppUpdating
{
  v2 = [(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:@"IsUpdating"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isPlaceholder
{
  v2 = [(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:@"IsPlaceholder"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isSystemApp
{
  v2 = [(NSMutableDictionary *)self->super._plist objectForKeyedSubscript:@"ApplicationType"];
  if ([v2 isEqualToString:@"System"]) {
    unsigned __int8 v3 = 1;
  }
  else {
    unsigned __int8 v3 = [v2 isEqualToString:@"Internal"];
  }

  return v3;
}

- (id)domain
{
  unsigned __int8 v3 = [(MBApp *)self bundleID];
  id v4 = [(MBContainer *)self volumeMountPoint];
  id v5 = [(MBContainer *)self containerDir];
  id v6 = +[MBDomain appDomainWithIdentifier:v3 volumeMountPoint:v4 rootPath:v5];

  id v7 = sub_1002AB09C();
  [v6 setRelativePathsToBackupAndRestore:v7];

  id v8 = sub_1002AB0F0();
  [v6 setRelativePathsNotToBackup:v8];

  uint64_t v9 = sub_1002AB144();
  [v6 setRelativePathsNotToRestore:v9];

  [v6 setShouldDigest:0];
  return v6;
}

@end