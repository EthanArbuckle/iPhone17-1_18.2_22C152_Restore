@interface MKPhotoLibraryMigrator
- (BOOL)importAndWait;
- (BOOL)importAssetAndWait:(id)a3 retryNeeded:(BOOL *)a4;
- (BOOL)isBusy;
- (BOOL)shouldRetry;
- (MKPhotoLibraryAlbumMigrator)albumMigrator;
- (MKPhotoLibraryMigrator)initWithType:(unint64_t)a3;
- (MKPhotoLibraryMigrator)initWithType:(unint64_t)a3 reuseDatabase:(BOOL)a4;
- (NSString)path;
- (void)addImportTime:(id)a3;
- (void)addToAssetQueue:(id)a3;
- (void)import;
- (void)import:(id)a3 identifier:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 total:(unint64_t)a7 filename:(id)a8 collection:(id)a9 originalFilename:(id)a10 complete:(BOOL)a11;
- (void)importChunk:(id)a3 identifier:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 total:(unint64_t)a7 filename:(id)a8 collection:(id)a9 originalFilename:(id)a10 complete:(BOOL)a11;
- (void)photoLibraryDidAddAsset:(id)a3 identifier:(id)a4;
- (void)photoLibraryDidInterruptAsset:(id)a3;
- (void)photoLibraryDidSetIdentifier:(id)a3 forAsset:(id)a4;
- (void)photoLibraryWillAddAsset;
- (void)resetInterruptionCount;
- (void)retry;
- (void)setAlbumMigrator:(id)a3;
- (void)setIsBusy:(BOOL)a3;
- (void)setPath:(id)a3;
@end

@implementation MKPhotoLibraryMigrator

- (MKPhotoLibraryMigrator)initWithType:(unint64_t)a3
{
  return [(MKPhotoLibraryMigrator *)self initWithType:a3 reuseDatabase:0];
}

- (MKPhotoLibraryMigrator)initWithType:(unint64_t)a3 reuseDatabase:(BOOL)a4
{
  if (a3 == 2)
  {
    v4 = 0;
  }
  else
  {
    BOOL v5 = a4;
    v23.receiver = self;
    v23.super_class = (Class)MKPhotoLibraryMigrator;
    v7 = [(MKMigrator *)&v23 init];
    v8 = v7;
    if (v7)
    {
      v7->_isBusy = 0;
      dispatch_queue_t v9 = dispatch_queue_create("com.apple.migrationkit.migrator.photolibrary.asset", 0);
      assetQueue = v8->_assetQueue;
      v8->_assetQueue = (OS_dispatch_queue *)v9;

      v11 = [MKPhotoLibrary alloc];
      if (a3) {
        v12 = @"video";
      }
      else {
        v12 = @"image";
      }
      if (a3) {
        uint64_t v13 = 12;
      }
      else {
        uint64_t v13 = 11;
      }
      uint64_t v14 = [(MKPhotoLibrary *)v11 initWithContentType:a3 != 0];
      photoLibrary = v8->_photoLibrary;
      v8->_photoLibrary = (MKPhotoLibrary *)v14;

      v16 = NSHomeDirectory();
      v17 = [v16 stringByAppendingPathComponent:@"/Library/MigrationKit/"];

      uint64_t v18 = [v17 stringByAppendingPathComponent:v12];
      root = v8->_root;
      v8->_root = (NSString *)v18;

      v20 = [[MKPhotoLibraryAssetDatabase alloc] initWithType:a3 reuse:v5];
      db = v8->_db;
      v8->_db = v20;

      v8->_type = a3;
      [(MKMigrator *)v8 setType:v13];
    }
    self = v8;
    v4 = self;
  }

  return v4;
}

- (void)importChunk:(id)a3 identifier:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 total:(unint64_t)a7 filename:(id)a8 collection:(id)a9 originalFilename:(id)a10 complete:(BOOL)a11
{
  id v25 = a3;
  id v17 = a4;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v21 = self;
  uint64_t v22 = objc_sync_enter(v21);
  objc_super v23 = (void *)MEMORY[0x230F5C060](v22);
  LOBYTE(v24) = a11;
  [(MKPhotoLibraryMigrator *)v21 import:v25 identifier:v17 offset:a5 length:a6 total:a7 filename:v18 collection:v19 originalFilename:v20 complete:v24];
  objc_sync_exit(v21);
}

