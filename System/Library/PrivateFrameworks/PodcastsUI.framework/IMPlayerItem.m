@interface IMPlayerItem
- (AVURLAsset)asset;
- (BOOL)_isContentItemLoaded;
- (BOOL)areChaptersLoaded;
- (BOOL)areChaptersLoading;
- (BOOL)enqueuedByAnotherUser;
- (BOOL)hasChapterArtworkAtTime:(double)a3;
- (BOOL)isAppleMusicEpisode;
- (BOOL)isAppleNewsEpisode;
- (BOOL)isAssetLoaded;
- (BOOL)isEntitled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicit;
- (BOOL)isLocal;
- (BOOL)isNotSubscribeable;
- (BOOL)isPlaceholder;
- (BOOL)isPlayable;
- (BOOL)isShareable;
- (BOOL)isStreamable;
- (BOOL)isVideo;
- (BOOL)notifyUserIsNotPlayable;
- (BOOL)paidSubscriptionActive;
- (BOOL)podcastIsSerial;
- (BOOL)supportsArtworkUrl;
- (BOOL)upgradeToAlternatePaidVersionIfNeeded;
- (IMAVSecureKeyLoader)secureKeyLoader;
- (IMPlayerArtwork)episodeArtworkProperties;
- (IMPlayerArtwork)showArtworkProperties;
- (IMPlayerArtwork)uberArtworkProperties;
- (IMPlayerItem)init;
- (IMPlayerItem)initWithEpisode:(id)a3;
- (IMPlayerItem)initWithUrl:(id)a3;
- (IMPlayerManifest)manifest;
- (MPArtworkCatalog)artworkCatalog;
- (MPNowPlayingContentItem)contentItem;
- (MTEpisode)episode;
- (NSArray)chapters;
- (NSArray)metadataChapters;
- (NSArray)timeChapters;
- (NSDate)pubDate;
- (NSManagedObjectID)episodeObjectID;
- (NSString)album;
- (NSString)author;
- (NSString)episodeGuid;
- (NSString)episodeUuid;
- (NSString)itemDescription;
- (NSString)podcastDisplayType;
- (NSString)podcastFeedUrl;
- (NSString)podcastUuid;
- (NSString)priceType;
- (NSString)title;
- (NSString)transcriptIdentifier;
- (NSString)transcriptSource;
- (NSURL)alternatePaidURL;
- (NSURL)artworkUrl;
- (NSURL)episodeShareUrl;
- (NSURL)podcastShareUrl;
- (NSURL)url;
- (NSUUID)instanceIdentifier;
- (OS_dispatch_queue)chapterLoadingQueue;
- (double)duration;
- (double)playhead;
- (id)chapterAtTime:(double)a3;
- (id)contentItemIdentifier;
- (id)createAssetForUrl:(id)a3;
- (id)externalMetadata;
- (id)fetchArtworkItemProviderForSize:(CGSize)a3;
- (id)retrieveChapterArtworkAtTime:(double)a3;
- (id)streamUrl;
- (int64_t)channelStoreId;
- (int64_t)editingStyleFlags;
- (int64_t)episodeNumber;
- (int64_t)episodePID;
- (int64_t)episodeStoreId;
- (int64_t)episodeType;
- (int64_t)playCount;
- (int64_t)podcastStoreId;
- (int64_t)seasonNumber;
- (unint64_t)hash;
- (unint64_t)manifestIndex;
- (void)cleanupAfterError;
- (void)invalidateAsset;
- (void)loadChapters;
- (void)populateContentItem:(id)a3;
- (void)recreateContentItem;
- (void)reset;
- (void)retrieveArtwork:(id)a3 withSize:(CGSize)a4;
- (void)retrieveArtwork:(id)a3 withSize:(CGSize)a4 atTime:(double)a5;
- (void)setAlbum:(id)a3;
- (void)setAlternatePaidURL:(id)a3;
- (void)setAreChaptersLoaded:(BOOL)a3;
- (void)setAreChaptersLoading:(BOOL)a3;
- (void)setArtworkCatalog:(id)a3;
- (void)setArtworkUrl:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setChannelStoreId:(int64_t)a3;
- (void)setChapterLoadingQueue:(id)a3;
- (void)setChapters:(id)a3;
- (void)setContentItem:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEditingStyleFlags:(int64_t)a3;
- (void)setEnqueuedByAnotherUser:(BOOL)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setEpisodeArtworkProperties:(id)a3;
- (void)setEpisodeGuid:(id)a3;
- (void)setEpisodeNumber:(int64_t)a3;
- (void)setEpisodeObjectID:(id)a3;
- (void)setEpisodePID:(int64_t)a3;
- (void)setEpisodeShareUrl:(id)a3;
- (void)setEpisodeStoreId:(int64_t)a3;
- (void)setEpisodeType:(int64_t)a3;
- (void)setEpisodeUuid:(id)a3;
- (void)setInstanceIdentifier:(id)a3;
- (void)setIsAppleMusicEpisode:(BOOL)a3;
- (void)setIsAppleNewsEpisode:(BOOL)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setIsNotSubscribeable:(BOOL)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setIsVideo:(BOOL)a3;
- (void)setItemDescription:(id)a3;
- (void)setManifest:(id)a3;
- (void)setManifestIndex:(unint64_t)a3;
- (void)setPaidSubscriptionActive:(BOOL)a3;
- (void)setPlayCount:(int64_t)a3;
- (void)setPlayhead:(double)a3;
- (void)setPodcastDisplayType:(id)a3;
- (void)setPodcastFeedUrl:(id)a3;
- (void)setPodcastIsSerial:(BOOL)a3;
- (void)setPodcastShareUrl:(id)a3;
- (void)setPodcastStoreId:(int64_t)a3;
- (void)setPodcastUuid:(id)a3;
- (void)setPriceType:(id)a3;
- (void)setPubDate:(id)a3;
- (void)setSeasonNumber:(int64_t)a3;
- (void)setSecureKeyLoader:(id)a3;
- (void)setShowArtworkProperties:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTranscriptIdentifier:(id)a3;
- (void)setTranscriptSource:(id)a3;
- (void)setUberArtworkProperties:(id)a3;
- (void)setUrl:(id)a3;
- (void)updateActivity:(id)a3;
- (void)updateContentItem;
- (void)updateTranscriptInformation:(id)a3 transcriptSource:(id)a4;
@end

