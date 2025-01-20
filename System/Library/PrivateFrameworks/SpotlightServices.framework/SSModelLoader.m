@interface SSModelLoader
+ (id)assetDirectoryPathForType:(unint64_t)a3 forUpdate:(BOOL)a4;
+ (id)sharedInstance;
- (BOOL)hasPendingUpdates;
- (NSMutableSet)pendingUpdates;
- (OS_dispatch_queue)queue;
- (SSModelLoader)init;
- (void)moveNewlyPackagedAssets:(id)a3;
- (void)removeAssetsForType:(unint64_t)a3 group:(id)a4;
- (void)removeAssetsWithName:(id)a3;
- (void)setPendingUpdates:(id)a3;
- (void)setQueue:(id)a3;
- (void)unpackageModelAssets:(id)a3 assetName:(id)a4 completion:(id)a5;
- (void)unpackageModelAssets:(id)a3 type:(unint64_t)a4 group:(id)a5 completion:(id)a6;
- (void)unpackageModelAssets:(id)a3 type:(unint64_t)a4 intoDirectory:(id)a5 group:(id)a6 completion:(id)a7;
@end

@implementation SSModelLoader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_27);
  }
  v2 = (void *)sharedInstance_loader;
  return v2;
}

uint64_t __31__SSModelLoader_sharedInstance__block_invoke()
{
  sharedInstance_loader = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (SSModelLoader)init
{
  v10.receiver = self;
  v10.super_class = (Class)SSModelLoader;
  v2 = [(SSModelLoader *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.searchd.ranking.loader", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pendingUpdates = v2->_pendingUpdates;
    v2->_pendingUpdates = v7;
  }
  return v2;
}

+ (id)assetDirectoryPathForType:(unint64_t)a3 forUpdate:(BOOL)a4
{
  dispatch_queue_t v5 = @"Library/Spotlight/Resources_V3/";
  if (a4) {
    dispatch_queue_t v5 = @"Library/Spotlight/Resources.update_V3/";
  }
  v6 = v5;
  v7 = NSHomeDirectory();
  v8 = [v7 stringByAppendingPathComponent:v6];

  v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (a3 == 1)
  {
    objc_super v10 = @"Default";
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    objc_super v10 = @"Experimental";
LABEL_7:
    v11 = [v8 stringByAppendingPathComponent:v10];
    goto LABEL_9;
  }
  v11 = 0;
LABEL_9:
  if (([v9 fileExistsAtPath:v11] & 1) == 0) {
    [v9 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:0];
  }

  return v11;
}

- (BOOL)hasPendingUpdates
{
  if ([(NSMutableSet *)self->_pendingUpdates count]) {
    return 1;
  }
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = 2;
  do
  {
    v6 = [(id)objc_opt_class() assetDirectoryPathForType:v5 forUpdate:1];
    v7 = [v4 contentsOfDirectoryAtPath:v6 error:0];
    if ([v7 count])
    {
      pendingUpdates = self->_pendingUpdates;
      v9 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v5];
      [(NSMutableSet *)pendingUpdates addObject:v9];
    }
    --v5;
  }
  while (v5);
  BOOL v3 = [(NSMutableSet *)self->_pendingUpdates count] != 0;

  return v3;
}

- (void)removeAssetsWithName:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (assetIsValid(v4))
  {
    uint64_t AssetTypeForName = getAssetTypeForName(v4);
    v6 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = AssetTypeForName;
      _os_log_impl(&dword_1BDB2A000, v6, OS_LOG_TYPE_DEFAULT, "[Model loading] removing resource for type %lu", (uint8_t *)&v7, 0xCu);
    }

    [(SSModelLoader *)self removeAssetsForType:AssetTypeForName group:0];
  }
}

- (void)removeAssetsForType:(unint64_t)a3 group:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__SSModelLoader_removeAssetsForType_group___block_invoke;
  block[3] = &unk_1E634D088;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __43__SSModelLoader_removeAssetsForType_group___block_invoke(uint64_t a1)
{
  v2 = [(id)objc_opt_class() assetDirectoryPathForType:*(void *)(a1 + 48) forUpdate:0];
  BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = 0;
  [v3 removeItemAtPath:v2 error:&v6];
  id v4 = v6;

  uint64_t v5 = *(NSObject **)(a1 + 40);
  if (v5) {
    dispatch_group_leave(v5);
  }
  +[SSADEventReporter reportModelDeletionForType:*(void *)(a1 + 48)];
}

- (void)unpackageModelAssets:(id)a3 assetName:(id)a4 completion:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (assetIsValid(v9))
  {
    uint64_t AssetTypeForName = getAssetTypeForName(v9);
    v12 = [MEMORY[0x1E4F28CB0] fileHandleForReadingAtPath:v8];
    v13 = [(id)objc_opt_class() assetDirectoryPathForType:AssetTypeForName forUpdate:1];
    v14 = PRSLogCategoryDefault();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = 134217984;
      uint64_t v16 = AssetTypeForName;
      _os_log_impl(&dword_1BDB2A000, v14, OS_LOG_TYPE_INFO, "[Model loading] unpackaging %lu", (uint8_t *)&v15, 0xCu);
    }

    [(SSModelLoader *)self unpackageModelAssets:v12 type:AssetTypeForName intoDirectory:v13 group:0 completion:v10];
  }
}

- (void)unpackageModelAssets:(id)a3 type:(unint64_t)a4 group:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(id)objc_opt_class() assetDirectoryPathForType:a4 forUpdate:1];
  [(SSModelLoader *)self unpackageModelAssets:v12 type:a4 intoDirectory:v13 group:v11 completion:v10];
}

