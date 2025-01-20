@interface MTMediaLibraryUpdater
+ (id)numberFormatter;
+ (id)sharedInstance;
- (BOOL)haveMediaLibraryPropertiesChangedForEpisode:(id)a3;
- (MTMediaLibraryUpdater)init;
- (NSMutableArray)didUpdateCompletionBlocks;
- (NSMutableDictionary)episodeCache;
- (NSObject)observerLock;
- (OS_dispatch_source)updateDatabaseDispatchSource;
- (id)_findOrAddPodcastForMediaItem:(id)a3 updaterCache:(id)a4;
- (id)noteObserver;
- (id)propertiesForMediaLibrary;
- (unint64_t)importPlaylist:(id)a3 intoContext:(id)a4 mediaLibraryCache:(id)a5 knownPlaylistIds:(id)a6;
- (void)_addEpisodeInCtx:(id)a3 mediaItem:(id)a4 episodeCache:(id)a5 podcastUuid:(id)a6 isRestoreDownloadCandidate:(BOOL)a7 canSendNotifications:(BOOL)a8 outEpisodeUUID:(id *)a9;
- (void)_printMediaItemPropertiesForItem:(id)a3;
- (void)_updateDatabaseFromMediaLibrary;
- (void)doLibraryUpdateFromNotification;
- (void)forceUpdateDatabaseFromMediaLibraryWithCompletion:(id)a3;
- (void)importPlaylists:(id)a3 knownPlaylistIds:(id)a4 mediaLibraryCache:(id)a5 playlists:(id)a6;
- (void)libraryDidChange:(id)a3;
- (void)setDidUpdateCompletionBlocks:(id)a3;
- (void)setEpisodeCache:(id)a3;
- (void)setNoteObserver:(id)a3;
- (void)setObserverLock:(id)a3;
- (void)setUpdateDatabaseDispatchSource:(id)a3;
- (void)startObservingMediaLibrary;
- (void)stopObservingMediaLibrary;
- (void)updateMediaLibraryFromNotification:(id)a3;
@end

@implementation MTMediaLibraryUpdater

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000748EC;
  block[3] = &unk_10054D910;
  block[4] = a1;
  if (qword_10060A670 != -1) {
    dispatch_once(&qword_10060A670, block);
  }
  v2 = (void *)qword_10060A668;

  return v2;
}

- (MTMediaLibraryUpdater)init
{
  if (+[MTApplication localLibraryUpdatesDisabled])
  {
    v3 = 0;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)MTMediaLibraryUpdater;
    id v4 = [(MTMediaLibraryUpdater *)&v20 init];
    if (v4)
    {
      uint64_t v5 = +[NSMutableArray array];
      v6 = (void *)*((void *)v4 + 2);
      *((void *)v4 + 2) = v5;

      v7 = dispatch_get_global_queue(0, 0);
      dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_add, 0, 0, v7);
      v9 = (void *)*((void *)v4 + 3);
      *((void *)v4 + 3) = v8;

      v10 = *((void *)v4 + 3);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100074AC0;
      handler[3] = &unk_10054D570;
      v11 = v4;
      id v19 = v11;
      dispatch_source_set_event_handler(v10, handler);
      dispatch_resume(*((dispatch_object_t *)v4 + 3));
      id v12 = objc_alloc_init((Class)NSObject);
      v13 = (void *)v11[4];
      v11[4] = v12;

      uint64_t v14 = +[NSMutableDictionary dictionary];
      v15 = (void *)v11[5];
      v11[5] = v14;

      v16 = +[MTDB sharedInstance];
      [v16 addChangeNotifier:v11];
    }
    self = (MTMediaLibraryUpdater *)v4;
    v3 = self;
  }

  return v3;
}

