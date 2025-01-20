@interface MTEpisode
+ (id)dateLabelDescriptionForEpisode:(id)a3 download:(id)a4;
+ (int64_t)downloadSizeLimitForEpisode:(id)a3;
+ (int64_t)downloadSizeLimitForVideo:(BOOL)a3;
- (BOOL)isCurrentPlayerItem;
- (BOOL)isEpisodeVisited;
- (BOOL)isPlayable;
- (MTEpisodeIdentifier)episodeIdentifier;
- (int64_t)reasonForNotPlayable;
- (void)didChangePersistentID;
- (void)setAuthor:(id)a3;
- (void)setGuid:(id)a3;
- (void)setPlayCount:(int64_t)a3;
- (void)setPlayhead:(float)a3;
- (void)setTitle:(id)a3;
- (void)updateUPPIdentifierIfNeeded;
@end

@implementation MTEpisode

+ (id)dateLabelDescriptionForEpisode:(id)a3 download:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6) {
    goto LABEL_14;
  }
  v7 = +[MTReachability sharedInstance];
  unint64_t v8 = (unint64_t)[v7 reasonForNoInternet];

  uint64_t v9 = +[MTEpisode downloadSizeLimitForEpisode:v5];
  if ((uint64_t)[v6 downloadBytes] <= v9)
  {
    unsigned int v11 = 0;
  }
  else
  {
    v10 = +[MTReachability sharedInstance];
    unsigned int v11 = [v10 isReachableViaCellular];
  }
  if ((v8 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    if (v8 == 2) {
      int v14 = 1;
    }
    else {
      int v14 = v11;
    }
    if (v14 == 1)
    {
      int v15 = MGGetBoolAnswer();
      v16 = @"WIFI_CONNECT_RESUME";
      if (v15) {
        v16 = @"WLAN_CONNECT_RESUME";
      }
      v17 = v16;
      v18 = +[NSBundle mainBundle];
      v19 = [v18 localizedStringForKey:v17 value:&stru_10056A8A0 table:0];

      goto LABEL_23;
    }
LABEL_14:
    switch((unint64_t)[v6 downloadPhase])
    {
      case 1uLL:
        v20 = +[NSBundle mainBundle];
        v12 = v20;
        CFStringRef v21 = @"Preparing to download...";
        goto LABEL_21;
      case 2uLL:
        v19 = [v6 downloadDescription];
        goto LABEL_23;
      case 3uLL:
        v20 = +[NSBundle mainBundle];
        v12 = v20;
        CFStringRef v21 = @"TAP_TO_RESUME_DOWNLOAD";
        goto LABEL_21;
      case 4uLL:
        v20 = +[NSBundle mainBundle];
        v12 = v20;
        CFStringRef v21 = @"Waiting";
        goto LABEL_21;
      case 5uLL:
        v20 = +[NSBundle mainBundle];
        v12 = v20;
        CFStringRef v21 = @"DOWNLOAD_ERROR_TAP_TO_RETRY";
LABEL_21:
        uint64_t v13 = [v20 localizedStringForKey:v21 value:&stru_10056A8A0 table:0];
        goto LABEL_22;
      default:
        v19 = 0;
        goto LABEL_23;
    }
  }
  v12 = +[MTReachability sharedInstance];
  uint64_t v13 = [v12 reasonTextForNoInternet];
LABEL_22:
  v19 = (void *)v13;

LABEL_23:

  return v19;
}

+ (int64_t)downloadSizeLimitForEpisode:(id)a3
{
  id v4 = [a3 isVideo];

  return (int64_t)_[a1 downloadSizeLimitForVideo:v4];
}

+ (int64_t)downloadSizeLimitForVideo:(BOOL)a3
{
  id v4 = +[IMURLBag sharedInstance];
  id v5 = v4;
  if (a3) {
    id v6 = [v4 downloadLimitVideoPodcast];
  }
  else {
    id v6 = [v4 downloadLimitPodcast];
  }
  int64_t v7 = (int64_t)v6;

  return v7;
}