@implementation IMPlayerItem

- (IMPlayerItem)initWithUrl:(id)a3
{
  id v5 = a3;
  v6 = [(IMPlayerItem *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v7->_objectIDLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (IMPlayerItem)init
{
  v9.receiver = self;
  v9.super_class = (Class)IMPlayerItem;
  v2 = [(IMPlayerItem *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_duration = 0.0;
    v2->_playhead = 0.0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.podcasts.playerItem.chapterLoadingQueue", 0);
    chapterLoadingQueue = v3->_chapterLoadingQueue;
    v3->_chapterLoadingQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    instanceIdentifier = v3->_instanceIdentifier;
    v3->_instanceIdentifier = (NSUUID *)v6;

    [(IMPlayerItem *)v3 setAreChaptersLoaded:0];
  }
  return v3;
}

- (void)cleanupAfterError
{
  if ([(IMPlayerItem *)self isAssetLoaded])
  {
    v3 = [(IMPlayerItem *)self asset];
    id v6 = [v3 cacheKey];

    dispatch_queue_t v4 = [(IMPlayerItem *)self asset];
    id v5 = [v4 assetCache];

    if (v6)
    {
      NSClassFromString(&cfstr_Avmanagedasset.isa);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v5 removeEntryForKey:v6];
      }
    }
    [(IMPlayerItem *)self invalidateAsset];
  }
}

- (void)reset
{
  id v4 = [(AVURLAsset *)self->_asset URL];
  v3 = [(IMPlayerItem *)self createAssetForUrl:v4];
  [(IMPlayerItem *)self setAsset:v3];
}

- (void)setInstanceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_instanceIdentifier, a3);

  [(IMPlayerItem *)self setContentItem:0];
}

- (id)createAssetForUrl:(id)a3
{
  return 0;
}

- (unint64_t)hash
{
  v2 = [(IMPlayerItem *)self instanceIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 instanceIdentifier];
    id v6 = [(IMPlayerItem *)self instanceIdentifier];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (AVURLAsset)asset
{
  asset = self->_asset;
  if (!asset)
  {
    id v4 = [(IMPlayerItem *)self createAssetForUrl:self->_url];
    [(IMPlayerItem *)self setAsset:v4];

    asset = self->_asset;
  }

  return asset;
}

- (void)setAsset:(id)a3
{
  id v5 = a3;
  asset = self->_asset;
  p_asset = &self->_asset;
  id v8 = v5;
  if (([v5 isEqual:asset] & 1) == 0) {
    objc_storeStrong((id *)p_asset, a3);
  }
}

- (BOOL)isAssetLoaded
{
  return self->_asset != 0;
}

- (double)duration
{
  if (!self->_asset) {
    return self->_duration;
  }
  unint64_t v3 = [(IMPlayerItem *)self asset];
  uint64_t v4 = [v3 statusOfValueForKey:@"duration" error:0];

  if (v4 != 2) {
    return self->_duration;
  }
  id v5 = [(IMPlayerItem *)self asset];
  id v6 = v5;
  if (v5) {
    [v5 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  return Seconds;
}

- (void)setPlayhead:(double)a3
{
  self->_playhead = a3;
  id v5 = [(IMPlayerItem *)self manifest];
  uint64_t v4 = [v5 activity];
  [(IMPlayerItem *)self updateActivity:v4];
}

- (void)invalidateAsset
{
  [(AVURLAsset *)self->_asset cancelLoading];
  asset = self->_asset;
  self->_asset = 0;
}

- (BOOL)supportsArtworkUrl
{
  return 1;
}

- (BOOL)isVideo
{
  if (!self->_asset) {
    return self->_video;
  }
  unint64_t v3 = [(IMPlayerItem *)self asset];
  uint64_t v4 = [v3 statusOfValueForKey:@"tracks" error:0];

  if (v4 != 2) {
    return self->_video;
  }
  id v5 = [(IMPlayerItem *)self asset];
  id v6 = [v5 tracksWithMediaCharacteristic:*MEMORY[0x1E4F15B98]];

  if ([v6 count]) {
    BOOL video = self->_video;
  }
  else {
    BOOL video = 0;
  }

  return video;
}

- (BOOL)isLocal
{
  v2 = [(IMPlayerItem *)self url];
  if ([v2 isFileURL])
  {
    char v3 = 1;
  }
  else
  {
    uint64_t v4 = [v2 scheme];
    char v3 = [v4 isEqualToString:@"ipod-library"];
  }
  return v3;
}

- (BOOL)isPlayable
{
  return 1;
}

- (BOOL)notifyUserIsNotPlayable
{
  return 0;
}

- (BOOL)isShareable
{
  char v3 = [(IMPlayerItem *)self episode];
  if ([v3 isShareable])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(IMPlayerItem *)self episodeShareUrl];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(IMPlayerItem *)self podcastFeedUrl];
      BOOL v4 = v6 != 0;
    }
  }

  return v4;
}

