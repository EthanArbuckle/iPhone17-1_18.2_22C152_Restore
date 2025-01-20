@interface BKMLAudiobookTrack
- (BKAudiobook)audiobook;
- (BKMLAudiobook)containingAudiobook;
- (BKMLAudiobookTrack)initWithAudiobook:(id)a3 mediaItem:(id)a4 startTime:(double)a5 startChapterNumber:(unint64_t)a6 trackNumber:(unint64_t)a7 trackCount:(unint64_t)a8 storeDemoMode:(BOOL)a9;
- (BOOL)hasAlternateArtwork;
- (BOOL)incrementPlayCountForStopTime:(double)a3;
- (CGImage)artwork;
- (CGImage)artworkForTime:(double)a3;
- (MPMediaItem)mediaItem;
- (NSArray)chapters;
- (NSDate)dateLastOpened;
- (NSString)author;
- (NSString)description;
- (NSString)title;
- (NSURL)assetURL;
- (UIImage)coverArt;
- (double)bookmarkTime;
- (double)duration;
- (double)startTime;
- (id)alternateArtworkTimes;
- (void)_lookupRacGUIDFromHLSPlaylistWithCompletion:(id)a3;
- (void)lookupRacGUIDWithCompletion:(id)a3;
- (void)setAudiobook:(id)a3;
- (void)setBookmarkTime:(double)a3;
- (void)setContainingAudiobook:(id)a3;
@end

@implementation BKMLAudiobookTrack

- (BKMLAudiobookTrack)initWithAudiobook:(id)a3 mediaItem:(id)a4 startTime:(double)a5 startChapterNumber:(unint64_t)a6 trackNumber:(unint64_t)a7 trackCount:(unint64_t)a8 storeDemoMode:(BOOL)a9
{
  id v14 = a3;
  id v15 = a4;
  v62.receiver = self;
  v62.super_class = (Class)BKMLAudiobookTrack;
  v16 = [(BKMLAudiobookTrack *)&v62 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_containingAudiobook, v14);
    p_mediaItem = (id *)&v17->_mediaItem;
    objc_storeStrong((id *)&v17->_mediaItem, a4);
    v19 = [v15 valueForProperty:MPMediaItemPropertyTitle];
    v20 = (NSString *)[v19 copy];
    title = v17->_title;
    v17->_title = v20;

    v22 = [v15 valueForProperty:MPMediaItemPropertyArtist];
    v23 = (NSString *)[v22 copy];
    author = v17->_author;
    v17->_author = v23;

    v25 = [v15 valueForProperty:MPMediaItemPropertyPlaybackDuration];
    [v25 doubleValue];
    v17->_duration = v26;

    v17->_startTime = a5;
    v17->_hasAlternateArtwork = 0;
    id v51 = v15;
    if ([(MPMediaItem *)v17->_mediaItem countOfChaptersOfType:2])
    {
      [*p_mediaItem chaptersOfType:2];
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      id v28 = [v27 countByEnumeratingWithState:&v58 objects:v64 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v59;
        while (2)
        {
          v31 = v17;
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v59 != v30) {
              objc_enumerationMutation(v27);
            }
            v33 = [*(id *)(*((void *)&v58 + 1) + 8 * i) artworkCatalog];
            v34 = [v33 bestImageFromDisk];
            if (v34)
            {
              v17 = v31;
              v31->_hasAlternateArtwork = 1;

              goto LABEL_13;
            }
          }
          id v29 = [v27 countByEnumeratingWithState:&v58 objects:v64 count:16];
          v17 = v31;
          if (v29) {
            continue;
          }
          break;
        }
      }
