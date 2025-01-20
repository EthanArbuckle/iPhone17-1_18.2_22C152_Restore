@interface MCDStorePlaybackManager
- (NSArray)playbackQueueItemIDs;
- (id)_normalizedStringStoreIDForContentItem:(id)a3;
- (id)_setupPlaybackIntentForContentItem:(id)a3 shouldShuffle:(BOOL)a4;
- (id)_setupPlaybackIntentForQueuedSongsLength:(int64_t)a3 startItemIdentifiers:(id)a4;
- (id)_storeIDForObject:(id)a3;
- (void)_initiatePlaybackForItem:(id)a3 shouldShuffle:(BOOL)a4 playActivityFeatureName:(id)a5;
- (void)initiatePlaybackForAlbum:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6;
- (void)initiatePlaybackForPlaylist:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6;
- (void)initiatePlaybackForRadioStation:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6;
- (void)initiatePlaybackForSong:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 forceScopingToResponseResults:(BOOL)a6 playActivityFeatureName:(id)a7;
- (void)initiatePlaybackForSong:(id)a3 useResultsAsPlaybackQueue:(BOOL)a4 itemList:(id)a5 playActivityFeatureName:(id)a6;
- (void)setPlaybackQueueItemIDs:(id)a3;
@end

@implementation MCDStorePlaybackManager

- (void)initiatePlaybackForSong:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 forceScopingToResponseResults:(BOOL)a6 playActivityFeatureName:(id)a7
{
  BOOL v7 = a5;
  id v11 = a7;
  id v12 = a3;
  v13 = [a4 results];
  id v14 = [v13 itemsInSectionAtIndex:0];

  if ([v14 count]) {
    [(MCDStorePlaybackManager *)self initiatePlaybackForSong:v12 useResultsAsPlaybackQueue:1 itemList:v14 playActivityFeatureName:v11];
  }
  else {
    [(MCDStorePlaybackManager *)self _initiatePlaybackForItem:v12 shouldShuffle:v7 playActivityFeatureName:v11];
  }
}

- (void)initiatePlaybackForSong:(id)a3 useResultsAsPlaybackQueue:(BOOL)a4 itemList:(id)a5 playActivityFeatureName:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = v12;
  if (!v8)
  {
    v32 = [(MCDStorePlaybackManager *)self _setupPlaybackIntentForContentItem:v10 shouldShuffle:0];
    goto LABEL_26;
  }
  id v34 = v12;
  v35 = self;
  v37 = v10;
  uint64_t v14 = +[NSMutableArray array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v36 = v11;
  id v15 = v11;
  v16 = (void *)v14;
  id v17 = v15;
  id v18 = [v15 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (!v18) {
    goto LABEL_19;
  }
  id v19 = v18;
  uint64_t v20 = *(void *)v41;
  do
  {
    for (i = 0; i != v19; i = (char *)i + 1)
    {
      if (*(void *)v41 != v20) {
        objc_enumerationMutation(v17);
      }
      v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        id v23 = [v22 identifiers];
        v25 = [v23 universalStore];
        id v24 = [v25 adamID];
LABEL_13:

        goto LABEL_15;
      }
      id v23 = v22;
      if ([v23 itemType] == (id)7)
      {
        id v24 = [v23 song];

        if (!v24) {
          goto LABEL_15;
        }
        v25 = [v23 song];
        [v25 identifiers];
        v27 = v26 = v16;
        v28 = [v27 universalStore];
        id v24 = [v28 adamID];

        v16 = v26;
        goto LABEL_13;
      }
      id v24 = 0;
LABEL_15:

      if (v24)
      {
        v29 = +[NSString stringWithFormat:@"%lld", v24];
        [v16 addObject:v29];
      }
    }
    id v19 = [v17 countByEnumeratingWithState:&v40 objects:v44 count:16];
  }
  while (v19);
LABEL_19:

  self = v35;
  [(MCDStorePlaybackManager *)v35 setPlaybackQueueItemIDs:v16];
  objc_opt_class();
  id v10 = v37;
  if (objc_opt_isKindOfClass())
  {
    v30 = [v37 song];
    v31 = [v30 identifiers];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = [v37 identifiers];
    }
    else
    {
      v31 = 0;
    }
  }
  v32 = -[MCDStorePlaybackManager _setupPlaybackIntentForQueuedSongsLength:startItemIdentifiers:](v35, "_setupPlaybackIntentForQueuedSongsLength:startItemIdentifiers:", [v16 count], v31);

  id v11 = v36;
  v13 = v34;
LABEL_26:
  [v32 setPlayActivityFeatureName:v13];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000BC4D4;
  v38[3] = &unk_100FC4460;
  v38[4] = self;
  id v39 = v32;
  id v33 = v32;
  [(MCDPlaybackManager *)self setupPlaybackRequestWithCompletion:v38];
}