- (BOOL)isStreamable
{
  v2 = objc_msgSend(MEMORY[0x1E4F91FB0], "validatedIdNumberFromStoreId:", -[IMPlayerItem episodeStoreId](self, "episodeStoreId"));
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)streamUrl
{
  if ([(IMPlayerItem *)self isLocal])
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__1;
    v18 = __Block_byref_object_dispose__1;
    id v19 = [(IMPlayerItem *)self episode];
    BOOL v3 = (void *)v15[5];
    if (v3)
    {
      uint64_t v8 = 0;
      objc_super v9 = &v8;
      uint64_t v10 = 0x3032000000;
      v11 = __Block_byref_object_copy__1;
      v12 = __Block_byref_object_dispose__1;
      id v13 = 0;
      BOOL v4 = [v3 managedObjectContext];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __25__IMPlayerItem_streamUrl__block_invoke;
      v7[3] = &unk_1E6E1FE68;
      v7[4] = &v14;
      v7[5] = &v8;
      [v4 performBlockAndWait:v7];
      id v5 = (id)v9[5];

      _Block_object_dispose(&v8, 8);
    }
    else
    {
      id v5 = 0;
    }
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v5 = [(IMPlayerItem *)self url];
  }

  return v5;
}

void __25__IMPlayerItem_streamUrl__block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) feedDeleted] & 1) == 0)
  {
    id v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) enclosureURL];
    if ([v5 length])
    {
      uint64_t v2 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
      uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
      BOOL v4 = *(void **)(v3 + 40);
      *(void *)(v3 + 40) = v2;
    }
  }
}

- (id)externalMetadata
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(IMPlayerItem *)self title];
  if ([v4 length])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F165A0]);
    [v5 setIdentifier:*MEMORY[0x1E4F15C80]];
    [v5 setExtendedLanguageTag:@"und"];
    [v5 setValue:v4];
    [v3 addObject:v5];
  }
  id v6 = [(IMPlayerItem *)self author];
  if ([v6 length])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F165A0]);
    [v7 setIdentifier:*MEMORY[0x1E4F15DB0]];
    [v7 setExtendedLanguageTag:@"und"];
    [v7 setValue:v6];
    [v3 addObject:v7];
  }

  return v3;
}

- (id)contentItemIdentifier
{
  return &stru_1F3F553C0;
}

- (MPNowPlayingContentItem)contentItem
{
  contentItem = self->_contentItem;
  if (!contentItem)
  {
    [(IMPlayerItem *)self recreateContentItem];
    contentItem = self->_contentItem;
  }

  return contentItem;
}

- (void)recreateContentItem
{
  id v3 = objc_alloc(MEMORY[0x1E4F319E0]);
  BOOL v4 = [(IMPlayerItem *)self contentItemIdentifier];
  id v5 = (MPNowPlayingContentItem *)[v3 initWithIdentifier:v4];
  contentItem = self->_contentItem;
  self->_contentItem = v5;

  [(IMPlayerItem *)self updateContentItem];
}

- (void)updateContentItem
{
}

- (BOOL)_isContentItemLoaded
{
  return self->_contentItem != 0;
}

- (void)setEpisodeObjectID:(id)a3
{
  BOOL v4 = (NSManagedObjectID *)a3;
  os_unfair_lock_lock(&self->_objectIDLock);
  episodeObjectID = self->_episodeObjectID;
  self->_episodeObjectID = v4;

  os_unfair_lock_unlock(&self->_objectIDLock);
}

- (NSManagedObjectID)episodeObjectID
{
  p_objectIDLock = &self->_objectIDLock;
  os_unfair_lock_lock(&self->_objectIDLock);
  BOOL v4 = self->_episodeObjectID;
  os_unfair_lock_unlock(p_objectIDLock);

  return v4;
}

- (void)updateActivity:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(IMPlayerItem *)self title];
  [v8 setTitle:v4];

  id v5 = [(IMPlayerItem *)self album];
  [v8 _setSubtitle:v5];

  id v6 = [(IMPlayerItem *)self title];
  [v8 setItemTitle:v6];

  id v7 = [(IMPlayerItem *)self album];
  [v8 setContainerTitle:v7];

  [(IMPlayerItem *)self playhead];
  objc_msgSend(v8, "setCurrentTime:");
}

- (id)fetchArtworkItemProviderForSize:(CGSize)a3
{
  return 0;
}

- (void)retrieveArtwork:(id)a3 withSize:(CGSize)a4
{
}

- (BOOL)hasChapterArtworkAtTime:(double)a3
{
  id v3 = [(IMPlayerItem *)self chapterAtTime:a3];
  BOOL v4 = [v3 artworkData];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)retrieveChapterArtworkAtTime:(double)a3
{
  id v3 = [(IMPlayerItem *)self chapterAtTime:a3];
  BOOL v4 = [v3 artwork];

  return v4;
}

- (void)retrieveArtwork:(id)a3 withSize:(CGSize)a4 atTime:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  objc_super v9 = (void (**)(id, uint64_t))a3;
  uint64_t v10 = [(IMPlayerItem *)self retrieveChapterArtworkAtTime:a5];
  id v11 = (id)v10;
  if (v10) {
    v9[2](v9, v10);
  }
  else {
    -[IMPlayerItem retrieveArtwork:withSize:](self, "retrieveArtwork:withSize:", v9, width, height);
  }
}

