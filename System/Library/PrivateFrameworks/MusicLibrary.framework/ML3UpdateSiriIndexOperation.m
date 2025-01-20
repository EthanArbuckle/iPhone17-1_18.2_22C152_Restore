@interface ML3UpdateSiriIndexOperation
- (BOOL)_execute:(id *)a3;
- (BOOL)_performFullIndexToRevision:(int64_t)a3 withDatasetStream:(id)a4;
- (BOOL)_performIncrementalIndexToRevision:(int64_t)a3 withDatasetStream:(id)a4;
- (NSMutableArray)donators;
- (unint64_t)type;
- (void)_enumerateUserIDsWithBlock:(id)a3;
@end

@implementation ML3UpdateSiriIndexOperation

- (void).cxx_destruct
{
}

- (NSMutableArray)donators
{
  return self->_donators;
}

- (BOOL)_performIncrementalIndexToRevision:(int64_t)a3 withDatasetStream:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = os_log_create("com.apple.amp.medialibrary", "Indexing");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v6 priorVersion];
    *(_WORD *)&buf[22] = 2048;
    int64_t v27 = a3;
    _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - performing incremental index fromRevision=%llu toRevision=%lld", buf, 0x20u);
  }

  v8 = [(ML3DatabaseOperation *)self library];
  v9 = [v8 libraryUID];
  id v10 = objc_alloc_init((Class)getKVMediaItemBuilderClass());
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v27) = 1;
  uint64_t v11 = [v6 priorVersion];
  int64_t v12 = +[ML3Entity revisionTrackingCode];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__ML3UpdateSiriIndexOperation__performIncrementalIndexToRevision_withDatasetStream___block_invoke;
  v19[3] = &unk_1E5FB7260;
  id v13 = v10;
  id v20 = v13;
  id v14 = v8;
  id v21 = v14;
  id v15 = v9;
  id v22 = v15;
  id v16 = v6;
  v24 = self;
  v25 = buf;
  id v23 = v16;
  [v14 enumeratePersistentIDsAfterRevision:v11 revisionTrackingCode:v12 maximumRevisionType:0 forMediaTypes:0 inUsersLibrary:0 usingBlock:v19];
  BOOL v17 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v17;
}

void __84__ML3UpdateSiriIndexOperation__performIncrementalIndexToRevision_withDatasetStream___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int64_t v12 = (void *)MEMORY[0x1B3E93C70]();
  if (a5)
  {
    id v13 = +[ML3Entity URLForEntityWithPersistentID:a2 libraryUID:*(void *)(a1 + 48)];
    id v14 = [v13 absoluteString];

    if (v14)
    {
      id v15 = *(void **)(a1 + 56);
      id v22 = 0;
      [v15 removeItemWithItemId:v14 error:&v22];
      id v16 = v22;
      if (v16)
      {
        if (a7) {
          *a7 = 1;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        BOOL v17 = os_log_create("com.apple.amp.medialibrary", "Indexing");
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        uint64_t v18 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 134218242;
        uint64_t v25 = v18;
        __int16 v26 = 2114;
        id v27 = v16;
        v19 = "ML3UpdateSiriIndexOperation %p - not deleting item [incremental] because of error=%{public}@";
LABEL_14:
        _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_ERROR, v19, buf, 0x16u);
LABEL_15:

        goto LABEL_16;
      }
      goto LABEL_16;
    }
  }
  else
  {
    id v14 = _CreateKVItem(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), a2, a6);
    if (v14)
    {
      id v20 = *(void **)(a1 + 56);
      id v23 = 0;
      [v20 addOrUpdateItem:v14 error:&v23];
      id v16 = v23;
      if (v16)
      {
        if (a7) {
          *a7 = 1;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        BOOL v17 = os_log_create("com.apple.amp.medialibrary", "Indexing");
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        uint64_t v21 = *(void *)(a1 + 64);
        *(_DWORD *)buf = 134218242;
        uint64_t v25 = v21;
        __int16 v26 = 2114;
        id v27 = v16;
        v19 = "ML3UpdateSiriIndexOperation %p - not adding item [incremental] because of error=%{public}@";
        goto LABEL_14;
      }
LABEL_16:
    }
  }
}

