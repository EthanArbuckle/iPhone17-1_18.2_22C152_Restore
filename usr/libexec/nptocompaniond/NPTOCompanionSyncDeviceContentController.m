@interface NPTOCompanionSyncDeviceContentController
- (IDSDevice)device;
- (NPTOCompanionSyncDeviceContentController)initWithDevice:(id)a3;
- (NPTOCompanionSyncDeviceContentControllerDelegate)delegate;
- (id)_assetForLocalIdentifier:(id)a3;
- (id)_collectionGroups;
- (id)_collectionTargetListWithLibrary:(id)a3;
- (id)_composeSyncRequest;
- (id)_contentProviderClasses;
- (id)_contentProviders;
- (id)_indexesOfAssetsRequiringExternalPowerSourceConnectedWithLibrary:(id)a3;
- (id)_libraryRepresentation;
- (id)assetForLocalIdentifier:(id)a3;
- (id)composeSyncRequest;
- (int)_assetCollectionSubtype:(int64_t)a3;
- (int)_assetCollectionType:(int64_t)a3;
- (void)_enumerateCollectionsUsingBlock:(id)a3;
- (void)_handleContentProviderDidInvalidateContent:(id)a3;
- (void)_handlePhotoLibraryDidChange:(id)a3;
- (void)composeSyncRequestWithCompletion:(id)a3;
- (void)contentProviderDidInvalidateContent:(id)a3;
- (void)dealloc;
- (void)photoLibraryDidChange:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NPTOCompanionSyncDeviceContentController

- (NPTOCompanionSyncDeviceContentController)initWithDevice:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NPTOCompanionSyncDeviceContentController;
  v6 = [(NPTOCompanionSyncDeviceContentController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.nptocompaniond.NPTOCompanionSyncDeviceContentController", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    v11 = +[PHPhotoLibrary sharedPhotoLibrary];
    [v11 registerChangeObserver:v7];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[PHPhotoLibrary sharedPhotoLibrary];
  [v3 unregisterChangeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NPTOCompanionSyncDeviceContentController;
  [(NPTOCompanionSyncDeviceContentController *)&v4 dealloc];
}

- (id)composeSyncRequest
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = sub_10005A818;
  v10 = sub_10005A828;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005A830;
  v5[3] = &unk_100093470;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)composeSyncRequestWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005A914;
  v7[3] = &unk_100093498;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)assetForLocalIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_10005A818;
  v16 = sub_10005A828;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005AA9C;
  block[3] = &unk_1000934C0;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_contentProviderClasses
{
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:v4 count:8];

  return v2;
}

- (id)_contentProviders
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  contentProviders = self->_contentProviders;
  if (!contentProviders)
  {
    id v4 = [(NPTOCompanionSyncDeviceContentController *)self _contentProviderClasses];
    id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [objc_alloc(*(Class *)(*((void *)&v18 + 1) + 8 * i)) initWithDevice:self->_device];
          uint64_t v12 = v11;
          if (v11)
          {
            [v11 setDelegate:self];
            [v5 addObject:v12];
            objc_super v13 = sub_10005CDAC();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v14 = [(IDSDevice *)self->_device name];
              *(_DWORD *)buf = 138412546;
              v23 = v12;
              __int16 v24 = 2112;
              v25 = v14;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Content] Registered new content provider: %@ for device: %@", buf, 0x16u);
            }
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v8);
    }

    v15 = (NSArray *)[v5 copy];
    v16 = self->_contentProviders;
    self->_contentProviders = v15;

    contentProviders = self->_contentProviders;
  }

  return contentProviders;
}