- (id)chapterAtTime:(double)a3
{
  BOOL v5 = [(IMPlayerItem *)self metadataChapters];

  if (!v5) {
    goto LABEL_3;
  }
  id v6 = [(IMPlayerItem *)self metadataChapters];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __30__IMPlayerItem_chapterAtTime___block_invoke;
  v11[3] = &__block_descriptor_40_e36_B32__0__IMPlayerChapterInfo_8Q16_B24l;
  *(double *)&v11[4] = a3;
  uint64_t v7 = [v6 indexOfObjectPassingTest:v11];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_super v9 = [(IMPlayerItem *)self metadataChapters];
    id v8 = [v9 objectAtIndex:v7];
  }
  else
  {
LABEL_3:
    id v8 = 0;
  }

  return v8;
}

BOOL __30__IMPlayerItem_chapterAtTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = *(double *)(a1 + 32);
  [v3 time];
  BOOL v10 = 0;
  if (v4 >= v5)
  {
    double v6 = *(double *)(a1 + 32);
    [v3 time];
    double v8 = v7;
    [v3 duration];
    if (v6 < v8 + v9 && [v3 metadataType] == 3) {
      BOOL v10 = 1;
    }
  }

  return v10;
}

- (BOOL)upgradeToAlternatePaidVersionIfNeeded
{
  return 0;
}

- (NSArray)chapters
{
  if (![(IMPlayerItem *)self areChaptersLoaded]
    && [(IMPlayerItem *)self isAssetLoaded])
  {
    [(IMPlayerItem *)self loadChapters];
  }
  chapters = self->_chapters;

  return chapters;
}

- (NSArray)timeChapters
{
  uint64_t v2 = [(IMPlayerItem *)self chapters];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_6];
  double v4 = [v2 filteredArrayUsingPredicate:v3];

  return (NSArray *)v4;
}

BOOL __28__IMPlayerItem_timeChapters__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 0;
}

- (NSArray)metadataChapters
{
  uint64_t v2 = [(IMPlayerItem *)self chapters];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_37];
  double v4 = [v2 filteredArrayUsingPredicate:v3];

  return (NSArray *)v4;
}

BOOL __32__IMPlayerItem_metadataChapters__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 1;
}

- (void)loadChapters
{
  if (![(IMPlayerItem *)self areChaptersLoaded]
    && ![(IMPlayerItem *)self areChaptersLoading])
  {
    id v3 = [(IMPlayerItem *)self url];
    double v4 = [v3 pathExtension];
    double v5 = [v4 lowercaseString];

    if ([&unk_1F3F6F8E8 containsObject:v5])
    {
      [(IMPlayerItem *)self setAreChaptersLoading:1];
      double v6 = [(IMPlayerItem *)self asset];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __28__IMPlayerItem_loadChapters__block_invoke;
      v8[3] = &unk_1E6E1FB70;
      id v9 = v6;
      BOOL v10 = self;
      id v7 = v6;
      [v7 loadValuesAsynchronouslyForKeys:&unk_1F3F6F900 completionHandler:v8];
    }
  }
}

void __28__IMPlayerItem_loadChapters__block_invoke(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  id v63 = 0;
  uint64_t v2 = [v1 statusOfValueForKey:@"availableChapterLocales" error:&v63];
  id v33 = v63;
  if (v2 == 2)
  {
    v31 = [*(id *)(a1 + 32) availableChapterLocales];
    if ([v31 count])
    {
      uint64_t v57 = 0;
      v58 = &v57;
      uint64_t v59 = 0x3032000000;
      v60 = __Block_byref_object_copy__1;
      v61 = __Block_byref_object_dispose__1;
      id v62 = 0;
      id v3 = [MEMORY[0x1E4F1CA20] preferredLanguages];
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = __28__IMPlayerItem_loadChapters__block_invoke_2;
      v54[3] = &unk_1E6E1FED0;
      id v4 = v31;
      id v55 = v4;
      v56 = &v57;
      [v3 enumerateObjectsUsingBlock:v54];

      if (!v58[5])
      {
        if ([v4 count]) {
          [v4 firstObject];
        }
        else {
        uint64_t v5 = [MEMORY[0x1E4F1CA20] currentLocale];
        }
        v12 = (void *)v58[5];
        v58[5] = v5;
      }
      id v13 = objc_alloc(MEMORY[0x1E4F1C978]);
      uint64_t v14 = objc_msgSend(v13, "initWithObjects:", *MEMORY[0x1E4F15CD0], *MEMORY[0x1E4F15C98], 0);
      v15 = [*(id *)(a1 + 40) asset];
      uint64_t v16 = [v15 chapterMetadataGroupsWithTitleLocale:v58[5] containingItemsWithCommonKeys:v14];

      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v18 = dispatch_group_create();
      dispatch_queue_t v38 = dispatch_queue_create("com.apple.podcasts.playeritemchapters", 0);
      id v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"commonKey", @"extraAttributes", @"value", @"time", @"duration", 0);

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id obj = v16;
      uint64_t v20 = [obj countByEnumeratingWithState:&v50 objects:v65 count:16];
      if (v20)
      {
        uint64_t v35 = *(void *)v51;
        do
        {
          uint64_t v21 = 0;
          uint64_t v36 = v20;
          do
          {
            if (*(void *)v51 != v35) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v50 + 1) + 8 * v21);
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            v23 = [v22 items];
            uint64_t v24 = [v23 countByEnumeratingWithState:&v46 objects:v64 count:16];
            uint64_t v37 = v21;
            if (v24)
            {
              uint64_t v25 = *(void *)v47;
              do
              {
                uint64_t v26 = 0;
                do
                {
                  if (*(void *)v47 != v25) {
                    objc_enumerationMutation(v23);
                  }
                  v27 = *(void **)(*((void *)&v46 + 1) + 8 * v26);
                  dispatch_group_enter(v18);
                  v42[0] = MEMORY[0x1E4F143A8];
                  v42[1] = 3221225472;
                  v42[2] = __28__IMPlayerItem_loadChapters__block_invoke_3;
                  v42[3] = &unk_1E6E1FF20;
                  v42[4] = v27;
                  v42[5] = v22;
                  v43 = v38;
                  id v44 = v17;
                  v45 = v18;
                  [v27 loadValuesAsynchronouslyForKeys:v19 completionHandler:v42];

                  ++v26;
                }
                while (v24 != v26);
                uint64_t v24 = [v23 countByEnumeratingWithState:&v46 objects:v64 count:16];
              }
              while (v24);
            }

            uint64_t v21 = v37 + 1;
          }
          while (v37 + 1 != v36);
          uint64_t v20 = [obj countByEnumeratingWithState:&v50 objects:v65 count:16];
        }
        while (v20);
      }

      v28 = [*(id *)(a1 + 40) chapterLoadingQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __28__IMPlayerItem_loadChapters__block_invoke_5;
      block[3] = &unk_1E6E1FB70;
      uint64_t v29 = *(void *)(a1 + 40);
      id v40 = v17;
      uint64_t v41 = v29;
      id v30 = v17;
      dispatch_group_notify(v18, v28, block);

      _Block_object_dispose(&v57, 8);
    }
  }
  else
  {
    double v6 = [MEMORY[0x1E4F91F10] sharedLogger];
    objc_msgSend(v6, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/AV/NowPlaying/Models/IMPlayerItem.m", 530, @"Unable to load availableChapterLocales with status: %ld", v2);

    if (v33)
    {
      id v7 = [MEMORY[0x1E4F91F10] sharedLogger];
      uint64_t v8 = [v33 code];
      id v9 = [v33 domain];
      BOOL v10 = [v33 userInfo];
      id v11 = [v10 description];
      [v7 logFile:"/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/AV/NowPlaying/Models/IMPlayerItem.m", 532, @"Error: [%ld %@] %@", v8, v9, v11 lineNumber format];
    }
    [*(id *)(a1 + 40) setAreChaptersLoading:0];
  }
}

