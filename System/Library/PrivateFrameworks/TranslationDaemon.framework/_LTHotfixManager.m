@interface _LTHotfixManager
+ (_LTHotfixManager)shared;
+ (void)_enableTestFixture:(BOOL)a3;
+ (void)initialize;
- (NSURL)hotfixURL;
- (_LTHotfixManager)init;
- (id)_CDNURL:(id)a3;
- (void)_decompressArchive:(id)a3 to:(id)a4 error:(id *)a5;
- (void)_downloadHotfix:(id)a3 completion:(id)a4;
- (void)_downloadMappingPlist:(id)a3;
- (void)_downloadWithURL:(id)a3 completion:(id)a4;
- (void)_replaceHotfix:(int64_t)a3 completion:(id)a4;
- (void)_updateHotfixInternal:(id)a3;
- (void)deleteHotfix:(id)a3;
- (void)refreshHotfix:(id)a3;
- (void)updateHotfix:(id)a3;
@end

@implementation _LTHotfixManager

+ (_LTHotfixManager)shared
{
  if (shared_onceToken_0 != -1) {
    dispatch_once(&shared_onceToken_0, &__block_literal_global_16);
  }
  v2 = (void *)shared_shared;
  return (_LTHotfixManager *)v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v4 = +[_LTDAssetService assetDirectoryURL];
    uint64_t v2 = [v4 URLByAppendingPathComponent:@"Hotfix"];
    v3 = (void *)hotfixBasePath;
    hotfixBasePath = v2;
  }
}

+ (void)_enableTestFixture:(BOOL)a3
{
  if (a3)
  {
    v3 = [MEMORY[0x263F08850] defaultManager];
    id v6 = [v3 temporaryDirectory];
  }
  else
  {
    id v6 = +[_LTDAssetService assetDirectoryURL];
  }
  uint64_t v4 = [v6 URLByAppendingPathComponent:@"Hotfix"];
  v5 = (void *)hotfixBasePath;
  hotfixBasePath = v4;
}

- (_LTHotfixManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)_LTHotfixManager;
  uint64_t v2 = [(_LTHotfixManager *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Translator.HotfixManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = [MEMORY[0x263F08850] defaultManager];
    id v6 = [(id)hotfixBasePath path];
    v7 = [v5 contentsOfDirectoryAtPath:v6 error:0];

    v8 = [v7 firstObject];
    if (v8)
    {
      uint64_t v9 = [(id)hotfixBasePath URLByAppendingPathComponent:v8];
      hotfixURL = v2->_hotfixURL;
      v2->_hotfixURL = (NSURL *)v9;
    }
    v11 = v2;
  }
  return v2;
}

- (void)refreshHotfix:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34___LTHotfixManager_refreshHotfix___block_invoke;
  v7[3] = &unk_265546F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_replaceHotfix:(int64_t)a3 completion:(id)a4
{
  id v6 = (void *)hotfixBasePath;
  v7 = (void (**)(id, id))a4;
  id v8 = [v6 path];
  uint64_t v9 = [v8 stringByAppendingString:@"-rollback"];
  v10 = [MEMORY[0x263F08850] defaultManager];
  switch(a3)
  {
    case 3:
      v21 = _LTOSLogAssets();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[_LTHotfixManager _replaceHotfix:completion:].cold.4(v21, v22, v23, v24, v25, v26, v27, v28);
      }
      if (![v10 fileExistsAtPath:v8]) {
        goto LABEL_27;
      }
      if (![v10 fileExistsAtPath:v9]) {
        goto LABEL_27;
      }
      id v41 = 0;
      [v10 removeItemAtPath:v9 error:&v41];
      id v19 = v41;
      if (!v19) {
        goto LABEL_27;
      }
      break;
    case 2:
      v29 = _LTOSLogAssets();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[_LTHotfixManager _replaceHotfix:completion:](v29, v30, v31, v32, v33, v34, v35, v36);
      }
      if (![v10 fileExistsAtPath:v8]
        || (v43 = 0, [v10 removeItemAtPath:v8 error:&v43], (id v19 = v43) == 0))
      {
        if (![v10 fileExistsAtPath:v9])
        {
LABEL_27:
          v39 = _LTOSLogAssets();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v40 = 0;
            _os_log_impl(&dword_2600DC000, v39, OS_LOG_TYPE_INFO, "Hotfix manager refresh completed", v40, 2u);
          }
          id v19 = 0;
          goto LABEL_30;
        }
        id v42 = 0;
        [v10 moveItemAtPath:v9 toPath:v8 error:&v42];
        id v19 = v42;
        if (!v19)
        {
          v38 = [NSURL fileURLWithPath:v8];
          hotfixURL = self->_hotfixURL;
          self->_hotfixURL = v38;
          goto LABEL_26;
        }
      }
      break;
    case 1:
      v11 = _LTOSLogAssets();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[_LTHotfixManager _replaceHotfix:completion:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
      if (![v10 fileExistsAtPath:v8]) {
        goto LABEL_27;
      }
      if (![v10 fileExistsAtPath:v9]
        || (v45 = 0, [v10 removeItemAtPath:v9 error:&v45], (id v19 = v45) == 0))
      {
        id v44 = 0;
        [v10 moveItemAtPath:v8 toPath:v9 error:&v44];
        id v19 = v44;
        if (!v19)
        {
          hotfixURL = self->_hotfixURL;
          self->_hotfixURL = 0;
LABEL_26:

          goto LABEL_27;
        }
      }
      break;
    default:
      goto LABEL_27;
  }
  v37 = _LTOSLogAssets();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
    -[_LTHotfixManager _replaceHotfix:completion:]();
  }
