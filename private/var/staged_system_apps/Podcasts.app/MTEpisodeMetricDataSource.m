@interface MTEpisodeMetricDataSource
- (BOOL)isEqual:(id)a3;
- (MTEpisodeIdentifier)episodeIdentifier;
- (MTEpisodeMetricDataSource)initWithEpisodeIdentifier:(id)a3;
- (MTEpisodeMetricDataSource)initWithPlayerItem:(id)a3;
- (NSString)podcastState;
- (double)duration;
- (id)_contentGUID;
- (id)_contentId;
- (id)_duration;
- (id)_itemType;
- (id)_mediaType;
- (id)_podcastFeedURL;
- (id)_podcastId;
- (id)_podcastState;
- (id)_podcastStateForPlayerItem:(id)a3;
- (id)_providerId;
- (id)metricsAdditionalData;
- (id)metricsContentIdentifier;
- (unint64_t)_itemTypeForEpisode:(id)a3;
- (unint64_t)_itemTypeForPlayerItem:(id)a3;
- (unint64_t)_mediaTypeForEpisode:(id)a3;
- (unint64_t)_mediaTypeForPlayerItem:(id)a3;
- (unint64_t)hash;
- (unint64_t)itemType;
- (unint64_t)mediaType;
- (void)setDuration:(double)a3;
- (void)setItemType:(unint64_t)a3;
- (void)setMediaType:(unint64_t)a3;
- (void)setPodcastState:(id)a3;
@end

@implementation MTEpisodeMetricDataSource

- (MTEpisodeMetricDataSource)initWithEpisodeIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTEpisodeMetricDataSource;
  v6 = [(MTEpisodeMetricDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_episodeIdentifier, a3);
  }

  return v7;
}

- (MTEpisodeMetricDataSource)initWithPlayerItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 episodeIdentifier];
  v6 = [(MTEpisodeMetricDataSource *)self initWithEpisodeIdentifier:v5];

  if (v6)
  {
    [v4 duration];
    v6->_duration = v7;
    v6->_mediaType = [(MTEpisodeMetricDataSource *)v6 _mediaTypeForPlayerItem:v4];
    v6->_itemType = [(MTEpisodeMetricDataSource *)v6 _itemTypeForPlayerItem:v4];
    uint64_t v8 = [(MTEpisodeMetricDataSource *)v6 _podcastStateForPlayerItem:v4];
    podcastState = v6->_podcastState;
    v6->_podcastState = (NSString *)v8;
  }
  return v6;
}

- (unint64_t)_mediaTypeForEpisode:(id)a3
{
  id v3 = a3;
  id v4 = [v3 managedObjectContext];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011DAA0;
  v8[3] = &unk_10054DF08;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  [v4 performBlockAndWait:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (unint64_t)_itemTypeForEpisode:(id)a3
{
  id v3 = a3;
  id v4 = [v3 managedObjectContext];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011DBF8;
  v8[3] = &unk_10054DF08;
  id v5 = v3;
  id v9 = v5;
  v10 = &v11;
  [v4 performBlockAndWait:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (unint64_t)_mediaTypeForPlayerItem:(id)a3
{
  if ([a3 isVideo]) {
    return 2;
  }
  else {
    return a3 != 0;
  }
}

- (unint64_t)_itemTypeForPlayerItem:(id)a3
{
  if ([a3 isLocal]) {
    return 2;
  }
  else {
    return a3 != 0;
  }
}

- (id)_podcastStateForPlayerItem:(id)a3
{
  id v3 = a3;
  id v4 = +[PodcastsStateCoordinator shared];
  id v5 = [v3 podcastUuid];

  unint64_t v6 = [v4 currentPodcastStateDescriptionFrom:v5];

  return v6;
}

- (id)_contentId
{
  v2 = [(MTEpisodeMetricDataSource *)self episodeIdentifier];
  id v3 = [v2 episodeSerpentID];
  id v4 = [v3 stringValue];

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = &stru_10056A8A0;
  }
  unint64_t v6 = v5;

  return v6;
}

- (id)_contentGUID
{
  v2 = [(MTEpisodeMetricDataSource *)self episodeIdentifier];
  id v3 = [v2 episodeGUID];

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = &stru_10056A8A0;
  }
  id v5 = v4;

  return v5;
}

- (id)_podcastId
{
  v2 = [(MTEpisodeMetricDataSource *)self episodeIdentifier];
  id v3 = [v2 podcastAdamID];
  id v4 = [v3 stringValue];

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = &stru_10056A8A0;
  }
  unint64_t v6 = v5;

  return v6;
}

- (id)_podcastFeedURL
{
  v2 = [(MTEpisodeMetricDataSource *)self episodeIdentifier];
  id v3 = [v2 currentPodcastFeedURL];

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = &stru_10056A8A0;
  }
  id v5 = v4;

  return v5;
}

