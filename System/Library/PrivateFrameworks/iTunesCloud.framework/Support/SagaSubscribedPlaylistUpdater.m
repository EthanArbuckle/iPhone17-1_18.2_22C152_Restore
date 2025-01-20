@interface SagaSubscribedPlaylistUpdater
- (BOOL)ignoreMinRefreshInterval;
- (BOOL)performUpdateWithClientIdentity:(id)a3 error:(id *)a4;
- (BOOL)pinnedOnly;
- (CloudLibraryConnection)connection;
- (NSArray)playlistCloudIDs;
- (NSURL)payloadDownloadPathOverride;
- (SagaSubscribedPlaylistUpdater)initWithSubscribedPlaylistCloudIDs:(id)a3 cloudLibraryConnection:(id)a4;
- (int64_t)requestReason;
- (void)setIgnoreMinRefreshInterval:(BOOL)a3;
- (void)setPayloadDownloadPathOverride:(id)a3;
- (void)setPinnedOnly:(BOOL)a3;
- (void)setRequestReason:(int64_t)a3;
@end

@implementation SagaSubscribedPlaylistUpdater

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDownloadPathOverride, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_playlistCloudIDs, 0);
}

- (void)setPinnedOnly:(BOOL)a3
{
  self->_pinnedOnly = a3;
}

- (BOOL)pinnedOnly
{
  return self->_pinnedOnly;
}

- (void)setPayloadDownloadPathOverride:(id)a3
{
}

- (NSURL)payloadDownloadPathOverride
{
  return self->_payloadDownloadPathOverride;
}

- (void)setIgnoreMinRefreshInterval:(BOOL)a3
{
  self->_ignoreMinRefreshInterval = a3;
}

- (BOOL)ignoreMinRefreshInterval
{
  return self->_ignoreMinRefreshInterval;
}

- (void)setRequestReason:(int64_t)a3
{
  self->_requestReason = a3;
}

- (int64_t)requestReason
{
  return self->_requestReason;
}

- (CloudLibraryConnection)connection
{
  return self->_connection;
}

- (NSArray)playlistCloudIDs
{
  return self->_playlistCloudIDs;
}

