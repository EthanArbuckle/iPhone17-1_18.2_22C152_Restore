@interface PPContactDiskCacheManager
- (PPContactDiskCacheManager)initWithPath:(id)a3;
- (void)accessCacheWithBlock:(id)a3;
- (void)mutateCacheWithBlock:(id)a3;
@end

@implementation PPContactDiskCacheManager

- (void).cxx_destruct
{
}

- (void)mutateCacheWithBlock:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PPContactDiskCacheManager_mutateCacheWithBlock___block_invoke;
  v7[3] = &unk_1E65D5F10;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __50__PPContactDiskCacheManager_mutateCacheWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 path];
  v5 = [v4 stringByAppendingPathComponent:@"state"];

  uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  [(id)v6 createFileAtPath:v5 contents:0 attributes:0];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = 0;
  LOBYTE(v6) = [v7 removeItemAtPath:v5 error:&v10];
  id v8 = v10;

  if ((v6 & 1) == 0)
  {
    v9 = pp_contacts_log_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v5;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_error_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_ERROR, "PPContactDiskCacheManager: failed to remove state file: %@ error: %@", buf, 0x16u);
    }
  }
}

- (void)accessCacheWithBlock:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__PPContactDiskCacheManager_accessCacheWithBlock___block_invoke;
  v7[3] = &unk_1E65D5F10;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __50__PPContactDiskCacheManager_accessCacheWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void (**)(uint64_t, id))(v2 + 16);
  id v4 = a2;
  v3(v2, v4);
  [v4 deleteCacheIfTooOld];
}

- (PPContactDiskCacheManager)initWithPath:(id)a3
{
  id v4 = a3;
  if (initWithPath___pasOnceToken35 != -1) {
    dispatch_once(&initWithPath___pasOnceToken35, &__block_literal_global_5748);
  }
  id v5 = (id)initWithPath___pasExprOnceResult_5749;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5731;
  v20 = __Block_byref_object_dispose__5732;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__PPContactDiskCacheManager_initWithPath___block_invoke_2;
  v12[3] = &unk_1E65D7C28;
  uint64_t v15 = &v16;
  id v6 = v4;
  id v13 = v6;
  v7 = self;
  id v14 = v7;
  [v5 runWithLockAcquired:v12];
  id v8 = (id)v17[5];

  v9 = v14;
  id v10 = (PPContactDiskCacheManager *)v8;

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __42__PPContactDiskCacheManager_initWithPath___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    v48.receiver = *(id *)(a1 + 40);
    v48.super_class = (Class)PPContactDiskCacheManager;
    id v7 = objc_msgSendSuper2(&v48, sel_init);
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      id v10 = (void *)MEMORY[0x1CB79D060]();
      v11 = [*(id *)(a1 + 32) stringByAppendingPathComponent:@"name_records"];
      v12 = [v11 stringByAppendingPathComponent:@"version"];
      id v13 = (void *)MEMORY[0x1CB79D060]();
      id v14 = [*(id *)(a1 + 32) stringByAppendingPathComponent:@"name_records.pb"];
      uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v16 = [v15 fileExistsAtPath:v14];

      if (v16)
      {
        v17 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v17 removeItemAtPath:v14 error:0];
      }
      uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v19 = [v18 fileExistsAtPath:v11];

      if (v19)
      {
        id v20 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v12];
        if ([v20 length] == 4)
        {
          id v20 = v20;
          BOOL v21 = *(_DWORD *)[v20 bytes] == 1;
        }
        else
        {
          BOOL v21 = 0;
        }
      }
      else
      {
        v22 = pp_contacts_log_handle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v50 = v11;
          _os_log_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_INFO, "PPContactDiskCacheManager: creating new cache at %@", buf, 0xCu);
        }

        v23 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v47 = 0;
        char v24 = [v23 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:&v47];
        id v20 = v47;

        if ((v24 & 1) == 0)
        {
          v25 = pp_contacts_log_handle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v50 = v20;
            _os_log_error_impl(&dword_1CA9A8000, v25, OS_LOG_TYPE_ERROR, "PPContactDiskCacheManager: failed to create cache directory: %@", buf, 0xCu);
          }
        }
        v26 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&kPPContactDiskCacheCurrentVersion length:4];
        BOOL v21 = 1;
        [v26 writeToFile:v12 atomically:1];
      }
      v27 = [(PPContactDiskCache *)[PPMutableContactDiskCache alloc] initWithPath:v11];
      if (!v21)
      {
        v28 = pp_contacts_log_handle();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA9A8000, v28, OS_LOG_TYPE_DEFAULT, "PPContactDiskCacheManager: versison check failed", buf, 2u);
        }

        if (![(PPMutableContactDiskCache *)v27 deleteNameRecordCache])
        {
          v41 = pp_contacts_log_handle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CA9A8000, v41, OS_LOG_TYPE_ERROR, "PPContactDiskCacheManager: failed to delete cache after version check. Not using cache.", buf, 2u);
          }

          uint64_t v42 = *(void *)(*(void *)(a1 + 48) + 8);
          v30 = *(void **)(v42 + 40);
          *(void *)(v42 + 40) = 0;
          goto LABEL_37;
        }
        v29 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&kPPContactDiskCacheCurrentVersion length:4];
        [v29 writeToFile:v12 atomically:1];
      }
      v30 = [v11 stringByAppendingPathComponent:@"state"];
      v31 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v32 = [v31 fileExistsAtPath:v30];

      if (v32)
      {
        v33 = pp_contacts_log_handle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA9A8000, v33, OS_LOG_TYPE_DEFAULT, "PPContactDiskCacheManager: interrupted mutation detected, throwing away cache files.", buf, 2u);
        }

        if (![(PPMutableContactDiskCache *)v27 deleteNameRecordCache])
        {
          v43 = pp_contacts_log_handle();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CA9A8000, v43, OS_LOG_TYPE_ERROR, "PPContactDiskCacheManager: failed to delete interrupted cache. Not using cache.", buf, 2u);
          }

          uint64_t v44 = *(void *)(*(void *)(a1 + 48) + 8);
          v45 = *(void **)(v44 + 40);
          *(void *)(v44 + 40) = 0;

          goto LABEL_37;
        }
        v34 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v46 = 0;
        char v35 = [v34 removeItemAtPath:v30 error:&v46];
        id v36 = v46;

        if ((v35 & 1) == 0)
        {
          v37 = pp_contacts_log_handle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v50 = v36;
            _os_log_error_impl(&dword_1CA9A8000, v37, OS_LOG_TYPE_ERROR, "PPContactDiskCacheManager: failed to remove state file after deleting interrupted cache: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v38 = [objc_alloc(MEMORY[0x1E4F93B70]) initWithGuardedData:v27];
      uint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v40 = *(void **)(v39 + 8);
      *(void *)(v39 + 8) = v38;

      [v3 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
LABEL_37:
    }
  }
}

void __42__PPContactDiskCacheManager_initWithPath___block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  id v1 = objc_alloc(MEMORY[0x1E4F93B70]);
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = [v1 initWithGuardedData:v2];
  uint64_t v4 = (void *)initWithPath___pasExprOnceResult_5749;
  initWithPath___pasExprOnceResult_5749 = v3;
}

@end