- (void)initiatePlaybackForAlbum:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6
{
}

- (void)initiatePlaybackForPlaylist:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MCDStorePlaybackManager;
  v13 = [(MCDLibraryPlaybackManager *)&v23 playbackRequestForPlaylist:v10];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000BC688;
  v17[3] = &unk_100FC4488;
  id v18 = v10;
  id v19 = v11;
  BOOL v22 = a5;
  id v20 = v12;
  v21 = self;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [v13 performWithResponseHandler:v17];
}

- (void)initiatePlaybackForRadioStation:(id)a3 lastResponse:(id)a4 shuffled:(BOOL)a5 playActivityFeatureName:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  id v10 = v8;
  objc_opt_class();
  id v11 = v10;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [v10 radioStation];
  }
  if (v11)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000BC834;
    v12[3] = &unk_100FC44B0;
    id v13 = v11;
    id v14 = v9;
    id v15 = self;
    [(MCDPlaybackManager *)self setupPlaybackRequestWithCompletion:v12];
  }
}

- (void)_initiatePlaybackForItem:(id)a3 shouldShuffle:(BOOL)a4 playActivityFeatureName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_1000BBCDC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Initiating playback for store item", buf, 2u);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000BCA10;
  v13[3] = &unk_100FC44D8;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [(MCDPlaybackManager *)self setupPlaybackRequestWithCompletion:v13];
}

- (id)_setupPlaybackIntentForQueuedSongsLength:(int64_t)a3 startItemIdentifiers:(id)a4
{
  id v6 = a4;
  BOOL v7 = sub_1000BBCDC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting up playback for queued songs", v16, 2u);
  }

  id v8 = objc_alloc_init((Class)MPCModelStorePlaybackItemsRequest);
  id v9 = [(MCDStorePlaybackManager *)self playbackQueueItemIDs];
  id v10 = [(MCDStorePlaybackManager *)self playbackQueueItemIDs];
  id v11 = [v10 count];

  if ((unint64_t)v11 >= a3) {
    int64_t v12 = a3;
  }
  else {
    int64_t v12 = (int64_t)v11;
  }
  id v13 = [v9 subarrayWithRange:0, v12];
  [v8 setStoreIDs:v13];

  id v14 = [v8 playbackIntentWithStartItemIdentifiers:v6];

  return v14;
}

- (id)_setupPlaybackIntentForContentItem:(id)a3 shouldShuffle:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init((Class)MPCModelStorePlaybackItemsRequest);
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = [v5 identifiers];
  id v9 = [v8 universalStore];
  id v10 = [v9 globalPlaylistID];

  if (v10) {
    goto LABEL_3;
  }
  id v11 = [v5 identifiers];
  int64_t v12 = [v11 universalStore];
  id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%lld", [v12 adamID]);

  if (v10)
  {
LABEL_3:
    [v7 addObject:v10];
  }
  [v6 setStoreIDs:v7];
  id v13 = [v6 playbackIntentWithStartItemIdentifiers:0];
  id v14 = [v5 identifiers];
  id v15 = [v14 personalizedStore];
  BOOL v16 = [v15 recommendationID];

  if (v16)
  {
    id v17 = [v16 dataUsingEncoding:4];
  }
  else
  {
    id v17 = 0;
  }
  [v13 setPlayActivityRecommendationData:v17];
  if (v4) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = -1;
  }
  [v13 setShuffleMode:v18];

  return v13;
}

- (id)_normalizedStringStoreIDForContentItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [(MCDStorePlaybackManager *)self _storeIDForObject:v4];
    goto LABEL_12;
  }
  id v5 = v4;
  id v6 = [v5 itemType];
  if (v6 == (id)7)
  {
    uint64_t v7 = [v5 song];
  }
  else if (v6 == (id)4)
  {
    uint64_t v7 = [v5 playlist];
  }
  else
  {
    if (v6 != (id)1)
    {
      id v8 = 0;
      goto LABEL_11;
    }
    uint64_t v7 = [v5 album];
  }
  id v9 = (void *)v7;
  id v8 = [(MCDStorePlaybackManager *)self _storeIDForObject:v7];

LABEL_11:
LABEL_12:

  return v8;
}

- (id)_storeIDForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v4 = [v3 identifiers];
    id v5 = [v4 universalStore];
    id v6 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v5 adamID]);
    uint64_t v7 = MPStoreItemMetadataStringNormalizeStoreIDValue();

LABEL_4:
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 identifiers];
    id v5 = [v4 universalStore];
    uint64_t v7 = [v5 globalPlaylistID];
    goto LABEL_4;
  }
  uint64_t v7 = 0;
LABEL_5:

  return v7;
}

- (NSArray)playbackQueueItemIDs
{
  return self->_playbackQueueItemIDs;
}

- (void)setPlaybackQueueItemIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end