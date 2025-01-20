@interface CloudArtistHeroImageImporter
+ (id)allArtistImagesMapCacheFilePathURL;
- (CloudArtistHeroImageImporter)initWithConfiguration:(id)a3;
- (CloudArtworkImporter)artworkImporter;
- (DetermineArtistStoreIDLookupTypeOperation)currentUpdateOperation;
- (DetermineArtistStoreIDLookupTypeOperation)followupUpdateOpertion;
- (ICConnectionConfiguration)configuration;
- (ML3MusicLibrary)musicLibrary;
- (MSVWatchdog)watchdog;
- (NSOperationQueue)operationQueue;
- (NSString)powerAssertionIdentifier;
- (OS_dispatch_queue)accessQueue;
- (id)userIdentity;
- (int64_t)_synchronouslyLoadArtistUpdatePollingFrequencyFromBag;
- (void)_artistHeroImageUpdateFinished;
- (void)_importHeroImageForArtistType:(int64_t)a3 withPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)cancelArtistHeroImageUpdate;
- (void)cancelArtistHeroImageUpdateAndWaitForOperationToFinish:(BOOL)a3;
- (void)deprioritizeAlbumArtistHeroImageForPersistentID:(int64_t)a3;
- (void)deprioritizeArtistHeroImageForPersistentID:(int64_t)a3;
- (void)importAlbumArtistHeroImageForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importArtistHeroImageForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAccessQueue:(id)a3;
- (void)setArtworkImporter:(id)a3;
- (void)setCurrentUpdateOperation:(id)a3;
- (void)setFollowupUpdateOpertion:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPowerAssertionIdentifier:(id)a3;
- (void)setWatchdog:(id)a3;
- (void)updateArtistHeroImagesForArtistsAddedSinceLastUpdateUsingClientIdentity:(id)a3;
- (void)updateArtistHeroImagesWithClientIdentity:(id)a3;
@end

@implementation CloudArtistHeroImageImporter

- (id)userIdentity
{
  v2 = [(CloudArtistHeroImageImporter *)self configuration];
  v3 = [v2 userIdentity];

  return v3;
}

- (void)updateArtistHeroImagesWithClientIdentity:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CloudArtistHeroImageImporter *)self _synchronouslyLoadArtistUpdatePollingFrequencyFromBag];
  v6 = [(CloudArtistHeroImageImporter *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009898;
  block[3] = &unk_1001BDCF8;
  id v9 = v4;
  int64_t v10 = v5;
  block[4] = self;
  id v7 = v4;
  dispatch_async(v6, block);
}

- (int64_t)_synchronouslyLoadArtistUpdatePollingFrequencyFromBag
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_10006E8D4;
  v25 = sub_10006E8E4;
  id v26 = 0;
  id v4 = objc_alloc((Class)ICStoreRequestContext);
  int64_t v5 = [(CloudArtistHeroImageImporter *)self userIdentity];
  id v6 = [v4 initWithIdentity:v5];

  id v7 = +[ICURLBagProvider sharedBagProvider];
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  v17 = sub_100005A44;
  v18 = &unk_1001BB7C0;
  v20 = &v21;
  v8 = v3;
  v19 = v8;
  [v7 getBagForRequestContext:v6 withCompletionHandler:&v15];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (void *)v22[5];
  if (v9)
  {
    int64_t v10 = objc_msgSend(v9, "numberForBagKey:", @"min-artist-update-polling-frequency-secs", v15, v16, v17, v18);
    if (objc_opt_respondsToSelector())
    {
      int64_t v11 = (int64_t)[v10 integerValue];
      v12 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v28 = v11;
        v13 = "Using polling frequency from bag: %ld";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
      }
    }
    else
    {
      int64_t v11 = 604800;
      v12 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v28 = 604800;
        v13 = "Failed to get polling frequency from the URL bag, using default polling frequency: %ld";
        goto LABEL_10;
      }
    }
  }
  else
  {
    int64_t v11 = 604800;
    v12 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v28 = 604800;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to receive response for URL bag, using default polling frequency: %ld", buf, 0xCu);
    }
    int64_t v10 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (ML3MusicLibrary)musicLibrary
{
  return self->_musicLibrary;
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkImporter, 0);
  objc_storeStrong((id *)&self->_followupUpdateOpertion, 0);
  objc_storeStrong((id *)&self->_currentUpdateOperation, 0);
  objc_storeStrong((id *)&self->_watchdog, 0);
  objc_storeStrong((id *)&self->_powerAssertionIdentifier, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_musicLibrary, 0);
}

- (void)setArtworkImporter:(id)a3
{
}

- (void)setFollowupUpdateOpertion:(id)a3
{
}

- (DetermineArtistStoreIDLookupTypeOperation)followupUpdateOpertion
{
  return self->_followupUpdateOpertion;
}

- (void)setCurrentUpdateOperation:(id)a3
{
}

- (DetermineArtistStoreIDLookupTypeOperation)currentUpdateOperation
{
  return self->_currentUpdateOperation;
}

- (void)setWatchdog:(id)a3
{
}

- (MSVWatchdog)watchdog
{
  return self->_watchdog;
}

- (void)setPowerAssertionIdentifier:(id)a3
{
}

- (NSString)powerAssertionIdentifier
{
  return self->_powerAssertionIdentifier;
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (void)_importHeroImageForArtistType:(int64_t)a3 withPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v12 = +[ICCloudAvailabilityController sharedController];
  char v13 = [v12 isCellularDataRestrictedForMusic] ^ 1;

  v14 = [(CloudArtistHeroImageImporter *)self musicLibrary];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10006E54C;
  v17[3] = &unk_1001BB810;
  int64_t v21 = a3;
  int64_t v22 = a4;
  v19 = self;
  id v20 = v11;
  char v23 = v13;
  id v18 = v10;
  id v15 = v11;
  id v16 = v10;
  [v14 databaseConnectionAllowingWrites:0 withBlock:v17];
}

