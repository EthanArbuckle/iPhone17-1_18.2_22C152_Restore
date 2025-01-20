@interface JaliscoMediaImporter
+ (id)logCategory;
+ (id)oversizeLogCategory;
- (BOOL)includePreorders;
- (BOOL)needsUpdateForTokens;
- (JaliscoMediaImporter)initWithConnection:(id)a3 supportedMediaKindsHandler:(id)a4;
- (id)_chapterArtworkURLsForData:(id)a3 baseURL:(id)a4;
- (id)_chapterDataFromURL:(id)a3;
- (id)_importTracksFromRevision:(unsigned int)a3 toRevision:(unsigned int)a4 withItemsResponse:(id)a5 clientIdentity:(id)a6 itemsFiles:(id)a7;
- (id)_supportedMediaKindsDatabasePropertyValue;
- (id)mediaFilter;
- (id)metadataKeys;
- (id)purchaseTokens;
- (id)queryFilter;
- (id)supportedMediaKinds;
- (id)updateLibraryFromRevision:(unsigned int)a3 toRevision:(unsigned int)a4 withResponse:(id)a5 clientIdentity:(id)a6 itemsFiles:(id)a7;
- (unsigned)onDiskRevision;
- (void)cancel;
- (void)clearNeedsUpdateForTokens;
@end

@implementation JaliscoMediaImporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedMediaKindsHandler, 0);
  objc_storeStrong((id *)&self->_supportedMediaKinds, 0);

  objc_storeStrong((id *)&self->_mediaFilter, 0);
}

- (JaliscoMediaImporter)initWithConnection:(id)a3 supportedMediaKindsHandler:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)JaliscoMediaImporter;
  v8 = [(JaliscoImporter *)&v11 initWithConnection:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_supportedMediaKindsHandler, a4);
  }

  return v9;
}

- (id)mediaFilter
{
  mediaFilter = self->_mediaFilter;
  if (!mediaFilter)
  {
    v4 = [ICDJaliscoMediaFilter alloc];
    v5 = [(JaliscoImporter *)self musicLibrary];
    v6 = [v5 jaliscoLastExcludedMediaKinds];
    id v7 = [(ICDJaliscoMediaFilter *)v4 initWithKindsToExclude:v6 supportedMediaKindsHandler:self->_supportedMediaKindsHandler];
    v8 = self->_mediaFilter;
    self->_mediaFilter = v7;

    mediaFilter = self->_mediaFilter;
  }

  return mediaFilter;
}

- (id)_supportedMediaKindsDatabasePropertyValue
{
  v2 = [(JaliscoMediaImporter *)self mediaFilter];
  v3 = [v2 supportedMediaKinds];
  v4 = [v3 componentsJoinedByString:@","];

  return v4;
}

- (BOOL)needsUpdateForTokens
{
  v3 = [(JaliscoImporter *)self musicLibrary];
  unsigned int v4 = [v3 jaliscoNeedsUpdateForTokens];

  if (v4)
  {
    v5 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ - JaliscoNeedsUpdateForTokens is YES, forcing a full token refresh.", (uint8_t *)&v11, 0xCu);
    }
    BOOL v6 = 1;
  }
  else
  {
    id v7 = [(JaliscoImporter *)self musicLibrary];
    v5 = [v7 jaliscoLastSupportedMediaKinds];

    v8 = [(JaliscoMediaImporter *)self _supportedMediaKindsDatabasePropertyValue];
    if (v5 && ([v5 isEqualToString:v8] & 1) != 0)
    {
      BOOL v6 = 0;
    }
    else
    {
      v9 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138543874;
        v12 = self;
        __int16 v13 = 2114;
        v14 = v5;
        __int16 v15 = 2114;
        v16 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@ - Supported media kinds are different, forcing a full token refresh. lastSupportedMediaKinds=%{public}@, currentSupportedMediaKinds=%{public}@", (uint8_t *)&v11, 0x20u);
      }

      BOOL v6 = 1;
    }
  }
  return v6;
}

