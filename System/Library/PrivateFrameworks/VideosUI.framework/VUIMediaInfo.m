@interface VUIMediaInfo
+ (id)_playbackOverridesForURL:(id)a3 adamID:(id)a4 canonicalID:(id)a5;
+ (id)playbackURLOverrideForOriginalURL:(id)a3 adamID:(id)a4 canonicalID:(id)a5;
- (BOOL)allowsPictureInPicture;
- (BOOL)hasProgress;
- (BOOL)isAudioOnly;
- (BOOL)isAutomaticPlaybackStart;
- (BOOL)isAutomaticPlaybackStop;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGradientDisabled;
- (BOOL)overridesStartTimeWithResumeTime;
- (BOOL)restrictionsAlreadyUnlocked;
- (BOOL)shouldDelayLoadingImage;
- (BOOL)showsSecondaryVideoView;
- (NSArray)imageProxies;
- (NSArray)imageThemes;
- (NSArray)videosPlayables;
- (NSString)alphaLayerAccessibilityText;
- (TVPPlaylist)playlist;
- (TVPPlaylist)tvpPlaylist;
- (UIColor)backgroundColor;
- (UIView)contentView;
- (UIView)overlayView;
- (VUIAppContext)appContext;
- (VUIImageProxy)alphaImageProxy;
- (VUIMediaInfo)init;
- (VUIMediaInfo)initWithPlaybackContext:(unint64_t)a3 mpMediaItems:(id)a4;
- (VUIMediaInfo)initWithPlaybackContext:(unint64_t)a3 sidebandLibraryAdamIDs:(id)a4;
- (VUIMediaInfo)initWithPlaybackContext:(unint64_t)a3 storeAuxMediaItem:(id)a4;
- (VUIMediaInfo)initWithPlaybackContext:(unint64_t)a3 videosPlayables:(id)a4 imageProxies:(id)a5 storeDictionary:(id)a6;
- (VUIMediaInfo)initWithPlaybackContext:(unint64_t)a3 vuiMediaItems:(id)a4;
- (double)playbackDelayInterval;
- (double)primaryVideoAspectRatio;
- (id)_auxMediaItemFromVideosPlayable:(id)a3;
- (id)_hlsURLEnsuringDsidQueryParamIsPresentFromURL:(id)a3;
- (id)_mediaItemForSidebandLibraryAdamID:(id)a3;
- (id)_playlistForSidebandLibraryAdamIDs:(id)a3;
- (id)_playlistForVUIMediaItems:(id)a3 playbackContext:(unint64_t)a4;
- (id)_playlistFromMPMediaItems:(id)a3 playbackContext:(unint64_t)a4;
- (id)_playlistFromVideosPlayables:(id)a3 andStoreDictionary:(id)a4;
- (id)_sportingEventSubtitleFromStartTime:(id)a3 endTime:(id)a4 leagueShortName:(id)a5;
- (id)_sportingEventTimeSpanStringFromMediaItem:(id)a3;
- (id)_sportingEventTimeSpanStringFromStartTime:(id)a3 endTime:(id)a4;
- (id)_storeMediaItemFromMPMediaItem:(id)a3 playbackContext:(unint64_t)a4;
- (id)_storeMediaItemFromVideosPlayable:(id)a3 andStoreDictionary:(id)a4;
- (id)_tvpMediaTypeFromPlayable:(id)a3;
- (id)_tvpRatingDomainFromUTSRatingDomain:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)_videoDynamimcRangeFromMPColorCapability:(int64_t)a3;
- (int64_t)_videoResolutionFromMPVideoQuality:(int64_t)a3;
- (unint64_t)hash;
- (unint64_t)intent;
- (unint64_t)playbackContext;
- (unint64_t)playbackStartReason;
- (unint64_t)playbackStopReason;
- (void)_populateMediaItem:(id)a3 withMetadataFromVideosPlayable:(id)a4;
- (void)_populateMediaItem:(id)a3 withMetadataOverrides:(id)a4;
- (void)_populateMediaItem:(id)a3 withOtherMediaItem:(id)a4;
- (void)_populateMediaItem:(id)a3 withResumeTimeInfoFromPlayable:(id)a4;
- (void)_updatePlaybackStartReason;
- (void)_updatePlaybackStopReason;
- (void)setAllowsPictureInPicture:(BOOL)a3;
- (void)setAlphaImageProxy:(id)a3;
- (void)setAlphaLayerAccessibilityText:(id)a3;
- (void)setAppContext:(id)a3;
- (void)setAutomaticPlaybackStart:(BOOL)a3;
- (void)setAutomaticPlaybackStop:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setContentView:(id)a3;
- (void)setGradientDisabled:(BOOL)a3;
- (void)setImageProxies:(id)a3;
- (void)setImageThemes:(id)a3;
- (void)setIntent:(unint64_t)a3;
- (void)setIsAudioOnly:(BOOL)a3;
- (void)setOverlayView:(id)a3;
- (void)setOverridesStartTimeWithResumeTime:(BOOL)a3;
- (void)setPlaybackContext:(unint64_t)a3;
- (void)setPlaybackDelayInterval:(double)a3;
- (void)setPlaybackStartReason:(unint64_t)a3;
- (void)setPlaybackStopReason:(unint64_t)a3;
- (void)setPlaylist:(id)a3;
- (void)setPrimaryVideoAspectRatio:(double)a3;
- (void)setRestrictionsAlreadyUnlocked:(BOOL)a3;
- (void)setShouldDelayLoadingImage:(BOOL)a3;
- (void)setShowsSecondaryVideoView:(BOOL)a3;
- (void)setTvpPlaylist:(id)a3;
- (void)setUserPlaybackInitiationDate:(id)a3 openURLCompletionDate:(id)a4;
- (void)setVideosPlayables:(id)a3;
@end

@implementation VUIMediaInfo

+ (id)playbackURLOverrideForOriginalURL:(id)a3 adamID:(id)a4 canonicalID:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = [a1 _playbackOverridesForURL:v8 adamID:a4 canonicalID:a5];
  v10 = [v9 objectForKey:@"replacementPlaybackURL"];
  if ([v10 length])
  {
    v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v8;
      __int16 v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Overriding original playback URL %@ with replacement playback URL %@", (uint8_t *)&v14, 0x16u);
    }

    v12 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (VUIMediaInfo)init
{
  return [(VUIMediaInfo *)self initWithPlaybackContext:0 videosPlayables:0 imageProxies:0 storeDictionary:0];
}

- (VUIMediaInfo)initWithPlaybackContext:(unint64_t)a3 videosPlayables:(id)a4 imageProxies:(id)a5 storeDictionary:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)VUIMediaInfo;
  int v14 = [(VUIMediaInfo *)&v19 init];
  id v15 = v14;
  if (v14)
  {
    *(_DWORD *)&v14->_automaticPlaybackStart = 0;
    v14->_allowsPictureInPicture = 1;
    v14->_playbackStartReason = 0;
    v14->_playbackStopReason = 0;
    v14->_playbackContext = a3;
    v14->_playbackDelayInterval = 5.0;
    objc_storeStrong((id *)&v14->_videosPlayables, a4);
    if (v12) {
      [(VUIMediaInfo *)v15 setImageProxies:v12];
    }
    if ([v11 count])
    {
      __int16 v16 = [(VUIMediaInfo *)v15 _playlistFromVideosPlayables:v11 andStoreDictionary:v13];
      if (v16)
      {
        [(VUIMediaInfo *)v15 setTvpPlaylist:v16];
        v17 = [MEMORY[0x1E4F1C9C8] date];
        [(VUIMediaInfo *)v15 setUserPlaybackInitiationDate:v17 openURLCompletionDate:0];

        [(VUIMediaInfo *)v15 _updatePlaybackStartReason];
        [(VUIMediaInfo *)v15 _updatePlaybackStopReason];
      }
    }
  }

  return v15;
}

- (VUIMediaInfo)initWithPlaybackContext:(unint64_t)a3 storeAuxMediaItem:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)VUIMediaInfo;
  v7 = [(VUIMediaInfo *)&v19 init];
  id v8 = v7;
  if (v7)
  {
    *(_DWORD *)&v7->_automaticPlaybackStart = 0;
    v7->_allowsPictureInPicture = 1;
    v7->_playbackStartReason = 0;
    v7->_playbackStopReason = 0;
    v7->_playbackContext = a3;
    v7->_playbackDelayInterval = 5.0;
    uint64_t v9 = [MEMORY[0x1E4F1C978] array];
    videosPlayables = v8->_videosPlayables;
    v8->_videosPlayables = (NSArray *)v9;

    if (v6)
    {
      id v11 = [VUIStoreAuxMediaItem alloc];
      id v12 = [v6 mediaItemURL];
      id v13 = [(VUIStoreAuxMediaItem *)v11 initWithURL:v12];

      [(VUIMediaInfo *)v8 _populateMediaItem:v13 withOtherMediaItem:v6];
      id v14 = objc_alloc(MEMORY[0x1E4FA9DA0]);
      v20[0] = v13;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      __int16 v16 = (void *)[v14 initWithMediaItems:v15 index:0 isCollection:0];
      [(VUIMediaInfo *)v8 setTvpPlaylist:v16];

      v17 = [MEMORY[0x1E4F1C9C8] date];
      [(VUIMediaInfo *)v8 setUserPlaybackInitiationDate:v17 openURLCompletionDate:0];

      [(VUIMediaInfo *)v8 _updatePlaybackStartReason];
      [(VUIMediaInfo *)v8 _updatePlaybackStopReason];
    }
  }

  return v8;
}

- (VUIMediaInfo)initWithPlaybackContext:(unint64_t)a3 sidebandLibraryAdamIDs:(id)a4
{
  id v6 = a4;
  v7 = [(VUIMediaInfo *)self initWithPlaybackContext:a3 videosPlayables:0 imageProxies:0 storeDictionary:0];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(VUIMediaInfo *)v7 _playlistForSidebandLibraryAdamIDs:v6];
    if (v9)
    {
      [(VUIMediaInfo *)v8 setTvpPlaylist:v9];
      v10 = [MEMORY[0x1E4F1C9C8] date];
      [(VUIMediaInfo *)v8 setUserPlaybackInitiationDate:v10 openURLCompletionDate:0];

      [(VUIMediaInfo *)v8 _updatePlaybackStartReason];
    }
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setIntent:", -[VUIMediaInfo intent](self, "intent"));
  v5 = [(VUIMediaInfo *)self overlayView];
  [v4 setOverlayView:v5];

  id v6 = [(VUIMediaInfo *)self contentView];
  [v4 setContentView:v6];

  v7 = [(VUIMediaInfo *)self imageProxies];
  [v4 setImageProxies:v7];

  id v8 = [(VUIMediaInfo *)self backgroundColor];
  [v4 setBackgroundColor:v8];

  uint64_t v9 = [(VUIMediaInfo *)self tvpPlaylist];
  [v4 setTvpPlaylist:v9];

  objc_msgSend(v4, "setShowsSecondaryVideoView:", -[VUIMediaInfo showsSecondaryVideoView](self, "showsSecondaryVideoView"));
  objc_msgSend(v4, "setIsAudioOnly:", -[VUIMediaInfo isAudioOnly](self, "isAudioOnly"));
  objc_msgSend(v4, "setRestrictionsAlreadyUnlocked:", -[VUIMediaInfo restrictionsAlreadyUnlocked](self, "restrictionsAlreadyUnlocked"));
  objc_msgSend(v4, "setShouldDelayLoadingImage:", -[VUIMediaInfo shouldDelayLoadingImage](self, "shouldDelayLoadingImage"));
  objc_msgSend(v4, "setPlaybackContext:", -[VUIMediaInfo playbackContext](self, "playbackContext"));
  [(VUIMediaInfo *)self playbackDelayInterval];
  objc_msgSend(v4, "setPlaybackDelayInterval:");
  v10 = [(VUIMediaInfo *)self alphaImageProxy];
  id v11 = (void *)[v10 copy];
  [v4 setAlphaImageProxy:v11];

  id v12 = [(VUIMediaInfo *)self alphaLayerAccessibilityText];
  id v13 = (void *)[v12 copy];
  [v4 setAlphaLayerAccessibilityText:v13];

  id v14 = [(VUIMediaInfo *)self videosPlayables];
  id v15 = (void *)[v14 copy];
  [v4 setVideosPlayables:v15];

  return v4;
}