- (id)_providerId
{
  return &stru_10056A8A0;
}

- (id)_mediaType
{
  unint64_t v2 = [(MTEpisodeMetricDataSource *)self mediaType];
  if (v2 - 1 > 2) {
    return @"unknown";
  }
  else {
    return off_1005521E8[v2 - 1];
  }
}

- (id)_itemType
{
  unint64_t v2 = [(MTEpisodeMetricDataSource *)self itemType];
  CFStringRef v3 = @"unknown";
  if (v2 == 2) {
    CFStringRef v3 = @"download";
  }
  if (v2 == 1) {
    return @"stream";
  }
  else {
    return (id)v3;
  }
}

- (id)_podcastState
{
  return [(MTEpisodeMetricDataSource *)self podcastState];
}

- (id)_duration
{
  [(MTEpisodeMetricDataSource *)self duration];

  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
}

- (id)metricsContentIdentifier
{
  return [(MTEpisodeMetricDataSource *)self _contentId];
}

- (id)metricsAdditionalData
{
  v13[0] = @"contentGUID";
  CFStringRef v3 = [(MTEpisodeMetricDataSource *)self _contentGUID];
  v14[0] = v3;
  v13[1] = @"contentLength";
  id v4 = [(MTEpisodeMetricDataSource *)self _duration];
  v14[1] = v4;
  v13[2] = @"podcastId";
  id v5 = [(MTEpisodeMetricDataSource *)self _podcastId];
  v14[2] = v5;
  v13[3] = @"podcastFeedURL";
  unint64_t v6 = [(MTEpisodeMetricDataSource *)self _podcastFeedURL];
  v14[3] = v6;
  v13[4] = @"providerId";
  double v7 = [(MTEpisodeMetricDataSource *)self _providerId];
  v14[4] = v7;
  v13[5] = @"mediaType";
  uint64_t v8 = [(MTEpisodeMetricDataSource *)self _mediaType];
  v14[5] = v8;
  v13[6] = @"itemType";
  id v9 = [(MTEpisodeMetricDataSource *)self _itemType];
  v14[6] = v9;
  v13[7] = @"podcastState";
  v10 = [(MTEpisodeMetricDataSource *)self _podcastState];
  v14[7] = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:8];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [v5 metricsContentIdentifier];
    double v7 = [(MTEpisodeMetricDataSource *)self metricsContentIdentifier];
    unsigned int v8 = [v6 isEqual:v7];

    if (v8)
    {
      id v9 = [v5 metricsAdditionalData];
      v10 = [(MTEpisodeMetricDataSource *)self metricsAdditionalData];
      unsigned __int8 v11 = [v9 isEqualToDictionary:v10];
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  CFStringRef v3 = [(MTEpisodeMetricDataSource *)self metricsContentIdentifier];
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = [(MTEpisodeMetricDataSource *)self metricsAdditionalData];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (MTEpisodeIdentifier)episodeIdentifier
{
  return self->_episodeIdentifier;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unint64_t)a3
{
  self->_mediaType = a3;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(unint64_t)a3
{
  self->_itemType = a3;
}

- (NSString)podcastState
{
  return self->_podcastState;
}

- (void)setPodcastState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_podcastState, 0);

  objc_storeStrong((id *)&self->_episodeIdentifier, 0);
}

@end