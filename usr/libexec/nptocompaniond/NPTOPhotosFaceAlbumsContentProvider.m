@interface NPTOPhotosFaceAlbumsContentProvider
- (BOOL)assetsRequireExternalPowerSourceConnectedForAssetCollection:(id)a3;
- (BOOL)isPlaceholderAssetCollection:(id)a3;
- (NPTOPhotosFaceAlbumsContentProvider)initWithDevice:(id)a3;
- (NPTOSyncContentProviderDelegate)delegate;
- (id)_defaultAssetFetchOptions;
- (id)assetCollections;
- (id)assetsForAssetCollection:(id)a3;
- (id)keyAssetsForAssetCollection:(id)a3;
- (int64_t)targetForAssetCollection:(id)a3;
- (void)_invalidateContent;
- (void)setDelegate:(id)a3;
@end

@implementation NPTOPhotosFaceAlbumsContentProvider

- (NPTOPhotosFaceAlbumsContentProvider)initWithDevice:(id)a3
{
  id v4 = a3;
  if (([v4 relationship] & 2) != 0)
  {
    v20 = 0;
  }
  else
  {
    v5 = +[NRPairedDeviceRegistry sharedInstance];
    v6 = [v5 deviceForIDSDevice:v4];

    id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"41714B27-B839-4AB5-8A36-6191015AA8FE"];
    unsigned int v8 = [v6 supportsCapability:v7];

    if (v8)
    {
      v27.receiver = self;
      v27.super_class = (Class)NPTOPhotosFaceAlbumsContentProvider;
      v9 = [(NPTOPhotosFaceAlbumsContentProvider *)&v27 init];
      if (v9)
      {
        v10 = (NPTOPreferencesAccessor *)[objc_alloc((Class)NPTOPreferencesAccessor) initWithDevice:v6];
        preferencesAccessor = v9->_preferencesAccessor;
        v9->_preferencesAccessor = v10;

        objc_initWeak(&location, v9);
        v12 = v9->_preferencesAccessor;
        uint64_t v13 = NPTOPreferencesWatchFaceAlbumFetchCountsKey;
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1000549C8;
        v24[3] = &unk_1000931A8;
        objc_copyWeak(&v25, &location);
        uint64_t v14 = [(NPTOPreferencesAccessor *)v12 changeObserverForKey:v13 queue:0 block:v24];
        id fetchCountsPreferenceObserver = v9->_fetchCountsPreferenceObserver;
        v9->_id fetchCountsPreferenceObserver = (id)v14;

        v16 = v9->_preferencesAccessor;
        uint64_t v17 = NPTOPreferencesWatchFaceAlwaysUpdatingAlbumsKey;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_100054A48;
        v22[3] = &unk_1000931A8;
        objc_copyWeak(&v23, &location);
        uint64_t v18 = [(NPTOPreferencesAccessor *)v16 changeObserverForKey:v17 queue:0 block:v22];
        id alwaysUpdatingAlbumsPreferenceObserver = v9->_alwaysUpdatingAlbumsPreferenceObserver;
        v9->_id alwaysUpdatingAlbumsPreferenceObserver = (id)v18;

        objc_destroyWeak(&v23);
        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);
      }
      self = v9;
      v20 = self;
    }
    else
    {
      v20 = 0;
    }
  }
  return v20;
}

- (id)assetCollections
{
  return +[PHAssetCollection fetchAssetCollectionsWithType:1 subtype:0x7FFFFFFFFFFFFFFFLL options:0];
}

- (id)assetsForAssetCollection:(id)a3
{
  id v4 = a3;
  id v5 = [(NPTOPreferencesAccessor *)self->_preferencesAccessor npto_fetchCountForAssetCollection:v4];
  if (v5)
  {
    v6 = [(NPTOPhotosFaceAlbumsContentProvider *)self _defaultAssetFetchOptions];
    id v7 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
    v10 = v7;
    unsigned int v8 = +[NSArray arrayWithObjects:&v10 count:1];
    [v6 setSortDescriptors:v8];

    [v6 setFetchLimit:v5];
    id v5 = +[PHAsset fetchAssetsInAssetCollection:v4 options:v6];
  }

  return v5;
}

- (id)keyAssetsForAssetCollection:(id)a3
{
  id v4 = a3;
  if ([(NPTOPreferencesAccessor *)self->_preferencesAccessor npto_fetchCountForAssetCollection:v4])
  {
    id v5 = [(NPTOPhotosFaceAlbumsContentProvider *)self _defaultAssetFetchOptions];
    v6 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
    v10 = v6;
    id v7 = +[NSArray arrayWithObjects:&v10 count:1];
    [v5 setSortDescriptors:v7];

    [v5 setFetchLimit:1];
    unsigned int v8 = +[PHAsset fetchKeyAssetsInAssetCollection:v4 options:v5];
  }
  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (BOOL)assetsRequireExternalPowerSourceConnectedForAssetCollection:(id)a3
{
  return [(NPTOPreferencesAccessor *)self->_preferencesAccessor npto_isAlwaysUpdatingEnabledForAssetCollection:a3] ^ 1;
}

- (BOOL)isPlaceholderAssetCollection:(id)a3
{
  return [(NPTOPreferencesAccessor *)self->_preferencesAccessor npto_fetchCountForAssetCollection:a3] == 0;
}

- (int64_t)targetForAssetCollection:(id)a3
{
  return 4;
}

- (id)_defaultAssetFetchOptions
{
  id v2 = objc_alloc_init((Class)PHFetchOptions);
  v3 = +[NSPredicate predicateWithFormat:@"(mediaType = %ld) && ((playbackStyle = %ld) || (playbackStyle = %ld))", 1, 1, 3];
  [v2 setPredicate:v3];

  uint64_t v6 = PHAssetPropertySetPhotoIris;
  id v4 = +[NSArray arrayWithObjects:&v6 count:1];
  [v2 addFetchPropertySets:v4];

  return v2;
}

- (void)_invalidateContent
{
  v3 = sub_10005CDAC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315650;
    uint64_t v6 = "-[NPTOPhotosFaceAlbumsContentProvider _invalidateContent]";
    __int16 v7 = 2080;
    unsigned int v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/nptocompaniond/NPTOPhotosFaceAlbumsContentProvider.m";
    __int16 v9 = 1024;
    int v10 = 102;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v5, 0x1Cu);
  }

  id v4 = [(NPTOPhotosFaceAlbumsContentProvider *)self delegate];
  [v4 contentProviderDidInvalidateContent:self];
}

- (NPTOSyncContentProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NPTOSyncContentProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_alwaysUpdatingAlbumsPreferenceObserver, 0);
  objc_storeStrong(&self->_fetchCountsPreferenceObserver, 0);

  objc_storeStrong((id *)&self->_preferencesAccessor, 0);
}

@end