@interface SagaImporter
- (BOOL)_updateGlobalPlaylistsFromContainersPayloadAtPath:(id)a3 downloadPathForSubscribedContainersPayload:(id)a4;
- (BOOL)isCancelled;
- (CloudLibraryConnection)connection;
- (ICConnectionConfiguration)configuration;
- (SagaImporter)initWithConnection:(id)a3 serverInitiatedReset:(BOOL)a4 clientInitiatedReset:(BOOL)a5 clientFeaturesVersion:(id)a6 clientIdentity:(id)a7 fromRevision:(unsigned int)a8 toRevision:(unsigned int)a9;
- (float)progress;
- (id)_importDataFromResponseFileURLs:(id)a3;
- (id)description;
- (void)_fetchUpdatedAlbumsWithCompletion:(id)a3;
- (void)_fetchUpdatedAlbumsWithPaginationToken:(id)a3 responseFileURLs:(id)a4 completion:(id)a5;
- (void)_fetchUpdatedArtistsWithCompletion:(id)a3;
- (void)_fetchUpdatedArtistsWithPaginationToken:(id)a3 responseFileURLs:(id)a4 completion:(id)a5;
- (void)_fetchUpdatedPlaylistsWithCompletion:(id)a3;
- (void)_fetchUpdatedTracksWithCompletion:(id)a3;
- (void)_fetchUpdatedTracksWithPaginationToken:(id)a3 responseFileURLs:(id)a4 currentIncludesBookmarkable:(BOOL)a5 cloudIDToLyricsTokenMap:(id)a6 completion:(id)a7;
- (void)_importLyricsWithLyricsTokenMap:(id)a3;
- (void)_removeUnavailableSubscriptionAssetsInLibrary:(id)a3;
- (void)_updateProgressWithItemsProgress:(float)itemsProgress albumsProgress:(float)albumsProgress artistsProgress:(float)artistsProgress playlistProgress:(float)playlistProgress importerProgress:(float)a7;
- (void)cancel;
- (void)performUpdateWithCompletionHandler:(id)a3;
@end

@implementation SagaImporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientFeaturesVersionString, 0);
  objc_storeStrong((id *)&self->_updateBaseDirectory, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);

  objc_storeStrong((id *)&self->_userIdentity, 0);
}

- (float)progress
{
  return self->_progress;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (CloudLibraryConnection)connection
{
  return self->_connection;
}

- (void)_fetchUpdatedArtistsWithPaginationToken:(id)a3 responseFileURLs:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SagaImporter *)self connection];
  v12 = [(NSString *)self->_updateBaseDirectory stringByAppendingPathComponent:@"Artists"];
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"artists_%lu.daap", (char *)[v9 count] + 1);
  v30[0] = v12;
  v30[1] = v13;
  v14 = +[NSArray arrayWithObjects:v30 count:2];
  v15 = +[NSURL fileURLWithPathComponents:v14];

  v16 = -[ICArtistsRequest initWithDatabaseID:paginationToken:]([ICArtistsRequest alloc], "initWithDatabaseID:paginationToken:", [v11 databaseID], v8);
  unsigned int fromRevision = self->_fromRevision;
  if (fromRevision)
  {
    uint64_t toRevision = self->_toRevision;
    if (toRevision > fromRevision)
    {
      if (!self->_serverInitiatedReset && !self->_clientInitiatedReset)
      {
        v19 = +[NSString stringWithFormat:@"%u", self->_fromRevision];
        [(ICDRequest *)v16 setValue:v19 forArgument:@"delta"];

        uint64_t toRevision = self->_toRevision;
      }
      v20 = +[NSString stringWithFormat:@"%u", toRevision];
      [(ICDRequest *)v16 setValue:v20 forArgument:@"revision-id"];
    }
  }
  if ([v8 length]) {
    [(ICDRequest *)v16 setValue:v8 forArgument:@"dmap.paginationtoken"];
  }
  [(ICDRequest *)v16 setSagaClientFeaturesVersion:self->_clientFeaturesVersionString];
  [(ICDRequest *)v16 setResponseDataDestinationFileURL:v15];
  [(ICDRequest *)v16 setAllowedRetryCount:5];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000AD23C;
  v25[3] = &unk_1001BC4C0;
  id v28 = v12;
  id v29 = v10;
  v25[4] = self;
  id v26 = v15;
  id v27 = v9;
  id v21 = v12;
  id v22 = v9;
  id v23 = v15;
  id v24 = v10;
  [v11 sendRequest:v16 withResponseHandler:v25];
}