- (unint64_t)hash
{
  v3 = [(VUIMediaInfo *)self overlayView];
  uint64_t v4 = [v3 hash];

  v5 = [(VUIMediaInfo *)self imageProxies];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(VUIMediaInfo *)self tvpPlaylist];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  uint64_t v6 = v5;
  if (v6 != self)
  {
    v7 = [(VUIMediaInfo *)self imageProxies];
    unint64_t v8 = [(VUIMediaInfo *)v6 imageProxies];
    if (![v7 isEqual:v8])
    {
      BOOL v15 = 0;
LABEL_24:

      goto LABEL_25;
    }
    uint64_t v9 = [(VUIMediaInfo *)self tvpPlaylist];
    v10 = [(VUIMediaInfo *)v6 tvpPlaylist];
    if (![v9 isEqualToPlaylist:v10]
      || (unint64_t v11 = [(VUIMediaInfo *)self intent], v11 != [(VUIMediaInfo *)v6 intent]))
    {
      BOOL v15 = 0;
LABEL_23:

      goto LABEL_24;
    }
    id v12 = [(VUIMediaInfo *)self playlist];
    id v13 = [(VUIMediaInfo *)v6 playlist];
    if (v12 != v13)
    {
      id v14 = [(VUIMediaInfo *)self playlist];
      v34 = [(VUIMediaInfo *)v6 playlist];
      if (!objc_msgSend(v14, "isEqual:"))
      {
        BOOL v15 = 0;
        goto LABEL_21;
      }
      v33 = v14;
    }
    __int16 v16 = [(VUIMediaInfo *)self overlayView];
    v17 = [(VUIMediaInfo *)v6 overlayView];
    if (v16 != v17)
    {

LABEL_19:
      BOOL v15 = 0;
      goto LABEL_20;
    }
    v32 = v16;
    uint64_t v18 = [(VUIMediaInfo *)self contentView];
    objc_super v19 = [(VUIMediaInfo *)v6 contentView];
    if (v18 != v19)
    {

      goto LABEL_19;
    }
    v29 = v18;
    uint64_t v21 = [(VUIMediaInfo *)self imageProxies];
    v30 = [(VUIMediaInfo *)v6 imageProxies];
    v31 = (void *)v21;
    if ((void *)v21 == v30) {
      goto LABEL_30;
    }
    uint64_t v22 = [(VUIMediaInfo *)v6 imageProxies];
    if (!v22)
    {
      BOOL v15 = 0;
      goto LABEL_33;
    }
    v28 = (void *)v22;
    v23 = [(VUIMediaInfo *)self imageProxies];
    v26 = [(VUIMediaInfo *)v6 imageProxies];
    v27 = v23;
    if ([v23 isEqualToArray:v26])
    {
LABEL_30:
      v24 = [(VUIMediaInfo *)self backgroundColor];
      v25 = [(VUIMediaInfo *)v6 backgroundColor];
      BOOL v15 = v24 == v25;

      if (v31 == v30)
      {
LABEL_33:

LABEL_20:
        id v14 = v33;
        if (v12 == v13)
        {
LABEL_22:

          goto LABEL_23;
        }
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      BOOL v15 = 0;
    }

    goto LABEL_33;
  }
  BOOL v15 = 1;
LABEL_25:

  return v15;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(VUIMediaInfo *)self intent];
  v7 = [(VUIMediaInfo *)self overlayView];
  unint64_t v8 = [(VUIMediaInfo *)self contentView];
  uint64_t v9 = [(VUIMediaInfo *)self backgroundColor];
  v10 = [(VUIMediaInfo *)self playlist];
  unint64_t v11 = [(VUIMediaInfo *)self imageProxies];
  id v12 = [v3 stringWithFormat:@"<%@: %p> Intent = %lu, overlayView = %@, contentView = %@, backgroundColor = %@, playlist = %@, imageProxies = %@, , playbackContext = %ld", v5, self, v6, v7, v8, v9, v10, v11, -[VUIMediaInfo playbackContext](self, "playbackContext")];

  return v12;
}

- (void)setUserPlaybackInitiationDate:(id)a3 openURLCompletionDate:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  v7 = [(VUIMediaInfo *)self tvpPlaylist];
  unint64_t v8 = [v7 currentMediaItem];

  uint64_t v9 = [v8 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  if (!v14)
  {
    id v14 = [MEMORY[0x1E4F1C9C8] date];
  }
  [v9 addOrReplaceStartEventWithName:*MEMORY[0x1E4FAA370] date:v14];
  [v9 addOrReplaceStartEventWithName:*MEMORY[0x1E4FAA388] date:v14];
  if (v6)
  {
    v10 = (uint64_t *)MEMORY[0x1E4FAA340];
    [v9 addOrReplaceStartEventWithName:*MEMORY[0x1E4FAA340] date:v14];
    uint64_t v11 = *v10;
    id v12 = (void *)MEMORY[0x1E4F28ED0];
    [v6 timeIntervalSinceReferenceDate];
    id v13 = objc_msgSend(v12, "numberWithDouble:");
    [v9 addEndEventWithName:v11 identifier:v11 timestamp:v13];
  }
}

- (void)_updatePlaybackStartReason
{
  switch([(VUIMediaInfo *)self playbackContext])
  {
    case 1uLL:
      id v4 = (__CFString *)(id)*MEMORY[0x1E4FAA2A0];
      goto LABEL_5;
    case 2uLL:
      unint64_t v8 = (__CFString *)(id)*MEMORY[0x1E4FAA2A8];
      uint64_t v3 = 2;
      break;
    case 3uLL:
      unint64_t v8 = (__CFString *)(id)*MEMORY[0x1E4FAA280];
      uint64_t v3 = 5;
      break;
    case 4uLL:
      unint64_t v8 = (__CFString *)(id)*MEMORY[0x1E4FAA278];
      uint64_t v3 = 6;
      break;
    case 5uLL:
      unint64_t v8 = (__CFString *)(id)*MEMORY[0x1E4FAA288];
      uint64_t v3 = 7;
      break;
    case 6uLL:
      unint64_t v8 = @"Unknown";
      uint64_t v3 = 1;
      break;
    case 7uLL:
      unint64_t v8 = (__CFString *)(id)*MEMORY[0x1E4FAA290];
      uint64_t v3 = 8;
      break;
    case 8uLL:
      unint64_t v8 = @"CatchUpToLive";
      uint64_t v3 = 9;
      break;
    case 9uLL:
    case 10uLL:
    case 11uLL:
      unint64_t v8 = (__CFString *)(id)*MEMORY[0x1E4FAA298];
      uint64_t v3 = 3;
      break;
    default:
      id v4 = @"Unknown";
LABEL_5:
      unint64_t v8 = v4;
      uint64_t v3 = 4;
      break;
  }
  [(VUIMediaInfo *)self setPlaybackStartReason:v3];
  v5 = [(VUIMediaInfo *)self tvpPlaylist];
  id v6 = [v5 currentMediaItem];

  v7 = [v6 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA148]];
  [v7 addSingleShotEventWithName:*MEMORY[0x1E4FAA348] value:v8];
}

- (void)_updatePlaybackStopReason
{
  unint64_t v3 = [(VUIMediaInfo *)self playbackContext] - 8;
  if (v3 > 3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_1E38FE190[v3];
  }
  [(VUIMediaInfo *)self setPlaybackStopReason:v4];
}

- (id)_tvpRatingDomainFromUTSRatingDomain:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Movie"])
  {
    uint64_t v4 = (id *)MEMORY[0x1E4FA9E50];
LABEL_5:
    id v5 = *v4;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"Show"])
  {
    uint64_t v4 = (id *)MEMORY[0x1E4FA9E58];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (id)_playlistFromVideosPlayables:(id)a3 andStoreDictionary:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v29 = a4;
  if ([v6 count])
  {
    v32 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v28 = v6;
    id obj = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (!v7) {
      goto LABEL_25;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    uint64_t v31 = *MEMORY[0x1E4FA9F88];
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (!objc_msgSend(v11, "isiTunesPurchaseOrRental", v28)) {
          goto LABEL_12;
        }
        if ([v11 isFamilySharingContent])
        {
          id v12 = VUIDefaultLogObject();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Media item is a family sharing purchase.  Using aux media item for playback", buf, 2u);
          }

LABEL_12:
          int v13 = 0;
          goto LABEL_14;
        }
        int v13 = 1;
LABEL_14:
        id v14 = objc_opt_class();
        BOOL v15 = [v11 playbackURL];
        __int16 v16 = [v11 adamID];
        v17 = [v11 canonicalID];
        uint64_t v18 = [v14 _playbackOverridesForURL:v15 adamID:v16 canonicalID:v17];

        if (v18)
        {
          objc_super v19 = VUIDefaultLogObject();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = [v11 adamID];
            uint64_t v21 = [v11 playbackURL];
            uint64_t v22 = [v11 canonicalID];
            *(_DWORD *)buf = 138412802;
            v38 = v20;
            __int16 v39 = 2112;
            v40 = v21;
            __int16 v41 = 2112;
            v42 = v22;
            _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, "Will use aux media item and override playback metadata for adam ID %@ URL %@ canonical ID %@", buf, 0x20u);
          }
        }
        else if (v13)
        {
          uint64_t v23 = [(VUIMediaInfo *)self _storeMediaItemFromVideosPlayable:v11 andStoreDictionary:v29];
          goto LABEL_21;
        }
        uint64_t v23 = [(VUIMediaInfo *)self _auxMediaItemFromVideosPlayable:v11];
LABEL_21:
        v24 = (void *)v23;
        if (v23)
        {
          v25 = [(VUIMediaInfo *)self _sportingEventTimeSpanStringFromMediaItem:v23];
          [v24 setMediaItemMetadata:v25 forProperty:v31];
          [v32 addObject:v24];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
      if (!v8)
      {
LABEL_25:

        if ([v32 count]) {
          v26 = (void *)[objc_alloc(MEMORY[0x1E4FA9DA0]) initWithMediaItems:v32 index:0 isCollection:0];
        }
        else {
          v26 = 0;
        }

        id v6 = v28;
        goto LABEL_30;
      }
    }
  }
  v26 = 0;
LABEL_30:

  return v26;
}

