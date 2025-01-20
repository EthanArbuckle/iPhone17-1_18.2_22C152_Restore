@interface MKPhotoLibrary
- (BOOL)copy:(id)a3 filename:(id)a4 error:(id *)a5;
- (BOOL)photoLibraryDidComplete:(id)a3 filename:(id)a4 originalFilename:(id)a5 success:(BOOL)a6 error:(id *)a7;
- (MKPhotoLibrary)init;
- (MKPhotoLibrary)initWithContentType:(unint64_t)a3;
- (NSString)rootPath;
- (id)addAsset:(id)a3;
- (id)assetCollection:(id)a3;
- (id)assetCollectionChangeRequest:(id)a3;
- (unint64_t)assetCount:(id)a3;
- (unint64_t)contentType;
- (unint64_t)countForCollection:(id)a3 error:(id *)a4;
- (void)addAsset:(id)a3 filename:(id)a4 originalFilename:(id)a5 size:(unint64_t)a6 completion:(id)a7;
- (void)init;
- (void)sendAnalytics;
- (void)setCollection:(id)a3 forLocalIdentifiers:(id)a4;
- (void)setContentType:(unint64_t)a3;
- (void)setRootPath:(id)a3;
@end

@implementation MKPhotoLibrary

- (MKPhotoLibrary)init
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)MKPhotoLibrary;
  v2 = [(MKPhotoLibrary *)&v26 init];
  v3 = v2;
  if (v2)
  {
    [(MKPhotoLibrary *)v2 setContentType:0];
    v4 = objc_alloc_init(MKFileProvider);
    v5 = [(MKFileProvider *)v4 fetchRootPath];

    if (v5)
    {
      v6 = MKLocalizedString(@"MOVE_TO_IOS");
      v7 = [v5 stringByAppendingPathComponent:v6];
      [(MKPhotoLibrary *)v3 setRootPath:v7];

      v8 = +[MKLog log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        rootPath = v3->_rootPath;
        *(_DWORD *)buf = 138412290;
        v28 = rootPath;
        _os_log_impl(&dword_22BFAC000, v8, OS_LOG_TYPE_INFO, "file_storage=%@", buf, 0xCu);
      }

      v10 = [MEMORY[0x263F08850] defaultManager];
      char v11 = [v10 fileExistsAtPath:v3->_rootPath];

      if ((v11 & 1) == 0)
      {
        v12 = [MEMORY[0x263F08850] defaultManager];
        v13 = v3->_rootPath;
        id v25 = 0;
        [v12 createDirectoryAtPath:v13 withIntermediateDirectories:0 attributes:0 error:&v25];
        id v14 = v25;

        if (v14)
        {
          v15 = +[MKLog log];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            [(MKPhotoLibrary *)(uint64_t)v14 init];
          }
        }
      }
    }
    v22 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    importErrors = v3->_importErrors;
    v3->_importErrors = v22;
  }
  return v3;
}

- (MKPhotoLibrary)initWithContentType:(unint64_t)a3
{
  v4 = [(MKPhotoLibrary *)self init];
  v5 = v4;
  if (v4)
  {
    [(MKPhotoLibrary *)v4 setContentType:a3];
    BOOL v6 = a3 == 0;
    if (a3) {
      uint64_t v7 = 10;
    }
    else {
      uint64_t v7 = 9;
    }
    v8 = off_264905920;
    if (!v6) {
      v8 = &off_264905940;
    }
    v9 = (MKAssetDecoder *)objc_alloc_init(*v8);
    decoder = v5->_decoder;
    v5->_decoder = v9;

    char v11 = [[MKImportAnalytics alloc] initWithContentType:v7];
    analytics = v5->_analytics;
    v5->_analytics = v11;
  }
  return v5;
}

- (void)sendAnalytics
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_importCount || [(NSMutableSet *)self->_importErrors count])
  {
    uint64_t v3 = [(NSMutableSet *)self->_importErrors count];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = self->_importErrors;
    uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          -[MKImportAnalytics send:](self->_analytics, "send:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    [(MKImportAnalytics *)self->_analytics complete:v3 == 0];
  }
}

