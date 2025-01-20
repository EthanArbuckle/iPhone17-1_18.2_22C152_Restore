@interface DatabaseEpisodePropertySource
+ (id)computedPropertiesToFetch;
+ (id)computedPropertyKeyForBestSummary;
+ (id)computedPropertyKeyForBestTitle;
+ (id)propertiesToFetch;
+ (id)sortProperties;
+ (void)fetchSourceForEpisodeUuids:(id)a3 completion:(id)a4;
- (BOOL)isSourceOfTruth;
- (BOOL)isVideo;
- (BOOL)requiresForegroundLaunch;
- (DatabaseEpisodePropertySource)initWithFetchedPropertyValues:(id)a3;
- (NSDate)pubDate;
- (NSString)bestSummary;
- (NSString)bestTitle;
- (NSString)episodeUuid;
- (NSString)podcastTitle;
- (NSString)podcastUuid;
- (double)duration;
- (id)localizedDateString;
- (id)localizedDurationAndPodcastTitleString;
- (id)localizedDurationString;
- (id)openEpisodeDetailInAppURL;
- (id)openPodcastDetailInAppURL;
- (id)preloadedImageWithSize:(CGSize)a3;
- (id)summary;
- (id)title;
- (id)uuid;
- (int64_t)byteSize;
- (int64_t)storeCollectionId;
- (int64_t)storeTrackId;
- (void)initiatePlaybackWithCompletion:(id)a3;
- (void)setBestSummary:(id)a3;
- (void)setBestTitle:(id)a3;
- (void)setByteSize:(int64_t)a3;
- (void)setDuration:(double)a3;
- (void)setEpisodeUuid:(id)a3;
- (void)setIsVideo:(BOOL)a3;
- (void)setPodcastTitle:(id)a3;
- (void)setPodcastUuid:(id)a3;
- (void)setPubDate:(id)a3;
- (void)setStoreCollectionId:(int64_t)a3;
- (void)setStoreTrackId:(int64_t)a3;
@end

@implementation DatabaseEpisodePropertySource

+ (id)computedPropertyKeyForBestTitle
{
  return NSStringFromSelector("bestTitle");
}

+ (id)computedPropertyKeyForBestSummary
{
  return NSStringFromSelector("bestSummary");
}

+ (void)fetchSourceForEpisodeUuids:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  id v8 = [v6 count];
  if (!v7 || !v8)
  {
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    v7[2](v7, 0);
    goto LABEL_7;
  }
  if ((+[MTDB canExtensionOpenDatabase] & 1) == 0) {
    goto LABEL_6;
  }
  v9 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EF14;
  block[3] = &unk_10002CE80;
  id v11 = v6;
  id v13 = a1;
  v12 = v7;
  dispatch_async(v9, block);

LABEL_7:
}

- (BOOL)requiresForegroundLaunch
{
  return self->_isVideo;
}

+ (id)sortProperties
{
  return +[MTPodcast allPossibleEpisodeListSortOrderProperties];
}

+ (id)computedPropertiesToFetch
{
  v3 = +[NSMutableSet set];
  v4 = [a1 computedPropertyKeyForBestTitle];
  [v3 addObject:v4];

  v5 = [a1 computedPropertyKeyForBestSummary];
  [v3 addObject:v5];

  return v3;
}

+ (id)propertiesToFetch
{
  v3 = +[NSMutableArray array];
  v13[0] = kEpisodeUuid;
  v13[1] = kEpisodeStoreTrackId;
  v13[2] = kEpisodePubDate;
  v13[3] = kEpisodeDuration;
  v13[4] = kEpisodeByteSize;
  v4 = +[NSArray arrayWithObjects:v13 count:5];
  [v3 addObjectsFromArray:v4];

  v5 = +[MTEpisode propertyPathForPodcastProperty:kPodcastUuid];
  v12[0] = v5;
  id v6 = +[MTEpisode propertyPathForPodcastProperty:kPodcastTitle];
  v12[1] = v6;
  v7 = +[MTEpisode propertyPathForPodcastProperty:kPodcastStoreCollectionId];
  v12[2] = v7;
  id v8 = +[NSArray arrayWithObjects:v12 count:3];
  [v3 addObjectsFromArray:v8];

  v9 = [a1 sortProperties];
  [v3 addObjectsFromArray:v9];

  v10 = +[NSSet setWithArray:v3];

  return v10;
}