void __28__IMPlayerItem_loadChapters__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  double v6 = (objc_class *)MEMORY[0x1E4F1CA20];
  id v7 = a2;
  id obj = (id)[[v6 alloc] initWithLocaleIdentifier:v7];

  if ([*(id *)(a1 + 32) containsObject:obj])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
    *a4 = 1;
  }
}

void __28__IMPlayerItem_loadChapters__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4E78AF0]();
  id v3 = objc_opt_new();
  id v4 = [*(id *)(a1 + 32) commonKey];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F15CD0]];

  double v6 = *(void **)(a1 + 32);
  if (v5)
  {
    id v7 = [v6 extraAttributes];
    uint64_t v8 = [v7 objectForKey:@"HREF"];

    [v3 setType:1];
    if (v8)
    {
      [v3 setMetadataType:2];
      id v9 = [*(id *)(a1 + 32) extraAttributes];
      BOOL v10 = [v9 objectForKey:@"HREF"];

      id v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
      [v3 setExternalURL:v11];

      v12 = [*(id *)(a1 + 32) stringValue];
      id v13 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      uint64_t v14 = [v12 stringByTrimmingCharactersInSet:v13];

      if (v14) {
        v15 = v14;
      }
      else {
        v15 = v10;
      }
      [v3 setTitle:v15];
    }
    else
    {
      [v3 setMetadataType:1];
      BOOL v10 = [*(id *)(a1 + 32) stringValue];
      v18 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      id v19 = [v10 stringByTrimmingCharactersInSet:v18];
      [v3 setTitle:v19];
    }
  }
  else
  {
    uint64_t v16 = [v6 commonKey];
    int v17 = [v16 isEqualToString:*MEMORY[0x1E4F15C98]];

    if (!v17) {
      goto LABEL_16;
    }
    [v3 setType:1];
    [v3 setMetadataType:3];
    BOOL v10 = [*(id *)(a1 + 32) dataValue];
    [v3 setArtworkData:v10];
  }

  memset(v37, 0, sizeof(v37));
  long long v36 = 0u;
  uint64_t v20 = *(void **)(a1 + 40);
  if (v20) {
    [v20 timeRange];
  }
  CMTime time = *(CMTime *)((char *)v37 + 8);
  long long v34 = v36;
  uint64_t v35 = *(void *)&v37[0];
  [v3 setDuration:CMTimeGetSeconds(&time)];
  [v3 duration];
  if (v21 >= 0.05)
  {
    if ([v3 metadataType] != 1
      || ([v3 title],
          v22 = objc_claimAutoreleasedReturnValue(),
          uint64_t v23 = [v22 length],
          v22,
          v23))
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __28__IMPlayerItem_loadChapters__block_invoke_4;
      block[3] = &unk_1E6E1FEF8;
      uint64_t v24 = *(NSObject **)(a1 + 48);
      id v26 = *(id *)(a1 + 56);
      id v27 = v3;
      long long v28 = v34;
      uint64_t v29 = v35;
      long long v30 = v36;
      long long v31 = v37[0];
      long long v32 = v37[1];
      dispatch_sync(v24, block);
    }
  }