- (id)_storeMediaItemFromVideosPlayable:(id)a3 andStoreDictionary:(id)a4
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 adamID];
    uint64_t v7 = [v6 longLongValue];
    if (v7)
    {
      uint64_t v8 = v7;
      v83 = [v5 canonicalID];
      uint64_t v9 = VUIDefaultLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Support for in-app downloads is enabled.  Looking for downloading or downloaded content to play", buf, 2u);
      }

      v10 = +[VUIDownloadManager sharedInstance];
      uint64_t v11 = [v10 existingDownloadForAdamID:v6];

      if (v11)
      {
        id v12 = [v11 mediaItem];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v13 = v12;
          [(VUIStoreMediaItem_iOS *)v13 resetReportingEventCollection];
        }
        else
        {
          int v13 = 0;
        }
        v17 = VUIDefaultLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v86 = v13;
          _os_log_impl(&dword_1E2BD7000, v17, OS_LOG_TYPE_DEFAULT, "Using existing media item being downloaded: %@", buf, 0xCu);
        }
      }
      else
      {
        id v14 = +[VUIMediaLibraryManager defaultManager];
        BOOL v15 = [v14 sidebandMediaLibrary];
        id v12 = [v15 videoForAdamID:v6 useMainThreadContext:1];

        if (v12 && [(VUIStoreMediaItem_iOS *)v12 downloadState] == 2)
        {
          __int16 v16 = VUIDefaultLogObject();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v12;
            _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "Item is downloaded.  Using videoManagedObject when creating media item: %@", buf, 0xCu);
          }

          int v13 = [[VUIStoreMediaItem_iOS alloc] initWithAdamID:v8 videoManagedObject:v12 isForStartingDownload:0];
        }
        else
        {
          int v13 = 0;
        }
      }

      if (!v13)
      {
        v65 = v11;
        int v13 = [[VUIStoreMediaItem_iOS alloc] initWithAdamID:v8 videoManagedObject:0 isForStartingDownload:0];
        uint64_t v18 = [v5 hlsURL];
        v81 = [v5 buyParams];
        uint64_t v19 = [v5 fpsCertificateURL];
        uint64_t v20 = [v5 fpsKeyServerURL];
        v75 = [v5 fpsAdditionalServerParams];
        v66 = [v5 rentalID];
        uint64_t v21 = [v5 metadata];
        v82 = [v21 rentalStartedWatchingTimestamp];

        v80 = [v5 referenceID];
        v79 = [v5 showCanonicalID];
        uint64_t v57 = [v5 seasonCanonicalID];
        v78 = [v5 vpafMetrics];
        uint64_t v22 = [v5 metadata];
        unsigned int v60 = [v22 isAdultContent];

        uint64_t v23 = [v5 metadata];
        v77 = [v23 commonSenseRecommendedAge];

        v24 = [v5 metadata];
        v76 = [v24 hasADLocales];

        v25 = [v5 metadata];
        uint64_t v26 = [v25 hasSDHLocales];

        v27 = [v5 metadata];
        v68 = [v27 hasDolbyAtmos];

        v74 = [v5 requiredAgeForPlayback];
        v73 = [v5 frequencyOfAgeConfirmation];
        v72 = [v5 mediaMetrics];
        v71 = [v5 tvAppDeeplinkURL];
        id v28 = [v5 metadata];
        v70 = [v28 showTitle];

        id v29 = [v5 metadata];
        v69 = [v29 seasonNumber];

        v30 = [v5 metadata];
        uint64_t v56 = [v30 episodeNumber];

        uint64_t v31 = [v5 metadata];
        uint64_t v32 = [v31 videoResolutionClass];

        long long v33 = [v5 metadata];
        uint64_t v34 = [v33 mediaShareMetadata];

        long long v35 = [v5 metadata];
        v67 = [v35 showMediaShareMetadata];

        v63 = (void *)v18;
        uint64_t v36 = v18;
        v37 = v66;
        [(VUIStoreMediaItem_iOS *)v13 setHlsPlaybackURL:v36];
        v64 = (void *)v19;
        [(VUIStoreMediaItem_iOS *)v13 setFpsCertificateURL:v19];
        v62 = (void *)v20;
        [(VUIStoreMediaItem_iOS *)v13 setFpsKeyServerURL:v20];
        [(VUIStoreMediaItem_iOS *)v13 setFpsAdditionalServerParams:v75];
        [(VUIStoreMediaItem_iOS *)v13 setPlaybackContext:[(VUIMediaInfo *)self playbackContext]];
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v6 forProperty:*MEMORY[0x1E4FAA0D8]];
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v81 forProperty:*MEMORY[0x1E4FA9E20]];
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v83 forProperty:*MEMORY[0x1E4FA9E28]];
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v80 forProperty:*MEMORY[0x1E4FAA008]];
        v38 = (void *)v57;
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v79 forProperty:*MEMORY[0x1E4FAA080]];
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v57 forProperty:*MEMORY[0x1E4FAA058]];
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v78 forProperty:*MEMORY[0x1E4FAA108]];
        __int16 v39 = [MEMORY[0x1E4F28ED0] numberWithBool:v60];
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v39 forProperty:*MEMORY[0x1E4FA9F70]];

        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v77 forProperty:*MEMORY[0x1E4FA9E38]];
        v61 = (void *)v26;
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v26 forProperty:*MEMORY[0x1E4FA9F50]];
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v76 forProperty:*MEMORY[0x1E4FA9F40]];
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v68 forProperty:*MEMORY[0x1E4FA9F48]];
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v74 forProperty:*MEMORY[0x1E4FAA030]];
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v73 forProperty:*MEMORY[0x1E4FA9F18]];
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v72 forProperty:*MEMORY[0x1E4FA9FA8]];
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v71 forProperty:@"VUIContentMetadataDeepLinkURL"];
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v70 forProperty:*MEMORY[0x1E4FAA068]];
        v40 = (void *)v56;
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v69 forProperty:*MEMORY[0x1E4FAA060]];
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v56 forProperty:*MEMORY[0x1E4FA9EC0]];
        v59 = (void *)v32;
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v32 forProperty:*MEMORY[0x1E4FAA118]];
        v58 = (void *)v34;
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v34 forProperty:@"mediaShareMetadata"];
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v67 forProperty:@"showMediaShareMetadata"];
        if (v66 && ([v66 isEqual:&unk_1F3F3D268] & 1) == 0) {
          [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v66 forProperty:*MEMORY[0x1E4FAA018]];
        }
        if (v82)
        {
          id v41 = objc_alloc_init(MEMORY[0x1E4F28C10]);
          [v41 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];
          v42 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
          [v41 setTimeZone:v42];

          v43 = [v41 dateFromString:v82];
          if (v43) {
            [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v43 forProperty:*MEMORY[0x1E4FAA028]];
          }
        }
        uint64_t v44 = *MEMORY[0x1E4FA9E60];
        v45 = -[VUIStoreMediaItem_iOS mediaItemMetadataForProperty:](v13, "mediaItemMetadataForProperty:", *MEMORY[0x1E4FA9E60], v56);
        if (!v45)
        {
          v46 = [v5 metadata];
          v47 = [v46 ratingValue];

          [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v47 forProperty:v44];
        }
        v48 = [v5 metadata];
        v49 = [v48 ratingDomain];

        v50 = [(VUIMediaInfo *)self _tvpRatingDomainFromUTSRatingDomain:v49];
        [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v50 forProperty:*MEMORY[0x1E4FA9E48]];

        uint64_t v51 = *MEMORY[0x1E4FA9FB0];
        v52 = [(VUIStoreMediaItem_iOS *)v13 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
        if (![v52 length])
        {
          v53 = [(VUIMediaInfo *)self _tvpMediaTypeFromPlayable:v5];
          [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v53 forProperty:v51];

          v38 = (void *)v57;
          v37 = v66;
        }
        [(VUIMediaInfo *)self _populateMediaItem:v13 withMetadataFromVideosPlayable:v5];

        uint64_t v11 = v65;
      }
    }
    else
    {
      v83 = VUIDefaultLogObject();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
        -[VUIMediaInfo _storeMediaItemFromVideosPlayable:andStoreDictionary:](v83);
      }
      int v13 = 0;
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(VUIMediaInfo *)self _populateMediaItem:v13 withResumeTimeInfoFromPlayable:v5];
    }
    v54 = [v5 sharedWatchId];
    [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v54 forProperty:*MEMORY[0x1E4FA9FD8]];
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

- (id)_auxMediaItemFromVideosPlayable:(id)a3
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 canonicalID];
  id v6 = [v4 adamID];
  v147 = [v4 requiredAgeForPlayback];
  v146 = [v4 frequencyOfAgeConfirmation];
  v104 = v6;
  if (![v6 length]) {
    goto LABEL_27;
  }
  uint64_t v7 = [v4 mediaType];
  uint64_t v8 = v7;
  if (!v7 || ![v7 isEqualToString:@"Trailer"])
  {
    +[VUIDownloadManager sharedInstance];
    v10 = uint64_t v9 = v6;
    uint64_t v11 = [v10 existingDownloadForAdamID:v9];

    if (v11)
    {
      v148 = v5;
      id v12 = VUIDefaultLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v151 = 0;
        _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Using existing media item being downloaded: %@", buf, 0xCu);
      }

      int v13 = [v11 mediaItem];
      id v14 = [v4 metadata];
      BOOL v15 = [v14 mediaShareMetadata];

      __int16 v16 = [v4 metadata];
      v17 = [v16 showMediaShareMetadata];

      uint64_t v18 = [v4 artworkURL];
      uint64_t v19 = v18;
      if (v18)
      {
        uint64_t v20 = [v18 absoluteString];
        [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v20 forProperty:*MEMORY[0x1E4FA9E08]];
      }
      [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v15 forProperty:@"mediaShareMetadata"];
      [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v17 forProperty:@"showMediaShareMetadata"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(VUIStoreAuxMediaItem *)v13 resetReportingEventCollection];
      }
    }
    else
    {
      uint64_t v21 = +[VUIMediaLibraryManager defaultManager];
      uint64_t v22 = [v21 sidebandMediaLibrary];
      BOOL v15 = [v22 videoForAdamID:v9 useMainThreadContext:1];

      if (!v15
        || (uint64_t v23 = [v15 downloadState], v23 != 2)
        && (v23
         || ([v15 markedAsDeleted] & 1) != 0
         || ([v15 expirationDate],
             v24 = objc_claimAutoreleasedReturnValue(),
             v24,
             !v24)))
      {
        int v13 = 0;
LABEL_26:

        id v6 = v104;
        if (v13) {
          goto LABEL_53;
        }
        goto LABEL_27;
      }
      v148 = v5;
      v25 = objc_opt_class();
      uint64_t v26 = [v15 adamID];
      v27 = [v15 canonicalID];
      v17 = [v25 _playbackOverridesForURL:0 adamID:v26 canonicalID:v27];

      int v13 = [[VUIStoreAuxMediaItem alloc] initWithVideoManagedObject:v15 isForStartingDownload:0];
      id v28 = [v4 playbackURL];
      v142 = self;
      id v29 = +[VUIPlaybackUtilities updatedHLSURL:v28 forPlaybackContext:[(VUIMediaInfo *)self playbackContext]];
      [(VUIStoreAuxMediaItem *)v13 setStreamingOverrideURLForDownload:v29];

      v30 = [v4 metadata];
      uint64_t v19 = [v30 mediaShareMetadata];

      uint64_t v31 = [v4 metadata];
      uint64_t v32 = [v31 showMediaShareMetadata];

      [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v19 forProperty:@"mediaShareMetadata"];
      v144 = (void *)v32;
      [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v32 forProperty:@"showMediaShareMetadata"];
      long long v33 = [v4 playablePassThrough];
      if ([v33 length]) {
        [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v33 forProperty:@"VUIMediaItemMetadataPlayablePassThrough"];
      }
      v140 = v33;
      uint64_t v34 = [v4 artworkURL];
      long long v35 = v34;
      if (v34)
      {
        uint64_t v36 = [v34 absoluteString];
        [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v36 forProperty:*MEMORY[0x1E4FA9E08]];
      }
      v37 = VUIDefaultLogObject();
      self = v142;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v37, OS_LOG_TYPE_DEFAULT, "Creating new media item for playable from library since it is not being downloaded currently", buf, 2u);
      }

      [(VUIMediaInfo *)v142 _populateMediaItem:v13 withMetadataOverrides:v17];
    }

    id v5 = v148;
    goto LABEL_26;
  }

