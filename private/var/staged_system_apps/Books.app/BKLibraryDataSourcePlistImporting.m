@interface BKLibraryDataSourcePlistImporting
- (BKAssetImportingDelegate)importingDelegate;
- (BKAssetMetadataCaching)metadataCache;
- (BKLibraryDataSourcePlistImporting)init;
- (BKLibraryDataSourcePlistImporting)initWithMetadataCache:(id)a3 importingDelegate:(id)a4;
- (BKLibraryDataSourcePlistWriting)plistWriter;
- (BKLibraryManager)libraryManager;
- (BOOL)_cleanupBackupAttributeOnItemAtURL:(id)a3;
- (BOOL)_cleanupFileProtectionOnItemAtURL:(id)a3;
- (BOOL)_hasCleanedUpBackupAttributeOnImportedFiles;
- (BOOL)_hasCleanedUpFileProtectionOnImportedFiles;
- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5;
- (BOOL)canMakeAssetsLocal;
- (BOOL)canRedownloadAssets;
- (BOOL)examineURL:(id)a3 completion:(id)a4;
- (BOOL)hasCleanedUpImportedFiles;
- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6;
- (BOOL)isEnabled;
- (BOOL)p_createPurchasesDirectory;
- (BOOL)prioritizeImport:(id)a3 completion:(id)a4;
- (BOOL)updateURL:(id)a3 completion:(id)a4;
- (NSMutableDictionary)importingOperationsInFlight;
- (NSOperationQueue)assetImportingQueue;
- (NSString)identifier;
- (OS_dispatch_queue)ivarSerialQueue;
- (OS_dispatch_queue)workQueue;
- (id)p_assetIdentifierFromExtractionFileOp:(id)a3;
- (id)p_coverImageFromZipArchive:(id)a3 error:(id *)a4;
- (id)p_destPathFromSrcPath:(id)a3;
- (id)p_itemIdStringFromPlistEntry:(id)a3;
- (id)p_storeIdFromEpubDirectory:(id)a3;
- (id)reloadCounterpartHandler;
- (int64_t)coverSourceRank;
- (int64_t)rank;
- (void)assetForLibraryAsset:(id)a3 completion:(id)a4;
- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)cleanupImportedFiles;
- (void)clearAgingDocumentInbox;
- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5;
- (void)extractOperationDidFail:(id)a3;
- (void)extractOperationDidFinish:(id)a3;
- (void)extractOperationDidUpdateProgress:(id)a3;
- (void)fetchAssetsWithCompletion:(id)a3;
- (void)p_deletePath:(id)a3;
- (void)p_importBookWithAssetID:(id)a3 srcPath:(id)a4 completion:(id)a5;
- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5;
- (void)setAssetImportingQueue:(id)a3;
- (void)setImportingDelegate:(id)a3;
- (void)setImportingOperationsInFlight:(id)a3;
- (void)setIvarSerialQueue:(id)a3;
- (void)setLibraryManager:(id)a3;
- (void)setMetadataCache:(id)a3;
- (void)setPlistWriter:(id)a3;
- (void)setRank:(int64_t)a3;
- (void)setReloadCounterpartHandler:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation BKLibraryDataSourcePlistImporting

- (int64_t)rank
{
  return self->_rank;
}

- (void)setReloadCounterpartHandler:(id)a3
{
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (void)setPlistWriter:(id)a3
{
}

- (void)setLibraryManager:(id)a3
{
}

- (BOOL)p_createPurchasesDirectory
{
  v3 = [(BKLibraryDataSourcePlistImporting *)self importingDelegate];
  v4 = [v3 importDestinationPathForAssetImporter:self];

  v5 = +[NSFileManager defaultManager];
  id v9 = 0;
  unsigned __int8 v6 = [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v9];
  id v7 = v9;

  if (v7) {
    [v7 logRecursively];
  }

  return v6;
}

- (BKLibraryDataSourcePlistImporting)initWithMetadataCache:(id)a3 importingDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  v20.receiver = self;
  v20.super_class = (Class)BKLibraryDataSourcePlistImporting;
  v8 = [(BKLibraryDataSourcePlistImporting *)&v20 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_metadataCache, v6);
    objc_storeWeak((id *)&v9->_importingDelegate, v7);
    uint64_t v10 = objc_opt_new();
    assetImportingQueue = v9->_assetImportingQueue;
    v9->_assetImportingQueue = (NSOperationQueue *)v10;

    [(NSOperationQueue *)v9->_assetImportingQueue setMaxConcurrentOperationCount:1];
    uint64_t v12 = objc_opt_new();
    importingOperationsInFlight = v9->_importingOperationsInFlight;
    v9->_importingOperationsInFlight = (NSMutableDictionary *)v12;

    identifier = v9->_identifier;
    v9->_identifier = (NSString *)@"com.apple.ibooks.plist.importing";

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.ibooks.BKLibraryDataSourcePlistImporting.ivarSerialQueue", 0);
    ivarSerialQueue = v9->_ivarSerialQueue;
    v9->_ivarSerialQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.ibooks.BKLibraryDataSourcePlistImporting.workQueue", 0);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v17;

    [(BKLibraryDataSourcePlistImporting *)v9 p_createPurchasesDirectory];
  }
  kdebug_trace();

  return v9;
}

