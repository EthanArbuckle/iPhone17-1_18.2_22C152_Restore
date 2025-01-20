@interface BKMLAudiobookHelper
+ (BOOL)_audiobookIsStreamingFromURL:(id)a3;
+ (id)_audiobookAlbumTitleFromURL:(id)a3;
- (BKMLAudiobookHelper)initWithAssetUrl:(id)a3 options:(id)a4;
- (BOOL)isStreaming;
- (NSDictionary)options;
- (NSString)albumTitle;
- (NSString)description;
- (NSURL)assetUrl;
- (id)assetID;
- (id)assetType;
- (id)displayTitle;
- (id)helperCoverImage;
- (id)helperCoverImageOfSize:(CGSize)a3;
- (id)helperMetadataForKey:(id)a3 needsCoordination:(BOOL)a4;
- (id)helperMinifiedController;
- (id)sharedAnnotationProvider;
- (id)url;
- (void)helperViewControllerWithOptions:(id)a3 completion:(id)a4;
- (void)setAssetUrl:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation BKMLAudiobookHelper

- (BKMLAudiobookHelper)initWithAssetUrl:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BKMLAudiobookHelper;
  v9 = [(BKMLAudiobookHelper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetUrl, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

+ (BOOL)_audiobookIsStreamingFromURL:(id)a3
{
  v3 = [a3 bu_dictionaryForQueryItems];
  v4 = [v3 objectForKeyedSubscript:@"isCloudItem"];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

+ (id)_audiobookAlbumTitleFromURL:(id)a3
{
  v3 = [a3 bu_dictionaryForQueryItems];
  v4 = [v3 objectForKeyedSubscript:@"albumTitle"];

  return v4;
}

- (BOOL)isStreaming
{
  v3 = objc_opt_class();
  assetUrl = self->_assetUrl;

  return _[v3 _audiobookIsStreamingFromURL:assetUrl];
}

- (NSString)albumTitle
{
  v3 = objc_opt_class();
  assetUrl = self->_assetUrl;

  return (NSString *)_[v3 _audiobookAlbumTitleFromURL:assetUrl];
}

- (id)assetType
{
  return +[AEAudiobookPlugin associatedAssetType];
}

- (id)assetID
{
  v2 = [(BKMLAudiobookHelper *)self options];
  v3 = [v2 objectForKeyedSubscript:@"assetID"];

  return v3;
}

- (id)url
{
  return self->_assetUrl;
}

- (id)displayTitle
{
  objc_opt_class();
  v3 = [(BKMLAudiobookHelper *)self helperMetadataForKey:AEHelperStringMetadataTitleKey needsCoordination:1];
  v4 = BUDynamicCast();

  return v4;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  unsigned __int8 v5 = [(BKMLAudiobookHelper *)self helperMetadataForKey:AEHelperStringMetadataTitleKey needsCoordination:1];
  assetUrl = self->_assetUrl;
  id v7 = [(BKMLAudiobookHelper *)self assetID];
  id v8 = +[NSString stringWithFormat:@"<%@: %p> [Title: %@] [URL: %@] [AssetID: %@]", v4, self, v5, assetUrl, v7];

  return (NSString *)v8;
}

- (id)helperCoverImageOfSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unsigned __int8 v5 = [(BKMLAudiobookHelper *)self options];
  v6 = [v5 objectForKey:AEHelperImageMetadataCoverBlockKey];

  if (v6)
  {
    id v7 = v6[2](v6, width, height);
  }
  else
  {
    id v8 = sub_1001E9A80();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_1007ED86C(v8);
    }

    id v7 = 0;
  }

  return v7;
}

- (id)helperCoverImage
{
  return -[BKMLAudiobookHelper helperCoverImageOfSize:](self, "helperCoverImageOfSize:", CGSizeZero.width, CGSizeZero.height);
}

- (void)helperViewControllerWithOptions:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v6 = +[BKAudiobookNowPlayingModuleFactory instantiate];
  id v7 = v6;
  if (v6)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100170EE8;
    v14[3] = &unk_100A455E8;
    id v8 = v6;
    id v15 = v8;
    id v16 = 0;
    id v17 = v5;
    v9 = objc_retainBlock(v14);
    v10 = +[BKAudiobookNowPlayingModuleFactory currentMiniPlayer];
    v11 = v10;
    if (!v10) {
      v10 = v8;
    }
    [v10 setHelper:self completion:v9];
  }
  else
  {
    id v12 = objc_retainBlock(v5);
    v13 = v12;
    if (v12) {
      (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
    }
  }
}

- (id)helperMinifiedController
{
  v2 = [[BKAudiobookMinifiedController alloc] initWithHelper:self];

  return v2;
}

- (id)helperMetadataForKey:(id)a3 needsCoordination:(BOOL)a4
{
  if (objc_msgSend(a3, "isEqualToString:", AEHelperStringMetadataAssetIDKey, a4))
  {
    id v5 = [(BKMLAudiobookHelper *)self assetID];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)sharedAnnotationProvider
{
  v3 = +[AEPluginRegistry sharedInstance];
  v4 = [v3 pluginForURL:self->_assetUrl];

  id v5 = [v4 sharedAnnotationProvider];

  return v5;
}

- (NSURL)assetUrl
{
  return self->_assetUrl;
}

- (void)setAssetUrl:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_assetUrl, 0);
}

@end