- (id)_collectionGroups
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v36 = self;
  id obj = [(NPTOCompanionSyncDeviceContentController *)self _contentProviders];
  id v34 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v42;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v42 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v35 = v3;
        id v4 = *(void **)(*((void *)&v41 + 1) + 8 * v3);
        id v5 = [(NSMapTable *)v36->_collectionGroups objectForKey:v4];
        if (!v5)
        {
          id v5 = objc_alloc_init(NPTOSyncCollectionGroup);
          [(NPTOSyncCollectionGroup *)v5 setContentProvider:v4];
          id v6 = [v4 assetCollections];
          [(NPTOSyncCollectionGroup *)v5 setAssetCollections:v6];

          collectionGroups = v36->_collectionGroups;
          if (!collectionGroups)
          {
            uint64_t v8 = +[NSMapTable weakToStrongObjectsMapTable];
            uint64_t v9 = v36->_collectionGroups;
            v36->_collectionGroups = (NSMapTable *)v8;

            collectionGroups = v36->_collectionGroups;
          }
          [(NSMapTable *)collectionGroups setObject:v5 forKey:v4];
          id v10 = sub_10005CDAC();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            id v11 = [(IDSDevice *)v36->_device name];
            *(_DWORD *)buf = 138412546;
            v47 = v5;
            __int16 v48 = 2112;
            v49 = v11;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Content] Registered new collection group: %@ for device: %@", buf, 0x16u);
          }
        }
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        uint64_t v12 = [(NPTOSyncCollectionGroup *)v5 assetCollections];
        id v13 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v38;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v38 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * i);
              long long v19 = [(NPTOSyncCollectionGroup *)v5 collections];
              long long v20 = [v19 objectForKey:v17];

              if (!v20)
              {
                long long v20 = objc_alloc_init(NPTOSyncCollection);
                [(NPTOSyncCollection *)v20 setContentProvider:v4];
                [(NPTOSyncCollection *)v20 setAssetCollection:v17];
                long long v21 = [v4 assetsForAssetCollection:v17];
                [(NPTOSyncCollection *)v20 setAssets:v21];

                v22 = [v4 keyAssetsForAssetCollection:v17];
                [(NPTOSyncCollection *)v20 setKeyAssets:v22];

                if (objc_opt_respondsToSelector()) {
                  id v23 = [v4 assetsRequireExternalPowerSourceConnectedForAssetCollection:v17];
                }
                else {
                  id v23 = 0;
                }
                [(NPTOSyncCollection *)v20 setAssetsRequireExternalPowerSourceConnected:v23];
                if (objc_opt_respondsToSelector()) {
                  id v24 = [v4 isPlaceholderAssetCollection:v17];
                }
                else {
                  id v24 = 0;
                }
                [(NPTOSyncCollection *)v20 setPlaceholder:v24];
                v25 = [(NPTOSyncCollectionGroup *)v5 collections];

                if (!v25)
                {
                  v26 = +[NSMapTable weakToStrongObjectsMapTable];
                  [(NPTOSyncCollectionGroup *)v5 setCollections:v26];
                }
                v27 = [(NPTOSyncCollectionGroup *)v5 collections];
                [v27 setObject:v20 forKey:v17];

                v28 = sub_10005CDAC();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  v29 = [(IDSDevice *)v36->_device name];
                  *(_DWORD *)buf = 138412546;
                  v47 = v20;
                  __int16 v48 = 2112;
                  v49 = v29;
                  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[Content] Registered new collection: %@ for device: %@", buf, 0x16u);
                }
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v14);
        }

        uint64_t v3 = v35 + 1;
      }
      while ((id)(v35 + 1) != v34);
      id v34 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v34);
  }

  v30 = v36->_collectionGroups;

  return v30;
}

- (void)_enumerateCollectionsUsingBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = [(NPTOCompanionSyncDeviceContentController *)self _contentProviders];
  id v22 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v22)
  {
    uint64_t v6 = *(void *)v31;
    uint64_t v20 = *(void *)v31;
    long long v21 = self;
    id v24 = v5;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v5);
        }
        uint64_t v23 = v7;
        uint64_t v8 = *(void *)(*((void *)&v30 + 1) + 8 * v7);
        uint64_t v9 = [(NPTOCompanionSyncDeviceContentController *)self _collectionGroups];
        id v10 = [v9 objectForKey:v8];

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v11 = [v10 assetCollections];
        id v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v27;
          while (2)
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v27 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * i);
              long long v18 = [v10 collections];
              long long v19 = [v18 objectForKey:v16];

              if (v4)
              {
                char v25 = 0;
                v4[2](v4, v19, &v25);
                if (v25)
                {

                  id v5 = v24;
                  goto LABEL_19;
                }
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        uint64_t v7 = v23 + 1;
        uint64_t v6 = v20;
        self = v21;
        id v5 = v24;
      }
      while ((id)(v23 + 1) != v22);
      id v22 = [v24 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v22);
  }
LABEL_19:
}