- (BKAssetImportingDelegate)importingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_importingDelegate);

  return (BKAssetImportingDelegate *)WeakRetained;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)hasCleanedUpImportedFiles
{
  BOOL v3 = [(BKLibraryDataSourcePlistImporting *)self _hasCleanedUpFileProtectionOnImportedFiles];
  if (v3)
  {
    LOBYTE(v3) = [(BKLibraryDataSourcePlistImporting *)self _hasCleanedUpBackupAttributeOnImportedFiles];
  }
  return v3;
}

- (BOOL)_hasCleanedUpFileProtectionOnImportedFiles
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"BKPlistImportingHasCheckedFileProtection"];

  return v3;
}

- (BOOL)_hasCleanedUpBackupAttributeOnImportedFiles
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"BKPlistImportingHasCheckedBackupAttribute"];

  return v3;
}

- (BKLibraryDataSourcePlistImporting)init
{
  return 0;
}

- (id)p_destPathFromSrcPath:(id)a3
{
  id v4 = a3;
  v5 = [(BKLibraryDataSourcePlistImporting *)self importingDelegate];
  id v6 = [v5 importDestinationPathForAssetImporter:self];

  id v7 = objc_alloc_init((Class)NSFileManager);
  v8 = [v4 lastPathComponent];

  id v9 = [v8 stringByReplacingOccurrencesOfString:@":" withString:@"_"];

  uint64_t v10 = [v7 bu_nonCollidingNameForFileName:v9 inDestPath:v6];
  v11 = [v6 stringByAppendingPathComponent:v10];

  return v11;
}

- (void)p_deletePath:(id)a3
{
  id v4 = a3;
  unsigned __int8 v3 = +[NSFileManager defaultManager];
  if ([v4 length] && objc_msgSend(v3, "fileExistsAtPath:", v4)) {
    [v3 removeItemAtPath:v4 error:0];
  }
}

- (id)p_assetIdentifierFromExtractionFileOp:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 userContext];

  v5 = BUDynamicCast();

  id v6 = [v5 assetID];
  if (v6) {
    [v5 assetID];
  }
  else {
  id v7 = [v5 temporaryAssetID];
  }

  return v7;
}

- (id)p_storeIdFromEpubDirectory:(id)a3
{
  id v4 = [a3 stringByAppendingPathComponent:@"iTunesMetadata.plist"];
  if (v4)
  {
    v5 = +[NSDictionary dictionaryWithContentsOfFile:v4];
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 valueForKey:@"itemId"];
      v8 = [(BKLibraryDataSourcePlistImporting *)self p_itemIdStringFromPlistEntry:v7];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)p_itemIdStringFromPlistEntry:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = BUDynamicCast();
  if (v4) {
    goto LABEL_2;
  }
  objc_opt_class();
  v5 = BUDynamicCast();
  if (!v5)
  {
LABEL_7:
    id v4 = 0;
    goto LABEL_8;
  }
  id v6 = v5;
  id v4 = [v5 stringValue];

  if (v4)
  {
LABEL_2:
    if ((unint64_t)[v4 length] > 1) {
      goto LABEL_8;
    }

    goto LABEL_7;
  }
LABEL_8:

  return v4;
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)fetchAssetsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(BKLibraryDataSourcePlistImporting *)self ivarSerialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DDED0;
  v7[3] = &unk_100A44120;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (int64_t)coverSourceRank
{
  return 1;
}

- (void)bookCoverForLibraryAssetProperties:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  id v5 = objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, void, void, void))v5 + 2))(v5, 0, 0, 0);
    id v5 = v6;
  }
}

