@interface _NTKDPhotosFacesCuratorStore
+ (id)complications;
- (BOOL)_queue_facePhoto:(id)a3 isUpToDateWith:(id)a4;
- (_NTKDPhotosFacesCuratorStore)initWithStore:(id)a3;
- (id)_queue_createPhotosFaceWithContent:(unint64_t)a3;
- (id)_queue_curatePhotosFaceFromAsset:(id)a3 forFaceUUID:(id)a4 andContent:(unint64_t)a5;
- (id)_queue_fetchSyncedAlbumLibraryPhoto;
- (id)_queue_syncedAlbumOptions;
- (void)_queue_insertInOrderedUUIDs:(id)a3 atIndex:(unint64_t)a4;
- (void)_queue_setStoreDataForStore:(id)a3;
- (void)_queue_setSyncedAlbumDataForStore:(id)a3;
- (void)_queue_syncStoreWithSyncedAlbum;
- (void)collectionTargetLibraryDidUpdate:(id)a3;
- (void)dealloc;
- (void)initialCurationWithCompletion:(id)a3;
- (void)photoLibraryDidChange:(id)a3;
@end

@implementation _NTKDPhotosFacesCuratorStore

- (_NTKDPhotosFacesCuratorStore)initWithStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_NTKDPhotosFacesCuratorStore;
  v6 = [(_NTKDPhotosFacesCuratorStore *)&v10 init];
  if (v6)
  {
    uint64_t v7 = +[NTKFirstUnlockQueue photosFacesCuratorQueue];
    workQ = v6->_workQ;
    v6->_workQ = (NTKFirstUnlockQueue *)v7;

    objc_storeStrong((id *)&v6->_store, a3);
    v6->_syncedAlbumHasBeenSetup = 0;
  }

  return v6;
}

- (void)dealloc
{
  v3 = +[PHPhotoLibrary sharedPhotoLibrary];
  [v3 unregisterChangeObserver:self];

  [(NPTOCollectionTargetLibrary *)self->_syncedAlbum removeObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)_NTKDPhotosFacesCuratorStore;
  [(_NTKDPhotosFacesCuratorStore *)&v4 dealloc];
}

- (void)initialCurationWithCompletion:(id)a3
{
  id v4 = a3;
  sub_10000B610(@"com.apple.ntkd.galleryphotosfacecurator.asyncwork");
  workQ = self->_workQ;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C558;
  v7[3] = &unk_100060AE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NTKFirstUnlockQueue *)workQ dispatch:v7];
}

- (void)collectionTargetLibraryDidUpdate:(id)a3
{
  sub_10000B610(@"com.apple.ntkd.galleryphotosfacecurator.asyncwork");
  id v4 = [(NTKDCollectionStore *)self->_store deviceUUID];
  workQ = self->_workQ;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C7DC;
  v7[3] = &unk_100060AB8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [(NTKFirstUnlockQueue *)workQ dispatch:v7];
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  sub_10000B610(@"com.apple.ntkd.galleryphotosfacecurator.asyncwork");
  id v5 = [(NTKDCollectionStore *)self->_store deviceUUID];
  workQ = self->_workQ;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000C9F8;
  v9[3] = &unk_100060C58;
  v9[4] = self;
  id v10 = v4;
  id v11 = v5;
  id v7 = v5;
  id v8 = v4;
  [(NTKFirstUnlockQueue *)workQ dispatch:v9];
}

- (void)_queue_setStoreDataForStore:(id)a3
{
  id v4 = a3;
  id v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 orderedUUIDs];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = [v6 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_NTKDPhotosFacesCuratorStore: _queue_setStoreDataForStore: %ld faces", (uint8_t *)&buf, 0xCu);
  }
  syncedAlbumPhotosUUID = self->_syncedAlbumPhotosUUID;
  self->_syncedAlbumPhotosUUID = 0;

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v8 = [(NTKDCollectionStore *)self->_store orderedUUIDs];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000CCF0;
  v9[3] = &unk_100061060;
  v9[4] = self;
  void v9[5] = &buf;
  [v8 enumerateObjectsUsingBlock:v9];
  if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
    [(NTKDCollectionStore *)self->_store synchronize];
  }

  _Block_object_dispose(&buf, 8);
}