- (void)_fetchUpdatedArtistsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting artist update", (uint8_t *)&v7, 0xCu);
  }

  v6 = +[NSMutableArray array];
  [(SagaImporter *)self _fetchUpdatedArtistsWithPaginationToken:0 responseFileURLs:v6 completion:v4];
}

- (void)_fetchUpdatedAlbumsWithPaginationToken:(id)a3 responseFileURLs:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SagaImporter *)self connection];
  v12 = [(NSString *)self->_updateBaseDirectory stringByAppendingPathComponent:@"Albums"];
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"albums_%lu.daap", (char *)[v9 count] + 1);
  v30[0] = v12;
  v30[1] = v13;
  v14 = +[NSArray arrayWithObjects:v30 count:2];
  v15 = +[NSURL fileURLWithPathComponents:v14];

  v16 = -[ICAlbumsRequest initWithDatabaseID:paginationToken:]([ICAlbumsRequest alloc], "initWithDatabaseID:paginationToken:", [v11 databaseID], v8);
  unsigned int fromRevision = self->_fromRevision;
  if (fromRevision)
  {
    uint64_t toRevision = self->_toRevision;
    if (toRevision > fromRevision)
    {
      if (!self->_serverInitiatedReset && !self->_clientInitiatedReset)
      {
        v19 = +[NSString stringWithFormat:@"%u", self->_fromRevision];
        [(ICDRequest *)v16 setValue:v19 forArgument:@"delta"];

        uint64_t toRevision = self->_toRevision;
      }
      v20 = +[NSString stringWithFormat:@"%u", toRevision];
      [(ICDRequest *)v16 setValue:v20 forArgument:@"revision-id"];
    }
  }
  if ([v8 length]) {
    [(ICDRequest *)v16 setValue:v8 forArgument:@"dmap.paginationtoken"];
  }
  [(ICDRequest *)v16 setSagaClientFeaturesVersion:self->_clientFeaturesVersionString];
  [(ICDRequest *)v16 setResponseDataDestinationFileURL:v15];
  [(ICDRequest *)v16 setAllowedRetryCount:5];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000ADBA4;
  v25[3] = &unk_1001BC4C0;
  id v28 = v12;
  id v29 = v10;
  v25[4] = self;
  id v26 = v15;
  id v27 = v9;
  id v21 = v12;
  id v22 = v9;
  id v23 = v15;
  id v24 = v10;
  [v11 sendRequest:v16 withResponseHandler:v25];
}

- (void)_fetchUpdatedAlbumsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting albums update", (uint8_t *)&v7, 0xCu);
  }

  v6 = +[NSMutableArray array];
  [(SagaImporter *)self _fetchUpdatedAlbumsWithPaginationToken:0 responseFileURLs:v6 completion:v4];
}

- (void)_fetchUpdatedPlaylistsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting playlists update", buf, 0xCu);
  }

  v6 = [(SagaImporter *)self connection];
  v23[0] = self->_updateBaseDirectory;
  v23[1] = @"containers.daap";
  int v7 = +[NSArray arrayWithObjects:v23 count:2];
  id v8 = +[NSURL fileURLWithPathComponents:v7];

  id v9 = +[ML3MusicLibrary musicLibraryForUserAccount:self->_userIdentity];
  [v9 setClientIdentity:self->_clientIdentity];
  id v10 = [v9 valueForDatabaseProperty:@"MLCloudNeedsContainerRefetch"];
  unsigned int v11 = [v10 BOOLValue];

  if (v11) {
    [v9 setValue:0 forDatabaseProperty:@"MLCloudNeedsContainerRefetch"];
  }
  v12 = +[ICContainersRequest requestWithDatabaseID:](ICContainersRequest, "requestWithDatabaseID:", [v6 databaseID]);
  unsigned int fromRevision = self->_fromRevision;
  if (fromRevision)
  {
    uint64_t toRevision = self->_toRevision;
    char v15 = toRevision <= fromRevision ? 1 : v11;
    if ((v15 & 1) == 0)
    {
      if (!self->_serverInitiatedReset && !self->_clientInitiatedReset)
      {
        v16 = +[NSString stringWithFormat:@"%u", self->_fromRevision];
        [v12 setValue:v16 forArgument:@"delta"];

        uint64_t toRevision = self->_toRevision;
      }
      v17 = +[NSString stringWithFormat:@"%u", toRevision];
      [v12 setValue:v17 forArgument:@"revision-id"];
    }
  }
  [v12 setSagaClientFeaturesVersion:self->_clientFeaturesVersionString];
  [v12 setValue:@"daap.playlistsongs" forArgument:@"meta"];
  [v12 setResponseDataDestinationFileURL:v8];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000AE53C;
  v20[3] = &unk_1001BC498;
  id v21 = v8;
  id v22 = v4;
  v20[4] = self;
  id v18 = v8;
  id v19 = v4;
  [v6 sendRequest:v12 withResponseHandler:v20];
}