- (void)deleteAssets:(id)a3 exhaustive:(BOOL)a4 completion:(id)a5
{
  id v5 = objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, void, void))v5 + 2))(v5, 0, 0);
    id v5 = v6;
  }
}

- (BOOL)canImportURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5
{
  id v6 = a3;
  id v7 = [v6 path];
  unsigned int v8 = +[BKAssetUtilities contentTypeForPath:v7];

  if (a4)
  {
    BOOL v9 = 0;
  }
  else
  {
    unsigned int v10 = [v6 isFileURL];
    BOOL v12 = v8 == 4 || (v8 & 0xFFFFFFFD) == 1;
    if (v10) {
      BOOL v9 = v12;
    }
    else {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (BOOL)updateURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)examineURL:(id)a3 completion:(id)a4
{
  return 0;
}

- (void)resolveLibraryAsset:(id)a3 options:(id)a4 completion:(id)a5
{
  id v5 = objc_retainBlock(a5);
  if (v5)
  {
    id v6 = v5;
    (*((void (**)(id, void, void, void))v5 + 2))(v5, 0, 0, 0);
    id v5 = v6;
  }
}

- (void)assetForLibraryAsset:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 temporaryAssetID];
  if (v7)
  {
    unsigned int v8 = [(BKLibraryDataSourcePlistImporting *)self ivarSerialQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000DE22C;
    block[3] = &unk_100A45338;
    block[4] = self;
    id v12 = v7;
    id v13 = v6;
    dispatch_async(v8, block);
  }
  else
  {
    id v9 = objc_retainBlock(v6);
    unsigned int v10 = v9;
    if (v9) {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
}

- (BOOL)prioritizeImport:(id)a3 completion:(id)a4
{
  return 0;
}

- (BOOL)canRedownloadAssets
{
  return 0;
}

- (BOOL)canMakeAssetsLocal
{
  return 0;
}

- (BOOL)importURL:(id)a3 openInPlace:(BOOL)a4 options:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  BOOL v12 = [(BKLibraryDataSourcePlistImporting *)self canImportURL:v10 openInPlace:v8 options:a5];
  if (v12)
  {
    id v13 = BKLibraryBookImportLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "BKLibraryDataSourcePlistImporting: importURL:%@", buf, 0xCu);
    }

    v14 = [(BKLibraryDataSourcePlistImporting *)self assetImportingQueue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000DE464;
    v16[3] = &unk_100A45338;
    id v17 = v10;
    v18 = self;
    id v19 = v11;
    [v14 addOperationWithBlock:v16];
  }
  return v12;
}

- (void)clearAgingDocumentInbox
{
  id v3 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  id v4 = [v3 lastObject];
  id v5 = [v4 stringByAppendingPathComponent:@"Inbox"];

  id v6 = [(BKLibraryDataSourcePlistImporting *)self assetImportingQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000DE95C;
  v8[3] = &unk_100A43DD8;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  [v6 addOperationWithBlock:v8];
}

- (id)p_coverImageFromZipArchive:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)SFUZipArchive) initWithPath:v5 collapseCommonRootDirectory:0];
  if (!v6)
  {
    id v10 = 0;
    id v20 = 0;
    goto LABEL_25;
  }
  id v7 = NSTemporaryDirectory();
  BOOL v8 = [v6 entryWithName:kIMLibraryPlistArtworkName];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 data];
    if (v10)
    {
LABEL_19:
      if ((+[IMCoverUtilities isUndesirableImageData:v10 error:a4] & 1) == 0)
      {
        id v20 = [objc_alloc((Class)UIImage) initWithData:v10];
        goto LABEL_22;
      }
      goto LABEL_20;
    }
  }
  uint64_t v11 = kIMLibraryPlistMetadataName;
  uint64_t v12 = [v6 entryWithName:kIMLibraryPlistMetadataName];
  if (v12)
  {
    id v13 = (void *)v12;
    v14 = [v7 stringByAppendingPathComponent:v11];
    [v13 copyToFile:v14];
    dispatch_queue_t v15 = +[NSDictionary dictionaryWithContentsOfFile:v14];
    v16 = +[NSFileManager defaultManager];
    [v16 removeItemAtPath:v14 error:0];

    if (v15)
    {
      v23 = v7;
      id v17 = +[IMLibraryPlist coverPathFromPlistEntry:v15];
      if (v17)
      {
        v18 = [v6 entryWithName:v17];
        id v19 = v18;
        if (v18)
        {
          id v10 = [v18 data];
        }
        else
        {
          id v10 = 0;
        }
      }
      else if (a4)
      {
        +[NSError errorWithDomain:kBKLibraryDataSourceDomain code:kBKLibraryDataSourceErrorMissingCoverPath userInfo:0];
        id v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v10 = 0;
      }

      id v7 = v23;
    }
    else
    {
      id v10 = 0;
    }

    if (v10) {
      goto LABEL_19;
    }
LABEL_20:
    id v20 = 0;
    goto LABEL_22;
  }
  if (!a4)
  {
    id v10 = 0;
    goto LABEL_20;
  }
  +[NSError errorWithDomain:kBKLibraryDataSourceDomain code:kBKLibraryDataSourceErrorMissingiTunesMetadata userInfo:0];
  id v10 = 0;
  id v20 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