- (void)import:(id)a3 identifier:(id)a4 offset:(unint64_t)a5 length:(unint64_t)a6 total:(unint64_t)a7 filename:(id)a8 collection:(id)a9 originalFilename:(id)a10 complete:(BOOL)a11
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  if ([v18 length] && objc_msgSend(v19, "length"))
  {
    unint64_t v55 = a5;
    v56 = v17;
    uint64_t v22 = [v20 lowercaseString];
    int v23 = [v22 isEqualToString:@"camera"];

    unint64_t v53 = a6;
    if (v23)
    {

      id v20 = 0;
    }
    uint64_t v24 = [MEMORY[0x263EFF910] date];
    id v25 = self->_root;
    v26 = [v18 lastPathComponent];
    uint64_t v27 = objc_msgSend(v26, "substringWithRange:", 0, 1);

    v28 = (void *)v27;
    v54 = v25;
    v29 = [(NSString *)v25 stringByAppendingPathComponent:v27];
    v59 = [v29 stringByAppendingPathComponent:v19];
    v58 = [MEMORY[0x263F08850] defaultManager];
    v57 = 0;
    if (([v58 fileExistsAtPath:v29] & 1) == 0)
    {
      id v61 = 0;
      [v58 createDirectoryAtPath:v29 withIntermediateDirectories:1 attributes:0 error:&v61];
      id v30 = v61;
      if (v30)
      {
        v57 = v30;
        unint64_t v31 = a7;
        v32 = +[MKLog log];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[MKFileMigrator import:filename:offset:length:total:complete:].cold.4();
        }

        a7 = v31;
      }
      else
      {
        v57 = 0;
      }
    }
    if (v55)
    {
      unint64_t v51 = a7;
      id v60 = 0;
      v33 = [v58 attributesOfItemAtPath:v59 error:&v60];
      v34 = (MKPhotoLibraryAsset *)v60;
      if (v34)
      {
        v35 = v34;
        v36 = v29;
        v37 = +[MKLog log];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          -[MKFileMigrator import:filename:offset:length:total:complete:]();
        }

        v29 = v36;
LABEL_40:

        goto LABEL_41;
      }
      id v50 = v21;
      v38 = [v33 objectForKey:*MEMORY[0x263F080B8]];
      uint64_t v39 = [v38 unsignedLongLongValue];

      if (v39 == v55)
      {
        v49 = v33;
        v40 = [MEMORY[0x263F08840] fileHandleForWritingAtPath:v59];
        [v40 seekToEndOfFile];
        [v40 writeData:v56];
        [v40 synchronizeFile];
        v48 = v40;
        [v40 closeFile];
        v41 = +[MKLog log];
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          uint64_t v42 = [v56 length];
          *(_DWORD *)buf = 134217984;
          uint64_t v63 = v42;
          _os_log_impl(&dword_22BFAC000, v41, OS_LOG_TYPE_INFO, "appended some bytes to a file. bytes=%ld", buf, 0xCu);
        }

        id v21 = v50;
        a7 = v51;
        BOOL v43 = a11;
        if (v55 + v53 == v51) {
          BOOL v43 = 1;
        }
        goto LABEL_34;
      }
      id v21 = v50;
      BOOL v44 = v39 == v51;
      a7 = v51;
      if (!v44)
      {
        v49 = v33;
        v45 = +[MKLog log];
        BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_ERROR);
        v48 = v45;
        if (v46) {
          -[MKFileMigrator import:filename:offset:length:total:complete:](v45);
        }
        BOOL v43 = a11;
LABEL_34:

        [(MKPhotoLibraryMigrator *)self addImportTime:v24];
        if (!v43)
        {
LABEL_41:

          id v17 = v56;
          goto LABEL_42;
        }
        goto LABEL_35;
      }

      [(MKPhotoLibraryMigrator *)self addImportTime:v24];
    }
    else
    {
      if (([v58 fileExistsAtPath:v59] & 1) == 0) {
        [v56 writeToFile:v59 atomically:1];
      }
      [(MKPhotoLibraryMigrator *)self addImportTime:v24];
      if (v53 != a7 && !a11) {
        goto LABEL_41;
      }
    }