- (void)setGuid:(id)a3
{
  unint64_t v9 = (unint64_t)a3;
  uint64_t v4 = [(MTEpisode *)self guid];
  unint64_t v5 = v9 | v4;

  if (v5)
  {
    id v6 = [(MTEpisode *)self guid];
    unsigned __int8 v7 = [v6 isEqualToString:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = kEpisodeGuid;
      [(MTEpisode *)self willChangeValueForKey:kEpisodeGuid];
      [(MTEpisode *)self setPrimitiveValue:v9 forKey:v8];
      [(MTEpisode *)self didChangeValueForKey:v8];
      [(MTEpisode *)self updateUPPIdentifierIfNeeded];
    }
  }
}

- (void)setTitle:(id)a3
{
  unint64_t v10 = (unint64_t)a3;
  uint64_t v4 = [(MTEpisode *)self title];
  unint64_t v5 = v10 | v4;

  if (v5)
  {
    id v6 = [(MTEpisode *)self title];
    unsigned __int8 v7 = [v6 isEqualToString:v10];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = kEpisodeTitle;
      [(MTEpisode *)self willChangeValueForKey:kEpisodeTitle];
      [(MTEpisode *)self setPrimitiveValue:v10 forKey:v8];
      [(MTEpisode *)self didChangeValueForKey:v8];
      unint64_t v9 = [(MTEpisode *)self guid];

      if (!v9) {
        [(MTEpisode *)self updateUPPIdentifierIfNeeded];
      }
    }
  }
}

- (void)setAuthor:(id)a3
{
  unint64_t v10 = (unint64_t)a3;
  uint64_t v4 = [(MTEpisode *)self author];
  unint64_t v5 = v10 | v4;

  if (v5)
  {
    id v6 = [(MTEpisode *)self author];
    unsigned __int8 v7 = [v6 isEqualToString:v10];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = kEpisodeAuthor;
      [(MTEpisode *)self willChangeValueForKey:kEpisodeAuthor];
      [(MTEpisode *)self setPrimitiveValue:v10 forKey:v8];
      [(MTEpisode *)self didChangeValueForKey:v8];
      unint64_t v9 = [(MTEpisode *)self guid];

      if (!v9) {
        [(MTEpisode *)self updateUPPIdentifierIfNeeded];
      }
    }
  }
}

- (BOOL)isPlayable
{
  return [(MTEpisode *)self reasonForNotPlayable] == 0;
}

- (int64_t)reasonForNotPlayable
{
  return +[MTEpisodeUnavailableUtil unavailableReasonForEpisode:self];
}

- (void)didChangePersistentID
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(MTEpisode *)self playlists];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) updateUnplayedCount];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)setPlayCount:(int64_t)a3
{
  if ([(MTEpisode *)self playCount] != (id)a3)
  {
    uint64_t v5 = kEpisodePlayCount;
    [(MTEpisode *)self willChangeValueForKey:kEpisodePlayCount];
    id v6 = +[NSNumber numberWithLongLong:a3];
    [(MTEpisode *)self setPrimitiveValue:v6 forKey:v5];

    [(MTEpisode *)self didChangeValueForKey:v5];
    [(MTEpisode *)self updateUPPTimestamp];
  }
}

- (void)setPlayhead:(float)a3
{
  [(MTEpisode *)self playhead];
  float v6 = v5;
  [(MTEpisode *)self playhead];
  if (*(float *)&v7 != a3)
  {
    *(float *)&double v7 = vabds_f32(v6, a3);
    if (a3 == 0.0 || *(float *)&v7 >= 0.5)
    {
      uint64_t v9 = kEpisodePlayhead;
      -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", kEpisodePlayhead, v7);
      *(float *)&double v10 = a3;
      unsigned int v11 = +[NSNumber numberWithFloat:v10];
      [(MTEpisode *)self setPrimitiveValue:v11 forKey:v9];

      [(MTEpisode *)self didChangeValueForKey:v9];
      [(MTEpisode *)self updateUPPTimestamp];
    }
  }
}

- (BOOL)isCurrentPlayerItem
{
  id v3 = +[MTPlayerController defaultInstance];
  id v4 = [(MTEpisode *)self uuid];
  unsigned __int8 v5 = [v3 isPlayingEpisodeUuid:v4];

  return v5;
}

