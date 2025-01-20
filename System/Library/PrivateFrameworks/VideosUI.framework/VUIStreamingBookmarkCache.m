@interface VUIStreamingBookmarkCache
+ (id)sharedInstance;
- (VUIStreamingBookmarkCache)init;
- (void)_activeAccountChangedNotification:(id)a3;
- (void)addBookmarkForReferenceID:(id)a3 canonicalID:(id)a4 absoluteResumeTime:(id)a5 absoluteBookmarkTimestamp:(id)a6 relativeResumeTime:(id)a7 relativeBookmarkTimestamp:(id)a8;
- (void)dealloc;
- (void)removeBookmarkForCanonicalID:(id)a3;
- (void)removeBookmarkForReferenceID:(id)a3;
- (void)resumeTimeInfoForReferenceID:(id)a3 outAbsoluteResumeTime:(id *)a4 outAbsoluteTimestamp:(id *)a5 outMainContentRelativeResumeTime:(id *)a6 outMainContentRelativeTimestamp:(id *)a7;
@end

@implementation VUIStreamingBookmarkCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_38);
  }
  v2 = (void *)sharedInstance_singleton;
  return v2;
}

void __43__VUIStreamingBookmarkCache_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIStreamingBookmarkCache);
  v1 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v0;
}

- (VUIStreamingBookmarkCache)init
{
  v7.receiver = self;
  v7.super_class = (Class)VUIStreamingBookmarkCache;
  v2 = [(VUIStreamingBookmarkCache *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    bookmarkCacheStore = v2->_bookmarkCacheStore;
    v2->_bookmarkCacheStore = v3;
  }
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:v2 selector:sel__activeAccountChangedNotification_ name:*MEMORY[0x1E4FA83B0] object:0];

  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIStreamingBookmarkCache;
  [(VUIStreamingBookmarkCache *)&v4 dealloc];
}

- (void)resumeTimeInfoForReferenceID:(id)a3 outAbsoluteResumeTime:(id *)a4 outAbsoluteTimestamp:(id *)a5 outMainContentRelativeResumeTime:(id *)a6 outMainContentRelativeTimestamp:(id *)a7
{
  id v12 = a3;
  v13 = v12;
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  if (v12)
  {
    bookmarkCacheStore = self->_bookmarkCacheStore;
    if (bookmarkCacheStore && [(NSMutableDictionary *)bookmarkCacheStore count])
    {
      *(void *)buf = 0;
      v29 = buf;
      uint64_t v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__5;
      v32 = __Block_byref_object_dispose__5;
      id v33 = 0;
      v15 = self;
      objc_sync_enter(v15);
      v16 = self->_bookmarkCacheStore;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __166__VUIStreamingBookmarkCache_resumeTimeInfoForReferenceID_outAbsoluteResumeTime_outAbsoluteTimestamp_outMainContentRelativeResumeTime_outMainContentRelativeTimestamp___block_invoke;
      v25[3] = &unk_1E6DF6148;
      v27 = buf;
      id v26 = v13;
      [(NSMutableDictionary *)v16 enumerateKeysAndObjectsUsingBlock:v25];

      objc_sync_exit(v15);
      v17 = (void *)*((void *)v29 + 5);
      if (v17)
      {
        if (a4)
        {
          v18 = [v17 absoluteResumeTime];
          *a4 = (id)[v18 copy];
        }
        if (a5)
        {
          v19 = [*((id *)v29 + 5) absoluteBookmarkTimestamp];
          *a5 = (id)[v19 copy];
        }
        if (a6)
        {
          v20 = [*((id *)v29 + 5) relativeResumeTime];
          *a6 = (id)[v20 copy];
        }
        if (!a7) {
          goto LABEL_30;
        }
        v21 = [*((id *)v29 + 5) relativeBookmarkTimestamp];
        *a7 = [v21 copy];
      }
      else
      {
        v21 = VUIDefaultLogObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_1E2BD7000, v21, OS_LOG_TYPE_DEFAULT, "VUIStreamingBookmarkCache - Reference ID not found", v24, 2u);
        }
      }

LABEL_30:
      _Block_object_dispose(buf, 8);

      goto LABEL_31;
    }
    v22 = VUIDefaultLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v23 = "VUIStreamingBookmarkCache - Empty bookmark cache store";
LABEL_25:
      _os_log_impl(&dword_1E2BD7000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
    }
  }
  else
  {
    v22 = VUIDefaultLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v23 = "VUIStreamingBookmarkCache - resumeTimeInfoForReferenceID: referenceID or canonicalID is nil";
      goto LABEL_25;
    }
  }

LABEL_31:
}

void __166__VUIStreamingBookmarkCache_resumeTimeInfoForReferenceID_outAbsoluteResumeTime_outAbsoluteTimestamp_outMainContentRelativeResumeTime_outMainContentRelativeTimestamp___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v6 = [a3 objectForKey:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

- (void)addBookmarkForReferenceID:(id)a3 canonicalID:(id)a4 absoluteResumeTime:(id)a5 absoluteBookmarkTimestamp:(id)a6 relativeResumeTime:(id)a7 relativeBookmarkTimestamp:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v14 && v15)
  {
    v20 = [[VUIStreamingBookmark alloc] initWithAbsoluteResumeTime:v16 absoluteTimestamp:v17 relativeResumeTime:v18 relativeBookmarkTimestamp:v19];
    v21 = self;
    objc_sync_enter(v21);
    if (v20)
    {
      id v22 = [(NSMutableDictionary *)v21->_bookmarkCacheStore objectForKey:v15];
      if (!v22) {
        id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      [v22 setObject:v20 forKey:v14];
      [(NSMutableDictionary *)v21->_bookmarkCacheStore setObject:v22 forKey:v15];
    }
    objc_sync_exit(v21);
  }
  else
  {
    VUIDefaultLogObject();
    v20 = (VUIStreamingBookmark *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v20->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1E2BD7000, &v20->super, OS_LOG_TYPE_DEFAULT, "VUIStreamingBookmarkCache - Unable to add bookmark because referenceID or canonicalID is nil", v23, 2u);
    }
  }
}

- (void)removeBookmarkForReferenceID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    bookmarkCacheStore = v5->_bookmarkCacheStore;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__VUIStreamingBookmarkCache_removeBookmarkForReferenceID___block_invoke;
    v7[3] = &unk_1E6DF6170;
    id v8 = v4;
    [(NSMutableDictionary *)bookmarkCacheStore enumerateKeysAndObjectsUsingBlock:v7];

    objc_sync_exit(v5);
  }
}

void __58__VUIStreamingBookmarkCache_removeBookmarkForReferenceID___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  uint64_t v6 = [v7 objectForKey:*(void *)(a1 + 32)];

  if (v6)
  {
    [v7 removeObjectForKey:*(void *)(a1 + 32)];
    *a4 = 1;
  }
}

- (void)removeBookmarkForCanonicalID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    [(NSMutableDictionary *)v5->_bookmarkCacheStore removeObjectForKey:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)_activeAccountChangedNotification:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  id v6 = objc_msgSend(v5, "ams_activeiTunesAccount");

  if (!v6)
  {
    id v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIStreamingBookmarkCache - User signs out. clear cached bookmarks", v9, 2u);
    }

    id v8 = self;
    objc_sync_enter(v8);
    [(NSMutableDictionary *)v8->_bookmarkCacheStore removeAllObjects];
    objc_sync_exit(v8);
  }
}

- (void).cxx_destruct
{
}

@end