LABEL_35:
    v52 = v29;
    v47 = +[MKLog log];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v63 = (uint64_t)v59;
      _os_log_impl(&dword_22BFAC000, v47, OS_LOG_TYPE_INFO, "will add a file to asset queue. file=%@", buf, 0xCu);
    }

    if (!a7) {
      a7 = objc_msgSend(v58, "mk_fileSizeAtPath:", v59);
    }
    v35 = [[MKPhotoLibraryAsset alloc] initWithPath:v59 filename:v19 collection:v20 originalFilename:v21 size:a7];
    [(MKPhotoLibraryAssetDatabase *)self->_db addAsset:v35];
    [(MKMigrator *)self migratorDidImport];
    [(MKMigrator *)self migratorDidAppendDataSize:[(MKPhotoLibraryAsset *)v35 size]];
    v29 = v52;
    goto LABEL_40;
  }
  uint64_t v24 = +[MKLog log];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[MKPhotoLibraryMigrator import:identifier:offset:length:total:filename:collection:originalFilename:complete:]();
  }
LABEL_42:
}

- (void)addToAssetQueue:(id)a3
{
  [(MKPhotoLibraryAssetDatabase *)self->_db addAsset:a3];
  v4 = [(MKMigrator *)self delegate];
  [v4 migratorWillExecuteOperation:self];

  [(MKPhotoLibraryMigrator *)self photoLibraryWillAddAsset];
}

- (void)photoLibraryWillAddAsset
{
  if (!self->_isBusy)
  {
    if ([(MKPhotoLibraryAssetDatabase *)self->_db count])
    {
      self->_isBusy = 1;
      v3 = [MEMORY[0x263EFF910] date];
      v4 = [(MKPhotoLibraryAssetDatabase *)self->_db asset];
      BOOL v5 = [v4 path];
      v6 = [v4 filename];
      v7 = [v4 originalFilename];
      uint64_t v8 = [v4 size];
      BOOL v9 = [(MKPhotoLibraryMigrator *)self shouldRetry];
      objc_initWeak(&location, self);
      photoLibrary = self->_photoLibrary;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __50__MKPhotoLibraryMigrator_photoLibraryWillAddAsset__block_invoke;
      v14[3] = &unk_264905E68;
      objc_copyWeak(&v18, &location);
      id v11 = v5;
      id v15 = v11;
      BOOL v19 = v9;
      id v12 = v3;
      id v16 = v12;
      id v13 = v4;
      id v17 = v13;
      [(MKPhotoLibrary *)photoLibrary addAsset:v11 filename:v6 originalFilename:v7 size:v8 completion:v14];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
}

void __50__MKPhotoLibraryMigrator_photoLibraryWillAddAsset__block_invoke(uint64_t a1, int a2, int a3, void *a4, void *a5)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v12 = +[MKLog log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)uint64_t v24 = a2;
    *(_WORD *)&v24[4] = 1024;
    *(_DWORD *)&v24[6] = a3;
    __int16 v25 = 2112;
    uint64_t v26 = v13;
    __int16 v27 = 2112;
    id v28 = v10;
    _os_log_impl(&dword_22BFAC000, v12, OS_LOG_TYPE_INFO, "did import a media file. success=%d, interrupted=%d, file=%@, error=%@", buf, 0x22u);
  }

  if (a3 && *(unsigned char *)(a1 + 64))
  {
    uint64_t v14 = +[MKLog log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v24 = v15;
      _os_log_impl(&dword_22BFAC000, v14, OS_LOG_TYPE_INFO, "will retry to import an asset. file=%@", buf, 0xCu);
    }

    [WeakRetained addImportTime:*(void *)(a1 + 40)];
    [WeakRetained photoLibraryDidInterruptAsset:*(void *)(a1 + 48)];
  }
  else
  {
    if (v10)
    {
      id v16 = [MEMORY[0x263F08850] defaultManager];
      int v17 = [v16 isDeletableFileAtPath:*(void *)(a1 + 32)];

      if (v17)
      {
        id v18 = [MEMORY[0x263F08850] defaultManager];
        uint64_t v19 = *(void *)(a1 + 32);
        id v22 = 0;
        [v18 removeItemAtPath:v19 error:&v22];
        id v20 = v22;

        if (v20)
        {
          id v21 = +[MKLog log];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.6();
          }
        }
      }
    }
    [WeakRetained addImportTime:*(void *)(a1 + 40)];
    [WeakRetained photoLibraryDidAddAsset:*(void *)(a1 + 48) identifier:v9];
  }
}

