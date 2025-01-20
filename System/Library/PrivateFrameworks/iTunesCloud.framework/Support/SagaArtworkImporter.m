@interface SagaArtworkImporter
- (SagaArtworkImporter)initWithConfiguration:(id)a3;
- (void)_importOriginalContainerArtworkWithClientIdentity:(id)a3;
- (void)_importOriginalItemArtworkWithClientIdentity:(id)a3;
- (void)importAllItemArtworkWithClientIdentity:(id)a3;
- (void)importContainerArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importItemArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importScreenshotForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
@end

@implementation SagaArtworkImporter

- (void)_importOriginalContainerArtworkWithClientIdentity:(id)a3
{
  id v4 = a3;
  v5 = +[ICCloudAvailabilityController sharedController];
  char v6 = [v5 isCellularDataRestrictedForMusic] ^ 1;

  v7 = [(CloudArtworkImporter *)self musicLibrary];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100121660;
  v9[3] = &unk_1001BEBD8;
  char v12 = v6;
  id v10 = v4;
  v11 = self;
  id v8 = v4;
  [v7 databaseConnectionAllowingWrites:0 withBlock:v9];
}

- (void)_importOriginalItemArtworkWithClientIdentity:(id)a3
{
  id v4 = a3;
  v5 = +[ICCloudAvailabilityController sharedController];
  char v6 = [v5 isCellularDataRestrictedForMusic] ^ 1;

  v7 = [(CloudArtworkImporter *)self musicLibrary];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100121938;
  v9[3] = &unk_1001BEBD8;
  char v12 = v6;
  id v10 = v4;
  v11 = self;
  id v8 = v4;
  [v7 databaseConnectionAllowingWrites:0 withBlock:v9];
}

- (void)importContainerArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  id v10 = [(CloudArtworkImporter *)self musicLibrary];
  [v10 setClientIdentity:v8];

  v11 = [(CloudArtworkImporter *)self musicLibrary];
  char v12 = +[ML3ComparisonPredicate predicateWithProperty:ML3ContainerPropertyStoreCloudID equalToInt64:a3];
  v13 = +[ML3Container anyInLibrary:v11 predicate:v12];

  if (v13)
  {
    id v14 = [objc_alloc((Class)ML3ArtworkTokenSet) initWithEntity:v13 artworkType:5];
    v15 = [v14 artworkTokenForSource:200];
  }
  else
  {
    v15 = 0;
  }
  if ([v15 length])
  {
    v16 = +[ICCloudAvailabilityController sharedController];
    uint64_t v17 = [v16 isCellularDataRestrictedForMusic] ^ 1;

    [(CloudArtworkImporter *)self importArtworkForCloudID:a3 artworkType:5 token:v15 mediaType:8 allowsCellularData:v17 clientIdentity:v8 completionHandler:v9];
  }
  else if (v9)
  {
    v18 = +[NSString stringWithFormat:@"No cloud_artwork_token for playlist saga id = %llu", a3];
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    v22 = v18;
    v19 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v20 = +[NSError ic_cloudClientErrorWithCode:2008 userInfo:v19];

    v9[2](v9, v20);
  }
}

- (void)importScreenshotForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  id v10 = [(CloudArtworkImporter *)self musicLibrary];
  [v10 setClientIdentity:v8];

  v11 = [(CloudArtworkImporter *)self musicLibrary];
  char v12 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyStoreSagaID equalToInt64:a3];
  v13 = +[ML3Track anyInLibrary:v11 predicate:v12 options:7];

  if (v13)
  {
    id v14 = [objc_alloc((Class)ML3ArtworkTokenSet) initWithEntity:v13 artworkType:2];
    v15 = [v14 artworkTokenForSource:200];
  }
  else
  {
    v15 = 0;
  }
  if ([v15 length])
  {
    v16 = [v13 valueForProperty:ML3TrackPropertyMediaType];
    id v17 = [v16 unsignedIntValue];

    v18 = +[ICCloudAvailabilityController sharedController];
    uint64_t v19 = [v18 isCellularDataRestrictedForMusic] ^ 1;

    [(CloudArtworkImporter *)self importArtworkForCloudID:a3 artworkType:2 token:v15 mediaType:v17 allowsCellularData:v19 clientIdentity:v8 completionHandler:v9];
  }
  else if (v9)
  {
    v20 = +[NSString stringWithFormat:@"No cloud_screenshot_token for item saga id = %llu", a3];
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    v24 = v20;
    NSErrorUserInfoKey v21 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v22 = +[NSError ic_cloudClientErrorWithCode:2008 userInfo:v21];

    v9[2](v9, v22);
  }
}

- (void)importItemArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *))a5;
  id v10 = [(CloudArtworkImporter *)self musicLibrary];
  [v10 setClientIdentity:v8];

  v11 = [(CloudArtworkImporter *)self musicLibrary];
  char v12 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyStoreSagaID equalToInt64:a3];
  v13 = +[ML3Track anyInLibrary:v11 predicate:v12 options:7];

  if (v13)
  {
    id v14 = [objc_alloc((Class)ML3ArtworkTokenSet) initWithEntity:v13 artworkType:1];
    v15 = [v14 artworkTokenForSource:200];
  }
  else
  {
    v15 = 0;
  }
  if ([v15 length])
  {
    v16 = [v13 valueForProperty:ML3TrackPropertyMediaType];
    id v17 = [v16 unsignedIntValue];

    v18 = +[ICCloudAvailabilityController sharedController];
    uint64_t v19 = [v18 isCellularDataRestrictedForMusic] ^ 1;

    [(CloudArtworkImporter *)self importArtworkForCloudID:a3 artworkType:1 token:v15 mediaType:v17 allowsCellularData:v19 clientIdentity:v8 completionHandler:v9];
  }
  else if (v9)
  {
    v20 = +[NSString stringWithFormat:@"No cloud_artwork_token for item saga id = %llu", a3];
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    v24 = v20;
    NSErrorUserInfoKey v21 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v22 = +[NSError ic_cloudClientErrorWithCode:2008 userInfo:v21];

    v9[2](v9, v22);
  }
}

- (void)importAllItemArtworkWithClientIdentity:(id)a3
{
  id v4 = a3;
  [(SagaArtworkImporter *)self _importOriginalItemArtworkWithClientIdentity:v4];
  [(SagaArtworkImporter *)self _importOriginalContainerArtworkWithClientIdentity:v4];
}

- (SagaArtworkImporter)initWithConfiguration:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SagaArtworkImporter;
  return [(CloudArtworkImporter *)&v4 initWithConfiguration:a3 sourceType:200];
}

@end