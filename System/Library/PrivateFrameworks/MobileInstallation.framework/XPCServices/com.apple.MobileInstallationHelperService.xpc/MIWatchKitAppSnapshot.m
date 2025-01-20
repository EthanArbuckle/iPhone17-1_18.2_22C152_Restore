@interface MIWatchKitAppSnapshot
- (BOOL)_copyAppIconsFromBundle:(id)a3 toPlaceholder:(id)a4 isWatchBundle:(BOOL)a5;
- (BOOL)_createCompanionAppPlaceholderForApp:(id)a3 error:(id *)a4;
- (BOOL)_createPlaceholderForApp:(id)a3 atURL:(id)a4 error:(id *)a5;
- (BOOL)_createSnapshotWithError:(id *)a3;
- (BOOL)_hardLinkCopyURL:(id)a3 toURL:(id)a4 diskUsage:(unint64_t *)a5 error:(id *)a6;
- (BOOL)createSnapshotWithError:(id *)a3;
- (BOOL)identifierLocked;
- (BOOL)onlyV1;
- (BOOL)placeholderOnly;
- (MIWatchKitAppSnapshot)initWithBundleID:(id)a3 snapshotTo:(id)a4 onlyV1AppIfPresent:(BOOL)a5 placeholderOnly:(BOOL)a6;
- (NSDictionary)resultDict;
- (NSString)bundleID;
- (NSString)watchKitAppBundleID;
- (NSURL)destURL;
- (id)_iconDataForBundle:(__CFBundle *)a3 isWatchBundle:(BOOL)a4 error:(id *)a5;
- (id)_wkBundleForAppContainer:(id)a3 error:(id *)a4;
- (unint64_t)diskUsage;
- (void)setDiskUsage:(unint64_t)a3;
- (void)setIdentifierLocked:(BOOL)a3;
- (void)setResultDict:(id)a3;
- (void)setWatchKitAppBundleID:(id)a3;
@end

@implementation MIWatchKitAppSnapshot

- (MIWatchKitAppSnapshot)initWithBundleID:(id)a3 snapshotTo:(id)a4 onlyV1AppIfPresent:(BOOL)a5 placeholderOnly:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MIWatchKitAppSnapshot;
  v13 = [(MIWatchKitAppSnapshot *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_bundleID, a3);
    v14->_onlyV1 = a5;
    v14->_placeholderOnly = a6;
    objc_storeStrong((id *)&v14->_destURL, a4);
    v14->_identifierLocked = 0;
  }

  return v14;
}

- (id)_wkBundleForAppContainer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  LODWORD(self) = [(MIWatchKitAppSnapshot *)self onlyV1];
  v7 = [v6 bundle];

  id v12 = 0;
  if (self) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 3;
  }
  v9 = [v7 watchKitAppBundleForWKVersionOrEarlier:v8 error:&v12];
  id v10 = v12;

  if (a4 && !v9) {
    *a4 = v10;
  }

  return v9;
}

- (BOOL)_copyAppIconsFromBundle:(id)a3 toPlaceholder:(id)a4 isWatchBundle:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v9 = -[MIWatchKitAppSnapshot _iconDataForBundle:isWatchBundle:error:](self, "_iconDataForBundle:isWatchBundle:error:", [a3 cfBundle], v5, 0);
  if (v9)
  {
    id v10 = [v8 URLByAppendingPathComponent:@"Icon.png" isDirectory:0];
    id v14 = 0;
    unsigned __int8 v11 = [v9 writeToURL:v10 options:268435457 error:&v14];
    id v12 = v14;
    if ((v11 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)) {
      MOLogWrite();
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)_iconDataForBundle:(__CFBundle *)a3 isWatchBundle:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v7 = +[NSMutableData data];
  if (v6)
  {
    if (!&_LICreateIconForBundleAndDisplayGamut)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
    uint64_t v9 = LICreateIconForBundleAndDisplayGamut();
  }
  else
  {
    if (!&_LICreateDeviceAppropriateHomeScreenIconImageFromBundle)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
        goto LABEL_10;
      }
LABEL_9:
      MOLogWrite();
LABEL_10:
      id v8 = 0;
      goto LABEL_33;
    }
    uint64_t v9 = LICreateDeviceAppropriateHomeScreenIconImageFromBundle();
  }
  id v10 = (void *)v9;
  if (!v9)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
LABEL_24:
    id v8 = 0;
    if (!a5) {
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  unsigned __int8 v11 = CGImageDestinationCreateWithData(v7, @"public.png", 1uLL, 0);
  if (!v11)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    CFRelease(v10);
    goto LABEL_24;
  }
  id v12 = v11;
  CGImageDestinationAddImage(v11, (CGImageRef)v10, 0);
  if (CGImageDestinationFinalize(v12))
  {
    id v8 = [(__CFData *)v7 copy];
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3) {
      MOLogWrite();
    }
    id v8 = 0;
  }
  CFRelease(v10);
  CFRelease(v12);
  if (a5)
  {
LABEL_31:
    if (!v8) {
      *a5 = 0;
    }
  }
