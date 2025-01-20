@interface MTPlaylistSyncProcessor
- (BOOL)hasLocalChanges;
- (BOOL)mergeData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6 isGetTransaction:(BOOL)a7;
- (BOOL)requiresNextGetTransaction;
- (MTPlaylistSyncProcessor)initWithStorageProvider:(id)a3;
- (MTPlaylistSyncStorageProviding)storageProvider;
- (NSMutableSet)addedPlaylists;
- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5;
- (id)versionForGetTransaction:(id)a3 key:(id)a4;
- (int64_t)operationTypeForSET;
- (void)completeTransactionWithNewVersion:(id)a3 isGetTransaction:(BOOL)a4 mismatch:(BOOL)a5 finishedBlock:(id)a6;
- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)setAddedPlaylists:(id)a3;
- (void)setStorageProvider:(id)a3;
- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4;
@end

@implementation MTPlaylistSyncProcessor

- (MTPlaylistSyncProcessor)initWithStorageProvider:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTPlaylistSyncProcessor;
  v5 = [(MTPlaylistSyncProcessor *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(MTPlaylistSyncProcessor *)v5 setStorageProvider:v4];
    v7 = _MTLogCategoryCloudSync();
    v6->_os_signpost_id_t signpostID = os_signpost_id_generate(v7);

    v8 = _MTLogCategoryCloudSync();
    v9 = v8;
    os_signpost_id_t signpostID = v6->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, signpostID, "MTPlaylistSyncProcessor.created", "", v12, 2u);
    }
  }
  return v6;
}

- (int64_t)operationTypeForSET
{
  return 3;
}

- (BOOL)hasLocalChanges
{
  v2 = [(MTPlaylistSyncProcessor *)self storageProvider];
  unsigned __int8 v3 = [v2 playlistSyncDirtyFlag];

  return v3;
}

- (BOOL)requiresNextGetTransaction
{
  return 1;
}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  id v5 = a4;
  v6 = _MTLogCategoryCloudSync();
  v7 = v6;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "MTPlaylistSyncProcessor.GET", "key: %@", (uint8_t *)&v12, 0xCu);
  }

  v9 = [(MTPlaylistSyncProcessor *)self storageProvider];
  v10 = [v9 playlistSyncVersion];

  return v10;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  id v7 = a4;
  v8 = _MTLogCategoryCloudSync();
  v9 = v8;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "MTPlaylistSyncProcessor.SET", "key: %@", buf, 0xCu);
  }

  v11 = [(MTPlaylistSyncProcessor *)self storageProvider];
  if ([v11 playlistSyncDirtyFlag])
  {

LABEL_8:
    v15 = [(MTPlaylistSyncProcessor *)self storageProvider];
    *a5 = [v15 playlistSyncVersion];

    v16 = [(MTPlaylistSyncProcessor *)self storageProvider];
    v17 = [v16 importContext];

    v18 = objc_opt_new();
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100167B74;
    v23[3] = &unk_10054E708;
    id v19 = v17;
    id v24 = v19;
    v25 = self;
    id v20 = v18;
    id v26 = v20;
    [v19 performBlockAndWait:v23];
    if (v20)
    {
      v21 = objc_alloc_init(MZKeyValueStoreNode);
      [(MZKeyValueStoreNode *)v21 setArrayValue:v20];
      v14 = [(MZKeyValueStoreNode *)v21 value];
    }
    else
    {
      v14 = 0;
    }

    goto LABEL_12;
  }
  int v12 = [(MTPlaylistSyncProcessor *)self storageProvider];
  id v13 = [v12 playlistSyncVersion];

  if (!v13) {
    goto LABEL_8;
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  id v5 = a4;
  id v6 = [(MTPlaylistSyncProcessor *)self storageProvider];
  [v6 setPodcastsDomainVersion:v5];
}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  [(MTPlaylistSyncProcessor *)self completeTransactionWithNewVersion:v12 isGetTransaction:1 mismatch:[(MTPlaylistSyncProcessor *)self mergeData:a4 forKey:a5 version:v12 mismatch:0 isGetTransaction:1] finishedBlock:v11];
}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  [(MTPlaylistSyncProcessor *)self completeTransactionWithNewVersion:v12 isGetTransaction:0 mismatch:[(MTPlaylistSyncProcessor *)self mergeData:a4 forKey:a5 version:v12 mismatch:1 isGetTransaction:0] finishedBlock:v11];
}

- (BOOL)mergeData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6 isGetTransaction:(BOOL)a7
{
  id v10 = a4;
  id v11 = a3;
  id v12 = [(MTPlaylistSyncProcessor *)self storageProvider];
  id v13 = [v12 playlistSyncVersion];

  if (!v13)
  {
    v14 = [(MTPlaylistSyncProcessor *)self storageProvider];
    [v14 setPlaylistSyncDirtyFlag:1];
  }
  v15 = objc_alloc_init(MZKeyValueStoreNode);
  [(MZKeyValueStoreNode *)v15 setKey:v10];

  [(MZKeyValueStoreNode *)v15 setValue:v11];
  if ([(MZKeyValueStoreNode *)v15 hasData])
  {
    v16 = [(MZKeyValueStoreNode *)v15 arrayValue];
    v17 = [(MTPlaylistSyncProcessor *)self storageProvider];
    v18 = [v17 importContext];

    id v19 = [MTPlaylistSyncDictionaryMerge alloc];
    id v20 = _MTLogCategoryCloudSync();
    v21 = [(MTPlaylistSyncDictionaryMerge *)v19 initWithLoggingCategory:v20 dictionariesToMerge:v16];

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100168750;
    v23[3] = &unk_1005527D0;
    void v23[4] = self;
    [(MTPlaylistSyncDictionaryMerge *)v21 setCanDeletePlaylistUUIDBlock:v23];
    [(MTPlaylistSyncDictionaryMerge *)v21 performAndWaitWithContext:v18 save:1];
  }
  return a6;
}

- (void)completeTransactionWithNewVersion:(id)a3 isGetTransaction:(BOOL)a4 mismatch:(BOOL)a5 finishedBlock:(id)a6
{
  BOOL v6 = a5;
  v9 = (void (**)(id, BOOL))a6;
  id v10 = a3;
  id v11 = _MTLogCategoryCloudSync();
  id v12 = v11;
  os_signpost_id_t signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    CFStringRef v14 = @"NO";
    if (v6) {
      CFStringRef v14 = @"YES";
    }
    int v17 = 138412290;
    CFStringRef v18 = v14;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, signpostID, "MTPlaylistSyncProcessor.completed", "mismatch %@", (uint8_t *)&v17, 0xCu);
  }

  v15 = [(MTPlaylistSyncProcessor *)self storageProvider];
  [v15 setPlaylistSyncDirtyFlag:v6];

  v9[2](v9, v6);
  v16 = [(MTPlaylistSyncProcessor *)self storageProvider];
  [v16 setPlaylistSyncVersion:v10];
}

- (NSMutableSet)addedPlaylists
{
  return self->_addedPlaylists;
}

- (void)setAddedPlaylists:(id)a3
{
}

- (MTPlaylistSyncStorageProviding)storageProvider
{
  return self->_storageProvider;
}

- (void)setStorageProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageProvider, 0);

  objc_storeStrong((id *)&self->_addedPlaylists, 0);
}

@end