LABEL_13:

      id v15 = v51;
    }
    mediaItem = v17->_mediaItem;
    if (a9) {
      [(MPMediaItem *)mediaItem bk_storeDemoAssetURL];
    }
    else {
    uint64_t v36 = [(MPMediaItem *)mediaItem bk_assetURL];
    }
    assetURL = v17->_assetURL;
    v17->_assetURL = (NSURL *)v36;

    v38 = objc_opt_new();
    v39 = [(MPMediaItem *)v17->_mediaItem chaptersOfType:1];
    if ([v39 count])
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v40 = v39;
      id v41 = [(BKMLAudiobookChapter *)v40 countByEnumeratingWithState:&v54 objects:v63 count:16];
      if (v41)
      {
        id v42 = v41;
        id v50 = v14;
        uint64_t v43 = *(void *)v55;
        do
        {
          for (j = 0; j != v42; j = (char *)j + 1)
          {
            if (*(void *)v55 != v43) {
              objc_enumerationMutation(v40);
            }
            v45 = [[BKMLAudiobookChapter alloc] initWithMediaChapter:*(void *)(*((void *)&v54 + 1) + 8 * (void)j) track:v17 number:(char *)j + a6 trackNumber:a7 trackCount:a8];
            [v38 addObject:v45];
          }
          id v42 = [(BKMLAudiobookChapter *)v40 countByEnumeratingWithState:&v54 objects:v63 count:16];
          a6 += (unint64_t)j;
        }
        while (v42);
        id v14 = v50;
        id v15 = v51;
      }
    }
    else
    {
      v46 = BKAudiobooksLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_2556C(p_mediaItem, v46);
      }

      v40 = [[BKMLAudiobookChapter alloc] initWithMediaChapter:0 track:v17 number:a6 trackNumber:a7 trackCount:a8];
      [v38 addObject:v40];
    }

    v47 = (NSArray *)[v38 copy];
    chapters = v17->_chapters;
    v17->_chapters = v47;
  }
  return v17;
}

- (BKAudiobook)audiobook
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingAudiobook);

  return (BKAudiobook *)WeakRetained;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(BKMLAudiobookTrack *)self assetURL];
  v6 = [(BKMLAudiobookTrack *)self title];
  v7 = [(BKMLAudiobookTrack *)self author];
  v8 = [(BKMLAudiobookTrack *)self artwork];
  [(BKMLAudiobookTrack *)self duration];
  v10 = +[NSMutableString stringWithFormat:@"<%@:%p url=%@ title=%@ author=%@ artwork=%p duration=%lf chapters=\n", v4, self, v5, v6, v7, v8, v9];

  NSUInteger v11 = [(NSArray *)self->_chapters count];
  if (v11)
  {
    NSUInteger v12 = v11;
    uint64_t v13 = 0;
    NSUInteger v14 = v11 - 1;
    do
    {
      id v15 = [(NSArray *)self->_chapters objectAtIndexedSubscript:v13];
      uint64_t v16 = [v15 description];
      v17 = (void *)v16;
      if (v14 == v13) {
        CFStringRef v18 = &stru_3D468;
      }
      else {
        CFStringRef v18 = @",";
      }
      [v10 appendFormat:@"  %@%@\n", v16, v18];

      ++v13;
    }
    while (v12 != v13);
  }
  [v10 appendFormat:@">"];

  return (NSString *)v10;
}

- (double)bookmarkTime
{
  v3 = [(MPMediaItem *)self->_mediaItem valueForProperty:MPMediaItemPropertyBookmarkTime];
  [v3 doubleValue];
  double v5 = v4;

  double result = 0.0;
  if (v5 <= self->_duration) {
    return v5;
  }
  return result;
}

- (void)setBookmarkTime:(double)a3
{
  [(MPMediaItem *)self->_mediaItem setHasBeenPlayed:1];
  double v5 = +[NSDate date];
  [(MPMediaItem *)self->_mediaItem setLastPlayedDate:v5];

  mediaItem = self->_mediaItem;
  id v7 = +[NSNumber numberWithDouble:a3];
  [(MPMediaItem *)mediaItem setValue:v7 forProperty:MPMediaItemPropertyBookmarkTime withCompletionBlock:0];
}

- (NSDate)dateLastOpened
{
  objc_opt_class();
  v3 = [(MPMediaItem *)self->_mediaItem objectForKeyedSubscript:MPMediaItemPropertyLastPlayedDate];
  double v4 = BUDynamicCast();

  return (NSDate *)v4;
}

- (id)alternateArtworkTimes
{
  v3 = objc_opt_new();
  if ([(BKMLAudiobookTrack *)self hasAlternateArtwork])
  {
    double v4 = [(MPMediaItem *)self->_mediaItem chaptersOfType:2];
    if ([v4 count])
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v5 = v4;
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v14;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v13 + 1) + 8 * i) playbackTime:v13];
            v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            [v3 addObject:v10];
          }
          id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
      }
    }
  }
  id v11 = [v3 copy:v13];

  return v11;
}

