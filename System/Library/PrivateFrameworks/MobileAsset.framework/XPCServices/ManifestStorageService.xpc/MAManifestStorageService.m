@interface MAManifestStorageService
- (BOOL)_assetTypeSupported:(id)a3;
- (BOOL)_parseSelector:(id)a3 assetType:(id *)a4 specifier:(id *)a5;
- (BOOL)_writeManifest:(id)a3 destination:(id)a4 error:(id *)a5;
- (MAManifestStorageService)init;
- (NSString)repositoryPath;
- (OS_dispatch_queue)queue;
- (id)_errorWithCode:(unint64_t)a3;
- (id)_errorWithCode:(unint64_t)a3 underlyingError:(id)a4;
- (id)_errorWithCode:(unint64_t)a3 underlyingPOSIXError:(int)a4;
- (id)_manifestPathForAssetType:(id)a3 specifier:(id)a4 stage:(BOOL)a5;
- (id)_normalizedIdentifier:(id)a3;
- (id)commitStagedManifestsForSelectors:(id)a3;
- (id)invalidateManifestForAssetType:(id)a3 specifier:(id)a4;
- (id)storeManifest:(id)a3 infoPlist:(id)a4 stage:(BOOL)a5;
- (int)_authenticatePlist:(id)a3 manifest:(id)a4 result:(id *)a5;
- (int)_flashManifest:(id)a3;
- (void)_logBase64Data:(id)a3 description:(id)a4;
- (void)commitStagedManifestsForSelectors:(id)a3 completion:(id)a4;
- (void)invalidateManifestForAssetType:(id)a3 specifier:(id)a4 completion:(id)a5;
- (void)setQueue:(id)a3;
- (void)storeManifest:(id)a3 infoPlist:(id)a4 stage:(BOOL)a5 completion:(id)a6;
@end

@implementation MAManifestStorageService

- (MAManifestStorageService)init
{
  v6.receiver = self;
  v6.super_class = (Class)MAManifestStorageService;
  v2 = [(MAManifestStorageService *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Manifest Storage Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (NSString)repositoryPath
{
  v2 = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2");
  dispatch_queue_t v3 = [v2 stringByAppendingPathComponent:@"manifests"];

  return (NSString *)v3;
}

- (void)storeManifest:(id)a3 infoPlist:(id)a4 stage:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(MAManifestStorageService *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003924;
  block[3] = &unk_100008370;
  BOOL v21 = a5;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

- (void)commitStagedManifestsForSelectors:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MAManifestStorageService *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003AB0;
  block[3] = &unk_100008398;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)invalidateManifestForAssetType:(id)a3 specifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MAManifestStorageService *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100003C54;
  v15[3] = &unk_1000083C0;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (id)storeManifest:(id)a3 infoPlist:(id)a4 stage:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (![v8 length])
  {
    _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService storeManifest:infoPlist:stage:]", @"Manifest is nil or empty", v10, v11, v12, v13, v42);
    id v20 = self;
    uint64_t v21 = 2;
LABEL_7:
    uint64_t v19 = [(MAManifestStorageService *)v20 _errorWithCode:v21];
    goto LABEL_8;
  }
  if (![v9 length])
  {
    _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService storeManifest:infoPlist:stage:]", @"Info plist is nil or empty", v14, v15, v16, v17, v42);
    id v20 = self;
    uint64_t v21 = 4;
    goto LABEL_7;
  }
  uint64_t v18 = [(MAManifestStorageService *)self _flashManifest:v8];
  if (v18)
  {
    uint64_t v19 = [(MAManifestStorageService *)self _errorWithCode:3 underlyingPOSIXError:v18];
LABEL_8:
    v22 = (void *)v19;
    goto LABEL_9;
  }
  id v44 = 0;
  uint64_t v24 = [(MAManifestStorageService *)self _authenticatePlist:v9 manifest:v8 result:&v44];
  id v25 = v44;
  v26 = v25;
  if (!v24)
  {
    v27 = [v25 objectForKeyedSubscript:kCFBundleIdentifierKey];
    v28 = [v26 objectForKeyedSubscript:kCFBundleNameKey];
    if ([v27 length] && objc_msgSend(v28, "length"))
    {
      if ([(MAManifestStorageService *)self _assetTypeSupported:v27])
      {
        v37 = [(MAManifestStorageService *)self _manifestPathForAssetType:v27 specifier:v28 stage:v5];
        id v43 = 0;
        unsigned __int8 v38 = [(MAManifestStorageService *)self _writeManifest:v8 destination:v37 error:&v43];
        id v39 = v43;
        v22 = 0;
        if ((v38 & 1) == 0)
        {
          v22 = [(MAManifestStorageService *)self _errorWithCode:7 underlyingError:v39];
        }

        goto LABEL_23;
      }
      _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService storeManifest:infoPlist:stage:]", @"Asset type is unsupported: %@", v33, v34, v35, v36, (uint64_t)v27);
      v40 = self;
      uint64_t v41 = 9;
    }
    else
    {
      _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService storeManifest:infoPlist:stage:]", @"Asset type (%@) or specifier (%@) missing", v29, v30, v31, v32, (uint64_t)v27);
      v40 = self;
      uint64_t v41 = 6;
    }
    v22 = [(MAManifestStorageService *)v40 _errorWithCode:v41];