- (void)addAsset:(id)a3 filename:(id)a4 originalFilename:(id)a5 size:(unint64_t)a6 completion:(id)a7
{
  v56[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (v12 && v13)
  {
    BOOL v16 = a6 == 0;
    uint64_t v17 = +[MKLog log];
    uint64_t v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MKPhotoLibrary addAsset:filename:originalFilename:size:completion:](v18, v25, v26, v27, v28, v29, v30, v31);
      }

      if (v15)
      {
        v32 = (void *)MEMORY[0x263F087E8];
        uint64_t v53 = *MEMORY[0x263F08320];
        v54 = @"detected an invalid asset because the file size was zero.";
        v33 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        v34 = [v32 errorWithDomain:@"MKPhotoLibraryError" code:1 userInfo:v33];

        (*((void (**)(id, void, void, void, void *))v15 + 2))(v15, 0, 0, 0, v34);
      }
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22BFAC000, v18, OS_LOG_TYPE_INFO, "PHPhotoLibrary will import an asset.", buf, 2u);
      }

      *(void *)buf = 0;
      v48 = buf;
      uint64_t v49 = 0x3032000000;
      v50 = __Block_byref_object_copy__2;
      v51 = __Block_byref_object_dispose__2;
      id v52 = 0;
      objc_initWeak(&location, self);
      uint64_t v19 = [MEMORY[0x263F14E98] sharedPhotoLibrary];
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __69__MKPhotoLibrary_addAsset_filename_originalFilename_size_completion___block_invoke;
      v42[3] = &unk_264906140;
      objc_copyWeak(&v45, &location);
      v44 = buf;
      id v20 = v12;
      id v43 = v20;
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __69__MKPhotoLibrary_addAsset_filename_originalFilename_size_completion___block_invoke_2;
      v35[3] = &unk_264906168;
      objc_copyWeak(&v41, &location);
      v40 = buf;
      id v36 = v20;
      id v37 = v13;
      id v38 = v14;
      id v39 = v15;
      [v19 performChanges:v42 completionHandler:v35];

      objc_destroyWeak(&v41);
      objc_destroyWeak(&v45);
      objc_destroyWeak(&location);
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    uint64_t v21 = +[MKLog log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MKPhotoLibrary addAsset:filename:originalFilename:size:completion:]((uint64_t)v12, (uint64_t)v13, v21);
    }

    if (v15)
    {
      v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v55 = *MEMORY[0x263F08320];
      v56[0] = @"detected an invalid asset because either path or filename is nil.";
      v23 = [NSDictionary dictionaryWithObjects:v56 forKeys:&v55 count:1];
      v24 = [v22 errorWithDomain:@"MKPhotoLibraryError" code:1 userInfo:v23];

      (*((void (**)(id, void, void, void, void *))v15 + 2))(v15, 0, 0, 0, v24);
    }
  }
}

void __69__MKPhotoLibrary_addAsset_filename_originalFilename_size_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [WeakRetained addAsset:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __69__MKPhotoLibrary_addAsset_filename_originalFilename_size_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v7 = +[MKLog log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v18 = a2;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_22BFAC000, v7, OS_LOG_TYPE_INFO, "PHPhotoLibrary did import an asset. success=%d, error=%@", buf, 0x12u);
  }

  if ((a2 & 1) == 0)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    long long v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
  uint64_t v10 = [v5 code];
  if (v10 != 3301)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    id v16 = v5;
    a2 = [WeakRetained photoLibraryDidComplete:v11 filename:v12 originalFilename:v13 success:a2 error:&v16];
    id v14 = v16;

    id v5 = v14;
  }
  uint64_t v15 = *(void *)(a1 + 56);
  if (v15) {
    (*(void (**)(uint64_t, uint64_t, BOOL, void, id))(v15 + 16))(v15, a2, v10 == 3301, *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v5);
  }
}

- (unint64_t)countForCollection:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v7 = (void *)MEMORY[0x230F5C060]();
  uint64_t v8 = [MEMORY[0x263F14E98] sharedPhotoLibrary];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__MKPhotoLibrary_countForCollection_error___block_invoke;
  v14[3] = &unk_264906190;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  id v16 = &v17;
  [v8 performChangesAndWait:v14 error:a4];

  uint64_t v10 = +[MKLog log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    if (a4) {
      id v11 = *a4;
    }
    else {
      id v11 = 0;
    }
    *(_DWORD *)buf = 138412290;
    id v22 = v11;
    _os_log_impl(&dword_22BFAC000, v10, OS_LOG_TYPE_INFO, "PHPhotoLibrary did set collections. error=%@", buf, 0xCu);
  }

  unint64_t v12 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v12;
}