- (void)_fetchUpdatedTracksWithPaginationToken:(id)a3 responseFileURLs:(id)a4 currentIncludesBookmarkable:(BOOL)a5 cloudIDToLyricsTokenMap:(id)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  id v14 = a3;
  char v15 = [(SagaImporter *)self connection];
  v16 = [(NSString *)self->_updateBaseDirectory stringByAppendingPathComponent:@"Items"];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"items_%lu.daap", (char *)[v11 count] + 1);
  uint64_t v40 = v39 = v16;
  v31 = (void *)v40;
  v17 = +[NSArray arrayWithObjects:&v39 count:2];
  id v18 = +[NSURL fileURLWithPathComponents:v17];

  id v19 = +[ICItemsRequest requestWithDatabaseID:paginationToken:](ICItemsRequest, "requestWithDatabaseID:paginationToken:", [v15 databaseID], v14);

  [v19 setValue:@"all" forArgument:@"meta"];
  unsigned int fromRevision = self->_fromRevision;
  if (fromRevision)
  {
    uint64_t toRevision = self->_toRevision;
    if (toRevision > fromRevision)
    {
      if (self->_serverInitiatedReset)
      {
        id v22 = &ML3TrackPropertyLyrics_ptr;
      }
      else
      {
        id v22 = &ML3TrackPropertyLyrics_ptr;
        if (!self->_clientInitiatedReset)
        {
          id v23 = +[NSString stringWithFormat:@"%u", self->_fromRevision];
          [v19 setValue:v23 forArgument:@"delta"];

          uint64_t toRevision = self->_toRevision;
        }
      }
      id v24 = objc_msgSend(v22[250], "stringWithFormat:", @"%u", toRevision);
      [v19 setValue:v24 forArgument:@"revision-id"];
    }
  }
  [v19 setSagaClientFeaturesVersion:self->_clientFeaturesVersionString];
  [v19 setResponseDataDestinationFileURL:v18];
  [v19 setAllowedRetryCount:5];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000AEB00;
  v32[3] = &unk_1001BC470;
  v32[4] = self;
  id v33 = v18;
  id v34 = v11;
  id v35 = v16;
  BOOL v38 = a5;
  id v36 = v12;
  id v37 = v13;
  id v25 = v12;
  id v26 = v16;
  id v27 = v11;
  id v28 = v18;
  id v29 = v13;
  [v15 sendRequest:v19 withResponseHandler:v32];
}

- (void)_fetchUpdatedTracksWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting items update", (uint8_t *)&v8, 0xCu);
  }

  v6 = +[NSMutableArray array];
  int v7 = +[NSMutableDictionary dictionary];
  [(SagaImporter *)self _fetchUpdatedTracksWithPaginationToken:0 responseFileURLs:v6 currentIncludesBookmarkable:0 cloudIDToLyricsTokenMap:v7 completion:v4];
}

- (id)_importDataFromResponseFileURLs:(id)a3
{
  v3 = objc_msgSend(a3, "msv_map:", &stru_1001BC448);
  id v4 = ML3DatabaseImportDataForDAAPFilePaths();

  return v4;
}