- (BOOL)_performFullIndexToRevision:(int64_t)a3 withDatasetStream:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = [v6 errorCode];
  v8 = os_log_create("com.apple.amp.medialibrary", "Indexing");
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 == 15)
  {
    if (v9)
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a3;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - skipping full index [same revision] revision=%lld", buf, 0x16u);
    }
    BOOL v10 = 0;
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a3;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - performing full index toRevision=%lld", buf, 0x16u);
    }

    uint64_t v11 = [(ML3DatabaseOperation *)self library];
    int64_t v12 = [v11 libraryUID];
    id v13 = objc_alloc_init((Class)getKVMediaItemBuilderClass());
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v26 = 1;
    int64_t v14 = +[ML3Entity revisionTrackingCode];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __77__ML3UpdateSiriIndexOperation__performFullIndexToRevision_withDatasetStream___block_invoke;
    v18[3] = &unk_1E5FB7260;
    id v15 = v13;
    id v19 = v15;
    v8 = v11;
    id v20 = v8;
    id v16 = v12;
    id v21 = v16;
    id v23 = self;
    v24 = buf;
    id v22 = v6;
    [v8 enumeratePersistentIDsAfterRevision:0 revisionTrackingCode:v14 maximumRevisionType:0 forMediaTypes:0 inUsersLibrary:0 usingBlock:v18];
    BOOL v10 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

    _Block_object_dispose(buf, 8);
  }

  return v10;
}

void __77__ML3UpdateSiriIndexOperation__performFullIndexToRevision_withDatasetStream___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int64_t v12 = (void *)MEMORY[0x1B3E93C70]();
  if (!a5)
  {
    id v13 = _CreateKVItem(*(void **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), a2, a6);
    if (v13)
    {
      int64_t v14 = *(void **)(a1 + 56);
      id v18 = 0;
      [v14 registerItem:v13 error:&v18];
      id v15 = v18;
      if (v15)
      {
        if (a7) {
          *a7 = 1;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        id v16 = os_log_create("com.apple.amp.medialibrary", "Indexing");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = *(void *)(a1 + 64);
          *(_DWORD *)buf = 134218242;
          uint64_t v20 = v17;
          __int16 v21 = 2114;
          id v22 = v15;
          _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_ERROR, "ML3UpdateSiriIndexOperation %p - not donating items because of error=%{public}@", buf, 0x16u);
        }
      }
    }
  }
}

- (void)_enumerateUserIDsWithBlock:(id)a3
{
}

- (BOOL)_execute:(id *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  v4 = (void *)getKVDonatorClass_softClass;
  uint64_t v40 = getKVDonatorClass_softClass;
  if (!getKVDonatorClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getKVDonatorClass_block_invoke;
    v46 = &unk_1E5FB7330;
    v47 = &v37;
    __getKVDonatorClass_block_invoke((uint64_t)buf);
    v4 = (void *)v38[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v37, 8);
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    donators = self->_donators;
    self->_donators = v6;

    v8 = [(ML3DatabaseOperation *)self library];
    uint64_t v9 = [v8 currentContentRevision];
    BOOL v10 = [v8 libraryUID];
    uint64_t v11 = [v8 valueForDatabaseProperty:@"MLSiriIndexValidityRevision"];
    uint64_t v12 = [v11 longLongValue];

    id v13 = [NSString stringWithFormat:@"%@-%ld-%lld", v10, 1, v12];
    int64_t v14 = os_log_create("com.apple.amp.medialibrary", "Indexing");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(ML3DatabaseOperation *)self library];
      id v16 = [v15 databasePath];
      *(_DWORD *)buf = 134218498;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 2114;
      v46 = v16;
      _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - starting index validity=%{public}@ databasePath=%{public}@", buf, 0x20u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v46) = 1;
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x2020000000;
    uint64_t v40 = 0;
    dispatch_group_t v17 = dispatch_group_create();
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __40__ML3UpdateSiriIndexOperation__execute___block_invoke;
    v28[3] = &unk_1E5FB7238;
    v32 = &v37;
    v28[4] = self;
    id v34 = v5;
    id v18 = v17;
    v29 = v18;
    uint64_t v35 = v9;
    id v19 = v13;
    id v30 = v19;
    v33 = buf;
    uint64_t v36 = v12;
    os_log_t v20 = v8;
    os_log_t v31 = v20;
    [(ML3UpdateSiriIndexOperation *)self _enumerateUserIDsWithBlock:v28];
    dispatch_time_t v21 = dispatch_time(0, (uint64_t)((double)v38[3] * 6.0e10));
    dispatch_group_wait(v18, v21);
    id v22 = os_log_create("com.apple.amp.medialibrary", "Indexing");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
      *(_DWORD *)v41 = 134218240;
      v42 = self;
      __int16 v43 = 1024;
      int v44 = v23;
      _os_log_impl(&dword_1B022D000, v22, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - operation complete [success = %{BOOL}u]", v41, 0x12u);
    }

    BOOL v24 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    os_log_t v20 = os_log_create("com.apple.amp.medialibrary", "Indexing");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [(ML3DatabaseOperation *)self library];
      char v26 = [v25 databasePath];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v26;
      _os_log_impl(&dword_1B022D000, v20, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - skipping index [missing KVDonator class] databasePath=%{public}@", buf, 0x16u);
    }
    BOOL v24 = 1;
  }

  return v24;
}