- (void)_updateDatabaseFromMediaLibrary
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(MTMediaLibraryUpdater *)v2 didUpdateCompletionBlocks];
  id v61 = [v3 copy];

  id v4 = [(MTMediaLibraryUpdater *)v2 didUpdateCompletionBlocks];
  [v4 removeAllObjects];

  objc_sync_exit(v2);
  v58 = v2;

  uint64_t v5 = +[MPMediaLibrary defaultMediaLibrary];
  v6 = [v5 lastModifiedDate];
  [v6 timeIntervalSinceReferenceDate];
  double v8 = v7;

  v9 = +[MPMediaQuery mt_allItemsForPodcastsApp];
  v10 = +[MTMediaLibraryRestorePostflightUtil downloadCandidateMediaItems];
  v59 = [v10 mt_compactMap:&stru_10054E530];
  v11 = +[NSUserDefaults standardUserDefaults];
  uint64_t v12 = kMTHasImportedMediaLibrary;
  unsigned int v13 = [v11 BOOLForKey:kMTHasImportedMediaLibrary];

  uint64_t v14 = _MTLogCategoryMediaLibrary();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = v13;
    LOWORD(v88) = 2112;
    *(void *)((char *)&v88 + 2) = v59;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "update-from-MusicLibrary started. hasUpdated = %d, postflightPIDs = %@", buf, 0x12u);
  }

  if ((v13 & 1) == 0)
  {
    if ([v10 count])
    {
      v82[0] = _NSConcreteStackBlock;
      v82[1] = 3221225472;
      v82[2] = sub_1000753DC;
      v82[3] = &unk_10054E558;
      id v83 = v9;
      id v15 = v9;
      v16 = [v10 objectsPassingTest:v82];
      v17 = [v16 allObjects];
      v9 = [v15 arrayByAddingObjectsFromArray:v17];
    }
    uint64_t v18 = [v9 sortedArrayUsingComparator:&stru_10054E598];

    id v19 = +[NSUserDefaults standardUserDefaults];
    [v19 setBool:1 forKey:v12];

    v9 = (void *)v18;
  }
  objc_super v20 = objc_opt_new();
  v21 = +[MTDB sharedInstance];
  v22 = [v21 importContext];

  v23 = +[MTEpisode predicateForDownloaded:1 excludeHidden:0];
  v24 = +[MTEpisodeUpdaterCache episodeCacheWithPredicate:v23 inCtx:v22];

  *(void *)buf = 0;
  *(void *)&long long v88 = buf;
  *((void *)&v88 + 1) = 0x3032000000;
  v89 = sub_100056E70;
  v90 = sub_100057210;
  id v91 = 0;
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_10007549C;
  v79[3] = &unk_10054E2A8;
  v81 = buf;
  id v25 = v22;
  id v80 = v25;
  [v25 performBlockAndWait:v79];
  v26 = [MTEntityUpdaterCache alloc];
  v27 = +[MTPodcast predicateForNotHiddenPodcasts];
  v86[0] = kPodcastFeedUrl;
  v86[1] = kPodcastUpdatedFeedUrl;
  v86[2] = kPodcastTitle;
  v28 = +[NSArray arrayWithObjects:v86 count:3];
  uint64_t v85 = kPodcastUuid;
  v29 = +[NSArray arrayWithObjects:&v85 count:1];
  v30 = [(MTEntityUpdaterCache *)v26 initWithPredicate:v27 entityName:kMTPodcastEntityName ctx:v25 properties:v28 fetchProperties:v29];

  v31 = +[NSMutableDictionary dictionary];
  v32 = +[NSMutableArray array];
  LOBYTE(v28) = +[PFNotificationSettings canSendNotification];
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_100075584;
  v67[3] = &unk_10054E5C0;
  id v51 = v9;
  id v68 = v51;
  id v52 = v10;
  id v69 = v52;
  id v57 = v20;
  id v70 = v57;
  v71 = v2;
  v55 = v30;
  v72 = v55;
  id v73 = v25;
  id v54 = v24;
  id v74 = v54;
  char v78 = (char)v28;
  id v56 = v31;
  id v75 = v56;
  id v33 = v32;
  id v76 = v33;
  id v53 = v59;
  id v77 = v53;
  id v60 = v73;
  [v73 performBlockAndWaitWithSave:v67];
  v34 = +[MTMediaContentSourceiOSMusicLibrary sharedInstance];
  LOBYTE(v25) = [v34 iTunesMatchEnabled];

  if ((v25 & 1) == 0)
  {
    v50 = +[MPMediaQuery mt_podcastsQuery];
    v35 = [v50 collections];
    id v36 = objc_alloc_init((Class)NSMutableArray);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v37 = v35;
    v38 = 0;
    id v39 = [v37 countByEnumeratingWithState:&v63 objects:v84 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v64;
      uint64_t v41 = MPMediaPlaylistPropertyIsITunesSynced;
      do
      {
        for (i = 0; i != v39; i = (char *)i + 1)
        {
          if (*(void *)v64 != v40) {
            objc_enumerationMutation(v37);
          }
          v43 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          v44 = [v43 valueForProperty:v41];

          v38 = v44;
          if ([v44 BOOLValue]) {
            [v36 addObject:v43];
          }
        }
        id v39 = [v37 countByEnumeratingWithState:&v63 objects:v84 count:16];
      }
      while (v39);
    }

    v45 = [*(id *)(v88 + 40) valueForKey:kPlaylistMediaLibraryId];
    v46 = +[NSMutableSet setWithArray:v45];

    [(MTMediaLibraryUpdater *)v58 importPlaylists:v60 knownPlaylistIds:v46 mediaLibraryCache:v57 playlists:v36];
  }
  if ([v33 count]) {
    +[MTMediaLibraryUtil deleteMediaItems:v33 completion:0];
  }
  v47 = +[NSUserDefaults standardUserDefaults];
  [v47 setDouble:@"MTMediaLibraryLastUpdate" forKey:v8];

  v48 = +[PUIMediaLibraryStorageController shared];
  [v48 mediaLibraryDidChange];

  [v61 enumerateObjectsUsingBlock:&stru_10054E600];
  v49 = _MTLogCategoryMediaLibrary();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v62 = 0;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "update-from-MusicLibrary finished.", v62, 2u);
  }

  _Block_object_dispose(buf, 8);
}