- (id)_composeSyncRequest
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = objc_alloc_init(NPTOSyncRequest);
  id v4 = [(NPTOCompanionSyncDeviceContentController *)self _libraryRepresentation];
  [(NPTOSyncRequest *)v3 setLibrary:v4];

  id v5 = [(NPTOSyncRequest *)v3 library];
  uint64_t v6 = [(NPTOCompanionSyncDeviceContentController *)self _collectionTargetListWithLibrary:v5];
  [(NPTOSyncRequest *)v3 setCollectionTargetList:v6];

  uint64_t v7 = [(NPTOSyncRequest *)v3 library];
  uint64_t v8 = [(NPTOCompanionSyncDeviceContentController *)self _indexesOfAssetsRequiringExternalPowerSourceConnectedWithLibrary:v7];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005B654;
  v11[3] = &unk_1000934E8;
  uint64_t v9 = v3;
  id v12 = v9;
  [v8 enumerateIndexesUsingBlock:v11];

  return v9;
}

- (id)_assetForLocalIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_10005A818;
  uint64_t v15 = sub_10005A828;
  id v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005B790;
  v8[3] = &unk_100093510;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(NPTOCompanionSyncDeviceContentController *)self _enumerateCollectionsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

- (id)_libraryRepresentation
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005B9F4;
  v15[3] = &unk_100093538;
  uint64_t v3 = objc_alloc_init(NPTOLibrary);
  id v16 = v3;
  [(NPTOCompanionSyncDeviceContentController *)self _enumerateCollectionsUsingBlock:v15];
  id v4 = +[NRPairedDeviceRegistry sharedInstance];
  id v5 = [v4 deviceForIDSDevice:self->_device];

  id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"41714B27-B839-4AB5-8A36-6191015AA8FE"];
  char v7 = [v5 supportsCapability:v6] ^ 1;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005BA4C;
  v12[3] = &unk_100093560;
  char v14 = v7;
  uint64_t v8 = v3;
  uint64_t v13 = v8;
  [(NPTOCompanionSyncDeviceContentController *)self _enumerateCollectionsUsingBlock:v12];
  id v9 = v13;
  id v10 = v8;

  return v10;
}

- (id)_collectionTargetListWithLibrary:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005BBE8;
  v10[3] = &unk_100093588;
  id v11 = v4;
  id v12 = self;
  id v5 = objc_alloc_init(NPTOCollectionTargetList);
  uint64_t v13 = v5;
  id v6 = v4;
  [(NPTOCompanionSyncDeviceContentController *)self _enumerateCollectionsUsingBlock:v10];
  char v7 = v13;
  uint64_t v8 = v5;

  return v8;
}

- (int)_assetCollectionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3) {
    return a3;
  }
  else {
    return 0;
  }
}

- (int)_assetCollectionSubtype:(int64_t)a3
{
  if (a3 > 100)
  {
    if (a3 != 101)
    {
      if (a3 == 203) {
        return 203;
      }
      return 0;
    }
    return 101;
  }
  else
  {
    if (a3 != 2)
    {
      if (a3 == 100) {
        return 100;
      }
      return 0;
    }
    return 2;
  }
}

- (id)_indexesOfAssetsRequiringExternalPowerSourceConnectedWithLibrary:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[NSMutableIndexSet indexSet];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005C184;
  v17[3] = &unk_1000935D8;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v18 = v5;
  id v6 = v4;
  id v19 = v6;
  [(NPTOCompanionSyncDeviceContentController *)self _enumerateCollectionsUsingBlock:v17];
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_10005C294;
  char v14 = &unk_1000935D8;
  id v15 = v5;
  id v16 = v6;
  id v7 = v6;
  id v8 = v5;
  [(NPTOCompanionSyncDeviceContentController *)self _enumerateCollectionsUsingBlock:&v11];
  id v9 = [v8 copy:v11, v12, v13, v14];

  return v9;
}

- (void)_handleContentProviderDidInvalidateContent:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  [(NSMapTable *)self->_collectionGroups removeObjectForKey:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 controllerDidInvalidateContent:self];
  }
}

