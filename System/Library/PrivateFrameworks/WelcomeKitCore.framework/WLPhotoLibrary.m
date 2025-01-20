@interface WLPhotoLibrary
- (BOOL)copy:(id)a3 filename:(id)a4 error:(id *)a5;
- (BOOL)photoLibraryDidComplete:(id)a3 filename:(id)a4 success:(BOOL)a5 error:(id *)a6;
- (NSString)rootPath;
- (WLPhotoLibrary)init;
- (WLPhotoLibrary)initWithContentType:(unint64_t)a3;
- (id)assetCollectionChangeRequest:(id)a3;
- (unint64_t)contentType;
- (unint64_t)errorCount;
- (void)addAsset:(id)a3 collection:(id)a4;
- (void)addAsset:(id)a3 filename:(id)a4 size:(unint64_t)a5 collection:(id)a6 completion:(id)a7;
- (void)setContentType:(unint64_t)a3;
- (void)setErrorCount:(unint64_t)a3;
- (void)setRootPath:(id)a3;
@end

@implementation WLPhotoLibrary

- (WLPhotoLibrary)init
{
  v15.receiver = self;
  v15.super_class = (Class)WLPhotoLibrary;
  v2 = [(WLPhotoLibrary *)&v15 init];
  v3 = v2;
  if (v2)
  {
    [(WLPhotoLibrary *)v2 setContentType:0];
    v4 = objc_alloc_init(WLFileProvider);
    v5 = [(WLFileProvider *)v4 fetchRootPath];

    if (v5)
    {
      v6 = WLLocalizedString();
      uint64_t v7 = [v5 stringByAppendingPathComponent:v6];
      [(WLPhotoLibrary *)v3 setRootPath:v7];

      v8 = [MEMORY[0x263F08850] defaultManager];
      LOBYTE(v7) = [v8 fileExistsAtPath:v3->_rootPath];

      if ((v7 & 1) == 0)
      {
        v9 = [MEMORY[0x263F08850] defaultManager];
        rootPath = v3->_rootPath;
        id v14 = 0;
        [v9 createDirectoryAtPath:rootPath withIntermediateDirectories:0 attributes:0 error:&v14];
        id v11 = v14;

        if (v11)
        {
          v13 = [v11 description];
          _WLLog();
        }
      }
    }
    else
    {
      _WLLog();
    }
  }
  return v3;
}

- (WLPhotoLibrary)initWithContentType:(unint64_t)a3
{
  v4 = [(WLPhotoLibrary *)self init];
  v5 = v4;
  if (v4) {
    [(WLPhotoLibrary *)v4 setContentType:a3];
  }
  return v5;
}

- (void)addAsset:(id)a3 filename:(id)a4 size:(unint64_t)a5 collection:(id)a6 completion:(id)a7
{
  v32[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v12 && v13)
  {
    if (a5)
    {
      _WLLog();
      objc_initWeak(&location, self);
      v16 = objc_msgSend(MEMORY[0x263F14E98], "sharedPhotoLibrary", v12);
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __63__WLPhotoLibrary_addAsset_filename_size_collection_completion___block_invoke;
      v26[3] = &unk_26490CC68;
      objc_copyWeak(&v29, &location);
      id v17 = v12;
      id v27 = v17;
      id v28 = v14;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __63__WLPhotoLibrary_addAsset_filename_size_collection_completion___block_invoke_2;
      v21[3] = &unk_26490C8B8;
      objc_copyWeak(&v25, &location);
      id v22 = v17;
      id v23 = v13;
      id v24 = v15;
      [v16 performChanges:v26 completionHandler:v21];

      objc_destroyWeak(&v25);
      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }
    else
    {
      _WLLog();
      if (v15) {
        (*((void (**)(id, uint64_t, void))v15 + 2))(v15, 1, 0);
      }
    }
  }
  else
  {
    _WLLog();
    if (v15)
    {
      v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = *MEMORY[0x263F08320];
      v32[0] = @"WLPhotoLibrary did receive nil.";
      v19 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
      v20 = [v18 errorWithDomain:*MEMORY[0x263F86308] code:1 userInfo:v19];

      (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v20);
    }
  }
}

void __63__WLPhotoLibrary_addAsset_filename_size_collection_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained addAsset:*(void *)(a1 + 32) collection:*(void *)(a1 + 40)];
}

void __63__WLPhotoLibrary_addAsset_filename_size_collection_completion___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  v5 = (id *)(a1 + 7);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  uint64_t v8 = a1[4];
  uint64_t v9 = a1[5];
  id v13 = v6;
  uint64_t v10 = [WeakRetained photoLibraryDidComplete:v8 filename:v9 success:a2 error:&v13];
  id v11 = v13;

  uint64_t v12 = a1[6];
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, v10, v11);
  }
}