- (BOOL)_updateGlobalPlaylistsFromContainersPayloadAtPath:(id)a3 downloadPathForSubscribedContainersPayload:(id)a4
{
  id v6 = a4;
  int v7 = +[NSURL fileURLWithPath:a3];
  int v8 = +[NSInputStream inputStreamWithURL:v7];
  id v9 = [objc_alloc((Class)DKDAAPParser) initWithStream:v8];
  id v10 = objc_alloc_init(ContainerCloudIDsParserDelegate);
  [v9 setDelegate:v10];
  [v9 parse];
  id v11 = [(ContainerCloudIDsParserDelegate *)v10 subscribedPlaylistCloudIDs];

  id v12 = [SagaSubscribedPlaylistUpdater alloc];
  id v13 = [(SagaImporter *)self connection];
  id v14 = [(SagaSubscribedPlaylistUpdater *)v12 initWithSubscribedPlaylistCloudIDs:v11 cloudLibraryConnection:v13];

  [(SagaSubscribedPlaylistUpdater *)v14 setPayloadDownloadPathOverride:v6];
  [(SagaSubscribedPlaylistUpdater *)v14 setIgnoreMinRefreshInterval:1];
  clientIdentity = self->_clientIdentity;
  id v20 = 0;
  unsigned __int8 v16 = [(SagaSubscribedPlaylistUpdater *)v14 performUpdateWithClientIdentity:clientIdentity error:&v20];
  id v17 = v20;
  if ((v16 & 1) == 0)
  {
    id v18 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v22 = self;
      __int16 v23 = 2114;
      id v24 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@ Error updating global playlists: %{public}@", buf, 0x16u);
    }
  }
  return v16;
}

- (void)_importLyricsWithLyricsTokenMap:(id)a3
{
  id v9 = [a3 allKeys];
  id v4 = [SagaLoadLyricsOperation alloc];
  v5 = [(SagaImporter *)self configuration];
  id v6 = [(SagaLoadLyricsOperation *)v4 initWithConfiguration:v5 clientIdentity:self->_clientIdentity sagaIDs:v9];

  [(SagaLoadLyricsOperation *)v6 setName:@"com.apple.itunescloudd.SagaImporter.loadLyricsOperation"];
  int v7 = [(SagaImporter *)self configuration];
  int v8 = +[BaseRequestHandler handlerForConfiguration:v7];
  [v8 addBackgroundOperation:v6 forLibraryType:1 priority:1];
}

- (void)_removeUnavailableSubscriptionAssetsInLibrary:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000AF620;
  v5[3] = &unk_1001BE540;
  id v6 = a3;
  int v7 = self;
  id v4 = v6;
  [v4 performDatabaseTransactionWithBlock:v5];
}

- (void)_updateProgressWithItemsProgress:(float)itemsProgress albumsProgress:(float)albumsProgress artistsProgress:(float)artistsProgress playlistProgress:(float)playlistProgress importerProgress:(float)a7
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (itemsProgress == 0.0) {
    itemsProgress = self->_itemsProgress;
  }
  self->_itemsProgress = itemsProgress;
  if (albumsProgress == 0.0) {
    albumsProgress = self->_albumsProgress;
  }
  self->_albumsProgress = albumsProgress;
  if (artistsProgress == 0.0) {
    artistsProgress = self->_artistsProgress;
  }
  self->_artistsProgress = artistsProgress;
  if (playlistProgress == 0.0) {
    playlistProgress = self->_playlistProgress;
  }
  self->_playlistProgress = playlistProgress;
  float importerProgress = a7;
  if (a7 == 0.0) {
    float importerProgress = self->_importerProgress;
  }
  self->_float importerProgress = importerProgress;
  self->_progress = (float)((float)((float)((float)((float)(albumsProgress * 10.0) + (float)(itemsProgress * 10.0))
                                          + (float)(artistsProgress * 10.0))
                                  + (float)(playlistProgress * 10.0))
                          + (float)(a7 * 60.0))
                  / 100.0;

  os_unfair_lock_unlock(p_lock);
}