- (BOOL)shouldRetry
{
  return self->_interruptionCount < 0xB;
}

- (void)retry
{
  ++self->_interruptionCount;
  [(MKPhotoLibraryMigrator *)self setIsBusy:0];
  [(MKPhotoLibraryMigrator *)self photoLibraryWillAddAsset];
}

- (void)resetInterruptionCount
{
  self->_interruptionCount = 0;
}

- (void)photoLibraryDidInterruptAsset:(id)a3
{
  objc_initWeak(&location, self);
  assetQueue = self->_assetQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__MKPhotoLibraryMigrator_photoLibraryDidInterruptAsset___block_invoke;
  v5[3] = &unk_264905E90;
  objc_copyWeak(&v6, &location);
  dispatch_async(assetQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__MKPhotoLibraryMigrator_photoLibraryDidInterruptAsset___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained retry];
}

- (void)photoLibraryDidAddAsset:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  assetQueue = self->_assetQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__MKPhotoLibraryMigrator_photoLibraryDidAddAsset_identifier___block_invoke;
  v11[3] = &unk_264905EB8;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(assetQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __61__MKPhotoLibraryMigrator_photoLibraryDidAddAsset_identifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained resetInterruptionCount];
  [WeakRetained photoLibraryDidSetIdentifier:*(void *)(a1 + 32) forAsset:*(void *)(a1 + 40)];
  [WeakRetained setIsBusy:0];
  [WeakRetained photoLibraryWillAddAsset];
}

- (void)photoLibraryDidSetIdentifier:(id)a3 forAsset:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if ([v11 length])
  {
    [(MKMigrator *)self migratorDidImport];
    -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", [v6 size]);
    id v7 = [v6 collection];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_albumMigrator);
      [WeakRetained setIdentifier:v11 forAsset:v6];
    }
  }
  else
  {
    [(MKMigrator *)self migratorDidFailWithImportError:0];
  }
  [(MKPhotoLibraryAssetDatabase *)self->_db remove:v6];
  id v10 = [(MKMigrator *)self delegate];
  [v10 migratorDidExecuteOperation:self];
}

- (void)import
{
  [(MKPhotoLibrary *)self->_photoLibrary close];
  db = self->_db;
  self->_db = 0;

  v4.receiver = self;
  v4.super_class = (Class)MKPhotoLibraryMigrator;
  [(MKMigrator *)&v4 import];
}

- (void)addImportTime:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[MKAnalytics sharedInstance];
  objc_sync_enter(v5);
  unint64_t type = self->_type;
  if (type == 1)
  {
    id v7 = [v5 payload];
    uint64_t v8 = [v7 videos];
  }
  else
  {
    if (type) {
      goto LABEL_7;
    }
    id v7 = [v5 payload];
    uint64_t v8 = [v7 photos];
  }
  id v9 = v8;

  if (v9)
  {
    id v10 = [MEMORY[0x263EFF910] date];
    [v10 timeIntervalSinceDate:v4];
    double v12 = v11;

    id v13 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v12];
    id v14 = [v9 importElapsedTime];
    uint64_t v15 = [v14 decimalNumberByAdding:v13];
    [v9 setImportElapsedTime:v15];

    goto LABEL_9;
  }
LABEL_7:
  id v9 = +[MKLog log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    unint64_t v16 = self->_type;
    v17[0] = 67109120;
    v17[1] = v16;
    _os_log_impl(&dword_22BFAC000, v9, OS_LOG_TYPE_INFO, "Not adding import time for unknown type: %ul", (uint8_t *)v17, 8u);
  }
LABEL_9:

  objc_sync_exit(v5);
}

- (BOOL)importAndWait
{
  uint64_t v3 = [(MKPhotoLibraryAssetDatabase *)self->_db asset];
  if (v3)
  {
    id v4 = (void *)v3;
    do
    {
      unint64_t v5 = 0;
      char v9 = 1;
      do
      {
        if (v9) {
          BOOL v6 = v5 > 0xA;
        }
        else {
          BOOL v6 = 1;
        }
        if (v6) {
          break;
        }
        ++v5;
      }
      while (![(MKPhotoLibraryMigrator *)self importAssetAndWait:v4 retryNeeded:&v9]);
      [(MKPhotoLibraryAssetDatabase *)self->_db remove:v4];
      uint64_t v7 = [(MKPhotoLibraryAssetDatabase *)self->_db asset];

      id v4 = (void *)v7;
    }
    while (v7);
  }
  return 1;
}