- (void)addAsset:(id)a3 collection:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [(WLPhotoLibrary *)self assetCollectionChangeRequest:v6];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    _WLLog();
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  unint64_t contentType = self->_contentType;
  if (contentType == 1)
  {
    id v13 = (void *)MEMORY[0x263F14D20];
    id v11 = [NSURL fileURLWithPath:v18];
    uint64_t v12 = [v13 creationRequestForAssetFromVideoAtFileURL:v11];
    goto LABEL_8;
  }
  if (!contentType)
  {
    uint64_t v10 = (void *)MEMORY[0x263F14D20];
    id v11 = [NSURL fileURLWithPath:v18];
    uint64_t v12 = [v10 creationRequestForAssetFromImageAtFileURL:v11];
LABEL_8:
    id v14 = (void *)v12;

    goto LABEL_10;
  }
  unint64_t v16 = self->_contentType;
  _WLLog();
  id v14 = 0;
LABEL_10:
  id v15 = objc_msgSend(v14, "placeholderForCreatedAsset", v16);
  [v8 addObject:v15];

  id v17 = [v14 placeholderForCreatedAsset];
  _WLLog();

  if (v8)
  {
    objc_msgSend(v7, "addAssets:", v8, v14, v17, v18);
    _WLLog();
  }
}

- (BOOL)photoLibraryDidComplete:(id)a3 filename:(id)a4 success:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [NSNumber numberWithBool:v7];
  id v19 = *a6;
  _WLLog();

  if (v7) {
    goto LABEL_3;
  }
  ++self->_errorCount;
  BOOL v13 = -[WLPhotoLibrary copy:filename:error:](self, "copy:filename:error:", v10, v11, a6, v12, v19, v10);
  id v14 = [v10 pathExtension];
  id v15 = [v14 lowercaseString];

  unint64_t v16 = [MEMORY[0x263F862E0] sharedInstance];
  [v16 photoLibraryDidFailWithExtension:v15];

  if (v13)
  {
LABEL_3:
    *a6 = 0;
    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)copy:(id)a3 filename:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  rootPath = self->_rootPath;
  if (rootPath)
  {
    id v11 = [(NSString *)rootPath stringByAppendingPathComponent:v9];
    uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
    if ([v12 fileExistsAtPath:v11])
    {
      id v24 = a5;
      id v25 = v12;
      BOOL v13 = [v9 stringByDeletingPathExtension];
      id v26 = v9;
      id v14 = [v9 pathExtension];
      uint64_t v15 = 0;
      while (1)
      {
        unint64_t v16 = [NSString stringWithFormat:@"%@ %ld", v13, v15 + 2];
        if ([v14 length])
        {
          uint64_t v17 = [v16 stringByAppendingFormat:@".%@", v14];

          unint64_t v16 = (void *)v17;
        }
        id v18 = [(NSString *)self->_rootPath stringByAppendingPathComponent:v16];

        id v19 = [MEMORY[0x263F08850] defaultManager];
        char v20 = [v19 fileExistsAtPath:v18];

        if ((v20 & 1) == 0) {
          break;
        }
        ++v15;
        id v11 = v18;
        if (v15 == 2147483645)
        {

          LOBYTE(v21) = 0;
          id v9 = v26;
          goto LABEL_15;
        }
      }

      id v9 = v26;
      a5 = v24;
      uint64_t v12 = v25;
    }
    else
    {
      id v18 = v11;
    }
    id v22 = [MEMORY[0x263F08850] defaultManager];
    int v21 = [v22 moveItemAtPath:v8 toPath:v18 error:a5];

    if (a5 && v21)
    {
      *a5 = 0;
      LOBYTE(v21) = 1;
    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }
LABEL_15:

  return v21;
}

- (id)assetCollectionChangeRequest:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"localizedTitle = %@", v3];
  [v4 setPredicate:v5];

  id v6 = [MEMORY[0x263F14D28] fetchAssetCollectionsWithType:1 subtype:2 options:v4];
  BOOL v7 = [v6 firstObject];

  if (v7) {
    [MEMORY[0x263F14D30] changeRequestForAssetCollection:v7];
  }
  else {
  id v8 = [MEMORY[0x263F14D30] creationRequestForAssetCollectionWithTitle:v3];
  }

  return v8;
}

- (unint64_t)errorCount
{
  return self->_errorCount;
}

- (void)setErrorCount:(unint64_t)a3
{
  self->_errorCount = a3;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_unint64_t contentType = a3;
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
}

@end