@interface MCDLibraryPlaybackManager
- (id)playbackRequestForAlbum:(id)a3;
- (id)playbackRequestForPlaylist:(id)a3;
- (void)_initiatePlaybackAndPushNPViewControllerForPlaybackRequest:(id)a3 startItemIdentifiers:(id)a4 shuffle:(BOOL)a5 playActivityFeatureName:(id)a6;
- (void)_initiatePlaybackForItemKind:(id)a3 object:(id)a4 lastResponse:(id)a5 shuffled:(BOOL)a6 forceScopingToResponseResults:(BOOL)a7 playActivityFeatureName:(id)a8;
- (void)initiatePlaybackForAlbum:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6;
- (void)initiatePlaybackForGenre:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6;
- (void)initiatePlaybackForPerson:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6;
- (void)initiatePlaybackForPlaylist:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6;
- (void)initiatePlaybackForPlaylistEntry:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 forceScopingToResponseResults:(BOOL)a6 playActivityFeatureName:(id)a7;
- (void)initiatePlaybackForSong:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 forceScopingToResponseResults:(BOOL)a6 playActivityFeatureName:(id)a7;
- (void)initiateRadioPlaybackForArtist:(id)a3 playActivityFeatureName:(id)a4;
@end

@implementation MCDLibraryPlaybackManager

- (void)_initiatePlaybackForItemKind:(id)a3 object:(id)a4 lastResponse:(id)a5 shuffled:(BOOL)a6 forceScopingToResponseResults:(BOOL)a7 playActivityFeatureName:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = objc_alloc_init((Class)MPModelLibraryRequest);
  [v17 setItemKind:v13];
  v18 = [v15 request];
  v19 = [v18 scopedContainers];
  v20 = [v19 firstObject];

  BOOL v32 = v10;
  if (v20)
  {
    v21 = [v18 itemSortDescriptors];
    [v17 setItemSortDescriptors:v21];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = +[MPModelSong kindWithVariants:1];
      v35 = v22;
      v23 = +[NSArray arrayWithObjects:&v35 count:1];
      v24 = +[MPModelPlaylistEntry kindWithKinds:v23];
      v25 = +[MPModelPlaylist kindWithVariants:215 playlistEntryKind:v24 options:0];
      [v17 setSectionKind:v25];
    }
    else
    {
      v29 = [v18 sectionKind];
      [v17 setSectionKind:v29];
    }
    id v28 = [v18 scopedContainers];
    [v17 setScopedContainers:v28];
  }
  else if (v9)
  {
    v26 = +[NSMutableArray array];
    v27 = [v15 results];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000BB2A4;
    v33[3] = &unk_100FC4438;
    id v34 = v26;
    id v28 = v26;
    [v27 enumerateItemIdentifiersUsingBlock:v33];

    [v17 setScopedContainers:v28];
  }
  else
  {
    if (v10) {
      goto LABEL_9;
    }
    id v28 = [v18 itemSortDescriptors];
    [v17 setItemSortDescriptors:v28];
  }

LABEL_9:
  v30 = [v14 identifiers];
  [(MCDLibraryPlaybackManager *)self _initiatePlaybackAndPushNPViewControllerForPlaybackRequest:v17 startItemIdentifiers:v30 shuffle:v32 playActivityFeatureName:v16];
}

- (void)initiatePlaybackForSong:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 forceScopingToResponseResults:(BOOL)a6 playActivityFeatureName:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  id v15 = +[MPModelSong kindWithVariants:1];
  [(MCDLibraryPlaybackManager *)self _initiatePlaybackForItemKind:v15 object:v14 lastResponse:v13 shuffled:v8 forceScopingToResponseResults:v7 playActivityFeatureName:v12];
}

- (void)initiatePlaybackForPlaylistEntry:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 forceScopingToResponseResults:(BOOL)a6 playActivityFeatureName:(id)a7
{
  BOOL v7 = a6;
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  id v15 = +[MPModelSong kindWithVariants:1];
  v18 = v15;
  id v16 = +[NSArray arrayWithObjects:&v18 count:1];
  id v17 = +[MPModelPlaylistEntry kindWithKinds:v16];

  [(MCDLibraryPlaybackManager *)self _initiatePlaybackForItemKind:v17 object:v14 lastResponse:v13 shuffled:v8 forceScopingToResponseResults:v7 playActivityFeatureName:v12];
}

- (void)initiatePlaybackForPerson:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)MPModelLibraryRequest);
  id v12 = +[MPModelSong kindWithVariants:1];
  [v11 setItemKind:v12];

  id v14 = v10;
  id v13 = +[NSArray arrayWithObjects:&v14 count:1];

  [v11 setScopedContainers:v13];
  [(MCDLibraryPlaybackManager *)self _initiatePlaybackAndPushNPViewControllerForPlaybackRequest:v11 startItemIdentifiers:0 shuffle:v6 playActivityFeatureName:v9];
}

