@interface UpdateArtistArtworkTokensOperation
- (id)_imageURLFromArtworkInfo:(id)a3;
- (void)_addAllStoreArtistIDsToSet:(id)a3;
- (void)_addSpecificStoreArtistIDsToSet:(id)a3;
- (void)main;
@end

@implementation UpdateArtistArtworkTokensOperation

- (id)_imageURLFromArtworkInfo:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)ICStoreArtworkInfo) initWithArtworkResponseDictionary:v3];

  MSVGetMaximumScreenSize();
  double v6 = v5;
  double v8 = v7;
  v9 = [v4 sizeInfo];
  [v9 maxSupportedSize];
  double v11 = v10;
  double v13 = v12;

  if (v11 != CGSizeZero.width || v13 != CGSizeZero.height)
  {
    MSVImageUtilitiesMakeBoundingBoxSize();
    double v6 = v15;
    double v8 = v16;
  }
  v17 = objc_msgSend(v4, "artworkURLWithSize:cropStyle:format:preferP3ColorSpace:", ICStoreArtworkInfoCropStyleSpecificRectangle, ICStoreArtworkInfoImageFormatJPEG, MSVDeviceSupportsExtendedColorDisplay(), v6, v8);

  return v17;
}

- (void)_addAllStoreArtistIDsToSet:(id)a3
{
  id v4 = a3;
  double v5 = [(QueueAwareOperation *)self musicLibrary];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000714BC;
  v7[3] = &unk_1001BB928;
  id v8 = v4;
  id v6 = v4;
  [v5 databaseConnectionAllowingWrites:0 withBlock:v7];
}

- (void)_addSpecificStoreArtistIDsToSet:(id)a3
{
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(QueueAwareOperation *)self artistPersistentIDsToUpdate];
  id v5 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v30;
    uint64_t v8 = ML3ArtistPropertyStoreID;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(obj);
        }
        id v10 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)v9) longLongValue];
        double v11 = [(QueueAwareOperation *)self musicLibrary];
        id v12 = +[ML3Artist newWithPersistentID:v10 inLibrary:v11];

        double v13 = [v12 valueForProperty:v8];
        if ([v13 longLongValue]) {
          [v4 addObject:v13];
        }

        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v6);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obja = [(QueueAwareOperation *)self albumArtistPersistentIDsToUpdate];
  id v14 = [obja countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v26;
    uint64_t v17 = ML3AlbumArtistPropertyStoreID;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(obja);
        }
        id v19 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v18) longLongValue];
        v20 = [(QueueAwareOperation *)self musicLibrary];
        id v21 = +[ML3AlbumArtist newWithPersistentID:v19 inLibrary:v20];

        v22 = [v21 valueForProperty:v17];
        if ([v22 longLongValue]) {
          [v4 addObject:v22];
        }

        v18 = (char *)v18 + 1;
      }
      while (v15 != v18);
      id v15 = [obja countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v15);
  }
}

- (void)main
{
  id v3 = [(QueueAwareOperation *)self musicLibrary];
  id v4 = [v3 currentRevision];

  id v5 = objc_alloc_init((Class)NSMutableSet);
  if ([(QueueAwareOperation *)self shouldProcessSpecificArtists]) {
    [(UpdateArtistArtworkTokensOperation *)self _addSpecificStoreArtistIDsToSet:v5];
  }
  else {
    [(UpdateArtistArtworkTokensOperation *)self _addAllStoreArtistIDsToSet:v5];
  }
  if ([(UpdateArtistArtworkTokensOperation *)self isCancelled])
  {
    id v6 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cancelled after gathering artist artwork tokens.", buf, 2u);
    }
  }
  else
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v8 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v30 = [v5 count];
      __int16 v31 = 1024;
      int v32 = 100;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Batching %lu lookup requests in to chunks of size %d.", buf, 0x12u);
    }

    v9 = [v5 allObjects];
    id v10 = [v9 subarraysOfSize:100];

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100071DB8;
    v27[3] = &unk_1001BB8D8;
    v27[4] = self;
    id v6 = v7;
    long long v28 = v6;
    [v10 enumerateObjectsUsingBlock:v27];
    if ([(UpdateArtistArtworkTokensOperation *)self isCancelled])
    {
      double v11 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Cancelled after looking up artist hero image URLs.", buf, 2u);
      }
    }
    else
    {
      id v12 = [(QueueAwareOperation *)self musicLibrary];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100072204;
      v23[3] = &unk_1001BEA70;
      v24 = v5;
      long long v25 = self;
      long long v26 = v6;
      [v12 performDatabaseTransactionWithBlock:v23];

      if ([(UpdateArtistArtworkTokensOperation *)self isCancelled])
      {
        double v13 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Cancelled after updating artist artwork tokens.", buf, 2u);
        }
      }
      else
      {
        double v13 = [(QueueAwareOperation *)self operationQueue];
        if (v13)
        {
          id v14 = +[ICDeviceInfo currentDeviceInfo];
          unsigned int v15 = [v14 isWatch];

          if (v15) {
            uint64_t v16 = FinishArtistHeroUpdateOperation;
          }
          else {
            uint64_t v16 = DownloadArtistHeroImagesOperation;
          }
          id v22 = [v16 alloc];
          uint64_t v17 = [(QueueAwareOperation *)self artworkImporter];
          v18 = [(QueueAwareOperation *)self clientIdentity];
          id v19 = [(QueueAwareOperation *)self artistPersistentIDsToUpdate];
          v20 = [(QueueAwareOperation *)self albumArtistPersistentIDsToUpdate];
          id v21 = [v22 initWithArtworkImporter:v17 clientIdentity:v18 operationQueue:v13 artistPersistentIDsToUpdate:v19 albumArtistPersistentIDsToUpdate:v20];

          [v21 setCurrentDatabaseRevision:v4];
          [v13 addOperation:v21];
        }
      }

      double v11 = v24;
    }
  }
}

@end