LABEL_16:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

uint64_t __28__IMPlayerItem_loadChapters__block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 40);
    long long v8 = *(_OWORD *)(a1 + 48);
    *(void *)&long long v9 = *(void *)(a1 + 64);
    [v3 setTime:CMTimeGetSeconds((CMTime *)&v8)];
    id v4 = *(void **)(a1 + 40);
    long long v5 = *(_OWORD *)(a1 + 88);
    long long v8 = *(_OWORD *)(a1 + 72);
    long long v9 = v5;
    long long v10 = *(_OWORD *)(a1 + 104);
    [v4 setMediaTimeRange:&v8];
    double v6 = *(void **)(a1 + 40);
    long long v7 = *(_OWORD *)(a1 + 88);
    long long v8 = *(_OWORD *)(a1 + 72);
    long long v9 = v7;
    long long v10 = *(_OWORD *)(a1 + 104);
    [v6 setAssetTimeRange:&v8];
    return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  }
  return result;
}

void __28__IMPlayerItem_loadChapters__block_invoke_5(uint64_t a1)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"metadataType=%d", 1);
  id v4 = [v2 filteredArrayUsingPredicate:v3];

  long long v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_84];

  long long v73 = 0u;
  long long v72 = 0u;
  long long v71 = 0u;
  long long v70 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
  if (!v6)
  {
    long long v8 = 0;
    goto LABEL_24;
  }
  uint64_t v7 = v6;
  long long v8 = 0;
  uint64_t v9 = *(void *)v71;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      id v11 = v8;
      if (*(void *)v71 != v9) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v70 + 1) + 8 * i);
      long long v8 = objc_opt_new();
      [*(id *)(a1 + 32) addObject:v8];
      [v8 setType:0];
      [v12 time];
      objc_msgSend(v8, "setTime:");
      [v12 duration];
      objc_msgSend(v8, "setDuration:");
      if (v12)
      {
        [v12 mediaTimeRange];
        long long v64 = v67;
        long long v65 = v68;
        long long v66 = v69;
        [v8 setMediaTimeRange:&v64];
        [v12 assetTimeRange];
      }
      else
      {
        long long v69 = 0u;
        long long v68 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        [v8 setMediaTimeRange:&v64];
        long long v63 = 0u;
        long long v62 = 0u;
        long long v61 = 0u;
      }
      v60[0] = v61;
      v60[1] = v62;
      v60[2] = v63;
      [v8 setAssetTimeRange:v60];
      id v13 = [v12 title];
      [v8 setTitle:v13];

      if (v11)
      {
        memset(&v50, 0, sizeof(v50));
        if (v12)
        {
          [v12 mediaTimeRange];
        }
        else
        {
          long long v45 = 0u;
          long long v46 = 0u;
          long long v44 = 0u;
        }
        *(_OWORD *)&lhs.value = v44;
        lhs.epoch = v45;
        [v11 mediaTimeRange];
        CMTime rhs = v42;
        CMTimeSubtract(&v50, &lhs, &rhs);
        CMTime time = v50;
        [v11 setDuration:CMTimeGetSeconds(&time)];
        [v11 mediaTimeRange];
        CMTime start = v38;
        CMTime time = v50;
        CMTimeRangeMake(&v40, &start, &time);
        CMTimeRange v37 = v40;
        [v11 setAssetTimeRange:&v37];
        CMTimeRange v36 = v40;
        v18 = &v36;
        id v19 = v11;
      }
      else
      {
        [v8 time];
        if (v14 == 0.0) {
          goto LABEL_20;
        }
        [v8 time];
        double v16 = v15;
        [v8 duration];
        [v8 setDuration:v16 + v17];
        [v8 setTime:0.0];
        if (v8)
        {
          [v8 mediaTimeRange];
          CMTime v57 = *(CMTime *)&v56[1];
          [v8 mediaTimeRange];
        }
        else
        {
          memset(v56, 0, sizeof(v56));
          long long v55 = 0u;
          *(_OWORD *)&v57.value = *(_OWORD *)&v56[1];
          v57.epoch = 0;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
        }
        *(_OWORD *)&v54.value = v51;
        v54.epoch = v52;
        CMTimeAdd(&duration, &v57, &v54);
        CMTime v50 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        CMTimeRangeMake(&v59, &v50, &duration);
        CMTimeRange v49 = v59;
        [v8 setAssetTimeRange:&v49];
        CMTimeRange v48 = v59;
        v18 = &v48;
        id v19 = v8;
      }
      [v19 setMediaTimeRange:v18];
LABEL_20:
    }
    uint64_t v7 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
  }
  while (v7);