LABEL_23:

    goto LABEL_24;
  }
  v22 = [(MAManifestStorageService *)self _errorWithCode:5 underlyingPOSIXError:v24];
LABEL_24:

LABEL_9:
  return v22;
}

- (int)_flashManifest:(id)a3
{
  id v4 = a3;
  if (image4_environment_new())
  {
    id v9 = v4;
    [v9 bytes];
    [v9 length];
    uint64_t v10 = image4_environment_flash();
    image4_environment_destroy();
    if (v10)
    {
      strerror(v10);
      _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService _flashManifest:]", @"Failed to flash manifest: %d (%s)", v15, v16, v17, v18, v10);
      [(MAManifestStorageService *)self _logBase64Data:v9 description:@"failing manifest"];
    }
    else
    {
      _MobileAssetLog(0, 6, (uint64_t)"-[MAManifestStorageService _flashManifest:]", @"Successfully flashed manifest", v11, v12, v13, v14, v20);
    }
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService _flashManifest:]", @"Failed to instantiate environment", v5, v6, v7, v8, v20);
    LODWORD(v10) = 12;
  }

  return v10;
}

- (int)_authenticatePlist:(id)a3 manifest:(id)a4 result:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (image4_environment_new())
  {
    id v13 = v8;
    [v13 bytes];
    [v13 length];
    image4_trust_new();
    id v14 = v7;
    [v14 bytes];
    [v14 length];
    image4_trust_set_payload();
    image4_trust_evaluate();
    image4_trust_destroy();
    image4_environment_destroy();
    _MobileAssetLog(0, 6, (uint64_t)"-[MAManifestStorageService _authenticatePlist:manifest:result:]", @"Authenticated plist: %@", v15, v16, v17, v18, 0);
    int v19 = 0;
    *a5 = 0;
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService _authenticatePlist:manifest:result:]", @"Failed to instantiate environment", v9, v10, v11, v12, v21);
    int v19 = 12;
  }

  return v19;
}

- (BOOL)_assetTypeSupported:(id)a3
{
  id v3 = a3;
  id v4 = +[MASecureMobileAssetTypes sharedInstance];
  unsigned __int8 v5 = [v4 supportsDarwin:v3];

  return v5;
}

- (BOOL)_writeManifest:(id)a3 destination:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = +[NSFileManager defaultManager];
  uint64_t v10 = [v7 stringByDeletingLastPathComponent];
  [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:0];
  [v9 removeItemAtPath:v7 error:0];
  unsigned int v11 = [v8 writeToFile:v7 options:0 error:a5];

  if (v11) {
    _MobileAssetLog(0, 6, (uint64_t)"-[MAManifestStorageService _writeManifest:destination:error:]", @"Wrote manifest to %@", v12, v13, v14, v15, (uint64_t)v7);
  }

  return v11;
}