LABEL_33:

  return v8;
}

- (BOOL)_createPlaceholderForApp:(id)a3 atURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[NSMutableDictionary dictionaryWithCapacity:2];
  [(MIWatchKitAppSnapshot *)self _copyAppIconsFromBundle:v8 toPlaceholder:v9 isWatchBundle:1];
  unsigned __int8 v11 = [v8 identifier];
  if (v11) {
    [v10 setObject:v11 forKeyedSubscript:kCFBundleIdentifierKey];
  }

  [v10 setObject:@"Placeholder" forKeyedSubscript:kCFBundleExecutableKey];
  id v12 = [v8 infoPlistSubset];
  uint64_t v13 = _kCFBundleDisplayNameKey;
  id v14 = [v12 objectForKeyedSubscript:_kCFBundleDisplayNameKey];

  if (v14) {
    [v10 setObject:v14 forKeyedSubscript:v13];
  }

  v15 = [v8 infoPlistSubset];
  objc_super v16 = [v15 objectForKeyedSubscript:kCFBundleVersionKey];

  if (v16) {
    [v10 setObject:v16 forKeyedSubscript:kCFBundleVersionKey];
  }

  v17 = [v8 infoPlistSubset];
  uint64_t v18 = _kCFBundleShortVersionStringKey;
  v19 = [v17 objectForKeyedSubscript:_kCFBundleShortVersionStringKey];

  if (v19) {
    [v10 setObject:v19 forKeyedSubscript:v18];
  }

  [v10 setObject:@"Icon.png" forKeyedSubscript:_kCFBundleIconFileKey];
  v20 = [v8 infoPlistSubset];
  v21 = [v20 objectForKeyedSubscript:@"WKWatchKitApp"];
  [v10 setObject:v21 forKeyedSubscript:@"WKWatchKitApp"];

  v22 = [v8 infoPlistSubset];
  v23 = [v22 objectForKeyedSubscript:@"WKApplication"];
  [v10 setObject:v23 forKeyedSubscript:@"WKApplication"];

  v24 = [v9 URLByAppendingPathComponent:@"Info.plist" isDirectory:0];
  id v29 = 0;
  unsigned __int8 v25 = objc_msgSend(v10, "MI_writeToURL:format:options:error:", v24, 200, 1, &v29);
  id v26 = v29;
  v27 = v26;
  if (a5 && (v25 & 1) == 0) {
    *a5 = v26;
  }

  return v25;
}

- (BOOL)_hardLinkCopyURL:(id)a3 toURL:(id)a4 diskUsage:(unint64_t *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  CFTypeRef cf = 0;
  id v11 = v9;
  id v12 = [v11 fileSystemRepresentation];
  id v13 = v10;
  char v14 = hardlink_copy_hierarchy((uint64_t)v12, (uint64_t)[v13 fileSystemRepresentation], 0, 0, 0, 0, 0, 0, a5, (CFErrorRef *)&cf);
  if ((v14 & 1) == 0)
  {
    v15 = (void *)MIInstallerErrorDomain;
    objc_super v16 = (void *)cf;
    v17 = [v11 path];
    v21 = [v13 path];
    v19 = _CreateAndLogError((uint64_t)"-[MIWatchKitAppSnapshot _hardLinkCopyURL:toURL:diskUsage:error:]", 232, v15, 4, v16, 0, @"Failed to hardlink copy %@ to %@", v18, (uint64_t)v17);

    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    if (a6) {
      *a6 = v19;
    }
  }
  return v14;
}