- (BOOL)importAssetAndWait:(id)a3 retryNeeded:(BOOL *)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v25 = a3;
  BOOL v6 = [v25 path];
  uint64_t v24 = [v25 filename];
  int v23 = [v25 originalFilename];
  uint64_t v7 = [v25 size];
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x2020000000;
  char v56 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  char v52 = 0;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  BOOL v44 = __Block_byref_object_copy__0;
  v45 = __Block_byref_object_dispose__0;
  id v46 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  uint64_t v39 = __Block_byref_object_dispose__0;
  id v40 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  [(MKMigrator *)self migratorWillMeasureImport];
  photoLibrary = self->_photoLibrary;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __57__MKPhotoLibraryMigrator_importAssetAndWait_retryNeeded___block_invoke;
  v27[3] = &unk_264905EE0;
  id v10 = v6;
  id v28 = v10;
  id v30 = &v53;
  unint64_t v31 = v51;
  v32 = &v47;
  v33 = &v41;
  v34 = &v35;
  double v11 = v8;
  uint64_t v29 = v11;
  [(MKPhotoLibrary *)photoLibrary addAsset:v10 filename:v24 originalFilename:v23 size:v7 completion:v27];
  if (!*((unsigned char *)v54 + 24)) {
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
  [(MKMigrator *)self migratorDidMeasureImport];
  int v12 = *((unsigned __int8 *)v48 + 24);
  if (*((unsigned char *)v48 + 24))
  {
    id v13 = +[MKLog log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v58 = v10;
      _os_log_impl(&dword_22BFAC000, v13, OS_LOG_TYPE_INFO, "will retry to import an asset. file=%@", buf, 0xCu);
    }

    *a4 = 1;
  }
  else
  {
    if (v42[5])
    {
      uint64_t v15 = [MEMORY[0x263F08850] defaultManager];
      int v16 = [v15 isDeletableFileAtPath:v10];

      if (v16)
      {
        int v17 = [MEMORY[0x263F08850] defaultManager];
        id v26 = 0;
        [v17 removeItemAtPath:v10 error:&v26];
        id v18 = v26;

        if (v18)
        {
          uint64_t v19 = +[MKLog log];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            -[MKContainerMigrator import:signature:chunk:filename:offset:length:total:required:excludedFromBackup:complete:].cold.6();
          }
        }
      }
    }
    if ([(id)v36[5] length])
    {
      [(MKMigrator *)self migratorDidImport];
      -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", [v25 size]);
      id v20 = [v25 collection];
      BOOL v21 = [v20 length] == 0;

      if (!v21)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_albumMigrator);
        [WeakRetained setIdentifier:v36[5] forAsset:v25];
      }
    }
    else
    {
      [(MKMigrator *)self migratorDidFailWithImportError:0];
    }
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(v51, 8);
  _Block_object_dispose(&v53, 8);

  return v12 == 0;
}

void __57__MKPhotoLibraryMigrator_importAssetAndWait_retryNeeded___block_invoke(uint64_t a1, int a2, int a3, void *a4, void *a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  double v11 = +[MKLog log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    v19[0] = 67109890;
    v19[1] = a2;
    __int16 v20 = 1024;
    int v21 = a3;
    __int16 v22 = 2112;
    uint64_t v23 = v12;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl(&dword_22BFAC000, v11, OS_LOG_TYPE_INFO, "did import a media file. success=%d, interrupted=%d, file=%@, error=%@", (uint8_t *)v19, 0x22u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
  uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v10;
  id v15 = v10;

  uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8);
  int v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v9;
  id v18 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (MKPhotoLibraryAlbumMigrator)albumMigrator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_albumMigrator);
  return (MKPhotoLibraryAlbumMigrator *)WeakRetained;
}

- (void)setAlbumMigrator:(id)a3
{
}

- (BOOL)isBusy
{
  return self->_isBusy;
}

- (void)setIsBusy:(BOOL)a3
{
  self->_isBusy = a3;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_destroyWeak((id *)&self->_albumMigrator);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_assetQueue, 0);
}

- (void)import:identifier:offset:length:total:filename:collection:originalFilename:complete:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_22BFAC000, v0, v1, "%@ can't continue to import a media file because no identifier or filename found.", v2, v3, v4, v5, v6);
}

@end