- (DatabaseEpisodePropertySource)initWithFetchedPropertyValues:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)DatabaseEpisodePropertySource;
  v5 = [(DatabaseEpisodePropertySource *)&v25 init];
  if (v5)
  {
    id v6 = [v4 objectForKeyedSubscript:kEpisodeUuid];
    [(DatabaseEpisodePropertySource *)v5 setEpisodeUuid:v6];

    v7 = [(id)objc_opt_class() computedPropertyKeyForBestTitle];
    id v8 = [v4 objectForKeyedSubscript:v7];
    [(DatabaseEpisodePropertySource *)v5 setBestTitle:v8];

    v9 = [(id)objc_opt_class() computedPropertyKeyForBestSummary];
    v10 = [v4 objectForKeyedSubscript:v9];
    [(DatabaseEpisodePropertySource *)v5 setBestSummary:v10];

    id v11 = [v4 objectForKeyedSubscript:kEpisodeStoreTrackId];
    -[DatabaseEpisodePropertySource setStoreTrackId:](v5, "setStoreTrackId:", [v11 longLongValue]);

    v12 = +[MTEpisode propertyPathForPodcastProperty:kPodcastUuid];
    id v13 = [v4 objectForKeyedSubscript:v12];
    [(DatabaseEpisodePropertySource *)v5 setPodcastUuid:v13];

    v14 = +[MTEpisode propertyPathForPodcastProperty:kPodcastTitle];
    v15 = [v4 objectForKeyedSubscript:v14];
    [(DatabaseEpisodePropertySource *)v5 setPodcastTitle:v15];

    v16 = +[MTEpisode propertyPathForPodcastProperty:kPodcastStoreCollectionId];
    v17 = [v4 objectForKeyedSubscript:v16];
    -[DatabaseEpisodePropertySource setStoreCollectionId:](v5, "setStoreCollectionId:", [v17 longLongValue]);

    v18 = [v4 objectForKeyedSubscript:kEpisodePubDate];
    [(DatabaseEpisodePropertySource *)v5 setPubDate:v18];

    v19 = [v4 objectForKeyedSubscript:kEpisodeDuration];
    [v19 doubleValue];
    -[DatabaseEpisodePropertySource setDuration:](v5, "setDuration:");

    v20 = [v4 objectForKeyedSubscript:kEpisodeByteSize];
    -[DatabaseEpisodePropertySource setByteSize:](v5, "setByteSize:", [v20 longLongValue]);

    v21 = [v4 objectForKeyedSubscript:kEpisodeVideo];
    -[DatabaseEpisodePropertySource setIsVideo:](v5, "setIsVideo:", [v21 BOOLValue]);

    v22 = [(id)objc_opt_class() sortProperties];
    v23 = [v4 mt_subdictionaryWithKeys:v22];
    [(BaseEpisodePropertySource *)v5 setSortPropertyValues:v23];
  }
  return v5;
}

- (BOOL)isSourceOfTruth
{
  return 1;
}

- (id)uuid
{
  return self->_episodeUuid;
}

- (id)title
{
  return self->_bestTitle;
}

- (NSString)podcastTitle
{
  return self->_podcastTitle;
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (id)summary
{
  return self->_bestSummary;
}

- (id)localizedDateString
{
  v3 = [(DatabaseEpisodePropertySource *)self pubDate];
  id v4 = [(BaseEpisodePropertySource *)self _localizedDateStringForDate:v3];

  return v4;
}

- (id)localizedDurationString
{
  [(DatabaseEpisodePropertySource *)self duration];

  return -[BaseEpisodePropertySource _localizedStringForDuration:](self, "_localizedStringForDuration:");
}

- (id)localizedDurationAndPodcastTitleString
{
  [(DatabaseEpisodePropertySource *)self duration];
  double v4 = v3;
  v5 = [(DatabaseEpisodePropertySource *)self podcastTitle];
  id v6 = [(BaseEpisodePropertySource *)self _localizedStringForDuration:v5 podcastTitle:v4];

  return v6;
}

- (id)preloadedImageWithSize:(CGSize)a3
{
  return 0;
}

- (id)openPodcastDetailInAppURL
{
  double v3 = [(DatabaseEpisodePropertySource *)self podcastUuid];
  double v4 = [(BaseEpisodePropertySource *)self _openPodcastDetailInAppURLForPodcastUuid:v3 podcastStoreCollectionId:[(DatabaseEpisodePropertySource *)self storeCollectionId]];

  return v4;
}

- (id)openEpisodeDetailInAppURL
{
  double v3 = [(DatabaseEpisodePropertySource *)self episodeUuid];
  double v4 = [(BaseEpisodePropertySource *)self _openEpisodeDetailInAppURLForEpisodeUuid:v3 episodeStoreTrackId:[(DatabaseEpisodePropertySource *)self storeTrackId] podcastStoreCollectionId:[(DatabaseEpisodePropertySource *)self storeCollectionId]];

  return v4;
}

- (void)initiatePlaybackWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(DatabaseEpisodePropertySource *)self episodeUuid];
  int64_t v6 = [(DatabaseEpisodePropertySource *)self storeTrackId];
  v7 = [(DatabaseEpisodePropertySource *)self podcastUuid];
  int64_t v8 = [(DatabaseEpisodePropertySource *)self storeCollectionId];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000FCB0;
  v10[3] = &unk_10002CDE0;
  id v11 = v4;
  id v9 = v4;
  [(BaseEpisodePropertySource *)self _initiatePlaybackWithDefaultBehaviorForEpisodeUUid:v5 episodeStoreTrackId:v6 podcastUuid:v7 podcastStoreCollectionId:v8 completion:v10];
}

- (NSString)episodeUuid
{
  return self->_episodeUuid;
}

- (void)setEpisodeUuid:(id)a3
{
}

- (NSString)bestTitle
{
  return self->_bestTitle;
}

- (void)setBestTitle:(id)a3
{
}

- (NSString)bestSummary
{
  return self->_bestSummary;
}

- (void)setBestSummary:(id)a3
{
}

- (int64_t)storeTrackId
{
  return self->_storeTrackId;
}

- (void)setStoreTrackId:(int64_t)a3
{
  self->_storeTrackId = a3;
}

- (NSDate)pubDate
{
  return self->_pubDate;
}

- (void)setPubDate:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)byteSize
{
  return self->_byteSize;
}

- (void)setByteSize:(int64_t)a3
{
  self->_byteSize = a3;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_isVideo = a3;
}

- (void)setPodcastUuid:(id)a3
{
}

- (void)setPodcastTitle:(id)a3
{
}

- (int64_t)storeCollectionId
{
  return self->_storeCollectionId;
}

- (void)setStoreCollectionId:(int64_t)a3
{
  self->_storeCollectionId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_podcastTitle, 0);
  objc_storeStrong((id *)&self->_podcastUuid, 0);
  objc_storeStrong((id *)&self->_pubDate, 0);
  objc_storeStrong((id *)&self->_bestSummary, 0);
  objc_storeStrong((id *)&self->_bestTitle, 0);

  objc_storeStrong((id *)&self->_episodeUuid, 0);
}

@end