- (void)performUpdateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL serverInitiatedReset = self->_serverInitiatedReset;
    BOOL clientInitiatedReset = self->_clientInitiatedReset;
    clientFeaturesVersionString = self->_clientFeaturesVersionString;
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = serverInitiatedReset;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = clientInitiatedReset;
    LOWORD(v56) = 2114;
    *(void *)((char *)&v56 + 2) = clientFeaturesVersionString;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Performing saga update - serverInitiatedReset=%{BOOL}u, clientInitiatedReset=%{BOOL}u, clientFeaturesVersionString=%{public}@", buf, 0x22u);
  }

  self->_progress = 0.0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&long long v56 = sub_1000B01BC;
  *((void *)&v56 + 1) = sub_1000B01CC;
  id v57 = 0;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = sub_1000B01BC;
  v53[4] = sub_1000B01CC;
  id v54 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = sub_1000B01BC;
  v51[4] = sub_1000B01CC;
  id v52 = 0;
  id v48 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = sub_1000B01BC;
  v49[4] = sub_1000B01CC;
  id v50 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = sub_1000B01BC;
  v47[4] = sub_1000B01CC;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  char v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = sub_1000B01BC;
  v43[4] = sub_1000B01CC;
  id v44 = 0;
  id v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000B01D4;
  v37[3] = &unk_1001BC340;
  v37[4] = self;
  v39 = buf;
  uint64_t v40 = v49;
  v41 = v45;
  v42 = v43;
  id v10 = v9;
  BOOL v38 = v10;
  [(SagaImporter *)self _fetchUpdatedTracksWithCompletion:v37];
  dispatch_group_enter(v10);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000B02D0;
  v33[3] = &unk_1001BC368;
  v33[4] = self;
  id v35 = buf;
  id v36 = v51;
  id v11 = v10;
  id v34 = v11;
  [(SagaImporter *)self _fetchUpdatedAlbumsWithCompletion:v33];
  dispatch_group_enter(v11);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000B0388;
  v29[3] = &unk_1001BC368;
  v29[4] = self;
  v31 = buf;
  v32 = v53;
  id v12 = v11;
  v30 = v12;
  [(SagaImporter *)self _fetchUpdatedArtistsWithCompletion:v29];
  dispatch_group_enter(v12);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000B0440;
  v25[3] = &unk_1001BC390;
  v25[4] = self;
  id v27 = buf;
  id v28 = v47;
  id v13 = v12;
  id v26 = v13;
  [(SagaImporter *)self _fetchUpdatedPlaylistsWithCompletion:v25];
  id v14 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B04F8;
  block[3] = &unk_1001BC3E0;
  block[4] = self;
  id v17 = v4;
  id v18 = buf;
  id v19 = v49;
  id v20 = v47;
  id v21 = v53;
  id v22 = v51;
  __int16 v23 = v43;
  id v24 = v45;
  id v15 = v4;
  dispatch_group_notify(v13, v14, block);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);
  _Block_object_dispose(v47, 8);

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);

  _Block_object_dispose(v53, 8);
  _Block_object_dispose(buf, 8);
}

- (void)cancel
{
  self->_isCancelled = 1;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v3 = +[MLMediaLibraryService sharedMediaLibraryService];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B126C;
  v5[3] = &unk_1001BDE80;
  dispatch_semaphore_t v6 = v2;
  id v4 = v2;
  [v3 cancelImportOperation:2 completionHandler:v5];

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ %p [identity=%@, serverInitiatedReset=%d, clientInitiatedReset=%d, revision %u --> %u]>", objc_opt_class(), self, self->_userIdentity, self->_serverInitiatedReset, self->_clientInitiatedReset, self->_fromRevision, self->_toRevision];
}

- (SagaImporter)initWithConnection:(id)a3 serverInitiatedReset:(BOOL)a4 clientInitiatedReset:(BOOL)a5 clientFeaturesVersion:(id)a6 clientIdentity:(id)a7 fromRevision:(unsigned int)a8 toRevision:(unsigned int)a9
{
  id v17 = a3;
  id v18 = a6;
  id v19 = a7;
  if (!v17)
  {
    id v33 = +[NSAssertionHandler currentHandler];
    [v33 handleFailureInMethod:a2, self, @"SagaImporter.m", 64, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }
  v34.receiver = self;
  v34.super_class = (Class)SagaImporter;
  id v20 = [(SagaImporter *)&v34 init];
  id v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_connection, a3);
    uint64_t v22 = [v17 configuration];
    configuration = v21->_configuration;
    v21->_configuration = (ICConnectionConfiguration *)v22;

    uint64_t v24 = [v17 userIdentity];
    userIdentity = v21->_userIdentity;
    v21->_userIdentity = (ICUserIdentity *)v24;

    v21->_BOOL clientInitiatedReset = a5;
    v21->_BOOL serverInitiatedReset = a4;
    v21->_unsigned int fromRevision = a8;
    v21->_uint64_t toRevision = a9;
    v21->_lock._os_unfair_lock_opaque = 0;
    id v26 = NSTemporaryDirectory();
    v35[0] = v26;
    v35[1] = @"com.apple.MediaServices";
    id v27 = +[NSUUID UUID];
    id v28 = [v27 UUIDString];
    v35[2] = v28;
    id v29 = +[NSArray arrayWithObjects:v35 count:3];
    uint64_t v30 = +[NSString pathWithComponents:v29];
    updateBaseDirectory = v21->_updateBaseDirectory;
    v21->_updateBaseDirectory = (NSString *)v30;

    objc_storeStrong((id *)&v21->_clientFeaturesVersionString, a6);
  }

  return v21;
}

@end