LABEL_27:
  v38 = [v4 playbackURL];
  v145 = [v4 hlsProgramID];
  v143 = [v4 externalID];
  v141 = [v4 channelID];
  v139 = [v4 channelName];
  __int16 v39 = [v4 metadata];
  v138 = [v39 ratingValue];

  v40 = [v4 metadata];
  v137 = [v40 ratingName];

  id v41 = [v4 metadata];
  v136 = [v41 ratingAuxiliaryName];

  v42 = [v4 mediaType];
  unsigned int v98 = [v42 isEqualToString:@"LiveService"];
  v101 = v42;
  uint64_t v43 = [v42 isEqualToString:@"SportingEvent"];
  v149 = [(VUIMediaInfo *)self _tvpMediaTypeFromPlayable:v4];
  uint64_t v102 = [v4 scrubVideoURL];
  v135 = [v4 fpsCertificateURL];
  v134 = [v4 fpsKeyServerURL];
  v133 = [v4 fpsAdditionalServerParams];
  unsigned int v94 = [v4 sendMescalHeaderToPlaybackKeyServer];
  unsigned int v93 = [v4 sendLocationToPlaybackKeyServerWhenOptedIn];
  v132 = [v4 bookmarkID];
  unsigned int v95 = [v4 isFamilySharingContent];
  uint64_t v44 = [v4 metadata];
  v131 = [v44 videoResolutionClass];

  v45 = [v4 metadata];
  v130 = [v45 videoDynamicRange];

  v46 = [v4 metadata];
  v129 = [v46 hasADLocales];

  v47 = [v4 metadata];
  v128 = [v47 hasSDHLocales];

  v127 = [v4 referenceID];
  v126 = [v4 rtcServiceIdentifier];
  v125 = [v4 vpafMetrics];
  unsigned int v96 = [v4 reportVPAFWhenPlayingInBackground];
  v124 = [v4 liveSportsPostPlayShelfFetchPolicy];
  v123 = [v4 autoExitOnBroadcastEndInSeconds];
  v122 = [v4 mediaMetrics];
  v48 = [v4 metadata];
  unsigned int v99 = [v48 isAdultContent];

  v49 = [v4 metadata];
  v121 = [v49 commonSenseRecommendedAge];

  v50 = [v4 metadata];
  v120 = [v50 hasDolbyAtmos];

  uint64_t v51 = [v4 disableScrubbing];
  v119 = [v4 liveStreamServiceID];
  v118 = [v4 externalServiceID];
  v52 = [v4 metadata];
  v117 = [v52 seasonNumber];

  v53 = [v4 metadata];
  v116 = [v53 episodeNumber];

  v54 = [v4 metadata];
  v115 = [v54 episodeIndexInSeries];

  v114 = [v4 tvAppDeeplinkURL];
  v113 = [v4 buyParams];
  v112 = [v4 upsellRouterDataSource];
  v55 = [v4 metadata];
  v111 = [v55 upsellOnExitPolicy];

  uint64_t v56 = [v4 rentalID];
  v100 = [(id)objc_opt_class() _playbackOverridesForURL:v38 adamID:v6 canonicalID:v5];
  uint64_t v57 = [v100 objectForKey:@"replacementPlaybackURL"];
  v108 = [v4 locale];
  unsigned int v97 = [v4 playsFromStartOfLiveStream];
  v58 = [v4 metadata];
  v107 = [v58 mediaShareMetadata];

  v59 = [v4 metadata];
  v106 = [v59 showMediaShareMetadata];

  v105 = [v4 utsEntityType];
  v103 = v57;
  if ([v57 length])
  {
    unsigned int v60 = VUIDefaultLogObject();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v151 = v38;
      __int16 v152 = 2112;
      v153 = v57;
      _os_log_impl(&dword_1E2BD7000, v60, OS_LOG_TYPE_DEFAULT, "Overriding original playback URL %@ with replacement playback URL %@", buf, 0x16u);
    }

    uint64_t v61 = [MEMORY[0x1E4F1CB10] URLWithString:v57];
  }
  else
  {
    if ([v4 isiTunesPurchaseOrRental])
    {
      uint64_t v62 = [(VUIMediaInfo *)self _hlsURLEnsuringDsidQueryParamIsPresentFromURL:v38];

      v38 = (void *)v62;
    }
    uint64_t v61 = +[VUIPlaybackUtilities updatedHLSURL:v38 forPlaybackContext:[(VUIMediaInfo *)self playbackContext]];
  }
  v109 = (void *)v61;
  v110 = v56;

  v63 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v64 = [v63 BOOLForKey:@"AssumeSportingEvent"];

  if (v64)
  {
    v65 = VUIDefaultLogObject();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v65, OS_LOG_TYPE_DEFAULT, "Assuming content is a sporting event due to defaults key", buf, 2u);
    }

    uint64_t v43 = 1;
  }
  int v13 = [[VUIStoreAuxMediaItem alloc] initWithURL:v109];
  [(VUIStoreAuxMediaItem *)v13 setFpsCertificateURL:v135];
  [(VUIStoreAuxMediaItem *)v13 setFpsKeyServerURL:v134];
  [(VUIStoreAuxMediaItem *)v13 setFpsAdditionalServerParams:v133];
  [(VUIStoreAuxMediaItem *)v13 setSendsMescalHeaderToPlaybackKeyServer:v94];
  [(VUIStoreAuxMediaItem *)v13 setSendsLocationToPlaybackKeyServerWhenOptedIn:v93];
  [(VUIStoreAuxMediaItem *)v13 setBookmarkID:v132];
  [(VUIStoreAuxMediaItem *)v13 setDisableResumeMenu:1];
  -[VUIStoreAuxMediaItem setIsiTunesPurchasedOrRentedContent:](v13, "setIsiTunesPurchasedOrRentedContent:", [v4 isiTunesPurchaseOrRental]);
  [(VUIStoreAuxMediaItem *)v13 setDisableScrubbing:v51];
  [(VUIStoreAuxMediaItem *)v13 setIsFamilySharingContent:v95];
  [(VUIStoreAuxMediaItem *)v13 setIsLiveContent:v98];
  [(VUIStoreAuxMediaItem *)v13 setIsSportingEvent:v43];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v6 forProperty:*MEMORY[0x1E4FAA0D8]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v145 forProperty:*MEMORY[0x1E4FA9F30]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v143 forProperty:*MEMORY[0x1E4FA9ED8]];
  uint64_t v66 = *MEMORY[0x1E4FAA070];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v126 forProperty:*MEMORY[0x1E4FAA070]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v130 forProperty:*MEMORY[0x1E4FAA110]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v131 forProperty:*MEMORY[0x1E4FAA118]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v129 forProperty:*MEMORY[0x1E4FA9F40]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v128 forProperty:*MEMORY[0x1E4FA9F50]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v149 forProperty:*MEMORY[0x1E4FA9FB0]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v141 forProperty:*MEMORY[0x1E4FA9E10]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v139 forProperty:*MEMORY[0x1E4FA9E18]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v5 forProperty:*MEMORY[0x1E4FA9E28]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v127 forProperty:*MEMORY[0x1E4FAA008]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v125 forProperty:*MEMORY[0x1E4FAA108]];
  v67 = [MEMORY[0x1E4F28ED0] numberWithBool:v96];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v67 forProperty:@"reportVPAFWhenPlayingInBackground"];

  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v122 forProperty:*MEMORY[0x1E4FA9FA8]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v118 forProperty:*MEMORY[0x1E4FA9EE8]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v119 forProperty:*MEMORY[0x1E4FA9F80]];
  v68 = [MEMORY[0x1E4F28ED0] numberWithBool:v99];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v68 forProperty:*MEMORY[0x1E4FA9F70]];

  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v121 forProperty:*MEMORY[0x1E4FA9E38]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v120 forProperty:*MEMORY[0x1E4FA9F48]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v147 forProperty:*MEMORY[0x1E4FAA030]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v146 forProperty:*MEMORY[0x1E4FA9F18]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v117 forProperty:*MEMORY[0x1E4FAA060]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v116 forProperty:*MEMORY[0x1E4FA9EC0]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v115 forProperty:*MEMORY[0x1E4FA9EB8]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v138 forProperty:*MEMORY[0x1E4FA9E60]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v137 forProperty:*MEMORY[0x1E4FA9E40]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v136 forProperty:@"VUIContentMetadataRatingAuxiliaryDisplayName"];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v114 forProperty:@"VUIContentMetadataDeepLinkURL"];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v113 forProperty:*MEMORY[0x1E4FA9E20]];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v112 forProperty:@"VUIContentMetadataPlaybackExitUpsellRouterDataSource"];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v111 forProperty:@"VUIContentMetadataPlaybackExitUpsellPolicy"];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v108 forProperty:@"VUIContentMetadataBroadcastLocale"];
  v69 = [MEMORY[0x1E4F28ED0] numberWithBool:v97];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v69 forProperty:@"VUIContentMetadataPlaysFromStartOfLiveStream"];

  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v107 forProperty:@"mediaShareMetadata"];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v106 forProperty:@"showMediaShareMetadata"];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v105 forProperty:@"utsEntityType"];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v124 forProperty:@"liveSportsPostPlayShelfFetchPolicy"];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v123 forProperty:@"autoExitOnBroadcastEndInSeconds"];
  if ([v4 isAmbientVideo])
  {
    [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:MEMORY[0x1E4F1CC38] forProperty:@"VUIContentMetadataIsAmbientVideo"];
    v70 = [v4 repeatLoopCount];
    if (v70) {
      [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v70 forProperty:@"VUIContentMetadataRepeatLoopCount"];
    }
  }
  if (v56 && ([v56 isEqual:&unk_1F3F3D268] & 1) == 0) {
    [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v56 forProperty:*MEMORY[0x1E4FAA018]];
  }
  v71 = [v4 metadata];
  v72 = [v71 ratingDomain];

  v73 = [(VUIMediaInfo *)self _tvpRatingDomainFromUTSRatingDomain:v72];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v73 forProperty:*MEMORY[0x1E4FA9E48]];

  if ([v149 isEqualToString:*MEMORY[0x1E4FAA200]])
  {
    v74 = [v4 showCanonicalID];
    v75 = [v4 seasonCanonicalID];
    [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v74 forProperty:*MEMORY[0x1E4FAA080]];
    [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v75 forProperty:*MEMORY[0x1E4FAA058]];
  }
  v76 = v5;
  if ([v4 isFamilySharingContent])
  {
    v77 = [v4 extrasInfo];
    v78 = [v77 extrasURLString];
    uint64_t v79 = [v78 length];

    if (v79)
    {
      v80 = (void *)MEMORY[0x1E4F1CB10];
      v81 = [v4 extrasInfo];
      v82 = [v81 extrasURLString];
      v83 = [v80 URLWithString:v82];

      [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v83 forProperty:*MEMORY[0x1E4FA9EF0]];
    }
  }
  [(VUIMediaInfo *)self _populateMediaItem:v13 withMetadataFromVideosPlayable:v4];
  v84 = (void *)v102;
  if (v102)
  {
    v85 = [[VUIStoreAuxMediaItem alloc] initWithURL:v102];
    v86 = NSString;
    uint64_t v87 = [MEMORY[0x1E4F28B50] mainBundle];
    v88 = [v87 bundleIdentifier];
    v89 = [v86 stringWithFormat:@"%@.IFrameScrubVideo", v88];
    [(VUIStoreAuxMediaItem *)v85 setMediaItemMetadata:v89 forProperty:v66];

    [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v85 forProperty:*MEMORY[0x1E4FAA048]];
    v84 = (void *)v102;
  }
  [(VUIMediaInfo *)self _populateMediaItem:v13 withMetadataOverrides:v100];
  [(VUIStoreAuxMediaItem *)v13 setPlaybackContext:[(VUIMediaInfo *)self playbackContext]];

  id v5 = v76;
  id v6 = v104;
LABEL_53:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(VUIMediaInfo *)self _populateMediaItem:v13 withResumeTimeInfoFromPlayable:v4];
  }
  v90 = [v4 sharedWatchId];
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v90 forProperty:*MEMORY[0x1E4FA9FD8]];
  v91 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "playableType"));
  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v91 forProperty:@"VUIContentMetadataPlayableType"];

  [(VUIStoreAuxMediaItem *)v13 setMediaItemMetadata:v4 forProperty:@"VUIContentMetadataPlayableForDownload"];
  return v13;
}