void __43__MKPhotoLibrary_countForCollection_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) assetCollection:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) assetCount:v2];
}

- (void)setCollection:(id)a3 forLocalIdentifiers:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length] && objc_msgSend(v7, "count"))
  {
    uint64_t v8 = (void *)MEMORY[0x230F5C060]();
    id v9 = [MEMORY[0x263F14E98] sharedPhotoLibrary];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __52__MKPhotoLibrary_setCollection_forLocalIdentifiers___block_invoke;
    v13[3] = &unk_2649061B8;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    id v12 = 0;
    [v9 performChangesAndWait:v13 error:&v12];
    id v10 = v12;

    id v11 = +[MKLog log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v10;
      _os_log_impl(&dword_22BFAC000, v11, OS_LOG_TYPE_INFO, "PHPhotoLibrary did set collections. error=%@", buf, 0xCu);
    }
  }
}

void __52__MKPhotoLibrary_setCollection_forLocalIdentifiers___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) assetCollectionChangeRequest:*(void *)(a1 + 40)];
  if (v4)
  {
    id v2 = objc_opt_new();
    uint64_t v3 = [MEMORY[0x263F14D18] fetchAssetsWithLocalIdentifiers:*(void *)(a1 + 48) options:v2];
    [v4 addAssets:v3];
  }
}

- (id)addAsset:(id)a3
{
  id v4 = [NSURL fileURLWithPath:a3];
  if (self->_contentType) {
    [MEMORY[0x263F14D20] creationRequestForAssetFromVideoAtFileURL:v4];
  }
  else {
  id v5 = [MEMORY[0x263F14D20] creationRequestForAssetFromImageAtFileURL:v4];
  }
  id v6 = [v5 placeholderForCreatedAsset];
  id v7 = [v6 localIdentifier];

  return v7;
}

- (BOOL)photoLibraryDidComplete:(id)a3 filename:(id)a4 originalFilename:(id)a5 success:(BOOL)a6 error:(id *)a7
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (a6)
  {
    ++self->_importCount;
    BOOL v15 = 1;
    if (!a7) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  if (!a7)
  {
    uint64_t v17 = 0;
    id v16 = @"unknown";
    goto LABEL_9;
  }
  id v16 = [*a7 domain];
  uint64_t v17 = [*a7 code];
  if (v17 != 3302)
  {
LABEL_9:
    uint64_t v18 = [NSString stringWithFormat:@"%@.%ld", v16, v17];
    [(NSMutableSet *)self->_importErrors addObject:v18];
    goto LABEL_10;
  }
  if (!self->_decoder) {
    goto LABEL_11;
  }
  uint64_t v18 = [NSString stringWithFormat:@"%@.%ld", v16, 3302];
  [(NSMutableSet *)self->_importErrors addObject:v18];
  uint64_t v19 = [(MKAssetDecoder *)self->_decoder extractFormatOfAsset:v12];
  analytics = self->_analytics;
  [v12 pathExtension];
  v22 = uint64_t v21 = v16;
  [(MKImportAnalytics *)analytics send:v19 extension:v22];

  id v16 = v21;
  decoder = self->_decoder;
  self->_decoder = 0;

LABEL_10:
LABEL_11:
  id v24 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v14 length])
  {
    id v39 = v16;
    id v40 = v13;
    [v24 addObject:v14];
    rootPath = self->_rootPath;
    uint64_t v26 = [v14 stringByDeletingLastPathComponent];
    uint64_t v27 = [(NSString *)rootPath stringByAppendingPathComponent:v26];

    uint64_t v28 = [MEMORY[0x263F08850] defaultManager];
    id v45 = 0;
    int v29 = [v28 createDirectoryAtPath:v27 withIntermediateDirectories:1 attributes:0 error:&v45];
    id v30 = v45;

    uint64_t v31 = +[MKLog log];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = [v30 description];
      *(_DWORD *)buf = 67109379;
      int v48 = v29;
      __int16 v49 = 2113;
      v50 = v32;
      _os_log_impl(&dword_22BFAC000, v31, OS_LOG_TYPE_INFO, "did create directory. success=%d, error=%{private}@", buf, 0x12u);
    }
    id v16 = v39;
    id v13 = v40;
  }
  [v24 addObject:v13];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v33 = v24;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v42;
    while (2)
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(v33);
        }
        if ([(MKPhotoLibrary *)self copy:v12 filename:*(void *)(*((void *)&v41 + 1) + 8 * i) error:a7])
        {
          BOOL v15 = 1;
          goto LABEL_25;
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v35) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_25:

  if (a7)
  {
LABEL_26:
    if (v15) {
      *a7 = 0;
    }
  }