- (void)initiatePlaybackForGenre:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)MPModelLibraryRequest);
  id v12 = +[MPModelSong kindWithVariants:1];
  [v11 setItemKind:v12];

  id v14 = v10;
  id v13 = +[NSArray arrayWithObjects:&v14 count:1];

  [v11 setScopedContainers:v13];
  [(MCDLibraryPlaybackManager *)self _initiatePlaybackAndPushNPViewControllerForPlaybackRequest:v11 startItemIdentifiers:0 shuffle:v6 playActivityFeatureName:v9];
}

- (id)playbackRequestForAlbum:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)MPModelLibraryRequest);
  v5 = +[MPModelSong kindWithVariants:1];
  [v4 setItemKind:v5];

  id v13 = v3;
  BOOL v6 = +[NSArray arrayWithObjects:&v13 count:1];
  [v4 setScopedContainers:v6];

  BOOL v7 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertySongDiscNumber ascending:1];
  v12[0] = v7;
  BOOL v8 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertySongTrackNumber ascending:1];
  v12[1] = v8;
  id v9 = +[NSSortDescriptor sortDescriptorWithKey:MPModelPropertySongTitle ascending:1];
  v12[2] = v9;
  id v10 = +[NSArray arrayWithObjects:v12 count:3];

  [v4 setItemSortDescriptors:v10];

  return v4;
}

- (void)initiatePlaybackForAlbum:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = [(MCDLibraryPlaybackManager *)self playbackRequestForAlbum:a3];
  [(MCDLibraryPlaybackManager *)self _initiatePlaybackAndPushNPViewControllerForPlaybackRequest:v10 startItemIdentifiers:0 shuffle:v6 playActivityFeatureName:v9];
}

- (id)playbackRequestForPlaylist:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)MPModelLibraryRequest);
  v5 = +[MPModelSong kindWithVariants:1];
  BOOL v6 = +[MPModelTVEpisode kindWithVariants:3];
  v14[0] = v5;
  v14[1] = v6;
  BOOL v7 = +[NSArray arrayWithObjects:v14 count:2];
  BOOL v8 = +[MPModelPlaylistEntry kindWithKinds:v7];

  id v9 = +[MPModelPlaylist kindWithVariants:215 playlistEntryKind:v8 options:0];
  [v4 setSectionKind:v9];
  [v4 setItemKind:v8];
  id v13 = v3;
  id v10 = +[NSArray arrayWithObjects:&v13 count:1];
  [v4 setScopedContainers:v10];

  id v11 = [v3 preferredTracklistSortDescriptors];

  [v4 setItemSortDescriptors:v11];

  return v4;
}

- (void)initiatePlaybackForPlaylist:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = [(MCDLibraryPlaybackManager *)self playbackRequestForPlaylist:a3];
  [(MCDLibraryPlaybackManager *)self _initiatePlaybackAndPushNPViewControllerForPlaybackRequest:v10 startItemIdentifiers:0 shuffle:v6 playActivityFeatureName:v9];
}

- (void)initiateRadioPlaybackForArtist:(id)a3 playActivityFeatureName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[MPCPlaybackIntent radioPlaybackIntentFromArtist:v6];
  [v8 setPlayActivityFeatureName:v7];

  id v9 = sub_1000BBCDC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v6 name];
    *(_DWORD *)buf = 138543362;
    id v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Initiating radio playback for artist: %{public}@", buf, 0xCu);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000BBDC4;
  void v12[3] = &unk_100FC4460;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [(MCDPlaybackManager *)self setupPlaybackRequestWithCompletion:v12];
}

- (void)_initiatePlaybackAndPushNPViewControllerForPlaybackRequest:(id)a3 startItemIdentifiers:(id)a4 shuffle:(BOOL)a5 playActivityFeatureName:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(MCDPlaybackManager *)self localContentOnly]) {
    [v10 setFilteringOptions:[v10 filteringOptions] | 2];
  }
  if ([(MCDPlaybackManager *)self favoriteContentOnly]) {
    [v10 setFilteringOptions:[v10 filteringOptions] | 0x200000];
  }
  id v13 = [v10 playbackIntentWithStartItemIdentifiers:v11];
  id v14 = v13;
  if (v7) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = -1;
  }
  [v13 setShuffleMode:v15];
  [v14 setPlayActivityFeatureName:v12];

  id v16 = sub_1000BBCDC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Initiating playback for library content", buf, 2u);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000BBFD0;
  v18[3] = &unk_100FC4460;
  v18[4] = self;
  id v19 = v14;
  id v17 = v14;
  [(MCDPlaybackManager *)self setupPlaybackRequestWithCompletion:v18];
}

@end