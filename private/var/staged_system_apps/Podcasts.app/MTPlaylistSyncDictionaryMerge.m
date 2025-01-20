@interface MTPlaylistSyncDictionaryMerge
+ (void)mergeArray:(id)a3 fromArray:(id)a4 lookupKey:(id)a5 updateBlock:(id)a6 insertBlock:(id)a7 deleteBlock:(id)a8;
- (BOOL)refreshContentsOfUpdatedOrInsertedPlaylists;
- (BOOL)syncMergeIsFromCloud;
- (MTPlaylistSyncDictionaryMerge)initWithLoggingCategory:(id)a3 dictionariesToMerge:(id)a4;
- (NSArray)dictionariesToMerge;
- (OS_os_log)loggingCategory;
- (id)canDeletePlaylistUUIDBlock;
- (void)_addSetting:(id)a3 syncObj:(id)a4 playlist:(id)a5;
- (void)_applyOrderingInSyncDictionary:(id)a3 playlist:(id)a4;
- (void)_mergeSetting:(id)a3 syncObj:(id)a4;
- (void)performAndWaitWithContext:(id)a3 save:(BOOL)a4;
- (void)setCanDeletePlaylistUUIDBlock:(id)a3;
- (void)setRefreshContentsOfUpdatedOrInsertedPlaylists:(BOOL)a3;
- (void)setSyncMergeIsFromCloud:(BOOL)a3;
@end

@implementation MTPlaylistSyncDictionaryMerge

- (MTPlaylistSyncDictionaryMerge)initWithLoggingCategory:(id)a3 dictionariesToMerge:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MTPlaylistSyncDictionaryMerge;
  v9 = [(MTPlaylistSyncDictionaryMerge *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_loggingCategory, a3);
    objc_storeStrong((id *)&v10->_dictionariesToMerge, a4);
    v10->_syncMergeIsFromCloud = 1;
  }

  return v10;
}

- (void)performAndWaitWithContext:(id)a3 save:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v36 = self;
  id v7 = [(MTPlaylistSyncDictionaryMerge *)self loggingCategory];
  id v8 = [(MTPlaylistSyncDictionaryMerge *)v36 dictionariesToMerge];
  unsigned int v9 = [(MTPlaylistSyncDictionaryMerge *)v36 refreshContentsOfUpdatedOrInsertedPlaylists];
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_10012FC24;
  v60[3] = &unk_1005527D0;
  v60[4] = v36;
  v10 = objc_retainBlock(v60);
  v11 = objc_opt_new();
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = sub_1000570FC;
  v58 = sub_100057348;
  id v59 = (id)objc_opt_new();
  v13 = v7;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v14 = [v8 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v62) = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "merging %d playlists", buf, 8u);
  }

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_10012FCA4;
  v52[3] = &unk_1005527F8;
  id v15 = v6;
  id v53 = v15;
  v30 = objc_retainBlock(v52);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10012FCB4;
  v43[3] = &unk_100552910;
  id v33 = v15;
  id v44 = v33;
  v45 = v36;
  id v27 = v8;
  id v46 = v27;
  v34 = v13;
  v47 = v34;
  v51 = &v54;
  id v29 = v11;
  id v48 = v29;
  id v35 = v12;
  id v49 = v35;
  v28 = v10;
  id v50 = v28;
  ((void (*)(void *, BOOL, void *))v30[2])(v30, v4, v43);
  if (v9)
  {
    v16 = +[MTBaseProcessor sharedInstance];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v29;
    id v17 = [obj countByEnumeratingWithState:&v39 objects:v65 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v40;
      uint64_t v31 = kPlaylistTitle;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          v21 = [v35 objectForKeyedSubscript:v20];
          v22 = v34;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = [v21 valueForKey:v31];
            *(_DWORD *)buf = 138543618;
            uint64_t v62 = v20;
            __int16 v63 = 2112;
            v64 = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "sync processor is refreshing playlist (uuid=%{public}@ - title='%@')", buf, 0x16u);
          }
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_1001309B4;
          v37[3] = &unk_100552938;
          v37[4] = v36;
          id v24 = v21;
          id v38 = v24;
          [v16 updatePlaylistWithUuid:v20 inContext:v33 applyAdditionalChangesBlock:v37];
        }
        id v17 = [obj countByEnumeratingWithState:&v39 objects:v65 count:16];
      }
      while (v17);
    }
  }
  v25 = +[MTCoreSpotlightController sharedInstance];
  [v25 updateStationsWithUUIDs:v55[5]];

  _Block_object_dispose(&v54, 8);
}

