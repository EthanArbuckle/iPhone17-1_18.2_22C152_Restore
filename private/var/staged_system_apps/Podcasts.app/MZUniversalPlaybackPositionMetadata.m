@interface MZUniversalPlaybackPositionMetadata
+ (id)keyValueStoreItemIdentifierForItem:(id)a3;
+ (id)metadataWithValuesFromDataSourceItem:(id)a3;
+ (id)metadataWithValuesItemIdentifier:(id)a3 keyValueStorePayload:(id)a4;
- (BOOL)hasBeenPlayed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNew;
- (BOOL)playStateManuallySet;
- (MZUniversalPlaybackPositionMetadata)init;
- (NSString)itemIdentifier;
- (double)bookmarkTime;
- (double)lastDatePlayed;
- (double)lastUserMarkedAsPlayedDate;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)keyValueStorePayload;
- (unint64_t)hash;
- (unint64_t)playCount;
- (void)setBookmarkTime:(double)a3;
- (void)setHasBeenPlayed:(BOOL)a3;
- (void)setIsNew:(BOOL)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setLastDatePlayed:(double)a3;
- (void)setLastUserMarkedAsPlayedDate:(double)a3;
- (void)setPlayCount:(unint64_t)a3;
- (void)setPlayStateManuallySet:(BOOL)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation MZUniversalPlaybackPositionMetadata

- (MZUniversalPlaybackPositionMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)MZUniversalPlaybackPositionMetadata;
  return [(MZUniversalPlaybackPositionMetadata *)&v3 init];
}