- (BOOL)performUpdateWithClientIdentity:(id)a3 error:(id *)a4
{
  id v88 = a3;
  v94 = self;
  v5 = [(SagaSubscribedPlaylistUpdater *)self connection];
  v6 = [v5 userIdentity];
  v90 = +[ML3MusicLibrary musicLibraryForUserAccount:v6];

  [v90 setClientIdentity:v88];
  v92 = +[NSMutableArray arrayWithCapacity:2];
  if (v94->_playlistCloudIDs)
  {
    v7 = +[NSSet setWithArray:](NSSet, "setWithArray:");
    v8 = +[ML3ContainmentPredicate predicateWithProperty:ML3ContainerPropertyStoreCloudID values:v7];
    [v92 addObject:v8];
  }
  else
  {
    v9 = +[ML3PropertyPredicate predicateWithProperty:ML3ContainerPropertyCloudIsSubscribed];
    v121[0] = v9;
    v10 = +[ML3PropertyPredicate predicateWithProperty:ML3ContainerPropertyCloudIsCuratorPlaylist];
    v121[1] = v10;
    v11 = +[NSArray arrayWithObjects:v121 count:2];
    v12 = +[ML3AnyCompoundPredicate predicateMatchingPredicates:v11];

    [v92 addObject:v12];
  }
  if (v94->_pinnedOnly)
  {
    v13 = +[ML3ComparisonPredicate predicateWithProperty:ML3EntityPropertyKeepLocal value:&off_1001CBC48 comparison:3];
    [v92 addObject:v13];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  uint64_t v15 = v14;
  v16 = +[NSMutableArray array];
  if ([v92 count] == (id)1) {
    [v92 firstObject];
  }
  else {
  v86 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v92];
  }
  v85 = +[ML3Container unrestrictedAllItemsQueryWithlibrary:v90 predicate:v86 orderingTerms:&__NSArray0__struct];
  v120[0] = ML3ContainerPropertyStoreCloudID;
  v120[1] = ML3ContainerPropertyCloudMinRefreshInterval;
  v120[2] = ML3ContainerPropertyCloudLastUpdateTime;
  v17 = +[NSArray arrayWithObjects:v120 count:3];
  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472;
  v108[2] = sub_10003FCAC;
  v108[3] = &unk_1001BA408;
  v108[4] = v94;
  uint64_t v110 = v15;
  id v89 = v16;
  id v109 = v89;
  [v85 enumeratePersistentIDsAndProperties:v17 usingBlock:v108];

  v18 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v89 count];
    *(_DWORD *)buf = 134217984;
    id v123 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Found %lu subscribed playlists to update for periodic poll.", buf, 0xCu);
  }

  v20 = (NSArray *)[v89 copy];
  playlistCloudIDs = v94->_playlistCloudIDs;
  v94->_playlistCloudIDs = v20;

  if ([(NSArray *)v94->_playlistCloudIDs count])
  {
    v87 = +[ICSubscribedContainersRequest requestWithDatabaseID:[(CloudLibraryConnection *)v94->_connection databaseID] containerIDs:v94->_playlistCloudIDs];
    [v87 setReason:[(SagaSubscribedPlaylistUpdater *)v94 requestReason]];
    uint64_t v22 = [(SagaSubscribedPlaylistUpdater *)v94 payloadDownloadPathOverride];
    if (!v22)
    {
      v23 = NSTemporaryDirectory();
      v119[0] = v23;
      v119[1] = @"com.apple.MediaServices";
      v24 = +[NSUUID UUID];
      v25 = [v24 UUIDString];
      v119[2] = v25;
      v119[3] = @"subscribed-containers.daap";
      v26 = +[NSArray arrayWithObjects:v119 count:4];
      uint64_t v27 = +[NSURL fileURLWithPathComponents:v26];

      uint64_t v22 = v27;
    }
    v84 = (void *)v22;
    -[NSObject setResponseDataDestinationFileURL:](v87, "setResponseDataDestinationFileURL:");
    uint64_t v102 = 0;
    v103 = &v102;
    uint64_t v104 = 0x3032000000;
    v105 = sub_10003FDFC;
    v106 = sub_10003FE0C;
    id v107 = 0;
    dispatch_semaphore_t v28 = dispatch_semaphore_create(0);
    connection = v94->_connection;
    v99[0] = _NSConcreteStackBlock;
    v99[1] = 3221225472;
    v99[2] = sub_10003FE14;
    v99[3] = &unk_1001BEF30;
    v101 = &v102;
    v30 = v28;
    v100 = v30;
    [(CloudLibraryConnection *)connection sendRequest:v87 withResponseHandler:v99];
    v82 = v30;
    dispatch_semaphore_wait(v30, 0xFFFFFFFFFFFFFFFFLL);
    id v31 = [(id)v103[5] responseCode];
    if (v31 == (id)200)
    {
      v118 = v84;
      id v93 = +[NSArray arrayWithObjects:&v118 count:1];
      if (MSVDeviceOSIsInternalInstall())
      {
        id v91 = objc_alloc_init((Class)NSFileManager);
        v32 = MSVMediaLoggingDirectory();
        v125[0] = v32;
        v125[1] = @"DaapDebugging";
        v125[2] = @"SubscribedPlaylists";
        v33 = +[NSArray arrayWithObjects:v125 count:3];
        v81 = +[NSURL fileURLWithPathComponents:v33];

        v95 = +[NSMutableDictionary dictionary];
        v124[0] = NSURLIsDirectoryKey;
        v124[1] = NSURLCreationDateKey;
        v34 = +[NSArray arrayWithObjects:v124 count:2];
        v35 = [v91 enumeratorAtURL:v81 includingPropertiesForKeys:v34 options:4 errorHandler:0];

        long long v115 = 0u;
        long long v116 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        id obj = v35;
        v36 = 0;
        id v37 = [obj countByEnumeratingWithState:&v113 objects:buf count:16];
        if (v37)
        {
          uint64_t v38 = *(void *)v114;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(void *)v114 != v38) {
                objc_enumerationMutation(obj);
              }
              v40 = *(void **)(*((void *)&v113 + 1) + 8 * i);
              id v112 = 0;
              unsigned int v41 = [v40 getResourceValue:&v112 forKey:NSURLIsDirectoryKey error:0];
              id v42 = v112;
              v43 = v42;
              if (v41 && [v42 BOOLValue])
              {
                v44 = [v40 lastPathComponent];
                v45 = [v44 componentsSeparatedByString:@"_"];
                v46 = [v45 lastObject];
                v47 = (char *)[v46 longLongValue];

                if ((uint64_t)v36 <= (uint64_t)v47) {
                  v36 = v47;
                }
                id v111 = 0;
                unsigned __int8 v48 = [v40 getResourceValue:&v111 forKey:NSURLCreationDateKey error:0];
                id v49 = v111;
                if ((v48 & 1) == 0)
                {
                  uint64_t v50 = +[NSDate distantPast];

                  id v49 = (id)v50;
                }
                [v95 setObject:v40 forKey:v49];
              }
            }
            id v37 = [obj countByEnumeratingWithState:&v113 objects:buf count:16];
          }
          while (v37);
        }

        if ((unint64_t)[v95 count] >= 4)
        {
          v51 = [v95 allKeys];
          v52 = [v51 sortedArrayUsingComparator:&stru_1001BD200];

          if ([v52 count] != (id)3)
          {
            v53 = 0;
            do
            {
              v54 = [v52 objectAtIndex:v53];
              v55 = [v95 objectForKey:v54];

              [v91 removeItemAtURL:v55 error:0];
              ++v53;
            }
            while (v53 < (char *)[v52 count] - 3);
          }
        }
        v56 = +[NSString stringWithFormat:@"SubscribedContainersResponse_%llu", v36 + 1];
        v57 = [v81 URLByAppendingPathComponent:v56 isDirectory:1];

        [v91 createDirectoryAtURL:v57 withIntermediateDirectories:1 attributes:0 error:0];
        if ([v93 count])
        {
          unint64_t v58 = 0;
          do
          {
            v59 = [v93 objectAtIndex:v58];
            v60 = +[NSString stringWithFormat:@"daap_data_%lu.daap", ++v58];
            v61 = [v57 URLByAppendingPathComponent:v60 isDirectory:0];

            [v91 copyItemAtURL:v59 toURL:v61 error:0];
          }
          while (v58 < (unint64_t)[v93 count]);
        }
      }
      v62 = [v84 path];
      v117 = v62;
      v63 = +[NSArray arrayWithObjects:&v117 count:1];
      v64 = ML3DatabaseImportDataForDAAPFilePaths();

      id v65 = objc_alloc((Class)ML3MutableDatabaseImport);
      v66 = [v90 databasePath];
      id v67 = [v65 initWithLibraryPath:v66 trackData:v64 playlistData:v64 clientIdentity:v88];

      [v67 setTracksAreLibraryOwnedContent:0];
      [v67 setPlaylistsAreLibraryOwnedContent:1];
      dispatch_semaphore_t v68 = dispatch_semaphore_create(0);
      v69 = +[MLMediaLibraryService sharedMediaLibraryService];
      v97[0] = _NSConcreteStackBlock;
      v97[1] = 3221225472;
      v97[2] = sub_10003FE74;
      v97[3] = &unk_1001BA430;
      v70 = v68;
      v98 = v70;
      [v69 performImport:v67 fromSource:8 withProgressBlock:0 completionHandler:v97];

      dispatch_semaphore_wait(v70, 0xFFFFFFFFFFFFFFFFLL);
      v71 = +[NSInputStream inputStreamWithURL:v84];
      id v72 = [objc_alloc((Class)DKDAAPParser) initWithStream:v71];
      v73 = objc_alloc_init(SubscribedContainersUpdateRequiredParserDelegate);
      [v72 setDelegate:v73];
      [v72 parse];
      unsigned int v74 = [(SubscribedContainersUpdateRequiredParserDelegate *)v73 updateRequired];

      if (v74)
      {
        v75 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Requesting library update because the response contained update-required flag", buf, 2u);
        }

        v76 = [(SagaSubscribedPlaylistUpdater *)v94 connection];
        v77 = [v76 configuration];
        v78 = +[BaseRequestHandler handlerForConfiguration:v77];
        [v78 updateSagaLibraryWithClientIdentity:v88 forReason:8 allowNoisyAuthPrompt:0 isExplicitUserAction:0 completionHandler:0];
      }
    }
    else
    {
      v64 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        id v123 = v31;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "Received non-200 HTTP code: %lu, skipping import.", buf, 0xCu);
      }
    }

    _Block_object_dispose(&v102, 8);
    v79 = v87;
  }
  else
  {
    v79 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "No playlists to update (based on min refresh interval).", buf, 2u);
    }
  }

  if (a4) {
    *a4 = 0;
  }

  return 1;
}

- (SagaSubscribedPlaylistUpdater)initWithSubscribedPlaylistCloudIDs:(id)a3 cloudLibraryConnection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SagaSubscribedPlaylistUpdater;
  v9 = [(SagaSubscribedPlaylistUpdater *)&v14 init];
  if (v9)
  {
    if (!v8)
    {
      v13 = +[NSAssertionHandler currentHandler];
      [v13 handleFailureInMethod:a2, v9, @"SagaSubscribedPlaylistUpdater.m", 39, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
    }
    v10 = (NSArray *)[v7 copy];
    playlistCloudIDs = v9->_playlistCloudIDs;
    v9->_playlistCloudIDs = v10;

    objc_storeStrong((id *)&v9->_connection, a4);
  }

  return v9;
}

@end