void __40__ML3UpdateSiriIndexOperation__execute___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  v4 = os_log_create("com.apple.amp.medialibrary", "Indexing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v3;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - indexing userID=%{public}@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 80);
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v7 = (id *)getKVOriginAppIdMediaPlayerSymbolLoc_ptr;
  uint64_t v30 = getKVOriginAppIdMediaPlayerSymbolLoc_ptr;
  if (!getKVOriginAppIdMediaPlayerSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getKVOriginAppIdMediaPlayerSymbolLoc_block_invoke;
    v32 = &unk_1E5FB7330;
    v33 = &v27;
    v8 = KoaLibrary();
    uint64_t v9 = dlsym(v8, "KVOriginAppIdMediaPlayer");
    *(void *)(v33[1] + 24) = v9;
    getKVOriginAppIdMediaPlayerSymbolLoc_ptr = *(void *)(v33[1] + 24);
    int v7 = (id *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v7)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    id v19 = [NSString stringWithUTF8String:"NSString *getKVOriginAppIdMediaPlayer(void)"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"ML3UpdateSiriIndexOperation.m", 41, @"%s", dlerror());

    __break(1u);
  }
  id v10 = *v7;
  if (v3)
  {
    uint64_t v25 = 0;
    uint64_t v11 = [v6 donatorWithItemType:5 originAppId:v10 userId:v3 error:&v25];
    uint64_t v12 = (id *)&v25;
  }
  else
  {
    uint64_t v26 = 0;
    uint64_t v11 = [v6 donatorWithItemType:5 originAppId:v10 error:&v26];
    uint64_t v12 = (id *)&v26;
  }
  id v13 = *v12;

  if (v13)
  {
    int64_t v14 = os_log_create("com.apple.amp.medialibrary", "Indexing");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_ERROR, "ML3UpdateSiriIndexOperation %p - failed to index [failed to get donator] error=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 320) addObject:v11];
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __40__ML3UpdateSiriIndexOperation__execute___block_invoke_5;
    v20[3] = &unk_1E5FB7210;
    uint64_t v16 = *(void *)(a1 + 72);
    v20[4] = *(void *)(a1 + 32);
    uint64_t v23 = v16;
    long long v24 = *(_OWORD *)(a1 + 88);
    uint64_t v17 = *(void *)(a1 + 48);
    id v21 = *(id *)(a1 + 56);
    id v22 = *(id *)(a1 + 40);
    [v11 donateWithOptions:1 version:(void)v24 validity:v17 usingStream:v20];
  }
}