LABEL_25:
  id v21 = v20;

  return v21;
}

- (void)p_importBookWithAssetID:(id)a3 srcPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = BKLibraryBookImportLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558786;
    uint64_t v43 = 1752392040;
    __int16 v44 = 2112;
    id v45 = v8;
    __int16 v46 = 2160;
    uint64_t v47 = 1752392040;
    __int16 v48 = 2112;
    id v49 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "BKLibraryDataSourcePlistImporting: p_importBookWithAssetID: %{mask.hash}@, srcPath: %{mask.hash}@.", buf, 0x2Au);
  }

  uint64_t v12 = 0;
  char v41 = 0;
  if (v8 && v9)
  {
    id v13 = +[NSFileManager defaultManager];
    unsigned int v14 = [v13 fileExistsAtPath:v9 isDirectory:&v41];

    if (v14)
    {
      uint64_t v12 = [(BKLibraryDataSourcePlistImporting *)self p_destPathFromSrcPath:v9];
      id v15 = +[BKAssetUtilities contentTypeForPath:v12];
      id v16 = v15;
      if (v41) {
        BOOL v17 = 1;
      }
      else {
        BOOL v17 = v15 == 3;
      }
      uint64_t v18 = !v17;
      if (v17)
      {
        uint64_t v19 = 1;
        goto LABEL_23;
      }
      if (+[SFUZipArchive isZipArchiveAtPath:v9])
      {
        uint64_t v19 = 2;
LABEL_23:
        id v21 = +[BKPlistImportingAsset newBlankAsset];
        [v21 setAssetID:v8];
        v24 = [(BKLibraryDataSourcePlistImporting *)self identifier];
        [v21 setDataSourceIdentifier:v24];

        [v21 setContentType:v16];
        [v21 setState:v19];
        v25 = [[BKPlistImportingOperationAttributes alloc] initWithAssetID:v8 contentType:v16];
        [(BKPlistImportingOperationAttributes *)v25 setAsset:v21];
        [(BKPlistImportingOperationAttributes *)v25 setAssetSourcePath:v9];
        [(BKPlistImportingOperationAttributes *)v25 setImportCompletionBlock:v10];
        [(BKPlistImportingOperationAttributes *)v25 setIsZipArchive:v18];
        v26 = [(BKLibraryDataSourcePlistImporting *)self ivarSerialQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000DF528;
        block[3] = &unk_100A443C8;
        block[4] = self;
        id v27 = v8;
        id v39 = v27;
        v28 = v25;
        v40 = v28;
        dispatch_sync(v26, block);

        if (v18)
        {
          id v37 = 0;
          v29 = [(BKLibraryDataSourcePlistImporting *)self p_coverImageFromZipArchive:v9 error:&v37];
          id v35 = v37;
          if (v29)
          {
            v30 = +[BCCacheManager defaultCacheManager];
            [v30 addCGImage:[v29 CGImage] withIdentifier:v27 priority:3 quality:206];
          }
          v31 = [(BKLibraryDataSourcePlistImporting *)self libraryManager];
          [v31 libraryDataSource:self addedAsset:v21];

          uint64_t v32 = 1;
        }
        else
        {
          uint64_t v32 = 2;
        }
        v33 = objc_opt_new();
        [v33 setSourceFilePath:v9];
        [v33 setDestinationFilePath:v12];
        [v33 setSourceFileType:v32];
        [v33 setDelegate:self];
        [v33 setUserContext:v28];
        [v33 setForcedFileProtection:NSFileProtectionCompleteUntilFirstUserAuthentication];
        [v33 setFixFilePermissions:1];
        v34 = [(BKLibraryDataSourcePlistImporting *)self assetImportingQueue];
        [v34 addOperation:v33];

        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  id v20 = BKLibraryBookImportLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558274;
    uint64_t v43 = 1752392040;
    __int16 v44 = 2112;
    id v45 = v9;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "BKLibraryDataSourcePlistImporting: Not a valid asset.  Removing: %{mask.hash}@", buf, 0x16u);
  }

  id v21 = +[NSError errorWithDomain:kBKLibraryDataSourceDomain code:kBKLibraryDataSourceErrorInvalidAssetError userInfo:0];
  id v22 = objc_retainBlock(v10);
  v23 = v22;
  if (v22) {
    (*((void (**)(id, void, id))v22 + 2))(v22, 0, v21);
  }

  [(BKLibraryDataSourcePlistImporting *)self p_deletePath:v9];
LABEL_21:
}

- (void)extractOperationDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourcePlistImporting *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000DF638;
  v7[3] = &unk_100A43DD8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)extractOperationDidUpdateProgress:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourcePlistImporting *)self p_assetIdentifierFromExtractionFileOp:v4];
  if (v5)
  {
    [v4 progress];
    double v7 = v6;
    id v8 = BKLibraryBookImportLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v14 = [v4 destinationFilePath];
      *(_DWORD *)buf = 138412802;
      uint64_t v18 = v5;
      __int16 v19 = 2112;
      id v20 = v14;
      __int16 v21 = 2048;
      double v22 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[BKLibraryDataSourcePlistImporting] extractOperationDidUpdateProgress with assetID/path/progress [%@ | %@ | %f]", buf, 0x20u);
    }
    if (v7 >= 1.0) {
      uint64_t v9 = 5;
    }
    else {
      uint64_t v9 = 4;
    }
    id v10 = [objc_alloc((Class)BKLibraryDownloadStatus) initWithAssetID:v5 state:v9 progressValue:0 timeRemaining:0x7FFFFFFFFFFFFFFFLL bytesDownloaded:0x7FFFFFFFFFFFFFFFLL fileSize:v7];
    uint64_t v11 = +[NSSet setWithObject:](NSSet, "setWithObject:", v10, BKLibraryDownloadStatusKey);
    id v16 = v11;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

    id v13 = +[NSNotificationCenter defaultCenter];
    [v13 postNotificationName:BKLibraryDownloadStatusNotification object:self userInfo:v12];
  }
}