- (id)_importTracksFromRevision:(unsigned int)a3 toRevision:(unsigned int)a4 withItemsResponse:(id)a5 clientIdentity:(id)a6 itemsFiles:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v11 = a5;
  id v56 = a6;
  id v57 = a7;
  v55 = v11;
  if (!v11)
  {
    id v14 = 0;
    goto LABEL_31;
  }
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = sub_1000F0810;
  v80 = sub_1000F0820;
  id v81 = 0;
  v12 = [(JaliscoImporter *)self connection];
  v54 = [v12 userIdentity];

  id v59 = objc_alloc_init((Class)NSMutableDictionary);
  [(JaliscoImporter *)self setProgress:0.0];
  if ([v57 count])
  {
    id v13 = v57;
  }
  else
  {
    __int16 v15 = [v11 responseDataFileURL];
    v87 = v15;
    id v13 = +[NSArray arrayWithObjects:&v87 count:1];
  }
  sub_1000D59EC(4, v10, v9, v13, 0, 0, 0);
  v16 = [(JaliscoImporter *)self musicLibrary];
  v52 = [v16 databasePath];

  v17 = [(JaliscoImporter *)self musicLibrary];
  id v18 = objc_msgSend(v17, "icd_preferredVideoQuality");

  v19 = +[ICUserIdentityStore defaultIdentityStore];
  id v75 = 0;
  v51 = [v19 getPropertiesForUserIdentity:v54 error:&v75];
  id v53 = v75;

  if (v53)
  {
    v20 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(v53, "msv_description");
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v54;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to load properties for identity %{public}@ error=%{public}@", buf, 0x16u);
    }
  }
  v22 = objc_msgSend(v13, "msv_map:", &stru_1001BDAF0);
  v50 = ML3DatabaseImportDataForDAAPFilePaths();
  id v23 = [objc_alloc((Class)ML3MutableDatabaseImport) initWithLibraryPath:v52 trackData:v50 playlistData:0 clientIdentity:v56];
  [v23 setPreferredVideoQuality:v18];
  v24 = [v51 DSID];
  objc_msgSend(v23, "setStoreAccountID:", objc_msgSend(v24, "longLongValue"));
  v49 = v23;

  objc_initWeak(&location, self);
  if (!v10)
  {
    uint64_t v86 = objc_opt_class();
    v25 = +[NSArray arrayWithObjects:&v86 count:1];
    v26 = [(JaliscoImporter *)self configuration];
    +[CloudKeepLocalUtilities downPinCollectionsForClasses:v25 configuration:v26];
  }
  dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
  v28 = +[MLMediaLibraryService sharedMediaLibraryService];
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472;
  v72[2] = sub_1000F0828;
  v72[3] = &unk_1001BDB18;
  objc_copyWeak(&v73, &location);
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_1000F0884;
  v68[3] = &unk_1001BDB40;
  objc_copyWeak(&v71, &location);
  v68[4] = self;
  v70 = &v76;
  dispatch_semaphore_t dsema = v27;
  dispatch_semaphore_t v69 = dsema;
  [v28 performImport:v49 fromSource:1 withProgressBlock:v72 completionHandler:v68];

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  if (!v10)
  {
    uint64_t v85 = objc_opt_class();
    v29 = +[NSArray arrayWithObjects:&v85 count:1];
    v30 = [(JaliscoImporter *)self configuration];
    +[CloudKeepLocalUtilities rePinCollectionsForClasses:v29 configuration:v30];
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v84 = 0;
  [(JaliscoImporter *)self setProgress:COERCE_DOUBLE(COERCE_UNSIGNED_INT(1.0) | 0x2000000000)];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v13;
  id v31 = [obj countByEnumeratingWithState:&v64 objects:v82 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v65;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v65 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = *(void *)(*((void *)&v64 + 1) + 8 * i);
        v36 = +[NSData dataWithContentsOfURL:v34 options:1 error:0];
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_1000F09E4;
        v61[3] = &unk_1001BDB68;
        v61[4] = self;
        v63 = buf;
        id v62 = v59;
        +[ICDResponseDataParser enumerateItemsInResponseData:v36 usingHandler:v61];
      }
      id v31 = [obj countByEnumeratingWithState:&v64 objects:v82 count:16];
    }
    while (v31);
  }

  if (!v77[5] && [v59 count])
  {
    v37 = +[ICDeviceInfo currentDeviceInfo];
    if (([(JaliscoLoadChapterArtworkOperation *)v37 isAppleTV] & 1) == 0)
    {
      unsigned __int8 v38 = [(JaliscoImporter *)self isCancelled];

      if (v38) {
        goto LABEL_27;
      }
      v39 = [JaliscoLoadChapterArtworkOperation alloc];
      v40 = [(JaliscoImporter *)self configuration];
      v37 = [(JaliscoLoadChapterArtworkOperation *)v39 initWithConfiguration:v40 clientIdentity:v56 dictionary:v59];

      v41 = [(JaliscoImporter *)self configuration];
      v42 = +[BaseRequestHandler handlerForConfiguration:v41];
      [v42 addOperation:v37 forLibraryType:0 priority:2];
    }
  }