- (void)forceUpdateDatabaseFromMediaLibraryWithCompletion:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    id v4 = self;
    objc_sync_enter(v4);
    uint64_t v5 = [(MTMediaLibraryUpdater *)v4 didUpdateCompletionBlocks];
    id v6 = objc_retainBlock(v7);
    [v5 addObject:v6];

    objc_sync_exit(v4);
  }
  dispatch_source_merge_data((dispatch_source_t)self->_updateDatabaseDispatchSource, 1uLL);
}

- (void)startObservingMediaLibrary
{
  v3 = +[MTMediaLibraryTransactionManager sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100075F54;
  v4[3] = &unk_10054D570;
  v4[4] = self;
  [v3 beginGeneratingLibraryChangeNotifications:v4];
}

- (void)stopObservingMediaLibrary
{
  v3 = +[MTMediaLibraryTransactionManager sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000761D8;
  v4[3] = &unk_10054D570;
  v4[4] = self;
  [v3 endGeneratingLibraryChangeNotifications:v4];
}

- (unint64_t)importPlaylist:(id)a3 intoContext:(id)a4 mediaLibraryCache:(id)a5 knownPlaylistIds:(id)a6
{
  id v9 = a3;
  id v33 = a4;
  id v37 = a5;
  id v34 = a6;
  id v36 = objc_opt_new();
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v35 = v9;
  v10 = [v9 playlist];
  v11 = [v10 items];

  id v12 = [v11 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v56;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v56 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = [*(id *)(*((void *)&v55 + 1) + 8 * i) valueForProperty:MPMediaEntityPropertyPersistentID];
        v16 = [v37 objectForKey:v15];
        v17 = v16;
        if (v16)
        {
          uint64_t v18 = [v16 assetUrl];
          BOOL v19 = [v18 length] == 0;

          if (!v19)
          {
            objc_super v20 = [v17 assetUrl];
            [v36 addObject:v20];
            v21 = _MTLogCategoryMediaLibrary();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              v22 = [v17 title];
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v22;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
            }
          }
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v12);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v60 = 0x2020000000;
  uint64_t v61 = 0;
  if (![v36 count]) {
    goto LABEL_22;
  }
  v23 = [v35 mediaLibraryId];
  if (([v35 isGenius] & 1) == 0
    && ([v35 isOnTheGo] & 1) == 0
    && ([v35 isHidden] & 1) == 0)
  {
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100076824;
    v53[3] = &unk_10054E058;
    id v25 = v36;
    id v54 = v25;
    v26 = objc_retainBlock(v53);
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x2020000000;
    v52[3] = 0;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1000768B0;
    v49[3] = &unk_10054E2A8;
    id v51 = v52;
    id v27 = v33;
    id v50 = v27;
    [v27 performBlockAndWait:v49];
    if ([v34 containsObject:v23])
    {
      [v34 removeObject:v23];
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100076B84;
      v38[3] = &unk_10054E678;
      id v39 = v27;
      id v40 = v23;
      id v41 = v25;
      v43[0] = v26;
      id v42 = v35;
      v43[1] = &buf;
      [v39 performBlockAndWaitWithSave:v38];

      v28 = &v39;
      v29 = &v40;
      v30 = &v41;
      v31 = (id *)v43;
    }
    else
    {
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10007692C;
      v44[3] = &unk_10054E650;
      id v45 = v27;
      id v46 = v35;
      id v47 = v25;
      v48[0] = v26;
      v48[1] = &buf;
      v48[2] = v52;
      [v45 performBlockAndWaitWithSave:v44];
      v28 = &v45;
      v29 = &v46;
      v30 = &v47;
      v31 = (id *)v48;
    }

    _Block_object_dispose(v52, 8);
LABEL_22:
    unint64_t v24 = *(void *)(*((void *)&buf + 1) + 24);
    goto LABEL_23;
  }

  unint64_t v24 = 0;
LABEL_23:
  _Block_object_dispose(&buf, 8);

  return v24;
}

- (void)importPlaylists:(id)a3 knownPlaylistIds:(id)a4 mediaLibraryCache:(id)a5 playlists:(id)a6
{
  v28 = self;
  id v30 = a3;
  id v31 = a4;
  id v29 = a5;
  id v9 = a6;
  v10 = +[NSMutableDictionary dictionary];
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v48 = 0;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v9;
  id v11 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v42;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = +[MTMLPlaylist playlistWithMPPlaylist:](MTMLPlaylist, "playlistWithMPPlaylist:", *(void *)(*((void *)&v41 + 1) + 8 * i), v28);
        id v15 = [v14 mediaLibraryId];
        [v10 setObject:v14 forKey:v15];
      }
      id v11 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v11);
  }

  v16 = +[NSMutableArray array];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v17 = [v10 allValues];
  id v18 = [v17 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v38;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v17);
        }
        v21 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
        v22 = [v21 parentMediaLibraryId];
        if ([v22 isEqualToNumber:&off_1005792C0])
        {
          [v16 addObject:v21];
        }
        else
        {
          v23 = [v10 objectForKeyedSubscript:v22];
          [v23 addChild:v21];
        }
      }
      id v18 = [v17 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v18);
  }
  while (1)
  {

    if (![v16 count]) {
      break;
    }
    v17 = [v16 objectAtIndex:0];
    if (([v17 isEmpty] & 1) == 0)
    {
      unint64_t v24 = [(MTMediaLibraryUpdater *)v28 importPlaylist:v17 intoContext:v30 mediaLibraryCache:v29 knownPlaylistIds:v31];
      v46[3] += v24;
      id v25 = [v17 children];
      [v16 addObjectsFromArray:v25];
    }
    [v16 removeObjectAtIndex:0];
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100077328;
  v33[3] = &unk_10054E4F0;
  id v26 = v30;
  id v34 = v26;
  id v36 = &v45;
  id v27 = v31;
  id v35 = v27;
  [v26 performBlockAndWaitWithSave:v33];

  _Block_object_dispose(&v45, 8);
}

