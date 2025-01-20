@interface MTNotificationEpisode
+ (unint64_t)versionOfDictionaryRepresentation:(id)a3;
- (BOOL)isVideo;
- (MTNotificationEpisode)initWithDictionaryRepresentation:(id)a3;
- (MTNotificationEpisode)initWithUuid:(id)a3 storeTrackId:(int64_t)a4 bestTitle:(id)a5 bestSummary:(id)a6 pubDate:(id)a7 duration:(double)a8 byteSize:(int64_t)a9 isVideo:(BOOL)a10 sortPropertyValues:(id)a11 podcastUuid:(id)a12 podcastTitle:(id)a13 podcastStoreCollectionId:(int64_t)a14;
- (NSDate)pubDate;
- (NSDictionary)sortPropertyValues;
- (NSString)bestSummary;
- (NSString)bestTitle;
- (NSString)podcastTitle;
- (NSString)podcastUuid;
- (NSString)uuid;
- (double)duration;
- (id)_representationByMigratingLegacyKeysInRepresentation:(id)a3;
- (id)dictionaryRepresentation;
- (int64_t)byteSize;
- (int64_t)podcastStoreCollectionId;
- (int64_t)storeTrackId;
- (void)_upgradeRepresentationFrom0To1:(id)a3;
@end

@implementation MTNotificationEpisode

+ (unint64_t)versionOfDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"_version"];

  if (v4)
  {
    v5 = [v3 objectForKeyedSubscript:@"_version"];
    id v4 = [v5 unsignedIntegerValue];
  }
  return (unint64_t)v4;
}

- (MTNotificationEpisode)initWithUuid:(id)a3 storeTrackId:(int64_t)a4 bestTitle:(id)a5 bestSummary:(id)a6 pubDate:(id)a7 duration:(double)a8 byteSize:(int64_t)a9 isVideo:(BOOL)a10 sortPropertyValues:(id)a11 podcastUuid:(id)a12 podcastTitle:(id)a13 podcastStoreCollectionId:(int64_t)a14
{
  id v20 = a3;
  id v21 = a5;
  id obj = a6;
  id v22 = a6;
  id v31 = a7;
  id v33 = a7;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  v34.receiver = self;
  v34.super_class = (Class)MTNotificationEpisode;
  v26 = [(MTNotificationEpisode *)&v34 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_uuid, a3);
    v27->_storeTrackId = a4;
    objc_storeStrong((id *)&v27->_bestTitle, a5);
    objc_storeStrong((id *)&v27->_bestSummary, obj);
    objc_storeStrong((id *)&v27->_pubDate, v31);
    v27->_duration = a8;
    v27->_byteSize = a9;
    v27->_isVideo = a10;
    objc_storeStrong((id *)&v27->_sortPropertyValues, a11);
    objc_storeStrong((id *)&v27->_podcastUuid, a12);
    objc_storeStrong((id *)&v27->_podcastTitle, a13);
    v27->_podcastStoreCollectionId = a14;
  }

  return v27;
}