- (void)_populateMediaItem:(id)a3 withOtherMediaItem:(id)a4
{
  id v127 = a3;
  id v5 = a4;
  id v6 = [v5 fpsCertificateURL];
  [v127 setFpsCertificateURL:v6];

  uint64_t v7 = [v5 fpsKeyServerURL];
  [v127 setFpsKeyServerURL:v7];

  uint64_t v8 = [v5 fpsAdditionalServerParams];
  [v127 setFpsAdditionalServerParams:v8];

  objc_msgSend(v127, "setSendsMescalHeaderToPlaybackKeyServer:", objc_msgSend(v5, "sendsMescalHeaderToPlaybackKeyServer"));
  objc_msgSend(v127, "setSendsLocationToPlaybackKeyServerWhenOptedIn:", objc_msgSend(v5, "sendsLocationToPlaybackKeyServerWhenOptedIn"));
  uint64_t v9 = [v5 bookmarkID];
  [v127 setBookmarkID:v9];

  [v127 setDisableResumeMenu:1];
  objc_msgSend(v127, "setIsiTunesPurchasedOrRentedContent:", objc_msgSend(v5, "isiTunesPurchasedOrRentedContent"));
  objc_msgSend(v127, "setDisableScrubbing:", objc_msgSend(v5, "disableScrubbing"));
  objc_msgSend(v127, "setIsFamilySharingContent:", objc_msgSend(v5, "isFamilySharingContent"));
  objc_msgSend(v127, "setIsLiveContent:", objc_msgSend(v5, "isLiveContent"));
  objc_msgSend(v127, "setIsSportingEvent:", objc_msgSend(v5, "isSportingEvent"));
  uint64_t v10 = *MEMORY[0x1E4FAA0D8];
  uint64_t v11 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];
  [v127 setMediaItemMetadata:v11 forProperty:v10];

  uint64_t v12 = *MEMORY[0x1E4FA9ED8];
  int v13 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9ED8]];
  [v127 setMediaItemMetadata:v13 forProperty:v12];

  uint64_t v14 = *MEMORY[0x1E4FAA070];
  BOOL v15 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA070]];
  [v127 setMediaItemMetadata:v15 forProperty:v14];

  uint64_t v16 = *MEMORY[0x1E4FAA110];
  v17 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA110]];
  [v127 setMediaItemMetadata:v17 forProperty:v16];

  uint64_t v18 = *MEMORY[0x1E4FAA118];
  uint64_t v19 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA118]];
  [v127 setMediaItemMetadata:v19 forProperty:v18];

  uint64_t v20 = *MEMORY[0x1E4FA9F40];
  uint64_t v21 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F40]];
  [v127 setMediaItemMetadata:v21 forProperty:v20];

  uint64_t v22 = *MEMORY[0x1E4FA9F50];
  uint64_t v23 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F50]];
  [v127 setMediaItemMetadata:v23 forProperty:v22];

  uint64_t v24 = *MEMORY[0x1E4FA9FB0];
  v25 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
  [v127 setMediaItemMetadata:v25 forProperty:v24];

  uint64_t v26 = *MEMORY[0x1E4FA9E10];
  v27 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E10]];
  [v127 setMediaItemMetadata:v27 forProperty:v26];

  uint64_t v28 = *MEMORY[0x1E4FA9E18];
  id v29 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E18]];
  [v127 setMediaItemMetadata:v29 forProperty:v28];

  uint64_t v30 = *MEMORY[0x1E4FA9E28];
  uint64_t v31 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];
  [v127 setMediaItemMetadata:v31 forProperty:v30];

  uint64_t v32 = *MEMORY[0x1E4FAA008];
  long long v33 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA008]];
  [v127 setMediaItemMetadata:v33 forProperty:v32];

  uint64_t v34 = *MEMORY[0x1E4FAA108];
  long long v35 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA108]];
  [v127 setMediaItemMetadata:v35 forProperty:v34];

  uint64_t v36 = *MEMORY[0x1E4FA9FA8];
  v37 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FA8]];
  [v127 setMediaItemMetadata:v37 forProperty:v36];

  uint64_t v38 = *MEMORY[0x1E4FA9EE8];
  __int16 v39 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9EE8]];
  [v127 setMediaItemMetadata:v39 forProperty:v38];

  uint64_t v40 = *MEMORY[0x1E4FA9F80];
  id v41 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F80]];
  [v127 setMediaItemMetadata:v41 forProperty:v40];

  uint64_t v42 = *MEMORY[0x1E4FA9F70];
  uint64_t v43 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F70]];
  [v127 setMediaItemMetadata:v43 forProperty:v42];

  uint64_t v44 = *MEMORY[0x1E4FA9E38];
  v45 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E38]];
  [v127 setMediaItemMetadata:v45 forProperty:v44];

  uint64_t v46 = *MEMORY[0x1E4FA9F48];
  v47 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F48]];
  [v127 setMediaItemMetadata:v47 forProperty:v46];

  uint64_t v48 = *MEMORY[0x1E4FAA030];
  v49 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA030]];
  [v127 setMediaItemMetadata:v49 forProperty:v48];

  uint64_t v50 = *MEMORY[0x1E4FA9F18];
  uint64_t v51 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F18]];
  [v127 setMediaItemMetadata:v51 forProperty:v50];

  uint64_t v52 = *MEMORY[0x1E4FAA060];
  v53 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA060]];
  [v127 setMediaItemMetadata:v53 forProperty:v52];

  uint64_t v54 = *MEMORY[0x1E4FA9EC0];
  v55 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9EC0]];
  [v127 setMediaItemMetadata:v55 forProperty:v54];

  uint64_t v56 = *MEMORY[0x1E4FA9EB8];
  uint64_t v57 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9EB8]];
  [v127 setMediaItemMetadata:v57 forProperty:v56];

  uint64_t v58 = *MEMORY[0x1E4FA9E60];
  v59 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E60]];
  [v127 setMediaItemMetadata:v59 forProperty:v58];

  uint64_t v60 = *MEMORY[0x1E4FA9E40];
  uint64_t v61 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E40]];
  [v127 setMediaItemMetadata:v61 forProperty:v60];

  uint64_t v62 = [v5 mediaItemMetadataForProperty:@"VUIContentMetadataRatingAuxiliaryDisplayName"];
  [v127 setMediaItemMetadata:v62 forProperty:@"VUIContentMetadataRatingAuxiliaryDisplayName"];

  v63 = [v5 mediaItemMetadataForProperty:@"VUIContentMetadataDeepLinkURL"];
  [v127 setMediaItemMetadata:v63 forProperty:@"VUIContentMetadataDeepLinkURL"];

  uint64_t v64 = *MEMORY[0x1E4FA9E20];
  v65 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E20]];
  [v127 setMediaItemMetadata:v65 forProperty:v64];

  uint64_t v66 = [v5 mediaItemMetadataForProperty:@"VUIContentMetadataPlaybackExitUpsellRouterDataSource"];
  [v127 setMediaItemMetadata:v66 forProperty:@"VUIContentMetadataPlaybackExitUpsellRouterDataSource"];

  v67 = [v5 mediaItemMetadataForProperty:@"VUIContentMetadataPlaybackExitUpsellPolicy"];
  [v127 setMediaItemMetadata:v67 forProperty:@"VUIContentMetadataPlaybackExitUpsellPolicy"];

  v68 = [v5 mediaItemMetadataForProperty:@"VUIContentMetadataBroadcastLocale"];
  [v127 setMediaItemMetadata:v68 forProperty:@"VUIContentMetadataBroadcastLocale"];

  v69 = [v5 mediaItemMetadataForProperty:@"VUIContentMetadataPlaysFromStartOfLiveStream"];
  [v127 setMediaItemMetadata:v69 forProperty:@"VUIContentMetadataPlaysFromStartOfLiveStream"];

  v70 = [v5 mediaItemMetadataForProperty:@"mediaShareMetadata"];
  [v127 setMediaItemMetadata:v70 forProperty:@"mediaShareMetadata"];

  v71 = [v5 mediaItemMetadataForProperty:@"showMediaShareMetadata"];
  [v127 setMediaItemMetadata:v71 forProperty:@"showMediaShareMetadata"];

  v72 = [v5 mediaItemMetadataForProperty:@"VUIContentMetadataIsAmbientVideo"];
  [v127 setMediaItemMetadata:v72 forProperty:@"VUIContentMetadataIsAmbientVideo"];

  v73 = [v5 mediaItemMetadataForProperty:@"VUIContentMetadataRepeatLoopCount"];
  [v127 setMediaItemMetadata:v73 forProperty:@"VUIContentMetadataRepeatLoopCount"];

  uint64_t v74 = *MEMORY[0x1E4FAA018];
  v75 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA018]];
  [v127 setMediaItemMetadata:v75 forProperty:v74];

  uint64_t v76 = *MEMORY[0x1E4FA9E48];
  v77 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E48]];
  [v127 setMediaItemMetadata:v77 forProperty:v76];

  v78 = [v127 mediaItemMetadataForProperty:v24];
  LODWORD(v76) = [v78 isEqualToString:*MEMORY[0x1E4FAA200]];

  if (v76)
  {
    uint64_t v79 = *MEMORY[0x1E4FAA080];
    v80 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA080]];
    [v127 setMediaItemMetadata:v80 forProperty:v79];

    uint64_t v81 = *MEMORY[0x1E4FAA058];
    v82 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA058]];
    [v127 setMediaItemMetadata:v82 forProperty:v81];
  }
  uint64_t v83 = *MEMORY[0x1E4FA9EF0];
  v84 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9EF0]];
  [v127 setMediaItemMetadata:v84 forProperty:v83];

  uint64_t v85 = *MEMORY[0x1E4FAA0E8];
  v86 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0E8]];
  [v127 setMediaItemMetadata:v86 forProperty:v85];

  uint64_t v87 = *MEMORY[0x1E4FA9F90];
  v88 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F90]];
  [v127 setMediaItemMetadata:v88 forProperty:v87];

  uint64_t v89 = *MEMORY[0x1E4FA9E08];
  v90 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E08]];
  [v127 setMediaItemMetadata:v90 forProperty:v89];

  uint64_t v91 = *MEMORY[0x1E4FA9FF8];
  v92 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FF8]];
  [v127 setMediaItemMetadata:v92 forProperty:v91];

  uint64_t v93 = *MEMORY[0x1E4FA9FF0];
  unsigned int v94 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FF0]];
  [v127 setMediaItemMetadata:v94 forProperty:v93];

  unsigned int v95 = +[VUIFeaturesConfiguration sharedInstance];
  unsigned int v96 = [v95 nowPlayingConfig];
  int v97 = [v96 shouldSendLiveStreamStartAndEndTimesToAVKit];

  if (v97)
  {
    uint64_t v98 = *MEMORY[0x1E4FA9ED0];
    unsigned int v99 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9ED0]];
    [v127 setMediaItemMetadata:v99 forProperty:v98];

    uint64_t v100 = *MEMORY[0x1E4FA9EC8];
    v101 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9EC8]];
    [v127 setMediaItemMetadata:v101 forProperty:v100];
  }
  uint64_t v102 = *MEMORY[0x1E4FAA0B0];
  v103 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0B0]];
  [v127 setMediaItemMetadata:v103 forProperty:v102];

  uint64_t v104 = *MEMORY[0x1E4FAA0A8];
  v105 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0A8]];
  [v127 setMediaItemMetadata:v105 forProperty:v104];

  uint64_t v106 = *MEMORY[0x1E4FAA0A0];
  v107 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0A0]];
  [v127 setMediaItemMetadata:v107 forProperty:v106];

  uint64_t v108 = *MEMORY[0x1E4FAA098];
  v109 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA098]];
  [v127 setMediaItemMetadata:v109 forProperty:v108];

  v110 = [v5 mediaItemMetadataForProperty:@"VUIMediaItemMetadataIsEligibleForPlayerTabs"];
  [v127 setMediaItemMetadata:v110 forProperty:@"VUIMediaItemMetadataIsEligibleForPlayerTabs"];

  v111 = [v5 mediaItemMetadataForProperty:@"VUIMediaItemMetadataPlayablePassThrough"];
  [v127 setMediaItemMetadata:v111 forProperty:@"VUIMediaItemMetadataPlayablePassThrough"];

  v112 = [v5 mediaItemMetadataForProperty:@"VUIMediaItemMetadataIsKeyPlayAvailable"];
  [v127 setMediaItemMetadata:v112 forProperty:@"VUIMediaItemMetadataIsKeyPlayAvailable"];

  v113 = [v5 mediaItemMetadataForProperty:@"VUIMediaItemMetadataIsEligibleForInfoTab"];
  [v127 setMediaItemMetadata:v113 forProperty:@"VUIMediaItemMetadataIsEligibleForInfoTab"];

  v114 = [v5 mediaItemMetadataForProperty:@"VUIMediaItemMetadataSupportsStartOver"];
  [v127 setMediaItemMetadata:v114 forProperty:@"VUIMediaItemMetadataSupportsStartOver"];

  v115 = [v5 mediaItemMetadataForProperty:@"VUIMediaItemMetadataPreferredAudioLanguageCode"];
  [v127 setMediaItemMetadata:v115 forProperty:@"VUIMediaItemMetadataPreferredAudioLanguageCode"];

  uint64_t v116 = *MEMORY[0x1E4FAA0F8];
  v117 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0F8]];
  [v127 setMediaItemMetadata:v117 forProperty:v116];

  uint64_t v118 = *MEMORY[0x1E4FAA0F0];
  v119 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0F0]];
  [v127 setMediaItemMetadata:v119 forProperty:v118];

  uint64_t v120 = *MEMORY[0x1E4FAA0E0];
  v121 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0E0]];
  [v127 setMediaItemMetadata:v121 forProperty:v120];

  uint64_t v122 = *MEMORY[0x1E4FA9F20];
  v123 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F20]];
  [v127 setMediaItemMetadata:v123 forProperty:v122];

  v124 = [v5 mediaItemMetadataForProperty:v87];
  [v127 setMediaItemMetadata:v124 forProperty:v87];

  uint64_t v125 = *MEMORY[0x1E4FAA048];
  v126 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA048]];
  [v127 setMediaItemMetadata:v126 forProperty:v125];

  objc_msgSend(v127, "setPlaybackContext:", objc_msgSend(v5, "playbackContext"));
}