LABEL_27:
  if (!v77[5] && *(unsigned char *)(*(void *)&buf[8] + 24))
  {
    v43 = +[NSNotificationCenter defaultCenter];
    v44 = [(JaliscoImporter *)self musicLibrary];
    v45 = [v44 libraryUID];
    [v43 postNotificationName:@"ICDPlaybackPositionImportRequiresSyncNotification" object:v45];
  }
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&v71);
  objc_destroyWeak(&v73);

  objc_destroyWeak(&location);
  id v14 = (id)v77[5];
  _Block_object_dispose(&v76, 8);

LABEL_31:

  return v14;
}

- (id)_chapterArtworkURLsForData:(id)a3 baseURL:(id)a4
{
  id v5 = a3;
  id v27 = a4;
  id v28 = +[NSMutableDictionary dictionary];
  BOOL v6 = [v5 objectForKeyedSubscript:@"chapters"];
  id v7 = [v6 objectForKeyedSubscript:@"chapter-list"];

  v25 = v5;
  v8 = [v5 objectForKeyedSubscript:@"chapters"];
  uint64_t v9 = [v8 objectForKeyedSubscript:@"nominal-image-resolutions"];
  uint64_t v10 = [v9 lastObject];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v7;
  id v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(obj);
        }
        __int16 v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v16 = [v15 objectForKeyedSubscript:@"images"];
        v17 = [v16 objectForKeyedSubscript:v10];
        id v18 = [v17 objectForKeyedSubscript:@"url"];

        if ([v18 length])
        {
          v19 = [v15 objectForKey:@"start"];
          [v19 floatValue];
          uint64_t v21 = (float)(v20 * 1000.0);

          v22 = [v27 URLByAppendingPathComponent:v18 isDirectory:0];
          id v23 = +[NSNumber numberWithUnsignedInt:v21];
          [v28 setObject:v22 forKey:v23];
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v12);
  }

  return v28;
}

- (id)_chapterDataFromURL:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSDictionary);
  id v5 = +[NSURL URLWithString:v3];

  id v6 = [v4 initWithContentsOfURL:v5];

  return v6;
}

- (id)updateLibraryFromRevision:(unsigned int)a3 toRevision:(unsigned int)a4 withResponse:(id)a5 clientIdentity:(id)a6 itemsFiles:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if ([v12 responseCode] == (id)200) {
    [(JaliscoMediaImporter *)self _importTracksFromRevision:v10 toRevision:v9 withItemsResponse:v12 clientIdentity:v13 itemsFiles:v14];
  }
  else {
  __int16 v15 = +[NSError errorWithDomain:@"JaliscoImporterErrorDomain" code:-1 userInfo:0];
  }

  return v15;
}

- (void)clearNeedsUpdateForTokens
{
  id v2 = [(JaliscoImporter *)self musicLibrary];
  [v2 setJaliscoNeedsUpdateForTokens:0];
}

- (id)supportedMediaKinds
{
  supportedMediaKinds = self->_supportedMediaKinds;
  if (!supportedMediaKinds)
  {
    id v4 = [(JaliscoMediaImporter *)self mediaFilter];
    id v5 = [v4 supportedMediaKinds];
    id v6 = self->_supportedMediaKinds;
    self->_supportedMediaKinds = v5;

    supportedMediaKinds = self->_supportedMediaKinds;
  }

  return supportedMediaKinds;
}

