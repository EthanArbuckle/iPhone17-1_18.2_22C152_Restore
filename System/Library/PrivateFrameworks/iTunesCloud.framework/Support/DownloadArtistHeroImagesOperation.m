@interface DownloadArtistHeroImagesOperation
- (int64_t)currentDatabaseRevision;
- (void)main;
- (void)setCurrentDatabaseRevision:(int64_t)a3;
@end

@implementation DownloadArtistHeroImagesOperation

- (void)setCurrentDatabaseRevision:(int64_t)a3
{
  self->_currentDatabaseRevision = a3;
}

- (int64_t)currentDatabaseRevision
{
  return self->_currentDatabaseRevision;
}

- (void)main
{
  v3 = [(QueueAwareOperation *)self musicLibrary];
  +[NSMutableDictionary dictionary];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100072784;
  v30[3] = &unk_1001BB928;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v31 = v4;
  [v3 databaseConnectionAllowingWrites:0 withBlock:v30];
  v5 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found %lu artist artwork tokens to download", (uint8_t *)&buf, 0xCu);
  }

  v7 = +[NSMutableArray array];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2050000000;
  v8 = (void *)qword_1001F38A8;
  uint64_t v35 = qword_1001F38A8;
  if (!qword_1001F38A8)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v37 = sub_1000728CC;
    v38 = &unk_1001BE9E8;
    v39 = &v32;
    sub_1000728CC((uint64_t)&buf);
    v8 = (void *)v33[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v32, 8);
  uint64_t v10 = [(QueueAwareOperation *)self userIdentity];
  v24 = [v9 deviceMediaLibraryWithUserIdentity:v10];

  v11 = [v24 artworkDataSource];
  [v11 setUsesFallbackCache:0];

  v12 = +[ICCloudAvailabilityController sharedController];
  LOBYTE(v10) = [v12 isCellularDataRestrictedForMusic];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100072AB8;
  v25[3] = &unk_1001BB950;
  id v13 = v3;
  id v26 = v13;
  v27 = self;
  char v29 = v10 ^ 1;
  id v14 = v7;
  id v28 = v14;
  [v4 enumerateKeysAndObjectsUsingBlock:v25];
  if ([(DownloadArtistHeroImagesOperation *)self isCancelled])
  {
    v15 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Cancelled after starting downloads for artist hero images.", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    if ([v14 count])
    {
      v16 = [(QueueAwareOperation *)self artworkImporter];
      [v16 importCloudArtworkForRequests:v14];
    }
    v17 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Enqueued all artist hero images to download.", (uint8_t *)&buf, 2u);
    }

    v15 = [(QueueAwareOperation *)self operationQueue];
    if (v15)
    {
      v18 = [FinishArtistHeroUpdateOperation alloc];
      v19 = [(QueueAwareOperation *)self artworkImporter];
      v20 = [(QueueAwareOperation *)self clientIdentity];
      v21 = [(QueueAwareOperation *)self artistPersistentIDsToUpdate];
      v22 = [(QueueAwareOperation *)self albumArtistPersistentIDsToUpdate];
      v23 = [(QueueAwareOperation *)v18 initWithArtworkImporter:v19 clientIdentity:v20 operationQueue:v15 artistPersistentIDsToUpdate:v21 albumArtistPersistentIDsToUpdate:v22];

      [(FinishArtistHeroUpdateOperation *)v23 setCurrentDatabaseRevision:[(DownloadArtistHeroImagesOperation *)self currentDatabaseRevision]];
      [v15 addOperation:v23];
    }
  }
}

@end