- (id)description
{
  v18.receiver = self;
  v18.super_class = (Class)MZUniversalPlaybackPositionMetadata;
  objc_super v3 = [(MZUniversalPlaybackPositionMetadata *)&v18 description];
  v4 = [(MZUniversalPlaybackPositionMetadata *)self itemIdentifier];
  [(MZUniversalPlaybackPositionMetadata *)self bookmarkTime];
  v6 = +[NSString stringWithFormat:@"%02lu:%02lu:%.2f", (uint64_t)(v5 / 3600.0), (uint64_t)((v5 - (double)(3600 * (uint64_t)(v5 / 3600.0))) / 60.0), v5- (double)(3600 * (uint64_t)(v5 / 3600.0))- (double)(60 * (uint64_t)((v5 - (double)(3600 * (uint64_t)(v5 / 3600.0))) / 60.0))];
  unsigned int v7 = [(MZUniversalPlaybackPositionMetadata *)self hasBeenPlayed];
  unint64_t v8 = [(MZUniversalPlaybackPositionMetadata *)self playCount];
  [(MZUniversalPlaybackPositionMetadata *)self timestamp];
  v10 = sub_100099624(v9);
  unsigned int v11 = [(MZUniversalPlaybackPositionMetadata *)self isNew];
  [(MZUniversalPlaybackPositionMetadata *)self lastUserMarkedAsPlayedDate];
  v13 = sub_100099624(v12);
  [(MZUniversalPlaybackPositionMetadata *)self lastDatePlayed];
  v15 = sub_100099624(v14);
  v16 = +[NSString stringWithFormat:@"%@: id=%@, bktm=%@, hbpl=%d, plct=%lu, timestamp=%@, isNew=%d, lastUserMarkedAsPlayedDate=%@, lastDatePlayed=%@, playStateManuallySet=%d", v3, v4, v6, v7, v8, v10, v11, v13, v15, [(MZUniversalPlaybackPositionMetadata *)self playStateManuallySet]];

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MZUniversalPlaybackPositionMetadata);
  double v5 = [(MZUniversalPlaybackPositionMetadata *)self itemIdentifier];
  [(MZUniversalPlaybackPositionMetadata *)v4 setItemIdentifier:v5];

  [(MZUniversalPlaybackPositionMetadata *)self timestamp];
  -[MZUniversalPlaybackPositionMetadata setTimestamp:](v4, "setTimestamp:");
  [(MZUniversalPlaybackPositionMetadata *)self bookmarkTime];
  -[MZUniversalPlaybackPositionMetadata setBookmarkTime:](v4, "setBookmarkTime:");
  [(MZUniversalPlaybackPositionMetadata *)v4 setHasBeenPlayed:[(MZUniversalPlaybackPositionMetadata *)self hasBeenPlayed]];
  [(MZUniversalPlaybackPositionMetadata *)v4 setPlayCount:[(MZUniversalPlaybackPositionMetadata *)self playCount]];
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NSString *)self->_itemIdentifier hash] ^ self->_hasBeenPlayed ^ self->_playCount;
  v4 = +[NSNumber numberWithDouble:self->_bookmarkTime];
  unint64_t v5 = v3 ^ (unint64_t)[v4 hash];
  v6 = +[NSNumber numberWithDouble:self->_timestamp];
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = (double *)v4;
    BOOL v6 = [(NSString *)self->_itemIdentifier isEqual:*((void *)v5 + 2)]
      && self->_timestamp == v5[3]
      && self->_bookmarkTime == v5[4]
      && self->_hasBeenPlayed == *((unsigned __int8 *)v5 + 8)
      && self->_playCount == *((void *)v5 + 5);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)keyValueStoreItemIdentifierForItem:(id)a3
{
  id v3 = a3;
  id v4 = +[NSArray arrayWithObjects:@"storeItemAdamID", @"mediaEntityType", 0];
  unint64_t v5 = sub_100099BD4(v3, v4);
  BOOL v6 = [v5 objectForKey:@"mediaEntityType"];
  id v7 = [v6 integerValue];

  unint64_t v8 = [v5 objectForKey:@"storeItemAdamID"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v10 = [v5 objectForKey:@"storeItemAdamID"];
  unsigned int v11 = v10;
  if (isKindOfClass) {
    id v12 = [v10 longLongValue];
  }
  else {
    id v12 = [v10 unsignedLongLongValue];
  }
  id v13 = v12;

  if (v13) {
    BOOL v14 = v7 == (id)3;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14 && v7 != (id)4)
  {
    v19 = +[NSString stringWithFormat:@"%llu", v13];
    goto LABEL_17;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100099CD8;
  v23[3] = &unk_10054F378;
  id v24 = v3;
  v16 = objc_retainBlock(v23);
  v17 = +[NSArray arrayWithObjects:@"podcastURL", @"podcastGUID", 0];

  uint64_t v18 = ((void (*)(void *, void *))v16[2])(v16, v17);
  if (v18) {
    goto LABEL_13;
  }
  v20 = +[NSArray arrayWithObjects:@"artist", @"albumTitle", 0];

  uint64_t v21 = ((void (*)(void *, void *))v16[2])(v16, v20);
  if (v21)
  {
LABEL_15:
    v19 = (void *)v21;
    v17 = v20;
    goto LABEL_16;
  }
  v17 = +[NSArray arrayWithObjects:@"title", @"albumTitle", 0];

  uint64_t v18 = ((void (*)(void *, void *))v16[2])(v16, v17);
  if (!v18)
  {
    v20 = +[NSArray arrayWithObjects:@"title", @"artist", 0];

    uint64_t v21 = ((void (*)(void *, void *))v16[2])(v16, v20);
    if (v21) {
      goto LABEL_15;
    }
    v17 = +[NSArray arrayWithObjects:@"title", 0];

    uint64_t v18 = ((void (*)(void *, void *))v16[2])(v16, v17);
  }
LABEL_13:
  v19 = (void *)v18;
LABEL_16:

  id v4 = v17;
LABEL_17:

  return v19;
}

+ (id)metadataWithValuesFromDataSourceItem:(id)a3
{
  id v30 = a3;
  id v28 = objc_alloc((Class)NSMutableDictionary);
  v27 = +[NSNumber numberWithDouble:0.0];
  v29 = +[NSDate distantPast];
  [v29 timeIntervalSinceReferenceDate];
  v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v25 = +[NSNumber numberWithBool:0];
  v23 = +[NSNumber numberWithInteger:0];
  id v3 = +[NSNumber numberWithBool:0];
  id v24 = +[NSDate distantPast];
  [v24 timeIntervalSinceReferenceDate];
  id v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  unint64_t v5 = +[NSDate distantPast];
  [v5 timeIntervalSinceReferenceDate];
  BOOL v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v7 = +[NSNumber numberWithBool:0];
  id v8 = [v28 initWithObjectsAndKeys:v27, @"bookmarkTime", v26, @"bookmarkMetadataTimestamp", v25, @"hasBeenPalyed", v23, @"playCount", v3, @"isNew", v4, @"lastUserMarkedAsPlayedDate", v6, @"lastDatePlayed", v7, @"playStateManuallySet", 0];

  double v9 = [v8 allKeys];
  v10 = +[NSSet setWithArray:v9];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10009A378;
  v31[3] = &unk_10054F3A0;
  id v32 = v8;
  id v11 = v8;
  [v30 enumerateValuesForProperties:v10 usingBlock:v31];

  id v12 = objc_alloc_init(MZUniversalPlaybackPositionMetadata);
  id v13 = +[MZUniversalPlaybackPositionMetadata keyValueStoreItemIdentifierForItem:v30];

  [(MZUniversalPlaybackPositionMetadata *)v12 setItemIdentifier:v13];
  BOOL v14 = [v11 valueForKey:@"bookmarkMetadataTimestamp"];
  [v14 doubleValue];
  -[MZUniversalPlaybackPositionMetadata setTimestamp:](v12, "setTimestamp:");

  v15 = [v11 valueForKey:@"bookmarkTime"];
  [v15 doubleValue];
  -[MZUniversalPlaybackPositionMetadata setBookmarkTime:](v12, "setBookmarkTime:");

  v16 = [v11 valueForKey:@"hasBeenPalyed"];
  -[MZUniversalPlaybackPositionMetadata setHasBeenPlayed:](v12, "setHasBeenPlayed:", [v16 BOOLValue]);

  v17 = [v11 valueForKey:@"playCount"];
  -[MZUniversalPlaybackPositionMetadata setPlayCount:](v12, "setPlayCount:", [v17 integerValue]);

  uint64_t v18 = [v11 valueForKey:@"isNew"];
  -[MZUniversalPlaybackPositionMetadata setIsNew:](v12, "setIsNew:", [v18 BOOLValue]);

  v19 = [v11 valueForKey:@"lastUserMarkedAsPlayedDate"];
  [v19 doubleValue];
  -[MZUniversalPlaybackPositionMetadata setLastUserMarkedAsPlayedDate:](v12, "setLastUserMarkedAsPlayedDate:");

  v20 = [v11 valueForKey:@"lastDatePlayed"];
  [v20 doubleValue];
  -[MZUniversalPlaybackPositionMetadata setLastDatePlayed:](v12, "setLastDatePlayed:");

  uint64_t v21 = [v11 valueForKey:@"playStateManuallySet"];
  -[MZUniversalPlaybackPositionMetadata setPlayStateManuallySet:](v12, "setPlayStateManuallySet:", [v21 BOOLValue]);

  return v12;
}

+ (id)metadataWithValuesItemIdentifier:(id)a3 keyValueStorePayload:(id)a4
{
  id v6 = a3;
  CFDataRef v7 = (const __CFData *)a4;
  id v8 = (void *)CFPropertyListCreateWithData(0, v7, 0, 0, 0);
  if (!v8)
  {
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v32[2] = objc_opt_class();
    v32[3] = objc_opt_class();
    v32[4] = objc_opt_class();
    v32[5] = objc_opt_class();
    v32[6] = objc_opt_class();
    id v4 = +[NSArray arrayWithObjects:v32 count:7];
    double v9 = +[NSSet setWithArray:v4];

    uint64_t v31 = 0;
    id v8 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v9 fromData:v7 error:&v31];

    if (!v8) {
      goto LABEL_10;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_10;
  }
  v10 = [v8 objectForKey:@"pver"];
  if (!v10
    || ([v8 objectForKey:@"pver"],
        id v4 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v13 = [v8 objectForKey:@"pver"];
    id v12 = [v13 integerValue];

    if (!v10) {
      goto LABEL_9;
    }
  }
  else
  {
    id v11 = [v8 objectForKey:@"pver"];
    id v12 = [v11 integerValue];
  }
LABEL_9:

  if (v12)
  {
LABEL_10:
    BOOL v14 = 0;
    goto LABEL_11;
  }
  BOOL v14 = objc_alloc_init(MZUniversalPlaybackPositionMetadata);
  [(MZUniversalPlaybackPositionMetadata *)v14 setItemIdentifier:v6];
  v16 = [v8 objectForKey:@"bktm"];
  if (!v16
    || ([v8 objectForKey:@"bktm"],
        id v12 = (id)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v18 = [v8 objectForKey:@"bktm"];
    [v18 doubleValue];
    -[MZUniversalPlaybackPositionMetadata setBookmarkTime:](v14, "setBookmarkTime:");

    if (!v16) {
      goto LABEL_19;
    }
  }
  else
  {
    v17 = [v8 objectForKey:@"bktm"];
    [v17 doubleValue];
    -[MZUniversalPlaybackPositionMetadata setBookmarkTime:](v14, "setBookmarkTime:");
  }
LABEL_19:

  v19 = [v8 objectForKey:@"hbpl"];

  uint64_t v20 = v19 == 0;
  uint64_t v21 = [v8 objectForKey:@"hbpl"];
  v22 = v21;
  if ((v20 & 1) == 0)
  {
    if (!v21) {
      goto LABEL_27;
    }
    uint64_t v20 = [v8 objectForKey:@"hbpl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }

  if (v22)
  {
    v22 = [v8 objectForKey:@"hbpl"];
    if (!v22
      || ([v8 objectForKey:@"hbpl"],
          uint64_t v20 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          (objc_opt_isKindOfClass() & 1) != 0))
    {
LABEL_27:
      id v24 = [v8 objectForKey:@"hbpl"];
      -[MZUniversalPlaybackPositionMetadata setHasBeenPlayed:](v14, "setHasBeenPlayed:", [v24 BOOLValue]);

      if (!v22)
      {
LABEL_29:

        goto LABEL_30;
      }
LABEL_28:

      goto LABEL_29;
    }
LABEL_26:
    v23 = [v8 objectForKey:@"hbpl"];
    -[MZUniversalPlaybackPositionMetadata setHasBeenPlayed:](v14, "setHasBeenPlayed:", [v23 BOOLValue]);

    goto LABEL_28;
  }
LABEL_30:
  v25 = [v8 objectForKey:@"plct"];
  if (v25)
  {
    uint64_t v20 = [v8 objectForKey:@"plct"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = [v8 objectForKey:@"plct"];
      -[MZUniversalPlaybackPositionMetadata setPlayCount:](v14, "setPlayCount:", [v26 integerValue]);

LABEL_34:
      goto LABEL_35;
    }
  }
  v27 = [v8 objectForKey:@"plct"];
  -[MZUniversalPlaybackPositionMetadata setPlayCount:](v14, "setPlayCount:", [v27 integerValue]);

  if (v25) {
    goto LABEL_34;
  }
LABEL_35:

  id v28 = [v8 objectForKey:@"tstm"];
  if (v28)
  {
    uint64_t v20 = [v8 objectForKey:@"tstm"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v29 = [v8 objectForKey:@"tstm"];
      [v29 doubleValue];
      -[MZUniversalPlaybackPositionMetadata setTimestamp:](v14, "setTimestamp:");

LABEL_39:
      goto LABEL_40;
    }
  }
  id v30 = [v8 objectForKey:@"tstm"];
  [v30 doubleValue];
  -[MZUniversalPlaybackPositionMetadata setTimestamp:](v14, "setTimestamp:");

  if (v28) {
    goto LABEL_39;
  }
LABEL_40:

LABEL_11:

  return v14;
}

- (id)keyValueStorePayload
{
  [(MZUniversalPlaybackPositionMetadata *)self bookmarkTime];
  id v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v4 = +[NSNumber numberWithBool:[(MZUniversalPlaybackPositionMetadata *)self hasBeenPlayed]];
  unint64_t v5 = +[NSNumber numberWithInteger:[(MZUniversalPlaybackPositionMetadata *)self playCount]];
  [(MZUniversalPlaybackPositionMetadata *)self timestamp];
  id v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  CFDataRef v7 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, v4, v5, v6, 0);
  id v8 = +[NSArray arrayWithObjects:@"bktm", @"hbpl", @"plct", @"tstm", 0];
  double v9 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v8];

  CFDataRef Data = CFPropertyListCreateData(0, v9, kCFPropertyListBinaryFormat_v1_0, 0, 0);

  return Data;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)bookmarkTime
{
  return self->_bookmarkTime;
}

- (void)setBookmarkTime:(double)a3
{
  self->_bookmarkTime = a3;
}

- (BOOL)hasBeenPlayed
{
  return self->_hasBeenPlayed;
}

- (void)setHasBeenPlayed:(BOOL)a3
{
  self->_hasBeenPlayed = a3;
}

- (unint64_t)playCount
{
  return self->_playCount;
}

- (void)setPlayCount:(unint64_t)a3
{
  self->_playCount = a3;
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (void)setIsNew:(BOOL)a3
{
  self->_isNew = a3;
}

- (double)lastUserMarkedAsPlayedDate
{
  return self->_lastUserMarkedAsPlayedDate;
}

- (void)setLastUserMarkedAsPlayedDate:(double)a3
{
  self->_lastUserMarkedAsPlayedDate = a3;
}

- (double)lastDatePlayed
{
  return self->_lastDatePlayed;
}

- (void)setLastDatePlayed:(double)a3
{
  self->_lastDatePlayed = a3;
}

- (BOOL)playStateManuallySet
{
  return self->_playStateManuallySet;
}

- (void)setPlayStateManuallySet:(BOOL)a3
{
  self->_playStateManuallySet = a3;
}

- (void).cxx_destruct
{
}

@end