- (void)unpackageModelAssets:(id)a3 type:(unint64_t)a4 intoDirectory:(id)a5 group:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id location = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__SSModelLoader_unpackageModelAssets_type_intoDirectory_group_completion___block_invoke;
  block[3] = &unk_1E634D0B0;
  objc_copyWeak(v26, &location);
  id v22 = v13;
  id v23 = v12;
  v26[1] = (id)a4;
  id v24 = v14;
  id v25 = v15;
  id v17 = v14;
  id v18 = v15;
  id v19 = v12;
  id v20 = v13;
  dispatch_async(queue, block);

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
}

void __74__SSModelLoader_unpackageModelAssets_type_intoDirectory_group_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (!WeakRetained)
  {
LABEL_6:
    id v12 = *(NSObject **)(a1 + 48);
    if (v12) {
      dispatch_group_leave(v12);
    }
    goto LABEL_11;
  }
  BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v5 = (uint64_t *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 32);
  id v14 = 0;
  char v6 = [v3 removeItemAtPath:v4 error:&v14];
  id v7 = v14;

  if (v6)
  {
    id v8 = +[SSCompressionHelper sharedInstance];
    int v9 = [v8 unTarFileWithFd:*(void *)(a1 + 40) toPath:*(void *)(a1 + 32)];

    if (!v9)
    {
      id v10 = [WeakRetained pendingUpdates];
      id v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 72)];
      [v10 addObject:v11];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }

    goto LABEL_6;
  }
  id v13 = PRSLogCategoryDefault();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    __74__SSModelLoader_unpackageModelAssets_type_intoDirectory_group_completion___block_invoke_cold_1(v5, (uint64_t)v7, v13);
  }

LABEL_11:
}

- (void)moveNewlyPackagedAssets:(id)a3
{
  id location = 0;
  uint64_t v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__SSModelLoader_moveNewlyPackagedAssets___block_invoke;
  block[3] = &unk_1E634D0D8;
  objc_copyWeak(&v7, &location);
  void block[4] = self;
  dispatch_group_async(v4, queue, block);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __41__SSModelLoader_moveNewlyPackagedAssets___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_21;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  BOOL v3 = [WeakRetained pendingUpdates];
  uint64_t v4 = (void *)[v3 copy];

  id obj = v4;
  uint64_t v26 = [v4 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (!v26) {
    goto LABEL_20;
  }
  uint64_t v25 = *(void *)v30;
  *(void *)&long long v5 = 138412290;
  long long v22 = v5;
  id v24 = v2;
  while (2)
  {
    for (uint64_t i = 0; i != v26; ++i)
    {
      if (*(void *)v30 != v25) {
        objc_enumerationMutation(obj);
      }
      id v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      uint64_t v8 = objc_msgSend(v7, "unsignedIntegerValue", v22);
      int v9 = [(id)objc_opt_class() assetDirectoryPathForType:v8 forUpdate:1];
      id v10 = [(id)objc_opt_class() assetDirectoryPathForType:v8 forUpdate:0];
      id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v28 = 0;
      char v12 = [v11 removeItemAtPath:v10 error:&v28];
      id v13 = v28;
      id v14 = v13;
      if ((v12 & 1) == 0)
      {
        id v18 = PRSLogCategoryDefault();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          __41__SSModelLoader_moveNewlyPackagedAssets___block_invoke_cold_2((uint64_t)v14, v18);
        }
        goto LABEL_19;
      }
      id v27 = v13;
      char v15 = [v11 moveItemAtPath:v9 toPath:v10 error:&v27];
      id v16 = v27;

      id v17 = PRSLogCategoryDefault();
      id v18 = v17;
      if ((v15 & 1) == 0)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __41__SSModelLoader_moveNewlyPackagedAssets___block_invoke_cold_1((uint64_t)v16, v18);
        }
        id v14 = v16;
LABEL_19:
        v2 = v24;

        goto LABEL_20;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v8];
        *(_DWORD *)buf = v22;
        v34 = v19;
        _os_log_impl(&dword_1BDB2A000, v18, OS_LOG_TYPE_INFO, "[Model loading] moved resources for type %@", buf, 0xCu);
      }
      +[SSADEventReporter reportModelUnpackageEventWithType:](SSADEventReporter, "reportModelUnpackageEventWithType:", [v7 unsignedIntegerValue]);
      v2 = v24;
      id v20 = [v24 pendingUpdates];
      v21 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v8];
      [v20 removeObject:v21];
    }
    uint64_t v26 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v26) {
      continue;
    }
    break;
  }
LABEL_20:

LABEL_21:
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableSet)pendingUpdates
{
  return self->_pendingUpdates;
}

- (void)setPendingUpdates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingUpdates, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __74__SSModelLoader_unpackageModelAssets_type_intoDirectory_group_completion___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1BDB2A000, log, OS_LOG_TYPE_ERROR, "[Model loading] failed to remove dir %@ err %@", (uint8_t *)&v4, 0x16u);
}

void __41__SSModelLoader_moveNewlyPackagedAssets___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BDB2A000, a2, OS_LOG_TYPE_ERROR, "[Model loading] failed moving new resources %@", (uint8_t *)&v2, 0xCu);
}

void __41__SSModelLoader_moveNewlyPackagedAssets___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BDB2A000, a2, OS_LOG_TYPE_ERROR, "[Model loading] failed removing old resources %@", (uint8_t *)&v2, 0xCu);
}

@end