LABEL_24:

  memset(&v50, 0, sizeof(v50));
  [*(id *)(a1 + 40) duration];
  CMTimeMakeWithSeconds(&v35, v20, 1);
  if (v8)
  {
    [v8 mediaTimeRange];
  }
  else
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v31 = 0u;
  }
  *(_OWORD *)&v34.value = v31;
  v34.epoch = v32;
  CMTimeSubtract(&v50, &v35, &v34);
  CMTime time = v50;
  [v8 setDuration:CMTimeGetSeconds(&time)];
  if (v8)
  {
    [v8 mediaTimeRange];
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v26 = 0u;
  }
  *(_OWORD *)&v29.value = v26;
  v29.epoch = v27;
  CMTime time = v50;
  CMTimeRangeMake(&v30, &v29, &time);
  CMTimeRange v25 = v30;
  [v8 setAssetTimeRange:&v25];
  CMTimeRange v24 = v30;
  [v8 setMediaTimeRange:&v24];
  double v21 = [*(id *)(a1 + 32) sortedArrayUsingComparator:&__block_literal_global_86];
  [*(id *)(a1 + 40) setChapters:v21];

  [*(id *)(a1 + 40) setAreChaptersLoading:0];
  [*(id *)(a1 + 40) setAreChaptersLoaded:1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__IMPlayerItem_loadChapters__block_invoke_8;
  block[3] = &unk_1E6E1FAA8;
  void block[4] = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __28__IMPlayerItem_loadChapters__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 time];
  double v7 = v6;
  [v5 time];
  if (v7 >= v8)
  {
    [v4 time];
    double v11 = v10;
    [v5 time];
    uint64_t v9 = v11 > v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

uint64_t __28__IMPlayerItem_loadChapters__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v4)
  {
    [v4 mediaTimeRange];
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v18 = 0u;
  }
  *(_OWORD *)&time1.value = v18;
  time1.epoch = v19;
  if (v5)
  {
    [v5 mediaTimeRange];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
  }
  *(_OWORD *)&time2.value = v14;
  time2.epoch = v15;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    uint64_t v6 = -1;
  }
  else
  {
    if (v4)
    {
      [v4 mediaTimeRange];
    }
    else
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v10 = 0u;
    }
    *(_OWORD *)&v13.value = v10;
    v13.epoch = v11;
    if (v5) {
      [v5 mediaTimeRange];
    }
    else {
      memset(&v8, 0, sizeof(v8));
    }
    CMTime v9 = v8;
    uint64_t v6 = CMTimeCompare(&v13, &v9) > 0;
  }

  return v6;
}

void __28__IMPlayerItem_loadChapters__block_invoke_8(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"IMMediaItemDidLoadChaptersNotification" object:*(void *)(a1 + 32)];
}

- (void)updateTranscriptInformation:(id)a3 transcriptSource:(id)a4
{
  objc_storeStrong((id *)&self->_transcriptIdentifier, a3);
  id v7 = a3;
  id v8 = a4;
  CMTime v9 = [(MPNowPlayingContentItem *)self->_contentItem userInfo];
  id v10 = (id)[v9 mutableCopy];

  [v10 setObject:self->_transcriptIdentifier forKeyedSubscript:*MEMORY[0x1E4F31768]];
  [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F31770]];

  [(MPNowPlayingContentItem *)self->_contentItem setUserInfo:v10];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
}

- (void)setIsVideo:(BOOL)a3
{
  self->_BOOL video = a3;
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (void)setPodcastUuid:(id)a3
{
}

- (NSString)podcastFeedUrl
{
  return self->_podcastFeedUrl;
}

- (void)setPodcastFeedUrl:(id)a3
{
}

- (NSURL)podcastShareUrl
{
  return self->_podcastShareUrl;
}

- (void)setPodcastShareUrl:(id)a3
{
}

- (int64_t)podcastStoreId
{
  return self->_podcastStoreId;
}

- (void)setPodcastStoreId:(int64_t)a3
{
  self->_podcastStoreId = a3;
}

- (NSURL)artworkUrl
{
  return self->_artworkUrl;
}

- (void)setArtworkUrl:(id)a3
{
}

- (BOOL)isNotSubscribeable
{
  return self->_isNotSubscribeable;
}

- (void)setIsNotSubscribeable:(BOOL)a3
{
  self->_isNotSubscribeable = a3;
}

- (BOOL)enqueuedByAnotherUser
{
  return self->_enqueuedByAnotherUser;
}

- (void)setEnqueuedByAnotherUser:(BOOL)a3
{
  self->_enqueuedByAnotherUser = a3;
}

- (NSString)episodeUuid
{
  return self->_episodeUuid;
}

- (void)setEpisodeUuid:(id)a3
{
}

- (NSString)episodeGuid
{
  return self->_episodeGuid;
}

- (void)setEpisodeGuid:(id)a3
{
}

- (int64_t)episodeStoreId
{
  return self->_episodeStoreId;
}

- (void)setEpisodeStoreId:(int64_t)a3
{
  self->_episodeStoreId = a3;
}

- (int64_t)episodePID
{
  return self->_episodePID;
}

- (void)setEpisodePID:(int64_t)a3
{
  self->_episodePID = a3;
}

- (NSDate)pubDate
{
  return self->_pubDate;
}

- (void)setPubDate:(id)a3
{
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)itemDescription
{
  return self->_itemDescription;
}

- (void)setItemDescription:(id)a3
{
}

- (NSURL)episodeShareUrl
{
  return self->_episodeShareUrl;
}

- (void)setEpisodeShareUrl:(id)a3
{
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (void)setIsExplicit:(BOOL)a3
{
  self->_isExplicit = a3;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (MTEpisode)episode
{
  return self->_episode;
}

- (int64_t)seasonNumber
{
  return self->_seasonNumber;
}

- (void)setSeasonNumber:(int64_t)a3
{
  self->_seasonNumber = a3;
}

- (int64_t)episodeNumber
{
  return self->_episodeNumber;
}

- (void)setEpisodeNumber:(int64_t)a3
{
  self->_episodeNumber = a3;
}

- (int64_t)episodeType
{
  return self->_episodeType;
}

- (void)setEpisodeType:(int64_t)a3
{
  self->_episodeType = a3;
}

- (BOOL)podcastIsSerial
{
  return self->_podcastIsSerial;
}

- (void)setPodcastIsSerial:(BOOL)a3
{
  self->_podcastIsSerial = a3;
}

- (NSString)priceType
{
  return self->_priceType;
}

- (void)setPriceType:(id)a3
{
}

- (BOOL)paidSubscriptionActive
{
  return self->_paidSubscriptionActive;
}

- (void)setPaidSubscriptionActive:(BOOL)a3
{
  self->_paidSubscriptionActive = a3;
}

- (NSURL)alternatePaidURL
{
  return self->_alternatePaidURL;
}

- (void)setAlternatePaidURL:(id)a3
{
}

- (NSString)podcastDisplayType
{
  return self->_podcastDisplayType;
}

- (void)setPodcastDisplayType:(id)a3
{
}

- (int64_t)channelStoreId
{
  return self->_channelStoreId;
}

- (void)setChannelStoreId:(int64_t)a3
{
  self->_channelStoreId = a3;
}

- (BOOL)isEntitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (IMAVSecureKeyLoader)secureKeyLoader
{
  return self->_secureKeyLoader;
}

- (void)setSecureKeyLoader:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void)setDuration:(double)a3
{
  self->_CMTime duration = a3;
}

- (double)playhead
{
  return self->_playhead;
}

- (int64_t)playCount
{
  return self->_playCount;
}

- (void)setPlayCount:(int64_t)a3
{
  self->_playCount = a3;
}

- (void)setChapters:(id)a3
{
}

- (BOOL)areChaptersLoaded
{
  return self->_areChaptersLoaded;
}

- (void)setAreChaptersLoaded:(BOOL)a3
{
  self->_areChaptersLoaded = a3;
}

- (IMPlayerManifest)manifest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manifest);

  return (IMPlayerManifest *)WeakRetained;
}