- (void)_artistHeroImageUpdateFinished
{
  dispatch_semaphore_t v3 = [(CloudArtistHeroImageImporter *)self accessQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006E9E4;
  block[3] = &unk_1001BEC20;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a5;
  if ([a3 isEqualToString:@"operationCount"])
  {
    id v9 = [v8 objectForKey:NSKeyValueChangeNewKey];
    id v10 = [v9 unsignedIntegerValue];

    id v11 = [v8 objectForKey:NSKeyValueChangeOldKey];
    id v12 = [v11 unsignedIntegerValue];

    char v13 = [(CloudArtistHeroImageImporter *)self accessQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006EBE4;
    block[3] = &unk_1001BDD20;
    block[4] = self;
    void block[5] = v10;
    block[6] = v12;
    dispatch_async(v13, block);
  }
}

- (void)deprioritizeAlbumArtistHeroImageForPersistentID:(int64_t)a3
{
  id v4 = [(CloudArtistHeroImageImporter *)self artworkImporter];
  [v4 deprioritizeImportArtworkForCloudID:a3 artworkType:4];
}

- (void)deprioritizeArtistHeroImageForPersistentID:(int64_t)a3
{
  id v4 = [(CloudArtistHeroImageImporter *)self artworkImporter];
  [v4 deprioritizeImportArtworkForCloudID:a3 artworkType:4];
}

- (void)importAlbumArtistHeroImageForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
}

- (void)importArtistHeroImageForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
}

- (void)cancelArtistHeroImageUpdateAndWaitForOperationToFinish:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(CloudArtistHeroImageImporter *)self operationQueue];
  [v5 cancelAllOperations];

  id v6 = [(CloudArtistHeroImageImporter *)self artworkImporter];
  [v6 cancelAllImportsAndWaitForOperationsToFinish:v3];

  id v7 = [(CloudArtistHeroImageImporter *)self accessQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006EF90;
  v8[3] = &unk_1001BDD48;
  v8[4] = self;
  BOOL v9 = v3;
  dispatch_sync(v7, v8);
}

- (void)cancelArtistHeroImageUpdate
{
}

- (void)updateArtistHeroImagesForArtistsAddedSinceLastUpdateUsingClientIdentity:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CloudArtistHeroImageImporter *)self accessQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006F0B0;
  v7[3] = &unk_1001BECC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (CloudArtworkImporter)artworkImporter
{
  artworkImporter = self->_artworkImporter;
  if (!artworkImporter)
  {
    id v4 = [CloudArtworkImporter alloc];
    int64_t v5 = [(CloudArtistHeroImageImporter *)self configuration];
    id v6 = [(CloudArtworkImporter *)v4 initWithConfiguration:v5 sourceType:500];
    id v7 = self->_artworkImporter;
    self->_artworkImporter = v6;

    artworkImporter = self->_artworkImporter;
  }

  return artworkImporter;
}

- (CloudArtistHeroImageImporter)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CloudArtistHeroImageImporter;
  id v6 = [(CloudArtistHeroImageImporter *)&v24 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    id v8 = [v5 userIdentity];
    uint64_t v9 = +[ML3MusicLibrary musicLibraryForUserAccount:v8];
    musicLibrary = v7->_musicLibrary;
    v7->_musicLibrary = (ML3MusicLibrary *)v9;

    dispatch_queue_t v11 = dispatch_queue_create("com.apple.itunescloudd.cloudartistheroimageimporter.accessqueue", 0);
    accessQueue = v7->_accessQueue;
    v7->_accessQueue = (OS_dispatch_queue *)v11;

    char v13 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v13;

    [(NSOperationQueue *)v7->_operationQueue setName:@"com.apple.itunescloudd.cloudartistheroimageimporter.operationqueue"];
    [(NSOperationQueue *)v7->_operationQueue setQualityOfService:17];
    [(NSOperationQueue *)v7->_operationQueue setMaxConcurrentOperationCount:1];
    currentUpdateOperation = v7->_currentUpdateOperation;
    v7->_currentUpdateOperation = 0;

    followupUpdateOpertion = v7->_followupUpdateOpertion;
    v7->_followupUpdateOpertion = 0;

    [(NSOperationQueue *)v7->_operationQueue addObserver:v7 forKeyPath:@"operationCount" options:3 context:0];
    powerAssertionIdentifier = v7->_powerAssertionIdentifier;
    v7->_powerAssertionIdentifier = (NSString *)@"com.apple.itunescloudd.cloudartistheroimageimporter";

    id v18 = (MSVWatchdog *)objc_alloc_init((Class)MSVWatchdog);
    watchdog = v7->_watchdog;
    v7->_watchdog = v18;

    [(MSVWatchdog *)v7->_watchdog setTimeoutInterval:3600.0];
    objc_initWeak(&location, v7);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100076EB0;
    v21[3] = &unk_1001BDCA8;
    objc_copyWeak(&v22, &location);
    [(MSVWatchdog *)v7->_watchdog setTimeoutCallback:v21];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v7;
}

+ (id)allArtistImagesMapCacheFilePathURL
{
  v2 = sub_1000D4804();
  v7[0] = v2;
  v7[1] = @"allArtistImagesMap.plist";
  BOOL v3 = +[NSArray arrayWithObjects:v7 count:2];
  id v4 = +[NSString pathWithComponents:v3];
  id v5 = +[NSURL fileURLWithPath:v4];

  return v5;
}

@end