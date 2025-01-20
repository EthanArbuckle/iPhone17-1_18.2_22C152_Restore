@interface ArtistImageRequestHandler
+ (BOOL)supportsAccountlessHandling;
+ (id)accountlessHandler;
+ (id)handlers;
- (ArtistImageRequestHandler)initWithConfiguration:(id)a3;
- (CloudArtistHeroImageImporter)importer;
- (void)cancelAllOperations;
- (void)cancelAllOperationsAndWaitForOperationsToFinish:(BOOL)a3;
- (void)deprioritizeAlbumArtistHeroImageForPersistentID:(int64_t)a3;
- (void)deprioritizeArtistHeroImageForPersistentID:(int64_t)a3;
- (void)importAlbumArtistHeroImageForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importArtistHeroImageForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)updateArtistHeroImagesForArtistsAddedSinceLastUpdateUsingClientIdentity:(id)a3;
- (void)updateArtistHeroImagesWithClientIdentity:(id)a3;
@end

@implementation ArtistImageRequestHandler

- (void)updateArtistHeroImagesWithClientIdentity:(id)a3
{
}

+ (id)handlers
{
  if (qword_1001F3AD8 != -1) {
    dispatch_once(&qword_1001F3AD8, &stru_1001BF088);
  }
  v2 = (void *)qword_1001F3AD0;

  return v2;
}

- (void).cxx_destruct
{
}

- (CloudArtistHeroImageImporter)importer
{
  return self->_importer;
}

- (void)deprioritizeAlbumArtistHeroImageForPersistentID:(int64_t)a3
{
}

- (void)deprioritizeArtistHeroImageForPersistentID:(int64_t)a3
{
}

- (void)importAlbumArtistHeroImageForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
}

- (void)importArtistHeroImageForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
}

- (void)cancelAllOperationsAndWaitForOperationsToFinish:(BOOL)a3
{
}

- (void)cancelAllOperations
{
}

- (void)updateArtistHeroImagesForArtistsAddedSinceLastUpdateUsingClientIdentity:(id)a3
{
  id v4 = a3;
  v5 = +[ICCloudAvailabilityController sharedController];
  unsigned int v6 = [v5 shouldProhibitMusicActionForCurrentNetworkConditions];

  if (v6)
  {
    v7 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Skipping artist hero image update due to insufficient network conditions", v8, 2u);
    }
  }
  else
  {
    [(CloudArtistHeroImageImporter *)self->_importer updateArtistHeroImagesForArtistsAddedSinceLastUpdateUsingClientIdentity:v4];
  }
}

- (ArtistImageRequestHandler)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = +[ICDeviceInfo currentDeviceInfo];
  unsigned int v6 = [v5 isAudioAccessory];

  if (v6)
  {
    v7 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Device does not support ArtistImageRequestHandler", buf, 2u);
    }

    v8 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ArtistImageRequestHandler;
    v9 = [(BaseRequestHandler *)&v13 initWithConfiguration:v4];
    if (v9)
    {
      v10 = [[CloudArtistHeroImageImporter alloc] initWithConfiguration:v4];
      importer = v9->_importer;
      v9->_importer = v10;
    }
    self = v9;
    v8 = self;
  }

  return v8;
}

+ (id)accountlessHandler
{
  if (qword_1001F3AE8 != -1) {
    dispatch_once(&qword_1001F3AE8, &stru_1001BF0A8);
  }
  v2 = (void *)qword_1001F3AE0;

  return v2;
}

+ (BOOL)supportsAccountlessHandling
{
  v2 = +[ICDeviceInfo currentDeviceInfo];
  unsigned int v3 = [v2 isAudioAccessory];

  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unsigned int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Device does not support ArtistImageRequestHandler", v6, 2u);
    }
  }
  return v3 ^ 1;
}

@end