- (void)extractOperationDidFail:(id)a3
{
  id v4 = a3;
  id v5 = [(BKLibraryDataSourcePlistImporting *)self p_assetIdentifierFromExtractionFileOp:v4];
  double v6 = [(BKLibraryDataSourcePlistImporting *)self libraryManager];
  double v7 = [v6 libraryAssetOnMainQueueWithAssetID:v5];

  id v8 = BKLibraryBookImportLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1007E9FFC((uint64_t)v5, v4, v8);
  }

  if (v7)
  {
    uint64_t v9 = [(BKLibraryDataSourcePlistImporting *)self libraryManager];
    uint64_t v18 = v7;
    id v10 = +[NSArray arrayWithObjects:&v18 count:1];
    [v9 deleteAssets:v10 exhaustive:0];

LABEL_7:
    goto LABEL_8;
  }
  if (([v4 skipCleanupDestinationFile] & 1) == 0)
  {
    uint64_t v9 = [v4 destinationFilePath];
    [(BKLibraryDataSourcePlistImporting *)self p_deletePath:v9];
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v11 = [(BKLibraryDataSourcePlistImporting *)self ivarSerialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E04FC;
  block[3] = &unk_100A443C8;
  id v15 = v4;
  id v16 = self;
  id v17 = v5;
  id v12 = v5;
  id v13 = v4;
  dispatch_async(v11, block);
}

- (void)cleanupImportedFiles
{
  if (![(BKLibraryDataSourcePlistImporting *)self hasCleanedUpImportedFiles])
  {
    id v3 = dispatch_get_global_queue(17, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000E0744;
    block[3] = &unk_100A43D60;
    void block[4] = self;
    dispatch_async(v3, block);
  }
}

- (BOOL)_cleanupFileProtectionOnItemAtURL:(id)a3
{
  id v3 = a3;
  id v21 = 0;
  id v20 = 0;
  unsigned int v4 = [v3 getResourceValue:&v21 forKey:NSURLFileProtectionKey error:&v20];
  id v5 = v21;
  id v6 = v20;
  if (!v4)
  {
    id v10 = BCIMLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1007EA260();
    }
    BOOL v11 = 0;
    id v12 = v5;
    goto LABEL_19;
  }
  if (([v5 isEqualToString:NSURLFileProtectionComplete] & 1) == 0
    && ![v5 isEqualToString:NSURLFileProtectionCompleteUnlessOpen])
  {
    BOOL v11 = 1;
    goto LABEL_21;
  }
  id v19 = v6;
  unsigned __int8 v7 = [v3 setResourceValue:NSURLFileProtectionCompleteUntilFirstUserAuthentication forKey:NSURLFileProtectionKey error:&v19];
  id v8 = v19;

  if (v7)
  {
    int v9 = 0;
  }
  else
  {
    id v13 = BCIMLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1007EA1F8();
    }

    int v9 = 1;
  }
  id v17 = 0;
  id v18 = 0;
  unsigned int v14 = [v3 getResourceValue:&v18 forKey:NSURLFileProtectionKey error:&v17];
  id v12 = v18;

  id v6 = v17;
  if (!v14)
  {
    id v10 = BCIMLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1007EA190();
    }
    BOOL v11 = 0;
    goto LABEL_19;
  }
  unsigned int v15 = [v12 isEqualToString:NSURLFileProtectionCompleteUntilFirstUserAuthentication];
  BOOL v11 = (v9 | v15 ^ 1) == 0;
  if ((v15 & 1) == 0)
  {
    id v10 = BCIMLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1007EA118((uint64_t)v3, v10);
    }