- (id)commitStagedManifestsForSelectors:(id)a3
{
  id v4 = a3;
  size_t v5 = (size_t)[v4 count];
  v59 = (char *)malloc_type_calloc(v5, 0x18uLL, 0x1050040A9DC7973uLL);
  v65 = +[NSFileManager defaultManager];
  if (!v5)
  {
    v55 = 0;
    goto LABEL_37;
  }
  uint64_t v6 = 0;
  id v7 = v59 + 17;
  size_t v57 = v5;
  id v58 = v4;
  v64 = self;
  do
  {
    id v8 = [v4 objectAtIndexedSubscript:v6];
    id v67 = 0;
    id v68 = 0;
    unsigned __int8 v9 = [(MAManifestStorageService *)self _parseSelector:v8 assetType:&v68 specifier:&v67];
    id v10 = v68;
    id v15 = v67;
    if ((v9 & 1) == 0)
    {
      _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService commitStagedManifestsForSelectors:]", @"Selector missing type or specifier: %@", v11, v12, v13, v14, (uint64_t)v8);
      uint64_t v62 = [(MAManifestStorageService *)self _errorWithCode:10 underlyingPOSIXError:22];
      int v22 = 1;
      goto LABEL_14;
    }
    uint64_t v16 = [(MAManifestStorageService *)self _manifestPathForAssetType:v10 specifier:v15 stage:1];
    uint64_t v17 = [(MAManifestStorageService *)self _manifestPathForAssetType:v10 specifier:v15 stage:0];
    if ([v65 fileExistsAtPath:v16])
    {
      v61 = [v17 stringByDeletingLastPathComponent];
      if ([v65 fileExistsAtPath:v61])
      {
        v60 = 0;
      }
      else
      {
        id v66 = 0;
        unsigned __int8 v23 = [v65 createDirectoryAtPath:v61 withIntermediateDirectories:1 attributes:0 error:&v66];
        id v24 = v66;
        v60 = v24;
        if ((v23 & 1) == 0)
        {
          id v33 = v24;
          _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService commitStagedManifestsForSelectors:]", @"Failed to create containing directory: %@", v25, v26, v27, v28, (uint64_t)v24);
          uint64_t v62 = [(MAManifestStorageService *)v64 _errorWithCode:10 underlyingError:v33];
          int v22 = 1;
          goto LABEL_12;
        }
      }
      id v29 = [v16 fileSystemRepresentation];
      id v30 = v17;
      id v31 = [v30 fileSystemRepresentation];
      unsigned __int8 v32 = [v65 fileExistsAtPath:v30];
      int v22 = 0;
      *(void *)((char *)v7 - 17) = v29;
      *(void *)((char *)v7 - 9) = v31;
      *((unsigned char *)v7 - 1) = v32;
      *id v7 = 0;
      *(_DWORD *)((char *)v7 + 3) = 0;
      size_t v5 = v57;
      id v4 = v58;
LABEL_12:

      goto LABEL_13;
    }
    _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService commitStagedManifestsForSelectors:]", @"Staged manifest does not exist: %@", v18, v19, v20, v21, (uint64_t)v16);
    uint64_t v62 = [(MAManifestStorageService *)self _errorWithCode:10 underlyingPOSIXError:2];
    int v22 = 1;
LABEL_13:

LABEL_14:
    if (v22)
    {
      v55 = (void *)v62;
      goto LABEL_37;
    }
    ++v6;
    v7 += 6;
    self = v64;
  }
  while (v5 != v6);
  uint64_t v35 = v59 + 16;
  size_t v36 = v5;
  do
  {
    v37 = (const std::__fs::filesystem::path *)*((void *)v35 - 2);
    unsigned __int8 v38 = (const std::__fs::filesystem::path *)*((void *)v35 - 1);
    if (*v35)
    {
      if (!renamex_np((const char *)v37, (const char *)v38, 2u)) {
        goto LABEL_23;
      }
    }
    else
    {
      rename(v37, v38, v34);
      if (!v39) {
        goto LABEL_23;
      }
    }
    if (*__error()) {
      __error();
    }
LABEL_23:
    v35 += 24;
    --v36;
  }
  while (v36);
  uint64_t v40 = 0;
  uint64_t v41 = -(uint64_t)v5;
  char v42 = 1;
LABEL_25:
  char v63 = v42;
  id v43 = &v59[24 * v40++];
  do
  {
    uint64_t v44 = *(void *)v43;
    int v45 = *((_DWORD *)v43 + 5);
    v46 = +[NSString stringWithUTF8String:*(void *)v43];
    [v65 removeItemAtPath:v46 error:0];

    if (v45)
    {
      strerror(v45);
      _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService commitStagedManifestsForSelectors:]", @"Commit %s -> %s failed: %d %s", v51, v52, v53, v54, v44);
      char v42 = 0;
      if (v41 + v40) {
        goto LABEL_25;
      }
      goto LABEL_35;
    }
    _MobileAssetLog(0, 6, (uint64_t)"-[MAManifestStorageService commitStagedManifestsForSelectors:]", @"Commit %s -> %s succeeded", v47, v48, v49, v50, v44);
    v43 += 24;
    ++v40;
  }
  while (v41 + v40 != 1);
  if (v63)
  {
    v55 = 0;
    goto LABEL_36;
  }
LABEL_35:
  v55 = [(MAManifestStorageService *)v64 _errorWithCode:11];
LABEL_36:
  id v4 = v58;
LABEL_37:

  free(v59);
  return v55;
}