- (void)updateMediaLibraryFromNotification:(id)a3
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"doLibraryUpdateFromNotification" object:0];

  [(MTMediaLibraryUpdater *)self performSelector:"doLibraryUpdateFromNotification" withObject:0 afterDelay:1.5];
}

- (void)doLibraryUpdateFromNotification
{
}

- (void)_printMediaItemPropertiesForItem:(id)a3
{
  uint64_t v10 = MPMediaItemPropertyPodcastGUID;
  uint64_t v8 = MPMediaItemPropertyPodcastURL;
  uint64_t v7 = MPMediaItemPropertyStoreID;
  uint64_t v6 = MPMediaItemPropertyHasBeenPlayed;
  uint64_t v5 = MPMediaItemPropertyDescriptionInfo;
  id v9 = a3;
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", MPMediaItemPropertyTitle, MPMediaItemPropertyArtist, MPMediaItemPropertyPodcastTitle, MPMediaItemPropertyPodcastPersistentID, v10, MPMediaItemPropertyAssetURL, MPMediaItemPropertyPersistentID, MPMediaItemPropertyLastPlayedDate, MPMediaItemPropertyRating, MPMediaItemPropertyComments, MPMediaItemPropertyReleaseDate, MPMediaItemPropertyArtwork, MPMediaItemPropertyAlbumArtist, v8, v7, MPMediaItemPropertyBookmarkTime, v6,
    MPMediaItemPropertyPlaybackDuration,
    v5,
    MPMediaItemPropertyAlbumTitle,
    MPMediaItemPropertyPersistentID,
    MPMediaItemPropertyMediaType,
    MPMediaItemPropertyAlbumPersistentID,
    MPMediaItemPropertyArtistPersistentID,
    MPMediaItemPropertyAlbumArtistPersistentID,
    MPMediaItemPropertyGenre,
    MPMediaItemPropertyGenrePersistentID,
    MPMediaItemPropertyComposer,
    MPMediaItemPropertyComposerPersistentID,
    MPMediaItemPropertyPlaybackDuration,
    MPMediaItemPropertyAlbumTrackNumber,
    MPMediaItemPropertyAlbumTrackCount,
    MPMediaItemPropertyDiscNumber,
    MPMediaItemPropertyDiscCount,
    MPMediaItemPropertyLyrics,
    MPMediaItemPropertyIsCompilation,
    MPMediaItemPropertyBeatsPerMinute,
    MPMediaItemPropertyPlayCount,
    MPMediaItemPropertySkipCount,
    MPMediaItemPropertyUserGrouping,
  v3 = 0);
  id v4 = _MTLogCategoryMediaLibrary();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "----------------------------------------------------------------", buf, 2u);
  }

  [v9 enumerateValuesForProperties:v3 usingBlock:&stru_10054E6E0];
}