- (void)_populateMediaItem:(id)a3 withMetadataFromVideosPlayable:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 metadata];
  uint64_t v8 = [v7 title];

  if ([v8 length]) {
    [v5 setMediaItemMetadata:v8 forProperty:*MEMORY[0x1E4FAA0E8]];
  }
  uint64_t v9 = [v6 metadata];
  uint64_t v10 = [v9 mediaDescription];

  if ([v10 length]) {
    [v5 setMediaItemMetadata:v10 forProperty:*MEMORY[0x1E4FA9F90]];
  }
  uint64_t v11 = [v6 artworkURL];
  uint64_t v12 = v11;
  int v13 = (void *)MEMORY[0x1E4FA9E08];
  if (v11)
  {
    uint64_t v14 = [v11 absoluteString];
    [v5 setMediaItemMetadata:v14 forProperty:*v13];
  }
  BOOL v15 = [v6 metadata];
  uint64_t v16 = [v15 scheduleStartTime];

  [v16 doubleValue];
  if (v17 > 0.0) {
    [v5 setMediaItemMetadata:v16 forProperty:*MEMORY[0x1E4FA9FF8]];
  }
  v107 = v12;
  uint64_t v18 = [v6 metadata];
  uint64_t v19 = [v18 scheduleEndTime];

  [v19 doubleValue];
  if (v20 > 0.0) {
    [v5 setMediaItemMetadata:v19 forProperty:*MEMORY[0x1E4FA9FF0]];
  }
  v111 = v19;
  uint64_t v21 = [v6 metadata];
  uint64_t v22 = [v21 transportBarStartTime];

  v110 = v22;
  [v22 doubleValue];
  if (v23 > 0.0)
  {
    uint64_t v24 = +[VUIFeaturesConfiguration sharedInstance];
    v25 = [v24 nowPlayingConfig];
    int v26 = [v25 shouldSendLiveStreamStartAndEndTimesToAVKit];

    if (v26)
    {
      v27 = +[VUIFeaturesConfiguration sharedInstance];
      uint64_t v28 = [v27 nowPlayingConfig];
      [v28 liveStreamStartAndEndTimeBadMetadataCutoff];
      double v30 = v29;

      if (v30 <= 0.0)
      {
        [v5 setMediaItemMetadata:v110 forProperty:*MEMORY[0x1E4FA9ED0]];
      }
      else
      {
        uint64_t v31 = (void *)MEMORY[0x1E4F1C9C8];
        [v110 doubleValue];
        long long v33 = [v31 dateWithTimeIntervalSince1970:v32 / 1000.0];
        uint64_t v34 = [MEMORY[0x1E4F1C9C8] date];
        [v34 timeIntervalSinceDate:v33];
        double v36 = v35;

        if (v36 >= v30)
        {
          v37 = VUIDefaultLogObject();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            -[VUIMediaInfo _populateMediaItem:withMetadataFromVideosPlayable:]();
          }
        }
        else
        {
          [v5 setMediaItemMetadata:v110 forProperty:*MEMORY[0x1E4FA9ED0]];
        }
      }
    }
  }
  uint64_t v38 = [v6 metadata];
  __int16 v39 = [v38 transportBarEndTime];

  v109 = v39;
  [v39 doubleValue];
  if (v40 > 0.0)
  {
    id v41 = +[VUIFeaturesConfiguration sharedInstance];
    uint64_t v42 = [v41 nowPlayingConfig];
    int v43 = [v42 shouldSendLiveStreamStartAndEndTimesToAVKit];

    if (v43)
    {
      uint64_t v44 = +[VUIFeaturesConfiguration sharedInstance];
      v45 = [v44 nowPlayingConfig];
      [v45 liveStreamStartAndEndTimeBadMetadataCutoff];
      double v47 = v46;

      if (v47 <= 0.0)
      {
        [v5 setMediaItemMetadata:v109 forProperty:*MEMORY[0x1E4FA9EC8]];
      }
      else
      {
        uint64_t v48 = (void *)MEMORY[0x1E4F1C9C8];
        [v109 doubleValue];
        uint64_t v50 = [v48 dateWithTimeIntervalSince1970:v49 / 1000.0];
        uint64_t v51 = [MEMORY[0x1E4F1C9C8] date];
        [v51 timeIntervalSinceDate:v50];
        double v53 = v52;

        if (v53 >= v47)
        {
          uint64_t v54 = VUIDefaultLogObject();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
            -[VUIMediaInfo _populateMediaItem:withMetadataFromVideosPlayable:]();
          }
        }
        else
        {
          [v5 setMediaItemMetadata:v109 forProperty:*MEMORY[0x1E4FA9EC8]];
        }
      }
    }
  }
  v55 = [v6 metadata];
  uint64_t v56 = [v55 venueName];

  if ([v56 length]) {
    [v5 setMediaItemMetadata:v56 forProperty:*MEMORY[0x1E4FAA0B0]];
  }
  v113 = v56;
  uint64_t v57 = [v6 metadata];
  uint64_t v58 = [v57 venueAddress];

  if ([v58 length]) {
    [v5 setMediaItemMetadata:v58 forProperty:*MEMORY[0x1E4FAA0A8]];
  }
  v59 = [v6 metadata];
  uint64_t v60 = [v59 leagueShortName];

  if ([v60 length]) {
    [v5 setMediaItemMetadata:v60 forProperty:*MEMORY[0x1E4FAA0A0]];
  }
  v114 = v60;
  uint64_t v108 = v10;
  uint64_t v61 = [v6 metadata];
  uint64_t v62 = [v61 leagueName];

  if ([v62 length]) {
    [v5 setMediaItemMetadata:v62 forProperty:*MEMORY[0x1E4FAA098]];
  }
  v112 = v62;
  v63 = [v6 metadata];
  uint64_t v64 = [v63 isEligibleForPlayerTabs];

  v65 = [MEMORY[0x1E4F28ED0] numberWithBool:v64];
  [v5 setMediaItemMetadata:v65 forProperty:@"VUIMediaItemMetadataIsEligibleForPlayerTabs"];

  uint64_t v66 = [v6 playablePassThrough];
  if ([v66 length]) {
    [v5 setMediaItemMetadata:v66 forProperty:@"VUIMediaItemMetadataPlayablePassThrough"];
  }
  uint64_t v104 = v66;
  uint64_t v67 = [v6 isKeyPlayAvailable];
  v68 = [MEMORY[0x1E4F28ED0] numberWithBool:v67];
  [v5 setMediaItemMetadata:v68 forProperty:@"VUIMediaItemMetadataIsKeyPlayAvailable"];

  v69 = +[VUIFeaturesConfiguration sharedInstance];
  v70 = [v69 playerTabsConfig];

  v103 = v70;
  int v71 = [v70 infoTabMustHaveImageToDisplay];
  v72 = [v5 mediaItemMetadataForProperty:*v13];
  if (v72)
  {
    BOOL v73 = 1;
  }
  else
  {
    uint64_t v74 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E00]];
    BOOL v73 = v74 != 0;
  }
  v75 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA0D8]];
  if (v75)
  {
    BOOL v76 = 1;
  }
  else
  {
    v77 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E28]];
    BOOL v76 = v77 != 0;
  }
  if (v71) {
    uint64_t v78 = v73 & v76;
  }
  else {
    uint64_t v78 = v76;
  }
  uint64_t v79 = [MEMORY[0x1E4F28ED0] numberWithBool:v78];
  [v5 setMediaItemMetadata:v79 forProperty:@"VUIMediaItemMetadataIsEligibleForInfoTab"];

  uint64_t v80 = [v6 supportsStartOver];
  uint64_t v81 = [MEMORY[0x1E4F28ED0] numberWithBool:v80];
  [v5 setMediaItemMetadata:v81 forProperty:@"VUIMediaItemMetadataSupportsStartOver"];

  v82 = [v6 preferredAudioLanguageCode];
  if ([v82 length]) {
    [v5 setMediaItemMetadata:v82 forProperty:@"VUIMediaItemMetadataPreferredAudioLanguageCode"];
  }
  uint64_t v83 = [v6 metadata];
  v84 = [v83 tomatoPercentage];

  if (v84)
  {
    [v84 doubleValue];
    if (v85 >= 0.0)
    {
      [v84 doubleValue];
      if (v86 <= 100.0) {
        [v5 setMediaItemMetadata:v84 forProperty:*MEMORY[0x1E4FAA0F8]];
      }
    }
  }
  uint64_t v87 = [v6 metadata];
  uint64_t v88 = [v87 tomatoFreshness];

  if (v88 != 3)
  {
    uint64_t v89 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v88];
    [v5 setMediaItemMetadata:v89 forProperty:*MEMORY[0x1E4FAA0F0]];
  }
  v90 = self;
  uint64_t v106 = v16;
  uint64_t v91 = v111;
  v92 = [(VUIMediaInfo *)v90 _sportingEventSubtitleFromStartTime:v16 endTime:v111 leagueShortName:v114];
  if (v92) {
    [v5 setMediaItemMetadata:v92 forProperty:*MEMORY[0x1E4FAA0E0]];
  }
  uint64_t v93 = [v6 metadata];
  unsigned int v94 = [v93 sportName];

  if ([v94 length]) {
    [v5 setMediaItemMetadata:v94 forProperty:*MEMORY[0x1E4FA9F20]];
  }
  unsigned int v95 = v113;
  if ([v113 length] && objc_msgSend(v58, "length"))
  {
    v101 = v82;
    uint64_t v102 = v8;
    unsigned int v96 = NSString;
    int v97 = +[VUILocalizationManager sharedInstance];
    uint64_t v98 = [v97 localizedStringForKey:@"SportingEventVenueDescription"];
    unsigned int v99 = objc_msgSend(v96, "stringWithFormat:", v98, v113, v58);

    if ([v112 length])
    {
      uint64_t v100 = [NSString stringWithFormat:@"%@ · %@", v112, v99];
      [v5 setMediaItemMetadata:v100 forProperty:*MEMORY[0x1E4FA9F90]];
    }
    else
    {
      [v5 setMediaItemMetadata:v99 forProperty:*MEMORY[0x1E4FA9F90]];
    }
    uint64_t v8 = v102;
    uint64_t v91 = v111;
    v82 = v101;

    unsigned int v95 = v113;
  }
  if ([v6 makeAdditionalPlayerTabsRequest]) {
    [v5 setMediaItemMetadata:MEMORY[0x1E4F1CC38] forProperty:@"VUIMediaItemMetadataMakeAdditionalPlayerTabsRequest"];
  }
}

- (id)_sportingEventTimeSpanStringFromStartTime:(id)a3 endTime:(id)a4
{
  id v4 = 0;
  if (a3 && a4)
  {
    id v6 = (void *)MEMORY[0x1E4F1C9C8];
    id v7 = a4;
    [a3 doubleValue];
    uint64_t v9 = [v6 dateWithTimeIntervalSince1970:v8 / 1000.0];
    uint64_t v10 = (void *)MEMORY[0x1E4F1C9C8];
    [v7 doubleValue];
    double v12 = v11;

    int v13 = [v10 dateWithTimeIntervalSince1970:v12 / 1000.0];
    id v14 = objc_alloc_init(MEMORY[0x1E4F28C20]);
    id v4 = objc_msgSend(v14, "tvp_hourMinuteDisplayStringFromStartDate:endDate:", v9, v13);
  }
  return v4;
}

- (id)_sportingEventSubtitleFromStartTime:(id)a3 endTime:(id)a4 leagueShortName:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(VUIMediaInfo *)self _sportingEventTimeSpanStringFromStartTime:a3 endTime:a4];
  if ([v9 length] && objc_msgSend(v8, "length"))
  {
    uint64_t v10 = [NSString stringWithFormat:@"%@ · %@", v9, v8];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_sportingEventTimeSpanStringFromMediaItem:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FF8]];
  id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v6 doubleForKey:@"ProgramScheduleStartTimeOverrideInMS"];
  double v8 = v7;

  if (v8 > 0.0)
  {
    uint64_t v9 = VUIDefaultLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v8 / 1000.0];
      int v21 = 138412290;
      uint64_t v22 = v10;
      _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Overriding program schedule start time with date %@", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithDouble:v8];

    id v5 = (void *)v11;
  }
  double v12 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FF0]];
  int v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v13 doubleForKey:@"ProgramScheduleEndTimeOverrideInMS"];
  double v15 = v14;

  if (v15 > 0.0)
  {
    uint64_t v16 = VUIDefaultLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      double v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v15 / 1000.0];
      int v21 = 138412290;
      uint64_t v22 = v17;
      _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_DEFAULT, "Overriding program schedule end time with date %@", (uint8_t *)&v21, 0xCu);
    }
    uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithDouble:v15];

    double v12 = (void *)v18;
  }
  uint64_t v19 = [(VUIMediaInfo *)self _sportingEventTimeSpanStringFromStartTime:v5 endTime:v12];

  return v19;
}