- (void)_handlePhotoLibraryDidChange:(id)a3
{
  id v42 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v40 = self;
  id v4 = [(NPTOCompanionSyncDeviceContentController *)self _contentProviders];
  id v37 = [v4 countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v37)
  {
    char v5 = 0;
    id obj = v4;
    uint64_t v36 = *(void *)v48;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v48 != v36) {
          objc_enumerationMutation(obj);
        }
        char v7 = [(NSMapTable *)v40->_collectionGroups objectForKey:*(void *)(*((void *)&v47 + 1) + 8 * v6)];
        id v8 = [v7 assetCollections];
        id v9 = [v42 changeDetailsForFetchResult:v8];

        if (v9)
        {
          id v10 = [v9 fetchResultAfterChanges];
          [v7 setAssetCollections:v10];

          [v7 setCollections:0];
          id v11 = sub_10005CDAC();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = [(IDSDevice *)v40->_device name];
            *(_DWORD *)buf = 138412546;
            v53 = v7;
            __int16 v54 = 2112;
            v55 = v12;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Content] Updated collection group: %@ for device: %@", buf, 0x16u);
          }
          char v5 = 1;
        }
        long long v38 = v9;
        uint64_t v39 = v6;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v41 = [v7 assetCollections];
        id v13 = [v41 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v44;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v44 != v15) {
                objc_enumerationMutation(v41);
              }
              uint64_t v17 = *(void *)(*((void *)&v43 + 1) + 8 * i);
              id v19 = [v7 collections];
              uint64_t v20 = [v19 objectForKey:v17];

              long long v21 = [v20 assets];

              if (v21)
              {
                id v22 = [v20 assets];
                uint64_t v23 = [v42 npto_relevantChangeDetailsForFetchResult:v22];

                if (v23)
                {
                  id v24 = [v23 fetchResultAfterChanges];
                  [v20 setAssets:v24];

                  char v25 = sub_10005CDAC();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    long long v26 = [(IDSDevice *)v40->_device name];
                    *(_DWORD *)buf = 138412546;
                    v53 = v20;
                    __int16 v54 = 2112;
                    v55 = v26;
                    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[Content] Updated collection assets: %@ for device: %@", buf, 0x16u);
                  }
                  char v5 = 1;
                }
              }
              long long v27 = [v20 keyAssets];

              if (v27)
              {
                long long v28 = [v20 keyAssets];
                long long v29 = [v42 npto_relevantChangeDetailsForFetchResult:v28];

                if (v29)
                {
                  long long v30 = [v29 fetchResultAfterChanges];
                  [v20 setKeyAssets:v30];

                  long long v31 = sub_10005CDAC();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                  {
                    long long v32 = [(IDSDevice *)v40->_device name];
                    *(_DWORD *)buf = 138412546;
                    v53 = v20;
                    __int16 v54 = 2112;
                    v55 = v32;
                    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[Content] Updated collection key assets: %@ for device: %@", buf, 0x16u);
                  }
                  char v5 = 1;
                }
              }
            }
            id v14 = [v41 countByEnumeratingWithState:&v43 objects:v51 count:16];
          }
          while (v14);
        }

        uint64_t v6 = v39 + 1;
      }
      while ((id)(v39 + 1) != v37);
      id v37 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v37);

    if (v5)
    {
      long long v33 = sub_10005CDAC();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Photo library did change, content providers have relevant changes.", buf, 2u);
      }

      id WeakRetained = objc_loadWeakRetained((id *)&v40->_delegate);
      [WeakRetained controllerDidInvalidateContent:v40];
      goto LABEL_38;
    }
  }
  else
  {
  }
  id WeakRetained = sub_10005CDAC();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEFAULT, "Photo library did change, but we don't care about the changes.", buf, 2u);
  }
LABEL_38:
}

- (void)contentProviderDidInvalidateContent:(id)a3
{
  id v4 = a3;
  char v5 = sub_10005CDAC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "contentProviderDidInvalidateContent: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005CAF0;
  v8[3] = &unk_100093600;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  char v5 = sub_10005CDAC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v12 = "-[NPTOCompanionSyncDeviceContentController photoLibraryDidChange:]";
    __int16 v13 = 2080;
    id v14 = "/Library/Caches/com.apple.xbs/Sources/NanoPhotos/nptocompaniond/NPTOCompanionSyncDeviceContentController.m";
    __int16 v15 = 1024;
    int v16 = 403;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s (%s:%d)", buf, 0x1Cu);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005CCB8;
  v8[3] = &unk_100093600;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (IDSDevice)device
{
  return self->_device;
}

- (NPTOCompanionSyncDeviceContentControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NPTOCompanionSyncDeviceContentControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_collectionGroups, 0);
  objc_storeStrong((id *)&self->_contentProviders, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end