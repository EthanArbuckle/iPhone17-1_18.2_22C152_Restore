@interface UpdateArtistStoreIDsByMapOperation
- (NSNumber)updateIntervalSeconds;
- (NSURL)allArtistImagesMapURL;
- (NSURL)artistNameLibraryMatchURL;
- (id)_fetchAndCacheLatestAllArtistImagesMap;
- (id)_latestAllArtistImagesMap;
- (void)_updateAllArtistStoreIDsUsingAllArtistImagesMap:(id)a3;
- (void)_updateSpecificArtistStoreIDsUsingAllArtistImagesMap:(id)a3;
- (void)main;
- (void)setAllArtistImagesMapURL:(id)a3;
- (void)setArtistNameLibraryMatchURL:(id)a3;
- (void)setUpdateIntervalSeconds:(id)a3;
@end

@implementation UpdateArtistStoreIDsByMapOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artistNameLibraryMatchURL, 0);
  objc_storeStrong((id *)&self->_allArtistImagesMapURL, 0);

  objc_storeStrong((id *)&self->_updateIntervalSeconds, 0);
}

- (void)setArtistNameLibraryMatchURL:(id)a3
{
}

- (NSURL)artistNameLibraryMatchURL
{
  return self->_artistNameLibraryMatchURL;
}

- (void)setAllArtistImagesMapURL:(id)a3
{
}

- (NSURL)allArtistImagesMapURL
{
  return self->_allArtistImagesMapURL;
}

- (void)setUpdateIntervalSeconds:(id)a3
{
}

- (NSNumber)updateIntervalSeconds
{
  return self->_updateIntervalSeconds;
}

- (void)_updateAllArtistStoreIDsUsingAllArtistImagesMap:(id)a3
{
  id v4 = a3;
  v5 = [(QueueAwareOperation *)self musicLibrary];
  v6 = sub_1000742CC(v5);

  v7 = [(QueueAwareOperation *)self musicLibrary];
  v8 = sub_1000743C4(v7);

  uint64_t v21 = ML3ArtistPropertyName;
  v9 = +[NSArray arrayWithObjects:&v21 count:1];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000747CC;
  v17[3] = &unk_1001BDC08;
  id v10 = v4;
  id v18 = v10;
  v19 = self;
  [v6 enumeratePersistentIDsAndProperties:v9 usingBlock:v17];

  if ([(UpdateArtistStoreIDsByMapOperation *)self isCancelled])
  {
    v11 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Cancelled after updating artist store ids.", buf, 2u);
    }
  }
  else
  {
    uint64_t v20 = ML3AlbumArtistPropertyName;
    v12 = +[NSArray arrayWithObjects:&v20 count:1];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000748E4;
    v13[3] = &unk_1001BDC08;
    v14 = v10;
    v15 = self;
    [v8 enumeratePersistentIDsAndProperties:v12 usingBlock:v13];

    v11 = v14;
  }
}