- (void)_populateMediaItem:(id)a3 withMetadataOverrides:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v7 = v6;
  if (v6)
  {
    double v8 = [v6 objectForKey:@"skipIntroStart"];
    uint64_t v9 = [v7 objectForKey:@"skipIntroDuration"];
    uint64_t v10 = [v7 objectForKey:@"skipIntroTarget"];
    uint64_t v11 = (void *)v10;
    if (v8 && v9 && v10)
    {
      double v12 = VUIDefaultLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v54 = v8;
        __int16 v55 = 2112;
        uint64_t v56 = v9;
        __int16 v57 = 2112;
        uint64_t v58 = v11;
        _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "Overriding skip intro with start %@ duration %@ target %@", buf, 0x20u);
      }

      id v13 = objc_alloc(MEMORY[0x1E4FA9D70]);
      [v8 doubleValue];
      double v15 = v14;
      [v9 doubleValue];
      double v17 = v16;
      [v11 doubleValue];
      uint64_t v19 = [v13 initWithType:1 start:0 duration:0 target:v15 localizedTitle:v17 skipIntroReportingType:v18];
      double v20 = (void *)v19;
      if (v19)
      {
        uint64_t v52 = v19;
        int v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
        [v5 setMediaItemMetadata:v21 forProperty:*MEMORY[0x1E4FAA088]];
      }
    }
    double v40 = v11;
    id v41 = v9;
    uint64_t v42 = v8;
    int v43 = v5;
    uint64_t v22 = [v7 objectForKey:@"ratingAdvisoryInfo"];
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = v22;
    uint64_t v24 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v48 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          double v29 = [v28 objectForKey:@"name"];
          double v30 = [v28 objectForKey:@"description"];
          if ([v30 length])
          {
            uint64_t v31 = VUIDefaultLogObject();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v54 = v29;
              __int16 v55 = 2112;
              uint64_t v56 = v30;
              _os_log_impl(&dword_1E2BD7000, v31, OS_LOG_TYPE_DEFAULT, "Overriding advisory info with name %@ description %@ ", buf, 0x16u);
            }

            double v32 = (void *)[objc_alloc(MEMORY[0x1E4FA9D68]) initWithRatingDescription:v30];
            if ([v29 length]) {
              [v32 setRatingName:v29];
            }
            if (v32) {
              [v23 addObject:v32];
            }
          }
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v25);
    }

    id v5 = v43;
    if ([v23 count]) {
      [v43 setMediaItemMetadata:v23 forProperty:*MEMORY[0x1E4FA9DE8]];
    }
    long long v33 = [v7 objectForKey:@"resumeTime"];
    if (v33)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v34 = VUIDefaultLogObject();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v54 = v33;
          _os_log_impl(&dword_1E2BD7000, v34, OS_LOG_TYPE_DEFAULT, "Overriding original resume time with %@", buf, 0xCu);
        }

        double v35 = [VUIMediaStartTimeInfo alloc];
        double v36 = [MEMORY[0x1E4F1C9C8] date];
        v37 = [(VUIMediaStartTimeInfo *)v35 initWithStartTime:v33 timestamp:v36 type:0 source:@"Demo override plist"];

        uint64_t v38 = [v43 startTimeCollection];
        [v38 addStartTimeInfo:v37];
      }
    }
    __int16 v39 = [v7 objectForKey:@"TVPMediaItemMetadata"];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __57__VUIMediaInfo__populateMediaItem_withMetadataOverrides___block_invoke;
    v45[3] = &unk_1E6DFA800;
    id v46 = v43;
    [v39 enumerateKeysAndObjectsUsingBlock:v45];
  }
}

void __57__VUIMediaInfo__populateMediaItem_withMetadataOverrides___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "Overriding key %@ with value %@", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) setMediaItemMetadata:v6 forProperty:v5];
}

- (void)_populateMediaItem:(id)a3 withResumeTimeInfoFromPlayable:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a4 startTimeInfos];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        uint64_t v12 = [v5 startTimeCollection];
        [v12 addStartTimeInfo:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (id)_tvpMediaTypeFromPlayable:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mediaType];
  if ([v4 isEqualToString:@"Movie"])
  {
    if ([v3 isRental]) {
      id v5 = (id *)MEMORY[0x1E4FAA1F8];
    }
    else {
      id v5 = (id *)MEMORY[0x1E4FAA1E8];
    }
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"Trailer"])
  {
    id v5 = (id *)MEMORY[0x1E4FAA1F0];
LABEL_7:
    id v6 = *v5;
    goto LABEL_11;
  }
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Show", @"Season", @"Episode", 0);
  id v6 = 0;
  if ([v7 containsObject:v4]) {
    id v6 = (id)*MEMORY[0x1E4FAA200];
  }

LABEL_11:
  return v6;
}

+ (id)_playbackOverridesForURL:(id)a3 adamID:(id)a4 canonicalID:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v30 = a4;
  id v29 = a5;
  uint64_t v8 = [MEMORY[0x1E4FB3C80] sharedInstance];
  int v9 = [v8 enableDemoMode];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:@"/var/mobile/Media/ManagedPurchases/TVApp/PlaybackOverrides.plist"];
    if ([v10 length])
    {
      uint64_t v11 = [MEMORY[0x1E4F28F98] propertyListWithData:v10 options:0 format:0 error:0];
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v12 = [v11 objectForKey:@"overrides"];
      }
      else
      {
        uint64_t v12 = 0;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    long long v13 = [MEMORY[0x1E4FB3C80] sharedInstance];
    int v14 = [v13 playbackOverridesEnabled];

    if (!v14)
    {
LABEL_30:
      id v16 = 0;
      uint64_t v19 = 0;
      goto LABEL_33;
    }
    uint64_t v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v12 = [v10 arrayForKey:*MEMORY[0x1E4FB3DE8]];
  }

  if (!v12) {
    goto LABEL_30;
  }
  id v28 = v7;
  long long v15 = [v7 absoluteString];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v23 = [v22 objectForKey:@"playbackURLToOverride"];
        uint64_t v24 = [v22 objectForKey:@"adamIDToOverride"];
        uint64_t v25 = [v22 objectForKey:@"canonicalIDToOverride"];
        if ([v15 length]
          && [v23 length]
          && ([v23 isEqualToString:v15] & 1) != 0
          || [v30 length]
          && [v24 length]
          && ([v24 isEqualToString:v30] & 1) != 0
          || [v29 length]
          && [v25 length]
          && [v25 isEqualToString:v29])
        {
          id v26 = v22;

          uint64_t v19 = v26;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v18);
  }
  else
  {
    uint64_t v19 = 0;
  }

  id v7 = v28;
LABEL_33:

  return v19;
}

- (id)_hlsURLEnsuringDsidQueryParamIsPresentFromURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
LABEL_15:
    uint64_t v10 = VUIDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v4;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_DEFAULT, "dsid query param is present in HLS URL: %@", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_17;
  }
  id v5 = [v3 pathExtension];
  if (([v5 isEqualToString:@"m3u8"] & 1) == 0)
  {

    goto LABEL_15;
  }
  char v6 = objc_msgSend(v4, "vui_containsQueryParamWithName:", @"dsid");

  if (v6) {
    goto LABEL_15;
  }
  id v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "dsid query param is missing from HLS URL: %@", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  int v9 = objc_msgSend(v8, "ams_activeiTunesAccount");
  uint64_t v10 = objc_msgSend(v9, "ams_DSID");

  if (!v10)
  {
LABEL_17:
    id v12 = v4;
    goto LABEL_18;
  }
  uint64_t v11 = [v10 stringValue];
  id v12 = v4;
  if ([v11 length])
  {
    long long v13 = objc_msgSend(v4, "vui_URLByAddingQueryParamWithName:value:", @"dsid", v11);
    int v14 = v13;
    id v12 = v4;
    if (v13)
    {
      id v12 = v13;

      long long v15 = VUIDefaultLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v12;
        _os_log_impl(&dword_1E2BD7000, v15, OS_LOG_TYPE_DEFAULT, "HLS URL after adding dsid param: %@", (uint8_t *)&v17, 0xCu);
      }
    }
  }

LABEL_18:
  return v12;
}

- (id)_playlistForSidebandLibraryAdamIDs:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = -[VUIMediaInfo _mediaItemForSidebandLibraryAdamID:](self, "_mediaItemForSidebandLibraryAdamID:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    id v12 = (void *)[objc_alloc(MEMORY[0x1E4FA9DA0]) initWithMediaItems:v5 index:0 isCollection:0];
  }
  else {
    id v12 = 0;
  }

  return v12;
}