- (void)_queue_setSyncedAlbumDataForStore:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_syncedAlbumHasBeenSetup)
  {
    id v6 = [v4 deviceUUID];
    id v7 = +[CLKDevice nrDeviceForNRDeviceUUID:v6];

    if (v7)
    {
      id v8 = (NPTOCollectionTargetLibrary *)[objc_alloc((Class)NPTOCollectionTargetLibrary) initWithCollectionTarget:1 device:v7];
      syncedAlbum = self->_syncedAlbum;
      self->_syncedAlbum = v8;

      [(NPTOCollectionTargetLibrary *)self->_syncedAlbum addObserver:self];
      id v10 = +[PHPhotoLibrary sharedPhotoLibrary];
      [v10 registerChangeObserver:self];
    }
    else
    {
      id v10 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [v5 collectionIdentifier];
        char v12 = [v5 deviceUUID];
        int v21 = 138412546;
        v22 = v11;
        __int16 v23 = 2112;
        v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "_NTKDPhotosFacesCuratorStore: _queue_setSyncedAlbumDataForStore: no nrDevice for store %@-%@", (uint8_t *)&v21, 0x16u);
      }
    }

    self->_syncedAlbumHasBeenSetup = 1;
  }
  syncedAlbumAsset = self->_syncedAlbumAsset;
  self->_syncedAlbumAsset = 0;

  v14 = [(NPTOCollectionTargetLibrary *)self->_syncedAlbum assetCollections];
  v15 = [v14 anyObject];

  if (v15)
  {
    v16 = [(_NTKDPhotosFacesCuratorStore *)self _queue_syncedAlbumOptions];
    v17 = [(NPTOCollectionTargetLibrary *)self->_syncedAlbum fetchAssetsInAssetCollection:v15 options:v16];
    v18 = self->_syncedAlbumAsset;
    self->_syncedAlbumAsset = v17;
  }
  v19 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (v15)
    {
      v20 = [v15 localizedTitle];
    }
    else
    {
      v20 = @"[NONE]";
    }
    int v21 = 138412290;
    v22 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "_NTKDPhotosFacesCuratorStore: _queue_setSyncedAlbumDataForStore: observing album %@", (uint8_t *)&v21, 0xCu);
    if (v15) {
  }
    }
}

- (void)_queue_syncStoreWithSyncedAlbum
{
  v3 = [(_NTKDPhotosFacesCuratorStore *)self _queue_fetchSyncedAlbumLibraryPhoto];
  id v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    syncedAlbumPhotosUUID = self->_syncedAlbumPhotosUUID;
    id v6 = [v3 localIdentifier];
    int v9 = 138412546;
    id v10 = syncedAlbumPhotosUUID;
    __int16 v11 = 2112;
    char v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "_NTKDPhotosFacesCuratorStore: _queue_syncStoreWithSyncedAlbum: curating synced album face %@ with asset %@", (uint8_t *)&v9, 0x16u);
  }
  id v7 = [(_NTKDPhotosFacesCuratorStore *)self _queue_curatePhotosFaceFromAsset:v3 forFaceUUID:self->_syncedAlbumPhotosUUID andContent:0];
  id v8 = self->_syncedAlbumPhotosUUID;
  self->_syncedAlbumPhotosUUID = v7;

  [(_NTKDPhotosFacesCuratorStore *)self _queue_insertInOrderedUUIDs:self->_syncedAlbumPhotosUUID atIndex:0];
}

- (id)_queue_fetchSyncedAlbumLibraryPhoto
{
  return [(PHFetchResult *)self->_syncedAlbumAsset firstObject];
}

- (id)_queue_curatePhotosFaceFromAsset:(id)a3 forFaceUUID:(id)a4 andContent:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = [(NTKDCollectionStore *)self->_store faceForUUID:v9];
    __int16 v11 = [v10 resourceDirectory];

    if (v11)
    {
      char v12 = [v10 resourceDirectory];
      v13 = +[NTKPhotosReader readerForResourceDirectory:v12];
      v14 = [v13 firstObject];
    }
    else
    {
      v14 = 0;
    }
    if ([(_NTKDPhotosFacesCuratorStore *)self _queue_facePhoto:v14 isUpToDateWith:v8])
    {
      v15 = v9;
      goto LABEL_11;
    }
    v15 = v9;
  }
  else
  {
    v15 = +[NSUUID UUID];
    id v10 = [(_NTKDPhotosFacesCuratorStore *)self _queue_createPhotosFaceWithContent:a5];
    v16 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 138412290;
      v34 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_NTKDPhotosFacesCuratorStore:    create new photos face %@", (uint8_t *)&v33, 0xCu);
    }

    if ([(_NTKDPhotosFacesCuratorStore *)self _queue_facePhoto:0 isUpToDateWith:v8])
    {
      [(NTKDCollectionStore *)self->_store addFace:v10 forUUID:v15];
      [(NTKDCollectionStore *)self->_store synchronize];
      v14 = 0;
LABEL_11:
      v17 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [v8 localIdentifier];
        v19 = (void *)v18;
        CFStringRef v20 = @"[NONE]";
        if (v18) {
          CFStringRef v20 = (const __CFString *)v18;
        }
        int v33 = 138412546;
        v34 = v15;
        __int16 v35 = 2112;
        CFStringRef v36 = v20;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "_NTKDPhotosFacesCuratorStore:    curated face %@ has valid photo (%@)", (uint8_t *)&v33, 0x16u);
      }
      id v21 = v15;
      goto LABEL_38;
    }
    v14 = 0;
  }
  v22 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [v8 localIdentifier];
    v24 = (void *)v23;
    CFStringRef v25 = @"[NONE]";
    if (v23) {
      CFStringRef v25 = (const __CFString *)v23;
    }
    int v33 = 138412546;
    v34 = v15;
    __int16 v35 = 2112;
    CFStringRef v36 = v25;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "_NTKDPhotosFacesCuratorStore:    curated %@ face gets new photo %@", (uint8_t *)&v33, 0x16u);
  }
  if (!v8)
  {
LABEL_29:
    v28 = 0;
    if (v9) {
      goto LABEL_25;
    }
LABEL_30:
    if (v28) {
      [v10 setResourceDirectory:v28];
    }
    [(NTKDCollectionStore *)self->_store addFace:v10 forUUID:v15];
    goto LABEL_33;
  }
  v26 = [(NTKDCollectionStore *)self->_store deviceUUID];
  v27 = +[CLKDevice deviceForNRDeviceUUID:v26];
  v28 = +[NTKCompanionResourceDirectoryEditor _createResourceDirectoryWithAsset:v8 assetCollection:0 forDevice:v27 previewOnly:1];

  if (!v28)
  {
    v29 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100042FA0(v8, v29);
    }

    goto LABEL_29;
  }
  if (!v9) {
    goto LABEL_30;
  }