- (id)_findOrAddPodcastForMediaItem:(id)a3 updaterCache:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 feedUrl];
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v9 = v8;
  if (v7)
  {
    [v8 setObject:v7 forKeyedSubscript:kPodcastFeedUrl];
    [v9 setObject:v7 forKeyedSubscript:kPodcastUpdatedFeedUrl];
  }
  if ([v9 count])
  {
    uint64_t v10 = [v6 propertyDictionaryForSearchItem:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = [v5 podcastTitle];
  uint64_t v12 = [v11 stringByStrippingHTML];

  if (!v10)
  {
    if ([(__CFString *)v12 length])
    {
      if (!v12)
      {
        uint64_t v13 = 0;
        goto LABEL_27;
      }
    }
    else
    {

      uint64_t v12 = @"Untitled";
    }
    [v9 setObject:v12 forKeyedSubscript:kPodcastTitle];
    uint64_t v10 = [v6 propertyDictionaryForSearchItem:v9];
  }
  uint64_t v14 = +[MTDB sharedInstance];
  id v15 = [v14 importContext];

  if (v10)
  {
    v16 = [v10 objectForKey:kPodcastUuid];
    uint64_t v13 = [v15 podcastForUuid:v16];

    if (v13)
    {
      if ([v13 hidden])
      {
        [v13 setHidden:0];
        [v13 setNeedsArtworkUpdate:1];
      }
      v17 = [v5 podcastPersistentId];
      id v18 = [v17 longLongValue];

      [v13 setPodcastPID:v18];
    }
  }
  else
  {
    uint64_t v19 = [v5 artist];
    id v29 = [v19 stringByStrippingHTML];

    objc_super v20 = _MTLogCategoryMediaLibrary();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Adding Podcast from Feed: %@", buf, 0xCu);
    }

    uint64_t v13 = +[MTPodcast insertNewPodcastInManagedObjectContext:subscribed:feedUrl:showType:title:author:provider:imageUrl:description:](MTPodcast, "insertNewPodcastInManagedObjectContext:subscribed:feedUrl:showType:title:author:provider:imageUrl:description:", v15, 0, v7, +[MTPodcast defaultShowType], v12, v29, 0, 0, 0);
    if (v13)
    {
      v21 = [v5 storeCollectionId];
      v22 = [v5 podcastPersistentId];
      [v13 setPodcastPID:[v22 longLongValue]];

      v28 = v21;
      [v13 setStoreCollectionId:[v21 longLongValue]];
      if ([v5 isItunesU])
      {
        [v13 setDeletePlayedEpisodes:0];
        [v13 setShowTypeSetting:2];
        [v13 setEpisodeLimit:&_mh_execute_header];
      }
      [v6 addEntityToCache:v13];
      v23 = _MTLogCategoryMediaLibrary();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        id v27 = [v13 uuid];
        uint64_t v24 = [v13 title];
        *(_DWORD *)long long buf = 138412546;
        id v31 = v27;
        __int16 v32 = 2112;
        uint64_t v33 = v24;
        id v25 = (void *)v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Inserting new podcast:%@ (%@)", buf, 0x16u);
      }
    }
  }
LABEL_27:

  return v13;
}