LABEL_19:
  }
  id v5 = v12;
LABEL_21:

  return v11;
}

- (BOOL)_cleanupBackupAttributeOnItemAtURL:(id)a3
{
  id v3 = a3;
  id v15 = 0;
  id v14 = 0;
  unsigned int v4 = [v3 getResourceValue:&v15 forKey:NSURLIsExcludedFromBackupKey error:&v14];
  id v5 = v15;
  id v6 = v14;
  if (v4)
  {
    if (v5 && ![v5 BOOLValue])
    {
      BOOL v11 = 1;
      goto LABEL_15;
    }
    id v13 = v6;
    unsigned int v7 = [v3 setResourceValue:&__kCFBooleanFalse forKey:NSURLIsExcludedFromBackupKey error:&v13];
    id v8 = v13;

    int v9 = BCIMLog();
    id v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "success setting NSURLIsExcludedFromBackupKey to NO on %@", buf, 0xCu);
      }
      BOOL v11 = 1;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1007EA2C8();
      }
      BOOL v11 = 0;
    }
  }
  else
  {
    id v10 = BCIMLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1007EA330();
    }
    BOOL v11 = 0;
    id v8 = v6;
  }

  id v6 = v8;
LABEL_15:

  return v11;
}

- (void)setImportingDelegate:(id)a3
{
}

- (BKLibraryManager)libraryManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryManager);

  return (BKLibraryManager *)WeakRetained;
}

- (BKLibraryDataSourcePlistWriting)plistWriter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_plistWriter);

  return (BKLibraryDataSourcePlistWriting *)WeakRetained;
}

- (id)reloadCounterpartHandler
{
  return self->_reloadCounterpartHandler;
}

- (NSOperationQueue)assetImportingQueue
{
  return self->_assetImportingQueue;
}

- (void)setAssetImportingQueue:(id)a3
{
}

- (BKAssetMetadataCaching)metadataCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metadataCache);

  return (BKAssetMetadataCaching *)WeakRetained;
}

- (void)setMetadataCache:(id)a3
{
}

- (OS_dispatch_queue)ivarSerialQueue
{
  return self->_ivarSerialQueue;
}

- (void)setIvarSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSMutableDictionary)importingOperationsInFlight
{
  return self->_importingOperationsInFlight;
}

- (void)setImportingOperationsInFlight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importingOperationsInFlight, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_ivarSerialQueue, 0);
  objc_destroyWeak((id *)&self->_metadataCache);
  objc_storeStrong((id *)&self->_assetImportingQueue, 0);
  objc_storeStrong(&self->_reloadCounterpartHandler, 0);
  objc_destroyWeak((id *)&self->_plistWriter);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_libraryManager);

  objc_destroyWeak((id *)&self->_importingDelegate);
}

@end