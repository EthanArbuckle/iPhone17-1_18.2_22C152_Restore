@interface NPTOPhotosAppContentProvider
- (NPTOPhotosAppContentProvider)initWithDevice:(id)a3;
- (NPTOSyncContentProviderDelegate)delegate;
- (id)assetCollections;
- (id)assetsForAssetCollection:(id)a3;
- (id)keyAssetsForAssetCollection:(id)a3;
- (int64_t)targetForAssetCollection:(id)a3;
- (void)_invalidateContent;
- (void)dealloc;
- (void)photoLibraryDidChange:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NPTOPhotosAppContentProvider

- (NPTOPhotosAppContentProvider)initWithDevice:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)NPTOPhotosAppContentProvider;
  v5 = [(NPTOPhotosAppContentProvider *)&v34 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.nptocompaniond.NPTOPhotosAppContentProvider", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v8 = +[NRPairedDeviceRegistry sharedInstance];
    v9 = [v8 deviceForIDSDevice:v4];

    v10 = (NPTOPreferencesAccessor *)[objc_alloc((Class)NPTOPreferencesAccessor) initWithDevice:v9];
    preferencesAccessor = v5->_preferencesAccessor;
    v5->_preferencesAccessor = v10;

    objc_storeStrong((id *)&v5->_nrDevice, v9);
    id v12 = objc_alloc_init((Class)NSOperationQueue);
    [v12 setUnderlyingQueue:v5->_queue];
    objc_initWeak(&location, v5);
    v13 = v5->_preferencesAccessor;
    uint64_t v14 = NPTOPreferencesAppPhotosSyncingEnabledKey;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100052454;
    v31[3] = &unk_1000931A8;
    objc_copyWeak(&v32, &location);
    uint64_t v15 = [(NPTOPreferencesAccessor *)v13 changeObserverForKey:v14 queue:v12 block:v31];
    id photosSyncingEnabledPreferenceObserver = v5->_photosSyncingEnabledPreferenceObserver;
    v5->_id photosSyncingEnabledPreferenceObserver = (id)v15;

    v17 = v5->_preferencesAccessor;
    uint64_t v18 = NPTOPreferencesSyncedAlbumIdentifierKey;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000524D4;
    v29[3] = &unk_1000931A8;
    objc_copyWeak(&v30, &location);
    uint64_t v19 = [(NPTOPreferencesAccessor *)v17 changeObserverForKey:v18 queue:v12 block:v29];
    id syncedAlbumIdentifierPreferenceObserver = v5->_syncedAlbumIdentifierPreferenceObserver;
    v5->_id syncedAlbumIdentifierPreferenceObserver = (id)v19;

    v21 = v5->_preferencesAccessor;
    uint64_t v22 = NPTOPreferencesSyncedPhotosLimitKey;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100052554;
    v27[3] = &unk_1000931A8;
    objc_copyWeak(&v28, &location);
    uint64_t v23 = [(NPTOPreferencesAccessor *)v21 changeObserverForKey:v22 queue:v12 block:v27];
    id syncedPhotosLimitPreferenceObserver = v5->_syncedPhotosLimitPreferenceObserver;
    v5->_id syncedPhotosLimitPreferenceObserver = (id)v23;

    v25 = +[PHPhotoLibrary sharedPhotoLibrary];
    [v25 registerChangeObserver:v5];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[PHPhotoLibrary sharedPhotoLibrary];
  [v3 unregisterChangeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NPTOPhotosAppContentProvider;
  [(NPTOPhotosAppContentProvider *)&v4 dealloc];
}

- (id)assetCollections
{
  if ([(NPTOPreferencesAccessor *)self->_preferencesAccessor npto_appPhotosSyncingEnabled])
  {
    assetCollections = self->_assetCollections;
    if (!assetCollections)
    {
      objc_super v4 = [(NPTOPreferencesAccessor *)self->_preferencesAccessor npto_fetchSyncedAlbum];
      v5 = self->_assetCollections;
      self->_assetCollections = v4;

      assetCollections = self->_assetCollections;
    }
    dispatch_queue_t v6 = assetCollections;
  }
  else
  {
    dispatch_queue_t v6 = 0;
  }

  return v6;
}

- (id)assetsForAssetCollection:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)PHFetchOptions);
  nrDevice = self->_nrDevice;
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"EC26A7BC-7571-457B-9DEF-6CB5CF3AB850"];
  LODWORD(nrDevice) = [(NRDevice *)nrDevice supportsCapability:v7];

  if (nrDevice) {
    +[NSPredicate predicateWithFormat:@"(mediaType = %ld) && ((playbackStyle = %ld) || (playbackStyle = %ld) || (playbackStyle = %ld))", 1, 1, 3, 2];
  }
  else {
  v8 = +[NSPredicate predicateWithFormat:@"(mediaType = %ld) && ((playbackStyle = %ld) || (playbackStyle = %ld))", 1, 1, 3, v14];
  }
  [v5 setPredicate:v8];

  v9 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:0];
  v16 = v9;
  v10 = +[NSArray arrayWithObjects:&v16 count:1];
  [v5 setSortDescriptors:v10];

  [v5 setFetchLimit:-[NPTOPreferencesAccessor npto_syncedPhotosLimit](self->_preferencesAccessor, "npto_syncedPhotosLimit")];
  uint64_t v15 = PHAssetPropertySetPhotoIris;
  v11 = +[NSArray arrayWithObjects:&v15 count:1];
  [v5 addFetchPropertySets:v11];

  id v12 = +[PHAsset fetchAssetsInAssetCollection:v4 options:v5];

  return v12;
}

- (id)keyAssetsForAssetCollection:(id)a3
{
  return 0;
}

- (int64_t)targetForAssetCollection:(id)a3
{
  return 1;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100052938;
  v7[3] = &unk_1000931D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_invalidateContent
{
  v3 = sub_10005CDAC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    id v7 = "-[NPTOPhotosAppContentProvider _invalidateContent]";
    __int16 v8 = 2080;
    v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/nptocompaniond/NPTOPhotosAppContentProvider.m";
    __int16 v10 = 1024;
    int v11 = 120;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v6, 0x1Cu);
  }

  assetCollections = self->_assetCollections;
  self->_assetCollections = 0;

  id v5 = [(NPTOPhotosAppContentProvider *)self delegate];
  [v5 contentProviderDidInvalidateContent:self];
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
  objc_storeStrong(&self->_syncedPhotosLimitPreferenceObserver, 0);
  objc_storeStrong(&self->_syncedAlbumIdentifierPreferenceObserver, 0);
  objc_storeStrong(&self->_photosSyncingEnabledPreferenceObserver, 0);
  objc_storeStrong((id *)&self->_preferencesAccessor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assetCollections, 0);

  objc_storeStrong((id *)&self->_nrDevice, 0);
}

@end