- (id)metadataKeys
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", @"dmap.longitemid", @"daap.songalbumartist", @"daap.songalbum", @"daap.songalbumuserrating", @"daap.songartist", @"daap.songcomment", @"daap.songcompilation", @"daap.songcomposer", @"daap.songcontentrating", @"daap.songdateadded", @"daap.songdatemodified", @"daap.songdatepurchased", @"daap.songdateplayed", @"daap.songdatereleased", @"daap.songdisabled", @"daap.songdisccount", @"daap.songdiscnumber",
           @"daap.songexcludefromshuffle",
           @"daap.songgenre",
           @"daap.songgrouping",
           @"daap.songlastskipdate",
           @"daap.sortalbumartist",
           @"daap.sortalbum",
           @"daap.sortartist",
           @"daap.sortcomposer",
           @"daap.sortname",
           @"daap.songstarttime",
           @"daap.songstoptime",
           @"daap.songtrackcount",
           @"daap.songtracknumber",
           @"daap.songyear",
           @"daap.songuserplaycount",
           @"daap.songuserrating",
           @"daap.songalbumuserrating",
           @"daap.songuserskipcount",
           @"dmap.itemavailable",
           @"dmap.itemhidden",
           @"dmap.itemname",
           @"com.apple.itunes.store.episode-screenshot",
           @"com.apple.itunes.cloud-artwork-url",
           @"com.apple.itunes.cloud-artwork-token",
           @"com.apple.itunes.cloud-purchased-token",
           @"com.apple.itunes.content-rating",
           @"com.apple.itunes.item-flavor-listing",
           @"com.apple.itunes.item-flavor",
           @"com.apple.itunes.itms-artistid",
           @"com.apple.itunes.itms-composerid",
           @"com.apple.itunes.itms-genreid",
           @"com.apple.itunes.itms-playlistid",
           @"com.apple.itunes.itms-songid",
           @"com.apple.itunes.itms-storefrontid",
           @"com.apple.itunes.extended-media-kind",
           @"daap.songcodectype",
           @"daap.songcodecsubtype",
           @"daap.songbitrate",
           @"daap.songbeatsperminute",
           @"daap.songsamplerate",
           @"daap.songformat",
           @"daap.songsize",
           @"daap.songlongsize",
           @"daap.songtime");
}

- (id)purchaseTokens
{
  if ([(JaliscoMediaImporter *)self onDiskRevision])
  {
    id v3 = [(JaliscoImporter *)self connection];
    id v4 = [v3 userIdentity];
    id v5 = +[ML3MusicLibrary musicLibraryForUserAccount:v4];

    id v6 = v5;
    v22 = +[NSMutableDictionary dictionary];
    id v7 = (void *)ML3TrackPropertyPurchaseHistoryID;
    v8 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyPurchaseHistoryID value:&off_1001CC350 comparison:2];
    uint64_t v9 = ML3TrackPropertyStoreAccountID;
    uint64_t v10 = [v6 jaliscoAccountID];
    id v11 = +[ML3ComparisonPredicate predicateWithProperty:v9 value:v10 comparison:1];
    v28[0] = v11;
    id v12 = +[ML3ComparisonPredicate predicateWithProperty:v9 value:&off_1001CC350 comparison:1];
    v28[1] = v12;
    id v13 = +[NSArray arrayWithObjects:v28 count:2];
    id v14 = +[ML3AnyCompoundPredicate predicateMatchingPredicates:v13];

    v27[0] = v8;
    v27[1] = v14;
    __int16 v15 = +[NSArray arrayWithObjects:v27 count:2];
    v16 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v15];

    v17 = +[ML3Track queryWithLibrary:v6 predicate:v16];
    [v17 setIgnoreSystemFilterPredicates:1];
    v26[0] = v7;
    v26[1] = ML3TrackPropertyPurchaseHistoryToken;
    id v18 = +[NSArray arrayWithObjects:v26 count:2];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000F1D94;
    v24[3] = &unk_1001BEF58;
    id v19 = v22;
    id v25 = v19;
    [v17 enumeratePersistentIDsAndProperties:v18 usingBlock:v24];

    for (uint64_t i = 1; i != -1; --i)
  }
  else
  {
    id v19 = &__NSDictionary0__struct;
  }

  return v19;
}

- (id)queryFilter
{
  id v2 = [(JaliscoMediaImporter *)self mediaFilter];
  id v3 = [v2 daapQueryFilterString];

  return v3;
}

- (BOOL)includePreorders
{
  return 1;
}

- (unsigned)onDiskRevision
{
  id v2 = [(JaliscoImporter *)self musicLibrary];
  unsigned int v3 = [v2 jaliscoOnDiskDatabaseRevision];

  return v3;
}

- (void)cancel
{
  v7.receiver = self;
  v7.super_class = (Class)JaliscoMediaImporter;
  [(JaliscoImporter *)&v7 cancel];
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  unsigned int v3 = +[MLMediaLibraryService sharedMediaLibraryService];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F1FA4;
  v5[3] = &unk_1001BDE80;
  dispatch_semaphore_t v6 = v2;
  id v4 = v2;
  [v3 cancelImportOperation:1 completionHandler:v5];

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

+ (id)oversizeLogCategory
{
  os_log_t v2 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync_Oversize");

  return v2;
}

+ (id)logCategory
{
  os_log_t v2 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");

  return v2;
}

@end