- (void)_updateSpecificArtistStoreIDsUsingAllArtistImagesMap:(id)a3
{
  id v42 = a3;
  v43 = self;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v4 = [(QueueAwareOperation *)self artistPersistentIDsToUpdate];
  id v5 = [v4 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v49;
    uint64_t v8 = ML3ArtistPropertyStoreID;
    id obj = (id)ML3ArtistPropertyName;
    do
    {
      v9 = 0;
      id v38 = v6;
      do
      {
        if (*(void *)v49 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * (void)v9), "longLongValue", v38);
        v11 = [(QueueAwareOperation *)v43 musicLibrary];
        id v12 = +[ML3Artist newWithPersistentID:v10 inLibrary:v11];

        v13 = [v12 valueForProperty:v8];
        id v14 = [v13 longLongValue];

        if (!v14)
        {
          v15 = [v12 valueForProperty:obj];
          v16 = [v42 objectForKey:v15];
          if (v16)
          {
            [(QueueAwareOperation *)v43 musicLibrary];
            uint64_t v17 = v7;
            v19 = id v18 = v4;
            sub_100074BCC(v19, (uint64_t)v10, v15, [v16 longLongValue]);

            id v4 = v18;
            uint64_t v7 = v17;
            id v6 = v38;
          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [v4 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v6);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obja = [(QueueAwareOperation *)v43 albumArtistPersistentIDsToUpdate];
  id v20 = [obja countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v45;
    uint64_t v23 = ML3AlbumArtistPropertyStoreID;
    uint64_t v39 = ML3AlbumArtistPropertyName;
    v24 = &ML3TrackPropertyLyrics_ptr;
    do
    {
      v25 = 0;
      do
      {
        if (*(void *)v45 != v22) {
          objc_enumerationMutation(obja);
        }
        id v26 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * (void)v25), "longLongValue", v39);
        v27 = v24[177];
        v28 = [(QueueAwareOperation *)v43 musicLibrary];
        id v29 = [v27 newWithPersistentID:v26 inLibrary:v28];

        v30 = [v29 valueForProperty:v23];
        id v31 = [v30 longLongValue];

        if (!v31)
        {
          uint64_t v32 = v23;
          uint64_t v33 = v22;
          v34 = v24;
          v35 = [v29 valueForProperty:v39];
          v36 = [v42 objectForKey:v35];
          if (v36)
          {
            v37 = [(QueueAwareOperation *)v43 musicLibrary];
            sub_1000749FC(v37, (uint64_t)v26, v35, [v36 longLongValue]);
          }
          v24 = v34;
          uint64_t v22 = v33;
          uint64_t v23 = v32;
        }

        v25 = (char *)v25 + 1;
      }
      while (v21 != v25);
      id v21 = [obja countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v21);
  }
}

- (id)_fetchAndCacheLatestAllArtistImagesMap
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Attempting to fetch latest all-artist-images-map", (uint8_t *)&buf, 2u);
  }

  id v4 = [(UpdateArtistStoreIDsByMapOperation *)self allArtistImagesMapURL];

  id v5 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = [(UpdateArtistStoreIDsByMapOperation *)self allArtistImagesMapURL];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "all-artist-images-map-url: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v37 = 0x3032000000;
    id v38 = sub_10006E8D4;
    uint64_t v39 = sub_10006E8E4;
    id v40 = 0;
    uint64_t v8 = [(UpdateArtistStoreIDsByMapOperation *)self allArtistImagesMapURL];
    v9 = +[NSMutableURLRequest requestWithURL:v8];

    [v9 setTimeoutInterval:180.0];
    id v10 = objc_alloc((Class)ICStoreRequestContext);
    v11 = [(QueueAwareOperation *)self userIdentity];
    id v12 = [v10 initWithIdentity:v11];

    id v13 = [objc_alloc((Class)ICStoreURLRequest) initWithURLRequest:v9 requestContext:v12];
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    v15 = +[ICURLSessionManager defaultSession];
    id v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    v28 = sub_1000755D8;
    id v29 = &unk_1001BB860;
    p_long long buf = &buf;
    v16 = v14;
    v30 = v16;
    [v15 enqueueDataRequest:v13 withCompletionHandler:&v26];

    dispatch_time_t v17 = dispatch_time(0, 300000000000);
    if (dispatch_semaphore_wait(v16, v17))
    {
      id v18 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v34 = 67109120;
        int v35 = 300;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Failed to receive response for all-artist-images-map after %d seconds, cancelling request", v34, 8u);
      }

      v19 = +[ICURLSessionManager defaultSession];
      [v19 cancelRequest:v13];
    }
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      v32[0] = @"AllArtistImagesMapNextUpdateDateKey";
      id v20 = +[NSDate date];
      id v21 = [(UpdateArtistStoreIDsByMapOperation *)self updateIntervalSeconds];
      uint64_t v22 = objc_msgSend(v20, "dateByAddingTimeInterval:", (double)(unint64_t)objc_msgSend(v21, "unsignedIntegerValue"));
      v32[1] = @"AllArtistImagesMapDataDictionaryKey";
      v33[0] = v22;
      v33[1] = *(void *)(*((void *)&buf + 1) + 40);
      uint64_t v23 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];

      v24 = +[CloudArtistHeroImageImporter allArtistImagesMapCacheFilePathURL];
      [v23 writeToURL:v24 atomically:1];
    }
    else
    {
      uint64_t v23 = 0;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (v6)
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Failed to get 'all-artist-images-map-url'. Cannot fetch map at this time.", (uint8_t *)&buf, 2u);
    }

    uint64_t v23 = 0;
  }

  return v23;
}