- (void)setManifest:(id)a3
{
}

- (unint64_t)manifestIndex
{
  return self->_manifestIndex;
}

- (void)setManifestIndex:(unint64_t)a3
{
  self->_manifestIndex = a3;
}

- (NSUUID)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (int64_t)editingStyleFlags
{
  return self->_editingStyleFlags;
}

- (void)setEditingStyleFlags:(int64_t)a3
{
  self->_editingStyleFlags = a3;
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (void)setArtworkCatalog:(id)a3
{
}

- (IMPlayerArtwork)uberArtworkProperties
{
  return self->_uberArtworkProperties;
}

- (void)setUberArtworkProperties:(id)a3
{
}

- (IMPlayerArtwork)showArtworkProperties
{
  return self->_showArtworkProperties;
}

- (void)setShowArtworkProperties:(id)a3
{
}

- (IMPlayerArtwork)episodeArtworkProperties
{
  return self->_episodeArtworkProperties;
}

- (void)setEpisodeArtworkProperties:(id)a3
{
}

- (BOOL)isAppleMusicEpisode
{
  return self->_isAppleMusicEpisode;
}

- (void)setIsAppleMusicEpisode:(BOOL)a3
{
  self->_isAppleMusicEpisode = a3;
}

- (BOOL)isAppleNewsEpisode
{
  return self->_isAppleNewsEpisode;
}

- (void)setIsAppleNewsEpisode:(BOOL)a3
{
  self->_isAppleNewsEpisode = a3;
}

- (NSString)transcriptSource
{
  return self->_transcriptSource;
}

- (void)setTranscriptSource:(id)a3
{
}

- (NSString)transcriptIdentifier
{
  return self->_transcriptIdentifier;
}

- (void)setTranscriptIdentifier:(id)a3
{
}

- (BOOL)areChaptersLoading
{
  return self->_areChaptersLoading;
}

- (void)setAreChaptersLoading:(BOOL)a3
{
  self->_areChaptersLoading = a3;
}

- (OS_dispatch_queue)chapterLoadingQueue
{
  return self->_chapterLoadingQueue;
}

- (void)setChapterLoadingQueue:(id)a3
{
}

- (void)setContentItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItem, 0);
  objc_storeStrong((id *)&self->_chapterLoadingQueue, 0);
  objc_storeStrong((id *)&self->_transcriptIdentifier, 0);
  objc_storeStrong((id *)&self->_transcriptSource, 0);
  objc_storeStrong((id *)&self->_episodeArtworkProperties, 0);
  objc_storeStrong((id *)&self->_showArtworkProperties, 0);
  objc_storeStrong((id *)&self->_uberArtworkProperties, 0);
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);
  objc_destroyWeak((id *)&self->_manifest);
  objc_storeStrong((id *)&self->_chapters, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_secureKeyLoader, 0);
  objc_storeStrong((id *)&self->_podcastDisplayType, 0);
  objc_storeStrong((id *)&self->_alternatePaidURL, 0);
  objc_storeStrong((id *)&self->_priceType, 0);
  objc_storeStrong((id *)&self->_episode, 0);
  objc_storeStrong((id *)&self->_episodeShareUrl, 0);
  objc_storeStrong((id *)&self->_itemDescription, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_pubDate, 0);
  objc_storeStrong((id *)&self->_episodeGuid, 0);
  objc_storeStrong((id *)&self->_episodeUuid, 0);
  objc_storeStrong((id *)&self->_artworkUrl, 0);
  objc_storeStrong((id *)&self->_podcastShareUrl, 0);
  objc_storeStrong((id *)&self->_podcastFeedUrl, 0);
  objc_storeStrong((id *)&self->_podcastUuid, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_episodeObjectID, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

- (IMPlayerItem)initWithEpisode:(id)a3
{
  return (IMPlayerItem *)IMPlayerItem.init(episode:)(a3);
}

- (void)populateContentItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  IMPlayerItem.populateContentItem(_:)(v4);
}

@end