- (id)_mediaItemForSidebandLibraryAdamID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = (VUIStoreAuxMediaItem *)a3;
  if ([(VUIStoreAuxMediaItem *)v3 length])
  {
    id v4 = +[VUIDownloadManager sharedInstance];
    id v5 = [v4 existingDownloadForAdamID:v3];

    if (v5)
    {
      id v6 = [v5 mediaItem];
      uint64_t v7 = VUIDefaultLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        long long v14 = v6;
        _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_INFO, "Using existing media item being downloaded: %@", (uint8_t *)&v13, 0xCu);
      }

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(VUIStoreAuxMediaItem *)v6 resetReportingEventCollection];
      }
    }
    else
    {
      uint64_t v8 = +[VUIMediaLibraryManager defaultManager];
      uint64_t v9 = [v8 sidebandMediaLibrary];
      uint64_t v10 = [v9 videoForAdamID:v3 useMainThreadContext:1];

      if (v10)
      {
        id v6 = [[VUIStoreAuxMediaItem alloc] initWithVideoManagedObject:v10 isForStartingDownload:0];
        uint64_t v11 = VUIDefaultLogObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          LOWORD(v13) = 0;
          _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_INFO, "Creating new media item from database since it is not being downloaded currently", (uint8_t *)&v13, 2u);
        }
      }
      else
      {
        uint64_t v11 = VUIDefaultLogObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v13 = 138412290;
          long long v14 = v3;
          _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_INFO, "Unable to find video managed object for adam ID %@", (uint8_t *)&v13, 0xCu);
        }
        id v6 = 0;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (unint64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(unint64_t)a3
{
  self->_intent = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSArray)imageProxies
{
  return self->_imageProxies;
}

- (void)setImageProxies:(id)a3
{
}

- (NSArray)imageThemes
{
  return self->_imageThemes;
}

- (void)setImageThemes:(id)a3
{
}

- (BOOL)isGradientDisabled
{
  return self->_gradientDisabled;
}

- (void)setGradientDisabled:(BOOL)a3
{
  self->_gradientDisabled = a3;
}

- (TVPPlaylist)playlist
{
  return self->_playlist;
}

- (void)setPlaylist:(id)a3
{
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (BOOL)hasProgress
{
  return self->_hasProgress;
}

- (TVPPlaylist)tvpPlaylist
{
  return self->_tvpPlaylist;
}

- (void)setTvpPlaylist:(id)a3
{
}

- (NSArray)videosPlayables
{
  return self->_videosPlayables;
}

- (void)setVideosPlayables:(id)a3
{
}

- (double)primaryVideoAspectRatio
{
  return self->_primaryVideoAspectRatio;
}

- (void)setPrimaryVideoAspectRatio:(double)a3
{
  self->_primaryVideoAspectRatio = a3;
}

- (BOOL)showsSecondaryVideoView
{
  return self->_showsSecondaryVideoView;
}

- (void)setShowsSecondaryVideoView:(BOOL)a3
{
  self->_showsSecondaryVideoView = a3;
}

- (BOOL)isAudioOnly
{
  return self->_isAudioOnly;
}

- (void)setIsAudioOnly:(BOOL)a3
{
  self->_isAudioOnly = a3;
}

- (BOOL)isAutomaticPlaybackStart
{
  return self->_automaticPlaybackStart;
}

- (void)setAutomaticPlaybackStart:(BOOL)a3
{
  self->_automaticPlaybackStart = a3;
}

- (unint64_t)playbackStartReason
{
  return self->_playbackStartReason;
}

- (void)setPlaybackStartReason:(unint64_t)a3
{
  self->_playbackStartReason = a3;
}

- (BOOL)isAutomaticPlaybackStop
{
  return self->_automaticPlaybackStop;
}

- (void)setAutomaticPlaybackStop:(BOOL)a3
{
  self->_automaticPlaybackStop = a3;
}

- (unint64_t)playbackStopReason
{
  return self->_playbackStopReason;
}

- (void)setPlaybackStopReason:(unint64_t)a3
{
  self->_playbackStopReason = a3;
}

- (BOOL)restrictionsAlreadyUnlocked
{
  return self->_restrictionsAlreadyUnlocked;
}

- (void)setRestrictionsAlreadyUnlocked:(BOOL)a3
{
  self->_restrictionsAlreadyUnlocked = a3;
}

- (BOOL)shouldDelayLoadingImage
{
  return self->_shouldDelayLoadingImage;
}

- (void)setShouldDelayLoadingImage:(BOOL)a3
{
  self->_shouldDelayLoadingImage = a3;
}

- (unint64_t)playbackContext
{
  return self->_playbackContext;
}

- (void)setPlaybackContext:(unint64_t)a3
{
  self->_playbackContext = a3;
}

- (VUIAppContext)appContext
{
  return self->_appContext;
}

- (void)setAppContext:(id)a3
{
}

- (BOOL)allowsPictureInPicture
{
  return self->_allowsPictureInPicture;
}

- (void)setAllowsPictureInPicture:(BOOL)a3
{
  self->_allowsPictureInPicture = a3;
}

- (double)playbackDelayInterval
{
  return self->_playbackDelayInterval;
}

- (void)setPlaybackDelayInterval:(double)a3
{
  self->_playbackDelayInterval = a3;
}

- (VUIImageProxy)alphaImageProxy
{
  return self->_alphaImageProxy;
}

- (void)setAlphaImageProxy:(id)a3
{
}

- (NSString)alphaLayerAccessibilityText
{
  return self->_alphaLayerAccessibilityText;
}

- (void)setAlphaLayerAccessibilityText:(id)a3
{
}

- (BOOL)overridesStartTimeWithResumeTime
{
  return self->_overridesStartTimeWithResumeTime;
}

- (void)setOverridesStartTimeWithResumeTime:(BOOL)a3
{
  self->_overridesStartTimeWithResumeTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaLayerAccessibilityText, 0);
  objc_storeStrong((id *)&self->_alphaImageProxy, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_videosPlayables, 0);
  objc_storeStrong((id *)&self->_tvpPlaylist, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_playlist, 0);
  objc_storeStrong((id *)&self->_imageThemes, 0);
  objc_storeStrong((id *)&self->_imageProxies, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

- (VUIMediaInfo)initWithPlaybackContext:(unint64_t)a3 mpMediaItems:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(VUIMediaInfo *)self initWithPlaybackContext:a3 videosPlayables:0 imageProxies:0 storeDictionary:0];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(VUIMediaInfo *)v7 _playlistFromMPMediaItems:v6 playbackContext:a3];
    if (v9)
    {
      [(VUIMediaInfo *)v8 setTvpPlaylist:v9];
      uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
      [(VUIMediaInfo *)v8 setUserPlaybackInitiationDate:v10 openURLCompletionDate:0];

      [(VUIMediaInfo *)v8 _updatePlaybackStartReason];
    }
  }
  return v8;
}

- (id)_playlistFromMPMediaItems:(id)a3 playbackContext:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          int v13 = -[VUIMediaInfo _storeMediaItemFromMPMediaItem:playbackContext:](self, "_storeMediaItemFromMPMediaItem:playbackContext:", *(void *)(*((void *)&v16 + 1) + 8 * i), a4, (void)v16);
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    if ([v7 count]) {
      long long v14 = (void *)[objc_alloc(MEMORY[0x1E4FA9DA0]) initWithMediaItems:v7 index:0 isCollection:0];
    }
    else {
      long long v14 = 0;
    }
  }
  else
  {
    long long v14 = 0;
  }

  return v14;
}

- (id)_storeMediaItemFromMPMediaItem:(id)a3 playbackContext:(unint64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 valueForProperty:*MEMORY[0x1E4F31500]];
  id v8 = [v6 valueForProperty:*MEMORY[0x1E4F31510]];
  if (!v7 || ![v7 longLongValue] || !objc_msgSend(v8, "length"))
  {
    if (objc_msgSend(v6, "vui_isHomeSharingMediaItem")) {
      uint64_t v15 = VUIHomeSharingMediaItem_iOS;
    }
    else {
      uint64_t v15 = VUILibraryMediaItem_iOS;
    }
    int v13 = (VUIStoreMediaItem_iOS *)[[v15 alloc] initWithMPMediaItem:v6];
    if (!v13) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  uint64_t v9 = VUIDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v39) = 0;
    _os_log_impl(&dword_1E2BD7000, v9, OS_LOG_TYPE_DEFAULT, "Support for in-app downloads is enabled.  Looking for downloading or downloaded content to play", (uint8_t *)&v39, 2u);
  }

  uint64_t v10 = +[VUIDownloadManager sharedInstance];
  uint64_t v11 = [v7 stringValue];
  id v12 = [v10 existingDownloadForAdamID:v11];

  if (v12)
  {
    int v13 = [v12 mediaItem];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(VUIStoreMediaItem_iOS *)v13 resetReportingEventCollection];
    }
    long long v14 = VUIDefaultLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = 138412290;
      double v40 = v13;
      _os_log_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_DEFAULT, "Using existing media item being downloaded: %@", (uint8_t *)&v39, 0xCu);
    }
  }
  else
  {
    id v30 = +[VUIMediaLibraryManager defaultManager];
    long long v31 = [v30 sidebandMediaLibrary];
    long long v32 = [v7 stringValue];
    long long v14 = [v31 videoForAdamID:v32 useMainThreadContext:1];

    if (v14 && [v14 downloadState] == 2)
    {
      long long v33 = VUIDefaultLogObject();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        int v39 = 138412290;
        double v40 = (VUIStoreMediaItem_iOS *)v14;
        _os_log_impl(&dword_1E2BD7000, v33, OS_LOG_TYPE_DEFAULT, "Item is downloaded.  Using videoManagedObject when creating media item: %@", (uint8_t *)&v39, 0xCu);
      }

      int v13 = [[VUIStoreMediaItem_iOS alloc] initWithMPMediaItem:v6 videoManagedObject:v14 isForStartingDownload:0];
    }
    else
    {
      int v13 = 0;
    }
  }

  if (!v13) {
    int v13 = [[VUIStoreMediaItem_iOS alloc] initWithMPMediaItem:v6 videoManagedObject:0 isForStartingDownload:0];
  }
  [(VUIStoreMediaItem_iOS *)v13 setPlaybackContext:a4];
  long long v34 = [(VUIStoreMediaItem_iOS *)v13 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];
  double v35 = +[VUIMetricsController sharedInstance];
  uint64_t v36 = [v35 iTunesLibraryPlaybackMediaMetricsForAdamID:v7 mediaType:v34];

  [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v36 forProperty:*MEMORY[0x1E4FA9FA8]];
  v37 = +[VUIMetricsController sharedInstance];
  uint64_t v38 = [v37 iTunesVPAF];
  [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v38 forProperty:*MEMORY[0x1E4FAA108]];

  if (v13)
  {
LABEL_15:
    long long v16 = [v6 valueForProperty:*MEMORY[0x1E4F31538]];
    long long v17 = [v6 valueForProperty:*MEMORY[0x1E4F31348]];
    long long v18 = [v6 valueForProperty:*MEMORY[0x1E4F31540]];
    uint64_t v19 = [v18 unsignedIntegerValue];

    int64_t v20 = [(VUIMediaInfo *)self _videoResolutionFromMPVideoQuality:v19];
    uint64_t v21 = [v6 valueForProperty:*MEMORY[0x1E4F31328]];
    uint64_t v22 = [v21 unsignedIntegerValue];

    int64_t v23 = [(VUIMediaInfo *)self _videoDynamimcRangeFromMPColorCapability:v22];
    uint64_t v24 = [v6 valueForProperty:*MEMORY[0x1E4F31310]];
    BOOL v25 = [v24 unsignedIntegerValue] == 1;

    [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v16 forProperty:*MEMORY[0x1E4FAA0E8]];
    [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v17 forProperty:*MEMORY[0x1E4FA9F90]];
    id v26 = [MEMORY[0x1E4F28ED0] numberWithInteger:v20];
    [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v26 forProperty:*MEMORY[0x1E4FAA118]];

    v27 = [MEMORY[0x1E4F28ED0] numberWithInteger:v23];
    [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v27 forProperty:*MEMORY[0x1E4FAA110]];

    id v28 = [MEMORY[0x1E4F28ED0] numberWithBool:v25];
    [(VUIStoreMediaItem_iOS *)v13 setMediaItemMetadata:v28 forProperty:*MEMORY[0x1E4FA9F48]];
  }
LABEL_16:

  return v13;
}

- (int64_t)_videoResolutionFromMPVideoQuality:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 1;
  }
  else {
    return qword_1E38FE1B0[a3 - 1];
  }
}

- (int64_t)_videoDynamimcRangeFromMPColorCapability:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3 == 1) {
    int64_t v3 = 2;
  }
  if (a3 == 2) {
    return 3;
  }
  else {
    return v3;
  }
}

- (VUIMediaInfo)initWithPlaybackContext:(unint64_t)a3 vuiMediaItems:(id)a4
{
  id v6 = a4;
  id v7 = [(VUIMediaInfo *)self initWithPlaybackContext:a3 videosPlayables:0 imageProxies:0 storeDictionary:0];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(VUIMediaInfo *)v7 _playlistForVUIMediaItems:v6 playbackContext:a3];
    if (v9)
    {
      [(VUIMediaInfo *)v8 setTvpPlaylist:v9];
      uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
      [(VUIMediaInfo *)v8 setUserPlaybackInitiationDate:v10 openURLCompletionDate:0];

      [(VUIMediaInfo *)v8 _updatePlaybackStartReason];
    }
  }
  return v8;
}

- (id)_playlistForVUIMediaItems:(id)a3 playbackContext:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    unint64_t v24 = a4;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v14 = [v13 mediaPlayerMediaItem];
        if (v14)
        {
          uint64_t v15 = [(VUIMediaInfo *)self _storeMediaItemFromMPMediaItem:v14 playbackContext:a4];
          if (v15) {
            [v7 addObject:v15];
          }
        }
        else
        {
          long long v16 = [v13 storeID];
          uint64_t v15 = v16;
          if (v16 && [v16 longLongValue])
          {
            id v17 = v8;
            long long v18 = v7;
            uint64_t v19 = [v15 stringValue];
            int64_t v20 = self;
            uint64_t v21 = [(VUIMediaInfo *)self _mediaItemForSidebandLibraryAdamID:v19];
            if (v21) {
              [v18 addObject:v21];
            }

            id v7 = v18;
            id v8 = v17;
            a4 = v24;
            self = v20;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v10);
  }

  if ([v7 count]) {
    uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4FA9DA0]) initWithMediaItems:v7 index:0 isCollection:0];
  }
  else {
    uint64_t v22 = 0;
  }

  return v22;
}

- (void)_storeMediaItemFromVideosPlayable:(os_log_t)log andStoreDictionary:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "Unable to create store media item because videos playable's adam ID is nil", v1, 2u);
}

- (void)_populateMediaItem:withMetadataFromVideosPlayable:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_15();
  _os_log_error_impl(&dword_1E2BD7000, v0, OS_LOG_TYPE_ERROR, "Not setting TVPMediaItemMetadataExactEndTime since end date %@ is more than %f seconds before now", v1, 0x16u);
}

- (void)_populateMediaItem:withMetadataFromVideosPlayable:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_15();
  _os_log_error_impl(&dword_1E2BD7000, v0, OS_LOG_TYPE_ERROR, "Not setting TVPMediaItemMetadataExactStartTime since start date %@ is more than %f seconds before now", v1, 0x16u);
}

@end