- (BOOL)_createCompanionAppPlaceholderForApp:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(MIWatchKitAppSnapshot *)self destURL];
  id v8 = [v7 URLByAppendingPathComponent:@"com.apple.mobileinstallation.companion_placeholder" isDirectory:1];

  id v9 = +[MIFileManager defaultManager];
  id v29 = 0;
  unsigned int v10 = [v9 createDirectoryAtURL:v8 withIntermediateDirectories:0 mode:493 class:4 error:&v29];
  id v11 = v29;

  if (!v10)
  {
    id v13 = 0;
    id v17 = v11;
    char v14 = 0;
LABEL_9:
    if (a4)
    {
      id v17 = v17;
      BOOL v22 = 0;
      *a4 = v17;
    }
    else
    {
      BOOL v22 = 0;
    }
    goto LABEL_12;
  }
  unsigned __int8 v25 = self;
  id v12 = [v6 bundleURL];
  id v13 = [v12 URLByAppendingPathComponent:@"Info.plist" isDirectory:0];

  char v14 = [v8 URLByAppendingPathComponent:@"Info.plist" isDirectory:0];
  v15 = +[MIFileManager defaultManager];
  id v28 = v11;
  unsigned int v16 = [v15 copyItemAtURL:v13 toURL:v14 error:&v28];
  id v17 = v28;

  if (!v16) {
    goto LABEL_9;
  }
  uint64_t v18 = +[MIFileManager defaultManager];
  v19 = [v6 bundleURL];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100009288;
  v26[3] = &unk_100020A78;
  id v20 = v8;
  id v27 = v20;
  v21 = [v18 enumerateURLsForItemsInDirectoryAtURL:v19 ignoreSymlinks:1 withBlock:v26];

  if (v21 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
  {
    v24 = [v6 bundleURL];
    MOLogWrite();
  }
  [(MIWatchKitAppSnapshot *)v25 _copyAppIconsFromBundle:v6 toPlaceholder:v20 isWatchBundle:0];
  BOOL v22 = 1;
LABEL_12:

  return v22;
}

- (BOOL)_createSnapshotWithError:(id *)a3
{
  id v66 = 0;
  BOOL v5 = +[MIFileManager defaultManager];
  id v6 = [(MIWatchKitAppSnapshot *)self destURL];
  unsigned int v7 = [v5 itemExistsAtURL:v6];

  if (v7)
  {
    id v8 = (void *)MIInstallerErrorDomain;
    id v9 = [(MIWatchKitAppSnapshot *)self destURL];
    unsigned int v10 = [v9 path];
    _CreateAndLogError((uint64_t)"-[MIWatchKitAppSnapshot _createSnapshotWithError:]", 330, v8, 84, 0, 0, @"Clone destination %@ already exists.", v11, (uint64_t)v10);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    id v13 = 0;
    char v14 = 0;
    v15 = 0;
    unsigned int v16 = 0;
    id v17 = 0;
    uint64_t v18 = 0;
    goto LABEL_20;
  }
  v19 = [(MIWatchKitAppSnapshot *)self bundleID];
  id v65 = 0;
  uint64_t v18 = +[MIBundleContainer appBundleContainerWithIdentifier:v19 createIfNeeded:0 created:0 error:&v65];
  id v12 = v65;

  if (!v18)
  {
    id v13 = 0;
    char v14 = 0;
    v15 = 0;
    unsigned int v16 = 0;
    id v17 = 0;
    goto LABEL_20;
  }
  id v64 = v12;
  id v17 = [(MIWatchKitAppSnapshot *)self _wkBundleForAppContainer:v18 error:&v64];
  id v20 = v64;

  if (!v17)
  {
    id v13 = 0;
    goto LABEL_9;
  }
  if ([v17 isPlaceholder])
  {
    v21 = (void *)MIInstallerErrorDomain;
    BOOL v22 = [(MIWatchKitAppSnapshot *)self bundleID];
    _CreateAndLogError((uint64_t)"-[MIWatchKitAppSnapshot _createSnapshotWithError:]", 345, v21, 139, 0, 0, @"Cannot snapshot WatchKit app for %@ because the embedded WatchKit app is only a placeholder.", v23, (uint64_t)v22);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
    id v13 = 0;
    char v14 = 0;
    goto LABEL_18;
  }
  v24 = [v17 identifier];
  [(MIWatchKitAppSnapshot *)self setWatchKitAppBundleID:v24];

  unsigned __int8 v25 = +[MIFileManager defaultManager];
  id v26 = [(MIWatchKitAppSnapshot *)self destURL];
  id v63 = v20;
  unsigned int v27 = [v25 createDirectoryAtURL:v26 withIntermediateDirectories:0 mode:493 class:4 error:&v63];
  id v12 = v63;

  if (!v27) {
    goto LABEL_17;
  }
  id v28 = [(MIWatchKitAppSnapshot *)self destURL];
  id v13 = [v28 URLByAppendingPathComponent:@"Payload" isDirectory:1];

  id v29 = +[MIFileManager defaultManager];
  id v62 = v12;
  unsigned int v30 = [v29 createDirectoryAtURL:v13 withIntermediateDirectories:0 mode:493 class:4 error:&v62];
  id v20 = v62;

  if (!v30)
  {
LABEL_9:
    char v14 = 0;
    v15 = 0;
    unsigned int v16 = 0;
    id v12 = v20;
    goto LABEL_20;
  }
  v31 = [v17 bundleName];
  char v14 = [v13 URLByAppendingPathComponent:v31 isDirectory:1];

  v32 = +[MIFileManager defaultManager];
  id v61 = v20;
  unsigned int v51 = [v32 createDirectoryAtURL:v14 withIntermediateDirectories:0 mode:493 class:4 error:&v61];
  id v12 = v61;

  if (!v51) {
    goto LABEL_18;
  }
  v33 = [v18 bundle];
  id v60 = v12;
  unsigned int v34 = [(MIWatchKitAppSnapshot *)self _createCompanionAppPlaceholderForApp:v33 error:&v60];
  id v52 = v60;

  if (!v34)
  {
    v15 = 0;
    unsigned int v16 = 0;
    id v12 = v52;
    goto LABEL_20;
  }
  if ([(MIWatchKitAppSnapshot *)self placeholderOnly])
  {
    id v59 = v52;
    unsigned int v35 = [(MIWatchKitAppSnapshot *)self _createPlaceholderForApp:v17 atURL:v14 error:&v59];
    id v12 = v59;

    if (v35)
    {
      v36 = +[MIFileManager defaultManager];
      id v66 = [v36 diskUsageForURL:v14];

      goto LABEL_26;
    }
LABEL_18:
    v15 = 0;
LABEL_19:
    unsigned int v16 = 0;
    goto LABEL_20;
  }
  v39 = [v17 bundleURL];
  id v58 = v52;
  unsigned int v40 = [(MIWatchKitAppSnapshot *)self _hardLinkCopyURL:v39 toURL:v14 diskUsage:&v66 error:&v58];
  id v12 = v58;

  if (!v40) {
    goto LABEL_18;
  }
LABEL_26:
  v41 = v12;
  v15 = [v18 iTunesMetadataURL];
  id v57 = v12;
  unsigned int v16 = +[MIStoreMetadata metadataFromPlistAtURL:v15 error:&v57];
  id v12 = v57;

  if (!v16)
  {
    v54 = [v12 userInfo];
    v45 = [v54 objectForKeyedSubscript:NSUnderlyingErrorKey];

    v53 = v45;
    v46 = [v45 domain];
    if ([v46 isEqualToString:NSCocoaErrorDomain])
    {
      id v50 = [v53 code];

      if (v50 == (id)260) {
        goto LABEL_32;
      }
    }
    else
    {
    }
    goto LABEL_19;
  }
  [v16 setDistributorInfo:0];
  id v56 = v12;
  uint64_t v42 = [v16 propertyListDataWithError:&v56];
  id v49 = v56;

  v53 = (void *)v42;
  if (v42)
  {
    v43 = [(MIWatchKitAppSnapshot *)self destURL];
    v44 = [v15 lastPathComponent];
    v48 = [v43 URLByAppendingPathComponent:v44 isDirectory:0];

    id v55 = v49;
    unsigned __int8 v47 = [v53 writeToURL:v48 options:0x10000000 error:&v55];
    id v12 = v55;

    if ((v47 & 1) == 0) {
      goto LABEL_34;
    }
LABEL_32:

    [(MIWatchKitAppSnapshot *)self setDiskUsage:v66];
    BOOL v37 = 1;
    goto LABEL_23;
  }
  id v12 = v49;
LABEL_34:

LABEL_20:
  if (a3)
  {
    id v12 = v12;
    BOOL v37 = 0;
    *a3 = v12;
  }
  else
  {
    BOOL v37 = 0;
  }
LABEL_23:

  return v37;
}