void __40__ML3UpdateSiriIndexOperation__execute___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = os_log_create("com.apple.amp.medialibrary", "Indexing");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "ML3UpdateSiriIndexOperation %p - failed to index [call to donate failed] error=%{public}@", buf, 0x16u);
    }

LABEL_23:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
    goto LABEL_24;
  }
  uint64_t v30 = 0;
  os_log_t v31 = &v30;
  uint64_t v32 = 0x2050000000;
  uint64_t v9 = (void *)getKVIncrementalDatasetStreamClass_softClass;
  uint64_t v33 = getKVIncrementalDatasetStreamClass_softClass;
  if (!getKVIncrementalDatasetStreamClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getKVIncrementalDatasetStreamClass_block_invoke;
    uint64_t v35 = &unk_1E5FB7330;
    uint64_t v36 = &v30;
    __getKVIncrementalDatasetStreamClass_block_invoke((uint64_t)buf);
    uint64_t v9 = (void *)v31[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v30, 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([*(id *)(a1 + 32) _performIncrementalIndexToRevision:*(void *)(a1 + 64) withDatasetStream:v5] & 1) == 0)goto LABEL_20; {
  }
    }
  else
  {
    uint64_t v30 = 0;
    os_log_t v31 = &v30;
    uint64_t v32 = 0x2050000000;
    uint64_t v11 = (void *)getKVFullDatasetStreamClass_softClass;
    uint64_t v33 = getKVFullDatasetStreamClass_softClass;
    if (!getKVFullDatasetStreamClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getKVFullDatasetStreamClass_block_invoke;
      uint64_t v35 = &unk_1E5FB7330;
      uint64_t v36 = &v30;
      __getKVFullDatasetStreamClass_block_invoke((uint64_t)buf);
      uint64_t v11 = (void *)v31[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v30, 8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v18 = os_log_create("com.apple.amp.medialibrary", "Indexing");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        uint64_t v19 = *(void *)(a1 + 32);
        os_log_t v20 = objc_opt_class();
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = v19;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v20;
        id v21 = v20;
        _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_FAULT, "ML3UpdateSiriIndexOperation %p - failed to index [invalid dataset stream] type=%{public}@", buf, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      goto LABEL_20;
    }
    if (![*(id *)(a1 + 32) _performFullIndexToRevision:*(void *)(a1 + 64) withDatasetStream:v5])
    {
LABEL_20:
      id v22 = os_log_create("com.apple.amp.medialibrary", "Indexing");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v23;
        _os_log_impl(&dword_1B022D000, v22, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - calling stream cancel", buf, 0xCu);
      }

      [v5 cancel];
      goto LABEL_23;
    }
  }
  id v13 = os_log_create("com.apple.amp.medialibrary", "Indexing");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v14;
    _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - calling stream finish", buf, 0xCu);
  }

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __40__ML3UpdateSiriIndexOperation__execute___block_invoke_6;
  v24[3] = &unk_1E5FB71E8;
  uint64_t v15 = *(void *)(a1 + 72);
  uint64_t v28 = *(void *)(a1 + 56);
  uint64_t v29 = v15;
  id v16 = *(id *)(a1 + 40);
  uint64_t v17 = *(void *)(a1 + 32);
  id v25 = v16;
  uint64_t v26 = v17;
  id v27 = *(id *)(a1 + 48);
  [v5 finish:v24];

LABEL_24:
}

void __40__ML3UpdateSiriIndexOperation__execute___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3 == 0;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v4 = *(void **)(a1 + 32);
    id v5 = [NSNumber numberWithInteger:*(void *)(a1 + 64) + 1];
    [v4 setValue:v5 forDatabaseProperty:@"MLSiriIndexValidityRevision"];
  }
  id v6 = os_log_create("com.apple.amp.medialibrary", "Indexing");
  int v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = objc_msgSend(v3, "msv_description");
      int v11 = 134218242;
      uint64_t v12 = v8;
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "ML3UpdateSiriIndexOperation %p - finished index error=%{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 134217984;
    uint64_t v12 = v10;
    _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "ML3UpdateSiriIndexOperation %p - finished index", (uint8_t *)&v11, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (unint64_t)type
{
  return 8;
}

@end