- (void)_applyOrderingInSyncDictionary:(id)a3 playlist:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v42 = [(MTPlaylistSyncDictionaryMerge *)self loggingCategory];
  if ([v7 isUngroupedList] && objc_msgSend(v7, "containerOrder") == 2)
  {
    id v8 = [v6 objectForKeyedSubscript:@"episodeSortOrderArray"];
    if ([v8 count])
    {
      id v37 = v6;
      unsigned int v9 = +[NSMutableDictionary dictionary];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v36 = v8;
      id v10 = v8;
      id v38 = v9;
      id v41 = [v10 countByEnumeratingWithState:&v48 objects:v58 count:16];
      if (v41)
      {
        uint64_t v40 = *(void *)v49;
        long long v39 = v10;
        while (2)
        {
          for (i = 0; i != v41; i = (char *)i + 1)
          {
            if (*(void *)v49 != v40) {
              objc_enumerationMutation(v10);
            }
            id v12 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            [v12 objectForKeyedSubscript:@"mediaItemPersistentID" v36];
            id v13 = (id)objc_claimAutoreleasedReturnValue();
            id v14 = [v13 longLongValue];
            id v15 = [v12 objectForKeyedSubscript:@"sortOrder"];
            id v16 = [v15 longLongValue];
            if (!v14)
            {
              id v33 = v42;
              id v8 = v36;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                v34 = [v7 uuid];
                id v35 = [v7 title];
                *(_DWORD *)buf = 138543874;
                id v53 = v34;
                __int16 v54 = 2112;
                v55 = v35;
                __int16 v56 = 2114;
                CFStringRef v57 = @"mediaItemPersistentID";
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "ERROR: syncInfo ordering can't be be applied to playlist (uuid=%{public}@ - title='%@').  No %{public}@ found in info dictionary", buf, 0x20u);

                unsigned int v9 = v38;
              }

              id v6 = v37;
              goto LABEL_22;
            }
            id v17 = v16;
            if (!v15)
            {
              uint64_t v18 = v42;
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                v19 = [v7 uuid];
                [v7 title];
                v21 = id v20 = v7;
                *(_DWORD *)buf = 138543874;
                id v53 = v19;
                __int16 v54 = 2112;
                v55 = v21;
                __int16 v56 = 2114;
                CFStringRef v57 = @"sortOrder";
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "ERROR: syncInfo ordering can't be be applied to playlist (uuid=%{public}@ - title='%@').  No %{public}@ found in info dictionary", buf, 0x20u);

                id v7 = v20;
                unsigned int v9 = v38;

                id v10 = v39;
              }
            }
            v22 = +[NSNumber numberWithLongLong:v17];
            v23 = +[NSNumber numberWithLongLong:v14];
            [v9 setObject:v22 forKeyedSubscript:v23];
          }
          id v41 = [v10 countByEnumeratingWithState:&v48 objects:v58 count:16];
          if (v41) {
            continue;
          }
          break;
        }
      }

      id v24 = +[NSMutableDictionary dictionary];
      v25 = [v7 episodes];
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100130F50;
      v46[3] = &unk_10054FE30;
      id v26 = v24;
      id v47 = v26;
      [v25 enumerateObjectsUsingBlock:v46];
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100131004;
      v43[3] = &unk_100552960;
      id v44 = v9;
      id v45 = v26;
      id v13 = v26;
      long long v39 = v25;
      id v27 = [v25 sortedArrayUsingComparator:v43];
      v28 = v42;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = [v7 uuid];
        v30 = [v7 title];
        uint64_t v31 = [v27 valueForKey:@"persistentID"];
        *(_DWORD *)buf = 138543874;
        id v53 = v29;
        __int16 v54 = 2112;
        v55 = v30;
        __int16 v56 = 2114;
        CFStringRef v57 = v31;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "syncInfo ordering will be applied to playlist (uuid=%{public}@ - title='%@'), episodePIDs = %{public}@", buf, 0x20u);
      }
      v32 = +[NSOrderedSet orderedSetWithArray:v27];
      [v7 setEpisodes:v32];

      id v15 = v47;
      id v8 = v36;
      id v6 = v37;
      unsigned int v9 = v38;