- (void)updateUPPIdentifierIfNeeded
{
  id v3 = _MTLogCategoryUPPSync();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  unsigned __int8 v5 = _MTLogCategoryUPPSync();
  float v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v30) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "updateUPPIdentifierIfNeeded", "", (uint8_t *)&v30, 2u);
  }

  double v7 = +[MTUniversalPlaybackPositionDataSource mediaItemIdentifierForEpisode:self];
  long long v8 = [(MTEpisode *)self metadataIdentifier];
  unsigned __int8 v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    double v10 = _MTLogCategoryUPPSync();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v11 = [(MTEpisode *)self title];
      v12 = [(MTEpisode *)self uuid];
      uint64_t v13 = [(MTEpisode *)self metadataIdentifier];
      int v30 = 138543874;
      v31 = v11;
      __int16 v32 = 2114;
      v33 = v12;
      __int16 v34 = 2114;
      v35 = v13;
      int v14 = "[UpdateUPPID] Skipping, equal metadata identifier: %{public}@, %{public}@, %{public}@";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v30, 0x20u);

      goto LABEL_17;
    }
  }
  else
  {
    [(MTEpisode *)self setMetadataIdentifier:v7];
    [(MTEpisode *)self metadataTimestamp];
    double v16 = v15;
    double v10 = _MTLogCategoryUPPSync();
    BOOL v17 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v16 == 0.0)
    {
      if (v17)
      {
        v18 = [(MTEpisode *)self title];
        v19 = [(MTEpisode *)self uuid];
        v20 = [(MTEpisode *)self metadataIdentifier];
        int v30 = 138543874;
        v31 = v18;
        __int16 v32 = 2114;
        v33 = v19;
        __int16 v34 = 2114;
        v35 = v20;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[UpdateUPPID] Looking up UPP data for: %{public}@, %{public}@, %{public}@", (uint8_t *)&v30, 0x20u);
      }
      double v10 = [(MTEpisode *)self managedObjectContext];
      unsigned int v11 = [v10 uppMetadataForMetadataIdentifier:v7];
      v12 = _MTLogCategoryUPPSync();
      BOOL v21 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v21)
        {
          v22 = [(MTEpisode *)self title];
          v23 = [(MTEpisode *)self uuid];
          v24 = [(MTEpisode *)self metadataIdentifier];
          int v30 = 138543874;
          v31 = v22;
          __int16 v32 = 2114;
          v33 = v23;
          __int16 v34 = 2114;
          v35 = v24;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[UpdateUPPID] Setting UPP data for: %{public}@, %{public}@, %{public}@", (uint8_t *)&v30, 0x20u);
        }
        +[MTUniversalPlaybackPositionDataSource updateEpisode:self withUPPMetadata:v11];
        goto LABEL_18;
      }
      if (v21)
      {
        v27 = [(MTEpisode *)self title];
        v28 = [(MTEpisode *)self uuid];
        v29 = [(MTEpisode *)self metadataIdentifier];
        int v30 = 138543874;
        v31 = v27;
        __int16 v32 = 2114;
        v33 = v28;
        __int16 v34 = 2114;
        v35 = v29;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[UpdateUPPID] Skipping, no UPP metadata: %{public}@, %{public}@, %{public}@", (uint8_t *)&v30, 0x20u);
      }
LABEL_17:

LABEL_18:
      goto LABEL_19;
    }
    if (v17)
    {
      unsigned int v11 = [(MTEpisode *)self title];
      v12 = [(MTEpisode *)self uuid];
      uint64_t v13 = [(MTEpisode *)self metadataIdentifier];
      int v30 = 138543874;
      v31 = v11;
      __int16 v32 = 2114;
      v33 = v12;
      __int16 v34 = 2114;
      v35 = v13;
      int v14 = "[UpdateUPPID] Skipping, timestamp >0: %{public}@, %{public}@, %{public}@";
      goto LABEL_16;
    }
  }
LABEL_19:

  v25 = _MTLogCategoryUPPSync();
  v26 = v25;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    LOWORD(v30) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, v4, "updateUPPIdentifierIfNeeded", "", (uint8_t *)&v30, 2u);
  }
}

- (MTEpisodeIdentifier)episodeIdentifier
{
  return +[MTEpisodeIdentifier identifierWithEpisode:self];
}

- (BOOL)isEpisodeVisited
{
  if (![(MTEpisode *)self isNew]) {
    return 1;
  }
  id v3 = +[MTVisitedEpisodeManager sharedInstance];
  unsigned __int8 v4 = [v3 hasEndedVisitingEpisode:self];

  return v4;
}

@end