LABEL_30:
  v7[2](v7, v19);
}

- (void)updateHotfix:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33___LTHotfixManager_updateHotfix___block_invoke;
  v7[3] = &unk_265546F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_updateHotfixInternal:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  hotfixURL = self->_hotfixURL;
  self->_hotfixURL = 0;

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42___LTHotfixManager__updateHotfixInternal___block_invoke;
  v7[3] = &unk_265546FA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(_LTHotfixManager *)self _downloadMappingPlist:v7];
}

- (void)deleteHotfix:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33___LTHotfixManager_deleteHotfix___block_invoke;
  v7[3] = &unk_265546F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_downloadWithURL:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = _LTOSLogHotfix();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v5;
    _os_log_impl(&dword_2600DC000, v7, OS_LOG_TYPE_INFO, "Downloading hotfix from URL: %{public}@", buf, 0xCu);
  }
  id v8 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  objc_msgSend(v8, "set_sourceApplicationBundleIdentifier:", @"com.apple.Translate");
  [v8 setAllowsCellularAccess:1];
  uint64_t v9 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v8];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __48___LTHotfixManager__downloadWithURL_completion___block_invoke;
  uint64_t v16 = &unk_265546FD0;
  id v17 = v5;
  id v18 = v6;
  id v10 = v6;
  id v11 = v5;
  uint64_t v12 = [v9 dataTaskWithURL:v11 completionHandler:&v13];
  objc_msgSend(v12, "resume", v13, v14, v15, v16);
}

- (id)_CDNURL:(id)a3
{
  id v3 = a3;
  id v4 = _LTPreferencesHotfixEndpointURL();
  id v5 = [v4 URLByAppendingPathComponent:v3];

  return v5;
}

- (void)_downloadMappingPlist:(id)a3
{
  id v4 = a3;
  id v5 = [(_LTHotfixManager *)self _CDNURL:@"mapping-info-plist"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42___LTHotfixManager__downloadMappingPlist___block_invoke;
  v7[3] = &unk_265547020;
  id v8 = v4;
  id v6 = v4;
  [(_LTHotfixManager *)self _downloadWithURL:v5 completion:v7];
}

- (void)_downloadHotfix:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _LTOSLogHotfix();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v6;
    _os_log_impl(&dword_2600DC000, v8, OS_LOG_TYPE_INFO, "Select hotfix: %@", buf, 0xCu);
  }
  uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v10 = [v6 objectForKeyedSubscript:@"FormatVersion"];
  id v11 = [v6 objectForKeyedSubscript:@"HotfixAssetVersion"];
  uint64_t v21 = (void *)v10;
  uint64_t v12 = [NSString stringWithFormat:@"%@-%@", v10, v11];
  uint64_t v13 = [(id)hotfixBasePath URLByAppendingPathComponent:v12];
  uint64_t v14 = [v13 URLByAppendingPathComponent:@"mt-quasar-config.json"];
  uint64_t v15 = [v14 path];
  LODWORD(v10) = [v9 fileExistsAtPath:v15];

  if (v10)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47___LTHotfixManager__downloadHotfix_completion___block_invoke;
    block[3] = &unk_265547048;
    block[4] = self;
    id v27 = v13;
    id v28 = v7;
    id v17 = v13;
    id v18 = v7;
    dispatch_async(queue, block);
  }
  else
  {
    id v19 = [v6 objectForKeyedSubscript:@"HotfixAssetName"];
    id v18 = [(_LTHotfixManager *)self _CDNURL:v19];

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __47___LTHotfixManager__downloadHotfix_completion___block_invoke_66;
    v22[3] = &unk_265547098;
    id v25 = v7;
    v22[4] = self;
    id v23 = v9;
    id v24 = v13;
    id v20 = v13;
    id v17 = v7;
    [(_LTHotfixManager *)self _downloadWithURL:v18 completion:v22];
  }
}