LABEL_22:
    }
  }
}

- (void)_addSetting:(id)a3 syncObj:(id)a4 playlist:(id)a5
{
  id v19 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = v7;
  id v10 = [v9 objectForKey:@"podcastFeedUrl"];

  if (v10)
  {
    v11 = [v9 objectForKey:@"podcastFeedUrl"];
    id v12 = [v19 podcastForFeedUrl:v11];

    if (v12)
    {
      id v13 = +[MTPodcastPlaylistSettings insertNewSettingsInManagedObjectContext:v19];
      id v14 = [v9 objectForKey:kPlaylistSettingUuid];
      [v13 setUuid:v14];

      id v15 = [v9 objectForKey:@"episodesToShowTruth"];
      [v13 setEpisodesToShow:[v15 integerValue]];

      id v16 = [v9 objectForKey:kPlaylistSettingMediaType];
      [v13 setMediaType:[v16 integerValue]];

      id v17 = [v9 objectForKey:kPlaylistSettingShowPlayedEpisodes];
      [v13 setShowPlayedEpisodes:[v17 BOOLValue]];

      [v13 setNeedsUpdate:1];
      [v13 setPlaylist:v8];
      uint64_t v18 = [v9 objectForKey:kPlaylistSettingTracksDefault];
      [v13 setTracksDefault:[v18 BOOLValue]];

      [v13 setPodcast:v12];
    }
    else
    {
      id v13 = +[IMLogger sharedLogger];
      [v13 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Sync/MTPlaylistSyncDictionaryMerge.m" lineNumber:268 format:@"Trying to add a setting for a non-existent podcast"];
    }
  }
}

- (void)_mergeSetting:(id)a3 syncObj:(id)a4
{
  id v41 = a3;
  id v5 = a4;
  uint64_t v6 = [v5 objectForKey:@"episodesToShowTruth"];
  if (v6
    && (id v7 = (void *)v6,
        id v8 = [v41 episodesToShow],
        [v5 objectForKey:@"episodesToShowTruth"],
        id v9 = objc_claimAutoreleasedReturnValue(),
        id v10 = [v9 integerValue],
        v9,
        v7,
        v8 != v10))
  {
    id v12 = [v5 objectForKey:@"episodesToShowTruth"];
    [v41 setEpisodesToShow:[v12 integerValue]];

    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v13 = kPlaylistSettingTracksDefault;
  uint64_t v14 = [v5 objectForKey:kPlaylistSettingTracksDefault];
  if (v14)
  {
    id v15 = (void *)v14;
    unsigned int v16 = [v41 tracksDefault];
    id v17 = [v5 objectForKey:v13];
    unsigned int v18 = [v17 BOOLValue];

    if (v16 != v18)
    {
      id v19 = [v5 objectForKey:v13];
      [v41 setTracksDefault:[v19 BOOLValue]];

      uint64_t v11 = 1;
    }
  }
  uint64_t v20 = kPlaylistSettingMediaType;
  uint64_t v21 = [v5 objectForKey:kPlaylistSettingMediaType];
  if (v21)
  {
    v22 = (void *)v21;
    id v23 = [v41 mediaType];
    id v24 = [v5 objectForKey:v20];
    id v25 = [v24 integerValue];

    if (v23 != v25)
    {
      id v26 = [v5 objectForKey:v20];
      [v41 setMediaType:[v26 integerValue]];

      uint64_t v11 = 1;
    }
  }
  uint64_t v27 = kPlaylistSettingShowPlayedEpisodes;
  uint64_t v28 = [v5 objectForKey:kPlaylistSettingShowPlayedEpisodes];
  if (v28)
  {
    id v29 = (void *)v28;
    unsigned int v30 = [v41 showPlayedEpisodes];
    uint64_t v31 = [v5 objectForKey:v27];
    unsigned int v32 = [v31 BOOLValue];

    if (v30 != v32)
    {
      id v33 = [v5 objectForKey:v27];
      [v41 setShowPlayedEpisodes:[v33 BOOLValue]];

      uint64_t v11 = 1;
    }
  }
  uint64_t v34 = kPlaylistSettingSortOrder;
  uint64_t v35 = [v5 objectForKey:kPlaylistSettingSortOrder];
  if (v35)
  {
    v36 = (void *)v35;
    id v37 = [v41 sortOrder];
    id v38 = [v5 objectForKey:v34];
    id v39 = [v38 integerValue];

    if (v37 != v39)
    {
      uint64_t v40 = [v5 objectForKey:v34];
      [v41 setSortOrder:[v40 longLongValue]];

      uint64_t v11 = 1;
    }
  }
  [v41 setNeedsUpdate:v11];
}

+ (void)mergeArray:(id)a3 fromArray:(id)a4 lookupKey:(id)a5 updateBlock:(id)a6 insertBlock:(id)a7 deleteBlock:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  unsigned int v16 = (void (**)(id, void *, void *))a6;
  id v29 = (void (**)(id, void *))a7;
  id v27 = a8;
  uint64_t v28 = v13;
  if (v13)
  {
    id v17 = [v13 valueForKey:v15];
    unsigned int v18 = +[NSMutableDictionary dictionaryWithObjects:v13 forKeys:v17];
  }
  else
  {
    unsigned int v18 = 0;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v19 = v14;
  id v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v25 = [v24 valueForKey:v15, v27, v28];
        if (v25)
        {
          id v26 = [v18 objectForKey:v25];
          if (v26)
          {
            if (v16) {
              v16[2](v16, v26, v24);
            }
          }
          else if (v29)
          {
            v29[2](v29, v24);
          }
          [v18 removeObjectForKey:v25];
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v21);
  }

  if (v27 && [v18 count])
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100131994;
    v30[3] = &unk_100552988;
    id v31 = v27;
    [v18 enumerateKeysAndObjectsUsingBlock:v30];
  }
}

- (OS_os_log)loggingCategory
{
  return self->_loggingCategory;
}

- (NSArray)dictionariesToMerge
{
  return self->_dictionariesToMerge;
}

- (id)canDeletePlaylistUUIDBlock
{
  return self->_canDeletePlaylistUUIDBlock;
}

- (void)setCanDeletePlaylistUUIDBlock:(id)a3
{
}

- (BOOL)refreshContentsOfUpdatedOrInsertedPlaylists
{
  return self->_refreshContentsOfUpdatedOrInsertedPlaylists;
}

- (void)setRefreshContentsOfUpdatedOrInsertedPlaylists:(BOOL)a3
{
  self->_refreshContentsOfUpdatedOrInsertedPlaylists = a3;
}

- (BOOL)syncMergeIsFromCloud
{
  return self->_syncMergeIsFromCloud;
}

- (void)setSyncMergeIsFromCloud:(BOOL)a3
{
  self->_syncMergeIsFromCloud = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_canDeletePlaylistUUIDBlock, 0);
  objc_storeStrong((id *)&self->_dictionariesToMerge, 0);

  objc_storeStrong((id *)&self->_loggingCategory, 0);
}

@end