- (void)_addEpisodeInCtx:(id)a3 mediaItem:(id)a4 episodeCache:(id)a5 podcastUuid:(id)a6 isRestoreDownloadCandidate:(BOOL)a7 canSendNotifications:(BOOL)a8 outEpisodeUUID:(id *)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v18 = [v15 assetUrl];
  uint64_t v19 = [v15 downloadIdentifier];
  objc_super v20 = _MTLogCategoryMediaLibrary();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  v137 = (void *)v19;
  v138 = (void *)v18;
  if (v19 && !v18 && !v10)
  {
    if (v21)
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v144 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "addEpisodeInCtx will skip item with nil assetURL, download id: %@", buf, 0xCu);
    }
    goto LABEL_102;
  }
  if (v21)
  {
    v22 = [v15 title];
    v23 = [v15 assetUrl];
    *(_DWORD *)long long buf = 138543874;
    uint64_t v144 = (uint64_t)v22;
    __int16 v145 = 2114;
    v146 = v23;
    __int16 v147 = 1024;
    LODWORD(v148) = v10;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "addEpisodeInCtx will add item '%{public}@' with assetUrl %{public}@, isRestoreDownloadCandidate = %d", buf, 0x1Cu);
  }
  BOOL v133 = v9;
  BOOL v135 = v10;

  objc_super v20 = [v16 searchCacheForEpisodeMatchingMediaItem:v15];
  uint64_t v24 = [v20 podcastUuid];
  unsigned __int8 v25 = [v24 isEqualToString:v17];

  id v136 = v17;
  if (v25)
  {
    if (v20) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  id v26 = [v15 guid];
  id v27 = [v15 title];
  v28 = [v27 stringByStrippingHTML];

  if (v26)
  {
    uint64_t v29 = kMTEpisodeEntityName;
    id v30 = +[MTEpisode predicateForEpisodeGuid:v26 onPodcastUuid:v17];
    id v31 = +[MTEpisodeUpdaterCache defaultPropertiesToFetch];
    __int16 v32 = [v14 objectsInEntity:v29 predicate:v30 propertiesToFetch:v31 batchSize:0];
    objc_super v20 = [v32 firstObject];
  }
  else
  {
    if (!v28) {
      goto LABEL_36;
    }
    uint64_t v44 = kMTEpisodeEntityName;
    uint64_t v45 = +[MTEpisode predicateForEpisodeTitle:v28 onPodcastUuid:v17];
    id v46 = +[MTEpisodeUpdaterCache defaultPropertiesToFetch];
    uint64_t v47 = [v14 objectsInEntity:v44 predicate:v45 propertiesToFetch:v46 batchSize:0];

    long long v141 = 0u;
    long long v142 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    id v31 = v47;
    id v48 = [v31 countByEnumeratingWithState:&v139 objects:v149 count:16];
    if (v48)
    {
      id v49 = v48;
      id v131 = v16;
      id v132 = v14;
      objc_super v20 = 0;
      uint64_t v50 = *(void *)v140;
      double v51 = 1.79769313e308;
      do
      {
        for (i = 0; i != v49; i = (char *)i + 1)
        {
          if (*(void *)v140 != v50) {
            objc_enumerationMutation(v31);
          }
          id v53 = *(void **)(*((void *)&v139 + 1) + 8 * i);
          [v20 pubDate];
          double v55 = v54;
          long long v56 = [v15 pubDate];
          [v56 timeIntervalSinceReferenceDate];
          double v58 = vabdd_f64(v55, v57);

          if (v58 < v51)
          {
            v59 = v53;

            double v51 = v58;
            objc_super v20 = v59;
          }
        }
        id v49 = [v31 countByEnumeratingWithState:&v139 objects:v149 count:16];
      }
      while (v49);
      id v30 = v31;
      id v16 = v131;
      id v14 = v132;
    }
    else
    {
      objc_super v20 = 0;
      id v30 = v31;
    }
  }

  id v17 = v136;
  if (v20) {
    goto LABEL_15;
  }
LABEL_36:
  uint64_t v60 = [v14 podcastForUuid:v17];
  uint64_t v61 = v60;
  if (!v60 || ([v60 isDeleted] & 1) != 0)
  {
    objc_super v20 = v61;
LABEL_102:

    goto LABEL_103;
  }
  objc_super v20 = +[MTEpisode insertNewEpisodeInManagedObjectContext:v14 canSendNotifications:v133];
  [v20 setPodcast:v61];
  v125 = [v15 title];
  v126 = [v125 stringByStrippingHTML];

  [v20 setTitle:v126];
  v127 = [v61 title];
  v128 = [v126 cleanedTitleStringWithPrefix:v127];
  [v20 setCleanedTitle:v128];

  v129 = [v15 uti];
  [v20 setUti:v129];

  v130 = [v15 guid];
  [v20 setGuid:v130];

  [v20 setImportSource:1];
  [v20 setEpisodeLevel:0x7FFFFFFFFFFFFFFFLL];
  if (v135) {
    [v20 suppressAutomaticDownloadsIfNeeded];
  }
  [v20 setFeedDeleted:1];
  +[IMMetrics recordUserAction:@"media_library_import_new_episode" dataSource:v20];

  id v17 = v136;
  if (v20)
  {
LABEL_15:
    uint64_t v33 = [v15 persistentId];
    id v34 = [v33 unsignedLongLongValue];

    if ([v20 persistentID] != v34) {
      [v20 setPersistentID:v34];
    }
    id v134 = v34;
    uint64_t v35 = [v20 assetURL];
    if ((void *)v35 == v138)
    {

      goto LABEL_43;
    }
    id v36 = (void *)v35;
    long long v37 = [v20 assetURL];
    unsigned __int8 v38 = [v37 isEqualToString:v138];

    if (v38) {
      goto LABEL_43;
    }
    long long v39 = [v20 assetURL];
    long long v40 = +[NSURL URLWithString:v39];
    if ([v40 isFileURL])
    {
      unsigned int v41 = [v138 hasPrefix:@"ipod-library"];

      if (v41)
      {
        long long v42 = _MTLogCategoryMediaLibrary();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          long long v43 = [v20 assetURL];
          *(_DWORD *)long long buf = 138543618;
          uint64_t v144 = (uint64_t)v138;
          __int16 v145 = 2114;
          v146 = v43;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Ignoring Media Library asset url %{public}@. Keep using podcasts asset url %{public}@", buf, 0x16u);
        }
        goto LABEL_43;
      }
    }
    else
    {
    }
    v62 = _MTLogCategoryMediaLibrary();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      long long v63 = [v20 uuid];
      long long v64 = [v20 assetURL];
      *(_DWORD *)long long buf = 138543874;
      uint64_t v144 = (uint64_t)v63;
      __int16 v145 = 2112;
      v146 = v64;
      __int16 v147 = 2112;
      double v148 = *(double *)&v138;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Episode %{public}@ updated assetURL from %@ to %@", buf, 0x20u);
    }
    [v20 setAssetURL:v138];