- (void)_decompressArchive:(id)a3 to:(id)a4 error:(id *)a5
{
  v37[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  archive_read_new();
  if (archive_read_support_filter_all())
  {
    uint64_t v9 = _LTOSLogHotfix();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_LTHotfixManager _decompressArchive:to:error:].cold.4(v9);
    }
    archive_read_free();
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v36 = *MEMORY[0x263F08320];
    v37[0] = @"Failed to specify compression algorithm";
    id v11 = NSDictionary;
    uint64_t v12 = (__CFString **)v37;
    uint64_t v13 = &v36;
LABEL_15:
    id v19 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:1];
    *a5 = [v10 errorWithDomain:@"HotfixManager" code:0 userInfo:v19];
    goto LABEL_16;
  }
  int support_format_all = archive_read_support_format_all();
  uint64_t v15 = _LTOSLogHotfix();
  uint64_t v16 = v15;
  if (support_format_all)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[_LTHotfixManager _decompressArchive:to:error:](v16);
    }
    archive_read_free();
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = *MEMORY[0x263F08320];
    uint64_t v35 = @"Failed to specify format";
    id v11 = NSDictionary;
    uint64_t v12 = &v35;
    uint64_t v13 = &v34;
    goto LABEL_15;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2600DC000, v16, OS_LOG_TYPE_INFO, "Start extracting archive", buf, 2u);
  }
  id v17 = v7;
  [v17 bytes];
  [v17 length];
  if (archive_read_open_memory())
  {
    id v18 = _LTOSLogHotfix();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[_LTHotfixManager _decompressArchive:to:error:](v18);
    }
    archive_read_free();
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v32 = *MEMORY[0x263F08320];
    uint64_t v33 = @"Failed to open archive for reading";
    id v11 = NSDictionary;
    uint64_t v12 = &v33;
    uint64_t v13 = &v32;
    goto LABEL_15;
  }
  id v19 = [v8 path];
  if (archive_read_next_header())
  {
LABEL_18:
    archive_read_free();
    id v20 = _LTOSLogHotfix();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v31 = v8;
      _os_log_impl(&dword_2600DC000, v20, OS_LOG_TYPE_INFO, "Finished extracting archive to: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    while (1)
    {
      uint64_t v21 = [NSString stringWithUTF8String:archive_entry_pathname()];
      uint64_t v22 = [v19 stringByAppendingPathComponent:v21];

      id v23 = _LTOSLogHotfix();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v31 = v22;
        _os_log_debug_impl(&dword_2600DC000, v23, OS_LOG_TYPE_DEBUG, "Entry extraction path: %{public}@", buf, 0xCu);
      }
      id v24 = v22;
      [v24 UTF8String];
      archive_entry_set_pathname();
      if (archive_read_extract()) {
        break;
      }

      if (archive_read_next_header()) {
        goto LABEL_18;
      }
    }
    id v25 = _LTOSLogHotfix();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[_LTHotfixManager _decompressArchive:to:error:](v25);
    }
    archive_read_free();
    uint64_t v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08320];
    v29 = @"Unable to extract file";
    id v27 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    *a5 = [v26 errorWithDomain:@"HotfixManager" code:0 userInfo:v27];
  }
LABEL_16:
}

- (NSURL)hotfixURL
{
  return self->_hotfixURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hotfixURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_replaceHotfix:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_2600DC000, v0, v1, "Hotfix manager refresh failure: %@", v2, v3, v4, v5, v6);
}

- (void)_replaceHotfix:(uint64_t)a3 completion:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_replaceHotfix:(uint64_t)a3 completion:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_replaceHotfix:(uint64_t)a3 completion:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_decompressArchive:(void *)a1 to:error:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = a1;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_3(&dword_2600DC000, v1, v3, "Unable to extract file: %s", v4);
}

- (void)_decompressArchive:(void *)a1 to:error:.cold.2(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = a1;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_3(&dword_2600DC000, v1, v3, "Failed to open archive for reading: %s", v4);
}

- (void)_decompressArchive:(void *)a1 to:error:.cold.3(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = a1;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_3(&dword_2600DC000, v1, v3, "Failed to specify format: %s", v4);
}

- (void)_decompressArchive:(void *)a1 to:error:.cold.4(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = a1;
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_3(&dword_2600DC000, v1, v3, "Failed to specify compression algorithm: %s", v4);
}

@end