LABEL_28:

  return v15;
}

- (BOOL)copy:(id)a3 filename:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  rootPath = self->_rootPath;
  if (rootPath)
  {
    id v11 = [(NSString *)rootPath stringByAppendingPathComponent:v9];
    id v12 = [MEMORY[0x263F08850] defaultManager];
    if ([v12 fileExistsAtPath:v11])
    {
      uint64_t v31 = a5;
      id v33 = v8;
      id v13 = [v9 stringByDeletingPathExtension];
      id v32 = v9;
      id v14 = [v9 pathExtension];
      uint64_t v15 = 0;
      while (1)
      {
        id v16 = [NSString stringWithFormat:@"%@ %ld", v13, v15 + 2];
        if ([v14 length])
        {
          uint64_t v17 = [v16 stringByAppendingFormat:@".%@", v14];

          id v16 = (void *)v17;
        }
        uint64_t v18 = [(NSString *)self->_rootPath stringByAppendingPathComponent:v16];

        char v19 = [v12 fileExistsAtPath:v18];
        if ((v19 & 1) == 0) {
          break;
        }
        ++v15;
        id v11 = v18;
        if (v15 == 2147483645)
        {

          LOBYTE(v20) = 0;
          id v9 = v32;
          id v8 = v33;
          goto LABEL_20;
        }
      }

      id v9 = v32;
      id v8 = v33;
      a5 = v31;
    }
    else
    {
      uint64_t v18 = v11;
    }
    int v20 = [v12 moveItemAtPath:v8 toPath:v18 error:a5];
    uint64_t v28 = +[MKLog log];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v35 = v20;
      _os_log_impl(&dword_22BFAC000, v28, OS_LOG_TYPE_INFO, "Local File Storage did import an asset. success=%d", buf, 8u);
    }

    char v29 = v20 ^ 1;
    if (!a5) {
      char v29 = 1;
    }
    if ((v29 & 1) == 0)
    {
      *a5 = 0;
      LOBYTE(v20) = 1;
    }
  }
  else
  {
    uint64_t v21 = +[MKLog log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MKPhotoLibrary copy:filename:error:]((uint64_t)self, v21, v22, v23, v24, v25, v26, v27);
    }

    LOBYTE(v20) = 0;
  }
LABEL_20:

  return v20;
}

- (id)assetCollectionChangeRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(MKPhotoLibrary *)self assetCollection:v4];
  if (v5) {
    [MEMORY[0x263F14D30] changeRequestForAssetCollection:v5];
  }
  else {
  id v6 = [MEMORY[0x263F14D30] creationRequestForAssetCollectionWithTitle:v4];
  }

  return v6;
}

- (id)assetCollection:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"localizedTitle = %@", v3];

  [v4 setPredicate:v5];
  id v6 = [MEMORY[0x263F14D28] fetchAssetCollectionsWithType:1 subtype:2 options:v4];
  id v7 = [v6 firstObject];

  return v7;
}

- (unint64_t)assetCount:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = (void *)MEMORY[0x263F14D18];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [v3 fetchAssetsInAssetCollection:v4 options:v5];

  unint64_t v7 = [v6 count];
  return v7;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (void)setRootPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_importErrors, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_1(&dword_22BFAC000, a2, a3, "error=%@", a5, a6, a7, a8, 2u);
}

- (void)addAsset:(os_log_t)log filename:originalFilename:size:completion:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_22BFAC000, log, OS_LOG_TYPE_ERROR, "path=%@, filename=%@", (uint8_t *)&v3, 0x16u);
}

- (void)addAsset:(uint64_t)a3 filename:(uint64_t)a4 originalFilename:(uint64_t)a5 size:(uint64_t)a6 completion:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_22BFAC000, a1, a3, "size=%ld", a5, a6, a7, a8, 0);
}

- (void)copy:(uint64_t)a3 filename:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end