- (id)invalidateManifestForAssetType:(id)a3 specifier:(id)a4
{
  if (!a3 || !a4)
  {
    _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService invalidateManifestForAssetType:specifier:]", @"Missing asset type (%@) or specifier (%@)", v4, v5, v6, v7, (uint64_t)a3);
    uint64_t v18 = [(MAManifestStorageService *)self _errorWithCode:8 underlyingPOSIXError:22];
    goto LABEL_12;
  }
  unsigned __int8 v9 = -[MAManifestStorageService _manifestPathForAssetType:specifier:stage:](self, "_manifestPathForAssetType:specifier:stage:");
  id v10 = [v9 stringByDeletingLastPathComponent];

  _MobileAssetLog(0, 6, (uint64_t)"-[MAManifestStorageService invalidateManifestForAssetType:specifier:]", @"Removing %@", v11, v12, v13, v14, (uint64_t)v10);
  id v15 = +[NSFileManager defaultManager];
  id v28 = 0;
  unsigned __int8 v16 = [v15 removeItemAtPath:v10 error:&v28];
  id v17 = v28;

  uint64_t v18 = 0;
  if ((v16 & 1) == 0)
  {
    uint64_t v19 = [v17 userInfo];
    uint64_t v20 = [v19 objectForKeyedSubscript:NSUnderlyingErrorKey];

    uint64_t v21 = [v20 domain];
    if ([v21 isEqualToString:NSPOSIXErrorDomain])
    {
      id v22 = [v20 code];

      if (v22 == (id)2)
      {
        _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService invalidateManifestForAssetType:specifier:]", @"Ignoring ENOENT for %@", v23, v24, v25, v26, (uint64_t)v10);
        uint64_t v18 = 0;
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
    }
    uint64_t v18 = [(MAManifestStorageService *)self _errorWithCode:8 underlyingError:v17];
    goto LABEL_10;
  }
LABEL_11:

LABEL_12:
  return v18;
}

- (id)_manifestPathForAssetType:(id)a3 specifier:(id)a4 stage:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MAManifestStorageService *)self repositoryPath];
  uint64_t v11 = v10;
  if (v5)
  {
    uint64_t v12 = [v10 stringByAppendingPathComponent:@"staged"];

    uint64_t v11 = (void *)v12;
  }
  uint64_t v13 = [(MAManifestStorageService *)self _normalizedIdentifier:v8];
  uint64_t v14 = [v11 stringByAppendingPathComponent:v13];

  id v15 = [(MAManifestStorageService *)self _normalizedIdentifier:v9];

  unsigned __int8 v16 = [v14 stringByAppendingPathComponent:v15];

  id v17 = [v16 stringByAppendingPathComponent:@"SecureMobileAssetCryptex1Ticket.img4"];

  return v17;
}

- (id)_normalizedIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", @".", @"_", 2, 0, objc_msgSend(v3, "length"));

  return v4;
}

- (BOOL)_parseSelector:(id)a3 assetType:(id *)a4 specifier:(id *)a5
{
  id v7 = a3;
  id v8 = [v7 componentsSeparatedByString:@":"];
  if ([v8 count] == (id)2)
  {
    uint64_t v13 = [v8 objectAtIndexedSubscript:0];
    uint64_t v14 = [v8 objectAtIndexedSubscript:1];
    uint64_t v19 = (void *)v14;
    if (v13) {
      BOOL v20 = v14 == 0;
    }
    else {
      BOOL v20 = 1;
    }
    BOOL v21 = !v20;
    if (v20)
    {
      _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService _parseSelector:assetType:specifier:]", @"Invalid selector: %@", v15, v16, v17, v18, (uint64_t)v7);
    }
    else
    {
      *a4 = v13;
      *a5 = v19;
    }
  }
  else
  {
    _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService _parseSelector:assetType:specifier:]", @"Invalid selector: %@", v9, v10, v11, v12, (uint64_t)v7);
    BOOL v21 = 0;
  }

  return v21;
}

- (void)_logBase64Data:(id)a3 description:(id)a4
{
  id v5 = a4;
  uint64_t v10 = [a3 base64EncodedStringWithOptions:0];
  _MobileAssetLog(0, 3, (uint64_t)"-[MAManifestStorageService _logBase64Data:description:]", @"%@:<<<<<<<<<<\n%@%@:>>>>>>>>>>", v6, v7, v8, v9, (uint64_t)v5);
}

- (id)_errorWithCode:(unint64_t)a3
{
  return [(MAManifestStorageService *)self _errorWithCode:a3 underlyingError:0];
}

- (id)_errorWithCode:(unint64_t)a3 underlyingError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (v5)
  {
    NSErrorUserInfoKey v10 = NSUnderlyingErrorKey;
    id v11 = v5;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = +[NSError errorWithDomain:@"ManifestStorageServiceErrorDomain" code:a3 userInfo:v7];

  return v8;
}

- (id)_errorWithCode:(unint64_t)a3 underlyingPOSIXError:(int)a4
{
  uint64_t v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:a4 userInfo:0];
  uint64_t v7 = [(MAManifestStorageService *)self _errorWithCode:a3 underlyingError:v6];

  return v7;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end