LABEL_25:
  [(NTKDCollectionStore *)self->_store updateFaceForUUID:v15 withResourceDirectory:v28];
LABEL_33:
  [(NTKDCollectionStore *)self->_store synchronize];
  if (v28)
  {
    v30 = +[NSFileManager defaultManager];
    [v30 removeItemAtPath:v28 error:0];
  }
  v31 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 138412290;
    v34 = v15;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "_NTKDPhotosFacesCuratorStore:    curated face now is %@", (uint8_t *)&v33, 0xCu);
  }

  id v21 = v15;
LABEL_38:

  return v21;
}

- (BOOL)_queue_facePhoto:(id)a3 isUpToDateWith:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  id v7 = (void *)v6;
  unsigned __int8 v8 = (v5 | v6) == 0;
  if (v5 && v6) {
    unsigned __int8 v8 = [(id)v5 isEqualToAsset:v6];
  }

  return v8;
}

- (id)_queue_createPhotosFaceWithContent:(unint64_t)a3
{
  id v4 = [(NTKDCollectionStore *)self->_store deviceUUID];
  unint64_t v5 = +[CLKDevice deviceForNRDeviceUUID:v4];

  unint64_t v6 = +[NTKFace defaultFaceOfStyle:22 forDevice:v5];
  id v7 = +[NTKPhotosContentEditOption optionWithPhotosContent:a3 forDevice:v5];
  [v6 selectOption:v7 forCustomEditMode:12 slot:0];
  unsigned __int8 v8 = +[_NTKDPhotosFacesCuratorStore complications];
  [v6 _setFaceGalleryComplicationTypesForSlots:v8];

  return v6;
}

+ (id)complications
{
  v4[0] = NTKComplicationSlotTop;
  v4[1] = NTKComplicationSlotBottom;
  v5[0] = &off_100064090;
  v5[1] = &off_1000640A8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (void)_queue_insertInOrderedUUIDs:(id)a3 atIndex:(unint64_t)a4
{
  store = self->_store;
  id v7 = a3;
  unsigned __int8 v8 = [(NTKDCollectionStore *)store orderedUUIDs];
  id v11 = +[NSMutableArray arrayWithArray:v8];

  [v11 removeObject:v7];
  id v9 = [v11 count];
  if ((unint64_t)v9 >= a4) {
    unint64_t v10 = a4;
  }
  else {
    unint64_t v10 = (unint64_t)v9;
  }
  [v11 insertObject:v7 atIndex:v10];

  [(NTKDCollectionStore *)self->_store setOrderedUUIDs:v11];
  [(NTKDCollectionStore *)self->_store synchronize];
}

- (id)_queue_syncedAlbumOptions
{
  id v2 = objc_alloc_init((Class)PHFetchOptions);
  v3 = +[NSPredicate predicateWithFormat:@"(mediaType = %ld) && ((playbackStyle = %ld) || (playbackStyle = %ld))", 1, 1, 3];
  [v2 setPredicate:v3];

  id v4 = +[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:1];
  id v9 = v4;
  unint64_t v5 = +[NSArray arrayWithObjects:&v9 count:1];
  [v2 setSortDescriptors:v5];

  [v2 setFetchLimit:1];
  uint64_t v8 = PHAssetPropertySetPhotoIris;
  unint64_t v6 = +[NSArray arrayWithObjects:&v8 count:1];
  [v2 addFetchPropertySets:v6];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncedAlbumPhotosUUID, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_syncedAlbumAsset, 0);
  objc_storeStrong((id *)&self->_syncedAlbum, 0);
  objc_storeStrong((id *)&self->_workQ, 0);
}

@end