LABEL_43:
    unsigned int v65 = [v20 isFromITunesSync];
    if (v65 != [v15 isFromITunesSync]) {
      -[NSObject setIsFromITunesSync:](v20, "setIsFromITunesSync:", [v15 isFromITunesSync]);
    }
    id v66 = [v20 byteSize];
    v67 = [v15 byteSize];
    id v68 = [v67 unsignedLongLongValue];

    if (v66 != v68)
    {
      id v69 = [v15 byteSize];
      -[NSObject setByteSize:](v20, "setByteSize:", [v69 unsignedLongLongValue]);
    }
    id v70 = [v15 duration];
    [v70 doubleValue];
    double v72 = v71;

    if ([v20 allowsDurationUpdateFromSource:7])
    {
      if (v72 > 0.0)
      {
        [v20 duration];
        if (v72 != v73) {
          [v20 setDuration:v72];
        }
      }
    }
    id v74 = [v15 category];
    uint64_t v75 = [v20 category];
    if (v74 == (void *)v75)
    {
    }
    else
    {
      id v76 = (void *)v75;
      id v77 = [v20 category];
      unsigned __int8 v78 = [v77 isEqual:v74];

      if ((v78 & 1) == 0) {
        [v20 setCategory:v74];
      }
    }
    id v79 = v16;
    id v80 = [v20 author];
    uint64_t v81 = [v15 artist];
    if (v80 == (void *)v81)
    {
    }
    else
    {
      v82 = (void *)v81;
      id v83 = [v20 author];
      v84 = [v15 artist];
      unsigned __int8 v85 = [v83 isEqual:v84];

      id v17 = v136;
      if (v85)
      {
LABEL_60:
        v86 = [v15 pubDate];
        [v86 timeIntervalSinceReferenceDate];
        double v88 = v87;

        [v20 pubDate];
        if (v89 == 0.0) {
          [v20 setPubDate:v88];
        }
        unsigned int v90 = [v20 explicit];
        id v16 = v79;
        if (v90 != [v15 isExplicit])
        {
          id v91 = _MTLogCategoryMediaLibrary();
          if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
          {
            if ([v15 isExplicit]) {
              CFStringRef v92 = @"ON";
            }
            else {
              CFStringRef v92 = @"OFF";
            }
            v93 = [v20 title];
            v94 = [v20 podcast];
            v95 = [v94 title];
            *(_DWORD *)long long buf = 138412802;
            uint64_t v144 = (uint64_t)v92;
            __int16 v145 = 2112;
            v146 = v93;
            __int16 v147 = 2112;
            double v148 = *(double *)&v95;
            _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEBUG, "Ignoring: ML has different explict flag (%@) for %@ by %@", buf, 0x20u);

            id v17 = v136;
          }
        }
        if ([v15 isFromITunesSync])
        {
          v96 = [v15 playhead];
          [v96 floatValue];
          float v98 = v97;

          [v20 playhead];
          if (v98 > *(float *)&v99)
          {
            *(float *)&double v99 = v98;
            [v20 setPlayhead:v99];
          }
          v100 = [v15 playCount];
          id v101 = [v100 integerValue];

          if ([v20 playCount] != v101) {
            [v20 setPlayCount:v101];
          }
          v102 = [v15 lastPlayedDate];
          [v102 timeIntervalSinceReferenceDate];
          double v104 = v103;

          [v20 lastDatePlayed];
          if (v105 != v104)
          {
            v106 = +[FutureDateChecker sharedInstance];
            [v106 timestampBoundByNow:v104];
            double v108 = v107;

            v109 = _MTLogCategoryMediaLibrary();
            if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
            {
              v110 = [v20 uuid];
              [v20 lastDatePlayed];
              *(_DWORD *)long long buf = 138412802;
              uint64_t v144 = (uint64_t)v110;
              __int16 v145 = 2048;
              v146 = v111;
              __int16 v147 = 2048;
              double v148 = v104;
              _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEBUG, "Changing last date played for %@ from %lf to %lf", buf, 0x20u);
            }
            [v20 setLastDatePlayed:v108];
          }
          int64_t v112 = +[MTLibraryLegacyUtil playStateFromHasBeenPlayed:andPlayCount:](MTLibraryLegacyUtil, "playStateFromHasBeenPlayed:andPlayCount:", [v15 hasBeenPlayed], v101);
          BOOL v114 = fabs(v104) > 2.22044605e-16 && v112 == 2;
          [v20 setPlayState:v112 manually:v114 source:7];
          unsigned int v115 = [v20 explicit];
          if (v115 != [v15 isExplicit])
          {
            v116 = _MTLogCategoryMediaLibrary();
            if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
            {
              if ([v15 isExplicit]) {
                CFStringRef v117 = @"ON";
              }
              else {
                CFStringRef v117 = @"OFF";
              }
              v118 = [v20 title];
              v119 = [v20 podcast];
              v120 = [v119 title];
              *(_DWORD *)long long buf = 138412802;
              uint64_t v144 = (uint64_t)v117;
              __int16 v145 = 2112;
              v146 = v118;
              __int16 v147 = 2112;
              double v148 = *(double *)&v120;
              _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEBUG, "Importing: ML has different explict flag (%@) for %@ by %@", buf, 0x20u);

              id v17 = v136;
            }

            -[NSObject setExplicit:](v20, "setExplicit:", [v15 isExplicit]);
          }
          +[IMMetrics recordUserAction:@"media_library_import_from_itunes" dataSource:v20];
        }
        v121 = [v15 storeTrackId];
        uint64_t v122 = (uint64_t)[v121 longLongValue];

        if (v122 >= 1 && [v20 storeTrackId] != (id)v122) {
          [v20 setStoreTrackId:v122];
        }
        if (v135)
        {
          v123 = _MTLogCategoryMediaLibrary();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
          {
            v124 = +[NSNumber numberWithUnsignedLongLong:v134];
            *(_DWORD *)long long buf = 138543362;
            uint64_t v144 = (uint64_t)v124;
            _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "Setting persistent id for item that is being retored: %{public}@", buf, 0xCu);
          }
          [v20 setPersistentID:v134];
        }
        if (a9)
        {
          *a9 = [v20 uuid];
        }

        goto LABEL_102;
      }
      id v80 = [v15 artist];
      [v20 setAuthor:v80];
    }

    goto LABEL_60;
  }