- (CGImage)artworkForTime:(double)a3
{
  if (![(BKMLAudiobookTrack *)self hasAlternateArtwork]) {
    return 0;
  }
  id v5 = [(MPMediaItem *)self->_mediaItem chapterOfType:2 atTime:a3];
  id v6 = [v5 artworkCatalog];
  id v7 = [v6 bestImageFromDisk];
  uint64_t v8 = (CGImage *)[v7 CGImage];

  return v8;
}

- (UIImage)coverArt
{
  coverArt = self->_coverArt;
  if (!coverArt)
  {
    double v4 = [(BKMLAudiobookTrack *)self mediaItem];
    id v5 = [v4 valueForProperty:MPMediaItemPropertyArtwork];

    if (v5)
    {
      [v5 bounds];
      [v5 imageWithSize:v6, v7];
      uint64_t v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = self->_coverArt;
      self->_coverArt = v8;
    }
    coverArt = self->_coverArt;
  }

  return coverArt;
}

- (CGImage)artwork
{
  id v2 = [(BKMLAudiobookTrack *)self coverArt];
  v3 = (CGImage *)[v2 CGImage];

  return v3;
}

- (BOOL)incrementPlayCountForStopTime:(double)a3
{
  v3 = [(BKMLAudiobookTrack *)self mediaItem];
  [v3 startTime];
  [v3 effectiveStopTime];
  int v4 = MPShouldIncrementPlayCountForElapsedTime();
  if (v4)
  {
    [v3 setPlayCount:([v3 playCount] + 1)];
    [v3 setPlayCountSinceSync:((char *)[v3 playCountSinceSync]) + 1];
    id v5 = +[NSDate date];
    [v3 setLastPlayedDate:v5];
  }
  return v4;
}

- (void)lookupRacGUIDWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(BKMLAudiobookTrack *)self assetURL];
  unsigned int v6 = [v5 bk_isStreamingAssetURL];

  if (v6)
  {
    [(BKMLAudiobookTrack *)self _lookupRacGUIDFromHLSPlaylistWithCompletion:v4];
  }
  else
  {
    id v7 = objc_alloc_init((Class)BLMetadataStore);
    uint64_t v8 = [(BKMLAudiobookTrack *)self mediaItem];
    uint64_t v9 = [v8 bk_storePlaylistID];
    id v10 = [v9 longLongValue];

    if (v10)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_17758;
      v13[3] = &unk_3CFD0;
      v13[4] = self;
      id v14 = v4;
      [v7 racGUIDForStoreID:v10 result:v13];
    }
    else
    {
      id v11 = objc_retainBlock(v4);
      NSUInteger v12 = v11;
      if (v11) {
        (*((void (**)(id, void))v11 + 2))(v11, 0);
      }
    }
  }
}

- (void)_lookupRacGUIDFromHLSPlaylistWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)BLHLSAudiobookFetcher) initCanUseCellularData:1 powerRequired:0 bundleID:0];
  unsigned int v6 = [(BKMLAudiobookTrack *)self assetURL];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_178F8;
  v8[3] = &unk_3CFF8;
  id v9 = v4;
  id v7 = v4;
  [v5 getRacGUIDFromMasterPlaylistURL:v6 completion:v8];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)author
{
  return self->_author;
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (double)duration
{
  return self->_duration;
}

- (NSArray)chapters
{
  return self->_chapters;
}

- (double)startTime
{
  return self->_startTime;
}

- (BOOL)hasAlternateArtwork
{
  return self->_hasAlternateArtwork;
}

- (void)setAudiobook:(id)a3
{
}

- (MPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (BKMLAudiobook)containingAudiobook
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingAudiobook);

  return (BKMLAudiobook *)WeakRetained;
}

- (void)setContainingAudiobook:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containingAudiobook);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_destroyWeak((id *)&self->audiobook);
  objc_storeStrong((id *)&self->_coverArt, 0);
  objc_storeStrong((id *)&self->_chapters, 0);
  objc_storeStrong((id *)&self->_dateLastOpened, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_author, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end