- (BOOL)createSnapshotWithError:(id *)a3
{
  BOOL v4 = [(MIWatchKitAppSnapshot *)self _createSnapshotWithError:a3];
  if (v4)
  {
    v9[0] = @"DiskUsageBytes";
    BOOL v5 = +[NSNumber numberWithUnsignedLongLong:[(MIWatchKitAppSnapshot *)self diskUsage]];
    v10[0] = v5;
    v9[1] = kCFBundleIdentifierKey;
    id v6 = [(MIWatchKitAppSnapshot *)self watchKitAppBundleID];
    v10[1] = v6;
    unsigned int v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    [(MIWatchKitAppSnapshot *)self setResultDict:v7];
  }
  return v4;
}

- (NSDictionary)resultDict
{
  return self->_resultDict;
}

- (void)setResultDict:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)watchKitAppBundleID
{
  return self->_watchKitAppBundleID;
}

- (void)setWatchKitAppBundleID:(id)a3
{
}

- (BOOL)onlyV1
{
  return self->_onlyV1;
}

- (BOOL)placeholderOnly
{
  return self->_placeholderOnly;
}

- (NSURL)destURL
{
  return self->_destURL;
}

- (unint64_t)diskUsage
{
  return self->_diskUsage;
}

- (void)setDiskUsage:(unint64_t)a3
{
  self->_diskUsage = a3;
}

- (BOOL)identifierLocked
{
  return self->_identifierLocked;
}

- (void)setIdentifierLocked:(BOOL)a3
{
  self->_identifierLocked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destURL, 0);
  objc_storeStrong((id *)&self->_watchKitAppBundleID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_resultDict, 0);
}

@end