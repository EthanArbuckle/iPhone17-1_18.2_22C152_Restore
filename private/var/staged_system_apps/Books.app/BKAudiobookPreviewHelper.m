@interface BKAudiobookPreviewHelper
- (AEUserPublishingProductProfile)_lockupProfile;
- (BFMAsset)mAsset;
- (BKAudiobookPreviewHelper)initWithMAsset:(id)a3 lockupProfile:(id)a4;
- (BOOL)_valid;
- (BOOL)isStreaming;
- (NSDictionary)lockupProfileDictionary;
- (NSString)description;
- (NSURL)previewURL;
- (double)previewDuration;
- (id)_previewDictionary;
- (id)helperCoverImage;
- (id)helperMetadataForKey:(id)a3 needsCoordination:(BOOL)a4;
- (id)helperMinifiedController;
- (id)sharedAnnotationProvider;
- (void)helperCoverImageWithCompletion:(id)a3;
- (void)helperViewControllerWithOptions:(id)a3 completion:(id)a4;
@end

@implementation BKAudiobookPreviewHelper

- (BOOL)isStreaming
{
  return 1;
}

- (BKAudiobookPreviewHelper)initWithMAsset:(id)a3 lockupProfile:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BKAudiobookPreviewHelper;
  v9 = [(BKAudiobookPreviewHelper *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mAsset, a3);
    objc_storeStrong((id *)&v10->__lockupProfile, a4);
  }
  if (![(BKAudiobookPreviewHelper *)v10 _valid])
  {
    v11 = sub_1001E9A80();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1007EBDC8(v11);
    }

    v10 = 0;
  }

  return v10;
}

- (NSURL)previewURL
{
  v2 = [(BKAudiobookPreviewHelper *)self mAsset];
  v3 = [v2 previewURL];

  return (NSURL *)v3;
}

- (double)previewDuration
{
  objc_opt_class();
  v3 = [(BKAudiobookPreviewHelper *)self _previewDictionary];
  v4 = [v3 objectForKeyedSubscript:@"duration"];
  v5 = BUDynamicCast();

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (NSDictionary)lockupProfileDictionary
{
  objc_opt_class();
  v3 = [(BKAudiobookPreviewHelper *)self _lockupProfile];
  v4 = [v3 profileDictionary];
  v5 = BUDynamicCast();

  return (NSDictionary *)v5;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(BKAudiobookPreviewHelper *)self helperMetadataForKey:AEHelperStringMetadataTitleKey needsCoordination:0];
  double v6 = [(BKAudiobookPreviewHelper *)self previewURL];
  double v7 = [(BKAudiobookPreviewHelper *)self mAsset];
  id v8 = [v7 id];
  v9 = +[NSString stringWithFormat:@"<%@: %p> [Title: %@] [URL: %@] [AssetID: %@]", v4, self, v5, v6, v8];

  return (NSString *)v9;
}

- (id)helperCoverImage
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  objc_super v13 = sub_100006FD4;
  v14 = sub_1000071D4;
  id v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100128AB0;
  v7[3] = &unk_100A47910;
  v9 = &v10;
  v3 = dispatch_semaphore_create(0);
  id v8 = v3;
  [(BKAudiobookPreviewHelper *)self helperCoverImageWithCompletion:v7];
  dispatch_time_t v4 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v3, v4);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

- (void)helperCoverImageWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAudiobookPreviewHelper *)self mAsset];
  double v6 = [v5 artworkURL];

  if ([v6 length])
  {
    double v7 = [v6 jsa_normalizedArtworkURLOfSize:@"jpg" withFormat:1500.0, 1500.0];
    id v8 = +[NSURL URLWithString:v7];

    objc_initWeak(&location, self);
    if (v8)
    {
      v9 = +[NSURLSession sharedSession];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100128CE8;
      v12[3] = &unk_100A47960;
      objc_copyWeak(&v14, &location);
      id v13 = v4;
      uint64_t v10 = [v9 dataTaskWithURL:v8 completionHandler:v12];

      [v10 resume];
      objc_destroyWeak(&v14);
      goto LABEL_7;
    }
  }
  else
  {
    objc_initWeak(&location, self);
  }
  id v11 = objc_retainBlock(v4);
  id v8 = v11;
  if (v11) {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
LABEL_7:

  objc_destroyWeak(&location);
}

- (void)helperViewControllerWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BKAudiobookNowPlayingModuleFactory instantiate];
  if (v8)
  {
    objc_initWeak(&location, v8);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100129078;
    v11[3] = &unk_100A47988;
    objc_copyWeak(&v14, &location);
    id v12 = 0;
    id v13 = v7;
    [v8 setHelper:self completion:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    id v9 = objc_retainBlock(v7);
    uint64_t v10 = v9;
    if (v9) {
      (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
    }
  }
}

- (id)helperMetadataForKey:(id)a3 needsCoordination:(BOOL)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:AEHelperStringMetadataAssetIDKey]) {
    goto LABEL_5;
  }
  if ([v5 isEqualToString:AEHelperStringMetadataAuthorKey])
  {
    id v6 = [(BKAudiobookPreviewHelper *)self mAsset];
    uint64_t v7 = [v6 artistName];
LABEL_6:
    id v8 = (void *)v7;

    goto LABEL_7;
  }
  if ([v5 isEqualToString:AEHelperStringMetadataStoreIDKey])
  {
LABEL_5:
    id v6 = [(BKAudiobookPreviewHelper *)self mAsset];
    uint64_t v7 = [v6 id];
    goto LABEL_6;
  }
  if ([v5 isEqualToString:AEHelperStringMetadataTitleKey])
  {
    id v6 = [(BKAudiobookPreviewHelper *)self mAsset];
    uint64_t v7 = [v6 name];
    goto LABEL_6;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

- (id)helperMinifiedController
{
  v2 = [[BKAudiobookMinifiedController alloc] initWithHelper:self];

  return v2;
}

- (id)sharedAnnotationProvider
{
  return 0;
}

- (id)_previewDictionary
{
  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  v3 = [(BKAudiobookPreviewHelper *)self _lockupProfile];
  id v4 = [v3 offer];
  id v5 = [v4 objectForKeyedSubscript:@"assets"];
  id v6 = BUDynamicCast();
  uint64_t v7 = [v6 firstObject];
  id v8 = BUDynamicCast();
  id v9 = [v8 objectForKeyedSubscript:@"preview"];
  uint64_t v10 = BUDynamicCast();

  return v10;
}

- (BOOL)_valid
{
  v3 = [(BKAudiobookPreviewHelper *)self _lockupProfile];
  if (v3)
  {
    id v4 = [(BKAudiobookPreviewHelper *)self mAsset];
    id v5 = [v4 id];
    if ([v5 length])
    {
      id v6 = [(BKAudiobookPreviewHelper *)self previewURL];
      if (v6)
      {
        [(BKAudiobookPreviewHelper *)self previewDuration];
        BOOL v8 = v7 > 0.0;
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BFMAsset)mAsset
{
  return self->_mAsset;
}

- (AEUserPublishingProductProfile)_lockupProfile
{
  return self->__lockupProfile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__lockupProfile, 0);

  objc_storeStrong((id *)&self->_mAsset, 0);
}

@end