@interface NPTOSupergreenMemoriesContentProvider
- (NPTOSupergreenMemoriesContentProvider)initWithDevice:(id)a3;
- (NPTOSyncContentProviderDelegate)delegate;
- (id)_assetCollections;
- (id)_defaultAssetFetchOptions;
- (id)assetCollections;
- (id)assetsForAssetCollection:(id)a3;
- (id)keyAssetsForAssetCollection:(id)a3;
- (int64_t)targetForAssetCollection:(id)a3;
- (void)_invalidateContentIfNeeded;
- (void)setDelegate:(id)a3;
@end

@implementation NPTOSupergreenMemoriesContentProvider

- (NPTOSupergreenMemoriesContentProvider)initWithDevice:(id)a3
{
  id v4 = a3;
  if (([v4 relationship] & 2) != 0)
  {
    v17 = 0;
  }
  else
  {
    v5 = +[NRPairedDeviceRegistry sharedInstance];
    v6 = [v5 deviceForIDSDevice:v4];

    id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"76EFD58C-2211-40CE-A4BA-891FE464B629"];
    unsigned int v8 = [v6 supportsCapability:v7];

    if (v8)
    {
      v22.receiver = self;
      v22.super_class = (Class)NPTOSupergreenMemoriesContentProvider;
      id v9 = [(NPTOSupergreenMemoriesContentProvider *)&v22 init];
      if (v9)
      {
        dispatch_queue_t v10 = dispatch_queue_create("com.apple.nanophotos.supergreenMemories", 0);
        v11 = (void *)*((void *)v9 + 2);
        *((void *)v9 + 2) = v10;

        dispatch_source_t v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v9 + 2));
        v13 = (void *)*((void *)v9 + 3);
        *((void *)v9 + 3) = v12;

        objc_initWeak(&location, v9);
        v14 = *((void *)v9 + 3);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100055244;
        v19[3] = &unk_1000931A8;
        objc_copyWeak(&v20, &location);
        dispatch_source_set_event_handler(v14, v19);
        v15 = *((void *)v9 + 3);
        dispatch_time_t v16 = dispatch_time(0, 3600000000000);
        dispatch_source_set_timer(v15, v16, 0x34630B8A000uLL, 0xDF8475800uLL);
        dispatch_resume(*((dispatch_object_t *)v9 + 3));
        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
      }
      self = (NPTOSupergreenMemoriesContentProvider *)v9;
      v17 = self;
    }
    else
    {
      v17 = 0;
    }
  }
  return v17;
}

- (id)assetCollections
{
  assetCollections = self->_assetCollections;
  if (!assetCollections)
  {
    id v4 = [(NPTOSupergreenMemoriesContentProvider *)self _assetCollections];
    v5 = self->_assetCollections;
    self->_assetCollections = v4;

    assetCollections = self->_assetCollections;
  }

  return assetCollections;
}

- (id)assetsForAssetCollection:(id)a3
{
  id v4 = a3;
  v5 = [(NPTOSupergreenMemoriesContentProvider *)self _defaultAssetFetchOptions];
  v6 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:1];
  id v20 = v6;
  id v7 = +[NSArray arrayWithObjects:&v20 count:1];
  [v5 setSortDescriptors:v7];

  [v5 setFetchLimit:5];
  unsigned int v8 = +[PHAsset fetchReducedCuratedAssetsInMemory:v4 options:v5];
  id v9 = sub_10005CDAC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v8 count];
    v11 = [v4 localizedTitle];
    dispatch_source_t v12 = [v4 localIdentifier];
    int v14 = 134218498;
    id v15 = v10;
    __int16 v16 = 2112;
    v17 = v11;
    __int16 v18 = 2112;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Found %ld assets in memory %@ (%@)", (uint8_t *)&v14, 0x20u);
  }

  return v8;
}

- (id)keyAssetsForAssetCollection:(id)a3
{
  id v4 = a3;
  v5 = [(NPTOSupergreenMemoriesContentProvider *)self _defaultAssetFetchOptions];
  v6 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:1];
  id v10 = v6;
  id v7 = +[NSArray arrayWithObjects:&v10 count:1];
  [v5 setSortDescriptors:v7];

  [v5 setFetchLimit:1];
  unsigned int v8 = +[PHAsset fetchKeyCuratedAssetInAssetCollection:v4 referenceAsset:0 options:v5];

  return v8;
}

- (int64_t)targetForAssetCollection:(id)a3
{
  return 2;
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

- (id)_assetCollections
{
  id v2 = +[PHMemory fetchBestRecentMemoryWithOptions:0];
  v3 = sub_10005CDAC();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = [v2 localizedTitle];
      uint64_t v6 = [v2 localizedSubtitle];
      id v7 = [v2 localIdentifier];
      *(_DWORD *)buf = 138412802;
      v13 = v5;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Best recent memory: title: %@, subtitle: %@, local id: %@", buf, 0x20u);
    }
    v3 = [v2 localIdentifier];
    v11 = v3;
    unsigned int v8 = +[NSArray arrayWithObjects:&v11 count:1];
    id v9 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v8 options:0];
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "There were no best recent memories", buf, 2u);
    }
    id v9 = 0;
  }

  return v9;
}

- (void)_invalidateContentIfNeeded
{
  v3 = sub_10005CDAC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    v13 = "-[NPTOSupergreenMemoriesContentProvider _invalidateContentIfNeeded]";
    __int16 v14 = 2080;
    id v15 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/nptocompaniond/NPTOSupergreenMemoriesContentProvider.m";
    __int16 v16 = 1024;
    int v17 = 104;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", (uint8_t *)&v12, 0x1Cu);
  }

  BOOL v4 = [(NPTOSupergreenMemoriesContentProvider *)self _assetCollections];
  v5 = v4;
  if (self->_assetCollections)
  {
    uint64_t v6 = [v4 firstObject];
    id v7 = [v6 localIdentifier];
    unsigned int v8 = [(PHFetchResult *)self->_assetCollections firstObject];
    id v9 = [v8 localIdentifier];
    unsigned __int8 v10 = [v7 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_assetCollections, v5);
      v11 = [(NPTOSupergreenMemoriesContentProvider *)self delegate];
      [v11 contentProviderDidInvalidateContent:self];
    }
  }
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
  objc_storeStrong((id *)&self->_updateMemoryTimer, 0);
  objc_storeStrong((id *)&self->_workQ, 0);

  objc_storeStrong((id *)&self->_assetCollections, 0);
}

@end