LABEL_103:
}

+ (id)numberFormatter
{
  v2 = (void *)qword_10060A678;
  if (!qword_10060A678)
  {
    id v3 = objc_alloc_init((Class)NSNumberFormatter);
    id v4 = (void *)qword_10060A678;
    qword_10060A678 = (uint64_t)v3;

    [(id)qword_10060A678 setNumberStyle:1];
    v2 = (void *)qword_10060A678;
  }

  return v2;
}

- (void)libraryDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = kMTEpisodeEntityName;
  id v6 = [v4 changesForEntityName:kMTEpisodeEntityName];
  unsigned int v7 = [v6 hasChanges];

  if (v7)
  {
    id v8 = [v4 changesForEntityName:v5];
    if ([v8 hasUpdates])
    {
      BOOL v9 = +[MTDB sharedInstance];
      BOOL v10 = [v9 importContext];

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100078D30;
      v12[3] = &unk_10054E708;
      id v13 = v8;
      id v14 = v10;
      id v15 = self;
      id v11 = v10;
      id v8 = v8;
      [v11 performBlock:v12];
    }
  }
}

- (BOOL)haveMediaLibraryPropertiesChangedForEpisode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 uuid];
  id v6 = [v5 length];

  if (v6)
  {
    episodeCache = self->_episodeCache;
    id v8 = [v4 uuid];
    BOOL v9 = [(NSMutableDictionary *)episodeCache objectForKeyedSubscript:v8];

    id v6 = [(MTMediaLibraryUpdater *)self propertiesForMediaLibrary];
    BOOL v10 = [v4 dictionaryWithValuesForKeys:v6];

    unsigned __int8 v11 = [v10 isEqualToDictionary:v9];
    LOBYTE(v6) = v11 ^ 1;
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = self->_episodeCache;
      id v13 = [v4 uuid];
      [(NSMutableDictionary *)v12 setObject:v10 forKeyedSubscript:v13];
    }
  }

  return (char)v6;
}

- (id)propertiesForMediaLibrary
{
  v4[0] = kEpisodePersistentID;
  v4[1] = kEpisodePlayhead;
  v4[2] = kEpisodePlayState;
  v4[3] = kEpisodePlayCount;
  v2 = +[NSArray arrayWithObjects:v4 count:4];

  return v2;
}

- (id)noteObserver
{
  return self->_noteObserver;
}

- (void)setNoteObserver:(id)a3
{
}

- (NSMutableArray)didUpdateCompletionBlocks
{
  return self->_didUpdateCompletionBlocks;
}

- (void)setDidUpdateCompletionBlocks:(id)a3
{
}

- (OS_dispatch_source)updateDatabaseDispatchSource
{
  return self->_updateDatabaseDispatchSource;
}

- (void)setUpdateDatabaseDispatchSource:(id)a3
{
}

- (NSObject)observerLock
{
  return self->_observerLock;
}

- (void)setObserverLock:(id)a3
{
}

- (NSMutableDictionary)episodeCache
{
  return self->_episodeCache;
}

- (void)setEpisodeCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episodeCache, 0);
  objc_storeStrong((id *)&self->_observerLock, 0);
  objc_storeStrong((id *)&self->_updateDatabaseDispatchSource, 0);
  objc_storeStrong((id *)&self->_didUpdateCompletionBlocks, 0);

  objc_storeStrong(&self->_noteObserver, 0);
}

@end