- (id)_latestAllArtistImagesMap
{
  v3 = +[CloudArtistHeroImageImporter allArtistImagesMapCacheFilePathURL];
  id v4 = +[NSDictionary dictionaryWithContentsOfURL:v3];
  id v5 = v4;
  if (!v4)
  {
    v11 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 67109120;
      LODWORD(v20) = 1;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "allArtistImagesMap.plist (null) needsUpdate: %d", (uint8_t *)&v19, 8u);
    }

    goto LABEL_11;
  }
  BOOL v6 = [v4 objectForKey:@"AllArtistImagesMapNextUpdateDateKey"];
  uint64_t v7 = +[NSDate date];
  uint64_t v8 = v7;
  if (v6)
  {
    v9 = [v7 earlierDate:v6];
    BOOL v10 = v8 != v9;
  }
  else
  {
    BOOL v10 = 1;
  }

  id v12 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [v5 objectForKey:@"AllArtistImagesMapDataDictionaryKey"];
    int v19 = 134218240;
    id v20 = [v13 count];
    __int16 v21 = 1024;
    BOOL v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "allArtistImagesMap.plist (count = %lu) needsUpdate: %d", (uint8_t *)&v19, 0x12u);
  }
  if (v10)
  {
LABEL_11:
    dispatch_semaphore_t v14 = [(UpdateArtistStoreIDsByMapOperation *)self _fetchAndCacheLatestAllArtistImagesMap];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;

      id v5 = v16;
    }
  }
  dispatch_time_t v17 = [v5 objectForKey:@"AllArtistImagesMapDataDictionaryKey"];

  return v17;
}

- (void)main
{
  v3 = [(UpdateArtistStoreIDsByMapOperation *)self _latestAllArtistImagesMap];
  if ([(UpdateArtistStoreIDsByMapOperation *)self isCancelled])
  {
    id v4 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = 0;
      id v5 = "Cancelled after getting latest all artist image map data.";
      BOOL v6 = (uint8_t *)&v21;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (!v3)
  {
    uint64_t v7 = [(QueueAwareOperation *)self operationQueue];
    if (v7)
    {
      uint64_t v8 = [UpdateArtistStoreIDsByLibraryMatchLookupOperation alloc];
      v9 = [(QueueAwareOperation *)self artworkImporter];
      BOOL v10 = [(QueueAwareOperation *)self clientIdentity];
      v11 = [(QueueAwareOperation *)self artistPersistentIDsToUpdate];
      id v12 = [(QueueAwareOperation *)self albumArtistPersistentIDsToUpdate];
      id v13 = [(QueueAwareOperation *)v8 initWithArtworkImporter:v9 clientIdentity:v10 operationQueue:v7 artistPersistentIDsToUpdate:v11 albumArtistPersistentIDsToUpdate:v12];

      dispatch_semaphore_t v14 = [(UpdateArtistStoreIDsByMapOperation *)self artistNameLibraryMatchURL];
      [(UpdateArtistStoreIDsByLibraryMatchLookupOperation *)v13 setArtistNameLibraryMatchURL:v14];

LABEL_17:
      [v7 addOperation:v13];
    }
LABEL_18:

    goto LABEL_19;
  }
  if ([(QueueAwareOperation *)self shouldProcessSpecificArtists]) {
    [(UpdateArtistStoreIDsByMapOperation *)self _updateSpecificArtistStoreIDsUsingAllArtistImagesMap:v3];
  }
  else {
    [(UpdateArtistStoreIDsByMapOperation *)self _updateAllArtistStoreIDsUsingAllArtistImagesMap:v3];
  }
  if (![(UpdateArtistStoreIDsByMapOperation *)self isCancelled])
  {
    uint64_t v7 = [(QueueAwareOperation *)self operationQueue];
    if (v7)
    {
      v15 = [UpdateArtistArtworkTokensOperation alloc];
      id v16 = [(QueueAwareOperation *)self artworkImporter];
      dispatch_time_t v17 = [(QueueAwareOperation *)self clientIdentity];
      id v18 = [(QueueAwareOperation *)self artistPersistentIDsToUpdate];
      int v19 = [(QueueAwareOperation *)self albumArtistPersistentIDsToUpdate];
      id v13 = [(QueueAwareOperation *)v15 initWithArtworkImporter:v16 clientIdentity:v17 operationQueue:v7 artistPersistentIDsToUpdate:v18 albumArtistPersistentIDsToUpdate:v19];

      goto LABEL_17;
    }
    goto LABEL_18;
  }
  id v4 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v20 = 0;
    id v5 = "Cancelled after updating album_artist store ids.";
    BOOL v6 = (uint8_t *)&v20;
    goto LABEL_13;
  }
LABEL_14:

LABEL_19:
}

@end