- (MTNotificationEpisode)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MTNotificationEpisode;
  v5 = [(MTNotificationEpisode *)&v29 init];
  v6 = v5;
  if (v5)
  {
    v7 = [(MTNotificationEpisode *)v5 _representationByMigratingLegacyKeysInRepresentation:v4];

    uint64_t v8 = [v7 objectForKeyedSubscript:@"episodeUuid"];
    uuid = v6->_uuid;
    v6->_uuid = (NSString *)v8;

    v10 = [v7 objectForKeyedSubscript:@"episodeStoreTrackId"];
    v6->_storeTrackId = (int64_t)[v10 longLongValue];

    uint64_t v11 = [v7 objectForKeyedSubscript:@"bestTitle"];
    bestTitle = v6->_bestTitle;
    v6->_bestTitle = (NSString *)v11;

    uint64_t v13 = [v7 objectForKeyedSubscript:@"bestSummary"];
    bestSummary = v6->_bestSummary;
    v6->_bestSummary = (NSString *)v13;

    uint64_t v15 = [v7 objectForKeyedSubscript:@"pubDate"];
    pubDate = v6->_pubDate;
    v6->_pubDate = (NSDate *)v15;

    v17 = [v7 objectForKeyedSubscript:@"durationNumber"];
    [v17 doubleValue];
    v6->_duration = v18;

    v19 = [v7 objectForKeyedSubscript:@"byteSizeNumber"];
    v6->_byteSize = (int64_t)[v19 longLongValue];

    id v20 = [v7 objectForKeyedSubscript:@"isVideoNumber"];
    v6->_isVideo = [v20 BOOLValue];

    uint64_t v21 = [v7 objectForKeyedSubscript:@"sortPropertyValues"];
    sortPropertyValues = v6->_sortPropertyValues;
    v6->_sortPropertyValues = (NSDictionary *)v21;

    uint64_t v23 = [v7 objectForKeyedSubscript:@"podcastUuid"];
    podcastUuid = v6->_podcastUuid;
    v6->_podcastUuid = (NSString *)v23;

    uint64_t v25 = [v7 objectForKeyedSubscript:@"podcastTitle"];
    podcastTitle = v6->_podcastTitle;
    v6->_podcastTitle = (NSString *)v25;

    v27 = [v7 objectForKeyedSubscript:@"podcastStoreCollectionId"];
    v6->_podcastStoreCollectionId = (int64_t)[v27 longLongValue];

    id v4 = v7;
  }

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = [(MTNotificationEpisode *)self uuid];
  v5 = (void *)v4;
  if (v4) {
    CFStringRef v6 = (const __CFString *)v4;
  }
  else {
    CFStringRef v6 = &stru_10002D2B8;
  }
  [v3 setObject:v6 forKeyedSubscript:@"episodeUuid"];

  v7 = +[NSNumber numberWithLongLong:[(MTNotificationEpisode *)self storeTrackId]];
  [v3 setObject:v7 forKeyedSubscript:@"episodeStoreTrackId"];

  uint64_t v8 = [(MTNotificationEpisode *)self bestTitle];
  v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = &stru_10002D2B8;
  }
  [v3 setObject:v10 forKeyedSubscript:@"bestTitle"];

  uint64_t v11 = [(MTNotificationEpisode *)self bestSummary];
  v12 = (void *)v11;
  if (v11) {
    CFStringRef v13 = (const __CFString *)v11;
  }
  else {
    CFStringRef v13 = &stru_10002D2B8;
  }
  [v3 setObject:v13 forKeyedSubscript:@"bestSummary"];

  pubDate = self->_pubDate;
  if (pubDate) {
    [v3 setObject:pubDate forKeyedSubscript:@"pubDate"];
  }
  [(MTNotificationEpisode *)self duration];
  uint64_t v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v15 forKeyedSubscript:@"durationNumber"];

  v16 = +[NSNumber numberWithLongLong:[(MTNotificationEpisode *)self byteSize]];
  [v3 setObject:v16 forKeyedSubscript:@"byteSizeNumber"];

  v17 = +[NSNumber numberWithBool:[(MTNotificationEpisode *)self isVideo]];
  [v3 setObject:v17 forKeyedSubscript:@"isVideoNumber"];

  uint64_t v18 = [(MTNotificationEpisode *)self sortPropertyValues];
  v19 = (void *)v18;
  if (v18) {
    id v20 = (void *)v18;
  }
  else {
    id v20 = &__NSDictionary0__struct;
  }
  [v3 setObject:v20 forKeyedSubscript:@"sortPropertyValues"];

  uint64_t v21 = [(MTNotificationEpisode *)self podcastUuid];
  id v22 = (void *)v21;
  if (v21) {
    CFStringRef v23 = (const __CFString *)v21;
  }
  else {
    CFStringRef v23 = &stru_10002D2B8;
  }
  [v3 setObject:v23 forKeyedSubscript:@"podcastUuid"];

  uint64_t v24 = [(MTNotificationEpisode *)self podcastTitle];
  uint64_t v25 = (void *)v24;
  if (v24) {
    CFStringRef v26 = (const __CFString *)v24;
  }
  else {
    CFStringRef v26 = &stru_10002D2B8;
  }
  [v3 setObject:v26 forKeyedSubscript:@"podcastTitle"];

  v27 = +[NSNumber numberWithLongLong:[(MTNotificationEpisode *)self podcastStoreCollectionId]];
  [v3 setObject:v27 forKeyedSubscript:@"podcastStoreCollectionId"];

  [v3 setObject:&off_10002E058 forKeyedSubscript:@"_version"];

  return v3;
}

- (id)_representationByMigratingLegacyKeysInRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() versionOfDictionaryRepresentation:v4];
  if (v5 == (id)1)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v8 = (uint64_t)v5;
    id v6 = [v4 mutableCopy];
    if (!v8)
    {
      [(MTNotificationEpisode *)self _upgradeRepresentationFrom0To1:v6];
      uint64_t v8 = 1;
      goto LABEL_10;
    }
    while (v8 != 1)
    {
LABEL_10:
      v9 = +[NSNumber numberWithUnsignedInteger:v8];
      [v6 setObject:v9 forKeyedSubscript:@"_version"];
    }
  }

  return v6;
}

- (void)_upgradeRepresentationFrom0To1:(id)a3
{
  id v8 = a3;
  id v3 = [v8 objectForKeyedSubscript:@"bestTitle"];

  if (!v3)
  {
    id v4 = [v8 objectForKeyedSubscript:@"episodeTitle"];
    [v8 setObject:v4 forKeyedSubscript:@"bestTitle"];
  }
  id v5 = [v8 objectForKeyedSubscript:@"bestSummary"];

  if (!v5)
  {
    id v6 = [v8 objectForKeyedSubscript:@"itemDescription"];
    v7 = [v6 stringBySmartlyStrippingHTML];
    [v8 setObject:v7 forKeyedSubscript:@"bestSummary"];
  }
}

- (NSString)uuid
{
  return self->_uuid;
}

- (int64_t)storeTrackId
{
  return self->_storeTrackId;
}

- (NSString)bestTitle
{
  return self->_bestTitle;
}

- (NSString)bestSummary
{
  return self->_bestSummary;
}

- (NSDate)pubDate
{
  return self->_pubDate;
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)byteSize
{
  return self->_byteSize;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (NSDictionary)sortPropertyValues
{
  return self->_sortPropertyValues;
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (NSString)podcastTitle
{
  return self->_podcastTitle;
}

- (int64_t)podcastStoreCollectionId
{
  return self->_podcastStoreCollectionId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_podcastTitle, 0);
  objc_storeStrong((id *)&self->_podcastUuid, 0);
  objc_storeStrong((id *)&self->_sortPropertyValues, 0);
  objc_storeStrong((id *)&self->_pubDate, 0);
  objc_storeStrong((id *)&self->_bestSummary, 0);
  objc_storeStrong((id *)&self->_bestTitle, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end